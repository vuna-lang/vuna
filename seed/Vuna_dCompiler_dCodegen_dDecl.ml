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
) else (if (mc0 = "IO") then (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__52, dtb__53) -> (match dtb__53 with
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((String.concat "" ["(int -> "; dtb__52; ")"])))
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
) else Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing))))))

let rec v_Vuna_dCompiler_dCodegen_dDecl_drenderFamilyArgsFuel = (fun qc fuel levels table datas usedPats args -> (if (fuel <= 0) then Base_dList.C_Base_dList_dList_Nil else (match usedPats with
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | Base_dList.C_Base_dList_dList_Cons (dtb__54, dtb__55) -> (match ((v_Vuna_dCompiler_dCodegen_dDecl_dnthValue args) dtb__54) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__56) -> (Base_dList.C_Base_dList_dList_Cons (((((((v_Vuna_dCompiler_dCodegen_dDecl_drenderTypeArgFuel qc) (fuel - 1)) levels) table) datas) dtb__56), (((((((v_Vuna_dCompiler_dCodegen_dDecl_drenderFamilyArgsFuel qc) (fuel - 1)) levels) table) datas) dtb__55) args)))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (((((((v_Vuna_dCompiler_dCodegen_dDecl_drenderFamilyArgsFuel qc) (fuel - 1)) levels) table) datas) dtb__55) args)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))
and v_Vuna_dCompiler_dCodegen_dDecl_drenderTypeArgFuel = (fun qc fuel levels table datas v -> (if (fuel <= 0) then "Obj.t" else (match v with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral (dtb__57) -> (match dtb__57 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NVar (dtb__58, dtb__59, dtb__60) -> (match ((v_Vuna_dCompiler_dCodegen_dDecl_dlevelSlot levels) dtb__59) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__61) -> (v_Vuna_dCompiler_dCodegen_dDecl_dtypeParamName dtb__61)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> "Obj.t"
  | _ -> failwith "DT: impossible branch"
)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal (dtb__62, dtb__63) -> (((((((v_Vuna_dCompiler_dCodegen_dDecl_drenderTypeArgGlobal qc) fuel) levels) table) datas) dtb__62) dtb__63)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> "Obj.t"
)))
and v_Vuna_dCompiler_dCodegen_dDecl_drenderTypeArgGlobal = (fun qc fuel levels table datas g sp -> (match ((v_Vuna_dCompiler_dCodegen_dDecl_drenderTypeIntrinsic g) ((Base_dList.v_Base_dList_dmap (fun x -> ((((((v_Vuna_dCompiler_dCodegen_dDecl_drenderTypeArgFuel qc) (fuel - 1)) levels) table) datas) x))) sp)) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__64) -> dtb__64
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (if (g = Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dintTypeName) then "int" else (if (g = Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dnatTypeName) then "int" else (if (g = Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dstrTypeName) then "string" else (if (g = Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dfloatTypeName) then "float" else (if (g = Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dboolTypeName) then "bool" else (match ((Vuna_dCompiler_dElab_dRepresentation.v_Vuna_dCompiler_dElab_dRepresentation_dfindDtData g) datas) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__65) -> (((v_Vuna_dCompiler_dCodegen_dDecl_dfamilyTyText qc) g) (((((((v_Vuna_dCompiler_dCodegen_dDecl_drenderFamilyArgsFuel qc) (fuel - 1)) levels) table) datas) ((v_Vuna_dCompiler_dCodegen_dDecl_dlookupUsed table) g)) sp))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> "Obj.t"
  | _ -> failwith "DT: impossible branch"
))))))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCodegen_dDecl_drenderFamilyArgs = (fun qc levels table datas usedPats args -> (((((((v_Vuna_dCompiler_dCodegen_dDecl_drenderFamilyArgsFuel qc) 256) levels) table) datas) usedPats) args))

let v_Vuna_dCompiler_dCodegen_dDecl_drenderTypeArg = (fun qc levels table datas v -> ((((((v_Vuna_dCompiler_dCodegen_dDecl_drenderTypeArgFuel qc) 256) levels) table) datas) v))

let rec v_Vuna_dCompiler_dCodegen_dDecl_drenderPiTyFuel = (fun qc fuel levels table datas lvl v -> (if (fuel <= 0) then (((((v_Vuna_dCompiler_dCodegen_dDecl_drenderTypeArg qc) levels) table) datas) v) else (match v with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VPi (dtb__66, dtb__67, dtb__68, dtb__69, dtb__70) -> ((fun next -> (if (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_drigIsErased dtb__68) then (((((((v_Vuna_dCompiler_dCodegen_dDecl_drenderPiTyFuel qc) (fuel - 1)) levels) table) datas) (lvl + 1)) next) else (String.concat "" ["("; (((((((v_Vuna_dCompiler_dCodegen_dDecl_drenderPiTyFuel qc) (fuel - 1)) levels) table) datas) lvl) dtb__69); ") -> "; (((((((v_Vuna_dCompiler_dCodegen_dDecl_drenderPiTyFuel qc) (fuel - 1)) levels) table) datas) (lvl + 1)) next)]))) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dapplyClosure dtb__70) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NVar (dtb__66, lvl, Base_dList.C_Base_dList_dList_Nil))))))
  | _ -> (((((v_Vuna_dCompiler_dCodegen_dDecl_drenderTypeArg qc) levels) table) datas) v)
)))

let v_Vuna_dCompiler_dCodegen_dDecl_drenderPiTy = (fun qc levels table datas lvl v -> (((((((v_Vuna_dCompiler_dCodegen_dDecl_drenderPiTyFuel qc) 256) levels) table) datas) lvl) v))

let v_Vuna_dCompiler_dCodegen_dDecl_drenderFieldTy = (fun mc0 mc1 mc2 mc3 mc4 mc5 mc6 -> (match mc5 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral (dtb__71) -> (match dtb__71 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NVar (dtb__72, dtb__73, dtb__74) -> (match ((v_Vuna_dCompiler_dCodegen_dDecl_dlevelSlot mc1) dtb__73) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__75) -> { Base_dPair.f_Base_dPair_dPair_first = (v_Vuna_dCompiler_dCodegen_dDecl_dtypeParamName dtb__75); Base_dPair.f_Base_dPair_dPair_second = mc6 }
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> { Base_dPair.f_Base_dPair_dPair_first = (v_Vuna_dCompiler_dCodegen_dDecl_dtypeParamName mc6); Base_dPair.f_Base_dPair_dPair_second = (mc6 + 1) }
  | _ -> failwith "DT: impossible branch"
)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal (dtb__76, dtb__77) -> (match ((v_Vuna_dCompiler_dCodegen_dDecl_drenderTypeIntrinsic dtb__76) ((Base_dList.v_Base_dList_dmap (fun x -> (((((v_Vuna_dCompiler_dCodegen_dDecl_drenderTypeArg mc0) mc1) mc2) mc3) x))) dtb__77)) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__78) -> { Base_dPair.f_Base_dPair_dPair_first = dtb__78; Base_dPair.f_Base_dPair_dPair_second = mc6 }
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (if (dtb__76 = Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dintTypeName) then { Base_dPair.f_Base_dPair_dPair_first = "int"; Base_dPair.f_Base_dPair_dPair_second = mc6 } else (if (dtb__76 = Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dnatTypeName) then { Base_dPair.f_Base_dPair_dPair_first = "int"; Base_dPair.f_Base_dPair_dPair_second = mc6 } else (if (dtb__76 = Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dstrTypeName) then { Base_dPair.f_Base_dPair_dPair_first = "string"; Base_dPair.f_Base_dPair_dPair_second = mc6 } else (if (dtb__76 = Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dfloatTypeName) then { Base_dPair.f_Base_dPair_dPair_first = "float"; Base_dPair.f_Base_dPair_dPair_second = mc6 } else (if (dtb__76 = Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dboolTypeName) then { Base_dPair.f_Base_dPair_dPair_first = "bool"; Base_dPair.f_Base_dPair_dPair_second = mc6 } else (match ((Vuna_dCompiler_dElab_dRepresentation.v_Vuna_dCompiler_dElab_dRepresentation_dfindDtData dtb__76) mc3) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__79) -> { Base_dPair.f_Base_dPair_dPair_first = (((v_Vuna_dCompiler_dCodegen_dDecl_dfamilyTyText mc0) dtb__76) ((((((v_Vuna_dCompiler_dCodegen_dDecl_drenderFamilyArgs mc0) mc1) mc2) mc3) ((v_Vuna_dCompiler_dCodegen_dDecl_dlookupUsed mc2) dtb__76)) dtb__77)); Base_dPair.f_Base_dPair_dPair_second = mc6 }
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> { Base_dPair.f_Base_dPair_dPair_first = (v_Vuna_dCompiler_dCodegen_dDecl_dtypeParamName mc6); Base_dPair.f_Base_dPair_dPair_second = (mc6 + 1) }
  | _ -> failwith "DT: impossible branch"
))))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VPi (dtb__80, dtb__81, dtb__82, dtb__83, dtb__84) -> (if dtb__81 then { Base_dPair.f_Base_dPair_dPair_first = (v_Vuna_dCompiler_dCodegen_dDecl_dtypeParamName mc6); Base_dPair.f_Base_dPair_dPair_second = (mc6 + 1) } else { Base_dPair.f_Base_dPair_dPair_first = ((((((v_Vuna_dCompiler_dCodegen_dDecl_drenderPiTy mc0) mc1) mc2) mc3) mc4) mc5); Base_dPair.f_Base_dPair_dPair_second = mc6 })
  | _ -> { Base_dPair.f_Base_dPair_dPair_first = (v_Vuna_dCompiler_dCodegen_dDecl_dtypeParamName mc6); Base_dPair.f_Base_dPair_dPair_second = (mc6 + 1) }
))

let v_Vuna_dCompiler_dCodegen_dDecl_dflagMatchesRig = (fun mc0 mc1 -> (if mc0 then (Base_dBool.v_Base_dBool_dnot (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_drigIsErased mc1)) else (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_drigIsErased mc1)))

let rec v_Vuna_dCompiler_dCodegen_dDecl_dctorShapeOf = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__85, dtb__86) -> ((Base_dList.v_Base_dList_dappend ((Base_dList.v_Base_dList_dmap (fun c -> { Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorName c); Base_dPair.f_Base_dPair_dPair_second = (Vuna_dCompiler_dElab_dRepresentation.v_Vuna_dCompiler_dElab_dRepresentation_dctorKeepFlags c) })) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataCtors dtb__85))) (v_Vuna_dCompiler_dCodegen_dDecl_dctorShapeOf dtb__86))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCodegen_dDecl_disTypeHeadOpaqueDatas = (fun datas name -> (if (name = Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dboolTypeName) then false else (if (name = Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dnatTypeName) then false else (match ((Vuna_dCompiler_dElab_dRepresentation.v_Vuna_dCompiler_dElab_dRepresentation_dfindDtData name) datas) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__87) -> false
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (Base_dBool.v_Base_dBool_dnot (Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_disTypeConstructorName name))
  | _ -> failwith "DT: impossible branch"
))))

let rec v_Vuna_dCompiler_dCodegen_dDecl_dmemOpaqueLevel = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__88, dtb__89) -> (if (dtb__88 = mc0) then true else ((v_Vuna_dCompiler_dCodegen_dDecl_dmemOpaqueLevel mc0) dtb__89))
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dCodegen_dDecl_dctorUsedLevels = (fun mc0 mc1 mc2 mc3 mc4 mc5 mc6 -> (match mc4 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__90, dtb__91) -> (match dtb__90 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__92; Base_dPair.f_Base_dPair_dPair_second = dtb__93 } -> (match mc6 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VPi (dtb__94, dtb__95, dtb__96, dtb__97, dtb__98) -> ((fun isOpq -> ((fun fam2 -> ((fun next -> (if (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_drigIsErased dtb__93) then (((((((v_Vuna_dCompiler_dCodegen_dDecl_dctorUsedLevels mc0) mc1) mc2) fam2) dtb__91) (mc5 + 1)) next) else (if isOpq then (((((((v_Vuna_dCompiler_dCodegen_dDecl_dctorUsedLevels mc0) mc1) mc2) fam2) dtb__91) (mc5 + 1)) next) else ((Base_dList.v_Base_dList_dappend (((((v_Vuna_dCompiler_dCodegen_dDecl_dcollectUsedLevels mc0) mc1) mc2) mc5) dtb__97)) (((((((v_Vuna_dCompiler_dCodegen_dDecl_dctorUsedLevels mc0) mc1) mc2) fam2) dtb__91) (mc5 + 1)) next))))) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dapplyClosure dtb__98) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NVar (dtb__94, mc5, Base_dList.C_Base_dList_dList_Nil))))))) (if (Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_disFamilyKindValue dtb__97) then (Base_dList.C_Base_dList_dList_Cons (mc5, mc3)) else mc3))) (((((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dvalueOpaqueScoped (fun l -> ((v_Vuna_dCompiler_dCodegen_dDecl_dmemOpaqueLevel l) mc3))) (v_Vuna_dCompiler_dCodegen_dDecl_disTypeHeadOpaqueDatas mc2)) mc5) mc3) dtb__97))
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
  | Base_dList.C_Base_dList_dList_Cons (dtb__99, dtb__100) -> (match dtb__99 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__101; Base_dPair.f_Base_dPair_dPair_second = dtb__102 } -> (match mc3 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VPi (dtb__103, dtb__104, dtb__105, dtb__106, dtb__107) -> ((fun flag -> ((fun fam2 -> ((fun next -> ((((((v_Vuna_dCompiler_dCodegen_dDecl_dctorOpaqueGo mc0) dtb__100) (mc2 + 1)) next) fam2) (Base_dList.C_Base_dList_dList_Cons (flag, mc5)))) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dapplyClosure dtb__107) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NVar (dtb__103, mc2, Base_dList.C_Base_dList_dList_Nil))))))) (if (Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_disFamilyKindValue dtb__106) then (Base_dList.C_Base_dList_dList_Cons (mc2, mc4)) else mc4))) (if (Base_dBool.v_Base_dBool_dnot (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_drigIsErased dtb__102)) then (((((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dvalueOpaqueScoped (fun l -> ((v_Vuna_dCompiler_dCodegen_dDecl_dmemOpaqueLevel l) mc4))) (v_Vuna_dCompiler_dCodegen_dDecl_disTypeHeadOpaqueDatas mc0)) mc2) mc4) dtb__106) else false))
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
  | Base_dList.C_Base_dList_dList_Cons (dtb__108, dtb__109) -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__110, dtb__111) -> (if dtb__108 then (Base_dList.C_Base_dList_dList_Cons (dtb__110, ((v_Vuna_dCompiler_dCodegen_dDecl_dctorOpaqueKeptFlags dtb__109) dtb__111))) else ((v_Vuna_dCompiler_dCodegen_dDecl_dctorOpaqueKeptFlags dtb__109) dtb__111))
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
  | Base_dList.C_Base_dList_dList_Cons (dtb__112, dtb__113) -> (match mc5 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__114, dtb__115) -> (match mc6 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__116, dtb__117) -> (match dtb__116 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__118; Base_dPair.f_Base_dPair_dPair_second = dtb__119 } -> (if ((v_Vuna_dCompiler_dCodegen_dDecl_dflagMatchesRig dtb__112) dtb__119) then (match mc8 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VPi (dtb__120, dtb__121, dtb__122, dtb__123, dtb__124) -> ((fun next -> (if dtb__112 then (if dtb__114 then ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((((((((v_Vuna_dCompiler_dCodegen_dDecl_dctorFieldTexts mc0) mc1) mc2) mc3) dtb__113) dtb__115) dtb__117) (mc7 + 1)) next) mc9)) (fun p -> (match p with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__125; Base_dPair.f_Base_dPair_dPair_second = dtb__126 } -> (Base_dResult.C_Base_dResult_dResult_Ok ({ Base_dPair.f_Base_dPair_dPair_first = (Base_dList.C_Base_dList_dList_Cons ("Obj.t", dtb__125)); Base_dPair.f_Base_dPair_dPair_second = dtb__126 }))
  | _ -> failwith "DT: impossible branch"
))) else (match (((((((v_Vuna_dCompiler_dCodegen_dDecl_drenderFieldTy mc0) mc1) mc2) mc3) mc7) dtb__123) mc9) with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__127; Base_dPair.f_Base_dPair_dPair_second = dtb__128 } -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((((((((v_Vuna_dCompiler_dCodegen_dDecl_dctorFieldTexts mc0) mc1) mc2) mc3) dtb__113) dtb__115) dtb__117) (mc7 + 1)) next) dtb__128)) (fun p -> (match p with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__129; Base_dPair.f_Base_dPair_dPair_second = dtb__130 } -> (Base_dResult.C_Base_dResult_dResult_Ok ({ Base_dPair.f_Base_dPair_dPair_first = (Base_dList.C_Base_dList_dList_Cons (dtb__127, dtb__129)); Base_dPair.f_Base_dPair_dPair_second = dtb__130 }))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)) else ((((((((((v_Vuna_dCompiler_dCodegen_dDecl_dctorFieldTexts mc0) mc1) mc2) mc3) dtb__113) dtb__115) dtb__117) (mc7 + 1)) next) mc9))) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dapplyClosure dtb__124) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NVar (dtb__120, mc7, Base_dList.C_Base_dList_dList_Nil))))))
  | _ -> (Base_dResult.C_Base_dResult_dResult_Err ("DT: internal: constructor telescope does not match its type"))
) else (Base_dResult.C_Base_dResult_dResult_Err ("DT: internal: constructor keep flag disagrees with telescope rig")))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dResult.C_Base_dResult_dResult_Ok ({ Base_dPair.f_Base_dPair_dPair_first = Base_dList.C_Base_dList_dList_Nil; Base_dPair.f_Base_dPair_dPair_second = mc9 }))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> (match mc6 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__131, dtb__132) -> (Base_dResult.C_Base_dResult_dResult_Err ("DT: internal: constructor opaque flags shorter than its shape"))
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dResult.C_Base_dResult_dResult_Ok ({ Base_dPair.f_Base_dPair_dPair_first = Base_dList.C_Base_dList_dList_Nil; Base_dPair.f_Base_dPair_dPair_second = mc9 }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> (match mc5 with
  | Base_dList.C_Base_dList_dList_Nil -> (match mc6 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__133, dtb__134) -> (Base_dResult.C_Base_dResult_dResult_Err ("DT: internal: constructor shape has more binders than its telescope"))
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dResult.C_Base_dResult_dResult_Ok ({ Base_dPair.f_Base_dPair_dPair_first = Base_dList.C_Base_dList_dList_Nil; Base_dPair.f_Base_dPair_dPair_second = mc9 }))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Cons (dtb__135, dtb__136) -> (match mc6 with
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dResult.C_Base_dResult_dResult_Ok ({ Base_dPair.f_Base_dPair_dPair_first = Base_dList.C_Base_dList_dList_Nil; Base_dPair.f_Base_dPair_dPair_second = mc9 }))
  | _ -> (Base_dResult.C_Base_dResult_dResult_Err ("DT: internal: constructor opaque flags longer than its shape"))
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCodegen_dDecl_dctorArityNeed = (fun qc levels table datas c -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((((((((v_Vuna_dCompiler_dCodegen_dDecl_dctorFieldTexts qc) levels) table) datas) (Vuna_dCompiler_dElab_dRepresentation.v_Vuna_dCompiler_dElab_dRepresentation_dctorKeepFlags c)) ((v_Vuna_dCompiler_dCodegen_dDecl_dctorOpaqueFlagsOf datas) c)) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorTelescope c)) 0) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_deval Base_dList.C_Base_dList_dList_Nil) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorType c))) (Base_dList.v_Base_dList_dlength levels))) (fun p -> (Base_dResult.C_Base_dResult_dResult_Ok (((Base_dPair.v_Base_dPair_dsecondOf p) - (Base_dList.v_Base_dList_dlength levels)))))))

let rec v_Vuna_dCompiler_dCodegen_dDecl_dmaxIntList = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__137, dtb__138) -> (if (dtb__137 >= (v_Vuna_dCompiler_dCodegen_dDecl_dmaxIntList dtb__138)) then dtb__137 else (v_Vuna_dCompiler_dCodegen_dDecl_dmaxIntList dtb__138))
  | Base_dList.C_Base_dList_dList_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCodegen_dDecl_ddataArityNeed = (fun qc levels table datas ctors -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((Base_dResult.v_Base_dResult_dtraverse ((((v_Vuna_dCompiler_dCodegen_dDecl_dctorArityNeed qc) levels) table) datas)) ctors)) (fun ns -> (Base_dResult.C_Base_dResult_dResult_Ok (((Base_dList.v_Base_dList_dlength levels) + (v_Vuna_dCompiler_dCodegen_dDecl_dmaxIntList ns)))))))

let v_Vuna_dCompiler_dCodegen_dDecl_dparenOne = (fun t -> (String.concat "" ["("; t; ")"]))

let rec v_Vuna_dCompiler_dCodegen_dDecl_dparenList = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__139, dtb__140) -> ((Base_dList.v_Base_dList_dappend (Base_dList.C_Base_dList_dList_Cons ((v_Vuna_dCompiler_dCodegen_dDecl_dparenOne dtb__139), Base_dList.C_Base_dList_dList_Nil))) (v_Vuna_dCompiler_dCodegen_dDecl_dparenList dtb__140))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCodegen_dDecl_dctorDeclText = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__141, dtb__142) -> (match dtb__142 with
  | Base_dList.C_Base_dList_dList_Nil -> (String.concat "" [mc0; " of "; (v_Vuna_dCompiler_dCodegen_dDecl_dparenOne dtb__141)])
  | _ -> (String.concat "" [mc0; " of "; ((v_Vuna_dCompiler_dCodegen_dDecl_djoinWith " * ") (v_Vuna_dCompiler_dCodegen_dDecl_dparenList mc1))])
)
  | Base_dList.C_Base_dList_dList_Nil -> mc0
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCodegen_dDecl_dgenCtorDecl = (fun qc levels table datas c -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((((((((v_Vuna_dCompiler_dCodegen_dDecl_dctorFieldTexts qc) levels) table) datas) (Vuna_dCompiler_dElab_dRepresentation.v_Vuna_dCompiler_dElab_dRepresentation_dctorKeepFlags c)) ((v_Vuna_dCompiler_dCodegen_dDecl_dctorOpaqueFlagsOf datas) c)) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorTelescope c)) 0) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_deval Base_dList.C_Base_dList_dList_Nil) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorType c))) (Base_dList.v_Base_dList_dlength levels))) (fun p -> (Base_dResult.C_Base_dResult_dResult_Ok (((v_Vuna_dCompiler_dCodegen_dDecl_dctorDeclText ((v_Vuna_dCompiler_dCodegen_dDecl_dctorOcamlName (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorFamily c)) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorName c))) (Base_dPair.v_Base_dPair_dfirstOf p)))))))

let v_Vuna_dCompiler_dCodegen_dDecl_disRecordData = (fun d -> (match (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataFields d) with
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> ((fun nd_uscrut1 -> (match nd_uscrut1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__143, dtb__144) -> (match dtb__144 with
  | Base_dList.C_Base_dList_dList_Nil -> true
  | _ -> false
)
  | _ -> false
)) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataCtors d))
))

let v_Vuna_dCompiler_dCodegen_dDecl_drecordFieldLabel = (fun family field -> (String.concat "" ["f_"; (v_Vuna_dCompiler_dCodegen_dDecl_dsanitizeName family); "_"; (v_Vuna_dCompiler_dCodegen_dDecl_dsanitizeName field)]))

let rec v_Vuna_dCompiler_dCodegen_dDecl_drecordRtFieldsGo = (fun mc0 mc1 mc2 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__145, dtb__146) -> (match mc2 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__147, dtb__148) -> (if dtb__145 then (Base_dList.C_Base_dList_dList_Cons ({ Base_dPair.f_Base_dPair_dPair_first = (dtb__147).Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtFieldMeta_dtFieldIndex; Base_dPair.f_Base_dPair_dPair_second = ((v_Vuna_dCompiler_dCodegen_dDecl_drecordFieldLabel mc0) (dtb__147).Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtFieldMeta_dtFieldName) }, (((v_Vuna_dCompiler_dCodegen_dDecl_drecordRtFieldsGo mc0) dtb__146) dtb__148))) else (((v_Vuna_dCompiler_dCodegen_dDecl_drecordRtFieldsGo mc0) dtb__146) dtb__148))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCodegen_dDecl_drecordRtFields = (fun d -> ((fun nd_uscrut1 -> (match nd_uscrut1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__149, dtb__150) -> (match dtb__150 with
  | Base_dList.C_Base_dList_dList_Nil -> ((fun arity -> (((v_Vuna_dCompiler_dCodegen_dDecl_drecordRtFieldsGo (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataName d)) ((Base_dList.v_Base_dList_ddrop arity) (Vuna_dCompiler_dElab_dRepresentation.v_Vuna_dCompiler_dElab_dRepresentation_dctorKeepFlags dtb__149))) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataFields d))) (Base_dList.v_Base_dList_dlength (d).Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataParams))
  | _ -> Base_dList.C_Base_dList_dList_Nil
)
  | _ -> Base_dList.C_Base_dList_dList_Nil
)) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataCtors d)))

let v_Vuna_dCompiler_dCodegen_dDecl_dhasRecordRepr = (fun d -> (if (v_Vuna_dCompiler_dCodegen_dDecl_disRecordData d) then (match (v_Vuna_dCompiler_dCodegen_dDecl_drecordRtFields d) with
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> true
) else false))

let rec v_Vuna_dCompiler_dCodegen_dDecl_drecordFieldDecls = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__151, dtb__152) -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__153, dtb__154) -> (Base_dList.C_Base_dList_dList_Cons ((String.concat "" [(Base_dPair.v_Base_dPair_dsecondOf dtb__151); " : "; dtb__153]), ((v_Vuna_dCompiler_dCodegen_dDecl_drecordFieldDecls dtb__152) dtb__154)))
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
  | Base_dList.C_Base_dList_dList_Cons (dtb__155, dtb__156) -> (match dtb__156 with
  | Base_dList.C_Base_dList_dList_Nil -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((((((((v_Vuna_dCompiler_dCodegen_dDecl_dctorFieldTexts qc) levels) table) datas) (Vuna_dCompiler_dElab_dRepresentation.v_Vuna_dCompiler_dElab_dRepresentation_dctorKeepFlags dtb__155)) ((v_Vuna_dCompiler_dCodegen_dDecl_dctorOpaqueFlagsOf datas) dtb__155)) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorTelescope dtb__155)) 0) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_deval Base_dList.C_Base_dList_dList_Nil) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorType dtb__155))) (Base_dList.v_Base_dList_dlength levels))) (fun p -> (Base_dResult.C_Base_dResult_dResult_Ok ((String.concat "" [(v_Vuna_dCompiler_dCodegen_dDecl_dtypeParamDecl (Base_dPair.v_Base_dPair_dsecondOf p)); (v_Vuna_dCompiler_dCodegen_dDecl_dtypeName (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataName d)); " = { "; ((v_Vuna_dCompiler_dCodegen_dDecl_djoinWith "; ") ((v_Vuna_dCompiler_dCodegen_dDecl_drecordFieldDecls (v_Vuna_dCompiler_dCodegen_dDecl_drecordRtFields d)) (Base_dPair.v_Base_dPair_dfirstOf p))); " }"])))))
  | _ -> (Base_dResult.C_Base_dResult_dResult_Err (("DT: internal: record family must have exactly one constructor: " ^ (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataName d))))
)
  | _ -> (Base_dResult.C_Base_dResult_dResult_Err (("DT: internal: record family must have exactly one constructor: " ^ (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataName d))))
)) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataCtors d)))

let v_Vuna_dCompiler_dCodegen_dDecl_dgenUnboxedDataDecl = (fun qc levels table datas d c idx -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((((((((v_Vuna_dCompiler_dCodegen_dDecl_dctorFieldTexts qc) levels) table) datas) (Vuna_dCompiler_dElab_dRepresentation.v_Vuna_dCompiler_dElab_dRepresentation_dctorKeepFlags c)) ((v_Vuna_dCompiler_dCodegen_dDecl_dctorOpaqueFlagsOf datas) c)) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorTelescope c)) 0) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_deval Base_dList.C_Base_dList_dList_Nil) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorType c))) (Base_dList.v_Base_dList_dlength levels))) (fun p -> (match (Base_dPair.v_Base_dPair_dfirstOf p) with
  | Base_dList.C_Base_dList_dList_Cons (dtb__157, dtb__158) -> (match dtb__158 with
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dResult.C_Base_dResult_dResult_Ok ((String.concat "" [(v_Vuna_dCompiler_dCodegen_dDecl_dtypeParamDecl (Base_dPair.v_Base_dPair_dsecondOf p)); (v_Vuna_dCompiler_dCodegen_dDecl_dtypeName (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataName d)); " = "; dtb__157])))
  | _ -> (Base_dResult.C_Base_dResult_dResult_Err (("DT: internal: unboxed constructor has more than one kept field: " ^ (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorName c))))
)
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dResult.C_Base_dResult_dResult_Err (("DT: internal: unboxed constructor has no kept field: " ^ (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorName c))))
  | _ -> failwith "DT: impossible branch"
))))

let v_Vuna_dCompiler_dCodegen_dDecl_dctorBodyText = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Nil -> "|"
  | _ -> ((v_Vuna_dCompiler_dCodegen_dDecl_djoinWith " | ") mc0)
))

let v_Vuna_dCompiler_dCodegen_dDecl_dgenDataDecl = (fun qc table datas unboxed d -> ((fun levels -> ((fun nd_uscrut6 -> (match nd_uscrut6 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (if (v_Vuna_dCompiler_dCodegen_dDecl_dhasRecordRepr d) then (((((v_Vuna_dCompiler_dCodegen_dDecl_dgenRecordDecl qc) levels) table) datas) d) else ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((((v_Vuna_dCompiler_dCodegen_dDecl_ddataArityNeed qc) levels) table) datas) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataCtors d))) (fun arity -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((Base_dResult.v_Base_dResult_dtraverse ((((v_Vuna_dCompiler_dCodegen_dDecl_dgenCtorDecl qc) levels) table) datas)) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataCtors d))) (fun cs -> (Base_dResult.C_Base_dResult_dResult_Ok ((String.concat "" [(v_Vuna_dCompiler_dCodegen_dDecl_dtypeParamDecl arity); (v_Vuna_dCompiler_dCodegen_dDecl_dtypeName (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataName d)); " = "; (v_Vuna_dCompiler_dCodegen_dDecl_dctorBodyText cs)]))))))))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__159) -> (match dtb__159 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__160; Base_dPair.f_Base_dPair_dPair_second = dtb__161 } -> (((((((v_Vuna_dCompiler_dCodegen_dDecl_dgenUnboxedDataDecl qc) levels) table) datas) d) dtb__160) dtb__161)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) ((Vuna_dCompiler_dElab_dRepresentation.v_Vuna_dCompiler_dElab_dRepresentation_dlookupUnboxedInfo (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataName d)) unboxed))) ((v_Vuna_dCompiler_dCodegen_dDecl_dlookupUsed table) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataName d))))

let v_Vuna_dCompiler_dCodegen_dDecl_disBoolFamilyName = (fun name -> (name = Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dboolTypeName))

let v_Vuna_dCompiler_dCodegen_dDecl_disNatFamilyName = (fun name -> (name = Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dnatTypeName))

let v_Vuna_dCompiler_dCodegen_dDecl_druntimeDatas = (fun datas -> ((Base_dList.v_Base_dList_dfilter (fun d -> (if (Base_dBool.v_Base_dBool_dnot (v_Vuna_dCompiler_dCodegen_dDecl_disBoolFamilyName (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataName d))) then (Base_dBool.v_Base_dBool_dnot (v_Vuna_dCompiler_dCodegen_dDecl_disNatFamilyName (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataName d))) else false))) datas))

let v_Vuna_dCompiler_dCodegen_dDecl_dusedTableOf = (fun datas -> ((v_Vuna_dCompiler_dCodegen_dDecl_dusedTableFix datas) ((Base_dList.v_Base_dList_dmap (fun d -> { Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataName d); Base_dPair.f_Base_dPair_dPair_second = Base_dList.C_Base_dList_dList_Nil })) datas)))

let v_Vuna_dCompiler_dCodegen_dDecl_dgenTypeDeclsWith = (fun mc0 mc1 mc2 mc3 -> (match mc3 with
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dResult.C_Base_dResult_dResult_Ok (""))
  | _ -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((Base_dResult.v_Base_dResult_dtraverse ((((v_Vuna_dCompiler_dCodegen_dDecl_dgenDataDecl mc0) mc1) mc2) (Vuna_dCompiler_dElab_dRepresentation.v_Vuna_dCompiler_dElab_dRepresentation_dunboxedInfoOf mc2))) mc3)) (fun parts -> (Base_dResult.C_Base_dResult_dResult_Ok ((String.concat "" ["type "; ((v_Vuna_dCompiler_dCodegen_dDecl_djoinWith "\nand ") parts); "\n\n"])))))
))

let v_Vuna_dCompiler_dCodegen_dDecl_dgenTypeDeclsOf = (fun qc allDatas subset -> ((((v_Vuna_dCompiler_dCodegen_dDecl_dgenTypeDeclsWith qc) (v_Vuna_dCompiler_dCodegen_dDecl_dusedTableOf allDatas)) allDatas) subset))

let v_Vuna_dCompiler_dCodegen_dDecl_dcollectUsedSpine = (fun a1 a2 a3 a4 a5 -> ((((((v_Vuna_dCompiler_dCodegen_dDecl_dcollectUsedSpineFuel 512) a1) a2) a3) a4) a5))
