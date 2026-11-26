open Vuna_runtime
type t_Fin = C_Fin_FZero | C_Fin_FSucc of (t_Fin)

# 20 "Base/Data/Fin.vuna"
let rec v_finToNat = (fun (mc0 : t_Fin) -> (match mc0 with
  | C_Fin_FSucc (dtb__0) -> (bi_natSucc (v_finToNat dtb__0))
  | C_Fin_FZero -> 0
  | _ -> failwith "DT: impossible branch"
))

# 44 "Base/Data/Fin.vuna"
let v_Convert_ue2bc7263cfa9794d_uBase_x36_46_x36_Data_x36_46_x36_Fin_x36_46_x36_Fin_un_uBase_x36_46_x36_Data_x36_46_x36_Nat_x36_46_x36_Nat = (B_dTrait_dConvert.C_Convert_Convert (v_finToNat))

# 47 "Base/Data/Fin.vuna"
let v_Convert_ue2bc7263cfa9794d_uBase_x36_46_x36_Data_x36_46_x36_Fin_x36_46_x36_Fin_un_uInt = (B_dTrait_dConvert.C_Convert_Convert ((fun j -> (v_finToNat j))))

# 25 "Base/Data/Fin.vuna"
let[@tail_mod_cons] rec v_finWeaken = (fun (mc0 : t_Fin) -> (match mc0 with
  | C_Fin_FSucc (dtb__1) -> (C_Fin_FSucc ((v_finWeaken dtb__1)))
  | C_Fin_FZero -> C_Fin_FZero
  | _ -> failwith "DT: impossible branch"
))

# 30 "Base/Data/Fin.vuna"
let[@tail_mod_cons] rec v_finLast = (fun (mc0 : int) -> (let dtnat__2 = mc0 in (if (dtnat__2 = 0) then C_Fin_FZero else (let dtb__3 = (dtnat__2 - 1) in (C_Fin_FSucc ((v_finLast dtb__3)))))))

# 35 "Base/Data/Fin.vuna"
let rec v_finFromNat = (fun (mc0 : int) (mc1 : int) -> (let dtnat__4 = mc0 in (if (dtnat__4 = 0) then B_dData_dMaybe.C_Maybe_Nothing else (let dtb__5 = (dtnat__4 - 1) in (let dtnat__6 = mc1 in (if (dtnat__6 = 0) then (B_dData_dMaybe.C_Maybe_Just (C_Fin_FZero)) else (let dtb__7 = (dtnat__6 - 1) in (((B_dTrait_dFunctor.v_fmap B_dData_dMaybe.v_Functor_ua5312def40ac3976_uBase_x36_46_x36_Data_x36_46_x36_Maybe_x36_46_x36_Maybe) (fun (x : t_Fin) -> (C_Fin_FSucc (x)))) ((v_finFromNat dtb__5) dtb__7)))))))))

# 41 "Base/Data/Fin.vuna"
let v_finFromInt = (fun (n : int) (i : int) -> (if (i < 0) then B_dData_dMaybe.C_Maybe_Nothing else ((v_finFromNat n) (bi_natFromInt i))))
