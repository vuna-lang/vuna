open Vuna_runtime
# 69 "Vuna/Compiler/Elab/Data.vuna"
let rec v_kindResultLevel = (fun (mc0 : Core_dTerm.t_Term) -> (match mc0 with
  | Core_dTerm.C_Term_TType (dtb__0) -> (B_dData_dMaybe.C_Maybe_Just (dtb__0))
  | Core_dTerm.C_Term_TPi (dtb__1, dtb__2, dtb__3, dtb__4, dtb__5) -> (v_kindResultLevel dtb__5)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
))

# 129 "Vuna/Compiler/Elab/Data.vuna"
let rec v_famSpineHead = (fun (mc0 : string) (mc1 : Core_dTerm.t_Term) -> (match mc1 with
  | Core_dTerm.C_Term_TRecord (dtb__6, dtb__7) -> (dtb__6 = mc0)
  | Core_dTerm.C_Term_TApp (dtb__8, dtb__9, dtb__10) -> ((v_famSpineHead mc0) dtb__8)
  | Core_dTerm.C_Term_TGlobal (dtb__11) -> (dtb__11 = mc0)
  | _ -> false
))

# 96 "Vuna/Compiler/Elab/Data.vuna"
let rec v_famAsPiDomain = (fun (mc0 : string) (mc1 : Core_dTerm.t_Term) -> (match mc1 with
  | Core_dTerm.C_Term_TIf (dtb__12, dtb__13, dtb__14) -> (if (if ((v_famAsPiDomain mc0) dtb__12) then true else ((v_famAsPiDomain mc0) dtb__13)) then true else ((v_famAsPiDomain mc0) dtb__14))
  | Core_dTerm.C_Term_TCase (dtb__15, dtb__16) -> (if ((v_famAsPiDomain mc0) dtb__15) then true else ((v_famAsPiDomainAlts mc0) dtb__16))
  | Core_dTerm.C_Term_TRecUpd (dtb__17, dtb__18, dtb__19, dtb__20, dtb__21) -> (if ((v_famAsPiDomain mc0) dtb__17) then true else ((v_famAsPiDomain mc0) dtb__21))
  | Core_dTerm.C_Term_TProj (dtb__22, dtb__23, dtb__24, dtb__25, dtb__26) -> ((v_famAsPiDomain mc0) dtb__22)
  | Core_dTerm.C_Term_TRecord (dtb__27, dtb__28) -> ((v_famAsPiDomainArgs mc0) dtb__28)
  | Core_dTerm.C_Term_TMk (dtb__29, dtb__30) -> ((v_famAsPiDomainArgs mc0) dtb__30)
  | Core_dTerm.C_Term_TCon (dtb__31, dtb__32) -> ((v_famAsPiDomainArgs mc0) dtb__32)
  | Core_dTerm.C_Term_TApp (dtb__33, dtb__34, dtb__35) -> (if ((v_famAsPiDomain mc0) dtb__33) then true else ((v_famAsPiDomain mc0) dtb__34))
  | Core_dTerm.C_Term_TLam (dtb__36, dtb__37, dtb__38, dtb__39, dtb__40) -> (if ((v_famAsPiDomainSlot mc0) dtb__38) then true else ((v_famAsPiDomain mc0) dtb__40))
  | Core_dTerm.C_Term_TPi (dtb__41, dtb__42, dtb__43, dtb__44, dtb__45) -> (if (if ((v_famSpineHead mc0) dtb__44) then true else ((v_famAsPiDomain mc0) dtb__44)) then true else ((v_famAsPiDomain mc0) dtb__45))
  | _ -> false
))
# 111 "Vuna/Compiler/Elab/Data.vuna"
and v_famAsPiDomainArgs = (fun (mc0 : string) (mc1 : (Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__46, dtb__47) -> (match dtb__46 with
  | { B_dData_dPair.f_Pair_first = dtb__48; B_dData_dPair.f_Pair_second = dtb__49 } -> (if ((v_famAsPiDomain mc0) dtb__48) then true else ((v_famAsPiDomainArgs mc0) dtb__47))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))
# 115 "Vuna/Compiler/Elab/Data.vuna"
and v_famAsPiDomainAlts = (fun (mc0 : string) (mc1 : Core_dTerm.t_CaseAlt B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__50, dtb__51) -> (if ((v_famAsPiDomain mc0) (dtb__50).Core_dTerm.f_CaseAlt_caseAltBody) then true else ((v_famAsPiDomainAlts mc0) dtb__51))
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))
# 119 "Vuna/Compiler/Elab/Data.vuna"
and v_famAsPiDomainSlot = (fun (mc0 : string) (mc1 : (Core_dTerm.t_LamMark, (Core_dTerm.t_Term B_dData_dMaybe.t_Maybe, Core_dTerm.t_Term B_dData_dMaybe.t_Maybe) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dMaybe.t_Maybe) -> (match mc1 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__52) -> (match dtb__52 with
  | { B_dData_dPair.f_Pair_first = dtb__53; B_dData_dPair.f_Pair_second = dtb__54 } -> (match dtb__54 with
  | { B_dData_dPair.f_Pair_first = dtb__55; B_dData_dPair.f_Pair_second = dtb__56 } -> (if ((v_famAsPiDomainMaybe mc0) dtb__55) then true else ((v_famAsPiDomainMaybe mc0) dtb__56))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
))
# 124 "Vuna/Compiler/Elab/Data.vuna"
and v_famAsPiDomainMaybe = (fun (mc0 : string) (mc1 : Core_dTerm.t_Term B_dData_dMaybe.t_Maybe) -> (match mc1 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__57) -> ((v_famAsPiDomain mc0) dtb__57)
  | B_dData_dMaybe.C_Maybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
))

# 156 "Vuna/Compiler/Elab/Data.vuna"
let rec v_countSurfacePis = (fun (mc0 : Frontend_dAst.t_Expr) -> (match mc0 with
  | Frontend_dAst.C_Expr_EApp (dtb__58, dtb__59, dtb__60) -> (match dtb__58 with
  | Frontend_dAst.C_Expr_EVar (dtb__61, dtb__62) -> (if (dtb__61 = "->") then (match dtb__59 with
  | B_dData_dList.C_List__x58__x58_ (dtb__63, dtb__64) -> (match dtb__64 with
  | B_dData_dList.C_List__x58__x58_ (dtb__65, dtb__66) -> (match dtb__66 with
  | B_dData_dList.C_List_Nil -> (1 + (v_countSurfacePis dtb__65))
  | _ -> 0
)
  | _ -> 0
)
  | _ -> 0
) else 0)
  | _ -> 0
)
  | Frontend_dAst.C_Expr_EPi (dtb__67, dtb__68, dtb__69, dtb__70, dtb__71, dtb__72) -> (1 + (v_countSurfacePis dtb__71))
  | _ -> 0
))

# 162 "Vuna/Compiler/Elab/Data.vuna"
let rec v_countTelePis = (fun (mc0 : Core_dTerm.t_Term) -> (match mc0 with
  | Core_dTerm.C_Term_TPi (dtb__73, dtb__74, dtb__75, dtb__76, dtb__77) -> (1 + (v_countTelePis dtb__77))
  | _ -> 0
))

# 166 "Vuna/Compiler/Elab/Data.vuna"
let rec v_ctorFieldSortsGo = (fun (mc0 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc1 : Elab_dTypes.t_Ctx) (mc2 : Elab_dTypes.t_Ec) (mc3 : int) (mc4 : int) (mc5 : Core_dTerm.t_Level) (mc6 : string) (mc7 : string) (mc8 : Base_dSource.t_Span) (mc9 : Frontend_dAst.t_Expr) -> (match mc9 with
  | Frontend_dAst.C_Expr_EApp (dtb__78, dtb__79, dtb__80) -> (match dtb__78 with
  | Frontend_dAst.C_Expr_EVar (dtb__81, dtb__82) -> (if (dtb__81 = "->") then (match dtb__79 with
  | B_dData_dList.C_List__x58__x58_ (dtb__83, dtb__84) -> (match dtb__84 with
  | B_dData_dList.C_List__x58__x58_ (dtb__85, dtb__86) -> (match dtb__86 with
  | B_dData_dList.C_List_Nil -> ((((((((((((v_ctorFieldSortsBinder mc0) mc1) mc2) mc3) mc4) mc5) mc6) mc7) mc8) "_") dtb__83) dtb__85)
  | _ -> (Base_dDiag.C_Check_OkC (mc2))
)
  | _ -> (Base_dDiag.C_Check_OkC (mc2))
)
  | _ -> (Base_dDiag.C_Check_OkC (mc2))
) else (Base_dDiag.C_Check_OkC (mc2)))
  | _ -> (Base_dDiag.C_Check_OkC (mc2))
)
  | Frontend_dAst.C_Expr_EPi (dtb__87, dtb__88, dtb__89, dtb__90, dtb__91, dtb__92) -> ((((((((((((v_ctorFieldSortsBinder mc0) mc1) mc2) mc3) mc4) mc5) mc6) mc7) mc8) dtb__87) dtb__90) dtb__91)
  | _ -> (Base_dDiag.C_Check_OkC (mc2))
))
# 173 "Vuna/Compiler/Elab/Data.vuna"
and v_ctorFieldSortsBinder = (fun (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (pos : int) (arity : int) (famLevel : Core_dTerm.t_Level) (fam : string) (cname : string) (csp : Base_dSource.t_Span) (name : string) (dom : Frontend_dAst.t_Expr) (cod : Frontend_dAst.t_Expr) -> ((Base_dCommon.v_bind ((((Elab_dTerm.v_checkType globals) ctx) ec) dom)) (fun (p : (Core_dTerm.t_Term, (Core_dTerm.t_Level, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let nd_uscrut13 = p in (match nd_uscrut13 with
  | { B_dData_dPair.f_Pair_first = dtb__93; B_dData_dPair.f_Pair_second = dtb__94 } -> (match dtb__94 with
  | { B_dData_dPair.f_Pair_first = dtb__95; B_dData_dPair.f_Pair_second = dtb__96 } -> (let ctx2 = (((Elab_dTypes.v_ctxBind name) dtb__93) ctx) in (if (pos < arity) then ((((((((((v_ctorFieldSortsGo globals) ctx2) dtb__96) (pos + 1)) arity) famLevel) fam) cname) csp) cod) else (if (if ((Core_dTerm.v_levelLt dtb__95) famLevel) then true else ((Core_dTerm.v_levelEq dtb__95) famLevel)) then (if ((v_famAsPiDomain fam) dtb__93) then (let field = (pos - arity) in (let msg = (String.concat "" ["field #"; (string_of_int field); ": the family occurs as a function argument type (negative position)"]) in ((((Base_dDiagnostics_dTc.v_tcErr2 csp) (Base_dDiagnostics_dTc.C_TcErr_CtorNotStrictlyPositive ((Frontend_dAst.v_ctorDisplayName cname), msg))) (Frontend_dAst.v_ctorDisplayName cname)) msg))) else ((((((((((v_ctorFieldSortsGo globals) ctx2) dtb__96) (pos + 1)) arity) famLevel) fam) cname) csp) cod)) else (let field = (pos - arity) in (let msg = (String.concat "" ["field #"; (string_of_int field); ": its type sorts into Type "; (string_of_int (Core_dTerm.v_levelToInt dtb__95)); ", above the family level Type "; (string_of_int (Core_dTerm.v_levelToInt famLevel))]) in ((((Base_dDiagnostics_dTc.v_tcErr2 csp) (Base_dDiagnostics_dTc.C_TcErr_CtorError ((Frontend_dAst.v_ctorDisplayName cname), msg))) (Frontend_dAst.v_ctorDisplayName cname)) msg))))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))))

# 142 "Vuna/Compiler/Elab/Data.vuna"
let v_checkCtorFieldSorts = (fun (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (arity : int) (famLevel : Core_dTerm.t_Level) (fam : string) (cname : string) (csp : Base_dSource.t_Span) (tyPis : int) (tyExpr : Frontend_dAst.t_Expr) -> (let surfacePis = (v_countSurfacePis tyExpr) in (if (surfacePis <> tyPis) then ((((Base_dDiagnostics_dTc.v_tcErr2 csp) (Base_dDiagnostics_dTc.C_TcErr_CtorError ((Frontend_dAst.v_ctorDisplayName cname), "cannot verify the universe level of its field types; write the constructor type as a Pi chain"))) cname) "cannot verify the universe level of its field types; write the constructor type as a Pi chain") else ((((((((((v_ctorFieldSortsGo globals) ctx) ec) 0) arity) famLevel) fam) cname) csp) tyExpr))))

# 25 "Vuna/Compiler/Elab/Data.vuna"
let v_elabCtor = (fun (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (fam : string) (arity : int) (famLevel : Core_dTerm.t_Level) (ec : Elab_dTypes.t_Ec) (c : Frontend_dAst.t_Ctor) -> (match c with
  | { Frontend_dAst.f_Ctor_ctorName = dtb__97; Frontend_dAst.f_Ctor_ctorType = dtb__98; Frontend_dAst.f_Ctor_ctorArity = dtb__99; Frontend_dAst.f_Ctor_ctorRef = dtb__100 } -> (let famKind = (match ((Elab_dMeta.v_globalLookup fam) globals) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__107) -> dtb__107
  | B_dData_dMaybe.C_Maybe_Nothing -> (Core_dTerm.C_Term_TType (Core_dTerm.v_levelZero))
  | _ -> failwith "DT: impossible branch"
) in (let tyExpr2 = (if (Elab_dMeta.v_hasFamParams dtb__98) then dtb__98 else (((Elab_dMeta.v_prependFamParams famKind) dtb__98) (Frontend_dAst.v_nodeRefSpan dtb__100))) in (let gl = ((B_dData_dList.v_append globals) (B_dContainer_dHashMap.v_toList (Elab_dTypes.v_ecGlobalsTbl ec))) in ((Base_dCommon.v_bind ((((Elab_dTerm.v_checkType gl) Elab_dTypes.v_emptyCtx) ec) tyExpr2)) (fun (pk : (Core_dTerm.t_Term, (Core_dTerm.t_Level, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let nd_uscrut14 = pk in (match nd_uscrut14 with
  | { B_dData_dPair.f_Pair_first = dtb__101; B_dData_dPair.f_Pair_second = dtb__102 } -> (match dtb__102 with
  | { B_dData_dPair.f_Pair_first = dtb__103; B_dData_dPair.f_Pair_second = dtb__104 } -> (let tyTerm = (((Elab_dMeta.v_zonkTerm dtb__104) 0) dtb__101) in (match (Elab_dMeta.v_resultSpine (Elab_dMeta.v_dropParams tyTerm)) with
  | { B_dData_dPair.f_Pair_first = dtb__105; B_dData_dPair.f_Pair_second = dtb__106 } -> (if (dtb__105 <> fam) then ((((Base_dDiagnostics_dTc.v_tcErr2 (Frontend_dAst.v_nodeRefSpan dtb__100)) (Base_dDiagnostics_dTc.C_TcErr_CtorDoesNotReturn ((Frontend_dAst.v_ctorDisplayName dtb__97), fam))) (Frontend_dAst.v_ctorDisplayName dtb__97)) fam) else (if ((B_dData_dList.v_length dtb__106) <> arity) then ((((Base_dDiagnostics_dTc.v_tcErr2 (Frontend_dAst.v_nodeRefSpan dtb__100)) (Base_dDiagnostics_dTc.C_TcErr_CtorWrongIndices ((Frontend_dAst.v_ctorDisplayName dtb__97), fam))) (Frontend_dAst.v_ctorDisplayName dtb__97)) fam) else ((Base_dCommon.v_bind ((((((((((v_checkCtorFieldSorts gl) Elab_dTypes.v_emptyCtx) dtb__104) arity) famLevel) fam) dtb__97) (Frontend_dAst.v_nodeRefSpan dtb__100)) (v_countTelePis tyTerm)) tyExpr2)) (fun (_u : Elab_dTypes.t_Ec) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = { Elab_dTypes.f_DtCtor_dtCtorName = dtb__97; Elab_dTypes.f_DtCtor_dtCtorFamily = fam; Elab_dTypes.f_DtCtor_dtCtorTelescope = (Elab_dMeta.v_teleOfType tyTerm); Elab_dTypes.f_DtCtor_dtCtorType = tyTerm; Elab_dTypes.f_DtCtor_dtCtorSpan = (B_dData_dMaybe.C_Maybe_Just ((Frontend_dAst.v_nodeRefSpan dtb__100))) }; B_dData_dPair.f_Pair_second = dtb__104 }))))))
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
  | B_dData_dList.C_List__x58__x58_ (dtb__108, dtb__109) -> ((Base_dCommon.v_bind ((((((v_elabCtor mc0) mc1) mc2) mc3) mc4) dtb__108)) (fun (p : (Elab_dTypes.t_DtCtor, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match p with
  | { B_dData_dPair.f_Pair_first = dtb__110; B_dData_dPair.f_Pair_second = dtb__111 } -> ((Base_dCommon.v_bind ((((((v_elabCtors mc0) mc1) mc2) mc3) dtb__111) dtb__109)) (fun (q : (Elab_dTypes.t_DtCtor B_dData_dList.t_List, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match q with
  | { B_dData_dPair.f_Pair_first = dtb__112; B_dData_dPair.f_Pair_second = dtb__113 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ (dtb__110, dtb__112)); B_dData_dPair.f_Pair_second = dtb__113 }))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = mc4 }))
  | _ -> failwith "DT: impossible branch"
))

# 202 "Vuna/Compiler/Elab/Data.vuna"
let v_elabDataHead = (fun (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ec : Elab_dTypes.t_Ec) (ds : (Frontend_dAst.t_Decl, Base_dSource.t_Span) B_dData_dPair.t_Pair) -> (match ds with
  | { B_dData_dPair.f_Pair_first = dtb__114; B_dData_dPair.f_Pair_second = dtb__115 } -> (match dtb__114 with
  | Frontend_dAst.C_Decl_DData (dtb__116, dtb__117, dtb__118, dtb__119, dtb__120, dtb__121, dtb__122, dtb__123, dtb__124) -> (if ((B_dData_dList.v_memName dtb__116) Elab_dPrelude.v_preludeNames) then (((Base_dDiagnostics_dTc.v_tcErr1 (Frontend_dAst.v_nodeRefSpan dtb__124)) (Base_dDiagnostics_dTc.C_TcErr_CannotRedefineBuiltin (dtb__116))) dtb__116) else ((Base_dCommon.v_bind ((((Elab_dTerm.v_checkType globals) Elab_dTypes.v_emptyCtx) ec) dtb__118)) (fun (pk : (Core_dTerm.t_Term, (Core_dTerm.t_Level, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let nd_uscrut17 = pk in (match nd_uscrut17 with
  | { B_dData_dPair.f_Pair_first = dtb__125; B_dData_dPair.f_Pair_second = dtb__126 } -> (match dtb__126 with
  | { B_dData_dPair.f_Pair_first = dtb__127; B_dData_dPair.f_Pair_second = dtb__128 } -> (let fullKind = ((Elab_dPrelude.v_prependParams dtb__117) (((Elab_dMeta.v_zonkTerm dtb__128) 0) dtb__125)) in (let tele = (Elab_dMeta.v_splitKind fullKind) in (let arity = (B_dData_dList.v_length tele) in (if (B_dData_dBool.v_not (Elab_dMeta.v_kindWellFormed fullKind)) then ((Base_dDiagnostics_dTc.v_tcErr0 (Frontend_dAst.v_nodeRefSpan dtb__124)) Base_dDiagnostics_dTc.C_TcErr_DataKindArrows) else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = { Elab_dMeta.f_DataHead_dataHeadName = dtb__116; Elab_dMeta.f_DataHead_dataHeadKind = fullKind; Elab_dMeta.f_DataHead_dataHeadArity = arity }; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__116; B_dData_dPair.f_Pair_second = fullKind }, B_dData_dList.C_List_Nil)); B_dData_dPair.f_Pair_second = dtb__128 } }))))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))))
  | Frontend_dAst.C_Decl_DRecord (dtb__129, dtb__130, dtb__131, dtb__132, dtb__133, dtb__134, dtb__135, dtb__136) -> (if ((B_dData_dList.v_memName dtb__129) Elab_dPrelude.v_preludeNames) then (((Base_dDiagnostics_dTc.v_tcErr1 (Frontend_dAst.v_nodeRefSpan dtb__136)) (Base_dDiagnostics_dTc.C_TcErr_CannotRedefineBuiltin (dtb__129))) dtb__129) else (let fullKind = ((Elab_dPrelude.v_prependParams dtb__130) (Core_dTerm.C_Term_TType (Core_dTerm.v_levelZero))) in (let arity = (B_dData_dList.v_length dtb__130) in (if (B_dData_dBool.v_not (Elab_dMeta.v_kindWellFormed fullKind)) then ((Base_dDiagnostics_dTc.v_tcErr0 (Frontend_dAst.v_nodeRefSpan dtb__136)) Base_dDiagnostics_dTc.C_TcErr_DataKindArrows) else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = { Elab_dMeta.f_DataHead_dataHeadName = dtb__129; Elab_dMeta.f_DataHead_dataHeadKind = fullKind; Elab_dMeta.f_DataHead_dataHeadArity = arity }; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__129; B_dData_dPair.f_Pair_second = fullKind }, B_dData_dList.C_List_Nil)); B_dData_dPair.f_Pair_second = ec } }))))))
  | _ -> ((Elab_dTypes.v_errAt dtb__115) "DT: internal: expected a data declaration")
)
  | _ -> failwith "DT: impossible branch"
))

# 236 "Vuna/Compiler/Elab/Data.vuna"
let rec v_elabDataHeadsRound = (fun (mc0 : (Frontend_dAst.t_Decl, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc1 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc2 : Elab_dTypes.t_Ec) (mc3 : Elab_dMeta.t_DataHead B_dData_dList.t_List) (mc4 : (Frontend_dAst.t_Decl, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__137, dtb__138) -> (let nd_uscrut8 = (((v_elabDataHead mc1) mc2) dtb__137) in (match nd_uscrut8 with
  | Base_dDiag.C_Check_OkC (dtb__139) -> (match dtb__139 with
  | { B_dData_dPair.f_Pair_first = dtb__140; B_dData_dPair.f_Pair_second = dtb__141 } -> (match dtb__141 with
  | { B_dData_dPair.f_Pair_first = dtb__142; B_dData_dPair.f_Pair_second = dtb__143 } -> (((((v_elabDataHeadsRound dtb__138) ((B_dData_dList.v_append mc1) dtb__142)) dtb__143) (B_dData_dList.C_List__x58__x58_ (dtb__140, mc3))) mc4)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dDiag.C_Check_ErrC (dtb__144) -> (((((v_elabDataHeadsRound dtb__138) mc1) mc2) mc3) (B_dData_dList.C_List__x58__x58_ (dtb__137, mc4)))
  | _ -> failwith "DT: impossible branch"
))
  | B_dData_dList.C_List_Nil -> { B_dData_dPair.f_Pair_first = mc3; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = mc1; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = mc2; B_dData_dPair.f_Pair_second = (B_dData_dList.v_reverse mc4) } } }
  | _ -> failwith "DT: impossible branch"
))

# 262 "Vuna/Compiler/Elab/Data.vuna"
let v_elabDataHeadsNoProgress = (fun (mc0 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc1 : Elab_dTypes.t_Ec) (mc2 : (Frontend_dAst.t_Decl, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__145, dtb__146) -> (match (((v_elabDataHead mc0) mc1) dtb__145) with
  | Base_dDiag.C_Check_ErrC (dtb__147) -> (Base_dDiag.C_Check_ErrC (dtb__147))
  | Base_dDiag.C_Check_OkC (dtb__148) -> (Base_dDiag.v_icInternal "data head registration made no progress")
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (Base_dDiag.v_icInternal "no failed data declarations")
  | _ -> failwith "DT: impossible branch"
))

# 247 "Vuna/Compiler/Elab/Data.vuna"
let rec v_elabDataHeadsFuel = (fun (fuel : int) (pending : (Frontend_dAst.t_Decl, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ec : Elab_dTypes.t_Ec) (heads : Elab_dMeta.t_DataHead B_dData_dList.t_List) -> (if (fuel <= 0) then (Base_dDiag.v_icInternal "data head registration fuel exhausted") else (match pending with
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.v_reverse heads); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = globals; B_dData_dPair.f_Pair_second = ec } }))
  | _ -> (let nd_uscrut5 = (((((v_elabDataHeadsRound pending) globals) ec) heads) B_dData_dList.C_List_Nil) in (match nd_uscrut5 with
  | { B_dData_dPair.f_Pair_first = dtb__149; B_dData_dPair.f_Pair_second = dtb__150 } -> (match dtb__150 with
  | { B_dData_dPair.f_Pair_first = dtb__151; B_dData_dPair.f_Pair_second = dtb__152 } -> (match dtb__152 with
  | { B_dData_dPair.f_Pair_first = dtb__153; B_dData_dPair.f_Pair_second = dtb__154 } -> (match dtb__154 with
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.v_reverse dtb__149); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = dtb__151; B_dData_dPair.f_Pair_second = dtb__153 } }))
  | _ -> (if ((B_dData_dList.v_length dtb__154) = (B_dData_dList.v_length pending)) then (((v_elabDataHeadsNoProgress globals) ec) dtb__154) else (((((v_elabDataHeadsFuel (fuel - 1)) dtb__154) dtb__151) dtb__153) dtb__149))
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))
)))

# 244 "Vuna/Compiler/Elab/Data.vuna"
let v_elabDataHeads = (fun (pending : (Frontend_dAst.t_Decl, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ec : Elab_dTypes.t_Ec) (heads : Elab_dMeta.t_DataHead B_dData_dList.t_List) -> (((((v_elabDataHeadsFuel 64) pending) globals) ec) heads))

# 282 "Vuna/Compiler/Elab/Data.vuna"
let rec v_skipParamPis = (fun (mc0 : int) (mc1 : Core_dTerm.t_Term) -> (match mc1 with
  | Core_dTerm.C_Term_TPi (dtb__155, dtb__156, dtb__157, dtb__158, dtb__159) -> (if (mc0 <= 0) then mc1 else ((v_skipParamPis (mc0 - 1)) dtb__159))
  | _ -> mc1
))

# 288 "Vuna/Compiler/Elab/Data.vuna"
let v_recordFieldIndependent = (fun (i : int) (dom : Core_dTerm.t_Term) -> (B_dData_dBool.v_not (Core_dTerm.v_hasNegativeVar (((Core_dTerm.v_shift 0) (0 - i)) dom))))

# 291 "Vuna/Compiler/Elab/Data.vuna"
let rec v_dtFieldsOfRecordGo = (fun (mc0 : Elab_dRecords.t_RecordFieldMeta B_dData_dList.t_List) (mc1 : int) (mc2 : Core_dTerm.t_Term) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__160, dtb__161) -> (match mc2 with
  | Core_dTerm.C_Term_TPi (dtb__162, dtb__163, dtb__164, dtb__165, dtb__166) -> (if (B_dData_dBool.v_not ((v_recordFieldIndependent mc1) dtb__165)) then (Base_dDiag.v_icInternal (String.concat "" ["record field `"; (dtb__160).Elab_dRecords.f_RecordFieldMeta_recordFieldName; "` references a previous field"])) else ((Base_dCommon.v_bind (((v_dtFieldsOfRecordGo dtb__161) (mc1 + 1)) dtb__166)) (fun (more : Elab_dTypes.t_DtFieldMeta B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((B_dData_dList.C_List__x58__x58_ ({ Elab_dTypes.f_DtFieldMeta_dtFieldName = (dtb__160).Elab_dRecords.f_RecordFieldMeta_recordFieldName; Elab_dTypes.f_DtFieldMeta_dtFieldIndex = mc1; Elab_dTypes.f_DtFieldMeta_dtFieldType = (((Core_dTerm.v_shift 0) (0 - mc1)) dtb__165) }, more)))))))
  | _ -> (Base_dDiag.v_icInternal "record field table is longer than the constructor telescope")
)
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (B_dData_dList.C_List_Nil))
  | _ -> failwith "DT: impossible branch"
))

# 273 "Vuna/Compiler/Elab/Data.vuna"
let v_dtFieldsOfRecord = (fun (records : Elab_dRecords.t_RecordMeta B_dData_dList.t_List) (dname : string) (arity : int) (ctors : Elab_dTypes.t_DtCtor B_dData_dList.t_List) -> (match ((Elab_dRecords.v_lookupRecord dname) records) with
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.C_Check_OkC (B_dData_dList.C_List_Nil))
  | B_dData_dMaybe.C_Maybe_Just (dtb__167) -> (let nd_uscrut6 = ctors in (match nd_uscrut6 with
  | B_dData_dList.C_List__x58__x58_ (dtb__168, dtb__169) -> (match dtb__169 with
  | B_dData_dList.C_List_Nil -> (((v_dtFieldsOfRecordGo (dtb__167).Elab_dRecords.f_RecordMeta_recordMetaFields) 0) ((v_skipParamPis arity) (Elab_dTypes.v_dtCtorType dtb__168)))
  | _ -> (Base_dDiag.C_Check_OkC (B_dData_dList.C_List_Nil))
)
  | _ -> (Base_dDiag.C_Check_OkC (B_dData_dList.C_List_Nil))
))
  | _ -> failwith "DT: impossible branch"
))

# 382 "Vuna/Compiler/Elab/Data.vuna"
let v_sameCtorSet = (fun (expected : string B_dData_dList.t_List) (actual : string B_dData_dList.t_List) -> (if ((B_dData_dList.v_length expected) = (B_dData_dList.v_length actual)) then ((B_dData_dList.v_allMem expected) actual) else false))

# 305 "Vuna/Compiler/Elab/Data.vuna"
let rec v_elabDataBodies = (fun (decls : (Frontend_dAst.t_Decl, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List) (heads : Elab_dMeta.t_DataHead B_dData_dList.t_List) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ec : Elab_dTypes.t_Ec) (acc : Elab_dTypes.t_DtData B_dData_dList.t_List) (records : Elab_dRecords.t_RecordMeta B_dData_dList.t_List) -> (match decls with
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.v_reverse acc); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = globals; B_dData_dPair.f_Pair_second = ec } }))
  | B_dData_dList.C_List__x58__x58_ (dtb__170, dtb__171) -> (match dtb__170 with
  | { B_dData_dPair.f_Pair_first = dtb__172; B_dData_dPair.f_Pair_second = dtb__173 } -> (match dtb__172 with
  | Frontend_dAst.C_Decl_DData (dtb__174, dtb__175, dtb__176, dtb__177, dtb__178, dtb__179, dtb__180, dtb__181, dtb__182) -> (let nd_uscrut22 = ((Elab_dMeta.v_lookupDataHead dtb__174) heads) in (match nd_uscrut22 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__183) -> (match dtb__183 with
  | { B_dData_dPair.f_Pair_first = dtb__184; B_dData_dPair.f_Pair_second = dtb__185 } -> (let tele = (Elab_dMeta.v_splitKind dtb__184) in (let famLevel = (match (v_kindResultLevel dtb__184) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__189) -> dtb__189
  | B_dData_dMaybe.C_Maybe_Nothing -> Core_dTerm.v_levelZero
  | _ -> failwith "DT: impossible branch"
) in (if dtb__179 then ((Base_dDiagnostics_dTc.v_tcErr0 (Frontend_dAst.v_nodeRefSpan dtb__182)) Base_dDiagnostics_dTc.C_TcErr_DerivingViaOnlyRecord) else ((Base_dCommon.v_bind ((((((v_elabCtors globals) dtb__174) dtb__185) famLevel) ec) dtb__177)) (fun (q : (Elab_dTypes.t_DtCtor B_dData_dList.t_List, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match q with
  | { B_dData_dPair.f_Pair_first = dtb__186; B_dData_dPair.f_Pair_second = dtb__187 } -> ((Base_dCommon.v_bind ((((v_dtFieldsOfRecord records) dtb__174) (B_dData_dList.v_length tele)) dtb__186)) (fun (fields : Elab_dTypes.t_DtFieldMeta B_dData_dList.t_List) -> (let viaClasses = (if dtb__179 then dtb__178 else B_dData_dList.C_List_Nil) in (let dd = { Elab_dTypes.f_DtData_dtDataName = dtb__174; Elab_dTypes.f_DtData_dtDataParams = tele; Elab_dTypes.f_DtData_dtDataCtors = dtb__186; Elab_dTypes.f_DtData_dtDataKind = dtb__184; Elab_dTypes.f_DtData_dtDataViaClasses = viaClasses; Elab_dTypes.f_DtData_dtDataLinear = dtb__181; Elab_dTypes.f_DtData_dtDataRepr = dtb__180; Elab_dTypes.f_DtData_dtDataFields = fields; Elab_dTypes.f_DtData_dtDataIsRecord = false } in (match (Base_dIntrinsics.v_canonicalCtorsFor dtb__174) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__188) -> (if ((v_sameCtorSet dtb__188) ((B_dData_dList.v_map Elab_dTypes.v_dtCtorName) dtb__186)) then ((((((v_elabDataBodies dtb__171) heads) ((B_dData_dList.v_append globals) (Elab_dMeta.v_ctorGlobals dtb__186))) ((Elab_dTypes.v_ecAddData dtb__187) dd)) (B_dData_dList.C_List__x58__x58_ (dd, acc))) records) else (((Base_dDiagnostics_dTc.v_tcErr1 (Frontend_dAst.v_nodeRefSpan dtb__182)) (Base_dDiagnostics_dTc.C_TcErr_CannotRedefineBuiltin (dtb__174))) dtb__174))
  | B_dData_dMaybe.C_Maybe_Nothing -> ((((((v_elabDataBodies dtb__171) heads) ((B_dData_dList.v_append globals) (Elab_dMeta.v_ctorGlobals dtb__186))) ((Elab_dTypes.v_ecAddData dtb__187) dd)) (B_dData_dList.C_List__x58__x58_ (dd, acc))) records)
  | _ -> failwith "DT: impossible branch"
)))))
  | _ -> failwith "DT: impossible branch"
))))))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> ((Elab_dTypes.v_errAt (Frontend_dAst.v_nodeRefSpan dtb__182)) ("DT: internal: missing data head for " ^ dtb__174))
  | _ -> failwith "DT: impossible branch"
))
  | Frontend_dAst.C_Decl_DRecord (dtb__190, dtb__191, dtb__192, dtb__193, dtb__194, dtb__195, dtb__196, dtb__197) -> (let nd_uscrut21 = ((Elab_dMeta.v_lookupDataHead dtb__190) heads) in (match nd_uscrut21 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__198) -> (match dtb__198 with
  | { B_dData_dPair.f_Pair_first = dtb__199; B_dData_dPair.f_Pair_second = dtb__200 } -> (let tele = (Elab_dMeta.v_splitKind dtb__199) in (let famLevel = (match (v_kindResultLevel dtb__199) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__204) -> dtb__204
  | B_dData_dMaybe.C_Maybe_Nothing -> Core_dTerm.v_levelZero
  | _ -> failwith "DT: impossible branch"
) in (let ctorExpr = ((((Elab_dRecords.v_recordCtorType dtb__191) dtb__192) (((Elab_dRecords.v_recordRetType dtb__190) dtb__191) (Frontend_dAst.v_nodeRefSpan dtb__197))) (Frontend_dAst.v_nodeRefSpan dtb__197)) in (let ctorAst = { Frontend_dAst.f_Ctor_ctorName = dtb__190; Frontend_dAst.f_Ctor_ctorType = ctorExpr; Frontend_dAst.f_Ctor_ctorArity = (B_dData_dList.v_length dtb__192); Frontend_dAst.f_Ctor_ctorRef = dtb__197 } in ((Base_dCommon.v_bind ((((((v_elabCtors globals) dtb__190) dtb__200) famLevel) ec) (B_dData_dList.C_List__x58__x58_ (ctorAst, B_dData_dList.C_List_Nil)))) (fun (q : (Elab_dTypes.t_DtCtor B_dData_dList.t_List, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match q with
  | { B_dData_dPair.f_Pair_first = dtb__201; B_dData_dPair.f_Pair_second = dtb__202 } -> ((Base_dCommon.v_bind ((((v_dtFieldsOfRecord records) dtb__190) (B_dData_dList.v_length tele)) dtb__201)) (fun (fieldsMeta : Elab_dTypes.t_DtFieldMeta B_dData_dList.t_List) -> (let viaClasses = (if dtb__194 then dtb__193 else B_dData_dList.C_List_Nil) in (let dd = { Elab_dTypes.f_DtData_dtDataName = dtb__190; Elab_dTypes.f_DtData_dtDataParams = tele; Elab_dTypes.f_DtData_dtDataCtors = dtb__201; Elab_dTypes.f_DtData_dtDataKind = dtb__199; Elab_dTypes.f_DtData_dtDataViaClasses = viaClasses; Elab_dTypes.f_DtData_dtDataLinear = dtb__196; Elab_dTypes.f_DtData_dtDataRepr = dtb__195; Elab_dTypes.f_DtData_dtDataFields = fieldsMeta; Elab_dTypes.f_DtData_dtDataIsRecord = true } in (match (Base_dIntrinsics.v_canonicalCtorsFor dtb__190) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__203) -> (if ((v_sameCtorSet dtb__203) ((B_dData_dList.v_map Elab_dTypes.v_dtCtorName) dtb__201)) then ((((((v_elabDataBodies dtb__171) heads) ((B_dData_dList.v_append globals) (Elab_dMeta.v_ctorGlobals dtb__201))) ((Elab_dTypes.v_ecAddData dtb__202) dd)) (B_dData_dList.C_List__x58__x58_ (dd, acc))) records) else (((Base_dDiagnostics_dTc.v_tcErr1 (Frontend_dAst.v_nodeRefSpan dtb__197)) (Base_dDiagnostics_dTc.C_TcErr_CannotRedefineBuiltin (dtb__190))) dtb__190))
  | B_dData_dMaybe.C_Maybe_Nothing -> ((((((v_elabDataBodies dtb__171) heads) ((B_dData_dList.v_append globals) (Elab_dMeta.v_ctorGlobals dtb__201))) ((Elab_dTypes.v_ecAddData dtb__202) dd)) (B_dData_dList.C_List__x58__x58_ (dd, acc))) records)
  | _ -> failwith "DT: impossible branch"
)))))
  | _ -> failwith "DT: impossible branch"
)))))))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> ((Elab_dTypes.v_errAt (Frontend_dAst.v_nodeRefSpan dtb__197)) ("DT: internal: missing data head for " ^ dtb__190))
  | _ -> failwith "DT: impossible branch"
))
  | _ -> ((((((v_elabDataBodies dtb__171) heads) globals) ec) acc) records)
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 426 "Vuna/Compiler/Elab/Data.vuna"
let v_reprIsAlias = (fun (mc0 : Frontend_dAst.t_ReprTier) -> (match mc0 with
  | Frontend_dAst.C_ReprTier_ReprAlias -> true
  | _ -> false
))

# 436 "Vuna/Compiler/Elab/Data.vuna"
let v_viaShapeOkWith = (fun (dname : string) (datas : Elab_dTypes.t_DtData B_dData_dList.t_List) (fams : string B_dData_dList.t_List) (info : (string, (Elab_dTypes.t_DtCtor, int) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (if ((B_dData_dList.v_memName dname) fams) then (let nd_uscrut4 = ((Elab_dRepresentation.v_lookupUnboxedInfo dname) info) in (match nd_uscrut4 with
  | B_dData_dMaybe.C_Maybe_Nothing -> false
  | B_dData_dMaybe.C_Maybe_Just (dtb__205) -> (match dtb__205 with
  | { B_dData_dPair.f_Pair_first = dtb__206; B_dData_dPair.f_Pair_second = dtb__207 } -> (match ((Elab_dRepresentation.v_findDtData dname) datas) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__208) -> (dtb__207 = (B_dData_dList.v_length (dtb__208).Elab_dTypes.f_DtData_dtDataParams))
  | B_dData_dMaybe.C_Maybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) else false))

# 420 "Vuna/Compiler/Elab/Data.vuna"
let v_viaFieldOk = (fun (mc0 : Frontend_dAst.t_ReprTier) (mc1 : string) (mc2 : Elab_dTypes.t_DtData B_dData_dList.t_List) (mc3 : string B_dData_dList.t_List) (mc4 : (string, (Elab_dTypes.t_DtCtor, int) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc0 with
  | Frontend_dAst.C_ReprTier_ReprBoxed -> false
  | Frontend_dAst.C_ReprTier_ReprAuto -> ((((v_viaShapeOkWith mc1) mc2) mc3) mc4)
  | Frontend_dAst.C_ReprTier_ReprAlias -> ((((v_viaShapeOkWith mc1) mc2) mc3) mc4)
  | _ -> failwith "DT: impossible branch"
))

# 393 "Vuna/Compiler/Elab/Data.vuna"
let rec v_checkViaDataDeclsGo = (fun (mc0 : (Frontend_dAst.t_Decl, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc1 : Elab_dTypes.t_DtData B_dData_dList.t_List) (mc2 : string B_dData_dList.t_List) (mc3 : (string, (Elab_dTypes.t_DtCtor, int) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__209, dtb__210) -> (match dtb__209 with
  | { B_dData_dPair.f_Pair_first = dtb__211; B_dData_dPair.f_Pair_second = dtb__212 } -> (match dtb__211 with
  | Frontend_dAst.C_Decl_DData (dtb__213, dtb__214, dtb__215, dtb__216, dtb__217, dtb__218, dtb__219, dtb__220, dtb__221) -> (if dtb__218 then ((Base_dDiagnostics_dTc.v_tcErr0 (Frontend_dAst.v_nodeRefSpan dtb__221)) Base_dDiagnostics_dTc.C_TcErr_DerivingViaOnlyRecord) else (if (if (v_reprIsAlias dtb__219) then (B_dData_dBool.v_not ((B_dData_dList.v_memName dtb__213) mc2)) else false) then ((Base_dDiagnostics_dTc.v_tcErr0 (Frontend_dAst.v_nodeRefSpan dtb__221)) Base_dDiagnostics_dTc.C_TcErr_ReprAliasInvalid) else ((((v_checkViaDataDeclsGo dtb__210) mc1) mc2) mc3)))
  | Frontend_dAst.C_Decl_DRecord (dtb__222, dtb__223, dtb__224, dtb__225, dtb__226, dtb__227, dtb__228, dtb__229) -> (if (if (v_reprIsAlias dtb__227) then (B_dData_dBool.v_not ((B_dData_dList.v_memName dtb__222) mc2)) else false) then ((Base_dDiagnostics_dTc.v_tcErr0 (Frontend_dAst.v_nodeRefSpan dtb__229)) Base_dDiagnostics_dTc.C_TcErr_ReprAliasInvalid) else (if dtb__226 then (if (((((v_viaFieldOk dtb__227) dtb__222) mc1) mc2) mc3) then ((((v_checkViaDataDeclsGo dtb__210) mc1) mc2) mc3) else ((Base_dDiagnostics_dTc.v_tcErr0 (Frontend_dAst.v_nodeRefSpan dtb__229)) Base_dDiagnostics_dTc.C_TcErr_DerivingViaUnboxedRequired)) else ((((v_checkViaDataDeclsGo dtb__210) mc1) mc2) mc3)))
  | _ -> ((((v_checkViaDataDeclsGo dtb__210) mc1) mc2) mc3)
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (0))
  | _ -> failwith "DT: impossible branch"
))

# 389 "Vuna/Compiler/Elab/Data.vuna"
let v_checkViaDataDecls = (fun (decls : (Frontend_dAst.t_Decl, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List) (datas : Elab_dTypes.t_DtData B_dData_dList.t_List) -> ((((v_checkViaDataDeclsGo decls) datas) (Elab_dRepresentation.v_unboxedFamilySet datas)) (Elab_dRepresentation.v_unboxedInfoOf datas)))

# 433 "Vuna/Compiler/Elab/Data.vuna"
let v_viaShapeOk = (fun (dname : string) (datas : Elab_dTypes.t_DtData B_dData_dList.t_List) -> ((((v_viaShapeOkWith dname) datas) (Elab_dRepresentation.v_unboxedFamilySet datas)) (Elab_dRepresentation.v_unboxedInfoOf datas)))

# 450 "Vuna/Compiler/Elab/Data.vuna"
let v_elabDatas = (fun (decls : (Frontend_dAst.t_Decl, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List) (records : Elab_dRecords.t_RecordMeta B_dData_dList.t_List) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ec : Elab_dTypes.t_Ec) -> ((Base_dCommon.v_bind ((((v_elabDataHeads decls) globals) ec) B_dData_dList.C_List_Nil)) (fun (p : (Elab_dMeta.t_DataHead B_dData_dList.t_List, ((string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let nd_uscrut5 = p in (match nd_uscrut5 with
  | { B_dData_dPair.f_Pair_first = dtb__230; B_dData_dPair.f_Pair_second = dtb__231 } -> (match dtb__231 with
  | { B_dData_dPair.f_Pair_first = dtb__232; B_dData_dPair.f_Pair_second = dtb__233 } -> ((Base_dCommon.v_bind ((((((v_elabDataBodies decls) dtb__230) dtb__232) dtb__233) B_dData_dList.C_List_Nil) records)) (fun (q : (Elab_dTypes.t_DtData B_dData_dList.t_List, ((string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (match q with
  | { B_dData_dPair.f_Pair_first = dtb__234; B_dData_dPair.f_Pair_second = dtb__235 } -> ((Base_dCommon.v_bind ((v_checkViaDataDecls decls) dtb__234)) (fun (_u : int) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb__234; B_dData_dPair.f_Pair_second = dtb__235 }))))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))))
