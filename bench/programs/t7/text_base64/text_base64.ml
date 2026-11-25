(* 手写 OCaml 对照：与 text_base64.vuna 同算法（手写 Base64 编解码 + 校验和）。 *)
let alpha = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/"

let encode bs =
  let buf = Buffer.create 8 in
  let out n = Buffer.add_char buf alpha.[n] in
  let rec go = function
    | [] -> ()
    | [ x ] ->
        out (x lsr 2);
        out ((x land 3) lsl 4);
        Buffer.add_string buf "=="
    | [ x; y ] ->
        out (x lsr 2);
        out (((x land 3) lsl 4) lor (y lsr 4));
        out ((y land 15) lsl 2);
        Buffer.add_string buf "="
    | x :: y :: z :: rest ->
        out (x lsr 2);
        out (((x land 3) lsl 4) lor (y lsr 4));
        out (((y land 15) lsl 2) lor (z lsr 6));
        out (z land 63);
        go rest
  in
  go bs;
  Buffer.contents buf

let digit c =
  if c >= 'A' && c <= 'Z' then Char.code c - 65
  else if c >= 'a' && c <= 'z' then Char.code c - 71
  else if c >= '0' && c <= '9' then Char.code c + 4
  else if c = '+' then 62
  else 63

let decode s =
  let n = String.length s in
  let pads = if s.[n - 1] = '=' then if s.[n - 2] = '=' then 2 else 1 else 0 in
  let bytes = Array.make ((n / 4) * 3) 0 in
  for g = 0 to (n / 4) - 1 do
    let d j = if s.[(g * 4) + j] = '=' then 0 else digit s.[(g * 4) + j] in
    let a = d 0 and b = d 1 and c = d 2 and e = d 3 in
    bytes.((g * 3)) <- (a lsl 2) lor (b lsr 4);
    bytes.((g * 3) + 1) <- ((b land 15) lsl 4) lor (c lsr 2);
    bytes.((g * 3) + 2) <- ((c land 3) lsl 6) lor e
  done;
  Array.to_list (Array.sub bytes 0 (Array.length bytes - pads))

let step i = List.fold_left (fun acc b -> (acc * 31) + b) 0 (decode (encode [ i mod 256; (i * 7) mod 256; (i * 13) mod 256 ])) + 4

let rec loop j acc = if j <= 0 then acc else loop (j - 1) (acc + step j)

let () = print_endline (string_of_int (loop 20000 0))