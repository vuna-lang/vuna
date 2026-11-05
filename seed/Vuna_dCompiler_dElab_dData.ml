open Vuna_runtime
let rec v_Vuna_dCompiler_dElab_dData_dkindResultLevel = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTType (dtb__0) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__0))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTPi (dtb__1, dtb__2, dtb__3, dtb__4, dtb__5) -> (v_Vuna_dCompiler_dElab_dData_dkindResultLevel dtb__5)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
))

let rec v_Vuna_dCompiler_dElab_dData_dcountSurfacePis = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEApp (dtb__6, dtb__7, dtb__8) -> (match dtb__6 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (dtb__9, dtb__10) -> (if (dtb__9 = "->") then (match dtb__7 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__11, dtb__12) -> (match dtb__12 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__13, dtb__14) -> (match dtb__14 with
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (1 + (v_Vuna_dCompiler_dElab_dData_dcountSurfacePis dtb__13))
  | _ -> 0
)
  | _ -> 0
)
  | _ -> 0
) else 0)
  | _ -> 0
)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEPi (dtb__15, dtb__16, dtb__17, dtb__18, dtb__19) -> (1 + (v_Vuna_dCompiler_dElab_dData_dcountSurfacePis dtb__18))
  | _ -> 0
))

let rec v_Vuna_dCompiler_dElab_dData_dcountTelePis = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTPi (dtb__20, dtb__21, dtb__22, dtb__23, dtb__24) -> (1 + (v_Vuna_dCompiler_dElab_dData_dcountTelePis dtb__24))
  | _ -> 0
))

let rec v_Vuna_dCompiler_dElab_dData_dctorFieldSortsGo = (fun mc0 mc1 mc2 mc3 mc4 mc5 mc6 mc7 mc8 -> (match mc8 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEApp (dtb__25, dtb__26, dtb__27) -> (match dtb__25 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (dtb__28, dtb__29) -> (if (dtb__28 = "->") then (match dtb__26 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__30, dtb__31) -> (match dtb__31 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__32, dtb__33) -> (match dtb__33 with
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (((((((((((v_Vuna_dCompiler_dElab_dData_dctorFieldSortsBinder mc0) mc1) mc2) mc3) mc4) mc5) mc6) mc7) "_") dtb__30) dtb__32)
  | _ -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk (mc2))
)
  | _ -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk (mc2))
)
  | _ -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk (mc2))
) else (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk (mc2)))
  | _ -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk (mc2))
)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEPi (dtb__34, dtb__35, dtb__36, dtb__37, dtb__38) -> (((((((((((v_Vuna_dCompiler_dElab_dData_dctorFieldSortsBinder mc0) mc1) mc2) mc3) mc4) mc5) mc6) mc7) dtb__34) dtb__36) dtb__37)
  | _ -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk (mc2))
))
and v_Vuna_dCompiler_dElab_dData_dctorFieldSortsBinder = (fun globals ctx ec pos arity famLevel cname csp name dom cod -> ((Base_dResult.v_Base_dResult_dandThen ((((Vuna_dCompiler_dElab_dTerm.v_Vuna_dCompiler_dElab_dTerm_dcheckType globals) ctx) ec) dom)) (fun p -> ((fun nd_uscrut12 -> (match nd_uscrut12 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__39, dtb__40) -> (match dtb__40 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__41, dtb__42) -> ((fun ctx2 -> (if (pos < arity) then (((((((((v_Vuna_dCompiler_dElab_dData_dctorFieldSortsGo globals) ctx2) dtb__42) (pos + 1)) arity) famLevel) cname) csp) cod) else (if (if ((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dlevelLt dtb__41) famLevel) then true else ((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dlevelEq dtb__41) famLevel)) then (((((((((v_Vuna_dCompiler_dElab_dData_dctorFieldSortsGo globals) ctx2) dtb__42) (pos + 1)) arity) famLevel) cname) csp) cod) else ((fun field -> ((fun msg -> ((((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr2 csp) (Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_Vuna_dCompiler_dDiagnostics_dTc_dCtorError (cname, msg))) cname) msg)) (String.concat "" ["field #"; (bi_strFromInt field); ": its type sorts into Type "; (bi_strFromInt (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dlevelToInt dtb__41)); ", above the family level Type "; (bi_strFromInt (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dlevelToInt famLevel))]))) (pos - arity))))) (((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxBind name) dtb__39) ctx))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) p))))

let v_Vuna_dCompiler_dElab_dData_dcheckCtorFieldSorts = (fun globals ctx ec arity famLevel cname csp tyPis tyExpr -> ((fun surfacePis -> (if (surfacePis <> tyPis) then ((((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr2 csp) (Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_Vuna_dCompiler_dDiagnostics_dTc_dCtorError (cname, "cannot verify the universe level of its field types; write the constructor type as a Pi chain"))) cname) "cannot verify the universe level of its field types; write the constructor type as a Pi chain") else (((((((((v_Vuna_dCompiler_dElab_dData_dctorFieldSortsGo globals) ctx) ec) 0) arity) famLevel) cname) csp) tyExpr))) (v_Vuna_dCompiler_dElab_dData_dcountSurfacePis tyExpr)))

let v_Vuna_dCompiler_dElab_dData_delabCtor = (fun globals fam arity famLevel ec c -> (match c with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dCtor_Vuna_dCompiler_dFrontend_dAst_dCtor (dtb__43, dtb__44, dtb__45, dtb__46) -> ((fun famKind -> ((fun tyExpr2 -> ((Base_dResult.v_Base_dResult_dandThen ((((Vuna_dCompiler_dElab_dTerm.v_Vuna_dCompiler_dElab_dTerm_dcheckType globals) Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_demptyCtx) ec) tyExpr2)) (fun pk -> ((fun nd_uscrut13 -> (match nd_uscrut13 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__47, dtb__48) -> (match dtb__48 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__49, dtb__50) -> ((fun tyTerm -> (match (Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dresultSpine (Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_ddropParams tyTerm)) with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__51, dtb__52) -> (if (dtb__51 <> fam) then ((((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr2 dtb__46) (Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_Vuna_dCompiler_dDiagnostics_dTc_dCtorDoesNotReturn (dtb__43, fam))) dtb__43) fam) else (if ((Base_dList.v_Base_dList_dlength dtb__52) <> arity) then ((((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr2 dtb__46) (Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_Vuna_dCompiler_dDiagnostics_dTc_dCtorWrongIndices (dtb__43, fam))) dtb__43) fam) else ((Base_dResult.v_Base_dResult_dandThen (((((((((v_Vuna_dCompiler_dElab_dData_dcheckCtorFieldSorts globals) Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_demptyCtx) dtb__50) arity) famLevel) dtb__43) dtb__46) (v_Vuna_dCompiler_dElab_dData_dcountTelePis tyTerm)) tyExpr2)) (fun _u -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ((Vuna_dCompiler_dElab_dTypes.C_Vuna_dCompiler_dElab_dTypes_dDtCtor_Vuna_dCompiler_dElab_dTypes_dDtCtor (dtb__43, fam, (Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dteleOfType tyTerm), tyTerm)), dtb__50))))))))
  | _ -> failwith "DT: impossible branch"
)) (((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dzonkTerm dtb__50) 0) dtb__47))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) pk)))) (if (Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dhasFamParams dtb__44) then dtb__44 else (((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dprependFamParams famKind) dtb__44) dtb__46)))) (match ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dglobalLookup fam) globals) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__53) -> dtb__53
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTType (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dlevelZero))
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dData_delabCtors = (fun mc0 mc1 mc2 mc3 mc4 mc5 -> (match mc5 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__54, dtb__55) -> ((Base_dResult.v_Base_dResult_dandThen ((((((v_Vuna_dCompiler_dElab_dData_delabCtor mc0) mc1) mc2) mc3) mc4) dtb__54)) (fun p -> (match p with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__56, dtb__57) -> ((Base_dResult.v_Base_dResult_dandThen ((((((v_Vuna_dCompiler_dElab_dData_delabCtors mc0) mc1) mc2) mc3) dtb__57) dtb__55)) (fun q -> (match q with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__58, dtb__59) -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ((Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__56, dtb__58)), dtb__59))))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (Base_dList.C_Base_dList_dList_Base_dList_dNil, mc4))))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dData_delabDataHead = (fun globals ec ds -> (match ds with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__60, dtb__61) -> (match dtb__60 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDData (dtb__62, dtb__63, dtb__64, dtb__65, dtb__66, dtb__67) -> (if ((Base_dList.v_Base_dList_dmemName dtb__62) Vuna_dCompiler_dElab_dPrelude.v_Vuna_dCompiler_dElab_dPrelude_dpreludeNames) then (((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr1 dtb__67) (Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_Vuna_dCompiler_dDiagnostics_dTc_dCannotRedefineBuiltin (dtb__62))) dtb__62) else ((Base_dResult.v_Base_dResult_dandThen ((((Vuna_dCompiler_dElab_dTerm.v_Vuna_dCompiler_dElab_dTerm_dcheckType globals) Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_demptyCtx) ec) dtb__64)) (fun pk -> ((fun nd_uscrut14 -> (match nd_uscrut14 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__68, dtb__69) -> (match dtb__69 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__70, dtb__71) -> ((fun fullKind -> ((fun tele -> ((fun arity -> (if (Base_dBool.v_Base_dBool_dnot (Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dkindWellFormed fullKind)) then ((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr0 dtb__67) Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_Vuna_dCompiler_dDiagnostics_dTc_dDataKindArrows) else (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ((Vuna_dCompiler_dElab_dMeta.C_Vuna_dCompiler_dElab_dMeta_dDataHead_Vuna_dCompiler_dElab_dMeta_dDataHead (dtb__62, fullKind, arity)), (Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ((Base_dList.C_Base_dList_dList_Base_dList_dCons ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__62, fullKind)), Base_dList.C_Base_dList_dList_Base_dList_dNil)), dtb__71)))))))) (Base_dList.v_Base_dList_dlength tele))) (Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dsplitKind fullKind))) ((Vuna_dCompiler_dElab_dPrelude.v_Vuna_dCompiler_dElab_dPrelude_dprependParams dtb__63) (((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dzonkTerm dtb__71) 0) dtb__68)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) pk))))
  | _ -> ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_derrAt dtb__61) "DT: internal: expected a data declaration")
)
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dData_delabDataHeadsRound = (fun mc0 mc1 mc2 mc3 mc4 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__72, dtb__73) -> ((fun nd_uscrut8 -> (match nd_uscrut8 with
  | Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk (dtb__74) -> (match dtb__74 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__75, dtb__76) -> (match dtb__76 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__77, dtb__78) -> (((((v_Vuna_dCompiler_dElab_dData_delabDataHeadsRound dtb__73) ((Base_dList.v_Base_dList_dappend mc1) dtb__77)) dtb__78) (Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__75, mc3))) mc4)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr (dtb__79) -> (((((v_Vuna_dCompiler_dElab_dData_delabDataHeadsRound dtb__73) mc1) mc2) mc3) (Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__72, mc4)))
  | _ -> failwith "DT: impossible branch"
)) (((v_Vuna_dCompiler_dElab_dData_delabDataHead mc1) mc2) dtb__72))
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (mc3, (Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (mc1, (Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (mc2, (Base_dList.v_Base_dList_dreverse mc4)))))))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dData_delabDataHeadsNoProgress = (fun mc0 mc1 mc2 -> (match mc2 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__80, dtb__81) -> (match (((v_Vuna_dCompiler_dElab_dData_delabDataHead mc0) mc1) dtb__80) with
  | Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr (dtb__82) -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr (dtb__82))
  | Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk (dtb__83) -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: data head registration made no progress"))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: no failed data declarations"))
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dData_delabDataHeadsFuel = (fun fuel pending globals ec heads -> (if (fuel <= 0) then (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: data head registration fuel exhausted")) else (match pending with
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ((Base_dList.v_Base_dList_dreverse heads), (Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (globals, ec))))))
  | _ -> ((fun nd_uscrut5 -> (match nd_uscrut5 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__84, dtb__85) -> (match dtb__85 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__86, dtb__87) -> (match dtb__87 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__88, dtb__89) -> (match dtb__89 with
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ((Base_dList.v_Base_dList_dreverse dtb__84), (Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__86, dtb__88))))))
  | _ -> (if ((Base_dList.v_Base_dList_dlength dtb__89) = (Base_dList.v_Base_dList_dlength pending)) then (((v_Vuna_dCompiler_dElab_dData_delabDataHeadsNoProgress globals) ec) dtb__89) else (((((v_Vuna_dCompiler_dElab_dData_delabDataHeadsFuel (fuel - 1)) dtb__89) dtb__86) dtb__88) dtb__84))
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) (((((v_Vuna_dCompiler_dElab_dData_delabDataHeadsRound pending) globals) ec) heads) Base_dList.C_Base_dList_dList_Base_dList_dNil))
)))

let v_Vuna_dCompiler_dElab_dData_delabDataHeads = (fun pending globals ec heads -> (((((v_Vuna_dCompiler_dElab_dData_delabDataHeadsFuel 64) pending) globals) ec) heads))

let rec v_Vuna_dCompiler_dElab_dData_dallIn = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__90, dtb__91) -> (if ((Base_dList.v_Base_dList_dmemName dtb__90) mc1) then ((v_Vuna_dCompiler_dElab_dData_dallIn dtb__91) mc1) else false)
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> true
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dData_dsameCtorSet = (fun expected actual -> (if ((Base_dList.v_Base_dList_dlength expected) = (Base_dList.v_Base_dList_dlength actual)) then ((v_Vuna_dCompiler_dElab_dData_dallIn expected) actual) else false))

let rec v_Vuna_dCompiler_dElab_dData_delabDataBodies = (fun decls heads globals ec acc -> (match decls with
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ((Base_dList.v_Base_dList_dreverse acc), (Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (globals, ec))))))
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__92, dtb__93) -> (match dtb__92 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__94, dtb__95) -> (match dtb__94 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDData (dtb__96, dtb__97, dtb__98, dtb__99, dtb__100, dtb__101) -> ((fun nd_uscrut18 -> (match nd_uscrut18 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__102) -> (match dtb__102 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__103, dtb__104) -> ((fun tele -> ((fun famLevel -> ((Base_dResult.v_Base_dResult_dandThen ((((((v_Vuna_dCompiler_dElab_dData_delabCtors globals) dtb__96) dtb__104) famLevel) ec) dtb__99)) (fun q -> (match q with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__105, dtb__106) -> ((fun dd -> (match (Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dcanonicalCtorsFor dtb__96) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__107) -> (if ((v_Vuna_dCompiler_dElab_dData_dsameCtorSet dtb__107) ((Base_dList.v_Base_dList_dmap Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorName) dtb__105)) then (((((v_Vuna_dCompiler_dElab_dData_delabDataBodies dtb__93) heads) ((Base_dList.v_Base_dList_dappend globals) (Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dctorGlobals dtb__105))) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decAddData dtb__106) dd)) (Base_dList.C_Base_dList_dList_Base_dList_dCons (dd, acc))) else (((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr1 dtb__101) (Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_Vuna_dCompiler_dDiagnostics_dTc_dCannotRedefineBuiltin (dtb__96))) dtb__96))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (((((v_Vuna_dCompiler_dElab_dData_delabDataBodies dtb__93) heads) ((Base_dList.v_Base_dList_dappend globals) (Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dctorGlobals dtb__105))) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decAddData dtb__106) dd)) (Base_dList.C_Base_dList_dList_Base_dList_dCons (dd, acc)))
  | _ -> failwith "DT: impossible branch"
)) (Vuna_dCompiler_dElab_dTypes.C_Vuna_dCompiler_dElab_dTypes_dDtData_Vuna_dCompiler_dElab_dTypes_dDtData (dtb__96, tele, dtb__105, dtb__103)))
  | _ -> failwith "DT: impossible branch"
)))) (match (v_Vuna_dCompiler_dElab_dData_dkindResultLevel dtb__103) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__108) -> dtb__108
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dlevelZero
  | _ -> failwith "DT: impossible branch"
))) (Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dsplitKind dtb__103))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_derrAt dtb__101) ("DT: internal: missing data head for " ^ dtb__96))
  | _ -> failwith "DT: impossible branch"
)) ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dlookupDataHead dtb__96) heads))
  | _ -> (((((v_Vuna_dCompiler_dElab_dData_delabDataBodies dtb__93) heads) globals) ec) acc)
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dData_delabDatas = (fun decls globals ec -> ((Base_dResult.v_Base_dResult_dandThen ((((v_Vuna_dCompiler_dElab_dData_delabDataHeads decls) globals) ec) Base_dList.C_Base_dList_dList_Base_dList_dNil)) (fun p -> ((fun nd_uscrut4 -> (match nd_uscrut4 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__109, dtb__110) -> (match dtb__110 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__111, dtb__112) -> (((((v_Vuna_dCompiler_dElab_dData_delabDataBodies decls) dtb__109) dtb__111) dtb__112) Base_dList.C_Base_dList_dList_Base_dList_dNil)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) p))))

let rec v_Vuna_dCompiler_dElab_dData_dctorFieldGo = (fun mc0 mc1 mc2 -> (match mc1 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTPi (dtb__113, dtb__114, dtb__115, dtb__116, dtb__117) -> (if (mc0 > 0) then (((v_Vuna_dCompiler_dElab_dData_dctorFieldGo (mc0 - 1)) dtb__117) mc2) else (((v_Vuna_dCompiler_dElab_dData_dctorFieldGo 0) dtb__117) (Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__116, mc2))))
  | _ -> (Base_dList.v_Base_dList_dreverse mc2)
))

let v_Vuna_dCompiler_dElab_dData_dctorFieldTerms = (fun arity ty -> (((v_Vuna_dCompiler_dElab_dData_dctorFieldGo arity) ty) Base_dList.C_Base_dList_dList_Base_dList_dNil))

let rec v_Vuna_dCompiler_dElab_dData_dtermUsesVar = (fun mc0 mc1 -> (match mc1 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTIf (dtb__118, dtb__119, dtb__120) -> (if (if ((v_Vuna_dCompiler_dElab_dData_dtermUsesVar mc0) dtb__118) then true else ((v_Vuna_dCompiler_dElab_dData_dtermUsesVar mc0) dtb__119)) then true else ((v_Vuna_dCompiler_dElab_dData_dtermUsesVar mc0) dtb__120))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTBool (dtb__121) -> false
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTStr (dtb__122) -> false
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTInt (dtb__123) -> false
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCase (dtb__124, dtb__125) -> (if ((v_Vuna_dCompiler_dElab_dData_dtermUsesVar mc0) dtb__124) then true else ((v_Vuna_dCompiler_dElab_dData_dtermUsesVarAlts mc0) dtb__125))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCon (dtb__126, dtb__127) -> ((v_Vuna_dCompiler_dElab_dData_dtermUsesVarArgs mc0) dtb__127)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp (dtb__128, dtb__129, dtb__130) -> (if ((v_Vuna_dCompiler_dElab_dData_dtermUsesVar mc0) dtb__128) then true else ((v_Vuna_dCompiler_dElab_dData_dtermUsesVar mc0) dtb__129))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTLam (dtb__131, dtb__132, dtb__133) -> ((v_Vuna_dCompiler_dElab_dData_dtermUsesVar (mc0 + 1)) dtb__133)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTPi (dtb__134, dtb__135, dtb__136, dtb__137, dtb__138) -> (if ((v_Vuna_dCompiler_dElab_dData_dtermUsesVar mc0) dtb__137) then true else ((v_Vuna_dCompiler_dElab_dData_dtermUsesVar (mc0 + 1)) dtb__138))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTType (dtb__139) -> false
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTGlobal (dtb__140) -> false
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTMeta (dtb__141) -> false
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTVar (dtb__142, dtb__143) -> (dtb__143 = mc0)
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dElab_dData_dtermUsesVarArgs = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__144, dtb__145) -> (match dtb__144 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__146, dtb__147) -> (if ((v_Vuna_dCompiler_dElab_dData_dtermUsesVar mc0) dtb__146) then true else ((v_Vuna_dCompiler_dElab_dData_dtermUsesVarArgs mc0) dtb__145))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> false
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dElab_dData_dtermUsesVarAlts = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__148, dtb__149) -> (if ((v_Vuna_dCompiler_dElab_dData_dtermUsesVar (mc0 + (Base_dList.v_Base_dList_dlength (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dcaseAltBinders dtb__148)))) (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dcaseAltBody dtb__148)) then true else ((v_Vuna_dCompiler_dElab_dData_dtermUsesVarAlts mc0) dtb__149))
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> false
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dData_dusedInTeleGo = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__150, dtb__151) -> (if ((v_Vuna_dCompiler_dElab_dData_dtermUsesVar mc0) dtb__150) then true else ((v_Vuna_dCompiler_dElab_dData_dusedInTeleGo mc0) dtb__151))
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> false
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dData_dusedInTele = (fun i arity k ts -> ((v_Vuna_dCompiler_dElab_dData_dusedInTeleGo (k + arity)) ts))

let v_Vuna_dCompiler_dElab_dData_dusedInCtor = (fun i arity c -> ((((v_Vuna_dCompiler_dElab_dData_dusedInTele i) arity) 0) ((v_Vuna_dCompiler_dElab_dData_dctorFieldTerms arity) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorType c))))

let rec v_Vuna_dCompiler_dElab_dData_dusedInCtors = (fun mc0 mc1 mc2 -> (match mc2 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__152, dtb__153) -> (if (((v_Vuna_dCompiler_dElab_dData_dusedInCtor mc0) mc1) dtb__152) then true else (((v_Vuna_dCompiler_dElab_dData_dusedInCtors mc0) mc1) dtb__153))
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> false
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dData_dparamUsedInFieldTys = (fun dd i -> (((v_Vuna_dCompiler_dElab_dData_dusedInCtors i) (Base_dList.v_Base_dList_dlength (match dd with
  | Vuna_dCompiler_dElab_dTypes.C_Vuna_dCompiler_dElab_dTypes_dDtData_Vuna_dCompiler_dElab_dTypes_dDtData (dtb__154, dtb__155, dtb__156, dtb__157) -> dtb__155
  | _ -> failwith "DT: impossible branch"
))) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataCtors dd)))

let rec v_Vuna_dCompiler_dElab_dData_deraseMaskGo = (fun mc0 mc1 mc2 mc3 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__158, dtb__159) -> ((((v_Vuna_dCompiler_dElab_dData_deraseMaskGo mc0) dtb__159) (mc2 + 1)) (Base_dList.C_Base_dList_dList_Base_dList_dCons ((Base_dBool.v_Base_dBool_dnot ((v_Vuna_dCompiler_dElab_dData_dparamUsedInFieldTys mc0) mc2)), mc3)))
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (Base_dList.v_Base_dList_dreverse mc3)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dData_deraseIndexMask = (fun dd -> ((((v_Vuna_dCompiler_dElab_dData_deraseMaskGo dd) (match dd with
  | Vuna_dCompiler_dElab_dTypes.C_Vuna_dCompiler_dElab_dTypes_dDtData_Vuna_dCompiler_dElab_dTypes_dDtData (dtb__160, dtb__161, dtb__162, dtb__163) -> dtb__161
  | _ -> failwith "DT: impossible branch"
)) 0) Base_dList.C_Base_dList_dList_Base_dList_dNil))

let rec v_Vuna_dCompiler_dElab_dData_dcandidateNames = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__164, dtb__165) -> (match dtb__164 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__166, dtb__167) -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__168, dtb__169) -> (if dtb__168 then (Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__166, ((v_Vuna_dCompiler_dElab_dData_dcandidateNames dtb__165) dtb__169))) else ((v_Vuna_dCompiler_dElab_dData_dcandidateNames dtb__165) dtb__169))
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> Base_dList.C_Base_dList_dList_Base_dList_dNil
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> Base_dList.C_Base_dList_dList_Base_dList_dNil
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dData_dcandidateOf = (fun d -> (Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataName d), ((v_Vuna_dCompiler_dElab_dData_dcandidateNames (match d with
  | Vuna_dCompiler_dElab_dTypes.C_Vuna_dCompiler_dElab_dTypes_dDtData_Vuna_dCompiler_dElab_dTypes_dDtData (dtb__170, dtb__171, dtb__172, dtb__173) -> dtb__171
  | _ -> failwith "DT: impossible branch"
)) (v_Vuna_dCompiler_dElab_dData_deraseIndexMask d)))))

let rec v_Vuna_dCompiler_dElab_dData_dindexErasureCandidates = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__174, dtb__175) -> (Base_dList.C_Base_dList_dList_Base_dList_dCons ((v_Vuna_dCompiler_dElab_dData_dcandidateOf dtb__174), (v_Vuna_dCompiler_dElab_dData_dindexErasureCandidates dtb__175)))
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> Base_dList.C_Base_dList_dList_Base_dList_dNil
  | _ -> failwith "DT: impossible branch"
))
