open Vuna_runtime
type t_InstSigInfo = { f_InstSigInfo_instSigClass : string; f_InstSigInfo_instSigTele : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List; f_InstSigInfo_instSigCtx : Core_dTerm.t_Term B_dData_dList.t_List; f_InstSigInfo_instSigArgs : Core_dTerm.t_Term B_dData_dList.t_List; f_InstSigInfo_instSigHead : Core_dTerm.t_Term }
and t_DictGoalGroup = { f_DictGoalGroup_dictGoalGroupRep : int; f_DictGoalGroup_dictGoalGroupDom : Core_dTerm.t_Value; f_DictGoalGroup_dictGoalGroupExtras : int B_dData_dList.t_List }
and t_DictPlan = { f_DictPlan_dpName : string; f_DictPlan_dpLevel : int; f_DictPlan_dpDom : Core_dTerm.t_Term; f_DictPlan_dpMetas : int B_dData_dList.t_List }

# 30 "Vuna/Compiler/Elab/Trait.vuna"
let rec v_bindClassParams = (fun (dtb_u_u1 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u2 : Elab_dTypes.t_Ctx) -> (match dtb_u_u1 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u3, dtb_u_u4) -> (match dtb_u_u3 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u5; B_dData_dPair.f_Pair_second = dtb_u_u6 } -> ((v_bindClassParams dtb_u_u4) (((Elab_dTypes.v_ctxBind dtb_u_u5) dtb_u_u6) dtb_u_u2))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> dtb_u_u2
  | _ -> failwith "DT: impossible branch"
))

# 39 "Vuna/Compiler/Elab/Trait.vuna"
let rec v_classFieldTysGo = (fun (dtb_u_u7 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u8 : Elab_dTypes.t_Ctx) (dtb_u_u9 : Elab_dTypes.t_Ec) (dtb_u_u10 : (string, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u11 : Core_dTerm.t_Term B_dData_dList.t_List) -> (match dtb_u_u10 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u12, dtb_u_u13) -> (match dtb_u_u12 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u14; B_dData_dPair.f_Pair_second = dtb_u_u15 } -> ((Base_dCommon.v_bind ((((Elab_dTerm.v_checkType dtb_u_u7) dtb_u_u8) dtb_u_u9) (((Elab_dSig.v_quantifyTraitSig (fun (dtb_u_u16 : string) -> (B_dData_dMaybe.v_isJust ((Elab_dTypes.v_ctxLookup dtb_u_u16) dtb_u_u8)))) dtb_u_u15) (Frontend_dAst.v_exprSpan dtb_u_u15)))) (fun (dtb_u_u17 : (Core_dTerm.t_Term, (Core_dTerm.t_Level, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let dtb_u_u18 = dtb_u_u17 in (match dtb_u_u18 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u19; B_dData_dPair.f_Pair_second = dtb_u_u20 } -> (match dtb_u_u20 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u21; B_dData_dPair.f_Pair_second = dtb_u_u22 } -> (((((v_classFieldTysGo dtb_u_u7) dtb_u_u8) dtb_u_u22) dtb_u_u13) (B_dData_dList.C_List__x58__x58_ (dtb_u_u19, dtb_u_u11)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.v_reverse dtb_u_u11); B_dData_dPair.f_Pair_second = dtb_u_u9 }))
  | _ -> failwith "DT: impossible branch"
))

# 35 "Vuna/Compiler/Elab/Trait.vuna"
let v_classFieldTys = (fun (dtb_u_u23 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u24 : Elab_dTypes.t_Ec) (dtb_u_u25 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u26 : (string, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (((((v_classFieldTysGo dtb_u_u23) ((v_bindClassParams dtb_u_u25) Elab_dTypes.v_emptyCtx)) dtb_u_u24) dtb_u_u26) B_dData_dList.C_List_Nil))

# 54 "Vuna/Compiler/Elab/Trait.vuna"
let rec v_foldlAddDef = (fun (dtb_u_u27 : Elab_dTypes.t_Ec) (dtb_u_u28 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match dtb_u_u28 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u29, dtb_u_u30) -> ((v_foldlAddDef ((Elab_dTypes.v_ecAddDef dtb_u_u27) dtb_u_u29)) dtb_u_u30)
  | B_dData_dList.C_List_Nil -> dtb_u_u27
  | _ -> failwith "DT: impossible branch"
))

# 65 "Vuna/Compiler/Elab/Trait.vuna"
let[@tail_mod_cons] rec v_foldPiFieldTysGo = (fun (dtb_u_u31 : Core_dTerm.t_Term B_dData_dList.t_List) (dtb_u_u32 : int) (dtb_u_u33 : Core_dTerm.t_Term) -> (match dtb_u_u31 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u34, dtb_u_u35) -> (Core_dTerm.C_Term_TPi ("_", false, Core_dTerm.C_Rig_RigOmega, (((Core_dTerm.v_shift 0) dtb_u_u32) dtb_u_u34), (((v_foldPiFieldTysGo dtb_u_u35) (dtb_u_u32 + 1)) dtb_u_u33)))
  | B_dData_dList.C_List_Nil -> dtb_u_u33
  | _ -> failwith "DT: impossible branch"
))

# 62 "Vuna/Compiler/Elab/Trait.vuna"
let v_foldPiFieldTys = (fun (dtb_u_u36 : Core_dTerm.t_Term B_dData_dList.t_List) (dtb_u_u37 : Core_dTerm.t_Term) -> (((v_foldPiFieldTysGo dtb_u_u36) 0) dtb_u_u37))

# 128 "Vuna/Compiler/Elab/Trait.vuna"
let[@tail_mod_cons] rec v_classParamKinds = (fun (dtb_u_u38 : string B_dData_dList.t_List) (dtb_u_u39 : (string, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match dtb_u_u38 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u40, dtb_u_u41) -> (B_dData_dList.C_List__x58__x58_ (((Elab_dSig.v_classParamKindOf dtb_u_u40) dtb_u_u39), ((v_classParamKinds dtb_u_u41) dtb_u_u39)))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 133 "Vuna/Compiler/Elab/Trait.vuna"
let[@tail_mod_cons] rec v_traitParamNames = (fun (dtb_u_u42 : Frontend_dAst.t_TraitParam B_dData_dList.t_List) -> (match dtb_u_u42 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u43, dtb_u_u44) -> (match dtb_u_u43 with
  | { Frontend_dAst.f_TraitParam_traitParamName = dtb_u_u45; Frontend_dAst.f_TraitParam_traitParamKind = dtb_u_u46 } -> (B_dData_dList.C_List__x58__x58_ (dtb_u_u45, (v_traitParamNames dtb_u_u44)))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 137 "Vuna/Compiler/Elab/Trait.vuna"
let rec v_traitParamKinds = (fun (dtb_u_u47 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u48 : Elab_dTypes.t_Ec) (dtb_u_u49 : Frontend_dAst.t_TraitParam B_dData_dList.t_List) (dtb_u_u50 : (string, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match dtb_u_u49 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u51, dtb_u_u52) -> (match dtb_u_u51 with
  | { Frontend_dAst.f_TraitParam_traitParamName = dtb_u_u53; Frontend_dAst.f_TraitParam_traitParamKind = dtb_u_u54 } -> (match dtb_u_u54 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u55) -> (((((v_traitKindExplicit dtb_u_u47) dtb_u_u48) dtb_u_u55) dtb_u_u52) dtb_u_u50)
  | B_dData_dMaybe.C_Maybe_Nothing -> (((((v_traitKindInfer dtb_u_u47) dtb_u_u48) dtb_u_u53) dtb_u_u52) dtb_u_u50)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = dtb_u_u48 }))
  | _ -> failwith "DT: impossible branch"
))
# 144 "Vuna/Compiler/Elab/Trait.vuna"
and v_traitKindExplicit = (fun (dtb_u_u56 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u57 : Elab_dTypes.t_Ec) (dtb_u_u58 : Frontend_dAst.t_Expr) (dtb_u_u59 : Frontend_dAst.t_TraitParam B_dData_dList.t_List) (dtb_u_u60 : (string, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> ((Base_dCommon.v_bind ((((Elab_dTerm.v_checkType dtb_u_u56) Elab_dTypes.v_emptyCtx) dtb_u_u57) dtb_u_u58)) (fun (dtb_u_u61 : (Core_dTerm.t_Term, (Core_dTerm.t_Level, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let dtb_u_u62 = dtb_u_u61 in (match dtb_u_u62 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u63; B_dData_dPair.f_Pair_second = dtb_u_u64 } -> (match dtb_u_u64 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u65; B_dData_dPair.f_Pair_second = dtb_u_u66 } -> ((Base_dCommon.v_bind ((((v_traitParamKinds dtb_u_u56) dtb_u_u66) dtb_u_u59) dtb_u_u60)) (fun (dtb_u_u67 : (Core_dTerm.t_Term B_dData_dList.t_List, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match dtb_u_u67 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u68; B_dData_dPair.f_Pair_second = dtb_u_u69 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ (dtb_u_u63, dtb_u_u68)); B_dData_dPair.f_Pair_second = dtb_u_u69 }))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))))
# 157 "Vuna/Compiler/Elab/Trait.vuna"
and v_traitKindInfer = (fun (dtb_u_u70 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u71 : Elab_dTypes.t_Ec) (dtb_u_u72 : string) (dtb_u_u73 : Frontend_dAst.t_TraitParam B_dData_dList.t_List) (dtb_u_u74 : (string, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> ((Base_dCommon.v_bind ((((v_traitParamKinds dtb_u_u70) dtb_u_u71) dtb_u_u73) dtb_u_u74)) (fun (dtb_u_u75 : (Core_dTerm.t_Term B_dData_dList.t_List, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match dtb_u_u75 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u76; B_dData_dPair.f_Pair_second = dtb_u_u77 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ (((Elab_dSig.v_classParamKindOf dtb_u_u72) dtb_u_u74), dtb_u_u76)); B_dData_dPair.f_Pair_second = dtb_u_u77 }))
  | _ -> failwith "DT: impossible branch"
))))

# 166 "Vuna/Compiler/Elab/Trait.vuna"
let[@tail_mod_cons] rec v_foldParamPis = (fun (dtb_u_u78 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u79 : Core_dTerm.t_Term) -> (match dtb_u_u78 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u80, dtb_u_u81) -> (match dtb_u_u80 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u82; B_dData_dPair.f_Pair_second = dtb_u_u83 } -> (Core_dTerm.C_Term_TPi (dtb_u_u82, true, Core_dTerm.C_Rig_Rig0, dtb_u_u83, ((v_foldParamPis dtb_u_u81) dtb_u_u79)))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> dtb_u_u79
  | _ -> failwith "DT: impossible branch"
))

# 174 "Vuna/Compiler/Elab/Trait.vuna"
let[@tail_mod_cons] rec v_dictParamArgs = (fun (dtb_u_u84 : string B_dData_dList.t_List) (dtb_u_u85 : int) -> (match dtb_u_u84 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u86, dtb_u_u87) -> (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = (Core_dTerm.C_Term_TVar (dtb_u_u86, dtb_u_u85, { Base_dSource.f_Span_spanFile = ""; Base_dSource.f_Span_spanStartLine = 0; Base_dSource.f_Span_spanStartCol = 0; Base_dSource.f_Span_spanEndLine = 0; Base_dSource.f_Span_spanEndCol = 0; Base_dSource.f_Span_spanStartOffset = 0; Base_dSource.f_Span_spanEndOffset = 0 })); B_dData_dPair.f_Pair_second = Core_dTerm.C_Rig_Rig0 }, ((v_dictParamArgs dtb_u_u87) (dtb_u_u85 - 1))))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 171 "Vuna/Compiler/Elab/Trait.vuna"
let v_dictAppTermOf = (fun (dtb_u_u88 : string) (dtb_u_u89 : string B_dData_dList.t_List) -> ((Elab_dMeta.v_foldAppTerms (Core_dTerm.C_Term_TGlobal (dtb_u_u88))) ((v_dictParamArgs dtb_u_u89) ((B_dData_dList.v_length dtb_u_u89) - 1))))

# 179 "Vuna/Compiler/Elab/Trait.vuna"
let[@tail_mod_cons] rec v_traitMethodPairs = (fun (dtb_u_u90 : Frontend_dAst.t_TraitMethod B_dData_dList.t_List) -> (match dtb_u_u90 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u91, dtb_u_u92) -> (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.v_traitMethodName dtb_u_u91); B_dData_dPair.f_Pair_second = (dtb_u_u91).Frontend_dAst.f_TraitMethod_traitMethodType }, (v_traitMethodPairs dtb_u_u92)))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 202 "Vuna/Compiler/Elab/Trait.vuna"
let v_methodProjType = (fun (dtb_u_u93 : string) (dtb_u_u94 : string B_dData_dList.t_List) (dtb_u_u95 : Core_dTerm.t_Term B_dData_dList.t_List) (dtb_u_u96 : Core_dTerm.t_Term) -> (let dtb_u_u97 = (Core_dTerm.C_Term_TPi ("_", true, Core_dTerm.C_Rig_RigOmega, ((v_dictAppTermOf (Elab_dMeta.v_dictTypeName dtb_u_u93)) dtb_u_u94), (((Core_dTerm.v_shift 0) 1) dtb_u_u96))) in ((v_foldParamPis ((B_dData_dList.v_zip dtb_u_u94) dtb_u_u95)) dtb_u_u97)))

# 194 "Vuna/Compiler/Elab/Trait.vuna"
let[@tail_mod_cons] rec v_methodProjZip = (fun (dtb_u_u98 : string) (dtb_u_u99 : string B_dData_dList.t_List) (dtb_u_u100 : Core_dTerm.t_Term B_dData_dList.t_List) (dtb_u_u101 : int) (dtb_u_u102 : (string, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u103 : Core_dTerm.t_Term B_dData_dList.t_List) -> (match dtb_u_u102 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u104, dtb_u_u105) -> (match dtb_u_u104 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u106; B_dData_dPair.f_Pair_second = dtb_u_u107 } -> (match dtb_u_u103 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u108, dtb_u_u109) -> (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb_u_u106; B_dData_dPair.f_Pair_second = ((((v_methodProjType dtb_u_u98) dtb_u_u99) dtb_u_u100) dtb_u_u108) }, ((((((v_methodProjZip dtb_u_u98) dtb_u_u99) dtb_u_u100) (dtb_u_u101 + 1)) dtb_u_u105) dtb_u_u109)))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 190 "Vuna/Compiler/Elab/Trait.vuna"
let v_methodProjections = (fun (dtb_u_u110 : string) (dtb_u_u111 : string B_dData_dList.t_List) (dtb_u_u112 : Core_dTerm.t_Term B_dData_dList.t_List) (dtb_u_u113 : (string, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u114 : Core_dTerm.t_Term B_dData_dList.t_List) -> ((((((v_methodProjZip dtb_u_u110) dtb_u_u111) dtb_u_u112) 0) dtb_u_u113) dtb_u_u114))

# 242 "Vuna/Compiler/Elab/Trait.vuna"
let[@tail_mod_cons] rec v_projectionParamLams = (fun (dtb_u_u115 : string B_dData_dList.t_List) (dtb_u_u116 : Core_dTerm.t_Term) -> (match dtb_u_u115 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u117, dtb_u_u118) -> (Core_dTerm.C_Term_TLam (dtb_u_u117, Core_dTerm.C_Rig_Rig0, B_dData_dMaybe.C_Maybe_Nothing, Base_dSource.v_spanEmpty, ((v_projectionParamLams dtb_u_u118) dtb_u_u116)))
  | B_dData_dList.C_List_Nil -> dtb_u_u116
  | _ -> failwith "DT: impossible branch"
))

# 247 "Vuna/Compiler/Elab/Trait.vuna"
let v_projectionParamNames = (fun (dtb_u_u119 : int) -> (if (dtb_u_u119 = 1) then (B_dData_dList.C_List__x58__x58_ ("_p", B_dData_dList.C_List_Nil)) else ((B_dData_dList.v_map (fun (dtb_u_u120 : int) -> ("_p" ^ ((B_dTrait_dInterp.v_interp (B_dTrait_dInterp.v_Interp_uc9feaa570847b590_ua B_dData_dInt.v_Show_u0077d73cf424e521_uInt)) dtb_u_u120)))) ((B_dData_dList.v_range 0) dtb_u_u119))))

# 223 "Vuna/Compiler/Elab/Trait.vuna"
let v_projectionBodyOpaque = (fun (dtb_u_u121 : bool) (dtb_u_u122 : string) (dtb_u_u123 : int) (dtb_u_u124 : Core_dTerm.t_Rig B_dData_dList.t_List) (dtb_u_u125 : int) (dtb_u_u126 : int) -> (let dtb_u_u127 = (B_dData_dList.v_length dtb_u_u124) in (let dtb_u_u128 = dtb_u_u127 in (let dtb_u_u129 = (Core_dTerm.C_Term_TVar ((Elab_dMeta.v_fieldVarName dtb_u_u123), ((dtb_u_u125 - 1) - dtb_u_u123), { Base_dSource.f_Span_spanFile = ""; Base_dSource.f_Span_spanStartLine = 0; Base_dSource.f_Span_spanStartCol = 0; Base_dSource.f_Span_spanEndLine = 0; Base_dSource.f_Span_spanEndCol = 0; Base_dSource.f_Span_spanStartOffset = 0; Base_dSource.f_Span_spanEndOffset = 0 })) in (let dtb_u_u130 = ((Elab_dMeta.v_methodArgTerms dtb_u_u124) dtb_u_u125) in (let dtb_u_u131 = ((Elab_dMeta.v_foldAppTerms dtb_u_u129) dtb_u_u130) in (let dtb_u_u132 = (if dtb_u_u121 then ((Elab_dMeta.v_wrapOpaqueUses (B_dData_dList.C_List__x58__x58_ (((dtb_u_u125 - 1) - dtb_u_u123), B_dData_dList.C_List_Nil))) dtb_u_u131) else dtb_u_u131) in (let dtb_u_u133 = (Core_dTerm.v_bindersOfPairs (Elab_dMeta.v_fieldBinderNames dtb_u_u125)) in (let dtb_u_u134 = { Core_dTerm.f_CaseAlt_caseAltName = dtb_u_u122; Core_dTerm.f_CaseAlt_caseAltBinders = dtb_u_u133; Core_dTerm.f_CaseAlt_caseAltBody = dtb_u_u132 } in (let dtb_u_u135 = (Core_dTerm.C_Term_TCase ((Core_dTerm.C_Term_TVar ("_d", dtb_u_u128, { Base_dSource.f_Span_spanFile = ""; Base_dSource.f_Span_spanStartLine = 0; Base_dSource.f_Span_spanStartCol = 0; Base_dSource.f_Span_spanEndLine = 0; Base_dSource.f_Span_spanEndCol = 0; Base_dSource.f_Span_spanStartOffset = 0; Base_dSource.f_Span_spanEndOffset = 0 })), (B_dData_dList.C_List__x58__x58_ (dtb_u_u134, B_dData_dList.C_List_Nil)))) in (let dtb_u_u136 = (((Elab_dMeta.v_methodArgLams dtb_u_u124) 0) dtb_u_u135) in ((v_projectionParamLams (v_projectionParamNames dtb_u_u126)) (Core_dTerm.C_Term_TLam ("_d", Core_dTerm.C_Rig_RigOmega, B_dData_dMaybe.C_Maybe_Nothing, Base_dSource.v_spanEmpty, dtb_u_u136))))))))))))))

# 215 "Vuna/Compiler/Elab/Trait.vuna"
let v_projectionBody = (fun (dtb_u_u137 : string) (dtb_u_u138 : int) (dtb_u_u139 : Core_dTerm.t_Rig B_dData_dList.t_List) (dtb_u_u140 : int) (dtb_u_u141 : int) -> ((((((v_projectionBodyOpaque false) dtb_u_u137) dtb_u_u138) dtb_u_u139) dtb_u_u140) dtb_u_u141))

# 268 "Vuna/Compiler/Elab/Trait.vuna"
let rec v_flagAt = (fun (dtb_u_u142 : int) (dtb_u_u143 : bool B_dData_dList.t_List) -> (match dtb_u_u143 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u144, dtb_u_u145) -> (if (dtb_u_u142 <= 0) then dtb_u_u144 else ((v_flagAt (dtb_u_u142 - 1)) dtb_u_u145))
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 260 "Vuna/Compiler/Elab/Trait.vuna"
let[@tail_mod_cons] rec v_projectionDefsOpaqueGo = (fun (dtb_u_u146 : bool B_dData_dList.t_List) (dtb_u_u147 : string) (dtb_u_u148 : int) (dtb_u_u149 : (string, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u150 : Core_dTerm.t_Term B_dData_dList.t_List) (dtb_u_u151 : int) (dtb_u_u152 : int) -> (match dtb_u_u149 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u153, dtb_u_u154) -> (match dtb_u_u153 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u155; B_dData_dPair.f_Pair_second = dtb_u_u156 } -> (match dtb_u_u150 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u157, dtb_u_u158) -> (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb_u_u155; B_dData_dPair.f_Pair_second = ((((((v_projectionBodyOpaque ((v_flagAt dtb_u_u151) dtb_u_u146)) dtb_u_u147) dtb_u_u151) ((Elab_dSig.v_methodArgRigsOf Elab_dMeta.v_piBinderRig) dtb_u_u157)) dtb_u_u152) dtb_u_u148) }, (((((((v_projectionDefsOpaqueGo dtb_u_u146) dtb_u_u147) dtb_u_u148) dtb_u_u154) dtb_u_u158) (dtb_u_u151 + 1)) dtb_u_u152)))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 256 "Vuna/Compiler/Elab/Trait.vuna"
let v_projectionDefsOpaque = (fun (dtb_u_u159 : bool B_dData_dList.t_List) (dtb_u_u160 : string) (dtb_u_u161 : int) (dtb_u_u162 : (string, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u163 : Core_dTerm.t_Term B_dData_dList.t_List) (dtb_u_u164 : int) -> (((((((v_projectionDefsOpaqueGo dtb_u_u159) (Elab_dMeta.v_dictCtorName dtb_u_u160)) dtb_u_u161) dtb_u_u162) dtb_u_u163) 0) dtb_u_u164))

# 251 "Vuna/Compiler/Elab/Trait.vuna"
let v_projectionDefs = (fun (dtb_u_u165 : string) (dtb_u_u166 : int) (dtb_u_u167 : (string, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u168 : Core_dTerm.t_Term B_dData_dList.t_List) (dtb_u_u169 : int) -> ((((((v_projectionDefsOpaque ((B_dData_dList.v_map (fun (dtb_u_u170 : Core_dTerm.t_Term) -> false)) dtb_u_u168)) dtb_u_u165) dtb_u_u166) dtb_u_u167) dtb_u_u168) dtb_u_u169))

# 272 "Vuna/Compiler/Elab/Trait.vuna"
let v_projectionDefsGo = (fun (dtb_u_u171 : string) (dtb_u_u172 : int) (dtb_u_u173 : (string, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u174 : Core_dTerm.t_Term B_dData_dList.t_List) (dtb_u_u175 : int) (dtb_u_u176 : int) -> (((((((v_projectionDefsOpaqueGo ((B_dData_dList.v_map (fun (dtb_u_u177 : Core_dTerm.t_Term) -> false)) dtb_u_u174)) dtb_u_u171) dtb_u_u172) dtb_u_u173) dtb_u_u174) dtb_u_u175) dtb_u_u176))

# 282 "Vuna/Compiler/Elab/Trait.vuna"
let v_declTopName = (fun (dtb_u_u178 : Frontend_dAst.t_Decl) -> (match dtb_u_u178 with
  | Frontend_dAst.C_Decl_DTrait (dtb_u_u179, dtb_u_u180, dtb_u_u181, dtb_u_u182, dtb_u_u183) -> (B_dData_dMaybe.C_Maybe_Just (dtb_u_u179))
  | Frontend_dAst.C_Decl_DRecord (dtb_u_u184, dtb_u_u185, dtb_u_u186, dtb_u_u187, dtb_u_u188, dtb_u_u189, dtb_u_u190, dtb_u_u191) -> (B_dData_dMaybe.C_Maybe_Just (dtb_u_u184))
  | Frontend_dAst.C_Decl_DData (dtb_u_u192, dtb_u_u193, dtb_u_u194, dtb_u_u195, dtb_u_u196, dtb_u_u197, dtb_u_u198, dtb_u_u199, dtb_u_u200) -> (B_dData_dMaybe.C_Maybe_Just (dtb_u_u192))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
))

# 288 "Vuna/Compiler/Elab/Trait.vuna"
let rec v_declNamedInFile = (fun (dtb_u_u201 : (Frontend_dAst.t_Decl, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u202 : string) (dtb_u_u203 : string) -> (match dtb_u_u201 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u204, dtb_u_u205) -> (match dtb_u_u204 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u206; B_dData_dPair.f_Pair_second = dtb_u_u207 } -> (match (v_declTopName dtb_u_u206) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u208) -> (if (if (dtb_u_u208 = dtb_u_u202) then ((dtb_u_u207).Base_dSource.f_Span_spanFile = dtb_u_u203) else false) then true else (((v_declNamedInFile dtb_u_u205) dtb_u_u202) dtb_u_u203))
  | B_dData_dMaybe.C_Maybe_Nothing -> (((v_declNamedInFile dtb_u_u205) dtb_u_u202) dtb_u_u203)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 295 "Vuna/Compiler/Elab/Trait.vuna"
let rec v_headTypeNameOf = (fun (dtb_u_u209 : Frontend_dAst.t_Expr) -> (match dtb_u_u209 with
  | Frontend_dAst.C_Expr_EApp (dtb_u_u210, dtb_u_u211, dtb_u_u212) -> (v_headTypeNameOf dtb_u_u210)
  | Frontend_dAst.C_Expr_EVar (dtb_u_u213, dtb_u_u214) -> (B_dData_dMaybe.C_Maybe_Just (dtb_u_u213))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
))

# 300 "Vuna/Compiler/Elab/Trait.vuna"
let[@tail_mod_cons] rec v_headTypeNamesOf = (fun (dtb_u_u215 : Frontend_dAst.t_Expr B_dData_dList.t_List) -> (match dtb_u_u215 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u216, dtb_u_u217) -> (match (v_headTypeNameOf dtb_u_u216) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u218) -> (B_dData_dList.C_List__x58__x58_ (dtb_u_u218, (v_headTypeNamesOf dtb_u_u217)))
  | B_dData_dMaybe.C_Maybe_Nothing -> (v_headTypeNamesOf dtb_u_u217)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 309 "Vuna/Compiler/Elab/Trait.vuna"
let v_isGlobalHeadType = (fun (dtb_u_u219 : string) -> (if (if (if (dtb_u_u219 = "Int") then true else (dtb_u_u219 = "String")) then true else (dtb_u_u219 = "Float")) then true else (dtb_u_u219 = "Array")))

# 318 "Vuna/Compiler/Elab/Trait.vuna"
let rec v_anyDeclInFile = (fun (dtb_u_u220 : (Frontend_dAst.t_Decl, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u221 : string B_dData_dList.t_List) (dtb_u_u222 : string) -> (match dtb_u_u221 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u223, dtb_u_u224) -> (if (((v_declNamedInFile dtb_u_u220) dtb_u_u223) dtb_u_u222) then true else (((v_anyDeclInFile dtb_u_u220) dtb_u_u224) dtb_u_u222))
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 323 "Vuna/Compiler/Elab/Trait.vuna"
let rec v_anyGlobalHead = (fun (dtb_u_u225 : string B_dData_dList.t_List) -> (match dtb_u_u225 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u226, dtb_u_u227) -> (if (v_isGlobalHeadType dtb_u_u226) then true else (v_anyGlobalHead dtb_u_u227))
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 423 "Vuna/Compiler/Elab/Trait.vuna"
let v_instanceHeadParts = (fun (dtb_u_u228 : Frontend_dAst.t_Expr) -> (match dtb_u_u228 with
  | Frontend_dAst.C_Expr_EApp (dtb_u_u229, dtb_u_u230, dtb_u_u231) -> (match dtb_u_u229 with
  | Frontend_dAst.C_Expr_EVar (dtb_u_u232, dtb_u_u233) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = dtb_u_u232; B_dData_dPair.f_Pair_second = dtb_u_u230 }))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | Frontend_dAst.C_Expr_EVar (dtb_u_u234, dtb_u_u235) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = dtb_u_u234; B_dData_dPair.f_Pair_second = B_dData_dList.C_List_Nil }))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
))

# 312 "Vuna/Compiler/Elab/Trait.vuna"
let v_instanceHeadTypeNames = (fun (dtb_u_u236 : Frontend_dAst.t_Expr) -> (let dtb_u_u237 = (v_instanceHeadParts dtb_u_u236) in (match dtb_u_u237 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u238) -> (match dtb_u_u238 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u239; B_dData_dPair.f_Pair_second = dtb_u_u240 } -> (v_headTypeNamesOf dtb_u_u240)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
)))

# 327 "Vuna/Compiler/Elab/Trait.vuna"
let v_instanceLandingOk = (fun (dtb_u_u241 : (Frontend_dAst.t_Decl, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u242 : Base_dSource.t_Span) (dtb_u_u243 : Elab_dTypes.t_DtClass) (dtb_u_u244 : Frontend_dAst.t_Expr) -> (let dtb_u_u245 = (dtb_u_u242).Base_dSource.f_Span_spanFile in (let dtb_u_u246 = (v_instanceHeadTypeNames dtb_u_u244) in (if (if (((v_declNamedInFile dtb_u_u241) (Elab_dTypes.v_dtClassName dtb_u_u243)) dtb_u_u245) then true else (((v_anyDeclInFile dtb_u_u241) dtb_u_u246) dtb_u_u245)) then true else (v_anyGlobalHead dtb_u_u246)))))

# 439 "Vuna/Compiler/Elab/Trait.vuna"
let v_instanceConstraintParts = (fun (dtb_u_u247 : Frontend_dAst.t_Expr) -> (match dtb_u_u247 with
  | Frontend_dAst.C_Expr_EVar (dtb_u_u248, dtb_u_u249) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = dtb_u_u248; B_dData_dPair.f_Pair_second = B_dData_dList.C_List_Nil }))
  | Frontend_dAst.C_Expr_EApp (dtb_u_u250, dtb_u_u251, dtb_u_u252) -> (match dtb_u_u250 with
  | Frontend_dAst.C_Expr_EVar (dtb_u_u253, dtb_u_u254) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = dtb_u_u253; B_dData_dPair.f_Pair_second = dtb_u_u251 }))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
))

# 431 "Vuna/Compiler/Elab/Trait.vuna"
let rec v_constraintPartsOf = (fun (dtb_u_u255 : Base_dSource.t_Span) (dtb_u_u256 : Frontend_dAst.t_Expr B_dData_dList.t_List) -> (match dtb_u_u256 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u257, dtb_u_u258) -> (match (v_instanceConstraintParts dtb_u_u257) with
  | B_dData_dMaybe.C_Maybe_Nothing -> ((Base_dDiagnostics_dTc.v_tcErr0 dtb_u_u255) Base_dDiagnostics_dTc.C_TcErr_ConstraintNotDict)
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u259) -> ((Base_dCommon.v_bind ((v_constraintPartsOf dtb_u_u255) dtb_u_u258)) (fun (dtb_u_u260 : (string, Frontend_dAst.t_Expr B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((B_dData_dList.C_List__x58__x58_ (dtb_u_u259, dtb_u_u260))))))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (B_dData_dList.C_List_Nil))
  | _ -> failwith "DT: impossible branch"
))

# 526 "Vuna/Compiler/Elab/Trait.vuna"
let rec v_checkArgsAtKinds = (fun (dtb_u_u261 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u262 : Elab_dTypes.t_Ctx) (dtb_u_u263 : Elab_dTypes.t_Ec) (dtb_u_u264 : Frontend_dAst.t_Expr B_dData_dList.t_List) (dtb_u_u265 : Core_dTerm.t_Value B_dData_dList.t_List) (dtb_u_u266 : Base_dSource.t_Span) -> (match dtb_u_u264 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u267, dtb_u_u268) -> (match dtb_u_u265 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u269, dtb_u_u270) -> ((Base_dCommon.v_bind ((((((Elab_dTerm_dImpl.v_checkTypeAtKind dtb_u_u261) dtb_u_u262) dtb_u_u263) dtb_u_u267) dtb_u_u269) dtb_u_u266)) (fun (dtb_u_u271 : (Core_dTerm.t_Term, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match dtb_u_u271 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u272; B_dData_dPair.f_Pair_second = dtb_u_u273 } -> ((Base_dCommon.v_bind ((((((v_checkArgsAtKinds dtb_u_u261) dtb_u_u262) dtb_u_u273) dtb_u_u268) dtb_u_u270) dtb_u_u266)) (fun (dtb_u_u274 : (Core_dTerm.t_Term B_dData_dList.t_List, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match dtb_u_u274 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u275; B_dData_dPair.f_Pair_second = dtb_u_u276 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ (dtb_u_u272, dtb_u_u275)); B_dData_dPair.f_Pair_second = dtb_u_u276 }))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> ((Base_dDiagnostics_dTc.v_tcErr0 dtb_u_u266) Base_dDiagnostics_dTc.C_TcErr_InstanceHeadNotApp)
)
  | B_dData_dList.C_List_Nil -> (match dtb_u_u265 with
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = dtb_u_u263 }))
  | _ -> ((Base_dDiagnostics_dTc.v_tcErr0 dtb_u_u266) Base_dDiagnostics_dTc.C_TcErr_InstanceHeadNotApp)
)
  | _ -> failwith "DT: impossible branch"
))

# 554 "Vuna/Compiler/Elab/Trait.vuna"
let rec v_closedTypeTerm = (fun (dtb_u_u277 : Frontend_dAst.t_Expr) -> (match dtb_u_u277 with
  | Frontend_dAst.C_Expr_EApp (dtb_u_u278, dtb_u_u279, dtb_u_u280) -> (match (v_closedTypeTerm dtb_u_u278) with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u281) -> (match (v_closedTypeArgs dtb_u_u279) with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u282) -> (B_dData_dMaybe.C_Maybe_Just (((Elab_dMeta.v_foldAppTerms dtb_u_u281) dtb_u_u282)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Frontend_dAst.C_Expr_EVar (dtb_u_u283, dtb_u_u284) -> (B_dData_dMaybe.C_Maybe_Just ((Core_dTerm.C_Term_TGlobal (dtb_u_u283))))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
))
# 565 "Vuna/Compiler/Elab/Trait.vuna"
and v_closedTypeArgs = (fun (dtb_u_u285 : Frontend_dAst.t_Expr B_dData_dList.t_List) -> (match dtb_u_u285 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u286, dtb_u_u287) -> (match (v_closedTypeTerm dtb_u_u286) with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u288) -> (match (v_closedTypeArgs dtb_u_u287) with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u289) -> (B_dData_dMaybe.C_Maybe_Just ((B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb_u_u288; B_dData_dPair.f_Pair_second = Core_dTerm.C_Rig_Rig0 }, dtb_u_u289))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (B_dData_dMaybe.C_Maybe_Just (B_dData_dList.C_List_Nil))
  | _ -> failwith "DT: impossible branch"
))

# 544 "Vuna/Compiler/Elab/Trait.vuna"
let rec v_closedTypeTerms = (fun (dtb_u_u290 : Frontend_dAst.t_Expr B_dData_dList.t_List) -> (match dtb_u_u290 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u291, dtb_u_u292) -> (match (v_closedTypeTerm dtb_u_u291) with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u293) -> (match (v_closedTypeTerms dtb_u_u292) with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u294) -> (B_dData_dMaybe.C_Maybe_Just ((B_dData_dList.C_List__x58__x58_ (dtb_u_u293, dtb_u_u294))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (B_dData_dMaybe.C_Maybe_Just (B_dData_dList.C_List_Nil))
  | _ -> failwith "DT: impossible branch"
))

# 582 "Vuna/Compiler/Elab/Trait.vuna"
let v_isLowerStart = (fun (dtb_u_u295 : string) -> (match (B_dData_dList.dtp_unpack dtb_u_u295) with
  | B_dData_dList.C_List_Nil -> false
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u296, dtb_u_u297) -> (if (dtb_u_u296 >= 97) then (dtb_u_u296 <= 122) else false)
  | _ -> failwith "DT: impossible branch"
))

# 612 "Vuna/Compiler/Elab/Trait.vuna"
let rec v_seedKindOf = (fun (dtb_u_u298 : string) (dtb_u_u299 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match dtb_u_u299 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u300, dtb_u_u301) -> (match dtb_u_u300 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u302; B_dData_dPair.f_Pair_second = dtb_u_u303 } -> (if (dtb_u_u302 = dtb_u_u298) then (B_dData_dMaybe.C_Maybe_Just (dtb_u_u303)) else ((v_seedKindOf dtb_u_u298) dtb_u_u301))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 594 "Vuna/Compiler/Elab/Trait.vuna"
let rec v_teleMetasInit = (fun (dtb_u_u304 : string B_dData_dList.t_List) (dtb_u_u305 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u306 : Elab_dTypes.t_Ec) -> (match dtb_u_u304 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u307, dtb_u_u308) -> (match ((v_seedKindOf dtb_u_u307) dtb_u_u305) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u309) -> (match (((v_teleMetasInit dtb_u_u308) dtb_u_u305) dtb_u_u306) with
  | { B_dData_dPair.f_Pair_first = dtb_u_u310; B_dData_dPair.f_Pair_second = dtb_u_u311 } -> { B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb_u_u307; B_dData_dPair.f_Pair_second = dtb_u_u309 }, dtb_u_u310)); B_dData_dPair.f_Pair_second = dtb_u_u311 }
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> (let dtb_u_u312 = ((Elab_dTypes.v_newMeta Elab_dTypes.v_emptyCtx) dtb_u_u306) in (match dtb_u_u312 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u313; B_dData_dPair.f_Pair_second = dtb_u_u314 } -> (match dtb_u_u313 with
  | Core_dTerm.C_Term_TMeta (dtb_u_u315) -> (match (((v_teleMetasInit dtb_u_u308) dtb_u_u305) dtb_u_u314) with
  | { B_dData_dPair.f_Pair_first = dtb_u_u316; B_dData_dPair.f_Pair_second = dtb_u_u317 } -> { B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb_u_u307; B_dData_dPair.f_Pair_second = (Core_dTerm.C_Term_TMeta (dtb_u_u315)) }, dtb_u_u316)); B_dData_dPair.f_Pair_second = dtb_u_u317 }
  | _ -> failwith "DT: impossible branch"
)
  | _ -> (match (((v_teleMetasInit dtb_u_u308) dtb_u_u305) dtb_u_u314) with
  | { B_dData_dPair.f_Pair_first = dtb_u_u318; B_dData_dPair.f_Pair_second = dtb_u_u319 } -> { B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb_u_u307; B_dData_dPair.f_Pair_second = dtb_u_u313 }, dtb_u_u318)); B_dData_dPair.f_Pair_second = dtb_u_u319 }
  | _ -> failwith "DT: impossible branch"
)
)
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> { B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = dtb_u_u306 }
  | _ -> failwith "DT: impossible branch"
))

# 618 "Vuna/Compiler/Elab/Trait.vuna"
let[@tail_mod_cons] rec v_bareTeleSeeds = (fun (dtb_u_u320 : Frontend_dAst.t_Expr B_dData_dList.t_List) (dtb_u_u321 : Core_dTerm.t_Value B_dData_dList.t_List) -> (match dtb_u_u320 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u322, dtb_u_u323) -> (match dtb_u_u321 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u324, dtb_u_u325) -> (match dtb_u_u322 with
  | Frontend_dAst.C_Expr_EVar (dtb_u_u326, dtb_u_u327) -> (if (v_isLowerStart dtb_u_u326) then (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb_u_u326; B_dData_dPair.f_Pair_second = ((Core_dEval.v_quote 0) dtb_u_u324) }, ((v_bareTeleSeeds dtb_u_u323) dtb_u_u325))) else ((v_bareTeleSeeds dtb_u_u323) dtb_u_u325))
  | _ -> ((v_bareTeleSeeds dtb_u_u323) dtb_u_u325)
)
  | _ -> B_dData_dList.C_List_Nil
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 630 "Vuna/Compiler/Elab/Trait.vuna"
let rec v_ctxBareTeleSeeds = (fun (dtb_u_u328 : Elab_dTypes.t_DtClass B_dData_dList.t_List) (dtb_u_u329 : Elab_dTypes.t_Ec) (dtb_u_u330 : (string, Frontend_dAst.t_Expr B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match dtb_u_u330 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u331, dtb_u_u332) -> (match dtb_u_u331 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u333; B_dData_dPair.f_Pair_second = dtb_u_u334 } -> (match ((Elab_dDict.v_findClass dtb_u_u333) dtb_u_u328) with
  | B_dData_dMaybe.C_Maybe_Nothing -> (((v_ctxBareTeleSeeds dtb_u_u328) dtb_u_u329) dtb_u_u332)
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u335) -> (match ((Elab_dDict.v_dictArgKinds dtb_u_u329) (Core_dTerm.C_Value_VNeutral ((Core_dTerm.C_Neutral_NGlobal ((Elab_dMeta.v_dictTypeName (Elab_dTypes.v_dtClassName dtb_u_u335)), B_dData_dList.C_List_Nil))))) with
  | B_dData_dMaybe.C_Maybe_Nothing -> (((v_ctxBareTeleSeeds dtb_u_u328) dtb_u_u329) dtb_u_u332)
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u336) -> ((B_dData_dList.v_append ((v_bareTeleSeeds dtb_u_u334) dtb_u_u336)) (((v_ctxBareTeleSeeds dtb_u_u328) dtb_u_u329) dtb_u_u332))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 658 "Vuna/Compiler/Elab/Trait.vuna"
let v_fallbackTeleKind = (fun (dtb_u_u337 : Frontend_dAst.t_Expr B_dData_dList.t_List) (dtb_u_u338 : string) -> ((Elab_dSig.v_arityFun ((Elab_dSig.v_exprMaxAppArityIn dtb_u_u338) dtb_u_u337)) (Core_dTerm.C_Term_TType (Core_dTerm.v_levelZero))))

# 646 "Vuna/Compiler/Elab/Trait.vuna"
let v_resolveTeleKind = (fun (dtb_u_u339 : Frontend_dAst.t_Expr B_dData_dList.t_List) (dtb_u_u340 : string) (dtb_u_u341 : Core_dTerm.t_Term) (dtb_u_u342 : Elab_dTypes.t_Ec) -> (match dtb_u_u341 with
  | Core_dTerm.C_Term_TMeta (dtb_u_u343) -> (match ((Core_dTerm.v_solsLookup dtb_u_u343) (Elab_dTypes.v_ecSolsP dtb_u_u342)) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u344) -> (let dtb_u_u345 = ((Core_dEval.v_quote 0) dtb_u_u344) in (if ((Core_dTerm.v_hasFreeTermVar 0) dtb_u_u345) then ((v_fallbackTeleKind dtb_u_u339) dtb_u_u340) else dtb_u_u345))
  | B_dData_dMaybe.C_Maybe_Nothing -> ((v_fallbackTeleKind dtb_u_u339) dtb_u_u340)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> dtb_u_u341
))

# 641 "Vuna/Compiler/Elab/Trait.vuna"
let[@tail_mod_cons] rec v_resolveTeleKinds = (fun (dtb_u_u346 : Frontend_dAst.t_Expr B_dData_dList.t_List) (dtb_u_u347 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u348 : Elab_dTypes.t_Ec) -> (match dtb_u_u347 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u349, dtb_u_u350) -> (match dtb_u_u349 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u351; B_dData_dPair.f_Pair_second = dtb_u_u352 } -> (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb_u_u351; B_dData_dPair.f_Pair_second = ((((v_resolveTeleKind dtb_u_u346) dtb_u_u351) dtb_u_u352) dtb_u_u348) }, (((v_resolveTeleKinds dtb_u_u346) dtb_u_u350) dtb_u_u348)))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 661 "Vuna/Compiler/Elab/Trait.vuna"
let rec v_exprFreeLower = (fun (dtb_u_u353 : Frontend_dAst.t_Expr) -> (match dtb_u_u353 with
  | Frontend_dAst.C_Expr_EPi (dtb_u_u354, dtb_u_u355, dtb_u_u356, dtb_u_u357, dtb_u_u358, dtb_u_u359) -> ((B_dData_dList.v_append (v_exprFreeLower dtb_u_u357)) (v_exprFreeLower dtb_u_u358))
  | Frontend_dAst.C_Expr_EApp (dtb_u_u360, dtb_u_u361, dtb_u_u362) -> ((B_dData_dList.v_append (v_exprFreeLower dtb_u_u360)) ((B_dData_dList.v_concatMap v_exprFreeLower) dtb_u_u361))
  | Frontend_dAst.C_Expr_EVar (dtb_u_u363, dtb_u_u364) -> (if (v_isLowerStart dtb_u_u363) then (B_dData_dList.C_List__x58__x58_ (dtb_u_u363, B_dData_dList.C_List_Nil)) else B_dData_dList.C_List_Nil)
  | _ -> B_dData_dList.C_List_Nil
))

# 576 "Vuna/Compiler/Elab/Trait.vuna"
let v_instanceMono = (fun (dtb_u_u365 : Frontend_dAst.t_Expr) -> (match (v_exprFreeLower dtb_u_u365) with
  | B_dData_dList.C_List_Nil -> true
  | _ -> false
))

# 667 "Vuna/Compiler/Elab/Trait.vuna"
let[@tail_mod_cons] rec v_keepOutBanned = (fun (dtb_u_u366 : (string, bool) B_dContainer_dHashMap.t_HashMap) (dtb_u_u367 : string B_dData_dList.t_List) -> (match dtb_u_u367 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u368, dtb_u_u369) -> (if ((((B_dContainer_dHashMap.v_member B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) dtb_u_u368) dtb_u_u366) then ((v_keepOutBanned dtb_u_u366) dtb_u_u369) else (B_dData_dList.C_List__x58__x58_ (dtb_u_u368, ((v_keepOutBanned dtb_u_u366) dtb_u_u369))))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 590 "Vuna/Compiler/Elab/Trait.vuna"
let v_instanceTeleMetas = (fun (dtb_u_u370 : (string, bool) B_dContainer_dHashMap.t_HashMap) (dtb_u_u371 : Frontend_dAst.t_Expr B_dData_dList.t_List) (dtb_u_u372 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u373 : Elab_dTypes.t_Ec) -> (((v_teleMetasInit (B_dData_dList.v_nubNames ((v_keepOutBanned dtb_u_u370) ((B_dData_dList.v_concatMap v_exprFreeLower) dtb_u_u371)))) dtb_u_u372) dtb_u_u373))

# 676 "Vuna/Compiler/Elab/Trait.vuna"
let rec v_instanceTeleCtxGo = (fun (dtb_u_u374 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u375 : Elab_dTypes.t_Ctx) -> (match dtb_u_u374 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u376, dtb_u_u377) -> (match dtb_u_u376 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u378; B_dData_dPair.f_Pair_second = dtb_u_u379 } -> ((v_instanceTeleCtxGo dtb_u_u377) (((Elab_dTypes.v_ctxBindValue dtb_u_u378) ((Core_dEval.v_eval B_dData_dList.C_List_Nil) dtb_u_u379)) dtb_u_u375))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> dtb_u_u375
  | _ -> failwith "DT: impossible branch"
))

# 673 "Vuna/Compiler/Elab/Trait.vuna"
let v_instanceTeleCtx = (fun (dtb_u_u380 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) -> ((v_instanceTeleCtxGo dtb_u_u380) Elab_dTypes.v_emptyCtx))

# 719 "Vuna/Compiler/Elab/Trait.vuna"
let v_ctxDictName = (fun (dtb_u_u381 : int) -> ("_ctx" ^ (string_of_int dtb_u_u381)))

# 714 "Vuna/Compiler/Elab/Trait.vuna"
let rec v_instBodyCtxGo = (fun (dtb_u_u382 : Elab_dTypes.t_Ctx) (dtb_u_u383 : Core_dTerm.t_Term B_dData_dList.t_List) (dtb_u_u384 : int) -> (match dtb_u_u383 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u385, dtb_u_u386) -> (((v_instBodyCtxGo (((Elab_dTypes.v_ctxBindValue (v_ctxDictName dtb_u_u384)) ((Core_dEval.v_eval (Elab_dTypes.v_ctxEnv dtb_u_u382)) (((Core_dTerm.v_shift 0) dtb_u_u384) dtb_u_u385))) dtb_u_u382)) dtb_u_u386) (dtb_u_u384 + 1))
  | B_dData_dList.C_List_Nil -> dtb_u_u382
  | _ -> failwith "DT: impossible branch"
))

# 729 "Vuna/Compiler/Elab/Trait.vuna"
let[@tail_mod_cons] rec v_instTeleLam = (fun (dtb_u_u387 : Core_dTerm.t_Term) (dtb_u_u388 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match dtb_u_u388 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u389, dtb_u_u390) -> (match dtb_u_u389 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u391; B_dData_dPair.f_Pair_second = dtb_u_u392 } -> (Core_dTerm.C_Term_TLam (dtb_u_u391, Core_dTerm.C_Rig_Rig0, B_dData_dMaybe.C_Maybe_Nothing, Base_dSource.v_spanEmpty, ((v_instTeleLam dtb_u_u387) dtb_u_u390)))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> dtb_u_u387
  | _ -> failwith "DT: impossible branch"
))

# 736 "Vuna/Compiler/Elab/Trait.vuna"
let[@tail_mod_cons] rec v_instCtxLamGo = (fun (dtb_u_u393 : Core_dTerm.t_Term) (dtb_u_u394 : int) (dtb_u_u395 : int) -> (if (dtb_u_u394 <= 0) then dtb_u_u393 else (Core_dTerm.C_Term_TLam ((v_ctxDictName dtb_u_u395), Core_dTerm.C_Rig_RigOmega, B_dData_dMaybe.C_Maybe_Nothing, Base_dSource.v_spanEmpty, (((v_instCtxLamGo dtb_u_u393) (dtb_u_u394 - 1)) (dtb_u_u395 + 1))))))

# 733 "Vuna/Compiler/Elab/Trait.vuna"
let v_instCtxLam = (fun (dtb_u_u396 : Core_dTerm.t_Term) (dtb_u_u397 : int) (dtb_u_u398 : int) -> (((v_instCtxLamGo dtb_u_u396) (dtb_u_u397 - dtb_u_u398)) dtb_u_u398))

# 752 "Vuna/Compiler/Elab/Trait.vuna"
let rec v_instTypeCtx = (fun (dtb_u_u399 : Core_dTerm.t_Term) (dtb_u_u400 : Core_dTerm.t_Term B_dData_dList.t_List) (dtb_u_u401 : int) -> (match dtb_u_u400 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u402, dtb_u_u403) -> (((v_instTypeCtx (Core_dTerm.C_Term_TPi ((v_ctxDictName dtb_u_u401), true, Core_dTerm.C_Rig_RigOmega, (((Core_dTerm.v_shift 0) dtb_u_u401) dtb_u_u402), dtb_u_u399))) dtb_u_u403) (dtb_u_u401 - 1))
  | B_dData_dList.C_List_Nil -> dtb_u_u399
  | _ -> failwith "DT: impossible branch"
))

# 757 "Vuna/Compiler/Elab/Trait.vuna"
let[@tail_mod_cons] rec v_instTypeTele = (fun (dtb_u_u404 : Core_dTerm.t_Term) (dtb_u_u405 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match dtb_u_u405 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u406, dtb_u_u407) -> (match dtb_u_u406 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u408; B_dData_dPair.f_Pair_second = dtb_u_u409 } -> (Core_dTerm.C_Term_TPi (dtb_u_u408, true, Core_dTerm.C_Rig_Rig0, dtb_u_u409, ((v_instTypeTele dtb_u_u404) dtb_u_u407)))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> dtb_u_u404
  | _ -> failwith "DT: impossible branch"
))

# 764 "Vuna/Compiler/Elab/Trait.vuna"
let v_canonicalMethodShort = (fun (dtb_u_u410 : string) -> (if ((Elab_dMeta.v_baseNameOf dtb_u_u410) = "eq") then "==" else (if ((Elab_dMeta.v_baseNameOf dtb_u_u410) = "neq") then "/=" else (if ((Elab_dMeta.v_baseNameOf dtb_u_u410) = "lt") then "<" else (if ((Elab_dMeta.v_baseNameOf dtb_u_u410) = "le") then "<=" else (if ((Elab_dMeta.v_baseNameOf dtb_u_u410) = "gt") then ">" else (if ((Elab_dMeta.v_baseNameOf dtb_u_u410) = "ge") then ">=" else (if ((Elab_dMeta.v_baseNameOf dtb_u_u410) = "add") then "+" else (if ((Elab_dMeta.v_baseNameOf dtb_u_u410) = "sub") then "-" else (if ((Elab_dMeta.v_baseNameOf dtb_u_u410) = "mul") then "*" else (if ((Elab_dMeta.v_baseNameOf dtb_u_u410) = "div") then "/" else (if ((Elab_dMeta.v_baseNameOf dtb_u_u410) = "bind") then ">>=" else (let dtb_u_u411 = (Elab_dMeta.v_baseNameOf dtb_u_u410) in dtb_u_u411)))))))))))))

# 780 "Vuna/Compiler/Elab/Trait.vuna"
let v_sameMethodShort = (fun (dtb_u_u412 : string) (dtb_u_u413 : string) -> ((v_canonicalMethodShort dtb_u_u412) = (v_canonicalMethodShort dtb_u_u413)))

# 783 "Vuna/Compiler/Elab/Trait.vuna"
let rec v_anySameMethod = (fun (dtb_u_u414 : string) (dtb_u_u415 : string B_dData_dList.t_List) -> (match dtb_u_u415 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u416, dtb_u_u417) -> (if ((v_sameMethodShort dtb_u_u414) dtb_u_u416) then true else ((v_anySameMethod dtb_u_u414) dtb_u_u417))
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 791 "Vuna/Compiler/Elab/Trait.vuna"
let rec v_firstUnknownInstanceMethodGo = (fun (dtb_u_u418 : string B_dData_dList.t_List) (dtb_u_u419 : Frontend_dAst.t_Decl B_dData_dList.t_List) -> (match dtb_u_u419 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u420, dtb_u_u421) -> (match dtb_u_u420 with
  | Frontend_dAst.C_Decl_DFun (dtb_u_u422, dtb_u_u423, dtb_u_u424, dtb_u_u425) -> (if ((v_anySameMethod (Elab_dMeta.v_baseNameOf dtb_u_u422)) dtb_u_u418) then ((v_firstUnknownInstanceMethodGo dtb_u_u418) dtb_u_u421) else (B_dData_dMaybe.C_Maybe_Just (dtb_u_u422)))
  | _ -> ((v_firstUnknownInstanceMethodGo dtb_u_u418) dtb_u_u421)
)
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 787 "Vuna/Compiler/Elab/Trait.vuna"
let v_firstUnknownInstanceMethod = (fun (dtb_u_u426 : Elab_dTypes.t_DtClass) (dtb_u_u427 : Frontend_dAst.t_Decl B_dData_dList.t_List) -> ((v_firstUnknownInstanceMethodGo ((B_dData_dList.v_map (fun (dtb_u_u428 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair) -> (Elab_dMeta.v_baseNameOf (B_dData_dPair.v_firstOf dtb_u_u428)))) (dtb_u_u426).Elab_dTypes.f_DtClass_dtClassMethods)) dtb_u_u427))

# 806 "Vuna/Compiler/Elab/Trait.vuna"
let rec v_firstDuplicateInstanceMethodGo = (fun (dtb_u_u429 : string B_dData_dList.t_List) (dtb_u_u430 : Frontend_dAst.t_Decl B_dData_dList.t_List) (dtb_u_u431 : (string, string) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match dtb_u_u430 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u432, dtb_u_u433) -> (match dtb_u_u432 with
  | Frontend_dAst.C_Decl_DFun (dtb_u_u434, dtb_u_u435, dtb_u_u436, dtb_u_u437) -> (let dtb_u_u438 = (Elab_dMeta.v_baseNameOf dtb_u_u434) in (if ((v_anySameMethod dtb_u_u438) dtb_u_u429) then (let dtb_u_u439 = (v_canonicalMethodShort dtb_u_u438) in (match ((B_dData_dList.v_lookupPair dtb_u_u439) dtb_u_u431) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u440) -> (if (dtb_u_u440 = dtb_u_u438) then (((v_firstDuplicateInstanceMethodGo dtb_u_u429) dtb_u_u433) dtb_u_u431) else (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = dtb_u_u439; B_dData_dPair.f_Pair_second = (Frontend_dAst.v_nodeRefSpan dtb_u_u437) })))
  | B_dData_dMaybe.C_Maybe_Nothing -> (((v_firstDuplicateInstanceMethodGo dtb_u_u429) dtb_u_u433) (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb_u_u439; B_dData_dPair.f_Pair_second = dtb_u_u438 }, dtb_u_u431)))
  | _ -> failwith "DT: impossible branch"
)) else (((v_firstDuplicateInstanceMethodGo dtb_u_u429) dtb_u_u433) dtb_u_u431)))
  | _ -> (((v_firstDuplicateInstanceMethodGo dtb_u_u429) dtb_u_u433) dtb_u_u431)
)
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 802 "Vuna/Compiler/Elab/Trait.vuna"
let v_firstDuplicateInstanceMethod = (fun (dtb_u_u441 : Elab_dTypes.t_DtClass) (dtb_u_u442 : Frontend_dAst.t_Decl B_dData_dList.t_List) -> (((v_firstDuplicateInstanceMethodGo ((B_dData_dList.v_map (fun (dtb_u_u443 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair) -> (Elab_dMeta.v_baseNameOf (B_dData_dPair.v_firstOf dtb_u_u443)))) (dtb_u_u441).Elab_dTypes.f_DtClass_dtClassMethods)) dtb_u_u442) B_dData_dList.C_List_Nil))

# 836 "Vuna/Compiler/Elab/Trait.vuna"
let rec v_hasMethodClauses = (fun (dtb_u_u444 : string) (dtb_u_u445 : Frontend_dAst.t_Decl B_dData_dList.t_List) -> (match dtb_u_u445 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u446, dtb_u_u447) -> (match dtb_u_u446 with
  | Frontend_dAst.C_Decl_DFun (dtb_u_u448, dtb_u_u449, dtb_u_u450, dtb_u_u451) -> (if ((v_sameMethodShort dtb_u_u448) dtb_u_u444) then true else ((v_hasMethodClauses dtb_u_u444) dtb_u_u447))
  | _ -> ((v_hasMethodClauses dtb_u_u444) dtb_u_u447)
)
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 828 "Vuna/Compiler/Elab/Trait.vuna"
let rec v_firstMissingInstanceMethodGo = (fun (dtb_u_u452 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u453 : Frontend_dAst.t_Decl B_dData_dList.t_List) -> (match dtb_u_u452 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u454, dtb_u_u455) -> (if ((v_hasMethodClauses (Elab_dMeta.v_baseNameOf (B_dData_dPair.v_firstOf dtb_u_u454))) dtb_u_u453) then ((v_firstMissingInstanceMethodGo dtb_u_u455) dtb_u_u453) else (B_dData_dMaybe.C_Maybe_Just ((B_dData_dPair.v_firstOf dtb_u_u454))))
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 825 "Vuna/Compiler/Elab/Trait.vuna"
let v_firstMissingInstanceMethod = (fun (dtb_u_u456 : Elab_dTypes.t_DtClass) (dtb_u_u457 : Frontend_dAst.t_Decl B_dData_dList.t_List) -> ((v_firstMissingInstanceMethodGo (dtb_u_u456).Elab_dTypes.f_DtClass_dtClassMethods) dtb_u_u457))

# 847 "Vuna/Compiler/Elab/Trait.vuna"
let rec v_findTraitDecl = (fun (dtb_u_u458 : string) (dtb_u_u459 : (Frontend_dAst.t_Decl, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match dtb_u_u459 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u460, dtb_u_u461) -> (match dtb_u_u460 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u462; B_dData_dPair.f_Pair_second = dtb_u_u463 } -> (match dtb_u_u462 with
  | Frontend_dAst.C_Decl_DTrait (dtb_u_u464, dtb_u_u465, dtb_u_u466, dtb_u_u467, dtb_u_u468) -> (if (dtb_u_u464 = dtb_u_u458) then (B_dData_dMaybe.C_Maybe_Just (dtb_u_u462)) else ((v_findTraitDecl dtb_u_u458) dtb_u_u461))
  | _ -> ((v_findTraitDecl dtb_u_u458) dtb_u_u461)
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 855 "Vuna/Compiler/Elab/Trait.vuna"
let rec v_findTraitMethodSpan = (fun (dtb_u_u469 : string) (dtb_u_u470 : Frontend_dAst.t_TraitMethod B_dData_dList.t_List) -> (match dtb_u_u470 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u471, dtb_u_u472) -> (if ((Frontend_dAst.v_traitMethodName dtb_u_u471) = dtb_u_u469) then (B_dData_dMaybe.C_Maybe_Just ((Frontend_dAst.v_traitMethodSpan dtb_u_u471))) else ((v_findTraitMethodSpan dtb_u_u469) dtb_u_u472))
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 860 "Vuna/Compiler/Elab/Trait.vuna"
let v_traitMethodSpanOf = (fun (dtb_u_u473 : Elab_dTypes.t_DtClass) (dtb_u_u474 : string) (dtb_u_u475 : (Frontend_dAst.t_Decl, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (let dtb_u_u476 = ((v_findTraitDecl (Elab_dTypes.v_dtClassName dtb_u_u473)) dtb_u_u475) in (match dtb_u_u476 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u477) -> (match dtb_u_u477 with
  | Frontend_dAst.C_Decl_DTrait (dtb_u_u478, dtb_u_u479, dtb_u_u480, dtb_u_u481, dtb_u_u482) -> ((v_findTraitMethodSpan dtb_u_u474) dtb_u_u481)
  | _ -> ((B_dData_dList.v_lookupPair dtb_u_u474) (dtb_u_u473).Elab_dTypes.f_DtClass_dtClassMethodSpans)
)
  | _ -> ((B_dData_dList.v_lookupPair dtb_u_u474) (dtb_u_u473).Elab_dTypes.f_DtClass_dtClassMethodSpans)
)))

# 867 "Vuna/Compiler/Elab/Trait.vuna"
let v_ctorResultType = (fun (dtb_u_u483 : Elab_dTypes.t_DtClass) (dtb_u_u484 : Core_dTerm.t_Term B_dData_dList.t_List) -> ((Elab_dMeta.v_foldAppTerms (Core_dTerm.C_Term_TGlobal ((Elab_dMeta.v_dictTypeName (Elab_dTypes.v_dtClassName dtb_u_u483))))) ((B_dData_dList.v_map (fun (dtb_u_u485 : Core_dTerm.t_Term) -> { B_dData_dPair.f_Pair_first = dtb_u_u485; B_dData_dPair.f_Pair_second = Core_dTerm.C_Rig_Rig0 })) dtb_u_u484)))

# 682 "Vuna/Compiler/Elab/Trait.vuna"
let rec v_elabConstraintDomains = (fun (dtb_u_u486 : Elab_dTypes.t_DtClass B_dData_dList.t_List) (dtb_u_u487 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u488 : Elab_dTypes.t_Ctx) (dtb_u_u489 : (string, Frontend_dAst.t_Expr B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u490 : Base_dSource.t_Span) (dtb_u_u491 : Elab_dTypes.t_Ec) -> (match dtb_u_u489 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u492, dtb_u_u493) -> (match dtb_u_u492 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u494; B_dData_dPair.f_Pair_second = dtb_u_u495 } -> (match ((Elab_dDict.v_findClass dtb_u_u494) dtb_u_u486) with
  | B_dData_dMaybe.C_Maybe_Nothing -> (((Base_dDiagnostics_dTc.v_tcErr1 dtb_u_u490) (Base_dDiagnostics_dTc.C_TcErr_UnknownInterface (dtb_u_u494))) dtb_u_u494)
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u496) -> (match ((Elab_dDict.v_dictArgKinds dtb_u_u491) (Core_dTerm.C_Value_VNeutral ((Core_dTerm.C_Neutral_NGlobal ((Elab_dMeta.v_dictTypeName (Elab_dTypes.v_dtClassName dtb_u_u496)), B_dData_dList.C_List_Nil))))) with
  | B_dData_dMaybe.C_Maybe_Nothing -> ((Base_dDiagnostics_dTc.v_tcErr0 dtb_u_u490) Base_dDiagnostics_dTc.C_TcErr_ConstraintNotDict)
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u497) -> (let dtb_u_u498 = (if ((dtp_log_on 3) "Vuna.Compiler.Elab.Trait") then (((dtp_log_emit 3) "Vuna.Compiler.Elab.Trait") (String.concat "" ["constraint-dom: "; dtb_u_u494; " args="; (string_of_int (B_dData_dList.v_length dtb_u_u495)); " kinds="; (string_of_int (B_dData_dList.v_length dtb_u_u497))])) else 0) in (if ((B_dData_dList.v_length dtb_u_u497) <> (B_dData_dList.v_length dtb_u_u495)) then ((Base_dDiagnostics_dTc.v_tcErr0 dtb_u_u490) Base_dDiagnostics_dTc.C_TcErr_ConstraintNotDict) else ((Base_dCommon.v_bind ((((((v_checkArgsAtKinds dtb_u_u487) dtb_u_u488) dtb_u_u491) dtb_u_u495) dtb_u_u497) dtb_u_u490)) (fun (dtb_u_u499 : (Core_dTerm.t_Term B_dData_dList.t_List, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match dtb_u_u499 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u500; B_dData_dPair.f_Pair_second = dtb_u_u501 } -> ((Base_dCommon.v_bind ((((((v_elabConstraintDomains dtb_u_u486) dtb_u_u487) dtb_u_u488) dtb_u_u493) dtb_u_u490) dtb_u_u501)) (fun (dtb_u_u502 : (Core_dTerm.t_Term B_dData_dList.t_List, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match dtb_u_u502 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u503; B_dData_dPair.f_Pair_second = dtb_u_u504 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ (((v_ctorResultType dtb_u_u496) dtb_u_u500), dtb_u_u503)); B_dData_dPair.f_Pair_second = dtb_u_u504 }))
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
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = dtb_u_u491 }))
  | _ -> failwith "DT: impossible branch"
))

# 96 "Vuna/Compiler/Elab/Trait.vuna"
let v_elabTraitFinal = (fun (dtb_u_u505 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u506 : Elab_dTypes.t_Ec) (dtb_u_u507 : string) (dtb_u_u508 : string B_dData_dList.t_List) (dtb_u_u509 : (string, Frontend_dAst.t_Expr B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u510 : Frontend_dAst.t_TraitMethod B_dData_dList.t_List) (dtb_u_u511 : (string, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u512 : Core_dTerm.t_Term B_dData_dList.t_List) (dtb_u_u513 : Core_dTerm.t_Term B_dData_dList.t_List) (dtb_u_u514 : Base_dSource.t_Span) -> (let dtb_u_u515 = ((B_dData_dList.v_zip dtb_u_u508) dtb_u_u512) in (let dtb_u_u516 = ((v_bindClassParams dtb_u_u515) Elab_dTypes.v_emptyCtx) in ((Base_dCommon.v_bind ((((((v_elabConstraintDomains (Elab_dTypes.v_ecClasses dtb_u_u506)) dtb_u_u505) dtb_u_u516) dtb_u_u509) dtb_u_u514) dtb_u_u506)) (fun (dtb_u_u517 : (Core_dTerm.t_Term B_dData_dList.t_List, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match dtb_u_u517 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u518; B_dData_dPair.f_Pair_second = dtb_u_u519 } -> (let dtb_u_u520 = (B_dData_dList.v_length dtb_u_u513) in (let dtb_u_u521 = (Elab_dMeta.v_dictTypeName dtb_u_u507) in (let dtb_u_u522 = (Elab_dMeta.v_dictCtorName dtb_u_u507) in (let dtb_u_u523 = ((v_dictAppTermOf dtb_u_u521) dtb_u_u508) in (let dtb_u_u524 = ((v_foldParamPis dtb_u_u515) ((v_foldPiFieldTys dtb_u_u513) dtb_u_u523)) in (let dtb_u_u525 = (Elab_dMeta.v_teleOfType dtb_u_u524) in (let dtb_u_u526 = { Elab_dTypes.f_DtData_dtDataName = dtb_u_u521; Elab_dTypes.f_DtData_dtDataParams = dtb_u_u525; Elab_dTypes.f_DtData_dtDataCtors = (B_dData_dList.C_List__x58__x58_ ({ Elab_dTypes.f_DtCtor_dtCtorName = dtb_u_u522; Elab_dTypes.f_DtCtor_dtCtorFamily = dtb_u_u521; Elab_dTypes.f_DtCtor_dtCtorTelescope = dtb_u_u525; Elab_dTypes.f_DtCtor_dtCtorType = dtb_u_u524; Elab_dTypes.f_DtCtor_dtCtorSpan = B_dData_dMaybe.C_Maybe_Nothing }, B_dData_dList.C_List_Nil)); Elab_dTypes.f_DtData_dtDataKind = ((v_foldParamPis dtb_u_u515) (Core_dTerm.C_Term_TType (Core_dTerm.v_levelZero))); Elab_dTypes.f_DtData_dtDataViaClasses = B_dData_dList.C_List_Nil; Elab_dTypes.f_DtData_dtDataLinear = false; Elab_dTypes.f_DtData_dtDataRepr = Frontend_dAst.C_ReprTier_ReprAuto; Elab_dTypes.f_DtData_dtDataFields = B_dData_dList.C_List_Nil; Elab_dTypes.f_DtData_dtDataIsRecord = false } in (let dtb_u_u527 = (((((v_methodProjections dtb_u_u507) dtb_u_u508) dtb_u_u512) dtb_u_u511) dtb_u_u513) in (let dtb_u_u528 = ((B_dData_dList.v_map (fun (dtb_u_u536 : Frontend_dAst.t_TraitMethod) -> { B_dData_dPair.f_Pair_first = (Frontend_dAst.v_traitMethodName dtb_u_u536); B_dData_dPair.f_Pair_second = (Frontend_dAst.v_traitMethodSpan dtb_u_u536) })) dtb_u_u510) in (let dtb_u_u529 = ((v_bindClassParams dtb_u_u515) Elab_dTypes.v_emptyCtx) in (let dtb_u_u530 = ((B_dData_dList.v_map (fun (dtb_u_u535 : Core_dTerm.t_Term) -> (if (((Elab_dMeta.v_isOpaqueRuntimeTyIn dtb_u_u519) dtb_u_u529) ((Core_dEval.v_eval (Elab_dTypes.v_ctxEnv dtb_u_u529)) dtb_u_u535)) then true else (Elab_dMeta.v_valueHasImplicitPi ((Core_dEval.v_eval (Elab_dTypes.v_ctxEnv dtb_u_u529)) dtb_u_u535))))) dtb_u_u513) in (let dtb_u_u531 = ((((((v_projectionDefsOpaque dtb_u_u530) dtb_u_u507) (B_dData_dList.v_length dtb_u_u508)) dtb_u_u511) dtb_u_u513) dtb_u_u520) in (let dtb_u_u532 = { Elab_dTypes.f_DtClass_dtClassName = dtb_u_u507; Elab_dTypes.f_DtClass_dtClassParams = dtb_u_u508; Elab_dTypes.f_DtClass_dtClassSupers = dtb_u_u518; Elab_dTypes.f_DtClass_dtClassMethods = dtb_u_u527; Elab_dTypes.f_DtClass_dtClassFieldTys = dtb_u_u513; Elab_dTypes.f_DtClass_dtClassMethodSpans = dtb_u_u528 } in (let dtb_u_u533 = ((Elab_dTypes.v_ecAddClass ((Elab_dTypes.v_ecAddData dtb_u_u519) dtb_u_u526)) dtb_u_u532) in (let dtb_u_u534 = ((v_foldlAddDef dtb_u_u533) dtb_u_u531) in (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb_u_u526; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = dtb_u_u527; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = dtb_u_u532; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = dtb_u_u528; B_dData_dPair.f_Pair_second = dtb_u_u534 } } } })))))))))))))))))
  | _ -> failwith "DT: impossible branch"
))))))

# 87 "Vuna/Compiler/Elab/Trait.vuna"
let v_elabTraitKinds = (fun (dtb_u_u537 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u538 : Elab_dTypes.t_Ec) (dtb_u_u539 : string) (dtb_u_u540 : Frontend_dAst.t_TraitParam B_dData_dList.t_List) (dtb_u_u541 : Frontend_dAst.t_Expr B_dData_dList.t_List) (dtb_u_u542 : Frontend_dAst.t_TraitMethod B_dData_dList.t_List) (dtb_u_u543 : (string, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u544 : Core_dTerm.t_Term B_dData_dList.t_List) (dtb_u_u545 : Base_dSource.t_Span) -> (let dtb_u_u546 = (v_traitParamNames dtb_u_u540) in (let dtb_u_u547 = ((B_dData_dList.v_zip dtb_u_u546) dtb_u_u544) in ((Base_dCommon.v_bind ((v_constraintPartsOf dtb_u_u545) dtb_u_u541)) (fun (dtb_u_u548 : (string, Frontend_dAst.t_Expr B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) -> ((Base_dCommon.v_bind ((((v_classFieldTys dtb_u_u537) dtb_u_u538) dtb_u_u547) dtb_u_u543)) (fun (dtb_u_u549 : (Core_dTerm.t_Term B_dData_dList.t_List, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> ((((((((((v_elabTraitFinal dtb_u_u537) (B_dData_dPair.v_secondOf dtb_u_u549)) dtb_u_u539) dtb_u_u546) dtb_u_u548) dtb_u_u542) dtb_u_u543) dtb_u_u544) (B_dData_dPair.v_firstOf dtb_u_u549)) dtb_u_u545))))))))

# 73 "Vuna/Compiler/Elab/Trait.vuna"
let v_elabTrait = (fun (dtb_u_u550 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u551 : Elab_dTypes.t_Ec) (dtb_u_u552 : (Frontend_dAst.t_Decl, Base_dSource.t_Span) B_dData_dPair.t_Pair) -> (match dtb_u_u552 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u553; B_dData_dPair.f_Pair_second = dtb_u_u554 } -> (match dtb_u_u553 with
  | Frontend_dAst.C_Decl_DTrait (dtb_u_u555, dtb_u_u556, dtb_u_u557, dtb_u_u558, dtb_u_u559) -> (if ((B_dData_dList.v_length dtb_u_u556) = 0) then ((Base_dDiagnostics_dTc.v_tcErr0 (Frontend_dAst.v_nodeRefSpan dtb_u_u559)) Base_dDiagnostics_dTc.C_TcErr_InterfaceNoParam) else (let dtb_u_u560 = (v_traitMethodPairs dtb_u_u558) in ((Base_dCommon.v_bind ((((v_traitParamKinds dtb_u_u550) dtb_u_u551) dtb_u_u556) dtb_u_u560)) (fun (dtb_u_u561 : (Core_dTerm.t_Term B_dData_dList.t_List, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (((((((((v_elabTraitKinds dtb_u_u550) (B_dData_dPair.v_secondOf dtb_u_u561)) dtb_u_u555) dtb_u_u556) dtb_u_u557) dtb_u_u558) dtb_u_u560) (B_dData_dPair.v_firstOf dtb_u_u561)) (Frontend_dAst.v_nodeRefSpan dtb_u_u559))))))
  | _ -> ((Elab_dTypes.v_errAt dtb_u_u554) "DT: internal: expected a trait declaration")
)
  | _ -> failwith "DT: impossible branch"
))

# 491 "Vuna/Compiler/Elab/Trait.vuna"
let v_elabInstanceConstrained = (fun (dtb_u_u562 : Elab_dTypes.t_DtClass B_dData_dList.t_List) (dtb_u_u563 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u564 : string B_dData_dList.t_List) (dtb_u_u565 : Elab_dTypes.t_Ec) (dtb_u_u566 : Base_dSource.t_Span) (dtb_u_u567 : Elab_dTypes.t_DtClass) (dtb_u_u568 : Frontend_dAst.t_Expr B_dData_dList.t_List) (dtb_u_u569 : (string, Frontend_dAst.t_Expr B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (let dtb_u_u570 = ((B_dData_dList.v_concatMap (fun (dtb_u_u587 : (string, Frontend_dAst.t_Expr B_dData_dList.t_List) B_dData_dPair.t_Pair) -> (B_dData_dPair.v_secondOf dtb_u_u587))) dtb_u_u569) in (let dtb_u_u571 = (Elab_dSig.v_topQuantBanned dtb_u_u564) in (let dtb_u_u572 = ((B_dData_dList.v_append dtb_u_u568) dtb_u_u570) in (let dtb_u_u573 = ((Elab_dDict.v_dictArgKinds dtb_u_u565) (Core_dTerm.C_Value_VNeutral ((Core_dTerm.C_Neutral_NGlobal ((Elab_dMeta.v_dictTypeName (Elab_dTypes.v_dtClassName dtb_u_u567)), B_dData_dList.C_List_Nil))))) in (match dtb_u_u573 with
  | B_dData_dMaybe.C_Maybe_Nothing -> ((Base_dDiagnostics_dTc.v_tcErr0 dtb_u_u566) Base_dDiagnostics_dTc.C_TcErr_InstanceHeadNotApp)
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u574) -> (if ((B_dData_dList.v_length dtb_u_u574) <> (B_dData_dList.v_length dtb_u_u568)) then ((Base_dDiagnostics_dTc.v_tcErr0 dtb_u_u566) Base_dDiagnostics_dTc.C_TcErr_InstanceHeadNotApp) else (let dtb_u_u575 = ((B_dData_dList.v_append ((v_bareTeleSeeds dtb_u_u568) dtb_u_u574)) (((v_ctxBareTeleSeeds dtb_u_u562) dtb_u_u565) dtb_u_u569)) in (let dtb_u_u576 = ((((v_instanceTeleMetas dtb_u_u571) dtb_u_u572) dtb_u_u575) dtb_u_u565) in (let dtb_u_u577 = (B_dData_dPair.v_firstOf dtb_u_u576) in (let dtb_u_u578 = (B_dData_dPair.v_secondOf dtb_u_u576) in (let dtb_u_u579 = (v_instanceTeleCtx dtb_u_u577) in ((Base_dCommon.v_bind ((((((v_checkArgsAtKinds dtb_u_u563) dtb_u_u579) dtb_u_u578) dtb_u_u568) dtb_u_u574) dtb_u_u566)) (fun (dtb_u_u580 : (Core_dTerm.t_Term B_dData_dList.t_List, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match dtb_u_u580 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u581; B_dData_dPair.f_Pair_second = dtb_u_u582 } -> ((Base_dCommon.v_bind ((((((v_elabConstraintDomains dtb_u_u562) dtb_u_u563) dtb_u_u579) dtb_u_u569) dtb_u_u566) dtb_u_u582)) (fun (dtb_u_u583 : (Core_dTerm.t_Term B_dData_dList.t_List, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match dtb_u_u583 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u584; B_dData_dPair.f_Pair_second = dtb_u_u585 } -> (let dtb_u_u586 = (((v_resolveTeleKinds dtb_u_u572) dtb_u_u577) dtb_u_u585) in (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = { f_InstSigInfo_instSigClass = (Elab_dTypes.v_dtClassName dtb_u_u567); f_InstSigInfo_instSigTele = dtb_u_u586; f_InstSigInfo_instSigCtx = dtb_u_u584; f_InstSigInfo_instSigArgs = dtb_u_u581; f_InstSigInfo_instSigHead = ((v_ctorResultType dtb_u_u567) dtb_u_u581) }; B_dData_dPair.f_Pair_second = dtb_u_u585 })))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))))))))
  | _ -> failwith "DT: impossible branch"
))))))

# 460 "Vuna/Compiler/Elab/Trait.vuna"
let v_elabInstanceSig = (fun (dtb_u_u588 : Elab_dTypes.t_DtClass B_dData_dList.t_List) (dtb_u_u589 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u590 : string B_dData_dList.t_List) (dtb_u_u591 : Elab_dTypes.t_Ec) (dtb_u_u592 : Base_dSource.t_Span) (dtb_u_u593 : Frontend_dAst.t_Expr) (dtb_u_u594 : Frontend_dAst.t_Expr B_dData_dList.t_List) -> (match (v_instanceHeadParts dtb_u_u593) with
  | B_dData_dMaybe.C_Maybe_Nothing -> ((Base_dDiagnostics_dTc.v_tcErr0 dtb_u_u592) Base_dDiagnostics_dTc.C_TcErr_InstanceHeadNotApp)
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u595) -> (match ((Elab_dDict.v_findClass (B_dData_dPair.v_firstOf dtb_u_u595)) dtb_u_u588) with
  | B_dData_dMaybe.C_Maybe_Nothing -> (((Base_dDiagnostics_dTc.v_tcErr1 dtb_u_u592) (Base_dDiagnostics_dTc.C_TcErr_UnknownInterface ((B_dData_dPair.v_firstOf dtb_u_u595)))) (B_dData_dPair.v_firstOf dtb_u_u595))
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u596) -> (match (B_dData_dPair.v_secondOf dtb_u_u595) with
  | dtb_u_u597 -> (if ((B_dData_dList.v_length dtb_u_u597) <> (B_dData_dList.v_length (dtb_u_u596).Elab_dTypes.f_DtClass_dtClassParams)) then ((Base_dDiagnostics_dTc.v_tcErr0 dtb_u_u592) Base_dDiagnostics_dTc.C_TcErr_InstanceHeadNotApp) else ((Base_dCommon.v_bind ((v_constraintPartsOf dtb_u_u592) dtb_u_u594)) (fun (dtb_u_u598 : (string, Frontend_dAst.t_Expr B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) -> ((((((((v_elabInstanceConstrained dtb_u_u588) dtb_u_u589) dtb_u_u590) dtb_u_u591) dtb_u_u592) dtb_u_u596) dtb_u_u597) dtb_u_u598))))
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 883 "Vuna/Compiler/Elab/Trait.vuna"
let[@tail_mod_cons] rec v_zipMethodFields = (fun (dtb_u_u599 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u600 : Core_dTerm.t_Term B_dData_dList.t_List) -> (match dtb_u_u599 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u601, dtb_u_u602) -> (match dtb_u_u600 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u603, dtb_u_u604) -> (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = (B_dData_dPair.v_firstOf dtb_u_u601); B_dData_dPair.f_Pair_second = dtb_u_u603 }, ((v_zipMethodFields dtb_u_u602) dtb_u_u604)))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 880 "Vuna/Compiler/Elab/Trait.vuna"
let v_zipClassFields = (fun (dtb_u_u605 : Elab_dTypes.t_DtClass) -> ((v_zipMethodFields (dtb_u_u605).Elab_dTypes.f_DtClass_dtClassMethods) (dtb_u_u605).Elab_dTypes.f_DtClass_dtClassFieldTys))

# 958 "Vuna/Compiler/Elab/Trait.vuna"
let rec v_instArgAt = (fun (dtb_u_u606 : int) (dtb_u_u607 : Core_dTerm.t_Term B_dData_dList.t_List) -> (match dtb_u_u607 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u608, dtb_u_u609) -> (if (dtb_u_u606 <= 0) then (B_dData_dMaybe.C_Maybe_Just (dtb_u_u608)) else ((v_instArgAt (dtb_u_u606 - 1)) dtb_u_u609))
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 895 "Vuna/Compiler/Elab/Trait.vuna"
let rec v_substInstParamsGo = (fun (dtb_u_u610 : int) (dtb_u_u611 : Core_dTerm.t_Term B_dData_dList.t_List) (dtb_u_u612 : int) (dtb_u_u613 : Core_dTerm.t_Term) -> (match dtb_u_u613 with
  | Core_dTerm.C_Term_TIf (dtb_u_u614, dtb_u_u615, dtb_u_u616) -> ((Base_dCommon.v_bind ((((v_substInstParamsGo dtb_u_u610) dtb_u_u611) dtb_u_u612) dtb_u_u614)) (fun (dtb_u_u617 : Core_dTerm.t_Term) -> ((Base_dCommon.v_bind ((((v_substInstParamsGo dtb_u_u610) dtb_u_u611) dtb_u_u612) dtb_u_u615)) (fun (dtb_u_u618 : Core_dTerm.t_Term) -> ((Base_dCommon.v_bind ((((v_substInstParamsGo dtb_u_u610) dtb_u_u611) dtb_u_u612) dtb_u_u616)) (fun (dtb_u_u619 : Core_dTerm.t_Term) -> (Base_dDiag.C_Check_OkC ((Core_dTerm.C_Term_TIf (dtb_u_u617, dtb_u_u618, dtb_u_u619))))))))))
  | Core_dTerm.C_Term_TCase (dtb_u_u620, dtb_u_u621) -> ((Base_dCommon.v_bind ((((v_substInstParamsGo dtb_u_u610) dtb_u_u611) dtb_u_u612) dtb_u_u620)) (fun (dtb_u_u622 : Core_dTerm.t_Term) -> ((Base_dCommon.v_bind ((Base_dCommon.v_traverse (((v_substInstParamsAlt dtb_u_u610) dtb_u_u611) dtb_u_u612)) dtb_u_u621)) (fun (dtb_u_u623 : Core_dTerm.t_CaseAlt B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((Core_dTerm.C_Term_TCase (dtb_u_u622, dtb_u_u623))))))))
  | Core_dTerm.C_Term_TMk (dtb_u_u624, dtb_u_u625) -> ((Base_dCommon.v_bind ((Base_dCommon.v_traverse (((v_substInstParamsPair dtb_u_u610) dtb_u_u611) dtb_u_u612)) dtb_u_u625)) (fun (dtb_u_u626 : (Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((Core_dTerm.C_Term_TMk (dtb_u_u624, dtb_u_u626))))))
  | Core_dTerm.C_Term_TCon (dtb_u_u627, dtb_u_u628) -> ((Base_dCommon.v_bind ((Base_dCommon.v_traverse (((v_substInstParamsPair dtb_u_u610) dtb_u_u611) dtb_u_u612)) dtb_u_u628)) (fun (dtb_u_u629 : (Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((Core_dTerm.C_Term_TCon (dtb_u_u627, dtb_u_u629))))))
  | Core_dTerm.C_Term_TApp (dtb_u_u630, dtb_u_u631, dtb_u_u632) -> ((Base_dCommon.v_bind ((((v_substInstParamsGo dtb_u_u610) dtb_u_u611) dtb_u_u612) dtb_u_u630)) (fun (dtb_u_u633 : Core_dTerm.t_Term) -> ((Base_dCommon.v_bind ((((v_substInstParamsGo dtb_u_u610) dtb_u_u611) dtb_u_u612) dtb_u_u631)) (fun (dtb_u_u634 : Core_dTerm.t_Term) -> (Base_dDiag.C_Check_OkC ((Core_dTerm.C_Term_TApp (dtb_u_u633, dtb_u_u634, dtb_u_u632))))))))
  | Core_dTerm.C_Term_TLam (dtb_u_u635, dtb_u_u636, dtb_u_u637, dtb_u_u638, dtb_u_u639) -> ((Base_dCommon.v_bind ((((v_substInstParamsSlot dtb_u_u610) dtb_u_u611) dtb_u_u612) dtb_u_u637)) (fun (dtb_u_u640 : (Core_dTerm.t_LamMark, (Core_dTerm.t_Term B_dData_dMaybe.t_Maybe, Core_dTerm.t_Term B_dData_dMaybe.t_Maybe) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dMaybe.t_Maybe) -> ((Base_dCommon.v_bind ((((v_substInstParamsGo dtb_u_u610) dtb_u_u611) (dtb_u_u612 + 1)) dtb_u_u639)) (fun (dtb_u_u641 : Core_dTerm.t_Term) -> (Base_dDiag.C_Check_OkC ((Core_dTerm.C_Term_TLam (dtb_u_u635, dtb_u_u636, dtb_u_u640, dtb_u_u638, dtb_u_u641))))))))
  | Core_dTerm.C_Term_TPi (dtb_u_u642, dtb_u_u643, dtb_u_u644, dtb_u_u645, dtb_u_u646) -> ((Base_dCommon.v_bind ((((v_substInstParamsGo dtb_u_u610) dtb_u_u611) dtb_u_u612) dtb_u_u645)) (fun (dtb_u_u647 : Core_dTerm.t_Term) -> ((Base_dCommon.v_bind ((((v_substInstParamsGo dtb_u_u610) dtb_u_u611) (dtb_u_u612 + 1)) dtb_u_u646)) (fun (dtb_u_u648 : Core_dTerm.t_Term) -> (Base_dDiag.C_Check_OkC ((Core_dTerm.C_Term_TPi (dtb_u_u642, dtb_u_u643, dtb_u_u644, dtb_u_u647, dtb_u_u648))))))))
  | Core_dTerm.C_Term_TVar (dtb_u_u649, dtb_u_u650, dtb_u_u651) -> (if (dtb_u_u650 >= dtb_u_u612) then (if ((dtb_u_u650 - dtb_u_u612) < dtb_u_u610) then (match ((v_instArgAt ((dtb_u_u610 - 1) - (dtb_u_u650 - dtb_u_u612))) dtb_u_u611) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u652) -> (Base_dDiag.C_Check_OkC ((((Core_dTerm.v_shift 0) dtb_u_u612) dtb_u_u652)))
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.v_icInternal "substInstParams: instance head argument index out of range")
  | _ -> failwith "DT: impossible branch"
) else (Base_dDiag.C_Check_OkC (dtb_u_u613))) else (Base_dDiag.C_Check_OkC (dtb_u_u613)))
  | _ -> (Base_dDiag.C_Check_OkC (dtb_u_u613))
))
# 936 "Vuna/Compiler/Elab/Trait.vuna"
and v_substInstParamsSlot = (fun (dtb_u_u653 : int) (dtb_u_u654 : Core_dTerm.t_Term B_dData_dList.t_List) (dtb_u_u655 : int) (dtb_u_u656 : (Core_dTerm.t_LamMark, (Core_dTerm.t_Term B_dData_dMaybe.t_Maybe, Core_dTerm.t_Term B_dData_dMaybe.t_Maybe) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dMaybe.t_Maybe) -> (match dtb_u_u656 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u657) -> (match dtb_u_u657 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u658; B_dData_dPair.f_Pair_second = dtb_u_u659 } -> (match dtb_u_u659 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u660; B_dData_dPair.f_Pair_second = dtb_u_u661 } -> ((Base_dCommon.v_bind ((((v_substInstParamsMaybe dtb_u_u653) dtb_u_u654) dtb_u_u655) dtb_u_u660)) (fun (dtb_u_u662 : Core_dTerm.t_Term B_dData_dMaybe.t_Maybe) -> ((Base_dCommon.v_bind ((((v_substInstParamsMaybe dtb_u_u653) dtb_u_u654) (dtb_u_u655 + 1)) dtb_u_u661)) (fun (dtb_u_u663 : Core_dTerm.t_Term B_dData_dMaybe.t_Maybe) -> (Base_dDiag.C_Check_OkC ((B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = dtb_u_u658; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = dtb_u_u662; B_dData_dPair.f_Pair_second = dtb_u_u663 } }))))))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.C_Check_OkC (B_dData_dMaybe.C_Maybe_Nothing))
  | _ -> failwith "DT: impossible branch"
))
# 943 "Vuna/Compiler/Elab/Trait.vuna"
and v_substInstParamsMaybe = (fun (dtb_u_u664 : int) (dtb_u_u665 : Core_dTerm.t_Term B_dData_dList.t_List) (dtb_u_u666 : int) (dtb_u_u667 : Core_dTerm.t_Term B_dData_dMaybe.t_Maybe) -> (match dtb_u_u667 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u668) -> ((Base_dCommon.v_bind ((((v_substInstParamsGo dtb_u_u664) dtb_u_u665) dtb_u_u666) dtb_u_u668)) (fun (dtb_u_u669 : Core_dTerm.t_Term) -> (Base_dDiag.C_Check_OkC ((B_dData_dMaybe.C_Maybe_Just (dtb_u_u669))))))
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.C_Check_OkC (B_dData_dMaybe.C_Maybe_Nothing))
  | _ -> failwith "DT: impossible branch"
))
# 948 "Vuna/Compiler/Elab/Trait.vuna"
and v_substInstParamsPair = (fun (dtb_u_u670 : int) (dtb_u_u671 : Core_dTerm.t_Term B_dData_dList.t_List) (dtb_u_u672 : int) (dtb_u_u673 : (Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair) -> (match dtb_u_u673 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u674; B_dData_dPair.f_Pair_second = dtb_u_u675 } -> ((Base_dCommon.v_bind ((((v_substInstParamsGo dtb_u_u670) dtb_u_u671) dtb_u_u672) dtb_u_u674)) (fun (dtb_u_u676 : Core_dTerm.t_Term) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb_u_u676; B_dData_dPair.f_Pair_second = dtb_u_u675 }))))
  | _ -> failwith "DT: impossible branch"
))
# 952 "Vuna/Compiler/Elab/Trait.vuna"
and v_substInstParamsAlt = (fun (dtb_u_u677 : int) (dtb_u_u678 : Core_dTerm.t_Term B_dData_dList.t_List) (dtb_u_u679 : int) (dtb_u_u680 : Core_dTerm.t_CaseAlt) -> (match dtb_u_u680 with
  | { Core_dTerm.f_CaseAlt_caseAltName = dtb_u_u681; Core_dTerm.f_CaseAlt_caseAltBinders = dtb_u_u682; Core_dTerm.f_CaseAlt_caseAltBody = dtb_u_u683 } -> ((Base_dCommon.v_bind ((((v_substInstParamsGo dtb_u_u677) dtb_u_u678) (dtb_u_u679 + (B_dData_dList.v_length dtb_u_u682))) dtb_u_u683)) (fun (dtb_u_u684 : Core_dTerm.t_Term) -> (Base_dDiag.C_Check_OkC ({ Core_dTerm.f_CaseAlt_caseAltName = dtb_u_u681; Core_dTerm.f_CaseAlt_caseAltBinders = dtb_u_u682; Core_dTerm.f_CaseAlt_caseAltBody = dtb_u_u684 }))))
  | _ -> failwith "DT: impossible branch"
))

# 892 "Vuna/Compiler/Elab/Trait.vuna"
let v_substInstParams = (fun (dtb_u_u685 : Core_dTerm.t_Term B_dData_dList.t_List) (dtb_u_u686 : Core_dTerm.t_Term) -> ((((v_substInstParamsGo (B_dData_dList.v_length dtb_u_u685)) dtb_u_u685) 0) dtb_u_u686))

# 337 "Vuna/Compiler/Elab/Trait.vuna"
let rec v_checkSuperClasses = (fun (dtb_u_u687 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u688 : Elab_dTypes.t_Ctx) (dtb_u_u689 : int) (dtb_u_u690 : string) (dtb_u_u691 : Base_dSource.t_Span) (dtb_u_u692 : Core_dTerm.t_Term B_dData_dList.t_List) (dtb_u_u693 : Core_dTerm.t_Term B_dData_dList.t_List) (dtb_u_u694 : Elab_dTypes.t_Ec) -> (match dtb_u_u693 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u695, dtb_u_u696) -> ((Base_dCommon.v_bind ((v_substInstParams dtb_u_u692) dtb_u_u695)) (fun (dtb_u_u697 : Core_dTerm.t_Term) -> (let dtb_u_u698 = ((Elab_dTypes.v_evalCtx dtb_u_u688) (((Core_dTerm.v_shift 0) dtb_u_u689) dtb_u_u697)) in (let dtb_u_u699 = (((((Elab_dDict.v_searchInstanceIn dtb_u_u687) dtb_u_u688) dtb_u_u694) dtb_u_u698) dtb_u_u691) in (match dtb_u_u699 with
  | Base_dDiag.C_Check_OkC (dtb_u_u700) -> (match dtb_u_u700 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u701; B_dData_dPair.f_Pair_second = dtb_u_u702 } -> ((((((((v_checkSuperClasses dtb_u_u687) dtb_u_u688) dtb_u_u689) dtb_u_u690) dtb_u_u691) dtb_u_u692) dtb_u_u696) dtb_u_u702)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dDiag.C_Check_ErrC (dtb_u_u703) -> ((((Base_dDiagnostics_dTc.v_tcErr2 dtb_u_u691) (Base_dDiagnostics_dTc.C_TcErr_SuperclassNotSatisfied (dtb_u_u690, (Core_dEval.v_showValue dtb_u_u698)))) dtb_u_u690) (Core_dEval.v_showValue dtb_u_u698))
  | _ -> failwith "DT: impossible branch"
)))))
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (dtb_u_u694))
  | _ -> failwith "DT: impossible branch"
))

# 986 "Vuna/Compiler/Elab/Trait.vuna"
let rec v_methodClausesGo = (fun (dtb_u_u704 : string) (dtb_u_u705 : Frontend_dAst.t_Decl B_dData_dList.t_List) (dtb_u_u706 : (Frontend_dAst.t_Pat B_dData_dList.t_List, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match dtb_u_u705 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u707, dtb_u_u708) -> (match dtb_u_u707 with
  | Frontend_dAst.C_Decl_DFun (dtb_u_u709, dtb_u_u710, dtb_u_u711, dtb_u_u712) -> (if ((v_sameMethodShort dtb_u_u709) dtb_u_u704) then (((v_methodClausesGo dtb_u_u704) dtb_u_u708) (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb_u_u710; B_dData_dPair.f_Pair_second = dtb_u_u711 }, dtb_u_u706))) else (((v_methodClausesGo dtb_u_u704) dtb_u_u708) dtb_u_u706))
  | _ -> (((v_methodClausesGo dtb_u_u704) dtb_u_u708) dtb_u_u706)
)
  | B_dData_dList.C_List_Nil -> (B_dData_dList.v_reverse dtb_u_u706)
  | _ -> failwith "DT: impossible branch"
))

# 983 "Vuna/Compiler/Elab/Trait.vuna"
let v_methodClausesNamed = (fun (dtb_u_u713 : string) (dtb_u_u714 : Frontend_dAst.t_Decl B_dData_dList.t_List) -> (((v_methodClausesGo dtb_u_u713) dtb_u_u714) B_dData_dList.C_List_Nil))

# 1045 "Vuna/Compiler/Elab/Trait.vuna"
let v_ctxDictDomEqual = (fun (dtb_u_u715 : Elab_dTypes.t_Ec) (dtb_u_u716 : int) (dtb_u_u717 : Core_dTerm.t_Value) (dtb_u_u718 : Core_dTerm.t_Value) -> (match (((((Core_dConv.v_conv (Elab_dTypes.v_ecDefTbl dtb_u_u715)) (Elab_dTypes.v_ecSolsP dtb_u_u715)) dtb_u_u716) ((Elab_dTypes.v_forceVal dtb_u_u715) dtb_u_u717)) ((Elab_dTypes.v_forceVal dtb_u_u715) dtb_u_u718)) with
  | Base_dDiag.C_Check_OkC (dtb_u_u719) -> true
  | Base_dDiag.C_Check_ErrC (dtb_u_u720) -> false
  | _ -> failwith "DT: impossible branch"
))

# 1036 "Vuna/Compiler/Elab/Trait.vuna"
let rec v_matchCtxDictIdxGo = (fun (dtb_u_u721 : Elab_dTypes.t_Ctx) (dtb_u_u722 : int) (dtb_u_u723 : Core_dTerm.t_Value) (dtb_u_u724 : Elab_dTypes.t_Ec) (dtb_u_u725 : int) (dtb_u_u726 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match dtb_u_u726 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u727, dtb_u_u728) -> (if (dtb_u_u725 >= dtb_u_u722) then B_dData_dMaybe.C_Maybe_Nothing else (match dtb_u_u727 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u729; B_dData_dPair.f_Pair_second = dtb_u_u730 } -> (if ((((v_ctxDictDomEqual dtb_u_u724) (Elab_dTypes.v_ctxDepth dtb_u_u721)) (((Elab_dTypes.v_varTypeValue dtb_u_u721) dtb_u_u725) dtb_u_u730)) dtb_u_u723) then (B_dData_dMaybe.C_Maybe_Just (dtb_u_u725)) else ((((((v_matchCtxDictIdxGo dtb_u_u721) dtb_u_u722) dtb_u_u723) dtb_u_u724) (dtb_u_u725 + 1)) dtb_u_u728))
  | _ -> failwith "DT: impossible branch"
))
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 1033 "Vuna/Compiler/Elab/Trait.vuna"
let v_matchCtxDictIdx = (fun (dtb_u_u731 : Elab_dTypes.t_Ctx) (dtb_u_u732 : int) (dtb_u_u733 : Core_dTerm.t_Value) (dtb_u_u734 : Elab_dTypes.t_Ec) -> ((((((v_matchCtxDictIdxGo dtb_u_u731) dtb_u_u732) dtb_u_u733) dtb_u_u734) 0) (dtb_u_u731).Elab_dTypes.f_Ctx_ctxItems))

# 1017 "Vuna/Compiler/Elab/Trait.vuna"
let rec v_solveCtxGoalsGo = (fun (dtb_u_u735 : Elab_dTypes.t_Ctx) (dtb_u_u736 : int) (dtb_u_u737 : Elab_dTypes.t_Ec) (dtb_u_u738 : Elab_dTypes.t_Constraint B_dData_dList.t_List) (dtb_u_u739 : Elab_dTypes.t_Constraint B_dData_dList.t_List) (dtb_u_u740 : (int, int) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match dtb_u_u738 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u741, dtb_u_u742) -> (match dtb_u_u741 with
  | { Elab_dTypes.f_Constraint_conId = dtb_u_u743; Elab_dTypes.f_Constraint_conKind = dtb_u_u744; Elab_dTypes.f_Constraint_conMeta = dtb_u_u745; Elab_dTypes.f_Constraint_conDom = dtb_u_u746; Elab_dTypes.f_Constraint_conSpan = dtb_u_u747; Elab_dTypes.f_Constraint_conDepth = dtb_u_u748 } -> (match ((Core_dTerm.v_metaLookup dtb_u_u745) (Elab_dTypes.v_ecSolTbl dtb_u_u737)) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u749) -> ((((((v_solveCtxGoalsGo dtb_u_u735) dtb_u_u736) dtb_u_u737) dtb_u_u742) dtb_u_u739) dtb_u_u740)
  | B_dData_dMaybe.C_Maybe_Nothing -> (match ((((v_matchCtxDictIdx dtb_u_u735) dtb_u_u736) dtb_u_u746) dtb_u_u737) with
  | B_dData_dMaybe.C_Maybe_Nothing -> ((((((v_solveCtxGoalsGo dtb_u_u735) dtb_u_u736) dtb_u_u737) dtb_u_u742) (B_dData_dList.C_List__x58__x58_ (dtb_u_u741, dtb_u_u739))) dtb_u_u740)
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u750) -> (let dtb_u_u751 = ((dtb_u_u736 - 1) - dtb_u_u750) in (match ((((((Core_dConv.v_solveMeta (Elab_dTypes.v_ecDefTbl dtb_u_u737)) (Elab_dTypes.v_ecSolsP dtb_u_u737)) (Elab_dTypes.v_ctxDepth dtb_u_u735)) dtb_u_u745) B_dData_dList.C_List_Nil) (Core_dTerm.C_Value_VNeutral ((Core_dTerm.C_Neutral_NVar ((v_ctxDictName dtb_u_u751), (((Elab_dTypes.v_ctxDepth dtb_u_u735) - dtb_u_u736) + dtb_u_u751), B_dData_dList.C_List_Nil))))) with
  | Base_dDiag.C_Check_OkC (dtb_u_u752) -> ((((((v_solveCtxGoalsGo dtb_u_u735) dtb_u_u736) ((Elab_dTypes.v_ecPutSols dtb_u_u737) (Core_dTerm.v_solsList dtb_u_u752))) dtb_u_u742) dtb_u_u739) (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb_u_u745; B_dData_dPair.f_Pair_second = dtb_u_u751 }, dtb_u_u740)))
  | Base_dDiag.C_Check_ErrC (dtb_u_u753) -> ((((((v_solveCtxGoalsGo dtb_u_u735) dtb_u_u736) dtb_u_u737) dtb_u_u742) dtb_u_u739) dtb_u_u740)
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> { B_dData_dPair.f_Pair_first = (B_dData_dList.v_reverse dtb_u_u740); B_dData_dPair.f_Pair_second = ((Elab_dTypes.v_ecPutPending dtb_u_u737) (B_dData_dList.v_reverse dtb_u_u739)) }
  | _ -> failwith "DT: impossible branch"
))

# 1014 "Vuna/Compiler/Elab/Trait.vuna"
let v_solveCtxGoals = (fun (dtb_u_u754 : Elab_dTypes.t_Ctx) (dtb_u_u755 : int) (dtb_u_u756 : int) (dtb_u_u757 : Elab_dTypes.t_Ec) (dtb_u_u758 : (int, int) B_dData_dPair.t_Pair B_dData_dList.t_List) -> ((((((v_solveCtxGoalsGo dtb_u_u754) dtb_u_u755) dtb_u_u757) (Elab_dTypes.v_ecPendingList dtb_u_u757)) B_dData_dList.C_List_Nil) dtb_u_u758))

# 1054 "Vuna/Compiler/Elab/Trait.vuna"
let rec v_applyCtxSubstsTo = (fun (dtb_u_u759 : int) (dtb_u_u760 : (int, int) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u761 : Core_dTerm.t_Term) -> (match dtb_u_u760 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u762, dtb_u_u763) -> (match dtb_u_u762 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u764; B_dData_dPair.f_Pair_second = dtb_u_u765 } -> (((v_applyCtxSubstsTo dtb_u_u759) dtb_u_u763) ((((Core_dTerm.v_substMetaVar dtb_u_u764) (v_ctxDictName dtb_u_u765)) ((dtb_u_u759 + dtb_u_u765) + 1)) dtb_u_u761))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> dtb_u_u761
  | _ -> failwith "DT: impossible branch"
))

# 1065 "Vuna/Compiler/Elab/Trait.vuna"
let rec v_resolveRigidGoalsGo = (fun (dtb_u_u766 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u767 : Elab_dTypes.t_Ctx) (dtb_u_u768 : Base_dSource.t_Span) (dtb_u_u769 : int) (dtb_u_u770 : Elab_dTypes.t_Constraint B_dData_dList.t_List) (dtb_u_u771 : Elab_dTypes.t_Constraint B_dData_dList.t_List) (dtb_u_u772 : (int, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u773 : Elab_dTypes.t_Ec) -> (match dtb_u_u770 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u774, dtb_u_u775) -> (match dtb_u_u774 with
  | { Elab_dTypes.f_Constraint_conId = dtb_u_u776; Elab_dTypes.f_Constraint_conKind = dtb_u_u777; Elab_dTypes.f_Constraint_conMeta = dtb_u_u778; Elab_dTypes.f_Constraint_conDom = dtb_u_u779; Elab_dTypes.f_Constraint_conSpan = dtb_u_u780; Elab_dTypes.f_Constraint_conDepth = dtb_u_u781 } -> (if (dtb_u_u776 < dtb_u_u769) then ((((((((v_resolveRigidGoalsGo dtb_u_u766) dtb_u_u767) dtb_u_u768) dtb_u_u769) dtb_u_u775) (B_dData_dList.C_List__x58__x58_ (dtb_u_u774, dtb_u_u771))) dtb_u_u772) dtb_u_u773) else (if ((Elab_dDict.v_isRigidDictArg dtb_u_u773) dtb_u_u779) then (let dtb_u_u782 = (((((Elab_dDict.v_searchInstanceIn dtb_u_u766) dtb_u_u767) dtb_u_u773) dtb_u_u779) dtb_u_u768) in (match dtb_u_u782 with
  | Base_dDiag.C_Check_OkC (dtb_u_u783) -> (match dtb_u_u783 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u784; B_dData_dPair.f_Pair_second = dtb_u_u785 } -> (match ((((((Core_dConv.v_solveMeta (Elab_dTypes.v_ecDefTbl dtb_u_u785)) (Elab_dTypes.v_ecSolsP dtb_u_u785)) (Elab_dTypes.v_ctxDepth dtb_u_u767)) dtb_u_u778) B_dData_dList.C_List_Nil) ((Core_dEval.v_eval (Elab_dTypes.v_ctxEnv dtb_u_u767)) dtb_u_u784)) with
  | Base_dDiag.C_Check_OkC (dtb_u_u786) -> ((((((((v_resolveRigidGoalsGo dtb_u_u766) dtb_u_u767) dtb_u_u768) dtb_u_u769) dtb_u_u775) dtb_u_u771) (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb_u_u778; B_dData_dPair.f_Pair_second = dtb_u_u784 }, dtb_u_u772))) ((Elab_dTypes.v_ecPutSols dtb_u_u785) (Core_dTerm.v_solsList dtb_u_u786)))
  | Base_dDiag.C_Check_ErrC (dtb_u_u787) -> ((((((((v_resolveRigidGoalsGo dtb_u_u766) dtb_u_u767) dtb_u_u768) dtb_u_u769) dtb_u_u775) (B_dData_dList.C_List__x58__x58_ (dtb_u_u774, dtb_u_u771))) dtb_u_u772) dtb_u_u785)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dDiag.C_Check_ErrC (dtb_u_u788) -> (((Base_dDiagnostics_dTc.v_tcErr1 dtb_u_u768) (Base_dDiagnostics_dTc.C_TcErr_InstanceContextMissing ((Core_dEval.v_showValue dtb_u_u779)))) (Core_dEval.v_showValue dtb_u_u779))
  | _ -> failwith "DT: impossible branch"
)) else ((((((((v_resolveRigidGoalsGo dtb_u_u766) dtb_u_u767) dtb_u_u768) dtb_u_u769) dtb_u_u775) (B_dData_dList.C_List__x58__x58_ (dtb_u_u774, dtb_u_u771))) dtb_u_u772) dtb_u_u773)))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.v_reverse dtb_u_u772); B_dData_dPair.f_Pair_second = ((Elab_dTypes.v_ecPutPending dtb_u_u773) (B_dData_dList.v_reverse dtb_u_u771)) }))
  | _ -> failwith "DT: impossible branch"
))

# 1061 "Vuna/Compiler/Elab/Trait.vuna"
let v_resolveRigidGoals = (fun (dtb_u_u789 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u790 : Elab_dTypes.t_Ctx) (dtb_u_u791 : Base_dSource.t_Span) (dtb_u_u792 : int) (dtb_u_u793 : Elab_dTypes.t_Constraint B_dData_dList.t_List) (dtb_u_u794 : (int, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u795 : Elab_dTypes.t_Ec) -> ((((((((v_resolveRigidGoalsGo dtb_u_u789) dtb_u_u790) dtb_u_u791) dtb_u_u792) dtb_u_u793) B_dData_dList.C_List_Nil) dtb_u_u794) dtb_u_u795))

# 1094 "Vuna/Compiler/Elab/Trait.vuna"
let rec v_substMetaTermGo = (fun (dtb_u_u796 : int) (dtb_u_u797 : Core_dTerm.t_Term) (dtb_u_u798 : int) (dtb_u_u799 : Core_dTerm.t_Term) -> (match dtb_u_u799 with
  | Core_dTerm.C_Term_TIf (dtb_u_u800, dtb_u_u801, dtb_u_u802) -> (Core_dTerm.C_Term_TIf (((((v_substMetaTermGo dtb_u_u796) dtb_u_u797) dtb_u_u798) dtb_u_u800), ((((v_substMetaTermGo dtb_u_u796) dtb_u_u797) dtb_u_u798) dtb_u_u801), ((((v_substMetaTermGo dtb_u_u796) dtb_u_u797) dtb_u_u798) dtb_u_u802)))
  | Core_dTerm.C_Term_TCase (dtb_u_u803, dtb_u_u804) -> (Core_dTerm.C_Term_TCase (((((v_substMetaTermGo dtb_u_u796) dtb_u_u797) dtb_u_u798) dtb_u_u803), ((B_dData_dList.v_map (fun (dtb_u_u805 : Core_dTerm.t_CaseAlt) -> ((((v_substMetaTermAlt dtb_u_u796) dtb_u_u797) dtb_u_u798) dtb_u_u805))) dtb_u_u804)))
  | Core_dTerm.C_Term_TRecord (dtb_u_u806, dtb_u_u807) -> (Core_dTerm.C_Term_TRecord (dtb_u_u806, ((B_dData_dList.v_map (fun (dtb_u_u808 : (Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair) -> { B_dData_dPair.f_Pair_first = ((((v_substMetaTermGo dtb_u_u796) dtb_u_u797) dtb_u_u798) (B_dData_dPair.v_firstOf dtb_u_u808)); B_dData_dPair.f_Pair_second = (B_dData_dPair.v_secondOf dtb_u_u808) })) dtb_u_u807)))
  | Core_dTerm.C_Term_TMk (dtb_u_u809, dtb_u_u810) -> (Core_dTerm.C_Term_TMk (dtb_u_u809, ((B_dData_dList.v_map (fun (dtb_u_u811 : (Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair) -> { B_dData_dPair.f_Pair_first = ((((v_substMetaTermGo dtb_u_u796) dtb_u_u797) dtb_u_u798) (B_dData_dPair.v_firstOf dtb_u_u811)); B_dData_dPair.f_Pair_second = (B_dData_dPair.v_secondOf dtb_u_u811) })) dtb_u_u810)))
  | Core_dTerm.C_Term_TCon (dtb_u_u812, dtb_u_u813) -> (Core_dTerm.C_Term_TCon (dtb_u_u812, ((B_dData_dList.v_map (fun (dtb_u_u814 : (Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair) -> { B_dData_dPair.f_Pair_first = ((((v_substMetaTermGo dtb_u_u796) dtb_u_u797) dtb_u_u798) (B_dData_dPair.v_firstOf dtb_u_u814)); B_dData_dPair.f_Pair_second = (B_dData_dPair.v_secondOf dtb_u_u814) })) dtb_u_u813)))
  | Core_dTerm.C_Term_TApp (dtb_u_u815, dtb_u_u816, dtb_u_u817) -> (Core_dTerm.C_Term_TApp (((((v_substMetaTermGo dtb_u_u796) dtb_u_u797) dtb_u_u798) dtb_u_u815), ((((v_substMetaTermGo dtb_u_u796) dtb_u_u797) dtb_u_u798) dtb_u_u816), dtb_u_u817))
  | Core_dTerm.C_Term_TLam (dtb_u_u818, dtb_u_u819, dtb_u_u820, dtb_u_u821, dtb_u_u822) -> (let dtb_u_u823 = (let dtb_u_u824 = dtb_u_u820 in (match dtb_u_u824 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u825) -> (match dtb_u_u825 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u826; B_dData_dPair.f_Pair_second = dtb_u_u827 } -> (match dtb_u_u827 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u828; B_dData_dPair.f_Pair_second = dtb_u_u829 } -> (let dtb_u_u830 = (match dtb_u_u828 with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u833) -> (B_dData_dMaybe.C_Maybe_Just (((((v_substMetaTermGo dtb_u_u796) dtb_u_u797) dtb_u_u798) dtb_u_u833)))
  | _ -> failwith "DT: impossible branch"
) in (let dtb_u_u831 = (match dtb_u_u829 with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u832) -> (B_dData_dMaybe.C_Maybe_Just (((((v_substMetaTermGo dtb_u_u796) dtb_u_u797) (dtb_u_u798 + 1)) dtb_u_u832)))
  | _ -> failwith "DT: impossible branch"
) in (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = dtb_u_u826; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = dtb_u_u830; B_dData_dPair.f_Pair_second = dtb_u_u831 } }))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) in (Core_dTerm.C_Term_TLam (dtb_u_u818, dtb_u_u819, dtb_u_u823, dtb_u_u821, ((((v_substMetaTermGo dtb_u_u796) dtb_u_u797) (dtb_u_u798 + 1)) dtb_u_u822))))
  | Core_dTerm.C_Term_TPi (dtb_u_u834, dtb_u_u835, dtb_u_u836, dtb_u_u837, dtb_u_u838) -> (Core_dTerm.C_Term_TPi (dtb_u_u834, dtb_u_u835, dtb_u_u836, ((((v_substMetaTermGo dtb_u_u796) dtb_u_u797) dtb_u_u798) dtb_u_u837), ((((v_substMetaTermGo dtb_u_u796) dtb_u_u797) (dtb_u_u798 + 1)) dtb_u_u838)))
  | Core_dTerm.C_Term_TMeta (dtb_u_u839) -> (if (dtb_u_u839 = dtb_u_u796) then (((Core_dTerm.v_shift 0) dtb_u_u798) dtb_u_u797) else dtb_u_u799)
  | _ -> dtb_u_u799
))
# 1132 "Vuna/Compiler/Elab/Trait.vuna"
and v_substMetaTermAlt = (fun (dtb_u_u840 : int) (dtb_u_u841 : Core_dTerm.t_Term) (dtb_u_u842 : int) (dtb_u_u843 : Core_dTerm.t_CaseAlt) -> (match dtb_u_u843 with
  | { Core_dTerm.f_CaseAlt_caseAltName = dtb_u_u844; Core_dTerm.f_CaseAlt_caseAltBinders = dtb_u_u845; Core_dTerm.f_CaseAlt_caseAltBody = dtb_u_u846 } -> { Core_dTerm.f_CaseAlt_caseAltName = dtb_u_u844; Core_dTerm.f_CaseAlt_caseAltBinders = dtb_u_u845; Core_dTerm.f_CaseAlt_caseAltBody = ((((v_substMetaTermGo dtb_u_u840) dtb_u_u841) (dtb_u_u842 + (B_dData_dList.v_length dtb_u_u845))) dtb_u_u846) }
  | _ -> failwith "DT: impossible branch"
))

# 1091 "Vuna/Compiler/Elab/Trait.vuna"
let v_substMetaTerm = (fun (dtb_u_u847 : int) (dtb_u_u848 : Core_dTerm.t_Term) (dtb_u_u849 : Core_dTerm.t_Term) -> ((((v_substMetaTermGo dtb_u_u847) dtb_u_u848) 0) dtb_u_u849))

# 1086 "Vuna/Compiler/Elab/Trait.vuna"
let rec v_applyTermSubstsTo = (fun (dtb_u_u850 : int) (dtb_u_u851 : (int, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u852 : Core_dTerm.t_Term) -> (match dtb_u_u851 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u853, dtb_u_u854) -> (match dtb_u_u853 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u855; B_dData_dPair.f_Pair_second = dtb_u_u856 } -> (((v_applyTermSubstsTo dtb_u_u850) dtb_u_u854) (((v_substMetaTerm dtb_u_u855) dtb_u_u856) dtb_u_u852))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> dtb_u_u852
  | _ -> failwith "DT: impossible branch"
))

# 1136 "Vuna/Compiler/Elab/Trait.vuna"
let v_clauseSpanOf = (fun (dtb_u_u857 : (Frontend_dAst.t_Pat B_dData_dList.t_List, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match dtb_u_u857 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u858, dtb_u_u859) -> (Frontend_dAst.v_exprSpan (B_dData_dPair.v_secondOf dtb_u_u858))
  | B_dData_dList.C_List_Nil -> { Base_dSource.f_Span_spanFile = ""; Base_dSource.f_Span_spanStartLine = 0; Base_dSource.f_Span_spanStartCol = 0; Base_dSource.f_Span_spanEndLine = 0; Base_dSource.f_Span_spanEndCol = 0; Base_dSource.f_Span_spanStartOffset = 0; Base_dSource.f_Span_spanEndOffset = 0 }
  | _ -> failwith "DT: impossible branch"
))

# 1159 "Vuna/Compiler/Elab/Trait.vuna"
let v_literalClassArg = (fun (dtb_u_u860 : Core_dTerm.t_Value) -> (match dtb_u_u860 with
  | Core_dTerm.C_Value_VFloat (dtb_u_u861) -> true
  | Core_dTerm.C_Value_VBool (dtb_u_u862) -> true
  | Core_dTerm.C_Value_VInt (dtb_u_u863) -> true
  | Core_dTerm.C_Value_VStr (dtb_u_u864) -> true
  | _ -> false
))

# 1166 "Vuna/Compiler/Elab/Trait.vuna"
let v_liftableDictDomain = (fun (dtb_u_u865 : Elab_dTypes.t_Ec) (dtb_u_u866 : Core_dTerm.t_Value) -> ((B_dData_dList.v_length ((B_dData_dList.v_filter v_literalClassArg) ((Elab_dDict.v_dictClassArgs dtb_u_u865) dtb_u_u866))) = 0))

# 1194 "Vuna/Compiler/Elab/Trait.vuna"
let v_domainsEqual = (fun (dtb_u_u867 : Elab_dTypes.t_Ec) (dtb_u_u868 : Core_dTerm.t_Value) (dtb_u_u869 : Core_dTerm.t_Value) -> (match (((((Core_dConv.v_conv (Elab_dTypes.v_ecDefTbl dtb_u_u867)) (Elab_dTypes.v_ecSolsP dtb_u_u867)) 0) dtb_u_u868) dtb_u_u869) with
  | Base_dDiag.C_Check_OkC (dtb_u_u870) -> true
  | Base_dDiag.C_Check_ErrC (dtb_u_u871) -> false
  | _ -> failwith "DT: impossible branch"
))

# 1186 "Vuna/Compiler/Elab/Trait.vuna"
let[@tail_mod_cons] rec v_addDictGoalGroup = (fun (dtb_u_u872 : Elab_dTypes.t_Ec) (dtb_u_u873 : int) (dtb_u_u874 : Core_dTerm.t_Value) (dtb_u_u875 : t_DictGoalGroup B_dData_dList.t_List) -> (match dtb_u_u875 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u876, dtb_u_u877) -> (match dtb_u_u876 with
  | { f_DictGoalGroup_dictGoalGroupRep = dtb_u_u878; f_DictGoalGroup_dictGoalGroupDom = dtb_u_u879; f_DictGoalGroup_dictGoalGroupExtras = dtb_u_u880 } -> (if (((v_domainsEqual dtb_u_u872) dtb_u_u879) dtb_u_u874) then (B_dData_dList.C_List__x58__x58_ ({ f_DictGoalGroup_dictGoalGroupRep = dtb_u_u878; f_DictGoalGroup_dictGoalGroupDom = dtb_u_u879; f_DictGoalGroup_dictGoalGroupExtras = (B_dData_dList.C_List__x58__x58_ (dtb_u_u873, dtb_u_u880)) }, dtb_u_u877)) else (B_dData_dList.C_List__x58__x58_ ({ f_DictGoalGroup_dictGoalGroupRep = dtb_u_u878; f_DictGoalGroup_dictGoalGroupDom = dtb_u_u879; f_DictGoalGroup_dictGoalGroupExtras = dtb_u_u880 }, ((((v_addDictGoalGroup dtb_u_u872) dtb_u_u873) dtb_u_u874) dtb_u_u877))))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (B_dData_dList.C_List__x58__x58_ ({ f_DictGoalGroup_dictGoalGroupRep = dtb_u_u873; f_DictGoalGroup_dictGoalGroupDom = dtb_u_u874; f_DictGoalGroup_dictGoalGroupExtras = B_dData_dList.C_List_Nil }, B_dData_dList.C_List_Nil))
  | _ -> failwith "DT: impossible branch"
))

# 1171 "Vuna/Compiler/Elab/Trait.vuna"
let rec v_freeDictGoalsGo = (fun (dtb_u_u881 : int) (dtb_u_u882 : Elab_dTypes.t_Ec) (dtb_u_u883 : Elab_dTypes.t_Constraint B_dData_dList.t_List) (dtb_u_u884 : t_DictGoalGroup B_dData_dList.t_List) -> (match dtb_u_u883 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u885, dtb_u_u886) -> (match dtb_u_u885 with
  | { Elab_dTypes.f_Constraint_conId = dtb_u_u887; Elab_dTypes.f_Constraint_conKind = dtb_u_u888; Elab_dTypes.f_Constraint_conMeta = dtb_u_u889; Elab_dTypes.f_Constraint_conDom = dtb_u_u890; Elab_dTypes.f_Constraint_conSpan = dtb_u_u891; Elab_dTypes.f_Constraint_conDepth = dtb_u_u892 } -> (if (if (if (dtb_u_u887 >= dtb_u_u881) then ((Elab_dDict.v_isRigidDictArg dtb_u_u882) dtb_u_u890) else false) then ((v_liftableDictDomain dtb_u_u882) dtb_u_u890) else false) then (match ((Core_dTerm.v_metaLookup dtb_u_u889) (Elab_dTypes.v_ecSolTbl dtb_u_u882)) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u893) -> ((((v_freeDictGoalsGo dtb_u_u881) dtb_u_u882) dtb_u_u886) dtb_u_u884)
  | B_dData_dMaybe.C_Maybe_Nothing -> ((((v_freeDictGoalsGo dtb_u_u881) dtb_u_u882) dtb_u_u886) ((((v_addDictGoalGroup dtb_u_u882) dtb_u_u889) dtb_u_u890) dtb_u_u884))
  | _ -> failwith "DT: impossible branch"
) else ((((v_freeDictGoalsGo dtb_u_u881) dtb_u_u882) dtb_u_u886) dtb_u_u884))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> dtb_u_u884
  | _ -> failwith "DT: impossible branch"
))

# 1154 "Vuna/Compiler/Elab/Trait.vuna"
let v_freeDictGoals = (fun (dtb_u_u894 : int) (dtb_u_u895 : Elab_dTypes.t_Ec) -> ((((v_freeDictGoalsGo dtb_u_u894) dtb_u_u895) (Elab_dTypes.v_ecPendingList dtb_u_u895)) B_dData_dList.C_List_Nil))

# 1201 "Vuna/Compiler/Elab/Trait.vuna"
let rec v_leadingImplicitCount = (fun (dtb_u_u896 : Core_dTerm.t_Term) -> (match dtb_u_u896 with
  | Core_dTerm.C_Term_TPi (dtb_u_u897, dtb_u_u898, dtb_u_u899, dtb_u_u900, dtb_u_u901) -> (if dtb_u_u898 then (1 + (v_leadingImplicitCount dtb_u_u901)) else 0)
  | _ -> 0
))

# 1208 "Vuna/Compiler/Elab/Trait.vuna"
let v_solveLiftedMeta = (fun (dtb_u_u902 : Elab_dTypes.t_Ec) (dtb_u_u903 : string) (dtb_u_u904 : int) (dtb_u_u905 : int) -> (match ((((((Core_dConv.v_solveMeta (Elab_dTypes.v_ecDefTbl dtb_u_u902)) (Elab_dTypes.v_ecSolsP dtb_u_u902)) (dtb_u_u904 + 1)) dtb_u_u905) B_dData_dList.C_List_Nil) (Core_dTerm.C_Value_VNeutral ((Core_dTerm.C_Neutral_NVar (dtb_u_u903, dtb_u_u904, B_dData_dList.C_List_Nil))))) with
  | Base_dDiag.C_Check_OkC (dtb_u_u906) -> ((Elab_dTypes.v_ecPutSols dtb_u_u902) (Core_dTerm.v_solsList dtb_u_u906))
  | Base_dDiag.C_Check_ErrC (dtb_u_u907) -> dtb_u_u902
  | _ -> failwith "DT: impossible branch"
))

# 1215 "Vuna/Compiler/Elab/Trait.vuna"
let rec v_solveLiftedMetas = (fun (dtb_u_u908 : Elab_dTypes.t_Ec) (dtb_u_u909 : string) (dtb_u_u910 : int) (dtb_u_u911 : int B_dData_dList.t_List) -> (match dtb_u_u911 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u912, dtb_u_u913) -> ((((v_solveLiftedMetas ((((v_solveLiftedMeta dtb_u_u908) dtb_u_u909) dtb_u_u910) dtb_u_u912)) dtb_u_u909) dtb_u_u910) dtb_u_u913)
  | B_dData_dList.C_List_Nil -> dtb_u_u908
  | _ -> failwith "DT: impossible branch"
))

# 1237 "Vuna/Compiler/Elab/Trait.vuna"
let v_dictAnchor = (fun (dtb_u_u914 : Core_dTerm.t_Term) -> ((Elab_dMeta.v_maxInt 1) (v_leadingImplicitCount dtb_u_u914)))

# 1246 "Vuna/Compiler/Elab/Trait.vuna"
let rec v_planDictBindersGo = (fun (dtb_u_u915 : int) (dtb_u_u916 : Elab_dTypes.t_Ec) (dtb_u_u917 : t_DictGoalGroup B_dData_dList.t_List) (dtb_u_u918 : int) (dtb_u_u919 : int) -> (match dtb_u_u917 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u920, dtb_u_u921) -> (match dtb_u_u920 with
  | { f_DictGoalGroup_dictGoalGroupRep = dtb_u_u922; f_DictGoalGroup_dictGoalGroupDom = dtb_u_u923; f_DictGoalGroup_dictGoalGroupExtras = dtb_u_u924 } -> (let dtb_u_u925 = (dtb_u_u915 + ((dtb_u_u919 - 1) - dtb_u_u918)) in (let dtb_u_u926 = (Frontend_dReserved.v_dictBinderName dtb_u_u918) in (let dtb_u_u927 = { f_DictPlan_dpName = dtb_u_u926; f_DictPlan_dpLevel = dtb_u_u925; f_DictPlan_dpDom = (((Core_dEval.v_substSolvedMetasAtTbl (Elab_dTypes.v_ecSolTbl dtb_u_u916)) dtb_u_u925) ((Core_dEval.v_quote dtb_u_u925) dtb_u_u923)); f_DictPlan_dpMetas = (B_dData_dList.C_List__x58__x58_ (dtb_u_u922, dtb_u_u924)) } in (let dtb_u_u928 = (((((v_planDictBindersGo dtb_u_u915) ((((v_solveLiftedMetas dtb_u_u916) dtb_u_u926) dtb_u_u925) (B_dData_dList.C_List__x58__x58_ (dtb_u_u922, dtb_u_u924)))) dtb_u_u921) (dtb_u_u918 + 1)) dtb_u_u919) in { B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ (dtb_u_u927, (B_dData_dPair.v_firstOf dtb_u_u928))); B_dData_dPair.f_Pair_second = (B_dData_dPair.v_secondOf dtb_u_u928) }))))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> { B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = dtb_u_u916 }
  | _ -> failwith "DT: impossible branch"
))

# 1243 "Vuna/Compiler/Elab/Trait.vuna"
let v_planDictBinders = (fun (dtb_u_u929 : int) (dtb_u_u930 : Elab_dTypes.t_Ec) (dtb_u_u931 : t_DictGoalGroup B_dData_dList.t_List) -> (((((v_planDictBindersGo dtb_u_u929) dtb_u_u930) dtb_u_u931) 0) (B_dData_dList.v_length dtb_u_u931)))

# 1267 "Vuna/Compiler/Elab/Trait.vuna"
let v_dictPlanPi = (fun (dtb_u_u932 : t_DictPlan) -> (match dtb_u_u932 with
  | { f_DictPlan_dpName = dtb_u_u933; f_DictPlan_dpLevel = dtb_u_u934; f_DictPlan_dpDom = dtb_u_u935; f_DictPlan_dpMetas = dtb_u_u936 } -> { B_dData_dPair.f_Pair_first = dtb_u_u933; B_dData_dPair.f_Pair_second = dtb_u_u935 }
  | _ -> failwith "DT: impossible branch"
))

# 1270 "Vuna/Compiler/Elab/Trait.vuna"
let v_dictPlanName = (fun (dtb_u_u937 : t_DictPlan) -> (match dtb_u_u937 with
  | { f_DictPlan_dpName = dtb_u_u938; f_DictPlan_dpLevel = dtb_u_u939; f_DictPlan_dpDom = dtb_u_u940; f_DictPlan_dpMetas = dtb_u_u941 } -> dtb_u_u938
  | _ -> failwith "DT: impossible branch"
))

# 1287 "Vuna/Compiler/Elab/Trait.vuna"
let[@tail_mod_cons] rec v_wrapDictPisGo = (fun (dtb_u_u942 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u943 : Core_dTerm.t_Term) -> (match dtb_u_u942 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u944, dtb_u_u945) -> (match dtb_u_u944 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u946; B_dData_dPair.f_Pair_second = dtb_u_u947 } -> (Core_dTerm.C_Term_TPi (dtb_u_u946, true, Core_dTerm.C_Rig_RigOmega, dtb_u_u947, ((v_wrapDictPisGo dtb_u_u945) dtb_u_u943)))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> dtb_u_u943
  | _ -> failwith "DT: impossible branch"
))

# 1284 "Vuna/Compiler/Elab/Trait.vuna"
let v_wrapDictPis = (fun (dtb_u_u948 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u949 : Core_dTerm.t_Term) -> ((v_wrapDictPisGo dtb_u_u948) (((Core_dTerm.v_shift 0) (B_dData_dList.v_length dtb_u_u948)) dtb_u_u949)))

# 1273 "Vuna/Compiler/Elab/Trait.vuna"
let[@tail_mod_cons] rec v_insertPisAfter = (fun (dtb_u_u950 : int) (dtb_u_u951 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u952 : Core_dTerm.t_Term) -> (if (dtb_u_u950 <= 0) then ((v_wrapDictPis dtb_u_u951) dtb_u_u952) else (match dtb_u_u952 with
  | Core_dTerm.C_Term_TPi (dtb_u_u953, dtb_u_u954, dtb_u_u955, dtb_u_u956, dtb_u_u957) -> (Core_dTerm.C_Term_TPi (dtb_u_u953, dtb_u_u954, dtb_u_u955, dtb_u_u956, (((v_insertPisAfter (dtb_u_u950 - 1)) dtb_u_u951) dtb_u_u957)))
  | _ -> ((v_wrapDictPis dtb_u_u951) dtb_u_u952)
)))

# 1264 "Vuna/Compiler/Elab/Trait.vuna"
let v_insertDictPis = (fun (dtb_u_u958 : int) (dtb_u_u959 : t_DictPlan B_dData_dList.t_List) (dtb_u_u960 : Core_dTerm.t_Term) -> (((v_insertPisAfter dtb_u_u958) ((B_dData_dList.v_map v_dictPlanPi) dtb_u_u959)) dtb_u_u960))

# 1307 "Vuna/Compiler/Elab/Trait.vuna"
let[@tail_mod_cons] rec v_wrapDictLamsGo = (fun (dtb_u_u961 : string B_dData_dList.t_List) (dtb_u_u962 : Core_dTerm.t_Term) -> (match dtb_u_u961 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u963, dtb_u_u964) -> (Core_dTerm.C_Term_TLam (dtb_u_u963, Core_dTerm.C_Rig_RigOmega, B_dData_dMaybe.C_Maybe_Nothing, Base_dSource.v_spanEmpty, ((v_wrapDictLamsGo dtb_u_u964) dtb_u_u962)))
  | B_dData_dList.C_List_Nil -> dtb_u_u962
  | _ -> failwith "DT: impossible branch"
))

# 1304 "Vuna/Compiler/Elab/Trait.vuna"
let v_wrapDictLams = (fun (dtb_u_u965 : string B_dData_dList.t_List) (dtb_u_u966 : Core_dTerm.t_Term) -> ((v_wrapDictLamsGo dtb_u_u965) (((Core_dTerm.v_shift 0) (B_dData_dList.v_length dtb_u_u965)) dtb_u_u966)))

# 1295 "Vuna/Compiler/Elab/Trait.vuna"
let[@tail_mod_cons] rec v_insertLamsAfter = (fun (dtb_u_u967 : int) (dtb_u_u968 : string B_dData_dList.t_List) (dtb_u_u969 : Core_dTerm.t_Term) -> (if (dtb_u_u967 <= 0) then ((v_wrapDictLams dtb_u_u968) dtb_u_u969) else (match dtb_u_u969 with
  | Core_dTerm.C_Term_TLam (dtb_u_u970, dtb_u_u971, dtb_u_u972, dtb_u_u973, dtb_u_u974) -> (Core_dTerm.C_Term_TLam (dtb_u_u970, dtb_u_u971, dtb_u_u972, dtb_u_u973, (((v_insertLamsAfter (dtb_u_u967 - 1)) dtb_u_u968) dtb_u_u974)))
  | _ -> ((v_wrapDictLams dtb_u_u968) dtb_u_u969)
)))

# 1292 "Vuna/Compiler/Elab/Trait.vuna"
let v_insertDictLams = (fun (dtb_u_u975 : int) (dtb_u_u976 : t_DictPlan B_dData_dList.t_List) (dtb_u_u977 : Core_dTerm.t_Term) -> (((v_insertLamsAfter dtb_u_u975) ((B_dData_dList.v_map v_dictPlanName) dtb_u_u976)) dtb_u_u977))

# 1317 "Vuna/Compiler/Elab/Trait.vuna"
let rec v_substMetaVarList = (fun (dtb_u_u978 : string) (dtb_u_u979 : int) (dtb_u_u980 : int B_dData_dList.t_List) (dtb_u_u981 : Core_dTerm.t_Term) -> (match dtb_u_u980 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u982, dtb_u_u983) -> ((((v_substMetaVarList dtb_u_u978) dtb_u_u979) dtb_u_u983) ((((Core_dTerm.v_substMetaVar dtb_u_u982) dtb_u_u978) dtb_u_u979) dtb_u_u981))
  | B_dData_dList.C_List_Nil -> dtb_u_u981
  | _ -> failwith "DT: impossible branch"
))

# 1312 "Vuna/Compiler/Elab/Trait.vuna"
let rec v_substPlannedMetas = (fun (dtb_u_u984 : t_DictPlan B_dData_dList.t_List) (dtb_u_u985 : Core_dTerm.t_Term) -> (match dtb_u_u984 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u986, dtb_u_u987) -> (match dtb_u_u986 with
  | { f_DictPlan_dpName = dtb_u_u988; f_DictPlan_dpLevel = dtb_u_u989; f_DictPlan_dpDom = dtb_u_u990; f_DictPlan_dpMetas = dtb_u_u991 } -> ((v_substPlannedMetas dtb_u_u987) ((((v_substMetaVarList dtb_u_u988) (dtb_u_u989 + 1)) dtb_u_u991) dtb_u_u985))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> dtb_u_u985
  | _ -> failwith "DT: impossible branch"
))

# 1358 "Vuna/Compiler/Elab/Trait.vuna"
let v_injectBudgetFor = (fun (dtb_u_u992 : Core_dTerm.t_Term) -> (64 + (4 * (Core_dTerm.v_termSize dtb_u_u992))))

# 1361 "Vuna/Compiler/Elab/Trait.vuna"
let v_altBudgetFor = (fun (dtb_u_u993 : Core_dTerm.t_CaseAlt) -> (match dtb_u_u993 with
  | { Core_dTerm.f_CaseAlt_caseAltName = dtb_u_u994; Core_dTerm.f_CaseAlt_caseAltBinders = dtb_u_u995; Core_dTerm.f_CaseAlt_caseAltBody = dtb_u_u996 } -> ((v_injectBudgetFor dtb_u_u996) + (B_dData_dList.v_length dtb_u_u995))
  | _ -> failwith "DT: impossible branch"
))

# 1415 "Vuna/Compiler/Elab/Trait.vuna"
let rec v_spineSize = (fun (dtb_u_u997 : (Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match dtb_u_u997 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u998, dtb_u_u999) -> ((Core_dTerm.v_termSize (B_dData_dPair.v_firstOf dtb_u_u998)) + (v_spineSize dtb_u_u999))
  | B_dData_dList.C_List_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))

# 1428 "Vuna/Compiler/Elab/Trait.vuna"
let v_insertArgAt = (fun (dtb_u_u1001 : int) dtb_u_u1002 dtb_u_u1003 -> ((B_dData_dList.v_append ((B_dData_dList.v_append ((B_dData_dList.v_take dtb_u_u1001) dtb_u_u1003)) (B_dData_dList.C_List__x58__x58_ (dtb_u_u1002, B_dData_dList.C_List_Nil)))) ((B_dData_dList.v_drop dtb_u_u1001) dtb_u_u1003)))

# 1364 "Vuna/Compiler/Elab/Trait.vuna"
let rec v_injectDictGoFuel = (fun (dtb_u_u1004 : int) (dtb_u_u1005 : string) (dtb_u_u1006 : string) (dtb_u_u1007 : int) (dtb_u_u1008 : int) (dtb_u_u1009 : Core_dTerm.t_Term) -> (if (dtb_u_u1004 <= 0) then dtb_u_u1009 else (match dtb_u_u1009 with
  | Core_dTerm.C_Term_TLam (dtb_u_u1010, dtb_u_u1011, dtb_u_u1012, dtb_u_u1013, dtb_u_u1014) -> (let dtb_u_u1015 = (let dtb_u_u1016 = dtb_u_u1012 in (match dtb_u_u1016 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u1017) -> (match dtb_u_u1017 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u1018; B_dData_dPair.f_Pair_second = dtb_u_u1019 } -> (match dtb_u_u1019 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u1020; B_dData_dPair.f_Pair_second = dtb_u_u1021 } -> (let dtb_u_u1022 = (match dtb_u_u1020 with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u1025) -> (B_dData_dMaybe.C_Maybe_Just (((((((v_injectDictGoFuel (dtb_u_u1004 - 1)) dtb_u_u1005) dtb_u_u1006) dtb_u_u1007) dtb_u_u1008) dtb_u_u1025)))
  | _ -> failwith "DT: impossible branch"
) in (let dtb_u_u1023 = (match dtb_u_u1021 with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u1024) -> (B_dData_dMaybe.C_Maybe_Just (((((((v_injectDictGoFuel (dtb_u_u1004 - 1)) dtb_u_u1005) dtb_u_u1006) dtb_u_u1007) (dtb_u_u1008 + 1)) dtb_u_u1024)))
  | _ -> failwith "DT: impossible branch"
) in (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = dtb_u_u1018; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = dtb_u_u1022; B_dData_dPair.f_Pair_second = dtb_u_u1023 } }))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) in (Core_dTerm.C_Term_TLam (dtb_u_u1010, dtb_u_u1011, dtb_u_u1015, dtb_u_u1013, ((((((v_injectDictGoFuel (dtb_u_u1004 - 1)) dtb_u_u1005) dtb_u_u1006) dtb_u_u1007) (dtb_u_u1008 + 1)) dtb_u_u1014))))
  | Core_dTerm.C_Term_TPi (dtb_u_u1026, dtb_u_u1027, dtb_u_u1028, dtb_u_u1029, dtb_u_u1030) -> (Core_dTerm.C_Term_TPi (dtb_u_u1026, dtb_u_u1027, dtb_u_u1028, ((((((v_injectDictGoFuel (dtb_u_u1004 - 1)) dtb_u_u1005) dtb_u_u1006) dtb_u_u1007) dtb_u_u1008) dtb_u_u1029), ((((((v_injectDictGoFuel (dtb_u_u1004 - 1)) dtb_u_u1005) dtb_u_u1006) dtb_u_u1007) (dtb_u_u1008 + 1)) dtb_u_u1030)))
  | Core_dTerm.C_Term_TApp (dtb_u_u1031, dtb_u_u1032, dtb_u_u1033) -> (let dtb_u_u1034 = (Elab_dTypes.v_flattenTaggedApp dtb_u_u1009) in (match dtb_u_u1034 with
  | B_dData_dMaybe.C_Maybe_Nothing -> (Core_dTerm.C_Term_TApp (((((((v_injectDictGoFuel (dtb_u_u1004 - 1)) dtb_u_u1005) dtb_u_u1006) dtb_u_u1007) dtb_u_u1008) dtb_u_u1031), ((((((v_injectDictGoFuel (dtb_u_u1004 - 1)) dtb_u_u1005) dtb_u_u1006) dtb_u_u1007) dtb_u_u1008) dtb_u_u1032), dtb_u_u1033))
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u1035) -> (match dtb_u_u1035 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u1036; B_dData_dPair.f_Pair_second = dtb_u_u1037 } -> (((((((v_rewriteTaggedSpineFuel (dtb_u_u1004 - 1)) dtb_u_u1005) dtb_u_u1006) dtb_u_u1007) dtb_u_u1008) dtb_u_u1036) dtb_u_u1037)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))
  | Core_dTerm.C_Term_TCon (dtb_u_u1038, dtb_u_u1039) -> (Core_dTerm.C_Term_TCon (dtb_u_u1038, ((B_dData_dList.v_map (fun (dtb_u_u1040 : (Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair) -> { B_dData_dPair.f_Pair_first = ((((((v_injectDictGoFuel (dtb_u_u1004 - 1)) dtb_u_u1005) dtb_u_u1006) dtb_u_u1007) dtb_u_u1008) (B_dData_dPair.v_firstOf dtb_u_u1040)); B_dData_dPair.f_Pair_second = (B_dData_dPair.v_secondOf dtb_u_u1040) })) dtb_u_u1039)))
  | Core_dTerm.C_Term_TMk (dtb_u_u1041, dtb_u_u1042) -> (Core_dTerm.C_Term_TMk (dtb_u_u1041, ((B_dData_dList.v_map (fun (dtb_u_u1043 : (Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair) -> { B_dData_dPair.f_Pair_first = ((((((v_injectDictGoFuel (dtb_u_u1004 - 1)) dtb_u_u1005) dtb_u_u1006) dtb_u_u1007) dtb_u_u1008) (B_dData_dPair.v_firstOf dtb_u_u1043)); B_dData_dPair.f_Pair_second = (B_dData_dPair.v_secondOf dtb_u_u1043) })) dtb_u_u1042)))
  | Core_dTerm.C_Term_TRecord (dtb_u_u1044, dtb_u_u1045) -> (Core_dTerm.C_Term_TRecord (dtb_u_u1044, ((B_dData_dList.v_map (fun (dtb_u_u1046 : (Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair) -> { B_dData_dPair.f_Pair_first = ((((((v_injectDictGoFuel (dtb_u_u1004 - 1)) dtb_u_u1005) dtb_u_u1006) dtb_u_u1007) dtb_u_u1008) (B_dData_dPair.v_firstOf dtb_u_u1046)); B_dData_dPair.f_Pair_second = (B_dData_dPair.v_secondOf dtb_u_u1046) })) dtb_u_u1045)))
  | Core_dTerm.C_Term_TCase (dtb_u_u1047, dtb_u_u1048) -> (Core_dTerm.C_Term_TCase (((((((v_injectDictGoFuel (dtb_u_u1004 - 1)) dtb_u_u1005) dtb_u_u1006) dtb_u_u1007) dtb_u_u1008) dtb_u_u1047), ((B_dData_dList.v_map (fun (dtb_u_u1049 : Core_dTerm.t_CaseAlt) -> ((((((v_injectAltGoFuel (dtb_u_u1004 - 1)) dtb_u_u1005) dtb_u_u1006) dtb_u_u1007) dtb_u_u1008) dtb_u_u1049))) dtb_u_u1048)))
  | Core_dTerm.C_Term_TIf (dtb_u_u1050, dtb_u_u1051, dtb_u_u1052) -> (Core_dTerm.C_Term_TIf (((((((v_injectDictGoFuel (dtb_u_u1004 - 1)) dtb_u_u1005) dtb_u_u1006) dtb_u_u1007) dtb_u_u1008) dtb_u_u1050), ((((((v_injectDictGoFuel (dtb_u_u1004 - 1)) dtb_u_u1005) dtb_u_u1006) dtb_u_u1007) dtb_u_u1008) dtb_u_u1051), ((((((v_injectDictGoFuel (dtb_u_u1004 - 1)) dtb_u_u1005) dtb_u_u1006) dtb_u_u1007) dtb_u_u1008) dtb_u_u1052)))
  | _ -> dtb_u_u1009
)))
# 1403 "Vuna/Compiler/Elab/Trait.vuna"
and v_injectAltGoFuel = (fun (dtb_u_u1053 : int) (dtb_u_u1054 : string) (dtb_u_u1055 : string) (dtb_u_u1056 : int) (dtb_u_u1057 : int) (dtb_u_u1058 : Core_dTerm.t_CaseAlt) -> (if (dtb_u_u1053 <= 0) then dtb_u_u1058 else (match dtb_u_u1058 with
  | { Core_dTerm.f_CaseAlt_caseAltName = dtb_u_u1059; Core_dTerm.f_CaseAlt_caseAltBinders = dtb_u_u1060; Core_dTerm.f_CaseAlt_caseAltBody = dtb_u_u1061 } -> { Core_dTerm.f_CaseAlt_caseAltName = dtb_u_u1059; Core_dTerm.f_CaseAlt_caseAltBinders = dtb_u_u1060; Core_dTerm.f_CaseAlt_caseAltBody = ((((((v_injectDictGoFuel (dtb_u_u1053 - 1)) dtb_u_u1054) dtb_u_u1055) dtb_u_u1056) (dtb_u_u1057 + (B_dData_dList.v_length dtb_u_u1060))) dtb_u_u1061) }
  | _ -> failwith "DT: impossible branch"
)))
# 1419 "Vuna/Compiler/Elab/Trait.vuna"
and v_rewriteTaggedSpineFuel = (fun (dtb_u_u1062 : int) (dtb_u_u1063 : string) (dtb_u_u1064 : string) (dtb_u_u1065 : int) (dtb_u_u1066 : int) (dtb_u_u1067 : string) (dtb_u_u1068 : (Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (if (dtb_u_u1062 <= 0) then (Core_dTerm.C_Term_TGlobal (dtb_u_u1067)) else (let dtb_u_u1069 = ((B_dData_dList.v_map (fun (dtb_u_u1070 : (Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair) -> { B_dData_dPair.f_Pair_first = ((((((v_injectDictGoFuel (dtb_u_u1062 - 1)) dtb_u_u1063) dtb_u_u1064) dtb_u_u1065) dtb_u_u1066) (B_dData_dPair.v_firstOf dtb_u_u1070)); B_dData_dPair.f_Pair_second = (B_dData_dPair.v_secondOf dtb_u_u1070) })) dtb_u_u1068) in (if (if (if (dtb_u_u1067 = dtb_u_u1063) then ((B_dData_dList.v_length dtb_u_u1069) > dtb_u_u1065) else false) then (dtb_u_u1066 > dtb_u_u1065) else false) then ((Elab_dMeta.v_foldAppTerms (Core_dTerm.C_Term_TGlobal (dtb_u_u1067))) (((v_insertArgAt dtb_u_u1065) { B_dData_dPair.f_Pair_first = (Core_dTerm.C_Term_TVar (dtb_u_u1064, ((dtb_u_u1066 - dtb_u_u1065) - 1), { Base_dSource.f_Span_spanFile = ""; Base_dSource.f_Span_spanStartLine = 0; Base_dSource.f_Span_spanStartCol = 0; Base_dSource.f_Span_spanEndLine = 0; Base_dSource.f_Span_spanEndCol = 0; Base_dSource.f_Span_spanStartOffset = 0; Base_dSource.f_Span_spanEndOffset = 0 })); B_dData_dPair.f_Pair_second = Core_dTerm.C_Rig_RigOmega }) dtb_u_u1069)) else ((Elab_dMeta.v_foldAppTerms (Core_dTerm.C_Term_TGlobal (dtb_u_u1067))) dtb_u_u1069)))))

# 1352 "Vuna/Compiler/Elab/Trait.vuna"
let v_injectDictGo = (fun (dtb_u_u1071 : string) (dtb_u_u1072 : string) (dtb_u_u1073 : int) (dtb_u_u1074 : int) (dtb_u_u1075 : Core_dTerm.t_Term) -> ((((((v_injectDictGoFuel (v_injectBudgetFor dtb_u_u1075)) dtb_u_u1071) dtb_u_u1072) dtb_u_u1073) dtb_u_u1074) dtb_u_u1075))

# 1349 "Vuna/Compiler/Elab/Trait.vuna"
let v_insertDictCalls = (fun (dtb_u_u1076 : string) (dtb_u_u1077 : string) (dtb_u_u1078 : int) (dtb_u_u1079 : Core_dTerm.t_Term) -> (((((v_injectDictGo dtb_u_u1076) dtb_u_u1077) dtb_u_u1078) 0) dtb_u_u1079))

# 1323 "Vuna/Compiler/Elab/Trait.vuna"
let rec v_insertPlannedCalls = (fun (dtb_u_u1080 : string) (dtb_u_u1081 : t_DictPlan B_dData_dList.t_List) (dtb_u_u1082 : Core_dTerm.t_Term) -> (match dtb_u_u1081 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u1083, dtb_u_u1084) -> (match dtb_u_u1083 with
  | { f_DictPlan_dpName = dtb_u_u1085; f_DictPlan_dpLevel = dtb_u_u1086; f_DictPlan_dpDom = dtb_u_u1087; f_DictPlan_dpMetas = dtb_u_u1088 } -> (((v_insertPlannedCalls dtb_u_u1080) dtb_u_u1084) ((((v_insertDictCalls dtb_u_u1080) dtb_u_u1085) dtb_u_u1086) dtb_u_u1082))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> dtb_u_u1082
  | _ -> failwith "DT: impossible branch"
))

# 1329 "Vuna/Compiler/Elab/Trait.vuna"
let v_liftFreeDictGoals = (fun (dtb_u_u1089 : string) (dtb_u_u1090 : int) (dtb_u_u1091 : Elab_dTypes.t_Ec) (dtb_u_u1092 : Core_dTerm.t_Term) (dtb_u_u1093 : Core_dTerm.t_Term) -> (match (Elab_dTypes.v_ecPendingList dtb_u_u1091) with
  | B_dData_dList.C_List_Nil -> { B_dData_dPair.f_Pair_first = dtb_u_u1092; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = dtb_u_u1093; B_dData_dPair.f_Pair_second = dtb_u_u1091 } }
  | _ -> (let dtb_u_u1094 = (v_dictAnchor dtb_u_u1092) in (let dtb_u_u1095 = (((v_planDictBinders dtb_u_u1094) dtb_u_u1091) ((v_freeDictGoals dtb_u_u1090) dtb_u_u1091)) in (let dtb_u_u1096 = (B_dData_dPair.v_firstOf dtb_u_u1095) in (let dtb_u_u1097 = (B_dData_dList.v_reverse dtb_u_u1096) in (let dtb_u_u1098 = (((v_insertDictPis dtb_u_u1094) dtb_u_u1097) dtb_u_u1092) in (let dtb_u_u1099 = (((v_insertDictLams dtb_u_u1094) dtb_u_u1097) dtb_u_u1093) in (let dtb_u_u1100 = ((v_substPlannedMetas dtb_u_u1096) dtb_u_u1099) in (let dtb_u_u1101 = (((v_insertPlannedCalls dtb_u_u1089) dtb_u_u1097) dtb_u_u1100) in { B_dData_dPair.f_Pair_first = dtb_u_u1098; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = dtb_u_u1101; B_dData_dPair.f_Pair_second = (B_dData_dPair.v_secondOf dtb_u_u1095) } }))))))))
))

# 1399 "Vuna/Compiler/Elab/Trait.vuna"
let v_injectAltGo = (fun (dtb_u_u1102 : string) (dtb_u_u1103 : string) (dtb_u_u1104 : int) (dtb_u_u1105 : int) (dtb_u_u1106 : Core_dTerm.t_CaseAlt) -> ((((((v_injectAltGoFuel (v_altBudgetFor dtb_u_u1106)) dtb_u_u1102) dtb_u_u1103) dtb_u_u1104) dtb_u_u1105) dtb_u_u1106))

# 1411 "Vuna/Compiler/Elab/Trait.vuna"
let v_rewriteTaggedSpine = (fun (dtb_u_u1107 : string) (dtb_u_u1108 : string) (dtb_u_u1109 : int) (dtb_u_u1110 : int) (dtb_u_u1111 : string) (dtb_u_u1112 : (Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (((((((v_rewriteTaggedSpineFuel (64 + (4 * (v_spineSize dtb_u_u1112)))) dtb_u_u1107) dtb_u_u1108) dtb_u_u1109) dtb_u_u1110) dtb_u_u1111) dtb_u_u1112))

# 1432 "Vuna/Compiler/Elab/Trait.vuna"
let[@tail_mod_cons] rec v_replaceGlobalType = (fun (dtb_u_u1113 : string) (dtb_u_u1114 : Core_dTerm.t_Term) (dtb_u_u1115 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match dtb_u_u1115 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u1116, dtb_u_u1117) -> (if ((B_dData_dPair.v_firstOf dtb_u_u1116) = dtb_u_u1113) then (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb_u_u1113; B_dData_dPair.f_Pair_second = dtb_u_u1114 }, dtb_u_u1117)) else (B_dData_dList.C_List__x58__x58_ (dtb_u_u1116, (((v_replaceGlobalType dtb_u_u1113) dtb_u_u1114) dtb_u_u1117))))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 1438 "Vuna/Compiler/Elab/Trait.vuna"
let rec v_foldlAddInst = (fun (dtb_u_u1118 : Elab_dTypes.t_Ec) (dtb_u_u1119 : Elab_dTypes.t_DtInst B_dData_dList.t_List) -> (match dtb_u_u1119 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u1120, dtb_u_u1121) -> ((v_foldlAddInst ((Elab_dTypes.v_ecAddInst dtb_u_u1118) dtb_u_u1120)) dtb_u_u1121)
  | B_dData_dList.C_List_Nil -> dtb_u_u1118
  | _ -> failwith "DT: impossible branch"
))

# 1525 "Vuna/Compiler/Elab/Trait.vuna"
let v_defBodyOf = (fun (dtb_u_u1122 : (string, Core_dTerm.t_Term) B_dContainer_dHashMap.t_HashMap) (dtb_u_u1123 : string) -> (match ((Core_dTerm.v_defLookup dtb_u_u1123) dtb_u_u1122) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u1124) -> (Base_dDiag.C_Check_OkC (dtb_u_u1124))
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.v_icInternal ("instance body missing for " ^ dtb_u_u1123))
  | _ -> failwith "DT: impossible branch"
))

# 1535 "Vuna/Compiler/Elab/Trait.vuna"
let rec v_elabTraitsGo = (fun (dtb_u_u1125 : (Frontend_dAst.t_Decl, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u1126 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u1127 : Elab_dTypes.t_Ec) (dtb_u_u1128 : Elab_dTypes.t_DtData B_dData_dList.t_List) (dtb_u_u1129 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u1130 : Elab_dTypes.t_DtClass B_dData_dList.t_List) (dtb_u_u1131 : (string, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match dtb_u_u1125 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u1132, dtb_u_u1133) -> ((Base_dCommon.v_bind (((v_elabTrait dtb_u_u1126) dtb_u_u1127) dtb_u_u1132)) (fun (dtb_u_u1134 : (Elab_dTypes.t_DtData, ((string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List, (Elab_dTypes.t_DtClass, ((string, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let dtb_u_u1135 = dtb_u_u1134 in (match dtb_u_u1135 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u1136; B_dData_dPair.f_Pair_second = dtb_u_u1137 } -> (match dtb_u_u1137 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u1138; B_dData_dPair.f_Pair_second = dtb_u_u1139 } -> (match dtb_u_u1139 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u1140; B_dData_dPair.f_Pair_second = dtb_u_u1141 } -> (match dtb_u_u1141 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u1142; B_dData_dPair.f_Pair_second = dtb_u_u1143 } -> (((((((v_elabTraitsGo dtb_u_u1133) ((B_dData_dList.v_append dtb_u_u1126) dtb_u_u1138)) dtb_u_u1143) (B_dData_dList.C_List__x58__x58_ (dtb_u_u1136, dtb_u_u1128))) ((B_dData_dList.v_append dtb_u_u1138) dtb_u_u1129)) (B_dData_dList.C_List__x58__x58_ (dtb_u_u1140, dtb_u_u1130))) ((B_dData_dList.v_append dtb_u_u1142) dtb_u_u1131))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.v_reverse dtb_u_u1128); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = (B_dData_dList.v_reverse dtb_u_u1129); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = (B_dData_dList.v_reverse dtb_u_u1130); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = (B_dData_dList.v_reverse dtb_u_u1131); B_dData_dPair.f_Pair_second = dtb_u_u1127 } } } }))
  | _ -> failwith "DT: impossible branch"
))

# 1532 "Vuna/Compiler/Elab/Trait.vuna"
let v_elabTraits = (fun (dtb_u_u1144 : (Frontend_dAst.t_Decl, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u1145 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u1146 : Elab_dTypes.t_Ec) -> (((((((v_elabTraitsGo dtb_u_u1144) dtb_u_u1145) dtb_u_u1146) B_dData_dList.C_List_Nil) B_dData_dList.C_List_Nil) B_dData_dList.C_List_Nil) B_dData_dList.C_List_Nil))

# 1576 "Vuna/Compiler/Elab/Trait.vuna"
let rec v_spanOfName = (fun (dtb_u_u1147 : string) (dtb_u_u1148 : (string, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match dtb_u_u1148 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u1149, dtb_u_u1150) -> (match dtb_u_u1149 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u1151; B_dData_dPair.f_Pair_second = dtb_u_u1152 } -> (if (dtb_u_u1151 = dtb_u_u1147) then (B_dData_dMaybe.C_Maybe_Just (dtb_u_u1152)) else ((v_spanOfName dtb_u_u1147) dtb_u_u1150))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 1580 "Vuna/Compiler/Elab/Trait.vuna"
let v_defTypeOfTbl = (fun (dtb_u_u1153 : (string, Core_dTerm.t_Term) B_dContainer_dHashMap.t_HashMap) (dtb_u_u1154 : string) -> (match ((((B_dContainer_dHashMap.v_lookup B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) dtb_u_u1154) dtb_u_u1153) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u1155) -> (Base_dDiag.C_Check_OkC (dtb_u_u1155))
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.v_icInternal ("generated definition has no type: " ^ dtb_u_u1154))
  | _ -> failwith "DT: impossible branch"
))

# 1518 "Vuna/Compiler/Elab/Trait.vuna"
let rec v_instanceDefsGo = (fun (dtb_u_u1156 : Elab_dTypes.t_Ec) (dtb_u_u1157 : Base_dSource.t_Span B_dData_dMaybe.t_Maybe) (dtb_u_u1158 : (string, Core_dTerm.t_Term) B_dContainer_dHashMap.t_HashMap) (dtb_u_u1159 : (string, Core_dTerm.t_Term) B_dContainer_dHashMap.t_HashMap) (dtb_u_u1160 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u1161 : Elab_dTypes.t_DtDef B_dData_dList.t_List) -> (match dtb_u_u1160 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u1162, dtb_u_u1163) -> ((Base_dCommon.v_bind ((v_defTypeOfTbl dtb_u_u1158) (B_dData_dPair.v_firstOf dtb_u_u1162))) (fun (dtb_u_u1164 : Core_dTerm.t_Term) -> ((Base_dCommon.v_bind ((v_defBodyOf dtb_u_u1159) (B_dData_dPair.v_firstOf dtb_u_u1162))) (fun (dtb_u_u1165 : Core_dTerm.t_Term) -> ((((((v_instanceDefsGo dtb_u_u1156) dtb_u_u1157) dtb_u_u1158) dtb_u_u1159) dtb_u_u1163) (B_dData_dList.C_List__x58__x58_ ((Elab_dTypes.C_DtDef_DtDef ((B_dData_dPair.v_firstOf dtb_u_u1162), dtb_u_u1164, ((Elab_dDict.v_substDictTerm dtb_u_u1156) dtb_u_u1165), dtb_u_u1157)), dtb_u_u1161)))))))
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC ((B_dData_dList.v_reverse dtb_u_u1161)))
  | _ -> failwith "DT: impossible branch"
))

# 1514 "Vuna/Compiler/Elab/Trait.vuna"
let v_instanceDefsOf = (fun (dtb_u_u1166 : Elab_dTypes.t_Ec) (dtb_u_u1167 : Elab_dTypes.t_Ec) (dtb_u_u1168 : Base_dSource.t_Span B_dData_dMaybe.t_Maybe) (dtb_u_u1169 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) -> ((((((v_instanceDefsGo dtb_u_u1167) dtb_u_u1168) (((B_dContainer_dHashMap.v_fromList B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) dtb_u_u1169)) (Elab_dTypes.v_ecDefTbl dtb_u_u1167)) dtb_u_u1169) B_dData_dList.C_List_Nil))

# 1566 "Vuna/Compiler/Elab/Trait.vuna"
let rec v_extraDefsGo = (fun (dtb_u_u1170 : (string, Core_dTerm.t_Term) B_dContainer_dHashMap.t_HashMap) (dtb_u_u1171 : (string, bool) B_dContainer_dHashMap.t_HashMap) (dtb_u_u1172 : (string, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u1173 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u1174 : Elab_dTypes.t_DtDef B_dData_dList.t_List) -> (match dtb_u_u1173 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u1175, dtb_u_u1176) -> (if ((((B_dContainer_dHashMap.v_member B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) (B_dData_dPair.v_firstOf dtb_u_u1175)) dtb_u_u1171) then (((((v_extraDefsGo dtb_u_u1170) dtb_u_u1171) dtb_u_u1172) dtb_u_u1176) dtb_u_u1174) else ((Base_dCommon.v_bind ((v_defTypeOfTbl dtb_u_u1170) (B_dData_dPair.v_firstOf dtb_u_u1175))) (fun (dtb_u_u1177 : Core_dTerm.t_Term) -> (((((v_extraDefsGo dtb_u_u1170) dtb_u_u1171) dtb_u_u1172) dtb_u_u1176) (B_dData_dList.C_List__x58__x58_ ((Elab_dTypes.C_DtDef_DtDef ((B_dData_dPair.v_firstOf dtb_u_u1175), dtb_u_u1177, (B_dData_dPair.v_secondOf dtb_u_u1175), ((v_spanOfName (B_dData_dPair.v_firstOf dtb_u_u1175)) dtb_u_u1172))), dtb_u_u1174))))))
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC ((B_dData_dList.v_reverse dtb_u_u1174)))
  | _ -> failwith "DT: impossible branch"
))

# 1562 "Vuna/Compiler/Elab/Trait.vuna"
let v_extraDefsOf = (fun (dtb_u_u1178 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u1179 : Elab_dTypes.t_Ec) (dtb_u_u1180 : (string, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u1181 : Elab_dTypes.t_DtDef B_dData_dList.t_List) -> (((((v_extraDefsGo (Elab_dTypes.v_ecGlobalsTbl dtb_u_u1179)) (B_dContainer_dHashMap.v_ofNames ((B_dData_dList.v_map Elab_dTypes.v_dtDefName) dtb_u_u1181))) dtb_u_u1180) (Elab_dTypes.v_ecDefs dtb_u_u1179)) B_dData_dList.C_List_Nil))

# 1597 "Vuna/Compiler/Elab/Trait.vuna"
let rec v_bindDictBinderFuel = (fun (dtb_u_u1182 : int) (dtb_u_u1183 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u1184 : Elab_dTypes.t_Ctx) (dtb_u_u1185 : Elab_dTypes.t_Ec) (dtb_u_u1186 : Core_dTerm.t_Rig) (dtb_u_u1187 : string) (dtb_u_u1188 : Core_dTerm.t_Value) (dtb_u_u1189 : Core_dTerm.t_Closure) (dtb_u_u1190 : Frontend_dAst.t_Pat B_dData_dList.t_List) (dtb_u_u1191 : Frontend_dAst.t_Expr) (dtb_u_u1192 : Base_dSource.t_Span) -> (if (dtb_u_u1182 <= 0) then (Base_dDiag.v_icFuel "binder check") else (let dtb_u_u1193 = (Elab_dTypes.v_ctxDepth dtb_u_u1184) in (let dtb_u_u1194 = ((Elab_dMeta.v_freshVarValue dtb_u_u1187) dtb_u_u1193) in (let dtb_u_u1195 = (((Elab_dTypes.v_ctxBindValue dtb_u_u1187) dtb_u_u1188) dtb_u_u1184) in (let dtb_u_u1196 = ((Core_dEval.v_applyClosure dtb_u_u1189) dtb_u_u1194) in ((Base_dCommon.v_bind ((((((((v_checkBindersFuel (dtb_u_u1182 - 1)) dtb_u_u1183) dtb_u_u1195) dtb_u_u1185) dtb_u_u1190) dtb_u_u1191) dtb_u_u1196) dtb_u_u1192)) (fun (dtb_u_u1197 : (Core_dTerm.t_Term, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match dtb_u_u1197 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u1198; B_dData_dPair.f_Pair_second = dtb_u_u1199 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Core_dTerm.C_Term_TLam (dtb_u_u1187, dtb_u_u1186, B_dData_dMaybe.C_Maybe_Nothing, Base_dSource.v_spanEmpty, dtb_u_u1198)); B_dData_dPair.f_Pair_second = dtb_u_u1199 }))
  | _ -> failwith "DT: impossible branch"
)))))))))
# 1614 "Vuna/Compiler/Elab/Trait.vuna"
and v_bindIndexBinderFuel = (fun (dtb_u_u1200 : int) (dtb_u_u1201 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u1202 : Elab_dTypes.t_Ctx) (dtb_u_u1203 : Elab_dTypes.t_Ec) (dtb_u_u1204 : Core_dTerm.t_Rig) (dtb_u_u1205 : string) (dtb_u_u1206 : Core_dTerm.t_Value) (dtb_u_u1207 : Core_dTerm.t_Closure) (dtb_u_u1208 : Frontend_dAst.t_Pat B_dData_dList.t_List) (dtb_u_u1209 : Frontend_dAst.t_Expr) (dtb_u_u1210 : Base_dSource.t_Span) -> (if (dtb_u_u1200 <= 0) then (Base_dDiag.v_icFuel "binder check") else (let dtb_u_u1211 = (Elab_dTypes.v_ctxDepth dtb_u_u1202) in (let dtb_u_u1212 = ((Elab_dMeta.v_freshVarValue dtb_u_u1205) dtb_u_u1211) in (let dtb_u_u1213 = (((Elab_dTypes.v_ctxBindValue dtb_u_u1205) dtb_u_u1206) dtb_u_u1202) in (let dtb_u_u1214 = ((Core_dEval.v_applyClosure dtb_u_u1207) dtb_u_u1212) in ((Base_dCommon.v_bind ((((((((v_checkBindersFuel (dtb_u_u1200 - 1)) dtb_u_u1201) dtb_u_u1213) dtb_u_u1203) dtb_u_u1208) dtb_u_u1209) dtb_u_u1214) dtb_u_u1210)) (fun (dtb_u_u1215 : (Core_dTerm.t_Term, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match dtb_u_u1215 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u1216; B_dData_dPair.f_Pair_second = dtb_u_u1217 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Core_dTerm.C_Term_TLam (dtb_u_u1205, dtb_u_u1204, B_dData_dMaybe.C_Maybe_Nothing, Base_dSource.v_spanEmpty, dtb_u_u1216)); B_dData_dPair.f_Pair_second = dtb_u_u1217 }))
  | _ -> failwith "DT: impossible branch"
)))))))))
# 1634 "Vuna/Compiler/Elab/Trait.vuna"
and v_checkBodyAtEndFuel = (fun (dtb_u_u1218 : int) (dtb_u_u1219 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u1220 : Elab_dTypes.t_Ctx) (dtb_u_u1221 : Elab_dTypes.t_Ec) (dtb_u_u1222 : Frontend_dAst.t_Expr) (dtb_u_u1223 : Core_dTerm.t_Value) (dtb_u_u1224 : Base_dSource.t_Span) -> (if (dtb_u_u1218 <= 0) then (Base_dDiag.v_icFuel "binder check") else (match ((Elab_dTypes.v_forceVal dtb_u_u1221) dtb_u_u1223) with
  | Core_dTerm.C_Value_VPi (dtb_u_u1225, dtb_u_u1226, dtb_u_u1227, dtb_u_u1228, dtb_u_u1229) -> (if dtb_u_u1226 then (if ((Elab_dDict.v_isDictDomain dtb_u_u1221) dtb_u_u1228) then (((((((((((v_bindDictBinderFuel (dtb_u_u1218 - 1)) dtb_u_u1219) dtb_u_u1220) dtb_u_u1221) dtb_u_u1227) dtb_u_u1225) dtb_u_u1228) dtb_u_u1229) B_dData_dList.C_List_Nil) dtb_u_u1222) dtb_u_u1224) else (if (((Elab_dMeta.v_isImplicitDomain dtb_u_u1220) dtb_u_u1221) dtb_u_u1228) then (((((((((((v_bindIndexBinderFuel (dtb_u_u1218 - 1)) dtb_u_u1219) dtb_u_u1220) dtb_u_u1221) dtb_u_u1227) dtb_u_u1225) dtb_u_u1228) dtb_u_u1229) B_dData_dList.C_List_Nil) dtb_u_u1222) dtb_u_u1224) else ((Base_dDiagnostics_dTc.v_tcErr0 dtb_u_u1224) Base_dDiagnostics_dTc.C_TcErr_ImplicitParamKind))) else ((Base_dCommon.v_bind (((((Elab_dTerm.v_checkE dtb_u_u1219) dtb_u_u1220) dtb_u_u1221) dtb_u_u1222) dtb_u_u1223)) (fun (dtb_u_u1230 : (Core_dTerm.t_Term, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> ((Base_dCommon.v_bind ((((Elab_dDict.v_resolveRowGoalsCtx dtb_u_u1219) dtb_u_u1220) (B_dData_dPair.v_secondOf dtb_u_u1230)) dtb_u_u1224)) (fun (dtb_u_u1231 : Elab_dTypes.t_Ec) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dPair.v_firstOf dtb_u_u1230); B_dData_dPair.f_Pair_second = dtb_u_u1231 })))))))
  | _ -> ((Base_dCommon.v_bind (((((Elab_dTerm.v_checkE dtb_u_u1219) dtb_u_u1220) dtb_u_u1221) dtb_u_u1222) dtb_u_u1223)) (fun (dtb_u_u1232 : (Core_dTerm.t_Term, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> ((Base_dCommon.v_bind ((((Elab_dDict.v_resolveRowGoalsCtx dtb_u_u1219) dtb_u_u1220) (B_dData_dPair.v_secondOf dtb_u_u1232)) dtb_u_u1224)) (fun (dtb_u_u1233 : Elab_dTypes.t_Ec) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dPair.v_firstOf dtb_u_u1232); B_dData_dPair.f_Pair_second = dtb_u_u1233 }))))))
)))
# 1643 "Vuna/Compiler/Elab/Trait.vuna"
and v_checkBindersFuel = (fun (dtb_u_u1234 : int) (dtb_u_u1235 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u1236 : Elab_dTypes.t_Ctx) (dtb_u_u1237 : Elab_dTypes.t_Ec) (dtb_u_u1238 : Frontend_dAst.t_Pat B_dData_dList.t_List) (dtb_u_u1239 : Frontend_dAst.t_Expr) (dtb_u_u1240 : Core_dTerm.t_Value) (dtb_u_u1241 : Base_dSource.t_Span) -> (match dtb_u_u1238 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u1242, dtb_u_u1243) -> (if (dtb_u_u1234 <= 0) then (Base_dDiag.v_icFuel "binder check") else (let dtb_u_u1244 = ((Elab_dTypes.v_forceVal dtb_u_u1237) dtb_u_u1240) in (match dtb_u_u1244 with
  | Core_dTerm.C_Value_VPi (dtb_u_u1245, dtb_u_u1246, dtb_u_u1247, dtb_u_u1248, dtb_u_u1249) -> (if dtb_u_u1246 then (if ((Elab_dDict.v_isDictDomain dtb_u_u1237) dtb_u_u1248) then (((((((((((v_bindDictBinderFuel (dtb_u_u1234 - 1)) dtb_u_u1235) dtb_u_u1236) dtb_u_u1237) dtb_u_u1247) dtb_u_u1245) dtb_u_u1248) dtb_u_u1249) (B_dData_dList.C_List__x58__x58_ (dtb_u_u1242, dtb_u_u1243))) dtb_u_u1239) dtb_u_u1241) else (if (((Elab_dMeta.v_isImplicitDomain dtb_u_u1236) dtb_u_u1237) dtb_u_u1248) then (((((((((((v_bindIndexBinderFuel (dtb_u_u1234 - 1)) dtb_u_u1235) dtb_u_u1236) dtb_u_u1237) dtb_u_u1247) dtb_u_u1245) dtb_u_u1248) dtb_u_u1249) (B_dData_dList.C_List__x58__x58_ (dtb_u_u1242, dtb_u_u1243))) dtb_u_u1239) dtb_u_u1241) else ((Base_dDiagnostics_dTc.v_tcErr0 dtb_u_u1241) Base_dDiagnostics_dTc.C_TcErr_ImplicitParamKind))) else (match dtb_u_u1242 with
  | Frontend_dAst.C_Pat_PVar (dtb_u_u1250, dtb_u_u1251) -> ((((((((((((v_bindOnePatternFuel (dtb_u_u1234 - 1)) dtb_u_u1235) dtb_u_u1236) dtb_u_u1237) dtb_u_u1247) dtb_u_u1250) dtb_u_u1243) dtb_u_u1239) dtb_u_u1248) dtb_u_u1249) ((Base_dSource.v_spanAtName dtb_u_u1250) (Frontend_dAst.v_nodeRefSpan dtb_u_u1251))) dtb_u_u1241)
  | Frontend_dAst.C_Pat_PWild (dtb_u_u1252) -> ((((((((((((v_bindOnePatternFuel (dtb_u_u1234 - 1)) dtb_u_u1235) dtb_u_u1236) dtb_u_u1237) dtb_u_u1247) "_") dtb_u_u1243) dtb_u_u1239) dtb_u_u1248) dtb_u_u1249) (Frontend_dAst.v_nodeRefSpan dtb_u_u1252)) dtb_u_u1241)
  | _ -> ((Base_dDiagnostics_dTc.v_tcErr0 (Frontend_dAst.v_patSpan dtb_u_u1242)) Base_dDiagnostics_dTc.C_TcErr_DefParamsMustBeVars)
))
  | _ -> ((Base_dDiagnostics_dTc.v_tcErr0 dtb_u_u1241) Base_dDiagnostics_dTc.C_TcErr_DefMoreParams)
)))
  | B_dData_dList.C_List_Nil -> (if (dtb_u_u1234 <= 0) then (Base_dDiag.v_icFuel "binder check") else (let dtb_u_u1253 = ((Elab_dTypes.v_forceVal dtb_u_u1237) dtb_u_u1240) in (match dtb_u_u1253 with
  | Core_dTerm.C_Value_VPi (dtb_u_u1254, dtb_u_u1255, dtb_u_u1256, dtb_u_u1257, dtb_u_u1258) -> (if dtb_u_u1255 then (if ((Elab_dDict.v_isDictDomain dtb_u_u1237) dtb_u_u1257) then (((((((((((v_bindDictBinderFuel (dtb_u_u1234 - 1)) dtb_u_u1235) dtb_u_u1236) dtb_u_u1237) dtb_u_u1256) dtb_u_u1254) dtb_u_u1257) dtb_u_u1258) B_dData_dList.C_List_Nil) dtb_u_u1239) dtb_u_u1241) else (if (((Elab_dMeta.v_isImplicitDomain dtb_u_u1236) dtb_u_u1237) dtb_u_u1257) then (((((((((((v_bindIndexBinderFuel (dtb_u_u1234 - 1)) dtb_u_u1235) dtb_u_u1236) dtb_u_u1237) dtb_u_u1256) dtb_u_u1254) dtb_u_u1257) dtb_u_u1258) B_dData_dList.C_List_Nil) dtb_u_u1239) dtb_u_u1241) else ((Base_dDiagnostics_dTc.v_tcErr0 dtb_u_u1241) Base_dDiagnostics_dTc.C_TcErr_ImplicitParamKind))) else ((Base_dCommon.v_bind ((Base_dObs.v_obsCheck "vuna.elab.term.body") (fun (dtb_u_u1259 : int) -> (((((((v_checkBodyAtEndFuel (dtb_u_u1234 - 1)) dtb_u_u1235) dtb_u_u1236) dtb_u_u1237) dtb_u_u1239) dtb_u_u1240) dtb_u_u1241)))) (fun (dtb_u_u1260 : (Core_dTerm.t_Term, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> ((Base_dCommon.v_bind ((Base_dObs.v_obsCheck "vuna.elab.term.goals") (fun (dtb_u_u1261 : int) -> ((((Elab_dDict.v_resolveRowGoalsCtx dtb_u_u1235) dtb_u_u1236) (B_dData_dPair.v_secondOf dtb_u_u1260)) dtb_u_u1241)))) (fun (dtb_u_u1262 : Elab_dTypes.t_Ec) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dPair.v_firstOf dtb_u_u1260); B_dData_dPair.f_Pair_second = dtb_u_u1262 })))))))
  | _ -> ((Base_dCommon.v_bind ((Base_dObs.v_obsCheck "vuna.elab.term.body") (fun (dtb_u_u1263 : int) -> (((((Elab_dTerm.v_checkE dtb_u_u1235) dtb_u_u1236) dtb_u_u1237) dtb_u_u1239) dtb_u_u1240)))) (fun (dtb_u_u1264 : (Core_dTerm.t_Term, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> ((Base_dCommon.v_bind ((Base_dObs.v_obsCheck "vuna.elab.term.goals") (fun (dtb_u_u1265 : int) -> ((((Elab_dDict.v_resolveRowGoalsCtx dtb_u_u1235) dtb_u_u1236) (B_dData_dPair.v_secondOf dtb_u_u1264)) dtb_u_u1241)))) (fun (dtb_u_u1266 : Elab_dTypes.t_Ec) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dPair.v_firstOf dtb_u_u1264); B_dData_dPair.f_Pair_second = dtb_u_u1266 }))))))
)))
  | _ -> failwith "DT: impossible branch"
))
# 1670 "Vuna/Compiler/Elab/Trait.vuna"
and v_bindOnePatternFuel = (fun (dtb_u_u1267 : int) (dtb_u_u1268 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u1269 : Elab_dTypes.t_Ctx) (dtb_u_u1270 : Elab_dTypes.t_Ec) (dtb_u_u1271 : Core_dTerm.t_Rig) (dtb_u_u1272 : string) (dtb_u_u1273 : Frontend_dAst.t_Pat B_dData_dList.t_List) (dtb_u_u1274 : Frontend_dAst.t_Expr) (dtb_u_u1275 : Core_dTerm.t_Value) (dtb_u_u1276 : Core_dTerm.t_Closure) (dtb_u_u1277 : Base_dSource.t_Span) (dtb_u_u1278 : Base_dSource.t_Span) -> (if (dtb_u_u1267 <= 0) then (Base_dDiag.v_icFuel "binder check") else (let dtb_u_u1279 = (Elab_dTypes.v_ctxDepth dtb_u_u1269) in (let dtb_u_u1280 = ((Elab_dMeta.v_freshVarValue dtb_u_u1272) dtb_u_u1279) in (let dtb_u_u1281 = (((Elab_dTypes.v_ctxBindValue dtb_u_u1272) dtb_u_u1275) dtb_u_u1269) in ((Base_dCommon.v_bind (((((Elab_dMeta.v_rigForLinearDomain dtb_u_u1270) dtb_u_u1278) dtb_u_u1272) dtb_u_u1271) dtb_u_u1275)) (fun (dtb_u_u1282 : Core_dTerm.t_Rig) -> ((Base_dCommon.v_bind ((((((((v_checkBindersFuel (dtb_u_u1267 - 1)) dtb_u_u1268) dtb_u_u1281) dtb_u_u1270) dtb_u_u1273) dtb_u_u1274) ((Core_dEval.v_applyClosure dtb_u_u1276) dtb_u_u1280)) dtb_u_u1278)) (fun (dtb_u_u1283 : (Core_dTerm.t_Term, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match dtb_u_u1283 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u1284; B_dData_dPair.f_Pair_second = dtb_u_u1285 } -> (let dtb_u_u1286 = (if (((Elab_dMeta.v_isOpaqueRuntimeTyIn dtb_u_u1285) dtb_u_u1269) dtb_u_u1275) then ((Elab_dMeta.v_wrapOpaqueUses (B_dData_dList.C_List__x58__x58_ (0, B_dData_dList.C_List_Nil))) dtb_u_u1284) else dtb_u_u1284) in (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Core_dTerm.C_Term_TLam (dtb_u_u1272, dtb_u_u1282, B_dData_dMaybe.C_Maybe_Nothing, dtb_u_u1277, dtb_u_u1286)); B_dData_dPair.f_Pair_second = dtb_u_u1285 })))
  | _ -> failwith "DT: impossible branch"
))))))))))

# 1733 "Vuna/Compiler/Elab/Trait.vuna"
let v_checkBinders = (fun (dtb_u_u1287 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u1288 : Elab_dTypes.t_Ctx) (dtb_u_u1289 : Elab_dTypes.t_Ec) (dtb_u_u1290 : Frontend_dAst.t_Pat B_dData_dList.t_List) (dtb_u_u1291 : Frontend_dAst.t_Expr) (dtb_u_u1292 : Core_dTerm.t_Value) (dtb_u_u1293 : Base_dSource.t_Span) -> ((((((((v_checkBindersFuel 512) dtb_u_u1287) dtb_u_u1288) dtb_u_u1289) dtb_u_u1290) dtb_u_u1291) dtb_u_u1292) dtb_u_u1293))

# 1589 "Vuna/Compiler/Elab/Trait.vuna"
let v_checkDefIn = (fun (dtb_u_u1294 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u1295 : Elab_dTypes.t_Ctx) (dtb_u_u1296 : Elab_dTypes.t_Ec) (dtb_u_u1297 : Frontend_dAst.t_Pat B_dData_dList.t_List) (dtb_u_u1298 : Frontend_dAst.t_Expr) (dtb_u_u1299 : Core_dTerm.t_Value) (dtb_u_u1300 : Base_dSource.t_Span) -> (((((((v_checkBinders dtb_u_u1294) dtb_u_u1295) dtb_u_u1296) dtb_u_u1297) dtb_u_u1298) dtb_u_u1299) dtb_u_u1300))

# 1593 "Vuna/Compiler/Elab/Trait.vuna"
let v_checkDef = (fun (dtb_u_u1301 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u1302 : Elab_dTypes.t_Ec) (dtb_u_u1303 : Frontend_dAst.t_Pat B_dData_dList.t_List) (dtb_u_u1304 : Frontend_dAst.t_Expr) (dtb_u_u1305 : Core_dTerm.t_Value) (dtb_u_u1306 : Base_dSource.t_Span) -> (((((((v_checkDefIn dtb_u_u1301) Elab_dTypes.v_emptyCtx) dtb_u_u1302) dtb_u_u1303) dtb_u_u1304) dtb_u_u1305) dtb_u_u1306))

# 1709 "Vuna/Compiler/Elab/Trait.vuna"
let v_elabFunDefMulti = (fun (dtb_u_u1307 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u1308 : Elab_dTypes.t_Ctx) (dtb_u_u1309 : Elab_dTypes.t_Ec) (dtb_u_u1310 : (Frontend_dAst.t_Pat B_dData_dList.t_List, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u1311 : Core_dTerm.t_Value) (dtb_u_u1312 : Base_dSource.t_Span) -> (let dtb_u_u1313 = (if ((dtp_log_on 3) "Vuna.Compiler.Elab.Trait") then (((dtp_log_emit 3) "Vuna.Compiler.Elab.Trait") "MULTI") else 0) in ((Base_dCommon.v_bind ((Base_dObs.v_obsCheck "vuna.elab.pats") (fun (dtb_u_u1314 : int) -> ((((Elab_dTerm.v_resolveOverFunPats dtb_u_u1309) dtb_u_u1308) dtb_u_u1311) dtb_u_u1310)))) (fun (dtb_u_u1315 : ((Frontend_dAst.t_Pat B_dData_dList.t_List, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match dtb_u_u1315 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u1316; B_dData_dPair.f_Pair_second = dtb_u_u1317 } -> (let dtb_u_u1318 = (Elab_dMeta.v_ctorFamilyTable dtb_u_u1317) in ((Base_dCommon.v_bind ((Base_dObs.v_obsCheck "vuna.elab.pats") (fun (dtb_u_u1319 : int) -> ((Elab_dMatch.v_multiToExpr dtb_u_u1318) dtb_u_u1316)))) (fun (dtb_u_u1320 : Frontend_dAst.t_Expr) -> (let dtb_u_u1321 = (if ((dtp_log_on 3) "Vuna.Compiler.Elab.Trait") then (((dtp_log_emit 3) "Vuna.Compiler.Elab.Trait") "CHECKDEF") else 0) in (let dtb_u_u1322 = ((Base_dObs.v_obsCheck "vuna.elab.term") (fun (dtb_u_u1325 : int) -> (((((((v_checkDefIn dtb_u_u1307) dtb_u_u1308) dtb_u_u1317) B_dData_dList.C_List_Nil) dtb_u_u1320) dtb_u_u1311) dtb_u_u1312))) in ((Base_dObs.v_obsCheck "vuna.elab.coverage") (fun (dtb_u_u1323 : int) -> ((((Elab_dCoverage.v_improveExhaustive dtb_u_u1318) (fun (dtb_u_u1324 : int) -> (Elab_dMatch.v_matrixOf dtb_u_u1316))) (Elab_dMatch.v_firstPatSpan dtb_u_u1316)) dtb_u_u1322))))))))
  | _ -> failwith "DT: impossible branch"
)))))

# 1698 "Vuna/Compiler/Elab/Trait.vuna"
let v_elabFunDefIn = (fun (dtb_u_u1326 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u1327 : Elab_dTypes.t_Ctx) (dtb_u_u1328 : Elab_dTypes.t_Ec) (dtb_u_u1329 : (Frontend_dAst.t_Pat B_dData_dList.t_List, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u1330 : Core_dTerm.t_Value) (dtb_u_u1331 : Base_dSource.t_Span) -> (match dtb_u_u1329 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u1332, dtb_u_u1333) -> (match dtb_u_u1332 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u1334; B_dData_dPair.f_Pair_second = dtb_u_u1335 } -> (match dtb_u_u1333 with
  | B_dData_dList.C_List_Nil -> (if (Elab_dMatch.v_allVarPats dtb_u_u1334) then ((Base_dObs.v_obsCheck "vuna.elab.term") (fun (dtb_u_u1336 : int) -> (((((((v_checkDefIn dtb_u_u1326) dtb_u_u1327) dtb_u_u1328) dtb_u_u1334) dtb_u_u1335) dtb_u_u1330) dtb_u_u1331))) else ((((((v_elabFunDefMulti dtb_u_u1326) dtb_u_u1327) dtb_u_u1328) (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb_u_u1334; B_dData_dPair.f_Pair_second = dtb_u_u1335 }, B_dData_dList.C_List_Nil))) dtb_u_u1330) dtb_u_u1331))
  | _ -> ((((((v_elabFunDefMulti dtb_u_u1326) dtb_u_u1327) dtb_u_u1328) dtb_u_u1329) dtb_u_u1330) dtb_u_u1331)
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> ((Base_dDiagnostics_dTc.v_tcErr0 dtb_u_u1331) Base_dDiagnostics_dTc.C_TcErr_FunctionNoClauses)
  | _ -> failwith "DT: impossible branch"
))

# 1001 "Vuna/Compiler/Elab/Trait.vuna"
let v_elabInstanceMethodIn = (fun (dtb_u_u1337 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u1338 : Elab_dTypes.t_Ctx) (dtb_u_u1339 : Elab_dTypes.t_Ec) (dtb_u_u1340 : Core_dTerm.t_Term) (dtb_u_u1341 : (Frontend_dAst.t_Pat B_dData_dList.t_List, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> ((((((v_elabFunDefIn dtb_u_u1337) dtb_u_u1338) dtb_u_u1339) dtb_u_u1341) ((Elab_dTypes.v_evalCtx dtb_u_u1338) dtb_u_u1340)) (v_clauseSpanOf dtb_u_u1341)))

# 962 "Vuna/Compiler/Elab/Trait.vuna"
let rec v_elabInstanceMethodsGo = (fun (dtb_u_u1342 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u1343 : Elab_dTypes.t_Ctx) (dtb_u_u1344 : int) (dtb_u_u1345 : Elab_dTypes.t_Ec) (dtb_u_u1346 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u1347 : Core_dTerm.t_Term B_dData_dList.t_List) (dtb_u_u1348 : Frontend_dAst.t_Decl B_dData_dList.t_List) (dtb_u_u1349 : Core_dTerm.t_Term B_dData_dList.t_List) (dtb_u_u1350 : (Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u1351 : Base_dSource.t_Span) -> (match dtb_u_u1346 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u1352, dtb_u_u1353) -> (match dtb_u_u1352 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u1354; B_dData_dPair.f_Pair_second = dtb_u_u1355 } -> ((Base_dCommon.v_bind ((v_substInstParams dtb_u_u1347) dtb_u_u1355)) (fun (dtb_u_u1356 : Core_dTerm.t_Term) -> (let dtb_u_u1357 = ((v_methodClausesNamed dtb_u_u1354) dtb_u_u1348) in (let dtb_u_u1358 = (((Core_dTerm.v_shift 0) dtb_u_u1344) dtb_u_u1356) in (match dtb_u_u1357 with
  | B_dData_dList.C_List_Nil -> ((Base_dDiagnostics_dTc.v_tcErr0 dtb_u_u1351) Base_dDiagnostics_dTc.C_TcErr_InstanceMissingMethod)
  | _ -> ((Base_dCommon.v_bind (((((v_elabInstanceMethodIn dtb_u_u1342) dtb_u_u1343) dtb_u_u1345) dtb_u_u1358) dtb_u_u1357)) (fun (dtb_u_u1359 : (Core_dTerm.t_Term, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match dtb_u_u1359 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u1360; B_dData_dPair.f_Pair_second = dtb_u_u1361 } -> ((((((((((v_elabInstanceMethodsGo dtb_u_u1342) dtb_u_u1343) dtb_u_u1344) dtb_u_u1361) dtb_u_u1353) dtb_u_u1347) dtb_u_u1348) (B_dData_dList.C_List__x58__x58_ (dtb_u_u1360, dtb_u_u1349))) (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb_u_u1360; B_dData_dPair.f_Pair_second = Core_dTerm.C_Rig_RigOmega }, dtb_u_u1350))) dtb_u_u1351)
  | _ -> failwith "DT: impossible branch"
)))
)))))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.v_reverse dtb_u_u1349); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = (B_dData_dList.v_reverse dtb_u_u1350); B_dData_dPair.f_Pair_second = dtb_u_u1345 } }))
  | _ -> failwith "DT: impossible branch"
))

# 875 "Vuna/Compiler/Elab/Trait.vuna"
let v_elabInstanceMethodsCtx = (fun (dtb_u_u1362 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u1363 : Elab_dTypes.t_DtClass) (dtb_u_u1364 : Elab_dTypes.t_Ctx) (dtb_u_u1365 : int) (dtb_u_u1366 : Core_dTerm.t_Term B_dData_dList.t_List) (dtb_u_u1367 : Elab_dTypes.t_Ec) (dtb_u_u1368 : Frontend_dAst.t_Decl B_dData_dList.t_List) (dtb_u_u1369 : Base_dSource.t_Span) -> ((((((((((v_elabInstanceMethodsGo dtb_u_u1362) dtb_u_u1364) dtb_u_u1365) dtb_u_u1367) (v_zipClassFields dtb_u_u1363)) dtb_u_u1366) dtb_u_u1368) B_dData_dList.C_List_Nil) B_dData_dList.C_List_Nil) dtb_u_u1369))

# 1005 "Vuna/Compiler/Elab/Trait.vuna"
let v_elabInstanceMethod = (fun (dtb_u_u1370 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u1371 : Elab_dTypes.t_Ec) (dtb_u_u1372 : Core_dTerm.t_Term) (dtb_u_u1373 : (Frontend_dAst.t_Pat B_dData_dList.t_List, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (((((v_elabInstanceMethodIn dtb_u_u1370) Elab_dTypes.v_emptyCtx) dtb_u_u1371) dtb_u_u1372) dtb_u_u1373))

# 1730 "Vuna/Compiler/Elab/Trait.vuna"
let v_elabFunDef = (fun (dtb_u_u1374 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u1375 : Elab_dTypes.t_Ec) (dtb_u_u1376 : (Frontend_dAst.t_Pat B_dData_dList.t_List, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u1377 : Core_dTerm.t_Value) (dtb_u_u1378 : Base_dSource.t_Span) -> ((((((v_elabFunDefIn dtb_u_u1374) Elab_dTypes.v_emptyCtx) dtb_u_u1375) dtb_u_u1376) dtb_u_u1377) dtb_u_u1378))

# 1736 "Vuna/Compiler/Elab/Trait.vuna"
let v_bindIndexBinder = (fun (dtb_u_u1379 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u1380 : Elab_dTypes.t_Ctx) (dtb_u_u1381 : Elab_dTypes.t_Ec) (dtb_u_u1382 : Core_dTerm.t_Rig) (dtb_u_u1383 : string) (dtb_u_u1384 : Core_dTerm.t_Value) (dtb_u_u1385 : Core_dTerm.t_Closure) (dtb_u_u1386 : Frontend_dAst.t_Pat B_dData_dList.t_List) (dtb_u_u1387 : Frontend_dAst.t_Expr) (dtb_u_u1388 : Base_dSource.t_Span) -> (((((((((((v_bindIndexBinderFuel 512) dtb_u_u1379) dtb_u_u1380) dtb_u_u1381) dtb_u_u1382) dtb_u_u1383) dtb_u_u1384) dtb_u_u1385) dtb_u_u1386) dtb_u_u1387) dtb_u_u1388))

# 1740 "Vuna/Compiler/Elab/Trait.vuna"
let v_bindOnePattern = (fun (dtb_u_u1389 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u1390 : Elab_dTypes.t_Ctx) (dtb_u_u1391 : Elab_dTypes.t_Ec) (dtb_u_u1392 : Core_dTerm.t_Rig) (dtb_u_u1393 : string) (dtb_u_u1394 : Frontend_dAst.t_Pat B_dData_dList.t_List) (dtb_u_u1395 : Frontend_dAst.t_Expr) (dtb_u_u1396 : Core_dTerm.t_Value) (dtb_u_u1397 : Core_dTerm.t_Closure) (dtb_u_u1398 : Base_dSource.t_Span) (dtb_u_u1399 : Base_dSource.t_Span) -> ((((((((((((v_bindOnePatternFuel 512) dtb_u_u1389) dtb_u_u1390) dtb_u_u1391) dtb_u_u1392) dtb_u_u1393) dtb_u_u1394) dtb_u_u1395) dtb_u_u1396) dtb_u_u1397) dtb_u_u1398) dtb_u_u1399))

# 448 "Vuna/Compiler/Elab/Trait.vuna"
let v_instSigClass = (fun (dtb_u_u1400 : t_InstSigInfo) -> (match dtb_u_u1400 with
  | { f_InstSigInfo_instSigClass = dtb_u_u1401; f_InstSigInfo_instSigTele = dtb_u_u1402; f_InstSigInfo_instSigCtx = dtb_u_u1403; f_InstSigInfo_instSigArgs = dtb_u_u1404; f_InstSigInfo_instSigHead = dtb_u_u1405 } -> dtb_u_u1401
  | _ -> failwith "DT: impossible branch"
))

# 449 "Vuna/Compiler/Elab/Trait.vuna"
let v_instSigTele = (fun (dtb_u_u1406 : t_InstSigInfo) -> (match dtb_u_u1406 with
  | { f_InstSigInfo_instSigClass = dtb_u_u1407; f_InstSigInfo_instSigTele = dtb_u_u1408; f_InstSigInfo_instSigCtx = dtb_u_u1409; f_InstSigInfo_instSigArgs = dtb_u_u1410; f_InstSigInfo_instSigHead = dtb_u_u1411 } -> dtb_u_u1408
  | _ -> failwith "DT: impossible branch"
))

# 450 "Vuna/Compiler/Elab/Trait.vuna"
let v_instSigCtx = (fun (dtb_u_u1412 : t_InstSigInfo) -> (match dtb_u_u1412 with
  | { f_InstSigInfo_instSigClass = dtb_u_u1413; f_InstSigInfo_instSigTele = dtb_u_u1414; f_InstSigInfo_instSigCtx = dtb_u_u1415; f_InstSigInfo_instSigArgs = dtb_u_u1416; f_InstSigInfo_instSigHead = dtb_u_u1417 } -> dtb_u_u1415
  | _ -> failwith "DT: impossible branch"
))

# 711 "Vuna/Compiler/Elab/Trait.vuna"
let v_instBodyCtx = (fun (dtb_u_u1418 : t_InstSigInfo) -> (((v_instBodyCtxGo (v_instanceTeleCtx (v_instSigTele dtb_u_u1418))) (v_instSigCtx dtb_u_u1418)) 0))

# 723 "Vuna/Compiler/Elab/Trait.vuna"
let v_instValueOf = (fun (dtb_u_u1419 : t_InstSigInfo) (dtb_u_u1420 : string) (dtb_u_u1421 : Core_dTerm.t_Term B_dData_dList.t_List) -> ((v_instTeleLam (((v_instCtxLam (Core_dTerm.C_Term_TCon (dtb_u_u1420, ((B_dData_dList.v_map (fun (dtb_u_u1422 : Core_dTerm.t_Term) -> { B_dData_dPair.f_Pair_first = dtb_u_u1422; B_dData_dPair.f_Pair_second = Core_dTerm.C_Rig_RigOmega })) dtb_u_u1421)))) (B_dData_dList.v_length (v_instSigCtx dtb_u_u1419))) 0)) (v_instSigTele dtb_u_u1419)))

# 451 "Vuna/Compiler/Elab/Trait.vuna"
let v_instSigArgs = (fun (dtb_u_u1423 : t_InstSigInfo) -> (match dtb_u_u1423 with
  | { f_InstSigInfo_instSigClass = dtb_u_u1424; f_InstSigInfo_instSigTele = dtb_u_u1425; f_InstSigInfo_instSigCtx = dtb_u_u1426; f_InstSigInfo_instSigArgs = dtb_u_u1427; f_InstSigInfo_instSigHead = dtb_u_u1428 } -> dtb_u_u1427
  | _ -> failwith "DT: impossible branch"
))

# 452 "Vuna/Compiler/Elab/Trait.vuna"
let v_instSigHead = (fun (dtb_u_u1429 : t_InstSigInfo) -> (match dtb_u_u1429 with
  | { f_InstSigInfo_instSigClass = dtb_u_u1430; f_InstSigInfo_instSigTele = dtb_u_u1431; f_InstSigInfo_instSigCtx = dtb_u_u1432; f_InstSigInfo_instSigArgs = dtb_u_u1433; f_InstSigInfo_instSigHead = dtb_u_u1434 } -> dtb_u_u1434
  | _ -> failwith "DT: impossible branch"
))

# 744 "Vuna/Compiler/Elab/Trait.vuna"
let v_instTypeOf = (fun (dtb_u_u1435 : t_InstSigInfo) -> (let dtb_u_u1436 = (B_dData_dList.v_length (v_instSigCtx dtb_u_u1435)) in (let dtb_u_u1437 = (((Core_dTerm.v_shift 0) dtb_u_u1436) (v_instSigHead dtb_u_u1435)) in (let dtb_u_u1438 = (((v_instTypeCtx dtb_u_u1437) (B_dData_dList.v_reverse (v_instSigCtx dtb_u_u1435))) (dtb_u_u1436 - 1)) in ((v_instTypeTele dtb_u_u1438) (v_instSigTele dtb_u_u1435))))))

# 356 "Vuna/Compiler/Elab/Trait.vuna"
let v_elabInstanceWithClassGo = (fun (dtb_u_u1439 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u1440 : (Frontend_dAst.t_Decl, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u1441 : Elab_dTypes.t_DtClass) (dtb_u_u1442 : t_InstSigInfo) (dtb_u_u1443 : Elab_dTypes.t_Ec) (dtb_u_u1444 : Frontend_dAst.t_Expr) (dtb_u_u1445 : Frontend_dAst.t_Decl B_dData_dList.t_List) (dtb_u_u1446 : Base_dSource.t_Span) -> (match ((v_firstUnknownInstanceMethod dtb_u_u1441) dtb_u_u1445) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u1447) -> (((Base_dDiagnostics_dTc.v_tcErr1 dtb_u_u1446) (Base_dDiagnostics_dTc.C_TcErr_InstanceUnknownMethod (dtb_u_u1447))) dtb_u_u1447)
  | B_dData_dMaybe.C_Maybe_Nothing -> (match ((v_firstMissingInstanceMethod dtb_u_u1441) dtb_u_u1445) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u1448) -> (match (((v_traitMethodSpanOf dtb_u_u1441) dtb_u_u1448) dtb_u_u1440) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u1449) -> ((Base_dDiagnostics_dTc.v_tcErr0 dtb_u_u1449) Base_dDiagnostics_dTc.C_TcErr_InstanceMissingMethod)
  | B_dData_dMaybe.C_Maybe_Nothing -> ((Base_dDiagnostics_dTc.v_tcErr0 dtb_u_u1446) Base_dDiagnostics_dTc.C_TcErr_InstanceMissingMethod)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> (let dtb_u_u1450 = (v_instBodyCtx dtb_u_u1442) in (let dtb_u_u1451 = (B_dData_dList.v_length (v_instSigCtx dtb_u_u1442)) in (let dtb_u_u1452 = (B_dData_dList.v_length (v_instSigTele dtb_u_u1442)) in (let dtb_u_u1453 = (bi_natAdd dtb_u_u1452 dtb_u_u1451) in (let dtb_u_u1454 = ((Elab_dInstName.v_instanceName (Elab_dTypes.v_dtClassName dtb_u_u1441)) dtb_u_u1444) in (let dtb_u_u1455 = ((Elab_dInstName.v_instanceSymbol (Elab_dTypes.v_dtClassName dtb_u_u1441)) dtb_u_u1444) in ((Base_dCommon.v_bind ((((((((v_checkSuperClasses dtb_u_u1439) dtb_u_u1450) dtb_u_u1451) dtb_u_u1454) dtb_u_u1446) (v_instSigArgs dtb_u_u1442)) (dtb_u_u1441).Elab_dTypes.f_DtClass_dtClassSupers) dtb_u_u1443)) (fun (dtb_u_u1456 : Elab_dTypes.t_Ec) -> ((Base_dCommon.v_bind ((((((((v_elabInstanceMethodsCtx dtb_u_u1439) dtb_u_u1441) dtb_u_u1450) dtb_u_u1451) (v_instSigArgs dtb_u_u1442)) dtb_u_u1456) dtb_u_u1445) dtb_u_u1446)) (fun (dtb_u_u1457 : (Core_dTerm.t_Term B_dData_dList.t_List, ((Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let dtb_u_u1458 = (B_dData_dPair.v_firstOf dtb_u_u1457) in (let dtb_u_u1459 = (B_dData_dPair.v_secondOf (B_dData_dPair.v_secondOf dtb_u_u1457)) in (let dtb_u_u1460 = (((((v_solveCtxGoals dtb_u_u1450) dtb_u_u1451) dtb_u_u1452) dtb_u_u1459) B_dData_dList.C_List_Nil) in (let dtb_u_u1461 = (B_dData_dPair.v_firstOf dtb_u_u1460) in (let dtb_u_u1462 = (B_dData_dPair.v_secondOf dtb_u_u1460) in (let dtb_u_u1463 = ((B_dData_dList.v_map ((v_applyCtxSubstsTo dtb_u_u1452) dtb_u_u1461)) dtb_u_u1458) in ((Base_dCommon.v_bind (((((((v_resolveRigidGoals dtb_u_u1439) dtb_u_u1450) dtb_u_u1446) (Elab_dTypes.v_ecNextConstraintId dtb_u_u1443)) (Elab_dTypes.v_ecPendingList dtb_u_u1462)) B_dData_dList.C_List_Nil) dtb_u_u1462)) (fun (dtb_u_u1464 : ((int, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (let dtb_u_u1465 = (B_dData_dPair.v_firstOf dtb_u_u1464) in (let dtb_u_u1466 = (B_dData_dPair.v_secondOf dtb_u_u1464) in (let dtb_u_u1467 = ((B_dData_dList.v_map ((v_applyTermSubstsTo dtb_u_u1453) dtb_u_u1465)) dtb_u_u1463) in (let dtb_u_u1468 = (((v_instValueOf dtb_u_u1442) (Elab_dMeta.v_dictCtorName (Elab_dTypes.v_dtClassName dtb_u_u1441))) dtb_u_u1467) in (let dtb_u_u1469 = (v_instTypeOf dtb_u_u1442) in (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb_u_u1455; B_dData_dPair.f_Pair_second = dtb_u_u1469 }, B_dData_dList.C_List_Nil)); B_dData_dPair.f_Pair_second = ((Elab_dTypes.v_ecAddDef dtb_u_u1466) { B_dData_dPair.f_Pair_first = dtb_u_u1455; B_dData_dPair.f_Pair_second = dtb_u_u1468 }) })))))))))))))))))))))))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 350 "Vuna/Compiler/Elab/Trait.vuna"
let v_elabInstanceWithClass = (fun (dtb_u_u1470 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u1471 : (Frontend_dAst.t_Decl, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u1472 : Elab_dTypes.t_DtClass) (dtb_u_u1473 : t_InstSigInfo) (dtb_u_u1474 : Elab_dTypes.t_Ec) (dtb_u_u1475 : Frontend_dAst.t_Expr) (dtb_u_u1476 : Frontend_dAst.t_Decl B_dData_dList.t_List) (dtb_u_u1477 : Base_dSource.t_Span) -> (let dtb_u_u1478 = ((v_firstDuplicateInstanceMethod dtb_u_u1472) dtb_u_u1476) in (match dtb_u_u1478 with
  | B_dData_dMaybe.C_Maybe_Nothing -> ((((((((v_elabInstanceWithClassGo dtb_u_u1470) dtb_u_u1471) dtb_u_u1472) dtb_u_u1473) dtb_u_u1474) dtb_u_u1475) dtb_u_u1476) dtb_u_u1477)
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u1479) -> (match dtb_u_u1479 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u1480; B_dData_dPair.f_Pair_second = dtb_u_u1481 } -> (((Base_dDiagnostics_dTc.v_tcErr1 dtb_u_u1481) (Base_dDiagnostics_dTc.C_TcErr_InstanceDuplicateMethod (dtb_u_u1480))) dtb_u_u1480)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))

# 407 "Vuna/Compiler/Elab/Trait.vuna"
let v_elabInstance = (fun (dtb_u_u1482 : (Frontend_dAst.t_Decl, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u1483 : (Frontend_dAst.t_Decl, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u1484 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u1485 : Elab_dTypes.t_DtClass B_dData_dList.t_List) (dtb_u_u1486 : Elab_dTypes.t_DtData B_dData_dList.t_List) (dtb_u_u1487 : Elab_dTypes.t_Ec) (dtb_u_u1488 : (Frontend_dAst.t_Decl, Base_dSource.t_Span) B_dData_dPair.t_Pair) -> (match dtb_u_u1488 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u1489; B_dData_dPair.f_Pair_second = dtb_u_u1490 } -> (match dtb_u_u1489 with
  | Frontend_dAst.C_Decl_DInstance (dtb_u_u1491, dtb_u_u1492, dtb_u_u1493, dtb_u_u1494) -> ((Base_dCommon.v_bind ((Base_dDiag.v_onErrDiag (Base_dDiag.v_withFallbackSpan (Frontend_dAst.v_nodeRefSpan dtb_u_u1494))) (((((((v_elabInstanceSig dtb_u_u1485) dtb_u_u1484) (Elab_dSig.v_definedNames ((B_dData_dList.v_map B_dData_dPair.v_firstOf) dtb_u_u1482))) dtb_u_u1487) (Frontend_dAst.v_nodeRefSpan dtb_u_u1494)) dtb_u_u1492) dtb_u_u1491))) (fun (dtb_u_u1495 : (t_InstSigInfo, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match dtb_u_u1495 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u1496; B_dData_dPair.f_Pair_second = dtb_u_u1497 } -> (match ((Elab_dDict.v_findClass (v_instSigClass dtb_u_u1496)) dtb_u_u1485) with
  | B_dData_dMaybe.C_Maybe_Nothing -> ((Base_dDiagnostics_dTc.v_tcErr0 (Frontend_dAst.v_nodeRefSpan dtb_u_u1494)) Base_dDiagnostics_dTc.C_TcErr_InstanceHeadNotApp)
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u1498) -> (if ((((v_instanceLandingOk dtb_u_u1483) (Frontend_dAst.v_nodeRefSpan dtb_u_u1494)) dtb_u_u1498) dtb_u_u1492) then ((((((((v_elabInstanceWithClass dtb_u_u1484) dtb_u_u1483) dtb_u_u1498) dtb_u_u1496) dtb_u_u1497) dtb_u_u1492) dtb_u_u1493) (Frontend_dAst.v_nodeRefSpan dtb_u_u1494)) else ((Base_dDiagnostics_dTc.v_tcErr0 (Frontend_dAst.v_nodeRefSpan dtb_u_u1494)) Base_dDiagnostics_dTc.C_TcErr_OrphanInstance))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> ((Elab_dTypes.v_errAt dtb_u_u1490) "DT: internal: expected an instance declaration")
)
  | _ -> failwith "DT: impossible branch"
))

# 1449 "Vuna/Compiler/Elab/Trait.vuna"
let rec v_checkInstanceHeadsGo = (fun (dtb_u_u1499 : (Frontend_dAst.t_Decl, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u1500 : Elab_dTypes.t_DtClass B_dData_dList.t_List) (dtb_u_u1501 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u1502 : Elab_dTypes.t_Ec) (dtb_u_u1503 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u1504 : Elab_dTypes.t_DtInst B_dData_dList.t_List) (dtb_u_u1505 : Elab_dTypes.t_DtInst B_dData_dList.t_List) -> (match dtb_u_u1499 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u1506, dtb_u_u1507) -> (match dtb_u_u1506 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u1508; B_dData_dPair.f_Pair_second = dtb_u_u1509 } -> (match dtb_u_u1508 with
  | Frontend_dAst.C_Decl_DInstance (dtb_u_u1510, dtb_u_u1511, dtb_u_u1512, dtb_u_u1513) -> ((Base_dCommon.v_bind (((((((v_elabInstanceSig dtb_u_u1500) dtb_u_u1501) (Elab_dSig.v_definedNames ((B_dData_dList.v_map B_dData_dPair.v_firstOf) (B_dData_dList.C_List__x58__x58_ (dtb_u_u1506, dtb_u_u1507))))) dtb_u_u1502) (Frontend_dAst.v_nodeRefSpan dtb_u_u1513)) dtb_u_u1511) dtb_u_u1510)) (fun (dtb_u_u1514 : (t_InstSigInfo, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match dtb_u_u1514 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u1515; B_dData_dPair.f_Pair_second = dtb_u_u1516 } -> (let dtb_u_u1517 = ((Elab_dInstName.v_instanceName (v_instSigClass dtb_u_u1515)) dtb_u_u1511) in (let dtb_u_u1518 = ((Elab_dInstName.v_instanceSymbol (v_instSigClass dtb_u_u1515)) dtb_u_u1511) in (let dtb_u_u1519 = ((((Elab_dInstCoherence.v_instanceKey dtb_u_u1516) (v_instSigClass dtb_u_u1515)) (v_instSigTele dtb_u_u1515)) (v_instSigHead dtb_u_u1515)) in (let dtb_u_u1520 = (v_instTypeOf dtb_u_u1515) in (let dtb_u_u1521 = { Elab_dTypes.f_DtInst_dtInstName = dtb_u_u1517; Elab_dTypes.f_DtInst_dtInstSym = dtb_u_u1518; Elab_dTypes.f_DtInst_dtInstKey = dtb_u_u1519; Elab_dTypes.f_DtInst_dtInstTele = (v_instSigTele dtb_u_u1515); Elab_dTypes.f_DtInst_dtInstCtx = (v_instSigCtx dtb_u_u1515); Elab_dTypes.f_DtInst_dtInstHead = (v_instSigHead dtb_u_u1515); Elab_dTypes.f_DtInst_dtInstSpan = (B_dData_dMaybe.C_Maybe_Just ((Frontend_dAst.v_nodeRefSpan dtb_u_u1513))) } in (let dtb_u_u1522 = (((((((Elab_dInstCoherence.v_findInstanceClash dtb_u_u1516) dtb_u_u1517) dtb_u_u1518) dtb_u_u1519) (v_instSigTele dtb_u_u1515)) (v_instSigHead dtb_u_u1515)) ((B_dData_dList.v_append (Elab_dTypes.v_ecInstList dtb_u_u1516)) dtb_u_u1505)) in (match dtb_u_u1522 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u1523; B_dData_dPair.f_Pair_second = dtb_u_u1524 } -> (match dtb_u_u1523 with
  | B_dData_dMaybe.C_Maybe_Nothing -> (((((((v_checkInstanceHeadsGo dtb_u_u1507) dtb_u_u1500) dtb_u_u1501) dtb_u_u1524) (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb_u_u1518; B_dData_dPair.f_Pair_second = dtb_u_u1520 }, dtb_u_u1503))) (B_dData_dList.C_List__x58__x58_ (dtb_u_u1521, dtb_u_u1504))) (B_dData_dList.C_List__x58__x58_ (dtb_u_u1521, dtb_u_u1505)))
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u1525) -> (match dtb_u_u1525 with
  | Elab_dInstCoherence.C_InstClash_ClashOverlap -> (((Base_dDiagnostics_dTc.v_tcErr1 (Frontend_dAst.v_nodeRefSpan dtb_u_u1513)) (Base_dDiagnostics_dTc.C_TcErr_OverlappingInstances (dtb_u_u1517))) dtb_u_u1517)
  | Elab_dInstCoherence.C_InstClash_ClashDuplicate -> (((Base_dDiagnostics_dTc.v_tcErr1 (Frontend_dAst.v_nodeRefSpan dtb_u_u1513)) (Base_dDiagnostics_dTc.C_TcErr_DuplicateInstance (dtb_u_u1517))) dtb_u_u1517)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))))))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> (((((((v_checkInstanceHeadsGo dtb_u_u1507) dtb_u_u1500) dtb_u_u1501) dtb_u_u1502) dtb_u_u1503) dtb_u_u1504) dtb_u_u1505)
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.v_reverse dtb_u_u1503); B_dData_dPair.f_Pair_second = ((v_foldlAddInst dtb_u_u1502) (B_dData_dList.v_reverse dtb_u_u1504)) }))
  | _ -> failwith "DT: impossible branch"
))

# 1446 "Vuna/Compiler/Elab/Trait.vuna"
let v_checkInstanceHeads = (fun (dtb_u_u1526 : (Frontend_dAst.t_Decl, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u1527 : Elab_dTypes.t_DtClass B_dData_dList.t_List) (dtb_u_u1528 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u1529 : Elab_dTypes.t_Ec) -> (((((((v_checkInstanceHeadsGo dtb_u_u1526) dtb_u_u1527) dtb_u_u1528) dtb_u_u1529) B_dData_dList.C_List_Nil) B_dData_dList.C_List_Nil) B_dData_dList.C_List_Nil))

# 1489 "Vuna/Compiler/Elab/Trait.vuna"
let rec v_elabInstanceBodiesGo = (fun (dtb_u_u1530 : bool) (dtb_u_u1531 : (Frontend_dAst.t_Decl, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u1532 : (Frontend_dAst.t_Decl, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u1533 : Elab_dTypes.t_DtClass B_dData_dList.t_List) (dtb_u_u1534 : Elab_dTypes.t_DtData B_dData_dList.t_List) (dtb_u_u1535 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u1536 : Elab_dTypes.t_Ec) (dtb_u_u1537 : Elab_dTypes.t_DtDef B_dData_dList.t_List) -> (match dtb_u_u1531 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u1538, dtb_u_u1539) -> (match (((((((v_elabInstance (B_dData_dList.C_List__x58__x58_ (dtb_u_u1538, dtb_u_u1539))) dtb_u_u1532) dtb_u_u1535) dtb_u_u1533) dtb_u_u1534) dtb_u_u1536) dtb_u_u1538) with
  | Base_dDiag.C_Check_ErrC (dtb_u_u1540) -> (if dtb_u_u1530 then ((((((((v_elabInstanceBodiesGo dtb_u_u1530) dtb_u_u1539) dtb_u_u1532) dtb_u_u1533) dtb_u_u1534) dtb_u_u1535) ((Elab_dTypes.v_ecAddError dtb_u_u1536) dtb_u_u1540)) dtb_u_u1537) else (Base_dDiag.C_Check_ErrC (dtb_u_u1540)))
  | Base_dDiag.C_Check_OkC (dtb_u_u1541) -> (match dtb_u_u1541 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u1542; B_dData_dPair.f_Pair_second = dtb_u_u1543 } -> ((Base_dCommon.v_bind ((((v_instanceDefsOf dtb_u_u1536) dtb_u_u1543) (B_dData_dMaybe.C_Maybe_Just ((B_dData_dPair.v_secondOf dtb_u_u1538)))) dtb_u_u1542)) (fun (dtb_u_u1544 : Elab_dTypes.t_DtDef B_dData_dList.t_List) -> (let dtb_u_u1545 = ((Elab_dTypes.v_ecPutGlobalsTbl dtb_u_u1543) ((((B_dContainer_dHashMap.v_insertAll B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) dtb_u_u1542) (Elab_dTypes.v_ecGlobalsTbl dtb_u_u1543))) in ((((((((v_elabInstanceBodiesGo dtb_u_u1530) dtb_u_u1539) dtb_u_u1532) dtb_u_u1533) dtb_u_u1534) ((B_dData_dList.v_append dtb_u_u1535) dtb_u_u1542)) dtb_u_u1545) ((B_dData_dList.v_append dtb_u_u1544) dtb_u_u1537)))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.v_reverse dtb_u_u1537); B_dData_dPair.f_Pair_second = dtb_u_u1536 }))
  | _ -> failwith "DT: impossible branch"
))

# 1477 "Vuna/Compiler/Elab/Trait.vuna"
let v_elabInstanceBodies = (fun (dtb_u_u1546 : bool) (dtb_u_u1547 : Frontend_dAst.t_Decl B_dData_dList.t_List) (dtb_u_u1548 : Elab_dTypes.t_DtClass B_dData_dList.t_List) (dtb_u_u1549 : Elab_dTypes.t_DtData B_dData_dList.t_List) (dtb_u_u1550 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u1551 : Elab_dTypes.t_Ec) -> ((((((((v_elabInstanceBodiesGo dtb_u_u1546) ((Elab_dMeta.v_collectInstDecls dtb_u_u1547) B_dData_dList.C_List_Nil)) ((B_dData_dList.v_map (fun (dtb_u_u1552 : Frontend_dAst.t_Decl) -> { B_dData_dPair.f_Pair_first = dtb_u_u1552; B_dData_dPair.f_Pair_second = (Frontend_dAst.v_declSpan dtb_u_u1552) })) dtb_u_u1547)) dtb_u_u1548) dtb_u_u1549) dtb_u_u1550) dtb_u_u1551) B_dData_dList.C_List_Nil))

# 1548 "Vuna/Compiler/Elab/Trait.vuna"
let rec v_elabInstancesGo = (fun (dtb_u_u1553 : (Frontend_dAst.t_Decl, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u1554 : Elab_dTypes.t_DtClass B_dData_dList.t_List) (dtb_u_u1555 : Elab_dTypes.t_DtData B_dData_dList.t_List) (dtb_u_u1556 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u1557 : Elab_dTypes.t_Ec) (dtb_u_u1558 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match dtb_u_u1553 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u1559, dtb_u_u1560) -> ((Base_dCommon.v_bind (((((((v_elabInstance (B_dData_dList.C_List__x58__x58_ (dtb_u_u1559, dtb_u_u1560))) B_dData_dList.C_List_Nil) dtb_u_u1556) dtb_u_u1554) dtb_u_u1555) dtb_u_u1557) dtb_u_u1559)) (fun (dtb_u_u1561 : ((string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match dtb_u_u1561 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u1562; B_dData_dPair.f_Pair_second = dtb_u_u1563 } -> ((((((v_elabInstancesGo dtb_u_u1560) dtb_u_u1554) dtb_u_u1555) ((B_dData_dList.v_append dtb_u_u1556) dtb_u_u1562)) dtb_u_u1563) ((B_dData_dList.v_append dtb_u_u1562) dtb_u_u1558))
  | _ -> failwith "DT: impossible branch"
)))
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.v_reverse dtb_u_u1558); B_dData_dPair.f_Pair_second = dtb_u_u1557 }))
  | _ -> failwith "DT: impossible branch"
))

# 1545 "Vuna/Compiler/Elab/Trait.vuna"
let v_elabInstances = (fun (dtb_u_u1564 : (Frontend_dAst.t_Decl, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u1565 : Elab_dTypes.t_DtClass B_dData_dList.t_List) (dtb_u_u1566 : Elab_dTypes.t_DtData B_dData_dList.t_List) (dtb_u_u1567 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u1568 : Elab_dTypes.t_Ec) -> ((((((v_elabInstancesGo dtb_u_u1564) dtb_u_u1565) dtb_u_u1566) dtb_u_u1567) dtb_u_u1568) B_dData_dList.C_List_Nil))

# 1149 "Vuna/Compiler/Elab/Trait.vuna"
let v_dictGoalGroupRep = (fun (dtb_u_u1569 : t_DictGoalGroup) -> (match dtb_u_u1569 with
  | { f_DictGoalGroup_dictGoalGroupRep = dtb_u_u1570; f_DictGoalGroup_dictGoalGroupDom = dtb_u_u1571; f_DictGoalGroup_dictGoalGroupExtras = dtb_u_u1572 } -> dtb_u_u1570
  | _ -> failwith "DT: impossible branch"
))

# 1150 "Vuna/Compiler/Elab/Trait.vuna"
let v_dictGoalGroupDom = (fun (dtb_u_u1573 : t_DictGoalGroup) -> (match dtb_u_u1573 with
  | { f_DictGoalGroup_dictGoalGroupRep = dtb_u_u1574; f_DictGoalGroup_dictGoalGroupDom = dtb_u_u1575; f_DictGoalGroup_dictGoalGroupExtras = dtb_u_u1576 } -> dtb_u_u1575
  | _ -> failwith "DT: impossible branch"
))

# 1151 "Vuna/Compiler/Elab/Trait.vuna"
let v_dictGoalGroupExtras = (fun (dtb_u_u1577 : t_DictGoalGroup) -> (match dtb_u_u1577 with
  | { f_DictGoalGroup_dictGoalGroupRep = dtb_u_u1578; f_DictGoalGroup_dictGoalGroupDom = dtb_u_u1579; f_DictGoalGroup_dictGoalGroupExtras = dtb_u_u1580 } -> dtb_u_u1580
  | _ -> failwith "DT: impossible branch"
))

# 1226 "Vuna/Compiler/Elab/Trait.vuna"
let v_dpName = (fun (dtb_u_u1581 : t_DictPlan) -> (match dtb_u_u1581 with
  | { f_DictPlan_dpName = dtb_u_u1582; f_DictPlan_dpLevel = dtb_u_u1583; f_DictPlan_dpDom = dtb_u_u1584; f_DictPlan_dpMetas = dtb_u_u1585 } -> dtb_u_u1582
  | _ -> failwith "DT: impossible branch"
))

# 1228 "Vuna/Compiler/Elab/Trait.vuna"
let v_dpLevel = (fun (dtb_u_u1586 : t_DictPlan) -> (match dtb_u_u1586 with
  | { f_DictPlan_dpName = dtb_u_u1587; f_DictPlan_dpLevel = dtb_u_u1588; f_DictPlan_dpDom = dtb_u_u1589; f_DictPlan_dpMetas = dtb_u_u1590 } -> dtb_u_u1588
  | _ -> failwith "DT: impossible branch"
))

# 1230 "Vuna/Compiler/Elab/Trait.vuna"
let v_dpDom = (fun (dtb_u_u1591 : t_DictPlan) -> (match dtb_u_u1591 with
  | { f_DictPlan_dpName = dtb_u_u1592; f_DictPlan_dpLevel = dtb_u_u1593; f_DictPlan_dpDom = dtb_u_u1594; f_DictPlan_dpMetas = dtb_u_u1595 } -> dtb_u_u1594
  | _ -> failwith "DT: impossible branch"
))

# 1232 "Vuna/Compiler/Elab/Trait.vuna"
let v_dpMetas = (fun (dtb_u_u1596 : t_DictPlan) -> (match dtb_u_u1596 with
  | { f_DictPlan_dpName = dtb_u_u1597; f_DictPlan_dpLevel = dtb_u_u1598; f_DictPlan_dpDom = dtb_u_u1599; f_DictPlan_dpMetas = dtb_u_u1600 } -> dtb_u_u1600
  | _ -> failwith "DT: impossible branch"
))
