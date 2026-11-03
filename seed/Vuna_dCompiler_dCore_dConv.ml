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

let rec v_Vuna_dCompiler_dCore_dConv_dconv = (fun defs -> (fun sols -> (fun depth -> (fun a -> (fun b -> ((fun a2 -> ((fun y2 -> (match a2 with
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVMeta (dtb__11, dtb__12) -> ((((((v_Vuna_dCompiler_dCore_dConv_dsolveMeta defs) sols) depth) dtb__11) dtb__12) y2)
  | _ -> (match y2 with
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVMeta (dtb__13, dtb__14) -> ((((((v_Vuna_dCompiler_dCore_dConv_dsolveMeta defs) sols) depth) dtb__13) dtb__14) a2)
  | _ -> (((((v_Vuna_dCompiler_dCore_dConv_dconvBoth defs) sols) depth) a2) y2)
)
)) ((((v_Vuna_dCompiler_dCore_dEval_dforce defs) sols) (v_Vuna_dCompiler_dCore_dTerm_ddefaultFuel ())) b))) ((((v_Vuna_dCompiler_dCore_dEval_dforce defs) sols) (v_Vuna_dCompiler_dCore_dTerm_ddefaultFuel ())) a)))))))
and v_Vuna_dCompiler_dCore_dConv_dconvBoth = (fun defs -> (fun sols -> (fun depth -> (fun a -> (fun b -> (match a with
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVType (dtb__15) -> (match b with
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVType (dtb__16) -> (if ((bi_eq_generic dtb__15) dtb__16) then (C_Base_dResult_dResult_Base_dResult_dOk (sols)) else (((v_Vuna_dCompiler_dCore_dConv_dmismatchAt depth) a) b))
  | _ -> (((v_Vuna_dCompiler_dCore_dConv_dmismatchAt depth) a) b)
)
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVPi (dtb__17, dtb__18, dtb__19, dtb__20, dtb__21) -> (match b with
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVPi (dtb__22, dtb__23, dtb__24, dtb__25, dtb__26) -> (if (((v_Base_dEq_deq (v_Base_dEq_dBase_dEq_dEq_uBase_dEq_dEq_uBool ())) dtb__18) dtb__23) then ((v_Base_dResult_dandThen (((((v_Vuna_dCompiler_dCore_dConv_dconv defs) sols) depth) dtb__20) dtb__25)) (fun sols2 -> ((fun v -> (((((v_Vuna_dCompiler_dCore_dConv_dconv defs) sols2) ((bi_add depth) 1)) ((v_Vuna_dCompiler_dCore_dEval_dapplyClosure dtb__21) v)) ((v_Vuna_dCompiler_dCore_dEval_dapplyClosure dtb__26) v))) ((v_Vuna_dCompiler_dCore_dEval_dfreshVar dtb__17) depth)))) else (((v_Vuna_dCompiler_dCore_dConv_dmismatchAt depth) a) b))
  | _ -> (((v_Vuna_dCompiler_dCore_dConv_dmismatchAt depth) a) b)
)
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVLam (dtb__27, dtb__28, dtb__29) -> (match b with
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVLam (dtb__30, dtb__31, dtb__32) -> ((fun v -> (((((v_Vuna_dCompiler_dCore_dConv_dconv defs) sols) ((bi_add depth) 1)) ((v_Vuna_dCompiler_dCore_dEval_dapplyClosure dtb__29) v)) ((v_Vuna_dCompiler_dCore_dEval_dapplyClosure dtb__32) v))) ((v_Vuna_dCompiler_dCore_dEval_dfreshVar dtb__27) depth))
  | _ -> ((((((v_Vuna_dCompiler_dCore_dConv_detaRight defs) sols) depth) dtb__27) dtb__29) b)
)
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral (dtb__33) -> (match b with
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral (dtb__34) -> (if (if (v_Vuna_dCompiler_dCore_dConv_disBoolNeutral dtb__33) then (v_Vuna_dCompiler_dCore_dConv_disBoolNeutral dtb__34) else false) then (C_Base_dResult_dResult_Base_dResult_dOk (sols)) else (((((((v_Vuna_dCompiler_dCore_dConv_dconvNeutral defs) sols) depth) dtb__33) dtb__34) a) b))
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVLam (dtb__35, dtb__36, dtb__37) -> ((((((v_Vuna_dCompiler_dCore_dConv_detaLeft defs) sols) depth) a) dtb__35) dtb__37)
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
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVCon (dtb__46, dtb__47) -> (if ((bi_eq_str dtb__44) dtb__46) then (((((v_Vuna_dCompiler_dCore_dConv_dconvValueLists defs) sols) depth) dtb__45) dtb__47) else (((v_Vuna_dCompiler_dCore_dConv_dmismatchAt depth) a) b))
  | _ -> (((v_Vuna_dCompiler_dCore_dConv_dmismatchAt depth) a) b)
)
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVCase (dtb__48, dtb__49) -> (match b with
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVCase (dtb__50, dtb__51) -> ((v_Base_dResult_dandThen (((((v_Vuna_dCompiler_dCore_dConv_dconv defs) sols) depth) dtb__48) dtb__50)) (fun sols2 -> (((((v_Vuna_dCompiler_dCore_dConv_dconvCaseAlts defs) sols2) depth) dtb__49) dtb__51)))
  | _ -> (((v_Vuna_dCompiler_dCore_dConv_dmismatchAt depth) a) b)
)
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVIf (dtb__52, dtb__53, dtb__54) -> (match b with
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVIf (dtb__55, dtb__56, dtb__57) -> ((v_Base_dResult_dandThen (((((v_Vuna_dCompiler_dCore_dConv_dconv defs) sols) depth) dtb__52) dtb__55)) (fun sols2 -> ((v_Base_dResult_dandThen (((((v_Vuna_dCompiler_dCore_dConv_dconv defs) sols2) depth) dtb__53) dtb__56)) (fun sols3 -> (((((v_Vuna_dCompiler_dCore_dConv_dconv defs) sols3) depth) dtb__54) dtb__57)))))
  | _ -> (((v_Vuna_dCompiler_dCore_dConv_dmismatchAt depth) a) b)
)
  | _ -> (((v_Vuna_dCompiler_dCore_dConv_dmismatchAt depth) a) b)
))))))
and v_Vuna_dCompiler_dCore_dConv_detaLeft = (fun defs -> (fun sols -> (fun depth -> (fun a -> (fun name -> (fun clo -> ((fun v -> (((((v_Vuna_dCompiler_dCore_dConv_dconv defs) sols) ((bi_add depth) 1)) ((v_Vuna_dCompiler_dCore_dEval_dapplyValue a) v)) ((v_Vuna_dCompiler_dCore_dEval_dapplyClosure clo) v))) ((v_Vuna_dCompiler_dCore_dEval_dfreshVar name) depth))))))))
and v_Vuna_dCompiler_dCore_dConv_detaRight = (fun defs -> (fun sols -> (fun depth -> (fun name -> (fun clo -> (fun b -> ((fun v -> (((((v_Vuna_dCompiler_dCore_dConv_dconv defs) sols) ((bi_add depth) 1)) ((v_Vuna_dCompiler_dCore_dEval_dapplyClosure clo) v)) ((v_Vuna_dCompiler_dCore_dEval_dapplyValue b) v))) ((v_Vuna_dCompiler_dCore_dEval_dfreshVar name) depth))))))))
and v_Vuna_dCompiler_dCore_dConv_dconvNeutral = (fun defs -> (fun sols -> (fun depth -> (fun n1 -> (fun n2 -> (fun v1 -> (fun v2 -> (match n1 with
  | C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNVar (dtb__58, dtb__59, dtb__60) -> (match n2 with
  | C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNVar (dtb__61, dtb__62, dtb__63) -> (if ((bi_eq_int dtb__59) dtb__62) then (((((((v_Vuna_dCompiler_dCore_dConv_dconvSpines defs) sols) depth) dtb__60) dtb__63) v1) v2) else (((v_Vuna_dCompiler_dCore_dConv_dmismatchAt depth) v1) v2))
  | _ -> (((v_Vuna_dCompiler_dCore_dConv_dmismatchAt depth) v1) v2)
)
  | C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNGlobal (dtb__64, dtb__65) -> (match n2 with
  | C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNGlobal (dtb__66, dtb__67) -> (if ((bi_eq_str dtb__64) dtb__66) then (((((((v_Vuna_dCompiler_dCore_dConv_dconvSpines defs) sols) depth) dtb__65) dtb__67) v1) v2) else (((v_Vuna_dCompiler_dCore_dConv_dmismatchAt depth) v1) v2))
  | _ -> (((v_Vuna_dCompiler_dCore_dConv_dmismatchAt depth) v1) v2)
)
  | _ -> failwith "DT: impossible branch"
))))))))
and v_Vuna_dCompiler_dCore_dConv_dconvSpines = (fun mc0 -> (fun mc1 -> (fun mc2 -> (fun mc3 -> (fun mc4 -> (fun mc5 -> (fun mc6 -> (match mc3 with
  | C_Base_dList_dList_Cons (dtb__68, dtb__69) -> (match mc4 with
  | C_Base_dList_dList_Cons (dtb__70, dtb__71) -> ((v_Base_dResult_dandThen (((((v_Vuna_dCompiler_dCore_dConv_dconv mc0) mc1) mc2) dtb__68) dtb__70)) (fun sols2 -> (((((((v_Vuna_dCompiler_dCore_dConv_dconvSpines mc0) sols2) mc2) dtb__69) dtb__71) mc5) mc6)))
  | _ -> (((v_Vuna_dCompiler_dCore_dConv_dmismatchAt mc2) mc5) mc6)
)
  | C_Base_dList_dList_Nil -> (match mc4 with
  | C_Base_dList_dList_Nil -> (C_Base_dResult_dResult_Base_dResult_dOk (mc1))
  | _ -> (((v_Vuna_dCompiler_dCore_dConv_dmismatchAt mc2) mc5) mc6)
)
  | _ -> failwith "DT: impossible branch"
))))))))
and v_Vuna_dCompiler_dCore_dConv_dconvValueLists = (fun mc0 -> (fun mc1 -> (fun mc2 -> (fun mc3 -> (fun mc4 -> (match mc3 with
  | C_Base_dList_dList_Cons (dtb__72, dtb__73) -> (match mc4 with
  | C_Base_dList_dList_Cons (dtb__74, dtb__75) -> ((v_Base_dResult_dandThen (((((v_Vuna_dCompiler_dCore_dConv_dconv mc0) mc1) mc2) dtb__72) dtb__74)) (fun sols2 -> (((((v_Vuna_dCompiler_dCore_dConv_dconvValueLists mc0) sols2) mc2) dtb__73) dtb__75)))
  | _ -> (C_Base_dResult_dResult_Base_dResult_dErr ("type mismatch: constructor arguments differ in length"))
)
  | C_Base_dList_dList_Nil -> (match mc4 with
  | C_Base_dList_dList_Nil -> (C_Base_dResult_dResult_Base_dResult_dOk (mc1))
  | _ -> (C_Base_dResult_dResult_Base_dResult_dErr ("type mismatch: constructor arguments differ in length"))
)
  | _ -> failwith "DT: impossible branch"
))))))
and v_Vuna_dCompiler_dCore_dConv_dconvCaseAlts = (fun mc0 -> (fun mc1 -> (fun mc2 -> (fun mc3 -> (fun mc4 -> (match mc3 with
  | C_Base_dList_dList_Cons (dtb__76, dtb__77) -> (match mc4 with
  | C_Base_dList_dList_Cons (dtb__78, dtb__79) -> (if ((bi_eq_str (v_Vuna_dCompiler_dCore_dTerm_dvCaseAltName dtb__76)) (v_Vuna_dCompiler_dCore_dTerm_dvCaseAltName dtb__78)) then (if ((bi_eq_int (v_Base_dList_dlength (v_Vuna_dCompiler_dCore_dTerm_dvCaseAltBinders dtb__76))) (v_Base_dList_dlength (v_Vuna_dCompiler_dCore_dTerm_dvCaseAltBinders dtb__78))) then (match (((((v_Vuna_dCompiler_dCore_dConv_dconvOneAlt mc0) mc1) mc2) dtb__76) dtb__78) with
  | C_Base_dResult_dResult_Base_dResult_dErr (dtb__80) -> (C_Base_dResult_dResult_Base_dResult_dErr (dtb__80))
  | C_Base_dResult_dResult_Base_dResult_dOk (dtb__81) -> (((((v_Vuna_dCompiler_dCore_dConv_dconvCaseAlts mc0) dtb__81) mc2) dtb__77) dtb__79)
  | _ -> failwith "DT: impossible branch"
) else (C_Base_dResult_dResult_Base_dResult_dErr (((bi_concat "type mismatch: case branch ") ((bi_concat (v_Vuna_dCompiler_dCore_dTerm_dvCaseAltName dtb__76)) " binds a different number of variables"))))) else (C_Base_dResult_dResult_Base_dResult_dErr (((bi_concat "type mismatch: case branch ") ((bi_concat (v_Vuna_dCompiler_dCore_dTerm_dvCaseAltName dtb__76)) ((bi_concat " vs ") (v_Vuna_dCompiler_dCore_dTerm_dvCaseAltName dtb__78)))))))
  | _ -> (C_Base_dResult_dResult_Base_dResult_dErr ("type mismatch: case branches differ in number"))
)
  | C_Base_dList_dList_Nil -> (match mc4 with
  | C_Base_dList_dList_Nil -> (C_Base_dResult_dResult_Base_dResult_dOk (mc1))
  | _ -> (C_Base_dResult_dResult_Base_dResult_dErr ("type mismatch: case branches differ in number"))
)
  | _ -> failwith "DT: impossible branch"
))))))
and v_Vuna_dCompiler_dCore_dConv_dconvOneAlt = (fun defs -> (fun sols -> (fun depth -> (fun a -> (fun b -> ((fun bs -> ((fun n -> ((fun args -> (((((v_Vuna_dCompiler_dCore_dConv_dconv defs) sols) ((bi_add depth) n)) ((v_Vuna_dCompiler_dCore_dEval_dapplyClosureBinder (v_Vuna_dCompiler_dCore_dTerm_dvCaseAltClosure a)) args)) ((v_Vuna_dCompiler_dCore_dEval_dapplyClosureBinder (v_Vuna_dCompiler_dCore_dTerm_dvCaseAltClosure b)) args))) (((v_Vuna_dCompiler_dCore_dEval_dargValsAt bs) depth) 0))) (v_Base_dList_dlength bs))) (v_Vuna_dCompiler_dCore_dTerm_dvCaseAltBinders a)))))))
and v_Vuna_dCompiler_dCore_dConv_dsolveMeta = (fun defs -> (fun sols -> (fun depth -> (fun m -> (fun sp -> (fun rhs -> (match sp with
  | C_Base_dList_dList_Nil -> (match ((v_Vuna_dCompiler_dCore_dTerm_dmetaLookup m) sols) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__82) -> (((((v_Vuna_dCompiler_dCore_dConv_dconv defs) sols) depth) ((v_Vuna_dCompiler_dCore_dEval_dapplySpine dtb__82) C_Base_dList_dList_Nil)) rhs)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (match rhs with
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVMeta (dtb__83, dtb__84) -> (match dtb__84 with
  | C_Base_dList_dList_Nil -> (if ((bi_eq_int dtb__83) m) then (C_Base_dResult_dResult_Base_dResult_dOk (sols)) else (((((v_Vuna_dCompiler_dCore_dConv_dsolveMetaNew defs) sols) depth) m) rhs))
  | _ -> (((((v_Vuna_dCompiler_dCore_dConv_dsolveMetaNew defs) sols) depth) m) rhs)
)
  | _ -> (((((v_Vuna_dCompiler_dCore_dConv_dsolveMetaNew defs) sols) depth) m) rhs)
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> ((((((v_Vuna_dCompiler_dCore_dConv_dsolveMetaHo defs) sols) depth) m) sp) rhs)
)))))))
and v_Vuna_dCompiler_dCore_dConv_dsolveMetaHo = (fun defs -> (fun sols -> (fun depth -> (fun m -> (fun sp -> (fun rhs -> (match rhs with
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVMeta (dtb__85, dtb__86) -> (match ((v_Vuna_dCompiler_dCore_dTerm_dmetaLookup dtb__85) sols) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__87) -> (((((v_Vuna_dCompiler_dCore_dConv_dconv defs) sols) depth) ((v_Vuna_dCompiler_dCore_dEval_dapplySpine (C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVMeta (m, sp))) C_Base_dList_dList_Nil)) ((v_Vuna_dCompiler_dCore_dEval_dapplySpine dtb__87) dtb__86))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (if ((bi_eq_int m) dtb__85) then (((((((v_Vuna_dCompiler_dCore_dConv_dconvSpines defs) sols) depth) sp) dtb__86) (C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVMeta (m, sp))) rhs) else ((v_Base_dResult_dandThen ((((((v_Vuna_dCompiler_dCore_dConv_dsolveMeta defs) sols) depth) m) C_Base_dList_dList_Nil) (C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVMeta (dtb__85, C_Base_dList_dList_Nil)))) (fun sols2 -> (((((((v_Vuna_dCompiler_dCore_dConv_dconvSpines defs) sols2) depth) sp) dtb__86) (C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVMeta (m, sp))) rhs))))
  | _ -> failwith "DT: impossible branch"
)
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral (dtb__88) -> (match dtb__88 with
  | C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNGlobal (dtb__89, dtb__90) -> ((((((((v_Vuna_dCompiler_dCore_dConv_dsolveMetaHead defs) sols) depth) m) sp) (C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral (dtb__88))) (C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral ((C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNGlobal (dtb__89, C_Base_dList_dList_Nil))))) dtb__90)
  | C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNVar (dtb__91, dtb__92, dtb__93) -> ((((((((v_Vuna_dCompiler_dCore_dConv_dsolveMetaHead defs) sols) depth) m) sp) (C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral (dtb__88))) (C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral ((C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNVar (dtb__91, dtb__92, C_Base_dList_dList_Nil))))) dtb__93)
  | _ -> (C_Base_dResult_dResult_Base_dResult_dErr (((bi_concat "cannot solve higher-order metavariable ?") ((bi_concat (bi_strFromInt m)) " (M13 limitation)"))))
)
  | _ -> (C_Base_dResult_dResult_Base_dResult_dErr (((bi_concat "cannot solve higher-order metavariable ?") ((bi_concat (bi_strFromInt m)) " (M13 limitation)"))))
)))))))
and v_Vuna_dCompiler_dCore_dConv_dsolveMetaHead = (fun defs -> (fun sols -> (fun depth -> (fun m -> (fun sp -> (fun whole -> (fun headVal -> (fun args -> (if ((bi_ge_int (v_Base_dList_dlength args)) (v_Base_dList_dlength sp)) then ((fun extra -> (match ((v_Vuna_dCompiler_dCore_dConv_dsplitAtVals extra) args) with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__94, dtb__95) -> ((v_Base_dResult_dandThen ((((((v_Vuna_dCompiler_dCore_dConv_dsolveMeta defs) sols) depth) m) C_Base_dList_dList_Nil) ((v_Vuna_dCompiler_dCore_dEval_dapplySpine headVal) dtb__94))) (fun sols2 -> (((((((v_Vuna_dCompiler_dCore_dConv_dconvSpines defs) sols2) depth) sp) dtb__95) (C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVMeta (m, sp))) whole)))
  | _ -> failwith "DT: impossible branch"
)) ((bi_sub (v_Base_dList_dlength args)) (v_Base_dList_dlength sp))) else (C_Base_dResult_dResult_Base_dResult_dErr (((bi_concat "cannot solve higher-order metavariable ?") ((bi_concat (bi_strFromInt m)) " (M13 limitation)")))))))))))))
