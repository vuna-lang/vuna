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
open Vuna_dCompiler_dFrontend_dParser_dSupport
open Vuna_dCompiler_dFrontend_dParser
open Vuna_dCompiler_dLoader_dModules
open Vuna_dCompiler_dLoader_dResolve
open Vuna_dCompiler_dLoader_dFlatten
open Vuna_dCompiler_dLoader
open Vuna_dCompiler_dCore_dTerm
open Vuna_dCompiler_dCore_dEval
let v_Vuna_dCompiler_dCore_dConv_disBoolTyName = (fun n -> (if ((bi_eq_str n) "Bool") then true else ((bi_eq_str n) "Base.Bool.Bool")))

let v_Vuna_dCompiler_dCore_dConv_disBoolNeutral = (fun n -> (match n with
  | C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNGlobal (dtb__0, dtb__1) -> (if ((bi_eq_generic dtb__1) C_Base_dList_dList_Nil) then (v_Vuna_dCompiler_dCore_dConv_disBoolTyName dtb__0) else false)
  | C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNVar (dtb__2, dtb__3, dtb__4) -> (if ((bi_eq_generic dtb__4) C_Base_dList_dList_Nil) then (v_Vuna_dCompiler_dCore_dConv_disBoolTyName dtb__2) else false)
  | _ -> false
))

let v_Vuna_dCompiler_dCore_dConv_dmismatchAt = (fun depth -> (fun a -> (fun b -> (C_Base_dResult_dResult_Base_dResult_dErr (((bi_concat "type mismatch: expected ") ((bi_concat ((v_Vuna_dCompiler_dCore_dEval_dshowValueAt depth) a)) ((bi_concat ", got ") ((v_Vuna_dCompiler_dCore_dEval_dshowValueAt depth) b)))))))))

let rec v_Vuna_dCompiler_dCore_dConv_dsplitAtVals = (fun mc0 -> (fun mc1 -> (if ((bi_eq_int mc0) 0) then (match mc1 with
  | C_Base_dList_dList_Cons (dtb__5, dtb__6) -> (C_Base_dPair_dPair_Base_dPair_dPair (C_Base_dList_dList_Nil, mc1))
  | C_Base_dList_dList_Nil -> (C_Base_dPair_dPair_Base_dPair_dPair (C_Base_dList_dList_Nil, mc1))
  | _ -> failwith "DT: impossible branch"
) else (match mc1 with
  | C_Base_dList_dList_Cons (dtb__7, dtb__8) -> (match ((v_Vuna_dCompiler_dCore_dConv_dsplitAtVals ((bi_sub mc0) 1)) dtb__8) with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__9, dtb__10) -> (C_Base_dPair_dPair_Base_dPair_dPair ((C_Base_dList_dList_Cons (dtb__7, dtb__9)), dtb__10))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Nil -> (C_Base_dPair_dPair_Base_dPair_dPair (C_Base_dList_dList_Nil, C_Base_dList_dList_Nil))
  | _ -> failwith "DT: impossible branch"
))))

let v_Vuna_dCompiler_dCore_dConv_dsolveMetaNew = (fun defs -> (fun sols -> (fun depth -> (fun m -> (fun rhs -> ((fun t -> (if (((v_Vuna_dCompiler_dCore_dTerm_dhasMeta m) 0) t) then (C_Base_dResult_dResult_Base_dResult_dErr (((bi_concat "cannot solve metavariable ?") ((bi_concat (bi_strFromInt m)) " (occurs check)")))) else (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dList_dList_Cons ((C_Base_dPair_dPair_Base_dPair_dPair (m, rhs)), sols)))))) ((v_Vuna_dCompiler_dCore_dEval_dquote depth) rhs)))))))

let rec v_Vuna_dCompiler_dCore_dConv_dconvFuel = (fun fuel -> (fun defs -> (fun sols -> (fun depth -> (fun a -> (fun b -> (if ((bi_le_int fuel) 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: conv fuel exhausted")) else ((fun a2 -> ((fun y2 -> (match a2 with
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVMeta (dtb__11, dtb__12) -> (((((((v_Vuna_dCompiler_dCore_dConv_dsolveMetaFuel ((bi_sub fuel) 1)) defs) sols) depth) dtb__11) dtb__12) y2)
  | _ -> (match y2 with
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVMeta (dtb__13, dtb__14) -> (((((((v_Vuna_dCompiler_dCore_dConv_dsolveMetaFuel ((bi_sub fuel) 1)) defs) sols) depth) dtb__13) dtb__14) a2)
  | _ -> ((((((v_Vuna_dCompiler_dCore_dConv_dconvBothFuel ((bi_sub fuel) 1)) defs) sols) depth) a2) y2)
)
)) ((((v_Vuna_dCompiler_dCore_dEval_dforce defs) sols) (v_Vuna_dCompiler_dCore_dTerm_ddefaultFuel ())) b))) ((((v_Vuna_dCompiler_dCore_dEval_dforce defs) sols) (v_Vuna_dCompiler_dCore_dTerm_ddefaultFuel ())) a)))))))))
and v_Vuna_dCompiler_dCore_dConv_dconvBothFuel = (fun fuel -> (fun defs -> (fun sols -> (fun depth -> (fun a -> (fun b -> (if ((bi_le_int fuel) 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: conv fuel exhausted")) else (match a with
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVType (dtb__15) -> (match b with
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVType (dtb__16) -> (if ((bi_eq_generic dtb__15) dtb__16) then (C_Base_dResult_dResult_Base_dResult_dOk (sols)) else (((v_Vuna_dCompiler_dCore_dConv_dmismatchAt depth) a) b))
  | _ -> (((v_Vuna_dCompiler_dCore_dConv_dmismatchAt depth) a) b)
)
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVPi (dtb__17, dtb__18, dtb__19, dtb__20, dtb__21) -> (match b with
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVPi (dtb__22, dtb__23, dtb__24, dtb__25, dtb__26) -> (if (((v_Base_dEq_deq (v_Base_dEq_dBase_dEq_dEq_uBase_dEq_dEq_uBool ())) dtb__18) dtb__23) then ((v_Base_dResult_dandThen ((((((v_Vuna_dCompiler_dCore_dConv_dconvFuel ((bi_sub fuel) 1)) defs) sols) depth) dtb__20) dtb__25)) (fun sols2 -> ((fun v -> ((((((v_Vuna_dCompiler_dCore_dConv_dconvFuel ((bi_sub fuel) 1)) defs) sols2) ((bi_add depth) 1)) ((v_Vuna_dCompiler_dCore_dEval_dapplyClosure dtb__21) v)) ((v_Vuna_dCompiler_dCore_dEval_dapplyClosure dtb__26) v))) ((v_Vuna_dCompiler_dCore_dEval_dfreshVar dtb__17) depth)))) else (((v_Vuna_dCompiler_dCore_dConv_dmismatchAt depth) a) b))
  | _ -> (((v_Vuna_dCompiler_dCore_dConv_dmismatchAt depth) a) b)
)
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVLam (dtb__27, dtb__28, dtb__29) -> (match b with
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVLam (dtb__30, dtb__31, dtb__32) -> ((fun v -> ((((((v_Vuna_dCompiler_dCore_dConv_dconvFuel ((bi_sub fuel) 1)) defs) sols) ((bi_add depth) 1)) ((v_Vuna_dCompiler_dCore_dEval_dapplyClosure dtb__29) v)) ((v_Vuna_dCompiler_dCore_dEval_dapplyClosure dtb__32) v))) ((v_Vuna_dCompiler_dCore_dEval_dfreshVar dtb__27) depth))
  | _ -> (((((((v_Vuna_dCompiler_dCore_dConv_detaRightFuel ((bi_sub fuel) 1)) defs) sols) depth) dtb__27) dtb__29) b)
)
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral (dtb__33) -> (match b with
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral (dtb__34) -> (if (if (v_Vuna_dCompiler_dCore_dConv_disBoolNeutral dtb__33) then (v_Vuna_dCompiler_dCore_dConv_disBoolNeutral dtb__34) else false) then (C_Base_dResult_dResult_Base_dResult_dOk (sols)) else ((((((((v_Vuna_dCompiler_dCore_dConv_dconvNeutralFuel ((bi_sub fuel) 1)) defs) sols) depth) dtb__33) dtb__34) a) b))
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVLam (dtb__35, dtb__36, dtb__37) -> (((((((v_Vuna_dCompiler_dCore_dConv_detaLeftFuel ((bi_sub fuel) 1)) defs) sols) depth) a) dtb__35) dtb__37)
  | _ -> (((v_Vuna_dCompiler_dCore_dConv_dmismatchAt depth) a) b)
)
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVInt (dtb__38) -> (match b with
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVInt (dtb__39) -> (if ((bi_eq_int dtb__38) dtb__39) then (C_Base_dResult_dResult_Base_dResult_dOk (sols)) else (((v_Vuna_dCompiler_dCore_dConv_dmismatchAt depth) a) b))
  | _ -> (((v_Vuna_dCompiler_dCore_dConv_dmismatchAt depth) a) b)
)
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVStr (dtb__40) -> (match b with
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVStr (dtb__41) -> (if ((bi_eq_str dtb__40) dtb__41) then (C_Base_dResult_dResult_Base_dResult_dOk (sols)) else (((v_Vuna_dCompiler_dCore_dConv_dmismatchAt depth) a) b))
  | _ -> (((v_Vuna_dCompiler_dCore_dConv_dmismatchAt depth) a) b)
)
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVBool (dtb__42) -> (match b with
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVBool (dtb__43) -> (if (((v_Base_dEq_deq (v_Base_dEq_dBase_dEq_dEq_uBase_dEq_dEq_uBool ())) dtb__42) dtb__43) then (C_Base_dResult_dResult_Base_dResult_dOk (sols)) else (((v_Vuna_dCompiler_dCore_dConv_dmismatchAt depth) a) b))
  | _ -> (((v_Vuna_dCompiler_dCore_dConv_dmismatchAt depth) a) b)
)
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVCon (dtb__44, dtb__45) -> (match b with
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVCon (dtb__46, dtb__47) -> (if ((bi_eq_str dtb__44) dtb__46) then ((((((v_Vuna_dCompiler_dCore_dConv_dconvValueListsFuel ((bi_sub fuel) 1)) defs) sols) depth) dtb__45) dtb__47) else (((v_Vuna_dCompiler_dCore_dConv_dmismatchAt depth) a) b))
  | _ -> (((v_Vuna_dCompiler_dCore_dConv_dmismatchAt depth) a) b)
)
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVApp (dtb__48, dtb__49) -> (match b with
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVApp (dtb__50, dtb__51) -> ((v_Base_dResult_dandThen ((((((v_Vuna_dCompiler_dCore_dConv_dconvFuel ((bi_sub fuel) 1)) defs) sols) depth) dtb__48) dtb__50)) (fun sols2 -> ((((((v_Vuna_dCompiler_dCore_dConv_dconvFuel ((bi_sub fuel) 1)) defs) sols2) depth) dtb__49) dtb__51)))
  | _ -> (((v_Vuna_dCompiler_dCore_dConv_dmismatchAt depth) a) b)
)
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVCase (dtb__52, dtb__53) -> (match b with
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVCase (dtb__54, dtb__55) -> ((v_Base_dResult_dandThen ((((((v_Vuna_dCompiler_dCore_dConv_dconvFuel ((bi_sub fuel) 1)) defs) sols) depth) dtb__52) dtb__54)) (fun sols2 -> ((((((v_Vuna_dCompiler_dCore_dConv_dconvCaseAltsFuel ((bi_sub fuel) 1)) defs) sols2) depth) dtb__53) dtb__55)))
  | _ -> (((v_Vuna_dCompiler_dCore_dConv_dmismatchAt depth) a) b)
)
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVIf (dtb__56, dtb__57, dtb__58) -> (match b with
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVIf (dtb__59, dtb__60, dtb__61) -> ((v_Base_dResult_dandThen ((((((v_Vuna_dCompiler_dCore_dConv_dconvFuel ((bi_sub fuel) 1)) defs) sols) depth) dtb__56) dtb__59)) (fun sols2 -> ((v_Base_dResult_dandThen ((((((v_Vuna_dCompiler_dCore_dConv_dconvFuel ((bi_sub fuel) 1)) defs) sols2) depth) dtb__57) dtb__60)) (fun sols3 -> ((((((v_Vuna_dCompiler_dCore_dConv_dconvFuel ((bi_sub fuel) 1)) defs) sols3) depth) dtb__58) dtb__61)))))
  | _ -> (((v_Vuna_dCompiler_dCore_dConv_dmismatchAt depth) a) b)
)
  | _ -> (((v_Vuna_dCompiler_dCore_dConv_dmismatchAt depth) a) b)
))))))))
and v_Vuna_dCompiler_dCore_dConv_detaLeftFuel = (fun fuel -> (fun defs -> (fun sols -> (fun depth -> (fun a -> (fun name -> (fun clo -> (if ((bi_le_int fuel) 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: conv fuel exhausted")) else ((fun v -> ((((((v_Vuna_dCompiler_dCore_dConv_dconvFuel ((bi_sub fuel) 1)) defs) sols) ((bi_add depth) 1)) ((v_Vuna_dCompiler_dCore_dEval_dapplyValue a) v)) ((v_Vuna_dCompiler_dCore_dEval_dapplyClosure clo) v))) ((v_Vuna_dCompiler_dCore_dEval_dfreshVar name) depth))))))))))
and v_Vuna_dCompiler_dCore_dConv_detaRightFuel = (fun fuel -> (fun defs -> (fun sols -> (fun depth -> (fun name -> (fun clo -> (fun b -> (if ((bi_le_int fuel) 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: conv fuel exhausted")) else ((fun v -> ((((((v_Vuna_dCompiler_dCore_dConv_dconvFuel ((bi_sub fuel) 1)) defs) sols) ((bi_add depth) 1)) ((v_Vuna_dCompiler_dCore_dEval_dapplyClosure clo) v)) ((v_Vuna_dCompiler_dCore_dEval_dapplyValue b) v))) ((v_Vuna_dCompiler_dCore_dEval_dfreshVar name) depth))))))))))
and v_Vuna_dCompiler_dCore_dConv_dconvNeutralFuel = (fun fuel -> (fun defs -> (fun sols -> (fun depth -> (fun n1 -> (fun n2 -> (fun v1 -> (fun v2 -> (if ((bi_le_int fuel) 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: conv fuel exhausted")) else (match n1 with
  | C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNVar (dtb__62, dtb__63, dtb__64) -> (match n2 with
  | C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNVar (dtb__65, dtb__66, dtb__67) -> (if ((bi_eq_int dtb__63) dtb__66) then ((((((((v_Vuna_dCompiler_dCore_dConv_dconvSpinesFuel ((bi_sub fuel) 1)) defs) sols) depth) dtb__64) dtb__67) v1) v2) else (((v_Vuna_dCompiler_dCore_dConv_dmismatchAt depth) v1) v2))
  | _ -> (((v_Vuna_dCompiler_dCore_dConv_dmismatchAt depth) v1) v2)
)
  | C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNGlobal (dtb__68, dtb__69) -> (match n2 with
  | C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNGlobal (dtb__70, dtb__71) -> (if ((bi_eq_str dtb__68) dtb__70) then ((((((((v_Vuna_dCompiler_dCore_dConv_dconvSpinesFuel ((bi_sub fuel) 1)) defs) sols) depth) dtb__69) dtb__71) v1) v2) else (((v_Vuna_dCompiler_dCore_dConv_dmismatchAt depth) v1) v2))
  | _ -> (((v_Vuna_dCompiler_dCore_dConv_dmismatchAt depth) v1) v2)
)
  | _ -> failwith "DT: impossible branch"
))))))))))
and v_Vuna_dCompiler_dCore_dConv_dconvSpinesFuel = (fun mc0 -> (fun mc1 -> (fun mc2 -> (fun mc3 -> (fun mc4 -> (fun mc5 -> (fun mc6 -> (fun mc7 -> (match mc4 with
  | C_Base_dList_dList_Cons (dtb__72, dtb__73) -> (match mc5 with
  | C_Base_dList_dList_Cons (dtb__74, dtb__75) -> (if ((bi_le_int mc0) 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: conv fuel exhausted")) else ((v_Base_dResult_dandThen ((((((v_Vuna_dCompiler_dCore_dConv_dconvFuel ((bi_sub mc0) 1)) mc1) mc2) mc3) dtb__72) dtb__74)) (fun sols2 -> ((((((((v_Vuna_dCompiler_dCore_dConv_dconvSpinesFuel ((bi_sub mc0) 1)) mc1) sols2) mc3) dtb__73) dtb__75) mc6) mc7))))
  | _ -> (if ((bi_le_int mc0) 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: conv fuel exhausted")) else (((v_Vuna_dCompiler_dCore_dConv_dmismatchAt mc3) mc6) mc7))
)
  | C_Base_dList_dList_Nil -> (match mc5 with
  | C_Base_dList_dList_Nil -> (if ((bi_le_int mc0) 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: conv fuel exhausted")) else (C_Base_dResult_dResult_Base_dResult_dOk (mc2)))
  | _ -> (if ((bi_le_int mc0) 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: conv fuel exhausted")) else (((v_Vuna_dCompiler_dCore_dConv_dmismatchAt mc3) mc6) mc7))
)
  | _ -> failwith "DT: impossible branch"
)))))))))
and v_Vuna_dCompiler_dCore_dConv_dconvValueListsFuel = (fun mc0 -> (fun mc1 -> (fun mc2 -> (fun mc3 -> (fun mc4 -> (fun mc5 -> (match mc4 with
  | C_Base_dList_dList_Cons (dtb__76, dtb__77) -> (match mc5 with
  | C_Base_dList_dList_Cons (dtb__78, dtb__79) -> (if ((bi_le_int mc0) 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: conv fuel exhausted")) else ((v_Base_dResult_dandThen ((((((v_Vuna_dCompiler_dCore_dConv_dconvFuel ((bi_sub mc0) 1)) mc1) mc2) mc3) dtb__76) dtb__78)) (fun sols2 -> ((((((v_Vuna_dCompiler_dCore_dConv_dconvValueListsFuel ((bi_sub mc0) 1)) mc1) sols2) mc3) dtb__77) dtb__79))))
  | _ -> (if ((bi_le_int mc0) 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: conv fuel exhausted")) else (C_Base_dResult_dResult_Base_dResult_dErr ("type mismatch: constructor arguments differ in length")))
)
  | C_Base_dList_dList_Nil -> (match mc5 with
  | C_Base_dList_dList_Nil -> (if ((bi_le_int mc0) 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: conv fuel exhausted")) else (C_Base_dResult_dResult_Base_dResult_dOk (mc2)))
  | _ -> (if ((bi_le_int mc0) 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: conv fuel exhausted")) else (C_Base_dResult_dResult_Base_dResult_dErr ("type mismatch: constructor arguments differ in length")))
)
  | _ -> failwith "DT: impossible branch"
)))))))
and v_Vuna_dCompiler_dCore_dConv_dconvCaseAltsFuel = (fun mc0 -> (fun mc1 -> (fun mc2 -> (fun mc3 -> (fun mc4 -> (fun mc5 -> (match mc4 with
  | C_Base_dList_dList_Cons (dtb__80, dtb__81) -> (match mc5 with
  | C_Base_dList_dList_Cons (dtb__82, dtb__83) -> (if ((bi_le_int mc0) 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: conv fuel exhausted")) else (if ((bi_eq_str (v_Vuna_dCompiler_dCore_dTerm_dvCaseAltName dtb__80)) (v_Vuna_dCompiler_dCore_dTerm_dvCaseAltName dtb__82)) then (if ((bi_eq_int (v_Base_dList_dlength (v_Vuna_dCompiler_dCore_dTerm_dvCaseAltBinders dtb__80))) (v_Base_dList_dlength (v_Vuna_dCompiler_dCore_dTerm_dvCaseAltBinders dtb__82))) then (match ((((((v_Vuna_dCompiler_dCore_dConv_dconvOneAltFuel ((bi_sub mc0) 1)) mc1) mc2) mc3) dtb__80) dtb__82) with
  | C_Base_dResult_dResult_Base_dResult_dErr (dtb__84) -> (C_Base_dResult_dResult_Base_dResult_dErr (dtb__84))
  | C_Base_dResult_dResult_Base_dResult_dOk (dtb__85) -> ((((((v_Vuna_dCompiler_dCore_dConv_dconvCaseAltsFuel ((bi_sub mc0) 1)) mc1) dtb__85) mc3) dtb__81) dtb__83)
  | _ -> failwith "DT: impossible branch"
) else (C_Base_dResult_dResult_Base_dResult_dErr (((bi_concat "type mismatch: case branch ") ((bi_concat (v_Vuna_dCompiler_dCore_dTerm_dvCaseAltName dtb__80)) " binds a different number of variables"))))) else (C_Base_dResult_dResult_Base_dResult_dErr (((bi_concat "type mismatch: case branch ") ((bi_concat (v_Vuna_dCompiler_dCore_dTerm_dvCaseAltName dtb__80)) ((bi_concat " vs ") (v_Vuna_dCompiler_dCore_dTerm_dvCaseAltName dtb__82))))))))
  | _ -> (if ((bi_le_int mc0) 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: conv fuel exhausted")) else (C_Base_dResult_dResult_Base_dResult_dErr ("type mismatch: case branches differ in number")))
)
  | C_Base_dList_dList_Nil -> (match mc5 with
  | C_Base_dList_dList_Nil -> (if ((bi_le_int mc0) 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: conv fuel exhausted")) else (C_Base_dResult_dResult_Base_dResult_dOk (mc2)))
  | _ -> (if ((bi_le_int mc0) 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: conv fuel exhausted")) else (C_Base_dResult_dResult_Base_dResult_dErr ("type mismatch: case branches differ in number")))
)
  | _ -> failwith "DT: impossible branch"
)))))))
and v_Vuna_dCompiler_dCore_dConv_dconvOneAltFuel = (fun fuel -> (fun defs -> (fun sols -> (fun depth -> (fun a -> (fun b -> (if ((bi_le_int fuel) 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: conv fuel exhausted")) else ((fun bs -> ((fun n -> ((fun args -> ((((((v_Vuna_dCompiler_dCore_dConv_dconvFuel ((bi_sub fuel) 1)) defs) sols) ((bi_add depth) n)) ((v_Vuna_dCompiler_dCore_dEval_dapplyClosureBinder (v_Vuna_dCompiler_dCore_dTerm_dvCaseAltClosure a)) args)) ((v_Vuna_dCompiler_dCore_dEval_dapplyClosureBinder (v_Vuna_dCompiler_dCore_dTerm_dvCaseAltClosure b)) args))) (((v_Vuna_dCompiler_dCore_dEval_dargValsAt bs) depth) 0))) (v_Base_dList_dlength bs))) (v_Vuna_dCompiler_dCore_dTerm_dvCaseAltBinders a)))))))))
and v_Vuna_dCompiler_dCore_dConv_dsolveMetaFuel = (fun fuel -> (fun defs -> (fun sols -> (fun depth -> (fun m -> (fun sp -> (fun rhs -> (if ((bi_le_int fuel) 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: conv fuel exhausted")) else (match sp with
  | C_Base_dList_dList_Nil -> (match ((v_Vuna_dCompiler_dCore_dTerm_dmetaLookup m) sols) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__86) -> ((((((v_Vuna_dCompiler_dCore_dConv_dconvFuel ((bi_sub fuel) 1)) defs) sols) depth) ((v_Vuna_dCompiler_dCore_dEval_dapplySpine dtb__86) C_Base_dList_dList_Nil)) rhs)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (match rhs with
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVMeta (dtb__87, dtb__88) -> (match dtb__88 with
  | C_Base_dList_dList_Nil -> (if ((bi_eq_int dtb__87) m) then (C_Base_dResult_dResult_Base_dResult_dOk (sols)) else (((((v_Vuna_dCompiler_dCore_dConv_dsolveMetaNew defs) sols) depth) m) rhs))
  | _ -> (((((v_Vuna_dCompiler_dCore_dConv_dsolveMetaNew defs) sols) depth) m) rhs)
)
  | _ -> (((((v_Vuna_dCompiler_dCore_dConv_dsolveMetaNew defs) sols) depth) m) rhs)
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> (((((((v_Vuna_dCompiler_dCore_dConv_dsolveMetaHoFuel ((bi_sub fuel) 1)) defs) sols) depth) m) sp) rhs)
)))))))))
and v_Vuna_dCompiler_dCore_dConv_dsolveMetaHoFuel = (fun fuel -> (fun defs -> (fun sols -> (fun depth -> (fun m -> (fun sp -> (fun rhs -> (if ((bi_le_int fuel) 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: conv fuel exhausted")) else (match rhs with
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVMeta (dtb__89, dtb__90) -> (match ((v_Vuna_dCompiler_dCore_dTerm_dmetaLookup dtb__89) sols) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__91) -> ((((((v_Vuna_dCompiler_dCore_dConv_dconvFuel ((bi_sub fuel) 1)) defs) sols) depth) ((v_Vuna_dCompiler_dCore_dEval_dapplySpine (C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVMeta (m, sp))) C_Base_dList_dList_Nil)) ((v_Vuna_dCompiler_dCore_dEval_dapplySpine dtb__91) dtb__90))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (if ((bi_eq_int m) dtb__89) then ((((((((v_Vuna_dCompiler_dCore_dConv_dconvSpinesFuel ((bi_sub fuel) 1)) defs) sols) depth) sp) dtb__90) (C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVMeta (m, sp))) rhs) else ((v_Base_dResult_dandThen (((((((v_Vuna_dCompiler_dCore_dConv_dsolveMetaFuel ((bi_sub fuel) 1)) defs) sols) depth) m) C_Base_dList_dList_Nil) (C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVMeta (dtb__89, C_Base_dList_dList_Nil)))) (fun sols2 -> ((((((((v_Vuna_dCompiler_dCore_dConv_dconvSpinesFuel ((bi_sub fuel) 1)) defs) sols2) depth) sp) dtb__90) (C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVMeta (m, sp))) rhs))))
  | _ -> failwith "DT: impossible branch"
)
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral (dtb__92) -> (match dtb__92 with
  | C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNGlobal (dtb__93, dtb__94) -> (((((((((v_Vuna_dCompiler_dCore_dConv_dsolveMetaHeadFuel ((bi_sub fuel) 1)) defs) sols) depth) m) sp) (C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral (dtb__92))) (C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral ((C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNGlobal (dtb__93, C_Base_dList_dList_Nil))))) dtb__94)
  | C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNVar (dtb__95, dtb__96, dtb__97) -> (((((((((v_Vuna_dCompiler_dCore_dConv_dsolveMetaHeadFuel ((bi_sub fuel) 1)) defs) sols) depth) m) sp) (C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral (dtb__92))) (C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral ((C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNVar (dtb__95, dtb__96, C_Base_dList_dList_Nil))))) dtb__97)
  | _ -> (C_Base_dResult_dResult_Base_dResult_dErr (((bi_concat "cannot solve higher-order metavariable ?") ((bi_concat (bi_strFromInt m)) ""))))
)
  | _ -> (C_Base_dResult_dResult_Base_dResult_dErr (((bi_concat "cannot solve higher-order metavariable ?") ((bi_concat (bi_strFromInt m)) ""))))
)))))))))
and v_Vuna_dCompiler_dCore_dConv_dsolveMetaHeadFuel = (fun fuel -> (fun defs -> (fun sols -> (fun depth -> (fun m -> (fun sp -> (fun whole -> (fun headVal -> (fun args -> (if ((bi_le_int fuel) 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: conv fuel exhausted")) else (if ((bi_ge_int (v_Base_dList_dlength args)) (v_Base_dList_dlength sp)) then ((fun extra -> (match ((v_Vuna_dCompiler_dCore_dConv_dsplitAtVals extra) args) with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__98, dtb__99) -> ((v_Base_dResult_dandThen (((((((v_Vuna_dCompiler_dCore_dConv_dsolveMetaFuel ((bi_sub fuel) 1)) defs) sols) depth) m) C_Base_dList_dList_Nil) ((v_Vuna_dCompiler_dCore_dEval_dapplySpine headVal) dtb__98))) (fun sols2 -> ((((((((v_Vuna_dCompiler_dCore_dConv_dconvSpinesFuel ((bi_sub fuel) 1)) defs) sols2) depth) sp) dtb__99) (C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVMeta (m, sp))) whole)))
  | _ -> failwith "DT: impossible branch"
)) ((bi_sub (v_Base_dList_dlength args)) (v_Base_dList_dlength sp))) else (C_Base_dResult_dResult_Base_dResult_dErr (((bi_concat "cannot solve higher-order metavariable ?") ((bi_concat (bi_strFromInt m)) "")))))))))))))))

let v_Vuna_dCompiler_dCore_dConv_dconv = (fun a1 -> (fun a2 -> (fun a3 -> (fun a4 -> (fun a5 -> ((((((v_Vuna_dCompiler_dCore_dConv_dconvFuel 64) a1) a2) a3) a4) a5))))))

let v_Vuna_dCompiler_dCore_dConv_dconvBoth = (fun a1 -> (fun a2 -> (fun a3 -> (fun a4 -> (fun a5 -> ((((((v_Vuna_dCompiler_dCore_dConv_dconvBothFuel 64) a1) a2) a3) a4) a5))))))

let v_Vuna_dCompiler_dCore_dConv_dconvCaseAlts = (fun a1 -> (fun a2 -> (fun a3 -> (fun a4 -> (fun a5 -> ((((((v_Vuna_dCompiler_dCore_dConv_dconvCaseAltsFuel 64) a1) a2) a3) a4) a5))))))

let v_Vuna_dCompiler_dCore_dConv_dconvOneAlt = (fun a1 -> (fun a2 -> (fun a3 -> (fun a4 -> (fun a5 -> ((((((v_Vuna_dCompiler_dCore_dConv_dconvOneAltFuel 64) a1) a2) a3) a4) a5))))))

let v_Vuna_dCompiler_dCore_dConv_dconvValueLists = (fun a1 -> (fun a2 -> (fun a3 -> (fun a4 -> (fun a5 -> ((((((v_Vuna_dCompiler_dCore_dConv_dconvValueListsFuel 64) a1) a2) a3) a4) a5))))))

let v_Vuna_dCompiler_dCore_dConv_dconvNeutral = (fun a1 -> (fun a2 -> (fun a3 -> (fun a4 -> (fun a5 -> (fun a6 -> (fun a7 -> ((((((((v_Vuna_dCompiler_dCore_dConv_dconvNeutralFuel 64) a1) a2) a3) a4) a5) a6) a7))))))))

let v_Vuna_dCompiler_dCore_dConv_dconvSpines = (fun a1 -> (fun a2 -> (fun a3 -> (fun a4 -> (fun a5 -> (fun a6 -> (fun a7 -> ((((((((v_Vuna_dCompiler_dCore_dConv_dconvSpinesFuel 64) a1) a2) a3) a4) a5) a6) a7))))))))

let v_Vuna_dCompiler_dCore_dConv_detaLeft = (fun a1 -> (fun a2 -> (fun a3 -> (fun a4 -> (fun a5 -> (fun a6 -> (((((((v_Vuna_dCompiler_dCore_dConv_detaLeftFuel 64) a1) a2) a3) a4) a5) a6)))))))

let v_Vuna_dCompiler_dCore_dConv_detaRight = (fun a1 -> (fun a2 -> (fun a3 -> (fun a4 -> (fun a5 -> (fun a6 -> (((((((v_Vuna_dCompiler_dCore_dConv_detaRightFuel 64) a1) a2) a3) a4) a5) a6)))))))

let v_Vuna_dCompiler_dCore_dConv_dsolveMeta = (fun a1 -> (fun a2 -> (fun a3 -> (fun a4 -> (fun a5 -> (fun a6 -> (((((((v_Vuna_dCompiler_dCore_dConv_dsolveMetaFuel 64) a1) a2) a3) a4) a5) a6)))))))

let v_Vuna_dCompiler_dCore_dConv_dsolveMetaHead = (fun a1 -> (fun a2 -> (fun a3 -> (fun a4 -> (fun a5 -> (fun a6 -> (fun a7 -> (fun a8 -> (((((((((v_Vuna_dCompiler_dCore_dConv_dsolveMetaHeadFuel 64) a1) a2) a3) a4) a5) a6) a7) a8)))))))))

let v_Vuna_dCompiler_dCore_dConv_dsolveMetaHo = (fun a1 -> (fun a2 -> (fun a3 -> (fun a4 -> (fun a5 -> (fun a6 -> (((((((v_Vuna_dCompiler_dCore_dConv_dsolveMetaHoFuel 64) a1) a2) a3) a4) a5) a6)))))))
