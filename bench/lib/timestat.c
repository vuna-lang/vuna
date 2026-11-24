/* timestat：一次运行同时给出墙钟 / CPU / 峰值 RSS（bench 的运行时三指标口径）。
 *
 * 为什么不用现成工具：GNU time 的 %U/%S 只有 10ms 量化、bash 内建 time 是 1ms 量化，
 * 而 bench 里有 5ms 量级的项；wait4 的 rusage 是微秒级，且 ru_maxrss 与 %M 同源同单位
 * （KB），只算子进程，不会把 wrapper 的 fork/exec 算进 RSS。
 *
 * 用法：
 *   timestat --timeout-ms N [--repeat K] [--log PATH] [--env K=V]... -- prog [args...]
 *
 * 输出（stdout 单行，重复 K 次求和 / 取最大）：
 *   wall_us user_us sys_us maxrss_kb exit_code
 *
 * 超时返回 124（与 coreutils timeout 一致）；exec 失败返回 127。
 * 子进程 stdout 丢弃、stderr 写 --log（默认丢弃），用于收集 VN_PERF / gc 诊断行。
 */
#define _GNU_SOURCE

#include <errno.h>
#include <signal.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/resource.h>
#include <sys/types.h>
#include <sys/wait.h>
#include <time.h>
#include <unistd.h>

#define MAX_ENVS 32
#define KILL_GRACE_US 2000000

static int64_t now_us(void) {
  struct timespec ts;
  clock_gettime(CLOCK_MONOTONIC, &ts);
  return (int64_t)ts.tv_sec * 1000000 + ts.tv_nsec / 1000;
}

static void usage(void) {
  fputs("usage: timestat --timeout-ms N [--repeat K] [--log PATH] [--env K=V]... -- prog [args...]\n",
        stderr);
}

struct sample {
  int64_t wall_us;
  int64_t user_us;
  int64_t sys_us;
  long maxrss_kb;
  int rc;
};

static int run_once(char **prog, char **envs, int nenvs, const char *log_path, long timeout_ms,
                    struct sample *out) {
  sigset_t chld, orig;
  sigemptyset(&chld);
  sigaddset(&chld, SIGCHLD);
  sigprocmask(SIG_BLOCK, &chld, &orig);

  int64_t t0 = now_us();
  pid_t pid = fork();
  if (pid < 0) {
    perror("timestat: fork");
    sigprocmask(SIG_SETMASK, &orig, NULL);
    return -1;
  }
  if (pid == 0) {
    setpgid(0, 0);
    int i;
    for (i = 0; i < nenvs; i++) {
      char *eq = strchr(envs[i], '=');
      if (eq == NULL) _exit(126);
      *eq = '\0';
      setenv(envs[i], eq + 1, 1);
    }
    if (log_path != NULL) {
      FILE *f = freopen(log_path, "w", stderr);
      if (f == NULL) _exit(126);
    }
    FILE *devnull = freopen("/dev/null", "w", stdout);
    if (devnull == NULL) _exit(126);
    execvp(prog[0], prog);
    if (log_path != NULL) {
      fprintf(stderr, "timestat: exec failed: %s: %s\n", prog[0], strerror(errno));
    }
    _exit(127);
  }
  setpgid(pid, pid);

  int status = 0;
  struct rusage ru;
  memset(&ru, 0, sizeof ru);
  int timed_out = 0;
  int64_t deadline = timeout_ms > 0 ? t0 + (int64_t)timeout_ms * 1000 : 0;

  for (;;) {
    pid_t w = wait4(pid, &status, WNOHANG, &ru);
    if (w == pid) break;
    if (w < 0 && errno != EINTR) {
      perror("timestat: wait4");
      sigprocmask(SIG_SETMASK, &orig, NULL);
      return -1;
    }
    int64_t t = now_us();
    if (deadline != 0 && t >= deadline) {
      if (!timed_out) {
        timed_out = 1;
        kill(-pid, SIGTERM);
      } else if (t >= deadline + KILL_GRACE_US) {
        kill(-pid, SIGKILL);
      }
    }
    struct timespec ts = {0, 20 * 1000000};
    if (deadline != 0) {
      int64_t end = deadline + (timed_out ? KILL_GRACE_US : 0);
      int64_t rem = end - t;
      if (rem < 1000) rem = 1000;
      if (rem < 20000) {
        ts.tv_sec = 0;
        ts.tv_nsec = (long)(rem * 1000);
      }
    }
    sigtimedwait(&chld, NULL, &ts);
  }
  int64_t t1 = now_us();
  sigprocmask(SIG_SETMASK, &orig, NULL);
  /* 子进程退出时产生的 SIGCHLD 可能还挂在 pending 上，清掉避免下一轮立即返回。 */
  struct timespec zero = {0, 0};
  while (sigtimedwait(&chld, NULL, &zero) == SIGCHLD) {
  }

  out->wall_us = t1 - t0;
  out->user_us = (int64_t)ru.ru_utime.tv_sec * 1000000 + ru.ru_utime.tv_usec;
  out->sys_us = (int64_t)ru.ru_stime.tv_sec * 1000000 + ru.ru_stime.tv_usec;
  out->maxrss_kb = ru.ru_maxrss;
  if (timed_out) {
    out->rc = 124;
  } else if (WIFEXITED(status)) {
    out->rc = WEXITSTATUS(status);
  } else if (WIFSIGNALED(status)) {
    out->rc = 128 + WTERMSIG(status);
  } else {
    out->rc = 1;
  }
  return 0;
}

int main(int argc, char **argv) {
  long timeout_ms = 0;
  long repeat = 1;
  const char *log_path = NULL;
  char *envs[MAX_ENVS];
  int nenvs = 0;
  int i;

  for (i = 1; i < argc; i++) {
    if (strcmp(argv[i], "--") == 0) {
      i++;
      break;
    } else if (strcmp(argv[i], "--timeout-ms") == 0 && i + 1 < argc) {
      timeout_ms = strtol(argv[++i], NULL, 10);
    } else if (strcmp(argv[i], "--repeat") == 0 && i + 1 < argc) {
      repeat = strtol(argv[++i], NULL, 10);
    } else if (strcmp(argv[i], "--log") == 0 && i + 1 < argc) {
      log_path = argv[++i];
    } else if (strcmp(argv[i], "--env") == 0 && i + 1 < argc) {
      if (nenvs >= MAX_ENVS) {
        fputs("timestat: too many --env\n", stderr);
        return 2;
      }
      envs[nenvs++] = argv[++i];
    } else {
      fprintf(stderr, "timestat: unknown argument: %s\n", argv[i]);
      usage();
      return 2;
    }
  }
  if (i >= argc) {
    usage();
    return 2;
  }
  if (repeat < 1) repeat = 1;

  int64_t wall = 0, user = 0, sys = 0;
  long maxrss = 0;
  int rc = 0;
  long k;
  for (k = 0; k < repeat; k++) {
    struct sample s;
    if (run_once(&argv[i], envs, nenvs, log_path, timeout_ms, &s) != 0) return 2;
    wall += s.wall_us;
    user += s.user_us;
    sys += s.sys_us;
    if (s.maxrss_kb > maxrss) maxrss = s.maxrss_kb;
    rc = s.rc;
    if (rc != 0) break;
  }
  printf("%lld %lld %lld %ld %d\n", (long long)wall, (long long)user, (long long)sys, maxrss, rc);
  return rc;
}