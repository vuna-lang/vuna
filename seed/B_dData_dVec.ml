open Vuna_runtime
type 'a0 t_Vec = C_Vec_Nil | C_Vec__x58__x58_ of ('a0) * ('a0 t_Vec)

# 21 "Base/Data/Vec.vuna"
let v_vhead = (fun dtb_u_u3 -> (match dtb_u_u3 with
  | C_Vec__x58__x58_ (dtb_u_u4, dtb_u_u5) -> dtb_u_u4
  | _ -> failwith "DT: impossible branch"
))

# 27 "Base/Data/Vec.vuna"
let v_vtail = (fun dtb_u_u8 -> (match dtb_u_u8 with
  | C_Vec__x58__x58_ (dtb_u_u9, dtb_u_u10) -> dtb_u_u10
  | _ -> failwith "DT: impossible branch"
))

# 33 "Base/Data/Vec.vuna"
let rec v_vlen = (fun dtb_u_u13 -> (match dtb_u_u13 with
  | C_Vec_Nil -> 0
  | C_Vec__x58__x58_ (dtb_u_u14, dtb_u_u15) -> (bi_natAdd 1 (v_vlen dtb_u_u15))
  | _ -> failwith "DT: impossible branch"
))

# 40 "Base/Data/Vec.vuna"
let rec v_get = (fun dtb_u_u18 (dtb_u_u19 : int) -> (match dtb_u_u18 with
  | C_Vec__x58__x58_ (dtb_u_u20, dtb_u_u21) -> (let dtnat__8 = dtb_u_u19 in (if (dtnat__8 = 0) then dtb_u_u20 else (let dtb_u_u22 = (dtnat__8 - 1) in ((v_get dtb_u_u21) dtb_u_u22))))
  | _ -> failwith "DT: impossible branch"
))

# 45 "Base/Data/Vec.vuna"
let rec v_getMaybe = (fun dtb_u_u25 (dtb_u_u26 : int) -> (match dtb_u_u25 with
  | C_Vec__x58__x58_ (dtb_u_u27, dtb_u_u28) -> (let dtnat__12 = dtb_u_u26 in (if (dtnat__12 = 0) then (B_dData_dMaybe.C_Maybe_Just (dtb_u_u27)) else (let dtb_u_u29 = (dtnat__12 - 1) in ((v_getMaybe dtb_u_u28) dtb_u_u29))))
  | C_Vec_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 51 "Base/Data/Vec.vuna"
let[@tail_mod_cons] rec v_tabulate = (fun (dtb_u_u31 : int) dtb_u_u32 -> (let dtnat__14 = dtb_u_u31 in (if (dtnat__14 = 0) then C_Vec_Nil else (let dtb_u_u33 = (dtnat__14 - 1) in (C_Vec__x58__x58_ ((dtb_u_u32 0), ((v_tabulate dtb_u_u33) (fun dtb_u_u34 -> (dtb_u_u32 (bi_natSucc dtb_u_u34))))))))))

# 65 "Base/Data/Vec.vuna"
let[@tail_mod_cons] rec v_vecToList = (fun dtb_u_u37 -> (match dtb_u_u37 with
  | C_Vec__x58__x58_ (dtb_u_u38, dtb_u_u39) -> (B_dData_dList.C_List__x58__x58_ (dtb_u_u38, (v_vecToList dtb_u_u39)))
  | C_Vec_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 61 "Base/Data/Vec.vuna"
let v_substTemplate = (fun (dtb_u_u41 : string) (dtb_u_u42 : string t_Vec) -> ((B_dData_dList.dtp_substTemplate dtb_u_u41) (v_vecToList dtb_u_u42)))
