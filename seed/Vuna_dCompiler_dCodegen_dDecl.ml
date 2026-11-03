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
open Vuna_dCompiler_dElab_dData
open Vuna_dCompiler_dElab_dTrait
open Vuna_dCompiler_dElab_dDerive
open Vuna_dCompiler_dElab_dRecords
open Vuna_dCompiler_dElab_dTermination_dMeasure
open Vuna_dCompiler_dElab_dTermination_dScc
open Vuna_dCompiler_dElab_dTermination
open Vuna_dCompiler_dElab_dDriver
open Vuna_dCompiler_dElab
let v_Vuna_dCompiler_dCodegen_dDecl_dsanitizeChar = (fun c -> (if ((bi_eq_int c) 46) then (C_Base_dList_dList_Base_dList_dCons (95, (C_Base_dList_dList_Base_dList_dCons (100, C_Base_dList_dList_Base_dList_dNil)))) else (if ((bi_eq_int c) 95) then (C_Base_dList_dList_Base_dList_dCons (95, (C_Base_dList_dList_Base_dList_dCons (117, C_Base_dList_dList_Base_dList_dNil)))) else (if ((bi_eq_int c) 39) then (C_Base_dList_dList_Base_dList_dCons (95, (C_Base_dList_dList_Base_dList_dCons (112, C_Base_dList_dList_Base_dList_dNil)))) else (if ((bi_eq_int c) 35) then (C_Base_dList_dList_Base_dList_dCons (95, (C_Base_dList_dList_Base_dList_dCons (104, C_Base_dList_dList_Base_dList_dNil)))) else (C_Base_dList_dList_Base_dList_dCons (c, C_Base_dList_dList_Base_dList_dNil)))))))

let v_Vuna_dCompiler_dCodegen_dDecl_dsanitizeName = (fun name -> (dtp_pack ((v_Base_dList_dconcatMap v_Vuna_dCompiler_dCodegen_dDecl_dsanitizeChar) (dtp_unpack name))))

let v_Vuna_dCompiler_dCodegen_dDecl_docamlPad3 = (fun s -> (if ((bi_eq_int (bi_strLength s)) 1) then ((bi_concat "00") s) else (if ((bi_eq_int (bi_strLength s)) 2) then ((bi_concat "0") s) else s)))

let v_Vuna_dCompiler_dCodegen_dDecl_docamlEscapeChar = (fun c -> (if ((bi_eq_int c) 34) then (C_Base_dList_dList_Base_dList_dCons (92, (C_Base_dList_dList_Base_dList_dCons (34, C_Base_dList_dList_Base_dList_dNil)))) else (if ((bi_eq_int c) 92) then (C_Base_dList_dList_Base_dList_dCons (92, (C_Base_dList_dList_Base_dList_dCons (92, C_Base_dList_dList_Base_dList_dNil)))) else (if ((bi_eq_int c) 10) then (C_Base_dList_dList_Base_dList_dCons (92, (C_Base_dList_dList_Base_dList_dCons (110, C_Base_dList_dList_Base_dList_dNil)))) else (if ((bi_eq_int c) 9) then (C_Base_dList_dList_Base_dList_dCons (92, (C_Base_dList_dList_Base_dList_dCons (116, C_Base_dList_dList_Base_dList_dNil)))) else (if ((bi_eq_int c) 13) then (C_Base_dList_dList_Base_dList_dCons (92, (C_Base_dList_dList_Base_dList_dCons (114, C_Base_dList_dList_Base_dList_dNil)))) else (if (if ((bi_ge_int c) 32) then ((bi_le_int c) 126) else false) then (C_Base_dList_dList_Base_dList_dCons (c, C_Base_dList_dList_Base_dList_dNil)) else (dtp_unpack ((bi_concat "\\") (v_Vuna_dCompiler_dCodegen_dDecl_docamlPad3 (bi_strFromInt c)))))))))))

let v_Vuna_dCompiler_dCodegen_dDecl_docamlString = (fun s -> ((bi_concat "\"") ((bi_concat (dtp_pack ((v_Base_dList_dconcatMap v_Vuna_dCompiler_dCodegen_dDecl_docamlEscapeChar) (dtp_unpack s)))) "\"")))

let v_Vuna_dCompiler_dCodegen_dDecl_dvalueName = (fun name -> ((bi_concat "v_") (v_Vuna_dCompiler_dCodegen_dDecl_dsanitizeName name)))

let v_Vuna_dCompiler_dCodegen_dDecl_dboolText = (fun b -> (if b then "true" else "false"))

let v_Vuna_dCompiler_dCodegen_dDecl_dtypeName = (fun name -> ((bi_concat "t_") (v_Vuna_dCompiler_dCodegen_dDecl_dsanitizeName name)))

let v_Vuna_dCompiler_dCodegen_dDecl_dctorOcamlName = (fun family -> (fun ctor -> ((bi_concat "C_") ((bi_concat (v_Vuna_dCompiler_dCodegen_dDecl_dsanitizeName family)) ((bi_concat "_") (v_Vuna_dCompiler_dCodegen_dDecl_dsanitizeName ctor))))))

let v_Vuna_dCompiler_dCodegen_dDecl_docamlReservedWords = (C_Base_dList_dList_Base_dList_dCons ("and", (C_Base_dList_dList_Base_dList_dCons ("as", (C_Base_dList_dList_Base_dList_dCons ("assert", (C_Base_dList_dList_Base_dList_dCons ("asr", (C_Base_dList_dList_Base_dList_dCons ("begin", (C_Base_dList_dList_Base_dList_dCons ("class", (C_Base_dList_dList_Base_dList_dCons ("constraint", (C_Base_dList_dList_Base_dList_dCons ("do", (C_Base_dList_dList_Base_dList_dCons ("done", (C_Base_dList_dList_Base_dList_dCons ("downto", (C_Base_dList_dList_Base_dList_dCons ("else", (C_Base_dList_dList_Base_dList_dCons ("end", (C_Base_dList_dList_Base_dList_dCons ("exception", (C_Base_dList_dList_Base_dList_dCons ("external", (C_Base_dList_dList_Base_dList_dCons ("false", (C_Base_dList_dList_Base_dList_dCons ("for", (C_Base_dList_dList_Base_dList_dCons ("fun", (C_Base_dList_dList_Base_dList_dCons ("function", (C_Base_dList_dList_Base_dList_dCons ("functor", (C_Base_dList_dList_Base_dList_dCons ("if", (C_Base_dList_dList_Base_dList_dCons ("in", (C_Base_dList_dList_Base_dList_dCons ("include", (C_Base_dList_dList_Base_dList_dCons ("inherit", (C_Base_dList_dList_Base_dList_dCons ("initializer", (C_Base_dList_dList_Base_dList_dCons ("land", (C_Base_dList_dList_Base_dList_dCons ("lazy", (C_Base_dList_dList_Base_dList_dCons ("let", (C_Base_dList_dList_Base_dList_dCons ("lor", (C_Base_dList_dList_Base_dList_dCons ("lsl", (C_Base_dList_dList_Base_dList_dCons ("lsr", (C_Base_dList_dList_Base_dList_dCons ("lxor", (C_Base_dList_dList_Base_dList_dCons ("match", (C_Base_dList_dList_Base_dList_dCons ("method", (C_Base_dList_dList_Base_dList_dCons ("mod", (C_Base_dList_dList_Base_dList_dCons ("module", (C_Base_dList_dList_Base_dList_dCons ("mutable", (C_Base_dList_dList_Base_dList_dCons ("new", (C_Base_dList_dList_Base_dList_dCons ("nonrec", (C_Base_dList_dList_Base_dList_dCons ("object", (C_Base_dList_dList_Base_dList_dCons ("of", (C_Base_dList_dList_Base_dList_dCons ("open", (C_Base_dList_dList_Base_dList_dCons ("or", (C_Base_dList_dList_Base_dList_dCons ("private", (C_Base_dList_dList_Base_dList_dCons ("rec", (C_Base_dList_dList_Base_dList_dCons ("sig", (C_Base_dList_dList_Base_dList_dCons ("struct", (C_Base_dList_dList_Base_dList_dCons ("then", (C_Base_dList_dList_Base_dList_dCons ("to", (C_Base_dList_dList_Base_dList_dCons ("true", (C_Base_dList_dList_Base_dList_dCons ("try", (C_Base_dList_dList_Base_dList_dCons ("type", (C_Base_dList_dList_Base_dList_dCons ("val", (C_Base_dList_dList_Base_dList_dCons ("virtual", (C_Base_dList_dList_Base_dList_dCons ("when", (C_Base_dList_dList_Base_dList_dCons ("while", (C_Base_dList_dList_Base_dList_dCons ("with", C_Base_dList_dList_Base_dList_dNil))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))

let v_Vuna_dCompiler_dCodegen_dDecl_docamlBinderName = (fun name -> ((fun oc -> (if ((v_Base_dList_dmemName oc) v_Vuna_dCompiler_dCodegen_dDecl_docamlReservedWords) then ((bi_concat oc) "_") else oc)) (v_Vuna_dCompiler_dCodegen_dDecl_dsanitizeName name)))

let rec v_Vuna_dCompiler_dCodegen_dDecl_dinterpose = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__0, dtb__1) -> (match dtb__1 with
  | C_Base_dList_dList_Base_dList_dNil -> (C_Base_dList_dList_Base_dList_dCons (dtb__0, C_Base_dList_dList_Base_dList_dNil))
  | _ -> (C_Base_dList_dList_Base_dList_dCons (dtb__0, (C_Base_dList_dList_Base_dList_dCons (mc0, ((v_Vuna_dCompiler_dCodegen_dDecl_dinterpose mc0) dtb__1)))))
)
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dList_dList_Base_dList_dNil
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dCodegen_dDecl_djoinWith = (fun sep -> (fun xs -> (dtp_concatMany ((v_Vuna_dCompiler_dCodegen_dDecl_dinterpose sep) xs))))

let v_Vuna_dCompiler_dCodegen_dDecl_dtypeParamName = (fun i -> ((bi_concat "'a") (bi_strFromInt i)))

let v_Vuna_dCompiler_dCodegen_dDecl_dtypeParamNames = (fun n -> ((v_Base_dList_dmap v_Vuna_dCompiler_dCodegen_dDecl_dtypeParamName) ((v_Base_dList_drange 0) n)))

let v_Vuna_dCompiler_dCodegen_dDecl_dtypeParamDecl = (fun mc0 -> (if ((bi_eq_int mc0) 0) then "" else ((fun nd_uscrut1 -> (match nd_uscrut1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__2, dtb__3) -> (match dtb__3 with
  | C_Base_dList_dList_Base_dList_dNil -> ((bi_concat dtb__2) " ")
  | _ -> ((bi_concat "(") ((bi_concat ((v_Vuna_dCompiler_dCodegen_dDecl_djoinWith ", ") nd_uscrut1)) ") "))
)
  | _ -> ((bi_concat "(") ((bi_concat ((v_Vuna_dCompiler_dCodegen_dDecl_djoinWith ", ") nd_uscrut1)) ") "))
)) (v_Vuna_dCompiler_dCodegen_dDecl_dtypeParamNames mc0))))

let rec v_Vuna_dCompiler_dCodegen_dDecl_dtypeParamLevelsGo = (fun mc0 -> (fun mc1 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__4, dtb__5) -> (if (v_Vuna_dCompiler_dCore_dTerm_drigIsErased (v_Base_dPair_dsecondOf dtb__4)) then (C_Base_dList_dList_Base_dList_dCons (mc1, ((v_Vuna_dCompiler_dCodegen_dDecl_dtypeParamLevelsGo dtb__5) ((bi_add mc1) 1)))) else ((v_Vuna_dCompiler_dCodegen_dDecl_dtypeParamLevelsGo dtb__5) ((bi_add mc1) 1)))
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dList_dList_Base_dList_dNil
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dCodegen_dDecl_dtypeParamLevels = (fun d -> ((v_Vuna_dCompiler_dCodegen_dDecl_dtypeParamLevelsGo (v_Vuna_dCompiler_dElab_dTypes_ddtDataParams d)) 0))

let rec v_Vuna_dCompiler_dCodegen_dDecl_dfindDtData = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__6, dtb__7) -> (if ((bi_eq_str (v_Vuna_dCompiler_dElab_dTypes_ddtDataName dtb__6)) mc0) then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__6)) else ((v_Vuna_dCompiler_dCodegen_dDecl_dfindDtData mc0) dtb__7))
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dCodegen_dDecl_dmemInt = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__8, dtb__9) -> (if ((bi_eq_int dtb__8) mc0) then true else ((v_Vuna_dCompiler_dCodegen_dDecl_dmemInt mc0) dtb__9))
  | C_Base_dList_dList_Base_dList_dNil -> false
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dCodegen_dDecl_dlevelSlotGo = (fun mc0 -> (fun mc1 -> (fun mc2 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__10, dtb__11) -> (if ((bi_eq_int dtb__10) mc1) then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (mc2)) else (((v_Vuna_dCompiler_dCodegen_dDecl_dlevelSlotGo dtb__11) mc1) ((bi_add mc2) 1)))
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
))))

let v_Vuna_dCompiler_dCodegen_dDecl_dlevelSlot = (fun levels -> (fun lvl -> (((v_Vuna_dCompiler_dCodegen_dDecl_dlevelSlotGo levels) lvl) 0)))

let rec v_Vuna_dCompiler_dCodegen_dDecl_dnthValue = (fun mc0 -> (fun mc1 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__12, dtb__13) -> (if ((bi_le_int mc1) 0) then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__12)) else ((v_Vuna_dCompiler_dCodegen_dDecl_dnthValue dtb__13) ((bi_sub mc1) 1)))
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dCodegen_dDecl_dlookupUsed = (fun mc0 -> (fun mc1 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__14, dtb__15) -> (if ((bi_eq_str (v_Base_dPair_dfirstOf dtb__14)) mc1) then (v_Base_dPair_dsecondOf dtb__14) else ((v_Vuna_dCompiler_dCodegen_dDecl_dlookupUsed dtb__15) mc1))
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dList_dList_Base_dList_dNil
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dCodegen_dDecl_dcollectUsedLevelsFuel = (fun fuel -> (fun tps -> (fun table -> (fun datas -> (fun lvl -> (fun v -> (if ((bi_le_int fuel) 0) then C_Base_dList_dList_Base_dList_dNil else (match v with
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVPi (dtb__16, dtb__17, dtb__18, dtb__19, dtb__20) -> (if dtb__17 then ((((((v_Vuna_dCompiler_dCodegen_dDecl_dcollectUsedLevelsFuel ((bi_sub fuel) 1)) tps) table) datas) ((bi_add lvl) 1)) ((v_Vuna_dCompiler_dCore_dEval_dapplyClosure dtb__20) (C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral ((C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNVar (dtb__16, lvl, C_Base_dList_dList_Base_dList_dNil)))))) else ((v_Base_dList_dappend ((((((v_Vuna_dCompiler_dCodegen_dDecl_dcollectUsedLevelsFuel ((bi_sub fuel) 1)) tps) table) datas) lvl) dtb__19)) ((((((v_Vuna_dCompiler_dCodegen_dDecl_dcollectUsedLevelsFuel ((bi_sub fuel) 1)) tps) table) datas) ((bi_add lvl) 1)) ((v_Vuna_dCompiler_dCore_dEval_dapplyClosure dtb__20) (C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral ((C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNVar (dtb__16, lvl, C_Base_dList_dList_Base_dList_dNil))))))))
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral (dtb__21) -> (match dtb__21 with
  | C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNVar (dtb__22, dtb__23, dtb__24) -> ((v_Base_dList_dappend (if ((v_Vuna_dCompiler_dCodegen_dDecl_dmemInt dtb__23) tps) then (C_Base_dList_dList_Base_dList_dCons (dtb__23, C_Base_dList_dList_Base_dList_dNil)) else C_Base_dList_dList_Base_dList_dNil)) ((((((v_Vuna_dCompiler_dCodegen_dDecl_dcollectUsedSpineFuel ((bi_sub fuel) 1)) tps) table) datas) lvl) dtb__24))
  | C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNGlobal (dtb__25, dtb__26) -> (match ((v_Vuna_dCompiler_dCodegen_dDecl_dfindDtData dtb__25) datas) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__27) -> (((((((v_Vuna_dCompiler_dCodegen_dDecl_dcollectFamilyArgsFuel ((bi_sub fuel) 1)) tps) table) datas) lvl) ((v_Vuna_dCompiler_dCodegen_dDecl_dlookupUsed table) dtb__25)) dtb__26)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((((((v_Vuna_dCompiler_dCodegen_dDecl_dcollectUsedSpineFuel ((bi_sub fuel) 1)) tps) table) datas) lvl) dtb__26)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> C_Base_dList_dList_Base_dList_dNil
))))))))
and v_Vuna_dCompiler_dCodegen_dDecl_dcollectUsedSpineFuel = (fun mc0 -> (fun mc1 -> (fun mc2 -> (fun mc3 -> (fun mc4 -> (fun mc5 -> (match mc5 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__28, dtb__29) -> (if ((bi_le_int mc0) 0) then C_Base_dList_dList_Base_dList_dNil else ((v_Base_dList_dappend ((((((v_Vuna_dCompiler_dCodegen_dDecl_dcollectUsedLevelsFuel ((bi_sub mc0) 1)) mc1) mc2) mc3) mc4) dtb__28)) ((((((v_Vuna_dCompiler_dCodegen_dDecl_dcollectUsedSpineFuel ((bi_sub mc0) 1)) mc1) mc2) mc3) mc4) dtb__29)))
  | C_Base_dList_dList_Base_dList_dNil -> (if ((bi_le_int mc0) 0) then C_Base_dList_dList_Base_dList_dNil else C_Base_dList_dList_Base_dList_dNil)
  | _ -> failwith "DT: impossible branch"
)))))))
and v_Vuna_dCompiler_dCodegen_dDecl_dcollectFamilyArgsFuel = (fun fuel -> (fun tps -> (fun table -> (fun datas -> (fun lvl -> (fun usedPats -> (fun args -> (if ((bi_le_int fuel) 0) then C_Base_dList_dList_Base_dList_dNil else (match usedPats with
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dList_dList_Base_dList_dNil
  | C_Base_dList_dList_Base_dList_dCons (dtb__30, dtb__31) -> (match ((v_Vuna_dCompiler_dCodegen_dDecl_dnthValue args) dtb__30) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__32) -> ((v_Base_dList_dappend ((((((v_Vuna_dCompiler_dCodegen_dDecl_dcollectUsedLevelsFuel ((bi_sub fuel) 1)) tps) table) datas) lvl) dtb__32)) (((((((v_Vuna_dCompiler_dCodegen_dDecl_dcollectFamilyArgsFuel ((bi_sub fuel) 1)) tps) table) datas) lvl) dtb__31) args))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (((((((v_Vuna_dCompiler_dCodegen_dDecl_dcollectFamilyArgsFuel ((bi_sub fuel) 1)) tps) table) datas) lvl) dtb__31) args)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))))))))

let v_Vuna_dCompiler_dCodegen_dDecl_dcollectUsedLevels = (fun tps -> (fun table -> (fun datas -> (fun lvl -> (fun v -> ((((((v_Vuna_dCompiler_dCodegen_dDecl_dcollectUsedLevelsFuel 256) tps) table) datas) lvl) v))))))

let v_Vuna_dCompiler_dCodegen_dDecl_dcollectFamilyArgs = (fun tps -> (fun table -> (fun datas -> (fun lvl -> (fun usedPats -> (fun args -> (((((((v_Vuna_dCompiler_dCodegen_dDecl_dcollectFamilyArgsFuel 256) tps) table) datas) lvl) usedPats) args)))))))

let rec v_Vuna_dCompiler_dCodegen_dDecl_dctorUsedLevels = (fun mc0 -> (fun mc1 -> (fun mc2 -> (fun mc3 -> (fun mc4 -> (fun mc5 -> (match mc3 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__33, dtb__34) -> (match dtb__33 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__35, dtb__36) -> (match mc5 with
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVPi (dtb__37, dtb__38, dtb__39, dtb__40, dtb__41) -> ((fun next -> (if (v_Vuna_dCompiler_dCore_dTerm_drigIsErased dtb__36) then ((((((v_Vuna_dCompiler_dCodegen_dDecl_dctorUsedLevels mc0) mc1) mc2) dtb__34) ((bi_add mc4) 1)) next) else ((v_Base_dList_dappend (((((v_Vuna_dCompiler_dCodegen_dDecl_dcollectUsedLevels mc0) mc1) mc2) mc4) dtb__40)) ((((((v_Vuna_dCompiler_dCodegen_dDecl_dctorUsedLevels mc0) mc1) mc2) dtb__34) ((bi_add mc4) 1)) next)))) ((v_Vuna_dCompiler_dCore_dEval_dapplyClosure dtb__41) (C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral ((C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNVar (dtb__37, mc4, C_Base_dList_dList_Base_dList_dNil))))))
  | _ -> C_Base_dList_dList_Base_dList_dNil
)
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dList_dList_Base_dList_dNil
  | _ -> failwith "DT: impossible branch"
)))))))

let v_Vuna_dCompiler_dCodegen_dDecl_ddataUsedLevels = (fun d -> (fun table -> (fun datas -> ((fun raw -> ((v_Base_dList_dfilter (fun l -> ((v_Vuna_dCompiler_dCodegen_dDecl_dmemInt l) raw))) (v_Vuna_dCompiler_dCodegen_dDecl_dtypeParamLevels d))) ((v_Base_dList_dconcatMap (fun c -> ((((((v_Vuna_dCompiler_dCodegen_dDecl_dctorUsedLevels (v_Vuna_dCompiler_dCodegen_dDecl_dtypeParamLevels d)) table) datas) (v_Vuna_dCompiler_dElab_dTypes_ddtCtorTelescope c)) 0) ((v_Vuna_dCompiler_dCore_dEval_deval C_Base_dList_dList_Base_dList_dNil) (v_Vuna_dCompiler_dElab_dTypes_ddtCtorType c))))) (v_Vuna_dCompiler_dElab_dTypes_ddtDataCtors d))))))

let rec v_Vuna_dCompiler_dCodegen_dDecl_dsameLevelTable = (fun mc0 -> (fun mc1 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__42, dtb__43) -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__44, dtb__45) -> (if (if ((bi_eq_str (v_Base_dPair_dfirstOf dtb__42)) (v_Base_dPair_dfirstOf dtb__44)) then ((bi_eq_generic (v_Base_dPair_dsecondOf dtb__42)) (v_Base_dPair_dsecondOf dtb__44)) else false) then ((v_Vuna_dCompiler_dCodegen_dDecl_dsameLevelTable dtb__43) dtb__45) else false)
  | _ -> false
)
  | C_Base_dList_dList_Base_dList_dNil -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dNil -> true
  | _ -> false
)
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dCodegen_dDecl_dusedTableFixFuel = (fun fuel -> (fun datas -> (fun table -> (if ((bi_le_int fuel) 0) then table else ((fun next -> (if ((v_Vuna_dCompiler_dCodegen_dDecl_dsameLevelTable next) table) then next else (((v_Vuna_dCompiler_dCodegen_dDecl_dusedTableFixFuel ((bi_sub fuel) 1)) datas) next))) ((v_Base_dList_dmap (fun d -> (C_Base_dPair_dPair_Base_dPair_dPair ((v_Vuna_dCompiler_dElab_dTypes_ddtDataName d), (((v_Vuna_dCompiler_dCodegen_dDecl_ddataUsedLevels d) table) datas))))) datas))))))

let v_Vuna_dCompiler_dCodegen_dDecl_dusedTableFix = (fun datas -> (fun table -> (((v_Vuna_dCompiler_dCodegen_dDecl_dusedTableFixFuel 64) datas) table)))

let v_Vuna_dCompiler_dCodegen_dDecl_dfamilyTyText = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__46, dtb__47) -> (match dtb__47 with
  | C_Base_dList_dList_Base_dList_dNil -> ((bi_concat dtb__46) ((bi_concat " ") (v_Vuna_dCompiler_dCodegen_dDecl_dtypeName mc0)))
  | _ -> ((bi_concat "(") ((bi_concat ((v_Vuna_dCompiler_dCodegen_dDecl_djoinWith ", ") mc1)) ((bi_concat ") ") (v_Vuna_dCompiler_dCodegen_dDecl_dtypeName mc0))))
)
  | C_Base_dList_dList_Base_dList_dNil -> (v_Vuna_dCompiler_dCodegen_dDecl_dtypeName mc0)
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dCodegen_dDecl_drenderFamilyArgsFuel = (fun fuel -> (fun levels -> (fun table -> (fun datas -> (fun usedPats -> (fun args -> (if ((bi_le_int fuel) 0) then C_Base_dList_dList_Base_dList_dNil else (match usedPats with
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dList_dList_Base_dList_dNil
  | C_Base_dList_dList_Base_dList_dCons (dtb__48, dtb__49) -> (match ((v_Vuna_dCompiler_dCodegen_dDecl_dnthValue args) dtb__48) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__50) -> (C_Base_dList_dList_Base_dList_dCons ((((((v_Vuna_dCompiler_dCodegen_dDecl_drenderTypeArgFuel ((bi_sub fuel) 1)) levels) table) datas) dtb__50), ((((((v_Vuna_dCompiler_dCodegen_dDecl_drenderFamilyArgsFuel ((bi_sub fuel) 1)) levels) table) datas) dtb__49) args)))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((((((v_Vuna_dCompiler_dCodegen_dDecl_drenderFamilyArgsFuel ((bi_sub fuel) 1)) levels) table) datas) dtb__49) args)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))))))
and v_Vuna_dCompiler_dCodegen_dDecl_drenderTypeArgFuel = (fun fuel -> (fun levels -> (fun table -> (fun datas -> (fun v -> (if ((bi_le_int fuel) 0) then "unit" else (match v with
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral (dtb__51) -> (match dtb__51 with
  | C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNVar (dtb__52, dtb__53, dtb__54) -> (match ((v_Vuna_dCompiler_dCodegen_dDecl_dlevelSlot levels) dtb__53) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__55) -> (v_Vuna_dCompiler_dCodegen_dDecl_dtypeParamName dtb__55)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> "unit"
  | _ -> failwith "DT: impossible branch"
)
  | C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNGlobal (dtb__56, dtb__57) -> (if ((bi_eq_str dtb__56) v_Vuna_dCompiler_dIntrinsics_dintTypeName) then "int" else (if ((bi_eq_str dtb__56) v_Vuna_dCompiler_dIntrinsics_dstrTypeName) then "string" else (if ((bi_eq_str dtb__56) v_Vuna_dCompiler_dIntrinsics_dboolTypeName) then "bool" else (match ((v_Vuna_dCompiler_dCodegen_dDecl_dfindDtData dtb__56) datas) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__58) -> ((v_Vuna_dCompiler_dCodegen_dDecl_dfamilyTyText dtb__56) ((((((v_Vuna_dCompiler_dCodegen_dDecl_drenderFamilyArgsFuel ((bi_sub fuel) 1)) levels) table) datas) ((v_Vuna_dCompiler_dCodegen_dDecl_dlookupUsed table) dtb__56)) dtb__57))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> "unit"
  | _ -> failwith "DT: impossible branch"
))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> "unit"
)))))))

let v_Vuna_dCompiler_dCodegen_dDecl_drenderFamilyArgs = (fun levels -> (fun table -> (fun datas -> (fun usedPats -> (fun args -> ((((((v_Vuna_dCompiler_dCodegen_dDecl_drenderFamilyArgsFuel 256) levels) table) datas) usedPats) args))))))

let v_Vuna_dCompiler_dCodegen_dDecl_drenderTypeArg = (fun levels -> (fun table -> (fun datas -> (fun v -> (((((v_Vuna_dCompiler_dCodegen_dDecl_drenderTypeArgFuel 256) levels) table) datas) v)))))

let rec v_Vuna_dCompiler_dCodegen_dDecl_drenderPiTyFuel = (fun fuel -> (fun levels -> (fun table -> (fun datas -> (fun lvl -> (fun v -> (if ((bi_le_int fuel) 0) then ((((v_Vuna_dCompiler_dCodegen_dDecl_drenderTypeArg levels) table) datas) v) else (match v with
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVPi (dtb__59, dtb__60, dtb__61, dtb__62, dtb__63) -> ((fun next -> (if (v_Vuna_dCompiler_dCore_dTerm_drigIsErased dtb__61) then ((((((v_Vuna_dCompiler_dCodegen_dDecl_drenderPiTyFuel ((bi_sub fuel) 1)) levels) table) datas) ((bi_add lvl) 1)) next) else ((bi_concat "(") ((bi_concat ((((((v_Vuna_dCompiler_dCodegen_dDecl_drenderPiTyFuel ((bi_sub fuel) 1)) levels) table) datas) lvl) dtb__62)) ((bi_concat ") -> ") ((((((v_Vuna_dCompiler_dCodegen_dDecl_drenderPiTyFuel ((bi_sub fuel) 1)) levels) table) datas) ((bi_add lvl) 1)) next)))))) ((v_Vuna_dCompiler_dCore_dEval_dapplyClosure dtb__63) (C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral ((C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNVar (dtb__59, lvl, C_Base_dList_dList_Base_dList_dNil))))))
  | _ -> ((((v_Vuna_dCompiler_dCodegen_dDecl_drenderTypeArg levels) table) datas) v)
))))))))

let v_Vuna_dCompiler_dCodegen_dDecl_drenderPiTy = (fun levels -> (fun table -> (fun datas -> (fun lvl -> (fun v -> ((((((v_Vuna_dCompiler_dCodegen_dDecl_drenderPiTyFuel 256) levels) table) datas) lvl) v))))))

let v_Vuna_dCompiler_dCodegen_dDecl_drenderFieldTy = (fun levels -> (fun table -> (fun datas -> (fun lvl -> (fun dom -> (fun slot -> (match dom with
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVPi (dtb__64, dtb__65, dtb__66, dtb__67, dtb__68) -> (if dtb__65 then (C_Base_dPair_dPair_Base_dPair_dPair ((v_Vuna_dCompiler_dCodegen_dDecl_dtypeParamName slot), ((bi_add slot) 1))) else (C_Base_dPair_dPair_Base_dPair_dPair ((((((v_Vuna_dCompiler_dCodegen_dDecl_drenderPiTy levels) table) datas) lvl) dom), slot)))
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral (dtb__69) -> (match dtb__69 with
  | C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNVar (dtb__70, dtb__71, dtb__72) -> (match ((v_Vuna_dCompiler_dCodegen_dDecl_dlevelSlot levels) dtb__71) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__73) -> (C_Base_dPair_dPair_Base_dPair_dPair ((v_Vuna_dCompiler_dCodegen_dDecl_dtypeParamName dtb__73), slot))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (C_Base_dPair_dPair_Base_dPair_dPair ((v_Vuna_dCompiler_dCodegen_dDecl_dtypeParamName slot), ((bi_add slot) 1)))
  | _ -> failwith "DT: impossible branch"
)
  | C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNGlobal (dtb__74, dtb__75) -> (if ((bi_eq_str dtb__74) v_Vuna_dCompiler_dIntrinsics_dintTypeName) then (C_Base_dPair_dPair_Base_dPair_dPair ("int", slot)) else (if ((bi_eq_str dtb__74) v_Vuna_dCompiler_dIntrinsics_dstrTypeName) then (C_Base_dPair_dPair_Base_dPair_dPair ("string", slot)) else (if ((bi_eq_str dtb__74) v_Vuna_dCompiler_dIntrinsics_dboolTypeName) then (C_Base_dPair_dPair_Base_dPair_dPair ("bool", slot)) else (match ((v_Vuna_dCompiler_dCodegen_dDecl_dfindDtData dtb__74) datas) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__76) -> (C_Base_dPair_dPair_Base_dPair_dPair (((v_Vuna_dCompiler_dCodegen_dDecl_dfamilyTyText dtb__74) (((((v_Vuna_dCompiler_dCodegen_dDecl_drenderFamilyArgs levels) table) datas) ((v_Vuna_dCompiler_dCodegen_dDecl_dlookupUsed table) dtb__74)) dtb__75)), slot))
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
  | C_Base_dList_dList_Base_dList_dCons (dtb__77, dtb__78) -> ((v_Base_dList_dappend ((v_Base_dList_dmap (fun c -> (C_Base_dPair_dPair_Base_dPair_dPair ((v_Vuna_dCompiler_dElab_dTypes_ddtCtorName c), (v_Vuna_dCompiler_dCodegen_dDecl_dctorKeepFlags c))))) (v_Vuna_dCompiler_dElab_dTypes_ddtDataCtors dtb__77))) (v_Vuna_dCompiler_dCodegen_dDecl_dctorShapeOf dtb__78))
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dList_dList_Base_dList_dNil
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dCodegen_dDecl_dctorFieldTexts = (fun mc0 -> (fun mc1 -> (fun mc2 -> (fun mc3 -> (fun mc4 -> (fun mc5 -> (fun mc6 -> (fun mc7 -> (match mc3 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__79, dtb__80) -> (match mc4 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__81, dtb__82) -> (match dtb__81 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__83, dtb__84) -> (if ((v_Vuna_dCompiler_dCodegen_dDecl_dflagMatchesRig dtb__79) dtb__84) then (match mc6 with
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVPi (dtb__85, dtb__86, dtb__87, dtb__88, dtb__89) -> ((fun next -> (if dtb__79 then (match ((((((v_Vuna_dCompiler_dCodegen_dDecl_drenderFieldTy mc0) mc1) mc2) mc5) dtb__88) mc7) with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__90, dtb__91) -> ((v_Base_dResult_dandThen ((((((((v_Vuna_dCompiler_dCodegen_dDecl_dctorFieldTexts mc0) mc1) mc2) dtb__80) dtb__82) ((bi_add mc5) 1)) next) dtb__91)) (fun p -> (match p with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__92, dtb__93) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Base_dList_dList_Base_dList_dCons (dtb__90, dtb__92)), dtb__93))))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
) else ((((((((v_Vuna_dCompiler_dCodegen_dDecl_dctorFieldTexts mc0) mc1) mc2) dtb__80) dtb__82) ((bi_add mc5) 1)) next) mc7))) ((v_Vuna_dCompiler_dCore_dEval_dapplyClosure dtb__89) (C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral ((C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNVar (dtb__85, mc5, C_Base_dList_dList_Base_dList_dNil))))))
  | _ -> (C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: constructor telescope does not match its type"))
) else (C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: constructor keep flag disagrees with telescope rig")))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (C_Base_dList_dList_Base_dList_dNil, mc7))))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> (match mc4 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__94, dtb__95) -> (C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: constructor shape has more binders than its telescope"))
  | C_Base_dList_dList_Base_dList_dNil -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (C_Base_dList_dList_Base_dList_dNil, mc7))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))))))))

let v_Vuna_dCompiler_dCodegen_dDecl_dctorArityNeed = (fun levels -> (fun table -> (fun datas -> (fun c -> ((v_Base_dResult_dandThen ((((((((v_Vuna_dCompiler_dCodegen_dDecl_dctorFieldTexts levels) table) datas) (v_Vuna_dCompiler_dCodegen_dDecl_dctorKeepFlags c)) (v_Vuna_dCompiler_dElab_dTypes_ddtCtorTelescope c)) 0) ((v_Vuna_dCompiler_dCore_dEval_deval C_Base_dList_dList_Base_dList_dNil) (v_Vuna_dCompiler_dElab_dTypes_ddtCtorType c))) (v_Base_dList_dlength levels))) (fun p -> (C_Base_dResult_dResult_Base_dResult_dOk (((bi_sub (v_Base_dPair_dsecondOf p)) (v_Base_dList_dlength levels))))))))))

let rec v_Vuna_dCompiler_dCodegen_dDecl_dmaxIntList = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__96, dtb__97) -> (if ((bi_ge_int dtb__96) (v_Vuna_dCompiler_dCodegen_dDecl_dmaxIntList dtb__97)) then dtb__96 else (v_Vuna_dCompiler_dCodegen_dDecl_dmaxIntList dtb__97))
  | C_Base_dList_dList_Base_dList_dNil -> 0
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCodegen_dDecl_ddataArityNeed = (fun levels -> (fun table -> (fun datas -> (fun ctors -> ((v_Base_dResult_dandThen ((v_Base_dResult_dtraverse (((v_Vuna_dCompiler_dCodegen_dDecl_dctorArityNeed levels) table) datas)) ctors)) (fun ns -> (C_Base_dResult_dResult_Base_dResult_dOk (((bi_add (v_Base_dList_dlength levels)) (v_Vuna_dCompiler_dCodegen_dDecl_dmaxIntList ns))))))))))

let v_Vuna_dCompiler_dCodegen_dDecl_dparenOne = (fun t -> ((bi_concat "(") ((bi_concat t) ")")))

let rec v_Vuna_dCompiler_dCodegen_dDecl_dparenList = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__98, dtb__99) -> ((v_Base_dList_dappend (C_Base_dList_dList_Base_dList_dCons ((v_Vuna_dCompiler_dCodegen_dDecl_dparenOne dtb__98), C_Base_dList_dList_Base_dList_dNil))) (v_Vuna_dCompiler_dCodegen_dDecl_dparenList dtb__99))
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dList_dList_Base_dList_dNil
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCodegen_dDecl_dctorDeclText = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__100, dtb__101) -> (match dtb__101 with
  | C_Base_dList_dList_Base_dList_dNil -> ((bi_concat mc0) ((bi_concat " of ") (v_Vuna_dCompiler_dCodegen_dDecl_dparenOne dtb__100)))
  | _ -> ((bi_concat mc0) ((bi_concat " of ") ((v_Vuna_dCompiler_dCodegen_dDecl_djoinWith " * ") (v_Vuna_dCompiler_dCodegen_dDecl_dparenList mc1))))
)
  | C_Base_dList_dList_Base_dList_dNil -> mc0
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dCodegen_dDecl_dgenCtorDecl = (fun levels -> (fun table -> (fun datas -> (fun c -> ((v_Base_dResult_dandThen ((((((((v_Vuna_dCompiler_dCodegen_dDecl_dctorFieldTexts levels) table) datas) (v_Vuna_dCompiler_dCodegen_dDecl_dctorKeepFlags c)) (v_Vuna_dCompiler_dElab_dTypes_ddtCtorTelescope c)) 0) ((v_Vuna_dCompiler_dCore_dEval_deval C_Base_dList_dList_Base_dList_dNil) (v_Vuna_dCompiler_dElab_dTypes_ddtCtorType c))) (v_Base_dList_dlength levels))) (fun p -> (C_Base_dResult_dResult_Base_dResult_dOk (((v_Vuna_dCompiler_dCodegen_dDecl_dctorDeclText ((v_Vuna_dCompiler_dCodegen_dDecl_dctorOcamlName (v_Vuna_dCompiler_dElab_dTypes_ddtCtorFamily c)) (v_Vuna_dCompiler_dElab_dTypes_ddtCtorName c))) (v_Base_dPair_dfirstOf p))))))))))

let v_Vuna_dCompiler_dCodegen_dDecl_dctorBodyText = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dNil -> "|"
  | _ -> ((v_Vuna_dCompiler_dCodegen_dDecl_djoinWith " | ") mc0)
))

let v_Vuna_dCompiler_dCodegen_dDecl_dgenDataDecl = (fun table -> (fun datas -> (fun d -> ((fun levels -> ((v_Base_dResult_dandThen ((((v_Vuna_dCompiler_dCodegen_dDecl_ddataArityNeed levels) table) datas) (v_Vuna_dCompiler_dElab_dTypes_ddtDataCtors d))) (fun arity -> ((v_Base_dResult_dandThen ((v_Base_dResult_dtraverse (((v_Vuna_dCompiler_dCodegen_dDecl_dgenCtorDecl levels) table) datas)) (v_Vuna_dCompiler_dElab_dTypes_ddtDataCtors d))) (fun cs -> (C_Base_dResult_dResult_Base_dResult_dOk (((bi_concat (v_Vuna_dCompiler_dCodegen_dDecl_dtypeParamDecl arity)) ((bi_concat (v_Vuna_dCompiler_dCodegen_dDecl_dtypeName (v_Vuna_dCompiler_dElab_dTypes_ddtDataName d))) ((bi_concat " = ") (v_Vuna_dCompiler_dCodegen_dDecl_dctorBodyText cs))))))))))) ((v_Vuna_dCompiler_dCodegen_dDecl_dlookupUsed table) (v_Vuna_dCompiler_dElab_dTypes_ddtDataName d))))))

let v_Vuna_dCompiler_dCodegen_dDecl_disBoolFamilyName = (fun name -> ((bi_eq_str name) v_Vuna_dCompiler_dIntrinsics_dboolTypeName))

let v_Vuna_dCompiler_dCodegen_dDecl_druntimeDatas = (fun datas -> ((v_Base_dList_dfilter (fun d -> (if (v_Vuna_dCompiler_dCodegen_dDecl_disBoolFamilyName (v_Vuna_dCompiler_dElab_dTypes_ddtDataName d)) then false else true))) datas))

let v_Vuna_dCompiler_dCodegen_dDecl_dgenTypeDeclsOf = (fun allDatas -> (fun subset -> (match subset with
  | C_Base_dList_dList_Base_dList_dNil -> (C_Base_dResult_dResult_Base_dResult_dOk (""))
  | _ -> ((fun table -> ((v_Base_dResult_dandThen ((v_Base_dResult_dtraverse ((v_Vuna_dCompiler_dCodegen_dDecl_dgenDataDecl table) allDatas)) subset)) (fun parts -> (C_Base_dResult_dResult_Base_dResult_dOk (((bi_concat "type ") ((bi_concat ((v_Vuna_dCompiler_dCodegen_dDecl_djoinWith "\nand ") parts)) "\n\n"))))))) ((v_Vuna_dCompiler_dCodegen_dDecl_dusedTableFix allDatas) ((v_Base_dList_dmap (fun d -> (C_Base_dPair_dPair_Base_dPair_dPair ((v_Vuna_dCompiler_dElab_dTypes_ddtDataName d), C_Base_dList_dList_Base_dList_dNil)))) allDatas)))
)))

let v_Vuna_dCompiler_dCodegen_dDecl_dcollectUsedSpine = (fun a1 -> (fun a2 -> (fun a3 -> (fun a4 -> (fun a5 -> ((((((v_Vuna_dCompiler_dCodegen_dDecl_dcollectUsedSpineFuel 512) a1) a2) a3) a4) a5))))))
