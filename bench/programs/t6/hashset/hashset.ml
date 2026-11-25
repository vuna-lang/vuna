(* 手写 OCaml 对照：与 hashset.vuna 同操作（标准库 Hashtbl 作手写上限，Int 键）。 *)
let scramble i =
  let x = i * 7919 in
  x - (x / 100003 * 100003)

let rec insert_all k h =
  if k <= 0 then ()
  else (
    Hashtbl.replace h (scramble k) true;
    insert_all (k - 1) h)

let rec remove_even k h =
  if k <= 0 then ()
  else (
    Hashtbl.remove h (scramble (k * 2));
    remove_even (k - 1) h)

let rec hit_sum k h acc =
  if k <= 0 then acc
  else if Hashtbl.mem h (scramble k) then hit_sum (k - 1) h ((acc * 31) + k)
  else hit_sum (k - 1) h acc

let () =
  let n = 20000 in
  let h = Hashtbl.create 32768 in
  insert_all n h;
  remove_even n h;
  print_endline (string_of_int (hit_sum n h 0 + Hashtbl.length h))