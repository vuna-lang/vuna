open Vuna_runtime
type t_InstSigInfo = { f_InstSigInfo_instSigClass : string; f_InstSigInfo_instSigTele : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List; f_InstSigInfo_instSigCtx : Core_dTerm.t_Term B_dData_dList.t_List; f_InstSigInfo_instSigArgs : Core_dTerm.t_Term B_dData_dList.t_List; f_InstSigInfo_instSigHead : Core_dTerm.t_Term }
and t_DictGoalGroup = { f_DictGoalGroup_dictGoalGroupRep : int; f_DictGoalGroup_dictGoalGroupDom : Core_dTerm.t_Value; f_DictGoalGroup_dictGoalGroupExtras : int B_dData_dList.t_List }
and t_DictPlan = { f_DictPlan_dpName : string; f_DictPlan_dpLevel : int; f_DictPlan_dpDom : Core_dTerm.t_Term; f_DictPlan_dpMetas : int B_dData_dList.t_List }

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
  | { B_dData_dPair.f_Pair_first = dtb__6; B_dData_dPair.f_Pair_second = dtb__7 } -> ((Base_dCommon.v_bind ((((Elab_dTerm.v_checkType mc0) mc1) mc2) (((Elab_dSig.v_quantifyTraitSig (fun (nm : string) -> (B_dData_dMaybe.v_isJust ((Elab_dTypes.v_ctxLookup nm) mc1)))) dtb__7) (Frontend_dRast.v_exprSpan dtb__7)))) (fun (p : (Core_dTerm.t_Term, (Core_dTerm.t_Level, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let nd_uscrut13 = p in (match nd_uscrut13 with
  | { B_dData_dPair.f_Pair_first = dtb__8; B_dData_dPair.f_Pair_second = dtb__9 } -> (match dtb__9 with
  | { B_dData_dPair.f_Pair_first = dtb__10; B_dData_dPair.f_Pair_second = dtb__11 } -> (((((v_classFieldTysGo mc0) mc1) dtb__11) dtb__5) (B_dData_dList.C_List__x58__x58_ (dtb__8, mc4)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))
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
and v_traitKindExplicit = (fun (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ec : Elab_dTypes.t_Ec) (kexpr : Frontend_dRast.t_Expr) (rest : Frontend_dRast.t_TraitParam B_dData_dList.t_List) (methods : (string, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> ((Base_dCommon.v_bind ((((Elab_dTerm.v_checkType globals) Elab_dTypes.v_emptyCtx) ec) kexpr)) (fun (pk : (Core_dTerm.t_Term, (Core_dTerm.t_Level, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let nd_uscrut6 = pk in (match nd_uscrut6 with
  | { B_dData_dPair.f_Pair_first = dtb__27; B_dData_dPair.f_Pair_second = dtb__28 } -> (match dtb__28 with
  | { B_dData_dPair.f_Pair_first = dtb__29; B_dData_dPair.f_Pair_second = dtb__30 } -> ((Base_dCommon.v_bind ((((v_traitParamKinds globals) dtb__30) rest) methods)) (fun (pr : (Core_dTerm.t_Term B_dData_dList.t_List, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match pr with
  | { B_dData_dPair.f_Pair_first = dtb__31; B_dData_dPair.f_Pair_second = dtb__32 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ (dtb__27, dtb__31)); B_dData_dPair.f_Pair_second = dtb__32 }))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))))
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
let v_methodProjType = (fun (tname : string) (params : string B_dData_dList.t_List) (pKinds : Core_dTerm.t_Term B_dData_dList.t_List) (methodTy : Core_dTerm.t_Term) -> (let dictPi = (Core_dTerm.C_Term_TPi ("_", true, Core_dTerm.C_Rig_RigOmega, ((v_dictAppTermOf (Elab_dMeta.v_dictTypeName tname)) params), (((Core_dTerm.v_shift 0) 1) methodTy))) in ((v_foldParamPis ((B_dData_dList.v_zip params) pKinds)) dictPi)))

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
let v_projectionParamNames = (fun (n : int) -> (if (n = 1) then (B_dData_dList.C_List__x58__x58_ ("_p", B_dData_dList.C_List_Nil)) else ((B_dData_dList.v_map (fun (i : int) -> ("_p" ^ ((B_dTrait_dInterp.v_interp (B_dTrait_dInterp.v_Interp_uc9feaa570847b590_ua B_dData_dInt.v_Show_u0077d73cf424e521_uInt)) i)))) ((B_dData_dList.v_range 0) n))))

# 223 "Vuna/Compiler/Elab/Trait.vuna"
let v_projectionBodyOpaque = (fun (fieldOpaque : bool) (ctor : string) (fieldIdx : int) (rigs : Core_dTerm.t_Rig B_dData_dList.t_List) (nFields : int) (nParams : int) -> (let arity = (B_dData_dList.v_length rigs) in (let dictIdx = arity in (let fieldVar = (Core_dTerm.C_Term_TVar ((Elab_dMeta.v_fieldVarName fieldIdx), ((nFields - 1) - fieldIdx), { Base_dSource.f_Span_spanFile = ""; Base_dSource.f_Span_spanStartLine = 0; Base_dSource.f_Span_spanStartCol = 0; Base_dSource.f_Span_spanEndLine = 0; Base_dSource.f_Span_spanEndCol = 0; Base_dSource.f_Span_spanStartOffset = 0; Base_dSource.f_Span_spanEndOffset = 0 })) in (let argPairs = ((Elab_dMeta.v_methodArgTerms rigs) nFields) in (let applied0 = ((Elab_dMeta.v_foldAppTerms fieldVar) argPairs) in (let applied = (if fieldOpaque then ((Elab_dMeta.v_wrapOpaqueUses (B_dData_dList.C_List__x58__x58_ (((nFields - 1) - fieldIdx), B_dData_dList.C_List_Nil))) applied0) else applied0) in (let binders = (Core_dTerm.v_bindersOfPairs (Elab_dMeta.v_fieldBinderNames nFields)) in (let alt = { Core_dTerm.f_CaseAlt_caseAltName = ctor; Core_dTerm.f_CaseAlt_caseAltBinders = binders; Core_dTerm.f_CaseAlt_caseAltBody = applied } in (let caseTerm = (Core_dTerm.C_Term_TCase ((Core_dTerm.C_Term_TVar ("_d", dictIdx, { Base_dSource.f_Span_spanFile = ""; Base_dSource.f_Span_spanStartLine = 0; Base_dSource.f_Span_spanStartCol = 0; Base_dSource.f_Span_spanEndLine = 0; Base_dSource.f_Span_spanEndCol = 0; Base_dSource.f_Span_spanStartOffset = 0; Base_dSource.f_Span_spanEndOffset = 0 })), (B_dData_dList.C_List__x58__x58_ (alt, B_dData_dList.C_List_Nil)))) in (let lamArgs = (((Elab_dMeta.v_methodArgLams rigs) 0) caseTerm) in ((v_projectionParamLams (v_projectionParamNames nParams)) (Core_dTerm.C_Term_TLam ("_d", Core_dTerm.C_Rig_RigOmega, B_dData_dMaybe.C_Maybe_Nothing, Base_dSource.v_spanEmpty, lamArgs))))))))))))))

# 215 "Vuna/Compiler/Elab/Trait.vuna"
let v_projectionBody = (fun (ctor : string) (fieldIdx : int) (rigs : Core_dTerm.t_Rig B_dData_dList.t_List) (nFields : int) (nParams : int) -> ((((((v_projectionBodyOpaque false) ctor) fieldIdx) rigs) nFields) nParams))

# 268 "Vuna/Compiler/Elab/Trait.vuna"
let rec v_flagAt = (fun (mc0 : int) (mc1 : bool B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__51, dtb__52) -> (if (mc0 <= 0) then dtb__51 else ((v_flagAt (mc0 - 1)) dtb__52))
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 260 "Vuna/Compiler/Elab/Trait.vuna"
let rec v_projectionDefsOpaqueGo = (fun (mc0 : bool B_dData_dList.t_List) (mc1 : string) (mc2 : int) (mc3 : (string, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc4 : Core_dTerm.t_Term B_dData_dList.t_List) (mc5 : int) (mc6 : int) -> (match mc3 with
  | B_dData_dList.C_List__x58__x58_ (dtb__53, dtb__54) -> (match dtb__53 with
  | { B_dData_dPair.f_Pair_first = dtb__55; B_dData_dPair.f_Pair_second = dtb__56 } -> (match mc4 with
  | B_dData_dList.C_List__x58__x58_ (dtb__57, dtb__58) -> (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__55; B_dData_dPair.f_Pair_second = ((((((v_projectionBodyOpaque ((v_flagAt mc5) mc0)) mc1) mc5) ((Elab_dSig.v_methodArgRigsOf Elab_dMeta.v_piBinderRig) dtb__57)) mc6) mc2) }, (((((((v_projectionDefsOpaqueGo mc0) mc1) mc2) dtb__54) dtb__58) (mc5 + 1)) mc6)))
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

# 272 "Vuna/Compiler/Elab/Trait.vuna"
let v_projectionDefsGo = (fun (ctor : string) (nParams : int) (methods : (string, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (fieldTys : Core_dTerm.t_Term B_dData_dList.t_List) (idx : int) (nFields : int) -> (((((((v_projectionDefsOpaqueGo ((B_dData_dList.v_map (fun (_u : Core_dTerm.t_Term) -> false)) fieldTys)) ctor) nParams) methods) fieldTys) idx) nFields))

# 282 "Vuna/Compiler/Elab/Trait.vuna"
let v_declTopName = (fun (mc0 : Frontend_dRast.t_Decl) -> (match mc0 with
  | Frontend_dRast.C_Decl_DTrait (dtb__59, dtb__60, dtb__61, dtb__62, dtb__63) -> (B_dData_dMaybe.C_Maybe_Just (dtb__59))
  | Frontend_dRast.C_Decl_DRecord (dtb__64, dtb__65, dtb__66, dtb__67, dtb__68, dtb__69, dtb__70, dtb__71) -> (B_dData_dMaybe.C_Maybe_Just (dtb__64))
  | Frontend_dRast.C_Decl_DData (dtb__72, dtb__73, dtb__74, dtb__75, dtb__76, dtb__77, dtb__78, dtb__79, dtb__80) -> (B_dData_dMaybe.C_Maybe_Just (dtb__72))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
))

# 288 "Vuna/Compiler/Elab/Trait.vuna"
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

# 295 "Vuna/Compiler/Elab/Trait.vuna"
let rec v_headTypeNameOf = (fun (mc0 : Frontend_dRast.t_Expr) -> (match mc0 with
  | Frontend_dRast.C_Expr_EApp (dtb__86, dtb__87, dtb__88) -> (v_headTypeNameOf dtb__86)
  | Frontend_dRast.C_Expr_EVar (dtb__89, dtb__90) -> (B_dData_dMaybe.C_Maybe_Just ((Frontend_dRast_dName.v_rnameKey dtb__89)))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
))

# 300 "Vuna/Compiler/Elab/Trait.vuna"
let rec v_headTypeNamesOf = (fun (mc0 : Frontend_dRast.t_Expr B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__91, dtb__92) -> (match (v_headTypeNameOf dtb__91) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__93) -> (B_dData_dList.C_List__x58__x58_ (dtb__93, (v_headTypeNamesOf dtb__92)))
  | B_dData_dMaybe.C_Maybe_Nothing -> (v_headTypeNamesOf dtb__92)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 309 "Vuna/Compiler/Elab/Trait.vuna"
let v_isGlobalHeadType = (fun (n : string) -> (if (if (if (n = "Int") then true else (n = "String")) then true else (n = "Float")) then true else (n = "Array")))

# 318 "Vuna/Compiler/Elab/Trait.vuna"
let rec v_anyDeclInFile = (fun (mc0 : (Frontend_dRast.t_Decl, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc1 : string B_dData_dList.t_List) (mc2 : string) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__94, dtb__95) -> (if (((v_declNamedInFile mc0) dtb__94) mc2) then true else (((v_anyDeclInFile mc0) dtb__95) mc2))
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 323 "Vuna/Compiler/Elab/Trait.vuna"
let rec v_anyGlobalHead = (fun (mc0 : string B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__96, dtb__97) -> (if (v_isGlobalHeadType dtb__96) then true else (v_anyGlobalHead dtb__97))
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 420 "Vuna/Compiler/Elab/Trait.vuna"
let v_instanceHeadParts = (fun (mc0 : Frontend_dRast.t_Expr) -> (match mc0 with
  | Frontend_dRast.C_Expr_EApp (dtb__98, dtb__99, dtb__100) -> (match dtb__98 with
  | Frontend_dRast.C_Expr_EVar (dtb__101, dtb__102) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Frontend_dRast_dName.v_rnameKey dtb__101); B_dData_dPair.f_Pair_second = dtb__99 }))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | Frontend_dRast.C_Expr_EVar (dtb__103, dtb__104) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Frontend_dRast_dName.v_rnameKey dtb__103); B_dData_dPair.f_Pair_second = B_dData_dList.C_List_Nil }))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
))

# 312 "Vuna/Compiler/Elab/Trait.vuna"
let v_instanceHeadTypeNames = (fun (headExpr : Frontend_dRast.t_Expr) -> (let nd_uscrut1 = (v_instanceHeadParts headExpr) in (match nd_uscrut1 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__105) -> (match dtb__105 with
  | { B_dData_dPair.f_Pair_first = dtb__106; B_dData_dPair.f_Pair_second = dtb__107 } -> (v_headTypeNamesOf dtb__107)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
)))

# 327 "Vuna/Compiler/Elab/Trait.vuna"
let v_instanceLandingOk = (fun (allDecls : (Frontend_dRast.t_Decl, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List) (sp : Base_dSource.t_Span) (cls : Elab_dTypes.t_DtClass) (headExpr : Frontend_dRast.t_Expr) -> (let file = (sp).Base_dSource.f_Span_spanFile in (let headNames = (v_instanceHeadTypeNames headExpr) in (if (if (((v_declNamedInFile allDecls) (Elab_dTypes.v_dtClassName cls)) file) then true else (((v_anyDeclInFile allDecls) headNames) file)) then true else (v_anyGlobalHead headNames)))))

# 436 "Vuna/Compiler/Elab/Trait.vuna"
let v_instanceConstraintParts = (fun (mc0 : Frontend_dRast.t_Expr) -> (match mc0 with
  | Frontend_dRast.C_Expr_EVar (dtb__108, dtb__109) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Frontend_dRast_dName.v_rnameKey dtb__108); B_dData_dPair.f_Pair_second = B_dData_dList.C_List_Nil }))
  | Frontend_dRast.C_Expr_EApp (dtb__110, dtb__111, dtb__112) -> (match dtb__110 with
  | Frontend_dRast.C_Expr_EVar (dtb__113, dtb__114) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Frontend_dRast_dName.v_rnameKey dtb__113); B_dData_dPair.f_Pair_second = dtb__111 }))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
))

# 428 "Vuna/Compiler/Elab/Trait.vuna"
let rec v_constraintPartsOf = (fun (mc0 : Base_dSource.t_Span) (mc1 : Frontend_dRast.t_Expr B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__115, dtb__116) -> (match (v_instanceConstraintParts dtb__115) with
  | B_dData_dMaybe.C_Maybe_Nothing -> ((Base_dDiagnostics_dTc.v_tcErr0 mc0) Base_dDiagnostics_dTc.C_TcErr_ConstraintNotDict)
  | B_dData_dMaybe.C_Maybe_Just (dtb__117) -> ((Base_dCommon.v_bind ((v_constraintPartsOf mc0) dtb__116)) (fun (ps : (string, Frontend_dRast.t_Expr B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((B_dData_dList.C_List__x58__x58_ (dtb__117, ps))))))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (B_dData_dList.C_List_Nil))
  | _ -> failwith "DT: impossible branch"
))

# 523 "Vuna/Compiler/Elab/Trait.vuna"
let rec v_checkArgsAtKinds = (fun (mc0 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc1 : Elab_dTypes.t_Ctx) (mc2 : Elab_dTypes.t_Ec) (mc3 : Frontend_dRast.t_Expr B_dData_dList.t_List) (mc4 : Core_dTerm.t_Value B_dData_dList.t_List) (mc5 : Base_dSource.t_Span) -> (match mc3 with
  | B_dData_dList.C_List__x58__x58_ (dtb__118, dtb__119) -> (match mc4 with
  | B_dData_dList.C_List__x58__x58_ (dtb__120, dtb__121) -> ((Base_dCommon.v_bind ((((((Elab_dTerm_dImpl.v_checkTypeAtKind mc0) mc1) mc2) dtb__118) dtb__120) mc5)) (fun (q : (Core_dTerm.t_Term, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match q with
  | { B_dData_dPair.f_Pair_first = dtb__122; B_dData_dPair.f_Pair_second = dtb__123 } -> ((Base_dCommon.v_bind ((((((v_checkArgsAtKinds mc0) mc1) dtb__123) dtb__119) dtb__121) mc5)) (fun (r : (Core_dTerm.t_Term B_dData_dList.t_List, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match r with
  | { B_dData_dPair.f_Pair_first = dtb__124; B_dData_dPair.f_Pair_second = dtb__125 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ (dtb__122, dtb__124)); B_dData_dPair.f_Pair_second = dtb__125 }))
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

# 551 "Vuna/Compiler/Elab/Trait.vuna"
let rec v_closedTypeTerm = (fun (mc0 : Frontend_dRast.t_Expr) -> (match mc0 with
  | Frontend_dRast.C_Expr_EApp (dtb__126, dtb__127, dtb__128) -> (match (v_closedTypeTerm dtb__126) with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb__129) -> (match (v_closedTypeArgs dtb__127) with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb__130) -> (B_dData_dMaybe.C_Maybe_Just (((Elab_dMeta.v_foldAppTerms dtb__129) dtb__130)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Frontend_dRast.C_Expr_EVar (dtb__131, dtb__132) -> (B_dData_dMaybe.C_Maybe_Just ((Core_dTerm.C_Term_TGlobal ((Frontend_dRast_dName.v_rnameKey dtb__131)))))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
))
# 562 "Vuna/Compiler/Elab/Trait.vuna"
and v_closedTypeArgs = (fun (mc0 : Frontend_dRast.t_Expr B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__133, dtb__134) -> (match (v_closedTypeTerm dtb__133) with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb__135) -> (match (v_closedTypeArgs dtb__134) with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb__136) -> (B_dData_dMaybe.C_Maybe_Just ((B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__135; B_dData_dPair.f_Pair_second = Core_dTerm.C_Rig_Rig0 }, dtb__136))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (B_dData_dMaybe.C_Maybe_Just (B_dData_dList.C_List_Nil))
  | _ -> failwith "DT: impossible branch"
))

# 541 "Vuna/Compiler/Elab/Trait.vuna"
let rec v_closedTypeTerms = (fun (mc0 : Frontend_dRast.t_Expr B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__137, dtb__138) -> (match (v_closedTypeTerm dtb__137) with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb__139) -> (match (v_closedTypeTerms dtb__138) with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb__140) -> (B_dData_dMaybe.C_Maybe_Just ((B_dData_dList.C_List__x58__x58_ (dtb__139, dtb__140))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (B_dData_dMaybe.C_Maybe_Just (B_dData_dList.C_List_Nil))
  | _ -> failwith "DT: impossible branch"
))

# 579 "Vuna/Compiler/Elab/Trait.vuna"
let v_isLowerStart = (fun (n : string) -> (match (B_dData_dList.dtp_unpack n) with
  | B_dData_dList.C_List_Nil -> false
  | B_dData_dList.C_List__x58__x58_ (dtb__141, dtb__142) -> (if (dtb__141 >= 97) then (dtb__141 <= 122) else false)
  | _ -> failwith "DT: impossible branch"
))

# 609 "Vuna/Compiler/Elab/Trait.vuna"
let rec v_seedKindOf = (fun (mc0 : string) (mc1 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__143, dtb__144) -> (match dtb__143 with
  | { B_dData_dPair.f_Pair_first = dtb__145; B_dData_dPair.f_Pair_second = dtb__146 } -> (if (dtb__145 = mc0) then (B_dData_dMaybe.C_Maybe_Just (dtb__146)) else ((v_seedKindOf mc0) dtb__144))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 591 "Vuna/Compiler/Elab/Trait.vuna"
let rec v_teleMetasInit = (fun (mc0 : string B_dData_dList.t_List) (mc1 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc2 : Elab_dTypes.t_Ec) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__147, dtb__148) -> (match ((v_seedKindOf dtb__147) mc1) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__149) -> (match (((v_teleMetasInit dtb__148) mc1) mc2) with
  | { B_dData_dPair.f_Pair_first = dtb__150; B_dData_dPair.f_Pair_second = dtb__151 } -> { B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__147; B_dData_dPair.f_Pair_second = dtb__149 }, dtb__150)); B_dData_dPair.f_Pair_second = dtb__151 }
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> (let nd_uscrut7 = ((Elab_dTypes.v_newMeta Elab_dTypes.v_emptyCtx) mc2) in (match nd_uscrut7 with
  | { B_dData_dPair.f_Pair_first = dtb__152; B_dData_dPair.f_Pair_second = dtb__153 } -> (match dtb__152 with
  | Core_dTerm.C_Term_TMeta (dtb__154) -> (match (((v_teleMetasInit dtb__148) mc1) dtb__153) with
  | { B_dData_dPair.f_Pair_first = dtb__155; B_dData_dPair.f_Pair_second = dtb__156 } -> { B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__147; B_dData_dPair.f_Pair_second = (Core_dTerm.C_Term_TMeta (dtb__154)) }, dtb__155)); B_dData_dPair.f_Pair_second = dtb__156 }
  | _ -> failwith "DT: impossible branch"
)
  | _ -> (match (((v_teleMetasInit dtb__148) mc1) dtb__153) with
  | { B_dData_dPair.f_Pair_first = dtb__157; B_dData_dPair.f_Pair_second = dtb__158 } -> { B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__147; B_dData_dPair.f_Pair_second = dtb__152 }, dtb__157)); B_dData_dPair.f_Pair_second = dtb__158 }
  | _ -> failwith "DT: impossible branch"
)
)
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> { B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = mc2 }
  | _ -> failwith "DT: impossible branch"
))

# 615 "Vuna/Compiler/Elab/Trait.vuna"
let rec v_bareTeleSeeds = (fun (mc0 : Frontend_dRast.t_Expr B_dData_dList.t_List) (mc1 : Core_dTerm.t_Value B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__159, dtb__160) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__161, dtb__162) -> (match dtb__159 with
  | Frontend_dRast.C_Expr_EVar (dtb__163, dtb__164) -> (if (v_isLowerStart (Frontend_dRast_dName.v_rnameKey dtb__163)) then (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = (Frontend_dRast_dName.v_rnameKey dtb__163); B_dData_dPair.f_Pair_second = ((Core_dEval.v_quote 0) dtb__161) }, ((v_bareTeleSeeds dtb__160) dtb__162))) else ((v_bareTeleSeeds dtb__160) dtb__162))
  | _ -> ((v_bareTeleSeeds dtb__160) dtb__162)
)
  | _ -> B_dData_dList.C_List_Nil
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 627 "Vuna/Compiler/Elab/Trait.vuna"
let rec v_ctxBareTeleSeeds = (fun (mc0 : Elab_dTypes.t_DtClass B_dData_dList.t_List) (mc1 : Elab_dTypes.t_Ec) (mc2 : (string, Frontend_dRast.t_Expr B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__165, dtb__166) -> (match dtb__165 with
  | { B_dData_dPair.f_Pair_first = dtb__167; B_dData_dPair.f_Pair_second = dtb__168 } -> (match ((Elab_dDict.v_findClass dtb__167) mc0) with
  | B_dData_dMaybe.C_Maybe_Nothing -> (((v_ctxBareTeleSeeds mc0) mc1) dtb__166)
  | B_dData_dMaybe.C_Maybe_Just (dtb__169) -> (match ((Elab_dDict.v_dictArgKinds mc1) (Core_dTerm.C_Value_VNeutral ((Core_dTerm.C_Neutral_NGlobal ((Elab_dMeta.v_dictTypeName (Elab_dTypes.v_dtClassName dtb__169)), B_dData_dList.C_List_Nil))))) with
  | B_dData_dMaybe.C_Maybe_Nothing -> (((v_ctxBareTeleSeeds mc0) mc1) dtb__166)
  | B_dData_dMaybe.C_Maybe_Just (dtb__170) -> ((B_dData_dList.v_append ((v_bareTeleSeeds dtb__168) dtb__170)) (((v_ctxBareTeleSeeds mc0) mc1) dtb__166))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 655 "Vuna/Compiler/Elab/Trait.vuna"
let v_fallbackTeleKind = (fun (scanExprs : Frontend_dRast.t_Expr B_dData_dList.t_List) (v : string) -> ((Elab_dSig.v_arityFun ((Elab_dSig.v_exprMaxAppArityIn v) scanExprs)) (Core_dTerm.C_Term_TType (Core_dTerm.v_levelZero))))

# 643 "Vuna/Compiler/Elab/Trait.vuna"
let v_resolveTeleKind = (fun (mc0 : Frontend_dRast.t_Expr B_dData_dList.t_List) (mc1 : string) (mc2 : Core_dTerm.t_Term) (mc3 : Elab_dTypes.t_Ec) -> (match mc2 with
  | Core_dTerm.C_Term_TMeta (dtb__171) -> (match ((Core_dTerm.v_solsLookup dtb__171) (Elab_dTypes.v_ecSolsP mc3)) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__172) -> (let q = ((Core_dEval.v_quote 0) dtb__172) in (if ((Core_dTerm.v_hasFreeTermVar 0) q) then ((v_fallbackTeleKind mc0) mc1) else q))
  | B_dData_dMaybe.C_Maybe_Nothing -> ((v_fallbackTeleKind mc0) mc1)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> mc2
))

# 638 "Vuna/Compiler/Elab/Trait.vuna"
let rec v_resolveTeleKinds = (fun (mc0 : Frontend_dRast.t_Expr B_dData_dList.t_List) (mc1 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc2 : Elab_dTypes.t_Ec) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__173, dtb__174) -> (match dtb__173 with
  | { B_dData_dPair.f_Pair_first = dtb__175; B_dData_dPair.f_Pair_second = dtb__176 } -> (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__175; B_dData_dPair.f_Pair_second = ((((v_resolveTeleKind mc0) dtb__175) dtb__176) mc2) }, (((v_resolveTeleKinds mc0) dtb__174) mc2)))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 658 "Vuna/Compiler/Elab/Trait.vuna"
let rec v_exprFreeLower = (fun (mc0 : Frontend_dRast.t_Expr) -> (match mc0 with
  | Frontend_dRast.C_Expr_EAnn (dtb__177, dtb__178, dtb__179) -> ((B_dData_dList.v_append (v_exprFreeLower dtb__177)) (v_exprFreeLower dtb__178))
  | Frontend_dRast.C_Expr_EPi (dtb__180, dtb__181, dtb__182, dtb__183, dtb__184, dtb__185) -> ((B_dData_dList.v_append (v_exprFreeLower dtb__183)) (v_exprFreeLower dtb__184))
  | Frontend_dRast.C_Expr_EApp (dtb__186, dtb__187, dtb__188) -> ((B_dData_dList.v_append (v_exprFreeLower dtb__186)) ((B_dData_dList.v_concatMap v_exprFreeLower) dtb__187))
  | Frontend_dRast.C_Expr_EVar (dtb__189, dtb__190) -> (if (v_isLowerStart (Frontend_dRast_dName.v_rnameKey dtb__189)) then (B_dData_dList.C_List__x58__x58_ ((Frontend_dRast_dName.v_rnameKey dtb__189), B_dData_dList.C_List_Nil)) else B_dData_dList.C_List_Nil)
  | _ -> B_dData_dList.C_List_Nil
))

# 573 "Vuna/Compiler/Elab/Trait.vuna"
let v_instanceMono = (fun (e : Frontend_dRast.t_Expr) -> (match (v_exprFreeLower e) with
  | B_dData_dList.C_List_Nil -> true
  | _ -> false
))

# 665 "Vuna/Compiler/Elab/Trait.vuna"
let rec v_keepOutBanned = (fun (mc0 : (string, bool) B_dContainer_dHashMap.t_HashMap) (mc1 : string B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__191, dtb__192) -> (if ((((B_dContainer_dHashMap.v_member B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) dtb__191) mc0) then ((v_keepOutBanned mc0) dtb__192) else (B_dData_dList.C_List__x58__x58_ (dtb__191, ((v_keepOutBanned mc0) dtb__192))))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 587 "Vuna/Compiler/Elab/Trait.vuna"
let v_instanceTeleMetas = (fun (banned : (string, bool) B_dContainer_dHashMap.t_HashMap) (exprs : Frontend_dRast.t_Expr B_dData_dList.t_List) (seeds : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ec : Elab_dTypes.t_Ec) -> (((v_teleMetasInit (B_dData_dList.v_nubNames ((v_keepOutBanned banned) ((B_dData_dList.v_concatMap v_exprFreeLower) exprs)))) seeds) ec))

# 674 "Vuna/Compiler/Elab/Trait.vuna"
let rec v_instanceTeleCtxGo = (fun (mc0 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc1 : Elab_dTypes.t_Ctx) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__193, dtb__194) -> (match dtb__193 with
  | { B_dData_dPair.f_Pair_first = dtb__195; B_dData_dPair.f_Pair_second = dtb__196 } -> ((v_instanceTeleCtxGo dtb__194) (((Elab_dTypes.v_ctxBindValue dtb__195) ((Core_dEval.v_eval B_dData_dList.C_List_Nil) dtb__196)) mc1))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> mc1
  | _ -> failwith "DT: impossible branch"
))

# 671 "Vuna/Compiler/Elab/Trait.vuna"
let v_instanceTeleCtx = (fun (tele : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) -> ((v_instanceTeleCtxGo tele) Elab_dTypes.v_emptyCtx))

# 717 "Vuna/Compiler/Elab/Trait.vuna"
let v_ctxDictName = (fun (k : int) -> ("_ctx" ^ (bi_strFromInt k)))

# 712 "Vuna/Compiler/Elab/Trait.vuna"
let rec v_instBodyCtxGo = (fun (mc0 : Elab_dTypes.t_Ctx) (mc1 : Core_dTerm.t_Term B_dData_dList.t_List) (mc2 : int) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__197, dtb__198) -> (((v_instBodyCtxGo (((Elab_dTypes.v_ctxBindValue (v_ctxDictName mc2)) ((Core_dEval.v_eval (Elab_dTypes.v_ctxEnv mc0)) (((Core_dTerm.v_shift 0) mc2) dtb__197))) mc0)) dtb__198) (mc2 + 1))
  | B_dData_dList.C_List_Nil -> mc0
  | _ -> failwith "DT: impossible branch"
))

# 727 "Vuna/Compiler/Elab/Trait.vuna"
let rec v_instTeleLam = (fun (mc0 : Core_dTerm.t_Term) (mc1 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__199, dtb__200) -> (match dtb__199 with
  | { B_dData_dPair.f_Pair_first = dtb__201; B_dData_dPair.f_Pair_second = dtb__202 } -> (Core_dTerm.C_Term_TLam (dtb__201, Core_dTerm.C_Rig_Rig0, B_dData_dMaybe.C_Maybe_Nothing, Base_dSource.v_spanEmpty, ((v_instTeleLam mc0) dtb__200)))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> mc0
  | _ -> failwith "DT: impossible branch"
))

# 734 "Vuna/Compiler/Elab/Trait.vuna"
let rec v_instCtxLamGo = (fun (body : Core_dTerm.t_Term) (remaining : int) (k : int) -> (if (remaining <= 0) then body else (Core_dTerm.C_Term_TLam ((v_ctxDictName k), Core_dTerm.C_Rig_RigOmega, B_dData_dMaybe.C_Maybe_Nothing, Base_dSource.v_spanEmpty, (((v_instCtxLamGo body) (remaining - 1)) (k + 1))))))

# 731 "Vuna/Compiler/Elab/Trait.vuna"
let v_instCtxLam = (fun (body : Core_dTerm.t_Term) (nCtx : int) (k : int) -> (((v_instCtxLamGo body) (nCtx - k)) k))

# 750 "Vuna/Compiler/Elab/Trait.vuna"
let rec v_instTypeCtx = (fun (mc0 : Core_dTerm.t_Term) (mc1 : Core_dTerm.t_Term B_dData_dList.t_List) (mc2 : int) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__203, dtb__204) -> (((v_instTypeCtx (Core_dTerm.C_Term_TPi ((v_ctxDictName mc2), true, Core_dTerm.C_Rig_RigOmega, (((Core_dTerm.v_shift 0) mc2) dtb__203), mc0))) dtb__204) (mc2 - 1))
  | B_dData_dList.C_List_Nil -> mc0
  | _ -> failwith "DT: impossible branch"
))

# 755 "Vuna/Compiler/Elab/Trait.vuna"
let rec v_instTypeTele = (fun (mc0 : Core_dTerm.t_Term) (mc1 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__205, dtb__206) -> (match dtb__205 with
  | { B_dData_dPair.f_Pair_first = dtb__207; B_dData_dPair.f_Pair_second = dtb__208 } -> (Core_dTerm.C_Term_TPi (dtb__207, true, Core_dTerm.C_Rig_Rig0, dtb__208, ((v_instTypeTele mc0) dtb__206)))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> mc0
  | _ -> failwith "DT: impossible branch"
))

# 762 "Vuna/Compiler/Elab/Trait.vuna"
let v_canonicalMethodShort = (fun (name : string) -> (if ((Elab_dMeta.v_baseNameOf name) = "eq") then "==" else (if ((Elab_dMeta.v_baseNameOf name) = "neq") then "/=" else (if ((Elab_dMeta.v_baseNameOf name) = "lt") then "<" else (if ((Elab_dMeta.v_baseNameOf name) = "le") then "<=" else (if ((Elab_dMeta.v_baseNameOf name) = "gt") then ">" else (if ((Elab_dMeta.v_baseNameOf name) = "ge") then ">=" else (if ((Elab_dMeta.v_baseNameOf name) = "add") then "+" else (if ((Elab_dMeta.v_baseNameOf name) = "sub") then "-" else (if ((Elab_dMeta.v_baseNameOf name) = "mul") then "*" else (if ((Elab_dMeta.v_baseNameOf name) = "div") then "/" else (if ((Elab_dMeta.v_baseNameOf name) = "bind") then ">>=" else (let other = (Elab_dMeta.v_baseNameOf name) in other)))))))))))))

# 778 "Vuna/Compiler/Elab/Trait.vuna"
let v_sameMethodShort = (fun (a : string) (b : string) -> ((v_canonicalMethodShort a) = (v_canonicalMethodShort b)))

# 781 "Vuna/Compiler/Elab/Trait.vuna"
let rec v_anySameMethod = (fun (mc0 : string) (mc1 : string B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__209, dtb__210) -> (if ((v_sameMethodShort mc0) dtb__209) then true else ((v_anySameMethod mc0) dtb__210))
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 789 "Vuna/Compiler/Elab/Trait.vuna"
let rec v_firstUnknownInstanceMethodGo = (fun (mc0 : string B_dData_dList.t_List) (mc1 : Frontend_dRast.t_Decl B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__211, dtb__212) -> (match dtb__211 with
  | Frontend_dRast.C_Decl_DFun (dtb__213, dtb__214, dtb__215, dtb__216) -> (if ((v_anySameMethod (Elab_dMeta.v_baseNameOf dtb__213)) mc0) then ((v_firstUnknownInstanceMethodGo mc0) dtb__212) else (B_dData_dMaybe.C_Maybe_Just (dtb__213)))
  | _ -> ((v_firstUnknownInstanceMethodGo mc0) dtb__212)
)
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 785 "Vuna/Compiler/Elab/Trait.vuna"
let v_firstUnknownInstanceMethod = (fun (cls : Elab_dTypes.t_DtClass) (methods : Frontend_dRast.t_Decl B_dData_dList.t_List) -> ((v_firstUnknownInstanceMethodGo ((B_dData_dList.v_map (fun (m : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair) -> (Elab_dMeta.v_baseNameOf (B_dData_dPair.v_firstOf m)))) (cls).Elab_dTypes.f_DtClass_dtClassMethods)) methods))

# 804 "Vuna/Compiler/Elab/Trait.vuna"
let rec v_firstDuplicateInstanceMethodGo = (fun (mc0 : string B_dData_dList.t_List) (mc1 : Frontend_dRast.t_Decl B_dData_dList.t_List) (mc2 : (string, string) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__217, dtb__218) -> (match dtb__217 with
  | Frontend_dRast.C_Decl_DFun (dtb__219, dtb__220, dtb__221, dtb__222) -> (let short = (Elab_dMeta.v_baseNameOf dtb__219) in (if ((v_anySameMethod short) mc0) then (let canon = (v_canonicalMethodShort short) in (match ((B_dData_dList.v_lookupPair canon) mc2) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__223) -> (if (dtb__223 = short) then (((v_firstDuplicateInstanceMethodGo mc0) dtb__218) mc2) else (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = canon; B_dData_dPair.f_Pair_second = dtb__222 })))
  | B_dData_dMaybe.C_Maybe_Nothing -> (((v_firstDuplicateInstanceMethodGo mc0) dtb__218) (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = canon; B_dData_dPair.f_Pair_second = short }, mc2)))
  | _ -> failwith "DT: impossible branch"
)) else (((v_firstDuplicateInstanceMethodGo mc0) dtb__218) mc2)))
  | _ -> (((v_firstDuplicateInstanceMethodGo mc0) dtb__218) mc2)
)
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 800 "Vuna/Compiler/Elab/Trait.vuna"
let v_firstDuplicateInstanceMethod = (fun (cls : Elab_dTypes.t_DtClass) (methods : Frontend_dRast.t_Decl B_dData_dList.t_List) -> (((v_firstDuplicateInstanceMethodGo ((B_dData_dList.v_map (fun (m : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair) -> (Elab_dMeta.v_baseNameOf (B_dData_dPair.v_firstOf m)))) (cls).Elab_dTypes.f_DtClass_dtClassMethods)) methods) B_dData_dList.C_List_Nil))

# 834 "Vuna/Compiler/Elab/Trait.vuna"
let rec v_hasMethodClauses = (fun (mc0 : string) (mc1 : Frontend_dRast.t_Decl B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__224, dtb__225) -> (match dtb__224 with
  | Frontend_dRast.C_Decl_DFun (dtb__226, dtb__227, dtb__228, dtb__229) -> (if ((v_sameMethodShort dtb__226) mc0) then true else ((v_hasMethodClauses mc0) dtb__225))
  | _ -> ((v_hasMethodClauses mc0) dtb__225)
)
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 826 "Vuna/Compiler/Elab/Trait.vuna"
let rec v_firstMissingInstanceMethodGo = (fun (mc0 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc1 : Frontend_dRast.t_Decl B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__230, dtb__231) -> (if ((v_hasMethodClauses (Elab_dMeta.v_baseNameOf (B_dData_dPair.v_firstOf dtb__230))) mc1) then ((v_firstMissingInstanceMethodGo dtb__231) mc1) else (B_dData_dMaybe.C_Maybe_Just ((B_dData_dPair.v_firstOf dtb__230))))
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 823 "Vuna/Compiler/Elab/Trait.vuna"
let v_firstMissingInstanceMethod = (fun (cls : Elab_dTypes.t_DtClass) (methods : Frontend_dRast.t_Decl B_dData_dList.t_List) -> ((v_firstMissingInstanceMethodGo (cls).Elab_dTypes.f_DtClass_dtClassMethods) methods))

# 845 "Vuna/Compiler/Elab/Trait.vuna"
let rec v_findTraitDecl = (fun (mc0 : string) (mc1 : (Frontend_dRast.t_Decl, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__232, dtb__233) -> (match dtb__232 with
  | { B_dData_dPair.f_Pair_first = dtb__234; B_dData_dPair.f_Pair_second = dtb__235 } -> (match dtb__234 with
  | Frontend_dRast.C_Decl_DTrait (dtb__236, dtb__237, dtb__238, dtb__239, dtb__240) -> (if (dtb__236 = mc0) then (B_dData_dMaybe.C_Maybe_Just (dtb__234)) else ((v_findTraitDecl mc0) dtb__233))
  | _ -> ((v_findTraitDecl mc0) dtb__233)
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 853 "Vuna/Compiler/Elab/Trait.vuna"
let rec v_findTraitMethodSpan = (fun (mc0 : string) (mc1 : Frontend_dRast.t_TraitMethod B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__241, dtb__242) -> (if ((Frontend_dRast.v_traitMethodName dtb__241) = mc0) then (B_dData_dMaybe.C_Maybe_Just ((Frontend_dRast.v_traitMethodSpan dtb__241))) else ((v_findTraitMethodSpan mc0) dtb__242))
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 858 "Vuna/Compiler/Elab/Trait.vuna"
let v_traitMethodSpanOf = (fun (cls : Elab_dTypes.t_DtClass) (mname : string) (decls : (Frontend_dRast.t_Decl, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (let nd_uscrut3 = ((v_findTraitDecl (Elab_dTypes.v_dtClassName cls)) decls) in (match nd_uscrut3 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__243) -> (match dtb__243 with
  | Frontend_dRast.C_Decl_DTrait (dtb__244, dtb__245, dtb__246, dtb__247, dtb__248) -> ((v_findTraitMethodSpan mname) dtb__247)
  | _ -> ((B_dData_dList.v_lookupPair mname) (cls).Elab_dTypes.f_DtClass_dtClassMethodSpans)
)
  | _ -> ((B_dData_dList.v_lookupPair mname) (cls).Elab_dTypes.f_DtClass_dtClassMethodSpans)
)))

# 865 "Vuna/Compiler/Elab/Trait.vuna"
let v_ctorResultType = (fun (cls : Elab_dTypes.t_DtClass) (args : Core_dTerm.t_Term B_dData_dList.t_List) -> ((Elab_dMeta.v_foldAppTerms (Core_dTerm.C_Term_TGlobal ((Elab_dMeta.v_dictTypeName (Elab_dTypes.v_dtClassName cls))))) ((B_dData_dList.v_map (fun (a : Core_dTerm.t_Term) -> { B_dData_dPair.f_Pair_first = a; B_dData_dPair.f_Pair_second = Core_dTerm.C_Rig_Rig0 })) args)))

# 680 "Vuna/Compiler/Elab/Trait.vuna"
let rec v_elabConstraintDomains = (fun (mc0 : Elab_dTypes.t_DtClass B_dData_dList.t_List) (mc1 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc2 : Elab_dTypes.t_Ctx) (mc3 : (string, Frontend_dRast.t_Expr B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc4 : Base_dSource.t_Span) (mc5 : Elab_dTypes.t_Ec) -> (match mc3 with
  | B_dData_dList.C_List__x58__x58_ (dtb__249, dtb__250) -> (match dtb__249 with
  | { B_dData_dPair.f_Pair_first = dtb__251; B_dData_dPair.f_Pair_second = dtb__252 } -> (match ((Elab_dDict.v_findClass dtb__251) mc0) with
  | B_dData_dMaybe.C_Maybe_Nothing -> (((Base_dDiagnostics_dTc.v_tcErr1 mc4) (Base_dDiagnostics_dTc.C_TcErr_UnknownInterface (dtb__251))) dtb__251)
  | B_dData_dMaybe.C_Maybe_Just (dtb__253) -> (match ((Elab_dDict.v_dictArgKinds mc5) (Core_dTerm.C_Value_VNeutral ((Core_dTerm.C_Neutral_NGlobal ((Elab_dMeta.v_dictTypeName (Elab_dTypes.v_dtClassName dtb__253)), B_dData_dList.C_List_Nil))))) with
  | B_dData_dMaybe.C_Maybe_Nothing -> ((Base_dDiagnostics_dTc.v_tcErr0 mc4) Base_dDiagnostics_dTc.C_TcErr_ConstraintNotDict)
  | B_dData_dMaybe.C_Maybe_Just (dtb__254) -> (let _u = (if ((dtp_log_on 3) "Vuna.Compiler.Elab.Trait") then (((dtp_log_emit 3) "Vuna.Compiler.Elab.Trait") (String.concat "" ["constraint-dom: "; dtb__251; " args="; (bi_strFromInt (B_dData_dList.v_length dtb__252)); " kinds="; (bi_strFromInt (B_dData_dList.v_length dtb__254))])) else 0) in (if ((B_dData_dList.v_length dtb__254) <> (B_dData_dList.v_length dtb__252)) then ((Base_dDiagnostics_dTc.v_tcErr0 mc4) Base_dDiagnostics_dTc.C_TcErr_ConstraintNotDict) else ((Base_dCommon.v_bind ((((((v_checkArgsAtKinds mc1) mc2) mc5) dtb__252) dtb__254) mc4)) (fun (q : (Core_dTerm.t_Term B_dData_dList.t_List, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match q with
  | { B_dData_dPair.f_Pair_first = dtb__255; B_dData_dPair.f_Pair_second = dtb__256 } -> ((Base_dCommon.v_bind ((((((v_elabConstraintDomains mc0) mc1) mc2) dtb__250) mc4) dtb__256)) (fun (r : (Core_dTerm.t_Term B_dData_dList.t_List, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match r with
  | { B_dData_dPair.f_Pair_first = dtb__257; B_dData_dPair.f_Pair_second = dtb__258 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ (((v_ctorResultType dtb__253) dtb__255), dtb__257)); B_dData_dPair.f_Pair_second = dtb__258 }))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))))
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
let v_elabTraitFinal = (fun (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ec : Elab_dTypes.t_Ec) (tname : string) (paramNames : string B_dData_dList.t_List) (superParts : (string, Frontend_dRast.t_Expr B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (methods : Frontend_dRast.t_TraitMethod B_dData_dList.t_List) (methodsP : (string, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (pKinds : Core_dTerm.t_Term B_dData_dList.t_List) (fieldTys : Core_dTerm.t_Term B_dData_dList.t_List) (sp : Base_dSource.t_Span) -> (let paramsKinds = ((B_dData_dList.v_zip paramNames) pKinds) in (let classCtx = ((v_bindClassParams paramsKinds) Elab_dTypes.v_emptyCtx) in ((Base_dCommon.v_bind ((((((v_elabConstraintDomains (Elab_dTypes.v_ecClasses ec)) globals) classCtx) superParts) sp) ec)) (fun (pq : (Core_dTerm.t_Term B_dData_dList.t_List, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match pq with
  | { B_dData_dPair.f_Pair_first = dtb__259; B_dData_dPair.f_Pair_second = dtb__260 } -> (let nFields = (B_dData_dList.v_length fieldTys) in (let dname = (Elab_dMeta.v_dictTypeName tname) in (let cname = (Elab_dMeta.v_dictCtorName tname) in (let dapp = ((v_dictAppTermOf dname) paramNames) in (let ctorTy = ((v_foldParamPis paramsKinds) ((v_foldPiFieldTys fieldTys) dapp)) in (let tele = (Elab_dMeta.v_teleOfType ctorTy) in (let dd = { Elab_dTypes.f_DtData_dtDataName = dname; Elab_dTypes.f_DtData_dtDataParams = tele; Elab_dTypes.f_DtData_dtDataCtors = (B_dData_dList.C_List__x58__x58_ ({ Elab_dTypes.f_DtCtor_dtCtorName = cname; Elab_dTypes.f_DtCtor_dtCtorFamily = dname; Elab_dTypes.f_DtCtor_dtCtorTelescope = tele; Elab_dTypes.f_DtCtor_dtCtorType = ctorTy; Elab_dTypes.f_DtCtor_dtCtorSpan = B_dData_dMaybe.C_Maybe_Nothing }, B_dData_dList.C_List_Nil)); Elab_dTypes.f_DtData_dtDataKind = ((v_foldParamPis paramsKinds) (Core_dTerm.C_Term_TType (Core_dTerm.v_levelZero))); Elab_dTypes.f_DtData_dtDataViaClasses = B_dData_dList.C_List_Nil; Elab_dTypes.f_DtData_dtDataLinear = false; Elab_dTypes.f_DtData_dtDataRepr = Frontend_dAst.C_ReprTier_ReprAuto; Elab_dTypes.f_DtData_dtDataFields = B_dData_dList.C_List_Nil; Elab_dTypes.f_DtData_dtDataIsRecord = false } in (let projs = (((((v_methodProjections tname) paramNames) pKinds) methodsP) fieldTys) in (let projSpans = ((B_dData_dList.v_map (fun (m : Frontend_dRast.t_TraitMethod) -> { B_dData_dPair.f_Pair_first = (Frontend_dRast.v_traitMethodName m); B_dData_dPair.f_Pair_second = (Frontend_dRast.v_traitMethodSpan m) })) methods) in (let fieldCtx = ((v_bindClassParams paramsKinds) Elab_dTypes.v_emptyCtx) in (let opaqueFields = ((B_dData_dList.v_map (fun (t : Core_dTerm.t_Term) -> (if (((Elab_dMeta.v_isOpaqueRuntimeTyIn dtb__260) fieldCtx) ((Core_dEval.v_eval (Elab_dTypes.v_ctxEnv fieldCtx)) t)) then true else (Elab_dMeta.v_valueHasImplicitPi ((Core_dEval.v_eval (Elab_dTypes.v_ctxEnv fieldCtx)) t))))) fieldTys) in (let projBodies = ((((((v_projectionDefsOpaque opaqueFields) tname) (B_dData_dList.v_length paramNames)) methodsP) fieldTys) nFields) in (let cls = { Elab_dTypes.f_DtClass_dtClassName = tname; Elab_dTypes.f_DtClass_dtClassParams = paramNames; Elab_dTypes.f_DtClass_dtClassSupers = dtb__259; Elab_dTypes.f_DtClass_dtClassMethods = projs; Elab_dTypes.f_DtClass_dtClassFieldTys = fieldTys; Elab_dTypes.f_DtClass_dtClassMethodSpans = projSpans } in (let ec2 = ((Elab_dTypes.v_ecAddClass ((Elab_dTypes.v_ecAddData dtb__260) dd)) cls) in (let ec3 = ((v_foldlAddDef ec2) projBodies) in (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dd; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = projs; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = cls; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = projSpans; B_dData_dPair.f_Pair_second = ec3 } } } })))))))))))))))))
  | _ -> failwith "DT: impossible branch"
))))))

# 87 "Vuna/Compiler/Elab/Trait.vuna"
let v_elabTraitKinds = (fun (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ec : Elab_dTypes.t_Ec) (tname : string) (params : Frontend_dRast.t_TraitParam B_dData_dList.t_List) (supers : Frontend_dRast.t_Expr B_dData_dList.t_List) (methods : Frontend_dRast.t_TraitMethod B_dData_dList.t_List) (methodsP : (string, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (pKinds : Core_dTerm.t_Term B_dData_dList.t_List) (sp : Base_dSource.t_Span) -> (let paramNames = (v_traitParamNames params) in (let paramsKinds = ((B_dData_dList.v_zip paramNames) pKinds) in ((Base_dCommon.v_bind ((v_constraintPartsOf sp) supers)) (fun (superParts : (string, Frontend_dRast.t_Expr B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) -> ((Base_dCommon.v_bind ((((v_classFieldTys globals) ec) paramsKinds) methodsP)) (fun (p : (Core_dTerm.t_Term B_dData_dList.t_List, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> ((((((((((v_elabTraitFinal globals) (B_dData_dPair.v_secondOf p)) tname) paramNames) superParts) methods) methodsP) pKinds) (B_dData_dPair.v_firstOf p)) sp))))))))

# 73 "Vuna/Compiler/Elab/Trait.vuna"
let v_elabTrait = (fun (mc0 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc1 : Elab_dTypes.t_Ec) (mc2 : (Frontend_dRast.t_Decl, Base_dSource.t_Span) B_dData_dPair.t_Pair) -> (match mc2 with
  | { B_dData_dPair.f_Pair_first = dtb__261; B_dData_dPair.f_Pair_second = dtb__262 } -> (match dtb__261 with
  | Frontend_dRast.C_Decl_DTrait (dtb__263, dtb__264, dtb__265, dtb__266, dtb__267) -> (if ((B_dData_dList.v_length dtb__264) = 0) then ((Base_dDiagnostics_dTc.v_tcErr0 dtb__267) Base_dDiagnostics_dTc.C_TcErr_InterfaceNoParam) else (let methodsP = (v_traitMethodPairs dtb__266) in ((Base_dCommon.v_bind ((((v_traitParamKinds mc0) mc1) dtb__264) methodsP)) (fun (pk : (Core_dTerm.t_Term B_dData_dList.t_List, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (((((((((v_elabTraitKinds mc0) (B_dData_dPair.v_secondOf pk)) dtb__263) dtb__264) dtb__265) dtb__266) methodsP) (B_dData_dPair.v_firstOf pk)) dtb__267)))))
  | _ -> ((Elab_dTypes.v_errAt dtb__262) "DT: internal: expected a trait declaration")
)
  | _ -> failwith "DT: impossible branch"
))

# 488 "Vuna/Compiler/Elab/Trait.vuna"
let v_elabInstanceConstrained = (fun (classes : Elab_dTypes.t_DtClass B_dData_dList.t_List) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (defined : string B_dData_dList.t_List) (ec0 : Elab_dTypes.t_Ec) (sp : Base_dSource.t_Span) (cls : Elab_dTypes.t_DtClass) (argExprs : Frontend_dRast.t_Expr B_dData_dList.t_List) (ctxParts : (string, Frontend_dRast.t_Expr B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (let ctxArgs = ((B_dData_dList.v_concatMap (fun (p : (string, Frontend_dRast.t_Expr B_dData_dList.t_List) B_dData_dPair.t_Pair) -> (B_dData_dPair.v_secondOf p))) ctxParts) in (let banned = (Elab_dSig.v_topQuantBanned defined) in (let scanExprs = ((B_dData_dList.v_append argExprs) ctxArgs) in (let kindMaybe = ((Elab_dDict.v_dictArgKinds ec0) (Core_dTerm.C_Value_VNeutral ((Core_dTerm.C_Neutral_NGlobal ((Elab_dMeta.v_dictTypeName (Elab_dTypes.v_dtClassName cls)), B_dData_dList.C_List_Nil))))) in (match kindMaybe with
  | B_dData_dMaybe.C_Maybe_Nothing -> ((Base_dDiagnostics_dTc.v_tcErr0 sp) Base_dDiagnostics_dTc.C_TcErr_InstanceHeadNotApp)
  | B_dData_dMaybe.C_Maybe_Just (dtb__268) -> (if ((B_dData_dList.v_length dtb__268) <> (B_dData_dList.v_length argExprs)) then ((Base_dDiagnostics_dTc.v_tcErr0 sp) Base_dDiagnostics_dTc.C_TcErr_InstanceHeadNotApp) else (let seeds = ((B_dData_dList.v_append ((v_bareTeleSeeds argExprs) dtb__268)) (((v_ctxBareTeleSeeds classes) ec0) ctxParts)) in (let init = ((((v_instanceTeleMetas banned) scanExprs) seeds) ec0) in (let tele0 = (B_dData_dPair.v_firstOf init) in (let ec1 = (B_dData_dPair.v_secondOf init) in (let teleCtx0 = (v_instanceTeleCtx tele0) in ((Base_dCommon.v_bind ((((((v_checkArgsAtKinds globals) teleCtx0) ec1) argExprs) dtb__268) sp)) (fun (q : (Core_dTerm.t_Term B_dData_dList.t_List, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match q with
  | { B_dData_dPair.f_Pair_first = dtb__269; B_dData_dPair.f_Pair_second = dtb__270 } -> ((Base_dCommon.v_bind ((((((v_elabConstraintDomains classes) globals) teleCtx0) ctxParts) sp) dtb__270)) (fun (r : (Core_dTerm.t_Term B_dData_dList.t_List, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match r with
  | { B_dData_dPair.f_Pair_first = dtb__271; B_dData_dPair.f_Pair_second = dtb__272 } -> (let tele = (((v_resolveTeleKinds scanExprs) tele0) dtb__272) in (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = { f_InstSigInfo_instSigClass = (Elab_dTypes.v_dtClassName cls); f_InstSigInfo_instSigTele = tele; f_InstSigInfo_instSigCtx = dtb__271; f_InstSigInfo_instSigArgs = dtb__269; f_InstSigInfo_instSigHead = ((v_ctorResultType cls) dtb__269) }; B_dData_dPair.f_Pair_second = dtb__272 })))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))))))))
  | _ -> failwith "DT: impossible branch"
))))))

# 457 "Vuna/Compiler/Elab/Trait.vuna"
let v_elabInstanceSig = (fun (classes : Elab_dTypes.t_DtClass B_dData_dList.t_List) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (defined : string B_dData_dList.t_List) (ec0 : Elab_dTypes.t_Ec) (sp : Base_dSource.t_Span) (headExpr : Frontend_dRast.t_Expr) (ctxE : Frontend_dRast.t_Expr B_dData_dList.t_List) -> (match (v_instanceHeadParts headExpr) with
  | B_dData_dMaybe.C_Maybe_Nothing -> ((Base_dDiagnostics_dTc.v_tcErr0 sp) Base_dDiagnostics_dTc.C_TcErr_InstanceHeadNotApp)
  | B_dData_dMaybe.C_Maybe_Just (dtb__273) -> (match ((Elab_dDict.v_findClass (B_dData_dPair.v_firstOf dtb__273)) classes) with
  | B_dData_dMaybe.C_Maybe_Nothing -> (((Base_dDiagnostics_dTc.v_tcErr1 sp) (Base_dDiagnostics_dTc.C_TcErr_UnknownInterface ((B_dData_dPair.v_firstOf dtb__273)))) (B_dData_dPair.v_firstOf dtb__273))
  | B_dData_dMaybe.C_Maybe_Just (dtb__274) -> (match (B_dData_dPair.v_secondOf dtb__273) with
  | dtb__275 -> (if ((B_dData_dList.v_length dtb__275) <> (B_dData_dList.v_length (dtb__274).Elab_dTypes.f_DtClass_dtClassParams)) then ((Base_dDiagnostics_dTc.v_tcErr0 sp) Base_dDiagnostics_dTc.C_TcErr_InstanceHeadNotApp) else ((Base_dCommon.v_bind ((v_constraintPartsOf sp) ctxE)) (fun (ctxParts : (string, Frontend_dRast.t_Expr B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) -> ((((((((v_elabInstanceConstrained classes) globals) defined) ec0) sp) dtb__274) dtb__275) ctxParts))))
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 881 "Vuna/Compiler/Elab/Trait.vuna"
let rec v_zipMethodFields = (fun (mc0 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc1 : Core_dTerm.t_Term B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__276, dtb__277) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__278, dtb__279) -> (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = (B_dData_dPair.v_firstOf dtb__276); B_dData_dPair.f_Pair_second = dtb__278 }, ((v_zipMethodFields dtb__277) dtb__279)))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 878 "Vuna/Compiler/Elab/Trait.vuna"
let v_zipClassFields = (fun (cls : Elab_dTypes.t_DtClass) -> ((v_zipMethodFields (cls).Elab_dTypes.f_DtClass_dtClassMethods) (cls).Elab_dTypes.f_DtClass_dtClassFieldTys))

# 939 "Vuna/Compiler/Elab/Trait.vuna"
let rec v_instArgAt = (fun (mc0 : int) (mc1 : Core_dTerm.t_Term B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__280, dtb__281) -> (if (mc0 <= 0) then dtb__280 else ((v_instArgAt (mc0 - 1)) dtb__281))
  | B_dData_dList.C_List_Nil -> (Core_dTerm.C_Term_TGlobal ("Int"))
  | _ -> failwith "DT: impossible branch"
))

# 893 "Vuna/Compiler/Elab/Trait.vuna"
let rec v_substInstParamsGo = (fun (mc0 : int) (mc1 : Core_dTerm.t_Term B_dData_dList.t_List) (mc2 : int) (mc3 : Core_dTerm.t_Term) -> (match mc3 with
  | Core_dTerm.C_Term_TIf (dtb__282, dtb__283, dtb__284) -> (Core_dTerm.C_Term_TIf (((((v_substInstParamsGo mc0) mc1) mc2) dtb__282), ((((v_substInstParamsGo mc0) mc1) mc2) dtb__283), ((((v_substInstParamsGo mc0) mc1) mc2) dtb__284)))
  | Core_dTerm.C_Term_TCase (dtb__285, dtb__286) -> (Core_dTerm.C_Term_TCase (((((v_substInstParamsGo mc0) mc1) mc2) dtb__285), ((B_dData_dList.v_map (fun (alt : Core_dTerm.t_CaseAlt) -> ((((v_substInstParamsAlt mc0) mc1) mc2) alt))) dtb__286)))
  | Core_dTerm.C_Term_TMk (dtb__287, dtb__288) -> (Core_dTerm.C_Term_TMk (dtb__287, ((B_dData_dList.v_map (fun (p : (Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair) -> { B_dData_dPair.f_Pair_first = ((((v_substInstParamsGo mc0) mc1) mc2) (B_dData_dPair.v_firstOf p)); B_dData_dPair.f_Pair_second = (B_dData_dPair.v_secondOf p) })) dtb__288)))
  | Core_dTerm.C_Term_TCon (dtb__289, dtb__290) -> (Core_dTerm.C_Term_TCon (dtb__289, ((B_dData_dList.v_map (fun (p : (Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair) -> { B_dData_dPair.f_Pair_first = ((((v_substInstParamsGo mc0) mc1) mc2) (B_dData_dPair.v_firstOf p)); B_dData_dPair.f_Pair_second = (B_dData_dPair.v_secondOf p) })) dtb__290)))
  | Core_dTerm.C_Term_TApp (dtb__291, dtb__292, dtb__293) -> (Core_dTerm.C_Term_TApp (((((v_substInstParamsGo mc0) mc1) mc2) dtb__291), ((((v_substInstParamsGo mc0) mc1) mc2) dtb__292), dtb__293))
  | Core_dTerm.C_Term_TLam (dtb__294, dtb__295, dtb__296, dtb__297, dtb__298) -> (let slot2 = (let nd_uscrut9 = dtb__296 in (match nd_uscrut9 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__299) -> (match dtb__299 with
  | { B_dData_dPair.f_Pair_first = dtb__300; B_dData_dPair.f_Pair_second = dtb__301 } -> (match dtb__301 with
  | { B_dData_dPair.f_Pair_first = dtb__302; B_dData_dPair.f_Pair_second = dtb__303 } -> (let bt2 = (match dtb__302 with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb__305) -> (B_dData_dMaybe.C_Maybe_Just (((((v_substInstParamsGo mc0) mc1) mc2) dtb__305)))
  | _ -> failwith "DT: impossible branch"
) in (let rt2 = (match dtb__303 with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb__304) -> (B_dData_dMaybe.C_Maybe_Just (((((v_substInstParamsGo mc0) mc1) (mc2 + 1)) dtb__304)))
  | _ -> failwith "DT: impossible branch"
) in (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = dtb__300; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = bt2; B_dData_dPair.f_Pair_second = rt2 } }))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) in (Core_dTerm.C_Term_TLam (dtb__294, dtb__295, slot2, dtb__297, ((((v_substInstParamsGo mc0) mc1) (mc2 + 1)) dtb__298))))
  | Core_dTerm.C_Term_TPi (dtb__306, dtb__307, dtb__308, dtb__309, dtb__310) -> (Core_dTerm.C_Term_TPi (dtb__306, dtb__307, dtb__308, ((((v_substInstParamsGo mc0) mc1) mc2) dtb__309), ((((v_substInstParamsGo mc0) mc1) (mc2 + 1)) dtb__310)))
  | Core_dTerm.C_Term_TVar (dtb__311, dtb__312, dtb__313) -> (if (dtb__312 >= mc2) then (if ((dtb__312 - mc2) < mc0) then (((Core_dTerm.v_shift 0) mc2) ((v_instArgAt ((mc0 - 1) - (dtb__312 - mc2))) mc1)) else mc3) else mc3)
  | _ -> mc3
))
# 935 "Vuna/Compiler/Elab/Trait.vuna"
and v_substInstParamsAlt = (fun (mc0 : int) (mc1 : Core_dTerm.t_Term B_dData_dList.t_List) (mc2 : int) (mc3 : Core_dTerm.t_CaseAlt) -> (match mc3 with
  | { Core_dTerm.f_CaseAlt_caseAltName = dtb__314; Core_dTerm.f_CaseAlt_caseAltBinders = dtb__315; Core_dTerm.f_CaseAlt_caseAltBody = dtb__316 } -> { Core_dTerm.f_CaseAlt_caseAltName = dtb__314; Core_dTerm.f_CaseAlt_caseAltBinders = dtb__315; Core_dTerm.f_CaseAlt_caseAltBody = ((((v_substInstParamsGo mc0) mc1) (mc2 + (B_dData_dList.v_length dtb__315))) dtb__316) }
  | _ -> failwith "DT: impossible branch"
))

# 890 "Vuna/Compiler/Elab/Trait.vuna"
let v_substInstParams = (fun (args : Core_dTerm.t_Term B_dData_dList.t_List) (t : Core_dTerm.t_Term) -> ((((v_substInstParamsGo (B_dData_dList.v_length args)) args) 0) t))

# 337 "Vuna/Compiler/Elab/Trait.vuna"
let rec v_checkSuperClasses = (fun (mc0 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc1 : Elab_dTypes.t_Ctx) (mc2 : int) (mc3 : string) (mc4 : Base_dSource.t_Span) (mc5 : Core_dTerm.t_Term B_dData_dList.t_List) (mc6 : Core_dTerm.t_Term B_dData_dList.t_List) (mc7 : Elab_dTypes.t_Ec) -> (match mc6 with
  | B_dData_dList.C_List__x58__x58_ (dtb__317, dtb__318) -> (let goal = ((Elab_dTypes.v_evalCtx mc1) (((Core_dTerm.v_shift 0) mc2) ((v_substInstParams mc5) dtb__317))) in (let nd_uscrut12 = (((((Elab_dDict.v_searchInstanceIn mc0) mc1) mc7) goal) mc4) in (match nd_uscrut12 with
  | Base_dDiag.C_Check_OkC (dtb__319) -> (match dtb__319 with
  | { B_dData_dPair.f_Pair_first = dtb__320; B_dData_dPair.f_Pair_second = dtb__321 } -> ((((((((v_checkSuperClasses mc0) mc1) mc2) mc3) mc4) mc5) dtb__318) dtb__321)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dDiag.C_Check_ErrC (dtb__322) -> ((((Base_dDiagnostics_dTc.v_tcErr2 mc4) (Base_dDiagnostics_dTc.C_TcErr_SuperclassNotSatisfied (mc3, (Core_dEval.v_showValue goal)))) mc3) (Core_dEval.v_showValue goal))
  | _ -> failwith "DT: impossible branch"
)))
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (mc7))
  | _ -> failwith "DT: impossible branch"
))

# 964 "Vuna/Compiler/Elab/Trait.vuna"
let rec v_methodClausesGo = (fun (mc0 : string) (mc1 : Frontend_dRast.t_Decl B_dData_dList.t_List) (mc2 : (Frontend_dRast.t_Pat B_dData_dList.t_List, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__323, dtb__324) -> (match dtb__323 with
  | Frontend_dRast.C_Decl_DFun (dtb__325, dtb__326, dtb__327, dtb__328) -> (if ((v_sameMethodShort dtb__325) mc0) then (((v_methodClausesGo mc0) dtb__324) (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__326; B_dData_dPair.f_Pair_second = dtb__327 }, mc2))) else (((v_methodClausesGo mc0) dtb__324) mc2))
  | _ -> (((v_methodClausesGo mc0) dtb__324) mc2)
)
  | B_dData_dList.C_List_Nil -> (B_dData_dList.v_reverse mc2)
  | _ -> failwith "DT: impossible branch"
))

# 961 "Vuna/Compiler/Elab/Trait.vuna"
let v_methodClausesNamed = (fun (mname : string) (decls : Frontend_dRast.t_Decl B_dData_dList.t_List) -> (((v_methodClausesGo mname) decls) B_dData_dList.C_List_Nil))

# 1023 "Vuna/Compiler/Elab/Trait.vuna"
let v_ctxDictDomEqual = (fun (ec : Elab_dTypes.t_Ec) (depth : int) (a : Core_dTerm.t_Value) (b : Core_dTerm.t_Value) -> (match (((((Core_dConv.v_conv (Elab_dTypes.v_ecDefTbl ec)) (Elab_dTypes.v_ecSolsP ec)) depth) ((Elab_dTypes.v_forceVal ec) a)) ((Elab_dTypes.v_forceVal ec) b)) with
  | Base_dDiag.C_Check_OkC (dtb__329) -> true
  | Base_dDiag.C_Check_ErrC (dtb__330) -> false
  | _ -> failwith "DT: impossible branch"
))

# 1014 "Vuna/Compiler/Elab/Trait.vuna"
let rec v_matchCtxDictIdxGo = (fun (mc0 : Elab_dTypes.t_Ctx) (mc1 : int) (mc2 : Core_dTerm.t_Value) (mc3 : Elab_dTypes.t_Ec) (mc4 : int) (mc5 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc5 with
  | B_dData_dList.C_List__x58__x58_ (dtb__331, dtb__332) -> (if (mc4 >= mc1) then B_dData_dMaybe.C_Maybe_Nothing else (match dtb__331 with
  | { B_dData_dPair.f_Pair_first = dtb__333; B_dData_dPair.f_Pair_second = dtb__334 } -> (if ((((v_ctxDictDomEqual mc3) (Elab_dTypes.v_ctxDepth mc0)) (((Elab_dTypes.v_varTypeValue mc0) mc4) dtb__334)) mc2) then (B_dData_dMaybe.C_Maybe_Just (mc4)) else ((((((v_matchCtxDictIdxGo mc0) mc1) mc2) mc3) (mc4 + 1)) dtb__332))
  | _ -> failwith "DT: impossible branch"
))
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 1011 "Vuna/Compiler/Elab/Trait.vuna"
let v_matchCtxDictIdx = (fun (ctx : Elab_dTypes.t_Ctx) (nCtx : int) (dom : Core_dTerm.t_Value) (ec : Elab_dTypes.t_Ec) -> ((((((v_matchCtxDictIdxGo ctx) nCtx) dom) ec) 0) (ctx).Elab_dTypes.f_Ctx_ctxItems))

# 995 "Vuna/Compiler/Elab/Trait.vuna"
let rec v_solveCtxGoalsGo = (fun (mc0 : Elab_dTypes.t_Ctx) (mc1 : int) (mc2 : Elab_dTypes.t_Ec) (mc3 : Elab_dTypes.t_Constraint B_dData_dList.t_List) (mc4 : Elab_dTypes.t_Constraint B_dData_dList.t_List) (mc5 : (int, int) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc3 with
  | B_dData_dList.C_List__x58__x58_ (dtb__335, dtb__336) -> (match dtb__335 with
  | { Elab_dTypes.f_Constraint_conId = dtb__337; Elab_dTypes.f_Constraint_conKind = dtb__338; Elab_dTypes.f_Constraint_conMeta = dtb__339; Elab_dTypes.f_Constraint_conDom = dtb__340; Elab_dTypes.f_Constraint_conSpan = dtb__341; Elab_dTypes.f_Constraint_conDepth = dtb__342 } -> (match ((Core_dTerm.v_metaLookup dtb__339) (Elab_dTypes.v_ecSolTbl mc2)) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__343) -> ((((((v_solveCtxGoalsGo mc0) mc1) mc2) dtb__336) mc4) mc5)
  | B_dData_dMaybe.C_Maybe_Nothing -> (match ((((v_matchCtxDictIdx mc0) mc1) dtb__340) mc2) with
  | B_dData_dMaybe.C_Maybe_Nothing -> ((((((v_solveCtxGoalsGo mc0) mc1) mc2) dtb__336) (B_dData_dList.C_List__x58__x58_ (dtb__335, mc4))) mc5)
  | B_dData_dMaybe.C_Maybe_Just (dtb__344) -> (let k = ((mc1 - 1) - dtb__344) in (match ((((((Core_dConv.v_solveMeta (Elab_dTypes.v_ecDefTbl mc2)) (Elab_dTypes.v_ecSolsP mc2)) (Elab_dTypes.v_ctxDepth mc0)) dtb__339) B_dData_dList.C_List_Nil) (Core_dTerm.C_Value_VNeutral ((Core_dTerm.C_Neutral_NVar ((v_ctxDictName k), (((Elab_dTypes.v_ctxDepth mc0) - mc1) + k), B_dData_dList.C_List_Nil))))) with
  | Base_dDiag.C_Check_OkC (dtb__345) -> ((((((v_solveCtxGoalsGo mc0) mc1) ((Elab_dTypes.v_ecPutSols mc2) (Core_dTerm.v_solsList dtb__345))) dtb__336) mc4) (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__339; B_dData_dPair.f_Pair_second = k }, mc5)))
  | Base_dDiag.C_Check_ErrC (dtb__346) -> ((((((v_solveCtxGoalsGo mc0) mc1) mc2) dtb__336) mc4) mc5)
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> { B_dData_dPair.f_Pair_first = (B_dData_dList.v_reverse mc5); B_dData_dPair.f_Pair_second = ((Elab_dTypes.v_ecPutPending mc2) (B_dData_dList.v_reverse mc4)) }
  | _ -> failwith "DT: impossible branch"
))

# 992 "Vuna/Compiler/Elab/Trait.vuna"
let v_solveCtxGoals = (fun (ctx : Elab_dTypes.t_Ctx) (nCtx : int) (nTele : int) (ec : Elab_dTypes.t_Ec) (acc : (int, int) B_dData_dPair.t_Pair B_dData_dList.t_List) -> ((((((v_solveCtxGoalsGo ctx) nCtx) ec) (Elab_dTypes.v_ecPendingList ec)) B_dData_dList.C_List_Nil) acc))

# 1032 "Vuna/Compiler/Elab/Trait.vuna"
let rec v_applyCtxSubstsTo = (fun (mc0 : int) (mc1 : (int, int) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc2 : Core_dTerm.t_Term) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__347, dtb__348) -> (match dtb__347 with
  | { B_dData_dPair.f_Pair_first = dtb__349; B_dData_dPair.f_Pair_second = dtb__350 } -> (((v_applyCtxSubstsTo mc0) dtb__348) ((((Core_dTerm.v_substMetaVar dtb__349) (v_ctxDictName dtb__350)) ((mc0 + dtb__350) + 1)) mc2))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> mc2
  | _ -> failwith "DT: impossible branch"
))

# 1043 "Vuna/Compiler/Elab/Trait.vuna"
let rec v_resolveRigidGoalsGo = (fun (mc0 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc1 : Elab_dTypes.t_Ctx) (mc2 : Base_dSource.t_Span) (mc3 : int) (mc4 : Elab_dTypes.t_Constraint B_dData_dList.t_List) (mc5 : Elab_dTypes.t_Constraint B_dData_dList.t_List) (mc6 : (int, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc7 : Elab_dTypes.t_Ec) -> (match mc4 with
  | B_dData_dList.C_List__x58__x58_ (dtb__351, dtb__352) -> (match dtb__351 with
  | { Elab_dTypes.f_Constraint_conId = dtb__353; Elab_dTypes.f_Constraint_conKind = dtb__354; Elab_dTypes.f_Constraint_conMeta = dtb__355; Elab_dTypes.f_Constraint_conDom = dtb__356; Elab_dTypes.f_Constraint_conSpan = dtb__357; Elab_dTypes.f_Constraint_conDepth = dtb__358 } -> (if (dtb__353 < mc3) then ((((((((v_resolveRigidGoalsGo mc0) mc1) mc2) mc3) dtb__352) (B_dData_dList.C_List__x58__x58_ (dtb__351, mc5))) mc6) mc7) else (if ((Elab_dDict.v_isRigidDictArg mc7) dtb__356) then (let nd_uscrut17 = (((((Elab_dDict.v_searchInstanceIn mc0) mc1) mc7) dtb__356) mc2) in (match nd_uscrut17 with
  | Base_dDiag.C_Check_OkC (dtb__359) -> (match dtb__359 with
  | { B_dData_dPair.f_Pair_first = dtb__360; B_dData_dPair.f_Pair_second = dtb__361 } -> (match ((((((Core_dConv.v_solveMeta (Elab_dTypes.v_ecDefTbl dtb__361)) (Elab_dTypes.v_ecSolsP dtb__361)) (Elab_dTypes.v_ctxDepth mc1)) dtb__355) B_dData_dList.C_List_Nil) ((Core_dEval.v_eval (Elab_dTypes.v_ctxEnv mc1)) dtb__360)) with
  | Base_dDiag.C_Check_OkC (dtb__362) -> ((((((((v_resolveRigidGoalsGo mc0) mc1) mc2) mc3) dtb__352) mc5) (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__355; B_dData_dPair.f_Pair_second = dtb__360 }, mc6))) ((Elab_dTypes.v_ecPutSols dtb__361) (Core_dTerm.v_solsList dtb__362)))
  | Base_dDiag.C_Check_ErrC (dtb__363) -> ((((((((v_resolveRigidGoalsGo mc0) mc1) mc2) mc3) dtb__352) (B_dData_dList.C_List__x58__x58_ (dtb__351, mc5))) mc6) dtb__361)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dDiag.C_Check_ErrC (dtb__364) -> (((Base_dDiagnostics_dTc.v_tcErr1 mc2) (Base_dDiagnostics_dTc.C_TcErr_InstanceContextMissing ((Core_dEval.v_showValue dtb__356)))) (Core_dEval.v_showValue dtb__356))
  | _ -> failwith "DT: impossible branch"
)) else ((((((((v_resolveRigidGoalsGo mc0) mc1) mc2) mc3) dtb__352) (B_dData_dList.C_List__x58__x58_ (dtb__351, mc5))) mc6) mc7)))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.v_reverse mc6); B_dData_dPair.f_Pair_second = ((Elab_dTypes.v_ecPutPending mc7) (B_dData_dList.v_reverse mc5)) }))
  | _ -> failwith "DT: impossible branch"
))

# 1039 "Vuna/Compiler/Elab/Trait.vuna"
let v_resolveRigidGoals = (fun (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (sp : Base_dSource.t_Span) (minCid : int) (goals : Elab_dTypes.t_Constraint B_dData_dList.t_List) (acc : (int, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ec : Elab_dTypes.t_Ec) -> ((((((((v_resolveRigidGoalsGo globals) ctx) sp) minCid) goals) B_dData_dList.C_List_Nil) acc) ec))

# 1072 "Vuna/Compiler/Elab/Trait.vuna"
let rec v_substMetaTermGo = (fun (mc0 : int) (mc1 : Core_dTerm.t_Term) (mc2 : int) (mc3 : Core_dTerm.t_Term) -> (match mc3 with
  | Core_dTerm.C_Term_TIf (dtb__365, dtb__366, dtb__367) -> (Core_dTerm.C_Term_TIf (((((v_substMetaTermGo mc0) mc1) mc2) dtb__365), ((((v_substMetaTermGo mc0) mc1) mc2) dtb__366), ((((v_substMetaTermGo mc0) mc1) mc2) dtb__367)))
  | Core_dTerm.C_Term_TCase (dtb__368, dtb__369) -> (Core_dTerm.C_Term_TCase (((((v_substMetaTermGo mc0) mc1) mc2) dtb__368), ((B_dData_dList.v_map (fun (alt : Core_dTerm.t_CaseAlt) -> ((((v_substMetaTermAlt mc0) mc1) mc2) alt))) dtb__369)))
  | Core_dTerm.C_Term_TRecord (dtb__370, dtb__371) -> (Core_dTerm.C_Term_TRecord (dtb__370, ((B_dData_dList.v_map (fun (p : (Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair) -> { B_dData_dPair.f_Pair_first = ((((v_substMetaTermGo mc0) mc1) mc2) (B_dData_dPair.v_firstOf p)); B_dData_dPair.f_Pair_second = (B_dData_dPair.v_secondOf p) })) dtb__371)))
  | Core_dTerm.C_Term_TMk (dtb__372, dtb__373) -> (Core_dTerm.C_Term_TMk (dtb__372, ((B_dData_dList.v_map (fun (p : (Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair) -> { B_dData_dPair.f_Pair_first = ((((v_substMetaTermGo mc0) mc1) mc2) (B_dData_dPair.v_firstOf p)); B_dData_dPair.f_Pair_second = (B_dData_dPair.v_secondOf p) })) dtb__373)))
  | Core_dTerm.C_Term_TCon (dtb__374, dtb__375) -> (Core_dTerm.C_Term_TCon (dtb__374, ((B_dData_dList.v_map (fun (p : (Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair) -> { B_dData_dPair.f_Pair_first = ((((v_substMetaTermGo mc0) mc1) mc2) (B_dData_dPair.v_firstOf p)); B_dData_dPair.f_Pair_second = (B_dData_dPair.v_secondOf p) })) dtb__375)))
  | Core_dTerm.C_Term_TApp (dtb__376, dtb__377, dtb__378) -> (Core_dTerm.C_Term_TApp (((((v_substMetaTermGo mc0) mc1) mc2) dtb__376), ((((v_substMetaTermGo mc0) mc1) mc2) dtb__377), dtb__378))
  | Core_dTerm.C_Term_TLam (dtb__379, dtb__380, dtb__381, dtb__382, dtb__383) -> (let slot2 = (let nd_uscrut9 = dtb__381 in (match nd_uscrut9 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__384) -> (match dtb__384 with
  | { B_dData_dPair.f_Pair_first = dtb__385; B_dData_dPair.f_Pair_second = dtb__386 } -> (match dtb__386 with
  | { B_dData_dPair.f_Pair_first = dtb__387; B_dData_dPair.f_Pair_second = dtb__388 } -> (let bt2 = (match dtb__387 with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb__390) -> (B_dData_dMaybe.C_Maybe_Just (((((v_substMetaTermGo mc0) mc1) mc2) dtb__390)))
  | _ -> failwith "DT: impossible branch"
) in (let rt2 = (match dtb__388 with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb__389) -> (B_dData_dMaybe.C_Maybe_Just (((((v_substMetaTermGo mc0) mc1) (mc2 + 1)) dtb__389)))
  | _ -> failwith "DT: impossible branch"
) in (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = dtb__385; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = bt2; B_dData_dPair.f_Pair_second = rt2 } }))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) in (Core_dTerm.C_Term_TLam (dtb__379, dtb__380, slot2, dtb__382, ((((v_substMetaTermGo mc0) mc1) (mc2 + 1)) dtb__383))))
  | Core_dTerm.C_Term_TPi (dtb__391, dtb__392, dtb__393, dtb__394, dtb__395) -> (Core_dTerm.C_Term_TPi (dtb__391, dtb__392, dtb__393, ((((v_substMetaTermGo mc0) mc1) mc2) dtb__394), ((((v_substMetaTermGo mc0) mc1) (mc2 + 1)) dtb__395)))
  | Core_dTerm.C_Term_TMeta (dtb__396) -> (if (dtb__396 = mc0) then (((Core_dTerm.v_shift 0) mc2) mc1) else mc3)
  | _ -> mc3
))
# 1110 "Vuna/Compiler/Elab/Trait.vuna"
and v_substMetaTermAlt = (fun (mc0 : int) (mc1 : Core_dTerm.t_Term) (mc2 : int) (mc3 : Core_dTerm.t_CaseAlt) -> (match mc3 with
  | { Core_dTerm.f_CaseAlt_caseAltName = dtb__397; Core_dTerm.f_CaseAlt_caseAltBinders = dtb__398; Core_dTerm.f_CaseAlt_caseAltBody = dtb__399 } -> { Core_dTerm.f_CaseAlt_caseAltName = dtb__397; Core_dTerm.f_CaseAlt_caseAltBinders = dtb__398; Core_dTerm.f_CaseAlt_caseAltBody = ((((v_substMetaTermGo mc0) mc1) (mc2 + (B_dData_dList.v_length dtb__398))) dtb__399) }
  | _ -> failwith "DT: impossible branch"
))

# 1069 "Vuna/Compiler/Elab/Trait.vuna"
let v_substMetaTerm = (fun (m : int) (rep : Core_dTerm.t_Term) (t : Core_dTerm.t_Term) -> ((((v_substMetaTermGo m) rep) 0) t))

# 1064 "Vuna/Compiler/Elab/Trait.vuna"
let rec v_applyTermSubstsTo = (fun (mc0 : int) (mc1 : (int, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc2 : Core_dTerm.t_Term) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__400, dtb__401) -> (match dtb__400 with
  | { B_dData_dPair.f_Pair_first = dtb__402; B_dData_dPair.f_Pair_second = dtb__403 } -> (((v_applyTermSubstsTo mc0) dtb__401) (((v_substMetaTerm dtb__402) dtb__403) mc2))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> mc2
  | _ -> failwith "DT: impossible branch"
))

# 1114 "Vuna/Compiler/Elab/Trait.vuna"
let v_clauseSpanOf = (fun (mc0 : (Frontend_dRast.t_Pat B_dData_dList.t_List, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__404, dtb__405) -> (Frontend_dRast.v_exprSpan (B_dData_dPair.v_secondOf dtb__404))
  | B_dData_dList.C_List_Nil -> { Base_dSource.f_Span_spanFile = ""; Base_dSource.f_Span_spanStartLine = 0; Base_dSource.f_Span_spanStartCol = 0; Base_dSource.f_Span_spanEndLine = 0; Base_dSource.f_Span_spanEndCol = 0; Base_dSource.f_Span_spanStartOffset = 0; Base_dSource.f_Span_spanEndOffset = 0 }
  | _ -> failwith "DT: impossible branch"
))

# 1137 "Vuna/Compiler/Elab/Trait.vuna"
let v_literalClassArg = (fun (mc0 : Core_dTerm.t_Value) -> (match mc0 with
  | Core_dTerm.C_Value_VFloat (dtb__406) -> true
  | Core_dTerm.C_Value_VBool (dtb__407) -> true
  | Core_dTerm.C_Value_VInt (dtb__408) -> true
  | Core_dTerm.C_Value_VStr (dtb__409) -> true
  | _ -> false
))

# 1144 "Vuna/Compiler/Elab/Trait.vuna"
let v_liftableDictDomain = (fun (ec : Elab_dTypes.t_Ec) (dom : Core_dTerm.t_Value) -> ((B_dData_dList.v_length ((B_dData_dList.v_filter v_literalClassArg) ((Elab_dDict.v_dictClassArgs ec) dom))) = 0))

# 1172 "Vuna/Compiler/Elab/Trait.vuna"
let v_domainsEqual = (fun (ec : Elab_dTypes.t_Ec) (a : Core_dTerm.t_Value) (b : Core_dTerm.t_Value) -> (match (((((Core_dConv.v_conv (Elab_dTypes.v_ecDefTbl ec)) (Elab_dTypes.v_ecSolsP ec)) 0) a) b) with
  | Base_dDiag.C_Check_OkC (dtb__410) -> true
  | Base_dDiag.C_Check_ErrC (dtb__411) -> false
  | _ -> failwith "DT: impossible branch"
))

# 1164 "Vuna/Compiler/Elab/Trait.vuna"
let rec v_addDictGoalGroup = (fun (mc0 : Elab_dTypes.t_Ec) (mc1 : int) (mc2 : Core_dTerm.t_Value) (mc3 : t_DictGoalGroup B_dData_dList.t_List) -> (match mc3 with
  | B_dData_dList.C_List__x58__x58_ (dtb__412, dtb__413) -> (match dtb__412 with
  | { f_DictGoalGroup_dictGoalGroupRep = dtb__414; f_DictGoalGroup_dictGoalGroupDom = dtb__415; f_DictGoalGroup_dictGoalGroupExtras = dtb__416 } -> (if (((v_domainsEqual mc0) dtb__415) mc2) then (B_dData_dList.C_List__x58__x58_ ({ f_DictGoalGroup_dictGoalGroupRep = dtb__414; f_DictGoalGroup_dictGoalGroupDom = dtb__415; f_DictGoalGroup_dictGoalGroupExtras = (B_dData_dList.C_List__x58__x58_ (mc1, dtb__416)) }, dtb__413)) else (B_dData_dList.C_List__x58__x58_ ({ f_DictGoalGroup_dictGoalGroupRep = dtb__414; f_DictGoalGroup_dictGoalGroupDom = dtb__415; f_DictGoalGroup_dictGoalGroupExtras = dtb__416 }, ((((v_addDictGoalGroup mc0) mc1) mc2) dtb__413))))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (B_dData_dList.C_List__x58__x58_ ({ f_DictGoalGroup_dictGoalGroupRep = mc1; f_DictGoalGroup_dictGoalGroupDom = mc2; f_DictGoalGroup_dictGoalGroupExtras = B_dData_dList.C_List_Nil }, B_dData_dList.C_List_Nil))
  | _ -> failwith "DT: impossible branch"
))

# 1149 "Vuna/Compiler/Elab/Trait.vuna"
let rec v_freeDictGoalsGo = (fun (mc0 : int) (mc1 : Elab_dTypes.t_Ec) (mc2 : Elab_dTypes.t_Constraint B_dData_dList.t_List) (mc3 : t_DictGoalGroup B_dData_dList.t_List) -> (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__417, dtb__418) -> (match dtb__417 with
  | { Elab_dTypes.f_Constraint_conId = dtb__419; Elab_dTypes.f_Constraint_conKind = dtb__420; Elab_dTypes.f_Constraint_conMeta = dtb__421; Elab_dTypes.f_Constraint_conDom = dtb__422; Elab_dTypes.f_Constraint_conSpan = dtb__423; Elab_dTypes.f_Constraint_conDepth = dtb__424 } -> (if (if (if (dtb__419 >= mc0) then ((Elab_dDict.v_isRigidDictArg mc1) dtb__422) else false) then ((v_liftableDictDomain mc1) dtb__422) else false) then (match ((Core_dTerm.v_metaLookup dtb__421) (Elab_dTypes.v_ecSolTbl mc1)) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__425) -> ((((v_freeDictGoalsGo mc0) mc1) dtb__418) mc3)
  | B_dData_dMaybe.C_Maybe_Nothing -> ((((v_freeDictGoalsGo mc0) mc1) dtb__418) ((((v_addDictGoalGroup mc1) dtb__421) dtb__422) mc3))
  | _ -> failwith "DT: impossible branch"
) else ((((v_freeDictGoalsGo mc0) mc1) dtb__418) mc3))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> mc3
  | _ -> failwith "DT: impossible branch"
))

# 1132 "Vuna/Compiler/Elab/Trait.vuna"
let v_freeDictGoals = (fun (minCid : int) (ec : Elab_dTypes.t_Ec) -> ((((v_freeDictGoalsGo minCid) ec) (Elab_dTypes.v_ecPendingList ec)) B_dData_dList.C_List_Nil))

# 1179 "Vuna/Compiler/Elab/Trait.vuna"
let rec v_leadingImplicitCount = (fun (mc0 : Core_dTerm.t_Term) -> (match mc0 with
  | Core_dTerm.C_Term_TPi (dtb__426, dtb__427, dtb__428, dtb__429, dtb__430) -> (if dtb__427 then (1 + (v_leadingImplicitCount dtb__430)) else 0)
  | _ -> 0
))

# 1186 "Vuna/Compiler/Elab/Trait.vuna"
let v_solveLiftedMeta = (fun (ec : Elab_dTypes.t_Ec) (name : string) (level : int) (m : int) -> (match ((((((Core_dConv.v_solveMeta (Elab_dTypes.v_ecDefTbl ec)) (Elab_dTypes.v_ecSolsP ec)) (level + 1)) m) B_dData_dList.C_List_Nil) (Core_dTerm.C_Value_VNeutral ((Core_dTerm.C_Neutral_NVar (name, level, B_dData_dList.C_List_Nil))))) with
  | Base_dDiag.C_Check_OkC (dtb__431) -> ((Elab_dTypes.v_ecPutSols ec) (Core_dTerm.v_solsList dtb__431))
  | Base_dDiag.C_Check_ErrC (dtb__432) -> ec
  | _ -> failwith "DT: impossible branch"
))

# 1193 "Vuna/Compiler/Elab/Trait.vuna"
let rec v_solveLiftedMetas = (fun (mc0 : Elab_dTypes.t_Ec) (mc1 : string) (mc2 : int) (mc3 : int B_dData_dList.t_List) -> (match mc3 with
  | B_dData_dList.C_List__x58__x58_ (dtb__433, dtb__434) -> ((((v_solveLiftedMetas ((((v_solveLiftedMeta mc0) mc1) mc2) dtb__433)) mc1) mc2) dtb__434)
  | B_dData_dList.C_List_Nil -> mc0
  | _ -> failwith "DT: impossible branch"
))

# 1215 "Vuna/Compiler/Elab/Trait.vuna"
let v_dictAnchor = (fun (ty : Core_dTerm.t_Term) -> ((Elab_dMeta.v_maxInt 1) (v_leadingImplicitCount ty)))

# 1224 "Vuna/Compiler/Elab/Trait.vuna"
let rec v_planDictBindersGo = (fun (mc0 : int) (mc1 : Elab_dTypes.t_Ec) (mc2 : t_DictGoalGroup B_dData_dList.t_List) (mc3 : int) (mc4 : int) -> (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__435, dtb__436) -> (match dtb__435 with
  | { f_DictGoalGroup_dictGoalGroupRep = dtb__437; f_DictGoalGroup_dictGoalGroupDom = dtb__438; f_DictGoalGroup_dictGoalGroupExtras = dtb__439 } -> (let level = (mc0 + ((mc4 - 1) - mc3)) in (let dName = (Frontend_dReserved.v_dictBinderName mc3) in (let dp = { f_DictPlan_dpName = dName; f_DictPlan_dpLevel = level; f_DictPlan_dpDom = (((Core_dEval.v_substSolvedMetasAtTbl (Elab_dTypes.v_ecSolTbl mc1)) level) ((Core_dEval.v_quote level) dtb__438)); f_DictPlan_dpMetas = (B_dData_dList.C_List__x58__x58_ (dtb__437, dtb__439)) } in (let next = (((((v_planDictBindersGo mc0) ((((v_solveLiftedMetas mc1) dName) level) (B_dData_dList.C_List__x58__x58_ (dtb__437, dtb__439)))) dtb__436) (mc3 + 1)) mc4) in { B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ (dp, (B_dData_dPair.v_firstOf next))); B_dData_dPair.f_Pair_second = (B_dData_dPair.v_secondOf next) }))))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> { B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = mc1 }
  | _ -> failwith "DT: impossible branch"
))

# 1221 "Vuna/Compiler/Elab/Trait.vuna"
let v_planDictBinders = (fun (anchor : int) (ec : Elab_dTypes.t_Ec) (groups : t_DictGoalGroup B_dData_dList.t_List) -> (((((v_planDictBindersGo anchor) ec) groups) 0) (B_dData_dList.v_length groups)))

# 1245 "Vuna/Compiler/Elab/Trait.vuna"
let v_dictPlanPi = (fun (mc0 : t_DictPlan) -> (match mc0 with
  | { f_DictPlan_dpName = dtb__440; f_DictPlan_dpLevel = dtb__441; f_DictPlan_dpDom = dtb__442; f_DictPlan_dpMetas = dtb__443 } -> { B_dData_dPair.f_Pair_first = dtb__440; B_dData_dPair.f_Pair_second = dtb__442 }
  | _ -> failwith "DT: impossible branch"
))

# 1248 "Vuna/Compiler/Elab/Trait.vuna"
let v_dictPlanName = (fun (mc0 : t_DictPlan) -> (match mc0 with
  | { f_DictPlan_dpName = dtb__444; f_DictPlan_dpLevel = dtb__445; f_DictPlan_dpDom = dtb__446; f_DictPlan_dpMetas = dtb__447 } -> dtb__444
  | _ -> failwith "DT: impossible branch"
))

# 1265 "Vuna/Compiler/Elab/Trait.vuna"
let rec v_wrapDictPisGo = (fun (mc0 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc1 : Core_dTerm.t_Term) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__448, dtb__449) -> (match dtb__448 with
  | { B_dData_dPair.f_Pair_first = dtb__450; B_dData_dPair.f_Pair_second = dtb__451 } -> (Core_dTerm.C_Term_TPi (dtb__450, true, Core_dTerm.C_Rig_RigOmega, dtb__451, ((v_wrapDictPisGo dtb__449) mc1)))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> mc1
  | _ -> failwith "DT: impossible branch"
))

# 1262 "Vuna/Compiler/Elab/Trait.vuna"
let v_wrapDictPis = (fun (dicts : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (t : Core_dTerm.t_Term) -> ((v_wrapDictPisGo dicts) (((Core_dTerm.v_shift 0) (B_dData_dList.v_length dicts)) t)))

# 1251 "Vuna/Compiler/Elab/Trait.vuna"
let rec v_insertPisAfter = (fun (n : int) (dicts : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (t : Core_dTerm.t_Term) -> (if (n <= 0) then ((v_wrapDictPis dicts) t) else (match t with
  | Core_dTerm.C_Term_TPi (dtb__452, dtb__453, dtb__454, dtb__455, dtb__456) -> (Core_dTerm.C_Term_TPi (dtb__452, dtb__453, dtb__454, dtb__455, (((v_insertPisAfter (n - 1)) dicts) dtb__456)))
  | _ -> ((v_wrapDictPis dicts) t)
)))

# 1242 "Vuna/Compiler/Elab/Trait.vuna"
let v_insertDictPis = (fun (anchor : int) (plans : t_DictPlan B_dData_dList.t_List) (ty : Core_dTerm.t_Term) -> (((v_insertPisAfter anchor) ((B_dData_dList.v_map v_dictPlanPi) plans)) ty))

# 1285 "Vuna/Compiler/Elab/Trait.vuna"
let rec v_wrapDictLamsGo = (fun (mc0 : string B_dData_dList.t_List) (mc1 : Core_dTerm.t_Term) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__457, dtb__458) -> (Core_dTerm.C_Term_TLam (dtb__457, Core_dTerm.C_Rig_RigOmega, B_dData_dMaybe.C_Maybe_Nothing, Base_dSource.v_spanEmpty, ((v_wrapDictLamsGo dtb__458) mc1)))
  | B_dData_dList.C_List_Nil -> mc1
  | _ -> failwith "DT: impossible branch"
))

# 1282 "Vuna/Compiler/Elab/Trait.vuna"
let v_wrapDictLams = (fun (names : string B_dData_dList.t_List) (t : Core_dTerm.t_Term) -> ((v_wrapDictLamsGo names) (((Core_dTerm.v_shift 0) (B_dData_dList.v_length names)) t)))

# 1273 "Vuna/Compiler/Elab/Trait.vuna"
let rec v_insertLamsAfter = (fun (n : int) (names : string B_dData_dList.t_List) (t : Core_dTerm.t_Term) -> (if (n <= 0) then ((v_wrapDictLams names) t) else (match t with
  | Core_dTerm.C_Term_TLam (dtb__459, dtb__460, dtb__461, dtb__462, dtb__463) -> (Core_dTerm.C_Term_TLam (dtb__459, dtb__460, dtb__461, dtb__462, (((v_insertLamsAfter (n - 1)) names) dtb__463)))
  | _ -> ((v_wrapDictLams names) t)
)))

# 1270 "Vuna/Compiler/Elab/Trait.vuna"
let v_insertDictLams = (fun (anchor : int) (plans : t_DictPlan B_dData_dList.t_List) (body : Core_dTerm.t_Term) -> (((v_insertLamsAfter anchor) ((B_dData_dList.v_map v_dictPlanName) plans)) body))

# 1295 "Vuna/Compiler/Elab/Trait.vuna"
let rec v_substMetaVarList = (fun (mc0 : string) (mc1 : int) (mc2 : int B_dData_dList.t_List) (mc3 : Core_dTerm.t_Term) -> (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__464, dtb__465) -> ((((v_substMetaVarList mc0) mc1) dtb__465) ((((Core_dTerm.v_substMetaVar dtb__464) mc0) mc1) mc3))
  | B_dData_dList.C_List_Nil -> mc3
  | _ -> failwith "DT: impossible branch"
))

# 1290 "Vuna/Compiler/Elab/Trait.vuna"
let rec v_substPlannedMetas = (fun (mc0 : t_DictPlan B_dData_dList.t_List) (mc1 : Core_dTerm.t_Term) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__466, dtb__467) -> (match dtb__466 with
  | { f_DictPlan_dpName = dtb__468; f_DictPlan_dpLevel = dtb__469; f_DictPlan_dpDom = dtb__470; f_DictPlan_dpMetas = dtb__471 } -> ((v_substPlannedMetas dtb__467) ((((v_substMetaVarList dtb__468) (dtb__469 + 1)) dtb__471) mc1))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> mc1
  | _ -> failwith "DT: impossible branch"
))

# 1336 "Vuna/Compiler/Elab/Trait.vuna"
let v_injectBudgetFor = (fun (t : Core_dTerm.t_Term) -> (64 + (4 * (Core_dTerm.v_termSize t))))

# 1339 "Vuna/Compiler/Elab/Trait.vuna"
let v_altBudgetFor = (fun (mc0 : Core_dTerm.t_CaseAlt) -> (match mc0 with
  | { Core_dTerm.f_CaseAlt_caseAltName = dtb__472; Core_dTerm.f_CaseAlt_caseAltBinders = dtb__473; Core_dTerm.f_CaseAlt_caseAltBody = dtb__474 } -> ((v_injectBudgetFor dtb__474) + (B_dData_dList.v_length dtb__473))
  | _ -> failwith "DT: impossible branch"
))

# 1393 "Vuna/Compiler/Elab/Trait.vuna"
let rec v_spineSize = (fun (mc0 : (Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__475, dtb__476) -> ((Core_dTerm.v_termSize (B_dData_dPair.v_firstOf dtb__475)) + (v_spineSize dtb__476))
  | B_dData_dList.C_List_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))

# 1406 "Vuna/Compiler/Elab/Trait.vuna"
let v_insertArgAt = (fun (n : int) x xs -> ((B_dData_dList.v_append ((B_dData_dList.v_append ((B_dData_dList.v_take n) xs)) (B_dData_dList.C_List__x58__x58_ (x, B_dData_dList.C_List_Nil)))) ((B_dData_dList.v_drop n) xs)))

# 1342 "Vuna/Compiler/Elab/Trait.vuna"
let rec v_injectDictGoFuel = (fun (fuel : int) (defName : string) (dName : string) (appPos : int) (depth : int) (t : Core_dTerm.t_Term) -> (if (fuel <= 0) then t else (match t with
  | Core_dTerm.C_Term_TLam (dtb__477, dtb__478, dtb__479, dtb__480, dtb__481) -> (let slot2 = (let nd_uscrut11 = dtb__479 in (match nd_uscrut11 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__482) -> (match dtb__482 with
  | { B_dData_dPair.f_Pair_first = dtb__483; B_dData_dPair.f_Pair_second = dtb__484 } -> (match dtb__484 with
  | { B_dData_dPair.f_Pair_first = dtb__485; B_dData_dPair.f_Pair_second = dtb__486 } -> (let bt2 = (match dtb__485 with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb__488) -> (B_dData_dMaybe.C_Maybe_Just (((((((v_injectDictGoFuel (fuel - 1)) defName) dName) appPos) depth) dtb__488)))
  | _ -> failwith "DT: impossible branch"
) in (let rt2 = (match dtb__486 with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb__487) -> (B_dData_dMaybe.C_Maybe_Just (((((((v_injectDictGoFuel (fuel - 1)) defName) dName) appPos) (depth + 1)) dtb__487)))
  | _ -> failwith "DT: impossible branch"
) in (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = dtb__483; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = bt2; B_dData_dPair.f_Pair_second = rt2 } }))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) in (Core_dTerm.C_Term_TLam (dtb__477, dtb__478, slot2, dtb__480, ((((((v_injectDictGoFuel (fuel - 1)) defName) dName) appPos) (depth + 1)) dtb__481))))
  | Core_dTerm.C_Term_TPi (dtb__489, dtb__490, dtb__491, dtb__492, dtb__493) -> (Core_dTerm.C_Term_TPi (dtb__489, dtb__490, dtb__491, ((((((v_injectDictGoFuel (fuel - 1)) defName) dName) appPos) depth) dtb__492), ((((((v_injectDictGoFuel (fuel - 1)) defName) dName) appPos) (depth + 1)) dtb__493)))
  | Core_dTerm.C_Term_TApp (dtb__494, dtb__495, dtb__496) -> (let nd_uscrut9 = (Elab_dTypes.v_flattenTaggedApp t) in (match nd_uscrut9 with
  | B_dData_dMaybe.C_Maybe_Nothing -> (Core_dTerm.C_Term_TApp (((((((v_injectDictGoFuel (fuel - 1)) defName) dName) appPos) depth) dtb__494), ((((((v_injectDictGoFuel (fuel - 1)) defName) dName) appPos) depth) dtb__495), dtb__496))
  | B_dData_dMaybe.C_Maybe_Just (dtb__497) -> (match dtb__497 with
  | { B_dData_dPair.f_Pair_first = dtb__498; B_dData_dPair.f_Pair_second = dtb__499 } -> (((((((v_rewriteTaggedSpineFuel (fuel - 1)) defName) dName) appPos) depth) dtb__498) dtb__499)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))
  | Core_dTerm.C_Term_TCon (dtb__500, dtb__501) -> (Core_dTerm.C_Term_TCon (dtb__500, ((B_dData_dList.v_map (fun (p : (Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair) -> { B_dData_dPair.f_Pair_first = ((((((v_injectDictGoFuel (fuel - 1)) defName) dName) appPos) depth) (B_dData_dPair.v_firstOf p)); B_dData_dPair.f_Pair_second = (B_dData_dPair.v_secondOf p) })) dtb__501)))
  | Core_dTerm.C_Term_TMk (dtb__502, dtb__503) -> (Core_dTerm.C_Term_TMk (dtb__502, ((B_dData_dList.v_map (fun (p : (Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair) -> { B_dData_dPair.f_Pair_first = ((((((v_injectDictGoFuel (fuel - 1)) defName) dName) appPos) depth) (B_dData_dPair.v_firstOf p)); B_dData_dPair.f_Pair_second = (B_dData_dPair.v_secondOf p) })) dtb__503)))
  | Core_dTerm.C_Term_TRecord (dtb__504, dtb__505) -> (Core_dTerm.C_Term_TRecord (dtb__504, ((B_dData_dList.v_map (fun (p : (Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair) -> { B_dData_dPair.f_Pair_first = ((((((v_injectDictGoFuel (fuel - 1)) defName) dName) appPos) depth) (B_dData_dPair.v_firstOf p)); B_dData_dPair.f_Pair_second = (B_dData_dPair.v_secondOf p) })) dtb__505)))
  | Core_dTerm.C_Term_TCase (dtb__506, dtb__507) -> (Core_dTerm.C_Term_TCase (((((((v_injectDictGoFuel (fuel - 1)) defName) dName) appPos) depth) dtb__506), ((B_dData_dList.v_map (fun (alt : Core_dTerm.t_CaseAlt) -> ((((((v_injectAltGoFuel (fuel - 1)) defName) dName) appPos) depth) alt))) dtb__507)))
  | Core_dTerm.C_Term_TIf (dtb__508, dtb__509, dtb__510) -> (Core_dTerm.C_Term_TIf (((((((v_injectDictGoFuel (fuel - 1)) defName) dName) appPos) depth) dtb__508), ((((((v_injectDictGoFuel (fuel - 1)) defName) dName) appPos) depth) dtb__509), ((((((v_injectDictGoFuel (fuel - 1)) defName) dName) appPos) depth) dtb__510)))
  | _ -> t
)))
# 1381 "Vuna/Compiler/Elab/Trait.vuna"
and v_injectAltGoFuel = (fun (fuel : int) (defName : string) (dName : string) (appPos : int) (depth : int) (alt : Core_dTerm.t_CaseAlt) -> (if (fuel <= 0) then alt else (match alt with
  | { Core_dTerm.f_CaseAlt_caseAltName = dtb__511; Core_dTerm.f_CaseAlt_caseAltBinders = dtb__512; Core_dTerm.f_CaseAlt_caseAltBody = dtb__513 } -> { Core_dTerm.f_CaseAlt_caseAltName = dtb__511; Core_dTerm.f_CaseAlt_caseAltBinders = dtb__512; Core_dTerm.f_CaseAlt_caseAltBody = ((((((v_injectDictGoFuel (fuel - 1)) defName) dName) appPos) (depth + (B_dData_dList.v_length dtb__512))) dtb__513) }
  | _ -> failwith "DT: impossible branch"
)))
# 1397 "Vuna/Compiler/Elab/Trait.vuna"
and v_rewriteTaggedSpineFuel = (fun (fuel : int) (defName : string) (dName : string) (appPos : int) (depth : int) (g : string) (args : (Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (if (fuel <= 0) then (Core_dTerm.C_Term_TGlobal (g)) else (let args2 = ((B_dData_dList.v_map (fun (p : (Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair) -> { B_dData_dPair.f_Pair_first = ((((((v_injectDictGoFuel (fuel - 1)) defName) dName) appPos) depth) (B_dData_dPair.v_firstOf p)); B_dData_dPair.f_Pair_second = (B_dData_dPair.v_secondOf p) })) args) in (if (if (if (g = defName) then ((B_dData_dList.v_length args2) > appPos) else false) then (depth > appPos) else false) then ((Elab_dMeta.v_foldAppTerms (Core_dTerm.C_Term_TGlobal (g))) (((v_insertArgAt appPos) { B_dData_dPair.f_Pair_first = (Core_dTerm.C_Term_TVar (dName, ((depth - appPos) - 1), { Base_dSource.f_Span_spanFile = ""; Base_dSource.f_Span_spanStartLine = 0; Base_dSource.f_Span_spanStartCol = 0; Base_dSource.f_Span_spanEndLine = 0; Base_dSource.f_Span_spanEndCol = 0; Base_dSource.f_Span_spanStartOffset = 0; Base_dSource.f_Span_spanEndOffset = 0 })); B_dData_dPair.f_Pair_second = Core_dTerm.C_Rig_RigOmega }) args2)) else ((Elab_dMeta.v_foldAppTerms (Core_dTerm.C_Term_TGlobal (g))) args2)))))

# 1330 "Vuna/Compiler/Elab/Trait.vuna"
let v_injectDictGo = (fun (defName : string) (dName : string) (appPos : int) (depth : int) (t : Core_dTerm.t_Term) -> ((((((v_injectDictGoFuel (v_injectBudgetFor t)) defName) dName) appPos) depth) t))

# 1327 "Vuna/Compiler/Elab/Trait.vuna"
let v_insertDictCalls = (fun (defName : string) (dName : string) (appPos : int) (t : Core_dTerm.t_Term) -> (((((v_injectDictGo defName) dName) appPos) 0) t))

# 1301 "Vuna/Compiler/Elab/Trait.vuna"
let rec v_insertPlannedCalls = (fun (mc0 : string) (mc1 : t_DictPlan B_dData_dList.t_List) (mc2 : Core_dTerm.t_Term) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__514, dtb__515) -> (match dtb__514 with
  | { f_DictPlan_dpName = dtb__516; f_DictPlan_dpLevel = dtb__517; f_DictPlan_dpDom = dtb__518; f_DictPlan_dpMetas = dtb__519 } -> (((v_insertPlannedCalls mc0) dtb__515) ((((v_insertDictCalls mc0) dtb__516) dtb__517) mc2))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> mc2
  | _ -> failwith "DT: impossible branch"
))

# 1307 "Vuna/Compiler/Elab/Trait.vuna"
let v_liftFreeDictGoals = (fun (defName : string) (minCid : int) (ec : Elab_dTypes.t_Ec) (ty : Core_dTerm.t_Term) (body : Core_dTerm.t_Term) -> (match (Elab_dTypes.v_ecPendingList ec) with
  | B_dData_dList.C_List_Nil -> { B_dData_dPair.f_Pair_first = ty; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = body; B_dData_dPair.f_Pair_second = ec } }
  | _ -> (let anchor = (v_dictAnchor ty) in (let planned = (((v_planDictBinders anchor) ec) ((v_freeDictGoals minCid) ec)) in (let plans = (B_dData_dPair.v_firstOf planned) in (let outerFirst = (B_dData_dList.v_reverse plans) in (let ty2 = (((v_insertDictPis anchor) outerFirst) ty) in (let body1 = (((v_insertDictLams anchor) outerFirst) body) in (let body2 = ((v_substPlannedMetas plans) body1) in (let body3 = (((v_insertPlannedCalls defName) outerFirst) body2) in { B_dData_dPair.f_Pair_first = ty2; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = body3; B_dData_dPair.f_Pair_second = (B_dData_dPair.v_secondOf planned) } }))))))))
))

# 1377 "Vuna/Compiler/Elab/Trait.vuna"
let v_injectAltGo = (fun (defName : string) (dName : string) (appPos : int) (depth : int) (alt : Core_dTerm.t_CaseAlt) -> ((((((v_injectAltGoFuel (v_altBudgetFor alt)) defName) dName) appPos) depth) alt))

# 1389 "Vuna/Compiler/Elab/Trait.vuna"
let v_rewriteTaggedSpine = (fun (defName : string) (dName : string) (appPos : int) (depth : int) (g : string) (args : (Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (((((((v_rewriteTaggedSpineFuel (64 + (4 * (v_spineSize args)))) defName) dName) appPos) depth) g) args))

# 1410 "Vuna/Compiler/Elab/Trait.vuna"
let rec v_replaceGlobalType = (fun (mc0 : string) (mc1 : Core_dTerm.t_Term) (mc2 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__520, dtb__521) -> (if ((B_dData_dPair.v_firstOf dtb__520) = mc0) then (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = mc0; B_dData_dPair.f_Pair_second = mc1 }, dtb__521)) else (B_dData_dList.C_List__x58__x58_ (dtb__520, (((v_replaceGlobalType mc0) mc1) dtb__521))))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 1416 "Vuna/Compiler/Elab/Trait.vuna"
let rec v_foldlAddInst = (fun (mc0 : Elab_dTypes.t_Ec) (mc1 : Elab_dTypes.t_DtInst B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__522, dtb__523) -> ((v_foldlAddInst ((Elab_dTypes.v_ecAddInst mc0) dtb__522)) dtb__523)
  | B_dData_dList.C_List_Nil -> mc0
  | _ -> failwith "DT: impossible branch"
))

# 1503 "Vuna/Compiler/Elab/Trait.vuna"
let v_defBodyOf = (fun (defs : (string, Core_dTerm.t_Term) B_dContainer_dHashMap.t_HashMap) (name : string) -> (match ((Core_dTerm.v_defLookup name) defs) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__524) -> (Base_dDiag.C_Check_OkC (dtb__524))
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.v_icInternal ("instance body missing for " ^ name))
  | _ -> failwith "DT: impossible branch"
))

# 1513 "Vuna/Compiler/Elab/Trait.vuna"
let rec v_elabTraitsGo = (fun (mc0 : (Frontend_dRast.t_Decl, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc1 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc2 : Elab_dTypes.t_Ec) (mc3 : Elab_dTypes.t_DtData B_dData_dList.t_List) (mc4 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc5 : Elab_dTypes.t_DtClass B_dData_dList.t_List) (mc6 : (string, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__525, dtb__526) -> ((Base_dCommon.v_bind (((v_elabTrait mc1) mc2) dtb__525)) (fun (p : (Elab_dTypes.t_DtData, ((string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List, (Elab_dTypes.t_DtClass, ((string, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let nd_uscrut11 = p in (match nd_uscrut11 with
  | { B_dData_dPair.f_Pair_first = dtb__527; B_dData_dPair.f_Pair_second = dtb__528 } -> (match dtb__528 with
  | { B_dData_dPair.f_Pair_first = dtb__529; B_dData_dPair.f_Pair_second = dtb__530 } -> (match dtb__530 with
  | { B_dData_dPair.f_Pair_first = dtb__531; B_dData_dPair.f_Pair_second = dtb__532 } -> (match dtb__532 with
  | { B_dData_dPair.f_Pair_first = dtb__533; B_dData_dPair.f_Pair_second = dtb__534 } -> (((((((v_elabTraitsGo dtb__526) ((B_dData_dList.v_append mc1) dtb__529)) dtb__534) (B_dData_dList.C_List__x58__x58_ (dtb__527, mc3))) ((B_dData_dList.v_append dtb__529) mc4)) (B_dData_dList.C_List__x58__x58_ (dtb__531, mc5))) ((B_dData_dList.v_append dtb__533) mc6))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.v_reverse mc3); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = (B_dData_dList.v_reverse mc4); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = (B_dData_dList.v_reverse mc5); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = (B_dData_dList.v_reverse mc6); B_dData_dPair.f_Pair_second = mc2 } } } }))
  | _ -> failwith "DT: impossible branch"
))

# 1510 "Vuna/Compiler/Elab/Trait.vuna"
let v_elabTraits = (fun (decls : (Frontend_dRast.t_Decl, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ec : Elab_dTypes.t_Ec) -> (((((((v_elabTraitsGo decls) globals) ec) B_dData_dList.C_List_Nil) B_dData_dList.C_List_Nil) B_dData_dList.C_List_Nil) B_dData_dList.C_List_Nil))

# 1554 "Vuna/Compiler/Elab/Trait.vuna"
let rec v_spanOfName = (fun (mc0 : string) (mc1 : (string, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__535, dtb__536) -> (match dtb__535 with
  | { B_dData_dPair.f_Pair_first = dtb__537; B_dData_dPair.f_Pair_second = dtb__538 } -> (if (dtb__537 = mc0) then (B_dData_dMaybe.C_Maybe_Just (dtb__538)) else ((v_spanOfName mc0) dtb__536))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 1558 "Vuna/Compiler/Elab/Trait.vuna"
let v_defTypeOfTbl = (fun (tbl : (string, Core_dTerm.t_Term) B_dContainer_dHashMap.t_HashMap) (name : string) -> (match ((((B_dContainer_dHashMap.v_lookup B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) name) tbl) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__539) -> (Base_dDiag.C_Check_OkC (dtb__539))
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.v_icInternal ("generated definition has no type: " ^ name))
  | _ -> failwith "DT: impossible branch"
))

# 1496 "Vuna/Compiler/Elab/Trait.vuna"
let rec v_instanceDefsGo = (fun (mc0 : Elab_dTypes.t_Ec) (mc1 : Base_dSource.t_Span B_dData_dMaybe.t_Maybe) (mc2 : (string, Core_dTerm.t_Term) B_dContainer_dHashMap.t_HashMap) (mc3 : (string, Core_dTerm.t_Term) B_dContainer_dHashMap.t_HashMap) (mc4 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc5 : Elab_dTypes.t_DtDef B_dData_dList.t_List) -> (match mc4 with
  | B_dData_dList.C_List__x58__x58_ (dtb__540, dtb__541) -> ((Base_dCommon.v_bind ((v_defTypeOfTbl mc2) (B_dData_dPair.v_firstOf dtb__540))) (fun (ty : Core_dTerm.t_Term) -> ((Base_dCommon.v_bind ((v_defBodyOf mc3) (B_dData_dPair.v_firstOf dtb__540))) (fun (body : Core_dTerm.t_Term) -> ((((((v_instanceDefsGo mc0) mc1) mc2) mc3) dtb__541) (B_dData_dList.C_List__x58__x58_ ((Elab_dTypes.C_DtDef_DtDef ((B_dData_dPair.v_firstOf dtb__540), ty, ((Elab_dDict.v_substDictTerm mc0) body), mc1)), mc5)))))))
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC ((B_dData_dList.v_reverse mc5)))
  | _ -> failwith "DT: impossible branch"
))

# 1492 "Vuna/Compiler/Elab/Trait.vuna"
let v_instanceDefsOf = (fun (ecBefore : Elab_dTypes.t_Ec) (ecAfter : Elab_dTypes.t_Ec) (srcSpan : Base_dSource.t_Span B_dData_dMaybe.t_Maybe) (gs : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) -> ((((((v_instanceDefsGo ecAfter) srcSpan) (((B_dContainer_dHashMap.v_fromList B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) gs)) (Elab_dTypes.v_ecDefTbl ecAfter)) gs) B_dData_dList.C_List_Nil))

# 1544 "Vuna/Compiler/Elab/Trait.vuna"
let rec v_extraDefsGo = (fun (mc0 : (string, Core_dTerm.t_Term) B_dContainer_dHashMap.t_HashMap) (mc1 : (string, bool) B_dContainer_dHashMap.t_HashMap) (mc2 : (string, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc3 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc4 : Elab_dTypes.t_DtDef B_dData_dList.t_List) -> (match mc3 with
  | B_dData_dList.C_List__x58__x58_ (dtb__542, dtb__543) -> (if ((((B_dContainer_dHashMap.v_member B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) (B_dData_dPair.v_firstOf dtb__542)) mc1) then (((((v_extraDefsGo mc0) mc1) mc2) dtb__543) mc4) else ((Base_dCommon.v_bind ((v_defTypeOfTbl mc0) (B_dData_dPair.v_firstOf dtb__542))) (fun (ty : Core_dTerm.t_Term) -> (((((v_extraDefsGo mc0) mc1) mc2) dtb__543) (B_dData_dList.C_List__x58__x58_ ((Elab_dTypes.C_DtDef_DtDef ((B_dData_dPair.v_firstOf dtb__542), ty, (B_dData_dPair.v_secondOf dtb__542), ((v_spanOfName (B_dData_dPair.v_firstOf dtb__542)) mc2))), mc4))))))
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC ((B_dData_dList.v_reverse mc4)))
  | _ -> failwith "DT: impossible branch"
))

# 1540 "Vuna/Compiler/Elab/Trait.vuna"
let v_extraDefsOf = (fun (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ec : Elab_dTypes.t_Ec) (srcSpans : (string, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List) (sourceDefs : Elab_dTypes.t_DtDef B_dData_dList.t_List) -> (((((v_extraDefsGo (Elab_dTypes.v_ecGlobalsTbl ec)) (B_dContainer_dHashMap.v_ofNames ((B_dData_dList.v_map Elab_dTypes.v_dtDefName) sourceDefs))) srcSpans) (Elab_dTypes.v_ecDefs ec)) B_dData_dList.C_List_Nil))

# 1575 "Vuna/Compiler/Elab/Trait.vuna"
let rec v_bindDictBinderFuel = (fun (fuel : int) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (rig : Core_dTerm.t_Rig) (name : string) (dom : Core_dTerm.t_Value) (clo : Core_dTerm.t_Closure) (pats : Frontend_dRast.t_Pat B_dData_dList.t_List) (body : Frontend_dRast.t_Expr) (sp : Base_dSource.t_Span) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "binder check") else (let lvl = (Elab_dTypes.v_ctxDepth ctx) in (let v = ((Elab_dMeta.v_freshVarValue name) lvl) in (let ctx2 = (((Elab_dTypes.v_ctxBindValue name) dom) ctx) in (let expected2 = ((Core_dEval.v_applyClosure clo) v) in ((Base_dCommon.v_bind ((((((((v_checkBindersFuel (fuel - 1)) globals) ctx2) ec) pats) body) expected2) sp)) (fun (p : (Core_dTerm.t_Term, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match p with
  | { B_dData_dPair.f_Pair_first = dtb__544; B_dData_dPair.f_Pair_second = dtb__545 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Core_dTerm.C_Term_TLam (name, rig, B_dData_dMaybe.C_Maybe_Nothing, Base_dSource.v_spanEmpty, dtb__544)); B_dData_dPair.f_Pair_second = dtb__545 }))
  | _ -> failwith "DT: impossible branch"
)))))))))
# 1592 "Vuna/Compiler/Elab/Trait.vuna"
and v_bindIndexBinderFuel = (fun (fuel : int) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (rig : Core_dTerm.t_Rig) (name : string) (dom : Core_dTerm.t_Value) (clo : Core_dTerm.t_Closure) (pats : Frontend_dRast.t_Pat B_dData_dList.t_List) (body : Frontend_dRast.t_Expr) (sp : Base_dSource.t_Span) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "binder check") else (let lvl = (Elab_dTypes.v_ctxDepth ctx) in (let v = ((Elab_dMeta.v_freshVarValue name) lvl) in (let ctx2 = (((Elab_dTypes.v_ctxBindValue name) dom) ctx) in (let expected2 = ((Core_dEval.v_applyClosure clo) v) in ((Base_dCommon.v_bind ((((((((v_checkBindersFuel (fuel - 1)) globals) ctx2) ec) pats) body) expected2) sp)) (fun (p : (Core_dTerm.t_Term, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match p with
  | { B_dData_dPair.f_Pair_first = dtb__546; B_dData_dPair.f_Pair_second = dtb__547 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Core_dTerm.C_Term_TLam (name, rig, B_dData_dMaybe.C_Maybe_Nothing, Base_dSource.v_spanEmpty, dtb__546)); B_dData_dPair.f_Pair_second = dtb__547 }))
  | _ -> failwith "DT: impossible branch"
)))))))))
# 1612 "Vuna/Compiler/Elab/Trait.vuna"
and v_checkBodyAtEndFuel = (fun (fuel : int) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (body : Frontend_dRast.t_Expr) (expected : Core_dTerm.t_Value) (sp : Base_dSource.t_Span) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "binder check") else (match ((Elab_dTypes.v_forceVal ec) expected) with
  | Core_dTerm.C_Value_VPi (dtb__548, dtb__549, dtb__550, dtb__551, dtb__552) -> (if dtb__549 then (if ((Elab_dDict.v_isDictDomain ec) dtb__551) then (((((((((((v_bindDictBinderFuel (fuel - 1)) globals) ctx) ec) dtb__550) dtb__548) dtb__551) dtb__552) B_dData_dList.C_List_Nil) body) sp) else (if (((Elab_dMeta.v_isImplicitDomain ctx) ec) dtb__551) then (((((((((((v_bindIndexBinderFuel (fuel - 1)) globals) ctx) ec) dtb__550) dtb__548) dtb__551) dtb__552) B_dData_dList.C_List_Nil) body) sp) else ((Base_dDiagnostics_dTc.v_tcErr0 sp) Base_dDiagnostics_dTc.C_TcErr_ImplicitParamKind))) else ((Base_dCommon.v_bind (((((Elab_dTerm.v_checkE globals) ctx) ec) body) expected)) (fun (p : (Core_dTerm.t_Term, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> ((Base_dCommon.v_bind ((((Elab_dDict.v_resolveRowGoalsCtx globals) ctx) (B_dData_dPair.v_secondOf p)) sp)) (fun (ec2 : Elab_dTypes.t_Ec) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dPair.v_firstOf p); B_dData_dPair.f_Pair_second = ec2 })))))))
  | _ -> ((Base_dCommon.v_bind (((((Elab_dTerm.v_checkE globals) ctx) ec) body) expected)) (fun (p : (Core_dTerm.t_Term, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> ((Base_dCommon.v_bind ((((Elab_dDict.v_resolveRowGoalsCtx globals) ctx) (B_dData_dPair.v_secondOf p)) sp)) (fun (ec2 : Elab_dTypes.t_Ec) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dPair.v_firstOf p); B_dData_dPair.f_Pair_second = ec2 }))))))
)))
# 1621 "Vuna/Compiler/Elab/Trait.vuna"
and v_checkBindersFuel = (fun (mc0 : int) (mc1 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc2 : Elab_dTypes.t_Ctx) (mc3 : Elab_dTypes.t_Ec) (mc4 : Frontend_dRast.t_Pat B_dData_dList.t_List) (mc5 : Frontend_dRast.t_Expr) (mc6 : Core_dTerm.t_Value) (mc7 : Base_dSource.t_Span) -> (match mc4 with
  | B_dData_dList.C_List__x58__x58_ (dtb__553, dtb__554) -> (if (mc0 <= 0) then (Base_dDiag.v_icFuel "binder check") else (let forced = ((Elab_dTypes.v_forceVal mc3) mc6) in (match forced with
  | Core_dTerm.C_Value_VPi (dtb__555, dtb__556, dtb__557, dtb__558, dtb__559) -> (if dtb__556 then (if ((Elab_dDict.v_isDictDomain mc3) dtb__558) then (((((((((((v_bindDictBinderFuel (mc0 - 1)) mc1) mc2) mc3) dtb__557) dtb__555) dtb__558) dtb__559) (B_dData_dList.C_List__x58__x58_ (dtb__553, dtb__554))) mc5) mc7) else (if (((Elab_dMeta.v_isImplicitDomain mc2) mc3) dtb__558) then (((((((((((v_bindIndexBinderFuel (mc0 - 1)) mc1) mc2) mc3) dtb__557) dtb__555) dtb__558) dtb__559) (B_dData_dList.C_List__x58__x58_ (dtb__553, dtb__554))) mc5) mc7) else ((Base_dDiagnostics_dTc.v_tcErr0 mc7) Base_dDiagnostics_dTc.C_TcErr_ImplicitParamKind))) else (match dtb__553 with
  | Frontend_dRast.C_Pat_PVar (dtb__560, dtb__561) -> ((((((((((((v_bindOnePatternFuel (mc0 - 1)) mc1) mc2) mc3) dtb__557) dtb__560) dtb__554) mc5) dtb__558) dtb__559) ((Base_dSource.v_spanAtName dtb__560) dtb__561)) mc7)
  | Frontend_dRast.C_Pat_PWild (dtb__562) -> ((((((((((((v_bindOnePatternFuel (mc0 - 1)) mc1) mc2) mc3) dtb__557) "_") dtb__554) mc5) dtb__558) dtb__559) dtb__562) mc7)
  | _ -> ((Base_dDiagnostics_dTc.v_tcErr0 (Frontend_dRast.v_patSpan dtb__553)) Base_dDiagnostics_dTc.C_TcErr_DefParamsMustBeVars)
))
  | _ -> ((Base_dDiagnostics_dTc.v_tcErr0 mc7) Base_dDiagnostics_dTc.C_TcErr_DefMoreParams)
)))
  | B_dData_dList.C_List_Nil -> (if (mc0 <= 0) then (Base_dDiag.v_icFuel "binder check") else (let forced = ((Elab_dTypes.v_forceVal mc3) mc6) in (match forced with
  | Core_dTerm.C_Value_VPi (dtb__563, dtb__564, dtb__565, dtb__566, dtb__567) -> (if dtb__564 then (if ((Elab_dDict.v_isDictDomain mc3) dtb__566) then (((((((((((v_bindDictBinderFuel (mc0 - 1)) mc1) mc2) mc3) dtb__565) dtb__563) dtb__566) dtb__567) B_dData_dList.C_List_Nil) mc5) mc7) else (if (((Elab_dMeta.v_isImplicitDomain mc2) mc3) dtb__566) then (((((((((((v_bindIndexBinderFuel (mc0 - 1)) mc1) mc2) mc3) dtb__565) dtb__563) dtb__566) dtb__567) B_dData_dList.C_List_Nil) mc5) mc7) else ((Base_dDiagnostics_dTc.v_tcErr0 mc7) Base_dDiagnostics_dTc.C_TcErr_ImplicitParamKind))) else ((Base_dCommon.v_bind ((Base_dObs.v_obsCheck "vuna.elab.term.body") (fun (_u : int) -> (((((((v_checkBodyAtEndFuel (mc0 - 1)) mc1) mc2) mc3) mc5) mc6) mc7)))) (fun (p : (Core_dTerm.t_Term, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> ((Base_dCommon.v_bind ((Base_dObs.v_obsCheck "vuna.elab.term.goals") (fun (_u : int) -> ((((Elab_dDict.v_resolveRowGoalsCtx mc1) mc2) (B_dData_dPair.v_secondOf p)) mc7)))) (fun (ec2 : Elab_dTypes.t_Ec) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dPair.v_firstOf p); B_dData_dPair.f_Pair_second = ec2 })))))))
  | _ -> ((Base_dCommon.v_bind ((Base_dObs.v_obsCheck "vuna.elab.term.body") (fun (_u : int) -> (((((Elab_dTerm.v_checkE mc1) mc2) mc3) mc5) mc6)))) (fun (p : (Core_dTerm.t_Term, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> ((Base_dCommon.v_bind ((Base_dObs.v_obsCheck "vuna.elab.term.goals") (fun (_u : int) -> ((((Elab_dDict.v_resolveRowGoalsCtx mc1) mc2) (B_dData_dPair.v_secondOf p)) mc7)))) (fun (ec2 : Elab_dTypes.t_Ec) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dPair.v_firstOf p); B_dData_dPair.f_Pair_second = ec2 }))))))
)))
  | _ -> failwith "DT: impossible branch"
))
# 1648 "Vuna/Compiler/Elab/Trait.vuna"
and v_bindOnePatternFuel = (fun (fuel : int) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (rig : Core_dTerm.t_Rig) (pname : string) (pats : Frontend_dRast.t_Pat B_dData_dList.t_List) (body : Frontend_dRast.t_Expr) (dom : Core_dTerm.t_Value) (clo : Core_dTerm.t_Closure) (binderSp : Base_dSource.t_Span) (sp : Base_dSource.t_Span) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "binder check") else (let lvl = (Elab_dTypes.v_ctxDepth ctx) in (let v = ((Elab_dMeta.v_freshVarValue pname) lvl) in (let ctx2 = (((Elab_dTypes.v_ctxBindValue pname) dom) ctx) in ((Base_dCommon.v_bind (((((Elab_dMeta.v_rigForLinearDomain ec) sp) pname) rig) dom)) (fun (erasure : Core_dTerm.t_Rig) -> ((Base_dCommon.v_bind ((((((((v_checkBindersFuel (fuel - 1)) globals) ctx2) ec) pats) body) ((Core_dEval.v_applyClosure clo) v)) sp)) (fun (p : (Core_dTerm.t_Term, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match p with
  | { B_dData_dPair.f_Pair_first = dtb__568; B_dData_dPair.f_Pair_second = dtb__569 } -> (let inner2 = (if (((Elab_dMeta.v_isOpaqueRuntimeTyIn dtb__569) ctx) dom) then ((Elab_dMeta.v_wrapOpaqueUses (B_dData_dList.C_List__x58__x58_ (0, B_dData_dList.C_List_Nil))) dtb__568) else dtb__568) in (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Core_dTerm.C_Term_TLam (pname, erasure, B_dData_dMaybe.C_Maybe_Nothing, binderSp, inner2)); B_dData_dPair.f_Pair_second = dtb__569 })))
  | _ -> failwith "DT: impossible branch"
))))))))))

# 1711 "Vuna/Compiler/Elab/Trait.vuna"
let v_checkBinders = (fun (a1 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (a2 : Elab_dTypes.t_Ctx) (a3 : Elab_dTypes.t_Ec) (a4 : Frontend_dRast.t_Pat B_dData_dList.t_List) (a5 : Frontend_dRast.t_Expr) (a6 : Core_dTerm.t_Value) (a7 : Base_dSource.t_Span) -> ((((((((v_checkBindersFuel 512) a1) a2) a3) a4) a5) a6) a7))

# 1567 "Vuna/Compiler/Elab/Trait.vuna"
let v_checkDefIn = (fun (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx0 : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (pats : Frontend_dRast.t_Pat B_dData_dList.t_List) (body : Frontend_dRast.t_Expr) (expected : Core_dTerm.t_Value) (sp : Base_dSource.t_Span) -> (((((((v_checkBinders globals) ctx0) ec) pats) body) expected) sp))

# 1571 "Vuna/Compiler/Elab/Trait.vuna"
let v_checkDef = (fun (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ec : Elab_dTypes.t_Ec) (pats : Frontend_dRast.t_Pat B_dData_dList.t_List) (body : Frontend_dRast.t_Expr) (expected : Core_dTerm.t_Value) (sp : Base_dSource.t_Span) -> (((((((v_checkDefIn globals) Elab_dTypes.v_emptyCtx) ec) pats) body) expected) sp))

# 1687 "Vuna/Compiler/Elab/Trait.vuna"
let v_elabFunDefMulti = (fun (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx0 : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (clauses : (Frontend_dRast.t_Pat B_dData_dList.t_List, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (expected : Core_dTerm.t_Value) (sp : Base_dSource.t_Span) -> (let _u = (if ((dtp_log_on 3) "Vuna.Compiler.Elab.Trait") then (((dtp_log_emit 3) "Vuna.Compiler.Elab.Trait") "MULTI") else 0) in ((Base_dCommon.v_bind ((Base_dObs.v_obsCheck "vuna.elab.pats") (fun (_u : int) -> ((((Elab_dTerm.v_resolveOverFunPats ec) ctx0) expected) clauses)))) (fun (r : ((Frontend_dRast.t_Pat B_dData_dList.t_List, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match r with
  | { B_dData_dPair.f_Pair_first = dtb__570; B_dData_dPair.f_Pair_second = dtb__571 } -> (let table = (Elab_dMeta.v_ctorFamilyTable dtb__571) in ((Base_dCommon.v_bind ((Base_dObs.v_obsCheck "vuna.elab.pats") (fun (_u : int) -> ((Elab_dMatch.v_multiToExpr table) dtb__570)))) (fun (bodyExpr : Frontend_dRast.t_Expr) -> (let _u = (if ((dtp_log_on 3) "Vuna.Compiler.Elab.Trait") then (((dtp_log_emit 3) "Vuna.Compiler.Elab.Trait") "CHECKDEF") else 0) in (let checked = ((Base_dObs.v_obsCheck "vuna.elab.term") (fun (_u : int) -> (((((((v_checkDefIn globals) ctx0) dtb__571) B_dData_dList.C_List_Nil) bodyExpr) expected) sp))) in ((Base_dObs.v_obsCheck "vuna.elab.coverage") (fun (_u : int) -> ((((Elab_dCoverage.v_improveExhaustive table) (fun (_u : int) -> (Elab_dMatch.v_matrixOf dtb__570))) (Elab_dMatch.v_firstPatSpan dtb__570)) checked))))))))
  | _ -> failwith "DT: impossible branch"
)))))

# 1676 "Vuna/Compiler/Elab/Trait.vuna"
let v_elabFunDefIn = (fun (mc0 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc1 : Elab_dTypes.t_Ctx) (mc2 : Elab_dTypes.t_Ec) (mc3 : (Frontend_dRast.t_Pat B_dData_dList.t_List, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc4 : Core_dTerm.t_Value) (mc5 : Base_dSource.t_Span) -> (match mc3 with
  | B_dData_dList.C_List__x58__x58_ (dtb__572, dtb__573) -> (match dtb__572 with
  | { B_dData_dPair.f_Pair_first = dtb__574; B_dData_dPair.f_Pair_second = dtb__575 } -> (match dtb__573 with
  | B_dData_dList.C_List_Nil -> (if (Elab_dMatch.v_allVarPats dtb__574) then ((Base_dObs.v_obsCheck "vuna.elab.term") (fun (_u : int) -> (((((((v_checkDefIn mc0) mc1) mc2) dtb__574) dtb__575) mc4) mc5))) else ((((((v_elabFunDefMulti mc0) mc1) mc2) (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__574; B_dData_dPair.f_Pair_second = dtb__575 }, B_dData_dList.C_List_Nil))) mc4) mc5))
  | _ -> ((((((v_elabFunDefMulti mc0) mc1) mc2) mc3) mc4) mc5)
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> ((Base_dDiagnostics_dTc.v_tcErr0 mc5) Base_dDiagnostics_dTc.C_TcErr_FunctionNoClauses)
  | _ -> failwith "DT: impossible branch"
))

# 979 "Vuna/Compiler/Elab/Trait.vuna"
let v_elabInstanceMethodIn = (fun (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (mty : Core_dTerm.t_Term) (clauses : (Frontend_dRast.t_Pat B_dData_dList.t_List, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> ((((((v_elabFunDefIn globals) ctx) ec) clauses) ((Elab_dTypes.v_evalCtx ctx) mty)) (v_clauseSpanOf clauses)))

# 943 "Vuna/Compiler/Elab/Trait.vuna"
let rec v_elabInstanceMethodsGo = (fun (mc0 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc1 : Elab_dTypes.t_Ctx) (mc2 : int) (mc3 : Elab_dTypes.t_Ec) (mc4 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc5 : Core_dTerm.t_Term B_dData_dList.t_List) (mc6 : Frontend_dRast.t_Decl B_dData_dList.t_List) (mc7 : Core_dTerm.t_Term B_dData_dList.t_List) (mc8 : (Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc9 : Base_dSource.t_Span) -> (match mc4 with
  | B_dData_dList.C_List__x58__x58_ (dtb__576, dtb__577) -> (match dtb__576 with
  | { B_dData_dPair.f_Pair_first = dtb__578; B_dData_dPair.f_Pair_second = dtb__579 } -> (let clauses = ((v_methodClausesNamed dtb__578) mc6) in (let instTy = (((Core_dTerm.v_shift 0) mc2) ((v_substInstParams mc5) dtb__579)) in (match clauses with
  | B_dData_dList.C_List_Nil -> ((Base_dDiagnostics_dTc.v_tcErr0 mc9) Base_dDiagnostics_dTc.C_TcErr_InstanceMissingMethod)
  | _ -> ((Base_dCommon.v_bind (((((v_elabInstanceMethodIn mc0) mc1) mc3) instTy) clauses)) (fun (p : (Core_dTerm.t_Term, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match p with
  | { B_dData_dPair.f_Pair_first = dtb__580; B_dData_dPair.f_Pair_second = dtb__581 } -> ((((((((((v_elabInstanceMethodsGo mc0) mc1) mc2) dtb__581) dtb__577) mc5) mc6) (B_dData_dList.C_List__x58__x58_ (dtb__580, mc7))) (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__580; B_dData_dPair.f_Pair_second = Core_dTerm.C_Rig_RigOmega }, mc8))) mc9)
  | _ -> failwith "DT: impossible branch"
)))
)))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.v_reverse mc7); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = (B_dData_dList.v_reverse mc8); B_dData_dPair.f_Pair_second = mc3 } }))
  | _ -> failwith "DT: impossible branch"
))

# 873 "Vuna/Compiler/Elab/Trait.vuna"
let v_elabInstanceMethodsCtx = (fun (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (cls : Elab_dTypes.t_DtClass) (ctx : Elab_dTypes.t_Ctx) (nCtx : int) (headArgs : Core_dTerm.t_Term B_dData_dList.t_List) (ec : Elab_dTypes.t_Ec) (methods : Frontend_dRast.t_Decl B_dData_dList.t_List) (sp : Base_dSource.t_Span) -> ((((((((((v_elabInstanceMethodsGo globals) ctx) nCtx) ec) (v_zipClassFields cls)) headArgs) methods) B_dData_dList.C_List_Nil) B_dData_dList.C_List_Nil) sp))

# 983 "Vuna/Compiler/Elab/Trait.vuna"
let v_elabInstanceMethod = (fun (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ec : Elab_dTypes.t_Ec) (mty : Core_dTerm.t_Term) (clauses : (Frontend_dRast.t_Pat B_dData_dList.t_List, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (((((v_elabInstanceMethodIn globals) Elab_dTypes.v_emptyCtx) ec) mty) clauses))

# 1708 "Vuna/Compiler/Elab/Trait.vuna"
let v_elabFunDef = (fun (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ec : Elab_dTypes.t_Ec) (clauses : (Frontend_dRast.t_Pat B_dData_dList.t_List, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (expected : Core_dTerm.t_Value) (sp : Base_dSource.t_Span) -> ((((((v_elabFunDefIn globals) Elab_dTypes.v_emptyCtx) ec) clauses) expected) sp))

# 1714 "Vuna/Compiler/Elab/Trait.vuna"
let v_bindIndexBinder = (fun (a1 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (a2 : Elab_dTypes.t_Ctx) (a3 : Elab_dTypes.t_Ec) (a4 : Core_dTerm.t_Rig) (a5 : string) (a6 : Core_dTerm.t_Value) (a7 : Core_dTerm.t_Closure) (a8 : Frontend_dRast.t_Pat B_dData_dList.t_List) (a9 : Frontend_dRast.t_Expr) (a10 : Base_dSource.t_Span) -> (((((((((((v_bindIndexBinderFuel 512) a1) a2) a3) a4) a5) a6) a7) a8) a9) a10))

# 1718 "Vuna/Compiler/Elab/Trait.vuna"
let v_bindOnePattern = (fun (a1 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (a2 : Elab_dTypes.t_Ctx) (a3 : Elab_dTypes.t_Ec) (a4 : Core_dTerm.t_Rig) (a5 : string) (a6 : Frontend_dRast.t_Pat B_dData_dList.t_List) (a7 : Frontend_dRast.t_Expr) (a8 : Core_dTerm.t_Value) (a9 : Core_dTerm.t_Closure) (a10 : Base_dSource.t_Span) (a11 : Base_dSource.t_Span) -> ((((((((((((v_bindOnePatternFuel 512) a1) a2) a3) a4) a5) a6) a7) a8) a9) a10) a11))

# 445 "Vuna/Compiler/Elab/Trait.vuna"
let v_instSigClass = (fun (p : t_InstSigInfo) -> (match p with
  | { f_InstSigInfo_instSigClass = dtb__582; f_InstSigInfo_instSigTele = dtb__583; f_InstSigInfo_instSigCtx = dtb__584; f_InstSigInfo_instSigArgs = dtb__585; f_InstSigInfo_instSigHead = dtb__586 } -> dtb__582
  | _ -> failwith "DT: impossible branch"
))

# 446 "Vuna/Compiler/Elab/Trait.vuna"
let v_instSigTele = (fun (p : t_InstSigInfo) -> (match p with
  | { f_InstSigInfo_instSigClass = dtb__587; f_InstSigInfo_instSigTele = dtb__588; f_InstSigInfo_instSigCtx = dtb__589; f_InstSigInfo_instSigArgs = dtb__590; f_InstSigInfo_instSigHead = dtb__591 } -> dtb__588
  | _ -> failwith "DT: impossible branch"
))

# 447 "Vuna/Compiler/Elab/Trait.vuna"
let v_instSigCtx = (fun (p : t_InstSigInfo) -> (match p with
  | { f_InstSigInfo_instSigClass = dtb__592; f_InstSigInfo_instSigTele = dtb__593; f_InstSigInfo_instSigCtx = dtb__594; f_InstSigInfo_instSigArgs = dtb__595; f_InstSigInfo_instSigHead = dtb__596 } -> dtb__594
  | _ -> failwith "DT: impossible branch"
))

# 709 "Vuna/Compiler/Elab/Trait.vuna"
let v_instBodyCtx = (fun (info : t_InstSigInfo) -> (((v_instBodyCtxGo (v_instanceTeleCtx (v_instSigTele info))) (v_instSigCtx info)) 0))

# 721 "Vuna/Compiler/Elab/Trait.vuna"
let v_instValueOf = (fun (info : t_InstSigInfo) (ctor : string) (fields : Core_dTerm.t_Term B_dData_dList.t_List) -> ((v_instTeleLam (((v_instCtxLam (Core_dTerm.C_Term_TCon (ctor, ((B_dData_dList.v_map (fun (t : Core_dTerm.t_Term) -> { B_dData_dPair.f_Pair_first = t; B_dData_dPair.f_Pair_second = Core_dTerm.C_Rig_RigOmega })) fields)))) (B_dData_dList.v_length (v_instSigCtx info))) 0)) (v_instSigTele info)))

# 448 "Vuna/Compiler/Elab/Trait.vuna"
let v_instSigArgs = (fun (p : t_InstSigInfo) -> (match p with
  | { f_InstSigInfo_instSigClass = dtb__597; f_InstSigInfo_instSigTele = dtb__598; f_InstSigInfo_instSigCtx = dtb__599; f_InstSigInfo_instSigArgs = dtb__600; f_InstSigInfo_instSigHead = dtb__601 } -> dtb__600
  | _ -> failwith "DT: impossible branch"
))

# 449 "Vuna/Compiler/Elab/Trait.vuna"
let v_instSigHead = (fun (p : t_InstSigInfo) -> (match p with
  | { f_InstSigInfo_instSigClass = dtb__602; f_InstSigInfo_instSigTele = dtb__603; f_InstSigInfo_instSigCtx = dtb__604; f_InstSigInfo_instSigArgs = dtb__605; f_InstSigInfo_instSigHead = dtb__606 } -> dtb__606
  | _ -> failwith "DT: impossible branch"
))

# 742 "Vuna/Compiler/Elab/Trait.vuna"
let v_instTypeOf = (fun (info : t_InstSigInfo) -> (let nCtx = (B_dData_dList.v_length (v_instSigCtx info)) in (let body0 = (((Core_dTerm.v_shift 0) nCtx) (v_instSigHead info)) in (let body1 = (((v_instTypeCtx body0) (B_dData_dList.v_reverse (v_instSigCtx info))) (nCtx - 1)) in ((v_instTypeTele body1) (v_instSigTele info))))))

# 353 "Vuna/Compiler/Elab/Trait.vuna"
let v_elabInstanceWithClassGo = (fun (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (allDecls : (Frontend_dRast.t_Decl, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List) (cls : Elab_dTypes.t_DtClass) (info : t_InstSigInfo) (ec0 : Elab_dTypes.t_Ec) (headExpr : Frontend_dRast.t_Expr) (methods : Frontend_dRast.t_Decl B_dData_dList.t_List) (msp : Base_dSource.t_Span) -> (match ((v_firstUnknownInstanceMethod cls) methods) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__607) -> (((Base_dDiagnostics_dTc.v_tcErr1 msp) (Base_dDiagnostics_dTc.C_TcErr_InstanceUnknownMethod (dtb__607))) dtb__607)
  | B_dData_dMaybe.C_Maybe_Nothing -> (match ((v_firstMissingInstanceMethod cls) methods) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__608) -> (match (((v_traitMethodSpanOf cls) dtb__608) allDecls) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__609) -> ((Base_dDiagnostics_dTc.v_tcErr0 dtb__609) Base_dDiagnostics_dTc.C_TcErr_InstanceMissingMethod)
  | B_dData_dMaybe.C_Maybe_Nothing -> ((Base_dDiagnostics_dTc.v_tcErr0 msp) Base_dDiagnostics_dTc.C_TcErr_InstanceMissingMethod)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> (let bodyCtx = (v_instBodyCtx info) in (let nCtx = (B_dData_dList.v_length (v_instSigCtx info)) in (let nTele = (B_dData_dList.v_length (v_instSigTele info)) in (let bodyDepth = (bi_natAdd nTele nCtx) in (let iname = ((Elab_dInstName.v_instanceName (Elab_dTypes.v_dtClassName cls)) headExpr) in (let isym = ((Elab_dInstName.v_instanceSymbol (Elab_dTypes.v_dtClassName cls)) headExpr) in ((Base_dCommon.v_bind ((((((((v_checkSuperClasses globals) bodyCtx) nCtx) iname) msp) (v_instSigArgs info)) (cls).Elab_dTypes.f_DtClass_dtClassSupers) ec0)) (fun (ecSuper : Elab_dTypes.t_Ec) -> ((Base_dCommon.v_bind ((((((((v_elabInstanceMethodsCtx globals) cls) bodyCtx) nCtx) (v_instSigArgs info)) ecSuper) methods) msp)) (fun (q : (Core_dTerm.t_Term B_dData_dList.t_List, ((Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let fieldTerms = (B_dData_dPair.v_firstOf q) in (let ec1 = (B_dData_dPair.v_secondOf (B_dData_dPair.v_secondOf q)) in (let solvedCtx = (((((v_solveCtxGoals bodyCtx) nCtx) nTele) ec1) B_dData_dList.C_List_Nil) in (let ctxSubs = (B_dData_dPair.v_firstOf solvedCtx) in (let ec2 = (B_dData_dPair.v_secondOf solvedCtx) in (let fields1 = ((B_dData_dList.v_map ((v_applyCtxSubstsTo nTele) ctxSubs)) fieldTerms) in ((Base_dCommon.v_bind (((((((v_resolveRigidGoals globals) bodyCtx) msp) (Elab_dTypes.v_ecNextConstraintId ec0)) (Elab_dTypes.v_ecPendingList ec2)) B_dData_dList.C_List_Nil) ec2)) (fun (r : ((int, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (let globSubs = (B_dData_dPair.v_firstOf r) in (let ec3 = (B_dData_dPair.v_secondOf r) in (let fields2 = ((B_dData_dList.v_map ((v_applyTermSubstsTo bodyDepth) globSubs)) fields1) in (let dictTerm = (((v_instValueOf info) (Elab_dMeta.v_dictCtorName (Elab_dTypes.v_dtClassName cls))) fields2) in (let dictTyTerm = (v_instTypeOf info) in (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = isym; B_dData_dPair.f_Pair_second = dictTyTerm }, B_dData_dList.C_List_Nil)); B_dData_dPair.f_Pair_second = ((Elab_dTypes.v_ecAddDef ec3) { B_dData_dPair.f_Pair_first = isym; B_dData_dPair.f_Pair_second = dictTerm }) })))))))))))))))))))))))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 347 "Vuna/Compiler/Elab/Trait.vuna"
let v_elabInstanceWithClass = (fun (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (allDecls : (Frontend_dRast.t_Decl, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List) (cls : Elab_dTypes.t_DtClass) (info : t_InstSigInfo) (ec0 : Elab_dTypes.t_Ec) (headExpr : Frontend_dRast.t_Expr) (methods : Frontend_dRast.t_Decl B_dData_dList.t_List) (msp : Base_dSource.t_Span) -> (let nd_uscrut8 = ((v_firstDuplicateInstanceMethod cls) methods) in (match nd_uscrut8 with
  | B_dData_dMaybe.C_Maybe_Nothing -> ((((((((v_elabInstanceWithClassGo globals) allDecls) cls) info) ec0) headExpr) methods) msp)
  | B_dData_dMaybe.C_Maybe_Just (dtb__610) -> (match dtb__610 with
  | { B_dData_dPair.f_Pair_first = dtb__611; B_dData_dPair.f_Pair_second = dtb__612 } -> (((Base_dDiagnostics_dTc.v_tcErr1 dtb__612) (Base_dDiagnostics_dTc.C_TcErr_InstanceDuplicateMethod (dtb__611))) dtb__611)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))

# 404 "Vuna/Compiler/Elab/Trait.vuna"
let v_elabInstance = (fun (mc0 : (Frontend_dRast.t_Decl, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc1 : (Frontend_dRast.t_Decl, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc2 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc3 : Elab_dTypes.t_DtClass B_dData_dList.t_List) (mc4 : Elab_dTypes.t_DtData B_dData_dList.t_List) (mc5 : Elab_dTypes.t_Ec) (mc6 : (Frontend_dRast.t_Decl, Base_dSource.t_Span) B_dData_dPair.t_Pair) -> (match mc6 with
  | { B_dData_dPair.f_Pair_first = dtb__613; B_dData_dPair.f_Pair_second = dtb__614 } -> (match dtb__613 with
  | Frontend_dRast.C_Decl_DInstance (dtb__615, dtb__616, dtb__617, dtb__618) -> ((Base_dCommon.v_bind ((Base_dDiag.v_onErrDiag (Base_dDiag.v_withFallbackSpan dtb__618)) (((((((v_elabInstanceSig mc3) mc2) (Elab_dSig.v_definedNames ((B_dData_dList.v_map B_dData_dPair.v_firstOf) mc0))) mc5) dtb__618) dtb__616) dtb__615))) (fun (p : (t_InstSigInfo, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match p with
  | { B_dData_dPair.f_Pair_first = dtb__619; B_dData_dPair.f_Pair_second = dtb__620 } -> (match ((Elab_dDict.v_findClass (v_instSigClass dtb__619)) mc3) with
  | B_dData_dMaybe.C_Maybe_Nothing -> ((Base_dDiagnostics_dTc.v_tcErr0 dtb__618) Base_dDiagnostics_dTc.C_TcErr_InstanceHeadNotApp)
  | B_dData_dMaybe.C_Maybe_Just (dtb__621) -> (if ((((v_instanceLandingOk mc1) dtb__618) dtb__621) dtb__616) then ((((((((v_elabInstanceWithClass mc2) mc1) dtb__621) dtb__619) dtb__620) dtb__616) dtb__617) dtb__618) else ((Base_dDiagnostics_dTc.v_tcErr0 dtb__618) Base_dDiagnostics_dTc.C_TcErr_OrphanInstance))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> ((Elab_dTypes.v_errAt dtb__614) "DT: internal: expected an instance declaration")
)
  | _ -> failwith "DT: impossible branch"
))

# 1427 "Vuna/Compiler/Elab/Trait.vuna"
let rec v_checkInstanceHeadsGo = (fun (mc0 : (Frontend_dRast.t_Decl, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc1 : Elab_dTypes.t_DtClass B_dData_dList.t_List) (mc2 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc3 : Elab_dTypes.t_Ec) (mc4 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc5 : Elab_dTypes.t_DtInst B_dData_dList.t_List) (mc6 : Elab_dTypes.t_DtInst B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__622, dtb__623) -> (match dtb__622 with
  | { B_dData_dPair.f_Pair_first = dtb__624; B_dData_dPair.f_Pair_second = dtb__625 } -> (match dtb__624 with
  | Frontend_dRast.C_Decl_DInstance (dtb__626, dtb__627, dtb__628, dtb__629) -> ((Base_dCommon.v_bind (((((((v_elabInstanceSig mc1) mc2) (Elab_dSig.v_definedNames ((B_dData_dList.v_map B_dData_dPair.v_firstOf) (B_dData_dList.C_List__x58__x58_ (dtb__622, dtb__623))))) mc3) dtb__629) dtb__627) dtb__626)) (fun (p : (t_InstSigInfo, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match p with
  | { B_dData_dPair.f_Pair_first = dtb__630; B_dData_dPair.f_Pair_second = dtb__631 } -> (let iname = ((Elab_dInstName.v_instanceName (v_instSigClass dtb__630)) dtb__627) in (let isym = ((Elab_dInstName.v_instanceSymbol (v_instSigClass dtb__630)) dtb__627) in (let ikey = ((((Elab_dInstCoherence.v_instanceKey dtb__631) (v_instSigClass dtb__630)) (v_instSigTele dtb__630)) (v_instSigHead dtb__630)) in (let ty = (v_instTypeOf dtb__630) in (let inst = { Elab_dTypes.f_DtInst_dtInstName = iname; Elab_dTypes.f_DtInst_dtInstSym = isym; Elab_dTypes.f_DtInst_dtInstKey = ikey; Elab_dTypes.f_DtInst_dtInstTele = (v_instSigTele dtb__630); Elab_dTypes.f_DtInst_dtInstCtx = (v_instSigCtx dtb__630); Elab_dTypes.f_DtInst_dtInstHead = (v_instSigHead dtb__630); Elab_dTypes.f_DtInst_dtInstSpan = (B_dData_dMaybe.C_Maybe_Just (dtb__629)) } in (let nd_uscrut28 = (((((((Elab_dInstCoherence.v_findInstanceClash dtb__631) iname) isym) ikey) (v_instSigTele dtb__630)) (v_instSigHead dtb__630)) ((B_dData_dList.v_append (Elab_dTypes.v_ecInstList dtb__631)) mc6)) in (match nd_uscrut28 with
  | { B_dData_dPair.f_Pair_first = dtb__632; B_dData_dPair.f_Pair_second = dtb__633 } -> (match dtb__632 with
  | B_dData_dMaybe.C_Maybe_Nothing -> (((((((v_checkInstanceHeadsGo dtb__623) mc1) mc2) dtb__633) (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = isym; B_dData_dPair.f_Pair_second = ty }, mc4))) (B_dData_dList.C_List__x58__x58_ (inst, mc5))) (B_dData_dList.C_List__x58__x58_ (inst, mc6)))
  | B_dData_dMaybe.C_Maybe_Just (dtb__634) -> (match dtb__634 with
  | Elab_dInstCoherence.C_InstClash_ClashOverlap -> (((Base_dDiagnostics_dTc.v_tcErr1 dtb__629) (Base_dDiagnostics_dTc.C_TcErr_OverlappingInstances (iname))) iname)
  | Elab_dInstCoherence.C_InstClash_ClashDuplicate -> (((Base_dDiagnostics_dTc.v_tcErr1 dtb__629) (Base_dDiagnostics_dTc.C_TcErr_DuplicateInstance (iname))) iname)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))))))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> (((((((v_checkInstanceHeadsGo dtb__623) mc1) mc2) mc3) mc4) mc5) mc6)
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.v_reverse mc4); B_dData_dPair.f_Pair_second = ((v_foldlAddInst mc3) (B_dData_dList.v_reverse mc5)) }))
  | _ -> failwith "DT: impossible branch"
))

# 1424 "Vuna/Compiler/Elab/Trait.vuna"
let v_checkInstanceHeads = (fun (decls : (Frontend_dRast.t_Decl, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List) (classes : Elab_dTypes.t_DtClass B_dData_dList.t_List) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ec : Elab_dTypes.t_Ec) -> (((((((v_checkInstanceHeadsGo decls) classes) globals) ec) B_dData_dList.C_List_Nil) B_dData_dList.C_List_Nil) B_dData_dList.C_List_Nil))

# 1467 "Vuna/Compiler/Elab/Trait.vuna"
let rec v_elabInstanceBodiesGo = (fun (mc0 : bool) (mc1 : (Frontend_dRast.t_Decl, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc2 : (Frontend_dRast.t_Decl, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc3 : Elab_dTypes.t_DtClass B_dData_dList.t_List) (mc4 : Elab_dTypes.t_DtData B_dData_dList.t_List) (mc5 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc6 : Elab_dTypes.t_Ec) (mc7 : Elab_dTypes.t_DtDef B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__635, dtb__636) -> (match (((((((v_elabInstance (B_dData_dList.C_List__x58__x58_ (dtb__635, dtb__636))) mc2) mc5) mc3) mc4) mc6) dtb__635) with
  | Base_dDiag.C_Check_ErrC (dtb__637) -> (if mc0 then ((((((((v_elabInstanceBodiesGo mc0) dtb__636) mc2) mc3) mc4) mc5) ((Elab_dTypes.v_ecAddError mc6) dtb__637)) mc7) else (Base_dDiag.C_Check_ErrC (dtb__637)))
  | Base_dDiag.C_Check_OkC (dtb__638) -> (match dtb__638 with
  | { B_dData_dPair.f_Pair_first = dtb__639; B_dData_dPair.f_Pair_second = dtb__640 } -> ((Base_dCommon.v_bind ((((v_instanceDefsOf mc6) dtb__640) (B_dData_dMaybe.C_Maybe_Just ((B_dData_dPair.v_secondOf dtb__635)))) dtb__639)) (fun (newDefs : Elab_dTypes.t_DtDef B_dData_dList.t_List) -> (let ecTbl = ((Elab_dTypes.v_ecPutGlobalsTbl dtb__640) ((((B_dContainer_dHashMap.v_insertAll B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) dtb__639) (Elab_dTypes.v_ecGlobalsTbl dtb__640))) in ((((((((v_elabInstanceBodiesGo mc0) dtb__636) mc2) mc3) mc4) ((B_dData_dList.v_append mc5) dtb__639)) ecTbl) ((B_dData_dList.v_append newDefs) mc7)))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.v_reverse mc7); B_dData_dPair.f_Pair_second = mc6 }))
  | _ -> failwith "DT: impossible branch"
))

# 1455 "Vuna/Compiler/Elab/Trait.vuna"
let v_elabInstanceBodies = (fun (recover : bool) (allDecls : Frontend_dRast.t_Decl B_dData_dList.t_List) (classes : Elab_dTypes.t_DtClass B_dData_dList.t_List) (datas : Elab_dTypes.t_DtData B_dData_dList.t_List) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ec : Elab_dTypes.t_Ec) -> ((((((((v_elabInstanceBodiesGo recover) ((Elab_dMeta.v_collectInstDecls allDecls) B_dData_dList.C_List_Nil)) ((B_dData_dList.v_map (fun (d : Frontend_dRast.t_Decl) -> { B_dData_dPair.f_Pair_first = d; B_dData_dPair.f_Pair_second = (Frontend_dRast.v_declSpan d) })) allDecls)) classes) datas) globals) ec) B_dData_dList.C_List_Nil))

# 1526 "Vuna/Compiler/Elab/Trait.vuna"
let rec v_elabInstancesGo = (fun (mc0 : (Frontend_dRast.t_Decl, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc1 : Elab_dTypes.t_DtClass B_dData_dList.t_List) (mc2 : Elab_dTypes.t_DtData B_dData_dList.t_List) (mc3 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc4 : Elab_dTypes.t_Ec) (mc5 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__641, dtb__642) -> ((Base_dCommon.v_bind (((((((v_elabInstance (B_dData_dList.C_List__x58__x58_ (dtb__641, dtb__642))) B_dData_dList.C_List_Nil) mc3) mc1) mc2) mc4) dtb__641)) (fun (p : ((string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match p with
  | { B_dData_dPair.f_Pair_first = dtb__643; B_dData_dPair.f_Pair_second = dtb__644 } -> ((((((v_elabInstancesGo dtb__642) mc1) mc2) ((B_dData_dList.v_append mc3) dtb__643)) dtb__644) ((B_dData_dList.v_append dtb__643) mc5))
  | _ -> failwith "DT: impossible branch"
)))
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.v_reverse mc5); B_dData_dPair.f_Pair_second = mc4 }))
  | _ -> failwith "DT: impossible branch"
))

# 1523 "Vuna/Compiler/Elab/Trait.vuna"
let v_elabInstances = (fun (decls : (Frontend_dRast.t_Decl, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List) (classes : Elab_dTypes.t_DtClass B_dData_dList.t_List) (datas : Elab_dTypes.t_DtData B_dData_dList.t_List) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ec : Elab_dTypes.t_Ec) -> ((((((v_elabInstancesGo decls) classes) datas) globals) ec) B_dData_dList.C_List_Nil))

# 1127 "Vuna/Compiler/Elab/Trait.vuna"
let v_dictGoalGroupRep = (fun (p : t_DictGoalGroup) -> (match p with
  | { f_DictGoalGroup_dictGoalGroupRep = dtb__645; f_DictGoalGroup_dictGoalGroupDom = dtb__646; f_DictGoalGroup_dictGoalGroupExtras = dtb__647 } -> dtb__645
  | _ -> failwith "DT: impossible branch"
))

# 1128 "Vuna/Compiler/Elab/Trait.vuna"
let v_dictGoalGroupDom = (fun (p : t_DictGoalGroup) -> (match p with
  | { f_DictGoalGroup_dictGoalGroupRep = dtb__648; f_DictGoalGroup_dictGoalGroupDom = dtb__649; f_DictGoalGroup_dictGoalGroupExtras = dtb__650 } -> dtb__649
  | _ -> failwith "DT: impossible branch"
))

# 1129 "Vuna/Compiler/Elab/Trait.vuna"
let v_dictGoalGroupExtras = (fun (p : t_DictGoalGroup) -> (match p with
  | { f_DictGoalGroup_dictGoalGroupRep = dtb__651; f_DictGoalGroup_dictGoalGroupDom = dtb__652; f_DictGoalGroup_dictGoalGroupExtras = dtb__653 } -> dtb__653
  | _ -> failwith "DT: impossible branch"
))

# 1204 "Vuna/Compiler/Elab/Trait.vuna"
let v_dpName = (fun (p : t_DictPlan) -> (match p with
  | { f_DictPlan_dpName = dtb__654; f_DictPlan_dpLevel = dtb__655; f_DictPlan_dpDom = dtb__656; f_DictPlan_dpMetas = dtb__657 } -> dtb__654
  | _ -> failwith "DT: impossible branch"
))

# 1206 "Vuna/Compiler/Elab/Trait.vuna"
let v_dpLevel = (fun (p : t_DictPlan) -> (match p with
  | { f_DictPlan_dpName = dtb__658; f_DictPlan_dpLevel = dtb__659; f_DictPlan_dpDom = dtb__660; f_DictPlan_dpMetas = dtb__661 } -> dtb__659
  | _ -> failwith "DT: impossible branch"
))

# 1208 "Vuna/Compiler/Elab/Trait.vuna"
let v_dpDom = (fun (p : t_DictPlan) -> (match p with
  | { f_DictPlan_dpName = dtb__662; f_DictPlan_dpLevel = dtb__663; f_DictPlan_dpDom = dtb__664; f_DictPlan_dpMetas = dtb__665 } -> dtb__664
  | _ -> failwith "DT: impossible branch"
))

# 1210 "Vuna/Compiler/Elab/Trait.vuna"
let v_dpMetas = (fun (p : t_DictPlan) -> (match p with
  | { f_DictPlan_dpName = dtb__666; f_DictPlan_dpLevel = dtb__667; f_DictPlan_dpDom = dtb__668; f_DictPlan_dpMetas = dtb__669 } -> dtb__669
  | _ -> failwith "DT: impossible branch"
))
