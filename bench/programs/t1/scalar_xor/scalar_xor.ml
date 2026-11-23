let rec loop acc n = if n <= 0 then acc else loop (acc lxor n) (n - 1)

let () =
  print_int (loop 0 20_000_000);
  print_newline ()