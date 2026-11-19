open Vuna_runtime
# 16 "Vuna/Compiler/Codegen/Ocaml/Render.vuna"
let rec v_interpose = (fun (mc0 : string) (mc1 : string B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__0, dtb__1) -> (match dtb__1 with
  | B_dData_dList.C_List_Nil -> (B_dData_dList.C_List__x58__x58_ (dtb__0, B_dData_dList.C_List_Nil))
  | _ -> (B_dData_dList.C_List__x58__x58_ (dtb__0, (B_dData_dList.C_List__x58__x58_ (mc0, ((v_interpose mc0) dtb__1)))))
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 13 "Vuna/Compiler/Codegen/Ocaml/Render.vuna"
let v_joinWith = (fun (sep : string) (xs : string B_dData_dList.t_List) -> (B_dData_dList.dtp_concatMany ((v_interpose sep) xs)))

# 21 "Vuna/Compiler/Codegen/Ocaml/Render.vuna"
let v_typeParamName = (fun (i : int) -> ("'a" ^ (bi_strFromInt i)))

# 24 "Vuna/Compiler/Codegen/Ocaml/Render.vuna"
let v_typeParamDecl = (fun (mc0 : int) -> (if (mc0 = 0) then "" else ((fun nd_uscrut1 -> (match nd_uscrut1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__2, dtb__3) -> (match dtb__3 with
  | B_dData_dList.C_List_Nil -> (dtb__2 ^ " ")
  | _ -> (String.concat "" ["("; ((v_joinWith ", ") nd_uscrut1); ") "])
)
  | _ -> (String.concat "" ["("; ((v_joinWith ", ") nd_uscrut1); ") "])
)) ((B_dData_dList.v_map v_typeParamName) ((B_dData_dList.v_range 0) mc0)))))

# 31 "Vuna/Compiler/Codegen/Ocaml/Render.vuna"
let v_familyTy = (fun (mc0 : string) (mc1 : string B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__4, dtb__5) -> (match dtb__5 with
  | B_dData_dList.C_List_Nil -> (String.concat "" [dtb__4; " "; mc0])
  | _ -> (String.concat "" ["("; ((v_joinWith ", ") mc1); ") "; mc0])
)
  | B_dData_dList.C_List_Nil -> mc0
  | _ -> failwith "DT: impossible branch"
))

# 37 "Vuna/Compiler/Codegen/Ocaml/Render.vuna"
let rec v_renderTy = (fun (mc0 : (string) -> string) (mc1 : Codegen_dOcaml_dModel.t_OTy) -> (match mc1 with
  | Codegen_dOcaml_dModel.C_OTy_OTData (dtb__6, dtb__7) -> ((v_familyTy (mc0 dtb__6)) ((B_dData_dList.v_map (v_renderTy mc0)) dtb__7))
  | Codegen_dOcaml_dModel.C_OTy_OTFun (dtb__8, dtb__9) -> (String.concat "" ["("; ((v_renderTy mc0) dtb__8); ") -> "; ((v_renderTy mc0) dtb__9)])
  | Codegen_dOcaml_dModel.C_OTy_OTRef (dtb__10) -> (String.concat "" ["("; ((v_renderTy mc0) dtb__10); " ref)"])
  | Codegen_dOcaml_dModel.C_OTy_OTArray (dtb__11) -> (String.concat "" ["("; ((v_renderTy mc0) dtb__11); " array)"])
  | Codegen_dOcaml_dModel.C_OTy_OTOpaque -> "Obj.t"
  | Codegen_dOcaml_dModel.C_OTy_OTFloat -> "float"
  | Codegen_dOcaml_dModel.C_OTy_OTBool -> "bool"
  | Codegen_dOcaml_dModel.C_OTy_OTStr -> "string"
  | Codegen_dOcaml_dModel.C_OTy_OTInt -> "int"
  | Codegen_dOcaml_dModel.C_OTy_OTVar (dtb__12) -> (v_typeParamName dtb__12)
  | _ -> failwith "DT: impossible branch"
))

# 49 "Vuna/Compiler/Codegen/Ocaml/Render.vuna"
let v_ctorDecl = (fun (qual : (string) -> string) (c : Codegen_dOcaml_dModel.t_OCtor) -> ((fun nd_uscrut2 -> (match nd_uscrut2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__13, dtb__14) -> (match dtb__14 with
  | B_dData_dList.C_List_Nil -> (String.concat "" [(c).Codegen_dOcaml_dModel.f_OCtor_ocName; " of ("; ((v_renderTy qual) dtb__13); ")"])
  | _ -> (String.concat "" [(c).Codegen_dOcaml_dModel.f_OCtor_ocName; " of "; ((v_joinWith " * ") ((B_dData_dList.v_map (fun (t : Codegen_dOcaml_dModel.t_OTy) -> (String.concat "" ["("; ((v_renderTy qual) t); ")"]))) nd_uscrut2))])
)
  | B_dData_dList.C_List_Nil -> (c).Codegen_dOcaml_dModel.f_OCtor_ocName
  | _ -> failwith "DT: impossible branch"
)) (c).Codegen_dOcaml_dModel.f_OCtor_ocFields))

# 65 "Vuna/Compiler/Codegen/Ocaml/Render.vuna"
let v_fieldDecl = (fun (mc0 : (string) -> string) (mc1 : (string, Codegen_dOcaml_dModel.t_OTy) B_dData_dPair.t_Pair) -> (match mc1 with
  | { B_dData_dPair.f_Pair_first = dtb__15; B_dData_dPair.f_Pair_second = dtb__16 } -> (String.concat "" [dtb__15; " : "; ((v_renderTy mc0) dtb__16)])
  | _ -> failwith "DT: impossible branch"
))

# 57 "Vuna/Compiler/Codegen/Ocaml/Render.vuna"
let v_renderDecl = (fun (mc0 : (string) -> string) (mc1 : Codegen_dOcaml_dModel.t_ODecl) -> (match mc1 with
  | Codegen_dOcaml_dModel.C_ODecl_ODAlias (dtb__17, dtb__18, dtb__19) -> (String.concat "" [(v_typeParamDecl dtb__17); dtb__18; " = "; ((v_renderTy mc0) dtb__19)])
  | Codegen_dOcaml_dModel.C_ODecl_ODRecord (dtb__20, dtb__21, dtb__22) -> (String.concat "" [(v_typeParamDecl dtb__20); dtb__21; " = { "; ((v_joinWith "; ") ((B_dData_dList.v_map (v_fieldDecl mc0)) dtb__22)); " }"])
  | Codegen_dOcaml_dModel.C_ODecl_ODVariant (dtb__23, dtb__24, dtb__25) -> (match dtb__25 with
  | B_dData_dList.C_List_Nil -> (String.concat "" [(v_typeParamDecl dtb__23); dtb__24; " = |"])
  | _ -> (String.concat "" [(v_typeParamDecl dtb__23); dtb__24; " = "; ((v_joinWith " | ") ((B_dData_dList.v_map (v_ctorDecl mc0)) dtb__25))])
)
  | _ -> failwith "DT: impossible branch"
))

# 69 "Vuna/Compiler/Codegen/Ocaml/Render.vuna"
let v_renderDecls = (fun (mc0 : (string) -> string) (mc1 : Codegen_dOcaml_dModel.t_ODecl B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List_Nil -> ""
  | _ -> (String.concat "" ["type "; ((v_joinWith "\nand ") ((B_dData_dList.v_map (v_renderDecl mc0)) mc1)); "\n\n"])
))

# 78 "Vuna/Compiler/Codegen/Ocaml/Render.vuna"
let rec v_renderPat = (fun (mc0 : Codegen_dOcaml_dModel.t_OPat) -> (match mc0 with
  | Codegen_dOcaml_dModel.C_OPat_OPRecordPat (dtb__26) -> (String.concat "" ["{ "; ((v_joinWith "; ") ((B_dData_dList.v_map v_fieldAssign) dtb__26)); " }"])
  | Codegen_dOcaml_dModel.C_OPat_OPCtorPat (dtb__27, dtb__28) -> (match dtb__28 with
  | B_dData_dList.C_List_Nil -> dtb__27
  | _ -> (String.concat "" [dtb__27; " ("; ((v_joinWith ", ") ((B_dData_dList.v_map v_renderPat) dtb__28)); ")"])
)
  | Codegen_dOcaml_dModel.C_OPat_OPWild -> "_"
  | Codegen_dOcaml_dModel.C_OPat_OPVar (dtb__29) -> dtb__29
  | _ -> failwith "DT: impossible branch"
))
# 85 "Vuna/Compiler/Codegen/Ocaml/Render.vuna"
and v_fieldAssign = (fun (mc0 : (string, Codegen_dOcaml_dModel.t_OPat) B_dData_dPair.t_Pair) -> (match mc0 with
  | { B_dData_dPair.f_Pair_first = dtb__30; B_dData_dPair.f_Pair_second = dtb__31 } -> (String.concat "" [dtb__30; " = "; (v_renderPat dtb__31)])
  | _ -> failwith "DT: impossible branch"
))

# 88 "Vuna/Compiler/Codegen/Ocaml/Render.vuna"
let v_binderText = (fun (mc0 : (string, string B_dData_dMaybe.t_Maybe) B_dData_dPair.t_Pair) -> (match mc0 with
  | { B_dData_dPair.f_Pair_first = dtb__32; B_dData_dPair.f_Pair_second = dtb__33 } -> (match dtb__33 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__34) -> (String.concat "" ["("; dtb__32; " : "; dtb__34; ")"])
  | B_dData_dMaybe.C_Maybe_Nothing -> dtb__32
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 92 "Vuna/Compiler/Codegen/Ocaml/Render.vuna"
let rec v_renderTerm = (fun (mc0 : Codegen_dOcaml_dModel.t_OTerm) -> (match mc0 with
  | Codegen_dOcaml_dModel.C_OTerm_OAnnot (dtb__35, dtb__36) -> (String.concat "" ["("; (v_renderTerm dtb__35); " : "; dtb__36; ")"])
  | Codegen_dOcaml_dModel.C_OTerm_OCast (dtb__37) -> (String.concat "" ["(Obj.magic "; (v_renderTerm dtb__37); ")"])
  | Codegen_dOcaml_dModel.C_OTerm_OConcatStr (dtb__38) -> (String.concat "" ["(String.concat \"\" ["; ((v_joinWith "; ") ((B_dData_dList.v_map v_renderTerm) dtb__38)); "])"])
  | Codegen_dOcaml_dModel.C_OTerm_OProj (dtb__39, dtb__40) -> (String.concat "" ["("; (v_renderTerm dtb__39); ")."; dtb__40])
  | Codegen_dOcaml_dModel.C_OTerm_ORecordUpd (dtb__41, dtb__42) -> (String.concat "" ["{ "; (v_renderTerm dtb__41); " with "; ((v_joinWith "; ") (v_recordFields dtb__42)); " }"])
  | Codegen_dOcaml_dModel.C_OTerm_ORecordCon (dtb__43) -> (String.concat "" ["{ "; ((v_joinWith "; ") (v_recordFields dtb__43)); " }"])
  | Codegen_dOcaml_dModel.C_OTerm_OCtorApp (dtb__44, dtb__45) -> (match dtb__45 with
  | B_dData_dList.C_List__x58__x58_ (dtb__46, dtb__47) -> (match dtb__47 with
  | B_dData_dList.C_List_Nil -> (String.concat "" ["("; dtb__44; " ("; (v_renderTerm dtb__46); "))"])
  | _ -> (String.concat "" ["("; dtb__44; " ("; ((v_joinWith ", ") ((B_dData_dList.v_map v_renderTerm) dtb__45)); "))"])
)
  | B_dData_dList.C_List_Nil -> dtb__44
  | _ -> (String.concat "" ["("; dtb__44; " ("; ((v_joinWith ", ") ((B_dData_dList.v_map v_renderTerm) dtb__45)); "))"])
)
  | Codegen_dOcaml_dModel.C_OTerm_OMatch (dtb__48, dtb__49, dtb__50) -> ((fun body -> ((fun fb -> (String.concat "" ["(match "; (v_renderTerm dtb__48); " with\n"; body; fb; ")"])) (if dtb__50 then "" else "  | _ -> failwith \"DT: impossible branch\"\n"))) ((v_joinWith "") ((B_dData_dList.v_map v_renderArm) dtb__49)))
  | Codegen_dOcaml_dModel.C_OTerm_OIf (dtb__51, dtb__52, dtb__53) -> (String.concat "" ["(if "; (v_renderTerm dtb__51); " then "; (v_renderTerm dtb__52); " else "; (v_renderTerm dtb__53); ")"])
  | Codegen_dOcaml_dModel.C_OTerm_OLet (dtb__54, dtb__55, dtb__56) -> (String.concat "" ["(let "; (v_renderPat dtb__54); " = "; (v_renderTerm dtb__55); " in "; (v_renderTerm dtb__56); ")"])
  | Codegen_dOcaml_dModel.C_OTerm_OLam (dtb__57, dtb__58) -> (match dtb__57 with
  | B_dData_dList.C_List_Nil -> (v_renderTerm dtb__58)
  | _ -> (String.concat "" ["(fun "; ((v_joinWith " ") ((B_dData_dList.v_map v_binderText) dtb__57)); " -> "; (v_renderTerm dtb__58); ")"])
)
  | Codegen_dOcaml_dModel.C_OTerm_OApp (dtb__59, dtb__60) -> (String.concat "" ["("; (v_renderTerm dtb__59); " "; (v_renderTerm dtb__60); ")"])
  | Codegen_dOcaml_dModel.C_OTerm_ORaw (dtb__61) -> dtb__61
  | Codegen_dOcaml_dModel.C_OTerm_OName (dtb__62) -> dtb__62
  | _ -> failwith "DT: impossible branch"
))
# 117 "Vuna/Compiler/Codegen/Ocaml/Render.vuna"
and v_renderArm = (fun (mc0 : (Codegen_dOcaml_dModel.t_OPat, Codegen_dOcaml_dModel.t_OTerm) B_dData_dPair.t_Pair) -> (match mc0 with
  | { B_dData_dPair.f_Pair_first = dtb__63; B_dData_dPair.f_Pair_second = dtb__64 } -> (String.concat "" ["  | "; (v_renderPat dtb__63); " -> "; (v_renderTerm dtb__64); "\n"])
  | _ -> failwith "DT: impossible branch"
))
# 120 "Vuna/Compiler/Codegen/Ocaml/Render.vuna"
and v_recordField = (fun (mc0 : (string, Codegen_dOcaml_dModel.t_OTerm) B_dData_dPair.t_Pair) -> (match mc0 with
  | { B_dData_dPair.f_Pair_first = dtb__65; B_dData_dPair.f_Pair_second = dtb__66 } -> (String.concat "" [dtb__65; " = "; (v_renderTerm dtb__66)])
  | _ -> failwith "DT: impossible branch"
))
# 123 "Vuna/Compiler/Codegen/Ocaml/Render.vuna"
and v_recordFields = (fun (fields : (string, Codegen_dOcaml_dModel.t_OTerm) B_dData_dPair.t_Pair B_dData_dList.t_List) -> ((B_dData_dList.v_map v_recordField) fields))
