open Vuna_runtime
# 14 "Vuna/Compiler/Elab/InstName.vuna"
let v_Vuna_dCompiler_dElab_dInstName_dinstanceHeadName = (fun (mc0 : Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dExpr) -> (match mc0 with
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dExpr_EApp (dtb__0, dtb__1, dtb__2) -> (match dtb__0 with
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dExpr_EVar (dtb__3, dtb__4) -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ((Vuna_dCompiler_dFrontend_dRast_dName.v_Vuna_dCompiler_dFrontend_dRast_dName_drnameKey dtb__3)))
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
)
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dExpr_EVar (dtb__5, dtb__6) -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ((Vuna_dCompiler_dFrontend_dRast_dName.v_Vuna_dCompiler_dFrontend_dRast_dName_drnameKey dtb__5)))
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
))

# 38 "Vuna/Compiler/Elab/InstName.vuna"
let v_Vuna_dCompiler_dElab_dInstName_dsanitizeInstName = (fun s -> ((Base_dData_dString.v_Base_dData_dString_djoin "_") ((Base_dData_dString.v_Base_dData_dString_dsplit ".") s)))

# 53 "Vuna/Compiler/Elab/InstName.vuna"
let rec v_Vuna_dCompiler_dElab_dInstName_dargSuffix = (fun (mc0 : Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dExpr Base_dData_dList.t_Base_dData_dList_dList) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__7, dtb__8) -> (String.concat "" ["_"; (v_Vuna_dCompiler_dElab_dInstName_dexprNameFor dtb__7); (v_Vuna_dCompiler_dElab_dInstName_dargSuffix dtb__8)])
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))
# 59 "Vuna/Compiler/Elab/InstName.vuna"
and v_Vuna_dCompiler_dElab_dInstName_dexprNameFor = (fun e -> (match e with
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dExpr_EVar (dtb__9, dtb__10) -> (Vuna_dCompiler_dFrontend_dRast_dName.v_Vuna_dCompiler_dFrontend_dRast_dName_drnameKey dtb__9)
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dExpr_EInt (dtb__11, dtb__12) -> (bi_strFromInt dtb__11)
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dExpr_EStr (dtb__13, dtb__14) -> dtb__13
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dExpr_EApp (dtb__15, dtb__16, dtb__17) -> ((v_Vuna_dCompiler_dElab_dInstName_dexprNameFor dtb__15) ^ (v_Vuna_dCompiler_dElab_dInstName_dargSuffix dtb__16))
  | _ -> "X"
))

# 48 "Vuna/Compiler/Elab/InstName.vuna"
let v_Vuna_dCompiler_dElab_dInstName_dargSuffixTail = (fun (mc0 : Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dExpr Base_dData_dList.t_Base_dData_dList_dList) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__18, dtb__19) -> ((v_Vuna_dCompiler_dElab_dInstName_dexprNameFor dtb__18) ^ (v_Vuna_dCompiler_dElab_dInstName_dargSuffix dtb__19))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))

# 43 "Vuna/Compiler/Elab/InstName.vuna"
let v_Vuna_dCompiler_dElab_dInstName_dderivedInstName = (fun (mc0 : Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dExpr) -> (match mc0 with
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dExpr_EApp (dtb__20, dtb__21, dtb__22) -> (v_Vuna_dCompiler_dElab_dInstName_dargSuffixTail dtb__21)
  | _ -> (v_Vuna_dCompiler_dElab_dInstName_dexprNameFor mc0)
))

# 32 "Vuna/Compiler/Elab/InstName.vuna"
let v_Vuna_dCompiler_dElab_dInstName_dinstanceName = (fun cname headExpr -> (v_Vuna_dCompiler_dElab_dInstName_dsanitizeInstName (String.concat "" [(Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dbaseNameOf cname); "_"; (v_Vuna_dCompiler_dElab_dInstName_dderivedInstName headExpr)])))

# 70 "Vuna/Compiler/Elab/InstName.vuna"
let v_Vuna_dCompiler_dElab_dInstName_dargNameOf = (fun (mc0 : Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dExpr) -> (match mc0 with
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dExpr_EVar (dtb__23, dtb__24) -> (Vuna_dCompiler_dFrontend_dRast_dName.v_Vuna_dCompiler_dFrontend_dRast_dName_drnameKey dtb__23)
  | _ -> "Int"
))
