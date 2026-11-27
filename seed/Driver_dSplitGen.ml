open Vuna_runtime
type t_SplitGenCtx = { f_SplitGenCtx_sgcEnv : Lowering_dEnv.t_LwEnv; f_SplitGenCtx_sgcAllDefs : Elab_dTypes.t_DtDef B_dData_dList.t_List; f_SplitGenCtx_sgcDefOwnerT : (string, string) B_dContainer_dHashMap.t_HashMap; f_SplitGenCtx_sgcDataOwnerT : (string, string) B_dContainer_dHashMap.t_HashMap; f_SplitGenCtx_sgcDefUnitT : (string, string) B_dContainer_dHashMap.t_HashMap; f_SplitGenCtx_sgcDataUnitT : (string, string) B_dContainer_dHashMap.t_HashMap; f_SplitGenCtx_sgcOrdered : string B_dData_dList.t_List; f_SplitGenCtx_sgcDefBuckets : (string, Elab_dTypes.t_DtDef B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap; f_SplitGenCtx_sgcDataBuckets : (string, Elab_dTypes.t_DtData B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap; f_SplitGenCtx_sgcNormPath : (string) -> string; f_SplitGenCtx_sgcEffArity : (string, int) B_dContainer_dHashMap.t_HashMap }

# 44 "Vuna/Compiler/Driver/SplitGen.vuna"
let v_compilerPkgPrefix = "Vuna.Compiler."

# 47 "Vuna/Compiler/Driver/SplitGen.vuna"
let v_basePkgPrefix = "Base."

# 50 "Vuna/Compiler/Driver/SplitGen.vuna"
let v_unitPathOf = (fun (dtb_u_u1 : string) -> (if ((B_dData_dString.v_startsWith v_compilerPkgPrefix) dtb_u_u1) then (((dtp_substring (String.length v_compilerPkgPrefix)) ((String.length dtb_u_u1) - (String.length v_compilerPkgPrefix))) dtb_u_u1) else (if ((B_dData_dString.v_startsWith v_basePkgPrefix) dtb_u_u1) then ("B." ^ (((dtp_substring (String.length v_basePkgPrefix)) ((String.length dtb_u_u1) - (String.length v_basePkgPrefix))) dtb_u_u1)) else dtb_u_u1)))

# 41 "Vuna/Compiler/Driver/SplitGen.vuna"
let v_splitUnitOfModule = (fun (dtb_u_u2 : string) -> (Vuna_dTarget_dOcaml_dDecl.v_sanitizeName (v_unitPathOf dtb_u_u2)))

# 61 "Vuna/Compiler/Driver/SplitGen.vuna"
let v_unitOfLocName = (fun (dtb_u_u3 : string) -> (let dtb_u_u4 = (Driver_dOwner.v_modulePrefixOfName dtb_u_u3) in (if (dtb_u_u4 = "") then (v_splitUnitOfModule Driver_dOwner.v_entryOwner) else (v_splitUnitOfModule dtb_u_u4))))

# 69 "Vuna/Compiler/Driver/SplitGen.vuna"
let v_mainInitPrologue = "open Vuna_runtime\nlet () = dt_record_backtrace true\n"

# 77 "Vuna/Compiler/Driver/SplitGen.vuna"
let v_ownerTblOf = (fun (dtb_u_u5 : (string, string) B_dData_dPair.t_Pair B_dData_dList.t_List) -> ((((B_dContainer_dHashMap.v_insertAll B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) dtb_u_u5) (((B_dContainer_dHashMap.v_fromList B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) B_dData_dList.C_List_Nil)))

# 86 "Vuna/Compiler/Driver/SplitGen.vuna"
let rec v_defBucketsGo = (fun (dtb_u_u6 : (string, string) B_dContainer_dHashMap.t_HashMap) (dtb_u_u7 : Elab_dTypes.t_DtDef B_dData_dList.t_List) (dtb_u_u8 : (string, Elab_dTypes.t_DtDef B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) -> (match dtb_u_u7 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u9, dtb_u_u10) -> (let dtb_u_u11 = (match ((((B_dContainer_dHashMap.v_lookup B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) (Elab_dTypes.v_dtDefName dtb_u_u9)) dtb_u_u6) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u14) -> dtb_u_u14
  | B_dData_dMaybe.C_Maybe_Nothing -> ""
  | _ -> failwith "DT: impossible branch"
) in (let dtb_u_u12 = (match ((((B_dContainer_dHashMap.v_lookup B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) dtb_u_u11) dtb_u_u8) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u13) -> dtb_u_u13
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
) in (((v_defBucketsGo dtb_u_u6) dtb_u_u10) (((((B_dContainer_dHashMap.v_insert B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) dtb_u_u11) (B_dData_dList.C_List__x58__x58_ (dtb_u_u9, dtb_u_u12))) dtb_u_u8))))
  | B_dData_dList.C_List_Nil -> dtb_u_u8
  | _ -> failwith "DT: impossible branch"
))

# 83 "Vuna/Compiler/Driver/SplitGen.vuna"
let v_defBucketsOf = (fun (dtb_u_u15 : (string, string) B_dContainer_dHashMap.t_HashMap) (dtb_u_u16 : Elab_dTypes.t_DtDef B_dData_dList.t_List) -> (((v_defBucketsGo dtb_u_u15) (B_dData_dList.v_reverse dtb_u_u16)) (((B_dContainer_dHashMap.v_fromList B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) B_dData_dList.C_List_Nil)))

# 103 "Vuna/Compiler/Driver/SplitGen.vuna"
let rec v_dataBucketsGo = (fun (dtb_u_u17 : (string, string) B_dContainer_dHashMap.t_HashMap) (dtb_u_u18 : Elab_dTypes.t_DtData B_dData_dList.t_List) (dtb_u_u19 : (string, Elab_dTypes.t_DtData B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) -> (match dtb_u_u18 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u20, dtb_u_u21) -> (let dtb_u_u22 = (match ((((B_dContainer_dHashMap.v_lookup B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) (Elab_dTypes.v_dtDataName dtb_u_u20)) dtb_u_u17) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u25) -> dtb_u_u25
  | B_dData_dMaybe.C_Maybe_Nothing -> ""
  | _ -> failwith "DT: impossible branch"
) in (let dtb_u_u23 = (match ((((B_dContainer_dHashMap.v_lookup B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) dtb_u_u22) dtb_u_u19) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u24) -> dtb_u_u24
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
) in (((v_dataBucketsGo dtb_u_u17) dtb_u_u21) (((((B_dContainer_dHashMap.v_insert B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) dtb_u_u22) (B_dData_dList.C_List__x58__x58_ (dtb_u_u20, dtb_u_u23))) dtb_u_u19))))
  | B_dData_dList.C_List_Nil -> dtb_u_u19
  | _ -> failwith "DT: impossible branch"
))

# 100 "Vuna/Compiler/Driver/SplitGen.vuna"
let v_dataBucketsOf = (fun (dtb_u_u26 : (string, string) B_dContainer_dHashMap.t_HashMap) (dtb_u_u27 : Elab_dTypes.t_DtData B_dData_dList.t_List) -> (((v_dataBucketsGo dtb_u_u26) (B_dData_dList.v_reverse dtb_u_u27)) (((B_dContainer_dHashMap.v_fromList B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) B_dData_dList.C_List_Nil)))

# 127 "Vuna/Compiler/Driver/SplitGen.vuna"
let v_knownUnit = (fun (dtb_u_u28 : string B_dData_dList.t_List) (dtb_u_u29 : string) -> ((B_dData_dList.v_memName dtb_u_u29) dtb_u_u28))

# 130 "Vuna/Compiler/Driver/SplitGen.vuna"
let rec v_checkDepsKnown = (fun (dtb_u_u30 : string B_dData_dList.t_List) (dtb_u_u31 : string) (dtb_u_u32 : string B_dData_dList.t_List) -> (match dtb_u_u32 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u33, dtb_u_u34) -> (if (B_dData_dBool.v_not ((v_knownUnit dtb_u_u30) dtb_u_u33)) then (Base_dDiag.v_icInternal (String.concat "" [dtb_u_u31; " references unknown unit `"; dtb_u_u33; "`"])) else (if (B_dData_dBool.v_not ((v_knownUnit dtb_u_u30) dtb_u_u31)) then (Base_dDiag.v_icInternal (String.concat "" ["split unit `"; dtb_u_u31; "` is not in the module order"])) else (((v_checkDepsKnown dtb_u_u30) dtb_u_u31) dtb_u_u34)))
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (0))
  | _ -> failwith "DT: impossible branch"
))

# 141 "Vuna/Compiler/Driver/SplitGen.vuna"
let v_depsInOrder = (fun (dtb_u_u35 : string B_dData_dList.t_List) (dtb_u_u36 : string) (dtb_u_u37 : string B_dData_dList.t_List) -> ((B_dData_dList.v_filter (fun (dtb_u_u38 : string) -> (if (B_dData_dBool.v_not (dtb_u_u38 = dtb_u_u36)) then ((B_dData_dList.v_memName dtb_u_u38) dtb_u_u37) else false))) dtb_u_u35))

# 144 "Vuna/Compiler/Driver/SplitGen.vuna"
let v_unitDepsOf = (fun (dtb_u_u39 : string B_dData_dList.t_List) (dtb_u_u40 : string) (dtb_u_u41 : string B_dData_dList.t_List) -> ((Base_dCommon.v_bind (((v_checkDepsKnown dtb_u_u39) dtb_u_u40) dtb_u_u41)) (fun (dtb_u_u42 : int) -> (Base_dDiag.C_Check_OkC ((((v_depsInOrder dtb_u_u39) dtb_u_u40) dtb_u_u41))))))

# 154 "Vuna/Compiler/Driver/SplitGen.vuna"
let rec v_uniqueSplitNames = (fun (dtb_u_u43 : Driver_dSplit.t_SplitFile B_dData_dList.t_List) (dtb_u_u44 : string B_dData_dList.t_List) -> (match dtb_u_u43 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u45, dtb_u_u46) -> (match dtb_u_u45 with
  | { Driver_dSplit.f_SplitFile_splitName = dtb_u_u47; Driver_dSplit.f_SplitFile_splitText = dtb_u_u48; Driver_dSplit.f_SplitFile_splitDeps = dtb_u_u49 } -> (if ((B_dData_dList.v_memName dtb_u_u47) dtb_u_u44) then false else ((v_uniqueSplitNames dtb_u_u46) (B_dData_dList.C_List__x58__x58_ (dtb_u_u47, dtb_u_u44))))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

# 159 "Vuna/Compiler/Driver/SplitGen.vuna"
let v_checkSplitNames = (fun (dtb_u_u50 : Driver_dSplit.t_SplitFile B_dData_dList.t_List) -> (if ((v_uniqueSplitNames dtb_u_u50) B_dData_dList.C_List_Nil) then (Base_dDiag.C_Check_OkC (0)) else (Base_dDiag.v_icInternal "split unit name collides with another module (codegen unit naming)")))

# 169 "Vuna/Compiler/Driver/SplitGen.vuna"
let v_checkSplitAcyclic = (fun (dtb_u_u51 : Driver_dSplit.t_SplitFile B_dData_dList.t_List) -> (if (Driver_dSplit.v_splitGraphAcyclic dtb_u_u51) then (Base_dDiag.C_Check_OkC (0)) else (Base_dDiag.v_icInternal "split dependency graph has a cycle (unit order is not a DAG)")))

# 180 "Vuna/Compiler/Driver/SplitGen.vuna"
let rec v_effTyHead = (fun (dtb_u_u52 : Core_dTerm.t_Term) -> (match dtb_u_u52 with
  | Core_dTerm.C_Term_TRecord (dtb_u_u53, dtb_u_u54) -> (dtb_u_u53 = Vuna_dIr_dModel.v_irEffTypeName)
  | Core_dTerm.C_Term_TApp (dtb_u_u55, dtb_u_u56, dtb_u_u57) -> (v_effTyHead dtb_u_u55)
  | Core_dTerm.C_Term_TGlobal (dtb_u_u58) -> (dtb_u_u58 = Vuna_dIr_dModel.v_irEffTypeName)
  | _ -> false
))

# 186 "Vuna/Compiler/Driver/SplitGen.vuna"
let rec v_effArityPeel = (fun (dtb_u_u59 : int) (dtb_u_u60 : Core_dTerm.t_Term) -> (match dtb_u_u60 with
  | Core_dTerm.C_Term_TPi (dtb_u_u61, dtb_u_u62, dtb_u_u63, dtb_u_u64, dtb_u_u65) -> ((v_effArityPeel (if (Core_dTerm.v_rigIsErased dtb_u_u63) then dtb_u_u59 else (dtb_u_u59 + 1))) dtb_u_u65)
  | _ -> (if (v_effTyHead dtb_u_u60) then (B_dData_dMaybe.C_Maybe_Just (dtb_u_u59)) else B_dData_dMaybe.C_Maybe_Nothing)
))

# 190 "Vuna/Compiler/Driver/SplitGen.vuna"
let v_effArityOfTy = (fun (dtb_u_u66 : Core_dTerm.t_Term) -> ((v_effArityPeel 0) dtb_u_u66))

# 193 "Vuna/Compiler/Driver/SplitGen.vuna"
let rec v_effArityTblOf = (fun (dtb_u_u67 : Lowering_dEnv.t_LwEnv) (dtb_u_u68 : Elab_dTypes.t_DtDef B_dData_dList.t_List) -> (match dtb_u_u68 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u69, dtb_u_u70) -> (let dtb_u_u71 = ((v_effArityTblOf dtb_u_u67) dtb_u_u70) in (match ((Lowering_dEnv.v_lwGlobalTyOf (Elab_dTypes.v_dtDefName dtb_u_u69)) dtb_u_u67) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u72) -> (match (v_effArityOfTy dtb_u_u72) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u73) -> (((((B_dContainer_dHashMap.v_insert B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) (Elab_dTypes.v_dtDefName dtb_u_u69)) dtb_u_u73) dtb_u_u71)
  | B_dData_dMaybe.C_Maybe_Nothing -> dtb_u_u71
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> dtb_u_u71
  | _ -> failwith "DT: impossible branch"
))
  | B_dData_dList.C_List_Nil -> (((B_dContainer_dHashMap.v_fromList B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) B_dData_dList.C_List_Nil)
  | _ -> failwith "DT: impossible branch"
))

# 205 "Vuna/Compiler/Driver/SplitGen.vuna"
let rec v_effArityOfDefList = (fun (dtb_u_u74 : Elab_dTypes.t_DtDef B_dData_dList.t_List) (dtb_u_u75 : string) -> (match dtb_u_u74 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u76, dtb_u_u77) -> (if ((Elab_dTypes.v_dtDefName dtb_u_u76) = dtb_u_u75) then (v_effArityOfTy (Elab_dTypes.v_dtDefType dtb_u_u76)) else ((v_effArityOfDefList dtb_u_u77) dtb_u_u75))
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 211 "Vuna/Compiler/Driver/SplitGen.vuna"
let v_effPredFor = (fun (dtb_u_u78 : (string, int) B_dContainer_dHashMap.t_HashMap) (dtb_u_u79 : Elab_dTypes.t_DtDef B_dData_dList.t_List) (dtb_u_u80 : string) -> (match ((((B_dContainer_dHashMap.v_lookup B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) dtb_u_u80) dtb_u_u78) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u81) -> (B_dData_dMaybe.C_Maybe_Just (dtb_u_u81))
  | B_dData_dMaybe.C_Maybe_Nothing -> ((v_effArityOfDefList dtb_u_u79) dtb_u_u80)
  | _ -> failwith "DT: impossible branch"
))

# 218 "Vuna/Compiler/Driver/SplitGen.vuna"
let v_directPairOf = (fun (dtb_u_u82 : (string, int) B_dContainer_dHashMap.t_HashMap) (dtb_u_u83 : (string, string) B_dData_dPair.t_Pair) -> (match ((((B_dContainer_dHashMap.v_lookup B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) (B_dData_dPair.v_firstOf dtb_u_u83)) dtb_u_u82) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u84) -> (if (dtb_u_u84 > 0) then (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = ((B_dData_dPair.v_firstOf dtb_u_u83) ^ "__direct"); B_dData_dPair.f_Pair_second = (B_dData_dPair.v_secondOf dtb_u_u83) }, B_dData_dList.C_List_Nil)) else B_dData_dList.C_List_Nil)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 241 "Vuna/Compiler/Driver/SplitGen.vuna"
let v_defsOfUnit = (fun (dtb_u_u85 : t_SplitGenCtx) (dtb_u_u86 : string) -> (match ((((B_dContainer_dHashMap.v_lookup B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) dtb_u_u86) (dtb_u_u85).f_SplitGenCtx_sgcDefBuckets) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u87) -> dtb_u_u87
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 247 "Vuna/Compiler/Driver/SplitGen.vuna"
let v_datasOfUnit = (fun (dtb_u_u88 : t_SplitGenCtx) (dtb_u_u89 : string) -> (match ((((B_dContainer_dHashMap.v_lookup B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) dtb_u_u89) (dtb_u_u88).f_SplitGenCtx_sgcDataBuckets) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u90) -> dtb_u_u90
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 253 "Vuna/Compiler/Driver/SplitGen.vuna"
let v_mapToUnit = (fun (dtb_u_u91 : (string, string) B_dData_dPair.t_Pair B_dData_dList.t_List) -> ((B_dData_dList.v_map (fun (dtb_u_u92 : (string, string) B_dData_dPair.t_Pair) -> { B_dData_dPair.f_Pair_first = (B_dData_dPair.v_firstOf dtb_u_u92); B_dData_dPair.f_Pair_second = (v_splitUnitOfModule (B_dData_dPair.v_secondOf dtb_u_u92)) })) dtb_u_u91))

# 259 "Vuna/Compiler/Driver/SplitGen.vuna"
let v_checkModuleDeclName = (fun (dtb_u_u93 : string B_dData_dList.t_List) (dtb_u_u94 : string) (dtb_u_u95 : string) -> (if (Base_dSource.v_containsDot dtb_u_u95) then (if ((B_dData_dList.v_memName (Driver_dOwner.v_modulePrefixOfName dtb_u_u95)) dtb_u_u93) then (Base_dDiag.C_Check_OkC (0)) else (Base_dDiag.v_icInternal (String.concat "" ["module "; dtb_u_u94; " declares `"; dtb_u_u95; "` whose module prefix `"; (Driver_dOwner.v_modulePrefixOfName dtb_u_u95); "` is not a known module (codegen requires Loader-resolved decls)"]))) else (Base_dDiag.v_icInternal (String.concat "" ["module "; dtb_u_u94; " has an unresolved declaration name `"; dtb_u_u95; "` (codegen requires Loader-resolved decls)"]))))

# 271 "Vuna/Compiler/Driver/SplitGen.vuna"
let rec v_checkModuleDeclNames = (fun (dtb_u_u96 : string B_dData_dList.t_List) (dtb_u_u97 : string) (dtb_u_u98 : string B_dData_dList.t_List) -> (match dtb_u_u98 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u99, dtb_u_u100) -> ((Base_dCommon.v_bind (((v_checkModuleDeclName dtb_u_u96) dtb_u_u97) dtb_u_u99)) (fun (dtb_u_u101 : int) -> (((v_checkModuleDeclNames dtb_u_u96) dtb_u_u97) dtb_u_u100)))
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (0))
  | _ -> failwith "DT: impossible branch"
))

# 278 "Vuna/Compiler/Driver/SplitGen.vuna"
let rec v_checkModuleDecls = (fun (dtb_u_u102 : string B_dData_dList.t_List) (dtb_u_u103 : (string, Frontend_dAst.t_Decl B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match dtb_u_u103 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u104, dtb_u_u105) -> (match dtb_u_u104 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u106; B_dData_dPair.f_Pair_second = dtb_u_u107 } -> ((Base_dCommon.v_bind (((v_checkModuleDeclNames dtb_u_u102) dtb_u_u106) (Driver_dOwner.v_splitDeclNames dtb_u_u107))) (fun (dtb_u_u108 : int) -> ((v_checkModuleDecls dtb_u_u102) dtb_u_u105)))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (0))
  | _ -> failwith "DT: impossible branch"
))

# 289 "Vuna/Compiler/Driver/SplitGen.vuna"
let[@tail_mod_cons] rec v_entryDeclIdentities = (fun (dtb_u_u109 : Frontend_dAst.t_Decl B_dData_dList.t_List) -> (match dtb_u_u109 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u110, dtb_u_u111) -> (match dtb_u_u110 with
  | Frontend_dAst.C_Decl_DSig (dtb_u_u112, dtb_u_u113, dtb_u_u114, dtb_u_u115) -> (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = false; B_dData_dPair.f_Pair_second = dtb_u_u112 }, (v_entryDeclIdentities dtb_u_u111)))
  | Frontend_dAst.C_Decl_DExtern (dtb_u_u116, dtb_u_u117, dtb_u_u118, dtb_u_u119) -> (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = false; B_dData_dPair.f_Pair_second = dtb_u_u116 }, (v_entryDeclIdentities dtb_u_u111)))
  | Frontend_dAst.C_Decl_DData (dtb_u_u120, dtb_u_u121, dtb_u_u122, dtb_u_u123, dtb_u_u124, dtb_u_u125, dtb_u_u126, dtb_u_u127, dtb_u_u128) -> (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = true; B_dData_dPair.f_Pair_second = dtb_u_u120 }, (v_entryDeclIdentities dtb_u_u111)))
  | Frontend_dAst.C_Decl_DRecord (dtb_u_u129, dtb_u_u130, dtb_u_u131, dtb_u_u132, dtb_u_u133, dtb_u_u134, dtb_u_u135, dtb_u_u136) -> (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = true; B_dData_dPair.f_Pair_second = dtb_u_u129 }, (v_entryDeclIdentities dtb_u_u111)))
  | Frontend_dAst.C_Decl_DTrait (dtb_u_u137, dtb_u_u138, dtb_u_u139, dtb_u_u140, dtb_u_u141) -> (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = true; B_dData_dPair.f_Pair_second = dtb_u_u137 }, (v_entryDeclIdentities dtb_u_u111)))
  | _ -> (v_entryDeclIdentities dtb_u_u111)
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 302 "Vuna/Compiler/Driver/SplitGen.vuna"
let v_entryDeclKey = (fun (dtb_u_u142 : (bool, string) B_dData_dPair.t_Pair) -> (match dtb_u_u142 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u143; B_dData_dPair.f_Pair_second = dtb_u_u144 } -> (if dtb_u_u143 then ("type\t" ^ dtb_u_u144) else ("value\t" ^ dtb_u_u144))
  | _ -> failwith "DT: impossible branch"
))

# 306 "Vuna/Compiler/Driver/SplitGen.vuna"
let v_checkEntryDeclName = (fun (dtb_u_u145 : string B_dData_dList.t_List) (dtb_u_u146 : (bool, string) B_dData_dPair.t_Pair) -> (let dtb_u_u147 = (B_dData_dPair.v_secondOf dtb_u_u146) in (let dtb_u_u148 = (v_entryDeclKey dtb_u_u146) in (if (dtb_u_u147 = "") then (Base_dDiag.v_icInternal "entry declaration has an empty name") else (if (Base_dSource.v_containsDot dtb_u_u147) then (Base_dDiag.v_icInternal (String.concat "" ["entry declaration `"; dtb_u_u147; "` must not contain a module prefix (codegen requires Loader-resolved decls)"])) else (if ((B_dData_dList.v_memName dtb_u_u148) dtb_u_u145) then (Base_dDiag.v_icInternal (String.concat "" ["duplicate entry declaration `"; dtb_u_u147; "`"])) else (Base_dDiag.C_Check_OkC (0))))))))

# 318 "Vuna/Compiler/Driver/SplitGen.vuna"
let rec v_checkEntryDeclsGo = (fun (dtb_u_u149 : string B_dData_dList.t_List) (dtb_u_u150 : (bool, string) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match dtb_u_u150 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u151, dtb_u_u152) -> ((Base_dCommon.v_bind ((v_checkEntryDeclName dtb_u_u149) dtb_u_u151)) (fun (dtb_u_u153 : int) -> ((v_checkEntryDeclsGo (B_dData_dList.C_List__x58__x58_ ((v_entryDeclKey dtb_u_u151), dtb_u_u149))) dtb_u_u152)))
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (0))
  | _ -> failwith "DT: impossible branch"
))

# 325 "Vuna/Compiler/Driver/SplitGen.vuna"
let v_checkEntryDecls = (fun (dtb_u_u154 : Frontend_dAst.t_Decl B_dData_dList.t_List) -> ((v_checkEntryDeclsGo B_dData_dList.C_List_Nil) (v_entryDeclIdentities dtb_u_u154)))

# 330 "Vuna/Compiler/Driver/SplitGen.vuna"
let rec v_checkDefOwners = (fun (dtb_u_u155 : Driver_dOwner.t_SplitMeta) (dtb_u_u156 : Elab_dTypes.t_DtDef B_dData_dList.t_List) -> (match dtb_u_u156 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u157, dtb_u_u158) -> ((Base_dCommon.v_bind ((Driver_dOwner.v_splitDefOwnerOf dtb_u_u155) (Elab_dTypes.v_dtDefName dtb_u_u157))) (fun (dtb_u_u159 : string) -> ((v_checkDefOwners dtb_u_u155) dtb_u_u158)))
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (0))
  | _ -> failwith "DT: impossible branch"
))

# 337 "Vuna/Compiler/Driver/SplitGen.vuna"
let rec v_checkDataOwners = (fun (dtb_u_u160 : Driver_dOwner.t_SplitMeta) (dtb_u_u161 : Elab_dTypes.t_DtData B_dData_dList.t_List) -> (match dtb_u_u161 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u162, dtb_u_u163) -> ((Base_dCommon.v_bind ((Driver_dOwner.v_splitDataOwnerOf dtb_u_u160) dtb_u_u162)) (fun (dtb_u_u164 : string) -> ((v_checkDataOwners dtb_u_u160) dtb_u_u163)))
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (0))
  | _ -> failwith "DT: impossible branch"
))

# 342 "Vuna/Compiler/Driver/SplitGen.vuna"
let v_checkResolvedModules = (fun (dtb_u_u165 : Driver_dOwner.t_SplitMeta) (dtb_u_u166 : (string, Frontend_dAst.t_Decl B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u167 : Frontend_dAst.t_Decl B_dData_dList.t_List) (dtb_u_u168 : Elab_dTypes.t_DtDef B_dData_dList.t_List) (dtb_u_u169 : Elab_dTypes.t_DtData B_dData_dList.t_List) -> ((Base_dCommon.v_bind ((v_checkModuleDecls (dtb_u_u165).Driver_dOwner.f_SplitMeta_smKnownModules) dtb_u_u166)) (fun (dtb_u_u170 : int) -> ((Base_dCommon.v_bind (v_checkEntryDecls dtb_u_u167)) (fun (dtb_u_u171 : int) -> ((Base_dCommon.v_bind ((v_checkDefOwners dtb_u_u165) dtb_u_u168)) (fun (dtb_u_u172 : int) -> ((v_checkDataOwners dtb_u_u165) dtb_u_u169))))))))

# 354 "Vuna/Compiler/Driver/SplitGen.vuna"
let v_splitStripPrefix = Base_dSource.v_stripPathPrefix

# 357 "Vuna/Compiler/Driver/SplitGen.vuna"
let v_splitStripRoots = Base_dSource.v_stripRootsPath

# 360 "Vuna/Compiler/Driver/SplitGen.vuna"
let v_splitStripDotSlash = Base_dSource.v_stripDotSlashPath

# 363 "Vuna/Compiler/Driver/SplitGen.vuna"
let v_splitLocPath = (fun (dtb_u_u173 : string B_dData_dList.t_List) (dtb_u_u174 : string) (dtb_u_u175 : string) -> (((Base_dSource.v_locationPathUnder dtb_u_u173) dtb_u_u174) dtb_u_u175))

# 370 "Vuna/Compiler/Driver/SplitGen.vuna"
let rec v_helperInText = (fun (dtb_u_u176 : string) (dtb_u_u177 : string B_dData_dList.t_List) -> (match dtb_u_u177 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u178, dtb_u_u179) -> (if ((B_dData_dString.v_contains dtb_u_u176) dtb_u_u178) then true else ((v_helperInText dtb_u_u176) dtb_u_u179))
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 374 "Vuna/Compiler/Driver/SplitGen.vuna"
let rec v_helperInTexts = (fun (dtb_u_u180 : string B_dData_dList.t_List) (dtb_u_u181 : string B_dData_dList.t_List) -> (match dtb_u_u180 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u182, dtb_u_u183) -> (if ((v_helperInText dtb_u_u182) dtb_u_u181) then true else ((v_helperInTexts dtb_u_u183) dtb_u_u181))
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 380 "Vuna/Compiler/Driver/SplitGen.vuna"
let v_dtRuntimeFor = (fun (dtb_u_u184 : Vuna_dIr_dModel.t_IrShared) (dtb_u_u185 : bool) (dtb_u_u186 : string B_dData_dList.t_List) -> (((((((((Vuna_dTarget_dOcaml_dTerm.v_dtRuntimeWith (dtb_u_u184).Vuna_dIr_dModel.f_IrShared_irSharedUsesFloat) (dtb_u_u184).Vuna_dIr_dModel.f_IrShared_irSharedUsesTrace) (dtb_u_u184).Vuna_dIr_dModel.f_IrShared_irSharedUsesObs) (dtb_u_u184).Vuna_dIr_dModel.f_IrShared_irSharedUsesHost) (if (dtb_u_u184).Vuna_dIr_dModel.f_IrShared_irSharedUsesSched then true else dtb_u_u185)) (if (dtb_u_u184).Vuna_dIr_dModel.f_IrShared_irSharedUsesEff then true else dtb_u_u185)) ((v_helperInTexts Vuna_dTarget_dOcaml_dTerm.v_dtStrHelperNames) dtb_u_u186)) ((v_helperInTexts Vuna_dTarget_dOcaml_dTerm.v_dtArrHelperNames) dtb_u_u186)) ((v_helperInTexts Vuna_dTarget_dOcaml_dTerm.v_dtBufHelperNames) dtb_u_u186)))

# 394 "Vuna/Compiler/Driver/SplitGen.vuna"
let v_entryIsActionM = (fun (dtb_u_u187 : Vuna_dIr_dModel.t_IrEntry B_dData_dMaybe.t_Maybe) -> (match dtb_u_u187 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u188) -> (Vuna_dIr_dModel.v_irEntryIsActionOf dtb_u_u188)
  | B_dData_dMaybe.C_Maybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
))

# 542 "Vuna/Compiler/Driver/SplitGen.vuna"
let rec v_splitModuleFiles = (fun (dtb_u_u190 : t_SplitGenCtx) (dtb_u_u191 : (string, Frontend_dAst.t_Decl B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match dtb_u_u191 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u192, dtb_u_u193) -> (match dtb_u_u192 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u194; B_dData_dPair.f_Pair_second = dtb_u_u195 } -> (let dtb_u_u196 = (v_splitUnitOfModule dtb_u_u194) in (let dtb_u_u197 = ((v_datasOfUnit dtb_u_u190) dtb_u_u194) in (let dtb_u_u198 = ((v_defsOfUnit dtb_u_u190) dtb_u_u194) in (let dtb_u_u199 = { Vuna_dTarget_dOcaml_dDecl.f_QualCtx_qcUnit = dtb_u_u196; Vuna_dTarget_dOcaml_dDecl.f_QualCtx_qcDefs = (dtb_u_u190).f_SplitGenCtx_sgcDefUnitT; Vuna_dTarget_dOcaml_dDecl.f_QualCtx_qcDatas = (dtb_u_u190).f_SplitGenCtx_sgcDataUnitT } in (let dtb_u_u200 = ((Lowering_dEnv.v_lwEnvWithUnit dtb_u_u196) (dtb_u_u190).f_SplitGenCtx_sgcEnv) in (match (((Lowering_dProgram.v_lowerUnitCheckedFrom dtb_u_u200) dtb_u_u197) dtb_u_u198) with
  | Base_dDiag.C_Check_ErrC (dtb_u_u201) -> (let dtb_u_u203 = (Base_dDiag.C_Check_ErrC (dtb_u_u201)) in (Obj.repr ((fun (dtb_u_u204 : B_dEffect_dCore.t_EffUnit) -> dtb_u_u203))))
  | Base_dDiag.C_Check_OkC (dtb_u_u205) -> (let dtb_u_u206 = ((Vuna_dIr_dDirect.v_directUnit ((v_effPredFor (dtb_u_u190).f_SplitGenCtx_sgcEffArity) dtb_u_u198)) dtb_u_u205) in (match ((((Vuna_dTarget_dOcaml_dAssembly.v_genUnitPartsWith (dtb_u_u190).f_SplitGenCtx_sgcNormPath) dtb_u_u199) (Lowering_dEnv.v_lwEnvShared dtb_u_u200)) dtb_u_u206) with
  | Base_dDiag.C_Check_ErrC (dtb_u_u207) -> (let dtb_u_u209 = (Base_dDiag.C_Check_ErrC (dtb_u_u207)) in (Obj.repr ((fun (dtb_u_u210 : B_dEffect_dCore.t_EffUnit) -> dtb_u_u209))))
  | Base_dDiag.C_Check_OkC (dtb_u_u211) -> (Obj.repr ((fun (dtb_u_u216 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u219 = (((v_splitModuleFiles_u_udirect dtb_u_u190) dtb_u_u193) dtb_u_u216) in (match dtb_u_u219 with
  | Base_dDiag.C_Check_ErrC (dtb_u_u220) -> (let dtb_u_u222 = (Base_dDiag.C_Check_ErrC (dtb_u_u220)) in dtb_u_u222)
  | Base_dDiag.C_Check_OkC (dtb_u_u224) -> (match (((v_unitDepsOf (dtb_u_u190).f_SplitGenCtx_sgcOrdered) dtb_u_u196) (Vuna_dTarget_dOcaml_dAssembly.v_unitPartsDeps dtb_u_u211)) with
  | Base_dDiag.C_Check_ErrC (dtb_u_u225) -> (let dtb_u_u227 = (Base_dDiag.C_Check_ErrC (dtb_u_u225)) in dtb_u_u227)
  | Base_dDiag.C_Check_OkC (dtb_u_u229) -> (let dtb_u_u230 = { Driver_dSplit.f_SplitFile_splitName = (dtb_u_u196 ^ ".ml"); Driver_dSplit.f_SplitFile_splitText = ((Vuna_dTarget_dOcaml_dAssembly.v_genUnitText dtb_u_u211) ^ "\n"); Driver_dSplit.f_SplitFile_splitDeps = dtb_u_u229 } in (let dtb_u_u232 = (Base_dDiag.C_Check_OkC ((B_dData_dList.C_List__x58__x58_ (dtb_u_u230, dtb_u_u224)))) in dtb_u_u232))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))))
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
))))))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (let dtb_u_u235 = (Base_dDiag.C_Check_OkC (B_dData_dList.C_List_Nil)) in (Obj.repr ((fun (dtb_u_u236 : B_dEffect_dCore.t_EffUnit) -> dtb_u_u235))))
  | _ -> failwith "DT: impossible branch"
))
# 542 "Vuna/Compiler/Driver/SplitGen.vuna"
and v_splitModuleFiles_u_udirect = (fun (mc0 : t_SplitGenCtx) (mc1 : (string, Frontend_dAst.t_Decl B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) _u_ueffTok -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u192, dtb_u_u193) -> (match dtb_u_u192 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u194; B_dData_dPair.f_Pair_second = dtb_u_u195 } -> (let dtb_u_u196 = (v_splitUnitOfModule dtb_u_u194) in (let dtb_u_u197 = ((v_datasOfUnit mc0) dtb_u_u194) in (let dtb_u_u198 = ((v_defsOfUnit mc0) dtb_u_u194) in (let dtb_u_u199 = { Vuna_dTarget_dOcaml_dDecl.f_QualCtx_qcUnit = dtb_u_u196; Vuna_dTarget_dOcaml_dDecl.f_QualCtx_qcDefs = (mc0).f_SplitGenCtx_sgcDefUnitT; Vuna_dTarget_dOcaml_dDecl.f_QualCtx_qcDatas = (mc0).f_SplitGenCtx_sgcDataUnitT } in (let dtb_u_u200 = ((Lowering_dEnv.v_lwEnvWithUnit dtb_u_u196) (mc0).f_SplitGenCtx_sgcEnv) in (match (((Lowering_dProgram.v_lowerUnitCheckedFrom dtb_u_u200) dtb_u_u197) dtb_u_u198) with
  | Base_dDiag.C_Check_ErrC (dtb_u_u201) -> (let dtb_u_u203 = (Base_dDiag.C_Check_ErrC (dtb_u_u201)) in dtb_u_u203)
  | Base_dDiag.C_Check_OkC (dtb_u_u205) -> (let dtb_u_u206 = ((Vuna_dIr_dDirect.v_directUnit ((v_effPredFor (mc0).f_SplitGenCtx_sgcEffArity) dtb_u_u198)) dtb_u_u205) in (match ((((Vuna_dTarget_dOcaml_dAssembly.v_genUnitPartsWith (mc0).f_SplitGenCtx_sgcNormPath) dtb_u_u199) (Lowering_dEnv.v_lwEnvShared dtb_u_u200)) dtb_u_u206) with
  | Base_dDiag.C_Check_ErrC (dtb_u_u207) -> (let dtb_u_u209 = (Base_dDiag.C_Check_ErrC (dtb_u_u207)) in dtb_u_u209)
  | Base_dDiag.C_Check_OkC (dtb_u_u211) -> (let dtb_u_u219 = (((v_splitModuleFiles_u_udirect mc0) dtb_u_u193) _u_ueffTok) in (match dtb_u_u219 with
  | Base_dDiag.C_Check_ErrC (dtb_u_u220) -> (let dtb_u_u222 = (Base_dDiag.C_Check_ErrC (dtb_u_u220)) in dtb_u_u222)
  | Base_dDiag.C_Check_OkC (dtb_u_u224) -> (match (((v_unitDepsOf (mc0).f_SplitGenCtx_sgcOrdered) dtb_u_u196) (Vuna_dTarget_dOcaml_dAssembly.v_unitPartsDeps dtb_u_u211)) with
  | Base_dDiag.C_Check_ErrC (dtb_u_u225) -> (let dtb_u_u227 = (Base_dDiag.C_Check_ErrC (dtb_u_u225)) in dtb_u_u227)
  | Base_dDiag.C_Check_OkC (dtb_u_u229) -> (let dtb_u_u230 = { Driver_dSplit.f_SplitFile_splitName = (dtb_u_u196 ^ ".ml"); Driver_dSplit.f_SplitFile_splitText = ((Vuna_dTarget_dOcaml_dAssembly.v_genUnitText dtb_u_u211) ^ "\n"); Driver_dSplit.f_SplitFile_splitDeps = dtb_u_u229 } in (let dtb_u_u232 = (Base_dDiag.C_Check_OkC ((B_dData_dList.C_List__x58__x58_ (dtb_u_u230, dtb_u_u224)))) in dtb_u_u232))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
))))))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (let dtb_u_u235 = (Base_dDiag.C_Check_OkC (B_dData_dList.C_List_Nil)) in dtb_u_u235)
  | _ -> failwith "DT: impossible branch"
))

# 572 "Vuna/Compiler/Driver/SplitGen.vuna"
let v_splitMainFile = (fun (dtb_u_u238 : t_SplitGenCtx) (dtb_u_u239 : bool) -> (let dtb_u_u240 = (v_splitUnitOfModule Driver_dOwner.v_entryOwner) in (let dtb_u_u241 = ((v_defsOfUnit dtb_u_u238) Driver_dOwner.v_entryOwner) in (let dtb_u_u242 = ((v_datasOfUnit dtb_u_u238) Driver_dOwner.v_entryOwner) in (let dtb_u_u243 = { Vuna_dTarget_dOcaml_dDecl.f_QualCtx_qcUnit = dtb_u_u240; Vuna_dTarget_dOcaml_dDecl.f_QualCtx_qcDefs = (dtb_u_u238).f_SplitGenCtx_sgcDefUnitT; Vuna_dTarget_dOcaml_dDecl.f_QualCtx_qcDatas = (dtb_u_u238).f_SplitGenCtx_sgcDataUnitT } in (let dtb_u_u244 = ((Lowering_dEnv.v_lwEnvWithUnit dtb_u_u240) (dtb_u_u238).f_SplitGenCtx_sgcEnv) in (match (((Lowering_dProgram.v_lowerUnitCheckedFrom dtb_u_u244) dtb_u_u242) dtb_u_u241) with
  | Base_dDiag.C_Check_ErrC (dtb_u_u245) -> (let dtb_u_u247 = (Base_dDiag.C_Check_ErrC (dtb_u_u245)) in (Obj.repr ((fun (dtb_u_u248 : B_dEffect_dCore.t_EffUnit) -> dtb_u_u247))))
  | Base_dDiag.C_Check_OkC (dtb_u_u249) -> (let dtb_u_u250 = ((Vuna_dIr_dDirect.v_directUnit ((v_effPredFor (dtb_u_u238).f_SplitGenCtx_sgcEffArity) dtb_u_u241)) dtb_u_u249) in (match (Lowering_dEntry.v_lowerEntryOf (dtb_u_u238).f_SplitGenCtx_sgcAllDefs) with
  | Base_dDiag.C_Check_ErrC (dtb_u_u251) -> (let dtb_u_u253 = (Base_dDiag.C_Check_ErrC (dtb_u_u251)) in (Obj.repr ((fun (dtb_u_u254 : B_dEffect_dCore.t_EffUnit) -> dtb_u_u253))))
  | Base_dDiag.C_Check_OkC (dtb_u_u255) -> (match dtb_u_u255 with
  | B_dData_dMaybe.C_Maybe_Nothing -> (let dtb_u_u257 = (Base_dDiagnostics_dCg.v_cgErr0 Base_dDiagnostics_dCg.C_CgErr_NoMain) in (Obj.repr ((fun (dtb_u_u258 : B_dEffect_dCore.t_EffUnit) -> dtb_u_u257))))
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u259) -> (match ((((Vuna_dTarget_dOcaml_dAssembly.v_genUnitPartsWith (dtb_u_u238).f_SplitGenCtx_sgcNormPath) dtb_u_u243) (Lowering_dEnv.v_lwEnvShared dtb_u_u244)) dtb_u_u250) with
  | Base_dDiag.C_Check_ErrC (dtb_u_u260) -> (let dtb_u_u262 = (Base_dDiag.C_Check_ErrC (dtb_u_u260)) in (Obj.repr ((fun (dtb_u_u263 : B_dEffect_dCore.t_EffUnit) -> dtb_u_u262))))
  | Base_dDiag.C_Check_OkC (dtb_u_u264) -> (match (((Vuna_dTarget_dOcaml_dTerm.v_genEntryHook (((Vuna_dTarget_dOcaml_dTerm.v_mkGenStWith (dtb_u_u238).f_SplitGenCtx_sgcNormPath) dtb_u_u243) (Lowering_dEnv.v_lwEnvShared dtb_u_u244))) dtb_u_u259) dtb_u_u239) with
  | Base_dDiag.C_Check_ErrC (dtb_u_u265) -> (let dtb_u_u267 = (Base_dDiag.C_Check_ErrC (dtb_u_u265)) in (Obj.repr ((fun (dtb_u_u268 : B_dEffect_dCore.t_EffUnit) -> dtb_u_u267))))
  | Base_dDiag.C_Check_OkC (dtb_u_u269) -> (match (((v_unitDepsOf (dtb_u_u238).f_SplitGenCtx_sgcOrdered) dtb_u_u240) ((B_dData_dList.v_append ((B_dData_dList.v_append (Vuna_dTarget_dOcaml_dAssembly.v_unitPartsDeps dtb_u_u264)) (B_dData_dPair.v_secondOf dtb_u_u269))) (B_dData_dList.C_List__x58__x58_ (Vuna_dTarget_dOcaml_dAssembly.v_deflocsUnit, B_dData_dList.C_List_Nil)))) with
  | Base_dDiag.C_Check_ErrC (dtb_u_u270) -> (let dtb_u_u272 = (Base_dDiag.C_Check_ErrC (dtb_u_u270)) in (Obj.repr ((fun (dtb_u_u273 : B_dEffect_dCore.t_EffUnit) -> dtb_u_u272))))
  | Base_dDiag.C_Check_OkC (dtb_u_u274) -> (let dtb_u_u275 = { Driver_dSplit.f_SplitFile_splitName = "Main.ml"; Driver_dSplit.f_SplitFile_splitText = (String.concat "" [v_mainInitPrologue; (Vuna_dTarget_dOcaml_dAssembly.v_genUnitText dtb_u_u264); (B_dData_dPair.v_firstOf dtb_u_u269)]); Driver_dSplit.f_SplitFile_splitDeps = dtb_u_u274 } in (let dtb_u_u277 = (Base_dDiag.C_Check_OkC (dtb_u_u275)) in (Obj.repr ((fun (dtb_u_u278 : B_dEffect_dCore.t_EffUnit) -> dtb_u_u277)))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
)))))))

# 572 "Vuna/Compiler/Driver/SplitGen.vuna"
let v_splitMainFile_u_udirect = (fun (ctx : t_SplitGenCtx) (printResult : bool) _u_ueffTok -> (let dtb_u_u240 = (v_splitUnitOfModule Driver_dOwner.v_entryOwner) in (let dtb_u_u241 = ((v_defsOfUnit ctx) Driver_dOwner.v_entryOwner) in (let dtb_u_u242 = ((v_datasOfUnit ctx) Driver_dOwner.v_entryOwner) in (let dtb_u_u243 = { Vuna_dTarget_dOcaml_dDecl.f_QualCtx_qcUnit = dtb_u_u240; Vuna_dTarget_dOcaml_dDecl.f_QualCtx_qcDefs = (ctx).f_SplitGenCtx_sgcDefUnitT; Vuna_dTarget_dOcaml_dDecl.f_QualCtx_qcDatas = (ctx).f_SplitGenCtx_sgcDataUnitT } in (let dtb_u_u244 = ((Lowering_dEnv.v_lwEnvWithUnit dtb_u_u240) (ctx).f_SplitGenCtx_sgcEnv) in (match (((Lowering_dProgram.v_lowerUnitCheckedFrom dtb_u_u244) dtb_u_u242) dtb_u_u241) with
  | Base_dDiag.C_Check_ErrC (dtb_u_u245) -> (let dtb_u_u247 = (Base_dDiag.C_Check_ErrC (dtb_u_u245)) in dtb_u_u247)
  | Base_dDiag.C_Check_OkC (dtb_u_u249) -> (let dtb_u_u250 = ((Vuna_dIr_dDirect.v_directUnit ((v_effPredFor (ctx).f_SplitGenCtx_sgcEffArity) dtb_u_u241)) dtb_u_u249) in (match (Lowering_dEntry.v_lowerEntryOf (ctx).f_SplitGenCtx_sgcAllDefs) with
  | Base_dDiag.C_Check_ErrC (dtb_u_u251) -> (let dtb_u_u253 = (Base_dDiag.C_Check_ErrC (dtb_u_u251)) in dtb_u_u253)
  | Base_dDiag.C_Check_OkC (dtb_u_u255) -> (match dtb_u_u255 with
  | B_dData_dMaybe.C_Maybe_Nothing -> (let dtb_u_u257 = (Base_dDiagnostics_dCg.v_cgErr0 Base_dDiagnostics_dCg.C_CgErr_NoMain) in dtb_u_u257)
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u259) -> (match ((((Vuna_dTarget_dOcaml_dAssembly.v_genUnitPartsWith (ctx).f_SplitGenCtx_sgcNormPath) dtb_u_u243) (Lowering_dEnv.v_lwEnvShared dtb_u_u244)) dtb_u_u250) with
  | Base_dDiag.C_Check_ErrC (dtb_u_u260) -> (let dtb_u_u262 = (Base_dDiag.C_Check_ErrC (dtb_u_u260)) in dtb_u_u262)
  | Base_dDiag.C_Check_OkC (dtb_u_u264) -> (match (((Vuna_dTarget_dOcaml_dTerm.v_genEntryHook (((Vuna_dTarget_dOcaml_dTerm.v_mkGenStWith (ctx).f_SplitGenCtx_sgcNormPath) dtb_u_u243) (Lowering_dEnv.v_lwEnvShared dtb_u_u244))) dtb_u_u259) printResult) with
  | Base_dDiag.C_Check_ErrC (dtb_u_u265) -> (let dtb_u_u267 = (Base_dDiag.C_Check_ErrC (dtb_u_u265)) in dtb_u_u267)
  | Base_dDiag.C_Check_OkC (dtb_u_u269) -> (match (((v_unitDepsOf (ctx).f_SplitGenCtx_sgcOrdered) dtb_u_u240) ((B_dData_dList.v_append ((B_dData_dList.v_append (Vuna_dTarget_dOcaml_dAssembly.v_unitPartsDeps dtb_u_u264)) (B_dData_dPair.v_secondOf dtb_u_u269))) (B_dData_dList.C_List__x58__x58_ (Vuna_dTarget_dOcaml_dAssembly.v_deflocsUnit, B_dData_dList.C_List_Nil)))) with
  | Base_dDiag.C_Check_ErrC (dtb_u_u270) -> (let dtb_u_u272 = (Base_dDiag.C_Check_ErrC (dtb_u_u270)) in dtb_u_u272)
  | Base_dDiag.C_Check_OkC (dtb_u_u274) -> (let dtb_u_u275 = { Driver_dSplit.f_SplitFile_splitName = "Main.ml"; Driver_dSplit.f_SplitFile_splitText = (String.concat "" [v_mainInitPrologue; (Vuna_dTarget_dOcaml_dAssembly.v_genUnitText dtb_u_u264); (B_dData_dPair.v_firstOf dtb_u_u269)]); Driver_dSplit.f_SplitFile_splitDeps = dtb_u_u274 } in (let dtb_u_u277 = (Base_dDiag.C_Check_OkC (dtb_u_u275)) in dtb_u_u277))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
)))))))

# 483 "Vuna/Compiler/Driver/SplitGen.vuna"
let v_splitWithOwners = (fun (dtb_u_u280 : Lowering_dEnv.t_LwEnv) (dtb_u_u281 : (string, Frontend_dAst.t_Decl B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u282 : bool) (dtb_u_u283 : Elab_dTypes.t_DtData B_dData_dList.t_List) (dtb_u_u284 : Elab_dTypes.t_DtDef B_dData_dList.t_List) (dtb_u_u285 : (string, string) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u286 : (string, string) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u287 : (string) -> string) (dtb_u_u288 : Vuna_dIr_dModel.t_IrShared) (dtb_u_u289 : bool) (dtb_u_u290 : (string, (string, int) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (let dtb_u_u291 = ((v_effArityTblOf dtb_u_u280) dtb_u_u284) in (let dtb_u_u292 = ((B_dData_dList.v_append dtb_u_u285) ((B_dData_dList.v_concatMap (v_directPairOf dtb_u_u291)) dtb_u_u285)) in (let dtb_u_u293 = (v_ownerTblOf dtb_u_u292) in (let dtb_u_u294 = (v_ownerTblOf dtb_u_u286) in (let dtb_u_u295 = (Vuna_dTarget_dOcaml_dDecl.v_unitTblOf (v_mapToUnit dtb_u_u292)) in (let dtb_u_u296 = (Vuna_dTarget_dOcaml_dDecl.v_unitTblOf (v_mapToUnit dtb_u_u286)) in (let dtb_u_u297 = ((B_dData_dList.v_append ((B_dData_dList.v_append (B_dData_dList.C_List__x58__x58_ (Vuna_dTarget_dOcaml_dAssembly.v_runtimeUnit, (B_dData_dList.C_List__x58__x58_ (Vuna_dTarget_dOcaml_dAssembly.v_deflocsUnit, B_dData_dList.C_List_Nil))))) ((B_dData_dList.v_map (fun (dtb_u_u341 : (string, Frontend_dAst.t_Decl B_dData_dList.t_List) B_dData_dPair.t_Pair) -> (v_splitUnitOfModule (B_dData_dPair.v_firstOf dtb_u_u341)))) dtb_u_u281))) (B_dData_dList.C_List__x58__x58_ ((v_splitUnitOfModule Driver_dOwner.v_entryOwner), B_dData_dList.C_List_Nil))) in (let dtb_u_u298 = { f_SplitGenCtx_sgcEnv = dtb_u_u280; f_SplitGenCtx_sgcAllDefs = dtb_u_u284; f_SplitGenCtx_sgcDefOwnerT = dtb_u_u293; f_SplitGenCtx_sgcDataOwnerT = dtb_u_u294; f_SplitGenCtx_sgcDefUnitT = dtb_u_u295; f_SplitGenCtx_sgcDataUnitT = dtb_u_u296; f_SplitGenCtx_sgcOrdered = dtb_u_u297; f_SplitGenCtx_sgcDefBuckets = ((v_defBucketsOf dtb_u_u293) dtb_u_u284); f_SplitGenCtx_sgcDataBuckets = ((v_dataBucketsOf dtb_u_u294) dtb_u_u283); f_SplitGenCtx_sgcNormPath = dtb_u_u287; f_SplitGenCtx_sgcEffArity = dtb_u_u291 } in (Obj.repr ((fun (dtb_u_u303 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u306 = (((v_splitModuleFiles_u_udirect dtb_u_u298) dtb_u_u281) dtb_u_u303) in (match dtb_u_u306 with
  | Base_dDiag.C_Check_ErrC (dtb_u_u307) -> (let dtb_u_u309 = (Base_dDiag.C_Check_ErrC (dtb_u_u307)) in dtb_u_u309)
  | Base_dDiag.C_Check_OkC (dtb_u_u311) -> (let dtb_u_u319 = (((v_splitMainFile_u_udirect dtb_u_u298) dtb_u_u282) dtb_u_u303) in (let dtb_u_u321 = (match dtb_u_u319 with
  | Base_dDiag.C_Check_ErrC (dtb_u_u323) -> (Base_dDiag.C_Check_ErrC (dtb_u_u323))
  | Base_dDiag.C_Check_OkC (dtb_u_u324) -> (let dtb_u_u325 = { Driver_dSplit.f_SplitFile_splitName = (Vuna_dTarget_dOcaml_dAssembly.v_runtimeUnit ^ ".ml"); Driver_dSplit.f_SplitFile_splitText = ""; Driver_dSplit.f_SplitFile_splitDeps = B_dData_dList.C_List_Nil } in (let dtb_u_u326 = { Driver_dSplit.f_SplitFile_splitName = (Vuna_dTarget_dOcaml_dAssembly.v_deflocsUnit ^ ".ml"); Driver_dSplit.f_SplitFile_splitText = ""; Driver_dSplit.f_SplitFile_splitDeps = (B_dData_dList.C_List__x58__x58_ (Vuna_dTarget_dOcaml_dAssembly.v_runtimeUnit, B_dData_dList.C_List_Nil)) } in (let dtb_u_u327 = ((Driver_dSplit.v_pruneSplitFiles (B_dData_dList.C_List__x58__x58_ (Vuna_dTarget_dOcaml_dAssembly.v_runtimeUnit, (B_dData_dList.C_List__x58__x58_ (Vuna_dTarget_dOcaml_dAssembly.v_deflocsUnit, (B_dData_dList.C_List__x58__x58_ ((Driver_dSplit.v_splitUnitOfFile dtb_u_u324), B_dData_dList.C_List_Nil))))))) (B_dData_dList.C_List__x58__x58_ (dtb_u_u325, (B_dData_dList.C_List__x58__x58_ (dtb_u_u326, ((B_dData_dList.v_append dtb_u_u311) (B_dData_dList.C_List__x58__x58_ (dtb_u_u324, B_dData_dList.C_List_Nil)))))))) in (let dtb_u_u328 = ((B_dData_dList.v_map Driver_dSplit.v_splitUnitOfFile) dtb_u_u327) in (let dtb_u_u329 = ((B_dData_dList.v_map Driver_dSplit.v_splitText) ((B_dData_dList.v_filter (fun (dtb_u_u340 : Driver_dSplit.t_SplitFile) -> (B_dData_dBool.v_not (if ((Driver_dSplit.v_splitUnitOfFile dtb_u_u340) = Vuna_dTarget_dOcaml_dAssembly.v_runtimeUnit) then true else ((Driver_dSplit.v_splitUnitOfFile dtb_u_u340) = Vuna_dTarget_dOcaml_dAssembly.v_deflocsUnit))))) dtb_u_u327)) in (let dtb_u_u330 = (((v_dtRuntimeFor dtb_u_u288) dtb_u_u289) dtb_u_u329) in (let dtb_u_u331 = ((B_dData_dList.v_filter (fun (dtb_u_u339 : (string, (string, int) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> ((B_dData_dList.v_memName (v_unitOfLocName (B_dData_dPair.v_firstOf dtb_u_u339))) dtb_u_u328))) dtb_u_u290) in (let dtb_u_u332 = (Vuna_dTarget_dOcaml_dTerm.v_dtDefLocsUnit (((Vuna_dTarget_dOcaml_dTerm.v_dtDefLocTable dtb_u_u287) v_unitOfLocName) dtb_u_u331)) in (let dtb_u_u333 = ((B_dData_dList.v_map (fun (dtb_u_u338 : Driver_dSplit.t_SplitFile) -> (if ((Driver_dSplit.v_splitUnitOfFile dtb_u_u338) = Vuna_dTarget_dOcaml_dAssembly.v_runtimeUnit) then { Driver_dSplit.f_SplitFile_splitName = (Driver_dSplit.v_splitName dtb_u_u338); Driver_dSplit.f_SplitFile_splitText = dtb_u_u330; Driver_dSplit.f_SplitFile_splitDeps = (Driver_dSplit.v_splitDeps dtb_u_u338) } else (if ((Driver_dSplit.v_splitUnitOfFile dtb_u_u338) = Vuna_dTarget_dOcaml_dAssembly.v_deflocsUnit) then { Driver_dSplit.f_SplitFile_splitName = (Driver_dSplit.v_splitName dtb_u_u338); Driver_dSplit.f_SplitFile_splitText = dtb_u_u332; Driver_dSplit.f_SplitFile_splitDeps = (Driver_dSplit.v_splitDeps dtb_u_u338) } else dtb_u_u338)))) dtb_u_u327) in (match (v_checkSplitNames dtb_u_u333) with
  | Base_dDiag.C_Check_ErrC (dtb_u_u334) -> (Base_dDiag.C_Check_ErrC (dtb_u_u334))
  | Base_dDiag.C_Check_OkC (dtb_u_u335) -> (match (v_checkSplitAcyclic dtb_u_u333) with
  | Base_dDiag.C_Check_ErrC (dtb_u_u336) -> (Base_dDiag.C_Check_ErrC (dtb_u_u336))
  | Base_dDiag.C_Check_OkC (dtb_u_u337) -> (Base_dDiag.C_Check_OkC (dtb_u_u333))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))))))))
  | _ -> failwith "DT: impossible branch"
) in dtb_u_u321))
  | _ -> failwith "DT: impossible branch"
))))))))))))))

# 483 "Vuna/Compiler/Driver/SplitGen.vuna"
let v_splitWithOwners_u_udirect = (fun (env : Lowering_dEnv.t_LwEnv) (modules : (string, Frontend_dAst.t_Decl B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (printResult : bool) (allDatas : Elab_dTypes.t_DtData B_dData_dList.t_List) (allDefs : Elab_dTypes.t_DtDef B_dData_dList.t_List) (defPairs : (string, string) B_dData_dPair.t_Pair B_dData_dList.t_List) (dataPairs : (string, string) B_dData_dPair.t_Pair B_dData_dList.t_List) (normPath : (string) -> string) (shared : Vuna_dIr_dModel.t_IrShared) (entryIsAction : bool) (locRows : (string, (string, int) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) _u_ueffTok -> (let dtb_u_u291 = ((v_effArityTblOf env) allDefs) in (let dtb_u_u292 = ((B_dData_dList.v_append defPairs) ((B_dData_dList.v_concatMap (v_directPairOf dtb_u_u291)) defPairs)) in (let dtb_u_u293 = (v_ownerTblOf dtb_u_u292) in (let dtb_u_u294 = (v_ownerTblOf dataPairs) in (let dtb_u_u295 = (Vuna_dTarget_dOcaml_dDecl.v_unitTblOf (v_mapToUnit dtb_u_u292)) in (let dtb_u_u296 = (Vuna_dTarget_dOcaml_dDecl.v_unitTblOf (v_mapToUnit dataPairs)) in (let dtb_u_u297 = ((B_dData_dList.v_append ((B_dData_dList.v_append (B_dData_dList.C_List__x58__x58_ (Vuna_dTarget_dOcaml_dAssembly.v_runtimeUnit, (B_dData_dList.C_List__x58__x58_ (Vuna_dTarget_dOcaml_dAssembly.v_deflocsUnit, B_dData_dList.C_List_Nil))))) ((B_dData_dList.v_map (fun (dtb_u_u341 : (string, Frontend_dAst.t_Decl B_dData_dList.t_List) B_dData_dPair.t_Pair) -> (v_splitUnitOfModule (B_dData_dPair.v_firstOf dtb_u_u341)))) modules))) (B_dData_dList.C_List__x58__x58_ ((v_splitUnitOfModule Driver_dOwner.v_entryOwner), B_dData_dList.C_List_Nil))) in (let dtb_u_u298 = { f_SplitGenCtx_sgcEnv = env; f_SplitGenCtx_sgcAllDefs = allDefs; f_SplitGenCtx_sgcDefOwnerT = dtb_u_u293; f_SplitGenCtx_sgcDataOwnerT = dtb_u_u294; f_SplitGenCtx_sgcDefUnitT = dtb_u_u295; f_SplitGenCtx_sgcDataUnitT = dtb_u_u296; f_SplitGenCtx_sgcOrdered = dtb_u_u297; f_SplitGenCtx_sgcDefBuckets = ((v_defBucketsOf dtb_u_u293) allDefs); f_SplitGenCtx_sgcDataBuckets = ((v_dataBucketsOf dtb_u_u294) allDatas); f_SplitGenCtx_sgcNormPath = normPath; f_SplitGenCtx_sgcEffArity = dtb_u_u291 } in (let dtb_u_u306 = (((v_splitModuleFiles_u_udirect dtb_u_u298) modules) _u_ueffTok) in (match dtb_u_u306 with
  | Base_dDiag.C_Check_ErrC (dtb_u_u307) -> (let dtb_u_u309 = (Base_dDiag.C_Check_ErrC (dtb_u_u307)) in dtb_u_u309)
  | Base_dDiag.C_Check_OkC (dtb_u_u311) -> (let dtb_u_u319 = (((v_splitMainFile_u_udirect dtb_u_u298) printResult) _u_ueffTok) in (let dtb_u_u321 = (match dtb_u_u319 with
  | Base_dDiag.C_Check_ErrC (dtb_u_u323) -> (Base_dDiag.C_Check_ErrC (dtb_u_u323))
  | Base_dDiag.C_Check_OkC (dtb_u_u324) -> (let dtb_u_u325 = { Driver_dSplit.f_SplitFile_splitName = (Vuna_dTarget_dOcaml_dAssembly.v_runtimeUnit ^ ".ml"); Driver_dSplit.f_SplitFile_splitText = ""; Driver_dSplit.f_SplitFile_splitDeps = B_dData_dList.C_List_Nil } in (let dtb_u_u326 = { Driver_dSplit.f_SplitFile_splitName = (Vuna_dTarget_dOcaml_dAssembly.v_deflocsUnit ^ ".ml"); Driver_dSplit.f_SplitFile_splitText = ""; Driver_dSplit.f_SplitFile_splitDeps = (B_dData_dList.C_List__x58__x58_ (Vuna_dTarget_dOcaml_dAssembly.v_runtimeUnit, B_dData_dList.C_List_Nil)) } in (let dtb_u_u327 = ((Driver_dSplit.v_pruneSplitFiles (B_dData_dList.C_List__x58__x58_ (Vuna_dTarget_dOcaml_dAssembly.v_runtimeUnit, (B_dData_dList.C_List__x58__x58_ (Vuna_dTarget_dOcaml_dAssembly.v_deflocsUnit, (B_dData_dList.C_List__x58__x58_ ((Driver_dSplit.v_splitUnitOfFile dtb_u_u324), B_dData_dList.C_List_Nil))))))) (B_dData_dList.C_List__x58__x58_ (dtb_u_u325, (B_dData_dList.C_List__x58__x58_ (dtb_u_u326, ((B_dData_dList.v_append dtb_u_u311) (B_dData_dList.C_List__x58__x58_ (dtb_u_u324, B_dData_dList.C_List_Nil)))))))) in (let dtb_u_u328 = ((B_dData_dList.v_map Driver_dSplit.v_splitUnitOfFile) dtb_u_u327) in (let dtb_u_u329 = ((B_dData_dList.v_map Driver_dSplit.v_splitText) ((B_dData_dList.v_filter (fun (dtb_u_u340 : Driver_dSplit.t_SplitFile) -> (B_dData_dBool.v_not (if ((Driver_dSplit.v_splitUnitOfFile dtb_u_u340) = Vuna_dTarget_dOcaml_dAssembly.v_runtimeUnit) then true else ((Driver_dSplit.v_splitUnitOfFile dtb_u_u340) = Vuna_dTarget_dOcaml_dAssembly.v_deflocsUnit))))) dtb_u_u327)) in (let dtb_u_u330 = (((v_dtRuntimeFor shared) entryIsAction) dtb_u_u329) in (let dtb_u_u331 = ((B_dData_dList.v_filter (fun (dtb_u_u339 : (string, (string, int) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> ((B_dData_dList.v_memName (v_unitOfLocName (B_dData_dPair.v_firstOf dtb_u_u339))) dtb_u_u328))) locRows) in (let dtb_u_u332 = (Vuna_dTarget_dOcaml_dTerm.v_dtDefLocsUnit (((Vuna_dTarget_dOcaml_dTerm.v_dtDefLocTable normPath) v_unitOfLocName) dtb_u_u331)) in (let dtb_u_u333 = ((B_dData_dList.v_map (fun (dtb_u_u338 : Driver_dSplit.t_SplitFile) -> (if ((Driver_dSplit.v_splitUnitOfFile dtb_u_u338) = Vuna_dTarget_dOcaml_dAssembly.v_runtimeUnit) then { Driver_dSplit.f_SplitFile_splitName = (Driver_dSplit.v_splitName dtb_u_u338); Driver_dSplit.f_SplitFile_splitText = dtb_u_u330; Driver_dSplit.f_SplitFile_splitDeps = (Driver_dSplit.v_splitDeps dtb_u_u338) } else (if ((Driver_dSplit.v_splitUnitOfFile dtb_u_u338) = Vuna_dTarget_dOcaml_dAssembly.v_deflocsUnit) then { Driver_dSplit.f_SplitFile_splitName = (Driver_dSplit.v_splitName dtb_u_u338); Driver_dSplit.f_SplitFile_splitText = dtb_u_u332; Driver_dSplit.f_SplitFile_splitDeps = (Driver_dSplit.v_splitDeps dtb_u_u338) } else dtb_u_u338)))) dtb_u_u327) in (match (v_checkSplitNames dtb_u_u333) with
  | Base_dDiag.C_Check_ErrC (dtb_u_u334) -> (Base_dDiag.C_Check_ErrC (dtb_u_u334))
  | Base_dDiag.C_Check_OkC (dtb_u_u335) -> (match (v_checkSplitAcyclic dtb_u_u333) with
  | Base_dDiag.C_Check_ErrC (dtb_u_u336) -> (Base_dDiag.C_Check_ErrC (dtb_u_u336))
  | Base_dDiag.C_Check_OkC (dtb_u_u337) -> (Base_dDiag.C_Check_OkC (dtb_u_u333))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))))))))
  | _ -> failwith "DT: impossible branch"
) in dtb_u_u321))
  | _ -> failwith "DT: impossible branch"
)))))))))))

# 459 "Vuna/Compiler/Driver/SplitGen.vuna"
let v_splitProgramChecked = (fun (dtb_u_u343 : Lowering_dEnv.t_LwEnv) (dtb_u_u344 : (string, Frontend_dAst.t_Decl B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u345 : Frontend_dAst.t_Decl B_dData_dList.t_List) (dtb_u_u346 : bool) (dtb_u_u347 : Elab_dTypes.t_DtDef B_dData_dList.t_List) (dtb_u_u348 : Elab_dTypes.t_DtData B_dData_dList.t_List) (dtb_u_u349 : Driver_dOwner.t_SplitMeta) (dtb_u_u350 : (string) -> string) (dtb_u_u351 : Vuna_dIr_dModel.t_IrShared) (dtb_u_u352 : bool) (dtb_u_u353 : (string, (string, int) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match (((((v_checkResolvedModules dtb_u_u349) dtb_u_u344) dtb_u_u345) dtb_u_u347) dtb_u_u348) with
  | Base_dDiag.C_Check_ErrC (dtb_u_u354) -> (let dtb_u_u356 = (Base_dDiag.C_Check_ErrC (dtb_u_u354)) in (Obj.repr ((fun (dtb_u_u357 : B_dEffect_dCore.t_EffUnit) -> dtb_u_u356))))
  | Base_dDiag.C_Check_OkC (dtb_u_u358) -> (match ((Driver_dOwner.v_nameOwnerPairsOfDefs dtb_u_u349) dtb_u_u347) with
  | Base_dDiag.C_Check_ErrC (dtb_u_u359) -> (let dtb_u_u361 = (Base_dDiag.C_Check_ErrC (dtb_u_u359)) in (Obj.repr ((fun (dtb_u_u362 : B_dEffect_dCore.t_EffUnit) -> dtb_u_u361))))
  | Base_dDiag.C_Check_OkC (dtb_u_u363) -> (match ((Driver_dOwner.v_nameOwnerPairsOfDatas dtb_u_u349) dtb_u_u348) with
  | Base_dDiag.C_Check_ErrC (dtb_u_u364) -> (let dtb_u_u366 = (Base_dDiag.C_Check_ErrC (dtb_u_u364)) in (Obj.repr ((fun (dtb_u_u367 : B_dEffect_dCore.t_EffUnit) -> dtb_u_u366))))
  | Base_dDiag.C_Check_OkC (dtb_u_u368) -> (((((((((((v_splitWithOwners dtb_u_u343) dtb_u_u344) dtb_u_u346) dtb_u_u348) dtb_u_u347) dtb_u_u363) dtb_u_u368) dtb_u_u350) dtb_u_u351) dtb_u_u352) dtb_u_u353)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 459 "Vuna/Compiler/Driver/SplitGen.vuna"
let v_splitProgramChecked_u_udirect = (fun (env : Lowering_dEnv.t_LwEnv) (modules : (string, Frontend_dAst.t_Decl B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (entryDecls : Frontend_dAst.t_Decl B_dData_dList.t_List) (printResult : bool) (runtimeDefs : Elab_dTypes.t_DtDef B_dData_dList.t_List) (allDatas : Elab_dTypes.t_DtData B_dData_dList.t_List) (meta : Driver_dOwner.t_SplitMeta) (normPath : (string) -> string) (shared : Vuna_dIr_dModel.t_IrShared) (entryIsAction : bool) (locRows : (string, (string, int) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) _u_ueffTok -> (match (((((v_checkResolvedModules meta) modules) entryDecls) runtimeDefs) allDatas) with
  | Base_dDiag.C_Check_ErrC (dtb_u_u354) -> (let dtb_u_u356 = (Base_dDiag.C_Check_ErrC (dtb_u_u354)) in dtb_u_u356)
  | Base_dDiag.C_Check_OkC (dtb_u_u358) -> (match ((Driver_dOwner.v_nameOwnerPairsOfDefs meta) runtimeDefs) with
  | Base_dDiag.C_Check_ErrC (dtb_u_u359) -> (let dtb_u_u361 = (Base_dDiag.C_Check_ErrC (dtb_u_u359)) in dtb_u_u361)
  | Base_dDiag.C_Check_OkC (dtb_u_u363) -> (match ((Driver_dOwner.v_nameOwnerPairsOfDatas meta) allDatas) with
  | Base_dDiag.C_Check_ErrC (dtb_u_u364) -> (let dtb_u_u366 = (Base_dDiag.C_Check_ErrC (dtb_u_u364)) in dtb_u_u366)
  | Base_dDiag.C_Check_OkC (dtb_u_u368) -> ((Obj.magic (((((((((((v_splitWithOwners env) modules) printResult) allDatas) runtimeDefs) dtb_u_u363) dtb_u_u368) normPath) shared) entryIsAction) locRows)) _u_ueffTok)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 441 "Vuna/Compiler/Driver/SplitGen.vuna"
let v_splitProgramFiles = (fun (dtb_u_u370 : Lowering_dEnv.t_LwEnv) (dtb_u_u371 : (string, Frontend_dAst.t_Decl B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u372 : Frontend_dAst.t_Decl B_dData_dList.t_List) (dtb_u_u373 : bool) (dtb_u_u374 : Elab_dTypes.t_DtDef B_dData_dList.t_List) (dtb_u_u375 : Elab_dTypes.t_DtData B_dData_dList.t_List) (dtb_u_u376 : Driver_dOwner.t_SplitMeta) (dtb_u_u377 : (string) -> string) (dtb_u_u378 : Vuna_dIr_dModel.t_IrShared) (dtb_u_u379 : bool) (dtb_u_u380 : (string, (string, int) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match (Lowering_dProgram.v_checkProgramOf dtb_u_u370) with
  | Base_dDiag.C_Check_ErrC (dtb_u_u381) -> (let dtb_u_u383 = (Base_dDiag.C_Check_ErrC (dtb_u_u381)) in (Obj.repr ((fun (dtb_u_u384 : B_dEffect_dCore.t_EffUnit) -> dtb_u_u383))))
  | Base_dDiag.C_Check_OkC (dtb_u_u385) -> (((((((((((v_splitProgramChecked dtb_u_u370) dtb_u_u371) dtb_u_u372) dtb_u_u373) dtb_u_u374) dtb_u_u375) dtb_u_u376) dtb_u_u377) dtb_u_u378) dtb_u_u379) dtb_u_u380)
  | _ -> failwith "DT: impossible branch"
))

# 441 "Vuna/Compiler/Driver/SplitGen.vuna"
let v_splitProgramFiles_u_udirect = (fun (env : Lowering_dEnv.t_LwEnv) (modules : (string, Frontend_dAst.t_Decl B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (entryDecls : Frontend_dAst.t_Decl B_dData_dList.t_List) (printResult : bool) (runtimeDefs : Elab_dTypes.t_DtDef B_dData_dList.t_List) (allDatas : Elab_dTypes.t_DtData B_dData_dList.t_List) (meta : Driver_dOwner.t_SplitMeta) (normPath : (string) -> string) (shared : Vuna_dIr_dModel.t_IrShared) (entryIsAction : bool) (locRows : (string, (string, int) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) _u_ueffTok -> (match (Lowering_dProgram.v_checkProgramOf env) with
  | Base_dDiag.C_Check_ErrC (dtb_u_u381) -> (let dtb_u_u383 = (Base_dDiag.C_Check_ErrC (dtb_u_u381)) in dtb_u_u383)
  | Base_dDiag.C_Check_OkC (dtb_u_u385) -> ((Obj.magic (((((((((((v_splitProgramChecked env) modules) entryDecls) printResult) runtimeDefs) allDatas) meta) normPath) shared) entryIsAction) locRows)) _u_ueffTok)
  | _ -> failwith "DT: impossible branch"
))

# 398 "Vuna/Compiler/Driver/SplitGen.vuna"
let v_generateDtSplitProgram = (fun (dtb_u_u387 : (string, Frontend_dAst.t_Decl B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u388 : Frontend_dAst.t_Decl B_dData_dList.t_List) (dtb_u_u389 : Elab_dTypes.t_DtProgram) (dtb_u_u390 : bool) (dtb_u_u391 : string B_dData_dList.t_List) (dtb_u_u392 : string) (dtb_u_u393 : (string, (string, int) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match (Lowering_dEnv.v_eraseDefs (Elab_dTypes.v_dtProgDefs dtb_u_u389)) with
  | Base_dDiag.C_Check_ErrC (dtb_u_u394) -> (let dtb_u_u396 = (Base_dDiag.C_Check_ErrC (dtb_u_u394)) in (Obj.repr ((fun (dtb_u_u397 : B_dEffect_dCore.t_EffUnit) -> dtb_u_u396))))
  | Base_dDiag.C_Check_OkC (dtb_u_u398) -> (match (Lowering_dEntry.v_lowerEntryOf dtb_u_u398) with
  | Base_dDiag.C_Check_ErrC (dtb_u_u399) -> (let dtb_u_u401 = (Base_dDiag.C_Check_ErrC (dtb_u_u399)) in (Obj.repr ((fun (dtb_u_u402 : B_dEffect_dCore.t_EffUnit) -> dtb_u_u401))))
  | Base_dDiag.C_Check_OkC (dtb_u_u403) -> (let dtb_u_u404 = (v_entryIsActionM dtb_u_u403) in (let dtb_u_u405 = (if ((dtp_log_on 2) "Vuna.Compiler.Driver.SplitGen") then (((dtp_log_emit 2) "Vuna.Compiler.Driver.SplitGen") "cg-splitstart") else 0) in (let dtb_u_u406 = (Lowering_dEnv.v_rtDatasOf (Elab_dTypes.v_dtProgDatas dtb_u_u389)) in (let dtb_u_u407 = (Lowering_dProgram.v_partitionRuntimeDefs dtb_u_u398) in (let dtb_u_u408 = (((((Lowering_dEnv.v_mkLwEnvFromErased (Elab_dTypes.v_dtProgDatas dtb_u_u389)) dtb_u_u398) (Elab_dTypes.v_dtProgDefs dtb_u_u389)) (Elab_dTypes.v_dtProgGlobals dtb_u_u389)) (v_splitUnitOfModule Driver_dOwner.v_entryOwner)) in (let dtb_u_u409 = (Lowering_dEnv.v_lwEnvShared dtb_u_u408) in (let dtb_u_u410 = ((Driver_dOwner.v_splitMetaOf dtb_u_u387) dtb_u_u388) in (let dtb_u_u411 = (if ((dtp_log_on 2) "Vuna.Compiler.Driver.SplitGen") then (((dtp_log_emit 2) "Vuna.Compiler.Driver.SplitGen") "cg-splitmeta-done") else 0) in (let dtb_u_u412 = ((B_dData_dList.v_append (dtb_u_u409).Vuna_dIr_dModel.f_IrShared_irSharedDefLocs) dtb_u_u393) in (let dtb_u_u413 = (if ((dtp_log_on 2) "Vuna.Compiler.Driver.SplitGen") then (((dtp_log_emit 2) "Vuna.Compiler.Driver.SplitGen") "cg-deflocs-done") else 0) in (((((((((((v_splitProgramFiles dtb_u_u408) dtb_u_u387) dtb_u_u388) dtb_u_u390) dtb_u_u407) dtb_u_u406) dtb_u_u410) ((v_splitLocPath dtb_u_u391) dtb_u_u392)) dtb_u_u409) dtb_u_u404) dtb_u_u412)))))))))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 398 "Vuna/Compiler/Driver/SplitGen.vuna"
let v_generateDtSplitProgram_u_udirect = (fun (modules : (string, Frontend_dAst.t_Decl B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (entryDecls : Frontend_dAst.t_Decl B_dData_dList.t_List) (prog : Elab_dTypes.t_DtProgram) (printResult : bool) (roots : string B_dData_dList.t_List) (contextDir : string) (extraDefLocs : (string, (string, int) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) _u_ueffTok -> (match (Lowering_dEnv.v_eraseDefs (Elab_dTypes.v_dtProgDefs prog)) with
  | Base_dDiag.C_Check_ErrC (dtb_u_u394) -> (let dtb_u_u396 = (Base_dDiag.C_Check_ErrC (dtb_u_u394)) in dtb_u_u396)
  | Base_dDiag.C_Check_OkC (dtb_u_u398) -> (match (Lowering_dEntry.v_lowerEntryOf dtb_u_u398) with
  | Base_dDiag.C_Check_ErrC (dtb_u_u399) -> (let dtb_u_u401 = (Base_dDiag.C_Check_ErrC (dtb_u_u399)) in dtb_u_u401)
  | Base_dDiag.C_Check_OkC (dtb_u_u403) -> (let dtb_u_u404 = (v_entryIsActionM dtb_u_u403) in (let dtb_u_u405 = (if ((dtp_log_on 2) "Vuna.Compiler.Driver.SplitGen") then (((dtp_log_emit 2) "Vuna.Compiler.Driver.SplitGen") "cg-splitstart") else 0) in (let dtb_u_u406 = (Lowering_dEnv.v_rtDatasOf (Elab_dTypes.v_dtProgDatas prog)) in (let dtb_u_u407 = (Lowering_dProgram.v_partitionRuntimeDefs dtb_u_u398) in (let dtb_u_u408 = (((((Lowering_dEnv.v_mkLwEnvFromErased (Elab_dTypes.v_dtProgDatas prog)) dtb_u_u398) (Elab_dTypes.v_dtProgDefs prog)) (Elab_dTypes.v_dtProgGlobals prog)) (v_splitUnitOfModule Driver_dOwner.v_entryOwner)) in (let dtb_u_u409 = (Lowering_dEnv.v_lwEnvShared dtb_u_u408) in (let dtb_u_u410 = ((Driver_dOwner.v_splitMetaOf modules) entryDecls) in (let dtb_u_u411 = (if ((dtp_log_on 2) "Vuna.Compiler.Driver.SplitGen") then (((dtp_log_emit 2) "Vuna.Compiler.Driver.SplitGen") "cg-splitmeta-done") else 0) in (let dtb_u_u412 = ((B_dData_dList.v_append (dtb_u_u409).Vuna_dIr_dModel.f_IrShared_irSharedDefLocs) extraDefLocs) in (let dtb_u_u413 = (if ((dtp_log_on 2) "Vuna.Compiler.Driver.SplitGen") then (((dtp_log_emit 2) "Vuna.Compiler.Driver.SplitGen") "cg-deflocs-done") else 0) in ((Obj.magic (((((((((((v_splitProgramFiles dtb_u_u408) modules) entryDecls) printResult) dtb_u_u407) dtb_u_u406) dtb_u_u410) ((v_splitLocPath roots) contextDir)) dtb_u_u409) dtb_u_u404) dtb_u_u412)) _u_ueffTok)))))))))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 225 "Vuna/Compiler/Driver/SplitGen.vuna"
let v_sgcEnv = (fun (dtb_u_u414 : t_SplitGenCtx) -> (match dtb_u_u414 with
  | { f_SplitGenCtx_sgcEnv = dtb_u_u415; f_SplitGenCtx_sgcAllDefs = dtb_u_u416; f_SplitGenCtx_sgcDefOwnerT = dtb_u_u417; f_SplitGenCtx_sgcDataOwnerT = dtb_u_u418; f_SplitGenCtx_sgcDefUnitT = dtb_u_u419; f_SplitGenCtx_sgcDataUnitT = dtb_u_u420; f_SplitGenCtx_sgcOrdered = dtb_u_u421; f_SplitGenCtx_sgcDefBuckets = dtb_u_u422; f_SplitGenCtx_sgcDataBuckets = dtb_u_u423; f_SplitGenCtx_sgcNormPath = dtb_u_u424; f_SplitGenCtx_sgcEffArity = dtb_u_u425 } -> dtb_u_u415
  | _ -> failwith "DT: impossible branch"
))

# 226 "Vuna/Compiler/Driver/SplitGen.vuna"
let v_sgcAllDefs = (fun (dtb_u_u426 : t_SplitGenCtx) -> (match dtb_u_u426 with
  | { f_SplitGenCtx_sgcEnv = dtb_u_u427; f_SplitGenCtx_sgcAllDefs = dtb_u_u428; f_SplitGenCtx_sgcDefOwnerT = dtb_u_u429; f_SplitGenCtx_sgcDataOwnerT = dtb_u_u430; f_SplitGenCtx_sgcDefUnitT = dtb_u_u431; f_SplitGenCtx_sgcDataUnitT = dtb_u_u432; f_SplitGenCtx_sgcOrdered = dtb_u_u433; f_SplitGenCtx_sgcDefBuckets = dtb_u_u434; f_SplitGenCtx_sgcDataBuckets = dtb_u_u435; f_SplitGenCtx_sgcNormPath = dtb_u_u436; f_SplitGenCtx_sgcEffArity = dtb_u_u437 } -> dtb_u_u428
  | _ -> failwith "DT: impossible branch"
))

# 227 "Vuna/Compiler/Driver/SplitGen.vuna"
let v_sgcDefOwnerT = (fun (dtb_u_u438 : t_SplitGenCtx) -> (match dtb_u_u438 with
  | { f_SplitGenCtx_sgcEnv = dtb_u_u439; f_SplitGenCtx_sgcAllDefs = dtb_u_u440; f_SplitGenCtx_sgcDefOwnerT = dtb_u_u441; f_SplitGenCtx_sgcDataOwnerT = dtb_u_u442; f_SplitGenCtx_sgcDefUnitT = dtb_u_u443; f_SplitGenCtx_sgcDataUnitT = dtb_u_u444; f_SplitGenCtx_sgcOrdered = dtb_u_u445; f_SplitGenCtx_sgcDefBuckets = dtb_u_u446; f_SplitGenCtx_sgcDataBuckets = dtb_u_u447; f_SplitGenCtx_sgcNormPath = dtb_u_u448; f_SplitGenCtx_sgcEffArity = dtb_u_u449 } -> dtb_u_u441
  | _ -> failwith "DT: impossible branch"
))

# 228 "Vuna/Compiler/Driver/SplitGen.vuna"
let v_sgcDataOwnerT = (fun (dtb_u_u450 : t_SplitGenCtx) -> (match dtb_u_u450 with
  | { f_SplitGenCtx_sgcEnv = dtb_u_u451; f_SplitGenCtx_sgcAllDefs = dtb_u_u452; f_SplitGenCtx_sgcDefOwnerT = dtb_u_u453; f_SplitGenCtx_sgcDataOwnerT = dtb_u_u454; f_SplitGenCtx_sgcDefUnitT = dtb_u_u455; f_SplitGenCtx_sgcDataUnitT = dtb_u_u456; f_SplitGenCtx_sgcOrdered = dtb_u_u457; f_SplitGenCtx_sgcDefBuckets = dtb_u_u458; f_SplitGenCtx_sgcDataBuckets = dtb_u_u459; f_SplitGenCtx_sgcNormPath = dtb_u_u460; f_SplitGenCtx_sgcEffArity = dtb_u_u461 } -> dtb_u_u454
  | _ -> failwith "DT: impossible branch"
))

# 229 "Vuna/Compiler/Driver/SplitGen.vuna"
let v_sgcDefUnitT = (fun (dtb_u_u462 : t_SplitGenCtx) -> (match dtb_u_u462 with
  | { f_SplitGenCtx_sgcEnv = dtb_u_u463; f_SplitGenCtx_sgcAllDefs = dtb_u_u464; f_SplitGenCtx_sgcDefOwnerT = dtb_u_u465; f_SplitGenCtx_sgcDataOwnerT = dtb_u_u466; f_SplitGenCtx_sgcDefUnitT = dtb_u_u467; f_SplitGenCtx_sgcDataUnitT = dtb_u_u468; f_SplitGenCtx_sgcOrdered = dtb_u_u469; f_SplitGenCtx_sgcDefBuckets = dtb_u_u470; f_SplitGenCtx_sgcDataBuckets = dtb_u_u471; f_SplitGenCtx_sgcNormPath = dtb_u_u472; f_SplitGenCtx_sgcEffArity = dtb_u_u473 } -> dtb_u_u467
  | _ -> failwith "DT: impossible branch"
))

# 230 "Vuna/Compiler/Driver/SplitGen.vuna"
let v_sgcDataUnitT = (fun (dtb_u_u474 : t_SplitGenCtx) -> (match dtb_u_u474 with
  | { f_SplitGenCtx_sgcEnv = dtb_u_u475; f_SplitGenCtx_sgcAllDefs = dtb_u_u476; f_SplitGenCtx_sgcDefOwnerT = dtb_u_u477; f_SplitGenCtx_sgcDataOwnerT = dtb_u_u478; f_SplitGenCtx_sgcDefUnitT = dtb_u_u479; f_SplitGenCtx_sgcDataUnitT = dtb_u_u480; f_SplitGenCtx_sgcOrdered = dtb_u_u481; f_SplitGenCtx_sgcDefBuckets = dtb_u_u482; f_SplitGenCtx_sgcDataBuckets = dtb_u_u483; f_SplitGenCtx_sgcNormPath = dtb_u_u484; f_SplitGenCtx_sgcEffArity = dtb_u_u485 } -> dtb_u_u480
  | _ -> failwith "DT: impossible branch"
))

# 231 "Vuna/Compiler/Driver/SplitGen.vuna"
let v_sgcOrdered = (fun (dtb_u_u486 : t_SplitGenCtx) -> (match dtb_u_u486 with
  | { f_SplitGenCtx_sgcEnv = dtb_u_u487; f_SplitGenCtx_sgcAllDefs = dtb_u_u488; f_SplitGenCtx_sgcDefOwnerT = dtb_u_u489; f_SplitGenCtx_sgcDataOwnerT = dtb_u_u490; f_SplitGenCtx_sgcDefUnitT = dtb_u_u491; f_SplitGenCtx_sgcDataUnitT = dtb_u_u492; f_SplitGenCtx_sgcOrdered = dtb_u_u493; f_SplitGenCtx_sgcDefBuckets = dtb_u_u494; f_SplitGenCtx_sgcDataBuckets = dtb_u_u495; f_SplitGenCtx_sgcNormPath = dtb_u_u496; f_SplitGenCtx_sgcEffArity = dtb_u_u497 } -> dtb_u_u493
  | _ -> failwith "DT: impossible branch"
))

# 233 "Vuna/Compiler/Driver/SplitGen.vuna"
let v_sgcDefBuckets = (fun (dtb_u_u498 : t_SplitGenCtx) -> (match dtb_u_u498 with
  | { f_SplitGenCtx_sgcEnv = dtb_u_u499; f_SplitGenCtx_sgcAllDefs = dtb_u_u500; f_SplitGenCtx_sgcDefOwnerT = dtb_u_u501; f_SplitGenCtx_sgcDataOwnerT = dtb_u_u502; f_SplitGenCtx_sgcDefUnitT = dtb_u_u503; f_SplitGenCtx_sgcDataUnitT = dtb_u_u504; f_SplitGenCtx_sgcOrdered = dtb_u_u505; f_SplitGenCtx_sgcDefBuckets = dtb_u_u506; f_SplitGenCtx_sgcDataBuckets = dtb_u_u507; f_SplitGenCtx_sgcNormPath = dtb_u_u508; f_SplitGenCtx_sgcEffArity = dtb_u_u509 } -> dtb_u_u506
  | _ -> failwith "DT: impossible branch"
))

# 234 "Vuna/Compiler/Driver/SplitGen.vuna"
let v_sgcDataBuckets = (fun (dtb_u_u510 : t_SplitGenCtx) -> (match dtb_u_u510 with
  | { f_SplitGenCtx_sgcEnv = dtb_u_u511; f_SplitGenCtx_sgcAllDefs = dtb_u_u512; f_SplitGenCtx_sgcDefOwnerT = dtb_u_u513; f_SplitGenCtx_sgcDataOwnerT = dtb_u_u514; f_SplitGenCtx_sgcDefUnitT = dtb_u_u515; f_SplitGenCtx_sgcDataUnitT = dtb_u_u516; f_SplitGenCtx_sgcOrdered = dtb_u_u517; f_SplitGenCtx_sgcDefBuckets = dtb_u_u518; f_SplitGenCtx_sgcDataBuckets = dtb_u_u519; f_SplitGenCtx_sgcNormPath = dtb_u_u520; f_SplitGenCtx_sgcEffArity = dtb_u_u521 } -> dtb_u_u519
  | _ -> failwith "DT: impossible branch"
))

# 236 "Vuna/Compiler/Driver/SplitGen.vuna"
let v_sgcNormPath = (fun dtb_u_u522 -> (match dtb_u_u522 with
  | { f_SplitGenCtx_sgcEnv = dtb_u_u523; f_SplitGenCtx_sgcAllDefs = dtb_u_u524; f_SplitGenCtx_sgcDefOwnerT = dtb_u_u525; f_SplitGenCtx_sgcDataOwnerT = dtb_u_u526; f_SplitGenCtx_sgcDefUnitT = dtb_u_u527; f_SplitGenCtx_sgcDataUnitT = dtb_u_u528; f_SplitGenCtx_sgcOrdered = dtb_u_u529; f_SplitGenCtx_sgcDefBuckets = dtb_u_u530; f_SplitGenCtx_sgcDataBuckets = dtb_u_u531; f_SplitGenCtx_sgcNormPath = dtb_u_u532; f_SplitGenCtx_sgcEffArity = dtb_u_u533 } -> dtb_u_u532
  | _ -> failwith "DT: impossible branch"
))

# 238 "Vuna/Compiler/Driver/SplitGen.vuna"
let v_sgcEffArity = (fun (dtb_u_u534 : t_SplitGenCtx) -> (match dtb_u_u534 with
  | { f_SplitGenCtx_sgcEnv = dtb_u_u535; f_SplitGenCtx_sgcAllDefs = dtb_u_u536; f_SplitGenCtx_sgcDefOwnerT = dtb_u_u537; f_SplitGenCtx_sgcDataOwnerT = dtb_u_u538; f_SplitGenCtx_sgcDefUnitT = dtb_u_u539; f_SplitGenCtx_sgcDataUnitT = dtb_u_u540; f_SplitGenCtx_sgcOrdered = dtb_u_u541; f_SplitGenCtx_sgcDefBuckets = dtb_u_u542; f_SplitGenCtx_sgcDataBuckets = dtb_u_u543; f_SplitGenCtx_sgcNormPath = dtb_u_u544; f_SplitGenCtx_sgcEffArity = dtb_u_u545 } -> dtb_u_u545
  | _ -> failwith "DT: impossible branch"
))
