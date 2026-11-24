open Vuna_runtime
type 'a0 t_Vec = C_Vec_Nil | C_Vec_VCons of ('a0) * ('a0 t_Vec)

# 21 "Base/Data/Vec.vuna"
let v_vhead = (fun xs -> (match xs with
  | C_Vec_VCons (dtb__0, dtb__1) -> dtb__0
  | _ -> failwith "DT: impossible branch"
))

# 27 "Base/Data/Vec.vuna"
let v_vtail = (fun xs -> (match xs with
  | C_Vec_VCons (dtb__2, dtb__3) -> dtb__3
  | _ -> failwith "DT: impossible branch"
))

# 33 "Base/Data/Vec.vuna"
let rec v_vlen = (fun xs -> (match xs with
  | C_Vec_Nil -> 0
  | C_Vec_VCons (dtb__4, dtb__5) -> (bi_natAdd 1 (v_vlen dtb__5))
  | _ -> failwith "DT: impossible branch"
))

# 40 "Base/Data/Vec.vuna"
let rec v_get = (fun mc0 (mc1 : B_dData_dFin.t_Fin) -> (match mc0 with
  | C_Vec_VCons (dtb__6, dtb__7) -> (match mc1 with
  | B_dData_dFin.C_Fin_FSucc (dtb__8) -> ((v_get dtb__7) dtb__8)
  | B_dData_dFin.C_Fin_FZero -> dtb__6
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 45 "Base/Data/Vec.vuna"
let rec v_getMaybe = (fun mc0 (mc1 : int) -> (match mc0 with
  | C_Vec_VCons (dtb__9, dtb__10) -> (let dtnat__11 = mc1 in (if (dtnat__11 = 0) then (B_dData_dMaybe.C_Maybe_Just (dtb__9)) else (let dtb__12 = (dtnat__11 - 1) in ((v_getMaybe dtb__10) dtb__12))))
  | C_Vec_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 51 "Base/Data/Vec.vuna"
let rec v_tabulate = (fun (mc0 : int) mc1 -> (let dtnat__13 = mc0 in (if (dtnat__13 = 0) then C_Vec_Nil else (let dtb__14 = (dtnat__13 - 1) in (C_Vec_VCons ((mc1 B_dData_dFin.C_Fin_FZero), ((v_tabulate dtb__14) (fun (i : B_dData_dFin.t_Fin) -> (mc1 (B_dData_dFin.C_Fin_FSucc (i)))))))))))

# 65 "Base/Data/Vec.vuna"
let rec v_vecToList = (fun (mc0 : string t_Vec) -> (match mc0 with
  | C_Vec_VCons (dtb__15, dtb__16) -> (B_dData_dList.C_List__x58__x58_ (dtb__15, (v_vecToList dtb__16)))
  | C_Vec_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 61 "Base/Data/Vec.vuna"
let v_substTemplate = (fun (template : string) (args : string t_Vec) -> ((B_dData_dList.dtp_substTemplate template) (v_vecToList args)))
