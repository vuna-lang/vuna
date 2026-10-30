type pos = { line : int; col : int }

type t =
  | Ident of string
  | Kw of string
  | Int of int
  | Str of string
  | Sym of string
  | Eof

type located = { tok : t; pos : pos }

let pos_to_string { line; col } = Printf.sprintf "%d:%d" line col

let to_string = function
  | Ident s -> Printf.sprintf "identifier %S" s
  | Kw s -> Printf.sprintf "keyword %S" s
  | Int n -> Printf.sprintf "integer %d" n
  | Str s -> Printf.sprintf "string %S" s
  | Sym s -> Printf.sprintf "%S" s
  | Eof -> "end of input"
