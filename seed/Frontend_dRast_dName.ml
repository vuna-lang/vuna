open Vuna_runtime
type t_RName = C_RName_RLocal of (string) | C_RName_RGlobal of (string) * (string) | C_RName_RIntrinsic of (string) | C_RName_RMacro of (string) | C_RName_RHole of (string)

# 24 "Vuna/Compiler/Frontend/Rast/Name.vuna"
let v_rnameKey = (fun (mc0 : t_RName) -> (match mc0 with
  | C_RName_RHole (dtb__0) -> dtb__0
  | C_RName_RMacro (dtb__1) -> (Frontend_dReserved.v_reservedText (Frontend_dReserved.C_Reserved_RsMacro (dtb__1)))
  | C_RName_RIntrinsic (dtb__2) -> dtb__2
  | C_RName_RGlobal (dtb__3, dtb__4) -> (String.concat "" [dtb__3; "."; dtb__4])
  | C_RName_RLocal (dtb__5) -> dtb__5
  | _ -> failwith "DT: impossible branch"
))

# 32 "Vuna/Compiler/Frontend/Rast/Name.vuna"
let v_rnameIsGlobal = (fun (mc0 : t_RName) -> (match mc0 with
  | C_RName_RGlobal (dtb__6, dtb__7) -> true
  | _ -> false
))

# 37 "Vuna/Compiler/Frontend/Rast/Name.vuna"
let v_rnameIsIntrinsic = (fun (mc0 : t_RName) -> (match mc0 with
  | C_RName_RIntrinsic (dtb__8) -> true
  | _ -> false
))

# 42 "Vuna/Compiler/Frontend/Rast/Name.vuna"
let v_rnameIsMacro = (fun (mc0 : t_RName) -> (match mc0 with
  | C_RName_RMacro (dtb__9) -> true
  | _ -> false
))

# 47 "Vuna/Compiler/Frontend/Rast/Name.vuna"
let v_rnameIsHole = (fun (mc0 : t_RName) -> (match mc0 with
  | C_RName_RHole (dtb__10) -> true
  | _ -> false
))

# 52 "Vuna/Compiler/Frontend/Rast/Name.vuna"
let v_rnameModule = (fun (mc0 : t_RName) -> (match mc0 with
  | C_RName_RGlobal (dtb__11, dtb__12) -> dtb__11
  | _ -> ""
))

# 57 "Vuna/Compiler/Frontend/Rast/Name.vuna"
let v_rnameBase = (fun (mc0 : t_RName) -> (match mc0 with
  | C_RName_RGlobal (dtb__13, dtb__14) -> dtb__14
  | _ -> ""
))

# 64 "Vuna/Compiler/Frontend/Rast/Name.vuna"
let v_isCompilerModulePrefix = (fun (prefix : string) -> (if (if (if ((B_dData_dString.v_startsWith "Base.") prefix) then true else ((B_dData_dString.v_startsWith "Vuna.") prefix)) then true else ((B_dData_dString.v_startsWith "Base_d") prefix)) then true else ((B_dData_dString.v_startsWith "Vuna_d") prefix)))

# 87 "Vuna/Compiler/Frontend/Rast/Name.vuna"
let v_hasIntrinsic = (fun (name : string) -> (match (Base_dIntrinsics.v_findIntrinsic name) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__15) -> true
  | B_dData_dMaybe.C_Maybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
))

# 102 "Vuna/Compiler/Frontend/Rast/Name.vuna"
let rec v_lastDotAt = (fun (mc0 : int) (mc1 : int B_dData_dList.t_List) (mc2 : int) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__16, dtb__17) -> (((v_lastDotAt (mc0 + 1)) dtb__17) (if (dtb__16 = 46) then mc0 else mc2))
  | B_dData_dList.C_List_Nil -> mc2
  | _ -> failwith "DT: impossible branch"
))

# 94 "Vuna/Compiler/Frontend/Rast/Name.vuna"
let v_splitGlobalKey = (fun (name : string) -> (let cs = (B_dData_dList.dtp_unpack name) in (let at = (((v_lastDotAt 0) cs) (0 - 1)) in (if (at < 0) then B_dData_dMaybe.C_Maybe_Nothing else (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (B_dData_dList.dtp_pack ((B_dData_dList.v_take at) cs)); B_dData_dPair.f_Pair_second = (B_dData_dList.dtp_pack ((B_dData_dList.v_drop (at + 1)) cs)) }))))))

# 107 "Vuna/Compiler/Frontend/Rast/Name.vuna"
let v_isPreludeName = (fun (name : string) -> ((B_dData_dList.v_memName name) ((B_dData_dList.v_append (B_dData_dList.C_List__x58__x58_ ("Type", (B_dData_dList.C_List__x58__x58_ ("->", (B_dData_dList.C_List__x58__x58_ ("_", B_dData_dList.C_List_Nil))))))) ((B_dData_dList.v_append Base_dIntrinsics.v_preludeTypeNames) Base_dIntrinsics.v_preludeValueNames))))

# 70 "Vuna/Compiler/Frontend/Rast/Name.vuna"
let v_classifyName = (fun (name : string) -> (let nd_uscrut1 = (Frontend_dReserved.v_classify name) in (match nd_uscrut1 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__18) -> (match dtb__18 with
  | Frontend_dReserved.C_Reserved_RsMacro (dtb__19) -> (C_RName_RMacro (dtb__19))
  | _ -> (if (Frontend_dReserved.v_isHoleName name) then (C_RName_RHole (name)) else (if (Frontend_dReserved.v_isInternalSyntaxName name) then (C_RName_RIntrinsic (name)) else (if (if (v_hasIntrinsic name) then true else (v_isPreludeName name)) then (C_RName_RIntrinsic (name)) else (match (v_splitGlobalKey name) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__20) -> (C_RName_RGlobal ((B_dData_dPair.v_firstOf dtb__20), (B_dData_dPair.v_secondOf dtb__20)))
  | B_dData_dMaybe.C_Maybe_Nothing -> (C_RName_RLocal (name))
  | _ -> failwith "DT: impossible branch"
))))
)
  | _ -> (if (Frontend_dReserved.v_isHoleName name) then (C_RName_RHole (name)) else (if (Frontend_dReserved.v_isInternalSyntaxName name) then (C_RName_RIntrinsic (name)) else (if (if (v_hasIntrinsic name) then true else (v_isPreludeName name)) then (C_RName_RIntrinsic (name)) else (match (v_splitGlobalKey name) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__21) -> (C_RName_RGlobal ((B_dData_dPair.v_firstOf dtb__21), (B_dData_dPair.v_secondOf dtb__21)))
  | B_dData_dMaybe.C_Maybe_Nothing -> (C_RName_RLocal (name))
  | _ -> failwith "DT: impossible branch"
))))
)))
