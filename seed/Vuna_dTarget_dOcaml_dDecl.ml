open Vuna_runtime
type t_QualCtx = { f_QualCtx_qcUnit : string; f_QualCtx_qcDefs : (string, string) B_dContainer_dHashMap.t_HashMap; f_QualCtx_qcDatas : (string, string) B_dContainer_dHashMap.t_HashMap }

# 24 "Vuna/Target/Ocaml/Decl.vuna"
let v_ctorShortName = (fun (dtb_u_u1 : string) -> (Base_dSource.v_lastSeg dtb_u_u1))

# 34 "Vuna/Target/Ocaml/Decl.vuna"
let v_isAsciiAlphaNum = (fun (dtb_u_u2 : int) -> (if (if (if (dtb_u_u2 >= 65) then (dtb_u_u2 <= 90) else false) then true else (if (dtb_u_u2 >= 97) then (dtb_u_u2 <= 122) else false)) then true else (if (dtb_u_u2 >= 48) then (dtb_u_u2 <= 57) else false)))

# 38 "Vuna/Target/Ocaml/Decl.vuna"
let v_sanitizeChar = (fun (dtb_u_u3 : int) -> (if (dtb_u_u3 = 46) then (B_dData_dList.C_List__x58__x58_ (95, (B_dData_dList.C_List__x58__x58_ (100, B_dData_dList.C_List_Nil)))) else (if (dtb_u_u3 = 95) then (B_dData_dList.C_List__x58__x58_ (95, (B_dData_dList.C_List__x58__x58_ (117, B_dData_dList.C_List_Nil)))) else (if (dtb_u_u3 = 39) then (B_dData_dList.C_List__x58__x58_ (95, (B_dData_dList.C_List__x58__x58_ (112, B_dData_dList.C_List_Nil)))) else (if (dtb_u_u3 = 35) then (B_dData_dList.C_List__x58__x58_ (95, (B_dData_dList.C_List__x58__x58_ (104, B_dData_dList.C_List_Nil)))) else (if (v_isAsciiAlphaNum dtb_u_u3) then (B_dData_dList.C_List__x58__x58_ (dtb_u_u3, B_dData_dList.C_List_Nil)) else (B_dData_dList.dtp_unpack (String.concat "" ["_x"; (string_of_int dtb_u_u3); "_"]))))))))

# 45 "Vuna/Target/Ocaml/Decl.vuna"
let v_sanitizeName = (fun (dtb_u_u4 : string) -> (B_dData_dList.dtp_pack ((B_dData_dList.v_concatMap v_sanitizeChar) (B_dData_dList.dtp_unpack dtb_u_u4))))

# 48 "Vuna/Target/Ocaml/Decl.vuna"
let v_ocamlPad3 = (fun (dtb_u_u5 : string) -> (if ((String.length dtb_u_u5) = 1) then ("00" ^ dtb_u_u5) else (if ((String.length dtb_u_u5) = 2) then ("0" ^ dtb_u_u5) else dtb_u_u5)))

# 51 "Vuna/Target/Ocaml/Decl.vuna"
let v_ocamlEscapeChar = (fun (dtb_u_u6 : int) -> (if (dtb_u_u6 = 34) then (B_dData_dList.C_List__x58__x58_ (92, (B_dData_dList.C_List__x58__x58_ (34, B_dData_dList.C_List_Nil)))) else (if (dtb_u_u6 = 92) then (B_dData_dList.C_List__x58__x58_ (92, (B_dData_dList.C_List__x58__x58_ (92, B_dData_dList.C_List_Nil)))) else (if (dtb_u_u6 = 10) then (B_dData_dList.C_List__x58__x58_ (92, (B_dData_dList.C_List__x58__x58_ (110, B_dData_dList.C_List_Nil)))) else (if (dtb_u_u6 = 9) then (B_dData_dList.C_List__x58__x58_ (92, (B_dData_dList.C_List__x58__x58_ (116, B_dData_dList.C_List_Nil)))) else (if (dtb_u_u6 = 13) then (B_dData_dList.C_List__x58__x58_ (92, (B_dData_dList.C_List__x58__x58_ (114, B_dData_dList.C_List_Nil)))) else (if (if (dtb_u_u6 >= 32) then (dtb_u_u6 <= 126) else false) then (B_dData_dList.C_List__x58__x58_ (dtb_u_u6, B_dData_dList.C_List_Nil)) else (B_dData_dList.dtp_unpack ("\\" ^ (v_ocamlPad3 (string_of_int dtb_u_u6)))))))))))

# 59 "Vuna/Target/Ocaml/Decl.vuna"
let v_ocamlString = (fun (dtb_u_u7 : string) -> (String.concat "" ["\""; (B_dData_dList.dtp_pack ((B_dData_dList.v_concatMap v_ocamlEscapeChar) (B_dData_dList.dtp_unpack dtb_u_u7))); "\""]))

# 69 "Vuna/Target/Ocaml/Decl.vuna"
let v_localName = (fun (dtb_u_u8 : string) -> (B_dData_dPair.v_secondOf (Base_dSource.v_splitLastDot (Base_dSource.v_splitOnDot dtb_u_u8))))

# 72 "Vuna/Target/Ocaml/Decl.vuna"
let v_valueName = (fun (dtb_u_u9 : string) -> ("v_" ^ (v_sanitizeName (v_localName dtb_u_u9))))

# 77 "Vuna/Target/Ocaml/Decl.vuna"
let v_boolText = (fun (dtb_u_u10 : bool) -> (if dtb_u_u10 then "true" else "false"))

# 82 "Vuna/Target/Ocaml/Decl.vuna"
let v_typeName = (fun (dtb_u_u11 : string) -> ("t_" ^ (v_sanitizeName (v_localName dtb_u_u11))))

# 86 "Vuna/Target/Ocaml/Decl.vuna"
let v_ctorOcamlName = (fun (dtb_u_u12 : string) (dtb_u_u13 : string) -> (String.concat "" ["C_"; (v_sanitizeName (v_localName dtb_u_u12)); "_"; (v_sanitizeName (v_ctorShortName dtb_u_u13))]))

# 91 "Vuna/Target/Ocaml/Decl.vuna"
let v_recordFieldLabel = (fun (dtb_u_u14 : string) (dtb_u_u15 : string) -> (String.concat "" ["f_"; (v_sanitizeName (v_localName dtb_u_u14)); "_"; (v_sanitizeName dtb_u_u15)]))

# 113 "Vuna/Target/Ocaml/Decl.vuna"
let v_noQual = { f_QualCtx_qcUnit = ""; f_QualCtx_qcDefs = (((B_dContainer_dHashMap.v_fromList B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) B_dData_dList.C_List_Nil); f_QualCtx_qcDatas = (((B_dContainer_dHashMap.v_fromList B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) B_dData_dList.C_List_Nil) }

# 116 "Vuna/Target/Ocaml/Decl.vuna"
let v_unitTblOf = (fun (dtb_u_u16 : (string, string) B_dData_dPair.t_Pair B_dData_dList.t_List) -> ((((B_dContainer_dHashMap.v_insertAll B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) dtb_u_u16) (((B_dContainer_dHashMap.v_fromList B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) B_dData_dList.C_List_Nil)))

# 119 "Vuna/Target/Ocaml/Decl.vuna"
let v_unitOfTbl = (fun (dtb_u_u17 : (string, string) B_dContainer_dHashMap.t_HashMap) (dtb_u_u18 : string) -> (match ((((B_dContainer_dHashMap.v_lookup B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) dtb_u_u18) dtb_u_u17) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u19) -> dtb_u_u19
  | B_dData_dMaybe.C_Maybe_Nothing -> ""
  | _ -> failwith "DT: impossible branch"
))

# 125 "Vuna/Target/Ocaml/Decl.vuna"
let v_qualOf = (fun (dtb_u_u20 : string) (dtb_u_u21 : (string, string) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u22 : (string, string) B_dData_dPair.t_Pair B_dData_dList.t_List) -> { f_QualCtx_qcUnit = dtb_u_u20; f_QualCtx_qcDefs = (v_unitTblOf dtb_u_u21); f_QualCtx_qcDatas = (v_unitTblOf dtb_u_u22) })

# 129 "Vuna/Target/Ocaml/Decl.vuna"
let v_qualPrefix = (fun (dtb_u_u23 : t_QualCtx) (dtb_u_u24 : string) (dtb_u_u25 : string) -> (if (if (dtb_u_u24 = "") then true else (dtb_u_u24 = (dtb_u_u23).f_QualCtx_qcUnit)) then { B_dData_dPair.f_Pair_first = dtb_u_u25; B_dData_dPair.f_Pair_second = "" } else { B_dData_dPair.f_Pair_first = (String.concat "" [dtb_u_u24; "."; dtb_u_u25]); B_dData_dPair.f_Pair_second = dtb_u_u24 }))

# 134 "Vuna/Target/Ocaml/Decl.vuna"
let v_qualValueText = (fun (dtb_u_u26 : t_QualCtx) (dtb_u_u27 : string) -> (((v_qualPrefix dtb_u_u26) ((v_unitOfTbl (dtb_u_u26).f_QualCtx_qcDefs) dtb_u_u27)) (v_valueName dtb_u_u27)))

# 137 "Vuna/Target/Ocaml/Decl.vuna"
let v_qualCtorText = (fun (dtb_u_u28 : t_QualCtx) (dtb_u_u29 : string) (dtb_u_u30 : string) -> (((v_qualPrefix dtb_u_u28) ((v_unitOfTbl (dtb_u_u28).f_QualCtx_qcDatas) dtb_u_u29)) ((v_ctorOcamlName dtb_u_u29) dtb_u_u30)))

# 141 "Vuna/Target/Ocaml/Decl.vuna"
let v_qualTypeText = (fun (dtb_u_u31 : t_QualCtx) (dtb_u_u32 : string) -> (((v_qualPrefix dtb_u_u31) ((v_unitOfTbl (dtb_u_u31).f_QualCtx_qcDatas) dtb_u_u32)) (v_typeName dtb_u_u32)))

# 147 "Vuna/Target/Ocaml/Decl.vuna"
let v_ocamlReservedWords = (B_dData_dList.C_List__x58__x58_ ("and", (B_dData_dList.C_List__x58__x58_ ("as", (B_dData_dList.C_List__x58__x58_ ("assert", (B_dData_dList.C_List__x58__x58_ ("asr", (B_dData_dList.C_List__x58__x58_ ("begin", (B_dData_dList.C_List__x58__x58_ ("class", (B_dData_dList.C_List__x58__x58_ ("constraint", (B_dData_dList.C_List__x58__x58_ ("do", (B_dData_dList.C_List__x58__x58_ ("done", (B_dData_dList.C_List__x58__x58_ ("downto", (B_dData_dList.C_List__x58__x58_ ("else", (B_dData_dList.C_List__x58__x58_ ("end", (B_dData_dList.C_List__x58__x58_ ("exception", (B_dData_dList.C_List__x58__x58_ ("external", (B_dData_dList.C_List__x58__x58_ ("false", (B_dData_dList.C_List__x58__x58_ ("for", (B_dData_dList.C_List__x58__x58_ ("fun", (B_dData_dList.C_List__x58__x58_ ("function", (B_dData_dList.C_List__x58__x58_ ("functor", (B_dData_dList.C_List__x58__x58_ ("if", (B_dData_dList.C_List__x58__x58_ ("in", (B_dData_dList.C_List__x58__x58_ ("include", (B_dData_dList.C_List__x58__x58_ ("inherit", (B_dData_dList.C_List__x58__x58_ ("initializer", (B_dData_dList.C_List__x58__x58_ ("land", (B_dData_dList.C_List__x58__x58_ ("lazy", (B_dData_dList.C_List__x58__x58_ ("let", (B_dData_dList.C_List__x58__x58_ ("lor", (B_dData_dList.C_List__x58__x58_ ("lsl", (B_dData_dList.C_List__x58__x58_ ("lsr", (B_dData_dList.C_List__x58__x58_ ("lxor", (B_dData_dList.C_List__x58__x58_ ("match", (B_dData_dList.C_List__x58__x58_ ("method", (B_dData_dList.C_List__x58__x58_ ("mod", (B_dData_dList.C_List__x58__x58_ ("module", (B_dData_dList.C_List__x58__x58_ ("mutable", (B_dData_dList.C_List__x58__x58_ ("new", (B_dData_dList.C_List__x58__x58_ ("nonrec", (B_dData_dList.C_List__x58__x58_ ("object", (B_dData_dList.C_List__x58__x58_ ("of", (B_dData_dList.C_List__x58__x58_ ("open", (B_dData_dList.C_List__x58__x58_ ("or", (B_dData_dList.C_List__x58__x58_ ("private", (B_dData_dList.C_List__x58__x58_ ("rec", (B_dData_dList.C_List__x58__x58_ ("sig", (B_dData_dList.C_List__x58__x58_ ("struct", (B_dData_dList.C_List__x58__x58_ ("then", (B_dData_dList.C_List__x58__x58_ ("to", (B_dData_dList.C_List__x58__x58_ ("true", (B_dData_dList.C_List__x58__x58_ ("try", (B_dData_dList.C_List__x58__x58_ ("type", (B_dData_dList.C_List__x58__x58_ ("val", (B_dData_dList.C_List__x58__x58_ ("virtual", (B_dData_dList.C_List__x58__x58_ ("when", (B_dData_dList.C_List__x58__x58_ ("while", (B_dData_dList.C_List__x58__x58_ ("with", B_dData_dList.C_List_Nil))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))

# 208 "Vuna/Target/Ocaml/Decl.vuna"
let v_ocamlBinderName = (fun (dtb_u_u33 : string) -> (let dtb_u_u34 = (v_sanitizeName dtb_u_u33) in (if ((B_dData_dList.v_memName dtb_u_u34) v_ocamlReservedWords) then (dtb_u_u34 ^ "_") else dtb_u_u34)))

# 221 "Vuna/Target/Ocaml/Decl.vuna"
let v_irBinderText = (fun (dtb_u_u35 : Vuna_dIr_dModel.t_IrBinder) -> (match dtb_u_u35 with
  | { Vuna_dIr_dModel.f_IrBinder_irBinderId = dtb_u_u36; Vuna_dIr_dModel.f_IrBinder_irBinderName = dtb_u_u37; Vuna_dIr_dModel.f_IrBinder_irBinderErased = dtb_u_u38; Vuna_dIr_dModel.f_IrBinder_irBinderTy = dtb_u_u39 } -> (match dtb_u_u37 with
  | Vuna_dIr_dModel.C_IrBName_IrBWild -> "_"
  | Vuna_dIr_dModel.C_IrBName_IrBNat (dtb_u_u40) -> ("dtnat__" ^ (string_of_int dtb_u_u40))
  | Vuna_dIr_dModel.C_IrBName_IrBArm (dtb_u_u41) -> ("dtb__" ^ (string_of_int dtb_u_u41))
  | Vuna_dIr_dModel.C_IrBName_IrBUser (dtb_u_u42) -> (v_ocamlBinderName dtb_u_u42)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 231 "Vuna/Target/Ocaml/Decl.vuna"
let v_qualFamOf = (fun (dtb_u_u43 : t_QualCtx) (dtb_u_u44 : string) -> (B_dData_dPair.v_firstOf ((v_qualTypeText dtb_u_u43) dtb_u_u44)))

# 234 "Vuna/Target/Ocaml/Decl.vuna"
let rec v_toOTy = (fun (dtb_u_u45 : Vuna_dIr_dModel.t_IrTy) -> (match dtb_u_u45 with
  | Vuna_dIr_dModel.C_IrTy_IrTyData (dtb_u_u46, dtb_u_u47) -> (Vuna_dTarget_dOcaml_dModel.C_OTy_OTData (dtb_u_u46, ((B_dData_dList.v_map v_toOTy) dtb_u_u47)))
  | Vuna_dIr_dModel.C_IrTy_IrTyFun (dtb_u_u48, dtb_u_u49) -> (Vuna_dTarget_dOcaml_dModel.C_OTy_OTFun ((v_toOTy dtb_u_u48), (v_toOTy dtb_u_u49)))
  | Vuna_dIr_dModel.C_IrTy_IrTyRef (dtb_u_u50) -> (Vuna_dTarget_dOcaml_dModel.C_OTy_OTRef ((v_toOTy dtb_u_u50)))
  | Vuna_dIr_dModel.C_IrTy_IrTyArray (dtb_u_u51) -> (Vuna_dTarget_dOcaml_dModel.C_OTy_OTArray ((v_toOTy dtb_u_u51)))
  | Vuna_dIr_dModel.C_IrTy_IrTyOpaque -> Vuna_dTarget_dOcaml_dModel.C_OTy_OTOpaque
  | Vuna_dIr_dModel.C_IrTy_IrTyFloat -> Vuna_dTarget_dOcaml_dModel.C_OTy_OTFloat
  | Vuna_dIr_dModel.C_IrTy_IrTyBool -> Vuna_dTarget_dOcaml_dModel.C_OTy_OTBool
  | Vuna_dIr_dModel.C_IrTy_IrTyStr -> Vuna_dTarget_dOcaml_dModel.C_OTy_OTStr
  | Vuna_dIr_dModel.C_IrTy_IrTyInt -> Vuna_dTarget_dOcaml_dModel.C_OTy_OTInt
  | Vuna_dIr_dModel.C_IrTy_IrTyVar (dtb_u_u52) -> (Vuna_dTarget_dOcaml_dModel.C_OTy_OTVar (dtb_u_u52))
  | _ -> failwith "DT: impossible branch"
))

# 227 "Vuna/Target/Ocaml/Decl.vuna"
let v_irTyText = (fun (dtb_u_u53 : t_QualCtx) (dtb_u_u54 : Vuna_dIr_dModel.t_IrTy) -> ((Vuna_dTarget_dOcaml_dRender.v_renderTy (v_qualFamOf dtb_u_u53)) (v_toOTy dtb_u_u54)))

# 260 "Vuna/Target/Ocaml/Decl.vuna"
let v_toOCtor = (fun (dtb_u_u55 : string) (dtb_u_u56 : (string, Vuna_dIr_dModel.t_IrTy B_dData_dList.t_List) B_dData_dPair.t_Pair) -> (match dtb_u_u56 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u57; B_dData_dPair.f_Pair_second = dtb_u_u58 } -> { Vuna_dTarget_dOcaml_dModel.f_OCtor_ocName = ((v_ctorOcamlName dtb_u_u55) dtb_u_u57); Vuna_dTarget_dOcaml_dModel.f_OCtor_ocFields = ((B_dData_dList.v_map v_toOTy) dtb_u_u58) }
  | _ -> failwith "DT: impossible branch"
))

# 263 "Vuna/Target/Ocaml/Decl.vuna"
let[@tail_mod_cons] rec v_recordFieldsOf = (fun (dtb_u_u59 : string) (dtb_u_u60 : (int, string) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u61 : Vuna_dIr_dModel.t_IrTy B_dData_dList.t_List) -> (match dtb_u_u60 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u62, dtb_u_u63) -> (match dtb_u_u61 with
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u64, dtb_u_u65) -> (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = ((v_recordFieldLabel dtb_u_u59) (B_dData_dPair.v_secondOf dtb_u_u62)); B_dData_dPair.f_Pair_second = (v_toOTy dtb_u_u64) }, (((v_recordFieldsOf dtb_u_u59) dtb_u_u63) dtb_u_u65)))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 250 "Vuna/Target/Ocaml/Decl.vuna"
let v_toODecl = (fun (dtb_u_u66 : Vuna_dIr_dModel.t_IrTyDecl) -> (match dtb_u_u66 with
  | Vuna_dIr_dModel.C_IrTyDecl_IrUnboxedDecl (dtb_u_u67, dtb_u_u68, dtb_u_u69) -> (Vuna_dTarget_dOcaml_dModel.C_ODecl_ODAlias (dtb_u_u68, (v_typeName dtb_u_u67), (v_toOTy dtb_u_u69)))
  | Vuna_dIr_dModel.C_IrTyDecl_IrRecordDecl (dtb_u_u70, dtb_u_u71, dtb_u_u72, dtb_u_u73) -> (Vuna_dTarget_dOcaml_dModel.C_ODecl_ODRecord (dtb_u_u71, (v_typeName dtb_u_u70), (((v_recordFieldsOf dtb_u_u70) dtb_u_u72) dtb_u_u73)))
  | Vuna_dIr_dModel.C_IrTyDecl_IrVariantDecl (dtb_u_u74, dtb_u_u75, dtb_u_u76) -> (if (dtb_u_u74 = Vuna_dIr_dModel.v_irEffTypeName) then (Vuna_dTarget_dOcaml_dModel.C_ODecl_ODAlias (dtb_u_u75, (v_typeName dtb_u_u74), Vuna_dTarget_dOcaml_dModel.C_OTy_OTOpaque)) else (Vuna_dTarget_dOcaml_dModel.C_ODecl_ODVariant (dtb_u_u75, (v_typeName dtb_u_u74), ((B_dData_dList.v_map (v_toOCtor dtb_u_u74)) dtb_u_u76))))
  | _ -> failwith "DT: impossible branch"
))

# 271 "Vuna/Target/Ocaml/Decl.vuna"
let v_irTypeDeclsText = (fun (dtb_u_u77 : t_QualCtx) (dtb_u_u78 : Vuna_dIr_dModel.t_IrTyDecl B_dData_dList.t_List) -> ((Vuna_dTarget_dOcaml_dRender.v_renderDecls (v_qualFamOf dtb_u_u77)) ((B_dData_dList.v_map v_toODecl) dtb_u_u78)))

# 278 "Vuna/Target/Ocaml/Decl.vuna"
let rec v_irTyGlobalNames = (fun (dtb_u_u79 : Vuna_dIr_dModel.t_IrTy) -> (match dtb_u_u79 with
  | Vuna_dIr_dModel.C_IrTy_IrTyData (dtb_u_u80, dtb_u_u81) -> (B_dData_dList.C_List__x58__x58_ (dtb_u_u80, ((B_dData_dList.v_concatMap v_irTyGlobalNames) dtb_u_u81)))
  | Vuna_dIr_dModel.C_IrTy_IrTyFun (dtb_u_u82, dtb_u_u83) -> ((B_dData_dList.v_append (v_irTyGlobalNames dtb_u_u82)) (v_irTyGlobalNames dtb_u_u83))
  | Vuna_dIr_dModel.C_IrTy_IrTyRef (dtb_u_u84) -> (v_irTyGlobalNames dtb_u_u84)
  | Vuna_dIr_dModel.C_IrTy_IrTyArray (dtb_u_u85) -> (v_irTyGlobalNames dtb_u_u85)
  | Vuna_dIr_dModel.C_IrTy_IrTyOpaque -> B_dData_dList.C_List_Nil
  | Vuna_dIr_dModel.C_IrTy_IrTyFloat -> B_dData_dList.C_List_Nil
  | Vuna_dIr_dModel.C_IrTy_IrTyBool -> B_dData_dList.C_List_Nil
  | Vuna_dIr_dModel.C_IrTy_IrTyStr -> B_dData_dList.C_List_Nil
  | Vuna_dIr_dModel.C_IrTy_IrTyInt -> B_dData_dList.C_List_Nil
  | Vuna_dIr_dModel.C_IrTy_IrTyVar (dtb_u_u86) -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 290 "Vuna/Target/Ocaml/Decl.vuna"
let rec v_irTyDepsGo = (fun (dtb_u_u87 : t_QualCtx) (dtb_u_u88 : string B_dData_dList.t_List) (dtb_u_u89 : string B_dData_dList.t_List) -> (match dtb_u_u88 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u90, dtb_u_u91) -> (let dtb_u_u92 = ((v_unitOfTbl (dtb_u_u87).f_QualCtx_qcDatas) dtb_u_u90) in (if (if (dtb_u_u92 = "") then true else (dtb_u_u92 = (dtb_u_u87).f_QualCtx_qcUnit)) then (((v_irTyDepsGo dtb_u_u87) dtb_u_u91) dtb_u_u89) else (if ((B_dData_dList.v_memName dtb_u_u92) dtb_u_u89) then (((v_irTyDepsGo dtb_u_u87) dtb_u_u91) dtb_u_u89) else (((v_irTyDepsGo dtb_u_u87) dtb_u_u91) (B_dData_dList.C_List__x58__x58_ (dtb_u_u92, dtb_u_u89))))))
  | B_dData_dList.C_List_Nil -> (B_dData_dList.v_reverse dtb_u_u89)
  | _ -> failwith "DT: impossible branch"
))

# 275 "Vuna/Target/Ocaml/Decl.vuna"
let v_irTyDeclDeps = (fun (dtb_u_u93 : t_QualCtx) (dtb_u_u94 : Vuna_dIr_dModel.t_IrTy B_dData_dList.t_List) -> (((v_irTyDepsGo dtb_u_u93) ((B_dData_dList.v_concatMap v_irTyGlobalNames) dtb_u_u94)) B_dData_dList.C_List_Nil))

# 108 "Vuna/Target/Ocaml/Decl.vuna"
let v_qcUnit = (fun (dtb_u_u95 : t_QualCtx) -> (match dtb_u_u95 with
  | { f_QualCtx_qcUnit = dtb_u_u96; f_QualCtx_qcDefs = dtb_u_u97; f_QualCtx_qcDatas = dtb_u_u98 } -> dtb_u_u96
  | _ -> failwith "DT: impossible branch"
))

# 109 "Vuna/Target/Ocaml/Decl.vuna"
let v_qcDefs = (fun (dtb_u_u99 : t_QualCtx) -> (match dtb_u_u99 with
  | { f_QualCtx_qcUnit = dtb_u_u100; f_QualCtx_qcDefs = dtb_u_u101; f_QualCtx_qcDatas = dtb_u_u102 } -> dtb_u_u101
  | _ -> failwith "DT: impossible branch"
))

# 110 "Vuna/Target/Ocaml/Decl.vuna"
let v_qcDatas = (fun (dtb_u_u103 : t_QualCtx) -> (match dtb_u_u103 with
  | { f_QualCtx_qcUnit = dtb_u_u104; f_QualCtx_qcDefs = dtb_u_u105; f_QualCtx_qcDatas = dtb_u_u106 } -> dtb_u_u106
  | _ -> failwith "DT: impossible branch"
))
