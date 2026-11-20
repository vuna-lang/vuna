open Vuna_runtime
# 33 "Vuna/Compiler/Elab/InstName.vuna"
let v_sanitizeInstName = (fun (s : string) -> ((B_dData_dString.v_join "_") ((B_dData_dString.v_split ".") s)))

# 48 "Vuna/Compiler/Elab/InstName.vuna"
let rec v_argSuffix = (fun (mc0 : Frontend_dRast.t_Expr B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__0, dtb__1) -> (String.concat "" ["_"; (v_exprNameFor dtb__0); (v_argSuffix dtb__1)])
  | B_dData_dList.C_List_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))
# 55 "Vuna/Compiler/Elab/InstName.vuna"
and v_piName = (fun (dom : Frontend_dRast.t_Expr) (cod : Frontend_dRast.t_Expr) -> (String.concat "" ["Pi_"; (v_exprNameFor dom); "_"; (v_exprNameFor cod)]))
# 63 "Vuna/Compiler/Elab/InstName.vuna"
and v_exprNameFor = (fun (e : Frontend_dRast.t_Expr) -> (let nd_uscrut1 = e in (match nd_uscrut1 with
  | Frontend_dRast.C_Expr_EApp (dtb__2, dtb__3, dtb__4) -> (match dtb__2 with
  | Frontend_dRast.C_Expr_EVar (dtb__5, dtb__6) -> (if ((Frontend_dRast_dName.v_rnameKey dtb__5) = "->") then (let nd_uscrut7 = dtb__3 in (match nd_uscrut7 with
  | B_dData_dList.C_List__x58__x58_ (dtb__7, dtb__8) -> (match dtb__8 with
  | B_dData_dList.C_List__x58__x58_ (dtb__9, dtb__10) -> ((v_piName dtb__7) dtb__9)
  | _ -> ("?" ^ (Base_dHash.v_digestHex (Base_dHash.v_digestOfString ((Base_dBytes.v_encTop Frontend_dCanonical_dAst.v_encExpr) (Frontend_dRast_dBridge.v_toAstExpr e)))))
)
  | _ -> ("?" ^ (Base_dHash.v_digestHex (Base_dHash.v_digestOfString ((Base_dBytes.v_encTop Frontend_dCanonical_dAst.v_encExpr) (Frontend_dRast_dBridge.v_toAstExpr e)))))
)) else ((v_exprNameFor (Frontend_dRast.C_Expr_EVar (dtb__5, dtb__6))) ^ (v_argSuffix dtb__3)))
  | _ -> ((v_exprNameFor dtb__2) ^ (v_argSuffix dtb__3))
)
  | Frontend_dRast.C_Expr_EPi (dtb__11, dtb__12, dtb__13, dtb__14, dtb__15, dtb__16) -> ((v_piName dtb__14) dtb__15)
  | Frontend_dRast.C_Expr_EStr (dtb__17, dtb__18) -> dtb__17
  | Frontend_dRast.C_Expr_EInt (dtb__19, dtb__20) -> (bi_strFromInt dtb__19)
  | Frontend_dRast.C_Expr_EVar (dtb__21, dtb__22) -> (Frontend_dRast_dName.v_rnameKey dtb__21)
  | _ -> ("?" ^ (Base_dHash.v_digestHex (Base_dHash.v_digestOfString ((Base_dBytes.v_encTop Frontend_dCanonical_dAst.v_encExpr) (Frontend_dRast_dBridge.v_toAstExpr nd_uscrut1)))))
)))

# 43 "Vuna/Compiler/Elab/InstName.vuna"
let v_argSuffixTail = (fun (mc0 : Frontend_dRast.t_Expr B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__23, dtb__24) -> ((v_exprNameFor dtb__23) ^ (v_argSuffix dtb__24))
  | B_dData_dList.C_List_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))

# 38 "Vuna/Compiler/Elab/InstName.vuna"
let v_derivedInstName = (fun (mc0 : Frontend_dRast.t_Expr) -> (match mc0 with
  | Frontend_dRast.C_Expr_EApp (dtb__25, dtb__26, dtb__27) -> (v_argSuffixTail dtb__26)
  | _ -> (v_exprNameFor mc0)
))

# 27 "Vuna/Compiler/Elab/InstName.vuna"
let v_instanceName = (fun (cname : string) (headExpr : Frontend_dRast.t_Expr) -> (v_sanitizeInstName (String.concat "" [(Elab_dMeta.v_baseNameOf cname); "_"; (v_derivedInstName headExpr)])))
