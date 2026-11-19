open Vuna_runtime
type 'a0 t_Vec = C_Vec_Nil | C_Vec_VCons of ('a0) * ('a0 t_Vec)

# 20 "Base/Data/Vec.vuna"
let v_vhead = (fun xs -> (match xs with
  | C_Vec_VCons (dtb__0, dtb__1) -> dtb__0
  | _ -> failwith "DT: impossible branch"
))

# 26 "Base/Data/Vec.vuna"
let v_vtail = (fun xs -> (match xs with
  | C_Vec_VCons (dtb__2, dtb__3) -> dtb__3
  | _ -> failwith "DT: impossible branch"
))

# 32 "Base/Data/Vec.vuna"
let rec v_vlen = (fun xs -> (match xs with
  | C_Vec_Nil -> 0
  | C_Vec_VCons (dtb__4, dtb__5) -> (bi_natAdd 1 (v_vlen dtb__5))
  | _ -> failwith "DT: impossible branch"
))

# 48 "Base/Data/Vec.vuna"
let rec v_vecToList = (fun (mc0 : string t_Vec) -> (match mc0 with
  | C_Vec_VCons (dtb__6, dtb__7) -> (B_dData_dList.C_List__x58__x58_ (dtb__6, (v_vecToList dtb__7)))
  | C_Vec_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 44 "Base/Data/Vec.vuna"
let v_substTemplate = (fun (template : string) (args : string t_Vec) -> ((B_dData_dList.dtp_substTemplate template) (v_vecToList args)))
