open Vuna_runtime
type 'a0 t_Dict_uShow = C_Dict_uShow_MkDict_uShow of (('a0) -> string)
and 'a0 t_Dict_uEq = C_Dict_uEq_MkDict_uEq of (('a0) -> ('a0) -> bool) * (('a0) -> ('a0) -> bool)
and 'a0 t_Dict_uOrd = C_Dict_uOrd_MkDict_uOrd of (('a0) -> ('a0) -> bool) * (('a0) -> ('a0) -> bool) * (('a0) -> ('a0) -> bool) * (('a0) -> ('a0) -> bool)

let v_Show_uShow_uInt = fun () -> (C_Dict_uShow_MkDict_uShow ((fun sx -> (bi_strFromInt sx))))

let v_Show_uShow_uString = fun () -> (C_Dict_uShow_MkDict_uShow ((fun sx -> ((bi_concat "\"") ((bi_concat sx) "\"")))))

let v_Show_uShow_uBool = fun () -> (C_Dict_uShow_MkDict_uShow ((fun sx -> (if sx then "True" else "False"))))

let v_Eq_uEq_uInt = fun () -> (C_Dict_uEq_MkDict_uEq ((fun x -> (fun y -> ((bi_eq_int x) y))), (fun x -> (fun y -> ((bi_neq_int x) y)))))

let v_Eq_uEq_uString = fun () -> (C_Dict_uEq_MkDict_uEq ((fun x -> (fun y -> ((bi_eq_str x) y))), (fun x -> (fun y -> ((bi_neq_str x) y)))))

let v_Ord_uOrd_uInt = fun () -> (C_Dict_uOrd_MkDict_uOrd ((fun x -> (fun y -> ((bi_lt_int x) y))), (fun x -> (fun y -> ((bi_le_int x) y))), (fun x -> (fun y -> ((bi_gt_int x) y))), (fun x -> (fun y -> ((bi_ge_int x) y)))))

let v_Ord_uOrd_uString = fun () -> (C_Dict_uOrd_MkDict_uOrd ((fun x -> (fun y -> ((bi_lt_generic x) y))), (fun x -> (fun y -> ((bi_le_generic x) y))), (fun x -> (fun y -> ((bi_gt_generic x) y))), (fun x -> (fun y -> ((bi_ge_generic x) y)))))

let v_Ord_uOrd_uBool = fun () -> (C_Dict_uOrd_MkDict_uOrd ((fun x -> (fun y -> ((bi_lt_generic x) y))), (fun x -> (fun y -> ((bi_le_generic x) y))), (fun x -> (fun y -> ((bi_gt_generic x) y))), (fun x -> (fun y -> ((bi_ge_generic x) y)))))

let v_show = (fun _ud -> (fun x0 -> (match _ud with
  | C_Dict_uShow_MkDict_uShow (dtb__0) -> (dtb__0 x0)
  | _ -> failwith "DT: impossible branch"
)))

let v_eq = (fun _ud -> (fun x0 -> (fun x1 -> (match _ud with
  | C_Dict_uEq_MkDict_uEq (dtb__1, dtb__2) -> ((dtb__1 x0) x1)
  | _ -> failwith "DT: impossible branch"
))))

let v_neq = (fun _ud -> (fun x0 -> (fun x1 -> (match _ud with
  | C_Dict_uEq_MkDict_uEq (dtb__3, dtb__4) -> ((dtb__4 x0) x1)
  | _ -> failwith "DT: impossible branch"
))))

let v_lt = (fun _ud -> (fun x0 -> (fun x1 -> (match _ud with
  | C_Dict_uOrd_MkDict_uOrd (dtb__5, dtb__6, dtb__7, dtb__8) -> ((dtb__5 x0) x1)
  | _ -> failwith "DT: impossible branch"
))))

let v_le = (fun _ud -> (fun x0 -> (fun x1 -> (match _ud with
  | C_Dict_uOrd_MkDict_uOrd (dtb__9, dtb__10, dtb__11, dtb__12) -> ((dtb__10 x0) x1)
  | _ -> failwith "DT: impossible branch"
))))

let v_gt = (fun _ud -> (fun x0 -> (fun x1 -> (match _ud with
  | C_Dict_uOrd_MkDict_uOrd (dtb__13, dtb__14, dtb__15, dtb__16) -> ((dtb__15 x0) x1)
  | _ -> failwith "DT: impossible branch"
))))

let v_ge = (fun _ud -> (fun x0 -> (fun x1 -> (match _ud with
  | C_Dict_uOrd_MkDict_uOrd (dtb__17, dtb__18, dtb__19, dtb__20) -> ((dtb__20 x0) x1)
  | _ -> failwith "DT: impossible branch"
))))
