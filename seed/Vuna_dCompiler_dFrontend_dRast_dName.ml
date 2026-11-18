open Vuna_runtime
type t_Vuna_dCompiler_dFrontend_dRast_dName_dRName = C_Vuna_dCompiler_dFrontend_dRast_dName_dRName_RLocal of (string) | C_Vuna_dCompiler_dFrontend_dRast_dName_dRName_RGlobal of (string) * (string) | C_Vuna_dCompiler_dFrontend_dRast_dName_dRName_RIntrinsic of (string) | C_Vuna_dCompiler_dFrontend_dRast_dName_dRName_RMacro of (string) | C_Vuna_dCompiler_dFrontend_dRast_dName_dRName_RHole of (string)

# 24 "Vuna/Compiler/Frontend/Rast/Name.vuna"
let v_Vuna_dCompiler_dFrontend_dRast_dName_drnameKey = (fun (mc0 : t_Vuna_dCompiler_dFrontend_dRast_dName_dRName) -> (match mc0 with
  | C_Vuna_dCompiler_dFrontend_dRast_dName_dRName_RHole (dtb__0) -> dtb__0
  | C_Vuna_dCompiler_dFrontend_dRast_dName_dRName_RMacro (dtb__1) -> (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dmacroSyntaxName dtb__1)
  | C_Vuna_dCompiler_dFrontend_dRast_dName_dRName_RIntrinsic (dtb__2) -> dtb__2
  | C_Vuna_dCompiler_dFrontend_dRast_dName_dRName_RGlobal (dtb__3, dtb__4) -> (String.concat "" [dtb__3; "."; dtb__4])
  | C_Vuna_dCompiler_dFrontend_dRast_dName_dRName_RLocal (dtb__5) -> dtb__5
  | _ -> failwith "DT: impossible branch"
))

# 32 "Vuna/Compiler/Frontend/Rast/Name.vuna"
let v_Vuna_dCompiler_dFrontend_dRast_dName_drnameIsGlobal = (fun (mc0 : t_Vuna_dCompiler_dFrontend_dRast_dName_dRName) -> (match mc0 with
  | C_Vuna_dCompiler_dFrontend_dRast_dName_dRName_RGlobal (dtb__6, dtb__7) -> true
  | _ -> false
))

# 37 "Vuna/Compiler/Frontend/Rast/Name.vuna"
let v_Vuna_dCompiler_dFrontend_dRast_dName_drnameIsIntrinsic = (fun (mc0 : t_Vuna_dCompiler_dFrontend_dRast_dName_dRName) -> (match mc0 with
  | C_Vuna_dCompiler_dFrontend_dRast_dName_dRName_RIntrinsic (dtb__8) -> true
  | _ -> false
))

# 42 "Vuna/Compiler/Frontend/Rast/Name.vuna"
let v_Vuna_dCompiler_dFrontend_dRast_dName_drnameIsMacro = (fun (mc0 : t_Vuna_dCompiler_dFrontend_dRast_dName_dRName) -> (match mc0 with
  | C_Vuna_dCompiler_dFrontend_dRast_dName_dRName_RMacro (dtb__9) -> true
  | _ -> false
))

# 47 "Vuna/Compiler/Frontend/Rast/Name.vuna"
let v_Vuna_dCompiler_dFrontend_dRast_dName_drnameIsHole = (fun (mc0 : t_Vuna_dCompiler_dFrontend_dRast_dName_dRName) -> (match mc0 with
  | C_Vuna_dCompiler_dFrontend_dRast_dName_dRName_RHole (dtb__10) -> true
  | _ -> false
))

# 52 "Vuna/Compiler/Frontend/Rast/Name.vuna"
let v_Vuna_dCompiler_dFrontend_dRast_dName_drnameModule = (fun (mc0 : t_Vuna_dCompiler_dFrontend_dRast_dName_dRName) -> (match mc0 with
  | C_Vuna_dCompiler_dFrontend_dRast_dName_dRName_RGlobal (dtb__11, dtb__12) -> dtb__11
  | _ -> ""
))

# 57 "Vuna/Compiler/Frontend/Rast/Name.vuna"
let v_Vuna_dCompiler_dFrontend_dRast_dName_drnameBase = (fun (mc0 : t_Vuna_dCompiler_dFrontend_dRast_dName_dRName) -> (match mc0 with
  | C_Vuna_dCompiler_dFrontend_dRast_dName_dRName_RGlobal (dtb__13, dtb__14) -> dtb__14
  | _ -> ""
))

# 63 "Vuna/Compiler/Frontend/Rast/Name.vuna"
let v_Vuna_dCompiler_dFrontend_dRast_dName_disCompilerModulePrefix = (fun prefix -> (if (if (if ((Base_dData_dString.v_Base_dData_dString_dstartsWith "Base.") prefix) then true else ((Base_dData_dString.v_Base_dData_dString_dstartsWith "Vuna.") prefix)) then true else ((Base_dData_dString.v_Base_dData_dString_dstartsWith "Base_d") prefix)) then true else ((Base_dData_dString.v_Base_dData_dString_dstartsWith "Vuna_d") prefix)))

# 87 "Vuna/Compiler/Frontend/Rast/Name.vuna"
let v_Vuna_dCompiler_dFrontend_dRast_dName_dhasIntrinsic = (fun name -> (match (Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_dfindIntrinsic name) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__15) -> true
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
))

# 102 "Vuna/Compiler/Frontend/Rast/Name.vuna"
let rec v_Vuna_dCompiler_dFrontend_dRast_dName_dlastDotAt = (fun index cs found -> (match cs with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> found
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__16, dtb__17) -> (((v_Vuna_dCompiler_dFrontend_dRast_dName_dlastDotAt (index + 1)) dtb__17) (if (dtb__16 = 46) then index else found))
  | _ -> failwith "DT: impossible branch"
))

# 94 "Vuna/Compiler/Frontend/Rast/Name.vuna"
let v_Vuna_dCompiler_dFrontend_dRast_dName_dsplitGlobalKey = (fun name -> ((fun cs -> ((fun at -> (if (at < 0) then Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing else (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Base_dData_dList.dtp_pack ((Base_dData_dList.v_Base_dData_dList_dtake at) cs)); Base_dData_dPair.f_Base_dData_dPair_dPair_second = (Base_dData_dList.dtp_pack ((Base_dData_dList.v_Base_dData_dList_ddrop (at + 1)) cs)) })))) (((v_Vuna_dCompiler_dFrontend_dRast_dName_dlastDotAt 0) cs) (0 - 1)))) (Base_dData_dList.dtp_unpack name)))

# 109 "Vuna/Compiler/Frontend/Rast/Name.vuna"
let v_Vuna_dCompiler_dFrontend_dRast_dName_disPreludeName = (fun name -> ((Base_dData_dList.v_Base_dData_dList_dmemName name) ((Base_dData_dList.v_Base_dData_dList_dappend (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ("Type", (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ("->", (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ("_", Base_dData_dList.C_Base_dData_dList_dList_Nil))))))) ((Base_dData_dList.v_Base_dData_dList_dappend Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_dpreludeTypeNames) Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_dpreludeValueNames))))

# 69 "Vuna/Compiler/Frontend/Rast/Name.vuna"
let v_Vuna_dCompiler_dFrontend_dRast_dName_dclassifyName = (fun name -> (if (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_disHoleName name) then (C_Vuna_dCompiler_dFrontend_dRast_dName_dRName_RHole (name)) else (if (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_disMacroSyntaxName name) then (match (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dmacroNameOf name) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__18) -> (C_Vuna_dCompiler_dFrontend_dRast_dName_dRName_RMacro (dtb__18))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (C_Vuna_dCompiler_dFrontend_dRast_dName_dRName_RIntrinsic (name))
  | _ -> failwith "DT: impossible branch"
) else (if (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_disInternalSyntaxName name) then (C_Vuna_dCompiler_dFrontend_dRast_dName_dRName_RIntrinsic (name)) else (if (if (v_Vuna_dCompiler_dFrontend_dRast_dName_dhasIntrinsic name) then true else (v_Vuna_dCompiler_dFrontend_dRast_dName_disPreludeName name)) then (C_Vuna_dCompiler_dFrontend_dRast_dName_dRName_RIntrinsic (name)) else (match (v_Vuna_dCompiler_dFrontend_dRast_dName_dsplitGlobalKey name) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__19) -> (C_Vuna_dCompiler_dFrontend_dRast_dName_dRName_RGlobal ((Base_dData_dPair.v_Base_dData_dPair_dfirstOf dtb__19), (Base_dData_dPair.v_Base_dData_dPair_dsecondOf dtb__19)))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (C_Vuna_dCompiler_dFrontend_dRast_dName_dRName_RLocal (name))
  | _ -> failwith "DT: impossible branch"
))))))
