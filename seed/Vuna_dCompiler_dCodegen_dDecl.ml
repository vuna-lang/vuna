open Vuna_runtime
type t_Vuna_dCompiler_dCodegen_dDecl_dQualCtx = { f_Vuna_dCompiler_dCodegen_dDecl_dQualCtx_qcUnit : string; f_Vuna_dCompiler_dCodegen_dDecl_dQualCtx_qcDefs : (string, string) Base_dHashMap.t_Base_dHashMap_dHashMap; f_Vuna_dCompiler_dCodegen_dDecl_dQualCtx_qcDatas : (string, string) Base_dHashMap.t_Base_dHashMap_dHashMap }

let v_Vuna_dCompiler_dCodegen_dDecl_disAsciiAlphaNum = (fun c -> (if (if (if (c >= 65) then (c <= 90) else false) then true else (if (c >= 97) then (c <= 122) else false)) then true else (if (c >= 48) then (c <= 57) else false)))

let v_Vuna_dCompiler_dCodegen_dDecl_dsanitizeChar = (fun mc0 -> (if (mc0 = 46) then (Base_dList.C_Base_dList_dList_Cons (95, (Base_dList.C_Base_dList_dList_Cons (100, Base_dList.C_Base_dList_dList_Nil)))) else (if (mc0 = 95) then (Base_dList.C_Base_dList_dList_Cons (95, (Base_dList.C_Base_dList_dList_Cons (117, Base_dList.C_Base_dList_dList_Nil)))) else (if (mc0 = 39) then (Base_dList.C_Base_dList_dList_Cons (95, (Base_dList.C_Base_dList_dList_Cons (112, Base_dList.C_Base_dList_dList_Nil)))) else (if (mc0 = 35) then (Base_dList.C_Base_dList_dList_Cons (95, (Base_dList.C_Base_dList_dList_Cons (104, Base_dList.C_Base_dList_dList_Nil)))) else (if (v_Vuna_dCompiler_dCodegen_dDecl_disAsciiAlphaNum mc0) then (Base_dList.C_Base_dList_dList_Cons (mc0, Base_dList.C_Base_dList_dList_Nil)) else (Base_dList.dtp_unpack (String.concat "" ["_x"; (bi_strFromInt mc0); "_"]))))))))

let v_Vuna_dCompiler_dCodegen_dDecl_dsanitizeName = (fun name -> (Base_dList.dtp_pack ((Base_dList.v_Base_dList_dconcatMap v_Vuna_dCompiler_dCodegen_dDecl_dsanitizeChar) (Base_dList.dtp_unpack name))))

let v_Vuna_dCompiler_dCodegen_dDecl_docamlPad3 = (fun s -> (if ((bi_strLength s) = 1) then ("00" ^ s) else (if ((bi_strLength s) = 2) then ("0" ^ s) else s)))

let v_Vuna_dCompiler_dCodegen_dDecl_docamlEscapeChar = (fun mc0 -> (if (mc0 = 34) then (Base_dList.C_Base_dList_dList_Cons (92, (Base_dList.C_Base_dList_dList_Cons (34, Base_dList.C_Base_dList_dList_Nil)))) else (if (mc0 = 92) then (Base_dList.C_Base_dList_dList_Cons (92, (Base_dList.C_Base_dList_dList_Cons (92, Base_dList.C_Base_dList_dList_Nil)))) else (if (mc0 = 10) then (Base_dList.C_Base_dList_dList_Cons (92, (Base_dList.C_Base_dList_dList_Cons (110, Base_dList.C_Base_dList_dList_Nil)))) else (if (mc0 = 9) then (Base_dList.C_Base_dList_dList_Cons (92, (Base_dList.C_Base_dList_dList_Cons (116, Base_dList.C_Base_dList_dList_Nil)))) else (if (mc0 = 13) then (Base_dList.C_Base_dList_dList_Cons (92, (Base_dList.C_Base_dList_dList_Cons (114, Base_dList.C_Base_dList_dList_Nil)))) else (if (if (mc0 >= 32) then (mc0 <= 126) else false) then (Base_dList.C_Base_dList_dList_Cons (mc0, Base_dList.C_Base_dList_dList_Nil)) else (Base_dList.dtp_unpack ("\\" ^ (v_Vuna_dCompiler_dCodegen_dDecl_docamlPad3 (bi_strFromInt mc0)))))))))))

let v_Vuna_dCompiler_dCodegen_dDecl_docamlString = (fun s -> (String.concat "" ["\""; (Base_dList.dtp_pack ((Base_dList.v_Base_dList_dconcatMap v_Vuna_dCompiler_dCodegen_dDecl_docamlEscapeChar) (Base_dList.dtp_unpack s))); "\""]))

let v_Vuna_dCompiler_dCodegen_dDecl_dvalueName = (fun name -> ("v_" ^ (v_Vuna_dCompiler_dCodegen_dDecl_dsanitizeName name)))

let v_Vuna_dCompiler_dCodegen_dDecl_dboolText = (fun mc0 -> (if mc0 then "true" else "false"))

let v_Vuna_dCompiler_dCodegen_dDecl_dtypeName = (fun name -> ("t_" ^ (v_Vuna_dCompiler_dCodegen_dDecl_dsanitizeName name)))

let v_Vuna_dCompiler_dCodegen_dDecl_dctorOcamlName = (fun family ctor -> (String.concat "" ["C_"; (v_Vuna_dCompiler_dCodegen_dDecl_dsanitizeName family); "_"; (v_Vuna_dCompiler_dCodegen_dDecl_dsanitizeName (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dctorShortName ctor))]))

let v_Vuna_dCompiler_dCodegen_dDecl_dnoQual = { f_Vuna_dCompiler_dCodegen_dDecl_dQualCtx_qcUnit = ""; f_Vuna_dCompiler_dCodegen_dDecl_dQualCtx_qcDefs = ((Base_dHashMap.v_Base_dHashMap_dfromList Base_dString.v_Hashable_uString) Base_dList.C_Base_dList_dList_Nil); f_Vuna_dCompiler_dCodegen_dDecl_dQualCtx_qcDatas = ((Base_dHashMap.v_Base_dHashMap_dfromList Base_dString.v_Hashable_uString) Base_dList.C_Base_dList_dList_Nil) }

let v_Vuna_dCompiler_dCodegen_dDecl_dunitTblOf = (fun pairs -> (((Base_dHashMap.v_Base_dHashMap_dinsertAll Base_dString.v_Hashable_uString) pairs) ((Base_dHashMap.v_Base_dHashMap_dfromList Base_dString.v_Hashable_uString) Base_dList.C_Base_dList_dList_Nil)))

let v_Vuna_dCompiler_dCodegen_dDecl_dunitOfTbl = (fun tbl name -> (match ((((Base_dHashMap.v_Base_dHashMap_dlookup Base_dString.v_Hashable_uString) Base_dString.v_Eq_uString) name) tbl) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__0) -> dtb__0
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ""
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCodegen_dDecl_dqualOf = (fun unit defs datas -> { f_Vuna_dCompiler_dCodegen_dDecl_dQualCtx_qcUnit = unit; f_Vuna_dCompiler_dCodegen_dDecl_dQualCtx_qcDefs = (v_Vuna_dCompiler_dCodegen_dDecl_dunitTblOf defs); f_Vuna_dCompiler_dCodegen_dDecl_dQualCtx_qcDatas = (v_Vuna_dCompiler_dCodegen_dDecl_dunitTblOf datas) })

let v_Vuna_dCompiler_dCodegen_dDecl_dqualPrefix = (fun qc owner text -> (if (if (owner = "") then true else (owner = (qc).f_Vuna_dCompiler_dCodegen_dDecl_dQualCtx_qcUnit)) then { Base_dPair.f_Base_dPair_dPair_first = text; Base_dPair.f_Base_dPair_dPair_second = "" } else { Base_dPair.f_Base_dPair_dPair_first = (String.concat "" [owner; "."; text]); Base_dPair.f_Base_dPair_dPair_second = owner }))

let v_Vuna_dCompiler_dCodegen_dDecl_dqualValueText = (fun qc name -> (((v_Vuna_dCompiler_dCodegen_dDecl_dqualPrefix qc) ((v_Vuna_dCompiler_dCodegen_dDecl_dunitOfTbl (qc).f_Vuna_dCompiler_dCodegen_dDecl_dQualCtx_qcDefs) name)) (v_Vuna_dCompiler_dCodegen_dDecl_dvalueName name)))

let v_Vuna_dCompiler_dCodegen_dDecl_dqualCtorText = (fun qc family ctor -> (((v_Vuna_dCompiler_dCodegen_dDecl_dqualPrefix qc) ((v_Vuna_dCompiler_dCodegen_dDecl_dunitOfTbl (qc).f_Vuna_dCompiler_dCodegen_dDecl_dQualCtx_qcDatas) family)) ((v_Vuna_dCompiler_dCodegen_dDecl_dctorOcamlName family) ctor)))

let v_Vuna_dCompiler_dCodegen_dDecl_dqualTypeText = (fun qc name -> (((v_Vuna_dCompiler_dCodegen_dDecl_dqualPrefix qc) ((v_Vuna_dCompiler_dCodegen_dDecl_dunitOfTbl (qc).f_Vuna_dCompiler_dCodegen_dDecl_dQualCtx_qcDatas) name)) (v_Vuna_dCompiler_dCodegen_dDecl_dtypeName name)))

let rec v_Vuna_dCompiler_dCodegen_dDecl_ddataTypeGlobalNamesGo = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__1, dtb__2) -> ((v_Vuna_dCompiler_dCodegen_dDecl_ddataTypeGlobalNamesGo ((Base_dList.v_Base_dList_dappend mc0) (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dtermGlobalNames (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorType dtb__1)))) dtb__2)
  | Base_dList.C_Base_dList_dList_Nil -> mc0
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCodegen_dDecl_ddataTypeGlobalNames = (fun d -> ((v_Vuna_dCompiler_dCodegen_dDecl_ddataTypeGlobalNamesGo Base_dList.C_Base_dList_dList_Nil) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataCtors d)))

let rec v_Vuna_dCompiler_dCodegen_dDecl_dtypeDepsOfGo = (fun mc0 mc1 mc2 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__3, dtb__4) -> ((fun owner -> (if (if (owner = "") then true else (owner = (mc0).f_Vuna_dCompiler_dCodegen_dDecl_dQualCtx_qcUnit)) then (((v_Vuna_dCompiler_dCodegen_dDecl_dtypeDepsOfGo mc0) dtb__4) mc2) else (if ((Base_dList.v_Base_dList_dmemName owner) mc2) then (((v_Vuna_dCompiler_dCodegen_dDecl_dtypeDepsOfGo mc0) dtb__4) mc2) else (((v_Vuna_dCompiler_dCodegen_dDecl_dtypeDepsOfGo mc0) dtb__4) (Base_dList.C_Base_dList_dList_Cons (owner, mc2)))))) ((v_Vuna_dCompiler_dCodegen_dDecl_dunitOfTbl (mc0).f_Vuna_dCompiler_dCodegen_dDecl_dQualCtx_qcDatas) dtb__3))
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dList.v_Base_dList_dreverse mc2)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCodegen_dDecl_dtypeDepsOf = (fun qc datas -> (((v_Vuna_dCompiler_dCodegen_dDecl_dtypeDepsOfGo qc) ((Base_dList.v_Base_dList_dconcatMap v_Vuna_dCompiler_dCodegen_dDecl_ddataTypeGlobalNames) datas)) Base_dList.C_Base_dList_dList_Nil))

let v_Vuna_dCompiler_dCodegen_dDecl_docamlReservedWords = (Base_dList.C_Base_dList_dList_Cons ("and", (Base_dList.C_Base_dList_dList_Cons ("as", (Base_dList.C_Base_dList_dList_Cons ("assert", (Base_dList.C_Base_dList_dList_Cons ("asr", (Base_dList.C_Base_dList_dList_Cons ("begin", (Base_dList.C_Base_dList_dList_Cons ("class", (Base_dList.C_Base_dList_dList_Cons ("constraint", (Base_dList.C_Base_dList_dList_Cons ("do", (Base_dList.C_Base_dList_dList_Cons ("done", (Base_dList.C_Base_dList_dList_Cons ("downto", (Base_dList.C_Base_dList_dList_Cons ("else", (Base_dList.C_Base_dList_dList_Cons ("end", (Base_dList.C_Base_dList_dList_Cons ("exception", (Base_dList.C_Base_dList_dList_Cons ("external", (Base_dList.C_Base_dList_dList_Cons ("false", (Base_dList.C_Base_dList_dList_Cons ("for", (Base_dList.C_Base_dList_dList_Cons ("fun", (Base_dList.C_Base_dList_dList_Cons ("function", (Base_dList.C_Base_dList_dList_Cons ("functor", (Base_dList.C_Base_dList_dList_Cons ("if", (Base_dList.C_Base_dList_dList_Cons ("in", (Base_dList.C_Base_dList_dList_Cons ("include", (Base_dList.C_Base_dList_dList_Cons ("inherit", (Base_dList.C_Base_dList_dList_Cons ("initializer", (Base_dList.C_Base_dList_dList_Cons ("land", (Base_dList.C_Base_dList_dList_Cons ("lazy", (Base_dList.C_Base_dList_dList_Cons ("let", (Base_dList.C_Base_dList_dList_Cons ("lor", (Base_dList.C_Base_dList_dList_Cons ("lsl", (Base_dList.C_Base_dList_dList_Cons ("lsr", (Base_dList.C_Base_dList_dList_Cons ("lxor", (Base_dList.C_Base_dList_dList_Cons ("match", (Base_dList.C_Base_dList_dList_Cons ("method", (Base_dList.C_Base_dList_dList_Cons ("mod", (Base_dList.C_Base_dList_dList_Cons ("module", (Base_dList.C_Base_dList_dList_Cons ("mutable", (Base_dList.C_Base_dList_dList_Cons ("new", (Base_dList.C_Base_dList_dList_Cons ("nonrec", (Base_dList.C_Base_dList_dList_Cons ("object", (Base_dList.C_Base_dList_dList_Cons ("of", (Base_dList.C_Base_dList_dList_Cons ("open", (Base_dList.C_Base_dList_dList_Cons ("or", (Base_dList.C_Base_dList_dList_Cons ("private", (Base_dList.C_Base_dList_dList_Cons ("rec", (Base_dList.C_Base_dList_dList_Cons ("sig", (Base_dList.C_Base_dList_dList_Cons ("struct", (Base_dList.C_Base_dList_dList_Cons ("then", (Base_dList.C_Base_dList_dList_Cons ("to", (Base_dList.C_Base_dList_dList_Cons ("true", (Base_dList.C_Base_dList_dList_Cons ("try", (Base_dList.C_Base_dList_dList_Cons ("type", (Base_dList.C_Base_dList_dList_Cons ("val", (Base_dList.C_Base_dList_dList_Cons ("virtual", (Base_dList.C_Base_dList_dList_Cons ("when", (Base_dList.C_Base_dList_dList_Cons ("while", (Base_dList.C_Base_dList_dList_Cons ("with", Base_dList.C_Base_dList_dList_Nil))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))

let v_Vuna_dCompiler_dCodegen_dDecl_docamlBinderName = (fun name -> ((fun oc -> (if ((Base_dList.v_Base_dList_dmemName oc) v_Vuna_dCompiler_dCodegen_dDecl_docamlReservedWords) then (oc ^ "_") else oc)) (v_Vuna_dCompiler_dCodegen_dDecl_dsanitizeName name)))

let rec v_Vuna_dCompiler_dCodegen_dDecl_dinterpose = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__5, dtb__6) -> (match dtb__6 with
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dList.C_Base_dList_dList_Cons (dtb__5, Base_dList.C_Base_dList_dList_Nil))
  | _ -> (Base_dList.C_Base_dList_dList_Cons (dtb__5, (Base_dList.C_Base_dList_dList_Cons (mc0, ((v_Vuna_dCompiler_dCodegen_dDecl_dinterpose mc0) dtb__6)))))
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCodegen_dDecl_djoinWith = (fun sep xs -> (Base_dList.dtp_concatMany ((v_Vuna_dCompiler_dCodegen_dDecl_dinterpose sep) xs)))

let v_Vuna_dCompiler_dCodegen_dDecl_dtypeParamName = (fun i -> ("'a" ^ (bi_strFromInt i)))

let v_Vuna_dCompiler_dCodegen_dDecl_dtypeParamNames = (fun n -> ((Base_dList.v_Base_dList_dmap v_Vuna_dCompiler_dCodegen_dDecl_dtypeParamName) ((Base_dList.v_Base_dList_drange 0) n)))

let v_Vuna_dCompiler_dCodegen_dDecl_dtypeParamDecl = (fun mc0 -> (if (mc0 = 0) then "" else ((fun nd_uscrut1 -> (match nd_uscrut1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__7, dtb__8) -> (match dtb__8 with
  | Base_dList.C_Base_dList_dList_Nil -> (dtb__7 ^ " ")
  | _ -> (String.concat "" ["("; ((v_Vuna_dCompiler_dCodegen_dDecl_djoinWith ", ") nd_uscrut1); ") "])
)
  | _ -> (String.concat "" ["("; ((v_Vuna_dCompiler_dCodegen_dDecl_djoinWith ", ") nd_uscrut1); ") "])
)) (v_Vuna_dCompiler_dCodegen_dDecl_dtypeParamNames mc0))))

let rec v_Vuna_dCompiler_dCodegen_dDecl_dtypeParamLevelsGo = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__9, dtb__10) -> (if (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_drigIsErased (Base_dPair.v_Base_dPair_dsecondOf dtb__9)) then (Base_dList.C_Base_dList_dList_Cons (mc1, ((v_Vuna_dCompiler_dCodegen_dDecl_dtypeParamLevelsGo dtb__10) (mc1 + 1)))) else ((v_Vuna_dCompiler_dCodegen_dDecl_dtypeParamLevelsGo dtb__10) (mc1 + 1)))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCodegen_dDecl_dtypeParamLevels = (fun d -> ((v_Vuna_dCompiler_dCodegen_dDecl_dtypeParamLevelsGo (d).Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataParams) 0))

let rec v_Vuna_dCompiler_dCodegen_dDecl_dmemInt = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__11, dtb__12) -> (if (dtb__11 = mc0) then true else ((v_Vuna_dCompiler_dCodegen_dDecl_dmemInt mc0) dtb__12))
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dCodegen_dDecl_dlevelSlotGo = (fun mc0 mc1 mc2 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__13, dtb__14) -> (if (dtb__13 = mc1) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (mc2)) else (((v_Vuna_dCompiler_dCodegen_dDecl_dlevelSlotGo dtb__14) mc1) (mc2 + 1)))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCodegen_dDecl_dlevelSlot = (fun levels lvl -> (((v_Vuna_dCompiler_dCodegen_dDecl_dlevelSlotGo levels) lvl) 0))

let rec v_Vuna_dCompiler_dCodegen_dDecl_dnthValue = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__15, dtb__16) -> (if (mc1 <= 0) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__15)) else ((v_Vuna_dCompiler_dCodegen_dDecl_dnthValue dtb__16) (mc1 - 1)))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dCodegen_dDecl_dlookupUsed = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__17, dtb__18) -> (if ((Base_dPair.v_Base_dPair_dfirstOf dtb__17) = mc1) then (Base_dPair.v_Base_dPair_dsecondOf dtb__17) else ((v_Vuna_dCompiler_dCodegen_dDecl_dlookupUsed dtb__18) mc1))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dCodegen_dDecl_dcollectUsedLevelsFuel = (fun fuel tps table datas lvl v -> (if (fuel <= 0) then Base_dList.C_Base_dList_dList_Nil else (match v with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VPi (dtb__19, dtb__20, dtb__21, dtb__22, dtb__23) -> (if dtb__20 then ((((((v_Vuna_dCompiler_dCodegen_dDecl_dcollectUsedLevelsFuel (fuel - 1)) tps) table) datas) (lvl + 1)) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dapplyClosure dtb__23) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NVar (dtb__19, lvl, Base_dList.C_Base_dList_dList_Nil)))))) else ((Base_dList.v_Base_dList_dappend ((((((v_Vuna_dCompiler_dCodegen_dDecl_dcollectUsedLevelsFuel (fuel - 1)) tps) table) datas) lvl) dtb__22)) ((((((v_Vuna_dCompiler_dCodegen_dDecl_dcollectUsedLevelsFuel (fuel - 1)) tps) table) datas) (lvl + 1)) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dapplyClosure dtb__23) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NVar (dtb__19, lvl, Base_dList.C_Base_dList_dList_Nil))))))))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral (dtb__24) -> (match dtb__24 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NVar (dtb__25, dtb__26, dtb__27) -> ((Base_dList.v_Base_dList_dappend (if ((v_Vuna_dCompiler_dCodegen_dDecl_dmemInt dtb__26) tps) then (Base_dList.C_Base_dList_dList_Cons (dtb__26, Base_dList.C_Base_dList_dList_Nil)) else Base_dList.C_Base_dList_dList_Nil)) ((((((v_Vuna_dCompiler_dCodegen_dDecl_dcollectUsedSpineFuel (fuel - 1)) tps) table) datas) lvl) dtb__27))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal (dtb__28, dtb__29) -> (match ((Vuna_dCompiler_dElab_dRepresentation.v_Vuna_dCompiler_dElab_dRepresentation_dfindDtData dtb__28) datas) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__30) -> (((((((v_Vuna_dCompiler_dCodegen_dDecl_dcollectFamilyArgsFuel (fuel - 1)) tps) table) datas) lvl) ((v_Vuna_dCompiler_dCodegen_dDecl_dlookupUsed table) dtb__28)) dtb__29)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((((((v_Vuna_dCompiler_dCodegen_dDecl_dcollectUsedSpineFuel (fuel - 1)) tps) table) datas) lvl) dtb__29)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> Base_dList.C_Base_dList_dList_Nil
)))
and v_Vuna_dCompiler_dCodegen_dDecl_dcollectUsedSpineFuel = (fun mc0 mc1 mc2 mc3 mc4 mc5 -> (match mc5 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__31, dtb__32) -> (if (mc0 <= 0) then Base_dList.C_Base_dList_dList_Nil else ((Base_dList.v_Base_dList_dappend ((((((v_Vuna_dCompiler_dCodegen_dDecl_dcollectUsedLevelsFuel (mc0 - 1)) mc1) mc2) mc3) mc4) dtb__31)) ((((((v_Vuna_dCompiler_dCodegen_dDecl_dcollectUsedSpineFuel (mc0 - 1)) mc1) mc2) mc3) mc4) dtb__32)))
  | Base_dList.C_Base_dList_dList_Nil -> (if (mc0 <= 0) then Base_dList.C_Base_dList_dList_Nil else Base_dList.C_Base_dList_dList_Nil)
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dCodegen_dDecl_dcollectFamilyArgsFuel = (fun fuel tps table datas lvl usedPats args -> (if (fuel <= 0) then Base_dList.C_Base_dList_dList_Nil else (match usedPats with
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | Base_dList.C_Base_dList_dList_Cons (dtb__33, dtb__34) -> (match ((v_Vuna_dCompiler_dCodegen_dDecl_dnthValue args) dtb__33) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__35) -> ((Base_dList.v_Base_dList_dappend ((((((v_Vuna_dCompiler_dCodegen_dDecl_dcollectUsedLevelsFuel (fuel - 1)) tps) table) datas) lvl) dtb__35)) (((((((v_Vuna_dCompiler_dCodegen_dDecl_dcollectFamilyArgsFuel (fuel - 1)) tps) table) datas) lvl) dtb__34) args))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (((((((v_Vuna_dCompiler_dCodegen_dDecl_dcollectFamilyArgsFuel (fuel - 1)) tps) table) datas) lvl) dtb__34) args)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dCodegen_dDecl_dcollectUsedLevels = (fun tps table datas lvl v -> ((((((v_Vuna_dCompiler_dCodegen_dDecl_dcollectUsedLevelsFuel 256) tps) table) datas) lvl) v))

let v_Vuna_dCompiler_dCodegen_dDecl_dcollectFamilyArgs = (fun tps table datas lvl usedPats args -> (((((((v_Vuna_dCompiler_dCodegen_dDecl_dcollectFamilyArgsFuel 256) tps) table) datas) lvl) usedPats) args))

let rec v_Vuna_dCompiler_dCodegen_dDecl_dlevelListEq = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__36, dtb__37) -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__38, dtb__39) -> (if (dtb__36 = dtb__38) then ((v_Vuna_dCompiler_dCodegen_dDecl_dlevelListEq dtb__37) dtb__39) else false)
  | _ -> false
)
  | Base_dList.C_Base_dList_dList_Nil -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Nil -> true
  | _ -> false
)
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dCodegen_dDecl_dsameLevelTable = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__40, dtb__41) -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__42, dtb__43) -> (if (if ((Base_dPair.v_Base_dPair_dfirstOf dtb__40) = (Base_dPair.v_Base_dPair_dfirstOf dtb__42)) then ((v_Vuna_dCompiler_dCodegen_dDecl_dlevelListEq (Base_dPair.v_Base_dPair_dsecondOf dtb__40)) (Base_dPair.v_Base_dPair_dsecondOf dtb__42)) else false) then ((v_Vuna_dCompiler_dCodegen_dDecl_dsameLevelTable dtb__41) dtb__43) else false)
  | _ -> false
)
  | Base_dList.C_Base_dList_dList_Nil -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Nil -> true
  | _ -> false
)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCodegen_dDecl_dfamilyTyText = (fun mc0 mc1 mc2 -> (match mc2 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__44, dtb__45) -> (match dtb__45 with
  | Base_dList.C_Base_dList_dList_Nil -> (String.concat "" [dtb__44; " "; (Base_dPair.v_Base_dPair_dfirstOf ((v_Vuna_dCompiler_dCodegen_dDecl_dqualTypeText mc0) mc1))])
  | _ -> (String.concat "" ["("; ((v_Vuna_dCompiler_dCodegen_dDecl_djoinWith ", ") mc2); ") "; (Base_dPair.v_Base_dPair_dfirstOf ((v_Vuna_dCompiler_dCodegen_dDecl_dqualTypeText mc0) mc1))])
)
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dPair.v_Base_dPair_dfirstOf ((v_Vuna_dCompiler_dCodegen_dDecl_dqualTypeText mc0) mc1))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCodegen_dDecl_drenderTypeIntrinsic = (fun mc0 mc1 -> (if (mc0 = "Array") then (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__46, dtb__47) -> (match dtb__47 with
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((String.concat "" ["("; dtb__46; " array)"])))
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
) else (if (mc0 = "IORef") then (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__48, dtb__49) -> (match dtb__49 with
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((String.concat "" ["("; dtb__48; " ref)"])))
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
) else (if (mc0 = "MArray") then (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__50, dtb__51) -> (match dtb__51 with
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((String.concat "" ["("; dtb__50; " array)"])))
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
) else (if (mc0 = "Buffer") then (match mc1 with
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ("Buffer.t"))
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
) else Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing)))))

let rec v_Vuna_dCompiler_dCodegen_dDecl_drenderFamilyArgsFuel = (fun qc fuel levels table datas usedPats args -> (if (fuel <= 0) then Base_dList.C_Base_dList_dList_Nil else (match usedPats with
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | Base_dList.C_Base_dList_dList_Cons (dtb__52, dtb__53) -> (match ((v_Vuna_dCompiler_dCodegen_dDecl_dnthValue args) dtb__52) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__54) -> (Base_dList.C_Base_dList_dList_Cons (((((((v_Vuna_dCompiler_dCodegen_dDecl_drenderTypeArgFuel qc) (fuel - 1)) levels) table) datas) dtb__54), (((((((v_Vuna_dCompiler_dCodegen_dDecl_drenderFamilyArgsFuel qc) (fuel - 1)) levels) table) datas) dtb__53) args)))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (((((((v_Vuna_dCompiler_dCodegen_dDecl_drenderFamilyArgsFuel qc) (fuel - 1)) levels) table) datas) dtb__53) args)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))
and v_Vuna_dCompiler_dCodegen_dDecl_drenderTypeArgFuel = (fun qc fuel levels table datas v -> (if (fuel <= 0) then "Obj.t" else (match v with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral (dtb__55) -> (match dtb__55 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NVar (dtb__56, dtb__57, dtb__58) -> (match ((v_Vuna_dCompiler_dCodegen_dDecl_dlevelSlot levels) dtb__57) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__59) -> (v_Vuna_dCompiler_dCodegen_dDecl_dtypeParamName dtb__59)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> "Obj.t"
  | _ -> failwith "DT: impossible branch"
)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal (dtb__60, dtb__61) -> (((((((v_Vuna_dCompiler_dCodegen_dDecl_drenderTypeArgGlobal qc) fuel) levels) table) datas) dtb__60) dtb__61)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> "Obj.t"
)))
and v_Vuna_dCompiler_dCodegen_dDecl_drenderTypeArgGlobal = (fun qc fuel levels table datas g sp -> (match ((v_Vuna_dCompiler_dCodegen_dDecl_drenderTypeIntrinsic g) ((Base_dList.v_Base_dList_dmap (fun x -> ((((((v_Vuna_dCompiler_dCodegen_dDecl_drenderTypeArgFuel qc) (fuel - 1)) levels) table) datas) x))) sp)) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__62) -> dtb__62
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (if (g = Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dintTypeName) then "int" else (if (g = Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dnatTypeName) then "int" else (if (g = Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dstrTypeName) then "string" else (if (g = Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dfloatTypeName) then "float" else (if (g = Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dboolTypeName) then "bool" else (match ((Vuna_dCompiler_dElab_dRepresentation.v_Vuna_dCompiler_dElab_dRepresentation_dfindDtData g) datas) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__63) -> (((v_Vuna_dCompiler_dCodegen_dDecl_dfamilyTyText qc) g) (((((((v_Vuna_dCompiler_dCodegen_dDecl_drenderFamilyArgsFuel qc) (fuel - 1)) levels) table) datas) ((v_Vuna_dCompiler_dCodegen_dDecl_dlookupUsed table) g)) sp))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> "Obj.t"
  | _ -> failwith "DT: impossible branch"
))))))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCodegen_dDecl_drenderFamilyArgs = (fun qc levels table datas usedPats args -> (((((((v_Vuna_dCompiler_dCodegen_dDecl_drenderFamilyArgsFuel qc) 256) levels) table) datas) usedPats) args))

let v_Vuna_dCompiler_dCodegen_dDecl_drenderTypeArg = (fun qc levels table datas v -> ((((((v_Vuna_dCompiler_dCodegen_dDecl_drenderTypeArgFuel qc) 256) levels) table) datas) v))

let rec v_Vuna_dCompiler_dCodegen_dDecl_drenderPiTyFuel = (fun qc fuel levels table datas lvl v -> (if (fuel <= 0) then (((((v_Vuna_dCompiler_dCodegen_dDecl_drenderTypeArg qc) levels) table) datas) v) else (match v with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VPi (dtb__64, dtb__65, dtb__66, dtb__67, dtb__68) -> ((fun next -> (if (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_drigIsErased dtb__66) then (((((((v_Vuna_dCompiler_dCodegen_dDecl_drenderPiTyFuel qc) (fuel - 1)) levels) table) datas) (lvl + 1)) next) else (String.concat "" ["("; (((((((v_Vuna_dCompiler_dCodegen_dDecl_drenderPiTyFuel qc) (fuel - 1)) levels) table) datas) lvl) dtb__67); ") -> "; (((((((v_Vuna_dCompiler_dCodegen_dDecl_drenderPiTyFuel qc) (fuel - 1)) levels) table) datas) (lvl + 1)) next)]))) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dapplyClosure dtb__68) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NVar (dtb__64, lvl, Base_dList.C_Base_dList_dList_Nil))))))
  | _ -> (((((v_Vuna_dCompiler_dCodegen_dDecl_drenderTypeArg qc) levels) table) datas) v)
)))

let v_Vuna_dCompiler_dCodegen_dDecl_drenderPiTy = (fun qc levels table datas lvl v -> (((((((v_Vuna_dCompiler_dCodegen_dDecl_drenderPiTyFuel qc) 256) levels) table) datas) lvl) v))

let v_Vuna_dCompiler_dCodegen_dDecl_drenderFieldTy = (fun mc0 mc1 mc2 mc3 mc4 mc5 mc6 -> (match mc5 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral (dtb__69) -> (match dtb__69 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NVar (dtb__70, dtb__71, dtb__72) -> (match ((v_Vuna_dCompiler_dCodegen_dDecl_dlevelSlot mc1) dtb__71) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__73) -> { Base_dPair.f_Base_dPair_dPair_first = (v_Vuna_dCompiler_dCodegen_dDecl_dtypeParamName dtb__73); Base_dPair.f_Base_dPair_dPair_second = mc6 }
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> { Base_dPair.f_Base_dPair_dPair_first = (v_Vuna_dCompiler_dCodegen_dDecl_dtypeParamName mc6); Base_dPair.f_Base_dPair_dPair_second = (mc6 + 1) }
  | _ -> failwith "DT: impossible branch"
)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal (dtb__74, dtb__75) -> (match ((v_Vuna_dCompiler_dCodegen_dDecl_drenderTypeIntrinsic dtb__74) ((Base_dList.v_Base_dList_dmap (fun x -> (((((v_Vuna_dCompiler_dCodegen_dDecl_drenderTypeArg mc0) mc1) mc2) mc3) x))) dtb__75)) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__76) -> { Base_dPair.f_Base_dPair_dPair_first = dtb__76; Base_dPair.f_Base_dPair_dPair_second = mc6 }
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (if (dtb__74 = Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dintTypeName) then { Base_dPair.f_Base_dPair_dPair_first = "int"; Base_dPair.f_Base_dPair_dPair_second = mc6 } else (if (dtb__74 = Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dnatTypeName) then { Base_dPair.f_Base_dPair_dPair_first = "int"; Base_dPair.f_Base_dPair_dPair_second = mc6 } else (if (dtb__74 = Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dstrTypeName) then { Base_dPair.f_Base_dPair_dPair_first = "string"; Base_dPair.f_Base_dPair_dPair_second = mc6 } else (if (dtb__74 = Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dfloatTypeName) then { Base_dPair.f_Base_dPair_dPair_first = "float"; Base_dPair.f_Base_dPair_dPair_second = mc6 } else (if (dtb__74 = Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dboolTypeName) then { Base_dPair.f_Base_dPair_dPair_first = "bool"; Base_dPair.f_Base_dPair_dPair_second = mc6 } else (match ((Vuna_dCompiler_dElab_dRepresentation.v_Vuna_dCompiler_dElab_dRepresentation_dfindDtData dtb__74) mc3) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__77) -> { Base_dPair.f_Base_dPair_dPair_first = (((v_Vuna_dCompiler_dCodegen_dDecl_dfamilyTyText mc0) dtb__74) ((((((v_Vuna_dCompiler_dCodegen_dDecl_drenderFamilyArgs mc0) mc1) mc2) mc3) ((v_Vuna_dCompiler_dCodegen_dDecl_dlookupUsed mc2) dtb__74)) dtb__75)); Base_dPair.f_Base_dPair_dPair_second = mc6 }
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> { Base_dPair.f_Base_dPair_dPair_first = (v_Vuna_dCompiler_dCodegen_dDecl_dtypeParamName mc6); Base_dPair.f_Base_dPair_dPair_second = (mc6 + 1) }
  | _ -> failwith "DT: impossible branch"
))))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VPi (dtb__78, dtb__79, dtb__80, dtb__81, dtb__82) -> (if dtb__79 then { Base_dPair.f_Base_dPair_dPair_first = (v_Vuna_dCompiler_dCodegen_dDecl_dtypeParamName mc6); Base_dPair.f_Base_dPair_dPair_second = (mc6 + 1) } else { Base_dPair.f_Base_dPair_dPair_first = ((((((v_Vuna_dCompiler_dCodegen_dDecl_drenderPiTy mc0) mc1) mc2) mc3) mc4) mc5); Base_dPair.f_Base_dPair_dPair_second = mc6 })
  | _ -> { Base_dPair.f_Base_dPair_dPair_first = (v_Vuna_dCompiler_dCodegen_dDecl_dtypeParamName mc6); Base_dPair.f_Base_dPair_dPair_second = (mc6 + 1) }
))

let v_Vuna_dCompiler_dCodegen_dDecl_dflagMatchesRig = (fun mc0 mc1 -> (if mc0 then (Base_dBool.v_Base_dBool_dnot (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_drigIsErased mc1)) else (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_drigIsErased mc1)))

let rec v_Vuna_dCompiler_dCodegen_dDecl_dctorShapeOf = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__83, dtb__84) -> ((Base_dList.v_Base_dList_dappend ((Base_dList.v_Base_dList_dmap (fun c -> { Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorName c); Base_dPair.f_Base_dPair_dPair_second = (Vuna_dCompiler_dElab_dRepresentation.v_Vuna_dCompiler_dElab_dRepresentation_dctorKeepFlags c) })) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataCtors dtb__83))) (v_Vuna_dCompiler_dCodegen_dDecl_dctorShapeOf dtb__84))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCodegen_dDecl_disTypeHeadOpaqueDatas = (fun datas name -> (if (name = Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dboolTypeName) then false else (if (name = Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dnatTypeName) then false else (match ((Vuna_dCompiler_dElab_dRepresentation.v_Vuna_dCompiler_dElab_dRepresentation_dfindDtData name) datas) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__85) -> false
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (Base_dBool.v_Base_dBool_dnot (Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_disTypeConstructorName name))
  | _ -> failwith "DT: impossible branch"
))))

let rec v_Vuna_dCompiler_dCodegen_dDecl_dmemOpaqueLevel = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__86, dtb__87) -> (if (dtb__86 = mc0) then true else ((v_Vuna_dCompiler_dCodegen_dDecl_dmemOpaqueLevel mc0) dtb__87))
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dCodegen_dDecl_dctorUsedLevels = (fun mc0 mc1 mc2 mc3 mc4 mc5 mc6 -> (match mc4 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__88, dtb__89) -> (match dtb__88 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__90; Base_dPair.f_Base_dPair_dPair_second = dtb__91 } -> (match mc6 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VPi (dtb__92, dtb__93, dtb__94, dtb__95, dtb__96) -> ((fun isOpq -> ((fun fam2 -> ((fun next -> (if (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_drigIsErased dtb__91) then (((((((v_Vuna_dCompiler_dCodegen_dDecl_dctorUsedLevels mc0) mc1) mc2) fam2) dtb__89) (mc5 + 1)) next) else (if isOpq then (((((((v_Vuna_dCompiler_dCodegen_dDecl_dctorUsedLevels mc0) mc1) mc2) fam2) dtb__89) (mc5 + 1)) next) else ((Base_dList.v_Base_dList_dappend (((((v_Vuna_dCompiler_dCodegen_dDecl_dcollectUsedLevels mc0) mc1) mc2) mc5) dtb__95)) (((((((v_Vuna_dCompiler_dCodegen_dDecl_dctorUsedLevels mc0) mc1) mc2) fam2) dtb__89) (mc5 + 1)) next))))) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dapplyClosure dtb__96) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NVar (dtb__92, mc5, Base_dList.C_Base_dList_dList_Nil))))))) (if (Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_disFamilyKindValue dtb__95) then (Base_dList.C_Base_dList_dList_Cons (mc5, mc3)) else mc3))) (((((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dvalueOpaqueScoped (fun l -> ((v_Vuna_dCompiler_dCodegen_dDecl_dmemOpaqueLevel l) mc3))) (v_Vuna_dCompiler_dCodegen_dDecl_disTypeHeadOpaqueDatas mc2)) mc5) mc3) dtb__95))
  | _ -> Base_dList.C_Base_dList_dList_Nil
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCodegen_dDecl_ddataUsedLevels = (fun d table datas -> ((fun raw -> ((Base_dList.v_Base_dList_dfilter (fun l -> ((v_Vuna_dCompiler_dCodegen_dDecl_dmemInt l) raw))) (v_Vuna_dCompiler_dCodegen_dDecl_dtypeParamLevels d))) ((Base_dList.v_Base_dList_dconcatMap (fun c -> (((((((v_Vuna_dCompiler_dCodegen_dDecl_dctorUsedLevels (v_Vuna_dCompiler_dCodegen_dDecl_dtypeParamLevels d)) table) datas) Base_dList.C_Base_dList_dList_Nil) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorTelescope c)) 0) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_deval Base_dList.C_Base_dList_dList_Nil) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorType c))))) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataCtors d))))

let rec v_Vuna_dCompiler_dCodegen_dDecl_dusedTableFixFuel = (fun fuel datas table -> (if (fuel <= 0) then table else ((fun next -> (if ((v_Vuna_dCompiler_dCodegen_dDecl_dsameLevelTable next) table) then next else (((v_Vuna_dCompiler_dCodegen_dDecl_dusedTableFixFuel (fuel - 1)) datas) next))) ((Base_dList.v_Base_dList_dmap (fun d -> { Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataName d); Base_dPair.f_Base_dPair_dPair_second = (((v_Vuna_dCompiler_dCodegen_dDecl_ddataUsedLevels d) table) datas) })) datas))))

let v_Vuna_dCompiler_dCodegen_dDecl_dusedTableFix = (fun datas table -> (((v_Vuna_dCompiler_dCodegen_dDecl_dusedTableFixFuel 64) datas) table))

let rec v_Vuna_dCompiler_dCodegen_dDecl_dctorOpaqueGo = (fun mc0 mc1 mc2 mc3 mc4 mc5 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__97, dtb__98) -> (match dtb__97 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__99; Base_dPair.f_Base_dPair_dPair_second = dtb__100 } -> (match mc3 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VPi (dtb__101, dtb__102, dtb__103, dtb__104, dtb__105) -> ((fun flag -> ((fun fam2 -> ((fun next -> ((((((v_Vuna_dCompiler_dCodegen_dDecl_dctorOpaqueGo mc0) dtb__98) (mc2 + 1)) next) fam2) (Base_dList.C_Base_dList_dList_Cons (flag, mc5)))) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dapplyClosure dtb__105) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NVar (dtb__101, mc2, Base_dList.C_Base_dList_dList_Nil))))))) (if (Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_disFamilyKindValue dtb__104) then (Base_dList.C_Base_dList_dList_Cons (mc2, mc4)) else mc4))) (if (Base_dBool.v_Base_dBool_dnot (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_drigIsErased dtb__100)) then (((((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dvalueOpaqueScoped (fun l -> ((v_Vuna_dCompiler_dCodegen_dDecl_dmemOpaqueLevel l) mc4))) (v_Vuna_dCompiler_dCodegen_dDecl_disTypeHeadOpaqueDatas mc0)) mc2) mc4) dtb__104) else false))
  | _ -> (Base_dList.v_Base_dList_dreverse mc5)
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dList.v_Base_dList_dreverse mc5)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCodegen_dDecl_dctorOpaqueFlagsOf = (fun datas c -> ((((((v_Vuna_dCompiler_dCodegen_dDecl_dctorOpaqueGo datas) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorTelescope c)) 0) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_deval Base_dList.C_Base_dList_dList_Nil) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorType c))) Base_dList.C_Base_dList_dList_Nil) Base_dList.C_Base_dList_dList_Nil))

let v_Vuna_dCompiler_dCodegen_dDecl_dctorOpaqueTableOf = (fun datas -> ((Base_dList.v_Base_dList_dconcatMap (fun d -> ((Base_dList.v_Base_dList_dmap (fun c -> { Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorName c); Base_dPair.f_Base_dPair_dPair_second = ((v_Vuna_dCompiler_dCodegen_dDecl_dctorOpaqueFlagsOf datas) c) })) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataCtors d)))) datas))

let rec v_Vuna_dCompiler_dCodegen_dDecl_dctorOpaqueKeptFlags = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__106, dtb__107) -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__108, dtb__109) -> (if dtb__106 then (Base_dList.C_Base_dList_dList_Cons (dtb__108, ((v_Vuna_dCompiler_dCodegen_dDecl_dctorOpaqueKeptFlags dtb__107) dtb__109))) else ((v_Vuna_dCompiler_dCodegen_dDecl_dctorOpaqueKeptFlags dtb__107) dtb__109))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> Base_dList.C_Base_dList_dList_Nil
)
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dCodegen_dDecl_dctorFieldTexts = (fun mc0 mc1 mc2 mc3 mc4 mc5 mc6 mc7 mc8 mc9 -> (match mc4 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__110, dtb__111) -> (match mc5 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__112, dtb__113) -> (match mc6 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__114, dtb__115) -> (match dtb__114 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__116; Base_dPair.f_Base_dPair_dPair_second = dtb__117 } -> (if ((v_Vuna_dCompiler_dCodegen_dDecl_dflagMatchesRig dtb__110) dtb__117) then (match mc8 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VPi (dtb__118, dtb__119, dtb__120, dtb__121, dtb__122) -> ((fun next -> (if dtb__110 then (if dtb__112 then ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((((((((v_Vuna_dCompiler_dCodegen_dDecl_dctorFieldTexts mc0) mc1) mc2) mc3) dtb__111) dtb__113) dtb__115) (mc7 + 1)) next) mc9)) (fun p -> (match p with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__123; Base_dPair.f_Base_dPair_dPair_second = dtb__124 } -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (Base_dList.C_Base_dList_dList_Cons ("Obj.t", dtb__123)); Base_dPair.f_Base_dPair_dPair_second = dtb__124 }))
  | _ -> failwith "DT: impossible branch"
))) else (match (((((((v_Vuna_dCompiler_dCodegen_dDecl_drenderFieldTy mc0) mc1) mc2) mc3) mc7) dtb__121) mc9) with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__125; Base_dPair.f_Base_dPair_dPair_second = dtb__126 } -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((((((((v_Vuna_dCompiler_dCodegen_dDecl_dctorFieldTexts mc0) mc1) mc2) mc3) dtb__111) dtb__113) dtb__115) (mc7 + 1)) next) dtb__126)) (fun p -> (match p with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__127; Base_dPair.f_Base_dPair_dPair_second = dtb__128 } -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (Base_dList.C_Base_dList_dList_Cons (dtb__125, dtb__127)); Base_dPair.f_Base_dPair_dPair_second = dtb__128 }))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)) else ((((((((((v_Vuna_dCompiler_dCodegen_dDecl_dctorFieldTexts mc0) mc1) mc2) mc3) dtb__111) dtb__113) dtb__115) (mc7 + 1)) next) mc9))) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dapplyClosure dtb__122) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NVar (dtb__118, mc7, Base_dList.C_Base_dList_dList_Nil))))))
  | _ -> (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicInternal "constructor telescope does not match its type")
) else (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicInternal "constructor keep flag disagrees with telescope rig"))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = Base_dList.C_Base_dList_dList_Nil; Base_dPair.f_Base_dPair_dPair_second = mc9 }))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> (match mc6 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__129, dtb__130) -> (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicInternal "constructor opaque flags shorter than its shape")
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = Base_dList.C_Base_dList_dList_Nil; Base_dPair.f_Base_dPair_dPair_second = mc9 }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> (match mc5 with
  | Base_dList.C_Base_dList_dList_Nil -> (match mc6 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__131, dtb__132) -> (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicInternal "constructor shape has more binders than its telescope")
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = Base_dList.C_Base_dList_dList_Nil; Base_dPair.f_Base_dPair_dPair_second = mc9 }))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Cons (dtb__133, dtb__134) -> (match mc6 with
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = Base_dList.C_Base_dList_dList_Nil; Base_dPair.f_Base_dPair_dPair_second = mc9 }))
  | _ -> (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicInternal "constructor opaque flags longer than its shape")
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCodegen_dDecl_dctorArityNeed = (fun qc levels table datas c -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((((((((v_Vuna_dCompiler_dCodegen_dDecl_dctorFieldTexts qc) levels) table) datas) (Vuna_dCompiler_dElab_dRepresentation.v_Vuna_dCompiler_dElab_dRepresentation_dctorKeepFlags c)) ((v_Vuna_dCompiler_dCodegen_dDecl_dctorOpaqueFlagsOf datas) c)) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorTelescope c)) 0) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_deval Base_dList.C_Base_dList_dList_Nil) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorType c))) (Base_dList.v_Base_dList_dlength levels))) (fun p -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (((Base_dPair.v_Base_dPair_dsecondOf p) - (Base_dList.v_Base_dList_dlength levels)))))))

let rec v_Vuna_dCompiler_dCodegen_dDecl_dmaxIntList = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__135, dtb__136) -> (if (dtb__135 >= (v_Vuna_dCompiler_dCodegen_dDecl_dmaxIntList dtb__136)) then dtb__135 else (v_Vuna_dCompiler_dCodegen_dDecl_dmaxIntList dtb__136))
  | Base_dList.C_Base_dList_dList_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCodegen_dDecl_ddataArityNeed = (fun qc levels table datas ctors -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dtraverse ((((v_Vuna_dCompiler_dCodegen_dDecl_dctorArityNeed qc) levels) table) datas)) ctors)) (fun ns -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (((Base_dList.v_Base_dList_dlength levels) + (v_Vuna_dCompiler_dCodegen_dDecl_dmaxIntList ns)))))))

let v_Vuna_dCompiler_dCodegen_dDecl_dparenOne = (fun t -> (String.concat "" ["("; t; ")"]))

let rec v_Vuna_dCompiler_dCodegen_dDecl_dparenList = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__137, dtb__138) -> ((Base_dList.v_Base_dList_dappend (Base_dList.C_Base_dList_dList_Cons ((v_Vuna_dCompiler_dCodegen_dDecl_dparenOne dtb__137), Base_dList.C_Base_dList_dList_Nil))) (v_Vuna_dCompiler_dCodegen_dDecl_dparenList dtb__138))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCodegen_dDecl_dctorDeclText = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__139, dtb__140) -> (match dtb__140 with
  | Base_dList.C_Base_dList_dList_Nil -> (String.concat "" [mc0; " of "; (v_Vuna_dCompiler_dCodegen_dDecl_dparenOne dtb__139)])
  | _ -> (String.concat "" [mc0; " of "; ((v_Vuna_dCompiler_dCodegen_dDecl_djoinWith " * ") (v_Vuna_dCompiler_dCodegen_dDecl_dparenList mc1))])
)
  | Base_dList.C_Base_dList_dList_Nil -> mc0
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCodegen_dDecl_dgenCtorDecl = (fun qc levels table datas c -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((((((((v_Vuna_dCompiler_dCodegen_dDecl_dctorFieldTexts qc) levels) table) datas) (Vuna_dCompiler_dElab_dRepresentation.v_Vuna_dCompiler_dElab_dRepresentation_dctorKeepFlags c)) ((v_Vuna_dCompiler_dCodegen_dDecl_dctorOpaqueFlagsOf datas) c)) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorTelescope c)) 0) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_deval Base_dList.C_Base_dList_dList_Nil) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorType c))) (Base_dList.v_Base_dList_dlength levels))) (fun p -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (((v_Vuna_dCompiler_dCodegen_dDecl_dctorDeclText ((v_Vuna_dCompiler_dCodegen_dDecl_dctorOcamlName (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorFamily c)) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorName c))) (Base_dPair.v_Base_dPair_dfirstOf p)))))))

let v_Vuna_dCompiler_dCodegen_dDecl_disRecordData = (fun d -> (if (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataIsRecord d) then ((fun nd_uscrut1 -> (match nd_uscrut1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__141, dtb__142) -> (match dtb__142 with
  | Base_dList.C_Base_dList_dList_Nil -> true
  | _ -> false
)
  | _ -> false
)) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataCtors d)) else false))

let v_Vuna_dCompiler_dCodegen_dDecl_drecordFieldLabel = (fun family field -> (String.concat "" ["f_"; (v_Vuna_dCompiler_dCodegen_dDecl_dsanitizeName family); "_"; (v_Vuna_dCompiler_dCodegen_dDecl_dsanitizeName field)]))

let rec v_Vuna_dCompiler_dCodegen_dDecl_drecordRtFieldsGo = (fun mc0 mc1 mc2 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__143, dtb__144) -> (match mc2 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__145, dtb__146) -> (if dtb__143 then (Base_dList.C_Base_dList_dList_Cons ({ Base_dPair.f_Base_dPair_dPair_first = (dtb__145).Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtFieldMeta_dtFieldIndex; Base_dPair.f_Base_dPair_dPair_second = ((v_Vuna_dCompiler_dCodegen_dDecl_drecordFieldLabel mc0) (dtb__145).Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtFieldMeta_dtFieldName) }, (((v_Vuna_dCompiler_dCodegen_dDecl_drecordRtFieldsGo mc0) dtb__144) dtb__146))) else (((v_Vuna_dCompiler_dCodegen_dDecl_drecordRtFieldsGo mc0) dtb__144) dtb__146))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCodegen_dDecl_drecordRtFields = (fun d -> ((fun nd_uscrut1 -> (match nd_uscrut1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__147, dtb__148) -> (match dtb__148 with
  | Base_dList.C_Base_dList_dList_Nil -> ((fun arity -> (((v_Vuna_dCompiler_dCodegen_dDecl_drecordRtFieldsGo (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataName d)) ((Base_dList.v_Base_dList_ddrop arity) (Vuna_dCompiler_dElab_dRepresentation.v_Vuna_dCompiler_dElab_dRepresentation_dctorKeepFlags dtb__147))) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataFields d))) (Base_dList.v_Base_dList_dlength (d).Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataParams))
  | _ -> Base_dList.C_Base_dList_dList_Nil
)
  | _ -> Base_dList.C_Base_dList_dList_Nil
)) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataCtors d)))

let v_Vuna_dCompiler_dCodegen_dDecl_dhasRecordRepr = (fun d -> (if (v_Vuna_dCompiler_dCodegen_dDecl_disRecordData d) then (match (v_Vuna_dCompiler_dCodegen_dDecl_drecordRtFields d) with
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> true
) else false))

let rec v_Vuna_dCompiler_dCodegen_dDecl_drecordFieldDecls = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__149, dtb__150) -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__151, dtb__152) -> (Base_dList.C_Base_dList_dList_Cons ((String.concat "" [(Base_dPair.v_Base_dPair_dsecondOf dtb__149); " : "; dtb__151]), ((v_Vuna_dCompiler_dCodegen_dDecl_drecordFieldDecls dtb__150) dtb__152)))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> Base_dList.C_Base_dList_dList_Nil
)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCodegen_dDecl_dgenRecordDecl = (fun qc levels table datas d -> ((fun nd_uscrut5 -> (match nd_uscrut5 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__153, dtb__154) -> (match dtb__154 with
  | Base_dList.C_Base_dList_dList_Nil -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((((((((v_Vuna_dCompiler_dCodegen_dDecl_dctorFieldTexts qc) levels) table) datas) (Vuna_dCompiler_dElab_dRepresentation.v_Vuna_dCompiler_dElab_dRepresentation_dctorKeepFlags dtb__153)) ((v_Vuna_dCompiler_dCodegen_dDecl_dctorOpaqueFlagsOf datas) dtb__153)) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorTelescope dtb__153)) 0) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_deval Base_dList.C_Base_dList_dList_Nil) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorType dtb__153))) (Base_dList.v_Base_dList_dlength levels))) (fun p -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ((String.concat "" [(v_Vuna_dCompiler_dCodegen_dDecl_dtypeParamDecl (Base_dPair.v_Base_dPair_dsecondOf p)); (v_Vuna_dCompiler_dCodegen_dDecl_dtypeName (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataName d)); " = { "; ((v_Vuna_dCompiler_dCodegen_dDecl_djoinWith "; ") ((v_Vuna_dCompiler_dCodegen_dDecl_drecordFieldDecls (v_Vuna_dCompiler_dCodegen_dDecl_drecordRtFields d)) (Base_dPair.v_Base_dPair_dfirstOf p))); " }"])))))
  | _ -> (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicInternal ("record family must have exactly one constructor: " ^ (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataName d)))
)
  | _ -> (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicInternal ("record family must have exactly one constructor: " ^ (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataName d)))
)) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataCtors d)))

let v_Vuna_dCompiler_dCodegen_dDecl_dgenUnboxedDataDecl = (fun qc levels table datas d c idx -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((((((((v_Vuna_dCompiler_dCodegen_dDecl_dctorFieldTexts qc) levels) table) datas) (Vuna_dCompiler_dElab_dRepresentation.v_Vuna_dCompiler_dElab_dRepresentation_dctorKeepFlags c)) ((v_Vuna_dCompiler_dCodegen_dDecl_dctorOpaqueFlagsOf datas) c)) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorTelescope c)) 0) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_deval Base_dList.C_Base_dList_dList_Nil) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorType c))) (Base_dList.v_Base_dList_dlength levels))) (fun p -> (match (Base_dPair.v_Base_dPair_dfirstOf p) with
  | Base_dList.C_Base_dList_dList_Cons (dtb__155, dtb__156) -> (match dtb__156 with
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ((String.concat "" [(v_Vuna_dCompiler_dCodegen_dDecl_dtypeParamDecl (Base_dPair.v_Base_dPair_dsecondOf p)); (v_Vuna_dCompiler_dCodegen_dDecl_dtypeName (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataName d)); " = "; dtb__155])))
  | _ -> (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicInternal ("unboxed constructor has more than one kept field: " ^ (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorName c)))
)
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicInternal ("unboxed constructor has no kept field: " ^ (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorName c)))
  | _ -> failwith "DT: impossible branch"
))))

let v_Vuna_dCompiler_dCodegen_dDecl_dctorBodyText = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Nil -> "|"
  | _ -> ((v_Vuna_dCompiler_dCodegen_dDecl_djoinWith " | ") mc0)
))

let v_Vuna_dCompiler_dCodegen_dDecl_dgenDataDecl = (fun qc table datas unboxed d -> ((fun levels -> ((fun nd_uscrut6 -> (match nd_uscrut6 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (if (v_Vuna_dCompiler_dCodegen_dDecl_dhasRecordRepr d) then (((((v_Vuna_dCompiler_dCodegen_dDecl_dgenRecordDecl qc) levels) table) datas) d) else ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((((v_Vuna_dCompiler_dCodegen_dDecl_ddataArityNeed qc) levels) table) datas) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataCtors d))) (fun arity -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dtraverse ((((v_Vuna_dCompiler_dCodegen_dDecl_dgenCtorDecl qc) levels) table) datas)) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataCtors d))) (fun cs -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ((String.concat "" [(v_Vuna_dCompiler_dCodegen_dDecl_dtypeParamDecl arity); (v_Vuna_dCompiler_dCodegen_dDecl_dtypeName (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataName d)); " = "; (v_Vuna_dCompiler_dCodegen_dDecl_dctorBodyText cs)]))))))))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__157) -> (match dtb__157 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__158; Base_dPair.f_Base_dPair_dPair_second = dtb__159 } -> (((((((v_Vuna_dCompiler_dCodegen_dDecl_dgenUnboxedDataDecl qc) levels) table) datas) d) dtb__158) dtb__159)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) ((Vuna_dCompiler_dElab_dRepresentation.v_Vuna_dCompiler_dElab_dRepresentation_dlookupUnboxedInfo (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataName d)) unboxed))) ((v_Vuna_dCompiler_dCodegen_dDecl_dlookupUsed table) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataName d))))

let v_Vuna_dCompiler_dCodegen_dDecl_disBoolFamilyName = (fun name -> (name = Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dboolTypeName))

let v_Vuna_dCompiler_dCodegen_dDecl_disNatFamilyName = (fun name -> (name = Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dnatTypeName))

let v_Vuna_dCompiler_dCodegen_dDecl_druntimeDatas = (fun datas -> ((Base_dList.v_Base_dList_dfilter (fun d -> (if (Base_dBool.v_Base_dBool_dnot (v_Vuna_dCompiler_dCodegen_dDecl_disBoolFamilyName (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataName d))) then (Base_dBool.v_Base_dBool_dnot (v_Vuna_dCompiler_dCodegen_dDecl_disNatFamilyName (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataName d))) else false))) datas))

let v_Vuna_dCompiler_dCodegen_dDecl_dusedTableOf = (fun datas -> ((v_Vuna_dCompiler_dCodegen_dDecl_dusedTableFix datas) ((Base_dList.v_Base_dList_dmap (fun d -> { Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataName d); Base_dPair.f_Base_dPair_dPair_second = Base_dList.C_Base_dList_dList_Nil })) datas)))

let v_Vuna_dCompiler_dCodegen_dDecl_dgenTypeDeclsWith = (fun mc0 mc1 mc2 mc3 -> (match mc3 with
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (""))
  | _ -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dtraverse ((((v_Vuna_dCompiler_dCodegen_dDecl_dgenDataDecl mc0) mc1) mc2) (Vuna_dCompiler_dElab_dRepresentation.v_Vuna_dCompiler_dElab_dRepresentation_dunboxedInfoOf mc2))) mc3)) (fun parts -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ((String.concat "" ["type "; ((v_Vuna_dCompiler_dCodegen_dDecl_djoinWith "\nand ") parts); "\n\n"])))))
))

let v_Vuna_dCompiler_dCodegen_dDecl_dgenTypeDeclsOf = (fun qc allDatas subset -> ((((v_Vuna_dCompiler_dCodegen_dDecl_dgenTypeDeclsWith qc) (v_Vuna_dCompiler_dCodegen_dDecl_dusedTableOf allDatas)) allDatas) subset))

let v_Vuna_dCompiler_dCodegen_dDecl_dcollectUsedSpine = (fun a1 a2 a3 a4 a5 -> ((((((v_Vuna_dCompiler_dCodegen_dDecl_dcollectUsedSpineFuel 512) a1) a2) a3) a4) a5))
