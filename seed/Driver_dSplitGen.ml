open Vuna_runtime
type t_SplitGenCtx = { f_SplitGenCtx_sgcEnv : Lowering_dEnv.t_LwEnv; f_SplitGenCtx_sgcAllDefs : Elab_dTypes.t_DtDef B_dData_dList.t_List; f_SplitGenCtx_sgcDefOwnerT : (string, string) B_dContainer_dHashMap.t_HashMap; f_SplitGenCtx_sgcDataOwnerT : (string, string) B_dContainer_dHashMap.t_HashMap; f_SplitGenCtx_sgcDefUnitT : (string, string) B_dContainer_dHashMap.t_HashMap; f_SplitGenCtx_sgcDataUnitT : (string, string) B_dContainer_dHashMap.t_HashMap; f_SplitGenCtx_sgcOrdered : string B_dData_dList.t_List; f_SplitGenCtx_sgcDefBuckets : (string, Elab_dTypes.t_DtDef B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap; f_SplitGenCtx_sgcDataBuckets : (string, Elab_dTypes.t_DtData B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap; f_SplitGenCtx_sgcNormPath : (string) -> string }

# 40 "Vuna/Compiler/Driver/SplitGen.vuna"
let v_compilerPkgPrefix = "Vuna.Compiler."

# 43 "Vuna/Compiler/Driver/SplitGen.vuna"
let v_basePkgPrefix = "Base."

# 46 "Vuna/Compiler/Driver/SplitGen.vuna"
let v_unitPathOf = (fun (m : string) -> (if ((B_dData_dString.v_startsWith v_compilerPkgPrefix) m) then (((dtp_substring (bi_strLength v_compilerPkgPrefix)) ((bi_strLength m) - (bi_strLength v_compilerPkgPrefix))) m) else (if ((B_dData_dString.v_startsWith v_basePkgPrefix) m) then ("B." ^ (((dtp_substring (bi_strLength v_basePkgPrefix)) ((bi_strLength m) - (bi_strLength v_basePkgPrefix))) m)) else m)))

# 37 "Vuna/Compiler/Driver/SplitGen.vuna"
let v_splitUnitOfModule = (fun (modName : string) -> (Vuna_dTarget_dOcaml_dDecl.v_sanitizeName (v_unitPathOf modName)))

# 57 "Vuna/Compiler/Driver/SplitGen.vuna"
let v_unitOfLocName = (fun (name : string) -> (let p = (Driver_dOwner.v_modulePrefixOfName name) in (if (p = "") then (v_splitUnitOfModule Driver_dOwner.v_entryOwner) else (v_splitUnitOfModule p))))

# 65 "Vuna/Compiler/Driver/SplitGen.vuna"
let v_mainInitPrologue = "let () = Printexc.record_backtrace true\n"

# 73 "Vuna/Compiler/Driver/SplitGen.vuna"
let v_ownerTblOf = (fun (pairs : (string, string) B_dData_dPair.t_Pair B_dData_dList.t_List) -> ((((B_dContainer_dHashMap.v_insertAll B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) pairs) (((B_dContainer_dHashMap.v_fromList B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) B_dData_dList.C_List_Nil)))

# 82 "Vuna/Compiler/Driver/SplitGen.vuna"
let rec v_defBucketsGo = (fun (mc0 : (string, string) B_dContainer_dHashMap.t_HashMap) (mc1 : Elab_dTypes.t_DtDef B_dData_dList.t_List) (mc2 : (string, Elab_dTypes.t_DtDef B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__0, dtb__1) -> (let owner = (match ((((B_dContainer_dHashMap.v_lookup B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) (Elab_dTypes.v_dtDefName dtb__0)) mc0) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__3) -> dtb__3
  | B_dData_dMaybe.C_Maybe_Nothing -> ""
  | _ -> failwith "DT: impossible branch"
) in (let bucket = (match ((((B_dContainer_dHashMap.v_lookup B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) owner) mc2) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__2) -> dtb__2
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
) in (((v_defBucketsGo mc0) dtb__1) (((((B_dContainer_dHashMap.v_insert B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) owner) (B_dData_dList.C_List__x58__x58_ (dtb__0, bucket))) mc2))))
  | B_dData_dList.C_List_Nil -> mc2
  | _ -> failwith "DT: impossible branch"
))

# 79 "Vuna/Compiler/Driver/SplitGen.vuna"
let v_defBucketsOf = (fun (ownerT : (string, string) B_dContainer_dHashMap.t_HashMap) (defs : Elab_dTypes.t_DtDef B_dData_dList.t_List) -> (((v_defBucketsGo ownerT) (B_dData_dList.v_reverse defs)) (((B_dContainer_dHashMap.v_fromList B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) B_dData_dList.C_List_Nil)))

# 99 "Vuna/Compiler/Driver/SplitGen.vuna"
let rec v_dataBucketsGo = (fun (mc0 : (string, string) B_dContainer_dHashMap.t_HashMap) (mc1 : Elab_dTypes.t_DtData B_dData_dList.t_List) (mc2 : (string, Elab_dTypes.t_DtData B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__4, dtb__5) -> (let owner = (match ((((B_dContainer_dHashMap.v_lookup B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) (Elab_dTypes.v_dtDataName dtb__4)) mc0) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__7) -> dtb__7
  | B_dData_dMaybe.C_Maybe_Nothing -> ""
  | _ -> failwith "DT: impossible branch"
) in (let bucket = (match ((((B_dContainer_dHashMap.v_lookup B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) owner) mc2) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__6) -> dtb__6
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
) in (((v_dataBucketsGo mc0) dtb__5) (((((B_dContainer_dHashMap.v_insert B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) owner) (B_dData_dList.C_List__x58__x58_ (dtb__4, bucket))) mc2))))
  | B_dData_dList.C_List_Nil -> mc2
  | _ -> failwith "DT: impossible branch"
))

# 96 "Vuna/Compiler/Driver/SplitGen.vuna"
let v_dataBucketsOf = (fun (ownerT : (string, string) B_dContainer_dHashMap.t_HashMap) (datas : Elab_dTypes.t_DtData B_dData_dList.t_List) -> (((v_dataBucketsGo ownerT) (B_dData_dList.v_reverse datas)) (((B_dContainer_dHashMap.v_fromList B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) B_dData_dList.C_List_Nil)))

# 123 "Vuna/Compiler/Driver/SplitGen.vuna"
let v_knownUnit = (fun (units : string B_dData_dList.t_List) (u : string) -> ((B_dData_dList.v_memName u) units))

# 126 "Vuna/Compiler/Driver/SplitGen.vuna"
let rec v_checkDepsKnown = (fun (mc0 : string B_dData_dList.t_List) (mc1 : string) (mc2 : string B_dData_dList.t_List) -> (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__8, dtb__9) -> (if (B_dData_dBool.v_not ((v_knownUnit mc0) dtb__8)) then (Base_dDiag.v_icInternal (String.concat "" [mc1; " references unknown unit `"; dtb__8; "`"])) else (if (B_dData_dBool.v_not ((v_knownUnit mc0) mc1)) then (Base_dDiag.v_icInternal (String.concat "" ["split unit `"; mc1; "` is not in the module order"])) else (((v_checkDepsKnown mc0) mc1) dtb__9)))
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (0))
  | _ -> failwith "DT: impossible branch"
))

# 137 "Vuna/Compiler/Driver/SplitGen.vuna"
let v_depsInOrder = (fun (ordered : string B_dData_dList.t_List) (self : string) (deps : string B_dData_dList.t_List) -> ((B_dData_dList.v_filter (fun (u : string) -> (if (B_dData_dBool.v_not (u = self)) then ((B_dData_dList.v_memName u) deps) else false))) ordered))

# 140 "Vuna/Compiler/Driver/SplitGen.vuna"
let v_unitDepsOf = (fun (ordered : string B_dData_dList.t_List) (self : string) (deps : string B_dData_dList.t_List) -> ((Base_dCommon.v_bind (((v_checkDepsKnown ordered) self) deps)) (fun (_u : int) -> (Base_dDiag.C_Check_OkC ((((v_depsInOrder ordered) self) deps))))))

# 155 "Vuna/Compiler/Driver/SplitGen.vuna"
let rec v_depsKnown = (fun (mc0 : string B_dData_dList.t_List) (mc1 : string B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__10, dtb__11) -> (if ((v_knownUnit mc0) dtb__10) then ((v_depsKnown mc0) dtb__11) else false)
  | B_dData_dList.C_List_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

# 152 "Vuna/Compiler/Driver/SplitGen.vuna"
let v_cachedUnitOk = (fun (mc0 : string B_dData_dList.t_List) (mc1 : string) (mc2 : Driver_dSplit.t_SplitFile) -> (match mc2 with
  | { Driver_dSplit.f_SplitFile_splitName = dtb__12; Driver_dSplit.f_SplitFile_splitText = dtb__13; Driver_dSplit.f_SplitFile_splitDeps = dtb__14 } -> (if (dtb__12 = (mc1 ^ ".ml")) then ((v_depsKnown mc0) dtb__14) else false)
  | _ -> failwith "DT: impossible branch"
))

# 160 "Vuna/Compiler/Driver/SplitGen.vuna"
let v_keepCached = (fun (mc0 : string B_dData_dList.t_List) (mc1 : string) (mc2 : Driver_dSplit.t_SplitFile B_dData_dMaybe.t_Maybe) -> (match mc2 with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb__15) -> (if (((v_cachedUnitOk mc0) mc1) dtb__15) then (B_dData_dMaybe.C_Maybe_Just (dtb__15)) else B_dData_dMaybe.C_Maybe_Nothing)
  | _ -> failwith "DT: impossible branch"
))

# 165 "Vuna/Compiler/Driver/SplitGen.vuna"
let rec v_uniqueSplitNames = (fun (mc0 : Driver_dSplit.t_SplitFile B_dData_dList.t_List) (mc1 : string B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__16, dtb__17) -> (match dtb__16 with
  | { Driver_dSplit.f_SplitFile_splitName = dtb__18; Driver_dSplit.f_SplitFile_splitText = dtb__19; Driver_dSplit.f_SplitFile_splitDeps = dtb__20 } -> (if ((B_dData_dList.v_memName dtb__18) mc1) then false else ((v_uniqueSplitNames dtb__17) (B_dData_dList.C_List__x58__x58_ (dtb__18, mc1))))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

# 170 "Vuna/Compiler/Driver/SplitGen.vuna"
let v_checkSplitNames = (fun (files : Driver_dSplit.t_SplitFile B_dData_dList.t_List) -> (if ((v_uniqueSplitNames files) B_dData_dList.C_List_Nil) then (Base_dDiag.C_Check_OkC (0)) else (Base_dDiag.v_icInternal "split unit name collides with another module (codegen unit naming)")))

# 180 "Vuna/Compiler/Driver/SplitGen.vuna"
let v_checkSplitAcyclic = (fun (files : Driver_dSplit.t_SplitFile B_dData_dList.t_List) -> (if (Driver_dSplit.v_splitGraphAcyclic files) then (Base_dDiag.C_Check_OkC (0)) else (Base_dDiag.v_icInternal "split dependency graph has a cycle (unit order is not a DAG)")))

# 203 "Vuna/Compiler/Driver/SplitGen.vuna"
let v_defsOfUnit = (fun (ctx : t_SplitGenCtx) (u : string) -> (match ((((B_dContainer_dHashMap.v_lookup B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) u) (ctx).f_SplitGenCtx_sgcDefBuckets) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__21) -> dtb__21
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 209 "Vuna/Compiler/Driver/SplitGen.vuna"
let v_datasOfUnit = (fun (ctx : t_SplitGenCtx) (u : string) -> (match ((((B_dContainer_dHashMap.v_lookup B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) u) (ctx).f_SplitGenCtx_sgcDataBuckets) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__22) -> dtb__22
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 215 "Vuna/Compiler/Driver/SplitGen.vuna"
let v_mapToUnit = (fun (pairs : (string, string) B_dData_dPair.t_Pair B_dData_dList.t_List) -> ((B_dData_dList.v_map (fun (q : (string, string) B_dData_dPair.t_Pair) -> { B_dData_dPair.f_Pair_first = (B_dData_dPair.v_firstOf q); B_dData_dPair.f_Pair_second = (v_splitUnitOfModule (B_dData_dPair.v_secondOf q)) })) pairs))

# 221 "Vuna/Compiler/Driver/SplitGen.vuna"
let v_checkModuleDeclName = (fun (knownModules : string B_dData_dList.t_List) (mname : string) (name : string) -> (if (Base_dSource.v_containsDot name) then (if ((B_dData_dList.v_memName (Driver_dOwner.v_modulePrefixOfName name)) knownModules) then (Base_dDiag.C_Check_OkC (0)) else (Base_dDiag.v_icInternal (String.concat "" ["module "; mname; " declares `"; name; "` whose module prefix `"; (Driver_dOwner.v_modulePrefixOfName name); "` is not a known module (codegen requires Loader-resolved decls)"]))) else (Base_dDiag.v_icInternal (String.concat "" ["module "; mname; " has an unresolved declaration name `"; name; "` (codegen requires Loader-resolved decls)"]))))

# 233 "Vuna/Compiler/Driver/SplitGen.vuna"
let rec v_checkModuleDeclNames = (fun (mc0 : string B_dData_dList.t_List) (mc1 : string) (mc2 : string B_dData_dList.t_List) -> (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__23, dtb__24) -> ((Base_dCommon.v_bind (((v_checkModuleDeclName mc0) mc1) dtb__23)) (fun (_u : int) -> (((v_checkModuleDeclNames mc0) mc1) dtb__24)))
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (0))
  | _ -> failwith "DT: impossible branch"
))

# 240 "Vuna/Compiler/Driver/SplitGen.vuna"
let rec v_checkModuleDecls = (fun (mc0 : string B_dData_dList.t_List) (mc1 : (string, Frontend_dAst.t_Decl B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__25, dtb__26) -> (match dtb__25 with
  | { B_dData_dPair.f_Pair_first = dtb__27; B_dData_dPair.f_Pair_second = dtb__28 } -> ((Base_dCommon.v_bind (((v_checkModuleDeclNames mc0) dtb__27) (Driver_dOwner.v_splitDeclNames dtb__28))) (fun (_u : int) -> ((v_checkModuleDecls mc0) dtb__26)))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (0))
  | _ -> failwith "DT: impossible branch"
))

# 251 "Vuna/Compiler/Driver/SplitGen.vuna"
let rec v_entryDeclIdentities = (fun (mc0 : Frontend_dAst.t_Decl B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__29, dtb__30) -> (match dtb__29 with
  | Frontend_dAst.C_Decl_DSig (dtb__31, dtb__32, dtb__33, dtb__34) -> (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = false; B_dData_dPair.f_Pair_second = dtb__31 }, (v_entryDeclIdentities dtb__30)))
  | Frontend_dAst.C_Decl_DExtern (dtb__35, dtb__36, dtb__37, dtb__38) -> (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = false; B_dData_dPair.f_Pair_second = dtb__35 }, (v_entryDeclIdentities dtb__30)))
  | Frontend_dAst.C_Decl_DData (dtb__39, dtb__40, dtb__41, dtb__42, dtb__43, dtb__44, dtb__45, dtb__46, dtb__47) -> (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = true; B_dData_dPair.f_Pair_second = dtb__39 }, (v_entryDeclIdentities dtb__30)))
  | Frontend_dAst.C_Decl_DRecord (dtb__48, dtb__49, dtb__50, dtb__51, dtb__52, dtb__53, dtb__54, dtb__55) -> (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = true; B_dData_dPair.f_Pair_second = dtb__48 }, (v_entryDeclIdentities dtb__30)))
  | Frontend_dAst.C_Decl_DTrait (dtb__56, dtb__57, dtb__58, dtb__59, dtb__60) -> (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = true; B_dData_dPair.f_Pair_second = dtb__56 }, (v_entryDeclIdentities dtb__30)))
  | _ -> (v_entryDeclIdentities dtb__30)
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 264 "Vuna/Compiler/Driver/SplitGen.vuna"
let v_entryDeclKey = (fun (mc0 : (bool, string) B_dData_dPair.t_Pair) -> (match mc0 with
  | { B_dData_dPair.f_Pair_first = dtb__61; B_dData_dPair.f_Pair_second = dtb__62 } -> (if dtb__61 then ("type\t" ^ dtb__62) else ("value\t" ^ dtb__62))
  | _ -> failwith "DT: impossible branch"
))

# 268 "Vuna/Compiler/Driver/SplitGen.vuna"
let v_checkEntryDeclName = (fun (seen : string B_dData_dList.t_List) (identity : (bool, string) B_dData_dPair.t_Pair) -> (let name = (B_dData_dPair.v_secondOf identity) in (let key = (v_entryDeclKey identity) in (if (name = "") then (Base_dDiag.v_icInternal "entry declaration has an empty name") else (if (Base_dSource.v_containsDot name) then (Base_dDiag.v_icInternal (String.concat "" ["entry declaration `"; name; "` must not contain a module prefix (codegen requires Loader-resolved decls)"])) else (if ((B_dData_dList.v_memName key) seen) then (Base_dDiag.v_icInternal (String.concat "" ["duplicate entry declaration `"; name; "`"])) else (Base_dDiag.C_Check_OkC (0))))))))

# 280 "Vuna/Compiler/Driver/SplitGen.vuna"
let rec v_checkEntryDeclsGo = (fun (mc0 : string B_dData_dList.t_List) (mc1 : (bool, string) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__63, dtb__64) -> ((Base_dCommon.v_bind ((v_checkEntryDeclName mc0) dtb__63)) (fun (_u : int) -> ((v_checkEntryDeclsGo (B_dData_dList.C_List__x58__x58_ ((v_entryDeclKey dtb__63), mc0))) dtb__64)))
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (0))
  | _ -> failwith "DT: impossible branch"
))

# 287 "Vuna/Compiler/Driver/SplitGen.vuna"
let v_checkEntryDecls = (fun (decls : Frontend_dAst.t_Decl B_dData_dList.t_List) -> ((v_checkEntryDeclsGo B_dData_dList.C_List_Nil) (v_entryDeclIdentities decls)))

# 292 "Vuna/Compiler/Driver/SplitGen.vuna"
let rec v_checkDefOwners = (fun (mc0 : Driver_dOwner.t_SplitMeta) (mc1 : Elab_dTypes.t_DtDef B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__65, dtb__66) -> ((Base_dCommon.v_bind ((Driver_dOwner.v_splitDefOwnerOf mc0) (Elab_dTypes.v_dtDefName dtb__65))) (fun (_u : string) -> ((v_checkDefOwners mc0) dtb__66)))
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (0))
  | _ -> failwith "DT: impossible branch"
))

# 299 "Vuna/Compiler/Driver/SplitGen.vuna"
let rec v_checkDataOwners = (fun (mc0 : Driver_dOwner.t_SplitMeta) (mc1 : Elab_dTypes.t_DtData B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__67, dtb__68) -> ((Base_dCommon.v_bind ((Driver_dOwner.v_splitDataOwnerOf mc0) dtb__67)) (fun (_u : string) -> ((v_checkDataOwners mc0) dtb__68)))
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (0))
  | _ -> failwith "DT: impossible branch"
))

# 304 "Vuna/Compiler/Driver/SplitGen.vuna"
let v_checkResolvedModules = (fun (meta : Driver_dOwner.t_SplitMeta) (modules : (string, Frontend_dAst.t_Decl B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (entryDecls : Frontend_dAst.t_Decl B_dData_dList.t_List) (runtime : Elab_dTypes.t_DtDef B_dData_dList.t_List) (datas : Elab_dTypes.t_DtData B_dData_dList.t_List) -> ((Base_dCommon.v_bind ((v_checkModuleDecls (meta).Driver_dOwner.f_SplitMeta_smKnownModules) modules)) (fun (_u : int) -> ((Base_dCommon.v_bind (v_checkEntryDecls entryDecls)) (fun (_u : int) -> ((Base_dCommon.v_bind ((v_checkDefOwners meta) runtime)) (fun (_u : int) -> ((v_checkDataOwners meta) datas))))))))

# 316 "Vuna/Compiler/Driver/SplitGen.vuna"
let v_splitStripPrefix = (fun (prefix : string) (path : string) -> (if (prefix = "") then path else (if ((B_dData_dString.v_startsWith (prefix ^ "/")) path) then (((dtp_substring (bi_strLength (prefix ^ "/"))) ((bi_strLength path) - (bi_strLength (prefix ^ "/")))) path) else path)))

# 325 "Vuna/Compiler/Driver/SplitGen.vuna"
let rec v_splitStripRoots = (fun (mc0 : string B_dData_dList.t_List) (mc1 : string) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__69, dtb__70) -> (if ((B_dData_dString.v_startsWith (dtb__69 ^ "/")) mc1) then ((v_splitStripPrefix dtb__69) mc1) else ((v_splitStripRoots dtb__70) mc1))
  | B_dData_dList.C_List_Nil -> mc1
  | _ -> failwith "DT: impossible branch"
))

# 330 "Vuna/Compiler/Driver/SplitGen.vuna"
let v_splitStripDotSlash = (fun (path : string) -> (if ((B_dData_dString.v_startsWith "./") path) then (((dtp_substring 2) ((bi_strLength path) - 2)) path) else path))

# 334 "Vuna/Compiler/Driver/SplitGen.vuna"
let v_splitLocPath = (fun (roots : string B_dData_dList.t_List) (contextDir : string) (path : string) -> (v_splitStripDotSlash ((v_splitStripPrefix contextDir) ((v_splitStripRoots roots) path))))

# 340 "Vuna/Compiler/Driver/SplitGen.vuna"
let v_noUnitLookup = (fun (_u : string) -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) B_dData_dMaybe.C_Maybe_Nothing))

# 343 "Vuna/Compiler/Driver/SplitGen.vuna"
let v_noUnitStore = (fun (_u : string) (_u : Driver_dSplit.t_SplitFile) -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) 0))

# 495 "Vuna/Compiler/Driver/SplitGen.vuna"
let rec v_splitModuleFilesWith = (fun (mc0 : (string) -> Driver_dSplit.t_SplitFile B_dData_dMaybe.t_Maybe B_dEffect_dCore.t_Eff) (mc1 : (string) -> (Driver_dSplit.t_SplitFile) -> int B_dEffect_dCore.t_Eff) (mc2 : t_SplitGenCtx) (mc3 : (string, Frontend_dAst.t_Decl B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc3 with
  | B_dData_dList.C_List__x58__x58_ (dtb__71, dtb__72) -> (match dtb__71 with
  | { B_dData_dPair.f_Pair_first = dtb__73; B_dData_dPair.f_Pair_second = dtb__74 } -> (let unit = (v_splitUnitOfModule dtb__73) in (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (mc0 dtb__73)) (fun cached0 -> (let cached = (((v_keepCached (mc2).f_SplitGenCtx_sgcOrdered) unit) cached0) in (match cached with
  | B_dData_dMaybe.C_Maybe_Just (dtb__75) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((((v_splitModuleFilesWith mc0) mc1) mc2) dtb__72)) (fun tailR -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (match tailR with
  | Base_dDiag.C_Check_ErrC (dtb__76) -> (Base_dDiag.C_Check_ErrC (dtb__76))
  | Base_dDiag.C_Check_OkC (dtb__77) -> (Base_dDiag.C_Check_OkC ((B_dData_dList.C_List__x58__x58_ (dtb__75, dtb__77))))
  | _ -> failwith "DT: impossible branch"
))))
  | B_dData_dMaybe.C_Maybe_Nothing -> (let unitDatas = ((v_datasOfUnit mc2) dtb__73) in (let unitDefs = ((v_defsOfUnit mc2) dtb__73) in (let qc = { Vuna_dTarget_dOcaml_dDecl.f_QualCtx_qcUnit = unit; Vuna_dTarget_dOcaml_dDecl.f_QualCtx_qcDefs = (mc2).f_SplitGenCtx_sgcDefUnitT; Vuna_dTarget_dOcaml_dDecl.f_QualCtx_qcDatas = (mc2).f_SplitGenCtx_sgcDataUnitT } in (let envU = ((Lowering_dEnv.v_lwEnvWithUnit unit) (mc2).f_SplitGenCtx_sgcEnv) in (match (((Lowering_dProgram.v_lowerUnitCheckedFrom envU) unitDatas) unitDefs) with
  | Base_dDiag.C_Check_ErrC (dtb__78) -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (Base_dDiag.C_Check_ErrC (dtb__78)))
  | Base_dDiag.C_Check_OkC (dtb__79) -> (match ((((Vuna_dTarget_dOcaml_dAssembly.v_genUnitPartsWith (mc2).f_SplitGenCtx_sgcNormPath) qc) (Lowering_dEnv.v_lwEnvShared envU)) dtb__79) with
  | Base_dDiag.C_Check_ErrC (dtb__80) -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (Base_dDiag.C_Check_ErrC (dtb__80)))
  | Base_dDiag.C_Check_OkC (dtb__81) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((((v_splitModuleFilesWith mc0) mc1) mc2) dtb__72)) (fun tailR -> (match tailR with
  | Base_dDiag.C_Check_ErrC (dtb__82) -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (Base_dDiag.C_Check_ErrC (dtb__82)))
  | Base_dDiag.C_Check_OkC (dtb__83) -> (match (((v_unitDepsOf (mc2).f_SplitGenCtx_sgcOrdered) unit) (Vuna_dTarget_dOcaml_dAssembly.v_unitPartsDeps dtb__81)) with
  | Base_dDiag.C_Check_ErrC (dtb__84) -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (Base_dDiag.C_Check_ErrC (dtb__84)))
  | Base_dDiag.C_Check_OkC (dtb__85) -> (let sf = { Driver_dSplit.f_SplitFile_splitName = (unit ^ ".ml"); Driver_dSplit.f_SplitFile_splitText = ((Vuna_dTarget_dOcaml_dAssembly.v_genUnitText dtb__81) ^ "\n"); Driver_dSplit.f_SplitFile_splitDeps = dtb__85 } in (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((mc1 dtb__73) sf)) (fun _u -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (Base_dDiag.C_Check_OkC ((B_dData_dList.C_List__x58__x58_ (sf, dtb__83))))))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))))
  | _ -> failwith "DT: impossible branch"
)))))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (Base_dDiag.C_Check_OkC (B_dData_dList.C_List_Nil)))
  | _ -> failwith "DT: impossible branch"
))

# 540 "Vuna/Compiler/Driver/SplitGen.vuna"
let v_splitMainFileWith = (fun (lookup : (string) -> Driver_dSplit.t_SplitFile B_dData_dMaybe.t_Maybe B_dEffect_dCore.t_Eff) (store : (string) -> (Driver_dSplit.t_SplitFile) -> int B_dEffect_dCore.t_Eff) (ctx : t_SplitGenCtx) (printResult : bool) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (lookup "__entry__")) (fun cached0 -> (let cached = (((v_keepCached (ctx).f_SplitGenCtx_sgcOrdered) (v_splitUnitOfModule Driver_dOwner.v_entryOwner)) cached0) in (match cached with
  | B_dData_dMaybe.C_Maybe_Just (dtb__86) -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (Base_dDiag.C_Check_OkC (dtb__86)))
  | B_dData_dMaybe.C_Maybe_Nothing -> (let entryUnit = (v_splitUnitOfModule Driver_dOwner.v_entryOwner) in (let entryDefs = ((v_defsOfUnit ctx) Driver_dOwner.v_entryOwner) in (let entryDatas = ((v_datasOfUnit ctx) Driver_dOwner.v_entryOwner) in (let qc = { Vuna_dTarget_dOcaml_dDecl.f_QualCtx_qcUnit = entryUnit; Vuna_dTarget_dOcaml_dDecl.f_QualCtx_qcDefs = (ctx).f_SplitGenCtx_sgcDefUnitT; Vuna_dTarget_dOcaml_dDecl.f_QualCtx_qcDatas = (ctx).f_SplitGenCtx_sgcDataUnitT } in (let envU = ((Lowering_dEnv.v_lwEnvWithUnit entryUnit) (ctx).f_SplitGenCtx_sgcEnv) in (match (((Lowering_dProgram.v_lowerUnitCheckedFrom envU) entryDatas) entryDefs) with
  | Base_dDiag.C_Check_ErrC (dtb__87) -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (Base_dDiag.C_Check_ErrC (dtb__87)))
  | Base_dDiag.C_Check_OkC (dtb__88) -> (match (Lowering_dEntry.v_lowerEntryOf (ctx).f_SplitGenCtx_sgcAllDefs) with
  | Base_dDiag.C_Check_ErrC (dtb__89) -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (Base_dDiag.C_Check_ErrC (dtb__89)))
  | Base_dDiag.C_Check_OkC (dtb__90) -> (match dtb__90 with
  | B_dData_dMaybe.C_Maybe_Nothing -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (Base_dDiagnostics_dCg.v_cgErr0 Base_dDiagnostics_dCg.C_CgErr_NoMain))
  | B_dData_dMaybe.C_Maybe_Just (dtb__91) -> (match ((((Vuna_dTarget_dOcaml_dAssembly.v_genUnitPartsWith (ctx).f_SplitGenCtx_sgcNormPath) qc) (Lowering_dEnv.v_lwEnvShared envU)) dtb__88) with
  | Base_dDiag.C_Check_ErrC (dtb__92) -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (Base_dDiag.C_Check_ErrC (dtb__92)))
  | Base_dDiag.C_Check_OkC (dtb__93) -> (match (((Vuna_dTarget_dOcaml_dTerm.v_genEntryHook (((Vuna_dTarget_dOcaml_dTerm.v_mkGenStWith (ctx).f_SplitGenCtx_sgcNormPath) qc) (Lowering_dEnv.v_lwEnvShared envU))) dtb__91) printResult) with
  | Base_dDiag.C_Check_ErrC (dtb__94) -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (Base_dDiag.C_Check_ErrC (dtb__94)))
  | Base_dDiag.C_Check_OkC (dtb__95) -> (match (((v_unitDepsOf (ctx).f_SplitGenCtx_sgcOrdered) entryUnit) ((B_dData_dList.v_append (Vuna_dTarget_dOcaml_dAssembly.v_unitPartsDeps dtb__93)) (B_dData_dPair.v_secondOf dtb__95))) with
  | Base_dDiag.C_Check_ErrC (dtb__96) -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (Base_dDiag.C_Check_ErrC (dtb__96)))
  | Base_dDiag.C_Check_OkC (dtb__97) -> (let sf = { Driver_dSplit.f_SplitFile_splitName = "Main.ml"; Driver_dSplit.f_SplitFile_splitText = (String.concat "" [v_mainInitPrologue; (Vuna_dTarget_dOcaml_dAssembly.v_genUnitText dtb__93); (B_dData_dPair.v_firstOf dtb__95)]); Driver_dSplit.f_SplitFile_splitDeps = dtb__97 } in (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((store "__entry__") sf)) (fun _u -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (Base_dDiag.C_Check_OkC (sf))))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))))
  | _ -> failwith "DT: impossible branch"
)))))

# 450 "Vuna/Compiler/Driver/SplitGen.vuna"
let v_splitWithOwnersWith = (fun (lookup : (string) -> Driver_dSplit.t_SplitFile B_dData_dMaybe.t_Maybe B_dEffect_dCore.t_Eff) (store : (string) -> (Driver_dSplit.t_SplitFile) -> int B_dEffect_dCore.t_Eff) (env : Lowering_dEnv.t_LwEnv) (modules : (string, Frontend_dAst.t_Decl B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (printResult : bool) (allDatas : Elab_dTypes.t_DtData B_dData_dList.t_List) (allDefs : Elab_dTypes.t_DtDef B_dData_dList.t_List) (defPairs : (string, string) B_dData_dPair.t_Pair B_dData_dList.t_List) (dataPairs : (string, string) B_dData_dPair.t_Pair B_dData_dList.t_List) (normPath : (string) -> string) (runtimeText : string) -> (let defOwnerT = (v_ownerTblOf defPairs) in (let dataOwnerT = (v_ownerTblOf dataPairs) in (let defUnitT = (Vuna_dTarget_dOcaml_dDecl.v_unitTblOf (v_mapToUnit defPairs)) in (let dataUnitT = (Vuna_dTarget_dOcaml_dDecl.v_unitTblOf (v_mapToUnit dataPairs)) in (let ordered = ((B_dData_dList.v_append ((B_dData_dList.v_append (B_dData_dList.C_List__x58__x58_ (Vuna_dTarget_dOcaml_dAssembly.v_runtimeUnit, B_dData_dList.C_List_Nil))) ((B_dData_dList.v_map (fun (q : (string, Frontend_dAst.t_Decl B_dData_dList.t_List) B_dData_dPair.t_Pair) -> (v_splitUnitOfModule (B_dData_dPair.v_firstOf q)))) modules))) (B_dData_dList.C_List__x58__x58_ ((v_splitUnitOfModule Driver_dOwner.v_entryOwner), B_dData_dList.C_List_Nil))) in (let ctx = { f_SplitGenCtx_sgcEnv = env; f_SplitGenCtx_sgcAllDefs = allDefs; f_SplitGenCtx_sgcDefOwnerT = defOwnerT; f_SplitGenCtx_sgcDataOwnerT = dataOwnerT; f_SplitGenCtx_sgcDefUnitT = defUnitT; f_SplitGenCtx_sgcDataUnitT = dataUnitT; f_SplitGenCtx_sgcOrdered = ordered; f_SplitGenCtx_sgcDefBuckets = ((v_defBucketsOf defOwnerT) allDefs); f_SplitGenCtx_sgcDataBuckets = ((v_dataBucketsOf dataOwnerT) allDatas); f_SplitGenCtx_sgcNormPath = normPath } in (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((((v_splitModuleFilesWith lookup) store) ctx) modules)) (fun moduleFilesR -> (match moduleFilesR with
  | Base_dDiag.C_Check_ErrC (dtb__98) -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (Base_dDiag.C_Check_ErrC (dtb__98)))
  | Base_dDiag.C_Check_OkC (dtb__99) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((((v_splitMainFileWith lookup) store) ctx) printResult)) (fun mainFileR -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (match mainFileR with
  | Base_dDiag.C_Check_ErrC (dtb__100) -> (Base_dDiag.C_Check_ErrC (dtb__100))
  | Base_dDiag.C_Check_OkC (dtb__101) -> (let files = (B_dData_dList.C_List__x58__x58_ ({ Driver_dSplit.f_SplitFile_splitName = "Vuna_runtime.ml"; Driver_dSplit.f_SplitFile_splitText = runtimeText; Driver_dSplit.f_SplitFile_splitDeps = B_dData_dList.C_List_Nil }, ((B_dData_dList.v_append dtb__99) (B_dData_dList.C_List__x58__x58_ (dtb__101, B_dData_dList.C_List_Nil))))) in (match (v_checkSplitNames files) with
  | Base_dDiag.C_Check_ErrC (dtb__102) -> (Base_dDiag.C_Check_ErrC (dtb__102))
  | Base_dDiag.C_Check_OkC (dtb__103) -> (match (v_checkSplitAcyclic files) with
  | Base_dDiag.C_Check_ErrC (dtb__104) -> (Base_dDiag.C_Check_ErrC (dtb__104))
  | Base_dDiag.C_Check_OkC (dtb__105) -> (Base_dDiag.C_Check_OkC (files))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
))))
  | _ -> failwith "DT: impossible branch"
))))))))))

# 426 "Vuna/Compiler/Driver/SplitGen.vuna"
let v_splitProgramCheckedWith = (fun (lookup : (string) -> Driver_dSplit.t_SplitFile B_dData_dMaybe.t_Maybe B_dEffect_dCore.t_Eff) (store : (string) -> (Driver_dSplit.t_SplitFile) -> int B_dEffect_dCore.t_Eff) (env : Lowering_dEnv.t_LwEnv) (modules : (string, Frontend_dAst.t_Decl B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (entryDecls : Frontend_dAst.t_Decl B_dData_dList.t_List) (printResult : bool) (runtimeDefs : Elab_dTypes.t_DtDef B_dData_dList.t_List) (allDatas : Elab_dTypes.t_DtData B_dData_dList.t_List) (meta : Driver_dOwner.t_SplitMeta) (normPath : (string) -> string) (runtimeText : string) -> (match (((((v_checkResolvedModules meta) modules) entryDecls) runtimeDefs) allDatas) with
  | Base_dDiag.C_Check_ErrC (dtb__106) -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (Base_dDiag.C_Check_ErrC (dtb__106)))
  | Base_dDiag.C_Check_OkC (dtb__107) -> (match ((Driver_dOwner.v_nameOwnerPairsOfDefs meta) runtimeDefs) with
  | Base_dDiag.C_Check_ErrC (dtb__108) -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (Base_dDiag.C_Check_ErrC (dtb__108)))
  | Base_dDiag.C_Check_OkC (dtb__109) -> (match ((Driver_dOwner.v_nameOwnerPairsOfDatas meta) allDatas) with
  | Base_dDiag.C_Check_ErrC (dtb__110) -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (Base_dDiag.C_Check_ErrC (dtb__110)))
  | Base_dDiag.C_Check_OkC (dtb__111) -> (((((((((((v_splitWithOwnersWith lookup) store) env) modules) printResult) allDatas) runtimeDefs) dtb__109) dtb__111) normPath) runtimeText)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 408 "Vuna/Compiler/Driver/SplitGen.vuna"
let v_splitProgramFilesWith = (fun (lookup : (string) -> Driver_dSplit.t_SplitFile B_dData_dMaybe.t_Maybe B_dEffect_dCore.t_Eff) (store : (string) -> (Driver_dSplit.t_SplitFile) -> int B_dEffect_dCore.t_Eff) (env : Lowering_dEnv.t_LwEnv) (modules : (string, Frontend_dAst.t_Decl B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (entryDecls : Frontend_dAst.t_Decl B_dData_dList.t_List) (printResult : bool) (runtimeDefs : Elab_dTypes.t_DtDef B_dData_dList.t_List) (allDatas : Elab_dTypes.t_DtData B_dData_dList.t_List) (meta : Driver_dOwner.t_SplitMeta) (normPath : (string) -> string) (runtimeText : string) -> (match (Lowering_dProgram.v_checkProgramOf env) with
  | Base_dDiag.C_Check_ErrC (dtb__112) -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (Base_dDiag.C_Check_ErrC (dtb__112)))
  | Base_dDiag.C_Check_OkC (dtb__113) -> (((((((((((v_splitProgramCheckedWith lookup) store) env) modules) entryDecls) printResult) runtimeDefs) allDatas) meta) normPath) runtimeText)
  | _ -> failwith "DT: impossible branch"
))

# 363 "Vuna/Compiler/Driver/SplitGen.vuna"
let v_generateDtSplitProgramWith = (fun (lookup : (string) -> Driver_dSplit.t_SplitFile B_dData_dMaybe.t_Maybe B_dEffect_dCore.t_Eff) (store : (string) -> (Driver_dSplit.t_SplitFile) -> int B_dEffect_dCore.t_Eff) (modules : (string, Frontend_dAst.t_Decl B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (entryDecls : Frontend_dAst.t_Decl B_dData_dList.t_List) (prog : Elab_dTypes.t_DtProgram) (printResult : bool) (roots : string B_dData_dList.t_List) (contextDir : string) (extraDefLocs : (string, (string, int) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match (Lowering_dEnv.v_eraseDefs (Elab_dTypes.v_dtProgDefs prog)) with
  | Base_dDiag.C_Check_ErrC (dtb__114) -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (Base_dDiag.C_Check_ErrC (dtb__114)))
  | Base_dDiag.C_Check_OkC (dtb__115) -> (let _u = (if ((dtp_log_on 2) "Vuna.Compiler.Driver.SplitGen") then (((dtp_log_emit 2) "Vuna.Compiler.Driver.SplitGen") "cg-splitstart") else 0) in (let allDatas = (Lowering_dEnv.v_rtDatasOf (Elab_dTypes.v_dtProgDatas prog)) in (let runtimeDefs = (Lowering_dProgram.v_partitionRuntimeDefs dtb__115) in (let env = (((((Lowering_dEnv.v_mkLwEnvFromErased (Elab_dTypes.v_dtProgDatas prog)) dtb__115) (Elab_dTypes.v_dtProgDefs prog)) (Elab_dTypes.v_dtProgGlobals prog)) (v_splitUnitOfModule Driver_dOwner.v_entryOwner)) in (let shared = (Lowering_dEnv.v_lwEnvShared env) in (let meta = ((Driver_dOwner.v_splitMetaOf modules) entryDecls) in (let _u = (if ((dtp_log_on 2) "Vuna.Compiler.Driver.SplitGen") then (((dtp_log_emit 2) "Vuna.Compiler.Driver.SplitGen") "cg-splitmeta-done") else 0) in (let locRows = ((B_dData_dList.v_append (shared).Vuna_dIr_dModel.f_IrShared_irSharedDefLocs) extraDefLocs) in (let locTbl = (((Vuna_dTarget_dOcaml_dTerm.v_dtDefLocTable ((v_splitLocPath roots) contextDir)) v_unitOfLocName) locRows) in (let _u = (if ((dtp_log_on 2) "Vuna.Compiler.Driver.SplitGen") then (((dtp_log_emit 2) "Vuna.Compiler.Driver.SplitGen") "cg-deflocs-done") else 0) in (let runtimeText = ((((Vuna_dTarget_dOcaml_dTerm.v_dtRuntimeWith locTbl) (shared).Vuna_dIr_dModel.f_IrShared_irSharedUsesFloat) (shared).Vuna_dIr_dModel.f_IrShared_irSharedUsesTrace) (shared).Vuna_dIr_dModel.f_IrShared_irSharedUsesObs) in (let _u = (if ((dtp_log_on 2) "Vuna.Compiler.Driver.SplitGen") then (((dtp_log_emit 2) "Vuna.Compiler.Driver.SplitGen") "cg-runtimeText-done") else 0) in (((((((((((v_splitProgramFilesWith lookup) store) env) modules) entryDecls) printResult) runtimeDefs) allDatas) meta) ((v_splitLocPath roots) contextDir)) runtimeText)))))))))))))
  | _ -> failwith "DT: impossible branch"
))

# 348 "Vuna/Compiler/Driver/SplitGen.vuna"
let v_generateDtSplitProgram = (fun (modules : (string, Frontend_dAst.t_Decl B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (entryDecls : Frontend_dAst.t_Decl B_dData_dList.t_List) (prog : Elab_dTypes.t_DtProgram) (printResult : bool) (roots : string B_dData_dList.t_List) (contextDir : string) (extraDefLocs : (string, (string, int) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (((((((((v_generateDtSplitProgramWith v_noUnitLookup) v_noUnitStore) modules) entryDecls) prog) printResult) roots) contextDir) extraDefLocs))

# 189 "Vuna/Compiler/Driver/SplitGen.vuna"
let v_sgcEnv = (fun (p : t_SplitGenCtx) -> (match p with
  | { f_SplitGenCtx_sgcEnv = dtb__116; f_SplitGenCtx_sgcAllDefs = dtb__117; f_SplitGenCtx_sgcDefOwnerT = dtb__118; f_SplitGenCtx_sgcDataOwnerT = dtb__119; f_SplitGenCtx_sgcDefUnitT = dtb__120; f_SplitGenCtx_sgcDataUnitT = dtb__121; f_SplitGenCtx_sgcOrdered = dtb__122; f_SplitGenCtx_sgcDefBuckets = dtb__123; f_SplitGenCtx_sgcDataBuckets = dtb__124; f_SplitGenCtx_sgcNormPath = dtb__125 } -> dtb__116
  | _ -> failwith "DT: impossible branch"
))

# 190 "Vuna/Compiler/Driver/SplitGen.vuna"
let v_sgcAllDefs = (fun (p : t_SplitGenCtx) -> (match p with
  | { f_SplitGenCtx_sgcEnv = dtb__126; f_SplitGenCtx_sgcAllDefs = dtb__127; f_SplitGenCtx_sgcDefOwnerT = dtb__128; f_SplitGenCtx_sgcDataOwnerT = dtb__129; f_SplitGenCtx_sgcDefUnitT = dtb__130; f_SplitGenCtx_sgcDataUnitT = dtb__131; f_SplitGenCtx_sgcOrdered = dtb__132; f_SplitGenCtx_sgcDefBuckets = dtb__133; f_SplitGenCtx_sgcDataBuckets = dtb__134; f_SplitGenCtx_sgcNormPath = dtb__135 } -> dtb__127
  | _ -> failwith "DT: impossible branch"
))

# 191 "Vuna/Compiler/Driver/SplitGen.vuna"
let v_sgcDefOwnerT = (fun (p : t_SplitGenCtx) -> (match p with
  | { f_SplitGenCtx_sgcEnv = dtb__136; f_SplitGenCtx_sgcAllDefs = dtb__137; f_SplitGenCtx_sgcDefOwnerT = dtb__138; f_SplitGenCtx_sgcDataOwnerT = dtb__139; f_SplitGenCtx_sgcDefUnitT = dtb__140; f_SplitGenCtx_sgcDataUnitT = dtb__141; f_SplitGenCtx_sgcOrdered = dtb__142; f_SplitGenCtx_sgcDefBuckets = dtb__143; f_SplitGenCtx_sgcDataBuckets = dtb__144; f_SplitGenCtx_sgcNormPath = dtb__145 } -> dtb__138
  | _ -> failwith "DT: impossible branch"
))

# 192 "Vuna/Compiler/Driver/SplitGen.vuna"
let v_sgcDataOwnerT = (fun (p : t_SplitGenCtx) -> (match p with
  | { f_SplitGenCtx_sgcEnv = dtb__146; f_SplitGenCtx_sgcAllDefs = dtb__147; f_SplitGenCtx_sgcDefOwnerT = dtb__148; f_SplitGenCtx_sgcDataOwnerT = dtb__149; f_SplitGenCtx_sgcDefUnitT = dtb__150; f_SplitGenCtx_sgcDataUnitT = dtb__151; f_SplitGenCtx_sgcOrdered = dtb__152; f_SplitGenCtx_sgcDefBuckets = dtb__153; f_SplitGenCtx_sgcDataBuckets = dtb__154; f_SplitGenCtx_sgcNormPath = dtb__155 } -> dtb__149
  | _ -> failwith "DT: impossible branch"
))

# 193 "Vuna/Compiler/Driver/SplitGen.vuna"
let v_sgcDefUnitT = (fun (p : t_SplitGenCtx) -> (match p with
  | { f_SplitGenCtx_sgcEnv = dtb__156; f_SplitGenCtx_sgcAllDefs = dtb__157; f_SplitGenCtx_sgcDefOwnerT = dtb__158; f_SplitGenCtx_sgcDataOwnerT = dtb__159; f_SplitGenCtx_sgcDefUnitT = dtb__160; f_SplitGenCtx_sgcDataUnitT = dtb__161; f_SplitGenCtx_sgcOrdered = dtb__162; f_SplitGenCtx_sgcDefBuckets = dtb__163; f_SplitGenCtx_sgcDataBuckets = dtb__164; f_SplitGenCtx_sgcNormPath = dtb__165 } -> dtb__160
  | _ -> failwith "DT: impossible branch"
))

# 194 "Vuna/Compiler/Driver/SplitGen.vuna"
let v_sgcDataUnitT = (fun (p : t_SplitGenCtx) -> (match p with
  | { f_SplitGenCtx_sgcEnv = dtb__166; f_SplitGenCtx_sgcAllDefs = dtb__167; f_SplitGenCtx_sgcDefOwnerT = dtb__168; f_SplitGenCtx_sgcDataOwnerT = dtb__169; f_SplitGenCtx_sgcDefUnitT = dtb__170; f_SplitGenCtx_sgcDataUnitT = dtb__171; f_SplitGenCtx_sgcOrdered = dtb__172; f_SplitGenCtx_sgcDefBuckets = dtb__173; f_SplitGenCtx_sgcDataBuckets = dtb__174; f_SplitGenCtx_sgcNormPath = dtb__175 } -> dtb__171
  | _ -> failwith "DT: impossible branch"
))

# 195 "Vuna/Compiler/Driver/SplitGen.vuna"
let v_sgcOrdered = (fun (p : t_SplitGenCtx) -> (match p with
  | { f_SplitGenCtx_sgcEnv = dtb__176; f_SplitGenCtx_sgcAllDefs = dtb__177; f_SplitGenCtx_sgcDefOwnerT = dtb__178; f_SplitGenCtx_sgcDataOwnerT = dtb__179; f_SplitGenCtx_sgcDefUnitT = dtb__180; f_SplitGenCtx_sgcDataUnitT = dtb__181; f_SplitGenCtx_sgcOrdered = dtb__182; f_SplitGenCtx_sgcDefBuckets = dtb__183; f_SplitGenCtx_sgcDataBuckets = dtb__184; f_SplitGenCtx_sgcNormPath = dtb__185 } -> dtb__182
  | _ -> failwith "DT: impossible branch"
))

# 197 "Vuna/Compiler/Driver/SplitGen.vuna"
let v_sgcDefBuckets = (fun (p : t_SplitGenCtx) -> (match p with
  | { f_SplitGenCtx_sgcEnv = dtb__186; f_SplitGenCtx_sgcAllDefs = dtb__187; f_SplitGenCtx_sgcDefOwnerT = dtb__188; f_SplitGenCtx_sgcDataOwnerT = dtb__189; f_SplitGenCtx_sgcDefUnitT = dtb__190; f_SplitGenCtx_sgcDataUnitT = dtb__191; f_SplitGenCtx_sgcOrdered = dtb__192; f_SplitGenCtx_sgcDefBuckets = dtb__193; f_SplitGenCtx_sgcDataBuckets = dtb__194; f_SplitGenCtx_sgcNormPath = dtb__195 } -> dtb__193
  | _ -> failwith "DT: impossible branch"
))

# 198 "Vuna/Compiler/Driver/SplitGen.vuna"
let v_sgcDataBuckets = (fun (p : t_SplitGenCtx) -> (match p with
  | { f_SplitGenCtx_sgcEnv = dtb__196; f_SplitGenCtx_sgcAllDefs = dtb__197; f_SplitGenCtx_sgcDefOwnerT = dtb__198; f_SplitGenCtx_sgcDataOwnerT = dtb__199; f_SplitGenCtx_sgcDefUnitT = dtb__200; f_SplitGenCtx_sgcDataUnitT = dtb__201; f_SplitGenCtx_sgcOrdered = dtb__202; f_SplitGenCtx_sgcDefBuckets = dtb__203; f_SplitGenCtx_sgcDataBuckets = dtb__204; f_SplitGenCtx_sgcNormPath = dtb__205 } -> dtb__204
  | _ -> failwith "DT: impossible branch"
))

# 200 "Vuna/Compiler/Driver/SplitGen.vuna"
let v_sgcNormPath = (fun p -> (match p with
  | { f_SplitGenCtx_sgcEnv = dtb__206; f_SplitGenCtx_sgcAllDefs = dtb__207; f_SplitGenCtx_sgcDefOwnerT = dtb__208; f_SplitGenCtx_sgcDataOwnerT = dtb__209; f_SplitGenCtx_sgcDefUnitT = dtb__210; f_SplitGenCtx_sgcDataUnitT = dtb__211; f_SplitGenCtx_sgcOrdered = dtb__212; f_SplitGenCtx_sgcDefBuckets = dtb__213; f_SplitGenCtx_sgcDataBuckets = dtb__214; f_SplitGenCtx_sgcNormPath = dtb__215 } -> dtb__215
  | _ -> failwith "DT: impossible branch"
))
