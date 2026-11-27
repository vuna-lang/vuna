open Vuna_runtime
type t_SplitGenCtx = { f_SplitGenCtx_sgcEnv : Lowering_dEnv.t_LwEnv; f_SplitGenCtx_sgcAllDefs : Elab_dTypes.t_DtDef B_dData_dList.t_List; f_SplitGenCtx_sgcDefOwnerT : (string, string) B_dContainer_dHashMap.t_HashMap; f_SplitGenCtx_sgcDataOwnerT : (string, string) B_dContainer_dHashMap.t_HashMap; f_SplitGenCtx_sgcDefUnitT : (string, string) B_dContainer_dHashMap.t_HashMap; f_SplitGenCtx_sgcDataUnitT : (string, string) B_dContainer_dHashMap.t_HashMap; f_SplitGenCtx_sgcOrdered : string B_dData_dList.t_List; f_SplitGenCtx_sgcDefBuckets : (string, Elab_dTypes.t_DtDef B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap; f_SplitGenCtx_sgcDataBuckets : (string, Elab_dTypes.t_DtData B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap; f_SplitGenCtx_sgcNormPath : (string) -> string }

# 43 "Vuna/Compiler/Driver/SplitGen.vuna"
let v_compilerPkgPrefix = "Vuna.Compiler."

# 46 "Vuna/Compiler/Driver/SplitGen.vuna"
let v_basePkgPrefix = "Base."

# 49 "Vuna/Compiler/Driver/SplitGen.vuna"
let v_unitPathOf = (fun (dtb_u_u1 : string) -> (if ((B_dData_dString.v_startsWith v_compilerPkgPrefix) dtb_u_u1) then (((dtp_substring (String.length v_compilerPkgPrefix)) ((String.length dtb_u_u1) - (String.length v_compilerPkgPrefix))) dtb_u_u1) else (if ((B_dData_dString.v_startsWith v_basePkgPrefix) dtb_u_u1) then ("B." ^ (((dtp_substring (String.length v_basePkgPrefix)) ((String.length dtb_u_u1) - (String.length v_basePkgPrefix))) dtb_u_u1)) else dtb_u_u1)))

# 40 "Vuna/Compiler/Driver/SplitGen.vuna"
let v_splitUnitOfModule = (fun (dtb_u_u2 : string) -> (Vuna_dTarget_dOcaml_dDecl.v_sanitizeName (v_unitPathOf dtb_u_u2)))

# 60 "Vuna/Compiler/Driver/SplitGen.vuna"
let v_unitOfLocName = (fun (dtb_u_u3 : string) -> (let dtb_u_u4 = (Driver_dOwner.v_modulePrefixOfName dtb_u_u3) in (if (dtb_u_u4 = "") then (v_splitUnitOfModule Driver_dOwner.v_entryOwner) else (v_splitUnitOfModule dtb_u_u4))))

# 68 "Vuna/Compiler/Driver/SplitGen.vuna"
let v_mainInitPrologue = "open Vuna_runtime\nlet () = dt_record_backtrace true\n"

# 76 "Vuna/Compiler/Driver/SplitGen.vuna"
let v_ownerTblOf = (fun (dtb_u_u5 : (string, string) B_dData_dPair.t_Pair B_dData_dList.t_List) -> ((((B_dContainer_dHashMap.v_insertAll B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) dtb_u_u5) (((B_dContainer_dHashMap.v_fromList B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) B_dData_dList.C_List_Nil)))

# 85 "Vuna/Compiler/Driver/SplitGen.vuna"
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

# 82 "Vuna/Compiler/Driver/SplitGen.vuna"
let v_defBucketsOf = (fun (dtb_u_u15 : (string, string) B_dContainer_dHashMap.t_HashMap) (dtb_u_u16 : Elab_dTypes.t_DtDef B_dData_dList.t_List) -> (((v_defBucketsGo dtb_u_u15) (B_dData_dList.v_reverse dtb_u_u16)) (((B_dContainer_dHashMap.v_fromList B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) B_dData_dList.C_List_Nil)))

# 102 "Vuna/Compiler/Driver/SplitGen.vuna"
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

# 99 "Vuna/Compiler/Driver/SplitGen.vuna"
let v_dataBucketsOf = (fun (dtb_u_u26 : (string, string) B_dContainer_dHashMap.t_HashMap) (dtb_u_u27 : Elab_dTypes.t_DtData B_dData_dList.t_List) -> (((v_dataBucketsGo dtb_u_u26) (B_dData_dList.v_reverse dtb_u_u27)) (((B_dContainer_dHashMap.v_fromList B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) B_dData_dList.C_List_Nil)))

# 126 "Vuna/Compiler/Driver/SplitGen.vuna"
let v_knownUnit = (fun (dtb_u_u28 : string B_dData_dList.t_List) (dtb_u_u29 : string) -> ((B_dData_dList.v_memName dtb_u_u29) dtb_u_u28))

# 129 "Vuna/Compiler/Driver/SplitGen.vuna"
let rec v_checkDepsKnown = (fun (dtb_u_u30 : string B_dData_dList.t_List) (dtb_u_u31 : string) (dtb_u_u32 : string B_dData_dList.t_List) -> (match dtb_u_u32 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u33, dtb_u_u34) -> (if (B_dData_dBool.v_not ((v_knownUnit dtb_u_u30) dtb_u_u33)) then (Base_dDiag.v_icInternal (String.concat "" [dtb_u_u31; " references unknown unit `"; dtb_u_u33; "`"])) else (if (B_dData_dBool.v_not ((v_knownUnit dtb_u_u30) dtb_u_u31)) then (Base_dDiag.v_icInternal (String.concat "" ["split unit `"; dtb_u_u31; "` is not in the module order"])) else (((v_checkDepsKnown dtb_u_u30) dtb_u_u31) dtb_u_u34)))
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (0))
  | _ -> failwith "DT: impossible branch"
))

# 140 "Vuna/Compiler/Driver/SplitGen.vuna"
let v_depsInOrder = (fun (dtb_u_u35 : string B_dData_dList.t_List) (dtb_u_u36 : string) (dtb_u_u37 : string B_dData_dList.t_List) -> ((B_dData_dList.v_filter (fun (dtb_u_u38 : string) -> (if (B_dData_dBool.v_not (dtb_u_u38 = dtb_u_u36)) then ((B_dData_dList.v_memName dtb_u_u38) dtb_u_u37) else false))) dtb_u_u35))

# 143 "Vuna/Compiler/Driver/SplitGen.vuna"
let v_unitDepsOf = (fun (dtb_u_u39 : string B_dData_dList.t_List) (dtb_u_u40 : string) (dtb_u_u41 : string B_dData_dList.t_List) -> ((Base_dCommon.v_bind (((v_checkDepsKnown dtb_u_u39) dtb_u_u40) dtb_u_u41)) (fun (dtb_u_u42 : int) -> (Base_dDiag.C_Check_OkC ((((v_depsInOrder dtb_u_u39) dtb_u_u40) dtb_u_u41))))))

# 153 "Vuna/Compiler/Driver/SplitGen.vuna"
let rec v_uniqueSplitNames = (fun (dtb_u_u43 : Driver_dSplit.t_SplitFile B_dData_dList.t_List) (dtb_u_u44 : string B_dData_dList.t_List) -> (match dtb_u_u43 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u45, dtb_u_u46) -> (match dtb_u_u45 with
  | { Driver_dSplit.f_SplitFile_splitName = dtb_u_u47; Driver_dSplit.f_SplitFile_splitText = dtb_u_u48; Driver_dSplit.f_SplitFile_splitDeps = dtb_u_u49 } -> (if ((B_dData_dList.v_memName dtb_u_u47) dtb_u_u44) then false else ((v_uniqueSplitNames dtb_u_u46) (B_dData_dList.C_List__x58__x58_ (dtb_u_u47, dtb_u_u44))))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

# 158 "Vuna/Compiler/Driver/SplitGen.vuna"
let v_checkSplitNames = (fun (dtb_u_u50 : Driver_dSplit.t_SplitFile B_dData_dList.t_List) -> (if ((v_uniqueSplitNames dtb_u_u50) B_dData_dList.C_List_Nil) then (Base_dDiag.C_Check_OkC (0)) else (Base_dDiag.v_icInternal "split unit name collides with another module (codegen unit naming)")))

# 168 "Vuna/Compiler/Driver/SplitGen.vuna"
let v_checkSplitAcyclic = (fun (dtb_u_u51 : Driver_dSplit.t_SplitFile B_dData_dList.t_List) -> (if (Driver_dSplit.v_splitGraphAcyclic dtb_u_u51) then (Base_dDiag.C_Check_OkC (0)) else (Base_dDiag.v_icInternal "split dependency graph has a cycle (unit order is not a DAG)")))

# 191 "Vuna/Compiler/Driver/SplitGen.vuna"
let v_defsOfUnit = (fun (dtb_u_u52 : t_SplitGenCtx) (dtb_u_u53 : string) -> (match ((((B_dContainer_dHashMap.v_lookup B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) dtb_u_u53) (dtb_u_u52).f_SplitGenCtx_sgcDefBuckets) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u54) -> dtb_u_u54
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 197 "Vuna/Compiler/Driver/SplitGen.vuna"
let v_datasOfUnit = (fun (dtb_u_u55 : t_SplitGenCtx) (dtb_u_u56 : string) -> (match ((((B_dContainer_dHashMap.v_lookup B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) dtb_u_u56) (dtb_u_u55).f_SplitGenCtx_sgcDataBuckets) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u57) -> dtb_u_u57
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 203 "Vuna/Compiler/Driver/SplitGen.vuna"
let v_mapToUnit = (fun (dtb_u_u58 : (string, string) B_dData_dPair.t_Pair B_dData_dList.t_List) -> ((B_dData_dList.v_map (fun (dtb_u_u59 : (string, string) B_dData_dPair.t_Pair) -> { B_dData_dPair.f_Pair_first = (B_dData_dPair.v_firstOf dtb_u_u59); B_dData_dPair.f_Pair_second = (v_splitUnitOfModule (B_dData_dPair.v_secondOf dtb_u_u59)) })) dtb_u_u58))

# 209 "Vuna/Compiler/Driver/SplitGen.vuna"
let v_checkModuleDeclName = (fun (dtb_u_u60 : string B_dData_dList.t_List) (dtb_u_u61 : string) (dtb_u_u62 : string) -> (if (Base_dSource.v_containsDot dtb_u_u62) then (if ((B_dData_dList.v_memName (Driver_dOwner.v_modulePrefixOfName dtb_u_u62)) dtb_u_u60) then (Base_dDiag.C_Check_OkC (0)) else (Base_dDiag.v_icInternal (String.concat "" ["module "; dtb_u_u61; " declares `"; dtb_u_u62; "` whose module prefix `"; (Driver_dOwner.v_modulePrefixOfName dtb_u_u62); "` is not a known module (codegen requires Loader-resolved decls)"]))) else (Base_dDiag.v_icInternal (String.concat "" ["module "; dtb_u_u61; " has an unresolved declaration name `"; dtb_u_u62; "` (codegen requires Loader-resolved decls)"]))))

# 221 "Vuna/Compiler/Driver/SplitGen.vuna"
let rec v_checkModuleDeclNames = (fun (dtb_u_u63 : string B_dData_dList.t_List) (dtb_u_u64 : string) (dtb_u_u65 : string B_dData_dList.t_List) -> (match dtb_u_u65 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u66, dtb_u_u67) -> ((Base_dCommon.v_bind (((v_checkModuleDeclName dtb_u_u63) dtb_u_u64) dtb_u_u66)) (fun (dtb_u_u68 : int) -> (((v_checkModuleDeclNames dtb_u_u63) dtb_u_u64) dtb_u_u67)))
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (0))
  | _ -> failwith "DT: impossible branch"
))

# 228 "Vuna/Compiler/Driver/SplitGen.vuna"
let rec v_checkModuleDecls = (fun (dtb_u_u69 : string B_dData_dList.t_List) (dtb_u_u70 : (string, Frontend_dAst.t_Decl B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match dtb_u_u70 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u71, dtb_u_u72) -> (match dtb_u_u71 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u73; B_dData_dPair.f_Pair_second = dtb_u_u74 } -> ((Base_dCommon.v_bind (((v_checkModuleDeclNames dtb_u_u69) dtb_u_u73) (Driver_dOwner.v_splitDeclNames dtb_u_u74))) (fun (dtb_u_u75 : int) -> ((v_checkModuleDecls dtb_u_u69) dtb_u_u72)))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (0))
  | _ -> failwith "DT: impossible branch"
))

# 239 "Vuna/Compiler/Driver/SplitGen.vuna"
let[@tail_mod_cons] rec v_entryDeclIdentities = (fun (dtb_u_u76 : Frontend_dAst.t_Decl B_dData_dList.t_List) -> (match dtb_u_u76 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u77, dtb_u_u78) -> (match dtb_u_u77 with
  | Frontend_dAst.C_Decl_DSig (dtb_u_u79, dtb_u_u80, dtb_u_u81, dtb_u_u82) -> (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = false; B_dData_dPair.f_Pair_second = dtb_u_u79 }, (v_entryDeclIdentities dtb_u_u78)))
  | Frontend_dAst.C_Decl_DExtern (dtb_u_u83, dtb_u_u84, dtb_u_u85, dtb_u_u86) -> (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = false; B_dData_dPair.f_Pair_second = dtb_u_u83 }, (v_entryDeclIdentities dtb_u_u78)))
  | Frontend_dAst.C_Decl_DData (dtb_u_u87, dtb_u_u88, dtb_u_u89, dtb_u_u90, dtb_u_u91, dtb_u_u92, dtb_u_u93, dtb_u_u94, dtb_u_u95) -> (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = true; B_dData_dPair.f_Pair_second = dtb_u_u87 }, (v_entryDeclIdentities dtb_u_u78)))
  | Frontend_dAst.C_Decl_DRecord (dtb_u_u96, dtb_u_u97, dtb_u_u98, dtb_u_u99, dtb_u_u100, dtb_u_u101, dtb_u_u102, dtb_u_u103) -> (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = true; B_dData_dPair.f_Pair_second = dtb_u_u96 }, (v_entryDeclIdentities dtb_u_u78)))
  | Frontend_dAst.C_Decl_DTrait (dtb_u_u104, dtb_u_u105, dtb_u_u106, dtb_u_u107, dtb_u_u108) -> (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = true; B_dData_dPair.f_Pair_second = dtb_u_u104 }, (v_entryDeclIdentities dtb_u_u78)))
  | _ -> (v_entryDeclIdentities dtb_u_u78)
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 252 "Vuna/Compiler/Driver/SplitGen.vuna"
let v_entryDeclKey = (fun (dtb_u_u109 : (bool, string) B_dData_dPair.t_Pair) -> (match dtb_u_u109 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u110; B_dData_dPair.f_Pair_second = dtb_u_u111 } -> (if dtb_u_u110 then ("type\t" ^ dtb_u_u111) else ("value\t" ^ dtb_u_u111))
  | _ -> failwith "DT: impossible branch"
))

# 256 "Vuna/Compiler/Driver/SplitGen.vuna"
let v_checkEntryDeclName = (fun (dtb_u_u112 : string B_dData_dList.t_List) (dtb_u_u113 : (bool, string) B_dData_dPair.t_Pair) -> (let dtb_u_u114 = (B_dData_dPair.v_secondOf dtb_u_u113) in (let dtb_u_u115 = (v_entryDeclKey dtb_u_u113) in (if (dtb_u_u114 = "") then (Base_dDiag.v_icInternal "entry declaration has an empty name") else (if (Base_dSource.v_containsDot dtb_u_u114) then (Base_dDiag.v_icInternal (String.concat "" ["entry declaration `"; dtb_u_u114; "` must not contain a module prefix (codegen requires Loader-resolved decls)"])) else (if ((B_dData_dList.v_memName dtb_u_u115) dtb_u_u112) then (Base_dDiag.v_icInternal (String.concat "" ["duplicate entry declaration `"; dtb_u_u114; "`"])) else (Base_dDiag.C_Check_OkC (0))))))))

# 268 "Vuna/Compiler/Driver/SplitGen.vuna"
let rec v_checkEntryDeclsGo = (fun (dtb_u_u116 : string B_dData_dList.t_List) (dtb_u_u117 : (bool, string) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match dtb_u_u117 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u118, dtb_u_u119) -> ((Base_dCommon.v_bind ((v_checkEntryDeclName dtb_u_u116) dtb_u_u118)) (fun (dtb_u_u120 : int) -> ((v_checkEntryDeclsGo (B_dData_dList.C_List__x58__x58_ ((v_entryDeclKey dtb_u_u118), dtb_u_u116))) dtb_u_u119)))
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (0))
  | _ -> failwith "DT: impossible branch"
))

# 275 "Vuna/Compiler/Driver/SplitGen.vuna"
let v_checkEntryDecls = (fun (dtb_u_u121 : Frontend_dAst.t_Decl B_dData_dList.t_List) -> ((v_checkEntryDeclsGo B_dData_dList.C_List_Nil) (v_entryDeclIdentities dtb_u_u121)))

# 280 "Vuna/Compiler/Driver/SplitGen.vuna"
let rec v_checkDefOwners = (fun (dtb_u_u122 : Driver_dOwner.t_SplitMeta) (dtb_u_u123 : Elab_dTypes.t_DtDef B_dData_dList.t_List) -> (match dtb_u_u123 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u124, dtb_u_u125) -> ((Base_dCommon.v_bind ((Driver_dOwner.v_splitDefOwnerOf dtb_u_u122) (Elab_dTypes.v_dtDefName dtb_u_u124))) (fun (dtb_u_u126 : string) -> ((v_checkDefOwners dtb_u_u122) dtb_u_u125)))
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (0))
  | _ -> failwith "DT: impossible branch"
))

# 287 "Vuna/Compiler/Driver/SplitGen.vuna"
let rec v_checkDataOwners = (fun (dtb_u_u127 : Driver_dOwner.t_SplitMeta) (dtb_u_u128 : Elab_dTypes.t_DtData B_dData_dList.t_List) -> (match dtb_u_u128 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u129, dtb_u_u130) -> ((Base_dCommon.v_bind ((Driver_dOwner.v_splitDataOwnerOf dtb_u_u127) dtb_u_u129)) (fun (dtb_u_u131 : string) -> ((v_checkDataOwners dtb_u_u127) dtb_u_u130)))
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (0))
  | _ -> failwith "DT: impossible branch"
))

# 292 "Vuna/Compiler/Driver/SplitGen.vuna"
let v_checkResolvedModules = (fun (dtb_u_u132 : Driver_dOwner.t_SplitMeta) (dtb_u_u133 : (string, Frontend_dAst.t_Decl B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u134 : Frontend_dAst.t_Decl B_dData_dList.t_List) (dtb_u_u135 : Elab_dTypes.t_DtDef B_dData_dList.t_List) (dtb_u_u136 : Elab_dTypes.t_DtData B_dData_dList.t_List) -> ((Base_dCommon.v_bind ((v_checkModuleDecls (dtb_u_u132).Driver_dOwner.f_SplitMeta_smKnownModules) dtb_u_u133)) (fun (dtb_u_u137 : int) -> ((Base_dCommon.v_bind (v_checkEntryDecls dtb_u_u134)) (fun (dtb_u_u138 : int) -> ((Base_dCommon.v_bind ((v_checkDefOwners dtb_u_u132) dtb_u_u135)) (fun (dtb_u_u139 : int) -> ((v_checkDataOwners dtb_u_u132) dtb_u_u136))))))))

# 304 "Vuna/Compiler/Driver/SplitGen.vuna"
let v_splitStripPrefix = Base_dSource.v_stripPathPrefix

# 307 "Vuna/Compiler/Driver/SplitGen.vuna"
let v_splitStripRoots = Base_dSource.v_stripRootsPath

# 310 "Vuna/Compiler/Driver/SplitGen.vuna"
let v_splitStripDotSlash = Base_dSource.v_stripDotSlashPath

# 313 "Vuna/Compiler/Driver/SplitGen.vuna"
let v_splitLocPath = (fun (dtb_u_u140 : string B_dData_dList.t_List) (dtb_u_u141 : string) (dtb_u_u142 : string) -> (((Base_dSource.v_locationPathUnder dtb_u_u140) dtb_u_u141) dtb_u_u142))

# 320 "Vuna/Compiler/Driver/SplitGen.vuna"
let rec v_helperInText = (fun (dtb_u_u143 : string) (dtb_u_u144 : string B_dData_dList.t_List) -> (match dtb_u_u144 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u145, dtb_u_u146) -> (if ((B_dData_dString.v_contains dtb_u_u143) dtb_u_u145) then true else ((v_helperInText dtb_u_u143) dtb_u_u146))
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 324 "Vuna/Compiler/Driver/SplitGen.vuna"
let rec v_helperInTexts = (fun (dtb_u_u147 : string B_dData_dList.t_List) (dtb_u_u148 : string B_dData_dList.t_List) -> (match dtb_u_u147 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u149, dtb_u_u150) -> (if ((v_helperInText dtb_u_u149) dtb_u_u148) then true else ((v_helperInTexts dtb_u_u150) dtb_u_u148))
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 330 "Vuna/Compiler/Driver/SplitGen.vuna"
let v_dtRuntimeFor = (fun (dtb_u_u151 : Vuna_dIr_dModel.t_IrShared) (dtb_u_u152 : bool) (dtb_u_u153 : string B_dData_dList.t_List) -> (((((((((Vuna_dTarget_dOcaml_dTerm.v_dtRuntimeWith (dtb_u_u151).Vuna_dIr_dModel.f_IrShared_irSharedUsesFloat) (dtb_u_u151).Vuna_dIr_dModel.f_IrShared_irSharedUsesTrace) (dtb_u_u151).Vuna_dIr_dModel.f_IrShared_irSharedUsesObs) (dtb_u_u151).Vuna_dIr_dModel.f_IrShared_irSharedUsesHost) (if (dtb_u_u151).Vuna_dIr_dModel.f_IrShared_irSharedUsesSched then true else dtb_u_u152)) (if (dtb_u_u151).Vuna_dIr_dModel.f_IrShared_irSharedUsesEff then true else dtb_u_u152)) ((v_helperInTexts Vuna_dTarget_dOcaml_dTerm.v_dtStrHelperNames) dtb_u_u153)) ((v_helperInTexts Vuna_dTarget_dOcaml_dTerm.v_dtArrHelperNames) dtb_u_u153)) ((v_helperInTexts Vuna_dTarget_dOcaml_dTerm.v_dtBufHelperNames) dtb_u_u153)))

# 344 "Vuna/Compiler/Driver/SplitGen.vuna"
let v_entryIsActionM = (fun (dtb_u_u154 : Vuna_dIr_dModel.t_IrEntry B_dData_dMaybe.t_Maybe) -> (match dtb_u_u154 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u155) -> (Vuna_dIr_dModel.v_irEntryIsActionOf dtb_u_u155)
  | B_dData_dMaybe.C_Maybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
))

# 489 "Vuna/Compiler/Driver/SplitGen.vuna"
let rec v_splitModuleFiles = (fun (dtb_u_u157 : t_SplitGenCtx) (dtb_u_u158 : (string, Frontend_dAst.t_Decl B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match dtb_u_u158 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u159, dtb_u_u160) -> (match dtb_u_u159 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u161; B_dData_dPair.f_Pair_second = dtb_u_u162 } -> (let dtb_u_u163 = (v_splitUnitOfModule dtb_u_u161) in (let dtb_u_u164 = ((v_datasOfUnit dtb_u_u157) dtb_u_u161) in (let dtb_u_u165 = ((v_defsOfUnit dtb_u_u157) dtb_u_u161) in (let dtb_u_u166 = { Vuna_dTarget_dOcaml_dDecl.f_QualCtx_qcUnit = dtb_u_u163; Vuna_dTarget_dOcaml_dDecl.f_QualCtx_qcDefs = (dtb_u_u157).f_SplitGenCtx_sgcDefUnitT; Vuna_dTarget_dOcaml_dDecl.f_QualCtx_qcDatas = (dtb_u_u157).f_SplitGenCtx_sgcDataUnitT } in (let dtb_u_u167 = ((Lowering_dEnv.v_lwEnvWithUnit dtb_u_u163) (dtb_u_u157).f_SplitGenCtx_sgcEnv) in (match (((Lowering_dProgram.v_lowerUnitCheckedFrom dtb_u_u167) dtb_u_u164) dtb_u_u165) with
  | Base_dDiag.C_Check_ErrC (dtb_u_u168) -> (let dtb_u_u170 = (Base_dDiag.C_Check_ErrC (dtb_u_u168)) in (Obj.repr ((fun (dtb_u_u171 : B_dEffect_dCore.t_EffUnit) -> dtb_u_u170))))
  | Base_dDiag.C_Check_OkC (dtb_u_u172) -> (let dtb_u_u173 = ((Vuna_dIr_dDirect.v_directUnit (fun (dtb_u_u201 : string) -> B_dData_dMaybe.C_Maybe_Nothing)) dtb_u_u172) in (match ((((Vuna_dTarget_dOcaml_dAssembly.v_genUnitPartsWith (dtb_u_u157).f_SplitGenCtx_sgcNormPath) dtb_u_u166) (Lowering_dEnv.v_lwEnvShared dtb_u_u167)) dtb_u_u173) with
  | Base_dDiag.C_Check_ErrC (dtb_u_u174) -> (let dtb_u_u176 = (Base_dDiag.C_Check_ErrC (dtb_u_u174)) in (Obj.repr ((fun (dtb_u_u177 : B_dEffect_dCore.t_EffUnit) -> dtb_u_u176))))
  | Base_dDiag.C_Check_OkC (dtb_u_u178) -> (Obj.repr ((fun (dtb_u_u183 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u184 = Obj.obj (((v_splitModuleFiles dtb_u_u157) dtb_u_u160)) in (let dtb_u_u186 = (dtb_u_u184 dtb_u_u183) in (match dtb_u_u186 with
  | Base_dDiag.C_Check_ErrC (dtb_u_u187) -> (let dtb_u_u189 = (Base_dDiag.C_Check_ErrC (dtb_u_u187)) in dtb_u_u189)
  | Base_dDiag.C_Check_OkC (dtb_u_u191) -> (match (((v_unitDepsOf (dtb_u_u157).f_SplitGenCtx_sgcOrdered) dtb_u_u163) (Vuna_dTarget_dOcaml_dAssembly.v_unitPartsDeps dtb_u_u178)) with
  | Base_dDiag.C_Check_ErrC (dtb_u_u192) -> (let dtb_u_u194 = (Base_dDiag.C_Check_ErrC (dtb_u_u192)) in dtb_u_u194)
  | Base_dDiag.C_Check_OkC (dtb_u_u196) -> (let dtb_u_u197 = { Driver_dSplit.f_SplitFile_splitName = (dtb_u_u163 ^ ".ml"); Driver_dSplit.f_SplitFile_splitText = ((Vuna_dTarget_dOcaml_dAssembly.v_genUnitText dtb_u_u178) ^ "\n"); Driver_dSplit.f_SplitFile_splitDeps = dtb_u_u196 } in (let dtb_u_u199 = (Base_dDiag.C_Check_OkC ((B_dData_dList.C_List__x58__x58_ (dtb_u_u197, dtb_u_u191)))) in dtb_u_u199))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))))
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
))))))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (let dtb_u_u203 = (Base_dDiag.C_Check_OkC (B_dData_dList.C_List_Nil)) in (Obj.repr ((fun (dtb_u_u204 : B_dEffect_dCore.t_EffUnit) -> dtb_u_u203))))
  | _ -> failwith "DT: impossible branch"
))

# 519 "Vuna/Compiler/Driver/SplitGen.vuna"
let v_splitMainFile = (fun (dtb_u_u206 : t_SplitGenCtx) (dtb_u_u207 : bool) -> (let dtb_u_u208 = (v_splitUnitOfModule Driver_dOwner.v_entryOwner) in (let dtb_u_u209 = ((v_defsOfUnit dtb_u_u206) Driver_dOwner.v_entryOwner) in (let dtb_u_u210 = ((v_datasOfUnit dtb_u_u206) Driver_dOwner.v_entryOwner) in (let dtb_u_u211 = { Vuna_dTarget_dOcaml_dDecl.f_QualCtx_qcUnit = dtb_u_u208; Vuna_dTarget_dOcaml_dDecl.f_QualCtx_qcDefs = (dtb_u_u206).f_SplitGenCtx_sgcDefUnitT; Vuna_dTarget_dOcaml_dDecl.f_QualCtx_qcDatas = (dtb_u_u206).f_SplitGenCtx_sgcDataUnitT } in (let dtb_u_u212 = ((Lowering_dEnv.v_lwEnvWithUnit dtb_u_u208) (dtb_u_u206).f_SplitGenCtx_sgcEnv) in (match (((Lowering_dProgram.v_lowerUnitCheckedFrom dtb_u_u212) dtb_u_u210) dtb_u_u209) with
  | Base_dDiag.C_Check_ErrC (dtb_u_u213) -> (let dtb_u_u215 = (Base_dDiag.C_Check_ErrC (dtb_u_u213)) in (Obj.repr ((fun (dtb_u_u216 : B_dEffect_dCore.t_EffUnit) -> dtb_u_u215))))
  | Base_dDiag.C_Check_OkC (dtb_u_u217) -> (let dtb_u_u218 = ((Vuna_dIr_dDirect.v_directUnit (fun (dtb_u_u247 : string) -> B_dData_dMaybe.C_Maybe_Nothing)) dtb_u_u217) in (match (Lowering_dEntry.v_lowerEntryOf (dtb_u_u206).f_SplitGenCtx_sgcAllDefs) with
  | Base_dDiag.C_Check_ErrC (dtb_u_u219) -> (let dtb_u_u221 = (Base_dDiag.C_Check_ErrC (dtb_u_u219)) in (Obj.repr ((fun (dtb_u_u222 : B_dEffect_dCore.t_EffUnit) -> dtb_u_u221))))
  | Base_dDiag.C_Check_OkC (dtb_u_u223) -> (match dtb_u_u223 with
  | B_dData_dMaybe.C_Maybe_Nothing -> (let dtb_u_u225 = (Base_dDiagnostics_dCg.v_cgErr0 Base_dDiagnostics_dCg.C_CgErr_NoMain) in (Obj.repr ((fun (dtb_u_u226 : B_dEffect_dCore.t_EffUnit) -> dtb_u_u225))))
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u227) -> (match ((((Vuna_dTarget_dOcaml_dAssembly.v_genUnitPartsWith (dtb_u_u206).f_SplitGenCtx_sgcNormPath) dtb_u_u211) (Lowering_dEnv.v_lwEnvShared dtb_u_u212)) dtb_u_u218) with
  | Base_dDiag.C_Check_ErrC (dtb_u_u228) -> (let dtb_u_u230 = (Base_dDiag.C_Check_ErrC (dtb_u_u228)) in (Obj.repr ((fun (dtb_u_u231 : B_dEffect_dCore.t_EffUnit) -> dtb_u_u230))))
  | Base_dDiag.C_Check_OkC (dtb_u_u232) -> (match (((Vuna_dTarget_dOcaml_dTerm.v_genEntryHook (((Vuna_dTarget_dOcaml_dTerm.v_mkGenStWith (dtb_u_u206).f_SplitGenCtx_sgcNormPath) dtb_u_u211) (Lowering_dEnv.v_lwEnvShared dtb_u_u212))) dtb_u_u227) dtb_u_u207) with
  | Base_dDiag.C_Check_ErrC (dtb_u_u233) -> (let dtb_u_u235 = (Base_dDiag.C_Check_ErrC (dtb_u_u233)) in (Obj.repr ((fun (dtb_u_u236 : B_dEffect_dCore.t_EffUnit) -> dtb_u_u235))))
  | Base_dDiag.C_Check_OkC (dtb_u_u237) -> (match (((v_unitDepsOf (dtb_u_u206).f_SplitGenCtx_sgcOrdered) dtb_u_u208) ((B_dData_dList.v_append ((B_dData_dList.v_append (Vuna_dTarget_dOcaml_dAssembly.v_unitPartsDeps dtb_u_u232)) (B_dData_dPair.v_secondOf dtb_u_u237))) (B_dData_dList.C_List__x58__x58_ (Vuna_dTarget_dOcaml_dAssembly.v_deflocsUnit, B_dData_dList.C_List_Nil)))) with
  | Base_dDiag.C_Check_ErrC (dtb_u_u238) -> (let dtb_u_u240 = (Base_dDiag.C_Check_ErrC (dtb_u_u238)) in (Obj.repr ((fun (dtb_u_u241 : B_dEffect_dCore.t_EffUnit) -> dtb_u_u240))))
  | Base_dDiag.C_Check_OkC (dtb_u_u242) -> (let dtb_u_u243 = { Driver_dSplit.f_SplitFile_splitName = "Main.ml"; Driver_dSplit.f_SplitFile_splitText = (String.concat "" [v_mainInitPrologue; (Vuna_dTarget_dOcaml_dAssembly.v_genUnitText dtb_u_u232); (B_dData_dPair.v_firstOf dtb_u_u237)]); Driver_dSplit.f_SplitFile_splitDeps = dtb_u_u242 } in (let dtb_u_u245 = (Base_dDiag.C_Check_OkC (dtb_u_u243)) in (Obj.repr ((fun (dtb_u_u246 : B_dEffect_dCore.t_EffUnit) -> dtb_u_u245)))))
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

# 433 "Vuna/Compiler/Driver/SplitGen.vuna"
let v_splitWithOwners = (fun (dtb_u_u249 : Lowering_dEnv.t_LwEnv) (dtb_u_u250 : (string, Frontend_dAst.t_Decl B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u251 : bool) (dtb_u_u252 : Elab_dTypes.t_DtData B_dData_dList.t_List) (dtb_u_u253 : Elab_dTypes.t_DtDef B_dData_dList.t_List) (dtb_u_u254 : (string, string) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u255 : (string, string) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u256 : (string) -> string) (dtb_u_u257 : Vuna_dIr_dModel.t_IrShared) (dtb_u_u258 : bool) (dtb_u_u259 : (string, (string, int) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (let dtb_u_u260 = (v_ownerTblOf dtb_u_u254) in (let dtb_u_u261 = (v_ownerTblOf dtb_u_u255) in (let dtb_u_u262 = (Vuna_dTarget_dOcaml_dDecl.v_unitTblOf (v_mapToUnit dtb_u_u254)) in (let dtb_u_u263 = (Vuna_dTarget_dOcaml_dDecl.v_unitTblOf (v_mapToUnit dtb_u_u255)) in (let dtb_u_u264 = ((B_dData_dList.v_append ((B_dData_dList.v_append (B_dData_dList.C_List__x58__x58_ (Vuna_dTarget_dOcaml_dAssembly.v_runtimeUnit, (B_dData_dList.C_List__x58__x58_ (Vuna_dTarget_dOcaml_dAssembly.v_deflocsUnit, B_dData_dList.C_List_Nil))))) ((B_dData_dList.v_map (fun (dtb_u_u308 : (string, Frontend_dAst.t_Decl B_dData_dList.t_List) B_dData_dPair.t_Pair) -> (v_splitUnitOfModule (B_dData_dPair.v_firstOf dtb_u_u308)))) dtb_u_u250))) (B_dData_dList.C_List__x58__x58_ ((v_splitUnitOfModule Driver_dOwner.v_entryOwner), B_dData_dList.C_List_Nil))) in (let dtb_u_u265 = { f_SplitGenCtx_sgcEnv = dtb_u_u249; f_SplitGenCtx_sgcAllDefs = dtb_u_u253; f_SplitGenCtx_sgcDefOwnerT = dtb_u_u260; f_SplitGenCtx_sgcDataOwnerT = dtb_u_u261; f_SplitGenCtx_sgcDefUnitT = dtb_u_u262; f_SplitGenCtx_sgcDataUnitT = dtb_u_u263; f_SplitGenCtx_sgcOrdered = dtb_u_u264; f_SplitGenCtx_sgcDefBuckets = ((v_defBucketsOf dtb_u_u260) dtb_u_u253); f_SplitGenCtx_sgcDataBuckets = ((v_dataBucketsOf dtb_u_u261) dtb_u_u252); f_SplitGenCtx_sgcNormPath = dtb_u_u256 } in (Obj.repr ((fun (dtb_u_u270 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u271 = Obj.obj (((v_splitModuleFiles dtb_u_u265) dtb_u_u250)) in (let dtb_u_u273 = (dtb_u_u271 dtb_u_u270) in (match dtb_u_u273 with
  | Base_dDiag.C_Check_ErrC (dtb_u_u274) -> (let dtb_u_u276 = (Base_dDiag.C_Check_ErrC (dtb_u_u274)) in dtb_u_u276)
  | Base_dDiag.C_Check_OkC (dtb_u_u278) -> (let dtb_u_u284 = Obj.obj (((v_splitMainFile dtb_u_u265) dtb_u_u251)) in (let dtb_u_u286 = (dtb_u_u284 dtb_u_u270) in (let dtb_u_u288 = (match dtb_u_u286 with
  | Base_dDiag.C_Check_ErrC (dtb_u_u290) -> (Base_dDiag.C_Check_ErrC (dtb_u_u290))
  | Base_dDiag.C_Check_OkC (dtb_u_u291) -> (let dtb_u_u292 = { Driver_dSplit.f_SplitFile_splitName = (Vuna_dTarget_dOcaml_dAssembly.v_runtimeUnit ^ ".ml"); Driver_dSplit.f_SplitFile_splitText = ""; Driver_dSplit.f_SplitFile_splitDeps = B_dData_dList.C_List_Nil } in (let dtb_u_u293 = { Driver_dSplit.f_SplitFile_splitName = (Vuna_dTarget_dOcaml_dAssembly.v_deflocsUnit ^ ".ml"); Driver_dSplit.f_SplitFile_splitText = ""; Driver_dSplit.f_SplitFile_splitDeps = (B_dData_dList.C_List__x58__x58_ (Vuna_dTarget_dOcaml_dAssembly.v_runtimeUnit, B_dData_dList.C_List_Nil)) } in (let dtb_u_u294 = ((Driver_dSplit.v_pruneSplitFiles (B_dData_dList.C_List__x58__x58_ (Vuna_dTarget_dOcaml_dAssembly.v_runtimeUnit, (B_dData_dList.C_List__x58__x58_ (Vuna_dTarget_dOcaml_dAssembly.v_deflocsUnit, (B_dData_dList.C_List__x58__x58_ ((Driver_dSplit.v_splitUnitOfFile dtb_u_u291), B_dData_dList.C_List_Nil))))))) (B_dData_dList.C_List__x58__x58_ (dtb_u_u292, (B_dData_dList.C_List__x58__x58_ (dtb_u_u293, ((B_dData_dList.v_append dtb_u_u278) (B_dData_dList.C_List__x58__x58_ (dtb_u_u291, B_dData_dList.C_List_Nil)))))))) in (let dtb_u_u295 = ((B_dData_dList.v_map Driver_dSplit.v_splitUnitOfFile) dtb_u_u294) in (let dtb_u_u296 = ((B_dData_dList.v_map Driver_dSplit.v_splitText) ((B_dData_dList.v_filter (fun (dtb_u_u307 : Driver_dSplit.t_SplitFile) -> (B_dData_dBool.v_not (if ((Driver_dSplit.v_splitUnitOfFile dtb_u_u307) = Vuna_dTarget_dOcaml_dAssembly.v_runtimeUnit) then true else ((Driver_dSplit.v_splitUnitOfFile dtb_u_u307) = Vuna_dTarget_dOcaml_dAssembly.v_deflocsUnit))))) dtb_u_u294)) in (let dtb_u_u297 = (((v_dtRuntimeFor dtb_u_u257) dtb_u_u258) dtb_u_u296) in (let dtb_u_u298 = ((B_dData_dList.v_filter (fun (dtb_u_u306 : (string, (string, int) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> ((B_dData_dList.v_memName (v_unitOfLocName (B_dData_dPair.v_firstOf dtb_u_u306))) dtb_u_u295))) dtb_u_u259) in (let dtb_u_u299 = (Vuna_dTarget_dOcaml_dTerm.v_dtDefLocsUnit (((Vuna_dTarget_dOcaml_dTerm.v_dtDefLocTable dtb_u_u256) v_unitOfLocName) dtb_u_u298)) in (let dtb_u_u300 = ((B_dData_dList.v_map (fun (dtb_u_u305 : Driver_dSplit.t_SplitFile) -> (if ((Driver_dSplit.v_splitUnitOfFile dtb_u_u305) = Vuna_dTarget_dOcaml_dAssembly.v_runtimeUnit) then { Driver_dSplit.f_SplitFile_splitName = (Driver_dSplit.v_splitName dtb_u_u305); Driver_dSplit.f_SplitFile_splitText = dtb_u_u297; Driver_dSplit.f_SplitFile_splitDeps = (Driver_dSplit.v_splitDeps dtb_u_u305) } else (if ((Driver_dSplit.v_splitUnitOfFile dtb_u_u305) = Vuna_dTarget_dOcaml_dAssembly.v_deflocsUnit) then { Driver_dSplit.f_SplitFile_splitName = (Driver_dSplit.v_splitName dtb_u_u305); Driver_dSplit.f_SplitFile_splitText = dtb_u_u299; Driver_dSplit.f_SplitFile_splitDeps = (Driver_dSplit.v_splitDeps dtb_u_u305) } else dtb_u_u305)))) dtb_u_u294) in (match (v_checkSplitNames dtb_u_u300) with
  | Base_dDiag.C_Check_ErrC (dtb_u_u301) -> (Base_dDiag.C_Check_ErrC (dtb_u_u301))
  | Base_dDiag.C_Check_OkC (dtb_u_u302) -> (match (v_checkSplitAcyclic dtb_u_u300) with
  | Base_dDiag.C_Check_ErrC (dtb_u_u303) -> (Base_dDiag.C_Check_ErrC (dtb_u_u303))
  | Base_dDiag.C_Check_OkC (dtb_u_u304) -> (Base_dDiag.C_Check_OkC (dtb_u_u300))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))))))))
  | _ -> failwith "DT: impossible branch"
) in dtb_u_u288)))
  | _ -> failwith "DT: impossible branch"
)))))))))))))

# 409 "Vuna/Compiler/Driver/SplitGen.vuna"
let v_splitProgramChecked = (fun (dtb_u_u310 : Lowering_dEnv.t_LwEnv) (dtb_u_u311 : (string, Frontend_dAst.t_Decl B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u312 : Frontend_dAst.t_Decl B_dData_dList.t_List) (dtb_u_u313 : bool) (dtb_u_u314 : Elab_dTypes.t_DtDef B_dData_dList.t_List) (dtb_u_u315 : Elab_dTypes.t_DtData B_dData_dList.t_List) (dtb_u_u316 : Driver_dOwner.t_SplitMeta) (dtb_u_u317 : (string) -> string) (dtb_u_u318 : Vuna_dIr_dModel.t_IrShared) (dtb_u_u319 : bool) (dtb_u_u320 : (string, (string, int) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match (((((v_checkResolvedModules dtb_u_u316) dtb_u_u311) dtb_u_u312) dtb_u_u314) dtb_u_u315) with
  | Base_dDiag.C_Check_ErrC (dtb_u_u321) -> (let dtb_u_u323 = (Base_dDiag.C_Check_ErrC (dtb_u_u321)) in (Obj.repr ((fun (dtb_u_u324 : B_dEffect_dCore.t_EffUnit) -> dtb_u_u323))))
  | Base_dDiag.C_Check_OkC (dtb_u_u325) -> (match ((Driver_dOwner.v_nameOwnerPairsOfDefs dtb_u_u316) dtb_u_u314) with
  | Base_dDiag.C_Check_ErrC (dtb_u_u326) -> (let dtb_u_u328 = (Base_dDiag.C_Check_ErrC (dtb_u_u326)) in (Obj.repr ((fun (dtb_u_u329 : B_dEffect_dCore.t_EffUnit) -> dtb_u_u328))))
  | Base_dDiag.C_Check_OkC (dtb_u_u330) -> (match ((Driver_dOwner.v_nameOwnerPairsOfDatas dtb_u_u316) dtb_u_u315) with
  | Base_dDiag.C_Check_ErrC (dtb_u_u331) -> (let dtb_u_u333 = (Base_dDiag.C_Check_ErrC (dtb_u_u331)) in (Obj.repr ((fun (dtb_u_u334 : B_dEffect_dCore.t_EffUnit) -> dtb_u_u333))))
  | Base_dDiag.C_Check_OkC (dtb_u_u335) -> (((((((((((v_splitWithOwners dtb_u_u310) dtb_u_u311) dtb_u_u313) dtb_u_u315) dtb_u_u314) dtb_u_u330) dtb_u_u335) dtb_u_u317) dtb_u_u318) dtb_u_u319) dtb_u_u320)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 391 "Vuna/Compiler/Driver/SplitGen.vuna"
let v_splitProgramFiles = (fun (dtb_u_u337 : Lowering_dEnv.t_LwEnv) (dtb_u_u338 : (string, Frontend_dAst.t_Decl B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u339 : Frontend_dAst.t_Decl B_dData_dList.t_List) (dtb_u_u340 : bool) (dtb_u_u341 : Elab_dTypes.t_DtDef B_dData_dList.t_List) (dtb_u_u342 : Elab_dTypes.t_DtData B_dData_dList.t_List) (dtb_u_u343 : Driver_dOwner.t_SplitMeta) (dtb_u_u344 : (string) -> string) (dtb_u_u345 : Vuna_dIr_dModel.t_IrShared) (dtb_u_u346 : bool) (dtb_u_u347 : (string, (string, int) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match (Lowering_dProgram.v_checkProgramOf dtb_u_u337) with
  | Base_dDiag.C_Check_ErrC (dtb_u_u348) -> (let dtb_u_u350 = (Base_dDiag.C_Check_ErrC (dtb_u_u348)) in (Obj.repr ((fun (dtb_u_u351 : B_dEffect_dCore.t_EffUnit) -> dtb_u_u350))))
  | Base_dDiag.C_Check_OkC (dtb_u_u352) -> (((((((((((v_splitProgramChecked dtb_u_u337) dtb_u_u338) dtb_u_u339) dtb_u_u340) dtb_u_u341) dtb_u_u342) dtb_u_u343) dtb_u_u344) dtb_u_u345) dtb_u_u346) dtb_u_u347)
  | _ -> failwith "DT: impossible branch"
))

# 348 "Vuna/Compiler/Driver/SplitGen.vuna"
let v_generateDtSplitProgram = (fun (dtb_u_u354 : (string, Frontend_dAst.t_Decl B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u355 : Frontend_dAst.t_Decl B_dData_dList.t_List) (dtb_u_u356 : Elab_dTypes.t_DtProgram) (dtb_u_u357 : bool) (dtb_u_u358 : string B_dData_dList.t_List) (dtb_u_u359 : string) (dtb_u_u360 : (string, (string, int) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match (Lowering_dEnv.v_eraseDefs (Elab_dTypes.v_dtProgDefs dtb_u_u356)) with
  | Base_dDiag.C_Check_ErrC (dtb_u_u361) -> (let dtb_u_u363 = (Base_dDiag.C_Check_ErrC (dtb_u_u361)) in (Obj.repr ((fun (dtb_u_u364 : B_dEffect_dCore.t_EffUnit) -> dtb_u_u363))))
  | Base_dDiag.C_Check_OkC (dtb_u_u365) -> (match (Lowering_dEntry.v_lowerEntryOf dtb_u_u365) with
  | Base_dDiag.C_Check_ErrC (dtb_u_u366) -> (let dtb_u_u368 = (Base_dDiag.C_Check_ErrC (dtb_u_u366)) in (Obj.repr ((fun (dtb_u_u369 : B_dEffect_dCore.t_EffUnit) -> dtb_u_u368))))
  | Base_dDiag.C_Check_OkC (dtb_u_u370) -> (let dtb_u_u371 = (v_entryIsActionM dtb_u_u370) in (let dtb_u_u372 = (if ((dtp_log_on 2) "Vuna.Compiler.Driver.SplitGen") then (((dtp_log_emit 2) "Vuna.Compiler.Driver.SplitGen") "cg-splitstart") else 0) in (let dtb_u_u373 = (Lowering_dEnv.v_rtDatasOf (Elab_dTypes.v_dtProgDatas dtb_u_u356)) in (let dtb_u_u374 = (Lowering_dProgram.v_partitionRuntimeDefs dtb_u_u365) in (let dtb_u_u375 = (((((Lowering_dEnv.v_mkLwEnvFromErased (Elab_dTypes.v_dtProgDatas dtb_u_u356)) dtb_u_u365) (Elab_dTypes.v_dtProgDefs dtb_u_u356)) (Elab_dTypes.v_dtProgGlobals dtb_u_u356)) (v_splitUnitOfModule Driver_dOwner.v_entryOwner)) in (let dtb_u_u376 = (Lowering_dEnv.v_lwEnvShared dtb_u_u375) in (let dtb_u_u377 = ((Driver_dOwner.v_splitMetaOf dtb_u_u354) dtb_u_u355) in (let dtb_u_u378 = (if ((dtp_log_on 2) "Vuna.Compiler.Driver.SplitGen") then (((dtp_log_emit 2) "Vuna.Compiler.Driver.SplitGen") "cg-splitmeta-done") else 0) in (let dtb_u_u379 = ((B_dData_dList.v_append (dtb_u_u376).Vuna_dIr_dModel.f_IrShared_irSharedDefLocs) dtb_u_u360) in (let dtb_u_u380 = (if ((dtp_log_on 2) "Vuna.Compiler.Driver.SplitGen") then (((dtp_log_emit 2) "Vuna.Compiler.Driver.SplitGen") "cg-deflocs-done") else 0) in (((((((((((v_splitProgramFiles dtb_u_u375) dtb_u_u354) dtb_u_u355) dtb_u_u357) dtb_u_u374) dtb_u_u373) dtb_u_u377) ((v_splitLocPath dtb_u_u358) dtb_u_u359)) dtb_u_u376) dtb_u_u371) dtb_u_u379)))))))))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 177 "Vuna/Compiler/Driver/SplitGen.vuna"
let v_sgcEnv = (fun (dtb_u_u381 : t_SplitGenCtx) -> (match dtb_u_u381 with
  | { f_SplitGenCtx_sgcEnv = dtb_u_u382; f_SplitGenCtx_sgcAllDefs = dtb_u_u383; f_SplitGenCtx_sgcDefOwnerT = dtb_u_u384; f_SplitGenCtx_sgcDataOwnerT = dtb_u_u385; f_SplitGenCtx_sgcDefUnitT = dtb_u_u386; f_SplitGenCtx_sgcDataUnitT = dtb_u_u387; f_SplitGenCtx_sgcOrdered = dtb_u_u388; f_SplitGenCtx_sgcDefBuckets = dtb_u_u389; f_SplitGenCtx_sgcDataBuckets = dtb_u_u390; f_SplitGenCtx_sgcNormPath = dtb_u_u391 } -> dtb_u_u382
  | _ -> failwith "DT: impossible branch"
))

# 178 "Vuna/Compiler/Driver/SplitGen.vuna"
let v_sgcAllDefs = (fun (dtb_u_u392 : t_SplitGenCtx) -> (match dtb_u_u392 with
  | { f_SplitGenCtx_sgcEnv = dtb_u_u393; f_SplitGenCtx_sgcAllDefs = dtb_u_u394; f_SplitGenCtx_sgcDefOwnerT = dtb_u_u395; f_SplitGenCtx_sgcDataOwnerT = dtb_u_u396; f_SplitGenCtx_sgcDefUnitT = dtb_u_u397; f_SplitGenCtx_sgcDataUnitT = dtb_u_u398; f_SplitGenCtx_sgcOrdered = dtb_u_u399; f_SplitGenCtx_sgcDefBuckets = dtb_u_u400; f_SplitGenCtx_sgcDataBuckets = dtb_u_u401; f_SplitGenCtx_sgcNormPath = dtb_u_u402 } -> dtb_u_u394
  | _ -> failwith "DT: impossible branch"
))

# 179 "Vuna/Compiler/Driver/SplitGen.vuna"
let v_sgcDefOwnerT = (fun (dtb_u_u403 : t_SplitGenCtx) -> (match dtb_u_u403 with
  | { f_SplitGenCtx_sgcEnv = dtb_u_u404; f_SplitGenCtx_sgcAllDefs = dtb_u_u405; f_SplitGenCtx_sgcDefOwnerT = dtb_u_u406; f_SplitGenCtx_sgcDataOwnerT = dtb_u_u407; f_SplitGenCtx_sgcDefUnitT = dtb_u_u408; f_SplitGenCtx_sgcDataUnitT = dtb_u_u409; f_SplitGenCtx_sgcOrdered = dtb_u_u410; f_SplitGenCtx_sgcDefBuckets = dtb_u_u411; f_SplitGenCtx_sgcDataBuckets = dtb_u_u412; f_SplitGenCtx_sgcNormPath = dtb_u_u413 } -> dtb_u_u406
  | _ -> failwith "DT: impossible branch"
))

# 180 "Vuna/Compiler/Driver/SplitGen.vuna"
let v_sgcDataOwnerT = (fun (dtb_u_u414 : t_SplitGenCtx) -> (match dtb_u_u414 with
  | { f_SplitGenCtx_sgcEnv = dtb_u_u415; f_SplitGenCtx_sgcAllDefs = dtb_u_u416; f_SplitGenCtx_sgcDefOwnerT = dtb_u_u417; f_SplitGenCtx_sgcDataOwnerT = dtb_u_u418; f_SplitGenCtx_sgcDefUnitT = dtb_u_u419; f_SplitGenCtx_sgcDataUnitT = dtb_u_u420; f_SplitGenCtx_sgcOrdered = dtb_u_u421; f_SplitGenCtx_sgcDefBuckets = dtb_u_u422; f_SplitGenCtx_sgcDataBuckets = dtb_u_u423; f_SplitGenCtx_sgcNormPath = dtb_u_u424 } -> dtb_u_u418
  | _ -> failwith "DT: impossible branch"
))

# 181 "Vuna/Compiler/Driver/SplitGen.vuna"
let v_sgcDefUnitT = (fun (dtb_u_u425 : t_SplitGenCtx) -> (match dtb_u_u425 with
  | { f_SplitGenCtx_sgcEnv = dtb_u_u426; f_SplitGenCtx_sgcAllDefs = dtb_u_u427; f_SplitGenCtx_sgcDefOwnerT = dtb_u_u428; f_SplitGenCtx_sgcDataOwnerT = dtb_u_u429; f_SplitGenCtx_sgcDefUnitT = dtb_u_u430; f_SplitGenCtx_sgcDataUnitT = dtb_u_u431; f_SplitGenCtx_sgcOrdered = dtb_u_u432; f_SplitGenCtx_sgcDefBuckets = dtb_u_u433; f_SplitGenCtx_sgcDataBuckets = dtb_u_u434; f_SplitGenCtx_sgcNormPath = dtb_u_u435 } -> dtb_u_u430
  | _ -> failwith "DT: impossible branch"
))

# 182 "Vuna/Compiler/Driver/SplitGen.vuna"
let v_sgcDataUnitT = (fun (dtb_u_u436 : t_SplitGenCtx) -> (match dtb_u_u436 with
  | { f_SplitGenCtx_sgcEnv = dtb_u_u437; f_SplitGenCtx_sgcAllDefs = dtb_u_u438; f_SplitGenCtx_sgcDefOwnerT = dtb_u_u439; f_SplitGenCtx_sgcDataOwnerT = dtb_u_u440; f_SplitGenCtx_sgcDefUnitT = dtb_u_u441; f_SplitGenCtx_sgcDataUnitT = dtb_u_u442; f_SplitGenCtx_sgcOrdered = dtb_u_u443; f_SplitGenCtx_sgcDefBuckets = dtb_u_u444; f_SplitGenCtx_sgcDataBuckets = dtb_u_u445; f_SplitGenCtx_sgcNormPath = dtb_u_u446 } -> dtb_u_u442
  | _ -> failwith "DT: impossible branch"
))

# 183 "Vuna/Compiler/Driver/SplitGen.vuna"
let v_sgcOrdered = (fun (dtb_u_u447 : t_SplitGenCtx) -> (match dtb_u_u447 with
  | { f_SplitGenCtx_sgcEnv = dtb_u_u448; f_SplitGenCtx_sgcAllDefs = dtb_u_u449; f_SplitGenCtx_sgcDefOwnerT = dtb_u_u450; f_SplitGenCtx_sgcDataOwnerT = dtb_u_u451; f_SplitGenCtx_sgcDefUnitT = dtb_u_u452; f_SplitGenCtx_sgcDataUnitT = dtb_u_u453; f_SplitGenCtx_sgcOrdered = dtb_u_u454; f_SplitGenCtx_sgcDefBuckets = dtb_u_u455; f_SplitGenCtx_sgcDataBuckets = dtb_u_u456; f_SplitGenCtx_sgcNormPath = dtb_u_u457 } -> dtb_u_u454
  | _ -> failwith "DT: impossible branch"
))

# 185 "Vuna/Compiler/Driver/SplitGen.vuna"
let v_sgcDefBuckets = (fun (dtb_u_u458 : t_SplitGenCtx) -> (match dtb_u_u458 with
  | { f_SplitGenCtx_sgcEnv = dtb_u_u459; f_SplitGenCtx_sgcAllDefs = dtb_u_u460; f_SplitGenCtx_sgcDefOwnerT = dtb_u_u461; f_SplitGenCtx_sgcDataOwnerT = dtb_u_u462; f_SplitGenCtx_sgcDefUnitT = dtb_u_u463; f_SplitGenCtx_sgcDataUnitT = dtb_u_u464; f_SplitGenCtx_sgcOrdered = dtb_u_u465; f_SplitGenCtx_sgcDefBuckets = dtb_u_u466; f_SplitGenCtx_sgcDataBuckets = dtb_u_u467; f_SplitGenCtx_sgcNormPath = dtb_u_u468 } -> dtb_u_u466
  | _ -> failwith "DT: impossible branch"
))

# 186 "Vuna/Compiler/Driver/SplitGen.vuna"
let v_sgcDataBuckets = (fun (dtb_u_u469 : t_SplitGenCtx) -> (match dtb_u_u469 with
  | { f_SplitGenCtx_sgcEnv = dtb_u_u470; f_SplitGenCtx_sgcAllDefs = dtb_u_u471; f_SplitGenCtx_sgcDefOwnerT = dtb_u_u472; f_SplitGenCtx_sgcDataOwnerT = dtb_u_u473; f_SplitGenCtx_sgcDefUnitT = dtb_u_u474; f_SplitGenCtx_sgcDataUnitT = dtb_u_u475; f_SplitGenCtx_sgcOrdered = dtb_u_u476; f_SplitGenCtx_sgcDefBuckets = dtb_u_u477; f_SplitGenCtx_sgcDataBuckets = dtb_u_u478; f_SplitGenCtx_sgcNormPath = dtb_u_u479 } -> dtb_u_u478
  | _ -> failwith "DT: impossible branch"
))

# 188 "Vuna/Compiler/Driver/SplitGen.vuna"
let v_sgcNormPath = (fun dtb_u_u480 -> (match dtb_u_u480 with
  | { f_SplitGenCtx_sgcEnv = dtb_u_u481; f_SplitGenCtx_sgcAllDefs = dtb_u_u482; f_SplitGenCtx_sgcDefOwnerT = dtb_u_u483; f_SplitGenCtx_sgcDataOwnerT = dtb_u_u484; f_SplitGenCtx_sgcDefUnitT = dtb_u_u485; f_SplitGenCtx_sgcDataUnitT = dtb_u_u486; f_SplitGenCtx_sgcOrdered = dtb_u_u487; f_SplitGenCtx_sgcDefBuckets = dtb_u_u488; f_SplitGenCtx_sgcDataBuckets = dtb_u_u489; f_SplitGenCtx_sgcNormPath = dtb_u_u490 } -> dtb_u_u490
  | _ -> failwith "DT: impossible branch"
))
