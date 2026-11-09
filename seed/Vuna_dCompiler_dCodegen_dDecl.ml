open Vuna_runtime
type t_Vuna_dCompiler_dCodegen_dDecl_dQualCtx = C_Vuna_dCompiler_dCodegen_dDecl_dQualCtx_QualCtx of (string) * ((string, string) Base_dHashMap.t_Base_dHashMap_dHashMap) * ((string, string) Base_dHashMap.t_Base_dHashMap_dHashMap)

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

let v_Vuna_dCompiler_dCodegen_dDecl_dnoQual = (C_Vuna_dCompiler_dCodegen_dDecl_dQualCtx_QualCtx ("", ((Base_dHashMap.v_Base_dHashMap_dfromList Base_dString.v_Hashable_uString) Base_dList.C_Base_dList_dList_Nil), ((Base_dHashMap.v_Base_dHashMap_dfromList Base_dString.v_Hashable_uString) Base_dList.C_Base_dList_dList_Nil)))

let v_Vuna_dCompiler_dCodegen_dDecl_dunitTblOf = (fun pairs -> (((Base_dHashMap.v_Base_dHashMap_dinsertAll Base_dString.v_Hashable_uString) pairs) ((Base_dHashMap.v_Base_dHashMap_dfromList Base_dString.v_Hashable_uString) Base_dList.C_Base_dList_dList_Nil)))

let v_Vuna_dCompiler_dCodegen_dDecl_dunitOfTbl = (fun tbl name -> (match ((((Base_dHashMap.v_Base_dHashMap_dlookup Base_dString.v_Hashable_uString) Base_dString.v_Eq_uString) name) tbl) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__0) -> dtb__0
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ""
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCodegen_dDecl_dqualOf = (fun unit defs datas -> (C_Vuna_dCompiler_dCodegen_dDecl_dQualCtx_QualCtx (unit, (v_Vuna_dCompiler_dCodegen_dDecl_dunitTblOf defs), (v_Vuna_dCompiler_dCodegen_dDecl_dunitTblOf datas))))

let v_Vuna_dCompiler_dCodegen_dDecl_dqualPrefix = (fun qc owner text -> (if (if (owner = "") then true else (owner = (match qc with
  | C_Vuna_dCompiler_dCodegen_dDecl_dQualCtx_QualCtx (dtb__1, dtb__2, dtb__3) -> dtb__1
  | _ -> failwith "DT: impossible branch"
))) then (Base_dPair.C_Base_dPair_dPair_Pair (text, "")) else (Base_dPair.C_Base_dPair_dPair_Pair ((String.concat "" [owner; "."; text]), owner))))

let v_Vuna_dCompiler_dCodegen_dDecl_dqualValueText = (fun qc name -> (((v_Vuna_dCompiler_dCodegen_dDecl_dqualPrefix qc) ((v_Vuna_dCompiler_dCodegen_dDecl_dunitOfTbl (match qc with
  | C_Vuna_dCompiler_dCodegen_dDecl_dQualCtx_QualCtx (dtb__4, dtb__5, dtb__6) -> dtb__5
  | _ -> failwith "DT: impossible branch"
)) name)) (v_Vuna_dCompiler_dCodegen_dDecl_dvalueName name)))

let v_Vuna_dCompiler_dCodegen_dDecl_dqualCtorText = (fun qc family ctor -> (((v_Vuna_dCompiler_dCodegen_dDecl_dqualPrefix qc) ((v_Vuna_dCompiler_dCodegen_dDecl_dunitOfTbl (match qc with
  | C_Vuna_dCompiler_dCodegen_dDecl_dQualCtx_QualCtx (dtb__7, dtb__8, dtb__9) -> dtb__9
  | _ -> failwith "DT: impossible branch"
)) family)) ((v_Vuna_dCompiler_dCodegen_dDecl_dctorOcamlName family) ctor)))

let v_Vuna_dCompiler_dCodegen_dDecl_dqualTypeText = (fun qc name -> (((v_Vuna_dCompiler_dCodegen_dDecl_dqualPrefix qc) ((v_Vuna_dCompiler_dCodegen_dDecl_dunitOfTbl (match qc with
  | C_Vuna_dCompiler_dCodegen_dDecl_dQualCtx_QualCtx (dtb__10, dtb__11, dtb__12) -> dtb__12
  | _ -> failwith "DT: impossible branch"
)) name)) (v_Vuna_dCompiler_dCodegen_dDecl_dtypeName name)))

let rec v_Vuna_dCompiler_dCodegen_dDecl_ddataTypeGlobalNamesGo = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__13, dtb__14) -> ((v_Vuna_dCompiler_dCodegen_dDecl_ddataTypeGlobalNamesGo ((Base_dList.v_Base_dList_dappend mc0) (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dtermGlobalNames (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorType dtb__13)))) dtb__14)
  | Base_dList.C_Base_dList_dList_Nil -> mc0
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCodegen_dDecl_ddataTypeGlobalNames = (fun d -> ((v_Vuna_dCompiler_dCodegen_dDecl_ddataTypeGlobalNamesGo Base_dList.C_Base_dList_dList_Nil) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataCtors d)))

let rec v_Vuna_dCompiler_dCodegen_dDecl_dtypeDepsOfGo = (fun mc0 mc1 mc2 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__15, dtb__16) -> ((fun owner -> (if (if (owner = "") then true else (owner = (match mc0 with
  | C_Vuna_dCompiler_dCodegen_dDecl_dQualCtx_QualCtx (dtb__17, dtb__18, dtb__19) -> dtb__17
  | _ -> failwith "DT: impossible branch"
))) then (((v_Vuna_dCompiler_dCodegen_dDecl_dtypeDepsOfGo mc0) dtb__16) mc2) else (if ((Base_dList.v_Base_dList_dmemName owner) mc2) then (((v_Vuna_dCompiler_dCodegen_dDecl_dtypeDepsOfGo mc0) dtb__16) mc2) else (((v_Vuna_dCompiler_dCodegen_dDecl_dtypeDepsOfGo mc0) dtb__16) (Base_dList.C_Base_dList_dList_Cons (owner, mc2)))))) ((v_Vuna_dCompiler_dCodegen_dDecl_dunitOfTbl (match mc0 with
  | C_Vuna_dCompiler_dCodegen_dDecl_dQualCtx_QualCtx (dtb__20, dtb__21, dtb__22) -> dtb__22
  | _ -> failwith "DT: impossible branch"
)) dtb__15))
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dList.v_Base_dList_dreverse mc2)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCodegen_dDecl_dtypeDepsOf = (fun qc datas -> (((v_Vuna_dCompiler_dCodegen_dDecl_dtypeDepsOfGo qc) ((Base_dList.v_Base_dList_dconcatMap v_Vuna_dCompiler_dCodegen_dDecl_ddataTypeGlobalNames) datas)) Base_dList.C_Base_dList_dList_Nil))

let v_Vuna_dCompiler_dCodegen_dDecl_docamlReservedWords = (Base_dList.C_Base_dList_dList_Cons ("and", (Base_dList.C_Base_dList_dList_Cons ("as", (Base_dList.C_Base_dList_dList_Cons ("assert", (Base_dList.C_Base_dList_dList_Cons ("asr", (Base_dList.C_Base_dList_dList_Cons ("begin", (Base_dList.C_Base_dList_dList_Cons ("class", (Base_dList.C_Base_dList_dList_Cons ("constraint", (Base_dList.C_Base_dList_dList_Cons ("do", (Base_dList.C_Base_dList_dList_Cons ("done", (Base_dList.C_Base_dList_dList_Cons ("downto", (Base_dList.C_Base_dList_dList_Cons ("else", (Base_dList.C_Base_dList_dList_Cons ("end", (Base_dList.C_Base_dList_dList_Cons ("exception", (Base_dList.C_Base_dList_dList_Cons ("external", (Base_dList.C_Base_dList_dList_Cons ("false", (Base_dList.C_Base_dList_dList_Cons ("for", (Base_dList.C_Base_dList_dList_Cons ("fun", (Base_dList.C_Base_dList_dList_Cons ("function", (Base_dList.C_Base_dList_dList_Cons ("functor", (Base_dList.C_Base_dList_dList_Cons ("if", (Base_dList.C_Base_dList_dList_Cons ("in", (Base_dList.C_Base_dList_dList_Cons ("include", (Base_dList.C_Base_dList_dList_Cons ("inherit", (Base_dList.C_Base_dList_dList_Cons ("initializer", (Base_dList.C_Base_dList_dList_Cons ("land", (Base_dList.C_Base_dList_dList_Cons ("lazy", (Base_dList.C_Base_dList_dList_Cons ("let", (Base_dList.C_Base_dList_dList_Cons ("lor", (Base_dList.C_Base_dList_dList_Cons ("lsl", (Base_dList.C_Base_dList_dList_Cons ("lsr", (Base_dList.C_Base_dList_dList_Cons ("lxor", (Base_dList.C_Base_dList_dList_Cons ("match", (Base_dList.C_Base_dList_dList_Cons ("method", (Base_dList.C_Base_dList_dList_Cons ("mod", (Base_dList.C_Base_dList_dList_Cons ("module", (Base_dList.C_Base_dList_dList_Cons ("mutable", (Base_dList.C_Base_dList_dList_Cons ("new", (Base_dList.C_Base_dList_dList_Cons ("nonrec", (Base_dList.C_Base_dList_dList_Cons ("object", (Base_dList.C_Base_dList_dList_Cons ("of", (Base_dList.C_Base_dList_dList_Cons ("open", (Base_dList.C_Base_dList_dList_Cons ("or", (Base_dList.C_Base_dList_dList_Cons ("private", (Base_dList.C_Base_dList_dList_Cons ("rec", (Base_dList.C_Base_dList_dList_Cons ("sig", (Base_dList.C_Base_dList_dList_Cons ("struct", (Base_dList.C_Base_dList_dList_Cons ("then", (Base_dList.C_Base_dList_dList_Cons ("to", (Base_dList.C_Base_dList_dList_Cons ("true", (Base_dList.C_Base_dList_dList_Cons ("try", (Base_dList.C_Base_dList_dList_Cons ("type", (Base_dList.C_Base_dList_dList_Cons ("val", (Base_dList.C_Base_dList_dList_Cons ("virtual", (Base_dList.C_Base_dList_dList_Cons ("when", (Base_dList.C_Base_dList_dList_Cons ("while", (Base_dList.C_Base_dList_dList_Cons ("with", Base_dList.C_Base_dList_dList_Nil))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))

let v_Vuna_dCompiler_dCodegen_dDecl_docamlBinderName = (fun name -> ((fun oc -> (if ((Base_dList.v_Base_dList_dmemName oc) v_Vuna_dCompiler_dCodegen_dDecl_docamlReservedWords) then (oc ^ "_") else oc)) (v_Vuna_dCompiler_dCodegen_dDecl_dsanitizeName name)))

let rec v_Vuna_dCompiler_dCodegen_dDecl_dinterpose = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__23, dtb__24) -> (match dtb__24 with
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dList.C_Base_dList_dList_Cons (dtb__23, Base_dList.C_Base_dList_dList_Nil))
  | _ -> (Base_dList.C_Base_dList_dList_Cons (dtb__23, (Base_dList.C_Base_dList_dList_Cons (mc0, ((v_Vuna_dCompiler_dCodegen_dDecl_dinterpose mc0) dtb__24)))))
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCodegen_dDecl_djoinWith = (fun sep xs -> (Base_dList.dtp_concatMany ((v_Vuna_dCompiler_dCodegen_dDecl_dinterpose sep) xs)))

let v_Vuna_dCompiler_dCodegen_dDecl_dtypeParamName = (fun i -> ("'a" ^ (bi_strFromInt i)))

let v_Vuna_dCompiler_dCodegen_dDecl_dtypeParamNames = (fun n -> ((Base_dList.v_Base_dList_dmap v_Vuna_dCompiler_dCodegen_dDecl_dtypeParamName) ((Base_dList.v_Base_dList_drange 0) n)))

let v_Vuna_dCompiler_dCodegen_dDecl_dtypeParamDecl = (fun mc0 -> (if (mc0 = 0) then "" else ((fun nd_uscrut1 -> (match nd_uscrut1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__25, dtb__26) -> (match dtb__26 with
  | Base_dList.C_Base_dList_dList_Nil -> (dtb__25 ^ " ")
  | _ -> (String.concat "" ["("; ((v_Vuna_dCompiler_dCodegen_dDecl_djoinWith ", ") nd_uscrut1); ") "])
)
  | _ -> (String.concat "" ["("; ((v_Vuna_dCompiler_dCodegen_dDecl_djoinWith ", ") nd_uscrut1); ") "])
)) (v_Vuna_dCompiler_dCodegen_dDecl_dtypeParamNames mc0))))

let rec v_Vuna_dCompiler_dCodegen_dDecl_dtypeParamLevelsGo = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__27, dtb__28) -> (if (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_drigIsErased (Base_dPair.v_Base_dPair_dsecondOf dtb__27)) then (Base_dList.C_Base_dList_dList_Cons (mc1, ((v_Vuna_dCompiler_dCodegen_dDecl_dtypeParamLevelsGo dtb__28) (mc1 + 1)))) else ((v_Vuna_dCompiler_dCodegen_dDecl_dtypeParamLevelsGo dtb__28) (mc1 + 1)))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCodegen_dDecl_dtypeParamLevels = (fun d -> ((v_Vuna_dCompiler_dCodegen_dDecl_dtypeParamLevelsGo (match d with
  | Vuna_dCompiler_dElab_dTypes.C_Vuna_dCompiler_dElab_dTypes_dDtData_DtData (dtb__29, dtb__30, dtb__31, dtb__32, dtb__33, dtb__34) -> dtb__30
  | _ -> failwith "DT: impossible branch"
)) 0))

let rec v_Vuna_dCompiler_dCodegen_dDecl_dmemInt = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__35, dtb__36) -> (if (dtb__35 = mc0) then true else ((v_Vuna_dCompiler_dCodegen_dDecl_dmemInt mc0) dtb__36))
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dCodegen_dDecl_dlevelSlotGo = (fun mc0 mc1 mc2 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__37, dtb__38) -> (if (dtb__37 = mc1) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (mc2)) else (((v_Vuna_dCompiler_dCodegen_dDecl_dlevelSlotGo dtb__38) mc1) (mc2 + 1)))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCodegen_dDecl_dlevelSlot = (fun levels lvl -> (((v_Vuna_dCompiler_dCodegen_dDecl_dlevelSlotGo levels) lvl) 0))

let rec v_Vuna_dCompiler_dCodegen_dDecl_dnthValue = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__39, dtb__40) -> (if (mc1 <= 0) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__39)) else ((v_Vuna_dCompiler_dCodegen_dDecl_dnthValue dtb__40) (mc1 - 1)))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dCodegen_dDecl_dlookupUsed = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__41, dtb__42) -> (if ((Base_dPair.v_Base_dPair_dfirstOf dtb__41) = mc1) then (Base_dPair.v_Base_dPair_dsecondOf dtb__41) else ((v_Vuna_dCompiler_dCodegen_dDecl_dlookupUsed dtb__42) mc1))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dCodegen_dDecl_dcollectUsedLevelsFuel = (fun fuel tps table datas lvl v -> (if (fuel <= 0) then Base_dList.C_Base_dList_dList_Nil else (match v with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VPi (dtb__43, dtb__44, dtb__45, dtb__46, dtb__47) -> (if dtb__44 then ((((((v_Vuna_dCompiler_dCodegen_dDecl_dcollectUsedLevelsFuel (fuel - 1)) tps) table) datas) (lvl + 1)) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dapplyClosure dtb__47) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NVar (dtb__43, lvl, Base_dList.C_Base_dList_dList_Nil)))))) else ((Base_dList.v_Base_dList_dappend ((((((v_Vuna_dCompiler_dCodegen_dDecl_dcollectUsedLevelsFuel (fuel - 1)) tps) table) datas) lvl) dtb__46)) ((((((v_Vuna_dCompiler_dCodegen_dDecl_dcollectUsedLevelsFuel (fuel - 1)) tps) table) datas) (lvl + 1)) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dapplyClosure dtb__47) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NVar (dtb__43, lvl, Base_dList.C_Base_dList_dList_Nil))))))))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral (dtb__48) -> (match dtb__48 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NVar (dtb__49, dtb__50, dtb__51) -> ((Base_dList.v_Base_dList_dappend (if ((v_Vuna_dCompiler_dCodegen_dDecl_dmemInt dtb__50) tps) then (Base_dList.C_Base_dList_dList_Cons (dtb__50, Base_dList.C_Base_dList_dList_Nil)) else Base_dList.C_Base_dList_dList_Nil)) ((((((v_Vuna_dCompiler_dCodegen_dDecl_dcollectUsedSpineFuel (fuel - 1)) tps) table) datas) lvl) dtb__51))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal (dtb__52, dtb__53) -> (match ((Vuna_dCompiler_dElab_dRepresentation.v_Vuna_dCompiler_dElab_dRepresentation_dfindDtData dtb__52) datas) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__54) -> (((((((v_Vuna_dCompiler_dCodegen_dDecl_dcollectFamilyArgsFuel (fuel - 1)) tps) table) datas) lvl) ((v_Vuna_dCompiler_dCodegen_dDecl_dlookupUsed table) dtb__52)) dtb__53)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((((((v_Vuna_dCompiler_dCodegen_dDecl_dcollectUsedSpineFuel (fuel - 1)) tps) table) datas) lvl) dtb__53)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> Base_dList.C_Base_dList_dList_Nil
)))
and v_Vuna_dCompiler_dCodegen_dDecl_dcollectUsedSpineFuel = (fun mc0 mc1 mc2 mc3 mc4 mc5 -> (match mc5 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__55, dtb__56) -> (if (mc0 <= 0) then Base_dList.C_Base_dList_dList_Nil else ((Base_dList.v_Base_dList_dappend ((((((v_Vuna_dCompiler_dCodegen_dDecl_dcollectUsedLevelsFuel (mc0 - 1)) mc1) mc2) mc3) mc4) dtb__55)) ((((((v_Vuna_dCompiler_dCodegen_dDecl_dcollectUsedSpineFuel (mc0 - 1)) mc1) mc2) mc3) mc4) dtb__56)))
  | Base_dList.C_Base_dList_dList_Nil -> (if (mc0 <= 0) then Base_dList.C_Base_dList_dList_Nil else Base_dList.C_Base_dList_dList_Nil)
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dCodegen_dDecl_dcollectFamilyArgsFuel = (fun fuel tps table datas lvl usedPats args -> (if (fuel <= 0) then Base_dList.C_Base_dList_dList_Nil else (match usedPats with
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | Base_dList.C_Base_dList_dList_Cons (dtb__57, dtb__58) -> (match ((v_Vuna_dCompiler_dCodegen_dDecl_dnthValue args) dtb__57) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__59) -> ((Base_dList.v_Base_dList_dappend ((((((v_Vuna_dCompiler_dCodegen_dDecl_dcollectUsedLevelsFuel (fuel - 1)) tps) table) datas) lvl) dtb__59)) (((((((v_Vuna_dCompiler_dCodegen_dDecl_dcollectFamilyArgsFuel (fuel - 1)) tps) table) datas) lvl) dtb__58) args))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (((((((v_Vuna_dCompiler_dCodegen_dDecl_dcollectFamilyArgsFuel (fuel - 1)) tps) table) datas) lvl) dtb__58) args)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dCodegen_dDecl_dcollectUsedLevels = (fun tps table datas lvl v -> ((((((v_Vuna_dCompiler_dCodegen_dDecl_dcollectUsedLevelsFuel 256) tps) table) datas) lvl) v))

let v_Vuna_dCompiler_dCodegen_dDecl_dcollectFamilyArgs = (fun tps table datas lvl usedPats args -> (((((((v_Vuna_dCompiler_dCodegen_dDecl_dcollectFamilyArgsFuel 256) tps) table) datas) lvl) usedPats) args))

let rec v_Vuna_dCompiler_dCodegen_dDecl_dlevelListEq = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__60, dtb__61) -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__62, dtb__63) -> (if (dtb__60 = dtb__62) then ((v_Vuna_dCompiler_dCodegen_dDecl_dlevelListEq dtb__61) dtb__63) else false)
  | _ -> false
)
  | Base_dList.C_Base_dList_dList_Nil -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Nil -> true
  | _ -> false
)
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dCodegen_dDecl_dsameLevelTable = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__64, dtb__65) -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__66, dtb__67) -> (if (if ((Base_dPair.v_Base_dPair_dfirstOf dtb__64) = (Base_dPair.v_Base_dPair_dfirstOf dtb__66)) then ((v_Vuna_dCompiler_dCodegen_dDecl_dlevelListEq (Base_dPair.v_Base_dPair_dsecondOf dtb__64)) (Base_dPair.v_Base_dPair_dsecondOf dtb__66)) else false) then ((v_Vuna_dCompiler_dCodegen_dDecl_dsameLevelTable dtb__65) dtb__67) else false)
  | _ -> false
)
  | Base_dList.C_Base_dList_dList_Nil -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Nil -> true
  | _ -> false
)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCodegen_dDecl_dfamilyTyText = (fun mc0 mc1 mc2 -> (match mc2 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__68, dtb__69) -> (match dtb__69 with
  | Base_dList.C_Base_dList_dList_Nil -> (String.concat "" [dtb__68; " "; (Base_dPair.v_Base_dPair_dfirstOf ((v_Vuna_dCompiler_dCodegen_dDecl_dqualTypeText mc0) mc1))])
  | _ -> (String.concat "" ["("; ((v_Vuna_dCompiler_dCodegen_dDecl_djoinWith ", ") mc2); ") "; (Base_dPair.v_Base_dPair_dfirstOf ((v_Vuna_dCompiler_dCodegen_dDecl_dqualTypeText mc0) mc1))])
)
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dPair.v_Base_dPair_dfirstOf ((v_Vuna_dCompiler_dCodegen_dDecl_dqualTypeText mc0) mc1))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCodegen_dDecl_drenderTypeIntrinsic = (fun mc0 mc1 -> (if (mc0 = "Array") then (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__70, dtb__71) -> (match dtb__71 with
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((String.concat "" ["("; dtb__70; " array)"])))
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
) else (if (mc0 = "IORef") then (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__72, dtb__73) -> (match dtb__73 with
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((String.concat "" ["("; dtb__72; " ref)"])))
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
) else (if (mc0 = "MArray") then (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__74, dtb__75) -> (match dtb__75 with
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((String.concat "" ["("; dtb__74; " array)"])))
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
) else (if (mc0 = "Buffer") then (match mc1 with
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ("Buffer.t"))
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
) else (if (mc0 = "IO") then (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__76, dtb__77) -> (match dtb__77 with
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((String.concat "" ["(int -> "; dtb__76; ")"])))
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
) else Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing))))))

let rec v_Vuna_dCompiler_dCodegen_dDecl_drenderFamilyArgsFuel = (fun qc fuel levels table datas usedPats args -> (if (fuel <= 0) then Base_dList.C_Base_dList_dList_Nil else (match usedPats with
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | Base_dList.C_Base_dList_dList_Cons (dtb__78, dtb__79) -> (match ((v_Vuna_dCompiler_dCodegen_dDecl_dnthValue args) dtb__78) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__80) -> (Base_dList.C_Base_dList_dList_Cons (((((((v_Vuna_dCompiler_dCodegen_dDecl_drenderTypeArgFuel qc) (fuel - 1)) levels) table) datas) dtb__80), (((((((v_Vuna_dCompiler_dCodegen_dDecl_drenderFamilyArgsFuel qc) (fuel - 1)) levels) table) datas) dtb__79) args)))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (((((((v_Vuna_dCompiler_dCodegen_dDecl_drenderFamilyArgsFuel qc) (fuel - 1)) levels) table) datas) dtb__79) args)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))
and v_Vuna_dCompiler_dCodegen_dDecl_drenderTypeArgFuel = (fun qc fuel levels table datas v -> (if (fuel <= 0) then "Obj.t" else (match v with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral (dtb__81) -> (match dtb__81 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NVar (dtb__82, dtb__83, dtb__84) -> (match ((v_Vuna_dCompiler_dCodegen_dDecl_dlevelSlot levels) dtb__83) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__85) -> (v_Vuna_dCompiler_dCodegen_dDecl_dtypeParamName dtb__85)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> "Obj.t"
  | _ -> failwith "DT: impossible branch"
)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal (dtb__86, dtb__87) -> (((((((v_Vuna_dCompiler_dCodegen_dDecl_drenderTypeArgGlobal qc) fuel) levels) table) datas) dtb__86) dtb__87)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> "Obj.t"
)))
and v_Vuna_dCompiler_dCodegen_dDecl_drenderTypeArgGlobal = (fun qc fuel levels table datas g sp -> (match ((v_Vuna_dCompiler_dCodegen_dDecl_drenderTypeIntrinsic g) ((Base_dList.v_Base_dList_dmap (fun x -> ((((((v_Vuna_dCompiler_dCodegen_dDecl_drenderTypeArgFuel qc) (fuel - 1)) levels) table) datas) x))) sp)) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__88) -> dtb__88
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (if (g = Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dintTypeName) then "int" else (if (g = Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dnatTypeName) then "int" else (if (g = Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dstrTypeName) then "string" else (if (g = Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dfloatTypeName) then "float" else (if (g = Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dboolTypeName) then "bool" else (match ((Vuna_dCompiler_dElab_dRepresentation.v_Vuna_dCompiler_dElab_dRepresentation_dfindDtData g) datas) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__89) -> (((v_Vuna_dCompiler_dCodegen_dDecl_dfamilyTyText qc) g) (((((((v_Vuna_dCompiler_dCodegen_dDecl_drenderFamilyArgsFuel qc) (fuel - 1)) levels) table) datas) ((v_Vuna_dCompiler_dCodegen_dDecl_dlookupUsed table) g)) sp))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> "Obj.t"
  | _ -> failwith "DT: impossible branch"
))))))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCodegen_dDecl_drenderFamilyArgs = (fun qc levels table datas usedPats args -> (((((((v_Vuna_dCompiler_dCodegen_dDecl_drenderFamilyArgsFuel qc) 256) levels) table) datas) usedPats) args))

let v_Vuna_dCompiler_dCodegen_dDecl_drenderTypeArg = (fun qc levels table datas v -> ((((((v_Vuna_dCompiler_dCodegen_dDecl_drenderTypeArgFuel qc) 256) levels) table) datas) v))

let rec v_Vuna_dCompiler_dCodegen_dDecl_drenderPiTyFuel = (fun qc fuel levels table datas lvl v -> (if (fuel <= 0) then (((((v_Vuna_dCompiler_dCodegen_dDecl_drenderTypeArg qc) levels) table) datas) v) else (match v with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VPi (dtb__90, dtb__91, dtb__92, dtb__93, dtb__94) -> ((fun next -> (if (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_drigIsErased dtb__92) then (((((((v_Vuna_dCompiler_dCodegen_dDecl_drenderPiTyFuel qc) (fuel - 1)) levels) table) datas) (lvl + 1)) next) else (String.concat "" ["("; (((((((v_Vuna_dCompiler_dCodegen_dDecl_drenderPiTyFuel qc) (fuel - 1)) levels) table) datas) lvl) dtb__93); ") -> "; (((((((v_Vuna_dCompiler_dCodegen_dDecl_drenderPiTyFuel qc) (fuel - 1)) levels) table) datas) (lvl + 1)) next)]))) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dapplyClosure dtb__94) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NVar (dtb__90, lvl, Base_dList.C_Base_dList_dList_Nil))))))
  | _ -> (((((v_Vuna_dCompiler_dCodegen_dDecl_drenderTypeArg qc) levels) table) datas) v)
)))

let v_Vuna_dCompiler_dCodegen_dDecl_drenderPiTy = (fun qc levels table datas lvl v -> (((((((v_Vuna_dCompiler_dCodegen_dDecl_drenderPiTyFuel qc) 256) levels) table) datas) lvl) v))

let v_Vuna_dCompiler_dCodegen_dDecl_drenderFieldTy = (fun mc0 mc1 mc2 mc3 mc4 mc5 mc6 -> (match mc5 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral (dtb__95) -> (match dtb__95 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NVar (dtb__96, dtb__97, dtb__98) -> (match ((v_Vuna_dCompiler_dCodegen_dDecl_dlevelSlot mc1) dtb__97) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__99) -> (Base_dPair.C_Base_dPair_dPair_Pair ((v_Vuna_dCompiler_dCodegen_dDecl_dtypeParamName dtb__99), mc6))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (Base_dPair.C_Base_dPair_dPair_Pair ((v_Vuna_dCompiler_dCodegen_dDecl_dtypeParamName mc6), (mc6 + 1)))
  | _ -> failwith "DT: impossible branch"
)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal (dtb__100, dtb__101) -> (match ((v_Vuna_dCompiler_dCodegen_dDecl_drenderTypeIntrinsic dtb__100) ((Base_dList.v_Base_dList_dmap (fun x -> (((((v_Vuna_dCompiler_dCodegen_dDecl_drenderTypeArg mc0) mc1) mc2) mc3) x))) dtb__101)) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__102) -> (Base_dPair.C_Base_dPair_dPair_Pair (dtb__102, mc6))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (if (dtb__100 = Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dintTypeName) then (Base_dPair.C_Base_dPair_dPair_Pair ("int", mc6)) else (if (dtb__100 = Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dnatTypeName) then (Base_dPair.C_Base_dPair_dPair_Pair ("int", mc6)) else (if (dtb__100 = Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dstrTypeName) then (Base_dPair.C_Base_dPair_dPair_Pair ("string", mc6)) else (if (dtb__100 = Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dfloatTypeName) then (Base_dPair.C_Base_dPair_dPair_Pair ("float", mc6)) else (if (dtb__100 = Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dboolTypeName) then (Base_dPair.C_Base_dPair_dPair_Pair ("bool", mc6)) else (match ((Vuna_dCompiler_dElab_dRepresentation.v_Vuna_dCompiler_dElab_dRepresentation_dfindDtData dtb__100) mc3) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__103) -> (Base_dPair.C_Base_dPair_dPair_Pair ((((v_Vuna_dCompiler_dCodegen_dDecl_dfamilyTyText mc0) dtb__100) ((((((v_Vuna_dCompiler_dCodegen_dDecl_drenderFamilyArgs mc0) mc1) mc2) mc3) ((v_Vuna_dCompiler_dCodegen_dDecl_dlookupUsed mc2) dtb__100)) dtb__101)), mc6))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (Base_dPair.C_Base_dPair_dPair_Pair ((v_Vuna_dCompiler_dCodegen_dDecl_dtypeParamName mc6), (mc6 + 1)))
  | _ -> failwith "DT: impossible branch"
))))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VPi (dtb__104, dtb__105, dtb__106, dtb__107, dtb__108) -> (if dtb__105 then (Base_dPair.C_Base_dPair_dPair_Pair ((v_Vuna_dCompiler_dCodegen_dDecl_dtypeParamName mc6), (mc6 + 1))) else (Base_dPair.C_Base_dPair_dPair_Pair (((((((v_Vuna_dCompiler_dCodegen_dDecl_drenderPiTy mc0) mc1) mc2) mc3) mc4) mc5), mc6)))
  | _ -> (Base_dPair.C_Base_dPair_dPair_Pair ((v_Vuna_dCompiler_dCodegen_dDecl_dtypeParamName mc6), (mc6 + 1)))
))

let v_Vuna_dCompiler_dCodegen_dDecl_dflagMatchesRig = (fun mc0 mc1 -> (if mc0 then (Base_dBool.v_Base_dBool_dnot (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_drigIsErased mc1)) else (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_drigIsErased mc1)))

let rec v_Vuna_dCompiler_dCodegen_dDecl_dctorShapeOf = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__109, dtb__110) -> ((Base_dList.v_Base_dList_dappend ((Base_dList.v_Base_dList_dmap (fun c -> (Base_dPair.C_Base_dPair_dPair_Pair ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorName c), (Vuna_dCompiler_dElab_dRepresentation.v_Vuna_dCompiler_dElab_dRepresentation_dctorKeepFlags c))))) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataCtors dtb__109))) (v_Vuna_dCompiler_dCodegen_dDecl_dctorShapeOf dtb__110))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCodegen_dDecl_disTypeHeadOpaqueDatas = (fun datas name -> (if (name = Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dboolTypeName) then false else (if (name = Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dnatTypeName) then false else (match ((Vuna_dCompiler_dElab_dRepresentation.v_Vuna_dCompiler_dElab_dRepresentation_dfindDtData name) datas) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__111) -> false
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (Base_dBool.v_Base_dBool_dnot (Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_disTypeConstructorName name))
  | _ -> failwith "DT: impossible branch"
))))

let rec v_Vuna_dCompiler_dCodegen_dDecl_dmemOpaqueLevel = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__112, dtb__113) -> (if (dtb__112 = mc0) then true else ((v_Vuna_dCompiler_dCodegen_dDecl_dmemOpaqueLevel mc0) dtb__113))
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dCodegen_dDecl_dctorUsedLevels = (fun mc0 mc1 mc2 mc3 mc4 mc5 mc6 -> (match mc4 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__114, dtb__115) -> (match dtb__114 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__116, dtb__117) -> (match mc6 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VPi (dtb__118, dtb__119, dtb__120, dtb__121, dtb__122) -> ((fun opaque -> ((fun fam2 -> ((fun next -> (if (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_drigIsErased dtb__117) then (((((((v_Vuna_dCompiler_dCodegen_dDecl_dctorUsedLevels mc0) mc1) mc2) fam2) dtb__115) (mc5 + 1)) next) else (if opaque then (((((((v_Vuna_dCompiler_dCodegen_dDecl_dctorUsedLevels mc0) mc1) mc2) fam2) dtb__115) (mc5 + 1)) next) else ((Base_dList.v_Base_dList_dappend (((((v_Vuna_dCompiler_dCodegen_dDecl_dcollectUsedLevels mc0) mc1) mc2) mc5) dtb__121)) (((((((v_Vuna_dCompiler_dCodegen_dDecl_dctorUsedLevels mc0) mc1) mc2) fam2) dtb__115) (mc5 + 1)) next))))) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dapplyClosure dtb__122) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NVar (dtb__118, mc5, Base_dList.C_Base_dList_dList_Nil))))))) (if (Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_disFamilyKindValue dtb__121) then (Base_dList.C_Base_dList_dList_Cons (mc5, mc3)) else mc3))) (((((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dvalueOpaqueScoped (fun l -> ((v_Vuna_dCompiler_dCodegen_dDecl_dmemOpaqueLevel l) mc3))) (v_Vuna_dCompiler_dCodegen_dDecl_disTypeHeadOpaqueDatas mc2)) mc5) mc3) dtb__121))
  | _ -> Base_dList.C_Base_dList_dList_Nil
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCodegen_dDecl_ddataUsedLevels = (fun d table datas -> ((fun raw -> ((Base_dList.v_Base_dList_dfilter (fun l -> ((v_Vuna_dCompiler_dCodegen_dDecl_dmemInt l) raw))) (v_Vuna_dCompiler_dCodegen_dDecl_dtypeParamLevels d))) ((Base_dList.v_Base_dList_dconcatMap (fun c -> (((((((v_Vuna_dCompiler_dCodegen_dDecl_dctorUsedLevels (v_Vuna_dCompiler_dCodegen_dDecl_dtypeParamLevels d)) table) datas) Base_dList.C_Base_dList_dList_Nil) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorTelescope c)) 0) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_deval Base_dList.C_Base_dList_dList_Nil) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorType c))))) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataCtors d))))

let rec v_Vuna_dCompiler_dCodegen_dDecl_dusedTableFixFuel = (fun fuel datas table -> (if (fuel <= 0) then table else ((fun next -> (if ((v_Vuna_dCompiler_dCodegen_dDecl_dsameLevelTable next) table) then next else (((v_Vuna_dCompiler_dCodegen_dDecl_dusedTableFixFuel (fuel - 1)) datas) next))) ((Base_dList.v_Base_dList_dmap (fun d -> (Base_dPair.C_Base_dPair_dPair_Pair ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataName d), (((v_Vuna_dCompiler_dCodegen_dDecl_ddataUsedLevels d) table) datas))))) datas))))

let v_Vuna_dCompiler_dCodegen_dDecl_dusedTableFix = (fun datas table -> (((v_Vuna_dCompiler_dCodegen_dDecl_dusedTableFixFuel 64) datas) table))

let rec v_Vuna_dCompiler_dCodegen_dDecl_dctorOpaqueGo = (fun mc0 mc1 mc2 mc3 mc4 mc5 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__123, dtb__124) -> (match dtb__123 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__125, dtb__126) -> (match mc3 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VPi (dtb__127, dtb__128, dtb__129, dtb__130, dtb__131) -> ((fun flag -> ((fun fam2 -> ((fun next -> ((((((v_Vuna_dCompiler_dCodegen_dDecl_dctorOpaqueGo mc0) dtb__124) (mc2 + 1)) next) fam2) (Base_dList.C_Base_dList_dList_Cons (flag, mc5)))) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dapplyClosure dtb__131) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NVar (dtb__127, mc2, Base_dList.C_Base_dList_dList_Nil))))))) (if (Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_disFamilyKindValue dtb__130) then (Base_dList.C_Base_dList_dList_Cons (mc2, mc4)) else mc4))) (if (Base_dBool.v_Base_dBool_dnot (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_drigIsErased dtb__126)) then (((((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dvalueOpaqueScoped (fun l -> ((v_Vuna_dCompiler_dCodegen_dDecl_dmemOpaqueLevel l) mc4))) (v_Vuna_dCompiler_dCodegen_dDecl_disTypeHeadOpaqueDatas mc0)) mc2) mc4) dtb__130) else false))
  | _ -> (Base_dList.v_Base_dList_dreverse mc5)
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dList.v_Base_dList_dreverse mc5)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCodegen_dDecl_dctorOpaqueFlagsOf = (fun datas c -> ((((((v_Vuna_dCompiler_dCodegen_dDecl_dctorOpaqueGo datas) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorTelescope c)) 0) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_deval Base_dList.C_Base_dList_dList_Nil) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorType c))) Base_dList.C_Base_dList_dList_Nil) Base_dList.C_Base_dList_dList_Nil))

let v_Vuna_dCompiler_dCodegen_dDecl_dctorOpaqueTableOf = (fun datas -> ((Base_dList.v_Base_dList_dconcatMap (fun d -> ((Base_dList.v_Base_dList_dmap (fun c -> (Base_dPair.C_Base_dPair_dPair_Pair ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorName c), ((v_Vuna_dCompiler_dCodegen_dDecl_dctorOpaqueFlagsOf datas) c))))) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataCtors d)))) datas))

let rec v_Vuna_dCompiler_dCodegen_dDecl_dctorOpaqueKeptFlags = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__132, dtb__133) -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__134, dtb__135) -> (if dtb__132 then (Base_dList.C_Base_dList_dList_Cons (dtb__134, ((v_Vuna_dCompiler_dCodegen_dDecl_dctorOpaqueKeptFlags dtb__133) dtb__135))) else ((v_Vuna_dCompiler_dCodegen_dDecl_dctorOpaqueKeptFlags dtb__133) dtb__135))
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
  | Base_dList.C_Base_dList_dList_Cons (dtb__136, dtb__137) -> (match mc5 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__138, dtb__139) -> (match mc6 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__140, dtb__141) -> (match dtb__140 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__142, dtb__143) -> (if ((v_Vuna_dCompiler_dCodegen_dDecl_dflagMatchesRig dtb__136) dtb__143) then (match mc8 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VPi (dtb__144, dtb__145, dtb__146, dtb__147, dtb__148) -> ((fun next -> (if dtb__136 then (if dtb__138 then ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((((((((v_Vuna_dCompiler_dCodegen_dDecl_dctorFieldTexts mc0) mc1) mc2) mc3) dtb__137) dtb__139) dtb__141) (mc7 + 1)) next) mc9)) (fun p -> (match p with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__149, dtb__150) -> (Base_dResult.C_Base_dResult_dResult_Ok ((Base_dPair.C_Base_dPair_dPair_Pair ((Base_dList.C_Base_dList_dList_Cons ("Obj.t", dtb__149)), dtb__150))))
  | _ -> failwith "DT: impossible branch"
))) else (match (((((((v_Vuna_dCompiler_dCodegen_dDecl_drenderFieldTy mc0) mc1) mc2) mc3) mc7) dtb__147) mc9) with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__151, dtb__152) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((((((((v_Vuna_dCompiler_dCodegen_dDecl_dctorFieldTexts mc0) mc1) mc2) mc3) dtb__137) dtb__139) dtb__141) (mc7 + 1)) next) dtb__152)) (fun p -> (match p with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__153, dtb__154) -> (Base_dResult.C_Base_dResult_dResult_Ok ((Base_dPair.C_Base_dPair_dPair_Pair ((Base_dList.C_Base_dList_dList_Cons (dtb__151, dtb__153)), dtb__154))))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)) else ((((((((((v_Vuna_dCompiler_dCodegen_dDecl_dctorFieldTexts mc0) mc1) mc2) mc3) dtb__137) dtb__139) dtb__141) (mc7 + 1)) next) mc9))) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dapplyClosure dtb__148) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NVar (dtb__144, mc7, Base_dList.C_Base_dList_dList_Nil))))))
  | _ -> (Base_dResult.C_Base_dResult_dResult_Err ("DT: internal: constructor telescope does not match its type"))
) else (Base_dResult.C_Base_dResult_dResult_Err ("DT: internal: constructor keep flag disagrees with telescope rig")))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dResult.C_Base_dResult_dResult_Ok ((Base_dPair.C_Base_dPair_dPair_Pair (Base_dList.C_Base_dList_dList_Nil, mc9))))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> (match mc6 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__155, dtb__156) -> (Base_dResult.C_Base_dResult_dResult_Err ("DT: internal: constructor opaque flags shorter than its shape"))
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dResult.C_Base_dResult_dResult_Ok ((Base_dPair.C_Base_dPair_dPair_Pair (Base_dList.C_Base_dList_dList_Nil, mc9))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> (match mc5 with
  | Base_dList.C_Base_dList_dList_Nil -> (match mc6 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__157, dtb__158) -> (Base_dResult.C_Base_dResult_dResult_Err ("DT: internal: constructor shape has more binders than its telescope"))
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dResult.C_Base_dResult_dResult_Ok ((Base_dPair.C_Base_dPair_dPair_Pair (Base_dList.C_Base_dList_dList_Nil, mc9))))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Cons (dtb__159, dtb__160) -> (match mc6 with
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dResult.C_Base_dResult_dResult_Ok ((Base_dPair.C_Base_dPair_dPair_Pair (Base_dList.C_Base_dList_dList_Nil, mc9))))
  | _ -> (Base_dResult.C_Base_dResult_dResult_Err ("DT: internal: constructor opaque flags longer than its shape"))
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCodegen_dDecl_dctorArityNeed = (fun qc levels table datas c -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((((((((v_Vuna_dCompiler_dCodegen_dDecl_dctorFieldTexts qc) levels) table) datas) (Vuna_dCompiler_dElab_dRepresentation.v_Vuna_dCompiler_dElab_dRepresentation_dctorKeepFlags c)) ((v_Vuna_dCompiler_dCodegen_dDecl_dctorOpaqueFlagsOf datas) c)) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorTelescope c)) 0) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_deval Base_dList.C_Base_dList_dList_Nil) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorType c))) (Base_dList.v_Base_dList_dlength levels))) (fun p -> (Base_dResult.C_Base_dResult_dResult_Ok (((Base_dPair.v_Base_dPair_dsecondOf p) - (Base_dList.v_Base_dList_dlength levels)))))))

let rec v_Vuna_dCompiler_dCodegen_dDecl_dmaxIntList = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__161, dtb__162) -> (if (dtb__161 >= (v_Vuna_dCompiler_dCodegen_dDecl_dmaxIntList dtb__162)) then dtb__161 else (v_Vuna_dCompiler_dCodegen_dDecl_dmaxIntList dtb__162))
  | Base_dList.C_Base_dList_dList_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCodegen_dDecl_ddataArityNeed = (fun qc levels table datas ctors -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((Base_dResult.v_Base_dResult_dtraverse ((((v_Vuna_dCompiler_dCodegen_dDecl_dctorArityNeed qc) levels) table) datas)) ctors)) (fun ns -> (Base_dResult.C_Base_dResult_dResult_Ok (((Base_dList.v_Base_dList_dlength levels) + (v_Vuna_dCompiler_dCodegen_dDecl_dmaxIntList ns)))))))

let v_Vuna_dCompiler_dCodegen_dDecl_dparenOne = (fun t -> (String.concat "" ["("; t; ")"]))

let rec v_Vuna_dCompiler_dCodegen_dDecl_dparenList = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__163, dtb__164) -> ((Base_dList.v_Base_dList_dappend (Base_dList.C_Base_dList_dList_Cons ((v_Vuna_dCompiler_dCodegen_dDecl_dparenOne dtb__163), Base_dList.C_Base_dList_dList_Nil))) (v_Vuna_dCompiler_dCodegen_dDecl_dparenList dtb__164))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCodegen_dDecl_dctorDeclText = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__165, dtb__166) -> (match dtb__166 with
  | Base_dList.C_Base_dList_dList_Nil -> (String.concat "" [mc0; " of "; (v_Vuna_dCompiler_dCodegen_dDecl_dparenOne dtb__165)])
  | _ -> (String.concat "" [mc0; " of "; ((v_Vuna_dCompiler_dCodegen_dDecl_djoinWith " * ") (v_Vuna_dCompiler_dCodegen_dDecl_dparenList mc1))])
)
  | Base_dList.C_Base_dList_dList_Nil -> mc0
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCodegen_dDecl_dgenCtorDecl = (fun qc levels table datas c -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((((((((v_Vuna_dCompiler_dCodegen_dDecl_dctorFieldTexts qc) levels) table) datas) (Vuna_dCompiler_dElab_dRepresentation.v_Vuna_dCompiler_dElab_dRepresentation_dctorKeepFlags c)) ((v_Vuna_dCompiler_dCodegen_dDecl_dctorOpaqueFlagsOf datas) c)) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorTelescope c)) 0) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_deval Base_dList.C_Base_dList_dList_Nil) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorType c))) (Base_dList.v_Base_dList_dlength levels))) (fun p -> (Base_dResult.C_Base_dResult_dResult_Ok (((v_Vuna_dCompiler_dCodegen_dDecl_dctorDeclText ((v_Vuna_dCompiler_dCodegen_dDecl_dctorOcamlName (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorFamily c)) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorName c))) (Base_dPair.v_Base_dPair_dfirstOf p)))))))

let v_Vuna_dCompiler_dCodegen_dDecl_dgenUnboxedDataDecl = (fun qc levels table datas d c idx -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((((((((v_Vuna_dCompiler_dCodegen_dDecl_dctorFieldTexts qc) levels) table) datas) (Vuna_dCompiler_dElab_dRepresentation.v_Vuna_dCompiler_dElab_dRepresentation_dctorKeepFlags c)) ((v_Vuna_dCompiler_dCodegen_dDecl_dctorOpaqueFlagsOf datas) c)) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorTelescope c)) 0) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_deval Base_dList.C_Base_dList_dList_Nil) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorType c))) (Base_dList.v_Base_dList_dlength levels))) (fun p -> (match (Base_dPair.v_Base_dPair_dfirstOf p) with
  | Base_dList.C_Base_dList_dList_Cons (dtb__167, dtb__168) -> (match dtb__168 with
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dResult.C_Base_dResult_dResult_Ok ((String.concat "" [(v_Vuna_dCompiler_dCodegen_dDecl_dtypeParamDecl (Base_dPair.v_Base_dPair_dsecondOf p)); (v_Vuna_dCompiler_dCodegen_dDecl_dtypeName (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataName d)); " = "; dtb__167])))
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
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((((v_Vuna_dCompiler_dCodegen_dDecl_ddataArityNeed qc) levels) table) datas) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataCtors d))) (fun arity -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((Base_dResult.v_Base_dResult_dtraverse ((((v_Vuna_dCompiler_dCodegen_dDecl_dgenCtorDecl qc) levels) table) datas)) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataCtors d))) (fun cs -> (Base_dResult.C_Base_dResult_dResult_Ok ((String.concat "" [(v_Vuna_dCompiler_dCodegen_dDecl_dtypeParamDecl arity); (v_Vuna_dCompiler_dCodegen_dDecl_dtypeName (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataName d)); " = "; (v_Vuna_dCompiler_dCodegen_dDecl_dctorBodyText cs)])))))))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__169) -> (match dtb__169 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__170, dtb__171) -> (((((((v_Vuna_dCompiler_dCodegen_dDecl_dgenUnboxedDataDecl qc) levels) table) datas) d) dtb__170) dtb__171)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) ((Vuna_dCompiler_dElab_dRepresentation.v_Vuna_dCompiler_dElab_dRepresentation_dlookupUnboxedInfo (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataName d)) unboxed))) ((v_Vuna_dCompiler_dCodegen_dDecl_dlookupUsed table) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataName d))))

let v_Vuna_dCompiler_dCodegen_dDecl_disBoolFamilyName = (fun name -> (name = Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dboolTypeName))

let v_Vuna_dCompiler_dCodegen_dDecl_disNatFamilyName = (fun name -> (name = Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dnatTypeName))

let v_Vuna_dCompiler_dCodegen_dDecl_druntimeDatas = (fun datas -> ((Base_dList.v_Base_dList_dfilter (fun d -> (if (Base_dBool.v_Base_dBool_dnot (v_Vuna_dCompiler_dCodegen_dDecl_disBoolFamilyName (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataName d))) then (Base_dBool.v_Base_dBool_dnot (v_Vuna_dCompiler_dCodegen_dDecl_disNatFamilyName (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataName d))) else false))) datas))

let v_Vuna_dCompiler_dCodegen_dDecl_dusedTableOf = (fun datas -> ((v_Vuna_dCompiler_dCodegen_dDecl_dusedTableFix datas) ((Base_dList.v_Base_dList_dmap (fun d -> (Base_dPair.C_Base_dPair_dPair_Pair ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataName d), Base_dList.C_Base_dList_dList_Nil)))) datas)))

let v_Vuna_dCompiler_dCodegen_dDecl_dgenTypeDeclsWith = (fun mc0 mc1 mc2 mc3 -> (match mc3 with
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dResult.C_Base_dResult_dResult_Ok (""))
  | _ -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((Base_dResult.v_Base_dResult_dtraverse ((((v_Vuna_dCompiler_dCodegen_dDecl_dgenDataDecl mc0) mc1) mc2) (Vuna_dCompiler_dElab_dRepresentation.v_Vuna_dCompiler_dElab_dRepresentation_dunboxedInfoOf mc2))) mc3)) (fun parts -> (Base_dResult.C_Base_dResult_dResult_Ok ((String.concat "" ["type "; ((v_Vuna_dCompiler_dCodegen_dDecl_djoinWith "\nand ") parts); "\n\n"])))))
))

let v_Vuna_dCompiler_dCodegen_dDecl_dgenTypeDeclsOf = (fun qc allDatas subset -> ((((v_Vuna_dCompiler_dCodegen_dDecl_dgenTypeDeclsWith qc) (v_Vuna_dCompiler_dCodegen_dDecl_dusedTableOf allDatas)) allDatas) subset))

let v_Vuna_dCompiler_dCodegen_dDecl_dcollectUsedSpine = (fun a1 a2 a3 a4 a5 -> ((((((v_Vuna_dCompiler_dCodegen_dDecl_dcollectUsedSpineFuel 512) a1) a2) a3) a4) a5))
