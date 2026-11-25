(* 手写 OCaml 对照：与 graph_bfs.vuna 同算法（邻接数组 + Hashtbl 去重 + FIFO Queue）。 *)
let n = 5000

let neighbors i = [ ((i * 7) + 3) mod n; ((i * 13) + 5) mod n ]

let adjacency = Array.init n neighbors

let () =
  let seen = Hashtbl.create (2 * n) in
  let q = Queue.create () in
  Hashtbl.replace seen 0 ();
  Queue.push (0, 0) q;
  let hits = ref 1 in
  let dist_sum = ref 0 in
  while not (Queue.is_empty q) do
    let v, d = Queue.pop q in
    List.iter
      (fun u ->
        if not (Hashtbl.mem seen u) then (
          Hashtbl.replace seen u ();
          incr hits;
          dist_sum := !dist_sum + d + 1;
          Queue.push (u, d + 1) q))
      adjacency.(v)
  done;
  print_endline (string_of_int (!dist_sum + !hits))