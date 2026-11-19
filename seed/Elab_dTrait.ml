open Vuna_runtime
type t_InstSigInfo = { f_InstSigInfo_instSigClass : string; f_InstSigInfo_instSigTele : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List; f_InstSigInfo_instSigCtx : Core_dTerm.t_Term B_dData_dList.t_List; f_InstSigInfo_instSigArgs : Core_dTerm.t_Term B_dData_dList.t_List; f_InstSigInfo_instSigHead : Core_dTerm.t_Term }
and t_DictGoalGroup = { f_DictGoalGroup_dictGoalGroupRep : int; f_DictGoalGroup_dictGoalGroupDom : Core_dTerm.t_Value; f_DictGoalGroup_dictGoalGroupExtras : int B_dData_dList.t_List }

# 30 "Vuna/Compiler/Elab/Trait.vuna"
let rec v_bindClassParams = (fun (mc0 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc1 : Elab_dTypes.t_Ctx) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__0, dtb__1) -> (match dtb__0 with
  | { B_dData_dPair.f_Pair_first = dtb__2; B_dData_dPair.f_Pair_second = dtb__3 } -> ((v_bindClassParams dtb__1) (((Elab_dTypes.v_ctxBind dtb__2) dtb__3) mc1))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> mc1
  | _ -> failwith "DT: impossible branch"
))

# 39 "Vuna/Compiler/Elab/Trait.vuna"
let rec v_classFieldTysGo = (fun (mc0 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc1 : Elab_dTypes.t_Ctx) (mc2 : Elab_dTypes.t_Ec) (mc3 : (string, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc4 : Core_dTerm.t_Term B_dData_dList.t_List) -> (match mc3 with
  | B_dData_dList.C_List__x58__x58_ (dtb__4, dtb__5) -> (match dtb__4 with
  | { B_dData_dPair.f_Pair_first = dtb__6; B_dData_dPair.f_Pair_second = dtb__7 } -> ((Base_dCommon.v_bind ((((Elab_dTerm.v_checkType mc0) mc1) mc2) (((Elab_dSig.v_quantifyTraitSig (fun (nm : string) -> (B_dData_dMaybe.v_isJust ((Elab_dTypes.v_ctxLookup nm) mc1)))) dtb__7) (Frontend_dRast.v_exprSpan dtb__7)))) (fun (p : (Core_dTerm.t_Term, (Core_dTerm.t_Level, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> ((fun nd_uscrut13 -> (match nd_uscrut13 with
  | { B_dData_dPair.f_Pair_first = dtb__8; B_dData_dPair.f_Pair_second = dtb__9 } -> (match dtb__9 with
  | { B_dData_dPair.f_Pair_first = dtb__10; B_dData_dPair.f_Pair_second = dtb__11 } -> (((((v_classFieldTysGo mc0) mc1) dtb__11) dtb__5) (B_dData_dList.C_List__x58__x58_ (dtb__8, mc4)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) p)))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.v_reverse mc4); B_dData_dPair.f_Pair_second = mc2 }))
  | _ -> failwith "DT: impossible branch"
))

# 35 "Vuna/Compiler/Elab/Trait.vuna"
let v_classFieldTys = (fun (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ec : Elab_dTypes.t_Ec) (paramsKinds : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (methods : (string, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (((((v_classFieldTysGo globals) ((v_bindClassParams paramsKinds) Elab_dTypes.v_emptyCtx)) ec) methods) B_dData_dList.C_List_Nil))

# 54 "Vuna/Compiler/Elab/Trait.vuna"
let rec v_foldlAddDef = (fun (mc0 : Elab_dTypes.t_Ec) (mc1 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__12, dtb__13) -> ((v_foldlAddDef ((Elab_dTypes.v_ecAddDef mc0) dtb__12)) dtb__13)
  | B_dData_dList.C_List_Nil -> mc0
  | _ -> failwith "DT: impossible branch"
))

# 65 "Vuna/Compiler/Elab/Trait.vuna"
let rec v_foldPiFieldTysGo = (fun (mc0 : Core_dTerm.t_Term B_dData_dList.t_List) (mc1 : int) (mc2 : Core_dTerm.t_Term) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__14, dtb__15) -> (Core_dTerm.C_Term_TPi ("_", false, Core_dTerm.C_Rig_RigOmega, (((Core_dTerm.v_shift 0) mc1) dtb__14), (((v_foldPiFieldTysGo dtb__15) (mc1 + 1)) mc2)))
  | B_dData_dList.C_List_Nil -> mc2
  | _ -> failwith "DT: impossible branch"
))

# 62 "Vuna/Compiler/Elab/Trait.vuna"
let v_foldPiFieldTys = (fun (fieldTys : Core_dTerm.t_Term B_dData_dList.t_List) (ty : Core_dTerm.t_Term) -> (((v_foldPiFieldTysGo fieldTys) 0) ty))

# 128 "Vuna/Compiler/Elab/Trait.vuna"
let rec v_classParamKinds = (fun (mc0 : string B_dData_dList.t_List) (mc1 : (string, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__16, dtb__17) -> (B_dData_dList.C_List__x58__x58_ (((Elab_dSig.v_classParamKindOf dtb__16) mc1), ((v_classParamKinds dtb__17) mc1)))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 133 "Vuna/Compiler/Elab/Trait.vuna"
let rec v_traitParamNames = (fun (mc0 : Frontend_dRast.t_TraitParam B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__18, dtb__19) -> (match dtb__18 with
  | { Frontend_dRast.f_TraitParam_traitParamName = dtb__20; Frontend_dRast.f_TraitParam_traitParamKind = dtb__21 } -> (B_dData_dList.C_List__x58__x58_ (dtb__20, (v_traitParamNames dtb__19)))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 137 "Vuna/Compiler/Elab/Trait.vuna"
let rec v_traitParamKinds = (fun (mc0 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc1 : Elab_dTypes.t_Ec) (mc2 : Frontend_dRast.t_TraitParam B_dData_dList.t_List) (mc3 : (string, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__22, dtb__23) -> (match dtb__22 with
  | { Frontend_dRast.f_TraitParam_traitParamName = dtb__24; Frontend_dRast.f_TraitParam_traitParamKind = dtb__25 } -> (match dtb__25 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__26) -> (((((v_traitKindExplicit mc0) mc1) dtb__26) dtb__23) mc3)
  | B_dData_dMaybe.C_Maybe_Nothing -> (((((v_traitKindInfer mc0) mc1) dtb__24) dtb__23) mc3)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = mc1 }))
  | _ -> failwith "DT: impossible branch"
))
# 144 "Vuna/Compiler/Elab/Trait.vuna"
and v_traitKindExplicit = (fun (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ec : Elab_dTypes.t_Ec) (kexpr : Frontend_dRast.t_Expr) (rest : Frontend_dRast.t_TraitParam B_dData_dList.t_List) (methods : (string, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> ((Base_dCommon.v_bind ((((Elab_dTerm.v_checkType globals) Elab_dTypes.v_emptyCtx) ec) kexpr)) (fun (pk : (Core_dTerm.t_Term, (Core_dTerm.t_Level, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> ((fun nd_uscrut6 -> (match nd_uscrut6 with
  | { B_dData_dPair.f_Pair_first = dtb__27; B_dData_dPair.f_Pair_second = dtb__28 } -> (match dtb__28 with
  | { B_dData_dPair.f_Pair_first = dtb__29; B_dData_dPair.f_Pair_second = dtb__30 } -> ((Base_dCommon.v_bind ((((v_traitParamKinds globals) dtb__30) rest) methods)) (fun (pr : (Core_dTerm.t_Term B_dData_dList.t_List, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match pr with
  | { B_dData_dPair.f_Pair_first = dtb__31; B_dData_dPair.f_Pair_second = dtb__32 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ (dtb__27, dtb__31)); B_dData_dPair.f_Pair_second = dtb__32 }))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) pk))))
# 157 "Vuna/Compiler/Elab/Trait.vuna"
and v_traitKindInfer = (fun (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ec : Elab_dTypes.t_Ec) (pname : string) (rest : Frontend_dRast.t_TraitParam B_dData_dList.t_List) (methods : (string, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> ((Base_dCommon.v_bind ((((v_traitParamKinds globals) ec) rest) methods)) (fun (pr : (Core_dTerm.t_Term B_dData_dList.t_List, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match pr with
  | { B_dData_dPair.f_Pair_first = dtb__33; B_dData_dPair.f_Pair_second = dtb__34 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ (((Elab_dSig.v_classParamKindOf pname) methods), dtb__33)); B_dData_dPair.f_Pair_second = dtb__34 }))
  | _ -> failwith "DT: impossible branch"
))))

# 166 "Vuna/Compiler/Elab/Trait.vuna"
let rec v_foldParamPis = (fun (mc0 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc1 : Core_dTerm.t_Term) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__35, dtb__36) -> (match dtb__35 with
  | { B_dData_dPair.f_Pair_first = dtb__37; B_dData_dPair.f_Pair_second = dtb__38 } -> (Core_dTerm.C_Term_TPi (dtb__37, true, Core_dTerm.C_Rig_Rig0, dtb__38, ((v_foldParamPis dtb__36) mc1)))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> mc1
  | _ -> failwith "DT: impossible branch"
))

# 174 "Vuna/Compiler/Elab/Trait.vuna"
let rec v_dictParamArgs = (fun (mc0 : string B_dData_dList.t_List) (mc1 : int) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__39, dtb__40) -> (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = (Core_dTerm.C_Term_TVar (dtb__39, mc1, { Base_dSource.f_Span_spanFile = ""; Base_dSource.f_Span_spanStartLine = 0; Base_dSource.f_Span_spanStartCol = 0; Base_dSource.f_Span_spanEndLine = 0; Base_dSource.f_Span_spanEndCol = 0; Base_dSource.f_Span_spanStartOffset = 0; Base_dSource.f_Span_spanEndOffset = 0 })); B_dData_dPair.f_Pair_second = Core_dTerm.C_Rig_Rig0 }, ((v_dictParamArgs dtb__40) (mc1 - 1))))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 171 "Vuna/Compiler/Elab/Trait.vuna"
let v_dictAppTermOf = (fun (dname : string) (params : string B_dData_dList.t_List) -> ((Elab_dMeta.v_foldAppTerms (Core_dTerm.C_Term_TGlobal (dname))) ((v_dictParamArgs params) ((B_dData_dList.v_length params) - 1))))

# 179 "Vuna/Compiler/Elab/Trait.vuna"
let rec v_traitMethodPairs = (fun (mc0 : Frontend_dRast.t_TraitMethod B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__41, dtb__42) -> (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = (Frontend_dRast.v_traitMethodName dtb__41); B_dData_dPair.f_Pair_second = (dtb__41).Frontend_dRast.f_TraitMethod_traitMethodType }, (v_traitMethodPairs dtb__42)))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 202 "Vuna/Compiler/Elab/Trait.vuna"
let v_methodProjType = (fun (tname : string) (params : string B_dData_dList.t_List) (pKinds : Core_dTerm.t_Term B_dData_dList.t_List) (methodTy : Core_dTerm.t_Term) -> ((fun dictPi -> ((v_foldParamPis ((B_dData_dList.v_zip params) pKinds)) dictPi)) (Core_dTerm.C_Term_TPi ("_", true, Core_dTerm.C_Rig_RigOmega, ((v_dictAppTermOf (Elab_dMeta.v_dictTypeName tname)) params), (((Core_dTerm.v_shift 0) 1) methodTy)))))

# 194 "Vuna/Compiler/Elab/Trait.vuna"
let rec v_methodProjZip = (fun (mc0 : string) (mc1 : string B_dData_dList.t_List) (mc2 : Core_dTerm.t_Term B_dData_dList.t_List) (mc3 : int) (mc4 : (string, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc5 : Core_dTerm.t_Term B_dData_dList.t_List) -> (match mc4 with
  | B_dData_dList.C_List__x58__x58_ (dtb__43, dtb__44) -> (match dtb__43 with
  | { B_dData_dPair.f_Pair_first = dtb__45; B_dData_dPair.f_Pair_second = dtb__46 } -> (match mc5 with
  | B_dData_dList.C_List__x58__x58_ (dtb__47, dtb__48) -> (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__45; B_dData_dPair.f_Pair_second = ((((v_methodProjType mc0) mc1) mc2) dtb__47) }, ((((((v_methodProjZip mc0) mc1) mc2) (mc3 + 1)) dtb__44) dtb__48)))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 190 "Vuna/Compiler/Elab/Trait.vuna"
let v_methodProjections = (fun (tname : string) (params : string B_dData_dList.t_List) (pKinds : Core_dTerm.t_Term B_dData_dList.t_List) (methods : (string, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (fieldTys : Core_dTerm.t_Term B_dData_dList.t_List) -> ((((((v_methodProjZip tname) params) pKinds) 0) methods) fieldTys))

# 242 "Vuna/Compiler/Elab/Trait.vuna"
let rec v_projectionParamLams = (fun (mc0 : string B_dData_dList.t_List) (mc1 : Core_dTerm.t_Term) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__49, dtb__50) -> (Core_dTerm.C_Term_TLam (dtb__49, Core_dTerm.C_Rig_Rig0, B_dData_dMaybe.C_Maybe_Nothing, Base_dSource.v_spanEmpty, ((v_projectionParamLams dtb__50) mc1)))
  | B_dData_dList.C_List_Nil -> mc1
  | _ -> failwith "DT: impossible branch"
))

# 247 "Vuna/Compiler/Elab/Trait.vuna"
let v_projectionParamNames = (fun (n : int) -> (if (n = 1) then (B_dData_dList.C_List__x58__x58_ ("_p", B_dData_dList.C_List_Nil)) else ((B_dData_dList.v_map (fun (i : int) -> ("_p" ^ ((B_dTrait_dInterp.v_interp (B_dTrait_dInterp.v_Interp_ua B_dData_dInt.v_Show_uInt)) i)))) ((B_dData_dList.v_range 0) n))))

# 223 "Vuna/Compiler/Elab/Trait.vuna"
let v_projectionBodyOpaque = (fun (fieldOpaque : bool) (ctor : string) (fieldIdx : int) (rigs : Core_dTerm.t_Rig B_dData_dList.t_List) (nFields : int) (nParams : int) -> ((fun arity -> ((fun dictIdx -> ((fun fieldVar -> ((fun argPairs -> ((fun applied0 -> ((fun applied -> ((fun binders -> ((fun alt -> ((fun caseTerm -> ((fun lamArgs -> ((v_projectionParamLams (v_projectionParamNames nParams)) (Core_dTerm.C_Term_TLam ("_d", Core_dTerm.C_Rig_RigOmega, B_dData_dMaybe.C_Maybe_Nothing, Base_dSource.v_spanEmpty, lamArgs)))) (((Elab_dMeta.v_methodArgLams rigs) 0) caseTerm))) (Core_dTerm.C_Term_TCase ((Core_dTerm.C_Term_TVar ("_d", dictIdx, { Base_dSource.f_Span_spanFile = ""; Base_dSource.f_Span_spanStartLine = 0; Base_dSource.f_Span_spanStartCol = 0; Base_dSource.f_Span_spanEndLine = 0; Base_dSource.f_Span_spanEndCol = 0; Base_dSource.f_Span_spanStartOffset = 0; Base_dSource.f_Span_spanEndOffset = 0 })), (B_dData_dList.C_List__x58__x58_ (alt, B_dData_dList.C_List_Nil)))))) { Core_dTerm.f_CaseAlt_caseAltName = ctor; Core_dTerm.f_CaseAlt_caseAltBinders = binders; Core_dTerm.f_CaseAlt_caseAltBody = applied })) (Core_dTerm.v_bindersOfPairs (Elab_dMeta.v_fieldBinderNames nFields)))) (if fieldOpaque then ((Elab_dMeta.v_wrapOpaqueUses (B_dData_dList.C_List__x58__x58_ (((nFields - 1) - fieldIdx), B_dData_dList.C_List_Nil))) applied0) else applied0))) ((Elab_dMeta.v_foldAppTerms fieldVar) argPairs))) ((Elab_dMeta.v_methodArgTerms rigs) nFields))) (Core_dTerm.C_Term_TVar ((Elab_dMeta.v_fieldVarName fieldIdx), ((nFields - 1) - fieldIdx), { Base_dSource.f_Span_spanFile = ""; Base_dSource.f_Span_spanStartLine = 0; Base_dSource.f_Span_spanStartCol = 0; Base_dSource.f_Span_spanEndLine = 0; Base_dSource.f_Span_spanEndCol = 0; Base_dSource.f_Span_spanStartOffset = 0; Base_dSource.f_Span_spanEndOffset = 0 })))) arity)) (B_dData_dList.v_length rigs)))

# 215 "Vuna/Compiler/Elab/Trait.vuna"
let v_projectionBody = (fun (ctor : string) (fieldIdx : int) (rigs : Core_dTerm.t_Rig B_dData_dList.t_List) (nFields : int) (nParams : int) -> ((((((v_projectionBodyOpaque false) ctor) fieldIdx) rigs) nFields) nParams))

# 269 "Vuna/Compiler/Elab/Trait.vuna"
let rec v_flagAt = (fun (mc0 : int) (mc1 : bool B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__51, dtb__52) -> (if (mc0 <= 0) then dtb__51 else ((v_flagAt (mc0 - 1)) dtb__52))
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 260 "Vuna/Compiler/Elab/Trait.vuna"
let rec v_projectionDefsOpaqueGo = (fun (mc0 : bool B_dData_dList.t_List) (mc1 : string) (mc2 : int) (mc3 : (string, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc4 : Core_dTerm.t_Term B_dData_dList.t_List) (mc5 : int) (mc6 : int) -> (match mc3 with
  | B_dData_dList.C_List__x58__x58_ (dtb__53, dtb__54) -> (match dtb__53 with
  | { B_dData_dPair.f_Pair_first = dtb__55; B_dData_dPair.f_Pair_second = dtb__56 } -> (match mc4 with
  | B_dData_dList.C_List__x58__x58_ (dtb__57, dtb__58) -> (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__55; B_dData_dPair.f_Pair_second = ((((((v_projectionBodyOpaque ((v_flagAt mc5) mc0)) mc1) mc5) ((Elab_dSig.v_methodArgRigsOf Elab_dMeta.v_binderRig) dtb__57)) mc6) mc2) }, (((((((v_projectionDefsOpaqueGo mc0) mc1) mc2) dtb__54) dtb__58) (mc5 + 1)) mc6)))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 256 "Vuna/Compiler/Elab/Trait.vuna"
let v_projectionDefsOpaque = (fun (flags : bool B_dData_dList.t_List) (tname : string) (nParams : int) (methods : (string, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (fieldTys : Core_dTerm.t_Term B_dData_dList.t_List) (nFields : int) -> (((((((v_projectionDefsOpaqueGo flags) (Elab_dMeta.v_dictCtorName tname)) nParams) methods) fieldTys) 0) nFields))

# 251 "Vuna/Compiler/Elab/Trait.vuna"
let v_projectionDefs = (fun (tname : string) (nParams : int) (methods : (string, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (fieldTys : Core_dTerm.t_Term B_dData_dList.t_List) (nFields : int) -> ((((((v_projectionDefsOpaque ((B_dData_dList.v_map (fun (_u : Core_dTerm.t_Term) -> false)) fieldTys)) tname) nParams) methods) fieldTys) nFields))

# 273 "Vuna/Compiler/Elab/Trait.vuna"
let v_projectionDefsGo = (fun (ctor : string) (nParams : int) (methods : (string, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (fieldTys : Core_dTerm.t_Term B_dData_dList.t_List) (idx : int) (nFields : int) -> (((((((v_projectionDefsOpaqueGo ((B_dData_dList.v_map (fun (_u : Core_dTerm.t_Term) -> false)) fieldTys)) ctor) nParams) methods) fieldTys) idx) nFields))

# 283 "Vuna/Compiler/Elab/Trait.vuna"
let v_declTopName = (fun (mc0 : Frontend_dRast.t_Decl) -> (match mc0 with
  | Frontend_dRast.C_Decl_DTrait (dtb__59, dtb__60, dtb__61, dtb__62, dtb__63) -> (B_dData_dMaybe.C_Maybe_Just (dtb__59))
  | Frontend_dRast.C_Decl_DRecord (dtb__64, dtb__65, dtb__66, dtb__67, dtb__68, dtb__69, dtb__70, dtb__71) -> (B_dData_dMaybe.C_Maybe_Just (dtb__64))
  | Frontend_dRast.C_Decl_DData (dtb__72, dtb__73, dtb__74, dtb__75, dtb__76, dtb__77, dtb__78, dtb__79, dtb__80) -> (B_dData_dMaybe.C_Maybe_Just (dtb__72))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
))

# 289 "Vuna/Compiler/Elab/Trait.vuna"
let rec v_declNamedInFile = (fun (mc0 : (Frontend_dRast.t_Decl, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc1 : string) (mc2 : string) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__81, dtb__82) -> (match dtb__81 with
  | { B_dData_dPair.f_Pair_first = dtb__83; B_dData_dPair.f_Pair_second = dtb__84 } -> (match (v_declTopName dtb__83) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__85) -> (if (if (dtb__85 = mc1) then ((dtb__84).Base_dSource.f_Span_spanFile = mc2) else false) then true else (((v_declNamedInFile dtb__82) mc1) mc2))
  | B_dData_dMaybe.C_Maybe_Nothing -> (((v_declNamedInFile dtb__82) mc1) mc2)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 296 "Vuna/Compiler/Elab/Trait.vuna"
let rec v_headTypeNameOf = (fun (mc0 : Frontend_dRast.t_Expr) -> (match mc0 with
  | Frontend_dRast.C_Expr_EApp (dtb__86, dtb__87, dtb__88) -> (v_headTypeNameOf dtb__86)
  | Frontend_dRast.C_Expr_EVar (dtb__89, dtb__90) -> (B_dData_dMaybe.C_Maybe_Just ((Frontend_dRast_dName.v_rnameKey dtb__89)))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
))

# 301 "Vuna/Compiler/Elab/Trait.vuna"
let rec v_headTypeNamesOf = (fun (mc0 : Frontend_dRast.t_Expr B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__91, dtb__92) -> (match (v_headTypeNameOf dtb__91) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__93) -> (B_dData_dList.C_List__x58__x58_ (dtb__93, (v_headTypeNamesOf dtb__92)))
  | B_dData_dMaybe.C_Maybe_Nothing -> (v_headTypeNamesOf dtb__92)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 311 "Vuna/Compiler/Elab/Trait.vuna"
let v_isGlobalHeadType = (fun (n : string) -> (if (if (if (if (n = "Int") then true else (n = "String")) then true else (n = "Float")) then true else (n = "Array")) then true else (n = "IORef")))

# 320 "Vuna/Compiler/Elab/Trait.vuna"
let rec v_anyDeclInFile = (fun (mc0 : (Frontend_dRast.t_Decl, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc1 : string B_dData_dList.t_List) (mc2 : string) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__94, dtb__95) -> (if (((v_declNamedInFile mc0) dtb__94) mc2) then true else (((v_anyDeclInFile mc0) dtb__95) mc2))
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 325 "Vuna/Compiler/Elab/Trait.vuna"
let rec v_anyGlobalHead = (fun (mc0 : string B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__96, dtb__97) -> (if (v_isGlobalHeadType dtb__96) then true else (v_anyGlobalHead dtb__97))
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 415 "Vuna/Compiler/Elab/Trait.vuna"
let v_instanceHeadParts = (fun (mc0 : Frontend_dRast.t_Expr) -> (match mc0 with
  | Frontend_dRast.C_Expr_EApp (dtb__98, dtb__99, dtb__100) -> (match dtb__98 with
  | Frontend_dRast.C_Expr_EVar (dtb__101, dtb__102) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Frontend_dRast_dName.v_rnameKey dtb__101); B_dData_dPair.f_Pair_second = dtb__99 }))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | Frontend_dRast.C_Expr_EVar (dtb__103, dtb__104) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Frontend_dRast_dName.v_rnameKey dtb__103); B_dData_dPair.f_Pair_second = B_dData_dList.C_List_Nil }))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
))

# 314 "Vuna/Compiler/Elab/Trait.vuna"
let v_instanceHeadTypeNames = (fun (headExpr : Frontend_dRast.t_Expr) -> ((fun nd_uscrut1 -> (match nd_uscrut1 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__105) -> (match dtb__105 with
  | { B_dData_dPair.f_Pair_first = dtb__106; B_dData_dPair.f_Pair_second = dtb__107 } -> (v_headTypeNamesOf dtb__107)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
)) (v_instanceHeadParts headExpr)))

# 329 "Vuna/Compiler/Elab/Trait.vuna"
let v_instanceLandingOk = (fun (allDecls : (Frontend_dRast.t_Decl, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List) (sp : Base_dSource.t_Span) (cls : Elab_dTypes.t_DtClass) (headExpr : Frontend_dRast.t_Expr) -> ((fun file -> ((fun headNames -> (if (if (((v_declNamedInFile allDecls) (Elab_dTypes.v_dtClassName cls)) file) then true else (((v_anyDeclInFile allDecls) headNames) file)) then true else (v_anyGlobalHead headNames))) (v_instanceHeadTypeNames headExpr))) (sp).Base_dSource.f_Span_spanFile))

# 431 "Vuna/Compiler/Elab/Trait.vuna"
let v_instanceConstraintParts = (fun (mc0 : Frontend_dRast.t_Expr) -> (match mc0 with
  | Frontend_dRast.C_Expr_EVar (dtb__108, dtb__109) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Frontend_dRast_dName.v_rnameKey dtb__108); B_dData_dPair.f_Pair_second = B_dData_dList.C_List_Nil }))
  | Frontend_dRast.C_Expr_EApp (dtb__110, dtb__111, dtb__112) -> (match dtb__110 with
  | Frontend_dRast.C_Expr_EVar (dtb__113, dtb__114) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Frontend_dRast_dName.v_rnameKey dtb__113); B_dData_dPair.f_Pair_second = dtb__111 }))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
))

# 423 "Vuna/Compiler/Elab/Trait.vuna"
let rec v_constraintPartsOf = (fun (mc0 : Base_dSource.t_Span) (mc1 : Frontend_dRast.t_Expr B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__115, dtb__116) -> (match (v_instanceConstraintParts dtb__115) with
  | B_dData_dMaybe.C_Maybe_Nothing -> ((Base_dDiagnostics_dTc.v_tcErr0 mc0) Base_dDiagnostics_dTc.C_TcErr_ConstraintNotDict)
  | B_dData_dMaybe.C_Maybe_Just (dtb__117) -> ((Base_dCommon.v_bind ((v_constraintPartsOf mc0) dtb__116)) (fun (ps : (string, Frontend_dRast.t_Expr B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((B_dData_dList.C_List__x58__x58_ (dtb__117, ps))))))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (B_dData_dList.C_List_Nil))
  | _ -> failwith "DT: impossible branch"
))

# 447 "Vuna/Compiler/Elab/Trait.vuna"
let v_instSigClass = (fun (mc0 : t_InstSigInfo) -> (match mc0 with
  | { f_InstSigInfo_instSigClass = dtb__118; f_InstSigInfo_instSigTele = dtb__119; f_InstSigInfo_instSigCtx = dtb__120; f_InstSigInfo_instSigArgs = dtb__121; f_InstSigInfo_instSigHead = dtb__122 } -> dtb__118
  | _ -> failwith "DT: impossible branch"
))

# 450 "Vuna/Compiler/Elab/Trait.vuna"
let v_instSigTele = (fun (mc0 : t_InstSigInfo) -> (match mc0 with
  | { f_InstSigInfo_instSigClass = dtb__123; f_InstSigInfo_instSigTele = dtb__124; f_InstSigInfo_instSigCtx = dtb__125; f_InstSigInfo_instSigArgs = dtb__126; f_InstSigInfo_instSigHead = dtb__127 } -> dtb__124
  | _ -> failwith "DT: impossible branch"
))

# 453 "Vuna/Compiler/Elab/Trait.vuna"
let v_instSigCtx = (fun (mc0 : t_InstSigInfo) -> (match mc0 with
  | { f_InstSigInfo_instSigClass = dtb__128; f_InstSigInfo_instSigTele = dtb__129; f_InstSigInfo_instSigCtx = dtb__130; f_InstSigInfo_instSigArgs = dtb__131; f_InstSigInfo_instSigHead = dtb__132 } -> dtb__130
  | _ -> failwith "DT: impossible branch"
))

# 456 "Vuna/Compiler/Elab/Trait.vuna"
let v_instSigArgs = (fun (mc0 : t_InstSigInfo) -> (match mc0 with
  | { f_InstSigInfo_instSigClass = dtb__133; f_InstSigInfo_instSigTele = dtb__134; f_InstSigInfo_instSigCtx = dtb__135; f_InstSigInfo_instSigArgs = dtb__136; f_InstSigInfo_instSigHead = dtb__137 } -> dtb__136
  | _ -> failwith "DT: impossible branch"
))

# 459 "Vuna/Compiler/Elab/Trait.vuna"
let v_instSigHead = (fun (mc0 : t_InstSigInfo) -> (match mc0 with
  | { f_InstSigInfo_instSigClass = dtb__138; f_InstSigInfo_instSigTele = dtb__139; f_InstSigInfo_instSigCtx = dtb__140; f_InstSigInfo_instSigArgs = dtb__141; f_InstSigInfo_instSigHead = dtb__142 } -> dtb__142
  | _ -> failwith "DT: impossible branch"
))

# 532 "Vuna/Compiler/Elab/Trait.vuna"
let rec v_checkArgsAtKinds = (fun (mc0 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc1 : Elab_dTypes.t_Ctx) (mc2 : Elab_dTypes.t_Ec) (mc3 : Frontend_dRast.t_Expr B_dData_dList.t_List) (mc4 : Core_dTerm.t_Value B_dData_dList.t_List) (mc5 : Base_dSource.t_Span) -> (match mc3 with
  | B_dData_dList.C_List__x58__x58_ (dtb__143, dtb__144) -> (match mc4 with
  | B_dData_dList.C_List__x58__x58_ (dtb__145, dtb__146) -> ((Base_dCommon.v_bind ((((((Elab_dTerm_dImpl.v_checkTypeAtKind mc0) mc1) mc2) dtb__143) dtb__145) mc5)) (fun (q : (Core_dTerm.t_Term, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match q with
  | { B_dData_dPair.f_Pair_first = dtb__147; B_dData_dPair.f_Pair_second = dtb__148 } -> ((Base_dCommon.v_bind ((((((v_checkArgsAtKinds mc0) mc1) dtb__148) dtb__144) dtb__146) mc5)) (fun (r : (Core_dTerm.t_Term B_dData_dList.t_List, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match r with
  | { B_dData_dPair.f_Pair_first = dtb__149; B_dData_dPair.f_Pair_second = dtb__150 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ (dtb__147, dtb__149)); B_dData_dPair.f_Pair_second = dtb__150 }))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> ((Base_dDiagnostics_dTc.v_tcErr0 mc5) Base_dDiagnostics_dTc.C_TcErr_InstanceHeadNotApp)
)
  | B_dData_dList.C_List_Nil -> (match mc4 with
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = mc2 }))
  | _ -> ((Base_dDiagnostics_dTc.v_tcErr0 mc5) Base_dDiagnostics_dTc.C_TcErr_InstanceHeadNotApp)
)
  | _ -> failwith "DT: impossible branch"
))

# 560 "Vuna/Compiler/Elab/Trait.vuna"
let rec v_closedTypeTerm = (fun (mc0 : Frontend_dRast.t_Expr) -> (match mc0 with
  | Frontend_dRast.C_Expr_EApp (dtb__151, dtb__152, dtb__153) -> (match (v_closedTypeTerm dtb__151) with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb__154) -> (match (v_closedTypeArgs dtb__152) with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb__155) -> (B_dData_dMaybe.C_Maybe_Just (((Elab_dMeta.v_foldAppTerms dtb__154) dtb__155)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Frontend_dRast.C_Expr_EVar (dtb__156, dtb__157) -> (B_dData_dMaybe.C_Maybe_Just ((Core_dTerm.C_Term_TGlobal ((Frontend_dRast_dName.v_rnameKey dtb__156)))))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
))
# 571 "Vuna/Compiler/Elab/Trait.vuna"
and v_closedTypeArgs = (fun (mc0 : Frontend_dRast.t_Expr B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__158, dtb__159) -> (match (v_closedTypeTerm dtb__158) with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb__160) -> (match (v_closedTypeArgs dtb__159) with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb__161) -> (B_dData_dMaybe.C_Maybe_Just ((B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__160; B_dData_dPair.f_Pair_second = Core_dTerm.C_Rig_Rig0 }, dtb__161))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (B_dData_dMaybe.C_Maybe_Just (B_dData_dList.C_List_Nil))
  | _ -> failwith "DT: impossible branch"
))

# 550 "Vuna/Compiler/Elab/Trait.vuna"
let rec v_closedTypeTerms = (fun (mc0 : Frontend_dRast.t_Expr B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__162, dtb__163) -> (match (v_closedTypeTerm dtb__162) with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb__164) -> (match (v_closedTypeTerms dtb__163) with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb__165) -> (B_dData_dMaybe.C_Maybe_Just ((B_dData_dList.C_List__x58__x58_ (dtb__164, dtb__165))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (B_dData_dMaybe.C_Maybe_Just (B_dData_dList.C_List_Nil))
  | _ -> failwith "DT: impossible branch"
))

# 588 "Vuna/Compiler/Elab/Trait.vuna"
let v_isLowerStart = (fun (n : string) -> (match (B_dData_dList.dtp_unpack n) with
  | B_dData_dList.C_List_Nil -> false
  | B_dData_dList.C_List__x58__x58_ (dtb__166, dtb__167) -> (if (dtb__166 >= 97) then (dtb__166 <= 122) else false)
  | _ -> failwith "DT: impossible branch"
))

# 618 "Vuna/Compiler/Elab/Trait.vuna"
let rec v_seedKindOf = (fun (mc0 : string) (mc1 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__168, dtb__169) -> (match dtb__168 with
  | { B_dData_dPair.f_Pair_first = dtb__170; B_dData_dPair.f_Pair_second = dtb__171 } -> (if (dtb__170 = mc0) then (B_dData_dMaybe.C_Maybe_Just (dtb__171)) else ((v_seedKindOf mc0) dtb__169))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 600 "Vuna/Compiler/Elab/Trait.vuna"
let rec v_teleMetasInit = (fun (mc0 : string B_dData_dList.t_List) (mc1 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc2 : Elab_dTypes.t_Ec) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__172, dtb__173) -> (match ((v_seedKindOf dtb__172) mc1) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__174) -> (match (((v_teleMetasInit dtb__173) mc1) mc2) with
  | { B_dData_dPair.f_Pair_first = dtb__175; B_dData_dPair.f_Pair_second = dtb__176 } -> { B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__172; B_dData_dPair.f_Pair_second = dtb__174 }, dtb__175)); B_dData_dPair.f_Pair_second = dtb__176 }
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> ((fun nd_uscrut7 -> (match nd_uscrut7 with
  | { B_dData_dPair.f_Pair_first = dtb__177; B_dData_dPair.f_Pair_second = dtb__178 } -> (match dtb__177 with
  | Core_dTerm.C_Term_TMeta (dtb__179) -> (match (((v_teleMetasInit dtb__173) mc1) dtb__178) with
  | { B_dData_dPair.f_Pair_first = dtb__180; B_dData_dPair.f_Pair_second = dtb__181 } -> { B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__172; B_dData_dPair.f_Pair_second = (Core_dTerm.C_Term_TMeta (dtb__179)) }, dtb__180)); B_dData_dPair.f_Pair_second = dtb__181 }
  | _ -> failwith "DT: impossible branch"
)
  | _ -> (match (((v_teleMetasInit dtb__173) mc1) dtb__178) with
  | { B_dData_dPair.f_Pair_first = dtb__182; B_dData_dPair.f_Pair_second = dtb__183 } -> { B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__172; B_dData_dPair.f_Pair_second = dtb__177 }, dtb__182)); B_dData_dPair.f_Pair_second = dtb__183 }
  | _ -> failwith "DT: impossible branch"
)
)
  | _ -> failwith "DT: impossible branch"
)) ((Elab_dTypes.v_newMeta Elab_dTypes.v_emptyCtx) mc2))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> { B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = mc2 }
  | _ -> failwith "DT: impossible branch"
))

# 624 "Vuna/Compiler/Elab/Trait.vuna"
let rec v_bareTeleSeeds = (fun (mc0 : Frontend_dRast.t_Expr B_dData_dList.t_List) (mc1 : Core_dTerm.t_Value B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__184, dtb__185) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__186, dtb__187) -> (match dtb__184 with
  | Frontend_dRast.C_Expr_EVar (dtb__188, dtb__189) -> (if (v_isLowerStart (Frontend_dRast_dName.v_rnameKey dtb__188)) then (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = (Frontend_dRast_dName.v_rnameKey dtb__188); B_dData_dPair.f_Pair_second = ((Core_dEval.v_quote 0) dtb__186) }, ((v_bareTeleSeeds dtb__185) dtb__187))) else ((v_bareTeleSeeds dtb__185) dtb__187))
  | _ -> ((v_bareTeleSeeds dtb__185) dtb__187)
)
  | _ -> B_dData_dList.C_List_Nil
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 636 "Vuna/Compiler/Elab/Trait.vuna"
let rec v_ctxBareTeleSeeds = (fun (mc0 : Elab_dTypes.t_DtClass B_dData_dList.t_List) (mc1 : Elab_dTypes.t_Ec) (mc2 : (string, Frontend_dRast.t_Expr B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__190, dtb__191) -> (match dtb__190 with
  | { B_dData_dPair.f_Pair_first = dtb__192; B_dData_dPair.f_Pair_second = dtb__193 } -> (match ((Elab_dDict.v_findClass dtb__192) mc0) with
  | B_dData_dMaybe.C_Maybe_Nothing -> (((v_ctxBareTeleSeeds mc0) mc1) dtb__191)
  | B_dData_dMaybe.C_Maybe_Just (dtb__194) -> (match ((Elab_dDict.v_dictArgKinds mc1) (Core_dTerm.C_Value_VNeutral ((Core_dTerm.C_Neutral_NGlobal ((Elab_dMeta.v_dictTypeName (Elab_dTypes.v_dtClassName dtb__194)), B_dData_dList.C_List_Nil))))) with
  | B_dData_dMaybe.C_Maybe_Nothing -> (((v_ctxBareTeleSeeds mc0) mc1) dtb__191)
  | B_dData_dMaybe.C_Maybe_Just (dtb__195) -> ((B_dData_dList.v_append ((v_bareTeleSeeds dtb__193) dtb__195)) (((v_ctxBareTeleSeeds mc0) mc1) dtb__191))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 663 "Vuna/Compiler/Elab/Trait.vuna"
let v_fallbackTeleKind = (fun (combined : Frontend_dRast.t_Expr) (v : string) -> ((Elab_dSig.v_arityFun ((Elab_dSig.v_exprMaxAppArity v) combined)) (Core_dTerm.C_Term_TType (Core_dTerm.v_levelZero))))

# 652 "Vuna/Compiler/Elab/Trait.vuna"
let v_resolveTeleKind = (fun (mc0 : Frontend_dRast.t_Expr) (mc1 : string) (mc2 : Core_dTerm.t_Term) (mc3 : Elab_dTypes.t_Ec) -> (match mc2 with
  | Core_dTerm.C_Term_TMeta (dtb__196) -> (match ((Core_dTerm.v_solsLookup dtb__196) (Elab_dTypes.v_ecSolsP mc3)) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__197) -> ((fun q -> (if ((Core_dTerm.v_hasFreeTermVar 0) q) then ((v_fallbackTeleKind mc0) mc1) else q)) ((Core_dEval.v_quote 0) dtb__197))
  | B_dData_dMaybe.C_Maybe_Nothing -> ((v_fallbackTeleKind mc0) mc1)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> mc2
))

# 647 "Vuna/Compiler/Elab/Trait.vuna"
let rec v_resolveTeleKinds = (fun (mc0 : Frontend_dRast.t_Expr) (mc1 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc2 : Elab_dTypes.t_Ec) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__198, dtb__199) -> (match dtb__198 with
  | { B_dData_dPair.f_Pair_first = dtb__200; B_dData_dPair.f_Pair_second = dtb__201 } -> (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__200; B_dData_dPair.f_Pair_second = ((((v_resolveTeleKind mc0) dtb__200) dtb__201) mc2) }, (((v_resolveTeleKinds mc0) dtb__199) mc2)))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 666 "Vuna/Compiler/Elab/Trait.vuna"
let rec v_exprFreeLower = (fun (mc0 : Frontend_dRast.t_Expr) -> (match mc0 with
  | Frontend_dRast.C_Expr_EAnn (dtb__202, dtb__203, dtb__204) -> ((B_dData_dList.v_append (v_exprFreeLower dtb__202)) (v_exprFreeLower dtb__203))
  | Frontend_dRast.C_Expr_EPi (dtb__205, dtb__206, dtb__207, dtb__208, dtb__209, dtb__210) -> ((B_dData_dList.v_append (v_exprFreeLower dtb__208)) (v_exprFreeLower dtb__209))
  | Frontend_dRast.C_Expr_EApp (dtb__211, dtb__212, dtb__213) -> ((B_dData_dList.v_append (v_exprFreeLower dtb__211)) ((B_dData_dList.v_concatMap v_exprFreeLower) dtb__212))
  | Frontend_dRast.C_Expr_EVar (dtb__214, dtb__215) -> (if (v_isLowerStart (Frontend_dRast_dName.v_rnameKey dtb__214)) then (B_dData_dList.C_List__x58__x58_ ((Frontend_dRast_dName.v_rnameKey dtb__214), B_dData_dList.C_List_Nil)) else B_dData_dList.C_List_Nil)
  | _ -> B_dData_dList.C_List_Nil
))

# 582 "Vuna/Compiler/Elab/Trait.vuna"
let v_instanceMono = (fun (e : Frontend_dRast.t_Expr) -> (match (v_exprFreeLower e) with
  | B_dData_dList.C_List_Nil -> true
  | _ -> false
))

# 673 "Vuna/Compiler/Elab/Trait.vuna"
let rec v_keepOutBanned = (fun (mc0 : (string, bool) B_dContainer_dHashMap.t_HashMap) (mc1 : string B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__216, dtb__217) -> (if ((((B_dContainer_dHashMap.v_member B_dData_dString.v_Hashable_uString) B_dData_dString.v_Eq_uString) dtb__216) mc0) then ((v_keepOutBanned mc0) dtb__217) else (B_dData_dList.C_List__x58__x58_ (dtb__216, ((v_keepOutBanned mc0) dtb__217))))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 596 "Vuna/Compiler/Elab/Trait.vuna"
let v_instanceTeleMetas = (fun (banned : (string, bool) B_dContainer_dHashMap.t_HashMap) (combined : Frontend_dRast.t_Expr) (exprs : Frontend_dRast.t_Expr B_dData_dList.t_List) (seeds : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ec : Elab_dTypes.t_Ec) -> (((v_teleMetasInit (B_dData_dList.v_nubNames ((v_keepOutBanned banned) ((B_dData_dList.v_concatMap v_exprFreeLower) exprs)))) seeds) ec))

# 682 "Vuna/Compiler/Elab/Trait.vuna"
let rec v_instanceTeleCtxGo = (fun (mc0 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc1 : Elab_dTypes.t_Ctx) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__218, dtb__219) -> (match dtb__218 with
  | { B_dData_dPair.f_Pair_first = dtb__220; B_dData_dPair.f_Pair_second = dtb__221 } -> ((v_instanceTeleCtxGo dtb__219) (((Elab_dTypes.v_ctxBindValue dtb__220) ((Core_dEval.v_eval B_dData_dList.C_List_Nil) dtb__221)) mc1))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> mc1
  | _ -> failwith "DT: impossible branch"
))

# 679 "Vuna/Compiler/Elab/Trait.vuna"
let v_instanceTeleCtx = (fun (tele : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) -> ((v_instanceTeleCtxGo tele) Elab_dTypes.v_emptyCtx))

# 722 "Vuna/Compiler/Elab/Trait.vuna"
let v_ctxDictName = (fun (k : int) -> ("_ctx" ^ (bi_strFromInt k)))

# 717 "Vuna/Compiler/Elab/Trait.vuna"
let rec v_instBodyCtxGo = (fun (mc0 : Elab_dTypes.t_Ctx) (mc1 : Core_dTerm.t_Term B_dData_dList.t_List) (mc2 : int) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__222, dtb__223) -> (((v_instBodyCtxGo (((Elab_dTypes.v_ctxBindValue (v_ctxDictName mc2)) ((Core_dEval.v_eval (Elab_dTypes.v_ctxEnv mc0)) (((Core_dTerm.v_shift 0) mc2) dtb__222))) mc0)) dtb__223) (mc2 + 1))
  | B_dData_dList.C_List_Nil -> mc0
  | _ -> failwith "DT: impossible branch"
))

# 714 "Vuna/Compiler/Elab/Trait.vuna"
let v_instBodyCtx = (fun (info : t_InstSigInfo) -> (((v_instBodyCtxGo (v_instanceTeleCtx (v_instSigTele info))) (v_instSigCtx info)) 0))

# 732 "Vuna/Compiler/Elab/Trait.vuna"
let rec v_instTeleLam = (fun (mc0 : Core_dTerm.t_Term) (mc1 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__224, dtb__225) -> (match dtb__224 with
  | { B_dData_dPair.f_Pair_first = dtb__226; B_dData_dPair.f_Pair_second = dtb__227 } -> (Core_dTerm.C_Term_TLam (dtb__226, Core_dTerm.C_Rig_Rig0, B_dData_dMaybe.C_Maybe_Nothing, Base_dSource.v_spanEmpty, ((v_instTeleLam mc0) dtb__225)))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> mc0
  | _ -> failwith "DT: impossible branch"
))

# 739 "Vuna/Compiler/Elab/Trait.vuna"
let rec v_instCtxLamGo = (fun (body : Core_dTerm.t_Term) (remaining : int) (k : int) -> (if (remaining <= 0) then body else (Core_dTerm.C_Term_TLam ((v_ctxDictName k), Core_dTerm.C_Rig_RigOmega, B_dData_dMaybe.C_Maybe_Nothing, Base_dSource.v_spanEmpty, (((v_instCtxLamGo body) (remaining - 1)) (k + 1))))))

# 736 "Vuna/Compiler/Elab/Trait.vuna"
let v_instCtxLam = (fun (body : Core_dTerm.t_Term) (nCtx : int) (k : int) -> (((v_instCtxLamGo body) (nCtx - k)) k))

# 726 "Vuna/Compiler/Elab/Trait.vuna"
let v_instValueOf = (fun (info : t_InstSigInfo) (ctor : string) (fields : Core_dTerm.t_Term B_dData_dList.t_List) -> ((v_instTeleLam (((v_instCtxLam (Core_dTerm.C_Term_TCon (ctor, ((B_dData_dList.v_map (fun (t : Core_dTerm.t_Term) -> { B_dData_dPair.f_Pair_first = t; B_dData_dPair.f_Pair_second = Core_dTerm.C_Rig_RigOmega })) fields)))) (B_dData_dList.v_length (v_instSigCtx info))) 0)) (v_instSigTele info)))

# 755 "Vuna/Compiler/Elab/Trait.vuna"
let rec v_instTypeCtx = (fun (mc0 : Core_dTerm.t_Term) (mc1 : Core_dTerm.t_Term B_dData_dList.t_List) (mc2 : int) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__228, dtb__229) -> (((v_instTypeCtx (Core_dTerm.C_Term_TPi ((v_ctxDictName mc2), true, Core_dTerm.C_Rig_RigOmega, (((Core_dTerm.v_shift 0) mc2) dtb__228), mc0))) dtb__229) (mc2 - 1))
  | B_dData_dList.C_List_Nil -> mc0
  | _ -> failwith "DT: impossible branch"
))

# 760 "Vuna/Compiler/Elab/Trait.vuna"
let rec v_instTypeTele = (fun (mc0 : Core_dTerm.t_Term) (mc1 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__230, dtb__231) -> (match dtb__230 with
  | { B_dData_dPair.f_Pair_first = dtb__232; B_dData_dPair.f_Pair_second = dtb__233 } -> (Core_dTerm.C_Term_TPi (dtb__232, true, Core_dTerm.C_Rig_Rig0, dtb__233, ((v_instTypeTele mc0) dtb__231)))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> mc0
  | _ -> failwith "DT: impossible branch"
))

# 747 "Vuna/Compiler/Elab/Trait.vuna"
let v_instTypeOf = (fun (info : t_InstSigInfo) -> ((fun nCtx -> ((fun body0 -> ((fun body1 -> ((v_instTypeTele body1) (v_instSigTele info))) (((v_instTypeCtx body0) (B_dData_dList.v_reverse (v_instSigCtx info))) (nCtx - 1)))) (((Core_dTerm.v_shift 0) nCtx) (v_instSigHead info)))) (B_dData_dList.v_length (v_instSigCtx info))))

# 766 "Vuna/Compiler/Elab/Trait.vuna"
let v_instanceHeadTerm = (fun (mc0 : Frontend_dRast.t_Expr) -> (match mc0 with
  | Frontend_dRast.C_Expr_EVar (dtb__234, dtb__235) -> (Core_dTerm.C_Term_TGlobal ((Frontend_dRast_dName.v_rnameKey dtb__234)))
  | Frontend_dRast.C_Expr_EApp (dtb__236, dtb__237, dtb__238) -> (match dtb__237 with
  | B_dData_dList.C_List__x58__x58_ (dtb__239, dtb__240) -> (Core_dTerm.C_Term_TGlobal ((Elab_dInstName.v_argNameOf dtb__239)))
  | _ -> (Core_dTerm.C_Term_TGlobal ("Int"))
)
  | _ -> (Core_dTerm.C_Term_TGlobal ("Int"))
))

# 774 "Vuna/Compiler/Elab/Trait.vuna"
let v_canonicalMethodShort = (fun (name : string) -> (if ((Elab_dMeta.v_baseNameOf name) = "eq") then "==" else (if ((Elab_dMeta.v_baseNameOf name) = "neq") then "/=" else (if ((Elab_dMeta.v_baseNameOf name) = "lt") then "<" else (if ((Elab_dMeta.v_baseNameOf name) = "le") then "<=" else (if ((Elab_dMeta.v_baseNameOf name) = "gt") then ">" else (if ((Elab_dMeta.v_baseNameOf name) = "ge") then ">=" else (if ((Elab_dMeta.v_baseNameOf name) = "add") then "+" else (if ((Elab_dMeta.v_baseNameOf name) = "sub") then "-" else (if ((Elab_dMeta.v_baseNameOf name) = "mul") then "*" else (if ((Elab_dMeta.v_baseNameOf name) = "div") then "/" else (if ((Elab_dMeta.v_baseNameOf name) = "bind") then ">>=" else ((fun other -> other) (Elab_dMeta.v_baseNameOf name))))))))))))))

# 790 "Vuna/Compiler/Elab/Trait.vuna"
let v_sameMethodShort = (fun (a : string) (b : string) -> ((v_canonicalMethodShort a) = (v_canonicalMethodShort b)))

# 793 "Vuna/Compiler/Elab/Trait.vuna"
let rec v_anySameMethod = (fun (mc0 : string) (mc1 : string B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__241, dtb__242) -> (if ((v_sameMethodShort mc0) dtb__241) then true else ((v_anySameMethod mc0) dtb__242))
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 801 "Vuna/Compiler/Elab/Trait.vuna"
let rec v_firstUnknownInstanceMethodGo = (fun (mc0 : string B_dData_dList.t_List) (mc1 : Frontend_dRast.t_Decl B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__243, dtb__244) -> (match dtb__243 with
  | Frontend_dRast.C_Decl_DFun (dtb__245, dtb__246, dtb__247, dtb__248) -> (if ((v_anySameMethod (Elab_dMeta.v_baseNameOf dtb__245)) mc0) then ((v_firstUnknownInstanceMethodGo mc0) dtb__244) else (B_dData_dMaybe.C_Maybe_Just (dtb__245)))
  | _ -> ((v_firstUnknownInstanceMethodGo mc0) dtb__244)
)
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 797 "Vuna/Compiler/Elab/Trait.vuna"
let v_firstUnknownInstanceMethod = (fun (cls : Elab_dTypes.t_DtClass) (methods : Frontend_dRast.t_Decl B_dData_dList.t_List) -> ((v_firstUnknownInstanceMethodGo ((B_dData_dList.v_map (fun (m : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair) -> (Elab_dMeta.v_baseNameOf (B_dData_dPair.v_firstOf m)))) (cls).Elab_dTypes.f_DtClass_dtClassMethods)) methods))

# 822 "Vuna/Compiler/Elab/Trait.vuna"
let rec v_hasMethodClauses = (fun (mc0 : string) (mc1 : Frontend_dRast.t_Decl B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__249, dtb__250) -> (match dtb__249 with
  | Frontend_dRast.C_Decl_DFun (dtb__251, dtb__252, dtb__253, dtb__254) -> (if ((v_sameMethodShort dtb__251) mc0) then true else ((v_hasMethodClauses mc0) dtb__250))
  | _ -> ((v_hasMethodClauses mc0) dtb__250)
)
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 814 "Vuna/Compiler/Elab/Trait.vuna"
let rec v_firstMissingInstanceMethodGo = (fun (mc0 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc1 : Frontend_dRast.t_Decl B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__255, dtb__256) -> (if ((v_hasMethodClauses (Elab_dMeta.v_baseNameOf (B_dData_dPair.v_firstOf dtb__255))) mc1) then ((v_firstMissingInstanceMethodGo dtb__256) mc1) else (B_dData_dMaybe.C_Maybe_Just ((B_dData_dPair.v_firstOf dtb__255))))
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 811 "Vuna/Compiler/Elab/Trait.vuna"
let v_firstMissingInstanceMethod = (fun (cls : Elab_dTypes.t_DtClass) (methods : Frontend_dRast.t_Decl B_dData_dList.t_List) -> ((v_firstMissingInstanceMethodGo (cls).Elab_dTypes.f_DtClass_dtClassMethods) methods))

# 833 "Vuna/Compiler/Elab/Trait.vuna"
let rec v_findTraitDecl = (fun (mc0 : string) (mc1 : (Frontend_dRast.t_Decl, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__257, dtb__258) -> (match dtb__257 with
  | { B_dData_dPair.f_Pair_first = dtb__259; B_dData_dPair.f_Pair_second = dtb__260 } -> (match dtb__259 with
  | Frontend_dRast.C_Decl_DTrait (dtb__261, dtb__262, dtb__263, dtb__264, dtb__265) -> (if (dtb__261 = mc0) then (B_dData_dMaybe.C_Maybe_Just (dtb__259)) else ((v_findTraitDecl mc0) dtb__258))
  | _ -> ((v_findTraitDecl mc0) dtb__258)
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 841 "Vuna/Compiler/Elab/Trait.vuna"
let rec v_findTraitMethodSpan = (fun (mc0 : string) (mc1 : Frontend_dRast.t_TraitMethod B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__266, dtb__267) -> (if ((Frontend_dRast.v_traitMethodName dtb__266) = mc0) then (B_dData_dMaybe.C_Maybe_Just ((Frontend_dRast.v_traitMethodSpan dtb__266))) else ((v_findTraitMethodSpan mc0) dtb__267))
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 846 "Vuna/Compiler/Elab/Trait.vuna"
let v_traitMethodSpanOf = (fun (cls : Elab_dTypes.t_DtClass) (mname : string) (decls : (Frontend_dRast.t_Decl, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List) -> ((fun nd_uscrut3 -> (match nd_uscrut3 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__268) -> (match dtb__268 with
  | Frontend_dRast.C_Decl_DTrait (dtb__269, dtb__270, dtb__271, dtb__272, dtb__273) -> ((v_findTraitMethodSpan mname) dtb__272)
  | _ -> ((B_dData_dList.v_lookupPair mname) (cls).Elab_dTypes.f_DtClass_dtClassMethodSpans)
)
  | _ -> ((B_dData_dList.v_lookupPair mname) (cls).Elab_dTypes.f_DtClass_dtClassMethodSpans)
)) ((v_findTraitDecl (Elab_dTypes.v_dtClassName cls)) decls)))

# 853 "Vuna/Compiler/Elab/Trait.vuna"
let v_ctorResultType = (fun (cls : Elab_dTypes.t_DtClass) (args : Core_dTerm.t_Term B_dData_dList.t_List) -> ((Elab_dMeta.v_foldAppTerms (Core_dTerm.C_Term_TGlobal ((Elab_dMeta.v_dictTypeName (Elab_dTypes.v_dtClassName cls))))) ((B_dData_dList.v_map (fun (a : Core_dTerm.t_Term) -> { B_dData_dPair.f_Pair_first = a; B_dData_dPair.f_Pair_second = Core_dTerm.C_Rig_Rig0 })) args)))

# 688 "Vuna/Compiler/Elab/Trait.vuna"
let rec v_elabConstraintDomains = (fun (mc0 : Elab_dTypes.t_DtClass B_dData_dList.t_List) (mc1 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc2 : Elab_dTypes.t_Ctx) (mc3 : (string, Frontend_dRast.t_Expr B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc4 : Base_dSource.t_Span) (mc5 : Elab_dTypes.t_Ec) -> (match mc3 with
  | B_dData_dList.C_List__x58__x58_ (dtb__274, dtb__275) -> (match dtb__274 with
  | { B_dData_dPair.f_Pair_first = dtb__276; B_dData_dPair.f_Pair_second = dtb__277 } -> (match ((Elab_dDict.v_findClass dtb__276) mc0) with
  | B_dData_dMaybe.C_Maybe_Nothing -> (((Base_dDiagnostics_dTc.v_tcErr1 mc4) (Base_dDiagnostics_dTc.C_TcErr_UnknownInterface (dtb__276))) dtb__276)
  | B_dData_dMaybe.C_Maybe_Just (dtb__278) -> (match ((Elab_dDict.v_dictArgKinds mc5) (Core_dTerm.C_Value_VNeutral ((Core_dTerm.C_Neutral_NGlobal ((Elab_dMeta.v_dictTypeName (Elab_dTypes.v_dtClassName dtb__278)), B_dData_dList.C_List_Nil))))) with
  | B_dData_dMaybe.C_Maybe_Nothing -> ((Base_dDiagnostics_dTc.v_tcErr0 mc4) Base_dDiagnostics_dTc.C_TcErr_ConstraintNotDict)
  | B_dData_dMaybe.C_Maybe_Just (dtb__279) -> ((fun _u -> (if ((B_dData_dList.v_length dtb__279) <> (B_dData_dList.v_length dtb__277)) then ((Base_dDiagnostics_dTc.v_tcErr0 mc4) Base_dDiagnostics_dTc.C_TcErr_ConstraintNotDict) else ((Base_dCommon.v_bind ((((((v_checkArgsAtKinds mc1) mc2) mc5) dtb__277) dtb__279) mc4)) (fun (q : (Core_dTerm.t_Term B_dData_dList.t_List, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match q with
  | { B_dData_dPair.f_Pair_first = dtb__280; B_dData_dPair.f_Pair_second = dtb__281 } -> ((Base_dCommon.v_bind ((((((v_elabConstraintDomains mc0) mc1) mc2) dtb__275) mc4) dtb__281)) (fun (r : (Core_dTerm.t_Term B_dData_dList.t_List, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match r with
  | { B_dData_dPair.f_Pair_first = dtb__282; B_dData_dPair.f_Pair_second = dtb__283 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ (((v_ctorResultType dtb__278) dtb__280), dtb__282)); B_dData_dPair.f_Pair_second = dtb__283 }))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
))))) (if (dtp_debug_on 0) then (dtp_debug_line (String.concat "" ["constraint-dom: "; dtb__276; " args="; (bi_strFromInt (B_dData_dList.v_length dtb__277)); " kinds="; (bi_strFromInt (B_dData_dList.v_length dtb__279))])) else 0))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = mc5 }))
  | _ -> failwith "DT: impossible branch"
))

# 96 "Vuna/Compiler/Elab/Trait.vuna"
let v_elabTraitFinal = (fun (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ec : Elab_dTypes.t_Ec) (tname : string) (paramNames : string B_dData_dList.t_List) (superParts : (string, Frontend_dRast.t_Expr B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (methods : Frontend_dRast.t_TraitMethod B_dData_dList.t_List) (methodsP : (string, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (pKinds : Core_dTerm.t_Term B_dData_dList.t_List) (fieldTys : Core_dTerm.t_Term B_dData_dList.t_List) (sp : Base_dSource.t_Span) -> ((fun paramsKinds -> ((fun classCtx -> ((Base_dCommon.v_bind ((((((v_elabConstraintDomains (Elab_dTypes.v_ecClasses ec)) globals) classCtx) superParts) sp) ec)) (fun (pq : (Core_dTerm.t_Term B_dData_dList.t_List, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match pq with
  | { B_dData_dPair.f_Pair_first = dtb__284; B_dData_dPair.f_Pair_second = dtb__285 } -> ((fun nFields -> ((fun dname -> ((fun cname -> ((fun dapp -> ((fun ctorTy -> ((fun tele -> ((fun dd -> ((fun projs -> ((fun projSpans -> ((fun fieldCtx -> ((fun opaqueFields -> ((fun projBodies -> ((fun cls -> ((fun ec2 -> ((fun ec3 -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dd; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = projs; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = cls; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = projSpans; B_dData_dPair.f_Pair_second = ec3 } } } }))) ((v_foldlAddDef ec2) projBodies))) ((Elab_dTypes.v_ecAddClass ((Elab_dTypes.v_ecAddData dtb__285) dd)) cls))) { Elab_dTypes.f_DtClass_dtClassName = tname; Elab_dTypes.f_DtClass_dtClassParams = paramNames; Elab_dTypes.f_DtClass_dtClassSupers = dtb__284; Elab_dTypes.f_DtClass_dtClassMethods = projs; Elab_dTypes.f_DtClass_dtClassFieldTys = fieldTys; Elab_dTypes.f_DtClass_dtClassMethodSpans = projSpans })) ((((((v_projectionDefsOpaque opaqueFields) tname) (B_dData_dList.v_length paramNames)) methodsP) fieldTys) nFields))) ((B_dData_dList.v_map (fun (t : Core_dTerm.t_Term) -> (if (((Elab_dMeta.v_isOpaqueRuntimeTyIn dtb__285) fieldCtx) ((Core_dEval.v_eval (Elab_dTypes.v_ctxEnv fieldCtx)) t)) then true else (Elab_dMeta.v_valueHasImplicitPi ((Core_dEval.v_eval (Elab_dTypes.v_ctxEnv fieldCtx)) t))))) fieldTys))) ((v_bindClassParams paramsKinds) Elab_dTypes.v_emptyCtx))) ((B_dData_dList.v_map (fun (m : Frontend_dRast.t_TraitMethod) -> { B_dData_dPair.f_Pair_first = (Frontend_dRast.v_traitMethodName m); B_dData_dPair.f_Pair_second = (Frontend_dRast.v_traitMethodSpan m) })) methods))) (((((v_methodProjections tname) paramNames) pKinds) methodsP) fieldTys))) { Elab_dTypes.f_DtData_dtDataName = dname; Elab_dTypes.f_DtData_dtDataParams = tele; Elab_dTypes.f_DtData_dtDataCtors = (B_dData_dList.C_List__x58__x58_ ({ Elab_dTypes.f_DtCtor_dtCtorName = cname; Elab_dTypes.f_DtCtor_dtCtorFamily = dname; Elab_dTypes.f_DtCtor_dtCtorTelescope = tele; Elab_dTypes.f_DtCtor_dtCtorType = ctorTy; Elab_dTypes.f_DtCtor_dtCtorSpan = B_dData_dMaybe.C_Maybe_Nothing }, B_dData_dList.C_List_Nil)); Elab_dTypes.f_DtData_dtDataKind = ((v_foldParamPis paramsKinds) (Core_dTerm.C_Term_TType (Core_dTerm.v_levelZero))); Elab_dTypes.f_DtData_dtDataViaClasses = B_dData_dList.C_List_Nil; Elab_dTypes.f_DtData_dtDataLinear = false; Elab_dTypes.f_DtData_dtDataRepr = Frontend_dAst.C_ReprTier_ReprAuto; Elab_dTypes.f_DtData_dtDataFields = B_dData_dList.C_List_Nil; Elab_dTypes.f_DtData_dtDataIsRecord = false })) (Elab_dMeta.v_teleOfType ctorTy))) ((v_foldParamPis paramsKinds) ((v_foldPiFieldTys fieldTys) dapp)))) ((v_dictAppTermOf dname) paramNames))) (Elab_dMeta.v_dictCtorName tname))) (Elab_dMeta.v_dictTypeName tname))) (B_dData_dList.v_length fieldTys))
  | _ -> failwith "DT: impossible branch"
)))) ((v_bindClassParams paramsKinds) Elab_dTypes.v_emptyCtx))) ((B_dData_dList.v_zip paramNames) pKinds)))

# 87 "Vuna/Compiler/Elab/Trait.vuna"
let v_elabTraitKinds = (fun (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ec : Elab_dTypes.t_Ec) (tname : string) (params : Frontend_dRast.t_TraitParam B_dData_dList.t_List) (supers : Frontend_dRast.t_Expr B_dData_dList.t_List) (methods : Frontend_dRast.t_TraitMethod B_dData_dList.t_List) (methodsP : (string, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (pKinds : Core_dTerm.t_Term B_dData_dList.t_List) (sp : Base_dSource.t_Span) -> ((fun paramNames -> ((fun paramsKinds -> ((Base_dCommon.v_bind ((v_constraintPartsOf sp) supers)) (fun (superParts : (string, Frontend_dRast.t_Expr B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) -> ((Base_dCommon.v_bind ((((v_classFieldTys globals) ec) paramsKinds) methodsP)) (fun (p : (Core_dTerm.t_Term B_dData_dList.t_List, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> ((((((((((v_elabTraitFinal globals) (B_dData_dPair.v_secondOf p)) tname) paramNames) superParts) methods) methodsP) pKinds) (B_dData_dPair.v_firstOf p)) sp)))))) ((B_dData_dList.v_zip paramNames) pKinds))) (v_traitParamNames params)))

# 73 "Vuna/Compiler/Elab/Trait.vuna"
let v_elabTrait = (fun (mc0 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc1 : Elab_dTypes.t_Ec) (mc2 : (Frontend_dRast.t_Decl, Base_dSource.t_Span) B_dData_dPair.t_Pair) -> (match mc2 with
  | { B_dData_dPair.f_Pair_first = dtb__286; B_dData_dPair.f_Pair_second = dtb__287 } -> (match dtb__286 with
  | Frontend_dRast.C_Decl_DTrait (dtb__288, dtb__289, dtb__290, dtb__291, dtb__292) -> (if ((B_dData_dList.v_length dtb__289) = 0) then ((Base_dDiagnostics_dTc.v_tcErr0 dtb__292) Base_dDiagnostics_dTc.C_TcErr_InterfaceNoParam) else ((fun methodsP -> ((Base_dCommon.v_bind ((((v_traitParamKinds mc0) mc1) dtb__289) methodsP)) (fun (pk : (Core_dTerm.t_Term B_dData_dList.t_List, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (((((((((v_elabTraitKinds mc0) (B_dData_dPair.v_secondOf pk)) dtb__288) dtb__289) dtb__290) dtb__291) methodsP) (B_dData_dPair.v_firstOf pk)) dtb__292)))) (v_traitMethodPairs dtb__291)))
  | _ -> ((Elab_dTypes.v_errAt dtb__287) "DT: internal: expected a trait declaration")
)
  | _ -> failwith "DT: impossible branch"
))

# 498 "Vuna/Compiler/Elab/Trait.vuna"
let v_elabInstanceConstrained = (fun (classes : Elab_dTypes.t_DtClass B_dData_dList.t_List) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (defined : string B_dData_dList.t_List) (ec0 : Elab_dTypes.t_Ec) (sp : Base_dSource.t_Span) (cls : Elab_dTypes.t_DtClass) (argExprs : Frontend_dRast.t_Expr B_dData_dList.t_List) (ctxParts : (string, Frontend_dRast.t_Expr B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) -> ((fun ctxArgs -> ((fun banned -> ((fun combined -> ((fun kindMaybe -> (match kindMaybe with
  | B_dData_dMaybe.C_Maybe_Nothing -> ((Base_dDiagnostics_dTc.v_tcErr0 sp) Base_dDiagnostics_dTc.C_TcErr_InstanceHeadNotApp)
  | B_dData_dMaybe.C_Maybe_Just (dtb__293) -> (if ((B_dData_dList.v_length dtb__293) <> (B_dData_dList.v_length argExprs)) then ((Base_dDiagnostics_dTc.v_tcErr0 sp) Base_dDiagnostics_dTc.C_TcErr_InstanceHeadNotApp) else ((fun seeds -> ((fun init -> ((fun tele0 -> ((fun ec1 -> ((fun teleCtx0 -> ((Base_dCommon.v_bind ((((((v_checkArgsAtKinds globals) teleCtx0) ec1) argExprs) dtb__293) sp)) (fun (q : (Core_dTerm.t_Term B_dData_dList.t_List, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match q with
  | { B_dData_dPair.f_Pair_first = dtb__294; B_dData_dPair.f_Pair_second = dtb__295 } -> ((Base_dCommon.v_bind ((((((v_elabConstraintDomains classes) globals) teleCtx0) ctxParts) sp) dtb__295)) (fun (r : (Core_dTerm.t_Term B_dData_dList.t_List, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match r with
  | { B_dData_dPair.f_Pair_first = dtb__296; B_dData_dPair.f_Pair_second = dtb__297 } -> ((fun tele -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = { f_InstSigInfo_instSigClass = (Elab_dTypes.v_dtClassName cls); f_InstSigInfo_instSigTele = tele; f_InstSigInfo_instSigCtx = dtb__296; f_InstSigInfo_instSigArgs = dtb__294; f_InstSigInfo_instSigHead = ((v_ctorResultType cls) dtb__294) }; B_dData_dPair.f_Pair_second = dtb__297 }))) (((v_resolveTeleKinds combined) tele0) dtb__297))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))) (v_instanceTeleCtx tele0))) (B_dData_dPair.v_secondOf init))) (B_dData_dPair.v_firstOf init))) (((((v_instanceTeleMetas banned) combined) ((B_dData_dList.v_append argExprs) ctxArgs)) seeds) ec0))) ((B_dData_dList.v_append ((v_bareTeleSeeds argExprs) dtb__293)) (((v_ctxBareTeleSeeds classes) ec0) ctxParts))))
  | _ -> failwith "DT: impossible branch"
)) ((Elab_dDict.v_dictArgKinds ec0) (Core_dTerm.C_Value_VNeutral ((Core_dTerm.C_Neutral_NGlobal ((Elab_dMeta.v_dictTypeName (Elab_dTypes.v_dtClassName cls)), B_dData_dList.C_List_Nil))))))) (Frontend_dRast.C_Expr_EApp ((Frontend_dRast.C_Expr_EVar ((Frontend_dRast_dName.v_classifyName "#inst"), sp)), ((B_dData_dList.v_append argExprs) ctxArgs), sp)))) (Elab_dSig.v_topQuantBanned defined))) ((B_dData_dList.v_concatMap (fun (p : (string, Frontend_dRast.t_Expr B_dData_dList.t_List) B_dData_dPair.t_Pair) -> (B_dData_dPair.v_secondOf p))) ctxParts)))

# 467 "Vuna/Compiler/Elab/Trait.vuna"
let v_elabInstanceSig = (fun (classes : Elab_dTypes.t_DtClass B_dData_dList.t_List) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (defined : string B_dData_dList.t_List) (ec0 : Elab_dTypes.t_Ec) (sp : Base_dSource.t_Span) (headExpr : Frontend_dRast.t_Expr) (ctxE : Frontend_dRast.t_Expr B_dData_dList.t_List) -> (match (v_instanceHeadParts headExpr) with
  | B_dData_dMaybe.C_Maybe_Nothing -> ((Base_dDiagnostics_dTc.v_tcErr0 sp) Base_dDiagnostics_dTc.C_TcErr_InstanceHeadNotApp)
  | B_dData_dMaybe.C_Maybe_Just (dtb__298) -> (match ((Elab_dDict.v_findClass (B_dData_dPair.v_firstOf dtb__298)) classes) with
  | B_dData_dMaybe.C_Maybe_Nothing -> (((Base_dDiagnostics_dTc.v_tcErr1 sp) (Base_dDiagnostics_dTc.C_TcErr_UnknownInterface ((B_dData_dPair.v_firstOf dtb__298)))) (B_dData_dPair.v_firstOf dtb__298))
  | B_dData_dMaybe.C_Maybe_Just (dtb__299) -> (match (B_dData_dPair.v_secondOf dtb__298) with
  | dtb__300 -> (if ((B_dData_dList.v_length dtb__300) <> (B_dData_dList.v_length (dtb__299).Elab_dTypes.f_DtClass_dtClassParams)) then ((Base_dDiagnostics_dTc.v_tcErr0 sp) Base_dDiagnostics_dTc.C_TcErr_InstanceHeadNotApp) else ((Base_dCommon.v_bind ((v_constraintPartsOf sp) ctxE)) (fun (ctxParts : (string, Frontend_dRast.t_Expr B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) -> ((((((((v_elabInstanceConstrained classes) globals) defined) ec0) sp) dtb__299) dtb__300) ctxParts))))
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 869 "Vuna/Compiler/Elab/Trait.vuna"
let rec v_zipMethodFields = (fun (mc0 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc1 : Core_dTerm.t_Term B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__301, dtb__302) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__303, dtb__304) -> (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = (B_dData_dPair.v_firstOf dtb__301); B_dData_dPair.f_Pair_second = dtb__303 }, ((v_zipMethodFields dtb__302) dtb__304)))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 866 "Vuna/Compiler/Elab/Trait.vuna"
let v_zipClassFields = (fun (cls : Elab_dTypes.t_DtClass) -> ((v_zipMethodFields (cls).Elab_dTypes.f_DtClass_dtClassMethods) (cls).Elab_dTypes.f_DtClass_dtClassFieldTys))

# 926 "Vuna/Compiler/Elab/Trait.vuna"
let rec v_instArgAt = (fun (mc0 : int) (mc1 : Core_dTerm.t_Term B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__305, dtb__306) -> (if (mc0 <= 0) then dtb__305 else ((v_instArgAt (mc0 - 1)) dtb__306))
  | B_dData_dList.C_List_Nil -> (Core_dTerm.C_Term_TGlobal ("Int"))
  | _ -> failwith "DT: impossible branch"
))

# 881 "Vuna/Compiler/Elab/Trait.vuna"
let rec v_substInstParamsGo = (fun (mc0 : int) (mc1 : Core_dTerm.t_Term B_dData_dList.t_List) (mc2 : int) (mc3 : Core_dTerm.t_Term) -> (match mc3 with
  | Core_dTerm.C_Term_TIf (dtb__307, dtb__308, dtb__309) -> (Core_dTerm.C_Term_TIf (((((v_substInstParamsGo mc0) mc1) mc2) dtb__307), ((((v_substInstParamsGo mc0) mc1) mc2) dtb__308), ((((v_substInstParamsGo mc0) mc1) mc2) dtb__309)))
  | Core_dTerm.C_Term_TCase (dtb__310, dtb__311) -> (Core_dTerm.C_Term_TCase (((((v_substInstParamsGo mc0) mc1) mc2) dtb__310), ((B_dData_dList.v_map (fun (alt : Core_dTerm.t_CaseAlt) -> ((((v_substInstParamsAlt mc0) mc1) mc2) alt))) dtb__311)))
  | Core_dTerm.C_Term_TMk (dtb__312, dtb__313) -> (Core_dTerm.C_Term_TMk (dtb__312, ((B_dData_dList.v_map (fun (p : (Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair) -> { B_dData_dPair.f_Pair_first = ((((v_substInstParamsGo mc0) mc1) mc2) (B_dData_dPair.v_firstOf p)); B_dData_dPair.f_Pair_second = (B_dData_dPair.v_secondOf p) })) dtb__313)))
  | Core_dTerm.C_Term_TCon (dtb__314, dtb__315) -> (Core_dTerm.C_Term_TCon (dtb__314, ((B_dData_dList.v_map (fun (p : (Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair) -> { B_dData_dPair.f_Pair_first = ((((v_substInstParamsGo mc0) mc1) mc2) (B_dData_dPair.v_firstOf p)); B_dData_dPair.f_Pair_second = (B_dData_dPair.v_secondOf p) })) dtb__315)))
  | Core_dTerm.C_Term_TApp (dtb__316, dtb__317, dtb__318) -> (Core_dTerm.C_Term_TApp (((((v_substInstParamsGo mc0) mc1) mc2) dtb__316), ((((v_substInstParamsGo mc0) mc1) mc2) dtb__317), dtb__318))
  | Core_dTerm.C_Term_TLam (dtb__319, dtb__320, dtb__321, dtb__322, dtb__323) -> ((fun slot2 -> (Core_dTerm.C_Term_TLam (dtb__319, dtb__320, slot2, dtb__322, ((((v_substInstParamsGo mc0) mc1) (mc2 + 1)) dtb__323)))) ((fun nd_uscrut9 -> (match nd_uscrut9 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__324) -> (match dtb__324 with
  | { B_dData_dPair.f_Pair_first = dtb__325; B_dData_dPair.f_Pair_second = dtb__326 } -> ((Core_dTerm.v_lamTyOf (match dtb__325 with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb__327) -> (B_dData_dMaybe.C_Maybe_Just (((((v_substInstParamsGo mc0) mc1) mc2) dtb__327)))
  | _ -> failwith "DT: impossible branch"
)) (match dtb__326 with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb__328) -> (B_dData_dMaybe.C_Maybe_Just (((((v_substInstParamsGo mc0) mc1) (mc2 + 1)) dtb__328)))
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) dtb__321))
  | Core_dTerm.C_Term_TPi (dtb__329, dtb__330, dtb__331, dtb__332, dtb__333) -> (Core_dTerm.C_Term_TPi (dtb__329, dtb__330, dtb__331, ((((v_substInstParamsGo mc0) mc1) mc2) dtb__332), ((((v_substInstParamsGo mc0) mc1) (mc2 + 1)) dtb__333)))
  | Core_dTerm.C_Term_TVar (dtb__334, dtb__335, dtb__336) -> (if (dtb__335 >= mc2) then (if ((dtb__335 - mc2) < mc0) then (((Core_dTerm.v_shift 0) mc2) ((v_instArgAt ((mc0 - 1) - (dtb__335 - mc2))) mc1)) else mc3) else mc3)
  | _ -> mc3
))
# 922 "Vuna/Compiler/Elab/Trait.vuna"
and v_substInstParamsAlt = (fun (mc0 : int) (mc1 : Core_dTerm.t_Term B_dData_dList.t_List) (mc2 : int) (mc3 : Core_dTerm.t_CaseAlt) -> (match mc3 with
  | { Core_dTerm.f_CaseAlt_caseAltName = dtb__337; Core_dTerm.f_CaseAlt_caseAltBinders = dtb__338; Core_dTerm.f_CaseAlt_caseAltBody = dtb__339 } -> { Core_dTerm.f_CaseAlt_caseAltName = dtb__337; Core_dTerm.f_CaseAlt_caseAltBinders = dtb__338; Core_dTerm.f_CaseAlt_caseAltBody = ((((v_substInstParamsGo mc0) mc1) (mc2 + (B_dData_dList.v_length dtb__338))) dtb__339) }
  | _ -> failwith "DT: impossible branch"
))

# 878 "Vuna/Compiler/Elab/Trait.vuna"
let v_substInstParams = (fun (args : Core_dTerm.t_Term B_dData_dList.t_List) (t : Core_dTerm.t_Term) -> ((((v_substInstParamsGo (B_dData_dList.v_length args)) args) 0) t))

# 339 "Vuna/Compiler/Elab/Trait.vuna"
let rec v_checkSuperClasses = (fun (mc0 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc1 : Elab_dTypes.t_Ctx) (mc2 : int) (mc3 : string) (mc4 : Base_dSource.t_Span) (mc5 : Core_dTerm.t_Term B_dData_dList.t_List) (mc6 : Core_dTerm.t_Term B_dData_dList.t_List) (mc7 : Elab_dTypes.t_Ec) -> (match mc6 with
  | B_dData_dList.C_List__x58__x58_ (dtb__340, dtb__341) -> ((fun goal -> ((fun nd_uscrut12 -> (match nd_uscrut12 with
  | Base_dDiag.C_Check_OkC (dtb__342) -> (match dtb__342 with
  | { B_dData_dPair.f_Pair_first = dtb__343; B_dData_dPair.f_Pair_second = dtb__344 } -> ((((((((v_checkSuperClasses mc0) mc1) mc2) mc3) mc4) mc5) dtb__341) dtb__344)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dDiag.C_Check_ErrC (dtb__345) -> ((((Base_dDiagnostics_dTc.v_tcErr2 mc4) (Base_dDiagnostics_dTc.C_TcErr_SuperclassNotSatisfied (mc3, (Core_dEval.v_showValue goal)))) mc3) (Core_dEval.v_showValue goal))
  | _ -> failwith "DT: impossible branch"
)) (((((Elab_dDict.v_searchInstanceIn mc0) mc1) mc7) goal) mc4))) ((Elab_dTypes.v_evalCtx mc1) (((Core_dTerm.v_shift 0) mc2) ((v_substInstParams mc5) dtb__340))))
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (mc7))
  | _ -> failwith "DT: impossible branch"
))

# 951 "Vuna/Compiler/Elab/Trait.vuna"
let rec v_methodClausesGo = (fun (mc0 : string) (mc1 : Frontend_dRast.t_Decl B_dData_dList.t_List) (mc2 : (Frontend_dRast.t_Pat B_dData_dList.t_List, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__346, dtb__347) -> (match dtb__346 with
  | Frontend_dRast.C_Decl_DFun (dtb__348, dtb__349, dtb__350, dtb__351) -> (if ((v_sameMethodShort dtb__348) mc0) then (((v_methodClausesGo mc0) dtb__347) (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__349; B_dData_dPair.f_Pair_second = dtb__350 }, mc2))) else (((v_methodClausesGo mc0) dtb__347) mc2))
  | _ -> (((v_methodClausesGo mc0) dtb__347) mc2)
)
  | B_dData_dList.C_List_Nil -> (B_dData_dList.v_reverse mc2)
  | _ -> failwith "DT: impossible branch"
))

# 948 "Vuna/Compiler/Elab/Trait.vuna"
let v_methodClausesNamed = (fun (mname : string) (decls : Frontend_dRast.t_Decl B_dData_dList.t_List) -> (((v_methodClausesGo mname) decls) B_dData_dList.C_List_Nil))

# 1010 "Vuna/Compiler/Elab/Trait.vuna"
let v_ctxDictDomEqual = (fun (ec : Elab_dTypes.t_Ec) (a : Core_dTerm.t_Value) (b : Core_dTerm.t_Value) -> (match (((((Core_dConv.v_conv (Elab_dTypes.v_ecDefTbl ec)) (Elab_dTypes.v_ecSolsP ec)) 0) ((Elab_dTypes.v_forceVal ec) a)) ((Elab_dTypes.v_forceVal ec) b)) with
  | Base_dDiag.C_Check_OkC (dtb__352) -> true
  | Base_dDiag.C_Check_ErrC (dtb__353) -> false
  | _ -> failwith "DT: impossible branch"
))

# 1001 "Vuna/Compiler/Elab/Trait.vuna"
let rec v_matchCtxDictIdxGo = (fun (mc0 : Elab_dTypes.t_Ctx) (mc1 : int) (mc2 : Core_dTerm.t_Value) (mc3 : Elab_dTypes.t_Ec) (mc4 : int) (mc5 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc5 with
  | B_dData_dList.C_List__x58__x58_ (dtb__354, dtb__355) -> (if (mc4 >= mc1) then B_dData_dMaybe.C_Maybe_Nothing else (match dtb__354 with
  | { B_dData_dPair.f_Pair_first = dtb__356; B_dData_dPair.f_Pair_second = dtb__357 } -> (if (((v_ctxDictDomEqual mc3) (((Elab_dTypes.v_varTypeValue mc0) mc4) dtb__357)) mc2) then (B_dData_dMaybe.C_Maybe_Just (mc4)) else ((((((v_matchCtxDictIdxGo mc0) mc1) mc2) mc3) (mc4 + 1)) dtb__355))
  | _ -> failwith "DT: impossible branch"
))
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 998 "Vuna/Compiler/Elab/Trait.vuna"
let v_matchCtxDictIdx = (fun (ctx : Elab_dTypes.t_Ctx) (nCtx : int) (dom : Core_dTerm.t_Value) (ec : Elab_dTypes.t_Ec) -> ((((((v_matchCtxDictIdxGo ctx) nCtx) dom) ec) 0) (ctx).Elab_dTypes.f_Ctx_ctxItems))

# 982 "Vuna/Compiler/Elab/Trait.vuna"
let rec v_solveCtxGoalsGo = (fun (mc0 : Elab_dTypes.t_Ctx) (mc1 : int) (mc2 : Elab_dTypes.t_Ec) (mc3 : Elab_dTypes.t_Constraint B_dData_dList.t_List) (mc4 : Elab_dTypes.t_Constraint B_dData_dList.t_List) (mc5 : (int, int) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc3 with
  | B_dData_dList.C_List__x58__x58_ (dtb__358, dtb__359) -> (match dtb__358 with
  | { Elab_dTypes.f_Constraint_conId = dtb__360; Elab_dTypes.f_Constraint_conKind = dtb__361; Elab_dTypes.f_Constraint_conMeta = dtb__362; Elab_dTypes.f_Constraint_conDom = dtb__363; Elab_dTypes.f_Constraint_conSpan = dtb__364; Elab_dTypes.f_Constraint_conDepth = dtb__365 } -> (match ((Core_dTerm.v_metaLookup dtb__362) (Elab_dTypes.v_ecSolTbl mc2)) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__366) -> ((((((v_solveCtxGoalsGo mc0) mc1) mc2) dtb__359) mc4) mc5)
  | B_dData_dMaybe.C_Maybe_Nothing -> (match ((((v_matchCtxDictIdx mc0) mc1) dtb__363) mc2) with
  | B_dData_dMaybe.C_Maybe_Nothing -> ((((((v_solveCtxGoalsGo mc0) mc1) mc2) dtb__359) (B_dData_dList.C_List__x58__x58_ (dtb__358, mc4))) mc5)
  | B_dData_dMaybe.C_Maybe_Just (dtb__367) -> ((fun k -> (match ((((((Core_dConv.v_solveMeta (Elab_dTypes.v_ecDefTbl mc2)) (Elab_dTypes.v_ecSolsP mc2)) (Elab_dTypes.v_ctxDepth mc0)) dtb__362) B_dData_dList.C_List_Nil) (Core_dTerm.C_Value_VNeutral ((Core_dTerm.C_Neutral_NVar ((v_ctxDictName k), (((Elab_dTypes.v_ctxDepth mc0) - mc1) + k), B_dData_dList.C_List_Nil))))) with
  | Base_dDiag.C_Check_OkC (dtb__368) -> ((((((v_solveCtxGoalsGo mc0) mc1) ((Elab_dTypes.v_ecPutSols mc2) (Core_dTerm.v_solsList dtb__368))) dtb__359) mc4) (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__362; B_dData_dPair.f_Pair_second = k }, mc5)))
  | Base_dDiag.C_Check_ErrC (dtb__369) -> ((((((v_solveCtxGoalsGo mc0) mc1) mc2) dtb__359) mc4) mc5)
  | _ -> failwith "DT: impossible branch"
)) ((mc1 - 1) - dtb__367))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> { B_dData_dPair.f_Pair_first = (B_dData_dList.v_reverse mc5); B_dData_dPair.f_Pair_second = ((Elab_dTypes.v_ecPutPending mc2) (B_dData_dList.v_reverse mc4)) }
  | _ -> failwith "DT: impossible branch"
))

# 979 "Vuna/Compiler/Elab/Trait.vuna"
let v_solveCtxGoals = (fun (ctx : Elab_dTypes.t_Ctx) (nCtx : int) (nTele : int) (ec : Elab_dTypes.t_Ec) (acc : (int, int) B_dData_dPair.t_Pair B_dData_dList.t_List) -> ((((((v_solveCtxGoalsGo ctx) nCtx) ec) (Elab_dTypes.v_ecPending ec)) B_dData_dList.C_List_Nil) acc))

# 1019 "Vuna/Compiler/Elab/Trait.vuna"
let rec v_applyCtxSubstsTo = (fun (mc0 : int) (mc1 : (int, int) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc2 : Core_dTerm.t_Term) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__370, dtb__371) -> (match dtb__370 with
  | { B_dData_dPair.f_Pair_first = dtb__372; B_dData_dPair.f_Pair_second = dtb__373 } -> (((v_applyCtxSubstsTo mc0) dtb__371) ((((Core_dTerm.v_substMetaVar dtb__372) (v_ctxDictName dtb__373)) ((mc0 + dtb__373) + 1)) mc2))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> mc2
  | _ -> failwith "DT: impossible branch"
))

# 1029 "Vuna/Compiler/Elab/Trait.vuna"
let rec v_resolveRigidGoalsGo = (fun (mc0 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc1 : Elab_dTypes.t_Ctx) (mc2 : Base_dSource.t_Span) (mc3 : Elab_dTypes.t_Constraint B_dData_dList.t_List) (mc4 : Elab_dTypes.t_Constraint B_dData_dList.t_List) (mc5 : (int, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc6 : Elab_dTypes.t_Ec) -> (match mc3 with
  | B_dData_dList.C_List__x58__x58_ (dtb__374, dtb__375) -> (match dtb__374 with
  | { Elab_dTypes.f_Constraint_conId = dtb__376; Elab_dTypes.f_Constraint_conKind = dtb__377; Elab_dTypes.f_Constraint_conMeta = dtb__378; Elab_dTypes.f_Constraint_conDom = dtb__379; Elab_dTypes.f_Constraint_conSpan = dtb__380; Elab_dTypes.f_Constraint_conDepth = dtb__381 } -> (if ((Elab_dDict.v_isRigidDictArg mc6) dtb__379) then ((fun nd_uscrut16 -> (match nd_uscrut16 with
  | Base_dDiag.C_Check_OkC (dtb__382) -> (match dtb__382 with
  | { B_dData_dPair.f_Pair_first = dtb__383; B_dData_dPair.f_Pair_second = dtb__384 } -> (match ((((((Core_dConv.v_solveMeta (Elab_dTypes.v_ecDefTbl dtb__384)) (Elab_dTypes.v_ecSolsP dtb__384)) (Elab_dTypes.v_ctxDepth mc1)) dtb__378) B_dData_dList.C_List_Nil) ((Core_dEval.v_eval (Elab_dTypes.v_ctxEnv mc1)) dtb__383)) with
  | Base_dDiag.C_Check_OkC (dtb__385) -> (((((((v_resolveRigidGoalsGo mc0) mc1) mc2) dtb__375) mc4) (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__378; B_dData_dPair.f_Pair_second = dtb__383 }, mc5))) ((Elab_dTypes.v_ecPutSols dtb__384) (Core_dTerm.v_solsList dtb__385)))
  | Base_dDiag.C_Check_ErrC (dtb__386) -> (((((((v_resolveRigidGoalsGo mc0) mc1) mc2) dtb__375) (B_dData_dList.C_List__x58__x58_ (dtb__374, mc4))) mc5) dtb__384)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dDiag.C_Check_ErrC (dtb__387) -> (((Base_dDiagnostics_dTc.v_tcErr1 mc2) (Base_dDiagnostics_dTc.C_TcErr_InstanceContextMissing ((Core_dEval.v_showValue dtb__379)))) (Core_dEval.v_showValue dtb__379))
  | _ -> failwith "DT: impossible branch"
)) (((((Elab_dDict.v_searchInstanceIn mc0) mc1) mc6) dtb__379) mc2)) else (((((((v_resolveRigidGoalsGo mc0) mc1) mc2) dtb__375) (B_dData_dList.C_List__x58__x58_ (dtb__374, mc4))) mc5) mc6))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.v_reverse mc5); B_dData_dPair.f_Pair_second = ((Elab_dTypes.v_ecPutPending mc6) (B_dData_dList.v_reverse mc4)) }))
  | _ -> failwith "DT: impossible branch"
))

# 1026 "Vuna/Compiler/Elab/Trait.vuna"
let v_resolveRigidGoals = (fun (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (sp : Base_dSource.t_Span) (goals : Elab_dTypes.t_Constraint B_dData_dList.t_List) (acc : (int, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ec : Elab_dTypes.t_Ec) -> (((((((v_resolveRigidGoalsGo globals) ctx) sp) goals) B_dData_dList.C_List_Nil) acc) ec))

# 1055 "Vuna/Compiler/Elab/Trait.vuna"
let rec v_substMetaTermGo = (fun (mc0 : int) (mc1 : Core_dTerm.t_Term) (mc2 : int) (mc3 : Core_dTerm.t_Term) -> (match mc3 with
  | Core_dTerm.C_Term_TIf (dtb__388, dtb__389, dtb__390) -> (Core_dTerm.C_Term_TIf (((((v_substMetaTermGo mc0) mc1) mc2) dtb__388), ((((v_substMetaTermGo mc0) mc1) mc2) dtb__389), ((((v_substMetaTermGo mc0) mc1) mc2) dtb__390)))
  | Core_dTerm.C_Term_TCase (dtb__391, dtb__392) -> (Core_dTerm.C_Term_TCase (((((v_substMetaTermGo mc0) mc1) mc2) dtb__391), ((B_dData_dList.v_map (fun (alt : Core_dTerm.t_CaseAlt) -> ((((v_substMetaTermAlt mc0) mc1) mc2) alt))) dtb__392)))
  | Core_dTerm.C_Term_TRecord (dtb__393, dtb__394) -> (Core_dTerm.C_Term_TRecord (dtb__393, ((B_dData_dList.v_map (fun (p : (Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair) -> { B_dData_dPair.f_Pair_first = ((((v_substMetaTermGo mc0) mc1) mc2) (B_dData_dPair.v_firstOf p)); B_dData_dPair.f_Pair_second = (B_dData_dPair.v_secondOf p) })) dtb__394)))
  | Core_dTerm.C_Term_TMk (dtb__395, dtb__396) -> (Core_dTerm.C_Term_TMk (dtb__395, ((B_dData_dList.v_map (fun (p : (Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair) -> { B_dData_dPair.f_Pair_first = ((((v_substMetaTermGo mc0) mc1) mc2) (B_dData_dPair.v_firstOf p)); B_dData_dPair.f_Pair_second = (B_dData_dPair.v_secondOf p) })) dtb__396)))
  | Core_dTerm.C_Term_TCon (dtb__397, dtb__398) -> (Core_dTerm.C_Term_TCon (dtb__397, ((B_dData_dList.v_map (fun (p : (Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair) -> { B_dData_dPair.f_Pair_first = ((((v_substMetaTermGo mc0) mc1) mc2) (B_dData_dPair.v_firstOf p)); B_dData_dPair.f_Pair_second = (B_dData_dPair.v_secondOf p) })) dtb__398)))
  | Core_dTerm.C_Term_TApp (dtb__399, dtb__400, dtb__401) -> (Core_dTerm.C_Term_TApp (((((v_substMetaTermGo mc0) mc1) mc2) dtb__399), ((((v_substMetaTermGo mc0) mc1) mc2) dtb__400), dtb__401))
  | Core_dTerm.C_Term_TLam (dtb__402, dtb__403, dtb__404, dtb__405, dtb__406) -> ((fun slot2 -> (Core_dTerm.C_Term_TLam (dtb__402, dtb__403, slot2, dtb__405, ((((v_substMetaTermGo mc0) mc1) (mc2 + 1)) dtb__406)))) ((fun nd_uscrut9 -> (match nd_uscrut9 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__407) -> (match dtb__407 with
  | { B_dData_dPair.f_Pair_first = dtb__408; B_dData_dPair.f_Pair_second = dtb__409 } -> ((Core_dTerm.v_lamTyOf (match dtb__408 with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb__410) -> (B_dData_dMaybe.C_Maybe_Just (((((v_substMetaTermGo mc0) mc1) mc2) dtb__410)))
  | _ -> failwith "DT: impossible branch"
)) (match dtb__409 with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb__411) -> (B_dData_dMaybe.C_Maybe_Just (((((v_substMetaTermGo mc0) mc1) (mc2 + 1)) dtb__411)))
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) dtb__404))
  | Core_dTerm.C_Term_TPi (dtb__412, dtb__413, dtb__414, dtb__415, dtb__416) -> (Core_dTerm.C_Term_TPi (dtb__412, dtb__413, dtb__414, ((((v_substMetaTermGo mc0) mc1) mc2) dtb__415), ((((v_substMetaTermGo mc0) mc1) (mc2 + 1)) dtb__416)))
  | Core_dTerm.C_Term_TMeta (dtb__417) -> (if (dtb__417 = mc0) then (((Core_dTerm.v_shift 0) mc2) mc1) else mc3)
  | _ -> mc3
))
# 1092 "Vuna/Compiler/Elab/Trait.vuna"
and v_substMetaTermAlt = (fun (mc0 : int) (mc1 : Core_dTerm.t_Term) (mc2 : int) (mc3 : Core_dTerm.t_CaseAlt) -> (match mc3 with
  | { Core_dTerm.f_CaseAlt_caseAltName = dtb__418; Core_dTerm.f_CaseAlt_caseAltBinders = dtb__419; Core_dTerm.f_CaseAlt_caseAltBody = dtb__420 } -> { Core_dTerm.f_CaseAlt_caseAltName = dtb__418; Core_dTerm.f_CaseAlt_caseAltBinders = dtb__419; Core_dTerm.f_CaseAlt_caseAltBody = ((((v_substMetaTermGo mc0) mc1) (mc2 + (B_dData_dList.v_length dtb__419))) dtb__420) }
  | _ -> failwith "DT: impossible branch"
))

# 1052 "Vuna/Compiler/Elab/Trait.vuna"
let v_substMetaTerm = (fun (m : int) (rep : Core_dTerm.t_Term) (t : Core_dTerm.t_Term) -> ((((v_substMetaTermGo m) rep) 0) t))

# 1047 "Vuna/Compiler/Elab/Trait.vuna"
let rec v_applyTermSubstsTo = (fun (mc0 : int) (mc1 : (int, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc2 : Core_dTerm.t_Term) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__421, dtb__422) -> (match dtb__421 with
  | { B_dData_dPair.f_Pair_first = dtb__423; B_dData_dPair.f_Pair_second = dtb__424 } -> (((v_applyTermSubstsTo mc0) dtb__422) (((v_substMetaTerm dtb__423) dtb__424) mc2))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> mc2
  | _ -> failwith "DT: impossible branch"
))

# 1096 "Vuna/Compiler/Elab/Trait.vuna"
let v_clauseSpanOf = (fun (mc0 : (Frontend_dRast.t_Pat B_dData_dList.t_List, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__425, dtb__426) -> (Frontend_dRast.v_exprSpan (B_dData_dPair.v_secondOf dtb__425))
  | B_dData_dList.C_List_Nil -> { Base_dSource.f_Span_spanFile = ""; Base_dSource.f_Span_spanStartLine = 0; Base_dSource.f_Span_spanStartCol = 0; Base_dSource.f_Span_spanEndLine = 0; Base_dSource.f_Span_spanEndCol = 0; Base_dSource.f_Span_spanStartOffset = 0; Base_dSource.f_Span_spanEndOffset = 0 }
  | _ -> failwith "DT: impossible branch"
))

# 1140 "Vuna/Compiler/Elab/Trait.vuna"
let v_domainsEqual = (fun (ec : Elab_dTypes.t_Ec) (a : Core_dTerm.t_Value) (b : Core_dTerm.t_Value) -> (match (((((Core_dConv.v_conv (Elab_dTypes.v_ecDefTbl ec)) (Elab_dTypes.v_ecSolsP ec)) 0) a) b) with
  | Base_dDiag.C_Check_OkC (dtb__427) -> true
  | Base_dDiag.C_Check_ErrC (dtb__428) -> false
  | _ -> failwith "DT: impossible branch"
))

# 1132 "Vuna/Compiler/Elab/Trait.vuna"
let rec v_addDictGoalGroup = (fun (mc0 : Elab_dTypes.t_Ec) (mc1 : int) (mc2 : Core_dTerm.t_Value) (mc3 : t_DictGoalGroup B_dData_dList.t_List) -> (match mc3 with
  | B_dData_dList.C_List__x58__x58_ (dtb__429, dtb__430) -> (match dtb__429 with
  | { f_DictGoalGroup_dictGoalGroupRep = dtb__431; f_DictGoalGroup_dictGoalGroupDom = dtb__432; f_DictGoalGroup_dictGoalGroupExtras = dtb__433 } -> (if (((v_domainsEqual mc0) dtb__432) mc2) then (B_dData_dList.C_List__x58__x58_ ({ f_DictGoalGroup_dictGoalGroupRep = dtb__431; f_DictGoalGroup_dictGoalGroupDom = dtb__432; f_DictGoalGroup_dictGoalGroupExtras = (B_dData_dList.C_List__x58__x58_ (mc1, dtb__433)) }, dtb__430)) else (B_dData_dList.C_List__x58__x58_ ({ f_DictGoalGroup_dictGoalGroupRep = dtb__431; f_DictGoalGroup_dictGoalGroupDom = dtb__432; f_DictGoalGroup_dictGoalGroupExtras = dtb__433 }, ((((v_addDictGoalGroup mc0) mc1) mc2) dtb__430))))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (B_dData_dList.C_List__x58__x58_ ({ f_DictGoalGroup_dictGoalGroupRep = mc1; f_DictGoalGroup_dictGoalGroupDom = mc2; f_DictGoalGroup_dictGoalGroupExtras = B_dData_dList.C_List_Nil }, B_dData_dList.C_List_Nil))
  | _ -> failwith "DT: impossible branch"
))

# 1117 "Vuna/Compiler/Elab/Trait.vuna"
let rec v_freeDictGoalsGo = (fun (mc0 : Elab_dTypes.t_Ec) (mc1 : Elab_dTypes.t_Constraint B_dData_dList.t_List) (mc2 : t_DictGoalGroup B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__434, dtb__435) -> (match dtb__434 with
  | { Elab_dTypes.f_Constraint_conId = dtb__436; Elab_dTypes.f_Constraint_conKind = dtb__437; Elab_dTypes.f_Constraint_conMeta = dtb__438; Elab_dTypes.f_Constraint_conDom = dtb__439; Elab_dTypes.f_Constraint_conSpan = dtb__440; Elab_dTypes.f_Constraint_conDepth = dtb__441 } -> (if ((Elab_dDict.v_isRigidDictArg mc0) dtb__439) then (match ((Core_dTerm.v_metaLookup dtb__438) (Elab_dTypes.v_ecSolTbl mc0)) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__442) -> (((v_freeDictGoalsGo mc0) dtb__435) mc2)
  | B_dData_dMaybe.C_Maybe_Nothing -> (((v_freeDictGoalsGo mc0) dtb__435) ((((v_addDictGoalGroup mc0) dtb__438) dtb__439) mc2))
  | _ -> failwith "DT: impossible branch"
) else (((v_freeDictGoalsGo mc0) dtb__435) mc2))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> mc2
  | _ -> failwith "DT: impossible branch"
))

# 1114 "Vuna/Compiler/Elab/Trait.vuna"
let v_freeDictGoals = (fun (ec : Elab_dTypes.t_Ec) -> (((v_freeDictGoalsGo ec) (Elab_dTypes.v_ecPending ec)) B_dData_dList.C_List_Nil))

# 1147 "Vuna/Compiler/Elab/Trait.vuna"
let rec v_leadingImplicitCount = (fun (mc0 : Core_dTerm.t_Term) -> (match mc0 with
  | Core_dTerm.C_Term_TPi (dtb__443, dtb__444, dtb__445, dtb__446, dtb__447) -> (if dtb__444 then (1 + (v_leadingImplicitCount dtb__447)) else 0)
  | _ -> 0
))

# 1154 "Vuna/Compiler/Elab/Trait.vuna"
let v_solveLiftedMeta = (fun (ec : Elab_dTypes.t_Ec) (name : string) (level : int) (m : int) -> (match ((((((Core_dConv.v_solveMeta (Elab_dTypes.v_ecDefTbl ec)) (Elab_dTypes.v_ecSolsP ec)) (level + 1)) m) B_dData_dList.C_List_Nil) (Core_dTerm.C_Value_VNeutral ((Core_dTerm.C_Neutral_NVar (name, level, B_dData_dList.C_List_Nil))))) with
  | Base_dDiag.C_Check_OkC (dtb__448) -> ((Elab_dTypes.v_ecPutSols ec) (Core_dTerm.v_solsList dtb__448))
  | Base_dDiag.C_Check_ErrC (dtb__449) -> ec
  | _ -> failwith "DT: impossible branch"
))

# 1206 "Vuna/Compiler/Elab/Trait.vuna"
let rec v_substExtraDictMetas = (fun (mc0 : string) (mc1 : int) (mc2 : int B_dData_dList.t_List) (mc3 : Core_dTerm.t_Term) -> (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__450, dtb__451) -> ((((v_substExtraDictMetas mc0) mc1) dtb__451) ((((Core_dTerm.v_substMetaVar dtb__450) mc0) mc1) mc3))
  | B_dData_dList.C_List_Nil -> mc3
  | _ -> failwith "DT: impossible branch"
))

# 1211 "Vuna/Compiler/Elab/Trait.vuna"
let rec v_solveLiftedMetas = (fun (mc0 : Elab_dTypes.t_Ec) (mc1 : string) (mc2 : int) (mc3 : int B_dData_dList.t_List) -> (match mc3 with
  | B_dData_dList.C_List__x58__x58_ (dtb__452, dtb__453) -> ((((v_solveLiftedMetas ((((v_solveLiftedMeta mc0) mc1) mc2) dtb__452)) mc1) mc2) dtb__453)
  | B_dData_dList.C_List_Nil -> mc0
  | _ -> failwith "DT: impossible branch"
))

# 1274 "Vuna/Compiler/Elab/Trait.vuna"
let v_insertArgAt = (fun (n : int) x xs -> ((B_dData_dList.v_append ((B_dData_dList.v_append ((B_dData_dList.v_take n) xs)) (B_dData_dList.C_List__x58__x58_ (x, B_dData_dList.C_List_Nil)))) ((B_dData_dList.v_drop n) xs)))

# 1225 "Vuna/Compiler/Elab/Trait.vuna"
let rec v_injectDictGoFuel = (fun (fuel : int) (defName : string) (dName : string) (appPos : int) (depth : int) (t : Core_dTerm.t_Term) -> (if (fuel <= 0) then t else (match t with
  | Core_dTerm.C_Term_TLam (dtb__454, dtb__455, dtb__456, dtb__457, dtb__458) -> ((fun slot2 -> (Core_dTerm.C_Term_TLam (dtb__454, dtb__455, slot2, dtb__457, ((((((v_injectDictGoFuel (fuel - 1)) defName) dName) appPos) (depth + 1)) dtb__458)))) ((fun nd_uscrut11 -> (match nd_uscrut11 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__459) -> (match dtb__459 with
  | { B_dData_dPair.f_Pair_first = dtb__460; B_dData_dPair.f_Pair_second = dtb__461 } -> ((Core_dTerm.v_lamTyOf ((Core_dTerm.v_mapTermMaybe (((((v_injectDictGoFuel (fuel - 1)) defName) dName) appPos) depth)) dtb__460)) ((Core_dTerm.v_mapTermMaybe (((((v_injectDictGoFuel (fuel - 1)) defName) dName) appPos) (depth + 1))) dtb__461))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) dtb__456))
  | Core_dTerm.C_Term_TPi (dtb__462, dtb__463, dtb__464, dtb__465, dtb__466) -> (Core_dTerm.C_Term_TPi (dtb__462, dtb__463, dtb__464, ((((((v_injectDictGoFuel (fuel - 1)) defName) dName) appPos) depth) dtb__465), ((((((v_injectDictGoFuel (fuel - 1)) defName) dName) appPos) (depth + 1)) dtb__466)))
  | Core_dTerm.C_Term_TApp (dtb__467, dtb__468, dtb__469) -> ((fun nd_uscrut9 -> (match nd_uscrut9 with
  | B_dData_dMaybe.C_Maybe_Nothing -> (Core_dTerm.C_Term_TApp (((((((v_injectDictGoFuel (fuel - 1)) defName) dName) appPos) depth) dtb__467), ((((((v_injectDictGoFuel (fuel - 1)) defName) dName) appPos) depth) dtb__468), dtb__469))
  | B_dData_dMaybe.C_Maybe_Just (dtb__470) -> (match dtb__470 with
  | { B_dData_dPair.f_Pair_first = dtb__471; B_dData_dPair.f_Pair_second = dtb__472 } -> (((((((v_rewriteTaggedSpineFuel (fuel - 1)) defName) dName) appPos) depth) dtb__471) dtb__472)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) (Elab_dTypes.v_flattenTaggedApp t))
  | Core_dTerm.C_Term_TCon (dtb__473, dtb__474) -> (Core_dTerm.C_Term_TCon (dtb__473, ((B_dData_dList.v_map (fun (p : (Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair) -> { B_dData_dPair.f_Pair_first = ((((((v_injectDictGoFuel (fuel - 1)) defName) dName) appPos) depth) (B_dData_dPair.v_firstOf p)); B_dData_dPair.f_Pair_second = (B_dData_dPair.v_secondOf p) })) dtb__474)))
  | Core_dTerm.C_Term_TMk (dtb__475, dtb__476) -> (Core_dTerm.C_Term_TMk (dtb__475, ((B_dData_dList.v_map (fun (p : (Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair) -> { B_dData_dPair.f_Pair_first = ((((((v_injectDictGoFuel (fuel - 1)) defName) dName) appPos) depth) (B_dData_dPair.v_firstOf p)); B_dData_dPair.f_Pair_second = (B_dData_dPair.v_secondOf p) })) dtb__476)))
  | Core_dTerm.C_Term_TRecord (dtb__477, dtb__478) -> (Core_dTerm.C_Term_TRecord (dtb__477, ((B_dData_dList.v_map (fun (p : (Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair) -> { B_dData_dPair.f_Pair_first = ((((((v_injectDictGoFuel (fuel - 1)) defName) dName) appPos) depth) (B_dData_dPair.v_firstOf p)); B_dData_dPair.f_Pair_second = (B_dData_dPair.v_secondOf p) })) dtb__478)))
  | Core_dTerm.C_Term_TCase (dtb__479, dtb__480) -> (Core_dTerm.C_Term_TCase (((((((v_injectDictGoFuel (fuel - 1)) defName) dName) appPos) depth) dtb__479), ((B_dData_dList.v_map (fun (alt : Core_dTerm.t_CaseAlt) -> ((((((v_injectAltGoFuel (fuel - 1)) defName) dName) appPos) depth) alt))) dtb__480)))
  | Core_dTerm.C_Term_TIf (dtb__481, dtb__482, dtb__483) -> (Core_dTerm.C_Term_TIf (((((((v_injectDictGoFuel (fuel - 1)) defName) dName) appPos) depth) dtb__481), ((((((v_injectDictGoFuel (fuel - 1)) defName) dName) appPos) depth) dtb__482), ((((((v_injectDictGoFuel (fuel - 1)) defName) dName) appPos) depth) dtb__483)))
  | _ -> t
)))
# 1253 "Vuna/Compiler/Elab/Trait.vuna"
and v_injectAltGoFuel = (fun (fuel : int) (defName : string) (dName : string) (appPos : int) (depth : int) (alt : Core_dTerm.t_CaseAlt) -> (if (fuel <= 0) then alt else (match alt with
  | { Core_dTerm.f_CaseAlt_caseAltName = dtb__484; Core_dTerm.f_CaseAlt_caseAltBinders = dtb__485; Core_dTerm.f_CaseAlt_caseAltBody = dtb__486 } -> { Core_dTerm.f_CaseAlt_caseAltName = dtb__484; Core_dTerm.f_CaseAlt_caseAltBinders = dtb__485; Core_dTerm.f_CaseAlt_caseAltBody = ((((((v_injectDictGoFuel (fuel - 1)) defName) dName) appPos) (depth + (B_dData_dList.v_length dtb__485))) dtb__486) }
  | _ -> failwith "DT: impossible branch"
)))
# 1265 "Vuna/Compiler/Elab/Trait.vuna"
and v_rewriteTaggedSpineFuel = (fun (fuel : int) (defName : string) (dName : string) (appPos : int) (depth : int) (g : string) (args : (Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (if (fuel <= 0) then (Core_dTerm.C_Term_TGlobal (g)) else ((fun args2 -> (if (if (if (g = defName) then ((B_dData_dList.v_length args2) > appPos) else false) then (depth > appPos) else false) then ((Elab_dMeta.v_foldAppTerms (Core_dTerm.C_Term_TGlobal (g))) (((v_insertArgAt appPos) { B_dData_dPair.f_Pair_first = (Core_dTerm.C_Term_TVar (dName, ((depth - appPos) - 1), { Base_dSource.f_Span_spanFile = ""; Base_dSource.f_Span_spanStartLine = 0; Base_dSource.f_Span_spanStartCol = 0; Base_dSource.f_Span_spanEndLine = 0; Base_dSource.f_Span_spanEndCol = 0; Base_dSource.f_Span_spanStartOffset = 0; Base_dSource.f_Span_spanEndOffset = 0 })); B_dData_dPair.f_Pair_second = Core_dTerm.C_Rig_RigOmega }) args2)) else ((Elab_dMeta.v_foldAppTerms (Core_dTerm.C_Term_TGlobal (g))) args2))) ((B_dData_dList.v_map (fun (p : (Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair) -> { B_dData_dPair.f_Pair_first = ((((((v_injectDictGoFuel (fuel - 1)) defName) dName) appPos) depth) (B_dData_dPair.v_firstOf p)); B_dData_dPair.f_Pair_second = (B_dData_dPair.v_secondOf p) })) args))))

# 1222 "Vuna/Compiler/Elab/Trait.vuna"
let v_injectDictGo = (fun (defName : string) (dName : string) (appPos : int) (depth : int) (t : Core_dTerm.t_Term) -> ((((((v_injectDictGoFuel 128) defName) dName) appPos) depth) t))

# 1219 "Vuna/Compiler/Elab/Trait.vuna"
let v_insertDictCalls = (fun (defName : string) (dName : string) (appPos : int) (t : Core_dTerm.t_Term) -> (((((v_injectDictGo defName) dName) appPos) 0) t))

# 1177 "Vuna/Compiler/Elab/Trait.vuna"
let rec v_liftFreeDictGoalsGo = (fun (defName : string) (ec : Elab_dTypes.t_Ec) (ty : Core_dTerm.t_Term) (body : Core_dTerm.t_Term) (baseIdx : int) (nGroups : int) (k : int) (groups : t_DictGoalGroup B_dData_dList.t_List) -> ((fun nd_uscrut8 -> (match nd_uscrut8 with
  | B_dData_dList.C_List__x58__x58_ (dtb__487, dtb__488) -> (match dtb__487 with
  | { f_DictGoalGroup_dictGoalGroupRep = dtb__489; f_DictGoalGroup_dictGoalGroupDom = dtb__490; f_DictGoalGroup_dictGoalGroupExtras = dtb__491 } -> ((fun dName -> ((fun finalPos -> ((fun dictDom -> ((fun ty2 -> ((fun body2 -> ((fun body3 -> ((fun body4 -> ((fun ec2 -> ((fun ec3 -> ((((((((v_liftFreeDictGoalsGo defName) ec3) ty2) body4) baseIdx) nGroups) (k + 1)) dtb__488)) ((((v_solveLiftedMetas ec2) dName) finalPos) dtb__491))) ((((v_solveLiftedMeta ec) dName) finalPos) dtb__489))) ((((v_substExtraDictMetas dName) (baseIdx + 2)) dtb__491) body3))) ((((v_insertDictCalls defName) dName) (baseIdx + 1)) body2))) ((((Core_dTerm.v_substMetaVar dtb__489) dName) (baseIdx + 2)) (((Core_dTerm.v_insertLamBinder dName) baseIdx) body)))) ((((Core_dTerm.v_insertDictBinder dName) baseIdx) dictDom) ty))) (((Core_dEval.v_substSolvedMetasAtTbl (Elab_dTypes.v_ecSolTbl ec)) (baseIdx + 1)) ((Core_dEval.v_quote (baseIdx + 1)) dtb__490)))) ((baseIdx + 1) + ((nGroups - 1) - k)))) ("d" ^ (bi_strFromInt dtb__489)))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> { B_dData_dPair.f_Pair_first = ty; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = body; B_dData_dPair.f_Pair_second = ec } }
  | _ -> failwith "DT: impossible branch"
)) groups))

# 1161 "Vuna/Compiler/Elab/Trait.vuna"
let v_liftFreeDictGoals = (fun (defName : string) (ec : Elab_dTypes.t_Ec) (ty : Core_dTerm.t_Term) (body : Core_dTerm.t_Term) -> (match (Elab_dTypes.v_ecPending ec) with
  | B_dData_dList.C_List_Nil -> { B_dData_dPair.f_Pair_first = ty; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = body; B_dData_dPair.f_Pair_second = ec } }
  | _ -> ((fun groups -> ((fun nGroups -> ((fun baseIdx -> ((((((((v_liftFreeDictGoalsGo defName) ec) ty) body) baseIdx) nGroups) 0) groups)) ((Elab_dMeta.v_maxInt 0) ((v_leadingImplicitCount ty) - 1)))) (B_dData_dList.v_length groups))) (v_freeDictGoals ec))
))

# 1250 "Vuna/Compiler/Elab/Trait.vuna"
let v_injectAltGo = (fun (defName : string) (dName : string) (appPos : int) (depth : int) (alt : Core_dTerm.t_CaseAlt) -> ((((((v_injectAltGoFuel 128) defName) dName) appPos) depth) alt))

# 1261 "Vuna/Compiler/Elab/Trait.vuna"
let v_rewriteTaggedSpine = (fun (defName : string) (dName : string) (appPos : int) (depth : int) (g : string) (args : (Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (((((((v_rewriteTaggedSpineFuel 128) defName) dName) appPos) depth) g) args))

# 1278 "Vuna/Compiler/Elab/Trait.vuna"
let rec v_replaceGlobalType = (fun (mc0 : string) (mc1 : Core_dTerm.t_Term) (mc2 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__492, dtb__493) -> (if ((B_dData_dPair.v_firstOf dtb__492) = mc0) then (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = mc0; B_dData_dPair.f_Pair_second = mc1 }, dtb__493)) else (B_dData_dList.C_List__x58__x58_ (dtb__492, (((v_replaceGlobalType mc0) mc1) dtb__493))))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 1284 "Vuna/Compiler/Elab/Trait.vuna"
let rec v_foldlAddInst = (fun (mc0 : Elab_dTypes.t_Ec) (mc1 : Elab_dTypes.t_DtInst B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__494, dtb__495) -> ((v_foldlAddInst ((Elab_dTypes.v_ecAddInst mc0) dtb__494)) dtb__495)
  | B_dData_dList.C_List_Nil -> mc0
  | _ -> failwith "DT: impossible branch"
))

# 1295 "Vuna/Compiler/Elab/Trait.vuna"
let rec v_checkInstanceHeadsGo = (fun (mc0 : (Frontend_dRast.t_Decl, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc1 : Elab_dTypes.t_DtClass B_dData_dList.t_List) (mc2 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc3 : Elab_dTypes.t_Ec) (mc4 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc5 : Elab_dTypes.t_DtInst B_dData_dList.t_List) (mc6 : Elab_dTypes.t_DtInst B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__496, dtb__497) -> (match dtb__496 with
  | { B_dData_dPair.f_Pair_first = dtb__498; B_dData_dPair.f_Pair_second = dtb__499 } -> (match dtb__498 with
  | Frontend_dRast.C_Decl_DInstance (dtb__500, dtb__501, dtb__502, dtb__503) -> ((Base_dCommon.v_bind (((((((v_elabInstanceSig mc1) mc2) (Elab_dSig.v_definedNames ((B_dData_dList.v_map B_dData_dPair.v_firstOf) (B_dData_dList.C_List__x58__x58_ (dtb__496, dtb__497))))) mc3) dtb__503) dtb__501) dtb__500)) (fun (p : (t_InstSigInfo, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match p with
  | { B_dData_dPair.f_Pair_first = dtb__504; B_dData_dPair.f_Pair_second = dtb__505 } -> ((fun iname -> ((fun ty -> ((fun inst -> ((fun nd_uscrut26 -> (match nd_uscrut26 with
  | { B_dData_dPair.f_Pair_first = dtb__506; B_dData_dPair.f_Pair_second = dtb__507 } -> (match dtb__506 with
  | B_dData_dMaybe.C_Maybe_Nothing -> (((((((v_checkInstanceHeadsGo dtb__497) mc1) mc2) dtb__507) (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = iname; B_dData_dPair.f_Pair_second = ty }, mc4))) (B_dData_dList.C_List__x58__x58_ (inst, mc5))) (B_dData_dList.C_List__x58__x58_ (inst, mc6)))
  | B_dData_dMaybe.C_Maybe_Just (dtb__508) -> (match dtb__508 with
  | Elab_dInstCoherence.C_InstClash_ClashOverlap -> (((Base_dDiagnostics_dTc.v_tcErr1 dtb__503) (Base_dDiagnostics_dTc.C_TcErr_OverlappingInstances (iname))) iname)
  | Elab_dInstCoherence.C_InstClash_ClashDuplicate -> (((Base_dDiagnostics_dTc.v_tcErr1 dtb__503) (Base_dDiagnostics_dTc.C_TcErr_DuplicateInstance (iname))) iname)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) (((((Elab_dInstCoherence.v_findInstanceClash dtb__505) iname) (v_instSigTele dtb__504)) (v_instSigHead dtb__504)) ((B_dData_dList.v_append (Elab_dTypes.v_ecInsts dtb__505)) mc6)))) { Elab_dTypes.f_DtInst_dtInstName = iname; Elab_dTypes.f_DtInst_dtInstTele = (v_instSigTele dtb__504); Elab_dTypes.f_DtInst_dtInstCtx = (v_instSigCtx dtb__504); Elab_dTypes.f_DtInst_dtInstHead = (v_instSigHead dtb__504); Elab_dTypes.f_DtInst_dtInstSpan = (B_dData_dMaybe.C_Maybe_Just (dtb__503)) })) (v_instTypeOf dtb__504))) ((Elab_dInstName.v_instanceName (v_instSigClass dtb__504)) dtb__501))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> (((((((v_checkInstanceHeadsGo dtb__497) mc1) mc2) mc3) mc4) mc5) mc6)
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.v_reverse mc4); B_dData_dPair.f_Pair_second = ((v_foldlAddInst mc3) (B_dData_dList.v_reverse mc5)) }))
  | _ -> failwith "DT: impossible branch"
))

# 1292 "Vuna/Compiler/Elab/Trait.vuna"
let v_checkInstanceHeads = (fun (decls : (Frontend_dRast.t_Decl, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List) (classes : Elab_dTypes.t_DtClass B_dData_dList.t_List) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ec : Elab_dTypes.t_Ec) -> (((((((v_checkInstanceHeadsGo decls) classes) globals) ec) B_dData_dList.C_List_Nil) B_dData_dList.C_List_Nil) B_dData_dList.C_List_Nil))

# 1368 "Vuna/Compiler/Elab/Trait.vuna"
let v_defBodyOf = (fun (defs : (string, Core_dTerm.t_Term) B_dContainer_dHashMap.t_HashMap) (name : string) -> (match ((Core_dTerm.v_defLookup name) defs) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__509) -> dtb__509
  | B_dData_dMaybe.C_Maybe_Nothing -> (Core_dTerm.C_Term_TInt (0))
  | _ -> failwith "DT: impossible branch"
))

# 1378 "Vuna/Compiler/Elab/Trait.vuna"
let rec v_elabTraitsGo = (fun (mc0 : (Frontend_dRast.t_Decl, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc1 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc2 : Elab_dTypes.t_Ec) (mc3 : Elab_dTypes.t_DtData B_dData_dList.t_List) (mc4 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc5 : Elab_dTypes.t_DtClass B_dData_dList.t_List) (mc6 : (string, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__510, dtb__511) -> ((Base_dCommon.v_bind (((v_elabTrait mc1) mc2) dtb__510)) (fun (p : (Elab_dTypes.t_DtData, ((string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List, (Elab_dTypes.t_DtClass, ((string, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> ((fun nd_uscrut11 -> (match nd_uscrut11 with
  | { B_dData_dPair.f_Pair_first = dtb__512; B_dData_dPair.f_Pair_second = dtb__513 } -> (match dtb__513 with
  | { B_dData_dPair.f_Pair_first = dtb__514; B_dData_dPair.f_Pair_second = dtb__515 } -> (match dtb__515 with
  | { B_dData_dPair.f_Pair_first = dtb__516; B_dData_dPair.f_Pair_second = dtb__517 } -> (match dtb__517 with
  | { B_dData_dPair.f_Pair_first = dtb__518; B_dData_dPair.f_Pair_second = dtb__519 } -> (((((((v_elabTraitsGo dtb__511) ((B_dData_dList.v_append mc1) dtb__514)) dtb__519) (B_dData_dList.C_List__x58__x58_ (dtb__512, mc3))) ((B_dData_dList.v_append dtb__514) mc4)) (B_dData_dList.C_List__x58__x58_ (dtb__516, mc5))) ((B_dData_dList.v_append dtb__518) mc6))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) p)))
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.v_reverse mc3); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = (B_dData_dList.v_reverse mc4); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = (B_dData_dList.v_reverse mc5); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = (B_dData_dList.v_reverse mc6); B_dData_dPair.f_Pair_second = mc2 } } } }))
  | _ -> failwith "DT: impossible branch"
))

# 1375 "Vuna/Compiler/Elab/Trait.vuna"
let v_elabTraits = (fun (decls : (Frontend_dRast.t_Decl, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ec : Elab_dTypes.t_Ec) -> (((((((v_elabTraitsGo decls) globals) ec) B_dData_dList.C_List_Nil) B_dData_dList.C_List_Nil) B_dData_dList.C_List_Nil) B_dData_dList.C_List_Nil))

# 1423 "Vuna/Compiler/Elab/Trait.vuna"
let rec v_spanOfName = (fun (mc0 : string) (mc1 : (string, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__520, dtb__521) -> (match dtb__520 with
  | { B_dData_dPair.f_Pair_first = dtb__522; B_dData_dPair.f_Pair_second = dtb__523 } -> (if (dtb__522 = mc0) then (B_dData_dMaybe.C_Maybe_Just (dtb__523)) else ((v_spanOfName mc0) dtb__521))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 1427 "Vuna/Compiler/Elab/Trait.vuna"
let v_defTypeOrDefaultTbl = (fun (tbl : (string, Core_dTerm.t_Term) B_dContainer_dHashMap.t_HashMap) (name : string) -> (match ((((B_dContainer_dHashMap.v_lookup B_dData_dString.v_Hashable_uString) B_dData_dString.v_Eq_uString) name) tbl) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__524) -> dtb__524
  | B_dData_dMaybe.C_Maybe_Nothing -> (Core_dTerm.C_Term_TGlobal ("Int"))
  | _ -> failwith "DT: impossible branch"
))

# 1362 "Vuna/Compiler/Elab/Trait.vuna"
let v_instanceDefsOf = (fun (ecBefore : Elab_dTypes.t_Ec) (ecAfter : Elab_dTypes.t_Ec) (srcSpan : Base_dSource.t_Span B_dData_dMaybe.t_Maybe) (gs : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) -> ((B_dData_dList.v_map (fun (g : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair) -> (Elab_dTypes.C_DtDef_DtDef ((B_dData_dPair.v_firstOf g), ((v_defTypeOrDefaultTbl ((B_dContainer_dHashMap.v_fromList B_dData_dString.v_Hashable_uString) gs)) (B_dData_dPair.v_firstOf g)), ((Elab_dDict.v_substDictTerm ecAfter) ((v_defBodyOf (Elab_dTypes.v_ecDefTbl ecAfter)) (B_dData_dPair.v_firstOf g))), srcSpan)))) gs))

# 1410 "Vuna/Compiler/Elab/Trait.vuna"
let rec v_extraDefsGo = (fun (mc0 : (string, Core_dTerm.t_Term) B_dContainer_dHashMap.t_HashMap) (mc1 : (string, bool) B_dContainer_dHashMap.t_HashMap) (mc2 : (string, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc3 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc4 : Elab_dTypes.t_DtDef B_dData_dList.t_List) -> (match mc3 with
  | B_dData_dList.C_List__x58__x58_ (dtb__525, dtb__526) -> (if ((((B_dContainer_dHashMap.v_member B_dData_dString.v_Hashable_uString) B_dData_dString.v_Eq_uString) (B_dData_dPair.v_firstOf dtb__525)) mc1) then (((((v_extraDefsGo mc0) mc1) mc2) dtb__526) mc4) else (((((v_extraDefsGo mc0) mc1) mc2) dtb__526) (B_dData_dList.C_List__x58__x58_ ((Elab_dTypes.C_DtDef_DtDef ((B_dData_dPair.v_firstOf dtb__525), ((v_defTypeOrDefaultTbl mc0) (B_dData_dPair.v_firstOf dtb__525)), (B_dData_dPair.v_secondOf dtb__525), ((v_spanOfName (B_dData_dPair.v_firstOf dtb__525)) mc2))), mc4))))
  | B_dData_dList.C_List_Nil -> (B_dData_dList.v_reverse mc4)
  | _ -> failwith "DT: impossible branch"
))

# 1406 "Vuna/Compiler/Elab/Trait.vuna"
let v_extraDefsOf = (fun (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ec : Elab_dTypes.t_Ec) (srcSpans : (string, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List) (sourceDefs : Elab_dTypes.t_DtDef B_dData_dList.t_List) -> (((((v_extraDefsGo (Elab_dTypes.v_ecGlobalsTbl ec)) (B_dContainer_dHashMap.v_ofNames ((B_dData_dList.v_map Elab_dTypes.v_dtDefName) sourceDefs))) srcSpans) (Elab_dTypes.v_ecDefs ec)) B_dData_dList.C_List_Nil))

# 1443 "Vuna/Compiler/Elab/Trait.vuna"
let rec v_checkBindersFuel = (fun (mc0 : int) (mc1 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc2 : Elab_dTypes.t_Ctx) (mc3 : Elab_dTypes.t_Ec) (mc4 : Frontend_dRast.t_Pat B_dData_dList.t_List) (mc5 : Frontend_dRast.t_Expr) (mc6 : Core_dTerm.t_Value) (mc7 : Base_dSource.t_Span) -> (match mc4 with
  | B_dData_dList.C_List__x58__x58_ (dtb__527, dtb__528) -> (if (mc0 <= 0) then (Base_dDiag.v_icFuel "binder check") else ((fun forced -> (match forced with
  | Core_dTerm.C_Value_VPi (dtb__529, dtb__530, dtb__531, dtb__532, dtb__533) -> (if dtb__530 then (if ((Elab_dDict.v_isDictDomain mc3) dtb__532) then (((((((((((v_bindDictBinderFuel (mc0 - 1)) mc1) mc2) mc3) dtb__531) dtb__529) dtb__532) dtb__533) (B_dData_dList.C_List__x58__x58_ (dtb__527, dtb__528))) mc5) mc7) else (if (((Elab_dMeta.v_isImplicitDomain mc2) mc3) dtb__532) then (((((((((((v_bindIndexBinderFuel (mc0 - 1)) mc1) mc2) mc3) dtb__531) dtb__529) dtb__532) dtb__533) (B_dData_dList.C_List__x58__x58_ (dtb__527, dtb__528))) mc5) mc7) else ((Base_dDiagnostics_dTc.v_tcErr0 mc7) Base_dDiagnostics_dTc.C_TcErr_ImplicitParamKind))) else (match dtb__527 with
  | Frontend_dRast.C_Pat_PVar (dtb__534, dtb__535) -> ((((((((((((v_bindOnePatternFuel (mc0 - 1)) mc1) mc2) mc3) dtb__531) dtb__534) dtb__528) mc5) dtb__532) dtb__533) ((Base_dSource.v_spanAtName dtb__534) dtb__535)) mc7)
  | Frontend_dRast.C_Pat_PWild (dtb__536) -> ((((((((((((v_bindOnePatternFuel (mc0 - 1)) mc1) mc2) mc3) dtb__531) "_") dtb__528) mc5) dtb__532) dtb__533) dtb__536) mc7)
  | _ -> ((Base_dDiagnostics_dTc.v_tcErr0 (Frontend_dRast.v_patSpan dtb__527)) Base_dDiagnostics_dTc.C_TcErr_DefParamsMustBeVars)
))
  | _ -> ((Base_dDiagnostics_dTc.v_tcErr0 mc7) Base_dDiagnostics_dTc.C_TcErr_DefMoreParams)
)) ((Elab_dTypes.v_forceVal mc3) mc6)))
  | B_dData_dList.C_List_Nil -> (if (mc0 <= 0) then (Base_dDiag.v_icFuel "binder check") else ((fun forced -> (match forced with
  | Core_dTerm.C_Value_VPi (dtb__537, dtb__538, dtb__539, dtb__540, dtb__541) -> (if dtb__538 then (if ((Elab_dDict.v_isDictDomain mc3) dtb__540) then (((((((((((v_bindDictBinderFuel (mc0 - 1)) mc1) mc2) mc3) dtb__539) dtb__537) dtb__540) dtb__541) B_dData_dList.C_List_Nil) mc5) mc7) else (if (((Elab_dMeta.v_isImplicitDomain mc2) mc3) dtb__540) then (((((((((((v_bindIndexBinderFuel (mc0 - 1)) mc1) mc2) mc3) dtb__539) dtb__537) dtb__540) dtb__541) B_dData_dList.C_List_Nil) mc5) mc7) else ((Base_dDiagnostics_dTc.v_tcErr0 mc7) Base_dDiagnostics_dTc.C_TcErr_ImplicitParamKind))) else ((Base_dCommon.v_bind ((Base_dObs.v_obsCheck "vuna.elab.term.body") (fun (_u : int) -> (((((((v_checkBodyAtEndFuel (mc0 - 1)) mc1) mc2) mc3) mc5) mc6) mc7)))) (fun (p : (Core_dTerm.t_Term, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> ((Base_dCommon.v_bind ((Base_dObs.v_obsCheck "vuna.elab.term.goals") (fun (_u : int) -> ((((Elab_dDict.v_resolveRowGoalsCtx mc1) mc2) (B_dData_dPair.v_secondOf p)) mc7)))) (fun (ec2 : Elab_dTypes.t_Ec) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dPair.v_firstOf p); B_dData_dPair.f_Pair_second = ec2 })))))))
  | _ -> ((Base_dCommon.v_bind ((Base_dObs.v_obsCheck "vuna.elab.term.body") (fun (_u : int) -> (((((Elab_dTerm.v_checkE mc1) mc2) mc3) mc5) mc6)))) (fun (p : (Core_dTerm.t_Term, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> ((Base_dCommon.v_bind ((Base_dObs.v_obsCheck "vuna.elab.term.goals") (fun (_u : int) -> ((((Elab_dDict.v_resolveRowGoalsCtx mc1) mc2) (B_dData_dPair.v_secondOf p)) mc7)))) (fun (ec2 : Elab_dTypes.t_Ec) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dPair.v_firstOf p); B_dData_dPair.f_Pair_second = ec2 }))))))
)) ((Elab_dTypes.v_forceVal mc3) mc6)))
  | _ -> failwith "DT: impossible branch"
))
# 1455 "Vuna/Compiler/Elab/Trait.vuna"
and v_bindDictBinderFuel = (fun (fuel : int) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (rig : Core_dTerm.t_Rig) (name : string) (dom : Core_dTerm.t_Value) (clo : Core_dTerm.t_Closure) (pats : Frontend_dRast.t_Pat B_dData_dList.t_List) (body : Frontend_dRast.t_Expr) (sp : Base_dSource.t_Span) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "binder check") else ((fun lvl -> ((fun v -> ((fun ctx2 -> ((fun expected2 -> ((Base_dCommon.v_bind ((((((((v_checkBindersFuel (fuel - 1)) globals) ctx2) ec) pats) body) expected2) sp)) (fun (p : (Core_dTerm.t_Term, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match p with
  | { B_dData_dPair.f_Pair_first = dtb__542; B_dData_dPair.f_Pair_second = dtb__543 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Core_dTerm.C_Term_TLam (name, rig, B_dData_dMaybe.C_Maybe_Nothing, Base_dSource.v_spanEmpty, dtb__542)); B_dData_dPair.f_Pair_second = dtb__543 }))
  | _ -> failwith "DT: impossible branch"
)))) ((Core_dEval.v_applyClosure clo) v))) (((Elab_dTypes.v_ctxBindValue name) dom) ctx))) ((Elab_dMeta.v_freshVarValue name) lvl))) (Elab_dTypes.v_ctxDepth ctx))))
# 1472 "Vuna/Compiler/Elab/Trait.vuna"
and v_bindIndexBinderFuel = (fun (fuel : int) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (rig : Core_dTerm.t_Rig) (name : string) (dom : Core_dTerm.t_Value) (clo : Core_dTerm.t_Closure) (pats : Frontend_dRast.t_Pat B_dData_dList.t_List) (body : Frontend_dRast.t_Expr) (sp : Base_dSource.t_Span) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "binder check") else ((fun lvl -> ((fun v -> ((fun ctx2 -> ((fun expected2 -> ((Base_dCommon.v_bind ((((((((v_checkBindersFuel (fuel - 1)) globals) ctx2) ec) pats) body) expected2) sp)) (fun (p : (Core_dTerm.t_Term, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match p with
  | { B_dData_dPair.f_Pair_first = dtb__544; B_dData_dPair.f_Pair_second = dtb__545 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Core_dTerm.C_Term_TLam (name, rig, B_dData_dMaybe.C_Maybe_Nothing, Base_dSource.v_spanEmpty, dtb__544)); B_dData_dPair.f_Pair_second = dtb__545 }))
  | _ -> failwith "DT: impossible branch"
)))) ((Core_dEval.v_applyClosure clo) v))) (((Elab_dTypes.v_ctxBindValue name) dom) ctx))) ((Elab_dMeta.v_freshVarValue name) lvl))) (Elab_dTypes.v_ctxDepth ctx))))
# 1493 "Vuna/Compiler/Elab/Trait.vuna"
and v_checkBodyAtEndFuel = (fun (fuel : int) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (body : Frontend_dRast.t_Expr) (expected : Core_dTerm.t_Value) (sp : Base_dSource.t_Span) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "binder check") else (match body with
  | Frontend_dRast.C_Expr_ELam (dtb__546, dtb__547, dtb__548) -> ((Base_dCommon.v_bind (((((Elab_dTerm.v_checkE globals) ctx) ec) body) expected)) (fun (p : (Core_dTerm.t_Term, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> ((Base_dCommon.v_bind ((((Elab_dDict.v_resolveRowGoalsCtx globals) ctx) (B_dData_dPair.v_secondOf p)) sp)) (fun (ec2 : Elab_dTypes.t_Ec) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dPair.v_firstOf p); B_dData_dPair.f_Pair_second = ec2 }))))))
  | _ -> (match ((Elab_dTypes.v_forceVal ec) expected) with
  | Core_dTerm.C_Value_VPi (dtb__549, dtb__550, dtb__551, dtb__552, dtb__553) -> (if dtb__550 then (if ((Elab_dDict.v_isDictDomain ec) dtb__552) then (((((((((((v_bindDictBinderFuel (fuel - 1)) globals) ctx) ec) dtb__551) dtb__549) dtb__552) dtb__553) B_dData_dList.C_List_Nil) body) sp) else (if (((Elab_dMeta.v_isImplicitDomain ctx) ec) dtb__552) then (((((((((((v_bindIndexBinderFuel (fuel - 1)) globals) ctx) ec) dtb__551) dtb__549) dtb__552) dtb__553) B_dData_dList.C_List_Nil) body) sp) else ((Base_dDiagnostics_dTc.v_tcErr0 sp) Base_dDiagnostics_dTc.C_TcErr_ImplicitParamKind))) else ((fun lvl -> ((fun etaName -> ((fun v -> ((fun ctx2 -> ((fun body2 -> ((Base_dCommon.v_bind (((((Elab_dMeta.v_rigForLinearDomain ec) sp) etaName) dtb__551) dtb__552)) (fun (etaRig : Core_dTerm.t_Rig) -> ((Base_dCommon.v_bind (((((((v_checkBodyAtEndFuel (fuel - 1)) globals) ctx2) ec) body2) ((Core_dEval.v_applyClosure dtb__553) v)) sp)) (fun (p : (Core_dTerm.t_Term, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match p with
  | { B_dData_dPair.f_Pair_first = dtb__554; B_dData_dPair.f_Pair_second = dtb__555 } -> ((fun inner2 -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Core_dTerm.C_Term_TLam (etaName, etaRig, B_dData_dMaybe.C_Maybe_Nothing, Base_dSource.v_spanEmpty, inner2)); B_dData_dPair.f_Pair_second = dtb__555 }))) (if (((Elab_dMeta.v_isOpaqueRuntimeTyIn dtb__555) ctx) dtb__552) then ((Elab_dMeta.v_wrapOpaqueUses (B_dData_dList.C_List__x58__x58_ (0, B_dData_dList.C_List_Nil))) dtb__554) else dtb__554))
  | _ -> failwith "DT: impossible branch"
)))))) (Frontend_dRast.C_Expr_EApp (body, (B_dData_dList.C_List__x58__x58_ ((Frontend_dRast.C_Expr_EVar ((Frontend_dRast_dName.v_classifyName etaName), sp)), B_dData_dList.C_List_Nil)), sp)))) (((Elab_dTypes.v_ctxBindValue etaName) dtb__552) ctx))) ((Elab_dMeta.v_freshVarValue etaName) lvl))) ("_arity" ^ (bi_strFromInt lvl)))) (Elab_dTypes.v_ctxDepth ctx)))
  | _ -> ((Base_dCommon.v_bind (((((Elab_dTerm.v_checkE globals) ctx) ec) body) expected)) (fun (p : (Core_dTerm.t_Term, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> ((Base_dCommon.v_bind ((((Elab_dDict.v_resolveRowGoalsCtx globals) ctx) (B_dData_dPair.v_secondOf p)) sp)) (fun (ec2 : Elab_dTypes.t_Ec) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dPair.v_firstOf p); B_dData_dPair.f_Pair_second = ec2 }))))))
)
)))
# 1542 "Vuna/Compiler/Elab/Trait.vuna"
and v_bindOnePatternFuel = (fun (fuel : int) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (rig : Core_dTerm.t_Rig) (pname : string) (pats : Frontend_dRast.t_Pat B_dData_dList.t_List) (body : Frontend_dRast.t_Expr) (dom : Core_dTerm.t_Value) (clo : Core_dTerm.t_Closure) (binderSp : Base_dSource.t_Span) (sp : Base_dSource.t_Span) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "binder check") else ((fun lvl -> ((fun v -> ((fun ctx2 -> ((Base_dCommon.v_bind (((((Elab_dMeta.v_rigForLinearDomain ec) sp) pname) rig) dom)) (fun (erasure : Core_dTerm.t_Rig) -> ((Base_dCommon.v_bind ((((((((v_checkBindersFuel (fuel - 1)) globals) ctx2) ec) pats) body) ((Core_dEval.v_applyClosure clo) v)) sp)) (fun (p : (Core_dTerm.t_Term, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match p with
  | { B_dData_dPair.f_Pair_first = dtb__556; B_dData_dPair.f_Pair_second = dtb__557 } -> ((fun inner2 -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Core_dTerm.C_Term_TLam (pname, erasure, B_dData_dMaybe.C_Maybe_Nothing, binderSp, inner2)); B_dData_dPair.f_Pair_second = dtb__557 }))) (if (((Elab_dMeta.v_isOpaqueRuntimeTyIn dtb__557) ctx) dom) then ((Elab_dMeta.v_wrapOpaqueUses (B_dData_dList.C_List__x58__x58_ (0, B_dData_dList.C_List_Nil))) dtb__556) else dtb__556))
  | _ -> failwith "DT: impossible branch"
)))))) (((Elab_dTypes.v_ctxBindValue pname) dom) ctx))) ((Elab_dMeta.v_freshVarValue pname) lvl))) (Elab_dTypes.v_ctxDepth ctx))))

# 1605 "Vuna/Compiler/Elab/Trait.vuna"
let v_checkBinders = (fun (a1 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (a2 : Elab_dTypes.t_Ctx) (a3 : Elab_dTypes.t_Ec) (a4 : Frontend_dRast.t_Pat B_dData_dList.t_List) (a5 : Frontend_dRast.t_Expr) (a6 : Core_dTerm.t_Value) (a7 : Base_dSource.t_Span) -> ((((((((v_checkBindersFuel 512) a1) a2) a3) a4) a5) a6) a7))

# 1436 "Vuna/Compiler/Elab/Trait.vuna"
let v_checkDefIn = (fun (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx0 : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (pats : Frontend_dRast.t_Pat B_dData_dList.t_List) (body : Frontend_dRast.t_Expr) (expected : Core_dTerm.t_Value) (sp : Base_dSource.t_Span) -> (((((((v_checkBinders globals) ctx0) ec) pats) body) expected) sp))

# 1440 "Vuna/Compiler/Elab/Trait.vuna"
let v_checkDef = (fun (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ec : Elab_dTypes.t_Ec) (pats : Frontend_dRast.t_Pat B_dData_dList.t_List) (body : Frontend_dRast.t_Expr) (expected : Core_dTerm.t_Value) (sp : Base_dSource.t_Span) -> (((((((v_checkDefIn globals) Elab_dTypes.v_emptyCtx) ec) pats) body) expected) sp))

# 1581 "Vuna/Compiler/Elab/Trait.vuna"
let v_elabFunDefMulti = (fun (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx0 : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (clauses : (Frontend_dRast.t_Pat B_dData_dList.t_List, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (expected : Core_dTerm.t_Value) (sp : Base_dSource.t_Span) -> ((fun _u -> ((Base_dCommon.v_bind ((Base_dObs.v_obsCheck "vuna.elab.pats") (fun (_u : int) -> ((((Elab_dTerm.v_resolveOverFunPats ec) ctx0) expected) clauses)))) (fun (r : ((Frontend_dRast.t_Pat B_dData_dList.t_List, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match r with
  | { B_dData_dPair.f_Pair_first = dtb__558; B_dData_dPair.f_Pair_second = dtb__559 } -> ((fun table -> ((Base_dCommon.v_bind ((Base_dObs.v_obsCheck "vuna.elab.pats") (fun (_u : int) -> ((Elab_dMatch.v_multiToExpr table) dtb__558)))) (fun (bodyExpr : Frontend_dRast.t_Expr) -> ((fun _u -> ((fun checked -> ((Base_dObs.v_obsCheck "vuna.elab.coverage") (fun (_u : int) -> ((((Elab_dCoverage.v_improveExhaustive table) (fun (_u : int) -> (Elab_dMatch.v_matrixOf dtb__558))) (Elab_dMatch.v_firstPatSpan dtb__558)) checked)))) ((Base_dObs.v_obsCheck "vuna.elab.term") (fun (_u : int) -> (((((((v_checkDefIn globals) ctx0) dtb__559) B_dData_dList.C_List_Nil) bodyExpr) expected) sp))))) (if (dtp_debug_on 0) then (dtp_debug_line "CHECKDEF") else 0))))) (Elab_dMeta.v_ctorFamilyTable dtb__559))
  | _ -> failwith "DT: impossible branch"
)))) (if (dtp_debug_on 0) then (dtp_debug_line "MULTI") else 0)))

# 1570 "Vuna/Compiler/Elab/Trait.vuna"
let v_elabFunDefIn = (fun (mc0 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc1 : Elab_dTypes.t_Ctx) (mc2 : Elab_dTypes.t_Ec) (mc3 : (Frontend_dRast.t_Pat B_dData_dList.t_List, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc4 : Core_dTerm.t_Value) (mc5 : Base_dSource.t_Span) -> (match mc3 with
  | B_dData_dList.C_List__x58__x58_ (dtb__560, dtb__561) -> (match dtb__560 with
  | { B_dData_dPair.f_Pair_first = dtb__562; B_dData_dPair.f_Pair_second = dtb__563 } -> (match dtb__561 with
  | B_dData_dList.C_List_Nil -> (if (Elab_dMatch.v_allVarPats dtb__562) then ((Base_dObs.v_obsCheck "vuna.elab.term") (fun (_u : int) -> (((((((v_checkDefIn mc0) mc1) mc2) dtb__562) dtb__563) mc4) mc5))) else ((((((v_elabFunDefMulti mc0) mc1) mc2) (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__562; B_dData_dPair.f_Pair_second = dtb__563 }, B_dData_dList.C_List_Nil))) mc4) mc5))
  | _ -> ((((((v_elabFunDefMulti mc0) mc1) mc2) mc3) mc4) mc5)
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> ((Base_dDiagnostics_dTc.v_tcErr0 mc5) Base_dDiagnostics_dTc.C_TcErr_FunctionNoClauses)
  | _ -> failwith "DT: impossible branch"
))

# 966 "Vuna/Compiler/Elab/Trait.vuna"
let v_elabInstanceMethodIn = (fun (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (mty : Core_dTerm.t_Term) (clauses : (Frontend_dRast.t_Pat B_dData_dList.t_List, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> ((((((v_elabFunDefIn globals) ctx) ec) clauses) ((Elab_dTypes.v_evalCtx ctx) mty)) (v_clauseSpanOf clauses)))

# 930 "Vuna/Compiler/Elab/Trait.vuna"
let rec v_elabInstanceMethodsGo = (fun (mc0 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc1 : Elab_dTypes.t_Ctx) (mc2 : int) (mc3 : Elab_dTypes.t_Ec) (mc4 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc5 : Core_dTerm.t_Term B_dData_dList.t_List) (mc6 : Frontend_dRast.t_Decl B_dData_dList.t_List) (mc7 : Core_dTerm.t_Term B_dData_dList.t_List) (mc8 : (Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc9 : Base_dSource.t_Span) -> (match mc4 with
  | B_dData_dList.C_List__x58__x58_ (dtb__564, dtb__565) -> (match dtb__564 with
  | { B_dData_dPair.f_Pair_first = dtb__566; B_dData_dPair.f_Pair_second = dtb__567 } -> ((fun clauses -> ((fun instTy -> (match clauses with
  | B_dData_dList.C_List_Nil -> ((Base_dDiagnostics_dTc.v_tcErr0 mc9) Base_dDiagnostics_dTc.C_TcErr_InstanceMissingMethod)
  | _ -> ((Base_dCommon.v_bind (((((v_elabInstanceMethodIn mc0) mc1) mc3) instTy) clauses)) (fun (p : (Core_dTerm.t_Term, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match p with
  | { B_dData_dPair.f_Pair_first = dtb__568; B_dData_dPair.f_Pair_second = dtb__569 } -> ((((((((((v_elabInstanceMethodsGo mc0) mc1) mc2) dtb__569) dtb__565) mc5) mc6) (B_dData_dList.C_List__x58__x58_ (dtb__568, mc7))) (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__568; B_dData_dPair.f_Pair_second = Core_dTerm.C_Rig_RigOmega }, mc8))) mc9)
  | _ -> failwith "DT: impossible branch"
)))
)) (((Core_dTerm.v_shift 0) mc2) ((v_substInstParams mc5) dtb__567)))) ((v_methodClausesNamed dtb__566) mc6))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.v_reverse mc7); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = (B_dData_dList.v_reverse mc8); B_dData_dPair.f_Pair_second = mc3 } }))
  | _ -> failwith "DT: impossible branch"
))

# 861 "Vuna/Compiler/Elab/Trait.vuna"
let v_elabInstanceMethodsCtx = (fun (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (cls : Elab_dTypes.t_DtClass) (ctx : Elab_dTypes.t_Ctx) (nCtx : int) (headArgs : Core_dTerm.t_Term B_dData_dList.t_List) (ec : Elab_dTypes.t_Ec) (methods : Frontend_dRast.t_Decl B_dData_dList.t_List) (sp : Base_dSource.t_Span) -> ((((((((((v_elabInstanceMethodsGo globals) ctx) nCtx) ec) (v_zipClassFields cls)) headArgs) methods) B_dData_dList.C_List_Nil) B_dData_dList.C_List_Nil) sp))

# 349 "Vuna/Compiler/Elab/Trait.vuna"
let v_elabInstanceWithClass = (fun (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (allDecls : (Frontend_dRast.t_Decl, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List) (cls : Elab_dTypes.t_DtClass) (info : t_InstSigInfo) (ec0 : Elab_dTypes.t_Ec) (headExpr : Frontend_dRast.t_Expr) (methods : Frontend_dRast.t_Decl B_dData_dList.t_List) (msp : Base_dSource.t_Span) -> (match ((v_firstUnknownInstanceMethod cls) methods) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__570) -> (((Base_dDiagnostics_dTc.v_tcErr1 msp) (Base_dDiagnostics_dTc.C_TcErr_InstanceUnknownMethod (dtb__570))) dtb__570)
  | B_dData_dMaybe.C_Maybe_Nothing -> (match ((v_firstMissingInstanceMethod cls) methods) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__571) -> (match (((v_traitMethodSpanOf cls) dtb__571) allDecls) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__572) -> ((Base_dDiagnostics_dTc.v_tcErr0 dtb__572) Base_dDiagnostics_dTc.C_TcErr_InstanceMissingMethod)
  | B_dData_dMaybe.C_Maybe_Nothing -> ((Base_dDiagnostics_dTc.v_tcErr0 msp) Base_dDiagnostics_dTc.C_TcErr_InstanceMissingMethod)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> ((fun bodyCtx -> ((fun nCtx -> ((fun nTele -> ((fun bodyDepth -> ((fun iname -> ((Base_dCommon.v_bind ((((((((v_checkSuperClasses globals) bodyCtx) nCtx) iname) msp) (v_instSigArgs info)) (cls).Elab_dTypes.f_DtClass_dtClassSupers) ec0)) (fun (ecSuper : Elab_dTypes.t_Ec) -> ((Base_dCommon.v_bind ((((((((v_elabInstanceMethodsCtx globals) cls) bodyCtx) nCtx) (v_instSigArgs info)) ecSuper) methods) msp)) (fun (q : (Core_dTerm.t_Term B_dData_dList.t_List, ((Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> ((fun fieldTerms -> ((fun ec1 -> ((fun solvedCtx -> ((fun ctxSubs -> ((fun ec2 -> ((fun fields1 -> ((Base_dCommon.v_bind ((((((v_resolveRigidGoals globals) bodyCtx) msp) (Elab_dTypes.v_ecPending ec2)) B_dData_dList.C_List_Nil) ec2)) (fun (r : ((int, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> ((fun globSubs -> ((fun ec3 -> ((fun fields2 -> ((fun dictTerm -> ((fun dictTyTerm -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = iname; B_dData_dPair.f_Pair_second = dictTyTerm }, B_dData_dList.C_List_Nil)); B_dData_dPair.f_Pair_second = ((Elab_dTypes.v_ecAddDef ec3) { B_dData_dPair.f_Pair_first = iname; B_dData_dPair.f_Pair_second = dictTerm }) }))) (v_instTypeOf info))) (((v_instValueOf info) (Elab_dMeta.v_dictCtorName (Elab_dTypes.v_dtClassName cls))) fields2))) ((B_dData_dList.v_map ((v_applyTermSubstsTo bodyDepth) globSubs)) fields1))) (B_dData_dPair.v_secondOf r))) (B_dData_dPair.v_firstOf r))))) ((B_dData_dList.v_map ((v_applyCtxSubstsTo nTele) ctxSubs)) fieldTerms))) (B_dData_dPair.v_secondOf solvedCtx))) (B_dData_dPair.v_firstOf solvedCtx))) (((((v_solveCtxGoals bodyCtx) nCtx) nTele) ec1) B_dData_dList.C_List_Nil))) (B_dData_dPair.v_secondOf (B_dData_dPair.v_secondOf q)))) (B_dData_dPair.v_firstOf q))))))) ((Elab_dInstName.v_instanceName (Elab_dTypes.v_dtClassName cls)) headExpr))) (bi_natAdd nTele nCtx))) (B_dData_dList.v_length (v_instSigTele info)))) (B_dData_dList.v_length (v_instSigCtx info)))) (v_instBodyCtx info))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 399 "Vuna/Compiler/Elab/Trait.vuna"
let v_elabInstance = (fun (mc0 : (Frontend_dRast.t_Decl, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc1 : (Frontend_dRast.t_Decl, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc2 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc3 : Elab_dTypes.t_DtClass B_dData_dList.t_List) (mc4 : Elab_dTypes.t_DtData B_dData_dList.t_List) (mc5 : Elab_dTypes.t_Ec) (mc6 : (Frontend_dRast.t_Decl, Base_dSource.t_Span) B_dData_dPair.t_Pair) -> (match mc6 with
  | { B_dData_dPair.f_Pair_first = dtb__573; B_dData_dPair.f_Pair_second = dtb__574 } -> (match dtb__573 with
  | Frontend_dRast.C_Decl_DInstance (dtb__575, dtb__576, dtb__577, dtb__578) -> ((Base_dCommon.v_bind ((Base_dDiag.v_onErrDiag (Base_dDiag.v_withFallbackSpan dtb__578)) (((((((v_elabInstanceSig mc3) mc2) (Elab_dSig.v_definedNames ((B_dData_dList.v_map B_dData_dPair.v_firstOf) mc0))) mc5) dtb__578) dtb__576) dtb__575))) (fun (p : (t_InstSigInfo, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match p with
  | { B_dData_dPair.f_Pair_first = dtb__579; B_dData_dPair.f_Pair_second = dtb__580 } -> (match ((Elab_dDict.v_findClass (v_instSigClass dtb__579)) mc3) with
  | B_dData_dMaybe.C_Maybe_Nothing -> ((Base_dDiagnostics_dTc.v_tcErr0 dtb__578) Base_dDiagnostics_dTc.C_TcErr_InstanceHeadNotApp)
  | B_dData_dMaybe.C_Maybe_Just (dtb__581) -> (if ((((v_instanceLandingOk mc1) dtb__578) dtb__581) dtb__576) then ((((((((v_elabInstanceWithClass mc2) mc1) dtb__581) dtb__579) dtb__580) dtb__576) dtb__577) dtb__578) else ((Base_dDiagnostics_dTc.v_tcErr0 dtb__578) Base_dDiagnostics_dTc.C_TcErr_OrphanInstance))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> ((Elab_dTypes.v_errAt dtb__574) "DT: internal: expected an instance declaration")
)
  | _ -> failwith "DT: impossible branch"
))

# 970 "Vuna/Compiler/Elab/Trait.vuna"
let v_elabInstanceMethod = (fun (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ec : Elab_dTypes.t_Ec) (mty : Core_dTerm.t_Term) (clauses : (Frontend_dRast.t_Pat B_dData_dList.t_List, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (((((v_elabInstanceMethodIn globals) Elab_dTypes.v_emptyCtx) ec) mty) clauses))

# 1333 "Vuna/Compiler/Elab/Trait.vuna"
let rec v_elabInstanceBodiesGo = (fun (mc0 : bool) (mc1 : (Frontend_dRast.t_Decl, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc2 : (Frontend_dRast.t_Decl, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc3 : Elab_dTypes.t_DtClass B_dData_dList.t_List) (mc4 : Elab_dTypes.t_DtData B_dData_dList.t_List) (mc5 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc6 : Elab_dTypes.t_Ec) (mc7 : Elab_dTypes.t_DtDef B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__582, dtb__583) -> (match (((((((v_elabInstance (B_dData_dList.C_List__x58__x58_ (dtb__582, dtb__583))) mc2) mc5) mc3) mc4) mc6) dtb__582) with
  | Base_dDiag.C_Check_ErrC (dtb__584) -> (if mc0 then ((((((((v_elabInstanceBodiesGo mc0) dtb__583) mc2) mc3) mc4) mc5) ((Elab_dTypes.v_ecAddError mc6) dtb__584)) mc7) else (Base_dDiag.C_Check_ErrC (dtb__584)))
  | Base_dDiag.C_Check_OkC (dtb__585) -> (match dtb__585 with
  | { B_dData_dPair.f_Pair_first = dtb__586; B_dData_dPair.f_Pair_second = dtb__587 } -> ((fun newDefs -> ((fun ecTbl -> ((((((((v_elabInstanceBodiesGo mc0) dtb__583) mc2) mc3) mc4) ((B_dData_dList.v_append mc5) dtb__586)) ecTbl) ((B_dData_dList.v_append newDefs) mc7))) ((Elab_dTypes.v_ecPutGlobalsTbl dtb__587) (((B_dContainer_dHashMap.v_insertAll B_dData_dString.v_Hashable_uString) dtb__586) (Elab_dTypes.v_ecGlobalsTbl dtb__587))))) ((((v_instanceDefsOf mc6) dtb__587) (B_dData_dMaybe.C_Maybe_Just ((B_dData_dPair.v_secondOf dtb__582)))) dtb__586))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.v_reverse mc7); B_dData_dPair.f_Pair_second = mc6 }))
  | _ -> failwith "DT: impossible branch"
))

# 1321 "Vuna/Compiler/Elab/Trait.vuna"
let v_elabInstanceBodies = (fun (recover : bool) (allDecls : Frontend_dRast.t_Decl B_dData_dList.t_List) (classes : Elab_dTypes.t_DtClass B_dData_dList.t_List) (datas : Elab_dTypes.t_DtData B_dData_dList.t_List) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ec : Elab_dTypes.t_Ec) -> ((((((((v_elabInstanceBodiesGo recover) ((Elab_dMeta.v_collectInstDecls allDecls) B_dData_dList.C_List_Nil)) ((B_dData_dList.v_map (fun (d : Frontend_dRast.t_Decl) -> { B_dData_dPair.f_Pair_first = d; B_dData_dPair.f_Pair_second = (Frontend_dRast.v_declSpan d) })) allDecls)) classes) datas) globals) ec) B_dData_dList.C_List_Nil))

# 1392 "Vuna/Compiler/Elab/Trait.vuna"
let rec v_elabInstancesGo = (fun (mc0 : (Frontend_dRast.t_Decl, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc1 : Elab_dTypes.t_DtClass B_dData_dList.t_List) (mc2 : Elab_dTypes.t_DtData B_dData_dList.t_List) (mc3 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc4 : Elab_dTypes.t_Ec) (mc5 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__588, dtb__589) -> ((Base_dCommon.v_bind (((((((v_elabInstance (B_dData_dList.C_List__x58__x58_ (dtb__588, dtb__589))) B_dData_dList.C_List_Nil) mc3) mc1) mc2) mc4) dtb__588)) (fun (p : ((string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match p with
  | { B_dData_dPair.f_Pair_first = dtb__590; B_dData_dPair.f_Pair_second = dtb__591 } -> ((((((v_elabInstancesGo dtb__589) mc1) mc2) ((B_dData_dList.v_append mc3) dtb__590)) dtb__591) ((B_dData_dList.v_append dtb__590) mc5))
  | _ -> failwith "DT: impossible branch"
)))
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.v_reverse mc5); B_dData_dPair.f_Pair_second = mc4 }))
  | _ -> failwith "DT: impossible branch"
))

# 1389 "Vuna/Compiler/Elab/Trait.vuna"
let v_elabInstances = (fun (decls : (Frontend_dRast.t_Decl, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List) (classes : Elab_dTypes.t_DtClass B_dData_dList.t_List) (datas : Elab_dTypes.t_DtData B_dData_dList.t_List) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ec : Elab_dTypes.t_Ec) -> ((((((v_elabInstancesGo decls) classes) datas) globals) ec) B_dData_dList.C_List_Nil))

# 1602 "Vuna/Compiler/Elab/Trait.vuna"
let v_elabFunDef = (fun (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ec : Elab_dTypes.t_Ec) (clauses : (Frontend_dRast.t_Pat B_dData_dList.t_List, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (expected : Core_dTerm.t_Value) (sp : Base_dSource.t_Span) -> ((((((v_elabFunDefIn globals) Elab_dTypes.v_emptyCtx) ec) clauses) expected) sp))

# 1608 "Vuna/Compiler/Elab/Trait.vuna"
let v_bindIndexBinder = (fun (a1 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (a2 : Elab_dTypes.t_Ctx) (a3 : Elab_dTypes.t_Ec) (a4 : Core_dTerm.t_Rig) (a5 : string) (a6 : Core_dTerm.t_Value) (a7 : Core_dTerm.t_Closure) (a8 : Frontend_dRast.t_Pat B_dData_dList.t_List) (a9 : Frontend_dRast.t_Expr) (a10 : Base_dSource.t_Span) -> (((((((((((v_bindIndexBinderFuel 512) a1) a2) a3) a4) a5) a6) a7) a8) a9) a10))

# 1612 "Vuna/Compiler/Elab/Trait.vuna"
let v_bindOnePattern = (fun (a1 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (a2 : Elab_dTypes.t_Ctx) (a3 : Elab_dTypes.t_Ec) (a4 : Core_dTerm.t_Rig) (a5 : string) (a6 : Frontend_dRast.t_Pat B_dData_dList.t_List) (a7 : Frontend_dRast.t_Expr) (a8 : Core_dTerm.t_Value) (a9 : Core_dTerm.t_Closure) (a10 : Base_dSource.t_Span) (a11 : Base_dSource.t_Span) -> ((((((((((((v_bindOnePatternFuel 512) a1) a2) a3) a4) a5) a6) a7) a8) a9) a10) a11))
