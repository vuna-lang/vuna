(* 手写 OCaml 对照：与 string_ops.vuna 同算法。
   repeat / substring 复刻 base 的库语义；pack 用 Array.of_list（当前最优写法）。 *)
let rec build n = if n <= 0 then "" else "0123456789" ^ build (n - 1)

let rec repeat n s = if n <= 0 then "" else s ^ repeat (n - 1) s

let unpack s = List.init (String.length s) (fun i -> Char.code s.[i])

let rec take n xs =
  if n <= 0 then []
  else match xs with [] -> [] | x :: rest -> x :: take (n - 1) rest

let rec drop n xs =
  if n <= 0 then xs else match xs with [] -> [] | _ :: rest -> drop (n - 1) rest

let pack cs =
  let a = Array.of_list cs in
  String.init (Array.length a) (fun i -> Char.chr a.(i))

let substring start len s = pack (take len (drop start (unpack s)))

let () =
  let s = build 3000 in
  print_endline
    (string_of_int
       (String.length s
       + String.length (repeat 2000 "xy")
       + String.length (substring 100 20000 s)))