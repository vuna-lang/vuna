open Vuna_runtime
type 'a0 t_Dict_uBase_dMonoid_dSemigroup = C_Dict_uBase_dMonoid_dSemigroup_Semigroup of (('a0) -> ('a0) -> 'a0)
and 'a0 t_Dict_uBase_dMonoid_dMonoid = C_Dict_uBase_dMonoid_dMonoid_Monoid of ('a0)

let v_Base_dMonoid_dmappend = (fun _ud x0 x1 -> (match _ud with
  | C_Dict_uBase_dMonoid_dSemigroup_Semigroup (dtb__0) -> ((dtb__0 x0) x1)
  | _ -> failwith "DT: impossible branch"
))

let v_Base_dMonoid_dmempty = (fun _ud -> (match _ud with
  | C_Dict_uBase_dMonoid_dMonoid_Monoid (dtb__1) -> dtb__1
  | _ -> failwith "DT: impossible branch"
))
