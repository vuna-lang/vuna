open Vuna_runtime
# 16 "Vuna/Compiler/Codegen/Ocaml/Render.vuna"
let rec v_Vuna_dCompiler_dCodegen_dOcaml_dRender_dinterpose = (fun mc0 mc1 -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__0, dtb__1) -> (match dtb__1 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__0, Base_dData_dList.C_Base_dData_dList_dList_Nil))
  | _ -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__0, (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (mc0, ((v_Vuna_dCompiler_dCodegen_dOcaml_dRender_dinterpose mc0) dtb__1)))))
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 13 "Vuna/Compiler/Codegen/Ocaml/Render.vuna"
let v_Vuna_dCompiler_dCodegen_dOcaml_dRender_djoinWith = (fun sep xs -> (Base_dData_dList.dtp_concatMany ((v_Vuna_dCompiler_dCodegen_dOcaml_dRender_dinterpose sep) xs)))

# 21 "Vuna/Compiler/Codegen/Ocaml/Render.vuna"
let v_Vuna_dCompiler_dCodegen_dOcaml_dRender_dtypeParamName = (fun i -> ("'a" ^ (bi_strFromInt i)))

# 24 "Vuna/Compiler/Codegen/Ocaml/Render.vuna"
let v_Vuna_dCompiler_dCodegen_dOcaml_dRender_dtypeParamDecl = (fun mc0 -> (if (mc0 = 0) then "" else ((fun nd_uscrut1 -> (match nd_uscrut1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__2, dtb__3) -> (match dtb__3 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (dtb__2 ^ " ")
  | _ -> (String.concat "" ["("; ((v_Vuna_dCompiler_dCodegen_dOcaml_dRender_djoinWith ", ") nd_uscrut1); ") "])
)
  | _ -> (String.concat "" ["("; ((v_Vuna_dCompiler_dCodegen_dOcaml_dRender_djoinWith ", ") nd_uscrut1); ") "])
)) ((Base_dData_dList.v_Base_dData_dList_dmap v_Vuna_dCompiler_dCodegen_dOcaml_dRender_dtypeParamName) ((Base_dData_dList.v_Base_dData_dList_drange 0) mc0)))))

# 30 "Vuna/Compiler/Codegen/Ocaml/Render.vuna"
let v_Vuna_dCompiler_dCodegen_dOcaml_dRender_dfamilyTy = (fun mc0 mc1 -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__4, dtb__5) -> (match dtb__5 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (String.concat "" [dtb__4; " "; mc0])
  | _ -> (String.concat "" ["("; ((v_Vuna_dCompiler_dCodegen_dOcaml_dRender_djoinWith ", ") mc1); ") "; mc0])
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> mc0
  | _ -> failwith "DT: impossible branch"
))

# 36 "Vuna/Compiler/Codegen/Ocaml/Render.vuna"
let rec v_Vuna_dCompiler_dCodegen_dOcaml_dRender_drenderTy = (fun qual ty -> (match ty with
  | Vuna_dCompiler_dCodegen_dOcaml_dModel.C_Vuna_dCompiler_dCodegen_dOcaml_dModel_dOTy_OTVar (dtb__6) -> (v_Vuna_dCompiler_dCodegen_dOcaml_dRender_dtypeParamName dtb__6)
  | Vuna_dCompiler_dCodegen_dOcaml_dModel.C_Vuna_dCompiler_dCodegen_dOcaml_dModel_dOTy_OTInt -> "int"
  | Vuna_dCompiler_dCodegen_dOcaml_dModel.C_Vuna_dCompiler_dCodegen_dOcaml_dModel_dOTy_OTStr -> "string"
  | Vuna_dCompiler_dCodegen_dOcaml_dModel.C_Vuna_dCompiler_dCodegen_dOcaml_dModel_dOTy_OTBool -> "bool"
  | Vuna_dCompiler_dCodegen_dOcaml_dModel.C_Vuna_dCompiler_dCodegen_dOcaml_dModel_dOTy_OTFloat -> "float"
  | Vuna_dCompiler_dCodegen_dOcaml_dModel.C_Vuna_dCompiler_dCodegen_dOcaml_dModel_dOTy_OTOpaque -> "Obj.t"
  | Vuna_dCompiler_dCodegen_dOcaml_dModel.C_Vuna_dCompiler_dCodegen_dOcaml_dModel_dOTy_OTArray (dtb__7) -> (String.concat "" ["("; ((v_Vuna_dCompiler_dCodegen_dOcaml_dRender_drenderTy qual) dtb__7); " array)"])
  | Vuna_dCompiler_dCodegen_dOcaml_dModel.C_Vuna_dCompiler_dCodegen_dOcaml_dModel_dOTy_OTRef (dtb__8) -> (String.concat "" ["("; ((v_Vuna_dCompiler_dCodegen_dOcaml_dRender_drenderTy qual) dtb__8); " ref)"])
  | Vuna_dCompiler_dCodegen_dOcaml_dModel.C_Vuna_dCompiler_dCodegen_dOcaml_dModel_dOTy_OTFun (dtb__9, dtb__10) -> (String.concat "" ["("; ((v_Vuna_dCompiler_dCodegen_dOcaml_dRender_drenderTy qual) dtb__9); ") -> "; ((v_Vuna_dCompiler_dCodegen_dOcaml_dRender_drenderTy qual) dtb__10)])
  | Vuna_dCompiler_dCodegen_dOcaml_dModel.C_Vuna_dCompiler_dCodegen_dOcaml_dModel_dOTy_OTData (dtb__11, dtb__12) -> ((v_Vuna_dCompiler_dCodegen_dOcaml_dRender_dfamilyTy (qual dtb__11)) ((Base_dData_dList.v_Base_dData_dList_dmap (v_Vuna_dCompiler_dCodegen_dOcaml_dRender_drenderTy qual)) dtb__12))
  | _ -> failwith "DT: impossible branch"
))

# 49 "Vuna/Compiler/Codegen/Ocaml/Render.vuna"
let v_Vuna_dCompiler_dCodegen_dOcaml_dRender_dctorDecl = (fun qual c -> ((fun nd_uscrut2 -> (match nd_uscrut2 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__13, dtb__14) -> (match dtb__14 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (String.concat "" [(c).Vuna_dCompiler_dCodegen_dOcaml_dModel.f_Vuna_dCompiler_dCodegen_dOcaml_dModel_dOCtor_ocName; " of ("; ((v_Vuna_dCompiler_dCodegen_dOcaml_dRender_drenderTy qual) dtb__13); ")"])
  | _ -> (String.concat "" [(c).Vuna_dCompiler_dCodegen_dOcaml_dModel.f_Vuna_dCompiler_dCodegen_dOcaml_dModel_dOCtor_ocName; " of "; ((v_Vuna_dCompiler_dCodegen_dOcaml_dRender_djoinWith " * ") ((Base_dData_dList.v_Base_dData_dList_dmap (fun t -> (String.concat "" ["("; ((v_Vuna_dCompiler_dCodegen_dOcaml_dRender_drenderTy qual) t); ")"]))) nd_uscrut2))])
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (c).Vuna_dCompiler_dCodegen_dOcaml_dModel.f_Vuna_dCompiler_dCodegen_dOcaml_dModel_dOCtor_ocName
  | _ -> failwith "DT: impossible branch"
)) (c).Vuna_dCompiler_dCodegen_dOcaml_dModel.f_Vuna_dCompiler_dCodegen_dOcaml_dModel_dOCtor_ocFields))

# 65 "Vuna/Compiler/Codegen/Ocaml/Render.vuna"
let v_Vuna_dCompiler_dCodegen_dOcaml_dRender_dfieldDecl = (fun mc0 mc1 -> (match mc1 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__15; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__16 } -> (String.concat "" [dtb__15; " : "; ((v_Vuna_dCompiler_dCodegen_dOcaml_dRender_drenderTy mc0) dtb__16)])
  | _ -> failwith "DT: impossible branch"
))

# 56 "Vuna/Compiler/Codegen/Ocaml/Render.vuna"
let v_Vuna_dCompiler_dCodegen_dOcaml_dRender_drenderDecl = (fun qual d -> ((fun nd_uscrut2 -> (match nd_uscrut2 with
  | Vuna_dCompiler_dCodegen_dOcaml_dModel.C_Vuna_dCompiler_dCodegen_dOcaml_dModel_dODecl_ODAlias (dtb__17, dtb__18, dtb__19) -> (String.concat "" [(v_Vuna_dCompiler_dCodegen_dOcaml_dRender_dtypeParamDecl dtb__17); dtb__18; " = "; ((v_Vuna_dCompiler_dCodegen_dOcaml_dRender_drenderTy qual) dtb__19)])
  | Vuna_dCompiler_dCodegen_dOcaml_dModel.C_Vuna_dCompiler_dCodegen_dOcaml_dModel_dODecl_ODRecord (dtb__20, dtb__21, dtb__22) -> (String.concat "" [(v_Vuna_dCompiler_dCodegen_dOcaml_dRender_dtypeParamDecl dtb__20); dtb__21; " = { "; ((v_Vuna_dCompiler_dCodegen_dOcaml_dRender_djoinWith "; ") ((Base_dData_dList.v_Base_dData_dList_dmap (v_Vuna_dCompiler_dCodegen_dOcaml_dRender_dfieldDecl qual)) dtb__22)); " }"])
  | Vuna_dCompiler_dCodegen_dOcaml_dModel.C_Vuna_dCompiler_dCodegen_dOcaml_dModel_dODecl_ODVariant (dtb__23, dtb__24, dtb__25) -> (match dtb__25 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (String.concat "" [(v_Vuna_dCompiler_dCodegen_dOcaml_dRender_dtypeParamDecl dtb__23); dtb__24; " = |"])
  | _ -> (String.concat "" [(v_Vuna_dCompiler_dCodegen_dOcaml_dRender_dtypeParamDecl dtb__23); dtb__24; " = "; ((v_Vuna_dCompiler_dCodegen_dOcaml_dRender_djoinWith " | ") ((Base_dData_dList.v_Base_dData_dList_dmap (v_Vuna_dCompiler_dCodegen_dOcaml_dRender_dctorDecl qual)) dtb__25))])
)
  | _ -> failwith "DT: impossible branch"
)) d))

# 69 "Vuna/Compiler/Codegen/Ocaml/Render.vuna"
let v_Vuna_dCompiler_dCodegen_dOcaml_dRender_drenderDecls = (fun qual decls -> (match decls with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> ""
  | _ -> (String.concat "" ["type "; ((v_Vuna_dCompiler_dCodegen_dOcaml_dRender_djoinWith "\nand ") ((Base_dData_dList.v_Base_dData_dList_dmap (v_Vuna_dCompiler_dCodegen_dOcaml_dRender_drenderDecl qual)) decls)); "\n\n"])
))
