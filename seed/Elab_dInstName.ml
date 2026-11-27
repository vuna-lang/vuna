open Vuna_runtime
# 39 "Vuna/Compiler/Elab/InstName.vuna"
let v_classDigest = (fun (dtb_u_u1 : string) -> (((B_dData_dString.v_substring 0) 16) (Base_dHash.v_digestHex (Base_dHash.v_digestOfString dtb_u_u1))))

# 57 "Vuna/Compiler/Elab/InstName.vuna"
let v_isAsciiAlphaNum = (fun (dtb_u_u2 : int) -> (if (if (if (dtb_u_u2 >= 65) then (dtb_u_u2 <= 90) else false) then true else (if (dtb_u_u2 >= 97) then (dtb_u_u2 <= 122) else false)) then true else (if (dtb_u_u2 >= 48) then (dtb_u_u2 <= 57) else false)))

# 50 "Vuna/Compiler/Elab/InstName.vuna"
let v_instNameChar = (fun (dtb_u_u3 : int) -> (if (if (v_isAsciiAlphaNum dtb_u_u3) then true else (dtb_u_u3 = 95)) then (B_dData_dList.C_List__x58__x58_ (dtb_u_u3, B_dData_dList.C_List_Nil)) else ((B_dData_dList.v_append (B_dData_dList.dtp_unpack "$")) ((B_dData_dList.v_append (B_dData_dList.dtp_unpack (string_of_int dtb_u_u3))) (B_dData_dList.dtp_unpack "$")))))

# 47 "Vuna/Compiler/Elab/InstName.vuna"
let v_sanitizeInstName = (fun (dtb_u_u4 : string) -> (B_dData_dList.dtp_pack ((B_dData_dList.v_concatMap v_instNameChar) (B_dData_dList.dtp_unpack dtb_u_u4))))

# 72 "Vuna/Compiler/Elab/InstName.vuna"
let rec v_argSuffix = (fun (dtb_u_u5 : Frontend_dAst.t_Expr B_dData_dList.t_List) -> (match dtb_u_u5 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u6, dtb_u_u7) -> (String.concat "" ["_"; (v_exprNameFor dtb_u_u6); (v_argSuffix dtb_u_u7)])
  | B_dData_dList.C_List_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))
# 79 "Vuna/Compiler/Elab/InstName.vuna"
and v_piName = (fun (dtb_u_u8 : Frontend_dAst.t_Expr) (dtb_u_u9 : Frontend_dAst.t_Expr) -> (String.concat "" ["Pi_"; (v_exprNameFor dtb_u_u8); "_"; (v_exprNameFor dtb_u_u9)]))
# 87 "Vuna/Compiler/Elab/InstName.vuna"
and v_exprNameFor = (fun (dtb_u_u10 : Frontend_dAst.t_Expr) -> (let dtb_u_u11 = dtb_u_u10 in (match dtb_u_u11 with
  | Frontend_dAst.C_Expr_EApp (dtb_u_u12, dtb_u_u13, dtb_u_u14) -> (match dtb_u_u12 with
  | Frontend_dAst.C_Expr_EVar (dtb_u_u15, dtb_u_u16) -> (if (dtb_u_u15 = "->") then (let dtb_u_u17 = dtb_u_u13 in (match dtb_u_u17 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u18, dtb_u_u19) -> (match dtb_u_u19 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u20, dtb_u_u21) -> ((v_piName dtb_u_u18) dtb_u_u20)
  | _ -> ("?" ^ (Base_dHash.v_digestHex (Base_dHash.v_digestOfString ((Base_dBytes.v_encTop Frontend_dCanonical_dAst.v_encExpr) dtb_u_u10))))
)
  | _ -> ("?" ^ (Base_dHash.v_digestHex (Base_dHash.v_digestOfString ((Base_dBytes.v_encTop Frontend_dCanonical_dAst.v_encExpr) dtb_u_u10))))
)) else ((v_exprNameFor (Frontend_dAst.C_Expr_EVar (dtb_u_u15, dtb_u_u16))) ^ (v_argSuffix dtb_u_u13)))
  | _ -> ((v_exprNameFor dtb_u_u12) ^ (v_argSuffix dtb_u_u13))
)
  | Frontend_dAst.C_Expr_EPi (dtb_u_u22, dtb_u_u23, dtb_u_u24, dtb_u_u25, dtb_u_u26, dtb_u_u27) -> ((v_piName dtb_u_u25) dtb_u_u26)
  | Frontend_dAst.C_Expr_EStr (dtb_u_u28, dtb_u_u29) -> dtb_u_u28
  | Frontend_dAst.C_Expr_EInt (dtb_u_u30, dtb_u_u31) -> (string_of_int dtb_u_u30)
  | Frontend_dAst.C_Expr_EVar (dtb_u_u32, dtb_u_u33) -> dtb_u_u32
  | _ -> ("?" ^ (Base_dHash.v_digestHex (Base_dHash.v_digestOfString ((Base_dBytes.v_encTop Frontend_dCanonical_dAst.v_encExpr) dtb_u_u11))))
)))

# 67 "Vuna/Compiler/Elab/InstName.vuna"
let v_argSuffixTail = (fun (dtb_u_u34 : Frontend_dAst.t_Expr B_dData_dList.t_List) -> (match dtb_u_u34 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u35, dtb_u_u36) -> ((v_exprNameFor dtb_u_u35) ^ (v_argSuffix dtb_u_u36))
  | B_dData_dList.C_List_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))

# 62 "Vuna/Compiler/Elab/InstName.vuna"
let v_derivedInstName = (fun (dtb_u_u37 : Frontend_dAst.t_Expr) -> (match dtb_u_u37 with
  | Frontend_dAst.C_Expr_EApp (dtb_u_u38, dtb_u_u39, dtb_u_u40) -> (v_argSuffixTail dtb_u_u39)
  | _ -> (v_exprNameFor dtb_u_u37)
))

# 28 "Vuna/Compiler/Elab/InstName.vuna"
let v_instanceName = (fun (dtb_u_u41 : string) (dtb_u_u42 : Frontend_dAst.t_Expr) -> (v_sanitizeInstName (String.concat "" [(Elab_dMeta.v_baseNameOf dtb_u_u41); "_"; (v_derivedInstName dtb_u_u42)])))

# 35 "Vuna/Compiler/Elab/InstName.vuna"
let v_instanceSymbol = (fun (dtb_u_u43 : string) (dtb_u_u44 : Frontend_dAst.t_Expr) -> (v_sanitizeInstName (String.concat "" [(Elab_dMeta.v_baseNameOf dtb_u_u43); "_"; (v_classDigest dtb_u_u43); "_"; (v_derivedInstName dtb_u_u44)])))
