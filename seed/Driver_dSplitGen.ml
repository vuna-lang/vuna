open Vuna_runtime
type t_SplitGenCtx = { f_SplitGenCtx_sgcEnv : Lowering_dEnv.t_LwEnv; f_SplitGenCtx_sgcAllDefs : Elab_dTypes.t_DtDef B_dData_dList.t_List; f_SplitGenCtx_sgcDefOwnerT : (string, string) B_dContainer_dHashMap.t_HashMap; f_SplitGenCtx_sgcDataOwnerT : (string, string) B_dContainer_dHashMap.t_HashMap; f_SplitGenCtx_sgcDefUnitT : (string, string) B_dContainer_dHashMap.t_HashMap; f_SplitGenCtx_sgcDataUnitT : (string, string) B_dContainer_dHashMap.t_HashMap; f_SplitGenCtx_sgcOrdered : string B_dData_dList.t_List; f_SplitGenCtx_sgcDefBuckets : (string, Elab_dTypes.t_DtDef B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap; f_SplitGenCtx_sgcDataBuckets : (string, Elab_dTypes.t_DtData B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap; f_SplitGenCtx_sgcNormPath : (string) -> string; f_SplitGenCtx_sgcEffArity : (string, int) B_dContainer_dHashMap.t_HashMap }

# 44 "Vuna/Compiler/Driver/SplitGen.vuna"
let v_compilerPkgPrefix = "Vuna.Compiler."

# 47 "Vuna/Compiler/Driver/SplitGen.vuna"
let v_basePkgPrefix = "Base."

# 50 "Vuna/Compiler/Driver/SplitGen.vuna"
let v_unitPathOf = (fun (m : string) -> (if ((B_dData_dString.v_startsWith v_compilerPkgPrefix) m) then (((dtp_substring (String.length v_compilerPkgPrefix)) ((String.length m) - (String.length v_compilerPkgPrefix))) m) else (if ((B_dData_dString.v_startsWith v_basePkgPrefix) m) then ("B." ^ (((dtp_substring (String.length v_basePkgPrefix)) ((String.length m) - (String.length v_basePkgPrefix))) m)) else m)))

# 41 "Vuna/Compiler/Driver/SplitGen.vuna"
let v_splitUnitOfModule = (fun (modName : string) -> (Vuna_dTarget_dOcaml_dDecl.v_sanitizeName (v_unitPathOf modName)))

# 61 "Vuna/Compiler/Driver/SplitGen.vuna"
let v_unitOfLocName = (fun (name : string) -> (let p = (Driver_dOwner.v_modulePrefixOfName name) in (if (p = "") then (v_splitUnitOfModule Driver_dOwner.v_entryOwner) else (v_splitUnitOfModule p))))

# 69 "Vuna/Compiler/Driver/SplitGen.vuna"
let v_mainInitPrologue = "open Vuna_runtime\nlet () = dt_record_backtrace true\n"

# 77 "Vuna/Compiler/Driver/SplitGen.vuna"
let v_ownerTblOf = (fun (pairs : (string, string) B_dData_dPair.t_Pair B_dData_dList.t_List) -> ((((B_dContainer_dHashMap.v_insertAll B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) pairs) (((B_dContainer_dHashMap.v_fromList B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) B_dData_dList.C_List_Nil)))

# 86 "Vuna/Compiler/Driver/SplitGen.vuna"
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

# 83 "Vuna/Compiler/Driver/SplitGen.vuna"
let v_defBucketsOf = (fun (ownerT : (string, string) B_dContainer_dHashMap.t_HashMap) (defs : Elab_dTypes.t_DtDef B_dData_dList.t_List) -> (((v_defBucketsGo ownerT) (B_dData_dList.v_reverse defs)) (((B_dContainer_dHashMap.v_fromList B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) B_dData_dList.C_List_Nil)))

# 103 "Vuna/Compiler/Driver/SplitGen.vuna"
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

# 100 "Vuna/Compiler/Driver/SplitGen.vuna"
let v_dataBucketsOf = (fun (ownerT : (string, string) B_dContainer_dHashMap.t_HashMap) (datas : Elab_dTypes.t_DtData B_dData_dList.t_List) -> (((v_dataBucketsGo ownerT) (B_dData_dList.v_reverse datas)) (((B_dContainer_dHashMap.v_fromList B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) B_dData_dList.C_List_Nil)))

# 127 "Vuna/Compiler/Driver/SplitGen.vuna"
let v_knownUnit = (fun (units : string B_dData_dList.t_List) (u : string) -> ((B_dData_dList.v_memName u) units))

# 130 "Vuna/Compiler/Driver/SplitGen.vuna"
let rec v_checkDepsKnown = (fun (mc0 : string B_dData_dList.t_List) (mc1 : string) (mc2 : string B_dData_dList.t_List) -> (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__8, dtb__9) -> (if (B_dData_dBool.v_not ((v_knownUnit mc0) dtb__8)) then (Base_dDiag.v_icInternal (String.concat "" [mc1; " references unknown unit `"; dtb__8; "`"])) else (if (B_dData_dBool.v_not ((v_knownUnit mc0) mc1)) then (Base_dDiag.v_icInternal (String.concat "" ["split unit `"; mc1; "` is not in the module order"])) else (((v_checkDepsKnown mc0) mc1) dtb__9)))
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (0))
  | _ -> failwith "DT: impossible branch"
))

# 141 "Vuna/Compiler/Driver/SplitGen.vuna"
let v_depsInOrder = (fun (ordered : string B_dData_dList.t_List) (self : string) (deps : string B_dData_dList.t_List) -> ((B_dData_dList.v_filter (fun (u : string) -> (if (B_dData_dBool.v_not (u = self)) then ((B_dData_dList.v_memName u) deps) else false))) ordered))

# 144 "Vuna/Compiler/Driver/SplitGen.vuna"
let v_unitDepsOf = (fun (ordered : string B_dData_dList.t_List) (self : string) (deps : string B_dData_dList.t_List) -> ((Base_dCommon.v_bind (((v_checkDepsKnown ordered) self) deps)) (fun (_u : int) -> (Base_dDiag.C_Check_OkC ((((v_depsInOrder ordered) self) deps))))))

# 154 "Vuna/Compiler/Driver/SplitGen.vuna"
let rec v_uniqueSplitNames = (fun (mc0 : Driver_dSplit.t_SplitFile B_dData_dList.t_List) (mc1 : string B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__10, dtb__11) -> (match dtb__10 with
  | { Driver_dSplit.f_SplitFile_splitName = dtb__12; Driver_dSplit.f_SplitFile_splitText = dtb__13; Driver_dSplit.f_SplitFile_splitDeps = dtb__14 } -> (if ((B_dData_dList.v_memName dtb__12) mc1) then false else ((v_uniqueSplitNames dtb__11) (B_dData_dList.C_List__x58__x58_ (dtb__12, mc1))))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

# 159 "Vuna/Compiler/Driver/SplitGen.vuna"
let v_checkSplitNames = (fun (files : Driver_dSplit.t_SplitFile B_dData_dList.t_List) -> (if ((v_uniqueSplitNames files) B_dData_dList.C_List_Nil) then (Base_dDiag.C_Check_OkC (0)) else (Base_dDiag.v_icInternal "split unit name collides with another module (codegen unit naming)")))

# 169 "Vuna/Compiler/Driver/SplitGen.vuna"
let v_checkSplitAcyclic = (fun (files : Driver_dSplit.t_SplitFile B_dData_dList.t_List) -> (if (Driver_dSplit.v_splitGraphAcyclic files) then (Base_dDiag.C_Check_OkC (0)) else (Base_dDiag.v_icInternal "split dependency graph has a cycle (unit order is not a DAG)")))

# 180 "Vuna/Compiler/Driver/SplitGen.vuna"
let rec v_effTyHead = (fun (mc0 : Core_dTerm.t_Term) -> (match mc0 with
  | Core_dTerm.C_Term_TRecord (dtb__15, dtb__16) -> (dtb__15 = Vuna_dIr_dModel.v_irEffTypeName)
  | Core_dTerm.C_Term_TApp (dtb__17, dtb__18, dtb__19) -> (v_effTyHead dtb__17)
  | Core_dTerm.C_Term_TGlobal (dtb__20) -> (dtb__20 = Vuna_dIr_dModel.v_irEffTypeName)
  | _ -> false
))

# 186 "Vuna/Compiler/Driver/SplitGen.vuna"
let rec v_effArityPeel = (fun (mc0 : int) (mc1 : Core_dTerm.t_Term) -> (match mc1 with
  | Core_dTerm.C_Term_TPi (dtb__21, dtb__22, dtb__23, dtb__24, dtb__25) -> ((v_effArityPeel (if (Core_dTerm.v_rigIsErased dtb__23) then mc0 else (mc0 + 1))) dtb__25)
  | _ -> (if (v_effTyHead mc1) then (B_dData_dMaybe.C_Maybe_Just (mc0)) else B_dData_dMaybe.C_Maybe_Nothing)
))

# 190 "Vuna/Compiler/Driver/SplitGen.vuna"
let v_effArityOfTy = (fun (ty : Core_dTerm.t_Term) -> ((v_effArityPeel 0) ty))

# 193 "Vuna/Compiler/Driver/SplitGen.vuna"
let rec v_effArityTblOf = (fun (mc0 : Lowering_dEnv.t_LwEnv) (mc1 : Elab_dTypes.t_DtDef B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__26, dtb__27) -> (let tail = ((v_effArityTblOf mc0) dtb__27) in (match ((Lowering_dEnv.v_lwGlobalTyOf (Elab_dTypes.v_dtDefName dtb__26)) mc0) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__28) -> (match (v_effArityOfTy dtb__28) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__29) -> (((((B_dContainer_dHashMap.v_insert B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) (Elab_dTypes.v_dtDefName dtb__26)) dtb__29) tail)
  | B_dData_dMaybe.C_Maybe_Nothing -> tail
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> tail
  | _ -> failwith "DT: impossible branch"
))
  | B_dData_dList.C_List_Nil -> (((B_dContainer_dHashMap.v_fromList B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) B_dData_dList.C_List_Nil)
  | _ -> failwith "DT: impossible branch"
))

# 205 "Vuna/Compiler/Driver/SplitGen.vuna"
let rec v_effArityOfDefList = (fun (mc0 : Elab_dTypes.t_DtDef B_dData_dList.t_List) (mc1 : string) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__30, dtb__31) -> (if ((Elab_dTypes.v_dtDefName dtb__30) = mc1) then (v_effArityOfTy (Elab_dTypes.v_dtDefType dtb__30)) else ((v_effArityOfDefList dtb__31) mc1))
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 211 "Vuna/Compiler/Driver/SplitGen.vuna"
let v_effPredFor = (fun (tbl : (string, int) B_dContainer_dHashMap.t_HashMap) (defs : Elab_dTypes.t_DtDef B_dData_dList.t_List) (n : string) -> (match ((((B_dContainer_dHashMap.v_lookup B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) n) tbl) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__32) -> (B_dData_dMaybe.C_Maybe_Just (dtb__32))
  | B_dData_dMaybe.C_Maybe_Nothing -> ((v_effArityOfDefList defs) n)
  | _ -> failwith "DT: impossible branch"
))

# 218 "Vuna/Compiler/Driver/SplitGen.vuna"
let v_directPairOf = (fun (effTbl : (string, int) B_dContainer_dHashMap.t_HashMap) (p : (string, string) B_dData_dPair.t_Pair) -> (match ((((B_dContainer_dHashMap.v_lookup B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) (B_dData_dPair.v_firstOf p)) effTbl) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__33) -> (if (dtb__33 > 0) then (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = ((B_dData_dPair.v_firstOf p) ^ "__direct"); B_dData_dPair.f_Pair_second = (B_dData_dPair.v_secondOf p) }, B_dData_dList.C_List_Nil)) else B_dData_dList.C_List_Nil)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 241 "Vuna/Compiler/Driver/SplitGen.vuna"
let v_defsOfUnit = (fun (ctx : t_SplitGenCtx) (u : string) -> (match ((((B_dContainer_dHashMap.v_lookup B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) u) (ctx).f_SplitGenCtx_sgcDefBuckets) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__34) -> dtb__34
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 247 "Vuna/Compiler/Driver/SplitGen.vuna"
let v_datasOfUnit = (fun (ctx : t_SplitGenCtx) (u : string) -> (match ((((B_dContainer_dHashMap.v_lookup B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) u) (ctx).f_SplitGenCtx_sgcDataBuckets) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__35) -> dtb__35
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 253 "Vuna/Compiler/Driver/SplitGen.vuna"
let v_mapToUnit = (fun (pairs : (string, string) B_dData_dPair.t_Pair B_dData_dList.t_List) -> ((B_dData_dList.v_map (fun (q : (string, string) B_dData_dPair.t_Pair) -> { B_dData_dPair.f_Pair_first = (B_dData_dPair.v_firstOf q); B_dData_dPair.f_Pair_second = (v_splitUnitOfModule (B_dData_dPair.v_secondOf q)) })) pairs))

# 259 "Vuna/Compiler/Driver/SplitGen.vuna"
let v_checkModuleDeclName = (fun (knownModules : string B_dData_dList.t_List) (mname : string) (name : string) -> (if (Base_dSource.v_containsDot name) then (if ((B_dData_dList.v_memName (Driver_dOwner.v_modulePrefixOfName name)) knownModules) then (Base_dDiag.C_Check_OkC (0)) else (Base_dDiag.v_icInternal (String.concat "" ["module "; mname; " declares `"; name; "` whose module prefix `"; (Driver_dOwner.v_modulePrefixOfName name); "` is not a known module (codegen requires Loader-resolved decls)"]))) else (Base_dDiag.v_icInternal (String.concat "" ["module "; mname; " has an unresolved declaration name `"; name; "` (codegen requires Loader-resolved decls)"]))))

# 271 "Vuna/Compiler/Driver/SplitGen.vuna"
let rec v_checkModuleDeclNames = (fun (mc0 : string B_dData_dList.t_List) (mc1 : string) (mc2 : string B_dData_dList.t_List) -> (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__36, dtb__37) -> ((Base_dCommon.v_bind (((v_checkModuleDeclName mc0) mc1) dtb__36)) (fun (_u : int) -> (((v_checkModuleDeclNames mc0) mc1) dtb__37)))
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (0))
  | _ -> failwith "DT: impossible branch"
))

# 278 "Vuna/Compiler/Driver/SplitGen.vuna"
let rec v_checkModuleDecls = (fun (mc0 : string B_dData_dList.t_List) (mc1 : (string, Frontend_dAst.t_Decl B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__38, dtb__39) -> (match dtb__38 with
  | { B_dData_dPair.f_Pair_first = dtb__40; B_dData_dPair.f_Pair_second = dtb__41 } -> ((Base_dCommon.v_bind (((v_checkModuleDeclNames mc0) dtb__40) (Driver_dOwner.v_splitDeclNames dtb__41))) (fun (_u : int) -> ((v_checkModuleDecls mc0) dtb__39)))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (0))
  | _ -> failwith "DT: impossible branch"
))

# 289 "Vuna/Compiler/Driver/SplitGen.vuna"
let[@tail_mod_cons] rec v_entryDeclIdentities = (fun (mc0 : Frontend_dAst.t_Decl B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__42, dtb__43) -> (match dtb__42 with
  | Frontend_dAst.C_Decl_DSig (dtb__44, dtb__45, dtb__46, dtb__47) -> (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = false; B_dData_dPair.f_Pair_second = dtb__44 }, (v_entryDeclIdentities dtb__43)))
  | Frontend_dAst.C_Decl_DExtern (dtb__48, dtb__49, dtb__50, dtb__51) -> (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = false; B_dData_dPair.f_Pair_second = dtb__48 }, (v_entryDeclIdentities dtb__43)))
  | Frontend_dAst.C_Decl_DData (dtb__52, dtb__53, dtb__54, dtb__55, dtb__56, dtb__57, dtb__58, dtb__59, dtb__60) -> (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = true; B_dData_dPair.f_Pair_second = dtb__52 }, (v_entryDeclIdentities dtb__43)))
  | Frontend_dAst.C_Decl_DRecord (dtb__61, dtb__62, dtb__63, dtb__64, dtb__65, dtb__66, dtb__67, dtb__68) -> (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = true; B_dData_dPair.f_Pair_second = dtb__61 }, (v_entryDeclIdentities dtb__43)))
  | Frontend_dAst.C_Decl_DTrait (dtb__69, dtb__70, dtb__71, dtb__72, dtb__73) -> (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = true; B_dData_dPair.f_Pair_second = dtb__69 }, (v_entryDeclIdentities dtb__43)))
  | _ -> (v_entryDeclIdentities dtb__43)
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 302 "Vuna/Compiler/Driver/SplitGen.vuna"
let v_entryDeclKey = (fun (mc0 : (bool, string) B_dData_dPair.t_Pair) -> (match mc0 with
  | { B_dData_dPair.f_Pair_first = dtb__74; B_dData_dPair.f_Pair_second = dtb__75 } -> (if dtb__74 then ("type\t" ^ dtb__75) else ("value\t" ^ dtb__75))
  | _ -> failwith "DT: impossible branch"
))

# 306 "Vuna/Compiler/Driver/SplitGen.vuna"
let v_checkEntryDeclName = (fun (seen : string B_dData_dList.t_List) (identity : (bool, string) B_dData_dPair.t_Pair) -> (let name = (B_dData_dPair.v_secondOf identity) in (let key = (v_entryDeclKey identity) in (if (name = "") then (Base_dDiag.v_icInternal "entry declaration has an empty name") else (if (Base_dSource.v_containsDot name) then (Base_dDiag.v_icInternal (String.concat "" ["entry declaration `"; name; "` must not contain a module prefix (codegen requires Loader-resolved decls)"])) else (if ((B_dData_dList.v_memName key) seen) then (Base_dDiag.v_icInternal (String.concat "" ["duplicate entry declaration `"; name; "`"])) else (Base_dDiag.C_Check_OkC (0))))))))

# 318 "Vuna/Compiler/Driver/SplitGen.vuna"
let rec v_checkEntryDeclsGo = (fun (mc0 : string B_dData_dList.t_List) (mc1 : (bool, string) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__76, dtb__77) -> ((Base_dCommon.v_bind ((v_checkEntryDeclName mc0) dtb__76)) (fun (_u : int) -> ((v_checkEntryDeclsGo (B_dData_dList.C_List__x58__x58_ ((v_entryDeclKey dtb__76), mc0))) dtb__77)))
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (0))
  | _ -> failwith "DT: impossible branch"
))

# 325 "Vuna/Compiler/Driver/SplitGen.vuna"
let v_checkEntryDecls = (fun (decls : Frontend_dAst.t_Decl B_dData_dList.t_List) -> ((v_checkEntryDeclsGo B_dData_dList.C_List_Nil) (v_entryDeclIdentities decls)))

# 330 "Vuna/Compiler/Driver/SplitGen.vuna"
let rec v_checkDefOwners = (fun (mc0 : Driver_dOwner.t_SplitMeta) (mc1 : Elab_dTypes.t_DtDef B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__78, dtb__79) -> ((Base_dCommon.v_bind ((Driver_dOwner.v_splitDefOwnerOf mc0) (Elab_dTypes.v_dtDefName dtb__78))) (fun (_u : string) -> ((v_checkDefOwners mc0) dtb__79)))
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (0))
  | _ -> failwith "DT: impossible branch"
))

# 337 "Vuna/Compiler/Driver/SplitGen.vuna"
let rec v_checkDataOwners = (fun (mc0 : Driver_dOwner.t_SplitMeta) (mc1 : Elab_dTypes.t_DtData B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__80, dtb__81) -> ((Base_dCommon.v_bind ((Driver_dOwner.v_splitDataOwnerOf mc0) dtb__80)) (fun (_u : string) -> ((v_checkDataOwners mc0) dtb__81)))
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (0))
  | _ -> failwith "DT: impossible branch"
))

# 342 "Vuna/Compiler/Driver/SplitGen.vuna"
let v_checkResolvedModules = (fun (meta : Driver_dOwner.t_SplitMeta) (modules : (string, Frontend_dAst.t_Decl B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (entryDecls : Frontend_dAst.t_Decl B_dData_dList.t_List) (runtime : Elab_dTypes.t_DtDef B_dData_dList.t_List) (datas : Elab_dTypes.t_DtData B_dData_dList.t_List) -> ((Base_dCommon.v_bind ((v_checkModuleDecls (meta).Driver_dOwner.f_SplitMeta_smKnownModules) modules)) (fun (_u : int) -> ((Base_dCommon.v_bind (v_checkEntryDecls entryDecls)) (fun (_u : int) -> ((Base_dCommon.v_bind ((v_checkDefOwners meta) runtime)) (fun (_u : int) -> ((v_checkDataOwners meta) datas))))))))

# 354 "Vuna/Compiler/Driver/SplitGen.vuna"
let v_splitStripPrefix = Base_dSource.v_stripPathPrefix

# 357 "Vuna/Compiler/Driver/SplitGen.vuna"
let v_splitStripRoots = Base_dSource.v_stripRootsPath

# 360 "Vuna/Compiler/Driver/SplitGen.vuna"
let v_splitStripDotSlash = Base_dSource.v_stripDotSlashPath

# 363 "Vuna/Compiler/Driver/SplitGen.vuna"
let v_splitLocPath = (fun (roots : string B_dData_dList.t_List) (contextDir : string) (path : string) -> (((Base_dSource.v_locationPathUnder roots) contextDir) path))

# 370 "Vuna/Compiler/Driver/SplitGen.vuna"
let rec v_helperInText = (fun (mc0 : string) (mc1 : string B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__82, dtb__83) -> (if ((B_dData_dString.v_contains mc0) dtb__82) then true else ((v_helperInText mc0) dtb__83))
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 374 "Vuna/Compiler/Driver/SplitGen.vuna"
let rec v_helperInTexts = (fun (mc0 : string B_dData_dList.t_List) (mc1 : string B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__84, dtb__85) -> (if ((v_helperInText dtb__84) mc1) then true else ((v_helperInTexts dtb__85) mc1))
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 380 "Vuna/Compiler/Driver/SplitGen.vuna"
let v_dtRuntimeFor = (fun (shared : Vuna_dIr_dModel.t_IrShared) (entryIsAction : bool) (keptTexts : string B_dData_dList.t_List) -> (((((((((Vuna_dTarget_dOcaml_dTerm.v_dtRuntimeWith (shared).Vuna_dIr_dModel.f_IrShared_irSharedUsesFloat) (shared).Vuna_dIr_dModel.f_IrShared_irSharedUsesTrace) (shared).Vuna_dIr_dModel.f_IrShared_irSharedUsesObs) (shared).Vuna_dIr_dModel.f_IrShared_irSharedUsesHost) (if (shared).Vuna_dIr_dModel.f_IrShared_irSharedUsesSched then true else entryIsAction)) (if (shared).Vuna_dIr_dModel.f_IrShared_irSharedUsesEff then true else entryIsAction)) ((v_helperInTexts Vuna_dTarget_dOcaml_dTerm.v_dtStrHelperNames) keptTexts)) ((v_helperInTexts Vuna_dTarget_dOcaml_dTerm.v_dtArrHelperNames) keptTexts)) ((v_helperInTexts Vuna_dTarget_dOcaml_dTerm.v_dtBufHelperNames) keptTexts)))

# 394 "Vuna/Compiler/Driver/SplitGen.vuna"
let v_entryIsActionM = (fun (mc0 : Vuna_dIr_dModel.t_IrEntry B_dData_dMaybe.t_Maybe) -> (match mc0 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__86) -> (Vuna_dIr_dModel.v_irEntryIsActionOf dtb__86)
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
let v_sgcEnv = (fun (p : t_SplitGenCtx) -> (match p with
  | { f_SplitGenCtx_sgcEnv = dtb__136; f_SplitGenCtx_sgcAllDefs = dtb__137; f_SplitGenCtx_sgcDefOwnerT = dtb__138; f_SplitGenCtx_sgcDataOwnerT = dtb__139; f_SplitGenCtx_sgcDefUnitT = dtb__140; f_SplitGenCtx_sgcDataUnitT = dtb__141; f_SplitGenCtx_sgcOrdered = dtb__142; f_SplitGenCtx_sgcDefBuckets = dtb__143; f_SplitGenCtx_sgcDataBuckets = dtb__144; f_SplitGenCtx_sgcNormPath = dtb__145; f_SplitGenCtx_sgcEffArity = dtb__146 } -> dtb__136
  | _ -> failwith "DT: impossible branch"
))

# 226 "Vuna/Compiler/Driver/SplitGen.vuna"
let v_sgcAllDefs = (fun (p : t_SplitGenCtx) -> (match p with
  | { f_SplitGenCtx_sgcEnv = dtb__147; f_SplitGenCtx_sgcAllDefs = dtb__148; f_SplitGenCtx_sgcDefOwnerT = dtb__149; f_SplitGenCtx_sgcDataOwnerT = dtb__150; f_SplitGenCtx_sgcDefUnitT = dtb__151; f_SplitGenCtx_sgcDataUnitT = dtb__152; f_SplitGenCtx_sgcOrdered = dtb__153; f_SplitGenCtx_sgcDefBuckets = dtb__154; f_SplitGenCtx_sgcDataBuckets = dtb__155; f_SplitGenCtx_sgcNormPath = dtb__156; f_SplitGenCtx_sgcEffArity = dtb__157 } -> dtb__148
  | _ -> failwith "DT: impossible branch"
))

# 227 "Vuna/Compiler/Driver/SplitGen.vuna"
let v_sgcDefOwnerT = (fun (p : t_SplitGenCtx) -> (match p with
  | { f_SplitGenCtx_sgcEnv = dtb__158; f_SplitGenCtx_sgcAllDefs = dtb__159; f_SplitGenCtx_sgcDefOwnerT = dtb__160; f_SplitGenCtx_sgcDataOwnerT = dtb__161; f_SplitGenCtx_sgcDefUnitT = dtb__162; f_SplitGenCtx_sgcDataUnitT = dtb__163; f_SplitGenCtx_sgcOrdered = dtb__164; f_SplitGenCtx_sgcDefBuckets = dtb__165; f_SplitGenCtx_sgcDataBuckets = dtb__166; f_SplitGenCtx_sgcNormPath = dtb__167; f_SplitGenCtx_sgcEffArity = dtb__168 } -> dtb__160
  | _ -> failwith "DT: impossible branch"
))

# 228 "Vuna/Compiler/Driver/SplitGen.vuna"
let v_sgcDataOwnerT = (fun (p : t_SplitGenCtx) -> (match p with
  | { f_SplitGenCtx_sgcEnv = dtb__169; f_SplitGenCtx_sgcAllDefs = dtb__170; f_SplitGenCtx_sgcDefOwnerT = dtb__171; f_SplitGenCtx_sgcDataOwnerT = dtb__172; f_SplitGenCtx_sgcDefUnitT = dtb__173; f_SplitGenCtx_sgcDataUnitT = dtb__174; f_SplitGenCtx_sgcOrdered = dtb__175; f_SplitGenCtx_sgcDefBuckets = dtb__176; f_SplitGenCtx_sgcDataBuckets = dtb__177; f_SplitGenCtx_sgcNormPath = dtb__178; f_SplitGenCtx_sgcEffArity = dtb__179 } -> dtb__172
  | _ -> failwith "DT: impossible branch"
))

# 229 "Vuna/Compiler/Driver/SplitGen.vuna"
let v_sgcDefUnitT = (fun (p : t_SplitGenCtx) -> (match p with
  | { f_SplitGenCtx_sgcEnv = dtb__180; f_SplitGenCtx_sgcAllDefs = dtb__181; f_SplitGenCtx_sgcDefOwnerT = dtb__182; f_SplitGenCtx_sgcDataOwnerT = dtb__183; f_SplitGenCtx_sgcDefUnitT = dtb__184; f_SplitGenCtx_sgcDataUnitT = dtb__185; f_SplitGenCtx_sgcOrdered = dtb__186; f_SplitGenCtx_sgcDefBuckets = dtb__187; f_SplitGenCtx_sgcDataBuckets = dtb__188; f_SplitGenCtx_sgcNormPath = dtb__189; f_SplitGenCtx_sgcEffArity = dtb__190 } -> dtb__184
  | _ -> failwith "DT: impossible branch"
))

# 230 "Vuna/Compiler/Driver/SplitGen.vuna"
let v_sgcDataUnitT = (fun (p : t_SplitGenCtx) -> (match p with
  | { f_SplitGenCtx_sgcEnv = dtb__191; f_SplitGenCtx_sgcAllDefs = dtb__192; f_SplitGenCtx_sgcDefOwnerT = dtb__193; f_SplitGenCtx_sgcDataOwnerT = dtb__194; f_SplitGenCtx_sgcDefUnitT = dtb__195; f_SplitGenCtx_sgcDataUnitT = dtb__196; f_SplitGenCtx_sgcOrdered = dtb__197; f_SplitGenCtx_sgcDefBuckets = dtb__198; f_SplitGenCtx_sgcDataBuckets = dtb__199; f_SplitGenCtx_sgcNormPath = dtb__200; f_SplitGenCtx_sgcEffArity = dtb__201 } -> dtb__196
  | _ -> failwith "DT: impossible branch"
))

# 231 "Vuna/Compiler/Driver/SplitGen.vuna"
let v_sgcOrdered = (fun (p : t_SplitGenCtx) -> (match p with
  | { f_SplitGenCtx_sgcEnv = dtb__202; f_SplitGenCtx_sgcAllDefs = dtb__203; f_SplitGenCtx_sgcDefOwnerT = dtb__204; f_SplitGenCtx_sgcDataOwnerT = dtb__205; f_SplitGenCtx_sgcDefUnitT = dtb__206; f_SplitGenCtx_sgcDataUnitT = dtb__207; f_SplitGenCtx_sgcOrdered = dtb__208; f_SplitGenCtx_sgcDefBuckets = dtb__209; f_SplitGenCtx_sgcDataBuckets = dtb__210; f_SplitGenCtx_sgcNormPath = dtb__211; f_SplitGenCtx_sgcEffArity = dtb__212 } -> dtb__208
  | _ -> failwith "DT: impossible branch"
))

# 233 "Vuna/Compiler/Driver/SplitGen.vuna"
let v_sgcDefBuckets = (fun (p : t_SplitGenCtx) -> (match p with
  | { f_SplitGenCtx_sgcEnv = dtb__213; f_SplitGenCtx_sgcAllDefs = dtb__214; f_SplitGenCtx_sgcDefOwnerT = dtb__215; f_SplitGenCtx_sgcDataOwnerT = dtb__216; f_SplitGenCtx_sgcDefUnitT = dtb__217; f_SplitGenCtx_sgcDataUnitT = dtb__218; f_SplitGenCtx_sgcOrdered = dtb__219; f_SplitGenCtx_sgcDefBuckets = dtb__220; f_SplitGenCtx_sgcDataBuckets = dtb__221; f_SplitGenCtx_sgcNormPath = dtb__222; f_SplitGenCtx_sgcEffArity = dtb__223 } -> dtb__220
  | _ -> failwith "DT: impossible branch"
))

# 234 "Vuna/Compiler/Driver/SplitGen.vuna"
let v_sgcDataBuckets = (fun (p : t_SplitGenCtx) -> (match p with
  | { f_SplitGenCtx_sgcEnv = dtb__224; f_SplitGenCtx_sgcAllDefs = dtb__225; f_SplitGenCtx_sgcDefOwnerT = dtb__226; f_SplitGenCtx_sgcDataOwnerT = dtb__227; f_SplitGenCtx_sgcDefUnitT = dtb__228; f_SplitGenCtx_sgcDataUnitT = dtb__229; f_SplitGenCtx_sgcOrdered = dtb__230; f_SplitGenCtx_sgcDefBuckets = dtb__231; f_SplitGenCtx_sgcDataBuckets = dtb__232; f_SplitGenCtx_sgcNormPath = dtb__233; f_SplitGenCtx_sgcEffArity = dtb__234 } -> dtb__232
  | _ -> failwith "DT: impossible branch"
))

# 236 "Vuna/Compiler/Driver/SplitGen.vuna"
let v_sgcNormPath = (fun p -> (match p with
  | { f_SplitGenCtx_sgcEnv = dtb__235; f_SplitGenCtx_sgcAllDefs = dtb__236; f_SplitGenCtx_sgcDefOwnerT = dtb__237; f_SplitGenCtx_sgcDataOwnerT = dtb__238; f_SplitGenCtx_sgcDefUnitT = dtb__239; f_SplitGenCtx_sgcDataUnitT = dtb__240; f_SplitGenCtx_sgcOrdered = dtb__241; f_SplitGenCtx_sgcDefBuckets = dtb__242; f_SplitGenCtx_sgcDataBuckets = dtb__243; f_SplitGenCtx_sgcNormPath = dtb__244; f_SplitGenCtx_sgcEffArity = dtb__245 } -> dtb__244
  | _ -> failwith "DT: impossible branch"
))

# 238 "Vuna/Compiler/Driver/SplitGen.vuna"
let v_sgcEffArity = (fun (p : t_SplitGenCtx) -> (match p with
  | { f_SplitGenCtx_sgcEnv = dtb__246; f_SplitGenCtx_sgcAllDefs = dtb__247; f_SplitGenCtx_sgcDefOwnerT = dtb__248; f_SplitGenCtx_sgcDataOwnerT = dtb__249; f_SplitGenCtx_sgcDefUnitT = dtb__250; f_SplitGenCtx_sgcDataUnitT = dtb__251; f_SplitGenCtx_sgcOrdered = dtb__252; f_SplitGenCtx_sgcDefBuckets = dtb__253; f_SplitGenCtx_sgcDataBuckets = dtb__254; f_SplitGenCtx_sgcNormPath = dtb__255; f_SplitGenCtx_sgcEffArity = dtb__256 } -> dtb__256
  | _ -> failwith "DT: impossible branch"
))
