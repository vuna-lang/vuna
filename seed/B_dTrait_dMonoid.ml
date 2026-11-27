open Vuna_runtime
type 'a0 t_Semigroup = C_Semigroup_Semigroup of (('a0) -> ('a0) -> 'a0)
and 'a0 t_Monoid = C_Monoid_Monoid of ('a0)

# 11 "Base/Trait/Monoid.vuna"
let v_mappend = (fun dtb_u_u2 dtb_u_u3 dtb_u_u4 -> (match dtb_u_u2 with
  | C_Semigroup_Semigroup (dtb_u_u5) -> ((dtb_u_u5 dtb_u_u3) dtb_u_u4)
  | _ -> failwith "DT: impossible branch"
))

# 16 "Base/Trait/Monoid.vuna"
let v_mempty = (fun dtb_u_u7 -> (match dtb_u_u7 with
  | C_Monoid_Monoid (dtb_u_u8) -> dtb_u_u8
  | _ -> failwith "DT: impossible branch"
))
