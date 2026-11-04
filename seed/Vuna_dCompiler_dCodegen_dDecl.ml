open Vuna_runtime
open Base_dPair
open Base_dBool
open Base_dMonad
open Base_dMaybe
open Base_dEq
open Base_dOrd
open Base_dInt
open Base_dList
open Base_dResult
open Base_dString
open Base_dShow
open Prelude
open Vuna_dCompiler_dCommon
open Vuna_dCompiler_dFrontend_dToml
open Vuna_dCompiler_dFrontend_dManifest
open Base_dIO
open Vuna_dCompiler_dPackages_dPkg
open Base_dArray
open Base_dHashMap
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
open Vuna_dCompiler_dLoader_dFixity
open Vuna_dCompiler_dLoader_dModules
open Vuna_dCompiler_dIntrinsics
open Vuna_dCompiler_dLoader_dResolve
open Vuna_dCompiler_dLoader_dFlatten
open Vuna_dCompiler_dLoader
open Base_dIntMap
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
open Vuna_dCompiler_dElab_dInstName
open Vuna_dCompiler_dElab_dTrait
open Vuna_dCompiler_dElab_dDerive
open Vuna_dCompiler_dElab_dRecords
open Vuna_dCompiler_dElab_dTermination_dMeasure
open Vuna_dCompiler_dElab_dTermination_dScc
open Vuna_dCompiler_dElab_dTermination
open Vuna_dCompiler_dElab_dDriver
open Vuna_dCompiler_dElab
let v_Vuna_dCompiler_dCodegen_dDecl_disAsciiAlphaNum = (fun c -> (if (if (if (c >= 65) then (c <= 90) else false) then true else (if (c >= 97) then (c <= 122) else false)) then true else (if (c >= 48) then (c <= 57) else false)))

let v_Vuna_dCompiler_dCodegen_dDecl_dsanitizeChar = (fun mc0 -> (if (mc0 = 46) then (C_Base_dList_dList_Base_dList_dCons (95, (C_Base_dList_dList_Base_dList_dCons (100, C_Base_dList_dList_Base_dList_dNil)))) else (if (mc0 = 95) then (C_Base_dList_dList_Base_dList_dCons (95, (C_Base_dList_dList_Base_dList_dCons (117, C_Base_dList_dList_Base_dList_dNil)))) else (if (mc0 = 39) then (C_Base_dList_dList_Base_dList_dCons (95, (C_Base_dList_dList_Base_dList_dCons (112, C_Base_dList_dList_Base_dList_dNil)))) else (if (mc0 = 35) then (C_Base_dList_dList_Base_dList_dCons (95, (C_Base_dList_dList_Base_dList_dCons (104, C_Base_dList_dList_Base_dList_dNil)))) else (if (v_Vuna_dCompiler_dCodegen_dDecl_disAsciiAlphaNum mc0) then (C_Base_dList_dList_Base_dList_dCons (mc0, C_Base_dList_dList_Base_dList_dNil)) else (dtp_unpack (String.concat "" ["_x"; (bi_strFromInt mc0); "_"]))))))))

let v_Vuna_dCompiler_dCodegen_dDecl_dsanitizeName = (fun name -> (dtp_pack ((v_Base_dList_dconcatMap v_Vuna_dCompiler_dCodegen_dDecl_dsanitizeChar) (dtp_unpack name))))

let v_Vuna_dCompiler_dCodegen_dDecl_docamlPad3 = (fun s -> (if ((bi_strLength s) = 1) then ("00" ^ s) else (if ((bi_strLength s) = 2) then ("0" ^ s) else s)))

let v_Vuna_dCompiler_dCodegen_dDecl_docamlEscapeChar = (fun mc0 -> (if (mc0 = 34) then (C_Base_dList_dList_Base_dList_dCons (92, (C_Base_dList_dList_Base_dList_dCons (34, C_Base_dList_dList_Base_dList_dNil)))) else (if (mc0 = 92) then (C_Base_dList_dList_Base_dList_dCons (92, (C_Base_dList_dList_Base_dList_dCons (92, C_Base_dList_dList_Base_dList_dNil)))) else (if (mc0 = 10) then (C_Base_dList_dList_Base_dList_dCons (92, (C_Base_dList_dList_Base_dList_dCons (110, C_Base_dList_dList_Base_dList_dNil)))) else (if (mc0 = 9) then (C_Base_dList_dList_Base_dList_dCons (92, (C_Base_dList_dList_Base_dList_dCons (116, C_Base_dList_dList_Base_dList_dNil)))) else (if (mc0 = 13) then (C_Base_dList_dList_Base_dList_dCons (92, (C_Base_dList_dList_Base_dList_dCons (114, C_Base_dList_dList_Base_dList_dNil)))) else (if (if (mc0 >= 32) then (mc0 <= 126) else false) then (C_Base_dList_dList_Base_dList_dCons (mc0, C_Base_dList_dList_Base_dList_dNil)) else (dtp_unpack ("\\" ^ (v_Vuna_dCompiler_dCodegen_dDecl_docamlPad3 (bi_strFromInt mc0)))))))))))

let v_Vuna_dCompiler_dCodegen_dDecl_docamlString = (fun s -> (String.concat "" ["\""; (dtp_pack ((v_Base_dList_dconcatMap v_Vuna_dCompiler_dCodegen_dDecl_docamlEscapeChar) (dtp_unpack s))); "\""]))

let v_Vuna_dCompiler_dCodegen_dDecl_dvalueName = (fun name -> ("v_" ^ (v_Vuna_dCompiler_dCodegen_dDecl_dsanitizeName name)))

let v_Vuna_dCompiler_dCodegen_dDecl_dboolText = (fun b -> (if b then "true" else "false"))

let v_Vuna_dCompiler_dCodegen_dDecl_dtypeName = (fun name -> ("t_" ^ (v_Vuna_dCompiler_dCodegen_dDecl_dsanitizeName name)))

let v_Vuna_dCompiler_dCodegen_dDecl_dctorOcamlName = (fun family ctor -> (String.concat "" ["C_"; (v_Vuna_dCompiler_dCodegen_dDecl_dsanitizeName family); "_"; (v_Vuna_dCompiler_dCodegen_dDecl_dsanitizeName ctor)]))

let v_Vuna_dCompiler_dCodegen_dDecl_docamlReservedWords = (C_Base_dList_dList_Base_dList_dCons ("and", (C_Base_dList_dList_Base_dList_dCons ("as", (C_Base_dList_dList_Base_dList_dCons ("assert", (C_Base_dList_dList_Base_dList_dCons ("asr", (C_Base_dList_dList_Base_dList_dCons ("begin", (C_Base_dList_dList_Base_dList_dCons ("class", (C_Base_dList_dList_Base_dList_dCons ("constraint", (C_Base_dList_dList_Base_dList_dCons ("do", (C_Base_dList_dList_Base_dList_dCons ("done", (C_Base_dList_dList_Base_dList_dCons ("downto", (C_Base_dList_dList_Base_dList_dCons ("else", (C_Base_dList_dList_Base_dList_dCons ("end", (C_Base_dList_dList_Base_dList_dCons ("exception", (C_Base_dList_dList_Base_dList_dCons ("external", (C_Base_dList_dList_Base_dList_dCons ("false", (C_Base_dList_dList_Base_dList_dCons ("for", (C_Base_dList_dList_Base_dList_dCons ("fun", (C_Base_dList_dList_Base_dList_dCons ("function", (C_Base_dList_dList_Base_dList_dCons ("functor", (C_Base_dList_dList_Base_dList_dCons ("if", (C_Base_dList_dList_Base_dList_dCons ("in", (C_Base_dList_dList_Base_dList_dCons ("include", (C_Base_dList_dList_Base_dList_dCons ("inherit", (C_Base_dList_dList_Base_dList_dCons ("initializer", (C_Base_dList_dList_Base_dList_dCons ("land", (C_Base_dList_dList_Base_dList_dCons ("lazy", (C_Base_dList_dList_Base_dList_dCons ("let", (C_Base_dList_dList_Base_dList_dCons ("lor", (C_Base_dList_dList_Base_dList_dCons ("lsl", (C_Base_dList_dList_Base_dList_dCons ("lsr", (C_Base_dList_dList_Base_dList_dCons ("lxor", (C_Base_dList_dList_Base_dList_dCons ("match", (C_Base_dList_dList_Base_dList_dCons ("method", (C_Base_dList_dList_Base_dList_dCons ("mod", (C_Base_dList_dList_Base_dList_dCons ("module", (C_Base_dList_dList_Base_dList_dCons ("mutable", (C_Base_dList_dList_Base_dList_dCons ("new", (C_Base_dList_dList_Base_dList_dCons ("nonrec", (C_Base_dList_dList_Base_dList_dCons ("object", (C_Base_dList_dList_Base_dList_dCons ("of", (C_Base_dList_dList_Base_dList_dCons ("open", (C_Base_dList_dList_Base_dList_dCons ("or", (C_Base_dList_dList_Base_dList_dCons ("private", (C_Base_dList_dList_Base_dList_dCons ("rec", (C_Base_dList_dList_Base_dList_dCons ("sig", (C_Base_dList_dList_Base_dList_dCons ("struct", (C_Base_dList_dList_Base_dList_dCons ("then", (C_Base_dList_dList_Base_dList_dCons ("to", (C_Base_dList_dList_Base_dList_dCons ("true", (C_Base_dList_dList_Base_dList_dCons ("try", (C_Base_dList_dList_Base_dList_dCons ("type", (C_Base_dList_dList_Base_dList_dCons ("val", (C_Base_dList_dList_Base_dList_dCons ("virtual", (C_Base_dList_dList_Base_dList_dCons ("when", (C_Base_dList_dList_Base_dList_dCons ("while", (C_Base_dList_dList_Base_dList_dCons ("with", C_Base_dList_dList_Base_dList_dNil))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))

let v_Vuna_dCompiler_dCodegen_dDecl_docamlBinderName = (fun name -> ((fun oc -> (if ((v_Base_dList_dmemName oc) v_Vuna_dCompiler_dCodegen_dDecl_docamlReservedWords) then (oc ^ "_") else oc)) (v_Vuna_dCompiler_dCodegen_dDecl_dsanitizeName name)))

let rec v_Vuna_dCompiler_dCodegen_dDecl_dinterpose = (fun mc0 mc1 -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__0, dtb__1) -> (match dtb__1 with
  | C_Base_dList_dList_Base_dList_dNil -> (C_Base_dList_dList_Base_dList_dCons (dtb__0, C_Base_dList_dList_Base_dList_dNil))
  | _ -> (C_Base_dList_dList_Base_dList_dCons (dtb__0, (C_Base_dList_dList_Base_dList_dCons (mc0, ((v_Vuna_dCompiler_dCodegen_dDecl_dinterpose mc0) dtb__1)))))
)
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dList_dList_Base_dList_dNil
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCodegen_dDecl_djoinWith = (fun sep xs -> (dtp_concatMany ((v_Vuna_dCompiler_dCodegen_dDecl_dinterpose sep) xs)))

let v_Vuna_dCompiler_dCodegen_dDecl_dtypeParamName = (fun i -> ("'a" ^ (bi_strFromInt i)))

let v_Vuna_dCompiler_dCodegen_dDecl_dtypeParamNames = (fun n -> ((v_Base_dList_dmap v_Vuna_dCompiler_dCodegen_dDecl_dtypeParamName) ((v_Base_dList_drange 0) n)))

let v_Vuna_dCompiler_dCodegen_dDecl_dtypeParamDecl = (fun mc0 -> (if (mc0 = 0) then "" else ((fun nd_uscrut1 -> (match nd_uscrut1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__2, dtb__3) -> (match dtb__3 with
  | C_Base_dList_dList_Base_dList_dNil -> (dtb__2 ^ " ")
  | _ -> (String.concat "" ["("; ((v_Vuna_dCompiler_dCodegen_dDecl_djoinWith ", ") nd_uscrut1); ") "])
)
  | _ -> (String.concat "" ["("; ((v_Vuna_dCompiler_dCodegen_dDecl_djoinWith ", ") nd_uscrut1); ") "])
)) (v_Vuna_dCompiler_dCodegen_dDecl_dtypeParamNames mc0))))

let rec v_Vuna_dCompiler_dCodegen_dDecl_dtypeParamLevelsGo = (fun mc0 mc1 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__4, dtb__5) -> (if (v_Vuna_dCompiler_dCore_dTerm_drigIsErased (v_Base_dPair_dsecondOf dtb__4)) then (C_Base_dList_dList_Base_dList_dCons (mc1, ((v_Vuna_dCompiler_dCodegen_dDecl_dtypeParamLevelsGo dtb__5) (mc1 + 1)))) else ((v_Vuna_dCompiler_dCodegen_dDecl_dtypeParamLevelsGo dtb__5) (mc1 + 1)))
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dList_dList_Base_dList_dNil
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCodegen_dDecl_dtypeParamLevels = (fun d -> ((v_Vuna_dCompiler_dCodegen_dDecl_dtypeParamLevelsGo (v_Vuna_dCompiler_dElab_dTypes_ddtDataParams d)) 0))

let rec v_Vuna_dCompiler_dCodegen_dDecl_dfindDtData = (fun mc0 mc1 -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__6, dtb__7) -> (if ((v_Vuna_dCompiler_dElab_dTypes_ddtDataName dtb__6) = mc0) then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__6)) else ((v_Vuna_dCompiler_dCodegen_dDecl_dfindDtData mc0) dtb__7))
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dCodegen_dDecl_dmemInt = (fun mc0 mc1 -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__8, dtb__9) -> (if (dtb__8 = mc0) then true else ((v_Vuna_dCompiler_dCodegen_dDecl_dmemInt mc0) dtb__9))
  | C_Base_dList_dList_Base_dList_dNil -> false
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dCodegen_dDecl_dlevelSlotGo = (fun mc0 mc1 mc2 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__10, dtb__11) -> (if (dtb__10 = mc1) then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (mc2)) else (((v_Vuna_dCompiler_dCodegen_dDecl_dlevelSlotGo dtb__11) mc1) (mc2 + 1)))
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCodegen_dDecl_dlevelSlot = (fun levels lvl -> (((v_Vuna_dCompiler_dCodegen_dDecl_dlevelSlotGo levels) lvl) 0))

let rec v_Vuna_dCompiler_dCodegen_dDecl_dnthValue = (fun mc0 mc1 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__12, dtb__13) -> (if (mc1 <= 0) then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__12)) else ((v_Vuna_dCompiler_dCodegen_dDecl_dnthValue dtb__13) (mc1 - 1)))
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dCodegen_dDecl_dlookupUsed = (fun mc0 mc1 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__14, dtb__15) -> (if ((v_Base_dPair_dfirstOf dtb__14) = mc1) then (v_Base_dPair_dsecondOf dtb__14) else ((v_Vuna_dCompiler_dCodegen_dDecl_dlookupUsed dtb__15) mc1))
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dList_dList_Base_dList_dNil
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dCodegen_dDecl_dcollectUsedLevelsFuel = (fun fuel tps table datas lvl v -> (if (fuel <= 0) then C_Base_dList_dList_Base_dList_dNil else (match v with
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVPi (dtb__16, dtb__17, dtb__18, dtb__19, dtb__20) -> (if dtb__17 then ((((((v_Vuna_dCompiler_dCodegen_dDecl_dcollectUsedLevelsFuel (fuel - 1)) tps) table) datas) (lvl + 1)) ((v_Vuna_dCompiler_dCore_dEval_dapplyClosure dtb__20) (C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral ((C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNVar (dtb__16, lvl, C_Base_dList_dList_Base_dList_dNil)))))) else ((v_Base_dList_dappend ((((((v_Vuna_dCompiler_dCodegen_dDecl_dcollectUsedLevelsFuel (fuel - 1)) tps) table) datas) lvl) dtb__19)) ((((((v_Vuna_dCompiler_dCodegen_dDecl_dcollectUsedLevelsFuel (fuel - 1)) tps) table) datas) (lvl + 1)) ((v_Vuna_dCompiler_dCore_dEval_dapplyClosure dtb__20) (C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral ((C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNVar (dtb__16, lvl, C_Base_dList_dList_Base_dList_dNil))))))))
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral (dtb__21) -> (match dtb__21 with
  | C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNVar (dtb__22, dtb__23, dtb__24) -> ((v_Base_dList_dappend (if ((v_Vuna_dCompiler_dCodegen_dDecl_dmemInt dtb__23) tps) then (C_Base_dList_dList_Base_dList_dCons (dtb__23, C_Base_dList_dList_Base_dList_dNil)) else C_Base_dList_dList_Base_dList_dNil)) ((((((v_Vuna_dCompiler_dCodegen_dDecl_dcollectUsedSpineFuel (fuel - 1)) tps) table) datas) lvl) dtb__24))
  | C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNGlobal (dtb__25, dtb__26) -> (match ((v_Vuna_dCompiler_dCodegen_dDecl_dfindDtData dtb__25) datas) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__27) -> (((((((v_Vuna_dCompiler_dCodegen_dDecl_dcollectFamilyArgsFuel (fuel - 1)) tps) table) datas) lvl) ((v_Vuna_dCompiler_dCodegen_dDecl_dlookupUsed table) dtb__25)) dtb__26)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((((((v_Vuna_dCompiler_dCodegen_dDecl_dcollectUsedSpineFuel (fuel - 1)) tps) table) datas) lvl) dtb__26)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> C_Base_dList_dList_Base_dList_dNil
)))
and v_Vuna_dCompiler_dCodegen_dDecl_dcollectUsedSpineFuel = (fun mc0 mc1 mc2 mc3 mc4 mc5 -> (match mc5 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__28, dtb__29) -> (if (mc0 <= 0) then C_Base_dList_dList_Base_dList_dNil else ((v_Base_dList_dappend ((((((v_Vuna_dCompiler_dCodegen_dDecl_dcollectUsedLevelsFuel (mc0 - 1)) mc1) mc2) mc3) mc4) dtb__28)) ((((((v_Vuna_dCompiler_dCodegen_dDecl_dcollectUsedSpineFuel (mc0 - 1)) mc1) mc2) mc3) mc4) dtb__29)))
  | C_Base_dList_dList_Base_dList_dNil -> (if (mc0 <= 0) then C_Base_dList_dList_Base_dList_dNil else C_Base_dList_dList_Base_dList_dNil)
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dCodegen_dDecl_dcollectFamilyArgsFuel = (fun fuel tps table datas lvl usedPats args -> (if (fuel <= 0) then C_Base_dList_dList_Base_dList_dNil else (match usedPats with
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dList_dList_Base_dList_dNil
  | C_Base_dList_dList_Base_dList_dCons (dtb__30, dtb__31) -> (match ((v_Vuna_dCompiler_dCodegen_dDecl_dnthValue args) dtb__30) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__32) -> ((v_Base_dList_dappend ((((((v_Vuna_dCompiler_dCodegen_dDecl_dcollectUsedLevelsFuel (fuel - 1)) tps) table) datas) lvl) dtb__32)) (((((((v_Vuna_dCompiler_dCodegen_dDecl_dcollectFamilyArgsFuel (fuel - 1)) tps) table) datas) lvl) dtb__31) args))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (((((((v_Vuna_dCompiler_dCodegen_dDecl_dcollectFamilyArgsFuel (fuel - 1)) tps) table) datas) lvl) dtb__31) args)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dCodegen_dDecl_dcollectUsedLevels = (fun tps table datas lvl v -> ((((((v_Vuna_dCompiler_dCodegen_dDecl_dcollectUsedLevelsFuel 256) tps) table) datas) lvl) v))

let v_Vuna_dCompiler_dCodegen_dDecl_dcollectFamilyArgs = (fun tps table datas lvl usedPats args -> (((((((v_Vuna_dCompiler_dCodegen_dDecl_dcollectFamilyArgsFuel 256) tps) table) datas) lvl) usedPats) args))

let rec v_Vuna_dCompiler_dCodegen_dDecl_dctorUsedLevels = (fun mc0 mc1 mc2 mc3 mc4 mc5 -> (match mc3 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__33, dtb__34) -> (match dtb__33 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__35, dtb__36) -> (match mc5 with
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVPi (dtb__37, dtb__38, dtb__39, dtb__40, dtb__41) -> ((fun next -> (if (v_Vuna_dCompiler_dCore_dTerm_drigIsErased dtb__36) then ((((((v_Vuna_dCompiler_dCodegen_dDecl_dctorUsedLevels mc0) mc1) mc2) dtb__34) (mc4 + 1)) next) else ((v_Base_dList_dappend (((((v_Vuna_dCompiler_dCodegen_dDecl_dcollectUsedLevels mc0) mc1) mc2) mc4) dtb__40)) ((((((v_Vuna_dCompiler_dCodegen_dDecl_dctorUsedLevels mc0) mc1) mc2) dtb__34) (mc4 + 1)) next)))) ((v_Vuna_dCompiler_dCore_dEval_dapplyClosure dtb__41) (C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral ((C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNVar (dtb__37, mc4, C_Base_dList_dList_Base_dList_dNil))))))
  | _ -> C_Base_dList_dList_Base_dList_dNil
)
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dList_dList_Base_dList_dNil
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCodegen_dDecl_ddataUsedLevels = (fun d table datas -> ((fun raw -> ((v_Base_dList_dfilter (fun l -> ((v_Vuna_dCompiler_dCodegen_dDecl_dmemInt l) raw))) (v_Vuna_dCompiler_dCodegen_dDecl_dtypeParamLevels d))) ((v_Base_dList_dconcatMap (fun c -> ((((((v_Vuna_dCompiler_dCodegen_dDecl_dctorUsedLevels (v_Vuna_dCompiler_dCodegen_dDecl_dtypeParamLevels d)) table) datas) (v_Vuna_dCompiler_dElab_dTypes_ddtCtorTelescope c)) 0) ((v_Vuna_dCompiler_dCore_dEval_deval C_Base_dList_dList_Base_dList_dNil) (v_Vuna_dCompiler_dElab_dTypes_ddtCtorType c))))) (v_Vuna_dCompiler_dElab_dTypes_ddtDataCtors d))))

let rec v_Vuna_dCompiler_dCodegen_dDecl_dlevelListEq = (fun mc0 mc1 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__42, dtb__43) -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__44, dtb__45) -> (if (dtb__42 = dtb__44) then ((v_Vuna_dCompiler_dCodegen_dDecl_dlevelListEq dtb__43) dtb__45) else false)
  | _ -> false
)
  | C_Base_dList_dList_Base_dList_dNil -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dNil -> true
  | _ -> false
)
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dCodegen_dDecl_dsameLevelTable = (fun mc0 mc1 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__46, dtb__47) -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__48, dtb__49) -> (if (if ((v_Base_dPair_dfirstOf dtb__46) = (v_Base_dPair_dfirstOf dtb__48)) then ((v_Vuna_dCompiler_dCodegen_dDecl_dlevelListEq (v_Base_dPair_dsecondOf dtb__46)) (v_Base_dPair_dsecondOf dtb__48)) else false) then ((v_Vuna_dCompiler_dCodegen_dDecl_dsameLevelTable dtb__47) dtb__49) else false)
  | _ -> false
)
  | C_Base_dList_dList_Base_dList_dNil -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dNil -> true
  | _ -> false
)
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dCodegen_dDecl_dusedTableFixFuel = (fun fuel datas table -> (if (fuel <= 0) then table else ((fun next -> (if ((v_Vuna_dCompiler_dCodegen_dDecl_dsameLevelTable next) table) then next else (((v_Vuna_dCompiler_dCodegen_dDecl_dusedTableFixFuel (fuel - 1)) datas) next))) ((v_Base_dList_dmap (fun d -> (C_Base_dPair_dPair_Base_dPair_dPair ((v_Vuna_dCompiler_dElab_dTypes_ddtDataName d), (((v_Vuna_dCompiler_dCodegen_dDecl_ddataUsedLevels d) table) datas))))) datas))))

let v_Vuna_dCompiler_dCodegen_dDecl_dusedTableFix = (fun datas table -> (((v_Vuna_dCompiler_dCodegen_dDecl_dusedTableFixFuel 64) datas) table))

let v_Vuna_dCompiler_dCodegen_dDecl_dfamilyTyText = (fun mc0 mc1 -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__50, dtb__51) -> (match dtb__51 with
  | C_Base_dList_dList_Base_dList_dNil -> (String.concat "" [dtb__50; " "; (v_Vuna_dCompiler_dCodegen_dDecl_dtypeName mc0)])
  | _ -> (String.concat "" ["("; ((v_Vuna_dCompiler_dCodegen_dDecl_djoinWith ", ") mc1); ") "; (v_Vuna_dCompiler_dCodegen_dDecl_dtypeName mc0)])
)
  | C_Base_dList_dList_Base_dList_dNil -> (v_Vuna_dCompiler_dCodegen_dDecl_dtypeName mc0)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCodegen_dDecl_drenderTypeIntrinsic = (fun mc0 mc1 -> (if (mc0 = "Array") then (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__52, dtb__53) -> (match dtb__53 with
  | C_Base_dList_dList_Base_dList_dNil -> (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((String.concat "" ["("; dtb__52; " array)"])))
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
) else (if (mc0 = "IORef") then (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__54, dtb__55) -> (match dtb__55 with
  | C_Base_dList_dList_Base_dList_dNil -> (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((String.concat "" ["("; dtb__54; " ref)"])))
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
) else (if (mc0 = "MArray") then (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__56, dtb__57) -> (match dtb__57 with
  | C_Base_dList_dList_Base_dList_dNil -> (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((String.concat "" ["("; dtb__56; " array)"])))
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
) else (if (mc0 = "Buffer") then (match mc1 with
  | C_Base_dList_dList_Base_dList_dNil -> (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ("Buffer.t"))
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
) else C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing)))))

let rec v_Vuna_dCompiler_dCodegen_dDecl_drenderFamilyArgsFuel = (fun fuel levels table datas usedPats args -> (if (fuel <= 0) then C_Base_dList_dList_Base_dList_dNil else (match usedPats with
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dList_dList_Base_dList_dNil
  | C_Base_dList_dList_Base_dList_dCons (dtb__58, dtb__59) -> (match ((v_Vuna_dCompiler_dCodegen_dDecl_dnthValue args) dtb__58) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__60) -> (C_Base_dList_dList_Base_dList_dCons ((((((v_Vuna_dCompiler_dCodegen_dDecl_drenderTypeArgFuel (fuel - 1)) levels) table) datas) dtb__60), ((((((v_Vuna_dCompiler_dCodegen_dDecl_drenderFamilyArgsFuel (fuel - 1)) levels) table) datas) dtb__59) args)))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((((((v_Vuna_dCompiler_dCodegen_dDecl_drenderFamilyArgsFuel (fuel - 1)) levels) table) datas) dtb__59) args)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))
and v_Vuna_dCompiler_dCodegen_dDecl_drenderTypeArgFuel = (fun fuel levels table datas v -> (if (fuel <= 0) then "unit" else (match v with
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral (dtb__61) -> (match dtb__61 with
  | C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNVar (dtb__62, dtb__63, dtb__64) -> (match ((v_Vuna_dCompiler_dCodegen_dDecl_dlevelSlot levels) dtb__63) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__65) -> (v_Vuna_dCompiler_dCodegen_dDecl_dtypeParamName dtb__65)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> "unit"
  | _ -> failwith "DT: impossible branch"
)
  | C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNGlobal (dtb__66, dtb__67) -> ((((((v_Vuna_dCompiler_dCodegen_dDecl_drenderTypeArgGlobal fuel) levels) table) datas) dtb__66) dtb__67)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> "unit"
)))
and v_Vuna_dCompiler_dCodegen_dDecl_drenderTypeArgGlobal = (fun fuel levels table datas g sp -> (match ((v_Vuna_dCompiler_dCodegen_dDecl_drenderTypeIntrinsic g) ((v_Base_dList_dmap (fun x -> (((((v_Vuna_dCompiler_dCodegen_dDecl_drenderTypeArgFuel (fuel - 1)) levels) table) datas) x))) sp)) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__68) -> dtb__68
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (if (g = v_Vuna_dCompiler_dIntrinsics_dintTypeName) then "int" else (if (g = v_Vuna_dCompiler_dIntrinsics_dstrTypeName) then "string" else (if (g = v_Vuna_dCompiler_dIntrinsics_dboolTypeName) then "bool" else (match ((v_Vuna_dCompiler_dCodegen_dDecl_dfindDtData g) datas) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__69) -> ((v_Vuna_dCompiler_dCodegen_dDecl_dfamilyTyText g) ((((((v_Vuna_dCompiler_dCodegen_dDecl_drenderFamilyArgsFuel (fuel - 1)) levels) table) datas) ((v_Vuna_dCompiler_dCodegen_dDecl_dlookupUsed table) g)) sp))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> "unit"
  | _ -> failwith "DT: impossible branch"
))))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCodegen_dDecl_drenderFamilyArgs = (fun levels table datas usedPats args -> ((((((v_Vuna_dCompiler_dCodegen_dDecl_drenderFamilyArgsFuel 256) levels) table) datas) usedPats) args))

let v_Vuna_dCompiler_dCodegen_dDecl_drenderTypeArg = (fun levels table datas v -> (((((v_Vuna_dCompiler_dCodegen_dDecl_drenderTypeArgFuel 256) levels) table) datas) v))

let rec v_Vuna_dCompiler_dCodegen_dDecl_drenderPiTyFuel = (fun fuel levels table datas lvl v -> (if (fuel <= 0) then ((((v_Vuna_dCompiler_dCodegen_dDecl_drenderTypeArg levels) table) datas) v) else (match v with
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVPi (dtb__70, dtb__71, dtb__72, dtb__73, dtb__74) -> ((fun next -> (if (v_Vuna_dCompiler_dCore_dTerm_drigIsErased dtb__72) then ((((((v_Vuna_dCompiler_dCodegen_dDecl_drenderPiTyFuel (fuel - 1)) levels) table) datas) (lvl + 1)) next) else (String.concat "" ["("; ((((((v_Vuna_dCompiler_dCodegen_dDecl_drenderPiTyFuel (fuel - 1)) levels) table) datas) lvl) dtb__73); ") -> "; ((((((v_Vuna_dCompiler_dCodegen_dDecl_drenderPiTyFuel (fuel - 1)) levels) table) datas) (lvl + 1)) next)]))) ((v_Vuna_dCompiler_dCore_dEval_dapplyClosure dtb__74) (C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral ((C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNVar (dtb__70, lvl, C_Base_dList_dList_Base_dList_dNil))))))
  | _ -> ((((v_Vuna_dCompiler_dCodegen_dDecl_drenderTypeArg levels) table) datas) v)
)))

let v_Vuna_dCompiler_dCodegen_dDecl_drenderPiTy = (fun levels table datas lvl v -> ((((((v_Vuna_dCompiler_dCodegen_dDecl_drenderPiTyFuel 256) levels) table) datas) lvl) v))

let v_Vuna_dCompiler_dCodegen_dDecl_drenderFieldTy = (fun mc0 mc1 mc2 mc3 mc4 mc5 -> (match mc4 with
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral (dtb__75) -> (match dtb__75 with
  | C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNVar (dtb__76, dtb__77, dtb__78) -> (match ((v_Vuna_dCompiler_dCodegen_dDecl_dlevelSlot mc0) dtb__77) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__79) -> (C_Base_dPair_dPair_Base_dPair_dPair ((v_Vuna_dCompiler_dCodegen_dDecl_dtypeParamName dtb__79), mc5))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (C_Base_dPair_dPair_Base_dPair_dPair ((v_Vuna_dCompiler_dCodegen_dDecl_dtypeParamName mc5), (mc5 + 1)))
  | _ -> failwith "DT: impossible branch"
)
  | C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNGlobal (dtb__80, dtb__81) -> (match ((v_Vuna_dCompiler_dCodegen_dDecl_drenderTypeIntrinsic dtb__80) ((v_Base_dList_dmap (fun x -> ((((v_Vuna_dCompiler_dCodegen_dDecl_drenderTypeArg mc0) mc1) mc2) x))) dtb__81)) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__82) -> (C_Base_dPair_dPair_Base_dPair_dPair (dtb__82, mc5))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (if (dtb__80 = v_Vuna_dCompiler_dIntrinsics_dintTypeName) then (C_Base_dPair_dPair_Base_dPair_dPair ("int", mc5)) else (if (dtb__80 = v_Vuna_dCompiler_dIntrinsics_dstrTypeName) then (C_Base_dPair_dPair_Base_dPair_dPair ("string", mc5)) else (if (dtb__80 = v_Vuna_dCompiler_dIntrinsics_dboolTypeName) then (C_Base_dPair_dPair_Base_dPair_dPair ("bool", mc5)) else (match ((v_Vuna_dCompiler_dCodegen_dDecl_dfindDtData dtb__80) mc2) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__83) -> (C_Base_dPair_dPair_Base_dPair_dPair (((v_Vuna_dCompiler_dCodegen_dDecl_dfamilyTyText dtb__80) (((((v_Vuna_dCompiler_dCodegen_dDecl_drenderFamilyArgs mc0) mc1) mc2) ((v_Vuna_dCompiler_dCodegen_dDecl_dlookupUsed mc1) dtb__80)) dtb__81)), mc5))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (C_Base_dPair_dPair_Base_dPair_dPair ((v_Vuna_dCompiler_dCodegen_dDecl_dtypeParamName mc5), (mc5 + 1)))
  | _ -> failwith "DT: impossible branch"
))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVPi (dtb__84, dtb__85, dtb__86, dtb__87, dtb__88) -> (if dtb__85 then (C_Base_dPair_dPair_Base_dPair_dPair ((v_Vuna_dCompiler_dCodegen_dDecl_dtypeParamName mc5), (mc5 + 1))) else (C_Base_dPair_dPair_Base_dPair_dPair ((((((v_Vuna_dCompiler_dCodegen_dDecl_drenderPiTy mc0) mc1) mc2) mc3) mc4), mc5)))
  | _ -> (C_Base_dPair_dPair_Base_dPair_dPair ((v_Vuna_dCompiler_dCodegen_dDecl_dtypeParamName mc5), (mc5 + 1)))
))

let v_Vuna_dCompiler_dCodegen_dDecl_dctorKeepFlags = (fun c -> ((v_Base_dList_dmap (fun b -> (v_Base_dBool_dnot (v_Vuna_dCompiler_dCore_dTerm_drigIsErased (v_Base_dPair_dsecondOf b))))) (v_Vuna_dCompiler_dElab_dTypes_ddtCtorTelescope c)))

let v_Vuna_dCompiler_dCodegen_dDecl_dflagMatchesRig = (fun keep rig -> (if keep then (v_Base_dBool_dnot (v_Vuna_dCompiler_dCore_dTerm_drigIsErased rig)) else (v_Vuna_dCompiler_dCore_dTerm_drigIsErased rig)))

let rec v_Vuna_dCompiler_dCodegen_dDecl_dctorShapeOf = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__89, dtb__90) -> ((v_Base_dList_dappend ((v_Base_dList_dmap (fun c -> (C_Base_dPair_dPair_Base_dPair_dPair ((v_Vuna_dCompiler_dElab_dTypes_ddtCtorName c), (v_Vuna_dCompiler_dCodegen_dDecl_dctorKeepFlags c))))) (v_Vuna_dCompiler_dElab_dTypes_ddtDataCtors dtb__89))) (v_Vuna_dCompiler_dCodegen_dDecl_dctorShapeOf dtb__90))
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dList_dList_Base_dList_dNil
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dCodegen_dDecl_dctorFieldTexts = (fun mc0 mc1 mc2 mc3 mc4 mc5 mc6 mc7 -> (match mc3 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__91, dtb__92) -> (match mc4 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__93, dtb__94) -> (match dtb__93 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__95, dtb__96) -> (if ((v_Vuna_dCompiler_dCodegen_dDecl_dflagMatchesRig dtb__91) dtb__96) then (match mc6 with
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVPi (dtb__97, dtb__98, dtb__99, dtb__100, dtb__101) -> ((fun next -> (if dtb__91 then (match ((((((v_Vuna_dCompiler_dCodegen_dDecl_drenderFieldTy mc0) mc1) mc2) mc5) dtb__100) mc7) with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__102, dtb__103) -> ((v_Base_dResult_dandThen ((((((((v_Vuna_dCompiler_dCodegen_dDecl_dctorFieldTexts mc0) mc1) mc2) dtb__92) dtb__94) (mc5 + 1)) next) dtb__103)) (fun p -> (match p with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__104, dtb__105) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Base_dList_dList_Base_dList_dCons (dtb__102, dtb__104)), dtb__105))))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
) else ((((((((v_Vuna_dCompiler_dCodegen_dDecl_dctorFieldTexts mc0) mc1) mc2) dtb__92) dtb__94) (mc5 + 1)) next) mc7))) ((v_Vuna_dCompiler_dCore_dEval_dapplyClosure dtb__101) (C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral ((C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNVar (dtb__97, mc5, C_Base_dList_dList_Base_dList_dNil))))))
  | _ -> (C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: constructor telescope does not match its type"))
) else (C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: constructor keep flag disagrees with telescope rig")))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (C_Base_dList_dList_Base_dList_dNil, mc7))))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> (match mc4 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__106, dtb__107) -> (C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: constructor shape has more binders than its telescope"))
  | C_Base_dList_dList_Base_dList_dNil -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (C_Base_dList_dList_Base_dList_dNil, mc7))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCodegen_dDecl_dctorArityNeed = (fun levels table datas c -> ((v_Base_dResult_dandThen ((((((((v_Vuna_dCompiler_dCodegen_dDecl_dctorFieldTexts levels) table) datas) (v_Vuna_dCompiler_dCodegen_dDecl_dctorKeepFlags c)) (v_Vuna_dCompiler_dElab_dTypes_ddtCtorTelescope c)) 0) ((v_Vuna_dCompiler_dCore_dEval_deval C_Base_dList_dList_Base_dList_dNil) (v_Vuna_dCompiler_dElab_dTypes_ddtCtorType c))) (v_Base_dList_dlength levels))) (fun p -> (C_Base_dResult_dResult_Base_dResult_dOk (((v_Base_dPair_dsecondOf p) - (v_Base_dList_dlength levels)))))))

let rec v_Vuna_dCompiler_dCodegen_dDecl_dmaxIntList = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__108, dtb__109) -> (if (dtb__108 >= (v_Vuna_dCompiler_dCodegen_dDecl_dmaxIntList dtb__109)) then dtb__108 else (v_Vuna_dCompiler_dCodegen_dDecl_dmaxIntList dtb__109))
  | C_Base_dList_dList_Base_dList_dNil -> 0
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCodegen_dDecl_ddataArityNeed = (fun levels table datas ctors -> ((v_Base_dResult_dandThen ((v_Base_dResult_dtraverse (((v_Vuna_dCompiler_dCodegen_dDecl_dctorArityNeed levels) table) datas)) ctors)) (fun ns -> (C_Base_dResult_dResult_Base_dResult_dOk (((v_Base_dList_dlength levels) + (v_Vuna_dCompiler_dCodegen_dDecl_dmaxIntList ns)))))))

let v_Vuna_dCompiler_dCodegen_dDecl_dparenOne = (fun t -> (String.concat "" ["("; t; ")"]))

let rec v_Vuna_dCompiler_dCodegen_dDecl_dparenList = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__110, dtb__111) -> ((v_Base_dList_dappend (C_Base_dList_dList_Base_dList_dCons ((v_Vuna_dCompiler_dCodegen_dDecl_dparenOne dtb__110), C_Base_dList_dList_Base_dList_dNil))) (v_Vuna_dCompiler_dCodegen_dDecl_dparenList dtb__111))
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dList_dList_Base_dList_dNil
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCodegen_dDecl_dctorDeclText = (fun mc0 mc1 -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__112, dtb__113) -> (match dtb__113 with
  | C_Base_dList_dList_Base_dList_dNil -> (String.concat "" [mc0; " of "; (v_Vuna_dCompiler_dCodegen_dDecl_dparenOne dtb__112)])
  | _ -> (String.concat "" [mc0; " of "; ((v_Vuna_dCompiler_dCodegen_dDecl_djoinWith " * ") (v_Vuna_dCompiler_dCodegen_dDecl_dparenList mc1))])
)
  | C_Base_dList_dList_Base_dList_dNil -> mc0
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCodegen_dDecl_dgenCtorDecl = (fun levels table datas c -> ((v_Base_dResult_dandThen ((((((((v_Vuna_dCompiler_dCodegen_dDecl_dctorFieldTexts levels) table) datas) (v_Vuna_dCompiler_dCodegen_dDecl_dctorKeepFlags c)) (v_Vuna_dCompiler_dElab_dTypes_ddtCtorTelescope c)) 0) ((v_Vuna_dCompiler_dCore_dEval_deval C_Base_dList_dList_Base_dList_dNil) (v_Vuna_dCompiler_dElab_dTypes_ddtCtorType c))) (v_Base_dList_dlength levels))) (fun p -> (C_Base_dResult_dResult_Base_dResult_dOk (((v_Vuna_dCompiler_dCodegen_dDecl_dctorDeclText ((v_Vuna_dCompiler_dCodegen_dDecl_dctorOcamlName (v_Vuna_dCompiler_dElab_dTypes_ddtCtorFamily c)) (v_Vuna_dCompiler_dElab_dTypes_ddtCtorName c))) (v_Base_dPair_dfirstOf p)))))))

let v_Vuna_dCompiler_dCodegen_dDecl_dctorBodyText = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dNil -> "|"
  | _ -> ((v_Vuna_dCompiler_dCodegen_dDecl_djoinWith " | ") mc0)
))

let v_Vuna_dCompiler_dCodegen_dDecl_dgenDataDecl = (fun table datas d -> ((fun levels -> ((v_Base_dResult_dandThen ((((v_Vuna_dCompiler_dCodegen_dDecl_ddataArityNeed levels) table) datas) (v_Vuna_dCompiler_dElab_dTypes_ddtDataCtors d))) (fun arity -> ((v_Base_dResult_dandThen ((v_Base_dResult_dtraverse (((v_Vuna_dCompiler_dCodegen_dDecl_dgenCtorDecl levels) table) datas)) (v_Vuna_dCompiler_dElab_dTypes_ddtDataCtors d))) (fun cs -> (C_Base_dResult_dResult_Base_dResult_dOk ((String.concat "" [(v_Vuna_dCompiler_dCodegen_dDecl_dtypeParamDecl arity); (v_Vuna_dCompiler_dCodegen_dDecl_dtypeName (v_Vuna_dCompiler_dElab_dTypes_ddtDataName d)); " = "; (v_Vuna_dCompiler_dCodegen_dDecl_dctorBodyText cs)])))))))) ((v_Vuna_dCompiler_dCodegen_dDecl_dlookupUsed table) (v_Vuna_dCompiler_dElab_dTypes_ddtDataName d))))

let v_Vuna_dCompiler_dCodegen_dDecl_disBoolFamilyName = (fun name -> (name = v_Vuna_dCompiler_dIntrinsics_dboolTypeName))

let v_Vuna_dCompiler_dCodegen_dDecl_druntimeDatas = (fun datas -> ((v_Base_dList_dfilter (fun d -> (if (v_Vuna_dCompiler_dCodegen_dDecl_disBoolFamilyName (v_Vuna_dCompiler_dElab_dTypes_ddtDataName d)) then false else true))) datas))

let v_Vuna_dCompiler_dCodegen_dDecl_dusedTableOf = (fun datas -> ((v_Vuna_dCompiler_dCodegen_dDecl_dusedTableFix datas) ((v_Base_dList_dmap (fun d -> (C_Base_dPair_dPair_Base_dPair_dPair ((v_Vuna_dCompiler_dElab_dTypes_ddtDataName d), C_Base_dList_dList_Base_dList_dNil)))) datas)))

let v_Vuna_dCompiler_dCodegen_dDecl_dgenTypeDeclsWith = (fun mc0 mc1 mc2 -> (match mc2 with
  | C_Base_dList_dList_Base_dList_dNil -> (C_Base_dResult_dResult_Base_dResult_dOk (""))
  | _ -> ((v_Base_dResult_dandThen ((v_Base_dResult_dtraverse ((v_Vuna_dCompiler_dCodegen_dDecl_dgenDataDecl mc0) mc1)) mc2)) (fun parts -> (C_Base_dResult_dResult_Base_dResult_dOk ((String.concat "" ["type "; ((v_Vuna_dCompiler_dCodegen_dDecl_djoinWith "\nand ") parts); "\n\n"])))))
))

let v_Vuna_dCompiler_dCodegen_dDecl_dgenTypeDeclsOf = (fun allDatas subset -> (((v_Vuna_dCompiler_dCodegen_dDecl_dgenTypeDeclsWith (v_Vuna_dCompiler_dCodegen_dDecl_dusedTableOf allDatas)) allDatas) subset))

let v_Vuna_dCompiler_dCodegen_dDecl_dcollectUsedSpine = (fun a1 a2 a3 a4 a5 -> ((((((v_Vuna_dCompiler_dCodegen_dDecl_dcollectUsedSpineFuel 512) a1) a2) a3) a4) a5))
