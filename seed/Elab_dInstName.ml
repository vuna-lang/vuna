open Vuna_runtime
# 14 "Vuna/Compiler/Elab/InstName.vuna"
let v_instanceHeadName = (fun (mc0 : Frontend_dRast.t_Expr) -> (match mc0 with
  | Frontend_dRast.C_Expr_EApp (dtb__0, dtb__1, dtb__2) -> (match dtb__0 with
  | Frontend_dRast.C_Expr_EVar (dtb__3, dtb__4) -> (B_dData_dMaybe.C_Maybe_Just ((Frontend_dRast_dName.v_rnameKey dtb__3)))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | Frontend_dRast.C_Expr_EVar (dtb__5, dtb__6) -> (B_dData_dMaybe.C_Maybe_Just ((Frontend_dRast_dName.v_rnameKey dtb__5)))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
))

# 38 "Vuna/Compiler/Elab/InstName.vuna"
let v_sanitizeInstName = (fun (s : string) -> ((B_dData_dString.v_join "_") ((B_dData_dString.v_split ".") s)))

# 53 "Vuna/Compiler/Elab/InstName.vuna"
let rec v_argSuffix = (fun (mc0 : Frontend_dRast.t_Expr B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__7, dtb__8) -> (String.concat "" ["_"; (v_exprNameFor dtb__7); (v_argSuffix dtb__8)])
  | B_dData_dList.C_List_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))
# 59 "Vuna/Compiler/Elab/InstName.vuna"
and v_exprNameFor = (fun (e : Frontend_dRast.t_Expr) -> (match e with
  | Frontend_dRast.C_Expr_EVar (dtb__9, dtb__10) -> (Frontend_dRast_dName.v_rnameKey dtb__9)
  | Frontend_dRast.C_Expr_EInt (dtb__11, dtb__12) -> (bi_strFromInt dtb__11)
  | Frontend_dRast.C_Expr_EStr (dtb__13, dtb__14) -> dtb__13
  | Frontend_dRast.C_Expr_EApp (dtb__15, dtb__16, dtb__17) -> ((v_exprNameFor dtb__15) ^ (v_argSuffix dtb__16))
  | _ -> "X"
))

# 48 "Vuna/Compiler/Elab/InstName.vuna"
let v_argSuffixTail = (fun (mc0 : Frontend_dRast.t_Expr B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__18, dtb__19) -> ((v_exprNameFor dtb__18) ^ (v_argSuffix dtb__19))
  | B_dData_dList.C_List_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))

# 43 "Vuna/Compiler/Elab/InstName.vuna"
let v_derivedInstName = (fun (mc0 : Frontend_dRast.t_Expr) -> (match mc0 with
  | Frontend_dRast.C_Expr_EApp (dtb__20, dtb__21, dtb__22) -> (v_argSuffixTail dtb__21)
  | _ -> (v_exprNameFor mc0)
))

# 32 "Vuna/Compiler/Elab/InstName.vuna"
let v_instanceName = (fun (cname : string) (headExpr : Frontend_dRast.t_Expr) -> (v_sanitizeInstName (String.concat "" [(Elab_dMeta.v_baseNameOf cname); "_"; (v_derivedInstName headExpr)])))

# 70 "Vuna/Compiler/Elab/InstName.vuna"
let v_argNameOf = (fun (mc0 : Frontend_dRast.t_Expr) -> (match mc0 with
  | Frontend_dRast.C_Expr_EVar (dtb__23, dtb__24) -> (Frontend_dRast_dName.v_rnameKey dtb__23)
  | _ -> "Int"
))
