open Vuna_runtime
# 69 "Vuna/Compiler/Elab/Data.vuna"
let rec v_kindResultLevel = (fun (mc0 : Core_dTerm.t_Term) -> (match mc0 with
  | Core_dTerm.C_Term_TType (dtb__0) -> (B_dData_dMaybe.C_Maybe_Just (dtb__0))
  | Core_dTerm.C_Term_TPi (dtb__1, dtb__2, dtb__3, dtb__4, dtb__5) -> (v_kindResultLevel dtb__5)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
))

# 94 "Vuna/Compiler/Elab/Data.vuna"
let rec v_countSurfacePis = (fun (mc0 : Frontend_dAst.t_Expr) -> (match mc0 with
  | Frontend_dAst.C_Expr_EApp (dtb__6, dtb__7, dtb__8) -> (match dtb__6 with
  | Frontend_dAst.C_Expr_EVar (dtb__9, dtb__10) -> (if (dtb__9 = "->") then (match dtb__7 with
  | B_dData_dList.C_List__x58__x58_ (dtb__11, dtb__12) -> (match dtb__12 with
  | B_dData_dList.C_List__x58__x58_ (dtb__13, dtb__14) -> (match dtb__14 with
  | B_dData_dList.C_List_Nil -> (1 + (v_countSurfacePis dtb__13))
  | _ -> 0
)
  | _ -> 0
)
  | _ -> 0
) else 0)
  | _ -> 0
)
  | Frontend_dAst.C_Expr_EPi (dtb__15, dtb__16, dtb__17, dtb__18, dtb__19, dtb__20) -> (1 + (v_countSurfacePis dtb__19))
  | _ -> 0
))

# 100 "Vuna/Compiler/Elab/Data.vuna"
let rec v_countTelePis = (fun (mc0 : Core_dTerm.t_Term) -> (match mc0 with
  | Core_dTerm.C_Term_TPi (dtb__21, dtb__22, dtb__23, dtb__24, dtb__25) -> (1 + (v_countTelePis dtb__25))
  | _ -> 0
))

# 104 "Vuna/Compiler/Elab/Data.vuna"
let rec v_ctorFieldSortsGo = (fun (mc0 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc1 : Elab_dTypes.t_Ctx) (mc2 : Elab_dTypes.t_Ec) (mc3 : int) (mc4 : int) (mc5 : Core_dTerm.t_Level) (mc6 : string) (mc7 : Base_dSource.t_Span) (mc8 : Frontend_dAst.t_Expr) -> (match mc8 with
  | Frontend_dAst.C_Expr_EApp (dtb__26, dtb__27, dtb__28) -> (match dtb__26 with
  | Frontend_dAst.C_Expr_EVar (dtb__29, dtb__30) -> (if (dtb__29 = "->") then (match dtb__27 with
  | B_dData_dList.C_List__x58__x58_ (dtb__31, dtb__32) -> (match dtb__32 with
  | B_dData_dList.C_List__x58__x58_ (dtb__33, dtb__34) -> (match dtb__34 with
  | B_dData_dList.C_List_Nil -> (((((((((((v_ctorFieldSortsBinder mc0) mc1) mc2) mc3) mc4) mc5) mc6) mc7) "_") dtb__31) dtb__33)
  | _ -> (Base_dDiag.C_Check_OkC (mc2))
)
  | _ -> (Base_dDiag.C_Check_OkC (mc2))
)
  | _ -> (Base_dDiag.C_Check_OkC (mc2))
) else (Base_dDiag.C_Check_OkC (mc2)))
  | _ -> (Base_dDiag.C_Check_OkC (mc2))
)
  | Frontend_dAst.C_Expr_EPi (dtb__35, dtb__36, dtb__37, dtb__38, dtb__39, dtb__40) -> (((((((((((v_ctorFieldSortsBinder mc0) mc1) mc2) mc3) mc4) mc5) mc6) mc7) dtb__35) dtb__38) dtb__39)
  | _ -> (Base_dDiag.C_Check_OkC (mc2))
))
# 111 "Vuna/Compiler/Elab/Data.vuna"
and v_ctorFieldSortsBinder = (fun (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (pos : int) (arity : int) (famLevel : Core_dTerm.t_Level) (cname : string) (csp : Base_dSource.t_Span) (name : string) (dom : Frontend_dAst.t_Expr) (cod : Frontend_dAst.t_Expr) -> ((Base_dCommon.v_bind ((((Elab_dTerm.v_checkType globals) ctx) ec) dom)) (fun (p : (Core_dTerm.t_Term, (Core_dTerm.t_Level, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let nd_uscrut12 = p in (match nd_uscrut12 with
  | { B_dData_dPair.f_Pair_first = dtb__41; B_dData_dPair.f_Pair_second = dtb__42 } -> (match dtb__42 with
  | { B_dData_dPair.f_Pair_first = dtb__43; B_dData_dPair.f_Pair_second = dtb__44 } -> (let ctx2 = (((Elab_dTypes.v_ctxBind name) dtb__41) ctx) in (if (pos < arity) then (((((((((v_ctorFieldSortsGo globals) ctx2) dtb__44) (pos + 1)) arity) famLevel) cname) csp) cod) else (if (if ((Core_dTerm.v_levelLt dtb__43) famLevel) then true else ((Core_dTerm.v_levelEq dtb__43) famLevel)) then (((((((((v_ctorFieldSortsGo globals) ctx2) dtb__44) (pos + 1)) arity) famLevel) cname) csp) cod) else (let field = (pos - arity) in (let msg = (String.concat "" ["field #"; (string_of_int field); ": its type sorts into Type "; (string_of_int (Core_dTerm.v_levelToInt dtb__43)); ", above the family level Type "; (string_of_int (Core_dTerm.v_levelToInt famLevel))]) in ((((Base_dDiagnostics_dTc.v_tcErr2 csp) (Base_dDiagnostics_dTc.C_TcErr_CtorError ((Frontend_dAst.v_ctorDisplayName cname), msg))) (Frontend_dAst.v_ctorDisplayName cname)) msg))))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))))

# 80 "Vuna/Compiler/Elab/Data.vuna"
let v_checkCtorFieldSorts = (fun (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (arity : int) (famLevel : Core_dTerm.t_Level) (cname : string) (csp : Base_dSource.t_Span) (tyPis : int) (tyExpr : Frontend_dAst.t_Expr) -> (let surfacePis = (v_countSurfacePis tyExpr) in (if (surfacePis <> tyPis) then ((((Base_dDiagnostics_dTc.v_tcErr2 csp) (Base_dDiagnostics_dTc.C_TcErr_CtorError ((Frontend_dAst.v_ctorDisplayName cname), "cannot verify the universe level of its field types; write the constructor type as a Pi chain"))) cname) "cannot verify the universe level of its field types; write the constructor type as a Pi chain") else (((((((((v_ctorFieldSortsGo globals) ctx) ec) 0) arity) famLevel) cname) csp) tyExpr))))

# 25 "Vuna/Compiler/Elab/Data.vuna"
let v_elabCtor = (fun (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (fam : string) (arity : int) (famLevel : Core_dTerm.t_Level) (ec : Elab_dTypes.t_Ec) (c : Frontend_dAst.t_Ctor) -> (match c with
  | { Frontend_dAst.f_Ctor_ctorName = dtb__45; Frontend_dAst.f_Ctor_ctorType = dtb__46; Frontend_dAst.f_Ctor_ctorArity = dtb__47; Frontend_dAst.f_Ctor_ctorRef = dtb__48 } -> (let famKind = (match ((Elab_dMeta.v_globalLookup fam) globals) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__55) -> dtb__55
  | B_dData_dMaybe.C_Maybe_Nothing -> (Core_dTerm.C_Term_TType (Core_dTerm.v_levelZero))
  | _ -> failwith "DT: impossible branch"
) in (let tyExpr2 = (if (Elab_dMeta.v_hasFamParams dtb__46) then dtb__46 else (((Elab_dMeta.v_prependFamParams famKind) dtb__46) (Frontend_dAst.v_nodeRefSpan dtb__48))) in (let gl = ((B_dData_dList.v_append globals) (B_dContainer_dHashMap.v_toList (Elab_dTypes.v_ecGlobalsTbl ec))) in ((Base_dCommon.v_bind ((((Elab_dTerm.v_checkType gl) Elab_dTypes.v_emptyCtx) ec) tyExpr2)) (fun (pk : (Core_dTerm.t_Term, (Core_dTerm.t_Level, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let nd_uscrut14 = pk in (match nd_uscrut14 with
  | { B_dData_dPair.f_Pair_first = dtb__49; B_dData_dPair.f_Pair_second = dtb__50 } -> (match dtb__50 with
  | { B_dData_dPair.f_Pair_first = dtb__51; B_dData_dPair.f_Pair_second = dtb__52 } -> (let tyTerm = (((Elab_dMeta.v_zonkTerm dtb__52) 0) dtb__49) in (match (Elab_dMeta.v_resultSpine (Elab_dMeta.v_dropParams tyTerm)) with
  | { B_dData_dPair.f_Pair_first = dtb__53; B_dData_dPair.f_Pair_second = dtb__54 } -> (if (dtb__53 <> fam) then ((((Base_dDiagnostics_dTc.v_tcErr2 (Frontend_dAst.v_nodeRefSpan dtb__48)) (Base_dDiagnostics_dTc.C_TcErr_CtorDoesNotReturn ((Frontend_dAst.v_ctorDisplayName dtb__45), fam))) (Frontend_dAst.v_ctorDisplayName dtb__45)) fam) else (if ((B_dData_dList.v_length dtb__54) <> arity) then ((((Base_dDiagnostics_dTc.v_tcErr2 (Frontend_dAst.v_nodeRefSpan dtb__48)) (Base_dDiagnostics_dTc.C_TcErr_CtorWrongIndices ((Frontend_dAst.v_ctorDisplayName dtb__45), fam))) (Frontend_dAst.v_ctorDisplayName dtb__45)) fam) else ((Base_dCommon.v_bind (((((((((v_checkCtorFieldSorts gl) Elab_dTypes.v_emptyCtx) dtb__52) arity) famLevel) dtb__45) (Frontend_dAst.v_nodeRefSpan dtb__48)) (v_countTelePis tyTerm)) tyExpr2)) (fun (_u : Elab_dTypes.t_Ec) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = { Elab_dTypes.f_DtCtor_dtCtorName = dtb__45; Elab_dTypes.f_DtCtor_dtCtorFamily = fam; Elab_dTypes.f_DtCtor_dtCtorTelescope = (Elab_dMeta.v_teleOfType tyTerm); Elab_dTypes.f_DtCtor_dtCtorType = tyTerm; Elab_dTypes.f_DtCtor_dtCtorSpan = (B_dData_dMaybe.C_Maybe_Just ((Frontend_dAst.v_nodeRefSpan dtb__48))) }; B_dData_dPair.f_Pair_second = dtb__52 }))))))
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))))))
  | _ -> failwith "DT: impossible branch"
))

# 51 "Vuna/Compiler/Elab/Data.vuna"
let rec v_elabCtors = (fun (mc0 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc1 : string) (mc2 : int) (mc3 : Core_dTerm.t_Level) (mc4 : Elab_dTypes.t_Ec) (mc5 : Frontend_dAst.t_Ctor B_dData_dList.t_List) -> (match mc5 with
  | B_dData_dList.C_List__x58__x58_ (dtb__56, dtb__57) -> ((Base_dCommon.v_bind ((((((v_elabCtor mc0) mc1) mc2) mc3) mc4) dtb__56)) (fun (p : (Elab_dTypes.t_DtCtor, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match p with
  | { B_dData_dPair.f_Pair_first = dtb__58; B_dData_dPair.f_Pair_second = dtb__59 } -> ((Base_dCommon.v_bind ((((((v_elabCtors mc0) mc1) mc2) mc3) dtb__59) dtb__57)) (fun (q : (Elab_dTypes.t_DtCtor B_dData_dList.t_List, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match q with
  | { B_dData_dPair.f_Pair_first = dtb__60; B_dData_dPair.f_Pair_second = dtb__61 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ (dtb__58, dtb__60)); B_dData_dPair.f_Pair_second = dtb__61 }))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = mc4 }))
  | _ -> failwith "DT: impossible branch"
))

# 134 "Vuna/Compiler/Elab/Data.vuna"
let v_elabDataHead = (fun (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ec : Elab_dTypes.t_Ec) (ds : (Frontend_dAst.t_Decl, Base_dSource.t_Span) B_dData_dPair.t_Pair) -> (match ds with
  | { B_dData_dPair.f_Pair_first = dtb__62; B_dData_dPair.f_Pair_second = dtb__63 } -> (match dtb__62 with
  | Frontend_dAst.C_Decl_DData (dtb__64, dtb__65, dtb__66, dtb__67, dtb__68, dtb__69, dtb__70, dtb__71, dtb__72) -> (if ((B_dData_dList.v_memName dtb__64) Elab_dPrelude.v_preludeNames) then (((Base_dDiagnostics_dTc.v_tcErr1 (Frontend_dAst.v_nodeRefSpan dtb__72)) (Base_dDiagnostics_dTc.C_TcErr_CannotRedefineBuiltin (dtb__64))) dtb__64) else ((Base_dCommon.v_bind ((((Elab_dTerm.v_checkType globals) Elab_dTypes.v_emptyCtx) ec) dtb__66)) (fun (pk : (Core_dTerm.t_Term, (Core_dTerm.t_Level, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let nd_uscrut17 = pk in (match nd_uscrut17 with
  | { B_dData_dPair.f_Pair_first = dtb__73; B_dData_dPair.f_Pair_second = dtb__74 } -> (match dtb__74 with
  | { B_dData_dPair.f_Pair_first = dtb__75; B_dData_dPair.f_Pair_second = dtb__76 } -> (let fullKind = ((Elab_dPrelude.v_prependParams dtb__65) (((Elab_dMeta.v_zonkTerm dtb__76) 0) dtb__73)) in (let tele = (Elab_dMeta.v_splitKind fullKind) in (let arity = (B_dData_dList.v_length tele) in (if (B_dData_dBool.v_not (Elab_dMeta.v_kindWellFormed fullKind)) then ((Base_dDiagnostics_dTc.v_tcErr0 (Frontend_dAst.v_nodeRefSpan dtb__72)) Base_dDiagnostics_dTc.C_TcErr_DataKindArrows) else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = { Elab_dMeta.f_DataHead_dataHeadName = dtb__64; Elab_dMeta.f_DataHead_dataHeadKind = fullKind; Elab_dMeta.f_DataHead_dataHeadArity = arity }; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__64; B_dData_dPair.f_Pair_second = fullKind }, B_dData_dList.C_List_Nil)); B_dData_dPair.f_Pair_second = dtb__76 } }))))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))))
  | Frontend_dAst.C_Decl_DRecord (dtb__77, dtb__78, dtb__79, dtb__80, dtb__81, dtb__82, dtb__83, dtb__84) -> (if ((B_dData_dList.v_memName dtb__77) Elab_dPrelude.v_preludeNames) then (((Base_dDiagnostics_dTc.v_tcErr1 (Frontend_dAst.v_nodeRefSpan dtb__84)) (Base_dDiagnostics_dTc.C_TcErr_CannotRedefineBuiltin (dtb__77))) dtb__77) else (let fullKind = ((Elab_dPrelude.v_prependParams dtb__78) (Core_dTerm.C_Term_TType (Core_dTerm.v_levelZero))) in (let arity = (B_dData_dList.v_length dtb__78) in (if (B_dData_dBool.v_not (Elab_dMeta.v_kindWellFormed fullKind)) then ((Base_dDiagnostics_dTc.v_tcErr0 (Frontend_dAst.v_nodeRefSpan dtb__84)) Base_dDiagnostics_dTc.C_TcErr_DataKindArrows) else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = { Elab_dMeta.f_DataHead_dataHeadName = dtb__77; Elab_dMeta.f_DataHead_dataHeadKind = fullKind; Elab_dMeta.f_DataHead_dataHeadArity = arity }; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__77; B_dData_dPair.f_Pair_second = fullKind }, B_dData_dList.C_List_Nil)); B_dData_dPair.f_Pair_second = ec } }))))))
  | _ -> ((Elab_dTypes.v_errAt dtb__63) "DT: internal: expected a data declaration")
)
  | _ -> failwith "DT: impossible branch"
))

# 168 "Vuna/Compiler/Elab/Data.vuna"
let rec v_elabDataHeadsRound = (fun (mc0 : (Frontend_dAst.t_Decl, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc1 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc2 : Elab_dTypes.t_Ec) (mc3 : Elab_dMeta.t_DataHead B_dData_dList.t_List) (mc4 : (Frontend_dAst.t_Decl, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__85, dtb__86) -> (let nd_uscrut8 = (((v_elabDataHead mc1) mc2) dtb__85) in (match nd_uscrut8 with
  | Base_dDiag.C_Check_OkC (dtb__87) -> (match dtb__87 with
  | { B_dData_dPair.f_Pair_first = dtb__88; B_dData_dPair.f_Pair_second = dtb__89 } -> (match dtb__89 with
  | { B_dData_dPair.f_Pair_first = dtb__90; B_dData_dPair.f_Pair_second = dtb__91 } -> (((((v_elabDataHeadsRound dtb__86) ((B_dData_dList.v_append mc1) dtb__90)) dtb__91) (B_dData_dList.C_List__x58__x58_ (dtb__88, mc3))) mc4)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dDiag.C_Check_ErrC (dtb__92) -> (((((v_elabDataHeadsRound dtb__86) mc1) mc2) mc3) (B_dData_dList.C_List__x58__x58_ (dtb__85, mc4)))
  | _ -> failwith "DT: impossible branch"
))
  | B_dData_dList.C_List_Nil -> { B_dData_dPair.f_Pair_first = mc3; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = mc1; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = mc2; B_dData_dPair.f_Pair_second = (B_dData_dList.v_reverse mc4) } } }
  | _ -> failwith "DT: impossible branch"
))

# 194 "Vuna/Compiler/Elab/Data.vuna"
let v_elabDataHeadsNoProgress = (fun (mc0 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc1 : Elab_dTypes.t_Ec) (mc2 : (Frontend_dAst.t_Decl, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__93, dtb__94) -> (match (((v_elabDataHead mc0) mc1) dtb__93) with
  | Base_dDiag.C_Check_ErrC (dtb__95) -> (Base_dDiag.C_Check_ErrC (dtb__95))
  | Base_dDiag.C_Check_OkC (dtb__96) -> (Base_dDiag.v_icInternal "data head registration made no progress")
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (Base_dDiag.v_icInternal "no failed data declarations")
  | _ -> failwith "DT: impossible branch"
))

# 179 "Vuna/Compiler/Elab/Data.vuna"
let rec v_elabDataHeadsFuel = (fun (fuel : int) (pending : (Frontend_dAst.t_Decl, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ec : Elab_dTypes.t_Ec) (heads : Elab_dMeta.t_DataHead B_dData_dList.t_List) -> (if (fuel <= 0) then (Base_dDiag.v_icInternal "data head registration fuel exhausted") else (match pending with
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.v_reverse heads); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = globals; B_dData_dPair.f_Pair_second = ec } }))
  | _ -> (let nd_uscrut5 = (((((v_elabDataHeadsRound pending) globals) ec) heads) B_dData_dList.C_List_Nil) in (match nd_uscrut5 with
  | { B_dData_dPair.f_Pair_first = dtb__97; B_dData_dPair.f_Pair_second = dtb__98 } -> (match dtb__98 with
  | { B_dData_dPair.f_Pair_first = dtb__99; B_dData_dPair.f_Pair_second = dtb__100 } -> (match dtb__100 with
  | { B_dData_dPair.f_Pair_first = dtb__101; B_dData_dPair.f_Pair_second = dtb__102 } -> (match dtb__102 with
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.v_reverse dtb__97); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = dtb__99; B_dData_dPair.f_Pair_second = dtb__101 } }))
  | _ -> (if ((B_dData_dList.v_length dtb__102) = (B_dData_dList.v_length pending)) then (((v_elabDataHeadsNoProgress globals) ec) dtb__102) else (((((v_elabDataHeadsFuel (fuel - 1)) dtb__102) dtb__99) dtb__101) dtb__97))
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))
)))

# 176 "Vuna/Compiler/Elab/Data.vuna"
let v_elabDataHeads = (fun (pending : (Frontend_dAst.t_Decl, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ec : Elab_dTypes.t_Ec) (heads : Elab_dMeta.t_DataHead B_dData_dList.t_List) -> (((((v_elabDataHeadsFuel 64) pending) globals) ec) heads))

# 214 "Vuna/Compiler/Elab/Data.vuna"
let rec v_skipParamPis = (fun (mc0 : int) (mc1 : Core_dTerm.t_Term) -> (match mc1 with
  | Core_dTerm.C_Term_TPi (dtb__103, dtb__104, dtb__105, dtb__106, dtb__107) -> (if (mc0 <= 0) then mc1 else ((v_skipParamPis (mc0 - 1)) dtb__107))
  | _ -> mc1
))

# 220 "Vuna/Compiler/Elab/Data.vuna"
let v_recordFieldIndependent = (fun (i : int) (dom : Core_dTerm.t_Term) -> (B_dData_dBool.v_not (Core_dTerm.v_hasNegativeVar (((Core_dTerm.v_shift 0) (0 - i)) dom))))

# 223 "Vuna/Compiler/Elab/Data.vuna"
let rec v_dtFieldsOfRecordGo = (fun (mc0 : Elab_dRecords.t_RecordFieldMeta B_dData_dList.t_List) (mc1 : int) (mc2 : Core_dTerm.t_Term) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__108, dtb__109) -> (match mc2 with
  | Core_dTerm.C_Term_TPi (dtb__110, dtb__111, dtb__112, dtb__113, dtb__114) -> (if (B_dData_dBool.v_not ((v_recordFieldIndependent mc1) dtb__113)) then (Base_dDiag.v_icInternal (String.concat "" ["record field `"; (dtb__108).Elab_dRecords.f_RecordFieldMeta_recordFieldName; "` references a previous field"])) else ((Base_dCommon.v_bind (((v_dtFieldsOfRecordGo dtb__109) (mc1 + 1)) dtb__114)) (fun (more : Elab_dTypes.t_DtFieldMeta B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((B_dData_dList.C_List__x58__x58_ ({ Elab_dTypes.f_DtFieldMeta_dtFieldName = (dtb__108).Elab_dRecords.f_RecordFieldMeta_recordFieldName; Elab_dTypes.f_DtFieldMeta_dtFieldIndex = mc1; Elab_dTypes.f_DtFieldMeta_dtFieldType = (((Core_dTerm.v_shift 0) (0 - mc1)) dtb__113) }, more)))))))
  | _ -> (Base_dDiag.v_icInternal "record field table is longer than the constructor telescope")
)
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (B_dData_dList.C_List_Nil))
  | _ -> failwith "DT: impossible branch"
))

# 205 "Vuna/Compiler/Elab/Data.vuna"
let v_dtFieldsOfRecord = (fun (records : Elab_dRecords.t_RecordMeta B_dData_dList.t_List) (dname : string) (arity : int) (ctors : Elab_dTypes.t_DtCtor B_dData_dList.t_List) -> (match ((Elab_dRecords.v_lookupRecord dname) records) with
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.C_Check_OkC (B_dData_dList.C_List_Nil))
  | B_dData_dMaybe.C_Maybe_Just (dtb__115) -> (let nd_uscrut6 = ctors in (match nd_uscrut6 with
  | B_dData_dList.C_List__x58__x58_ (dtb__116, dtb__117) -> (match dtb__117 with
  | B_dData_dList.C_List_Nil -> (((v_dtFieldsOfRecordGo (dtb__115).Elab_dRecords.f_RecordMeta_recordMetaFields) 0) ((v_skipParamPis arity) (Elab_dTypes.v_dtCtorType dtb__116)))
  | _ -> (Base_dDiag.C_Check_OkC (B_dData_dList.C_List_Nil))
)
  | _ -> (Base_dDiag.C_Check_OkC (B_dData_dList.C_List_Nil))
))
  | _ -> failwith "DT: impossible branch"
))

# 314 "Vuna/Compiler/Elab/Data.vuna"
let v_sameCtorSet = (fun (expected : string B_dData_dList.t_List) (actual : string B_dData_dList.t_List) -> (if ((B_dData_dList.v_length expected) = (B_dData_dList.v_length actual)) then ((B_dData_dList.v_allMem expected) actual) else false))

# 237 "Vuna/Compiler/Elab/Data.vuna"
let rec v_elabDataBodies = (fun (decls : (Frontend_dAst.t_Decl, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List) (heads : Elab_dMeta.t_DataHead B_dData_dList.t_List) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ec : Elab_dTypes.t_Ec) (acc : Elab_dTypes.t_DtData B_dData_dList.t_List) (records : Elab_dRecords.t_RecordMeta B_dData_dList.t_List) -> (match decls with
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.v_reverse acc); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = globals; B_dData_dPair.f_Pair_second = ec } }))
  | B_dData_dList.C_List__x58__x58_ (dtb__118, dtb__119) -> (match dtb__118 with
  | { B_dData_dPair.f_Pair_first = dtb__120; B_dData_dPair.f_Pair_second = dtb__121 } -> (match dtb__120 with
  | Frontend_dAst.C_Decl_DData (dtb__122, dtb__123, dtb__124, dtb__125, dtb__126, dtb__127, dtb__128, dtb__129, dtb__130) -> (let nd_uscrut22 = ((Elab_dMeta.v_lookupDataHead dtb__122) heads) in (match nd_uscrut22 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__131) -> (match dtb__131 with
  | { B_dData_dPair.f_Pair_first = dtb__132; B_dData_dPair.f_Pair_second = dtb__133 } -> (let tele = (Elab_dMeta.v_splitKind dtb__132) in (let famLevel = (match (v_kindResultLevel dtb__132) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__137) -> dtb__137
  | B_dData_dMaybe.C_Maybe_Nothing -> Core_dTerm.v_levelZero
  | _ -> failwith "DT: impossible branch"
) in (if dtb__127 then ((Base_dDiagnostics_dTc.v_tcErr0 (Frontend_dAst.v_nodeRefSpan dtb__130)) Base_dDiagnostics_dTc.C_TcErr_DerivingViaOnlyRecord) else ((Base_dCommon.v_bind ((((((v_elabCtors globals) dtb__122) dtb__133) famLevel) ec) dtb__125)) (fun (q : (Elab_dTypes.t_DtCtor B_dData_dList.t_List, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match q with
  | { B_dData_dPair.f_Pair_first = dtb__134; B_dData_dPair.f_Pair_second = dtb__135 } -> ((Base_dCommon.v_bind ((((v_dtFieldsOfRecord records) dtb__122) (B_dData_dList.v_length tele)) dtb__134)) (fun (fields : Elab_dTypes.t_DtFieldMeta B_dData_dList.t_List) -> (let viaClasses = (if dtb__127 then dtb__126 else B_dData_dList.C_List_Nil) in (let dd = { Elab_dTypes.f_DtData_dtDataName = dtb__122; Elab_dTypes.f_DtData_dtDataParams = tele; Elab_dTypes.f_DtData_dtDataCtors = dtb__134; Elab_dTypes.f_DtData_dtDataKind = dtb__132; Elab_dTypes.f_DtData_dtDataViaClasses = viaClasses; Elab_dTypes.f_DtData_dtDataLinear = dtb__129; Elab_dTypes.f_DtData_dtDataRepr = dtb__128; Elab_dTypes.f_DtData_dtDataFields = fields; Elab_dTypes.f_DtData_dtDataIsRecord = false } in (match (Base_dIntrinsics.v_canonicalCtorsFor dtb__122) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__136) -> (if ((v_sameCtorSet dtb__136) ((B_dData_dList.v_map Elab_dTypes.v_dtCtorName) dtb__134)) then ((((((v_elabDataBodies dtb__119) heads) ((B_dData_dList.v_append globals) (Elab_dMeta.v_ctorGlobals dtb__134))) ((Elab_dTypes.v_ecAddData dtb__135) dd)) (B_dData_dList.C_List__x58__x58_ (dd, acc))) records) else (((Base_dDiagnostics_dTc.v_tcErr1 (Frontend_dAst.v_nodeRefSpan dtb__130)) (Base_dDiagnostics_dTc.C_TcErr_CannotRedefineBuiltin (dtb__122))) dtb__122))
  | B_dData_dMaybe.C_Maybe_Nothing -> ((((((v_elabDataBodies dtb__119) heads) ((B_dData_dList.v_append globals) (Elab_dMeta.v_ctorGlobals dtb__134))) ((Elab_dTypes.v_ecAddData dtb__135) dd)) (B_dData_dList.C_List__x58__x58_ (dd, acc))) records)
  | _ -> failwith "DT: impossible branch"
)))))
  | _ -> failwith "DT: impossible branch"
))))))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> ((Elab_dTypes.v_errAt (Frontend_dAst.v_nodeRefSpan dtb__130)) ("DT: internal: missing data head for " ^ dtb__122))
  | _ -> failwith "DT: impossible branch"
))
  | Frontend_dAst.C_Decl_DRecord (dtb__138, dtb__139, dtb__140, dtb__141, dtb__142, dtb__143, dtb__144, dtb__145) -> (let nd_uscrut21 = ((Elab_dMeta.v_lookupDataHead dtb__138) heads) in (match nd_uscrut21 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__146) -> (match dtb__146 with
  | { B_dData_dPair.f_Pair_first = dtb__147; B_dData_dPair.f_Pair_second = dtb__148 } -> (let tele = (Elab_dMeta.v_splitKind dtb__147) in (let famLevel = (match (v_kindResultLevel dtb__147) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__152) -> dtb__152
  | B_dData_dMaybe.C_Maybe_Nothing -> Core_dTerm.v_levelZero
  | _ -> failwith "DT: impossible branch"
) in (let ctorExpr = ((((Elab_dRecords.v_recordCtorType dtb__139) dtb__140) (((Elab_dRecords.v_recordRetType dtb__138) dtb__139) (Frontend_dAst.v_nodeRefSpan dtb__145))) (Frontend_dAst.v_nodeRefSpan dtb__145)) in (let ctorAst = { Frontend_dAst.f_Ctor_ctorName = dtb__138; Frontend_dAst.f_Ctor_ctorType = ctorExpr; Frontend_dAst.f_Ctor_ctorArity = (B_dData_dList.v_length dtb__140); Frontend_dAst.f_Ctor_ctorRef = dtb__145 } in ((Base_dCommon.v_bind ((((((v_elabCtors globals) dtb__138) dtb__148) famLevel) ec) (B_dData_dList.C_List__x58__x58_ (ctorAst, B_dData_dList.C_List_Nil)))) (fun (q : (Elab_dTypes.t_DtCtor B_dData_dList.t_List, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match q with
  | { B_dData_dPair.f_Pair_first = dtb__149; B_dData_dPair.f_Pair_second = dtb__150 } -> ((Base_dCommon.v_bind ((((v_dtFieldsOfRecord records) dtb__138) (B_dData_dList.v_length tele)) dtb__149)) (fun (fieldsMeta : Elab_dTypes.t_DtFieldMeta B_dData_dList.t_List) -> (let viaClasses = (if dtb__142 then dtb__141 else B_dData_dList.C_List_Nil) in (let dd = { Elab_dTypes.f_DtData_dtDataName = dtb__138; Elab_dTypes.f_DtData_dtDataParams = tele; Elab_dTypes.f_DtData_dtDataCtors = dtb__149; Elab_dTypes.f_DtData_dtDataKind = dtb__147; Elab_dTypes.f_DtData_dtDataViaClasses = viaClasses; Elab_dTypes.f_DtData_dtDataLinear = dtb__144; Elab_dTypes.f_DtData_dtDataRepr = dtb__143; Elab_dTypes.f_DtData_dtDataFields = fieldsMeta; Elab_dTypes.f_DtData_dtDataIsRecord = true } in (match (Base_dIntrinsics.v_canonicalCtorsFor dtb__138) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__151) -> (if ((v_sameCtorSet dtb__151) ((B_dData_dList.v_map Elab_dTypes.v_dtCtorName) dtb__149)) then ((((((v_elabDataBodies dtb__119) heads) ((B_dData_dList.v_append globals) (Elab_dMeta.v_ctorGlobals dtb__149))) ((Elab_dTypes.v_ecAddData dtb__150) dd)) (B_dData_dList.C_List__x58__x58_ (dd, acc))) records) else (((Base_dDiagnostics_dTc.v_tcErr1 (Frontend_dAst.v_nodeRefSpan dtb__145)) (Base_dDiagnostics_dTc.C_TcErr_CannotRedefineBuiltin (dtb__138))) dtb__138))
  | B_dData_dMaybe.C_Maybe_Nothing -> ((((((v_elabDataBodies dtb__119) heads) ((B_dData_dList.v_append globals) (Elab_dMeta.v_ctorGlobals dtb__149))) ((Elab_dTypes.v_ecAddData dtb__150) dd)) (B_dData_dList.C_List__x58__x58_ (dd, acc))) records)
  | _ -> failwith "DT: impossible branch"
)))))
  | _ -> failwith "DT: impossible branch"
)))))))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> ((Elab_dTypes.v_errAt (Frontend_dAst.v_nodeRefSpan dtb__145)) ("DT: internal: missing data head for " ^ dtb__138))
  | _ -> failwith "DT: impossible branch"
))
  | _ -> ((((((v_elabDataBodies dtb__119) heads) globals) ec) acc) records)
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 358 "Vuna/Compiler/Elab/Data.vuna"
let v_reprIsAlias = (fun (mc0 : Frontend_dAst.t_ReprTier) -> (match mc0 with
  | Frontend_dAst.C_ReprTier_ReprAlias -> true
  | _ -> false
))

# 368 "Vuna/Compiler/Elab/Data.vuna"
let v_viaShapeOkWith = (fun (dname : string) (datas : Elab_dTypes.t_DtData B_dData_dList.t_List) (fams : string B_dData_dList.t_List) (info : (string, (Elab_dTypes.t_DtCtor, int) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (if ((B_dData_dList.v_memName dname) fams) then (let nd_uscrut4 = ((Elab_dRepresentation.v_lookupUnboxedInfo dname) info) in (match nd_uscrut4 with
  | B_dData_dMaybe.C_Maybe_Nothing -> false
  | B_dData_dMaybe.C_Maybe_Just (dtb__153) -> (match dtb__153 with
  | { B_dData_dPair.f_Pair_first = dtb__154; B_dData_dPair.f_Pair_second = dtb__155 } -> (match ((Elab_dRepresentation.v_findDtData dname) datas) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__156) -> (dtb__155 = (B_dData_dList.v_length (dtb__156).Elab_dTypes.f_DtData_dtDataParams))
  | B_dData_dMaybe.C_Maybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) else false))

# 352 "Vuna/Compiler/Elab/Data.vuna"
let v_viaFieldOk = (fun (mc0 : Frontend_dAst.t_ReprTier) (mc1 : string) (mc2 : Elab_dTypes.t_DtData B_dData_dList.t_List) (mc3 : string B_dData_dList.t_List) (mc4 : (string, (Elab_dTypes.t_DtCtor, int) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc0 with
  | Frontend_dAst.C_ReprTier_ReprBoxed -> false
  | Frontend_dAst.C_ReprTier_ReprAuto -> ((((v_viaShapeOkWith mc1) mc2) mc3) mc4)
  | Frontend_dAst.C_ReprTier_ReprAlias -> ((((v_viaShapeOkWith mc1) mc2) mc3) mc4)
  | _ -> failwith "DT: impossible branch"
))

# 325 "Vuna/Compiler/Elab/Data.vuna"
let rec v_checkViaDataDeclsGo = (fun (mc0 : (Frontend_dAst.t_Decl, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc1 : Elab_dTypes.t_DtData B_dData_dList.t_List) (mc2 : string B_dData_dList.t_List) (mc3 : (string, (Elab_dTypes.t_DtCtor, int) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__157, dtb__158) -> (match dtb__157 with
  | { B_dData_dPair.f_Pair_first = dtb__159; B_dData_dPair.f_Pair_second = dtb__160 } -> (match dtb__159 with
  | Frontend_dAst.C_Decl_DData (dtb__161, dtb__162, dtb__163, dtb__164, dtb__165, dtb__166, dtb__167, dtb__168, dtb__169) -> (if dtb__166 then ((Base_dDiagnostics_dTc.v_tcErr0 (Frontend_dAst.v_nodeRefSpan dtb__169)) Base_dDiagnostics_dTc.C_TcErr_DerivingViaOnlyRecord) else (if (if (v_reprIsAlias dtb__167) then (B_dData_dBool.v_not ((B_dData_dList.v_memName dtb__161) mc2)) else false) then ((Base_dDiagnostics_dTc.v_tcErr0 (Frontend_dAst.v_nodeRefSpan dtb__169)) Base_dDiagnostics_dTc.C_TcErr_ReprAliasInvalid) else ((((v_checkViaDataDeclsGo dtb__158) mc1) mc2) mc3)))
  | Frontend_dAst.C_Decl_DRecord (dtb__170, dtb__171, dtb__172, dtb__173, dtb__174, dtb__175, dtb__176, dtb__177) -> (if (if (v_reprIsAlias dtb__175) then (B_dData_dBool.v_not ((B_dData_dList.v_memName dtb__170) mc2)) else false) then ((Base_dDiagnostics_dTc.v_tcErr0 (Frontend_dAst.v_nodeRefSpan dtb__177)) Base_dDiagnostics_dTc.C_TcErr_ReprAliasInvalid) else (if dtb__174 then (if (((((v_viaFieldOk dtb__175) dtb__170) mc1) mc2) mc3) then ((((v_checkViaDataDeclsGo dtb__158) mc1) mc2) mc3) else ((Base_dDiagnostics_dTc.v_tcErr0 (Frontend_dAst.v_nodeRefSpan dtb__177)) Base_dDiagnostics_dTc.C_TcErr_DerivingViaUnboxedRequired)) else ((((v_checkViaDataDeclsGo dtb__158) mc1) mc2) mc3)))
  | _ -> ((((v_checkViaDataDeclsGo dtb__158) mc1) mc2) mc3)
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (0))
  | _ -> failwith "DT: impossible branch"
))

# 321 "Vuna/Compiler/Elab/Data.vuna"
let v_checkViaDataDecls = (fun (decls : (Frontend_dAst.t_Decl, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List) (datas : Elab_dTypes.t_DtData B_dData_dList.t_List) -> ((((v_checkViaDataDeclsGo decls) datas) (Elab_dRepresentation.v_unboxedFamilySet datas)) (Elab_dRepresentation.v_unboxedInfoOf datas)))

# 365 "Vuna/Compiler/Elab/Data.vuna"
let v_viaShapeOk = (fun (dname : string) (datas : Elab_dTypes.t_DtData B_dData_dList.t_List) -> ((((v_viaShapeOkWith dname) datas) (Elab_dRepresentation.v_unboxedFamilySet datas)) (Elab_dRepresentation.v_unboxedInfoOf datas)))

# 382 "Vuna/Compiler/Elab/Data.vuna"
let v_elabDatas = (fun (decls : (Frontend_dAst.t_Decl, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List) (records : Elab_dRecords.t_RecordMeta B_dData_dList.t_List) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ec : Elab_dTypes.t_Ec) -> ((Base_dCommon.v_bind ((((v_elabDataHeads decls) globals) ec) B_dData_dList.C_List_Nil)) (fun (p : (Elab_dMeta.t_DataHead B_dData_dList.t_List, ((string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let nd_uscrut5 = p in (match nd_uscrut5 with
  | { B_dData_dPair.f_Pair_first = dtb__178; B_dData_dPair.f_Pair_second = dtb__179 } -> (match dtb__179 with
  | { B_dData_dPair.f_Pair_first = dtb__180; B_dData_dPair.f_Pair_second = dtb__181 } -> ((Base_dCommon.v_bind ((((((v_elabDataBodies decls) dtb__178) dtb__180) dtb__181) B_dData_dList.C_List_Nil) records)) (fun (q : (Elab_dTypes.t_DtData B_dData_dList.t_List, ((string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (match q with
  | { B_dData_dPair.f_Pair_first = dtb__182; B_dData_dPair.f_Pair_second = dtb__183 } -> ((Base_dCommon.v_bind ((v_checkViaDataDecls decls) dtb__182)) (fun (_u : int) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb__182; B_dData_dPair.f_Pair_second = dtb__183 }))))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))))
