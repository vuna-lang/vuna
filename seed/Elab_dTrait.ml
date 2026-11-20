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
let v_projectionParamNames = (fun (n : int) -> (if (n = 1) then (B_dData_dList.C_List__x58__x58_ ("_p", B_dData_dList.C_List_Nil)) else ((B_dData_dList.v_map (fun (i : int) -> ("_p" ^ ((B_dTrait_dInterp.v_interp (B_dTrait_dInterp.v_Interp_ua B_dData_dInt.v_Show_uInt)) i)))) ((B_dData_dList.v_range 0) n))))

# 223 "Vuna/Compiler/Elab/Trait.vuna"
let v_projectionBodyOpaque = (fun (fieldOpaque : bool) (ctor : string) (fieldIdx : int) (rigs : Core_dTerm.t_Rig B_dData_dList.t_List) (nFields : int) (nParams : int) -> (let arity = (B_dData_dList.v_length rigs) in (let dictIdx = arity in (let fieldVar = (Core_dTerm.C_Term_TVar ((Elab_dMeta.v_fieldVarName fieldIdx), ((nFields - 1) - fieldIdx), { Base_dSource.f_Span_spanFile = ""; Base_dSource.f_Span_spanStartLine = 0; Base_dSource.f_Span_spanStartCol = 0; Base_dSource.f_Span_spanEndLine = 0; Base_dSource.f_Span_spanEndCol = 0; Base_dSource.f_Span_spanStartOffset = 0; Base_dSource.f_Span_spanEndOffset = 0 })) in (let argPairs = ((Elab_dMeta.v_methodArgTerms rigs) nFields) in (let applied0 = ((Elab_dMeta.v_foldAppTerms fieldVar) argPairs) in (let applied = (if fieldOpaque then ((Elab_dMeta.v_wrapOpaqueUses (B_dData_dList.C_List__x58__x58_ (((nFields - 1) - fieldIdx), B_dData_dList.C_List_Nil))) applied0) else applied0) in (let binders = (Core_dTerm.v_bindersOfPairs (Elab_dMeta.v_fieldBinderNames nFields)) in (let alt = { Core_dTerm.f_CaseAlt_caseAltName = ctor; Core_dTerm.f_CaseAlt_caseAltBinders = binders; Core_dTerm.f_CaseAlt_caseAltBody = applied } in (let caseTerm = (Core_dTerm.C_Term_TCase ((Core_dTerm.C_Term_TVar ("_d", dictIdx, { Base_dSource.f_Span_spanFile = ""; Base_dSource.f_Span_spanStartLine = 0; Base_dSource.f_Span_spanStartCol = 0; Base_dSource.f_Span_spanEndLine = 0; Base_dSource.f_Span_spanEndCol = 0; Base_dSource.f_Span_spanStartOffset = 0; Base_dSource.f_Span_spanEndOffset = 0 })), (B_dData_dList.C_List__x58__x58_ (alt, B_dData_dList.C_List_Nil)))) in (let lamArgs = (((Elab_dMeta.v_methodArgLams rigs) 0) caseTerm) in ((v_projectionParamLams (v_projectionParamNames nParams)) (Core_dTerm.C_Term_TLam ("_d", Core_dTerm.C_Rig_RigOmega, B_dData_dMaybe.C_Maybe_Nothing, Base_dSource.v_spanEmpty, lamArgs))))))))))))))

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
let v_instanceHeadTypeNames = (fun (headExpr : Frontend_dRast.t_Expr) -> (let nd_uscrut1 = (v_instanceHeadParts headExpr) in (match nd_uscrut1 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__105) -> (match dtb__105 with
  | { B_dData_dPair.f_Pair_first = dtb__106; B_dData_dPair.f_Pair_second = dtb__107 } -> (v_headTypeNamesOf dtb__107)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
)))

# 329 "Vuna/Compiler/Elab/Trait.vuna"
let v_instanceLandingOk = (fun (allDecls : (Frontend_dRast.t_Decl, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List) (sp : Base_dSource.t_Span) (cls : Elab_dTypes.t_DtClass) (headExpr : Frontend_dRast.t_Expr) -> (let file = (sp).Base_dSource.f_Span_spanFile in (let headNames = (v_instanceHeadTypeNames headExpr) in (if (if (((v_declNamedInFile allDecls) (Elab_dTypes.v_dtClassName cls)) file) then true else (((v_anyDeclInFile allDecls) headNames) file)) then true else (v_anyGlobalHead headNames)))))

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
  | B_dData_dMaybe.C_Maybe_Nothing -> (let nd_uscrut7 = ((Elab_dTypes.v_newMeta Elab_dTypes.v_emptyCtx) mc2) in (match nd_uscrut7 with
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
))
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
  | B_dData_dMaybe.C_Maybe_Just (dtb__197) -> (let q = ((Core_dEval.v_quote 0) dtb__197) in (if ((Core_dTerm.v_hasFreeTermVar 0) q) then ((v_fallbackTeleKind mc0) mc1) else q))
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
let v_instTypeOf = (fun (info : t_InstSigInfo) -> (let nCtx = (B_dData_dList.v_length (v_instSigCtx info)) in (let body0 = (((Core_dTerm.v_shift 0) nCtx) (v_instSigHead info)) in (let body1 = (((v_instTypeCtx body0) (B_dData_dList.v_reverse (v_instSigCtx info))) (nCtx - 1)) in ((v_instTypeTele body1) (v_instSigTele info))))))

# 767 "Vuna/Compiler/Elab/Trait.vuna"
let v_canonicalMethodShort = (fun (name : string) -> (if ((Elab_dMeta.v_baseNameOf name) = "eq") then "==" else (if ((Elab_dMeta.v_baseNameOf name) = "neq") then "/=" else (if ((Elab_dMeta.v_baseNameOf name) = "lt") then "<" else (if ((Elab_dMeta.v_baseNameOf name) = "le") then "<=" else (if ((Elab_dMeta.v_baseNameOf name) = "gt") then ">" else (if ((Elab_dMeta.v_baseNameOf name) = "ge") then ">=" else (if ((Elab_dMeta.v_baseNameOf name) = "add") then "+" else (if ((Elab_dMeta.v_baseNameOf name) = "sub") then "-" else (if ((Elab_dMeta.v_baseNameOf name) = "mul") then "*" else (if ((Elab_dMeta.v_baseNameOf name) = "div") then "/" else (if ((Elab_dMeta.v_baseNameOf name) = "bind") then ">>=" else (let other = (Elab_dMeta.v_baseNameOf name) in other)))))))))))))

# 783 "Vuna/Compiler/Elab/Trait.vuna"
let v_sameMethodShort = (fun (a : string) (b : string) -> ((v_canonicalMethodShort a) = (v_canonicalMethodShort b)))

# 786 "Vuna/Compiler/Elab/Trait.vuna"
let rec v_anySameMethod = (fun (mc0 : string) (mc1 : string B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__234, dtb__235) -> (if ((v_sameMethodShort mc0) dtb__234) then true else ((v_anySameMethod mc0) dtb__235))
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 794 "Vuna/Compiler/Elab/Trait.vuna"
let rec v_firstUnknownInstanceMethodGo = (fun (mc0 : string B_dData_dList.t_List) (mc1 : Frontend_dRast.t_Decl B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__236, dtb__237) -> (match dtb__236 with
  | Frontend_dRast.C_Decl_DFun (dtb__238, dtb__239, dtb__240, dtb__241) -> (if ((v_anySameMethod (Elab_dMeta.v_baseNameOf dtb__238)) mc0) then ((v_firstUnknownInstanceMethodGo mc0) dtb__237) else (B_dData_dMaybe.C_Maybe_Just (dtb__238)))
  | _ -> ((v_firstUnknownInstanceMethodGo mc0) dtb__237)
)
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 790 "Vuna/Compiler/Elab/Trait.vuna"
let v_firstUnknownInstanceMethod = (fun (cls : Elab_dTypes.t_DtClass) (methods : Frontend_dRast.t_Decl B_dData_dList.t_List) -> ((v_firstUnknownInstanceMethodGo ((B_dData_dList.v_map (fun (m : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair) -> (Elab_dMeta.v_baseNameOf (B_dData_dPair.v_firstOf m)))) (cls).Elab_dTypes.f_DtClass_dtClassMethods)) methods))

# 815 "Vuna/Compiler/Elab/Trait.vuna"
let rec v_hasMethodClauses = (fun (mc0 : string) (mc1 : Frontend_dRast.t_Decl B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__242, dtb__243) -> (match dtb__242 with
  | Frontend_dRast.C_Decl_DFun (dtb__244, dtb__245, dtb__246, dtb__247) -> (if ((v_sameMethodShort dtb__244) mc0) then true else ((v_hasMethodClauses mc0) dtb__243))
  | _ -> ((v_hasMethodClauses mc0) dtb__243)
)
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 807 "Vuna/Compiler/Elab/Trait.vuna"
let rec v_firstMissingInstanceMethodGo = (fun (mc0 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc1 : Frontend_dRast.t_Decl B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__248, dtb__249) -> (if ((v_hasMethodClauses (Elab_dMeta.v_baseNameOf (B_dData_dPair.v_firstOf dtb__248))) mc1) then ((v_firstMissingInstanceMethodGo dtb__249) mc1) else (B_dData_dMaybe.C_Maybe_Just ((B_dData_dPair.v_firstOf dtb__248))))
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 804 "Vuna/Compiler/Elab/Trait.vuna"
let v_firstMissingInstanceMethod = (fun (cls : Elab_dTypes.t_DtClass) (methods : Frontend_dRast.t_Decl B_dData_dList.t_List) -> ((v_firstMissingInstanceMethodGo (cls).Elab_dTypes.f_DtClass_dtClassMethods) methods))

# 826 "Vuna/Compiler/Elab/Trait.vuna"
let rec v_findTraitDecl = (fun (mc0 : string) (mc1 : (Frontend_dRast.t_Decl, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__250, dtb__251) -> (match dtb__250 with
  | { B_dData_dPair.f_Pair_first = dtb__252; B_dData_dPair.f_Pair_second = dtb__253 } -> (match dtb__252 with
  | Frontend_dRast.C_Decl_DTrait (dtb__254, dtb__255, dtb__256, dtb__257, dtb__258) -> (if (dtb__254 = mc0) then (B_dData_dMaybe.C_Maybe_Just (dtb__252)) else ((v_findTraitDecl mc0) dtb__251))
  | _ -> ((v_findTraitDecl mc0) dtb__251)
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 834 "Vuna/Compiler/Elab/Trait.vuna"
let rec v_findTraitMethodSpan = (fun (mc0 : string) (mc1 : Frontend_dRast.t_TraitMethod B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__259, dtb__260) -> (if ((Frontend_dRast.v_traitMethodName dtb__259) = mc0) then (B_dData_dMaybe.C_Maybe_Just ((Frontend_dRast.v_traitMethodSpan dtb__259))) else ((v_findTraitMethodSpan mc0) dtb__260))
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 839 "Vuna/Compiler/Elab/Trait.vuna"
let v_traitMethodSpanOf = (fun (cls : Elab_dTypes.t_DtClass) (mname : string) (decls : (Frontend_dRast.t_Decl, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (let nd_uscrut3 = ((v_findTraitDecl (Elab_dTypes.v_dtClassName cls)) decls) in (match nd_uscrut3 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__261) -> (match dtb__261 with
  | Frontend_dRast.C_Decl_DTrait (dtb__262, dtb__263, dtb__264, dtb__265, dtb__266) -> ((v_findTraitMethodSpan mname) dtb__265)
  | _ -> ((B_dData_dList.v_lookupPair mname) (cls).Elab_dTypes.f_DtClass_dtClassMethodSpans)
)
  | _ -> ((B_dData_dList.v_lookupPair mname) (cls).Elab_dTypes.f_DtClass_dtClassMethodSpans)
)))

# 846 "Vuna/Compiler/Elab/Trait.vuna"
let v_ctorResultType = (fun (cls : Elab_dTypes.t_DtClass) (args : Core_dTerm.t_Term B_dData_dList.t_List) -> ((Elab_dMeta.v_foldAppTerms (Core_dTerm.C_Term_TGlobal ((Elab_dMeta.v_dictTypeName (Elab_dTypes.v_dtClassName cls))))) ((B_dData_dList.v_map (fun (a : Core_dTerm.t_Term) -> { B_dData_dPair.f_Pair_first = a; B_dData_dPair.f_Pair_second = Core_dTerm.C_Rig_Rig0 })) args)))

# 688 "Vuna/Compiler/Elab/Trait.vuna"
let rec v_elabConstraintDomains = (fun (mc0 : Elab_dTypes.t_DtClass B_dData_dList.t_List) (mc1 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc2 : Elab_dTypes.t_Ctx) (mc3 : (string, Frontend_dRast.t_Expr B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc4 : Base_dSource.t_Span) (mc5 : Elab_dTypes.t_Ec) -> (match mc3 with
  | B_dData_dList.C_List__x58__x58_ (dtb__267, dtb__268) -> (match dtb__267 with
  | { B_dData_dPair.f_Pair_first = dtb__269; B_dData_dPair.f_Pair_second = dtb__270 } -> (match ((Elab_dDict.v_findClass dtb__269) mc0) with
  | B_dData_dMaybe.C_Maybe_Nothing -> (((Base_dDiagnostics_dTc.v_tcErr1 mc4) (Base_dDiagnostics_dTc.C_TcErr_UnknownInterface (dtb__269))) dtb__269)
  | B_dData_dMaybe.C_Maybe_Just (dtb__271) -> (match ((Elab_dDict.v_dictArgKinds mc5) (Core_dTerm.C_Value_VNeutral ((Core_dTerm.C_Neutral_NGlobal ((Elab_dMeta.v_dictTypeName (Elab_dTypes.v_dtClassName dtb__271)), B_dData_dList.C_List_Nil))))) with
  | B_dData_dMaybe.C_Maybe_Nothing -> ((Base_dDiagnostics_dTc.v_tcErr0 mc4) Base_dDiagnostics_dTc.C_TcErr_ConstraintNotDict)
  | B_dData_dMaybe.C_Maybe_Just (dtb__272) -> (let _u = (if (dtp_debug_on 0) then (dtp_debug_line (String.concat "" ["constraint-dom: "; dtb__269; " args="; (bi_strFromInt (B_dData_dList.v_length dtb__270)); " kinds="; (bi_strFromInt (B_dData_dList.v_length dtb__272))])) else 0) in (if ((B_dData_dList.v_length dtb__272) <> (B_dData_dList.v_length dtb__270)) then ((Base_dDiagnostics_dTc.v_tcErr0 mc4) Base_dDiagnostics_dTc.C_TcErr_ConstraintNotDict) else ((Base_dCommon.v_bind ((((((v_checkArgsAtKinds mc1) mc2) mc5) dtb__270) dtb__272) mc4)) (fun (q : (Core_dTerm.t_Term B_dData_dList.t_List, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match q with
  | { B_dData_dPair.f_Pair_first = dtb__273; B_dData_dPair.f_Pair_second = dtb__274 } -> ((Base_dCommon.v_bind ((((((v_elabConstraintDomains mc0) mc1) mc2) dtb__268) mc4) dtb__274)) (fun (r : (Core_dTerm.t_Term B_dData_dList.t_List, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match r with
  | { B_dData_dPair.f_Pair_first = dtb__275; B_dData_dPair.f_Pair_second = dtb__276 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ (((v_ctorResultType dtb__271) dtb__273), dtb__275)); B_dData_dPair.f_Pair_second = dtb__276 }))
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
  | { B_dData_dPair.f_Pair_first = dtb__277; B_dData_dPair.f_Pair_second = dtb__278 } -> (let nFields = (B_dData_dList.v_length fieldTys) in (let dname = (Elab_dMeta.v_dictTypeName tname) in (let cname = (Elab_dMeta.v_dictCtorName tname) in (let dapp = ((v_dictAppTermOf dname) paramNames) in (let ctorTy = ((v_foldParamPis paramsKinds) ((v_foldPiFieldTys fieldTys) dapp)) in (let tele = (Elab_dMeta.v_teleOfType ctorTy) in (let dd = { Elab_dTypes.f_DtData_dtDataName = dname; Elab_dTypes.f_DtData_dtDataParams = tele; Elab_dTypes.f_DtData_dtDataCtors = (B_dData_dList.C_List__x58__x58_ ({ Elab_dTypes.f_DtCtor_dtCtorName = cname; Elab_dTypes.f_DtCtor_dtCtorFamily = dname; Elab_dTypes.f_DtCtor_dtCtorTelescope = tele; Elab_dTypes.f_DtCtor_dtCtorType = ctorTy; Elab_dTypes.f_DtCtor_dtCtorSpan = B_dData_dMaybe.C_Maybe_Nothing }, B_dData_dList.C_List_Nil)); Elab_dTypes.f_DtData_dtDataKind = ((v_foldParamPis paramsKinds) (Core_dTerm.C_Term_TType (Core_dTerm.v_levelZero))); Elab_dTypes.f_DtData_dtDataViaClasses = B_dData_dList.C_List_Nil; Elab_dTypes.f_DtData_dtDataLinear = false; Elab_dTypes.f_DtData_dtDataRepr = Frontend_dAst.C_ReprTier_ReprAuto; Elab_dTypes.f_DtData_dtDataFields = B_dData_dList.C_List_Nil; Elab_dTypes.f_DtData_dtDataIsRecord = false } in (let projs = (((((v_methodProjections tname) paramNames) pKinds) methodsP) fieldTys) in (let projSpans = ((B_dData_dList.v_map (fun (m : Frontend_dRast.t_TraitMethod) -> { B_dData_dPair.f_Pair_first = (Frontend_dRast.v_traitMethodName m); B_dData_dPair.f_Pair_second = (Frontend_dRast.v_traitMethodSpan m) })) methods) in (let fieldCtx = ((v_bindClassParams paramsKinds) Elab_dTypes.v_emptyCtx) in (let opaqueFields = ((B_dData_dList.v_map (fun (t : Core_dTerm.t_Term) -> (if (((Elab_dMeta.v_isOpaqueRuntimeTyIn dtb__278) fieldCtx) ((Core_dEval.v_eval (Elab_dTypes.v_ctxEnv fieldCtx)) t)) then true else (Elab_dMeta.v_valueHasImplicitPi ((Core_dEval.v_eval (Elab_dTypes.v_ctxEnv fieldCtx)) t))))) fieldTys) in (let projBodies = ((((((v_projectionDefsOpaque opaqueFields) tname) (B_dData_dList.v_length paramNames)) methodsP) fieldTys) nFields) in (let cls = { Elab_dTypes.f_DtClass_dtClassName = tname; Elab_dTypes.f_DtClass_dtClassParams = paramNames; Elab_dTypes.f_DtClass_dtClassSupers = dtb__277; Elab_dTypes.f_DtClass_dtClassMethods = projs; Elab_dTypes.f_DtClass_dtClassFieldTys = fieldTys; Elab_dTypes.f_DtClass_dtClassMethodSpans = projSpans } in (let ec2 = ((Elab_dTypes.v_ecAddClass ((Elab_dTypes.v_ecAddData dtb__278) dd)) cls) in (let ec3 = ((v_foldlAddDef ec2) projBodies) in (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dd; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = projs; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = cls; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = projSpans; B_dData_dPair.f_Pair_second = ec3 } } } })))))))))))))))))
  | _ -> failwith "DT: impossible branch"
))))))

# 87 "Vuna/Compiler/Elab/Trait.vuna"
let v_elabTraitKinds = (fun (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ec : Elab_dTypes.t_Ec) (tname : string) (params : Frontend_dRast.t_TraitParam B_dData_dList.t_List) (supers : Frontend_dRast.t_Expr B_dData_dList.t_List) (methods : Frontend_dRast.t_TraitMethod B_dData_dList.t_List) (methodsP : (string, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (pKinds : Core_dTerm.t_Term B_dData_dList.t_List) (sp : Base_dSource.t_Span) -> (let paramNames = (v_traitParamNames params) in (let paramsKinds = ((B_dData_dList.v_zip paramNames) pKinds) in ((Base_dCommon.v_bind ((v_constraintPartsOf sp) supers)) (fun (superParts : (string, Frontend_dRast.t_Expr B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) -> ((Base_dCommon.v_bind ((((v_classFieldTys globals) ec) paramsKinds) methodsP)) (fun (p : (Core_dTerm.t_Term B_dData_dList.t_List, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> ((((((((((v_elabTraitFinal globals) (B_dData_dPair.v_secondOf p)) tname) paramNames) superParts) methods) methodsP) pKinds) (B_dData_dPair.v_firstOf p)) sp))))))))

# 73 "Vuna/Compiler/Elab/Trait.vuna"
let v_elabTrait = (fun (mc0 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc1 : Elab_dTypes.t_Ec) (mc2 : (Frontend_dRast.t_Decl, Base_dSource.t_Span) B_dData_dPair.t_Pair) -> (match mc2 with
  | { B_dData_dPair.f_Pair_first = dtb__279; B_dData_dPair.f_Pair_second = dtb__280 } -> (match dtb__279 with
  | Frontend_dRast.C_Decl_DTrait (dtb__281, dtb__282, dtb__283, dtb__284, dtb__285) -> (if ((B_dData_dList.v_length dtb__282) = 0) then ((Base_dDiagnostics_dTc.v_tcErr0 dtb__285) Base_dDiagnostics_dTc.C_TcErr_InterfaceNoParam) else (let methodsP = (v_traitMethodPairs dtb__284) in ((Base_dCommon.v_bind ((((v_traitParamKinds mc0) mc1) dtb__282) methodsP)) (fun (pk : (Core_dTerm.t_Term B_dData_dList.t_List, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (((((((((v_elabTraitKinds mc0) (B_dData_dPair.v_secondOf pk)) dtb__281) dtb__282) dtb__283) dtb__284) methodsP) (B_dData_dPair.v_firstOf pk)) dtb__285)))))
  | _ -> ((Elab_dTypes.v_errAt dtb__280) "DT: internal: expected a trait declaration")
)
  | _ -> failwith "DT: impossible branch"
))

# 498 "Vuna/Compiler/Elab/Trait.vuna"
let v_elabInstanceConstrained = (fun (classes : Elab_dTypes.t_DtClass B_dData_dList.t_List) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (defined : string B_dData_dList.t_List) (ec0 : Elab_dTypes.t_Ec) (sp : Base_dSource.t_Span) (cls : Elab_dTypes.t_DtClass) (argExprs : Frontend_dRast.t_Expr B_dData_dList.t_List) (ctxParts : (string, Frontend_dRast.t_Expr B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (let ctxArgs = ((B_dData_dList.v_concatMap (fun (p : (string, Frontend_dRast.t_Expr B_dData_dList.t_List) B_dData_dPair.t_Pair) -> (B_dData_dPair.v_secondOf p))) ctxParts) in (let banned = (Elab_dSig.v_topQuantBanned defined) in (let combined = (Frontend_dRast.C_Expr_EApp ((Frontend_dRast.C_Expr_EVar ((Frontend_dRast_dName.v_classifyName "#inst"), sp)), ((B_dData_dList.v_append argExprs) ctxArgs), sp)) in (let kindMaybe = ((Elab_dDict.v_dictArgKinds ec0) (Core_dTerm.C_Value_VNeutral ((Core_dTerm.C_Neutral_NGlobal ((Elab_dMeta.v_dictTypeName (Elab_dTypes.v_dtClassName cls)), B_dData_dList.C_List_Nil))))) in (match kindMaybe with
  | B_dData_dMaybe.C_Maybe_Nothing -> ((Base_dDiagnostics_dTc.v_tcErr0 sp) Base_dDiagnostics_dTc.C_TcErr_InstanceHeadNotApp)
  | B_dData_dMaybe.C_Maybe_Just (dtb__286) -> (if ((B_dData_dList.v_length dtb__286) <> (B_dData_dList.v_length argExprs)) then ((Base_dDiagnostics_dTc.v_tcErr0 sp) Base_dDiagnostics_dTc.C_TcErr_InstanceHeadNotApp) else (let seeds = ((B_dData_dList.v_append ((v_bareTeleSeeds argExprs) dtb__286)) (((v_ctxBareTeleSeeds classes) ec0) ctxParts)) in (let init = (((((v_instanceTeleMetas banned) combined) ((B_dData_dList.v_append argExprs) ctxArgs)) seeds) ec0) in (let tele0 = (B_dData_dPair.v_firstOf init) in (let ec1 = (B_dData_dPair.v_secondOf init) in (let teleCtx0 = (v_instanceTeleCtx tele0) in ((Base_dCommon.v_bind ((((((v_checkArgsAtKinds globals) teleCtx0) ec1) argExprs) dtb__286) sp)) (fun (q : (Core_dTerm.t_Term B_dData_dList.t_List, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match q with
  | { B_dData_dPair.f_Pair_first = dtb__287; B_dData_dPair.f_Pair_second = dtb__288 } -> ((Base_dCommon.v_bind ((((((v_elabConstraintDomains classes) globals) teleCtx0) ctxParts) sp) dtb__288)) (fun (r : (Core_dTerm.t_Term B_dData_dList.t_List, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match r with
  | { B_dData_dPair.f_Pair_first = dtb__289; B_dData_dPair.f_Pair_second = dtb__290 } -> (let tele = (((v_resolveTeleKinds combined) tele0) dtb__290) in (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = { f_InstSigInfo_instSigClass = (Elab_dTypes.v_dtClassName cls); f_InstSigInfo_instSigTele = tele; f_InstSigInfo_instSigCtx = dtb__289; f_InstSigInfo_instSigArgs = dtb__287; f_InstSigInfo_instSigHead = ((v_ctorResultType cls) dtb__287) }; B_dData_dPair.f_Pair_second = dtb__290 })))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))))))))
  | _ -> failwith "DT: impossible branch"
))))))

# 467 "Vuna/Compiler/Elab/Trait.vuna"
let v_elabInstanceSig = (fun (classes : Elab_dTypes.t_DtClass B_dData_dList.t_List) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (defined : string B_dData_dList.t_List) (ec0 : Elab_dTypes.t_Ec) (sp : Base_dSource.t_Span) (headExpr : Frontend_dRast.t_Expr) (ctxE : Frontend_dRast.t_Expr B_dData_dList.t_List) -> (match (v_instanceHeadParts headExpr) with
  | B_dData_dMaybe.C_Maybe_Nothing -> ((Base_dDiagnostics_dTc.v_tcErr0 sp) Base_dDiagnostics_dTc.C_TcErr_InstanceHeadNotApp)
  | B_dData_dMaybe.C_Maybe_Just (dtb__291) -> (match ((Elab_dDict.v_findClass (B_dData_dPair.v_firstOf dtb__291)) classes) with
  | B_dData_dMaybe.C_Maybe_Nothing -> (((Base_dDiagnostics_dTc.v_tcErr1 sp) (Base_dDiagnostics_dTc.C_TcErr_UnknownInterface ((B_dData_dPair.v_firstOf dtb__291)))) (B_dData_dPair.v_firstOf dtb__291))
  | B_dData_dMaybe.C_Maybe_Just (dtb__292) -> (match (B_dData_dPair.v_secondOf dtb__291) with
  | dtb__293 -> (if ((B_dData_dList.v_length dtb__293) <> (B_dData_dList.v_length (dtb__292).Elab_dTypes.f_DtClass_dtClassParams)) then ((Base_dDiagnostics_dTc.v_tcErr0 sp) Base_dDiagnostics_dTc.C_TcErr_InstanceHeadNotApp) else ((Base_dCommon.v_bind ((v_constraintPartsOf sp) ctxE)) (fun (ctxParts : (string, Frontend_dRast.t_Expr B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) -> ((((((((v_elabInstanceConstrained classes) globals) defined) ec0) sp) dtb__292) dtb__293) ctxParts))))
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 862 "Vuna/Compiler/Elab/Trait.vuna"
let rec v_zipMethodFields = (fun (mc0 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc1 : Core_dTerm.t_Term B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__294, dtb__295) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__296, dtb__297) -> (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = (B_dData_dPair.v_firstOf dtb__294); B_dData_dPair.f_Pair_second = dtb__296 }, ((v_zipMethodFields dtb__295) dtb__297)))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 859 "Vuna/Compiler/Elab/Trait.vuna"
let v_zipClassFields = (fun (cls : Elab_dTypes.t_DtClass) -> ((v_zipMethodFields (cls).Elab_dTypes.f_DtClass_dtClassMethods) (cls).Elab_dTypes.f_DtClass_dtClassFieldTys))

# 919 "Vuna/Compiler/Elab/Trait.vuna"
let rec v_instArgAt = (fun (mc0 : int) (mc1 : Core_dTerm.t_Term B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__298, dtb__299) -> (if (mc0 <= 0) then dtb__298 else ((v_instArgAt (mc0 - 1)) dtb__299))
  | B_dData_dList.C_List_Nil -> (Core_dTerm.C_Term_TGlobal ("Int"))
  | _ -> failwith "DT: impossible branch"
))

# 874 "Vuna/Compiler/Elab/Trait.vuna"
let rec v_substInstParamsGo = (fun (mc0 : int) (mc1 : Core_dTerm.t_Term B_dData_dList.t_List) (mc2 : int) (mc3 : Core_dTerm.t_Term) -> (match mc3 with
  | Core_dTerm.C_Term_TIf (dtb__300, dtb__301, dtb__302) -> (Core_dTerm.C_Term_TIf (((((v_substInstParamsGo mc0) mc1) mc2) dtb__300), ((((v_substInstParamsGo mc0) mc1) mc2) dtb__301), ((((v_substInstParamsGo mc0) mc1) mc2) dtb__302)))
  | Core_dTerm.C_Term_TCase (dtb__303, dtb__304) -> (Core_dTerm.C_Term_TCase (((((v_substInstParamsGo mc0) mc1) mc2) dtb__303), ((B_dData_dList.v_map (fun (alt : Core_dTerm.t_CaseAlt) -> ((((v_substInstParamsAlt mc0) mc1) mc2) alt))) dtb__304)))
  | Core_dTerm.C_Term_TMk (dtb__305, dtb__306) -> (Core_dTerm.C_Term_TMk (dtb__305, ((B_dData_dList.v_map (fun (p : (Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair) -> { B_dData_dPair.f_Pair_first = ((((v_substInstParamsGo mc0) mc1) mc2) (B_dData_dPair.v_firstOf p)); B_dData_dPair.f_Pair_second = (B_dData_dPair.v_secondOf p) })) dtb__306)))
  | Core_dTerm.C_Term_TCon (dtb__307, dtb__308) -> (Core_dTerm.C_Term_TCon (dtb__307, ((B_dData_dList.v_map (fun (p : (Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair) -> { B_dData_dPair.f_Pair_first = ((((v_substInstParamsGo mc0) mc1) mc2) (B_dData_dPair.v_firstOf p)); B_dData_dPair.f_Pair_second = (B_dData_dPair.v_secondOf p) })) dtb__308)))
  | Core_dTerm.C_Term_TApp (dtb__309, dtb__310, dtb__311) -> (Core_dTerm.C_Term_TApp (((((v_substInstParamsGo mc0) mc1) mc2) dtb__309), ((((v_substInstParamsGo mc0) mc1) mc2) dtb__310), dtb__311))
  | Core_dTerm.C_Term_TLam (dtb__312, dtb__313, dtb__314, dtb__315, dtb__316) -> (let slot2 = (let nd_uscrut9 = dtb__314 in (match nd_uscrut9 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__317) -> (match dtb__317 with
  | { B_dData_dPair.f_Pair_first = dtb__318; B_dData_dPair.f_Pair_second = dtb__319 } -> ((Core_dTerm.v_lamTyOf (match dtb__318 with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb__320) -> (B_dData_dMaybe.C_Maybe_Just (((((v_substInstParamsGo mc0) mc1) mc2) dtb__320)))
  | _ -> failwith "DT: impossible branch"
)) (match dtb__319 with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb__321) -> (B_dData_dMaybe.C_Maybe_Just (((((v_substInstParamsGo mc0) mc1) (mc2 + 1)) dtb__321)))
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) in (Core_dTerm.C_Term_TLam (dtb__312, dtb__313, slot2, dtb__315, ((((v_substInstParamsGo mc0) mc1) (mc2 + 1)) dtb__316))))
  | Core_dTerm.C_Term_TPi (dtb__322, dtb__323, dtb__324, dtb__325, dtb__326) -> (Core_dTerm.C_Term_TPi (dtb__322, dtb__323, dtb__324, ((((v_substInstParamsGo mc0) mc1) mc2) dtb__325), ((((v_substInstParamsGo mc0) mc1) (mc2 + 1)) dtb__326)))
  | Core_dTerm.C_Term_TVar (dtb__327, dtb__328, dtb__329) -> (if (dtb__328 >= mc2) then (if ((dtb__328 - mc2) < mc0) then (((Core_dTerm.v_shift 0) mc2) ((v_instArgAt ((mc0 - 1) - (dtb__328 - mc2))) mc1)) else mc3) else mc3)
  | _ -> mc3
))
# 915 "Vuna/Compiler/Elab/Trait.vuna"
and v_substInstParamsAlt = (fun (mc0 : int) (mc1 : Core_dTerm.t_Term B_dData_dList.t_List) (mc2 : int) (mc3 : Core_dTerm.t_CaseAlt) -> (match mc3 with
  | { Core_dTerm.f_CaseAlt_caseAltName = dtb__330; Core_dTerm.f_CaseAlt_caseAltBinders = dtb__331; Core_dTerm.f_CaseAlt_caseAltBody = dtb__332 } -> { Core_dTerm.f_CaseAlt_caseAltName = dtb__330; Core_dTerm.f_CaseAlt_caseAltBinders = dtb__331; Core_dTerm.f_CaseAlt_caseAltBody = ((((v_substInstParamsGo mc0) mc1) (mc2 + (B_dData_dList.v_length dtb__331))) dtb__332) }
  | _ -> failwith "DT: impossible branch"
))

# 871 "Vuna/Compiler/Elab/Trait.vuna"
let v_substInstParams = (fun (args : Core_dTerm.t_Term B_dData_dList.t_List) (t : Core_dTerm.t_Term) -> ((((v_substInstParamsGo (B_dData_dList.v_length args)) args) 0) t))

# 339 "Vuna/Compiler/Elab/Trait.vuna"
let rec v_checkSuperClasses = (fun (mc0 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc1 : Elab_dTypes.t_Ctx) (mc2 : int) (mc3 : string) (mc4 : Base_dSource.t_Span) (mc5 : Core_dTerm.t_Term B_dData_dList.t_List) (mc6 : Core_dTerm.t_Term B_dData_dList.t_List) (mc7 : Elab_dTypes.t_Ec) -> (match mc6 with
  | B_dData_dList.C_List__x58__x58_ (dtb__333, dtb__334) -> (let goal = ((Elab_dTypes.v_evalCtx mc1) (((Core_dTerm.v_shift 0) mc2) ((v_substInstParams mc5) dtb__333))) in (let nd_uscrut12 = (((((Elab_dDict.v_searchInstanceIn mc0) mc1) mc7) goal) mc4) in (match nd_uscrut12 with
  | Base_dDiag.C_Check_OkC (dtb__335) -> (match dtb__335 with
  | { B_dData_dPair.f_Pair_first = dtb__336; B_dData_dPair.f_Pair_second = dtb__337 } -> ((((((((v_checkSuperClasses mc0) mc1) mc2) mc3) mc4) mc5) dtb__334) dtb__337)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dDiag.C_Check_ErrC (dtb__338) -> ((((Base_dDiagnostics_dTc.v_tcErr2 mc4) (Base_dDiagnostics_dTc.C_TcErr_SuperclassNotSatisfied (mc3, (Core_dEval.v_showValue goal)))) mc3) (Core_dEval.v_showValue goal))
  | _ -> failwith "DT: impossible branch"
)))
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (mc7))
  | _ -> failwith "DT: impossible branch"
))

# 944 "Vuna/Compiler/Elab/Trait.vuna"
let rec v_methodClausesGo = (fun (mc0 : string) (mc1 : Frontend_dRast.t_Decl B_dData_dList.t_List) (mc2 : (Frontend_dRast.t_Pat B_dData_dList.t_List, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__339, dtb__340) -> (match dtb__339 with
  | Frontend_dRast.C_Decl_DFun (dtb__341, dtb__342, dtb__343, dtb__344) -> (if ((v_sameMethodShort dtb__341) mc0) then (((v_methodClausesGo mc0) dtb__340) (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__342; B_dData_dPair.f_Pair_second = dtb__343 }, mc2))) else (((v_methodClausesGo mc0) dtb__340) mc2))
  | _ -> (((v_methodClausesGo mc0) dtb__340) mc2)
)
  | B_dData_dList.C_List_Nil -> (B_dData_dList.v_reverse mc2)
  | _ -> failwith "DT: impossible branch"
))

# 941 "Vuna/Compiler/Elab/Trait.vuna"
let v_methodClausesNamed = (fun (mname : string) (decls : Frontend_dRast.t_Decl B_dData_dList.t_List) -> (((v_methodClausesGo mname) decls) B_dData_dList.C_List_Nil))

# 1003 "Vuna/Compiler/Elab/Trait.vuna"
let v_ctxDictDomEqual = (fun (ec : Elab_dTypes.t_Ec) (depth : int) (a : Core_dTerm.t_Value) (b : Core_dTerm.t_Value) -> (match (((((Core_dConv.v_conv (Elab_dTypes.v_ecDefTbl ec)) (Elab_dTypes.v_ecSolsP ec)) depth) ((Elab_dTypes.v_forceVal ec) a)) ((Elab_dTypes.v_forceVal ec) b)) with
  | Base_dDiag.C_Check_OkC (dtb__345) -> true
  | Base_dDiag.C_Check_ErrC (dtb__346) -> false
  | _ -> failwith "DT: impossible branch"
))

# 994 "Vuna/Compiler/Elab/Trait.vuna"
let rec v_matchCtxDictIdxGo = (fun (mc0 : Elab_dTypes.t_Ctx) (mc1 : int) (mc2 : Core_dTerm.t_Value) (mc3 : Elab_dTypes.t_Ec) (mc4 : int) (mc5 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc5 with
  | B_dData_dList.C_List__x58__x58_ (dtb__347, dtb__348) -> (if (mc4 >= mc1) then B_dData_dMaybe.C_Maybe_Nothing else (match dtb__347 with
  | { B_dData_dPair.f_Pair_first = dtb__349; B_dData_dPair.f_Pair_second = dtb__350 } -> (if ((((v_ctxDictDomEqual mc3) (Elab_dTypes.v_ctxDepth mc0)) (((Elab_dTypes.v_varTypeValue mc0) mc4) dtb__350)) mc2) then (B_dData_dMaybe.C_Maybe_Just (mc4)) else ((((((v_matchCtxDictIdxGo mc0) mc1) mc2) mc3) (mc4 + 1)) dtb__348))
  | _ -> failwith "DT: impossible branch"
))
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 991 "Vuna/Compiler/Elab/Trait.vuna"
let v_matchCtxDictIdx = (fun (ctx : Elab_dTypes.t_Ctx) (nCtx : int) (dom : Core_dTerm.t_Value) (ec : Elab_dTypes.t_Ec) -> ((((((v_matchCtxDictIdxGo ctx) nCtx) dom) ec) 0) (ctx).Elab_dTypes.f_Ctx_ctxItems))

# 975 "Vuna/Compiler/Elab/Trait.vuna"
let rec v_solveCtxGoalsGo = (fun (mc0 : Elab_dTypes.t_Ctx) (mc1 : int) (mc2 : Elab_dTypes.t_Ec) (mc3 : Elab_dTypes.t_Constraint B_dData_dList.t_List) (mc4 : Elab_dTypes.t_Constraint B_dData_dList.t_List) (mc5 : (int, int) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc3 with
  | B_dData_dList.C_List__x58__x58_ (dtb__351, dtb__352) -> (match dtb__351 with
  | { Elab_dTypes.f_Constraint_conId = dtb__353; Elab_dTypes.f_Constraint_conKind = dtb__354; Elab_dTypes.f_Constraint_conMeta = dtb__355; Elab_dTypes.f_Constraint_conDom = dtb__356; Elab_dTypes.f_Constraint_conSpan = dtb__357; Elab_dTypes.f_Constraint_conDepth = dtb__358 } -> (match ((Core_dTerm.v_metaLookup dtb__355) (Elab_dTypes.v_ecSolTbl mc2)) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__359) -> ((((((v_solveCtxGoalsGo mc0) mc1) mc2) dtb__352) mc4) mc5)
  | B_dData_dMaybe.C_Maybe_Nothing -> (match ((((v_matchCtxDictIdx mc0) mc1) dtb__356) mc2) with
  | B_dData_dMaybe.C_Maybe_Nothing -> ((((((v_solveCtxGoalsGo mc0) mc1) mc2) dtb__352) (B_dData_dList.C_List__x58__x58_ (dtb__351, mc4))) mc5)
  | B_dData_dMaybe.C_Maybe_Just (dtb__360) -> (let k = ((mc1 - 1) - dtb__360) in (match ((((((Core_dConv.v_solveMeta (Elab_dTypes.v_ecDefTbl mc2)) (Elab_dTypes.v_ecSolsP mc2)) (Elab_dTypes.v_ctxDepth mc0)) dtb__355) B_dData_dList.C_List_Nil) (Core_dTerm.C_Value_VNeutral ((Core_dTerm.C_Neutral_NVar ((v_ctxDictName k), (((Elab_dTypes.v_ctxDepth mc0) - mc1) + k), B_dData_dList.C_List_Nil))))) with
  | Base_dDiag.C_Check_OkC (dtb__361) -> ((((((v_solveCtxGoalsGo mc0) mc1) ((Elab_dTypes.v_ecPutSols mc2) (Core_dTerm.v_solsList dtb__361))) dtb__352) mc4) (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__355; B_dData_dPair.f_Pair_second = k }, mc5)))
  | Base_dDiag.C_Check_ErrC (dtb__362) -> ((((((v_solveCtxGoalsGo mc0) mc1) mc2) dtb__352) mc4) mc5)
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

# 972 "Vuna/Compiler/Elab/Trait.vuna"
let v_solveCtxGoals = (fun (ctx : Elab_dTypes.t_Ctx) (nCtx : int) (nTele : int) (ec : Elab_dTypes.t_Ec) (acc : (int, int) B_dData_dPair.t_Pair B_dData_dList.t_List) -> ((((((v_solveCtxGoalsGo ctx) nCtx) ec) (Elab_dTypes.v_ecPendingList ec)) B_dData_dList.C_List_Nil) acc))

# 1012 "Vuna/Compiler/Elab/Trait.vuna"
let rec v_applyCtxSubstsTo = (fun (mc0 : int) (mc1 : (int, int) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc2 : Core_dTerm.t_Term) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__363, dtb__364) -> (match dtb__363 with
  | { B_dData_dPair.f_Pair_first = dtb__365; B_dData_dPair.f_Pair_second = dtb__366 } -> (((v_applyCtxSubstsTo mc0) dtb__364) ((((Core_dTerm.v_substMetaVar dtb__365) (v_ctxDictName dtb__366)) ((mc0 + dtb__366) + 1)) mc2))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> mc2
  | _ -> failwith "DT: impossible branch"
))

# 1023 "Vuna/Compiler/Elab/Trait.vuna"
let rec v_resolveRigidGoalsGo = (fun (mc0 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc1 : Elab_dTypes.t_Ctx) (mc2 : Base_dSource.t_Span) (mc3 : int) (mc4 : Elab_dTypes.t_Constraint B_dData_dList.t_List) (mc5 : Elab_dTypes.t_Constraint B_dData_dList.t_List) (mc6 : (int, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc7 : Elab_dTypes.t_Ec) -> (match mc4 with
  | B_dData_dList.C_List__x58__x58_ (dtb__367, dtb__368) -> (match dtb__367 with
  | { Elab_dTypes.f_Constraint_conId = dtb__369; Elab_dTypes.f_Constraint_conKind = dtb__370; Elab_dTypes.f_Constraint_conMeta = dtb__371; Elab_dTypes.f_Constraint_conDom = dtb__372; Elab_dTypes.f_Constraint_conSpan = dtb__373; Elab_dTypes.f_Constraint_conDepth = dtb__374 } -> (if (dtb__369 < mc3) then ((((((((v_resolveRigidGoalsGo mc0) mc1) mc2) mc3) dtb__368) (B_dData_dList.C_List__x58__x58_ (dtb__367, mc5))) mc6) mc7) else (if ((Elab_dDict.v_isRigidDictArg mc7) dtb__372) then (let nd_uscrut17 = (((((Elab_dDict.v_searchInstanceIn mc0) mc1) mc7) dtb__372) mc2) in (match nd_uscrut17 with
  | Base_dDiag.C_Check_OkC (dtb__375) -> (match dtb__375 with
  | { B_dData_dPair.f_Pair_first = dtb__376; B_dData_dPair.f_Pair_second = dtb__377 } -> (match ((((((Core_dConv.v_solveMeta (Elab_dTypes.v_ecDefTbl dtb__377)) (Elab_dTypes.v_ecSolsP dtb__377)) (Elab_dTypes.v_ctxDepth mc1)) dtb__371) B_dData_dList.C_List_Nil) ((Core_dEval.v_eval (Elab_dTypes.v_ctxEnv mc1)) dtb__376)) with
  | Base_dDiag.C_Check_OkC (dtb__378) -> ((((((((v_resolveRigidGoalsGo mc0) mc1) mc2) mc3) dtb__368) mc5) (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__371; B_dData_dPair.f_Pair_second = dtb__376 }, mc6))) ((Elab_dTypes.v_ecPutSols dtb__377) (Core_dTerm.v_solsList dtb__378)))
  | Base_dDiag.C_Check_ErrC (dtb__379) -> ((((((((v_resolveRigidGoalsGo mc0) mc1) mc2) mc3) dtb__368) (B_dData_dList.C_List__x58__x58_ (dtb__367, mc5))) mc6) dtb__377)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dDiag.C_Check_ErrC (dtb__380) -> (((Base_dDiagnostics_dTc.v_tcErr1 mc2) (Base_dDiagnostics_dTc.C_TcErr_InstanceContextMissing ((Core_dEval.v_showValue dtb__372)))) (Core_dEval.v_showValue dtb__372))
  | _ -> failwith "DT: impossible branch"
)) else ((((((((v_resolveRigidGoalsGo mc0) mc1) mc2) mc3) dtb__368) (B_dData_dList.C_List__x58__x58_ (dtb__367, mc5))) mc6) mc7)))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.v_reverse mc6); B_dData_dPair.f_Pair_second = ((Elab_dTypes.v_ecPutPending mc7) (B_dData_dList.v_reverse mc5)) }))
  | _ -> failwith "DT: impossible branch"
))

# 1019 "Vuna/Compiler/Elab/Trait.vuna"
let v_resolveRigidGoals = (fun (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (sp : Base_dSource.t_Span) (minCid : int) (goals : Elab_dTypes.t_Constraint B_dData_dList.t_List) (acc : (int, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ec : Elab_dTypes.t_Ec) -> ((((((((v_resolveRigidGoalsGo globals) ctx) sp) minCid) goals) B_dData_dList.C_List_Nil) acc) ec))

# 1052 "Vuna/Compiler/Elab/Trait.vuna"
let rec v_substMetaTermGo = (fun (mc0 : int) (mc1 : Core_dTerm.t_Term) (mc2 : int) (mc3 : Core_dTerm.t_Term) -> (match mc3 with
  | Core_dTerm.C_Term_TIf (dtb__381, dtb__382, dtb__383) -> (Core_dTerm.C_Term_TIf (((((v_substMetaTermGo mc0) mc1) mc2) dtb__381), ((((v_substMetaTermGo mc0) mc1) mc2) dtb__382), ((((v_substMetaTermGo mc0) mc1) mc2) dtb__383)))
  | Core_dTerm.C_Term_TCase (dtb__384, dtb__385) -> (Core_dTerm.C_Term_TCase (((((v_substMetaTermGo mc0) mc1) mc2) dtb__384), ((B_dData_dList.v_map (fun (alt : Core_dTerm.t_CaseAlt) -> ((((v_substMetaTermAlt mc0) mc1) mc2) alt))) dtb__385)))
  | Core_dTerm.C_Term_TRecord (dtb__386, dtb__387) -> (Core_dTerm.C_Term_TRecord (dtb__386, ((B_dData_dList.v_map (fun (p : (Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair) -> { B_dData_dPair.f_Pair_first = ((((v_substMetaTermGo mc0) mc1) mc2) (B_dData_dPair.v_firstOf p)); B_dData_dPair.f_Pair_second = (B_dData_dPair.v_secondOf p) })) dtb__387)))
  | Core_dTerm.C_Term_TMk (dtb__388, dtb__389) -> (Core_dTerm.C_Term_TMk (dtb__388, ((B_dData_dList.v_map (fun (p : (Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair) -> { B_dData_dPair.f_Pair_first = ((((v_substMetaTermGo mc0) mc1) mc2) (B_dData_dPair.v_firstOf p)); B_dData_dPair.f_Pair_second = (B_dData_dPair.v_secondOf p) })) dtb__389)))
  | Core_dTerm.C_Term_TCon (dtb__390, dtb__391) -> (Core_dTerm.C_Term_TCon (dtb__390, ((B_dData_dList.v_map (fun (p : (Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair) -> { B_dData_dPair.f_Pair_first = ((((v_substMetaTermGo mc0) mc1) mc2) (B_dData_dPair.v_firstOf p)); B_dData_dPair.f_Pair_second = (B_dData_dPair.v_secondOf p) })) dtb__391)))
  | Core_dTerm.C_Term_TApp (dtb__392, dtb__393, dtb__394) -> (Core_dTerm.C_Term_TApp (((((v_substMetaTermGo mc0) mc1) mc2) dtb__392), ((((v_substMetaTermGo mc0) mc1) mc2) dtb__393), dtb__394))
  | Core_dTerm.C_Term_TLam (dtb__395, dtb__396, dtb__397, dtb__398, dtb__399) -> (let slot2 = (let nd_uscrut9 = dtb__397 in (match nd_uscrut9 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__400) -> (match dtb__400 with
  | { B_dData_dPair.f_Pair_first = dtb__401; B_dData_dPair.f_Pair_second = dtb__402 } -> ((Core_dTerm.v_lamTyOf (match dtb__401 with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb__403) -> (B_dData_dMaybe.C_Maybe_Just (((((v_substMetaTermGo mc0) mc1) mc2) dtb__403)))
  | _ -> failwith "DT: impossible branch"
)) (match dtb__402 with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb__404) -> (B_dData_dMaybe.C_Maybe_Just (((((v_substMetaTermGo mc0) mc1) (mc2 + 1)) dtb__404)))
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) in (Core_dTerm.C_Term_TLam (dtb__395, dtb__396, slot2, dtb__398, ((((v_substMetaTermGo mc0) mc1) (mc2 + 1)) dtb__399))))
  | Core_dTerm.C_Term_TPi (dtb__405, dtb__406, dtb__407, dtb__408, dtb__409) -> (Core_dTerm.C_Term_TPi (dtb__405, dtb__406, dtb__407, ((((v_substMetaTermGo mc0) mc1) mc2) dtb__408), ((((v_substMetaTermGo mc0) mc1) (mc2 + 1)) dtb__409)))
  | Core_dTerm.C_Term_TMeta (dtb__410) -> (if (dtb__410 = mc0) then (((Core_dTerm.v_shift 0) mc2) mc1) else mc3)
  | _ -> mc3
))
# 1089 "Vuna/Compiler/Elab/Trait.vuna"
and v_substMetaTermAlt = (fun (mc0 : int) (mc1 : Core_dTerm.t_Term) (mc2 : int) (mc3 : Core_dTerm.t_CaseAlt) -> (match mc3 with
  | { Core_dTerm.f_CaseAlt_caseAltName = dtb__411; Core_dTerm.f_CaseAlt_caseAltBinders = dtb__412; Core_dTerm.f_CaseAlt_caseAltBody = dtb__413 } -> { Core_dTerm.f_CaseAlt_caseAltName = dtb__411; Core_dTerm.f_CaseAlt_caseAltBinders = dtb__412; Core_dTerm.f_CaseAlt_caseAltBody = ((((v_substMetaTermGo mc0) mc1) (mc2 + (B_dData_dList.v_length dtb__412))) dtb__413) }
  | _ -> failwith "DT: impossible branch"
))

# 1049 "Vuna/Compiler/Elab/Trait.vuna"
let v_substMetaTerm = (fun (m : int) (rep : Core_dTerm.t_Term) (t : Core_dTerm.t_Term) -> ((((v_substMetaTermGo m) rep) 0) t))

# 1044 "Vuna/Compiler/Elab/Trait.vuna"
let rec v_applyTermSubstsTo = (fun (mc0 : int) (mc1 : (int, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc2 : Core_dTerm.t_Term) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__414, dtb__415) -> (match dtb__414 with
  | { B_dData_dPair.f_Pair_first = dtb__416; B_dData_dPair.f_Pair_second = dtb__417 } -> (((v_applyTermSubstsTo mc0) dtb__415) (((v_substMetaTerm dtb__416) dtb__417) mc2))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> mc2
  | _ -> failwith "DT: impossible branch"
))

# 1093 "Vuna/Compiler/Elab/Trait.vuna"
let v_clauseSpanOf = (fun (mc0 : (Frontend_dRast.t_Pat B_dData_dList.t_List, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__418, dtb__419) -> (Frontend_dRast.v_exprSpan (B_dData_dPair.v_secondOf dtb__418))
  | B_dData_dList.C_List_Nil -> { Base_dSource.f_Span_spanFile = ""; Base_dSource.f_Span_spanStartLine = 0; Base_dSource.f_Span_spanStartCol = 0; Base_dSource.f_Span_spanEndLine = 0; Base_dSource.f_Span_spanEndCol = 0; Base_dSource.f_Span_spanStartOffset = 0; Base_dSource.f_Span_spanEndOffset = 0 }
  | _ -> failwith "DT: impossible branch"
))

# 1116 "Vuna/Compiler/Elab/Trait.vuna"
let v_literalClassArg = (fun (mc0 : Core_dTerm.t_Value) -> (match mc0 with
  | Core_dTerm.C_Value_VFloat (dtb__420) -> true
  | Core_dTerm.C_Value_VBool (dtb__421) -> true
  | Core_dTerm.C_Value_VInt (dtb__422) -> true
  | Core_dTerm.C_Value_VStr (dtb__423) -> true
  | _ -> false
))

# 1123 "Vuna/Compiler/Elab/Trait.vuna"
let v_liftableDictDomain = (fun (ec : Elab_dTypes.t_Ec) (dom : Core_dTerm.t_Value) -> ((B_dData_dList.v_length ((B_dData_dList.v_filter v_literalClassArg) ((Elab_dDict.v_dictClassArgs ec) dom))) = 0))

# 1151 "Vuna/Compiler/Elab/Trait.vuna"
let v_domainsEqual = (fun (ec : Elab_dTypes.t_Ec) (a : Core_dTerm.t_Value) (b : Core_dTerm.t_Value) -> (match (((((Core_dConv.v_conv (Elab_dTypes.v_ecDefTbl ec)) (Elab_dTypes.v_ecSolsP ec)) 0) a) b) with
  | Base_dDiag.C_Check_OkC (dtb__424) -> true
  | Base_dDiag.C_Check_ErrC (dtb__425) -> false
  | _ -> failwith "DT: impossible branch"
))

# 1143 "Vuna/Compiler/Elab/Trait.vuna"
let rec v_addDictGoalGroup = (fun (mc0 : Elab_dTypes.t_Ec) (mc1 : int) (mc2 : Core_dTerm.t_Value) (mc3 : t_DictGoalGroup B_dData_dList.t_List) -> (match mc3 with
  | B_dData_dList.C_List__x58__x58_ (dtb__426, dtb__427) -> (match dtb__426 with
  | { f_DictGoalGroup_dictGoalGroupRep = dtb__428; f_DictGoalGroup_dictGoalGroupDom = dtb__429; f_DictGoalGroup_dictGoalGroupExtras = dtb__430 } -> (if (((v_domainsEqual mc0) dtb__429) mc2) then (B_dData_dList.C_List__x58__x58_ ({ f_DictGoalGroup_dictGoalGroupRep = dtb__428; f_DictGoalGroup_dictGoalGroupDom = dtb__429; f_DictGoalGroup_dictGoalGroupExtras = (B_dData_dList.C_List__x58__x58_ (mc1, dtb__430)) }, dtb__427)) else (B_dData_dList.C_List__x58__x58_ ({ f_DictGoalGroup_dictGoalGroupRep = dtb__428; f_DictGoalGroup_dictGoalGroupDom = dtb__429; f_DictGoalGroup_dictGoalGroupExtras = dtb__430 }, ((((v_addDictGoalGroup mc0) mc1) mc2) dtb__427))))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (B_dData_dList.C_List__x58__x58_ ({ f_DictGoalGroup_dictGoalGroupRep = mc1; f_DictGoalGroup_dictGoalGroupDom = mc2; f_DictGoalGroup_dictGoalGroupExtras = B_dData_dList.C_List_Nil }, B_dData_dList.C_List_Nil))
  | _ -> failwith "DT: impossible branch"
))

# 1128 "Vuna/Compiler/Elab/Trait.vuna"
let rec v_freeDictGoalsGo = (fun (mc0 : int) (mc1 : Elab_dTypes.t_Ec) (mc2 : Elab_dTypes.t_Constraint B_dData_dList.t_List) (mc3 : t_DictGoalGroup B_dData_dList.t_List) -> (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__431, dtb__432) -> (match dtb__431 with
  | { Elab_dTypes.f_Constraint_conId = dtb__433; Elab_dTypes.f_Constraint_conKind = dtb__434; Elab_dTypes.f_Constraint_conMeta = dtb__435; Elab_dTypes.f_Constraint_conDom = dtb__436; Elab_dTypes.f_Constraint_conSpan = dtb__437; Elab_dTypes.f_Constraint_conDepth = dtb__438 } -> (if (if (if (dtb__433 >= mc0) then ((Elab_dDict.v_isRigidDictArg mc1) dtb__436) else false) then ((v_liftableDictDomain mc1) dtb__436) else false) then (match ((Core_dTerm.v_metaLookup dtb__435) (Elab_dTypes.v_ecSolTbl mc1)) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__439) -> ((((v_freeDictGoalsGo mc0) mc1) dtb__432) mc3)
  | B_dData_dMaybe.C_Maybe_Nothing -> ((((v_freeDictGoalsGo mc0) mc1) dtb__432) ((((v_addDictGoalGroup mc1) dtb__435) dtb__436) mc3))
  | _ -> failwith "DT: impossible branch"
) else ((((v_freeDictGoalsGo mc0) mc1) dtb__432) mc3))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> mc3
  | _ -> failwith "DT: impossible branch"
))

# 1111 "Vuna/Compiler/Elab/Trait.vuna"
let v_freeDictGoals = (fun (minCid : int) (ec : Elab_dTypes.t_Ec) -> ((((v_freeDictGoalsGo minCid) ec) (Elab_dTypes.v_ecPendingList ec)) B_dData_dList.C_List_Nil))

# 1158 "Vuna/Compiler/Elab/Trait.vuna"
let rec v_leadingImplicitCount = (fun (mc0 : Core_dTerm.t_Term) -> (match mc0 with
  | Core_dTerm.C_Term_TPi (dtb__440, dtb__441, dtb__442, dtb__443, dtb__444) -> (if dtb__441 then (1 + (v_leadingImplicitCount dtb__444)) else 0)
  | _ -> 0
))

# 1165 "Vuna/Compiler/Elab/Trait.vuna"
let v_solveLiftedMeta = (fun (ec : Elab_dTypes.t_Ec) (name : string) (level : int) (m : int) -> (match ((((((Core_dConv.v_solveMeta (Elab_dTypes.v_ecDefTbl ec)) (Elab_dTypes.v_ecSolsP ec)) (level + 1)) m) B_dData_dList.C_List_Nil) (Core_dTerm.C_Value_VNeutral ((Core_dTerm.C_Neutral_NVar (name, level, B_dData_dList.C_List_Nil))))) with
  | Base_dDiag.C_Check_OkC (dtb__445) -> ((Elab_dTypes.v_ecPutSols ec) (Core_dTerm.v_solsList dtb__445))
  | Base_dDiag.C_Check_ErrC (dtb__446) -> ec
  | _ -> failwith "DT: impossible branch"
))

# 1217 "Vuna/Compiler/Elab/Trait.vuna"
let rec v_substExtraDictMetas = (fun (mc0 : string) (mc1 : int) (mc2 : int B_dData_dList.t_List) (mc3 : Core_dTerm.t_Term) -> (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__447, dtb__448) -> ((((v_substExtraDictMetas mc0) mc1) dtb__448) ((((Core_dTerm.v_substMetaVar dtb__447) mc0) mc1) mc3))
  | B_dData_dList.C_List_Nil -> mc3
  | _ -> failwith "DT: impossible branch"
))

# 1222 "Vuna/Compiler/Elab/Trait.vuna"
let rec v_solveLiftedMetas = (fun (mc0 : Elab_dTypes.t_Ec) (mc1 : string) (mc2 : int) (mc3 : int B_dData_dList.t_List) -> (match mc3 with
  | B_dData_dList.C_List__x58__x58_ (dtb__449, dtb__450) -> ((((v_solveLiftedMetas ((((v_solveLiftedMeta mc0) mc1) mc2) dtb__449)) mc1) mc2) dtb__450)
  | B_dData_dList.C_List_Nil -> mc0
  | _ -> failwith "DT: impossible branch"
))

# 1285 "Vuna/Compiler/Elab/Trait.vuna"
let v_insertArgAt = (fun (n : int) x xs -> ((B_dData_dList.v_append ((B_dData_dList.v_append ((B_dData_dList.v_take n) xs)) (B_dData_dList.C_List__x58__x58_ (x, B_dData_dList.C_List_Nil)))) ((B_dData_dList.v_drop n) xs)))

# 1236 "Vuna/Compiler/Elab/Trait.vuna"
let rec v_injectDictGoFuel = (fun (fuel : int) (defName : string) (dName : string) (appPos : int) (depth : int) (t : Core_dTerm.t_Term) -> (if (fuel <= 0) then t else (match t with
  | Core_dTerm.C_Term_TLam (dtb__451, dtb__452, dtb__453, dtb__454, dtb__455) -> (let slot2 = (let nd_uscrut11 = dtb__453 in (match nd_uscrut11 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__456) -> (match dtb__456 with
  | { B_dData_dPair.f_Pair_first = dtb__457; B_dData_dPair.f_Pair_second = dtb__458 } -> ((Core_dTerm.v_lamTyOf ((Core_dTerm.v_mapTermMaybe (((((v_injectDictGoFuel (fuel - 1)) defName) dName) appPos) depth)) dtb__457)) ((Core_dTerm.v_mapTermMaybe (((((v_injectDictGoFuel (fuel - 1)) defName) dName) appPos) (depth + 1))) dtb__458))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) in (Core_dTerm.C_Term_TLam (dtb__451, dtb__452, slot2, dtb__454, ((((((v_injectDictGoFuel (fuel - 1)) defName) dName) appPos) (depth + 1)) dtb__455))))
  | Core_dTerm.C_Term_TPi (dtb__459, dtb__460, dtb__461, dtb__462, dtb__463) -> (Core_dTerm.C_Term_TPi (dtb__459, dtb__460, dtb__461, ((((((v_injectDictGoFuel (fuel - 1)) defName) dName) appPos) depth) dtb__462), ((((((v_injectDictGoFuel (fuel - 1)) defName) dName) appPos) (depth + 1)) dtb__463)))
  | Core_dTerm.C_Term_TApp (dtb__464, dtb__465, dtb__466) -> (let nd_uscrut9 = (Elab_dTypes.v_flattenTaggedApp t) in (match nd_uscrut9 with
  | B_dData_dMaybe.C_Maybe_Nothing -> (Core_dTerm.C_Term_TApp (((((((v_injectDictGoFuel (fuel - 1)) defName) dName) appPos) depth) dtb__464), ((((((v_injectDictGoFuel (fuel - 1)) defName) dName) appPos) depth) dtb__465), dtb__466))
  | B_dData_dMaybe.C_Maybe_Just (dtb__467) -> (match dtb__467 with
  | { B_dData_dPair.f_Pair_first = dtb__468; B_dData_dPair.f_Pair_second = dtb__469 } -> (((((((v_rewriteTaggedSpineFuel (fuel - 1)) defName) dName) appPos) depth) dtb__468) dtb__469)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))
  | Core_dTerm.C_Term_TCon (dtb__470, dtb__471) -> (Core_dTerm.C_Term_TCon (dtb__470, ((B_dData_dList.v_map (fun (p : (Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair) -> { B_dData_dPair.f_Pair_first = ((((((v_injectDictGoFuel (fuel - 1)) defName) dName) appPos) depth) (B_dData_dPair.v_firstOf p)); B_dData_dPair.f_Pair_second = (B_dData_dPair.v_secondOf p) })) dtb__471)))
  | Core_dTerm.C_Term_TMk (dtb__472, dtb__473) -> (Core_dTerm.C_Term_TMk (dtb__472, ((B_dData_dList.v_map (fun (p : (Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair) -> { B_dData_dPair.f_Pair_first = ((((((v_injectDictGoFuel (fuel - 1)) defName) dName) appPos) depth) (B_dData_dPair.v_firstOf p)); B_dData_dPair.f_Pair_second = (B_dData_dPair.v_secondOf p) })) dtb__473)))
  | Core_dTerm.C_Term_TRecord (dtb__474, dtb__475) -> (Core_dTerm.C_Term_TRecord (dtb__474, ((B_dData_dList.v_map (fun (p : (Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair) -> { B_dData_dPair.f_Pair_first = ((((((v_injectDictGoFuel (fuel - 1)) defName) dName) appPos) depth) (B_dData_dPair.v_firstOf p)); B_dData_dPair.f_Pair_second = (B_dData_dPair.v_secondOf p) })) dtb__475)))
  | Core_dTerm.C_Term_TCase (dtb__476, dtb__477) -> (Core_dTerm.C_Term_TCase (((((((v_injectDictGoFuel (fuel - 1)) defName) dName) appPos) depth) dtb__476), ((B_dData_dList.v_map (fun (alt : Core_dTerm.t_CaseAlt) -> ((((((v_injectAltGoFuel (fuel - 1)) defName) dName) appPos) depth) alt))) dtb__477)))
  | Core_dTerm.C_Term_TIf (dtb__478, dtb__479, dtb__480) -> (Core_dTerm.C_Term_TIf (((((((v_injectDictGoFuel (fuel - 1)) defName) dName) appPos) depth) dtb__478), ((((((v_injectDictGoFuel (fuel - 1)) defName) dName) appPos) depth) dtb__479), ((((((v_injectDictGoFuel (fuel - 1)) defName) dName) appPos) depth) dtb__480)))
  | _ -> t
)))
# 1264 "Vuna/Compiler/Elab/Trait.vuna"
and v_injectAltGoFuel = (fun (fuel : int) (defName : string) (dName : string) (appPos : int) (depth : int) (alt : Core_dTerm.t_CaseAlt) -> (if (fuel <= 0) then alt else (match alt with
  | { Core_dTerm.f_CaseAlt_caseAltName = dtb__481; Core_dTerm.f_CaseAlt_caseAltBinders = dtb__482; Core_dTerm.f_CaseAlt_caseAltBody = dtb__483 } -> { Core_dTerm.f_CaseAlt_caseAltName = dtb__481; Core_dTerm.f_CaseAlt_caseAltBinders = dtb__482; Core_dTerm.f_CaseAlt_caseAltBody = ((((((v_injectDictGoFuel (fuel - 1)) defName) dName) appPos) (depth + (B_dData_dList.v_length dtb__482))) dtb__483) }
  | _ -> failwith "DT: impossible branch"
)))
# 1276 "Vuna/Compiler/Elab/Trait.vuna"
and v_rewriteTaggedSpineFuel = (fun (fuel : int) (defName : string) (dName : string) (appPos : int) (depth : int) (g : string) (args : (Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (if (fuel <= 0) then (Core_dTerm.C_Term_TGlobal (g)) else (let args2 = ((B_dData_dList.v_map (fun (p : (Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair) -> { B_dData_dPair.f_Pair_first = ((((((v_injectDictGoFuel (fuel - 1)) defName) dName) appPos) depth) (B_dData_dPair.v_firstOf p)); B_dData_dPair.f_Pair_second = (B_dData_dPair.v_secondOf p) })) args) in (if (if (if (g = defName) then ((B_dData_dList.v_length args2) > appPos) else false) then (depth > appPos) else false) then ((Elab_dMeta.v_foldAppTerms (Core_dTerm.C_Term_TGlobal (g))) (((v_insertArgAt appPos) { B_dData_dPair.f_Pair_first = (Core_dTerm.C_Term_TVar (dName, ((depth - appPos) - 1), { Base_dSource.f_Span_spanFile = ""; Base_dSource.f_Span_spanStartLine = 0; Base_dSource.f_Span_spanStartCol = 0; Base_dSource.f_Span_spanEndLine = 0; Base_dSource.f_Span_spanEndCol = 0; Base_dSource.f_Span_spanStartOffset = 0; Base_dSource.f_Span_spanEndOffset = 0 })); B_dData_dPair.f_Pair_second = Core_dTerm.C_Rig_RigOmega }) args2)) else ((Elab_dMeta.v_foldAppTerms (Core_dTerm.C_Term_TGlobal (g))) args2)))))

# 1233 "Vuna/Compiler/Elab/Trait.vuna"
let v_injectDictGo = (fun (defName : string) (dName : string) (appPos : int) (depth : int) (t : Core_dTerm.t_Term) -> ((((((v_injectDictGoFuel 128) defName) dName) appPos) depth) t))

# 1230 "Vuna/Compiler/Elab/Trait.vuna"
let v_insertDictCalls = (fun (defName : string) (dName : string) (appPos : int) (t : Core_dTerm.t_Term) -> (((((v_injectDictGo defName) dName) appPos) 0) t))

# 1188 "Vuna/Compiler/Elab/Trait.vuna"
let rec v_liftFreeDictGoalsGo = (fun (defName : string) (ec : Elab_dTypes.t_Ec) (ty : Core_dTerm.t_Term) (body : Core_dTerm.t_Term) (baseIdx : int) (nGroups : int) (k : int) (groups : t_DictGoalGroup B_dData_dList.t_List) -> (let nd_uscrut8 = groups in (match nd_uscrut8 with
  | B_dData_dList.C_List__x58__x58_ (dtb__484, dtb__485) -> (match dtb__484 with
  | { f_DictGoalGroup_dictGoalGroupRep = dtb__486; f_DictGoalGroup_dictGoalGroupDom = dtb__487; f_DictGoalGroup_dictGoalGroupExtras = dtb__488 } -> (let dName = ("d" ^ (bi_strFromInt dtb__486)) in (let finalPos = ((baseIdx + 1) + ((nGroups - 1) - k)) in (let dictDom = (((Core_dEval.v_substSolvedMetasAtTbl (Elab_dTypes.v_ecSolTbl ec)) (baseIdx + 1)) ((Core_dEval.v_quote (baseIdx + 1)) dtb__487)) in (let ty2 = ((((Core_dTerm.v_insertDictBinder dName) baseIdx) dictDom) ty) in (let body2 = ((((Core_dTerm.v_substMetaVar dtb__486) dName) (baseIdx + 2)) (((Core_dTerm.v_insertLamBinder dName) baseIdx) body)) in (let body3 = ((((v_insertDictCalls defName) dName) (baseIdx + 1)) body2) in (let body4 = ((((v_substExtraDictMetas dName) (baseIdx + 2)) dtb__488) body3) in (let ec2 = ((((v_solveLiftedMeta ec) dName) finalPos) dtb__486) in (let ec3 = ((((v_solveLiftedMetas ec2) dName) finalPos) dtb__488) in ((((((((v_liftFreeDictGoalsGo defName) ec3) ty2) body4) baseIdx) nGroups) (k + 1)) dtb__485))))))))))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> { B_dData_dPair.f_Pair_first = ty; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = body; B_dData_dPair.f_Pair_second = ec } }
  | _ -> failwith "DT: impossible branch"
)))

# 1172 "Vuna/Compiler/Elab/Trait.vuna"
let v_liftFreeDictGoals = (fun (defName : string) (minCid : int) (ec : Elab_dTypes.t_Ec) (ty : Core_dTerm.t_Term) (body : Core_dTerm.t_Term) -> (match (Elab_dTypes.v_ecPendingList ec) with
  | B_dData_dList.C_List_Nil -> { B_dData_dPair.f_Pair_first = ty; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = body; B_dData_dPair.f_Pair_second = ec } }
  | _ -> (let groups = ((v_freeDictGoals minCid) ec) in (let nGroups = (B_dData_dList.v_length groups) in (let baseIdx = ((Elab_dMeta.v_maxInt 0) ((v_leadingImplicitCount ty) - 1)) in ((((((((v_liftFreeDictGoalsGo defName) ec) ty) body) baseIdx) nGroups) 0) groups))))
))

# 1261 "Vuna/Compiler/Elab/Trait.vuna"
let v_injectAltGo = (fun (defName : string) (dName : string) (appPos : int) (depth : int) (alt : Core_dTerm.t_CaseAlt) -> ((((((v_injectAltGoFuel 128) defName) dName) appPos) depth) alt))

# 1272 "Vuna/Compiler/Elab/Trait.vuna"
let v_rewriteTaggedSpine = (fun (defName : string) (dName : string) (appPos : int) (depth : int) (g : string) (args : (Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (((((((v_rewriteTaggedSpineFuel 128) defName) dName) appPos) depth) g) args))

# 1289 "Vuna/Compiler/Elab/Trait.vuna"
let rec v_replaceGlobalType = (fun (mc0 : string) (mc1 : Core_dTerm.t_Term) (mc2 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__489, dtb__490) -> (if ((B_dData_dPair.v_firstOf dtb__489) = mc0) then (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = mc0; B_dData_dPair.f_Pair_second = mc1 }, dtb__490)) else (B_dData_dList.C_List__x58__x58_ (dtb__489, (((v_replaceGlobalType mc0) mc1) dtb__490))))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 1295 "Vuna/Compiler/Elab/Trait.vuna"
let rec v_foldlAddInst = (fun (mc0 : Elab_dTypes.t_Ec) (mc1 : Elab_dTypes.t_DtInst B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__491, dtb__492) -> ((v_foldlAddInst ((Elab_dTypes.v_ecAddInst mc0) dtb__491)) dtb__492)
  | B_dData_dList.C_List_Nil -> mc0
  | _ -> failwith "DT: impossible branch"
))

# 1306 "Vuna/Compiler/Elab/Trait.vuna"
let rec v_checkInstanceHeadsGo = (fun (mc0 : (Frontend_dRast.t_Decl, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc1 : Elab_dTypes.t_DtClass B_dData_dList.t_List) (mc2 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc3 : Elab_dTypes.t_Ec) (mc4 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc5 : Elab_dTypes.t_DtInst B_dData_dList.t_List) (mc6 : Elab_dTypes.t_DtInst B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__493, dtb__494) -> (match dtb__493 with
  | { B_dData_dPair.f_Pair_first = dtb__495; B_dData_dPair.f_Pair_second = dtb__496 } -> (match dtb__495 with
  | Frontend_dRast.C_Decl_DInstance (dtb__497, dtb__498, dtb__499, dtb__500) -> ((Base_dCommon.v_bind (((((((v_elabInstanceSig mc1) mc2) (Elab_dSig.v_definedNames ((B_dData_dList.v_map B_dData_dPair.v_firstOf) (B_dData_dList.C_List__x58__x58_ (dtb__493, dtb__494))))) mc3) dtb__500) dtb__498) dtb__497)) (fun (p : (t_InstSigInfo, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match p with
  | { B_dData_dPair.f_Pair_first = dtb__501; B_dData_dPair.f_Pair_second = dtb__502 } -> (let iname = ((Elab_dInstName.v_instanceName (v_instSigClass dtb__501)) dtb__498) in (let ty = (v_instTypeOf dtb__501) in (let inst = { Elab_dTypes.f_DtInst_dtInstName = iname; Elab_dTypes.f_DtInst_dtInstTele = (v_instSigTele dtb__501); Elab_dTypes.f_DtInst_dtInstCtx = (v_instSigCtx dtb__501); Elab_dTypes.f_DtInst_dtInstHead = (v_instSigHead dtb__501); Elab_dTypes.f_DtInst_dtInstSpan = (B_dData_dMaybe.C_Maybe_Just (dtb__500)) } in (let nd_uscrut26 = (((((Elab_dInstCoherence.v_findInstanceClash dtb__502) iname) (v_instSigTele dtb__501)) (v_instSigHead dtb__501)) ((B_dData_dList.v_append (Elab_dTypes.v_ecInsts dtb__502)) mc6)) in (match nd_uscrut26 with
  | { B_dData_dPair.f_Pair_first = dtb__503; B_dData_dPair.f_Pair_second = dtb__504 } -> (match dtb__503 with
  | B_dData_dMaybe.C_Maybe_Nothing -> (((((((v_checkInstanceHeadsGo dtb__494) mc1) mc2) dtb__504) (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = iname; B_dData_dPair.f_Pair_second = ty }, mc4))) (B_dData_dList.C_List__x58__x58_ (inst, mc5))) (B_dData_dList.C_List__x58__x58_ (inst, mc6)))
  | B_dData_dMaybe.C_Maybe_Just (dtb__505) -> (match dtb__505 with
  | Elab_dInstCoherence.C_InstClash_ClashOverlap -> (((Base_dDiagnostics_dTc.v_tcErr1 dtb__500) (Base_dDiagnostics_dTc.C_TcErr_OverlappingInstances (iname))) iname)
  | Elab_dInstCoherence.C_InstClash_ClashDuplicate -> (((Base_dDiagnostics_dTc.v_tcErr1 dtb__500) (Base_dDiagnostics_dTc.C_TcErr_DuplicateInstance (iname))) iname)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> (((((((v_checkInstanceHeadsGo dtb__494) mc1) mc2) mc3) mc4) mc5) mc6)
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.v_reverse mc4); B_dData_dPair.f_Pair_second = ((v_foldlAddInst mc3) (B_dData_dList.v_reverse mc5)) }))
  | _ -> failwith "DT: impossible branch"
))

# 1303 "Vuna/Compiler/Elab/Trait.vuna"
let v_checkInstanceHeads = (fun (decls : (Frontend_dRast.t_Decl, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List) (classes : Elab_dTypes.t_DtClass B_dData_dList.t_List) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ec : Elab_dTypes.t_Ec) -> (((((((v_checkInstanceHeadsGo decls) classes) globals) ec) B_dData_dList.C_List_Nil) B_dData_dList.C_List_Nil) B_dData_dList.C_List_Nil))

# 1379 "Vuna/Compiler/Elab/Trait.vuna"
let v_defBodyOf = (fun (defs : (string, Core_dTerm.t_Term) B_dContainer_dHashMap.t_HashMap) (name : string) -> (match ((Core_dTerm.v_defLookup name) defs) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__506) -> dtb__506
  | B_dData_dMaybe.C_Maybe_Nothing -> (Core_dTerm.C_Term_TInt (0))
  | _ -> failwith "DT: impossible branch"
))

# 1389 "Vuna/Compiler/Elab/Trait.vuna"
let rec v_elabTraitsGo = (fun (mc0 : (Frontend_dRast.t_Decl, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc1 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc2 : Elab_dTypes.t_Ec) (mc3 : Elab_dTypes.t_DtData B_dData_dList.t_List) (mc4 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc5 : Elab_dTypes.t_DtClass B_dData_dList.t_List) (mc6 : (string, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__507, dtb__508) -> ((Base_dCommon.v_bind (((v_elabTrait mc1) mc2) dtb__507)) (fun (p : (Elab_dTypes.t_DtData, ((string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List, (Elab_dTypes.t_DtClass, ((string, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let nd_uscrut11 = p in (match nd_uscrut11 with
  | { B_dData_dPair.f_Pair_first = dtb__509; B_dData_dPair.f_Pair_second = dtb__510 } -> (match dtb__510 with
  | { B_dData_dPair.f_Pair_first = dtb__511; B_dData_dPair.f_Pair_second = dtb__512 } -> (match dtb__512 with
  | { B_dData_dPair.f_Pair_first = dtb__513; B_dData_dPair.f_Pair_second = dtb__514 } -> (match dtb__514 with
  | { B_dData_dPair.f_Pair_first = dtb__515; B_dData_dPair.f_Pair_second = dtb__516 } -> (((((((v_elabTraitsGo dtb__508) ((B_dData_dList.v_append mc1) dtb__511)) dtb__516) (B_dData_dList.C_List__x58__x58_ (dtb__509, mc3))) ((B_dData_dList.v_append dtb__511) mc4)) (B_dData_dList.C_List__x58__x58_ (dtb__513, mc5))) ((B_dData_dList.v_append dtb__515) mc6))
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

# 1386 "Vuna/Compiler/Elab/Trait.vuna"
let v_elabTraits = (fun (decls : (Frontend_dRast.t_Decl, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ec : Elab_dTypes.t_Ec) -> (((((((v_elabTraitsGo decls) globals) ec) B_dData_dList.C_List_Nil) B_dData_dList.C_List_Nil) B_dData_dList.C_List_Nil) B_dData_dList.C_List_Nil))

# 1434 "Vuna/Compiler/Elab/Trait.vuna"
let rec v_spanOfName = (fun (mc0 : string) (mc1 : (string, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__517, dtb__518) -> (match dtb__517 with
  | { B_dData_dPair.f_Pair_first = dtb__519; B_dData_dPair.f_Pair_second = dtb__520 } -> (if (dtb__519 = mc0) then (B_dData_dMaybe.C_Maybe_Just (dtb__520)) else ((v_spanOfName mc0) dtb__518))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 1438 "Vuna/Compiler/Elab/Trait.vuna"
let v_defTypeOrDefaultTbl = (fun (tbl : (string, Core_dTerm.t_Term) B_dContainer_dHashMap.t_HashMap) (name : string) -> (match ((((B_dContainer_dHashMap.v_lookup B_dData_dString.v_Hashable_uString) B_dData_dString.v_Eq_uString) name) tbl) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__521) -> dtb__521
  | B_dData_dMaybe.C_Maybe_Nothing -> (Core_dTerm.C_Term_TGlobal ("Int"))
  | _ -> failwith "DT: impossible branch"
))

# 1373 "Vuna/Compiler/Elab/Trait.vuna"
let v_instanceDefsOf = (fun (ecBefore : Elab_dTypes.t_Ec) (ecAfter : Elab_dTypes.t_Ec) (srcSpan : Base_dSource.t_Span B_dData_dMaybe.t_Maybe) (gs : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) -> ((B_dData_dList.v_map (fun (g : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair) -> (Elab_dTypes.C_DtDef_DtDef ((B_dData_dPair.v_firstOf g), ((v_defTypeOrDefaultTbl (((B_dContainer_dHashMap.v_fromList B_dData_dString.v_Hashable_uString) B_dData_dString.v_Eq_uString) gs)) (B_dData_dPair.v_firstOf g)), ((Elab_dDict.v_substDictTerm ecAfter) ((v_defBodyOf (Elab_dTypes.v_ecDefTbl ecAfter)) (B_dData_dPair.v_firstOf g))), srcSpan)))) gs))

# 1421 "Vuna/Compiler/Elab/Trait.vuna"
let rec v_extraDefsGo = (fun (mc0 : (string, Core_dTerm.t_Term) B_dContainer_dHashMap.t_HashMap) (mc1 : (string, bool) B_dContainer_dHashMap.t_HashMap) (mc2 : (string, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc3 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc4 : Elab_dTypes.t_DtDef B_dData_dList.t_List) -> (match mc3 with
  | B_dData_dList.C_List__x58__x58_ (dtb__522, dtb__523) -> (if ((((B_dContainer_dHashMap.v_member B_dData_dString.v_Hashable_uString) B_dData_dString.v_Eq_uString) (B_dData_dPair.v_firstOf dtb__522)) mc1) then (((((v_extraDefsGo mc0) mc1) mc2) dtb__523) mc4) else (((((v_extraDefsGo mc0) mc1) mc2) dtb__523) (B_dData_dList.C_List__x58__x58_ ((Elab_dTypes.C_DtDef_DtDef ((B_dData_dPair.v_firstOf dtb__522), ((v_defTypeOrDefaultTbl mc0) (B_dData_dPair.v_firstOf dtb__522)), (B_dData_dPair.v_secondOf dtb__522), ((v_spanOfName (B_dData_dPair.v_firstOf dtb__522)) mc2))), mc4))))
  | B_dData_dList.C_List_Nil -> (B_dData_dList.v_reverse mc4)
  | _ -> failwith "DT: impossible branch"
))

# 1417 "Vuna/Compiler/Elab/Trait.vuna"
let v_extraDefsOf = (fun (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ec : Elab_dTypes.t_Ec) (srcSpans : (string, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List) (sourceDefs : Elab_dTypes.t_DtDef B_dData_dList.t_List) -> (((((v_extraDefsGo (Elab_dTypes.v_ecGlobalsTbl ec)) (B_dContainer_dHashMap.v_ofNames ((B_dData_dList.v_map Elab_dTypes.v_dtDefName) sourceDefs))) srcSpans) (Elab_dTypes.v_ecDefs ec)) B_dData_dList.C_List_Nil))

# 1455 "Vuna/Compiler/Elab/Trait.vuna"
let rec v_bindDictBinderFuel = (fun (fuel : int) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (rig : Core_dTerm.t_Rig) (name : string) (dom : Core_dTerm.t_Value) (clo : Core_dTerm.t_Closure) (pats : Frontend_dRast.t_Pat B_dData_dList.t_List) (body : Frontend_dRast.t_Expr) (sp : Base_dSource.t_Span) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "binder check") else (let lvl = (Elab_dTypes.v_ctxDepth ctx) in (let v = ((Elab_dMeta.v_freshVarValue name) lvl) in (let ctx2 = (((Elab_dTypes.v_ctxBindValue name) dom) ctx) in (let expected2 = ((Core_dEval.v_applyClosure clo) v) in ((Base_dCommon.v_bind ((((((((v_checkBindersFuel (fuel - 1)) globals) ctx2) ec) pats) body) expected2) sp)) (fun (p : (Core_dTerm.t_Term, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match p with
  | { B_dData_dPair.f_Pair_first = dtb__524; B_dData_dPair.f_Pair_second = dtb__525 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Core_dTerm.C_Term_TLam (name, rig, B_dData_dMaybe.C_Maybe_Nothing, Base_dSource.v_spanEmpty, dtb__524)); B_dData_dPair.f_Pair_second = dtb__525 }))
  | _ -> failwith "DT: impossible branch"
)))))))))
# 1472 "Vuna/Compiler/Elab/Trait.vuna"
and v_bindIndexBinderFuel = (fun (fuel : int) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (rig : Core_dTerm.t_Rig) (name : string) (dom : Core_dTerm.t_Value) (clo : Core_dTerm.t_Closure) (pats : Frontend_dRast.t_Pat B_dData_dList.t_List) (body : Frontend_dRast.t_Expr) (sp : Base_dSource.t_Span) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "binder check") else (let lvl = (Elab_dTypes.v_ctxDepth ctx) in (let v = ((Elab_dMeta.v_freshVarValue name) lvl) in (let ctx2 = (((Elab_dTypes.v_ctxBindValue name) dom) ctx) in (let expected2 = ((Core_dEval.v_applyClosure clo) v) in ((Base_dCommon.v_bind ((((((((v_checkBindersFuel (fuel - 1)) globals) ctx2) ec) pats) body) expected2) sp)) (fun (p : (Core_dTerm.t_Term, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match p with
  | { B_dData_dPair.f_Pair_first = dtb__526; B_dData_dPair.f_Pair_second = dtb__527 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Core_dTerm.C_Term_TLam (name, rig, B_dData_dMaybe.C_Maybe_Nothing, Base_dSource.v_spanEmpty, dtb__526)); B_dData_dPair.f_Pair_second = dtb__527 }))
  | _ -> failwith "DT: impossible branch"
)))))))))
# 1492 "Vuna/Compiler/Elab/Trait.vuna"
and v_checkBodyAtEndFuel = (fun (fuel : int) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (body : Frontend_dRast.t_Expr) (expected : Core_dTerm.t_Value) (sp : Base_dSource.t_Span) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "binder check") else (match ((Elab_dTypes.v_forceVal ec) expected) with
  | Core_dTerm.C_Value_VPi (dtb__528, dtb__529, dtb__530, dtb__531, dtb__532) -> (if dtb__529 then (if ((Elab_dDict.v_isDictDomain ec) dtb__531) then (((((((((((v_bindDictBinderFuel (fuel - 1)) globals) ctx) ec) dtb__530) dtb__528) dtb__531) dtb__532) B_dData_dList.C_List_Nil) body) sp) else (if (((Elab_dMeta.v_isImplicitDomain ctx) ec) dtb__531) then (((((((((((v_bindIndexBinderFuel (fuel - 1)) globals) ctx) ec) dtb__530) dtb__528) dtb__531) dtb__532) B_dData_dList.C_List_Nil) body) sp) else ((Base_dDiagnostics_dTc.v_tcErr0 sp) Base_dDiagnostics_dTc.C_TcErr_ImplicitParamKind))) else ((Base_dCommon.v_bind (((((Elab_dTerm.v_checkE globals) ctx) ec) body) expected)) (fun (p : (Core_dTerm.t_Term, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> ((Base_dCommon.v_bind ((((Elab_dDict.v_resolveRowGoalsCtx globals) ctx) (B_dData_dPair.v_secondOf p)) sp)) (fun (ec2 : Elab_dTypes.t_Ec) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dPair.v_firstOf p); B_dData_dPair.f_Pair_second = ec2 })))))))
  | _ -> ((Base_dCommon.v_bind (((((Elab_dTerm.v_checkE globals) ctx) ec) body) expected)) (fun (p : (Core_dTerm.t_Term, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> ((Base_dCommon.v_bind ((((Elab_dDict.v_resolveRowGoalsCtx globals) ctx) (B_dData_dPair.v_secondOf p)) sp)) (fun (ec2 : Elab_dTypes.t_Ec) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dPair.v_firstOf p); B_dData_dPair.f_Pair_second = ec2 }))))))
)))
# 1501 "Vuna/Compiler/Elab/Trait.vuna"
and v_checkBindersFuel = (fun (mc0 : int) (mc1 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc2 : Elab_dTypes.t_Ctx) (mc3 : Elab_dTypes.t_Ec) (mc4 : Frontend_dRast.t_Pat B_dData_dList.t_List) (mc5 : Frontend_dRast.t_Expr) (mc6 : Core_dTerm.t_Value) (mc7 : Base_dSource.t_Span) -> (match mc4 with
  | B_dData_dList.C_List__x58__x58_ (dtb__533, dtb__534) -> (if (mc0 <= 0) then (Base_dDiag.v_icFuel "binder check") else (let forced = ((Elab_dTypes.v_forceVal mc3) mc6) in (match forced with
  | Core_dTerm.C_Value_VPi (dtb__535, dtb__536, dtb__537, dtb__538, dtb__539) -> (if dtb__536 then (if ((Elab_dDict.v_isDictDomain mc3) dtb__538) then (((((((((((v_bindDictBinderFuel (mc0 - 1)) mc1) mc2) mc3) dtb__537) dtb__535) dtb__538) dtb__539) (B_dData_dList.C_List__x58__x58_ (dtb__533, dtb__534))) mc5) mc7) else (if (((Elab_dMeta.v_isImplicitDomain mc2) mc3) dtb__538) then (((((((((((v_bindIndexBinderFuel (mc0 - 1)) mc1) mc2) mc3) dtb__537) dtb__535) dtb__538) dtb__539) (B_dData_dList.C_List__x58__x58_ (dtb__533, dtb__534))) mc5) mc7) else ((Base_dDiagnostics_dTc.v_tcErr0 mc7) Base_dDiagnostics_dTc.C_TcErr_ImplicitParamKind))) else (match dtb__533 with
  | Frontend_dRast.C_Pat_PVar (dtb__540, dtb__541) -> ((((((((((((v_bindOnePatternFuel (mc0 - 1)) mc1) mc2) mc3) dtb__537) dtb__540) dtb__534) mc5) dtb__538) dtb__539) ((Base_dSource.v_spanAtName dtb__540) dtb__541)) mc7)
  | Frontend_dRast.C_Pat_PWild (dtb__542) -> ((((((((((((v_bindOnePatternFuel (mc0 - 1)) mc1) mc2) mc3) dtb__537) "_") dtb__534) mc5) dtb__538) dtb__539) dtb__542) mc7)
  | _ -> ((Base_dDiagnostics_dTc.v_tcErr0 (Frontend_dRast.v_patSpan dtb__533)) Base_dDiagnostics_dTc.C_TcErr_DefParamsMustBeVars)
))
  | _ -> ((Base_dDiagnostics_dTc.v_tcErr0 mc7) Base_dDiagnostics_dTc.C_TcErr_DefMoreParams)
)))
  | B_dData_dList.C_List_Nil -> (if (mc0 <= 0) then (Base_dDiag.v_icFuel "binder check") else (let forced = ((Elab_dTypes.v_forceVal mc3) mc6) in (match forced with
  | Core_dTerm.C_Value_VPi (dtb__543, dtb__544, dtb__545, dtb__546, dtb__547) -> (if dtb__544 then (if ((Elab_dDict.v_isDictDomain mc3) dtb__546) then (((((((((((v_bindDictBinderFuel (mc0 - 1)) mc1) mc2) mc3) dtb__545) dtb__543) dtb__546) dtb__547) B_dData_dList.C_List_Nil) mc5) mc7) else (if (((Elab_dMeta.v_isImplicitDomain mc2) mc3) dtb__546) then (((((((((((v_bindIndexBinderFuel (mc0 - 1)) mc1) mc2) mc3) dtb__545) dtb__543) dtb__546) dtb__547) B_dData_dList.C_List_Nil) mc5) mc7) else ((Base_dDiagnostics_dTc.v_tcErr0 mc7) Base_dDiagnostics_dTc.C_TcErr_ImplicitParamKind))) else ((Base_dCommon.v_bind ((Base_dObs.v_obsCheck "vuna.elab.term.body") (fun (_u : int) -> (((((((v_checkBodyAtEndFuel (mc0 - 1)) mc1) mc2) mc3) mc5) mc6) mc7)))) (fun (p : (Core_dTerm.t_Term, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> ((Base_dCommon.v_bind ((Base_dObs.v_obsCheck "vuna.elab.term.goals") (fun (_u : int) -> ((((Elab_dDict.v_resolveRowGoalsCtx mc1) mc2) (B_dData_dPair.v_secondOf p)) mc7)))) (fun (ec2 : Elab_dTypes.t_Ec) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dPair.v_firstOf p); B_dData_dPair.f_Pair_second = ec2 })))))))
  | _ -> ((Base_dCommon.v_bind ((Base_dObs.v_obsCheck "vuna.elab.term.body") (fun (_u : int) -> (((((Elab_dTerm.v_checkE mc1) mc2) mc3) mc5) mc6)))) (fun (p : (Core_dTerm.t_Term, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> ((Base_dCommon.v_bind ((Base_dObs.v_obsCheck "vuna.elab.term.goals") (fun (_u : int) -> ((((Elab_dDict.v_resolveRowGoalsCtx mc1) mc2) (B_dData_dPair.v_secondOf p)) mc7)))) (fun (ec2 : Elab_dTypes.t_Ec) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dPair.v_firstOf p); B_dData_dPair.f_Pair_second = ec2 }))))))
)))
  | _ -> failwith "DT: impossible branch"
))
# 1528 "Vuna/Compiler/Elab/Trait.vuna"
and v_bindOnePatternFuel = (fun (fuel : int) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (rig : Core_dTerm.t_Rig) (pname : string) (pats : Frontend_dRast.t_Pat B_dData_dList.t_List) (body : Frontend_dRast.t_Expr) (dom : Core_dTerm.t_Value) (clo : Core_dTerm.t_Closure) (binderSp : Base_dSource.t_Span) (sp : Base_dSource.t_Span) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "binder check") else (let lvl = (Elab_dTypes.v_ctxDepth ctx) in (let v = ((Elab_dMeta.v_freshVarValue pname) lvl) in (let ctx2 = (((Elab_dTypes.v_ctxBindValue pname) dom) ctx) in ((Base_dCommon.v_bind (((((Elab_dMeta.v_rigForLinearDomain ec) sp) pname) rig) dom)) (fun (erasure : Core_dTerm.t_Rig) -> ((Base_dCommon.v_bind ((((((((v_checkBindersFuel (fuel - 1)) globals) ctx2) ec) pats) body) ((Core_dEval.v_applyClosure clo) v)) sp)) (fun (p : (Core_dTerm.t_Term, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match p with
  | { B_dData_dPair.f_Pair_first = dtb__548; B_dData_dPair.f_Pair_second = dtb__549 } -> (let inner2 = (if (((Elab_dMeta.v_isOpaqueRuntimeTyIn dtb__549) ctx) dom) then ((Elab_dMeta.v_wrapOpaqueUses (B_dData_dList.C_List__x58__x58_ (0, B_dData_dList.C_List_Nil))) dtb__548) else dtb__548) in (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Core_dTerm.C_Term_TLam (pname, erasure, B_dData_dMaybe.C_Maybe_Nothing, binderSp, inner2)); B_dData_dPair.f_Pair_second = dtb__549 })))
  | _ -> failwith "DT: impossible branch"
))))))))))

# 1591 "Vuna/Compiler/Elab/Trait.vuna"
let v_checkBinders = (fun (a1 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (a2 : Elab_dTypes.t_Ctx) (a3 : Elab_dTypes.t_Ec) (a4 : Frontend_dRast.t_Pat B_dData_dList.t_List) (a5 : Frontend_dRast.t_Expr) (a6 : Core_dTerm.t_Value) (a7 : Base_dSource.t_Span) -> ((((((((v_checkBindersFuel 512) a1) a2) a3) a4) a5) a6) a7))

# 1447 "Vuna/Compiler/Elab/Trait.vuna"
let v_checkDefIn = (fun (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx0 : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (pats : Frontend_dRast.t_Pat B_dData_dList.t_List) (body : Frontend_dRast.t_Expr) (expected : Core_dTerm.t_Value) (sp : Base_dSource.t_Span) -> (((((((v_checkBinders globals) ctx0) ec) pats) body) expected) sp))

# 1451 "Vuna/Compiler/Elab/Trait.vuna"
let v_checkDef = (fun (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ec : Elab_dTypes.t_Ec) (pats : Frontend_dRast.t_Pat B_dData_dList.t_List) (body : Frontend_dRast.t_Expr) (expected : Core_dTerm.t_Value) (sp : Base_dSource.t_Span) -> (((((((v_checkDefIn globals) Elab_dTypes.v_emptyCtx) ec) pats) body) expected) sp))

# 1567 "Vuna/Compiler/Elab/Trait.vuna"
let v_elabFunDefMulti = (fun (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx0 : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (clauses : (Frontend_dRast.t_Pat B_dData_dList.t_List, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (expected : Core_dTerm.t_Value) (sp : Base_dSource.t_Span) -> (let _u = (if (dtp_debug_on 0) then (dtp_debug_line "MULTI") else 0) in ((Base_dCommon.v_bind ((Base_dObs.v_obsCheck "vuna.elab.pats") (fun (_u : int) -> ((((Elab_dTerm.v_resolveOverFunPats ec) ctx0) expected) clauses)))) (fun (r : ((Frontend_dRast.t_Pat B_dData_dList.t_List, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match r with
  | { B_dData_dPair.f_Pair_first = dtb__550; B_dData_dPair.f_Pair_second = dtb__551 } -> (let table = (Elab_dMeta.v_ctorFamilyTable dtb__551) in ((Base_dCommon.v_bind ((Base_dObs.v_obsCheck "vuna.elab.pats") (fun (_u : int) -> ((Elab_dMatch.v_multiToExpr table) dtb__550)))) (fun (bodyExpr : Frontend_dRast.t_Expr) -> (let _u = (if (dtp_debug_on 0) then (dtp_debug_line "CHECKDEF") else 0) in (let checked = ((Base_dObs.v_obsCheck "vuna.elab.term") (fun (_u : int) -> (((((((v_checkDefIn globals) ctx0) dtb__551) B_dData_dList.C_List_Nil) bodyExpr) expected) sp))) in ((Base_dObs.v_obsCheck "vuna.elab.coverage") (fun (_u : int) -> ((((Elab_dCoverage.v_improveExhaustive table) (fun (_u : int) -> (Elab_dMatch.v_matrixOf dtb__550))) (Elab_dMatch.v_firstPatSpan dtb__550)) checked))))))))
  | _ -> failwith "DT: impossible branch"
)))))

# 1556 "Vuna/Compiler/Elab/Trait.vuna"
let v_elabFunDefIn = (fun (mc0 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc1 : Elab_dTypes.t_Ctx) (mc2 : Elab_dTypes.t_Ec) (mc3 : (Frontend_dRast.t_Pat B_dData_dList.t_List, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc4 : Core_dTerm.t_Value) (mc5 : Base_dSource.t_Span) -> (match mc3 with
  | B_dData_dList.C_List__x58__x58_ (dtb__552, dtb__553) -> (match dtb__552 with
  | { B_dData_dPair.f_Pair_first = dtb__554; B_dData_dPair.f_Pair_second = dtb__555 } -> (match dtb__553 with
  | B_dData_dList.C_List_Nil -> (if (Elab_dMatch.v_allVarPats dtb__554) then ((Base_dObs.v_obsCheck "vuna.elab.term") (fun (_u : int) -> (((((((v_checkDefIn mc0) mc1) mc2) dtb__554) dtb__555) mc4) mc5))) else ((((((v_elabFunDefMulti mc0) mc1) mc2) (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__554; B_dData_dPair.f_Pair_second = dtb__555 }, B_dData_dList.C_List_Nil))) mc4) mc5))
  | _ -> ((((((v_elabFunDefMulti mc0) mc1) mc2) mc3) mc4) mc5)
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> ((Base_dDiagnostics_dTc.v_tcErr0 mc5) Base_dDiagnostics_dTc.C_TcErr_FunctionNoClauses)
  | _ -> failwith "DT: impossible branch"
))

# 959 "Vuna/Compiler/Elab/Trait.vuna"
let v_elabInstanceMethodIn = (fun (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (mty : Core_dTerm.t_Term) (clauses : (Frontend_dRast.t_Pat B_dData_dList.t_List, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> ((((((v_elabFunDefIn globals) ctx) ec) clauses) ((Elab_dTypes.v_evalCtx ctx) mty)) (v_clauseSpanOf clauses)))

# 923 "Vuna/Compiler/Elab/Trait.vuna"
let rec v_elabInstanceMethodsGo = (fun (mc0 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc1 : Elab_dTypes.t_Ctx) (mc2 : int) (mc3 : Elab_dTypes.t_Ec) (mc4 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc5 : Core_dTerm.t_Term B_dData_dList.t_List) (mc6 : Frontend_dRast.t_Decl B_dData_dList.t_List) (mc7 : Core_dTerm.t_Term B_dData_dList.t_List) (mc8 : (Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc9 : Base_dSource.t_Span) -> (match mc4 with
  | B_dData_dList.C_List__x58__x58_ (dtb__556, dtb__557) -> (match dtb__556 with
  | { B_dData_dPair.f_Pair_first = dtb__558; B_dData_dPair.f_Pair_second = dtb__559 } -> (let clauses = ((v_methodClausesNamed dtb__558) mc6) in (let instTy = (((Core_dTerm.v_shift 0) mc2) ((v_substInstParams mc5) dtb__559)) in (match clauses with
  | B_dData_dList.C_List_Nil -> ((Base_dDiagnostics_dTc.v_tcErr0 mc9) Base_dDiagnostics_dTc.C_TcErr_InstanceMissingMethod)
  | _ -> ((Base_dCommon.v_bind (((((v_elabInstanceMethodIn mc0) mc1) mc3) instTy) clauses)) (fun (p : (Core_dTerm.t_Term, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match p with
  | { B_dData_dPair.f_Pair_first = dtb__560; B_dData_dPair.f_Pair_second = dtb__561 } -> ((((((((((v_elabInstanceMethodsGo mc0) mc1) mc2) dtb__561) dtb__557) mc5) mc6) (B_dData_dList.C_List__x58__x58_ (dtb__560, mc7))) (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__560; B_dData_dPair.f_Pair_second = Core_dTerm.C_Rig_RigOmega }, mc8))) mc9)
  | _ -> failwith "DT: impossible branch"
)))
)))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.v_reverse mc7); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = (B_dData_dList.v_reverse mc8); B_dData_dPair.f_Pair_second = mc3 } }))
  | _ -> failwith "DT: impossible branch"
))

# 854 "Vuna/Compiler/Elab/Trait.vuna"
let v_elabInstanceMethodsCtx = (fun (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (cls : Elab_dTypes.t_DtClass) (ctx : Elab_dTypes.t_Ctx) (nCtx : int) (headArgs : Core_dTerm.t_Term B_dData_dList.t_List) (ec : Elab_dTypes.t_Ec) (methods : Frontend_dRast.t_Decl B_dData_dList.t_List) (sp : Base_dSource.t_Span) -> ((((((((((v_elabInstanceMethodsGo globals) ctx) nCtx) ec) (v_zipClassFields cls)) headArgs) methods) B_dData_dList.C_List_Nil) B_dData_dList.C_List_Nil) sp))

# 349 "Vuna/Compiler/Elab/Trait.vuna"
let v_elabInstanceWithClass = (fun (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (allDecls : (Frontend_dRast.t_Decl, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List) (cls : Elab_dTypes.t_DtClass) (info : t_InstSigInfo) (ec0 : Elab_dTypes.t_Ec) (headExpr : Frontend_dRast.t_Expr) (methods : Frontend_dRast.t_Decl B_dData_dList.t_List) (msp : Base_dSource.t_Span) -> (match ((v_firstUnknownInstanceMethod cls) methods) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__562) -> (((Base_dDiagnostics_dTc.v_tcErr1 msp) (Base_dDiagnostics_dTc.C_TcErr_InstanceUnknownMethod (dtb__562))) dtb__562)
  | B_dData_dMaybe.C_Maybe_Nothing -> (match ((v_firstMissingInstanceMethod cls) methods) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__563) -> (match (((v_traitMethodSpanOf cls) dtb__563) allDecls) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__564) -> ((Base_dDiagnostics_dTc.v_tcErr0 dtb__564) Base_dDiagnostics_dTc.C_TcErr_InstanceMissingMethod)
  | B_dData_dMaybe.C_Maybe_Nothing -> ((Base_dDiagnostics_dTc.v_tcErr0 msp) Base_dDiagnostics_dTc.C_TcErr_InstanceMissingMethod)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> (let bodyCtx = (v_instBodyCtx info) in (let nCtx = (B_dData_dList.v_length (v_instSigCtx info)) in (let nTele = (B_dData_dList.v_length (v_instSigTele info)) in (let bodyDepth = (bi_natAdd nTele nCtx) in (let iname = ((Elab_dInstName.v_instanceName (Elab_dTypes.v_dtClassName cls)) headExpr) in ((Base_dCommon.v_bind ((((((((v_checkSuperClasses globals) bodyCtx) nCtx) iname) msp) (v_instSigArgs info)) (cls).Elab_dTypes.f_DtClass_dtClassSupers) ec0)) (fun (ecSuper : Elab_dTypes.t_Ec) -> ((Base_dCommon.v_bind ((((((((v_elabInstanceMethodsCtx globals) cls) bodyCtx) nCtx) (v_instSigArgs info)) ecSuper) methods) msp)) (fun (q : (Core_dTerm.t_Term B_dData_dList.t_List, ((Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let fieldTerms = (B_dData_dPair.v_firstOf q) in (let ec1 = (B_dData_dPair.v_secondOf (B_dData_dPair.v_secondOf q)) in (let solvedCtx = (((((v_solveCtxGoals bodyCtx) nCtx) nTele) ec1) B_dData_dList.C_List_Nil) in (let ctxSubs = (B_dData_dPair.v_firstOf solvedCtx) in (let ec2 = (B_dData_dPair.v_secondOf solvedCtx) in (let fields1 = ((B_dData_dList.v_map ((v_applyCtxSubstsTo nTele) ctxSubs)) fieldTerms) in ((Base_dCommon.v_bind (((((((v_resolveRigidGoals globals) bodyCtx) msp) (Elab_dTypes.v_ecNextConstraintId ec0)) (Elab_dTypes.v_ecPendingList ec2)) B_dData_dList.C_List_Nil) ec2)) (fun (r : ((int, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (let globSubs = (B_dData_dPair.v_firstOf r) in (let ec3 = (B_dData_dPair.v_secondOf r) in (let fields2 = ((B_dData_dList.v_map ((v_applyTermSubstsTo bodyDepth) globSubs)) fields1) in (let dictTerm = (((v_instValueOf info) (Elab_dMeta.v_dictCtorName (Elab_dTypes.v_dtClassName cls))) fields2) in (let dictTyTerm = (v_instTypeOf info) in (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = iname; B_dData_dPair.f_Pair_second = dictTyTerm }, B_dData_dList.C_List_Nil)); B_dData_dPair.f_Pair_second = ((Elab_dTypes.v_ecAddDef ec3) { B_dData_dPair.f_Pair_first = iname; B_dData_dPair.f_Pair_second = dictTerm }) }))))))))))))))))))))))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 399 "Vuna/Compiler/Elab/Trait.vuna"
let v_elabInstance = (fun (mc0 : (Frontend_dRast.t_Decl, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc1 : (Frontend_dRast.t_Decl, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc2 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc3 : Elab_dTypes.t_DtClass B_dData_dList.t_List) (mc4 : Elab_dTypes.t_DtData B_dData_dList.t_List) (mc5 : Elab_dTypes.t_Ec) (mc6 : (Frontend_dRast.t_Decl, Base_dSource.t_Span) B_dData_dPair.t_Pair) -> (match mc6 with
  | { B_dData_dPair.f_Pair_first = dtb__565; B_dData_dPair.f_Pair_second = dtb__566 } -> (match dtb__565 with
  | Frontend_dRast.C_Decl_DInstance (dtb__567, dtb__568, dtb__569, dtb__570) -> ((Base_dCommon.v_bind ((Base_dDiag.v_onErrDiag (Base_dDiag.v_withFallbackSpan dtb__570)) (((((((v_elabInstanceSig mc3) mc2) (Elab_dSig.v_definedNames ((B_dData_dList.v_map B_dData_dPair.v_firstOf) mc0))) mc5) dtb__570) dtb__568) dtb__567))) (fun (p : (t_InstSigInfo, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match p with
  | { B_dData_dPair.f_Pair_first = dtb__571; B_dData_dPair.f_Pair_second = dtb__572 } -> (match ((Elab_dDict.v_findClass (v_instSigClass dtb__571)) mc3) with
  | B_dData_dMaybe.C_Maybe_Nothing -> ((Base_dDiagnostics_dTc.v_tcErr0 dtb__570) Base_dDiagnostics_dTc.C_TcErr_InstanceHeadNotApp)
  | B_dData_dMaybe.C_Maybe_Just (dtb__573) -> (if ((((v_instanceLandingOk mc1) dtb__570) dtb__573) dtb__568) then ((((((((v_elabInstanceWithClass mc2) mc1) dtb__573) dtb__571) dtb__572) dtb__568) dtb__569) dtb__570) else ((Base_dDiagnostics_dTc.v_tcErr0 dtb__570) Base_dDiagnostics_dTc.C_TcErr_OrphanInstance))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> ((Elab_dTypes.v_errAt dtb__566) "DT: internal: expected an instance declaration")
)
  | _ -> failwith "DT: impossible branch"
))

# 963 "Vuna/Compiler/Elab/Trait.vuna"
let v_elabInstanceMethod = (fun (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ec : Elab_dTypes.t_Ec) (mty : Core_dTerm.t_Term) (clauses : (Frontend_dRast.t_Pat B_dData_dList.t_List, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (((((v_elabInstanceMethodIn globals) Elab_dTypes.v_emptyCtx) ec) mty) clauses))

# 1344 "Vuna/Compiler/Elab/Trait.vuna"
let rec v_elabInstanceBodiesGo = (fun (mc0 : bool) (mc1 : (Frontend_dRast.t_Decl, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc2 : (Frontend_dRast.t_Decl, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc3 : Elab_dTypes.t_DtClass B_dData_dList.t_List) (mc4 : Elab_dTypes.t_DtData B_dData_dList.t_List) (mc5 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc6 : Elab_dTypes.t_Ec) (mc7 : Elab_dTypes.t_DtDef B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__574, dtb__575) -> (match (((((((v_elabInstance (B_dData_dList.C_List__x58__x58_ (dtb__574, dtb__575))) mc2) mc5) mc3) mc4) mc6) dtb__574) with
  | Base_dDiag.C_Check_ErrC (dtb__576) -> (if mc0 then ((((((((v_elabInstanceBodiesGo mc0) dtb__575) mc2) mc3) mc4) mc5) ((Elab_dTypes.v_ecAddError mc6) dtb__576)) mc7) else (Base_dDiag.C_Check_ErrC (dtb__576)))
  | Base_dDiag.C_Check_OkC (dtb__577) -> (match dtb__577 with
  | { B_dData_dPair.f_Pair_first = dtb__578; B_dData_dPair.f_Pair_second = dtb__579 } -> (let newDefs = ((((v_instanceDefsOf mc6) dtb__579) (B_dData_dMaybe.C_Maybe_Just ((B_dData_dPair.v_secondOf dtb__574)))) dtb__578) in (let ecTbl = ((Elab_dTypes.v_ecPutGlobalsTbl dtb__579) ((((B_dContainer_dHashMap.v_insertAll B_dData_dString.v_Hashable_uString) B_dData_dString.v_Eq_uString) dtb__578) (Elab_dTypes.v_ecGlobalsTbl dtb__579))) in ((((((((v_elabInstanceBodiesGo mc0) dtb__575) mc2) mc3) mc4) ((B_dData_dList.v_append mc5) dtb__578)) ecTbl) ((B_dData_dList.v_append newDefs) mc7))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.v_reverse mc7); B_dData_dPair.f_Pair_second = mc6 }))
  | _ -> failwith "DT: impossible branch"
))

# 1332 "Vuna/Compiler/Elab/Trait.vuna"
let v_elabInstanceBodies = (fun (recover : bool) (allDecls : Frontend_dRast.t_Decl B_dData_dList.t_List) (classes : Elab_dTypes.t_DtClass B_dData_dList.t_List) (datas : Elab_dTypes.t_DtData B_dData_dList.t_List) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ec : Elab_dTypes.t_Ec) -> ((((((((v_elabInstanceBodiesGo recover) ((Elab_dMeta.v_collectInstDecls allDecls) B_dData_dList.C_List_Nil)) ((B_dData_dList.v_map (fun (d : Frontend_dRast.t_Decl) -> { B_dData_dPair.f_Pair_first = d; B_dData_dPair.f_Pair_second = (Frontend_dRast.v_declSpan d) })) allDecls)) classes) datas) globals) ec) B_dData_dList.C_List_Nil))

# 1403 "Vuna/Compiler/Elab/Trait.vuna"
let rec v_elabInstancesGo = (fun (mc0 : (Frontend_dRast.t_Decl, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc1 : Elab_dTypes.t_DtClass B_dData_dList.t_List) (mc2 : Elab_dTypes.t_DtData B_dData_dList.t_List) (mc3 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc4 : Elab_dTypes.t_Ec) (mc5 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__580, dtb__581) -> ((Base_dCommon.v_bind (((((((v_elabInstance (B_dData_dList.C_List__x58__x58_ (dtb__580, dtb__581))) B_dData_dList.C_List_Nil) mc3) mc1) mc2) mc4) dtb__580)) (fun (p : ((string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match p with
  | { B_dData_dPair.f_Pair_first = dtb__582; B_dData_dPair.f_Pair_second = dtb__583 } -> ((((((v_elabInstancesGo dtb__581) mc1) mc2) ((B_dData_dList.v_append mc3) dtb__582)) dtb__583) ((B_dData_dList.v_append dtb__582) mc5))
  | _ -> failwith "DT: impossible branch"
)))
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.v_reverse mc5); B_dData_dPair.f_Pair_second = mc4 }))
  | _ -> failwith "DT: impossible branch"
))

# 1400 "Vuna/Compiler/Elab/Trait.vuna"
let v_elabInstances = (fun (decls : (Frontend_dRast.t_Decl, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List) (classes : Elab_dTypes.t_DtClass B_dData_dList.t_List) (datas : Elab_dTypes.t_DtData B_dData_dList.t_List) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ec : Elab_dTypes.t_Ec) -> ((((((v_elabInstancesGo decls) classes) datas) globals) ec) B_dData_dList.C_List_Nil))

# 1588 "Vuna/Compiler/Elab/Trait.vuna"
let v_elabFunDef = (fun (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ec : Elab_dTypes.t_Ec) (clauses : (Frontend_dRast.t_Pat B_dData_dList.t_List, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (expected : Core_dTerm.t_Value) (sp : Base_dSource.t_Span) -> ((((((v_elabFunDefIn globals) Elab_dTypes.v_emptyCtx) ec) clauses) expected) sp))

# 1594 "Vuna/Compiler/Elab/Trait.vuna"
let v_bindIndexBinder = (fun (a1 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (a2 : Elab_dTypes.t_Ctx) (a3 : Elab_dTypes.t_Ec) (a4 : Core_dTerm.t_Rig) (a5 : string) (a6 : Core_dTerm.t_Value) (a7 : Core_dTerm.t_Closure) (a8 : Frontend_dRast.t_Pat B_dData_dList.t_List) (a9 : Frontend_dRast.t_Expr) (a10 : Base_dSource.t_Span) -> (((((((((((v_bindIndexBinderFuel 512) a1) a2) a3) a4) a5) a6) a7) a8) a9) a10))

# 1598 "Vuna/Compiler/Elab/Trait.vuna"
let v_bindOnePattern = (fun (a1 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (a2 : Elab_dTypes.t_Ctx) (a3 : Elab_dTypes.t_Ec) (a4 : Core_dTerm.t_Rig) (a5 : string) (a6 : Frontend_dRast.t_Pat B_dData_dList.t_List) (a7 : Frontend_dRast.t_Expr) (a8 : Core_dTerm.t_Value) (a9 : Core_dTerm.t_Closure) (a10 : Base_dSource.t_Span) (a11 : Base_dSource.t_Span) -> ((((((((((((v_bindOnePatternFuel 512) a1) a2) a3) a4) a5) a6) a7) a8) a9) a10) a11))
