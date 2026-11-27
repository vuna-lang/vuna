open Vuna_runtime
type t_ValueEntry = C_ValueEntry_VECtor of (Elab_dTypes.t_DtCtor) | C_ValueEntry_VEDef of (Core_dTerm.t_Term)
and t_DataHead = { f_DataHead_dataHeadName : string; f_DataHead_dataHeadKind : Core_dTerm.t_Term; f_DataHead_dataHeadArity : int }

# 32 "Vuna/Compiler/Elab/Meta.vuna"
let rec v_hasNoExplicitPiFuel = (fun (dtb_u_u1 : int) (dtb_u_u2 : Elab_dTypes.t_Ec) (dtb_u_u3 : Core_dTerm.t_Value) -> (if (dtb_u_u1 <= 0) then true else (let dtb_u_u4 = ((Elab_dTypes.v_forceVal dtb_u_u2) dtb_u_u3) in (match dtb_u_u4 with
  | Core_dTerm.C_Value_VPi (dtb_u_u5, dtb_u_u6, dtb_u_u7, dtb_u_u8, dtb_u_u9) -> (if dtb_u_u6 then (((v_hasNoExplicitPiFuel (dtb_u_u1 - 1)) dtb_u_u2) ((Core_dEval.v_applyClosure dtb_u_u9) ((Elab_dTypes.v_forceVal dtb_u_u2) dtb_u_u8))) else false)
  | _ -> true
))))

# 29 "Vuna/Compiler/Elab/Meta.vuna"
let v_hasNoExplicitPi = (fun (dtb_u_u10 : Elab_dTypes.t_Ec) (dtb_u_u11 : Core_dTerm.t_Value) -> (((v_hasNoExplicitPiFuel 128) dtb_u_u10) dtb_u_u11))

# 77 "Vuna/Compiler/Elab/Meta.vuna"
let[@tail_mod_cons] rec v_zipTeleRigs = (fun (dtb_u_u12 : Core_dTerm.t_Term B_dData_dList.t_List) (dtb_u_u13 : (string, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match dtb_u_u12 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u14, dtb_u_u15) -> (match dtb_u_u13 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u16, dtb_u_u17) -> (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb_u_u14; B_dData_dPair.f_Pair_second = (B_dData_dPair.v_secondOf dtb_u_u16) }, ((v_zipTeleRigs dtb_u_u15) dtb_u_u17)))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 70 "Vuna/Compiler/Elab/Meta.vuna"
let v_nullaryCtorTerm = (fun (dtb_u_u18 : Elab_dTypes.t_DtCtor) (dtb_u_u19 : Core_dTerm.t_Term B_dData_dList.t_List) -> (if ((B_dData_dList.v_length dtb_u_u19) = (B_dData_dList.v_length (Elab_dTypes.v_dtCtorTelescope dtb_u_u18))) then (Core_dTerm.C_Term_TCon ((Elab_dTypes.v_dtCtorName dtb_u_u18), ((v_zipTeleRigs dtb_u_u19) (Elab_dTypes.v_dtCtorTelescope dtb_u_u18)))) else (Core_dTerm.C_Term_TGlobal ((Elab_dTypes.v_dtCtorName dtb_u_u18)))))

# 84 "Vuna/Compiler/Elab/Meta.vuna"
let v_boolCtorValue = (fun (dtb_u_u20 : string) -> (if (dtb_u_u20 = Base_dIntrinsics.v_boolTrueCtor) then (B_dData_dMaybe.C_Maybe_Just (true)) else (if (dtb_u_u20 = Base_dIntrinsics.v_boolFalseCtor) then (B_dData_dMaybe.C_Maybe_Just (false)) else B_dData_dMaybe.C_Maybe_Nothing)))

# 88 "Vuna/Compiler/Elab/Meta.vuna"
let v_boolCtorTerm = (fun (dtb_u_u21 : string) -> (let dtb_u_u22 = (v_boolCtorValue dtb_u_u21) in (match dtb_u_u22 with
  | B_dData_dMaybe.C_Maybe_Nothing -> (Core_dTerm.C_Term_TGlobal (dtb_u_u21))
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u23) -> (if dtb_u_u23 then (Core_dTerm.C_Term_TBool (true)) else (Core_dTerm.C_Term_TBool (false)))
  | _ -> failwith "DT: impossible branch"
)))

# 122 "Vuna/Compiler/Elab/Meta.vuna"
let rec v_lookupSpanPair = (fun (dtb_u_u24 : int) (dtb_u_u25 : (int, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match dtb_u_u25 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u26, dtb_u_u27) -> (match dtb_u_u26 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u28; B_dData_dPair.f_Pair_second = dtb_u_u29 } -> (if (dtb_u_u28 = dtb_u_u24) then (B_dData_dMaybe.C_Maybe_Just (dtb_u_u29)) else ((v_lookupSpanPair dtb_u_u24) dtb_u_u27))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 117 "Vuna/Compiler/Elab/Meta.vuna"
let rec v_metaSpanOf = (fun (dtb_u_u30 : Elab_dTypes.t_Ec) (dtb_u_u31 : Core_dTerm.t_Value) -> (match dtb_u_u31 with
  | Core_dTerm.C_Value_VApp (dtb_u_u32, dtb_u_u33) -> ((v_metaSpanOf dtb_u_u30) dtb_u_u32)
  | Core_dTerm.C_Value_VMeta (dtb_u_u34, dtb_u_u35) -> ((v_lookupSpanPair dtb_u_u34) (Elab_dTypes.v_ecMetaSpans dtb_u_u30))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
))

# 126 "Vuna/Compiler/Elab/Meta.vuna"
let v_convEc = (fun (dtb_u_u36 : Elab_dTypes.t_Ec) (dtb_u_u37 : int) (dtb_u_u38 : Core_dTerm.t_Value) (dtb_u_u39 : Core_dTerm.t_Value) -> (match (((((Core_dConv.v_conv (Elab_dTypes.v_ecDefTbl dtb_u_u36)) (Elab_dTypes.v_ecSolsP dtb_u_u36)) dtb_u_u37) dtb_u_u38) dtb_u_u39) with
  | Base_dDiag.C_Check_ErrC (dtb_u_u40) -> (match ((v_metaSpanOf dtb_u_u36) dtb_u_u39) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u41) -> (Base_dDiag.C_Check_ErrC (((Base_dDiag.v_withFallbackSpan dtb_u_u41) dtb_u_u40)))
  | B_dData_dMaybe.C_Maybe_Nothing -> (match ((v_metaSpanOf dtb_u_u36) dtb_u_u38) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u42) -> (Base_dDiag.C_Check_ErrC (((Base_dDiag.v_withFallbackSpan dtb_u_u42) dtb_u_u40)))
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.C_Check_ErrC (dtb_u_u40))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dDiag.C_Check_OkC (dtb_u_u43) -> (Base_dDiag.C_Check_OkC (((Elab_dTypes.v_ecPutSols dtb_u_u36) (Core_dTerm.v_solsList dtb_u_u43))))
  | _ -> failwith "DT: impossible branch"
))

# 142 "Vuna/Compiler/Elab/Meta.vuna"
let rec v_unsolvedFromGo = (fun (dtb_u_u44 : int) (dtb_u_u45 : int) (dtb_u_u46 : (int, Core_dTerm.t_Value) B_dContainer_dHashMap.t_HashMap) -> (if (dtb_u_u44 <= 0) then B_dData_dMaybe.C_Maybe_Nothing else (let dtb_u_u47 = (dtb_u_u45 - dtb_u_u44) in (match ((Core_dTerm.v_metaLookup dtb_u_u47) dtb_u_u46) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u48) -> (((v_unsolvedFromGo (dtb_u_u44 - 1)) dtb_u_u45) dtb_u_u46)
  | B_dData_dMaybe.C_Maybe_Nothing -> (B_dData_dMaybe.C_Maybe_Just (dtb_u_u47))
  | _ -> failwith "DT: impossible branch"
))))

# 139 "Vuna/Compiler/Elab/Meta.vuna"
let v_unsolvedFrom = (fun (dtb_u_u49 : int) (dtb_u_u50 : int) (dtb_u_u51 : (int, Core_dTerm.t_Value) B_dContainer_dHashMap.t_HashMap) -> (((v_unsolvedFromGo (dtb_u_u50 - dtb_u_u49)) dtb_u_u50) dtb_u_u51))

# 153 "Vuna/Compiler/Elab/Meta.vuna"
let rec v_memMetaId = (fun (dtb_u_u52 : int) (dtb_u_u53 : int B_dData_dList.t_List) -> (match dtb_u_u53 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u54, dtb_u_u55) -> (if (dtb_u_u54 = dtb_u_u52) then true else ((v_memMetaId dtb_u_u52) dtb_u_u55))
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 192 "Vuna/Compiler/Elab/Meta.vuna"
let rec v_termMetasAll = (fun (dtb_u_u56 : Core_dTerm.t_Term) -> (match dtb_u_u56 with
  | Core_dTerm.C_Term_TIf (dtb_u_u57, dtb_u_u58, dtb_u_u59) -> ((B_dData_dList.v_append (v_termMetasAll dtb_u_u57)) ((B_dData_dList.v_append (v_termMetasAll dtb_u_u58)) (v_termMetasAll dtb_u_u59)))
  | Core_dTerm.C_Term_TBool (dtb_u_u60) -> B_dData_dList.C_List_Nil
  | Core_dTerm.C_Term_TFloat (dtb_u_u61) -> B_dData_dList.C_List_Nil
  | Core_dTerm.C_Term_TStr (dtb_u_u62) -> B_dData_dList.C_List_Nil
  | Core_dTerm.C_Term_TInt (dtb_u_u63) -> B_dData_dList.C_List_Nil
  | Core_dTerm.C_Term_TCase (dtb_u_u64, dtb_u_u65) -> ((B_dData_dList.v_append (v_termMetasAll dtb_u_u64)) ((B_dData_dList.v_concatMap (fun (dtb_u_u66 : Core_dTerm.t_CaseAlt) -> (v_termMetasAll (Core_dTerm.v_caseAltBody dtb_u_u66)))) dtb_u_u65))
  | Core_dTerm.C_Term_TRecUpd (dtb_u_u67, dtb_u_u68, dtb_u_u69, dtb_u_u70, dtb_u_u71) -> ((B_dData_dList.v_append (v_termMetasAll dtb_u_u67)) (v_termMetasAll dtb_u_u71))
  | Core_dTerm.C_Term_TProj (dtb_u_u72, dtb_u_u73, dtb_u_u74, dtb_u_u75, dtb_u_u76) -> (v_termMetasAll dtb_u_u72)
  | Core_dTerm.C_Term_TRecord (dtb_u_u77, dtb_u_u78) -> ((B_dData_dList.v_concatMap (fun (dtb_u_u79 : (Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair) -> (v_termMetasAll (B_dData_dPair.v_firstOf dtb_u_u79)))) dtb_u_u78)
  | Core_dTerm.C_Term_TMk (dtb_u_u80, dtb_u_u81) -> ((B_dData_dList.v_concatMap (fun (dtb_u_u82 : (Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair) -> (v_termMetasAll (B_dData_dPair.v_firstOf dtb_u_u82)))) dtb_u_u81)
  | Core_dTerm.C_Term_TCon (dtb_u_u83, dtb_u_u84) -> ((B_dData_dList.v_concatMap (fun (dtb_u_u85 : (Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair) -> (v_termMetasAll (B_dData_dPair.v_firstOf dtb_u_u85)))) dtb_u_u84)
  | Core_dTerm.C_Term_TApp (dtb_u_u86, dtb_u_u87, dtb_u_u88) -> ((B_dData_dList.v_append (v_termMetasAll dtb_u_u86)) (v_termMetasAll dtb_u_u87))
  | Core_dTerm.C_Term_TLam (dtb_u_u89, dtb_u_u90, dtb_u_u91, dtb_u_u92, dtb_u_u93) -> (let dtb_u_u94 = (let dtb_u_u95 = dtb_u_u91 in (match dtb_u_u95 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u96) -> (match dtb_u_u96 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u97; B_dData_dPair.f_Pair_second = dtb_u_u98 } -> (match dtb_u_u98 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u99; B_dData_dPair.f_Pair_second = dtb_u_u100 } -> ((B_dData_dList.v_append (v_termMetasAllMaybe dtb_u_u99)) (v_termMetasAllMaybe dtb_u_u100))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
)) in ((B_dData_dList.v_append dtb_u_u94) (v_termMetasAll dtb_u_u93)))
  | Core_dTerm.C_Term_TPi (dtb_u_u101, dtb_u_u102, dtb_u_u103, dtb_u_u104, dtb_u_u105) -> ((B_dData_dList.v_append (v_termMetasAll dtb_u_u104)) (v_termMetasAll dtb_u_u105))
  | Core_dTerm.C_Term_TType (dtb_u_u106) -> B_dData_dList.C_List_Nil
  | Core_dTerm.C_Term_TGlobal (dtb_u_u107) -> B_dData_dList.C_List_Nil
  | Core_dTerm.C_Term_TVar (dtb_u_u108, dtb_u_u109, dtb_u_u110) -> B_dData_dList.C_List_Nil
  | Core_dTerm.C_Term_TMeta (dtb_u_u111) -> (B_dData_dList.C_List__x58__x58_ (dtb_u_u111, B_dData_dList.C_List_Nil))
  | _ -> failwith "DT: impossible branch"
))
# 219 "Vuna/Compiler/Elab/Meta.vuna"
and v_termMetasAllMaybe = (fun (dtb_u_u112 : Core_dTerm.t_Term B_dData_dMaybe.t_Maybe) -> (match dtb_u_u112 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u113) -> (v_termMetasAll dtb_u_u113)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 164 "Vuna/Compiler/Elab/Meta.vuna"
let rec v_termMetasRuntime = (fun (dtb_u_u114 : Core_dTerm.t_Term) -> (match dtb_u_u114 with
  | Core_dTerm.C_Term_TIf (dtb_u_u115, dtb_u_u116, dtb_u_u117) -> ((B_dData_dList.v_append (v_termMetasRuntime dtb_u_u115)) ((B_dData_dList.v_append (v_termMetasRuntime dtb_u_u116)) (v_termMetasRuntime dtb_u_u117)))
  | Core_dTerm.C_Term_TBool (dtb_u_u118) -> B_dData_dList.C_List_Nil
  | Core_dTerm.C_Term_TFloat (dtb_u_u119) -> B_dData_dList.C_List_Nil
  | Core_dTerm.C_Term_TStr (dtb_u_u120) -> B_dData_dList.C_List_Nil
  | Core_dTerm.C_Term_TInt (dtb_u_u121) -> B_dData_dList.C_List_Nil
  | Core_dTerm.C_Term_TCase (dtb_u_u122, dtb_u_u123) -> ((B_dData_dList.v_append (v_termMetasRuntime dtb_u_u122)) ((B_dData_dList.v_concatMap (fun (dtb_u_u124 : Core_dTerm.t_CaseAlt) -> (v_termMetasRuntime (Core_dTerm.v_caseAltBody dtb_u_u124)))) dtb_u_u123))
  | Core_dTerm.C_Term_TRecUpd (dtb_u_u125, dtb_u_u126, dtb_u_u127, dtb_u_u128, dtb_u_u129) -> ((B_dData_dList.v_append (v_termMetasRuntime dtb_u_u125)) (v_termMetasRuntime dtb_u_u129))
  | Core_dTerm.C_Term_TProj (dtb_u_u130, dtb_u_u131, dtb_u_u132, dtb_u_u133, dtb_u_u134) -> (v_termMetasRuntime dtb_u_u130)
  | Core_dTerm.C_Term_TRecord (dtb_u_u135, dtb_u_u136) -> ((B_dData_dList.v_concatMap (fun (dtb_u_u137 : (Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair) -> (if (Core_dTerm.v_rigIsErased (B_dData_dPair.v_secondOf dtb_u_u137)) then B_dData_dList.C_List_Nil else (v_termMetasRuntime (B_dData_dPair.v_firstOf dtb_u_u137))))) dtb_u_u136)
  | Core_dTerm.C_Term_TMk (dtb_u_u138, dtb_u_u139) -> ((B_dData_dList.v_concatMap (fun (dtb_u_u140 : (Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair) -> (if (Core_dTerm.v_rigIsErased (B_dData_dPair.v_secondOf dtb_u_u140)) then B_dData_dList.C_List_Nil else (v_termMetasRuntime (B_dData_dPair.v_firstOf dtb_u_u140))))) dtb_u_u139)
  | Core_dTerm.C_Term_TCon (dtb_u_u141, dtb_u_u142) -> ((B_dData_dList.v_concatMap (fun (dtb_u_u143 : (Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair) -> (if (Core_dTerm.v_rigIsErased (B_dData_dPair.v_secondOf dtb_u_u143)) then B_dData_dList.C_List_Nil else (v_termMetasRuntime (B_dData_dPair.v_firstOf dtb_u_u143))))) dtb_u_u142)
  | Core_dTerm.C_Term_TApp (dtb_u_u144, dtb_u_u145, dtb_u_u146) -> (if (Core_dTerm.v_rigIsErased dtb_u_u146) then (v_termMetasRuntime dtb_u_u144) else ((B_dData_dList.v_append (v_termMetasRuntime dtb_u_u144)) (v_termMetasRuntime dtb_u_u145)))
  | Core_dTerm.C_Term_TLam (dtb_u_u147, dtb_u_u148, dtb_u_u149, dtb_u_u150, dtb_u_u151) -> (v_termMetasRuntime dtb_u_u151)
  | Core_dTerm.C_Term_TPi (dtb_u_u152, dtb_u_u153, dtb_u_u154, dtb_u_u155, dtb_u_u156) -> ((B_dData_dList.v_append (v_termMetasAll dtb_u_u155)) (v_termMetasAll dtb_u_u156))
  | Core_dTerm.C_Term_TType (dtb_u_u157) -> B_dData_dList.C_List_Nil
  | Core_dTerm.C_Term_TGlobal (dtb_u_u158) -> B_dData_dList.C_List_Nil
  | Core_dTerm.C_Term_TVar (dtb_u_u159, dtb_u_u160, dtb_u_u161) -> B_dData_dList.C_List_Nil
  | Core_dTerm.C_Term_TMeta (dtb_u_u162) -> (B_dData_dList.C_List__x58__x58_ (dtb_u_u162, B_dData_dList.C_List_Nil))
  | _ -> failwith "DT: impossible branch"
))

# 157 "Vuna/Compiler/Elab/Meta.vuna"
let v_relevantMetas = (fun (dtb_u_u163 : Elab_dTypes.t_Ec) -> ((B_dData_dList.v_append ((B_dData_dList.v_concatMap (fun (dtb_u_u164 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair) -> (v_termMetasRuntime (B_dData_dPair.v_secondOf dtb_u_u164)))) (Elab_dTypes.v_ecDefs dtb_u_u163))) ((B_dData_dList.v_concatMap (fun (dtb_u_u165 : Elab_dTypes.t_DtData) -> ((B_dData_dList.v_concatMap v_termMetasAll) ((B_dData_dList.v_map Elab_dTypes.v_dtCtorType) (Elab_dTypes.v_dtDataCtors dtb_u_u165))))) (Elab_dTypes.v_ecDatas dtb_u_u163))))

# 223 "Vuna/Compiler/Elab/Meta.vuna"
let v_maxInt = (fun (dtb_u_u166 : int) (dtb_u_u167 : int) -> (if (dtb_u_u166 >= dtb_u_u167) then dtb_u_u166 else dtb_u_u167))

# 226 "Vuna/Compiler/Elab/Meta.vuna"
let rec v_globalLookup = (fun (dtb_u_u168 : string) (dtb_u_u169 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match dtb_u_u169 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u170, dtb_u_u171) -> (match dtb_u_u170 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u172; B_dData_dPair.f_Pair_second = dtb_u_u173 } -> (if (dtb_u_u168 = dtb_u_u172) then (B_dData_dMaybe.C_Maybe_Just (dtb_u_u173)) else ((v_globalLookup dtb_u_u168) dtb_u_u171))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 233 "Vuna/Compiler/Elab/Meta.vuna"
let v_globalsLookup = (fun (dtb_u_u174 : string) (dtb_u_u175 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u176 : Elab_dTypes.t_Ec) -> (match ((((B_dContainer_dHashMap.v_lookup B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) dtb_u_u174) (Elab_dTypes.v_ecGlobalsTbl dtb_u_u176)) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u177) -> (B_dData_dMaybe.C_Maybe_Just (dtb_u_u177))
  | B_dData_dMaybe.C_Maybe_Nothing -> (if (dtb_u_u176).Elab_dTypes.f_Ec_ecGlobalsComplete then B_dData_dMaybe.C_Maybe_Nothing else ((v_globalLookup dtb_u_u174) dtb_u_u175))
  | _ -> failwith "DT: impossible branch"
))

# 245 "Vuna/Compiler/Elab/Meta.vuna"
let v_globalsTableOf = (fun (dtb_u_u178 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) -> ((((B_dContainer_dHashMap.v_insertAll B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) dtb_u_u178) (((B_dContainer_dHashMap.v_fromList B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) B_dData_dList.C_List_Nil)))

# 249 "Vuna/Compiler/Elab/Meta.vuna"
let rec v_memSig = (fun dtb_u_u181 dtb_u_u182 dtb_u_u183 -> (match dtb_u_u182 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u184, dtb_u_u185) -> (match dtb_u_u184 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u186; B_dData_dPair.f_Pair_second = dtb_u_u187 } -> (if (((B_dTrait_dEq.v__x61__x61_ dtb_u_u181) dtb_u_u186) dtb_u_u183) then true else (((v_memSig dtb_u_u181) dtb_u_u185) dtb_u_u183))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 253 "Vuna/Compiler/Elab/Meta.vuna"
let rec v_memDefName = (fun (dtb_u_u188 : string) (dtb_u_u189 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match dtb_u_u189 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u190, dtb_u_u191) -> (match dtb_u_u190 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u192; B_dData_dPair.f_Pair_second = dtb_u_u193 } -> (if (dtb_u_u192 = dtb_u_u188) then true else ((v_memDefName dtb_u_u188) dtb_u_u191))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 271 "Vuna/Compiler/Elab/Meta.vuna"
let rec v_collectSigsInto = (fun (dtb_u_u194 : (string, bool) B_dContainer_dHashMap.t_HashMap) (dtb_u_u195 : (string, bool) B_dContainer_dHashMap.t_HashMap) (dtb_u_u196 : (string, Frontend_dAst.t_Expr B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u197 : (string, bool) B_dContainer_dHashMap.t_HashMap) (dtb_u_u198 : (string, (Frontend_dAst.t_Expr B_dData_dList.t_List, (Frontend_dAst.t_Expr, Base_dSource.t_Span) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u199 : Frontend_dAst.t_Decl B_dData_dList.t_List) -> (match dtb_u_u199 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u200, dtb_u_u201) -> (match dtb_u_u200 with
  | Frontend_dAst.C_Decl_DSig (dtb_u_u202, dtb_u_u203, dtb_u_u204, dtb_u_u205) -> ((((((((((v_collectSigOne dtb_u_u194) dtb_u_u195) dtb_u_u196) dtb_u_u197) dtb_u_u198) dtb_u_u202) dtb_u_u203) dtb_u_u204) (Frontend_dAst.v_nodeRefSpan dtb_u_u205)) dtb_u_u201)
  | Frontend_dAst.C_Decl_DAxiom (dtb_u_u206, dtb_u_u207, dtb_u_u208) -> ((((((((((v_collectSigOne dtb_u_u194) dtb_u_u195) dtb_u_u196) dtb_u_u197) dtb_u_u198) dtb_u_u206) B_dData_dList.C_List_Nil) dtb_u_u207) (Frontend_dAst.v_nodeRefSpan dtb_u_u208)) dtb_u_u201)
  | Frontend_dAst.C_Decl_DExtern (dtb_u_u209, dtb_u_u210, dtb_u_u211, dtb_u_u212) -> ((((((((((v_collectSigOne dtb_u_u194) dtb_u_u195) dtb_u_u196) dtb_u_u197) dtb_u_u198) dtb_u_u209) B_dData_dList.C_List_Nil) dtb_u_u211) (Frontend_dAst.v_nodeRefSpan dtb_u_u212)) dtb_u_u201)
  | Frontend_dAst.C_Decl_DFun (dtb_u_u213, dtb_u_u214, dtb_u_u215, dtb_u_u216) -> ((((((v_collectSigsInto dtb_u_u194) dtb_u_u195) dtb_u_u196) dtb_u_u197) dtb_u_u198) dtb_u_u201)
  | Frontend_dAst.C_Decl_DData (dtb_u_u217, dtb_u_u218, dtb_u_u219, dtb_u_u220, dtb_u_u221, dtb_u_u222, dtb_u_u223, dtb_u_u224, dtb_u_u225) -> ((((((v_collectSigsInto dtb_u_u194) dtb_u_u195) dtb_u_u196) dtb_u_u197) dtb_u_u198) dtb_u_u201)
  | Frontend_dAst.C_Decl_DRecord (dtb_u_u226, dtb_u_u227, dtb_u_u228, dtb_u_u229, dtb_u_u230, dtb_u_u231, dtb_u_u232, dtb_u_u233) -> ((((((v_collectSigsInto dtb_u_u194) dtb_u_u195) dtb_u_u196) dtb_u_u197) dtb_u_u198) dtb_u_u201)
  | Frontend_dAst.C_Decl_DTrait (dtb_u_u234, dtb_u_u235, dtb_u_u236, dtb_u_u237, dtb_u_u238) -> ((((((v_collectSigsInto dtb_u_u194) dtb_u_u195) dtb_u_u196) dtb_u_u197) dtb_u_u198) dtb_u_u201)
  | Frontend_dAst.C_Decl_DInstance (dtb_u_u239, dtb_u_u240, dtb_u_u241, dtb_u_u242) -> ((((((v_collectSigsInto dtb_u_u194) dtb_u_u195) dtb_u_u196) dtb_u_u197) dtb_u_u198) dtb_u_u201)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC ((B_dData_dList.v_reverse dtb_u_u198)))
  | _ -> failwith "DT: impossible branch"
))
# 291 "Vuna/Compiler/Elab/Meta.vuna"
and v_collectSigOne = (fun (dtb_u_u243 : (string, bool) B_dContainer_dHashMap.t_HashMap) (dtb_u_u244 : (string, bool) B_dContainer_dHashMap.t_HashMap) (dtb_u_u245 : (string, Frontend_dAst.t_Expr B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u246 : (string, bool) B_dContainer_dHashMap.t_HashMap) (dtb_u_u247 : (string, (Frontend_dAst.t_Expr B_dData_dList.t_List, (Frontend_dAst.t_Expr, Base_dSource.t_Span) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u248 : string) (dtb_u_u249 : Frontend_dAst.t_Expr B_dData_dList.t_List) (dtb_u_u250 : Frontend_dAst.t_Expr) (dtb_u_u251 : Base_dSource.t_Span) (dtb_u_u252 : Frontend_dAst.t_Decl B_dData_dList.t_List) -> (if ((B_dData_dList.v_memName dtb_u_u248) Elab_dPrelude.v_preludeNames) then (((Base_dDiagnostics_dTc.v_tcErr1 dtb_u_u251) (Base_dDiagnostics_dTc.C_TcErr_CannotRedefineBuiltin (dtb_u_u248))) dtb_u_u248) else (if ((((B_dContainer_dHashMap.v_member B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) dtb_u_u248) dtb_u_u246) then (((Base_dDiagnostics_dTc.v_tcErr1 dtb_u_u251) (Base_dDiagnostics_dTc.C_TcErr_DuplicateSignature (dtb_u_u248))) dtb_u_u248) else ((((((v_collectSigsInto dtb_u_u243) dtb_u_u244) dtb_u_u245) (((((B_dContainer_dHashMap.v_insert B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) dtb_u_u248) true) dtb_u_u246)) (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb_u_u248; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = dtb_u_u249; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = (((((((Elab_dSig.v_quantifyTopSigCtxCachedKinds (Elab_dSig.v_modulePrefixOf dtb_u_u248)) dtb_u_u243) dtb_u_u244) dtb_u_u245) dtb_u_u249) dtb_u_u250) dtb_u_u251); B_dData_dPair.f_Pair_second = dtb_u_u251 } } }, dtb_u_u247))) dtb_u_u252))))

# 257 "Vuna/Compiler/Elab/Meta.vuna"
let v_collectSigs = (fun (dtb_u_u253 : Frontend_dAst.t_Decl B_dData_dList.t_List) -> (let dtb_u_u254 = (Elab_dSig.v_definedNames dtb_u_u253) in (let dtb_u_u255 = (Elab_dSig.v_qualifiedBannedTbl dtb_u_u254) in (let dtb_u_u256 = (Elab_dSig.v_topQuantBanned B_dData_dList.C_List_Nil) in ((((((v_collectSigsInto dtb_u_u255) dtb_u_u256) (Elab_dSig.v_dataParamKindTbl dtb_u_u253)) (((B_dContainer_dHashMap.v_fromList B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) B_dData_dList.C_List_Nil)) B_dData_dList.C_List_Nil) dtb_u_u253)))))

# 308 "Vuna/Compiler/Elab/Meta.vuna"
let rec v_collectDataDecls = (fun (dtb_u_u257 : Frontend_dAst.t_Decl B_dData_dList.t_List) (dtb_u_u258 : (Frontend_dAst.t_Decl, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match dtb_u_u257 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u259, dtb_u_u260) -> (match dtb_u_u259 with
  | Frontend_dAst.C_Decl_DData (dtb_u_u261, dtb_u_u262, dtb_u_u263, dtb_u_u264, dtb_u_u265, dtb_u_u266, dtb_u_u267, dtb_u_u268, dtb_u_u269) -> ((v_collectDataDecls dtb_u_u260) (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb_u_u259; B_dData_dPair.f_Pair_second = (Frontend_dAst.v_nodeRefSpan dtb_u_u269) }, dtb_u_u258)))
  | Frontend_dAst.C_Decl_DRecord (dtb_u_u270, dtb_u_u271, dtb_u_u272, dtb_u_u273, dtb_u_u274, dtb_u_u275, dtb_u_u276, dtb_u_u277) -> ((v_collectDataDecls dtb_u_u260) (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb_u_u259; B_dData_dPair.f_Pair_second = (Frontend_dAst.v_nodeRefSpan dtb_u_u277) }, dtb_u_u258)))
  | _ -> ((v_collectDataDecls dtb_u_u260) dtb_u_u258)
)
  | B_dData_dList.C_List_Nil -> (B_dData_dList.v_reverse dtb_u_u258)
  | _ -> failwith "DT: impossible branch"
))

# 320 "Vuna/Compiler/Elab/Meta.vuna"
let[@tail_mod_cons] rec v_dataNamesOf = (fun (dtb_u_u278 : Frontend_dAst.t_Decl B_dData_dList.t_List) -> (match dtb_u_u278 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u279, dtb_u_u280) -> (match dtb_u_u279 with
  | Frontend_dAst.C_Decl_DData (dtb_u_u281, dtb_u_u282, dtb_u_u283, dtb_u_u284, dtb_u_u285, dtb_u_u286, dtb_u_u287, dtb_u_u288, dtb_u_u289) -> (B_dData_dList.C_List__x58__x58_ (dtb_u_u281, (v_dataNamesOf dtb_u_u280)))
  | Frontend_dAst.C_Decl_DRecord (dtb_u_u290, dtb_u_u291, dtb_u_u292, dtb_u_u293, dtb_u_u294, dtb_u_u295, dtb_u_u296, dtb_u_u297) -> (B_dData_dList.C_List__x58__x58_ (dtb_u_u290, (v_dataNamesOf dtb_u_u280)))
  | _ -> (v_dataNamesOf dtb_u_u280)
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 328 "Vuna/Compiler/Elab/Meta.vuna"
let v_nonEmpty = (fun dtb_u_u299 -> (match dtb_u_u299 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u300, dtb_u_u301) -> true
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 346 "Vuna/Compiler/Elab/Meta.vuna"
let rec v_kindDomainWellFormed = (fun (dtb_u_u302 : Core_dTerm.t_Term) -> (match dtb_u_u302 with
  | Core_dTerm.C_Term_TPi (dtb_u_u303, dtb_u_u304, dtb_u_u305, dtb_u_u306, dtb_u_u307) -> (if (v_kindDomainWellFormed dtb_u_u306) then (v_kindDomainWellFormed dtb_u_u307) else false)
  | Core_dTerm.C_Term_TType (dtb_u_u308) -> ((Core_dTerm.v_levelToInt dtb_u_u308) >= 0)
  | _ -> true
))

# 339 "Vuna/Compiler/Elab/Meta.vuna"
let rec v_kindWellFormed = (fun (dtb_u_u309 : Core_dTerm.t_Term) -> (match dtb_u_u309 with
  | Core_dTerm.C_Term_TType (dtb_u_u310) -> ((Core_dTerm.v_levelToInt dtb_u_u310) >= 0)
  | Core_dTerm.C_Term_TPi (dtb_u_u311, dtb_u_u312, dtb_u_u313, dtb_u_u314, dtb_u_u315) -> (if (v_kindDomainWellFormed dtb_u_u314) then (v_kindWellFormed dtb_u_u315) else false)
  | _ -> false
))

# 352 "Vuna/Compiler/Elab/Meta.vuna"
let[@tail_mod_cons] rec v_splitKind = (fun (dtb_u_u316 : Core_dTerm.t_Term) -> (match dtb_u_u316 with
  | Core_dTerm.C_Term_TPi (dtb_u_u317, dtb_u_u318, dtb_u_u319, dtb_u_u320, dtb_u_u321) -> (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb_u_u317; B_dData_dPair.f_Pair_second = dtb_u_u319 }, (v_splitKind dtb_u_u321)))
  | _ -> B_dData_dList.C_List_Nil
))

# 356 "Vuna/Compiler/Elab/Meta.vuna"
let rec v_dtDataLookup = (fun (dtb_u_u322 : string) (dtb_u_u323 : Elab_dTypes.t_DtData B_dData_dList.t_List) -> (match dtb_u_u323 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u324, dtb_u_u325) -> (if ((Elab_dTypes.v_dtDataName dtb_u_u324) = dtb_u_u322) then (B_dData_dMaybe.C_Maybe_Just (dtb_u_u324)) else ((v_dtDataLookup dtb_u_u322) dtb_u_u325))
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 360 "Vuna/Compiler/Elab/Meta.vuna"
let rec v_findCtorIn = (fun (dtb_u_u326 : string) (dtb_u_u327 : Elab_dTypes.t_DtCtor B_dData_dList.t_List) -> (match dtb_u_u327 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u328, dtb_u_u329) -> (if ((Elab_dTypes.v_dtCtorName dtb_u_u328) = dtb_u_u326) then (B_dData_dMaybe.C_Maybe_Just (dtb_u_u328)) else ((v_findCtorIn dtb_u_u326) dtb_u_u329))
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 364 "Vuna/Compiler/Elab/Meta.vuna"
let rec v_dtCtorLookup = (fun (dtb_u_u330 : string) (dtb_u_u331 : Elab_dTypes.t_DtData B_dData_dList.t_List) -> (match dtb_u_u331 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u332, dtb_u_u333) -> (match ((v_findCtorIn dtb_u_u330) (Elab_dTypes.v_dtDataCtors dtb_u_u332)) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u334) -> (B_dData_dMaybe.C_Maybe_Just (dtb_u_u334))
  | B_dData_dMaybe.C_Maybe_Nothing -> ((v_dtCtorLookup dtb_u_u330) dtb_u_u333)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 374 "Vuna/Compiler/Elab/Meta.vuna"
let v_dtCtorLookupEc = (fun (dtb_u_u335 : Elab_dTypes.t_Ec) (dtb_u_u336 : string) -> (match ((((B_dContainer_dHashMap.v_lookup B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) dtb_u_u336) (dtb_u_u335).Elab_dTypes.f_Ec_ecCtorTbl) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u337) -> (B_dData_dMaybe.C_Maybe_Just (dtb_u_u337))
  | B_dData_dMaybe.C_Maybe_Nothing -> (if (Elab_dTypes.v_ecCtorIndexComplete dtb_u_u335) then B_dData_dMaybe.C_Maybe_Nothing else ((v_dtCtorLookup dtb_u_u336) (Elab_dTypes.v_ecDatas dtb_u_u335)))
  | _ -> failwith "DT: impossible branch"
))

# 392 "Vuna/Compiler/Elab/Meta.vuna"
let v_isDataFamilyName = (fun (dtb_u_u338 : Elab_dTypes.t_Ec) (dtb_u_u339 : string) -> (match ((v_dtDataLookup dtb_u_u339) (Elab_dTypes.v_ecDatas dtb_u_u338)) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u340) -> true
  | B_dData_dMaybe.C_Maybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
))

# 399 "Vuna/Compiler/Elab/Meta.vuna"
let v_isTypeLevelGlobal = (fun (dtb_u_u341 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u342 : Elab_dTypes.t_Ec) (dtb_u_u343 : string) -> (match (((v_globalsLookup dtb_u_u343) dtb_u_u341) dtb_u_u342) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u344) -> (v_kindWellFormed dtb_u_u344)
  | B_dData_dMaybe.C_Maybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
))

# 405 "Vuna/Compiler/Elab/Meta.vuna"
let v_isTypeName = (fun (dtb_u_u345 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u346 : Elab_dTypes.t_Ec) (dtb_u_u347 : string) -> (if (((v_isTypeLevelGlobal dtb_u_u345) dtb_u_u346) dtb_u_u347) then true else ((v_isDataFamilyName dtb_u_u346) dtb_u_u347)))

# 412 "Vuna/Compiler/Elab/Meta.vuna"
let v_dataShortNameOf = (fun (dtb_u_u348 : string) -> (Base_dSource.v_lastSeg dtb_u_u348))

# 416 "Vuna/Compiler/Elab/Meta.vuna"
let v_typeNameOfDualCtor = (fun (dtb_u_u349 : Elab_dTypes.t_Ec) (dtb_u_u350 : string) -> (if ((Base_dSource.v_prefixOfName dtb_u_u350) = "") then B_dData_dMaybe.C_Maybe_Nothing else (let dtb_u_u351 = (Base_dSource.v_prefixOfName dtb_u_u350) in (if ((v_dataShortNameOf dtb_u_u351) = (Base_dSource.v_lastSeg dtb_u_u350)) then (match ((v_dtDataLookup dtb_u_u351) (Elab_dTypes.v_ecDatas dtb_u_u349)) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u352) -> (B_dData_dMaybe.C_Maybe_Just (dtb_u_u351))
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
) else B_dData_dMaybe.C_Maybe_Nothing))))

# 429 "Vuna/Compiler/Elab/Meta.vuna"
let v_ctorFamilyNameOf = (fun (dtb_u_u353 : Elab_dTypes.t_Ec) (dtb_u_u354 : string) -> (match ((v_dtCtorLookupEc dtb_u_u353) dtb_u_u354) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u355) -> (B_dData_dMaybe.C_Maybe_Just ((Elab_dTypes.v_dtCtorFamily dtb_u_u355)))
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 440 "Vuna/Compiler/Elab/Meta.vuna"
let rec v_expectedFamilyOfFuel = (fun (dtb_u_u356 : int) (dtb_u_u357 : Elab_dTypes.t_Ec) (dtb_u_u358 : Core_dTerm.t_Value) -> (if (dtb_u_u356 <= 0) then B_dData_dMaybe.C_Maybe_Nothing else (let dtb_u_u359 = ((Elab_dTypes.v_forceVal dtb_u_u357) dtb_u_u358) in (match dtb_u_u359 with
  | Core_dTerm.C_Value_VPi (dtb_u_u360, dtb_u_u361, dtb_u_u362, dtb_u_u363, dtb_u_u364) -> (((v_expectedFamilyOfFuel (dtb_u_u356 - 1)) dtb_u_u357) ((Core_dEval.v_applyClosure dtb_u_u364) (Core_dTerm.C_Value_VNeutral ((Core_dTerm.C_Neutral_NVar ("_over", 0, B_dData_dList.C_List_Nil))))))
  | Core_dTerm.C_Value_VNeutral (dtb_u_u365) -> (match dtb_u_u365 with
  | Core_dTerm.C_Neutral_NGlobal (dtb_u_u366, dtb_u_u367) -> (B_dData_dMaybe.C_Maybe_Just (dtb_u_u366))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
))))

# 436 "Vuna/Compiler/Elab/Meta.vuna"
let v_expectedFamilyOf = (fun (dtb_u_u368 : Elab_dTypes.t_Ec) (dtb_u_u369 : Core_dTerm.t_Value) -> (((v_expectedFamilyOfFuel 64) dtb_u_u368) dtb_u_u369))

# 451 "Vuna/Compiler/Elab/Meta.vuna"
let v_overCandidatesText = (fun (dtb_u_u370 : string B_dData_dList.t_List) -> ((B_dData_dString.v_join ", ") ((B_dData_dList.v_map Frontend_dAst.v_ctorDisplayName) dtb_u_u370)))

# 455 "Vuna/Compiler/Elab/Meta.vuna"
let rec v_dualFamilyOf = (fun (dtb_u_u371 : Elab_dTypes.t_Ec) (dtb_u_u372 : string) (dtb_u_u373 : string B_dData_dList.t_List) -> (match dtb_u_u373 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u374, dtb_u_u375) -> (match ((v_dtCtorLookupEc dtb_u_u371) dtb_u_u374) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u376) -> (if ((v_dataShortNameOf (Elab_dTypes.v_dtCtorFamily dtb_u_u376)) = dtb_u_u372) then (B_dData_dMaybe.C_Maybe_Just ((Elab_dTypes.v_dtCtorFamily dtb_u_u376))) else (((v_dualFamilyOf dtb_u_u371) dtb_u_u372) dtb_u_u375))
  | B_dData_dMaybe.C_Maybe_Nothing -> (((v_dualFamilyOf dtb_u_u371) dtb_u_u372) dtb_u_u375)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 467 "Vuna/Compiler/Elab/Meta.vuna"
let v_ctorFamilyIs = (fun (dtb_u_u377 : Elab_dTypes.t_Ec) (dtb_u_u378 : string) (dtb_u_u379 : string) -> (match ((v_ctorFamilyNameOf dtb_u_u377) dtb_u_u378) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u380) -> (dtb_u_u380 = dtb_u_u379)
  | B_dData_dMaybe.C_Maybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
))

# 474 "Vuna/Compiler/Elab/Meta.vuna"
let v_candidatesInFamily = (fun (dtb_u_u381 : Elab_dTypes.t_Ec) (dtb_u_u382 : string B_dData_dMaybe.t_Maybe) (dtb_u_u383 : string B_dData_dList.t_List) -> (match dtb_u_u382 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u384) -> ((B_dData_dList.v_filter (fun (dtb_u_u385 : string) -> (((v_ctorFamilyIs dtb_u_u381) dtb_u_u385) dtb_u_u384))) dtb_u_u383)
  | B_dData_dMaybe.C_Maybe_Nothing -> dtb_u_u383
  | _ -> failwith "DT: impossible branch"
))

# 506 "Vuna/Compiler/Elab/Meta.vuna"
let v_defaultOrOver = (fun (dtb_u_u386 : Elab_dTypes.t_Ec) (dtb_u_u387 : Base_dSource.t_Span) (dtb_u_u388 : string) (dtb_u_u389 : string B_dData_dList.t_List) -> (match dtb_u_u389 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u390, dtb_u_u391) -> (match dtb_u_u391 with
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (dtb_u_u390))
  | _ -> ((((Base_dDiagnostics_dTc.v_tcErr2 dtb_u_u387) (Base_dDiagnostics_dTc.C_TcErr_AmbiguousCtor (dtb_u_u388, (v_overCandidatesText dtb_u_u389)))) dtb_u_u388) (v_overCandidatesText dtb_u_u389))
)
  | _ -> ((((Base_dDiagnostics_dTc.v_tcErr2 dtb_u_u387) (Base_dDiagnostics_dTc.C_TcErr_AmbiguousCtor (dtb_u_u388, (v_overCandidatesText dtb_u_u389)))) dtb_u_u388) (v_overCandidatesText dtb_u_u389))
))

# 490 "Vuna/Compiler/Elab/Meta.vuna"
let v_resolveOverCtorGo = (fun (dtb_u_u392 : Elab_dTypes.t_Ec) (dtb_u_u393 : Base_dSource.t_Span) (dtb_u_u394 : string B_dData_dMaybe.t_Maybe) (dtb_u_u395 : string) (dtb_u_u396 : string B_dData_dList.t_List) -> (match dtb_u_u394 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u397) -> (let dtb_u_u398 = (((v_candidatesInFamily dtb_u_u392) (B_dData_dMaybe.C_Maybe_Just (dtb_u_u397))) dtb_u_u396) in (match dtb_u_u398 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u399, dtb_u_u400) -> (match dtb_u_u400 with
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (dtb_u_u399))
  | _ -> ((((Base_dDiagnostics_dTc.v_tcErr2 dtb_u_u393) (Base_dDiagnostics_dTc.C_TcErr_AmbiguousCtor (dtb_u_u395, (v_overCandidatesText dtb_u_u396)))) dtb_u_u395) (v_overCandidatesText dtb_u_u396))
)
  | _ -> ((((Base_dDiagnostics_dTc.v_tcErr2 dtb_u_u393) (Base_dDiagnostics_dTc.C_TcErr_AmbiguousCtor (dtb_u_u395, (v_overCandidatesText dtb_u_u396)))) dtb_u_u395) (v_overCandidatesText dtb_u_u396))
))
  | B_dData_dMaybe.C_Maybe_Nothing -> ((((v_defaultOrOver dtb_u_u392) dtb_u_u393) dtb_u_u395) dtb_u_u396)
  | _ -> failwith "DT: impossible branch"
))

# 515 "Vuna/Compiler/Elab/Meta.vuna"
let v_typeHeadLookup = (fun (dtb_u_u401 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u402 : Elab_dTypes.t_Ec) (dtb_u_u403 : string) -> (match ((v_dtDataLookup dtb_u_u403) (Elab_dTypes.v_ecDatas dtb_u_u402)) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u404) -> (B_dData_dMaybe.C_Maybe_Just ((Elab_dTypes.v_dtDataKind dtb_u_u404)))
  | B_dData_dMaybe.C_Maybe_Nothing -> (if (((v_isTypeLevelGlobal dtb_u_u401) dtb_u_u402) dtb_u_u403) then (((v_globalsLookup dtb_u_u403) dtb_u_u401) dtb_u_u402) else B_dData_dMaybe.C_Maybe_Nothing)
  | _ -> failwith "DT: impossible branch"
))

# 522 "Vuna/Compiler/Elab/Meta.vuna"
let v_typeLookup = (fun (dtb_u_u405 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u406 : Elab_dTypes.t_Ec) (dtb_u_u407 : string) -> (((v_typeHeadLookup dtb_u_u405) dtb_u_u406) dtb_u_u407))

# 532 "Vuna/Compiler/Elab/Meta.vuna"
let v_valueLookup = (fun (dtb_u_u408 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u409 : Elab_dTypes.t_Ec) (dtb_u_u410 : string) -> (match ((v_dtCtorLookupEc dtb_u_u409) dtb_u_u410) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u411) -> (B_dData_dMaybe.C_Maybe_Just ((C_ValueEntry_VECtor (dtb_u_u411))))
  | B_dData_dMaybe.C_Maybe_Nothing -> (match (((v_globalsLookup dtb_u_u410) dtb_u_u408) dtb_u_u409) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u412) -> (B_dData_dMaybe.C_Maybe_Just ((C_ValueEntry_VEDef (dtb_u_u412))))
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 546 "Vuna/Compiler/Elab/Meta.vuna"
let rec v_teleOf = (fun (dtb_u_u413 : Core_dTerm.t_Term) (dtb_u_u414 : Core_dTerm.t_Value B_dData_dList.t_List) -> (match dtb_u_u413 with
  | Core_dTerm.C_Term_TPi (dtb_u_u415, dtb_u_u416, dtb_u_u417, dtb_u_u418, dtb_u_u419) -> (let dtb_u_u420 = (Core_dTerm.C_Value_VNeutral ((Core_dTerm.C_Neutral_NVar (dtb_u_u415, (B_dData_dList.v_length dtb_u_u414), B_dData_dList.C_List_Nil)))) in (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb_u_u415; B_dData_dPair.f_Pair_second = dtb_u_u417 }, ((v_teleOf dtb_u_u419) (B_dData_dList.C_List__x58__x58_ (dtb_u_u420, dtb_u_u414))))))
  | _ -> B_dData_dList.C_List_Nil
))

# 543 "Vuna/Compiler/Elab/Meta.vuna"
let v_teleOfType = (fun (dtb_u_u421 : Core_dTerm.t_Term) -> ((v_teleOf dtb_u_u421) B_dData_dList.C_List_Nil))

# 554 "Vuna/Compiler/Elab/Meta.vuna"
let rec v_spineOfType = (fun (dtb_u_u422 : Core_dTerm.t_Term) -> (match dtb_u_u422 with
  | Core_dTerm.C_Term_TGlobal (dtb_u_u423) -> { B_dData_dPair.f_Pair_first = dtb_u_u423; B_dData_dPair.f_Pair_second = B_dData_dList.C_List_Nil }
  | Core_dTerm.C_Term_TRecord (dtb_u_u424, dtb_u_u425) -> { B_dData_dPair.f_Pair_first = dtb_u_u424; B_dData_dPair.f_Pair_second = ((B_dData_dList.v_map B_dData_dPair.v_firstOf) dtb_u_u425) }
  | Core_dTerm.C_Term_TApp (dtb_u_u426, dtb_u_u427, dtb_u_u428) -> (match (v_spineOfType dtb_u_u426) with
  | { B_dData_dPair.f_Pair_first = dtb_u_u429; B_dData_dPair.f_Pair_second = dtb_u_u430 } -> { B_dData_dPair.f_Pair_first = dtb_u_u429; B_dData_dPair.f_Pair_second = ((B_dData_dList.v_append dtb_u_u430) (B_dData_dList.C_List__x58__x58_ (dtb_u_u427, B_dData_dList.C_List_Nil))) }
  | _ -> failwith "DT: impossible branch"
)
  | _ -> { B_dData_dPair.f_Pair_first = ""; B_dData_dPair.f_Pair_second = B_dData_dList.C_List_Nil }
))

# 562 "Vuna/Compiler/Elab/Meta.vuna"
let rec v_resultSpine = (fun (dtb_u_u431 : Core_dTerm.t_Term) -> (match dtb_u_u431 with
  | Core_dTerm.C_Term_TPi (dtb_u_u432, dtb_u_u433, dtb_u_u434, dtb_u_u435, dtb_u_u436) -> (v_resultSpine dtb_u_u436)
  | _ -> (v_spineOfType dtb_u_u431)
))

# 587 "Vuna/Compiler/Elab/Meta.vuna"
let v_zonkFuelMax = 1000000

# 644 "Vuna/Compiler/Elab/Meta.vuna"
let v_hasOutOfScopeVar = (fun (dtb_u_u437 : Core_dTerm.t_Term) -> (Core_dTerm.v_hasNegativeVar dtb_u_u437))

# 590 "Vuna/Compiler/Elab/Meta.vuna"
let rec v_zonkTermFuel = (fun (dtb_u_u438 : int) (dtb_u_u439 : Elab_dTypes.t_Ec) (dtb_u_u440 : int) (dtb_u_u441 : Core_dTerm.t_Term) -> (if (dtb_u_u438 <= 0) then dtb_u_u441 else (match dtb_u_u441 with
  | Core_dTerm.C_Term_TMeta (dtb_u_u442) -> (match ((Core_dTerm.v_metaLookup dtb_u_u442) (Elab_dTypes.v_ecSolTbl dtb_u_u439)) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u443) -> (let dtb_u_u444 = ((Core_dEval.v_quote dtb_u_u440) dtb_u_u443) in (if (v_hasOutOfScopeVar dtb_u_u444) then dtb_u_u441 else ((((v_zonkTermFuel (dtb_u_u438 - 1)) dtb_u_u439) dtb_u_u440) dtb_u_u444)))
  | B_dData_dMaybe.C_Maybe_Nothing -> dtb_u_u441
  | _ -> failwith "DT: impossible branch"
)
  | Core_dTerm.C_Term_TPi (dtb_u_u445, dtb_u_u446, dtb_u_u447, dtb_u_u448, dtb_u_u449) -> (Core_dTerm.C_Term_TPi (dtb_u_u445, dtb_u_u446, dtb_u_u447, ((((v_zonkTermFuel (dtb_u_u438 - 1)) dtb_u_u439) dtb_u_u440) dtb_u_u448), ((((v_zonkTermFuel (dtb_u_u438 - 1)) dtb_u_u439) (dtb_u_u440 + 1)) dtb_u_u449)))
  | Core_dTerm.C_Term_TLam (dtb_u_u450, dtb_u_u451, dtb_u_u452, dtb_u_u453, dtb_u_u454) -> (let dtb_u_u455 = (let dtb_u_u456 = dtb_u_u452 in (match dtb_u_u456 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u457) -> (match dtb_u_u457 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u458; B_dData_dPair.f_Pair_second = dtb_u_u459 } -> (match dtb_u_u459 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u460; B_dData_dPair.f_Pair_second = dtb_u_u461 } -> (let dtb_u_u462 = (match dtb_u_u460 with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u465) -> (B_dData_dMaybe.C_Maybe_Just (((((v_zonkTermFuel (dtb_u_u438 - 1)) dtb_u_u439) dtb_u_u440) dtb_u_u465)))
  | _ -> failwith "DT: impossible branch"
) in (let dtb_u_u463 = (match dtb_u_u461 with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u464) -> (B_dData_dMaybe.C_Maybe_Just (((((v_zonkTermFuel (dtb_u_u438 - 1)) dtb_u_u439) (dtb_u_u440 + 1)) dtb_u_u464)))
  | _ -> failwith "DT: impossible branch"
) in (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = dtb_u_u458; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = dtb_u_u462; B_dData_dPair.f_Pair_second = dtb_u_u463 } }))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) in (Core_dTerm.C_Term_TLam (dtb_u_u450, dtb_u_u451, dtb_u_u455, dtb_u_u453, ((((v_zonkTermFuel (dtb_u_u438 - 1)) dtb_u_u439) (dtb_u_u440 + 1)) dtb_u_u454))))
  | Core_dTerm.C_Term_TApp (dtb_u_u466, dtb_u_u467, dtb_u_u468) -> (Core_dTerm.C_Term_TApp (((((v_zonkTermFuel (dtb_u_u438 - 1)) dtb_u_u439) dtb_u_u440) dtb_u_u466), ((((v_zonkTermFuel (dtb_u_u438 - 1)) dtb_u_u439) dtb_u_u440) dtb_u_u467), dtb_u_u468))
  | Core_dTerm.C_Term_TCon (dtb_u_u469, dtb_u_u470) -> (Core_dTerm.C_Term_TCon (dtb_u_u469, ((B_dData_dList.v_map (fun (dtb_u_u471 : (Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair) -> { B_dData_dPair.f_Pair_first = ((((v_zonkTermFuel (dtb_u_u438 - 1)) dtb_u_u439) dtb_u_u440) (B_dData_dPair.v_firstOf dtb_u_u471)); B_dData_dPair.f_Pair_second = (B_dData_dPair.v_secondOf dtb_u_u471) })) dtb_u_u470)))
  | Core_dTerm.C_Term_TMk (dtb_u_u472, dtb_u_u473) -> (Core_dTerm.C_Term_TMk (dtb_u_u472, ((B_dData_dList.v_map (fun (dtb_u_u474 : (Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair) -> { B_dData_dPair.f_Pair_first = ((((v_zonkTermFuel (dtb_u_u438 - 1)) dtb_u_u439) dtb_u_u440) (B_dData_dPair.v_firstOf dtb_u_u474)); B_dData_dPair.f_Pair_second = (B_dData_dPair.v_secondOf dtb_u_u474) })) dtb_u_u473)))
  | Core_dTerm.C_Term_TCase (dtb_u_u475, dtb_u_u476) -> (Core_dTerm.C_Term_TCase (((((v_zonkTermFuel (dtb_u_u438 - 1)) dtb_u_u439) dtb_u_u440) dtb_u_u475), ((B_dData_dList.v_map (fun (dtb_u_u477 : Core_dTerm.t_CaseAlt) -> ((((v_zonkAltFuel (dtb_u_u438 - 1)) dtb_u_u439) dtb_u_u440) dtb_u_u477))) dtb_u_u476)))
  | Core_dTerm.C_Term_TIf (dtb_u_u478, dtb_u_u479, dtb_u_u480) -> (Core_dTerm.C_Term_TIf (((((v_zonkTermFuel (dtb_u_u438 - 1)) dtb_u_u439) dtb_u_u440) dtb_u_u478), ((((v_zonkTermFuel (dtb_u_u438 - 1)) dtb_u_u439) dtb_u_u440) dtb_u_u479), ((((v_zonkTermFuel (dtb_u_u438 - 1)) dtb_u_u439) dtb_u_u440) dtb_u_u480)))
  | Core_dTerm.C_Term_TProj (dtb_u_u481, dtb_u_u482, dtb_u_u483, dtb_u_u484, dtb_u_u485) -> (Core_dTerm.C_Term_TProj (((((v_zonkTermFuel (dtb_u_u438 - 1)) dtb_u_u439) dtb_u_u440) dtb_u_u481), dtb_u_u482, dtb_u_u483, dtb_u_u484, dtb_u_u485))
  | Core_dTerm.C_Term_TRecUpd (dtb_u_u486, dtb_u_u487, dtb_u_u488, dtb_u_u489, dtb_u_u490) -> (Core_dTerm.C_Term_TRecUpd (((((v_zonkTermFuel (dtb_u_u438 - 1)) dtb_u_u439) dtb_u_u440) dtb_u_u486), dtb_u_u487, dtb_u_u488, dtb_u_u489, ((((v_zonkTermFuel (dtb_u_u438 - 1)) dtb_u_u439) dtb_u_u440) dtb_u_u490)))
  | Core_dTerm.C_Term_TRecord (dtb_u_u491, dtb_u_u492) -> (Core_dTerm.C_Term_TRecord (dtb_u_u491, ((B_dData_dList.v_map (fun (dtb_u_u493 : (Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair) -> { B_dData_dPair.f_Pair_first = ((((v_zonkTermFuel (dtb_u_u438 - 1)) dtb_u_u439) dtb_u_u440) (B_dData_dPair.v_firstOf dtb_u_u493)); B_dData_dPair.f_Pair_second = (B_dData_dPair.v_secondOf dtb_u_u493) })) dtb_u_u492)))
  | _ -> dtb_u_u441
)))
# 633 "Vuna/Compiler/Elab/Meta.vuna"
and v_zonkAltFuel = (fun (dtb_u_u494 : int) (dtb_u_u495 : Elab_dTypes.t_Ec) (dtb_u_u496 : int) (dtb_u_u497 : Core_dTerm.t_CaseAlt) -> (if (dtb_u_u494 <= 0) then dtb_u_u497 else (match dtb_u_u497 with
  | { Core_dTerm.f_CaseAlt_caseAltName = dtb_u_u498; Core_dTerm.f_CaseAlt_caseAltBinders = dtb_u_u499; Core_dTerm.f_CaseAlt_caseAltBody = dtb_u_u500 } -> { Core_dTerm.f_CaseAlt_caseAltName = dtb_u_u498; Core_dTerm.f_CaseAlt_caseAltBinders = dtb_u_u499; Core_dTerm.f_CaseAlt_caseAltBody = ((((v_zonkTermFuel (dtb_u_u494 - 1)) dtb_u_u495) (dtb_u_u496 + (B_dData_dList.v_length dtb_u_u499))) dtb_u_u500) }
  | _ -> failwith "DT: impossible branch"
)))

# 579 "Vuna/Compiler/Elab/Meta.vuna"
let v_zonkTerm = (fun (dtb_u_u501 : Elab_dTypes.t_Ec) (dtb_u_u502 : int) (dtb_u_u503 : Core_dTerm.t_Term) -> (let dtb_u_u504 = (((Base_dObs.v_obsCountAt 2) "vuna.counter.meta.zonk") 1) in ((((v_zonkTermFuel v_zonkFuelMax) dtb_u_u501) dtb_u_u502) dtb_u_u503)))

# 647 "Vuna/Compiler/Elab/Meta.vuna"
let v_hasOutOfScopeVarArgs = (fun (dtb_u_u505 : (Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (Core_dTerm.v_anyNegativeVarArgs dtb_u_u505))

# 650 "Vuna/Compiler/Elab/Meta.vuna"
let v_hasOutOfScopeVarAlts = (fun (dtb_u_u506 : Core_dTerm.t_CaseAlt B_dData_dList.t_List) -> (Core_dTerm.v_anyNegativeVarAlts dtb_u_u506))

# 658 "Vuna/Compiler/Elab/Meta.vuna"
let rec v_prependFamParams = (fun (dtb_u_u507 : Core_dTerm.t_Term) (dtb_u_u508 : Frontend_dAst.t_Expr) (dtb_u_u509 : Base_dSource.t_Span) -> (match dtb_u_u507 with
  | Core_dTerm.C_Term_TPi (dtb_u_u510, dtb_u_u511, dtb_u_u512, dtb_u_u513, dtb_u_u514) -> (match dtb_u_u513 with
  | Core_dTerm.C_Term_TType (dtb_u_u515) -> (Frontend_dAst.C_Expr_EPi (dtb_u_u510, true, B_dData_dMaybe.C_Maybe_Nothing, (Frontend_dAst.C_Expr_EVar ("Type", (Frontend_dAst.v_detachedNodeRef dtb_u_u509))), (((v_prependFamParams dtb_u_u514) dtb_u_u508) dtb_u_u509), (Frontend_dAst.v_detachedNodeRef dtb_u_u509)))
  | _ -> dtb_u_u508
)
  | _ -> dtb_u_u508
))

# 673 "Vuna/Compiler/Elab/Meta.vuna"
let rec v_dropParams = (fun (dtb_u_u516 : Core_dTerm.t_Term) -> (match dtb_u_u516 with
  | Core_dTerm.C_Term_TPi (dtb_u_u517, dtb_u_u518, dtb_u_u519, dtb_u_u520, dtb_u_u521) -> (v_dropParams dtb_u_u521)
  | _ -> dtb_u_u516
))

# 677 "Vuna/Compiler/Elab/Meta.vuna"
let[@tail_mod_cons] rec v_ctorGlobals = (fun (dtb_u_u522 : Elab_dTypes.t_DtCtor B_dData_dList.t_List) -> (match dtb_u_u522 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u523, dtb_u_u524) -> (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = (Elab_dTypes.v_dtCtorName dtb_u_u523); B_dData_dPair.f_Pair_second = (Elab_dTypes.v_dtCtorType dtb_u_u523) }, (v_ctorGlobals dtb_u_u524)))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 687 "Vuna/Compiler/Elab/Meta.vuna"
let rec v_lookupDataHead = (fun (dtb_u_u525 : string) (dtb_u_u526 : t_DataHead B_dData_dList.t_List) -> (match dtb_u_u526 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u527, dtb_u_u528) -> (if ((dtb_u_u527).f_DataHead_dataHeadName = dtb_u_u525) then (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (dtb_u_u527).f_DataHead_dataHeadKind; B_dData_dPair.f_Pair_second = (dtb_u_u527).f_DataHead_dataHeadArity })) else ((v_lookupDataHead dtb_u_u525) dtb_u_u528))
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 703 "Vuna/Compiler/Elab/Meta.vuna"
let v_dictTypeName = (fun (dtb_u_u529 : string) -> ("Dict_" ^ dtb_u_u529))

# 706 "Vuna/Compiler/Elab/Meta.vuna"
let v_dictCtorName = (fun (dtb_u_u530 : string) -> ("MkDict_" ^ dtb_u_u530))

# 710 "Vuna/Compiler/Elab/Meta.vuna"
let rec v_collectTraitDecls = (fun (dtb_u_u531 : Frontend_dAst.t_Decl B_dData_dList.t_List) (dtb_u_u532 : (Frontend_dAst.t_Decl, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match dtb_u_u531 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u533, dtb_u_u534) -> (match dtb_u_u533 with
  | Frontend_dAst.C_Decl_DTrait (dtb_u_u535, dtb_u_u536, dtb_u_u537, dtb_u_u538, dtb_u_u539) -> ((v_collectTraitDecls dtb_u_u534) (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb_u_u533; B_dData_dPair.f_Pair_second = (Frontend_dAst.v_nodeRefSpan dtb_u_u539) }, dtb_u_u532)))
  | _ -> ((v_collectTraitDecls dtb_u_u534) dtb_u_u532)
)
  | B_dData_dList.C_List_Nil -> (B_dData_dList.v_reverse dtb_u_u532)
  | _ -> failwith "DT: impossible branch"
))

# 717 "Vuna/Compiler/Elab/Meta.vuna"
let rec v_collectInstDecls = (fun (dtb_u_u540 : Frontend_dAst.t_Decl B_dData_dList.t_List) (dtb_u_u541 : (Frontend_dAst.t_Decl, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match dtb_u_u540 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u542, dtb_u_u543) -> (match dtb_u_u542 with
  | Frontend_dAst.C_Decl_DInstance (dtb_u_u544, dtb_u_u545, dtb_u_u546, dtb_u_u547) -> ((v_collectInstDecls dtb_u_u543) (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb_u_u542; B_dData_dPair.f_Pair_second = (Frontend_dAst.v_nodeRefSpan dtb_u_u547) }, dtb_u_u541)))
  | _ -> ((v_collectInstDecls dtb_u_u543) dtb_u_u541)
)
  | B_dData_dList.C_List_Nil -> (B_dData_dList.v_reverse dtb_u_u541)
  | _ -> failwith "DT: impossible branch"
))

# 725 "Vuna/Compiler/Elab/Meta.vuna"
let v_paramNameOf = (fun (dtb_u_u548 : string B_dData_dList.t_List) -> (match dtb_u_u548 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u549, dtb_u_u550) -> dtb_u_u549
  | B_dData_dList.C_List_Nil -> "_"
  | _ -> failwith "DT: impossible branch"
))

# 733 "Vuna/Compiler/Elab/Meta.vuna"
let[@tail_mod_cons] rec v_methodArgTermsGo = (fun (dtb_u_u551 : Core_dTerm.t_Rig B_dData_dList.t_List) (dtb_u_u552 : int) (dtb_u_u553 : int) (dtb_u_u554 : int) -> (match dtb_u_u551 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u555, dtb_u_u556) -> (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = (Core_dTerm.C_Term_TVar (("x" ^ (string_of_int dtb_u_u553)), (dtb_u_u552 + ((dtb_u_u554 - 1) - dtb_u_u553)), { Base_dSource.f_Span_spanFile = ""; Base_dSource.f_Span_spanStartLine = 0; Base_dSource.f_Span_spanStartCol = 0; Base_dSource.f_Span_spanEndLine = 0; Base_dSource.f_Span_spanEndCol = 0; Base_dSource.f_Span_spanStartOffset = 0; Base_dSource.f_Span_spanEndOffset = 0 })); B_dData_dPair.f_Pair_second = dtb_u_u555 }, ((((v_methodArgTermsGo dtb_u_u556) dtb_u_u552) (dtb_u_u553 + 1)) dtb_u_u554)))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 730 "Vuna/Compiler/Elab/Meta.vuna"
let v_methodArgTerms = (fun (dtb_u_u557 : Core_dTerm.t_Rig B_dData_dList.t_List) (dtb_u_u558 : int) -> ((((v_methodArgTermsGo dtb_u_u557) dtb_u_u558) 0) (B_dData_dList.v_length dtb_u_u557)))

# 740 "Vuna/Compiler/Elab/Meta.vuna"
let[@tail_mod_cons] rec v_methodArgLams = (fun (dtb_u_u559 : Core_dTerm.t_Rig B_dData_dList.t_List) (dtb_u_u560 : int) (dtb_u_u561 : Core_dTerm.t_Term) -> (match dtb_u_u559 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u562, dtb_u_u563) -> (Core_dTerm.C_Term_TLam (("x" ^ (string_of_int dtb_u_u560)), dtb_u_u562, B_dData_dMaybe.C_Maybe_Nothing, Base_dSource.v_spanEmpty, (((v_methodArgLams dtb_u_u563) (dtb_u_u560 + 1)) dtb_u_u561)))
  | B_dData_dList.C_List_Nil -> dtb_u_u561
  | _ -> failwith "DT: impossible branch"
))

# 748 "Vuna/Compiler/Elab/Meta.vuna"
let v_fieldVarName = (fun (dtb_u_u564 : int) -> ("_f" ^ (string_of_int dtb_u_u564)))

# 757 "Vuna/Compiler/Elab/Meta.vuna"
let rec v_fieldBinderGoGo = (fun (dtb_u_u565 : int) (dtb_u_u566 : int) (dtb_u_u567 : (string, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (if (dtb_u_u565 <= 0) then (B_dData_dList.v_reverse dtb_u_u567) else (((v_fieldBinderGoGo (dtb_u_u565 - 1)) dtb_u_u566) (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = (v_fieldVarName (dtb_u_u566 - dtb_u_u565)); B_dData_dPair.f_Pair_second = Core_dTerm.C_Rig_RigOmega }, dtb_u_u567)))))

# 754 "Vuna/Compiler/Elab/Meta.vuna"
let v_fieldBinderGo = (fun (dtb_u_u568 : int) (dtb_u_u569 : int) (dtb_u_u570 : (string, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (((v_fieldBinderGoGo (dtb_u_u568 - dtb_u_u569)) dtb_u_u568) dtb_u_u570))

# 751 "Vuna/Compiler/Elab/Meta.vuna"
let v_fieldBinderNames = (fun (dtb_u_u571 : int) -> (((v_fieldBinderGo dtb_u_u571) 0) B_dData_dList.C_List_Nil))

# 766 "Vuna/Compiler/Elab/Meta.vuna"
let rec v_findClassByMethod = (fun (dtb_u_u572 : string) (dtb_u_u573 : Elab_dTypes.t_DtClass B_dData_dList.t_List) -> (match dtb_u_u573 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u574, dtb_u_u575) -> (if ((B_dData_dList.v_memName dtb_u_u572) ((B_dData_dList.v_map B_dData_dPair.v_firstOf) (dtb_u_u574).Elab_dTypes.f_DtClass_dtClassMethods)) then (B_dData_dMaybe.C_Maybe_Just (dtb_u_u574)) else ((v_findClassByMethod dtb_u_u572) dtb_u_u575))
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 787 "Vuna/Compiler/Elab/Meta.vuna"
let rec v_allTeleArgs = (fun (dtb_u_u576 : int) (dtb_u_u577 : (Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match dtb_u_u577 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u578, dtb_u_u579) -> (match (B_dData_dPair.v_firstOf dtb_u_u578) with
  | Core_dTerm.C_Term_TVar (dtb_u_u580, dtb_u_u581, dtb_u_u582) -> (if (if (dtb_u_u581 >= 0) then (dtb_u_u581 < dtb_u_u576) else false) then ((v_allTeleArgs dtb_u_u576) dtb_u_u579) else false)
  | _ -> false
)
  | B_dData_dList.C_List_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

# 778 "Vuna/Compiler/Elab/Meta.vuna"
let v_isBlanketInstHead = (fun (dtb_u_u583 : int) (dtb_u_u584 : Core_dTerm.t_Term) -> (if (dtb_u_u583 <= 0) then false else (let dtb_u_u585 = (Elab_dTypes.v_flattenTaggedApp dtb_u_u584) in (match dtb_u_u585 with
  | B_dData_dMaybe.C_Maybe_Nothing -> false
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u586) -> (match dtb_u_u586 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u587; B_dData_dPair.f_Pair_second = dtb_u_u588 } -> (if (v_nonEmpty dtb_u_u588) then ((v_allTeleArgs dtb_u_u583) dtb_u_u588) else false)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))

# 794 "Vuna/Compiler/Elab/Meta.vuna"
let v_isBlanketInst = (fun (dtb_u_u589 : Elab_dTypes.t_DtInst) -> (match dtb_u_u589 with
  | { Elab_dTypes.f_DtInst_dtInstName = dtb_u_u590; Elab_dTypes.f_DtInst_dtInstSym = dtb_u_u591; Elab_dTypes.f_DtInst_dtInstKey = dtb_u_u592; Elab_dTypes.f_DtInst_dtInstTele = dtb_u_u593; Elab_dTypes.f_DtInst_dtInstCtx = dtb_u_u594; Elab_dTypes.f_DtInst_dtInstHead = dtb_u_u595; Elab_dTypes.f_DtInst_dtInstSpan = dtb_u_u596 } -> ((v_isBlanketInstHead (B_dData_dList.v_length dtb_u_u593)) dtb_u_u595)
  | _ -> failwith "DT: impossible branch"
))

# 800 "Vuna/Compiler/Elab/Meta.vuna"
let v_substClassParam = (fun (dtb_u_u597 : string) (dtb_u_u598 : Core_dTerm.t_Term) (dtb_u_u599 : Core_dTerm.t_Term) -> (((Core_dTerm.v_substVarAt 0) dtb_u_u598) dtb_u_u599))

# 804 "Vuna/Compiler/Elab/Meta.vuna"
let v_litEqName = (fun (dtb_u_u600 : string) -> (if (dtb_u_u600 = Base_dIntrinsics.v_strTypeName) then "bi_eq_str" else "bi_eq_int"))

# 846 "Vuna/Compiler/Elab/Meta.vuna"
let v_isStringImplicitDomain = (fun (dtb_u_u601 : Elab_dTypes.t_Ec) (dtb_u_u602 : Core_dTerm.t_Value) -> (let dtb_u_u603 = ((Elab_dTypes.v_forceVal dtb_u_u601) dtb_u_u602) in (match dtb_u_u603 with
  | Core_dTerm.C_Value_VNeutral (dtb_u_u604) -> (match dtb_u_u604 with
  | Core_dTerm.C_Neutral_NGlobal (dtb_u_u605, dtb_u_u606) -> (match dtb_u_u606 with
  | B_dData_dList.C_List_Nil -> (dtb_u_u605 = Base_dIntrinsics.v_strTypeName)
  | _ -> false
)
  | _ -> false
)
  | _ -> false
)))

# 852 "Vuna/Compiler/Elab/Meta.vuna"
let v_implicitBinderRig = (fun (dtb_u_u607 : Elab_dTypes.t_Ec) (dtb_u_u608 : Core_dTerm.t_Value) -> (if ((v_isStringImplicitDomain dtb_u_u607) dtb_u_u608) then Core_dTerm.C_Rig_RigOmega else Core_dTerm.C_Rig_Rig0))

# 915 "Vuna/Compiler/Elab/Meta.vuna"
let rec v_ctxItemAt = (fun (dtb_u_u609 : int) (dtb_u_u610 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match dtb_u_u610 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u611, dtb_u_u612) -> (if (dtb_u_u609 <= 0) then (B_dData_dMaybe.C_Maybe_Just (dtb_u_u611)) else ((v_ctxItemAt (dtb_u_u609 - 1)) dtb_u_u612))
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 864 "Vuna/Compiler/Elab/Meta.vuna"
let v_neutralBinderType = (fun (dtb_u_u613 : Elab_dTypes.t_Ctx) (dtb_u_u614 : Elab_dTypes.t_Ec) (dtb_u_u615 : int) -> (let dtb_u_u616 = (Elab_dTypes.v_ctxDepth dtb_u_u613) in (let dtb_u_u617 = ((dtb_u_u616 - dtb_u_u615) - 1) in (if (dtb_u_u615 < 0) then B_dData_dMaybe.C_Maybe_Nothing else (if (dtb_u_u617 < 0) then B_dData_dMaybe.C_Maybe_Nothing else (match ((v_ctxItemAt dtb_u_u617) (dtb_u_u613).Elab_dTypes.f_Ctx_ctxItems) with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u618) -> (B_dData_dMaybe.C_Maybe_Just ((((Elab_dTypes.v_varTypeValue dtb_u_u613) dtb_u_u617) (B_dData_dPair.v_secondOf dtb_u_u618))))
  | _ -> failwith "DT: impossible branch"
))))))

# 941 "Vuna/Compiler/Elab/Meta.vuna"
let v_rigOfQty = (fun (dtb_u_u619 : bool) (dtb_u_u620 : bool) (dtb_u_u621 : Frontend_dAst.t_Qty B_dData_dMaybe.t_Maybe) -> (if (if dtb_u_u619 then true else dtb_u_u620) then Core_dTerm.C_Rig_Rig0 else (let dtb_u_u622 = dtb_u_u621 in (match dtb_u_u622 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u623) -> (match dtb_u_u623 with
  | Frontend_dAst.C_Qty_Q1 -> Core_dTerm.C_Rig_Rig1
  | Frontend_dAst.C_Qty_Q0 -> Core_dTerm.C_Rig_Rig0
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> Core_dTerm.C_Rig_RigOmega
  | _ -> failwith "DT: impossible branch"
))))

# 964 "Vuna/Compiler/Elab/Meta.vuna"
let v_isTypeHeadOpaqueEc = (fun (dtb_u_u624 : Elab_dTypes.t_Ec) (dtb_u_u625 : string) -> (if (B_dData_dBool.v_not ((v_isDataFamilyName dtb_u_u624) dtb_u_u625)) then (B_dData_dBool.v_not (Base_dIntrinsics.v_isTypeConstructorName dtb_u_u625)) else false))

# 980 "Vuna/Compiler/Elab/Meta.vuna"
let v_isUniverseValue = (fun (dtb_u_u626 : Core_dTerm.t_Value) -> (match dtb_u_u626 with
  | Core_dTerm.C_Value_VType (dtb_u_u627) -> true
  | _ -> false
))

# 971 "Vuna/Compiler/Elab/Meta.vuna"
let rec v_isFamilyKindFuel = (fun (dtb_u_u628 : int) (dtb_u_u629 : Core_dTerm.t_Value) -> (if (dtb_u_u628 <= 0) then false else (match dtb_u_u629 with
  | Core_dTerm.C_Value_VPi (dtb_u_u630, dtb_u_u631, dtb_u_u632, dtb_u_u633, dtb_u_u634) -> (if (B_dData_dBool.v_not (v_isUniverseValue dtb_u_u633)) then true else ((v_isFamilyKindFuel (dtb_u_u628 - 1)) ((Core_dEval.v_applyClosure dtb_u_u634) (Core_dTerm.C_Value_VNeutral ((Core_dTerm.C_Neutral_NVar (dtb_u_u630, 0, B_dData_dList.C_List_Nil)))))))
  | _ -> false
)))

# 968 "Vuna/Compiler/Elab/Meta.vuna"
let v_isFamilyKindValue = (fun (dtb_u_u635 : Core_dTerm.t_Value) -> ((v_isFamilyKindFuel 64) dtb_u_u635))

# 997 "Vuna/Compiler/Elab/Meta.vuna"
let rec v_valueHasImplicitPiFuel = (fun (dtb_u_u636 : int) (dtb_u_u637 : Core_dTerm.t_Value) -> (if (dtb_u_u636 <= 0) then false else (match dtb_u_u637 with
  | Core_dTerm.C_Value_VPi (dtb_u_u638, dtb_u_u639, dtb_u_u640, dtb_u_u641, dtb_u_u642) -> (if dtb_u_u639 then true else ((v_valueHasImplicitPiFuel (dtb_u_u636 - 1)) ((Core_dEval.v_applyClosure dtb_u_u642) (Core_dTerm.C_Value_VNeutral ((Core_dTerm.C_Neutral_NVar (dtb_u_u638, 0, B_dData_dList.C_List_Nil)))))))
  | _ -> false
)))

# 994 "Vuna/Compiler/Elab/Meta.vuna"
let v_valueHasImplicitPi = (fun (dtb_u_u643 : Core_dTerm.t_Value) -> ((v_valueHasImplicitPiFuel 64) dtb_u_u643))

# 1039 "Vuna/Compiler/Elab/Meta.vuna"
let v_isTypeishValue = (fun (dtb_u_u644 : Core_dTerm.t_Value) -> (match dtb_u_u644 with
  | Core_dTerm.C_Value_VMeta (dtb_u_u645, dtb_u_u646) -> true
  | Core_dTerm.C_Value_VNeutral (dtb_u_u647) -> true
  | Core_dTerm.C_Value_VPi (dtb_u_u648, dtb_u_u649, dtb_u_u650, dtb_u_u651, dtb_u_u652) -> true
  | Core_dTerm.C_Value_VType (dtb_u_u653) -> true
  | _ -> false
))

# 1046 "Vuna/Compiler/Elab/Meta.vuna"
let rec v_memLevel = (fun (dtb_u_u654 : int) (dtb_u_u655 : int B_dData_dList.t_List) -> (match dtb_u_u655 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u656, dtb_u_u657) -> (if (dtb_u_u656 = dtb_u_u654) then true else ((v_memLevel dtb_u_u654) dtb_u_u657))
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 1006 "Vuna/Compiler/Elab/Meta.vuna"
let rec v_valueOpaqueGo = (fun (dtb_u_u658 : int) (dtb_u_u659 : (int) -> bool) (dtb_u_u660 : (string) -> bool) (dtb_u_u661 : int) (dtb_u_u662 : int B_dData_dList.t_List) (dtb_u_u663 : Core_dTerm.t_Value) -> (if (dtb_u_u658 <= 0) then true else (match dtb_u_u663 with
  | Core_dTerm.C_Value_VType (dtb_u_u664) -> false
  | Core_dTerm.C_Value_VMeta (dtb_u_u665, dtb_u_u666) -> false
  | Core_dTerm.C_Value_VNeutral (dtb_u_u667) -> (match dtb_u_u667 with
  | Core_dTerm.C_Neutral_NVar (dtb_u_u668, dtb_u_u669, dtb_u_u670) -> (if (dtb_u_u669 < dtb_u_u661) then (dtb_u_u659 dtb_u_u669) else (if ((v_memLevel dtb_u_u669) dtb_u_u662) then true else false))
  | Core_dTerm.C_Neutral_NGlobal (dtb_u_u671, dtb_u_u672) -> (if (dtb_u_u660 dtb_u_u671) then true else ((((((v_valueOpaqueTypeSpine dtb_u_u658) dtb_u_u659) dtb_u_u660) dtb_u_u661) dtb_u_u662) dtb_u_u672))
  | _ -> failwith "DT: impossible branch"
)
  | Core_dTerm.C_Value_VPi (dtb_u_u673, dtb_u_u674, dtb_u_u675, dtb_u_u676, dtb_u_u677) -> (let dtb_u_u678 = (if (v_isFamilyKindValue dtb_u_u676) then (B_dData_dList.C_List__x58__x58_ (dtb_u_u661, dtb_u_u662)) else dtb_u_u662) in (if ((((((v_valueOpaqueGo (dtb_u_u658 - 1)) dtb_u_u659) dtb_u_u660) dtb_u_u661) dtb_u_u662) dtb_u_u676) then true else ((((((v_valueOpaqueGo (dtb_u_u658 - 1)) dtb_u_u659) dtb_u_u660) (dtb_u_u661 + 1)) dtb_u_u678) ((Core_dEval.v_applyClosure dtb_u_u677) (Core_dTerm.C_Value_VNeutral ((Core_dTerm.C_Neutral_NVar (dtb_u_u673, dtb_u_u661, B_dData_dList.C_List_Nil))))))))
  | _ -> true
)))
# 1028 "Vuna/Compiler/Elab/Meta.vuna"
and v_valueOpaqueTypeSpine = (fun (dtb_u_u679 : int) (dtb_u_u680 : (int) -> bool) (dtb_u_u681 : (string) -> bool) (dtb_u_u682 : int) (dtb_u_u683 : int B_dData_dList.t_List) (dtb_u_u684 : Core_dTerm.t_Value B_dData_dList.t_List) -> (if (dtb_u_u679 <= 0) then true else (match dtb_u_u684 with
  | B_dData_dList.C_List_Nil -> false
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u685, dtb_u_u686) -> (if (if (v_isTypeishValue dtb_u_u685) then ((((((v_valueOpaqueGo (dtb_u_u679 - 1)) dtb_u_u680) dtb_u_u681) dtb_u_u682) dtb_u_u683) dtb_u_u685) else false) then true else ((((((v_valueOpaqueTypeSpine (dtb_u_u679 - 1)) dtb_u_u680) dtb_u_u681) dtb_u_u682) dtb_u_u683) dtb_u_u686))
  | _ -> failwith "DT: impossible branch"
)))

# 988 "Vuna/Compiler/Elab/Meta.vuna"
let v_valueOpaqueScoped = (fun (dtb_u_u687 : (int) -> bool) (dtb_u_u688 : (string) -> bool) (dtb_u_u689 : int) (dtb_u_u690 : int B_dData_dList.t_List) (dtb_u_u691 : Core_dTerm.t_Value) -> ((((((v_valueOpaqueGo 128) dtb_u_u687) dtb_u_u688) dtb_u_u689) dtb_u_u690) dtb_u_u691))

# 1051 "Vuna/Compiler/Elab/Meta.vuna"
let v_nvarOpaqueCtx = (fun (dtb_u_u692 : Elab_dTypes.t_Ctx) (dtb_u_u693 : int) -> (let dtb_u_u694 = (((Elab_dTypes.v_ctxDepth dtb_u_u692) - 1) - dtb_u_u693) in (if (dtb_u_u694 < 0) then false else (let dtb_u_u695 = ((v_ctxItemAt dtb_u_u694) (dtb_u_u692).Elab_dTypes.f_Ctx_ctxItems) in (match dtb_u_u695 with
  | B_dData_dMaybe.C_Maybe_Nothing -> false
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u696) -> (match dtb_u_u696 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u697; B_dData_dPair.f_Pair_second = dtb_u_u698 } -> (v_isFamilyKindValue (((Elab_dTypes.v_varTypeValue dtb_u_u692) dtb_u_u694) dtb_u_u698))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))))

# 1064 "Vuna/Compiler/Elab/Meta.vuna"
let v_zonkValueOnly = (fun (dtb_u_u699 : Elab_dTypes.t_Ec) (dtb_u_u700 : Core_dTerm.t_Value) -> ((((Core_dEval.v_force (((B_dContainer_dHashMap.v_fromList B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) B_dData_dList.C_List_Nil)) (Elab_dTypes.v_ecSolsP dtb_u_u699)) Core_dTerm.v_defaultFuel) dtb_u_u700))

# 1067 "Vuna/Compiler/Elab/Meta.vuna"
let v_isOpaqueRuntimeTyIn = (fun (dtb_u_u701 : Elab_dTypes.t_Ec) (dtb_u_u702 : Elab_dTypes.t_Ctx) (dtb_u_u703 : Core_dTerm.t_Value) -> (((((v_valueOpaqueScoped (v_nvarOpaqueCtx dtb_u_u702)) (v_isTypeHeadOpaqueEc dtb_u_u701)) (Elab_dTypes.v_ctxDepth dtb_u_u702)) B_dData_dList.C_List_Nil) ((v_zonkValueOnly dtb_u_u701) dtb_u_u703)))

# 1076 "Vuna/Compiler/Elab/Meta.vuna"
let v_castErased = (fun (dtb_u_u704 : Core_dTerm.t_Term) -> (Core_dTerm.C_Term_TApp ((Core_dTerm.C_Term_TGlobal (Base_dIntrinsics.v_primEraseName)), dtb_u_u704, Core_dTerm.C_Rig_Rig1)))

# 1126 "Vuna/Compiler/Elab/Meta.vuna"
let v_wrapOpaqueVar = (fun (dtb_u_u705 : int) (dtb_u_u706 : int B_dData_dList.t_List) (dtb_u_u707 : string) (dtb_u_u708 : int) -> (if (dtb_u_u708 < dtb_u_u705) then (Core_dTerm.C_Term_TVar (dtb_u_u707, dtb_u_u708, { Base_dSource.f_Span_spanFile = ""; Base_dSource.f_Span_spanStartLine = 0; Base_dSource.f_Span_spanStartCol = 0; Base_dSource.f_Span_spanEndLine = 0; Base_dSource.f_Span_spanEndCol = 0; Base_dSource.f_Span_spanStartOffset = 0; Base_dSource.f_Span_spanEndOffset = 0 })) else (if ((v_memLevel (dtb_u_u708 - dtb_u_u705)) dtb_u_u706) then (v_castErased (Core_dTerm.C_Term_TVar (dtb_u_u707, dtb_u_u708, { Base_dSource.f_Span_spanFile = ""; Base_dSource.f_Span_spanStartLine = 0; Base_dSource.f_Span_spanStartCol = 0; Base_dSource.f_Span_spanEndLine = 0; Base_dSource.f_Span_spanEndCol = 0; Base_dSource.f_Span_spanStartOffset = 0; Base_dSource.f_Span_spanEndOffset = 0 }))) else (Core_dTerm.C_Term_TVar (dtb_u_u707, dtb_u_u708, { Base_dSource.f_Span_spanFile = ""; Base_dSource.f_Span_spanStartLine = 0; Base_dSource.f_Span_spanStartCol = 0; Base_dSource.f_Span_spanEndLine = 0; Base_dSource.f_Span_spanEndCol = 0; Base_dSource.f_Span_spanStartOffset = 0; Base_dSource.f_Span_spanEndOffset = 0 })))))

# 1085 "Vuna/Compiler/Elab/Meta.vuna"
let rec v_wrapOpaqueUsesFuel = (fun (dtb_u_u709 : int) (dtb_u_u710 : int) (dtb_u_u711 : int B_dData_dList.t_List) (dtb_u_u712 : Core_dTerm.t_Term) -> (if (dtb_u_u709 <= 0) then dtb_u_u712 else (match dtb_u_u712 with
  | Core_dTerm.C_Term_TVar (dtb_u_u713, dtb_u_u714, dtb_u_u715) -> ((((v_wrapOpaqueVar dtb_u_u710) dtb_u_u711) dtb_u_u713) dtb_u_u714)
  | Core_dTerm.C_Term_TGlobal (dtb_u_u716) -> (Core_dTerm.C_Term_TGlobal (dtb_u_u716))
  | Core_dTerm.C_Term_TMeta (dtb_u_u717) -> (Core_dTerm.C_Term_TMeta (dtb_u_u717))
  | Core_dTerm.C_Term_TType (dtb_u_u718) -> (Core_dTerm.C_Term_TType (dtb_u_u718))
  | Core_dTerm.C_Term_TInt (dtb_u_u719) -> (Core_dTerm.C_Term_TInt (dtb_u_u719))
  | Core_dTerm.C_Term_TStr (dtb_u_u720) -> (Core_dTerm.C_Term_TStr (dtb_u_u720))
  | Core_dTerm.C_Term_TFloat (dtb_u_u721) -> (Core_dTerm.C_Term_TFloat (dtb_u_u721))
  | Core_dTerm.C_Term_TBool (dtb_u_u722) -> (Core_dTerm.C_Term_TBool (dtb_u_u722))
  | Core_dTerm.C_Term_TPi (dtb_u_u723, dtb_u_u724, dtb_u_u725, dtb_u_u726, dtb_u_u727) -> (Core_dTerm.C_Term_TPi (dtb_u_u723, dtb_u_u724, dtb_u_u725, ((((v_wrapOpaqueUsesFuel (dtb_u_u709 - 1)) dtb_u_u710) dtb_u_u711) dtb_u_u726), ((((v_wrapOpaqueUsesFuel (dtb_u_u709 - 1)) (dtb_u_u710 + 1)) dtb_u_u711) dtb_u_u727)))
  | Core_dTerm.C_Term_TLam (dtb_u_u728, dtb_u_u729, dtb_u_u730, dtb_u_u731, dtb_u_u732) -> (let dtb_u_u733 = (let dtb_u_u734 = dtb_u_u730 in (match dtb_u_u734 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u735) -> (match dtb_u_u735 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u736; B_dData_dPair.f_Pair_second = dtb_u_u737 } -> (match dtb_u_u737 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u738; B_dData_dPair.f_Pair_second = dtb_u_u739 } -> (let dtb_u_u740 = (match dtb_u_u738 with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u743) -> (B_dData_dMaybe.C_Maybe_Just (((((v_wrapOpaqueUsesFuel (dtb_u_u709 - 1)) dtb_u_u710) dtb_u_u711) dtb_u_u743)))
  | _ -> failwith "DT: impossible branch"
) in (let dtb_u_u741 = (match dtb_u_u739 with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u742) -> (B_dData_dMaybe.C_Maybe_Just (((((v_wrapOpaqueUsesFuel (dtb_u_u709 - 1)) (dtb_u_u710 + 1)) dtb_u_u711) dtb_u_u742)))
  | _ -> failwith "DT: impossible branch"
) in (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = dtb_u_u736; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = dtb_u_u740; B_dData_dPair.f_Pair_second = dtb_u_u741 } }))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) in (Core_dTerm.C_Term_TLam (dtb_u_u728, dtb_u_u729, dtb_u_u733, dtb_u_u731, ((((v_wrapOpaqueUsesFuel (dtb_u_u709 - 1)) (dtb_u_u710 + 1)) dtb_u_u711) dtb_u_u732))))
  | Core_dTerm.C_Term_TApp (dtb_u_u744, dtb_u_u745, dtb_u_u746) -> (Core_dTerm.C_Term_TApp (((((v_wrapOpaqueUsesFuel (dtb_u_u709 - 1)) dtb_u_u710) dtb_u_u711) dtb_u_u744), ((((v_wrapOpaqueUsesFuel (dtb_u_u709 - 1)) dtb_u_u710) dtb_u_u711) dtb_u_u745), dtb_u_u746))
  | Core_dTerm.C_Term_TCon (dtb_u_u747, dtb_u_u748) -> (Core_dTerm.C_Term_TCon (dtb_u_u747, ((B_dData_dList.v_map (fun (dtb_u_u749 : (Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair) -> { B_dData_dPair.f_Pair_first = ((((v_wrapOpaqueUsesFuel (dtb_u_u709 - 1)) dtb_u_u710) dtb_u_u711) (B_dData_dPair.v_firstOf dtb_u_u749)); B_dData_dPair.f_Pair_second = (B_dData_dPair.v_secondOf dtb_u_u749) })) dtb_u_u748)))
  | Core_dTerm.C_Term_TMk (dtb_u_u750, dtb_u_u751) -> (Core_dTerm.C_Term_TMk (dtb_u_u750, ((B_dData_dList.v_map (fun (dtb_u_u752 : (Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair) -> { B_dData_dPair.f_Pair_first = ((((v_wrapOpaqueUsesFuel (dtb_u_u709 - 1)) dtb_u_u710) dtb_u_u711) (B_dData_dPair.v_firstOf dtb_u_u752)); B_dData_dPair.f_Pair_second = (B_dData_dPair.v_secondOf dtb_u_u752) })) dtb_u_u751)))
  | Core_dTerm.C_Term_TRecord (dtb_u_u753, dtb_u_u754) -> (Core_dTerm.C_Term_TRecord (dtb_u_u753, ((B_dData_dList.v_map (fun (dtb_u_u755 : (Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair) -> { B_dData_dPair.f_Pair_first = ((((v_wrapOpaqueUsesFuel (dtb_u_u709 - 1)) dtb_u_u710) dtb_u_u711) (B_dData_dPair.v_firstOf dtb_u_u755)); B_dData_dPair.f_Pair_second = (B_dData_dPair.v_secondOf dtb_u_u755) })) dtb_u_u754)))
  | Core_dTerm.C_Term_TProj (dtb_u_u756, dtb_u_u757, dtb_u_u758, dtb_u_u759, dtb_u_u760) -> (Core_dTerm.C_Term_TProj (((((v_wrapOpaqueUsesFuel (dtb_u_u709 - 1)) dtb_u_u710) dtb_u_u711) dtb_u_u756), dtb_u_u757, dtb_u_u758, dtb_u_u759, dtb_u_u760))
  | Core_dTerm.C_Term_TRecUpd (dtb_u_u761, dtb_u_u762, dtb_u_u763, dtb_u_u764, dtb_u_u765) -> (Core_dTerm.C_Term_TRecUpd (((((v_wrapOpaqueUsesFuel (dtb_u_u709 - 1)) dtb_u_u710) dtb_u_u711) dtb_u_u761), dtb_u_u762, dtb_u_u763, dtb_u_u764, ((((v_wrapOpaqueUsesFuel (dtb_u_u709 - 1)) (dtb_u_u710 + (B_dData_dList.v_length dtb_u_u763))) dtb_u_u711) dtb_u_u765)))
  | Core_dTerm.C_Term_TCase (dtb_u_u766, dtb_u_u767) -> (Core_dTerm.C_Term_TCase (((((v_wrapOpaqueUsesFuel (dtb_u_u709 - 1)) dtb_u_u710) dtb_u_u711) dtb_u_u766), ((B_dData_dList.v_map (fun (dtb_u_u768 : Core_dTerm.t_CaseAlt) -> ((((v_wrapOpaqueAltFuel (dtb_u_u709 - 1)) dtb_u_u710) dtb_u_u711) dtb_u_u768))) dtb_u_u767)))
  | Core_dTerm.C_Term_TIf (dtb_u_u769, dtb_u_u770, dtb_u_u771) -> (Core_dTerm.C_Term_TIf (((((v_wrapOpaqueUsesFuel (dtb_u_u709 - 1)) dtb_u_u710) dtb_u_u711) dtb_u_u769), ((((v_wrapOpaqueUsesFuel (dtb_u_u709 - 1)) dtb_u_u710) dtb_u_u711) dtb_u_u770), ((((v_wrapOpaqueUsesFuel (dtb_u_u709 - 1)) dtb_u_u710) dtb_u_u711) dtb_u_u771)))
  | _ -> failwith "DT: impossible branch"
)))
# 1135 "Vuna/Compiler/Elab/Meta.vuna"
and v_wrapOpaqueAltFuel = (fun (dtb_u_u772 : int) (dtb_u_u773 : int) (dtb_u_u774 : int B_dData_dList.t_List) (dtb_u_u775 : Core_dTerm.t_CaseAlt) -> (match dtb_u_u775 with
  | { Core_dTerm.f_CaseAlt_caseAltName = dtb_u_u776; Core_dTerm.f_CaseAlt_caseAltBinders = dtb_u_u777; Core_dTerm.f_CaseAlt_caseAltBody = dtb_u_u778 } -> { Core_dTerm.f_CaseAlt_caseAltName = dtb_u_u776; Core_dTerm.f_CaseAlt_caseAltBinders = dtb_u_u777; Core_dTerm.f_CaseAlt_caseAltBody = ((((v_wrapOpaqueUsesFuel (dtb_u_u772 - 1)) (dtb_u_u773 + (B_dData_dList.v_length dtb_u_u777))) dtb_u_u774) dtb_u_u778) }
  | _ -> failwith "DT: impossible branch"
))

# 1082 "Vuna/Compiler/Elab/Meta.vuna"
let v_wrapOpaqueUses = (fun (dtb_u_u779 : int B_dData_dList.t_List) (dtb_u_u780 : Core_dTerm.t_Term) -> ((((v_wrapOpaqueUsesFuel 512) 0) dtb_u_u779) dtb_u_u780))

# 1160 "Vuna/Compiler/Elab/Meta.vuna"
let v_dataLinearName = (fun (dtb_u_u781 : Elab_dTypes.t_Ec) (dtb_u_u782 : string) -> (match ((v_dtDataLookup dtb_u_u782) (Elab_dTypes.v_ecDatas dtb_u_u781)) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u783) -> (Elab_dTypes.v_dtDataLinear dtb_u_u783)
  | B_dData_dMaybe.C_Maybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
))

# 1166 "Vuna/Compiler/Elab/Meta.vuna"
let v_ctorLinearName = (fun (dtb_u_u784 : Elab_dTypes.t_Ec) (dtb_u_u785 : string) -> (match ((v_dtCtorLookupEc dtb_u_u784) dtb_u_u785) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u786) -> ((v_dataLinearName dtb_u_u784) (Elab_dTypes.v_dtCtorFamily dtb_u_u786))
  | B_dData_dMaybe.C_Maybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
))

# 1143 "Vuna/Compiler/Elab/Meta.vuna"
let v_isLinearTypeFuel = (fun (dtb_u_u787 : int) (dtb_u_u788 : Elab_dTypes.t_Ec) (dtb_u_u789 : Core_dTerm.t_Value) -> (if (dtb_u_u787 <= 0) then false else (match ((Elab_dTypes.v_forceVal dtb_u_u788) dtb_u_u789) with
  | Core_dTerm.C_Value_VNeutral (dtb_u_u790) -> (match dtb_u_u790 with
  | Core_dTerm.C_Neutral_NGlobal (dtb_u_u791, dtb_u_u792) -> ((v_dataLinearName dtb_u_u788) dtb_u_u791)
  | Core_dTerm.C_Neutral_NVar (dtb_u_u793, dtb_u_u794, dtb_u_u795) -> false
  | _ -> failwith "DT: impossible branch"
)
  | Core_dTerm.C_Value_VCon (dtb_u_u796, dtb_u_u797) -> ((v_ctorLinearName dtb_u_u788) dtb_u_u796)
  | _ -> false
)))

# 1140 "Vuna/Compiler/Elab/Meta.vuna"
let v_isLinearType = (fun (dtb_u_u798 : Elab_dTypes.t_Ec) (dtb_u_u799 : Core_dTerm.t_Value) -> (if (Elab_dTypes.v_ecHasLinear dtb_u_u798) then (((v_isLinearTypeFuel 64) dtb_u_u798) dtb_u_u799) else false))

# 1156 "Vuna/Compiler/Elab/Meta.vuna"
let rec v_anyLinearVals = (fun (dtb_u_u800 : int) (dtb_u_u801 : Elab_dTypes.t_Ec) (dtb_u_u802 : Core_dTerm.t_Value B_dData_dList.t_List) -> (match dtb_u_u802 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u803, dtb_u_u804) -> (if (((v_isLinearTypeFuel dtb_u_u800) dtb_u_u801) dtb_u_u803) then true else (((v_anyLinearVals dtb_u_u800) dtb_u_u801) dtb_u_u804))
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 1173 "Vuna/Compiler/Elab/Meta.vuna"
let v_rigForLinearDomain = (fun (dtb_u_u805 : Elab_dTypes.t_Ec) (dtb_u_u806 : Base_dSource.t_Span) (dtb_u_u807 : string) (dtb_u_u808 : Core_dTerm.t_Rig) (dtb_u_u809 : Core_dTerm.t_Value) -> (if ((v_isLinearType dtb_u_u805) dtb_u_u809) then (match dtb_u_u808 with
  | Core_dTerm.C_Rig_Rig1 -> (Base_dDiag.C_Check_OkC (Core_dTerm.C_Rig_Rig1))
  | _ -> (((Base_dDiagnostics_dTc.v_tcErr1 dtb_u_u806) (Base_dDiagnostics_dTc.C_TcErr_LinearValueNeedsLinearBinder (dtb_u_u807))) dtb_u_u807)
) else (Base_dDiag.C_Check_OkC (dtb_u_u808))))

# 1183 "Vuna/Compiler/Elab/Meta.vuna"
let v_rigCaseField = (fun (dtb_u_u810 : Elab_dTypes.t_Ec) (dtb_u_u811 : Core_dTerm.t_Value) (dtb_u_u812 : Core_dTerm.t_Rig) -> (if ((v_isLinearType dtb_u_u810) dtb_u_u811) then Core_dTerm.C_Rig_Rig1 else dtb_u_u812))

# 1187 "Vuna/Compiler/Elab/Meta.vuna"
let v_rigOfLinearValue = (fun (dtb_u_u813 : Elab_dTypes.t_Ec) (dtb_u_u814 : Core_dTerm.t_Value) -> (if ((v_isLinearType dtb_u_u813) dtb_u_u814) then Core_dTerm.C_Rig_Rig1 else Core_dTerm.C_Rig_RigOmega))

# 1194 "Vuna/Compiler/Elab/Meta.vuna"
let rec v_ctxHasLinearItems = (fun (dtb_u_u815 : Elab_dTypes.t_Ec) (dtb_u_u816 : Elab_dTypes.t_Ctx) (dtb_u_u817 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u818 : int) -> (match dtb_u_u817 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u819, dtb_u_u820) -> (match dtb_u_u819 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u821; B_dData_dPair.f_Pair_second = dtb_u_u822 } -> (if ((v_isLinearType dtb_u_u815) (((Elab_dTypes.v_varTypeValue dtb_u_u816) dtb_u_u818) dtb_u_u822)) then true else ((((v_ctxHasLinearItems dtb_u_u815) dtb_u_u816) dtb_u_u820) (dtb_u_u818 + 1)))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 1191 "Vuna/Compiler/Elab/Meta.vuna"
let v_ctxHasLinear = (fun (dtb_u_u823 : Elab_dTypes.t_Ec) (dtb_u_u824 : Elab_dTypes.t_Ctx) -> ((((v_ctxHasLinearItems dtb_u_u823) dtb_u_u824) (dtb_u_u824).Elab_dTypes.f_Ctx_ctxItems) 0))

# 1204 "Vuna/Compiler/Elab/Meta.vuna"
let rec v_outerScan = (fun (dtb_u_u825 : Elab_dTypes.t_Ec) (dtb_u_u826 : Elab_dTypes.t_Ctx) (dtb_u_u827 : int) (dtb_u_u828 : Core_dTerm.t_Term) -> (match dtb_u_u828 with
  | Core_dTerm.C_Term_TIf (dtb_u_u829, dtb_u_u830, dtb_u_u831) -> (if (if ((((v_outerScan dtb_u_u825) dtb_u_u826) dtb_u_u827) dtb_u_u829) then true else ((((v_outerScan dtb_u_u825) dtb_u_u826) dtb_u_u827) dtb_u_u830)) then true else ((((v_outerScan dtb_u_u825) dtb_u_u826) dtb_u_u827) dtb_u_u831))
  | Core_dTerm.C_Term_TCase (dtb_u_u832, dtb_u_u833) -> (if ((((v_outerScan dtb_u_u825) dtb_u_u826) dtb_u_u827) dtb_u_u832) then true else ((((v_outerScanAlts dtb_u_u825) dtb_u_u826) dtb_u_u827) dtb_u_u833))
  | Core_dTerm.C_Term_TRecUpd (dtb_u_u834, dtb_u_u835, dtb_u_u836, dtb_u_u837, dtb_u_u838) -> (if ((((v_outerScan dtb_u_u825) dtb_u_u826) dtb_u_u827) dtb_u_u834) then true else ((((v_outerScan dtb_u_u825) dtb_u_u826) (dtb_u_u827 + (B_dData_dList.v_length dtb_u_u836))) dtb_u_u838))
  | Core_dTerm.C_Term_TRecord (dtb_u_u839, dtb_u_u840) -> ((((v_outerScanArgs dtb_u_u825) dtb_u_u826) dtb_u_u827) dtb_u_u840)
  | Core_dTerm.C_Term_TProj (dtb_u_u841, dtb_u_u842, dtb_u_u843, dtb_u_u844, dtb_u_u845) -> ((((v_outerScan dtb_u_u825) dtb_u_u826) dtb_u_u827) dtb_u_u841)
  | Core_dTerm.C_Term_TMk (dtb_u_u846, dtb_u_u847) -> ((((v_outerScanArgs dtb_u_u825) dtb_u_u826) dtb_u_u827) dtb_u_u847)
  | Core_dTerm.C_Term_TCon (dtb_u_u848, dtb_u_u849) -> ((((v_outerScanArgs dtb_u_u825) dtb_u_u826) dtb_u_u827) dtb_u_u849)
  | Core_dTerm.C_Term_TApp (dtb_u_u850, dtb_u_u851, dtb_u_u852) -> (if ((((v_outerScan dtb_u_u825) dtb_u_u826) dtb_u_u827) dtb_u_u850) then true else ((((v_outerScan dtb_u_u825) dtb_u_u826) dtb_u_u827) dtb_u_u851))
  | Core_dTerm.C_Term_TLam (dtb_u_u853, dtb_u_u854, dtb_u_u855, dtb_u_u856, dtb_u_u857) -> ((((v_outerScan dtb_u_u825) dtb_u_u826) (dtb_u_u827 + 1)) dtb_u_u857)
  | Core_dTerm.C_Term_TPi (dtb_u_u858, dtb_u_u859, dtb_u_u860, dtb_u_u861, dtb_u_u862) -> false
  | Core_dTerm.C_Term_TVar (dtb_u_u863, dtb_u_u864, dtb_u_u865) -> (if (dtb_u_u864 > dtb_u_u827) then (let dtb_u_u866 = ((v_ctxItemAt (dtb_u_u864 - dtb_u_u827)) (dtb_u_u826).Elab_dTypes.f_Ctx_ctxItems) in (match dtb_u_u866 with
  | B_dData_dMaybe.C_Maybe_Nothing -> false
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u867) -> (match dtb_u_u867 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u868; B_dData_dPair.f_Pair_second = dtb_u_u869 } -> ((v_isLinearType dtb_u_u825) (((Elab_dTypes.v_varTypeValue dtb_u_u826) (dtb_u_u864 - dtb_u_u827)) dtb_u_u869))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) else false)
  | _ -> false
))
# 1226 "Vuna/Compiler/Elab/Meta.vuna"
and v_outerScanArgs = (fun (dtb_u_u870 : Elab_dTypes.t_Ec) (dtb_u_u871 : Elab_dTypes.t_Ctx) (dtb_u_u872 : int) (dtb_u_u873 : (Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match dtb_u_u873 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u874, dtb_u_u875) -> (match dtb_u_u874 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u876; B_dData_dPair.f_Pair_second = dtb_u_u877 } -> (if ((((v_outerScan dtb_u_u870) dtb_u_u871) dtb_u_u872) dtb_u_u876) then true else ((((v_outerScanArgs dtb_u_u870) dtb_u_u871) dtb_u_u872) dtb_u_u875))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))
# 1231 "Vuna/Compiler/Elab/Meta.vuna"
and v_outerScanAlts = (fun (dtb_u_u878 : Elab_dTypes.t_Ec) (dtb_u_u879 : Elab_dTypes.t_Ctx) (dtb_u_u880 : int) (dtb_u_u881 : Core_dTerm.t_CaseAlt B_dData_dList.t_List) -> (match dtb_u_u881 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u882, dtb_u_u883) -> (match dtb_u_u882 with
  | { Core_dTerm.f_CaseAlt_caseAltName = dtb_u_u884; Core_dTerm.f_CaseAlt_caseAltBinders = dtb_u_u885; Core_dTerm.f_CaseAlt_caseAltBody = dtb_u_u886 } -> (if ((((v_outerScan dtb_u_u878) dtb_u_u879) (dtb_u_u880 + (B_dData_dList.v_length dtb_u_u885))) dtb_u_u886) then true else ((((v_outerScanAlts dtb_u_u878) dtb_u_u879) dtb_u_u880) dtb_u_u883))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 1201 "Vuna/Compiler/Elab/Meta.vuna"
let v_termHasOuterLinear = (fun (dtb_u_u887 : Elab_dTypes.t_Ec) (dtb_u_u888 : Elab_dTypes.t_Ctx) (dtb_u_u889 : Core_dTerm.t_Term) -> ((((v_outerScan dtb_u_u887) dtb_u_u888) 0) dtb_u_u889))

# 1239 "Vuna/Compiler/Elab/Meta.vuna"
let rec v_isTypeLayerValueFuel = (fun (dtb_u_u890 : int) (dtb_u_u891 : Core_dTerm.t_Value) -> (if (dtb_u_u890 <= 0) then false else (match dtb_u_u891 with
  | Core_dTerm.C_Value_VType (dtb_u_u892) -> true
  | Core_dTerm.C_Value_VPi (dtb_u_u893, dtb_u_u894, dtb_u_u895, dtb_u_u896, dtb_u_u897) -> (if ((v_isTypeLayerValueFuel (dtb_u_u890 - 1)) dtb_u_u896) then ((v_isTypeLayerValueFuel (dtb_u_u890 - 1)) ((Core_dEval.v_applyClosure dtb_u_u897) (Core_dTerm.C_Value_VNeutral ((Core_dTerm.C_Neutral_NVar (dtb_u_u893, 0, B_dData_dList.C_List_Nil)))))) else false)
  | _ -> false
)))

# 1236 "Vuna/Compiler/Elab/Meta.vuna"
let v_isTypeLayerValue = (fun (dtb_u_u898 : Core_dTerm.t_Value) -> ((v_isTypeLayerValueFuel 128) dtb_u_u898))

# 934 "Vuna/Compiler/Elab/Meta.vuna"
let v_isTypeDomain = (fun (dtb_u_u899 : Core_dTerm.t_Value) -> (v_isTypeLayerValue dtb_u_u899))

# 937 "Vuna/Compiler/Elab/Meta.vuna"
let v_piBinderRig = (fun (dtb_u_u900 : bool) (dtb_u_u901 : Core_dTerm.t_Value) -> ((Core_dTerm.v_rigOfBinder dtb_u_u900) (v_isTypeDomain dtb_u_u901)))

# 1249 "Vuna/Compiler/Elab/Meta.vuna"
let v_isDataHead = (fun (dtb_u_u902 : Elab_dTypes.t_DtData B_dData_dList.t_List) (dtb_u_u903 : Core_dTerm.t_Value) -> (match dtb_u_u903 with
  | Core_dTerm.C_Value_VNeutral (dtb_u_u904) -> (match dtb_u_u904 with
  | Core_dTerm.C_Neutral_NGlobal (dtb_u_u905, dtb_u_u906) -> (match ((v_dtDataLookup dtb_u_u905) dtb_u_u902) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u907) -> true
  | B_dData_dMaybe.C_Maybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
)
  | _ -> false
)
  | _ -> false
))

# 810 "Vuna/Compiler/Elab/Meta.vuna"
let v_isIndexDomain = (fun (dtb_u_u908 : Elab_dTypes.t_Ec) (dtb_u_u909 : Core_dTerm.t_Value) -> (if (v_isTypeDomain dtb_u_u909) then true else ((v_isDataHead (Elab_dTypes.v_ecDatas dtb_u_u908)) ((Elab_dTypes.v_forceVal dtb_u_u908) dtb_u_u909))))

# 857 "Vuna/Compiler/Elab/Meta.vuna"
let v_neutralBinderIndexDomain = (fun (dtb_u_u910 : Elab_dTypes.t_Ctx) (dtb_u_u911 : Elab_dTypes.t_Ec) (dtb_u_u912 : int) -> (match (((v_neutralBinderType dtb_u_u910) dtb_u_u911) dtb_u_u912) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u913) -> ((v_isIndexDomain dtb_u_u911) dtb_u_u913)
  | B_dData_dMaybe.C_Maybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
))

# 896 "Vuna/Compiler/Elab/Meta.vuna"
let rec v_isTypeLikeWithCtx = (fun (dtb_u_u914 : int) (dtb_u_u915 : Elab_dTypes.t_Ctx) (dtb_u_u916 : Elab_dTypes.t_Ec) (dtb_u_u917 : Core_dTerm.t_Value) -> (if (dtb_u_u914 <= 0) then false else (match ((Elab_dTypes.v_forceVal dtb_u_u916) dtb_u_u917) with
  | Core_dTerm.C_Value_VType (dtb_u_u918) -> true
  | Core_dTerm.C_Value_VPi (dtb_u_u919, dtb_u_u920, dtb_u_u921, dtb_u_u922, dtb_u_u923) -> ((((v_isTypeLikeWithCtx (dtb_u_u914 - 1)) dtb_u_u915) dtb_u_u916) ((Core_dEval.v_applyClosure dtb_u_u923) (Core_dTerm.C_Value_VNeutral ((Core_dTerm.C_Neutral_NVar ("ty", 0, B_dData_dList.C_List_Nil))))))
  | Core_dTerm.C_Value_VNeutral (dtb_u_u924) -> (match dtb_u_u924 with
  | Core_dTerm.C_Neutral_NVar (dtb_u_u925, dtb_u_u926, dtb_u_u927) -> (match (((v_neutralBinderType dtb_u_u915) dtb_u_u916) dtb_u_u926) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u928) -> (v_isTypeDomain dtb_u_u928)
  | B_dData_dMaybe.C_Maybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
)
  | Core_dTerm.C_Neutral_NGlobal (dtb_u_u929, dtb_u_u930) -> ((v_isDataHead (Elab_dTypes.v_ecDatas dtb_u_u916)) dtb_u_u917)
  | _ -> false
)
  | Core_dTerm.C_Value_VMeta (dtb_u_u931, dtb_u_u932) -> true
  | _ -> false
)))

# 883 "Vuna/Compiler/Elab/Meta.vuna"
let rec v_isKindWithCtxFuel = (fun (dtb_u_u933 : int) (dtb_u_u934 : Elab_dTypes.t_Ctx) (dtb_u_u935 : Elab_dTypes.t_Ec) (dtb_u_u936 : Core_dTerm.t_Value) -> (if (dtb_u_u933 <= 0) then false else (match ((Elab_dTypes.v_forceVal dtb_u_u935) dtb_u_u936) with
  | Core_dTerm.C_Value_VType (dtb_u_u937) -> true
  | Core_dTerm.C_Value_VPi (dtb_u_u938, dtb_u_u939, dtb_u_u940, dtb_u_u941, dtb_u_u942) -> (if ((((v_isTypeLikeWithCtx dtb_u_u933) dtb_u_u934) dtb_u_u935) dtb_u_u941) then ((((v_isKindWithCtxFuel (dtb_u_u933 - 1)) dtb_u_u934) dtb_u_u935) ((Core_dEval.v_applyClosure dtb_u_u942) (Core_dTerm.C_Value_VNeutral ((Core_dTerm.C_Neutral_NVar ("kind", 0, B_dData_dList.C_List_Nil)))))) else false)
  | _ -> false
)))

# 880 "Vuna/Compiler/Elab/Meta.vuna"
let v_isKindWithCtx = (fun (dtb_u_u943 : Elab_dTypes.t_Ctx) (dtb_u_u944 : Elab_dTypes.t_Ec) (dtb_u_u945 : Core_dTerm.t_Value) -> ((((v_isKindWithCtxFuel 64) dtb_u_u943) dtb_u_u944) dtb_u_u945))

# 825 "Vuna/Compiler/Elab/Meta.vuna"
let v_isImplicitDomain = (fun (dtb_u_u946 : Elab_dTypes.t_Ctx) (dtb_u_u947 : Elab_dTypes.t_Ec) (dtb_u_u948 : Core_dTerm.t_Value) -> (if ((v_isIndexDomain dtb_u_u947) dtb_u_u948) then true else (let dtb_u_u949 = ((Elab_dTypes.v_forceVal dtb_u_u947) dtb_u_u948) in (match dtb_u_u949 with
  | Core_dTerm.C_Value_VPi (dtb_u_u950, dtb_u_u951, dtb_u_u952, dtb_u_u953, dtb_u_u954) -> (((v_isKindWithCtx dtb_u_u946) dtb_u_u947) ((Elab_dTypes.v_forceVal dtb_u_u947) dtb_u_u948))
  | Core_dTerm.C_Value_VNeutral (dtb_u_u955) -> (match dtb_u_u955 with
  | Core_dTerm.C_Neutral_NGlobal (dtb_u_u956, dtb_u_u957) -> (match dtb_u_u957 with
  | B_dData_dList.C_List_Nil -> (dtb_u_u956 = Base_dIntrinsics.v_strTypeName)
  | _ -> (match dtb_u_u955 with
  | Core_dTerm.C_Neutral_NVar (dtb_u_u958, dtb_u_u959, dtb_u_u960) -> (((v_neutralBinderIndexDomain dtb_u_u946) dtb_u_u947) dtb_u_u959)
  | _ -> false
)
)
  | _ -> (match dtb_u_u955 with
  | Core_dTerm.C_Neutral_NVar (dtb_u_u961, dtb_u_u962, dtb_u_u963) -> (((v_neutralBinderIndexDomain dtb_u_u946) dtb_u_u947) dtb_u_u962)
  | _ -> false
)
)
  | Core_dTerm.C_Value_VMeta (dtb_u_u964, dtb_u_u965) -> true
  | _ -> false
))))

# 49 "Vuna/Compiler/Elab/Meta.vuna"
let rec v_instantiateNullaryCtorFuel = (fun (dtb_u_u966 : int) (dtb_u_u967 : Elab_dTypes.t_Ec) (dtb_u_u968 : Elab_dTypes.t_Ctx) (dtb_u_u969 : Core_dTerm.t_Value) -> (if (dtb_u_u966 <= 0) then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb_u_u969; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = dtb_u_u967 } })) else (let dtb_u_u970 = ((Elab_dTypes.v_forceVal dtb_u_u967) dtb_u_u969) in (match dtb_u_u970 with
  | Core_dTerm.C_Value_VPi (dtb_u_u971, dtb_u_u972, dtb_u_u973, dtb_u_u974, dtb_u_u975) -> (if dtb_u_u972 then (if (((v_isImplicitDomain dtb_u_u968) dtb_u_u967) dtb_u_u974) then (match ((Elab_dTypes.v_newMeta dtb_u_u968) dtb_u_u967) with
  | { B_dData_dPair.f_Pair_first = dtb_u_u976; B_dData_dPair.f_Pair_second = dtb_u_u977 } -> ((Base_dCommon.v_bind ((((v_instantiateNullaryCtorFuel (dtb_u_u966 - 1)) dtb_u_u977) dtb_u_u968) ((Core_dEval.v_applyClosure dtb_u_u975) ((Core_dEval.v_eval (Elab_dTypes.v_ctxEnv dtb_u_u968)) dtb_u_u976)))) (fun (dtb_u_u978 : (Core_dTerm.t_Value, (Core_dTerm.t_Term B_dData_dList.t_List, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let dtb_u_u979 = dtb_u_u978 in (match dtb_u_u979 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u980; B_dData_dPair.f_Pair_second = dtb_u_u981 } -> (match dtb_u_u981 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u982; B_dData_dPair.f_Pair_second = dtb_u_u983 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb_u_u980; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ (dtb_u_u976, dtb_u_u982)); B_dData_dPair.f_Pair_second = dtb_u_u983 } }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))
  | _ -> failwith "DT: impossible branch"
) else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb_u_u969; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = dtb_u_u967 } }))) else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb_u_u969; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = dtb_u_u967 } })))
  | _ -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb_u_u969; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = dtb_u_u967 } }))
))))

# 46 "Vuna/Compiler/Elab/Meta.vuna"
let v_instantiateNullaryCtor = (fun (dtb_u_u984 : Elab_dTypes.t_Ec) (dtb_u_u985 : Elab_dTypes.t_Ctx) (dtb_u_u986 : Core_dTerm.t_Value) -> ((((v_instantiateNullaryCtorFuel 64) dtb_u_u984) dtb_u_u985) dtb_u_u986))

# 1259 "Vuna/Compiler/Elab/Meta.vuna"
let v_freshVarValue = (fun (dtb_u_u987 : string) (dtb_u_u988 : int) -> (Core_dTerm.C_Value_VNeutral ((Core_dTerm.C_Neutral_NVar (dtb_u_u987, dtb_u_u988, B_dData_dList.C_List_Nil)))))

# 1270 "Vuna/Compiler/Elab/Meta.vuna"
let v_neutralHeadName = (fun (dtb_u_u989 : Core_dTerm.t_Neutral) -> (match dtb_u_u989 with
  | Core_dTerm.C_Neutral_NGlobal (dtb_u_u990, dtb_u_u991) -> dtb_u_u990
  | Core_dTerm.C_Neutral_NVar (dtb_u_u992, dtb_u_u993, dtb_u_u994) -> dtb_u_u992
  | _ -> failwith "DT: impossible branch"
))

# 1274 "Vuna/Compiler/Elab/Meta.vuna"
let v_isBoolGlobal = (fun (dtb_u_u995 : string) -> (Base_dIntrinsics.v_isBoolCanonical dtb_u_u995))

# 1266 "Vuna/Compiler/Elab/Meta.vuna"
let v_isBoolType = (fun (dtb_u_u996 : Core_dTerm.t_Value) -> (match dtb_u_u996 with
  | Core_dTerm.C_Value_VNeutral (dtb_u_u997) -> (v_isBoolGlobal (v_neutralHeadName dtb_u_u997))
  | _ -> false
))

# 1279 "Vuna/Compiler/Elab/Meta.vuna"
let v_isSortVal = (fun (dtb_u_u998 : Elab_dTypes.t_Ec) (dtb_u_u999 : Core_dTerm.t_Value) -> (match ((Elab_dTypes.v_forceVal dtb_u_u998) dtb_u_u999) with
  | Core_dTerm.C_Value_VType (dtb_u_u1000) -> true
  | _ -> false
))

# 479 "Vuna/Compiler/Elab/Meta.vuna"
let v_resolveOverCtor = (fun (dtb_u_u1001 : Elab_dTypes.t_Ec) (dtb_u_u1002 : Base_dSource.t_Span) (dtb_u_u1003 : Core_dTerm.t_Value B_dData_dMaybe.t_Maybe) (dtb_u_u1004 : string) (dtb_u_u1005 : string B_dData_dList.t_List) -> (match dtb_u_u1003 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u1006) -> (if ((v_isSortVal dtb_u_u1001) dtb_u_u1006) then (match (((v_dualFamilyOf dtb_u_u1001) dtb_u_u1004) dtb_u_u1005) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u1007) -> (Base_dDiag.C_Check_OkC (dtb_u_u1007))
  | B_dData_dMaybe.C_Maybe_Nothing -> (((((v_resolveOverCtorGo dtb_u_u1001) dtb_u_u1002) ((v_expectedFamilyOf dtb_u_u1001) dtb_u_u1006)) dtb_u_u1004) dtb_u_u1005)
  | _ -> failwith "DT: impossible branch"
) else (((((v_resolveOverCtorGo dtb_u_u1001) dtb_u_u1002) ((v_expectedFamilyOf dtb_u_u1001) dtb_u_u1006)) dtb_u_u1004) dtb_u_u1005))
  | B_dData_dMaybe.C_Maybe_Nothing -> ((((v_defaultOrOver dtb_u_u1001) dtb_u_u1002) dtb_u_u1004) dtb_u_u1005)
  | _ -> failwith "DT: impossible branch"
))

# 1341 "Vuna/Compiler/Elab/Meta.vuna"
let v_mkCtorTerm = (fun (dtb_u_u1008 : Elab_dTypes.t_DtData B_dData_dList.t_List) (dtb_u_u1009 : Elab_dTypes.t_DtCtor) (dtb_u_u1010 : string) (dtb_u_u1011 : (Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match ((Elab_dRepresentation.v_findDtData (Elab_dTypes.v_dtCtorFamily dtb_u_u1009)) dtb_u_u1008) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u1012) -> (if (Elab_dTypes.v_dtDataIsRecord dtb_u_u1012) then (Core_dTerm.C_Term_TMk (dtb_u_u1010, dtb_u_u1011)) else (Core_dTerm.C_Term_TCon (dtb_u_u1010, dtb_u_u1011)))
  | B_dData_dMaybe.C_Maybe_Nothing -> (Core_dTerm.C_Term_TCon (dtb_u_u1010, dtb_u_u1011))
  | _ -> failwith "DT: impossible branch"
))

# 1364 "Vuna/Compiler/Elab/Meta.vuna"
let[@tail_mod_cons] rec v_shiftCtorArgs = (fun (dtb_u_u1013 : int) (dtb_u_u1014 : (Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match dtb_u_u1014 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u1015, dtb_u_u1016) -> (match dtb_u_u1015 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u1017; B_dData_dPair.f_Pair_second = dtb_u_u1018 } -> (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = (((Core_dTerm.v_shift 0) dtb_u_u1013) dtb_u_u1017); B_dData_dPair.f_Pair_second = dtb_u_u1018 }, ((v_shiftCtorArgs dtb_u_u1013) dtb_u_u1016)))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 1373 "Vuna/Compiler/Elab/Meta.vuna"
let rec v_etaCtorLa = (fun (dtb_u_u1019 : string) (dtb_u_u1020 : int) (dtb_u_u1021 : (string, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u1022 : (Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match dtb_u_u1021 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u1023, dtb_u_u1024) -> (match dtb_u_u1023 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u1025; B_dData_dPair.f_Pair_second = dtb_u_u1026 } -> (let dtb_u_u1027 = (Frontend_dReserved.v_etaBinderName dtb_u_u1020) in (Core_dTerm.C_Term_TLam (dtb_u_u1027, dtb_u_u1026, B_dData_dMaybe.C_Maybe_Nothing, Base_dSource.v_spanEmpty, ((((v_etaCtorLa dtb_u_u1019) (dtb_u_u1020 + 1)) dtb_u_u1024) ((B_dData_dList.v_append dtb_u_u1022) (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = (Core_dTerm.C_Term_TVar (dtb_u_u1027, (B_dData_dList.v_length dtb_u_u1024), { Base_dSource.f_Span_spanFile = ""; Base_dSource.f_Span_spanStartLine = 0; Base_dSource.f_Span_spanStartCol = 0; Base_dSource.f_Span_spanEndLine = 0; Base_dSource.f_Span_spanEndCol = 0; Base_dSource.f_Span_spanStartOffset = 0; Base_dSource.f_Span_spanEndOffset = 0 })); B_dData_dPair.f_Pair_second = dtb_u_u1026 }, B_dData_dList.C_List_Nil)))))))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (Core_dTerm.C_Term_TCon (dtb_u_u1019, dtb_u_u1022))
  | _ -> failwith "DT: impossible branch"
))

# 1386 "Vuna/Compiler/Elab/Meta.vuna"
let rec v_dropCount = (fun (dtb_u_u1029 : int) dtb_u_u1030 -> (if (dtb_u_u1029 <= 0) then dtb_u_u1030 else (match dtb_u_u1030 with
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u1031, dtb_u_u1032) -> ((v_dropCount (dtb_u_u1029 - 1)) dtb_u_u1032)
  | _ -> failwith "DT: impossible branch"
)))

# 1356 "Vuna/Compiler/Elab/Meta.vuna"
let v_etaCtorTerm = (fun (dtb_u_u1033 : Elab_dTypes.t_DtCtor) (dtb_u_u1034 : (Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (let dtb_u_u1035 = ((v_dropCount (B_dData_dList.v_length dtb_u_u1034)) (Elab_dTypes.v_dtCtorTelescope dtb_u_u1033)) in (let dtb_u_u1036 = (B_dData_dList.v_length dtb_u_u1035) in ((((v_etaCtorLa (Elab_dTypes.v_dtCtorName dtb_u_u1033)) 0) dtb_u_u1035) ((v_shiftCtorArgs dtb_u_u1036) dtb_u_u1034)))))

# 1293 "Vuna/Compiler/Elab/Meta.vuna"
let v_ctorRefTermOf = (fun (dtb_u_u1037 : Elab_dTypes.t_DtCtor B_dData_dMaybe.t_Maybe) (dtb_u_u1038 : string) -> (match dtb_u_u1037 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u1039) -> (if (Base_dIntrinsics.v_isBoolCanonical (Elab_dTypes.v_dtCtorFamily dtb_u_u1039)) then (v_boolCtorTerm (Elab_dTypes.v_dtCtorName dtb_u_u1039)) else (if ((B_dData_dList.v_length (Elab_dTypes.v_dtCtorTelescope dtb_u_u1039)) = 0) then (Core_dTerm.C_Term_TCon (dtb_u_u1038, B_dData_dList.C_List_Nil)) else ((v_etaCtorTerm dtb_u_u1039) B_dData_dList.C_List_Nil)))
  | B_dData_dMaybe.C_Maybe_Nothing -> (Core_dTerm.C_Term_TGlobal (dtb_u_u1038))
  | _ -> failwith "DT: impossible branch"
))

# 1301 "Vuna/Compiler/Elab/Meta.vuna"
let v_ctorRefTermEc = (fun (dtb_u_u1040 : Elab_dTypes.t_Ec) (dtb_u_u1041 : string) -> ((v_ctorRefTermOf ((v_dtCtorLookupEc dtb_u_u1040) dtb_u_u1041)) dtb_u_u1041))

# 97 "Vuna/Compiler/Elab/Meta.vuna"
let v_inferCtorRef = (fun (dtb_u_u1042 : Elab_dTypes.t_Ec) (dtb_u_u1043 : Elab_dTypes.t_Ctx) (dtb_u_u1044 : string) (dtb_u_u1045 : Core_dTerm.t_Term) -> (match ((v_dtCtorLookupEc dtb_u_u1042) dtb_u_u1044) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u1046) -> (if (Base_dIntrinsics.v_isBoolCanonical (Elab_dTypes.v_dtCtorFamily dtb_u_u1046)) then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (v_boolCtorTerm (Elab_dTypes.v_dtCtorName dtb_u_u1046)); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = Elab_dPrelude.v_boolTyValue; B_dData_dPair.f_Pair_second = dtb_u_u1042 } })) else (let dtb_u_u1047 = ((Core_dEval.v_eval B_dData_dList.C_List_Nil) dtb_u_u1045) in (if ((v_hasNoExplicitPi dtb_u_u1042) dtb_u_u1047) then (let dtb_u_u1048 = (((v_instantiateNullaryCtor dtb_u_u1042) dtb_u_u1043) dtb_u_u1047) in (match dtb_u_u1048 with
  | Base_dDiag.C_Check_ErrC (dtb_u_u1049) -> (Base_dDiag.C_Check_ErrC (dtb_u_u1049))
  | Base_dDiag.C_Check_OkC (dtb_u_u1050) -> (match dtb_u_u1050 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u1051; B_dData_dPair.f_Pair_second = dtb_u_u1052 } -> (match dtb_u_u1052 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u1053; B_dData_dPair.f_Pair_second = dtb_u_u1054 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = ((v_nullaryCtorTerm dtb_u_u1046) dtb_u_u1053); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = dtb_u_u1051; B_dData_dPair.f_Pair_second = dtb_u_u1054 } }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = ((v_ctorRefTermEc dtb_u_u1042) dtb_u_u1044); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = dtb_u_u1047; B_dData_dPair.f_Pair_second = dtb_u_u1042 } })))))
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = ((v_ctorRefTermEc dtb_u_u1042) dtb_u_u1044); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = ((Core_dEval.v_eval B_dData_dList.C_List_Nil) dtb_u_u1045); B_dData_dPair.f_Pair_second = dtb_u_u1042 } }))
  | _ -> failwith "DT: impossible branch"
))

# 1304 "Vuna/Compiler/Elab/Meta.vuna"
let v_ctorRefTerm = (fun (dtb_u_u1055 : Elab_dTypes.t_DtData B_dData_dList.t_List) (dtb_u_u1056 : string) -> ((v_ctorRefTermOf ((v_dtCtorLookup dtb_u_u1056) dtb_u_u1055)) dtb_u_u1056))

# 1395 "Vuna/Compiler/Elab/Meta.vuna"
let rec v_foldAppTerms = (fun (dtb_u_u1057 : Core_dTerm.t_Term) (dtb_u_u1058 : (Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match dtb_u_u1058 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u1059, dtb_u_u1060) -> (match dtb_u_u1059 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u1061; B_dData_dPair.f_Pair_second = dtb_u_u1062 } -> ((v_foldAppTerms (Core_dTerm.C_Term_TApp (dtb_u_u1057, dtb_u_u1061, dtb_u_u1062))) dtb_u_u1060)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> dtb_u_u1057
  | _ -> failwith "DT: impossible branch"
))

# 1312 "Vuna/Compiler/Elab/Meta.vuna"
let v_ctorAppTermEc = (fun (dtb_u_u1063 : Elab_dTypes.t_Ec) (dtb_u_u1064 : Core_dTerm.t_Term) (dtb_u_u1065 : (Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match dtb_u_u1064 with
  | Core_dTerm.C_Term_TGlobal (dtb_u_u1066) -> (match ((v_dtCtorLookupEc dtb_u_u1063) dtb_u_u1066) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u1067) -> (if (Base_dIntrinsics.v_isBoolCanonical (Elab_dTypes.v_dtCtorFamily dtb_u_u1067)) then (v_boolCtorTerm dtb_u_u1066) else (if ((B_dData_dList.v_length dtb_u_u1065) >= (B_dData_dList.v_length (Elab_dTypes.v_dtCtorTelescope dtb_u_u1067))) then ((((v_mkCtorTerm (Elab_dTypes.v_ecDatas dtb_u_u1063)) dtb_u_u1067) dtb_u_u1066) dtb_u_u1065) else ((v_etaCtorTerm dtb_u_u1067) dtb_u_u1065)))
  | B_dData_dMaybe.C_Maybe_Nothing -> ((v_foldAppTerms (Core_dTerm.C_Term_TGlobal (dtb_u_u1066))) dtb_u_u1065)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> ((v_foldAppTerms dtb_u_u1064) dtb_u_u1065)
))

# 1325 "Vuna/Compiler/Elab/Meta.vuna"
let v_ctorAppTerm = (fun (dtb_u_u1068 : Elab_dTypes.t_DtData B_dData_dList.t_List) (dtb_u_u1069 : Core_dTerm.t_Term) (dtb_u_u1070 : (Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match dtb_u_u1069 with
  | Core_dTerm.C_Term_TGlobal (dtb_u_u1071) -> (match ((v_dtCtorLookup dtb_u_u1071) dtb_u_u1068) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u1072) -> (if (Base_dIntrinsics.v_isBoolCanonical (Elab_dTypes.v_dtCtorFamily dtb_u_u1072)) then (v_boolCtorTerm dtb_u_u1071) else (if ((B_dData_dList.v_length dtb_u_u1070) >= (B_dData_dList.v_length (Elab_dTypes.v_dtCtorTelescope dtb_u_u1072))) then ((((v_mkCtorTerm dtb_u_u1068) dtb_u_u1072) dtb_u_u1071) dtb_u_u1070) else ((v_etaCtorTerm dtb_u_u1072) dtb_u_u1070)))
  | B_dData_dMaybe.C_Maybe_Nothing -> ((v_foldAppTerms (Core_dTerm.C_Term_TGlobal (dtb_u_u1071))) dtb_u_u1070)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> ((v_foldAppTerms dtb_u_u1069) dtb_u_u1070)
))

# 1411 "Vuna/Compiler/Elab/Meta.vuna"
let v_isSortExpr = (fun (dtb_u_u1073 : Frontend_dAst.t_Expr) -> (match dtb_u_u1073 with
  | Frontend_dAst.C_Expr_EApp (dtb_u_u1074, dtb_u_u1075, dtb_u_u1076) -> (match dtb_u_u1074 with
  | Frontend_dAst.C_Expr_EVar (dtb_u_u1077, dtb_u_u1078) -> (if (dtb_u_u1077 = "Type") then true else false)
  | _ -> false
)
  | Frontend_dAst.C_Expr_EVar (dtb_u_u1079, dtb_u_u1080) -> (if (dtb_u_u1079 = "Type") then true else false)
  | _ -> false
))

# 1406 "Vuna/Compiler/Elab/Meta.vuna"
let v_hasFamParams = (fun (dtb_u_u1081 : Frontend_dAst.t_Expr) -> (match dtb_u_u1081 with
  | Frontend_dAst.C_Expr_EPi (dtb_u_u1082, dtb_u_u1083, dtb_u_u1084, dtb_u_u1085, dtb_u_u1086, dtb_u_u1087) -> (if (dtb_u_u1082 <> "_") then (v_isSortExpr dtb_u_u1085) else false)
  | _ -> false
))

# 1417 "Vuna/Compiler/Elab/Meta.vuna"
let v_baseNameOf = (fun (dtb_u_u1088 : string) -> (Base_dSource.v_lastSeg dtb_u_u1088))

# 1424 "Vuna/Compiler/Elab/Meta.vuna"
let rec v_explicitPiArity = (fun (dtb_u_u1089 : Core_dTerm.t_Term) -> (match dtb_u_u1089 with
  | Core_dTerm.C_Term_TPi (dtb_u_u1090, dtb_u_u1091, dtb_u_u1092, dtb_u_u1093, dtb_u_u1094) -> (if dtb_u_u1091 then (v_explicitPiArity dtb_u_u1094) else (1 + (v_explicitPiArity dtb_u_u1094)))
  | _ -> 0
))

# 1452 "Vuna/Compiler/Elab/Meta.vuna"
let rec v_dropPis = (fun (dtb_u_u1095 : Core_dTerm.t_Term) -> (match dtb_u_u1095 with
  | Core_dTerm.C_Term_TPi (dtb_u_u1096, dtb_u_u1097, dtb_u_u1098, dtb_u_u1099, dtb_u_u1100) -> (v_dropPis dtb_u_u1100)
  | _ -> dtb_u_u1095
))

# 1456 "Vuna/Compiler/Elab/Meta.vuna"
let rec v_anyNonVarArg = (fun (dtb_u_u1101 : Core_dTerm.t_Term B_dData_dList.t_List) -> (match dtb_u_u1101 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u1102, dtb_u_u1103) -> (match dtb_u_u1102 with
  | Core_dTerm.C_Term_TVar (dtb_u_u1104, dtb_u_u1105, dtb_u_u1106) -> (v_anyNonVarArg dtb_u_u1103)
  | _ -> true
)
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 1447 "Vuna/Compiler/Elab/Meta.vuna"
let v_ctorResultIndexed = (fun (dtb_u_u1107 : Elab_dTypes.t_DtCtor) -> (match (v_resultSpine (v_dropPis (Elab_dTypes.v_dtCtorType dtb_u_u1107))) with
  | { B_dData_dPair.f_Pair_first = dtb_u_u1108; B_dData_dPair.f_Pair_second = dtb_u_u1109 } -> (v_anyNonVarArg dtb_u_u1109)
  | _ -> failwith "DT: impossible branch"
))

# 1443 "Vuna/Compiler/Elab/Meta.vuna"
let rec v_anyCtorIndexed = (fun (dtb_u_u1110 : Elab_dTypes.t_DtCtor B_dData_dList.t_List) -> (match dtb_u_u1110 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u1111, dtb_u_u1112) -> (if (v_ctorResultIndexed dtb_u_u1111) then true else (v_anyCtorIndexed dtb_u_u1112))
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 1440 "Vuna/Compiler/Elab/Meta.vuna"
let v_familyIndexed = (fun (dtb_u_u1113 : Elab_dTypes.t_DtData) -> (v_anyCtorIndexed (Elab_dTypes.v_dtDataCtors dtb_u_u1113)))

# 1431 "Vuna/Compiler/Elab/Meta.vuna"
let v_ctorFamilyTable = (fun (dtb_u_u1114 : Elab_dTypes.t_Ec) -> ((B_dData_dList.v_map (fun (dtb_u_u1115 : Elab_dTypes.t_DtData) -> { B_dData_dPair.f_Pair_first = (Elab_dTypes.v_dtDataName dtb_u_u1115); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = (B_dData_dBool.v_not (v_familyIndexed dtb_u_u1115)); B_dData_dPair.f_Pair_second = ((B_dData_dList.v_map (fun (dtb_u_u1116 : Elab_dTypes.t_DtCtor) -> { B_dData_dPair.f_Pair_first = (Elab_dTypes.v_dtCtorName dtb_u_u1116); B_dData_dPair.f_Pair_second = (v_explicitPiArity (Elab_dTypes.v_dtCtorType dtb_u_u1116)) })) (Elab_dTypes.v_dtDataCtors dtb_u_u1115)) } })) (Elab_dTypes.v_ecDatas dtb_u_u1114)))

# 1464 "Vuna/Compiler/Elab/Meta.vuna"
let rec v_findCatchAllBody = (fun (dtb_u_u1117 : (Frontend_dAst.t_Pat, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match dtb_u_u1117 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u1118, dtb_u_u1119) -> (match dtb_u_u1118 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u1120; B_dData_dPair.f_Pair_second = dtb_u_u1121 } -> (match dtb_u_u1120 with
  | Frontend_dAst.C_Pat_PCon (dtb_u_u1122, dtb_u_u1123, dtb_u_u1124) -> (v_findCatchAllBody dtb_u_u1119)
  | _ -> (B_dData_dMaybe.C_Maybe_Just (dtb_u_u1121))
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 682 "Vuna/Compiler/Elab/Meta.vuna"
let v_dataHeadName = (fun (dtb_u_u1125 : t_DataHead) -> (match dtb_u_u1125 with
  | { f_DataHead_dataHeadName = dtb_u_u1126; f_DataHead_dataHeadKind = dtb_u_u1127; f_DataHead_dataHeadArity = dtb_u_u1128 } -> dtb_u_u1126
  | _ -> failwith "DT: impossible branch"
))

# 683 "Vuna/Compiler/Elab/Meta.vuna"
let v_dataHeadKind = (fun (dtb_u_u1129 : t_DataHead) -> (match dtb_u_u1129 with
  | { f_DataHead_dataHeadName = dtb_u_u1130; f_DataHead_dataHeadKind = dtb_u_u1131; f_DataHead_dataHeadArity = dtb_u_u1132 } -> dtb_u_u1131
  | _ -> failwith "DT: impossible branch"
))

# 684 "Vuna/Compiler/Elab/Meta.vuna"
let v_dataHeadArity = (fun (dtb_u_u1133 : t_DataHead) -> (match dtb_u_u1133 with
  | { f_DataHead_dataHeadName = dtb_u_u1134; f_DataHead_dataHeadKind = dtb_u_u1135; f_DataHead_dataHeadArity = dtb_u_u1136 } -> dtb_u_u1136
  | _ -> failwith "DT: impossible branch"
))
