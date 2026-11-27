open Vuna_runtime
type t_SplitGenCtx = { f_SplitGenCtx_sgcEnv : Lowering_dEnv.t_LwEnv; f_SplitGenCtx_sgcAllDefs : Elab_dTypes.t_DtDef B_dData_dList.t_List; f_SplitGenCtx_sgcDefOwnerT : (string, string) B_dContainer_dHashMap.t_HashMap; f_SplitGenCtx_sgcDataOwnerT : (string, string) B_dContainer_dHashMap.t_HashMap; f_SplitGenCtx_sgcDefUnitT : (string, string) B_dContainer_dHashMap.t_HashMap; f_SplitGenCtx_sgcDataUnitT : (string, string) B_dContainer_dHashMap.t_HashMap; f_SplitGenCtx_sgcOrdered : string B_dData_dList.t_List; f_SplitGenCtx_sgcDefBuckets : (string, Elab_dTypes.t_DtDef B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap; f_SplitGenCtx_sgcDataBuckets : (string, Elab_dTypes.t_DtData B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap; f_SplitGenCtx_sgcNormPath : (string) -> string; f_SplitGenCtx_sgcEffArity : (string, int) B_dContainer_dHashMap.t_HashMap }

# 43 "Vuna/Compiler/Driver/SplitGen.vuna"
let v_compilerPkgPrefix = "Vuna.Compiler."

# 46 "Vuna/Compiler/Driver/SplitGen.vuna"
let v_basePkgPrefix = "Base."

# 49 "Vuna/Compiler/Driver/SplitGen.vuna"
let v_unitPathOf = (fun (m : string) -> (if ((B_dData_dString.v_startsWith v_compilerPkgPrefix) m) then (((dtp_substring (String.length v_compilerPkgPrefix)) ((String.length m) - (String.length v_compilerPkgPrefix))) m) else (if ((B_dData_dString.v_startsWith v_basePkgPrefix) m) then ("B." ^ (((dtp_substring (String.length v_basePkgPrefix)) ((String.length m) - (String.length v_basePkgPrefix))) m)) else m)))

# 40 "Vuna/Compiler/Driver/SplitGen.vuna"
let v_splitUnitOfModule = (fun (modName : string) -> (Vuna_dTarget_dOcaml_dDecl.v_sanitizeName (v_unitPathOf modName)))

# 60 "Vuna/Compiler/Driver/SplitGen.vuna"
let v_unitOfLocName = (fun (name : string) -> (let p = (Driver_dOwner.v_modulePrefixOfName name) in (if (p = "") then (v_splitUnitOfModule Driver_dOwner.v_entryOwner) else (v_splitUnitOfModule p))))

# 68 "Vuna/Compiler/Driver/SplitGen.vuna"
let v_mainInitPrologue = "open Vuna_runtime\nlet () = dt_record_backtrace true\n"

# 76 "Vuna/Compiler/Driver/SplitGen.vuna"
let v_ownerTblOf = (fun (pairs : (string, string) B_dData_dPair.t_Pair B_dData_dList.t_List) -> ((((B_dContainer_dHashMap.v_insertAll B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) pairs) (((B_dContainer_dHashMap.v_fromList B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) B_dData_dList.C_List_Nil)))

# 85 "Vuna/Compiler/Driver/SplitGen.vuna"
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

# 82 "Vuna/Compiler/Driver/SplitGen.vuna"
let v_defBucketsOf = (fun (ownerT : (string, string) B_dContainer_dHashMap.t_HashMap) (defs : Elab_dTypes.t_DtDef B_dData_dList.t_List) -> (((v_defBucketsGo ownerT) (B_dData_dList.v_reverse defs)) (((B_dContainer_dHashMap.v_fromList B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) B_dData_dList.C_List_Nil)))

# 102 "Vuna/Compiler/Driver/SplitGen.vuna"
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

# 99 "Vuna/Compiler/Driver/SplitGen.vuna"
let v_dataBucketsOf = (fun (ownerT : (string, string) B_dContainer_dHashMap.t_HashMap) (datas : Elab_dTypes.t_DtData B_dData_dList.t_List) -> (((v_dataBucketsGo ownerT) (B_dData_dList.v_reverse datas)) (((B_dContainer_dHashMap.v_fromList B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) B_dData_dList.C_List_Nil)))

# 126 "Vuna/Compiler/Driver/SplitGen.vuna"
let v_knownUnit = (fun (units : string B_dData_dList.t_List) (u : string) -> ((B_dData_dList.v_memName u) units))

# 129 "Vuna/Compiler/Driver/SplitGen.vuna"
let rec v_checkDepsKnown = (fun (mc0 : string B_dData_dList.t_List) (mc1 : string) (mc2 : string B_dData_dList.t_List) -> (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__8, dtb__9) -> (if (B_dData_dBool.v_not ((v_knownUnit mc0) dtb__8)) then (Base_dDiag.v_icInternal (String.concat "" [mc1; " references unknown unit `"; dtb__8; "`"])) else (if (B_dData_dBool.v_not ((v_knownUnit mc0) mc1)) then (Base_dDiag.v_icInternal (String.concat "" ["split unit `"; mc1; "` is not in the module order"])) else (((v_checkDepsKnown mc0) mc1) dtb__9)))
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (0))
  | _ -> failwith "DT: impossible branch"
))

# 140 "Vuna/Compiler/Driver/SplitGen.vuna"
let v_depsInOrder = (fun (ordered : string B_dData_dList.t_List) (self : string) (deps : string B_dData_dList.t_List) -> ((B_dData_dList.v_filter (fun (u : string) -> (if (B_dData_dBool.v_not (u = self)) then ((B_dData_dList.v_memName u) deps) else false))) ordered))

# 143 "Vuna/Compiler/Driver/SplitGen.vuna"
let v_unitDepsOf = (fun (ordered : string B_dData_dList.t_List) (self : string) (deps : string B_dData_dList.t_List) -> ((Base_dCommon.v_bind (((v_checkDepsKnown ordered) self) deps)) (fun (_u : int) -> (Base_dDiag.C_Check_OkC ((((v_depsInOrder ordered) self) deps))))))

# 153 "Vuna/Compiler/Driver/SplitGen.vuna"
let rec v_uniqueSplitNames = (fun (mc0 : Driver_dSplit.t_SplitFile B_dData_dList.t_List) (mc1 : string B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__10, dtb__11) -> (match dtb__10 with
  | { Driver_dSplit.f_SplitFile_splitName = dtb__12; Driver_dSplit.f_SplitFile_splitText = dtb__13; Driver_dSplit.f_SplitFile_splitDeps = dtb__14 } -> (if ((B_dData_dList.v_memName dtb__12) mc1) then false else ((v_uniqueSplitNames dtb__11) (B_dData_dList.C_List__x58__x58_ (dtb__12, mc1))))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

# 158 "Vuna/Compiler/Driver/SplitGen.vuna"
let v_checkSplitNames = (fun (files : Driver_dSplit.t_SplitFile B_dData_dList.t_List) -> (if ((v_uniqueSplitNames files) B_dData_dList.C_List_Nil) then (Base_dDiag.C_Check_OkC (0)) else (Base_dDiag.v_icInternal "split unit name collides with another module (codegen unit naming)")))

# 168 "Vuna/Compiler/Driver/SplitGen.vuna"
let v_checkSplitAcyclic = (fun (files : Driver_dSplit.t_SplitFile B_dData_dList.t_List) -> (if (Driver_dSplit.v_splitGraphAcyclic files) then (Base_dDiag.C_Check_OkC (0)) else (Base_dDiag.v_icInternal "split dependency graph has a cycle (unit order is not a DAG)")))

# 181 "Vuna/Compiler/Driver/SplitGen.vuna"
let rec v_effArityTblOf = (fun (mc0 : Lowering_dEnv.t_LwEnv) (mc1 : Elab_dTypes.t_DtDef B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__15, dtb__16) -> (let tail = ((v_effArityTblOf mc0) dtb__16) in (match ((Lowering_dEnv.v_lwGlobalTyOf (Elab_dTypes.v_dtDefName dtb__15)) mc0) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__17) -> (match (Lowering_dTy.v_effArityOfTy dtb__17) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__18) -> (((((B_dContainer_dHashMap.v_insert B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) (Elab_dTypes.v_dtDefName dtb__15)) dtb__18) tail)
  | B_dData_dMaybe.C_Maybe_Nothing -> tail
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> tail
  | _ -> failwith "DT: impossible branch"
))
  | B_dData_dList.C_List_Nil -> (((B_dContainer_dHashMap.v_fromList B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) B_dData_dList.C_List_Nil)
  | _ -> failwith "DT: impossible branch"
))

# 193 "Vuna/Compiler/Driver/SplitGen.vuna"
let rec v_effArityOfDefList = (fun (mc0 : Elab_dTypes.t_DtDef B_dData_dList.t_List) (mc1 : string) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__19, dtb__20) -> (if ((Elab_dTypes.v_dtDefName dtb__19) = mc1) then (Lowering_dTy.v_effArityOfTy (Elab_dTypes.v_dtDefType dtb__19)) else ((v_effArityOfDefList dtb__20) mc1))
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 199 "Vuna/Compiler/Driver/SplitGen.vuna"
let v_effPredFor = (fun (tbl : (string, int) B_dContainer_dHashMap.t_HashMap) (defs : Elab_dTypes.t_DtDef B_dData_dList.t_List) (n : string) -> (match ((((B_dContainer_dHashMap.v_lookup B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) n) tbl) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__21) -> (B_dData_dMaybe.C_Maybe_Just (dtb__21))
  | B_dData_dMaybe.C_Maybe_Nothing -> ((v_effArityOfDefList defs) n)
  | _ -> failwith "DT: impossible branch"
))

# 206 "Vuna/Compiler/Driver/SplitGen.vuna"
let v_directPairOf = (fun (effTbl : (string, int) B_dContainer_dHashMap.t_HashMap) (p : (string, string) B_dData_dPair.t_Pair) -> (match ((((B_dContainer_dHashMap.v_lookup B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) (B_dData_dPair.v_firstOf p)) effTbl) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__22) -> (if (dtb__22 > 0) then (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = ((B_dData_dPair.v_firstOf p) ^ "__direct"); B_dData_dPair.f_Pair_second = (B_dData_dPair.v_secondOf p) }, B_dData_dList.C_List_Nil)) else B_dData_dList.C_List_Nil)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 229 "Vuna/Compiler/Driver/SplitGen.vuna"
let v_defsOfUnit = (fun (ctx : t_SplitGenCtx) (u : string) -> (match ((((B_dContainer_dHashMap.v_lookup B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) u) (ctx).f_SplitGenCtx_sgcDefBuckets) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__23) -> dtb__23
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 235 "Vuna/Compiler/Driver/SplitGen.vuna"
let v_datasOfUnit = (fun (ctx : t_SplitGenCtx) (u : string) -> (match ((((B_dContainer_dHashMap.v_lookup B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) u) (ctx).f_SplitGenCtx_sgcDataBuckets) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__24) -> dtb__24
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 241 "Vuna/Compiler/Driver/SplitGen.vuna"
let v_mapToUnit = (fun (pairs : (string, string) B_dData_dPair.t_Pair B_dData_dList.t_List) -> ((B_dData_dList.v_map (fun (q : (string, string) B_dData_dPair.t_Pair) -> { B_dData_dPair.f_Pair_first = (B_dData_dPair.v_firstOf (Obj.magic q)); B_dData_dPair.f_Pair_second = (v_splitUnitOfModule (B_dData_dPair.v_secondOf (Obj.magic q))) })) pairs))

# 247 "Vuna/Compiler/Driver/SplitGen.vuna"
let v_checkModuleDeclName = (fun (knownModules : string B_dData_dList.t_List) (mname : string) (name : string) -> (if (Base_dSource.v_containsDot name) then (if ((B_dData_dList.v_memName (Driver_dOwner.v_modulePrefixOfName name)) knownModules) then (Base_dDiag.C_Check_OkC (0)) else (Base_dDiag.v_icInternal (String.concat "" ["module "; mname; " declares `"; name; "` whose module prefix `"; (Driver_dOwner.v_modulePrefixOfName name); "` is not a known module (codegen requires Loader-resolved decls)"]))) else (Base_dDiag.v_icInternal (String.concat "" ["module "; mname; " has an unresolved declaration name `"; name; "` (codegen requires Loader-resolved decls)"]))))

# 259 "Vuna/Compiler/Driver/SplitGen.vuna"
let rec v_checkModuleDeclNames = (fun (mc0 : string B_dData_dList.t_List) (mc1 : string) (mc2 : string B_dData_dList.t_List) -> (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__25, dtb__26) -> ((Base_dCommon.v_bind (((v_checkModuleDeclName mc0) mc1) dtb__25)) (fun (_u : int) -> (((v_checkModuleDeclNames mc0) mc1) dtb__26)))
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (0))
  | _ -> failwith "DT: impossible branch"
))

# 266 "Vuna/Compiler/Driver/SplitGen.vuna"
let rec v_checkModuleDecls = (fun (mc0 : string B_dData_dList.t_List) (mc1 : (string, Frontend_dAst.t_Decl B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__27, dtb__28) -> (match dtb__27 with
  | { B_dData_dPair.f_Pair_first = dtb__29; B_dData_dPair.f_Pair_second = dtb__30 } -> ((Base_dCommon.v_bind (((v_checkModuleDeclNames mc0) dtb__29) (Driver_dOwner.v_splitDeclNames dtb__30))) (fun (_u : int) -> ((v_checkModuleDecls mc0) dtb__28)))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (0))
  | _ -> failwith "DT: impossible branch"
))

# 277 "Vuna/Compiler/Driver/SplitGen.vuna"
let[@tail_mod_cons] rec v_entryDeclIdentities = (fun (mc0 : Frontend_dAst.t_Decl B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__31, dtb__32) -> (match dtb__31 with
  | Frontend_dAst.C_Decl_DSig (dtb__33, dtb__34, dtb__35, dtb__36) -> (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = false; B_dData_dPair.f_Pair_second = dtb__33 }, (v_entryDeclIdentities dtb__32)))
  | Frontend_dAst.C_Decl_DExtern (dtb__37, dtb__38, dtb__39, dtb__40) -> (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = false; B_dData_dPair.f_Pair_second = dtb__37 }, (v_entryDeclIdentities dtb__32)))
  | Frontend_dAst.C_Decl_DData (dtb__41, dtb__42, dtb__43, dtb__44, dtb__45, dtb__46, dtb__47, dtb__48, dtb__49) -> (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = true; B_dData_dPair.f_Pair_second = dtb__41 }, (v_entryDeclIdentities dtb__32)))
  | Frontend_dAst.C_Decl_DRecord (dtb__50, dtb__51, dtb__52, dtb__53, dtb__54, dtb__55, dtb__56, dtb__57) -> (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = true; B_dData_dPair.f_Pair_second = dtb__50 }, (v_entryDeclIdentities dtb__32)))
  | Frontend_dAst.C_Decl_DTrait (dtb__58, dtb__59, dtb__60, dtb__61, dtb__62) -> (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = true; B_dData_dPair.f_Pair_second = dtb__58 }, (v_entryDeclIdentities dtb__32)))
  | _ -> (v_entryDeclIdentities dtb__32)
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 290 "Vuna/Compiler/Driver/SplitGen.vuna"
let v_entryDeclKey = (fun (mc0 : (bool, string) B_dData_dPair.t_Pair) -> (match mc0 with
  | { B_dData_dPair.f_Pair_first = dtb__63; B_dData_dPair.f_Pair_second = dtb__64 } -> (if dtb__63 then ("type\t" ^ dtb__64) else ("value\t" ^ dtb__64))
  | _ -> failwith "DT: impossible branch"
))

# 294 "Vuna/Compiler/Driver/SplitGen.vuna"
let v_checkEntryDeclName = (fun (seen : string B_dData_dList.t_List) (identity : (bool, string) B_dData_dPair.t_Pair) -> (let name = (B_dData_dPair.v_secondOf identity) in (let key = (v_entryDeclKey identity) in (if (name = "") then (Base_dDiag.v_icInternal "entry declaration has an empty name") else (if (Base_dSource.v_containsDot name) then (Base_dDiag.v_icInternal (String.concat "" ["entry declaration `"; name; "` must not contain a module prefix (codegen requires Loader-resolved decls)"])) else (if ((B_dData_dList.v_memName key) seen) then (Base_dDiag.v_icInternal (String.concat "" ["duplicate entry declaration `"; name; "`"])) else (Base_dDiag.C_Check_OkC (0))))))))

# 306 "Vuna/Compiler/Driver/SplitGen.vuna"
let rec v_checkEntryDeclsGo = (fun (mc0 : string B_dData_dList.t_List) (mc1 : (bool, string) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__65, dtb__66) -> ((Base_dCommon.v_bind ((v_checkEntryDeclName mc0) dtb__65)) (fun (_u : int) -> ((v_checkEntryDeclsGo (B_dData_dList.C_List__x58__x58_ ((v_entryDeclKey dtb__65), mc0))) dtb__66)))
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (0))
  | _ -> failwith "DT: impossible branch"
))

# 313 "Vuna/Compiler/Driver/SplitGen.vuna"
let v_checkEntryDecls = (fun (decls : Frontend_dAst.t_Decl B_dData_dList.t_List) -> ((v_checkEntryDeclsGo B_dData_dList.C_List_Nil) (v_entryDeclIdentities decls)))

# 318 "Vuna/Compiler/Driver/SplitGen.vuna"
let rec v_checkDefOwners = (fun (mc0 : Driver_dOwner.t_SplitMeta) (mc1 : Elab_dTypes.t_DtDef B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__67, dtb__68) -> ((Base_dCommon.v_bind ((Driver_dOwner.v_splitDefOwnerOf mc0) (Elab_dTypes.v_dtDefName dtb__67))) (fun (_u : string) -> ((v_checkDefOwners mc0) dtb__68)))
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (0))
  | _ -> failwith "DT: impossible branch"
))

# 325 "Vuna/Compiler/Driver/SplitGen.vuna"
let rec v_checkDataOwners = (fun (mc0 : Driver_dOwner.t_SplitMeta) (mc1 : Elab_dTypes.t_DtData B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__69, dtb__70) -> ((Base_dCommon.v_bind ((Driver_dOwner.v_splitDataOwnerOf mc0) dtb__69)) (fun (_u : string) -> ((v_checkDataOwners mc0) dtb__70)))
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (0))
  | _ -> failwith "DT: impossible branch"
))

# 330 "Vuna/Compiler/Driver/SplitGen.vuna"
let v_checkResolvedModules = (fun (meta : Driver_dOwner.t_SplitMeta) (modules : (string, Frontend_dAst.t_Decl B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (entryDecls : Frontend_dAst.t_Decl B_dData_dList.t_List) (runtime : Elab_dTypes.t_DtDef B_dData_dList.t_List) (datas : Elab_dTypes.t_DtData B_dData_dList.t_List) -> ((Base_dCommon.v_bind ((v_checkModuleDecls (meta).Driver_dOwner.f_SplitMeta_smKnownModules) modules)) (fun (_u : int) -> ((Base_dCommon.v_bind (v_checkEntryDecls entryDecls)) (fun (_u : int) -> ((Base_dCommon.v_bind ((v_checkDefOwners meta) runtime)) (fun (_u : int) -> ((v_checkDataOwners meta) datas))))))))

# 342 "Vuna/Compiler/Driver/SplitGen.vuna"
let v_splitStripPrefix = Base_dSource.v_stripPathPrefix

# 345 "Vuna/Compiler/Driver/SplitGen.vuna"
let v_splitStripRoots = Base_dSource.v_stripRootsPath

# 348 "Vuna/Compiler/Driver/SplitGen.vuna"
let v_splitStripDotSlash = Base_dSource.v_stripDotSlashPath

# 351 "Vuna/Compiler/Driver/SplitGen.vuna"
let v_splitLocPath = (fun (roots : string B_dData_dList.t_List) (contextDir : string) (path : string) -> (((Base_dSource.v_locationPathUnder roots) contextDir) path))

# 358 "Vuna/Compiler/Driver/SplitGen.vuna"
let rec v_helperInText = (fun (mc0 : string) (mc1 : string B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__71, dtb__72) -> (if ((B_dData_dString.v_contains mc0) dtb__71) then true else ((v_helperInText mc0) dtb__72))
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 362 "Vuna/Compiler/Driver/SplitGen.vuna"
let rec v_helperInTexts = (fun (mc0 : string B_dData_dList.t_List) (mc1 : string B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__73, dtb__74) -> (if ((v_helperInText dtb__73) mc1) then true else ((v_helperInTexts dtb__74) mc1))
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 368 "Vuna/Compiler/Driver/SplitGen.vuna"
let v_dtRuntimeFor = (fun (shared : Vuna_dIr_dModel.t_IrShared) (entryIsAction : bool) (keptTexts : string B_dData_dList.t_List) -> (((((((((Vuna_dTarget_dOcaml_dTerm.v_dtRuntimeWith (shared).Vuna_dIr_dModel.f_IrShared_irSharedUsesFloat) (shared).Vuna_dIr_dModel.f_IrShared_irSharedUsesTrace) (shared).Vuna_dIr_dModel.f_IrShared_irSharedUsesObs) (shared).Vuna_dIr_dModel.f_IrShared_irSharedUsesHost) (if (shared).Vuna_dIr_dModel.f_IrShared_irSharedUsesSched then true else entryIsAction)) (if (shared).Vuna_dIr_dModel.f_IrShared_irSharedUsesEff then true else entryIsAction)) ((v_helperInTexts Vuna_dTarget_dOcaml_dTerm.v_dtStrHelperNames) keptTexts)) ((v_helperInTexts Vuna_dTarget_dOcaml_dTerm.v_dtArrHelperNames) keptTexts)) ((v_helperInTexts Vuna_dTarget_dOcaml_dTerm.v_dtBufHelperNames) keptTexts)))

# 382 "Vuna/Compiler/Driver/SplitGen.vuna"
let v_entryIsActionM = (fun (mc0 : Vuna_dIr_dModel.t_IrEntry B_dData_dMaybe.t_Maybe) -> (match mc0 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__75) -> (Vuna_dIr_dModel.v_irEntryIsActionOf dtb__75)
  | B_dData_dMaybe.C_Maybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
))

# 530 "Vuna/Compiler/Driver/SplitGen.vuna"
let rec v_splitModuleFiles = (fun (dtb_u_u175 : t_SplitGenCtx) (dtb_u_u176 : (string, Frontend_dAst.t_Decl B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match dtb_u_u176 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u177, dtb_u_u178) -> (match dtb_u_u177 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u179; B_dData_dPair.f_Pair_second = dtb_u_u180 } -> (let dtb_u_u181 = (v_splitUnitOfModule dtb_u_u179) in (let dtb_u_u182 = ((v_datasOfUnit dtb_u_u175) dtb_u_u179) in (let dtb_u_u183 = ((v_defsOfUnit dtb_u_u175) dtb_u_u179) in (let dtb_u_u184 = { Vuna_dTarget_dOcaml_dDecl.f_QualCtx_qcUnit = dtb_u_u181; Vuna_dTarget_dOcaml_dDecl.f_QualCtx_qcDefs = (dtb_u_u175).f_SplitGenCtx_sgcDefUnitT; Vuna_dTarget_dOcaml_dDecl.f_QualCtx_qcDatas = (dtb_u_u175).f_SplitGenCtx_sgcDataUnitT } in (let dtb_u_u185 = ((Lowering_dEnv.v_lwEnvWithUnit dtb_u_u181) (dtb_u_u175).f_SplitGenCtx_sgcEnv) in (match (((Lowering_dProgram.v_lowerUnitCheckedFrom dtb_u_u185) dtb_u_u182) dtb_u_u183) with
  | Base_dDiag.C_Check_ErrC (dtb_u_u186) -> (let dtb_u_u188 = (Base_dDiag.C_Check_ErrC (dtb_u_u186)) in (Obj.repr ((fun (dtb_u_u189 : B_dEffect_dCore.t_EffUnit) -> dtb_u_u188))))
  | Base_dDiag.C_Check_OkC (dtb_u_u190) -> (let dtb_u_u191 = ((Vuna_dIr_dDirect.v_directUnit ((v_effPredFor (dtb_u_u175).f_SplitGenCtx_sgcEffArity) dtb_u_u183)) dtb_u_u190) in (match ((((Vuna_dTarget_dOcaml_dAssembly.v_genUnitPartsWith (dtb_u_u175).f_SplitGenCtx_sgcNormPath) dtb_u_u184) (Lowering_dEnv.v_lwEnvShared dtb_u_u185)) dtb_u_u191) with
  | Base_dDiag.C_Check_ErrC (dtb_u_u192) -> (let dtb_u_u194 = (Base_dDiag.C_Check_ErrC (dtb_u_u192)) in (Obj.repr ((fun (dtb_u_u195 : B_dEffect_dCore.t_EffUnit) -> dtb_u_u194))))
  | Base_dDiag.C_Check_OkC (dtb_u_u196) -> (Obj.repr ((fun (dtb_u_u201 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u204 = (((v_splitModuleFiles_u_udirect dtb_u_u175) dtb_u_u178) dtb_u_u201) in (match dtb_u_u204 with
  | Base_dDiag.C_Check_ErrC (dtb_u_u205) -> (let dtb_u_u207 = (Base_dDiag.C_Check_ErrC (dtb_u_u205)) in dtb_u_u207)
  | Base_dDiag.C_Check_OkC (dtb_u_u209) -> (match (((v_unitDepsOf (dtb_u_u175).f_SplitGenCtx_sgcOrdered) dtb_u_u181) (Vuna_dTarget_dOcaml_dAssembly.v_unitPartsDeps dtb_u_u196)) with
  | Base_dDiag.C_Check_ErrC (dtb_u_u210) -> (let dtb_u_u212 = (Base_dDiag.C_Check_ErrC (dtb_u_u210)) in dtb_u_u212)
  | Base_dDiag.C_Check_OkC (dtb_u_u214) -> (let dtb_u_u215 = { Driver_dSplit.f_SplitFile_splitName = (dtb_u_u181 ^ ".ml"); Driver_dSplit.f_SplitFile_splitText = ((Vuna_dTarget_dOcaml_dAssembly.v_genUnitText dtb_u_u196) ^ "\n"); Driver_dSplit.f_SplitFile_splitDeps = dtb_u_u214 } in (let dtb_u_u217 = (Base_dDiag.C_Check_OkC ((B_dData_dList.C_List__x58__x58_ (dtb_u_u215, dtb_u_u209)))) in dtb_u_u217))
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
  | B_dData_dList.C_List_Nil -> (let dtb_u_u220 = (Base_dDiag.C_Check_OkC (B_dData_dList.C_List_Nil)) in (Obj.repr ((fun (dtb_u_u221 : B_dEffect_dCore.t_EffUnit) -> dtb_u_u220))))
  | _ -> failwith "DT: impossible branch"
))
# 530 "Vuna/Compiler/Driver/SplitGen.vuna"
and v_splitModuleFiles_u_udirect = (fun (mc0 : t_SplitGenCtx) (mc1 : (string, Frontend_dAst.t_Decl B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) _u_ueffTok -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u177, dtb_u_u178) -> (match dtb_u_u177 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u179; B_dData_dPair.f_Pair_second = dtb_u_u180 } -> (let dtb_u_u181 = (v_splitUnitOfModule dtb_u_u179) in (let dtb_u_u182 = ((v_datasOfUnit mc0) dtb_u_u179) in (let dtb_u_u183 = ((v_defsOfUnit mc0) dtb_u_u179) in (let dtb_u_u184 = { Vuna_dTarget_dOcaml_dDecl.f_QualCtx_qcUnit = dtb_u_u181; Vuna_dTarget_dOcaml_dDecl.f_QualCtx_qcDefs = (mc0).f_SplitGenCtx_sgcDefUnitT; Vuna_dTarget_dOcaml_dDecl.f_QualCtx_qcDatas = (mc0).f_SplitGenCtx_sgcDataUnitT } in (let dtb_u_u185 = ((Lowering_dEnv.v_lwEnvWithUnit dtb_u_u181) (mc0).f_SplitGenCtx_sgcEnv) in (match (((Lowering_dProgram.v_lowerUnitCheckedFrom dtb_u_u185) dtb_u_u182) dtb_u_u183) with
  | Base_dDiag.C_Check_ErrC (dtb_u_u186) -> (let dtb_u_u188 = (Base_dDiag.C_Check_ErrC (dtb_u_u186)) in dtb_u_u188)
  | Base_dDiag.C_Check_OkC (dtb_u_u190) -> (let dtb_u_u191 = ((Vuna_dIr_dDirect.v_directUnit ((v_effPredFor (mc0).f_SplitGenCtx_sgcEffArity) dtb_u_u183)) dtb_u_u190) in (match ((((Vuna_dTarget_dOcaml_dAssembly.v_genUnitPartsWith (mc0).f_SplitGenCtx_sgcNormPath) dtb_u_u184) (Lowering_dEnv.v_lwEnvShared dtb_u_u185)) dtb_u_u191) with
  | Base_dDiag.C_Check_ErrC (dtb_u_u192) -> (let dtb_u_u194 = (Base_dDiag.C_Check_ErrC (dtb_u_u192)) in dtb_u_u194)
  | Base_dDiag.C_Check_OkC (dtb_u_u196) -> (let dtb_u_u204 = (((v_splitModuleFiles_u_udirect mc0) dtb_u_u178) _u_ueffTok) in (match dtb_u_u204 with
  | Base_dDiag.C_Check_ErrC (dtb_u_u205) -> (let dtb_u_u207 = (Base_dDiag.C_Check_ErrC (dtb_u_u205)) in dtb_u_u207)
  | Base_dDiag.C_Check_OkC (dtb_u_u209) -> (match (((v_unitDepsOf (mc0).f_SplitGenCtx_sgcOrdered) dtb_u_u181) (Vuna_dTarget_dOcaml_dAssembly.v_unitPartsDeps dtb_u_u196)) with
  | Base_dDiag.C_Check_ErrC (dtb_u_u210) -> (let dtb_u_u212 = (Base_dDiag.C_Check_ErrC (dtb_u_u210)) in dtb_u_u212)
  | Base_dDiag.C_Check_OkC (dtb_u_u214) -> (let dtb_u_u215 = { Driver_dSplit.f_SplitFile_splitName = (dtb_u_u181 ^ ".ml"); Driver_dSplit.f_SplitFile_splitText = ((Vuna_dTarget_dOcaml_dAssembly.v_genUnitText dtb_u_u196) ^ "\n"); Driver_dSplit.f_SplitFile_splitDeps = dtb_u_u214 } in (let dtb_u_u217 = (Base_dDiag.C_Check_OkC ((B_dData_dList.C_List__x58__x58_ (dtb_u_u215, dtb_u_u209)))) in dtb_u_u217))
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
  | B_dData_dList.C_List_Nil -> (let dtb_u_u220 = (Base_dDiag.C_Check_OkC (B_dData_dList.C_List_Nil)) in dtb_u_u220)
  | _ -> failwith "DT: impossible branch"
))

# 560 "Vuna/Compiler/Driver/SplitGen.vuna"
let v_splitMainFile = (fun (dtb_u_u223 : t_SplitGenCtx) (dtb_u_u224 : bool) -> (let dtb_u_u225 = (v_splitUnitOfModule Driver_dOwner.v_entryOwner) in (let dtb_u_u226 = ((v_defsOfUnit dtb_u_u223) Driver_dOwner.v_entryOwner) in (let dtb_u_u227 = ((v_datasOfUnit dtb_u_u223) Driver_dOwner.v_entryOwner) in (let dtb_u_u228 = { Vuna_dTarget_dOcaml_dDecl.f_QualCtx_qcUnit = dtb_u_u225; Vuna_dTarget_dOcaml_dDecl.f_QualCtx_qcDefs = (dtb_u_u223).f_SplitGenCtx_sgcDefUnitT; Vuna_dTarget_dOcaml_dDecl.f_QualCtx_qcDatas = (dtb_u_u223).f_SplitGenCtx_sgcDataUnitT } in (let dtb_u_u229 = ((Lowering_dEnv.v_lwEnvWithUnit dtb_u_u225) (dtb_u_u223).f_SplitGenCtx_sgcEnv) in (match (((Lowering_dProgram.v_lowerUnitCheckedFrom dtb_u_u229) dtb_u_u227) dtb_u_u226) with
  | Base_dDiag.C_Check_ErrC (dtb_u_u230) -> (let dtb_u_u232 = (Base_dDiag.C_Check_ErrC (dtb_u_u230)) in (Obj.repr ((fun (dtb_u_u233 : B_dEffect_dCore.t_EffUnit) -> dtb_u_u232))))
  | Base_dDiag.C_Check_OkC (dtb_u_u234) -> (let dtb_u_u235 = ((Vuna_dIr_dDirect.v_directUnit ((v_effPredFor (dtb_u_u223).f_SplitGenCtx_sgcEffArity) dtb_u_u226)) dtb_u_u234) in (match (Lowering_dEntry.v_lowerEntryOf (dtb_u_u223).f_SplitGenCtx_sgcAllDefs) with
  | Base_dDiag.C_Check_ErrC (dtb_u_u236) -> (let dtb_u_u238 = (Base_dDiag.C_Check_ErrC (dtb_u_u236)) in (Obj.repr ((fun (dtb_u_u239 : B_dEffect_dCore.t_EffUnit) -> dtb_u_u238))))
  | Base_dDiag.C_Check_OkC (dtb_u_u240) -> (match dtb_u_u240 with
  | B_dData_dMaybe.C_Maybe_Nothing -> (let dtb_u_u242 = (Base_dDiagnostics_dCg.v_cgErr0 Base_dDiagnostics_dCg.C_CgErr_NoMain) in (Obj.repr ((fun (dtb_u_u243 : B_dEffect_dCore.t_EffUnit) -> dtb_u_u242))))
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u244) -> (match ((((Vuna_dTarget_dOcaml_dAssembly.v_genUnitPartsWith (dtb_u_u223).f_SplitGenCtx_sgcNormPath) dtb_u_u228) (Lowering_dEnv.v_lwEnvShared dtb_u_u229)) dtb_u_u235) with
  | Base_dDiag.C_Check_ErrC (dtb_u_u245) -> (let dtb_u_u247 = (Base_dDiag.C_Check_ErrC (dtb_u_u245)) in (Obj.repr ((fun (dtb_u_u248 : B_dEffect_dCore.t_EffUnit) -> dtb_u_u247))))
  | Base_dDiag.C_Check_OkC (dtb_u_u249) -> (match (((Vuna_dTarget_dOcaml_dTerm.v_genEntryHook (((Vuna_dTarget_dOcaml_dTerm.v_mkGenStWith (dtb_u_u223).f_SplitGenCtx_sgcNormPath) dtb_u_u228) (Lowering_dEnv.v_lwEnvShared dtb_u_u229))) dtb_u_u244) dtb_u_u224) with
  | Base_dDiag.C_Check_ErrC (dtb_u_u250) -> (let dtb_u_u252 = (Base_dDiag.C_Check_ErrC (dtb_u_u250)) in (Obj.repr ((fun (dtb_u_u253 : B_dEffect_dCore.t_EffUnit) -> dtb_u_u252))))
  | Base_dDiag.C_Check_OkC (dtb_u_u254) -> (match (((v_unitDepsOf (dtb_u_u223).f_SplitGenCtx_sgcOrdered) dtb_u_u225) ((B_dData_dList.v_append ((B_dData_dList.v_append (Vuna_dTarget_dOcaml_dAssembly.v_unitPartsDeps dtb_u_u249)) (B_dData_dPair.v_secondOf dtb_u_u254))) (B_dData_dList.C_List__x58__x58_ (Vuna_dTarget_dOcaml_dAssembly.v_deflocsUnit, B_dData_dList.C_List_Nil)))) with
  | Base_dDiag.C_Check_ErrC (dtb_u_u255) -> (let dtb_u_u257 = (Base_dDiag.C_Check_ErrC (dtb_u_u255)) in (Obj.repr ((fun (dtb_u_u258 : B_dEffect_dCore.t_EffUnit) -> dtb_u_u257))))
  | Base_dDiag.C_Check_OkC (dtb_u_u259) -> (let dtb_u_u260 = { Driver_dSplit.f_SplitFile_splitName = "Main.ml"; Driver_dSplit.f_SplitFile_splitText = (String.concat "" [v_mainInitPrologue; (Vuna_dTarget_dOcaml_dAssembly.v_genUnitText dtb_u_u249); (B_dData_dPair.v_firstOf dtb_u_u254)]); Driver_dSplit.f_SplitFile_splitDeps = dtb_u_u259 } in (let dtb_u_u262 = (Base_dDiag.C_Check_OkC (dtb_u_u260)) in (Obj.repr ((fun (dtb_u_u263 : B_dEffect_dCore.t_EffUnit) -> dtb_u_u262)))))
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

# 560 "Vuna/Compiler/Driver/SplitGen.vuna"
let v_splitMainFile_u_udirect = (fun (ctx : t_SplitGenCtx) (printResult : bool) _u_ueffTok -> (let dtb_u_u225 = (v_splitUnitOfModule Driver_dOwner.v_entryOwner) in (let dtb_u_u226 = ((v_defsOfUnit ctx) Driver_dOwner.v_entryOwner) in (let dtb_u_u227 = ((v_datasOfUnit ctx) Driver_dOwner.v_entryOwner) in (let dtb_u_u228 = { Vuna_dTarget_dOcaml_dDecl.f_QualCtx_qcUnit = dtb_u_u225; Vuna_dTarget_dOcaml_dDecl.f_QualCtx_qcDefs = (ctx).f_SplitGenCtx_sgcDefUnitT; Vuna_dTarget_dOcaml_dDecl.f_QualCtx_qcDatas = (ctx).f_SplitGenCtx_sgcDataUnitT } in (let dtb_u_u229 = ((Lowering_dEnv.v_lwEnvWithUnit dtb_u_u225) (ctx).f_SplitGenCtx_sgcEnv) in (match (((Lowering_dProgram.v_lowerUnitCheckedFrom dtb_u_u229) dtb_u_u227) dtb_u_u226) with
  | Base_dDiag.C_Check_ErrC (dtb_u_u230) -> (let dtb_u_u232 = (Base_dDiag.C_Check_ErrC (dtb_u_u230)) in dtb_u_u232)
  | Base_dDiag.C_Check_OkC (dtb_u_u234) -> (let dtb_u_u235 = ((Vuna_dIr_dDirect.v_directUnit ((v_effPredFor (ctx).f_SplitGenCtx_sgcEffArity) dtb_u_u226)) dtb_u_u234) in (match (Lowering_dEntry.v_lowerEntryOf (ctx).f_SplitGenCtx_sgcAllDefs) with
  | Base_dDiag.C_Check_ErrC (dtb_u_u236) -> (let dtb_u_u238 = (Base_dDiag.C_Check_ErrC (dtb_u_u236)) in dtb_u_u238)
  | Base_dDiag.C_Check_OkC (dtb_u_u240) -> (match dtb_u_u240 with
  | B_dData_dMaybe.C_Maybe_Nothing -> (let dtb_u_u242 = (Base_dDiagnostics_dCg.v_cgErr0 Base_dDiagnostics_dCg.C_CgErr_NoMain) in dtb_u_u242)
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u244) -> (match ((((Vuna_dTarget_dOcaml_dAssembly.v_genUnitPartsWith (ctx).f_SplitGenCtx_sgcNormPath) dtb_u_u228) (Lowering_dEnv.v_lwEnvShared dtb_u_u229)) dtb_u_u235) with
  | Base_dDiag.C_Check_ErrC (dtb_u_u245) -> (let dtb_u_u247 = (Base_dDiag.C_Check_ErrC (dtb_u_u245)) in dtb_u_u247)
  | Base_dDiag.C_Check_OkC (dtb_u_u249) -> (match (((Vuna_dTarget_dOcaml_dTerm.v_genEntryHook (((Vuna_dTarget_dOcaml_dTerm.v_mkGenStWith (ctx).f_SplitGenCtx_sgcNormPath) dtb_u_u228) (Lowering_dEnv.v_lwEnvShared dtb_u_u229))) dtb_u_u244) printResult) with
  | Base_dDiag.C_Check_ErrC (dtb_u_u250) -> (let dtb_u_u252 = (Base_dDiag.C_Check_ErrC (dtb_u_u250)) in dtb_u_u252)
  | Base_dDiag.C_Check_OkC (dtb_u_u254) -> (match (((v_unitDepsOf (ctx).f_SplitGenCtx_sgcOrdered) dtb_u_u225) ((B_dData_dList.v_append ((B_dData_dList.v_append (Vuna_dTarget_dOcaml_dAssembly.v_unitPartsDeps dtb_u_u249)) (B_dData_dPair.v_secondOf dtb_u_u254))) (B_dData_dList.C_List__x58__x58_ (Vuna_dTarget_dOcaml_dAssembly.v_deflocsUnit, B_dData_dList.C_List_Nil)))) with
  | Base_dDiag.C_Check_ErrC (dtb_u_u255) -> (let dtb_u_u257 = (Base_dDiag.C_Check_ErrC (dtb_u_u255)) in dtb_u_u257)
  | Base_dDiag.C_Check_OkC (dtb_u_u259) -> (let dtb_u_u260 = { Driver_dSplit.f_SplitFile_splitName = "Main.ml"; Driver_dSplit.f_SplitFile_splitText = (String.concat "" [v_mainInitPrologue; (Vuna_dTarget_dOcaml_dAssembly.v_genUnitText dtb_u_u249); (B_dData_dPair.v_firstOf dtb_u_u254)]); Driver_dSplit.f_SplitFile_splitDeps = dtb_u_u259 } in (let dtb_u_u262 = (Base_dDiag.C_Check_OkC (dtb_u_u260)) in dtb_u_u262))
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

# 471 "Vuna/Compiler/Driver/SplitGen.vuna"
let v_splitWithOwners = (fun (dtb_u_u265 : Lowering_dEnv.t_LwEnv) (dtb_u_u266 : (string, Frontend_dAst.t_Decl B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u267 : bool) (dtb_u_u268 : Elab_dTypes.t_DtData B_dData_dList.t_List) (dtb_u_u269 : Elab_dTypes.t_DtDef B_dData_dList.t_List) (dtb_u_u270 : (string, string) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u271 : (string, string) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u272 : (string) -> string) (dtb_u_u273 : Vuna_dIr_dModel.t_IrShared) (dtb_u_u274 : bool) (dtb_u_u275 : (string, (string, int) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (let dtb_u_u276 = ((v_effArityTblOf dtb_u_u265) dtb_u_u269) in (let dtb_u_u277 = ((B_dData_dList.v_append dtb_u_u270) ((B_dData_dList.v_concatMap (v_directPairOf dtb_u_u276)) dtb_u_u270)) in (let dtb_u_u278 = (v_ownerTblOf dtb_u_u277) in (let dtb_u_u279 = (v_ownerTblOf dtb_u_u271) in (let dtb_u_u280 = (Vuna_dTarget_dOcaml_dDecl.v_unitTblOf (v_mapToUnit dtb_u_u277)) in (let dtb_u_u281 = (Vuna_dTarget_dOcaml_dDecl.v_unitTblOf (v_mapToUnit dtb_u_u271)) in (let dtb_u_u282 = ((B_dData_dList.v_append ((B_dData_dList.v_append (B_dData_dList.C_List__x58__x58_ (Vuna_dTarget_dOcaml_dAssembly.v_runtimeUnit, (B_dData_dList.C_List__x58__x58_ (Vuna_dTarget_dOcaml_dAssembly.v_deflocsUnit, B_dData_dList.C_List_Nil))))) ((B_dData_dList.v_map (fun (dtb_u_u326 : (string, Frontend_dAst.t_Decl B_dData_dList.t_List) B_dData_dPair.t_Pair) -> (v_splitUnitOfModule (B_dData_dPair.v_firstOf (Obj.magic dtb_u_u326))))) dtb_u_u266))) (B_dData_dList.C_List__x58__x58_ ((v_splitUnitOfModule Driver_dOwner.v_entryOwner), B_dData_dList.C_List_Nil))) in (let dtb_u_u283 = { f_SplitGenCtx_sgcEnv = dtb_u_u265; f_SplitGenCtx_sgcAllDefs = dtb_u_u269; f_SplitGenCtx_sgcDefOwnerT = dtb_u_u278; f_SplitGenCtx_sgcDataOwnerT = dtb_u_u279; f_SplitGenCtx_sgcDefUnitT = dtb_u_u280; f_SplitGenCtx_sgcDataUnitT = dtb_u_u281; f_SplitGenCtx_sgcOrdered = dtb_u_u282; f_SplitGenCtx_sgcDefBuckets = ((v_defBucketsOf dtb_u_u278) dtb_u_u269); f_SplitGenCtx_sgcDataBuckets = ((v_dataBucketsOf dtb_u_u279) dtb_u_u268); f_SplitGenCtx_sgcNormPath = dtb_u_u272; f_SplitGenCtx_sgcEffArity = dtb_u_u276 } in (Obj.repr ((fun (dtb_u_u288 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u291 = (((v_splitModuleFiles_u_udirect dtb_u_u283) dtb_u_u266) dtb_u_u288) in (match dtb_u_u291 with
  | Base_dDiag.C_Check_ErrC (dtb_u_u292) -> (let dtb_u_u294 = (Base_dDiag.C_Check_ErrC (dtb_u_u292)) in dtb_u_u294)
  | Base_dDiag.C_Check_OkC (dtb_u_u296) -> (let dtb_u_u304 = (((v_splitMainFile_u_udirect dtb_u_u283) dtb_u_u267) dtb_u_u288) in (let dtb_u_u306 = (match dtb_u_u304 with
  | Base_dDiag.C_Check_ErrC (dtb_u_u308) -> (Base_dDiag.C_Check_ErrC (dtb_u_u308))
  | Base_dDiag.C_Check_OkC (dtb_u_u309) -> (let dtb_u_u310 = { Driver_dSplit.f_SplitFile_splitName = (Vuna_dTarget_dOcaml_dAssembly.v_runtimeUnit ^ ".ml"); Driver_dSplit.f_SplitFile_splitText = ""; Driver_dSplit.f_SplitFile_splitDeps = B_dData_dList.C_List_Nil } in (let dtb_u_u311 = { Driver_dSplit.f_SplitFile_splitName = (Vuna_dTarget_dOcaml_dAssembly.v_deflocsUnit ^ ".ml"); Driver_dSplit.f_SplitFile_splitText = ""; Driver_dSplit.f_SplitFile_splitDeps = (B_dData_dList.C_List__x58__x58_ (Vuna_dTarget_dOcaml_dAssembly.v_runtimeUnit, B_dData_dList.C_List_Nil)) } in (let dtb_u_u312 = ((Driver_dSplit.v_pruneSplitFiles (B_dData_dList.C_List__x58__x58_ (Vuna_dTarget_dOcaml_dAssembly.v_runtimeUnit, (B_dData_dList.C_List__x58__x58_ (Vuna_dTarget_dOcaml_dAssembly.v_deflocsUnit, (B_dData_dList.C_List__x58__x58_ ((Driver_dSplit.v_splitUnitOfFile dtb_u_u309), B_dData_dList.C_List_Nil))))))) (B_dData_dList.C_List__x58__x58_ (dtb_u_u310, (B_dData_dList.C_List__x58__x58_ (dtb_u_u311, ((B_dData_dList.v_append dtb_u_u296) (B_dData_dList.C_List__x58__x58_ (dtb_u_u309, B_dData_dList.C_List_Nil)))))))) in (let dtb_u_u313 = ((B_dData_dList.v_map Driver_dSplit.v_splitUnitOfFile) dtb_u_u312) in (let dtb_u_u314 = ((B_dData_dList.v_map Driver_dSplit.v_splitText) ((B_dData_dList.v_filter (fun (dtb_u_u325 : Driver_dSplit.t_SplitFile) -> (B_dData_dBool.v_not (if ((Driver_dSplit.v_splitUnitOfFile dtb_u_u325) = Vuna_dTarget_dOcaml_dAssembly.v_runtimeUnit) then true else ((Driver_dSplit.v_splitUnitOfFile dtb_u_u325) = Vuna_dTarget_dOcaml_dAssembly.v_deflocsUnit))))) dtb_u_u312)) in (let dtb_u_u315 = (((v_dtRuntimeFor dtb_u_u273) dtb_u_u274) dtb_u_u314) in (let dtb_u_u316 = ((B_dData_dList.v_filter (fun (dtb_u_u324 : (string, (string, int) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> ((B_dData_dList.v_memName (v_unitOfLocName (B_dData_dPair.v_firstOf (Obj.magic dtb_u_u324)))) dtb_u_u313))) dtb_u_u275) in (let dtb_u_u317 = (Vuna_dTarget_dOcaml_dTerm.v_dtDefLocsUnit (((Vuna_dTarget_dOcaml_dTerm.v_dtDefLocTable dtb_u_u272) v_unitOfLocName) dtb_u_u316)) in (let dtb_u_u318 = ((B_dData_dList.v_map (fun (dtb_u_u323 : Driver_dSplit.t_SplitFile) -> (if ((Driver_dSplit.v_splitUnitOfFile dtb_u_u323) = Vuna_dTarget_dOcaml_dAssembly.v_runtimeUnit) then { Driver_dSplit.f_SplitFile_splitName = (Driver_dSplit.v_splitName dtb_u_u323); Driver_dSplit.f_SplitFile_splitText = dtb_u_u315; Driver_dSplit.f_SplitFile_splitDeps = (Driver_dSplit.v_splitDeps dtb_u_u323) } else (if ((Driver_dSplit.v_splitUnitOfFile dtb_u_u323) = Vuna_dTarget_dOcaml_dAssembly.v_deflocsUnit) then { Driver_dSplit.f_SplitFile_splitName = (Driver_dSplit.v_splitName dtb_u_u323); Driver_dSplit.f_SplitFile_splitText = dtb_u_u317; Driver_dSplit.f_SplitFile_splitDeps = (Driver_dSplit.v_splitDeps dtb_u_u323) } else dtb_u_u323)))) dtb_u_u312) in (match (v_checkSplitNames dtb_u_u318) with
  | Base_dDiag.C_Check_ErrC (dtb_u_u319) -> (Base_dDiag.C_Check_ErrC (dtb_u_u319))
  | Base_dDiag.C_Check_OkC (dtb_u_u320) -> (match (v_checkSplitAcyclic dtb_u_u318) with
  | Base_dDiag.C_Check_ErrC (dtb_u_u321) -> (Base_dDiag.C_Check_ErrC (dtb_u_u321))
  | Base_dDiag.C_Check_OkC (dtb_u_u322) -> (Base_dDiag.C_Check_OkC (dtb_u_u318))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))))))))
  | _ -> failwith "DT: impossible branch"
) in dtb_u_u306))
  | _ -> failwith "DT: impossible branch"
))))))))))))))

# 471 "Vuna/Compiler/Driver/SplitGen.vuna"
let v_splitWithOwners_u_udirect = (fun (env : Lowering_dEnv.t_LwEnv) (modules : (string, Frontend_dAst.t_Decl B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (printResult : bool) (allDatas : Elab_dTypes.t_DtData B_dData_dList.t_List) (allDefs : Elab_dTypes.t_DtDef B_dData_dList.t_List) (defPairs : (string, string) B_dData_dPair.t_Pair B_dData_dList.t_List) (dataPairs : (string, string) B_dData_dPair.t_Pair B_dData_dList.t_List) (normPath : (string) -> string) (shared : Vuna_dIr_dModel.t_IrShared) (entryIsAction : bool) (locRows : (string, (string, int) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) _u_ueffTok -> (let dtb_u_u276 = ((v_effArityTblOf env) allDefs) in (let dtb_u_u277 = ((B_dData_dList.v_append defPairs) ((B_dData_dList.v_concatMap (v_directPairOf dtb_u_u276)) defPairs)) in (let dtb_u_u278 = (v_ownerTblOf dtb_u_u277) in (let dtb_u_u279 = (v_ownerTblOf dataPairs) in (let dtb_u_u280 = (Vuna_dTarget_dOcaml_dDecl.v_unitTblOf (v_mapToUnit dtb_u_u277)) in (let dtb_u_u281 = (Vuna_dTarget_dOcaml_dDecl.v_unitTblOf (v_mapToUnit dataPairs)) in (let dtb_u_u282 = ((B_dData_dList.v_append ((B_dData_dList.v_append (B_dData_dList.C_List__x58__x58_ (Vuna_dTarget_dOcaml_dAssembly.v_runtimeUnit, (B_dData_dList.C_List__x58__x58_ (Vuna_dTarget_dOcaml_dAssembly.v_deflocsUnit, B_dData_dList.C_List_Nil))))) ((B_dData_dList.v_map (fun (dtb_u_u326 : (string, Frontend_dAst.t_Decl B_dData_dList.t_List) B_dData_dPair.t_Pair) -> (v_splitUnitOfModule (B_dData_dPair.v_firstOf (Obj.magic dtb_u_u326))))) modules))) (B_dData_dList.C_List__x58__x58_ ((v_splitUnitOfModule Driver_dOwner.v_entryOwner), B_dData_dList.C_List_Nil))) in (let dtb_u_u283 = { f_SplitGenCtx_sgcEnv = env; f_SplitGenCtx_sgcAllDefs = allDefs; f_SplitGenCtx_sgcDefOwnerT = dtb_u_u278; f_SplitGenCtx_sgcDataOwnerT = dtb_u_u279; f_SplitGenCtx_sgcDefUnitT = dtb_u_u280; f_SplitGenCtx_sgcDataUnitT = dtb_u_u281; f_SplitGenCtx_sgcOrdered = dtb_u_u282; f_SplitGenCtx_sgcDefBuckets = ((v_defBucketsOf dtb_u_u278) allDefs); f_SplitGenCtx_sgcDataBuckets = ((v_dataBucketsOf dtb_u_u279) allDatas); f_SplitGenCtx_sgcNormPath = normPath; f_SplitGenCtx_sgcEffArity = dtb_u_u276 } in (let dtb_u_u291 = (((v_splitModuleFiles_u_udirect dtb_u_u283) modules) _u_ueffTok) in (match dtb_u_u291 with
  | Base_dDiag.C_Check_ErrC (dtb_u_u292) -> (let dtb_u_u294 = (Base_dDiag.C_Check_ErrC (dtb_u_u292)) in dtb_u_u294)
  | Base_dDiag.C_Check_OkC (dtb_u_u296) -> (let dtb_u_u304 = (((v_splitMainFile_u_udirect dtb_u_u283) printResult) _u_ueffTok) in (let dtb_u_u306 = (match dtb_u_u304 with
  | Base_dDiag.C_Check_ErrC (dtb_u_u308) -> (Base_dDiag.C_Check_ErrC (dtb_u_u308))
  | Base_dDiag.C_Check_OkC (dtb_u_u309) -> (let dtb_u_u310 = { Driver_dSplit.f_SplitFile_splitName = (Vuna_dTarget_dOcaml_dAssembly.v_runtimeUnit ^ ".ml"); Driver_dSplit.f_SplitFile_splitText = ""; Driver_dSplit.f_SplitFile_splitDeps = B_dData_dList.C_List_Nil } in (let dtb_u_u311 = { Driver_dSplit.f_SplitFile_splitName = (Vuna_dTarget_dOcaml_dAssembly.v_deflocsUnit ^ ".ml"); Driver_dSplit.f_SplitFile_splitText = ""; Driver_dSplit.f_SplitFile_splitDeps = (B_dData_dList.C_List__x58__x58_ (Vuna_dTarget_dOcaml_dAssembly.v_runtimeUnit, B_dData_dList.C_List_Nil)) } in (let dtb_u_u312 = ((Driver_dSplit.v_pruneSplitFiles (B_dData_dList.C_List__x58__x58_ (Vuna_dTarget_dOcaml_dAssembly.v_runtimeUnit, (B_dData_dList.C_List__x58__x58_ (Vuna_dTarget_dOcaml_dAssembly.v_deflocsUnit, (B_dData_dList.C_List__x58__x58_ ((Driver_dSplit.v_splitUnitOfFile dtb_u_u309), B_dData_dList.C_List_Nil))))))) (B_dData_dList.C_List__x58__x58_ (dtb_u_u310, (B_dData_dList.C_List__x58__x58_ (dtb_u_u311, ((B_dData_dList.v_append dtb_u_u296) (B_dData_dList.C_List__x58__x58_ (dtb_u_u309, B_dData_dList.C_List_Nil)))))))) in (let dtb_u_u313 = ((B_dData_dList.v_map Driver_dSplit.v_splitUnitOfFile) dtb_u_u312) in (let dtb_u_u314 = ((B_dData_dList.v_map Driver_dSplit.v_splitText) ((B_dData_dList.v_filter (fun (dtb_u_u325 : Driver_dSplit.t_SplitFile) -> (B_dData_dBool.v_not (if ((Driver_dSplit.v_splitUnitOfFile dtb_u_u325) = Vuna_dTarget_dOcaml_dAssembly.v_runtimeUnit) then true else ((Driver_dSplit.v_splitUnitOfFile dtb_u_u325) = Vuna_dTarget_dOcaml_dAssembly.v_deflocsUnit))))) dtb_u_u312)) in (let dtb_u_u315 = (((v_dtRuntimeFor shared) entryIsAction) dtb_u_u314) in (let dtb_u_u316 = ((B_dData_dList.v_filter (fun (dtb_u_u324 : (string, (string, int) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> ((B_dData_dList.v_memName (v_unitOfLocName (B_dData_dPair.v_firstOf (Obj.magic dtb_u_u324)))) dtb_u_u313))) locRows) in (let dtb_u_u317 = (Vuna_dTarget_dOcaml_dTerm.v_dtDefLocsUnit (((Vuna_dTarget_dOcaml_dTerm.v_dtDefLocTable normPath) v_unitOfLocName) dtb_u_u316)) in (let dtb_u_u318 = ((B_dData_dList.v_map (fun (dtb_u_u323 : Driver_dSplit.t_SplitFile) -> (if ((Driver_dSplit.v_splitUnitOfFile dtb_u_u323) = Vuna_dTarget_dOcaml_dAssembly.v_runtimeUnit) then { Driver_dSplit.f_SplitFile_splitName = (Driver_dSplit.v_splitName dtb_u_u323); Driver_dSplit.f_SplitFile_splitText = dtb_u_u315; Driver_dSplit.f_SplitFile_splitDeps = (Driver_dSplit.v_splitDeps dtb_u_u323) } else (if ((Driver_dSplit.v_splitUnitOfFile dtb_u_u323) = Vuna_dTarget_dOcaml_dAssembly.v_deflocsUnit) then { Driver_dSplit.f_SplitFile_splitName = (Driver_dSplit.v_splitName dtb_u_u323); Driver_dSplit.f_SplitFile_splitText = dtb_u_u317; Driver_dSplit.f_SplitFile_splitDeps = (Driver_dSplit.v_splitDeps dtb_u_u323) } else dtb_u_u323)))) dtb_u_u312) in (match (v_checkSplitNames dtb_u_u318) with
  | Base_dDiag.C_Check_ErrC (dtb_u_u319) -> (Base_dDiag.C_Check_ErrC (dtb_u_u319))
  | Base_dDiag.C_Check_OkC (dtb_u_u320) -> (match (v_checkSplitAcyclic dtb_u_u318) with
  | Base_dDiag.C_Check_ErrC (dtb_u_u321) -> (Base_dDiag.C_Check_ErrC (dtb_u_u321))
  | Base_dDiag.C_Check_OkC (dtb_u_u322) -> (Base_dDiag.C_Check_OkC (dtb_u_u318))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))))))))
  | _ -> failwith "DT: impossible branch"
) in dtb_u_u306))
  | _ -> failwith "DT: impossible branch"
)))))))))))

# 447 "Vuna/Compiler/Driver/SplitGen.vuna"
let v_splitProgramChecked = (fun (dtb_u_u328 : Lowering_dEnv.t_LwEnv) (dtb_u_u329 : (string, Frontend_dAst.t_Decl B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u330 : Frontend_dAst.t_Decl B_dData_dList.t_List) (dtb_u_u331 : bool) (dtb_u_u332 : Elab_dTypes.t_DtDef B_dData_dList.t_List) (dtb_u_u333 : Elab_dTypes.t_DtData B_dData_dList.t_List) (dtb_u_u334 : Driver_dOwner.t_SplitMeta) (dtb_u_u335 : (string) -> string) (dtb_u_u336 : Vuna_dIr_dModel.t_IrShared) (dtb_u_u337 : bool) (dtb_u_u338 : (string, (string, int) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match (((((v_checkResolvedModules dtb_u_u334) dtb_u_u329) dtb_u_u330) dtb_u_u332) dtb_u_u333) with
  | Base_dDiag.C_Check_ErrC (dtb_u_u339) -> (let dtb_u_u341 = (Base_dDiag.C_Check_ErrC (dtb_u_u339)) in (Obj.repr ((fun (dtb_u_u342 : B_dEffect_dCore.t_EffUnit) -> dtb_u_u341))))
  | Base_dDiag.C_Check_OkC (dtb_u_u343) -> (match ((Driver_dOwner.v_nameOwnerPairsOfDefs dtb_u_u334) dtb_u_u332) with
  | Base_dDiag.C_Check_ErrC (dtb_u_u344) -> (let dtb_u_u346 = (Base_dDiag.C_Check_ErrC (dtb_u_u344)) in (Obj.repr ((fun (dtb_u_u347 : B_dEffect_dCore.t_EffUnit) -> dtb_u_u346))))
  | Base_dDiag.C_Check_OkC (dtb_u_u348) -> (match ((Driver_dOwner.v_nameOwnerPairsOfDatas dtb_u_u334) dtb_u_u333) with
  | Base_dDiag.C_Check_ErrC (dtb_u_u349) -> (let dtb_u_u351 = (Base_dDiag.C_Check_ErrC (dtb_u_u349)) in (Obj.repr ((fun (dtb_u_u352 : B_dEffect_dCore.t_EffUnit) -> dtb_u_u351))))
  | Base_dDiag.C_Check_OkC (dtb_u_u353) -> (((((((((((v_splitWithOwners dtb_u_u328) dtb_u_u329) dtb_u_u331) dtb_u_u333) dtb_u_u332) dtb_u_u348) dtb_u_u353) dtb_u_u335) dtb_u_u336) dtb_u_u337) dtb_u_u338)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 447 "Vuna/Compiler/Driver/SplitGen.vuna"
let v_splitProgramChecked_u_udirect = (fun (env : Lowering_dEnv.t_LwEnv) (modules : (string, Frontend_dAst.t_Decl B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (entryDecls : Frontend_dAst.t_Decl B_dData_dList.t_List) (printResult : bool) (runtimeDefs : Elab_dTypes.t_DtDef B_dData_dList.t_List) (allDatas : Elab_dTypes.t_DtData B_dData_dList.t_List) (meta : Driver_dOwner.t_SplitMeta) (normPath : (string) -> string) (shared : Vuna_dIr_dModel.t_IrShared) (entryIsAction : bool) (locRows : (string, (string, int) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) _u_ueffTok -> (match (((((v_checkResolvedModules meta) modules) entryDecls) runtimeDefs) allDatas) with
  | Base_dDiag.C_Check_ErrC (dtb_u_u339) -> (let dtb_u_u341 = (Base_dDiag.C_Check_ErrC (dtb_u_u339)) in dtb_u_u341)
  | Base_dDiag.C_Check_OkC (dtb_u_u343) -> (match ((Driver_dOwner.v_nameOwnerPairsOfDefs meta) runtimeDefs) with
  | Base_dDiag.C_Check_ErrC (dtb_u_u344) -> (let dtb_u_u346 = (Base_dDiag.C_Check_ErrC (dtb_u_u344)) in dtb_u_u346)
  | Base_dDiag.C_Check_OkC (dtb_u_u348) -> (match ((Driver_dOwner.v_nameOwnerPairsOfDatas meta) allDatas) with
  | Base_dDiag.C_Check_ErrC (dtb_u_u349) -> (let dtb_u_u351 = (Base_dDiag.C_Check_ErrC (dtb_u_u349)) in dtb_u_u351)
  | Base_dDiag.C_Check_OkC (dtb_u_u353) -> ((Obj.magic (((((((((((v_splitWithOwners env) modules) printResult) allDatas) runtimeDefs) dtb_u_u348) dtb_u_u353) normPath) shared) entryIsAction) locRows)) _u_ueffTok)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 429 "Vuna/Compiler/Driver/SplitGen.vuna"
let v_splitProgramFiles = (fun (dtb_u_u355 : Lowering_dEnv.t_LwEnv) (dtb_u_u356 : (string, Frontend_dAst.t_Decl B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u357 : Frontend_dAst.t_Decl B_dData_dList.t_List) (dtb_u_u358 : bool) (dtb_u_u359 : Elab_dTypes.t_DtDef B_dData_dList.t_List) (dtb_u_u360 : Elab_dTypes.t_DtData B_dData_dList.t_List) (dtb_u_u361 : Driver_dOwner.t_SplitMeta) (dtb_u_u362 : (string) -> string) (dtb_u_u363 : Vuna_dIr_dModel.t_IrShared) (dtb_u_u364 : bool) (dtb_u_u365 : (string, (string, int) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match (Lowering_dProgram.v_checkProgramOf dtb_u_u355) with
  | Base_dDiag.C_Check_ErrC (dtb_u_u366) -> (let dtb_u_u368 = (Base_dDiag.C_Check_ErrC (dtb_u_u366)) in (Obj.repr ((fun (dtb_u_u369 : B_dEffect_dCore.t_EffUnit) -> dtb_u_u368))))
  | Base_dDiag.C_Check_OkC (dtb_u_u370) -> (((((((((((v_splitProgramChecked dtb_u_u355) dtb_u_u356) dtb_u_u357) dtb_u_u358) dtb_u_u359) dtb_u_u360) dtb_u_u361) dtb_u_u362) dtb_u_u363) dtb_u_u364) dtb_u_u365)
  | _ -> failwith "DT: impossible branch"
))

# 429 "Vuna/Compiler/Driver/SplitGen.vuna"
let v_splitProgramFiles_u_udirect = (fun (env : Lowering_dEnv.t_LwEnv) (modules : (string, Frontend_dAst.t_Decl B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (entryDecls : Frontend_dAst.t_Decl B_dData_dList.t_List) (printResult : bool) (runtimeDefs : Elab_dTypes.t_DtDef B_dData_dList.t_List) (allDatas : Elab_dTypes.t_DtData B_dData_dList.t_List) (meta : Driver_dOwner.t_SplitMeta) (normPath : (string) -> string) (shared : Vuna_dIr_dModel.t_IrShared) (entryIsAction : bool) (locRows : (string, (string, int) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) _u_ueffTok -> (match (Lowering_dProgram.v_checkProgramOf env) with
  | Base_dDiag.C_Check_ErrC (dtb_u_u366) -> (let dtb_u_u368 = (Base_dDiag.C_Check_ErrC (dtb_u_u366)) in dtb_u_u368)
  | Base_dDiag.C_Check_OkC (dtb_u_u370) -> ((Obj.magic (((((((((((v_splitProgramChecked env) modules) entryDecls) printResult) runtimeDefs) allDatas) meta) normPath) shared) entryIsAction) locRows)) _u_ueffTok)
  | _ -> failwith "DT: impossible branch"
))

# 386 "Vuna/Compiler/Driver/SplitGen.vuna"
let v_generateDtSplitProgram = (fun (dtb_u_u372 : (string, Frontend_dAst.t_Decl B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u373 : Frontend_dAst.t_Decl B_dData_dList.t_List) (dtb_u_u374 : Elab_dTypes.t_DtProgram) (dtb_u_u375 : bool) (dtb_u_u376 : string B_dData_dList.t_List) (dtb_u_u377 : string) (dtb_u_u378 : (string, (string, int) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match (Lowering_dEnv.v_eraseDefs (Elab_dTypes.v_dtProgDefs dtb_u_u374)) with
  | Base_dDiag.C_Check_ErrC (dtb_u_u379) -> (let dtb_u_u381 = (Base_dDiag.C_Check_ErrC (dtb_u_u379)) in (Obj.repr ((fun (dtb_u_u382 : B_dEffect_dCore.t_EffUnit) -> dtb_u_u381))))
  | Base_dDiag.C_Check_OkC (dtb_u_u383) -> (match (Lowering_dEntry.v_lowerEntryOf dtb_u_u383) with
  | Base_dDiag.C_Check_ErrC (dtb_u_u384) -> (let dtb_u_u386 = (Base_dDiag.C_Check_ErrC (dtb_u_u384)) in (Obj.repr ((fun (dtb_u_u387 : B_dEffect_dCore.t_EffUnit) -> dtb_u_u386))))
  | Base_dDiag.C_Check_OkC (dtb_u_u388) -> (let dtb_u_u389 = (v_entryIsActionM dtb_u_u388) in (let dtb_u_u390 = (if ((dtp_log_on 2) "Vuna.Compiler.Driver.SplitGen") then (((dtp_log_emit 2) "Vuna.Compiler.Driver.SplitGen") "cg-splitstart") else 0) in (let dtb_u_u391 = (Lowering_dEnv.v_rtDatasOf (Elab_dTypes.v_dtProgDatas dtb_u_u374)) in (let dtb_u_u392 = (Lowering_dProgram.v_partitionRuntimeDefs dtb_u_u383) in (let dtb_u_u393 = (((((Lowering_dEnv.v_mkLwEnvFromErased (Elab_dTypes.v_dtProgDatas dtb_u_u374)) dtb_u_u383) (Elab_dTypes.v_dtProgDefs dtb_u_u374)) (Elab_dTypes.v_dtProgGlobals dtb_u_u374)) (v_splitUnitOfModule Driver_dOwner.v_entryOwner)) in (let dtb_u_u394 = (Lowering_dEnv.v_lwEnvShared dtb_u_u393) in (let dtb_u_u395 = ((Driver_dOwner.v_splitMetaOf dtb_u_u372) dtb_u_u373) in (let dtb_u_u396 = (if ((dtp_log_on 2) "Vuna.Compiler.Driver.SplitGen") then (((dtp_log_emit 2) "Vuna.Compiler.Driver.SplitGen") "cg-splitmeta-done") else 0) in (let dtb_u_u397 = ((B_dData_dList.v_append (dtb_u_u394).Vuna_dIr_dModel.f_IrShared_irSharedDefLocs) dtb_u_u378) in (let dtb_u_u398 = (if ((dtp_log_on 2) "Vuna.Compiler.Driver.SplitGen") then (((dtp_log_emit 2) "Vuna.Compiler.Driver.SplitGen") "cg-deflocs-done") else 0) in (((((((((((v_splitProgramFiles dtb_u_u393) dtb_u_u372) dtb_u_u373) dtb_u_u375) dtb_u_u392) dtb_u_u391) dtb_u_u395) ((v_splitLocPath dtb_u_u376) dtb_u_u377)) dtb_u_u394) dtb_u_u389) dtb_u_u397)))))))))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 386 "Vuna/Compiler/Driver/SplitGen.vuna"
let v_generateDtSplitProgram_u_udirect = (fun (modules : (string, Frontend_dAst.t_Decl B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (entryDecls : Frontend_dAst.t_Decl B_dData_dList.t_List) (prog : Elab_dTypes.t_DtProgram) (printResult : bool) (roots : string B_dData_dList.t_List) (contextDir : string) (extraDefLocs : (string, (string, int) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) _u_ueffTok -> (match (Lowering_dEnv.v_eraseDefs (Elab_dTypes.v_dtProgDefs prog)) with
  | Base_dDiag.C_Check_ErrC (dtb_u_u379) -> (let dtb_u_u381 = (Base_dDiag.C_Check_ErrC (dtb_u_u379)) in dtb_u_u381)
  | Base_dDiag.C_Check_OkC (dtb_u_u383) -> (match (Lowering_dEntry.v_lowerEntryOf dtb_u_u383) with
  | Base_dDiag.C_Check_ErrC (dtb_u_u384) -> (let dtb_u_u386 = (Base_dDiag.C_Check_ErrC (dtb_u_u384)) in dtb_u_u386)
  | Base_dDiag.C_Check_OkC (dtb_u_u388) -> (let dtb_u_u389 = (v_entryIsActionM dtb_u_u388) in (let dtb_u_u390 = (if ((dtp_log_on 2) "Vuna.Compiler.Driver.SplitGen") then (((dtp_log_emit 2) "Vuna.Compiler.Driver.SplitGen") "cg-splitstart") else 0) in (let dtb_u_u391 = (Lowering_dEnv.v_rtDatasOf (Elab_dTypes.v_dtProgDatas prog)) in (let dtb_u_u392 = (Lowering_dProgram.v_partitionRuntimeDefs dtb_u_u383) in (let dtb_u_u393 = (((((Lowering_dEnv.v_mkLwEnvFromErased (Elab_dTypes.v_dtProgDatas prog)) dtb_u_u383) (Elab_dTypes.v_dtProgDefs prog)) (Elab_dTypes.v_dtProgGlobals prog)) (v_splitUnitOfModule Driver_dOwner.v_entryOwner)) in (let dtb_u_u394 = (Lowering_dEnv.v_lwEnvShared dtb_u_u393) in (let dtb_u_u395 = ((Driver_dOwner.v_splitMetaOf modules) entryDecls) in (let dtb_u_u396 = (if ((dtp_log_on 2) "Vuna.Compiler.Driver.SplitGen") then (((dtp_log_emit 2) "Vuna.Compiler.Driver.SplitGen") "cg-splitmeta-done") else 0) in (let dtb_u_u397 = ((B_dData_dList.v_append (dtb_u_u394).Vuna_dIr_dModel.f_IrShared_irSharedDefLocs) extraDefLocs) in (let dtb_u_u398 = (if ((dtp_log_on 2) "Vuna.Compiler.Driver.SplitGen") then (((dtp_log_emit 2) "Vuna.Compiler.Driver.SplitGen") "cg-deflocs-done") else 0) in ((Obj.magic (((((((((((v_splitProgramFiles dtb_u_u393) modules) entryDecls) printResult) dtb_u_u392) dtb_u_u391) dtb_u_u395) ((v_splitLocPath roots) contextDir)) dtb_u_u394) dtb_u_u389) dtb_u_u397)) _u_ueffTok)))))))))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 213 "Vuna/Compiler/Driver/SplitGen.vuna"
let v_sgcEnv = (fun (p : t_SplitGenCtx) -> (match p with
  | { f_SplitGenCtx_sgcEnv = dtb__125; f_SplitGenCtx_sgcAllDefs = dtb__126; f_SplitGenCtx_sgcDefOwnerT = dtb__127; f_SplitGenCtx_sgcDataOwnerT = dtb__128; f_SplitGenCtx_sgcDefUnitT = dtb__129; f_SplitGenCtx_sgcDataUnitT = dtb__130; f_SplitGenCtx_sgcOrdered = dtb__131; f_SplitGenCtx_sgcDefBuckets = dtb__132; f_SplitGenCtx_sgcDataBuckets = dtb__133; f_SplitGenCtx_sgcNormPath = dtb__134; f_SplitGenCtx_sgcEffArity = dtb__135 } -> dtb__125
  | _ -> failwith "DT: impossible branch"
))

# 214 "Vuna/Compiler/Driver/SplitGen.vuna"
let v_sgcAllDefs = (fun (p : t_SplitGenCtx) -> (match p with
  | { f_SplitGenCtx_sgcEnv = dtb__136; f_SplitGenCtx_sgcAllDefs = dtb__137; f_SplitGenCtx_sgcDefOwnerT = dtb__138; f_SplitGenCtx_sgcDataOwnerT = dtb__139; f_SplitGenCtx_sgcDefUnitT = dtb__140; f_SplitGenCtx_sgcDataUnitT = dtb__141; f_SplitGenCtx_sgcOrdered = dtb__142; f_SplitGenCtx_sgcDefBuckets = dtb__143; f_SplitGenCtx_sgcDataBuckets = dtb__144; f_SplitGenCtx_sgcNormPath = dtb__145; f_SplitGenCtx_sgcEffArity = dtb__146 } -> dtb__137
  | _ -> failwith "DT: impossible branch"
))

# 215 "Vuna/Compiler/Driver/SplitGen.vuna"
let v_sgcDefOwnerT = (fun (p : t_SplitGenCtx) -> (match p with
  | { f_SplitGenCtx_sgcEnv = dtb__147; f_SplitGenCtx_sgcAllDefs = dtb__148; f_SplitGenCtx_sgcDefOwnerT = dtb__149; f_SplitGenCtx_sgcDataOwnerT = dtb__150; f_SplitGenCtx_sgcDefUnitT = dtb__151; f_SplitGenCtx_sgcDataUnitT = dtb__152; f_SplitGenCtx_sgcOrdered = dtb__153; f_SplitGenCtx_sgcDefBuckets = dtb__154; f_SplitGenCtx_sgcDataBuckets = dtb__155; f_SplitGenCtx_sgcNormPath = dtb__156; f_SplitGenCtx_sgcEffArity = dtb__157 } -> dtb__149
  | _ -> failwith "DT: impossible branch"
))

# 216 "Vuna/Compiler/Driver/SplitGen.vuna"
let v_sgcDataOwnerT = (fun (p : t_SplitGenCtx) -> (match p with
  | { f_SplitGenCtx_sgcEnv = dtb__158; f_SplitGenCtx_sgcAllDefs = dtb__159; f_SplitGenCtx_sgcDefOwnerT = dtb__160; f_SplitGenCtx_sgcDataOwnerT = dtb__161; f_SplitGenCtx_sgcDefUnitT = dtb__162; f_SplitGenCtx_sgcDataUnitT = dtb__163; f_SplitGenCtx_sgcOrdered = dtb__164; f_SplitGenCtx_sgcDefBuckets = dtb__165; f_SplitGenCtx_sgcDataBuckets = dtb__166; f_SplitGenCtx_sgcNormPath = dtb__167; f_SplitGenCtx_sgcEffArity = dtb__168 } -> dtb__161
  | _ -> failwith "DT: impossible branch"
))

# 217 "Vuna/Compiler/Driver/SplitGen.vuna"
let v_sgcDefUnitT = (fun (p : t_SplitGenCtx) -> (match p with
  | { f_SplitGenCtx_sgcEnv = dtb__169; f_SplitGenCtx_sgcAllDefs = dtb__170; f_SplitGenCtx_sgcDefOwnerT = dtb__171; f_SplitGenCtx_sgcDataOwnerT = dtb__172; f_SplitGenCtx_sgcDefUnitT = dtb__173; f_SplitGenCtx_sgcDataUnitT = dtb__174; f_SplitGenCtx_sgcOrdered = dtb__175; f_SplitGenCtx_sgcDefBuckets = dtb__176; f_SplitGenCtx_sgcDataBuckets = dtb__177; f_SplitGenCtx_sgcNormPath = dtb__178; f_SplitGenCtx_sgcEffArity = dtb__179 } -> dtb__173
  | _ -> failwith "DT: impossible branch"
))

# 218 "Vuna/Compiler/Driver/SplitGen.vuna"
let v_sgcDataUnitT = (fun (p : t_SplitGenCtx) -> (match p with
  | { f_SplitGenCtx_sgcEnv = dtb__180; f_SplitGenCtx_sgcAllDefs = dtb__181; f_SplitGenCtx_sgcDefOwnerT = dtb__182; f_SplitGenCtx_sgcDataOwnerT = dtb__183; f_SplitGenCtx_sgcDefUnitT = dtb__184; f_SplitGenCtx_sgcDataUnitT = dtb__185; f_SplitGenCtx_sgcOrdered = dtb__186; f_SplitGenCtx_sgcDefBuckets = dtb__187; f_SplitGenCtx_sgcDataBuckets = dtb__188; f_SplitGenCtx_sgcNormPath = dtb__189; f_SplitGenCtx_sgcEffArity = dtb__190 } -> dtb__185
  | _ -> failwith "DT: impossible branch"
))

# 219 "Vuna/Compiler/Driver/SplitGen.vuna"
let v_sgcOrdered = (fun (p : t_SplitGenCtx) -> (match p with
  | { f_SplitGenCtx_sgcEnv = dtb__191; f_SplitGenCtx_sgcAllDefs = dtb__192; f_SplitGenCtx_sgcDefOwnerT = dtb__193; f_SplitGenCtx_sgcDataOwnerT = dtb__194; f_SplitGenCtx_sgcDefUnitT = dtb__195; f_SplitGenCtx_sgcDataUnitT = dtb__196; f_SplitGenCtx_sgcOrdered = dtb__197; f_SplitGenCtx_sgcDefBuckets = dtb__198; f_SplitGenCtx_sgcDataBuckets = dtb__199; f_SplitGenCtx_sgcNormPath = dtb__200; f_SplitGenCtx_sgcEffArity = dtb__201 } -> dtb__197
  | _ -> failwith "DT: impossible branch"
))

# 221 "Vuna/Compiler/Driver/SplitGen.vuna"
let v_sgcDefBuckets = (fun (p : t_SplitGenCtx) -> (match p with
  | { f_SplitGenCtx_sgcEnv = dtb__202; f_SplitGenCtx_sgcAllDefs = dtb__203; f_SplitGenCtx_sgcDefOwnerT = dtb__204; f_SplitGenCtx_sgcDataOwnerT = dtb__205; f_SplitGenCtx_sgcDefUnitT = dtb__206; f_SplitGenCtx_sgcDataUnitT = dtb__207; f_SplitGenCtx_sgcOrdered = dtb__208; f_SplitGenCtx_sgcDefBuckets = dtb__209; f_SplitGenCtx_sgcDataBuckets = dtb__210; f_SplitGenCtx_sgcNormPath = dtb__211; f_SplitGenCtx_sgcEffArity = dtb__212 } -> dtb__209
  | _ -> failwith "DT: impossible branch"
))

# 222 "Vuna/Compiler/Driver/SplitGen.vuna"
let v_sgcDataBuckets = (fun (p : t_SplitGenCtx) -> (match p with
  | { f_SplitGenCtx_sgcEnv = dtb__213; f_SplitGenCtx_sgcAllDefs = dtb__214; f_SplitGenCtx_sgcDefOwnerT = dtb__215; f_SplitGenCtx_sgcDataOwnerT = dtb__216; f_SplitGenCtx_sgcDefUnitT = dtb__217; f_SplitGenCtx_sgcDataUnitT = dtb__218; f_SplitGenCtx_sgcOrdered = dtb__219; f_SplitGenCtx_sgcDefBuckets = dtb__220; f_SplitGenCtx_sgcDataBuckets = dtb__221; f_SplitGenCtx_sgcNormPath = dtb__222; f_SplitGenCtx_sgcEffArity = dtb__223 } -> dtb__221
  | _ -> failwith "DT: impossible branch"
))

# 224 "Vuna/Compiler/Driver/SplitGen.vuna"
let v_sgcNormPath = (fun p -> (match p with
  | { f_SplitGenCtx_sgcEnv = dtb__224; f_SplitGenCtx_sgcAllDefs = dtb__225; f_SplitGenCtx_sgcDefOwnerT = dtb__226; f_SplitGenCtx_sgcDataOwnerT = dtb__227; f_SplitGenCtx_sgcDefUnitT = dtb__228; f_SplitGenCtx_sgcDataUnitT = dtb__229; f_SplitGenCtx_sgcOrdered = dtb__230; f_SplitGenCtx_sgcDefBuckets = dtb__231; f_SplitGenCtx_sgcDataBuckets = dtb__232; f_SplitGenCtx_sgcNormPath = dtb__233; f_SplitGenCtx_sgcEffArity = dtb__234 } -> dtb__233
  | _ -> failwith "DT: impossible branch"
))

# 226 "Vuna/Compiler/Driver/SplitGen.vuna"
let v_sgcEffArity = (fun (p : t_SplitGenCtx) -> (match p with
  | { f_SplitGenCtx_sgcEnv = dtb__235; f_SplitGenCtx_sgcAllDefs = dtb__236; f_SplitGenCtx_sgcDefOwnerT = dtb__237; f_SplitGenCtx_sgcDataOwnerT = dtb__238; f_SplitGenCtx_sgcDefUnitT = dtb__239; f_SplitGenCtx_sgcDataUnitT = dtb__240; f_SplitGenCtx_sgcOrdered = dtb__241; f_SplitGenCtx_sgcDefBuckets = dtb__242; f_SplitGenCtx_sgcDataBuckets = dtb__243; f_SplitGenCtx_sgcNormPath = dtb__244; f_SplitGenCtx_sgcEffArity = dtb__245 } -> dtb__245
  | _ -> failwith "DT: impossible branch"
))
