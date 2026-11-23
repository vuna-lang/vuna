let rec loop acc n =
  if n <= 0 then acc else loop ((acc * 1103515245 + 12345) land 0xffffffff) (n - 1)

let () =
  print_int (loop 0 20_000_000);
  print_newline ()