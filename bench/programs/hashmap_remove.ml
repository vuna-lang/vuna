(* 手写 OCaml 对照：与 hashmap_remove.vuna 同操作（标准库 Hashtbl，上限实现）。 *)
let scramble i =
  let x = i * 7919 in
  x - (x / 100003 * 100003)

let rec insert_all k h =
  if k <= 0 then ()
  else (
    Hashtbl.replace h (scramble k) k;
    insert_all (k - 1) h)

let rec remove_even k h =
  if k <= 0 then ()
  else (
    Hashtbl.remove h (scramble (k * 2));
    remove_even (k - 1) h)

let rec lookup_sum k h acc =
  if k <= 0 then acc
  else
    match Hashtbl.find_opt h (scramble k) with
    | None -> lookup_sum (k - 1) h acc
    | Some v -> lookup_sum (k - 1) h ((acc * 31) + v)

let () =
  let h = Hashtbl.create 32768 in
  insert_all 20000 h;
  remove_even 20000 h;
  print_endline (string_of_int (lookup_sum 20000 h 0 + Hashtbl.length h))