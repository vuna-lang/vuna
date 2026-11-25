open Vuna_runtime
type t_QualCtx = { f_QualCtx_qcUnit : string; f_QualCtx_qcDefs : (string, string) B_dContainer_dHashMap.t_HashMap; f_QualCtx_qcDatas : (string, string) B_dContainer_dHashMap.t_HashMap }

# 24 "Vuna/Target/Ocaml/Decl.vuna"
let v_ctorShortName = (fun (name : string) -> (Base_dSource.v_lastSeg name))

# 34 "Vuna/Target/Ocaml/Decl.vuna"
let v_isAsciiAlphaNum = (fun (c : int) -> (if (if (if (c >= 65) then (c <= 90) else false) then true else (if (c >= 97) then (c <= 122) else false)) then true else (if (c >= 48) then (c <= 57) else false)))

# 38 "Vuna/Target/Ocaml/Decl.vuna"
let v_sanitizeChar = (fun (mc0 : int) -> (if (mc0 = 46) then (B_dData_dList.C_List__x58__x58_ (95, (B_dData_dList.C_List__x58__x58_ (100, B_dData_dList.C_List_Nil)))) else (if (mc0 = 95) then (B_dData_dList.C_List__x58__x58_ (95, (B_dData_dList.C_List__x58__x58_ (117, B_dData_dList.C_List_Nil)))) else (if (mc0 = 39) then (B_dData_dList.C_List__x58__x58_ (95, (B_dData_dList.C_List__x58__x58_ (112, B_dData_dList.C_List_Nil)))) else (if (mc0 = 35) then (B_dData_dList.C_List__x58__x58_ (95, (B_dData_dList.C_List__x58__x58_ (104, B_dData_dList.C_List_Nil)))) else (if (v_isAsciiAlphaNum mc0) then (B_dData_dList.C_List__x58__x58_ (mc0, B_dData_dList.C_List_Nil)) else (B_dData_dList.dtp_unpack (String.concat "" ["_x"; (bi_strFromInt mc0); "_"]))))))))

# 45 "Vuna/Target/Ocaml/Decl.vuna"
let v_sanitizeName = (fun (name : string) -> (B_dData_dList.dtp_pack ((B_dData_dList.v_concatMap v_sanitizeChar) (B_dData_dList.dtp_unpack name))))

# 48 "Vuna/Target/Ocaml/Decl.vuna"
let v_ocamlPad3 = (fun (s : string) -> (if ((bi_strLength s) = 1) then ("00" ^ s) else (if ((bi_strLength s) = 2) then ("0" ^ s) else s)))

# 51 "Vuna/Target/Ocaml/Decl.vuna"
let v_ocamlEscapeChar = (fun (mc0 : int) -> (if (mc0 = 34) then (B_dData_dList.C_List__x58__x58_ (92, (B_dData_dList.C_List__x58__x58_ (34, B_dData_dList.C_List_Nil)))) else (if (mc0 = 92) then (B_dData_dList.C_List__x58__x58_ (92, (B_dData_dList.C_List__x58__x58_ (92, B_dData_dList.C_List_Nil)))) else (if (mc0 = 10) then (B_dData_dList.C_List__x58__x58_ (92, (B_dData_dList.C_List__x58__x58_ (110, B_dData_dList.C_List_Nil)))) else (if (mc0 = 9) then (B_dData_dList.C_List__x58__x58_ (92, (B_dData_dList.C_List__x58__x58_ (116, B_dData_dList.C_List_Nil)))) else (if (mc0 = 13) then (B_dData_dList.C_List__x58__x58_ (92, (B_dData_dList.C_List__x58__x58_ (114, B_dData_dList.C_List_Nil)))) else (if (if (mc0 >= 32) then (mc0 <= 126) else false) then (B_dData_dList.C_List__x58__x58_ (mc0, B_dData_dList.C_List_Nil)) else (B_dData_dList.dtp_unpack ("\\" ^ (v_ocamlPad3 (bi_strFromInt mc0)))))))))))

# 59 "Vuna/Target/Ocaml/Decl.vuna"
let v_ocamlString = (fun (s : string) -> (String.concat "" ["\""; (B_dData_dList.dtp_pack ((B_dData_dList.v_concatMap v_ocamlEscapeChar) (B_dData_dList.dtp_unpack s))); "\""]))

# 69 "Vuna/Target/Ocaml/Decl.vuna"
let v_localName = (fun (name : string) -> (B_dData_dPair.v_secondOf (Base_dSource.v_splitLastDot (Base_dSource.v_splitOnDot name))))

# 72 "Vuna/Target/Ocaml/Decl.vuna"
let v_valueName = (fun (name : string) -> ("v_" ^ (v_sanitizeName (v_localName name))))

# 77 "Vuna/Target/Ocaml/Decl.vuna"
let v_boolText = (fun (mc0 : bool) -> (if mc0 then "true" else "false"))

# 82 "Vuna/Target/Ocaml/Decl.vuna"
let v_typeName = (fun (name : string) -> ("t_" ^ (v_sanitizeName (v_localName name))))

# 86 "Vuna/Target/Ocaml/Decl.vuna"
let v_ctorOcamlName = (fun (family : string) (ctor : string) -> (String.concat "" ["C_"; (v_sanitizeName (v_localName family)); "_"; (v_sanitizeName (v_ctorShortName ctor))]))

# 91 "Vuna/Target/Ocaml/Decl.vuna"
let v_recordFieldLabel = (fun (family : string) (field : string) -> (String.concat "" ["f_"; (v_sanitizeName (v_localName family)); "_"; (v_sanitizeName field)]))

# 113 "Vuna/Target/Ocaml/Decl.vuna"
let v_noQual = { f_QualCtx_qcUnit = ""; f_QualCtx_qcDefs = (((B_dContainer_dHashMap.v_fromList B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) B_dData_dList.C_List_Nil); f_QualCtx_qcDatas = (((B_dContainer_dHashMap.v_fromList B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) B_dData_dList.C_List_Nil) }

# 116 "Vuna/Target/Ocaml/Decl.vuna"
let v_unitTblOf = (fun (pairs : (string, string) B_dData_dPair.t_Pair B_dData_dList.t_List) -> ((((B_dContainer_dHashMap.v_insertAll B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) pairs) (((B_dContainer_dHashMap.v_fromList B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) B_dData_dList.C_List_Nil)))

# 119 "Vuna/Target/Ocaml/Decl.vuna"
let v_unitOfTbl = (fun (tbl : (string, string) B_dContainer_dHashMap.t_HashMap) (name : string) -> (match ((((B_dContainer_dHashMap.v_lookup B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) name) tbl) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__0) -> dtb__0
  | B_dData_dMaybe.C_Maybe_Nothing -> ""
  | _ -> failwith "DT: impossible branch"
))

# 125 "Vuna/Target/Ocaml/Decl.vuna"
let v_qualOf = (fun (unit : string) (defs : (string, string) B_dData_dPair.t_Pair B_dData_dList.t_List) (datas : (string, string) B_dData_dPair.t_Pair B_dData_dList.t_List) -> { f_QualCtx_qcUnit = unit; f_QualCtx_qcDefs = (v_unitTblOf defs); f_QualCtx_qcDatas = (v_unitTblOf datas) })

# 129 "Vuna/Target/Ocaml/Decl.vuna"
let v_qualPrefix = (fun (qc : t_QualCtx) (owner : string) (text : string) -> (if (if (owner = "") then true else (owner = (qc).f_QualCtx_qcUnit)) then { B_dData_dPair.f_Pair_first = text; B_dData_dPair.f_Pair_second = "" } else { B_dData_dPair.f_Pair_first = (String.concat "" [owner; "."; text]); B_dData_dPair.f_Pair_second = owner }))

# 134 "Vuna/Target/Ocaml/Decl.vuna"
let v_qualValueText = (fun (qc : t_QualCtx) (name : string) -> (((v_qualPrefix qc) ((v_unitOfTbl (qc).f_QualCtx_qcDefs) name)) (v_valueName name)))

# 137 "Vuna/Target/Ocaml/Decl.vuna"
let v_qualCtorText = (fun (qc : t_QualCtx) (family : string) (ctor : string) -> (((v_qualPrefix qc) ((v_unitOfTbl (qc).f_QualCtx_qcDatas) family)) ((v_ctorOcamlName family) ctor)))

# 141 "Vuna/Target/Ocaml/Decl.vuna"
let v_qualTypeText = (fun (qc : t_QualCtx) (name : string) -> (((v_qualPrefix qc) ((v_unitOfTbl (qc).f_QualCtx_qcDatas) name)) (v_typeName name)))

# 147 "Vuna/Target/Ocaml/Decl.vuna"
let v_ocamlReservedWords = (B_dData_dList.C_List__x58__x58_ ("and", (B_dData_dList.C_List__x58__x58_ ("as", (B_dData_dList.C_List__x58__x58_ ("assert", (B_dData_dList.C_List__x58__x58_ ("asr", (B_dData_dList.C_List__x58__x58_ ("begin", (B_dData_dList.C_List__x58__x58_ ("class", (B_dData_dList.C_List__x58__x58_ ("constraint", (B_dData_dList.C_List__x58__x58_ ("do", (B_dData_dList.C_List__x58__x58_ ("done", (B_dData_dList.C_List__x58__x58_ ("downto", (B_dData_dList.C_List__x58__x58_ ("else", (B_dData_dList.C_List__x58__x58_ ("end", (B_dData_dList.C_List__x58__x58_ ("exception", (B_dData_dList.C_List__x58__x58_ ("external", (B_dData_dList.C_List__x58__x58_ ("false", (B_dData_dList.C_List__x58__x58_ ("for", (B_dData_dList.C_List__x58__x58_ ("fun", (B_dData_dList.C_List__x58__x58_ ("function", (B_dData_dList.C_List__x58__x58_ ("functor", (B_dData_dList.C_List__x58__x58_ ("if", (B_dData_dList.C_List__x58__x58_ ("in", (B_dData_dList.C_List__x58__x58_ ("include", (B_dData_dList.C_List__x58__x58_ ("inherit", (B_dData_dList.C_List__x58__x58_ ("initializer", (B_dData_dList.C_List__x58__x58_ ("land", (B_dData_dList.C_List__x58__x58_ ("lazy", (B_dData_dList.C_List__x58__x58_ ("let", (B_dData_dList.C_List__x58__x58_ ("lor", (B_dData_dList.C_List__x58__x58_ ("lsl", (B_dData_dList.C_List__x58__x58_ ("lsr", (B_dData_dList.C_List__x58__x58_ ("lxor", (B_dData_dList.C_List__x58__x58_ ("match", (B_dData_dList.C_List__x58__x58_ ("method", (B_dData_dList.C_List__x58__x58_ ("mod", (B_dData_dList.C_List__x58__x58_ ("module", (B_dData_dList.C_List__x58__x58_ ("mutable", (B_dData_dList.C_List__x58__x58_ ("new", (B_dData_dList.C_List__x58__x58_ ("nonrec", (B_dData_dList.C_List__x58__x58_ ("object", (B_dData_dList.C_List__x58__x58_ ("of", (B_dData_dList.C_List__x58__x58_ ("open", (B_dData_dList.C_List__x58__x58_ ("or", (B_dData_dList.C_List__x58__x58_ ("private", (B_dData_dList.C_List__x58__x58_ ("rec", (B_dData_dList.C_List__x58__x58_ ("sig", (B_dData_dList.C_List__x58__x58_ ("struct", (B_dData_dList.C_List__x58__x58_ ("then", (B_dData_dList.C_List__x58__x58_ ("to", (B_dData_dList.C_List__x58__x58_ ("true", (B_dData_dList.C_List__x58__x58_ ("try", (B_dData_dList.C_List__x58__x58_ ("type", (B_dData_dList.C_List__x58__x58_ ("val", (B_dData_dList.C_List__x58__x58_ ("virtual", (B_dData_dList.C_List__x58__x58_ ("when", (B_dData_dList.C_List__x58__x58_ ("while", (B_dData_dList.C_List__x58__x58_ ("with", B_dData_dList.C_List_Nil))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))

# 208 "Vuna/Target/Ocaml/Decl.vuna"
let v_ocamlBinderName = (fun (name : string) -> (let oc = (v_sanitizeName name) in (if ((B_dData_dList.v_memName oc) v_ocamlReservedWords) then (oc ^ "_") else oc)))

# 221 "Vuna/Target/Ocaml/Decl.vuna"
let v_irBinderText = (fun (mc0 : Vuna_dIr_dModel.t_IrBinder) -> (match mc0 with
  | { Vuna_dIr_dModel.f_IrBinder_irBinderId = dtb__1; Vuna_dIr_dModel.f_IrBinder_irBinderName = dtb__2; Vuna_dIr_dModel.f_IrBinder_irBinderErased = dtb__3; Vuna_dIr_dModel.f_IrBinder_irBinderTy = dtb__4 } -> (match dtb__2 with
  | Vuna_dIr_dModel.C_IrBName_IrBWild -> "_"
  | Vuna_dIr_dModel.C_IrBName_IrBNat (dtb__5) -> ("dtnat__" ^ (bi_strFromInt dtb__5))
  | Vuna_dIr_dModel.C_IrBName_IrBArm (dtb__6) -> ("dtb__" ^ (bi_strFromInt dtb__6))
  | Vuna_dIr_dModel.C_IrBName_IrBUser (dtb__7) -> (v_ocamlBinderName dtb__7)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 231 "Vuna/Target/Ocaml/Decl.vuna"
let v_qualFamOf = (fun (qc : t_QualCtx) (fam : string) -> (B_dData_dPair.v_firstOf ((v_qualTypeText qc) fam)))

# 234 "Vuna/Target/Ocaml/Decl.vuna"
let rec v_toOTy = (fun (mc0 : Vuna_dIr_dModel.t_IrTy) -> (match mc0 with
  | Vuna_dIr_dModel.C_IrTy_IrTyData (dtb__8, dtb__9) -> (Vuna_dTarget_dOcaml_dModel.C_OTy_OTData (dtb__8, ((B_dData_dList.v_map v_toOTy) dtb__9)))
  | Vuna_dIr_dModel.C_IrTy_IrTyFun (dtb__10, dtb__11) -> (Vuna_dTarget_dOcaml_dModel.C_OTy_OTFun ((v_toOTy dtb__10), (v_toOTy dtb__11)))
  | Vuna_dIr_dModel.C_IrTy_IrTyRef (dtb__12) -> (Vuna_dTarget_dOcaml_dModel.C_OTy_OTRef ((v_toOTy dtb__12)))
  | Vuna_dIr_dModel.C_IrTy_IrTyArray (dtb__13) -> (Vuna_dTarget_dOcaml_dModel.C_OTy_OTArray ((v_toOTy dtb__13)))
  | Vuna_dIr_dModel.C_IrTy_IrTyOpaque -> Vuna_dTarget_dOcaml_dModel.C_OTy_OTOpaque
  | Vuna_dIr_dModel.C_IrTy_IrTyFloat -> Vuna_dTarget_dOcaml_dModel.C_OTy_OTFloat
  | Vuna_dIr_dModel.C_IrTy_IrTyBool -> Vuna_dTarget_dOcaml_dModel.C_OTy_OTBool
  | Vuna_dIr_dModel.C_IrTy_IrTyStr -> Vuna_dTarget_dOcaml_dModel.C_OTy_OTStr
  | Vuna_dIr_dModel.C_IrTy_IrTyInt -> Vuna_dTarget_dOcaml_dModel.C_OTy_OTInt
  | Vuna_dIr_dModel.C_IrTy_IrTyVar (dtb__14) -> (Vuna_dTarget_dOcaml_dModel.C_OTy_OTVar (dtb__14))
  | _ -> failwith "DT: impossible branch"
))

# 227 "Vuna/Target/Ocaml/Decl.vuna"
let v_irTyText = (fun (qc : t_QualCtx) (ty : Vuna_dIr_dModel.t_IrTy) -> ((Vuna_dTarget_dOcaml_dRender.v_renderTy (v_qualFamOf qc)) (v_toOTy ty)))

# 252 "Vuna/Target/Ocaml/Decl.vuna"
let v_toOCtor = (fun (mc0 : string) (mc1 : (string, Vuna_dIr_dModel.t_IrTy B_dData_dList.t_List) B_dData_dPair.t_Pair) -> (match mc1 with
  | { B_dData_dPair.f_Pair_first = dtb__15; B_dData_dPair.f_Pair_second = dtb__16 } -> { Vuna_dTarget_dOcaml_dModel.f_OCtor_ocName = ((v_ctorOcamlName mc0) dtb__15); Vuna_dTarget_dOcaml_dModel.f_OCtor_ocFields = ((B_dData_dList.v_map v_toOTy) dtb__16) }
  | _ -> failwith "DT: impossible branch"
))

# 255 "Vuna/Target/Ocaml/Decl.vuna"
let rec v_recordFieldsOf = (fun (mc0 : string) (mc1 : (int, string) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc2 : Vuna_dIr_dModel.t_IrTy B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__17, dtb__18) -> (match mc2 with
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | B_dData_dList.C_List__x58__x58_ (dtb__19, dtb__20) -> (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = ((v_recordFieldLabel mc0) (B_dData_dPair.v_secondOf dtb__17)); B_dData_dPair.f_Pair_second = (v_toOTy dtb__19) }, (((v_recordFieldsOf mc0) dtb__18) dtb__20)))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 246 "Vuna/Target/Ocaml/Decl.vuna"
let v_toODecl = (fun (mc0 : Vuna_dIr_dModel.t_IrTyDecl) -> (match mc0 with
  | Vuna_dIr_dModel.C_IrTyDecl_IrUnboxedDecl (dtb__21, dtb__22, dtb__23) -> (Vuna_dTarget_dOcaml_dModel.C_ODecl_ODAlias (dtb__22, (v_typeName dtb__21), (v_toOTy dtb__23)))
  | Vuna_dIr_dModel.C_IrTyDecl_IrRecordDecl (dtb__24, dtb__25, dtb__26, dtb__27) -> (Vuna_dTarget_dOcaml_dModel.C_ODecl_ODRecord (dtb__25, (v_typeName dtb__24), (((v_recordFieldsOf dtb__24) dtb__26) dtb__27)))
  | Vuna_dIr_dModel.C_IrTyDecl_IrVariantDecl (dtb__28, dtb__29, dtb__30) -> (Vuna_dTarget_dOcaml_dModel.C_ODecl_ODVariant (dtb__29, (v_typeName dtb__28), ((B_dData_dList.v_map (v_toOCtor dtb__28)) dtb__30)))
  | _ -> failwith "DT: impossible branch"
))

# 263 "Vuna/Target/Ocaml/Decl.vuna"
let v_irTypeDeclsText = (fun (qc : t_QualCtx) (decls : Vuna_dIr_dModel.t_IrTyDecl B_dData_dList.t_List) -> ((Vuna_dTarget_dOcaml_dRender.v_renderDecls (v_qualFamOf qc)) ((B_dData_dList.v_map v_toODecl) decls)))

# 270 "Vuna/Target/Ocaml/Decl.vuna"
let rec v_irTyGlobalNames = (fun (mc0 : Vuna_dIr_dModel.t_IrTy) -> (match mc0 with
  | Vuna_dIr_dModel.C_IrTy_IrTyData (dtb__31, dtb__32) -> (B_dData_dList.C_List__x58__x58_ (dtb__31, ((B_dData_dList.v_concatMap v_irTyGlobalNames) dtb__32)))
  | Vuna_dIr_dModel.C_IrTy_IrTyFun (dtb__33, dtb__34) -> ((B_dData_dList.v_append (v_irTyGlobalNames dtb__33)) (v_irTyGlobalNames dtb__34))
  | Vuna_dIr_dModel.C_IrTy_IrTyRef (dtb__35) -> (v_irTyGlobalNames dtb__35)
  | Vuna_dIr_dModel.C_IrTy_IrTyArray (dtb__36) -> (v_irTyGlobalNames dtb__36)
  | Vuna_dIr_dModel.C_IrTy_IrTyOpaque -> B_dData_dList.C_List_Nil
  | Vuna_dIr_dModel.C_IrTy_IrTyFloat -> B_dData_dList.C_List_Nil
  | Vuna_dIr_dModel.C_IrTy_IrTyBool -> B_dData_dList.C_List_Nil
  | Vuna_dIr_dModel.C_IrTy_IrTyStr -> B_dData_dList.C_List_Nil
  | Vuna_dIr_dModel.C_IrTy_IrTyInt -> B_dData_dList.C_List_Nil
  | Vuna_dIr_dModel.C_IrTy_IrTyVar (dtb__37) -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 282 "Vuna/Target/Ocaml/Decl.vuna"
let rec v_irTyDepsGo = (fun (mc0 : t_QualCtx) (mc1 : string B_dData_dList.t_List) (mc2 : string B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__38, dtb__39) -> (let owner = ((v_unitOfTbl (mc0).f_QualCtx_qcDatas) dtb__38) in (if (if (owner = "") then true else (owner = (mc0).f_QualCtx_qcUnit)) then (((v_irTyDepsGo mc0) dtb__39) mc2) else (if ((B_dData_dList.v_memName owner) mc2) then (((v_irTyDepsGo mc0) dtb__39) mc2) else (((v_irTyDepsGo mc0) dtb__39) (B_dData_dList.C_List__x58__x58_ (owner, mc2))))))
  | B_dData_dList.C_List_Nil -> (B_dData_dList.v_reverse mc2)
  | _ -> failwith "DT: impossible branch"
))

# 267 "Vuna/Target/Ocaml/Decl.vuna"
let v_irTyDeclDeps = (fun (qc : t_QualCtx) (tys : Vuna_dIr_dModel.t_IrTy B_dData_dList.t_List) -> (((v_irTyDepsGo qc) ((B_dData_dList.v_concatMap v_irTyGlobalNames) tys)) B_dData_dList.C_List_Nil))

# 108 "Vuna/Target/Ocaml/Decl.vuna"
let v_qcUnit = (fun (p : t_QualCtx) -> (match p with
  | { f_QualCtx_qcUnit = dtb__40; f_QualCtx_qcDefs = dtb__41; f_QualCtx_qcDatas = dtb__42 } -> dtb__40
  | _ -> failwith "DT: impossible branch"
))

# 109 "Vuna/Target/Ocaml/Decl.vuna"
let v_qcDefs = (fun (p : t_QualCtx) -> (match p with
  | { f_QualCtx_qcUnit = dtb__43; f_QualCtx_qcDefs = dtb__44; f_QualCtx_qcDatas = dtb__45 } -> dtb__44
  | _ -> failwith "DT: impossible branch"
))

# 110 "Vuna/Target/Ocaml/Decl.vuna"
let v_qcDatas = (fun (p : t_QualCtx) -> (match p with
  | { f_QualCtx_qcUnit = dtb__46; f_QualCtx_qcDefs = dtb__47; f_QualCtx_qcDatas = dtb__48 } -> dtb__48
  | _ -> failwith "DT: impossible branch"
))
