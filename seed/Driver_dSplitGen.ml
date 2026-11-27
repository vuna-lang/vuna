open Vuna_runtime
type t_SplitGenCtx = { f_SplitGenCtx_sgcEnv : Lowering_dEnv.t_LwEnv; f_SplitGenCtx_sgcAllDefs : Elab_dTypes.t_DtDef B_dData_dList.t_List; f_SplitGenCtx_sgcDefOwnerT : (string, string) B_dContainer_dHashMap.t_HashMap; f_SplitGenCtx_sgcDataOwnerT : (string, string) B_dContainer_dHashMap.t_HashMap; f_SplitGenCtx_sgcDefUnitT : (string, string) B_dContainer_dHashMap.t_HashMap; f_SplitGenCtx_sgcDataUnitT : (string, string) B_dContainer_dHashMap.t_HashMap; f_SplitGenCtx_sgcOrdered : string B_dData_dList.t_List; f_SplitGenCtx_sgcDefBuckets : (string, Elab_dTypes.t_DtDef B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap; f_SplitGenCtx_sgcDataBuckets : (string, Elab_dTypes.t_DtData B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap; f_SplitGenCtx_sgcNormPath : (string) -> string }

# 42 "Vuna/Compiler/Driver/SplitGen.vuna"
let v_compilerPkgPrefix = "Vuna.Compiler."

# 45 "Vuna/Compiler/Driver/SplitGen.vuna"
let v_basePkgPrefix = "Base."

# 48 "Vuna/Compiler/Driver/SplitGen.vuna"
let v_unitPathOf = (fun (m : string) -> (if ((B_dData_dString.v_startsWith v_compilerPkgPrefix) m) then (((dtp_substring (String.length v_compilerPkgPrefix)) ((String.length m) - (String.length v_compilerPkgPrefix))) m) else (if ((B_dData_dString.v_startsWith v_basePkgPrefix) m) then ("B." ^ (((dtp_substring (String.length v_basePkgPrefix)) ((String.length m) - (String.length v_basePkgPrefix))) m)) else m)))

# 39 "Vuna/Compiler/Driver/SplitGen.vuna"
let v_splitUnitOfModule = (fun (modName : string) -> (Vuna_dTarget_dOcaml_dDecl.v_sanitizeName (v_unitPathOf modName)))

# 59 "Vuna/Compiler/Driver/SplitGen.vuna"
let v_unitOfLocName = (fun (name : string) -> (let p = (Driver_dOwner.v_modulePrefixOfName name) in (if (p = "") then (v_splitUnitOfModule Driver_dOwner.v_entryOwner) else (v_splitUnitOfModule p))))

# 67 "Vuna/Compiler/Driver/SplitGen.vuna"
let v_mainInitPrologue = "open Vuna_runtime\nlet () = dt_record_backtrace true\n"

# 75 "Vuna/Compiler/Driver/SplitGen.vuna"
let v_ownerTblOf = (fun (pairs : (string, string) B_dData_dPair.t_Pair B_dData_dList.t_List) -> ((((B_dContainer_dHashMap.v_insertAll B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) pairs) (((B_dContainer_dHashMap.v_fromList B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) B_dData_dList.C_List_Nil)))

# 84 "Vuna/Compiler/Driver/SplitGen.vuna"
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

# 81 "Vuna/Compiler/Driver/SplitGen.vuna"
let v_defBucketsOf = (fun (ownerT : (string, string) B_dContainer_dHashMap.t_HashMap) (defs : Elab_dTypes.t_DtDef B_dData_dList.t_List) -> (((v_defBucketsGo ownerT) (B_dData_dList.v_reverse defs)) (((B_dContainer_dHashMap.v_fromList B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) B_dData_dList.C_List_Nil)))

# 101 "Vuna/Compiler/Driver/SplitGen.vuna"
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

# 98 "Vuna/Compiler/Driver/SplitGen.vuna"
let v_dataBucketsOf = (fun (ownerT : (string, string) B_dContainer_dHashMap.t_HashMap) (datas : Elab_dTypes.t_DtData B_dData_dList.t_List) -> (((v_dataBucketsGo ownerT) (B_dData_dList.v_reverse datas)) (((B_dContainer_dHashMap.v_fromList B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) B_dData_dList.C_List_Nil)))

# 125 "Vuna/Compiler/Driver/SplitGen.vuna"
let v_knownUnit = (fun (units : string B_dData_dList.t_List) (u : string) -> ((B_dData_dList.v_memName u) units))

# 128 "Vuna/Compiler/Driver/SplitGen.vuna"
let rec v_checkDepsKnown = (fun (mc0 : string B_dData_dList.t_List) (mc1 : string) (mc2 : string B_dData_dList.t_List) -> (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__8, dtb__9) -> (if (B_dData_dBool.v_not ((v_knownUnit mc0) dtb__8)) then (Base_dDiag.v_icInternal (String.concat "" [mc1; " references unknown unit `"; dtb__8; "`"])) else (if (B_dData_dBool.v_not ((v_knownUnit mc0) mc1)) then (Base_dDiag.v_icInternal (String.concat "" ["split unit `"; mc1; "` is not in the module order"])) else (((v_checkDepsKnown mc0) mc1) dtb__9)))
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (0))
  | _ -> failwith "DT: impossible branch"
))

# 139 "Vuna/Compiler/Driver/SplitGen.vuna"
let v_depsInOrder = (fun (ordered : string B_dData_dList.t_List) (self : string) (deps : string B_dData_dList.t_List) -> ((B_dData_dList.v_filter (fun (u : string) -> (if (B_dData_dBool.v_not (u = self)) then ((B_dData_dList.v_memName u) deps) else false))) ordered))

# 142 "Vuna/Compiler/Driver/SplitGen.vuna"
let v_unitDepsOf = (fun (ordered : string B_dData_dList.t_List) (self : string) (deps : string B_dData_dList.t_List) -> ((Base_dCommon.v_bind (((v_checkDepsKnown ordered) self) deps)) (fun (_u : int) -> (Base_dDiag.C_Check_OkC ((((v_depsInOrder ordered) self) deps))))))

# 152 "Vuna/Compiler/Driver/SplitGen.vuna"
let rec v_uniqueSplitNames = (fun (mc0 : Driver_dSplit.t_SplitFile B_dData_dList.t_List) (mc1 : string B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__10, dtb__11) -> (match dtb__10 with
  | { Driver_dSplit.f_SplitFile_splitName = dtb__12; Driver_dSplit.f_SplitFile_splitText = dtb__13; Driver_dSplit.f_SplitFile_splitDeps = dtb__14 } -> (if ((B_dData_dList.v_memName dtb__12) mc1) then false else ((v_uniqueSplitNames dtb__11) (B_dData_dList.C_List__x58__x58_ (dtb__12, mc1))))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

# 157 "Vuna/Compiler/Driver/SplitGen.vuna"
let v_checkSplitNames = (fun (files : Driver_dSplit.t_SplitFile B_dData_dList.t_List) -> (if ((v_uniqueSplitNames files) B_dData_dList.C_List_Nil) then (Base_dDiag.C_Check_OkC (0)) else (Base_dDiag.v_icInternal "split unit name collides with another module (codegen unit naming)")))

# 167 "Vuna/Compiler/Driver/SplitGen.vuna"
let v_checkSplitAcyclic = (fun (files : Driver_dSplit.t_SplitFile B_dData_dList.t_List) -> (if (Driver_dSplit.v_splitGraphAcyclic files) then (Base_dDiag.C_Check_OkC (0)) else (Base_dDiag.v_icInternal "split dependency graph has a cycle (unit order is not a DAG)")))

# 190 "Vuna/Compiler/Driver/SplitGen.vuna"
let v_defsOfUnit = (fun (ctx : t_SplitGenCtx) (u : string) -> (match ((((B_dContainer_dHashMap.v_lookup B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) u) (ctx).f_SplitGenCtx_sgcDefBuckets) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__15) -> dtb__15
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 196 "Vuna/Compiler/Driver/SplitGen.vuna"
let v_datasOfUnit = (fun (ctx : t_SplitGenCtx) (u : string) -> (match ((((B_dContainer_dHashMap.v_lookup B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) u) (ctx).f_SplitGenCtx_sgcDataBuckets) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__16) -> dtb__16
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 202 "Vuna/Compiler/Driver/SplitGen.vuna"
let v_mapToUnit = (fun (pairs : (string, string) B_dData_dPair.t_Pair B_dData_dList.t_List) -> ((B_dData_dList.v_map (fun (q : (string, string) B_dData_dPair.t_Pair) -> { B_dData_dPair.f_Pair_first = (B_dData_dPair.v_firstOf q); B_dData_dPair.f_Pair_second = (v_splitUnitOfModule (B_dData_dPair.v_secondOf q)) })) pairs))

# 208 "Vuna/Compiler/Driver/SplitGen.vuna"
let v_checkModuleDeclName = (fun (knownModules : string B_dData_dList.t_List) (mname : string) (name : string) -> (if (Base_dSource.v_containsDot name) then (if ((B_dData_dList.v_memName (Driver_dOwner.v_modulePrefixOfName name)) knownModules) then (Base_dDiag.C_Check_OkC (0)) else (Base_dDiag.v_icInternal (String.concat "" ["module "; mname; " declares `"; name; "` whose module prefix `"; (Driver_dOwner.v_modulePrefixOfName name); "` is not a known module (codegen requires Loader-resolved decls)"]))) else (Base_dDiag.v_icInternal (String.concat "" ["module "; mname; " has an unresolved declaration name `"; name; "` (codegen requires Loader-resolved decls)"]))))

# 220 "Vuna/Compiler/Driver/SplitGen.vuna"
let rec v_checkModuleDeclNames = (fun (mc0 : string B_dData_dList.t_List) (mc1 : string) (mc2 : string B_dData_dList.t_List) -> (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__17, dtb__18) -> ((Base_dCommon.v_bind (((v_checkModuleDeclName mc0) mc1) dtb__17)) (fun (_u : int) -> (((v_checkModuleDeclNames mc0) mc1) dtb__18)))
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (0))
  | _ -> failwith "DT: impossible branch"
))

# 227 "Vuna/Compiler/Driver/SplitGen.vuna"
let rec v_checkModuleDecls = (fun (mc0 : string B_dData_dList.t_List) (mc1 : (string, Frontend_dAst.t_Decl B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__19, dtb__20) -> (match dtb__19 with
  | { B_dData_dPair.f_Pair_first = dtb__21; B_dData_dPair.f_Pair_second = dtb__22 } -> ((Base_dCommon.v_bind (((v_checkModuleDeclNames mc0) dtb__21) (Driver_dOwner.v_splitDeclNames dtb__22))) (fun (_u : int) -> ((v_checkModuleDecls mc0) dtb__20)))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (0))
  | _ -> failwith "DT: impossible branch"
))

# 238 "Vuna/Compiler/Driver/SplitGen.vuna"
let[@tail_mod_cons] rec v_entryDeclIdentities = (fun (mc0 : Frontend_dAst.t_Decl B_dData_dList.t_List) -> (match mc0 with
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

# 251 "Vuna/Compiler/Driver/SplitGen.vuna"
let v_entryDeclKey = (fun (mc0 : (bool, string) B_dData_dPair.t_Pair) -> (match mc0 with
  | { B_dData_dPair.f_Pair_first = dtb__55; B_dData_dPair.f_Pair_second = dtb__56 } -> (if dtb__55 then ("type\t" ^ dtb__56) else ("value\t" ^ dtb__56))
  | _ -> failwith "DT: impossible branch"
))

# 255 "Vuna/Compiler/Driver/SplitGen.vuna"
let v_checkEntryDeclName = (fun (seen : string B_dData_dList.t_List) (identity : (bool, string) B_dData_dPair.t_Pair) -> (let name = (B_dData_dPair.v_secondOf identity) in (let key = (v_entryDeclKey identity) in (if (name = "") then (Base_dDiag.v_icInternal "entry declaration has an empty name") else (if (Base_dSource.v_containsDot name) then (Base_dDiag.v_icInternal (String.concat "" ["entry declaration `"; name; "` must not contain a module prefix (codegen requires Loader-resolved decls)"])) else (if ((B_dData_dList.v_memName key) seen) then (Base_dDiag.v_icInternal (String.concat "" ["duplicate entry declaration `"; name; "`"])) else (Base_dDiag.C_Check_OkC (0))))))))

# 267 "Vuna/Compiler/Driver/SplitGen.vuna"
let rec v_checkEntryDeclsGo = (fun (mc0 : string B_dData_dList.t_List) (mc1 : (bool, string) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__57, dtb__58) -> ((Base_dCommon.v_bind ((v_checkEntryDeclName mc0) dtb__57)) (fun (_u : int) -> ((v_checkEntryDeclsGo (B_dData_dList.C_List__x58__x58_ ((v_entryDeclKey dtb__57), mc0))) dtb__58)))
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (0))
  | _ -> failwith "DT: impossible branch"
))

# 274 "Vuna/Compiler/Driver/SplitGen.vuna"
let v_checkEntryDecls = (fun (decls : Frontend_dAst.t_Decl B_dData_dList.t_List) -> ((v_checkEntryDeclsGo B_dData_dList.C_List_Nil) (v_entryDeclIdentities decls)))

# 279 "Vuna/Compiler/Driver/SplitGen.vuna"
let rec v_checkDefOwners = (fun (mc0 : Driver_dOwner.t_SplitMeta) (mc1 : Elab_dTypes.t_DtDef B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__59, dtb__60) -> ((Base_dCommon.v_bind ((Driver_dOwner.v_splitDefOwnerOf mc0) (Elab_dTypes.v_dtDefName dtb__59))) (fun (_u : string) -> ((v_checkDefOwners mc0) dtb__60)))
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (0))
  | _ -> failwith "DT: impossible branch"
))

# 286 "Vuna/Compiler/Driver/SplitGen.vuna"
let rec v_checkDataOwners = (fun (mc0 : Driver_dOwner.t_SplitMeta) (mc1 : Elab_dTypes.t_DtData B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__61, dtb__62) -> ((Base_dCommon.v_bind ((Driver_dOwner.v_splitDataOwnerOf mc0) dtb__61)) (fun (_u : string) -> ((v_checkDataOwners mc0) dtb__62)))
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (0))
  | _ -> failwith "DT: impossible branch"
))

# 291 "Vuna/Compiler/Driver/SplitGen.vuna"
let v_checkResolvedModules = (fun (meta : Driver_dOwner.t_SplitMeta) (modules : (string, Frontend_dAst.t_Decl B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (entryDecls : Frontend_dAst.t_Decl B_dData_dList.t_List) (runtime : Elab_dTypes.t_DtDef B_dData_dList.t_List) (datas : Elab_dTypes.t_DtData B_dData_dList.t_List) -> ((Base_dCommon.v_bind ((v_checkModuleDecls (meta).Driver_dOwner.f_SplitMeta_smKnownModules) modules)) (fun (_u : int) -> ((Base_dCommon.v_bind (v_checkEntryDecls entryDecls)) (fun (_u : int) -> ((Base_dCommon.v_bind ((v_checkDefOwners meta) runtime)) (fun (_u : int) -> ((v_checkDataOwners meta) datas))))))))

# 303 "Vuna/Compiler/Driver/SplitGen.vuna"
let v_splitStripPrefix = Base_dSource.v_stripPathPrefix

# 306 "Vuna/Compiler/Driver/SplitGen.vuna"
let v_splitStripRoots = Base_dSource.v_stripRootsPath

# 309 "Vuna/Compiler/Driver/SplitGen.vuna"
let v_splitStripDotSlash = Base_dSource.v_stripDotSlashPath

# 312 "Vuna/Compiler/Driver/SplitGen.vuna"
let v_splitLocPath = (fun (roots : string B_dData_dList.t_List) (contextDir : string) (path : string) -> (((Base_dSource.v_locationPathUnder roots) contextDir) path))

# 319 "Vuna/Compiler/Driver/SplitGen.vuna"
let rec v_helperInText = (fun (mc0 : string) (mc1 : string B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__63, dtb__64) -> (if ((B_dData_dString.v_contains mc0) dtb__63) then true else ((v_helperInText mc0) dtb__64))
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 323 "Vuna/Compiler/Driver/SplitGen.vuna"
let rec v_helperInTexts = (fun (mc0 : string B_dData_dList.t_List) (mc1 : string B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__65, dtb__66) -> (if ((v_helperInText dtb__65) mc1) then true else ((v_helperInTexts dtb__66) mc1))
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 329 "Vuna/Compiler/Driver/SplitGen.vuna"
let v_dtRuntimeFor = (fun (shared : Vuna_dIr_dModel.t_IrShared) (entryIsAction : bool) (keptTexts : string B_dData_dList.t_List) -> (((((((((Vuna_dTarget_dOcaml_dTerm.v_dtRuntimeWith (shared).Vuna_dIr_dModel.f_IrShared_irSharedUsesFloat) (shared).Vuna_dIr_dModel.f_IrShared_irSharedUsesTrace) (shared).Vuna_dIr_dModel.f_IrShared_irSharedUsesObs) (shared).Vuna_dIr_dModel.f_IrShared_irSharedUsesHost) (if (shared).Vuna_dIr_dModel.f_IrShared_irSharedUsesSched then true else entryIsAction)) (if (shared).Vuna_dIr_dModel.f_IrShared_irSharedUsesEff then true else entryIsAction)) ((v_helperInTexts Vuna_dTarget_dOcaml_dTerm.v_dtStrHelperNames) keptTexts)) ((v_helperInTexts Vuna_dTarget_dOcaml_dTerm.v_dtArrHelperNames) keptTexts)) ((v_helperInTexts Vuna_dTarget_dOcaml_dTerm.v_dtBufHelperNames) keptTexts)))

# 343 "Vuna/Compiler/Driver/SplitGen.vuna"
let v_entryIsActionM = (fun (mc0 : Vuna_dIr_dModel.t_IrEntry B_dData_dMaybe.t_Maybe) -> (match mc0 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__67) -> (Vuna_dIr_dModel.v_irEntryIsActionOf dtb__67)
  | B_dData_dMaybe.C_Maybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
))

# 488 "Vuna/Compiler/Driver/SplitGen.vuna"
let rec v_splitModuleFiles = (fun (mc0 : t_SplitGenCtx) (mc1 : (string, Frontend_dAst.t_Decl B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__68, dtb__69) -> (match dtb__68 with
  | { B_dData_dPair.f_Pair_first = dtb__70; B_dData_dPair.f_Pair_second = dtb__71 } -> (let unit = (v_splitUnitOfModule dtb__70) in (let unitDatas = ((v_datasOfUnit mc0) dtb__70) in (let unitDefs = ((v_defsOfUnit mc0) dtb__70) in (let qc = { Vuna_dTarget_dOcaml_dDecl.f_QualCtx_qcUnit = unit; Vuna_dTarget_dOcaml_dDecl.f_QualCtx_qcDefs = (mc0).f_SplitGenCtx_sgcDefUnitT; Vuna_dTarget_dOcaml_dDecl.f_QualCtx_qcDatas = (mc0).f_SplitGenCtx_sgcDataUnitT } in (let envU = ((Lowering_dEnv.v_lwEnvWithUnit unit) (mc0).f_SplitGenCtx_sgcEnv) in (match (((Lowering_dProgram.v_lowerUnitCheckedFrom envU) unitDatas) unitDefs) with
  | Base_dDiag.C_Check_ErrC (dtb__72) -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (Base_dDiag.C_Check_ErrC (dtb__72)))
  | Base_dDiag.C_Check_OkC (dtb__73) -> (match ((((Vuna_dTarget_dOcaml_dAssembly.v_genUnitPartsWith (mc0).f_SplitGenCtx_sgcNormPath) qc) (Lowering_dEnv.v_lwEnvShared envU)) dtb__73) with
  | Base_dDiag.C_Check_ErrC (dtb__74) -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (Base_dDiag.C_Check_ErrC (dtb__74)))
  | Base_dDiag.C_Check_OkC (dtb__75) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((v_splitModuleFiles mc0) dtb__69)) (fun tailR -> (match tailR with
  | Base_dDiag.C_Check_ErrC (dtb__76) -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (Base_dDiag.C_Check_ErrC (dtb__76)))
  | Base_dDiag.C_Check_OkC (dtb__77) -> (match (((v_unitDepsOf (mc0).f_SplitGenCtx_sgcOrdered) unit) (Vuna_dTarget_dOcaml_dAssembly.v_unitPartsDeps dtb__75)) with
  | Base_dDiag.C_Check_ErrC (dtb__78) -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (Base_dDiag.C_Check_ErrC (dtb__78)))
  | Base_dDiag.C_Check_OkC (dtb__79) -> (let sf = { Driver_dSplit.f_SplitFile_splitName = (unit ^ ".ml"); Driver_dSplit.f_SplitFile_splitText = ((Vuna_dTarget_dOcaml_dAssembly.v_genUnitText dtb__75) ^ "\n"); Driver_dSplit.f_SplitFile_splitDeps = dtb__79 } in ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (Base_dDiag.C_Check_OkC ((B_dData_dList.C_List__x58__x58_ (sf, dtb__77))))))
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

# 516 "Vuna/Compiler/Driver/SplitGen.vuna"
let v_splitMainFile = (fun (ctx : t_SplitGenCtx) (printResult : bool) -> (let entryUnit = (v_splitUnitOfModule Driver_dOwner.v_entryOwner) in (let entryDefs = ((v_defsOfUnit ctx) Driver_dOwner.v_entryOwner) in (let entryDatas = ((v_datasOfUnit ctx) Driver_dOwner.v_entryOwner) in (let qc = { Vuna_dTarget_dOcaml_dDecl.f_QualCtx_qcUnit = entryUnit; Vuna_dTarget_dOcaml_dDecl.f_QualCtx_qcDefs = (ctx).f_SplitGenCtx_sgcDefUnitT; Vuna_dTarget_dOcaml_dDecl.f_QualCtx_qcDatas = (ctx).f_SplitGenCtx_sgcDataUnitT } in (let envU = ((Lowering_dEnv.v_lwEnvWithUnit entryUnit) (ctx).f_SplitGenCtx_sgcEnv) in (match (((Lowering_dProgram.v_lowerUnitCheckedFrom envU) entryDatas) entryDefs) with
  | Base_dDiag.C_Check_ErrC (dtb__80) -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (Base_dDiag.C_Check_ErrC (dtb__80)))
  | Base_dDiag.C_Check_OkC (dtb__81) -> (match (Lowering_dEntry.v_lowerEntryOf (ctx).f_SplitGenCtx_sgcAllDefs) with
  | Base_dDiag.C_Check_ErrC (dtb__82) -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (Base_dDiag.C_Check_ErrC (dtb__82)))
  | Base_dDiag.C_Check_OkC (dtb__83) -> (match dtb__83 with
  | B_dData_dMaybe.C_Maybe_Nothing -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (Base_dDiagnostics_dCg.v_cgErr0 Base_dDiagnostics_dCg.C_CgErr_NoMain))
  | B_dData_dMaybe.C_Maybe_Just (dtb__84) -> (match ((((Vuna_dTarget_dOcaml_dAssembly.v_genUnitPartsWith (ctx).f_SplitGenCtx_sgcNormPath) qc) (Lowering_dEnv.v_lwEnvShared envU)) dtb__81) with
  | Base_dDiag.C_Check_ErrC (dtb__85) -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (Base_dDiag.C_Check_ErrC (dtb__85)))
  | Base_dDiag.C_Check_OkC (dtb__86) -> (match (((Vuna_dTarget_dOcaml_dTerm.v_genEntryHook (((Vuna_dTarget_dOcaml_dTerm.v_mkGenStWith (ctx).f_SplitGenCtx_sgcNormPath) qc) (Lowering_dEnv.v_lwEnvShared envU))) dtb__84) printResult) with
  | Base_dDiag.C_Check_ErrC (dtb__87) -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (Base_dDiag.C_Check_ErrC (dtb__87)))
  | Base_dDiag.C_Check_OkC (dtb__88) -> (match (((v_unitDepsOf (ctx).f_SplitGenCtx_sgcOrdered) entryUnit) ((B_dData_dList.v_append ((B_dData_dList.v_append (Vuna_dTarget_dOcaml_dAssembly.v_unitPartsDeps dtb__86)) (B_dData_dPair.v_secondOf dtb__88))) (B_dData_dList.C_List__x58__x58_ (Vuna_dTarget_dOcaml_dAssembly.v_deflocsUnit, B_dData_dList.C_List_Nil)))) with
  | Base_dDiag.C_Check_ErrC (dtb__89) -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (Base_dDiag.C_Check_ErrC (dtb__89)))
  | Base_dDiag.C_Check_OkC (dtb__90) -> (let sf = { Driver_dSplit.f_SplitFile_splitName = "Main.ml"; Driver_dSplit.f_SplitFile_splitText = (String.concat "" [v_mainInitPrologue; (Vuna_dTarget_dOcaml_dAssembly.v_genUnitText dtb__86); (B_dData_dPair.v_firstOf dtb__88)]); Driver_dSplit.f_SplitFile_splitDeps = dtb__90 } in ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (Base_dDiag.C_Check_OkC (sf))))
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

# 432 "Vuna/Compiler/Driver/SplitGen.vuna"
let v_splitWithOwners = (fun (env : Lowering_dEnv.t_LwEnv) (modules : (string, Frontend_dAst.t_Decl B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (printResult : bool) (allDatas : Elab_dTypes.t_DtData B_dData_dList.t_List) (allDefs : Elab_dTypes.t_DtDef B_dData_dList.t_List) (defPairs : (string, string) B_dData_dPair.t_Pair B_dData_dList.t_List) (dataPairs : (string, string) B_dData_dPair.t_Pair B_dData_dList.t_List) (normPath : (string) -> string) (shared : Vuna_dIr_dModel.t_IrShared) (entryIsAction : bool) (locRows : (string, (string, int) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (let defOwnerT = (v_ownerTblOf defPairs) in (let dataOwnerT = (v_ownerTblOf dataPairs) in (let defUnitT = (Vuna_dTarget_dOcaml_dDecl.v_unitTblOf (v_mapToUnit defPairs)) in (let dataUnitT = (Vuna_dTarget_dOcaml_dDecl.v_unitTblOf (v_mapToUnit dataPairs)) in (let ordered = ((B_dData_dList.v_append ((B_dData_dList.v_append (B_dData_dList.C_List__x58__x58_ (Vuna_dTarget_dOcaml_dAssembly.v_runtimeUnit, (B_dData_dList.C_List__x58__x58_ (Vuna_dTarget_dOcaml_dAssembly.v_deflocsUnit, B_dData_dList.C_List_Nil))))) ((B_dData_dList.v_map (fun (q : (string, Frontend_dAst.t_Decl B_dData_dList.t_List) B_dData_dPair.t_Pair) -> (v_splitUnitOfModule (B_dData_dPair.v_firstOf q)))) modules))) (B_dData_dList.C_List__x58__x58_ ((v_splitUnitOfModule Driver_dOwner.v_entryOwner), B_dData_dList.C_List_Nil))) in (let ctx = { f_SplitGenCtx_sgcEnv = env; f_SplitGenCtx_sgcAllDefs = allDefs; f_SplitGenCtx_sgcDefOwnerT = defOwnerT; f_SplitGenCtx_sgcDataOwnerT = dataOwnerT; f_SplitGenCtx_sgcDefUnitT = defUnitT; f_SplitGenCtx_sgcDataUnitT = dataUnitT; f_SplitGenCtx_sgcOrdered = ordered; f_SplitGenCtx_sgcDefBuckets = ((v_defBucketsOf defOwnerT) allDefs); f_SplitGenCtx_sgcDataBuckets = ((v_dataBucketsOf dataOwnerT) allDatas); f_SplitGenCtx_sgcNormPath = normPath } in (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((v_splitModuleFiles ctx) modules)) (fun moduleFilesR -> (match moduleFilesR with
  | Base_dDiag.C_Check_ErrC (dtb__91) -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (Base_dDiag.C_Check_ErrC (dtb__91)))
  | Base_dDiag.C_Check_OkC (dtb__92) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((v_splitMainFile ctx) printResult)) (fun mainFileR -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (match mainFileR with
  | Base_dDiag.C_Check_ErrC (dtb__93) -> (Base_dDiag.C_Check_ErrC (dtb__93))
  | Base_dDiag.C_Check_OkC (dtb__94) -> (let runtimeFile0 = { Driver_dSplit.f_SplitFile_splitName = (Vuna_dTarget_dOcaml_dAssembly.v_runtimeUnit ^ ".ml"); Driver_dSplit.f_SplitFile_splitText = ""; Driver_dSplit.f_SplitFile_splitDeps = B_dData_dList.C_List_Nil } in (let deflocsFile = { Driver_dSplit.f_SplitFile_splitName = (Vuna_dTarget_dOcaml_dAssembly.v_deflocsUnit ^ ".ml"); Driver_dSplit.f_SplitFile_splitText = ""; Driver_dSplit.f_SplitFile_splitDeps = (B_dData_dList.C_List__x58__x58_ (Vuna_dTarget_dOcaml_dAssembly.v_runtimeUnit, B_dData_dList.C_List_Nil)) } in (let files0 = ((Driver_dSplit.v_pruneSplitFiles (B_dData_dList.C_List__x58__x58_ (Vuna_dTarget_dOcaml_dAssembly.v_runtimeUnit, (B_dData_dList.C_List__x58__x58_ (Vuna_dTarget_dOcaml_dAssembly.v_deflocsUnit, (B_dData_dList.C_List__x58__x58_ ((Driver_dSplit.v_splitUnitOfFile dtb__94), B_dData_dList.C_List_Nil))))))) (B_dData_dList.C_List__x58__x58_ (runtimeFile0, (B_dData_dList.C_List__x58__x58_ (deflocsFile, ((B_dData_dList.v_append dtb__92) (B_dData_dList.C_List__x58__x58_ (dtb__94, B_dData_dList.C_List_Nil)))))))) in (let keptUnits = ((B_dData_dList.v_map Driver_dSplit.v_splitUnitOfFile) files0) in (let keptTexts = ((B_dData_dList.v_map Driver_dSplit.v_splitText) ((B_dData_dList.v_filter (fun (f : Driver_dSplit.t_SplitFile) -> (B_dData_dBool.v_not (if ((Driver_dSplit.v_splitUnitOfFile f) = Vuna_dTarget_dOcaml_dAssembly.v_runtimeUnit) then true else ((Driver_dSplit.v_splitUnitOfFile f) = Vuna_dTarget_dOcaml_dAssembly.v_deflocsUnit))))) files0)) in (let runtimeText = (((v_dtRuntimeFor shared) entryIsAction) keptTexts) in (let keptLocRows = ((B_dData_dList.v_filter (fun (row : (string, (string, int) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> ((B_dData_dList.v_memName (v_unitOfLocName (B_dData_dPair.v_firstOf row))) keptUnits))) locRows) in (let deflocsText = (Vuna_dTarget_dOcaml_dTerm.v_dtDefLocsUnit (((Vuna_dTarget_dOcaml_dTerm.v_dtDefLocTable normPath) v_unitOfLocName) keptLocRows)) in (let files = ((B_dData_dList.v_map (fun (f : Driver_dSplit.t_SplitFile) -> (if ((Driver_dSplit.v_splitUnitOfFile f) = Vuna_dTarget_dOcaml_dAssembly.v_runtimeUnit) then { Driver_dSplit.f_SplitFile_splitName = (Driver_dSplit.v_splitName f); Driver_dSplit.f_SplitFile_splitText = runtimeText; Driver_dSplit.f_SplitFile_splitDeps = (Driver_dSplit.v_splitDeps f) } else (if ((Driver_dSplit.v_splitUnitOfFile f) = Vuna_dTarget_dOcaml_dAssembly.v_deflocsUnit) then { Driver_dSplit.f_SplitFile_splitName = (Driver_dSplit.v_splitName f); Driver_dSplit.f_SplitFile_splitText = deflocsText; Driver_dSplit.f_SplitFile_splitDeps = (Driver_dSplit.v_splitDeps f) } else f)))) files0) in (match (v_checkSplitNames files) with
  | Base_dDiag.C_Check_ErrC (dtb__95) -> (Base_dDiag.C_Check_ErrC (dtb__95))
  | Base_dDiag.C_Check_OkC (dtb__96) -> (match (v_checkSplitAcyclic files) with
  | Base_dDiag.C_Check_ErrC (dtb__97) -> (Base_dDiag.C_Check_ErrC (dtb__97))
  | Base_dDiag.C_Check_OkC (dtb__98) -> (Base_dDiag.C_Check_OkC (files))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))))))))
  | _ -> failwith "DT: impossible branch"
))))
  | _ -> failwith "DT: impossible branch"
))))))))))

# 408 "Vuna/Compiler/Driver/SplitGen.vuna"
let v_splitProgramChecked = (fun (env : Lowering_dEnv.t_LwEnv) (modules : (string, Frontend_dAst.t_Decl B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (entryDecls : Frontend_dAst.t_Decl B_dData_dList.t_List) (printResult : bool) (runtimeDefs : Elab_dTypes.t_DtDef B_dData_dList.t_List) (allDatas : Elab_dTypes.t_DtData B_dData_dList.t_List) (meta : Driver_dOwner.t_SplitMeta) (normPath : (string) -> string) (shared : Vuna_dIr_dModel.t_IrShared) (entryIsAction : bool) (locRows : (string, (string, int) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match (((((v_checkResolvedModules meta) modules) entryDecls) runtimeDefs) allDatas) with
  | Base_dDiag.C_Check_ErrC (dtb__99) -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (Base_dDiag.C_Check_ErrC (dtb__99)))
  | Base_dDiag.C_Check_OkC (dtb__100) -> (match ((Driver_dOwner.v_nameOwnerPairsOfDefs meta) runtimeDefs) with
  | Base_dDiag.C_Check_ErrC (dtb__101) -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (Base_dDiag.C_Check_ErrC (dtb__101)))
  | Base_dDiag.C_Check_OkC (dtb__102) -> (match ((Driver_dOwner.v_nameOwnerPairsOfDatas meta) allDatas) with
  | Base_dDiag.C_Check_ErrC (dtb__103) -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (Base_dDiag.C_Check_ErrC (dtb__103)))
  | Base_dDiag.C_Check_OkC (dtb__104) -> (((((((((((v_splitWithOwners env) modules) printResult) allDatas) runtimeDefs) dtb__102) dtb__104) normPath) shared) entryIsAction) locRows)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 390 "Vuna/Compiler/Driver/SplitGen.vuna"
let v_splitProgramFiles = (fun (env : Lowering_dEnv.t_LwEnv) (modules : (string, Frontend_dAst.t_Decl B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (entryDecls : Frontend_dAst.t_Decl B_dData_dList.t_List) (printResult : bool) (runtimeDefs : Elab_dTypes.t_DtDef B_dData_dList.t_List) (allDatas : Elab_dTypes.t_DtData B_dData_dList.t_List) (meta : Driver_dOwner.t_SplitMeta) (normPath : (string) -> string) (shared : Vuna_dIr_dModel.t_IrShared) (entryIsAction : bool) (locRows : (string, (string, int) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match (Lowering_dProgram.v_checkProgramOf env) with
  | Base_dDiag.C_Check_ErrC (dtb__105) -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (Base_dDiag.C_Check_ErrC (dtb__105)))
  | Base_dDiag.C_Check_OkC (dtb__106) -> (((((((((((v_splitProgramChecked env) modules) entryDecls) printResult) runtimeDefs) allDatas) meta) normPath) shared) entryIsAction) locRows)
  | _ -> failwith "DT: impossible branch"
))

# 347 "Vuna/Compiler/Driver/SplitGen.vuna"
let v_generateDtSplitProgram = (fun (modules : (string, Frontend_dAst.t_Decl B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (entryDecls : Frontend_dAst.t_Decl B_dData_dList.t_List) (prog : Elab_dTypes.t_DtProgram) (printResult : bool) (roots : string B_dData_dList.t_List) (contextDir : string) (extraDefLocs : (string, (string, int) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match (Lowering_dEnv.v_eraseDefs (Elab_dTypes.v_dtProgDefs prog)) with
  | Base_dDiag.C_Check_ErrC (dtb__107) -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (Base_dDiag.C_Check_ErrC (dtb__107)))
  | Base_dDiag.C_Check_OkC (dtb__108) -> (match (Lowering_dEntry.v_lowerEntryOf dtb__108) with
  | Base_dDiag.C_Check_ErrC (dtb__109) -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (Base_dDiag.C_Check_ErrC (dtb__109)))
  | Base_dDiag.C_Check_OkC (dtb__110) -> (let entryIsAction = (v_entryIsActionM dtb__110) in (let _u = (if ((dtp_log_on 2) "Vuna.Compiler.Driver.SplitGen") then (((dtp_log_emit 2) "Vuna.Compiler.Driver.SplitGen") "cg-splitstart") else 0) in (let allDatas = (Lowering_dEnv.v_rtDatasOf (Elab_dTypes.v_dtProgDatas prog)) in (let runtimeDefs = (Lowering_dProgram.v_partitionRuntimeDefs dtb__108) in (let env = (((((Lowering_dEnv.v_mkLwEnvFromErased (Elab_dTypes.v_dtProgDatas prog)) dtb__108) (Elab_dTypes.v_dtProgDefs prog)) (Elab_dTypes.v_dtProgGlobals prog)) (v_splitUnitOfModule Driver_dOwner.v_entryOwner)) in (let shared = (Lowering_dEnv.v_lwEnvShared env) in (let meta = ((Driver_dOwner.v_splitMetaOf modules) entryDecls) in (let _u = (if ((dtp_log_on 2) "Vuna.Compiler.Driver.SplitGen") then (((dtp_log_emit 2) "Vuna.Compiler.Driver.SplitGen") "cg-splitmeta-done") else 0) in (let locRows = ((B_dData_dList.v_append (shared).Vuna_dIr_dModel.f_IrShared_irSharedDefLocs) extraDefLocs) in (let _u = (if ((dtp_log_on 2) "Vuna.Compiler.Driver.SplitGen") then (((dtp_log_emit 2) "Vuna.Compiler.Driver.SplitGen") "cg-deflocs-done") else 0) in (((((((((((v_splitProgramFiles env) modules) entryDecls) printResult) runtimeDefs) allDatas) meta) ((v_splitLocPath roots) contextDir)) shared) entryIsAction) locRows)))))))))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 176 "Vuna/Compiler/Driver/SplitGen.vuna"
let v_sgcEnv = (fun (p : t_SplitGenCtx) -> (match p with
  | { f_SplitGenCtx_sgcEnv = dtb__111; f_SplitGenCtx_sgcAllDefs = dtb__112; f_SplitGenCtx_sgcDefOwnerT = dtb__113; f_SplitGenCtx_sgcDataOwnerT = dtb__114; f_SplitGenCtx_sgcDefUnitT = dtb__115; f_SplitGenCtx_sgcDataUnitT = dtb__116; f_SplitGenCtx_sgcOrdered = dtb__117; f_SplitGenCtx_sgcDefBuckets = dtb__118; f_SplitGenCtx_sgcDataBuckets = dtb__119; f_SplitGenCtx_sgcNormPath = dtb__120 } -> dtb__111
  | _ -> failwith "DT: impossible branch"
))

# 177 "Vuna/Compiler/Driver/SplitGen.vuna"
let v_sgcAllDefs = (fun (p : t_SplitGenCtx) -> (match p with
  | { f_SplitGenCtx_sgcEnv = dtb__121; f_SplitGenCtx_sgcAllDefs = dtb__122; f_SplitGenCtx_sgcDefOwnerT = dtb__123; f_SplitGenCtx_sgcDataOwnerT = dtb__124; f_SplitGenCtx_sgcDefUnitT = dtb__125; f_SplitGenCtx_sgcDataUnitT = dtb__126; f_SplitGenCtx_sgcOrdered = dtb__127; f_SplitGenCtx_sgcDefBuckets = dtb__128; f_SplitGenCtx_sgcDataBuckets = dtb__129; f_SplitGenCtx_sgcNormPath = dtb__130 } -> dtb__122
  | _ -> failwith "DT: impossible branch"
))

# 178 "Vuna/Compiler/Driver/SplitGen.vuna"
let v_sgcDefOwnerT = (fun (p : t_SplitGenCtx) -> (match p with
  | { f_SplitGenCtx_sgcEnv = dtb__131; f_SplitGenCtx_sgcAllDefs = dtb__132; f_SplitGenCtx_sgcDefOwnerT = dtb__133; f_SplitGenCtx_sgcDataOwnerT = dtb__134; f_SplitGenCtx_sgcDefUnitT = dtb__135; f_SplitGenCtx_sgcDataUnitT = dtb__136; f_SplitGenCtx_sgcOrdered = dtb__137; f_SplitGenCtx_sgcDefBuckets = dtb__138; f_SplitGenCtx_sgcDataBuckets = dtb__139; f_SplitGenCtx_sgcNormPath = dtb__140 } -> dtb__133
  | _ -> failwith "DT: impossible branch"
))

# 179 "Vuna/Compiler/Driver/SplitGen.vuna"
let v_sgcDataOwnerT = (fun (p : t_SplitGenCtx) -> (match p with
  | { f_SplitGenCtx_sgcEnv = dtb__141; f_SplitGenCtx_sgcAllDefs = dtb__142; f_SplitGenCtx_sgcDefOwnerT = dtb__143; f_SplitGenCtx_sgcDataOwnerT = dtb__144; f_SplitGenCtx_sgcDefUnitT = dtb__145; f_SplitGenCtx_sgcDataUnitT = dtb__146; f_SplitGenCtx_sgcOrdered = dtb__147; f_SplitGenCtx_sgcDefBuckets = dtb__148; f_SplitGenCtx_sgcDataBuckets = dtb__149; f_SplitGenCtx_sgcNormPath = dtb__150 } -> dtb__144
  | _ -> failwith "DT: impossible branch"
))

# 180 "Vuna/Compiler/Driver/SplitGen.vuna"
let v_sgcDefUnitT = (fun (p : t_SplitGenCtx) -> (match p with
  | { f_SplitGenCtx_sgcEnv = dtb__151; f_SplitGenCtx_sgcAllDefs = dtb__152; f_SplitGenCtx_sgcDefOwnerT = dtb__153; f_SplitGenCtx_sgcDataOwnerT = dtb__154; f_SplitGenCtx_sgcDefUnitT = dtb__155; f_SplitGenCtx_sgcDataUnitT = dtb__156; f_SplitGenCtx_sgcOrdered = dtb__157; f_SplitGenCtx_sgcDefBuckets = dtb__158; f_SplitGenCtx_sgcDataBuckets = dtb__159; f_SplitGenCtx_sgcNormPath = dtb__160 } -> dtb__155
  | _ -> failwith "DT: impossible branch"
))

# 181 "Vuna/Compiler/Driver/SplitGen.vuna"
let v_sgcDataUnitT = (fun (p : t_SplitGenCtx) -> (match p with
  | { f_SplitGenCtx_sgcEnv = dtb__161; f_SplitGenCtx_sgcAllDefs = dtb__162; f_SplitGenCtx_sgcDefOwnerT = dtb__163; f_SplitGenCtx_sgcDataOwnerT = dtb__164; f_SplitGenCtx_sgcDefUnitT = dtb__165; f_SplitGenCtx_sgcDataUnitT = dtb__166; f_SplitGenCtx_sgcOrdered = dtb__167; f_SplitGenCtx_sgcDefBuckets = dtb__168; f_SplitGenCtx_sgcDataBuckets = dtb__169; f_SplitGenCtx_sgcNormPath = dtb__170 } -> dtb__166
  | _ -> failwith "DT: impossible branch"
))

# 182 "Vuna/Compiler/Driver/SplitGen.vuna"
let v_sgcOrdered = (fun (p : t_SplitGenCtx) -> (match p with
  | { f_SplitGenCtx_sgcEnv = dtb__171; f_SplitGenCtx_sgcAllDefs = dtb__172; f_SplitGenCtx_sgcDefOwnerT = dtb__173; f_SplitGenCtx_sgcDataOwnerT = dtb__174; f_SplitGenCtx_sgcDefUnitT = dtb__175; f_SplitGenCtx_sgcDataUnitT = dtb__176; f_SplitGenCtx_sgcOrdered = dtb__177; f_SplitGenCtx_sgcDefBuckets = dtb__178; f_SplitGenCtx_sgcDataBuckets = dtb__179; f_SplitGenCtx_sgcNormPath = dtb__180 } -> dtb__177
  | _ -> failwith "DT: impossible branch"
))

# 184 "Vuna/Compiler/Driver/SplitGen.vuna"
let v_sgcDefBuckets = (fun (p : t_SplitGenCtx) -> (match p with
  | { f_SplitGenCtx_sgcEnv = dtb__181; f_SplitGenCtx_sgcAllDefs = dtb__182; f_SplitGenCtx_sgcDefOwnerT = dtb__183; f_SplitGenCtx_sgcDataOwnerT = dtb__184; f_SplitGenCtx_sgcDefUnitT = dtb__185; f_SplitGenCtx_sgcDataUnitT = dtb__186; f_SplitGenCtx_sgcOrdered = dtb__187; f_SplitGenCtx_sgcDefBuckets = dtb__188; f_SplitGenCtx_sgcDataBuckets = dtb__189; f_SplitGenCtx_sgcNormPath = dtb__190 } -> dtb__188
  | _ -> failwith "DT: impossible branch"
))

# 185 "Vuna/Compiler/Driver/SplitGen.vuna"
let v_sgcDataBuckets = (fun (p : t_SplitGenCtx) -> (match p with
  | { f_SplitGenCtx_sgcEnv = dtb__191; f_SplitGenCtx_sgcAllDefs = dtb__192; f_SplitGenCtx_sgcDefOwnerT = dtb__193; f_SplitGenCtx_sgcDataOwnerT = dtb__194; f_SplitGenCtx_sgcDefUnitT = dtb__195; f_SplitGenCtx_sgcDataUnitT = dtb__196; f_SplitGenCtx_sgcOrdered = dtb__197; f_SplitGenCtx_sgcDefBuckets = dtb__198; f_SplitGenCtx_sgcDataBuckets = dtb__199; f_SplitGenCtx_sgcNormPath = dtb__200 } -> dtb__199
  | _ -> failwith "DT: impossible branch"
))

# 187 "Vuna/Compiler/Driver/SplitGen.vuna"
let v_sgcNormPath = (fun p -> (match p with
  | { f_SplitGenCtx_sgcEnv = dtb__201; f_SplitGenCtx_sgcAllDefs = dtb__202; f_SplitGenCtx_sgcDefOwnerT = dtb__203; f_SplitGenCtx_sgcDataOwnerT = dtb__204; f_SplitGenCtx_sgcDefUnitT = dtb__205; f_SplitGenCtx_sgcDataUnitT = dtb__206; f_SplitGenCtx_sgcOrdered = dtb__207; f_SplitGenCtx_sgcDefBuckets = dtb__208; f_SplitGenCtx_sgcDataBuckets = dtb__209; f_SplitGenCtx_sgcNormPath = dtb__210 } -> dtb__210
  | _ -> failwith "DT: impossible branch"
))
