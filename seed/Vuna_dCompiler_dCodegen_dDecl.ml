open Vuna_runtime
type t_Vuna_dCompiler_dCodegen_dDecl_dQualCtx = { f_Vuna_dCompiler_dCodegen_dDecl_dQualCtx_qcUnit : string; f_Vuna_dCompiler_dCodegen_dDecl_dQualCtx_qcDefs : (string, string) Base_dContainer_dHashMap.t_Base_dContainer_dHashMap_dHashMap; f_Vuna_dCompiler_dCodegen_dDecl_dQualCtx_qcDatas : (string, string) Base_dContainer_dHashMap.t_Base_dContainer_dHashMap_dHashMap }

# 28 "Vuna/Compiler/Codegen/Decl.vuna"
let v_Vuna_dCompiler_dCodegen_dDecl_disAsciiAlphaNum = (fun c -> (if (if (if (c >= 65) then (c <= 90) else false) then true else (if (c >= 97) then (c <= 122) else false)) then true else (if (c >= 48) then (c <= 57) else false)))

# 32 "Vuna/Compiler/Codegen/Decl.vuna"
let v_Vuna_dCompiler_dCodegen_dDecl_dsanitizeChar = (fun mc0 -> (if (mc0 = 46) then (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (95, (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (100, Base_dData_dList.C_Base_dData_dList_dList_Nil)))) else (if (mc0 = 95) then (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (95, (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (117, Base_dData_dList.C_Base_dData_dList_dList_Nil)))) else (if (mc0 = 39) then (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (95, (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (112, Base_dData_dList.C_Base_dData_dList_dList_Nil)))) else (if (mc0 = 35) then (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (95, (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (104, Base_dData_dList.C_Base_dData_dList_dList_Nil)))) else (if (v_Vuna_dCompiler_dCodegen_dDecl_disAsciiAlphaNum mc0) then (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (mc0, Base_dData_dList.C_Base_dData_dList_dList_Nil)) else (Base_dData_dList.dtp_unpack (String.concat "" ["_x"; (bi_strFromInt mc0); "_"]))))))))

# 39 "Vuna/Compiler/Codegen/Decl.vuna"
let v_Vuna_dCompiler_dCodegen_dDecl_dsanitizeName = (fun name -> (Base_dData_dList.dtp_pack ((Base_dData_dList.v_Base_dData_dList_dconcatMap v_Vuna_dCompiler_dCodegen_dDecl_dsanitizeChar) (Base_dData_dList.dtp_unpack name))))

# 42 "Vuna/Compiler/Codegen/Decl.vuna"
let v_Vuna_dCompiler_dCodegen_dDecl_docamlPad3 = (fun s -> (if ((bi_strLength s) = 1) then ("00" ^ s) else (if ((bi_strLength s) = 2) then ("0" ^ s) else s)))

# 45 "Vuna/Compiler/Codegen/Decl.vuna"
let v_Vuna_dCompiler_dCodegen_dDecl_docamlEscapeChar = (fun mc0 -> (if (mc0 = 34) then (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (92, (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (34, Base_dData_dList.C_Base_dData_dList_dList_Nil)))) else (if (mc0 = 92) then (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (92, (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (92, Base_dData_dList.C_Base_dData_dList_dList_Nil)))) else (if (mc0 = 10) then (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (92, (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (110, Base_dData_dList.C_Base_dData_dList_dList_Nil)))) else (if (mc0 = 9) then (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (92, (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (116, Base_dData_dList.C_Base_dData_dList_dList_Nil)))) else (if (mc0 = 13) then (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (92, (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (114, Base_dData_dList.C_Base_dData_dList_dList_Nil)))) else (if (if (mc0 >= 32) then (mc0 <= 126) else false) then (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (mc0, Base_dData_dList.C_Base_dData_dList_dList_Nil)) else (Base_dData_dList.dtp_unpack ("\\" ^ (v_Vuna_dCompiler_dCodegen_dDecl_docamlPad3 (bi_strFromInt mc0)))))))))))

# 53 "Vuna/Compiler/Codegen/Decl.vuna"
let v_Vuna_dCompiler_dCodegen_dDecl_docamlString = (fun s -> (String.concat "" ["\""; (Base_dData_dList.dtp_pack ((Base_dData_dList.v_Base_dData_dList_dconcatMap v_Vuna_dCompiler_dCodegen_dDecl_docamlEscapeChar) (Base_dData_dList.dtp_unpack s))); "\""]))

# 56 "Vuna/Compiler/Codegen/Decl.vuna"
let v_Vuna_dCompiler_dCodegen_dDecl_dvalueName = (fun name -> ("v_" ^ (v_Vuna_dCompiler_dCodegen_dDecl_dsanitizeName name)))

# 61 "Vuna/Compiler/Codegen/Decl.vuna"
let v_Vuna_dCompiler_dCodegen_dDecl_dboolText = (fun mc0 -> (if mc0 then "true" else "false"))

# 66 "Vuna/Compiler/Codegen/Decl.vuna"
let v_Vuna_dCompiler_dCodegen_dDecl_dtypeName = (fun name -> ("t_" ^ (v_Vuna_dCompiler_dCodegen_dDecl_dsanitizeName name)))

# 70 "Vuna/Compiler/Codegen/Decl.vuna"
let v_Vuna_dCompiler_dCodegen_dDecl_dctorOcamlName = (fun family ctor -> (String.concat "" ["C_"; (v_Vuna_dCompiler_dCodegen_dDecl_dsanitizeName family); "_"; (v_Vuna_dCompiler_dCodegen_dDecl_dsanitizeName (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dctorShortName ctor))]))

# 74 "Vuna/Compiler/Codegen/Decl.vuna"
let v_Vuna_dCompiler_dCodegen_dDecl_drecordFieldLabel = (fun family field -> (String.concat "" ["f_"; (v_Vuna_dCompiler_dCodegen_dDecl_dsanitizeName family); "_"; (v_Vuna_dCompiler_dCodegen_dDecl_dsanitizeName field)]))

# 95 "Vuna/Compiler/Codegen/Decl.vuna"
let v_Vuna_dCompiler_dCodegen_dDecl_dnoQual = { f_Vuna_dCompiler_dCodegen_dDecl_dQualCtx_qcUnit = ""; f_Vuna_dCompiler_dCodegen_dDecl_dQualCtx_qcDefs = ((Base_dContainer_dHashMap.v_Base_dContainer_dHashMap_dfromList Base_dData_dString.v_Hashable_uString) Base_dData_dList.C_Base_dData_dList_dList_Nil); f_Vuna_dCompiler_dCodegen_dDecl_dQualCtx_qcDatas = ((Base_dContainer_dHashMap.v_Base_dContainer_dHashMap_dfromList Base_dData_dString.v_Hashable_uString) Base_dData_dList.C_Base_dData_dList_dList_Nil) }

# 98 "Vuna/Compiler/Codegen/Decl.vuna"
let v_Vuna_dCompiler_dCodegen_dDecl_dunitTblOf = (fun pairs -> (((Base_dContainer_dHashMap.v_Base_dContainer_dHashMap_dinsertAll Base_dData_dString.v_Hashable_uString) pairs) ((Base_dContainer_dHashMap.v_Base_dContainer_dHashMap_dfromList Base_dData_dString.v_Hashable_uString) Base_dData_dList.C_Base_dData_dList_dList_Nil)))

# 101 "Vuna/Compiler/Codegen/Decl.vuna"
let v_Vuna_dCompiler_dCodegen_dDecl_dunitOfTbl = (fun tbl name -> (match ((((Base_dContainer_dHashMap.v_Base_dContainer_dHashMap_dlookup Base_dData_dString.v_Hashable_uString) Base_dData_dString.v_Eq_uString) name) tbl) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__0) -> dtb__0
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> ""
  | _ -> failwith "DT: impossible branch"
))

# 106 "Vuna/Compiler/Codegen/Decl.vuna"
let v_Vuna_dCompiler_dCodegen_dDecl_dqualOf = (fun unit defs datas -> { f_Vuna_dCompiler_dCodegen_dDecl_dQualCtx_qcUnit = unit; f_Vuna_dCompiler_dCodegen_dDecl_dQualCtx_qcDefs = (v_Vuna_dCompiler_dCodegen_dDecl_dunitTblOf defs); f_Vuna_dCompiler_dCodegen_dDecl_dQualCtx_qcDatas = (v_Vuna_dCompiler_dCodegen_dDecl_dunitTblOf datas) })

# 110 "Vuna/Compiler/Codegen/Decl.vuna"
let v_Vuna_dCompiler_dCodegen_dDecl_dqualPrefix = (fun qc owner text -> (if (if (owner = "") then true else (owner = (qc).f_Vuna_dCompiler_dCodegen_dDecl_dQualCtx_qcUnit)) then { Base_dData_dPair.f_Base_dData_dPair_dPair_first = text; Base_dData_dPair.f_Base_dData_dPair_dPair_second = "" } else { Base_dData_dPair.f_Base_dData_dPair_dPair_first = (String.concat "" [owner; "."; text]); Base_dData_dPair.f_Base_dData_dPair_dPair_second = owner }))

# 115 "Vuna/Compiler/Codegen/Decl.vuna"
let v_Vuna_dCompiler_dCodegen_dDecl_dqualValueText = (fun qc name -> (((v_Vuna_dCompiler_dCodegen_dDecl_dqualPrefix qc) ((v_Vuna_dCompiler_dCodegen_dDecl_dunitOfTbl (qc).f_Vuna_dCompiler_dCodegen_dDecl_dQualCtx_qcDefs) name)) (v_Vuna_dCompiler_dCodegen_dDecl_dvalueName name)))

# 118 "Vuna/Compiler/Codegen/Decl.vuna"
let v_Vuna_dCompiler_dCodegen_dDecl_dqualCtorText = (fun qc family ctor -> (((v_Vuna_dCompiler_dCodegen_dDecl_dqualPrefix qc) ((v_Vuna_dCompiler_dCodegen_dDecl_dunitOfTbl (qc).f_Vuna_dCompiler_dCodegen_dDecl_dQualCtx_qcDatas) family)) ((v_Vuna_dCompiler_dCodegen_dDecl_dctorOcamlName family) ctor)))

# 122 "Vuna/Compiler/Codegen/Decl.vuna"
let v_Vuna_dCompiler_dCodegen_dDecl_dqualTypeText = (fun qc name -> (((v_Vuna_dCompiler_dCodegen_dDecl_dqualPrefix qc) ((v_Vuna_dCompiler_dCodegen_dDecl_dunitOfTbl (qc).f_Vuna_dCompiler_dCodegen_dDecl_dQualCtx_qcDatas) name)) (v_Vuna_dCompiler_dCodegen_dDecl_dtypeName name)))

# 128 "Vuna/Compiler/Codegen/Decl.vuna"
let v_Vuna_dCompiler_dCodegen_dDecl_docamlReservedWords = (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ("and", (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ("as", (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ("assert", (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ("asr", (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ("begin", (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ("class", (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ("constraint", (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ("do", (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ("done", (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ("downto", (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ("else", (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ("end", (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ("exception", (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ("external", (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ("false", (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ("for", (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ("fun", (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ("function", (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ("functor", (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ("if", (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ("in", (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ("include", (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ("inherit", (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ("initializer", (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ("land", (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ("lazy", (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ("let", (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ("lor", (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ("lsl", (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ("lsr", (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ("lxor", (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ("match", (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ("method", (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ("mod", (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ("module", (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ("mutable", (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ("new", (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ("nonrec", (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ("object", (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ("of", (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ("open", (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ("or", (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ("private", (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ("rec", (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ("sig", (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ("struct", (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ("then", (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ("to", (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ("true", (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ("try", (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ("type", (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ("val", (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ("virtual", (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ("when", (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ("while", (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ("with", Base_dData_dList.C_Base_dData_dList_dList_Nil))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))

# 188 "Vuna/Compiler/Codegen/Decl.vuna"
let v_Vuna_dCompiler_dCodegen_dDecl_docamlBinderName = (fun name -> ((fun oc -> (if ((Base_dData_dList.v_Base_dData_dList_dmemName oc) v_Vuna_dCompiler_dCodegen_dDecl_docamlReservedWords) then (oc ^ "_") else oc)) (v_Vuna_dCompiler_dCodegen_dDecl_dsanitizeName name)))

# 199 "Vuna/Compiler/Codegen/Decl.vuna"
let rec v_Vuna_dCompiler_dCodegen_dDecl_dinterpose = (fun mc0 mc1 -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__1, dtb__2) -> (match dtb__2 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__1, Base_dData_dList.C_Base_dData_dList_dList_Nil))
  | _ -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__1, (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (mc0, ((v_Vuna_dCompiler_dCodegen_dDecl_dinterpose mc0) dtb__2)))))
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 196 "Vuna/Compiler/Codegen/Decl.vuna"
let v_Vuna_dCompiler_dCodegen_dDecl_djoinWith = (fun sep xs -> (Base_dData_dList.dtp_concatMany ((v_Vuna_dCompiler_dCodegen_dDecl_dinterpose sep) xs)))

# 204 "Vuna/Compiler/Codegen/Decl.vuna"
let v_Vuna_dCompiler_dCodegen_dDecl_dtypeParamName = (fun i -> ("'a" ^ (bi_strFromInt i)))

# 207 "Vuna/Compiler/Codegen/Decl.vuna"
let v_Vuna_dCompiler_dCodegen_dDecl_dtypeParamNames = (fun n -> ((Base_dData_dList.v_Base_dData_dList_dmap v_Vuna_dCompiler_dCodegen_dDecl_dtypeParamName) ((Base_dData_dList.v_Base_dData_dList_drange 0) n)))

# 210 "Vuna/Compiler/Codegen/Decl.vuna"
let v_Vuna_dCompiler_dCodegen_dDecl_dtypeParamDecl = (fun mc0 -> (if (mc0 = 0) then "" else ((fun nd_uscrut1 -> (match nd_uscrut1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__3, dtb__4) -> (match dtb__4 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (dtb__3 ^ " ")
  | _ -> (String.concat "" ["("; ((v_Vuna_dCompiler_dCodegen_dDecl_djoinWith ", ") nd_uscrut1); ") "])
)
  | _ -> (String.concat "" ["("; ((v_Vuna_dCompiler_dCodegen_dDecl_djoinWith ", ") nd_uscrut1); ") "])
)) (v_Vuna_dCompiler_dCodegen_dDecl_dtypeParamNames mc0))))

# 216 "Vuna/Compiler/Codegen/Decl.vuna"
let v_Vuna_dCompiler_dCodegen_dDecl_dfamilyTyText = (fun mc0 mc1 mc2 -> (match mc2 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__5, dtb__6) -> (match dtb__6 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (String.concat "" [dtb__5; " "; (Base_dData_dPair.v_Base_dData_dPair_dfirstOf ((v_Vuna_dCompiler_dCodegen_dDecl_dqualTypeText mc0) mc1))])
  | _ -> (String.concat "" ["("; ((v_Vuna_dCompiler_dCodegen_dDecl_djoinWith ", ") mc2); ") "; (Base_dData_dPair.v_Base_dData_dPair_dfirstOf ((v_Vuna_dCompiler_dCodegen_dDecl_dqualTypeText mc0) mc1))])
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Base_dData_dPair.v_Base_dData_dPair_dfirstOf ((v_Vuna_dCompiler_dCodegen_dDecl_dqualTypeText mc0) mc1))
  | _ -> failwith "DT: impossible branch"
))

# 230 "Vuna/Compiler/Codegen/Decl.vuna"
let v_Vuna_dCompiler_dCodegen_dDecl_dparenOne = (fun t -> (String.concat "" ["("; t; ")"]))

# 226 "Vuna/Compiler/Codegen/Decl.vuna"
let rec v_Vuna_dCompiler_dCodegen_dDecl_dparenList = (fun mc0 -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__7, dtb__8) -> ((Base_dData_dList.v_Base_dData_dList_dappend (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ((v_Vuna_dCompiler_dCodegen_dDecl_dparenOne dtb__7), Base_dData_dList.C_Base_dData_dList_dList_Nil))) (v_Vuna_dCompiler_dCodegen_dDecl_dparenList dtb__8))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 221 "Vuna/Compiler/Codegen/Decl.vuna"
let v_Vuna_dCompiler_dCodegen_dDecl_dctorDeclText = (fun mc0 mc1 -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__9, dtb__10) -> (match dtb__10 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (String.concat "" [mc0; " of "; (v_Vuna_dCompiler_dCodegen_dDecl_dparenOne dtb__9)])
  | _ -> (String.concat "" [mc0; " of "; ((v_Vuna_dCompiler_dCodegen_dDecl_djoinWith " * ") (v_Vuna_dCompiler_dCodegen_dDecl_dparenList mc1))])
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> mc0
  | _ -> failwith "DT: impossible branch"
))

# 240 "Vuna/Compiler/Codegen/Decl.vuna"
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

# 246 "Vuna/Compiler/Codegen/Decl.vuna"
let rec v_Vuna_dCompiler_dCodegen_dDecl_dirTyText = (fun mc0 mc1 -> (match mc1 with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyData (dtb__16, dtb__17) -> (((v_Vuna_dCompiler_dCodegen_dDecl_dfamilyTyText mc0) dtb__16) ((Base_dData_dList.v_Base_dData_dList_dmap (v_Vuna_dCompiler_dCodegen_dDecl_dirTyText mc0)) dtb__17))
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

# 270 "Vuna/Compiler/Codegen/Decl.vuna"
let v_Vuna_dCompiler_dCodegen_dDecl_dctorDeclOf = (fun mc0 mc1 mc2 -> (match mc2 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__23; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__24 } -> ((v_Vuna_dCompiler_dCodegen_dDecl_dctorDeclText ((v_Vuna_dCompiler_dCodegen_dDecl_dctorOcamlName mc1) dtb__23)) ((Base_dData_dList.v_Base_dData_dList_dmap (v_Vuna_dCompiler_dCodegen_dDecl_dirTyText mc0)) dtb__24))
  | _ -> failwith "DT: impossible branch"
))

# 266 "Vuna/Compiler/Codegen/Decl.vuna"
let v_Vuna_dCompiler_dCodegen_dDecl_dctorBodyOf = (fun mc0 mc1 mc2 -> (match mc2 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> "|"
  | _ -> ((v_Vuna_dCompiler_dCodegen_dDecl_djoinWith " | ") ((Base_dData_dList.v_Base_dData_dList_dmap ((v_Vuna_dCompiler_dCodegen_dDecl_dctorDeclOf mc0) mc1)) mc2))
))

# 274 "Vuna/Compiler/Codegen/Decl.vuna"
let rec v_Vuna_dCompiler_dCodegen_dDecl_drecordFieldDecls = (fun mc0 mc1 mc2 mc3 -> (match mc2 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__25, dtb__26) -> (match mc3 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__27, dtb__28) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ((String.concat "" [((v_Vuna_dCompiler_dCodegen_dDecl_drecordFieldLabel mc1) (Base_dData_dPair.v_Base_dData_dPair_dsecondOf dtb__25)); " : "; ((v_Vuna_dCompiler_dCodegen_dDecl_dirTyText mc0) dtb__27)]), ((((v_Vuna_dCompiler_dCodegen_dDecl_drecordFieldDecls mc0) mc1) dtb__26) dtb__28)))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 259 "Vuna/Compiler/Codegen/Decl.vuna"
let v_Vuna_dCompiler_dCodegen_dDecl_dirTyDeclText = (fun mc0 mc1 -> (match mc1 with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTyDecl_IrUnboxedDecl (dtb__29, dtb__30, dtb__31) -> (String.concat "" [(v_Vuna_dCompiler_dCodegen_dDecl_dtypeParamDecl dtb__30); (v_Vuna_dCompiler_dCodegen_dDecl_dtypeName dtb__29); " = "; ((v_Vuna_dCompiler_dCodegen_dDecl_dirTyText mc0) dtb__31)])
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTyDecl_IrRecordDecl (dtb__32, dtb__33, dtb__34, dtb__35) -> (String.concat "" [(v_Vuna_dCompiler_dCodegen_dDecl_dtypeParamDecl dtb__33); (v_Vuna_dCompiler_dCodegen_dDecl_dtypeName dtb__32); " = { "; ((v_Vuna_dCompiler_dCodegen_dDecl_djoinWith "; ") ((((v_Vuna_dCompiler_dCodegen_dDecl_drecordFieldDecls mc0) dtb__32) dtb__34) dtb__35)); " }"])
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTyDecl_IrVariantDecl (dtb__36, dtb__37, dtb__38) -> (String.concat "" [(v_Vuna_dCompiler_dCodegen_dDecl_dtypeParamDecl dtb__37); (v_Vuna_dCompiler_dCodegen_dDecl_dtypeName dtb__36); " = "; (((v_Vuna_dCompiler_dCodegen_dDecl_dctorBodyOf mc0) dtb__36) dtb__38)])
  | _ -> failwith "DT: impossible branch"
))

# 281 "Vuna/Compiler/Codegen/Decl.vuna"
let v_Vuna_dCompiler_dCodegen_dDecl_dirTypeDeclsText = (fun mc0 mc1 -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> ""
  | _ -> (String.concat "" ["type "; ((v_Vuna_dCompiler_dCodegen_dDecl_djoinWith "\nand ") ((Base_dData_dList.v_Base_dData_dList_dmap (v_Vuna_dCompiler_dCodegen_dDecl_dirTyDeclText mc0)) mc1)); "\n\n"])
))

# 289 "Vuna/Compiler/Codegen/Decl.vuna"
let rec v_Vuna_dCompiler_dCodegen_dDecl_dirTyGlobalNames = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyData (dtb__39, dtb__40) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__39, ((Base_dData_dList.v_Base_dData_dList_dconcatMap v_Vuna_dCompiler_dCodegen_dDecl_dirTyGlobalNames) dtb__40)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyFun (dtb__41, dtb__42) -> ((Base_dData_dList.v_Base_dData_dList_dappend (v_Vuna_dCompiler_dCodegen_dDecl_dirTyGlobalNames dtb__41)) (v_Vuna_dCompiler_dCodegen_dDecl_dirTyGlobalNames dtb__42))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyRef (dtb__43) -> (v_Vuna_dCompiler_dCodegen_dDecl_dirTyGlobalNames dtb__43)
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyArray (dtb__44) -> (v_Vuna_dCompiler_dCodegen_dDecl_dirTyGlobalNames dtb__44)
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyOpaque -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyFloat -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyBool -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyStr -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyInt -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyVar (dtb__45) -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 301 "Vuna/Compiler/Codegen/Decl.vuna"
let rec v_Vuna_dCompiler_dCodegen_dDecl_dirTyDepsGo = (fun mc0 mc1 mc2 -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__46, dtb__47) -> ((fun owner -> (if (if (owner = "") then true else (owner = (mc0).f_Vuna_dCompiler_dCodegen_dDecl_dQualCtx_qcUnit)) then (((v_Vuna_dCompiler_dCodegen_dDecl_dirTyDepsGo mc0) dtb__47) mc2) else (if ((Base_dData_dList.v_Base_dData_dList_dmemName owner) mc2) then (((v_Vuna_dCompiler_dCodegen_dDecl_dirTyDepsGo mc0) dtb__47) mc2) else (((v_Vuna_dCompiler_dCodegen_dDecl_dirTyDepsGo mc0) dtb__47) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (owner, mc2)))))) ((v_Vuna_dCompiler_dCodegen_dDecl_dunitOfTbl (mc0).f_Vuna_dCompiler_dCodegen_dDecl_dQualCtx_qcDatas) dtb__46))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Base_dData_dList.v_Base_dData_dList_dreverse mc2)
  | _ -> failwith "DT: impossible branch"
))

# 286 "Vuna/Compiler/Codegen/Decl.vuna"
let v_Vuna_dCompiler_dCodegen_dDecl_dirTyDeclDeps = (fun qc tys -> (((v_Vuna_dCompiler_dCodegen_dDecl_dirTyDepsGo qc) ((Base_dData_dList.v_Base_dData_dList_dconcatMap v_Vuna_dCompiler_dCodegen_dDecl_dirTyGlobalNames) tys)) Base_dData_dList.C_Base_dData_dList_dList_Nil))
