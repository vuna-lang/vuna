open Vuna_runtime
type 'a0 t_Eq = C_Eq_Eq of (('a0) -> ('a0) -> bool) * (('a0) -> ('a0) -> bool)

# 17 "Base/Trait/Eq.vuna"
let v_Eq_u018fc178ff3df1b4_uBase_x36_46_x36_Data_x36_46_x36_Bool_x36_46_x36_Bool = (C_Eq_Eq ((fun (mc0 : bool) (mc1 : bool) -> (if mc0 then (if mc1 then true else false) else (if mc1 then false else true))), (fun (mc0 : bool) (mc1 : bool) -> (if mc0 then (if mc1 then false else true) else (if mc1 then true else false)))))

# 12 "Base/Trait/Eq.vuna"
let v__x61__x61_ = (fun _ud x0 x1 -> (match _ud with
  | C_Eq_Eq (dtb__0, dtb__1) -> ((dtb__0 x0) x1)
  | _ -> failwith "DT: impossible branch"
))

# 14 "Base/Trait/Eq.vuna"
let v__x47__x61_ = (fun _ud x0 x1 -> (match _ud with
  | C_Eq_Eq (dtb__2, dtb__3) -> ((dtb__3 x0) x1)
  | _ -> failwith "DT: impossible branch"
))
