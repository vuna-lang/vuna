open Vuna_runtime
type t_Vuna_dCompiler_dCodegen_dDecl_dQualCtx = { f_Vuna_dCompiler_dCodegen_dDecl_dQualCtx_qcUnit : string; f_Vuna_dCompiler_dCodegen_dDecl_dQualCtx_qcDefs : (string, string) Base_dContainer_dHashMap.t_Base_dContainer_dHashMap_dHashMap; f_Vuna_dCompiler_dCodegen_dDecl_dQualCtx_qcDatas : (string, string) Base_dContainer_dHashMap.t_Base_dContainer_dHashMap_dHashMap }

# 30 "Vuna/Compiler/Codegen/Decl.vuna"
let v_Vuna_dCompiler_dCodegen_dDecl_disAsciiAlphaNum = (fun c -> (if (if (if (c >= 65) then (c <= 90) else false) then true else (if (c >= 97) then (c <= 122) else false)) then true else (if (c >= 48) then (c <= 57) else false)))

# 34 "Vuna/Compiler/Codegen/Decl.vuna"
let v_Vuna_dCompiler_dCodegen_dDecl_dsanitizeChar = (fun (mc0 : int) -> (if (mc0 = 46) then (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (95, (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (100, Base_dData_dList.C_Base_dData_dList_dList_Nil)))) else (if (mc0 = 95) then (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (95, (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (117, Base_dData_dList.C_Base_dData_dList_dList_Nil)))) else (if (mc0 = 39) then (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (95, (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (112, Base_dData_dList.C_Base_dData_dList_dList_Nil)))) else (if (mc0 = 35) then (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (95, (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (104, Base_dData_dList.C_Base_dData_dList_dList_Nil)))) else (if (v_Vuna_dCompiler_dCodegen_dDecl_disAsciiAlphaNum mc0) then (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (mc0, Base_dData_dList.C_Base_dData_dList_dList_Nil)) else (Base_dData_dList.dtp_unpack (String.concat "" ["_x"; (bi_strFromInt mc0); "_"]))))))))

# 41 "Vuna/Compiler/Codegen/Decl.vuna"
let v_Vuna_dCompiler_dCodegen_dDecl_dsanitizeName = (fun name -> (Base_dData_dList.dtp_pack ((Base_dData_dList.v_Base_dData_dList_dconcatMap v_Vuna_dCompiler_dCodegen_dDecl_dsanitizeChar) (Base_dData_dList.dtp_unpack name))))

# 44 "Vuna/Compiler/Codegen/Decl.vuna"
let v_Vuna_dCompiler_dCodegen_dDecl_docamlPad3 = (fun s -> (if ((bi_strLength s) = 1) then ("00" ^ s) else (if ((bi_strLength s) = 2) then ("0" ^ s) else s)))

# 47 "Vuna/Compiler/Codegen/Decl.vuna"
let v_Vuna_dCompiler_dCodegen_dDecl_docamlEscapeChar = (fun (mc0 : int) -> (if (mc0 = 34) then (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (92, (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (34, Base_dData_dList.C_Base_dData_dList_dList_Nil)))) else (if (mc0 = 92) then (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (92, (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (92, Base_dData_dList.C_Base_dData_dList_dList_Nil)))) else (if (mc0 = 10) then (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (92, (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (110, Base_dData_dList.C_Base_dData_dList_dList_Nil)))) else (if (mc0 = 9) then (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (92, (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (116, Base_dData_dList.C_Base_dData_dList_dList_Nil)))) else (if (mc0 = 13) then (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (92, (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (114, Base_dData_dList.C_Base_dData_dList_dList_Nil)))) else (if (if (mc0 >= 32) then (mc0 <= 126) else false) then (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (mc0, Base_dData_dList.C_Base_dData_dList_dList_Nil)) else (Base_dData_dList.dtp_unpack ("\\" ^ (v_Vuna_dCompiler_dCodegen_dDecl_docamlPad3 (bi_strFromInt mc0)))))))))))

# 55 "Vuna/Compiler/Codegen/Decl.vuna"
let v_Vuna_dCompiler_dCodegen_dDecl_docamlString = (fun s -> (String.concat "" ["\""; (Base_dData_dList.dtp_pack ((Base_dData_dList.v_Base_dData_dList_dconcatMap v_Vuna_dCompiler_dCodegen_dDecl_docamlEscapeChar) (Base_dData_dList.dtp_unpack s))); "\""]))

# 58 "Vuna/Compiler/Codegen/Decl.vuna"
let v_Vuna_dCompiler_dCodegen_dDecl_dvalueName = (fun name -> ("v_" ^ (v_Vuna_dCompiler_dCodegen_dDecl_dsanitizeName name)))

# 63 "Vuna/Compiler/Codegen/Decl.vuna"
let v_Vuna_dCompiler_dCodegen_dDecl_dboolText = (fun (mc0 : bool) -> (if mc0 then "true" else "false"))

# 68 "Vuna/Compiler/Codegen/Decl.vuna"
let v_Vuna_dCompiler_dCodegen_dDecl_dtypeName = (fun name -> ("t_" ^ (v_Vuna_dCompiler_dCodegen_dDecl_dsanitizeName name)))

# 72 "Vuna/Compiler/Codegen/Decl.vuna"
let v_Vuna_dCompiler_dCodegen_dDecl_dctorOcamlName = (fun family ctor -> (String.concat "" ["C_"; (v_Vuna_dCompiler_dCodegen_dDecl_dsanitizeName family); "_"; (v_Vuna_dCompiler_dCodegen_dDecl_dsanitizeName (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dctorShortName ctor))]))

# 76 "Vuna/Compiler/Codegen/Decl.vuna"
let v_Vuna_dCompiler_dCodegen_dDecl_drecordFieldLabel = (fun family field -> (String.concat "" ["f_"; (v_Vuna_dCompiler_dCodegen_dDecl_dsanitizeName family); "_"; (v_Vuna_dCompiler_dCodegen_dDecl_dsanitizeName field)]))

# 97 "Vuna/Compiler/Codegen/Decl.vuna"
let v_Vuna_dCompiler_dCodegen_dDecl_dnoQual = { f_Vuna_dCompiler_dCodegen_dDecl_dQualCtx_qcUnit = ""; f_Vuna_dCompiler_dCodegen_dDecl_dQualCtx_qcDefs = ((Base_dContainer_dHashMap.v_Base_dContainer_dHashMap_dfromList Base_dData_dString.v_Hashable_uString) Base_dData_dList.C_Base_dData_dList_dList_Nil); f_Vuna_dCompiler_dCodegen_dDecl_dQualCtx_qcDatas = ((Base_dContainer_dHashMap.v_Base_dContainer_dHashMap_dfromList Base_dData_dString.v_Hashable_uString) Base_dData_dList.C_Base_dData_dList_dList_Nil) }

# 100 "Vuna/Compiler/Codegen/Decl.vuna"
let v_Vuna_dCompiler_dCodegen_dDecl_dunitTblOf = (fun pairs -> (((Base_dContainer_dHashMap.v_Base_dContainer_dHashMap_dinsertAll Base_dData_dString.v_Hashable_uString) pairs) ((Base_dContainer_dHashMap.v_Base_dContainer_dHashMap_dfromList Base_dData_dString.v_Hashable_uString) Base_dData_dList.C_Base_dData_dList_dList_Nil)))

# 103 "Vuna/Compiler/Codegen/Decl.vuna"
let v_Vuna_dCompiler_dCodegen_dDecl_dunitOfTbl = (fun tbl name -> (match ((((Base_dContainer_dHashMap.v_Base_dContainer_dHashMap_dlookup Base_dData_dString.v_Hashable_uString) Base_dData_dString.v_Eq_uString) name) tbl) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__0) -> dtb__0
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> ""
  | _ -> failwith "DT: impossible branch"
))

# 109 "Vuna/Compiler/Codegen/Decl.vuna"
let v_Vuna_dCompiler_dCodegen_dDecl_dqualOf = (fun unit defs datas -> { f_Vuna_dCompiler_dCodegen_dDecl_dQualCtx_qcUnit = unit; f_Vuna_dCompiler_dCodegen_dDecl_dQualCtx_qcDefs = (v_Vuna_dCompiler_dCodegen_dDecl_dunitTblOf defs); f_Vuna_dCompiler_dCodegen_dDecl_dQualCtx_qcDatas = (v_Vuna_dCompiler_dCodegen_dDecl_dunitTblOf datas) })

# 113 "Vuna/Compiler/Codegen/Decl.vuna"
let v_Vuna_dCompiler_dCodegen_dDecl_dqualPrefix = (fun qc owner text -> (if (if (owner = "") then true else (owner = (qc).f_Vuna_dCompiler_dCodegen_dDecl_dQualCtx_qcUnit)) then { Base_dData_dPair.f_Base_dData_dPair_dPair_first = text; Base_dData_dPair.f_Base_dData_dPair_dPair_second = "" } else { Base_dData_dPair.f_Base_dData_dPair_dPair_first = (String.concat "" [owner; "."; text]); Base_dData_dPair.f_Base_dData_dPair_dPair_second = owner }))

# 118 "Vuna/Compiler/Codegen/Decl.vuna"
let v_Vuna_dCompiler_dCodegen_dDecl_dqualValueText = (fun qc name -> (((v_Vuna_dCompiler_dCodegen_dDecl_dqualPrefix qc) ((v_Vuna_dCompiler_dCodegen_dDecl_dunitOfTbl (qc).f_Vuna_dCompiler_dCodegen_dDecl_dQualCtx_qcDefs) name)) (v_Vuna_dCompiler_dCodegen_dDecl_dvalueName name)))

# 121 "Vuna/Compiler/Codegen/Decl.vuna"
let v_Vuna_dCompiler_dCodegen_dDecl_dqualCtorText = (fun qc family ctor -> (((v_Vuna_dCompiler_dCodegen_dDecl_dqualPrefix qc) ((v_Vuna_dCompiler_dCodegen_dDecl_dunitOfTbl (qc).f_Vuna_dCompiler_dCodegen_dDecl_dQualCtx_qcDatas) family)) ((v_Vuna_dCompiler_dCodegen_dDecl_dctorOcamlName family) ctor)))

# 125 "Vuna/Compiler/Codegen/Decl.vuna"
let v_Vuna_dCompiler_dCodegen_dDecl_dqualTypeText = (fun qc name -> (((v_Vuna_dCompiler_dCodegen_dDecl_dqualPrefix qc) ((v_Vuna_dCompiler_dCodegen_dDecl_dunitOfTbl (qc).f_Vuna_dCompiler_dCodegen_dDecl_dQualCtx_qcDatas) name)) (v_Vuna_dCompiler_dCodegen_dDecl_dtypeName name)))

# 131 "Vuna/Compiler/Codegen/Decl.vuna"
let v_Vuna_dCompiler_dCodegen_dDecl_docamlReservedWords = (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ("and", (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ("as", (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ("assert", (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ("asr", (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ("begin", (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ("class", (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ("constraint", (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ("do", (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ("done", (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ("downto", (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ("else", (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ("end", (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ("exception", (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ("external", (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ("false", (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ("for", (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ("fun", (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ("function", (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ("functor", (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ("if", (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ("in", (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ("include", (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ("inherit", (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ("initializer", (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ("land", (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ("lazy", (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ("let", (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ("lor", (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ("lsl", (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ("lsr", (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ("lxor", (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ("match", (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ("method", (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ("mod", (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ("module", (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ("mutable", (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ("new", (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ("nonrec", (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ("object", (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ("of", (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ("open", (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ("or", (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ("private", (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ("rec", (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ("sig", (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ("struct", (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ("then", (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ("to", (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ("true", (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ("try", (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ("type", (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ("val", (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ("virtual", (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ("when", (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ("while", (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ("with", Base_dData_dList.C_Base_dData_dList_dList_Nil))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))

# 192 "Vuna/Compiler/Codegen/Decl.vuna"
let v_Vuna_dCompiler_dCodegen_dDecl_docamlBinderName = (fun name -> ((fun oc -> (if ((Base_dData_dList.v_Base_dData_dList_dmemName oc) v_Vuna_dCompiler_dCodegen_dDecl_docamlReservedWords) then (oc ^ "_") else oc)) (v_Vuna_dCompiler_dCodegen_dDecl_dsanitizeName name)))

# 205 "Vuna/Compiler/Codegen/Decl.vuna"
let v_Vuna_dCompiler_dCodegen_dDecl_dirBinderText = (fun (mc0 : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrBinder) -> (match mc0 with
  | { Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrBinder_irBinderName = dtb__1; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrBinder_irBinderErased = dtb__2; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrBinder_irBinderTy = dtb__3 } -> (match dtb__1 with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrBName_IrBWild -> "_"
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrBName_IrBNat (dtb__4) -> ("dtnat__" ^ (bi_strFromInt dtb__4))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrBName_IrBArm (dtb__5) -> ("dtb__" ^ (bi_strFromInt dtb__5))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrBName_IrBUser (dtb__6) -> (v_Vuna_dCompiler_dCodegen_dDecl_docamlBinderName dtb__6)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 215 "Vuna/Compiler/Codegen/Decl.vuna"
let v_Vuna_dCompiler_dCodegen_dDecl_dqualFamOf = (fun qc fam -> (Base_dData_dPair.v_Base_dData_dPair_dfirstOf ((v_Vuna_dCompiler_dCodegen_dDecl_dqualTypeText qc) fam)))

# 218 "Vuna/Compiler/Codegen/Decl.vuna"
let rec v_Vuna_dCompiler_dCodegen_dDecl_dtoOTy = (fun (mc0 : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrTy) -> (match mc0 with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyData (dtb__7, dtb__8) -> (Vuna_dCompiler_dCodegen_dOcaml_dModel.C_Vuna_dCompiler_dCodegen_dOcaml_dModel_dOTy_OTData (dtb__7, ((Base_dData_dList.v_Base_dData_dList_dmap v_Vuna_dCompiler_dCodegen_dDecl_dtoOTy) dtb__8)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyFun (dtb__9, dtb__10) -> (Vuna_dCompiler_dCodegen_dOcaml_dModel.C_Vuna_dCompiler_dCodegen_dOcaml_dModel_dOTy_OTFun ((v_Vuna_dCompiler_dCodegen_dDecl_dtoOTy dtb__9), (v_Vuna_dCompiler_dCodegen_dDecl_dtoOTy dtb__10)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyRef (dtb__11) -> (Vuna_dCompiler_dCodegen_dOcaml_dModel.C_Vuna_dCompiler_dCodegen_dOcaml_dModel_dOTy_OTRef ((v_Vuna_dCompiler_dCodegen_dDecl_dtoOTy dtb__11)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyArray (dtb__12) -> (Vuna_dCompiler_dCodegen_dOcaml_dModel.C_Vuna_dCompiler_dCodegen_dOcaml_dModel_dOTy_OTArray ((v_Vuna_dCompiler_dCodegen_dDecl_dtoOTy dtb__12)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyOpaque -> Vuna_dCompiler_dCodegen_dOcaml_dModel.C_Vuna_dCompiler_dCodegen_dOcaml_dModel_dOTy_OTOpaque
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyFloat -> Vuna_dCompiler_dCodegen_dOcaml_dModel.C_Vuna_dCompiler_dCodegen_dOcaml_dModel_dOTy_OTFloat
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyBool -> Vuna_dCompiler_dCodegen_dOcaml_dModel.C_Vuna_dCompiler_dCodegen_dOcaml_dModel_dOTy_OTBool
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyStr -> Vuna_dCompiler_dCodegen_dOcaml_dModel.C_Vuna_dCompiler_dCodegen_dOcaml_dModel_dOTy_OTStr
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyInt -> Vuna_dCompiler_dCodegen_dOcaml_dModel.C_Vuna_dCompiler_dCodegen_dOcaml_dModel_dOTy_OTInt
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyVar (dtb__13) -> (Vuna_dCompiler_dCodegen_dOcaml_dModel.C_Vuna_dCompiler_dCodegen_dOcaml_dModel_dOTy_OTVar (dtb__13))
  | _ -> failwith "DT: impossible branch"
))

# 211 "Vuna/Compiler/Codegen/Decl.vuna"
let v_Vuna_dCompiler_dCodegen_dDecl_dirTyText = (fun qc ty -> ((Vuna_dCompiler_dCodegen_dOcaml_dRender.v_Vuna_dCompiler_dCodegen_dOcaml_dRender_drenderTy (v_Vuna_dCompiler_dCodegen_dDecl_dqualFamOf qc)) (v_Vuna_dCompiler_dCodegen_dDecl_dtoOTy ty)))

# 236 "Vuna/Compiler/Codegen/Decl.vuna"
let v_Vuna_dCompiler_dCodegen_dDecl_dtoOCtor = (fun (mc0 : string) (mc1 : (string, Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrTy Base_dData_dList.t_Base_dData_dList_dList) Base_dData_dPair.t_Base_dData_dPair_dPair) -> (match mc1 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__14; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__15 } -> { Vuna_dCompiler_dCodegen_dOcaml_dModel.f_Vuna_dCompiler_dCodegen_dOcaml_dModel_dOCtor_ocName = ((v_Vuna_dCompiler_dCodegen_dDecl_dctorOcamlName mc0) dtb__14); Vuna_dCompiler_dCodegen_dOcaml_dModel.f_Vuna_dCompiler_dCodegen_dOcaml_dModel_dOCtor_ocFields = ((Base_dData_dList.v_Base_dData_dList_dmap v_Vuna_dCompiler_dCodegen_dDecl_dtoOTy) dtb__15) }
  | _ -> failwith "DT: impossible branch"
))

# 239 "Vuna/Compiler/Codegen/Decl.vuna"
let rec v_Vuna_dCompiler_dCodegen_dDecl_drecordFieldsOf = (fun (mc0 : string) (mc1 : (int, string) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (mc2 : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrTy Base_dData_dList.t_Base_dData_dList_dList) -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__16, dtb__17) -> (match mc2 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__18, dtb__19) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = ((v_Vuna_dCompiler_dCodegen_dDecl_drecordFieldLabel mc0) (Base_dData_dPair.v_Base_dData_dPair_dsecondOf dtb__16)); Base_dData_dPair.f_Base_dData_dPair_dPair_second = (v_Vuna_dCompiler_dCodegen_dDecl_dtoOTy dtb__18) }, (((v_Vuna_dCompiler_dCodegen_dDecl_drecordFieldsOf mc0) dtb__17) dtb__19)))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 230 "Vuna/Compiler/Codegen/Decl.vuna"
let v_Vuna_dCompiler_dCodegen_dDecl_dtoODecl = (fun (mc0 : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrTyDecl) -> (match mc0 with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTyDecl_IrUnboxedDecl (dtb__20, dtb__21, dtb__22) -> (Vuna_dCompiler_dCodegen_dOcaml_dModel.C_Vuna_dCompiler_dCodegen_dOcaml_dModel_dODecl_ODAlias (dtb__21, (v_Vuna_dCompiler_dCodegen_dDecl_dtypeName dtb__20), (v_Vuna_dCompiler_dCodegen_dDecl_dtoOTy dtb__22)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTyDecl_IrRecordDecl (dtb__23, dtb__24, dtb__25, dtb__26) -> (Vuna_dCompiler_dCodegen_dOcaml_dModel.C_Vuna_dCompiler_dCodegen_dOcaml_dModel_dODecl_ODRecord (dtb__24, (v_Vuna_dCompiler_dCodegen_dDecl_dtypeName dtb__23), (((v_Vuna_dCompiler_dCodegen_dDecl_drecordFieldsOf dtb__23) dtb__25) dtb__26)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTyDecl_IrVariantDecl (dtb__27, dtb__28, dtb__29) -> (Vuna_dCompiler_dCodegen_dOcaml_dModel.C_Vuna_dCompiler_dCodegen_dOcaml_dModel_dODecl_ODVariant (dtb__28, (v_Vuna_dCompiler_dCodegen_dDecl_dtypeName dtb__27), ((Base_dData_dList.v_Base_dData_dList_dmap (v_Vuna_dCompiler_dCodegen_dDecl_dtoOCtor dtb__27)) dtb__29)))
  | _ -> failwith "DT: impossible branch"
))

# 247 "Vuna/Compiler/Codegen/Decl.vuna"
let v_Vuna_dCompiler_dCodegen_dDecl_dirTypeDeclsText = (fun qc decls -> ((Vuna_dCompiler_dCodegen_dOcaml_dRender.v_Vuna_dCompiler_dCodegen_dOcaml_dRender_drenderDecls (v_Vuna_dCompiler_dCodegen_dDecl_dqualFamOf qc)) ((Base_dData_dList.v_Base_dData_dList_dmap v_Vuna_dCompiler_dCodegen_dDecl_dtoODecl) decls)))

# 254 "Vuna/Compiler/Codegen/Decl.vuna"
let rec v_Vuna_dCompiler_dCodegen_dDecl_dirTyGlobalNames = (fun (mc0 : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrTy) -> (match mc0 with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyData (dtb__30, dtb__31) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__30, ((Base_dData_dList.v_Base_dData_dList_dconcatMap v_Vuna_dCompiler_dCodegen_dDecl_dirTyGlobalNames) dtb__31)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyFun (dtb__32, dtb__33) -> ((Base_dData_dList.v_Base_dData_dList_dappend (v_Vuna_dCompiler_dCodegen_dDecl_dirTyGlobalNames dtb__32)) (v_Vuna_dCompiler_dCodegen_dDecl_dirTyGlobalNames dtb__33))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyRef (dtb__34) -> (v_Vuna_dCompiler_dCodegen_dDecl_dirTyGlobalNames dtb__34)
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyArray (dtb__35) -> (v_Vuna_dCompiler_dCodegen_dDecl_dirTyGlobalNames dtb__35)
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyOpaque -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyFloat -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyBool -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyStr -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyInt -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyVar (dtb__36) -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 266 "Vuna/Compiler/Codegen/Decl.vuna"
let rec v_Vuna_dCompiler_dCodegen_dDecl_dirTyDepsGo = (fun (mc0 : t_Vuna_dCompiler_dCodegen_dDecl_dQualCtx) (mc1 : string Base_dData_dList.t_Base_dData_dList_dList) (mc2 : string Base_dData_dList.t_Base_dData_dList_dList) -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__37, dtb__38) -> ((fun owner -> (if (if (owner = "") then true else (owner = (mc0).f_Vuna_dCompiler_dCodegen_dDecl_dQualCtx_qcUnit)) then (((v_Vuna_dCompiler_dCodegen_dDecl_dirTyDepsGo mc0) dtb__38) mc2) else (if ((Base_dData_dList.v_Base_dData_dList_dmemName owner) mc2) then (((v_Vuna_dCompiler_dCodegen_dDecl_dirTyDepsGo mc0) dtb__38) mc2) else (((v_Vuna_dCompiler_dCodegen_dDecl_dirTyDepsGo mc0) dtb__38) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (owner, mc2)))))) ((v_Vuna_dCompiler_dCodegen_dDecl_dunitOfTbl (mc0).f_Vuna_dCompiler_dCodegen_dDecl_dQualCtx_qcDatas) dtb__37))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Base_dData_dList.v_Base_dData_dList_dreverse mc2)
  | _ -> failwith "DT: impossible branch"
))

# 251 "Vuna/Compiler/Codegen/Decl.vuna"
let v_Vuna_dCompiler_dCodegen_dDecl_dirTyDeclDeps = (fun qc tys -> (((v_Vuna_dCompiler_dCodegen_dDecl_dirTyDepsGo qc) ((Base_dData_dList.v_Base_dData_dList_dconcatMap v_Vuna_dCompiler_dCodegen_dDecl_dirTyGlobalNames) tys)) Base_dData_dList.C_Base_dData_dList_dList_Nil))
