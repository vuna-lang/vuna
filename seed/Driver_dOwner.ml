open Vuna_runtime
type t_SplitMeta = { f_SplitMeta_smDefOwners : (string, string) B_dData_dPair.t_Pair B_dData_dList.t_List; f_SplitMeta_smDataOwners : (string, string) B_dData_dPair.t_Pair B_dData_dList.t_List; f_SplitMeta_smKnownModules : string B_dData_dList.t_List; f_SplitMeta_smDefOwnerT : (string, string) B_dContainer_dHashMap.t_HashMap; f_SplitMeta_smDataOwnerT : (string, string) B_dContainer_dHashMap.t_HashMap }

# 24 "Vuna/Compiler/Driver/Owner.vuna"
let v_splitNoSpan = { Base_dSource.f_Span_spanFile = ""; Base_dSource.f_Span_spanStartLine = 0; Base_dSource.f_Span_spanStartCol = 0; Base_dSource.f_Span_spanEndLine = 0; Base_dSource.f_Span_spanEndCol = 0; Base_dSource.f_Span_spanStartOffset = 0; Base_dSource.f_Span_spanEndOffset = 0 }

# 28 "Vuna/Compiler/Driver/Owner.vuna"
let v_entryOwner = "Main"

# 32 "Vuna/Compiler/Driver/Owner.vuna"
let v_modulePrefixOfName = (fun (dtb_u_u1 : string) -> (Base_dSource.v_prefixOfName dtb_u_u1))

# 38 "Vuna/Compiler/Driver/Owner.vuna"
let[@tail_mod_cons] rec v_splitDeclNames = (fun (dtb_u_u2 : Frontend_dAst.t_Decl B_dData_dList.t_List) -> (match dtb_u_u2 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u3, dtb_u_u4) -> (match dtb_u_u3 with
  | Frontend_dAst.C_Decl_DSig (dtb_u_u5, dtb_u_u6, dtb_u_u7, dtb_u_u8) -> (B_dData_dList.C_List__x58__x58_ (dtb_u_u5, (v_splitDeclNames dtb_u_u4)))
  | Frontend_dAst.C_Decl_DExtern (dtb_u_u9, dtb_u_u10, dtb_u_u11, dtb_u_u12) -> (B_dData_dList.C_List__x58__x58_ (dtb_u_u9, (v_splitDeclNames dtb_u_u4)))
  | Frontend_dAst.C_Decl_DFun (dtb_u_u13, dtb_u_u14, dtb_u_u15, dtb_u_u16) -> (B_dData_dList.C_List__x58__x58_ (dtb_u_u13, (v_splitDeclNames dtb_u_u4)))
  | Frontend_dAst.C_Decl_DData (dtb_u_u17, dtb_u_u18, dtb_u_u19, dtb_u_u20, dtb_u_u21, dtb_u_u22, dtb_u_u23, dtb_u_u24, dtb_u_u25) -> (B_dData_dList.C_List__x58__x58_ (dtb_u_u17, (v_splitDeclNames dtb_u_u4)))
  | Frontend_dAst.C_Decl_DRecord (dtb_u_u26, dtb_u_u27, dtb_u_u28, dtb_u_u29, dtb_u_u30, dtb_u_u31, dtb_u_u32, dtb_u_u33) -> (B_dData_dList.C_List__x58__x58_ (dtb_u_u26, (v_splitDeclNames dtb_u_u4)))
  | Frontend_dAst.C_Decl_DTrait (dtb_u_u34, dtb_u_u35, dtb_u_u36, dtb_u_u37, dtb_u_u38) -> (B_dData_dList.C_List__x58__x58_ (dtb_u_u34, (v_splitDeclNames dtb_u_u4)))
  | _ -> (v_splitDeclNames dtb_u_u4)
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 50 "Vuna/Compiler/Driver/Owner.vuna"
let[@tail_mod_cons] rec v_splitDataNames = (fun (dtb_u_u39 : Frontend_dAst.t_Decl B_dData_dList.t_List) -> (match dtb_u_u39 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u40, dtb_u_u41) -> (match dtb_u_u40 with
  | Frontend_dAst.C_Decl_DData (dtb_u_u42, dtb_u_u43, dtb_u_u44, dtb_u_u45, dtb_u_u46, dtb_u_u47, dtb_u_u48, dtb_u_u49, dtb_u_u50) -> (B_dData_dList.C_List__x58__x58_ (dtb_u_u42, (v_splitDataNames dtb_u_u41)))
  | Frontend_dAst.C_Decl_DRecord (dtb_u_u51, dtb_u_u52, dtb_u_u53, dtb_u_u54, dtb_u_u55, dtb_u_u56, dtb_u_u57, dtb_u_u58) -> (B_dData_dList.C_List__x58__x58_ (dtb_u_u51, (v_splitDataNames dtb_u_u41)))
  | _ -> (v_splitDataNames dtb_u_u41)
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 58 "Vuna/Compiler/Driver/Owner.vuna"
let v_headClassName = (fun (dtb_u_u59 : Frontend_dAst.t_Expr) -> (match dtb_u_u59 with
  | Frontend_dAst.C_Expr_EVar (dtb_u_u60, dtb_u_u61) -> (B_dData_dMaybe.C_Maybe_Just (dtb_u_u60))
  | Frontend_dAst.C_Expr_EApp (dtb_u_u62, dtb_u_u63, dtb_u_u64) -> (match dtb_u_u62 with
  | Frontend_dAst.C_Expr_EVar (dtb_u_u65, dtb_u_u66) -> (B_dData_dMaybe.C_Maybe_Just (dtb_u_u65))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
))

# 81 "Vuna/Compiler/Driver/Owner.vuna"
let v_hasFieldRecordTypeExpr = (fun (dtb_u_u67 : string) (dtb_u_u68 : string B_dData_dList.t_List) -> (match dtb_u_u68 with
  | B_dData_dList.C_List_Nil -> (Frontend_dAst.C_Expr_EVar (dtb_u_u67, (Frontend_dAst.v_detachedNodeRef v_splitNoSpan)))
  | _ -> (Frontend_dAst.C_Expr_EApp ((Frontend_dAst.C_Expr_EVar (dtb_u_u67, (Frontend_dAst.v_detachedNodeRef v_splitNoSpan))), ((B_dData_dList.v_map (fun (dtb_u_u69 : string) -> (Frontend_dAst.C_Expr_EVar (dtb_u_u69, (Frontend_dAst.v_detachedNodeRef v_splitNoSpan))))) dtb_u_u68), (Frontend_dAst.v_detachedNodeRef v_splitNoSpan)))
))

# 89 "Vuna/Compiler/Driver/Owner.vuna"
let v_hasFieldOwnerOf = (fun (dtb_u_u70 : string) (dtb_u_u71 : string) (dtb_u_u72 : string B_dData_dList.t_List) (dtb_u_u73 : Frontend_dAst.t_Field) -> (let dtb_u_u74 = (Frontend_dAst.v_fieldName dtb_u_u73) in (let dtb_u_u75 = (Frontend_dAst.v_fieldType dtb_u_u73) in (let dtb_u_u76 = (Frontend_dAst.C_Expr_EApp ((Frontend_dAst.C_Expr_EVar (Base_dIntrinsics.v_hasFieldLabelName, (Frontend_dAst.v_detachedNodeRef v_splitNoSpan))), (B_dData_dList.C_List__x58__x58_ ((Frontend_dAst.C_Expr_EStr (dtb_u_u74, (Frontend_dAst.v_detachedNodeRef v_splitNoSpan))), B_dData_dList.C_List_Nil)), (Frontend_dAst.v_detachedNodeRef v_splitNoSpan))) in (let dtb_u_u77 = (Frontend_dAst.C_Expr_EApp ((Frontend_dAst.C_Expr_EVar (Base_dIntrinsics.v_hasFieldTraitName, (Frontend_dAst.v_detachedNodeRef v_splitNoSpan))), (B_dData_dList.C_List__x58__x58_ (dtb_u_u76, (B_dData_dList.C_List__x58__x58_ (((v_hasFieldRecordTypeExpr dtb_u_u71) dtb_u_u72), (B_dData_dList.C_List__x58__x58_ (dtb_u_u75, B_dData_dList.C_List_Nil)))))), (Frontend_dAst.v_detachedNodeRef v_splitNoSpan))) in { B_dData_dPair.f_Pair_first = ((Elab_dInstName.v_instanceSymbol Base_dIntrinsics.v_hasFieldTraitName) dtb_u_u77); B_dData_dPair.f_Pair_second = dtb_u_u70 })))))

# 106 "Vuna/Compiler/Driver/Owner.vuna"
let[@tail_mod_cons] rec v_splitHasFieldOwners = (fun (dtb_u_u78 : string) (dtb_u_u79 : string) (dtb_u_u80 : string B_dData_dList.t_List) (dtb_u_u81 : Frontend_dAst.t_Field B_dData_dList.t_List) -> (match dtb_u_u81 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u82, dtb_u_u83) -> (B_dData_dList.C_List__x58__x58_ (((((v_hasFieldOwnerOf dtb_u_u78) dtb_u_u79) dtb_u_u80) dtb_u_u82), ((((v_splitHasFieldOwners dtb_u_u78) dtb_u_u79) dtb_u_u80) dtb_u_u83)))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 111 "Vuna/Compiler/Driver/Owner.vuna"
let[@tail_mod_cons] rec v_splitDerivedOwners = (fun (dtb_u_u84 : string) (dtb_u_u85 : string) (dtb_u_u86 : string B_dData_dList.t_List) (dtb_u_u87 : string B_dData_dList.t_List) -> (match dtb_u_u87 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u88, dtb_u_u89) -> (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = ((Elab_dInstName.v_instanceSymbol dtb_u_u88) ((((Elab_dDerive.v_instHead dtb_u_u88) dtb_u_u85) dtb_u_u86) (Frontend_dAst.v_detachedNodeRef v_splitNoSpan))); B_dData_dPair.f_Pair_second = dtb_u_u84 }, ((((v_splitDerivedOwners dtb_u_u84) dtb_u_u85) dtb_u_u86) dtb_u_u89)))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 68 "Vuna/Compiler/Driver/Owner.vuna"
let v_splitInstanceOwnerOf = (fun (dtb_u_u90 : string) (dtb_u_u91 : Frontend_dAst.t_Decl) -> (match dtb_u_u91 with
  | Frontend_dAst.C_Decl_DRecord (dtb_u_u92, dtb_u_u93, dtb_u_u94, dtb_u_u95, dtb_u_u96, dtb_u_u97, dtb_u_u98, dtb_u_u99) -> ((B_dData_dList.v_append ((((v_splitDerivedOwners dtb_u_u90) dtb_u_u92) dtb_u_u93) dtb_u_u95)) ((((v_splitHasFieldOwners dtb_u_u90) dtb_u_u92) dtb_u_u93) dtb_u_u94))
  | Frontend_dAst.C_Decl_DData (dtb_u_u100, dtb_u_u101, dtb_u_u102, dtb_u_u103, dtb_u_u104, dtb_u_u105, dtb_u_u106, dtb_u_u107, dtb_u_u108) -> ((((v_splitDerivedOwners dtb_u_u90) dtb_u_u100) dtb_u_u101) dtb_u_u104)
  | Frontend_dAst.C_Decl_DInstance (dtb_u_u109, dtb_u_u110, dtb_u_u111, dtb_u_u112) -> (match (v_headClassName dtb_u_u110) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u113) -> (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = ((Elab_dInstName.v_instanceSymbol dtb_u_u113) dtb_u_u110); B_dData_dPair.f_Pair_second = dtb_u_u90 }, B_dData_dList.C_List_Nil))
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
)
  | _ -> B_dData_dList.C_List_Nil
))

# 119 "Vuna/Compiler/Driver/Owner.vuna"
let v_splitTraitDefOwnerOf = (fun (dtb_u_u114 : string) (dtb_u_u115 : Frontend_dAst.t_Decl) -> (match dtb_u_u115 with
  | Frontend_dAst.C_Decl_DTrait (dtb_u_u116, dtb_u_u117, dtb_u_u118, dtb_u_u119, dtb_u_u120) -> ((B_dData_dList.v_map (fun (dtb_u_u121 : Frontend_dAst.t_TraitMethod) -> { B_dData_dPair.f_Pair_first = (Frontend_dAst.v_traitMethodName dtb_u_u121); B_dData_dPair.f_Pair_second = dtb_u_u114 })) dtb_u_u119)
  | _ -> B_dData_dList.C_List_Nil
))

# 124 "Vuna/Compiler/Driver/Owner.vuna"
let v_splitTraitDataOwnerOf = (fun (dtb_u_u122 : string) (dtb_u_u123 : Frontend_dAst.t_Decl) -> (match dtb_u_u123 with
  | Frontend_dAst.C_Decl_DTrait (dtb_u_u124, dtb_u_u125, dtb_u_u126, dtb_u_u127, dtb_u_u128) -> (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = ("Dict_" ^ dtb_u_u124); B_dData_dPair.f_Pair_second = dtb_u_u122 }, B_dData_dList.C_List_Nil))
  | _ -> B_dData_dList.C_List_Nil
))

# 128 "Vuna/Compiler/Driver/Owner.vuna"
let rec v_splitInstanceOwnersGo = (fun (dtb_u_u129 : string) (dtb_u_u130 : Frontend_dAst.t_Decl B_dData_dList.t_List) -> (match dtb_u_u130 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u131, dtb_u_u132) -> ((B_dData_dList.v_append ((v_splitInstanceOwnerOf dtb_u_u129) dtb_u_u131)) ((v_splitInstanceOwnersGo dtb_u_u129) dtb_u_u132))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 133 "Vuna/Compiler/Driver/Owner.vuna"
let v_splitOwnerEntriesOf = (fun (dtb_u_u133 : string) (dtb_u_u134 : Frontend_dAst.t_Decl B_dData_dList.t_List) -> ((B_dData_dList.v_append ((B_dData_dList.v_map (fun (dtb_u_u135 : string) -> { B_dData_dPair.f_Pair_first = dtb_u_u135; B_dData_dPair.f_Pair_second = dtb_u_u133 })) (v_splitDeclNames dtb_u_u134))) ((B_dData_dList.v_append ((v_splitInstanceOwnersGo dtb_u_u133) dtb_u_u134)) ((B_dData_dList.v_concatMap (v_splitTraitDefOwnerOf dtb_u_u133)) dtb_u_u134))))

# 139 "Vuna/Compiler/Driver/Owner.vuna"
let v_splitDataOwnerEntriesOf = (fun (dtb_u_u136 : string) (dtb_u_u137 : Frontend_dAst.t_Decl B_dData_dList.t_List) -> ((B_dData_dList.v_append ((B_dData_dList.v_map (fun (dtb_u_u138 : string) -> { B_dData_dPair.f_Pair_first = dtb_u_u138; B_dData_dPair.f_Pair_second = dtb_u_u136 })) (v_splitDataNames dtb_u_u137))) ((B_dData_dList.v_concatMap (v_splitTraitDataOwnerOf dtb_u_u136)) dtb_u_u137)))

# 145 "Vuna/Compiler/Driver/Owner.vuna"
let rec v_splitOwnerEntriesOfModules = (fun (dtb_u_u139 : (string, Frontend_dAst.t_Decl B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match dtb_u_u139 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u140, dtb_u_u141) -> (match dtb_u_u140 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u142; B_dData_dPair.f_Pair_second = dtb_u_u143 } -> ((B_dData_dList.v_append ((v_splitOwnerEntriesOf dtb_u_u142) dtb_u_u143)) (v_splitOwnerEntriesOfModules dtb_u_u141))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 150 "Vuna/Compiler/Driver/Owner.vuna"
let rec v_splitDataOwnerEntriesOfModules = (fun (dtb_u_u144 : (string, Frontend_dAst.t_Decl B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match dtb_u_u144 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u145, dtb_u_u146) -> (match dtb_u_u145 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u147; B_dData_dPair.f_Pair_second = dtb_u_u148 } -> ((B_dData_dList.v_append ((v_splitDataOwnerEntriesOf dtb_u_u147) dtb_u_u148)) (v_splitDataOwnerEntriesOfModules dtb_u_u146))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 165 "Vuna/Compiler/Driver/Owner.vuna"
let v_splitMetaOf = (fun (dtb_u_u149 : (string, Frontend_dAst.t_Decl B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u150 : Frontend_dAst.t_Decl B_dData_dList.t_List) -> (let dtb_u_u151 = ((B_dData_dList.v_map (fun (dtb_u_u154 : (string, Frontend_dAst.t_Decl B_dData_dList.t_List) B_dData_dPair.t_Pair) -> (B_dData_dPair.v_firstOf dtb_u_u154))) dtb_u_u149) in (let dtb_u_u152 = ((B_dData_dList.v_append (v_splitOwnerEntriesOfModules dtb_u_u149)) ((v_splitOwnerEntriesOf v_entryOwner) dtb_u_u150)) in (let dtb_u_u153 = ((B_dData_dList.v_append (v_splitDataOwnerEntriesOfModules dtb_u_u149)) ((v_splitDataOwnerEntriesOf v_entryOwner) dtb_u_u150)) in { f_SplitMeta_smDefOwners = dtb_u_u152; f_SplitMeta_smDataOwners = dtb_u_u153; f_SplitMeta_smKnownModules = dtb_u_u151; f_SplitMeta_smDefOwnerT = (((B_dContainer_dHashMap.v_fromList B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) dtb_u_u152); f_SplitMeta_smDataOwnerT = (((B_dContainer_dHashMap.v_fromList B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) dtb_u_u153) }))))

# 182 "Vuna/Compiler/Driver/Owner.vuna"
let v_lookupModuleOf = (fun (dtb_u_u155 : (string, string) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u156 : string) -> ((B_dData_dList.v_lookupPair dtb_u_u156) dtb_u_u155))

# 185 "Vuna/Compiler/Driver/Owner.vuna"
let v_knownModuleOrErr = (fun (dtb_u_u157 : string B_dData_dList.t_List) (dtb_u_u158 : string) (dtb_u_u159 : string) -> (let dtb_u_u160 = (v_modulePrefixOfName dtb_u_u159) in (if ((B_dData_dList.v_memName dtb_u_u160) dtb_u_u157) then (Base_dDiag.C_Check_OkC (dtb_u_u160)) else (Base_dDiag.v_icInternal (String.concat "" ["DT split: `"; dtb_u_u158; "` "; dtb_u_u159; " has module prefix `"; dtb_u_u160; "` but no such module"])))))

# 194 "Vuna/Compiler/Driver/Owner.vuna"
let v_splitDataOwnerOf = (fun (dtb_u_u161 : t_SplitMeta) (dtb_u_u162 : Elab_dTypes.t_DtData) -> (match ((((B_dContainer_dHashMap.v_lookup B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) (Elab_dTypes.v_dtDataName dtb_u_u162)) (dtb_u_u161).f_SplitMeta_smDataOwnerT) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u163) -> (Base_dDiag.C_Check_OkC (dtb_u_u163))
  | B_dData_dMaybe.C_Maybe_Nothing -> (if (Base_dSource.v_containsDot (Elab_dTypes.v_dtDataName dtb_u_u162)) then (((v_knownModuleOrErr (dtb_u_u161).f_SplitMeta_smKnownModules) "data") (Elab_dTypes.v_dtDataName dtb_u_u162)) else (Base_dDiag.v_icInternal (String.concat "" ["DT split: cannot determine module for data `"; (Elab_dTypes.v_dtDataName dtb_u_u162); "`"])))
  | _ -> failwith "DT: impossible branch"
))

# 207 "Vuna/Compiler/Driver/Owner.vuna"
let v_isSyntheticInternalName = (fun (dtb_u_u164 : string) -> (if (dtb_u_u164 = Base_dIntrinsics.v_mainShowDefName) then true else (Frontend_dReserved.v_isInternalSyntaxName dtb_u_u164)))

# 210 "Vuna/Compiler/Driver/Owner.vuna"
let v_splitDefOwnerOf = (fun (dtb_u_u165 : t_SplitMeta) (dtb_u_u166 : string) -> (match ((((B_dContainer_dHashMap.v_lookup B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) dtb_u_u166) (dtb_u_u165).f_SplitMeta_smDefOwnerT) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u167) -> (Base_dDiag.C_Check_OkC (dtb_u_u167))
  | B_dData_dMaybe.C_Maybe_Nothing -> (if (Base_dSource.v_containsDot dtb_u_u166) then (((v_knownModuleOrErr (dtb_u_u165).f_SplitMeta_smKnownModules) "definition") dtb_u_u166) else (if (v_isSyntheticInternalName dtb_u_u166) then (Base_dDiag.C_Check_OkC (v_entryOwner)) else (Base_dDiag.v_icInternal (String.concat "" ["DT split: cannot determine module for definition `"; dtb_u_u166; "`"]))))
  | _ -> failwith "DT: impossible branch"
))

# 222 "Vuna/Compiler/Driver/Owner.vuna"
let rec v_nameOwnerPairsOfDefs = (fun (dtb_u_u168 : t_SplitMeta) (dtb_u_u169 : Elab_dTypes.t_DtDef B_dData_dList.t_List) -> (match dtb_u_u169 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u170, dtb_u_u171) -> ((Base_dCommon.v_bind ((v_splitDefOwnerOf dtb_u_u168) (Elab_dTypes.v_dtDefName dtb_u_u170))) (fun (dtb_u_u172 : string) -> ((Base_dCommon.v_bind ((v_nameOwnerPairsOfDefs dtb_u_u168) dtb_u_u171)) (fun (dtb_u_u173 : (string, string) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = (Elab_dTypes.v_dtDefName dtb_u_u170); B_dData_dPair.f_Pair_second = dtb_u_u172 }, dtb_u_u173))))))))
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (B_dData_dList.C_List_Nil))
  | _ -> failwith "DT: impossible branch"
))

# 229 "Vuna/Compiler/Driver/Owner.vuna"
let rec v_nameOwnerPairsOfDatas = (fun (dtb_u_u174 : t_SplitMeta) (dtb_u_u175 : Elab_dTypes.t_DtData B_dData_dList.t_List) -> (match dtb_u_u175 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u176, dtb_u_u177) -> ((Base_dCommon.v_bind ((v_splitDataOwnerOf dtb_u_u174) dtb_u_u176)) (fun (dtb_u_u178 : string) -> ((Base_dCommon.v_bind ((v_nameOwnerPairsOfDatas dtb_u_u174) dtb_u_u177)) (fun (dtb_u_u179 : (string, string) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = (Elab_dTypes.v_dtDataName dtb_u_u176); B_dData_dPair.f_Pair_second = dtb_u_u178 }, dtb_u_u179))))))))
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (B_dData_dList.C_List_Nil))
  | _ -> failwith "DT: impossible branch"
))

# 155 "Vuna/Compiler/Driver/Owner.vuna"
let v_smDefOwners = (fun (dtb_u_u180 : t_SplitMeta) -> (match dtb_u_u180 with
  | { f_SplitMeta_smDefOwners = dtb_u_u181; f_SplitMeta_smDataOwners = dtb_u_u182; f_SplitMeta_smKnownModules = dtb_u_u183; f_SplitMeta_smDefOwnerT = dtb_u_u184; f_SplitMeta_smDataOwnerT = dtb_u_u185 } -> dtb_u_u181
  | _ -> failwith "DT: impossible branch"
))

# 156 "Vuna/Compiler/Driver/Owner.vuna"
let v_smDataOwners = (fun (dtb_u_u186 : t_SplitMeta) -> (match dtb_u_u186 with
  | { f_SplitMeta_smDefOwners = dtb_u_u187; f_SplitMeta_smDataOwners = dtb_u_u188; f_SplitMeta_smKnownModules = dtb_u_u189; f_SplitMeta_smDefOwnerT = dtb_u_u190; f_SplitMeta_smDataOwnerT = dtb_u_u191 } -> dtb_u_u188
  | _ -> failwith "DT: impossible branch"
))

# 157 "Vuna/Compiler/Driver/Owner.vuna"
let v_smKnownModules = (fun (dtb_u_u192 : t_SplitMeta) -> (match dtb_u_u192 with
  | { f_SplitMeta_smDefOwners = dtb_u_u193; f_SplitMeta_smDataOwners = dtb_u_u194; f_SplitMeta_smKnownModules = dtb_u_u195; f_SplitMeta_smDefOwnerT = dtb_u_u196; f_SplitMeta_smDataOwnerT = dtb_u_u197 } -> dtb_u_u195
  | _ -> failwith "DT: impossible branch"
))

# 161 "Vuna/Compiler/Driver/Owner.vuna"
let v_smDefOwnerT = (fun (dtb_u_u198 : t_SplitMeta) -> (match dtb_u_u198 with
  | { f_SplitMeta_smDefOwners = dtb_u_u199; f_SplitMeta_smDataOwners = dtb_u_u200; f_SplitMeta_smKnownModules = dtb_u_u201; f_SplitMeta_smDefOwnerT = dtb_u_u202; f_SplitMeta_smDataOwnerT = dtb_u_u203 } -> dtb_u_u202
  | _ -> failwith "DT: impossible branch"
))

# 162 "Vuna/Compiler/Driver/Owner.vuna"
let v_smDataOwnerT = (fun (dtb_u_u204 : t_SplitMeta) -> (match dtb_u_u204 with
  | { f_SplitMeta_smDefOwners = dtb_u_u205; f_SplitMeta_smDataOwners = dtb_u_u206; f_SplitMeta_smKnownModules = dtb_u_u207; f_SplitMeta_smDefOwnerT = dtb_u_u208; f_SplitMeta_smDataOwnerT = dtb_u_u209 } -> dtb_u_u209
  | _ -> failwith "DT: impossible branch"
))
