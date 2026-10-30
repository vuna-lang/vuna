
let vuna_fail file line col msg =
  if line = 0 then failwith msg
  else failwith (file ^ ":" ^ string_of_int line ^ ":" ^ string_of_int col ^ ": " ^ msg)
let bi_add a b = a + b
let bi_sub a b = a - b
let bi_mul a b = a * b
let bi_div a b = if b = 0 then failwith "division by zero" else a / b
let bi_eq a b = a = b
let bi_neq a b = a <> b
let bi_lt a b = a < b
let bi_le a b = a <= b
let bi_gt a b = a > b
let bi_ge a b = a >= b
let bi_eq_int (a : int) (b : int) = a = b
let bi_neq_int (a : int) (b : int) = a <> b
let bi_lt_int (a : int) (b : int) = a < b
let bi_le_int (a : int) (b : int) = a <= b
let bi_gt_int (a : int) (b : int) = a > b
let bi_ge_int (a : int) (b : int) = a >= b
let bi_eq_str (a : string) (b : string) = a = b
let bi_neq_str (a : string) (b : string) = a <> b
let bi_eq_bool (a : bool) (b : bool) = a = b
let bi_neq_bool (a : bool) (b : bool) = a <> b
let bi_and a b = a && b
let bi_or a b = a || b
let bi_concat a b = a ^ b
let bi_str_length a = String.length a
let bi_str_unpack s =
  let rec go i acc =
    if i < 0 then acc
    else go (i - 1) (Char.code s.[i] :: acc)
  in
  go (String.length s - 1) []
let bi_str_pack cs =
  let buf = Buffer.create 16 in
  let rec go = function
    | [] -> ()
    | c :: rest -> Buffer.add_char buf (Char.chr c); go rest
  in
  go cs;
  Buffer.contents buf
let bi_str_from_int n = string_of_int n
let bi_read_file path =
  try
    let ch = open_in_bin path in
    Fun.protect ~finally:(fun () -> close_in_noerr ch)
      (fun () -> really_input_string ch (in_channel_length ch))
  with Sys_error msg -> failwith ("readFile: " ^ msg)
let bi_write_file path contents =
  try
    let ch = open_out_bin path in
    Fun.protect ~finally:(fun () -> close_out_noerr ch)
      (fun () -> output_string ch contents);
    String.length contents
  with Sys_error msg -> failwith ("writeFile: " ^ msg)
let bi_print s = print_string s; flush stdout; String.length s
let bi_file_exists path = Sys.file_exists path
let bi_exit n = exit n
let bi_get_args () =
  let argv = Sys.argv in
  let n = Array.length argv in
  if n <= 1 then [] else Array.to_list (Array.sub argv 1 (n - 1))
let bi_read_line () = try input_line stdin with End_of_file -> ""
let bi_read_dir path =
  try List.sort compare (Array.to_list (Sys.readdir path))
  with Sys_error msg -> failwith ("readDir: " ^ msg)
let bi_is_directory path =
  try Sys.is_directory path with Sys_error msg -> failwith ("isDirectory: " ^ msg)
let bi_make_dir path =
  try (if Sys.file_exists path then 0 else (Sys.mkdir path 0o755; 0))
  with Sys_error msg -> failwith ("makeDir: " ^ msg)
let bi_remove_file path =
  try (if Sys.file_exists path then (Sys.remove path; 0) else 0)
  with Sys_error msg -> failwith ("removeFile: " ^ msg)
let show_ctor name args = if args = [] then name else "(" ^ name ^ " " ^ String.concat " " args ^ ")"
let show_vbool b = if b then "True" else "False"
let show_vstring s =
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
let bi_show_string s = show_vstring s
let bi_eq_generic (a : 'a) (b : 'a) = a = b
let bi_neq_generic (a : 'a) (b : 'a) = a <> b
let bi_lt_generic (a : 'a) (b : 'a) = compare a b < 0
let bi_le_generic (a : 'a) (b : 'a) = compare a b <= 0
let bi_gt_generic (a : 'a) (b : 'a) = compare a b > 0
let bi_ge_generic (a : 'a) (b : 'a) = compare a b >= 0
let rec show_vlist (show_elem : 'a -> string) (v : 'a list) : string =
  match v with
  | [] -> "Nil"
  | x :: xs -> "(Cons " ^ show_elem x ^ " " ^ show_vlist show_elem xs ^ ")"

let v_vuna_ushow_uint = fun n -> bi_str_from_int n

let v_vuna_ushow_ubool = fun b -> if b then "True" else "False"

let v_vuna_ushow_ustring = fun s -> bi_show_string s

let v_vuna_ueq_uint = fun a b -> bi_eq_int a b

let v_vuna_uneq_uint = fun a b -> bi_neq_int a b

let v_vuna_ueq_ubool = fun a b -> bi_eq_bool a b

let v_vuna_uneq_ubool = fun a b -> bi_neq_bool a b

let v_vuna_ueq_ustr = fun a b -> bi_eq_str a b

let v_vuna_uneq_ustr = fun a b -> bi_neq_str a b

let v_vuna_ult_uint = fun a b -> bi_lt_int a b

let v_vuna_ule_uint = fun a b -> bi_le_int a b

let v_vuna_ugt_uint = fun a b -> bi_gt_int a b

let v_vuna_uge_uint = fun a b -> bi_ge_int a b

let v_vuna_ueq_ugeneric = fun a b -> bi_eq_generic a b

let v_vuna_uneq_ugeneric = fun a b -> bi_neq_generic a b

let v_vuna_ult_ugeneric = fun a b -> bi_lt_generic a b

let v_vuna_ule_ugeneric = fun a b -> bi_le_generic a b

let v_vuna_ugt_ugeneric = fun a b -> bi_gt_generic a b

let v_vuna_uge_ugeneric = fun a b -> bi_ge_generic a b
