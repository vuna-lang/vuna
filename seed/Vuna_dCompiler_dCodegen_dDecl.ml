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
open Base_dNat
open Base_dVec
open Vuna_dCompiler_dLoader_dDiagnostics
open Vuna_dCompiler_dFrontend_dAst
open Vuna_dCompiler_dFrontend_dDiagnostics
open Vuna_dCompiler_dFrontend_dLexer
open Vuna_dCompiler_dFrontend_dParser_dSupport
open Vuna_dCompiler_dFrontend_dParser
open Vuna_dCompiler_dLoader_dModules
open Vuna_dCompiler_dLoader_dResolve
open Vuna_dCompiler_dLoader_dFlatten
open Vuna_dCompiler_dLoader
open Vuna_dCompiler_dDebug
open Vuna_dCompiler_dDiagnostics
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
open Vuna_dCompiler_dElab_dData
open Vuna_dCompiler_dElab_dTrait
open Vuna_dCompiler_dElab_dDerive
open Vuna_dCompiler_dElab_dRecords
open Vuna_dCompiler_dElab_dTermination_dMeasure
open Vuna_dCompiler_dElab_dTermination_dScc
open Vuna_dCompiler_dElab_dTermination
open Vuna_dCompiler_dElab_dDriver
open Vuna_dCompiler_dElab
let v_Vuna_dCompiler_dCodegen_dDecl_dsanitizeChar = (fun c -> (if ((bi_eq_int c) 46) then (C_Base_dList_dList_Cons (95, (C_Base_dList_dList_Cons (100, C_Base_dList_dList_Nil)))) else (if ((bi_eq_int c) 95) then (C_Base_dList_dList_Cons (95, (C_Base_dList_dList_Cons (117, C_Base_dList_dList_Nil)))) else (if ((bi_eq_int c) 39) then (C_Base_dList_dList_Cons (95, (C_Base_dList_dList_Cons (112, C_Base_dList_dList_Nil)))) else (if ((bi_eq_int c) 35) then (C_Base_dList_dList_Cons (95, (C_Base_dList_dList_Cons (104, C_Base_dList_dList_Nil)))) else (C_Base_dList_dList_Cons (c, C_Base_dList_dList_Nil)))))))

let v_Vuna_dCompiler_dCodegen_dDecl_dsanitizeName = (fun name -> (dtp_pack ((v_Base_dList_dconcatMap v_Vuna_dCompiler_dCodegen_dDecl_dsanitizeChar) (dtp_unpack name))))

let v_Vuna_dCompiler_dCodegen_dDecl_docamlPad3 = (fun s -> (if ((bi_eq_int (bi_strLength s)) 1) then ((bi_concat "00") s) else (if ((bi_eq_int (bi_strLength s)) 2) then ((bi_concat "0") s) else s)))

let v_Vuna_dCompiler_dCodegen_dDecl_docamlEscapeChar = (fun c -> (if ((bi_eq_int c) 34) then (C_Base_dList_dList_Cons (92, (C_Base_dList_dList_Cons (34, C_Base_dList_dList_Nil)))) else (if ((bi_eq_int c) 92) then (C_Base_dList_dList_Cons (92, (C_Base_dList_dList_Cons (92, C_Base_dList_dList_Nil)))) else (if ((bi_eq_int c) 10) then (C_Base_dList_dList_Cons (92, (C_Base_dList_dList_Cons (110, C_Base_dList_dList_Nil)))) else (if ((bi_eq_int c) 9) then (C_Base_dList_dList_Cons (92, (C_Base_dList_dList_Cons (116, C_Base_dList_dList_Nil)))) else (if ((bi_eq_int c) 13) then (C_Base_dList_dList_Cons (92, (C_Base_dList_dList_Cons (114, C_Base_dList_dList_Nil)))) else (if (if ((bi_ge_int c) 32) then ((bi_le_int c) 126) else false) then (C_Base_dList_dList_Cons (c, C_Base_dList_dList_Nil)) else (dtp_unpack ((bi_concat "\\") (v_Vuna_dCompiler_dCodegen_dDecl_docamlPad3 (bi_strFromInt c)))))))))))

let v_Vuna_dCompiler_dCodegen_dDecl_docamlString = (fun s -> ((bi_concat "\"") ((bi_concat (dtp_pack ((v_Base_dList_dconcatMap v_Vuna_dCompiler_dCodegen_dDecl_docamlEscapeChar) (dtp_unpack s)))) "\"")))

let v_Vuna_dCompiler_dCodegen_dDecl_dvalueName = (fun name -> ((bi_concat "v_") (v_Vuna_dCompiler_dCodegen_dDecl_dsanitizeName name)))

let v_Vuna_dCompiler_dCodegen_dDecl_dboolText = (fun b -> (if b then "true" else "false"))

let v_Vuna_dCompiler_dCodegen_dDecl_dtypeName = (fun name -> ((bi_concat "t_") (v_Vuna_dCompiler_dCodegen_dDecl_dsanitizeName name)))

let v_Vuna_dCompiler_dCodegen_dDecl_dctorOcamlName = (fun family -> (fun ctor -> ((bi_concat "C_") ((bi_concat (v_Vuna_dCompiler_dCodegen_dDecl_dsanitizeName family)) ((bi_concat "_") (v_Vuna_dCompiler_dCodegen_dDecl_dsanitizeName ctor))))))

let v_Vuna_dCompiler_dCodegen_dDecl_docamlReservedWords = fun () -> (C_Base_dList_dList_Cons ("and", (C_Base_dList_dList_Cons ("as", (C_Base_dList_dList_Cons ("assert", (C_Base_dList_dList_Cons ("asr", (C_Base_dList_dList_Cons ("begin", (C_Base_dList_dList_Cons ("class", (C_Base_dList_dList_Cons ("constraint", (C_Base_dList_dList_Cons ("do", (C_Base_dList_dList_Cons ("done", (C_Base_dList_dList_Cons ("downto", (C_Base_dList_dList_Cons ("else", (C_Base_dList_dList_Cons ("end", (C_Base_dList_dList_Cons ("exception", (C_Base_dList_dList_Cons ("external", (C_Base_dList_dList_Cons ("false", (C_Base_dList_dList_Cons ("for", (C_Base_dList_dList_Cons ("fun", (C_Base_dList_dList_Cons ("function", (C_Base_dList_dList_Cons ("functor", (C_Base_dList_dList_Cons ("if", (C_Base_dList_dList_Cons ("in", (C_Base_dList_dList_Cons ("include", (C_Base_dList_dList_Cons ("inherit", (C_Base_dList_dList_Cons ("initializer", (C_Base_dList_dList_Cons ("land", (C_Base_dList_dList_Cons ("lazy", (C_Base_dList_dList_Cons ("let", (C_Base_dList_dList_Cons ("lor", (C_Base_dList_dList_Cons ("lsl", (C_Base_dList_dList_Cons ("lsr", (C_Base_dList_dList_Cons ("lxor", (C_Base_dList_dList_Cons ("match", (C_Base_dList_dList_Cons ("method", (C_Base_dList_dList_Cons ("mod", (C_Base_dList_dList_Cons ("module", (C_Base_dList_dList_Cons ("mutable", (C_Base_dList_dList_Cons ("new", (C_Base_dList_dList_Cons ("nonrec", (C_Base_dList_dList_Cons ("object", (C_Base_dList_dList_Cons ("of", (C_Base_dList_dList_Cons ("open", (C_Base_dList_dList_Cons ("or", (C_Base_dList_dList_Cons ("private", (C_Base_dList_dList_Cons ("rec", (C_Base_dList_dList_Cons ("sig", (C_Base_dList_dList_Cons ("struct", (C_Base_dList_dList_Cons ("then", (C_Base_dList_dList_Cons ("to", (C_Base_dList_dList_Cons ("true", (C_Base_dList_dList_Cons ("try", (C_Base_dList_dList_Cons ("type", (C_Base_dList_dList_Cons ("val", (C_Base_dList_dList_Cons ("virtual", (C_Base_dList_dList_Cons ("when", (C_Base_dList_dList_Cons ("while", (C_Base_dList_dList_Cons ("with", C_Base_dList_dList_Nil))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))

let v_Vuna_dCompiler_dCodegen_dDecl_docamlBinderName = (fun name -> ((fun oc -> (if ((v_Base_dList_dmemName oc) (v_Vuna_dCompiler_dCodegen_dDecl_docamlReservedWords ())) then ((bi_concat oc) "_") else oc)) (v_Vuna_dCompiler_dCodegen_dDecl_dsanitizeName name)))

let rec v_Vuna_dCompiler_dCodegen_dDecl_dinterpose = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Base_dList_dList_Cons (dtb__0, dtb__1) -> (match dtb__1 with
  | C_Base_dList_dList_Nil -> (C_Base_dList_dList_Cons (dtb__0, C_Base_dList_dList_Nil))
  | _ -> (C_Base_dList_dList_Cons (dtb__0, (C_Base_dList_dList_Cons (mc0, ((v_Vuna_dCompiler_dCodegen_dDecl_dinterpose mc0) dtb__1)))))
)
  | C_Base_dList_dList_Nil -> C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dCodegen_dDecl_djoinWith = (fun sep -> (fun xs -> (dtp_concatMany ((v_Vuna_dCompiler_dCodegen_dDecl_dinterpose sep) xs))))

let v_Vuna_dCompiler_dCodegen_dDecl_dlastName = (fun name -> (match (v_Vuna_dCompiler_dCommon_dsplitLastDot (v_Vuna_dCompiler_dCommon_dsplitOnDot name)) with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__2, dtb__3) -> dtb__3
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCodegen_dDecl_dtypeParamName = (fun i -> ((bi_concat "'a") (bi_strFromInt i)))

let v_Vuna_dCompiler_dCodegen_dDecl_dtypeParamNames = (fun n -> ((v_Base_dList_dmap v_Vuna_dCompiler_dCodegen_dDecl_dtypeParamName) ((v_Base_dList_drange 0) n)))

let v_Vuna_dCompiler_dCodegen_dDecl_dtypeParamDecl = (fun mc0 -> (if ((bi_eq_int mc0) 0) then "" else ((fun nd_uscrut -> (match nd_uscrut with
  | C_Base_dList_dList_Cons (dtb__4, dtb__5) -> (match dtb__5 with
  | C_Base_dList_dList_Nil -> ((bi_concat dtb__4) " ")
  | _ -> ((bi_concat "(") ((bi_concat ((v_Vuna_dCompiler_dCodegen_dDecl_djoinWith ", ") nd_uscrut)) ") "))
)
  | _ -> ((bi_concat "(") ((bi_concat ((v_Vuna_dCompiler_dCodegen_dDecl_djoinWith ", ") nd_uscrut)) ") "))
)) (v_Vuna_dCompiler_dCodegen_dDecl_dtypeParamNames mc0))))

let rec v_Vuna_dCompiler_dCodegen_dDecl_dtypeParamLevelsGo = (fun mc0 -> (fun mc1 -> (match mc0 with
  | C_Base_dList_dList_Cons (dtb__6, dtb__7) -> (if (v_Vuna_dCompiler_dCore_dTerm_drigIsErased (v_Base_dPair_dsecondOf dtb__6)) then (C_Base_dList_dList_Cons (mc1, ((v_Vuna_dCompiler_dCodegen_dDecl_dtypeParamLevelsGo dtb__7) ((bi_add mc1) 1)))) else ((v_Vuna_dCompiler_dCodegen_dDecl_dtypeParamLevelsGo dtb__7) ((bi_add mc1) 1)))
  | C_Base_dList_dList_Nil -> C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dCodegen_dDecl_dtypeParamLevels = (fun d -> ((v_Vuna_dCompiler_dCodegen_dDecl_dtypeParamLevelsGo (v_Vuna_dCompiler_dElab_dTypes_ddtDataParams d)) 0))

let rec v_Vuna_dCompiler_dCodegen_dDecl_dfindDtData = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Base_dList_dList_Cons (dtb__8, dtb__9) -> (if ((bi_eq_str (v_Vuna_dCompiler_dElab_dTypes_ddtDataName dtb__8)) mc0) then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__8)) else ((v_Vuna_dCompiler_dCodegen_dDecl_dfindDtData mc0) dtb__9))
  | C_Base_dList_dList_Nil -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dCodegen_dDecl_dmemInt = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Base_dList_dList_Cons (dtb__10, dtb__11) -> (if ((bi_eq_int dtb__10) mc0) then true else ((v_Vuna_dCompiler_dCodegen_dDecl_dmemInt mc0) dtb__11))
  | C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dCodegen_dDecl_dlevelSlotGo = (fun mc0 -> (fun mc1 -> (fun mc2 -> (match mc0 with
  | C_Base_dList_dList_Cons (dtb__12, dtb__13) -> (if ((bi_eq_int dtb__12) mc1) then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (mc2)) else (((v_Vuna_dCompiler_dCodegen_dDecl_dlevelSlotGo dtb__13) mc1) ((bi_add mc2) 1)))
  | C_Base_dList_dList_Nil -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
))))

let v_Vuna_dCompiler_dCodegen_dDecl_dlevelSlot = (fun levels -> (fun lvl -> (((v_Vuna_dCompiler_dCodegen_dDecl_dlevelSlotGo levels) lvl) 0)))

let rec v_Vuna_dCompiler_dCodegen_dDecl_dnthValue = (fun mc0 -> (fun mc1 -> (match mc0 with
  | C_Base_dList_dList_Cons (dtb__14, dtb__15) -> (if ((bi_le_int mc1) 0) then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__14)) else ((v_Vuna_dCompiler_dCodegen_dDecl_dnthValue dtb__15) ((bi_sub mc1) 1)))
  | C_Base_dList_dList_Nil -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dCodegen_dDecl_dlookupUsed = (fun mc0 -> (fun mc1 -> (match mc0 with
  | C_Base_dList_dList_Cons (dtb__16, dtb__17) -> (if ((bi_eq_str (v_Base_dPair_dfirstOf dtb__16)) mc1) then (v_Base_dPair_dsecondOf dtb__16) else ((v_Vuna_dCompiler_dCodegen_dDecl_dlookupUsed dtb__17) mc1))
  | C_Base_dList_dList_Nil -> C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dCodegen_dDecl_dcollectUsedLevelsFuel = (fun fuel -> (fun tps -> (fun table -> (fun datas -> (fun lvl -> (fun v -> (if ((bi_le_int fuel) 0) then C_Base_dList_dList_Nil else (match v with
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVPi (dtb__18, dtb__19, dtb__20, dtb__21, dtb__22) -> (if dtb__19 then ((((((v_Vuna_dCompiler_dCodegen_dDecl_dcollectUsedLevelsFuel ((bi_sub fuel) 1)) tps) table) datas) ((bi_add lvl) 1)) ((v_Vuna_dCompiler_dCore_dEval_dapplyClosure dtb__22) (C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral ((C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNVar (dtb__18, lvl, C_Base_dList_dList_Nil)))))) else ((v_Base_dList_dappend ((((((v_Vuna_dCompiler_dCodegen_dDecl_dcollectUsedLevelsFuel ((bi_sub fuel) 1)) tps) table) datas) lvl) dtb__21)) ((((((v_Vuna_dCompiler_dCodegen_dDecl_dcollectUsedLevelsFuel ((bi_sub fuel) 1)) tps) table) datas) ((bi_add lvl) 1)) ((v_Vuna_dCompiler_dCore_dEval_dapplyClosure dtb__22) (C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral ((C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNVar (dtb__18, lvl, C_Base_dList_dList_Nil))))))))
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral (dtb__23) -> (match dtb__23 with
  | C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNVar (dtb__24, dtb__25, dtb__26) -> ((v_Base_dList_dappend (if ((v_Vuna_dCompiler_dCodegen_dDecl_dmemInt dtb__25) tps) then (C_Base_dList_dList_Cons (dtb__25, C_Base_dList_dList_Nil)) else C_Base_dList_dList_Nil)) ((((((v_Vuna_dCompiler_dCodegen_dDecl_dcollectUsedSpineFuel ((bi_sub fuel) 1)) tps) table) datas) lvl) dtb__26))
  | C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNGlobal (dtb__27, dtb__28) -> (match ((v_Vuna_dCompiler_dCodegen_dDecl_dfindDtData dtb__27) datas) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__29) -> (((((((v_Vuna_dCompiler_dCodegen_dDecl_dcollectFamilyArgsFuel ((bi_sub fuel) 1)) tps) table) datas) lvl) ((v_Vuna_dCompiler_dCodegen_dDecl_dlookupUsed table) dtb__27)) dtb__28)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((((((v_Vuna_dCompiler_dCodegen_dDecl_dcollectUsedSpineFuel ((bi_sub fuel) 1)) tps) table) datas) lvl) dtb__28)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> C_Base_dList_dList_Nil
))))))))
and v_Vuna_dCompiler_dCodegen_dDecl_dcollectUsedSpineFuel = (fun mc0 -> (fun mc1 -> (fun mc2 -> (fun mc3 -> (fun mc4 -> (fun mc5 -> (match mc5 with
  | C_Base_dList_dList_Cons (dtb__30, dtb__31) -> (if ((bi_le_int mc0) 0) then C_Base_dList_dList_Nil else ((v_Base_dList_dappend ((((((v_Vuna_dCompiler_dCodegen_dDecl_dcollectUsedLevelsFuel ((bi_sub mc0) 1)) mc1) mc2) mc3) mc4) dtb__30)) ((((((v_Vuna_dCompiler_dCodegen_dDecl_dcollectUsedSpineFuel ((bi_sub mc0) 1)) mc1) mc2) mc3) mc4) dtb__31)))
  | C_Base_dList_dList_Nil -> (if ((bi_le_int mc0) 0) then C_Base_dList_dList_Nil else C_Base_dList_dList_Nil)
  | _ -> failwith "DT: impossible branch"
)))))))
and v_Vuna_dCompiler_dCodegen_dDecl_dcollectFamilyArgsFuel = (fun fuel -> (fun tps -> (fun table -> (fun datas -> (fun lvl -> (fun usedPats -> (fun args -> (if ((bi_le_int fuel) 0) then C_Base_dList_dList_Nil else (match usedPats with
  | C_Base_dList_dList_Nil -> C_Base_dList_dList_Nil
  | C_Base_dList_dList_Cons (dtb__32, dtb__33) -> (match ((v_Vuna_dCompiler_dCodegen_dDecl_dnthValue args) dtb__32) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__34) -> ((v_Base_dList_dappend ((((((v_Vuna_dCompiler_dCodegen_dDecl_dcollectUsedLevelsFuel ((bi_sub fuel) 1)) tps) table) datas) lvl) dtb__34)) (((((((v_Vuna_dCompiler_dCodegen_dDecl_dcollectFamilyArgsFuel ((bi_sub fuel) 1)) tps) table) datas) lvl) dtb__33) args))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (((((((v_Vuna_dCompiler_dCodegen_dDecl_dcollectFamilyArgsFuel ((bi_sub fuel) 1)) tps) table) datas) lvl) dtb__33) args)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))))))))

let v_Vuna_dCompiler_dCodegen_dDecl_dcollectUsedLevels = (fun tps -> (fun table -> (fun datas -> (fun lvl -> (fun v -> ((((((v_Vuna_dCompiler_dCodegen_dDecl_dcollectUsedLevelsFuel 256) tps) table) datas) lvl) v))))))

let v_Vuna_dCompiler_dCodegen_dDecl_dcollectFamilyArgs = (fun tps -> (fun table -> (fun datas -> (fun lvl -> (fun usedPats -> (fun args -> (((((((v_Vuna_dCompiler_dCodegen_dDecl_dcollectFamilyArgsFuel 256) tps) table) datas) lvl) usedPats) args)))))))

let rec v_Vuna_dCompiler_dCodegen_dDecl_dctorUsedLevels = (fun mc0 -> (fun mc1 -> (fun mc2 -> (fun mc3 -> (fun mc4 -> (fun mc5 -> (match mc3 with
  | C_Base_dList_dList_Cons (dtb__35, dtb__36) -> (match dtb__35 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__37, dtb__38) -> (match mc5 with
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVPi (dtb__39, dtb__40, dtb__41, dtb__42, dtb__43) -> ((fun next -> (if (v_Vuna_dCompiler_dCore_dTerm_drigIsErased dtb__38) then ((((((v_Vuna_dCompiler_dCodegen_dDecl_dctorUsedLevels mc0) mc1) mc2) dtb__36) ((bi_add mc4) 1)) next) else ((v_Base_dList_dappend (((((v_Vuna_dCompiler_dCodegen_dDecl_dcollectUsedLevels mc0) mc1) mc2) mc4) dtb__42)) ((((((v_Vuna_dCompiler_dCodegen_dDecl_dctorUsedLevels mc0) mc1) mc2) dtb__36) ((bi_add mc4) 1)) next)))) ((v_Vuna_dCompiler_dCore_dEval_dapplyClosure dtb__43) (C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral ((C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNVar (dtb__39, mc4, C_Base_dList_dList_Nil))))))
  | _ -> C_Base_dList_dList_Nil
)
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Nil -> C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
)))))))

let v_Vuna_dCompiler_dCodegen_dDecl_ddataUsedLevels = (fun d -> (fun table -> (fun datas -> ((fun raw -> ((v_Base_dList_dfilter (fun l -> ((v_Vuna_dCompiler_dCodegen_dDecl_dmemInt l) raw))) (v_Vuna_dCompiler_dCodegen_dDecl_dtypeParamLevels d))) ((v_Base_dList_dconcatMap (fun c -> ((((((v_Vuna_dCompiler_dCodegen_dDecl_dctorUsedLevels (v_Vuna_dCompiler_dCodegen_dDecl_dtypeParamLevels d)) table) datas) (v_Vuna_dCompiler_dElab_dTypes_ddtCtorTelescope c)) 0) ((v_Vuna_dCompiler_dCore_dEval_deval C_Base_dList_dList_Nil) (v_Vuna_dCompiler_dElab_dTypes_ddtCtorType c))))) (v_Vuna_dCompiler_dElab_dTypes_ddtDataCtors d))))))

let rec v_Vuna_dCompiler_dCodegen_dDecl_dsameLevelTable = (fun mc0 -> (fun mc1 -> (match mc0 with
  | C_Base_dList_dList_Cons (dtb__44, dtb__45) -> (match mc1 with
  | C_Base_dList_dList_Cons (dtb__46, dtb__47) -> (if (if ((bi_eq_str (v_Base_dPair_dfirstOf dtb__44)) (v_Base_dPair_dfirstOf dtb__46)) then ((bi_eq_generic (v_Base_dPair_dsecondOf dtb__44)) (v_Base_dPair_dsecondOf dtb__46)) else false) then ((v_Vuna_dCompiler_dCodegen_dDecl_dsameLevelTable dtb__45) dtb__47) else false)
  | _ -> false
)
  | C_Base_dList_dList_Nil -> (match mc1 with
  | C_Base_dList_dList_Nil -> true
  | _ -> false
)
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dCodegen_dDecl_dusedTableFixFuel = (fun fuel -> (fun datas -> (fun table -> (if ((bi_le_int fuel) 0) then table else ((fun next -> (if ((v_Vuna_dCompiler_dCodegen_dDecl_dsameLevelTable next) table) then next else (((v_Vuna_dCompiler_dCodegen_dDecl_dusedTableFixFuel ((bi_sub fuel) 1)) datas) next))) ((v_Base_dList_dmap (fun d -> (C_Base_dPair_dPair_Base_dPair_dPair ((v_Vuna_dCompiler_dElab_dTypes_ddtDataName d), (((v_Vuna_dCompiler_dCodegen_dDecl_ddataUsedLevels d) table) datas))))) datas))))))

let v_Vuna_dCompiler_dCodegen_dDecl_dusedTableFix = (fun datas -> (fun table -> (((v_Vuna_dCompiler_dCodegen_dDecl_dusedTableFixFuel 64) datas) table)))

let v_Vuna_dCompiler_dCodegen_dDecl_dfamilyTyText = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Base_dList_dList_Cons (dtb__48, dtb__49) -> (match dtb__49 with
  | C_Base_dList_dList_Nil -> ((bi_concat dtb__48) ((bi_concat " ") (v_Vuna_dCompiler_dCodegen_dDecl_dtypeName mc0)))
  | _ -> ((bi_concat "(") ((bi_concat ((v_Vuna_dCompiler_dCodegen_dDecl_djoinWith ", ") mc1)) ((bi_concat ") ") (v_Vuna_dCompiler_dCodegen_dDecl_dtypeName mc0))))
)
  | C_Base_dList_dList_Nil -> (v_Vuna_dCompiler_dCodegen_dDecl_dtypeName mc0)
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dCodegen_dDecl_drenderFamilyArgsFuel = (fun fuel -> (fun levels -> (fun table -> (fun datas -> (fun usedPats -> (fun args -> (if ((bi_le_int fuel) 0) then C_Base_dList_dList_Nil else (match usedPats with
  | C_Base_dList_dList_Nil -> C_Base_dList_dList_Nil
  | C_Base_dList_dList_Cons (dtb__50, dtb__51) -> (match ((v_Vuna_dCompiler_dCodegen_dDecl_dnthValue args) dtb__50) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__52) -> (C_Base_dList_dList_Cons ((((((v_Vuna_dCompiler_dCodegen_dDecl_drenderTypeArgFuel ((bi_sub fuel) 1)) levels) table) datas) dtb__52), ((((((v_Vuna_dCompiler_dCodegen_dDecl_drenderFamilyArgsFuel ((bi_sub fuel) 1)) levels) table) datas) dtb__51) args)))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((((((v_Vuna_dCompiler_dCodegen_dDecl_drenderFamilyArgsFuel ((bi_sub fuel) 1)) levels) table) datas) dtb__51) args)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))))))
and v_Vuna_dCompiler_dCodegen_dDecl_drenderTypeArgFuel = (fun fuel -> (fun levels -> (fun table -> (fun datas -> (fun v -> (if ((bi_le_int fuel) 0) then "unit" else (match v with
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral (dtb__53) -> (match dtb__53 with
  | C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNVar (dtb__54, dtb__55, dtb__56) -> (match ((v_Vuna_dCompiler_dCodegen_dDecl_dlevelSlot levels) dtb__55) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__57) -> (v_Vuna_dCompiler_dCodegen_dDecl_dtypeParamName dtb__57)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> "unit"
  | _ -> failwith "DT: impossible branch"
)
  | C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNGlobal (dtb__58, dtb__59) -> (if ((bi_eq_str dtb__58) "Int") then "int" else (if ((bi_eq_str dtb__58) "String") then "string" else (if ((bi_eq_str dtb__58) "Bool") then "bool" else (if ((bi_eq_str (v_Vuna_dCompiler_dCodegen_dDecl_dlastName dtb__58)) "Bool") then "bool" else (match ((v_Vuna_dCompiler_dCodegen_dDecl_dfindDtData dtb__58) datas) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__60) -> ((v_Vuna_dCompiler_dCodegen_dDecl_dfamilyTyText dtb__58) ((((((v_Vuna_dCompiler_dCodegen_dDecl_drenderFamilyArgsFuel ((bi_sub fuel) 1)) levels) table) datas) ((v_Vuna_dCompiler_dCodegen_dDecl_dlookupUsed table) dtb__58)) dtb__59))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> "unit"
  | _ -> failwith "DT: impossible branch"
)))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> "unit"
)))))))

let v_Vuna_dCompiler_dCodegen_dDecl_drenderFamilyArgs = (fun levels -> (fun table -> (fun datas -> (fun usedPats -> (fun args -> ((((((v_Vuna_dCompiler_dCodegen_dDecl_drenderFamilyArgsFuel 256) levels) table) datas) usedPats) args))))))

let v_Vuna_dCompiler_dCodegen_dDecl_drenderTypeArg = (fun levels -> (fun table -> (fun datas -> (fun v -> (((((v_Vuna_dCompiler_dCodegen_dDecl_drenderTypeArgFuel 256) levels) table) datas) v)))))

let rec v_Vuna_dCompiler_dCodegen_dDecl_drenderPiTyFuel = (fun fuel -> (fun levels -> (fun table -> (fun datas -> (fun lvl -> (fun v -> (if ((bi_le_int fuel) 0) then ((((v_Vuna_dCompiler_dCodegen_dDecl_drenderTypeArg levels) table) datas) v) else (match v with
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVPi (dtb__61, dtb__62, dtb__63, dtb__64, dtb__65) -> ((fun next -> (if (v_Vuna_dCompiler_dCore_dTerm_drigIsErased dtb__63) then ((((((v_Vuna_dCompiler_dCodegen_dDecl_drenderPiTyFuel ((bi_sub fuel) 1)) levels) table) datas) ((bi_add lvl) 1)) next) else ((bi_concat "(") ((bi_concat ((((((v_Vuna_dCompiler_dCodegen_dDecl_drenderPiTyFuel ((bi_sub fuel) 1)) levels) table) datas) lvl) dtb__64)) ((bi_concat ") -> ") ((((((v_Vuna_dCompiler_dCodegen_dDecl_drenderPiTyFuel ((bi_sub fuel) 1)) levels) table) datas) ((bi_add lvl) 1)) next)))))) ((v_Vuna_dCompiler_dCore_dEval_dapplyClosure dtb__65) (C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral ((C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNVar (dtb__61, lvl, C_Base_dList_dList_Nil))))))
  | _ -> ((((v_Vuna_dCompiler_dCodegen_dDecl_drenderTypeArg levels) table) datas) v)
))))))))

let v_Vuna_dCompiler_dCodegen_dDecl_drenderPiTy = (fun levels -> (fun table -> (fun datas -> (fun lvl -> (fun v -> ((((((v_Vuna_dCompiler_dCodegen_dDecl_drenderPiTyFuel 256) levels) table) datas) lvl) v))))))

let v_Vuna_dCompiler_dCodegen_dDecl_drenderFieldTy = (fun levels -> (fun table -> (fun datas -> (fun lvl -> (fun dom -> (fun slot -> (match dom with
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVPi (dtb__66, dtb__67, dtb__68, dtb__69, dtb__70) -> (if dtb__67 then (C_Base_dPair_dPair_Base_dPair_dPair ((v_Vuna_dCompiler_dCodegen_dDecl_dtypeParamName slot), ((bi_add slot) 1))) else (C_Base_dPair_dPair_Base_dPair_dPair ((((((v_Vuna_dCompiler_dCodegen_dDecl_drenderPiTy levels) table) datas) lvl) dom), slot)))
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral (dtb__71) -> (match dtb__71 with
  | C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNVar (dtb__72, dtb__73, dtb__74) -> (match ((v_Vuna_dCompiler_dCodegen_dDecl_dlevelSlot levels) dtb__73) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__75) -> (C_Base_dPair_dPair_Base_dPair_dPair ((v_Vuna_dCompiler_dCodegen_dDecl_dtypeParamName dtb__75), slot))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (C_Base_dPair_dPair_Base_dPair_dPair ((v_Vuna_dCompiler_dCodegen_dDecl_dtypeParamName slot), ((bi_add slot) 1)))
  | _ -> failwith "DT: impossible branch"
)
  | C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNGlobal (dtb__76, dtb__77) -> (if ((bi_eq_str dtb__76) "Int") then (C_Base_dPair_dPair_Base_dPair_dPair ("int", slot)) else (if ((bi_eq_str dtb__76) "String") then (C_Base_dPair_dPair_Base_dPair_dPair ("string", slot)) else (if ((bi_eq_str dtb__76) "Bool") then (C_Base_dPair_dPair_Base_dPair_dPair ("bool", slot)) else (match ((v_Vuna_dCompiler_dCodegen_dDecl_dfindDtData dtb__76) datas) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__78) -> (C_Base_dPair_dPair_Base_dPair_dPair (((v_Vuna_dCompiler_dCodegen_dDecl_dfamilyTyText dtb__76) (((((v_Vuna_dCompiler_dCodegen_dDecl_drenderFamilyArgs levels) table) datas) ((v_Vuna_dCompiler_dCodegen_dDecl_dlookupUsed table) dtb__76)) dtb__77)), slot))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (C_Base_dPair_dPair_Base_dPair_dPair ((v_Vuna_dCompiler_dCodegen_dDecl_dtypeParamName slot), ((bi_add slot) 1)))
  | _ -> failwith "DT: impossible branch"
))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> (C_Base_dPair_dPair_Base_dPair_dPair ((v_Vuna_dCompiler_dCodegen_dDecl_dtypeParamName slot), ((bi_add slot) 1)))
)))))))

let v_Vuna_dCompiler_dCodegen_dDecl_dctorKeepFlags = (fun c -> ((v_Base_dList_dmap (fun b -> (v_Base_dBool_dnot (v_Vuna_dCompiler_dCore_dTerm_drigIsErased (v_Base_dPair_dsecondOf b))))) (v_Vuna_dCompiler_dElab_dTypes_ddtCtorTelescope c)))

let v_Vuna_dCompiler_dCodegen_dDecl_dflagMatchesRig = (fun keep -> (fun rig -> (if keep then (v_Base_dBool_dnot (v_Vuna_dCompiler_dCore_dTerm_drigIsErased rig)) else (v_Vuna_dCompiler_dCore_dTerm_drigIsErased rig))))

let rec v_Vuna_dCompiler_dCodegen_dDecl_dctorShapeOf = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Cons (dtb__79, dtb__80) -> ((v_Base_dList_dappend ((v_Base_dList_dmap (fun c -> (C_Base_dPair_dPair_Base_dPair_dPair ((v_Vuna_dCompiler_dElab_dTypes_ddtCtorName c), (v_Vuna_dCompiler_dCodegen_dDecl_dctorKeepFlags c))))) (v_Vuna_dCompiler_dElab_dTypes_ddtDataCtors dtb__79))) (v_Vuna_dCompiler_dCodegen_dDecl_dctorShapeOf dtb__80))
  | C_Base_dList_dList_Nil -> C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dCodegen_dDecl_dctorFieldTexts = (fun mc0 -> (fun mc1 -> (fun mc2 -> (fun mc3 -> (fun mc4 -> (fun mc5 -> (fun mc6 -> (fun mc7 -> (match mc3 with
  | C_Base_dList_dList_Cons (dtb__81, dtb__82) -> (match mc4 with
  | C_Base_dList_dList_Cons (dtb__83, dtb__84) -> (match dtb__83 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__85, dtb__86) -> (if ((v_Vuna_dCompiler_dCodegen_dDecl_dflagMatchesRig dtb__81) dtb__86) then (match mc6 with
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVPi (dtb__87, dtb__88, dtb__89, dtb__90, dtb__91) -> ((fun next -> (if dtb__81 then (match ((((((v_Vuna_dCompiler_dCodegen_dDecl_drenderFieldTy mc0) mc1) mc2) mc5) dtb__90) mc7) with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__92, dtb__93) -> ((v_Base_dResult_dandThen ((((((((v_Vuna_dCompiler_dCodegen_dDecl_dctorFieldTexts mc0) mc1) mc2) dtb__82) dtb__84) ((bi_add mc5) 1)) next) dtb__93)) (fun p -> (match p with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__94, dtb__95) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Base_dList_dList_Cons (dtb__92, dtb__94)), dtb__95))))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
) else ((((((((v_Vuna_dCompiler_dCodegen_dDecl_dctorFieldTexts mc0) mc1) mc2) dtb__82) dtb__84) ((bi_add mc5) 1)) next) mc7))) ((v_Vuna_dCompiler_dCore_dEval_dapplyClosure dtb__91) (C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral ((C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNVar (dtb__87, mc5, C_Base_dList_dList_Nil))))))
  | _ -> (C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: constructor telescope does not match its type"))
) else (C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: constructor keep flag disagrees with telescope rig")))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Nil -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (C_Base_dList_dList_Nil, mc7))))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Nil -> (match mc4 with
  | C_Base_dList_dList_Cons (dtb__96, dtb__97) -> (C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: constructor shape has more binders than its telescope"))
  | C_Base_dList_dList_Nil -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (C_Base_dList_dList_Nil, mc7))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))))))))

let v_Vuna_dCompiler_dCodegen_dDecl_dctorArityNeed = (fun levels -> (fun table -> (fun datas -> (fun c -> ((v_Base_dResult_dandThen ((((((((v_Vuna_dCompiler_dCodegen_dDecl_dctorFieldTexts levels) table) datas) (v_Vuna_dCompiler_dCodegen_dDecl_dctorKeepFlags c)) (v_Vuna_dCompiler_dElab_dTypes_ddtCtorTelescope c)) 0) ((v_Vuna_dCompiler_dCore_dEval_deval C_Base_dList_dList_Nil) (v_Vuna_dCompiler_dElab_dTypes_ddtCtorType c))) (v_Base_dList_dlength levels))) (fun p -> (C_Base_dResult_dResult_Base_dResult_dOk (((bi_sub (v_Base_dPair_dsecondOf p)) (v_Base_dList_dlength levels))))))))))

let rec v_Vuna_dCompiler_dCodegen_dDecl_dmaxIntList = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Cons (dtb__98, dtb__99) -> (if ((bi_ge_int dtb__98) (v_Vuna_dCompiler_dCodegen_dDecl_dmaxIntList dtb__99)) then dtb__98 else (v_Vuna_dCompiler_dCodegen_dDecl_dmaxIntList dtb__99))
  | C_Base_dList_dList_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCodegen_dDecl_ddataArityNeed = (fun levels -> (fun table -> (fun datas -> (fun ctors -> ((v_Base_dResult_dandThen ((v_Base_dResult_dtraverse (((v_Vuna_dCompiler_dCodegen_dDecl_dctorArityNeed levels) table) datas)) ctors)) (fun ns -> (C_Base_dResult_dResult_Base_dResult_dOk (((bi_add (v_Base_dList_dlength levels)) (v_Vuna_dCompiler_dCodegen_dDecl_dmaxIntList ns))))))))))

let v_Vuna_dCompiler_dCodegen_dDecl_dparenOne = (fun t -> ((bi_concat "(") ((bi_concat t) ")")))

let rec v_Vuna_dCompiler_dCodegen_dDecl_dparenList = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Cons (dtb__100, dtb__101) -> ((v_Base_dList_dappend (C_Base_dList_dList_Cons ((v_Vuna_dCompiler_dCodegen_dDecl_dparenOne dtb__100), C_Base_dList_dList_Nil))) (v_Vuna_dCompiler_dCodegen_dDecl_dparenList dtb__101))
  | C_Base_dList_dList_Nil -> C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCodegen_dDecl_dctorDeclText = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Base_dList_dList_Cons (dtb__102, dtb__103) -> (match dtb__103 with
  | C_Base_dList_dList_Nil -> ((bi_concat mc0) ((bi_concat " of ") (v_Vuna_dCompiler_dCodegen_dDecl_dparenOne dtb__102)))
  | _ -> ((bi_concat mc0) ((bi_concat " of ") ((v_Vuna_dCompiler_dCodegen_dDecl_djoinWith " * ") (v_Vuna_dCompiler_dCodegen_dDecl_dparenList mc1))))
)
  | C_Base_dList_dList_Nil -> mc0
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dCodegen_dDecl_dgenCtorDecl = (fun levels -> (fun table -> (fun datas -> (fun c -> ((v_Base_dResult_dandThen ((((((((v_Vuna_dCompiler_dCodegen_dDecl_dctorFieldTexts levels) table) datas) (v_Vuna_dCompiler_dCodegen_dDecl_dctorKeepFlags c)) (v_Vuna_dCompiler_dElab_dTypes_ddtCtorTelescope c)) 0) ((v_Vuna_dCompiler_dCore_dEval_deval C_Base_dList_dList_Nil) (v_Vuna_dCompiler_dElab_dTypes_ddtCtorType c))) (v_Base_dList_dlength levels))) (fun p -> (C_Base_dResult_dResult_Base_dResult_dOk (((v_Vuna_dCompiler_dCodegen_dDecl_dctorDeclText ((v_Vuna_dCompiler_dCodegen_dDecl_dctorOcamlName (v_Vuna_dCompiler_dElab_dTypes_ddtCtorFamily c)) (v_Vuna_dCompiler_dElab_dTypes_ddtCtorName c))) (v_Base_dPair_dfirstOf p))))))))))

let v_Vuna_dCompiler_dCodegen_dDecl_dctorBodyText = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Nil -> "|"
  | _ -> ((v_Vuna_dCompiler_dCodegen_dDecl_djoinWith " | ") mc0)
))

let v_Vuna_dCompiler_dCodegen_dDecl_dgenDataDecl = (fun table -> (fun datas -> (fun d -> ((fun levels -> ((v_Base_dResult_dandThen ((((v_Vuna_dCompiler_dCodegen_dDecl_ddataArityNeed levels) table) datas) (v_Vuna_dCompiler_dElab_dTypes_ddtDataCtors d))) (fun arity -> ((v_Base_dResult_dandThen ((v_Base_dResult_dtraverse (((v_Vuna_dCompiler_dCodegen_dDecl_dgenCtorDecl levels) table) datas)) (v_Vuna_dCompiler_dElab_dTypes_ddtDataCtors d))) (fun cs -> (C_Base_dResult_dResult_Base_dResult_dOk (((bi_concat (v_Vuna_dCompiler_dCodegen_dDecl_dtypeParamDecl arity)) ((bi_concat (v_Vuna_dCompiler_dCodegen_dDecl_dtypeName (v_Vuna_dCompiler_dElab_dTypes_ddtDataName d))) ((bi_concat " = ") (v_Vuna_dCompiler_dCodegen_dDecl_dctorBodyText cs))))))))))) ((v_Vuna_dCompiler_dCodegen_dDecl_dlookupUsed table) (v_Vuna_dCompiler_dElab_dTypes_ddtDataName d))))))

let v_Vuna_dCompiler_dCodegen_dDecl_dgenTypeDecls = (fun datas -> (match datas with
  | C_Base_dList_dList_Nil -> (C_Base_dResult_dResult_Base_dResult_dOk (""))
  | _ -> ((fun table -> ((v_Base_dResult_dandThen ((v_Base_dResult_dtraverse ((v_Vuna_dCompiler_dCodegen_dDecl_dgenDataDecl table) datas)) datas)) (fun parts -> (C_Base_dResult_dResult_Base_dResult_dOk (((bi_concat "type ") ((bi_concat ((v_Vuna_dCompiler_dCodegen_dDecl_djoinWith "\nand ") parts)) "\n\n"))))))) ((v_Vuna_dCompiler_dCodegen_dDecl_dusedTableFix datas) ((v_Base_dList_dmap (fun d -> (C_Base_dPair_dPair_Base_dPair_dPair ((v_Vuna_dCompiler_dElab_dTypes_ddtDataName d), C_Base_dList_dList_Nil)))) datas)))
))

let v_Vuna_dCompiler_dCodegen_dDecl_disBoolFamilyName = (fun name -> ((bi_eq_str (v_Vuna_dCompiler_dCodegen_dDecl_dlastName name)) "Bool"))

let v_Vuna_dCompiler_dCodegen_dDecl_druntimeDatas = (fun datas -> ((v_Base_dList_dfilter (fun d -> (if (v_Vuna_dCompiler_dCodegen_dDecl_disBoolFamilyName (v_Vuna_dCompiler_dElab_dTypes_ddtDataName d)) then false else true))) datas))

let v_Vuna_dCompiler_dCodegen_dDecl_dgenTypeDeclsOf = (fun allDatas -> (fun subset -> (match subset with
  | C_Base_dList_dList_Nil -> (C_Base_dResult_dResult_Base_dResult_dOk (""))
  | _ -> ((fun table -> ((v_Base_dResult_dandThen ((v_Base_dResult_dtraverse ((v_Vuna_dCompiler_dCodegen_dDecl_dgenDataDecl table) allDatas)) subset)) (fun parts -> (C_Base_dResult_dResult_Base_dResult_dOk (((bi_concat "type ") ((bi_concat ((v_Vuna_dCompiler_dCodegen_dDecl_djoinWith "\nand ") parts)) "\n\n"))))))) ((v_Vuna_dCompiler_dCodegen_dDecl_dusedTableFix allDatas) ((v_Base_dList_dmap (fun d -> (C_Base_dPair_dPair_Base_dPair_dPair ((v_Vuna_dCompiler_dElab_dTypes_ddtDataName d), C_Base_dList_dList_Nil)))) allDatas)))
)))

let v_Vuna_dCompiler_dCodegen_dDecl_dcollectUsedSpine = (fun a1 -> (fun a2 -> (fun a3 -> (fun a4 -> (fun a5 -> ((((((v_Vuna_dCompiler_dCodegen_dDecl_dcollectUsedSpineFuel 512) a1) a2) a3) a4) a5))))))
