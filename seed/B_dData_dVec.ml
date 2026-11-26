open Vuna_runtime
type 'a0 t_Vec = C_Vec_Nil | C_Vec__x58__x58_ of ('a0) * ('a0 t_Vec)

# 21 "Base/Data/Vec.vuna"
let v_vhead = (fun xs -> (match xs with
  | C_Vec__x58__x58_ (dtb__0, dtb__1) -> dtb__0
  | _ -> failwith "DT: impossible branch"
))

# 27 "Base/Data/Vec.vuna"
let v_vtail = (fun xs -> (match xs with
  | C_Vec__x58__x58_ (dtb__2, dtb__3) -> dtb__3
  | _ -> failwith "DT: impossible branch"
))

# 33 "Base/Data/Vec.vuna"
let rec v_vlen = (fun xs -> (match xs with
  | C_Vec_Nil -> 0
  | C_Vec__x58__x58_ (dtb__4, dtb__5) -> (bi_natAdd 1 (v_vlen dtb__5))
  | _ -> failwith "DT: impossible branch"
))

# 40 "Base/Data/Vec.vuna"
let rec v_get = (fun mc0 (mc1 : int) -> (match mc0 with
  | C_Vec__x58__x58_ (dtb__6, dtb__7) -> (let dtnat__8 = mc1 in (if (dtnat__8 = 0) then dtb__6 else (let dtb__9 = (dtnat__8 - 1) in ((v_get dtb__7) dtb__9))))
  | _ -> failwith "DT: impossible branch"
))

# 45 "Base/Data/Vec.vuna"
let rec v_getMaybe = (fun mc0 (mc1 : int) -> (match mc0 with
  | C_Vec__x58__x58_ (dtb__10, dtb__11) -> (let dtnat__12 = mc1 in (if (dtnat__12 = 0) then (B_dData_dMaybe.C_Maybe_Just (dtb__10)) else (let dtb__13 = (dtnat__12 - 1) in ((v_getMaybe dtb__11) dtb__13))))
  | C_Vec_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 51 "Base/Data/Vec.vuna"
let[@tail_mod_cons] rec v_tabulate = (fun (mc0 : int) mc1 -> (let dtnat__14 = mc0 in (if (dtnat__14 = 0) then C_Vec_Nil else (let dtb__15 = (dtnat__14 - 1) in (C_Vec__x58__x58_ ((mc1 0), ((v_tabulate dtb__15) (fun i -> (mc1 (bi_natSucc i))))))))))

# 65 "Base/Data/Vec.vuna"
let[@tail_mod_cons] rec v_vecToList = (fun mc0 -> (match mc0 with
  | C_Vec__x58__x58_ (dtb__16, dtb__17) -> (B_dData_dList.C_List__x58__x58_ (dtb__16, (v_vecToList dtb__17)))
  | C_Vec_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 61 "Base/Data/Vec.vuna"
let v_substTemplate = (fun (template : string) (args : string t_Vec) -> ((B_dData_dList.dtp_substTemplate template) (v_vecToList args)))
