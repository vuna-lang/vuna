open Vuna_runtime
open Base_dPair
open Base_dBool
open Base_dMonad
open Base_dMaybe
open Base_dEq
open Base_dList
open Base_dResult
open Base_dString
open Base_dShow
open Base_dOrd
open Prelude
open Vuna_dCompiler_dCommon
open Vuna_dCompiler_dFrontend_dToml
open Vuna_dCompiler_dFrontend_dManifest
open Vuna_dCompiler_dPackages_dPkg
open Vuna_dCompiler_dDebug
open Base_dNat
open Base_dVec
open Vuna_dCompiler_dDiagnostics_dCommon
open Vuna_dCompiler_dDiagnostics_dCg
open Vuna_dCompiler_dDiagnostics_dTc
open Vuna_dCompiler_dDiagnostics
open Vuna_dCompiler_dFrontend_dAst
open Vuna_dCompiler_dFrontend_dDiagnostics
open Vuna_dCompiler_dFrontend_dLexer
open Vuna_dCompiler_dFrontend_dParser_dSupport
open Vuna_dCompiler_dFrontend_dParser
open Vuna_dCompiler_dLoader_dDiagnostics
open Vuna_dCompiler_dLoader_dModules
open Vuna_dCompiler_dIntrinsics
open Vuna_dCompiler_dLoader_dResolve
open Vuna_dCompiler_dLoader_dFlatten
open Vuna_dCompiler_dLoader
open Vuna_dCompiler_dCore_dTerm
open Vuna_dCompiler_dCore_dEval
open Vuna_dCompiler_dCore_dConv
open Vuna_dCompiler_dCore
open Vuna_dCompiler_dElab_dTypes
open Vuna_dCompiler_dElab_dPrelude
open Vuna_dCompiler_dElab_dSig
open Vuna_dCompiler_dElab_dMeta
open Vuna_dCompiler_dElab_dCase
open Vuna_dCompiler_dElab_dDict
open Vuna_dCompiler_dElab_dMatch
open Vuna_dCompiler_dElab_dTerm_dSupport
open Vuna_dCompiler_dElab_dTerm_dImpl
open Vuna_dCompiler_dElab_dTerm
let rec v_Vuna_dCompiler_dElab_dData_dkindResultLevel = (fun ty -> (match ty with
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTPi (dtb__0, dtb__1, dtb__2, dtb__3, dtb__4) -> (v_Vuna_dCompiler_dElab_dData_dkindResultLevel dtb__4)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTType (dtb__5) -> (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__5))
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
))

let rec v_Vuna_dCompiler_dElab_dData_dcountSurfacePis = (fun e -> ((fun nd_uscrut1 -> (match nd_uscrut1 with
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEApp (dtb__6, dtb__7, dtb__8) -> (match dtb__6 with
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (dtb__9, dtb__10) -> (if ((bi_eq_str dtb__9) "->") then (match dtb__7 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__11, dtb__12) -> (match dtb__12 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__13, dtb__14) -> (match dtb__14 with
  | C_Base_dList_dList_Base_dList_dNil -> ((bi_add 1) (v_Vuna_dCompiler_dElab_dData_dcountSurfacePis dtb__13))
  | _ -> 0
)
  | _ -> 0
)
  | _ -> 0
) else 0)
  | _ -> 0
)
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEPi (dtb__15, dtb__16, dtb__17, dtb__18, dtb__19) -> ((bi_add 1) (v_Vuna_dCompiler_dElab_dData_dcountSurfacePis dtb__18))
  | _ -> 0
)) e))

let rec v_Vuna_dCompiler_dElab_dData_dcountTelePis = (fun t -> (match t with
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTPi (dtb__20, dtb__21, dtb__22, dtb__23, dtb__24) -> ((bi_add 1) (v_Vuna_dCompiler_dElab_dData_dcountTelePis dtb__24))
  | _ -> 0
))

let rec v_Vuna_dCompiler_dElab_dData_dctorFieldSortsGo = (fun globals -> (fun ctx -> (fun ec -> (fun pos -> (fun arity -> (fun famLevel -> (fun cname -> (fun csp -> (fun tyExpr -> ((fun nd_uscrut9 -> (match nd_uscrut9 with
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEApp (dtb__25, dtb__26, dtb__27) -> (match dtb__25 with
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (dtb__28, dtb__29) -> (if ((bi_eq_str dtb__28) "->") then (match dtb__26 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__30, dtb__31) -> (match dtb__31 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__32, dtb__33) -> (match dtb__33 with
  | C_Base_dList_dList_Base_dList_dNil -> (((((((((((v_Vuna_dCompiler_dElab_dData_dctorFieldSortsBinder globals) ctx) ec) pos) arity) famLevel) cname) csp) "_") dtb__30) dtb__32)
  | _ -> (C_Base_dResult_dResult_Base_dResult_dOk (ec))
)
  | _ -> (C_Base_dResult_dResult_Base_dResult_dOk (ec))
)
  | _ -> (C_Base_dResult_dResult_Base_dResult_dOk (ec))
) else (C_Base_dResult_dResult_Base_dResult_dOk (ec)))
  | _ -> (C_Base_dResult_dResult_Base_dResult_dOk (ec))
)
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEPi (dtb__34, dtb__35, dtb__36, dtb__37, dtb__38) -> (((((((((((v_Vuna_dCompiler_dElab_dData_dctorFieldSortsBinder globals) ctx) ec) pos) arity) famLevel) cname) csp) dtb__34) dtb__36) dtb__37)
  | _ -> (C_Base_dResult_dResult_Base_dResult_dOk (ec))
)) tyExpr))))))))))
and v_Vuna_dCompiler_dElab_dData_dctorFieldSortsBinder = (fun globals -> (fun ctx -> (fun ec -> (fun pos -> (fun arity -> (fun famLevel -> (fun cname -> (fun csp -> (fun name -> (fun dom -> (fun cod -> ((v_Base_dResult_dandThen ((((v_Vuna_dCompiler_dElab_dTerm_dcheckType globals) ctx) ec) dom)) (fun p -> ((fun nd_uscrut12 -> (match nd_uscrut12 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__39, dtb__40) -> (match dtb__40 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__41, dtb__42) -> ((fun ctx2 -> (if ((bi_lt_int pos) arity) then (((((((((v_Vuna_dCompiler_dElab_dData_dctorFieldSortsGo globals) ctx2) dtb__42) ((bi_add pos) 1)) arity) famLevel) cname) csp) cod) else (if (if ((v_Vuna_dCompiler_dCore_dTerm_dlevelLt dtb__41) famLevel) then true else ((v_Vuna_dCompiler_dCore_dTerm_dlevelEq dtb__41) famLevel)) then (((((((((v_Vuna_dCompiler_dElab_dData_dctorFieldSortsGo globals) ctx2) dtb__42) ((bi_add pos) 1)) arity) famLevel) cname) csp) cod) else ((fun field -> ((fun msg -> ((((v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr2 csp) (C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_Vuna_dCompiler_dDiagnostics_dTc_dCtorError (cname, msg))) cname) msg)) ((bi_concat "field #") ((bi_concat (bi_strFromInt field)) ((bi_concat ": its type sorts into Type ") ((bi_concat (bi_strFromInt (v_Vuna_dCompiler_dCore_dTerm_dlevelToInt dtb__41))) ((bi_concat ", above the family level Type ") (bi_strFromInt (v_Vuna_dCompiler_dCore_dTerm_dlevelToInt famLevel))))))))) ((bi_sub pos) arity))))) (((v_Vuna_dCompiler_dElab_dTypes_dctxBind name) dtb__39) ctx))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) p))))))))))))))

let v_Vuna_dCompiler_dElab_dData_dcheckCtorFieldSorts = (fun globals -> (fun ctx -> (fun ec -> (fun arity -> (fun famLevel -> (fun cname -> (fun csp -> (fun tyPis -> (fun tyExpr -> ((fun surfacePis -> (if ((bi_neq_int surfacePis) tyPis) then ((((v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr2 csp) (C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_Vuna_dCompiler_dDiagnostics_dTc_dCtorError (cname, "cannot verify the universe level of its field types; write the constructor type as a Pi chain"))) cname) "cannot verify the universe level of its field types; write the constructor type as a Pi chain") else (((((((((v_Vuna_dCompiler_dElab_dData_dctorFieldSortsGo globals) ctx) ec) 0) arity) famLevel) cname) csp) tyExpr))) (v_Vuna_dCompiler_dElab_dData_dcountSurfacePis tyExpr)))))))))))

let v_Vuna_dCompiler_dElab_dData_delabCtor = (fun globals -> (fun fam -> (fun arity -> (fun famLevel -> (fun ec -> (fun c -> (match c with
  | C_Vuna_dCompiler_dFrontend_dAst_dCtor_Vuna_dCompiler_dFrontend_dAst_dCtor (dtb__43, dtb__44, dtb__45, dtb__46) -> ((fun famKind -> ((fun tyExpr2 -> ((v_Base_dResult_dandThen ((((v_Vuna_dCompiler_dElab_dTerm_dcheckType globals) v_Vuna_dCompiler_dElab_dTypes_demptyCtx) ec) tyExpr2)) (fun pk -> ((fun nd_uscrut13 -> (match nd_uscrut13 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__47, dtb__48) -> (match dtb__48 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__49, dtb__50) -> ((fun tyTerm -> (match (v_Vuna_dCompiler_dElab_dMeta_dresultSpine (v_Vuna_dCompiler_dElab_dMeta_ddropParams tyTerm)) with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__51, dtb__52) -> (if ((bi_neq_str dtb__51) fam) then ((((v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr2 dtb__46) (C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_Vuna_dCompiler_dDiagnostics_dTc_dCtorDoesNotReturn (dtb__43, fam))) dtb__43) fam) else (if ((bi_neq_int (v_Base_dList_dlength dtb__52)) arity) then ((((v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr2 dtb__46) (C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_Vuna_dCompiler_dDiagnostics_dTc_dCtorWrongIndices (dtb__43, fam))) dtb__43) fam) else ((v_Base_dResult_dandThen (((((((((v_Vuna_dCompiler_dElab_dData_dcheckCtorFieldSorts globals) v_Vuna_dCompiler_dElab_dTypes_demptyCtx) dtb__50) arity) famLevel) dtb__43) dtb__46) (v_Vuna_dCompiler_dElab_dData_dcountTelePis tyTerm)) tyExpr2)) (fun _u -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dElab_dTypes_dDtCtor_Vuna_dCompiler_dElab_dTypes_dDtCtor (dtb__43, fam, (v_Vuna_dCompiler_dElab_dMeta_dteleOfType tyTerm), tyTerm)), dtb__50))))))))
  | _ -> failwith "DT: impossible branch"
)) (((v_Vuna_dCompiler_dElab_dMeta_dzonkTerm dtb__50) 0) dtb__47))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) pk)))) (if (v_Vuna_dCompiler_dElab_dMeta_dhasFamParams dtb__44) then dtb__44 else (((v_Vuna_dCompiler_dElab_dMeta_dprependFamParams famKind) dtb__44) dtb__46)))) (match ((v_Vuna_dCompiler_dElab_dMeta_dglobalLookup fam) globals) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__53) -> dtb__53
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTType (v_Vuna_dCompiler_dCore_dTerm_dlevelZero))
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
)))))))

let rec v_Vuna_dCompiler_dElab_dData_delabCtors = (fun mc0 -> (fun mc1 -> (fun mc2 -> (fun mc3 -> (fun mc4 -> (fun mc5 -> (match mc5 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__54, dtb__55) -> ((v_Base_dResult_dandThen ((((((v_Vuna_dCompiler_dElab_dData_delabCtor mc0) mc1) mc2) mc3) mc4) dtb__54)) (fun p -> (match p with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__56, dtb__57) -> ((v_Base_dResult_dandThen ((((((v_Vuna_dCompiler_dElab_dData_delabCtors mc0) mc1) mc2) mc3) dtb__57) dtb__55)) (fun q -> (match q with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__58, dtb__59) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Base_dList_dList_Base_dList_dCons (dtb__56, dtb__58)), dtb__59))))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))
  | C_Base_dList_dList_Base_dList_dNil -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (C_Base_dList_dList_Base_dList_dNil, mc4))))
  | _ -> failwith "DT: impossible branch"
)))))))

let v_Vuna_dCompiler_dElab_dData_delabDataHead = (fun globals -> (fun ec -> (fun ds -> (match ds with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__60, dtb__61) -> (match dtb__60 with
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDData (dtb__62, dtb__63, dtb__64, dtb__65, dtb__66, dtb__67) -> (if ((v_Base_dList_dmemName dtb__62) v_Vuna_dCompiler_dElab_dPrelude_dpreludeNames) then (((v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr1 dtb__67) (C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_Vuna_dCompiler_dDiagnostics_dTc_dCannotRedefineBuiltin (dtb__62))) dtb__62) else ((v_Base_dResult_dandThen ((((v_Vuna_dCompiler_dElab_dTerm_dcheckType globals) v_Vuna_dCompiler_dElab_dTypes_demptyCtx) ec) dtb__64)) (fun pk -> ((fun nd_uscrut14 -> (match nd_uscrut14 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__68, dtb__69) -> (match dtb__69 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__70, dtb__71) -> ((fun fullKind -> ((fun tele -> ((fun arity -> (if (v_Base_dBool_dnot (v_Vuna_dCompiler_dElab_dMeta_dkindWellFormed fullKind)) then ((v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr0 dtb__67) C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_Vuna_dCompiler_dDiagnostics_dTc_dDataKindArrows) else (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dElab_dMeta_dDataHead_Vuna_dCompiler_dElab_dMeta_dDataHead (dtb__62, fullKind, arity)), (C_Base_dPair_dPair_Base_dPair_dPair ((C_Base_dList_dList_Base_dList_dCons ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__62, fullKind)), C_Base_dList_dList_Base_dList_dNil)), dtb__71)))))))) (v_Base_dList_dlength tele))) (v_Vuna_dCompiler_dElab_dMeta_dsplitKind fullKind))) ((v_Vuna_dCompiler_dElab_dPrelude_dprependParams dtb__63) (((v_Vuna_dCompiler_dElab_dMeta_dzonkTerm dtb__71) 0) dtb__68)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) pk))))
  | _ -> ((v_Vuna_dCompiler_dElab_dTypes_derrAt dtb__61) "DT: internal: expected a data declaration")
)
  | _ -> failwith "DT: impossible branch"
))))

let rec v_Vuna_dCompiler_dElab_dData_delabDataHeadsRound = (fun pending -> (fun globals -> (fun ec -> (fun heads -> (fun failed -> (match pending with
  | C_Base_dList_dList_Base_dList_dNil -> (C_Base_dPair_dPair_Base_dPair_dPair (heads, (C_Base_dPair_dPair_Base_dPair_dPair (globals, (C_Base_dPair_dPair_Base_dPair_dPair (ec, (v_Base_dList_dreverse failed)))))))
  | C_Base_dList_dList_Base_dList_dCons (dtb__72, dtb__73) -> ((fun nd_uscrut8 -> (match nd_uscrut8 with
  | C_Base_dResult_dResult_Base_dResult_dOk (dtb__74) -> (match dtb__74 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__75, dtb__76) -> (match dtb__76 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__77, dtb__78) -> (((((v_Vuna_dCompiler_dElab_dData_delabDataHeadsRound dtb__73) ((v_Base_dList_dappend globals) dtb__77)) dtb__78) (C_Base_dList_dList_Base_dList_dCons (dtb__75, heads))) failed)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dResult_dResult_Base_dResult_dErr (dtb__79) -> (((((v_Vuna_dCompiler_dElab_dData_delabDataHeadsRound dtb__73) globals) ec) heads) (C_Base_dList_dList_Base_dList_dCons (dtb__72, failed)))
  | _ -> failwith "DT: impossible branch"
)) (((v_Vuna_dCompiler_dElab_dData_delabDataHead globals) ec) dtb__72))
  | _ -> failwith "DT: impossible branch"
))))))

let v_Vuna_dCompiler_dElab_dData_delabDataHeadsNoProgress = (fun globals -> (fun ec -> (fun failed -> (match failed with
  | C_Base_dList_dList_Base_dList_dNil -> (C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: no failed data declarations"))
  | C_Base_dList_dList_Base_dList_dCons (dtb__80, dtb__81) -> (match (((v_Vuna_dCompiler_dElab_dData_delabDataHead globals) ec) dtb__80) with
  | C_Base_dResult_dResult_Base_dResult_dErr (dtb__82) -> (C_Base_dResult_dResult_Base_dResult_dErr (dtb__82))
  | C_Base_dResult_dResult_Base_dResult_dOk (dtb__83) -> (C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: data head registration made no progress"))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))

let rec v_Vuna_dCompiler_dElab_dData_delabDataHeadsFuel = (fun fuel -> (fun pending -> (fun globals -> (fun ec -> (fun heads -> (if ((bi_le_int fuel) 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: data head registration fuel exhausted")) else (match pending with
  | C_Base_dList_dList_Base_dList_dNil -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((v_Base_dList_dreverse heads), (C_Base_dPair_dPair_Base_dPair_dPair (globals, ec))))))
  | _ -> ((fun nd_uscrut5 -> (match nd_uscrut5 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__84, dtb__85) -> (match dtb__85 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__86, dtb__87) -> (match dtb__87 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__88, dtb__89) -> (match dtb__89 with
  | C_Base_dList_dList_Base_dList_dNil -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((v_Base_dList_dreverse dtb__84), (C_Base_dPair_dPair_Base_dPair_dPair (dtb__86, dtb__88))))))
  | _ -> (if ((bi_eq_int (v_Base_dList_dlength dtb__89)) (v_Base_dList_dlength pending)) then (((v_Vuna_dCompiler_dElab_dData_delabDataHeadsNoProgress globals) ec) dtb__89) else (((((v_Vuna_dCompiler_dElab_dData_delabDataHeadsFuel ((bi_sub fuel) 1)) dtb__89) dtb__86) dtb__88) dtb__84))
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) (((((v_Vuna_dCompiler_dElab_dData_delabDataHeadsRound pending) globals) ec) heads) C_Base_dList_dList_Base_dList_dNil))
)))))))

let v_Vuna_dCompiler_dElab_dData_delabDataHeads = (fun pending -> (fun globals -> (fun ec -> (fun heads -> (((((v_Vuna_dCompiler_dElab_dData_delabDataHeadsFuel 64) pending) globals) ec) heads)))))

let rec v_Vuna_dCompiler_dElab_dData_dallIn = (fun mc0 -> (fun mc1 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__90, dtb__91) -> (if ((v_Base_dList_dmemName dtb__90) mc1) then ((v_Vuna_dCompiler_dElab_dData_dallIn dtb__91) mc1) else false)
  | C_Base_dList_dList_Base_dList_dNil -> true
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dElab_dData_dsameCtorSet = (fun expected -> (fun actual -> (if ((bi_eq_int (v_Base_dList_dlength expected)) (v_Base_dList_dlength actual)) then ((v_Vuna_dCompiler_dElab_dData_dallIn expected) actual) else false)))

let rec v_Vuna_dCompiler_dElab_dData_delabDataBodies = (fun decls -> (fun heads -> (fun globals -> (fun ec -> (fun acc -> (match decls with
  | C_Base_dList_dList_Base_dList_dNil -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((v_Base_dList_dreverse acc), (C_Base_dPair_dPair_Base_dPair_dPair (globals, ec))))))
  | C_Base_dList_dList_Base_dList_dCons (dtb__92, dtb__93) -> (match dtb__92 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__94, dtb__95) -> (match dtb__94 with
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDData (dtb__96, dtb__97, dtb__98, dtb__99, dtb__100, dtb__101) -> ((fun nd_uscrut18 -> (match nd_uscrut18 with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__102) -> (match dtb__102 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__103, dtb__104) -> ((fun tele -> ((fun famLevel -> ((v_Base_dResult_dandThen ((((((v_Vuna_dCompiler_dElab_dData_delabCtors globals) dtb__96) dtb__104) famLevel) ec) dtb__99)) (fun q -> (match q with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__105, dtb__106) -> ((fun dd -> (match (v_Vuna_dCompiler_dIntrinsics_dcanonicalCtorsFor dtb__96) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__107) -> (if ((v_Vuna_dCompiler_dElab_dData_dsameCtorSet dtb__107) ((v_Base_dList_dmap v_Vuna_dCompiler_dElab_dTypes_ddtCtorName) dtb__105)) then (((((v_Vuna_dCompiler_dElab_dData_delabDataBodies dtb__93) heads) ((v_Base_dList_dappend globals) (v_Vuna_dCompiler_dElab_dMeta_dctorGlobals dtb__105))) ((v_Vuna_dCompiler_dElab_dTypes_decAddData dtb__106) dd)) (C_Base_dList_dList_Base_dList_dCons (dd, acc))) else (((v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr1 dtb__101) (C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_Vuna_dCompiler_dDiagnostics_dTc_dCannotRedefineBuiltin (dtb__96))) dtb__96))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (((((v_Vuna_dCompiler_dElab_dData_delabDataBodies dtb__93) heads) ((v_Base_dList_dappend globals) (v_Vuna_dCompiler_dElab_dMeta_dctorGlobals dtb__105))) ((v_Vuna_dCompiler_dElab_dTypes_decAddData dtb__106) dd)) (C_Base_dList_dList_Base_dList_dCons (dd, acc)))
  | _ -> failwith "DT: impossible branch"
)) (C_Vuna_dCompiler_dElab_dTypes_dDtData_Vuna_dCompiler_dElab_dTypes_dDtData (dtb__96, tele, dtb__105)))
  | _ -> failwith "DT: impossible branch"
)))) (match (v_Vuna_dCompiler_dElab_dData_dkindResultLevel dtb__103) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__108) -> dtb__108
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> v_Vuna_dCompiler_dCore_dTerm_dlevelZero
  | _ -> failwith "DT: impossible branch"
))) (v_Vuna_dCompiler_dElab_dMeta_dsplitKind dtb__103))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((v_Vuna_dCompiler_dElab_dTypes_derrAt dtb__101) ((bi_concat "DT: internal: missing data head for ") dtb__96))
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dElab_dMeta_dlookupDataHead dtb__96) heads))
  | _ -> (((((v_Vuna_dCompiler_dElab_dData_delabDataBodies dtb__93) heads) globals) ec) acc)
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))))

let v_Vuna_dCompiler_dElab_dData_delabDatas = (fun decls -> (fun globals -> (fun ec -> ((v_Base_dResult_dandThen ((((v_Vuna_dCompiler_dElab_dData_delabDataHeads decls) globals) ec) C_Base_dList_dList_Base_dList_dNil)) (fun p -> ((fun nd_uscrut4 -> (match nd_uscrut4 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__109, dtb__110) -> (match dtb__110 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__111, dtb__112) -> (((((v_Vuna_dCompiler_dElab_dData_delabDataBodies decls) dtb__109) dtb__111) dtb__112) C_Base_dList_dList_Base_dList_dNil)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) p))))))

let rec v_Vuna_dCompiler_dElab_dData_dctorFieldGo = (fun arity -> (fun t -> (fun acc -> (match t with
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTPi (dtb__113, dtb__114, dtb__115, dtb__116, dtb__117) -> (if ((bi_gt_int arity) 0) then (((v_Vuna_dCompiler_dElab_dData_dctorFieldGo ((bi_sub arity) 1)) dtb__117) acc) else (((v_Vuna_dCompiler_dElab_dData_dctorFieldGo 0) dtb__117) (C_Base_dList_dList_Base_dList_dCons (dtb__116, acc))))
  | _ -> (v_Base_dList_dreverse acc)
))))

let v_Vuna_dCompiler_dElab_dData_dctorFieldTerms = (fun arity -> (fun ty -> (((v_Vuna_dCompiler_dElab_dData_dctorFieldGo arity) ty) C_Base_dList_dList_Base_dList_dNil)))

let rec v_Vuna_dCompiler_dElab_dData_dtermUsesVar = (fun depth -> (fun t -> (match t with
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTVar (dtb__118, dtb__119) -> ((bi_eq_int dtb__119) depth)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTMeta (dtb__120) -> false
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTGlobal (dtb__121) -> false
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTType (dtb__122) -> false
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTPi (dtb__123, dtb__124, dtb__125, dtb__126, dtb__127) -> (if ((v_Vuna_dCompiler_dElab_dData_dtermUsesVar depth) dtb__126) then true else ((v_Vuna_dCompiler_dElab_dData_dtermUsesVar ((bi_add depth) 1)) dtb__127))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTLam (dtb__128, dtb__129, dtb__130) -> ((v_Vuna_dCompiler_dElab_dData_dtermUsesVar ((bi_add depth) 1)) dtb__130)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp (dtb__131, dtb__132, dtb__133) -> (if ((v_Vuna_dCompiler_dElab_dData_dtermUsesVar depth) dtb__131) then true else ((v_Vuna_dCompiler_dElab_dData_dtermUsesVar depth) dtb__132))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCon (dtb__134, dtb__135) -> ((v_Vuna_dCompiler_dElab_dData_dtermUsesVarArgs depth) dtb__135)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCase (dtb__136, dtb__137) -> (if ((v_Vuna_dCompiler_dElab_dData_dtermUsesVar depth) dtb__136) then true else ((v_Vuna_dCompiler_dElab_dData_dtermUsesVarAlts depth) dtb__137))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTInt (dtb__138) -> false
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTStr (dtb__139) -> false
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTBool (dtb__140) -> false
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTIf (dtb__141, dtb__142, dtb__143) -> (if (if ((v_Vuna_dCompiler_dElab_dData_dtermUsesVar depth) dtb__141) then true else ((v_Vuna_dCompiler_dElab_dData_dtermUsesVar depth) dtb__142)) then true else ((v_Vuna_dCompiler_dElab_dData_dtermUsesVar depth) dtb__143))
  | _ -> failwith "DT: impossible branch"
)))
and v_Vuna_dCompiler_dElab_dData_dtermUsesVarArgs = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__144, dtb__145) -> (match dtb__144 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__146, dtb__147) -> (if ((v_Vuna_dCompiler_dElab_dData_dtermUsesVar mc0) dtb__146) then true else ((v_Vuna_dCompiler_dElab_dData_dtermUsesVarArgs mc0) dtb__145))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> false
  | _ -> failwith "DT: impossible branch"
)))
and v_Vuna_dCompiler_dElab_dData_dtermUsesVarAlts = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__148, dtb__149) -> (if ((v_Vuna_dCompiler_dElab_dData_dtermUsesVar ((bi_add mc0) (v_Base_dList_dlength (v_Vuna_dCompiler_dCore_dTerm_dcaseAltBinders dtb__148)))) (v_Vuna_dCompiler_dCore_dTerm_dcaseAltBody dtb__148)) then true else ((v_Vuna_dCompiler_dElab_dData_dtermUsesVarAlts mc0) dtb__149))
  | C_Base_dList_dList_Base_dList_dNil -> false
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dElab_dData_dusedInTeleGo = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__150, dtb__151) -> (if ((v_Vuna_dCompiler_dElab_dData_dtermUsesVar mc0) dtb__150) then true else ((v_Vuna_dCompiler_dElab_dData_dusedInTeleGo mc0) dtb__151))
  | C_Base_dList_dList_Base_dList_dNil -> false
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dElab_dData_dusedInTele = (fun i -> (fun arity -> (fun k -> (fun ts -> ((v_Vuna_dCompiler_dElab_dData_dusedInTeleGo ((bi_add k) arity)) ts)))))

let v_Vuna_dCompiler_dElab_dData_dusedInCtor = (fun i -> (fun arity -> (fun c -> ((((v_Vuna_dCompiler_dElab_dData_dusedInTele i) arity) 0) ((v_Vuna_dCompiler_dElab_dData_dctorFieldTerms arity) (v_Vuna_dCompiler_dElab_dTypes_ddtCtorType c))))))

let rec v_Vuna_dCompiler_dElab_dData_dusedInCtors = (fun mc0 -> (fun mc1 -> (fun mc2 -> (match mc2 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__152, dtb__153) -> (if (((v_Vuna_dCompiler_dElab_dData_dusedInCtor mc0) mc1) dtb__152) then true else (((v_Vuna_dCompiler_dElab_dData_dusedInCtors mc0) mc1) dtb__153))
  | C_Base_dList_dList_Base_dList_dNil -> false
  | _ -> failwith "DT: impossible branch"
))))

let v_Vuna_dCompiler_dElab_dData_dparamUsedInFieldTys = (fun dd -> (fun i -> (((v_Vuna_dCompiler_dElab_dData_dusedInCtors i) (v_Base_dList_dlength (v_Vuna_dCompiler_dElab_dTypes_ddtDataParams dd))) (v_Vuna_dCompiler_dElab_dTypes_ddtDataCtors dd))))

let rec v_Vuna_dCompiler_dElab_dData_deraseMaskGo = (fun mc0 -> (fun mc1 -> (fun mc2 -> (fun mc3 -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__154, dtb__155) -> ((((v_Vuna_dCompiler_dElab_dData_deraseMaskGo mc0) dtb__155) ((bi_add mc2) 1)) (C_Base_dList_dList_Base_dList_dCons ((v_Base_dBool_dnot ((v_Vuna_dCompiler_dElab_dData_dparamUsedInFieldTys mc0) mc2)), mc3)))
  | C_Base_dList_dList_Base_dList_dNil -> (v_Base_dList_dreverse mc3)
  | _ -> failwith "DT: impossible branch"
)))))

let v_Vuna_dCompiler_dElab_dData_deraseIndexMask = (fun dd -> ((((v_Vuna_dCompiler_dElab_dData_deraseMaskGo dd) (v_Vuna_dCompiler_dElab_dTypes_ddtDataParams dd)) 0) C_Base_dList_dList_Base_dList_dNil))

let rec v_Vuna_dCompiler_dElab_dData_dcandidateNames = (fun mc0 -> (fun mc1 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__156, dtb__157) -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__158, dtb__159) -> (match dtb__156 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__160, dtb__161) -> (if dtb__158 then (C_Base_dList_dList_Base_dList_dCons (dtb__160, ((v_Vuna_dCompiler_dElab_dData_dcandidateNames dtb__157) dtb__159))) else ((v_Vuna_dCompiler_dElab_dData_dcandidateNames dtb__157) dtb__159))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dList_dList_Base_dList_dNil
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dList_dList_Base_dList_dNil
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dElab_dData_dcandidateOf = (fun d -> (C_Base_dPair_dPair_Base_dPair_dPair ((v_Vuna_dCompiler_dElab_dTypes_ddtDataName d), ((v_Vuna_dCompiler_dElab_dData_dcandidateNames (v_Vuna_dCompiler_dElab_dTypes_ddtDataParams d)) (v_Vuna_dCompiler_dElab_dData_deraseIndexMask d)))))

let rec v_Vuna_dCompiler_dElab_dData_dindexErasureCandidates = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__162, dtb__163) -> (C_Base_dList_dList_Base_dList_dCons ((v_Vuna_dCompiler_dElab_dData_dcandidateOf dtb__162), (v_Vuna_dCompiler_dElab_dData_dindexErasureCandidates dtb__163)))
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dList_dList_Base_dList_dNil
  | _ -> failwith "DT: impossible branch"
))
