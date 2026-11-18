#!/bin/sh
# 名字身份守卫：Elab/ 与 Loader/ 不得按包名 / 模块名前缀判别名字身份。
#
# 解析后的名字身份统一由 Frontend.Rast.classifyName 给出；「当前模块是否属于
# Base/Vuna 包」也只由 Frontend.Rast.isCompilerModulePrefix 判断。Elab/Loader
# 里再写 `startsWith "Base."` 之类会把名字编码泄漏到语义层。
set -eu
root=$(CDPATH= cd -- "$(dirname -- "$0")/../../.." && pwd)
if [ ! -d "$root/packages/compiler/lib" ]; then root=$(pwd); fi

bad=$(grep -rnE 'startsWith "(Base|Vuna)(\.|_d)' --include='*.vuna' \
  "$root/packages/compiler/lib/Vuna/Compiler/Elab" \
  "$root/packages/compiler/lib/Vuna/Compiler/Loader" 2>/dev/null || true)
if [ -n "$bad" ]; then
  echo "name-prefixes: 名字身份必须经 Frontend.Rast，不得在 Elab/Loader 里按包名前缀判别：" >&2
  printf '%s\n' "$bad" >&2
  exit 1
fi
