open Vuna_runtime
type 'a0 t_Num = C_Num_Num of (('a0) -> ('a0) -> 'a0) * (('a0) -> ('a0) -> 'a0) * (('a0) -> ('a0) -> 'a0) * (('a0) -> ('a0) -> 'a0)

# 11 "Base/Trait/Num.vuna"
let v__x43_ = (fun _ud x0 x1 -> (match _ud with
  | C_Num_Num (dtb__0, dtb__1, dtb__2, dtb__3) -> ((dtb__0 x0) x1)
  | _ -> failwith "DT: impossible branch"
))

# 13 "Base/Trait/Num.vuna"
let v__x45_ = (fun _ud x0 x1 -> (match _ud with
  | C_Num_Num (dtb__4, dtb__5, dtb__6, dtb__7) -> ((dtb__5 x0) x1)
  | _ -> failwith "DT: impossible branch"
))

# 15 "Base/Trait/Num.vuna"
let v__x42_ = (fun _ud x0 x1 -> (match _ud with
  | C_Num_Num (dtb__8, dtb__9, dtb__10, dtb__11) -> ((dtb__10 x0) x1)
  | _ -> failwith "DT: impossible branch"
))

# 17 "Base/Trait/Num.vuna"
let v__x47_ = (fun _ud x0 x1 -> (match _ud with
  | C_Num_Num (dtb__12, dtb__13, dtb__14, dtb__15) -> ((dtb__15 x0) x1)
  | _ -> failwith "DT: impossible branch"
))
