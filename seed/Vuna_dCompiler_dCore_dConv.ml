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
open Vuna_dCompiler_dLoader_dResolve
open Vuna_dCompiler_dLoader_dFlatten
open Vuna_dCompiler_dLoader
open Vuna_dCompiler_dCore_dTerm
open Vuna_dCompiler_dCore_dEval
let v_Vuna_dCompiler_dCore_dConv_disNilList = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Nil -> true
  | _ -> false
))

let v_Vuna_dCompiler_dCore_dConv_dsameNeutralAtom = (fun n1 -> (fun n2 -> (match n1 with
  | C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNGlobal (dtb__0, dtb__1) -> (match n2 with
  | C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNGlobal (dtb__2, dtb__3) -> (if (if ((bi_eq_str dtb__0) dtb__2) then (v_Vuna_dCompiler_dCore_dConv_disNilList dtb__1) else false) then (v_Vuna_dCompiler_dCore_dConv_disNilList dtb__3) else false)
  | _ -> false
)
  | C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNVar (dtb__4, dtb__5, dtb__6) -> (match n2 with
  | C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNVar (dtb__7, dtb__8, dtb__9) -> (if (if (if ((bi_eq_str dtb__4) dtb__7) then ((bi_eq_int dtb__5) dtb__8) else false) then (v_Vuna_dCompiler_dCore_dConv_disNilList dtb__6) else false) then (v_Vuna_dCompiler_dCore_dConv_disNilList dtb__9) else false)
  | _ -> false
)
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dCore_dConv_dfastSame = (fun a -> (fun b -> (match a with
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVType (dtb__10) -> (match b with
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVType (dtb__11) -> ((bi_eq_generic dtb__10) dtb__11)
  | _ -> false
)
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVInt (dtb__12) -> (match b with
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVInt (dtb__13) -> ((bi_eq_int dtb__12) dtb__13)
  | _ -> false
)
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVStr (dtb__14) -> (match b with
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVStr (dtb__15) -> ((bi_eq_str dtb__14) dtb__15)
  | _ -> false
)
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVBool (dtb__16) -> (match b with
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVBool (dtb__17) -> (if dtb__16 then dtb__17 else (v_Vuna_dCompiler_dCore_dTerm_dnotBool dtb__17))
  | _ -> false
)
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral (dtb__18) -> (match b with
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral (dtb__19) -> ((v_Vuna_dCompiler_dCore_dConv_dsameNeutralAtom dtb__18) dtb__19)
  | _ -> false
)
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVCon (dtb__20, dtb__21) -> (match b with
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVCon (dtb__22, dtb__23) -> (if (if ((bi_eq_str dtb__20) dtb__22) then (v_Vuna_dCompiler_dCore_dConv_disNilList dtb__21) else false) then (v_Vuna_dCompiler_dCore_dConv_disNilList dtb__23) else false)
  | _ -> false
)
  | _ -> false
)))

let v_Vuna_dCompiler_dCore_dConv_disBoolTyName = (fun n -> (if ((bi_eq_str n) "Bool") then true else ((bi_eq_str n) "Base.Bool.Bool")))

let v_Vuna_dCompiler_dCore_dConv_disBoolNeutral = (fun n -> (match n with
  | C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNGlobal (dtb__24, dtb__25) -> (if ((bi_eq_generic dtb__25) C_Base_dList_dList_Nil) then (v_Vuna_dCompiler_dCore_dConv_disBoolTyName dtb__24) else false)
  | C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNVar (dtb__26, dtb__27, dtb__28) -> (if ((bi_eq_generic dtb__28) C_Base_dList_dList_Nil) then (v_Vuna_dCompiler_dCore_dConv_disBoolTyName dtb__26) else false)
  | _ -> false
))

let v_Vuna_dCompiler_dCore_dConv_dmismatchAt = (fun depth -> (fun a -> (fun b -> ((fun sa -> ((fun sb -> (((v_Vuna_dCompiler_dDiagnostics_dtcErr2NoLoc (C_Vuna_dCompiler_dDiagnostics_dTcErr_Vuna_dCompiler_dDiagnostics_dTypeMismatch (sa, sb))) sa) sb)) ((v_Vuna_dCompiler_dCore_dEval_dshowValueAt depth) b))) ((v_Vuna_dCompiler_dCore_dEval_dshowValueAt depth) a)))))

let rec v_Vuna_dCompiler_dCore_dConv_dsplitAtVals = (fun mc0 -> (fun mc1 -> (if ((bi_eq_int mc0) 0) then (match mc1 with
  | C_Base_dList_dList_Cons (dtb__29, dtb__30) -> (C_Base_dPair_dPair_Base_dPair_dPair (C_Base_dList_dList_Nil, mc1))
  | C_Base_dList_dList_Nil -> (C_Base_dPair_dPair_Base_dPair_dPair (C_Base_dList_dList_Nil, mc1))
  | _ -> failwith "DT: impossible branch"
) else (match mc1 with
  | C_Base_dList_dList_Cons (dtb__31, dtb__32) -> (match ((v_Vuna_dCompiler_dCore_dConv_dsplitAtVals ((bi_sub mc0) 1)) dtb__32) with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__33, dtb__34) -> (C_Base_dPair_dPair_Base_dPair_dPair ((C_Base_dList_dList_Cons (dtb__31, dtb__33)), dtb__34))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Nil -> (C_Base_dPair_dPair_Base_dPair_dPair (C_Base_dList_dList_Nil, C_Base_dList_dList_Nil))
  | _ -> failwith "DT: impossible branch"
))))

let v_Vuna_dCompiler_dCore_dConv_dsolveMetaNew = (fun defs -> (fun sols -> (fun depth -> (fun m -> (fun rhs -> ((fun t -> (if (((v_Vuna_dCompiler_dCore_dTerm_dhasMeta m) 0) t) then ((v_Vuna_dCompiler_dDiagnostics_dtcErr1NoLoc (C_Vuna_dCompiler_dDiagnostics_dTcErr_Vuna_dCompiler_dDiagnostics_dCannotSolveOccurs ((bi_strFromInt m)))) (bi_strFromInt m)) else (C_Base_dResult_dResult_Base_dResult_dOk ((((v_Vuna_dCompiler_dCore_dTerm_dsolsCons m) rhs) sols))))) ((v_Vuna_dCompiler_dCore_dEval_dquote depth) rhs)))))))

let rec v_Vuna_dCompiler_dCore_dConv_dconvFuel = (fun fuel -> (fun defs -> (fun sols -> (fun depth -> (fun a -> (fun b -> (if ((bi_le_int fuel) 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: conv fuel exhausted")) else (if ((v_Vuna_dCompiler_dCore_dConv_dfastSame a) b) then (C_Base_dResult_dResult_Base_dResult_dOk (sols)) else ((fun a2 -> ((fun y2 -> (match a2 with
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVMeta (dtb__35, dtb__36) -> (((((((v_Vuna_dCompiler_dCore_dConv_dsolveMetaFuel ((bi_sub fuel) 1)) defs) sols) depth) dtb__35) dtb__36) y2)
  | _ -> (match y2 with
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVMeta (dtb__37, dtb__38) -> (((((((v_Vuna_dCompiler_dCore_dConv_dsolveMetaFuel ((bi_sub fuel) 1)) defs) sols) depth) dtb__37) dtb__38) a2)
  | _ -> ((((((v_Vuna_dCompiler_dCore_dConv_dconvBothFuel ((bi_sub fuel) 1)) defs) sols) depth) a2) y2)
)
)) ((((v_Vuna_dCompiler_dCore_dEval_dforce defs) sols) v_Vuna_dCompiler_dCore_dTerm_ddefaultFuel) b))) ((((v_Vuna_dCompiler_dCore_dEval_dforce defs) sols) v_Vuna_dCompiler_dCore_dTerm_ddefaultFuel) a))))))))))
and v_Vuna_dCompiler_dCore_dConv_dconvBothFuel = (fun fuel -> (fun defs -> (fun sols -> (fun depth -> (fun a -> (fun b -> (if ((bi_le_int fuel) 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: conv fuel exhausted")) else (match a with
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVType (dtb__39) -> (match b with
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVType (dtb__40) -> (if ((bi_eq_generic dtb__39) dtb__40) then (C_Base_dResult_dResult_Base_dResult_dOk (sols)) else (((v_Vuna_dCompiler_dCore_dConv_dmismatchAt depth) a) b))
  | _ -> (((v_Vuna_dCompiler_dCore_dConv_dmismatchAt depth) a) b)
)
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVPi (dtb__41, dtb__42, dtb__43, dtb__44, dtb__45) -> (match b with
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVPi (dtb__46, dtb__47, dtb__48, dtb__49, dtb__50) -> (if (((v_Base_dEq_deq v_Base_dEq_dBase_dEq_dEq_uBase_dEq_dEq_uBool) dtb__42) dtb__47) then ((v_Base_dResult_dandThen ((((((v_Vuna_dCompiler_dCore_dConv_dconvFuel ((bi_sub fuel) 1)) defs) sols) depth) dtb__44) dtb__49)) (fun sols2 -> ((fun v -> ((((((v_Vuna_dCompiler_dCore_dConv_dconvFuel ((bi_sub fuel) 1)) defs) sols2) ((bi_add depth) 1)) ((v_Vuna_dCompiler_dCore_dEval_dapplyClosure dtb__45) v)) ((v_Vuna_dCompiler_dCore_dEval_dapplyClosure dtb__50) v))) ((v_Vuna_dCompiler_dCore_dEval_dfreshVar dtb__41) depth)))) else (((v_Vuna_dCompiler_dCore_dConv_dmismatchAt depth) a) b))
  | _ -> (((v_Vuna_dCompiler_dCore_dConv_dmismatchAt depth) a) b)
)
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVLam (dtb__51, dtb__52, dtb__53) -> (match b with
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVLam (dtb__54, dtb__55, dtb__56) -> ((fun v -> ((((((v_Vuna_dCompiler_dCore_dConv_dconvFuel ((bi_sub fuel) 1)) defs) sols) ((bi_add depth) 1)) ((v_Vuna_dCompiler_dCore_dEval_dapplyClosure dtb__53) v)) ((v_Vuna_dCompiler_dCore_dEval_dapplyClosure dtb__56) v))) ((v_Vuna_dCompiler_dCore_dEval_dfreshVar dtb__51) depth))
  | _ -> (((((((v_Vuna_dCompiler_dCore_dConv_detaRightFuel ((bi_sub fuel) 1)) defs) sols) depth) dtb__51) dtb__53) b)
)
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral (dtb__57) -> (match b with
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral (dtb__58) -> (if (if (v_Vuna_dCompiler_dCore_dConv_disBoolNeutral dtb__57) then (v_Vuna_dCompiler_dCore_dConv_disBoolNeutral dtb__58) else false) then (C_Base_dResult_dResult_Base_dResult_dOk (sols)) else ((((((((v_Vuna_dCompiler_dCore_dConv_dconvNeutralFuel ((bi_sub fuel) 1)) defs) sols) depth) dtb__57) dtb__58) a) b))
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVLam (dtb__59, dtb__60, dtb__61) -> (((((((v_Vuna_dCompiler_dCore_dConv_detaLeftFuel ((bi_sub fuel) 1)) defs) sols) depth) a) dtb__59) dtb__61)
  | _ -> (((v_Vuna_dCompiler_dCore_dConv_dmismatchAt depth) a) b)
)
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVInt (dtb__62) -> (match b with
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVInt (dtb__63) -> (if ((bi_eq_int dtb__62) dtb__63) then (C_Base_dResult_dResult_Base_dResult_dOk (sols)) else (((v_Vuna_dCompiler_dCore_dConv_dmismatchAt depth) a) b))
  | _ -> (((v_Vuna_dCompiler_dCore_dConv_dmismatchAt depth) a) b)
)
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVStr (dtb__64) -> (match b with
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVStr (dtb__65) -> (if ((bi_eq_str dtb__64) dtb__65) then (C_Base_dResult_dResult_Base_dResult_dOk (sols)) else (((v_Vuna_dCompiler_dCore_dConv_dmismatchAt depth) a) b))
  | _ -> (((v_Vuna_dCompiler_dCore_dConv_dmismatchAt depth) a) b)
)
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVBool (dtb__66) -> (match b with
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVBool (dtb__67) -> (if (((v_Base_dEq_deq v_Base_dEq_dBase_dEq_dEq_uBase_dEq_dEq_uBool) dtb__66) dtb__67) then (C_Base_dResult_dResult_Base_dResult_dOk (sols)) else (((v_Vuna_dCompiler_dCore_dConv_dmismatchAt depth) a) b))
  | _ -> (((v_Vuna_dCompiler_dCore_dConv_dmismatchAt depth) a) b)
)
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVCon (dtb__68, dtb__69) -> (match b with
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVCon (dtb__70, dtb__71) -> (if ((bi_eq_str dtb__68) dtb__70) then ((((((v_Vuna_dCompiler_dCore_dConv_dconvValueListsFuel ((bi_sub fuel) 1)) defs) sols) depth) dtb__69) dtb__71) else (((v_Vuna_dCompiler_dCore_dConv_dmismatchAt depth) a) b))
  | _ -> (((v_Vuna_dCompiler_dCore_dConv_dmismatchAt depth) a) b)
)
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVApp (dtb__72, dtb__73) -> (match b with
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVApp (dtb__74, dtb__75) -> ((v_Base_dResult_dandThen ((((((v_Vuna_dCompiler_dCore_dConv_dconvFuel ((bi_sub fuel) 1)) defs) sols) depth) dtb__72) dtb__74)) (fun sols2 -> ((((((v_Vuna_dCompiler_dCore_dConv_dconvFuel ((bi_sub fuel) 1)) defs) sols2) depth) dtb__73) dtb__75)))
  | _ -> (((v_Vuna_dCompiler_dCore_dConv_dmismatchAt depth) a) b)
)
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVCase (dtb__76, dtb__77) -> (match b with
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVCase (dtb__78, dtb__79) -> ((v_Base_dResult_dandThen ((((((v_Vuna_dCompiler_dCore_dConv_dconvFuel ((bi_sub fuel) 1)) defs) sols) depth) dtb__76) dtb__78)) (fun sols2 -> ((((((v_Vuna_dCompiler_dCore_dConv_dconvCaseAltsFuel ((bi_sub fuel) 1)) defs) sols2) depth) dtb__77) dtb__79)))
  | _ -> (((v_Vuna_dCompiler_dCore_dConv_dmismatchAt depth) a) b)
)
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVIf (dtb__80, dtb__81, dtb__82) -> (match b with
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVIf (dtb__83, dtb__84, dtb__85) -> ((v_Base_dResult_dandThen ((((((v_Vuna_dCompiler_dCore_dConv_dconvFuel ((bi_sub fuel) 1)) defs) sols) depth) dtb__80) dtb__83)) (fun sols2 -> ((v_Base_dResult_dandThen ((((((v_Vuna_dCompiler_dCore_dConv_dconvFuel ((bi_sub fuel) 1)) defs) sols2) depth) dtb__81) dtb__84)) (fun sols3 -> ((((((v_Vuna_dCompiler_dCore_dConv_dconvFuel ((bi_sub fuel) 1)) defs) sols3) depth) dtb__82) dtb__85)))))
  | _ -> (((v_Vuna_dCompiler_dCore_dConv_dmismatchAt depth) a) b)
)
  | _ -> (((v_Vuna_dCompiler_dCore_dConv_dmismatchAt depth) a) b)
))))))))
and v_Vuna_dCompiler_dCore_dConv_detaLeftFuel = (fun fuel -> (fun defs -> (fun sols -> (fun depth -> (fun a -> (fun name -> (fun clo -> (if ((bi_le_int fuel) 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: conv fuel exhausted")) else ((fun v -> ((((((v_Vuna_dCompiler_dCore_dConv_dconvFuel ((bi_sub fuel) 1)) defs) sols) ((bi_add depth) 1)) ((v_Vuna_dCompiler_dCore_dEval_dapplyValue a) v)) ((v_Vuna_dCompiler_dCore_dEval_dapplyClosure clo) v))) ((v_Vuna_dCompiler_dCore_dEval_dfreshVar name) depth))))))))))
and v_Vuna_dCompiler_dCore_dConv_detaRightFuel = (fun fuel -> (fun defs -> (fun sols -> (fun depth -> (fun name -> (fun clo -> (fun b -> (if ((bi_le_int fuel) 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: conv fuel exhausted")) else ((fun v -> ((((((v_Vuna_dCompiler_dCore_dConv_dconvFuel ((bi_sub fuel) 1)) defs) sols) ((bi_add depth) 1)) ((v_Vuna_dCompiler_dCore_dEval_dapplyClosure clo) v)) ((v_Vuna_dCompiler_dCore_dEval_dapplyValue b) v))) ((v_Vuna_dCompiler_dCore_dEval_dfreshVar name) depth))))))))))
and v_Vuna_dCompiler_dCore_dConv_dconvNeutralFuel = (fun fuel -> (fun defs -> (fun sols -> (fun depth -> (fun n1 -> (fun n2 -> (fun v1 -> (fun v2 -> (if ((bi_le_int fuel) 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: conv fuel exhausted")) else (match n1 with
  | C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNVar (dtb__86, dtb__87, dtb__88) -> (match n2 with
  | C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNVar (dtb__89, dtb__90, dtb__91) -> (if ((bi_eq_int dtb__87) dtb__90) then ((((((((v_Vuna_dCompiler_dCore_dConv_dconvSpinesFuel ((bi_sub fuel) 1)) defs) sols) depth) dtb__88) dtb__91) v1) v2) else (((v_Vuna_dCompiler_dCore_dConv_dmismatchAt depth) v1) v2))
  | _ -> (((v_Vuna_dCompiler_dCore_dConv_dmismatchAt depth) v1) v2)
)
  | C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNGlobal (dtb__92, dtb__93) -> (match n2 with
  | C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNGlobal (dtb__94, dtb__95) -> (if ((bi_eq_str dtb__92) dtb__94) then ((((((((v_Vuna_dCompiler_dCore_dConv_dconvSpinesFuel ((bi_sub fuel) 1)) defs) sols) depth) dtb__93) dtb__95) v1) v2) else (((v_Vuna_dCompiler_dCore_dConv_dmismatchAt depth) v1) v2))
  | _ -> (((v_Vuna_dCompiler_dCore_dConv_dmismatchAt depth) v1) v2)
)
  | _ -> failwith "DT: impossible branch"
))))))))))
and v_Vuna_dCompiler_dCore_dConv_dconvSpinesFuel = (fun mc0 -> (fun mc1 -> (fun mc2 -> (fun mc3 -> (fun mc4 -> (fun mc5 -> (fun mc6 -> (fun mc7 -> (match mc4 with
  | C_Base_dList_dList_Cons (dtb__96, dtb__97) -> (match mc5 with
  | C_Base_dList_dList_Cons (dtb__98, dtb__99) -> (if ((bi_le_int mc0) 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: conv fuel exhausted")) else ((v_Base_dResult_dandThen ((((((v_Vuna_dCompiler_dCore_dConv_dconvFuel ((bi_sub mc0) 1)) mc1) mc2) mc3) dtb__96) dtb__98)) (fun sols2 -> ((((((((v_Vuna_dCompiler_dCore_dConv_dconvSpinesFuel ((bi_sub mc0) 1)) mc1) sols2) mc3) dtb__97) dtb__99) mc6) mc7))))
  | _ -> (if ((bi_le_int mc0) 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: conv fuel exhausted")) else (((v_Vuna_dCompiler_dCore_dConv_dmismatchAt mc3) mc6) mc7))
)
  | C_Base_dList_dList_Nil -> (match mc5 with
  | C_Base_dList_dList_Nil -> (if ((bi_le_int mc0) 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: conv fuel exhausted")) else (C_Base_dResult_dResult_Base_dResult_dOk (mc2)))
  | _ -> (if ((bi_le_int mc0) 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: conv fuel exhausted")) else (((v_Vuna_dCompiler_dCore_dConv_dmismatchAt mc3) mc6) mc7))
)
  | _ -> failwith "DT: impossible branch"
)))))))))
and v_Vuna_dCompiler_dCore_dConv_dconvValueListsFuel = (fun mc0 -> (fun mc1 -> (fun mc2 -> (fun mc3 -> (fun mc4 -> (fun mc5 -> (match mc4 with
  | C_Base_dList_dList_Cons (dtb__100, dtb__101) -> (match mc5 with
  | C_Base_dList_dList_Cons (dtb__102, dtb__103) -> (if ((bi_le_int mc0) 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: conv fuel exhausted")) else ((v_Base_dResult_dandThen ((((((v_Vuna_dCompiler_dCore_dConv_dconvFuel ((bi_sub mc0) 1)) mc1) mc2) mc3) dtb__100) dtb__102)) (fun sols2 -> ((((((v_Vuna_dCompiler_dCore_dConv_dconvValueListsFuel ((bi_sub mc0) 1)) mc1) sols2) mc3) dtb__101) dtb__103))))
  | _ -> (if ((bi_le_int mc0) 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: conv fuel exhausted")) else (v_Vuna_dCompiler_dDiagnostics_dtcErr0NoLoc C_Vuna_dCompiler_dDiagnostics_dTcErr_Vuna_dCompiler_dDiagnostics_dTypeMismatchCtorArity))
)
  | C_Base_dList_dList_Nil -> (match mc5 with
  | C_Base_dList_dList_Nil -> (if ((bi_le_int mc0) 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: conv fuel exhausted")) else (C_Base_dResult_dResult_Base_dResult_dOk (mc2)))
  | _ -> (if ((bi_le_int mc0) 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: conv fuel exhausted")) else (v_Vuna_dCompiler_dDiagnostics_dtcErr0NoLoc C_Vuna_dCompiler_dDiagnostics_dTcErr_Vuna_dCompiler_dDiagnostics_dTypeMismatchCtorArity))
)
  | _ -> failwith "DT: impossible branch"
)))))))
and v_Vuna_dCompiler_dCore_dConv_dconvCaseAltsFuel = (fun mc0 -> (fun mc1 -> (fun mc2 -> (fun mc3 -> (fun mc4 -> (fun mc5 -> (match mc4 with
  | C_Base_dList_dList_Cons (dtb__104, dtb__105) -> (match mc5 with
  | C_Base_dList_dList_Cons (dtb__106, dtb__107) -> (if ((bi_le_int mc0) 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: conv fuel exhausted")) else (if ((bi_eq_str (v_Vuna_dCompiler_dCore_dTerm_dvCaseAltName dtb__104)) (v_Vuna_dCompiler_dCore_dTerm_dvCaseAltName dtb__106)) then (if ((bi_eq_int (v_Base_dList_dlength (v_Vuna_dCompiler_dCore_dTerm_dvCaseAltBinders dtb__104))) (v_Base_dList_dlength (v_Vuna_dCompiler_dCore_dTerm_dvCaseAltBinders dtb__106))) then (match ((((((v_Vuna_dCompiler_dCore_dConv_dconvOneAltFuel ((bi_sub mc0) 1)) mc1) mc2) mc3) dtb__104) dtb__106) with
  | C_Base_dResult_dResult_Base_dResult_dErr (dtb__108) -> (C_Base_dResult_dResult_Base_dResult_dErr (dtb__108))
  | C_Base_dResult_dResult_Base_dResult_dOk (dtb__109) -> ((((((v_Vuna_dCompiler_dCore_dConv_dconvCaseAltsFuel ((bi_sub mc0) 1)) mc1) dtb__109) mc3) dtb__105) dtb__107)
  | _ -> failwith "DT: impossible branch"
) else ((v_Vuna_dCompiler_dDiagnostics_dtcErr1NoLoc (C_Vuna_dCompiler_dDiagnostics_dTcErr_Vuna_dCompiler_dDiagnostics_dTypeMismatchCaseVars ((v_Vuna_dCompiler_dCore_dTerm_dvCaseAltName dtb__104)))) (v_Vuna_dCompiler_dCore_dTerm_dvCaseAltName dtb__104))) else (((v_Vuna_dCompiler_dDiagnostics_dtcErr2NoLoc (C_Vuna_dCompiler_dDiagnostics_dTcErr_Vuna_dCompiler_dDiagnostics_dTypeMismatchCaseBranch ((v_Vuna_dCompiler_dCore_dTerm_dvCaseAltName dtb__104), (v_Vuna_dCompiler_dCore_dTerm_dvCaseAltName dtb__106)))) (v_Vuna_dCompiler_dCore_dTerm_dvCaseAltName dtb__104)) (v_Vuna_dCompiler_dCore_dTerm_dvCaseAltName dtb__106))))
  | _ -> (if ((bi_le_int mc0) 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: conv fuel exhausted")) else (v_Vuna_dCompiler_dDiagnostics_dtcErr0NoLoc C_Vuna_dCompiler_dDiagnostics_dTcErr_Vuna_dCompiler_dDiagnostics_dTypeMismatchCaseCount))
)
  | C_Base_dList_dList_Nil -> (match mc5 with
  | C_Base_dList_dList_Nil -> (if ((bi_le_int mc0) 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: conv fuel exhausted")) else (C_Base_dResult_dResult_Base_dResult_dOk (mc2)))
  | _ -> (if ((bi_le_int mc0) 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: conv fuel exhausted")) else (v_Vuna_dCompiler_dDiagnostics_dtcErr0NoLoc C_Vuna_dCompiler_dDiagnostics_dTcErr_Vuna_dCompiler_dDiagnostics_dTypeMismatchCaseCount))
)
  | _ -> failwith "DT: impossible branch"
)))))))
and v_Vuna_dCompiler_dCore_dConv_dconvOneAltFuel = (fun fuel -> (fun defs -> (fun sols -> (fun depth -> (fun a -> (fun b -> (if ((bi_le_int fuel) 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: conv fuel exhausted")) else ((fun bs -> ((fun n -> ((fun args -> ((((((v_Vuna_dCompiler_dCore_dConv_dconvFuel ((bi_sub fuel) 1)) defs) sols) ((bi_add depth) n)) ((v_Vuna_dCompiler_dCore_dEval_dapplyClosureBinder (v_Vuna_dCompiler_dCore_dTerm_dvCaseAltClosure a)) args)) ((v_Vuna_dCompiler_dCore_dEval_dapplyClosureBinder (v_Vuna_dCompiler_dCore_dTerm_dvCaseAltClosure b)) args))) (((v_Vuna_dCompiler_dCore_dEval_dargValsAt bs) depth) 0))) (v_Base_dList_dlength bs))) (v_Vuna_dCompiler_dCore_dTerm_dvCaseAltBinders a)))))))))
and v_Vuna_dCompiler_dCore_dConv_dsolveMetaFuel = (fun fuel -> (fun defs -> (fun sols -> (fun depth -> (fun m -> (fun sp -> (fun rhs -> (if ((bi_le_int fuel) 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: conv fuel exhausted")) else (match sp with
  | C_Base_dList_dList_Nil -> (match ((v_Vuna_dCompiler_dCore_dTerm_dsolsLookup m) sols) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__110) -> ((((((v_Vuna_dCompiler_dCore_dConv_dconvFuel ((bi_sub fuel) 1)) defs) sols) depth) ((v_Vuna_dCompiler_dCore_dEval_dapplySpine dtb__110) C_Base_dList_dList_Nil)) rhs)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (match rhs with
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVMeta (dtb__111, dtb__112) -> (match dtb__112 with
  | C_Base_dList_dList_Nil -> (if ((bi_eq_int dtb__111) m) then (C_Base_dResult_dResult_Base_dResult_dOk (sols)) else (((((v_Vuna_dCompiler_dCore_dConv_dsolveMetaNew defs) sols) depth) m) rhs))
  | _ -> (((((v_Vuna_dCompiler_dCore_dConv_dsolveMetaNew defs) sols) depth) m) rhs)
)
  | _ -> (((((v_Vuna_dCompiler_dCore_dConv_dsolveMetaNew defs) sols) depth) m) rhs)
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> (((((((v_Vuna_dCompiler_dCore_dConv_dsolveMetaHoFuel ((bi_sub fuel) 1)) defs) sols) depth) m) sp) rhs)
)))))))))
and v_Vuna_dCompiler_dCore_dConv_dsolveMetaHoFuel = (fun fuel -> (fun defs -> (fun sols -> (fun depth -> (fun m -> (fun sp -> (fun rhs -> (if ((bi_le_int fuel) 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: conv fuel exhausted")) else (match rhs with
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVMeta (dtb__113, dtb__114) -> (match ((v_Vuna_dCompiler_dCore_dTerm_dsolsLookup dtb__113) sols) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__115) -> ((((((v_Vuna_dCompiler_dCore_dConv_dconvFuel ((bi_sub fuel) 1)) defs) sols) depth) ((v_Vuna_dCompiler_dCore_dEval_dapplySpine (C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVMeta (m, sp))) C_Base_dList_dList_Nil)) ((v_Vuna_dCompiler_dCore_dEval_dapplySpine dtb__115) dtb__114))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (if ((bi_eq_int m) dtb__113) then ((((((((v_Vuna_dCompiler_dCore_dConv_dconvSpinesFuel ((bi_sub fuel) 1)) defs) sols) depth) sp) dtb__114) (C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVMeta (m, sp))) rhs) else ((v_Base_dResult_dandThen (((((((v_Vuna_dCompiler_dCore_dConv_dsolveMetaFuel ((bi_sub fuel) 1)) defs) sols) depth) m) C_Base_dList_dList_Nil) (C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVMeta (dtb__113, C_Base_dList_dList_Nil)))) (fun sols2 -> ((((((((v_Vuna_dCompiler_dCore_dConv_dconvSpinesFuel ((bi_sub fuel) 1)) defs) sols2) depth) sp) dtb__114) (C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVMeta (m, sp))) rhs))))
  | _ -> failwith "DT: impossible branch"
)
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral (dtb__116) -> (match dtb__116 with
  | C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNGlobal (dtb__117, dtb__118) -> (((((((((v_Vuna_dCompiler_dCore_dConv_dsolveMetaHeadFuel ((bi_sub fuel) 1)) defs) sols) depth) m) sp) (C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral (dtb__116))) (C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral ((C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNGlobal (dtb__117, C_Base_dList_dList_Nil))))) dtb__118)
  | C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNVar (dtb__119, dtb__120, dtb__121) -> (((((((((v_Vuna_dCompiler_dCore_dConv_dsolveMetaHeadFuel ((bi_sub fuel) 1)) defs) sols) depth) m) sp) (C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral (dtb__116))) (C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral ((C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNVar (dtb__119, dtb__120, C_Base_dList_dList_Nil))))) dtb__121)
  | _ -> ((v_Vuna_dCompiler_dDiagnostics_dtcErr1NoLoc (C_Vuna_dCompiler_dDiagnostics_dTcErr_Vuna_dCompiler_dDiagnostics_dCannotSolveHigherOrder ((bi_strFromInt m)))) (bi_strFromInt m))
)
  | _ -> ((v_Vuna_dCompiler_dDiagnostics_dtcErr1NoLoc (C_Vuna_dCompiler_dDiagnostics_dTcErr_Vuna_dCompiler_dDiagnostics_dCannotSolveHigherOrder ((bi_strFromInt m)))) (bi_strFromInt m))
)))))))))
and v_Vuna_dCompiler_dCore_dConv_dsolveMetaHeadFuel = (fun fuel -> (fun defs -> (fun sols -> (fun depth -> (fun m -> (fun sp -> (fun whole -> (fun headVal -> (fun args -> (if ((bi_le_int fuel) 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: conv fuel exhausted")) else (if ((bi_ge_int (v_Base_dList_dlength args)) (v_Base_dList_dlength sp)) then ((fun extra -> (match ((v_Vuna_dCompiler_dCore_dConv_dsplitAtVals extra) args) with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__122, dtb__123) -> ((v_Base_dResult_dandThen (((((((v_Vuna_dCompiler_dCore_dConv_dsolveMetaFuel ((bi_sub fuel) 1)) defs) sols) depth) m) C_Base_dList_dList_Nil) ((v_Vuna_dCompiler_dCore_dEval_dapplySpine headVal) dtb__122))) (fun sols2 -> ((((((((v_Vuna_dCompiler_dCore_dConv_dconvSpinesFuel ((bi_sub fuel) 1)) defs) sols2) depth) sp) dtb__123) (C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVMeta (m, sp))) whole)))
  | _ -> failwith "DT: impossible branch"
)) ((bi_sub (v_Base_dList_dlength args)) (v_Base_dList_dlength sp))) else ((v_Vuna_dCompiler_dDiagnostics_dtcErr1NoLoc (C_Vuna_dCompiler_dDiagnostics_dTcErr_Vuna_dCompiler_dDiagnostics_dCannotSolveHigherOrder ((bi_strFromInt m)))) (bi_strFromInt m)))))))))))))

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
