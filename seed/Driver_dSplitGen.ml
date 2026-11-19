open Vuna_runtime
type t_SplitGenCtx = { f_SplitGenCtx_sgcEnv : Lowering_dEnv.t_LwEnv; f_SplitGenCtx_sgcAllDatas : Elab_dTypes.t_DtData B_dData_dList.t_List; f_SplitGenCtx_sgcAllDefs : Elab_dTypes.t_DtDef B_dData_dList.t_List; f_SplitGenCtx_sgcDefOwnerT : (string, string) B_dContainer_dHashMap.t_HashMap; f_SplitGenCtx_sgcDataOwnerT : (string, string) B_dContainer_dHashMap.t_HashMap; f_SplitGenCtx_sgcDefUnitT : (string, string) B_dContainer_dHashMap.t_HashMap; f_SplitGenCtx_sgcDataUnitT : (string, string) B_dContainer_dHashMap.t_HashMap; f_SplitGenCtx_sgcOrdered : string B_dData_dList.t_List; f_SplitGenCtx_sgcNormPath : (string) -> string }

# 40 "Vuna/Compiler/Driver/SplitGen.vuna"
let v_compilerPkgPrefix = "Vuna.Compiler."

# 43 "Vuna/Compiler/Driver/SplitGen.vuna"
let v_basePkgPrefix = "Base."

# 46 "Vuna/Compiler/Driver/SplitGen.vuna"
let v_unitPathOf = (fun (m : string) -> (if ((B_dData_dString.v_startsWith v_compilerPkgPrefix) m) then (((dtp_substring (bi_strLength v_compilerPkgPrefix)) ((bi_strLength m) - (bi_strLength v_compilerPkgPrefix))) m) else (if ((B_dData_dString.v_startsWith v_basePkgPrefix) m) then ("B." ^ (((dtp_substring (bi_strLength v_basePkgPrefix)) ((bi_strLength m) - (bi_strLength v_basePkgPrefix))) m)) else m)))

# 37 "Vuna/Compiler/Driver/SplitGen.vuna"
let v_splitUnitOfModule = (fun (modName : string) -> (Vuna_dTarget_dOcaml_dDecl.v_sanitizeName (v_unitPathOf modName)))

# 57 "Vuna/Compiler/Driver/SplitGen.vuna"
let v_unitOfLocName = (fun (name : string) -> ((fun p -> (if (p = "") then (v_splitUnitOfModule Driver_dOwner.v_entryOwner) else (v_splitUnitOfModule p))) (Driver_dOwner.v_modulePrefixOfName name)))

# 65 "Vuna/Compiler/Driver/SplitGen.vuna"
let v_mainInitPrologue = "let () = Printexc.record_backtrace true\n"

# 73 "Vuna/Compiler/Driver/SplitGen.vuna"
let v_ownerTblOf = (fun (pairs : (string, string) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (((B_dContainer_dHashMap.v_insertAll B_dData_dString.v_Hashable_uString) pairs) ((B_dContainer_dHashMap.v_fromList B_dData_dString.v_Hashable_uString) B_dData_dList.C_List_Nil)))

# 76 "Vuna/Compiler/Driver/SplitGen.vuna"
let v_ownerOfTbl = (fun (t : (string, string) B_dContainer_dHashMap.t_HashMap) (name : string) -> (match ((((B_dContainer_dHashMap.v_lookup B_dData_dString.v_Hashable_uString) B_dData_dString.v_Eq_uString) name) t) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__0) -> dtb__0
  | B_dData_dMaybe.C_Maybe_Nothing -> ""
  | _ -> failwith "DT: impossible branch"
))

# 82 "Vuna/Compiler/Driver/SplitGen.vuna"
let v_datasInUnit = (fun (ownerT : (string, string) B_dContainer_dHashMap.t_HashMap) (u : string) (datas : Elab_dTypes.t_DtData B_dData_dList.t_List) -> ((B_dData_dList.v_filter (fun (d : Elab_dTypes.t_DtData) -> (((v_ownerOfTbl ownerT) (Elab_dTypes.v_dtDataName d)) = u))) datas))

# 85 "Vuna/Compiler/Driver/SplitGen.vuna"
let v_defsInUnit = (fun (ownerT : (string, string) B_dContainer_dHashMap.t_HashMap) (u : string) (defs : Elab_dTypes.t_DtDef B_dData_dList.t_List) -> ((B_dData_dList.v_filter (fun (d : Elab_dTypes.t_DtDef) -> (((v_ownerOfTbl ownerT) (Elab_dTypes.v_dtDefName d)) = u))) defs))

# 98 "Vuna/Compiler/Driver/SplitGen.vuna"
let v_knownUnit = (fun (units : string B_dData_dList.t_List) (u : string) -> ((B_dData_dList.v_memName u) units))

# 101 "Vuna/Compiler/Driver/SplitGen.vuna"
let rec v_checkDepsKnown = (fun (mc0 : string B_dData_dList.t_List) (mc1 : string) (mc2 : string B_dData_dList.t_List) -> (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__1, dtb__2) -> (if (B_dData_dBool.v_not ((v_knownUnit mc0) dtb__1)) then (Base_dDiag.v_icInternal (String.concat "" [mc1; " references unknown unit `"; dtb__1; "`"])) else (if (B_dData_dBool.v_not ((v_knownUnit mc0) mc1)) then (Base_dDiag.v_icInternal (String.concat "" ["split unit `"; mc1; "` is not in the module order"])) else (((v_checkDepsKnown mc0) mc1) dtb__2)))
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (0))
  | _ -> failwith "DT: impossible branch"
))

# 112 "Vuna/Compiler/Driver/SplitGen.vuna"
let v_depsInOrder = (fun (ordered : string B_dData_dList.t_List) (self : string) (deps : string B_dData_dList.t_List) -> ((B_dData_dList.v_filter (fun (u : string) -> (if (B_dData_dBool.v_not (u = self)) then ((B_dData_dList.v_memName u) deps) else false))) ordered))

# 115 "Vuna/Compiler/Driver/SplitGen.vuna"
let v_unitDepsOf = (fun (ordered : string B_dData_dList.t_List) (self : string) (deps : string B_dData_dList.t_List) -> ((Base_dCommon.v_bind (((v_checkDepsKnown ordered) self) deps)) (fun (_u : int) -> (Base_dDiag.C_Check_OkC ((((v_depsInOrder ordered) self) deps))))))

# 130 "Vuna/Compiler/Driver/SplitGen.vuna"
let rec v_depsKnown = (fun (mc0 : string B_dData_dList.t_List) (mc1 : string B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__3, dtb__4) -> (if ((v_knownUnit mc0) dtb__3) then ((v_depsKnown mc0) dtb__4) else false)
  | B_dData_dList.C_List_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

# 127 "Vuna/Compiler/Driver/SplitGen.vuna"
let v_cachedUnitOk = (fun (mc0 : string B_dData_dList.t_List) (mc1 : string) (mc2 : Driver_dSplit.t_SplitFile) -> (match mc2 with
  | { Driver_dSplit.f_SplitFile_splitName = dtb__5; Driver_dSplit.f_SplitFile_splitText = dtb__6; Driver_dSplit.f_SplitFile_splitDeps = dtb__7 } -> (if (dtb__5 = (mc1 ^ ".ml")) then ((v_depsKnown mc0) dtb__7) else false)
  | _ -> failwith "DT: impossible branch"
))

# 135 "Vuna/Compiler/Driver/SplitGen.vuna"
let v_keepCached = (fun (mc0 : string B_dData_dList.t_List) (mc1 : string) (mc2 : Driver_dSplit.t_SplitFile B_dData_dMaybe.t_Maybe) -> (match mc2 with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb__8) -> (if (((v_cachedUnitOk mc0) mc1) dtb__8) then (B_dData_dMaybe.C_Maybe_Just (dtb__8)) else B_dData_dMaybe.C_Maybe_Nothing)
  | _ -> failwith "DT: impossible branch"
))

# 140 "Vuna/Compiler/Driver/SplitGen.vuna"
let rec v_uniqueSplitNames = (fun (mc0 : Driver_dSplit.t_SplitFile B_dData_dList.t_List) (mc1 : string B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__9, dtb__10) -> (match dtb__9 with
  | { Driver_dSplit.f_SplitFile_splitName = dtb__11; Driver_dSplit.f_SplitFile_splitText = dtb__12; Driver_dSplit.f_SplitFile_splitDeps = dtb__13 } -> (if ((B_dData_dList.v_memName dtb__11) mc1) then false else ((v_uniqueSplitNames dtb__10) (B_dData_dList.C_List__x58__x58_ (dtb__11, mc1))))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

# 145 "Vuna/Compiler/Driver/SplitGen.vuna"
let v_checkSplitNames = (fun (files : Driver_dSplit.t_SplitFile B_dData_dList.t_List) -> (if ((v_uniqueSplitNames files) B_dData_dList.C_List_Nil) then (Base_dDiag.C_Check_OkC (0)) else (Base_dDiag.v_icInternal "split unit name collides with another module (codegen unit naming)")))

# 155 "Vuna/Compiler/Driver/SplitGen.vuna"
let v_checkSplitAcyclic = (fun (files : Driver_dSplit.t_SplitFile B_dData_dList.t_List) -> (if (Driver_dSplit.v_splitGraphAcyclic files) then (Base_dDiag.C_Check_OkC (0)) else (Base_dDiag.v_icInternal "split dependency graph has a cycle (unit order is not a DAG)")))

# 176 "Vuna/Compiler/Driver/SplitGen.vuna"
let v_mapToUnit = (fun (pairs : (string, string) B_dData_dPair.t_Pair B_dData_dList.t_List) -> ((B_dData_dList.v_map (fun (q : (string, string) B_dData_dPair.t_Pair) -> { B_dData_dPair.f_Pair_first = (B_dData_dPair.v_firstOf q); B_dData_dPair.f_Pair_second = (v_splitUnitOfModule (B_dData_dPair.v_secondOf q)) })) pairs))

# 182 "Vuna/Compiler/Driver/SplitGen.vuna"
let v_checkModuleDeclName = (fun (knownModules : string B_dData_dList.t_List) (mname : string) (name : string) -> (if (Base_dSource.v_containsDot name) then (if ((B_dData_dList.v_memName (Driver_dOwner.v_modulePrefixOfName name)) knownModules) then (Base_dDiag.C_Check_OkC (0)) else (Base_dDiag.v_icInternal (String.concat "" ["module "; mname; " declares `"; name; "` whose module prefix `"; (Driver_dOwner.v_modulePrefixOfName name); "` is not a known module (codegen requires Loader-resolved decls)"]))) else (Base_dDiag.v_icInternal (String.concat "" ["module "; mname; " has an unresolved declaration name `"; name; "` (codegen requires Loader-resolved decls)"]))))

# 194 "Vuna/Compiler/Driver/SplitGen.vuna"
let rec v_checkModuleDeclNames = (fun (mc0 : string B_dData_dList.t_List) (mc1 : string) (mc2 : string B_dData_dList.t_List) -> (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__14, dtb__15) -> ((Base_dCommon.v_bind (((v_checkModuleDeclName mc0) mc1) dtb__14)) (fun (_u : int) -> (((v_checkModuleDeclNames mc0) mc1) dtb__15)))
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (0))
  | _ -> failwith "DT: impossible branch"
))

# 201 "Vuna/Compiler/Driver/SplitGen.vuna"
let rec v_checkModuleDecls = (fun (mc0 : string B_dData_dList.t_List) (mc1 : (string, Frontend_dAst.t_Decl B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__16, dtb__17) -> (match dtb__16 with
  | { B_dData_dPair.f_Pair_first = dtb__18; B_dData_dPair.f_Pair_second = dtb__19 } -> ((Base_dCommon.v_bind (((v_checkModuleDeclNames mc0) dtb__18) (Driver_dOwner.v_splitDeclNames dtb__19))) (fun (_u : int) -> ((v_checkModuleDecls mc0) dtb__17)))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (0))
  | _ -> failwith "DT: impossible branch"
))

# 212 "Vuna/Compiler/Driver/SplitGen.vuna"
let rec v_entryDeclIdentities = (fun (mc0 : Frontend_dAst.t_Decl B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__20, dtb__21) -> (match dtb__20 with
  | Frontend_dAst.C_Decl_DSig (dtb__22, dtb__23, dtb__24, dtb__25) -> (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = false; B_dData_dPair.f_Pair_second = dtb__22 }, (v_entryDeclIdentities dtb__21)))
  | Frontend_dAst.C_Decl_DExtern (dtb__26, dtb__27, dtb__28, dtb__29) -> (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = false; B_dData_dPair.f_Pair_second = dtb__26 }, (v_entryDeclIdentities dtb__21)))
  | Frontend_dAst.C_Decl_DData (dtb__30, dtb__31, dtb__32, dtb__33, dtb__34, dtb__35, dtb__36, dtb__37, dtb__38) -> (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = true; B_dData_dPair.f_Pair_second = dtb__30 }, (v_entryDeclIdentities dtb__21)))
  | Frontend_dAst.C_Decl_DRecord (dtb__39, dtb__40, dtb__41, dtb__42, dtb__43, dtb__44, dtb__45, dtb__46) -> (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = true; B_dData_dPair.f_Pair_second = dtb__39 }, (v_entryDeclIdentities dtb__21)))
  | Frontend_dAst.C_Decl_DTrait (dtb__47, dtb__48, dtb__49, dtb__50, dtb__51) -> (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = true; B_dData_dPair.f_Pair_second = dtb__47 }, (v_entryDeclIdentities dtb__21)))
  | _ -> (v_entryDeclIdentities dtb__21)
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 225 "Vuna/Compiler/Driver/SplitGen.vuna"
let v_entryDeclKey = (fun (mc0 : (bool, string) B_dData_dPair.t_Pair) -> (match mc0 with
  | { B_dData_dPair.f_Pair_first = dtb__52; B_dData_dPair.f_Pair_second = dtb__53 } -> (if dtb__52 then ("type\t" ^ dtb__53) else ("value\t" ^ dtb__53))
  | _ -> failwith "DT: impossible branch"
))

# 229 "Vuna/Compiler/Driver/SplitGen.vuna"
let v_checkEntryDeclName = (fun (seen : string B_dData_dList.t_List) (identity : (bool, string) B_dData_dPair.t_Pair) -> ((fun name -> ((fun key -> (if (name = "") then (Base_dDiag.v_icInternal "entry declaration has an empty name") else (if (Base_dSource.v_containsDot name) then (Base_dDiag.v_icInternal (String.concat "" ["entry declaration `"; name; "` must not contain a module prefix (codegen requires Loader-resolved decls)"])) else (if ((B_dData_dList.v_memName key) seen) then (Base_dDiag.v_icInternal (String.concat "" ["duplicate entry declaration `"; name; "`"])) else (Base_dDiag.C_Check_OkC (0)))))) (v_entryDeclKey identity))) (B_dData_dPair.v_secondOf identity)))

# 241 "Vuna/Compiler/Driver/SplitGen.vuna"
let rec v_checkEntryDeclsGo = (fun (mc0 : string B_dData_dList.t_List) (mc1 : (bool, string) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__54, dtb__55) -> ((Base_dCommon.v_bind ((v_checkEntryDeclName mc0) dtb__54)) (fun (_u : int) -> ((v_checkEntryDeclsGo (B_dData_dList.C_List__x58__x58_ ((v_entryDeclKey dtb__54), mc0))) dtb__55)))
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (0))
  | _ -> failwith "DT: impossible branch"
))

# 248 "Vuna/Compiler/Driver/SplitGen.vuna"
let v_checkEntryDecls = (fun (decls : Frontend_dAst.t_Decl B_dData_dList.t_List) -> ((v_checkEntryDeclsGo B_dData_dList.C_List_Nil) (v_entryDeclIdentities decls)))

# 253 "Vuna/Compiler/Driver/SplitGen.vuna"
let rec v_checkDefOwners = (fun (mc0 : Driver_dOwner.t_SplitMeta) (mc1 : Elab_dTypes.t_DtDef B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__56, dtb__57) -> ((Base_dCommon.v_bind ((Driver_dOwner.v_splitDefOwnerOf mc0) (Elab_dTypes.v_dtDefName dtb__56))) (fun (_u : string) -> ((v_checkDefOwners mc0) dtb__57)))
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (0))
  | _ -> failwith "DT: impossible branch"
))

# 260 "Vuna/Compiler/Driver/SplitGen.vuna"
let rec v_checkDataOwners = (fun (mc0 : Driver_dOwner.t_SplitMeta) (mc1 : Elab_dTypes.t_DtData B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__58, dtb__59) -> ((Base_dCommon.v_bind ((Driver_dOwner.v_splitDataOwnerOf mc0) dtb__58)) (fun (_u : string) -> ((v_checkDataOwners mc0) dtb__59)))
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (0))
  | _ -> failwith "DT: impossible branch"
))

# 265 "Vuna/Compiler/Driver/SplitGen.vuna"
let v_checkResolvedModules = (fun (meta : Driver_dOwner.t_SplitMeta) (modules : (string, Frontend_dAst.t_Decl B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (entryDecls : Frontend_dAst.t_Decl B_dData_dList.t_List) (runtime : Elab_dTypes.t_DtDef B_dData_dList.t_List) (datas : Elab_dTypes.t_DtData B_dData_dList.t_List) -> ((Base_dCommon.v_bind ((v_checkModuleDecls (meta).Driver_dOwner.f_SplitMeta_smKnownModules) modules)) (fun (_u : int) -> ((Base_dCommon.v_bind (v_checkEntryDecls entryDecls)) (fun (_u : int) -> ((Base_dCommon.v_bind ((v_checkDefOwners meta) runtime)) (fun (_u : int) -> ((v_checkDataOwners meta) datas))))))))

# 277 "Vuna/Compiler/Driver/SplitGen.vuna"
let v_splitStripPrefix = (fun (prefix : string) (path : string) -> (if (prefix = "") then path else (if ((B_dData_dString.v_startsWith (prefix ^ "/")) path) then (((dtp_substring (bi_strLength (prefix ^ "/"))) ((bi_strLength path) - (bi_strLength (prefix ^ "/")))) path) else path)))

# 286 "Vuna/Compiler/Driver/SplitGen.vuna"
let rec v_splitStripRoots = (fun (mc0 : string B_dData_dList.t_List) (mc1 : string) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__60, dtb__61) -> (if ((B_dData_dString.v_startsWith (dtb__60 ^ "/")) mc1) then ((v_splitStripPrefix dtb__60) mc1) else ((v_splitStripRoots dtb__61) mc1))
  | B_dData_dList.C_List_Nil -> mc1
  | _ -> failwith "DT: impossible branch"
))

# 291 "Vuna/Compiler/Driver/SplitGen.vuna"
let v_splitStripDotSlash = (fun (path : string) -> (if ((B_dData_dString.v_startsWith "./") path) then (((dtp_substring 2) ((bi_strLength path) - 2)) path) else path))

# 295 "Vuna/Compiler/Driver/SplitGen.vuna"
let v_splitLocPath = (fun (roots : string B_dData_dList.t_List) (contextDir : string) (path : string) -> (v_splitStripDotSlash ((v_splitStripPrefix contextDir) ((v_splitStripRoots roots) path))))

# 301 "Vuna/Compiler/Driver/SplitGen.vuna"
let v_noUnitLookup = (fun (_u : string) -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) B_dData_dMaybe.C_Maybe_Nothing))

# 304 "Vuna/Compiler/Driver/SplitGen.vuna"
let v_noUnitStore = (fun (_u : string) (_u : Driver_dSplit.t_SplitFile) -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) 0))

# 441 "Vuna/Compiler/Driver/SplitGen.vuna"
let rec v_splitModuleFilesWith = (fun (mc0 : (string) -> Driver_dSplit.t_SplitFile B_dData_dMaybe.t_Maybe B_dEffect_dCore.t_Eff) (mc1 : (string) -> (Driver_dSplit.t_SplitFile) -> int B_dEffect_dCore.t_Eff) (mc2 : t_SplitGenCtx) (mc3 : (string, Frontend_dAst.t_Decl B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc3 with
  | B_dData_dList.C_List__x58__x58_ (dtb__62, dtb__63) -> (match dtb__62 with
  | { B_dData_dPair.f_Pair_first = dtb__64; B_dData_dPair.f_Pair_second = dtb__65 } -> ((fun unit -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (mc0 dtb__64)) (fun cached0 -> ((fun cached -> (match cached with
  | B_dData_dMaybe.C_Maybe_Just (dtb__66) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) ((((v_splitModuleFilesWith mc0) mc1) mc2) dtb__63)) (fun tailR -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) (match tailR with
  | Base_dDiag.C_Check_ErrC (dtb__67) -> (Base_dDiag.C_Check_ErrC (dtb__67))
  | Base_dDiag.C_Check_OkC (dtb__68) -> (Base_dDiag.C_Check_OkC ((B_dData_dList.C_List__x58__x58_ (dtb__66, dtb__68))))
  | _ -> failwith "DT: impossible branch"
))))
  | B_dData_dMaybe.C_Maybe_Nothing -> ((fun unitDatas -> ((fun unitDefs -> ((fun qc -> ((fun envU -> (match (((Lowering_dProgram.v_lowerUnitChecked envU) ((B_dData_dList.v_map Elab_dTypes.v_dtDefName) unitDefs)) ((B_dData_dList.v_map Elab_dTypes.v_dtDataName) unitDatas)) with
  | Base_dDiag.C_Check_ErrC (dtb__69) -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) (Base_dDiag.C_Check_ErrC (dtb__69)))
  | Base_dDiag.C_Check_OkC (dtb__70) -> (match ((((Vuna_dTarget_dOcaml_dAssembly.v_genUnitPartsWith (mc2).f_SplitGenCtx_sgcNormPath) qc) (Lowering_dEnv.v_lwEnvShared envU)) dtb__70) with
  | Base_dDiag.C_Check_ErrC (dtb__71) -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) (Base_dDiag.C_Check_ErrC (dtb__71)))
  | Base_dDiag.C_Check_OkC (dtb__72) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) ((((v_splitModuleFilesWith mc0) mc1) mc2) dtb__63)) (fun tailR -> (match tailR with
  | Base_dDiag.C_Check_ErrC (dtb__73) -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) (Base_dDiag.C_Check_ErrC (dtb__73)))
  | Base_dDiag.C_Check_OkC (dtb__74) -> (match (((v_unitDepsOf (mc2).f_SplitGenCtx_sgcOrdered) unit) (Vuna_dTarget_dOcaml_dAssembly.v_unitPartsDeps dtb__72)) with
  | Base_dDiag.C_Check_ErrC (dtb__75) -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) (Base_dDiag.C_Check_ErrC (dtb__75)))
  | Base_dDiag.C_Check_OkC (dtb__76) -> ((fun sf -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) ((mc1 dtb__64) sf)) (fun _u -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) (Base_dDiag.C_Check_OkC ((B_dData_dList.C_List__x58__x58_ (sf, dtb__74)))))))) { Driver_dSplit.f_SplitFile_splitName = (unit ^ ".ml"); Driver_dSplit.f_SplitFile_splitText = ((Vuna_dTarget_dOcaml_dAssembly.v_genUnitText dtb__72) ^ "\n"); Driver_dSplit.f_SplitFile_splitDeps = dtb__76 })
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) ((Lowering_dEnv.v_lwEnvWithUnit unit) (mc2).f_SplitGenCtx_sgcEnv))) { Vuna_dTarget_dOcaml_dDecl.f_QualCtx_qcUnit = unit; Vuna_dTarget_dOcaml_dDecl.f_QualCtx_qcDefs = (mc2).f_SplitGenCtx_sgcDefUnitT; Vuna_dTarget_dOcaml_dDecl.f_QualCtx_qcDatas = (mc2).f_SplitGenCtx_sgcDataUnitT })) (((v_defsInUnit (mc2).f_SplitGenCtx_sgcDefOwnerT) dtb__64) (mc2).f_SplitGenCtx_sgcAllDefs))) (((v_datasInUnit (mc2).f_SplitGenCtx_sgcDataOwnerT) dtb__64) (mc2).f_SplitGenCtx_sgcAllDatas))
  | _ -> failwith "DT: impossible branch"
)) (((v_keepCached (mc2).f_SplitGenCtx_sgcOrdered) unit) cached0))))) (v_splitUnitOfModule dtb__64))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) (Base_dDiag.C_Check_OkC (B_dData_dList.C_List_Nil)))
  | _ -> failwith "DT: impossible branch"
))

# 486 "Vuna/Compiler/Driver/SplitGen.vuna"
let v_splitMainFileWith = (fun (lookup : (string) -> Driver_dSplit.t_SplitFile B_dData_dMaybe.t_Maybe B_dEffect_dCore.t_Eff) (store : (string) -> (Driver_dSplit.t_SplitFile) -> int B_dEffect_dCore.t_Eff) (ctx : t_SplitGenCtx) (printResult : bool) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (lookup "__entry__")) (fun cached0 -> ((fun cached -> (match cached with
  | B_dData_dMaybe.C_Maybe_Just (dtb__77) -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) (Base_dDiag.C_Check_OkC (dtb__77)))
  | B_dData_dMaybe.C_Maybe_Nothing -> ((fun entryUnit -> ((fun entryDefs -> ((fun entryDatas -> ((fun qc -> ((fun envU -> (match (((Lowering_dProgram.v_lowerUnitChecked envU) ((B_dData_dList.v_map Elab_dTypes.v_dtDefName) entryDefs)) ((B_dData_dList.v_map Elab_dTypes.v_dtDataName) entryDatas)) with
  | Base_dDiag.C_Check_ErrC (dtb__78) -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) (Base_dDiag.C_Check_ErrC (dtb__78)))
  | Base_dDiag.C_Check_OkC (dtb__79) -> (match (Lowering_dEntry.v_lowerEntryOf (ctx).f_SplitGenCtx_sgcAllDefs) with
  | Base_dDiag.C_Check_ErrC (dtb__80) -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) (Base_dDiag.C_Check_ErrC (dtb__80)))
  | Base_dDiag.C_Check_OkC (dtb__81) -> (match dtb__81 with
  | B_dData_dMaybe.C_Maybe_Nothing -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) (Base_dDiagnostics_dCg.v_cgErr0 Base_dDiagnostics_dCg.C_CgErr_NoMain))
  | B_dData_dMaybe.C_Maybe_Just (dtb__82) -> (match ((((Vuna_dTarget_dOcaml_dAssembly.v_genUnitPartsWith (ctx).f_SplitGenCtx_sgcNormPath) qc) (Lowering_dEnv.v_lwEnvShared envU)) dtb__79) with
  | Base_dDiag.C_Check_ErrC (dtb__83) -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) (Base_dDiag.C_Check_ErrC (dtb__83)))
  | Base_dDiag.C_Check_OkC (dtb__84) -> (match (((Vuna_dTarget_dOcaml_dTerm.v_genEntryHook (((Vuna_dTarget_dOcaml_dTerm.v_mkGenStWith (ctx).f_SplitGenCtx_sgcNormPath) qc) (Lowering_dEnv.v_lwEnvShared envU))) dtb__82) printResult) with
  | Base_dDiag.C_Check_ErrC (dtb__85) -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) (Base_dDiag.C_Check_ErrC (dtb__85)))
  | Base_dDiag.C_Check_OkC (dtb__86) -> (match (((v_unitDepsOf (ctx).f_SplitGenCtx_sgcOrdered) entryUnit) ((B_dData_dList.v_append (Vuna_dTarget_dOcaml_dAssembly.v_unitPartsDeps dtb__84)) (B_dData_dPair.v_secondOf dtb__86))) with
  | Base_dDiag.C_Check_ErrC (dtb__87) -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) (Base_dDiag.C_Check_ErrC (dtb__87)))
  | Base_dDiag.C_Check_OkC (dtb__88) -> ((fun sf -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) ((store "__entry__") sf)) (fun _u -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) (Base_dDiag.C_Check_OkC (sf)))))) { Driver_dSplit.f_SplitFile_splitName = "Main.ml"; Driver_dSplit.f_SplitFile_splitText = (String.concat "" [v_mainInitPrologue; (Vuna_dTarget_dOcaml_dAssembly.v_genUnitText dtb__84); (B_dData_dPair.v_firstOf dtb__86)]); Driver_dSplit.f_SplitFile_splitDeps = dtb__88 })
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
)) ((Lowering_dEnv.v_lwEnvWithUnit entryUnit) (ctx).f_SplitGenCtx_sgcEnv))) { Vuna_dTarget_dOcaml_dDecl.f_QualCtx_qcUnit = entryUnit; Vuna_dTarget_dOcaml_dDecl.f_QualCtx_qcDefs = (ctx).f_SplitGenCtx_sgcDefUnitT; Vuna_dTarget_dOcaml_dDecl.f_QualCtx_qcDatas = (ctx).f_SplitGenCtx_sgcDataUnitT })) (((v_datasInUnit (ctx).f_SplitGenCtx_sgcDataOwnerT) Driver_dOwner.v_entryOwner) (ctx).f_SplitGenCtx_sgcAllDatas))) (((v_defsInUnit (ctx).f_SplitGenCtx_sgcDefOwnerT) Driver_dOwner.v_entryOwner) (ctx).f_SplitGenCtx_sgcAllDefs))) (v_splitUnitOfModule Driver_dOwner.v_entryOwner))
  | _ -> failwith "DT: impossible branch"
)) (((v_keepCached (ctx).f_SplitGenCtx_sgcOrdered) (v_splitUnitOfModule Driver_dOwner.v_entryOwner)) cached0)))))

# 399 "Vuna/Compiler/Driver/SplitGen.vuna"
let v_splitWithOwnersWith = (fun (lookup : (string) -> Driver_dSplit.t_SplitFile B_dData_dMaybe.t_Maybe B_dEffect_dCore.t_Eff) (store : (string) -> (Driver_dSplit.t_SplitFile) -> int B_dEffect_dCore.t_Eff) (env : Lowering_dEnv.t_LwEnv) (modules : (string, Frontend_dAst.t_Decl B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (printResult : bool) (allDatas : Elab_dTypes.t_DtData B_dData_dList.t_List) (allDefs : Elab_dTypes.t_DtDef B_dData_dList.t_List) (defPairs : (string, string) B_dData_dPair.t_Pair B_dData_dList.t_List) (dataPairs : (string, string) B_dData_dPair.t_Pair B_dData_dList.t_List) (normPath : (string) -> string) (runtimeText : string) -> ((fun defUnitT -> ((fun dataUnitT -> ((fun ordered -> ((fun ctx -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) ((((v_splitModuleFilesWith lookup) store) ctx) modules)) (fun moduleFilesR -> (match moduleFilesR with
  | Base_dDiag.C_Check_ErrC (dtb__89) -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) (Base_dDiag.C_Check_ErrC (dtb__89)))
  | Base_dDiag.C_Check_OkC (dtb__90) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) ((((v_splitMainFileWith lookup) store) ctx) printResult)) (fun mainFileR -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) (match mainFileR with
  | Base_dDiag.C_Check_ErrC (dtb__91) -> (Base_dDiag.C_Check_ErrC (dtb__91))
  | Base_dDiag.C_Check_OkC (dtb__92) -> ((fun files -> (match (v_checkSplitNames files) with
  | Base_dDiag.C_Check_ErrC (dtb__93) -> (Base_dDiag.C_Check_ErrC (dtb__93))
  | Base_dDiag.C_Check_OkC (dtb__94) -> (match (v_checkSplitAcyclic files) with
  | Base_dDiag.C_Check_ErrC (dtb__95) -> (Base_dDiag.C_Check_ErrC (dtb__95))
  | Base_dDiag.C_Check_OkC (dtb__96) -> (Base_dDiag.C_Check_OkC (files))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) (B_dData_dList.C_List__x58__x58_ ({ Driver_dSplit.f_SplitFile_splitName = "Vuna_runtime.ml"; Driver_dSplit.f_SplitFile_splitText = runtimeText; Driver_dSplit.f_SplitFile_splitDeps = B_dData_dList.C_List_Nil }, ((B_dData_dList.v_append dtb__90) (B_dData_dList.C_List__x58__x58_ (dtb__92, B_dData_dList.C_List_Nil))))))
  | _ -> failwith "DT: impossible branch"
))))
  | _ -> failwith "DT: impossible branch"
)))) { f_SplitGenCtx_sgcEnv = env; f_SplitGenCtx_sgcAllDatas = allDatas; f_SplitGenCtx_sgcAllDefs = allDefs; f_SplitGenCtx_sgcDefOwnerT = (v_ownerTblOf defPairs); f_SplitGenCtx_sgcDataOwnerT = (v_ownerTblOf dataPairs); f_SplitGenCtx_sgcDefUnitT = defUnitT; f_SplitGenCtx_sgcDataUnitT = dataUnitT; f_SplitGenCtx_sgcOrdered = ordered; f_SplitGenCtx_sgcNormPath = normPath })) ((B_dData_dList.v_append ((B_dData_dList.v_append (B_dData_dList.C_List__x58__x58_ (Vuna_dTarget_dOcaml_dAssembly.v_runtimeUnit, B_dData_dList.C_List_Nil))) ((B_dData_dList.v_map (fun (q : (string, Frontend_dAst.t_Decl B_dData_dList.t_List) B_dData_dPair.t_Pair) -> (v_splitUnitOfModule (B_dData_dPair.v_firstOf q)))) modules))) (B_dData_dList.C_List__x58__x58_ ((v_splitUnitOfModule Driver_dOwner.v_entryOwner), B_dData_dList.C_List_Nil))))) (Vuna_dTarget_dOcaml_dDecl.v_unitTblOf (v_mapToUnit dataPairs)))) (Vuna_dTarget_dOcaml_dDecl.v_unitTblOf (v_mapToUnit defPairs))))

# 375 "Vuna/Compiler/Driver/SplitGen.vuna"
let v_splitProgramCheckedWith = (fun (lookup : (string) -> Driver_dSplit.t_SplitFile B_dData_dMaybe.t_Maybe B_dEffect_dCore.t_Eff) (store : (string) -> (Driver_dSplit.t_SplitFile) -> int B_dEffect_dCore.t_Eff) (env : Lowering_dEnv.t_LwEnv) (modules : (string, Frontend_dAst.t_Decl B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (entryDecls : Frontend_dAst.t_Decl B_dData_dList.t_List) (printResult : bool) (runtimeDefs : Elab_dTypes.t_DtDef B_dData_dList.t_List) (allDatas : Elab_dTypes.t_DtData B_dData_dList.t_List) (meta : Driver_dOwner.t_SplitMeta) (normPath : (string) -> string) (runtimeText : string) -> (match (((((v_checkResolvedModules meta) modules) entryDecls) runtimeDefs) allDatas) with
  | Base_dDiag.C_Check_ErrC (dtb__97) -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) (Base_dDiag.C_Check_ErrC (dtb__97)))
  | Base_dDiag.C_Check_OkC (dtb__98) -> (match ((Driver_dOwner.v_nameOwnerPairsOfDefs meta) runtimeDefs) with
  | Base_dDiag.C_Check_ErrC (dtb__99) -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) (Base_dDiag.C_Check_ErrC (dtb__99)))
  | Base_dDiag.C_Check_OkC (dtb__100) -> (match ((Driver_dOwner.v_nameOwnerPairsOfDatas meta) allDatas) with
  | Base_dDiag.C_Check_ErrC (dtb__101) -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) (Base_dDiag.C_Check_ErrC (dtb__101)))
  | Base_dDiag.C_Check_OkC (dtb__102) -> (((((((((((v_splitWithOwnersWith lookup) store) env) modules) printResult) allDatas) runtimeDefs) dtb__100) dtb__102) normPath) runtimeText)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 357 "Vuna/Compiler/Driver/SplitGen.vuna"
let v_splitProgramFilesWith = (fun (lookup : (string) -> Driver_dSplit.t_SplitFile B_dData_dMaybe.t_Maybe B_dEffect_dCore.t_Eff) (store : (string) -> (Driver_dSplit.t_SplitFile) -> int B_dEffect_dCore.t_Eff) (env : Lowering_dEnv.t_LwEnv) (modules : (string, Frontend_dAst.t_Decl B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (entryDecls : Frontend_dAst.t_Decl B_dData_dList.t_List) (printResult : bool) (runtimeDefs : Elab_dTypes.t_DtDef B_dData_dList.t_List) (allDatas : Elab_dTypes.t_DtData B_dData_dList.t_List) (meta : Driver_dOwner.t_SplitMeta) (normPath : (string) -> string) (runtimeText : string) -> (match (Lowering_dProgram.v_checkProgramOf env) with
  | Base_dDiag.C_Check_ErrC (dtb__103) -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) (Base_dDiag.C_Check_ErrC (dtb__103)))
  | Base_dDiag.C_Check_OkC (dtb__104) -> (((((((((((v_splitProgramCheckedWith lookup) store) env) modules) entryDecls) printResult) runtimeDefs) allDatas) meta) normPath) runtimeText)
  | _ -> failwith "DT: impossible branch"
))

# 324 "Vuna/Compiler/Driver/SplitGen.vuna"
let v_generateDtSplitProgramWith = (fun (lookup : (string) -> Driver_dSplit.t_SplitFile B_dData_dMaybe.t_Maybe B_dEffect_dCore.t_Eff) (store : (string) -> (Driver_dSplit.t_SplitFile) -> int B_dEffect_dCore.t_Eff) (modules : (string, Frontend_dAst.t_Decl B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (entryDecls : Frontend_dAst.t_Decl B_dData_dList.t_List) (prog : Elab_dTypes.t_DtProgram) (printResult : bool) (roots : string B_dData_dList.t_List) (contextDir : string) (extraDefLocs : (string, (string, int) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) -> ((fun _u -> ((fun allDatas -> ((fun allDefs -> ((fun runtimeDefs -> ((fun env -> ((fun shared -> ((fun meta -> ((fun _u -> ((fun locRows -> ((fun locTbl -> ((fun _u -> ((fun runtimeText -> ((fun _u -> (((((((((((v_splitProgramFilesWith lookup) store) env) modules) entryDecls) printResult) runtimeDefs) allDatas) meta) ((v_splitLocPath roots) contextDir)) runtimeText)) (if (dtp_debug_on 0) then (dtp_debug_line "cg-runtimeText-done") else 0))) ((((Vuna_dTarget_dOcaml_dTerm.v_dtRuntimeWith locTbl) (shared).Vuna_dIr_dModel.f_IrShared_irSharedUsesFloat) (shared).Vuna_dIr_dModel.f_IrShared_irSharedUsesTrace) (shared).Vuna_dIr_dModel.f_IrShared_irSharedUsesObs))) (if (dtp_debug_on 0) then (dtp_debug_line "cg-deflocs-done") else 0))) (((Vuna_dTarget_dOcaml_dTerm.v_dtDefLocTable ((v_splitLocPath roots) contextDir)) v_unitOfLocName) locRows))) ((B_dData_dList.v_append (shared).Vuna_dIr_dModel.f_IrShared_irSharedDefLocs) extraDefLocs))) (if (dtp_debug_on 0) then (dtp_debug_line "cg-splitmeta-done") else 0))) ((Driver_dOwner.v_splitMetaOf modules) entryDecls))) (Lowering_dEnv.v_lwEnvShared env))) ((((Lowering_dEnv.v_mkLwEnv (Elab_dTypes.v_dtProgDatas prog)) allDefs) (Elab_dTypes.v_dtProgGlobals prog)) (v_splitUnitOfModule Driver_dOwner.v_entryOwner)))) (Lowering_dProgram.v_partitionRuntimeDefs allDefs))) (Elab_dTypes.v_dtProgDefs prog))) (Lowering_dEnv.v_rtDatasOf (Elab_dTypes.v_dtProgDatas prog)))) (if (dtp_debug_on 0) then (dtp_debug_line "cg-splitstart") else 0)))

# 309 "Vuna/Compiler/Driver/SplitGen.vuna"
let v_generateDtSplitProgram = (fun (modules : (string, Frontend_dAst.t_Decl B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (entryDecls : Frontend_dAst.t_Decl B_dData_dList.t_List) (prog : Elab_dTypes.t_DtProgram) (printResult : bool) (roots : string B_dData_dList.t_List) (contextDir : string) (extraDefLocs : (string, (string, int) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (((((((((v_generateDtSplitProgramWith v_noUnitLookup) v_noUnitStore) modules) entryDecls) prog) printResult) roots) contextDir) extraDefLocs))
