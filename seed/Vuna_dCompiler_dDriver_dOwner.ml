open Vuna_runtime
type t_Vuna_dCompiler_dDriver_dOwner_dSplitMeta = { f_Vuna_dCompiler_dDriver_dOwner_dSplitMeta_smDefOwners : (string, string) Base_dPair.t_Base_dPair_dPair Base_dList.t_Base_dList_dList; f_Vuna_dCompiler_dDriver_dOwner_dSplitMeta_smDataOwners : (string, string) Base_dPair.t_Base_dPair_dPair Base_dList.t_Base_dList_dList; f_Vuna_dCompiler_dDriver_dOwner_dSplitMeta_smKnownModules : string Base_dList.t_Base_dList_dList; f_Vuna_dCompiler_dDriver_dOwner_dSplitMeta_smDefOwnerT : (string, string) Base_dHashMap.t_Base_dHashMap_dHashMap; f_Vuna_dCompiler_dDriver_dOwner_dSplitMeta_smDataOwnerT : (string, string) Base_dHashMap.t_Base_dHashMap_dHashMap }

# 24 "Vuna/Compiler/Driver/Owner.vuna"
let v_Vuna_dCompiler_dDriver_dOwner_dsplitNoSpan = { Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanFile = ""; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanStartLine = 0; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanStartCol = 0; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanEndLine = 0; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanEndCol = 0 }

# 28 "Vuna/Compiler/Driver/Owner.vuna"
let v_Vuna_dCompiler_dDriver_dOwner_dentryOwner = "Main"

# 32 "Vuna/Compiler/Driver/Owner.vuna"
let v_Vuna_dCompiler_dDriver_dOwner_dmodulePrefixOfName = (fun name -> (Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dprefixOfName name))

# 38 "Vuna/Compiler/Driver/Owner.vuna"
let rec v_Vuna_dCompiler_dDriver_dOwner_dsplitDeclNames = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__0, dtb__1) -> (match dtb__0 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DSig (dtb__2, dtb__3, dtb__4, dtb__5) -> (Base_dList.C_Base_dList_dList_Cons (dtb__2, (v_Vuna_dCompiler_dDriver_dOwner_dsplitDeclNames dtb__1)))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DExtern (dtb__6, dtb__7, dtb__8, dtb__9) -> (Base_dList.C_Base_dList_dList_Cons (dtb__6, (v_Vuna_dCompiler_dDriver_dOwner_dsplitDeclNames dtb__1)))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DFun (dtb__10, dtb__11, dtb__12, dtb__13) -> (Base_dList.C_Base_dList_dList_Cons (dtb__10, (v_Vuna_dCompiler_dDriver_dOwner_dsplitDeclNames dtb__1)))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DData (dtb__14, dtb__15, dtb__16, dtb__17, dtb__18, dtb__19, dtb__20, dtb__21, dtb__22) -> (Base_dList.C_Base_dList_dList_Cons (dtb__14, (v_Vuna_dCompiler_dDriver_dOwner_dsplitDeclNames dtb__1)))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DRecord (dtb__23, dtb__24, dtb__25, dtb__26, dtb__27, dtb__28, dtb__29, dtb__30) -> (Base_dList.C_Base_dList_dList_Cons (dtb__23, (v_Vuna_dCompiler_dDriver_dOwner_dsplitDeclNames dtb__1)))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DTrait (dtb__31, dtb__32, dtb__33, dtb__34, dtb__35) -> (Base_dList.C_Base_dList_dList_Cons (dtb__31, (v_Vuna_dCompiler_dDriver_dOwner_dsplitDeclNames dtb__1)))
  | _ -> (v_Vuna_dCompiler_dDriver_dOwner_dsplitDeclNames dtb__1)
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 49 "Vuna/Compiler/Driver/Owner.vuna"
let rec v_Vuna_dCompiler_dDriver_dOwner_dsplitDataNames = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__36, dtb__37) -> (match dtb__36 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DData (dtb__38, dtb__39, dtb__40, dtb__41, dtb__42, dtb__43, dtb__44, dtb__45, dtb__46) -> (Base_dList.C_Base_dList_dList_Cons (dtb__38, (v_Vuna_dCompiler_dDriver_dOwner_dsplitDataNames dtb__37)))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DRecord (dtb__47, dtb__48, dtb__49, dtb__50, dtb__51, dtb__52, dtb__53, dtb__54) -> (Base_dList.C_Base_dList_dList_Cons (dtb__47, (v_Vuna_dCompiler_dDriver_dOwner_dsplitDataNames dtb__37)))
  | _ -> (v_Vuna_dCompiler_dDriver_dOwner_dsplitDataNames dtb__37)
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 56 "Vuna/Compiler/Driver/Owner.vuna"
let v_Vuna_dCompiler_dDriver_dOwner_dheadClassName = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__55, dtb__56) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__55))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp (dtb__57, dtb__58, dtb__59) -> (match dtb__57 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__60, dtb__61) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__60))
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
))

# 76 "Vuna/Compiler/Driver/Owner.vuna"
let v_Vuna_dCompiler_dDriver_dOwner_dhasFieldRecordTypeExpr = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (mc0, v_Vuna_dCompiler_dDriver_dOwner_dsplitNoSpan))
  | _ -> (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (mc0, v_Vuna_dCompiler_dDriver_dOwner_dsplitNoSpan)), ((Base_dList.v_Base_dList_dmap (fun p -> (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (p, v_Vuna_dCompiler_dDriver_dOwner_dsplitNoSpan)))) mc1), v_Vuna_dCompiler_dDriver_dOwner_dsplitNoSpan))
))

# 81 "Vuna/Compiler/Driver/Owner.vuna"
let v_Vuna_dCompiler_dDriver_dOwner_dhasFieldOwnerOf = (fun owner dname params f -> ((fun fname -> ((fun fty -> ((fun label -> ((fun head -> { Base_dPair.f_Base_dPair_dPair_first = ((Vuna_dCompiler_dElab_dInstName.v_Vuna_dCompiler_dElab_dInstName_dinstanceName "Base.Record.HasField") head); Base_dPair.f_Base_dPair_dPair_second = owner }) (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar ("Base.Record.HasField", v_Vuna_dCompiler_dDriver_dOwner_dsplitNoSpan)), (Base_dList.C_Base_dList_dList_Cons (label, (Base_dList.C_Base_dList_dList_Cons (((v_Vuna_dCompiler_dDriver_dOwner_dhasFieldRecordTypeExpr dname) params), (Base_dList.C_Base_dList_dList_Cons (fty, Base_dList.C_Base_dList_dList_Nil)))))), v_Vuna_dCompiler_dDriver_dOwner_dsplitNoSpan)))) (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar ("Base.Field.Field", v_Vuna_dCompiler_dDriver_dOwner_dsplitNoSpan)), (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EStr (fname, v_Vuna_dCompiler_dDriver_dOwner_dsplitNoSpan)), Base_dList.C_Base_dList_dList_Nil)), v_Vuna_dCompiler_dDriver_dOwner_dsplitNoSpan)))) (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dfieldType f))) (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dfieldName f)))

# 92 "Vuna/Compiler/Driver/Owner.vuna"
let rec v_Vuna_dCompiler_dDriver_dOwner_dsplitHasFieldOwners = (fun mc0 mc1 mc2 mc3 -> (match mc3 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__62, dtb__63) -> (Base_dList.C_Base_dList_dList_Cons (((((v_Vuna_dCompiler_dDriver_dOwner_dhasFieldOwnerOf mc0) mc1) mc2) dtb__62), ((((v_Vuna_dCompiler_dDriver_dOwner_dsplitHasFieldOwners mc0) mc1) mc2) dtb__63)))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 97 "Vuna/Compiler/Driver/Owner.vuna"
let rec v_Vuna_dCompiler_dDriver_dOwner_dsplitDerivedOwners = (fun mc0 mc1 mc2 mc3 -> (match mc3 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__64, dtb__65) -> (Base_dList.C_Base_dList_dList_Cons ({ Base_dPair.f_Base_dPair_dPair_first = ((Vuna_dCompiler_dElab_dInstName.v_Vuna_dCompiler_dElab_dInstName_dinstanceName dtb__64) ((((Vuna_dCompiler_dElab_dDerive.v_Vuna_dCompiler_dElab_dDerive_dinstHead dtb__64) mc1) mc2) v_Vuna_dCompiler_dDriver_dOwner_dsplitNoSpan)); Base_dPair.f_Base_dPair_dPair_second = mc0 }, ((((v_Vuna_dCompiler_dDriver_dOwner_dsplitDerivedOwners mc0) mc1) mc2) dtb__65)))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 65 "Vuna/Compiler/Driver/Owner.vuna"
let v_Vuna_dCompiler_dDriver_dOwner_dsplitInstanceOwnerOf = (fun mc0 mc1 -> (match mc1 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DRecord (dtb__66, dtb__67, dtb__68, dtb__69, dtb__70, dtb__71, dtb__72, dtb__73) -> ((Base_dList.v_Base_dList_dappend ((((v_Vuna_dCompiler_dDriver_dOwner_dsplitDerivedOwners mc0) dtb__66) dtb__67) dtb__69)) ((((v_Vuna_dCompiler_dDriver_dOwner_dsplitHasFieldOwners mc0) dtb__66) dtb__67) dtb__68))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DData (dtb__74, dtb__75, dtb__76, dtb__77, dtb__78, dtb__79, dtb__80, dtb__81, dtb__82) -> ((((v_Vuna_dCompiler_dDriver_dOwner_dsplitDerivedOwners mc0) dtb__74) dtb__75) dtb__78)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DInstance (dtb__83, dtb__84, dtb__85, dtb__86) -> (match (v_Vuna_dCompiler_dDriver_dOwner_dheadClassName dtb__84) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__87) -> (Base_dList.C_Base_dList_dList_Cons ({ Base_dPair.f_Base_dPair_dPair_first = ((Vuna_dCompiler_dElab_dInstName.v_Vuna_dCompiler_dElab_dInstName_dinstanceName dtb__87) dtb__84); Base_dPair.f_Base_dPair_dPair_second = mc0 }, Base_dList.C_Base_dList_dList_Nil))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
)
  | _ -> Base_dList.C_Base_dList_dList_Nil
))

# 105 "Vuna/Compiler/Driver/Owner.vuna"
let v_Vuna_dCompiler_dDriver_dOwner_dsplitTraitDefOwnerOf = (fun mc0 mc1 -> (match mc1 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DTrait (dtb__88, dtb__89, dtb__90, dtb__91, dtb__92) -> ((Base_dList.v_Base_dList_dmap (fun m -> { Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dtraitMethodName m); Base_dPair.f_Base_dPair_dPair_second = mc0 })) dtb__91)
  | _ -> Base_dList.C_Base_dList_dList_Nil
))

# 110 "Vuna/Compiler/Driver/Owner.vuna"
let v_Vuna_dCompiler_dDriver_dOwner_dsplitTraitDataOwnerOf = (fun mc0 mc1 -> (match mc1 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DTrait (dtb__93, dtb__94, dtb__95, dtb__96, dtb__97) -> (Base_dList.C_Base_dList_dList_Cons ({ Base_dPair.f_Base_dPair_dPair_first = ("Dict_" ^ dtb__93); Base_dPair.f_Base_dPair_dPair_second = mc0 }, Base_dList.C_Base_dList_dList_Nil))
  | _ -> Base_dList.C_Base_dList_dList_Nil
))

# 114 "Vuna/Compiler/Driver/Owner.vuna"
let rec v_Vuna_dCompiler_dDriver_dOwner_dsplitInstanceOwnersGo = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__98, dtb__99) -> ((Base_dList.v_Base_dList_dappend ((v_Vuna_dCompiler_dDriver_dOwner_dsplitInstanceOwnerOf mc0) dtb__98)) ((v_Vuna_dCompiler_dDriver_dOwner_dsplitInstanceOwnersGo mc0) dtb__99))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 119 "Vuna/Compiler/Driver/Owner.vuna"
let v_Vuna_dCompiler_dDriver_dOwner_dsplitOwnerEntriesOf = (fun owner decls -> ((Base_dList.v_Base_dList_dappend ((Base_dList.v_Base_dList_dmap (fun n -> { Base_dPair.f_Base_dPair_dPair_first = n; Base_dPair.f_Base_dPair_dPair_second = owner })) (v_Vuna_dCompiler_dDriver_dOwner_dsplitDeclNames decls))) ((Base_dList.v_Base_dList_dappend ((v_Vuna_dCompiler_dDriver_dOwner_dsplitInstanceOwnersGo owner) decls)) ((Base_dList.v_Base_dList_dconcatMap (v_Vuna_dCompiler_dDriver_dOwner_dsplitTraitDefOwnerOf owner)) decls))))

# 124 "Vuna/Compiler/Driver/Owner.vuna"
let v_Vuna_dCompiler_dDriver_dOwner_dsplitDataOwnerEntriesOf = (fun owner decls -> ((Base_dList.v_Base_dList_dappend ((Base_dList.v_Base_dList_dmap (fun n -> { Base_dPair.f_Base_dPair_dPair_first = n; Base_dPair.f_Base_dPair_dPair_second = owner })) (v_Vuna_dCompiler_dDriver_dOwner_dsplitDataNames decls))) ((Base_dList.v_Base_dList_dconcatMap (v_Vuna_dCompiler_dDriver_dOwner_dsplitTraitDataOwnerOf owner)) decls)))

# 129 "Vuna/Compiler/Driver/Owner.vuna"
let rec v_Vuna_dCompiler_dDriver_dOwner_dsplitOwnerEntriesOfModules = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__100, dtb__101) -> (match dtb__100 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__102; Base_dPair.f_Base_dPair_dPair_second = dtb__103 } -> ((Base_dList.v_Base_dList_dappend ((v_Vuna_dCompiler_dDriver_dOwner_dsplitOwnerEntriesOf dtb__102) dtb__103)) (v_Vuna_dCompiler_dDriver_dOwner_dsplitOwnerEntriesOfModules dtb__101))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 134 "Vuna/Compiler/Driver/Owner.vuna"
let rec v_Vuna_dCompiler_dDriver_dOwner_dsplitDataOwnerEntriesOfModules = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__104, dtb__105) -> (match dtb__104 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__106; Base_dPair.f_Base_dPair_dPair_second = dtb__107 } -> ((Base_dList.v_Base_dList_dappend ((v_Vuna_dCompiler_dDriver_dOwner_dsplitDataOwnerEntriesOf dtb__106) dtb__107)) (v_Vuna_dCompiler_dDriver_dOwner_dsplitDataOwnerEntriesOfModules dtb__105))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 149 "Vuna/Compiler/Driver/Owner.vuna"
let v_Vuna_dCompiler_dDriver_dOwner_dsplitMetaOf = (fun modules entryDecls -> ((fun knownModules -> ((fun defOwners -> ((fun dataOwners -> { f_Vuna_dCompiler_dDriver_dOwner_dSplitMeta_smDefOwners = defOwners; f_Vuna_dCompiler_dDriver_dOwner_dSplitMeta_smDataOwners = dataOwners; f_Vuna_dCompiler_dDriver_dOwner_dSplitMeta_smKnownModules = knownModules; f_Vuna_dCompiler_dDriver_dOwner_dSplitMeta_smDefOwnerT = ((Base_dHashMap.v_Base_dHashMap_dfromList Base_dString.v_Hashable_uString) defOwners); f_Vuna_dCompiler_dDriver_dOwner_dSplitMeta_smDataOwnerT = ((Base_dHashMap.v_Base_dHashMap_dfromList Base_dString.v_Hashable_uString) dataOwners) }) ((Base_dList.v_Base_dList_dappend (v_Vuna_dCompiler_dDriver_dOwner_dsplitDataOwnerEntriesOfModules modules)) ((v_Vuna_dCompiler_dDriver_dOwner_dsplitDataOwnerEntriesOf v_Vuna_dCompiler_dDriver_dOwner_dentryOwner) entryDecls)))) ((Base_dList.v_Base_dList_dappend (v_Vuna_dCompiler_dDriver_dOwner_dsplitOwnerEntriesOfModules modules)) ((v_Vuna_dCompiler_dDriver_dOwner_dsplitOwnerEntriesOf v_Vuna_dCompiler_dDriver_dOwner_dentryOwner) entryDecls)))) ((Base_dList.v_Base_dList_dmap (fun p -> (Base_dPair.v_Base_dPair_dfirstOf p))) modules)))

# 161 "Vuna/Compiler/Driver/Owner.vuna"
let v_Vuna_dCompiler_dDriver_dOwner_dlookupModuleOf = (fun pairs name -> ((Base_dList.v_Base_dList_dlookupPair name) pairs))

# 164 "Vuna/Compiler/Driver/Owner.vuna"
let v_Vuna_dCompiler_dDriver_dOwner_dknownModuleOrErr = (fun knownModules what name -> ((fun prefix -> (if ((Base_dList.v_Base_dList_dmemName prefix) knownModules) then (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (prefix)) else (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicInternal (String.concat "" ["DT split: `"; what; "` "; name; " has module prefix `"; prefix; "` but no such module"])))) (v_Vuna_dCompiler_dDriver_dOwner_dmodulePrefixOfName name)))

# 171 "Vuna/Compiler/Driver/Owner.vuna"
let v_Vuna_dCompiler_dDriver_dOwner_dsplitDataOwnerOf = (fun meta d -> (match ((((Base_dHashMap.v_Base_dHashMap_dlookup Base_dString.v_Hashable_uString) Base_dString.v_Eq_uString) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataName d)) (meta).f_Vuna_dCompiler_dDriver_dOwner_dSplitMeta_smDataOwnerT) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__108) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__108))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (if (Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dcontainsDot (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataName d)) then (((v_Vuna_dCompiler_dDriver_dOwner_dknownModuleOrErr (meta).f_Vuna_dCompiler_dDriver_dOwner_dSplitMeta_smKnownModules) "data") (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataName d)) else (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicInternal (String.concat "" ["DT split: cannot determine module for data `"; (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataName d); "`"])))
  | _ -> failwith "DT: impossible branch"
))

# 181 "Vuna/Compiler/Driver/Owner.vuna"
let v_Vuna_dCompiler_dDriver_dOwner_disSyntheticInternalName = (fun name -> (if (name = Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_dmainShowDefName) then true else ((Base_dString.v_Base_dString_dstartsWith "@vuna@") name)))

# 184 "Vuna/Compiler/Driver/Owner.vuna"
let v_Vuna_dCompiler_dDriver_dOwner_dsplitDefOwnerOf = (fun meta name -> (match ((((Base_dHashMap.v_Base_dHashMap_dlookup Base_dString.v_Hashable_uString) Base_dString.v_Eq_uString) name) (meta).f_Vuna_dCompiler_dDriver_dOwner_dSplitMeta_smDefOwnerT) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__109) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__109))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (if (Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dcontainsDot name) then (((v_Vuna_dCompiler_dDriver_dOwner_dknownModuleOrErr (meta).f_Vuna_dCompiler_dDriver_dOwner_dSplitMeta_smKnownModules) "definition") name) else (if (v_Vuna_dCompiler_dDriver_dOwner_disSyntheticInternalName name) then (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (v_Vuna_dCompiler_dDriver_dOwner_dentryOwner)) else (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicInternal (String.concat "" ["DT split: cannot determine module for definition `"; name; "`"]))))
  | _ -> failwith "DT: impossible branch"
))

# 192 "Vuna/Compiler/Driver/Owner.vuna"
let rec v_Vuna_dCompiler_dDriver_dOwner_dnameOwnerPairsOfDefs = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__110, dtb__111) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((v_Vuna_dCompiler_dDriver_dOwner_dsplitDefOwnerOf mc0) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefName dtb__110))) (fun o -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((v_Vuna_dCompiler_dDriver_dOwner_dnameOwnerPairsOfDefs mc0) dtb__111)) (fun ps -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Base_dList.C_Base_dList_dList_Cons ({ Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefName dtb__110); Base_dPair.f_Base_dPair_dPair_second = o }, ps))))))))
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (Base_dList.C_Base_dList_dList_Nil))
  | _ -> failwith "DT: impossible branch"
))

# 198 "Vuna/Compiler/Driver/Owner.vuna"
let rec v_Vuna_dCompiler_dDriver_dOwner_dnameOwnerPairsOfDatas = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__112, dtb__113) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((v_Vuna_dCompiler_dDriver_dOwner_dsplitDataOwnerOf mc0) dtb__112)) (fun o -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((v_Vuna_dCompiler_dDriver_dOwner_dnameOwnerPairsOfDatas mc0) dtb__113)) (fun ps -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Base_dList.C_Base_dList_dList_Cons ({ Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataName dtb__112); Base_dPair.f_Base_dPair_dPair_second = o }, ps))))))))
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (Base_dList.C_Base_dList_dList_Nil))
  | _ -> failwith "DT: impossible branch"
))
