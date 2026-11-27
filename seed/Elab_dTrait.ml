open Vuna_runtime
type t_InstSigInfo = { f_InstSigInfo_instSigClass : string; f_InstSigInfo_instSigTele : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List; f_InstSigInfo_instSigCtx : Core_dTerm.t_Term B_dData_dList.t_List; f_InstSigInfo_instSigArgs : Core_dTerm.t_Term B_dData_dList.t_List; f_InstSigInfo_instSigHead : Core_dTerm.t_Term }
and t_DictGoalGroup = { f_DictGoalGroup_dictGoalGroupRep : int; f_DictGoalGroup_dictGoalGroupDom : Core_dTerm.t_Value; f_DictGoalGroup_dictGoalGroupExtras : int B_dData_dList.t_List }
and t_DictPlan = { f_DictPlan_dpName : string; f_DictPlan_dpLevel : int; f_DictPlan_dpDom : Core_dTerm.t_Term; f_DictPlan_dpMetas : int B_dData_dList.t_List }

# 31 "Vuna/Compiler/Elab/Trait.vuna"
let rec v_bindClassParams = (fun (mc0 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc1 : Elab_dTypes.t_Ctx) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__0, dtb__1) -> (match dtb__0 with
  | { B_dData_dPair.f_Pair_first = dtb__2; B_dData_dPair.f_Pair_second = dtb__3 } -> ((v_bindClassParams dtb__1) (((Elab_dTypes.v_ctxBind dtb__2) dtb__3) mc1))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> mc1
  | _ -> failwith "DT: impossible branch"
))

# 40 "Vuna/Compiler/Elab/Trait.vuna"
let rec v_classFieldTysGo = (fun (mc0 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc1 : Elab_dTypes.t_Ctx) (mc2 : Elab_dTypes.t_Ec) (mc3 : (string, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc4 : Core_dTerm.t_Term B_dData_dList.t_List) -> (match mc3 with
  | B_dData_dList.C_List__x58__x58_ (dtb__4, dtb__5) -> (match dtb__4 with
  | { B_dData_dPair.f_Pair_first = dtb__6; B_dData_dPair.f_Pair_second = dtb__7 } -> ((Base_dCommon.v_bind ((((Elab_dTerm.v_checkType mc0) mc1) mc2) (((Elab_dSig.v_quantifyTraitSig (fun (nm : string) -> (B_dData_dMaybe.v_isJust ((Elab_dTypes.v_ctxLookup nm) mc1)))) dtb__7) (Frontend_dAst.v_exprSpan dtb__7)))) (fun (p : (Core_dTerm.t_Term, (Core_dTerm.t_Level, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let nd_uscrut13 = p in (match nd_uscrut13 with
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

# 36 "Vuna/Compiler/Elab/Trait.vuna"
let v_classFieldTys = (fun (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ec : Elab_dTypes.t_Ec) (paramsKinds : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (methods : (string, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (((((v_classFieldTysGo globals) ((v_bindClassParams paramsKinds) Elab_dTypes.v_emptyCtx)) ec) methods) B_dData_dList.C_List_Nil))

# 55 "Vuna/Compiler/Elab/Trait.vuna"
let rec v_foldlAddDef = (fun (mc0 : Elab_dTypes.t_Ec) (mc1 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__12, dtb__13) -> ((v_foldlAddDef ((Elab_dTypes.v_ecAddDef mc0) dtb__12)) dtb__13)
  | B_dData_dList.C_List_Nil -> mc0
  | _ -> failwith "DT: impossible branch"
))

# 66 "Vuna/Compiler/Elab/Trait.vuna"
let[@tail_mod_cons] rec v_foldPiFieldTysGo = (fun (mc0 : Core_dTerm.t_Term B_dData_dList.t_List) (mc1 : int) (mc2 : Core_dTerm.t_Term) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__14, dtb__15) -> (Core_dTerm.C_Term_TPi ("_", false, Core_dTerm.C_Rig_RigOmega, (((Core_dTerm.v_shift 0) mc1) dtb__14), (((v_foldPiFieldTysGo dtb__15) (mc1 + 1)) mc2)))
  | B_dData_dList.C_List_Nil -> mc2
  | _ -> failwith "DT: impossible branch"
))

# 63 "Vuna/Compiler/Elab/Trait.vuna"
let v_foldPiFieldTys = (fun (fieldTys : Core_dTerm.t_Term B_dData_dList.t_List) (ty : Core_dTerm.t_Term) -> (((v_foldPiFieldTysGo fieldTys) 0) ty))

# 131 "Vuna/Compiler/Elab/Trait.vuna"
let[@tail_mod_cons] rec v_classParamKinds = (fun (mc0 : string B_dData_dList.t_List) (mc1 : (string, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__16, dtb__17) -> (B_dData_dList.C_List__x58__x58_ (((Elab_dSig.v_classParamKindOf dtb__16) mc1), ((v_classParamKinds dtb__17) mc1)))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 136 "Vuna/Compiler/Elab/Trait.vuna"
let[@tail_mod_cons] rec v_traitParamNames = (fun (mc0 : Frontend_dAst.t_TraitParam B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__18, dtb__19) -> (match dtb__18 with
  | { Frontend_dAst.f_TraitParam_traitParamName = dtb__20; Frontend_dAst.f_TraitParam_traitParamKind = dtb__21 } -> (B_dData_dList.C_List__x58__x58_ (dtb__20, (v_traitParamNames dtb__19)))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 140 "Vuna/Compiler/Elab/Trait.vuna"
let rec v_traitParamKinds = (fun (mc0 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc1 : Elab_dTypes.t_Ec) (mc2 : Frontend_dAst.t_TraitParam B_dData_dList.t_List) (mc3 : (string, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__22, dtb__23) -> (match dtb__22 with
  | { Frontend_dAst.f_TraitParam_traitParamName = dtb__24; Frontend_dAst.f_TraitParam_traitParamKind = dtb__25 } -> (match dtb__25 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__26) -> (((((v_traitKindExplicit mc0) mc1) dtb__26) dtb__23) mc3)
  | B_dData_dMaybe.C_Maybe_Nothing -> (((((v_traitKindInfer mc0) mc1) dtb__24) dtb__23) mc3)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = mc1 }))
  | _ -> failwith "DT: impossible branch"
))
# 147 "Vuna/Compiler/Elab/Trait.vuna"
and v_traitKindExplicit = (fun (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ec : Elab_dTypes.t_Ec) (kexpr : Frontend_dAst.t_Expr) (rest : Frontend_dAst.t_TraitParam B_dData_dList.t_List) (methods : (string, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> ((Base_dCommon.v_bind ((((Elab_dTerm.v_checkType globals) Elab_dTypes.v_emptyCtx) ec) kexpr)) (fun (pk : (Core_dTerm.t_Term, (Core_dTerm.t_Level, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let nd_uscrut6 = pk in (match nd_uscrut6 with
  | { B_dData_dPair.f_Pair_first = dtb__27; B_dData_dPair.f_Pair_second = dtb__28 } -> (match dtb__28 with
  | { B_dData_dPair.f_Pair_first = dtb__29; B_dData_dPair.f_Pair_second = dtb__30 } -> ((Base_dCommon.v_bind ((((v_traitParamKinds globals) dtb__30) rest) methods)) (fun (pr : (Core_dTerm.t_Term B_dData_dList.t_List, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match pr with
  | { B_dData_dPair.f_Pair_first = dtb__31; B_dData_dPair.f_Pair_second = dtb__32 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ (dtb__27, dtb__31)); B_dData_dPair.f_Pair_second = dtb__32 }))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))))
# 160 "Vuna/Compiler/Elab/Trait.vuna"
and v_traitKindInfer = (fun (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ec : Elab_dTypes.t_Ec) (pname : string) (rest : Frontend_dAst.t_TraitParam B_dData_dList.t_List) (methods : (string, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> ((Base_dCommon.v_bind ((((v_traitParamKinds globals) ec) rest) methods)) (fun (pr : (Core_dTerm.t_Term B_dData_dList.t_List, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match pr with
  | { B_dData_dPair.f_Pair_first = dtb__33; B_dData_dPair.f_Pair_second = dtb__34 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ (((Elab_dSig.v_classParamKindOf pname) methods), dtb__33)); B_dData_dPair.f_Pair_second = dtb__34 }))
  | _ -> failwith "DT: impossible branch"
))))

# 169 "Vuna/Compiler/Elab/Trait.vuna"
let[@tail_mod_cons] rec v_foldParamPis = (fun (mc0 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc1 : Core_dTerm.t_Term) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__35, dtb__36) -> (match dtb__35 with
  | { B_dData_dPair.f_Pair_first = dtb__37; B_dData_dPair.f_Pair_second = dtb__38 } -> (Core_dTerm.C_Term_TPi (dtb__37, true, Core_dTerm.C_Rig_Rig0, dtb__38, ((v_foldParamPis dtb__36) mc1)))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> mc1
  | _ -> failwith "DT: impossible branch"
))

# 177 "Vuna/Compiler/Elab/Trait.vuna"
let[@tail_mod_cons] rec v_dictParamArgs = (fun (mc0 : string B_dData_dList.t_List) (mc1 : int) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__39, dtb__40) -> (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = (Core_dTerm.C_Term_TVar (dtb__39, mc1, { Base_dSource.f_Span_spanFile = ""; Base_dSource.f_Span_spanStartLine = 0; Base_dSource.f_Span_spanStartCol = 0; Base_dSource.f_Span_spanEndLine = 0; Base_dSource.f_Span_spanEndCol = 0; Base_dSource.f_Span_spanStartOffset = 0; Base_dSource.f_Span_spanEndOffset = 0 })); B_dData_dPair.f_Pair_second = Core_dTerm.C_Rig_Rig0 }, ((v_dictParamArgs dtb__40) (mc1 - 1))))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 174 "Vuna/Compiler/Elab/Trait.vuna"
let v_dictAppTermOf = (fun (dname : string) (params : string B_dData_dList.t_List) -> ((Elab_dMeta.v_foldAppTerms (Core_dTerm.C_Term_TGlobal (dname))) ((v_dictParamArgs params) ((B_dData_dList.v_length params) - 1))))

# 182 "Vuna/Compiler/Elab/Trait.vuna"
let[@tail_mod_cons] rec v_traitMethodPairs = (fun (mc0 : Frontend_dAst.t_TraitMethod B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__41, dtb__42) -> (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.v_traitMethodName dtb__41); B_dData_dPair.f_Pair_second = (dtb__41).Frontend_dAst.f_TraitMethod_traitMethodType }, (v_traitMethodPairs dtb__42)))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 205 "Vuna/Compiler/Elab/Trait.vuna"
let v_methodProjType = (fun (tname : string) (params : string B_dData_dList.t_List) (pKinds : Core_dTerm.t_Term B_dData_dList.t_List) (methodTy : Core_dTerm.t_Term) -> (let dictPi = (Core_dTerm.C_Term_TPi ("_", true, Core_dTerm.C_Rig_RigOmega, ((v_dictAppTermOf (Elab_dMeta.v_dictTypeName tname)) params), (((Core_dTerm.v_shift 0) 1) methodTy))) in ((v_foldParamPis ((B_dData_dList.v_zip params) pKinds)) dictPi)))

# 197 "Vuna/Compiler/Elab/Trait.vuna"
let[@tail_mod_cons] rec v_methodProjZip = (fun (mc0 : string) (mc1 : string B_dData_dList.t_List) (mc2 : Core_dTerm.t_Term B_dData_dList.t_List) (mc3 : int) (mc4 : (string, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc5 : Core_dTerm.t_Term B_dData_dList.t_List) -> (match mc4 with
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

# 193 "Vuna/Compiler/Elab/Trait.vuna"
let v_methodProjections = (fun (tname : string) (params : string B_dData_dList.t_List) (pKinds : Core_dTerm.t_Term B_dData_dList.t_List) (methods : (string, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (fieldTys : Core_dTerm.t_Term B_dData_dList.t_List) -> ((((((v_methodProjZip tname) params) pKinds) 0) methods) fieldTys))

# 245 "Vuna/Compiler/Elab/Trait.vuna"
let[@tail_mod_cons] rec v_projectionParamLams = (fun (mc0 : string B_dData_dList.t_List) (mc1 : Core_dTerm.t_Term) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__49, dtb__50) -> (Core_dTerm.C_Term_TLam (dtb__49, Core_dTerm.C_Rig_Rig0, B_dData_dMaybe.C_Maybe_Nothing, Base_dSource.v_spanEmpty, ((v_projectionParamLams dtb__50) mc1)))
  | B_dData_dList.C_List_Nil -> mc1
  | _ -> failwith "DT: impossible branch"
))

# 250 "Vuna/Compiler/Elab/Trait.vuna"
let v_projectionParamNames = (fun (n : int) -> (if (n = 1) then (B_dData_dList.C_List__x58__x58_ ("_p", B_dData_dList.C_List_Nil)) else ((B_dData_dList.v_map (fun (i : int) -> ("_p" ^ ((B_dTrait_dInterp.v_interp (B_dTrait_dInterp.v_Interp_uc9feaa570847b590_ua B_dData_dInt.v_Show_u0077d73cf424e521_uInt)) (Obj.magic i))))) ((B_dData_dList.v_range 0) n))))

# 226 "Vuna/Compiler/Elab/Trait.vuna"
let v_projectionBodyOpaque = (fun (fieldOpaque : bool) (ctor : string) (fieldIdx : int) (rigs : Core_dTerm.t_Rig B_dData_dList.t_List) (nFields : int) (nParams : int) -> (let arity = (B_dData_dList.v_length rigs) in (let dictIdx = arity in (let fieldVar = (Core_dTerm.C_Term_TVar ((Elab_dMeta.v_fieldVarName fieldIdx), ((nFields - 1) - fieldIdx), { Base_dSource.f_Span_spanFile = ""; Base_dSource.f_Span_spanStartLine = 0; Base_dSource.f_Span_spanStartCol = 0; Base_dSource.f_Span_spanEndLine = 0; Base_dSource.f_Span_spanEndCol = 0; Base_dSource.f_Span_spanStartOffset = 0; Base_dSource.f_Span_spanEndOffset = 0 })) in (let argPairs = ((Elab_dMeta.v_methodArgTerms rigs) nFields) in (let applied0 = ((Elab_dMeta.v_foldAppTerms fieldVar) argPairs) in (let applied = (if fieldOpaque then ((Elab_dMeta.v_wrapOpaqueUses (B_dData_dList.C_List__x58__x58_ (((nFields - 1) - fieldIdx), B_dData_dList.C_List_Nil))) applied0) else applied0) in (let binders = (Core_dTerm.v_bindersOfPairs (Elab_dMeta.v_fieldBinderNames nFields)) in (let alt = { Core_dTerm.f_CaseAlt_caseAltName = ctor; Core_dTerm.f_CaseAlt_caseAltBinders = binders; Core_dTerm.f_CaseAlt_caseAltBody = applied } in (let caseTerm = (Core_dTerm.C_Term_TCase ((Core_dTerm.C_Term_TVar ("_d", dictIdx, { Base_dSource.f_Span_spanFile = ""; Base_dSource.f_Span_spanStartLine = 0; Base_dSource.f_Span_spanStartCol = 0; Base_dSource.f_Span_spanEndLine = 0; Base_dSource.f_Span_spanEndCol = 0; Base_dSource.f_Span_spanStartOffset = 0; Base_dSource.f_Span_spanEndOffset = 0 })), (B_dData_dList.C_List__x58__x58_ (alt, B_dData_dList.C_List_Nil)))) in (let lamArgs = (((Elab_dMeta.v_methodArgLams rigs) 0) caseTerm) in ((v_projectionParamLams (v_projectionParamNames nParams)) (Core_dTerm.C_Term_TLam ("_d", Core_dTerm.C_Rig_RigOmega, B_dData_dMaybe.C_Maybe_Nothing, Base_dSource.v_spanEmpty, lamArgs))))))))))))))

# 218 "Vuna/Compiler/Elab/Trait.vuna"
let v_projectionBody = (fun (ctor : string) (fieldIdx : int) (rigs : Core_dTerm.t_Rig B_dData_dList.t_List) (nFields : int) (nParams : int) -> ((((((v_projectionBodyOpaque false) ctor) fieldIdx) rigs) nFields) nParams))

# 271 "Vuna/Compiler/Elab/Trait.vuna"
let rec v_flagAt = (fun (mc0 : int) (mc1 : bool B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__51, dtb__52) -> (if (mc0 <= 0) then dtb__51 else ((v_flagAt (mc0 - 1)) dtb__52))
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 263 "Vuna/Compiler/Elab/Trait.vuna"
let[@tail_mod_cons] rec v_projectionDefsOpaqueGo = (fun (mc0 : bool B_dData_dList.t_List) (mc1 : string) (mc2 : int) (mc3 : (string, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc4 : Core_dTerm.t_Term B_dData_dList.t_List) (mc5 : int) (mc6 : int) -> (match mc3 with
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

# 259 "Vuna/Compiler/Elab/Trait.vuna"
let v_projectionDefsOpaque = (fun (flags : bool B_dData_dList.t_List) (tname : string) (nParams : int) (methods : (string, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (fieldTys : Core_dTerm.t_Term B_dData_dList.t_List) (nFields : int) -> (((((((v_projectionDefsOpaqueGo flags) (Elab_dMeta.v_dictCtorName tname)) nParams) methods) fieldTys) 0) nFields))

# 254 "Vuna/Compiler/Elab/Trait.vuna"
let v_projectionDefs = (fun (tname : string) (nParams : int) (methods : (string, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (fieldTys : Core_dTerm.t_Term B_dData_dList.t_List) (nFields : int) -> ((((((v_projectionDefsOpaque ((B_dData_dList.v_map (fun (_u : Core_dTerm.t_Term) -> false)) fieldTys)) tname) nParams) methods) fieldTys) nFields))

# 275 "Vuna/Compiler/Elab/Trait.vuna"
let v_projectionDefsGo = (fun (ctor : string) (nParams : int) (methods : (string, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (fieldTys : Core_dTerm.t_Term B_dData_dList.t_List) (idx : int) (nFields : int) -> (((((((v_projectionDefsOpaqueGo ((B_dData_dList.v_map (fun (_u : Core_dTerm.t_Term) -> false)) fieldTys)) ctor) nParams) methods) fieldTys) idx) nFields))

# 285 "Vuna/Compiler/Elab/Trait.vuna"
let v_declTopName = (fun (mc0 : Frontend_dAst.t_Decl) -> (match mc0 with
  | Frontend_dAst.C_Decl_DTrait (dtb__59, dtb__60, dtb__61, dtb__62, dtb__63) -> (B_dData_dMaybe.C_Maybe_Just (dtb__59))
  | Frontend_dAst.C_Decl_DRecord (dtb__64, dtb__65, dtb__66, dtb__67, dtb__68, dtb__69, dtb__70, dtb__71) -> (B_dData_dMaybe.C_Maybe_Just (dtb__64))
  | Frontend_dAst.C_Decl_DData (dtb__72, dtb__73, dtb__74, dtb__75, dtb__76, dtb__77, dtb__78, dtb__79, dtb__80) -> (B_dData_dMaybe.C_Maybe_Just (dtb__72))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
))

# 291 "Vuna/Compiler/Elab/Trait.vuna"
let rec v_declNamedInFile = (fun (mc0 : (Frontend_dAst.t_Decl, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc1 : string) (mc2 : string) -> (match mc0 with
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

# 298 "Vuna/Compiler/Elab/Trait.vuna"
let rec v_headTypeNameOf = (fun (mc0 : Frontend_dAst.t_Expr) -> (match mc0 with
  | Frontend_dAst.C_Expr_EApp (dtb__86, dtb__87, dtb__88) -> (v_headTypeNameOf dtb__86)
  | Frontend_dAst.C_Expr_EVar (dtb__89, dtb__90) -> (B_dData_dMaybe.C_Maybe_Just (dtb__89))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
))

# 303 "Vuna/Compiler/Elab/Trait.vuna"
let[@tail_mod_cons] rec v_headTypeNamesOf = (fun (mc0 : Frontend_dAst.t_Expr B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__91, dtb__92) -> (match (v_headTypeNameOf dtb__91) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__93) -> (B_dData_dList.C_List__x58__x58_ (dtb__93, (v_headTypeNamesOf dtb__92)))
  | B_dData_dMaybe.C_Maybe_Nothing -> (v_headTypeNamesOf dtb__92)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 312 "Vuna/Compiler/Elab/Trait.vuna"
let v_isGlobalHeadType = (fun (n : string) -> (if (if (if (n = "Int") then true else (n = "String")) then true else (n = "Float")) then true else (n = "Array")))

# 321 "Vuna/Compiler/Elab/Trait.vuna"
let rec v_anyDeclInFile = (fun (mc0 : (Frontend_dAst.t_Decl, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc1 : string B_dData_dList.t_List) (mc2 : string) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__94, dtb__95) -> (if (((v_declNamedInFile mc0) dtb__94) mc2) then true else (((v_anyDeclInFile mc0) dtb__95) mc2))
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 326 "Vuna/Compiler/Elab/Trait.vuna"
let rec v_anyGlobalHead = (fun (mc0 : string B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__96, dtb__97) -> (if (v_isGlobalHeadType dtb__96) then true else (v_anyGlobalHead dtb__97))
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 426 "Vuna/Compiler/Elab/Trait.vuna"
let v_instanceHeadParts = (fun (mc0 : Frontend_dAst.t_Expr) -> (match mc0 with
  | Frontend_dAst.C_Expr_EApp (dtb__98, dtb__99, dtb__100) -> (match dtb__98 with
  | Frontend_dAst.C_Expr_EVar (dtb__101, dtb__102) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = dtb__101; B_dData_dPair.f_Pair_second = dtb__99 }))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | Frontend_dAst.C_Expr_EVar (dtb__103, dtb__104) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = dtb__103; B_dData_dPair.f_Pair_second = B_dData_dList.C_List_Nil }))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
))

# 315 "Vuna/Compiler/Elab/Trait.vuna"
let v_instanceHeadTypeNames = (fun (headExpr : Frontend_dAst.t_Expr) -> (let nd_uscrut1 = (v_instanceHeadParts headExpr) in (match nd_uscrut1 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__105) -> (match dtb__105 with
  | { B_dData_dPair.f_Pair_first = dtb__106; B_dData_dPair.f_Pair_second = dtb__107 } -> (v_headTypeNamesOf dtb__107)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
)))

# 330 "Vuna/Compiler/Elab/Trait.vuna"
let v_instanceLandingOk = (fun (allDecls : (Frontend_dAst.t_Decl, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List) (sp : Base_dSource.t_Span) (cls : Elab_dTypes.t_DtClass) (headExpr : Frontend_dAst.t_Expr) -> (let file = (sp).Base_dSource.f_Span_spanFile in (let headNames = (v_instanceHeadTypeNames headExpr) in (if (if (((v_declNamedInFile allDecls) (Elab_dTypes.v_dtClassName cls)) file) then true else (((v_anyDeclInFile allDecls) headNames) file)) then true else (v_anyGlobalHead headNames)))))

# 442 "Vuna/Compiler/Elab/Trait.vuna"
let v_instanceConstraintParts = (fun (mc0 : Frontend_dAst.t_Expr) -> (match mc0 with
  | Frontend_dAst.C_Expr_EVar (dtb__108, dtb__109) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = dtb__108; B_dData_dPair.f_Pair_second = B_dData_dList.C_List_Nil }))
  | Frontend_dAst.C_Expr_EApp (dtb__110, dtb__111, dtb__112) -> (match dtb__110 with
  | Frontend_dAst.C_Expr_EVar (dtb__113, dtb__114) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = dtb__113; B_dData_dPair.f_Pair_second = dtb__111 }))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
))

# 434 "Vuna/Compiler/Elab/Trait.vuna"
let rec v_constraintPartsOf = (fun (mc0 : Base_dSource.t_Span) (mc1 : Frontend_dAst.t_Expr B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__115, dtb__116) -> (match (v_instanceConstraintParts dtb__115) with
  | B_dData_dMaybe.C_Maybe_Nothing -> ((Base_dDiagnostics_dTc.v_tcErr0 mc0) Base_dDiagnostics_dTc.C_TcErr_ConstraintNotDict)
  | B_dData_dMaybe.C_Maybe_Just (dtb__117) -> ((Base_dCommon.v_bind ((v_constraintPartsOf mc0) dtb__116)) (fun (ps : (string, Frontend_dAst.t_Expr B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((B_dData_dList.C_List__x58__x58_ (dtb__117, ps))))))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (B_dData_dList.C_List_Nil))
  | _ -> failwith "DT: impossible branch"
))

# 529 "Vuna/Compiler/Elab/Trait.vuna"
let rec v_checkArgsAtKinds = (fun (mc0 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc1 : Elab_dTypes.t_Ctx) (mc2 : Elab_dTypes.t_Ec) (mc3 : Frontend_dAst.t_Expr B_dData_dList.t_List) (mc4 : Core_dTerm.t_Value B_dData_dList.t_List) (mc5 : Base_dSource.t_Span) -> (match mc3 with
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

# 557 "Vuna/Compiler/Elab/Trait.vuna"
let rec v_closedTypeTerm = (fun (mc0 : Frontend_dAst.t_Expr) -> (match mc0 with
  | Frontend_dAst.C_Expr_EApp (dtb__126, dtb__127, dtb__128) -> (match (v_closedTypeTerm dtb__126) with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb__129) -> (match (v_closedTypeArgs dtb__127) with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb__130) -> (B_dData_dMaybe.C_Maybe_Just (((Elab_dMeta.v_foldAppTerms dtb__129) dtb__130)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Frontend_dAst.C_Expr_EVar (dtb__131, dtb__132) -> (B_dData_dMaybe.C_Maybe_Just ((Core_dTerm.C_Term_TGlobal (dtb__131))))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
))
# 568 "Vuna/Compiler/Elab/Trait.vuna"
and v_closedTypeArgs = (fun (mc0 : Frontend_dAst.t_Expr B_dData_dList.t_List) -> (match mc0 with
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

# 547 "Vuna/Compiler/Elab/Trait.vuna"
let rec v_closedTypeTerms = (fun (mc0 : Frontend_dAst.t_Expr B_dData_dList.t_List) -> (match mc0 with
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

# 585 "Vuna/Compiler/Elab/Trait.vuna"
let v_isLowerStart = (fun (n : string) -> (match (B_dData_dList.dtp_unpack n) with
  | B_dData_dList.C_List_Nil -> false
  | B_dData_dList.C_List__x58__x58_ (dtb__141, dtb__142) -> (if (dtb__141 >= 97) then (dtb__141 <= 122) else false)
  | _ -> failwith "DT: impossible branch"
))

# 615 "Vuna/Compiler/Elab/Trait.vuna"
let rec v_seedKindOf = (fun (mc0 : string) (mc1 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__143, dtb__144) -> (match dtb__143 with
  | { B_dData_dPair.f_Pair_first = dtb__145; B_dData_dPair.f_Pair_second = dtb__146 } -> (if (dtb__145 = mc0) then (B_dData_dMaybe.C_Maybe_Just (dtb__146)) else ((v_seedKindOf mc0) dtb__144))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 597 "Vuna/Compiler/Elab/Trait.vuna"
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

# 621 "Vuna/Compiler/Elab/Trait.vuna"
let[@tail_mod_cons] rec v_bareTeleSeeds = (fun (mc0 : Frontend_dAst.t_Expr B_dData_dList.t_List) (mc1 : Core_dTerm.t_Value B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__159, dtb__160) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__161, dtb__162) -> (match dtb__159 with
  | Frontend_dAst.C_Expr_EVar (dtb__163, dtb__164) -> (if (v_isLowerStart dtb__163) then (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__163; B_dData_dPair.f_Pair_second = ((Core_dEval.v_quote 0) dtb__161) }, ((v_bareTeleSeeds dtb__160) dtb__162))) else ((v_bareTeleSeeds dtb__160) dtb__162))
  | _ -> ((v_bareTeleSeeds dtb__160) dtb__162)
)
  | _ -> B_dData_dList.C_List_Nil
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 633 "Vuna/Compiler/Elab/Trait.vuna"
let rec v_ctxBareTeleSeeds = (fun (mc0 : Elab_dTypes.t_DtClass B_dData_dList.t_List) (mc1 : Elab_dTypes.t_Ec) (mc2 : (string, Frontend_dAst.t_Expr B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc2 with
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

# 661 "Vuna/Compiler/Elab/Trait.vuna"
let v_fallbackTeleKind = (fun (scanExprs : Frontend_dAst.t_Expr B_dData_dList.t_List) (v : string) -> ((Elab_dSig.v_arityFun ((Elab_dSig.v_exprMaxAppArityIn v) scanExprs)) (Core_dTerm.C_Term_TType (Core_dTerm.v_levelZero))))

# 649 "Vuna/Compiler/Elab/Trait.vuna"
let v_resolveTeleKind = (fun (mc0 : Frontend_dAst.t_Expr B_dData_dList.t_List) (mc1 : string) (mc2 : Core_dTerm.t_Term) (mc3 : Elab_dTypes.t_Ec) -> (match mc2 with
  | Core_dTerm.C_Term_TMeta (dtb__171) -> (match ((Core_dTerm.v_solsLookup dtb__171) (Elab_dTypes.v_ecSolsP mc3)) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__172) -> (let q = ((Core_dEval.v_quote 0) dtb__172) in (if ((Core_dTerm.v_hasFreeTermVar 0) q) then ((v_fallbackTeleKind mc0) mc1) else q))
  | B_dData_dMaybe.C_Maybe_Nothing -> ((v_fallbackTeleKind mc0) mc1)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> mc2
))

# 644 "Vuna/Compiler/Elab/Trait.vuna"
let[@tail_mod_cons] rec v_resolveTeleKinds = (fun (mc0 : Frontend_dAst.t_Expr B_dData_dList.t_List) (mc1 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc2 : Elab_dTypes.t_Ec) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__173, dtb__174) -> (match dtb__173 with
  | { B_dData_dPair.f_Pair_first = dtb__175; B_dData_dPair.f_Pair_second = dtb__176 } -> (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__175; B_dData_dPair.f_Pair_second = ((((v_resolveTeleKind mc0) dtb__175) dtb__176) mc2) }, (((v_resolveTeleKinds mc0) dtb__174) mc2)))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 664 "Vuna/Compiler/Elab/Trait.vuna"
let rec v_exprFreeLower = (fun (mc0 : Frontend_dAst.t_Expr) -> (match mc0 with
  | Frontend_dAst.C_Expr_EPi (dtb__177, dtb__178, dtb__179, dtb__180, dtb__181, dtb__182) -> ((B_dData_dList.v_append (v_exprFreeLower dtb__180)) (v_exprFreeLower dtb__181))
  | Frontend_dAst.C_Expr_EApp (dtb__183, dtb__184, dtb__185) -> ((B_dData_dList.v_append (v_exprFreeLower dtb__183)) ((B_dData_dList.v_concatMap v_exprFreeLower) dtb__184))
  | Frontend_dAst.C_Expr_EVar (dtb__186, dtb__187) -> (if (v_isLowerStart dtb__186) then (B_dData_dList.C_List__x58__x58_ (dtb__186, B_dData_dList.C_List_Nil)) else B_dData_dList.C_List_Nil)
  | _ -> B_dData_dList.C_List_Nil
))

# 579 "Vuna/Compiler/Elab/Trait.vuna"
let v_instanceMono = (fun (e : Frontend_dAst.t_Expr) -> (match (v_exprFreeLower e) with
  | B_dData_dList.C_List_Nil -> true
  | _ -> false
))

# 670 "Vuna/Compiler/Elab/Trait.vuna"
let[@tail_mod_cons] rec v_keepOutBanned = (fun (mc0 : (string, bool) B_dContainer_dHashMap.t_HashMap) (mc1 : string B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__188, dtb__189) -> (if ((((B_dContainer_dHashMap.v_member B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) dtb__188) mc0) then ((v_keepOutBanned mc0) dtb__189) else (B_dData_dList.C_List__x58__x58_ (dtb__188, ((v_keepOutBanned mc0) dtb__189))))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 593 "Vuna/Compiler/Elab/Trait.vuna"
let v_instanceTeleMetas = (fun (banned : (string, bool) B_dContainer_dHashMap.t_HashMap) (exprs : Frontend_dAst.t_Expr B_dData_dList.t_List) (seeds : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ec : Elab_dTypes.t_Ec) -> (((v_teleMetasInit (B_dData_dList.v_nubNames ((v_keepOutBanned banned) ((B_dData_dList.v_concatMap v_exprFreeLower) exprs)))) seeds) ec))

# 679 "Vuna/Compiler/Elab/Trait.vuna"
let rec v_instanceTeleCtxGo = (fun (mc0 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc1 : Elab_dTypes.t_Ctx) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__190, dtb__191) -> (match dtb__190 with
  | { B_dData_dPair.f_Pair_first = dtb__192; B_dData_dPair.f_Pair_second = dtb__193 } -> ((v_instanceTeleCtxGo dtb__191) (((Elab_dTypes.v_ctxBindValue dtb__192) ((Core_dEval.v_eval B_dData_dList.C_List_Nil) dtb__193)) mc1))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> mc1
  | _ -> failwith "DT: impossible branch"
))

# 676 "Vuna/Compiler/Elab/Trait.vuna"
let v_instanceTeleCtx = (fun (tele : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) -> ((v_instanceTeleCtxGo tele) Elab_dTypes.v_emptyCtx))

# 722 "Vuna/Compiler/Elab/Trait.vuna"
let v_ctxDictName = (fun (k : int) -> ("_ctx" ^ (string_of_int k)))

# 717 "Vuna/Compiler/Elab/Trait.vuna"
let rec v_instBodyCtxGo = (fun (mc0 : Elab_dTypes.t_Ctx) (mc1 : Core_dTerm.t_Term B_dData_dList.t_List) (mc2 : int) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__194, dtb__195) -> (((v_instBodyCtxGo (((Elab_dTypes.v_ctxBindValue (v_ctxDictName mc2)) ((Core_dEval.v_eval (Elab_dTypes.v_ctxEnv mc0)) (((Core_dTerm.v_shift 0) mc2) dtb__194))) mc0)) dtb__195) (mc2 + 1))
  | B_dData_dList.C_List_Nil -> mc0
  | _ -> failwith "DT: impossible branch"
))

# 732 "Vuna/Compiler/Elab/Trait.vuna"
let[@tail_mod_cons] rec v_instTeleLam = (fun (mc0 : Core_dTerm.t_Term) (mc1 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__196, dtb__197) -> (match dtb__196 with
  | { B_dData_dPair.f_Pair_first = dtb__198; B_dData_dPair.f_Pair_second = dtb__199 } -> (Core_dTerm.C_Term_TLam (dtb__198, Core_dTerm.C_Rig_Rig0, B_dData_dMaybe.C_Maybe_Nothing, Base_dSource.v_spanEmpty, ((v_instTeleLam mc0) dtb__197)))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> mc0
  | _ -> failwith "DT: impossible branch"
))

# 739 "Vuna/Compiler/Elab/Trait.vuna"
let[@tail_mod_cons] rec v_instCtxLamGo = (fun (body : Core_dTerm.t_Term) (remaining : int) (k : int) -> (if (remaining <= 0) then body else (Core_dTerm.C_Term_TLam ((v_ctxDictName k), Core_dTerm.C_Rig_RigOmega, B_dData_dMaybe.C_Maybe_Nothing, Base_dSource.v_spanEmpty, (((v_instCtxLamGo body) (remaining - 1)) (k + 1))))))

# 736 "Vuna/Compiler/Elab/Trait.vuna"
let v_instCtxLam = (fun (body : Core_dTerm.t_Term) (nCtx : int) (k : int) -> (((v_instCtxLamGo body) (nCtx - k)) k))

# 755 "Vuna/Compiler/Elab/Trait.vuna"
let rec v_instTypeCtx = (fun (mc0 : Core_dTerm.t_Term) (mc1 : Core_dTerm.t_Term B_dData_dList.t_List) (mc2 : int) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__200, dtb__201) -> (((v_instTypeCtx (Core_dTerm.C_Term_TPi ((v_ctxDictName mc2), true, Core_dTerm.C_Rig_RigOmega, (((Core_dTerm.v_shift 0) mc2) dtb__200), mc0))) dtb__201) (mc2 - 1))
  | B_dData_dList.C_List_Nil -> mc0
  | _ -> failwith "DT: impossible branch"
))

# 760 "Vuna/Compiler/Elab/Trait.vuna"
let[@tail_mod_cons] rec v_instTypeTele = (fun (mc0 : Core_dTerm.t_Term) (mc1 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__202, dtb__203) -> (match dtb__202 with
  | { B_dData_dPair.f_Pair_first = dtb__204; B_dData_dPair.f_Pair_second = dtb__205 } -> (Core_dTerm.C_Term_TPi (dtb__204, true, Core_dTerm.C_Rig_Rig0, dtb__205, ((v_instTypeTele mc0) dtb__203)))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> mc0
  | _ -> failwith "DT: impossible branch"
))

# 767 "Vuna/Compiler/Elab/Trait.vuna"
let v_canonicalMethodShort = (fun (name : string) -> (if ((Elab_dMeta.v_baseNameOf name) = "eq") then "==" else (if ((Elab_dMeta.v_baseNameOf name) = "neq") then "/=" else (if ((Elab_dMeta.v_baseNameOf name) = "lt") then "<" else (if ((Elab_dMeta.v_baseNameOf name) = "le") then "<=" else (if ((Elab_dMeta.v_baseNameOf name) = "gt") then ">" else (if ((Elab_dMeta.v_baseNameOf name) = "ge") then ">=" else (if ((Elab_dMeta.v_baseNameOf name) = "add") then "+" else (if ((Elab_dMeta.v_baseNameOf name) = "sub") then "-" else (if ((Elab_dMeta.v_baseNameOf name) = "mul") then "*" else (if ((Elab_dMeta.v_baseNameOf name) = "div") then "/" else (if ((Elab_dMeta.v_baseNameOf name) = "bind") then ">>=" else (let other = (Elab_dMeta.v_baseNameOf name) in other)))))))))))))

# 783 "Vuna/Compiler/Elab/Trait.vuna"
let v_sameMethodShort = (fun (a : string) (b : string) -> ((v_canonicalMethodShort a) = (v_canonicalMethodShort b)))

# 786 "Vuna/Compiler/Elab/Trait.vuna"
let rec v_anySameMethod = (fun (mc0 : string) (mc1 : string B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__206, dtb__207) -> (if ((v_sameMethodShort mc0) dtb__206) then true else ((v_anySameMethod mc0) dtb__207))
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 794 "Vuna/Compiler/Elab/Trait.vuna"
let rec v_firstUnknownInstanceMethodGo = (fun (mc0 : string B_dData_dList.t_List) (mc1 : Frontend_dAst.t_Decl B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__208, dtb__209) -> (match dtb__208 with
  | Frontend_dAst.C_Decl_DFun (dtb__210, dtb__211, dtb__212, dtb__213) -> (if ((v_anySameMethod (Elab_dMeta.v_baseNameOf dtb__210)) mc0) then ((v_firstUnknownInstanceMethodGo mc0) dtb__209) else (B_dData_dMaybe.C_Maybe_Just (dtb__210)))
  | _ -> ((v_firstUnknownInstanceMethodGo mc0) dtb__209)
)
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 790 "Vuna/Compiler/Elab/Trait.vuna"
let v_firstUnknownInstanceMethod = (fun (cls : Elab_dTypes.t_DtClass) (methods : Frontend_dAst.t_Decl B_dData_dList.t_List) -> ((v_firstUnknownInstanceMethodGo ((B_dData_dList.v_map (fun (m : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair) -> (Elab_dMeta.v_baseNameOf (B_dData_dPair.v_firstOf (Obj.magic m))))) (cls).Elab_dTypes.f_DtClass_dtClassMethods)) methods))

# 809 "Vuna/Compiler/Elab/Trait.vuna"
let rec v_firstDuplicateInstanceMethodGo = (fun (mc0 : string B_dData_dList.t_List) (mc1 : Frontend_dAst.t_Decl B_dData_dList.t_List) (mc2 : (string, string) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__214, dtb__215) -> (match dtb__214 with
  | Frontend_dAst.C_Decl_DFun (dtb__216, dtb__217, dtb__218, dtb__219) -> (let short = (Elab_dMeta.v_baseNameOf dtb__216) in (if ((v_anySameMethod short) mc0) then (let canon = (v_canonicalMethodShort short) in (match ((B_dData_dList.v_lookupPair canon) mc2) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__220) -> (if (dtb__220 = short) then (((v_firstDuplicateInstanceMethodGo mc0) dtb__215) mc2) else (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = canon; B_dData_dPair.f_Pair_second = (Frontend_dAst.v_nodeRefSpan dtb__219) })))
  | B_dData_dMaybe.C_Maybe_Nothing -> (((v_firstDuplicateInstanceMethodGo mc0) dtb__215) (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = canon; B_dData_dPair.f_Pair_second = short }, mc2)))
  | _ -> failwith "DT: impossible branch"
)) else (((v_firstDuplicateInstanceMethodGo mc0) dtb__215) mc2)))
  | _ -> (((v_firstDuplicateInstanceMethodGo mc0) dtb__215) mc2)
)
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 805 "Vuna/Compiler/Elab/Trait.vuna"
let v_firstDuplicateInstanceMethod = (fun (cls : Elab_dTypes.t_DtClass) (methods : Frontend_dAst.t_Decl B_dData_dList.t_List) -> (((v_firstDuplicateInstanceMethodGo ((B_dData_dList.v_map (fun (m : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair) -> (Elab_dMeta.v_baseNameOf (B_dData_dPair.v_firstOf (Obj.magic m))))) (cls).Elab_dTypes.f_DtClass_dtClassMethods)) methods) B_dData_dList.C_List_Nil))

# 839 "Vuna/Compiler/Elab/Trait.vuna"
let rec v_hasMethodClauses = (fun (mc0 : string) (mc1 : Frontend_dAst.t_Decl B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__221, dtb__222) -> (match dtb__221 with
  | Frontend_dAst.C_Decl_DFun (dtb__223, dtb__224, dtb__225, dtb__226) -> (if ((v_sameMethodShort dtb__223) mc0) then true else ((v_hasMethodClauses mc0) dtb__222))
  | _ -> ((v_hasMethodClauses mc0) dtb__222)
)
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 831 "Vuna/Compiler/Elab/Trait.vuna"
let rec v_firstMissingInstanceMethodGo = (fun (mc0 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc1 : Frontend_dAst.t_Decl B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__227, dtb__228) -> (if ((v_hasMethodClauses (Elab_dMeta.v_baseNameOf (B_dData_dPair.v_firstOf dtb__227))) mc1) then ((v_firstMissingInstanceMethodGo dtb__228) mc1) else (B_dData_dMaybe.C_Maybe_Just ((B_dData_dPair.v_firstOf dtb__227))))
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 828 "Vuna/Compiler/Elab/Trait.vuna"
let v_firstMissingInstanceMethod = (fun (cls : Elab_dTypes.t_DtClass) (methods : Frontend_dAst.t_Decl B_dData_dList.t_List) -> ((v_firstMissingInstanceMethodGo (cls).Elab_dTypes.f_DtClass_dtClassMethods) methods))

# 850 "Vuna/Compiler/Elab/Trait.vuna"
let rec v_findTraitDecl = (fun (mc0 : string) (mc1 : (Frontend_dAst.t_Decl, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__229, dtb__230) -> (match dtb__229 with
  | { B_dData_dPair.f_Pair_first = dtb__231; B_dData_dPair.f_Pair_second = dtb__232 } -> (match dtb__231 with
  | Frontend_dAst.C_Decl_DTrait (dtb__233, dtb__234, dtb__235, dtb__236, dtb__237) -> (if (dtb__233 = mc0) then (B_dData_dMaybe.C_Maybe_Just (dtb__231)) else ((v_findTraitDecl mc0) dtb__230))
  | _ -> ((v_findTraitDecl mc0) dtb__230)
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 858 "Vuna/Compiler/Elab/Trait.vuna"
let rec v_findTraitMethodSpan = (fun (mc0 : string) (mc1 : Frontend_dAst.t_TraitMethod B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__238, dtb__239) -> (if ((Frontend_dAst.v_traitMethodName dtb__238) = mc0) then (B_dData_dMaybe.C_Maybe_Just ((Frontend_dAst.v_traitMethodSpan dtb__238))) else ((v_findTraitMethodSpan mc0) dtb__239))
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 863 "Vuna/Compiler/Elab/Trait.vuna"
let v_traitMethodSpanOf = (fun (cls : Elab_dTypes.t_DtClass) (mname : string) (decls : (Frontend_dAst.t_Decl, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (let nd_uscrut3 = ((v_findTraitDecl (Elab_dTypes.v_dtClassName cls)) decls) in (match nd_uscrut3 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__240) -> (match dtb__240 with
  | Frontend_dAst.C_Decl_DTrait (dtb__241, dtb__242, dtb__243, dtb__244, dtb__245) -> ((v_findTraitMethodSpan mname) dtb__244)
  | _ -> ((B_dData_dList.v_lookupPair mname) (cls).Elab_dTypes.f_DtClass_dtClassMethodSpans)
)
  | _ -> ((B_dData_dList.v_lookupPair mname) (cls).Elab_dTypes.f_DtClass_dtClassMethodSpans)
)))

# 870 "Vuna/Compiler/Elab/Trait.vuna"
let v_ctorResultType = (fun (cls : Elab_dTypes.t_DtClass) (args : Core_dTerm.t_Term B_dData_dList.t_List) -> ((Elab_dMeta.v_foldAppTerms (Core_dTerm.C_Term_TGlobal ((Elab_dMeta.v_dictTypeName (Elab_dTypes.v_dtClassName cls))))) ((B_dData_dList.v_map (fun (a : Core_dTerm.t_Term) -> { B_dData_dPair.f_Pair_first = (Obj.magic a); B_dData_dPair.f_Pair_second = Core_dTerm.C_Rig_Rig0 })) args)))

# 685 "Vuna/Compiler/Elab/Trait.vuna"
let rec v_elabConstraintDomains = (fun (mc0 : Elab_dTypes.t_DtClass B_dData_dList.t_List) (mc1 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc2 : Elab_dTypes.t_Ctx) (mc3 : (string, Frontend_dAst.t_Expr B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc4 : Base_dSource.t_Span) (mc5 : Elab_dTypes.t_Ec) -> (match mc3 with
  | B_dData_dList.C_List__x58__x58_ (dtb__246, dtb__247) -> (match dtb__246 with
  | { B_dData_dPair.f_Pair_first = dtb__248; B_dData_dPair.f_Pair_second = dtb__249 } -> (match ((Elab_dDict.v_findClass dtb__248) mc0) with
  | B_dData_dMaybe.C_Maybe_Nothing -> (((Base_dDiagnostics_dTc.v_tcErr1 mc4) (Base_dDiagnostics_dTc.C_TcErr_UnknownInterface (dtb__248))) dtb__248)
  | B_dData_dMaybe.C_Maybe_Just (dtb__250) -> (match ((Elab_dDict.v_dictArgKinds mc5) (Core_dTerm.C_Value_VNeutral ((Core_dTerm.C_Neutral_NGlobal ((Elab_dMeta.v_dictTypeName (Elab_dTypes.v_dtClassName dtb__250)), B_dData_dList.C_List_Nil))))) with
  | B_dData_dMaybe.C_Maybe_Nothing -> ((Base_dDiagnostics_dTc.v_tcErr0 mc4) Base_dDiagnostics_dTc.C_TcErr_ConstraintNotDict)
  | B_dData_dMaybe.C_Maybe_Just (dtb__251) -> (let _u = (if ((dtp_log_on 3) "Vuna.Compiler.Elab.Trait") then (((dtp_log_emit 3) "Vuna.Compiler.Elab.Trait") (String.concat "" ["constraint-dom: "; dtb__248; " args="; (string_of_int (B_dData_dList.v_length dtb__249)); " kinds="; (string_of_int (B_dData_dList.v_length dtb__251))])) else 0) in (if ((B_dData_dList.v_length dtb__251) <> (B_dData_dList.v_length dtb__249)) then ((Base_dDiagnostics_dTc.v_tcErr0 mc4) Base_dDiagnostics_dTc.C_TcErr_ConstraintNotDict) else ((Base_dCommon.v_bind ((((((v_checkArgsAtKinds mc1) mc2) mc5) dtb__249) dtb__251) mc4)) (fun (q : (Core_dTerm.t_Term B_dData_dList.t_List, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match q with
  | { B_dData_dPair.f_Pair_first = dtb__252; B_dData_dPair.f_Pair_second = dtb__253 } -> ((Base_dCommon.v_bind ((((((v_elabConstraintDomains mc0) mc1) mc2) dtb__247) mc4) dtb__253)) (fun (r : (Core_dTerm.t_Term B_dData_dList.t_List, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match r with
  | { B_dData_dPair.f_Pair_first = dtb__254; B_dData_dPair.f_Pair_second = dtb__255 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ (((v_ctorResultType dtb__250) dtb__252), dtb__254)); B_dData_dPair.f_Pair_second = dtb__255 }))
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

# 97 "Vuna/Compiler/Elab/Trait.vuna"
let v_elabTraitFinal = (fun (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ec : Elab_dTypes.t_Ec) (tname : string) (paramNames : string B_dData_dList.t_List) (superParts : (string, Frontend_dAst.t_Expr B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (methods : Frontend_dAst.t_TraitMethod B_dData_dList.t_List) (methodsP : (string, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (pKinds : Core_dTerm.t_Term B_dData_dList.t_List) (fieldTys : Core_dTerm.t_Term B_dData_dList.t_List) (sp : Base_dSource.t_Span) -> (let paramsKinds = ((B_dData_dList.v_zip paramNames) pKinds) in (let classCtx = ((v_bindClassParams paramsKinds) Elab_dTypes.v_emptyCtx) in ((Base_dCommon.v_bind ((((((v_elabConstraintDomains (Elab_dTypes.v_ecClasses ec)) globals) classCtx) superParts) sp) ec)) (fun (pq : (Core_dTerm.t_Term B_dData_dList.t_List, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match pq with
  | { B_dData_dPair.f_Pair_first = dtb__256; B_dData_dPair.f_Pair_second = dtb__257 } -> (let nFields = (B_dData_dList.v_length fieldTys) in (let dname = (Elab_dMeta.v_dictTypeName tname) in (let cname = (Elab_dMeta.v_dictCtorName tname) in (let dapp = ((v_dictAppTermOf dname) paramNames) in (let ctorTy = ((v_foldParamPis paramsKinds) ((v_foldPiFieldTys fieldTys) dapp)) in (let tele = (Elab_dMeta.v_teleOfType ctorTy) in (let dd = { Elab_dTypes.f_DtData_dtDataName = dname; Elab_dTypes.f_DtData_dtDataParams = tele; Elab_dTypes.f_DtData_dtDataCtors = (B_dData_dList.C_List__x58__x58_ ({ Elab_dTypes.f_DtCtor_dtCtorName = cname; Elab_dTypes.f_DtCtor_dtCtorFamily = dname; Elab_dTypes.f_DtCtor_dtCtorTelescope = tele; Elab_dTypes.f_DtCtor_dtCtorType = ctorTy; Elab_dTypes.f_DtCtor_dtCtorSpan = B_dData_dMaybe.C_Maybe_Nothing }, B_dData_dList.C_List_Nil)); Elab_dTypes.f_DtData_dtDataKind = ((v_foldParamPis paramsKinds) (Core_dTerm.C_Term_TType (Core_dTerm.v_levelZero))); Elab_dTypes.f_DtData_dtDataViaClasses = B_dData_dList.C_List_Nil; Elab_dTypes.f_DtData_dtDataLinear = false; Elab_dTypes.f_DtData_dtDataRepr = Frontend_dAst.C_ReprTier_ReprAuto; Elab_dTypes.f_DtData_dtDataFields = B_dData_dList.C_List_Nil; Elab_dTypes.f_DtData_dtDataIsRecord = false } in (let projs = (((((v_methodProjections tname) paramNames) pKinds) methodsP) fieldTys) in (let projSpans = ((B_dData_dList.v_map (fun (m : Frontend_dAst.t_TraitMethod) -> { B_dData_dPair.f_Pair_first = (Frontend_dAst.v_traitMethodName m); B_dData_dPair.f_Pair_second = (Frontend_dAst.v_traitMethodSpan m) })) methods) in (let fieldCtx = ((v_bindClassParams paramsKinds) Elab_dTypes.v_emptyCtx) in (let opaqueFields = ((B_dData_dList.v_map (fun (t : Core_dTerm.t_Term) -> (if (((Elab_dMeta.v_isOpaqueRuntimeTyDecl dtb__257) fieldCtx) ((Core_dEval.v_eval (Elab_dTypes.v_ctxEnv fieldCtx)) t)) then true else (Elab_dMeta.v_valueHasImplicitPi ((Core_dEval.v_eval (Elab_dTypes.v_ctxEnv fieldCtx)) t))))) fieldTys) in (let projBodies = ((((((v_projectionDefsOpaque opaqueFields) tname) (B_dData_dList.v_length paramNames)) methodsP) fieldTys) nFields) in (let cls = { Elab_dTypes.f_DtClass_dtClassName = tname; Elab_dTypes.f_DtClass_dtClassParams = paramNames; Elab_dTypes.f_DtClass_dtClassSupers = dtb__256; Elab_dTypes.f_DtClass_dtClassMethods = projs; Elab_dTypes.f_DtClass_dtClassFieldTys = fieldTys; Elab_dTypes.f_DtClass_dtClassMethodSpans = projSpans } in (let ec2 = ((Elab_dTypes.v_ecAddClass ((Elab_dTypes.v_ecAddData dtb__257) dd)) cls) in (let ec3 = ((v_foldlAddDef ec2) projBodies) in (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dd; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = projs; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = cls; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = projSpans; B_dData_dPair.f_Pair_second = ec3 } } } })))))))))))))))))
  | _ -> failwith "DT: impossible branch"
))))))

# 88 "Vuna/Compiler/Elab/Trait.vuna"
let v_elabTraitKinds = (fun (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ec : Elab_dTypes.t_Ec) (tname : string) (params : Frontend_dAst.t_TraitParam B_dData_dList.t_List) (supers : Frontend_dAst.t_Expr B_dData_dList.t_List) (methods : Frontend_dAst.t_TraitMethod B_dData_dList.t_List) (methodsP : (string, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (pKinds : Core_dTerm.t_Term B_dData_dList.t_List) (sp : Base_dSource.t_Span) -> (let paramNames = (v_traitParamNames params) in (let paramsKinds = ((B_dData_dList.v_zip paramNames) pKinds) in ((Base_dCommon.v_bind ((v_constraintPartsOf sp) supers)) (fun (superParts : (string, Frontend_dAst.t_Expr B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) -> ((Base_dCommon.v_bind ((((v_classFieldTys globals) ec) paramsKinds) methodsP)) (fun (p : (Core_dTerm.t_Term B_dData_dList.t_List, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> ((((((((((v_elabTraitFinal globals) (B_dData_dPair.v_secondOf p)) tname) paramNames) superParts) methods) methodsP) pKinds) (B_dData_dPair.v_firstOf p)) sp))))))))

# 74 "Vuna/Compiler/Elab/Trait.vuna"
let v_elabTrait = (fun (mc0 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc1 : Elab_dTypes.t_Ec) (mc2 : (Frontend_dAst.t_Decl, Base_dSource.t_Span) B_dData_dPair.t_Pair) -> (match mc2 with
  | { B_dData_dPair.f_Pair_first = dtb__258; B_dData_dPair.f_Pair_second = dtb__259 } -> (match dtb__258 with
  | Frontend_dAst.C_Decl_DTrait (dtb__260, dtb__261, dtb__262, dtb__263, dtb__264) -> (if ((B_dData_dList.v_length dtb__261) = 0) then ((Base_dDiagnostics_dTc.v_tcErr0 (Frontend_dAst.v_nodeRefSpan dtb__264)) Base_dDiagnostics_dTc.C_TcErr_InterfaceNoParam) else (let methodsP = (v_traitMethodPairs dtb__263) in ((Base_dCommon.v_bind ((((v_traitParamKinds mc0) mc1) dtb__261) methodsP)) (fun (pk : (Core_dTerm.t_Term B_dData_dList.t_List, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (((((((((v_elabTraitKinds mc0) (B_dData_dPair.v_secondOf pk)) dtb__260) dtb__261) dtb__262) dtb__263) methodsP) (B_dData_dPair.v_firstOf pk)) (Frontend_dAst.v_nodeRefSpan dtb__264))))))
  | _ -> ((Elab_dTypes.v_errAt dtb__259) "DT: internal: expected a trait declaration")
)
  | _ -> failwith "DT: impossible branch"
))

# 494 "Vuna/Compiler/Elab/Trait.vuna"
let v_elabInstanceConstrained = (fun (classes : Elab_dTypes.t_DtClass B_dData_dList.t_List) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (defined : string B_dData_dList.t_List) (ec0 : Elab_dTypes.t_Ec) (sp : Base_dSource.t_Span) (cls : Elab_dTypes.t_DtClass) (argExprs : Frontend_dAst.t_Expr B_dData_dList.t_List) (ctxParts : (string, Frontend_dAst.t_Expr B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (let ctxArgs = ((B_dData_dList.v_concatMap (fun (p : (string, Frontend_dAst.t_Expr B_dData_dList.t_List) B_dData_dPair.t_Pair) -> (B_dData_dPair.v_secondOf (Obj.magic p)))) ctxParts) in (let banned = (Elab_dSig.v_topQuantBanned defined) in (let scanExprs = ((B_dData_dList.v_append argExprs) ctxArgs) in (let kindMaybe = ((Elab_dDict.v_dictArgKinds ec0) (Core_dTerm.C_Value_VNeutral ((Core_dTerm.C_Neutral_NGlobal ((Elab_dMeta.v_dictTypeName (Elab_dTypes.v_dtClassName cls)), B_dData_dList.C_List_Nil))))) in (match kindMaybe with
  | B_dData_dMaybe.C_Maybe_Nothing -> ((Base_dDiagnostics_dTc.v_tcErr0 sp) Base_dDiagnostics_dTc.C_TcErr_InstanceHeadNotApp)
  | B_dData_dMaybe.C_Maybe_Just (dtb__265) -> (if ((B_dData_dList.v_length dtb__265) <> (B_dData_dList.v_length argExprs)) then ((Base_dDiagnostics_dTc.v_tcErr0 sp) Base_dDiagnostics_dTc.C_TcErr_InstanceHeadNotApp) else (let seeds = ((B_dData_dList.v_append ((v_bareTeleSeeds argExprs) dtb__265)) (((v_ctxBareTeleSeeds classes) ec0) ctxParts)) in (let init = ((((v_instanceTeleMetas banned) scanExprs) seeds) ec0) in (let tele0 = (B_dData_dPair.v_firstOf init) in (let ec1 = (B_dData_dPair.v_secondOf init) in (let teleCtx0 = (v_instanceTeleCtx tele0) in ((Base_dCommon.v_bind ((((((v_checkArgsAtKinds globals) teleCtx0) ec1) argExprs) dtb__265) sp)) (fun (q : (Core_dTerm.t_Term B_dData_dList.t_List, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match q with
  | { B_dData_dPair.f_Pair_first = dtb__266; B_dData_dPair.f_Pair_second = dtb__267 } -> ((Base_dCommon.v_bind ((((((v_elabConstraintDomains classes) globals) teleCtx0) ctxParts) sp) dtb__267)) (fun (r : (Core_dTerm.t_Term B_dData_dList.t_List, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match r with
  | { B_dData_dPair.f_Pair_first = dtb__268; B_dData_dPair.f_Pair_second = dtb__269 } -> (let tele = (((v_resolveTeleKinds scanExprs) tele0) dtb__269) in (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = { f_InstSigInfo_instSigClass = (Elab_dTypes.v_dtClassName cls); f_InstSigInfo_instSigTele = tele; f_InstSigInfo_instSigCtx = dtb__268; f_InstSigInfo_instSigArgs = dtb__266; f_InstSigInfo_instSigHead = ((v_ctorResultType cls) dtb__266) }; B_dData_dPair.f_Pair_second = dtb__269 })))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))))))))
  | _ -> failwith "DT: impossible branch"
))))))

# 463 "Vuna/Compiler/Elab/Trait.vuna"
let v_elabInstanceSig = (fun (classes : Elab_dTypes.t_DtClass B_dData_dList.t_List) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (defined : string B_dData_dList.t_List) (ec0 : Elab_dTypes.t_Ec) (sp : Base_dSource.t_Span) (headExpr : Frontend_dAst.t_Expr) (ctxE : Frontend_dAst.t_Expr B_dData_dList.t_List) -> (match (v_instanceHeadParts headExpr) with
  | B_dData_dMaybe.C_Maybe_Nothing -> ((Base_dDiagnostics_dTc.v_tcErr0 sp) Base_dDiagnostics_dTc.C_TcErr_InstanceHeadNotApp)
  | B_dData_dMaybe.C_Maybe_Just (dtb__270) -> (match ((Elab_dDict.v_findClass (B_dData_dPair.v_firstOf dtb__270)) classes) with
  | B_dData_dMaybe.C_Maybe_Nothing -> (((Base_dDiagnostics_dTc.v_tcErr1 sp) (Base_dDiagnostics_dTc.C_TcErr_UnknownInterface ((B_dData_dPair.v_firstOf dtb__270)))) (B_dData_dPair.v_firstOf dtb__270))
  | B_dData_dMaybe.C_Maybe_Just (dtb__271) -> (match (B_dData_dPair.v_secondOf dtb__270) with
  | dtb__272 -> (if ((B_dData_dList.v_length dtb__272) <> (B_dData_dList.v_length (dtb__271).Elab_dTypes.f_DtClass_dtClassParams)) then ((Base_dDiagnostics_dTc.v_tcErr0 sp) Base_dDiagnostics_dTc.C_TcErr_InstanceHeadNotApp) else ((Base_dCommon.v_bind ((v_constraintPartsOf sp) ctxE)) (fun (ctxParts : (string, Frontend_dAst.t_Expr B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) -> ((((((((v_elabInstanceConstrained classes) globals) defined) ec0) sp) dtb__271) dtb__272) ctxParts))))
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 886 "Vuna/Compiler/Elab/Trait.vuna"
let[@tail_mod_cons] rec v_zipMethodFields = (fun (mc0 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc1 : Core_dTerm.t_Term B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__273, dtb__274) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__275, dtb__276) -> (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = (B_dData_dPair.v_firstOf dtb__273); B_dData_dPair.f_Pair_second = dtb__275 }, ((v_zipMethodFields dtb__274) dtb__276)))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 883 "Vuna/Compiler/Elab/Trait.vuna"
let v_zipClassFields = (fun (cls : Elab_dTypes.t_DtClass) -> ((v_zipMethodFields (cls).Elab_dTypes.f_DtClass_dtClassMethods) (cls).Elab_dTypes.f_DtClass_dtClassFieldTys))

# 961 "Vuna/Compiler/Elab/Trait.vuna"
let rec v_instArgAt = (fun (mc0 : int) (mc1 : Core_dTerm.t_Term B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__277, dtb__278) -> (if (mc0 <= 0) then (B_dData_dMaybe.C_Maybe_Just (dtb__277)) else ((v_instArgAt (mc0 - 1)) dtb__278))
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 898 "Vuna/Compiler/Elab/Trait.vuna"
let rec v_substInstParamsGo = (fun (mc0 : int) (mc1 : Core_dTerm.t_Term B_dData_dList.t_List) (mc2 : int) (mc3 : Core_dTerm.t_Term) -> (match mc3 with
  | Core_dTerm.C_Term_TIf (dtb__279, dtb__280, dtb__281) -> ((Base_dCommon.v_bind ((((v_substInstParamsGo mc0) mc1) mc2) dtb__279)) (fun (c2 : Core_dTerm.t_Term) -> ((Base_dCommon.v_bind ((((v_substInstParamsGo mc0) mc1) mc2) dtb__280)) (fun (th2 : Core_dTerm.t_Term) -> ((Base_dCommon.v_bind ((((v_substInstParamsGo mc0) mc1) mc2) dtb__281)) (fun (el2 : Core_dTerm.t_Term) -> (Base_dDiag.C_Check_OkC ((Core_dTerm.C_Term_TIf (c2, th2, el2))))))))))
  | Core_dTerm.C_Term_TCase (dtb__282, dtb__283) -> ((Base_dCommon.v_bind ((((v_substInstParamsGo mc0) mc1) mc2) dtb__282)) (fun (scrut2 : Core_dTerm.t_Term) -> ((Base_dCommon.v_bind ((Base_dCommon.v_traverse (((v_substInstParamsAlt mc0) mc1) mc2)) dtb__283)) (fun (alts2 : Core_dTerm.t_CaseAlt B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((Core_dTerm.C_Term_TCase (scrut2, alts2))))))))
  | Core_dTerm.C_Term_TMk (dtb__284, dtb__285) -> ((Base_dCommon.v_bind ((Base_dCommon.v_traverse (((v_substInstParamsPair mc0) mc1) mc2)) dtb__285)) (fun (cs2 : (Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((Core_dTerm.C_Term_TMk (dtb__284, cs2))))))
  | Core_dTerm.C_Term_TCon (dtb__286, dtb__287) -> ((Base_dCommon.v_bind ((Base_dCommon.v_traverse (((v_substInstParamsPair mc0) mc1) mc2)) dtb__287)) (fun (cs2 : (Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((Core_dTerm.C_Term_TCon (dtb__286, cs2))))))
  | Core_dTerm.C_Term_TApp (dtb__288, dtb__289, dtb__290) -> ((Base_dCommon.v_bind ((((v_substInstParamsGo mc0) mc1) mc2) dtb__288)) (fun (f2 : Core_dTerm.t_Term) -> ((Base_dCommon.v_bind ((((v_substInstParamsGo mc0) mc1) mc2) dtb__289)) (fun (a2 : Core_dTerm.t_Term) -> (Base_dDiag.C_Check_OkC ((Core_dTerm.C_Term_TApp (f2, a2, dtb__290))))))))
  | Core_dTerm.C_Term_TLam (dtb__291, dtb__292, dtb__293, dtb__294, dtb__295) -> ((Base_dCommon.v_bind ((((v_substInstParamsSlot mc0) mc1) mc2) dtb__293)) (fun (slot2 : (Core_dTerm.t_LamMark, (Core_dTerm.t_Term B_dData_dMaybe.t_Maybe, Core_dTerm.t_Term B_dData_dMaybe.t_Maybe) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dMaybe.t_Maybe) -> ((Base_dCommon.v_bind ((((v_substInstParamsGo mc0) mc1) (mc2 + 1)) dtb__295)) (fun (body2 : Core_dTerm.t_Term) -> (Base_dDiag.C_Check_OkC ((Core_dTerm.C_Term_TLam (dtb__291, dtb__292, slot2, dtb__294, body2))))))))
  | Core_dTerm.C_Term_TPi (dtb__296, dtb__297, dtb__298, dtb__299, dtb__300) -> ((Base_dCommon.v_bind ((((v_substInstParamsGo mc0) mc1) mc2) dtb__299)) (fun (dom2 : Core_dTerm.t_Term) -> ((Base_dCommon.v_bind ((((v_substInstParamsGo mc0) mc1) (mc2 + 1)) dtb__300)) (fun (cod2 : Core_dTerm.t_Term) -> (Base_dDiag.C_Check_OkC ((Core_dTerm.C_Term_TPi (dtb__296, dtb__297, dtb__298, dom2, cod2))))))))
  | Core_dTerm.C_Term_TVar (dtb__301, dtb__302, dtb__303) -> (if (dtb__302 >= mc2) then (if ((dtb__302 - mc2) < mc0) then (match ((v_instArgAt ((mc0 - 1) - (dtb__302 - mc2))) mc1) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__304) -> (Base_dDiag.C_Check_OkC ((((Core_dTerm.v_shift 0) mc2) dtb__304)))
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.v_icInternal "substInstParams: instance head argument index out of range")
  | _ -> failwith "DT: impossible branch"
) else (Base_dDiag.C_Check_OkC (mc3))) else (Base_dDiag.C_Check_OkC (mc3)))
  | _ -> (Base_dDiag.C_Check_OkC (mc3))
))
# 939 "Vuna/Compiler/Elab/Trait.vuna"
and v_substInstParamsSlot = (fun (mc0 : int) (mc1 : Core_dTerm.t_Term B_dData_dList.t_List) (mc2 : int) (mc3 : (Core_dTerm.t_LamMark, (Core_dTerm.t_Term B_dData_dMaybe.t_Maybe, Core_dTerm.t_Term B_dData_dMaybe.t_Maybe) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dMaybe.t_Maybe) -> (match mc3 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__305) -> (match dtb__305 with
  | { B_dData_dPair.f_Pair_first = dtb__306; B_dData_dPair.f_Pair_second = dtb__307 } -> (match dtb__307 with
  | { B_dData_dPair.f_Pair_first = dtb__308; B_dData_dPair.f_Pair_second = dtb__309 } -> ((Base_dCommon.v_bind ((((v_substInstParamsMaybe mc0) mc1) mc2) dtb__308)) (fun (bt2 : Core_dTerm.t_Term B_dData_dMaybe.t_Maybe) -> ((Base_dCommon.v_bind ((((v_substInstParamsMaybe mc0) mc1) (mc2 + 1)) dtb__309)) (fun (rt2 : Core_dTerm.t_Term B_dData_dMaybe.t_Maybe) -> (Base_dDiag.C_Check_OkC ((B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = dtb__306; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = bt2; B_dData_dPair.f_Pair_second = rt2 } }))))))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.C_Check_OkC (B_dData_dMaybe.C_Maybe_Nothing))
  | _ -> failwith "DT: impossible branch"
))
# 946 "Vuna/Compiler/Elab/Trait.vuna"
and v_substInstParamsMaybe = (fun (mc0 : int) (mc1 : Core_dTerm.t_Term B_dData_dList.t_List) (mc2 : int) (mc3 : Core_dTerm.t_Term B_dData_dMaybe.t_Maybe) -> (match mc3 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__310) -> ((Base_dCommon.v_bind ((((v_substInstParamsGo mc0) mc1) mc2) dtb__310)) (fun (t2 : Core_dTerm.t_Term) -> (Base_dDiag.C_Check_OkC ((B_dData_dMaybe.C_Maybe_Just (t2))))))
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.C_Check_OkC (B_dData_dMaybe.C_Maybe_Nothing))
  | _ -> failwith "DT: impossible branch"
))
# 951 "Vuna/Compiler/Elab/Trait.vuna"
and v_substInstParamsPair = (fun (mc0 : int) (mc1 : Core_dTerm.t_Term B_dData_dList.t_List) (mc2 : int) (mc3 : (Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair) -> (match mc3 with
  | { B_dData_dPair.f_Pair_first = dtb__311; B_dData_dPair.f_Pair_second = dtb__312 } -> ((Base_dCommon.v_bind ((((v_substInstParamsGo mc0) mc1) mc2) dtb__311)) (fun (t2 : Core_dTerm.t_Term) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = t2; B_dData_dPair.f_Pair_second = dtb__312 }))))
  | _ -> failwith "DT: impossible branch"
))
# 955 "Vuna/Compiler/Elab/Trait.vuna"
and v_substInstParamsAlt = (fun (mc0 : int) (mc1 : Core_dTerm.t_Term B_dData_dList.t_List) (mc2 : int) (mc3 : Core_dTerm.t_CaseAlt) -> (match mc3 with
  | { Core_dTerm.f_CaseAlt_caseAltName = dtb__313; Core_dTerm.f_CaseAlt_caseAltBinders = dtb__314; Core_dTerm.f_CaseAlt_caseAltBody = dtb__315 } -> ((Base_dCommon.v_bind ((((v_substInstParamsGo mc0) mc1) (mc2 + (B_dData_dList.v_length dtb__314))) dtb__315)) (fun (b2 : Core_dTerm.t_Term) -> (Base_dDiag.C_Check_OkC ({ Core_dTerm.f_CaseAlt_caseAltName = dtb__313; Core_dTerm.f_CaseAlt_caseAltBinders = dtb__314; Core_dTerm.f_CaseAlt_caseAltBody = b2 }))))
  | _ -> failwith "DT: impossible branch"
))

# 895 "Vuna/Compiler/Elab/Trait.vuna"
let v_substInstParams = (fun (args : Core_dTerm.t_Term B_dData_dList.t_List) (t : Core_dTerm.t_Term) -> ((((v_substInstParamsGo (B_dData_dList.v_length args)) args) 0) t))

# 340 "Vuna/Compiler/Elab/Trait.vuna"
let rec v_checkSuperClasses = (fun (mc0 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc1 : Elab_dTypes.t_Ctx) (mc2 : int) (mc3 : string) (mc4 : Base_dSource.t_Span) (mc5 : Core_dTerm.t_Term B_dData_dList.t_List) (mc6 : Core_dTerm.t_Term B_dData_dList.t_List) (mc7 : Elab_dTypes.t_Ec) -> (match mc6 with
  | B_dData_dList.C_List__x58__x58_ (dtb__316, dtb__317) -> ((Base_dCommon.v_bind ((v_substInstParams mc5) dtb__316)) (fun (s2 : Core_dTerm.t_Term) -> (let goal = ((Elab_dTypes.v_evalCtx mc1) (((Core_dTerm.v_shift 0) mc2) s2)) in (let nd_uscrut13 = (((((Elab_dDict.v_searchInstanceIn mc0) mc1) mc7) goal) mc4) in (match nd_uscrut13 with
  | Base_dDiag.C_Check_OkC (dtb__318) -> (match dtb__318 with
  | { B_dData_dPair.f_Pair_first = dtb__319; B_dData_dPair.f_Pair_second = dtb__320 } -> ((((((((v_checkSuperClasses mc0) mc1) mc2) mc3) mc4) mc5) dtb__317) dtb__320)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dDiag.C_Check_ErrC (dtb__321) -> ((((Base_dDiagnostics_dTc.v_tcErr2 mc4) (Base_dDiagnostics_dTc.C_TcErr_SuperclassNotSatisfied (mc3, (Core_dEval.v_showValue goal)))) mc3) (Core_dEval.v_showValue goal))
  | _ -> failwith "DT: impossible branch"
)))))
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (mc7))
  | _ -> failwith "DT: impossible branch"
))

# 989 "Vuna/Compiler/Elab/Trait.vuna"
let rec v_methodClausesGo = (fun (mc0 : string) (mc1 : Frontend_dAst.t_Decl B_dData_dList.t_List) (mc2 : (Frontend_dAst.t_Pat B_dData_dList.t_List, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__322, dtb__323) -> (match dtb__322 with
  | Frontend_dAst.C_Decl_DFun (dtb__324, dtb__325, dtb__326, dtb__327) -> (if ((v_sameMethodShort dtb__324) mc0) then (((v_methodClausesGo mc0) dtb__323) (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__325; B_dData_dPair.f_Pair_second = dtb__326 }, mc2))) else (((v_methodClausesGo mc0) dtb__323) mc2))
  | _ -> (((v_methodClausesGo mc0) dtb__323) mc2)
)
  | B_dData_dList.C_List_Nil -> (B_dData_dList.v_reverse mc2)
  | _ -> failwith "DT: impossible branch"
))

# 986 "Vuna/Compiler/Elab/Trait.vuna"
let v_methodClausesNamed = (fun (mname : string) (decls : Frontend_dAst.t_Decl B_dData_dList.t_List) -> (((v_methodClausesGo mname) decls) B_dData_dList.C_List_Nil))

# 1048 "Vuna/Compiler/Elab/Trait.vuna"
let v_ctxDictDomEqual = (fun (ec : Elab_dTypes.t_Ec) (depth : int) (a : Core_dTerm.t_Value) (b : Core_dTerm.t_Value) -> (match (((((Core_dConv.v_conv (Elab_dTypes.v_ecDefTbl ec)) (Elab_dTypes.v_ecSolsP ec)) depth) ((Elab_dTypes.v_forceVal ec) a)) ((Elab_dTypes.v_forceVal ec) b)) with
  | Base_dDiag.C_Check_OkC (dtb__328) -> true
  | Base_dDiag.C_Check_ErrC (dtb__329) -> false
  | _ -> failwith "DT: impossible branch"
))

# 1039 "Vuna/Compiler/Elab/Trait.vuna"
let rec v_matchCtxDictIdxGo = (fun (mc0 : Elab_dTypes.t_Ctx) (mc1 : int) (mc2 : Core_dTerm.t_Value) (mc3 : Elab_dTypes.t_Ec) (mc4 : int) (mc5 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc5 with
  | B_dData_dList.C_List__x58__x58_ (dtb__330, dtb__331) -> (if (mc4 >= mc1) then B_dData_dMaybe.C_Maybe_Nothing else (match dtb__330 with
  | { B_dData_dPair.f_Pair_first = dtb__332; B_dData_dPair.f_Pair_second = dtb__333 } -> (if ((((v_ctxDictDomEqual mc3) (Elab_dTypes.v_ctxDepth mc0)) (((Elab_dTypes.v_varTypeValue mc0) mc4) dtb__333)) mc2) then (B_dData_dMaybe.C_Maybe_Just (mc4)) else ((((((v_matchCtxDictIdxGo mc0) mc1) mc2) mc3) (mc4 + 1)) dtb__331))
  | _ -> failwith "DT: impossible branch"
))
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 1036 "Vuna/Compiler/Elab/Trait.vuna"
let v_matchCtxDictIdx = (fun (ctx : Elab_dTypes.t_Ctx) (nCtx : int) (dom : Core_dTerm.t_Value) (ec : Elab_dTypes.t_Ec) -> ((((((v_matchCtxDictIdxGo ctx) nCtx) dom) ec) 0) (ctx).Elab_dTypes.f_Ctx_ctxItems))

# 1020 "Vuna/Compiler/Elab/Trait.vuna"
let rec v_solveCtxGoalsGo = (fun (mc0 : Elab_dTypes.t_Ctx) (mc1 : int) (mc2 : Elab_dTypes.t_Ec) (mc3 : Elab_dTypes.t_Constraint B_dData_dList.t_List) (mc4 : Elab_dTypes.t_Constraint B_dData_dList.t_List) (mc5 : (int, int) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc3 with
  | B_dData_dList.C_List__x58__x58_ (dtb__334, dtb__335) -> (match dtb__334 with
  | { Elab_dTypes.f_Constraint_conId = dtb__336; Elab_dTypes.f_Constraint_conKind = dtb__337; Elab_dTypes.f_Constraint_conMeta = dtb__338; Elab_dTypes.f_Constraint_conDom = dtb__339; Elab_dTypes.f_Constraint_conSpan = dtb__340; Elab_dTypes.f_Constraint_conDepth = dtb__341 } -> (match ((Core_dTerm.v_metaLookup dtb__338) (Elab_dTypes.v_ecSolTbl mc2)) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__342) -> ((((((v_solveCtxGoalsGo mc0) mc1) mc2) dtb__335) mc4) mc5)
  | B_dData_dMaybe.C_Maybe_Nothing -> (match ((((v_matchCtxDictIdx mc0) mc1) dtb__339) mc2) with
  | B_dData_dMaybe.C_Maybe_Nothing -> ((((((v_solveCtxGoalsGo mc0) mc1) mc2) dtb__335) (B_dData_dList.C_List__x58__x58_ (dtb__334, mc4))) mc5)
  | B_dData_dMaybe.C_Maybe_Just (dtb__343) -> (let k = ((mc1 - 1) - dtb__343) in (match ((((((Core_dConv.v_solveMeta (Elab_dTypes.v_ecDefTbl mc2)) (Elab_dTypes.v_ecSolsP mc2)) (Elab_dTypes.v_ctxDepth mc0)) dtb__338) B_dData_dList.C_List_Nil) (Core_dTerm.C_Value_VNeutral ((Core_dTerm.C_Neutral_NVar ((v_ctxDictName k), (((Elab_dTypes.v_ctxDepth mc0) - mc1) + k), B_dData_dList.C_List_Nil))))) with
  | Base_dDiag.C_Check_OkC (dtb__344) -> ((((((v_solveCtxGoalsGo mc0) mc1) ((Elab_dTypes.v_ecPutSols mc2) (Core_dTerm.v_solsList dtb__344))) dtb__335) mc4) (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__338; B_dData_dPair.f_Pair_second = k }, mc5)))
  | Base_dDiag.C_Check_ErrC (dtb__345) -> ((((((v_solveCtxGoalsGo mc0) mc1) mc2) dtb__335) mc4) mc5)
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

# 1017 "Vuna/Compiler/Elab/Trait.vuna"
let v_solveCtxGoals = (fun (ctx : Elab_dTypes.t_Ctx) (nCtx : int) (nTele : int) (ec : Elab_dTypes.t_Ec) (acc : (int, int) B_dData_dPair.t_Pair B_dData_dList.t_List) -> ((((((v_solveCtxGoalsGo ctx) nCtx) ec) (Elab_dTypes.v_ecPendingList ec)) B_dData_dList.C_List_Nil) acc))

# 1057 "Vuna/Compiler/Elab/Trait.vuna"
let rec v_applyCtxSubstsTo = (fun (mc0 : int) (mc1 : (int, int) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc2 : Core_dTerm.t_Term) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__346, dtb__347) -> (match dtb__346 with
  | { B_dData_dPair.f_Pair_first = dtb__348; B_dData_dPair.f_Pair_second = dtb__349 } -> (((v_applyCtxSubstsTo mc0) dtb__347) ((((Core_dTerm.v_substMetaVar dtb__348) (v_ctxDictName dtb__349)) ((mc0 + dtb__349) + 1)) mc2))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> mc2
  | _ -> failwith "DT: impossible branch"
))

# 1068 "Vuna/Compiler/Elab/Trait.vuna"
let rec v_resolveRigidGoalsGo = (fun (mc0 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc1 : Elab_dTypes.t_Ctx) (mc2 : Base_dSource.t_Span) (mc3 : int) (mc4 : Elab_dTypes.t_Constraint B_dData_dList.t_List) (mc5 : Elab_dTypes.t_Constraint B_dData_dList.t_List) (mc6 : (int, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc7 : Elab_dTypes.t_Ec) -> (match mc4 with
  | B_dData_dList.C_List__x58__x58_ (dtb__350, dtb__351) -> (match dtb__350 with
  | { Elab_dTypes.f_Constraint_conId = dtb__352; Elab_dTypes.f_Constraint_conKind = dtb__353; Elab_dTypes.f_Constraint_conMeta = dtb__354; Elab_dTypes.f_Constraint_conDom = dtb__355; Elab_dTypes.f_Constraint_conSpan = dtb__356; Elab_dTypes.f_Constraint_conDepth = dtb__357 } -> (if (dtb__352 < mc3) then ((((((((v_resolveRigidGoalsGo mc0) mc1) mc2) mc3) dtb__351) (B_dData_dList.C_List__x58__x58_ (dtb__350, mc5))) mc6) mc7) else (if ((Elab_dDict.v_isRigidDictArg mc7) dtb__355) then (let nd_uscrut17 = (((((Elab_dDict.v_searchInstanceIn mc0) mc1) mc7) dtb__355) mc2) in (match nd_uscrut17 with
  | Base_dDiag.C_Check_OkC (dtb__358) -> (match dtb__358 with
  | { B_dData_dPair.f_Pair_first = dtb__359; B_dData_dPair.f_Pair_second = dtb__360 } -> (match ((((((Core_dConv.v_solveMeta (Elab_dTypes.v_ecDefTbl dtb__360)) (Elab_dTypes.v_ecSolsP dtb__360)) (Elab_dTypes.v_ctxDepth mc1)) dtb__354) B_dData_dList.C_List_Nil) ((Core_dEval.v_eval (Elab_dTypes.v_ctxEnv mc1)) dtb__359)) with
  | Base_dDiag.C_Check_OkC (dtb__361) -> ((((((((v_resolveRigidGoalsGo mc0) mc1) mc2) mc3) dtb__351) mc5) (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__354; B_dData_dPair.f_Pair_second = dtb__359 }, mc6))) ((Elab_dTypes.v_ecPutSols dtb__360) (Core_dTerm.v_solsList dtb__361)))
  | Base_dDiag.C_Check_ErrC (dtb__362) -> ((((((((v_resolveRigidGoalsGo mc0) mc1) mc2) mc3) dtb__351) (B_dData_dList.C_List__x58__x58_ (dtb__350, mc5))) mc6) dtb__360)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dDiag.C_Check_ErrC (dtb__363) -> (((Base_dDiagnostics_dTc.v_tcErr1 mc2) (Base_dDiagnostics_dTc.C_TcErr_InstanceContextMissing ((Core_dEval.v_showValue dtb__355)))) (Core_dEval.v_showValue dtb__355))
  | _ -> failwith "DT: impossible branch"
)) else ((((((((v_resolveRigidGoalsGo mc0) mc1) mc2) mc3) dtb__351) (B_dData_dList.C_List__x58__x58_ (dtb__350, mc5))) mc6) mc7)))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.v_reverse mc6); B_dData_dPair.f_Pair_second = ((Elab_dTypes.v_ecPutPending mc7) (B_dData_dList.v_reverse mc5)) }))
  | _ -> failwith "DT: impossible branch"
))

# 1064 "Vuna/Compiler/Elab/Trait.vuna"
let v_resolveRigidGoals = (fun (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (sp : Base_dSource.t_Span) (minCid : int) (goals : Elab_dTypes.t_Constraint B_dData_dList.t_List) (acc : (int, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ec : Elab_dTypes.t_Ec) -> ((((((((v_resolveRigidGoalsGo globals) ctx) sp) minCid) goals) B_dData_dList.C_List_Nil) acc) ec))

# 1097 "Vuna/Compiler/Elab/Trait.vuna"
let rec v_substMetaTermGo = (fun (mc0 : int) (mc1 : Core_dTerm.t_Term) (mc2 : int) (mc3 : Core_dTerm.t_Term) -> (match mc3 with
  | Core_dTerm.C_Term_TIf (dtb__364, dtb__365, dtb__366) -> (Core_dTerm.C_Term_TIf (((((v_substMetaTermGo mc0) mc1) mc2) dtb__364), ((((v_substMetaTermGo mc0) mc1) mc2) dtb__365), ((((v_substMetaTermGo mc0) mc1) mc2) dtb__366)))
  | Core_dTerm.C_Term_TCase (dtb__367, dtb__368) -> (Core_dTerm.C_Term_TCase (((((v_substMetaTermGo mc0) mc1) mc2) dtb__367), ((B_dData_dList.v_map (fun (alt : Core_dTerm.t_CaseAlt) -> ((((v_substMetaTermAlt mc0) mc1) mc2) alt))) dtb__368)))
  | Core_dTerm.C_Term_TRecord (dtb__369, dtb__370) -> (Core_dTerm.C_Term_TRecord (dtb__369, ((B_dData_dList.v_map (fun (p : (Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair) -> { B_dData_dPair.f_Pair_first = ((((v_substMetaTermGo mc0) mc1) mc2) (B_dData_dPair.v_firstOf (Obj.magic p))); B_dData_dPair.f_Pair_second = (B_dData_dPair.v_secondOf (Obj.magic p)) })) dtb__370)))
  | Core_dTerm.C_Term_TMk (dtb__371, dtb__372) -> (Core_dTerm.C_Term_TMk (dtb__371, ((B_dData_dList.v_map (fun (p : (Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair) -> { B_dData_dPair.f_Pair_first = ((((v_substMetaTermGo mc0) mc1) mc2) (B_dData_dPair.v_firstOf (Obj.magic p))); B_dData_dPair.f_Pair_second = (B_dData_dPair.v_secondOf (Obj.magic p)) })) dtb__372)))
  | Core_dTerm.C_Term_TCon (dtb__373, dtb__374) -> (Core_dTerm.C_Term_TCon (dtb__373, ((B_dData_dList.v_map (fun (p : (Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair) -> { B_dData_dPair.f_Pair_first = ((((v_substMetaTermGo mc0) mc1) mc2) (B_dData_dPair.v_firstOf (Obj.magic p))); B_dData_dPair.f_Pair_second = (B_dData_dPair.v_secondOf (Obj.magic p)) })) dtb__374)))
  | Core_dTerm.C_Term_TApp (dtb__375, dtb__376, dtb__377) -> (Core_dTerm.C_Term_TApp (((((v_substMetaTermGo mc0) mc1) mc2) dtb__375), ((((v_substMetaTermGo mc0) mc1) mc2) dtb__376), dtb__377))
  | Core_dTerm.C_Term_TLam (dtb__378, dtb__379, dtb__380, dtb__381, dtb__382) -> (let slot2 = (let nd_uscrut9 = dtb__380 in (match nd_uscrut9 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__383) -> (match dtb__383 with
  | { B_dData_dPair.f_Pair_first = dtb__384; B_dData_dPair.f_Pair_second = dtb__385 } -> (match dtb__385 with
  | { B_dData_dPair.f_Pair_first = dtb__386; B_dData_dPair.f_Pair_second = dtb__387 } -> (let bt2 = (match dtb__386 with
  | B_dData_dMaybe.C_Maybe_Nothing -> (Obj.magic B_dData_dMaybe.C_Maybe_Nothing)
  | B_dData_dMaybe.C_Maybe_Just (dtb__389) -> (B_dData_dMaybe.C_Maybe_Just (((((v_substMetaTermGo mc0) mc1) mc2) dtb__389)))
  | _ -> failwith "DT: impossible branch"
) in (let rt2 = (match dtb__387 with
  | B_dData_dMaybe.C_Maybe_Nothing -> (Obj.magic B_dData_dMaybe.C_Maybe_Nothing)
  | B_dData_dMaybe.C_Maybe_Just (dtb__388) -> (B_dData_dMaybe.C_Maybe_Just (((((v_substMetaTermGo mc0) mc1) (mc2 + 1)) dtb__388)))
  | _ -> failwith "DT: impossible branch"
) in (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = dtb__384; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = bt2; B_dData_dPair.f_Pair_second = rt2 } }))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) in (Core_dTerm.C_Term_TLam (dtb__378, dtb__379, slot2, dtb__381, ((((v_substMetaTermGo mc0) mc1) (mc2 + 1)) dtb__382))))
  | Core_dTerm.C_Term_TPi (dtb__390, dtb__391, dtb__392, dtb__393, dtb__394) -> (Core_dTerm.C_Term_TPi (dtb__390, dtb__391, dtb__392, ((((v_substMetaTermGo mc0) mc1) mc2) dtb__393), ((((v_substMetaTermGo mc0) mc1) (mc2 + 1)) dtb__394)))
  | Core_dTerm.C_Term_TMeta (dtb__395) -> (if (dtb__395 = mc0) then (((Core_dTerm.v_shift 0) mc2) mc1) else mc3)
  | _ -> mc3
))
# 1135 "Vuna/Compiler/Elab/Trait.vuna"
and v_substMetaTermAlt = (fun (mc0 : int) (mc1 : Core_dTerm.t_Term) (mc2 : int) (mc3 : Core_dTerm.t_CaseAlt) -> (match mc3 with
  | { Core_dTerm.f_CaseAlt_caseAltName = dtb__396; Core_dTerm.f_CaseAlt_caseAltBinders = dtb__397; Core_dTerm.f_CaseAlt_caseAltBody = dtb__398 } -> { Core_dTerm.f_CaseAlt_caseAltName = dtb__396; Core_dTerm.f_CaseAlt_caseAltBinders = dtb__397; Core_dTerm.f_CaseAlt_caseAltBody = ((((v_substMetaTermGo mc0) mc1) (mc2 + (B_dData_dList.v_length dtb__397))) dtb__398) }
  | _ -> failwith "DT: impossible branch"
))

# 1094 "Vuna/Compiler/Elab/Trait.vuna"
let v_substMetaTerm = (fun (m : int) (rep : Core_dTerm.t_Term) (t : Core_dTerm.t_Term) -> ((((v_substMetaTermGo m) rep) 0) t))

# 1089 "Vuna/Compiler/Elab/Trait.vuna"
let rec v_applyTermSubstsTo = (fun (mc0 : int) (mc1 : (int, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc2 : Core_dTerm.t_Term) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__399, dtb__400) -> (match dtb__399 with
  | { B_dData_dPair.f_Pair_first = dtb__401; B_dData_dPair.f_Pair_second = dtb__402 } -> (((v_applyTermSubstsTo mc0) dtb__400) (((v_substMetaTerm dtb__401) dtb__402) mc2))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> mc2
  | _ -> failwith "DT: impossible branch"
))

# 1139 "Vuna/Compiler/Elab/Trait.vuna"
let v_clauseSpanOf = (fun (mc0 : (Frontend_dAst.t_Pat B_dData_dList.t_List, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__403, dtb__404) -> (Frontend_dAst.v_exprSpan (B_dData_dPair.v_secondOf dtb__403))
  | B_dData_dList.C_List_Nil -> { Base_dSource.f_Span_spanFile = ""; Base_dSource.f_Span_spanStartLine = 0; Base_dSource.f_Span_spanStartCol = 0; Base_dSource.f_Span_spanEndLine = 0; Base_dSource.f_Span_spanEndCol = 0; Base_dSource.f_Span_spanStartOffset = 0; Base_dSource.f_Span_spanEndOffset = 0 }
  | _ -> failwith "DT: impossible branch"
))

# 1162 "Vuna/Compiler/Elab/Trait.vuna"
let v_literalClassArg = (fun (mc0 : Core_dTerm.t_Value) -> (match mc0 with
  | Core_dTerm.C_Value_VFloat (dtb__405) -> true
  | Core_dTerm.C_Value_VBool (dtb__406) -> true
  | Core_dTerm.C_Value_VInt (dtb__407) -> true
  | Core_dTerm.C_Value_VStr (dtb__408) -> true
  | _ -> false
))

# 1169 "Vuna/Compiler/Elab/Trait.vuna"
let v_liftableDictDomain = (fun (ec : Elab_dTypes.t_Ec) (dom : Core_dTerm.t_Value) -> ((B_dData_dList.v_length ((B_dData_dList.v_filter v_literalClassArg) ((Elab_dDict.v_dictClassArgs ec) dom))) = 0))

# 1197 "Vuna/Compiler/Elab/Trait.vuna"
let v_domainsEqual = (fun (ec : Elab_dTypes.t_Ec) (a : Core_dTerm.t_Value) (b : Core_dTerm.t_Value) -> (match (((((Core_dConv.v_conv (Elab_dTypes.v_ecDefTbl ec)) (Elab_dTypes.v_ecSolsP ec)) 0) a) b) with
  | Base_dDiag.C_Check_OkC (dtb__409) -> true
  | Base_dDiag.C_Check_ErrC (dtb__410) -> false
  | _ -> failwith "DT: impossible branch"
))

# 1189 "Vuna/Compiler/Elab/Trait.vuna"
let[@tail_mod_cons] rec v_addDictGoalGroup = (fun (mc0 : Elab_dTypes.t_Ec) (mc1 : int) (mc2 : Core_dTerm.t_Value) (mc3 : t_DictGoalGroup B_dData_dList.t_List) -> (match mc3 with
  | B_dData_dList.C_List__x58__x58_ (dtb__411, dtb__412) -> (match dtb__411 with
  | { f_DictGoalGroup_dictGoalGroupRep = dtb__413; f_DictGoalGroup_dictGoalGroupDom = dtb__414; f_DictGoalGroup_dictGoalGroupExtras = dtb__415 } -> (if (((v_domainsEqual mc0) dtb__414) mc2) then (B_dData_dList.C_List__x58__x58_ ({ f_DictGoalGroup_dictGoalGroupRep = dtb__413; f_DictGoalGroup_dictGoalGroupDom = dtb__414; f_DictGoalGroup_dictGoalGroupExtras = (B_dData_dList.C_List__x58__x58_ (mc1, dtb__415)) }, dtb__412)) else (B_dData_dList.C_List__x58__x58_ ({ f_DictGoalGroup_dictGoalGroupRep = dtb__413; f_DictGoalGroup_dictGoalGroupDom = dtb__414; f_DictGoalGroup_dictGoalGroupExtras = dtb__415 }, ((((v_addDictGoalGroup mc0) mc1) mc2) dtb__412))))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (B_dData_dList.C_List__x58__x58_ ({ f_DictGoalGroup_dictGoalGroupRep = mc1; f_DictGoalGroup_dictGoalGroupDom = mc2; f_DictGoalGroup_dictGoalGroupExtras = B_dData_dList.C_List_Nil }, B_dData_dList.C_List_Nil))
  | _ -> failwith "DT: impossible branch"
))

# 1174 "Vuna/Compiler/Elab/Trait.vuna"
let rec v_freeDictGoalsGo = (fun (mc0 : int) (mc1 : Elab_dTypes.t_Ec) (mc2 : Elab_dTypes.t_Constraint B_dData_dList.t_List) (mc3 : t_DictGoalGroup B_dData_dList.t_List) -> (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__416, dtb__417) -> (match dtb__416 with
  | { Elab_dTypes.f_Constraint_conId = dtb__418; Elab_dTypes.f_Constraint_conKind = dtb__419; Elab_dTypes.f_Constraint_conMeta = dtb__420; Elab_dTypes.f_Constraint_conDom = dtb__421; Elab_dTypes.f_Constraint_conSpan = dtb__422; Elab_dTypes.f_Constraint_conDepth = dtb__423 } -> (if (if (if (dtb__418 >= mc0) then ((Elab_dDict.v_isRigidDictArg mc1) dtb__421) else false) then ((v_liftableDictDomain mc1) dtb__421) else false) then (match ((Core_dTerm.v_metaLookup dtb__420) (Elab_dTypes.v_ecSolTbl mc1)) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__424) -> ((((v_freeDictGoalsGo mc0) mc1) dtb__417) mc3)
  | B_dData_dMaybe.C_Maybe_Nothing -> ((((v_freeDictGoalsGo mc0) mc1) dtb__417) ((((v_addDictGoalGroup mc1) dtb__420) dtb__421) mc3))
  | _ -> failwith "DT: impossible branch"
) else ((((v_freeDictGoalsGo mc0) mc1) dtb__417) mc3))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> mc3
  | _ -> failwith "DT: impossible branch"
))

# 1157 "Vuna/Compiler/Elab/Trait.vuna"
let v_freeDictGoals = (fun (minCid : int) (ec : Elab_dTypes.t_Ec) -> ((((v_freeDictGoalsGo minCid) ec) (Elab_dTypes.v_ecPendingList ec)) B_dData_dList.C_List_Nil))

# 1204 "Vuna/Compiler/Elab/Trait.vuna"
let rec v_leadingImplicitCount = (fun (mc0 : Core_dTerm.t_Term) -> (match mc0 with
  | Core_dTerm.C_Term_TPi (dtb__425, dtb__426, dtb__427, dtb__428, dtb__429) -> (if dtb__426 then (1 + (v_leadingImplicitCount dtb__429)) else 0)
  | _ -> 0
))

# 1211 "Vuna/Compiler/Elab/Trait.vuna"
let v_solveLiftedMeta = (fun (ec : Elab_dTypes.t_Ec) (name : string) (level : int) (m : int) -> (match ((((((Core_dConv.v_solveMeta (Elab_dTypes.v_ecDefTbl ec)) (Elab_dTypes.v_ecSolsP ec)) (level + 1)) m) B_dData_dList.C_List_Nil) (Core_dTerm.C_Value_VNeutral ((Core_dTerm.C_Neutral_NVar (name, level, B_dData_dList.C_List_Nil))))) with
  | Base_dDiag.C_Check_OkC (dtb__430) -> ((Elab_dTypes.v_ecPutSols ec) (Core_dTerm.v_solsList dtb__430))
  | Base_dDiag.C_Check_ErrC (dtb__431) -> ec
  | _ -> failwith "DT: impossible branch"
))

# 1218 "Vuna/Compiler/Elab/Trait.vuna"
let rec v_solveLiftedMetas = (fun (mc0 : Elab_dTypes.t_Ec) (mc1 : string) (mc2 : int) (mc3 : int B_dData_dList.t_List) -> (match mc3 with
  | B_dData_dList.C_List__x58__x58_ (dtb__432, dtb__433) -> ((((v_solveLiftedMetas ((((v_solveLiftedMeta mc0) mc1) mc2) dtb__432)) mc1) mc2) dtb__433)
  | B_dData_dList.C_List_Nil -> mc0
  | _ -> failwith "DT: impossible branch"
))

# 1240 "Vuna/Compiler/Elab/Trait.vuna"
let v_dictAnchor = (fun (ty : Core_dTerm.t_Term) -> ((Elab_dMeta.v_maxInt 1) (v_leadingImplicitCount ty)))

# 1249 "Vuna/Compiler/Elab/Trait.vuna"
let rec v_planDictBindersGo = (fun (mc0 : int) (mc1 : Elab_dTypes.t_Ec) (mc2 : t_DictGoalGroup B_dData_dList.t_List) (mc3 : int) (mc4 : int) -> (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__434, dtb__435) -> (match dtb__434 with
  | { f_DictGoalGroup_dictGoalGroupRep = dtb__436; f_DictGoalGroup_dictGoalGroupDom = dtb__437; f_DictGoalGroup_dictGoalGroupExtras = dtb__438 } -> (let level = (mc0 + ((mc4 - 1) - mc3)) in (let dName = (Frontend_dReserved.v_dictBinderName mc3) in (let dp = { f_DictPlan_dpName = dName; f_DictPlan_dpLevel = level; f_DictPlan_dpDom = (((Core_dEval.v_substSolvedMetasAtTbl (Elab_dTypes.v_ecSolTbl mc1)) level) ((Core_dEval.v_quote level) dtb__437)); f_DictPlan_dpMetas = (B_dData_dList.C_List__x58__x58_ (dtb__436, dtb__438)) } in (let next = (((((v_planDictBindersGo mc0) ((((v_solveLiftedMetas mc1) dName) level) (B_dData_dList.C_List__x58__x58_ (dtb__436, dtb__438)))) dtb__435) (mc3 + 1)) mc4) in { B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ (dp, (B_dData_dPair.v_firstOf next))); B_dData_dPair.f_Pair_second = (B_dData_dPair.v_secondOf next) }))))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> { B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = mc1 }
  | _ -> failwith "DT: impossible branch"
))

# 1246 "Vuna/Compiler/Elab/Trait.vuna"
let v_planDictBinders = (fun (anchor : int) (ec : Elab_dTypes.t_Ec) (groups : t_DictGoalGroup B_dData_dList.t_List) -> (((((v_planDictBindersGo anchor) ec) groups) 0) (B_dData_dList.v_length groups)))

# 1270 "Vuna/Compiler/Elab/Trait.vuna"
let v_dictPlanPi = (fun (mc0 : t_DictPlan) -> (match mc0 with
  | { f_DictPlan_dpName = dtb__439; f_DictPlan_dpLevel = dtb__440; f_DictPlan_dpDom = dtb__441; f_DictPlan_dpMetas = dtb__442 } -> { B_dData_dPair.f_Pair_first = dtb__439; B_dData_dPair.f_Pair_second = dtb__441 }
  | _ -> failwith "DT: impossible branch"
))

# 1273 "Vuna/Compiler/Elab/Trait.vuna"
let v_dictPlanName = (fun (mc0 : t_DictPlan) -> (match mc0 with
  | { f_DictPlan_dpName = dtb__443; f_DictPlan_dpLevel = dtb__444; f_DictPlan_dpDom = dtb__445; f_DictPlan_dpMetas = dtb__446 } -> dtb__443
  | _ -> failwith "DT: impossible branch"
))

# 1290 "Vuna/Compiler/Elab/Trait.vuna"
let[@tail_mod_cons] rec v_wrapDictPisGo = (fun (mc0 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc1 : Core_dTerm.t_Term) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__447, dtb__448) -> (match dtb__447 with
  | { B_dData_dPair.f_Pair_first = dtb__449; B_dData_dPair.f_Pair_second = dtb__450 } -> (Core_dTerm.C_Term_TPi (dtb__449, true, Core_dTerm.C_Rig_RigOmega, dtb__450, ((v_wrapDictPisGo dtb__448) mc1)))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> mc1
  | _ -> failwith "DT: impossible branch"
))

# 1287 "Vuna/Compiler/Elab/Trait.vuna"
let v_wrapDictPis = (fun (dicts : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (t : Core_dTerm.t_Term) -> ((v_wrapDictPisGo dicts) (((Core_dTerm.v_shift 0) (B_dData_dList.v_length dicts)) t)))

# 1276 "Vuna/Compiler/Elab/Trait.vuna"
let[@tail_mod_cons] rec v_insertPisAfter = (fun (n : int) (dicts : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (t : Core_dTerm.t_Term) -> (if (n <= 0) then ((v_wrapDictPis dicts) t) else (match t with
  | Core_dTerm.C_Term_TPi (dtb__451, dtb__452, dtb__453, dtb__454, dtb__455) -> (Core_dTerm.C_Term_TPi (dtb__451, dtb__452, dtb__453, dtb__454, (((v_insertPisAfter (n - 1)) dicts) dtb__455)))
  | _ -> ((v_wrapDictPis dicts) t)
)))

# 1267 "Vuna/Compiler/Elab/Trait.vuna"
let v_insertDictPis = (fun (anchor : int) (plans : t_DictPlan B_dData_dList.t_List) (ty : Core_dTerm.t_Term) -> (((v_insertPisAfter anchor) ((B_dData_dList.v_map v_dictPlanPi) plans)) ty))

# 1310 "Vuna/Compiler/Elab/Trait.vuna"
let[@tail_mod_cons] rec v_wrapDictLamsGo = (fun (mc0 : string B_dData_dList.t_List) (mc1 : Core_dTerm.t_Term) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__456, dtb__457) -> (Core_dTerm.C_Term_TLam (dtb__456, Core_dTerm.C_Rig_RigOmega, B_dData_dMaybe.C_Maybe_Nothing, Base_dSource.v_spanEmpty, ((v_wrapDictLamsGo dtb__457) mc1)))
  | B_dData_dList.C_List_Nil -> mc1
  | _ -> failwith "DT: impossible branch"
))

# 1307 "Vuna/Compiler/Elab/Trait.vuna"
let v_wrapDictLams = (fun (names : string B_dData_dList.t_List) (t : Core_dTerm.t_Term) -> ((v_wrapDictLamsGo names) (((Core_dTerm.v_shift 0) (B_dData_dList.v_length names)) t)))

# 1298 "Vuna/Compiler/Elab/Trait.vuna"
let[@tail_mod_cons] rec v_insertLamsAfter = (fun (n : int) (names : string B_dData_dList.t_List) (t : Core_dTerm.t_Term) -> (if (n <= 0) then ((v_wrapDictLams names) t) else (match t with
  | Core_dTerm.C_Term_TLam (dtb__458, dtb__459, dtb__460, dtb__461, dtb__462) -> (Core_dTerm.C_Term_TLam (dtb__458, dtb__459, dtb__460, dtb__461, (((v_insertLamsAfter (n - 1)) names) dtb__462)))
  | _ -> ((v_wrapDictLams names) t)
)))

# 1295 "Vuna/Compiler/Elab/Trait.vuna"
let v_insertDictLams = (fun (anchor : int) (plans : t_DictPlan B_dData_dList.t_List) (body : Core_dTerm.t_Term) -> (((v_insertLamsAfter anchor) ((B_dData_dList.v_map v_dictPlanName) plans)) body))

# 1320 "Vuna/Compiler/Elab/Trait.vuna"
let rec v_substMetaVarList = (fun (mc0 : string) (mc1 : int) (mc2 : int B_dData_dList.t_List) (mc3 : Core_dTerm.t_Term) -> (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__463, dtb__464) -> ((((v_substMetaVarList mc0) mc1) dtb__464) ((((Core_dTerm.v_substMetaVar dtb__463) mc0) mc1) mc3))
  | B_dData_dList.C_List_Nil -> mc3
  | _ -> failwith "DT: impossible branch"
))

# 1315 "Vuna/Compiler/Elab/Trait.vuna"
let rec v_substPlannedMetas = (fun (mc0 : t_DictPlan B_dData_dList.t_List) (mc1 : Core_dTerm.t_Term) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__465, dtb__466) -> (match dtb__465 with
  | { f_DictPlan_dpName = dtb__467; f_DictPlan_dpLevel = dtb__468; f_DictPlan_dpDom = dtb__469; f_DictPlan_dpMetas = dtb__470 } -> ((v_substPlannedMetas dtb__466) ((((v_substMetaVarList dtb__467) (dtb__468 + 1)) dtb__470) mc1))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> mc1
  | _ -> failwith "DT: impossible branch"
))

# 1361 "Vuna/Compiler/Elab/Trait.vuna"
let v_injectBudgetFor = (fun (t : Core_dTerm.t_Term) -> (64 + (4 * (Core_dTerm.v_termSize t))))

# 1364 "Vuna/Compiler/Elab/Trait.vuna"
let v_altBudgetFor = (fun (mc0 : Core_dTerm.t_CaseAlt) -> (match mc0 with
  | { Core_dTerm.f_CaseAlt_caseAltName = dtb__471; Core_dTerm.f_CaseAlt_caseAltBinders = dtb__472; Core_dTerm.f_CaseAlt_caseAltBody = dtb__473 } -> ((v_injectBudgetFor dtb__473) + (B_dData_dList.v_length dtb__472))
  | _ -> failwith "DT: impossible branch"
))

# 1418 "Vuna/Compiler/Elab/Trait.vuna"
let rec v_spineSize = (fun (mc0 : (Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__474, dtb__475) -> ((Core_dTerm.v_termSize (B_dData_dPair.v_firstOf dtb__474)) + (v_spineSize dtb__475))
  | B_dData_dList.C_List_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))

# 1431 "Vuna/Compiler/Elab/Trait.vuna"
let v_insertArgAt = (fun (n : int) x xs -> ((B_dData_dList.v_append ((B_dData_dList.v_append ((B_dData_dList.v_take n) xs)) (B_dData_dList.C_List__x58__x58_ (x, B_dData_dList.C_List_Nil)))) ((B_dData_dList.v_drop n) xs)))

# 1367 "Vuna/Compiler/Elab/Trait.vuna"
let rec v_injectDictGoFuel = (fun (fuel : int) (defName : string) (dName : string) (appPos : int) (depth : int) (t : Core_dTerm.t_Term) -> (if (fuel <= 0) then t else (match t with
  | Core_dTerm.C_Term_TLam (dtb__476, dtb__477, dtb__478, dtb__479, dtb__480) -> (let slot2 = (let nd_uscrut11 = dtb__478 in (match nd_uscrut11 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__481) -> (match dtb__481 with
  | { B_dData_dPair.f_Pair_first = dtb__482; B_dData_dPair.f_Pair_second = dtb__483 } -> (match dtb__483 with
  | { B_dData_dPair.f_Pair_first = dtb__484; B_dData_dPair.f_Pair_second = dtb__485 } -> (let bt2 = (match dtb__484 with
  | B_dData_dMaybe.C_Maybe_Nothing -> (Obj.magic B_dData_dMaybe.C_Maybe_Nothing)
  | B_dData_dMaybe.C_Maybe_Just (dtb__487) -> (B_dData_dMaybe.C_Maybe_Just (((((((v_injectDictGoFuel (fuel - 1)) defName) dName) appPos) depth) dtb__487)))
  | _ -> failwith "DT: impossible branch"
) in (let rt2 = (match dtb__485 with
  | B_dData_dMaybe.C_Maybe_Nothing -> (Obj.magic B_dData_dMaybe.C_Maybe_Nothing)
  | B_dData_dMaybe.C_Maybe_Just (dtb__486) -> (B_dData_dMaybe.C_Maybe_Just (((((((v_injectDictGoFuel (fuel - 1)) defName) dName) appPos) (depth + 1)) dtb__486)))
  | _ -> failwith "DT: impossible branch"
) in (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = dtb__482; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = bt2; B_dData_dPair.f_Pair_second = rt2 } }))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) in (Core_dTerm.C_Term_TLam (dtb__476, dtb__477, slot2, dtb__479, ((((((v_injectDictGoFuel (fuel - 1)) defName) dName) appPos) (depth + 1)) dtb__480))))
  | Core_dTerm.C_Term_TPi (dtb__488, dtb__489, dtb__490, dtb__491, dtb__492) -> (Core_dTerm.C_Term_TPi (dtb__488, dtb__489, dtb__490, ((((((v_injectDictGoFuel (fuel - 1)) defName) dName) appPos) depth) dtb__491), ((((((v_injectDictGoFuel (fuel - 1)) defName) dName) appPos) (depth + 1)) dtb__492)))
  | Core_dTerm.C_Term_TApp (dtb__493, dtb__494, dtb__495) -> (let nd_uscrut9 = (Elab_dTypes.v_flattenTaggedApp t) in (match nd_uscrut9 with
  | B_dData_dMaybe.C_Maybe_Nothing -> (Core_dTerm.C_Term_TApp (((((((v_injectDictGoFuel (fuel - 1)) defName) dName) appPos) depth) dtb__493), ((((((v_injectDictGoFuel (fuel - 1)) defName) dName) appPos) depth) dtb__494), dtb__495))
  | B_dData_dMaybe.C_Maybe_Just (dtb__496) -> (match dtb__496 with
  | { B_dData_dPair.f_Pair_first = dtb__497; B_dData_dPair.f_Pair_second = dtb__498 } -> (((((((v_rewriteTaggedSpineFuel (fuel - 1)) defName) dName) appPos) depth) dtb__497) dtb__498)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))
  | Core_dTerm.C_Term_TCon (dtb__499, dtb__500) -> (Core_dTerm.C_Term_TCon (dtb__499, ((B_dData_dList.v_map (fun (p : (Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair) -> { B_dData_dPair.f_Pair_first = ((((((v_injectDictGoFuel (fuel - 1)) defName) dName) appPos) depth) (B_dData_dPair.v_firstOf (Obj.magic p))); B_dData_dPair.f_Pair_second = (B_dData_dPair.v_secondOf (Obj.magic p)) })) dtb__500)))
  | Core_dTerm.C_Term_TMk (dtb__501, dtb__502) -> (Core_dTerm.C_Term_TMk (dtb__501, ((B_dData_dList.v_map (fun (p : (Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair) -> { B_dData_dPair.f_Pair_first = ((((((v_injectDictGoFuel (fuel - 1)) defName) dName) appPos) depth) (B_dData_dPair.v_firstOf (Obj.magic p))); B_dData_dPair.f_Pair_second = (B_dData_dPair.v_secondOf (Obj.magic p)) })) dtb__502)))
  | Core_dTerm.C_Term_TRecord (dtb__503, dtb__504) -> (Core_dTerm.C_Term_TRecord (dtb__503, ((B_dData_dList.v_map (fun (p : (Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair) -> { B_dData_dPair.f_Pair_first = ((((((v_injectDictGoFuel (fuel - 1)) defName) dName) appPos) depth) (B_dData_dPair.v_firstOf (Obj.magic p))); B_dData_dPair.f_Pair_second = (B_dData_dPair.v_secondOf (Obj.magic p)) })) dtb__504)))
  | Core_dTerm.C_Term_TCase (dtb__505, dtb__506) -> (Core_dTerm.C_Term_TCase (((((((v_injectDictGoFuel (fuel - 1)) defName) dName) appPos) depth) dtb__505), ((B_dData_dList.v_map (fun (alt : Core_dTerm.t_CaseAlt) -> ((((((v_injectAltGoFuel (fuel - 1)) defName) dName) appPos) depth) alt))) dtb__506)))
  | Core_dTerm.C_Term_TIf (dtb__507, dtb__508, dtb__509) -> (Core_dTerm.C_Term_TIf (((((((v_injectDictGoFuel (fuel - 1)) defName) dName) appPos) depth) dtb__507), ((((((v_injectDictGoFuel (fuel - 1)) defName) dName) appPos) depth) dtb__508), ((((((v_injectDictGoFuel (fuel - 1)) defName) dName) appPos) depth) dtb__509)))
  | _ -> t
)))
# 1406 "Vuna/Compiler/Elab/Trait.vuna"
and v_injectAltGoFuel = (fun (fuel : int) (defName : string) (dName : string) (appPos : int) (depth : int) (alt : Core_dTerm.t_CaseAlt) -> (if (fuel <= 0) then alt else (match alt with
  | { Core_dTerm.f_CaseAlt_caseAltName = dtb__510; Core_dTerm.f_CaseAlt_caseAltBinders = dtb__511; Core_dTerm.f_CaseAlt_caseAltBody = dtb__512 } -> { Core_dTerm.f_CaseAlt_caseAltName = dtb__510; Core_dTerm.f_CaseAlt_caseAltBinders = dtb__511; Core_dTerm.f_CaseAlt_caseAltBody = ((((((v_injectDictGoFuel (fuel - 1)) defName) dName) appPos) (depth + (B_dData_dList.v_length dtb__511))) dtb__512) }
  | _ -> failwith "DT: impossible branch"
)))
# 1422 "Vuna/Compiler/Elab/Trait.vuna"
and v_rewriteTaggedSpineFuel = (fun (fuel : int) (defName : string) (dName : string) (appPos : int) (depth : int) (g : string) (args : (Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (if (fuel <= 0) then (Core_dTerm.C_Term_TGlobal (g)) else (let args2 = ((B_dData_dList.v_map (fun (p : (Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair) -> { B_dData_dPair.f_Pair_first = ((((((v_injectDictGoFuel (fuel - 1)) defName) dName) appPos) depth) (B_dData_dPair.v_firstOf (Obj.magic p))); B_dData_dPair.f_Pair_second = (B_dData_dPair.v_secondOf (Obj.magic p)) })) args) in (if (if (if (g = defName) then ((B_dData_dList.v_length args2) > appPos) else false) then (depth > appPos) else false) then ((Elab_dMeta.v_foldAppTerms (Core_dTerm.C_Term_TGlobal (g))) (((v_insertArgAt appPos) { B_dData_dPair.f_Pair_first = (Core_dTerm.C_Term_TVar (dName, ((depth - appPos) - 1), { Base_dSource.f_Span_spanFile = ""; Base_dSource.f_Span_spanStartLine = 0; Base_dSource.f_Span_spanStartCol = 0; Base_dSource.f_Span_spanEndLine = 0; Base_dSource.f_Span_spanEndCol = 0; Base_dSource.f_Span_spanStartOffset = 0; Base_dSource.f_Span_spanEndOffset = 0 })); B_dData_dPair.f_Pair_second = Core_dTerm.C_Rig_RigOmega }) args2)) else ((Elab_dMeta.v_foldAppTerms (Core_dTerm.C_Term_TGlobal (g))) args2)))))

# 1355 "Vuna/Compiler/Elab/Trait.vuna"
let v_injectDictGo = (fun (defName : string) (dName : string) (appPos : int) (depth : int) (t : Core_dTerm.t_Term) -> ((((((v_injectDictGoFuel (v_injectBudgetFor t)) defName) dName) appPos) depth) t))

# 1352 "Vuna/Compiler/Elab/Trait.vuna"
let v_insertDictCalls = (fun (defName : string) (dName : string) (appPos : int) (t : Core_dTerm.t_Term) -> (((((v_injectDictGo defName) dName) appPos) 0) t))

# 1326 "Vuna/Compiler/Elab/Trait.vuna"
let rec v_insertPlannedCalls = (fun (mc0 : string) (mc1 : t_DictPlan B_dData_dList.t_List) (mc2 : Core_dTerm.t_Term) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__513, dtb__514) -> (match dtb__513 with
  | { f_DictPlan_dpName = dtb__515; f_DictPlan_dpLevel = dtb__516; f_DictPlan_dpDom = dtb__517; f_DictPlan_dpMetas = dtb__518 } -> (((v_insertPlannedCalls mc0) dtb__514) ((((v_insertDictCalls mc0) dtb__515) dtb__516) mc2))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> mc2
  | _ -> failwith "DT: impossible branch"
))

# 1332 "Vuna/Compiler/Elab/Trait.vuna"
let v_liftFreeDictGoals = (fun (defName : string) (minCid : int) (ec : Elab_dTypes.t_Ec) (ty : Core_dTerm.t_Term) (body : Core_dTerm.t_Term) -> (match (Elab_dTypes.v_ecPendingList ec) with
  | B_dData_dList.C_List_Nil -> { B_dData_dPair.f_Pair_first = ty; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = body; B_dData_dPair.f_Pair_second = ec } }
  | _ -> (let anchor = (v_dictAnchor ty) in (let planned = (((v_planDictBinders anchor) ec) ((v_freeDictGoals minCid) ec)) in (let plans = (B_dData_dPair.v_firstOf planned) in (let outerFirst = (B_dData_dList.v_reverse plans) in (let ty2 = (((v_insertDictPis anchor) outerFirst) ty) in (let body1 = (((v_insertDictLams anchor) outerFirst) body) in (let body2 = ((v_substPlannedMetas plans) body1) in (let body3 = (((v_insertPlannedCalls defName) outerFirst) body2) in { B_dData_dPair.f_Pair_first = ty2; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = body3; B_dData_dPair.f_Pair_second = (B_dData_dPair.v_secondOf planned) } }))))))))
))

# 1402 "Vuna/Compiler/Elab/Trait.vuna"
let v_injectAltGo = (fun (defName : string) (dName : string) (appPos : int) (depth : int) (alt : Core_dTerm.t_CaseAlt) -> ((((((v_injectAltGoFuel (v_altBudgetFor alt)) defName) dName) appPos) depth) alt))

# 1414 "Vuna/Compiler/Elab/Trait.vuna"
let v_rewriteTaggedSpine = (fun (defName : string) (dName : string) (appPos : int) (depth : int) (g : string) (args : (Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (((((((v_rewriteTaggedSpineFuel (64 + (4 * (v_spineSize args)))) defName) dName) appPos) depth) g) args))

# 1435 "Vuna/Compiler/Elab/Trait.vuna"
let[@tail_mod_cons] rec v_replaceGlobalType = (fun (mc0 : string) (mc1 : Core_dTerm.t_Term) (mc2 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__519, dtb__520) -> (if ((B_dData_dPair.v_firstOf dtb__519) = mc0) then (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = mc0; B_dData_dPair.f_Pair_second = mc1 }, dtb__520)) else (B_dData_dList.C_List__x58__x58_ (dtb__519, (((v_replaceGlobalType mc0) mc1) dtb__520))))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 1441 "Vuna/Compiler/Elab/Trait.vuna"
let rec v_foldlAddInst = (fun (mc0 : Elab_dTypes.t_Ec) (mc1 : Elab_dTypes.t_DtInst B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__521, dtb__522) -> ((v_foldlAddInst ((Elab_dTypes.v_ecAddInst mc0) dtb__521)) dtb__522)
  | B_dData_dList.C_List_Nil -> mc0
  | _ -> failwith "DT: impossible branch"
))

# 1528 "Vuna/Compiler/Elab/Trait.vuna"
let v_defBodyOf = (fun (defs : (string, Core_dTerm.t_Term) B_dContainer_dHashMap.t_HashMap) (name : string) -> (match ((Core_dTerm.v_defLookup name) defs) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__523) -> (Base_dDiag.C_Check_OkC (dtb__523))
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.v_icInternal ("instance body missing for " ^ name))
  | _ -> failwith "DT: impossible branch"
))

# 1538 "Vuna/Compiler/Elab/Trait.vuna"
let rec v_elabTraitsGo = (fun (mc0 : (Frontend_dAst.t_Decl, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc1 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc2 : Elab_dTypes.t_Ec) (mc3 : Elab_dTypes.t_DtData B_dData_dList.t_List) (mc4 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc5 : Elab_dTypes.t_DtClass B_dData_dList.t_List) (mc6 : (string, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__524, dtb__525) -> ((Base_dCommon.v_bind (((v_elabTrait mc1) mc2) dtb__524)) (fun (p : (Elab_dTypes.t_DtData, ((string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List, (Elab_dTypes.t_DtClass, ((string, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let nd_uscrut11 = p in (match nd_uscrut11 with
  | { B_dData_dPair.f_Pair_first = dtb__526; B_dData_dPair.f_Pair_second = dtb__527 } -> (match dtb__527 with
  | { B_dData_dPair.f_Pair_first = dtb__528; B_dData_dPair.f_Pair_second = dtb__529 } -> (match dtb__529 with
  | { B_dData_dPair.f_Pair_first = dtb__530; B_dData_dPair.f_Pair_second = dtb__531 } -> (match dtb__531 with
  | { B_dData_dPair.f_Pair_first = dtb__532; B_dData_dPair.f_Pair_second = dtb__533 } -> (((((((v_elabTraitsGo dtb__525) ((B_dData_dList.v_append mc1) dtb__528)) dtb__533) (B_dData_dList.C_List__x58__x58_ (dtb__526, mc3))) ((B_dData_dList.v_append dtb__528) mc4)) (B_dData_dList.C_List__x58__x58_ (dtb__530, mc5))) ((B_dData_dList.v_append dtb__532) mc6))
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

# 1535 "Vuna/Compiler/Elab/Trait.vuna"
let v_elabTraits = (fun (decls : (Frontend_dAst.t_Decl, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ec : Elab_dTypes.t_Ec) -> (((((((v_elabTraitsGo decls) globals) ec) B_dData_dList.C_List_Nil) B_dData_dList.C_List_Nil) B_dData_dList.C_List_Nil) B_dData_dList.C_List_Nil))

# 1579 "Vuna/Compiler/Elab/Trait.vuna"
let rec v_spanOfName = (fun (mc0 : string) (mc1 : (string, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__534, dtb__535) -> (match dtb__534 with
  | { B_dData_dPair.f_Pair_first = dtb__536; B_dData_dPair.f_Pair_second = dtb__537 } -> (if (dtb__536 = mc0) then (B_dData_dMaybe.C_Maybe_Just (dtb__537)) else ((v_spanOfName mc0) dtb__535))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 1583 "Vuna/Compiler/Elab/Trait.vuna"
let v_defTypeOfTbl = (fun (tbl : (string, Core_dTerm.t_Term) B_dContainer_dHashMap.t_HashMap) (name : string) -> (match ((((B_dContainer_dHashMap.v_lookup B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) name) tbl) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__538) -> (Base_dDiag.C_Check_OkC (dtb__538))
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.v_icInternal ("generated definition has no type: " ^ name))
  | _ -> failwith "DT: impossible branch"
))

# 1521 "Vuna/Compiler/Elab/Trait.vuna"
let rec v_instanceDefsGo = (fun (mc0 : Elab_dTypes.t_Ec) (mc1 : Base_dSource.t_Span B_dData_dMaybe.t_Maybe) (mc2 : (string, Core_dTerm.t_Term) B_dContainer_dHashMap.t_HashMap) (mc3 : (string, Core_dTerm.t_Term) B_dContainer_dHashMap.t_HashMap) (mc4 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc5 : Elab_dTypes.t_DtDef B_dData_dList.t_List) -> (match mc4 with
  | B_dData_dList.C_List__x58__x58_ (dtb__539, dtb__540) -> ((Base_dCommon.v_bind ((v_defTypeOfTbl mc2) (B_dData_dPair.v_firstOf dtb__539))) (fun (ty : Core_dTerm.t_Term) -> ((Base_dCommon.v_bind ((v_defBodyOf mc3) (B_dData_dPair.v_firstOf dtb__539))) (fun (body : Core_dTerm.t_Term) -> ((((((v_instanceDefsGo mc0) mc1) mc2) mc3) dtb__540) (B_dData_dList.C_List__x58__x58_ ((Elab_dTypes.C_DtDef_DtDef ((B_dData_dPair.v_firstOf dtb__539), ty, ((Elab_dDict.v_substDictTerm mc0) body), mc1)), mc5)))))))
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC ((B_dData_dList.v_reverse mc5)))
  | _ -> failwith "DT: impossible branch"
))

# 1517 "Vuna/Compiler/Elab/Trait.vuna"
let v_instanceDefsOf = (fun (ecBefore : Elab_dTypes.t_Ec) (ecAfter : Elab_dTypes.t_Ec) (srcSpan : Base_dSource.t_Span B_dData_dMaybe.t_Maybe) (gs : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) -> ((((((v_instanceDefsGo ecAfter) srcSpan) (((B_dContainer_dHashMap.v_fromList B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) gs)) (Elab_dTypes.v_ecDefTbl ecAfter)) gs) B_dData_dList.C_List_Nil))

# 1569 "Vuna/Compiler/Elab/Trait.vuna"
let rec v_extraDefsGo = (fun (mc0 : (string, Core_dTerm.t_Term) B_dContainer_dHashMap.t_HashMap) (mc1 : (string, bool) B_dContainer_dHashMap.t_HashMap) (mc2 : (string, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc3 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc4 : Elab_dTypes.t_DtDef B_dData_dList.t_List) -> (match mc3 with
  | B_dData_dList.C_List__x58__x58_ (dtb__541, dtb__542) -> (if ((((B_dContainer_dHashMap.v_member B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) (B_dData_dPair.v_firstOf dtb__541)) mc1) then (((((v_extraDefsGo mc0) mc1) mc2) dtb__542) mc4) else ((Base_dCommon.v_bind ((v_defTypeOfTbl mc0) (B_dData_dPair.v_firstOf dtb__541))) (fun (ty : Core_dTerm.t_Term) -> (((((v_extraDefsGo mc0) mc1) mc2) dtb__542) (B_dData_dList.C_List__x58__x58_ ((Elab_dTypes.C_DtDef_DtDef ((B_dData_dPair.v_firstOf dtb__541), ty, (B_dData_dPair.v_secondOf dtb__541), ((v_spanOfName (B_dData_dPair.v_firstOf dtb__541)) mc2))), mc4))))))
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC ((B_dData_dList.v_reverse mc4)))
  | _ -> failwith "DT: impossible branch"
))

# 1565 "Vuna/Compiler/Elab/Trait.vuna"
let v_extraDefsOf = (fun (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ec : Elab_dTypes.t_Ec) (srcSpans : (string, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List) (sourceDefs : Elab_dTypes.t_DtDef B_dData_dList.t_List) -> (((((v_extraDefsGo (Elab_dTypes.v_ecGlobalsTbl ec)) (B_dContainer_dHashMap.v_ofNames ((B_dData_dList.v_map Elab_dTypes.v_dtDefName) sourceDefs))) srcSpans) (Elab_dTypes.v_ecDefs ec)) B_dData_dList.C_List_Nil))

# 1600 "Vuna/Compiler/Elab/Trait.vuna"
let rec v_bindDictBinderFuel = (fun (fuel : int) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (rig : Core_dTerm.t_Rig) (name : string) (dom : Core_dTerm.t_Value) (clo : Core_dTerm.t_Closure) (pats : Frontend_dAst.t_Pat B_dData_dList.t_List) (body : Frontend_dAst.t_Expr) (sp : Base_dSource.t_Span) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "binder check") else (let lvl = (Elab_dTypes.v_ctxDepth ctx) in (let v = ((Elab_dMeta.v_freshVarValue name) lvl) in (let ctx2 = (((Elab_dTypes.v_ctxBindValue name) dom) ctx) in (let expected2 = ((Core_dEval.v_applyClosure clo) v) in ((Base_dCommon.v_bind ((((((((v_checkBindersFuel (fuel - 1)) globals) ctx2) ec) pats) body) expected2) sp)) (fun (p : (Core_dTerm.t_Term, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match p with
  | { B_dData_dPair.f_Pair_first = dtb__543; B_dData_dPair.f_Pair_second = dtb__544 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Core_dTerm.C_Term_TLam (name, rig, B_dData_dMaybe.C_Maybe_Nothing, Base_dSource.v_spanEmpty, dtb__543)); B_dData_dPair.f_Pair_second = dtb__544 }))
  | _ -> failwith "DT: impossible branch"
)))))))))
# 1617 "Vuna/Compiler/Elab/Trait.vuna"
and v_bindIndexBinderFuel = (fun (fuel : int) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (rig : Core_dTerm.t_Rig) (name : string) (dom : Core_dTerm.t_Value) (clo : Core_dTerm.t_Closure) (pats : Frontend_dAst.t_Pat B_dData_dList.t_List) (body : Frontend_dAst.t_Expr) (sp : Base_dSource.t_Span) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "binder check") else (let lvl = (Elab_dTypes.v_ctxDepth ctx) in (let v = ((Elab_dMeta.v_freshVarValue name) lvl) in (let ctx2 = (((Elab_dTypes.v_ctxBindValue name) dom) ctx) in (let expected2 = ((Core_dEval.v_applyClosure clo) v) in ((Base_dCommon.v_bind ((((((((v_checkBindersFuel (fuel - 1)) globals) ctx2) ec) pats) body) expected2) sp)) (fun (p : (Core_dTerm.t_Term, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match p with
  | { B_dData_dPair.f_Pair_first = dtb__545; B_dData_dPair.f_Pair_second = dtb__546 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Core_dTerm.C_Term_TLam (name, rig, B_dData_dMaybe.C_Maybe_Nothing, Base_dSource.v_spanEmpty, dtb__545)); B_dData_dPair.f_Pair_second = dtb__546 }))
  | _ -> failwith "DT: impossible branch"
)))))))))
# 1637 "Vuna/Compiler/Elab/Trait.vuna"
and v_checkBodyAtEndFuel = (fun (fuel : int) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (body : Frontend_dAst.t_Expr) (expected : Core_dTerm.t_Value) (sp : Base_dSource.t_Span) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "binder check") else (match ((Elab_dTypes.v_forceVal ec) expected) with
  | Core_dTerm.C_Value_VPi (dtb__547, dtb__548, dtb__549, dtb__550, dtb__551) -> (if dtb__548 then (if ((Elab_dDict.v_isDictDomain ec) dtb__550) then (((((((((((v_bindDictBinderFuel (fuel - 1)) globals) ctx) ec) dtb__549) dtb__547) dtb__550) dtb__551) B_dData_dList.C_List_Nil) body) sp) else (if (((Elab_dMeta.v_isImplicitDomain ctx) ec) dtb__550) then (((((((((((v_bindIndexBinderFuel (fuel - 1)) globals) ctx) ec) dtb__549) dtb__547) dtb__550) dtb__551) B_dData_dList.C_List_Nil) body) sp) else ((Base_dDiagnostics_dTc.v_tcErr0 sp) Base_dDiagnostics_dTc.C_TcErr_ImplicitParamKind))) else ((Base_dCommon.v_bind (((((Elab_dTerm.v_checkE globals) ctx) ec) body) expected)) (fun (p : (Core_dTerm.t_Term, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> ((Base_dCommon.v_bind ((((Elab_dDict.v_resolveRowGoalsCtx globals) ctx) (B_dData_dPair.v_secondOf p)) sp)) (fun (ec2 : Elab_dTypes.t_Ec) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dPair.v_firstOf p); B_dData_dPair.f_Pair_second = ec2 })))))))
  | _ -> ((Base_dCommon.v_bind (((((Elab_dTerm.v_checkE globals) ctx) ec) body) expected)) (fun (p : (Core_dTerm.t_Term, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> ((Base_dCommon.v_bind ((((Elab_dDict.v_resolveRowGoalsCtx globals) ctx) (B_dData_dPair.v_secondOf p)) sp)) (fun (ec2 : Elab_dTypes.t_Ec) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dPair.v_firstOf p); B_dData_dPair.f_Pair_second = ec2 }))))))
)))
# 1646 "Vuna/Compiler/Elab/Trait.vuna"
and v_checkBindersFuel = (fun (mc0 : int) (mc1 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc2 : Elab_dTypes.t_Ctx) (mc3 : Elab_dTypes.t_Ec) (mc4 : Frontend_dAst.t_Pat B_dData_dList.t_List) (mc5 : Frontend_dAst.t_Expr) (mc6 : Core_dTerm.t_Value) (mc7 : Base_dSource.t_Span) -> (match mc4 with
  | B_dData_dList.C_List__x58__x58_ (dtb__552, dtb__553) -> (if (mc0 <= 0) then (Base_dDiag.v_icFuel "binder check") else (let forced = ((Elab_dTypes.v_forceVal mc3) mc6) in (match forced with
  | Core_dTerm.C_Value_VPi (dtb__554, dtb__555, dtb__556, dtb__557, dtb__558) -> (if dtb__555 then (if ((Elab_dDict.v_isDictDomain mc3) dtb__557) then (((((((((((v_bindDictBinderFuel (mc0 - 1)) mc1) mc2) mc3) dtb__556) dtb__554) dtb__557) dtb__558) (B_dData_dList.C_List__x58__x58_ (dtb__552, dtb__553))) mc5) mc7) else (if (((Elab_dMeta.v_isImplicitDomain mc2) mc3) dtb__557) then (((((((((((v_bindIndexBinderFuel (mc0 - 1)) mc1) mc2) mc3) dtb__556) dtb__554) dtb__557) dtb__558) (B_dData_dList.C_List__x58__x58_ (dtb__552, dtb__553))) mc5) mc7) else ((Base_dDiagnostics_dTc.v_tcErr0 mc7) Base_dDiagnostics_dTc.C_TcErr_ImplicitParamKind))) else (match dtb__552 with
  | Frontend_dAst.C_Pat_PVar (dtb__559, dtb__560) -> ((((((((((((v_bindOnePatternFuel (mc0 - 1)) mc1) mc2) mc3) dtb__556) dtb__559) dtb__553) mc5) dtb__557) dtb__558) ((Base_dSource.v_spanAtName dtb__559) (Frontend_dAst.v_nodeRefSpan dtb__560))) mc7)
  | Frontend_dAst.C_Pat_PWild (dtb__561) -> ((((((((((((v_bindOnePatternFuel (mc0 - 1)) mc1) mc2) mc3) dtb__556) "_") dtb__553) mc5) dtb__557) dtb__558) (Frontend_dAst.v_nodeRefSpan dtb__561)) mc7)
  | _ -> ((Base_dDiagnostics_dTc.v_tcErr0 (Frontend_dAst.v_patSpan dtb__552)) Base_dDiagnostics_dTc.C_TcErr_DefParamsMustBeVars)
))
  | _ -> ((Base_dDiagnostics_dTc.v_tcErr0 mc7) Base_dDiagnostics_dTc.C_TcErr_DefMoreParams)
)))
  | B_dData_dList.C_List_Nil -> (if (mc0 <= 0) then (Base_dDiag.v_icFuel "binder check") else (let forced = ((Elab_dTypes.v_forceVal mc3) mc6) in (match forced with
  | Core_dTerm.C_Value_VPi (dtb__562, dtb__563, dtb__564, dtb__565, dtb__566) -> (if dtb__563 then (if ((Elab_dDict.v_isDictDomain mc3) dtb__565) then (((((((((((v_bindDictBinderFuel (mc0 - 1)) mc1) mc2) mc3) dtb__564) dtb__562) dtb__565) dtb__566) B_dData_dList.C_List_Nil) mc5) mc7) else (if (((Elab_dMeta.v_isImplicitDomain mc2) mc3) dtb__565) then (((((((((((v_bindIndexBinderFuel (mc0 - 1)) mc1) mc2) mc3) dtb__564) dtb__562) dtb__565) dtb__566) B_dData_dList.C_List_Nil) mc5) mc7) else ((Base_dDiagnostics_dTc.v_tcErr0 mc7) Base_dDiagnostics_dTc.C_TcErr_ImplicitParamKind))) else ((Base_dCommon.v_bind ((Base_dObs.v_obsCheck "vuna.elab.term.body") (fun (_u : int) -> (((((((v_checkBodyAtEndFuel (mc0 - 1)) mc1) mc2) mc3) mc5) mc6) mc7)))) (fun (p : (Core_dTerm.t_Term, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> ((Base_dCommon.v_bind ((Base_dObs.v_obsCheck "vuna.elab.term.goals") (fun (_u : int) -> ((((Elab_dDict.v_resolveRowGoalsCtx mc1) mc2) (B_dData_dPair.v_secondOf p)) mc7)))) (fun (ec2 : Elab_dTypes.t_Ec) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dPair.v_firstOf p); B_dData_dPair.f_Pair_second = ec2 })))))))
  | _ -> ((Base_dCommon.v_bind ((Base_dObs.v_obsCheck "vuna.elab.term.body") (fun (_u : int) -> (((((Elab_dTerm.v_checkE mc1) mc2) mc3) mc5) mc6)))) (fun (p : (Core_dTerm.t_Term, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> ((Base_dCommon.v_bind ((Base_dObs.v_obsCheck "vuna.elab.term.goals") (fun (_u : int) -> ((((Elab_dDict.v_resolveRowGoalsCtx mc1) mc2) (B_dData_dPair.v_secondOf p)) mc7)))) (fun (ec2 : Elab_dTypes.t_Ec) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dPair.v_firstOf p); B_dData_dPair.f_Pair_second = ec2 }))))))
)))
  | _ -> failwith "DT: impossible branch"
))
# 1673 "Vuna/Compiler/Elab/Trait.vuna"
and v_bindOnePatternFuel = (fun (fuel : int) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (rig : Core_dTerm.t_Rig) (pname : string) (pats : Frontend_dAst.t_Pat B_dData_dList.t_List) (body : Frontend_dAst.t_Expr) (dom : Core_dTerm.t_Value) (clo : Core_dTerm.t_Closure) (binderSp : Base_dSource.t_Span) (sp : Base_dSource.t_Span) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "binder check") else (let lvl = (Elab_dTypes.v_ctxDepth ctx) in (let v = ((Elab_dMeta.v_freshVarValue pname) lvl) in (let ctx2 = (((Elab_dTypes.v_ctxBindValue pname) dom) ctx) in ((Base_dCommon.v_bind (((((Elab_dMeta.v_rigForLinearDomain ec) sp) pname) rig) dom)) (fun (erasure : Core_dTerm.t_Rig) -> ((Base_dCommon.v_bind ((((((((v_checkBindersFuel (fuel - 1)) globals) ctx2) ec) pats) body) ((Core_dEval.v_applyClosure clo) v)) sp)) (fun (p : (Core_dTerm.t_Term, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match p with
  | { B_dData_dPair.f_Pair_first = dtb__567; B_dData_dPair.f_Pair_second = dtb__568 } -> (let inner2 = (if ((((Elab_dMeta.v_opaqueRuntimeBinder dtb__568) ctx) erasure) dom) then ((Elab_dMeta.v_wrapOpaqueUses (B_dData_dList.C_List__x58__x58_ (0, B_dData_dList.C_List_Nil))) dtb__567) else dtb__567) in (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Core_dTerm.C_Term_TLam (pname, erasure, B_dData_dMaybe.C_Maybe_Nothing, binderSp, inner2)); B_dData_dPair.f_Pair_second = dtb__568 })))
  | _ -> failwith "DT: impossible branch"
))))))))))

# 1743 "Vuna/Compiler/Elab/Trait.vuna"
let v_checkBinders = (fun (a1 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (a2 : Elab_dTypes.t_Ctx) (a3 : Elab_dTypes.t_Ec) (a4 : Frontend_dAst.t_Pat B_dData_dList.t_List) (a5 : Frontend_dAst.t_Expr) (a6 : Core_dTerm.t_Value) (a7 : Base_dSource.t_Span) -> ((((((((v_checkBindersFuel 512) a1) a2) a3) a4) a5) a6) a7))

# 1592 "Vuna/Compiler/Elab/Trait.vuna"
let v_checkDefIn = (fun (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx0 : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (pats : Frontend_dAst.t_Pat B_dData_dList.t_List) (body : Frontend_dAst.t_Expr) (expected : Core_dTerm.t_Value) (sp : Base_dSource.t_Span) -> (((((((v_checkBinders globals) ctx0) ec) pats) body) expected) sp))

# 1596 "Vuna/Compiler/Elab/Trait.vuna"
let v_checkDef = (fun (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ec : Elab_dTypes.t_Ec) (pats : Frontend_dAst.t_Pat B_dData_dList.t_List) (body : Frontend_dAst.t_Expr) (expected : Core_dTerm.t_Value) (sp : Base_dSource.t_Span) -> (((((((v_checkDefIn globals) Elab_dTypes.v_emptyCtx) ec) pats) body) expected) sp))

# 1715 "Vuna/Compiler/Elab/Trait.vuna"
let v_elabFunDefMulti = (fun (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx0 : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (clauses : (Frontend_dAst.t_Pat B_dData_dList.t_List, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (expected : Core_dTerm.t_Value) (sp : Base_dSource.t_Span) -> (let _u = (if ((dtp_log_on 3) "Vuna.Compiler.Elab.Trait") then (((dtp_log_emit 3) "Vuna.Compiler.Elab.Trait") "MULTI") else 0) in ((Base_dCommon.v_bind ((Base_dObs.v_obsCheck "vuna.elab.pats") (fun (_u : int) -> ((((Elab_dTerm.v_resolveOverFunPats ec) ctx0) expected) clauses)))) (fun (r : ((Frontend_dAst.t_Pat B_dData_dList.t_List, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match r with
  | { B_dData_dPair.f_Pair_first = dtb__569; B_dData_dPair.f_Pair_second = dtb__570 } -> (let table = (Elab_dMeta.v_ctorFamilyTable dtb__570) in (let reachCheck = (if ((Elab_dMatch.v_needsReachOracle table) dtb__569) then ((Base_dObs.v_obsCheck "vuna.elab.pats") (fun (_u : int) -> (((Elab_dCase.v_firstColumnCover dtb__570) ctx0) expected))) else (Base_dDiag.C_Check_OkC (B_dData_dMaybe.C_Maybe_Nothing))) in ((Base_dCommon.v_bind reachCheck) (fun (reach : ((string, int) B_dData_dPair.t_Pair B_dData_dList.t_List, string B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dMaybe.t_Maybe) -> ((Base_dCommon.v_bind ((Base_dObs.v_obsCheck "vuna.elab.pats") (fun (_u : int) -> (((Elab_dMatch.v_multiToExprWith reach) table) dtb__569)))) (fun (bodyExpr : Frontend_dAst.t_Expr) -> (let _u = (if ((dtp_log_on 3) "Vuna.Compiler.Elab.Trait") then (((dtp_log_emit 3) "Vuna.Compiler.Elab.Trait") "CHECKDEF") else 0) in (let checked = ((Base_dObs.v_obsCheck "vuna.elab.term") (fun (_u : int) -> (((((((v_checkDefIn globals) ctx0) dtb__570) B_dData_dList.C_List_Nil) bodyExpr) expected) sp))) in ((Base_dObs.v_obsCheck "vuna.elab.coverage") (fun (_u : int) -> ((((Elab_dCoverage.v_improveExhaustive table) (fun (_u : int) -> (Elab_dMatch.v_matrixOf dtb__569))) (Elab_dMatch.v_firstPatSpan dtb__569)) checked)))))))))))
  | _ -> failwith "DT: impossible branch"
)))))

# 1701 "Vuna/Compiler/Elab/Trait.vuna"
let v_elabFunDefIn = (fun (mc0 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc1 : Elab_dTypes.t_Ctx) (mc2 : Elab_dTypes.t_Ec) (mc3 : (Frontend_dAst.t_Pat B_dData_dList.t_List, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc4 : Core_dTerm.t_Value) (mc5 : Base_dSource.t_Span) -> (match mc3 with
  | B_dData_dList.C_List__x58__x58_ (dtb__571, dtb__572) -> (match dtb__571 with
  | { B_dData_dPair.f_Pair_first = dtb__573; B_dData_dPair.f_Pair_second = dtb__574 } -> (match dtb__572 with
  | B_dData_dList.C_List_Nil -> (if (Elab_dMatch.v_allVarPats dtb__573) then ((Base_dObs.v_obsCheck "vuna.elab.term") (fun (_u : int) -> (((((((v_checkDefIn mc0) mc1) mc2) dtb__573) dtb__574) mc4) mc5))) else ((((((v_elabFunDefMulti mc0) mc1) mc2) (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__573; B_dData_dPair.f_Pair_second = dtb__574 }, B_dData_dList.C_List_Nil))) mc4) mc5))
  | _ -> ((((((v_elabFunDefMulti mc0) mc1) mc2) mc3) mc4) mc5)
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> ((Base_dDiagnostics_dTc.v_tcErr0 mc5) Base_dDiagnostics_dTc.C_TcErr_FunctionNoClauses)
  | _ -> failwith "DT: impossible branch"
))

# 1004 "Vuna/Compiler/Elab/Trait.vuna"
let v_elabInstanceMethodIn = (fun (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (mty : Core_dTerm.t_Term) (clauses : (Frontend_dAst.t_Pat B_dData_dList.t_List, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> ((((((v_elabFunDefIn globals) ctx) ec) clauses) ((Elab_dTypes.v_evalCtx ctx) mty)) (v_clauseSpanOf clauses)))

# 965 "Vuna/Compiler/Elab/Trait.vuna"
let rec v_elabInstanceMethodsGo = (fun (mc0 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc1 : Elab_dTypes.t_Ctx) (mc2 : int) (mc3 : Elab_dTypes.t_Ec) (mc4 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc5 : Core_dTerm.t_Term B_dData_dList.t_List) (mc6 : Frontend_dAst.t_Decl B_dData_dList.t_List) (mc7 : Core_dTerm.t_Term B_dData_dList.t_List) (mc8 : (Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc9 : Base_dSource.t_Span) -> (match mc4 with
  | B_dData_dList.C_List__x58__x58_ (dtb__575, dtb__576) -> (match dtb__575 with
  | { B_dData_dPair.f_Pair_first = dtb__577; B_dData_dPair.f_Pair_second = dtb__578 } -> ((Base_dCommon.v_bind ((v_substInstParams mc5) dtb__578)) (fun (instTy0 : Core_dTerm.t_Term) -> (let clauses = ((v_methodClausesNamed dtb__577) mc6) in (let instTy = (((Core_dTerm.v_shift 0) mc2) instTy0) in (match clauses with
  | B_dData_dList.C_List_Nil -> (Obj.magic ((Base_dDiagnostics_dTc.v_tcErr0 mc9) Base_dDiagnostics_dTc.C_TcErr_InstanceMissingMethod))
  | _ -> ((Base_dCommon.v_bind (((((v_elabInstanceMethodIn mc0) mc1) mc3) instTy) clauses)) (fun (p : (Core_dTerm.t_Term, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match p with
  | { B_dData_dPair.f_Pair_first = dtb__579; B_dData_dPair.f_Pair_second = dtb__580 } -> ((((((((((v_elabInstanceMethodsGo mc0) mc1) mc2) dtb__580) dtb__576) mc5) mc6) (B_dData_dList.C_List__x58__x58_ (dtb__579, mc7))) (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__579; B_dData_dPair.f_Pair_second = Core_dTerm.C_Rig_RigOmega }, mc8))) mc9)
  | _ -> failwith "DT: impossible branch"
)))
)))))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.v_reverse mc7); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = (B_dData_dList.v_reverse mc8); B_dData_dPair.f_Pair_second = mc3 } }))
  | _ -> failwith "DT: impossible branch"
))

# 878 "Vuna/Compiler/Elab/Trait.vuna"
let v_elabInstanceMethodsCtx = (fun (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (cls : Elab_dTypes.t_DtClass) (ctx : Elab_dTypes.t_Ctx) (nCtx : int) (headArgs : Core_dTerm.t_Term B_dData_dList.t_List) (ec : Elab_dTypes.t_Ec) (methods : Frontend_dAst.t_Decl B_dData_dList.t_List) (sp : Base_dSource.t_Span) -> ((((((((((v_elabInstanceMethodsGo globals) ctx) nCtx) ec) (v_zipClassFields cls)) headArgs) methods) B_dData_dList.C_List_Nil) B_dData_dList.C_List_Nil) sp))

# 1008 "Vuna/Compiler/Elab/Trait.vuna"
let v_elabInstanceMethod = (fun (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ec : Elab_dTypes.t_Ec) (mty : Core_dTerm.t_Term) (clauses : (Frontend_dAst.t_Pat B_dData_dList.t_List, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (((((v_elabInstanceMethodIn globals) Elab_dTypes.v_emptyCtx) ec) mty) clauses))

# 1740 "Vuna/Compiler/Elab/Trait.vuna"
let v_elabFunDef = (fun (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ec : Elab_dTypes.t_Ec) (clauses : (Frontend_dAst.t_Pat B_dData_dList.t_List, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (expected : Core_dTerm.t_Value) (sp : Base_dSource.t_Span) -> ((((((v_elabFunDefIn globals) Elab_dTypes.v_emptyCtx) ec) clauses) expected) sp))

# 1746 "Vuna/Compiler/Elab/Trait.vuna"
let v_bindIndexBinder = (fun (a1 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (a2 : Elab_dTypes.t_Ctx) (a3 : Elab_dTypes.t_Ec) (a4 : Core_dTerm.t_Rig) (a5 : string) (a6 : Core_dTerm.t_Value) (a7 : Core_dTerm.t_Closure) (a8 : Frontend_dAst.t_Pat B_dData_dList.t_List) (a9 : Frontend_dAst.t_Expr) (a10 : Base_dSource.t_Span) -> (((((((((((v_bindIndexBinderFuel 512) a1) a2) a3) a4) a5) a6) a7) a8) a9) a10))

# 1750 "Vuna/Compiler/Elab/Trait.vuna"
let v_bindOnePattern = (fun (a1 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (a2 : Elab_dTypes.t_Ctx) (a3 : Elab_dTypes.t_Ec) (a4 : Core_dTerm.t_Rig) (a5 : string) (a6 : Frontend_dAst.t_Pat B_dData_dList.t_List) (a7 : Frontend_dAst.t_Expr) (a8 : Core_dTerm.t_Value) (a9 : Core_dTerm.t_Closure) (a10 : Base_dSource.t_Span) (a11 : Base_dSource.t_Span) -> ((((((((((((v_bindOnePatternFuel 512) a1) a2) a3) a4) a5) a6) a7) a8) a9) a10) a11))

# 451 "Vuna/Compiler/Elab/Trait.vuna"
let v_instSigClass = (fun (p : t_InstSigInfo) -> (match p with
  | { f_InstSigInfo_instSigClass = dtb__581; f_InstSigInfo_instSigTele = dtb__582; f_InstSigInfo_instSigCtx = dtb__583; f_InstSigInfo_instSigArgs = dtb__584; f_InstSigInfo_instSigHead = dtb__585 } -> dtb__581
  | _ -> failwith "DT: impossible branch"
))

# 452 "Vuna/Compiler/Elab/Trait.vuna"
let v_instSigTele = (fun (p : t_InstSigInfo) -> (match p with
  | { f_InstSigInfo_instSigClass = dtb__586; f_InstSigInfo_instSigTele = dtb__587; f_InstSigInfo_instSigCtx = dtb__588; f_InstSigInfo_instSigArgs = dtb__589; f_InstSigInfo_instSigHead = dtb__590 } -> dtb__587
  | _ -> failwith "DT: impossible branch"
))

# 453 "Vuna/Compiler/Elab/Trait.vuna"
let v_instSigCtx = (fun (p : t_InstSigInfo) -> (match p with
  | { f_InstSigInfo_instSigClass = dtb__591; f_InstSigInfo_instSigTele = dtb__592; f_InstSigInfo_instSigCtx = dtb__593; f_InstSigInfo_instSigArgs = dtb__594; f_InstSigInfo_instSigHead = dtb__595 } -> dtb__593
  | _ -> failwith "DT: impossible branch"
))

# 714 "Vuna/Compiler/Elab/Trait.vuna"
let v_instBodyCtx = (fun (info : t_InstSigInfo) -> (((v_instBodyCtxGo (v_instanceTeleCtx (v_instSigTele info))) (v_instSigCtx info)) 0))

# 726 "Vuna/Compiler/Elab/Trait.vuna"
let v_instValueOf = (fun (info : t_InstSigInfo) (ctor : string) (fields : Core_dTerm.t_Term B_dData_dList.t_List) -> ((v_instTeleLam (((v_instCtxLam (Core_dTerm.C_Term_TCon (ctor, ((B_dData_dList.v_map (fun (t : Core_dTerm.t_Term) -> { B_dData_dPair.f_Pair_first = (Obj.magic t); B_dData_dPair.f_Pair_second = Core_dTerm.C_Rig_RigOmega })) fields)))) (B_dData_dList.v_length (v_instSigCtx info))) 0)) (v_instSigTele info)))

# 454 "Vuna/Compiler/Elab/Trait.vuna"
let v_instSigArgs = (fun (p : t_InstSigInfo) -> (match p with
  | { f_InstSigInfo_instSigClass = dtb__596; f_InstSigInfo_instSigTele = dtb__597; f_InstSigInfo_instSigCtx = dtb__598; f_InstSigInfo_instSigArgs = dtb__599; f_InstSigInfo_instSigHead = dtb__600 } -> dtb__599
  | _ -> failwith "DT: impossible branch"
))

# 455 "Vuna/Compiler/Elab/Trait.vuna"
let v_instSigHead = (fun (p : t_InstSigInfo) -> (match p with
  | { f_InstSigInfo_instSigClass = dtb__601; f_InstSigInfo_instSigTele = dtb__602; f_InstSigInfo_instSigCtx = dtb__603; f_InstSigInfo_instSigArgs = dtb__604; f_InstSigInfo_instSigHead = dtb__605 } -> dtb__605
  | _ -> failwith "DT: impossible branch"
))

# 747 "Vuna/Compiler/Elab/Trait.vuna"
let v_instTypeOf = (fun (info : t_InstSigInfo) -> (let nCtx = (B_dData_dList.v_length (v_instSigCtx info)) in (let body0 = (((Core_dTerm.v_shift 0) nCtx) (v_instSigHead info)) in (let body1 = (((v_instTypeCtx body0) (B_dData_dList.v_reverse (v_instSigCtx info))) (nCtx - 1)) in ((v_instTypeTele body1) (v_instSigTele info))))))

# 359 "Vuna/Compiler/Elab/Trait.vuna"
let v_elabInstanceWithClassGo = (fun (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (allDecls : (Frontend_dAst.t_Decl, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List) (cls : Elab_dTypes.t_DtClass) (info : t_InstSigInfo) (ec0 : Elab_dTypes.t_Ec) (headExpr : Frontend_dAst.t_Expr) (methods : Frontend_dAst.t_Decl B_dData_dList.t_List) (msp : Base_dSource.t_Span) -> (match ((v_firstUnknownInstanceMethod cls) methods) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__606) -> (((Base_dDiagnostics_dTc.v_tcErr1 msp) (Base_dDiagnostics_dTc.C_TcErr_InstanceUnknownMethod (dtb__606))) dtb__606)
  | B_dData_dMaybe.C_Maybe_Nothing -> (match ((v_firstMissingInstanceMethod cls) methods) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__607) -> (match (((v_traitMethodSpanOf cls) dtb__607) allDecls) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__608) -> ((Base_dDiagnostics_dTc.v_tcErr0 dtb__608) Base_dDiagnostics_dTc.C_TcErr_InstanceMissingMethod)
  | B_dData_dMaybe.C_Maybe_Nothing -> ((Base_dDiagnostics_dTc.v_tcErr0 msp) Base_dDiagnostics_dTc.C_TcErr_InstanceMissingMethod)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> (let bodyCtx = (v_instBodyCtx info) in (let nCtx = (B_dData_dList.v_length (v_instSigCtx info)) in (let nTele = (B_dData_dList.v_length (v_instSigTele info)) in (let bodyDepth = (bi_natAdd nTele nCtx) in (let iname = ((Elab_dInstName.v_instanceName (Elab_dTypes.v_dtClassName cls)) headExpr) in (let isym = ((Elab_dInstName.v_instanceSymbol (Elab_dTypes.v_dtClassName cls)) headExpr) in ((Base_dCommon.v_bind ((((((((v_checkSuperClasses globals) bodyCtx) nCtx) iname) msp) (v_instSigArgs info)) (cls).Elab_dTypes.f_DtClass_dtClassSupers) ec0)) (fun (ecSuper : Elab_dTypes.t_Ec) -> ((Base_dCommon.v_bind ((((((((v_elabInstanceMethodsCtx globals) cls) bodyCtx) nCtx) (v_instSigArgs info)) ecSuper) methods) msp)) (fun (q : (Core_dTerm.t_Term B_dData_dList.t_List, ((Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let fieldTerms = (B_dData_dPair.v_firstOf q) in (let ec1 = (B_dData_dPair.v_secondOf (B_dData_dPair.v_secondOf q)) in (let solvedCtx = (((((v_solveCtxGoals bodyCtx) nCtx) nTele) ec1) B_dData_dList.C_List_Nil) in (let ctxSubs = (B_dData_dPair.v_firstOf solvedCtx) in (let ec2 = (B_dData_dPair.v_secondOf solvedCtx) in (let fields1 = ((B_dData_dList.v_map ((v_applyCtxSubstsTo nTele) ctxSubs)) fieldTerms) in ((Base_dCommon.v_bind (((((((v_resolveRigidGoals globals) bodyCtx) msp) (Elab_dTypes.v_ecNextConstraintId ec0)) (Elab_dTypes.v_ecPendingList ec2)) B_dData_dList.C_List_Nil) ec2)) (fun (r : ((int, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (let globSubs = (B_dData_dPair.v_firstOf r) in (let ec3 = (B_dData_dPair.v_secondOf r) in (let fields2 = ((B_dData_dList.v_map ((v_applyTermSubstsTo bodyDepth) globSubs)) fields1) in (let dictTerm = (((v_instValueOf info) (Elab_dMeta.v_dictCtorName (Elab_dTypes.v_dtClassName cls))) fields2) in (let dictTyTerm = (v_instTypeOf info) in (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = isym; B_dData_dPair.f_Pair_second = dictTyTerm }, B_dData_dList.C_List_Nil)); B_dData_dPair.f_Pair_second = ((Elab_dTypes.v_ecAddDef ec3) { B_dData_dPair.f_Pair_first = isym; B_dData_dPair.f_Pair_second = dictTerm }) })))))))))))))))))))))))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 353 "Vuna/Compiler/Elab/Trait.vuna"
let v_elabInstanceWithClass = (fun (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (allDecls : (Frontend_dAst.t_Decl, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List) (cls : Elab_dTypes.t_DtClass) (info : t_InstSigInfo) (ec0 : Elab_dTypes.t_Ec) (headExpr : Frontend_dAst.t_Expr) (methods : Frontend_dAst.t_Decl B_dData_dList.t_List) (msp : Base_dSource.t_Span) -> (let nd_uscrut8 = ((v_firstDuplicateInstanceMethod cls) methods) in (match nd_uscrut8 with
  | B_dData_dMaybe.C_Maybe_Nothing -> ((((((((v_elabInstanceWithClassGo globals) allDecls) cls) info) ec0) headExpr) methods) msp)
  | B_dData_dMaybe.C_Maybe_Just (dtb__609) -> (match dtb__609 with
  | { B_dData_dPair.f_Pair_first = dtb__610; B_dData_dPair.f_Pair_second = dtb__611 } -> (((Base_dDiagnostics_dTc.v_tcErr1 dtb__611) (Base_dDiagnostics_dTc.C_TcErr_InstanceDuplicateMethod (dtb__610))) dtb__610)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))

# 410 "Vuna/Compiler/Elab/Trait.vuna"
let v_elabInstance = (fun (mc0 : (Frontend_dAst.t_Decl, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc1 : (Frontend_dAst.t_Decl, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc2 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc3 : Elab_dTypes.t_DtClass B_dData_dList.t_List) (mc4 : Elab_dTypes.t_DtData B_dData_dList.t_List) (mc5 : Elab_dTypes.t_Ec) (mc6 : (Frontend_dAst.t_Decl, Base_dSource.t_Span) B_dData_dPair.t_Pair) -> (match mc6 with
  | { B_dData_dPair.f_Pair_first = dtb__612; B_dData_dPair.f_Pair_second = dtb__613 } -> (match dtb__612 with
  | Frontend_dAst.C_Decl_DInstance (dtb__614, dtb__615, dtb__616, dtb__617) -> ((Base_dCommon.v_bind ((Base_dDiag.v_onErrDiag (Base_dDiag.v_withFallbackSpan (Frontend_dAst.v_nodeRefSpan dtb__617))) (((((((v_elabInstanceSig mc3) mc2) (Elab_dSig.v_definedNames ((B_dData_dList.v_map B_dData_dPair.v_firstOf) mc0))) mc5) (Frontend_dAst.v_nodeRefSpan dtb__617)) dtb__615) dtb__614))) (fun (p : (t_InstSigInfo, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match p with
  | { B_dData_dPair.f_Pair_first = dtb__618; B_dData_dPair.f_Pair_second = dtb__619 } -> (match ((Elab_dDict.v_findClass (v_instSigClass dtb__618)) mc3) with
  | B_dData_dMaybe.C_Maybe_Nothing -> (Obj.magic ((Base_dDiagnostics_dTc.v_tcErr0 (Frontend_dAst.v_nodeRefSpan dtb__617)) Base_dDiagnostics_dTc.C_TcErr_InstanceHeadNotApp))
  | B_dData_dMaybe.C_Maybe_Just (dtb__620) -> (if ((((v_instanceLandingOk mc1) (Frontend_dAst.v_nodeRefSpan dtb__617)) dtb__620) dtb__615) then ((((((((v_elabInstanceWithClass mc2) mc1) dtb__620) dtb__618) dtb__619) dtb__615) dtb__616) (Frontend_dAst.v_nodeRefSpan dtb__617)) else ((Base_dDiagnostics_dTc.v_tcErr0 (Frontend_dAst.v_nodeRefSpan dtb__617)) Base_dDiagnostics_dTc.C_TcErr_OrphanInstance))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> ((Elab_dTypes.v_errAt dtb__613) "DT: internal: expected an instance declaration")
)
  | _ -> failwith "DT: impossible branch"
))

# 1452 "Vuna/Compiler/Elab/Trait.vuna"
let rec v_checkInstanceHeadsGo = (fun (mc0 : (Frontend_dAst.t_Decl, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc1 : Elab_dTypes.t_DtClass B_dData_dList.t_List) (mc2 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc3 : Elab_dTypes.t_Ec) (mc4 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc5 : Elab_dTypes.t_DtInst B_dData_dList.t_List) (mc6 : Elab_dTypes.t_DtInst B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__621, dtb__622) -> (match dtb__621 with
  | { B_dData_dPair.f_Pair_first = dtb__623; B_dData_dPair.f_Pair_second = dtb__624 } -> (match dtb__623 with
  | Frontend_dAst.C_Decl_DInstance (dtb__625, dtb__626, dtb__627, dtb__628) -> ((Base_dCommon.v_bind (((((((v_elabInstanceSig mc1) mc2) (Elab_dSig.v_definedNames ((B_dData_dList.v_map B_dData_dPair.v_firstOf) (B_dData_dList.C_List__x58__x58_ (dtb__621, dtb__622))))) mc3) (Frontend_dAst.v_nodeRefSpan dtb__628)) dtb__626) dtb__625)) (fun (p : (t_InstSigInfo, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match p with
  | { B_dData_dPair.f_Pair_first = dtb__629; B_dData_dPair.f_Pair_second = dtb__630 } -> (let iname = ((Elab_dInstName.v_instanceName (v_instSigClass dtb__629)) dtb__626) in (let isym = ((Elab_dInstName.v_instanceSymbol (v_instSigClass dtb__629)) dtb__626) in (let ikey = ((((Elab_dInstCoherence.v_instanceKey dtb__630) (v_instSigClass dtb__629)) (v_instSigTele dtb__629)) (v_instSigHead dtb__629)) in (let ty = (v_instTypeOf dtb__629) in (let inst = { Elab_dTypes.f_DtInst_dtInstName = iname; Elab_dTypes.f_DtInst_dtInstSym = isym; Elab_dTypes.f_DtInst_dtInstKey = ikey; Elab_dTypes.f_DtInst_dtInstTele = (v_instSigTele dtb__629); Elab_dTypes.f_DtInst_dtInstCtx = (v_instSigCtx dtb__629); Elab_dTypes.f_DtInst_dtInstHead = (v_instSigHead dtb__629); Elab_dTypes.f_DtInst_dtInstSpan = (B_dData_dMaybe.C_Maybe_Just ((Frontend_dAst.v_nodeRefSpan dtb__628))) } in (let nd_uscrut28 = (((((((Elab_dInstCoherence.v_findInstanceClash dtb__630) iname) isym) ikey) (v_instSigTele dtb__629)) (v_instSigHead dtb__629)) ((B_dData_dList.v_append (Elab_dTypes.v_ecInstList dtb__630)) mc6)) in (match nd_uscrut28 with
  | { B_dData_dPair.f_Pair_first = dtb__631; B_dData_dPair.f_Pair_second = dtb__632 } -> (match dtb__631 with
  | B_dData_dMaybe.C_Maybe_Nothing -> (((((((v_checkInstanceHeadsGo dtb__622) mc1) mc2) dtb__632) (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = isym; B_dData_dPair.f_Pair_second = ty }, mc4))) (B_dData_dList.C_List__x58__x58_ (inst, mc5))) (B_dData_dList.C_List__x58__x58_ (inst, mc6)))
  | B_dData_dMaybe.C_Maybe_Just (dtb__633) -> (match dtb__633 with
  | Elab_dInstCoherence.C_InstClash_ClashOverlap -> (((Base_dDiagnostics_dTc.v_tcErr1 (Frontend_dAst.v_nodeRefSpan dtb__628)) (Base_dDiagnostics_dTc.C_TcErr_OverlappingInstances (iname))) iname)
  | Elab_dInstCoherence.C_InstClash_ClashDuplicate -> (((Base_dDiagnostics_dTc.v_tcErr1 (Frontend_dAst.v_nodeRefSpan dtb__628)) (Base_dDiagnostics_dTc.C_TcErr_DuplicateInstance (iname))) iname)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))))))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> (((((((v_checkInstanceHeadsGo dtb__622) mc1) mc2) mc3) mc4) mc5) mc6)
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.v_reverse mc4); B_dData_dPair.f_Pair_second = ((v_foldlAddInst mc3) (B_dData_dList.v_reverse mc5)) }))
  | _ -> failwith "DT: impossible branch"
))

# 1449 "Vuna/Compiler/Elab/Trait.vuna"
let v_checkInstanceHeads = (fun (decls : (Frontend_dAst.t_Decl, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List) (classes : Elab_dTypes.t_DtClass B_dData_dList.t_List) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ec : Elab_dTypes.t_Ec) -> (((((((v_checkInstanceHeadsGo decls) classes) globals) ec) B_dData_dList.C_List_Nil) B_dData_dList.C_List_Nil) B_dData_dList.C_List_Nil))

# 1492 "Vuna/Compiler/Elab/Trait.vuna"
let rec v_elabInstanceBodiesGo = (fun (mc0 : bool) (mc1 : (Frontend_dAst.t_Decl, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc2 : (Frontend_dAst.t_Decl, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc3 : Elab_dTypes.t_DtClass B_dData_dList.t_List) (mc4 : Elab_dTypes.t_DtData B_dData_dList.t_List) (mc5 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc6 : Elab_dTypes.t_Ec) (mc7 : Elab_dTypes.t_DtDef B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__634, dtb__635) -> (match (((((((v_elabInstance (B_dData_dList.C_List__x58__x58_ (dtb__634, dtb__635))) mc2) mc5) mc3) mc4) mc6) dtb__634) with
  | Base_dDiag.C_Check_ErrC (dtb__636) -> (if mc0 then ((((((((v_elabInstanceBodiesGo mc0) dtb__635) mc2) mc3) mc4) mc5) ((Elab_dTypes.v_ecAddError mc6) dtb__636)) mc7) else (Base_dDiag.C_Check_ErrC (dtb__636)))
  | Base_dDiag.C_Check_OkC (dtb__637) -> (match dtb__637 with
  | { B_dData_dPair.f_Pair_first = dtb__638; B_dData_dPair.f_Pair_second = dtb__639 } -> ((Base_dCommon.v_bind ((((v_instanceDefsOf mc6) dtb__639) (B_dData_dMaybe.C_Maybe_Just ((B_dData_dPair.v_secondOf dtb__634)))) dtb__638)) (fun (newDefs : Elab_dTypes.t_DtDef B_dData_dList.t_List) -> (let ecTbl = ((Elab_dTypes.v_ecPutGlobalsTbl dtb__639) ((((B_dContainer_dHashMap.v_insertAll B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) dtb__638) (Elab_dTypes.v_ecGlobalsTbl dtb__639))) in ((((((((v_elabInstanceBodiesGo mc0) dtb__635) mc2) mc3) mc4) ((B_dData_dList.v_append mc5) dtb__638)) ecTbl) ((B_dData_dList.v_append newDefs) mc7)))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.v_reverse mc7); B_dData_dPair.f_Pair_second = mc6 }))
  | _ -> failwith "DT: impossible branch"
))

# 1480 "Vuna/Compiler/Elab/Trait.vuna"
let v_elabInstanceBodies = (fun (recover : bool) (allDecls : Frontend_dAst.t_Decl B_dData_dList.t_List) (classes : Elab_dTypes.t_DtClass B_dData_dList.t_List) (datas : Elab_dTypes.t_DtData B_dData_dList.t_List) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ec : Elab_dTypes.t_Ec) -> ((((((((v_elabInstanceBodiesGo recover) ((Elab_dMeta.v_collectInstDecls allDecls) B_dData_dList.C_List_Nil)) ((B_dData_dList.v_map (fun (d : Frontend_dAst.t_Decl) -> { B_dData_dPair.f_Pair_first = d; B_dData_dPair.f_Pair_second = (Frontend_dAst.v_declSpan d) })) allDecls)) classes) datas) globals) ec) B_dData_dList.C_List_Nil))

# 1551 "Vuna/Compiler/Elab/Trait.vuna"
let rec v_elabInstancesGo = (fun (mc0 : (Frontend_dAst.t_Decl, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc1 : Elab_dTypes.t_DtClass B_dData_dList.t_List) (mc2 : Elab_dTypes.t_DtData B_dData_dList.t_List) (mc3 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc4 : Elab_dTypes.t_Ec) (mc5 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__640, dtb__641) -> ((Base_dCommon.v_bind (((((((v_elabInstance (B_dData_dList.C_List__x58__x58_ (dtb__640, dtb__641))) B_dData_dList.C_List_Nil) mc3) mc1) mc2) mc4) dtb__640)) (fun (p : ((string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match p with
  | { B_dData_dPair.f_Pair_first = dtb__642; B_dData_dPair.f_Pair_second = dtb__643 } -> ((((((v_elabInstancesGo dtb__641) mc1) mc2) ((B_dData_dList.v_append mc3) dtb__642)) dtb__643) ((B_dData_dList.v_append dtb__642) mc5))
  | _ -> failwith "DT: impossible branch"
)))
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.v_reverse mc5); B_dData_dPair.f_Pair_second = mc4 }))
  | _ -> failwith "DT: impossible branch"
))

# 1548 "Vuna/Compiler/Elab/Trait.vuna"
let v_elabInstances = (fun (decls : (Frontend_dAst.t_Decl, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List) (classes : Elab_dTypes.t_DtClass B_dData_dList.t_List) (datas : Elab_dTypes.t_DtData B_dData_dList.t_List) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ec : Elab_dTypes.t_Ec) -> ((((((v_elabInstancesGo decls) classes) datas) globals) ec) B_dData_dList.C_List_Nil))

# 1152 "Vuna/Compiler/Elab/Trait.vuna"
let v_dictGoalGroupRep = (fun (p : t_DictGoalGroup) -> (match p with
  | { f_DictGoalGroup_dictGoalGroupRep = dtb__644; f_DictGoalGroup_dictGoalGroupDom = dtb__645; f_DictGoalGroup_dictGoalGroupExtras = dtb__646 } -> dtb__644
  | _ -> failwith "DT: impossible branch"
))

# 1153 "Vuna/Compiler/Elab/Trait.vuna"
let v_dictGoalGroupDom = (fun (p : t_DictGoalGroup) -> (match p with
  | { f_DictGoalGroup_dictGoalGroupRep = dtb__647; f_DictGoalGroup_dictGoalGroupDom = dtb__648; f_DictGoalGroup_dictGoalGroupExtras = dtb__649 } -> dtb__648
  | _ -> failwith "DT: impossible branch"
))

# 1154 "Vuna/Compiler/Elab/Trait.vuna"
let v_dictGoalGroupExtras = (fun (p : t_DictGoalGroup) -> (match p with
  | { f_DictGoalGroup_dictGoalGroupRep = dtb__650; f_DictGoalGroup_dictGoalGroupDom = dtb__651; f_DictGoalGroup_dictGoalGroupExtras = dtb__652 } -> dtb__652
  | _ -> failwith "DT: impossible branch"
))

# 1229 "Vuna/Compiler/Elab/Trait.vuna"
let v_dpName = (fun (p : t_DictPlan) -> (match p with
  | { f_DictPlan_dpName = dtb__653; f_DictPlan_dpLevel = dtb__654; f_DictPlan_dpDom = dtb__655; f_DictPlan_dpMetas = dtb__656 } -> dtb__653
  | _ -> failwith "DT: impossible branch"
))

# 1231 "Vuna/Compiler/Elab/Trait.vuna"
let v_dpLevel = (fun (p : t_DictPlan) -> (match p with
  | { f_DictPlan_dpName = dtb__657; f_DictPlan_dpLevel = dtb__658; f_DictPlan_dpDom = dtb__659; f_DictPlan_dpMetas = dtb__660 } -> dtb__658
  | _ -> failwith "DT: impossible branch"
))

# 1233 "Vuna/Compiler/Elab/Trait.vuna"
let v_dpDom = (fun (p : t_DictPlan) -> (match p with
  | { f_DictPlan_dpName = dtb__661; f_DictPlan_dpLevel = dtb__662; f_DictPlan_dpDom = dtb__663; f_DictPlan_dpMetas = dtb__664 } -> dtb__663
  | _ -> failwith "DT: impossible branch"
))

# 1235 "Vuna/Compiler/Elab/Trait.vuna"
let v_dpMetas = (fun (p : t_DictPlan) -> (match p with
  | { f_DictPlan_dpName = dtb__665; f_DictPlan_dpLevel = dtb__666; f_DictPlan_dpDom = dtb__667; f_DictPlan_dpMetas = dtb__668 } -> dtb__668
  | _ -> failwith "DT: impossible branch"
))
