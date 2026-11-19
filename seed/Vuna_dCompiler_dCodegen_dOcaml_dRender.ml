open Vuna_runtime
# 16 "Vuna/Compiler/Codegen/Ocaml/Render.vuna"
let rec v_Vuna_dCompiler_dCodegen_dOcaml_dRender_dinterpose = (fun (mc0 : string) (mc1 : string Base_dData_dList.t_Base_dData_dList_dList) -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__0, dtb__1) -> (match dtb__1 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__0, Base_dData_dList.C_Base_dData_dList_dList_Nil))
  | _ -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__0, (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (mc0, ((v_Vuna_dCompiler_dCodegen_dOcaml_dRender_dinterpose mc0) dtb__1)))))
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 13 "Vuna/Compiler/Codegen/Ocaml/Render.vuna"
let v_Vuna_dCompiler_dCodegen_dOcaml_dRender_djoinWith = (fun (sep : string) (xs : string Base_dData_dList.t_Base_dData_dList_dList) -> (Base_dData_dList.dtp_concatMany ((v_Vuna_dCompiler_dCodegen_dOcaml_dRender_dinterpose sep) xs)))

# 21 "Vuna/Compiler/Codegen/Ocaml/Render.vuna"
let v_Vuna_dCompiler_dCodegen_dOcaml_dRender_dtypeParamName = (fun (i : int) -> ("'a" ^ (bi_strFromInt i)))

# 24 "Vuna/Compiler/Codegen/Ocaml/Render.vuna"
let v_Vuna_dCompiler_dCodegen_dOcaml_dRender_dtypeParamDecl = (fun (mc0 : int) -> (if (mc0 = 0) then "" else ((fun nd_uscrut1 -> (match nd_uscrut1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__2, dtb__3) -> (match dtb__3 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (dtb__2 ^ " ")
  | _ -> (String.concat "" ["("; ((v_Vuna_dCompiler_dCodegen_dOcaml_dRender_djoinWith ", ") nd_uscrut1); ") "])
)
  | _ -> (String.concat "" ["("; ((v_Vuna_dCompiler_dCodegen_dOcaml_dRender_djoinWith ", ") nd_uscrut1); ") "])
)) ((Base_dData_dList.v_Base_dData_dList_dmap v_Vuna_dCompiler_dCodegen_dOcaml_dRender_dtypeParamName) ((Base_dData_dList.v_Base_dData_dList_drange 0) mc0)))))

# 31 "Vuna/Compiler/Codegen/Ocaml/Render.vuna"
let v_Vuna_dCompiler_dCodegen_dOcaml_dRender_dfamilyTy = (fun (mc0 : string) (mc1 : string Base_dData_dList.t_Base_dData_dList_dList) -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__4, dtb__5) -> (match dtb__5 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (String.concat "" [dtb__4; " "; mc0])
  | _ -> (String.concat "" ["("; ((v_Vuna_dCompiler_dCodegen_dOcaml_dRender_djoinWith ", ") mc1); ") "; mc0])
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> mc0
  | _ -> failwith "DT: impossible branch"
))

# 37 "Vuna/Compiler/Codegen/Ocaml/Render.vuna"
let rec v_Vuna_dCompiler_dCodegen_dOcaml_dRender_drenderTy = (fun (mc0 : (string) -> string) (mc1 : Vuna_dCompiler_dCodegen_dOcaml_dModel.t_Vuna_dCompiler_dCodegen_dOcaml_dModel_dOTy) -> (match mc1 with
  | Vuna_dCompiler_dCodegen_dOcaml_dModel.C_Vuna_dCompiler_dCodegen_dOcaml_dModel_dOTy_OTData (dtb__6, dtb__7) -> ((v_Vuna_dCompiler_dCodegen_dOcaml_dRender_dfamilyTy (mc0 dtb__6)) ((Base_dData_dList.v_Base_dData_dList_dmap (v_Vuna_dCompiler_dCodegen_dOcaml_dRender_drenderTy mc0)) dtb__7))
  | Vuna_dCompiler_dCodegen_dOcaml_dModel.C_Vuna_dCompiler_dCodegen_dOcaml_dModel_dOTy_OTFun (dtb__8, dtb__9) -> (String.concat "" ["("; ((v_Vuna_dCompiler_dCodegen_dOcaml_dRender_drenderTy mc0) dtb__8); ") -> "; ((v_Vuna_dCompiler_dCodegen_dOcaml_dRender_drenderTy mc0) dtb__9)])
  | Vuna_dCompiler_dCodegen_dOcaml_dModel.C_Vuna_dCompiler_dCodegen_dOcaml_dModel_dOTy_OTRef (dtb__10) -> (String.concat "" ["("; ((v_Vuna_dCompiler_dCodegen_dOcaml_dRender_drenderTy mc0) dtb__10); " ref)"])
  | Vuna_dCompiler_dCodegen_dOcaml_dModel.C_Vuna_dCompiler_dCodegen_dOcaml_dModel_dOTy_OTArray (dtb__11) -> (String.concat "" ["("; ((v_Vuna_dCompiler_dCodegen_dOcaml_dRender_drenderTy mc0) dtb__11); " array)"])
  | Vuna_dCompiler_dCodegen_dOcaml_dModel.C_Vuna_dCompiler_dCodegen_dOcaml_dModel_dOTy_OTOpaque -> "Obj.t"
  | Vuna_dCompiler_dCodegen_dOcaml_dModel.C_Vuna_dCompiler_dCodegen_dOcaml_dModel_dOTy_OTFloat -> "float"
  | Vuna_dCompiler_dCodegen_dOcaml_dModel.C_Vuna_dCompiler_dCodegen_dOcaml_dModel_dOTy_OTBool -> "bool"
  | Vuna_dCompiler_dCodegen_dOcaml_dModel.C_Vuna_dCompiler_dCodegen_dOcaml_dModel_dOTy_OTStr -> "string"
  | Vuna_dCompiler_dCodegen_dOcaml_dModel.C_Vuna_dCompiler_dCodegen_dOcaml_dModel_dOTy_OTInt -> "int"
  | Vuna_dCompiler_dCodegen_dOcaml_dModel.C_Vuna_dCompiler_dCodegen_dOcaml_dModel_dOTy_OTVar (dtb__12) -> (v_Vuna_dCompiler_dCodegen_dOcaml_dRender_dtypeParamName dtb__12)
  | _ -> failwith "DT: impossible branch"
))

# 49 "Vuna/Compiler/Codegen/Ocaml/Render.vuna"
let v_Vuna_dCompiler_dCodegen_dOcaml_dRender_dctorDecl = (fun (qual : (string) -> string) (c : Vuna_dCompiler_dCodegen_dOcaml_dModel.t_Vuna_dCompiler_dCodegen_dOcaml_dModel_dOCtor) -> ((fun nd_uscrut2 -> (match nd_uscrut2 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__13, dtb__14) -> (match dtb__14 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (String.concat "" [(c).Vuna_dCompiler_dCodegen_dOcaml_dModel.f_Vuna_dCompiler_dCodegen_dOcaml_dModel_dOCtor_ocName; " of ("; ((v_Vuna_dCompiler_dCodegen_dOcaml_dRender_drenderTy qual) dtb__13); ")"])
  | _ -> (String.concat "" [(c).Vuna_dCompiler_dCodegen_dOcaml_dModel.f_Vuna_dCompiler_dCodegen_dOcaml_dModel_dOCtor_ocName; " of "; ((v_Vuna_dCompiler_dCodegen_dOcaml_dRender_djoinWith " * ") ((Base_dData_dList.v_Base_dData_dList_dmap (fun (t : Vuna_dCompiler_dCodegen_dOcaml_dModel.t_Vuna_dCompiler_dCodegen_dOcaml_dModel_dOTy) -> (String.concat "" ["("; ((v_Vuna_dCompiler_dCodegen_dOcaml_dRender_drenderTy qual) t); ")"]))) nd_uscrut2))])
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (c).Vuna_dCompiler_dCodegen_dOcaml_dModel.f_Vuna_dCompiler_dCodegen_dOcaml_dModel_dOCtor_ocName
  | _ -> failwith "DT: impossible branch"
)) (c).Vuna_dCompiler_dCodegen_dOcaml_dModel.f_Vuna_dCompiler_dCodegen_dOcaml_dModel_dOCtor_ocFields))

# 65 "Vuna/Compiler/Codegen/Ocaml/Render.vuna"
let v_Vuna_dCompiler_dCodegen_dOcaml_dRender_dfieldDecl = (fun (mc0 : (string) -> string) (mc1 : (string, Vuna_dCompiler_dCodegen_dOcaml_dModel.t_Vuna_dCompiler_dCodegen_dOcaml_dModel_dOTy) Base_dData_dPair.t_Base_dData_dPair_dPair) -> (match mc1 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__15; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__16 } -> (String.concat "" [dtb__15; " : "; ((v_Vuna_dCompiler_dCodegen_dOcaml_dRender_drenderTy mc0) dtb__16)])
  | _ -> failwith "DT: impossible branch"
))

# 57 "Vuna/Compiler/Codegen/Ocaml/Render.vuna"
let v_Vuna_dCompiler_dCodegen_dOcaml_dRender_drenderDecl = (fun (mc0 : (string) -> string) (mc1 : Vuna_dCompiler_dCodegen_dOcaml_dModel.t_Vuna_dCompiler_dCodegen_dOcaml_dModel_dODecl) -> (match mc1 with
  | Vuna_dCompiler_dCodegen_dOcaml_dModel.C_Vuna_dCompiler_dCodegen_dOcaml_dModel_dODecl_ODAlias (dtb__17, dtb__18, dtb__19) -> (String.concat "" [(v_Vuna_dCompiler_dCodegen_dOcaml_dRender_dtypeParamDecl dtb__17); dtb__18; " = "; ((v_Vuna_dCompiler_dCodegen_dOcaml_dRender_drenderTy mc0) dtb__19)])
  | Vuna_dCompiler_dCodegen_dOcaml_dModel.C_Vuna_dCompiler_dCodegen_dOcaml_dModel_dODecl_ODRecord (dtb__20, dtb__21, dtb__22) -> (String.concat "" [(v_Vuna_dCompiler_dCodegen_dOcaml_dRender_dtypeParamDecl dtb__20); dtb__21; " = { "; ((v_Vuna_dCompiler_dCodegen_dOcaml_dRender_djoinWith "; ") ((Base_dData_dList.v_Base_dData_dList_dmap (v_Vuna_dCompiler_dCodegen_dOcaml_dRender_dfieldDecl mc0)) dtb__22)); " }"])
  | Vuna_dCompiler_dCodegen_dOcaml_dModel.C_Vuna_dCompiler_dCodegen_dOcaml_dModel_dODecl_ODVariant (dtb__23, dtb__24, dtb__25) -> (match dtb__25 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (String.concat "" [(v_Vuna_dCompiler_dCodegen_dOcaml_dRender_dtypeParamDecl dtb__23); dtb__24; " = |"])
  | _ -> (String.concat "" [(v_Vuna_dCompiler_dCodegen_dOcaml_dRender_dtypeParamDecl dtb__23); dtb__24; " = "; ((v_Vuna_dCompiler_dCodegen_dOcaml_dRender_djoinWith " | ") ((Base_dData_dList.v_Base_dData_dList_dmap (v_Vuna_dCompiler_dCodegen_dOcaml_dRender_dctorDecl mc0)) dtb__25))])
)
  | _ -> failwith "DT: impossible branch"
))

# 69 "Vuna/Compiler/Codegen/Ocaml/Render.vuna"
let v_Vuna_dCompiler_dCodegen_dOcaml_dRender_drenderDecls = (fun (mc0 : (string) -> string) (mc1 : Vuna_dCompiler_dCodegen_dOcaml_dModel.t_Vuna_dCompiler_dCodegen_dOcaml_dModel_dODecl Base_dData_dList.t_Base_dData_dList_dList) -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> ""
  | _ -> (String.concat "" ["type "; ((v_Vuna_dCompiler_dCodegen_dOcaml_dRender_djoinWith "\nand ") ((Base_dData_dList.v_Base_dData_dList_dmap (v_Vuna_dCompiler_dCodegen_dOcaml_dRender_drenderDecl mc0)) mc1)); "\n\n"])
))

# 78 "Vuna/Compiler/Codegen/Ocaml/Render.vuna"
let rec v_Vuna_dCompiler_dCodegen_dOcaml_dRender_drenderPat = (fun (mc0 : Vuna_dCompiler_dCodegen_dOcaml_dModel.t_Vuna_dCompiler_dCodegen_dOcaml_dModel_dOPat) -> (match mc0 with
  | Vuna_dCompiler_dCodegen_dOcaml_dModel.C_Vuna_dCompiler_dCodegen_dOcaml_dModel_dOPat_OPRecordPat (dtb__26) -> (String.concat "" ["{ "; ((v_Vuna_dCompiler_dCodegen_dOcaml_dRender_djoinWith "; ") ((Base_dData_dList.v_Base_dData_dList_dmap v_Vuna_dCompiler_dCodegen_dOcaml_dRender_dfieldAssign) dtb__26)); " }"])
  | Vuna_dCompiler_dCodegen_dOcaml_dModel.C_Vuna_dCompiler_dCodegen_dOcaml_dModel_dOPat_OPCtorPat (dtb__27, dtb__28) -> (match dtb__28 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> dtb__27
  | _ -> (String.concat "" [dtb__27; " ("; ((v_Vuna_dCompiler_dCodegen_dOcaml_dRender_djoinWith ", ") ((Base_dData_dList.v_Base_dData_dList_dmap v_Vuna_dCompiler_dCodegen_dOcaml_dRender_drenderPat) dtb__28)); ")"])
)
  | Vuna_dCompiler_dCodegen_dOcaml_dModel.C_Vuna_dCompiler_dCodegen_dOcaml_dModel_dOPat_OPWild -> "_"
  | Vuna_dCompiler_dCodegen_dOcaml_dModel.C_Vuna_dCompiler_dCodegen_dOcaml_dModel_dOPat_OPVar (dtb__29) -> dtb__29
  | _ -> failwith "DT: impossible branch"
))
# 85 "Vuna/Compiler/Codegen/Ocaml/Render.vuna"
and v_Vuna_dCompiler_dCodegen_dOcaml_dRender_dfieldAssign = (fun (mc0 : (string, Vuna_dCompiler_dCodegen_dOcaml_dModel.t_Vuna_dCompiler_dCodegen_dOcaml_dModel_dOPat) Base_dData_dPair.t_Base_dData_dPair_dPair) -> (match mc0 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__30; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__31 } -> (String.concat "" [dtb__30; " = "; (v_Vuna_dCompiler_dCodegen_dOcaml_dRender_drenderPat dtb__31)])
  | _ -> failwith "DT: impossible branch"
))

# 88 "Vuna/Compiler/Codegen/Ocaml/Render.vuna"
let v_Vuna_dCompiler_dCodegen_dOcaml_dRender_dbinderText = (fun (mc0 : (string, string Base_dData_dMaybe.t_Base_dData_dMaybe_dMaybe) Base_dData_dPair.t_Base_dData_dPair_dPair) -> (match mc0 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__32; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__33 } -> (match dtb__33 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__34) -> (String.concat "" ["("; dtb__32; " : "; dtb__34; ")"])
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> dtb__32
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 92 "Vuna/Compiler/Codegen/Ocaml/Render.vuna"
let rec v_Vuna_dCompiler_dCodegen_dOcaml_dRender_drenderTerm = (fun (mc0 : Vuna_dCompiler_dCodegen_dOcaml_dModel.t_Vuna_dCompiler_dCodegen_dOcaml_dModel_dOTerm) -> (match mc0 with
  | Vuna_dCompiler_dCodegen_dOcaml_dModel.C_Vuna_dCompiler_dCodegen_dOcaml_dModel_dOTerm_OAnnot (dtb__35, dtb__36) -> (String.concat "" ["("; (v_Vuna_dCompiler_dCodegen_dOcaml_dRender_drenderTerm dtb__35); " : "; dtb__36; ")"])
  | Vuna_dCompiler_dCodegen_dOcaml_dModel.C_Vuna_dCompiler_dCodegen_dOcaml_dModel_dOTerm_OCast (dtb__37) -> (String.concat "" ["(Obj.magic "; (v_Vuna_dCompiler_dCodegen_dOcaml_dRender_drenderTerm dtb__37); ")"])
  | Vuna_dCompiler_dCodegen_dOcaml_dModel.C_Vuna_dCompiler_dCodegen_dOcaml_dModel_dOTerm_OConcatStr (dtb__38) -> (String.concat "" ["(String.concat \"\" ["; ((v_Vuna_dCompiler_dCodegen_dOcaml_dRender_djoinWith "; ") ((Base_dData_dList.v_Base_dData_dList_dmap v_Vuna_dCompiler_dCodegen_dOcaml_dRender_drenderTerm) dtb__38)); "])"])
  | Vuna_dCompiler_dCodegen_dOcaml_dModel.C_Vuna_dCompiler_dCodegen_dOcaml_dModel_dOTerm_OProj (dtb__39, dtb__40) -> (String.concat "" ["("; (v_Vuna_dCompiler_dCodegen_dOcaml_dRender_drenderTerm dtb__39); ")."; dtb__40])
  | Vuna_dCompiler_dCodegen_dOcaml_dModel.C_Vuna_dCompiler_dCodegen_dOcaml_dModel_dOTerm_ORecordUpd (dtb__41, dtb__42) -> (String.concat "" ["{ "; (v_Vuna_dCompiler_dCodegen_dOcaml_dRender_drenderTerm dtb__41); " with "; ((v_Vuna_dCompiler_dCodegen_dOcaml_dRender_djoinWith "; ") (v_Vuna_dCompiler_dCodegen_dOcaml_dRender_drecordFields dtb__42)); " }"])
  | Vuna_dCompiler_dCodegen_dOcaml_dModel.C_Vuna_dCompiler_dCodegen_dOcaml_dModel_dOTerm_ORecordCon (dtb__43) -> (String.concat "" ["{ "; ((v_Vuna_dCompiler_dCodegen_dOcaml_dRender_djoinWith "; ") (v_Vuna_dCompiler_dCodegen_dOcaml_dRender_drecordFields dtb__43)); " }"])
  | Vuna_dCompiler_dCodegen_dOcaml_dModel.C_Vuna_dCompiler_dCodegen_dOcaml_dModel_dOTerm_OCtorApp (dtb__44, dtb__45) -> (match dtb__45 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__46, dtb__47) -> (match dtb__47 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (String.concat "" ["("; dtb__44; " ("; (v_Vuna_dCompiler_dCodegen_dOcaml_dRender_drenderTerm dtb__46); "))"])
  | _ -> (String.concat "" ["("; dtb__44; " ("; ((v_Vuna_dCompiler_dCodegen_dOcaml_dRender_djoinWith ", ") ((Base_dData_dList.v_Base_dData_dList_dmap v_Vuna_dCompiler_dCodegen_dOcaml_dRender_drenderTerm) dtb__45)); "))"])
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> dtb__44
  | _ -> (String.concat "" ["("; dtb__44; " ("; ((v_Vuna_dCompiler_dCodegen_dOcaml_dRender_djoinWith ", ") ((Base_dData_dList.v_Base_dData_dList_dmap v_Vuna_dCompiler_dCodegen_dOcaml_dRender_drenderTerm) dtb__45)); "))"])
)
  | Vuna_dCompiler_dCodegen_dOcaml_dModel.C_Vuna_dCompiler_dCodegen_dOcaml_dModel_dOTerm_OMatch (dtb__48, dtb__49, dtb__50) -> ((fun body -> ((fun fb -> (String.concat "" ["(match "; (v_Vuna_dCompiler_dCodegen_dOcaml_dRender_drenderTerm dtb__48); " with\n"; body; fb; ")"])) (if dtb__50 then "" else "  | _ -> failwith \"DT: impossible branch\"\n"))) ((v_Vuna_dCompiler_dCodegen_dOcaml_dRender_djoinWith "") ((Base_dData_dList.v_Base_dData_dList_dmap v_Vuna_dCompiler_dCodegen_dOcaml_dRender_drenderArm) dtb__49)))
  | Vuna_dCompiler_dCodegen_dOcaml_dModel.C_Vuna_dCompiler_dCodegen_dOcaml_dModel_dOTerm_OIf (dtb__51, dtb__52, dtb__53) -> (String.concat "" ["(if "; (v_Vuna_dCompiler_dCodegen_dOcaml_dRender_drenderTerm dtb__51); " then "; (v_Vuna_dCompiler_dCodegen_dOcaml_dRender_drenderTerm dtb__52); " else "; (v_Vuna_dCompiler_dCodegen_dOcaml_dRender_drenderTerm dtb__53); ")"])
  | Vuna_dCompiler_dCodegen_dOcaml_dModel.C_Vuna_dCompiler_dCodegen_dOcaml_dModel_dOTerm_OLet (dtb__54, dtb__55, dtb__56) -> (String.concat "" ["(let "; (v_Vuna_dCompiler_dCodegen_dOcaml_dRender_drenderPat dtb__54); " = "; (v_Vuna_dCompiler_dCodegen_dOcaml_dRender_drenderTerm dtb__55); " in "; (v_Vuna_dCompiler_dCodegen_dOcaml_dRender_drenderTerm dtb__56); ")"])
  | Vuna_dCompiler_dCodegen_dOcaml_dModel.C_Vuna_dCompiler_dCodegen_dOcaml_dModel_dOTerm_OLam (dtb__57, dtb__58) -> (match dtb__57 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (v_Vuna_dCompiler_dCodegen_dOcaml_dRender_drenderTerm dtb__58)
  | _ -> (String.concat "" ["(fun "; ((v_Vuna_dCompiler_dCodegen_dOcaml_dRender_djoinWith " ") ((Base_dData_dList.v_Base_dData_dList_dmap v_Vuna_dCompiler_dCodegen_dOcaml_dRender_dbinderText) dtb__57)); " -> "; (v_Vuna_dCompiler_dCodegen_dOcaml_dRender_drenderTerm dtb__58); ")"])
)
  | Vuna_dCompiler_dCodegen_dOcaml_dModel.C_Vuna_dCompiler_dCodegen_dOcaml_dModel_dOTerm_OApp (dtb__59, dtb__60) -> (String.concat "" ["("; (v_Vuna_dCompiler_dCodegen_dOcaml_dRender_drenderTerm dtb__59); " "; (v_Vuna_dCompiler_dCodegen_dOcaml_dRender_drenderTerm dtb__60); ")"])
  | Vuna_dCompiler_dCodegen_dOcaml_dModel.C_Vuna_dCompiler_dCodegen_dOcaml_dModel_dOTerm_ORaw (dtb__61) -> dtb__61
  | Vuna_dCompiler_dCodegen_dOcaml_dModel.C_Vuna_dCompiler_dCodegen_dOcaml_dModel_dOTerm_OName (dtb__62) -> dtb__62
  | _ -> failwith "DT: impossible branch"
))
# 117 "Vuna/Compiler/Codegen/Ocaml/Render.vuna"
and v_Vuna_dCompiler_dCodegen_dOcaml_dRender_drenderArm = (fun (mc0 : (Vuna_dCompiler_dCodegen_dOcaml_dModel.t_Vuna_dCompiler_dCodegen_dOcaml_dModel_dOPat, Vuna_dCompiler_dCodegen_dOcaml_dModel.t_Vuna_dCompiler_dCodegen_dOcaml_dModel_dOTerm) Base_dData_dPair.t_Base_dData_dPair_dPair) -> (match mc0 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__63; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__64 } -> (String.concat "" ["  | "; (v_Vuna_dCompiler_dCodegen_dOcaml_dRender_drenderPat dtb__63); " -> "; (v_Vuna_dCompiler_dCodegen_dOcaml_dRender_drenderTerm dtb__64); "\n"])
  | _ -> failwith "DT: impossible branch"
))
# 120 "Vuna/Compiler/Codegen/Ocaml/Render.vuna"
and v_Vuna_dCompiler_dCodegen_dOcaml_dRender_drecordField = (fun (mc0 : (string, Vuna_dCompiler_dCodegen_dOcaml_dModel.t_Vuna_dCompiler_dCodegen_dOcaml_dModel_dOTerm) Base_dData_dPair.t_Base_dData_dPair_dPair) -> (match mc0 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__65; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__66 } -> (String.concat "" [dtb__65; " = "; (v_Vuna_dCompiler_dCodegen_dOcaml_dRender_drenderTerm dtb__66)])
  | _ -> failwith "DT: impossible branch"
))
# 123 "Vuna/Compiler/Codegen/Ocaml/Render.vuna"
and v_Vuna_dCompiler_dCodegen_dOcaml_dRender_drecordFields = (fun (fields : (string, Vuna_dCompiler_dCodegen_dOcaml_dModel.t_Vuna_dCompiler_dCodegen_dOcaml_dModel_dOTerm) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) -> ((Base_dData_dList.v_Base_dData_dList_dmap v_Vuna_dCompiler_dCodegen_dOcaml_dRender_drecordField) fields))
