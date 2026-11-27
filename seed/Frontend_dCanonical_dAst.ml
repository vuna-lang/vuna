open Vuna_runtime
# 46 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
let v_noSpan = { Base_dSource.f_Span_spanFile = ""; Base_dSource.f_Span_spanStartLine = 0; Base_dSource.f_Span_spanStartCol = 0; Base_dSource.f_Span_spanEndLine = 0; Base_dSource.f_Span_spanEndCol = 0; Base_dSource.f_Span_spanStartOffset = 0; Base_dSource.f_Span_spanEndOffset = 0 }

# 53 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
let v_encQty = (fun (mc0 : Frontend_dAst.t_Qty) (mc1 : string B_dData_dList.t_List) -> (match mc0 with
  | Frontend_dAst.C_Qty_Q1 -> ((Base_dBytes.v_encTag 1) mc1)
  | Frontend_dAst.C_Qty_Q0 -> ((Base_dBytes.v_encTag 0) mc1)
  | _ -> failwith "DT: impossible branch"
))

# 58 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
let v_encReprTier = (fun (mc0 : Frontend_dAst.t_ReprTier) (mc1 : string B_dData_dList.t_List) -> (match mc0 with
  | Frontend_dAst.C_ReprTier_ReprBoxed -> ((Base_dBytes.v_encTag 2) mc1)
  | Frontend_dAst.C_ReprTier_ReprAlias -> ((Base_dBytes.v_encTag 1) mc1)
  | Frontend_dAst.C_ReprTier_ReprAuto -> ((Base_dBytes.v_encTag 0) mc1)
  | _ -> failwith "DT: impossible branch"
))

# 64 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
let v_encMaybeQty = (fun (mc0 : Frontend_dAst.t_Qty B_dData_dMaybe.t_Maybe) (mc1 : string B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__0) -> (B_dData_dList.C_List__x58__x58_ ("1", ((v_encQty dtb__0) mc1)))
  | B_dData_dMaybe.C_Maybe_Nothing -> (B_dData_dList.C_List__x58__x58_ ("0", mc1))
  | _ -> failwith "DT: impossible branch"
))

# 83 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
let rec v_encStrListGo = (fun (mc0 : string B_dData_dList.t_List) (mc1 : string B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__1, dtb__2) -> ((Base_dBytes.v_encStr dtb__1) ((v_encStrListGo dtb__2) mc1))
  | B_dData_dList.C_List_Nil -> mc1
  | _ -> failwith "DT: impossible branch"
))

# 79 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
let v_encStrList = (fun (xs : string B_dData_dList.t_List) (acc : string B_dData_dList.t_List) -> (B_dData_dList.C_List__x58__x58_ ((String.concat "" ["["; (string_of_int (Base_dBytes.v_lenOf xs)); ":"]), ((v_encStrListGo xs) acc))))

# 97 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
let rec v_encPatList = (fun (xs : Frontend_dAst.t_Pat B_dData_dList.t_List) (acc : string B_dData_dList.t_List) -> (B_dData_dList.C_List__x58__x58_ ((String.concat "" ["["; (string_of_int (Base_dBytes.v_lenOf xs)); ":"]), ((v_encPatListGo xs) acc))))
# 101 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
and v_encPatListGo = (fun (mc0 : Frontend_dAst.t_Pat B_dData_dList.t_List) (mc1 : string B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__3, dtb__4) -> ((v_encPat dtb__3) ((v_encPatListGo dtb__4) mc1))
  | B_dData_dList.C_List_Nil -> mc1
  | _ -> failwith "DT: impossible branch"
))
# 173 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
and v_encStrPatList = (fun (xs : (string, Frontend_dAst.t_Pat) B_dData_dPair.t_Pair B_dData_dList.t_List) (acc : string B_dData_dList.t_List) -> (B_dData_dList.C_List__x58__x58_ ((String.concat "" ["["; (string_of_int (Base_dBytes.v_lenOf xs)); ":"]), ((v_encStrPatListGo xs) acc))))
# 177 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
and v_encStrPatListGo = (fun (mc0 : (string, Frontend_dAst.t_Pat) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc1 : string B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__5, dtb__6) -> (match dtb__5 with
  | { B_dData_dPair.f_Pair_first = dtb__7; B_dData_dPair.f_Pair_second = dtb__8 } -> ((Base_dBytes.v_encStr dtb__7) ((v_encPat dtb__8) ((v_encStrPatListGo dtb__6) mc1)))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> mc1
  | _ -> failwith "DT: impossible branch"
))
# 232 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
and v_encPat = (fun (mc0 : Frontend_dAst.t_Pat) (mc1 : string B_dData_dList.t_List) -> (match mc0 with
  | Frontend_dAst.C_Pat_PRecord (dtb__9, dtb__10, dtb__11) -> ((Base_dBytes.v_encTag 6) ((Base_dBytes.v_encStr dtb__9) ((v_encStrPatList dtb__10) mc1)))
  | Frontend_dAst.C_Pat_PStr (dtb__12, dtb__13) -> ((Base_dBytes.v_encTag 5) ((Base_dBytes.v_encStr dtb__12) mc1))
  | Frontend_dAst.C_Pat_PInt (dtb__14, dtb__15) -> ((Base_dBytes.v_encTag 4) ((Base_dBytes.v_encInt dtb__14) mc1))
  | Frontend_dAst.C_Pat_PCon (dtb__16, dtb__17, dtb__18) -> ((Base_dBytes.v_encTag 3) ((Base_dBytes.v_encStr dtb__16) ((v_encPatList dtb__17) mc1)))
  | Frontend_dAst.C_Pat_PWild (dtb__19) -> ((Base_dBytes.v_encTag 2) mc1)
  | Frontend_dAst.C_Pat_PAs (dtb__20, dtb__21, dtb__22) -> ((Base_dBytes.v_encTag 1) ((Base_dBytes.v_encStr dtb__20) ((v_encPat dtb__21) mc1)))
  | Frontend_dAst.C_Pat_PVar (dtb__23, dtb__24) -> ((Base_dBytes.v_encTag 0) ((Base_dBytes.v_encStr dtb__23) mc1))
  | _ -> failwith "DT: impossible branch"
))

# 88 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
let rec v_encExprList = (fun (xs : Frontend_dAst.t_Expr B_dData_dList.t_List) (acc : string B_dData_dList.t_List) -> (B_dData_dList.C_List__x58__x58_ ((String.concat "" ["["; (string_of_int (Base_dBytes.v_lenOf xs)); ":"]), ((v_encExprListGo xs) acc))))
# 92 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
and v_encExprListGo = (fun (mc0 : Frontend_dAst.t_Expr B_dData_dList.t_List) (mc1 : string B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__25, dtb__26) -> ((v_encExpr dtb__25) ((v_encExprListGo dtb__26) mc1))
  | B_dData_dList.C_List_Nil -> mc1
  | _ -> failwith "DT: impossible branch"
))
# 106 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
and v_encPatExprList = (fun (xs : Frontend_dAst.t_Binding B_dData_dList.t_List) (acc : string B_dData_dList.t_List) -> (B_dData_dList.C_List__x58__x58_ ((String.concat "" ["["; (string_of_int (Base_dBytes.v_lenOf xs)); ":"]), ((v_encPatExprListGo xs) acc))))
# 110 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
and v_encPatExprListGo = (fun (mc0 : Frontend_dAst.t_Binding B_dData_dList.t_List) (mc1 : string B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__27, dtb__28) -> ((v_encPat (dtb__27).Frontend_dAst.f_Binding_bindPat) ((v_encBindingSig dtb__27) ((v_encBindingValue (dtb__27).Frontend_dAst.f_Binding_bindValue) ((v_encPatExprListGo dtb__28) mc1))))
  | B_dData_dList.C_List_Nil -> mc1
  | _ -> failwith "DT: impossible branch"
))
# 116 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
and v_encBindingSig = (fun (b : Frontend_dAst.t_Binding) (acc : string B_dData_dList.t_List) -> (match (b).Frontend_dAst.f_Binding_bindSig with
  | B_dData_dMaybe.C_Maybe_Nothing -> ((Base_dBytes.v_encTag 0) acc)
  | B_dData_dMaybe.C_Maybe_Just (dtb__29) -> ((Base_dBytes.v_encTag 1) ((v_encExpr (dtb__29).Frontend_dAst.f_BindingSig_sigType) acc))
  | _ -> failwith "DT: impossible branch"
))
# 123 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
and v_encBindingValue = (fun (mc0 : Frontend_dAst.t_BindingValue) (mc1 : string B_dData_dList.t_List) -> (match mc0 with
  | Frontend_dAst.C_BindingValue_BClauses (dtb__30) -> ((Base_dBytes.v_encTag 1) ((v_encClauses dtb__30) mc1))
  | Frontend_dAst.C_BindingValue_BVal (dtb__31) -> ((Base_dBytes.v_encTag 0) ((v_encExpr dtb__31) mc1))
  | _ -> failwith "DT: impossible branch"
))
# 128 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
and v_encAltList = (fun (xs : Frontend_dAst.t_Alt B_dData_dList.t_List) (acc : string B_dData_dList.t_List) -> (B_dData_dList.C_List__x58__x58_ ((String.concat "" ["["; (string_of_int (Base_dBytes.v_lenOf xs)); ":"]), ((v_encAltListGo xs) acc))))
# 131 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
and v_encAltListGo = (fun (mc0 : Frontend_dAst.t_Alt B_dData_dList.t_List) (mc1 : string B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__32, dtb__33) -> ((v_encPat (dtb__32).Frontend_dAst.f_Alt_altPat) ((v_encExpr (dtb__32).Frontend_dAst.f_Alt_altBody) ((v_encAltListGo dtb__33) mc1)))
  | B_dData_dList.C_List_Nil -> mc1
  | _ -> failwith "DT: impossible branch"
))
# 136 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
and v_encClauses = (fun (xs : Frontend_dAst.t_LocalClause B_dData_dList.t_List) (acc : string B_dData_dList.t_List) -> (B_dData_dList.C_List__x58__x58_ ((String.concat "" ["["; (string_of_int (Base_dBytes.v_lenOf xs)); ":"]), ((v_encClausesGo xs) acc))))
# 140 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
and v_encClausesGo = (fun (mc0 : Frontend_dAst.t_LocalClause B_dData_dList.t_List) (mc1 : string B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__34, dtb__35) -> ((v_encPatList (dtb__34).Frontend_dAst.f_LocalClause_lcPats) ((v_encExpr (dtb__34).Frontend_dAst.f_LocalClause_lcBody) ((v_encClausesGo dtb__35) mc1)))
  | B_dData_dList.C_List_Nil -> mc1
  | _ -> failwith "DT: impossible branch"
))
# 146 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
and v_encStmtList = (fun (xs : Frontend_dAst.t_DoStmt B_dData_dList.t_List) (acc : string B_dData_dList.t_List) -> (B_dData_dList.C_List__x58__x58_ ((String.concat "" ["["; (string_of_int (Base_dBytes.v_lenOf xs)); ":"]), ((v_encStmtListGo xs) acc))))
# 150 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
and v_encStmtListGo = (fun (mc0 : Frontend_dAst.t_DoStmt B_dData_dList.t_List) (mc1 : string B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__36, dtb__37) -> ((v_encDoStmt dtb__36) ((v_encStmtListGo dtb__37) mc1))
  | B_dData_dList.C_List_Nil -> mc1
  | _ -> failwith "DT: impossible branch"
))
# 155 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
and v_encPartList = (fun (xs : Frontend_dAst.t_InterpPart B_dData_dList.t_List) (acc : string B_dData_dList.t_List) -> (B_dData_dList.C_List__x58__x58_ ((String.concat "" ["["; (string_of_int (Base_dBytes.v_lenOf xs)); ":"]), ((v_encPartListGo xs) acc))))
# 159 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
and v_encPartListGo = (fun (mc0 : Frontend_dAst.t_InterpPart B_dData_dList.t_List) (mc1 : string B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__38, dtb__39) -> ((v_encInterpPart dtb__38) ((v_encPartListGo dtb__39) mc1))
  | B_dData_dList.C_List_Nil -> mc1
  | _ -> failwith "DT: impossible branch"
))
# 164 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
and v_encStrExprList = (fun (xs : (string, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (acc : string B_dData_dList.t_List) -> (B_dData_dList.C_List__x58__x58_ ((String.concat "" ["["; (string_of_int (Base_dBytes.v_lenOf xs)); ":"]), ((v_encStrExprListGo xs) acc))))
# 168 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
and v_encStrExprListGo = (fun (mc0 : (string, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc1 : string B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__40, dtb__41) -> (match dtb__40 with
  | { B_dData_dPair.f_Pair_first = dtb__42; B_dData_dPair.f_Pair_second = dtb__43 } -> ((Base_dBytes.v_encStr dtb__42) ((v_encExpr dtb__43) ((v_encStrExprListGo dtb__41) mc1)))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> mc1
  | _ -> failwith "DT: impossible branch"
))
# 227 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
and v_encInterpPart = (fun (mc0 : Frontend_dAst.t_InterpPart) (mc1 : string B_dData_dList.t_List) -> (match mc0 with
  | Frontend_dAst.C_InterpPart_IPHole (dtb__44) -> ((Base_dBytes.v_encTag 1) ((v_encExpr dtb__44) mc1))
  | Frontend_dAst.C_InterpPart_IPText (dtb__45) -> ((Base_dBytes.v_encTag 0) ((Base_dBytes.v_encStr dtb__45) mc1))
  | _ -> failwith "DT: impossible branch"
))
# 242 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
and v_encDoStmt = (fun (mc0 : Frontend_dAst.t_DoStmt) (mc1 : string B_dData_dList.t_List) -> (match mc0 with
  | Frontend_dAst.C_DoStmt_DLet (dtb__46, dtb__47) -> ((Base_dBytes.v_encTag 2) ((v_encPatExprList dtb__46) mc1))
  | Frontend_dAst.C_DoStmt_DExpr (dtb__48, dtb__49) -> ((Base_dBytes.v_encTag 1) ((v_encExpr dtb__48) mc1))
  | Frontend_dAst.C_DoStmt_DBind (dtb__50, dtb__51, dtb__52) -> ((Base_dBytes.v_encTag 0) ((v_encPat dtb__50) ((v_encExpr dtb__51) mc1)))
  | _ -> failwith "DT: impossible branch"
))
# 248 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
and v_encExpr = (fun (mc0 : Frontend_dAst.t_Expr) (mc1 : string B_dData_dList.t_List) -> (match mc0 with
  | Frontend_dAst.C_Expr_EFloat (dtb__53, dtb__54) -> ((Base_dBytes.v_encTag 14) ((Base_dBytes.v_encStr dtb__53) mc1))
  | Frontend_dAst.C_Expr_EInterp (dtb__55, dtb__56) -> ((Base_dBytes.v_encTag 13) ((v_encPartList dtb__55) mc1))
  | Frontend_dAst.C_Expr_EDo (dtb__57, dtb__58) -> ((Base_dBytes.v_encTag 12) ((v_encStmtList dtb__57) mc1))
  | Frontend_dAst.C_Expr_ERecUpdate (dtb__59, dtb__60, dtb__61) -> ((Base_dBytes.v_encTag 11) ((v_encExpr dtb__59) ((v_encStrExprList dtb__60) mc1)))
  | Frontend_dAst.C_Expr_ERecord (dtb__62, dtb__63, dtb__64) -> ((Base_dBytes.v_encTag 10) ((Base_dBytes.v_encStr dtb__62) ((v_encStrExprList dtb__63) mc1)))
  | Frontend_dAst.C_Expr_EField (dtb__65, dtb__66, dtb__67) -> ((Base_dBytes.v_encTag 9) ((v_encExpr dtb__65) ((Base_dBytes.v_encStr dtb__66) mc1)))
  | Frontend_dAst.C_Expr_EIf (dtb__68, dtb__69, dtb__70, dtb__71) -> ((Base_dBytes.v_encTag 8) ((v_encExpr dtb__68) ((v_encExpr dtb__69) ((v_encExpr dtb__70) mc1))))
  | Frontend_dAst.C_Expr_ECase (dtb__72, dtb__73, dtb__74) -> ((Base_dBytes.v_encTag 7) ((v_encExpr dtb__72) ((v_encAltList dtb__73) mc1)))
  | Frontend_dAst.C_Expr_ELet (dtb__75, dtb__76, dtb__77, dtb__78) -> ((Base_dBytes.v_encTag 6) ((v_encPatExprList dtb__75) ((v_encExpr dtb__76) ((Base_dBytes.v_encBool dtb__77) mc1))))
  | Frontend_dAst.C_Expr_EPi (dtb__79, dtb__80, dtb__81, dtb__82, dtb__83, dtb__84) -> ((Base_dBytes.v_encTag 5) ((Base_dBytes.v_encStr dtb__79) ((Base_dBytes.v_encBool dtb__80) ((v_encMaybeQty dtb__81) ((v_encExpr dtb__82) ((v_encExpr dtb__83) mc1))))))
  | Frontend_dAst.C_Expr_EApp (dtb__85, dtb__86, dtb__87) -> ((Base_dBytes.v_encTag 4) ((v_encExpr dtb__85) ((v_encExprList dtb__86) mc1)))
  | Frontend_dAst.C_Expr_ELam (dtb__88, dtb__89, dtb__90) -> ((Base_dBytes.v_encTag 3) ((v_encStrList ((B_dData_dList.v_map B_dData_dPair.v_firstOf) dtb__88)) ((v_encExpr dtb__89) mc1)))
  | Frontend_dAst.C_Expr_EStr (dtb__91, dtb__92) -> ((Base_dBytes.v_encTag 2) ((Base_dBytes.v_encStr dtb__91) mc1))
  | Frontend_dAst.C_Expr_EInt (dtb__93, dtb__94) -> ((Base_dBytes.v_encTag 1) ((Base_dBytes.v_encInt dtb__93) mc1))
  | Frontend_dAst.C_Expr_EVar (dtb__95, dtb__96) -> ((Base_dBytes.v_encTag 0) ((Base_dBytes.v_encStr dtb__95) mc1))
  | _ -> failwith "DT: impossible branch"
))

# 69 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
let v_encMaybeExpr = (fun (mc0 : Frontend_dAst.t_Expr B_dData_dMaybe.t_Maybe) (mc1 : string B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__97) -> (B_dData_dList.C_List__x58__x58_ ("1", ((v_encExpr dtb__97) mc1)))
  | B_dData_dMaybe.C_Maybe_Nothing -> (B_dData_dList.C_List__x58__x58_ ("0", mc1))
  | _ -> failwith "DT: impossible branch"
))

# 268 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
let v_encCtor = (fun (mc0 : Frontend_dAst.t_Ctor) (mc1 : string B_dData_dList.t_List) -> (match mc0 with
  | { Frontend_dAst.f_Ctor_ctorName = dtb__98; Frontend_dAst.f_Ctor_ctorType = dtb__99; Frontend_dAst.f_Ctor_ctorArity = dtb__100; Frontend_dAst.f_Ctor_ctorRef = dtb__101 } -> ((Base_dBytes.v_encTag 0) ((Base_dBytes.v_encStr dtb__98) ((v_encExpr dtb__99) ((Base_dBytes.v_encInt dtb__100) mc1))))
  | _ -> failwith "DT: impossible branch"
))

# 186 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
let rec v_encCtorListGo = (fun (mc0 : Frontend_dAst.t_Ctor B_dData_dList.t_List) (mc1 : string B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__102, dtb__103) -> ((v_encCtor dtb__102) ((v_encCtorListGo dtb__103) mc1))
  | B_dData_dList.C_List_Nil -> mc1
  | _ -> failwith "DT: impossible branch"
))

# 182 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
let v_encCtorList = (fun (xs : Frontend_dAst.t_Ctor B_dData_dList.t_List) (acc : string B_dData_dList.t_List) -> (B_dData_dList.C_List__x58__x58_ ((String.concat "" ["["; (string_of_int (Base_dBytes.v_lenOf xs)); ":"]), ((v_encCtorListGo xs) acc))))

# 272 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
let v_encField = (fun (mc0 : Frontend_dAst.t_Field) (mc1 : string B_dData_dList.t_List) -> (match mc0 with
  | { Frontend_dAst.f_Field_fieldName = dtb__104; Frontend_dAst.f_Field_fieldType = dtb__105; Frontend_dAst.f_Field_fieldRef = dtb__106 } -> ((Base_dBytes.v_encTag 0) ((Base_dBytes.v_encStr dtb__104) ((v_encExpr dtb__105) mc1)))
  | _ -> failwith "DT: impossible branch"
))

# 195 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
let rec v_encFieldListGo = (fun (mc0 : Frontend_dAst.t_Field B_dData_dList.t_List) (mc1 : string B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__107, dtb__108) -> ((v_encField dtb__107) ((v_encFieldListGo dtb__108) mc1))
  | B_dData_dList.C_List_Nil -> mc1
  | _ -> failwith "DT: impossible branch"
))

# 191 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
let v_encFieldList = (fun (xs : Frontend_dAst.t_Field B_dData_dList.t_List) (acc : string B_dData_dList.t_List) -> (B_dData_dList.C_List__x58__x58_ ((String.concat "" ["["; (string_of_int (Base_dBytes.v_lenOf xs)); ":"]), ((v_encFieldListGo xs) acc))))

# 276 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
let v_encTraitParam = (fun (mc0 : Frontend_dAst.t_TraitParam) (mc1 : string B_dData_dList.t_List) -> (match mc0 with
  | { Frontend_dAst.f_TraitParam_traitParamName = dtb__109; Frontend_dAst.f_TraitParam_traitParamKind = dtb__110 } -> ((Base_dBytes.v_encTag 0) ((Base_dBytes.v_encStr dtb__109) ((v_encMaybeExpr dtb__110) mc1)))
  | _ -> failwith "DT: impossible branch"
))

# 204 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
let rec v_encTraitParamListGo = (fun (mc0 : Frontend_dAst.t_TraitParam B_dData_dList.t_List) (mc1 : string B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__111, dtb__112) -> ((v_encTraitParam dtb__111) ((v_encTraitParamListGo dtb__112) mc1))
  | B_dData_dList.C_List_Nil -> mc1
  | _ -> failwith "DT: impossible branch"
))

# 200 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
let v_encTraitParamList = (fun (xs : Frontend_dAst.t_TraitParam B_dData_dList.t_List) (acc : string B_dData_dList.t_List) -> (B_dData_dList.C_List__x58__x58_ ((String.concat "" ["["; (string_of_int (Base_dBytes.v_lenOf xs)); ":"]), ((v_encTraitParamListGo xs) acc))))

# 280 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
let v_encTraitMethod = (fun (mc0 : Frontend_dAst.t_TraitMethod) (mc1 : string B_dData_dList.t_List) -> (match mc0 with
  | { Frontend_dAst.f_TraitMethod_traitMethodName = dtb__113; Frontend_dAst.f_TraitMethod_traitMethodType = dtb__114; Frontend_dAst.f_TraitMethod_traitMethodRef = dtb__115 } -> ((Base_dBytes.v_encTag 0) ((Base_dBytes.v_encStr dtb__113) ((v_encExpr dtb__114) mc1)))
  | _ -> failwith "DT: impossible branch"
))

# 213 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
let rec v_encTraitMethodListGo = (fun (mc0 : Frontend_dAst.t_TraitMethod B_dData_dList.t_List) (mc1 : string B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__116, dtb__117) -> ((v_encTraitMethod dtb__116) ((v_encTraitMethodListGo dtb__117) mc1))
  | B_dData_dList.C_List_Nil -> mc1
  | _ -> failwith "DT: impossible branch"
))

# 209 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
let v_encTraitMethodList = (fun (xs : Frontend_dAst.t_TraitMethod B_dData_dList.t_List) (acc : string B_dData_dList.t_List) -> (B_dData_dList.C_List__x58__x58_ ((String.concat "" ["["; (string_of_int (Base_dBytes.v_lenOf xs)); ":"]), ((v_encTraitMethodListGo xs) acc))))

# 218 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
let rec v_encDecls = (fun (xs : Frontend_dAst.t_Decl B_dData_dList.t_List) (acc : string B_dData_dList.t_List) -> (B_dData_dList.C_List__x58__x58_ ((String.concat "" ["["; (string_of_int (Base_dBytes.v_lenOf xs)); ":"]), ((v_encDeclsGo xs) acc))))
# 222 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
and v_encDeclsGo = (fun (mc0 : Frontend_dAst.t_Decl B_dData_dList.t_List) (mc1 : string B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__118, dtb__119) -> ((v_encDecl dtb__118) ((v_encDeclsGo dtb__119) mc1))
  | B_dData_dList.C_List_Nil -> mc1
  | _ -> failwith "DT: impossible branch"
))
# 284 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
and v_encDecl = (fun (mc0 : Frontend_dAst.t_Decl) (mc1 : string B_dData_dList.t_List) -> (match mc0 with
  | Frontend_dAst.C_Decl_DInstance (dtb__120, dtb__121, dtb__122, dtb__123) -> ((Base_dBytes.v_encTag 7) ((v_encExprList dtb__120) ((v_encExpr dtb__121) ((v_encDecls dtb__122) mc1))))
  | Frontend_dAst.C_Decl_DTrait (dtb__124, dtb__125, dtb__126, dtb__127, dtb__128) -> ((Base_dBytes.v_encTag 6) ((Base_dBytes.v_encStr dtb__124) ((v_encTraitParamList dtb__125) ((v_encExprList dtb__126) ((v_encTraitMethodList dtb__127) mc1)))))
  | Frontend_dAst.C_Decl_DRecord (dtb__129, dtb__130, dtb__131, dtb__132, dtb__133, dtb__134, dtb__135, dtb__136) -> ((Base_dBytes.v_encTag 5) ((Base_dBytes.v_encStr dtb__129) ((v_encStrList dtb__130) ((v_encFieldList dtb__131) ((v_encStrList dtb__132) ((Base_dBytes.v_encBool dtb__133) ((v_encReprTier dtb__134) ((Base_dBytes.v_encBool dtb__135) mc1))))))))
  | Frontend_dAst.C_Decl_DFun (dtb__137, dtb__138, dtb__139, dtb__140) -> ((Base_dBytes.v_encTag 4) ((Base_dBytes.v_encStr dtb__137) ((v_encPatList dtb__138) ((v_encExpr dtb__139) mc1))))
  | Frontend_dAst.C_Decl_DSig (dtb__141, dtb__142, dtb__143, dtb__144) -> ((Base_dBytes.v_encTag 3) ((Base_dBytes.v_encStr dtb__141) ((v_encExprList dtb__142) ((v_encExpr dtb__143) mc1))))
  | Frontend_dAst.C_Decl_DExtern (dtb__145, dtb__146, dtb__147, dtb__148) -> ((Base_dBytes.v_encTag 2) ((Base_dBytes.v_encStr dtb__145) ((Base_dBytes.v_encStr dtb__146) ((v_encExpr dtb__147) mc1))))
  | Frontend_dAst.C_Decl_DAxiom (dtb__149, dtb__150, dtb__151) -> ((Base_dBytes.v_encTag 1) ((Base_dBytes.v_encStr dtb__149) ((v_encExpr dtb__150) mc1)))
  | Frontend_dAst.C_Decl_DData (dtb__152, dtb__153, dtb__154, dtb__155, dtb__156, dtb__157, dtb__158, dtb__159, dtb__160) -> ((Base_dBytes.v_encTag 0) ((Base_dBytes.v_encStr dtb__152) ((v_encStrList dtb__153) ((v_encExpr dtb__154) ((v_encCtorList dtb__155) ((v_encStrList dtb__156) ((Base_dBytes.v_encBool dtb__157) ((v_encReprTier dtb__158) ((Base_dBytes.v_encBool dtb__159) mc1)))))))))
  | _ -> failwith "DT: impossible branch"
))

# 308 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
let v_decQty = (fun (fuel : int) (bytes : Base_dBytes.t_Cur) -> (if (fuel <= 0) then B_dData_dMaybe.C_Maybe_Nothing else (let nd_uscrut2 = ((Base_dBytes.v_decTag fuel) bytes) in (match nd_uscrut2 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__161) -> (match dtb__161 with
  | { B_dData_dPair.f_Pair_first = dtb__162; B_dData_dPair.f_Pair_second = dtb__163 } -> (if (dtb__162 = 0) then (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = Frontend_dAst.C_Qty_Q0; B_dData_dPair.f_Pair_second = dtb__163 })) else (if (dtb__162 = 1) then (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = Frontend_dAst.C_Qty_Q1; B_dData_dPair.f_Pair_second = dtb__163 })) else B_dData_dMaybe.C_Maybe_Nothing))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))))

# 322 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
let v_decReprTier = (fun (fuel : int) (bytes : Base_dBytes.t_Cur) -> (if (fuel <= 0) then B_dData_dMaybe.C_Maybe_Nothing else (let nd_uscrut2 = ((Base_dBytes.v_decTag fuel) bytes) in (match nd_uscrut2 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__164) -> (match dtb__164 with
  | { B_dData_dPair.f_Pair_first = dtb__165; B_dData_dPair.f_Pair_second = dtb__166 } -> (if (dtb__165 = 0) then (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = Frontend_dAst.C_ReprTier_ReprAuto; B_dData_dPair.f_Pair_second = dtb__166 })) else (if (dtb__165 = 1) then (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = Frontend_dAst.C_ReprTier_ReprAlias; B_dData_dPair.f_Pair_second = dtb__166 })) else (if (dtb__165 = 2) then (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = Frontend_dAst.C_ReprTier_ReprBoxed; B_dData_dPair.f_Pair_second = dtb__166 })) else B_dData_dMaybe.C_Maybe_Nothing)))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))))

# 337 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
let v_decMaybeQty = (fun (fuel : int) (bytes : Base_dBytes.t_Cur) -> (((Base_dBytes.v_decMaybe v_decQty) fuel) bytes))

# 859 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
let rec v_decListDigits = (fun (fuel : int) (acc : int) (c : Base_dBytes.t_Cur) -> (if (fuel <= 0) then B_dData_dMaybe.C_Maybe_Nothing else (match (Base_dBytes.v_curChar c) with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb__167) -> (if (dtb__167 = 58) then (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = acc; B_dData_dPair.f_Pair_second = (Base_dBytes.v_curSkip c) })) else (if (if (dtb__167 >= 48) then (dtb__167 <= 57) else false) then (((v_decListDigits (fuel - 1)) ((acc * 10) + (dtb__167 - 48))) (Base_dBytes.v_curSkip c)) else B_dData_dMaybe.C_Maybe_Nothing))
  | _ -> failwith "DT: impossible branch"
)))

# 849 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
let v_decListHead = (fun (fuel : int) (c : Base_dBytes.t_Cur) -> (if (fuel <= 0) then B_dData_dMaybe.C_Maybe_Nothing else (let nd_uscrut2 = (Base_dBytes.v_curChar c) in (match nd_uscrut2 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__168) -> (if (dtb__168 = 91) then (((v_decListDigits (fuel - 1)) 0) (Base_dBytes.v_curSkip c)) else B_dData_dMaybe.C_Maybe_Nothing)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
))))

# 365 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
let rec v_decPat = (fun (fuel : int) (bytes : Base_dBytes.t_Cur) -> (if (fuel <= 0) then B_dData_dMaybe.C_Maybe_Nothing else (let nd_uscrut2 = ((Base_dBytes.v_decTag fuel) bytes) in (match nd_uscrut2 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__169) -> (match dtb__169 with
  | { B_dData_dPair.f_Pair_first = dtb__170; B_dData_dPair.f_Pair_second = dtb__171 } -> (if (dtb__170 = 0) then (let nd_uscrut9 = ((Base_dBytes.v_decStr (fuel - 1)) dtb__171) in (match nd_uscrut9 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__172) -> (match dtb__172 with
  | { B_dData_dPair.f_Pair_first = dtb__173; B_dData_dPair.f_Pair_second = dtb__174 } -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Pat_PVar (dtb__173, (Frontend_dAst.v_detachedNodeRef v_noSpan))); B_dData_dPair.f_Pair_second = dtb__174 }))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) else (if (dtb__170 = 1) then (let nd_uscrut9 = ((Base_dBytes.v_decStr (fuel - 1)) dtb__171) in (match nd_uscrut9 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__175) -> (match dtb__175 with
  | { B_dData_dPair.f_Pair_first = dtb__176; B_dData_dPair.f_Pair_second = dtb__177 } -> (let nd_uscrut16 = ((v_decPat (fuel - 1)) dtb__177) in (match nd_uscrut16 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__178) -> (match dtb__178 with
  | { B_dData_dPair.f_Pair_first = dtb__179; B_dData_dPair.f_Pair_second = dtb__180 } -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Pat_PAs (dtb__176, dtb__179, (Frontend_dAst.v_detachedNodeRef v_noSpan))); B_dData_dPair.f_Pair_second = dtb__180 }))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) else (if (dtb__170 = 2) then (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Pat_PWild ((Frontend_dAst.v_detachedNodeRef v_noSpan))); B_dData_dPair.f_Pair_second = dtb__171 })) else (if (dtb__170 = 3) then (let nd_uscrut9 = ((Base_dBytes.v_decStr (fuel - 1)) dtb__171) in (match nd_uscrut9 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__181) -> (match dtb__181 with
  | { B_dData_dPair.f_Pair_first = dtb__182; B_dData_dPair.f_Pair_second = dtb__183 } -> (let nd_uscrut16 = ((v_decPatList (fuel - 1)) dtb__183) in (match nd_uscrut16 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__184) -> (match dtb__184 with
  | { B_dData_dPair.f_Pair_first = dtb__185; B_dData_dPair.f_Pair_second = dtb__186 } -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Pat_PCon (dtb__182, dtb__185, (Frontend_dAst.v_detachedNodeRef v_noSpan))); B_dData_dPair.f_Pair_second = dtb__186 }))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) else (if (dtb__170 = 4) then (let nd_uscrut9 = ((Base_dBytes.v_decInt (fuel - 1)) dtb__171) in (match nd_uscrut9 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__187) -> (match dtb__187 with
  | { B_dData_dPair.f_Pair_first = dtb__188; B_dData_dPair.f_Pair_second = dtb__189 } -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Pat_PInt (dtb__188, (Frontend_dAst.v_detachedNodeRef v_noSpan))); B_dData_dPair.f_Pair_second = dtb__189 }))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) else (if (dtb__170 = 5) then (let nd_uscrut9 = ((Base_dBytes.v_decStr (fuel - 1)) dtb__171) in (match nd_uscrut9 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__190) -> (match dtb__190 with
  | { B_dData_dPair.f_Pair_first = dtb__191; B_dData_dPair.f_Pair_second = dtb__192 } -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Pat_PStr (dtb__191, (Frontend_dAst.v_detachedNodeRef v_noSpan))); B_dData_dPair.f_Pair_second = dtb__192 }))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) else (if (dtb__170 = 6) then (let nd_uscrut9 = ((Base_dBytes.v_decStr (fuel - 1)) dtb__171) in (match nd_uscrut9 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__193) -> (match dtb__193 with
  | { B_dData_dPair.f_Pair_first = dtb__194; B_dData_dPair.f_Pair_second = dtb__195 } -> (let nd_uscrut16 = (((Base_dBytes.v_decList v_decStrPat) (fuel - 1)) dtb__195) in (match nd_uscrut16 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__196) -> (match dtb__196 with
  | { B_dData_dPair.f_Pair_first = dtb__197; B_dData_dPair.f_Pair_second = dtb__198 } -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Pat_PRecord (dtb__194, dtb__197, (Frontend_dAst.v_detachedNodeRef v_noSpan))); B_dData_dPair.f_Pair_second = dtb__198 }))
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
and v_decStrPat = (fun (fuel : int) (bytes : Base_dBytes.t_Cur) -> (if (fuel <= 0) then B_dData_dMaybe.C_Maybe_Nothing else (let nd_uscrut2 = ((Base_dBytes.v_decStr (fuel - 1)) bytes) in (match nd_uscrut2 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__199) -> (match dtb__199 with
  | { B_dData_dPair.f_Pair_first = dtb__200; B_dData_dPair.f_Pair_second = dtb__201 } -> (let nd_uscrut9 = ((v_decPat (fuel - 1)) dtb__201) in (match nd_uscrut9 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__202) -> (match dtb__202 with
  | { B_dData_dPair.f_Pair_first = dtb__203; B_dData_dPair.f_Pair_second = dtb__204 } -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = { B_dData_dPair.f_Pair_first = dtb__200; B_dData_dPair.f_Pair_second = dtb__203 }; B_dData_dPair.f_Pair_second = dtb__204 }))
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
and v_decPatList = (fun (fuel : int) (bytes : Base_dBytes.t_Cur) -> (if (fuel <= 0) then B_dData_dMaybe.C_Maybe_Nothing else (let nd_uscrut2 = ((v_decListHead fuel) bytes) in (match nd_uscrut2 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__205) -> (match dtb__205 with
  | { B_dData_dPair.f_Pair_first = dtb__206; B_dData_dPair.f_Pair_second = dtb__207 } -> ((((v_decPatListItems (fuel - 1)) dtb__206) dtb__207) B_dData_dList.C_List_Nil)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))))
# 906 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
and v_decPatListItems = (fun (fuel : int) (n : int) (bytes : Base_dBytes.t_Cur) (acc : Frontend_dAst.t_Pat B_dData_dList.t_List) -> (if (fuel <= 0) then B_dData_dMaybe.C_Maybe_Nothing else (if (n <= 0) then (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (B_dData_dList.v_reverse acc); B_dData_dPair.f_Pair_second = bytes })) else (let nd_uscrut4 = ((v_decPat (fuel - 1)) bytes) in (match nd_uscrut4 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__208) -> (match dtb__208 with
  | { B_dData_dPair.f_Pair_first = dtb__209; B_dData_dPair.f_Pair_second = dtb__210 } -> ((((v_decPatListItems (fuel - 1)) (n - 1)) dtb__210) (B_dData_dList.C_List__x58__x58_ (dtb__209, acc)))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)))))

# 345 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
let rec v_decInterpPart = (fun (fuel : int) (bytes : Base_dBytes.t_Cur) -> (if (fuel <= 0) then B_dData_dMaybe.C_Maybe_Nothing else (let nd_uscrut2 = ((Base_dBytes.v_decTag fuel) bytes) in (match nd_uscrut2 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__211) -> (match dtb__211 with
  | { B_dData_dPair.f_Pair_first = dtb__212; B_dData_dPair.f_Pair_second = dtb__213 } -> (if (dtb__212 = 0) then (let nd_uscrut9 = ((Base_dBytes.v_decStr (fuel - 1)) dtb__213) in (match nd_uscrut9 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__214) -> (match dtb__214 with
  | { B_dData_dPair.f_Pair_first = dtb__215; B_dData_dPair.f_Pair_second = dtb__216 } -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_InterpPart_IPText (dtb__215)); B_dData_dPair.f_Pair_second = dtb__216 }))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) else (if (dtb__212 = 1) then (let nd_uscrut9 = ((v_decExpr (fuel - 1)) dtb__213) in (match nd_uscrut9 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__217) -> (match dtb__217 with
  | { B_dData_dPair.f_Pair_first = dtb__218; B_dData_dPair.f_Pair_second = dtb__219 } -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_InterpPart_IPHole (dtb__218)); B_dData_dPair.f_Pair_second = dtb__219 }))
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
and v_decDoStmt = (fun (fuel : int) (bytes : Base_dBytes.t_Cur) -> (if (fuel <= 0) then B_dData_dMaybe.C_Maybe_Nothing else (let nd_uscrut2 = ((Base_dBytes.v_decTag fuel) bytes) in (match nd_uscrut2 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__220) -> (match dtb__220 with
  | { B_dData_dPair.f_Pair_first = dtb__221; B_dData_dPair.f_Pair_second = dtb__222 } -> (if (dtb__221 = 0) then (let nd_uscrut9 = ((v_decPat (fuel - 1)) dtb__222) in (match nd_uscrut9 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__223) -> (match dtb__223 with
  | { B_dData_dPair.f_Pair_first = dtb__224; B_dData_dPair.f_Pair_second = dtb__225 } -> (let nd_uscrut16 = ((v_decExpr (fuel - 1)) dtb__225) in (match nd_uscrut16 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__226) -> (match dtb__226 with
  | { B_dData_dPair.f_Pair_first = dtb__227; B_dData_dPair.f_Pair_second = dtb__228 } -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_DoStmt_DBind (dtb__224, dtb__227, Frontend_dAst.v_noNodeRef)); B_dData_dPair.f_Pair_second = dtb__228 }))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) else (if (dtb__221 = 1) then (let nd_uscrut9 = ((v_decExpr (fuel - 1)) dtb__222) in (match nd_uscrut9 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__229) -> (match dtb__229 with
  | { B_dData_dPair.f_Pair_first = dtb__230; B_dData_dPair.f_Pair_second = dtb__231 } -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_DoStmt_DExpr (dtb__230, Frontend_dAst.v_noNodeRef)); B_dData_dPair.f_Pair_second = dtb__231 }))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) else (if (dtb__221 = 2) then (let nd_uscrut9 = (((Base_dBytes.v_decList v_decBinding) (fuel - 1)) dtb__222) in (match nd_uscrut9 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__232) -> (match dtb__232 with
  | { B_dData_dPair.f_Pair_first = dtb__233; B_dData_dPair.f_Pair_second = dtb__234 } -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_DoStmt_DLet (dtb__233, Frontend_dAst.v_noNodeRef)); B_dData_dPair.f_Pair_second = dtb__234 }))
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
and v_decExpr = (fun (fuel : int) (bytes : Base_dBytes.t_Cur) -> (if (fuel <= 0) then B_dData_dMaybe.C_Maybe_Nothing else (let nd_uscrut2 = ((Base_dBytes.v_decTag fuel) bytes) in (match nd_uscrut2 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__235) -> (match dtb__235 with
  | { B_dData_dPair.f_Pair_first = dtb__236; B_dData_dPair.f_Pair_second = dtb__237 } -> (if (dtb__236 = 0) then (let nd_uscrut9 = ((Base_dBytes.v_decStr (fuel - 1)) dtb__237) in (match nd_uscrut9 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__238) -> (match dtb__238 with
  | { B_dData_dPair.f_Pair_first = dtb__239; B_dData_dPair.f_Pair_second = dtb__240 } -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Expr_EVar (dtb__239, (Frontend_dAst.v_detachedNodeRef v_noSpan))); B_dData_dPair.f_Pair_second = dtb__240 }))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) else (if (dtb__236 = 1) then (let nd_uscrut9 = ((Base_dBytes.v_decInt (fuel - 1)) dtb__237) in (match nd_uscrut9 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__241) -> (match dtb__241 with
  | { B_dData_dPair.f_Pair_first = dtb__242; B_dData_dPair.f_Pair_second = dtb__243 } -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Expr_EInt (dtb__242, (Frontend_dAst.v_detachedNodeRef v_noSpan))); B_dData_dPair.f_Pair_second = dtb__243 }))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) else (if (dtb__236 = 2) then (let nd_uscrut9 = ((Base_dBytes.v_decStr (fuel - 1)) dtb__237) in (match nd_uscrut9 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__244) -> (match dtb__244 with
  | { B_dData_dPair.f_Pair_first = dtb__245; B_dData_dPair.f_Pair_second = dtb__246 } -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Expr_EStr (dtb__245, (Frontend_dAst.v_detachedNodeRef v_noSpan))); B_dData_dPair.f_Pair_second = dtb__246 }))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) else (if (dtb__236 = 3) then (let nd_uscrut9 = (((Base_dBytes.v_decList Base_dBytes.v_decStr) (fuel - 1)) dtb__237) in (match nd_uscrut9 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__247) -> (match dtb__247 with
  | { B_dData_dPair.f_Pair_first = dtb__248; B_dData_dPair.f_Pair_second = dtb__249 } -> (let nd_uscrut16 = ((v_decExpr (fuel - 1)) dtb__249) in (match nd_uscrut16 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__250) -> (match dtb__250 with
  | { B_dData_dPair.f_Pair_first = dtb__251; B_dData_dPair.f_Pair_second = dtb__252 } -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Expr_ELam (((B_dData_dList.v_map (fun (n : string) -> { B_dData_dPair.f_Pair_first = (Obj.magic n); B_dData_dPair.f_Pair_second = v_noSpan })) dtb__248), dtb__251, (Frontend_dAst.v_detachedNodeRef v_noSpan))); B_dData_dPair.f_Pair_second = dtb__252 }))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) else (if (dtb__236 = 4) then (let nd_uscrut9 = ((v_decExpr (fuel - 1)) dtb__237) in (match nd_uscrut9 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__253) -> (match dtb__253 with
  | { B_dData_dPair.f_Pair_first = dtb__254; B_dData_dPair.f_Pair_second = dtb__255 } -> (let nd_uscrut16 = ((v_decExprList (fuel - 1)) dtb__255) in (match nd_uscrut16 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__256) -> (match dtb__256 with
  | { B_dData_dPair.f_Pair_first = dtb__257; B_dData_dPair.f_Pair_second = dtb__258 } -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Expr_EApp (dtb__254, dtb__257, (Frontend_dAst.v_detachedNodeRef v_noSpan))); B_dData_dPair.f_Pair_second = dtb__258 }))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) else (if (dtb__236 = 5) then (let nd_uscrut9 = ((Base_dBytes.v_decStr (fuel - 1)) dtb__237) in (match nd_uscrut9 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__259) -> (match dtb__259 with
  | { B_dData_dPair.f_Pair_first = dtb__260; B_dData_dPair.f_Pair_second = dtb__261 } -> (let nd_uscrut16 = ((Base_dBytes.v_decBool (fuel - 1)) dtb__261) in (match nd_uscrut16 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__262) -> (match dtb__262 with
  | { B_dData_dPair.f_Pair_first = dtb__263; B_dData_dPair.f_Pair_second = dtb__264 } -> (let nd_uscrut23 = (((Base_dBytes.v_decMaybe v_decQty) (fuel - 1)) dtb__264) in (match nd_uscrut23 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__265) -> (match dtb__265 with
  | { B_dData_dPair.f_Pair_first = dtb__266; B_dData_dPair.f_Pair_second = dtb__267 } -> (let nd_uscrut30 = ((v_decExpr (fuel - 1)) dtb__267) in (match nd_uscrut30 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__268) -> (match dtb__268 with
  | { B_dData_dPair.f_Pair_first = dtb__269; B_dData_dPair.f_Pair_second = dtb__270 } -> (let nd_uscrut37 = ((v_decExpr (fuel - 1)) dtb__270) in (match nd_uscrut37 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__271) -> (match dtb__271 with
  | { B_dData_dPair.f_Pair_first = dtb__272; B_dData_dPair.f_Pair_second = dtb__273 } -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Expr_EPi (dtb__260, dtb__263, dtb__266, dtb__269, dtb__272, (Frontend_dAst.v_detachedNodeRef v_noSpan))); B_dData_dPair.f_Pair_second = dtb__273 }))
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
)) else (if (dtb__236 = 6) then (let nd_uscrut9 = (((Base_dBytes.v_decList v_decBinding) (fuel - 1)) dtb__237) in (match nd_uscrut9 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__274) -> (match dtb__274 with
  | { B_dData_dPair.f_Pair_first = dtb__275; B_dData_dPair.f_Pair_second = dtb__276 } -> (let nd_uscrut16 = ((v_decExpr (fuel - 1)) dtb__276) in (match nd_uscrut16 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__277) -> (match dtb__277 with
  | { B_dData_dPair.f_Pair_first = dtb__278; B_dData_dPair.f_Pair_second = dtb__279 } -> (let nd_uscrut23 = ((Base_dBytes.v_decBool (fuel - 1)) dtb__279) in (match nd_uscrut23 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__280) -> (match dtb__280 with
  | { B_dData_dPair.f_Pair_first = dtb__281; B_dData_dPair.f_Pair_second = dtb__282 } -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Expr_ELet (dtb__275, dtb__278, dtb__281, (Frontend_dAst.v_detachedNodeRef v_noSpan))); B_dData_dPair.f_Pair_second = dtb__282 }))
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
)) else (if (dtb__236 = 7) then (let nd_uscrut9 = ((v_decExpr (fuel - 1)) dtb__237) in (match nd_uscrut9 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__283) -> (match dtb__283 with
  | { B_dData_dPair.f_Pair_first = dtb__284; B_dData_dPair.f_Pair_second = dtb__285 } -> (let nd_uscrut16 = (((Base_dBytes.v_decList v_decAlt) (fuel - 1)) dtb__285) in (match nd_uscrut16 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__286) -> (match dtb__286 with
  | { B_dData_dPair.f_Pair_first = dtb__287; B_dData_dPair.f_Pair_second = dtb__288 } -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Expr_ECase (dtb__284, dtb__287, (Frontend_dAst.v_detachedNodeRef v_noSpan))); B_dData_dPair.f_Pair_second = dtb__288 }))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) else (if (dtb__236 = 8) then (let nd_uscrut9 = ((v_decExpr (fuel - 1)) dtb__237) in (match nd_uscrut9 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__289) -> (match dtb__289 with
  | { B_dData_dPair.f_Pair_first = dtb__290; B_dData_dPair.f_Pair_second = dtb__291 } -> (let nd_uscrut16 = ((v_decExpr (fuel - 1)) dtb__291) in (match nd_uscrut16 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__292) -> (match dtb__292 with
  | { B_dData_dPair.f_Pair_first = dtb__293; B_dData_dPair.f_Pair_second = dtb__294 } -> (let nd_uscrut23 = ((v_decExpr (fuel - 1)) dtb__294) in (match nd_uscrut23 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__295) -> (match dtb__295 with
  | { B_dData_dPair.f_Pair_first = dtb__296; B_dData_dPair.f_Pair_second = dtb__297 } -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Expr_EIf (dtb__290, dtb__293, dtb__296, (Frontend_dAst.v_detachedNodeRef v_noSpan))); B_dData_dPair.f_Pair_second = dtb__297 }))
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
)) else (if (dtb__236 = 9) then (let nd_uscrut9 = ((v_decExpr (fuel - 1)) dtb__237) in (match nd_uscrut9 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__298) -> (match dtb__298 with
  | { B_dData_dPair.f_Pair_first = dtb__299; B_dData_dPair.f_Pair_second = dtb__300 } -> (let nd_uscrut16 = ((Base_dBytes.v_decStr (fuel - 1)) dtb__300) in (match nd_uscrut16 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__301) -> (match dtb__301 with
  | { B_dData_dPair.f_Pair_first = dtb__302; B_dData_dPair.f_Pair_second = dtb__303 } -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Expr_EField (dtb__299, dtb__302, (Frontend_dAst.v_detachedNodeRef v_noSpan))); B_dData_dPair.f_Pair_second = dtb__303 }))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) else (if (dtb__236 = 10) then (let nd_uscrut9 = ((Base_dBytes.v_decStr (fuel - 1)) dtb__237) in (match nd_uscrut9 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__304) -> (match dtb__304 with
  | { B_dData_dPair.f_Pair_first = dtb__305; B_dData_dPair.f_Pair_second = dtb__306 } -> (let nd_uscrut16 = (((Base_dBytes.v_decList v_decStrExpr) (fuel - 1)) dtb__306) in (match nd_uscrut16 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__307) -> (match dtb__307 with
  | { B_dData_dPair.f_Pair_first = dtb__308; B_dData_dPair.f_Pair_second = dtb__309 } -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Expr_ERecord (dtb__305, dtb__308, (Frontend_dAst.v_detachedNodeRef v_noSpan))); B_dData_dPair.f_Pair_second = dtb__309 }))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) else (if (dtb__236 = 11) then (let nd_uscrut9 = ((v_decExpr (fuel - 1)) dtb__237) in (match nd_uscrut9 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__310) -> (match dtb__310 with
  | { B_dData_dPair.f_Pair_first = dtb__311; B_dData_dPair.f_Pair_second = dtb__312 } -> (let nd_uscrut16 = (((Base_dBytes.v_decList v_decStrExpr) (fuel - 1)) dtb__312) in (match nd_uscrut16 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__313) -> (match dtb__313 with
  | { B_dData_dPair.f_Pair_first = dtb__314; B_dData_dPair.f_Pair_second = dtb__315 } -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Expr_ERecUpdate (dtb__311, dtb__314, (Frontend_dAst.v_detachedNodeRef v_noSpan))); B_dData_dPair.f_Pair_second = dtb__315 }))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) else (if (dtb__236 = 12) then (let nd_uscrut9 = (((Base_dBytes.v_decList v_decDoStmt) (fuel - 1)) dtb__237) in (match nd_uscrut9 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__316) -> (match dtb__316 with
  | { B_dData_dPair.f_Pair_first = dtb__317; B_dData_dPair.f_Pair_second = dtb__318 } -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Expr_EDo (dtb__317, (Frontend_dAst.v_detachedNodeRef v_noSpan))); B_dData_dPair.f_Pair_second = dtb__318 }))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) else (if (dtb__236 = 13) then (let nd_uscrut9 = (((Base_dBytes.v_decList v_decInterpPart) (fuel - 1)) dtb__237) in (match nd_uscrut9 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__319) -> (match dtb__319 with
  | { B_dData_dPair.f_Pair_first = dtb__320; B_dData_dPair.f_Pair_second = dtb__321 } -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Expr_EInterp (dtb__320, (Frontend_dAst.v_detachedNodeRef v_noSpan))); B_dData_dPair.f_Pair_second = dtb__321 }))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) else (if (dtb__236 = 14) then (let nd_uscrut9 = ((Base_dBytes.v_decStr (fuel - 1)) dtb__237) in (match nd_uscrut9 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__322) -> (match dtb__322 with
  | { B_dData_dPair.f_Pair_first = dtb__323; B_dData_dPair.f_Pair_second = dtb__324 } -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Expr_EFloat (dtb__323, (Frontend_dAst.v_detachedNodeRef v_noSpan))); B_dData_dPair.f_Pair_second = dtb__324 }))
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
and v_decBinding = (fun (fuel : int) (bytes : Base_dBytes.t_Cur) -> (if (fuel <= 0) then B_dData_dMaybe.C_Maybe_Nothing else (let nd_uscrut2 = ((v_decPat (fuel - 1)) bytes) in (match nd_uscrut2 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__325) -> (match dtb__325 with
  | { B_dData_dPair.f_Pair_first = dtb__326; B_dData_dPair.f_Pair_second = dtb__327 } -> (let nd_uscrut9 = ((Base_dBytes.v_decTag fuel) dtb__327) in (match nd_uscrut9 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__328) -> (match dtb__328 with
  | { B_dData_dPair.f_Pair_first = dtb__329; B_dData_dPair.f_Pair_second = dtb__330 } -> (if (dtb__329 = 0) then (let nd_uscrut16 = ((v_decBindingValue (fuel - 1)) dtb__330) in (match nd_uscrut16 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__331) -> (match dtb__331 with
  | { B_dData_dPair.f_Pair_first = dtb__332; B_dData_dPair.f_Pair_second = dtb__333 } -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = { Frontend_dAst.f_Binding_bindPat = dtb__326; Frontend_dAst.f_Binding_bindValue = dtb__332; Frontend_dAst.f_Binding_bindSig = B_dData_dMaybe.C_Maybe_Nothing; Frontend_dAst.f_Binding_bindRef = Frontend_dAst.v_noNodeRef }; B_dData_dPair.f_Pair_second = dtb__333 }))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) else (if (dtb__329 = 1) then (let nd_uscrut16 = ((v_decExpr (fuel - 1)) dtb__330) in (match nd_uscrut16 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__334) -> (match dtb__334 with
  | { B_dData_dPair.f_Pair_first = dtb__335; B_dData_dPair.f_Pair_second = dtb__336 } -> (let nd_uscrut23 = ((v_decBindingValue (fuel - 1)) dtb__336) in (match nd_uscrut23 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__337) -> (match dtb__337 with
  | { B_dData_dPair.f_Pair_first = dtb__338; B_dData_dPair.f_Pair_second = dtb__339 } -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = { Frontend_dAst.f_Binding_bindPat = dtb__326; Frontend_dAst.f_Binding_bindValue = dtb__338; Frontend_dAst.f_Binding_bindSig = (B_dData_dMaybe.C_Maybe_Just ({ Frontend_dAst.f_BindingSig_sigType = dtb__335; Frontend_dAst.f_BindingSig_sigRef = Frontend_dAst.v_noNodeRef })); Frontend_dAst.f_Binding_bindRef = Frontend_dAst.v_noNodeRef }; B_dData_dPair.f_Pair_second = dtb__339 }))
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
and v_decBindingValue = (fun (fuel : int) (bytes : Base_dBytes.t_Cur) -> (if (fuel <= 0) then B_dData_dMaybe.C_Maybe_Nothing else (let nd_uscrut2 = ((Base_dBytes.v_decTag fuel) bytes) in (match nd_uscrut2 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__340) -> (match dtb__340 with
  | { B_dData_dPair.f_Pair_first = dtb__341; B_dData_dPair.f_Pair_second = dtb__342 } -> (if (dtb__341 = 0) then (let nd_uscrut9 = ((v_decExpr (fuel - 1)) dtb__342) in (match nd_uscrut9 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__343) -> (match dtb__343 with
  | { B_dData_dPair.f_Pair_first = dtb__344; B_dData_dPair.f_Pair_second = dtb__345 } -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_BindingValue_BVal (dtb__344)); B_dData_dPair.f_Pair_second = dtb__345 }))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) else (if (dtb__341 = 1) then (let nd_uscrut9 = (((Base_dBytes.v_decList v_decClause) (fuel - 1)) dtb__342) in (match nd_uscrut9 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__346) -> (match dtb__346 with
  | { B_dData_dPair.f_Pair_first = dtb__347; B_dData_dPair.f_Pair_second = dtb__348 } -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_BindingValue_BClauses (dtb__347)); B_dData_dPair.f_Pair_second = dtb__348 }))
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
and v_decAlt = (fun (fuel : int) (bytes : Base_dBytes.t_Cur) -> (if (fuel <= 0) then B_dData_dMaybe.C_Maybe_Nothing else (let nd_uscrut2 = ((v_decPat (fuel - 1)) bytes) in (match nd_uscrut2 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__349) -> (match dtb__349 with
  | { B_dData_dPair.f_Pair_first = dtb__350; B_dData_dPair.f_Pair_second = dtb__351 } -> (let nd_uscrut9 = ((v_decExpr (fuel - 1)) dtb__351) in (match nd_uscrut9 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__352) -> (match dtb__352 with
  | { B_dData_dPair.f_Pair_first = dtb__353; B_dData_dPair.f_Pair_second = dtb__354 } -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = { Frontend_dAst.f_Alt_altPat = dtb__350; Frontend_dAst.f_Alt_altBody = dtb__353; Frontend_dAst.f_Alt_altRef = Frontend_dAst.v_noNodeRef }; B_dData_dPair.f_Pair_second = dtb__354 }))
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
and v_decClause = (fun (fuel : int) (bytes : Base_dBytes.t_Cur) -> (if (fuel <= 0) then B_dData_dMaybe.C_Maybe_Nothing else (let nd_uscrut2 = ((v_decPatList (fuel - 1)) bytes) in (match nd_uscrut2 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__355) -> (match dtb__355 with
  | { B_dData_dPair.f_Pair_first = dtb__356; B_dData_dPair.f_Pair_second = dtb__357 } -> (let nd_uscrut9 = ((v_decExpr (fuel - 1)) dtb__357) in (match nd_uscrut9 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__358) -> (match dtb__358 with
  | { B_dData_dPair.f_Pair_first = dtb__359; B_dData_dPair.f_Pair_second = dtb__360 } -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = { Frontend_dAst.f_LocalClause_lcPats = dtb__356; Frontend_dAst.f_LocalClause_lcBody = dtb__359; Frontend_dAst.f_LocalClause_lcRef = Frontend_dAst.v_noNodeRef; Frontend_dAst.f_LocalClause_lcHead = Frontend_dAst.v_noNodeRef }; B_dData_dPair.f_Pair_second = dtb__360 }))
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
and v_decStrExpr = (fun (fuel : int) (bytes : Base_dBytes.t_Cur) -> (if (fuel <= 0) then B_dData_dMaybe.C_Maybe_Nothing else (let nd_uscrut2 = ((Base_dBytes.v_decStr (fuel - 1)) bytes) in (match nd_uscrut2 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__361) -> (match dtb__361 with
  | { B_dData_dPair.f_Pair_first = dtb__362; B_dData_dPair.f_Pair_second = dtb__363 } -> (let nd_uscrut9 = ((v_decExpr (fuel - 1)) dtb__363) in (match nd_uscrut9 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__364) -> (match dtb__364 with
  | { B_dData_dPair.f_Pair_first = dtb__365; B_dData_dPair.f_Pair_second = dtb__366 } -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = { B_dData_dPair.f_Pair_first = dtb__362; B_dData_dPair.f_Pair_second = dtb__365 }; B_dData_dPair.f_Pair_second = dtb__366 }))
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
and v_decExprList = (fun (fuel : int) (bytes : Base_dBytes.t_Cur) -> (if (fuel <= 0) then B_dData_dMaybe.C_Maybe_Nothing else (let nd_uscrut2 = ((v_decListHead fuel) bytes) in (match nd_uscrut2 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__367) -> (match dtb__367 with
  | { B_dData_dPair.f_Pair_first = dtb__368; B_dData_dPair.f_Pair_second = dtb__369 } -> ((((v_decExprListItems (fuel - 1)) dtb__368) dtb__369) B_dData_dList.C_List_Nil)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))))
# 884 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
and v_decExprListItems = (fun (fuel : int) (n : int) (bytes : Base_dBytes.t_Cur) (acc : Frontend_dAst.t_Expr B_dData_dList.t_List) -> (if (fuel <= 0) then B_dData_dMaybe.C_Maybe_Nothing else (if (n <= 0) then (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (B_dData_dList.v_reverse acc); B_dData_dPair.f_Pair_second = bytes })) else (let nd_uscrut4 = ((v_decExpr (fuel - 1)) bytes) in (match nd_uscrut4 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__370) -> (match dtb__370 with
  | { B_dData_dPair.f_Pair_first = dtb__371; B_dData_dPair.f_Pair_second = dtb__372 } -> ((((v_decExprListItems (fuel - 1)) (n - 1)) dtb__372) (B_dData_dList.C_List__x58__x58_ (dtb__371, acc)))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)))))

# 341 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
let v_decMaybeExpr = (fun (fuel : int) (bytes : Base_dBytes.t_Cur) -> (((Base_dBytes.v_decMaybe v_decExpr) fuel) bytes))

# 552 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
let v_decCtor = (fun (fuel : int) (bytes : Base_dBytes.t_Cur) -> (if (fuel <= 0) then B_dData_dMaybe.C_Maybe_Nothing else (let nd_uscrut2 = ((Base_dBytes.v_decTag fuel) bytes) in (match nd_uscrut2 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__373) -> (match dtb__373 with
  | { B_dData_dPair.f_Pair_first = dtb__374; B_dData_dPair.f_Pair_second = dtb__375 } -> (if (dtb__374 = 0) then (let nd_uscrut9 = ((Base_dBytes.v_decStr (fuel - 1)) dtb__375) in (match nd_uscrut9 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__376) -> (match dtb__376 with
  | { B_dData_dPair.f_Pair_first = dtb__377; B_dData_dPair.f_Pair_second = dtb__378 } -> (let nd_uscrut16 = ((v_decExpr (fuel - 1)) dtb__378) in (match nd_uscrut16 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__379) -> (match dtb__379 with
  | { B_dData_dPair.f_Pair_first = dtb__380; B_dData_dPair.f_Pair_second = dtb__381 } -> (let nd_uscrut23 = ((Base_dBytes.v_decInt (fuel - 1)) dtb__381) in (match nd_uscrut23 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__382) -> (match dtb__382 with
  | { B_dData_dPair.f_Pair_first = dtb__383; B_dData_dPair.f_Pair_second = dtb__384 } -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = { Frontend_dAst.f_Ctor_ctorName = dtb__377; Frontend_dAst.f_Ctor_ctorType = dtb__380; Frontend_dAst.f_Ctor_ctorArity = dtb__383; Frontend_dAst.f_Ctor_ctorRef = Frontend_dAst.v_noNodeRef }; B_dData_dPair.f_Pair_second = dtb__384 }))
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
let v_decField = (fun (fuel : int) (bytes : Base_dBytes.t_Cur) -> (if (fuel <= 0) then B_dData_dMaybe.C_Maybe_Nothing else (let nd_uscrut2 = ((Base_dBytes.v_decTag fuel) bytes) in (match nd_uscrut2 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__385) -> (match dtb__385 with
  | { B_dData_dPair.f_Pair_first = dtb__386; B_dData_dPair.f_Pair_second = dtb__387 } -> (if (dtb__386 = 0) then (let nd_uscrut9 = ((Base_dBytes.v_decStr (fuel - 1)) dtb__387) in (match nd_uscrut9 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__388) -> (match dtb__388 with
  | { B_dData_dPair.f_Pair_first = dtb__389; B_dData_dPair.f_Pair_second = dtb__390 } -> (let nd_uscrut16 = ((v_decExpr (fuel - 1)) dtb__390) in (match nd_uscrut16 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__391) -> (match dtb__391 with
  | { B_dData_dPair.f_Pair_first = dtb__392; B_dData_dPair.f_Pair_second = dtb__393 } -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = { Frontend_dAst.f_Field_fieldName = dtb__389; Frontend_dAst.f_Field_fieldType = dtb__392; Frontend_dAst.f_Field_fieldRef = Frontend_dAst.v_noNodeRef }; B_dData_dPair.f_Pair_second = dtb__393 }))
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
let v_decTraitParam = (fun (fuel : int) (bytes : Base_dBytes.t_Cur) -> (if (fuel <= 0) then B_dData_dMaybe.C_Maybe_Nothing else (let nd_uscrut2 = ((Base_dBytes.v_decTag fuel) bytes) in (match nd_uscrut2 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__394) -> (match dtb__394 with
  | { B_dData_dPair.f_Pair_first = dtb__395; B_dData_dPair.f_Pair_second = dtb__396 } -> (if (dtb__395 = 0) then (let nd_uscrut9 = ((Base_dBytes.v_decStr (fuel - 1)) dtb__396) in (match nd_uscrut9 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__397) -> (match dtb__397 with
  | { B_dData_dPair.f_Pair_first = dtb__398; B_dData_dPair.f_Pair_second = dtb__399 } -> (let nd_uscrut16 = (((Base_dBytes.v_decMaybe v_decExpr) (fuel - 1)) dtb__399) in (match nd_uscrut16 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__400) -> (match dtb__400 with
  | { B_dData_dPair.f_Pair_first = dtb__401; B_dData_dPair.f_Pair_second = dtb__402 } -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = { Frontend_dAst.f_TraitParam_traitParamName = dtb__398; Frontend_dAst.f_TraitParam_traitParamKind = dtb__401 }; B_dData_dPair.f_Pair_second = dtb__402 }))
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
let v_decTraitMethod = (fun (fuel : int) (bytes : Base_dBytes.t_Cur) -> (if (fuel <= 0) then B_dData_dMaybe.C_Maybe_Nothing else (let nd_uscrut2 = ((Base_dBytes.v_decTag fuel) bytes) in (match nd_uscrut2 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__403) -> (match dtb__403 with
  | { B_dData_dPair.f_Pair_first = dtb__404; B_dData_dPair.f_Pair_second = dtb__405 } -> (if (dtb__404 = 0) then (let nd_uscrut9 = ((Base_dBytes.v_decStr (fuel - 1)) dtb__405) in (match nd_uscrut9 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__406) -> (match dtb__406 with
  | { B_dData_dPair.f_Pair_first = dtb__407; B_dData_dPair.f_Pair_second = dtb__408 } -> (let nd_uscrut16 = ((v_decExpr (fuel - 1)) dtb__408) in (match nd_uscrut16 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__409) -> (match dtb__409 with
  | { B_dData_dPair.f_Pair_first = dtb__410; B_dData_dPair.f_Pair_second = dtb__411 } -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = { Frontend_dAst.f_TraitMethod_traitMethodName = dtb__407; Frontend_dAst.f_TraitMethod_traitMethodType = dtb__410; Frontend_dAst.f_TraitMethod_traitMethodRef = Frontend_dAst.v_noNodeRef }; B_dData_dPair.f_Pair_second = dtb__411 }))
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
let rec v_decDecl = (fun (fuel : int) (bytes : Base_dBytes.t_Cur) -> (if (fuel <= 0) then B_dData_dMaybe.C_Maybe_Nothing else (let nd_uscrut2 = ((Base_dBytes.v_decTag fuel) bytes) in (match nd_uscrut2 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__412) -> (match dtb__412 with
  | { B_dData_dPair.f_Pair_first = dtb__413; B_dData_dPair.f_Pair_second = dtb__414 } -> (if (dtb__413 = 0) then (let nd_uscrut9 = ((Base_dBytes.v_decStr (fuel - 1)) dtb__414) in (match nd_uscrut9 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__415) -> (match dtb__415 with
  | { B_dData_dPair.f_Pair_first = dtb__416; B_dData_dPair.f_Pair_second = dtb__417 } -> (let nd_uscrut16 = (((Base_dBytes.v_decList Base_dBytes.v_decStr) (fuel - 1)) dtb__417) in (match nd_uscrut16 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__418) -> (match dtb__418 with
  | { B_dData_dPair.f_Pair_first = dtb__419; B_dData_dPair.f_Pair_second = dtb__420 } -> (let nd_uscrut23 = ((v_decExpr (fuel - 1)) dtb__420) in (match nd_uscrut23 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__421) -> (match dtb__421 with
  | { B_dData_dPair.f_Pair_first = dtb__422; B_dData_dPair.f_Pair_second = dtb__423 } -> (let nd_uscrut30 = (((Base_dBytes.v_decList v_decCtor) (fuel - 1)) dtb__423) in (match nd_uscrut30 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__424) -> (match dtb__424 with
  | { B_dData_dPair.f_Pair_first = dtb__425; B_dData_dPair.f_Pair_second = dtb__426 } -> (let nd_uscrut37 = (((Base_dBytes.v_decList Base_dBytes.v_decStr) (fuel - 1)) dtb__426) in (match nd_uscrut37 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__427) -> (match dtb__427 with
  | { B_dData_dPair.f_Pair_first = dtb__428; B_dData_dPair.f_Pair_second = dtb__429 } -> (let nd_uscrut44 = ((Base_dBytes.v_decBool (fuel - 1)) dtb__429) in (match nd_uscrut44 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__430) -> (match dtb__430 with
  | { B_dData_dPair.f_Pair_first = dtb__431; B_dData_dPair.f_Pair_second = dtb__432 } -> (let nd_uscrut51 = ((v_decReprTier (fuel - 1)) dtb__432) in (match nd_uscrut51 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__433) -> (match dtb__433 with
  | { B_dData_dPair.f_Pair_first = dtb__434; B_dData_dPair.f_Pair_second = dtb__435 } -> (let nd_uscrut58 = ((Base_dBytes.v_decBool (fuel - 1)) dtb__435) in (match nd_uscrut58 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__436) -> (match dtb__436 with
  | { B_dData_dPair.f_Pair_first = dtb__437; B_dData_dPair.f_Pair_second = dtb__438 } -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Decl_DData (dtb__416, dtb__419, dtb__422, dtb__425, dtb__428, dtb__431, dtb__434, dtb__437, Frontend_dAst.v_noNodeRef)); B_dData_dPair.f_Pair_second = dtb__438 }))
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
)) else (if (dtb__413 = 1) then (let nd_uscrut9 = ((Base_dBytes.v_decStr (fuel - 1)) dtb__414) in (match nd_uscrut9 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__439) -> (match dtb__439 with
  | { B_dData_dPair.f_Pair_first = dtb__440; B_dData_dPair.f_Pair_second = dtb__441 } -> (let nd_uscrut16 = ((v_decExpr (fuel - 1)) dtb__441) in (match nd_uscrut16 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__442) -> (match dtb__442 with
  | { B_dData_dPair.f_Pair_first = dtb__443; B_dData_dPair.f_Pair_second = dtb__444 } -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Decl_DAxiom (dtb__440, dtb__443, Frontend_dAst.v_noNodeRef)); B_dData_dPair.f_Pair_second = dtb__444 }))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) else (if (dtb__413 = 2) then (let nd_uscrut9 = ((Base_dBytes.v_decStr (fuel - 1)) dtb__414) in (match nd_uscrut9 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__445) -> (match dtb__445 with
  | { B_dData_dPair.f_Pair_first = dtb__446; B_dData_dPair.f_Pair_second = dtb__447 } -> (let nd_uscrut16 = ((Base_dBytes.v_decStr (fuel - 1)) dtb__447) in (match nd_uscrut16 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__448) -> (match dtb__448 with
  | { B_dData_dPair.f_Pair_first = dtb__449; B_dData_dPair.f_Pair_second = dtb__450 } -> (let nd_uscrut23 = ((v_decExpr (fuel - 1)) dtb__450) in (match nd_uscrut23 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__451) -> (match dtb__451 with
  | { B_dData_dPair.f_Pair_first = dtb__452; B_dData_dPair.f_Pair_second = dtb__453 } -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Decl_DExtern (dtb__446, dtb__449, dtb__452, Frontend_dAst.v_noNodeRef)); B_dData_dPair.f_Pair_second = dtb__453 }))
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
)) else (if (dtb__413 = 3) then (let nd_uscrut9 = ((Base_dBytes.v_decStr (fuel - 1)) dtb__414) in (match nd_uscrut9 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__454) -> (match dtb__454 with
  | { B_dData_dPair.f_Pair_first = dtb__455; B_dData_dPair.f_Pair_second = dtb__456 } -> (let nd_uscrut16 = ((v_decExprList (fuel - 1)) dtb__456) in (match nd_uscrut16 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__457) -> (match dtb__457 with
  | { B_dData_dPair.f_Pair_first = dtb__458; B_dData_dPair.f_Pair_second = dtb__459 } -> (let nd_uscrut23 = ((v_decExpr (fuel - 1)) dtb__459) in (match nd_uscrut23 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__460) -> (match dtb__460 with
  | { B_dData_dPair.f_Pair_first = dtb__461; B_dData_dPair.f_Pair_second = dtb__462 } -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Decl_DSig (dtb__455, dtb__458, dtb__461, Frontend_dAst.v_noNodeRef)); B_dData_dPair.f_Pair_second = dtb__462 }))
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
)) else (if (dtb__413 = 4) then (let nd_uscrut9 = ((Base_dBytes.v_decStr (fuel - 1)) dtb__414) in (match nd_uscrut9 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__463) -> (match dtb__463 with
  | { B_dData_dPair.f_Pair_first = dtb__464; B_dData_dPair.f_Pair_second = dtb__465 } -> (let nd_uscrut16 = ((v_decPatList (fuel - 1)) dtb__465) in (match nd_uscrut16 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__466) -> (match dtb__466 with
  | { B_dData_dPair.f_Pair_first = dtb__467; B_dData_dPair.f_Pair_second = dtb__468 } -> (let nd_uscrut23 = ((v_decExpr (fuel - 1)) dtb__468) in (match nd_uscrut23 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__469) -> (match dtb__469 with
  | { B_dData_dPair.f_Pair_first = dtb__470; B_dData_dPair.f_Pair_second = dtb__471 } -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Decl_DFun (dtb__464, dtb__467, dtb__470, Frontend_dAst.v_noNodeRef)); B_dData_dPair.f_Pair_second = dtb__471 }))
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
)) else (if (dtb__413 = 5) then (let nd_uscrut9 = ((Base_dBytes.v_decStr (fuel - 1)) dtb__414) in (match nd_uscrut9 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__472) -> (match dtb__472 with
  | { B_dData_dPair.f_Pair_first = dtb__473; B_dData_dPair.f_Pair_second = dtb__474 } -> (let nd_uscrut16 = (((Base_dBytes.v_decList Base_dBytes.v_decStr) (fuel - 1)) dtb__474) in (match nd_uscrut16 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__475) -> (match dtb__475 with
  | { B_dData_dPair.f_Pair_first = dtb__476; B_dData_dPair.f_Pair_second = dtb__477 } -> (let nd_uscrut23 = (((Base_dBytes.v_decList v_decField) (fuel - 1)) dtb__477) in (match nd_uscrut23 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__478) -> (match dtb__478 with
  | { B_dData_dPair.f_Pair_first = dtb__479; B_dData_dPair.f_Pair_second = dtb__480 } -> (let nd_uscrut30 = (((Base_dBytes.v_decList Base_dBytes.v_decStr) (fuel - 1)) dtb__480) in (match nd_uscrut30 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__481) -> (match dtb__481 with
  | { B_dData_dPair.f_Pair_first = dtb__482; B_dData_dPair.f_Pair_second = dtb__483 } -> (let nd_uscrut37 = ((Base_dBytes.v_decBool (fuel - 1)) dtb__483) in (match nd_uscrut37 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__484) -> (match dtb__484 with
  | { B_dData_dPair.f_Pair_first = dtb__485; B_dData_dPair.f_Pair_second = dtb__486 } -> (let nd_uscrut44 = ((v_decReprTier (fuel - 1)) dtb__486) in (match nd_uscrut44 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__487) -> (match dtb__487 with
  | { B_dData_dPair.f_Pair_first = dtb__488; B_dData_dPair.f_Pair_second = dtb__489 } -> (let nd_uscrut51 = ((Base_dBytes.v_decBool (fuel - 1)) dtb__489) in (match nd_uscrut51 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__490) -> (match dtb__490 with
  | { B_dData_dPair.f_Pair_first = dtb__491; B_dData_dPair.f_Pair_second = dtb__492 } -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Decl_DRecord (dtb__473, dtb__476, dtb__479, dtb__482, dtb__485, dtb__488, dtb__491, Frontend_dAst.v_noNodeRef)); B_dData_dPair.f_Pair_second = dtb__492 }))
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
)) else (if (dtb__413 = 6) then (let nd_uscrut9 = ((Base_dBytes.v_decStr (fuel - 1)) dtb__414) in (match nd_uscrut9 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__493) -> (match dtb__493 with
  | { B_dData_dPair.f_Pair_first = dtb__494; B_dData_dPair.f_Pair_second = dtb__495 } -> (let nd_uscrut16 = (((Base_dBytes.v_decList v_decTraitParam) (fuel - 1)) dtb__495) in (match nd_uscrut16 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__496) -> (match dtb__496 with
  | { B_dData_dPair.f_Pair_first = dtb__497; B_dData_dPair.f_Pair_second = dtb__498 } -> (let nd_uscrut23 = ((v_decExprList (fuel - 1)) dtb__498) in (match nd_uscrut23 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__499) -> (match dtb__499 with
  | { B_dData_dPair.f_Pair_first = dtb__500; B_dData_dPair.f_Pair_second = dtb__501 } -> (let nd_uscrut30 = (((Base_dBytes.v_decList v_decTraitMethod) (fuel - 1)) dtb__501) in (match nd_uscrut30 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__502) -> (match dtb__502 with
  | { B_dData_dPair.f_Pair_first = dtb__503; B_dData_dPair.f_Pair_second = dtb__504 } -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Decl_DTrait (dtb__494, dtb__497, dtb__500, dtb__503, Frontend_dAst.v_noNodeRef)); B_dData_dPair.f_Pair_second = dtb__504 }))
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
)) else (if (dtb__413 = 7) then (let nd_uscrut9 = ((v_decExprList (fuel - 1)) dtb__414) in (match nd_uscrut9 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__505) -> (match dtb__505 with
  | { B_dData_dPair.f_Pair_first = dtb__506; B_dData_dPair.f_Pair_second = dtb__507 } -> (let nd_uscrut16 = ((v_decExpr (fuel - 1)) dtb__507) in (match nd_uscrut16 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__508) -> (match dtb__508 with
  | { B_dData_dPair.f_Pair_first = dtb__509; B_dData_dPair.f_Pair_second = dtb__510 } -> (let nd_uscrut23 = ((v_decDecls (fuel - 1)) dtb__510) in (match nd_uscrut23 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__511) -> (match dtb__511 with
  | { B_dData_dPair.f_Pair_first = dtb__512; B_dData_dPair.f_Pair_second = dtb__513 } -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Decl_DInstance (dtb__506, dtb__509, dtb__512, Frontend_dAst.v_noNodeRef)); B_dData_dPair.f_Pair_second = dtb__513 }))
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
and v_decDecls = (fun (fuel : int) (bytes : Base_dBytes.t_Cur) -> (if (fuel <= 0) then B_dData_dMaybe.C_Maybe_Nothing else (let nd_uscrut2 = ((v_decListHead fuel) bytes) in (match nd_uscrut2 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__514) -> (match dtb__514 with
  | { B_dData_dPair.f_Pair_first = dtb__515; B_dData_dPair.f_Pair_second = dtb__516 } -> ((((v_decDeclsItems (fuel - 1)) dtb__515) dtb__516) B_dData_dList.C_List_Nil)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))))
# 928 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
and v_decDeclsItems = (fun (fuel : int) (n : int) (bytes : Base_dBytes.t_Cur) (acc : Frontend_dAst.t_Decl B_dData_dList.t_List) -> (if (fuel <= 0) then B_dData_dMaybe.C_Maybe_Nothing else (if (n <= 0) then (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (B_dData_dList.v_reverse acc); B_dData_dPair.f_Pair_second = bytes })) else (let nd_uscrut4 = ((v_decDecl (fuel - 1)) bytes) in (match nd_uscrut4 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__517) -> (match dtb__517 with
  | { B_dData_dPair.f_Pair_first = dtb__518; B_dData_dPair.f_Pair_second = dtb__519 } -> ((((v_decDeclsItems (fuel - 1)) (n - 1)) dtb__519) (B_dData_dList.C_List__x58__x58_ (dtb__518, acc)))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)))))

# 940 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
let v_decPatComplete = (fun (s : string) -> (let nd_uscrut1 = ((v_decPat (String.length s)) (Base_dBytes.v_curOf s)) in (match nd_uscrut1 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__520) -> (match dtb__520 with
  | { B_dData_dPair.f_Pair_first = dtb__521; B_dData_dPair.f_Pair_second = dtb__522 } -> (if (Base_dBytes.v_curAtEnd dtb__522) then (B_dData_dMaybe.C_Maybe_Just (dtb__521)) else B_dData_dMaybe.C_Maybe_Nothing)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)))

# 947 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
let v_decExprComplete = (fun (s : string) -> (let nd_uscrut1 = ((v_decExpr (String.length s)) (Base_dBytes.v_curOf s)) in (match nd_uscrut1 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__523) -> (match dtb__523 with
  | { B_dData_dPair.f_Pair_first = dtb__524; B_dData_dPair.f_Pair_second = dtb__525 } -> (if (Base_dBytes.v_curAtEnd dtb__525) then (B_dData_dMaybe.C_Maybe_Just (dtb__524)) else B_dData_dMaybe.C_Maybe_Nothing)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)))

# 954 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
let v_decDeclComplete = (fun (s : string) -> (let nd_uscrut1 = ((v_decDecl (String.length s)) (Base_dBytes.v_curOf s)) in (match nd_uscrut1 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__526) -> (match dtb__526 with
  | { B_dData_dPair.f_Pair_first = dtb__527; B_dData_dPair.f_Pair_second = dtb__528 } -> (if (Base_dBytes.v_curAtEnd dtb__528) then (B_dData_dMaybe.C_Maybe_Just (dtb__527)) else B_dData_dMaybe.C_Maybe_Nothing)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)))

# 961 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
let v_decQtyComplete = (fun (s : string) -> (let nd_uscrut1 = ((v_decQty (String.length s)) (Base_dBytes.v_curOf s)) in (match nd_uscrut1 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__529) -> (match dtb__529 with
  | { B_dData_dPair.f_Pair_first = dtb__530; B_dData_dPair.f_Pair_second = dtb__531 } -> (if (Base_dBytes.v_curAtEnd dtb__531) then (B_dData_dMaybe.C_Maybe_Just (dtb__530)) else B_dData_dMaybe.C_Maybe_Nothing)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)))

# 968 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
let v_decReprTierComplete = (fun (s : string) -> (let nd_uscrut1 = ((v_decReprTier (String.length s)) (Base_dBytes.v_curOf s)) in (match nd_uscrut1 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__532) -> (match dtb__532 with
  | { B_dData_dPair.f_Pair_first = dtb__533; B_dData_dPair.f_Pair_second = dtb__534 } -> (if (Base_dBytes.v_curAtEnd dtb__534) then (B_dData_dMaybe.C_Maybe_Just (dtb__533)) else B_dData_dMaybe.C_Maybe_Nothing)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)))

# 975 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
let v_decInterpPartComplete = (fun (s : string) -> (let nd_uscrut1 = ((v_decInterpPart (String.length s)) (Base_dBytes.v_curOf s)) in (match nd_uscrut1 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__535) -> (match dtb__535 with
  | { B_dData_dPair.f_Pair_first = dtb__536; B_dData_dPair.f_Pair_second = dtb__537 } -> (if (Base_dBytes.v_curAtEnd dtb__537) then (B_dData_dMaybe.C_Maybe_Just (dtb__536)) else B_dData_dMaybe.C_Maybe_Nothing)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)))

# 982 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
let v_decDoStmtComplete = (fun (s : string) -> (let nd_uscrut1 = ((v_decDoStmt (String.length s)) (Base_dBytes.v_curOf s)) in (match nd_uscrut1 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__538) -> (match dtb__538 with
  | { B_dData_dPair.f_Pair_first = dtb__539; B_dData_dPair.f_Pair_second = dtb__540 } -> (if (Base_dBytes.v_curAtEnd dtb__540) then (B_dData_dMaybe.C_Maybe_Just (dtb__539)) else B_dData_dMaybe.C_Maybe_Nothing)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)))

# 989 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
let v_decCtorComplete = (fun (s : string) -> (let nd_uscrut1 = ((v_decCtor (String.length s)) (Base_dBytes.v_curOf s)) in (match nd_uscrut1 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__541) -> (match dtb__541 with
  | { B_dData_dPair.f_Pair_first = dtb__542; B_dData_dPair.f_Pair_second = dtb__543 } -> (if (Base_dBytes.v_curAtEnd dtb__543) then (B_dData_dMaybe.C_Maybe_Just (dtb__542)) else B_dData_dMaybe.C_Maybe_Nothing)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)))

# 996 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
let v_decFieldComplete = (fun (s : string) -> (let nd_uscrut1 = ((v_decField (String.length s)) (Base_dBytes.v_curOf s)) in (match nd_uscrut1 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__544) -> (match dtb__544 with
  | { B_dData_dPair.f_Pair_first = dtb__545; B_dData_dPair.f_Pair_second = dtb__546 } -> (if (Base_dBytes.v_curAtEnd dtb__546) then (B_dData_dMaybe.C_Maybe_Just (dtb__545)) else B_dData_dMaybe.C_Maybe_Nothing)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)))

# 1003 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
let v_decTraitParamComplete = (fun (s : string) -> (let nd_uscrut1 = ((v_decTraitParam (String.length s)) (Base_dBytes.v_curOf s)) in (match nd_uscrut1 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__547) -> (match dtb__547 with
  | { B_dData_dPair.f_Pair_first = dtb__548; B_dData_dPair.f_Pair_second = dtb__549 } -> (if (Base_dBytes.v_curAtEnd dtb__549) then (B_dData_dMaybe.C_Maybe_Just (dtb__548)) else B_dData_dMaybe.C_Maybe_Nothing)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)))

# 1010 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
let v_decTraitMethodComplete = (fun (s : string) -> (let nd_uscrut1 = ((v_decTraitMethod (String.length s)) (Base_dBytes.v_curOf s)) in (match nd_uscrut1 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__550) -> (match dtb__550 with
  | { B_dData_dPair.f_Pair_first = dtb__551; B_dData_dPair.f_Pair_second = dtb__552 } -> (if (Base_dBytes.v_curAtEnd dtb__552) then (B_dData_dMaybe.C_Maybe_Just (dtb__551)) else B_dData_dMaybe.C_Maybe_Nothing)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)))

# 1017 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
let v_decDeclsComplete = (fun (s : string) -> (let nd_uscrut1 = ((v_decDecls (String.length s)) (Base_dBytes.v_curOf s)) in (match nd_uscrut1 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__553) -> (match dtb__553 with
  | { B_dData_dPair.f_Pair_first = dtb__554; B_dData_dPair.f_Pair_second = dtb__555 } -> (if (Base_dBytes.v_curAtEnd dtb__555) then (B_dData_dMaybe.C_Maybe_Just (dtb__554)) else B_dData_dMaybe.C_Maybe_Nothing)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)))

# 1031 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
let v_encExportItem = (fun (mc0 : Frontend_dAst.t_ExportItem) (mc1 : string B_dData_dList.t_List) -> (match mc0 with
  | Frontend_dAst.C_ExportItem_XNamespace (dtb__556, dtb__557, dtb__558) -> ((Base_dBytes.v_encTag 4) ((Base_dBytes.v_encStr dtb__556) (((Base_dBytes.v_encMaybe Base_dBytes.v_encStr) dtb__557) mc1)))
  | Frontend_dAst.C_ExportItem_XModule (dtb__559, dtb__560) -> ((Base_dBytes.v_encTag 2) ((Base_dBytes.v_encStr dtb__559) mc1))
  | Frontend_dAst.C_ExportItem_XTypeSome (dtb__561, dtb__562, dtb__563) -> ((Base_dBytes.v_encTag 3) ((Base_dBytes.v_encStr dtb__561) (((Base_dBytes.v_encList Base_dBytes.v_encStr) dtb__562) mc1)))
  | Frontend_dAst.C_ExportItem_XTypeAll (dtb__564, dtb__565) -> ((Base_dBytes.v_encTag 1) ((Base_dBytes.v_encStr dtb__564) mc1))
  | Frontend_dAst.C_ExportItem_XBare (dtb__566, dtb__567) -> ((Base_dBytes.v_encTag 0) ((Base_dBytes.v_encStr dtb__566) mc1))
  | _ -> failwith "DT: impossible branch"
))

# 1038 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
let v_encExportMembers = (fun (mc0 : Frontend_dAst.t_ExportMembers) (mc1 : string B_dData_dList.t_List) -> (match mc0 with
  | Frontend_dAst.C_ExportMembers_EMOnly (dtb__568) -> ((Base_dBytes.v_encTag 2) (((Base_dBytes.v_encList Base_dBytes.v_encStr) dtb__568) mc1))
  | Frontend_dAst.C_ExportMembers_EMAll -> ((Base_dBytes.v_encTag 1) mc1)
  | Frontend_dAst.C_ExportMembers_EMNone -> ((Base_dBytes.v_encTag 0) mc1)
  | _ -> failwith "DT: impossible branch"
))

# 1043 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
let v_encExportSpec = (fun (mc0 : Frontend_dAst.t_ExportSpec) (mc1 : string B_dData_dList.t_List) -> (match mc0 with
  | Frontend_dAst.C_ExportSpec_ESType (dtb__569, dtb__570, dtb__571) -> ((Base_dBytes.v_encTag 1) ((Base_dBytes.v_encStr dtb__569) ((v_encExportMembers dtb__570) mc1)))
  | Frontend_dAst.C_ExportSpec_ESValue (dtb__572, dtb__573) -> ((Base_dBytes.v_encTag 0) ((Base_dBytes.v_encStr dtb__572) mc1))
  | _ -> failwith "DT: impossible branch"
))

# 1047 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
let v_encOpacity = (fun (mc0 : Frontend_dAst.t_Opacity) (mc1 : string B_dData_dList.t_List) -> (match mc0 with
  | Frontend_dAst.C_Opacity_OpacityAbstract -> ((Base_dBytes.v_encTag 2) mc1)
  | Frontend_dAst.C_Opacity_OpacityTransparent -> ((Base_dBytes.v_encTag 1) mc1)
  | Frontend_dAst.C_Opacity_OpacityOpaque -> ((Base_dBytes.v_encTag 0) mc1)
  | _ -> failwith "DT: impossible branch"
))

# 1052 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
let v_encOpacitySpec = (fun (o : Frontend_dAst.t_OpacitySpec) (acc : string B_dData_dList.t_List) -> ((Base_dBytes.v_encStr (o).Frontend_dAst.f_OpacitySpec_opacityName) ((v_encOpacity (o).Frontend_dAst.f_OpacitySpec_opacityKind) acc)))

# 1056 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
let v_encModDecl = (fun (m : Frontend_dAst.t_ModDecl) (acc : string B_dData_dList.t_List) -> ((Base_dBytes.v_encStr (m).Frontend_dAst.f_ModDecl_modDeclName) ((Base_dBytes.v_encBool (m).Frontend_dAst.f_ModDecl_modDeclHasExportList) (((Base_dBytes.v_encList v_encExportItem) (m).Frontend_dAst.f_ModDecl_modDeclExportItems) (((Base_dBytes.v_encList v_encExportSpec) (m).Frontend_dAst.f_ModDecl_modDeclExports) (((Base_dBytes.v_encList v_encExportItem) (m).Frontend_dAst.f_ModDecl_modDeclReexports) (((Base_dBytes.v_encList v_encOpacitySpec) (m).Frontend_dAst.f_ModDecl_modDeclOpacity) acc)))))))

# 1073 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
let v_encImportLike = (fun (i : Frontend_dAst.t_Import) (acc : string B_dData_dList.t_List) -> ((Base_dBytes.v_encStr (i).Frontend_dAst.f_Import_importName) ((Base_dBytes.v_encBool (i).Frontend_dAst.f_Import_importIsQualified) (((Base_dBytes.v_encMaybe Base_dBytes.v_encStr) (i).Frontend_dAst.f_Import_importAlias) acc))))

# 1077 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
let v_encFixityLike = (fun (f : Frontend_dAst.t_FixityDecl) (acc : string B_dData_dList.t_List) -> ((Base_dBytes.v_encStr (f).Frontend_dAst.f_FixityDecl_fixityOp) ((Base_dBytes.v_encInt (f).Frontend_dAst.f_FixityDecl_fixityLevel) ((Base_dBytes.v_encInt (f).Frontend_dAst.f_FixityDecl_fixityAssoc) acc))))

# 1063 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
let v_encSourceFile = (fun (f : Frontend_dAst.t_SourceFile) (acc : string B_dData_dList.t_List) -> (((Base_dBytes.v_encMaybe v_encModDecl) (f).Frontend_dAst.f_SourceFile_sourceFileModDecl) (((Base_dBytes.v_encList v_encImportLike) (f).Frontend_dAst.f_SourceFile_sourceFileImports) (((Base_dBytes.v_encList v_encFixityLike) (f).Frontend_dAst.f_SourceFile_sourceFileFixities) (((Base_dBytes.v_encList v_encDecl) (f).Frontend_dAst.f_SourceFile_sourceFileDecls) (((Base_dBytes.v_encList v_encExportSpec) (f).Frontend_dAst.f_SourceFile_sourceFileExports) (((Base_dBytes.v_encList v_encExportItem) (f).Frontend_dAst.f_SourceFile_sourceFileReexports) (((Base_dBytes.v_encList v_encOpacitySpec) (f).Frontend_dAst.f_SourceFile_sourceFileOpacity) acc))))))))

# 1081 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
let v_decExportItem = (fun (fuel : int) (c : Base_dBytes.t_Cur) -> (if (fuel <= 0) then B_dData_dMaybe.C_Maybe_Nothing else ((Base_dBytes.v_thenPair ((Base_dBytes.v_decTag fuel) c)) (fun (tag : int) (b1 : Base_dBytes.t_Cur) -> (if (tag = 0) then ((Base_dBytes.v_thenPair ((Base_dBytes.v_decStr (fuel - 1)) b1)) (fun (n : string) (b2 : Base_dBytes.t_Cur) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_ExportItem_XBare (n, Frontend_dAst.v_noNodeRef)); B_dData_dPair.f_Pair_second = b2 })))) else (if (tag = 1) then ((Base_dBytes.v_thenPair ((Base_dBytes.v_decStr (fuel - 1)) b1)) (fun (n : string) (b2 : Base_dBytes.t_Cur) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_ExportItem_XTypeAll (n, Frontend_dAst.v_noNodeRef)); B_dData_dPair.f_Pair_second = b2 })))) else (if (tag = 3) then ((Base_dBytes.v_thenPair ((Base_dBytes.v_decStr (fuel - 1)) b1)) (fun (n : string) (b2 : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair (((Base_dBytes.v_decList Base_dBytes.v_decStr) (fuel - 1)) b2)) (fun (ms : string B_dData_dList.t_List) (b3 : Base_dBytes.t_Cur) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_ExportItem_XTypeSome (n, ms, Frontend_dAst.v_noNodeRef)); B_dData_dPair.f_Pair_second = b3 })))))) else (if (tag = 2) then ((Base_dBytes.v_thenPair ((Base_dBytes.v_decStr (fuel - 1)) b1)) (fun (n : string) (b2 : Base_dBytes.t_Cur) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_ExportItem_XModule (n, Frontend_dAst.v_noNodeRef)); B_dData_dPair.f_Pair_second = b2 })))) else (if (tag = 4) then ((Base_dBytes.v_thenPair ((Base_dBytes.v_decStr (fuel - 1)) b1)) (fun (n : string) (b2 : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair (((Base_dBytes.v_decMaybe Base_dBytes.v_decStr) (fuel - 1)) b2)) (fun (alias : string B_dData_dMaybe.t_Maybe) (b3 : Base_dBytes.t_Cur) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_ExportItem_XNamespace (n, alias, Frontend_dAst.v_noNodeRef)); B_dData_dPair.f_Pair_second = b3 })))))) else B_dData_dMaybe.C_Maybe_Nothing)))))))))

# 1097 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
let v_decExportMembers = (fun (fuel : int) (c : Base_dBytes.t_Cur) -> (if (fuel <= 0) then B_dData_dMaybe.C_Maybe_Nothing else ((Base_dBytes.v_thenPair ((Base_dBytes.v_decTag fuel) c)) (fun (tag : int) (b1 : Base_dBytes.t_Cur) -> (if (tag = 0) then (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = Frontend_dAst.C_ExportMembers_EMNone; B_dData_dPair.f_Pair_second = b1 })) else (if (tag = 1) then (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = Frontend_dAst.C_ExportMembers_EMAll; B_dData_dPair.f_Pair_second = b1 })) else (if (tag = 2) then ((Base_dBytes.v_thenPair (((Base_dBytes.v_decList Base_dBytes.v_decStr) (fuel - 1)) b1)) (fun (ms : string B_dData_dList.t_List) (b2 : Base_dBytes.t_Cur) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_ExportMembers_EMOnly (ms)); B_dData_dPair.f_Pair_second = b2 })))) else B_dData_dMaybe.C_Maybe_Nothing)))))))

# 1111 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
let v_decExportSpec = (fun (fuel : int) (c : Base_dBytes.t_Cur) -> (if (fuel <= 0) then B_dData_dMaybe.C_Maybe_Nothing else ((Base_dBytes.v_thenPair ((Base_dBytes.v_decTag fuel) c)) (fun (tag : int) (b1 : Base_dBytes.t_Cur) -> (if (tag = 0) then ((Base_dBytes.v_thenPair ((Base_dBytes.v_decStr (fuel - 1)) b1)) (fun (n : string) (b2 : Base_dBytes.t_Cur) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_ExportSpec_ESValue (n, v_noSpan)); B_dData_dPair.f_Pair_second = b2 })))) else (if (tag = 1) then ((Base_dBytes.v_thenPair ((Base_dBytes.v_decStr (fuel - 1)) b1)) (fun (n : string) (b2 : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair ((v_decExportMembers (fuel - 1)) b2)) (fun (ms : Frontend_dAst.t_ExportMembers) (b3 : Base_dBytes.t_Cur) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_ExportSpec_ESType (n, ms, v_noSpan)); B_dData_dPair.f_Pair_second = b3 })))))) else B_dData_dMaybe.C_Maybe_Nothing))))))

# 1124 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
let v_decOpacity = (fun (fuel : int) (c : Base_dBytes.t_Cur) -> (if (fuel <= 0) then B_dData_dMaybe.C_Maybe_Nothing else ((Base_dBytes.v_thenPair ((Base_dBytes.v_decTag fuel) c)) (fun (tag : int) (b1 : Base_dBytes.t_Cur) -> (if (tag = 0) then (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = Frontend_dAst.C_Opacity_OpacityOpaque; B_dData_dPair.f_Pair_second = b1 })) else (if (tag = 1) then (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = Frontend_dAst.C_Opacity_OpacityTransparent; B_dData_dPair.f_Pair_second = b1 })) else (if (tag = 2) then (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = Frontend_dAst.C_Opacity_OpacityAbstract; B_dData_dPair.f_Pair_second = b1 })) else B_dData_dMaybe.C_Maybe_Nothing)))))))

# 1138 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
let v_decOpacitySpec = (fun (fuel : int) (c : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair ((Base_dBytes.v_decStr (fuel - 1)) c)) (fun (name : string) (b1 : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair ((v_decOpacity (fuel - 1)) b1)) (fun (kind : Frontend_dAst.t_Opacity) (b2 : Base_dBytes.t_Cur) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = { Frontend_dAst.f_OpacitySpec_opacityName = name; Frontend_dAst.f_OpacitySpec_opacityKind = kind; Frontend_dAst.f_OpacitySpec_opacitySpan = v_noSpan }; B_dData_dPair.f_Pair_second = b2 })))))))

# 1145 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
let v_decModDecl = (fun (fuel : int) (c : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair ((Base_dBytes.v_decStr (fuel - 1)) c)) (fun (name : string) (b1 : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair ((Base_dBytes.v_decBool (fuel - 1)) b1)) (fun (hasList : bool) (b2 : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair (((Base_dBytes.v_decList v_decExportItem) (fuel - 1)) b2)) (fun (items : Frontend_dAst.t_ExportItem B_dData_dList.t_List) (b3 : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair (((Base_dBytes.v_decList v_decExportSpec) (fuel - 1)) b3)) (fun (exports : Frontend_dAst.t_ExportSpec B_dData_dList.t_List) (b4 : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair (((Base_dBytes.v_decList v_decExportItem) (fuel - 1)) b4)) (fun (reexports : Frontend_dAst.t_ExportItem B_dData_dList.t_List) (b5 : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair (((Base_dBytes.v_decList v_decOpacitySpec) (fuel - 1)) b5)) (fun (opacity : Frontend_dAst.t_OpacitySpec B_dData_dList.t_List) (b6 : Base_dBytes.t_Cur) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = { Frontend_dAst.f_ModDecl_modDeclName = name; Frontend_dAst.f_ModDecl_modDeclHasExportList = hasList; Frontend_dAst.f_ModDecl_modDeclExportItems = items; Frontend_dAst.f_ModDecl_modDeclExports = exports; Frontend_dAst.f_ModDecl_modDeclReexports = reexports; Frontend_dAst.f_ModDecl_modDeclOpacity = opacity; Frontend_dAst.f_ModDecl_modDeclRef = Frontend_dAst.v_noNodeRef }; B_dData_dPair.f_Pair_second = b6 })))))))))))))))

# 1151 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
let v_decImportLike = (fun (fuel : int) (c : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair ((Base_dBytes.v_decStr (fuel - 1)) c)) (fun (name : string) (b1 : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair ((Base_dBytes.v_decBool (fuel - 1)) b1)) (fun (qual : bool) (b2 : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair (((Base_dBytes.v_decMaybe Base_dBytes.v_decStr) (fuel - 1)) b2)) (fun (alias : string B_dData_dMaybe.t_Maybe) (b3 : Base_dBytes.t_Cur) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = { Frontend_dAst.f_Import_importName = name; Frontend_dAst.f_Import_importIsQualified = qual; Frontend_dAst.f_Import_importAlias = alias; Frontend_dAst.f_Import_importRef = Frontend_dAst.v_noNodeRef }; B_dData_dPair.f_Pair_second = b3 })))))))))

# 1157 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
let v_decFixityLike = (fun (fuel : int) (c : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair ((Base_dBytes.v_decStr (fuel - 1)) c)) (fun (op : string) (b1 : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair ((Base_dBytes.v_decInt (fuel - 1)) b1)) (fun (level : int) (b2 : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair ((Base_dBytes.v_decInt (fuel - 1)) b2)) (fun (assoc : int) (b3 : Base_dBytes.t_Cur) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = { Frontend_dAst.f_FixityDecl_fixityOp = op; Frontend_dAst.f_FixityDecl_fixityLevel = level; Frontend_dAst.f_FixityDecl_fixityAssoc = assoc; Frontend_dAst.f_FixityDecl_fixityRef = Frontend_dAst.v_noNodeRef }; B_dData_dPair.f_Pair_second = b3 })))))))))

# 1170 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
let v_decSourceFileGo = (fun (fuel : int) (c : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair (((Base_dBytes.v_decMaybe v_decModDecl) (fuel - 1)) c)) (fun (modDecl : Frontend_dAst.t_ModDecl B_dData_dMaybe.t_Maybe) (b1 : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair (((Base_dBytes.v_decList v_decImportLike) (fuel - 1)) b1)) (fun (imports : Frontend_dAst.t_Import B_dData_dList.t_List) (b2 : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair (((Base_dBytes.v_decList v_decFixityLike) (fuel - 1)) b2)) (fun (fixities : Frontend_dAst.t_FixityDecl B_dData_dList.t_List) (b3 : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair (((Base_dBytes.v_decList v_decDecl) (fuel - 1)) b3)) (fun (decls : Frontend_dAst.t_Decl B_dData_dList.t_List) (b4 : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair (((Base_dBytes.v_decList v_decExportSpec) (fuel - 1)) b4)) (fun (exports : Frontend_dAst.t_ExportSpec B_dData_dList.t_List) (b5 : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair (((Base_dBytes.v_decList v_decExportItem) (fuel - 1)) b5)) (fun (reexports : Frontend_dAst.t_ExportItem B_dData_dList.t_List) (b6 : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair (((Base_dBytes.v_decList v_decOpacitySpec) (fuel - 1)) b6)) (fun (opacity : Frontend_dAst.t_OpacitySpec B_dData_dList.t_List) (b7 : Base_dBytes.t_Cur) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = { Frontend_dAst.f_SourceFile_sourceFileModDecl = modDecl; Frontend_dAst.f_SourceFile_sourceFileImports = imports; Frontend_dAst.f_SourceFile_sourceFileFixities = fixities; Frontend_dAst.f_SourceFile_sourceFileDecls = decls; Frontend_dAst.f_SourceFile_sourceFileExports = exports; Frontend_dAst.f_SourceFile_sourceFileReexports = reexports; Frontend_dAst.f_SourceFile_sourceFileOpacity = opacity }; B_dData_dPair.f_Pair_second = b7 })))))))))))))))))

# 1164 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
let v_decSourceFileComplete = (fun (s : string) -> (let nd_uscrut1 = ((v_decSourceFileGo (String.length s)) (Base_dBytes.v_curOf s)) in (match nd_uscrut1 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__574) -> (match dtb__574 with
  | { B_dData_dPair.f_Pair_first = dtb__575; B_dData_dPair.f_Pair_second = dtb__576 } -> (if (Base_dBytes.v_curAtEnd dtb__576) then (B_dData_dMaybe.C_Maybe_Just (dtb__575)) else B_dData_dMaybe.C_Maybe_Nothing)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)))
