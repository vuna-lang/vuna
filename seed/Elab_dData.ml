open Vuna_runtime
# 69 "Vuna/Compiler/Elab/Data.vuna"
let rec v_kindResultLevel = (fun (mc0 : Core_dTerm.t_Term) -> (match mc0 with
  | Core_dTerm.C_Term_TType (dtb__0) -> (B_dData_dMaybe.C_Maybe_Just (dtb__0))
  | Core_dTerm.C_Term_TPi (dtb__1, dtb__2, dtb__3, dtb__4, dtb__5) -> (v_kindResultLevel dtb__5)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
))

# 94 "Vuna/Compiler/Elab/Data.vuna"
let rec v_countSurfacePis = (fun (mc0 : Frontend_dRast.t_Expr) -> (match mc0 with
  | Frontend_dRast.C_Expr_EApp (dtb__6, dtb__7, dtb__8) -> (match dtb__6 with
  | Frontend_dRast.C_Expr_EVar (dtb__9, dtb__10) -> (match dtb__9 with
  | Frontend_dRast_dName.C_RName_RIntrinsic (dtb__11) -> (if (dtb__11 = "->") then (match dtb__7 with
  | B_dData_dList.C_List__x58__x58_ (dtb__12, dtb__13) -> (match dtb__13 with
  | B_dData_dList.C_List__x58__x58_ (dtb__14, dtb__15) -> (match dtb__15 with
  | B_dData_dList.C_List_Nil -> (1 + (v_countSurfacePis dtb__14))
  | _ -> 0
)
  | _ -> 0
)
  | _ -> 0
) else 0)
  | _ -> 0
)
  | _ -> 0
)
  | Frontend_dRast.C_Expr_EPi (dtb__16, dtb__17, dtb__18, dtb__19, dtb__20, dtb__21) -> (1 + (v_countSurfacePis dtb__20))
  | _ -> 0
))

# 100 "Vuna/Compiler/Elab/Data.vuna"
let rec v_countTelePis = (fun (mc0 : Core_dTerm.t_Term) -> (match mc0 with
  | Core_dTerm.C_Term_TPi (dtb__22, dtb__23, dtb__24, dtb__25, dtb__26) -> (1 + (v_countTelePis dtb__26))
  | _ -> 0
))

# 104 "Vuna/Compiler/Elab/Data.vuna"
let rec v_ctorFieldSortsGo = (fun (mc0 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc1 : Elab_dTypes.t_Ctx) (mc2 : Elab_dTypes.t_Ec) (mc3 : int) (mc4 : int) (mc5 : Core_dTerm.t_Level) (mc6 : string) (mc7 : Base_dSource.t_Span) (mc8 : Frontend_dRast.t_Expr) -> (match mc8 with
  | Frontend_dRast.C_Expr_EApp (dtb__27, dtb__28, dtb__29) -> (match dtb__27 with
  | Frontend_dRast.C_Expr_EVar (dtb__30, dtb__31) -> (match dtb__30 with
  | Frontend_dRast_dName.C_RName_RIntrinsic (dtb__32) -> (if (dtb__32 = "->") then (match dtb__28 with
  | B_dData_dList.C_List__x58__x58_ (dtb__33, dtb__34) -> (match dtb__34 with
  | B_dData_dList.C_List__x58__x58_ (dtb__35, dtb__36) -> (match dtb__36 with
  | B_dData_dList.C_List_Nil -> (((((((((((v_ctorFieldSortsBinder mc0) mc1) mc2) mc3) mc4) mc5) mc6) mc7) "_") dtb__33) dtb__35)
  | _ -> (Base_dDiag.C_Check_OkC (mc2))
)
  | _ -> (Base_dDiag.C_Check_OkC (mc2))
)
  | _ -> (Base_dDiag.C_Check_OkC (mc2))
) else (Base_dDiag.C_Check_OkC (mc2)))
  | _ -> (Base_dDiag.C_Check_OkC (mc2))
)
  | _ -> (Base_dDiag.C_Check_OkC (mc2))
)
  | Frontend_dRast.C_Expr_EPi (dtb__37, dtb__38, dtb__39, dtb__40, dtb__41, dtb__42) -> (((((((((((v_ctorFieldSortsBinder mc0) mc1) mc2) mc3) mc4) mc5) mc6) mc7) dtb__37) dtb__40) dtb__41)
  | _ -> (Base_dDiag.C_Check_OkC (mc2))
))
# 111 "Vuna/Compiler/Elab/Data.vuna"
and v_ctorFieldSortsBinder = (fun (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (pos : int) (arity : int) (famLevel : Core_dTerm.t_Level) (cname : string) (csp : Base_dSource.t_Span) (name : string) (dom : Frontend_dRast.t_Expr) (cod : Frontend_dRast.t_Expr) -> ((Base_dCommon.v_bind ((((Elab_dTerm.v_checkType globals) ctx) ec) dom)) (fun (p : (Core_dTerm.t_Term, (Core_dTerm.t_Level, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let nd_uscrut12 = p in (match nd_uscrut12 with
  | { B_dData_dPair.f_Pair_first = dtb__43; B_dData_dPair.f_Pair_second = dtb__44 } -> (match dtb__44 with
  | { B_dData_dPair.f_Pair_first = dtb__45; B_dData_dPair.f_Pair_second = dtb__46 } -> (let ctx2 = (((Elab_dTypes.v_ctxBind name) dtb__43) ctx) in (if (pos < arity) then (((((((((v_ctorFieldSortsGo globals) ctx2) dtb__46) (pos + 1)) arity) famLevel) cname) csp) cod) else (if (if ((Core_dTerm.v_levelLt dtb__45) famLevel) then true else ((Core_dTerm.v_levelEq dtb__45) famLevel)) then (((((((((v_ctorFieldSortsGo globals) ctx2) dtb__46) (pos + 1)) arity) famLevel) cname) csp) cod) else (let field = (pos - arity) in (let msg = (String.concat "" ["field #"; (bi_strFromInt field); ": its type sorts into Type "; (bi_strFromInt (Core_dTerm.v_levelToInt dtb__45)); ", above the family level Type "; (bi_strFromInt (Core_dTerm.v_levelToInt famLevel))]) in ((((Base_dDiagnostics_dTc.v_tcErr2 csp) (Base_dDiagnostics_dTc.C_TcErr_CtorError ((Frontend_dRast.v_ctorDisplayName cname), msg))) (Frontend_dRast.v_ctorDisplayName cname)) msg))))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))))

# 80 "Vuna/Compiler/Elab/Data.vuna"
let v_checkCtorFieldSorts = (fun (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (arity : int) (famLevel : Core_dTerm.t_Level) (cname : string) (csp : Base_dSource.t_Span) (tyPis : int) (tyExpr : Frontend_dRast.t_Expr) -> (let surfacePis = (v_countSurfacePis tyExpr) in (if (surfacePis <> tyPis) then ((((Base_dDiagnostics_dTc.v_tcErr2 csp) (Base_dDiagnostics_dTc.C_TcErr_CtorError ((Frontend_dRast.v_ctorDisplayName cname), "cannot verify the universe level of its field types; write the constructor type as a Pi chain"))) cname) "cannot verify the universe level of its field types; write the constructor type as a Pi chain") else (((((((((v_ctorFieldSortsGo globals) ctx) ec) 0) arity) famLevel) cname) csp) tyExpr))))

# 26 "Vuna/Compiler/Elab/Data.vuna"
let v_elabCtor = (fun (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (fam : string) (arity : int) (famLevel : Core_dTerm.t_Level) (ec : Elab_dTypes.t_Ec) (c : Frontend_dRast.t_Ctor) -> (match c with
  | { Frontend_dRast.f_Ctor_ctorName = dtb__47; Frontend_dRast.f_Ctor_ctorType = dtb__48; Frontend_dRast.f_Ctor_ctorArity = dtb__49; Frontend_dRast.f_Ctor_ctorSpan = dtb__50 } -> (let famKind = (match ((Elab_dMeta.v_globalLookup fam) globals) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__57) -> dtb__57
  | B_dData_dMaybe.C_Maybe_Nothing -> (Core_dTerm.C_Term_TType (Core_dTerm.v_levelZero))
  | _ -> failwith "DT: impossible branch"
) in (let tyExpr2 = (if (Elab_dMeta.v_hasFamParams dtb__48) then dtb__48 else (((Elab_dMeta.v_prependFamParams famKind) dtb__48) dtb__50)) in (let gl = ((B_dData_dList.v_append globals) (B_dContainer_dHashMap.v_toList (Elab_dTypes.v_ecGlobalsTbl ec))) in ((Base_dCommon.v_bind ((((Elab_dTerm.v_checkType gl) Elab_dTypes.v_emptyCtx) ec) tyExpr2)) (fun (pk : (Core_dTerm.t_Term, (Core_dTerm.t_Level, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let nd_uscrut14 = pk in (match nd_uscrut14 with
  | { B_dData_dPair.f_Pair_first = dtb__51; B_dData_dPair.f_Pair_second = dtb__52 } -> (match dtb__52 with
  | { B_dData_dPair.f_Pair_first = dtb__53; B_dData_dPair.f_Pair_second = dtb__54 } -> (let tyTerm = (((Elab_dMeta.v_zonkTerm dtb__54) 0) dtb__51) in (match (Elab_dMeta.v_resultSpine (Elab_dMeta.v_dropParams tyTerm)) with
  | { B_dData_dPair.f_Pair_first = dtb__55; B_dData_dPair.f_Pair_second = dtb__56 } -> (if (dtb__55 <> fam) then ((((Base_dDiagnostics_dTc.v_tcErr2 dtb__50) (Base_dDiagnostics_dTc.C_TcErr_CtorDoesNotReturn ((Frontend_dRast.v_ctorDisplayName dtb__47), fam))) (Frontend_dRast.v_ctorDisplayName dtb__47)) fam) else (if ((B_dData_dList.v_length dtb__56) <> arity) then ((((Base_dDiagnostics_dTc.v_tcErr2 dtb__50) (Base_dDiagnostics_dTc.C_TcErr_CtorWrongIndices ((Frontend_dRast.v_ctorDisplayName dtb__47), fam))) (Frontend_dRast.v_ctorDisplayName dtb__47)) fam) else ((Base_dCommon.v_bind (((((((((v_checkCtorFieldSorts gl) Elab_dTypes.v_emptyCtx) dtb__54) arity) famLevel) dtb__47) dtb__50) (v_countTelePis tyTerm)) tyExpr2)) (fun (_u : Elab_dTypes.t_Ec) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = { Elab_dTypes.f_DtCtor_dtCtorName = dtb__47; Elab_dTypes.f_DtCtor_dtCtorFamily = fam; Elab_dTypes.f_DtCtor_dtCtorTelescope = (Elab_dMeta.v_teleOfType tyTerm); Elab_dTypes.f_DtCtor_dtCtorType = tyTerm; Elab_dTypes.f_DtCtor_dtCtorSpan = (B_dData_dMaybe.C_Maybe_Just (dtb__50)) }; B_dData_dPair.f_Pair_second = dtb__54 }))))))
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))))))
  | _ -> failwith "DT: impossible branch"
))

# 51 "Vuna/Compiler/Elab/Data.vuna"
let rec v_elabCtors = (fun (mc0 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc1 : string) (mc2 : int) (mc3 : Core_dTerm.t_Level) (mc4 : Elab_dTypes.t_Ec) (mc5 : Frontend_dRast.t_Ctor B_dData_dList.t_List) -> (match mc5 with
  | B_dData_dList.C_List__x58__x58_ (dtb__58, dtb__59) -> ((Base_dCommon.v_bind ((((((v_elabCtor mc0) mc1) mc2) mc3) mc4) dtb__58)) (fun (p : (Elab_dTypes.t_DtCtor, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match p with
  | { B_dData_dPair.f_Pair_first = dtb__60; B_dData_dPair.f_Pair_second = dtb__61 } -> ((Base_dCommon.v_bind ((((((v_elabCtors mc0) mc1) mc2) mc3) dtb__61) dtb__59)) (fun (q : (Elab_dTypes.t_DtCtor B_dData_dList.t_List, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match q with
  | { B_dData_dPair.f_Pair_first = dtb__62; B_dData_dPair.f_Pair_second = dtb__63 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ (dtb__60, dtb__62)); B_dData_dPair.f_Pair_second = dtb__63 }))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = mc4 }))
  | _ -> failwith "DT: impossible branch"
))

# 134 "Vuna/Compiler/Elab/Data.vuna"
let v_elabDataHead = (fun (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ec : Elab_dTypes.t_Ec) (ds : (Frontend_dRast.t_Decl, Base_dSource.t_Span) B_dData_dPair.t_Pair) -> (match ds with
  | { B_dData_dPair.f_Pair_first = dtb__64; B_dData_dPair.f_Pair_second = dtb__65 } -> (match dtb__64 with
  | Frontend_dRast.C_Decl_DData (dtb__66, dtb__67, dtb__68, dtb__69, dtb__70, dtb__71, dtb__72, dtb__73, dtb__74) -> (if ((B_dData_dList.v_memName dtb__66) Elab_dPrelude.v_preludeNames) then (((Base_dDiagnostics_dTc.v_tcErr1 dtb__74) (Base_dDiagnostics_dTc.C_TcErr_CannotRedefineBuiltin (dtb__66))) dtb__66) else ((Base_dCommon.v_bind ((((Elab_dTerm.v_checkType globals) Elab_dTypes.v_emptyCtx) ec) dtb__68)) (fun (pk : (Core_dTerm.t_Term, (Core_dTerm.t_Level, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let nd_uscrut17 = pk in (match nd_uscrut17 with
  | { B_dData_dPair.f_Pair_first = dtb__75; B_dData_dPair.f_Pair_second = dtb__76 } -> (match dtb__76 with
  | { B_dData_dPair.f_Pair_first = dtb__77; B_dData_dPair.f_Pair_second = dtb__78 } -> (let fullKind = ((Elab_dPrelude.v_prependParams dtb__67) (((Elab_dMeta.v_zonkTerm dtb__78) 0) dtb__75)) in (let tele = (Elab_dMeta.v_splitKind fullKind) in (let arity = (B_dData_dList.v_length tele) in (if (B_dData_dBool.v_not (Elab_dMeta.v_kindWellFormed fullKind)) then ((Base_dDiagnostics_dTc.v_tcErr0 dtb__74) Base_dDiagnostics_dTc.C_TcErr_DataKindArrows) else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = { Elab_dMeta.f_DataHead_dataHeadName = dtb__66; Elab_dMeta.f_DataHead_dataHeadKind = fullKind; Elab_dMeta.f_DataHead_dataHeadArity = arity }; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__66; B_dData_dPair.f_Pair_second = fullKind }, B_dData_dList.C_List_Nil)); B_dData_dPair.f_Pair_second = dtb__78 } }))))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))))
  | Frontend_dRast.C_Decl_DRecord (dtb__79, dtb__80, dtb__81, dtb__82, dtb__83, dtb__84, dtb__85, dtb__86) -> (if ((B_dData_dList.v_memName dtb__79) Elab_dPrelude.v_preludeNames) then (((Base_dDiagnostics_dTc.v_tcErr1 dtb__86) (Base_dDiagnostics_dTc.C_TcErr_CannotRedefineBuiltin (dtb__79))) dtb__79) else (let fullKind = ((Elab_dPrelude.v_prependParams dtb__80) (Core_dTerm.C_Term_TType (Core_dTerm.v_levelZero))) in (let arity = (B_dData_dList.v_length dtb__80) in (if (B_dData_dBool.v_not (Elab_dMeta.v_kindWellFormed fullKind)) then ((Base_dDiagnostics_dTc.v_tcErr0 dtb__86) Base_dDiagnostics_dTc.C_TcErr_DataKindArrows) else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = { Elab_dMeta.f_DataHead_dataHeadName = dtb__79; Elab_dMeta.f_DataHead_dataHeadKind = fullKind; Elab_dMeta.f_DataHead_dataHeadArity = arity }; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__79; B_dData_dPair.f_Pair_second = fullKind }, B_dData_dList.C_List_Nil)); B_dData_dPair.f_Pair_second = ec } }))))))
  | _ -> ((Elab_dTypes.v_errAt dtb__65) "DT: internal: expected a data declaration")
)
  | _ -> failwith "DT: impossible branch"
))

# 168 "Vuna/Compiler/Elab/Data.vuna"
let rec v_elabDataHeadsRound = (fun (mc0 : (Frontend_dRast.t_Decl, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc1 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc2 : Elab_dTypes.t_Ec) (mc3 : Elab_dMeta.t_DataHead B_dData_dList.t_List) (mc4 : (Frontend_dRast.t_Decl, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__87, dtb__88) -> (let nd_uscrut8 = (((v_elabDataHead mc1) mc2) dtb__87) in (match nd_uscrut8 with
  | Base_dDiag.C_Check_OkC (dtb__89) -> (match dtb__89 with
  | { B_dData_dPair.f_Pair_first = dtb__90; B_dData_dPair.f_Pair_second = dtb__91 } -> (match dtb__91 with
  | { B_dData_dPair.f_Pair_first = dtb__92; B_dData_dPair.f_Pair_second = dtb__93 } -> (((((v_elabDataHeadsRound dtb__88) ((B_dData_dList.v_append mc1) dtb__92)) dtb__93) (B_dData_dList.C_List__x58__x58_ (dtb__90, mc3))) mc4)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dDiag.C_Check_ErrC (dtb__94) -> (((((v_elabDataHeadsRound dtb__88) mc1) mc2) mc3) (B_dData_dList.C_List__x58__x58_ (dtb__87, mc4)))
  | _ -> failwith "DT: impossible branch"
))
  | B_dData_dList.C_List_Nil -> { B_dData_dPair.f_Pair_first = mc3; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = mc1; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = mc2; B_dData_dPair.f_Pair_second = (B_dData_dList.v_reverse mc4) } } }
  | _ -> failwith "DT: impossible branch"
))

# 194 "Vuna/Compiler/Elab/Data.vuna"
let v_elabDataHeadsNoProgress = (fun (mc0 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc1 : Elab_dTypes.t_Ec) (mc2 : (Frontend_dRast.t_Decl, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__95, dtb__96) -> (match (((v_elabDataHead mc0) mc1) dtb__95) with
  | Base_dDiag.C_Check_ErrC (dtb__97) -> (Base_dDiag.C_Check_ErrC (dtb__97))
  | Base_dDiag.C_Check_OkC (dtb__98) -> (Base_dDiag.v_icInternal "data head registration made no progress")
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (Base_dDiag.v_icInternal "no failed data declarations")
  | _ -> failwith "DT: impossible branch"
))

# 179 "Vuna/Compiler/Elab/Data.vuna"
let rec v_elabDataHeadsFuel = (fun (fuel : int) (pending : (Frontend_dRast.t_Decl, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ec : Elab_dTypes.t_Ec) (heads : Elab_dMeta.t_DataHead B_dData_dList.t_List) -> (if (fuel <= 0) then (Base_dDiag.v_icInternal "data head registration fuel exhausted") else (match pending with
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.v_reverse heads); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = globals; B_dData_dPair.f_Pair_second = ec } }))
  | _ -> (let nd_uscrut5 = (((((v_elabDataHeadsRound pending) globals) ec) heads) B_dData_dList.C_List_Nil) in (match nd_uscrut5 with
  | { B_dData_dPair.f_Pair_first = dtb__99; B_dData_dPair.f_Pair_second = dtb__100 } -> (match dtb__100 with
  | { B_dData_dPair.f_Pair_first = dtb__101; B_dData_dPair.f_Pair_second = dtb__102 } -> (match dtb__102 with
  | { B_dData_dPair.f_Pair_first = dtb__103; B_dData_dPair.f_Pair_second = dtb__104 } -> (match dtb__104 with
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.v_reverse dtb__99); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = dtb__101; B_dData_dPair.f_Pair_second = dtb__103 } }))
  | _ -> (if ((B_dData_dList.v_length dtb__104) = (B_dData_dList.v_length pending)) then (((v_elabDataHeadsNoProgress globals) ec) dtb__104) else (((((v_elabDataHeadsFuel (fuel - 1)) dtb__104) dtb__101) dtb__103) dtb__99))
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))
)))

# 176 "Vuna/Compiler/Elab/Data.vuna"
let v_elabDataHeads = (fun (pending : (Frontend_dRast.t_Decl, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ec : Elab_dTypes.t_Ec) (heads : Elab_dMeta.t_DataHead B_dData_dList.t_List) -> (((((v_elabDataHeadsFuel 64) pending) globals) ec) heads))

# 213 "Vuna/Compiler/Elab/Data.vuna"
let rec v_skipParamPis = (fun (mc0 : int) (mc1 : Core_dTerm.t_Term) -> (match mc1 with
  | Core_dTerm.C_Term_TPi (dtb__105, dtb__106, dtb__107, dtb__108, dtb__109) -> (if (mc0 <= 0) then mc1 else ((v_skipParamPis (mc0 - 1)) dtb__109))
  | _ -> mc1
))

# 217 "Vuna/Compiler/Elab/Data.vuna"
let rec v_dtFieldsOfRecordGo = (fun (mc0 : Elab_dRecords.t_RecordFieldMeta B_dData_dList.t_List) (mc1 : int) (mc2 : Core_dTerm.t_Term) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__110, dtb__111) -> (match mc2 with
  | Core_dTerm.C_Term_TPi (dtb__112, dtb__113, dtb__114, dtb__115, dtb__116) -> (B_dData_dList.C_List__x58__x58_ ({ Elab_dTypes.f_DtFieldMeta_dtFieldName = (dtb__110).Elab_dRecords.f_RecordFieldMeta_recordFieldName; Elab_dTypes.f_DtFieldMeta_dtFieldIndex = mc1; Elab_dTypes.f_DtFieldMeta_dtFieldType = (((Core_dTerm.v_shift 0) (0 - mc1)) dtb__115) }, (((v_dtFieldsOfRecordGo dtb__111) (mc1 + 1)) dtb__116)))
  | _ -> B_dData_dList.C_List_Nil
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 204 "Vuna/Compiler/Elab/Data.vuna"
let v_dtFieldsOfRecord = (fun (records : Elab_dRecords.t_RecordMeta B_dData_dList.t_List) (dname : string) (arity : int) (ctors : Elab_dTypes.t_DtCtor B_dData_dList.t_List) -> (match ((Elab_dRecords.v_lookupRecord dname) records) with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dList.C_List_Nil
  | B_dData_dMaybe.C_Maybe_Just (dtb__117) -> (let nd_uscrut6 = ctors in (match nd_uscrut6 with
  | B_dData_dList.C_List__x58__x58_ (dtb__118, dtb__119) -> (match dtb__119 with
  | B_dData_dList.C_List_Nil -> (((v_dtFieldsOfRecordGo (dtb__117).Elab_dRecords.f_RecordMeta_recordMetaFields) 0) ((v_skipParamPis arity) (Elab_dTypes.v_dtCtorType dtb__118)))
  | _ -> B_dData_dList.C_List_Nil
)
  | _ -> B_dData_dList.C_List_Nil
))
  | _ -> failwith "DT: impossible branch"
))

# 293 "Vuna/Compiler/Elab/Data.vuna"
let v_sameCtorSet = (fun (expected : string B_dData_dList.t_List) (actual : string B_dData_dList.t_List) -> (let norm = (B_dData_dList.v_map Base_dIntrinsics.v_ctorSpellingKey) in (if ((B_dData_dList.v_length expected) = (B_dData_dList.v_length actual)) then ((B_dData_dList.v_allMem (norm expected)) (norm actual)) else false)))

# 225 "Vuna/Compiler/Elab/Data.vuna"
let rec v_elabDataBodies = (fun (decls : (Frontend_dRast.t_Decl, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List) (heads : Elab_dMeta.t_DataHead B_dData_dList.t_List) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ec : Elab_dTypes.t_Ec) (acc : Elab_dTypes.t_DtData B_dData_dList.t_List) (records : Elab_dRecords.t_RecordMeta B_dData_dList.t_List) -> (match decls with
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.v_reverse acc); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = globals; B_dData_dPair.f_Pair_second = ec } }))
  | B_dData_dList.C_List__x58__x58_ (dtb__120, dtb__121) -> (match dtb__120 with
  | { B_dData_dPair.f_Pair_first = dtb__122; B_dData_dPair.f_Pair_second = dtb__123 } -> (match dtb__122 with
  | Frontend_dRast.C_Decl_DData (dtb__124, dtb__125, dtb__126, dtb__127, dtb__128, dtb__129, dtb__130, dtb__131, dtb__132) -> (let nd_uscrut22 = ((Elab_dMeta.v_lookupDataHead dtb__124) heads) in (match nd_uscrut22 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__133) -> (match dtb__133 with
  | { B_dData_dPair.f_Pair_first = dtb__134; B_dData_dPair.f_Pair_second = dtb__135 } -> (let tele = (Elab_dMeta.v_splitKind dtb__134) in (let famLevel = (match (v_kindResultLevel dtb__134) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__139) -> dtb__139
  | B_dData_dMaybe.C_Maybe_Nothing -> Core_dTerm.v_levelZero
  | _ -> failwith "DT: impossible branch"
) in (if dtb__129 then ((Base_dDiagnostics_dTc.v_tcErr0 dtb__132) Base_dDiagnostics_dTc.C_TcErr_DerivingViaOnlyRecord) else ((Base_dCommon.v_bind ((((((v_elabCtors globals) dtb__124) dtb__135) famLevel) ec) dtb__127)) (fun (q : (Elab_dTypes.t_DtCtor B_dData_dList.t_List, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match q with
  | { B_dData_dPair.f_Pair_first = dtb__136; B_dData_dPair.f_Pair_second = dtb__137 } -> (let viaClasses = (if dtb__129 then dtb__128 else B_dData_dList.C_List_Nil) in (let fields = ((((v_dtFieldsOfRecord records) dtb__124) (B_dData_dList.v_length tele)) dtb__136) in (let dd = { Elab_dTypes.f_DtData_dtDataName = dtb__124; Elab_dTypes.f_DtData_dtDataParams = tele; Elab_dTypes.f_DtData_dtDataCtors = dtb__136; Elab_dTypes.f_DtData_dtDataKind = dtb__134; Elab_dTypes.f_DtData_dtDataViaClasses = viaClasses; Elab_dTypes.f_DtData_dtDataLinear = dtb__131; Elab_dTypes.f_DtData_dtDataRepr = dtb__130; Elab_dTypes.f_DtData_dtDataFields = fields; Elab_dTypes.f_DtData_dtDataIsRecord = false } in (match (Base_dIntrinsics.v_canonicalCtorsFor dtb__124) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__138) -> (if ((v_sameCtorSet dtb__138) ((B_dData_dList.v_map Elab_dTypes.v_dtCtorName) dtb__136)) then ((((((v_elabDataBodies dtb__121) heads) ((B_dData_dList.v_append globals) (Elab_dMeta.v_ctorGlobals dtb__136))) ((Elab_dTypes.v_ecAddData dtb__137) dd)) (B_dData_dList.C_List__x58__x58_ (dd, acc))) records) else (((Base_dDiagnostics_dTc.v_tcErr1 dtb__132) (Base_dDiagnostics_dTc.C_TcErr_CannotRedefineBuiltin (dtb__124))) dtb__124))
  | B_dData_dMaybe.C_Maybe_Nothing -> ((((((v_elabDataBodies dtb__121) heads) ((B_dData_dList.v_append globals) (Elab_dMeta.v_ctorGlobals dtb__136))) ((Elab_dTypes.v_ecAddData dtb__137) dd)) (B_dData_dList.C_List__x58__x58_ (dd, acc))) records)
  | _ -> failwith "DT: impossible branch"
))))
  | _ -> failwith "DT: impossible branch"
))))))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> ((Elab_dTypes.v_errAt dtb__132) ("DT: internal: missing data head for " ^ dtb__124))
  | _ -> failwith "DT: impossible branch"
))
  | Frontend_dRast.C_Decl_DRecord (dtb__140, dtb__141, dtb__142, dtb__143, dtb__144, dtb__145, dtb__146, dtb__147) -> (let nd_uscrut21 = ((Elab_dMeta.v_lookupDataHead dtb__140) heads) in (match nd_uscrut21 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__148) -> (match dtb__148 with
  | { B_dData_dPair.f_Pair_first = dtb__149; B_dData_dPair.f_Pair_second = dtb__150 } -> (let tele = (Elab_dMeta.v_splitKind dtb__149) in (let famLevel = (match (v_kindResultLevel dtb__149) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__154) -> dtb__154
  | B_dData_dMaybe.C_Maybe_Nothing -> Core_dTerm.v_levelZero
  | _ -> failwith "DT: impossible branch"
) in (let ctorExpr = ((((Elab_dRecords.v_recordCtorType dtb__141) dtb__142) (((Elab_dRecords.v_recordRetType dtb__140) dtb__141) dtb__147)) dtb__147) in (let ctorAst = { Frontend_dRast.f_Ctor_ctorName = dtb__140; Frontend_dRast.f_Ctor_ctorType = ctorExpr; Frontend_dRast.f_Ctor_ctorArity = (B_dData_dList.v_length dtb__142); Frontend_dRast.f_Ctor_ctorSpan = dtb__147 } in ((Base_dCommon.v_bind ((((((v_elabCtors globals) dtb__140) dtb__150) famLevel) ec) (B_dData_dList.C_List__x58__x58_ (ctorAst, B_dData_dList.C_List_Nil)))) (fun (q : (Elab_dTypes.t_DtCtor B_dData_dList.t_List, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match q with
  | { B_dData_dPair.f_Pair_first = dtb__151; B_dData_dPair.f_Pair_second = dtb__152 } -> (let viaClasses = (if dtb__144 then dtb__143 else B_dData_dList.C_List_Nil) in (let fieldsMeta = ((((v_dtFieldsOfRecord records) dtb__140) (B_dData_dList.v_length tele)) dtb__151) in (let dd = { Elab_dTypes.f_DtData_dtDataName = dtb__140; Elab_dTypes.f_DtData_dtDataParams = tele; Elab_dTypes.f_DtData_dtDataCtors = dtb__151; Elab_dTypes.f_DtData_dtDataKind = dtb__149; Elab_dTypes.f_DtData_dtDataViaClasses = viaClasses; Elab_dTypes.f_DtData_dtDataLinear = dtb__146; Elab_dTypes.f_DtData_dtDataRepr = dtb__145; Elab_dTypes.f_DtData_dtDataFields = fieldsMeta; Elab_dTypes.f_DtData_dtDataIsRecord = true } in (match (Base_dIntrinsics.v_canonicalCtorsFor dtb__140) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__153) -> (if ((v_sameCtorSet dtb__153) ((B_dData_dList.v_map Elab_dTypes.v_dtCtorName) dtb__151)) then ((((((v_elabDataBodies dtb__121) heads) ((B_dData_dList.v_append globals) (Elab_dMeta.v_ctorGlobals dtb__151))) ((Elab_dTypes.v_ecAddData dtb__152) dd)) (B_dData_dList.C_List__x58__x58_ (dd, acc))) records) else (((Base_dDiagnostics_dTc.v_tcErr1 dtb__147) (Base_dDiagnostics_dTc.C_TcErr_CannotRedefineBuiltin (dtb__140))) dtb__140))
  | B_dData_dMaybe.C_Maybe_Nothing -> ((((((v_elabDataBodies dtb__121) heads) ((B_dData_dList.v_append globals) (Elab_dMeta.v_ctorGlobals dtb__151))) ((Elab_dTypes.v_ecAddData dtb__152) dd)) (B_dData_dList.C_List__x58__x58_ (dd, acc))) records)
  | _ -> failwith "DT: impossible branch"
))))
  | _ -> failwith "DT: impossible branch"
)))))))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> ((Elab_dTypes.v_errAt dtb__147) ("DT: internal: missing data head for " ^ dtb__140))
  | _ -> failwith "DT: impossible branch"
))
  | _ -> ((((((v_elabDataBodies dtb__121) heads) globals) ec) acc) records)
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 340 "Vuna/Compiler/Elab/Data.vuna"
let v_reprIsAlias = (fun (mc0 : Frontend_dAst.t_ReprTier) -> (match mc0 with
  | Frontend_dAst.C_ReprTier_ReprAlias -> true
  | _ -> false
))

# 350 "Vuna/Compiler/Elab/Data.vuna"
let v_viaShapeOkWith = (fun (dname : string) (datas : Elab_dTypes.t_DtData B_dData_dList.t_List) (fams : string B_dData_dList.t_List) (info : (string, (Elab_dTypes.t_DtCtor, int) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (if ((B_dData_dList.v_memName dname) fams) then (let nd_uscrut4 = ((Elab_dRepresentation.v_lookupUnboxedInfo dname) info) in (match nd_uscrut4 with
  | B_dData_dMaybe.C_Maybe_Nothing -> false
  | B_dData_dMaybe.C_Maybe_Just (dtb__155) -> (match dtb__155 with
  | { B_dData_dPair.f_Pair_first = dtb__156; B_dData_dPair.f_Pair_second = dtb__157 } -> (match ((Elab_dRepresentation.v_findDtData dname) datas) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__158) -> (dtb__157 = (B_dData_dList.v_length (dtb__158).Elab_dTypes.f_DtData_dtDataParams))
  | B_dData_dMaybe.C_Maybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) else false))

# 334 "Vuna/Compiler/Elab/Data.vuna"
let v_viaFieldOk = (fun (mc0 : Frontend_dAst.t_ReprTier) (mc1 : string) (mc2 : Elab_dTypes.t_DtData B_dData_dList.t_List) (mc3 : string B_dData_dList.t_List) (mc4 : (string, (Elab_dTypes.t_DtCtor, int) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc0 with
  | Frontend_dAst.C_ReprTier_ReprBoxed -> false
  | Frontend_dAst.C_ReprTier_ReprAuto -> ((((v_viaShapeOkWith mc1) mc2) mc3) mc4)
  | Frontend_dAst.C_ReprTier_ReprAlias -> ((((v_viaShapeOkWith mc1) mc2) mc3) mc4)
  | _ -> failwith "DT: impossible branch"
))

# 307 "Vuna/Compiler/Elab/Data.vuna"
let rec v_checkViaDataDeclsGo = (fun (mc0 : (Frontend_dRast.t_Decl, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc1 : Elab_dTypes.t_DtData B_dData_dList.t_List) (mc2 : string B_dData_dList.t_List) (mc3 : (string, (Elab_dTypes.t_DtCtor, int) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__159, dtb__160) -> (match dtb__159 with
  | { B_dData_dPair.f_Pair_first = dtb__161; B_dData_dPair.f_Pair_second = dtb__162 } -> (match dtb__161 with
  | Frontend_dRast.C_Decl_DData (dtb__163, dtb__164, dtb__165, dtb__166, dtb__167, dtb__168, dtb__169, dtb__170, dtb__171) -> (if dtb__168 then ((Base_dDiagnostics_dTc.v_tcErr0 dtb__171) Base_dDiagnostics_dTc.C_TcErr_DerivingViaOnlyRecord) else (if (if (v_reprIsAlias dtb__169) then (B_dData_dBool.v_not ((B_dData_dList.v_memName dtb__163) mc2)) else false) then ((Base_dDiagnostics_dTc.v_tcErr0 dtb__171) Base_dDiagnostics_dTc.C_TcErr_ReprAliasInvalid) else ((((v_checkViaDataDeclsGo dtb__160) mc1) mc2) mc3)))
  | Frontend_dRast.C_Decl_DRecord (dtb__172, dtb__173, dtb__174, dtb__175, dtb__176, dtb__177, dtb__178, dtb__179) -> (if (if (v_reprIsAlias dtb__177) then (B_dData_dBool.v_not ((B_dData_dList.v_memName dtb__172) mc2)) else false) then ((Base_dDiagnostics_dTc.v_tcErr0 dtb__179) Base_dDiagnostics_dTc.C_TcErr_ReprAliasInvalid) else (if dtb__176 then (if (((((v_viaFieldOk dtb__177) dtb__172) mc1) mc2) mc3) then ((((v_checkViaDataDeclsGo dtb__160) mc1) mc2) mc3) else ((Base_dDiagnostics_dTc.v_tcErr0 dtb__179) Base_dDiagnostics_dTc.C_TcErr_DerivingViaUnboxedRequired)) else ((((v_checkViaDataDeclsGo dtb__160) mc1) mc2) mc3)))
  | _ -> ((((v_checkViaDataDeclsGo dtb__160) mc1) mc2) mc3)
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (0))
  | _ -> failwith "DT: impossible branch"
))

# 303 "Vuna/Compiler/Elab/Data.vuna"
let v_checkViaDataDecls = (fun (decls : (Frontend_dRast.t_Decl, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List) (datas : Elab_dTypes.t_DtData B_dData_dList.t_List) -> ((((v_checkViaDataDeclsGo decls) datas) (Elab_dRepresentation.v_unboxedFamilySet datas)) (Elab_dRepresentation.v_unboxedInfoOf datas)))

# 347 "Vuna/Compiler/Elab/Data.vuna"
let v_viaShapeOk = (fun (dname : string) (datas : Elab_dTypes.t_DtData B_dData_dList.t_List) -> ((((v_viaShapeOkWith dname) datas) (Elab_dRepresentation.v_unboxedFamilySet datas)) (Elab_dRepresentation.v_unboxedInfoOf datas)))

# 364 "Vuna/Compiler/Elab/Data.vuna"
let v_elabDatas = (fun (decls : (Frontend_dRast.t_Decl, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List) (records : Elab_dRecords.t_RecordMeta B_dData_dList.t_List) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ec : Elab_dTypes.t_Ec) -> ((Base_dCommon.v_bind ((((v_elabDataHeads decls) globals) ec) B_dData_dList.C_List_Nil)) (fun (p : (Elab_dMeta.t_DataHead B_dData_dList.t_List, ((string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let nd_uscrut5 = p in (match nd_uscrut5 with
  | { B_dData_dPair.f_Pair_first = dtb__180; B_dData_dPair.f_Pair_second = dtb__181 } -> (match dtb__181 with
  | { B_dData_dPair.f_Pair_first = dtb__182; B_dData_dPair.f_Pair_second = dtb__183 } -> ((Base_dCommon.v_bind ((((((v_elabDataBodies decls) dtb__180) dtb__182) dtb__183) B_dData_dList.C_List_Nil) records)) (fun (q : (Elab_dTypes.t_DtData B_dData_dList.t_List, ((string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (match q with
  | { B_dData_dPair.f_Pair_first = dtb__184; B_dData_dPair.f_Pair_second = dtb__185 } -> ((Base_dCommon.v_bind ((v_checkViaDataDecls decls) dtb__184)) (fun (_u : int) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb__184; B_dData_dPair.f_Pair_second = dtb__185 }))))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))))

# 408 "Vuna/Compiler/Elab/Data.vuna"
let rec v_ctorFieldGo = (fun (mc0 : int) (mc1 : Core_dTerm.t_Term) (mc2 : Core_dTerm.t_Term B_dData_dList.t_List) -> (match mc1 with
  | Core_dTerm.C_Term_TPi (dtb__186, dtb__187, dtb__188, dtb__189, dtb__190) -> (if (mc0 > 0) then (((v_ctorFieldGo (mc0 - 1)) dtb__190) mc2) else (((v_ctorFieldGo 0) dtb__190) (B_dData_dList.C_List__x58__x58_ (dtb__189, mc2))))
  | _ -> (B_dData_dList.v_reverse mc2)
))

# 405 "Vuna/Compiler/Elab/Data.vuna"
let v_ctorFieldTerms = (fun (arity : int) (ty : Core_dTerm.t_Term) -> (((v_ctorFieldGo arity) ty) B_dData_dList.C_List_Nil))

# 420 "Vuna/Compiler/Elab/Data.vuna"
let rec v_termUsesVar = (fun (mc0 : int) (mc1 : Core_dTerm.t_Term) -> (match mc1 with
  | Core_dTerm.C_Term_TIf (dtb__191, dtb__192, dtb__193) -> (if (if ((v_termUsesVar mc0) dtb__191) then true else ((v_termUsesVar mc0) dtb__192)) then true else ((v_termUsesVar mc0) dtb__193))
  | Core_dTerm.C_Term_TBool (dtb__194) -> false
  | Core_dTerm.C_Term_TFloat (dtb__195) -> false
  | Core_dTerm.C_Term_TStr (dtb__196) -> false
  | Core_dTerm.C_Term_TInt (dtb__197) -> false
  | Core_dTerm.C_Term_TCase (dtb__198, dtb__199) -> (if ((v_termUsesVar mc0) dtb__198) then true else ((v_termUsesVarAlts mc0) dtb__199))
  | Core_dTerm.C_Term_TRecUpd (dtb__200, dtb__201, dtb__202, dtb__203, dtb__204) -> (if ((v_termUsesVar mc0) dtb__200) then true else ((v_termUsesVar (mc0 + (B_dData_dList.v_length dtb__202))) dtb__204))
  | Core_dTerm.C_Term_TProj (dtb__205, dtb__206, dtb__207, dtb__208, dtb__209) -> ((v_termUsesVar mc0) dtb__205)
  | Core_dTerm.C_Term_TRecord (dtb__210, dtb__211) -> ((v_termUsesVarArgs mc0) dtb__211)
  | Core_dTerm.C_Term_TMk (dtb__212, dtb__213) -> ((v_termUsesVarArgs mc0) dtb__213)
  | Core_dTerm.C_Term_TCon (dtb__214, dtb__215) -> ((v_termUsesVarArgs mc0) dtb__215)
  | Core_dTerm.C_Term_TApp (dtb__216, dtb__217, dtb__218) -> (if ((v_termUsesVar mc0) dtb__216) then true else ((v_termUsesVar mc0) dtb__217))
  | Core_dTerm.C_Term_TLam (dtb__219, dtb__220, dtb__221, dtb__222, dtb__223) -> ((v_termUsesVar (mc0 + 1)) dtb__223)
  | Core_dTerm.C_Term_TPi (dtb__224, dtb__225, dtb__226, dtb__227, dtb__228) -> (if ((v_termUsesVar mc0) dtb__227) then true else ((v_termUsesVar (mc0 + 1)) dtb__228))
  | Core_dTerm.C_Term_TType (dtb__229) -> false
  | Core_dTerm.C_Term_TGlobal (dtb__230) -> false
  | Core_dTerm.C_Term_TMeta (dtb__231) -> false
  | Core_dTerm.C_Term_TVar (dtb__232, dtb__233, dtb__234) -> (dtb__233 = mc0)
  | _ -> failwith "DT: impossible branch"
))
# 443 "Vuna/Compiler/Elab/Data.vuna"
and v_termUsesVarArgs = (fun (mc0 : int) (mc1 : (Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__235, dtb__236) -> (match dtb__235 with
  | { B_dData_dPair.f_Pair_first = dtb__237; B_dData_dPair.f_Pair_second = dtb__238 } -> (if ((v_termUsesVar mc0) dtb__237) then true else ((v_termUsesVarArgs mc0) dtb__236))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))
# 447 "Vuna/Compiler/Elab/Data.vuna"
and v_termUsesVarAlts = (fun (mc0 : int) (mc1 : Core_dTerm.t_CaseAlt B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__239, dtb__240) -> (if ((v_termUsesVar (mc0 + (B_dData_dList.v_length (Core_dTerm.v_caseAltBinders dtb__239)))) (Core_dTerm.v_caseAltBody dtb__239)) then true else ((v_termUsesVarAlts mc0) dtb__240))
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 416 "Vuna/Compiler/Elab/Data.vuna"
let rec v_usedInTeleGo = (fun (mc0 : int) (mc1 : Core_dTerm.t_Term B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__241, dtb__242) -> (if ((v_termUsesVar mc0) dtb__241) then true else ((v_usedInTeleGo mc0) dtb__242))
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 413 "Vuna/Compiler/Elab/Data.vuna"
let v_usedInTele = (fun (i : int) (arity : int) (k : int) (ts : Core_dTerm.t_Term B_dData_dList.t_List) -> ((v_usedInTeleGo (k + arity)) ts))

# 401 "Vuna/Compiler/Elab/Data.vuna"
let v_usedInCtor = (fun (i : int) (arity : int) (c : Elab_dTypes.t_DtCtor) -> ((((v_usedInTele i) arity) 0) ((v_ctorFieldTerms arity) (Elab_dTypes.v_dtCtorType c))))

# 397 "Vuna/Compiler/Elab/Data.vuna"
let rec v_usedInCtors = (fun (mc0 : int) (mc1 : int) (mc2 : Elab_dTypes.t_DtCtor B_dData_dList.t_List) -> (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__243, dtb__244) -> (if (((v_usedInCtor mc0) mc1) dtb__243) then true else (((v_usedInCtors mc0) mc1) dtb__244))
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 394 "Vuna/Compiler/Elab/Data.vuna"
let v_paramUsedInFieldTys = (fun (dd : Elab_dTypes.t_DtData) (i : int) -> (((v_usedInCtors i) (B_dData_dList.v_length (dd).Elab_dTypes.f_DtData_dtDataParams)) (Elab_dTypes.v_dtDataCtors dd)))

# 389 "Vuna/Compiler/Elab/Data.vuna"
let rec v_eraseMaskGo = (fun (mc0 : Elab_dTypes.t_DtData) (mc1 : (string, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc2 : int) (mc3 : bool B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__245, dtb__246) -> ((((v_eraseMaskGo mc0) dtb__246) (mc2 + 1)) (B_dData_dList.C_List__x58__x58_ ((B_dData_dBool.v_not ((v_paramUsedInFieldTys mc0) mc2)), mc3)))
  | B_dData_dList.C_List_Nil -> (B_dData_dList.v_reverse mc3)
  | _ -> failwith "DT: impossible branch"
))

# 386 "Vuna/Compiler/Elab/Data.vuna"
let v_eraseIndexMask = (fun (dd : Elab_dTypes.t_DtData) -> ((((v_eraseMaskGo dd) (dd).Elab_dTypes.f_DtData_dtDataParams) 0) B_dData_dList.C_List_Nil))

# 460 "Vuna/Compiler/Elab/Data.vuna"
let rec v_candidateNames = (fun (mc0 : (string, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc1 : bool B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__247, dtb__248) -> (match dtb__247 with
  | { B_dData_dPair.f_Pair_first = dtb__249; B_dData_dPair.f_Pair_second = dtb__250 } -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__251, dtb__252) -> (if dtb__251 then (B_dData_dList.C_List__x58__x58_ (dtb__249, ((v_candidateNames dtb__248) dtb__252))) else ((v_candidateNames dtb__248) dtb__252))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 457 "Vuna/Compiler/Elab/Data.vuna"
let v_candidateOf = (fun (d : Elab_dTypes.t_DtData) -> { B_dData_dPair.f_Pair_first = (Elab_dTypes.v_dtDataName d); B_dData_dPair.f_Pair_second = ((v_candidateNames (d).Elab_dTypes.f_DtData_dtDataParams) (v_eraseIndexMask d)) })

# 453 "Vuna/Compiler/Elab/Data.vuna"
let rec v_indexErasureCandidates = (fun (mc0 : Elab_dTypes.t_DtData B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__253, dtb__254) -> (B_dData_dList.C_List__x58__x58_ ((v_candidateOf dtb__253), (v_indexErasureCandidates dtb__254)))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))
