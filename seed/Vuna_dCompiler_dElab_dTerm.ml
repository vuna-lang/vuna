open Vuna_runtime
open Vuna_builtins
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
open Vuna_dCompiler_dFrontend_dAst
open Vuna_dCompiler_dFrontend_dLexer
open Vuna_dCompiler_dFrontend_dParser
open Vuna_dCompiler_dLoader_dModules
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
let rec v_Vuna_dCompiler_dElab_dTerm_dallImplicitPrefix = (fun t -> (match t with
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTPi (dtb__0, dtb__1, dtb__2, dtb__3, dtb__4) -> (if dtb__1 then (v_Vuna_dCompiler_dElab_dTerm_dallImplicitPrefix dtb__4) else false)
  | _ -> true
))

let rec v_Vuna_dCompiler_dElab_dTerm_dinstantiateAllImplicit = (fun ctx -> (fun ec -> (fun head -> (fun ty -> (fun acc -> (match ((v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) ty) with
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVPi (dtb__5, dtb__6, dtb__7, dtb__8, dtb__9) -> (if dtb__6 then ((fun m -> (match ((v_Vuna_dCompiler_dElab_dTypes_dnewMeta ctx) ec) with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__10, dtb__11) -> (((((v_Vuna_dCompiler_dElab_dTerm_dinstantiateAllImplicit ctx) dtb__11) head) ((v_Vuna_dCompiler_dCore_dEval_dapplyClosure dtb__9) (C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVMeta (m, C_Base_dList_dList_Nil)))) (C_Base_dList_dList_Cons ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__10, ((v_Vuna_dCompiler_dElab_dMeta_dbinderRig true) dtb__8))), acc)))
  | _ -> failwith "DT: impossible branch"
)) (v_Vuna_dCompiler_dElab_dTypes_decNext ec)) else (C_Base_dPair_dPair_Base_dPair_dPair (((v_Vuna_dCompiler_dElab_dMeta_dfoldAppTerms head) (v_Base_dList_dreverse acc)), (C_Base_dPair_dPair_Base_dPair_dPair (ty, ec)))))
  | _ -> (C_Base_dPair_dPair_Base_dPair_dPair (((v_Vuna_dCompiler_dElab_dMeta_dfoldAppTerms head) (v_Base_dList_dreverse acc)), (C_Base_dPair_dPair_Base_dPair_dPair (ty, ec))))
))))))

let v_Vuna_dCompiler_dElab_dTerm_dinferVarRef = (fun globals -> (fun ctx -> (fun ec -> (fun name -> (fun sp -> (match ((v_Vuna_dCompiler_dElab_dTypes_dctxLookup name) ctx) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__12) -> (match dtb__12 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__13, dtb__14) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTVar (name, dtb__13)), (C_Base_dPair_dPair_Base_dPair_dPair ((((v_Vuna_dCompiler_dElab_dTypes_dvarTypeValue ctx) dtb__13) dtb__14), ec))))))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (match ((v_Vuna_dCompiler_dElab_dMeta_ddtCtorLookup name) (v_Vuna_dCompiler_dElab_dTypes_decDatas ec)) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__15) -> ((((v_Vuna_dCompiler_dElab_dMeta_dinferCtorRef ec) ctx) name) (v_Vuna_dCompiler_dElab_dTypes_ddtCtorType dtb__15))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (match ((v_Vuna_dCompiler_dElab_dMeta_dshortBoolFamily ec) name) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__16) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTGlobal (dtb__16)), (C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVType ((v_Vuna_dCompiler_dCore_dTerm_dlevelZero ()))), ec))))))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (match ((v_Vuna_dCompiler_dElab_dMeta_dglobalLookup name) globals) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__17) -> (if (v_Vuna_dCompiler_dElab_dTerm_dallImplicitPrefix dtb__17) then ((fun inst -> (C_Base_dResult_dResult_Base_dResult_dOk (inst))) (((((v_Vuna_dCompiler_dElab_dTerm_dinstantiateAllImplicit ctx) ec) ((v_Vuna_dCompiler_dElab_dMeta_dctorRefTerm (v_Vuna_dCompiler_dElab_dTypes_decDatas ec)) name)) ((v_Vuna_dCompiler_dCore_dEval_deval C_Base_dList_dList_Nil) dtb__17)) C_Base_dList_dList_Nil)) else (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (((v_Vuna_dCompiler_dElab_dMeta_dctorRefTerm (v_Vuna_dCompiler_dElab_dTypes_decDatas ec)) name), (C_Base_dPair_dPair_Base_dPair_dPair (((v_Vuna_dCompiler_dCore_dEval_deval C_Base_dList_dList_Nil) dtb__17), ec)))))))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((v_Vuna_dCompiler_dElab_dTypes_derrAt sp) ((bi_concat "[TC_UnknownName] DT: unknown name ") name))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))))

let v_Vuna_dCompiler_dElab_dTerm_dwhereBindingName = (fun pat -> (match pat with
  | C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPVar (dtb__18, dtb__19) -> dtb__18
  | _ -> "_"
))

let rec v_Vuna_dCompiler_dElab_dTerm_dcheckWhereSigs = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Cons (dtb__20, dtb__21) -> (match (v_Base_dPair_dsecondOf dtb__20) with
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEAnn (dtb__22, dtb__23, dtb__24) -> (v_Vuna_dCompiler_dElab_dTerm_dcheckWhereSigs dtb__21)
  | _ -> ((fun name -> ((v_Vuna_dCompiler_dElab_dTypes_derrAt (v_Vuna_dCompiler_dFrontend_dAst_dpatSpan (v_Base_dPair_dfirstOf dtb__20))) ((bi_concat "[TC_WhereNeedsSig] DT: where binding `") ((bi_concat name) ((bi_concat "` needs a type signature (write `") ((bi_concat name) " : <type>` before the clause)")))))) (v_Vuna_dCompiler_dElab_dTerm_dwhereBindingName (v_Base_dPair_dfirstOf dtb__20)))
)
  | C_Base_dList_dList_Nil -> (C_Base_dResult_dResult_Base_dResult_dOk (0))
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dTerm_delabConAlt = (fun fb -> (fun globals -> (fun ctx -> (fun ec -> (fun dd -> (fun idxs -> (fun scrutVal -> (fun expected -> (fun cname -> (fun args -> (fun psp -> (fun body -> (match ((v_Vuna_dCompiler_dElab_dMeta_dfindCtorIn cname) (v_Vuna_dCompiler_dElab_dTypes_ddtDataCtors dd)) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((v_Vuna_dCompiler_dElab_dTypes_derrAt psp) ((bi_concat "[TC_UnknownConstructorInCase] DT: unknown constructor ") ((bi_concat cname) ((bi_concat " in case ") (v_Vuna_dCompiler_dElab_dTypes_ddtDataName dd)))))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__25) -> ((v_Base_dResult_dandThen (((v_Vuna_dCompiler_dElab_dCase_dbindCtorTele ctx) (v_Vuna_dCompiler_dElab_dTypes_ddtCtorType dtb__25)) args)) (fun p -> (match p with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__26, dtb__27) -> (match dtb__27 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__28, dtb__29) -> (match dtb__29 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__30, dtb__31) -> (if (v_Vuna_dCompiler_dElab_dMeta_dnonEmpty dtb__31) then ((v_Vuna_dCompiler_dElab_dTypes_derrAt psp) ((bi_concat "[TC_BranchTooManyArgs] DT: branch for constructor ") ((bi_concat cname) " has too many arguments"))) else ((v_Base_dResult_dandThen ((((((v_Vuna_dCompiler_dElab_dCase_dunifyIdxList ec) C_Base_dList_dList_Nil) (v_Vuna_dCompiler_dElab_dTypes_dctxDepth dtb__26)) (v_Vuna_dCompiler_dCore_dTerm_ddefaultFuel ())) ((v_Vuna_dCompiler_dElab_dCase_dctorResultValsIn dtb__26) dtb__25)) ((v_Base_dList_dmap ((v_Vuna_dCompiler_dElab_dTypes_drefineValue C_Base_dList_dList_Nil) (v_Vuna_dCompiler_dCore_dTerm_ddefaultFuel ()))) idxs))) (fun refsIdx -> ((v_Base_dResult_dandThen (((((v_Vuna_dCompiler_dElab_dCase_dreflectScrutinee ec) (v_Vuna_dCompiler_dElab_dTypes_dctxDepth dtb__26)) refsIdx) ((v_Vuna_dCompiler_dElab_dCase_dctorValueIn dtb__26) dtb__25)) scrutVal)) (fun refs2 -> ((fun refinedExpected -> ((fun branchCtx2 -> ((fun body2 -> (match (((((v_Vuna_dCompiler_dElab_dTerm_dcheckE globals) branchCtx2) ec) body2) refinedExpected) with
  | C_Base_dResult_dResult_Base_dResult_dErr (dtb__32) -> (if ((v_Vuna_dCompiler_dElab_dCase_dctxHasEmptyBinder ec) branchCtx2) then ((v_Vuna_dCompiler_dElab_dTypes_derrAt psp) "[TC_ImpossibleBranchEmptyCtx] DT: this branch is impossible (its context contains an empty inductive family)") else (C_Base_dResult_dResult_Base_dResult_dErr (dtb__32)))
  | C_Base_dResult_dResult_Base_dResult_dOk (dtb__33) -> (match dtb__33 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__34, dtb__35) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dCore_dTerm_dCaseAlt_Vuna_dCompiler_dCore_dTerm_dCaseAlt (cname, dtb__28, dtb__34)), dtb__35))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) (((v_Vuna_dCompiler_dElab_dCase_dfoldPending fb) dtb__30) body))) ((v_Vuna_dCompiler_dElab_dTypes_dctxRefine dtb__26) refs2))) (((v_Vuna_dCompiler_dElab_dTypes_drefineValue refs2) (v_Vuna_dCompiler_dCore_dTerm_ddefaultFuel ())) expected)))))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))))))))))))
and v_Vuna_dCompiler_dElab_dTerm_delabCaseAlts = (fun mc0 -> (fun mc1 -> (fun mc2 -> (fun mc3 -> (fun mc4 -> (fun mc5 -> (fun mc6 -> (fun mc7 -> (fun mc8 -> (fun mc9 -> (match mc8 with
  | C_Base_dList_dList_Cons (dtb__36, dtb__37) -> (match dtb__36 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__38, dtb__39) -> (match dtb__38 with
  | C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPCon (dtb__40, dtb__41, dtb__42) -> ((v_Base_dResult_dandThen ((((((((((((v_Vuna_dCompiler_dElab_dTerm_delabConAlt (v_Vuna_dCompiler_dElab_dMeta_dfindCatchAllBody dtb__37)) mc0) mc1) mc2) mc4) mc5) mc6) mc7) dtb__40) dtb__41) dtb__42) dtb__39)) (fun p -> (match p with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__43, dtb__44) -> ((((((((((v_Vuna_dCompiler_dElab_dTerm_delabCaseAlts mc0) mc1) dtb__44) mc3) mc4) mc5) mc6) mc7) dtb__37) (C_Base_dList_dList_Cons (dtb__43, mc9)))
  | _ -> failwith "DT: impossible branch"
)))
  | C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPVar (dtb__45, dtb__46) -> ((((((((((((v_Vuna_dCompiler_dElab_dTerm_delabCatchAll mc0) mc1) mc2) mc3) mc4) mc5) mc7) dtb__37) mc9) dtb__39) dtb__45) dtb__46)
  | C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPWild (dtb__47) -> ((((((((((((v_Vuna_dCompiler_dElab_dTerm_delabCatchAll mc0) mc1) mc2) mc3) mc4) mc5) mc7) dtb__37) mc9) dtb__39) "_") dtb__47)
  | _ -> ((v_Vuna_dCompiler_dElab_dTypes_derrAt (v_Vuna_dCompiler_dFrontend_dAst_dpatSpan dtb__38)) "[TC_OnlyCtorPatterns] DT: only constructor patterns are supported in case (M14)")
)
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Nil -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((v_Base_dList_dreverse mc9), mc2))))
  | _ -> failwith "DT: impossible branch"
)))))))))))
and v_Vuna_dCompiler_dElab_dTerm_delabCatchAll = (fun globals -> (fun ctx -> (fun ec -> (fun scrutTy -> (fun dd -> (fun idxs -> (fun expected -> (fun rest -> (fun acc -> (fun body -> (fun pname -> (fun psp -> ((fun ctx2 -> (if (v_Vuna_dCompiler_dElab_dMeta_dnonEmpty rest) then ((v_Vuna_dCompiler_dElab_dTypes_derrAt psp) "[TC_CatchAllNotLast] DT: the catch-all branch must be the last one") else ((v_Base_dResult_dandThen (((((v_Vuna_dCompiler_dElab_dTerm_dcheckE globals) ctx2) ec) body) expected)) (fun pb -> (match pb with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__48, dtb__49) -> ((fun binds -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((v_Base_dList_dreverse (C_Base_dList_dList_Cons ((C_Vuna_dCompiler_dCore_dTerm_dCaseAlt_Vuna_dCompiler_dCore_dTerm_dCaseAlt ("", binds, dtb__48)), acc))), dtb__49))))) (if ((bi_eq_str pname) "_") then C_Base_dList_dList_Nil else (C_Base_dList_dList_Cons ((C_Base_dPair_dPair_Base_dPair_dPair (pname, ((v_Vuna_dCompiler_dElab_dMeta_dbinderRig false) scrutTy))), C_Base_dList_dList_Nil))))
  | _ -> failwith "DT: impossible branch"
))))) (if ((bi_eq_str pname) "_") then ctx else (((v_Vuna_dCompiler_dElab_dTypes_dctxBindValue pname) scrutTy) ctx)))))))))))))))
and v_Vuna_dCompiler_dElab_dTerm_dcheckCase = (fun globals -> (fun ctx -> (fun ec -> (fun scrut -> (fun alts -> (fun expected -> (fun sp -> (if (v_Vuna_dCompiler_dElab_dCase_dhasDupNames (v_Vuna_dCompiler_dElab_dCase_daltNames alts)) then (((((((v_Vuna_dCompiler_dElab_dTerm_dcheckCaseDedup globals) ctx) ec) scrut) alts) expected) sp) else (if (if (v_Vuna_dCompiler_dElab_dCase_danyNestedPat alts) then (v_Vuna_dCompiler_dElab_dCase_dhasVarCatchAll alts) else false) then (((((((v_Vuna_dCompiler_dElab_dTerm_dcheckCaseDedup globals) ctx) ec) scrut) alts) expected) sp) else ((v_Base_dResult_dandThen ((((v_Vuna_dCompiler_dElab_dTerm_dinferE globals) ctx) ec) scrut)) (fun ps -> (match ps with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__50, dtb__51) -> (match dtb__51 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__52, dtb__53) -> ((((((((v_Vuna_dCompiler_dElab_dTerm_dcheckCaseFam globals) ctx) dtb__53) dtb__50) dtb__52) alts) expected) sp)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))))))))))
and v_Vuna_dCompiler_dElab_dTerm_dcheckCaseDedup = (fun globals -> (fun ctx -> (fun ec -> (fun scrut -> (fun alts -> (fun expected -> (fun sp -> (if (v_Vuna_dCompiler_dElab_dCase_dcatchAllNotLast alts) then ((v_Vuna_dCompiler_dElab_dTypes_derrAt sp) "[TC_CatchAllNotLast] DT: the catch-all branch must be the last one") else ((fun name -> ((fun clauses -> ((v_Base_dResult_dandThen (((v_Vuna_dCompiler_dElab_dMatch_dmultiToCaseExpr (v_Vuna_dCompiler_dElab_dMeta_dctorFamilyTable ec)) clauses) name)) (fun bodyExpr -> (((((v_Vuna_dCompiler_dElab_dTerm_dcheckE globals) ctx) ec) (C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dELet ((C_Base_dList_dList_Cons ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPVar (name, sp)), scrut)), C_Base_dList_dList_Nil)), bodyExpr, false, sp))) expected)))) ((v_Base_dList_dmap (fun alt -> (C_Base_dPair_dPair_Base_dPair_dPair ((C_Base_dList_dList_Cons ((v_Base_dPair_dfirstOf alt), C_Base_dList_dList_Nil)), (v_Base_dPair_dsecondOf alt))))) alts))) "nd_scrut")))))))))
and v_Vuna_dCompiler_dElab_dTerm_dcheckCaseFam = (fun globals -> (fun ctx -> (fun ec -> (fun scrutTerm -> (fun scrutTy -> (fun alts -> (fun expected -> (fun sp -> (match ((v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) scrutTy) with
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral (dtb__54) -> (match dtb__54 with
  | C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNGlobal (dtb__55, dtb__56) -> (if (if (v_Vuna_dCompiler_dElab_dMeta_disBoolBaseName dtb__55) then ((bi_eq_generic dtb__56) C_Base_dList_dList_Nil) else false) then (((((((v_Vuna_dCompiler_dElab_dTerm_dcheckBoolCase globals) ctx) ec) scrutTerm) alts) expected) sp) else (if ((bi_eq_str dtb__55) "Int") then ((((((((v_Vuna_dCompiler_dElab_dTerm_dcheckLitCase globals) ctx) ec) scrutTerm) "Int") alts) expected) sp) else (if ((bi_eq_str dtb__55) "String") then ((((((((v_Vuna_dCompiler_dElab_dTerm_dcheckLitCase globals) ctx) ec) scrutTerm) "String") alts) expected) sp) else ((((((((((v_Vuna_dCompiler_dElab_dTerm_dcheckCaseOf globals) ctx) ec) scrutTerm) scrutTy) dtb__55) dtb__56) alts) expected) sp))))
  | _ -> ((v_Vuna_dCompiler_dElab_dTypes_derrAt sp) "[TC_NotInductiveFamily] DT: case scrutinee is not an inductive family")
)
  | _ -> ((v_Vuna_dCompiler_dElab_dTypes_derrAt sp) "[TC_NotInductiveFamily] DT: case scrutinee is not an inductive family")
)))))))))
and v_Vuna_dCompiler_dElab_dTerm_dcheckBoolCase = (fun globals -> (fun ctx -> (fun ec -> (fun scrutTerm -> (fun alts -> (fun expected -> (fun sp -> ((v_Base_dResult_dandThen (((((((v_Vuna_dCompiler_dElab_dTerm_dboolAlt globals) ctx) ec) alts) "True") expected) sp)) (fun p -> (match p with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__57, dtb__58) -> (match dtb__58 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__59, dtb__60) -> (match dtb__59 with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__61) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTIf (scrutTerm, dtb__57, dtb__61)), dtb__60))))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((v_Base_dResult_dandThen (((((((v_Vuna_dCompiler_dElab_dTerm_dboolAlt globals) ctx) ec) alts) "False") expected) sp)) (fun q -> (match q with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__62, dtb__63) -> (match dtb__63 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__64, dtb__65) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTIf (scrutTerm, dtb__57, dtb__62)), dtb__65))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))))))))
and v_Vuna_dCompiler_dElab_dTerm_dboolAlt = (fun globals -> (fun ctx -> (fun ec -> (fun alts -> (fun target -> (fun expected -> (fun sp -> ((((((((v_Vuna_dCompiler_dElab_dTerm_dboolAltGo globals) ctx) ec) alts) target) expected) sp) C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing))))))))
and v_Vuna_dCompiler_dElab_dTerm_dboolAltGo = (fun mc0 -> (fun mc1 -> (fun mc2 -> (fun mc3 -> (fun mc4 -> (fun mc5 -> (fun mc6 -> (fun mc7 -> (match mc3 with
  | C_Base_dList_dList_Cons (dtb__66, dtb__67) -> (match dtb__66 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__68, dtb__69) -> (match dtb__68 with
  | C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPCon (dtb__70, dtb__71, dtb__72) -> (if ((bi_eq_str dtb__70) mc4) then ((v_Base_dResult_dandThen (((((v_Vuna_dCompiler_dElab_dTerm_dcheckE mc0) mc1) mc2) dtb__69) mc5)) (fun p -> (match p with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__73, dtb__74) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__73, (C_Base_dPair_dPair_Base_dPair_dPair (mc7, dtb__74))))))
  | _ -> failwith "DT: impossible branch"
))) else ((((((((v_Vuna_dCompiler_dElab_dTerm_dboolAltGo mc0) mc1) mc2) dtb__67) mc4) mc5) mc6) mc7))
  | C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPVar (dtb__75, dtb__76) -> ((v_Base_dResult_dandThen (((((v_Vuna_dCompiler_dElab_dTerm_dcheckE mc0) mc1) mc2) dtb__69) mc5)) (fun p -> (match p with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__77, dtb__78) -> ((((((((v_Vuna_dCompiler_dElab_dTerm_dboolAltGo mc0) mc1) mc2) dtb__67) mc4) mc5) mc6) (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__77)))
  | _ -> failwith "DT: impossible branch"
)))
  | C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPWild (dtb__79) -> ((v_Base_dResult_dandThen (((((v_Vuna_dCompiler_dElab_dTerm_dcheckE mc0) mc1) mc2) dtb__69) mc5)) (fun p -> (match p with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__80, dtb__81) -> ((((((((v_Vuna_dCompiler_dElab_dTerm_dboolAltGo mc0) mc1) mc2) dtb__67) mc4) mc5) mc6) (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__80)))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> ((v_Vuna_dCompiler_dElab_dTypes_derrAt (v_Vuna_dCompiler_dFrontend_dAst_dpatSpan dtb__68)) "[TC_BoolCaseRestriction] DT: case on Bool only accepts True / False / variable patterns (M19)")
)
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Nil -> (match mc7 with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__82) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__82, (C_Base_dPair_dPair_Base_dPair_dPair (C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing, mc2))))))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (if (v_Vuna_dCompiler_dElab_dTypes_decTrusted mc2) then (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTInt (0)), (C_Base_dPair_dPair_Base_dPair_dPair (C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing, mc2)))))) else ((v_Vuna_dCompiler_dElab_dTypes_derrAt mc6) ((bi_concat "[TC_NotExhaustive] DT: case is not exhaustive: missing ") mc4)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))))))))
and v_Vuna_dCompiler_dElab_dTerm_dcheckLitCase = (fun globals -> (fun ctx -> (fun ec -> (fun scrutTerm -> (fun tyName -> (fun alts -> (fun expected -> (fun sp -> ((v_Base_dResult_dandThen ((((((((v_Vuna_dCompiler_dElab_dTerm_dcheckLitAlts globals) ctx) ec) scrutTerm) tyName) alts) expected) sp)) (fun p -> (match p with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__83, dtb__84) -> (match dtb__84 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__85, dtb__86) -> (if dtb__85 then (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__83, dtb__86)))) else ((v_Vuna_dCompiler_dElab_dTypes_derrAt sp) "[TC_IntStringCaseNeedsFallback] DT: case on Int / String needs a variable or wildcard branch as fallback (M19)"))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))))))))))
and v_Vuna_dCompiler_dElab_dTerm_dcheckLitAlts = (fun mc0 -> (fun mc1 -> (fun mc2 -> (fun mc3 -> (fun mc4 -> (fun mc5 -> (fun mc6 -> (fun mc7 -> (match mc5 with
  | C_Base_dList_dList_Cons (dtb__87, dtb__88) -> (match dtb__87 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__89, dtb__90) -> (match dtb__89 with
  | C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPInt (dtb__91, dtb__92) -> ((((((((((v_Vuna_dCompiler_dElab_dTerm_dlitAltStep mc0) mc1) mc2) mc3) mc4) (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTInt (dtb__91))) dtb__90) dtb__88) mc6) mc7)
  | C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPStr (dtb__93, dtb__94) -> ((((((((((v_Vuna_dCompiler_dElab_dTerm_dlitAltStep mc0) mc1) mc2) mc3) mc4) (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTStr (dtb__93))) dtb__90) dtb__88) mc6) mc7)
  | C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPVar (dtb__95, dtb__96) -> ((v_Base_dResult_dandThen (((((((((v_Vuna_dCompiler_dElab_dTerm_dcheckLitBoundVar mc0) mc1) mc2) mc3) mc4) dtb__95) dtb__90) mc6) mc7)) (fun p -> (match p with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__97, dtb__98) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__97, (C_Base_dPair_dPair_Base_dPair_dPair (true, dtb__98))))))
  | _ -> failwith "DT: impossible branch"
)))
  | C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPWild (dtb__99) -> ((v_Base_dResult_dandThen (((((v_Vuna_dCompiler_dElab_dTerm_dcheckE mc0) mc1) mc2) dtb__90) mc6)) (fun p -> (match p with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__100, dtb__101) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__100, (C_Base_dPair_dPair_Base_dPair_dPair (true, dtb__101))))))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> ((v_Vuna_dCompiler_dElab_dTypes_derrAt (v_Vuna_dCompiler_dFrontend_dAst_dpatSpan dtb__89)) "[TC_IntStringCaseRestriction] DT: case on Int / String only accepts literals / variable patterns (M19)")
)
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Nil -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTIf ((C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTBool (false)), (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTInt (0)), (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTInt (0)))), (C_Base_dPair_dPair_Base_dPair_dPair (false, mc2))))))
  | _ -> failwith "DT: impossible branch"
)))))))))
and v_Vuna_dCompiler_dElab_dTerm_dlitAltStep = (fun globals -> (fun ctx -> (fun ec -> (fun scrutTerm -> (fun tyName -> (fun litTerm -> (fun body -> (fun rest -> (fun expected -> (fun sp -> ((v_Base_dResult_dandThen (((((v_Vuna_dCompiler_dElab_dTerm_dcheckE globals) ctx) ec) body) expected)) (fun p -> (match p with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__102, dtb__103) -> ((v_Base_dResult_dandThen ((((((((v_Vuna_dCompiler_dElab_dTerm_dcheckLitAlts globals) ctx) dtb__103) scrutTerm) tyName) rest) expected) sp)) (fun q -> (match q with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__104, dtb__105) -> (match dtb__105 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__106, dtb__107) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTIf ((C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp ((C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp ((C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTGlobal ((v_Vuna_dCompiler_dElab_dMeta_dlitEqName tyName))), scrutTerm, C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRig1)), litTerm, C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRig1)), dtb__102, dtb__104)), (C_Base_dPair_dPair_Base_dPair_dPair (dtb__106, dtb__107))))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))))))))))))
and v_Vuna_dCompiler_dElab_dTerm_dcheckLitBoundVar = (fun globals -> (fun ctx -> (fun ec -> (fun scrutTerm -> (fun tyName -> (fun name -> (fun body -> (fun expected -> (fun sp -> ((fun ctx2 -> ((fun rig -> ((v_Base_dResult_dandThen (((((v_Vuna_dCompiler_dElab_dTerm_dcheckE globals) ctx2) ec) body) expected)) (fun p -> (match p with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__108, dtb__109) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp ((C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTLam (name, rig, dtb__108)), scrutTerm, rig)), dtb__109))))
  | _ -> failwith "DT: impossible branch"
)))) ((v_Vuna_dCompiler_dElab_dMeta_dbinderRig false) (C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral ((C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNGlobal (tyName, C_Base_dList_dList_Nil))))))) (((v_Vuna_dCompiler_dElab_dTypes_dctxBindValue name) (C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral ((C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNGlobal (tyName, C_Base_dList_dList_Nil))))) ctx)))))))))))
and v_Vuna_dCompiler_dElab_dTerm_dcheckCaseOf = (fun globals -> (fun ctx -> (fun ec -> (fun scrutTerm -> (fun scrutTy -> (fun fam -> (fun idxs -> (fun alts -> (fun expected -> (fun sp -> (match ((v_Vuna_dCompiler_dElab_dMeta_ddtDataLookup fam) (v_Vuna_dCompiler_dElab_dTypes_decDatas ec)) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((v_Vuna_dCompiler_dElab_dTypes_derrAt sp) "[TC_NotInductiveFamily] DT: case scrutinee is not an inductive family")
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__110) -> (if (v_Vuna_dCompiler_dElab_dCase_dhasDupNames (v_Vuna_dCompiler_dElab_dCase_daltNames alts)) then ((v_Vuna_dCompiler_dElab_dTypes_derrAt sp) "[TC_DuplicateCtorInCase] DT: duplicate constructor in case") else ((v_Base_dResult_dandThen ((((((((((v_Vuna_dCompiler_dElab_dTerm_delabCaseAlts globals) ctx) ec) scrutTy) dtb__110) idxs) ((v_Vuna_dCompiler_dElab_dTypes_devalCtx ctx) scrutTerm)) expected) alts) C_Base_dList_dList_Nil)) (fun p -> (match p with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__111, dtb__112) -> (((((((((v_Vuna_dCompiler_dElab_dCase_dcheckCaseDone dtb__112) ctx) dtb__110) idxs) alts) expected) sp) scrutTerm) dtb__111)
  | _ -> failwith "DT: impossible branch"
))))
  | _ -> failwith "DT: impossible branch"
)))))))))))
and v_Vuna_dCompiler_dElab_dTerm_dinferCaseE = (fun globals -> (fun ctx -> (fun ec -> (fun scrut -> (fun alts -> (fun sp -> ((fun pmeta -> (match pmeta with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__113, dtb__114) -> ((fun metaTy -> ((v_Base_dResult_dandThen (((((((v_Vuna_dCompiler_dElab_dTerm_dcheckCase globals) ctx) dtb__114) scrut) alts) metaTy) sp)) (fun p -> (match p with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__115, dtb__116) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__115, (C_Base_dPair_dPair_Base_dPair_dPair (metaTy, dtb__116))))))
  | _ -> failwith "DT: impossible branch"
)))) ((v_Vuna_dCompiler_dElab_dTypes_devalCtx ctx) dtb__113))
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dElab_dTypes_dnewMeta ctx) ec))))))))
and v_Vuna_dCompiler_dElab_dTerm_dcheckCondBool = (fun globals -> (fun ctx -> (fun ec -> (fun c -> (fun sp -> (match (((((v_Vuna_dCompiler_dElab_dTerm_dcheckE globals) ctx) ec) c) (C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral ((C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNGlobal ("Bool", C_Base_dList_dList_Nil))))) with
  | C_Base_dResult_dResult_Base_dResult_dOk (dtb__117) -> (C_Base_dResult_dResult_Base_dResult_dOk (dtb__117))
  | C_Base_dResult_dResult_Base_dResult_dErr (dtb__118) -> ((v_Base_dResult_dandThen ((((v_Vuna_dCompiler_dElab_dTerm_dinferE globals) ctx) ec) c)) (fun pc -> (match pc with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__119, dtb__120) -> (match dtb__120 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__121, dtb__122) -> (if (v_Vuna_dCompiler_dElab_dMeta_disBoolType dtb__121) then (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__119, dtb__122)))) else ((v_Vuna_dCompiler_dElab_dTypes_derrAt sp) ((bi_concat "if condition must be Bool (got ") ((bi_concat ((v_Vuna_dCompiler_dCore_dEval_dshowValueAt (v_Vuna_dCompiler_dElab_dTypes_dctxDepth ctx)) dtb__121)) ")"))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
))))))
and v_Vuna_dCompiler_dElab_dTerm_dinferE = (fun globals -> (fun ctx -> (fun ec -> (fun expr -> (match expr with
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (dtb__123, dtb__124) -> (if ((bi_eq_str dtb__123) "Type") then (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTType ((v_Vuna_dCompiler_dCore_dTerm_dlevelZero ()))), (C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVType ((v_Vuna_dCompiler_dCore_dTerm_dlevelSucc (v_Vuna_dCompiler_dCore_dTerm_dlevelZero ())))), ec)))))) else (if ((bi_eq_str dtb__123) "_") then ((v_Vuna_dCompiler_dElab_dTypes_derrAt dtb__124) "[TC_HoleNoExpectedType] DT: cannot infer the type of a hole; give it an expected type") else (((((v_Vuna_dCompiler_dElab_dTerm_dinferVarRef globals) ctx) ec) dtb__123) dtb__124)))
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEInt (dtb__125, dtb__126) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTInt (dtb__125)), (C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral ((C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNGlobal ("Int", C_Base_dList_dList_Nil)))), ec))))))
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEStr (dtb__127, dtb__128) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTStr (dtb__127)), (C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral ((C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNGlobal ("String", C_Base_dList_dList_Nil)))), ec))))))
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEPi (dtb__129, dtb__130, dtb__131, dtb__132, dtb__133) -> ((((((((v_Vuna_dCompiler_dElab_dTerm_dinferPi globals) ctx) ec) dtb__129) dtb__130) dtb__131) dtb__132) dtb__133)
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEApp (dtb__134, dtb__135, dtb__136) -> ((((((v_Vuna_dCompiler_dElab_dTerm_dinferApp globals) ctx) ec) dtb__134) dtb__135) dtb__136)
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dELam (dtb__137, dtb__138, dtb__139) -> ((v_Vuna_dCompiler_dElab_dTypes_derrAt dtb__139) "[TC_LambdaNoSignature] DT: cannot infer the type of a lambda; add a signature")
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEIf (dtb__140, dtb__141, dtb__142, dtb__143) -> ((v_Base_dResult_dandThen (((((v_Vuna_dCompiler_dElab_dTerm_dcheckCondBool globals) ctx) ec) dtb__140) dtb__143)) (fun pc -> (match pc with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__144, dtb__145) -> ((v_Base_dResult_dandThen ((((v_Vuna_dCompiler_dElab_dTerm_dinferE globals) ctx) dtb__145) dtb__141)) (fun pt -> (match pt with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__146, dtb__147) -> (match dtb__147 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__148, dtb__149) -> ((v_Base_dResult_dandThen ((((v_Vuna_dCompiler_dElab_dTerm_dinferE globals) ctx) dtb__149) dtb__142)) (fun pe -> (match pe with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__150, dtb__151) -> (match dtb__151 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__152, dtb__153) -> ((v_Base_dResult_dandThen ((((v_Vuna_dCompiler_dElab_dMeta_dconvEc dtb__153) (v_Vuna_dCompiler_dElab_dTypes_dctxDepth ctx)) dtb__148) dtb__152)) (fun ec4 -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTIf (dtb__144, dtb__146, dtb__150)), (C_Base_dPair_dPair_Base_dPair_dPair (dtb__148, ec4))))))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dELet (dtb__154, dtb__155, dtb__156, dtb__157) -> (((((((v_Vuna_dCompiler_dElab_dTerm_dinferLet globals) ctx) ec) dtb__154) dtb__155) dtb__156) dtb__157)
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dECase (dtb__158, dtb__159, dtb__160) -> ((((((v_Vuna_dCompiler_dElab_dTerm_dinferCaseE globals) ctx) ec) dtb__158) dtb__159) dtb__160)
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEField (dtb__161, dtb__162, dtb__163) -> ((v_Vuna_dCompiler_dElab_dTypes_derrAt dtb__163) "[TC_RecordFieldAccessUnsupported] DT: record field access is not supported yet (M15)")
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dERecord (dtb__164, dtb__165, dtb__166) -> ((v_Vuna_dCompiler_dElab_dTypes_derrAt dtb__166) "[TC_RecordsUnsupported] DT: records are not supported yet (M15)")
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dERecUpdate (dtb__167, dtb__168, dtb__169) -> ((v_Vuna_dCompiler_dElab_dTypes_derrAt dtb__169) "[TC_RecordUpdateUnsupported] DT: record update is not supported yet (M15)")
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEInstSel (dtb__170, dtb__171, dtb__172) -> ((((((v_Vuna_dCompiler_dElab_dDict_dinferInstSel globals) ctx) ec) dtb__170) dtb__171) dtb__172)
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEDo (dtb__173, dtb__174) -> ((v_Vuna_dCompiler_dElab_dTypes_derrAt dtb__174) "[TC_DoUnsupported] DT: do blocks are not supported yet (M19)")
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEAnn (dtb__175, dtb__176, dtb__177) -> ((((((v_Vuna_dCompiler_dElab_dTerm_dinferAnn globals) ctx) ec) dtb__175) dtb__176) dtb__177)
  | _ -> failwith "DT: impossible branch"
)))))
and v_Vuna_dCompiler_dElab_dTerm_dinferAnn = (fun globals -> (fun ctx -> (fun ec -> (fun value -> (fun ty -> (fun sp -> ((v_Base_dResult_dandThen ((((v_Vuna_dCompiler_dElab_dTerm_dcheckType globals) ctx) ec) ty)) (fun pt -> (match pt with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__178, dtb__179) -> (match dtb__179 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__180, dtb__181) -> ((fun tyVal -> ((v_Base_dResult_dandThen (((((v_Vuna_dCompiler_dElab_dTerm_dcheckE globals) ctx) dtb__181) value) tyVal)) (fun p -> (match p with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__182, dtb__183) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__182, (C_Base_dPair_dPair_Base_dPair_dPair (tyVal, dtb__183))))))
  | _ -> failwith "DT: impossible branch"
)))) ((v_Vuna_dCompiler_dCore_dEval_deval (v_Vuna_dCompiler_dElab_dTypes_dctxEnv ctx)) dtb__178))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))))))))
and v_Vuna_dCompiler_dElab_dTerm_dinferPi = (fun globals -> (fun ctx -> (fun ec -> (fun name -> (fun implicit -> (fun dom -> (fun cod -> (fun sp -> ((v_Base_dResult_dandThen ((((v_Vuna_dCompiler_dElab_dTerm_dcheckType globals) ctx) ec) dom)) (fun pd -> (match pd with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__184, dtb__185) -> (match dtb__185 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__186, dtb__187) -> ((fun lvl -> ((fun ctx2 -> ((v_Base_dResult_dandThen ((((v_Vuna_dCompiler_dElab_dTerm_dcheckType globals) ctx2) dtb__187) cod)) (fun pc -> (match pc with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__188, dtb__189) -> (match dtb__189 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__190, dtb__191) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTPi (name, implicit, ((v_Vuna_dCompiler_dElab_dMeta_dbinderRig implicit) ((v_Vuna_dCompiler_dCore_dEval_deval C_Base_dList_dList_Nil) dtb__184)), dtb__184, dtb__188)), (C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVType (((v_Vuna_dCompiler_dCore_dTerm_dlevelMax dtb__186) dtb__190))), dtb__191))))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))) (((v_Vuna_dCompiler_dElab_dTypes_dctxBind name) dtb__184) ctx))) (v_Vuna_dCompiler_dElab_dTypes_dctxDepth ctx))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))))))))))
and v_Vuna_dCompiler_dElab_dTerm_dinferApp = (fun globals -> (fun ctx -> (fun ec -> (fun fn -> (fun args -> (fun sp -> ((fun nd_uscrut -> (match nd_uscrut with
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (dtb__192, dtb__193) -> (if ((bi_eq_str dtb__192) "->") then (match args with
  | C_Base_dList_dList_Cons (dtb__194, dtb__195) -> (match dtb__195 with
  | C_Base_dList_dList_Cons (dtb__196, dtb__197) -> (match dtb__197 with
  | C_Base_dList_dList_Nil -> ((((((((v_Vuna_dCompiler_dElab_dTerm_dinferPi globals) ctx) ec) "_") false) dtb__194) dtb__196) sp)
  | _ -> ((v_Vuna_dCompiler_dElab_dTypes_derrAt sp) "[TC_InvalidArrowType] DT: invalid arrow type")
)
  | _ -> ((v_Vuna_dCompiler_dElab_dTypes_derrAt sp) "[TC_InvalidArrowType] DT: invalid arrow type")
)
  | _ -> ((v_Vuna_dCompiler_dElab_dTypes_derrAt sp) "[TC_InvalidArrowType] DT: invalid arrow type")
) else (if ((bi_eq_str dtb__192) "Type") then (match args with
  | C_Base_dList_dList_Cons (dtb__198, dtb__199) -> (match dtb__198 with
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEInt (dtb__200, dtb__201) -> (match dtb__199 with
  | C_Base_dList_dList_Nil -> (if ((bi_lt_int dtb__200) 0) then ((v_Vuna_dCompiler_dElab_dTypes_derrAt dtb__201) "[TC_UniverseLevelNonNegative] DT: universe level must be non-negative") else (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTType ((v_Vuna_dCompiler_dCore_dTerm_dlevelOfInt dtb__200))), (C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVType ((v_Vuna_dCompiler_dCore_dTerm_dlevelSucc (v_Vuna_dCompiler_dCore_dTerm_dlevelOfInt dtb__200)))), ec)))))))
  | _ -> ((v_Vuna_dCompiler_dElab_dTypes_derrAt dtb__193) "[TC_TypeLevelArg] DT: Type needs exactly one non-negative level (or none)")
)
  | _ -> ((v_Vuna_dCompiler_dElab_dTypes_derrAt dtb__193) "[TC_TypeLevelArg] DT: Type needs exactly one non-negative level (or none)")
)
  | _ -> ((v_Vuna_dCompiler_dElab_dTypes_derrAt dtb__193) "[TC_TypeLevelArg] DT: Type needs exactly one non-negative level (or none)")
) else (match fn with
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (dtb__202, dtb__203) -> (match ((v_Vuna_dCompiler_dElab_dTypes_dctxLookup dtb__202) ctx) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__204) -> ((((((v_Vuna_dCompiler_dElab_dTerm_dinferAppGeneral globals) ctx) ec) fn) args) sp)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (match ((v_Vuna_dCompiler_dElab_dMeta_ddtCtorLookup dtb__202) (v_Vuna_dCompiler_dElab_dTypes_decDatas ec)) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__205) -> ((v_Base_dResult_dandThen ((((((v_Vuna_dCompiler_dElab_dTerm_dinferArgs globals) ctx) ec) ((v_Vuna_dCompiler_dCore_dEval_deval C_Base_dList_dList_Nil) (v_Vuna_dCompiler_dElab_dTypes_ddtCtorType dtb__205))) args) sp)) (fun pa -> (match pa with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__206, dtb__207) -> (match dtb__207 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__208, dtb__209) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((((v_Vuna_dCompiler_dElab_dMeta_dctorAppTerm (v_Vuna_dCompiler_dElab_dTypes_decDatas dtb__209)) (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTGlobal (dtb__202))) dtb__206), (C_Base_dPair_dPair_Base_dPair_dPair (dtb__208, dtb__209))))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (match ((v_Vuna_dCompiler_dElab_dMeta_dglobalLookup dtb__202) globals) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__210) -> ((v_Base_dResult_dandThen ((((((v_Vuna_dCompiler_dElab_dTerm_dspecializeOpApp globals) ctx) ec) dtb__202) args) sp)) (fun mspec -> (match mspec with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__211) -> (C_Base_dResult_dResult_Base_dResult_dOk (dtb__211))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((v_Base_dResult_dandThen ((((((v_Vuna_dCompiler_dElab_dTerm_dinferArgs globals) ctx) ec) ((v_Vuna_dCompiler_dCore_dEval_deval C_Base_dList_dList_Nil) dtb__210)) args) sp)) (fun pa -> (match pa with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__212, dtb__213) -> (match dtb__213 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__214, dtb__215) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((((v_Vuna_dCompiler_dElab_dMeta_dctorAppTerm (v_Vuna_dCompiler_dElab_dTypes_decDatas dtb__215)) (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTGlobal (dtb__202))) dtb__212), (C_Base_dPair_dPair_Base_dPair_dPair (dtb__214, dtb__215))))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((v_Vuna_dCompiler_dElab_dTypes_derrAt dtb__203) ((bi_concat "[TC_UnknownName] DT: unknown name ") dtb__202))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> ((((((v_Vuna_dCompiler_dElab_dTerm_dinferAppGeneral globals) ctx) ec) fn) args) sp)
)))
  | _ -> (match fn with
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (dtb__216, dtb__217) -> (match ((v_Vuna_dCompiler_dElab_dTypes_dctxLookup dtb__216) ctx) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__218) -> ((((((v_Vuna_dCompiler_dElab_dTerm_dinferAppGeneral globals) ctx) ec) fn) args) sp)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (match ((v_Vuna_dCompiler_dElab_dMeta_ddtCtorLookup dtb__216) (v_Vuna_dCompiler_dElab_dTypes_decDatas ec)) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__219) -> ((v_Base_dResult_dandThen ((((((v_Vuna_dCompiler_dElab_dTerm_dinferArgs globals) ctx) ec) ((v_Vuna_dCompiler_dCore_dEval_deval C_Base_dList_dList_Nil) (v_Vuna_dCompiler_dElab_dTypes_ddtCtorType dtb__219))) args) sp)) (fun pa -> (match pa with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__220, dtb__221) -> (match dtb__221 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__222, dtb__223) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((((v_Vuna_dCompiler_dElab_dMeta_dctorAppTerm (v_Vuna_dCompiler_dElab_dTypes_decDatas dtb__223)) (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTGlobal (dtb__216))) dtb__220), (C_Base_dPair_dPair_Base_dPair_dPair (dtb__222, dtb__223))))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (match ((v_Vuna_dCompiler_dElab_dMeta_dglobalLookup dtb__216) globals) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__224) -> ((v_Base_dResult_dandThen ((((((v_Vuna_dCompiler_dElab_dTerm_dspecializeOpApp globals) ctx) ec) dtb__216) args) sp)) (fun mspec -> (match mspec with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__225) -> (C_Base_dResult_dResult_Base_dResult_dOk (dtb__225))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((v_Base_dResult_dandThen ((((((v_Vuna_dCompiler_dElab_dTerm_dinferArgs globals) ctx) ec) ((v_Vuna_dCompiler_dCore_dEval_deval C_Base_dList_dList_Nil) dtb__224)) args) sp)) (fun pa -> (match pa with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__226, dtb__227) -> (match dtb__227 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__228, dtb__229) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((((v_Vuna_dCompiler_dElab_dMeta_dctorAppTerm (v_Vuna_dCompiler_dElab_dTypes_decDatas dtb__229)) (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTGlobal (dtb__216))) dtb__226), (C_Base_dPair_dPair_Base_dPair_dPair (dtb__228, dtb__229))))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((v_Vuna_dCompiler_dElab_dTypes_derrAt dtb__217) ((bi_concat "[TC_UnknownName] DT: unknown name ") dtb__216))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> ((((((v_Vuna_dCompiler_dElab_dTerm_dinferAppGeneral globals) ctx) ec) fn) args) sp)
)
)) fn)))))))
and v_Vuna_dCompiler_dElab_dTerm_dinferAppGeneral = (fun globals -> (fun ctx -> (fun ec -> (fun fn -> (fun args -> (fun sp -> (match fn with
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (dtb__230, dtb__231) -> ((v_Base_dResult_dandThen ((((((v_Vuna_dCompiler_dElab_dTerm_dspecializeOpApp globals) ctx) ec) dtb__230) args) sp)) (fun mspec -> (match mspec with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__232) -> (C_Base_dResult_dResult_Base_dResult_dOk (dtb__232))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((((((v_Vuna_dCompiler_dElab_dTerm_dinferAppGeneralGo globals) ctx) ec) fn) args) sp)
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> ((((((v_Vuna_dCompiler_dElab_dTerm_dinferAppGeneralGo globals) ctx) ec) fn) args) sp)
)))))))
and v_Vuna_dCompiler_dElab_dTerm_dinferAppGeneralGo = (fun globals -> (fun ctx -> (fun ec -> (fun fn -> (fun args -> (fun sp -> ((v_Base_dResult_dandThen ((((v_Vuna_dCompiler_dElab_dTerm_dinferE globals) ctx) ec) fn)) (fun pf -> (match pf with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__233, dtb__234) -> (match dtb__234 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__235, dtb__236) -> ((v_Base_dResult_dandThen ((((((v_Vuna_dCompiler_dElab_dTerm_dinferArgs globals) ctx) dtb__236) dtb__235) args) sp)) (fun pa -> (match pa with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__237, dtb__238) -> (match dtb__238 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__239, dtb__240) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((((v_Vuna_dCompiler_dElab_dMeta_dctorAppTerm (v_Vuna_dCompiler_dElab_dTypes_decDatas dtb__240)) dtb__233) dtb__237), (C_Base_dPair_dPair_Base_dPair_dPair (dtb__239, dtb__240))))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))))))))
and v_Vuna_dCompiler_dElab_dTerm_dinferArgs = (fun globals -> (fun ctx -> (fun ec -> (fun ty -> (fun args -> (fun sp -> ((((((v_Vuna_dCompiler_dElab_dTerm_dinferArgsGo globals) ctx) ec) ty) args) sp)))))))
and v_Vuna_dCompiler_dElab_dTerm_dinferArgsGo = (fun globals -> (fun ctx -> (fun ec -> (fun ty -> (fun args -> (fun sp -> ((fun forced -> (match forced with
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVPi (dtb__241, dtb__242, dtb__243, dtb__244, dtb__245) -> (if dtb__242 then (if ((v_Vuna_dCompiler_dElab_dDict_disDictDomain ec) dtb__244) then (if ((v_Vuna_dCompiler_dElab_dDict_ddictArgUnsolvedMeta ec) dtb__244) then (((((((v_Vuna_dCompiler_dElab_dTerm_ddeferDictBinder globals) ctx) ec) dtb__244) dtb__245) args) sp) else ((v_Base_dResult_dandThen ((((((v_Vuna_dCompiler_dElab_dTerm_dconstrainDictDom globals) ec) ctx) dtb__244) args) sp)) (fun ec0 -> (match (((v_Vuna_dCompiler_dElab_dDict_dsearchInstance ec0) ((v_Vuna_dCompiler_dElab_dTypes_dforceVal ec0) dtb__244)) sp) with
  | C_Base_dResult_dResult_Base_dResult_dOk (dtb__246) -> (match dtb__246 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__247, dtb__248) -> ((fun ty2 -> ((v_Base_dResult_dandThen ((((((v_Vuna_dCompiler_dElab_dTerm_dinferArgsGo globals) ctx) dtb__248) ty2) args) sp)) (fun q -> (match q with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__249, dtb__250) -> (match dtb__250 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__251, dtb__252) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Base_dList_dList_Cons ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__247, C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRig1)), dtb__249)), (C_Base_dPair_dPair_Base_dPair_dPair (dtb__251, dtb__252))))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))) ((v_Vuna_dCompiler_dCore_dEval_dapplyClosure dtb__245) ((v_Vuna_dCompiler_dElab_dTypes_devalCtx ctx) dtb__247)))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dResult_dResult_Base_dResult_dErr (dtb__253) -> (if ((v_Vuna_dCompiler_dCore_dTerm_dhasUnsolvedMetaValue (v_Vuna_dCompiler_dElab_dTypes_decSols ec0)) ((v_Vuna_dCompiler_dElab_dTypes_dforceVal ec0) dtb__244)) then (((((((v_Vuna_dCompiler_dElab_dTerm_ddeferDictBinder globals) ctx) ec0) dtb__244) dtb__245) args) sp) else (C_Base_dResult_dResult_Base_dResult_dErr (dtb__253)))
  | _ -> failwith "DT: impossible branch"
)))) else (if ((v_Vuna_dCompiler_dElab_dMeta_disIndexDomain ec) dtb__244) then (match ((v_Vuna_dCompiler_dElab_dTypes_dnewMeta ctx) ec) with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__254, dtb__255) -> ((v_Base_dResult_dandThen ((((((v_Vuna_dCompiler_dElab_dTerm_dinferArgsGo globals) ctx) dtb__255) ((v_Vuna_dCompiler_dCore_dEval_dapplyClosure dtb__245) ((v_Vuna_dCompiler_dCore_dEval_deval (v_Vuna_dCompiler_dElab_dTypes_dctxEnv ctx)) dtb__254))) args) sp)) (fun p -> (match p with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__256, dtb__257) -> (match dtb__257 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__258, dtb__259) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Base_dList_dList_Cons ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__254, C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRig0)), dtb__256)), (C_Base_dPair_dPair_Base_dPair_dPair (dtb__258, dtb__259))))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
) else ((v_Vuna_dCompiler_dElab_dTypes_derrAt sp) "[TC_ImplicitParamKind] DT: implicit parameters must be types or inductive families (M15)"))) else (match args with
  | C_Base_dList_dList_Nil -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (C_Base_dList_dList_Nil, (C_Base_dPair_dPair_Base_dPair_dPair (forced, ec))))))
  | C_Base_dList_dList_Cons (dtb__260, dtb__261) -> ((v_Base_dResult_dandThen (((((v_Vuna_dCompiler_dElab_dTerm_dcheckE globals) ctx) ec) dtb__260) dtb__244)) (fun p -> (match p with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__262, dtb__263) -> ((v_Base_dResult_dandThen ((((((v_Vuna_dCompiler_dElab_dTerm_dinferArgsGo globals) ctx) dtb__263) ((v_Vuna_dCompiler_dCore_dEval_dapplyClosure dtb__245) ((v_Vuna_dCompiler_dElab_dTypes_devalCtx ctx) dtb__262))) dtb__261) sp)) (fun q -> (match q with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__264, dtb__265) -> (match dtb__265 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__266, dtb__267) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Base_dList_dList_Cons ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__262, ((v_Vuna_dCompiler_dElab_dMeta_dtypeLayerRig false) dtb__244))), dtb__264)), (C_Base_dPair_dPair_Base_dPair_dPair (dtb__266, dtb__267))))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
))
  | _ -> (match args with
  | C_Base_dList_dList_Nil -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (C_Base_dList_dList_Nil, (C_Base_dPair_dPair_Base_dPair_dPair (forced, ec))))))
  | C_Base_dList_dList_Cons (dtb__268, dtb__269) -> ((v_Vuna_dCompiler_dElab_dTypes_derrAt (v_Vuna_dCompiler_dFrontend_dAst_dexprSpan dtb__268)) "[TC_TooManyArgs] DT: too many arguments (not a function)")
  | _ -> failwith "DT: impossible branch"
)
)) ((v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) ty))))))))
and v_Vuna_dCompiler_dElab_dTerm_ddeferDictBinder = (fun globals -> (fun ctx -> (fun ec -> (fun dom -> (fun clo -> (fun args -> (fun sp -> ((fun m -> (match ((v_Vuna_dCompiler_dElab_dTypes_dnewMeta ctx) ec) with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__270, dtb__271) -> ((v_Base_dResult_dandThen ((((((v_Vuna_dCompiler_dElab_dTerm_dinferArgsGo globals) ctx) ((v_Vuna_dCompiler_dElab_dTypes_decAddDictGoal dtb__271) (C_Vuna_dCompiler_dElab_dTypes_dDtDictGoal_Vuna_dCompiler_dElab_dTypes_dDtDictGoal (m, ((v_Vuna_dCompiler_dElab_dTypes_dforceVal dtb__271) dom))))) ((v_Vuna_dCompiler_dCore_dEval_dapplyClosure clo) ((v_Vuna_dCompiler_dCore_dEval_deval (v_Vuna_dCompiler_dElab_dTypes_dctxEnv ctx)) dtb__270))) args) sp)) (fun p -> (match p with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__272, dtb__273) -> (match dtb__273 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__274, dtb__275) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Base_dList_dList_Cons ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__270, C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRig1)), dtb__272)), (C_Base_dPair_dPair_Base_dPair_dPair (dtb__274, dtb__275))))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)) (v_Vuna_dCompiler_dElab_dTypes_decNext ec)))))))))
and v_Vuna_dCompiler_dElab_dTerm_dconstrainDictDom = (fun globals -> (fun ec -> (fun ctx -> (fun dom -> (fun args -> (fun sp -> (match ((v_Vuna_dCompiler_dElab_dDict_ddictClassArg ec) dom) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (C_Base_dResult_dResult_Base_dResult_dOk (ec))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__276) -> (match ((v_Vuna_dCompiler_dElab_dDict_ddictArgKind ec) dom) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (C_Base_dResult_dResult_Base_dResult_dOk (ec))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__277) -> (match dtb__276 with
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVMeta (dtb__278, dtb__279) -> (match dtb__279 with
  | C_Base_dList_dList_Nil -> ((v_Base_dResult_dandThen (((((((v_Vuna_dCompiler_dElab_dTerm_dconstrainDictDomGoK globals) ec) ctx) dtb__276) dtb__277) args) sp)) (fun ecProbe -> (match ((v_Vuna_dCompiler_dCore_dTerm_dmetaLookup dtb__278) (v_Vuna_dCompiler_dElab_dTypes_decSols ecProbe)) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__280) -> (match ((((((v_Vuna_dCompiler_dCore_dConv_dsolveMeta (v_Vuna_dCompiler_dElab_dTypes_decDefs ec)) (v_Vuna_dCompiler_dElab_dTypes_decSols ec)) 0) dtb__278) C_Base_dList_dList_Nil) dtb__280) with
  | C_Base_dResult_dResult_Base_dResult_dOk (dtb__281) -> (C_Base_dResult_dResult_Base_dResult_dOk (((v_Vuna_dCompiler_dElab_dTypes_decPutSols ec) dtb__281)))
  | C_Base_dResult_dResult_Base_dResult_dErr (dtb__282) -> (C_Base_dResult_dResult_Base_dResult_dOk (ec))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (C_Base_dResult_dResult_Base_dResult_dOk (ec))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> (((((((v_Vuna_dCompiler_dElab_dTerm_dconstrainDictDomGoK globals) ec) ctx) dtb__276) dtb__277) args) sp)
)
  | _ -> (((((((v_Vuna_dCompiler_dElab_dTerm_dconstrainDictDomGoK globals) ec) ctx) dtb__276) dtb__277) args) sp)
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))))))
and v_Vuna_dCompiler_dElab_dTerm_dconstrainDictDomGoK = (fun globals -> (fun ec -> (fun ctx -> (fun argTy -> (fun argKind -> (fun args -> (fun sp -> (match args with
  | C_Base_dList_dList_Nil -> (C_Base_dResult_dResult_Base_dResult_dOk (ec))
  | C_Base_dList_dList_Cons (dtb__283, dtb__284) -> (match ((((v_Vuna_dCompiler_dElab_dTerm_dinferE globals) ctx) ec) dtb__283) with
  | C_Base_dResult_dResult_Base_dResult_dErr (dtb__285) -> (C_Base_dResult_dResult_Base_dResult_dOk (ec))
  | C_Base_dResult_dResult_Base_dResult_dOk (dtb__286) -> (match dtb__286 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__287, dtb__288) -> (match dtb__288 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__289, dtb__290) -> ((fun forced -> (if (v_Vuna_dCompiler_dCore_dTerm_disTypeValue forced) then (((((((v_Vuna_dCompiler_dElab_dTerm_dconstrainDictDomGoK globals) dtb__290) ctx) argTy) argKind) dtb__284) sp) else (if (((((v_Vuna_dCompiler_dElab_dDict_dargHeadMatchesKind globals) dtb__290) ctx) forced) argKind) then (match ((((v_Vuna_dCompiler_dElab_dMeta_dconvEc dtb__290) (v_Vuna_dCompiler_dElab_dTypes_dctxDepth ctx)) argTy) (v_Vuna_dCompiler_dElab_dDict_dneutralHeadOrSelf forced)) with
  | C_Base_dResult_dResult_Base_dResult_dOk (dtb__291) -> (C_Base_dResult_dResult_Base_dResult_dOk (dtb__291))
  | C_Base_dResult_dResult_Base_dResult_dErr (dtb__292) -> (((((((v_Vuna_dCompiler_dElab_dTerm_dconstrainDictDomGoK globals) dtb__290) ctx) argTy) argKind) dtb__284) sp)
  | _ -> failwith "DT: impossible branch"
) else (((((((v_Vuna_dCompiler_dElab_dTerm_dconstrainDictDomGoK globals) dtb__290) ctx) argTy) argKind) dtb__284) sp)))) ((v_Vuna_dCompiler_dElab_dTypes_dforceVal dtb__290) dtb__289))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))))))
and v_Vuna_dCompiler_dElab_dTerm_dcheckE = (fun globals -> (fun ctx -> (fun ec -> (fun expr -> (fun expected -> ((fun nd_uscrut -> (match nd_uscrut with
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEAnn (dtb__293, dtb__294, dtb__295) -> ((v_Base_dResult_dandThen ((((v_Vuna_dCompiler_dElab_dTerm_dcheckType globals) ctx) ec) dtb__294)) (fun pt -> (match pt with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__296, dtb__297) -> (match dtb__297 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__298, dtb__299) -> (((((v_Vuna_dCompiler_dElab_dTerm_dcheckE globals) ctx) dtb__299) dtb__293) ((v_Vuna_dCompiler_dCore_dEval_deval (v_Vuna_dCompiler_dElab_dTypes_dctxEnv ctx)) dtb__296))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dELet (dtb__300, dtb__301, dtb__302, dtb__303) -> ((((((((v_Vuna_dCompiler_dElab_dTerm_dcheckLet globals) ctx) ec) dtb__300) dtb__301) dtb__302) expected) dtb__303)
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dECase (dtb__304, dtb__305, dtb__306) -> (((((((v_Vuna_dCompiler_dElab_dTerm_dcheckCase globals) ctx) ec) dtb__304) dtb__305) expected) dtb__306)
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEIf (dtb__307, dtb__308, dtb__309, dtb__310) -> (((((v_Vuna_dCompiler_dElab_dTerm_dcheckByInfer globals) ctx) ec) expr) expected)
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEPi (dtb__311, dtb__312, dtb__313, dtb__314, dtb__315) -> (((((v_Vuna_dCompiler_dElab_dTerm_dcheckByInfer globals) ctx) ec) expr) expected)
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEApp (dtb__316, dtb__317, dtb__318) -> (match dtb__316 with
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (dtb__319, dtb__320) -> (if ((bi_eq_str dtb__319) "->") then (((((v_Vuna_dCompiler_dElab_dTerm_dcheckByInfer globals) ctx) ec) expr) expected) else (if ((bi_eq_str dtb__319) "Type") then (((((v_Vuna_dCompiler_dElab_dTerm_dcheckByInfer globals) ctx) ec) expr) expected) else (((((((v_Vuna_dCompiler_dElab_dTerm_dcheckApp globals) ctx) ec) dtb__316) dtb__317) expected) dtb__318)))
  | _ -> (((((((v_Vuna_dCompiler_dElab_dTerm_dcheckApp globals) ctx) ec) dtb__316) dtb__317) expected) dtb__318)
)
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dELam (dtb__321, dtb__322, dtb__323) -> (((((((v_Vuna_dCompiler_dElab_dTerm_dcheckLam globals) ctx) ec) dtb__321) dtb__322) expected) dtb__323)
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEStr (dtb__324, dtb__325) -> (((((v_Vuna_dCompiler_dElab_dTerm_dcheckByInfer globals) ctx) ec) expr) expected)
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEInt (dtb__326, dtb__327) -> (((((v_Vuna_dCompiler_dElab_dTerm_dcheckByInfer globals) ctx) ec) expr) expected)
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (dtb__328, dtb__329) -> (if ((bi_eq_str dtb__328) "_") then ((fun pmeta -> (match pmeta with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__330, dtb__331) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__330, dtb__331))))
  | _ -> failwith "DT: impossible branch"
)) ((((v_Vuna_dCompiler_dElab_dTypes_dnewHoleMeta ctx) ec) dtb__329) expected)) else (((((((v_Vuna_dCompiler_dElab_dTerm_dcheckApp globals) ctx) ec) (C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (dtb__328, dtb__329))) C_Base_dList_dList_Nil) expected) dtb__329))
  | _ -> (((((v_Vuna_dCompiler_dElab_dTerm_dcheckByInfer globals) ctx) ec) expr) expected)
)) expr))))))
and v_Vuna_dCompiler_dElab_dTerm_dcheckLet = (fun globals -> (fun ctx -> (fun ec -> (fun binds -> (fun body -> (fun rec_u -> (fun expected -> (fun sp -> (if rec_u then ((v_Base_dResult_dandThen (v_Vuna_dCompiler_dElab_dTerm_dcheckWhereSigs binds)) (fun _u -> ((((((((v_Vuna_dCompiler_dElab_dTerm_dcheckLetGo globals) ctx) ec) binds) body) rec_u) expected) sp))) else ((((((((v_Vuna_dCompiler_dElab_dTerm_dcheckLetGo globals) ctx) ec) binds) body) rec_u) expected) sp))))))))))
and v_Vuna_dCompiler_dElab_dTerm_dcheckLetGo = (fun mc0 -> (fun mc1 -> (fun mc2 -> (fun mc3 -> (fun mc4 -> (fun mc5 -> (fun mc6 -> (fun mc7 -> (match mc3 with
  | C_Base_dList_dList_Cons (dtb__332, dtb__333) -> (((((((((v_Vuna_dCompiler_dElab_dTerm_dcheckLetOne mc0) mc1) mc2) dtb__332) dtb__333) mc4) mc5) mc6) mc7)
  | C_Base_dList_dList_Nil -> (((((v_Vuna_dCompiler_dElab_dTerm_dcheckE mc0) mc1) mc2) mc4) mc6)
  | _ -> failwith "DT: impossible branch"
)))))))))
and v_Vuna_dCompiler_dElab_dTerm_dcheckLetOne = (fun globals -> (fun ctx -> (fun ec -> (fun bind -> (fun rest -> (fun body -> (fun rec_u -> (fun expected -> (fun sp -> (match (v_Base_dPair_dfirstOf bind) with
  | C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPVar (dtb__334, dtb__335) -> ((fun value -> ((v_Base_dResult_dandThen ((((v_Vuna_dCompiler_dElab_dTerm_dinferE globals) ctx) ec) value)) (fun pv -> (match pv with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__336, dtb__337) -> (match dtb__337 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__338, dtb__339) -> ((fun rig -> ((fun ctx2 -> ((v_Base_dResult_dandThen ((((((((v_Vuna_dCompiler_dElab_dTerm_dcheckLetGo globals) ctx2) dtb__339) rest) body) rec_u) expected) sp)) (fun pb -> (match pb with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__340, dtb__341) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp ((C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTLam (dtb__334, rig, dtb__340)), dtb__336, rig)), dtb__341))))
  | _ -> failwith "DT: impossible branch"
)))) (((v_Vuna_dCompiler_dElab_dTypes_dctxBindValue dtb__334) dtb__338) ctx))) ((v_Vuna_dCompiler_dElab_dMeta_dbinderRig false) dtb__338))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))) (v_Base_dPair_dsecondOf bind))
  | C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPWild (dtb__342) -> ((fun value -> ((v_Base_dResult_dandThen ((((v_Vuna_dCompiler_dElab_dTerm_dinferE globals) ctx) ec) value)) (fun pv -> (match pv with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__343, dtb__344) -> (match dtb__344 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__345, dtb__346) -> ((fun rig -> ((v_Base_dResult_dandThen ((((((((v_Vuna_dCompiler_dElab_dTerm_dcheckLetGo globals) ctx) dtb__346) rest) body) rec_u) expected) sp)) (fun pb -> (match pb with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__347, dtb__348) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp ((C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTLam ("_", rig, (((v_Vuna_dCompiler_dCore_dTerm_dshift 0) 1) dtb__347))), dtb__343, rig)), dtb__348))))
  | _ -> failwith "DT: impossible branch"
)))) ((v_Vuna_dCompiler_dElab_dMeta_dbinderRig false) dtb__345))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))) (v_Base_dPair_dsecondOf bind))
  | _ -> ((v_Vuna_dCompiler_dElab_dTypes_derrAt (v_Vuna_dCompiler_dFrontend_dAst_dpatSpan (v_Base_dPair_dfirstOf bind))) "[TC_LetBindingPattern] DT: let bindings must be simple names or wildcards (M19)")
))))))))))
and v_Vuna_dCompiler_dElab_dTerm_dinferLet = (fun globals -> (fun ctx -> (fun ec -> (fun binds -> (fun body -> (fun rec_u -> (fun sp -> (if rec_u then ((v_Base_dResult_dandThen (v_Vuna_dCompiler_dElab_dTerm_dcheckWhereSigs binds)) (fun _u -> (((((((v_Vuna_dCompiler_dElab_dTerm_dinferLetGo globals) ctx) ec) binds) body) rec_u) sp))) else (((((((v_Vuna_dCompiler_dElab_dTerm_dinferLetGo globals) ctx) ec) binds) body) rec_u) sp)))))))))
and v_Vuna_dCompiler_dElab_dTerm_dinferLetGo = (fun globals -> (fun ctx -> (fun ec -> (fun binds -> (fun body -> (fun rec_u -> (fun sp -> (match binds with
  | C_Base_dList_dList_Nil -> ((((v_Vuna_dCompiler_dElab_dTerm_dinferE globals) ctx) ec) body)
  | C_Base_dList_dList_Cons (dtb__349, dtb__350) -> (match dtb__349 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__351, dtb__352) -> (match dtb__351 with
  | C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPVar (dtb__353, dtb__354) -> (((((((((v_Vuna_dCompiler_dElab_dTerm_dinferLetBound globals) ctx) ec) dtb__353) dtb__352) dtb__350) body) rec_u) sp)
  | C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPWild (dtb__355) -> ((((((((v_Vuna_dCompiler_dElab_dTerm_dinferLetIgnored globals) ctx) ec) dtb__352) dtb__350) body) rec_u) sp)
  | _ -> ((v_Vuna_dCompiler_dElab_dTypes_derrAt (v_Vuna_dCompiler_dFrontend_dAst_dpatSpan dtb__351)) "[TC_LetBindingPattern] DT: let bindings must be simple names or wildcards (M19)")
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))))))
and v_Vuna_dCompiler_dElab_dTerm_dinferLetBound = (fun globals -> (fun ctx -> (fun ec -> (fun name -> (fun value -> (fun rest -> (fun body -> (fun rec_u -> (fun sp -> ((v_Base_dResult_dandThen ((((v_Vuna_dCompiler_dElab_dTerm_dinferE globals) ctx) ec) value)) (fun pv -> (match pv with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__356, dtb__357) -> (match dtb__357 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__358, dtb__359) -> ((fun rig -> ((fun ctx2 -> ((v_Base_dResult_dandThen (((((((v_Vuna_dCompiler_dElab_dTerm_dinferLet globals) ctx2) dtb__359) rest) body) rec_u) sp)) (fun pb -> (match pb with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__360, dtb__361) -> (match dtb__361 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__362, dtb__363) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp ((C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTLam (name, rig, dtb__360)), dtb__356, rig)), (C_Base_dPair_dPair_Base_dPair_dPair (dtb__362, dtb__363))))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))) (((v_Vuna_dCompiler_dElab_dTypes_dctxBindValue name) dtb__358) ctx))) ((v_Vuna_dCompiler_dElab_dMeta_dbinderRig false) dtb__358))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))))))))))
and v_Vuna_dCompiler_dElab_dTerm_dinferLetIgnored = (fun globals -> (fun ctx -> (fun ec -> (fun value -> (fun rest -> (fun body -> (fun rec_u -> (fun sp -> ((v_Base_dResult_dandThen ((((v_Vuna_dCompiler_dElab_dTerm_dinferE globals) ctx) ec) value)) (fun pv -> (match pv with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__364, dtb__365) -> (match dtb__365 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__366, dtb__367) -> ((fun rig -> ((v_Base_dResult_dandThen (((((((v_Vuna_dCompiler_dElab_dTerm_dinferLet globals) ctx) dtb__367) rest) body) rec_u) sp)) (fun pb -> (match pb with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__368, dtb__369) -> (match dtb__369 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__370, dtb__371) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp ((C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTLam ("_", rig, (((v_Vuna_dCompiler_dCore_dTerm_dshift 0) 1) dtb__368))), dtb__364, rig)), (C_Base_dPair_dPair_Base_dPair_dPair (dtb__370, dtb__371))))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))) ((v_Vuna_dCompiler_dElab_dMeta_dbinderRig false) dtb__366))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))))))))))
and v_Vuna_dCompiler_dElab_dTerm_dcheckByInfer = (fun globals -> (fun ctx -> (fun ec -> (fun expr -> (fun expected -> (match ((((v_Vuna_dCompiler_dElab_dTerm_dinferE globals) ctx) ec) expr) with
  | C_Base_dResult_dResult_Base_dResult_dErr (dtb__372) -> (C_Base_dResult_dResult_Base_dResult_dErr (dtb__372))
  | C_Base_dResult_dResult_Base_dResult_dOk (dtb__373) -> (match dtb__373 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__374, dtb__375) -> (match dtb__375 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__376, dtb__377) -> (match ((((v_Vuna_dCompiler_dElab_dMeta_dconvEc dtb__377) (v_Vuna_dCompiler_dElab_dTypes_dctxDepth ctx)) expected) dtb__376) with
  | C_Base_dResult_dResult_Base_dResult_dErr (dtb__378) -> (C_Base_dResult_dResult_Base_dResult_dErr (((bi_concat (v_Vuna_dCompiler_dCommon_dshowSpanLoc (v_Vuna_dCompiler_dFrontend_dAst_dexprSpan expr))) ((bi_concat ": ") dtb__378))))
  | C_Base_dResult_dResult_Base_dResult_dOk (dtb__379) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__374, ((v_Vuna_dCompiler_dElab_dDict_dresolveDictGoals globals) dtb__379)))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))))
and v_Vuna_dCompiler_dElab_dTerm_dcheckLam = (fun mc0 -> (fun mc1 -> (fun mc2 -> (fun mc3 -> (fun mc4 -> (fun mc5 -> (fun mc6 -> (match mc3 with
  | C_Base_dList_dList_Cons (dtb__380, dtb__381) -> ((fun forced -> (match forced with
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVPi (dtb__382, dtb__383, dtb__384, dtb__385, dtb__386) -> ((fun lvl -> ((fun v -> ((fun ctx2 -> ((fun expected2 -> ((fun lamRig -> ((v_Base_dResult_dandThen (((((((v_Vuna_dCompiler_dElab_dTerm_dcheckLam mc0) ctx2) mc2) dtb__381) mc4) expected2) mc6)) (fun p -> (match p with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__387, dtb__388) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTLam (dtb__380, lamRig, dtb__387)), dtb__388))))
  | _ -> failwith "DT: impossible branch"
)))) ((v_Vuna_dCompiler_dElab_dMeta_dbinderRig dtb__383) dtb__385))) ((v_Vuna_dCompiler_dCore_dEval_dapplyClosure dtb__386) v))) (((v_Vuna_dCompiler_dElab_dTypes_dctxBindValue dtb__380) dtb__385) mc1))) ((v_Vuna_dCompiler_dElab_dMeta_dfreshVarValue dtb__382) lvl))) (v_Vuna_dCompiler_dElab_dTypes_dctxDepth mc1))
  | _ -> ((v_Vuna_dCompiler_dElab_dTypes_derrAt mc6) "[TC_LambdaTooManyParams] DT: lambda has more parameters than the expected function type")
)) ((v_Vuna_dCompiler_dElab_dTypes_dforceVal mc2) mc5))
  | C_Base_dList_dList_Nil -> (((((v_Vuna_dCompiler_dElab_dTerm_dcheckE mc0) mc1) mc2) mc4) mc5)
  | _ -> failwith "DT: impossible branch"
))))))))
and v_Vuna_dCompiler_dElab_dTerm_dcheckType = (fun globals -> (fun ctx -> (fun ec -> (fun expr -> (match expr with
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (dtb__389, dtb__390) -> (match ((v_Vuna_dCompiler_dElab_dTypes_dctxLookup dtb__389) ctx) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__391) -> ((((v_Vuna_dCompiler_dElab_dTerm_dcheckTypeInfer globals) ctx) ec) expr)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (match ((v_Vuna_dCompiler_dElab_dMeta_dglobalLookup dtb__389) globals) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__392) -> (match (v_Vuna_dCompiler_dCore_dTerm_dtypeLevelOf ((v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) ((v_Vuna_dCompiler_dCore_dEval_deval C_Base_dList_dList_Nil) dtb__392))) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__393) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTGlobal (dtb__389)), (C_Base_dPair_dPair_Base_dPair_dPair (dtb__393, ec))))))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((((v_Vuna_dCompiler_dElab_dTerm_dcheckTypeInfer globals) ctx) ec) expr)
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((((v_Vuna_dCompiler_dElab_dTerm_dcheckTypeInfer globals) ctx) ec) expr)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEApp (dtb__394, dtb__395, dtb__396) -> (match dtb__394 with
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (dtb__397, dtb__398) -> (if (if ((bi_eq_str dtb__397) "->") then true else ((bi_eq_str dtb__397) "Type")) then ((((v_Vuna_dCompiler_dElab_dTerm_dcheckTypeInfer globals) ctx) ec) expr) else (match ((v_Vuna_dCompiler_dElab_dTypes_dctxLookup dtb__397) ctx) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__399) -> ((((v_Vuna_dCompiler_dElab_dTerm_dcheckTypeInfer globals) ctx) ec) expr)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (match ((((((v_Vuna_dCompiler_dElab_dTerm_dinferAppUnderType globals) ctx) ec) dtb__397) dtb__395) dtb__398) with
  | C_Base_dResult_dResult_Base_dResult_dErr (dtb__400) -> ((((v_Vuna_dCompiler_dElab_dTerm_dcheckTypeInfer globals) ctx) ec) expr)
  | C_Base_dResult_dResult_Base_dResult_dOk (dtb__401) -> (C_Base_dResult_dResult_Base_dResult_dOk (dtb__401))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))
  | _ -> ((((v_Vuna_dCompiler_dElab_dTerm_dcheckTypeInfer globals) ctx) ec) expr)
)
  | _ -> ((((v_Vuna_dCompiler_dElab_dTerm_dcheckTypeInfer globals) ctx) ec) expr)
)))))
and v_Vuna_dCompiler_dElab_dTerm_dcheckTypeInfer = (fun globals -> (fun ctx -> (fun ec -> (fun expr -> ((v_Base_dResult_dandThen ((((v_Vuna_dCompiler_dElab_dTerm_dinferE globals) ctx) ec) expr)) (fun p -> (match p with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__402, dtb__403) -> (match dtb__403 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__404, dtb__405) -> ((fun forced -> (match (v_Vuna_dCompiler_dCore_dTerm_dtypeLevelOf forced) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__406) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__402, (C_Base_dPair_dPair_Base_dPair_dPair (dtb__406, dtb__405))))))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((v_Vuna_dCompiler_dElab_dTypes_derrAt (v_Vuna_dCompiler_dFrontend_dAst_dexprSpan expr)) ((bi_concat "[TC_ExpectedType] DT: expected a type, but this expression has type ") ((v_Vuna_dCompiler_dCore_dEval_dshowValueAt (v_Vuna_dCompiler_dElab_dTypes_dctxDepth ctx)) dtb__404)))
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dElab_dTypes_dforceVal dtb__405) dtb__404))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))))))
and v_Vuna_dCompiler_dElab_dTerm_dcheckApp = (fun globals -> (fun ctx -> (fun ec -> (fun fn -> (fun args -> (fun expected -> (fun sp -> (match fn with
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (dtb__407, dtb__408) -> (match ((v_Vuna_dCompiler_dElab_dTypes_dctxLookup dtb__407) ctx) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__409) -> (((((((v_Vuna_dCompiler_dElab_dTerm_dcheckAppGeneral globals) ctx) ec) fn) args) expected) sp)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (if ((v_Vuna_dCompiler_dElab_dMeta_disSortVal ec) expected) then (((((((v_Vuna_dCompiler_dElab_dTerm_dcheckAppUnderType globals) ctx) ec) dtb__407) args) expected) dtb__408) else (match ((v_Vuna_dCompiler_dElab_dMeta_ddtCtorLookup dtb__407) (v_Vuna_dCompiler_dElab_dTypes_decDatas ec)) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__410) -> (((((((v_Vuna_dCompiler_dElab_dTerm_dcheckAppCtor globals) ctx) ec) dtb__407) args) expected) dtb__408)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (((((((v_Vuna_dCompiler_dElab_dTerm_dcheckAppGeneral globals) ctx) ec) fn) args) expected) sp)
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> (((((((v_Vuna_dCompiler_dElab_dTerm_dcheckAppGeneral globals) ctx) ec) fn) args) expected) sp)
))))))))
and v_Vuna_dCompiler_dElab_dTerm_dcheckAppUnderType = (fun globals -> (fun ctx -> (fun ec -> (fun name -> (fun args -> (fun expected -> (fun sp -> (match ((((((v_Vuna_dCompiler_dElab_dTerm_dinferAppUnderType globals) ctx) ec) name) args) sp) with
  | C_Base_dResult_dResult_Base_dResult_dErr (dtb__411) -> (((((((v_Vuna_dCompiler_dElab_dTerm_dcheckAppGeneral globals) ctx) ec) (C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (name, sp))) args) expected) sp)
  | C_Base_dResult_dResult_Base_dResult_dOk (dtb__412) -> (match dtb__412 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__413, dtb__414) -> (match dtb__414 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__415, dtb__416) -> ((v_Base_dResult_dandThen ((((v_Vuna_dCompiler_dElab_dMeta_dconvEc dtb__416) (v_Vuna_dCompiler_dElab_dTypes_dctxDepth ctx)) expected) (C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVType (dtb__415)))) (fun ec2 -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__413, ec2))))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))))))
and v_Vuna_dCompiler_dElab_dTerm_dinferAppUnderType = (fun globals -> (fun ctx -> (fun ec -> (fun name -> (fun args -> (fun sp -> (match ((v_Vuna_dCompiler_dElab_dMeta_dglobalLookup name) globals) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((v_Vuna_dCompiler_dElab_dTypes_derrAt sp) ((bi_concat "[TC_UnknownName] DT: unknown name ") name))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__417) -> ((v_Base_dResult_dandThen ((((((v_Vuna_dCompiler_dElab_dTerm_dinferArgs globals) ctx) ec) ((v_Vuna_dCompiler_dCore_dEval_deval C_Base_dList_dList_Nil) dtb__417)) args) sp)) (fun pa -> (match pa with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__418, dtb__419) -> (match dtb__419 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__420, dtb__421) -> (match (v_Vuna_dCompiler_dCore_dTerm_dtypeLevelOf ((v_Vuna_dCompiler_dElab_dTypes_dforceVal dtb__421) dtb__420)) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__422) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (((v_Vuna_dCompiler_dElab_dMeta_dfoldAppTerms (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTGlobal (name))) dtb__418), (C_Base_dPair_dPair_Base_dPair_dPair (dtb__422, dtb__421))))))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((v_Vuna_dCompiler_dElab_dTypes_derrAt sp) ((bi_concat "[TC_AppliedNotType] DT: expected a type, but ") ((bi_concat name) " applied to these arguments is not a type")))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))))))
and v_Vuna_dCompiler_dElab_dTerm_dspecializeEqApp = (fun globals -> (fun ctx -> (fun ec -> (fun name -> (fun args -> (fun sp -> (if (v_Vuna_dCompiler_dElab_dPrelude_disEqOp name) then (match args with
  | C_Base_dList_dList_Cons (dtb__423, dtb__424) -> (match dtb__424 with
  | C_Base_dList_dList_Cons (dtb__425, dtb__426) -> (match dtb__426 with
  | C_Base_dList_dList_Nil -> ((v_Base_dResult_dandThen ((((v_Vuna_dCompiler_dElab_dTerm_dinferE globals) ctx) ec) dtb__423)) (fun pa -> (match pa with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__427, dtb__428) -> (match dtb__428 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__429, dtb__430) -> ((v_Base_dResult_dandThen ((((v_Vuna_dCompiler_dElab_dTerm_dinferE globals) ctx) dtb__430) dtb__425)) (fun pb -> (match pb with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__431, dtb__432) -> (match dtb__432 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__433, dtb__434) -> ((v_Base_dResult_dandThen ((((v_Vuna_dCompiler_dElab_dMeta_dconvEc dtb__434) (v_Vuna_dCompiler_dElab_dTypes_dctxDepth ctx)) dtb__429) dtb__433)) (fun ec3 -> ((((((((v_Vuna_dCompiler_dElab_dDict_dspecializeEqTy globals) ctx) name) dtb__427) dtb__431) sp) dtb__429) ec3)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> (C_Base_dResult_dResult_Base_dResult_dOk (C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing))
)
  | _ -> (C_Base_dResult_dResult_Base_dResult_dOk (C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing))
)
  | _ -> (C_Base_dResult_dResult_Base_dResult_dOk (C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing))
) else (C_Base_dResult_dResult_Base_dResult_dOk (C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing)))))))))
and v_Vuna_dCompiler_dElab_dTerm_dspecializeCmpApp = (fun globals -> (fun ctx -> (fun ec -> (fun name -> (fun args -> (fun sp -> (if (v_Vuna_dCompiler_dElab_dDict_disCmpOp name) then (match args with
  | C_Base_dList_dList_Cons (dtb__435, dtb__436) -> (match dtb__436 with
  | C_Base_dList_dList_Cons (dtb__437, dtb__438) -> (match dtb__438 with
  | C_Base_dList_dList_Nil -> ((v_Base_dResult_dandThen ((((v_Vuna_dCompiler_dElab_dTerm_dinferE globals) ctx) ec) dtb__435)) (fun pa -> (match pa with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__439, dtb__440) -> (match dtb__440 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__441, dtb__442) -> ((v_Base_dResult_dandThen ((((v_Vuna_dCompiler_dElab_dTerm_dinferE globals) ctx) dtb__442) dtb__437)) (fun pb -> (match pb with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__443, dtb__444) -> (match dtb__444 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__445, dtb__446) -> ((v_Base_dResult_dandThen ((((v_Vuna_dCompiler_dElab_dMeta_dconvEc dtb__446) (v_Vuna_dCompiler_dElab_dTypes_dctxDepth ctx)) dtb__441) dtb__445)) (fun ec3 -> ((((((((v_Vuna_dCompiler_dElab_dDict_dspecializeCmpTy globals) ctx) name) dtb__439) dtb__443) sp) dtb__441) ec3)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> (C_Base_dResult_dResult_Base_dResult_dOk (C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing))
)
  | _ -> (C_Base_dResult_dResult_Base_dResult_dOk (C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing))
)
  | _ -> (C_Base_dResult_dResult_Base_dResult_dOk (C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing))
) else (C_Base_dResult_dResult_Base_dResult_dOk (C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing)))))))))
and v_Vuna_dCompiler_dElab_dTerm_dspecializeOpApp = (fun globals -> (fun ctx -> (fun ec -> (fun name -> (fun args -> (fun sp -> ((v_Base_dResult_dandThen ((((((v_Vuna_dCompiler_dElab_dTerm_dspecializeEqApp globals) ctx) ec) name) args) sp)) (fun r -> (match r with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__447) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__447))))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((v_Base_dResult_dandThen ((((((v_Vuna_dCompiler_dElab_dTerm_dspecializeCmpApp globals) ctx) ec) name) args) sp)) (fun r2 -> (match r2 with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__448) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__448))))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((((((v_Vuna_dCompiler_dElab_dTerm_dspecializeBoolApp globals) ctx) ec) name) args) sp)
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))))))))
and v_Vuna_dCompiler_dElab_dTerm_dspecializeBoolApp = (fun globals -> (fun ctx -> (fun ec -> (fun name -> (fun args -> (fun sp -> (if (if ((bi_eq_str name) "&&") then true else ((bi_eq_str name) "||")) then (match args with
  | C_Base_dList_dList_Cons (dtb__449, dtb__450) -> (match dtb__450 with
  | C_Base_dList_dList_Cons (dtb__451, dtb__452) -> (match dtb__452 with
  | C_Base_dList_dList_Nil -> ((v_Base_dResult_dandThen (((((v_Vuna_dCompiler_dElab_dTerm_dcheckE globals) ctx) ec) dtb__449) (C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral ((C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNGlobal ("Bool", C_Base_dList_dList_Nil)))))) (fun pa -> (match pa with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__453, dtb__454) -> ((v_Base_dResult_dandThen (((((v_Vuna_dCompiler_dElab_dTerm_dcheckE globals) ctx) dtb__454) dtb__451) (C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral ((C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNGlobal ("Bool", C_Base_dList_dList_Nil)))))) (fun pb -> (match pb with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__455, dtb__456) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((C_Base_dPair_dPair_Base_dPair_dPair ((((v_Vuna_dCompiler_dElab_dDict_dboolShortCircuit name) dtb__453) dtb__455), (C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral ((C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNGlobal ("Bool", C_Base_dList_dList_Nil)))), dtb__456))))))))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> ((v_Vuna_dCompiler_dElab_dTypes_derrAt sp) ((bi_concat "[TC_NeedsTwoArgs] DT: `") ((bi_concat name) "` needs exactly two arguments")))
)
  | _ -> ((v_Vuna_dCompiler_dElab_dTypes_derrAt sp) ((bi_concat "[TC_NeedsTwoArgs] DT: `") ((bi_concat name) "` needs exactly two arguments")))
)
  | _ -> ((v_Vuna_dCompiler_dElab_dTypes_derrAt sp) ((bi_concat "[TC_NeedsTwoArgs] DT: `") ((bi_concat name) "` needs exactly two arguments")))
) else (C_Base_dResult_dResult_Base_dResult_dOk (C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing)))))))))
and v_Vuna_dCompiler_dElab_dTerm_dcheckAppGeneral = (fun globals -> (fun ctx -> (fun ec -> (fun fn -> (fun args -> (fun expected -> (fun sp -> (match fn with
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (dtb__457, dtb__458) -> ((v_Base_dResult_dandThen ((((((v_Vuna_dCompiler_dElab_dTerm_dspecializeOpApp globals) ctx) ec) dtb__457) args) sp)) (fun mspec -> (match mspec with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__459) -> (match dtb__459 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__460, dtb__461) -> (match dtb__461 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__462, dtb__463) -> ((v_Base_dResult_dandThen ((((v_Vuna_dCompiler_dElab_dMeta_dconvEc dtb__463) (v_Vuna_dCompiler_dElab_dTypes_dctxDepth ctx)) expected) dtb__462)) (fun ec2 -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__460, ec2))))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (((((v_Vuna_dCompiler_dElab_dTerm_dcheckByInfer globals) ctx) ec) (C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEApp (fn, args, sp))) expected)
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> (((((v_Vuna_dCompiler_dElab_dTerm_dcheckByInfer globals) ctx) ec) (C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEApp (fn, args, sp))) expected)
))))))))
and v_Vuna_dCompiler_dElab_dTerm_dcheckAppCtor = (fun globals -> (fun ctx -> (fun ec -> (fun name -> (fun args -> (fun expected -> (fun sp -> (match ((v_Vuna_dCompiler_dElab_dMeta_ddtCtorLookup name) (v_Vuna_dCompiler_dElab_dTypes_decDatas ec)) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((v_Vuna_dCompiler_dElab_dTypes_derrAt sp) ((bi_concat "[TC_UnknownName] DT: unknown name ") name))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__464) -> ((v_Base_dResult_dandThen ((((((v_Vuna_dCompiler_dElab_dTerm_dinferArgs globals) ctx) ec) ((v_Vuna_dCompiler_dCore_dEval_deval C_Base_dList_dList_Nil) (v_Vuna_dCompiler_dElab_dTypes_ddtCtorType dtb__464))) args) sp)) (fun pa -> (match pa with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__465, dtb__466) -> (match dtb__466 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__467, dtb__468) -> (match ((((v_Vuna_dCompiler_dElab_dMeta_dconvEc dtb__468) (v_Vuna_dCompiler_dElab_dTypes_dctxDepth ctx)) expected) dtb__467) with
  | C_Base_dResult_dResult_Base_dResult_dOk (dtb__469) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((((v_Vuna_dCompiler_dElab_dMeta_dctorAppTerm (v_Vuna_dCompiler_dElab_dTypes_decDatas dtb__469)) (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTGlobal (name))) dtb__465), dtb__469))))
  | C_Base_dResult_dResult_Base_dResult_dErr (dtb__470) -> ((v_Vuna_dCompiler_dElab_dTypes_derrAt sp) ((bi_concat "[TC_CtorError] DT: constructor ") ((bi_concat name) ((bi_concat ": ") dtb__470))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
))))))))
