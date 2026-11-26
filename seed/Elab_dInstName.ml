open Vuna_runtime
# 39 "Vuna/Compiler/Elab/InstName.vuna"
let v_classDigest = (fun (cname : string) -> (((B_dData_dString.v_substring 0) 16) (Base_dHash.v_digestHex (Base_dHash.v_digestOfString cname))))

# 57 "Vuna/Compiler/Elab/InstName.vuna"
let v_isAsciiAlphaNum = (fun (c : int) -> (if (if (if (c >= 65) then (c <= 90) else false) then true else (if (c >= 97) then (c <= 122) else false)) then true else (if (c >= 48) then (c <= 57) else false)))

# 50 "Vuna/Compiler/Elab/InstName.vuna"
let v_instNameChar = (fun (c : int) -> (if (if (v_isAsciiAlphaNum c) then true else (c = 95)) then (B_dData_dList.C_List__x58__x58_ (c, B_dData_dList.C_List_Nil)) else ((B_dData_dList.v_append (B_dData_dList.dtp_unpack "$")) ((B_dData_dList.v_append (B_dData_dList.dtp_unpack (bi_strFromInt c))) (B_dData_dList.dtp_unpack "$")))))

# 47 "Vuna/Compiler/Elab/InstName.vuna"
let v_sanitizeInstName = (fun (s : string) -> (B_dData_dList.dtp_pack ((B_dData_dList.v_concatMap v_instNameChar) (B_dData_dList.dtp_unpack s))))

# 72 "Vuna/Compiler/Elab/InstName.vuna"
let rec v_argSuffix = (fun (mc0 : Frontend_dAst.t_Expr B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__0, dtb__1) -> (String.concat "" ["_"; (v_exprNameFor dtb__0); (v_argSuffix dtb__1)])
  | B_dData_dList.C_List_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))
# 79 "Vuna/Compiler/Elab/InstName.vuna"
and v_piName = (fun (dom : Frontend_dAst.t_Expr) (cod : Frontend_dAst.t_Expr) -> (String.concat "" ["Pi_"; (v_exprNameFor dom); "_"; (v_exprNameFor cod)]))
# 87 "Vuna/Compiler/Elab/InstName.vuna"
and v_exprNameFor = (fun (e : Frontend_dAst.t_Expr) -> (let nd_uscrut1 = e in (match nd_uscrut1 with
  | Frontend_dAst.C_Expr_EApp (dtb__2, dtb__3, dtb__4) -> (match dtb__2 with
  | Frontend_dAst.C_Expr_EVar (dtb__5, dtb__6) -> (if (dtb__5 = "->") then (let nd_uscrut7 = dtb__3 in (match nd_uscrut7 with
  | B_dData_dList.C_List__x58__x58_ (dtb__7, dtb__8) -> (match dtb__8 with
  | B_dData_dList.C_List__x58__x58_ (dtb__9, dtb__10) -> ((v_piName dtb__7) dtb__9)
  | _ -> ("?" ^ (Base_dHash.v_digestHex (Base_dHash.v_digestOfString ((Base_dBytes.v_encTop Frontend_dCanonical_dAst.v_encExpr) e))))
)
  | _ -> ("?" ^ (Base_dHash.v_digestHex (Base_dHash.v_digestOfString ((Base_dBytes.v_encTop Frontend_dCanonical_dAst.v_encExpr) e))))
)) else ((v_exprNameFor (Frontend_dAst.C_Expr_EVar (dtb__5, dtb__6))) ^ (v_argSuffix dtb__3)))
  | _ -> ((v_exprNameFor dtb__2) ^ (v_argSuffix dtb__3))
)
  | Frontend_dAst.C_Expr_EPi (dtb__11, dtb__12, dtb__13, dtb__14, dtb__15, dtb__16) -> ((v_piName dtb__14) dtb__15)
  | Frontend_dAst.C_Expr_EStr (dtb__17, dtb__18) -> dtb__17
  | Frontend_dAst.C_Expr_EInt (dtb__19, dtb__20) -> (bi_strFromInt dtb__19)
  | Frontend_dAst.C_Expr_EVar (dtb__21, dtb__22) -> dtb__21
  | _ -> ("?" ^ (Base_dHash.v_digestHex (Base_dHash.v_digestOfString ((Base_dBytes.v_encTop Frontend_dCanonical_dAst.v_encExpr) nd_uscrut1))))
)))

# 67 "Vuna/Compiler/Elab/InstName.vuna"
let v_argSuffixTail = (fun (mc0 : Frontend_dAst.t_Expr B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__23, dtb__24) -> ((v_exprNameFor dtb__23) ^ (v_argSuffix dtb__24))
  | B_dData_dList.C_List_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))

# 62 "Vuna/Compiler/Elab/InstName.vuna"
let v_derivedInstName = (fun (mc0 : Frontend_dAst.t_Expr) -> (match mc0 with
  | Frontend_dAst.C_Expr_EApp (dtb__25, dtb__26, dtb__27) -> (v_argSuffixTail dtb__26)
  | _ -> (v_exprNameFor mc0)
))

# 28 "Vuna/Compiler/Elab/InstName.vuna"
let v_instanceName = (fun (cname : string) (headExpr : Frontend_dAst.t_Expr) -> (v_sanitizeInstName (String.concat "" [(Elab_dMeta.v_baseNameOf cname); "_"; (v_derivedInstName headExpr)])))

# 35 "Vuna/Compiler/Elab/InstName.vuna"
let v_instanceSymbol = (fun (cname : string) (headExpr : Frontend_dAst.t_Expr) -> (v_sanitizeInstName (String.concat "" [(Elab_dMeta.v_baseNameOf cname); "_"; (v_classDigest cname); "_"; (v_derivedInstName headExpr)])))
