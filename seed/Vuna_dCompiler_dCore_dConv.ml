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
let v_Vuna_dCompiler_dCore_dConv_disNilList = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dNil -> true
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

let v_Vuna_dCompiler_dCore_dConv_dmismatchAt = (fun depth -> (fun a -> (fun b -> ((fun sa -> ((fun sb -> (((v_Vuna_dCompiler_dDiagnostics_dtcErr2NoLoc (C_Vuna_dCompiler_dDiagnostics_dTcErr_Vuna_dCompiler_dDiagnostics_dTypeMismatch (sa, sb))) sa) sb)) ((v_Vuna_dCompiler_dCore_dEval_dshowValueAt depth) b))) ((v_Vuna_dCompiler_dCore_dEval_dshowValueAt depth) a)))))

let rec v_Vuna_dCompiler_dCore_dConv_dsplitAtVals = (fun mc0 -> (fun mc1 -> (if ((bi_eq_int mc0) 0) then (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__24, dtb__25) -> (C_Base_dPair_dPair_Base_dPair_dPair (C_Base_dList_dList_Base_dList_dNil, mc1))
  | C_Base_dList_dList_Base_dList_dNil -> (C_Base_dPair_dPair_Base_dPair_dPair (C_Base_dList_dList_Base_dList_dNil, mc1))
  | _ -> failwith "DT: impossible branch"
) else (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__26, dtb__27) -> (match ((v_Vuna_dCompiler_dCore_dConv_dsplitAtVals ((bi_sub mc0) 1)) dtb__27) with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__28, dtb__29) -> (C_Base_dPair_dPair_Base_dPair_dPair ((C_Base_dList_dList_Base_dList_dCons (dtb__26, dtb__28)), dtb__29))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> (C_Base_dPair_dPair_Base_dPair_dPair (C_Base_dList_dList_Base_dList_dNil, C_Base_dList_dList_Base_dList_dNil))
  | _ -> failwith "DT: impossible branch"
))))

let v_Vuna_dCompiler_dCore_dConv_dsolveMetaNew = (fun defs -> (fun sols -> (fun depth -> (fun m -> (fun rhs -> ((fun t -> (if (((v_Vuna_dCompiler_dCore_dTerm_dhasMeta m) 0) t) then ((v_Vuna_dCompiler_dDiagnostics_dtcErr1NoLoc (C_Vuna_dCompiler_dDiagnostics_dTcErr_Vuna_dCompiler_dDiagnostics_dCannotSolveOccurs ((bi_strFromInt m)))) (bi_strFromInt m)) else (C_Base_dResult_dResult_Base_dResult_dOk ((((v_Vuna_dCompiler_dCore_dTerm_dsolsCons m) rhs) sols))))) ((v_Vuna_dCompiler_dCore_dEval_dquote depth) rhs)))))))

let rec v_Vuna_dCompiler_dCore_dConv_dconvFuel = (fun fuel -> (fun defs -> (fun sols -> (fun depth -> (fun a -> (fun b -> (if ((bi_le_int fuel) 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: conv fuel exhausted")) else (if ((v_Vuna_dCompiler_dCore_dConv_dfastSame a) b) then (C_Base_dResult_dResult_Base_dResult_dOk (sols)) else ((fun a2 -> ((fun y2 -> (match a2 with
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVMeta (dtb__30, dtb__31) -> (((((((v_Vuna_dCompiler_dCore_dConv_dsolveMetaFuel ((bi_sub fuel) 1)) defs) sols) depth) dtb__30) dtb__31) y2)
  | _ -> (match y2 with
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVMeta (dtb__32, dtb__33) -> (((((((v_Vuna_dCompiler_dCore_dConv_dsolveMetaFuel ((bi_sub fuel) 1)) defs) sols) depth) dtb__32) dtb__33) a2)
  | _ -> ((((((v_Vuna_dCompiler_dCore_dConv_dconvBothFuel ((bi_sub fuel) 1)) defs) sols) depth) a2) y2)
)
)) ((((v_Vuna_dCompiler_dCore_dEval_dforce defs) sols) v_Vuna_dCompiler_dCore_dTerm_ddefaultFuel) b))) ((((v_Vuna_dCompiler_dCore_dEval_dforce defs) sols) v_Vuna_dCompiler_dCore_dTerm_ddefaultFuel) a))))))))))
and v_Vuna_dCompiler_dCore_dConv_dconvBothFuel = (fun fuel -> (fun defs -> (fun sols -> (fun depth -> (fun a -> (fun b -> (if ((bi_le_int fuel) 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: conv fuel exhausted")) else (match a with
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVType (dtb__34) -> (match b with
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVType (dtb__35) -> (if ((bi_eq_generic dtb__34) dtb__35) then (C_Base_dResult_dResult_Base_dResult_dOk (sols)) else (((v_Vuna_dCompiler_dCore_dConv_dmismatchAt depth) a) b))
  | _ -> (((v_Vuna_dCompiler_dCore_dConv_dmismatchAt depth) a) b)
)
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVPi (dtb__36, dtb__37, dtb__38, dtb__39, dtb__40) -> (match b with
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVPi (dtb__41, dtb__42, dtb__43, dtb__44, dtb__45) -> (if (((v_Base_dEq_deq v_Base_dEq_dBase_dEq_dEq_uBase_dEq_dEq_uBase_dBool_dBool) dtb__37) dtb__42) then ((v_Base_dResult_dandThen ((((((v_Vuna_dCompiler_dCore_dConv_dconvFuel ((bi_sub fuel) 1)) defs) sols) depth) dtb__39) dtb__44)) (fun sols2 -> ((fun v -> ((((((v_Vuna_dCompiler_dCore_dConv_dconvFuel ((bi_sub fuel) 1)) defs) sols2) ((bi_add depth) 1)) ((v_Vuna_dCompiler_dCore_dEval_dapplyClosure dtb__40) v)) ((v_Vuna_dCompiler_dCore_dEval_dapplyClosure dtb__45) v))) ((v_Vuna_dCompiler_dCore_dEval_dfreshVar dtb__36) depth)))) else (((v_Vuna_dCompiler_dCore_dConv_dmismatchAt depth) a) b))
  | _ -> (((v_Vuna_dCompiler_dCore_dConv_dmismatchAt depth) a) b)
)
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVLam (dtb__46, dtb__47, dtb__48) -> (match b with
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVLam (dtb__49, dtb__50, dtb__51) -> ((fun v -> ((((((v_Vuna_dCompiler_dCore_dConv_dconvFuel ((bi_sub fuel) 1)) defs) sols) ((bi_add depth) 1)) ((v_Vuna_dCompiler_dCore_dEval_dapplyClosure dtb__48) v)) ((v_Vuna_dCompiler_dCore_dEval_dapplyClosure dtb__51) v))) ((v_Vuna_dCompiler_dCore_dEval_dfreshVar dtb__46) depth))
  | _ -> (((((((v_Vuna_dCompiler_dCore_dConv_detaRightFuel ((bi_sub fuel) 1)) defs) sols) depth) dtb__46) dtb__48) b)
)
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral (dtb__52) -> (match b with
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral (dtb__53) -> ((((((((v_Vuna_dCompiler_dCore_dConv_dconvNeutralFuel ((bi_sub fuel) 1)) defs) sols) depth) dtb__52) dtb__53) a) b)
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVLam (dtb__54, dtb__55, dtb__56) -> (((((((v_Vuna_dCompiler_dCore_dConv_detaLeftFuel ((bi_sub fuel) 1)) defs) sols) depth) a) dtb__54) dtb__56)
  | _ -> (((v_Vuna_dCompiler_dCore_dConv_dmismatchAt depth) a) b)
)
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVInt (dtb__57) -> (match b with
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVInt (dtb__58) -> (if ((bi_eq_int dtb__57) dtb__58) then (C_Base_dResult_dResult_Base_dResult_dOk (sols)) else (((v_Vuna_dCompiler_dCore_dConv_dmismatchAt depth) a) b))
  | _ -> (((v_Vuna_dCompiler_dCore_dConv_dmismatchAt depth) a) b)
)
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVStr (dtb__59) -> (match b with
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVStr (dtb__60) -> (if ((bi_eq_str dtb__59) dtb__60) then (C_Base_dResult_dResult_Base_dResult_dOk (sols)) else (((v_Vuna_dCompiler_dCore_dConv_dmismatchAt depth) a) b))
  | _ -> (((v_Vuna_dCompiler_dCore_dConv_dmismatchAt depth) a) b)
)
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVBool (dtb__61) -> (match b with
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVBool (dtb__62) -> (if (((v_Base_dEq_deq v_Base_dEq_dBase_dEq_dEq_uBase_dEq_dEq_uBase_dBool_dBool) dtb__61) dtb__62) then (C_Base_dResult_dResult_Base_dResult_dOk (sols)) else (((v_Vuna_dCompiler_dCore_dConv_dmismatchAt depth) a) b))
  | _ -> (((v_Vuna_dCompiler_dCore_dConv_dmismatchAt depth) a) b)
)
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVCon (dtb__63, dtb__64) -> (match b with
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVCon (dtb__65, dtb__66) -> (if ((bi_eq_str dtb__63) dtb__65) then ((((((v_Vuna_dCompiler_dCore_dConv_dconvValueListsFuel ((bi_sub fuel) 1)) defs) sols) depth) dtb__64) dtb__66) else (((v_Vuna_dCompiler_dCore_dConv_dmismatchAt depth) a) b))
  | _ -> (((v_Vuna_dCompiler_dCore_dConv_dmismatchAt depth) a) b)
)
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVApp (dtb__67, dtb__68) -> (match b with
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVApp (dtb__69, dtb__70) -> ((v_Base_dResult_dandThen ((((((v_Vuna_dCompiler_dCore_dConv_dconvFuel ((bi_sub fuel) 1)) defs) sols) depth) dtb__67) dtb__69)) (fun sols2 -> ((((((v_Vuna_dCompiler_dCore_dConv_dconvFuel ((bi_sub fuel) 1)) defs) sols2) depth) dtb__68) dtb__70)))
  | _ -> (((v_Vuna_dCompiler_dCore_dConv_dmismatchAt depth) a) b)
)
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVCase (dtb__71, dtb__72) -> (match b with
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVCase (dtb__73, dtb__74) -> ((v_Base_dResult_dandThen ((((((v_Vuna_dCompiler_dCore_dConv_dconvFuel ((bi_sub fuel) 1)) defs) sols) depth) dtb__71) dtb__73)) (fun sols2 -> ((((((v_Vuna_dCompiler_dCore_dConv_dconvCaseAltsFuel ((bi_sub fuel) 1)) defs) sols2) depth) dtb__72) dtb__74)))
  | _ -> (((v_Vuna_dCompiler_dCore_dConv_dmismatchAt depth) a) b)
)
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVIf (dtb__75, dtb__76, dtb__77) -> (match b with
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVIf (dtb__78, dtb__79, dtb__80) -> ((v_Base_dResult_dandThen ((((((v_Vuna_dCompiler_dCore_dConv_dconvFuel ((bi_sub fuel) 1)) defs) sols) depth) dtb__75) dtb__78)) (fun sols2 -> ((v_Base_dResult_dandThen ((((((v_Vuna_dCompiler_dCore_dConv_dconvFuel ((bi_sub fuel) 1)) defs) sols2) depth) dtb__76) dtb__79)) (fun sols3 -> ((((((v_Vuna_dCompiler_dCore_dConv_dconvFuel ((bi_sub fuel) 1)) defs) sols3) depth) dtb__77) dtb__80)))))
  | _ -> (((v_Vuna_dCompiler_dCore_dConv_dmismatchAt depth) a) b)
)
  | _ -> (((v_Vuna_dCompiler_dCore_dConv_dmismatchAt depth) a) b)
))))))))
and v_Vuna_dCompiler_dCore_dConv_detaLeftFuel = (fun fuel -> (fun defs -> (fun sols -> (fun depth -> (fun a -> (fun name -> (fun clo -> (if ((bi_le_int fuel) 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: conv fuel exhausted")) else ((fun v -> ((((((v_Vuna_dCompiler_dCore_dConv_dconvFuel ((bi_sub fuel) 1)) defs) sols) ((bi_add depth) 1)) ((v_Vuna_dCompiler_dCore_dEval_dapplyValue a) v)) ((v_Vuna_dCompiler_dCore_dEval_dapplyClosure clo) v))) ((v_Vuna_dCompiler_dCore_dEval_dfreshVar name) depth))))))))))
and v_Vuna_dCompiler_dCore_dConv_detaRightFuel = (fun fuel -> (fun defs -> (fun sols -> (fun depth -> (fun name -> (fun clo -> (fun b -> (if ((bi_le_int fuel) 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: conv fuel exhausted")) else ((fun v -> ((((((v_Vuna_dCompiler_dCore_dConv_dconvFuel ((bi_sub fuel) 1)) defs) sols) ((bi_add depth) 1)) ((v_Vuna_dCompiler_dCore_dEval_dapplyClosure clo) v)) ((v_Vuna_dCompiler_dCore_dEval_dapplyValue b) v))) ((v_Vuna_dCompiler_dCore_dEval_dfreshVar name) depth))))))))))
and v_Vuna_dCompiler_dCore_dConv_dconvNeutralFuel = (fun fuel -> (fun defs -> (fun sols -> (fun depth -> (fun n1 -> (fun n2 -> (fun v1 -> (fun v2 -> (if ((bi_le_int fuel) 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: conv fuel exhausted")) else (match n1 with
  | C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNVar (dtb__81, dtb__82, dtb__83) -> (match n2 with
  | C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNVar (dtb__84, dtb__85, dtb__86) -> (if ((bi_eq_int dtb__82) dtb__85) then ((((((((v_Vuna_dCompiler_dCore_dConv_dconvSpinesFuel ((bi_sub fuel) 1)) defs) sols) depth) dtb__83) dtb__86) v1) v2) else (((v_Vuna_dCompiler_dCore_dConv_dmismatchAt depth) v1) v2))
  | _ -> (((v_Vuna_dCompiler_dCore_dConv_dmismatchAt depth) v1) v2)
)
  | C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNGlobal (dtb__87, dtb__88) -> (match n2 with
  | C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNGlobal (dtb__89, dtb__90) -> (if ((bi_eq_str dtb__87) dtb__89) then ((((((((v_Vuna_dCompiler_dCore_dConv_dconvSpinesFuel ((bi_sub fuel) 1)) defs) sols) depth) dtb__88) dtb__90) v1) v2) else (((v_Vuna_dCompiler_dCore_dConv_dmismatchAt depth) v1) v2))
  | _ -> (((v_Vuna_dCompiler_dCore_dConv_dmismatchAt depth) v1) v2)
)
  | _ -> failwith "DT: impossible branch"
))))))))))
and v_Vuna_dCompiler_dCore_dConv_dconvSpinesFuel = (fun mc0 -> (fun mc1 -> (fun mc2 -> (fun mc3 -> (fun mc4 -> (fun mc5 -> (fun mc6 -> (fun mc7 -> (match mc4 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__91, dtb__92) -> (match mc5 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__93, dtb__94) -> (if ((bi_le_int mc0) 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: conv fuel exhausted")) else ((v_Base_dResult_dandThen ((((((v_Vuna_dCompiler_dCore_dConv_dconvFuel ((bi_sub mc0) 1)) mc1) mc2) mc3) dtb__91) dtb__93)) (fun sols2 -> ((((((((v_Vuna_dCompiler_dCore_dConv_dconvSpinesFuel ((bi_sub mc0) 1)) mc1) sols2) mc3) dtb__92) dtb__94) mc6) mc7))))
  | _ -> (if ((bi_le_int mc0) 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: conv fuel exhausted")) else (((v_Vuna_dCompiler_dCore_dConv_dmismatchAt mc3) mc6) mc7))
)
  | C_Base_dList_dList_Base_dList_dNil -> (match mc5 with
  | C_Base_dList_dList_Base_dList_dNil -> (if ((bi_le_int mc0) 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: conv fuel exhausted")) else (C_Base_dResult_dResult_Base_dResult_dOk (mc2)))
  | _ -> (if ((bi_le_int mc0) 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: conv fuel exhausted")) else (((v_Vuna_dCompiler_dCore_dConv_dmismatchAt mc3) mc6) mc7))
)
  | _ -> failwith "DT: impossible branch"
)))))))))
and v_Vuna_dCompiler_dCore_dConv_dconvValueListsFuel = (fun mc0 -> (fun mc1 -> (fun mc2 -> (fun mc3 -> (fun mc4 -> (fun mc5 -> (match mc4 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__95, dtb__96) -> (match mc5 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__97, dtb__98) -> (if ((bi_le_int mc0) 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: conv fuel exhausted")) else ((v_Base_dResult_dandThen ((((((v_Vuna_dCompiler_dCore_dConv_dconvFuel ((bi_sub mc0) 1)) mc1) mc2) mc3) dtb__95) dtb__97)) (fun sols2 -> ((((((v_Vuna_dCompiler_dCore_dConv_dconvValueListsFuel ((bi_sub mc0) 1)) mc1) sols2) mc3) dtb__96) dtb__98))))
  | _ -> (if ((bi_le_int mc0) 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: conv fuel exhausted")) else (v_Vuna_dCompiler_dDiagnostics_dtcErr0NoLoc C_Vuna_dCompiler_dDiagnostics_dTcErr_Vuna_dCompiler_dDiagnostics_dTypeMismatchCtorArity))
)
  | C_Base_dList_dList_Base_dList_dNil -> (match mc5 with
  | C_Base_dList_dList_Base_dList_dNil -> (if ((bi_le_int mc0) 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: conv fuel exhausted")) else (C_Base_dResult_dResult_Base_dResult_dOk (mc2)))
  | _ -> (if ((bi_le_int mc0) 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: conv fuel exhausted")) else (v_Vuna_dCompiler_dDiagnostics_dtcErr0NoLoc C_Vuna_dCompiler_dDiagnostics_dTcErr_Vuna_dCompiler_dDiagnostics_dTypeMismatchCtorArity))
)
  | _ -> failwith "DT: impossible branch"
)))))))
and v_Vuna_dCompiler_dCore_dConv_dconvCaseAltsFuel = (fun mc0 -> (fun mc1 -> (fun mc2 -> (fun mc3 -> (fun mc4 -> (fun mc5 -> (match mc4 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__99, dtb__100) -> (match mc5 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__101, dtb__102) -> (if ((bi_le_int mc0) 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: conv fuel exhausted")) else (if ((bi_eq_str (v_Vuna_dCompiler_dCore_dTerm_dvCaseAltName dtb__99)) (v_Vuna_dCompiler_dCore_dTerm_dvCaseAltName dtb__101)) then (if ((bi_eq_int (v_Base_dList_dlength (v_Vuna_dCompiler_dCore_dTerm_dvCaseAltBinders dtb__99))) (v_Base_dList_dlength (v_Vuna_dCompiler_dCore_dTerm_dvCaseAltBinders dtb__101))) then (match ((((((v_Vuna_dCompiler_dCore_dConv_dconvOneAltFuel ((bi_sub mc0) 1)) mc1) mc2) mc3) dtb__99) dtb__101) with
  | C_Base_dResult_dResult_Base_dResult_dErr (dtb__103) -> (C_Base_dResult_dResult_Base_dResult_dErr (dtb__103))
  | C_Base_dResult_dResult_Base_dResult_dOk (dtb__104) -> ((((((v_Vuna_dCompiler_dCore_dConv_dconvCaseAltsFuel ((bi_sub mc0) 1)) mc1) dtb__104) mc3) dtb__100) dtb__102)
  | _ -> failwith "DT: impossible branch"
) else ((v_Vuna_dCompiler_dDiagnostics_dtcErr1NoLoc (C_Vuna_dCompiler_dDiagnostics_dTcErr_Vuna_dCompiler_dDiagnostics_dTypeMismatchCaseVars ((v_Vuna_dCompiler_dCore_dTerm_dvCaseAltName dtb__99)))) (v_Vuna_dCompiler_dCore_dTerm_dvCaseAltName dtb__99))) else (((v_Vuna_dCompiler_dDiagnostics_dtcErr2NoLoc (C_Vuna_dCompiler_dDiagnostics_dTcErr_Vuna_dCompiler_dDiagnostics_dTypeMismatchCaseBranch ((v_Vuna_dCompiler_dCore_dTerm_dvCaseAltName dtb__99), (v_Vuna_dCompiler_dCore_dTerm_dvCaseAltName dtb__101)))) (v_Vuna_dCompiler_dCore_dTerm_dvCaseAltName dtb__99)) (v_Vuna_dCompiler_dCore_dTerm_dvCaseAltName dtb__101))))
  | _ -> (if ((bi_le_int mc0) 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: conv fuel exhausted")) else (v_Vuna_dCompiler_dDiagnostics_dtcErr0NoLoc C_Vuna_dCompiler_dDiagnostics_dTcErr_Vuna_dCompiler_dDiagnostics_dTypeMismatchCaseCount))
)
  | C_Base_dList_dList_Base_dList_dNil -> (match mc5 with
  | C_Base_dList_dList_Base_dList_dNil -> (if ((bi_le_int mc0) 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: conv fuel exhausted")) else (C_Base_dResult_dResult_Base_dResult_dOk (mc2)))
  | _ -> (if ((bi_le_int mc0) 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: conv fuel exhausted")) else (v_Vuna_dCompiler_dDiagnostics_dtcErr0NoLoc C_Vuna_dCompiler_dDiagnostics_dTcErr_Vuna_dCompiler_dDiagnostics_dTypeMismatchCaseCount))
)
  | _ -> failwith "DT: impossible branch"
)))))))
and v_Vuna_dCompiler_dCore_dConv_dconvOneAltFuel = (fun fuel -> (fun defs -> (fun sols -> (fun depth -> (fun a -> (fun b -> (if ((bi_le_int fuel) 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: conv fuel exhausted")) else ((fun bs -> ((fun n -> ((fun args -> ((((((v_Vuna_dCompiler_dCore_dConv_dconvFuel ((bi_sub fuel) 1)) defs) sols) ((bi_add depth) n)) ((v_Vuna_dCompiler_dCore_dEval_dapplyClosureBinder (v_Vuna_dCompiler_dCore_dTerm_dvCaseAltClosure a)) args)) ((v_Vuna_dCompiler_dCore_dEval_dapplyClosureBinder (v_Vuna_dCompiler_dCore_dTerm_dvCaseAltClosure b)) args))) (((v_Vuna_dCompiler_dCore_dEval_dargValsAt bs) depth) 0))) (v_Base_dList_dlength bs))) (v_Vuna_dCompiler_dCore_dTerm_dvCaseAltBinders a)))))))))
and v_Vuna_dCompiler_dCore_dConv_dsolveMetaFuel = (fun fuel -> (fun defs -> (fun sols -> (fun depth -> (fun m -> (fun sp -> (fun rhs -> (if ((bi_le_int fuel) 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: conv fuel exhausted")) else (match sp with
  | C_Base_dList_dList_Base_dList_dNil -> (match ((v_Vuna_dCompiler_dCore_dTerm_dsolsLookup m) sols) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__105) -> ((((((v_Vuna_dCompiler_dCore_dConv_dconvFuel ((bi_sub fuel) 1)) defs) sols) depth) ((v_Vuna_dCompiler_dCore_dEval_dapplySpine dtb__105) C_Base_dList_dList_Base_dList_dNil)) rhs)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (match rhs with
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVMeta (dtb__106, dtb__107) -> (match dtb__107 with
  | C_Base_dList_dList_Base_dList_dNil -> (if ((bi_eq_int dtb__106) m) then (C_Base_dResult_dResult_Base_dResult_dOk (sols)) else (((((v_Vuna_dCompiler_dCore_dConv_dsolveMetaNew defs) sols) depth) m) rhs))
  | _ -> (((((v_Vuna_dCompiler_dCore_dConv_dsolveMetaNew defs) sols) depth) m) rhs)
)
  | _ -> (((((v_Vuna_dCompiler_dCore_dConv_dsolveMetaNew defs) sols) depth) m) rhs)
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> (((((((v_Vuna_dCompiler_dCore_dConv_dsolveMetaHoFuel ((bi_sub fuel) 1)) defs) sols) depth) m) sp) rhs)
)))))))))
and v_Vuna_dCompiler_dCore_dConv_dsolveMetaHoFuel = (fun fuel -> (fun defs -> (fun sols -> (fun depth -> (fun m -> (fun sp -> (fun rhs -> (if ((bi_le_int fuel) 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: conv fuel exhausted")) else (match rhs with
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVMeta (dtb__108, dtb__109) -> (match ((v_Vuna_dCompiler_dCore_dTerm_dsolsLookup dtb__108) sols) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__110) -> ((((((v_Vuna_dCompiler_dCore_dConv_dconvFuel ((bi_sub fuel) 1)) defs) sols) depth) ((v_Vuna_dCompiler_dCore_dEval_dapplySpine (C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVMeta (m, sp))) C_Base_dList_dList_Base_dList_dNil)) ((v_Vuna_dCompiler_dCore_dEval_dapplySpine dtb__110) dtb__109))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (if ((bi_eq_int m) dtb__108) then ((((((((v_Vuna_dCompiler_dCore_dConv_dconvSpinesFuel ((bi_sub fuel) 1)) defs) sols) depth) sp) dtb__109) (C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVMeta (m, sp))) rhs) else ((v_Base_dResult_dandThen (((((((v_Vuna_dCompiler_dCore_dConv_dsolveMetaFuel ((bi_sub fuel) 1)) defs) sols) depth) m) C_Base_dList_dList_Base_dList_dNil) (C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVMeta (dtb__108, C_Base_dList_dList_Base_dList_dNil)))) (fun sols2 -> ((((((((v_Vuna_dCompiler_dCore_dConv_dconvSpinesFuel ((bi_sub fuel) 1)) defs) sols2) depth) sp) dtb__109) (C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVMeta (m, sp))) rhs))))
  | _ -> failwith "DT: impossible branch"
)
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral (dtb__111) -> (match dtb__111 with
  | C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNGlobal (dtb__112, dtb__113) -> (((((((((v_Vuna_dCompiler_dCore_dConv_dsolveMetaHeadFuel ((bi_sub fuel) 1)) defs) sols) depth) m) sp) (C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral (dtb__111))) (C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral ((C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNGlobal (dtb__112, C_Base_dList_dList_Base_dList_dNil))))) dtb__113)
  | C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNVar (dtb__114, dtb__115, dtb__116) -> (((((((((v_Vuna_dCompiler_dCore_dConv_dsolveMetaHeadFuel ((bi_sub fuel) 1)) defs) sols) depth) m) sp) (C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral (dtb__111))) (C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral ((C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNVar (dtb__114, dtb__115, C_Base_dList_dList_Base_dList_dNil))))) dtb__116)
  | _ -> ((v_Vuna_dCompiler_dDiagnostics_dtcErr1NoLoc (C_Vuna_dCompiler_dDiagnostics_dTcErr_Vuna_dCompiler_dDiagnostics_dCannotSolveHigherOrder ((bi_strFromInt m)))) (bi_strFromInt m))
)
  | _ -> ((v_Vuna_dCompiler_dDiagnostics_dtcErr1NoLoc (C_Vuna_dCompiler_dDiagnostics_dTcErr_Vuna_dCompiler_dDiagnostics_dCannotSolveHigherOrder ((bi_strFromInt m)))) (bi_strFromInt m))
)))))))))
and v_Vuna_dCompiler_dCore_dConv_dsolveMetaHeadFuel = (fun fuel -> (fun defs -> (fun sols -> (fun depth -> (fun m -> (fun sp -> (fun whole -> (fun headVal -> (fun args -> (if ((bi_le_int fuel) 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: conv fuel exhausted")) else (if ((bi_ge_int (v_Base_dList_dlength args)) (v_Base_dList_dlength sp)) then ((fun extra -> (match ((v_Vuna_dCompiler_dCore_dConv_dsplitAtVals extra) args) with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__117, dtb__118) -> ((v_Base_dResult_dandThen (((((((v_Vuna_dCompiler_dCore_dConv_dsolveMetaFuel ((bi_sub fuel) 1)) defs) sols) depth) m) C_Base_dList_dList_Base_dList_dNil) ((v_Vuna_dCompiler_dCore_dEval_dapplySpine headVal) dtb__117))) (fun sols2 -> ((((((((v_Vuna_dCompiler_dCore_dConv_dconvSpinesFuel ((bi_sub fuel) 1)) defs) sols2) depth) sp) dtb__118) (C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVMeta (m, sp))) whole)))
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
