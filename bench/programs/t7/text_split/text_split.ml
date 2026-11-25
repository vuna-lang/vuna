(* 手写 OCaml 对照：与 text_split.vuna 同算法（split_on_char / List.sort / String.concat）。 *)
let keep w = String.starts_with ~prefix:"w" w || String.ends_with ~suffix:"ha" w

let () =
  let text = String.concat "" (List.init 2000 (fun i -> Printf.sprintf "  w%d,alpha  \n" i)) in
  let ls = String.split_on_char '\n' text in
  let ws = List.concat_map (fun line -> List.filter keep (String.split_on_char ',' (String.trim line))) ls in
  let joined = String.concat ":" (List.sort compare ws) in
  let unlines = String.concat "" (List.map (fun l -> l ^ "\n") ls) in
  print_endline (string_of_int (List.length ws + String.length joined + String.length unlines))