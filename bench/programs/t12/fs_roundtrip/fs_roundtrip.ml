(* 与 fs_roundtrip.vuna 同算法：路径取 TMPDIR 或 /tmp，每轮写固定内容、读回、删除，
   累加读回长度；输出与 N 成正比。 *)
let content = "vuna-bench-fs-roundtrip"

let rec rounds n path acc =
  if n = 0 then acc
  else (
    let oc = open_out_bin path in
    output_string oc content;
    close_out oc;
    let ic = open_in_bin path in
    let back = really_input_string ic (in_channel_length ic) in
    close_in ic;
    Sys.remove path;
    rounds (n - 1) path (acc + String.length back))

let () =
  let base =
    match Sys.getenv_opt "TMPDIR" with Some d when d <> "" -> d | _ -> "/tmp"
  in
  print_int (rounds 2000 (base ^ "/vuna-bench-fs-roundtrip.tmp") 0)