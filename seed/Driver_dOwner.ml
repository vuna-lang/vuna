open Vuna_runtime
type t_SplitMeta = { f_SplitMeta_smDefOwners : (string, string) B_dData_dPair.t_Pair B_dData_dList.t_List; f_SplitMeta_smDataOwners : (string, string) B_dData_dPair.t_Pair B_dData_dList.t_List; f_SplitMeta_smKnownModules : string B_dData_dList.t_List; f_SplitMeta_smDefOwnerT : (string, string) B_dContainer_dHashMap.t_HashMap; f_SplitMeta_smDataOwnerT : (string, string) B_dContainer_dHashMap.t_HashMap }

# 25 "Vuna/Compiler/Driver/Owner.vuna"
let v_splitNoSpan = { Base_dSource.f_Span_spanFile = ""; Base_dSource.f_Span_spanStartLine = 0; Base_dSource.f_Span_spanStartCol = 0; Base_dSource.f_Span_spanEndLine = 0; Base_dSource.f_Span_spanEndCol = 0; Base_dSource.f_Span_spanStartOffset = 0; Base_dSource.f_Span_spanEndOffset = 0 }

# 29 "Vuna/Compiler/Driver/Owner.vuna"
let v_entryOwner = "Main"

# 33 "Vuna/Compiler/Driver/Owner.vuna"
let v_modulePrefixOfName = (fun (name : string) -> (Base_dSource.v_prefixOfName name))

# 39 "Vuna/Compiler/Driver/Owner.vuna"
let rec v_splitDeclNames = (fun (mc0 : Frontend_dAst.t_Decl B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__0, dtb__1) -> (match dtb__0 with
  | Frontend_dAst.C_Decl_DSig (dtb__2, dtb__3, dtb__4, dtb__5) -> (B_dData_dList.C_List__x58__x58_ (dtb__2, (v_splitDeclNames dtb__1)))
  | Frontend_dAst.C_Decl_DExtern (dtb__6, dtb__7, dtb__8, dtb__9) -> (B_dData_dList.C_List__x58__x58_ (dtb__6, (v_splitDeclNames dtb__1)))
  | Frontend_dAst.C_Decl_DFun (dtb__10, dtb__11, dtb__12, dtb__13) -> (B_dData_dList.C_List__x58__x58_ (dtb__10, (v_splitDeclNames dtb__1)))
  | Frontend_dAst.C_Decl_DData (dtb__14, dtb__15, dtb__16, dtb__17, dtb__18, dtb__19, dtb__20, dtb__21, dtb__22) -> (B_dData_dList.C_List__x58__x58_ (dtb__14, (v_splitDeclNames dtb__1)))
  | Frontend_dAst.C_Decl_DRecord (dtb__23, dtb__24, dtb__25, dtb__26, dtb__27, dtb__28, dtb__29, dtb__30) -> (B_dData_dList.C_List__x58__x58_ (dtb__23, (v_splitDeclNames dtb__1)))
  | Frontend_dAst.C_Decl_DTrait (dtb__31, dtb__32, dtb__33, dtb__34, dtb__35) -> (B_dData_dList.C_List__x58__x58_ (dtb__31, (v_splitDeclNames dtb__1)))
  | _ -> (v_splitDeclNames dtb__1)
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 51 "Vuna/Compiler/Driver/Owner.vuna"
let rec v_splitDataNames = (fun (mc0 : Frontend_dAst.t_Decl B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__36, dtb__37) -> (match dtb__36 with
  | Frontend_dAst.C_Decl_DData (dtb__38, dtb__39, dtb__40, dtb__41, dtb__42, dtb__43, dtb__44, dtb__45, dtb__46) -> (B_dData_dList.C_List__x58__x58_ (dtb__38, (v_splitDataNames dtb__37)))
  | Frontend_dAst.C_Decl_DRecord (dtb__47, dtb__48, dtb__49, dtb__50, dtb__51, dtb__52, dtb__53, dtb__54) -> (B_dData_dList.C_List__x58__x58_ (dtb__47, (v_splitDataNames dtb__37)))
  | _ -> (v_splitDataNames dtb__37)
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 59 "Vuna/Compiler/Driver/Owner.vuna"
let v_headClassName = (fun (mc0 : Frontend_dAst.t_Expr) -> (match mc0 with
  | Frontend_dAst.C_Expr_EVar (dtb__55, dtb__56) -> (B_dData_dMaybe.C_Maybe_Just (dtb__55))
  | Frontend_dAst.C_Expr_EApp (dtb__57, dtb__58, dtb__59) -> (match dtb__57 with
  | Frontend_dAst.C_Expr_EVar (dtb__60, dtb__61) -> (B_dData_dMaybe.C_Maybe_Just (dtb__60))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
))

# 82 "Vuna/Compiler/Driver/Owner.vuna"
let v_hasFieldRecordTypeExpr = (fun (mc0 : string) (mc1 : string B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List_Nil -> (Frontend_dAst.C_Expr_EVar (mc0, (Frontend_dAst.v_detachedNodeRef v_splitNoSpan)))
  | _ -> (Frontend_dAst.C_Expr_EApp ((Frontend_dAst.C_Expr_EVar (mc0, (Frontend_dAst.v_detachedNodeRef v_splitNoSpan))), ((B_dData_dList.v_map (fun (p : string) -> (Frontend_dAst.C_Expr_EVar (p, (Frontend_dAst.v_detachedNodeRef v_splitNoSpan))))) mc1), (Frontend_dAst.v_detachedNodeRef v_splitNoSpan)))
))

# 90 "Vuna/Compiler/Driver/Owner.vuna"
let v_hasFieldOwnerOf = (fun (owner : string) (dname : string) (params : string B_dData_dList.t_List) (f : Frontend_dAst.t_Field) -> (let fname = (Frontend_dAst.v_fieldName f) in (let fty = (Frontend_dAst.v_fieldType f) in (let label = (Frontend_dAst.C_Expr_EApp ((Frontend_dAst.C_Expr_EVar (Base_dIntrinsics.v_hasFieldLabelName, (Frontend_dAst.v_detachedNodeRef v_splitNoSpan))), (B_dData_dList.C_List__x58__x58_ ((Frontend_dAst.C_Expr_EStr (fname, (Frontend_dAst.v_detachedNodeRef v_splitNoSpan))), B_dData_dList.C_List_Nil)), (Frontend_dAst.v_detachedNodeRef v_splitNoSpan))) in (let head = (Frontend_dAst.C_Expr_EApp ((Frontend_dAst.C_Expr_EVar (Base_dIntrinsics.v_hasFieldTraitName, (Frontend_dAst.v_detachedNodeRef v_splitNoSpan))), (B_dData_dList.C_List__x58__x58_ (label, (B_dData_dList.C_List__x58__x58_ (((v_hasFieldRecordTypeExpr dname) params), (B_dData_dList.C_List__x58__x58_ (fty, B_dData_dList.C_List_Nil)))))), (Frontend_dAst.v_detachedNodeRef v_splitNoSpan))) in { B_dData_dPair.f_Pair_first = ((Elab_dInstName.v_instanceSymbol Base_dIntrinsics.v_hasFieldTraitName) (Frontend_dRast_dBridge.v_toRastExpr head)); B_dData_dPair.f_Pair_second = owner })))))

# 107 "Vuna/Compiler/Driver/Owner.vuna"
let rec v_splitHasFieldOwners = (fun (mc0 : string) (mc1 : string) (mc2 : string B_dData_dList.t_List) (mc3 : Frontend_dAst.t_Field B_dData_dList.t_List) -> (match mc3 with
  | B_dData_dList.C_List__x58__x58_ (dtb__62, dtb__63) -> (B_dData_dList.C_List__x58__x58_ (((((v_hasFieldOwnerOf mc0) mc1) mc2) dtb__62), ((((v_splitHasFieldOwners mc0) mc1) mc2) dtb__63)))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 112 "Vuna/Compiler/Driver/Owner.vuna"
let rec v_splitDerivedOwners = (fun (mc0 : string) (mc1 : string) (mc2 : string B_dData_dList.t_List) (mc3 : string B_dData_dList.t_List) -> (match mc3 with
  | B_dData_dList.C_List__x58__x58_ (dtb__64, dtb__65) -> (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = ((Elab_dInstName.v_instanceSymbol dtb__64) ((((Elab_dDerive.v_instHead dtb__64) mc1) mc2) v_splitNoSpan)); B_dData_dPair.f_Pair_second = mc0 }, ((((v_splitDerivedOwners mc0) mc1) mc2) dtb__65)))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 69 "Vuna/Compiler/Driver/Owner.vuna"
let v_splitInstanceOwnerOf = (fun (mc0 : string) (mc1 : Frontend_dAst.t_Decl) -> (match mc1 with
  | Frontend_dAst.C_Decl_DRecord (dtb__66, dtb__67, dtb__68, dtb__69, dtb__70, dtb__71, dtb__72, dtb__73) -> ((B_dData_dList.v_append ((((v_splitDerivedOwners mc0) dtb__66) dtb__67) dtb__69)) ((((v_splitHasFieldOwners mc0) dtb__66) dtb__67) dtb__68))
  | Frontend_dAst.C_Decl_DData (dtb__74, dtb__75, dtb__76, dtb__77, dtb__78, dtb__79, dtb__80, dtb__81, dtb__82) -> ((((v_splitDerivedOwners mc0) dtb__74) dtb__75) dtb__78)
  | Frontend_dAst.C_Decl_DInstance (dtb__83, dtb__84, dtb__85, dtb__86) -> (match (v_headClassName dtb__84) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__87) -> (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = ((Elab_dInstName.v_instanceSymbol dtb__87) (Frontend_dRast_dBridge.v_toRastExpr dtb__84)); B_dData_dPair.f_Pair_second = mc0 }, B_dData_dList.C_List_Nil))
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
)
  | _ -> B_dData_dList.C_List_Nil
))

# 120 "Vuna/Compiler/Driver/Owner.vuna"
let v_splitTraitDefOwnerOf = (fun (mc0 : string) (mc1 : Frontend_dAst.t_Decl) -> (match mc1 with
  | Frontend_dAst.C_Decl_DTrait (dtb__88, dtb__89, dtb__90, dtb__91, dtb__92) -> ((B_dData_dList.v_map (fun (m : Frontend_dAst.t_TraitMethod) -> { B_dData_dPair.f_Pair_first = (Frontend_dAst.v_traitMethodName m); B_dData_dPair.f_Pair_second = mc0 })) dtb__91)
  | _ -> B_dData_dList.C_List_Nil
))

# 125 "Vuna/Compiler/Driver/Owner.vuna"
let v_splitTraitDataOwnerOf = (fun (mc0 : string) (mc1 : Frontend_dAst.t_Decl) -> (match mc1 with
  | Frontend_dAst.C_Decl_DTrait (dtb__93, dtb__94, dtb__95, dtb__96, dtb__97) -> (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = ("Dict_" ^ dtb__93); B_dData_dPair.f_Pair_second = mc0 }, B_dData_dList.C_List_Nil))
  | _ -> B_dData_dList.C_List_Nil
))

# 129 "Vuna/Compiler/Driver/Owner.vuna"
let rec v_splitInstanceOwnersGo = (fun (mc0 : string) (mc1 : Frontend_dAst.t_Decl B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__98, dtb__99) -> ((B_dData_dList.v_append ((v_splitInstanceOwnerOf mc0) dtb__98)) ((v_splitInstanceOwnersGo mc0) dtb__99))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 134 "Vuna/Compiler/Driver/Owner.vuna"
let v_splitOwnerEntriesOf = (fun (owner : string) (decls : Frontend_dAst.t_Decl B_dData_dList.t_List) -> ((B_dData_dList.v_append ((B_dData_dList.v_map (fun (n : string) -> { B_dData_dPair.f_Pair_first = n; B_dData_dPair.f_Pair_second = owner })) (v_splitDeclNames decls))) ((B_dData_dList.v_append ((v_splitInstanceOwnersGo owner) decls)) ((B_dData_dList.v_concatMap (v_splitTraitDefOwnerOf owner)) decls))))

# 140 "Vuna/Compiler/Driver/Owner.vuna"
let v_splitDataOwnerEntriesOf = (fun (owner : string) (decls : Frontend_dAst.t_Decl B_dData_dList.t_List) -> ((B_dData_dList.v_append ((B_dData_dList.v_map (fun (n : string) -> { B_dData_dPair.f_Pair_first = n; B_dData_dPair.f_Pair_second = owner })) (v_splitDataNames decls))) ((B_dData_dList.v_concatMap (v_splitTraitDataOwnerOf owner)) decls)))

# 146 "Vuna/Compiler/Driver/Owner.vuna"
let rec v_splitOwnerEntriesOfModules = (fun (mc0 : (string, Frontend_dAst.t_Decl B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__100, dtb__101) -> (match dtb__100 with
  | { B_dData_dPair.f_Pair_first = dtb__102; B_dData_dPair.f_Pair_second = dtb__103 } -> ((B_dData_dList.v_append ((v_splitOwnerEntriesOf dtb__102) dtb__103)) (v_splitOwnerEntriesOfModules dtb__101))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 151 "Vuna/Compiler/Driver/Owner.vuna"
let rec v_splitDataOwnerEntriesOfModules = (fun (mc0 : (string, Frontend_dAst.t_Decl B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__104, dtb__105) -> (match dtb__104 with
  | { B_dData_dPair.f_Pair_first = dtb__106; B_dData_dPair.f_Pair_second = dtb__107 } -> ((B_dData_dList.v_append ((v_splitDataOwnerEntriesOf dtb__106) dtb__107)) (v_splitDataOwnerEntriesOfModules dtb__105))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 166 "Vuna/Compiler/Driver/Owner.vuna"
let v_splitMetaOf = (fun (modules : (string, Frontend_dAst.t_Decl B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (entryDecls : Frontend_dAst.t_Decl B_dData_dList.t_List) -> (let knownModules = ((B_dData_dList.v_map (fun (p : (string, Frontend_dAst.t_Decl B_dData_dList.t_List) B_dData_dPair.t_Pair) -> (B_dData_dPair.v_firstOf p))) modules) in (let defOwners = ((B_dData_dList.v_append (v_splitOwnerEntriesOfModules modules)) ((v_splitOwnerEntriesOf v_entryOwner) entryDecls)) in (let dataOwners = ((B_dData_dList.v_append (v_splitDataOwnerEntriesOfModules modules)) ((v_splitDataOwnerEntriesOf v_entryOwner) entryDecls)) in { f_SplitMeta_smDefOwners = defOwners; f_SplitMeta_smDataOwners = dataOwners; f_SplitMeta_smKnownModules = knownModules; f_SplitMeta_smDefOwnerT = (((B_dContainer_dHashMap.v_fromList B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) defOwners); f_SplitMeta_smDataOwnerT = (((B_dContainer_dHashMap.v_fromList B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) dataOwners) }))))

# 183 "Vuna/Compiler/Driver/Owner.vuna"
let v_lookupModuleOf = (fun (pairs : (string, string) B_dData_dPair.t_Pair B_dData_dList.t_List) (name : string) -> ((B_dData_dList.v_lookupPair name) pairs))

# 186 "Vuna/Compiler/Driver/Owner.vuna"
let v_knownModuleOrErr = (fun (knownModules : string B_dData_dList.t_List) (what : string) (name : string) -> (let prefix = (v_modulePrefixOfName name) in (if ((B_dData_dList.v_memName prefix) knownModules) then (Base_dDiag.C_Check_OkC (prefix)) else (Base_dDiag.v_icInternal (String.concat "" ["DT split: `"; what; "` "; name; " has module prefix `"; prefix; "` but no such module"])))))

# 195 "Vuna/Compiler/Driver/Owner.vuna"
let v_splitDataOwnerOf = (fun (meta : t_SplitMeta) (d : Elab_dTypes.t_DtData) -> (match ((((B_dContainer_dHashMap.v_lookup B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) (Elab_dTypes.v_dtDataName d)) (meta).f_SplitMeta_smDataOwnerT) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__108) -> (Base_dDiag.C_Check_OkC (dtb__108))
  | B_dData_dMaybe.C_Maybe_Nothing -> (if (Base_dSource.v_containsDot (Elab_dTypes.v_dtDataName d)) then (((v_knownModuleOrErr (meta).f_SplitMeta_smKnownModules) "data") (Elab_dTypes.v_dtDataName d)) else (Base_dDiag.v_icInternal (String.concat "" ["DT split: cannot determine module for data `"; (Elab_dTypes.v_dtDataName d); "`"])))
  | _ -> failwith "DT: impossible branch"
))

# 208 "Vuna/Compiler/Driver/Owner.vuna"
let v_isSyntheticInternalName = (fun (name : string) -> (if (name = Base_dIntrinsics.v_mainShowDefName) then true else ((B_dData_dString.v_startsWith "@vuna@") name)))

# 211 "Vuna/Compiler/Driver/Owner.vuna"
let v_splitDefOwnerOf = (fun (meta : t_SplitMeta) (name : string) -> (match ((((B_dContainer_dHashMap.v_lookup B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) name) (meta).f_SplitMeta_smDefOwnerT) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__109) -> (Base_dDiag.C_Check_OkC (dtb__109))
  | B_dData_dMaybe.C_Maybe_Nothing -> (if (Base_dSource.v_containsDot name) then (((v_knownModuleOrErr (meta).f_SplitMeta_smKnownModules) "definition") name) else (if (v_isSyntheticInternalName name) then (Base_dDiag.C_Check_OkC (v_entryOwner)) else (Base_dDiag.v_icInternal (String.concat "" ["DT split: cannot determine module for definition `"; name; "`"]))))
  | _ -> failwith "DT: impossible branch"
))

# 223 "Vuna/Compiler/Driver/Owner.vuna"
let rec v_nameOwnerPairsOfDefs = (fun (mc0 : t_SplitMeta) (mc1 : Elab_dTypes.t_DtDef B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__110, dtb__111) -> ((Base_dCommon.v_bind ((v_splitDefOwnerOf mc0) (Elab_dTypes.v_dtDefName dtb__110))) (fun (o : string) -> ((Base_dCommon.v_bind ((v_nameOwnerPairsOfDefs mc0) dtb__111)) (fun (ps : (string, string) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = (Elab_dTypes.v_dtDefName dtb__110); B_dData_dPair.f_Pair_second = o }, ps))))))))
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (B_dData_dList.C_List_Nil))
  | _ -> failwith "DT: impossible branch"
))

# 230 "Vuna/Compiler/Driver/Owner.vuna"
let rec v_nameOwnerPairsOfDatas = (fun (mc0 : t_SplitMeta) (mc1 : Elab_dTypes.t_DtData B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__112, dtb__113) -> ((Base_dCommon.v_bind ((v_splitDataOwnerOf mc0) dtb__112)) (fun (o : string) -> ((Base_dCommon.v_bind ((v_nameOwnerPairsOfDatas mc0) dtb__113)) (fun (ps : (string, string) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = (Elab_dTypes.v_dtDataName dtb__112); B_dData_dPair.f_Pair_second = o }, ps))))))))
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (B_dData_dList.C_List_Nil))
  | _ -> failwith "DT: impossible branch"
))
