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

# 150 "Vuna/Compiler/Driver/SplitGen.vuna"
let rec v_uniqueSplitNames = (fun (mc0 : Driver_dSplit.t_SplitFile B_dData_dList.t_List) (mc1 : string B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__10, dtb__11) -> (match dtb__10 with
  | { Driver_dSplit.f_SplitFile_splitName = dtb__12; Driver_dSplit.f_SplitFile_splitText = dtb__13; Driver_dSplit.f_SplitFile_splitDeps = dtb__14 } -> (if ((B_dData_dList.v_memName dtb__12) mc1) then false else ((v_uniqueSplitNames dtb__11) (B_dData_dList.C_List__x58__x58_ (dtb__12, mc1))))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

# 155 "Vuna/Compiler/Driver/SplitGen.vuna"
let v_checkSplitNames = (fun (files : Driver_dSplit.t_SplitFile B_dData_dList.t_List) -> (if ((v_uniqueSplitNames files) B_dData_dList.C_List_Nil) then (Base_dDiag.C_Check_OkC (0)) else (Base_dDiag.v_icInternal "split unit name collides with another module (codegen unit naming)")))

# 165 "Vuna/Compiler/Driver/SplitGen.vuna"
let v_checkSplitAcyclic = (fun (files : Driver_dSplit.t_SplitFile B_dData_dList.t_List) -> (if (Driver_dSplit.v_splitGraphAcyclic files) then (Base_dDiag.C_Check_OkC (0)) else (Base_dDiag.v_icInternal "split dependency graph has a cycle (unit order is not a DAG)")))

# 188 "Vuna/Compiler/Driver/SplitGen.vuna"
let v_defsOfUnit = (fun (ctx : t_SplitGenCtx) (u : string) -> (match ((((B_dContainer_dHashMap.v_lookup B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) u) (ctx).f_SplitGenCtx_sgcDefBuckets) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__15) -> dtb__15
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 194 "Vuna/Compiler/Driver/SplitGen.vuna"
let v_datasOfUnit = (fun (ctx : t_SplitGenCtx) (u : string) -> (match ((((B_dContainer_dHashMap.v_lookup B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) u) (ctx).f_SplitGenCtx_sgcDataBuckets) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__16) -> dtb__16
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 200 "Vuna/Compiler/Driver/SplitGen.vuna"
let v_mapToUnit = (fun (pairs : (string, string) B_dData_dPair.t_Pair B_dData_dList.t_List) -> ((B_dData_dList.v_map (fun (q : (string, string) B_dData_dPair.t_Pair) -> { B_dData_dPair.f_Pair_first = (B_dData_dPair.v_firstOf q); B_dData_dPair.f_Pair_second = (v_splitUnitOfModule (B_dData_dPair.v_secondOf q)) })) pairs))

# 206 "Vuna/Compiler/Driver/SplitGen.vuna"
let v_checkModuleDeclName = (fun (knownModules : string B_dData_dList.t_List) (mname : string) (name : string) -> (if (Base_dSource.v_containsDot name) then (if ((B_dData_dList.v_memName (Driver_dOwner.v_modulePrefixOfName name)) knownModules) then (Base_dDiag.C_Check_OkC (0)) else (Base_dDiag.v_icInternal (String.concat "" ["module "; mname; " declares `"; name; "` whose module prefix `"; (Driver_dOwner.v_modulePrefixOfName name); "` is not a known module (codegen requires Loader-resolved decls)"]))) else (Base_dDiag.v_icInternal (String.concat "" ["module "; mname; " has an unresolved declaration name `"; name; "` (codegen requires Loader-resolved decls)"]))))

# 218 "Vuna/Compiler/Driver/SplitGen.vuna"
let rec v_checkModuleDeclNames = (fun (mc0 : string B_dData_dList.t_List) (mc1 : string) (mc2 : string B_dData_dList.t_List) -> (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__17, dtb__18) -> ((Base_dCommon.v_bind (((v_checkModuleDeclName mc0) mc1) dtb__17)) (fun (_u : int) -> (((v_checkModuleDeclNames mc0) mc1) dtb__18)))
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (0))
  | _ -> failwith "DT: impossible branch"
))

# 225 "Vuna/Compiler/Driver/SplitGen.vuna"
let rec v_checkModuleDecls = (fun (mc0 : string B_dData_dList.t_List) (mc1 : (string, Frontend_dAst.t_Decl B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__19, dtb__20) -> (match dtb__19 with
  | { B_dData_dPair.f_Pair_first = dtb__21; B_dData_dPair.f_Pair_second = dtb__22 } -> ((Base_dCommon.v_bind (((v_checkModuleDeclNames mc0) dtb__21) (Driver_dOwner.v_splitDeclNames dtb__22))) (fun (_u : int) -> ((v_checkModuleDecls mc0) dtb__20)))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (0))
  | _ -> failwith "DT: impossible branch"
))

# 236 "Vuna/Compiler/Driver/SplitGen.vuna"
let rec v_entryDeclIdentities = (fun (mc0 : Frontend_dAst.t_Decl B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__23, dtb__24) -> (match dtb__23 with
  | Frontend_dAst.C_Decl_DSig (dtb__25, dtb__26, dtb__27, dtb__28) -> (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = false; B_dData_dPair.f_Pair_second = dtb__25 }, (v_entryDeclIdentities dtb__24)))
  | Frontend_dAst.C_Decl_DExtern (dtb__29, dtb__30, dtb__31, dtb__32) -> (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = false; B_dData_dPair.f_Pair_second = dtb__29 }, (v_entryDeclIdentities dtb__24)))
  | Frontend_dAst.C_Decl_DData (dtb__33, dtb__34, dtb__35, dtb__36, dtb__37, dtb__38, dtb__39, dtb__40, dtb__41) -> (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = true; B_dData_dPair.f_Pair_second = dtb__33 }, (v_entryDeclIdentities dtb__24)))
  | Frontend_dAst.C_Decl_DRecord (dtb__42, dtb__43, dtb__44, dtb__45, dtb__46, dtb__47, dtb__48, dtb__49) -> (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = true; B_dData_dPair.f_Pair_second = dtb__42 }, (v_entryDeclIdentities dtb__24)))
  | Frontend_dAst.C_Decl_DTrait (dtb__50, dtb__51, dtb__52, dtb__53, dtb__54) -> (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = true; B_dData_dPair.f_Pair_second = dtb__50 }, (v_entryDeclIdentities dtb__24)))
  | _ -> (v_entryDeclIdentities dtb__24)
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 249 "Vuna/Compiler/Driver/SplitGen.vuna"
let v_entryDeclKey = (fun (mc0 : (bool, string) B_dData_dPair.t_Pair) -> (match mc0 with
  | { B_dData_dPair.f_Pair_first = dtb__55; B_dData_dPair.f_Pair_second = dtb__56 } -> (if dtb__55 then ("type\t" ^ dtb__56) else ("value\t" ^ dtb__56))
  | _ -> failwith "DT: impossible branch"
))

# 253 "Vuna/Compiler/Driver/SplitGen.vuna"
let v_checkEntryDeclName = (fun (seen : string B_dData_dList.t_List) (identity : (bool, string) B_dData_dPair.t_Pair) -> (let name = (B_dData_dPair.v_secondOf identity) in (let key = (v_entryDeclKey identity) in (if (name = "") then (Base_dDiag.v_icInternal "entry declaration has an empty name") else (if (Base_dSource.v_containsDot name) then (Base_dDiag.v_icInternal (String.concat "" ["entry declaration `"; name; "` must not contain a module prefix (codegen requires Loader-resolved decls)"])) else (if ((B_dData_dList.v_memName key) seen) then (Base_dDiag.v_icInternal (String.concat "" ["duplicate entry declaration `"; name; "`"])) else (Base_dDiag.C_Check_OkC (0))))))))

# 265 "Vuna/Compiler/Driver/SplitGen.vuna"
let rec v_checkEntryDeclsGo = (fun (mc0 : string B_dData_dList.t_List) (mc1 : (bool, string) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__57, dtb__58) -> ((Base_dCommon.v_bind ((v_checkEntryDeclName mc0) dtb__57)) (fun (_u : int) -> ((v_checkEntryDeclsGo (B_dData_dList.C_List__x58__x58_ ((v_entryDeclKey dtb__57), mc0))) dtb__58)))
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (0))
  | _ -> failwith "DT: impossible branch"
))

# 272 "Vuna/Compiler/Driver/SplitGen.vuna"
let v_checkEntryDecls = (fun (decls : Frontend_dAst.t_Decl B_dData_dList.t_List) -> ((v_checkEntryDeclsGo B_dData_dList.C_List_Nil) (v_entryDeclIdentities decls)))

# 277 "Vuna/Compiler/Driver/SplitGen.vuna"
let rec v_checkDefOwners = (fun (mc0 : Driver_dOwner.t_SplitMeta) (mc1 : Elab_dTypes.t_DtDef B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__59, dtb__60) -> ((Base_dCommon.v_bind ((Driver_dOwner.v_splitDefOwnerOf mc0) (Elab_dTypes.v_dtDefName dtb__59))) (fun (_u : string) -> ((v_checkDefOwners mc0) dtb__60)))
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (0))
  | _ -> failwith "DT: impossible branch"
))

# 284 "Vuna/Compiler/Driver/SplitGen.vuna"
let rec v_checkDataOwners = (fun (mc0 : Driver_dOwner.t_SplitMeta) (mc1 : Elab_dTypes.t_DtData B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__61, dtb__62) -> ((Base_dCommon.v_bind ((Driver_dOwner.v_splitDataOwnerOf mc0) dtb__61)) (fun (_u : string) -> ((v_checkDataOwners mc0) dtb__62)))
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (0))
  | _ -> failwith "DT: impossible branch"
))

# 289 "Vuna/Compiler/Driver/SplitGen.vuna"
let v_checkResolvedModules = (fun (meta : Driver_dOwner.t_SplitMeta) (modules : (string, Frontend_dAst.t_Decl B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (entryDecls : Frontend_dAst.t_Decl B_dData_dList.t_List) (runtime : Elab_dTypes.t_DtDef B_dData_dList.t_List) (datas : Elab_dTypes.t_DtData B_dData_dList.t_List) -> ((Base_dCommon.v_bind ((v_checkModuleDecls (meta).Driver_dOwner.f_SplitMeta_smKnownModules) modules)) (fun (_u : int) -> ((Base_dCommon.v_bind (v_checkEntryDecls entryDecls)) (fun (_u : int) -> ((Base_dCommon.v_bind ((v_checkDefOwners meta) runtime)) (fun (_u : int) -> ((v_checkDataOwners meta) datas))))))))

# 301 "Vuna/Compiler/Driver/SplitGen.vuna"
let v_splitStripPrefix = Base_dSource.v_stripPathPrefix

# 304 "Vuna/Compiler/Driver/SplitGen.vuna"
let v_splitStripRoots = Base_dSource.v_stripRootsPath

# 307 "Vuna/Compiler/Driver/SplitGen.vuna"
let v_splitStripDotSlash = Base_dSource.v_stripDotSlashPath

# 310 "Vuna/Compiler/Driver/SplitGen.vuna"
let v_splitLocPath = (fun (roots : string B_dData_dList.t_List) (contextDir : string) (path : string) -> (((Base_dSource.v_locationPathUnder roots) contextDir) path))

# 442 "Vuna/Compiler/Driver/SplitGen.vuna"
let rec v_splitModuleFiles = (fun (mc0 : t_SplitGenCtx) (mc1 : (string, Frontend_dAst.t_Decl B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__63, dtb__64) -> (match dtb__63 with
  | { B_dData_dPair.f_Pair_first = dtb__65; B_dData_dPair.f_Pair_second = dtb__66 } -> (let unit = (v_splitUnitOfModule dtb__65) in (let unitDatas = ((v_datasOfUnit mc0) dtb__65) in (let unitDefs = ((v_defsOfUnit mc0) dtb__65) in (let qc = { Vuna_dTarget_dOcaml_dDecl.f_QualCtx_qcUnit = unit; Vuna_dTarget_dOcaml_dDecl.f_QualCtx_qcDefs = (mc0).f_SplitGenCtx_sgcDefUnitT; Vuna_dTarget_dOcaml_dDecl.f_QualCtx_qcDatas = (mc0).f_SplitGenCtx_sgcDataUnitT } in (let envU = ((Lowering_dEnv.v_lwEnvWithUnit unit) (mc0).f_SplitGenCtx_sgcEnv) in (match (((Lowering_dProgram.v_lowerUnitCheckedFrom envU) unitDatas) unitDefs) with
  | Base_dDiag.C_Check_ErrC (dtb__67) -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (Base_dDiag.C_Check_ErrC (dtb__67)))
  | Base_dDiag.C_Check_OkC (dtb__68) -> (match ((((Vuna_dTarget_dOcaml_dAssembly.v_genUnitPartsWith (mc0).f_SplitGenCtx_sgcNormPath) qc) (Lowering_dEnv.v_lwEnvShared envU)) dtb__68) with
  | Base_dDiag.C_Check_ErrC (dtb__69) -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (Base_dDiag.C_Check_ErrC (dtb__69)))
  | Base_dDiag.C_Check_OkC (dtb__70) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((v_splitModuleFiles mc0) dtb__64)) (fun tailR -> (match tailR with
  | Base_dDiag.C_Check_ErrC (dtb__71) -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (Base_dDiag.C_Check_ErrC (dtb__71)))
  | Base_dDiag.C_Check_OkC (dtb__72) -> (match (((v_unitDepsOf (mc0).f_SplitGenCtx_sgcOrdered) unit) (Vuna_dTarget_dOcaml_dAssembly.v_unitPartsDeps dtb__70)) with
  | Base_dDiag.C_Check_ErrC (dtb__73) -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (Base_dDiag.C_Check_ErrC (dtb__73)))
  | Base_dDiag.C_Check_OkC (dtb__74) -> (let sf = { Driver_dSplit.f_SplitFile_splitName = (unit ^ ".ml"); Driver_dSplit.f_SplitFile_splitText = ((Vuna_dTarget_dOcaml_dAssembly.v_genUnitText dtb__70) ^ "\n"); Driver_dSplit.f_SplitFile_splitDeps = dtb__74 } in ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (Base_dDiag.C_Check_OkC ((B_dData_dList.C_List__x58__x58_ (sf, dtb__72))))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (Base_dDiag.C_Check_OkC (B_dData_dList.C_List_Nil)))
  | _ -> failwith "DT: impossible branch"
))

# 470 "Vuna/Compiler/Driver/SplitGen.vuna"
let v_splitMainFile = (fun (ctx : t_SplitGenCtx) (printResult : bool) -> (let entryUnit = (v_splitUnitOfModule Driver_dOwner.v_entryOwner) in (let entryDefs = ((v_defsOfUnit ctx) Driver_dOwner.v_entryOwner) in (let entryDatas = ((v_datasOfUnit ctx) Driver_dOwner.v_entryOwner) in (let qc = { Vuna_dTarget_dOcaml_dDecl.f_QualCtx_qcUnit = entryUnit; Vuna_dTarget_dOcaml_dDecl.f_QualCtx_qcDefs = (ctx).f_SplitGenCtx_sgcDefUnitT; Vuna_dTarget_dOcaml_dDecl.f_QualCtx_qcDatas = (ctx).f_SplitGenCtx_sgcDataUnitT } in (let envU = ((Lowering_dEnv.v_lwEnvWithUnit entryUnit) (ctx).f_SplitGenCtx_sgcEnv) in (match (((Lowering_dProgram.v_lowerUnitCheckedFrom envU) entryDatas) entryDefs) with
  | Base_dDiag.C_Check_ErrC (dtb__75) -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (Base_dDiag.C_Check_ErrC (dtb__75)))
  | Base_dDiag.C_Check_OkC (dtb__76) -> (match (Lowering_dEntry.v_lowerEntryOf (ctx).f_SplitGenCtx_sgcAllDefs) with
  | Base_dDiag.C_Check_ErrC (dtb__77) -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (Base_dDiag.C_Check_ErrC (dtb__77)))
  | Base_dDiag.C_Check_OkC (dtb__78) -> (match dtb__78 with
  | B_dData_dMaybe.C_Maybe_Nothing -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (Base_dDiagnostics_dCg.v_cgErr0 Base_dDiagnostics_dCg.C_CgErr_NoMain))
  | B_dData_dMaybe.C_Maybe_Just (dtb__79) -> (match ((((Vuna_dTarget_dOcaml_dAssembly.v_genUnitPartsWith (ctx).f_SplitGenCtx_sgcNormPath) qc) (Lowering_dEnv.v_lwEnvShared envU)) dtb__76) with
  | Base_dDiag.C_Check_ErrC (dtb__80) -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (Base_dDiag.C_Check_ErrC (dtb__80)))
  | Base_dDiag.C_Check_OkC (dtb__81) -> (match (((Vuna_dTarget_dOcaml_dTerm.v_genEntryHook (((Vuna_dTarget_dOcaml_dTerm.v_mkGenStWith (ctx).f_SplitGenCtx_sgcNormPath) qc) (Lowering_dEnv.v_lwEnvShared envU))) dtb__79) printResult) with
  | Base_dDiag.C_Check_ErrC (dtb__82) -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (Base_dDiag.C_Check_ErrC (dtb__82)))
  | Base_dDiag.C_Check_OkC (dtb__83) -> (match (((v_unitDepsOf (ctx).f_SplitGenCtx_sgcOrdered) entryUnit) ((B_dData_dList.v_append (Vuna_dTarget_dOcaml_dAssembly.v_unitPartsDeps dtb__81)) (B_dData_dPair.v_secondOf dtb__83))) with
  | Base_dDiag.C_Check_ErrC (dtb__84) -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (Base_dDiag.C_Check_ErrC (dtb__84)))
  | Base_dDiag.C_Check_OkC (dtb__85) -> (let sf = { Driver_dSplit.f_SplitFile_splitName = "Main.ml"; Driver_dSplit.f_SplitFile_splitText = (String.concat "" [v_mainInitPrologue; (Vuna_dTarget_dOcaml_dAssembly.v_genUnitText dtb__81); (B_dData_dPair.v_firstOf dtb__83)]); Driver_dSplit.f_SplitFile_splitDeps = dtb__85 } in ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (Base_dDiag.C_Check_OkC (sf))))
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
)))))))

# 397 "Vuna/Compiler/Driver/SplitGen.vuna"
let v_splitWithOwners = (fun (env : Lowering_dEnv.t_LwEnv) (modules : (string, Frontend_dAst.t_Decl B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (printResult : bool) (allDatas : Elab_dTypes.t_DtData B_dData_dList.t_List) (allDefs : Elab_dTypes.t_DtDef B_dData_dList.t_List) (defPairs : (string, string) B_dData_dPair.t_Pair B_dData_dList.t_List) (dataPairs : (string, string) B_dData_dPair.t_Pair B_dData_dList.t_List) (normPath : (string) -> string) (runtimeText : string) -> (let defOwnerT = (v_ownerTblOf defPairs) in (let dataOwnerT = (v_ownerTblOf dataPairs) in (let defUnitT = (Vuna_dTarget_dOcaml_dDecl.v_unitTblOf (v_mapToUnit defPairs)) in (let dataUnitT = (Vuna_dTarget_dOcaml_dDecl.v_unitTblOf (v_mapToUnit dataPairs)) in (let ordered = ((B_dData_dList.v_append ((B_dData_dList.v_append (B_dData_dList.C_List__x58__x58_ (Vuna_dTarget_dOcaml_dAssembly.v_runtimeUnit, B_dData_dList.C_List_Nil))) ((B_dData_dList.v_map (fun (q : (string, Frontend_dAst.t_Decl B_dData_dList.t_List) B_dData_dPair.t_Pair) -> (v_splitUnitOfModule (B_dData_dPair.v_firstOf q)))) modules))) (B_dData_dList.C_List__x58__x58_ ((v_splitUnitOfModule Driver_dOwner.v_entryOwner), B_dData_dList.C_List_Nil))) in (let ctx = { f_SplitGenCtx_sgcEnv = env; f_SplitGenCtx_sgcAllDefs = allDefs; f_SplitGenCtx_sgcDefOwnerT = defOwnerT; f_SplitGenCtx_sgcDataOwnerT = dataOwnerT; f_SplitGenCtx_sgcDefUnitT = defUnitT; f_SplitGenCtx_sgcDataUnitT = dataUnitT; f_SplitGenCtx_sgcOrdered = ordered; f_SplitGenCtx_sgcDefBuckets = ((v_defBucketsOf defOwnerT) allDefs); f_SplitGenCtx_sgcDataBuckets = ((v_dataBucketsOf dataOwnerT) allDatas); f_SplitGenCtx_sgcNormPath = normPath } in (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((v_splitModuleFiles ctx) modules)) (fun moduleFilesR -> (match moduleFilesR with
  | Base_dDiag.C_Check_ErrC (dtb__86) -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (Base_dDiag.C_Check_ErrC (dtb__86)))
  | Base_dDiag.C_Check_OkC (dtb__87) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((v_splitMainFile ctx) printResult)) (fun mainFileR -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (match mainFileR with
  | Base_dDiag.C_Check_ErrC (dtb__88) -> (Base_dDiag.C_Check_ErrC (dtb__88))
  | Base_dDiag.C_Check_OkC (dtb__89) -> (let files = (B_dData_dList.C_List__x58__x58_ ({ Driver_dSplit.f_SplitFile_splitName = "Vuna_runtime.ml"; Driver_dSplit.f_SplitFile_splitText = runtimeText; Driver_dSplit.f_SplitFile_splitDeps = B_dData_dList.C_List_Nil }, ((B_dData_dList.v_append dtb__87) (B_dData_dList.C_List__x58__x58_ (dtb__89, B_dData_dList.C_List_Nil))))) in (match (v_checkSplitNames files) with
  | Base_dDiag.C_Check_ErrC (dtb__90) -> (Base_dDiag.C_Check_ErrC (dtb__90))
  | Base_dDiag.C_Check_OkC (dtb__91) -> (match (v_checkSplitAcyclic files) with
  | Base_dDiag.C_Check_ErrC (dtb__92) -> (Base_dDiag.C_Check_ErrC (dtb__92))
  | Base_dDiag.C_Check_OkC (dtb__93) -> (Base_dDiag.C_Check_OkC (files))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
))))
  | _ -> failwith "DT: impossible branch"
))))))))))

# 375 "Vuna/Compiler/Driver/SplitGen.vuna"
let v_splitProgramChecked = (fun (env : Lowering_dEnv.t_LwEnv) (modules : (string, Frontend_dAst.t_Decl B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (entryDecls : Frontend_dAst.t_Decl B_dData_dList.t_List) (printResult : bool) (runtimeDefs : Elab_dTypes.t_DtDef B_dData_dList.t_List) (allDatas : Elab_dTypes.t_DtData B_dData_dList.t_List) (meta : Driver_dOwner.t_SplitMeta) (normPath : (string) -> string) (runtimeText : string) -> (match (((((v_checkResolvedModules meta) modules) entryDecls) runtimeDefs) allDatas) with
  | Base_dDiag.C_Check_ErrC (dtb__94) -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (Base_dDiag.C_Check_ErrC (dtb__94)))
  | Base_dDiag.C_Check_OkC (dtb__95) -> (match ((Driver_dOwner.v_nameOwnerPairsOfDefs meta) runtimeDefs) with
  | Base_dDiag.C_Check_ErrC (dtb__96) -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (Base_dDiag.C_Check_ErrC (dtb__96)))
  | Base_dDiag.C_Check_OkC (dtb__97) -> (match ((Driver_dOwner.v_nameOwnerPairsOfDatas meta) allDatas) with
  | Base_dDiag.C_Check_ErrC (dtb__98) -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (Base_dDiag.C_Check_ErrC (dtb__98)))
  | Base_dDiag.C_Check_OkC (dtb__99) -> (((((((((v_splitWithOwners env) modules) printResult) allDatas) runtimeDefs) dtb__97) dtb__99) normPath) runtimeText)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 359 "Vuna/Compiler/Driver/SplitGen.vuna"
let v_splitProgramFiles = (fun (env : Lowering_dEnv.t_LwEnv) (modules : (string, Frontend_dAst.t_Decl B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (entryDecls : Frontend_dAst.t_Decl B_dData_dList.t_List) (printResult : bool) (runtimeDefs : Elab_dTypes.t_DtDef B_dData_dList.t_List) (allDatas : Elab_dTypes.t_DtData B_dData_dList.t_List) (meta : Driver_dOwner.t_SplitMeta) (normPath : (string) -> string) (runtimeText : string) -> (match (Lowering_dProgram.v_checkProgramOf env) with
  | Base_dDiag.C_Check_ErrC (dtb__100) -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (Base_dDiag.C_Check_ErrC (dtb__100)))
  | Base_dDiag.C_Check_OkC (dtb__101) -> (((((((((v_splitProgramChecked env) modules) entryDecls) printResult) runtimeDefs) allDatas) meta) normPath) runtimeText)
  | _ -> failwith "DT: impossible branch"
))

# 316 "Vuna/Compiler/Driver/SplitGen.vuna"
let v_generateDtSplitProgram = (fun (modules : (string, Frontend_dAst.t_Decl B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (entryDecls : Frontend_dAst.t_Decl B_dData_dList.t_List) (prog : Elab_dTypes.t_DtProgram) (printResult : bool) (roots : string B_dData_dList.t_List) (contextDir : string) (extraDefLocs : (string, (string, int) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match (Lowering_dEnv.v_eraseDefs (Elab_dTypes.v_dtProgDefs prog)) with
  | Base_dDiag.C_Check_ErrC (dtb__102) -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (Base_dDiag.C_Check_ErrC (dtb__102)))
  | Base_dDiag.C_Check_OkC (dtb__103) -> (let _u = (if ((dtp_log_on 2) "Vuna.Compiler.Driver.SplitGen") then (((dtp_log_emit 2) "Vuna.Compiler.Driver.SplitGen") "cg-splitstart") else 0) in (let allDatas = (Lowering_dEnv.v_rtDatasOf (Elab_dTypes.v_dtProgDatas prog)) in (let runtimeDefs = (Lowering_dProgram.v_partitionRuntimeDefs dtb__103) in (let env = (((((Lowering_dEnv.v_mkLwEnvFromErased (Elab_dTypes.v_dtProgDatas prog)) dtb__103) (Elab_dTypes.v_dtProgDefs prog)) (Elab_dTypes.v_dtProgGlobals prog)) (v_splitUnitOfModule Driver_dOwner.v_entryOwner)) in (let shared = (Lowering_dEnv.v_lwEnvShared env) in (let meta = ((Driver_dOwner.v_splitMetaOf modules) entryDecls) in (let _u = (if ((dtp_log_on 2) "Vuna.Compiler.Driver.SplitGen") then (((dtp_log_emit 2) "Vuna.Compiler.Driver.SplitGen") "cg-splitmeta-done") else 0) in (let locRows = ((B_dData_dList.v_append (shared).Vuna_dIr_dModel.f_IrShared_irSharedDefLocs) extraDefLocs) in (let locTbl = (((Vuna_dTarget_dOcaml_dTerm.v_dtDefLocTable ((v_splitLocPath roots) contextDir)) v_unitOfLocName) locRows) in (let _u = (if ((dtp_log_on 2) "Vuna.Compiler.Driver.SplitGen") then (((dtp_log_emit 2) "Vuna.Compiler.Driver.SplitGen") "cg-deflocs-done") else 0) in (let runtimeText = ((((Vuna_dTarget_dOcaml_dTerm.v_dtRuntimeWith locTbl) (shared).Vuna_dIr_dModel.f_IrShared_irSharedUsesFloat) (shared).Vuna_dIr_dModel.f_IrShared_irSharedUsesTrace) (shared).Vuna_dIr_dModel.f_IrShared_irSharedUsesObs) in (let _u = (if ((dtp_log_on 2) "Vuna.Compiler.Driver.SplitGen") then (((dtp_log_emit 2) "Vuna.Compiler.Driver.SplitGen") "cg-runtimeText-done") else 0) in (((((((((v_splitProgramFiles env) modules) entryDecls) printResult) runtimeDefs) allDatas) meta) ((v_splitLocPath roots) contextDir)) runtimeText)))))))))))))
  | _ -> failwith "DT: impossible branch"
))

# 174 "Vuna/Compiler/Driver/SplitGen.vuna"
let v_sgcEnv = (fun (p : t_SplitGenCtx) -> (match p with
  | { f_SplitGenCtx_sgcEnv = dtb__104; f_SplitGenCtx_sgcAllDefs = dtb__105; f_SplitGenCtx_sgcDefOwnerT = dtb__106; f_SplitGenCtx_sgcDataOwnerT = dtb__107; f_SplitGenCtx_sgcDefUnitT = dtb__108; f_SplitGenCtx_sgcDataUnitT = dtb__109; f_SplitGenCtx_sgcOrdered = dtb__110; f_SplitGenCtx_sgcDefBuckets = dtb__111; f_SplitGenCtx_sgcDataBuckets = dtb__112; f_SplitGenCtx_sgcNormPath = dtb__113 } -> dtb__104
  | _ -> failwith "DT: impossible branch"
))

# 175 "Vuna/Compiler/Driver/SplitGen.vuna"
let v_sgcAllDefs = (fun (p : t_SplitGenCtx) -> (match p with
  | { f_SplitGenCtx_sgcEnv = dtb__114; f_SplitGenCtx_sgcAllDefs = dtb__115; f_SplitGenCtx_sgcDefOwnerT = dtb__116; f_SplitGenCtx_sgcDataOwnerT = dtb__117; f_SplitGenCtx_sgcDefUnitT = dtb__118; f_SplitGenCtx_sgcDataUnitT = dtb__119; f_SplitGenCtx_sgcOrdered = dtb__120; f_SplitGenCtx_sgcDefBuckets = dtb__121; f_SplitGenCtx_sgcDataBuckets = dtb__122; f_SplitGenCtx_sgcNormPath = dtb__123 } -> dtb__115
  | _ -> failwith "DT: impossible branch"
))

# 176 "Vuna/Compiler/Driver/SplitGen.vuna"
let v_sgcDefOwnerT = (fun (p : t_SplitGenCtx) -> (match p with
  | { f_SplitGenCtx_sgcEnv = dtb__124; f_SplitGenCtx_sgcAllDefs = dtb__125; f_SplitGenCtx_sgcDefOwnerT = dtb__126; f_SplitGenCtx_sgcDataOwnerT = dtb__127; f_SplitGenCtx_sgcDefUnitT = dtb__128; f_SplitGenCtx_sgcDataUnitT = dtb__129; f_SplitGenCtx_sgcOrdered = dtb__130; f_SplitGenCtx_sgcDefBuckets = dtb__131; f_SplitGenCtx_sgcDataBuckets = dtb__132; f_SplitGenCtx_sgcNormPath = dtb__133 } -> dtb__126
  | _ -> failwith "DT: impossible branch"
))

# 177 "Vuna/Compiler/Driver/SplitGen.vuna"
let v_sgcDataOwnerT = (fun (p : t_SplitGenCtx) -> (match p with
  | { f_SplitGenCtx_sgcEnv = dtb__134; f_SplitGenCtx_sgcAllDefs = dtb__135; f_SplitGenCtx_sgcDefOwnerT = dtb__136; f_SplitGenCtx_sgcDataOwnerT = dtb__137; f_SplitGenCtx_sgcDefUnitT = dtb__138; f_SplitGenCtx_sgcDataUnitT = dtb__139; f_SplitGenCtx_sgcOrdered = dtb__140; f_SplitGenCtx_sgcDefBuckets = dtb__141; f_SplitGenCtx_sgcDataBuckets = dtb__142; f_SplitGenCtx_sgcNormPath = dtb__143 } -> dtb__137
  | _ -> failwith "DT: impossible branch"
))

# 178 "Vuna/Compiler/Driver/SplitGen.vuna"
let v_sgcDefUnitT = (fun (p : t_SplitGenCtx) -> (match p with
  | { f_SplitGenCtx_sgcEnv = dtb__144; f_SplitGenCtx_sgcAllDefs = dtb__145; f_SplitGenCtx_sgcDefOwnerT = dtb__146; f_SplitGenCtx_sgcDataOwnerT = dtb__147; f_SplitGenCtx_sgcDefUnitT = dtb__148; f_SplitGenCtx_sgcDataUnitT = dtb__149; f_SplitGenCtx_sgcOrdered = dtb__150; f_SplitGenCtx_sgcDefBuckets = dtb__151; f_SplitGenCtx_sgcDataBuckets = dtb__152; f_SplitGenCtx_sgcNormPath = dtb__153 } -> dtb__148
  | _ -> failwith "DT: impossible branch"
))

# 179 "Vuna/Compiler/Driver/SplitGen.vuna"
let v_sgcDataUnitT = (fun (p : t_SplitGenCtx) -> (match p with
  | { f_SplitGenCtx_sgcEnv = dtb__154; f_SplitGenCtx_sgcAllDefs = dtb__155; f_SplitGenCtx_sgcDefOwnerT = dtb__156; f_SplitGenCtx_sgcDataOwnerT = dtb__157; f_SplitGenCtx_sgcDefUnitT = dtb__158; f_SplitGenCtx_sgcDataUnitT = dtb__159; f_SplitGenCtx_sgcOrdered = dtb__160; f_SplitGenCtx_sgcDefBuckets = dtb__161; f_SplitGenCtx_sgcDataBuckets = dtb__162; f_SplitGenCtx_sgcNormPath = dtb__163 } -> dtb__159
  | _ -> failwith "DT: impossible branch"
))

# 180 "Vuna/Compiler/Driver/SplitGen.vuna"
let v_sgcOrdered = (fun (p : t_SplitGenCtx) -> (match p with
  | { f_SplitGenCtx_sgcEnv = dtb__164; f_SplitGenCtx_sgcAllDefs = dtb__165; f_SplitGenCtx_sgcDefOwnerT = dtb__166; f_SplitGenCtx_sgcDataOwnerT = dtb__167; f_SplitGenCtx_sgcDefUnitT = dtb__168; f_SplitGenCtx_sgcDataUnitT = dtb__169; f_SplitGenCtx_sgcOrdered = dtb__170; f_SplitGenCtx_sgcDefBuckets = dtb__171; f_SplitGenCtx_sgcDataBuckets = dtb__172; f_SplitGenCtx_sgcNormPath = dtb__173 } -> dtb__170
  | _ -> failwith "DT: impossible branch"
))

# 182 "Vuna/Compiler/Driver/SplitGen.vuna"
let v_sgcDefBuckets = (fun (p : t_SplitGenCtx) -> (match p with
  | { f_SplitGenCtx_sgcEnv = dtb__174; f_SplitGenCtx_sgcAllDefs = dtb__175; f_SplitGenCtx_sgcDefOwnerT = dtb__176; f_SplitGenCtx_sgcDataOwnerT = dtb__177; f_SplitGenCtx_sgcDefUnitT = dtb__178; f_SplitGenCtx_sgcDataUnitT = dtb__179; f_SplitGenCtx_sgcOrdered = dtb__180; f_SplitGenCtx_sgcDefBuckets = dtb__181; f_SplitGenCtx_sgcDataBuckets = dtb__182; f_SplitGenCtx_sgcNormPath = dtb__183 } -> dtb__181
  | _ -> failwith "DT: impossible branch"
))

# 183 "Vuna/Compiler/Driver/SplitGen.vuna"
let v_sgcDataBuckets = (fun (p : t_SplitGenCtx) -> (match p with
  | { f_SplitGenCtx_sgcEnv = dtb__184; f_SplitGenCtx_sgcAllDefs = dtb__185; f_SplitGenCtx_sgcDefOwnerT = dtb__186; f_SplitGenCtx_sgcDataOwnerT = dtb__187; f_SplitGenCtx_sgcDefUnitT = dtb__188; f_SplitGenCtx_sgcDataUnitT = dtb__189; f_SplitGenCtx_sgcOrdered = dtb__190; f_SplitGenCtx_sgcDefBuckets = dtb__191; f_SplitGenCtx_sgcDataBuckets = dtb__192; f_SplitGenCtx_sgcNormPath = dtb__193 } -> dtb__192
  | _ -> failwith "DT: impossible branch"
))

# 185 "Vuna/Compiler/Driver/SplitGen.vuna"
let v_sgcNormPath = (fun p -> (match p with
  | { f_SplitGenCtx_sgcEnv = dtb__194; f_SplitGenCtx_sgcAllDefs = dtb__195; f_SplitGenCtx_sgcDefOwnerT = dtb__196; f_SplitGenCtx_sgcDataOwnerT = dtb__197; f_SplitGenCtx_sgcDefUnitT = dtb__198; f_SplitGenCtx_sgcDataUnitT = dtb__199; f_SplitGenCtx_sgcOrdered = dtb__200; f_SplitGenCtx_sgcDefBuckets = dtb__201; f_SplitGenCtx_sgcDataBuckets = dtb__202; f_SplitGenCtx_sgcNormPath = dtb__203 } -> dtb__203
  | _ -> failwith "DT: impossible branch"
))
