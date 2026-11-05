open Vuna_runtime
type t_Vuna_dCompiler_dCodegen_dDecl_dQualCtx = C_Vuna_dCompiler_dCodegen_dDecl_dQualCtx_Vuna_dCompiler_dCodegen_dDecl_dQualCtx of (string) * (string Base_dHashMap.t_Base_dHashMap_dHashMap) * (string Base_dHashMap.t_Base_dHashMap_dHashMap)

let v_Vuna_dCompiler_dCodegen_dDecl_disAsciiAlphaNum = (fun c -> (if (if (if (c >= 65) then (c <= 90) else false) then true else (if (c >= 97) then (c <= 122) else false)) then true else (if (c >= 48) then (c <= 57) else false)))

let v_Vuna_dCompiler_dCodegen_dDecl_dsanitizeChar = (fun mc0 -> (if (mc0 = 46) then (Base_dList.C_Base_dList_dList_Base_dList_dCons (95, (Base_dList.C_Base_dList_dList_Base_dList_dCons (100, Base_dList.C_Base_dList_dList_Base_dList_dNil)))) else (if (mc0 = 95) then (Base_dList.C_Base_dList_dList_Base_dList_dCons (95, (Base_dList.C_Base_dList_dList_Base_dList_dCons (117, Base_dList.C_Base_dList_dList_Base_dList_dNil)))) else (if (mc0 = 39) then (Base_dList.C_Base_dList_dList_Base_dList_dCons (95, (Base_dList.C_Base_dList_dList_Base_dList_dCons (112, Base_dList.C_Base_dList_dList_Base_dList_dNil)))) else (if (mc0 = 35) then (Base_dList.C_Base_dList_dList_Base_dList_dCons (95, (Base_dList.C_Base_dList_dList_Base_dList_dCons (104, Base_dList.C_Base_dList_dList_Base_dList_dNil)))) else (if (v_Vuna_dCompiler_dCodegen_dDecl_disAsciiAlphaNum mc0) then (Base_dList.C_Base_dList_dList_Base_dList_dCons (mc0, Base_dList.C_Base_dList_dList_Base_dList_dNil)) else (Base_dList.dtp_unpack (String.concat "" ["_x"; (bi_strFromInt mc0); "_"]))))))))

let v_Vuna_dCompiler_dCodegen_dDecl_dsanitizeName = (fun name -> (Base_dList.dtp_pack ((Base_dList.v_Base_dList_dconcatMap v_Vuna_dCompiler_dCodegen_dDecl_dsanitizeChar) (Base_dList.dtp_unpack name))))

let v_Vuna_dCompiler_dCodegen_dDecl_docamlPad3 = (fun s -> (if ((bi_strLength s) = 1) then ("00" ^ s) else (if ((bi_strLength s) = 2) then ("0" ^ s) else s)))

let v_Vuna_dCompiler_dCodegen_dDecl_docamlEscapeChar = (fun mc0 -> (if (mc0 = 34) then (Base_dList.C_Base_dList_dList_Base_dList_dCons (92, (Base_dList.C_Base_dList_dList_Base_dList_dCons (34, Base_dList.C_Base_dList_dList_Base_dList_dNil)))) else (if (mc0 = 92) then (Base_dList.C_Base_dList_dList_Base_dList_dCons (92, (Base_dList.C_Base_dList_dList_Base_dList_dCons (92, Base_dList.C_Base_dList_dList_Base_dList_dNil)))) else (if (mc0 = 10) then (Base_dList.C_Base_dList_dList_Base_dList_dCons (92, (Base_dList.C_Base_dList_dList_Base_dList_dCons (110, Base_dList.C_Base_dList_dList_Base_dList_dNil)))) else (if (mc0 = 9) then (Base_dList.C_Base_dList_dList_Base_dList_dCons (92, (Base_dList.C_Base_dList_dList_Base_dList_dCons (116, Base_dList.C_Base_dList_dList_Base_dList_dNil)))) else (if (mc0 = 13) then (Base_dList.C_Base_dList_dList_Base_dList_dCons (92, (Base_dList.C_Base_dList_dList_Base_dList_dCons (114, Base_dList.C_Base_dList_dList_Base_dList_dNil)))) else (if (if (mc0 >= 32) then (mc0 <= 126) else false) then (Base_dList.C_Base_dList_dList_Base_dList_dCons (mc0, Base_dList.C_Base_dList_dList_Base_dList_dNil)) else (Base_dList.dtp_unpack ("\\" ^ (v_Vuna_dCompiler_dCodegen_dDecl_docamlPad3 (bi_strFromInt mc0)))))))))))

let v_Vuna_dCompiler_dCodegen_dDecl_docamlString = (fun s -> (String.concat "" ["\""; (Base_dList.dtp_pack ((Base_dList.v_Base_dList_dconcatMap v_Vuna_dCompiler_dCodegen_dDecl_docamlEscapeChar) (Base_dList.dtp_unpack s))); "\""]))

let v_Vuna_dCompiler_dCodegen_dDecl_dvalueName = (fun name -> ("v_" ^ (v_Vuna_dCompiler_dCodegen_dDecl_dsanitizeName name)))

let v_Vuna_dCompiler_dCodegen_dDecl_dboolText = (fun b -> (if b then "true" else "false"))

let v_Vuna_dCompiler_dCodegen_dDecl_dtypeName = (fun name -> ("t_" ^ (v_Vuna_dCompiler_dCodegen_dDecl_dsanitizeName name)))

let v_Vuna_dCompiler_dCodegen_dDecl_dctorOcamlName = (fun family ctor -> (String.concat "" ["C_"; (v_Vuna_dCompiler_dCodegen_dDecl_dsanitizeName family); "_"; (v_Vuna_dCompiler_dCodegen_dDecl_dsanitizeName ctor)]))

let v_Vuna_dCompiler_dCodegen_dDecl_dnoQual = (C_Vuna_dCompiler_dCodegen_dDecl_dQualCtx_Vuna_dCompiler_dCodegen_dDecl_dQualCtx ("", (Base_dHashMap.v_Base_dHashMap_dfromList Base_dList.C_Base_dList_dList_Base_dList_dNil), (Base_dHashMap.v_Base_dHashMap_dfromList Base_dList.C_Base_dList_dList_Base_dList_dNil)))

let v_Vuna_dCompiler_dCodegen_dDecl_dunitTblOf = (fun pairs -> ((Base_dHashMap.v_Base_dHashMap_dinsertAll pairs) (Base_dHashMap.v_Base_dHashMap_dfromList Base_dList.C_Base_dList_dList_Base_dList_dNil)))

let v_Vuna_dCompiler_dCodegen_dDecl_dunitOfTbl = (fun tbl name -> (match ((Base_dHashMap.v_Base_dHashMap_dlookup name) tbl) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__0) -> dtb__0
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ""
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCodegen_dDecl_dqualOf = (fun unit defs datas -> (C_Vuna_dCompiler_dCodegen_dDecl_dQualCtx_Vuna_dCompiler_dCodegen_dDecl_dQualCtx (unit, (v_Vuna_dCompiler_dCodegen_dDecl_dunitTblOf defs), (v_Vuna_dCompiler_dCodegen_dDecl_dunitTblOf datas))))

let v_Vuna_dCompiler_dCodegen_dDecl_dqualPrefix = (fun qc owner text -> (if (if (owner = "") then true else (owner = (match qc with
  | C_Vuna_dCompiler_dCodegen_dDecl_dQualCtx_Vuna_dCompiler_dCodegen_dDecl_dQualCtx (dtb__1, dtb__2, dtb__3) -> dtb__1
  | _ -> failwith "DT: impossible branch"
))) then (Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (text, "")) else (Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ((String.concat "" [owner; "."; text]), owner))))

let v_Vuna_dCompiler_dCodegen_dDecl_dqualValueText = (fun qc name -> (((v_Vuna_dCompiler_dCodegen_dDecl_dqualPrefix qc) ((v_Vuna_dCompiler_dCodegen_dDecl_dunitOfTbl (match qc with
  | C_Vuna_dCompiler_dCodegen_dDecl_dQualCtx_Vuna_dCompiler_dCodegen_dDecl_dQualCtx (dtb__4, dtb__5, dtb__6) -> dtb__5
  | _ -> failwith "DT: impossible branch"
)) name)) (v_Vuna_dCompiler_dCodegen_dDecl_dvalueName name)))

let v_Vuna_dCompiler_dCodegen_dDecl_dqualCtorText = (fun qc family ctor -> (((v_Vuna_dCompiler_dCodegen_dDecl_dqualPrefix qc) ((v_Vuna_dCompiler_dCodegen_dDecl_dunitOfTbl (match qc with
  | C_Vuna_dCompiler_dCodegen_dDecl_dQualCtx_Vuna_dCompiler_dCodegen_dDecl_dQualCtx (dtb__7, dtb__8, dtb__9) -> dtb__9
  | _ -> failwith "DT: impossible branch"
)) family)) ((v_Vuna_dCompiler_dCodegen_dDecl_dctorOcamlName family) ctor)))

let v_Vuna_dCompiler_dCodegen_dDecl_dqualTypeText = (fun qc name -> (((v_Vuna_dCompiler_dCodegen_dDecl_dqualPrefix qc) ((v_Vuna_dCompiler_dCodegen_dDecl_dunitOfTbl (match qc with
  | C_Vuna_dCompiler_dCodegen_dDecl_dQualCtx_Vuna_dCompiler_dCodegen_dDecl_dQualCtx (dtb__10, dtb__11, dtb__12) -> dtb__12
  | _ -> failwith "DT: impossible branch"
)) name)) (v_Vuna_dCompiler_dCodegen_dDecl_dtypeName name)))

let rec v_Vuna_dCompiler_dCodegen_dDecl_daddUniqueName = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__13, dtb__14) -> (if (dtb__13 = mc0) then (Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__13, dtb__14)) else (Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__13, ((v_Vuna_dCompiler_dCodegen_dDecl_daddUniqueName mc0) dtb__14))))
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (Base_dList.C_Base_dList_dList_Base_dList_dCons (mc0, Base_dList.C_Base_dList_dList_Base_dList_dNil))
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dCodegen_dDecl_dtermGlobalNames = (fun mc0 mc1 -> (match mc1 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTIf (dtb__15, dtb__16, dtb__17) -> ((v_Vuna_dCompiler_dCodegen_dDecl_dtermGlobalNames ((v_Vuna_dCompiler_dCodegen_dDecl_dtermGlobalNames ((v_Vuna_dCompiler_dCodegen_dDecl_dtermGlobalNames mc0) dtb__15)) dtb__16)) dtb__17)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTBool (dtb__18) -> mc0
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTStr (dtb__19) -> mc0
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTInt (dtb__20) -> mc0
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCase (dtb__21, dtb__22) -> ((v_Vuna_dCompiler_dCodegen_dDecl_dtermGlobalNamesInAlts ((v_Vuna_dCompiler_dCodegen_dDecl_dtermGlobalNames mc0) dtb__21)) dtb__22)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCon (dtb__23, dtb__24) -> ((v_Vuna_dCompiler_dCodegen_dDecl_dtermGlobalNamesInArgs mc0) dtb__24)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp (dtb__25, dtb__26, dtb__27) -> ((v_Vuna_dCompiler_dCodegen_dDecl_dtermGlobalNames ((v_Vuna_dCompiler_dCodegen_dDecl_dtermGlobalNames mc0) dtb__25)) dtb__26)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTLam (dtb__28, dtb__29, dtb__30) -> ((v_Vuna_dCompiler_dCodegen_dDecl_dtermGlobalNames mc0) dtb__30)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTPi (dtb__31, dtb__32, dtb__33, dtb__34, dtb__35) -> ((v_Vuna_dCompiler_dCodegen_dDecl_dtermGlobalNames ((v_Vuna_dCompiler_dCodegen_dDecl_dtermGlobalNames mc0) dtb__34)) dtb__35)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTType (dtb__36) -> mc0
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTMeta (dtb__37) -> mc0
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTVar (dtb__38, dtb__39) -> mc0
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTGlobal (dtb__40) -> ((v_Vuna_dCompiler_dCodegen_dDecl_daddUniqueName dtb__40) mc0)
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dCodegen_dDecl_dtermGlobalNamesInArgs = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__41, dtb__42) -> ((v_Vuna_dCompiler_dCodegen_dDecl_dtermGlobalNamesInArgs ((v_Vuna_dCompiler_dCodegen_dDecl_dtermGlobalNames mc0) (Base_dPair.v_Base_dPair_dfirstOf dtb__41))) dtb__42)
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> mc0
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dCodegen_dDecl_dtermGlobalNamesInAlts = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__43, dtb__44) -> ((v_Vuna_dCompiler_dCodegen_dDecl_dtermGlobalNamesInAlts ((v_Vuna_dCompiler_dCodegen_dDecl_dtermGlobalNames mc0) (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dcaseAltBody dtb__43))) dtb__44)
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> mc0
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dCodegen_dDecl_ddataTypeGlobalNamesGo = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__45, dtb__46) -> ((v_Vuna_dCompiler_dCodegen_dDecl_ddataTypeGlobalNamesGo ((v_Vuna_dCompiler_dCodegen_dDecl_dtermGlobalNames mc0) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorType dtb__45))) dtb__46)
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> mc0
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCodegen_dDecl_ddataTypeGlobalNames = (fun d -> ((v_Vuna_dCompiler_dCodegen_dDecl_ddataTypeGlobalNamesGo Base_dList.C_Base_dList_dList_Base_dList_dNil) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataCtors d)))

let rec v_Vuna_dCompiler_dCodegen_dDecl_dtypeDepsOfGo = (fun mc0 mc1 mc2 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__47, dtb__48) -> ((fun owner -> (if (if (owner = "") then true else (owner = (match mc0 with
  | C_Vuna_dCompiler_dCodegen_dDecl_dQualCtx_Vuna_dCompiler_dCodegen_dDecl_dQualCtx (dtb__49, dtb__50, dtb__51) -> dtb__49
  | _ -> failwith "DT: impossible branch"
))) then (((v_Vuna_dCompiler_dCodegen_dDecl_dtypeDepsOfGo mc0) dtb__48) mc2) else (if ((Base_dList.v_Base_dList_dmemName owner) mc2) then (((v_Vuna_dCompiler_dCodegen_dDecl_dtypeDepsOfGo mc0) dtb__48) mc2) else (((v_Vuna_dCompiler_dCodegen_dDecl_dtypeDepsOfGo mc0) dtb__48) (Base_dList.C_Base_dList_dList_Base_dList_dCons (owner, mc2)))))) ((v_Vuna_dCompiler_dCodegen_dDecl_dunitOfTbl (match mc0 with
  | C_Vuna_dCompiler_dCodegen_dDecl_dQualCtx_Vuna_dCompiler_dCodegen_dDecl_dQualCtx (dtb__52, dtb__53, dtb__54) -> dtb__54
  | _ -> failwith "DT: impossible branch"
)) dtb__47))
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (Base_dList.v_Base_dList_dreverse mc2)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCodegen_dDecl_dtypeDepsOf = (fun qc datas -> (((v_Vuna_dCompiler_dCodegen_dDecl_dtypeDepsOfGo qc) ((Base_dList.v_Base_dList_dconcatMap v_Vuna_dCompiler_dCodegen_dDecl_ddataTypeGlobalNames) datas)) Base_dList.C_Base_dList_dList_Base_dList_dNil))

let v_Vuna_dCompiler_dCodegen_dDecl_docamlReservedWords = (Base_dList.C_Base_dList_dList_Base_dList_dCons ("and", (Base_dList.C_Base_dList_dList_Base_dList_dCons ("as", (Base_dList.C_Base_dList_dList_Base_dList_dCons ("assert", (Base_dList.C_Base_dList_dList_Base_dList_dCons ("asr", (Base_dList.C_Base_dList_dList_Base_dList_dCons ("begin", (Base_dList.C_Base_dList_dList_Base_dList_dCons ("class", (Base_dList.C_Base_dList_dList_Base_dList_dCons ("constraint", (Base_dList.C_Base_dList_dList_Base_dList_dCons ("do", (Base_dList.C_Base_dList_dList_Base_dList_dCons ("done", (Base_dList.C_Base_dList_dList_Base_dList_dCons ("downto", (Base_dList.C_Base_dList_dList_Base_dList_dCons ("else", (Base_dList.C_Base_dList_dList_Base_dList_dCons ("end", (Base_dList.C_Base_dList_dList_Base_dList_dCons ("exception", (Base_dList.C_Base_dList_dList_Base_dList_dCons ("external", (Base_dList.C_Base_dList_dList_Base_dList_dCons ("false", (Base_dList.C_Base_dList_dList_Base_dList_dCons ("for", (Base_dList.C_Base_dList_dList_Base_dList_dCons ("fun", (Base_dList.C_Base_dList_dList_Base_dList_dCons ("function", (Base_dList.C_Base_dList_dList_Base_dList_dCons ("functor", (Base_dList.C_Base_dList_dList_Base_dList_dCons ("if", (Base_dList.C_Base_dList_dList_Base_dList_dCons ("in", (Base_dList.C_Base_dList_dList_Base_dList_dCons ("include", (Base_dList.C_Base_dList_dList_Base_dList_dCons ("inherit", (Base_dList.C_Base_dList_dList_Base_dList_dCons ("initializer", (Base_dList.C_Base_dList_dList_Base_dList_dCons ("land", (Base_dList.C_Base_dList_dList_Base_dList_dCons ("lazy", (Base_dList.C_Base_dList_dList_Base_dList_dCons ("let", (Base_dList.C_Base_dList_dList_Base_dList_dCons ("lor", (Base_dList.C_Base_dList_dList_Base_dList_dCons ("lsl", (Base_dList.C_Base_dList_dList_Base_dList_dCons ("lsr", (Base_dList.C_Base_dList_dList_Base_dList_dCons ("lxor", (Base_dList.C_Base_dList_dList_Base_dList_dCons ("match", (Base_dList.C_Base_dList_dList_Base_dList_dCons ("method", (Base_dList.C_Base_dList_dList_Base_dList_dCons ("mod", (Base_dList.C_Base_dList_dList_Base_dList_dCons ("module", (Base_dList.C_Base_dList_dList_Base_dList_dCons ("mutable", (Base_dList.C_Base_dList_dList_Base_dList_dCons ("new", (Base_dList.C_Base_dList_dList_Base_dList_dCons ("nonrec", (Base_dList.C_Base_dList_dList_Base_dList_dCons ("object", (Base_dList.C_Base_dList_dList_Base_dList_dCons ("of", (Base_dList.C_Base_dList_dList_Base_dList_dCons ("open", (Base_dList.C_Base_dList_dList_Base_dList_dCons ("or", (Base_dList.C_Base_dList_dList_Base_dList_dCons ("private", (Base_dList.C_Base_dList_dList_Base_dList_dCons ("rec", (Base_dList.C_Base_dList_dList_Base_dList_dCons ("sig", (Base_dList.C_Base_dList_dList_Base_dList_dCons ("struct", (Base_dList.C_Base_dList_dList_Base_dList_dCons ("then", (Base_dList.C_Base_dList_dList_Base_dList_dCons ("to", (Base_dList.C_Base_dList_dList_Base_dList_dCons ("true", (Base_dList.C_Base_dList_dList_Base_dList_dCons ("try", (Base_dList.C_Base_dList_dList_Base_dList_dCons ("type", (Base_dList.C_Base_dList_dList_Base_dList_dCons ("val", (Base_dList.C_Base_dList_dList_Base_dList_dCons ("virtual", (Base_dList.C_Base_dList_dList_Base_dList_dCons ("when", (Base_dList.C_Base_dList_dList_Base_dList_dCons ("while", (Base_dList.C_Base_dList_dList_Base_dList_dCons ("with", Base_dList.C_Base_dList_dList_Base_dList_dNil))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))

let v_Vuna_dCompiler_dCodegen_dDecl_docamlBinderName = (fun name -> ((fun oc -> (if ((Base_dList.v_Base_dList_dmemName oc) v_Vuna_dCompiler_dCodegen_dDecl_docamlReservedWords) then (oc ^ "_") else oc)) (v_Vuna_dCompiler_dCodegen_dDecl_dsanitizeName name)))

let rec v_Vuna_dCompiler_dCodegen_dDecl_dinterpose = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__55, dtb__56) -> (match dtb__56 with
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__55, Base_dList.C_Base_dList_dList_Base_dList_dNil))
  | _ -> (Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__55, (Base_dList.C_Base_dList_dList_Base_dList_dCons (mc0, ((v_Vuna_dCompiler_dCodegen_dDecl_dinterpose mc0) dtb__56)))))
)
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> Base_dList.C_Base_dList_dList_Base_dList_dNil
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCodegen_dDecl_djoinWith = (fun sep xs -> (Base_dList.dtp_concatMany ((v_Vuna_dCompiler_dCodegen_dDecl_dinterpose sep) xs)))

let v_Vuna_dCompiler_dCodegen_dDecl_dtypeParamName = (fun i -> ("'a" ^ (bi_strFromInt i)))

let v_Vuna_dCompiler_dCodegen_dDecl_dtypeParamNames = (fun n -> ((Base_dList.v_Base_dList_dmap v_Vuna_dCompiler_dCodegen_dDecl_dtypeParamName) ((Base_dList.v_Base_dList_drange 0) n)))

let v_Vuna_dCompiler_dCodegen_dDecl_dtypeParamDecl = (fun mc0 -> (if (mc0 = 0) then "" else ((fun nd_uscrut1 -> (match nd_uscrut1 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__57, dtb__58) -> (match dtb__58 with
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (dtb__57 ^ " ")
  | _ -> (String.concat "" ["("; ((v_Vuna_dCompiler_dCodegen_dDecl_djoinWith ", ") nd_uscrut1); ") "])
)
  | _ -> (String.concat "" ["("; ((v_Vuna_dCompiler_dCodegen_dDecl_djoinWith ", ") nd_uscrut1); ") "])
)) (v_Vuna_dCompiler_dCodegen_dDecl_dtypeParamNames mc0))))

let rec v_Vuna_dCompiler_dCodegen_dDecl_dtypeParamLevelsGo = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__59, dtb__60) -> (if (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_drigIsErased (Base_dPair.v_Base_dPair_dsecondOf dtb__59)) then (Base_dList.C_Base_dList_dList_Base_dList_dCons (mc1, ((v_Vuna_dCompiler_dCodegen_dDecl_dtypeParamLevelsGo dtb__60) (mc1 + 1)))) else ((v_Vuna_dCompiler_dCodegen_dDecl_dtypeParamLevelsGo dtb__60) (mc1 + 1)))
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> Base_dList.C_Base_dList_dList_Base_dList_dNil
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCodegen_dDecl_dtypeParamLevels = (fun d -> ((v_Vuna_dCompiler_dCodegen_dDecl_dtypeParamLevelsGo (match d with
  | Vuna_dCompiler_dElab_dTypes.C_Vuna_dCompiler_dElab_dTypes_dDtData_Vuna_dCompiler_dElab_dTypes_dDtData (dtb__61, dtb__62, dtb__63, dtb__64) -> dtb__62
  | _ -> failwith "DT: impossible branch"
)) 0))

let rec v_Vuna_dCompiler_dCodegen_dDecl_dfindDtData = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__65, dtb__66) -> (if ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataName dtb__65) = mc0) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__65)) else ((v_Vuna_dCompiler_dCodegen_dDecl_dfindDtData mc0) dtb__66))
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dCodegen_dDecl_dmemInt = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__67, dtb__68) -> (if (dtb__67 = mc0) then true else ((v_Vuna_dCompiler_dCodegen_dDecl_dmemInt mc0) dtb__68))
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> false
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dCodegen_dDecl_dlevelSlotGo = (fun mc0 mc1 mc2 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__69, dtb__70) -> (if (dtb__69 = mc1) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (mc2)) else (((v_Vuna_dCompiler_dCodegen_dDecl_dlevelSlotGo dtb__70) mc1) (mc2 + 1)))
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCodegen_dDecl_dlevelSlot = (fun levels lvl -> (((v_Vuna_dCompiler_dCodegen_dDecl_dlevelSlotGo levels) lvl) 0))

let rec v_Vuna_dCompiler_dCodegen_dDecl_dnthValue = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__71, dtb__72) -> (if (mc1 <= 0) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__71)) else ((v_Vuna_dCompiler_dCodegen_dDecl_dnthValue dtb__72) (mc1 - 1)))
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dCodegen_dDecl_dlookupUsed = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__73, dtb__74) -> (if ((Base_dPair.v_Base_dPair_dfirstOf dtb__73) = mc1) then (Base_dPair.v_Base_dPair_dsecondOf dtb__73) else ((v_Vuna_dCompiler_dCodegen_dDecl_dlookupUsed dtb__74) mc1))
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> Base_dList.C_Base_dList_dList_Base_dList_dNil
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dCodegen_dDecl_dcollectUsedLevelsFuel = (fun fuel tps table datas lvl v -> (if (fuel <= 0) then Base_dList.C_Base_dList_dList_Base_dList_dNil else (match v with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVPi (dtb__75, dtb__76, dtb__77, dtb__78, dtb__79) -> (if dtb__76 then ((((((v_Vuna_dCompiler_dCodegen_dDecl_dcollectUsedLevelsFuel (fuel - 1)) tps) table) datas) (lvl + 1)) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dapplyClosure dtb__79) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNVar (dtb__75, lvl, Base_dList.C_Base_dList_dList_Base_dList_dNil)))))) else ((Base_dList.v_Base_dList_dappend ((((((v_Vuna_dCompiler_dCodegen_dDecl_dcollectUsedLevelsFuel (fuel - 1)) tps) table) datas) lvl) dtb__78)) ((((((v_Vuna_dCompiler_dCodegen_dDecl_dcollectUsedLevelsFuel (fuel - 1)) tps) table) datas) (lvl + 1)) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dapplyClosure dtb__79) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNVar (dtb__75, lvl, Base_dList.C_Base_dList_dList_Base_dList_dNil))))))))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral (dtb__80) -> (match dtb__80 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNVar (dtb__81, dtb__82, dtb__83) -> ((Base_dList.v_Base_dList_dappend (if ((v_Vuna_dCompiler_dCodegen_dDecl_dmemInt dtb__82) tps) then (Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__82, Base_dList.C_Base_dList_dList_Base_dList_dNil)) else Base_dList.C_Base_dList_dList_Base_dList_dNil)) ((((((v_Vuna_dCompiler_dCodegen_dDecl_dcollectUsedSpineFuel (fuel - 1)) tps) table) datas) lvl) dtb__83))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNGlobal (dtb__84, dtb__85) -> (match ((v_Vuna_dCompiler_dCodegen_dDecl_dfindDtData dtb__84) datas) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__86) -> (((((((v_Vuna_dCompiler_dCodegen_dDecl_dcollectFamilyArgsFuel (fuel - 1)) tps) table) datas) lvl) ((v_Vuna_dCompiler_dCodegen_dDecl_dlookupUsed table) dtb__84)) dtb__85)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((((((v_Vuna_dCompiler_dCodegen_dDecl_dcollectUsedSpineFuel (fuel - 1)) tps) table) datas) lvl) dtb__85)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> Base_dList.C_Base_dList_dList_Base_dList_dNil
)))
and v_Vuna_dCompiler_dCodegen_dDecl_dcollectUsedSpineFuel = (fun mc0 mc1 mc2 mc3 mc4 mc5 -> (match mc5 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__87, dtb__88) -> (if (mc0 <= 0) then Base_dList.C_Base_dList_dList_Base_dList_dNil else ((Base_dList.v_Base_dList_dappend ((((((v_Vuna_dCompiler_dCodegen_dDecl_dcollectUsedLevelsFuel (mc0 - 1)) mc1) mc2) mc3) mc4) dtb__87)) ((((((v_Vuna_dCompiler_dCodegen_dDecl_dcollectUsedSpineFuel (mc0 - 1)) mc1) mc2) mc3) mc4) dtb__88)))
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (if (mc0 <= 0) then Base_dList.C_Base_dList_dList_Base_dList_dNil else Base_dList.C_Base_dList_dList_Base_dList_dNil)
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dCodegen_dDecl_dcollectFamilyArgsFuel = (fun fuel tps table datas lvl usedPats args -> (if (fuel <= 0) then Base_dList.C_Base_dList_dList_Base_dList_dNil else (match usedPats with
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> Base_dList.C_Base_dList_dList_Base_dList_dNil
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__89, dtb__90) -> (match ((v_Vuna_dCompiler_dCodegen_dDecl_dnthValue args) dtb__89) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__91) -> ((Base_dList.v_Base_dList_dappend ((((((v_Vuna_dCompiler_dCodegen_dDecl_dcollectUsedLevelsFuel (fuel - 1)) tps) table) datas) lvl) dtb__91)) (((((((v_Vuna_dCompiler_dCodegen_dDecl_dcollectFamilyArgsFuel (fuel - 1)) tps) table) datas) lvl) dtb__90) args))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (((((((v_Vuna_dCompiler_dCodegen_dDecl_dcollectFamilyArgsFuel (fuel - 1)) tps) table) datas) lvl) dtb__90) args)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dCodegen_dDecl_dcollectUsedLevels = (fun tps table datas lvl v -> ((((((v_Vuna_dCompiler_dCodegen_dDecl_dcollectUsedLevelsFuel 256) tps) table) datas) lvl) v))

let v_Vuna_dCompiler_dCodegen_dDecl_dcollectFamilyArgs = (fun tps table datas lvl usedPats args -> (((((((v_Vuna_dCompiler_dCodegen_dDecl_dcollectFamilyArgsFuel 256) tps) table) datas) lvl) usedPats) args))

let rec v_Vuna_dCompiler_dCodegen_dDecl_dctorUsedLevels = (fun mc0 mc1 mc2 mc3 mc4 mc5 -> (match mc3 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__92, dtb__93) -> (match dtb__92 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__94, dtb__95) -> (match mc5 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVPi (dtb__96, dtb__97, dtb__98, dtb__99, dtb__100) -> ((fun next -> (if (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_drigIsErased dtb__95) then ((((((v_Vuna_dCompiler_dCodegen_dDecl_dctorUsedLevels mc0) mc1) mc2) dtb__93) (mc4 + 1)) next) else ((Base_dList.v_Base_dList_dappend (((((v_Vuna_dCompiler_dCodegen_dDecl_dcollectUsedLevels mc0) mc1) mc2) mc4) dtb__99)) ((((((v_Vuna_dCompiler_dCodegen_dDecl_dctorUsedLevels mc0) mc1) mc2) dtb__93) (mc4 + 1)) next)))) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dapplyClosure dtb__100) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNVar (dtb__96, mc4, Base_dList.C_Base_dList_dList_Base_dList_dNil))))))
  | _ -> Base_dList.C_Base_dList_dList_Base_dList_dNil
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> Base_dList.C_Base_dList_dList_Base_dList_dNil
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCodegen_dDecl_ddataUsedLevels = (fun d table datas -> ((fun raw -> ((Base_dList.v_Base_dList_dfilter (fun l -> ((v_Vuna_dCompiler_dCodegen_dDecl_dmemInt l) raw))) (v_Vuna_dCompiler_dCodegen_dDecl_dtypeParamLevels d))) ((Base_dList.v_Base_dList_dconcatMap (fun c -> ((((((v_Vuna_dCompiler_dCodegen_dDecl_dctorUsedLevels (v_Vuna_dCompiler_dCodegen_dDecl_dtypeParamLevels d)) table) datas) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorTelescope c)) 0) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_deval Base_dList.C_Base_dList_dList_Base_dList_dNil) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorType c))))) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataCtors d))))

let rec v_Vuna_dCompiler_dCodegen_dDecl_dlevelListEq = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__101, dtb__102) -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__103, dtb__104) -> (if (dtb__101 = dtb__103) then ((v_Vuna_dCompiler_dCodegen_dDecl_dlevelListEq dtb__102) dtb__104) else false)
  | _ -> false
)
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> true
  | _ -> false
)
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dCodegen_dDecl_dsameLevelTable = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__105, dtb__106) -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__107, dtb__108) -> (if (if ((Base_dPair.v_Base_dPair_dfirstOf dtb__105) = (Base_dPair.v_Base_dPair_dfirstOf dtb__107)) then ((v_Vuna_dCompiler_dCodegen_dDecl_dlevelListEq (Base_dPair.v_Base_dPair_dsecondOf dtb__105)) (Base_dPair.v_Base_dPair_dsecondOf dtb__107)) else false) then ((v_Vuna_dCompiler_dCodegen_dDecl_dsameLevelTable dtb__106) dtb__108) else false)
  | _ -> false
)
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> true
  | _ -> false
)
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dCodegen_dDecl_dusedTableFixFuel = (fun fuel datas table -> (if (fuel <= 0) then table else ((fun next -> (if ((v_Vuna_dCompiler_dCodegen_dDecl_dsameLevelTable next) table) then next else (((v_Vuna_dCompiler_dCodegen_dDecl_dusedTableFixFuel (fuel - 1)) datas) next))) ((Base_dList.v_Base_dList_dmap (fun d -> (Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataName d), (((v_Vuna_dCompiler_dCodegen_dDecl_ddataUsedLevels d) table) datas))))) datas))))

let v_Vuna_dCompiler_dCodegen_dDecl_dusedTableFix = (fun datas table -> (((v_Vuna_dCompiler_dCodegen_dDecl_dusedTableFixFuel 64) datas) table))

let v_Vuna_dCompiler_dCodegen_dDecl_dfamilyTyText = (fun mc0 mc1 mc2 -> (match mc2 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__109, dtb__110) -> (match dtb__110 with
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (String.concat "" [dtb__109; " "; (Base_dPair.v_Base_dPair_dfirstOf ((v_Vuna_dCompiler_dCodegen_dDecl_dqualTypeText mc0) mc1))])
  | _ -> (String.concat "" ["("; ((v_Vuna_dCompiler_dCodegen_dDecl_djoinWith ", ") mc2); ") "; (Base_dPair.v_Base_dPair_dfirstOf ((v_Vuna_dCompiler_dCodegen_dDecl_dqualTypeText mc0) mc1))])
)
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (Base_dPair.v_Base_dPair_dfirstOf ((v_Vuna_dCompiler_dCodegen_dDecl_dqualTypeText mc0) mc1))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCodegen_dDecl_drenderTypeIntrinsic = (fun mc0 mc1 -> (if (mc0 = "Array") then (match mc1 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__111, dtb__112) -> (match dtb__112 with
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((String.concat "" ["("; dtb__111; " array)"])))
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
) else (if (mc0 = "IORef") then (match mc1 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__113, dtb__114) -> (match dtb__114 with
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((String.concat "" ["("; dtb__113; " ref)"])))
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
) else (if (mc0 = "MArray") then (match mc1 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__115, dtb__116) -> (match dtb__116 with
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((String.concat "" ["("; dtb__115; " array)"])))
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
) else (if (mc0 = "Buffer") then (match mc1 with
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ("Buffer.t"))
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
) else Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing)))))

let rec v_Vuna_dCompiler_dCodegen_dDecl_drenderFamilyArgsFuel = (fun qc fuel levels table datas usedPats args -> (if (fuel <= 0) then Base_dList.C_Base_dList_dList_Base_dList_dNil else (match usedPats with
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> Base_dList.C_Base_dList_dList_Base_dList_dNil
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__117, dtb__118) -> (match ((v_Vuna_dCompiler_dCodegen_dDecl_dnthValue args) dtb__117) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__119) -> (Base_dList.C_Base_dList_dList_Base_dList_dCons (((((((v_Vuna_dCompiler_dCodegen_dDecl_drenderTypeArgFuel qc) (fuel - 1)) levels) table) datas) dtb__119), (((((((v_Vuna_dCompiler_dCodegen_dDecl_drenderFamilyArgsFuel qc) (fuel - 1)) levels) table) datas) dtb__118) args)))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (((((((v_Vuna_dCompiler_dCodegen_dDecl_drenderFamilyArgsFuel qc) (fuel - 1)) levels) table) datas) dtb__118) args)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))
and v_Vuna_dCompiler_dCodegen_dDecl_drenderTypeArgFuel = (fun qc fuel levels table datas v -> (if (fuel <= 0) then "unit" else (match v with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral (dtb__120) -> (match dtb__120 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNVar (dtb__121, dtb__122, dtb__123) -> (match ((v_Vuna_dCompiler_dCodegen_dDecl_dlevelSlot levels) dtb__122) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__124) -> (v_Vuna_dCompiler_dCodegen_dDecl_dtypeParamName dtb__124)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> "unit"
  | _ -> failwith "DT: impossible branch"
)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNGlobal (dtb__125, dtb__126) -> (((((((v_Vuna_dCompiler_dCodegen_dDecl_drenderTypeArgGlobal qc) fuel) levels) table) datas) dtb__125) dtb__126)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> "unit"
)))
and v_Vuna_dCompiler_dCodegen_dDecl_drenderTypeArgGlobal = (fun qc fuel levels table datas g sp -> (match ((v_Vuna_dCompiler_dCodegen_dDecl_drenderTypeIntrinsic g) ((Base_dList.v_Base_dList_dmap (fun x -> ((((((v_Vuna_dCompiler_dCodegen_dDecl_drenderTypeArgFuel qc) (fuel - 1)) levels) table) datas) x))) sp)) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__127) -> dtb__127
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (if (g = Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dintTypeName) then "int" else (if (g = Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dnatTypeName) then "int" else (if (g = Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dstrTypeName) then "string" else (if (g = Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dboolTypeName) then "bool" else (match ((v_Vuna_dCompiler_dCodegen_dDecl_dfindDtData g) datas) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__128) -> (((v_Vuna_dCompiler_dCodegen_dDecl_dfamilyTyText qc) g) (((((((v_Vuna_dCompiler_dCodegen_dDecl_drenderFamilyArgsFuel qc) (fuel - 1)) levels) table) datas) ((v_Vuna_dCompiler_dCodegen_dDecl_dlookupUsed table) g)) sp))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> "unit"
  | _ -> failwith "DT: impossible branch"
)))))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCodegen_dDecl_drenderFamilyArgs = (fun qc levels table datas usedPats args -> (((((((v_Vuna_dCompiler_dCodegen_dDecl_drenderFamilyArgsFuel qc) 256) levels) table) datas) usedPats) args))

let v_Vuna_dCompiler_dCodegen_dDecl_drenderTypeArg = (fun qc levels table datas v -> ((((((v_Vuna_dCompiler_dCodegen_dDecl_drenderTypeArgFuel qc) 256) levels) table) datas) v))

let rec v_Vuna_dCompiler_dCodegen_dDecl_drenderPiTyFuel = (fun qc fuel levels table datas lvl v -> (if (fuel <= 0) then (((((v_Vuna_dCompiler_dCodegen_dDecl_drenderTypeArg qc) levels) table) datas) v) else (match v with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVPi (dtb__129, dtb__130, dtb__131, dtb__132, dtb__133) -> ((fun next -> (if (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_drigIsErased dtb__131) then (((((((v_Vuna_dCompiler_dCodegen_dDecl_drenderPiTyFuel qc) (fuel - 1)) levels) table) datas) (lvl + 1)) next) else (String.concat "" ["("; (((((((v_Vuna_dCompiler_dCodegen_dDecl_drenderPiTyFuel qc) (fuel - 1)) levels) table) datas) lvl) dtb__132); ") -> "; (((((((v_Vuna_dCompiler_dCodegen_dDecl_drenderPiTyFuel qc) (fuel - 1)) levels) table) datas) (lvl + 1)) next)]))) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dapplyClosure dtb__133) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNVar (dtb__129, lvl, Base_dList.C_Base_dList_dList_Base_dList_dNil))))))
  | _ -> (((((v_Vuna_dCompiler_dCodegen_dDecl_drenderTypeArg qc) levels) table) datas) v)
)))

let v_Vuna_dCompiler_dCodegen_dDecl_drenderPiTy = (fun qc levels table datas lvl v -> (((((((v_Vuna_dCompiler_dCodegen_dDecl_drenderPiTyFuel qc) 256) levels) table) datas) lvl) v))

let v_Vuna_dCompiler_dCodegen_dDecl_drenderFieldTy = (fun mc0 mc1 mc2 mc3 mc4 mc5 mc6 -> (match mc5 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral (dtb__134) -> (match dtb__134 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNVar (dtb__135, dtb__136, dtb__137) -> (match ((v_Vuna_dCompiler_dCodegen_dDecl_dlevelSlot mc1) dtb__136) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__138) -> (Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ((v_Vuna_dCompiler_dCodegen_dDecl_dtypeParamName dtb__138), mc6))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ((v_Vuna_dCompiler_dCodegen_dDecl_dtypeParamName mc6), (mc6 + 1)))
  | _ -> failwith "DT: impossible branch"
)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNGlobal (dtb__139, dtb__140) -> (match ((v_Vuna_dCompiler_dCodegen_dDecl_drenderTypeIntrinsic dtb__139) ((Base_dList.v_Base_dList_dmap (fun x -> (((((v_Vuna_dCompiler_dCodegen_dDecl_drenderTypeArg mc0) mc1) mc2) mc3) x))) dtb__140)) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__141) -> (Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__141, mc6))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (if (dtb__139 = Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dintTypeName) then (Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ("int", mc6)) else (if (dtb__139 = Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dnatTypeName) then (Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ("int", mc6)) else (if (dtb__139 = Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dstrTypeName) then (Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ("string", mc6)) else (if (dtb__139 = Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dboolTypeName) then (Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ("bool", mc6)) else (match ((v_Vuna_dCompiler_dCodegen_dDecl_dfindDtData dtb__139) mc3) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__142) -> (Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ((((v_Vuna_dCompiler_dCodegen_dDecl_dfamilyTyText mc0) dtb__139) ((((((v_Vuna_dCompiler_dCodegen_dDecl_drenderFamilyArgs mc0) mc1) mc2) mc3) ((v_Vuna_dCompiler_dCodegen_dDecl_dlookupUsed mc2) dtb__139)) dtb__140)), mc6))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ((v_Vuna_dCompiler_dCodegen_dDecl_dtypeParamName mc6), (mc6 + 1)))
  | _ -> failwith "DT: impossible branch"
)))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVPi (dtb__143, dtb__144, dtb__145, dtb__146, dtb__147) -> (if dtb__144 then (Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ((v_Vuna_dCompiler_dCodegen_dDecl_dtypeParamName mc6), (mc6 + 1))) else (Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (((((((v_Vuna_dCompiler_dCodegen_dDecl_drenderPiTy mc0) mc1) mc2) mc3) mc4) mc5), mc6)))
  | _ -> (Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ((v_Vuna_dCompiler_dCodegen_dDecl_dtypeParamName mc6), (mc6 + 1)))
))

let v_Vuna_dCompiler_dCodegen_dDecl_dctorKeepFlags = (fun c -> ((Base_dList.v_Base_dList_dmap (fun b -> (Base_dBool.v_Base_dBool_dnot (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_drigIsErased (Base_dPair.v_Base_dPair_dsecondOf b))))) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorTelescope c)))

let v_Vuna_dCompiler_dCodegen_dDecl_dflagMatchesRig = (fun keep rig -> (if keep then (Base_dBool.v_Base_dBool_dnot (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_drigIsErased rig)) else (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_drigIsErased rig)))

let rec v_Vuna_dCompiler_dCodegen_dDecl_dctorShapeOf = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__148, dtb__149) -> ((Base_dList.v_Base_dList_dappend ((Base_dList.v_Base_dList_dmap (fun c -> (Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorName c), (v_Vuna_dCompiler_dCodegen_dDecl_dctorKeepFlags c))))) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataCtors dtb__148))) (v_Vuna_dCompiler_dCodegen_dDecl_dctorShapeOf dtb__149))
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> Base_dList.C_Base_dList_dList_Base_dList_dNil
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dCodegen_dDecl_dctorFieldTexts = (fun mc0 mc1 mc2 mc3 mc4 mc5 mc6 mc7 mc8 -> (match mc4 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__150, dtb__151) -> (match mc5 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__152, dtb__153) -> (match dtb__152 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__154, dtb__155) -> (if ((v_Vuna_dCompiler_dCodegen_dDecl_dflagMatchesRig dtb__150) dtb__155) then (match mc7 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVPi (dtb__156, dtb__157, dtb__158, dtb__159, dtb__160) -> ((fun next -> (if dtb__150 then (match (((((((v_Vuna_dCompiler_dCodegen_dDecl_drenderFieldTy mc0) mc1) mc2) mc3) mc6) dtb__159) mc8) with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__161, dtb__162) -> ((Base_dResult.v_Base_dResult_dandThen (((((((((v_Vuna_dCompiler_dCodegen_dDecl_dctorFieldTexts mc0) mc1) mc2) mc3) dtb__151) dtb__153) (mc6 + 1)) next) dtb__162)) (fun p -> (match p with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__163, dtb__164) -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ((Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__161, dtb__163)), dtb__164))))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
) else (((((((((v_Vuna_dCompiler_dCodegen_dDecl_dctorFieldTexts mc0) mc1) mc2) mc3) dtb__151) dtb__153) (mc6 + 1)) next) mc8))) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dapplyClosure dtb__160) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNVar (dtb__156, mc6, Base_dList.C_Base_dList_dList_Base_dList_dNil))))))
  | _ -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: constructor telescope does not match its type"))
) else (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: constructor keep flag disagrees with telescope rig")))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (Base_dList.C_Base_dList_dList_Base_dList_dNil, mc8))))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (match mc5 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__165, dtb__166) -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: constructor shape has more binders than its telescope"))
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (Base_dList.C_Base_dList_dList_Base_dList_dNil, mc8))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCodegen_dDecl_dctorArityNeed = (fun qc levels table datas c -> ((Base_dResult.v_Base_dResult_dandThen (((((((((v_Vuna_dCompiler_dCodegen_dDecl_dctorFieldTexts qc) levels) table) datas) (v_Vuna_dCompiler_dCodegen_dDecl_dctorKeepFlags c)) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorTelescope c)) 0) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_deval Base_dList.C_Base_dList_dList_Base_dList_dNil) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorType c))) (Base_dList.v_Base_dList_dlength levels))) (fun p -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk (((Base_dPair.v_Base_dPair_dsecondOf p) - (Base_dList.v_Base_dList_dlength levels)))))))

let rec v_Vuna_dCompiler_dCodegen_dDecl_dmaxIntList = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__167, dtb__168) -> (if (dtb__167 >= (v_Vuna_dCompiler_dCodegen_dDecl_dmaxIntList dtb__168)) then dtb__167 else (v_Vuna_dCompiler_dCodegen_dDecl_dmaxIntList dtb__168))
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> 0
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCodegen_dDecl_ddataArityNeed = (fun qc levels table datas ctors -> ((Base_dResult.v_Base_dResult_dandThen ((Base_dResult.v_Base_dResult_dtraverse ((((v_Vuna_dCompiler_dCodegen_dDecl_dctorArityNeed qc) levels) table) datas)) ctors)) (fun ns -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk (((Base_dList.v_Base_dList_dlength levels) + (v_Vuna_dCompiler_dCodegen_dDecl_dmaxIntList ns)))))))

let v_Vuna_dCompiler_dCodegen_dDecl_dparenOne = (fun t -> (String.concat "" ["("; t; ")"]))

let rec v_Vuna_dCompiler_dCodegen_dDecl_dparenList = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__169, dtb__170) -> ((Base_dList.v_Base_dList_dappend (Base_dList.C_Base_dList_dList_Base_dList_dCons ((v_Vuna_dCompiler_dCodegen_dDecl_dparenOne dtb__169), Base_dList.C_Base_dList_dList_Base_dList_dNil))) (v_Vuna_dCompiler_dCodegen_dDecl_dparenList dtb__170))
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> Base_dList.C_Base_dList_dList_Base_dList_dNil
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCodegen_dDecl_dctorDeclText = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__171, dtb__172) -> (match dtb__172 with
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (String.concat "" [mc0; " of "; (v_Vuna_dCompiler_dCodegen_dDecl_dparenOne dtb__171)])
  | _ -> (String.concat "" [mc0; " of "; ((v_Vuna_dCompiler_dCodegen_dDecl_djoinWith " * ") (v_Vuna_dCompiler_dCodegen_dDecl_dparenList mc1))])
)
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> mc0
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCodegen_dDecl_dgenCtorDecl = (fun qc levels table datas c -> ((Base_dResult.v_Base_dResult_dandThen (((((((((v_Vuna_dCompiler_dCodegen_dDecl_dctorFieldTexts qc) levels) table) datas) (v_Vuna_dCompiler_dCodegen_dDecl_dctorKeepFlags c)) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorTelescope c)) 0) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_deval Base_dList.C_Base_dList_dList_Base_dList_dNil) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorType c))) (Base_dList.v_Base_dList_dlength levels))) (fun p -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk (((v_Vuna_dCompiler_dCodegen_dDecl_dctorDeclText ((v_Vuna_dCompiler_dCodegen_dDecl_dctorOcamlName (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorFamily c)) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorName c))) (Base_dPair.v_Base_dPair_dfirstOf p)))))))

let v_Vuna_dCompiler_dCodegen_dDecl_dctorBodyText = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> "|"
  | _ -> ((v_Vuna_dCompiler_dCodegen_dDecl_djoinWith " | ") mc0)
))

let v_Vuna_dCompiler_dCodegen_dDecl_dgenDataDecl = (fun qc table datas d -> ((fun levels -> ((Base_dResult.v_Base_dResult_dandThen (((((v_Vuna_dCompiler_dCodegen_dDecl_ddataArityNeed qc) levels) table) datas) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataCtors d))) (fun arity -> ((Base_dResult.v_Base_dResult_dandThen ((Base_dResult.v_Base_dResult_dtraverse ((((v_Vuna_dCompiler_dCodegen_dDecl_dgenCtorDecl qc) levels) table) datas)) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataCtors d))) (fun cs -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((String.concat "" [(v_Vuna_dCompiler_dCodegen_dDecl_dtypeParamDecl arity); (v_Vuna_dCompiler_dCodegen_dDecl_dtypeName (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataName d)); " = "; (v_Vuna_dCompiler_dCodegen_dDecl_dctorBodyText cs)])))))))) ((v_Vuna_dCompiler_dCodegen_dDecl_dlookupUsed table) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataName d))))

let v_Vuna_dCompiler_dCodegen_dDecl_disBoolFamilyName = (fun name -> (name = Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dboolTypeName))

let v_Vuna_dCompiler_dCodegen_dDecl_disNatFamilyName = (fun name -> (name = Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dnatTypeName))

let v_Vuna_dCompiler_dCodegen_dDecl_druntimeDatas = (fun datas -> ((Base_dList.v_Base_dList_dfilter (fun d -> (if (Base_dBool.v_Base_dBool_dnot (v_Vuna_dCompiler_dCodegen_dDecl_disBoolFamilyName (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataName d))) then (Base_dBool.v_Base_dBool_dnot (v_Vuna_dCompiler_dCodegen_dDecl_disNatFamilyName (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataName d))) else false))) datas))

let v_Vuna_dCompiler_dCodegen_dDecl_dusedTableOf = (fun datas -> ((v_Vuna_dCompiler_dCodegen_dDecl_dusedTableFix datas) ((Base_dList.v_Base_dList_dmap (fun d -> (Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataName d), Base_dList.C_Base_dList_dList_Base_dList_dNil)))) datas)))

let v_Vuna_dCompiler_dCodegen_dDecl_dgenTypeDeclsWith = (fun mc0 mc1 mc2 mc3 -> (match mc3 with
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk (""))
  | _ -> ((Base_dResult.v_Base_dResult_dandThen ((Base_dResult.v_Base_dResult_dtraverse (((v_Vuna_dCompiler_dCodegen_dDecl_dgenDataDecl mc0) mc1) mc2)) mc3)) (fun parts -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((String.concat "" ["type "; ((v_Vuna_dCompiler_dCodegen_dDecl_djoinWith "\nand ") parts); "\n\n"])))))
))

let v_Vuna_dCompiler_dCodegen_dDecl_dgenTypeDeclsOf = (fun qc allDatas subset -> ((((v_Vuna_dCompiler_dCodegen_dDecl_dgenTypeDeclsWith qc) (v_Vuna_dCompiler_dCodegen_dDecl_dusedTableOf allDatas)) allDatas) subset))

let v_Vuna_dCompiler_dCodegen_dDecl_dcollectUsedSpine = (fun a1 a2 a3 a4 a5 -> ((((((v_Vuna_dCompiler_dCodegen_dDecl_dcollectUsedSpineFuel 512) a1) a2) a3) a4) a5))
