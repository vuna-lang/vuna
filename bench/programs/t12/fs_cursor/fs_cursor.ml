(* 与 fs_cursor.vuna 同算法：写 64 KiB 确定内容，再按 4 KiB 块读 100 遍并累加字节和。 *)
let alphabet = "0123456789abcdef"

let content =
  let b = Bytes.create 65536 in
  for i = 0 to 65535 do
    Bytes.set b i alphabet.[i mod 16]
  done;
  Bytes.to_string b

let byte_sum s acc =
  let n = String.length s in
  let rec go i acc = if i >= n then acc else go (i + 1) (acc + Char.code s.[i]) in
  go 0 acc

let pass path acc =
  let ic = open_in_bin path in
  let buf = Bytes.create 4096 in
  let rec go acc =
    let n = input ic buf 0 4096 in
    if n = 0 then acc else go (byte_sum (Bytes.sub_string buf 0 n) acc)
  in
  let total = go acc in
  close_in ic;
  total

let rec passes n path acc =
  if n = 0 then acc else passes (n - 1) path (pass path acc)

let () =
  let base =
    match Sys.getenv_opt "TMPDIR" with Some d when d <> "" -> d | _ -> "/tmp"
  in
  let path = base ^ "/vuna-bench-fs-cursor.tmp" in
  let oc = open_out_bin path in
  output_string oc content;
  close_out oc;
  let total = passes 100 path 0 in
  Sys.remove path;
  print_int total