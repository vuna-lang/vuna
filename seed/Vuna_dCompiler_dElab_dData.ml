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
let v_Vuna_dCompiler_dElab_dData_delabCtor = (fun globals -> (fun fam -> (fun arity -> (fun ec -> (fun c -> (match c with
  | C_Vuna_dCompiler_dFrontend_dAst_dCtor_Vuna_dCompiler_dFrontend_dAst_dCtor (dtb__0, dtb__1, dtb__2, dtb__3) -> ((fun famKind -> ((fun tyExpr2 -> ((v_Base_dResult_dandThen ((((v_Vuna_dCompiler_dElab_dTerm_dcheckType globals) v_Vuna_dCompiler_dElab_dTypes_demptyCtx) ec) tyExpr2)) (fun pk -> (match pk with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__4, dtb__5) -> (match dtb__5 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__6, dtb__7) -> ((fun tyTerm -> (match (v_Vuna_dCompiler_dElab_dMeta_dresultSpine (v_Vuna_dCompiler_dElab_dMeta_ddropParams tyTerm)) with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__8, dtb__9) -> (if ((bi_neq_str dtb__8) fam) then ((((v_Vuna_dCompiler_dDiagnostics_dtcErr2 dtb__3) (C_Vuna_dCompiler_dDiagnostics_dTcErr_Vuna_dCompiler_dDiagnostics_dCtorDoesNotReturn (dtb__0, fam))) dtb__0) fam) else (if ((bi_neq_int (v_Base_dList_dlength dtb__9)) arity) then ((((v_Vuna_dCompiler_dDiagnostics_dtcErr2 dtb__3) (C_Vuna_dCompiler_dDiagnostics_dTcErr_Vuna_dCompiler_dDiagnostics_dCtorWrongIndices (dtb__0, fam))) dtb__0) fam) else (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dElab_dTypes_dDtCtor_Vuna_dCompiler_dElab_dTypes_dDtCtor (dtb__0, fam, (v_Vuna_dCompiler_dElab_dMeta_dteleOfType tyTerm), tyTerm)), dtb__7))))))
  | _ -> failwith "DT: impossible branch"
)) (((v_Vuna_dCompiler_dElab_dMeta_dinlineSolvedMetas dtb__7) 0) dtb__4))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))) (if (v_Vuna_dCompiler_dElab_dMeta_dhasFamParams dtb__1) then dtb__1 else (((v_Vuna_dCompiler_dElab_dMeta_dprependFamParams famKind) dtb__1) dtb__3)))) (match ((v_Vuna_dCompiler_dElab_dMeta_dglobalLookup fam) globals) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__10) -> dtb__10
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTType (v_Vuna_dCompiler_dCore_dTerm_dlevelZero))
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
))))))

let rec v_Vuna_dCompiler_dElab_dData_delabCtors = (fun mc0 -> (fun mc1 -> (fun mc2 -> (fun mc3 -> (fun mc4 -> (match mc4 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__11, dtb__12) -> ((v_Base_dResult_dandThen (((((v_Vuna_dCompiler_dElab_dData_delabCtor mc0) mc1) mc2) mc3) dtb__11)) (fun p -> (match p with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__13, dtb__14) -> ((v_Base_dResult_dandThen (((((v_Vuna_dCompiler_dElab_dData_delabCtors mc0) mc1) mc2) dtb__14) dtb__12)) (fun q -> (match q with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__15, dtb__16) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Base_dList_dList_Base_dList_dCons (dtb__13, dtb__15)), dtb__16))))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))
  | C_Base_dList_dList_Base_dList_dNil -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (C_Base_dList_dList_Base_dList_dNil, mc3))))
  | _ -> failwith "DT: impossible branch"
))))))

let v_Vuna_dCompiler_dElab_dData_delabDataHead = (fun globals -> (fun ec -> (fun ds -> (match ds with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__17, dtb__18) -> (match dtb__17 with
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDData (dtb__19, dtb__20, dtb__21, dtb__22, dtb__23, dtb__24) -> (if ((v_Base_dList_dmemName dtb__19) v_Vuna_dCompiler_dElab_dPrelude_dpreludeNames) then (((v_Vuna_dCompiler_dDiagnostics_dtcErr1 dtb__24) (C_Vuna_dCompiler_dDiagnostics_dTcErr_Vuna_dCompiler_dDiagnostics_dCannotRedefineBuiltin (dtb__19))) dtb__19) else ((v_Base_dResult_dandThen ((((v_Vuna_dCompiler_dElab_dTerm_dcheckType globals) v_Vuna_dCompiler_dElab_dTypes_demptyCtx) ec) dtb__21)) (fun pk -> (match pk with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__25, dtb__26) -> (match dtb__26 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__27, dtb__28) -> ((fun fullKind -> ((fun tele -> ((fun arity -> (if (v_Base_dBool_dnot (v_Vuna_dCompiler_dElab_dMeta_dkindWellFormed fullKind)) then ((v_Vuna_dCompiler_dDiagnostics_dtcErr0 dtb__24) C_Vuna_dCompiler_dDiagnostics_dTcErr_Vuna_dCompiler_dDiagnostics_dDataKindArrows) else (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dElab_dMeta_dDataHead_Vuna_dCompiler_dElab_dMeta_dDataHead (dtb__19, fullKind, arity)), (C_Base_dPair_dPair_Base_dPair_dPair ((C_Base_dList_dList_Base_dList_dCons ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__19, fullKind)), C_Base_dList_dList_Base_dList_dNil)), dtb__28)))))))) (v_Base_dList_dlength tele))) (v_Vuna_dCompiler_dElab_dMeta_dsplitKind fullKind))) ((v_Vuna_dCompiler_dElab_dPrelude_dprependParams dtb__20) (((v_Vuna_dCompiler_dElab_dMeta_dinlineSolvedMetas dtb__28) 0) dtb__25)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))
  | _ -> ((v_Vuna_dCompiler_dElab_dTypes_derrAt dtb__18) "DT: internal: expected a data declaration")
)
  | _ -> failwith "DT: impossible branch"
))))

let rec v_Vuna_dCompiler_dElab_dData_delabDataHeadsRound = (fun pending -> (fun globals -> (fun ec -> (fun heads -> (fun failed -> (match pending with
  | C_Base_dList_dList_Base_dList_dNil -> (C_Base_dPair_dPair_Base_dPair_dPair (heads, (C_Base_dPair_dPair_Base_dPair_dPair (globals, (C_Base_dPair_dPair_Base_dPair_dPair (ec, (v_Base_dList_dreverse failed)))))))
  | C_Base_dList_dList_Base_dList_dCons (dtb__29, dtb__30) -> (match (((v_Vuna_dCompiler_dElab_dData_delabDataHead globals) ec) dtb__29) with
  | C_Base_dResult_dResult_Base_dResult_dErr (dtb__31) -> (((((v_Vuna_dCompiler_dElab_dData_delabDataHeadsRound dtb__30) globals) ec) heads) (C_Base_dList_dList_Base_dList_dCons (dtb__29, failed)))
  | C_Base_dResult_dResult_Base_dResult_dOk (dtb__32) -> (match dtb__32 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__33, dtb__34) -> (match dtb__34 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__35, dtb__36) -> (((((v_Vuna_dCompiler_dElab_dData_delabDataHeadsRound dtb__30) ((v_Base_dList_dappend globals) dtb__35)) dtb__36) (C_Base_dList_dList_Base_dList_dCons (dtb__33, heads))) failed)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))))

let v_Vuna_dCompiler_dElab_dData_delabDataHeadsNoProgress = (fun globals -> (fun ec -> (fun failed -> (match failed with
  | C_Base_dList_dList_Base_dList_dNil -> (C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: no failed data declarations"))
  | C_Base_dList_dList_Base_dList_dCons (dtb__37, dtb__38) -> (match (((v_Vuna_dCompiler_dElab_dData_delabDataHead globals) ec) dtb__37) with
  | C_Base_dResult_dResult_Base_dResult_dErr (dtb__39) -> (C_Base_dResult_dResult_Base_dResult_dErr (dtb__39))
  | C_Base_dResult_dResult_Base_dResult_dOk (dtb__40) -> (C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: data head registration made no progress"))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))

let rec v_Vuna_dCompiler_dElab_dData_delabDataHeadsFuel = (fun fuel -> (fun pending -> (fun globals -> (fun ec -> (fun heads -> (if ((bi_le_int fuel) 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: data head registration fuel exhausted")) else (match pending with
  | C_Base_dList_dList_Base_dList_dNil -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((v_Base_dList_dreverse heads), (C_Base_dPair_dPair_Base_dPair_dPair (globals, ec))))))
  | _ -> (match (((((v_Vuna_dCompiler_dElab_dData_delabDataHeadsRound pending) globals) ec) heads) C_Base_dList_dList_Base_dList_dNil) with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__41, dtb__42) -> (match dtb__42 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__43, dtb__44) -> (match dtb__44 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__45, dtb__46) -> (match dtb__46 with
  | C_Base_dList_dList_Base_dList_dNil -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((v_Base_dList_dreverse dtb__41), (C_Base_dPair_dPair_Base_dPair_dPair (dtb__43, dtb__45))))))
  | _ -> (if ((bi_eq_int (v_Base_dList_dlength dtb__46)) (v_Base_dList_dlength pending)) then (((v_Vuna_dCompiler_dElab_dData_delabDataHeadsNoProgress globals) ec) dtb__46) else (((((v_Vuna_dCompiler_dElab_dData_delabDataHeadsFuel ((bi_sub fuel) 1)) dtb__46) dtb__43) dtb__45) dtb__41))
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
)))))))

let v_Vuna_dCompiler_dElab_dData_delabDataHeads = (fun pending -> (fun globals -> (fun ec -> (fun heads -> (((((v_Vuna_dCompiler_dElab_dData_delabDataHeadsFuel 64) pending) globals) ec) heads)))))

let rec v_Vuna_dCompiler_dElab_dData_dallIn = (fun mc0 -> (fun mc1 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__47, dtb__48) -> (if ((v_Base_dList_dmemName dtb__47) mc1) then ((v_Vuna_dCompiler_dElab_dData_dallIn dtb__48) mc1) else false)
  | C_Base_dList_dList_Base_dList_dNil -> true
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dElab_dData_dsameCtorSet = (fun expected -> (fun actual -> (if ((bi_eq_int (v_Base_dList_dlength expected)) (v_Base_dList_dlength actual)) then ((v_Vuna_dCompiler_dElab_dData_dallIn expected) actual) else false)))

let rec v_Vuna_dCompiler_dElab_dData_delabDataBodies = (fun decls -> (fun heads -> (fun globals -> (fun ec -> (fun acc -> (match decls with
  | C_Base_dList_dList_Base_dList_dNil -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((v_Base_dList_dreverse acc), (C_Base_dPair_dPair_Base_dPair_dPair (globals, ec))))))
  | C_Base_dList_dList_Base_dList_dCons (dtb__49, dtb__50) -> (match dtb__49 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__51, dtb__52) -> (match dtb__51 with
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDData (dtb__53, dtb__54, dtb__55, dtb__56, dtb__57, dtb__58) -> (match ((v_Vuna_dCompiler_dElab_dMeta_dlookupDataHead dtb__53) heads) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((v_Vuna_dCompiler_dElab_dTypes_derrAt dtb__58) ((bi_concat "DT: internal: missing data head for ") dtb__53))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__59) -> (match dtb__59 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__60, dtb__61) -> ((fun tele -> ((v_Base_dResult_dandThen (((((v_Vuna_dCompiler_dElab_dData_delabCtors globals) dtb__53) dtb__61) ec) dtb__56)) (fun q -> (match q with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__62, dtb__63) -> ((fun dd -> (match (v_Vuna_dCompiler_dIntrinsics_dcanonicalCtorsFor dtb__53) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__64) -> (if ((v_Vuna_dCompiler_dElab_dData_dsameCtorSet dtb__64) ((v_Base_dList_dmap v_Vuna_dCompiler_dElab_dTypes_ddtCtorName) dtb__62)) then (((((v_Vuna_dCompiler_dElab_dData_delabDataBodies dtb__50) heads) ((v_Base_dList_dappend globals) (v_Vuna_dCompiler_dElab_dMeta_dctorGlobals dtb__62))) ((v_Vuna_dCompiler_dElab_dTypes_decAddData dtb__63) dd)) (C_Base_dList_dList_Base_dList_dCons (dd, acc))) else (((v_Vuna_dCompiler_dDiagnostics_dtcErr1 dtb__58) (C_Vuna_dCompiler_dDiagnostics_dTcErr_Vuna_dCompiler_dDiagnostics_dCannotRedefineBuiltin (dtb__53))) dtb__53))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (((((v_Vuna_dCompiler_dElab_dData_delabDataBodies dtb__50) heads) ((v_Base_dList_dappend globals) (v_Vuna_dCompiler_dElab_dMeta_dctorGlobals dtb__62))) ((v_Vuna_dCompiler_dElab_dTypes_decAddData dtb__63) dd)) (C_Base_dList_dList_Base_dList_dCons (dd, acc)))
  | _ -> failwith "DT: impossible branch"
)) (C_Vuna_dCompiler_dElab_dTypes_dDtData_Vuna_dCompiler_dElab_dTypes_dDtData (dtb__53, tele, dtb__62)))
  | _ -> failwith "DT: impossible branch"
)))) (v_Vuna_dCompiler_dElab_dMeta_dsplitKind dtb__60))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> (((((v_Vuna_dCompiler_dElab_dData_delabDataBodies dtb__50) heads) globals) ec) acc)
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))))

let v_Vuna_dCompiler_dElab_dData_delabDatas = (fun decls -> (fun globals -> (fun ec -> ((v_Base_dResult_dandThen ((((v_Vuna_dCompiler_dElab_dData_delabDataHeads decls) globals) ec) C_Base_dList_dList_Base_dList_dNil)) (fun p -> (match p with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__65, dtb__66) -> (match dtb__66 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__67, dtb__68) -> (((((v_Vuna_dCompiler_dElab_dData_delabDataBodies decls) dtb__65) dtb__67) dtb__68) C_Base_dList_dList_Base_dList_dNil)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))))

let rec v_Vuna_dCompiler_dElab_dData_dctorFieldGo = (fun arity -> (fun t -> (fun acc -> (match t with
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTPi (dtb__69, dtb__70, dtb__71, dtb__72, dtb__73) -> (if ((bi_gt_int arity) 0) then (((v_Vuna_dCompiler_dElab_dData_dctorFieldGo ((bi_sub arity) 1)) dtb__73) acc) else (((v_Vuna_dCompiler_dElab_dData_dctorFieldGo 0) dtb__73) (C_Base_dList_dList_Base_dList_dCons (dtb__72, acc))))
  | _ -> (v_Base_dList_dreverse acc)
))))

let v_Vuna_dCompiler_dElab_dData_dctorFieldTerms = (fun arity -> (fun ty -> (((v_Vuna_dCompiler_dElab_dData_dctorFieldGo arity) ty) C_Base_dList_dList_Base_dList_dNil)))

let rec v_Vuna_dCompiler_dElab_dData_dtermUsesVar = (fun depth -> (fun t -> (match t with
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTVar (dtb__74, dtb__75) -> ((bi_eq_int dtb__75) depth)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTMeta (dtb__76) -> false
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTGlobal (dtb__77) -> false
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTType (dtb__78) -> false
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTPi (dtb__79, dtb__80, dtb__81, dtb__82, dtb__83) -> (if ((v_Vuna_dCompiler_dElab_dData_dtermUsesVar depth) dtb__82) then true else ((v_Vuna_dCompiler_dElab_dData_dtermUsesVar ((bi_add depth) 1)) dtb__83))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTLam (dtb__84, dtb__85, dtb__86) -> ((v_Vuna_dCompiler_dElab_dData_dtermUsesVar ((bi_add depth) 1)) dtb__86)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp (dtb__87, dtb__88, dtb__89) -> (if ((v_Vuna_dCompiler_dElab_dData_dtermUsesVar depth) dtb__87) then true else ((v_Vuna_dCompiler_dElab_dData_dtermUsesVar depth) dtb__88))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCon (dtb__90, dtb__91) -> ((v_Vuna_dCompiler_dElab_dData_dtermUsesVarArgs depth) dtb__91)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCase (dtb__92, dtb__93) -> (if ((v_Vuna_dCompiler_dElab_dData_dtermUsesVar depth) dtb__92) then true else ((v_Vuna_dCompiler_dElab_dData_dtermUsesVarAlts depth) dtb__93))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTInt (dtb__94) -> false
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTStr (dtb__95) -> false
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTBool (dtb__96) -> false
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTIf (dtb__97, dtb__98, dtb__99) -> (if (if ((v_Vuna_dCompiler_dElab_dData_dtermUsesVar depth) dtb__97) then true else ((v_Vuna_dCompiler_dElab_dData_dtermUsesVar depth) dtb__98)) then true else ((v_Vuna_dCompiler_dElab_dData_dtermUsesVar depth) dtb__99))
  | _ -> failwith "DT: impossible branch"
)))
and v_Vuna_dCompiler_dElab_dData_dtermUsesVarArgs = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__100, dtb__101) -> (match dtb__100 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__102, dtb__103) -> (if ((v_Vuna_dCompiler_dElab_dData_dtermUsesVar mc0) dtb__102) then true else ((v_Vuna_dCompiler_dElab_dData_dtermUsesVarArgs mc0) dtb__101))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> false
  | _ -> failwith "DT: impossible branch"
)))
and v_Vuna_dCompiler_dElab_dData_dtermUsesVarAlts = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__104, dtb__105) -> (if ((v_Vuna_dCompiler_dElab_dData_dtermUsesVar ((bi_add mc0) (v_Base_dList_dlength (v_Vuna_dCompiler_dCore_dTerm_dcaseAltBinders dtb__104)))) (v_Vuna_dCompiler_dCore_dTerm_dcaseAltBody dtb__104)) then true else ((v_Vuna_dCompiler_dElab_dData_dtermUsesVarAlts mc0) dtb__105))
  | C_Base_dList_dList_Base_dList_dNil -> false
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dElab_dData_dusedInTeleGo = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__106, dtb__107) -> (if ((v_Vuna_dCompiler_dElab_dData_dtermUsesVar mc0) dtb__106) then true else ((v_Vuna_dCompiler_dElab_dData_dusedInTeleGo mc0) dtb__107))
  | C_Base_dList_dList_Base_dList_dNil -> false
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dElab_dData_dusedInTele = (fun i -> (fun arity -> (fun k -> (fun ts -> ((v_Vuna_dCompiler_dElab_dData_dusedInTeleGo ((bi_add k) arity)) ts)))))

let v_Vuna_dCompiler_dElab_dData_dusedInCtor = (fun i -> (fun arity -> (fun c -> ((((v_Vuna_dCompiler_dElab_dData_dusedInTele i) arity) 0) ((v_Vuna_dCompiler_dElab_dData_dctorFieldTerms arity) (v_Vuna_dCompiler_dElab_dTypes_ddtCtorType c))))))

let rec v_Vuna_dCompiler_dElab_dData_dusedInCtors = (fun mc0 -> (fun mc1 -> (fun mc2 -> (match mc2 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__108, dtb__109) -> (if (((v_Vuna_dCompiler_dElab_dData_dusedInCtor mc0) mc1) dtb__108) then true else (((v_Vuna_dCompiler_dElab_dData_dusedInCtors mc0) mc1) dtb__109))
  | C_Base_dList_dList_Base_dList_dNil -> false
  | _ -> failwith "DT: impossible branch"
))))

let v_Vuna_dCompiler_dElab_dData_dparamUsedInFieldTys = (fun dd -> (fun i -> (((v_Vuna_dCompiler_dElab_dData_dusedInCtors i) (v_Base_dList_dlength (v_Vuna_dCompiler_dElab_dTypes_ddtDataParams dd))) (v_Vuna_dCompiler_dElab_dTypes_ddtDataCtors dd))))

let rec v_Vuna_dCompiler_dElab_dData_deraseMaskGo = (fun mc0 -> (fun mc1 -> (fun mc2 -> (fun mc3 -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__110, dtb__111) -> ((((v_Vuna_dCompiler_dElab_dData_deraseMaskGo mc0) dtb__111) ((bi_add mc2) 1)) (C_Base_dList_dList_Base_dList_dCons ((v_Base_dBool_dnot ((v_Vuna_dCompiler_dElab_dData_dparamUsedInFieldTys mc0) mc2)), mc3)))
  | C_Base_dList_dList_Base_dList_dNil -> (v_Base_dList_dreverse mc3)
  | _ -> failwith "DT: impossible branch"
)))))

let v_Vuna_dCompiler_dElab_dData_deraseIndexMask = (fun dd -> ((((v_Vuna_dCompiler_dElab_dData_deraseMaskGo dd) (v_Vuna_dCompiler_dElab_dTypes_ddtDataParams dd)) 0) C_Base_dList_dList_Base_dList_dNil))

let rec v_Vuna_dCompiler_dElab_dData_dcandidateNames = (fun mc0 -> (fun mc1 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__112, dtb__113) -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__114, dtb__115) -> (match dtb__112 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__116, dtb__117) -> (if dtb__114 then (C_Base_dList_dList_Base_dList_dCons (dtb__116, ((v_Vuna_dCompiler_dElab_dData_dcandidateNames dtb__113) dtb__115))) else ((v_Vuna_dCompiler_dElab_dData_dcandidateNames dtb__113) dtb__115))
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
  | C_Base_dList_dList_Base_dList_dCons (dtb__118, dtb__119) -> (C_Base_dList_dList_Base_dList_dCons ((v_Vuna_dCompiler_dElab_dData_dcandidateOf dtb__118), (v_Vuna_dCompiler_dElab_dData_dindexErasureCandidates dtb__119)))
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dList_dList_Base_dList_dNil
  | _ -> failwith "DT: impossible branch"
))
