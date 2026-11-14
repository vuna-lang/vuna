open Vuna_runtime
type t_Vuna_dCompiler_dCodegen_dDecl_dQualCtx = { f_Vuna_dCompiler_dCodegen_dDecl_dQualCtx_qcUnit : string; f_Vuna_dCompiler_dCodegen_dDecl_dQualCtx_qcDefs : (string, string) Base_dHashMap.t_Base_dHashMap_dHashMap; f_Vuna_dCompiler_dCodegen_dDecl_dQualCtx_qcDatas : (string, string) Base_dHashMap.t_Base_dHashMap_dHashMap }

# 26 "Vuna/Compiler/Codegen/Decl.vuna"
let v_Vuna_dCompiler_dCodegen_dDecl_disAsciiAlphaNum = (fun c -> (if (if (if (c >= 65) then (c <= 90) else false) then true else (if (c >= 97) then (c <= 122) else false)) then true else (if (c >= 48) then (c <= 57) else false)))

# 30 "Vuna/Compiler/Codegen/Decl.vuna"
let v_Vuna_dCompiler_dCodegen_dDecl_dsanitizeChar = (fun mc0 -> (if (mc0 = 46) then (Base_dList.C_Base_dList_dList_Cons (95, (Base_dList.C_Base_dList_dList_Cons (100, Base_dList.C_Base_dList_dList_Nil)))) else (if (mc0 = 95) then (Base_dList.C_Base_dList_dList_Cons (95, (Base_dList.C_Base_dList_dList_Cons (117, Base_dList.C_Base_dList_dList_Nil)))) else (if (mc0 = 39) then (Base_dList.C_Base_dList_dList_Cons (95, (Base_dList.C_Base_dList_dList_Cons (112, Base_dList.C_Base_dList_dList_Nil)))) else (if (mc0 = 35) then (Base_dList.C_Base_dList_dList_Cons (95, (Base_dList.C_Base_dList_dList_Cons (104, Base_dList.C_Base_dList_dList_Nil)))) else (if (v_Vuna_dCompiler_dCodegen_dDecl_disAsciiAlphaNum mc0) then (Base_dList.C_Base_dList_dList_Cons (mc0, Base_dList.C_Base_dList_dList_Nil)) else (Base_dList.dtp_unpack (String.concat "" ["_x"; (bi_strFromInt mc0); "_"]))))))))

# 37 "Vuna/Compiler/Codegen/Decl.vuna"
let v_Vuna_dCompiler_dCodegen_dDecl_dsanitizeName = (fun name -> (Base_dList.dtp_pack ((Base_dList.v_Base_dList_dconcatMap v_Vuna_dCompiler_dCodegen_dDecl_dsanitizeChar) (Base_dList.dtp_unpack name))))

# 40 "Vuna/Compiler/Codegen/Decl.vuna"
let v_Vuna_dCompiler_dCodegen_dDecl_docamlPad3 = (fun s -> (if ((bi_strLength s) = 1) then ("00" ^ s) else (if ((bi_strLength s) = 2) then ("0" ^ s) else s)))

# 43 "Vuna/Compiler/Codegen/Decl.vuna"
let v_Vuna_dCompiler_dCodegen_dDecl_docamlEscapeChar = (fun mc0 -> (if (mc0 = 34) then (Base_dList.C_Base_dList_dList_Cons (92, (Base_dList.C_Base_dList_dList_Cons (34, Base_dList.C_Base_dList_dList_Nil)))) else (if (mc0 = 92) then (Base_dList.C_Base_dList_dList_Cons (92, (Base_dList.C_Base_dList_dList_Cons (92, Base_dList.C_Base_dList_dList_Nil)))) else (if (mc0 = 10) then (Base_dList.C_Base_dList_dList_Cons (92, (Base_dList.C_Base_dList_dList_Cons (110, Base_dList.C_Base_dList_dList_Nil)))) else (if (mc0 = 9) then (Base_dList.C_Base_dList_dList_Cons (92, (Base_dList.C_Base_dList_dList_Cons (116, Base_dList.C_Base_dList_dList_Nil)))) else (if (mc0 = 13) then (Base_dList.C_Base_dList_dList_Cons (92, (Base_dList.C_Base_dList_dList_Cons (114, Base_dList.C_Base_dList_dList_Nil)))) else (if (if (mc0 >= 32) then (mc0 <= 126) else false) then (Base_dList.C_Base_dList_dList_Cons (mc0, Base_dList.C_Base_dList_dList_Nil)) else (Base_dList.dtp_unpack ("\\" ^ (v_Vuna_dCompiler_dCodegen_dDecl_docamlPad3 (bi_strFromInt mc0)))))))))))

# 51 "Vuna/Compiler/Codegen/Decl.vuna"
let v_Vuna_dCompiler_dCodegen_dDecl_docamlString = (fun s -> (String.concat "" ["\""; (Base_dList.dtp_pack ((Base_dList.v_Base_dList_dconcatMap v_Vuna_dCompiler_dCodegen_dDecl_docamlEscapeChar) (Base_dList.dtp_unpack s))); "\""]))

# 54 "Vuna/Compiler/Codegen/Decl.vuna"
let v_Vuna_dCompiler_dCodegen_dDecl_dvalueName = (fun name -> ("v_" ^ (v_Vuna_dCompiler_dCodegen_dDecl_dsanitizeName name)))

# 59 "Vuna/Compiler/Codegen/Decl.vuna"
let v_Vuna_dCompiler_dCodegen_dDecl_dboolText = (fun mc0 -> (if mc0 then "true" else "false"))

# 64 "Vuna/Compiler/Codegen/Decl.vuna"
let v_Vuna_dCompiler_dCodegen_dDecl_dtypeName = (fun name -> ("t_" ^ (v_Vuna_dCompiler_dCodegen_dDecl_dsanitizeName name)))

# 68 "Vuna/Compiler/Codegen/Decl.vuna"
let v_Vuna_dCompiler_dCodegen_dDecl_dctorOcamlName = (fun family ctor -> (String.concat "" ["C_"; (v_Vuna_dCompiler_dCodegen_dDecl_dsanitizeName family); "_"; (v_Vuna_dCompiler_dCodegen_dDecl_dsanitizeName (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dctorShortName ctor))]))

# 72 "Vuna/Compiler/Codegen/Decl.vuna"
let v_Vuna_dCompiler_dCodegen_dDecl_drecordFieldLabel = (fun family field -> (String.concat "" ["f_"; (v_Vuna_dCompiler_dCodegen_dDecl_dsanitizeName family); "_"; (v_Vuna_dCompiler_dCodegen_dDecl_dsanitizeName field)]))

# 93 "Vuna/Compiler/Codegen/Decl.vuna"
let v_Vuna_dCompiler_dCodegen_dDecl_dnoQual = { f_Vuna_dCompiler_dCodegen_dDecl_dQualCtx_qcUnit = ""; f_Vuna_dCompiler_dCodegen_dDecl_dQualCtx_qcDefs = ((Base_dHashMap.v_Base_dHashMap_dfromList Base_dString.v_Hashable_uString) Base_dList.C_Base_dList_dList_Nil); f_Vuna_dCompiler_dCodegen_dDecl_dQualCtx_qcDatas = ((Base_dHashMap.v_Base_dHashMap_dfromList Base_dString.v_Hashable_uString) Base_dList.C_Base_dList_dList_Nil) }

# 96 "Vuna/Compiler/Codegen/Decl.vuna"
let v_Vuna_dCompiler_dCodegen_dDecl_dunitTblOf = (fun pairs -> (((Base_dHashMap.v_Base_dHashMap_dinsertAll Base_dString.v_Hashable_uString) pairs) ((Base_dHashMap.v_Base_dHashMap_dfromList Base_dString.v_Hashable_uString) Base_dList.C_Base_dList_dList_Nil)))

# 99 "Vuna/Compiler/Codegen/Decl.vuna"
let v_Vuna_dCompiler_dCodegen_dDecl_dunitOfTbl = (fun tbl name -> (match ((((Base_dHashMap.v_Base_dHashMap_dlookup Base_dString.v_Hashable_uString) Base_dString.v_Eq_uString) name) tbl) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__0) -> dtb__0
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ""
  | _ -> failwith "DT: impossible branch"
))

# 104 "Vuna/Compiler/Codegen/Decl.vuna"
let v_Vuna_dCompiler_dCodegen_dDecl_dqualOf = (fun unit defs datas -> { f_Vuna_dCompiler_dCodegen_dDecl_dQualCtx_qcUnit = unit; f_Vuna_dCompiler_dCodegen_dDecl_dQualCtx_qcDefs = (v_Vuna_dCompiler_dCodegen_dDecl_dunitTblOf defs); f_Vuna_dCompiler_dCodegen_dDecl_dQualCtx_qcDatas = (v_Vuna_dCompiler_dCodegen_dDecl_dunitTblOf datas) })

# 108 "Vuna/Compiler/Codegen/Decl.vuna"
let v_Vuna_dCompiler_dCodegen_dDecl_dqualPrefix = (fun qc owner text -> (if (if (owner = "") then true else (owner = (qc).f_Vuna_dCompiler_dCodegen_dDecl_dQualCtx_qcUnit)) then { Base_dPair.f_Base_dPair_dPair_first = text; Base_dPair.f_Base_dPair_dPair_second = "" } else { Base_dPair.f_Base_dPair_dPair_first = (String.concat "" [owner; "."; text]); Base_dPair.f_Base_dPair_dPair_second = owner }))

# 113 "Vuna/Compiler/Codegen/Decl.vuna"
let v_Vuna_dCompiler_dCodegen_dDecl_dqualValueText = (fun qc name -> (((v_Vuna_dCompiler_dCodegen_dDecl_dqualPrefix qc) ((v_Vuna_dCompiler_dCodegen_dDecl_dunitOfTbl (qc).f_Vuna_dCompiler_dCodegen_dDecl_dQualCtx_qcDefs) name)) (v_Vuna_dCompiler_dCodegen_dDecl_dvalueName name)))

# 116 "Vuna/Compiler/Codegen/Decl.vuna"
let v_Vuna_dCompiler_dCodegen_dDecl_dqualCtorText = (fun qc family ctor -> (((v_Vuna_dCompiler_dCodegen_dDecl_dqualPrefix qc) ((v_Vuna_dCompiler_dCodegen_dDecl_dunitOfTbl (qc).f_Vuna_dCompiler_dCodegen_dDecl_dQualCtx_qcDatas) family)) ((v_Vuna_dCompiler_dCodegen_dDecl_dctorOcamlName family) ctor)))

# 120 "Vuna/Compiler/Codegen/Decl.vuna"
let v_Vuna_dCompiler_dCodegen_dDecl_dqualTypeText = (fun qc name -> (((v_Vuna_dCompiler_dCodegen_dDecl_dqualPrefix qc) ((v_Vuna_dCompiler_dCodegen_dDecl_dunitOfTbl (qc).f_Vuna_dCompiler_dCodegen_dDecl_dQualCtx_qcDatas) name)) (v_Vuna_dCompiler_dCodegen_dDecl_dtypeName name)))

# 126 "Vuna/Compiler/Codegen/Decl.vuna"
let v_Vuna_dCompiler_dCodegen_dDecl_docamlReservedWords = (Base_dList.C_Base_dList_dList_Cons ("and", (Base_dList.C_Base_dList_dList_Cons ("as", (Base_dList.C_Base_dList_dList_Cons ("assert", (Base_dList.C_Base_dList_dList_Cons ("asr", (Base_dList.C_Base_dList_dList_Cons ("begin", (Base_dList.C_Base_dList_dList_Cons ("class", (Base_dList.C_Base_dList_dList_Cons ("constraint", (Base_dList.C_Base_dList_dList_Cons ("do", (Base_dList.C_Base_dList_dList_Cons ("done", (Base_dList.C_Base_dList_dList_Cons ("downto", (Base_dList.C_Base_dList_dList_Cons ("else", (Base_dList.C_Base_dList_dList_Cons ("end", (Base_dList.C_Base_dList_dList_Cons ("exception", (Base_dList.C_Base_dList_dList_Cons ("external", (Base_dList.C_Base_dList_dList_Cons ("false", (Base_dList.C_Base_dList_dList_Cons ("for", (Base_dList.C_Base_dList_dList_Cons ("fun", (Base_dList.C_Base_dList_dList_Cons ("function", (Base_dList.C_Base_dList_dList_Cons ("functor", (Base_dList.C_Base_dList_dList_Cons ("if", (Base_dList.C_Base_dList_dList_Cons ("in", (Base_dList.C_Base_dList_dList_Cons ("include", (Base_dList.C_Base_dList_dList_Cons ("inherit", (Base_dList.C_Base_dList_dList_Cons ("initializer", (Base_dList.C_Base_dList_dList_Cons ("land", (Base_dList.C_Base_dList_dList_Cons ("lazy", (Base_dList.C_Base_dList_dList_Cons ("let", (Base_dList.C_Base_dList_dList_Cons ("lor", (Base_dList.C_Base_dList_dList_Cons ("lsl", (Base_dList.C_Base_dList_dList_Cons ("lsr", (Base_dList.C_Base_dList_dList_Cons ("lxor", (Base_dList.C_Base_dList_dList_Cons ("match", (Base_dList.C_Base_dList_dList_Cons ("method", (Base_dList.C_Base_dList_dList_Cons ("mod", (Base_dList.C_Base_dList_dList_Cons ("module", (Base_dList.C_Base_dList_dList_Cons ("mutable", (Base_dList.C_Base_dList_dList_Cons ("new", (Base_dList.C_Base_dList_dList_Cons ("nonrec", (Base_dList.C_Base_dList_dList_Cons ("object", (Base_dList.C_Base_dList_dList_Cons ("of", (Base_dList.C_Base_dList_dList_Cons ("open", (Base_dList.C_Base_dList_dList_Cons ("or", (Base_dList.C_Base_dList_dList_Cons ("private", (Base_dList.C_Base_dList_dList_Cons ("rec", (Base_dList.C_Base_dList_dList_Cons ("sig", (Base_dList.C_Base_dList_dList_Cons ("struct", (Base_dList.C_Base_dList_dList_Cons ("then", (Base_dList.C_Base_dList_dList_Cons ("to", (Base_dList.C_Base_dList_dList_Cons ("true", (Base_dList.C_Base_dList_dList_Cons ("try", (Base_dList.C_Base_dList_dList_Cons ("type", (Base_dList.C_Base_dList_dList_Cons ("val", (Base_dList.C_Base_dList_dList_Cons ("virtual", (Base_dList.C_Base_dList_dList_Cons ("when", (Base_dList.C_Base_dList_dList_Cons ("while", (Base_dList.C_Base_dList_dList_Cons ("with", Base_dList.C_Base_dList_dList_Nil))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))

# 186 "Vuna/Compiler/Codegen/Decl.vuna"
let v_Vuna_dCompiler_dCodegen_dDecl_docamlBinderName = (fun name -> ((fun oc -> (if ((Base_dList.v_Base_dList_dmemName oc) v_Vuna_dCompiler_dCodegen_dDecl_docamlReservedWords) then (oc ^ "_") else oc)) (v_Vuna_dCompiler_dCodegen_dDecl_dsanitizeName name)))

# 197 "Vuna/Compiler/Codegen/Decl.vuna"
let rec v_Vuna_dCompiler_dCodegen_dDecl_dinterpose = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__1, dtb__2) -> (match dtb__2 with
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dList.C_Base_dList_dList_Cons (dtb__1, Base_dList.C_Base_dList_dList_Nil))
  | _ -> (Base_dList.C_Base_dList_dList_Cons (dtb__1, (Base_dList.C_Base_dList_dList_Cons (mc0, ((v_Vuna_dCompiler_dCodegen_dDecl_dinterpose mc0) dtb__2)))))
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 194 "Vuna/Compiler/Codegen/Decl.vuna"
let v_Vuna_dCompiler_dCodegen_dDecl_djoinWith = (fun sep xs -> (Base_dList.dtp_concatMany ((v_Vuna_dCompiler_dCodegen_dDecl_dinterpose sep) xs)))

# 202 "Vuna/Compiler/Codegen/Decl.vuna"
let v_Vuna_dCompiler_dCodegen_dDecl_dtypeParamName = (fun i -> ("'a" ^ (bi_strFromInt i)))

# 205 "Vuna/Compiler/Codegen/Decl.vuna"
let v_Vuna_dCompiler_dCodegen_dDecl_dtypeParamNames = (fun n -> ((Base_dList.v_Base_dList_dmap v_Vuna_dCompiler_dCodegen_dDecl_dtypeParamName) ((Base_dList.v_Base_dList_drange 0) n)))

# 208 "Vuna/Compiler/Codegen/Decl.vuna"
let v_Vuna_dCompiler_dCodegen_dDecl_dtypeParamDecl = (fun mc0 -> (if (mc0 = 0) then "" else ((fun nd_uscrut1 -> (match nd_uscrut1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__3, dtb__4) -> (match dtb__4 with
  | Base_dList.C_Base_dList_dList_Nil -> (dtb__3 ^ " ")
  | _ -> (String.concat "" ["("; ((v_Vuna_dCompiler_dCodegen_dDecl_djoinWith ", ") nd_uscrut1); ") "])
)
  | _ -> (String.concat "" ["("; ((v_Vuna_dCompiler_dCodegen_dDecl_djoinWith ", ") nd_uscrut1); ") "])
)) (v_Vuna_dCompiler_dCodegen_dDecl_dtypeParamNames mc0))))

# 214 "Vuna/Compiler/Codegen/Decl.vuna"
let v_Vuna_dCompiler_dCodegen_dDecl_dfamilyTyText = (fun mc0 mc1 mc2 -> (match mc2 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__5, dtb__6) -> (match dtb__6 with
  | Base_dList.C_Base_dList_dList_Nil -> (String.concat "" [dtb__5; " "; (Base_dPair.v_Base_dPair_dfirstOf ((v_Vuna_dCompiler_dCodegen_dDecl_dqualTypeText mc0) mc1))])
  | _ -> (String.concat "" ["("; ((v_Vuna_dCompiler_dCodegen_dDecl_djoinWith ", ") mc2); ") "; (Base_dPair.v_Base_dPair_dfirstOf ((v_Vuna_dCompiler_dCodegen_dDecl_dqualTypeText mc0) mc1))])
)
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dPair.v_Base_dPair_dfirstOf ((v_Vuna_dCompiler_dCodegen_dDecl_dqualTypeText mc0) mc1))
  | _ -> failwith "DT: impossible branch"
))

# 228 "Vuna/Compiler/Codegen/Decl.vuna"
let v_Vuna_dCompiler_dCodegen_dDecl_dparenOne = (fun t -> (String.concat "" ["("; t; ")"]))

# 224 "Vuna/Compiler/Codegen/Decl.vuna"
let rec v_Vuna_dCompiler_dCodegen_dDecl_dparenList = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__7, dtb__8) -> ((Base_dList.v_Base_dList_dappend (Base_dList.C_Base_dList_dList_Cons ((v_Vuna_dCompiler_dCodegen_dDecl_dparenOne dtb__7), Base_dList.C_Base_dList_dList_Nil))) (v_Vuna_dCompiler_dCodegen_dDecl_dparenList dtb__8))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 219 "Vuna/Compiler/Codegen/Decl.vuna"
let v_Vuna_dCompiler_dCodegen_dDecl_dctorDeclText = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__9, dtb__10) -> (match dtb__10 with
  | Base_dList.C_Base_dList_dList_Nil -> (String.concat "" [mc0; " of "; (v_Vuna_dCompiler_dCodegen_dDecl_dparenOne dtb__9)])
  | _ -> (String.concat "" [mc0; " of "; ((v_Vuna_dCompiler_dCodegen_dDecl_djoinWith " * ") (v_Vuna_dCompiler_dCodegen_dDecl_dparenList mc1))])
)
  | Base_dList.C_Base_dList_dList_Nil -> mc0
  | _ -> failwith "DT: impossible branch"
))

# 238 "Vuna/Compiler/Codegen/Decl.vuna"
let v_Vuna_dCompiler_dCodegen_dDecl_dirBinderText = (fun mc0 -> (match mc0 with
  | { Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrBinder_irBinderName = dtb__11; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrBinder_irBinderErased = dtb__12 } -> (match dtb__11 with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrBName_IrBWild -> "_"
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrBName_IrBNat (dtb__13) -> ("dtnat__" ^ (bi_strFromInt dtb__13))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrBName_IrBArm (dtb__14) -> ("dtb__" ^ (bi_strFromInt dtb__14))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrBName_IrBUser (dtb__15) -> (v_Vuna_dCompiler_dCodegen_dDecl_docamlBinderName dtb__15)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 244 "Vuna/Compiler/Codegen/Decl.vuna"
let rec v_Vuna_dCompiler_dCodegen_dDecl_dirTyText = (fun mc0 mc1 -> (match mc1 with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyData (dtb__16, dtb__17) -> (((v_Vuna_dCompiler_dCodegen_dDecl_dfamilyTyText mc0) dtb__16) ((Base_dList.v_Base_dList_dmap (v_Vuna_dCompiler_dCodegen_dDecl_dirTyText mc0)) dtb__17))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyFun (dtb__18, dtb__19) -> (String.concat "" ["("; ((v_Vuna_dCompiler_dCodegen_dDecl_dirTyText mc0) dtb__18); ") -> "; ((v_Vuna_dCompiler_dCodegen_dDecl_dirTyText mc0) dtb__19)])
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyRef (dtb__20) -> (String.concat "" ["("; ((v_Vuna_dCompiler_dCodegen_dDecl_dirTyText mc0) dtb__20); " ref)"])
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyArray (dtb__21) -> (String.concat "" ["("; ((v_Vuna_dCompiler_dCodegen_dDecl_dirTyText mc0) dtb__21); " array)"])
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyOpaque -> "Obj.t"
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyFloat -> "float"
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyBool -> "bool"
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyStr -> "string"
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyInt -> "int"
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyVar (dtb__22) -> (v_Vuna_dCompiler_dCodegen_dDecl_dtypeParamName dtb__22)
  | _ -> failwith "DT: impossible branch"
))

# 268 "Vuna/Compiler/Codegen/Decl.vuna"
let v_Vuna_dCompiler_dCodegen_dDecl_dctorDeclOf = (fun mc0 mc1 mc2 -> (match mc2 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__23; Base_dPair.f_Base_dPair_dPair_second = dtb__24 } -> ((v_Vuna_dCompiler_dCodegen_dDecl_dctorDeclText ((v_Vuna_dCompiler_dCodegen_dDecl_dctorOcamlName mc1) dtb__23)) ((Base_dList.v_Base_dList_dmap (v_Vuna_dCompiler_dCodegen_dDecl_dirTyText mc0)) dtb__24))
  | _ -> failwith "DT: impossible branch"
))

# 264 "Vuna/Compiler/Codegen/Decl.vuna"
let v_Vuna_dCompiler_dCodegen_dDecl_dctorBodyOf = (fun mc0 mc1 mc2 -> (match mc2 with
  | Base_dList.C_Base_dList_dList_Nil -> "|"
  | _ -> ((v_Vuna_dCompiler_dCodegen_dDecl_djoinWith " | ") ((Base_dList.v_Base_dList_dmap ((v_Vuna_dCompiler_dCodegen_dDecl_dctorDeclOf mc0) mc1)) mc2))
))

# 272 "Vuna/Compiler/Codegen/Decl.vuna"
let rec v_Vuna_dCompiler_dCodegen_dDecl_drecordFieldDecls = (fun mc0 mc1 mc2 mc3 -> (match mc2 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__25, dtb__26) -> (match mc3 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__27, dtb__28) -> (Base_dList.C_Base_dList_dList_Cons ((String.concat "" [((v_Vuna_dCompiler_dCodegen_dDecl_drecordFieldLabel mc1) (Base_dPair.v_Base_dPair_dsecondOf dtb__25)); " : "; ((v_Vuna_dCompiler_dCodegen_dDecl_dirTyText mc0) dtb__27)]), ((((v_Vuna_dCompiler_dCodegen_dDecl_drecordFieldDecls mc0) mc1) dtb__26) dtb__28)))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> (match mc3 with
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> Base_dList.C_Base_dList_dList_Nil
)
  | _ -> failwith "DT: impossible branch"
))

# 257 "Vuna/Compiler/Codegen/Decl.vuna"
let v_Vuna_dCompiler_dCodegen_dDecl_dirTyDeclText = (fun mc0 mc1 -> (match mc1 with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTyDecl_IrUnboxedDecl (dtb__29, dtb__30, dtb__31) -> (String.concat "" [(v_Vuna_dCompiler_dCodegen_dDecl_dtypeParamDecl dtb__30); (v_Vuna_dCompiler_dCodegen_dDecl_dtypeName dtb__29); " = "; ((v_Vuna_dCompiler_dCodegen_dDecl_dirTyText mc0) dtb__31)])
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTyDecl_IrRecordDecl (dtb__32, dtb__33, dtb__34, dtb__35) -> (String.concat "" [(v_Vuna_dCompiler_dCodegen_dDecl_dtypeParamDecl dtb__33); (v_Vuna_dCompiler_dCodegen_dDecl_dtypeName dtb__32); " = { "; ((v_Vuna_dCompiler_dCodegen_dDecl_djoinWith "; ") ((((v_Vuna_dCompiler_dCodegen_dDecl_drecordFieldDecls mc0) dtb__32) dtb__34) dtb__35)); " }"])
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTyDecl_IrVariantDecl (dtb__36, dtb__37, dtb__38) -> (String.concat "" [(v_Vuna_dCompiler_dCodegen_dDecl_dtypeParamDecl dtb__37); (v_Vuna_dCompiler_dCodegen_dDecl_dtypeName dtb__36); " = "; (((v_Vuna_dCompiler_dCodegen_dDecl_dctorBodyOf mc0) dtb__36) dtb__38)])
  | _ -> failwith "DT: impossible branch"
))

# 279 "Vuna/Compiler/Codegen/Decl.vuna"
let v_Vuna_dCompiler_dCodegen_dDecl_dirTypeDeclsText = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Nil -> ""
  | _ -> (String.concat "" ["type "; ((v_Vuna_dCompiler_dCodegen_dDecl_djoinWith "\nand ") ((Base_dList.v_Base_dList_dmap (v_Vuna_dCompiler_dCodegen_dDecl_dirTyDeclText mc0)) mc1)); "\n\n"])
))

# 287 "Vuna/Compiler/Codegen/Decl.vuna"
let rec v_Vuna_dCompiler_dCodegen_dDecl_dirTyGlobalNames = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyData (dtb__39, dtb__40) -> (Base_dList.C_Base_dList_dList_Cons (dtb__39, ((Base_dList.v_Base_dList_dconcatMap v_Vuna_dCompiler_dCodegen_dDecl_dirTyGlobalNames) dtb__40)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyFun (dtb__41, dtb__42) -> ((Base_dList.v_Base_dList_dappend (v_Vuna_dCompiler_dCodegen_dDecl_dirTyGlobalNames dtb__41)) (v_Vuna_dCompiler_dCodegen_dDecl_dirTyGlobalNames dtb__42))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyRef (dtb__43) -> (v_Vuna_dCompiler_dCodegen_dDecl_dirTyGlobalNames dtb__43)
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyArray (dtb__44) -> (v_Vuna_dCompiler_dCodegen_dDecl_dirTyGlobalNames dtb__44)
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyOpaque -> Base_dList.C_Base_dList_dList_Nil
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyFloat -> Base_dList.C_Base_dList_dList_Nil
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyBool -> Base_dList.C_Base_dList_dList_Nil
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyStr -> Base_dList.C_Base_dList_dList_Nil
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyInt -> Base_dList.C_Base_dList_dList_Nil
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyVar (dtb__45) -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 299 "Vuna/Compiler/Codegen/Decl.vuna"
let rec v_Vuna_dCompiler_dCodegen_dDecl_dirTyDepsGo = (fun mc0 mc1 mc2 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__46, dtb__47) -> ((fun owner -> (if (if (owner = "") then true else (owner = (mc0).f_Vuna_dCompiler_dCodegen_dDecl_dQualCtx_qcUnit)) then (((v_Vuna_dCompiler_dCodegen_dDecl_dirTyDepsGo mc0) dtb__47) mc2) else (if ((Base_dList.v_Base_dList_dmemName owner) mc2) then (((v_Vuna_dCompiler_dCodegen_dDecl_dirTyDepsGo mc0) dtb__47) mc2) else (((v_Vuna_dCompiler_dCodegen_dDecl_dirTyDepsGo mc0) dtb__47) (Base_dList.C_Base_dList_dList_Cons (owner, mc2)))))) ((v_Vuna_dCompiler_dCodegen_dDecl_dunitOfTbl (mc0).f_Vuna_dCompiler_dCodegen_dDecl_dQualCtx_qcDatas) dtb__46))
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dList.v_Base_dList_dreverse mc2)
  | _ -> failwith "DT: impossible branch"
))

# 284 "Vuna/Compiler/Codegen/Decl.vuna"
let v_Vuna_dCompiler_dCodegen_dDecl_dirTyDeclDeps = (fun qc tys -> (((v_Vuna_dCompiler_dCodegen_dDecl_dirTyDepsGo qc) ((Base_dList.v_Base_dList_dconcatMap v_Vuna_dCompiler_dCodegen_dDecl_dirTyGlobalNames) tys)) Base_dList.C_Base_dList_dList_Nil))
