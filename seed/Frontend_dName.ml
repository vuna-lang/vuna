open Vuna_runtime
type t_RName = C_RName_RLocal of (string) | C_RName_RGlobal of (string) * (string) | C_RName_RIntrinsic of (string) | C_RName_RMacro of (string) | C_RName_RHole of (string)

# 24 "Vuna/Compiler/Frontend/Name.vuna"
let v_rnameKey = (fun (dtb_u_u1 : t_RName) -> (match dtb_u_u1 with
  | C_RName_RHole (dtb_u_u2) -> dtb_u_u2
  | C_RName_RMacro (dtb_u_u3) -> (Frontend_dReserved.v_reservedText (Frontend_dReserved.C_Reserved_RsMacro (dtb_u_u3)))
  | C_RName_RIntrinsic (dtb_u_u4) -> dtb_u_u4
  | C_RName_RGlobal (dtb_u_u5, dtb_u_u6) -> (String.concat "" [dtb_u_u5; "."; dtb_u_u6])
  | C_RName_RLocal (dtb_u_u7) -> dtb_u_u7
  | _ -> failwith "DT: impossible branch"
))

# 32 "Vuna/Compiler/Frontend/Name.vuna"
let v_rnameIsGlobal = (fun (dtb_u_u8 : t_RName) -> (match dtb_u_u8 with
  | C_RName_RGlobal (dtb_u_u9, dtb_u_u10) -> true
  | _ -> false
))

# 37 "Vuna/Compiler/Frontend/Name.vuna"
let v_rnameIsIntrinsic = (fun (dtb_u_u11 : t_RName) -> (match dtb_u_u11 with
  | C_RName_RIntrinsic (dtb_u_u12) -> true
  | _ -> false
))

# 42 "Vuna/Compiler/Frontend/Name.vuna"
let v_rnameIsMacro = (fun (dtb_u_u13 : t_RName) -> (match dtb_u_u13 with
  | C_RName_RMacro (dtb_u_u14) -> true
  | _ -> false
))

# 47 "Vuna/Compiler/Frontend/Name.vuna"
let v_rnameIsHole = (fun (dtb_u_u15 : t_RName) -> (match dtb_u_u15 with
  | C_RName_RHole (dtb_u_u16) -> true
  | _ -> false
))

# 52 "Vuna/Compiler/Frontend/Name.vuna"
let v_rnameModule = (fun (dtb_u_u17 : t_RName) -> (match dtb_u_u17 with
  | C_RName_RGlobal (dtb_u_u18, dtb_u_u19) -> dtb_u_u18
  | _ -> ""
))

# 57 "Vuna/Compiler/Frontend/Name.vuna"
let v_rnameBase = (fun (dtb_u_u20 : t_RName) -> (match dtb_u_u20 with
  | C_RName_RGlobal (dtb_u_u21, dtb_u_u22) -> dtb_u_u22
  | _ -> ""
))

# 64 "Vuna/Compiler/Frontend/Name.vuna"
let v_isCompilerModulePrefix = (fun (dtb_u_u23 : string) -> (if (if (if (if (if ((B_dData_dString.v_startsWith "Base.") dtb_u_u23) then true else ((B_dData_dString.v_startsWith "Vuna.") dtb_u_u23)) then true else ((B_dData_dString.v_startsWith "Base_d") dtb_u_u23)) then true else ((B_dData_dString.v_startsWith "Vuna_d") dtb_u_u23)) then true else (dtb_u_u23 = "Obs")) then true else ((B_dData_dString.v_startsWith "Obs.") dtb_u_u23)))

# 89 "Vuna/Compiler/Frontend/Name.vuna"
let v_hasIntrinsic = (fun (dtb_u_u24 : string) -> (match (Base_dIntrinsics.v_findIntrinsic dtb_u_u24) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u25) -> true
  | B_dData_dMaybe.C_Maybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
))

# 104 "Vuna/Compiler/Frontend/Name.vuna"
let rec v_lastDotAt = (fun (dtb_u_u26 : int) (dtb_u_u27 : int B_dData_dList.t_List) (dtb_u_u28 : int) -> (match dtb_u_u27 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u29, dtb_u_u30) -> (((v_lastDotAt (dtb_u_u26 + 1)) dtb_u_u30) (if (dtb_u_u29 = 46) then dtb_u_u26 else dtb_u_u28))
  | B_dData_dList.C_List_Nil -> dtb_u_u28
  | _ -> failwith "DT: impossible branch"
))

# 96 "Vuna/Compiler/Frontend/Name.vuna"
let v_splitGlobalKey = (fun (dtb_u_u31 : string) -> (let dtb_u_u32 = (B_dData_dList.dtp_unpack dtb_u_u31) in (let dtb_u_u33 = (((v_lastDotAt 0) dtb_u_u32) (0 - 1)) in (if (dtb_u_u33 < 0) then B_dData_dMaybe.C_Maybe_Nothing else (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (B_dData_dList.dtp_pack ((B_dData_dList.v_take dtb_u_u33) dtb_u_u32)); B_dData_dPair.f_Pair_second = (B_dData_dList.dtp_pack ((B_dData_dList.v_drop (dtb_u_u33 + 1)) dtb_u_u32)) }))))))

# 109 "Vuna/Compiler/Frontend/Name.vuna"
let v_isPreludeName = (fun (dtb_u_u34 : string) -> ((B_dData_dList.v_memName dtb_u_u34) ((B_dData_dList.v_append (B_dData_dList.C_List__x58__x58_ ("Type", (B_dData_dList.C_List__x58__x58_ ("->", (B_dData_dList.C_List__x58__x58_ ("_", B_dData_dList.C_List_Nil))))))) ((B_dData_dList.v_append Base_dIntrinsics.v_preludeTypeNames) Base_dIntrinsics.v_preludeValueNames))))

# 72 "Vuna/Compiler/Frontend/Name.vuna"
let v_classifyName = (fun (dtb_u_u35 : string) -> (let dtb_u_u36 = (Frontend_dReserved.v_classify dtb_u_u35) in (match dtb_u_u36 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u37) -> (match dtb_u_u37 with
  | Frontend_dReserved.C_Reserved_RsMacro (dtb_u_u38) -> (C_RName_RMacro (dtb_u_u38))
  | _ -> (if (Frontend_dReserved.v_isHoleName dtb_u_u35) then (C_RName_RHole (dtb_u_u35)) else (if (Frontend_dReserved.v_isInternalSyntaxName dtb_u_u35) then (C_RName_RIntrinsic (dtb_u_u35)) else (if (if (v_hasIntrinsic dtb_u_u35) then true else (v_isPreludeName dtb_u_u35)) then (C_RName_RIntrinsic (dtb_u_u35)) else (match (v_splitGlobalKey dtb_u_u35) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u39) -> (C_RName_RGlobal ((B_dData_dPair.v_firstOf dtb_u_u39), (B_dData_dPair.v_secondOf dtb_u_u39)))
  | B_dData_dMaybe.C_Maybe_Nothing -> (C_RName_RLocal (dtb_u_u35))
  | _ -> failwith "DT: impossible branch"
))))
)
  | _ -> (if (Frontend_dReserved.v_isHoleName dtb_u_u35) then (C_RName_RHole (dtb_u_u35)) else (if (Frontend_dReserved.v_isInternalSyntaxName dtb_u_u35) then (C_RName_RIntrinsic (dtb_u_u35)) else (if (if (v_hasIntrinsic dtb_u_u35) then true else (v_isPreludeName dtb_u_u35)) then (C_RName_RIntrinsic (dtb_u_u35)) else (match (v_splitGlobalKey dtb_u_u35) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u40) -> (C_RName_RGlobal ((B_dData_dPair.v_firstOf dtb_u_u40), (B_dData_dPair.v_secondOf dtb_u_u40)))
  | B_dData_dMaybe.C_Maybe_Nothing -> (C_RName_RLocal (dtb_u_u35))
  | _ -> failwith "DT: impossible branch"
))))
)))
