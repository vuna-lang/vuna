open Vuna_runtime
type t_QualCtx = { f_QualCtx_qcUnit : string; f_QualCtx_qcDefs : (string, string) B_dContainer_dHashMap.t_HashMap; f_QualCtx_qcDatas : (string, string) B_dContainer_dHashMap.t_HashMap }

# 31 "Vuna/Compiler/Codegen/Decl.vuna"
let v_isAsciiAlphaNum = (fun (c : int) -> (if (if (if (c >= 65) then (c <= 90) else false) then true else (if (c >= 97) then (c <= 122) else false)) then true else (if (c >= 48) then (c <= 57) else false)))

# 35 "Vuna/Compiler/Codegen/Decl.vuna"
let v_sanitizeChar = (fun (mc0 : int) -> (if (mc0 = 46) then (B_dData_dList.C_List__x58__x58_ (95, (B_dData_dList.C_List__x58__x58_ (100, B_dData_dList.C_List_Nil)))) else (if (mc0 = 95) then (B_dData_dList.C_List__x58__x58_ (95, (B_dData_dList.C_List__x58__x58_ (117, B_dData_dList.C_List_Nil)))) else (if (mc0 = 39) then (B_dData_dList.C_List__x58__x58_ (95, (B_dData_dList.C_List__x58__x58_ (112, B_dData_dList.C_List_Nil)))) else (if (mc0 = 35) then (B_dData_dList.C_List__x58__x58_ (95, (B_dData_dList.C_List__x58__x58_ (104, B_dData_dList.C_List_Nil)))) else (if (v_isAsciiAlphaNum mc0) then (B_dData_dList.C_List__x58__x58_ (mc0, B_dData_dList.C_List_Nil)) else (B_dData_dList.dtp_unpack (String.concat "" ["_x"; (bi_strFromInt mc0); "_"]))))))))

# 42 "Vuna/Compiler/Codegen/Decl.vuna"
let v_sanitizeName = (fun (name : string) -> (B_dData_dList.dtp_pack ((B_dData_dList.v_concatMap v_sanitizeChar) (B_dData_dList.dtp_unpack name))))

# 45 "Vuna/Compiler/Codegen/Decl.vuna"
let v_ocamlPad3 = (fun (s : string) -> (if ((bi_strLength s) = 1) then ("00" ^ s) else (if ((bi_strLength s) = 2) then ("0" ^ s) else s)))

# 48 "Vuna/Compiler/Codegen/Decl.vuna"
let v_ocamlEscapeChar = (fun (mc0 : int) -> (if (mc0 = 34) then (B_dData_dList.C_List__x58__x58_ (92, (B_dData_dList.C_List__x58__x58_ (34, B_dData_dList.C_List_Nil)))) else (if (mc0 = 92) then (B_dData_dList.C_List__x58__x58_ (92, (B_dData_dList.C_List__x58__x58_ (92, B_dData_dList.C_List_Nil)))) else (if (mc0 = 10) then (B_dData_dList.C_List__x58__x58_ (92, (B_dData_dList.C_List__x58__x58_ (110, B_dData_dList.C_List_Nil)))) else (if (mc0 = 9) then (B_dData_dList.C_List__x58__x58_ (92, (B_dData_dList.C_List__x58__x58_ (116, B_dData_dList.C_List_Nil)))) else (if (mc0 = 13) then (B_dData_dList.C_List__x58__x58_ (92, (B_dData_dList.C_List__x58__x58_ (114, B_dData_dList.C_List_Nil)))) else (if (if (mc0 >= 32) then (mc0 <= 126) else false) then (B_dData_dList.C_List__x58__x58_ (mc0, B_dData_dList.C_List_Nil)) else (B_dData_dList.dtp_unpack ("\\" ^ (v_ocamlPad3 (bi_strFromInt mc0)))))))))))

# 56 "Vuna/Compiler/Codegen/Decl.vuna"
let v_ocamlString = (fun (s : string) -> (String.concat "" ["\""; (B_dData_dList.dtp_pack ((B_dData_dList.v_concatMap v_ocamlEscapeChar) (B_dData_dList.dtp_unpack s))); "\""]))

# 66 "Vuna/Compiler/Codegen/Decl.vuna"
let v_localName = (fun (name : string) -> (B_dData_dPair.v_secondOf (Base_dSource.v_splitLastDot (Base_dSource.v_splitOnDot name))))

# 69 "Vuna/Compiler/Codegen/Decl.vuna"
let v_valueName = (fun (name : string) -> ("v_" ^ (v_sanitizeName (v_localName name))))

# 74 "Vuna/Compiler/Codegen/Decl.vuna"
let v_boolText = (fun (mc0 : bool) -> (if mc0 then "true" else "false"))

# 79 "Vuna/Compiler/Codegen/Decl.vuna"
let v_typeName = (fun (name : string) -> ("t_" ^ (v_sanitizeName (v_localName name))))

# 83 "Vuna/Compiler/Codegen/Decl.vuna"
let v_ctorOcamlName = (fun (family : string) (ctor : string) -> (String.concat "" ["C_"; (v_sanitizeName (v_localName family)); "_"; (v_sanitizeName (Frontend_dAst.v_ctorShortName ctor))]))

# 88 "Vuna/Compiler/Codegen/Decl.vuna"
let v_recordFieldLabel = (fun (family : string) (field : string) -> (String.concat "" ["f_"; (v_sanitizeName (v_localName family)); "_"; (v_sanitizeName field)]))

# 110 "Vuna/Compiler/Codegen/Decl.vuna"
let v_noQual = { f_QualCtx_qcUnit = ""; f_QualCtx_qcDefs = ((B_dContainer_dHashMap.v_fromList B_dData_dString.v_Hashable_uString) B_dData_dList.C_List_Nil); f_QualCtx_qcDatas = ((B_dContainer_dHashMap.v_fromList B_dData_dString.v_Hashable_uString) B_dData_dList.C_List_Nil) }

# 113 "Vuna/Compiler/Codegen/Decl.vuna"
let v_unitTblOf = (fun (pairs : (string, string) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (((B_dContainer_dHashMap.v_insertAll B_dData_dString.v_Hashable_uString) pairs) ((B_dContainer_dHashMap.v_fromList B_dData_dString.v_Hashable_uString) B_dData_dList.C_List_Nil)))

# 116 "Vuna/Compiler/Codegen/Decl.vuna"
let v_unitOfTbl = (fun (tbl : (string, string) B_dContainer_dHashMap.t_HashMap) (name : string) -> (match ((((B_dContainer_dHashMap.v_lookup B_dData_dString.v_Hashable_uString) B_dData_dString.v_Eq_uString) name) tbl) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__0) -> dtb__0
  | B_dData_dMaybe.C_Maybe_Nothing -> ""
  | _ -> failwith "DT: impossible branch"
))

# 122 "Vuna/Compiler/Codegen/Decl.vuna"
let v_qualOf = (fun (unit : string) (defs : (string, string) B_dData_dPair.t_Pair B_dData_dList.t_List) (datas : (string, string) B_dData_dPair.t_Pair B_dData_dList.t_List) -> { f_QualCtx_qcUnit = unit; f_QualCtx_qcDefs = (v_unitTblOf defs); f_QualCtx_qcDatas = (v_unitTblOf datas) })

# 126 "Vuna/Compiler/Codegen/Decl.vuna"
let v_qualPrefix = (fun (qc : t_QualCtx) (owner : string) (text : string) -> (if (if (owner = "") then true else (owner = (qc).f_QualCtx_qcUnit)) then { B_dData_dPair.f_Pair_first = text; B_dData_dPair.f_Pair_second = "" } else { B_dData_dPair.f_Pair_first = (String.concat "" [owner; "."; text]); B_dData_dPair.f_Pair_second = owner }))

# 131 "Vuna/Compiler/Codegen/Decl.vuna"
let v_qualValueText = (fun (qc : t_QualCtx) (name : string) -> (((v_qualPrefix qc) ((v_unitOfTbl (qc).f_QualCtx_qcDefs) name)) (v_valueName name)))

# 134 "Vuna/Compiler/Codegen/Decl.vuna"
let v_qualCtorText = (fun (qc : t_QualCtx) (family : string) (ctor : string) -> (((v_qualPrefix qc) ((v_unitOfTbl (qc).f_QualCtx_qcDatas) family)) ((v_ctorOcamlName family) ctor)))

# 138 "Vuna/Compiler/Codegen/Decl.vuna"
let v_qualTypeText = (fun (qc : t_QualCtx) (name : string) -> (((v_qualPrefix qc) ((v_unitOfTbl (qc).f_QualCtx_qcDatas) name)) (v_typeName name)))

# 144 "Vuna/Compiler/Codegen/Decl.vuna"
let v_ocamlReservedWords = (B_dData_dList.C_List__x58__x58_ ("and", (B_dData_dList.C_List__x58__x58_ ("as", (B_dData_dList.C_List__x58__x58_ ("assert", (B_dData_dList.C_List__x58__x58_ ("asr", (B_dData_dList.C_List__x58__x58_ ("begin", (B_dData_dList.C_List__x58__x58_ ("class", (B_dData_dList.C_List__x58__x58_ ("constraint", (B_dData_dList.C_List__x58__x58_ ("do", (B_dData_dList.C_List__x58__x58_ ("done", (B_dData_dList.C_List__x58__x58_ ("downto", (B_dData_dList.C_List__x58__x58_ ("else", (B_dData_dList.C_List__x58__x58_ ("end", (B_dData_dList.C_List__x58__x58_ ("exception", (B_dData_dList.C_List__x58__x58_ ("external", (B_dData_dList.C_List__x58__x58_ ("false", (B_dData_dList.C_List__x58__x58_ ("for", (B_dData_dList.C_List__x58__x58_ ("fun", (B_dData_dList.C_List__x58__x58_ ("function", (B_dData_dList.C_List__x58__x58_ ("functor", (B_dData_dList.C_List__x58__x58_ ("if", (B_dData_dList.C_List__x58__x58_ ("in", (B_dData_dList.C_List__x58__x58_ ("include", (B_dData_dList.C_List__x58__x58_ ("inherit", (B_dData_dList.C_List__x58__x58_ ("initializer", (B_dData_dList.C_List__x58__x58_ ("land", (B_dData_dList.C_List__x58__x58_ ("lazy", (B_dData_dList.C_List__x58__x58_ ("let", (B_dData_dList.C_List__x58__x58_ ("lor", (B_dData_dList.C_List__x58__x58_ ("lsl", (B_dData_dList.C_List__x58__x58_ ("lsr", (B_dData_dList.C_List__x58__x58_ ("lxor", (B_dData_dList.C_List__x58__x58_ ("match", (B_dData_dList.C_List__x58__x58_ ("method", (B_dData_dList.C_List__x58__x58_ ("mod", (B_dData_dList.C_List__x58__x58_ ("module", (B_dData_dList.C_List__x58__x58_ ("mutable", (B_dData_dList.C_List__x58__x58_ ("new", (B_dData_dList.C_List__x58__x58_ ("nonrec", (B_dData_dList.C_List__x58__x58_ ("object", (B_dData_dList.C_List__x58__x58_ ("of", (B_dData_dList.C_List__x58__x58_ ("open", (B_dData_dList.C_List__x58__x58_ ("or", (B_dData_dList.C_List__x58__x58_ ("private", (B_dData_dList.C_List__x58__x58_ ("rec", (B_dData_dList.C_List__x58__x58_ ("sig", (B_dData_dList.C_List__x58__x58_ ("struct", (B_dData_dList.C_List__x58__x58_ ("then", (B_dData_dList.C_List__x58__x58_ ("to", (B_dData_dList.C_List__x58__x58_ ("true", (B_dData_dList.C_List__x58__x58_ ("try", (B_dData_dList.C_List__x58__x58_ ("type", (B_dData_dList.C_List__x58__x58_ ("val", (B_dData_dList.C_List__x58__x58_ ("virtual", (B_dData_dList.C_List__x58__x58_ ("when", (B_dData_dList.C_List__x58__x58_ ("while", (B_dData_dList.C_List__x58__x58_ ("with", B_dData_dList.C_List_Nil))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))

# 205 "Vuna/Compiler/Codegen/Decl.vuna"
let v_ocamlBinderName = (fun (name : string) -> ((fun oc -> (if ((B_dData_dList.v_memName oc) v_ocamlReservedWords) then (oc ^ "_") else oc)) (v_sanitizeName name)))

# 218 "Vuna/Compiler/Codegen/Decl.vuna"
let v_irBinderText = (fun (mc0 : Vuna_dIr_dModel.t_IrBinder) -> (match mc0 with
  | { Vuna_dIr_dModel.f_IrBinder_irBinderName = dtb__1; Vuna_dIr_dModel.f_IrBinder_irBinderErased = dtb__2; Vuna_dIr_dModel.f_IrBinder_irBinderTy = dtb__3 } -> (match dtb__1 with
  | Vuna_dIr_dModel.C_IrBName_IrBWild -> "_"
  | Vuna_dIr_dModel.C_IrBName_IrBNat (dtb__4) -> ("dtnat__" ^ (bi_strFromInt dtb__4))
  | Vuna_dIr_dModel.C_IrBName_IrBArm (dtb__5) -> ("dtb__" ^ (bi_strFromInt dtb__5))
  | Vuna_dIr_dModel.C_IrBName_IrBUser (dtb__6) -> (v_ocamlBinderName dtb__6)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 228 "Vuna/Compiler/Codegen/Decl.vuna"
let v_qualFamOf = (fun (qc : t_QualCtx) (fam : string) -> (B_dData_dPair.v_firstOf ((v_qualTypeText qc) fam)))

# 231 "Vuna/Compiler/Codegen/Decl.vuna"
let rec v_toOTy = (fun (mc0 : Vuna_dIr_dModel.t_IrTy) -> (match mc0 with
  | Vuna_dIr_dModel.C_IrTy_IrTyData (dtb__7, dtb__8) -> (Codegen_dOcaml_dModel.C_OTy_OTData (dtb__7, ((B_dData_dList.v_map v_toOTy) dtb__8)))
  | Vuna_dIr_dModel.C_IrTy_IrTyFun (dtb__9, dtb__10) -> (Codegen_dOcaml_dModel.C_OTy_OTFun ((v_toOTy dtb__9), (v_toOTy dtb__10)))
  | Vuna_dIr_dModel.C_IrTy_IrTyRef (dtb__11) -> (Codegen_dOcaml_dModel.C_OTy_OTRef ((v_toOTy dtb__11)))
  | Vuna_dIr_dModel.C_IrTy_IrTyArray (dtb__12) -> (Codegen_dOcaml_dModel.C_OTy_OTArray ((v_toOTy dtb__12)))
  | Vuna_dIr_dModel.C_IrTy_IrTyOpaque -> Codegen_dOcaml_dModel.C_OTy_OTOpaque
  | Vuna_dIr_dModel.C_IrTy_IrTyFloat -> Codegen_dOcaml_dModel.C_OTy_OTFloat
  | Vuna_dIr_dModel.C_IrTy_IrTyBool -> Codegen_dOcaml_dModel.C_OTy_OTBool
  | Vuna_dIr_dModel.C_IrTy_IrTyStr -> Codegen_dOcaml_dModel.C_OTy_OTStr
  | Vuna_dIr_dModel.C_IrTy_IrTyInt -> Codegen_dOcaml_dModel.C_OTy_OTInt
  | Vuna_dIr_dModel.C_IrTy_IrTyVar (dtb__13) -> (Codegen_dOcaml_dModel.C_OTy_OTVar (dtb__13))
  | _ -> failwith "DT: impossible branch"
))

# 224 "Vuna/Compiler/Codegen/Decl.vuna"
let v_irTyText = (fun (qc : t_QualCtx) (ty : Vuna_dIr_dModel.t_IrTy) -> ((Codegen_dOcaml_dRender.v_renderTy (v_qualFamOf qc)) (v_toOTy ty)))

# 249 "Vuna/Compiler/Codegen/Decl.vuna"
let v_toOCtor = (fun (mc0 : string) (mc1 : (string, Vuna_dIr_dModel.t_IrTy B_dData_dList.t_List) B_dData_dPair.t_Pair) -> (match mc1 with
  | { B_dData_dPair.f_Pair_first = dtb__14; B_dData_dPair.f_Pair_second = dtb__15 } -> { Codegen_dOcaml_dModel.f_OCtor_ocName = ((v_ctorOcamlName mc0) dtb__14); Codegen_dOcaml_dModel.f_OCtor_ocFields = ((B_dData_dList.v_map v_toOTy) dtb__15) }
  | _ -> failwith "DT: impossible branch"
))

# 252 "Vuna/Compiler/Codegen/Decl.vuna"
let rec v_recordFieldsOf = (fun (mc0 : string) (mc1 : (int, string) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc2 : Vuna_dIr_dModel.t_IrTy B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__16, dtb__17) -> (match mc2 with
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | B_dData_dList.C_List__x58__x58_ (dtb__18, dtb__19) -> (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = ((v_recordFieldLabel mc0) (B_dData_dPair.v_secondOf dtb__16)); B_dData_dPair.f_Pair_second = (v_toOTy dtb__18) }, (((v_recordFieldsOf mc0) dtb__17) dtb__19)))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 243 "Vuna/Compiler/Codegen/Decl.vuna"
let v_toODecl = (fun (mc0 : Vuna_dIr_dModel.t_IrTyDecl) -> (match mc0 with
  | Vuna_dIr_dModel.C_IrTyDecl_IrUnboxedDecl (dtb__20, dtb__21, dtb__22) -> (Codegen_dOcaml_dModel.C_ODecl_ODAlias (dtb__21, (v_typeName dtb__20), (v_toOTy dtb__22)))
  | Vuna_dIr_dModel.C_IrTyDecl_IrRecordDecl (dtb__23, dtb__24, dtb__25, dtb__26) -> (Codegen_dOcaml_dModel.C_ODecl_ODRecord (dtb__24, (v_typeName dtb__23), (((v_recordFieldsOf dtb__23) dtb__25) dtb__26)))
  | Vuna_dIr_dModel.C_IrTyDecl_IrVariantDecl (dtb__27, dtb__28, dtb__29) -> (Codegen_dOcaml_dModel.C_ODecl_ODVariant (dtb__28, (v_typeName dtb__27), ((B_dData_dList.v_map (v_toOCtor dtb__27)) dtb__29)))
  | _ -> failwith "DT: impossible branch"
))

# 260 "Vuna/Compiler/Codegen/Decl.vuna"
let v_irTypeDeclsText = (fun (qc : t_QualCtx) (decls : Vuna_dIr_dModel.t_IrTyDecl B_dData_dList.t_List) -> ((Codegen_dOcaml_dRender.v_renderDecls (v_qualFamOf qc)) ((B_dData_dList.v_map v_toODecl) decls)))

# 267 "Vuna/Compiler/Codegen/Decl.vuna"
let rec v_irTyGlobalNames = (fun (mc0 : Vuna_dIr_dModel.t_IrTy) -> (match mc0 with
  | Vuna_dIr_dModel.C_IrTy_IrTyData (dtb__30, dtb__31) -> (B_dData_dList.C_List__x58__x58_ (dtb__30, ((B_dData_dList.v_concatMap v_irTyGlobalNames) dtb__31)))
  | Vuna_dIr_dModel.C_IrTy_IrTyFun (dtb__32, dtb__33) -> ((B_dData_dList.v_append (v_irTyGlobalNames dtb__32)) (v_irTyGlobalNames dtb__33))
  | Vuna_dIr_dModel.C_IrTy_IrTyRef (dtb__34) -> (v_irTyGlobalNames dtb__34)
  | Vuna_dIr_dModel.C_IrTy_IrTyArray (dtb__35) -> (v_irTyGlobalNames dtb__35)
  | Vuna_dIr_dModel.C_IrTy_IrTyOpaque -> B_dData_dList.C_List_Nil
  | Vuna_dIr_dModel.C_IrTy_IrTyFloat -> B_dData_dList.C_List_Nil
  | Vuna_dIr_dModel.C_IrTy_IrTyBool -> B_dData_dList.C_List_Nil
  | Vuna_dIr_dModel.C_IrTy_IrTyStr -> B_dData_dList.C_List_Nil
  | Vuna_dIr_dModel.C_IrTy_IrTyInt -> B_dData_dList.C_List_Nil
  | Vuna_dIr_dModel.C_IrTy_IrTyVar (dtb__36) -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 279 "Vuna/Compiler/Codegen/Decl.vuna"
let rec v_irTyDepsGo = (fun (mc0 : t_QualCtx) (mc1 : string B_dData_dList.t_List) (mc2 : string B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__37, dtb__38) -> ((fun owner -> (if (if (owner = "") then true else (owner = (mc0).f_QualCtx_qcUnit)) then (((v_irTyDepsGo mc0) dtb__38) mc2) else (if ((B_dData_dList.v_memName owner) mc2) then (((v_irTyDepsGo mc0) dtb__38) mc2) else (((v_irTyDepsGo mc0) dtb__38) (B_dData_dList.C_List__x58__x58_ (owner, mc2)))))) ((v_unitOfTbl (mc0).f_QualCtx_qcDatas) dtb__37))
  | B_dData_dList.C_List_Nil -> (B_dData_dList.v_reverse mc2)
  | _ -> failwith "DT: impossible branch"
))

# 264 "Vuna/Compiler/Codegen/Decl.vuna"
let v_irTyDeclDeps = (fun (qc : t_QualCtx) (tys : Vuna_dIr_dModel.t_IrTy B_dData_dList.t_List) -> (((v_irTyDepsGo qc) ((B_dData_dList.v_concatMap v_irTyGlobalNames) tys)) B_dData_dList.C_List_Nil))
