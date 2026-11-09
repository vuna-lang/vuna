open Vuna_runtime
let rec v_Vuna_dCompiler_dElab_dData_dkindResultLevel = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TType (dtb__0) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__0))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__1, dtb__2, dtb__3, dtb__4, dtb__5) -> (v_Vuna_dCompiler_dElab_dData_dkindResultLevel dtb__5)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
))

let rec v_Vuna_dCompiler_dElab_dData_dcountSurfacePis = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp (dtb__6, dtb__7, dtb__8) -> (match dtb__6 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__9, dtb__10) -> (if (dtb__9 = "->") then (match dtb__7 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__11, dtb__12) -> (match dtb__12 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__13, dtb__14) -> (match dtb__14 with
  | Base_dList.C_Base_dList_dList_Nil -> (1 + (v_Vuna_dCompiler_dElab_dData_dcountSurfacePis dtb__13))
  | _ -> 0
)
  | _ -> 0
)
  | _ -> 0
) else 0)
  | _ -> 0
)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EPi (dtb__15, dtb__16, dtb__17, dtb__18, dtb__19, dtb__20) -> (1 + (v_Vuna_dCompiler_dElab_dData_dcountSurfacePis dtb__19))
  | _ -> 0
))

let rec v_Vuna_dCompiler_dElab_dData_dcountTelePis = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__21, dtb__22, dtb__23, dtb__24, dtb__25) -> (1 + (v_Vuna_dCompiler_dElab_dData_dcountTelePis dtb__25))
  | _ -> 0
))

let rec v_Vuna_dCompiler_dElab_dData_dctorFieldSortsGo = (fun mc0 mc1 mc2 mc3 mc4 mc5 mc6 mc7 mc8 -> (match mc8 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp (dtb__26, dtb__27, dtb__28) -> (match dtb__26 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__29, dtb__30) -> (if (dtb__29 = "->") then (match dtb__27 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__31, dtb__32) -> (match dtb__32 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__33, dtb__34) -> (match dtb__34 with
  | Base_dList.C_Base_dList_dList_Nil -> (((((((((((v_Vuna_dCompiler_dElab_dData_dctorFieldSortsBinder mc0) mc1) mc2) mc3) mc4) mc5) mc6) mc7) "_") dtb__31) dtb__33)
  | _ -> (Base_dResult.C_Base_dResult_dResult_Ok (mc2))
)
  | _ -> (Base_dResult.C_Base_dResult_dResult_Ok (mc2))
)
  | _ -> (Base_dResult.C_Base_dResult_dResult_Ok (mc2))
) else (Base_dResult.C_Base_dResult_dResult_Ok (mc2)))
  | _ -> (Base_dResult.C_Base_dResult_dResult_Ok (mc2))
)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EPi (dtb__35, dtb__36, dtb__37, dtb__38, dtb__39, dtb__40) -> (((((((((((v_Vuna_dCompiler_dElab_dData_dctorFieldSortsBinder mc0) mc1) mc2) mc3) mc4) mc5) mc6) mc7) dtb__35) dtb__38) dtb__39)
  | _ -> (Base_dResult.C_Base_dResult_dResult_Ok (mc2))
))
and v_Vuna_dCompiler_dElab_dData_dctorFieldSortsBinder = (fun globals ctx ec pos arity famLevel cname csp name dom cod -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dandThen ((((Vuna_dCompiler_dElab_dTerm.v_Vuna_dCompiler_dElab_dTerm_dcheckType globals) ctx) ec) dom)) (fun p -> ((fun nd_uscrut12 -> (match nd_uscrut12 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__41, dtb__42) -> (match dtb__42 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__43, dtb__44) -> ((fun ctx2 -> (if (pos < arity) then (((((((((v_Vuna_dCompiler_dElab_dData_dctorFieldSortsGo globals) ctx2) dtb__44) (pos + 1)) arity) famLevel) cname) csp) cod) else (if (if ((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dlevelLt dtb__43) famLevel) then true else ((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dlevelEq dtb__43) famLevel)) then (((((((((v_Vuna_dCompiler_dElab_dData_dctorFieldSortsGo globals) ctx2) dtb__44) (pos + 1)) arity) famLevel) cname) csp) cod) else ((fun field -> ((fun msg -> ((((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr2 csp) (Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_CtorError ((Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dctorDisplayName cname), msg))) (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dctorDisplayName cname)) msg)) (String.concat "" ["field #"; (bi_strFromInt field); ": its type sorts into Type "; (bi_strFromInt (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dlevelToInt dtb__43)); ", above the family level Type "; (bi_strFromInt (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dlevelToInt famLevel))]))) (pos - arity))))) (((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxBind name) dtb__41) ctx))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) p))))

let v_Vuna_dCompiler_dElab_dData_dcheckCtorFieldSorts = (fun globals ctx ec arity famLevel cname csp tyPis tyExpr -> ((fun surfacePis -> (if (surfacePis <> tyPis) then ((((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr2 csp) (Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_CtorError ((Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dctorDisplayName cname), "cannot verify the universe level of its field types; write the constructor type as a Pi chain"))) cname) "cannot verify the universe level of its field types; write the constructor type as a Pi chain") else (((((((((v_Vuna_dCompiler_dElab_dData_dctorFieldSortsGo globals) ctx) ec) 0) arity) famLevel) cname) csp) tyExpr))) (v_Vuna_dCompiler_dElab_dData_dcountSurfacePis tyExpr)))

let v_Vuna_dCompiler_dElab_dData_delabCtor = (fun globals fam arity famLevel ec c -> (match c with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dCtor_Ctor (dtb__45, dtb__46, dtb__47, dtb__48) -> ((fun famKind -> ((fun tyExpr2 -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dandThen ((((Vuna_dCompiler_dElab_dTerm.v_Vuna_dCompiler_dElab_dTerm_dcheckType globals) Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_demptyCtx) ec) tyExpr2)) (fun pk -> ((fun nd_uscrut13 -> (match nd_uscrut13 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__49, dtb__50) -> (match dtb__50 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__51, dtb__52) -> ((fun tyTerm -> (match (Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dresultSpine (Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_ddropParams tyTerm)) with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__53, dtb__54) -> (if (dtb__53 <> fam) then ((((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr2 dtb__48) (Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_CtorDoesNotReturn ((Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dctorDisplayName dtb__45), fam))) (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dctorDisplayName dtb__45)) fam) else (if ((Base_dList.v_Base_dList_dlength dtb__54) <> arity) then ((((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr2 dtb__48) (Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_CtorWrongIndices ((Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dctorDisplayName dtb__45), fam))) (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dctorDisplayName dtb__45)) fam) else ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dandThen (((((((((v_Vuna_dCompiler_dElab_dData_dcheckCtorFieldSorts globals) Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_demptyCtx) dtb__52) arity) famLevel) dtb__45) dtb__48) (v_Vuna_dCompiler_dElab_dData_dcountTelePis tyTerm)) tyExpr2)) (fun _u -> (Base_dResult.C_Base_dResult_dResult_Ok ((Base_dPair.C_Base_dPair_dPair_Pair ((Vuna_dCompiler_dElab_dTypes.C_Vuna_dCompiler_dElab_dTypes_dDtCtor_DtCtor (dtb__45, fam, (Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dteleOfType tyTerm), tyTerm)), dtb__52))))))))
  | _ -> failwith "DT: impossible branch"
)) (((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dzonkTerm dtb__52) 0) dtb__49))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) pk)))) (if (Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dhasFamParams dtb__46) then dtb__46 else (((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dprependFamParams famKind) dtb__46) dtb__48)))) (match ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dglobalLookup fam) globals) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__55) -> dtb__55
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TType (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dlevelZero))
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dData_delabCtors = (fun mc0 mc1 mc2 mc3 mc4 mc5 -> (match mc5 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__56, dtb__57) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dandThen ((((((v_Vuna_dCompiler_dElab_dData_delabCtor mc0) mc1) mc2) mc3) mc4) dtb__56)) (fun p -> (match p with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__58, dtb__59) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dandThen ((((((v_Vuna_dCompiler_dElab_dData_delabCtors mc0) mc1) mc2) mc3) dtb__59) dtb__57)) (fun q -> (match q with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__60, dtb__61) -> (Base_dResult.C_Base_dResult_dResult_Ok ((Base_dPair.C_Base_dPair_dPair_Pair ((Base_dList.C_Base_dList_dList_Cons (dtb__58, dtb__60)), dtb__61))))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dResult.C_Base_dResult_dResult_Ok ((Base_dPair.C_Base_dPair_dPair_Pair (Base_dList.C_Base_dList_dList_Nil, mc4))))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dData_delabDataHead = (fun globals ec ds -> (match ds with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__62, dtb__63) -> (match dtb__62 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DData (dtb__64, dtb__65, dtb__66, dtb__67, dtb__68, dtb__69, dtb__70, dtb__71) -> (if ((Base_dList.v_Base_dList_dmemName dtb__64) Vuna_dCompiler_dElab_dPrelude.v_Vuna_dCompiler_dElab_dPrelude_dpreludeNames) then (((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr1 dtb__71) (Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_CannotRedefineBuiltin (dtb__64))) dtb__64) else ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dandThen ((((Vuna_dCompiler_dElab_dTerm.v_Vuna_dCompiler_dElab_dTerm_dcheckType globals) Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_demptyCtx) ec) dtb__66)) (fun pk -> ((fun nd_uscrut16 -> (match nd_uscrut16 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__72, dtb__73) -> (match dtb__73 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__74, dtb__75) -> ((fun fullKind -> ((fun tele -> ((fun arity -> (if (Base_dBool.v_Base_dBool_dnot (Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dkindWellFormed fullKind)) then ((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr0 dtb__71) Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_DataKindArrows) else (Base_dResult.C_Base_dResult_dResult_Ok ((Base_dPair.C_Base_dPair_dPair_Pair ((Vuna_dCompiler_dElab_dMeta.C_Vuna_dCompiler_dElab_dMeta_dDataHead_DataHead (dtb__64, fullKind, arity)), (Base_dPair.C_Base_dPair_dPair_Pair ((Base_dList.C_Base_dList_dList_Cons ((Base_dPair.C_Base_dPair_dPair_Pair (dtb__64, fullKind)), Base_dList.C_Base_dList_dList_Nil)), dtb__75)))))))) (Base_dList.v_Base_dList_dlength tele))) (Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dsplitKind fullKind))) ((Vuna_dCompiler_dElab_dPrelude.v_Vuna_dCompiler_dElab_dPrelude_dprependParams dtb__65) (((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dzonkTerm dtb__75) 0) dtb__72)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) pk))))
  | _ -> ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_derrAt dtb__63) "DT: internal: expected a data declaration")
)
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dData_delabDataHeadsRound = (fun mc0 mc1 mc2 mc3 mc4 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__76, dtb__77) -> ((fun nd_uscrut8 -> (match nd_uscrut8 with
  | Base_dResult.C_Base_dResult_dResult_Ok (dtb__78) -> (match dtb__78 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__79, dtb__80) -> (match dtb__80 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__81, dtb__82) -> (((((v_Vuna_dCompiler_dElab_dData_delabDataHeadsRound dtb__77) ((Base_dList.v_Base_dList_dappend mc1) dtb__81)) dtb__82) (Base_dList.C_Base_dList_dList_Cons (dtb__79, mc3))) mc4)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dResult.C_Base_dResult_dResult_Err (dtb__83) -> (((((v_Vuna_dCompiler_dElab_dData_delabDataHeadsRound dtb__77) mc1) mc2) mc3) (Base_dList.C_Base_dList_dList_Cons (dtb__76, mc4)))
  | _ -> failwith "DT: impossible branch"
)) (((v_Vuna_dCompiler_dElab_dData_delabDataHead mc1) mc2) dtb__76))
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dPair.C_Base_dPair_dPair_Pair (mc3, (Base_dPair.C_Base_dPair_dPair_Pair (mc1, (Base_dPair.C_Base_dPair_dPair_Pair (mc2, (Base_dList.v_Base_dList_dreverse mc4)))))))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dData_delabDataHeadsNoProgress = (fun mc0 mc1 mc2 -> (match mc2 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__84, dtb__85) -> (match (((v_Vuna_dCompiler_dElab_dData_delabDataHead mc0) mc1) dtb__84) with
  | Base_dResult.C_Base_dResult_dResult_Err (dtb__86) -> (Base_dResult.C_Base_dResult_dResult_Err (dtb__86))
  | Base_dResult.C_Base_dResult_dResult_Ok (dtb__87) -> (Base_dResult.C_Base_dResult_dResult_Err ("DT: internal: data head registration made no progress"))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dResult.C_Base_dResult_dResult_Err ("DT: internal: no failed data declarations"))
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dData_delabDataHeadsFuel = (fun fuel pending globals ec heads -> (if (fuel <= 0) then (Base_dResult.C_Base_dResult_dResult_Err ("DT: internal: data head registration fuel exhausted")) else (match pending with
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dResult.C_Base_dResult_dResult_Ok ((Base_dPair.C_Base_dPair_dPair_Pair ((Base_dList.v_Base_dList_dreverse heads), (Base_dPair.C_Base_dPair_dPair_Pair (globals, ec))))))
  | _ -> ((fun nd_uscrut5 -> (match nd_uscrut5 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__88, dtb__89) -> (match dtb__89 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__90, dtb__91) -> (match dtb__91 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__92, dtb__93) -> (match dtb__93 with
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dResult.C_Base_dResult_dResult_Ok ((Base_dPair.C_Base_dPair_dPair_Pair ((Base_dList.v_Base_dList_dreverse dtb__88), (Base_dPair.C_Base_dPair_dPair_Pair (dtb__90, dtb__92))))))
  | _ -> (if ((Base_dList.v_Base_dList_dlength dtb__93) = (Base_dList.v_Base_dList_dlength pending)) then (((v_Vuna_dCompiler_dElab_dData_delabDataHeadsNoProgress globals) ec) dtb__93) else (((((v_Vuna_dCompiler_dElab_dData_delabDataHeadsFuel (fuel - 1)) dtb__93) dtb__90) dtb__92) dtb__88))
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) (((((v_Vuna_dCompiler_dElab_dData_delabDataHeadsRound pending) globals) ec) heads) Base_dList.C_Base_dList_dList_Nil))
)))

let v_Vuna_dCompiler_dElab_dData_delabDataHeads = (fun pending globals ec heads -> (((((v_Vuna_dCompiler_dElab_dData_delabDataHeadsFuel 64) pending) globals) ec) heads))

let rec v_Vuna_dCompiler_dElab_dData_dallIn = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__94, dtb__95) -> (if ((Base_dList.v_Base_dList_dmemName dtb__94) mc1) then ((v_Vuna_dCompiler_dElab_dData_dallIn dtb__95) mc1) else false)
  | Base_dList.C_Base_dList_dList_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dData_dsameCtorSet = (fun expected actual -> (if ((Base_dList.v_Base_dList_dlength expected) = (Base_dList.v_Base_dList_dlength actual)) then ((v_Vuna_dCompiler_dElab_dData_dallIn expected) actual) else false))

let rec v_Vuna_dCompiler_dElab_dData_delabDataBodies = (fun decls heads globals ec acc -> (match decls with
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dResult.C_Base_dResult_dResult_Ok ((Base_dPair.C_Base_dPair_dPair_Pair ((Base_dList.v_Base_dList_dreverse acc), (Base_dPair.C_Base_dPair_dPair_Pair (globals, ec))))))
  | Base_dList.C_Base_dList_dList_Cons (dtb__96, dtb__97) -> (match dtb__96 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__98, dtb__99) -> (match dtb__98 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DData (dtb__100, dtb__101, dtb__102, dtb__103, dtb__104, dtb__105, dtb__106, dtb__107) -> ((fun nd_uscrut20 -> (match nd_uscrut20 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__108) -> (match dtb__108 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__109, dtb__110) -> ((fun tele -> ((fun famLevel -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dandThen ((((((v_Vuna_dCompiler_dElab_dData_delabCtors globals) dtb__100) dtb__110) famLevel) ec) dtb__103)) (fun q -> (match q with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__111, dtb__112) -> ((fun viaClasses -> ((fun dd -> (match (Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dcanonicalCtorsFor dtb__100) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__113) -> (if ((v_Vuna_dCompiler_dElab_dData_dsameCtorSet dtb__113) ((Base_dList.v_Base_dList_dmap Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorName) dtb__111)) then (((((v_Vuna_dCompiler_dElab_dData_delabDataBodies dtb__97) heads) ((Base_dList.v_Base_dList_dappend globals) (Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dctorGlobals dtb__111))) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decAddData dtb__112) dd)) (Base_dList.C_Base_dList_dList_Cons (dd, acc))) else (((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr1 dtb__107) (Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_CannotRedefineBuiltin (dtb__100))) dtb__100))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (((((v_Vuna_dCompiler_dElab_dData_delabDataBodies dtb__97) heads) ((Base_dList.v_Base_dList_dappend globals) (Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dctorGlobals dtb__111))) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decAddData dtb__112) dd)) (Base_dList.C_Base_dList_dList_Cons (dd, acc)))
  | _ -> failwith "DT: impossible branch"
)) (Vuna_dCompiler_dElab_dTypes.C_Vuna_dCompiler_dElab_dTypes_dDtData_DtData (dtb__100, tele, dtb__111, dtb__109, viaClasses, dtb__106)))) (if dtb__105 then dtb__104 else Base_dList.C_Base_dList_dList_Nil))
  | _ -> failwith "DT: impossible branch"
)))) (match (v_Vuna_dCompiler_dElab_dData_dkindResultLevel dtb__109) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__114) -> dtb__114
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dlevelZero
  | _ -> failwith "DT: impossible branch"
))) (Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dsplitKind dtb__109))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_derrAt dtb__107) ("DT: internal: missing data head for " ^ dtb__100))
  | _ -> failwith "DT: impossible branch"
)) ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dlookupDataHead dtb__100) heads))
  | _ -> (((((v_Vuna_dCompiler_dElab_dData_delabDataBodies dtb__97) heads) globals) ec) acc)
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dData_dviaShapeOk = (fun dname datas -> (if ((Base_dList.v_Base_dList_dmemName dname) (Vuna_dCompiler_dElab_dRepresentation.v_Vuna_dCompiler_dElab_dRepresentation_dunboxedFamilySet datas)) then ((fun nd_uscrut2 -> (match nd_uscrut2 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> false
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__115) -> (match dtb__115 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__116, dtb__117) -> (match ((Vuna_dCompiler_dElab_dRepresentation.v_Vuna_dCompiler_dElab_dRepresentation_dfindDtData dname) datas) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__118) -> (dtb__117 = (Base_dList.v_Base_dList_dlength (match dtb__118 with
  | Vuna_dCompiler_dElab_dTypes.C_Vuna_dCompiler_dElab_dTypes_dDtData_DtData (dtb__119, dtb__120, dtb__121, dtb__122, dtb__123, dtb__124) -> dtb__120
  | _ -> failwith "DT: impossible branch"
)))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) ((Vuna_dCompiler_dElab_dRepresentation.v_Vuna_dCompiler_dElab_dRepresentation_dlookupUnboxedInfo dname) (Vuna_dCompiler_dElab_dRepresentation.v_Vuna_dCompiler_dElab_dRepresentation_dunboxedInfoOf datas))) else false))

let rec v_Vuna_dCompiler_dElab_dData_dcheckViaDataDecls = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__125, dtb__126) -> (match dtb__125 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__127, dtb__128) -> (match dtb__127 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DData (dtb__129, dtb__130, dtb__131, dtb__132, dtb__133, dtb__134, dtb__135, dtb__136) -> (if dtb__134 then (if ((v_Vuna_dCompiler_dElab_dData_dviaShapeOk dtb__129) mc1) then ((v_Vuna_dCompiler_dElab_dData_dcheckViaDataDecls dtb__126) mc1) else ((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr0 dtb__136) Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_DerivingViaUnboxedRequired)) else ((v_Vuna_dCompiler_dElab_dData_dcheckViaDataDecls dtb__126) mc1))
  | _ -> ((v_Vuna_dCompiler_dElab_dData_dcheckViaDataDecls dtb__126) mc1)
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dResult.C_Base_dResult_dResult_Ok (0))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dData_delabDatas = (fun decls globals ec -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dandThen ((((v_Vuna_dCompiler_dElab_dData_delabDataHeads decls) globals) ec) Base_dList.C_Base_dList_dList_Nil)) (fun p -> ((fun nd_uscrut4 -> (match nd_uscrut4 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__137, dtb__138) -> (match dtb__138 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__139, dtb__140) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dandThen (((((v_Vuna_dCompiler_dElab_dData_delabDataBodies decls) dtb__137) dtb__139) dtb__140) Base_dList.C_Base_dList_dList_Nil)) (fun q -> (match q with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__141, dtb__142) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dandThen ((v_Vuna_dCompiler_dElab_dData_dcheckViaDataDecls decls) dtb__141)) (fun _u -> (Base_dResult.C_Base_dResult_dResult_Ok ((Base_dPair.C_Base_dPair_dPair_Pair (dtb__141, dtb__142))))))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) p))))

let rec v_Vuna_dCompiler_dElab_dData_dctorFieldGo = (fun mc0 mc1 mc2 -> (match mc1 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__143, dtb__144, dtb__145, dtb__146, dtb__147) -> (if (mc0 > 0) then (((v_Vuna_dCompiler_dElab_dData_dctorFieldGo (mc0 - 1)) dtb__147) mc2) else (((v_Vuna_dCompiler_dElab_dData_dctorFieldGo 0) dtb__147) (Base_dList.C_Base_dList_dList_Cons (dtb__146, mc2))))
  | _ -> (Base_dList.v_Base_dList_dreverse mc2)
))

let v_Vuna_dCompiler_dElab_dData_dctorFieldTerms = (fun arity ty -> (((v_Vuna_dCompiler_dElab_dData_dctorFieldGo arity) ty) Base_dList.C_Base_dList_dList_Nil))

let rec v_Vuna_dCompiler_dElab_dData_dtermUsesVar = (fun mc0 mc1 -> (match mc1 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TIf (dtb__148, dtb__149, dtb__150) -> (if (if ((v_Vuna_dCompiler_dElab_dData_dtermUsesVar mc0) dtb__148) then true else ((v_Vuna_dCompiler_dElab_dData_dtermUsesVar mc0) dtb__149)) then true else ((v_Vuna_dCompiler_dElab_dData_dtermUsesVar mc0) dtb__150))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TBool (dtb__151) -> false
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TFloat (dtb__152) -> false
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TStr (dtb__153) -> false
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TInt (dtb__154) -> false
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCase (dtb__155, dtb__156) -> (if ((v_Vuna_dCompiler_dElab_dData_dtermUsesVar mc0) dtb__155) then true else ((v_Vuna_dCompiler_dElab_dData_dtermUsesVarAlts mc0) dtb__156))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCon (dtb__157, dtb__158) -> ((v_Vuna_dCompiler_dElab_dData_dtermUsesVarArgs mc0) dtb__158)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (dtb__159, dtb__160, dtb__161) -> (if ((v_Vuna_dCompiler_dElab_dData_dtermUsesVar mc0) dtb__159) then true else ((v_Vuna_dCompiler_dElab_dData_dtermUsesVar mc0) dtb__160))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam (dtb__162, dtb__163, dtb__164) -> ((v_Vuna_dCompiler_dElab_dData_dtermUsesVar (mc0 + 1)) dtb__164)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__165, dtb__166, dtb__167, dtb__168, dtb__169) -> (if ((v_Vuna_dCompiler_dElab_dData_dtermUsesVar mc0) dtb__168) then true else ((v_Vuna_dCompiler_dElab_dData_dtermUsesVar (mc0 + 1)) dtb__169))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TType (dtb__170) -> false
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (dtb__171) -> false
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TMeta (dtb__172) -> false
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TVar (dtb__173, dtb__174) -> (dtb__174 = mc0)
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dElab_dData_dtermUsesVarArgs = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__175, dtb__176) -> (match dtb__175 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__177, dtb__178) -> (if ((v_Vuna_dCompiler_dElab_dData_dtermUsesVar mc0) dtb__177) then true else ((v_Vuna_dCompiler_dElab_dData_dtermUsesVarArgs mc0) dtb__176))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dElab_dData_dtermUsesVarAlts = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__179, dtb__180) -> (if ((v_Vuna_dCompiler_dElab_dData_dtermUsesVar (mc0 + (Base_dList.v_Base_dList_dlength (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dcaseAltBinders dtb__179)))) (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dcaseAltBody dtb__179)) then true else ((v_Vuna_dCompiler_dElab_dData_dtermUsesVarAlts mc0) dtb__180))
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dData_dusedInTeleGo = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__181, dtb__182) -> (if ((v_Vuna_dCompiler_dElab_dData_dtermUsesVar mc0) dtb__181) then true else ((v_Vuna_dCompiler_dElab_dData_dusedInTeleGo mc0) dtb__182))
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dData_dusedInTele = (fun i arity k ts -> ((v_Vuna_dCompiler_dElab_dData_dusedInTeleGo (k + arity)) ts))

let v_Vuna_dCompiler_dElab_dData_dusedInCtor = (fun i arity c -> ((((v_Vuna_dCompiler_dElab_dData_dusedInTele i) arity) 0) ((v_Vuna_dCompiler_dElab_dData_dctorFieldTerms arity) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorType c))))

let rec v_Vuna_dCompiler_dElab_dData_dusedInCtors = (fun mc0 mc1 mc2 -> (match mc2 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__183, dtb__184) -> (if (((v_Vuna_dCompiler_dElab_dData_dusedInCtor mc0) mc1) dtb__183) then true else (((v_Vuna_dCompiler_dElab_dData_dusedInCtors mc0) mc1) dtb__184))
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dData_dparamUsedInFieldTys = (fun dd i -> (((v_Vuna_dCompiler_dElab_dData_dusedInCtors i) (Base_dList.v_Base_dList_dlength (match dd with
  | Vuna_dCompiler_dElab_dTypes.C_Vuna_dCompiler_dElab_dTypes_dDtData_DtData (dtb__185, dtb__186, dtb__187, dtb__188, dtb__189, dtb__190) -> dtb__186
  | _ -> failwith "DT: impossible branch"
))) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataCtors dd)))

let rec v_Vuna_dCompiler_dElab_dData_deraseMaskGo = (fun mc0 mc1 mc2 mc3 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__191, dtb__192) -> ((((v_Vuna_dCompiler_dElab_dData_deraseMaskGo mc0) dtb__192) (mc2 + 1)) (Base_dList.C_Base_dList_dList_Cons ((Base_dBool.v_Base_dBool_dnot ((v_Vuna_dCompiler_dElab_dData_dparamUsedInFieldTys mc0) mc2)), mc3)))
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dList.v_Base_dList_dreverse mc3)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dData_deraseIndexMask = (fun dd -> ((((v_Vuna_dCompiler_dElab_dData_deraseMaskGo dd) (match dd with
  | Vuna_dCompiler_dElab_dTypes.C_Vuna_dCompiler_dElab_dTypes_dDtData_DtData (dtb__193, dtb__194, dtb__195, dtb__196, dtb__197, dtb__198) -> dtb__194
  | _ -> failwith "DT: impossible branch"
)) 0) Base_dList.C_Base_dList_dList_Nil))

let rec v_Vuna_dCompiler_dElab_dData_dcandidateNames = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__199, dtb__200) -> (match dtb__199 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__201, dtb__202) -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__203, dtb__204) -> (if dtb__203 then (Base_dList.C_Base_dList_dList_Cons (dtb__201, ((v_Vuna_dCompiler_dElab_dData_dcandidateNames dtb__200) dtb__204))) else ((v_Vuna_dCompiler_dElab_dData_dcandidateNames dtb__200) dtb__204))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dData_dcandidateOf = (fun d -> (Base_dPair.C_Base_dPair_dPair_Pair ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataName d), ((v_Vuna_dCompiler_dElab_dData_dcandidateNames (match d with
  | Vuna_dCompiler_dElab_dTypes.C_Vuna_dCompiler_dElab_dTypes_dDtData_DtData (dtb__205, dtb__206, dtb__207, dtb__208, dtb__209, dtb__210) -> dtb__206
  | _ -> failwith "DT: impossible branch"
)) (v_Vuna_dCompiler_dElab_dData_deraseIndexMask d)))))

let rec v_Vuna_dCompiler_dElab_dData_dindexErasureCandidates = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__211, dtb__212) -> (Base_dList.C_Base_dList_dList_Cons ((v_Vuna_dCompiler_dElab_dData_dcandidateOf dtb__211), (v_Vuna_dCompiler_dElab_dData_dindexErasureCandidates dtb__212)))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))
