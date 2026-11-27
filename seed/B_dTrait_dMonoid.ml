open Vuna_runtime
type 'a0 t_Semigroup = C_Semigroup_Semigroup of (('a0) -> ('a0) -> 'a0)
and 'a0 t_Monoid = C_Monoid_Monoid of ('a0)

# 11 "Base/Trait/Monoid.vuna"
let v_mappend = (fun _ud x0 x1 -> (match _ud with
  | C_Semigroup_Semigroup (dtb__0) -> ((dtb__0 x0) x1)
  | _ -> failwith "DT: impossible branch"
))

# 16 "Base/Trait/Monoid.vuna"
let v_mempty = (fun _ud -> (match _ud with
  | C_Monoid_Monoid (dtb__1) -> dtb__1
  | _ -> failwith "DT: impossible branch"
))
