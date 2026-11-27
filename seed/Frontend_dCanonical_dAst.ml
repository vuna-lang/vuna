open Vuna_runtime
# 46 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
let v_noSpan = { Base_dSource.f_Span_spanFile = ""; Base_dSource.f_Span_spanStartLine = 0; Base_dSource.f_Span_spanStartCol = 0; Base_dSource.f_Span_spanEndLine = 0; Base_dSource.f_Span_spanEndCol = 0; Base_dSource.f_Span_spanStartOffset = 0; Base_dSource.f_Span_spanEndOffset = 0 }

# 53 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
let v_encQty = (fun (dtb_u_u1 : Frontend_dAst.t_Qty) (dtb_u_u2 : string B_dData_dList.t_List) -> (match dtb_u_u1 with
  | Frontend_dAst.C_Qty_Q1 -> ((Base_dBytes.v_encTag 1) dtb_u_u2)
  | Frontend_dAst.C_Qty_Q0 -> ((Base_dBytes.v_encTag 0) dtb_u_u2)
  | _ -> failwith "DT: impossible branch"
))

# 58 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
let v_encReprTier = (fun (dtb_u_u3 : Frontend_dAst.t_ReprTier) (dtb_u_u4 : string B_dData_dList.t_List) -> (match dtb_u_u3 with
  | Frontend_dAst.C_ReprTier_ReprBoxed -> ((Base_dBytes.v_encTag 2) dtb_u_u4)
  | Frontend_dAst.C_ReprTier_ReprAlias -> ((Base_dBytes.v_encTag 1) dtb_u_u4)
  | Frontend_dAst.C_ReprTier_ReprAuto -> ((Base_dBytes.v_encTag 0) dtb_u_u4)
  | _ -> failwith "DT: impossible branch"
))

# 64 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
let v_encMaybeQty = (fun (dtb_u_u5 : Frontend_dAst.t_Qty B_dData_dMaybe.t_Maybe) (dtb_u_u6 : string B_dData_dList.t_List) -> (match dtb_u_u5 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u7) -> (B_dData_dList.C_List__x58__x58_ ("1", ((v_encQty dtb_u_u7) dtb_u_u6)))
  | B_dData_dMaybe.C_Maybe_Nothing -> (B_dData_dList.C_List__x58__x58_ ("0", dtb_u_u6))
  | _ -> failwith "DT: impossible branch"
))

# 83 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
let rec v_encStrListGo = (fun (dtb_u_u8 : string B_dData_dList.t_List) (dtb_u_u9 : string B_dData_dList.t_List) -> (match dtb_u_u8 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u10, dtb_u_u11) -> ((Base_dBytes.v_encStr dtb_u_u10) ((v_encStrListGo dtb_u_u11) dtb_u_u9))
  | B_dData_dList.C_List_Nil -> dtb_u_u9
  | _ -> failwith "DT: impossible branch"
))

# 79 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
let v_encStrList = (fun (dtb_u_u12 : string B_dData_dList.t_List) (dtb_u_u13 : string B_dData_dList.t_List) -> (B_dData_dList.C_List__x58__x58_ ((String.concat "" ["["; (string_of_int (Base_dBytes.v_lenOf dtb_u_u12)); ":"]), ((v_encStrListGo dtb_u_u12) dtb_u_u13))))

# 97 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
let rec v_encPatList = (fun (dtb_u_u14 : Frontend_dAst.t_Pat B_dData_dList.t_List) (dtb_u_u15 : string B_dData_dList.t_List) -> (B_dData_dList.C_List__x58__x58_ ((String.concat "" ["["; (string_of_int (Base_dBytes.v_lenOf dtb_u_u14)); ":"]), ((v_encPatListGo dtb_u_u14) dtb_u_u15))))
# 101 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
and v_encPatListGo = (fun (dtb_u_u16 : Frontend_dAst.t_Pat B_dData_dList.t_List) (dtb_u_u17 : string B_dData_dList.t_List) -> (match dtb_u_u16 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u18, dtb_u_u19) -> ((v_encPat dtb_u_u18) ((v_encPatListGo dtb_u_u19) dtb_u_u17))
  | B_dData_dList.C_List_Nil -> dtb_u_u17
  | _ -> failwith "DT: impossible branch"
))
# 173 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
and v_encStrPatList = (fun (dtb_u_u20 : (string, Frontend_dAst.t_Pat) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u21 : string B_dData_dList.t_List) -> (B_dData_dList.C_List__x58__x58_ ((String.concat "" ["["; (string_of_int (Base_dBytes.v_lenOf dtb_u_u20)); ":"]), ((v_encStrPatListGo dtb_u_u20) dtb_u_u21))))
# 177 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
and v_encStrPatListGo = (fun (dtb_u_u22 : (string, Frontend_dAst.t_Pat) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u23 : string B_dData_dList.t_List) -> (match dtb_u_u22 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u24, dtb_u_u25) -> (match dtb_u_u24 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u26; B_dData_dPair.f_Pair_second = dtb_u_u27 } -> ((Base_dBytes.v_encStr dtb_u_u26) ((v_encPat dtb_u_u27) ((v_encStrPatListGo dtb_u_u25) dtb_u_u23)))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> dtb_u_u23
  | _ -> failwith "DT: impossible branch"
))
# 232 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
and v_encPat = (fun (dtb_u_u28 : Frontend_dAst.t_Pat) (dtb_u_u29 : string B_dData_dList.t_List) -> (match dtb_u_u28 with
  | Frontend_dAst.C_Pat_PRecord (dtb_u_u30, dtb_u_u31, dtb_u_u32) -> ((Base_dBytes.v_encTag 6) ((Base_dBytes.v_encStr dtb_u_u30) ((v_encStrPatList dtb_u_u31) dtb_u_u29)))
  | Frontend_dAst.C_Pat_PStr (dtb_u_u33, dtb_u_u34) -> ((Base_dBytes.v_encTag 5) ((Base_dBytes.v_encStr dtb_u_u33) dtb_u_u29))
  | Frontend_dAst.C_Pat_PInt (dtb_u_u35, dtb_u_u36) -> ((Base_dBytes.v_encTag 4) ((Base_dBytes.v_encInt dtb_u_u35) dtb_u_u29))
  | Frontend_dAst.C_Pat_PCon (dtb_u_u37, dtb_u_u38, dtb_u_u39) -> ((Base_dBytes.v_encTag 3) ((Base_dBytes.v_encStr dtb_u_u37) ((v_encPatList dtb_u_u38) dtb_u_u29)))
  | Frontend_dAst.C_Pat_PWild (dtb_u_u40) -> ((Base_dBytes.v_encTag 2) dtb_u_u29)
  | Frontend_dAst.C_Pat_PAs (dtb_u_u41, dtb_u_u42, dtb_u_u43) -> ((Base_dBytes.v_encTag 1) ((Base_dBytes.v_encStr dtb_u_u41) ((v_encPat dtb_u_u42) dtb_u_u29)))
  | Frontend_dAst.C_Pat_PVar (dtb_u_u44, dtb_u_u45) -> ((Base_dBytes.v_encTag 0) ((Base_dBytes.v_encStr dtb_u_u44) dtb_u_u29))
  | _ -> failwith "DT: impossible branch"
))

# 88 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
let rec v_encExprList = (fun (dtb_u_u46 : Frontend_dAst.t_Expr B_dData_dList.t_List) (dtb_u_u47 : string B_dData_dList.t_List) -> (B_dData_dList.C_List__x58__x58_ ((String.concat "" ["["; (string_of_int (Base_dBytes.v_lenOf dtb_u_u46)); ":"]), ((v_encExprListGo dtb_u_u46) dtb_u_u47))))
# 92 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
and v_encExprListGo = (fun (dtb_u_u48 : Frontend_dAst.t_Expr B_dData_dList.t_List) (dtb_u_u49 : string B_dData_dList.t_List) -> (match dtb_u_u48 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u50, dtb_u_u51) -> ((v_encExpr dtb_u_u50) ((v_encExprListGo dtb_u_u51) dtb_u_u49))
  | B_dData_dList.C_List_Nil -> dtb_u_u49
  | _ -> failwith "DT: impossible branch"
))
# 106 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
and v_encPatExprList = (fun (dtb_u_u52 : Frontend_dAst.t_Binding B_dData_dList.t_List) (dtb_u_u53 : string B_dData_dList.t_List) -> (B_dData_dList.C_List__x58__x58_ ((String.concat "" ["["; (string_of_int (Base_dBytes.v_lenOf dtb_u_u52)); ":"]), ((v_encPatExprListGo dtb_u_u52) dtb_u_u53))))
# 110 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
and v_encPatExprListGo = (fun (dtb_u_u54 : Frontend_dAst.t_Binding B_dData_dList.t_List) (dtb_u_u55 : string B_dData_dList.t_List) -> (match dtb_u_u54 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u56, dtb_u_u57) -> ((v_encPat (dtb_u_u56).Frontend_dAst.f_Binding_bindPat) ((v_encBindingSig dtb_u_u56) ((v_encBindingValue (dtb_u_u56).Frontend_dAst.f_Binding_bindValue) ((v_encPatExprListGo dtb_u_u57) dtb_u_u55))))
  | B_dData_dList.C_List_Nil -> dtb_u_u55
  | _ -> failwith "DT: impossible branch"
))
# 116 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
and v_encBindingSig = (fun (dtb_u_u58 : Frontend_dAst.t_Binding) (dtb_u_u59 : string B_dData_dList.t_List) -> (match (dtb_u_u58).Frontend_dAst.f_Binding_bindSig with
  | B_dData_dMaybe.C_Maybe_Nothing -> ((Base_dBytes.v_encTag 0) dtb_u_u59)
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u60) -> ((Base_dBytes.v_encTag 1) ((v_encExpr (dtb_u_u60).Frontend_dAst.f_BindingSig_sigType) dtb_u_u59))
  | _ -> failwith "DT: impossible branch"
))
# 123 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
and v_encBindingValue = (fun (dtb_u_u61 : Frontend_dAst.t_BindingValue) (dtb_u_u62 : string B_dData_dList.t_List) -> (match dtb_u_u61 with
  | Frontend_dAst.C_BindingValue_BClauses (dtb_u_u63) -> ((Base_dBytes.v_encTag 1) ((v_encClauses dtb_u_u63) dtb_u_u62))
  | Frontend_dAst.C_BindingValue_BVal (dtb_u_u64) -> ((Base_dBytes.v_encTag 0) ((v_encExpr dtb_u_u64) dtb_u_u62))
  | _ -> failwith "DT: impossible branch"
))
# 128 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
and v_encAltList = (fun (dtb_u_u65 : Frontend_dAst.t_Alt B_dData_dList.t_List) (dtb_u_u66 : string B_dData_dList.t_List) -> (B_dData_dList.C_List__x58__x58_ ((String.concat "" ["["; (string_of_int (Base_dBytes.v_lenOf dtb_u_u65)); ":"]), ((v_encAltListGo dtb_u_u65) dtb_u_u66))))
# 131 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
and v_encAltListGo = (fun (dtb_u_u67 : Frontend_dAst.t_Alt B_dData_dList.t_List) (dtb_u_u68 : string B_dData_dList.t_List) -> (match dtb_u_u67 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u69, dtb_u_u70) -> ((v_encPat (dtb_u_u69).Frontend_dAst.f_Alt_altPat) ((v_encExpr (dtb_u_u69).Frontend_dAst.f_Alt_altBody) ((v_encAltListGo dtb_u_u70) dtb_u_u68)))
  | B_dData_dList.C_List_Nil -> dtb_u_u68
  | _ -> failwith "DT: impossible branch"
))
# 136 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
and v_encClauses = (fun (dtb_u_u71 : Frontend_dAst.t_LocalClause B_dData_dList.t_List) (dtb_u_u72 : string B_dData_dList.t_List) -> (B_dData_dList.C_List__x58__x58_ ((String.concat "" ["["; (string_of_int (Base_dBytes.v_lenOf dtb_u_u71)); ":"]), ((v_encClausesGo dtb_u_u71) dtb_u_u72))))
# 140 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
and v_encClausesGo = (fun (dtb_u_u73 : Frontend_dAst.t_LocalClause B_dData_dList.t_List) (dtb_u_u74 : string B_dData_dList.t_List) -> (match dtb_u_u73 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u75, dtb_u_u76) -> ((v_encPatList (dtb_u_u75).Frontend_dAst.f_LocalClause_lcPats) ((v_encExpr (dtb_u_u75).Frontend_dAst.f_LocalClause_lcBody) ((v_encClausesGo dtb_u_u76) dtb_u_u74)))
  | B_dData_dList.C_List_Nil -> dtb_u_u74
  | _ -> failwith "DT: impossible branch"
))
# 146 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
and v_encStmtList = (fun (dtb_u_u77 : Frontend_dAst.t_DoStmt B_dData_dList.t_List) (dtb_u_u78 : string B_dData_dList.t_List) -> (B_dData_dList.C_List__x58__x58_ ((String.concat "" ["["; (string_of_int (Base_dBytes.v_lenOf dtb_u_u77)); ":"]), ((v_encStmtListGo dtb_u_u77) dtb_u_u78))))
# 150 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
and v_encStmtListGo = (fun (dtb_u_u79 : Frontend_dAst.t_DoStmt B_dData_dList.t_List) (dtb_u_u80 : string B_dData_dList.t_List) -> (match dtb_u_u79 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u81, dtb_u_u82) -> ((v_encDoStmt dtb_u_u81) ((v_encStmtListGo dtb_u_u82) dtb_u_u80))
  | B_dData_dList.C_List_Nil -> dtb_u_u80
  | _ -> failwith "DT: impossible branch"
))
# 155 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
and v_encPartList = (fun (dtb_u_u83 : Frontend_dAst.t_InterpPart B_dData_dList.t_List) (dtb_u_u84 : string B_dData_dList.t_List) -> (B_dData_dList.C_List__x58__x58_ ((String.concat "" ["["; (string_of_int (Base_dBytes.v_lenOf dtb_u_u83)); ":"]), ((v_encPartListGo dtb_u_u83) dtb_u_u84))))
# 159 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
and v_encPartListGo = (fun (dtb_u_u85 : Frontend_dAst.t_InterpPart B_dData_dList.t_List) (dtb_u_u86 : string B_dData_dList.t_List) -> (match dtb_u_u85 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u87, dtb_u_u88) -> ((v_encInterpPart dtb_u_u87) ((v_encPartListGo dtb_u_u88) dtb_u_u86))
  | B_dData_dList.C_List_Nil -> dtb_u_u86
  | _ -> failwith "DT: impossible branch"
))
# 164 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
and v_encStrExprList = (fun (dtb_u_u89 : (string, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u90 : string B_dData_dList.t_List) -> (B_dData_dList.C_List__x58__x58_ ((String.concat "" ["["; (string_of_int (Base_dBytes.v_lenOf dtb_u_u89)); ":"]), ((v_encStrExprListGo dtb_u_u89) dtb_u_u90))))
# 168 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
and v_encStrExprListGo = (fun (dtb_u_u91 : (string, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u92 : string B_dData_dList.t_List) -> (match dtb_u_u91 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u93, dtb_u_u94) -> (match dtb_u_u93 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u95; B_dData_dPair.f_Pair_second = dtb_u_u96 } -> ((Base_dBytes.v_encStr dtb_u_u95) ((v_encExpr dtb_u_u96) ((v_encStrExprListGo dtb_u_u94) dtb_u_u92)))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> dtb_u_u92
  | _ -> failwith "DT: impossible branch"
))
# 227 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
and v_encInterpPart = (fun (dtb_u_u97 : Frontend_dAst.t_InterpPart) (dtb_u_u98 : string B_dData_dList.t_List) -> (match dtb_u_u97 with
  | Frontend_dAst.C_InterpPart_IPHole (dtb_u_u99) -> ((Base_dBytes.v_encTag 1) ((v_encExpr dtb_u_u99) dtb_u_u98))
  | Frontend_dAst.C_InterpPart_IPText (dtb_u_u100) -> ((Base_dBytes.v_encTag 0) ((Base_dBytes.v_encStr dtb_u_u100) dtb_u_u98))
  | _ -> failwith "DT: impossible branch"
))
# 242 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
and v_encDoStmt = (fun (dtb_u_u101 : Frontend_dAst.t_DoStmt) (dtb_u_u102 : string B_dData_dList.t_List) -> (match dtb_u_u101 with
  | Frontend_dAst.C_DoStmt_DLet (dtb_u_u103, dtb_u_u104) -> ((Base_dBytes.v_encTag 2) ((v_encPatExprList dtb_u_u103) dtb_u_u102))
  | Frontend_dAst.C_DoStmt_DExpr (dtb_u_u105, dtb_u_u106) -> ((Base_dBytes.v_encTag 1) ((v_encExpr dtb_u_u105) dtb_u_u102))
  | Frontend_dAst.C_DoStmt_DBind (dtb_u_u107, dtb_u_u108, dtb_u_u109) -> ((Base_dBytes.v_encTag 0) ((v_encPat dtb_u_u107) ((v_encExpr dtb_u_u108) dtb_u_u102)))
  | _ -> failwith "DT: impossible branch"
))
# 248 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
and v_encExpr = (fun (dtb_u_u110 : Frontend_dAst.t_Expr) (dtb_u_u111 : string B_dData_dList.t_List) -> (match dtb_u_u110 with
  | Frontend_dAst.C_Expr_EFloat (dtb_u_u112, dtb_u_u113) -> ((Base_dBytes.v_encTag 14) ((Base_dBytes.v_encStr dtb_u_u112) dtb_u_u111))
  | Frontend_dAst.C_Expr_EInterp (dtb_u_u114, dtb_u_u115) -> ((Base_dBytes.v_encTag 13) ((v_encPartList dtb_u_u114) dtb_u_u111))
  | Frontend_dAst.C_Expr_EDo (dtb_u_u116, dtb_u_u117) -> ((Base_dBytes.v_encTag 12) ((v_encStmtList dtb_u_u116) dtb_u_u111))
  | Frontend_dAst.C_Expr_ERecUpdate (dtb_u_u118, dtb_u_u119, dtb_u_u120) -> ((Base_dBytes.v_encTag 11) ((v_encExpr dtb_u_u118) ((v_encStrExprList dtb_u_u119) dtb_u_u111)))
  | Frontend_dAst.C_Expr_ERecord (dtb_u_u121, dtb_u_u122, dtb_u_u123) -> ((Base_dBytes.v_encTag 10) ((Base_dBytes.v_encStr dtb_u_u121) ((v_encStrExprList dtb_u_u122) dtb_u_u111)))
  | Frontend_dAst.C_Expr_EField (dtb_u_u124, dtb_u_u125, dtb_u_u126) -> ((Base_dBytes.v_encTag 9) ((v_encExpr dtb_u_u124) ((Base_dBytes.v_encStr dtb_u_u125) dtb_u_u111)))
  | Frontend_dAst.C_Expr_EIf (dtb_u_u127, dtb_u_u128, dtb_u_u129, dtb_u_u130) -> ((Base_dBytes.v_encTag 8) ((v_encExpr dtb_u_u127) ((v_encExpr dtb_u_u128) ((v_encExpr dtb_u_u129) dtb_u_u111))))
  | Frontend_dAst.C_Expr_ECase (dtb_u_u131, dtb_u_u132, dtb_u_u133) -> ((Base_dBytes.v_encTag 7) ((v_encExpr dtb_u_u131) ((v_encAltList dtb_u_u132) dtb_u_u111)))
  | Frontend_dAst.C_Expr_ELet (dtb_u_u134, dtb_u_u135, dtb_u_u136, dtb_u_u137) -> ((Base_dBytes.v_encTag 6) ((v_encPatExprList dtb_u_u134) ((v_encExpr dtb_u_u135) ((Base_dBytes.v_encBool dtb_u_u136) dtb_u_u111))))
  | Frontend_dAst.C_Expr_EPi (dtb_u_u138, dtb_u_u139, dtb_u_u140, dtb_u_u141, dtb_u_u142, dtb_u_u143) -> ((Base_dBytes.v_encTag 5) ((Base_dBytes.v_encStr dtb_u_u138) ((Base_dBytes.v_encBool dtb_u_u139) ((v_encMaybeQty dtb_u_u140) ((v_encExpr dtb_u_u141) ((v_encExpr dtb_u_u142) dtb_u_u111))))))
  | Frontend_dAst.C_Expr_EApp (dtb_u_u144, dtb_u_u145, dtb_u_u146) -> ((Base_dBytes.v_encTag 4) ((v_encExpr dtb_u_u144) ((v_encExprList dtb_u_u145) dtb_u_u111)))
  | Frontend_dAst.C_Expr_ELam (dtb_u_u147, dtb_u_u148, dtb_u_u149) -> ((Base_dBytes.v_encTag 3) ((v_encStrList ((B_dData_dList.v_map B_dData_dPair.v_firstOf) dtb_u_u147)) ((v_encExpr dtb_u_u148) dtb_u_u111)))
  | Frontend_dAst.C_Expr_EStr (dtb_u_u150, dtb_u_u151) -> ((Base_dBytes.v_encTag 2) ((Base_dBytes.v_encStr dtb_u_u150) dtb_u_u111))
  | Frontend_dAst.C_Expr_EInt (dtb_u_u152, dtb_u_u153) -> ((Base_dBytes.v_encTag 1) ((Base_dBytes.v_encInt dtb_u_u152) dtb_u_u111))
  | Frontend_dAst.C_Expr_EVar (dtb_u_u154, dtb_u_u155) -> ((Base_dBytes.v_encTag 0) ((Base_dBytes.v_encStr dtb_u_u154) dtb_u_u111))
  | _ -> failwith "DT: impossible branch"
))

# 69 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
let v_encMaybeExpr = (fun (dtb_u_u156 : Frontend_dAst.t_Expr B_dData_dMaybe.t_Maybe) (dtb_u_u157 : string B_dData_dList.t_List) -> (match dtb_u_u156 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u158) -> (B_dData_dList.C_List__x58__x58_ ("1", ((v_encExpr dtb_u_u158) dtb_u_u157)))
  | B_dData_dMaybe.C_Maybe_Nothing -> (B_dData_dList.C_List__x58__x58_ ("0", dtb_u_u157))
  | _ -> failwith "DT: impossible branch"
))

# 268 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
let v_encCtor = (fun (dtb_u_u159 : Frontend_dAst.t_Ctor) (dtb_u_u160 : string B_dData_dList.t_List) -> (match dtb_u_u159 with
  | { Frontend_dAst.f_Ctor_ctorName = dtb_u_u161; Frontend_dAst.f_Ctor_ctorType = dtb_u_u162; Frontend_dAst.f_Ctor_ctorArity = dtb_u_u163; Frontend_dAst.f_Ctor_ctorRef = dtb_u_u164 } -> ((Base_dBytes.v_encTag 0) ((Base_dBytes.v_encStr dtb_u_u161) ((v_encExpr dtb_u_u162) ((Base_dBytes.v_encInt dtb_u_u163) dtb_u_u160))))
  | _ -> failwith "DT: impossible branch"
))

# 186 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
let rec v_encCtorListGo = (fun (dtb_u_u165 : Frontend_dAst.t_Ctor B_dData_dList.t_List) (dtb_u_u166 : string B_dData_dList.t_List) -> (match dtb_u_u165 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u167, dtb_u_u168) -> ((v_encCtor dtb_u_u167) ((v_encCtorListGo dtb_u_u168) dtb_u_u166))
  | B_dData_dList.C_List_Nil -> dtb_u_u166
  | _ -> failwith "DT: impossible branch"
))

# 182 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
let v_encCtorList = (fun (dtb_u_u169 : Frontend_dAst.t_Ctor B_dData_dList.t_List) (dtb_u_u170 : string B_dData_dList.t_List) -> (B_dData_dList.C_List__x58__x58_ ((String.concat "" ["["; (string_of_int (Base_dBytes.v_lenOf dtb_u_u169)); ":"]), ((v_encCtorListGo dtb_u_u169) dtb_u_u170))))

# 272 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
let v_encField = (fun (dtb_u_u171 : Frontend_dAst.t_Field) (dtb_u_u172 : string B_dData_dList.t_List) -> (match dtb_u_u171 with
  | { Frontend_dAst.f_Field_fieldName = dtb_u_u173; Frontend_dAst.f_Field_fieldType = dtb_u_u174; Frontend_dAst.f_Field_fieldRef = dtb_u_u175 } -> ((Base_dBytes.v_encTag 0) ((Base_dBytes.v_encStr dtb_u_u173) ((v_encExpr dtb_u_u174) dtb_u_u172)))
  | _ -> failwith "DT: impossible branch"
))

# 195 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
let rec v_encFieldListGo = (fun (dtb_u_u176 : Frontend_dAst.t_Field B_dData_dList.t_List) (dtb_u_u177 : string B_dData_dList.t_List) -> (match dtb_u_u176 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u178, dtb_u_u179) -> ((v_encField dtb_u_u178) ((v_encFieldListGo dtb_u_u179) dtb_u_u177))
  | B_dData_dList.C_List_Nil -> dtb_u_u177
  | _ -> failwith "DT: impossible branch"
))

# 191 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
let v_encFieldList = (fun (dtb_u_u180 : Frontend_dAst.t_Field B_dData_dList.t_List) (dtb_u_u181 : string B_dData_dList.t_List) -> (B_dData_dList.C_List__x58__x58_ ((String.concat "" ["["; (string_of_int (Base_dBytes.v_lenOf dtb_u_u180)); ":"]), ((v_encFieldListGo dtb_u_u180) dtb_u_u181))))

# 276 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
let v_encTraitParam = (fun (dtb_u_u182 : Frontend_dAst.t_TraitParam) (dtb_u_u183 : string B_dData_dList.t_List) -> (match dtb_u_u182 with
  | { Frontend_dAst.f_TraitParam_traitParamName = dtb_u_u184; Frontend_dAst.f_TraitParam_traitParamKind = dtb_u_u185 } -> ((Base_dBytes.v_encTag 0) ((Base_dBytes.v_encStr dtb_u_u184) ((v_encMaybeExpr dtb_u_u185) dtb_u_u183)))
  | _ -> failwith "DT: impossible branch"
))

# 204 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
let rec v_encTraitParamListGo = (fun (dtb_u_u186 : Frontend_dAst.t_TraitParam B_dData_dList.t_List) (dtb_u_u187 : string B_dData_dList.t_List) -> (match dtb_u_u186 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u188, dtb_u_u189) -> ((v_encTraitParam dtb_u_u188) ((v_encTraitParamListGo dtb_u_u189) dtb_u_u187))
  | B_dData_dList.C_List_Nil -> dtb_u_u187
  | _ -> failwith "DT: impossible branch"
))

# 200 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
let v_encTraitParamList = (fun (dtb_u_u190 : Frontend_dAst.t_TraitParam B_dData_dList.t_List) (dtb_u_u191 : string B_dData_dList.t_List) -> (B_dData_dList.C_List__x58__x58_ ((String.concat "" ["["; (string_of_int (Base_dBytes.v_lenOf dtb_u_u190)); ":"]), ((v_encTraitParamListGo dtb_u_u190) dtb_u_u191))))

# 280 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
let v_encTraitMethod = (fun (dtb_u_u192 : Frontend_dAst.t_TraitMethod) (dtb_u_u193 : string B_dData_dList.t_List) -> (match dtb_u_u192 with
  | { Frontend_dAst.f_TraitMethod_traitMethodName = dtb_u_u194; Frontend_dAst.f_TraitMethod_traitMethodType = dtb_u_u195; Frontend_dAst.f_TraitMethod_traitMethodRef = dtb_u_u196 } -> ((Base_dBytes.v_encTag 0) ((Base_dBytes.v_encStr dtb_u_u194) ((v_encExpr dtb_u_u195) dtb_u_u193)))
  | _ -> failwith "DT: impossible branch"
))

# 213 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
let rec v_encTraitMethodListGo = (fun (dtb_u_u197 : Frontend_dAst.t_TraitMethod B_dData_dList.t_List) (dtb_u_u198 : string B_dData_dList.t_List) -> (match dtb_u_u197 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u199, dtb_u_u200) -> ((v_encTraitMethod dtb_u_u199) ((v_encTraitMethodListGo dtb_u_u200) dtb_u_u198))
  | B_dData_dList.C_List_Nil -> dtb_u_u198
  | _ -> failwith "DT: impossible branch"
))

# 209 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
let v_encTraitMethodList = (fun (dtb_u_u201 : Frontend_dAst.t_TraitMethod B_dData_dList.t_List) (dtb_u_u202 : string B_dData_dList.t_List) -> (B_dData_dList.C_List__x58__x58_ ((String.concat "" ["["; (string_of_int (Base_dBytes.v_lenOf dtb_u_u201)); ":"]), ((v_encTraitMethodListGo dtb_u_u201) dtb_u_u202))))

# 218 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
let rec v_encDecls = (fun (dtb_u_u203 : Frontend_dAst.t_Decl B_dData_dList.t_List) (dtb_u_u204 : string B_dData_dList.t_List) -> (B_dData_dList.C_List__x58__x58_ ((String.concat "" ["["; (string_of_int (Base_dBytes.v_lenOf dtb_u_u203)); ":"]), ((v_encDeclsGo dtb_u_u203) dtb_u_u204))))
# 222 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
and v_encDeclsGo = (fun (dtb_u_u205 : Frontend_dAst.t_Decl B_dData_dList.t_List) (dtb_u_u206 : string B_dData_dList.t_List) -> (match dtb_u_u205 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u207, dtb_u_u208) -> ((v_encDecl dtb_u_u207) ((v_encDeclsGo dtb_u_u208) dtb_u_u206))
  | B_dData_dList.C_List_Nil -> dtb_u_u206
  | _ -> failwith "DT: impossible branch"
))
# 284 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
and v_encDecl = (fun (dtb_u_u209 : Frontend_dAst.t_Decl) (dtb_u_u210 : string B_dData_dList.t_List) -> (match dtb_u_u209 with
  | Frontend_dAst.C_Decl_DInstance (dtb_u_u211, dtb_u_u212, dtb_u_u213, dtb_u_u214) -> ((Base_dBytes.v_encTag 7) ((v_encExprList dtb_u_u211) ((v_encExpr dtb_u_u212) ((v_encDecls dtb_u_u213) dtb_u_u210))))
  | Frontend_dAst.C_Decl_DTrait (dtb_u_u215, dtb_u_u216, dtb_u_u217, dtb_u_u218, dtb_u_u219) -> ((Base_dBytes.v_encTag 6) ((Base_dBytes.v_encStr dtb_u_u215) ((v_encTraitParamList dtb_u_u216) ((v_encExprList dtb_u_u217) ((v_encTraitMethodList dtb_u_u218) dtb_u_u210)))))
  | Frontend_dAst.C_Decl_DRecord (dtb_u_u220, dtb_u_u221, dtb_u_u222, dtb_u_u223, dtb_u_u224, dtb_u_u225, dtb_u_u226, dtb_u_u227) -> ((Base_dBytes.v_encTag 5) ((Base_dBytes.v_encStr dtb_u_u220) ((v_encStrList dtb_u_u221) ((v_encFieldList dtb_u_u222) ((v_encStrList dtb_u_u223) ((Base_dBytes.v_encBool dtb_u_u224) ((v_encReprTier dtb_u_u225) ((Base_dBytes.v_encBool dtb_u_u226) dtb_u_u210))))))))
  | Frontend_dAst.C_Decl_DFun (dtb_u_u228, dtb_u_u229, dtb_u_u230, dtb_u_u231) -> ((Base_dBytes.v_encTag 4) ((Base_dBytes.v_encStr dtb_u_u228) ((v_encPatList dtb_u_u229) ((v_encExpr dtb_u_u230) dtb_u_u210))))
  | Frontend_dAst.C_Decl_DSig (dtb_u_u232, dtb_u_u233, dtb_u_u234, dtb_u_u235) -> ((Base_dBytes.v_encTag 3) ((Base_dBytes.v_encStr dtb_u_u232) ((v_encExprList dtb_u_u233) ((v_encExpr dtb_u_u234) dtb_u_u210))))
  | Frontend_dAst.C_Decl_DExtern (dtb_u_u236, dtb_u_u237, dtb_u_u238, dtb_u_u239) -> ((Base_dBytes.v_encTag 2) ((Base_dBytes.v_encStr dtb_u_u236) ((Base_dBytes.v_encStr dtb_u_u237) ((v_encExpr dtb_u_u238) dtb_u_u210))))
  | Frontend_dAst.C_Decl_DAxiom (dtb_u_u240, dtb_u_u241, dtb_u_u242) -> ((Base_dBytes.v_encTag 1) ((Base_dBytes.v_encStr dtb_u_u240) ((v_encExpr dtb_u_u241) dtb_u_u210)))
  | Frontend_dAst.C_Decl_DData (dtb_u_u243, dtb_u_u244, dtb_u_u245, dtb_u_u246, dtb_u_u247, dtb_u_u248, dtb_u_u249, dtb_u_u250, dtb_u_u251) -> ((Base_dBytes.v_encTag 0) ((Base_dBytes.v_encStr dtb_u_u243) ((v_encStrList dtb_u_u244) ((v_encExpr dtb_u_u245) ((v_encCtorList dtb_u_u246) ((v_encStrList dtb_u_u247) ((Base_dBytes.v_encBool dtb_u_u248) ((v_encReprTier dtb_u_u249) ((Base_dBytes.v_encBool dtb_u_u250) dtb_u_u210)))))))))
  | _ -> failwith "DT: impossible branch"
))

# 308 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
let v_decQty = (fun (dtb_u_u252 : int) (dtb_u_u253 : Base_dBytes.t_Cur) -> (if (dtb_u_u252 <= 0) then B_dData_dMaybe.C_Maybe_Nothing else (let dtb_u_u254 = ((Base_dBytes.v_decTag dtb_u_u252) dtb_u_u253) in (match dtb_u_u254 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u255) -> (match dtb_u_u255 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u256; B_dData_dPair.f_Pair_second = dtb_u_u257 } -> (if (dtb_u_u256 = 0) then (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = Frontend_dAst.C_Qty_Q0; B_dData_dPair.f_Pair_second = dtb_u_u257 })) else (if (dtb_u_u256 = 1) then (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = Frontend_dAst.C_Qty_Q1; B_dData_dPair.f_Pair_second = dtb_u_u257 })) else B_dData_dMaybe.C_Maybe_Nothing))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))))

# 322 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
let v_decReprTier = (fun (dtb_u_u258 : int) (dtb_u_u259 : Base_dBytes.t_Cur) -> (if (dtb_u_u258 <= 0) then B_dData_dMaybe.C_Maybe_Nothing else (let dtb_u_u260 = ((Base_dBytes.v_decTag dtb_u_u258) dtb_u_u259) in (match dtb_u_u260 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u261) -> (match dtb_u_u261 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u262; B_dData_dPair.f_Pair_second = dtb_u_u263 } -> (if (dtb_u_u262 = 0) then (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = Frontend_dAst.C_ReprTier_ReprAuto; B_dData_dPair.f_Pair_second = dtb_u_u263 })) else (if (dtb_u_u262 = 1) then (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = Frontend_dAst.C_ReprTier_ReprAlias; B_dData_dPair.f_Pair_second = dtb_u_u263 })) else (if (dtb_u_u262 = 2) then (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = Frontend_dAst.C_ReprTier_ReprBoxed; B_dData_dPair.f_Pair_second = dtb_u_u263 })) else B_dData_dMaybe.C_Maybe_Nothing)))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))))

# 337 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
let v_decMaybeQty = (fun (dtb_u_u264 : int) (dtb_u_u265 : Base_dBytes.t_Cur) -> (((Base_dBytes.v_decMaybe v_decQty) dtb_u_u264) dtb_u_u265))

# 859 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
let rec v_decListDigits = (fun (dtb_u_u266 : int) (dtb_u_u267 : int) (dtb_u_u268 : Base_dBytes.t_Cur) -> (if (dtb_u_u266 <= 0) then B_dData_dMaybe.C_Maybe_Nothing else (match (Base_dBytes.v_curChar dtb_u_u268) with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u269) -> (if (dtb_u_u269 = 58) then (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = dtb_u_u267; B_dData_dPair.f_Pair_second = (Base_dBytes.v_curSkip dtb_u_u268) })) else (if (if (dtb_u_u269 >= 48) then (dtb_u_u269 <= 57) else false) then (((v_decListDigits (dtb_u_u266 - 1)) ((dtb_u_u267 * 10) + (dtb_u_u269 - 48))) (Base_dBytes.v_curSkip dtb_u_u268)) else B_dData_dMaybe.C_Maybe_Nothing))
  | _ -> failwith "DT: impossible branch"
)))

# 849 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
let v_decListHead = (fun (dtb_u_u270 : int) (dtb_u_u271 : Base_dBytes.t_Cur) -> (if (dtb_u_u270 <= 0) then B_dData_dMaybe.C_Maybe_Nothing else (let dtb_u_u272 = (Base_dBytes.v_curChar dtb_u_u271) in (match dtb_u_u272 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u273) -> (if (dtb_u_u273 = 91) then (((v_decListDigits (dtb_u_u270 - 1)) 0) (Base_dBytes.v_curSkip dtb_u_u271)) else B_dData_dMaybe.C_Maybe_Nothing)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
))))

# 365 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
let rec v_decPat = (fun (dtb_u_u274 : int) (dtb_u_u275 : Base_dBytes.t_Cur) -> (if (dtb_u_u274 <= 0) then B_dData_dMaybe.C_Maybe_Nothing else (let dtb_u_u276 = ((Base_dBytes.v_decTag dtb_u_u274) dtb_u_u275) in (match dtb_u_u276 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u277) -> (match dtb_u_u277 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u278; B_dData_dPair.f_Pair_second = dtb_u_u279 } -> (if (dtb_u_u278 = 0) then (let dtb_u_u280 = ((Base_dBytes.v_decStr (dtb_u_u274 - 1)) dtb_u_u279) in (match dtb_u_u280 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u281) -> (match dtb_u_u281 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u282; B_dData_dPair.f_Pair_second = dtb_u_u283 } -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Pat_PVar (dtb_u_u282, (Frontend_dAst.v_detachedNodeRef v_noSpan))); B_dData_dPair.f_Pair_second = dtb_u_u283 }))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) else (if (dtb_u_u278 = 1) then (let dtb_u_u284 = ((Base_dBytes.v_decStr (dtb_u_u274 - 1)) dtb_u_u279) in (match dtb_u_u284 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u285) -> (match dtb_u_u285 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u286; B_dData_dPair.f_Pair_second = dtb_u_u287 } -> (let dtb_u_u288 = ((v_decPat (dtb_u_u274 - 1)) dtb_u_u287) in (match dtb_u_u288 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u289) -> (match dtb_u_u289 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u290; B_dData_dPair.f_Pair_second = dtb_u_u291 } -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Pat_PAs (dtb_u_u286, dtb_u_u290, (Frontend_dAst.v_detachedNodeRef v_noSpan))); B_dData_dPair.f_Pair_second = dtb_u_u291 }))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) else (if (dtb_u_u278 = 2) then (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Pat_PWild ((Frontend_dAst.v_detachedNodeRef v_noSpan))); B_dData_dPair.f_Pair_second = dtb_u_u279 })) else (if (dtb_u_u278 = 3) then (let dtb_u_u292 = ((Base_dBytes.v_decStr (dtb_u_u274 - 1)) dtb_u_u279) in (match dtb_u_u292 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u293) -> (match dtb_u_u293 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u294; B_dData_dPair.f_Pair_second = dtb_u_u295 } -> (let dtb_u_u296 = ((v_decPatList (dtb_u_u274 - 1)) dtb_u_u295) in (match dtb_u_u296 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u297) -> (match dtb_u_u297 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u298; B_dData_dPair.f_Pair_second = dtb_u_u299 } -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Pat_PCon (dtb_u_u294, dtb_u_u298, (Frontend_dAst.v_detachedNodeRef v_noSpan))); B_dData_dPair.f_Pair_second = dtb_u_u299 }))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) else (if (dtb_u_u278 = 4) then (let dtb_u_u300 = ((Base_dBytes.v_decInt (dtb_u_u274 - 1)) dtb_u_u279) in (match dtb_u_u300 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u301) -> (match dtb_u_u301 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u302; B_dData_dPair.f_Pair_second = dtb_u_u303 } -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Pat_PInt (dtb_u_u302, (Frontend_dAst.v_detachedNodeRef v_noSpan))); B_dData_dPair.f_Pair_second = dtb_u_u303 }))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) else (if (dtb_u_u278 = 5) then (let dtb_u_u304 = ((Base_dBytes.v_decStr (dtb_u_u274 - 1)) dtb_u_u279) in (match dtb_u_u304 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u305) -> (match dtb_u_u305 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u306; B_dData_dPair.f_Pair_second = dtb_u_u307 } -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Pat_PStr (dtb_u_u306, (Frontend_dAst.v_detachedNodeRef v_noSpan))); B_dData_dPair.f_Pair_second = dtb_u_u307 }))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) else (if (dtb_u_u278 = 6) then (let dtb_u_u308 = ((Base_dBytes.v_decStr (dtb_u_u274 - 1)) dtb_u_u279) in (match dtb_u_u308 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u309) -> (match dtb_u_u309 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u310; B_dData_dPair.f_Pair_second = dtb_u_u311 } -> (let dtb_u_u312 = (((Base_dBytes.v_decList v_decStrPat) (dtb_u_u274 - 1)) dtb_u_u311) in (match dtb_u_u312 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u313) -> (match dtb_u_u313 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u314; B_dData_dPair.f_Pair_second = dtb_u_u315 } -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Pat_PRecord (dtb_u_u310, dtb_u_u314, (Frontend_dAst.v_detachedNodeRef v_noSpan))); B_dData_dPair.f_Pair_second = dtb_u_u315 }))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) else B_dData_dMaybe.C_Maybe_Nothing)))))))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))))
# 835 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
and v_decStrPat = (fun (dtb_u_u316 : int) (dtb_u_u317 : Base_dBytes.t_Cur) -> (if (dtb_u_u316 <= 0) then B_dData_dMaybe.C_Maybe_Nothing else (let dtb_u_u318 = ((Base_dBytes.v_decStr (dtb_u_u316 - 1)) dtb_u_u317) in (match dtb_u_u318 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u319) -> (match dtb_u_u319 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u320; B_dData_dPair.f_Pair_second = dtb_u_u321 } -> (let dtb_u_u322 = ((v_decPat (dtb_u_u316 - 1)) dtb_u_u321) in (match dtb_u_u322 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u323) -> (match dtb_u_u323 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u324; B_dData_dPair.f_Pair_second = dtb_u_u325 } -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = { B_dData_dPair.f_Pair_first = dtb_u_u320; B_dData_dPair.f_Pair_second = dtb_u_u324 }; B_dData_dPair.f_Pair_second = dtb_u_u325 }))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))))
# 896 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
and v_decPatList = (fun (dtb_u_u326 : int) (dtb_u_u327 : Base_dBytes.t_Cur) -> (if (dtb_u_u326 <= 0) then B_dData_dMaybe.C_Maybe_Nothing else (let dtb_u_u328 = ((v_decListHead dtb_u_u326) dtb_u_u327) in (match dtb_u_u328 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u329) -> (match dtb_u_u329 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u330; B_dData_dPair.f_Pair_second = dtb_u_u331 } -> ((((v_decPatListItems (dtb_u_u326 - 1)) dtb_u_u330) dtb_u_u331) B_dData_dList.C_List_Nil)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))))
# 906 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
and v_decPatListItems = (fun (dtb_u_u332 : int) (dtb_u_u333 : int) (dtb_u_u334 : Base_dBytes.t_Cur) (dtb_u_u335 : Frontend_dAst.t_Pat B_dData_dList.t_List) -> (if (dtb_u_u332 <= 0) then B_dData_dMaybe.C_Maybe_Nothing else (if (dtb_u_u333 <= 0) then (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (B_dData_dList.v_reverse dtb_u_u335); B_dData_dPair.f_Pair_second = dtb_u_u334 })) else (let dtb_u_u336 = ((v_decPat (dtb_u_u332 - 1)) dtb_u_u334) in (match dtb_u_u336 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u337) -> (match dtb_u_u337 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u338; B_dData_dPair.f_Pair_second = dtb_u_u339 } -> ((((v_decPatListItems (dtb_u_u332 - 1)) (dtb_u_u333 - 1)) dtb_u_u339) (B_dData_dList.C_List__x58__x58_ (dtb_u_u338, dtb_u_u335)))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)))))

# 345 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
let rec v_decInterpPart = (fun (dtb_u_u340 : int) (dtb_u_u341 : Base_dBytes.t_Cur) -> (if (dtb_u_u340 <= 0) then B_dData_dMaybe.C_Maybe_Nothing else (let dtb_u_u342 = ((Base_dBytes.v_decTag dtb_u_u340) dtb_u_u341) in (match dtb_u_u342 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u343) -> (match dtb_u_u343 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u344; B_dData_dPair.f_Pair_second = dtb_u_u345 } -> (if (dtb_u_u344 = 0) then (let dtb_u_u346 = ((Base_dBytes.v_decStr (dtb_u_u340 - 1)) dtb_u_u345) in (match dtb_u_u346 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u347) -> (match dtb_u_u347 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u348; B_dData_dPair.f_Pair_second = dtb_u_u349 } -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_InterpPart_IPText (dtb_u_u348)); B_dData_dPair.f_Pair_second = dtb_u_u349 }))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) else (if (dtb_u_u344 = 1) then (let dtb_u_u350 = ((v_decExpr (dtb_u_u340 - 1)) dtb_u_u345) in (match dtb_u_u350 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u351) -> (match dtb_u_u351 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u352; B_dData_dPair.f_Pair_second = dtb_u_u353 } -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_InterpPart_IPHole (dtb_u_u352)); B_dData_dPair.f_Pair_second = dtb_u_u353 }))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) else B_dData_dMaybe.C_Maybe_Nothing))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))))
# 411 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
and v_decDoStmt = (fun (dtb_u_u354 : int) (dtb_u_u355 : Base_dBytes.t_Cur) -> (if (dtb_u_u354 <= 0) then B_dData_dMaybe.C_Maybe_Nothing else (let dtb_u_u356 = ((Base_dBytes.v_decTag dtb_u_u354) dtb_u_u355) in (match dtb_u_u356 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u357) -> (match dtb_u_u357 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u358; B_dData_dPair.f_Pair_second = dtb_u_u359 } -> (if (dtb_u_u358 = 0) then (let dtb_u_u360 = ((v_decPat (dtb_u_u354 - 1)) dtb_u_u359) in (match dtb_u_u360 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u361) -> (match dtb_u_u361 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u362; B_dData_dPair.f_Pair_second = dtb_u_u363 } -> (let dtb_u_u364 = ((v_decExpr (dtb_u_u354 - 1)) dtb_u_u363) in (match dtb_u_u364 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u365) -> (match dtb_u_u365 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u366; B_dData_dPair.f_Pair_second = dtb_u_u367 } -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_DoStmt_DBind (dtb_u_u362, dtb_u_u366, Frontend_dAst.v_noNodeRef)); B_dData_dPair.f_Pair_second = dtb_u_u367 }))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) else (if (dtb_u_u358 = 1) then (let dtb_u_u368 = ((v_decExpr (dtb_u_u354 - 1)) dtb_u_u359) in (match dtb_u_u368 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u369) -> (match dtb_u_u369 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u370; B_dData_dPair.f_Pair_second = dtb_u_u371 } -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_DoStmt_DExpr (dtb_u_u370, Frontend_dAst.v_noNodeRef)); B_dData_dPair.f_Pair_second = dtb_u_u371 }))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) else (if (dtb_u_u358 = 2) then (let dtb_u_u372 = (((Base_dBytes.v_decList v_decBinding) (dtb_u_u354 - 1)) dtb_u_u359) in (match dtb_u_u372 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u373) -> (match dtb_u_u373 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u374; B_dData_dPair.f_Pair_second = dtb_u_u375 } -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_DoStmt_DLet (dtb_u_u374, Frontend_dAst.v_noNodeRef)); B_dData_dPair.f_Pair_second = dtb_u_u375 }))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) else B_dData_dMaybe.C_Maybe_Nothing)))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))))
# 438 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
and v_decExpr = (fun (dtb_u_u376 : int) (dtb_u_u377 : Base_dBytes.t_Cur) -> (if (dtb_u_u376 <= 0) then B_dData_dMaybe.C_Maybe_Nothing else (let dtb_u_u378 = ((Base_dBytes.v_decTag dtb_u_u376) dtb_u_u377) in (match dtb_u_u378 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u379) -> (match dtb_u_u379 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u380; B_dData_dPair.f_Pair_second = dtb_u_u381 } -> (if (dtb_u_u380 = 0) then (let dtb_u_u382 = ((Base_dBytes.v_decStr (dtb_u_u376 - 1)) dtb_u_u381) in (match dtb_u_u382 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u383) -> (match dtb_u_u383 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u384; B_dData_dPair.f_Pair_second = dtb_u_u385 } -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Expr_EVar (dtb_u_u384, (Frontend_dAst.v_detachedNodeRef v_noSpan))); B_dData_dPair.f_Pair_second = dtb_u_u385 }))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) else (if (dtb_u_u380 = 1) then (let dtb_u_u386 = ((Base_dBytes.v_decInt (dtb_u_u376 - 1)) dtb_u_u381) in (match dtb_u_u386 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u387) -> (match dtb_u_u387 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u388; B_dData_dPair.f_Pair_second = dtb_u_u389 } -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Expr_EInt (dtb_u_u388, (Frontend_dAst.v_detachedNodeRef v_noSpan))); B_dData_dPair.f_Pair_second = dtb_u_u389 }))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) else (if (dtb_u_u380 = 2) then (let dtb_u_u390 = ((Base_dBytes.v_decStr (dtb_u_u376 - 1)) dtb_u_u381) in (match dtb_u_u390 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u391) -> (match dtb_u_u391 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u392; B_dData_dPair.f_Pair_second = dtb_u_u393 } -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Expr_EStr (dtb_u_u392, (Frontend_dAst.v_detachedNodeRef v_noSpan))); B_dData_dPair.f_Pair_second = dtb_u_u393 }))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) else (if (dtb_u_u380 = 3) then (let dtb_u_u394 = (((Base_dBytes.v_decList Base_dBytes.v_decStr) (dtb_u_u376 - 1)) dtb_u_u381) in (match dtb_u_u394 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u395) -> (match dtb_u_u395 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u396; B_dData_dPair.f_Pair_second = dtb_u_u397 } -> (let dtb_u_u398 = ((v_decExpr (dtb_u_u376 - 1)) dtb_u_u397) in (match dtb_u_u398 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u399) -> (match dtb_u_u399 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u400; B_dData_dPair.f_Pair_second = dtb_u_u401 } -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Expr_ELam (((B_dData_dList.v_map (fun (dtb_u_u402 : string) -> { B_dData_dPair.f_Pair_first = dtb_u_u402; B_dData_dPair.f_Pair_second = v_noSpan })) dtb_u_u396), dtb_u_u400, (Frontend_dAst.v_detachedNodeRef v_noSpan))); B_dData_dPair.f_Pair_second = dtb_u_u401 }))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) else (if (dtb_u_u380 = 4) then (let dtb_u_u403 = ((v_decExpr (dtb_u_u376 - 1)) dtb_u_u381) in (match dtb_u_u403 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u404) -> (match dtb_u_u404 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u405; B_dData_dPair.f_Pair_second = dtb_u_u406 } -> (let dtb_u_u407 = ((v_decExprList (dtb_u_u376 - 1)) dtb_u_u406) in (match dtb_u_u407 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u408) -> (match dtb_u_u408 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u409; B_dData_dPair.f_Pair_second = dtb_u_u410 } -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Expr_EApp (dtb_u_u405, dtb_u_u409, (Frontend_dAst.v_detachedNodeRef v_noSpan))); B_dData_dPair.f_Pair_second = dtb_u_u410 }))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) else (if (dtb_u_u380 = 5) then (let dtb_u_u411 = ((Base_dBytes.v_decStr (dtb_u_u376 - 1)) dtb_u_u381) in (match dtb_u_u411 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u412) -> (match dtb_u_u412 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u413; B_dData_dPair.f_Pair_second = dtb_u_u414 } -> (let dtb_u_u415 = ((Base_dBytes.v_decBool (dtb_u_u376 - 1)) dtb_u_u414) in (match dtb_u_u415 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u416) -> (match dtb_u_u416 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u417; B_dData_dPair.f_Pair_second = dtb_u_u418 } -> (let dtb_u_u419 = (((Base_dBytes.v_decMaybe v_decQty) (dtb_u_u376 - 1)) dtb_u_u418) in (match dtb_u_u419 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u420) -> (match dtb_u_u420 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u421; B_dData_dPair.f_Pair_second = dtb_u_u422 } -> (let dtb_u_u423 = ((v_decExpr (dtb_u_u376 - 1)) dtb_u_u422) in (match dtb_u_u423 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u424) -> (match dtb_u_u424 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u425; B_dData_dPair.f_Pair_second = dtb_u_u426 } -> (let dtb_u_u427 = ((v_decExpr (dtb_u_u376 - 1)) dtb_u_u426) in (match dtb_u_u427 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u428) -> (match dtb_u_u428 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u429; B_dData_dPair.f_Pair_second = dtb_u_u430 } -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Expr_EPi (dtb_u_u413, dtb_u_u417, dtb_u_u421, dtb_u_u425, dtb_u_u429, (Frontend_dAst.v_detachedNodeRef v_noSpan))); B_dData_dPair.f_Pair_second = dtb_u_u430 }))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) else (if (dtb_u_u380 = 6) then (let dtb_u_u431 = (((Base_dBytes.v_decList v_decBinding) (dtb_u_u376 - 1)) dtb_u_u381) in (match dtb_u_u431 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u432) -> (match dtb_u_u432 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u433; B_dData_dPair.f_Pair_second = dtb_u_u434 } -> (let dtb_u_u435 = ((v_decExpr (dtb_u_u376 - 1)) dtb_u_u434) in (match dtb_u_u435 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u436) -> (match dtb_u_u436 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u437; B_dData_dPair.f_Pair_second = dtb_u_u438 } -> (let dtb_u_u439 = ((Base_dBytes.v_decBool (dtb_u_u376 - 1)) dtb_u_u438) in (match dtb_u_u439 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u440) -> (match dtb_u_u440 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u441; B_dData_dPair.f_Pair_second = dtb_u_u442 } -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Expr_ELet (dtb_u_u433, dtb_u_u437, dtb_u_u441, (Frontend_dAst.v_detachedNodeRef v_noSpan))); B_dData_dPair.f_Pair_second = dtb_u_u442 }))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) else (if (dtb_u_u380 = 7) then (let dtb_u_u443 = ((v_decExpr (dtb_u_u376 - 1)) dtb_u_u381) in (match dtb_u_u443 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u444) -> (match dtb_u_u444 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u445; B_dData_dPair.f_Pair_second = dtb_u_u446 } -> (let dtb_u_u447 = (((Base_dBytes.v_decList v_decAlt) (dtb_u_u376 - 1)) dtb_u_u446) in (match dtb_u_u447 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u448) -> (match dtb_u_u448 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u449; B_dData_dPair.f_Pair_second = dtb_u_u450 } -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Expr_ECase (dtb_u_u445, dtb_u_u449, (Frontend_dAst.v_detachedNodeRef v_noSpan))); B_dData_dPair.f_Pair_second = dtb_u_u450 }))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) else (if (dtb_u_u380 = 8) then (let dtb_u_u451 = ((v_decExpr (dtb_u_u376 - 1)) dtb_u_u381) in (match dtb_u_u451 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u452) -> (match dtb_u_u452 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u453; B_dData_dPair.f_Pair_second = dtb_u_u454 } -> (let dtb_u_u455 = ((v_decExpr (dtb_u_u376 - 1)) dtb_u_u454) in (match dtb_u_u455 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u456) -> (match dtb_u_u456 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u457; B_dData_dPair.f_Pair_second = dtb_u_u458 } -> (let dtb_u_u459 = ((v_decExpr (dtb_u_u376 - 1)) dtb_u_u458) in (match dtb_u_u459 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u460) -> (match dtb_u_u460 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u461; B_dData_dPair.f_Pair_second = dtb_u_u462 } -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Expr_EIf (dtb_u_u453, dtb_u_u457, dtb_u_u461, (Frontend_dAst.v_detachedNodeRef v_noSpan))); B_dData_dPair.f_Pair_second = dtb_u_u462 }))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) else (if (dtb_u_u380 = 9) then (let dtb_u_u463 = ((v_decExpr (dtb_u_u376 - 1)) dtb_u_u381) in (match dtb_u_u463 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u464) -> (match dtb_u_u464 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u465; B_dData_dPair.f_Pair_second = dtb_u_u466 } -> (let dtb_u_u467 = ((Base_dBytes.v_decStr (dtb_u_u376 - 1)) dtb_u_u466) in (match dtb_u_u467 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u468) -> (match dtb_u_u468 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u469; B_dData_dPair.f_Pair_second = dtb_u_u470 } -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Expr_EField (dtb_u_u465, dtb_u_u469, (Frontend_dAst.v_detachedNodeRef v_noSpan))); B_dData_dPair.f_Pair_second = dtb_u_u470 }))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) else (if (dtb_u_u380 = 10) then (let dtb_u_u471 = ((Base_dBytes.v_decStr (dtb_u_u376 - 1)) dtb_u_u381) in (match dtb_u_u471 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u472) -> (match dtb_u_u472 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u473; B_dData_dPair.f_Pair_second = dtb_u_u474 } -> (let dtb_u_u475 = (((Base_dBytes.v_decList v_decStrExpr) (dtb_u_u376 - 1)) dtb_u_u474) in (match dtb_u_u475 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u476) -> (match dtb_u_u476 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u477; B_dData_dPair.f_Pair_second = dtb_u_u478 } -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Expr_ERecord (dtb_u_u473, dtb_u_u477, (Frontend_dAst.v_detachedNodeRef v_noSpan))); B_dData_dPair.f_Pair_second = dtb_u_u478 }))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) else (if (dtb_u_u380 = 11) then (let dtb_u_u479 = ((v_decExpr (dtb_u_u376 - 1)) dtb_u_u381) in (match dtb_u_u479 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u480) -> (match dtb_u_u480 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u481; B_dData_dPair.f_Pair_second = dtb_u_u482 } -> (let dtb_u_u483 = (((Base_dBytes.v_decList v_decStrExpr) (dtb_u_u376 - 1)) dtb_u_u482) in (match dtb_u_u483 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u484) -> (match dtb_u_u484 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u485; B_dData_dPair.f_Pair_second = dtb_u_u486 } -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Expr_ERecUpdate (dtb_u_u481, dtb_u_u485, (Frontend_dAst.v_detachedNodeRef v_noSpan))); B_dData_dPair.f_Pair_second = dtb_u_u486 }))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) else (if (dtb_u_u380 = 12) then (let dtb_u_u487 = (((Base_dBytes.v_decList v_decDoStmt) (dtb_u_u376 - 1)) dtb_u_u381) in (match dtb_u_u487 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u488) -> (match dtb_u_u488 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u489; B_dData_dPair.f_Pair_second = dtb_u_u490 } -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Expr_EDo (dtb_u_u489, (Frontend_dAst.v_detachedNodeRef v_noSpan))); B_dData_dPair.f_Pair_second = dtb_u_u490 }))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) else (if (dtb_u_u380 = 13) then (let dtb_u_u491 = (((Base_dBytes.v_decList v_decInterpPart) (dtb_u_u376 - 1)) dtb_u_u381) in (match dtb_u_u491 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u492) -> (match dtb_u_u492 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u493; B_dData_dPair.f_Pair_second = dtb_u_u494 } -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Expr_EInterp (dtb_u_u493, (Frontend_dAst.v_detachedNodeRef v_noSpan))); B_dData_dPair.f_Pair_second = dtb_u_u494 }))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) else (if (dtb_u_u380 = 14) then (let dtb_u_u495 = ((Base_dBytes.v_decStr (dtb_u_u376 - 1)) dtb_u_u381) in (match dtb_u_u495 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u496) -> (match dtb_u_u496 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u497; B_dData_dPair.f_Pair_second = dtb_u_u498 } -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Expr_EFloat (dtb_u_u497, (Frontend_dAst.v_detachedNodeRef v_noSpan))); B_dData_dPair.f_Pair_second = dtb_u_u498 }))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) else B_dData_dMaybe.C_Maybe_Nothing)))))))))))))))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))))
# 750 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
and v_decBinding = (fun (dtb_u_u499 : int) (dtb_u_u500 : Base_dBytes.t_Cur) -> (if (dtb_u_u499 <= 0) then B_dData_dMaybe.C_Maybe_Nothing else (let dtb_u_u501 = ((v_decPat (dtb_u_u499 - 1)) dtb_u_u500) in (match dtb_u_u501 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u502) -> (match dtb_u_u502 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u503; B_dData_dPair.f_Pair_second = dtb_u_u504 } -> (let dtb_u_u505 = ((Base_dBytes.v_decTag dtb_u_u499) dtb_u_u504) in (match dtb_u_u505 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u506) -> (match dtb_u_u506 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u507; B_dData_dPair.f_Pair_second = dtb_u_u508 } -> (if (dtb_u_u507 = 0) then (let dtb_u_u509 = ((v_decBindingValue (dtb_u_u499 - 1)) dtb_u_u508) in (match dtb_u_u509 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u510) -> (match dtb_u_u510 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u511; B_dData_dPair.f_Pair_second = dtb_u_u512 } -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = { Frontend_dAst.f_Binding_bindPat = dtb_u_u503; Frontend_dAst.f_Binding_bindValue = dtb_u_u511; Frontend_dAst.f_Binding_bindSig = B_dData_dMaybe.C_Maybe_Nothing; Frontend_dAst.f_Binding_bindRef = Frontend_dAst.v_noNodeRef }; B_dData_dPair.f_Pair_second = dtb_u_u512 }))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) else (if (dtb_u_u507 = 1) then (let dtb_u_u513 = ((v_decExpr (dtb_u_u499 - 1)) dtb_u_u508) in (match dtb_u_u513 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u514) -> (match dtb_u_u514 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u515; B_dData_dPair.f_Pair_second = dtb_u_u516 } -> (let dtb_u_u517 = ((v_decBindingValue (dtb_u_u499 - 1)) dtb_u_u516) in (match dtb_u_u517 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u518) -> (match dtb_u_u518 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u519; B_dData_dPair.f_Pair_second = dtb_u_u520 } -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = { Frontend_dAst.f_Binding_bindPat = dtb_u_u503; Frontend_dAst.f_Binding_bindValue = dtb_u_u519; Frontend_dAst.f_Binding_bindSig = (B_dData_dMaybe.C_Maybe_Just ({ Frontend_dAst.f_BindingSig_sigType = dtb_u_u515; Frontend_dAst.f_BindingSig_sigRef = Frontend_dAst.v_noNodeRef })); Frontend_dAst.f_Binding_bindRef = Frontend_dAst.v_noNodeRef }; B_dData_dPair.f_Pair_second = dtb_u_u520 }))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) else B_dData_dMaybe.C_Maybe_Nothing))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))))
# 776 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
and v_decBindingValue = (fun (dtb_u_u521 : int) (dtb_u_u522 : Base_dBytes.t_Cur) -> (if (dtb_u_u521 <= 0) then B_dData_dMaybe.C_Maybe_Nothing else (let dtb_u_u523 = ((Base_dBytes.v_decTag dtb_u_u521) dtb_u_u522) in (match dtb_u_u523 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u524) -> (match dtb_u_u524 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u525; B_dData_dPair.f_Pair_second = dtb_u_u526 } -> (if (dtb_u_u525 = 0) then (let dtb_u_u527 = ((v_decExpr (dtb_u_u521 - 1)) dtb_u_u526) in (match dtb_u_u527 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u528) -> (match dtb_u_u528 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u529; B_dData_dPair.f_Pair_second = dtb_u_u530 } -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_BindingValue_BVal (dtb_u_u529)); B_dData_dPair.f_Pair_second = dtb_u_u530 }))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) else (if (dtb_u_u525 = 1) then (let dtb_u_u531 = (((Base_dBytes.v_decList v_decClause) (dtb_u_u521 - 1)) dtb_u_u526) in (match dtb_u_u531 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u532) -> (match dtb_u_u532 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u533; B_dData_dPair.f_Pair_second = dtb_u_u534 } -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_BindingValue_BClauses (dtb_u_u533)); B_dData_dPair.f_Pair_second = dtb_u_u534 }))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) else B_dData_dMaybe.C_Maybe_Nothing))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))))
# 796 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
and v_decAlt = (fun (dtb_u_u535 : int) (dtb_u_u536 : Base_dBytes.t_Cur) -> (if (dtb_u_u535 <= 0) then B_dData_dMaybe.C_Maybe_Nothing else (let dtb_u_u537 = ((v_decPat (dtb_u_u535 - 1)) dtb_u_u536) in (match dtb_u_u537 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u538) -> (match dtb_u_u538 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u539; B_dData_dPair.f_Pair_second = dtb_u_u540 } -> (let dtb_u_u541 = ((v_decExpr (dtb_u_u535 - 1)) dtb_u_u540) in (match dtb_u_u541 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u542) -> (match dtb_u_u542 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u543; B_dData_dPair.f_Pair_second = dtb_u_u544 } -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = { Frontend_dAst.f_Alt_altPat = dtb_u_u539; Frontend_dAst.f_Alt_altBody = dtb_u_u543; Frontend_dAst.f_Alt_altRef = Frontend_dAst.v_noNodeRef }; B_dData_dPair.f_Pair_second = dtb_u_u544 }))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))))
# 809 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
and v_decClause = (fun (dtb_u_u545 : int) (dtb_u_u546 : Base_dBytes.t_Cur) -> (if (dtb_u_u545 <= 0) then B_dData_dMaybe.C_Maybe_Nothing else (let dtb_u_u547 = ((v_decPatList (dtb_u_u545 - 1)) dtb_u_u546) in (match dtb_u_u547 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u548) -> (match dtb_u_u548 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u549; B_dData_dPair.f_Pair_second = dtb_u_u550 } -> (let dtb_u_u551 = ((v_decExpr (dtb_u_u545 - 1)) dtb_u_u550) in (match dtb_u_u551 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u552) -> (match dtb_u_u552 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u553; B_dData_dPair.f_Pair_second = dtb_u_u554 } -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = { Frontend_dAst.f_LocalClause_lcPats = dtb_u_u549; Frontend_dAst.f_LocalClause_lcBody = dtb_u_u553; Frontend_dAst.f_LocalClause_lcRef = Frontend_dAst.v_noNodeRef; Frontend_dAst.f_LocalClause_lcHead = Frontend_dAst.v_noNodeRef }; B_dData_dPair.f_Pair_second = dtb_u_u554 }))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))))
# 822 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
and v_decStrExpr = (fun (dtb_u_u555 : int) (dtb_u_u556 : Base_dBytes.t_Cur) -> (if (dtb_u_u555 <= 0) then B_dData_dMaybe.C_Maybe_Nothing else (let dtb_u_u557 = ((Base_dBytes.v_decStr (dtb_u_u555 - 1)) dtb_u_u556) in (match dtb_u_u557 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u558) -> (match dtb_u_u558 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u559; B_dData_dPair.f_Pair_second = dtb_u_u560 } -> (let dtb_u_u561 = ((v_decExpr (dtb_u_u555 - 1)) dtb_u_u560) in (match dtb_u_u561 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u562) -> (match dtb_u_u562 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u563; B_dData_dPair.f_Pair_second = dtb_u_u564 } -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = { B_dData_dPair.f_Pair_first = dtb_u_u559; B_dData_dPair.f_Pair_second = dtb_u_u563 }; B_dData_dPair.f_Pair_second = dtb_u_u564 }))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))))
# 874 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
and v_decExprList = (fun (dtb_u_u565 : int) (dtb_u_u566 : Base_dBytes.t_Cur) -> (if (dtb_u_u565 <= 0) then B_dData_dMaybe.C_Maybe_Nothing else (let dtb_u_u567 = ((v_decListHead dtb_u_u565) dtb_u_u566) in (match dtb_u_u567 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u568) -> (match dtb_u_u568 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u569; B_dData_dPair.f_Pair_second = dtb_u_u570 } -> ((((v_decExprListItems (dtb_u_u565 - 1)) dtb_u_u569) dtb_u_u570) B_dData_dList.C_List_Nil)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))))
# 884 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
and v_decExprListItems = (fun (dtb_u_u571 : int) (dtb_u_u572 : int) (dtb_u_u573 : Base_dBytes.t_Cur) (dtb_u_u574 : Frontend_dAst.t_Expr B_dData_dList.t_List) -> (if (dtb_u_u571 <= 0) then B_dData_dMaybe.C_Maybe_Nothing else (if (dtb_u_u572 <= 0) then (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (B_dData_dList.v_reverse dtb_u_u574); B_dData_dPair.f_Pair_second = dtb_u_u573 })) else (let dtb_u_u575 = ((v_decExpr (dtb_u_u571 - 1)) dtb_u_u573) in (match dtb_u_u575 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u576) -> (match dtb_u_u576 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u577; B_dData_dPair.f_Pair_second = dtb_u_u578 } -> ((((v_decExprListItems (dtb_u_u571 - 1)) (dtb_u_u572 - 1)) dtb_u_u578) (B_dData_dList.C_List__x58__x58_ (dtb_u_u577, dtb_u_u574)))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)))))

# 341 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
let v_decMaybeExpr = (fun (dtb_u_u579 : int) (dtb_u_u580 : Base_dBytes.t_Cur) -> (((Base_dBytes.v_decMaybe v_decExpr) dtb_u_u579) dtb_u_u580))

# 552 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
let v_decCtor = (fun (dtb_u_u581 : int) (dtb_u_u582 : Base_dBytes.t_Cur) -> (if (dtb_u_u581 <= 0) then B_dData_dMaybe.C_Maybe_Nothing else (let dtb_u_u583 = ((Base_dBytes.v_decTag dtb_u_u581) dtb_u_u582) in (match dtb_u_u583 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u584) -> (match dtb_u_u584 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u585; B_dData_dPair.f_Pair_second = dtb_u_u586 } -> (if (dtb_u_u585 = 0) then (let dtb_u_u587 = ((Base_dBytes.v_decStr (dtb_u_u581 - 1)) dtb_u_u586) in (match dtb_u_u587 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u588) -> (match dtb_u_u588 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u589; B_dData_dPair.f_Pair_second = dtb_u_u590 } -> (let dtb_u_u591 = ((v_decExpr (dtb_u_u581 - 1)) dtb_u_u590) in (match dtb_u_u591 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u592) -> (match dtb_u_u592 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u593; B_dData_dPair.f_Pair_second = dtb_u_u594 } -> (let dtb_u_u595 = ((Base_dBytes.v_decInt (dtb_u_u581 - 1)) dtb_u_u594) in (match dtb_u_u595 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u596) -> (match dtb_u_u596 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u597; B_dData_dPair.f_Pair_second = dtb_u_u598 } -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = { Frontend_dAst.f_Ctor_ctorName = dtb_u_u589; Frontend_dAst.f_Ctor_ctorType = dtb_u_u593; Frontend_dAst.f_Ctor_ctorArity = dtb_u_u597; Frontend_dAst.f_Ctor_ctorRef = Frontend_dAst.v_noNodeRef }; B_dData_dPair.f_Pair_second = dtb_u_u598 }))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) else B_dData_dMaybe.C_Maybe_Nothing)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))))

# 574 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
let v_decField = (fun (dtb_u_u599 : int) (dtb_u_u600 : Base_dBytes.t_Cur) -> (if (dtb_u_u599 <= 0) then B_dData_dMaybe.C_Maybe_Nothing else (let dtb_u_u601 = ((Base_dBytes.v_decTag dtb_u_u599) dtb_u_u600) in (match dtb_u_u601 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u602) -> (match dtb_u_u602 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u603; B_dData_dPair.f_Pair_second = dtb_u_u604 } -> (if (dtb_u_u603 = 0) then (let dtb_u_u605 = ((Base_dBytes.v_decStr (dtb_u_u599 - 1)) dtb_u_u604) in (match dtb_u_u605 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u606) -> (match dtb_u_u606 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u607; B_dData_dPair.f_Pair_second = dtb_u_u608 } -> (let dtb_u_u609 = ((v_decExpr (dtb_u_u599 - 1)) dtb_u_u608) in (match dtb_u_u609 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u610) -> (match dtb_u_u610 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u611; B_dData_dPair.f_Pair_second = dtb_u_u612 } -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = { Frontend_dAst.f_Field_fieldName = dtb_u_u607; Frontend_dAst.f_Field_fieldType = dtb_u_u611; Frontend_dAst.f_Field_fieldRef = Frontend_dAst.v_noNodeRef }; B_dData_dPair.f_Pair_second = dtb_u_u612 }))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) else B_dData_dMaybe.C_Maybe_Nothing)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))))

# 593 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
let v_decTraitParam = (fun (dtb_u_u613 : int) (dtb_u_u614 : Base_dBytes.t_Cur) -> (if (dtb_u_u613 <= 0) then B_dData_dMaybe.C_Maybe_Nothing else (let dtb_u_u615 = ((Base_dBytes.v_decTag dtb_u_u613) dtb_u_u614) in (match dtb_u_u615 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u616) -> (match dtb_u_u616 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u617; B_dData_dPair.f_Pair_second = dtb_u_u618 } -> (if (dtb_u_u617 = 0) then (let dtb_u_u619 = ((Base_dBytes.v_decStr (dtb_u_u613 - 1)) dtb_u_u618) in (match dtb_u_u619 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u620) -> (match dtb_u_u620 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u621; B_dData_dPair.f_Pair_second = dtb_u_u622 } -> (let dtb_u_u623 = (((Base_dBytes.v_decMaybe v_decExpr) (dtb_u_u613 - 1)) dtb_u_u622) in (match dtb_u_u623 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u624) -> (match dtb_u_u624 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u625; B_dData_dPair.f_Pair_second = dtb_u_u626 } -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = { Frontend_dAst.f_TraitParam_traitParamName = dtb_u_u621; Frontend_dAst.f_TraitParam_traitParamKind = dtb_u_u625 }; B_dData_dPair.f_Pair_second = dtb_u_u626 }))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) else B_dData_dMaybe.C_Maybe_Nothing)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))))

# 612 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
let v_decTraitMethod = (fun (dtb_u_u627 : int) (dtb_u_u628 : Base_dBytes.t_Cur) -> (if (dtb_u_u627 <= 0) then B_dData_dMaybe.C_Maybe_Nothing else (let dtb_u_u629 = ((Base_dBytes.v_decTag dtb_u_u627) dtb_u_u628) in (match dtb_u_u629 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u630) -> (match dtb_u_u630 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u631; B_dData_dPair.f_Pair_second = dtb_u_u632 } -> (if (dtb_u_u631 = 0) then (let dtb_u_u633 = ((Base_dBytes.v_decStr (dtb_u_u627 - 1)) dtb_u_u632) in (match dtb_u_u633 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u634) -> (match dtb_u_u634 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u635; B_dData_dPair.f_Pair_second = dtb_u_u636 } -> (let dtb_u_u637 = ((v_decExpr (dtb_u_u627 - 1)) dtb_u_u636) in (match dtb_u_u637 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u638) -> (match dtb_u_u638 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u639; B_dData_dPair.f_Pair_second = dtb_u_u640 } -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = { Frontend_dAst.f_TraitMethod_traitMethodName = dtb_u_u635; Frontend_dAst.f_TraitMethod_traitMethodType = dtb_u_u639; Frontend_dAst.f_TraitMethod_traitMethodRef = Frontend_dAst.v_noNodeRef }; B_dData_dPair.f_Pair_second = dtb_u_u640 }))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) else B_dData_dMaybe.C_Maybe_Nothing)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))))

# 631 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
let rec v_decDecl = (fun (dtb_u_u641 : int) (dtb_u_u642 : Base_dBytes.t_Cur) -> (if (dtb_u_u641 <= 0) then B_dData_dMaybe.C_Maybe_Nothing else (let dtb_u_u643 = ((Base_dBytes.v_decTag dtb_u_u641) dtb_u_u642) in (match dtb_u_u643 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u644) -> (match dtb_u_u644 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u645; B_dData_dPair.f_Pair_second = dtb_u_u646 } -> (if (dtb_u_u645 = 0) then (let dtb_u_u647 = ((Base_dBytes.v_decStr (dtb_u_u641 - 1)) dtb_u_u646) in (match dtb_u_u647 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u648) -> (match dtb_u_u648 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u649; B_dData_dPair.f_Pair_second = dtb_u_u650 } -> (let dtb_u_u651 = (((Base_dBytes.v_decList Base_dBytes.v_decStr) (dtb_u_u641 - 1)) dtb_u_u650) in (match dtb_u_u651 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u652) -> (match dtb_u_u652 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u653; B_dData_dPair.f_Pair_second = dtb_u_u654 } -> (let dtb_u_u655 = ((v_decExpr (dtb_u_u641 - 1)) dtb_u_u654) in (match dtb_u_u655 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u656) -> (match dtb_u_u656 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u657; B_dData_dPair.f_Pair_second = dtb_u_u658 } -> (let dtb_u_u659 = (((Base_dBytes.v_decList v_decCtor) (dtb_u_u641 - 1)) dtb_u_u658) in (match dtb_u_u659 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u660) -> (match dtb_u_u660 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u661; B_dData_dPair.f_Pair_second = dtb_u_u662 } -> (let dtb_u_u663 = (((Base_dBytes.v_decList Base_dBytes.v_decStr) (dtb_u_u641 - 1)) dtb_u_u662) in (match dtb_u_u663 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u664) -> (match dtb_u_u664 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u665; B_dData_dPair.f_Pair_second = dtb_u_u666 } -> (let dtb_u_u667 = ((Base_dBytes.v_decBool (dtb_u_u641 - 1)) dtb_u_u666) in (match dtb_u_u667 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u668) -> (match dtb_u_u668 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u669; B_dData_dPair.f_Pair_second = dtb_u_u670 } -> (let dtb_u_u671 = ((v_decReprTier (dtb_u_u641 - 1)) dtb_u_u670) in (match dtb_u_u671 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u672) -> (match dtb_u_u672 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u673; B_dData_dPair.f_Pair_second = dtb_u_u674 } -> (let dtb_u_u675 = ((Base_dBytes.v_decBool (dtb_u_u641 - 1)) dtb_u_u674) in (match dtb_u_u675 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u676) -> (match dtb_u_u676 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u677; B_dData_dPair.f_Pair_second = dtb_u_u678 } -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Decl_DData (dtb_u_u649, dtb_u_u653, dtb_u_u657, dtb_u_u661, dtb_u_u665, dtb_u_u669, dtb_u_u673, dtb_u_u677, Frontend_dAst.v_noNodeRef)); B_dData_dPair.f_Pair_second = dtb_u_u678 }))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) else (if (dtb_u_u645 = 1) then (let dtb_u_u679 = ((Base_dBytes.v_decStr (dtb_u_u641 - 1)) dtb_u_u646) in (match dtb_u_u679 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u680) -> (match dtb_u_u680 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u681; B_dData_dPair.f_Pair_second = dtb_u_u682 } -> (let dtb_u_u683 = ((v_decExpr (dtb_u_u641 - 1)) dtb_u_u682) in (match dtb_u_u683 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u684) -> (match dtb_u_u684 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u685; B_dData_dPair.f_Pair_second = dtb_u_u686 } -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Decl_DAxiom (dtb_u_u681, dtb_u_u685, Frontend_dAst.v_noNodeRef)); B_dData_dPair.f_Pair_second = dtb_u_u686 }))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) else (if (dtb_u_u645 = 2) then (let dtb_u_u687 = ((Base_dBytes.v_decStr (dtb_u_u641 - 1)) dtb_u_u646) in (match dtb_u_u687 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u688) -> (match dtb_u_u688 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u689; B_dData_dPair.f_Pair_second = dtb_u_u690 } -> (let dtb_u_u691 = ((Base_dBytes.v_decStr (dtb_u_u641 - 1)) dtb_u_u690) in (match dtb_u_u691 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u692) -> (match dtb_u_u692 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u693; B_dData_dPair.f_Pair_second = dtb_u_u694 } -> (let dtb_u_u695 = ((v_decExpr (dtb_u_u641 - 1)) dtb_u_u694) in (match dtb_u_u695 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u696) -> (match dtb_u_u696 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u697; B_dData_dPair.f_Pair_second = dtb_u_u698 } -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Decl_DExtern (dtb_u_u689, dtb_u_u693, dtb_u_u697, Frontend_dAst.v_noNodeRef)); B_dData_dPair.f_Pair_second = dtb_u_u698 }))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) else (if (dtb_u_u645 = 3) then (let dtb_u_u699 = ((Base_dBytes.v_decStr (dtb_u_u641 - 1)) dtb_u_u646) in (match dtb_u_u699 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u700) -> (match dtb_u_u700 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u701; B_dData_dPair.f_Pair_second = dtb_u_u702 } -> (let dtb_u_u703 = ((v_decExprList (dtb_u_u641 - 1)) dtb_u_u702) in (match dtb_u_u703 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u704) -> (match dtb_u_u704 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u705; B_dData_dPair.f_Pair_second = dtb_u_u706 } -> (let dtb_u_u707 = ((v_decExpr (dtb_u_u641 - 1)) dtb_u_u706) in (match dtb_u_u707 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u708) -> (match dtb_u_u708 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u709; B_dData_dPair.f_Pair_second = dtb_u_u710 } -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Decl_DSig (dtb_u_u701, dtb_u_u705, dtb_u_u709, Frontend_dAst.v_noNodeRef)); B_dData_dPair.f_Pair_second = dtb_u_u710 }))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) else (if (dtb_u_u645 = 4) then (let dtb_u_u711 = ((Base_dBytes.v_decStr (dtb_u_u641 - 1)) dtb_u_u646) in (match dtb_u_u711 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u712) -> (match dtb_u_u712 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u713; B_dData_dPair.f_Pair_second = dtb_u_u714 } -> (let dtb_u_u715 = ((v_decPatList (dtb_u_u641 - 1)) dtb_u_u714) in (match dtb_u_u715 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u716) -> (match dtb_u_u716 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u717; B_dData_dPair.f_Pair_second = dtb_u_u718 } -> (let dtb_u_u719 = ((v_decExpr (dtb_u_u641 - 1)) dtb_u_u718) in (match dtb_u_u719 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u720) -> (match dtb_u_u720 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u721; B_dData_dPair.f_Pair_second = dtb_u_u722 } -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Decl_DFun (dtb_u_u713, dtb_u_u717, dtb_u_u721, Frontend_dAst.v_noNodeRef)); B_dData_dPair.f_Pair_second = dtb_u_u722 }))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) else (if (dtb_u_u645 = 5) then (let dtb_u_u723 = ((Base_dBytes.v_decStr (dtb_u_u641 - 1)) dtb_u_u646) in (match dtb_u_u723 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u724) -> (match dtb_u_u724 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u725; B_dData_dPair.f_Pair_second = dtb_u_u726 } -> (let dtb_u_u727 = (((Base_dBytes.v_decList Base_dBytes.v_decStr) (dtb_u_u641 - 1)) dtb_u_u726) in (match dtb_u_u727 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u728) -> (match dtb_u_u728 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u729; B_dData_dPair.f_Pair_second = dtb_u_u730 } -> (let dtb_u_u731 = (((Base_dBytes.v_decList v_decField) (dtb_u_u641 - 1)) dtb_u_u730) in (match dtb_u_u731 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u732) -> (match dtb_u_u732 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u733; B_dData_dPair.f_Pair_second = dtb_u_u734 } -> (let dtb_u_u735 = (((Base_dBytes.v_decList Base_dBytes.v_decStr) (dtb_u_u641 - 1)) dtb_u_u734) in (match dtb_u_u735 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u736) -> (match dtb_u_u736 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u737; B_dData_dPair.f_Pair_second = dtb_u_u738 } -> (let dtb_u_u739 = ((Base_dBytes.v_decBool (dtb_u_u641 - 1)) dtb_u_u738) in (match dtb_u_u739 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u740) -> (match dtb_u_u740 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u741; B_dData_dPair.f_Pair_second = dtb_u_u742 } -> (let dtb_u_u743 = ((v_decReprTier (dtb_u_u641 - 1)) dtb_u_u742) in (match dtb_u_u743 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u744) -> (match dtb_u_u744 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u745; B_dData_dPair.f_Pair_second = dtb_u_u746 } -> (let dtb_u_u747 = ((Base_dBytes.v_decBool (dtb_u_u641 - 1)) dtb_u_u746) in (match dtb_u_u747 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u748) -> (match dtb_u_u748 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u749; B_dData_dPair.f_Pair_second = dtb_u_u750 } -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Decl_DRecord (dtb_u_u725, dtb_u_u729, dtb_u_u733, dtb_u_u737, dtb_u_u741, dtb_u_u745, dtb_u_u749, Frontend_dAst.v_noNodeRef)); B_dData_dPair.f_Pair_second = dtb_u_u750 }))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) else (if (dtb_u_u645 = 6) then (let dtb_u_u751 = ((Base_dBytes.v_decStr (dtb_u_u641 - 1)) dtb_u_u646) in (match dtb_u_u751 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u752) -> (match dtb_u_u752 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u753; B_dData_dPair.f_Pair_second = dtb_u_u754 } -> (let dtb_u_u755 = (((Base_dBytes.v_decList v_decTraitParam) (dtb_u_u641 - 1)) dtb_u_u754) in (match dtb_u_u755 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u756) -> (match dtb_u_u756 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u757; B_dData_dPair.f_Pair_second = dtb_u_u758 } -> (let dtb_u_u759 = ((v_decExprList (dtb_u_u641 - 1)) dtb_u_u758) in (match dtb_u_u759 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u760) -> (match dtb_u_u760 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u761; B_dData_dPair.f_Pair_second = dtb_u_u762 } -> (let dtb_u_u763 = (((Base_dBytes.v_decList v_decTraitMethod) (dtb_u_u641 - 1)) dtb_u_u762) in (match dtb_u_u763 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u764) -> (match dtb_u_u764 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u765; B_dData_dPair.f_Pair_second = dtb_u_u766 } -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Decl_DTrait (dtb_u_u753, dtb_u_u757, dtb_u_u761, dtb_u_u765, Frontend_dAst.v_noNodeRef)); B_dData_dPair.f_Pair_second = dtb_u_u766 }))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) else (if (dtb_u_u645 = 7) then (let dtb_u_u767 = ((v_decExprList (dtb_u_u641 - 1)) dtb_u_u646) in (match dtb_u_u767 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u768) -> (match dtb_u_u768 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u769; B_dData_dPair.f_Pair_second = dtb_u_u770 } -> (let dtb_u_u771 = ((v_decExpr (dtb_u_u641 - 1)) dtb_u_u770) in (match dtb_u_u771 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u772) -> (match dtb_u_u772 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u773; B_dData_dPair.f_Pair_second = dtb_u_u774 } -> (let dtb_u_u775 = ((v_decDecls (dtb_u_u641 - 1)) dtb_u_u774) in (match dtb_u_u775 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u776) -> (match dtb_u_u776 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u777; B_dData_dPair.f_Pair_second = dtb_u_u778 } -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Decl_DInstance (dtb_u_u769, dtb_u_u773, dtb_u_u777, Frontend_dAst.v_noNodeRef)); B_dData_dPair.f_Pair_second = dtb_u_u778 }))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) else B_dData_dMaybe.C_Maybe_Nothing))))))))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))))
# 918 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
and v_decDecls = (fun (dtb_u_u779 : int) (dtb_u_u780 : Base_dBytes.t_Cur) -> (if (dtb_u_u779 <= 0) then B_dData_dMaybe.C_Maybe_Nothing else (let dtb_u_u781 = ((v_decListHead dtb_u_u779) dtb_u_u780) in (match dtb_u_u781 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u782) -> (match dtb_u_u782 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u783; B_dData_dPair.f_Pair_second = dtb_u_u784 } -> ((((v_decDeclsItems (dtb_u_u779 - 1)) dtb_u_u783) dtb_u_u784) B_dData_dList.C_List_Nil)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))))
# 928 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
and v_decDeclsItems = (fun (dtb_u_u785 : int) (dtb_u_u786 : int) (dtb_u_u787 : Base_dBytes.t_Cur) (dtb_u_u788 : Frontend_dAst.t_Decl B_dData_dList.t_List) -> (if (dtb_u_u785 <= 0) then B_dData_dMaybe.C_Maybe_Nothing else (if (dtb_u_u786 <= 0) then (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (B_dData_dList.v_reverse dtb_u_u788); B_dData_dPair.f_Pair_second = dtb_u_u787 })) else (let dtb_u_u789 = ((v_decDecl (dtb_u_u785 - 1)) dtb_u_u787) in (match dtb_u_u789 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u790) -> (match dtb_u_u790 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u791; B_dData_dPair.f_Pair_second = dtb_u_u792 } -> ((((v_decDeclsItems (dtb_u_u785 - 1)) (dtb_u_u786 - 1)) dtb_u_u792) (B_dData_dList.C_List__x58__x58_ (dtb_u_u791, dtb_u_u788)))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)))))

# 940 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
let v_decPatComplete = (fun (dtb_u_u793 : string) -> (let dtb_u_u794 = ((v_decPat (String.length dtb_u_u793)) (Base_dBytes.v_curOf dtb_u_u793)) in (match dtb_u_u794 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u795) -> (match dtb_u_u795 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u796; B_dData_dPair.f_Pair_second = dtb_u_u797 } -> (if (Base_dBytes.v_curAtEnd dtb_u_u797) then (B_dData_dMaybe.C_Maybe_Just (dtb_u_u796)) else B_dData_dMaybe.C_Maybe_Nothing)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)))

# 947 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
let v_decExprComplete = (fun (dtb_u_u798 : string) -> (let dtb_u_u799 = ((v_decExpr (String.length dtb_u_u798)) (Base_dBytes.v_curOf dtb_u_u798)) in (match dtb_u_u799 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u800) -> (match dtb_u_u800 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u801; B_dData_dPair.f_Pair_second = dtb_u_u802 } -> (if (Base_dBytes.v_curAtEnd dtb_u_u802) then (B_dData_dMaybe.C_Maybe_Just (dtb_u_u801)) else B_dData_dMaybe.C_Maybe_Nothing)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)))

# 954 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
let v_decDeclComplete = (fun (dtb_u_u803 : string) -> (let dtb_u_u804 = ((v_decDecl (String.length dtb_u_u803)) (Base_dBytes.v_curOf dtb_u_u803)) in (match dtb_u_u804 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u805) -> (match dtb_u_u805 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u806; B_dData_dPair.f_Pair_second = dtb_u_u807 } -> (if (Base_dBytes.v_curAtEnd dtb_u_u807) then (B_dData_dMaybe.C_Maybe_Just (dtb_u_u806)) else B_dData_dMaybe.C_Maybe_Nothing)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)))

# 961 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
let v_decQtyComplete = (fun (dtb_u_u808 : string) -> (let dtb_u_u809 = ((v_decQty (String.length dtb_u_u808)) (Base_dBytes.v_curOf dtb_u_u808)) in (match dtb_u_u809 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u810) -> (match dtb_u_u810 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u811; B_dData_dPair.f_Pair_second = dtb_u_u812 } -> (if (Base_dBytes.v_curAtEnd dtb_u_u812) then (B_dData_dMaybe.C_Maybe_Just (dtb_u_u811)) else B_dData_dMaybe.C_Maybe_Nothing)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)))

# 968 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
let v_decReprTierComplete = (fun (dtb_u_u813 : string) -> (let dtb_u_u814 = ((v_decReprTier (String.length dtb_u_u813)) (Base_dBytes.v_curOf dtb_u_u813)) in (match dtb_u_u814 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u815) -> (match dtb_u_u815 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u816; B_dData_dPair.f_Pair_second = dtb_u_u817 } -> (if (Base_dBytes.v_curAtEnd dtb_u_u817) then (B_dData_dMaybe.C_Maybe_Just (dtb_u_u816)) else B_dData_dMaybe.C_Maybe_Nothing)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)))

# 975 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
let v_decInterpPartComplete = (fun (dtb_u_u818 : string) -> (let dtb_u_u819 = ((v_decInterpPart (String.length dtb_u_u818)) (Base_dBytes.v_curOf dtb_u_u818)) in (match dtb_u_u819 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u820) -> (match dtb_u_u820 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u821; B_dData_dPair.f_Pair_second = dtb_u_u822 } -> (if (Base_dBytes.v_curAtEnd dtb_u_u822) then (B_dData_dMaybe.C_Maybe_Just (dtb_u_u821)) else B_dData_dMaybe.C_Maybe_Nothing)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)))

# 982 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
let v_decDoStmtComplete = (fun (dtb_u_u823 : string) -> (let dtb_u_u824 = ((v_decDoStmt (String.length dtb_u_u823)) (Base_dBytes.v_curOf dtb_u_u823)) in (match dtb_u_u824 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u825) -> (match dtb_u_u825 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u826; B_dData_dPair.f_Pair_second = dtb_u_u827 } -> (if (Base_dBytes.v_curAtEnd dtb_u_u827) then (B_dData_dMaybe.C_Maybe_Just (dtb_u_u826)) else B_dData_dMaybe.C_Maybe_Nothing)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)))

# 989 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
let v_decCtorComplete = (fun (dtb_u_u828 : string) -> (let dtb_u_u829 = ((v_decCtor (String.length dtb_u_u828)) (Base_dBytes.v_curOf dtb_u_u828)) in (match dtb_u_u829 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u830) -> (match dtb_u_u830 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u831; B_dData_dPair.f_Pair_second = dtb_u_u832 } -> (if (Base_dBytes.v_curAtEnd dtb_u_u832) then (B_dData_dMaybe.C_Maybe_Just (dtb_u_u831)) else B_dData_dMaybe.C_Maybe_Nothing)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)))

# 996 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
let v_decFieldComplete = (fun (dtb_u_u833 : string) -> (let dtb_u_u834 = ((v_decField (String.length dtb_u_u833)) (Base_dBytes.v_curOf dtb_u_u833)) in (match dtb_u_u834 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u835) -> (match dtb_u_u835 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u836; B_dData_dPair.f_Pair_second = dtb_u_u837 } -> (if (Base_dBytes.v_curAtEnd dtb_u_u837) then (B_dData_dMaybe.C_Maybe_Just (dtb_u_u836)) else B_dData_dMaybe.C_Maybe_Nothing)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)))

# 1003 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
let v_decTraitParamComplete = (fun (dtb_u_u838 : string) -> (let dtb_u_u839 = ((v_decTraitParam (String.length dtb_u_u838)) (Base_dBytes.v_curOf dtb_u_u838)) in (match dtb_u_u839 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u840) -> (match dtb_u_u840 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u841; B_dData_dPair.f_Pair_second = dtb_u_u842 } -> (if (Base_dBytes.v_curAtEnd dtb_u_u842) then (B_dData_dMaybe.C_Maybe_Just (dtb_u_u841)) else B_dData_dMaybe.C_Maybe_Nothing)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)))

# 1010 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
let v_decTraitMethodComplete = (fun (dtb_u_u843 : string) -> (let dtb_u_u844 = ((v_decTraitMethod (String.length dtb_u_u843)) (Base_dBytes.v_curOf dtb_u_u843)) in (match dtb_u_u844 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u845) -> (match dtb_u_u845 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u846; B_dData_dPair.f_Pair_second = dtb_u_u847 } -> (if (Base_dBytes.v_curAtEnd dtb_u_u847) then (B_dData_dMaybe.C_Maybe_Just (dtb_u_u846)) else B_dData_dMaybe.C_Maybe_Nothing)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)))

# 1017 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
let v_decDeclsComplete = (fun (dtb_u_u848 : string) -> (let dtb_u_u849 = ((v_decDecls (String.length dtb_u_u848)) (Base_dBytes.v_curOf dtb_u_u848)) in (match dtb_u_u849 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u850) -> (match dtb_u_u850 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u851; B_dData_dPair.f_Pair_second = dtb_u_u852 } -> (if (Base_dBytes.v_curAtEnd dtb_u_u852) then (B_dData_dMaybe.C_Maybe_Just (dtb_u_u851)) else B_dData_dMaybe.C_Maybe_Nothing)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)))

# 1031 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
let v_encExportItem = (fun (dtb_u_u853 : Frontend_dAst.t_ExportItem) (dtb_u_u854 : string B_dData_dList.t_List) -> (match dtb_u_u853 with
  | Frontend_dAst.C_ExportItem_XNamespace (dtb_u_u855, dtb_u_u856, dtb_u_u857) -> ((Base_dBytes.v_encTag 4) ((Base_dBytes.v_encStr dtb_u_u855) (((Base_dBytes.v_encMaybe Base_dBytes.v_encStr) dtb_u_u856) dtb_u_u854)))
  | Frontend_dAst.C_ExportItem_XModule (dtb_u_u858, dtb_u_u859) -> ((Base_dBytes.v_encTag 2) ((Base_dBytes.v_encStr dtb_u_u858) dtb_u_u854))
  | Frontend_dAst.C_ExportItem_XTypeSome (dtb_u_u860, dtb_u_u861, dtb_u_u862) -> ((Base_dBytes.v_encTag 3) ((Base_dBytes.v_encStr dtb_u_u860) (((Base_dBytes.v_encList Base_dBytes.v_encStr) dtb_u_u861) dtb_u_u854)))
  | Frontend_dAst.C_ExportItem_XTypeAll (dtb_u_u863, dtb_u_u864) -> ((Base_dBytes.v_encTag 1) ((Base_dBytes.v_encStr dtb_u_u863) dtb_u_u854))
  | Frontend_dAst.C_ExportItem_XBare (dtb_u_u865, dtb_u_u866) -> ((Base_dBytes.v_encTag 0) ((Base_dBytes.v_encStr dtb_u_u865) dtb_u_u854))
  | _ -> failwith "DT: impossible branch"
))

# 1038 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
let v_encExportMembers = (fun (dtb_u_u867 : Frontend_dAst.t_ExportMembers) (dtb_u_u868 : string B_dData_dList.t_List) -> (match dtb_u_u867 with
  | Frontend_dAst.C_ExportMembers_EMOnly (dtb_u_u869) -> ((Base_dBytes.v_encTag 2) (((Base_dBytes.v_encList Base_dBytes.v_encStr) dtb_u_u869) dtb_u_u868))
  | Frontend_dAst.C_ExportMembers_EMAll -> ((Base_dBytes.v_encTag 1) dtb_u_u868)
  | Frontend_dAst.C_ExportMembers_EMNone -> ((Base_dBytes.v_encTag 0) dtb_u_u868)
  | _ -> failwith "DT: impossible branch"
))

# 1043 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
let v_encExportSpec = (fun (dtb_u_u870 : Frontend_dAst.t_ExportSpec) (dtb_u_u871 : string B_dData_dList.t_List) -> (match dtb_u_u870 with
  | Frontend_dAst.C_ExportSpec_ESType (dtb_u_u872, dtb_u_u873, dtb_u_u874) -> ((Base_dBytes.v_encTag 1) ((Base_dBytes.v_encStr dtb_u_u872) ((v_encExportMembers dtb_u_u873) dtb_u_u871)))
  | Frontend_dAst.C_ExportSpec_ESValue (dtb_u_u875, dtb_u_u876) -> ((Base_dBytes.v_encTag 0) ((Base_dBytes.v_encStr dtb_u_u875) dtb_u_u871))
  | _ -> failwith "DT: impossible branch"
))

# 1047 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
let v_encOpacity = (fun (dtb_u_u877 : Frontend_dAst.t_Opacity) (dtb_u_u878 : string B_dData_dList.t_List) -> (match dtb_u_u877 with
  | Frontend_dAst.C_Opacity_OpacityAbstract -> ((Base_dBytes.v_encTag 2) dtb_u_u878)
  | Frontend_dAst.C_Opacity_OpacityTransparent -> ((Base_dBytes.v_encTag 1) dtb_u_u878)
  | Frontend_dAst.C_Opacity_OpacityOpaque -> ((Base_dBytes.v_encTag 0) dtb_u_u878)
  | _ -> failwith "DT: impossible branch"
))

# 1052 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
let v_encOpacitySpec = (fun (dtb_u_u879 : Frontend_dAst.t_OpacitySpec) (dtb_u_u880 : string B_dData_dList.t_List) -> ((Base_dBytes.v_encStr (dtb_u_u879).Frontend_dAst.f_OpacitySpec_opacityName) ((v_encOpacity (dtb_u_u879).Frontend_dAst.f_OpacitySpec_opacityKind) dtb_u_u880)))

# 1056 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
let v_encModDecl = (fun (dtb_u_u881 : Frontend_dAst.t_ModDecl) (dtb_u_u882 : string B_dData_dList.t_List) -> ((Base_dBytes.v_encStr (dtb_u_u881).Frontend_dAst.f_ModDecl_modDeclName) ((Base_dBytes.v_encBool (dtb_u_u881).Frontend_dAst.f_ModDecl_modDeclHasExportList) (((Base_dBytes.v_encList v_encExportItem) (dtb_u_u881).Frontend_dAst.f_ModDecl_modDeclExportItems) (((Base_dBytes.v_encList v_encExportSpec) (dtb_u_u881).Frontend_dAst.f_ModDecl_modDeclExports) (((Base_dBytes.v_encList v_encExportItem) (dtb_u_u881).Frontend_dAst.f_ModDecl_modDeclReexports) (((Base_dBytes.v_encList v_encOpacitySpec) (dtb_u_u881).Frontend_dAst.f_ModDecl_modDeclOpacity) dtb_u_u882)))))))

# 1073 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
let v_encImportLike = (fun (dtb_u_u883 : Frontend_dAst.t_Import) (dtb_u_u884 : string B_dData_dList.t_List) -> ((Base_dBytes.v_encStr (dtb_u_u883).Frontend_dAst.f_Import_importName) ((Base_dBytes.v_encBool (dtb_u_u883).Frontend_dAst.f_Import_importIsQualified) (((Base_dBytes.v_encMaybe Base_dBytes.v_encStr) (dtb_u_u883).Frontend_dAst.f_Import_importAlias) dtb_u_u884))))

# 1077 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
let v_encFixityLike = (fun (dtb_u_u885 : Frontend_dAst.t_FixityDecl) (dtb_u_u886 : string B_dData_dList.t_List) -> ((Base_dBytes.v_encStr (dtb_u_u885).Frontend_dAst.f_FixityDecl_fixityOp) ((Base_dBytes.v_encInt (dtb_u_u885).Frontend_dAst.f_FixityDecl_fixityLevel) ((Base_dBytes.v_encInt (dtb_u_u885).Frontend_dAst.f_FixityDecl_fixityAssoc) dtb_u_u886))))

# 1063 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
let v_encSourceFile = (fun (dtb_u_u887 : Frontend_dAst.t_SourceFile) (dtb_u_u888 : string B_dData_dList.t_List) -> (((Base_dBytes.v_encMaybe v_encModDecl) (dtb_u_u887).Frontend_dAst.f_SourceFile_sourceFileModDecl) (((Base_dBytes.v_encList v_encImportLike) (dtb_u_u887).Frontend_dAst.f_SourceFile_sourceFileImports) (((Base_dBytes.v_encList v_encFixityLike) (dtb_u_u887).Frontend_dAst.f_SourceFile_sourceFileFixities) (((Base_dBytes.v_encList v_encDecl) (dtb_u_u887).Frontend_dAst.f_SourceFile_sourceFileDecls) (((Base_dBytes.v_encList v_encExportSpec) (dtb_u_u887).Frontend_dAst.f_SourceFile_sourceFileExports) (((Base_dBytes.v_encList v_encExportItem) (dtb_u_u887).Frontend_dAst.f_SourceFile_sourceFileReexports) (((Base_dBytes.v_encList v_encOpacitySpec) (dtb_u_u887).Frontend_dAst.f_SourceFile_sourceFileOpacity) dtb_u_u888))))))))

# 1081 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
let v_decExportItem = (fun (dtb_u_u889 : int) (dtb_u_u890 : Base_dBytes.t_Cur) -> (if (dtb_u_u889 <= 0) then B_dData_dMaybe.C_Maybe_Nothing else ((Base_dBytes.v_thenPair ((Base_dBytes.v_decTag dtb_u_u889) dtb_u_u890)) (fun (dtb_u_u891 : int) (dtb_u_u892 : Base_dBytes.t_Cur) -> (if (dtb_u_u891 = 0) then ((Base_dBytes.v_thenPair ((Base_dBytes.v_decStr (dtb_u_u889 - 1)) dtb_u_u892)) (fun (dtb_u_u893 : string) (dtb_u_u894 : Base_dBytes.t_Cur) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_ExportItem_XBare (dtb_u_u893, Frontend_dAst.v_noNodeRef)); B_dData_dPair.f_Pair_second = dtb_u_u894 })))) else (if (dtb_u_u891 = 1) then ((Base_dBytes.v_thenPair ((Base_dBytes.v_decStr (dtb_u_u889 - 1)) dtb_u_u892)) (fun (dtb_u_u895 : string) (dtb_u_u896 : Base_dBytes.t_Cur) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_ExportItem_XTypeAll (dtb_u_u895, Frontend_dAst.v_noNodeRef)); B_dData_dPair.f_Pair_second = dtb_u_u896 })))) else (if (dtb_u_u891 = 3) then ((Base_dBytes.v_thenPair ((Base_dBytes.v_decStr (dtb_u_u889 - 1)) dtb_u_u892)) (fun (dtb_u_u897 : string) (dtb_u_u898 : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair (((Base_dBytes.v_decList Base_dBytes.v_decStr) (dtb_u_u889 - 1)) dtb_u_u898)) (fun (dtb_u_u899 : string B_dData_dList.t_List) (dtb_u_u900 : Base_dBytes.t_Cur) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_ExportItem_XTypeSome (dtb_u_u897, dtb_u_u899, Frontend_dAst.v_noNodeRef)); B_dData_dPair.f_Pair_second = dtb_u_u900 })))))) else (if (dtb_u_u891 = 2) then ((Base_dBytes.v_thenPair ((Base_dBytes.v_decStr (dtb_u_u889 - 1)) dtb_u_u892)) (fun (dtb_u_u901 : string) (dtb_u_u902 : Base_dBytes.t_Cur) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_ExportItem_XModule (dtb_u_u901, Frontend_dAst.v_noNodeRef)); B_dData_dPair.f_Pair_second = dtb_u_u902 })))) else (if (dtb_u_u891 = 4) then ((Base_dBytes.v_thenPair ((Base_dBytes.v_decStr (dtb_u_u889 - 1)) dtb_u_u892)) (fun (dtb_u_u903 : string) (dtb_u_u904 : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair (((Base_dBytes.v_decMaybe Base_dBytes.v_decStr) (dtb_u_u889 - 1)) dtb_u_u904)) (fun (dtb_u_u905 : string B_dData_dMaybe.t_Maybe) (dtb_u_u906 : Base_dBytes.t_Cur) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_ExportItem_XNamespace (dtb_u_u903, dtb_u_u905, Frontend_dAst.v_noNodeRef)); B_dData_dPair.f_Pair_second = dtb_u_u906 })))))) else B_dData_dMaybe.C_Maybe_Nothing)))))))))

# 1097 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
let v_decExportMembers = (fun (dtb_u_u907 : int) (dtb_u_u908 : Base_dBytes.t_Cur) -> (if (dtb_u_u907 <= 0) then B_dData_dMaybe.C_Maybe_Nothing else ((Base_dBytes.v_thenPair ((Base_dBytes.v_decTag dtb_u_u907) dtb_u_u908)) (fun (dtb_u_u909 : int) (dtb_u_u910 : Base_dBytes.t_Cur) -> (if (dtb_u_u909 = 0) then (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = Frontend_dAst.C_ExportMembers_EMNone; B_dData_dPair.f_Pair_second = dtb_u_u910 })) else (if (dtb_u_u909 = 1) then (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = Frontend_dAst.C_ExportMembers_EMAll; B_dData_dPair.f_Pair_second = dtb_u_u910 })) else (if (dtb_u_u909 = 2) then ((Base_dBytes.v_thenPair (((Base_dBytes.v_decList Base_dBytes.v_decStr) (dtb_u_u907 - 1)) dtb_u_u910)) (fun (dtb_u_u911 : string B_dData_dList.t_List) (dtb_u_u912 : Base_dBytes.t_Cur) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_ExportMembers_EMOnly (dtb_u_u911)); B_dData_dPair.f_Pair_second = dtb_u_u912 })))) else B_dData_dMaybe.C_Maybe_Nothing)))))))

# 1111 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
let v_decExportSpec = (fun (dtb_u_u913 : int) (dtb_u_u914 : Base_dBytes.t_Cur) -> (if (dtb_u_u913 <= 0) then B_dData_dMaybe.C_Maybe_Nothing else ((Base_dBytes.v_thenPair ((Base_dBytes.v_decTag dtb_u_u913) dtb_u_u914)) (fun (dtb_u_u915 : int) (dtb_u_u916 : Base_dBytes.t_Cur) -> (if (dtb_u_u915 = 0) then ((Base_dBytes.v_thenPair ((Base_dBytes.v_decStr (dtb_u_u913 - 1)) dtb_u_u916)) (fun (dtb_u_u917 : string) (dtb_u_u918 : Base_dBytes.t_Cur) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_ExportSpec_ESValue (dtb_u_u917, v_noSpan)); B_dData_dPair.f_Pair_second = dtb_u_u918 })))) else (if (dtb_u_u915 = 1) then ((Base_dBytes.v_thenPair ((Base_dBytes.v_decStr (dtb_u_u913 - 1)) dtb_u_u916)) (fun (dtb_u_u919 : string) (dtb_u_u920 : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair ((v_decExportMembers (dtb_u_u913 - 1)) dtb_u_u920)) (fun (dtb_u_u921 : Frontend_dAst.t_ExportMembers) (dtb_u_u922 : Base_dBytes.t_Cur) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_ExportSpec_ESType (dtb_u_u919, dtb_u_u921, v_noSpan)); B_dData_dPair.f_Pair_second = dtb_u_u922 })))))) else B_dData_dMaybe.C_Maybe_Nothing))))))

# 1124 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
let v_decOpacity = (fun (dtb_u_u923 : int) (dtb_u_u924 : Base_dBytes.t_Cur) -> (if (dtb_u_u923 <= 0) then B_dData_dMaybe.C_Maybe_Nothing else ((Base_dBytes.v_thenPair ((Base_dBytes.v_decTag dtb_u_u923) dtb_u_u924)) (fun (dtb_u_u925 : int) (dtb_u_u926 : Base_dBytes.t_Cur) -> (if (dtb_u_u925 = 0) then (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = Frontend_dAst.C_Opacity_OpacityOpaque; B_dData_dPair.f_Pair_second = dtb_u_u926 })) else (if (dtb_u_u925 = 1) then (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = Frontend_dAst.C_Opacity_OpacityTransparent; B_dData_dPair.f_Pair_second = dtb_u_u926 })) else (if (dtb_u_u925 = 2) then (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = Frontend_dAst.C_Opacity_OpacityAbstract; B_dData_dPair.f_Pair_second = dtb_u_u926 })) else B_dData_dMaybe.C_Maybe_Nothing)))))))

# 1138 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
let v_decOpacitySpec = (fun (dtb_u_u927 : int) (dtb_u_u928 : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair ((Base_dBytes.v_decStr (dtb_u_u927 - 1)) dtb_u_u928)) (fun (dtb_u_u929 : string) (dtb_u_u930 : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair ((v_decOpacity (dtb_u_u927 - 1)) dtb_u_u930)) (fun (dtb_u_u931 : Frontend_dAst.t_Opacity) (dtb_u_u932 : Base_dBytes.t_Cur) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = { Frontend_dAst.f_OpacitySpec_opacityName = dtb_u_u929; Frontend_dAst.f_OpacitySpec_opacityKind = dtb_u_u931; Frontend_dAst.f_OpacitySpec_opacitySpan = v_noSpan }; B_dData_dPair.f_Pair_second = dtb_u_u932 })))))))

# 1145 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
let v_decModDecl = (fun (dtb_u_u933 : int) (dtb_u_u934 : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair ((Base_dBytes.v_decStr (dtb_u_u933 - 1)) dtb_u_u934)) (fun (dtb_u_u935 : string) (dtb_u_u936 : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair ((Base_dBytes.v_decBool (dtb_u_u933 - 1)) dtb_u_u936)) (fun (dtb_u_u937 : bool) (dtb_u_u938 : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair (((Base_dBytes.v_decList v_decExportItem) (dtb_u_u933 - 1)) dtb_u_u938)) (fun (dtb_u_u939 : Frontend_dAst.t_ExportItem B_dData_dList.t_List) (dtb_u_u940 : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair (((Base_dBytes.v_decList v_decExportSpec) (dtb_u_u933 - 1)) dtb_u_u940)) (fun (dtb_u_u941 : Frontend_dAst.t_ExportSpec B_dData_dList.t_List) (dtb_u_u942 : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair (((Base_dBytes.v_decList v_decExportItem) (dtb_u_u933 - 1)) dtb_u_u942)) (fun (dtb_u_u943 : Frontend_dAst.t_ExportItem B_dData_dList.t_List) (dtb_u_u944 : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair (((Base_dBytes.v_decList v_decOpacitySpec) (dtb_u_u933 - 1)) dtb_u_u944)) (fun (dtb_u_u945 : Frontend_dAst.t_OpacitySpec B_dData_dList.t_List) (dtb_u_u946 : Base_dBytes.t_Cur) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = { Frontend_dAst.f_ModDecl_modDeclName = dtb_u_u935; Frontend_dAst.f_ModDecl_modDeclHasExportList = dtb_u_u937; Frontend_dAst.f_ModDecl_modDeclExportItems = dtb_u_u939; Frontend_dAst.f_ModDecl_modDeclExports = dtb_u_u941; Frontend_dAst.f_ModDecl_modDeclReexports = dtb_u_u943; Frontend_dAst.f_ModDecl_modDeclOpacity = dtb_u_u945; Frontend_dAst.f_ModDecl_modDeclRef = Frontend_dAst.v_noNodeRef }; B_dData_dPair.f_Pair_second = dtb_u_u946 })))))))))))))))

# 1151 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
let v_decImportLike = (fun (dtb_u_u947 : int) (dtb_u_u948 : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair ((Base_dBytes.v_decStr (dtb_u_u947 - 1)) dtb_u_u948)) (fun (dtb_u_u949 : string) (dtb_u_u950 : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair ((Base_dBytes.v_decBool (dtb_u_u947 - 1)) dtb_u_u950)) (fun (dtb_u_u951 : bool) (dtb_u_u952 : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair (((Base_dBytes.v_decMaybe Base_dBytes.v_decStr) (dtb_u_u947 - 1)) dtb_u_u952)) (fun (dtb_u_u953 : string B_dData_dMaybe.t_Maybe) (dtb_u_u954 : Base_dBytes.t_Cur) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = { Frontend_dAst.f_Import_importName = dtb_u_u949; Frontend_dAst.f_Import_importIsQualified = dtb_u_u951; Frontend_dAst.f_Import_importAlias = dtb_u_u953; Frontend_dAst.f_Import_importRef = Frontend_dAst.v_noNodeRef }; B_dData_dPair.f_Pair_second = dtb_u_u954 })))))))))

# 1157 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
let v_decFixityLike = (fun (dtb_u_u955 : int) (dtb_u_u956 : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair ((Base_dBytes.v_decStr (dtb_u_u955 - 1)) dtb_u_u956)) (fun (dtb_u_u957 : string) (dtb_u_u958 : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair ((Base_dBytes.v_decInt (dtb_u_u955 - 1)) dtb_u_u958)) (fun (dtb_u_u959 : int) (dtb_u_u960 : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair ((Base_dBytes.v_decInt (dtb_u_u955 - 1)) dtb_u_u960)) (fun (dtb_u_u961 : int) (dtb_u_u962 : Base_dBytes.t_Cur) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = { Frontend_dAst.f_FixityDecl_fixityOp = dtb_u_u957; Frontend_dAst.f_FixityDecl_fixityLevel = dtb_u_u959; Frontend_dAst.f_FixityDecl_fixityAssoc = dtb_u_u961; Frontend_dAst.f_FixityDecl_fixityRef = Frontend_dAst.v_noNodeRef }; B_dData_dPair.f_Pair_second = dtb_u_u962 })))))))))

# 1170 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
let v_decSourceFileGo = (fun (dtb_u_u963 : int) (dtb_u_u964 : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair (((Base_dBytes.v_decMaybe v_decModDecl) (dtb_u_u963 - 1)) dtb_u_u964)) (fun (dtb_u_u965 : Frontend_dAst.t_ModDecl B_dData_dMaybe.t_Maybe) (dtb_u_u966 : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair (((Base_dBytes.v_decList v_decImportLike) (dtb_u_u963 - 1)) dtb_u_u966)) (fun (dtb_u_u967 : Frontend_dAst.t_Import B_dData_dList.t_List) (dtb_u_u968 : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair (((Base_dBytes.v_decList v_decFixityLike) (dtb_u_u963 - 1)) dtb_u_u968)) (fun (dtb_u_u969 : Frontend_dAst.t_FixityDecl B_dData_dList.t_List) (dtb_u_u970 : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair (((Base_dBytes.v_decList v_decDecl) (dtb_u_u963 - 1)) dtb_u_u970)) (fun (dtb_u_u971 : Frontend_dAst.t_Decl B_dData_dList.t_List) (dtb_u_u972 : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair (((Base_dBytes.v_decList v_decExportSpec) (dtb_u_u963 - 1)) dtb_u_u972)) (fun (dtb_u_u973 : Frontend_dAst.t_ExportSpec B_dData_dList.t_List) (dtb_u_u974 : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair (((Base_dBytes.v_decList v_decExportItem) (dtb_u_u963 - 1)) dtb_u_u974)) (fun (dtb_u_u975 : Frontend_dAst.t_ExportItem B_dData_dList.t_List) (dtb_u_u976 : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair (((Base_dBytes.v_decList v_decOpacitySpec) (dtb_u_u963 - 1)) dtb_u_u976)) (fun (dtb_u_u977 : Frontend_dAst.t_OpacitySpec B_dData_dList.t_List) (dtb_u_u978 : Base_dBytes.t_Cur) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = { Frontend_dAst.f_SourceFile_sourceFileModDecl = dtb_u_u965; Frontend_dAst.f_SourceFile_sourceFileImports = dtb_u_u967; Frontend_dAst.f_SourceFile_sourceFileFixities = dtb_u_u969; Frontend_dAst.f_SourceFile_sourceFileDecls = dtb_u_u971; Frontend_dAst.f_SourceFile_sourceFileExports = dtb_u_u973; Frontend_dAst.f_SourceFile_sourceFileReexports = dtb_u_u975; Frontend_dAst.f_SourceFile_sourceFileOpacity = dtb_u_u977 }; B_dData_dPair.f_Pair_second = dtb_u_u978 })))))))))))))))))

# 1164 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
let v_decSourceFileComplete = (fun (dtb_u_u979 : string) -> (let dtb_u_u980 = ((v_decSourceFileGo (String.length dtb_u_u979)) (Base_dBytes.v_curOf dtb_u_u979)) in (match dtb_u_u980 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u981) -> (match dtb_u_u981 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u982; B_dData_dPair.f_Pair_second = dtb_u_u983 } -> (if (Base_dBytes.v_curAtEnd dtb_u_u983) then (B_dData_dMaybe.C_Maybe_Just (dtb_u_u982)) else B_dData_dMaybe.C_Maybe_Nothing)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)))
