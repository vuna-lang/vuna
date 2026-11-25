(* 手写 OCaml 对照：与 mut_buffer.vuna 同算法（Buffer 追加 8 字节分片 N 次，取快照、
   清空、再追加回快照，输出各阶段字节数）。 *)
let n = 2000

let () =
  let b = Buffer.create 16 in
  for _ = 1 to n do
    Buffer.add_string b "abcdefgh"
  done;
  let n1 = Buffer.length b in
  let s1 = Buffer.contents b in
  Buffer.clear b;
  let n2 = Buffer.length b in
  Buffer.add_string b s1;
  let n3 = Buffer.length b in
  print_int
    (n1 + String.length s1 + n2 + n3 + Char.code s1.[0]
   + Char.code s1.[String.length s1 - 1])