(* 手写 OCaml 对照：与 sort_lib.vuna 同输入、同算法上限（标准库 List.sort）。 *)
let scramble i =
  let x = i * 7919 in
  x - (x / 100003 * 100003)

let rec gen k acc = if k <= 0 then acc else gen (k - 1) (scramble k :: acc)

let () =
  let xs = gen 20000 [] in
  let ys = List.sort compare xs in
  print_endline (string_of_int (List.fold_left (fun acc x -> (acc * 31) + x) 0 ys))