let () =
  let c = Gc.get () in
  Gc.set { c with minor_heap_size = 16 * 1024 * 1024; space_overhead = 200 }
let bi_add a b = a + b
let bi_sub a b = a - b
let bi_mul a b = a * b
let bi_div a b = if b = 0 then failwith "division by zero" else a / b
let bi_eq_int (a : int) (b : int) = a = b
let bi_neq_int (a : int) (b : int) = a <> b
let bi_eq_str (a : string) (b : string) = a = b
let bi_neq_str (a : string) (b : string) = a <> b
let bi_eq_generic (a : 'a) (b : 'a) = a = b
let bi_neq_generic (a : 'a) (b : 'a) = a <> b
let bi_strFromInt (n : int) = string_of_int n
let bi_strLength (s : string) = String.length s
let bi_strUnpack (s : string) = List.init (String.length s) (fun i -> Char.code s.[i])
let bi_strPack (cs : int list) = String.init (List.length cs) (fun i -> Char.chr (List.nth cs i))
let bi_lt_int (a : int) (b : int) = a < b
let bi_le_int (a : int) (b : int) = a <= b
let bi_gt_int (a : int) (b : int) = a > b
let bi_ge_int (a : int) (b : int) = a >= b
let bi_lt_generic (a : 'a) (b : 'a) = compare a b < 0
let bi_le_generic (a : 'a) (b : 'a) = compare a b <= 0
let bi_gt_generic (a : 'a) (b : 'a) = compare a b > 0
let bi_ge_generic (a : 'a) (b : 'a) = compare a b >= 0
let bi_concat a b = a ^ b
let bi_and a b = a && b
let bi_or a b = a || b
let dt_show_bool b = if b then "True" else "False"
let dt_show_string s =
  let buf = Buffer.create 16 in
  Buffer.add_char buf (Char.chr 34);
  String.iter (fun c ->
    let n = Char.code c in
    if n = 34 then Buffer.add_string buf (String.make 1 (Char.chr 92) ^ String.make 1 (Char.chr 34))
    else if n = 92 then Buffer.add_string buf (String.make 1 (Char.chr 92) ^ String.make 1 (Char.chr 92))
    else if n = 10 then Buffer.add_string buf (String.make 1 (Char.chr 92) ^ "n")
    else if n = 9 then Buffer.add_string buf (String.make 1 (Char.chr 92) ^ "t")
    else if n = 13 then Buffer.add_string buf (String.make 1 (Char.chr 92) ^ "r")
    else Buffer.add_char buf c) s;
  Buffer.add_char buf (Char.chr 34);
  Buffer.contents buf
let dtp_print s = print_string s; flush stdout; String.length s
let dtp_readFile path =
  try
    let ch = open_in_bin path in
    Fun.protect ~finally:(fun () -> close_in_noerr ch)
      (fun () -> really_input_string ch (in_channel_length ch))
  with Sys_error msg -> failwith ("readFile: " ^ msg)
let dtp_writeFile path contents =
  try
    let ch = open_out_bin path in
    Fun.protect ~finally:(fun () -> close_out_noerr ch)
      (fun () -> output_string ch contents);
    String.length contents
  with Sys_error msg -> failwith ("writeFile: " ^ msg)
let dtp_getArgs () =
  let argv = Sys.argv in
  let n = Array.length argv in
  if n <= 1 then [] else Array.to_list (Array.sub argv 1 (n - 1))
let dtp_readLine () = try input_line stdin with End_of_file -> ""
let dtp_readDir path =
  try List.sort compare (Array.to_list (Sys.readdir path))
  with Sys_error msg -> failwith ("readDir: " ^ msg)
let dtp_isDirectory path =
  try Sys.is_directory path with Sys_error msg -> failwith ("isDirectory: " ^ msg)
let dtp_makeDir path =
  try (if Sys.file_exists path then 0 else (Sys.mkdir path 0o755; 0))
  with Sys_error msg -> failwith ("makeDir: " ^ msg)
let dtp_removeFile path =
  try (if Sys.file_exists path then (Sys.remove path; 0) else 0)
  with Sys_error msg -> failwith ("removeFile: " ^ msg)
let dtp_fileExists path = Sys.file_exists path
let dtp_fileMtime path =
  try int_of_float (Unix.stat path).Unix.st_mtime with _ -> 0
let dtp_fileSize path =
  try (Unix.stat path).Unix.st_size with _ -> 0
let dtp_timeUs () = int_of_float (Unix.gettimeofday () *. 1000000.0)
let dtp_strHash (s : string) =
  let h = ref 0 in
  String.iter (fun c -> h := ((!h * 33) + Char.code c) land 1023) s;
  !h
let dtp_strAt (s : string) (i : int) = if i < 0 || i >= String.length s then -1 else Char.code s.[i]
let dtp_exit n = exit n
let dtp_runIn dir args =
  let quote s = Filename.quote s in
  let cmd = String.concat " " (List.map quote args) in
  let old = Sys.getcwd () in
  Fun.protect ~finally:(fun () -> Sys.chdir old) (fun () -> Sys.chdir dir; Sys.command cmd)
