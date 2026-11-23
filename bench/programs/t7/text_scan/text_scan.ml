(* 手写 OCaml 对照：与 text_scan.vuna 同算法（逐字节扫描 + 累积）。 *)
let rec scan fuel s i n acc =
  if fuel <= 0 then acc
  else if i >= n then acc
  else
    let next = (acc * 31) + Char.code s.[i] in
    scan (fuel - 1) s (i + 1) n (next - next / 1000003 * 1000003)

let () =
  let s = String.concat "" (List.init 16000 (fun _ -> "0123456789")) in
  print_endline (string_of_int (scan (String.length s) s 0 (String.length s) 0))