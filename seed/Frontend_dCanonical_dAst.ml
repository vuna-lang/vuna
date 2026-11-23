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
let v_encStrList = (fun (xs : string B_dData_dList.t_List) (acc : string B_dData_dList.t_List) -> (B_dData_dList.C_List__x58__x58_ ((String.concat "" ["["; (bi_strFromInt (Base_dBytes.v_lenOf xs)); ":"]), ((v_encStrListGo xs) acc))))

# 97 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
let rec v_encPatList = (fun (xs : Frontend_dAst.t_Pat B_dData_dList.t_List) (acc : string B_dData_dList.t_List) -> (B_dData_dList.C_List__x58__x58_ ((String.concat "" ["["; (bi_strFromInt (Base_dBytes.v_lenOf xs)); ":"]), ((v_encPatListGo xs) acc))))
# 101 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
and v_encPatListGo = (fun (mc0 : Frontend_dAst.t_Pat B_dData_dList.t_List) (mc1 : string B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__3, dtb__4) -> ((v_encPat dtb__3) ((v_encPatListGo dtb__4) mc1))
  | B_dData_dList.C_List_Nil -> mc1
  | _ -> failwith "DT: impossible branch"
))
# 168 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
and v_encStrPatList = (fun (xs : (string, Frontend_dAst.t_Pat) B_dData_dPair.t_Pair B_dData_dList.t_List) (acc : string B_dData_dList.t_List) -> (B_dData_dList.C_List__x58__x58_ ((String.concat "" ["["; (bi_strFromInt (Base_dBytes.v_lenOf xs)); ":"]), ((v_encStrPatListGo xs) acc))))
# 172 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
and v_encStrPatListGo = (fun (mc0 : (string, Frontend_dAst.t_Pat) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc1 : string B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__5, dtb__6) -> (match dtb__5 with
  | { B_dData_dPair.f_Pair_first = dtb__7; B_dData_dPair.f_Pair_second = dtb__8 } -> ((Base_dBytes.v_encStr dtb__7) ((v_encPat dtb__8) ((v_encStrPatListGo dtb__6) mc1)))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> mc1
  | _ -> failwith "DT: impossible branch"
))
# 227 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
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
let rec v_encExprList = (fun (xs : Frontend_dAst.t_Expr B_dData_dList.t_List) (acc : string B_dData_dList.t_List) -> (B_dData_dList.C_List__x58__x58_ ((String.concat "" ["["; (bi_strFromInt (Base_dBytes.v_lenOf xs)); ":"]), ((v_encExprListGo xs) acc))))
# 92 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
and v_encExprListGo = (fun (mc0 : Frontend_dAst.t_Expr B_dData_dList.t_List) (mc1 : string B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__25, dtb__26) -> ((v_encExpr dtb__25) ((v_encExprListGo dtb__26) mc1))
  | B_dData_dList.C_List_Nil -> mc1
  | _ -> failwith "DT: impossible branch"
))
# 106 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
and v_encPatExprList = (fun (xs : Frontend_dAst.t_Binding B_dData_dList.t_List) (acc : string B_dData_dList.t_List) -> (B_dData_dList.C_List__x58__x58_ ((String.concat "" ["["; (bi_strFromInt (Base_dBytes.v_lenOf xs)); ":"]), ((v_encPatExprListGo xs) acc))))
# 110 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
and v_encPatExprListGo = (fun (mc0 : Frontend_dAst.t_Binding B_dData_dList.t_List) (mc1 : string B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__27, dtb__28) -> ((v_encPat (dtb__27).Frontend_dAst.f_Binding_bindPat) ((v_encBindingSig dtb__27) ((v_encExpr (dtb__27).Frontend_dAst.f_Binding_bindValue) ((v_encPatExprListGo dtb__28) mc1))))
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
and v_encAltList = (fun (xs : Frontend_dAst.t_Alt B_dData_dList.t_List) (acc : string B_dData_dList.t_List) -> (B_dData_dList.C_List__x58__x58_ ((String.concat "" ["["; (bi_strFromInt (Base_dBytes.v_lenOf xs)); ":"]), ((v_encAltListGo xs) acc))))
# 126 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
and v_encAltListGo = (fun (mc0 : Frontend_dAst.t_Alt B_dData_dList.t_List) (mc1 : string B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__30, dtb__31) -> ((v_encPat (dtb__30).Frontend_dAst.f_Alt_altPat) ((v_encExpr (dtb__30).Frontend_dAst.f_Alt_altBody) ((v_encAltListGo dtb__31) mc1)))
  | B_dData_dList.C_List_Nil -> mc1
  | _ -> failwith "DT: impossible branch"
))
# 131 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
and v_encClauses = (fun (xs : Frontend_dAst.t_LocalClause B_dData_dList.t_List) (acc : string B_dData_dList.t_List) -> (B_dData_dList.C_List__x58__x58_ ((String.concat "" ["["; (bi_strFromInt (Base_dBytes.v_lenOf xs)); ":"]), ((v_encClausesGo xs) acc))))
# 135 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
and v_encClausesGo = (fun (mc0 : Frontend_dAst.t_LocalClause B_dData_dList.t_List) (mc1 : string B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__32, dtb__33) -> ((v_encPatList (dtb__32).Frontend_dAst.f_LocalClause_lcPats) ((v_encExpr (dtb__32).Frontend_dAst.f_LocalClause_lcBody) ((v_encClausesGo dtb__33) mc1)))
  | B_dData_dList.C_List_Nil -> mc1
  | _ -> failwith "DT: impossible branch"
))
# 141 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
and v_encStmtList = (fun (xs : Frontend_dAst.t_DoStmt B_dData_dList.t_List) (acc : string B_dData_dList.t_List) -> (B_dData_dList.C_List__x58__x58_ ((String.concat "" ["["; (bi_strFromInt (Base_dBytes.v_lenOf xs)); ":"]), ((v_encStmtListGo xs) acc))))
# 145 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
and v_encStmtListGo = (fun (mc0 : Frontend_dAst.t_DoStmt B_dData_dList.t_List) (mc1 : string B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__34, dtb__35) -> ((v_encDoStmt dtb__34) ((v_encStmtListGo dtb__35) mc1))
  | B_dData_dList.C_List_Nil -> mc1
  | _ -> failwith "DT: impossible branch"
))
# 150 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
and v_encPartList = (fun (xs : Frontend_dAst.t_InterpPart B_dData_dList.t_List) (acc : string B_dData_dList.t_List) -> (B_dData_dList.C_List__x58__x58_ ((String.concat "" ["["; (bi_strFromInt (Base_dBytes.v_lenOf xs)); ":"]), ((v_encPartListGo xs) acc))))
# 154 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
and v_encPartListGo = (fun (mc0 : Frontend_dAst.t_InterpPart B_dData_dList.t_List) (mc1 : string B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__36, dtb__37) -> ((v_encInterpPart dtb__36) ((v_encPartListGo dtb__37) mc1))
  | B_dData_dList.C_List_Nil -> mc1
  | _ -> failwith "DT: impossible branch"
))
# 159 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
and v_encStrExprList = (fun (xs : (string, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (acc : string B_dData_dList.t_List) -> (B_dData_dList.C_List__x58__x58_ ((String.concat "" ["["; (bi_strFromInt (Base_dBytes.v_lenOf xs)); ":"]), ((v_encStrExprListGo xs) acc))))
# 163 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
and v_encStrExprListGo = (fun (mc0 : (string, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc1 : string B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__38, dtb__39) -> (match dtb__38 with
  | { B_dData_dPair.f_Pair_first = dtb__40; B_dData_dPair.f_Pair_second = dtb__41 } -> ((Base_dBytes.v_encStr dtb__40) ((v_encExpr dtb__41) ((v_encStrExprListGo dtb__39) mc1)))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> mc1
  | _ -> failwith "DT: impossible branch"
))
# 222 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
and v_encInterpPart = (fun (mc0 : Frontend_dAst.t_InterpPart) (mc1 : string B_dData_dList.t_List) -> (match mc0 with
  | Frontend_dAst.C_InterpPart_IPHole (dtb__42) -> ((Base_dBytes.v_encTag 1) ((v_encExpr dtb__42) mc1))
  | Frontend_dAst.C_InterpPart_IPText (dtb__43) -> ((Base_dBytes.v_encTag 0) ((Base_dBytes.v_encStr dtb__43) mc1))
  | _ -> failwith "DT: impossible branch"
))
# 237 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
and v_encDoStmt = (fun (mc0 : Frontend_dAst.t_DoStmt) (mc1 : string B_dData_dList.t_List) -> (match mc0 with
  | Frontend_dAst.C_DoStmt_DLet (dtb__44, dtb__45) -> ((Base_dBytes.v_encTag 2) ((v_encPatExprList dtb__44) mc1))
  | Frontend_dAst.C_DoStmt_DExpr (dtb__46, dtb__47) -> ((Base_dBytes.v_encTag 1) ((v_encExpr dtb__46) mc1))
  | Frontend_dAst.C_DoStmt_DBind (dtb__48, dtb__49, dtb__50) -> ((Base_dBytes.v_encTag 0) ((v_encPat dtb__48) ((v_encExpr dtb__49) mc1)))
  | _ -> failwith "DT: impossible branch"
))
# 243 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
and v_encExpr = (fun (mc0 : Frontend_dAst.t_Expr) (mc1 : string B_dData_dList.t_List) -> (match mc0 with
  | Frontend_dAst.C_Expr_EFloat (dtb__51, dtb__52) -> ((Base_dBytes.v_encTag 22) ((Base_dBytes.v_encStr dtb__51) mc1))
  | Frontend_dAst.C_Expr_EInterp (dtb__53, dtb__54, dtb__55) -> ((Base_dBytes.v_encTag 21) ((Base_dBytes.v_encBool dtb__53) ((v_encPartList dtb__54) mc1)))
  | Frontend_dAst.C_Expr_EAnn (dtb__56, dtb__57, dtb__58) -> ((Base_dBytes.v_encTag 20) ((v_encExpr dtb__56) ((v_encExpr dtb__57) mc1)))
  | Frontend_dAst.C_Expr_ESectR (dtb__59, dtb__60, dtb__61) -> ((Base_dBytes.v_encTag 19) ((v_encExpr dtb__59) ((Base_dBytes.v_encStr dtb__60) mc1)))
  | Frontend_dAst.C_Expr_ESectL (dtb__62, dtb__63, dtb__64) -> ((Base_dBytes.v_encTag 18) ((Base_dBytes.v_encStr dtb__62) ((v_encExpr dtb__63) mc1)))
  | Frontend_dAst.C_Expr_ESectOp (dtb__65, dtb__66) -> ((Base_dBytes.v_encTag 17) ((Base_dBytes.v_encStr dtb__65) mc1))
  | Frontend_dAst.C_Expr_EBacktick (dtb__67, dtb__68, dtb__69, dtb__70) -> ((Base_dBytes.v_encTag 16) ((Base_dBytes.v_encStr dtb__67) ((v_encExpr dtb__68) ((v_encExpr dtb__69) mc1))))
  | Frontend_dAst.C_Expr_EParen (dtb__71, dtb__72) -> ((Base_dBytes.v_encTag 15) ((v_encExpr dtb__71) mc1))
  | Frontend_dAst.C_Expr_EInfix (dtb__73, dtb__74, dtb__75, dtb__76) -> ((Base_dBytes.v_encTag 14) ((Base_dBytes.v_encStr dtb__73) ((v_encExpr dtb__74) ((v_encExpr dtb__75) mc1))))
  | Frontend_dAst.C_Expr_EDo (dtb__77, dtb__78) -> ((Base_dBytes.v_encTag 13) ((v_encStmtList dtb__77) mc1))
  | Frontend_dAst.C_Expr_ERecUpdate (dtb__79, dtb__80, dtb__81) -> ((Base_dBytes.v_encTag 12) ((v_encExpr dtb__79) ((v_encStrExprList dtb__80) mc1)))
  | Frontend_dAst.C_Expr_ERecord (dtb__82, dtb__83, dtb__84) -> ((Base_dBytes.v_encTag 11) ((Base_dBytes.v_encStr dtb__82) ((v_encStrExprList dtb__83) mc1)))
  | Frontend_dAst.C_Expr_EField (dtb__85, dtb__86, dtb__87) -> ((Base_dBytes.v_encTag 10) ((v_encExpr dtb__85) ((Base_dBytes.v_encStr dtb__86) mc1)))
  | Frontend_dAst.C_Expr_EIf (dtb__88, dtb__89, dtb__90, dtb__91) -> ((Base_dBytes.v_encTag 9) ((v_encExpr dtb__88) ((v_encExpr dtb__89) ((v_encExpr dtb__90) mc1))))
  | Frontend_dAst.C_Expr_ECase (dtb__92, dtb__93, dtb__94) -> ((Base_dBytes.v_encTag 8) ((v_encExpr dtb__92) ((v_encAltList dtb__93) mc1)))
  | Frontend_dAst.C_Expr_ELocalFun (dtb__95, dtb__96) -> ((Base_dBytes.v_encTag 7) ((v_encClauses dtb__95) mc1))
  | Frontend_dAst.C_Expr_ELet (dtb__97, dtb__98, dtb__99, dtb__100) -> ((Base_dBytes.v_encTag 6) ((v_encPatExprList dtb__97) ((v_encExpr dtb__98) ((Base_dBytes.v_encBool dtb__99) mc1))))
  | Frontend_dAst.C_Expr_EPi (dtb__101, dtb__102, dtb__103, dtb__104, dtb__105, dtb__106) -> ((Base_dBytes.v_encTag 5) ((Base_dBytes.v_encStr dtb__101) ((Base_dBytes.v_encBool dtb__102) ((v_encMaybeQty dtb__103) ((v_encExpr dtb__104) ((v_encExpr dtb__105) mc1))))))
  | Frontend_dAst.C_Expr_EApp (dtb__107, dtb__108, dtb__109) -> ((Base_dBytes.v_encTag 4) ((v_encExpr dtb__107) ((v_encExprList dtb__108) mc1)))
  | Frontend_dAst.C_Expr_ELam (dtb__110, dtb__111, dtb__112) -> ((Base_dBytes.v_encTag 3) ((v_encStrList ((B_dData_dList.v_map B_dData_dPair.v_firstOf) dtb__110)) ((v_encExpr dtb__111) mc1)))
  | Frontend_dAst.C_Expr_EStr (dtb__113, dtb__114) -> ((Base_dBytes.v_encTag 2) ((Base_dBytes.v_encStr dtb__113) mc1))
  | Frontend_dAst.C_Expr_EInt (dtb__115, dtb__116) -> ((Base_dBytes.v_encTag 1) ((Base_dBytes.v_encInt dtb__115) mc1))
  | Frontend_dAst.C_Expr_EVar (dtb__117, dtb__118) -> ((Base_dBytes.v_encTag 0) ((Base_dBytes.v_encStr dtb__117) mc1))
  | _ -> failwith "DT: impossible branch"
))

# 69 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
let v_encMaybeExpr = (fun (mc0 : Frontend_dAst.t_Expr B_dData_dMaybe.t_Maybe) (mc1 : string B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__119) -> (B_dData_dList.C_List__x58__x58_ ("1", ((v_encExpr dtb__119) mc1)))
  | B_dData_dMaybe.C_Maybe_Nothing -> (B_dData_dList.C_List__x58__x58_ ("0", mc1))
  | _ -> failwith "DT: impossible branch"
))

# 271 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
let v_encCtor = (fun (mc0 : Frontend_dAst.t_Ctor) (mc1 : string B_dData_dList.t_List) -> (match mc0 with
  | { Frontend_dAst.f_Ctor_ctorName = dtb__120; Frontend_dAst.f_Ctor_ctorType = dtb__121; Frontend_dAst.f_Ctor_ctorArity = dtb__122; Frontend_dAst.f_Ctor_ctorRef = dtb__123 } -> ((Base_dBytes.v_encTag 0) ((Base_dBytes.v_encStr dtb__120) ((v_encExpr dtb__121) ((Base_dBytes.v_encInt dtb__122) mc1))))
  | _ -> failwith "DT: impossible branch"
))

# 181 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
let rec v_encCtorListGo = (fun (mc0 : Frontend_dAst.t_Ctor B_dData_dList.t_List) (mc1 : string B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__124, dtb__125) -> ((v_encCtor dtb__124) ((v_encCtorListGo dtb__125) mc1))
  | B_dData_dList.C_List_Nil -> mc1
  | _ -> failwith "DT: impossible branch"
))

# 177 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
let v_encCtorList = (fun (xs : Frontend_dAst.t_Ctor B_dData_dList.t_List) (acc : string B_dData_dList.t_List) -> (B_dData_dList.C_List__x58__x58_ ((String.concat "" ["["; (bi_strFromInt (Base_dBytes.v_lenOf xs)); ":"]), ((v_encCtorListGo xs) acc))))

# 275 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
let v_encField = (fun (mc0 : Frontend_dAst.t_Field) (mc1 : string B_dData_dList.t_List) -> (match mc0 with
  | { Frontend_dAst.f_Field_fieldName = dtb__126; Frontend_dAst.f_Field_fieldType = dtb__127; Frontend_dAst.f_Field_fieldRef = dtb__128 } -> ((Base_dBytes.v_encTag 0) ((Base_dBytes.v_encStr dtb__126) ((v_encExpr dtb__127) mc1)))
  | _ -> failwith "DT: impossible branch"
))

# 190 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
let rec v_encFieldListGo = (fun (mc0 : Frontend_dAst.t_Field B_dData_dList.t_List) (mc1 : string B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__129, dtb__130) -> ((v_encField dtb__129) ((v_encFieldListGo dtb__130) mc1))
  | B_dData_dList.C_List_Nil -> mc1
  | _ -> failwith "DT: impossible branch"
))

# 186 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
let v_encFieldList = (fun (xs : Frontend_dAst.t_Field B_dData_dList.t_List) (acc : string B_dData_dList.t_List) -> (B_dData_dList.C_List__x58__x58_ ((String.concat "" ["["; (bi_strFromInt (Base_dBytes.v_lenOf xs)); ":"]), ((v_encFieldListGo xs) acc))))

# 279 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
let v_encTraitParam = (fun (mc0 : Frontend_dAst.t_TraitParam) (mc1 : string B_dData_dList.t_List) -> (match mc0 with
  | { Frontend_dAst.f_TraitParam_traitParamName = dtb__131; Frontend_dAst.f_TraitParam_traitParamKind = dtb__132 } -> ((Base_dBytes.v_encTag 0) ((Base_dBytes.v_encStr dtb__131) ((v_encMaybeExpr dtb__132) mc1)))
  | _ -> failwith "DT: impossible branch"
))

# 199 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
let rec v_encTraitParamListGo = (fun (mc0 : Frontend_dAst.t_TraitParam B_dData_dList.t_List) (mc1 : string B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__133, dtb__134) -> ((v_encTraitParam dtb__133) ((v_encTraitParamListGo dtb__134) mc1))
  | B_dData_dList.C_List_Nil -> mc1
  | _ -> failwith "DT: impossible branch"
))

# 195 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
let v_encTraitParamList = (fun (xs : Frontend_dAst.t_TraitParam B_dData_dList.t_List) (acc : string B_dData_dList.t_List) -> (B_dData_dList.C_List__x58__x58_ ((String.concat "" ["["; (bi_strFromInt (Base_dBytes.v_lenOf xs)); ":"]), ((v_encTraitParamListGo xs) acc))))

# 283 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
let v_encTraitMethod = (fun (mc0 : Frontend_dAst.t_TraitMethod) (mc1 : string B_dData_dList.t_List) -> (match mc0 with
  | { Frontend_dAst.f_TraitMethod_traitMethodName = dtb__135; Frontend_dAst.f_TraitMethod_traitMethodType = dtb__136; Frontend_dAst.f_TraitMethod_traitMethodRef = dtb__137 } -> ((Base_dBytes.v_encTag 0) ((Base_dBytes.v_encStr dtb__135) ((v_encExpr dtb__136) mc1)))
  | _ -> failwith "DT: impossible branch"
))

# 208 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
let rec v_encTraitMethodListGo = (fun (mc0 : Frontend_dAst.t_TraitMethod B_dData_dList.t_List) (mc1 : string B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__138, dtb__139) -> ((v_encTraitMethod dtb__138) ((v_encTraitMethodListGo dtb__139) mc1))
  | B_dData_dList.C_List_Nil -> mc1
  | _ -> failwith "DT: impossible branch"
))

# 204 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
let v_encTraitMethodList = (fun (xs : Frontend_dAst.t_TraitMethod B_dData_dList.t_List) (acc : string B_dData_dList.t_List) -> (B_dData_dList.C_List__x58__x58_ ((String.concat "" ["["; (bi_strFromInt (Base_dBytes.v_lenOf xs)); ":"]), ((v_encTraitMethodListGo xs) acc))))

# 213 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
let rec v_encDecls = (fun (xs : Frontend_dAst.t_Decl B_dData_dList.t_List) (acc : string B_dData_dList.t_List) -> (B_dData_dList.C_List__x58__x58_ ((String.concat "" ["["; (bi_strFromInt (Base_dBytes.v_lenOf xs)); ":"]), ((v_encDeclsGo xs) acc))))
# 217 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
and v_encDeclsGo = (fun (mc0 : Frontend_dAst.t_Decl B_dData_dList.t_List) (mc1 : string B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__140, dtb__141) -> ((v_encDecl dtb__140) ((v_encDeclsGo dtb__141) mc1))
  | B_dData_dList.C_List_Nil -> mc1
  | _ -> failwith "DT: impossible branch"
))
# 287 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
and v_encDecl = (fun (mc0 : Frontend_dAst.t_Decl) (mc1 : string B_dData_dList.t_List) -> (match mc0 with
  | Frontend_dAst.C_Decl_DInstance (dtb__142, dtb__143, dtb__144, dtb__145) -> ((Base_dBytes.v_encTag 7) ((v_encExprList dtb__142) ((v_encExpr dtb__143) ((v_encDecls dtb__144) mc1))))
  | Frontend_dAst.C_Decl_DTrait (dtb__146, dtb__147, dtb__148, dtb__149, dtb__150) -> ((Base_dBytes.v_encTag 6) ((Base_dBytes.v_encStr dtb__146) ((v_encTraitParamList dtb__147) ((v_encExprList dtb__148) ((v_encTraitMethodList dtb__149) mc1)))))
  | Frontend_dAst.C_Decl_DRecord (dtb__151, dtb__152, dtb__153, dtb__154, dtb__155, dtb__156, dtb__157, dtb__158) -> ((Base_dBytes.v_encTag 5) ((Base_dBytes.v_encStr dtb__151) ((v_encStrList dtb__152) ((v_encFieldList dtb__153) ((v_encStrList dtb__154) ((Base_dBytes.v_encBool dtb__155) ((v_encReprTier dtb__156) ((Base_dBytes.v_encBool dtb__157) mc1))))))))
  | Frontend_dAst.C_Decl_DFun (dtb__159, dtb__160, dtb__161, dtb__162) -> ((Base_dBytes.v_encTag 4) ((Base_dBytes.v_encStr dtb__159) ((v_encPatList dtb__160) ((v_encExpr dtb__161) mc1))))
  | Frontend_dAst.C_Decl_DSig (dtb__163, dtb__164, dtb__165, dtb__166) -> ((Base_dBytes.v_encTag 3) ((Base_dBytes.v_encStr dtb__163) ((v_encExprList dtb__164) ((v_encExpr dtb__165) mc1))))
  | Frontend_dAst.C_Decl_DExtern (dtb__167, dtb__168, dtb__169, dtb__170) -> ((Base_dBytes.v_encTag 2) ((Base_dBytes.v_encStr dtb__167) ((Base_dBytes.v_encStr dtb__168) ((v_encExpr dtb__169) mc1))))
  | Frontend_dAst.C_Decl_DAxiom (dtb__171, dtb__172, dtb__173) -> ((Base_dBytes.v_encTag 1) ((Base_dBytes.v_encStr dtb__171) ((v_encExpr dtb__172) mc1)))
  | Frontend_dAst.C_Decl_DData (dtb__174, dtb__175, dtb__176, dtb__177, dtb__178, dtb__179, dtb__180, dtb__181, dtb__182) -> ((Base_dBytes.v_encTag 0) ((Base_dBytes.v_encStr dtb__174) ((v_encStrList dtb__175) ((v_encExpr dtb__176) ((v_encCtorList dtb__177) ((v_encStrList dtb__178) ((Base_dBytes.v_encBool dtb__179) ((v_encReprTier dtb__180) ((Base_dBytes.v_encBool dtb__181) mc1)))))))))
  | _ -> failwith "DT: impossible branch"
))

# 311 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
let v_decQty = (fun (fuel : int) (bytes : Base_dBytes.t_Cur) -> (if (fuel <= 0) then B_dData_dMaybe.C_Maybe_Nothing else (let nd_uscrut2 = ((Base_dBytes.v_decTag fuel) bytes) in (match nd_uscrut2 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__183) -> (match dtb__183 with
  | { B_dData_dPair.f_Pair_first = dtb__184; B_dData_dPair.f_Pair_second = dtb__185 } -> (if (dtb__184 = 0) then (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = Frontend_dAst.C_Qty_Q0; B_dData_dPair.f_Pair_second = dtb__185 })) else (if (dtb__184 = 1) then (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = Frontend_dAst.C_Qty_Q1; B_dData_dPair.f_Pair_second = dtb__185 })) else B_dData_dMaybe.C_Maybe_Nothing))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))))

# 325 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
let v_decReprTier = (fun (fuel : int) (bytes : Base_dBytes.t_Cur) -> (if (fuel <= 0) then B_dData_dMaybe.C_Maybe_Nothing else (let nd_uscrut2 = ((Base_dBytes.v_decTag fuel) bytes) in (match nd_uscrut2 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__186) -> (match dtb__186 with
  | { B_dData_dPair.f_Pair_first = dtb__187; B_dData_dPair.f_Pair_second = dtb__188 } -> (if (dtb__187 = 0) then (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = Frontend_dAst.C_ReprTier_ReprAuto; B_dData_dPair.f_Pair_second = dtb__188 })) else (if (dtb__187 = 1) then (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = Frontend_dAst.C_ReprTier_ReprAlias; B_dData_dPair.f_Pair_second = dtb__188 })) else (if (dtb__187 = 2) then (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = Frontend_dAst.C_ReprTier_ReprBoxed; B_dData_dPair.f_Pair_second = dtb__188 })) else B_dData_dMaybe.C_Maybe_Nothing)))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))))

# 340 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
let v_decMaybeQty = (fun (fuel : int) (bytes : Base_dBytes.t_Cur) -> (((Base_dBytes.v_decMaybe v_decQty) fuel) bytes))

# 898 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
let rec v_decListDigits = (fun (fuel : int) (acc : int) (c : Base_dBytes.t_Cur) -> (if (fuel <= 0) then B_dData_dMaybe.C_Maybe_Nothing else (match (Base_dBytes.v_curChar c) with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb__189) -> (if (dtb__189 = 58) then (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = acc; B_dData_dPair.f_Pair_second = (Base_dBytes.v_curSkip c) })) else (if (if (dtb__189 >= 48) then (dtb__189 <= 57) else false) then (((v_decListDigits (fuel - 1)) ((acc * 10) + (dtb__189 - 48))) (Base_dBytes.v_curSkip c)) else B_dData_dMaybe.C_Maybe_Nothing))
  | _ -> failwith "DT: impossible branch"
)))

# 888 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
let v_decListHead = (fun (fuel : int) (c : Base_dBytes.t_Cur) -> (if (fuel <= 0) then B_dData_dMaybe.C_Maybe_Nothing else (let nd_uscrut2 = (Base_dBytes.v_curChar c) in (match nd_uscrut2 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__190) -> (if (dtb__190 = 91) then (((v_decListDigits (fuel - 1)) 0) (Base_dBytes.v_curSkip c)) else B_dData_dMaybe.C_Maybe_Nothing)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
))))

# 368 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
let rec v_decPat = (fun (fuel : int) (bytes : Base_dBytes.t_Cur) -> (if (fuel <= 0) then B_dData_dMaybe.C_Maybe_Nothing else (let nd_uscrut2 = ((Base_dBytes.v_decTag fuel) bytes) in (match nd_uscrut2 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__191) -> (match dtb__191 with
  | { B_dData_dPair.f_Pair_first = dtb__192; B_dData_dPair.f_Pair_second = dtb__193 } -> (if (dtb__192 = 0) then (let nd_uscrut9 = ((Base_dBytes.v_decStr (fuel - 1)) dtb__193) in (match nd_uscrut9 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__194) -> (match dtb__194 with
  | { B_dData_dPair.f_Pair_first = dtb__195; B_dData_dPair.f_Pair_second = dtb__196 } -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Pat_PVar (dtb__195, (Frontend_dAst.v_detachedNodeRef v_noSpan))); B_dData_dPair.f_Pair_second = dtb__196 }))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) else (if (dtb__192 = 1) then (let nd_uscrut9 = ((Base_dBytes.v_decStr (fuel - 1)) dtb__193) in (match nd_uscrut9 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__197) -> (match dtb__197 with
  | { B_dData_dPair.f_Pair_first = dtb__198; B_dData_dPair.f_Pair_second = dtb__199 } -> (let nd_uscrut16 = ((v_decPat (fuel - 1)) dtb__199) in (match nd_uscrut16 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__200) -> (match dtb__200 with
  | { B_dData_dPair.f_Pair_first = dtb__201; B_dData_dPair.f_Pair_second = dtb__202 } -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Pat_PAs (dtb__198, dtb__201, (Frontend_dAst.v_detachedNodeRef v_noSpan))); B_dData_dPair.f_Pair_second = dtb__202 }))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) else (if (dtb__192 = 2) then (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Pat_PWild ((Frontend_dAst.v_detachedNodeRef v_noSpan))); B_dData_dPair.f_Pair_second = dtb__193 })) else (if (dtb__192 = 3) then (let nd_uscrut9 = ((Base_dBytes.v_decStr (fuel - 1)) dtb__193) in (match nd_uscrut9 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__203) -> (match dtb__203 with
  | { B_dData_dPair.f_Pair_first = dtb__204; B_dData_dPair.f_Pair_second = dtb__205 } -> (let nd_uscrut16 = ((v_decPatList (fuel - 1)) dtb__205) in (match nd_uscrut16 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__206) -> (match dtb__206 with
  | { B_dData_dPair.f_Pair_first = dtb__207; B_dData_dPair.f_Pair_second = dtb__208 } -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Pat_PCon (dtb__204, dtb__207, (Frontend_dAst.v_detachedNodeRef v_noSpan))); B_dData_dPair.f_Pair_second = dtb__208 }))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) else (if (dtb__192 = 4) then (let nd_uscrut9 = ((Base_dBytes.v_decInt (fuel - 1)) dtb__193) in (match nd_uscrut9 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__209) -> (match dtb__209 with
  | { B_dData_dPair.f_Pair_first = dtb__210; B_dData_dPair.f_Pair_second = dtb__211 } -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Pat_PInt (dtb__210, (Frontend_dAst.v_detachedNodeRef v_noSpan))); B_dData_dPair.f_Pair_second = dtb__211 }))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) else (if (dtb__192 = 5) then (let nd_uscrut9 = ((Base_dBytes.v_decStr (fuel - 1)) dtb__193) in (match nd_uscrut9 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__212) -> (match dtb__212 with
  | { B_dData_dPair.f_Pair_first = dtb__213; B_dData_dPair.f_Pair_second = dtb__214 } -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Pat_PStr (dtb__213, (Frontend_dAst.v_detachedNodeRef v_noSpan))); B_dData_dPair.f_Pair_second = dtb__214 }))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) else (if (dtb__192 = 6) then (let nd_uscrut9 = ((Base_dBytes.v_decStr (fuel - 1)) dtb__193) in (match nd_uscrut9 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__215) -> (match dtb__215 with
  | { B_dData_dPair.f_Pair_first = dtb__216; B_dData_dPair.f_Pair_second = dtb__217 } -> (let nd_uscrut16 = (((Base_dBytes.v_decList v_decStrPat) (fuel - 1)) dtb__217) in (match nd_uscrut16 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__218) -> (match dtb__218 with
  | { B_dData_dPair.f_Pair_first = dtb__219; B_dData_dPair.f_Pair_second = dtb__220 } -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Pat_PRecord (dtb__216, dtb__219, (Frontend_dAst.v_detachedNodeRef v_noSpan))); B_dData_dPair.f_Pair_second = dtb__220 }))
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
# 874 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
and v_decStrPat = (fun (fuel : int) (bytes : Base_dBytes.t_Cur) -> (if (fuel <= 0) then B_dData_dMaybe.C_Maybe_Nothing else (let nd_uscrut2 = ((Base_dBytes.v_decStr (fuel - 1)) bytes) in (match nd_uscrut2 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__221) -> (match dtb__221 with
  | { B_dData_dPair.f_Pair_first = dtb__222; B_dData_dPair.f_Pair_second = dtb__223 } -> (let nd_uscrut9 = ((v_decPat (fuel - 1)) dtb__223) in (match nd_uscrut9 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__224) -> (match dtb__224 with
  | { B_dData_dPair.f_Pair_first = dtb__225; B_dData_dPair.f_Pair_second = dtb__226 } -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = { B_dData_dPair.f_Pair_first = dtb__222; B_dData_dPair.f_Pair_second = dtb__225 }; B_dData_dPair.f_Pair_second = dtb__226 }))
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
# 935 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
and v_decPatList = (fun (fuel : int) (bytes : Base_dBytes.t_Cur) -> (if (fuel <= 0) then B_dData_dMaybe.C_Maybe_Nothing else (let nd_uscrut2 = ((v_decListHead fuel) bytes) in (match nd_uscrut2 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__227) -> (match dtb__227 with
  | { B_dData_dPair.f_Pair_first = dtb__228; B_dData_dPair.f_Pair_second = dtb__229 } -> ((((v_decPatListItems (fuel - 1)) dtb__228) dtb__229) B_dData_dList.C_List_Nil)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))))
# 945 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
and v_decPatListItems = (fun (fuel : int) (n : int) (bytes : Base_dBytes.t_Cur) (acc : Frontend_dAst.t_Pat B_dData_dList.t_List) -> (if (fuel <= 0) then B_dData_dMaybe.C_Maybe_Nothing else (if (n <= 0) then (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (B_dData_dList.v_reverse acc); B_dData_dPair.f_Pair_second = bytes })) else (let nd_uscrut4 = ((v_decPat (fuel - 1)) bytes) in (match nd_uscrut4 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__230) -> (match dtb__230 with
  | { B_dData_dPair.f_Pair_first = dtb__231; B_dData_dPair.f_Pair_second = dtb__232 } -> ((((v_decPatListItems (fuel - 1)) (n - 1)) dtb__232) (B_dData_dList.C_List__x58__x58_ (dtb__231, acc)))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)))))

# 348 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
let rec v_decInterpPart = (fun (fuel : int) (bytes : Base_dBytes.t_Cur) -> (if (fuel <= 0) then B_dData_dMaybe.C_Maybe_Nothing else (let nd_uscrut2 = ((Base_dBytes.v_decTag fuel) bytes) in (match nd_uscrut2 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__233) -> (match dtb__233 with
  | { B_dData_dPair.f_Pair_first = dtb__234; B_dData_dPair.f_Pair_second = dtb__235 } -> (if (dtb__234 = 0) then (let nd_uscrut9 = ((Base_dBytes.v_decStr (fuel - 1)) dtb__235) in (match nd_uscrut9 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__236) -> (match dtb__236 with
  | { B_dData_dPair.f_Pair_first = dtb__237; B_dData_dPair.f_Pair_second = dtb__238 } -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_InterpPart_IPText (dtb__237)); B_dData_dPair.f_Pair_second = dtb__238 }))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) else (if (dtb__234 = 1) then (let nd_uscrut9 = ((v_decExpr (fuel - 1)) dtb__235) in (match nd_uscrut9 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__239) -> (match dtb__239 with
  | { B_dData_dPair.f_Pair_first = dtb__240; B_dData_dPair.f_Pair_second = dtb__241 } -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_InterpPart_IPHole (dtb__240)); B_dData_dPair.f_Pair_second = dtb__241 }))
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
# 414 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
and v_decDoStmt = (fun (fuel : int) (bytes : Base_dBytes.t_Cur) -> (if (fuel <= 0) then B_dData_dMaybe.C_Maybe_Nothing else (let nd_uscrut2 = ((Base_dBytes.v_decTag fuel) bytes) in (match nd_uscrut2 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__242) -> (match dtb__242 with
  | { B_dData_dPair.f_Pair_first = dtb__243; B_dData_dPair.f_Pair_second = dtb__244 } -> (if (dtb__243 = 0) then (let nd_uscrut9 = ((v_decPat (fuel - 1)) dtb__244) in (match nd_uscrut9 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__245) -> (match dtb__245 with
  | { B_dData_dPair.f_Pair_first = dtb__246; B_dData_dPair.f_Pair_second = dtb__247 } -> (let nd_uscrut16 = ((v_decExpr (fuel - 1)) dtb__247) in (match nd_uscrut16 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__248) -> (match dtb__248 with
  | { B_dData_dPair.f_Pair_first = dtb__249; B_dData_dPair.f_Pair_second = dtb__250 } -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_DoStmt_DBind (dtb__246, dtb__249, Frontend_dAst.v_noNodeRef)); B_dData_dPair.f_Pair_second = dtb__250 }))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) else (if (dtb__243 = 1) then (let nd_uscrut9 = ((v_decExpr (fuel - 1)) dtb__244) in (match nd_uscrut9 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__251) -> (match dtb__251 with
  | { B_dData_dPair.f_Pair_first = dtb__252; B_dData_dPair.f_Pair_second = dtb__253 } -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_DoStmt_DExpr (dtb__252, Frontend_dAst.v_noNodeRef)); B_dData_dPair.f_Pair_second = dtb__253 }))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) else (if (dtb__243 = 2) then (let nd_uscrut9 = (((Base_dBytes.v_decList v_decBinding) (fuel - 1)) dtb__244) in (match nd_uscrut9 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__254) -> (match dtb__254 with
  | { B_dData_dPair.f_Pair_first = dtb__255; B_dData_dPair.f_Pair_second = dtb__256 } -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_DoStmt_DLet (dtb__255, Frontend_dAst.v_noNodeRef)); B_dData_dPair.f_Pair_second = dtb__256 }))
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
# 441 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
and v_decExpr = (fun (fuel : int) (bytes : Base_dBytes.t_Cur) -> (if (fuel <= 0) then B_dData_dMaybe.C_Maybe_Nothing else (let nd_uscrut2 = ((Base_dBytes.v_decTag fuel) bytes) in (match nd_uscrut2 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__257) -> (match dtb__257 with
  | { B_dData_dPair.f_Pair_first = dtb__258; B_dData_dPair.f_Pair_second = dtb__259 } -> (if (dtb__258 = 0) then (let nd_uscrut9 = ((Base_dBytes.v_decStr (fuel - 1)) dtb__259) in (match nd_uscrut9 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__260) -> (match dtb__260 with
  | { B_dData_dPair.f_Pair_first = dtb__261; B_dData_dPair.f_Pair_second = dtb__262 } -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Expr_EVar (dtb__261, (Frontend_dAst.v_detachedNodeRef v_noSpan))); B_dData_dPair.f_Pair_second = dtb__262 }))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) else (if (dtb__258 = 1) then (let nd_uscrut9 = ((Base_dBytes.v_decInt (fuel - 1)) dtb__259) in (match nd_uscrut9 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__263) -> (match dtb__263 with
  | { B_dData_dPair.f_Pair_first = dtb__264; B_dData_dPair.f_Pair_second = dtb__265 } -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Expr_EInt (dtb__264, (Frontend_dAst.v_detachedNodeRef v_noSpan))); B_dData_dPair.f_Pair_second = dtb__265 }))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) else (if (dtb__258 = 2) then (let nd_uscrut9 = ((Base_dBytes.v_decStr (fuel - 1)) dtb__259) in (match nd_uscrut9 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__266) -> (match dtb__266 with
  | { B_dData_dPair.f_Pair_first = dtb__267; B_dData_dPair.f_Pair_second = dtb__268 } -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Expr_EStr (dtb__267, (Frontend_dAst.v_detachedNodeRef v_noSpan))); B_dData_dPair.f_Pair_second = dtb__268 }))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) else (if (dtb__258 = 3) then (let nd_uscrut9 = (((Base_dBytes.v_decList Base_dBytes.v_decStr) (fuel - 1)) dtb__259) in (match nd_uscrut9 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__269) -> (match dtb__269 with
  | { B_dData_dPair.f_Pair_first = dtb__270; B_dData_dPair.f_Pair_second = dtb__271 } -> (let nd_uscrut16 = ((v_decExpr (fuel - 1)) dtb__271) in (match nd_uscrut16 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__272) -> (match dtb__272 with
  | { B_dData_dPair.f_Pair_first = dtb__273; B_dData_dPair.f_Pair_second = dtb__274 } -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Expr_ELam (((B_dData_dList.v_map (fun (n : string) -> { B_dData_dPair.f_Pair_first = n; B_dData_dPair.f_Pair_second = v_noSpan })) dtb__270), dtb__273, (Frontend_dAst.v_detachedNodeRef v_noSpan))); B_dData_dPair.f_Pair_second = dtb__274 }))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) else (if (dtb__258 = 4) then (let nd_uscrut9 = ((v_decExpr (fuel - 1)) dtb__259) in (match nd_uscrut9 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__275) -> (match dtb__275 with
  | { B_dData_dPair.f_Pair_first = dtb__276; B_dData_dPair.f_Pair_second = dtb__277 } -> (let nd_uscrut16 = ((v_decExprList (fuel - 1)) dtb__277) in (match nd_uscrut16 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__278) -> (match dtb__278 with
  | { B_dData_dPair.f_Pair_first = dtb__279; B_dData_dPair.f_Pair_second = dtb__280 } -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Expr_EApp (dtb__276, dtb__279, (Frontend_dAst.v_detachedNodeRef v_noSpan))); B_dData_dPair.f_Pair_second = dtb__280 }))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) else (if (dtb__258 = 5) then (let nd_uscrut9 = ((Base_dBytes.v_decStr (fuel - 1)) dtb__259) in (match nd_uscrut9 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__281) -> (match dtb__281 with
  | { B_dData_dPair.f_Pair_first = dtb__282; B_dData_dPair.f_Pair_second = dtb__283 } -> (let nd_uscrut16 = ((Base_dBytes.v_decBool (fuel - 1)) dtb__283) in (match nd_uscrut16 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__284) -> (match dtb__284 with
  | { B_dData_dPair.f_Pair_first = dtb__285; B_dData_dPair.f_Pair_second = dtb__286 } -> (let nd_uscrut23 = (((Base_dBytes.v_decMaybe v_decQty) (fuel - 1)) dtb__286) in (match nd_uscrut23 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__287) -> (match dtb__287 with
  | { B_dData_dPair.f_Pair_first = dtb__288; B_dData_dPair.f_Pair_second = dtb__289 } -> (let nd_uscrut30 = ((v_decExpr (fuel - 1)) dtb__289) in (match nd_uscrut30 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__290) -> (match dtb__290 with
  | { B_dData_dPair.f_Pair_first = dtb__291; B_dData_dPair.f_Pair_second = dtb__292 } -> (let nd_uscrut37 = ((v_decExpr (fuel - 1)) dtb__292) in (match nd_uscrut37 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__293) -> (match dtb__293 with
  | { B_dData_dPair.f_Pair_first = dtb__294; B_dData_dPair.f_Pair_second = dtb__295 } -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Expr_EPi (dtb__282, dtb__285, dtb__288, dtb__291, dtb__294, (Frontend_dAst.v_detachedNodeRef v_noSpan))); B_dData_dPair.f_Pair_second = dtb__295 }))
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
)) else (if (dtb__258 = 6) then (let nd_uscrut9 = (((Base_dBytes.v_decList v_decBinding) (fuel - 1)) dtb__259) in (match nd_uscrut9 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__296) -> (match dtb__296 with
  | { B_dData_dPair.f_Pair_first = dtb__297; B_dData_dPair.f_Pair_second = dtb__298 } -> (let nd_uscrut16 = ((v_decExpr (fuel - 1)) dtb__298) in (match nd_uscrut16 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__299) -> (match dtb__299 with
  | { B_dData_dPair.f_Pair_first = dtb__300; B_dData_dPair.f_Pair_second = dtb__301 } -> (let nd_uscrut23 = ((Base_dBytes.v_decBool (fuel - 1)) dtb__301) in (match nd_uscrut23 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__302) -> (match dtb__302 with
  | { B_dData_dPair.f_Pair_first = dtb__303; B_dData_dPair.f_Pair_second = dtb__304 } -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Expr_ELet (dtb__297, dtb__300, dtb__303, (Frontend_dAst.v_detachedNodeRef v_noSpan))); B_dData_dPair.f_Pair_second = dtb__304 }))
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
)) else (if (dtb__258 = 7) then (let nd_uscrut9 = (((Base_dBytes.v_decList v_decClause) (fuel - 1)) dtb__259) in (match nd_uscrut9 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__305) -> (match dtb__305 with
  | { B_dData_dPair.f_Pair_first = dtb__306; B_dData_dPair.f_Pair_second = dtb__307 } -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Expr_ELocalFun (dtb__306, (Frontend_dAst.v_detachedNodeRef v_noSpan))); B_dData_dPair.f_Pair_second = dtb__307 }))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) else (if (dtb__258 = 8) then (let nd_uscrut9 = ((v_decExpr (fuel - 1)) dtb__259) in (match nd_uscrut9 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__308) -> (match dtb__308 with
  | { B_dData_dPair.f_Pair_first = dtb__309; B_dData_dPair.f_Pair_second = dtb__310 } -> (let nd_uscrut16 = (((Base_dBytes.v_decList v_decAlt) (fuel - 1)) dtb__310) in (match nd_uscrut16 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__311) -> (match dtb__311 with
  | { B_dData_dPair.f_Pair_first = dtb__312; B_dData_dPair.f_Pair_second = dtb__313 } -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Expr_ECase (dtb__309, dtb__312, (Frontend_dAst.v_detachedNodeRef v_noSpan))); B_dData_dPair.f_Pair_second = dtb__313 }))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) else (if (dtb__258 = 9) then (let nd_uscrut9 = ((v_decExpr (fuel - 1)) dtb__259) in (match nd_uscrut9 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__314) -> (match dtb__314 with
  | { B_dData_dPair.f_Pair_first = dtb__315; B_dData_dPair.f_Pair_second = dtb__316 } -> (let nd_uscrut16 = ((v_decExpr (fuel - 1)) dtb__316) in (match nd_uscrut16 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__317) -> (match dtb__317 with
  | { B_dData_dPair.f_Pair_first = dtb__318; B_dData_dPair.f_Pair_second = dtb__319 } -> (let nd_uscrut23 = ((v_decExpr (fuel - 1)) dtb__319) in (match nd_uscrut23 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__320) -> (match dtb__320 with
  | { B_dData_dPair.f_Pair_first = dtb__321; B_dData_dPair.f_Pair_second = dtb__322 } -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Expr_EIf (dtb__315, dtb__318, dtb__321, (Frontend_dAst.v_detachedNodeRef v_noSpan))); B_dData_dPair.f_Pair_second = dtb__322 }))
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
)) else (if (dtb__258 = 10) then (let nd_uscrut9 = ((v_decExpr (fuel - 1)) dtb__259) in (match nd_uscrut9 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__323) -> (match dtb__323 with
  | { B_dData_dPair.f_Pair_first = dtb__324; B_dData_dPair.f_Pair_second = dtb__325 } -> (let nd_uscrut16 = ((Base_dBytes.v_decStr (fuel - 1)) dtb__325) in (match nd_uscrut16 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__326) -> (match dtb__326 with
  | { B_dData_dPair.f_Pair_first = dtb__327; B_dData_dPair.f_Pair_second = dtb__328 } -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Expr_EField (dtb__324, dtb__327, (Frontend_dAst.v_detachedNodeRef v_noSpan))); B_dData_dPair.f_Pair_second = dtb__328 }))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) else (if (dtb__258 = 11) then (let nd_uscrut9 = ((Base_dBytes.v_decStr (fuel - 1)) dtb__259) in (match nd_uscrut9 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__329) -> (match dtb__329 with
  | { B_dData_dPair.f_Pair_first = dtb__330; B_dData_dPair.f_Pair_second = dtb__331 } -> (let nd_uscrut16 = (((Base_dBytes.v_decList v_decStrExpr) (fuel - 1)) dtb__331) in (match nd_uscrut16 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__332) -> (match dtb__332 with
  | { B_dData_dPair.f_Pair_first = dtb__333; B_dData_dPair.f_Pair_second = dtb__334 } -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Expr_ERecord (dtb__330, dtb__333, (Frontend_dAst.v_detachedNodeRef v_noSpan))); B_dData_dPair.f_Pair_second = dtb__334 }))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) else (if (dtb__258 = 12) then (let nd_uscrut9 = ((v_decExpr (fuel - 1)) dtb__259) in (match nd_uscrut9 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__335) -> (match dtb__335 with
  | { B_dData_dPair.f_Pair_first = dtb__336; B_dData_dPair.f_Pair_second = dtb__337 } -> (let nd_uscrut16 = (((Base_dBytes.v_decList v_decStrExpr) (fuel - 1)) dtb__337) in (match nd_uscrut16 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__338) -> (match dtb__338 with
  | { B_dData_dPair.f_Pair_first = dtb__339; B_dData_dPair.f_Pair_second = dtb__340 } -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Expr_ERecUpdate (dtb__336, dtb__339, (Frontend_dAst.v_detachedNodeRef v_noSpan))); B_dData_dPair.f_Pair_second = dtb__340 }))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) else (if (dtb__258 = 13) then (let nd_uscrut9 = (((Base_dBytes.v_decList v_decDoStmt) (fuel - 1)) dtb__259) in (match nd_uscrut9 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__341) -> (match dtb__341 with
  | { B_dData_dPair.f_Pair_first = dtb__342; B_dData_dPair.f_Pair_second = dtb__343 } -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Expr_EDo (dtb__342, (Frontend_dAst.v_detachedNodeRef v_noSpan))); B_dData_dPair.f_Pair_second = dtb__343 }))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) else (if (dtb__258 = 14) then (let nd_uscrut9 = ((Base_dBytes.v_decStr (fuel - 1)) dtb__259) in (match nd_uscrut9 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__344) -> (match dtb__344 with
  | { B_dData_dPair.f_Pair_first = dtb__345; B_dData_dPair.f_Pair_second = dtb__346 } -> (let nd_uscrut16 = ((v_decExpr (fuel - 1)) dtb__346) in (match nd_uscrut16 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__347) -> (match dtb__347 with
  | { B_dData_dPair.f_Pair_first = dtb__348; B_dData_dPair.f_Pair_second = dtb__349 } -> (let nd_uscrut23 = ((v_decExpr (fuel - 1)) dtb__349) in (match nd_uscrut23 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__350) -> (match dtb__350 with
  | { B_dData_dPair.f_Pair_first = dtb__351; B_dData_dPair.f_Pair_second = dtb__352 } -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Expr_EInfix (dtb__345, dtb__348, dtb__351, (Frontend_dAst.v_detachedNodeRef v_noSpan))); B_dData_dPair.f_Pair_second = dtb__352 }))
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
)) else (if (dtb__258 = 15) then (let nd_uscrut9 = ((v_decExpr (fuel - 1)) dtb__259) in (match nd_uscrut9 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__353) -> (match dtb__353 with
  | { B_dData_dPair.f_Pair_first = dtb__354; B_dData_dPair.f_Pair_second = dtb__355 } -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Expr_EParen (dtb__354, (Frontend_dAst.v_detachedNodeRef v_noSpan))); B_dData_dPair.f_Pair_second = dtb__355 }))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) else (if (dtb__258 = 16) then (let nd_uscrut9 = ((Base_dBytes.v_decStr (fuel - 1)) dtb__259) in (match nd_uscrut9 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__356) -> (match dtb__356 with
  | { B_dData_dPair.f_Pair_first = dtb__357; B_dData_dPair.f_Pair_second = dtb__358 } -> (let nd_uscrut16 = ((v_decExpr (fuel - 1)) dtb__358) in (match nd_uscrut16 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__359) -> (match dtb__359 with
  | { B_dData_dPair.f_Pair_first = dtb__360; B_dData_dPair.f_Pair_second = dtb__361 } -> (let nd_uscrut23 = ((v_decExpr (fuel - 1)) dtb__361) in (match nd_uscrut23 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__362) -> (match dtb__362 with
  | { B_dData_dPair.f_Pair_first = dtb__363; B_dData_dPair.f_Pair_second = dtb__364 } -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Expr_EBacktick (dtb__357, dtb__360, dtb__363, (Frontend_dAst.v_detachedNodeRef v_noSpan))); B_dData_dPair.f_Pair_second = dtb__364 }))
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
)) else (if (dtb__258 = 17) then (let nd_uscrut9 = ((Base_dBytes.v_decStr (fuel - 1)) dtb__259) in (match nd_uscrut9 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__365) -> (match dtb__365 with
  | { B_dData_dPair.f_Pair_first = dtb__366; B_dData_dPair.f_Pair_second = dtb__367 } -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Expr_ESectOp (dtb__366, (Frontend_dAst.v_detachedNodeRef v_noSpan))); B_dData_dPair.f_Pair_second = dtb__367 }))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) else (if (dtb__258 = 18) then (let nd_uscrut9 = ((Base_dBytes.v_decStr (fuel - 1)) dtb__259) in (match nd_uscrut9 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__368) -> (match dtb__368 with
  | { B_dData_dPair.f_Pair_first = dtb__369; B_dData_dPair.f_Pair_second = dtb__370 } -> (let nd_uscrut16 = ((v_decExpr (fuel - 1)) dtb__370) in (match nd_uscrut16 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__371) -> (match dtb__371 with
  | { B_dData_dPair.f_Pair_first = dtb__372; B_dData_dPair.f_Pair_second = dtb__373 } -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Expr_ESectL (dtb__369, dtb__372, (Frontend_dAst.v_detachedNodeRef v_noSpan))); B_dData_dPair.f_Pair_second = dtb__373 }))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) else (if (dtb__258 = 19) then (let nd_uscrut9 = ((v_decExpr (fuel - 1)) dtb__259) in (match nd_uscrut9 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__374) -> (match dtb__374 with
  | { B_dData_dPair.f_Pair_first = dtb__375; B_dData_dPair.f_Pair_second = dtb__376 } -> (let nd_uscrut16 = ((Base_dBytes.v_decStr (fuel - 1)) dtb__376) in (match nd_uscrut16 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__377) -> (match dtb__377 with
  | { B_dData_dPair.f_Pair_first = dtb__378; B_dData_dPair.f_Pair_second = dtb__379 } -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Expr_ESectR (dtb__375, dtb__378, (Frontend_dAst.v_detachedNodeRef v_noSpan))); B_dData_dPair.f_Pair_second = dtb__379 }))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) else (if (dtb__258 = 20) then (let nd_uscrut9 = ((v_decExpr (fuel - 1)) dtb__259) in (match nd_uscrut9 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__380) -> (match dtb__380 with
  | { B_dData_dPair.f_Pair_first = dtb__381; B_dData_dPair.f_Pair_second = dtb__382 } -> (let nd_uscrut16 = ((v_decExpr (fuel - 1)) dtb__382) in (match nd_uscrut16 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__383) -> (match dtb__383 with
  | { B_dData_dPair.f_Pair_first = dtb__384; B_dData_dPair.f_Pair_second = dtb__385 } -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Expr_EAnn (dtb__381, dtb__384, (Frontend_dAst.v_detachedNodeRef v_noSpan))); B_dData_dPair.f_Pair_second = dtb__385 }))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) else (if (dtb__258 = 21) then (let nd_uscrut9 = ((Base_dBytes.v_decBool (fuel - 1)) dtb__259) in (match nd_uscrut9 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__386) -> (match dtb__386 with
  | { B_dData_dPair.f_Pair_first = dtb__387; B_dData_dPair.f_Pair_second = dtb__388 } -> (let nd_uscrut16 = (((Base_dBytes.v_decList v_decInterpPart) (fuel - 1)) dtb__388) in (match nd_uscrut16 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__389) -> (match dtb__389 with
  | { B_dData_dPair.f_Pair_first = dtb__390; B_dData_dPair.f_Pair_second = dtb__391 } -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Expr_EInterp (dtb__387, dtb__390, (Frontend_dAst.v_detachedNodeRef v_noSpan))); B_dData_dPair.f_Pair_second = dtb__391 }))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) else (if (dtb__258 = 22) then (let nd_uscrut9 = ((Base_dBytes.v_decStr (fuel - 1)) dtb__259) in (match nd_uscrut9 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__392) -> (match dtb__392 with
  | { B_dData_dPair.f_Pair_first = dtb__393; B_dData_dPair.f_Pair_second = dtb__394 } -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Expr_EFloat (dtb__393, (Frontend_dAst.v_detachedNodeRef v_noSpan))); B_dData_dPair.f_Pair_second = dtb__394 }))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) else B_dData_dMaybe.C_Maybe_Nothing)))))))))))))))))))))))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))))
# 809 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
and v_decBinding = (fun (fuel : int) (bytes : Base_dBytes.t_Cur) -> (if (fuel <= 0) then B_dData_dMaybe.C_Maybe_Nothing else (let nd_uscrut2 = ((v_decPat (fuel - 1)) bytes) in (match nd_uscrut2 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__395) -> (match dtb__395 with
  | { B_dData_dPair.f_Pair_first = dtb__396; B_dData_dPair.f_Pair_second = dtb__397 } -> (let nd_uscrut9 = ((Base_dBytes.v_decTag fuel) dtb__397) in (match nd_uscrut9 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__398) -> (match dtb__398 with
  | { B_dData_dPair.f_Pair_first = dtb__399; B_dData_dPair.f_Pair_second = dtb__400 } -> (if (dtb__399 = 0) then (let nd_uscrut16 = ((v_decExpr (fuel - 1)) dtb__400) in (match nd_uscrut16 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__401) -> (match dtb__401 with
  | { B_dData_dPair.f_Pair_first = dtb__402; B_dData_dPair.f_Pair_second = dtb__403 } -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = { Frontend_dAst.f_Binding_bindPat = dtb__396; Frontend_dAst.f_Binding_bindValue = dtb__402; Frontend_dAst.f_Binding_bindSig = B_dData_dMaybe.C_Maybe_Nothing; Frontend_dAst.f_Binding_bindRef = Frontend_dAst.v_noNodeRef }; B_dData_dPair.f_Pair_second = dtb__403 }))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) else (if (dtb__399 = 1) then (let nd_uscrut16 = ((v_decExpr (fuel - 1)) dtb__400) in (match nd_uscrut16 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__404) -> (match dtb__404 with
  | { B_dData_dPair.f_Pair_first = dtb__405; B_dData_dPair.f_Pair_second = dtb__406 } -> (let nd_uscrut23 = ((v_decExpr (fuel - 1)) dtb__406) in (match nd_uscrut23 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__407) -> (match dtb__407 with
  | { B_dData_dPair.f_Pair_first = dtb__408; B_dData_dPair.f_Pair_second = dtb__409 } -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = { Frontend_dAst.f_Binding_bindPat = dtb__396; Frontend_dAst.f_Binding_bindValue = dtb__408; Frontend_dAst.f_Binding_bindSig = (B_dData_dMaybe.C_Maybe_Just ({ Frontend_dAst.f_BindingSig_sigType = dtb__405; Frontend_dAst.f_BindingSig_sigRef = Frontend_dAst.v_noNodeRef })); Frontend_dAst.f_Binding_bindRef = Frontend_dAst.v_noNodeRef }; B_dData_dPair.f_Pair_second = dtb__409 }))
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
# 835 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
and v_decAlt = (fun (fuel : int) (bytes : Base_dBytes.t_Cur) -> (if (fuel <= 0) then B_dData_dMaybe.C_Maybe_Nothing else (let nd_uscrut2 = ((v_decPat (fuel - 1)) bytes) in (match nd_uscrut2 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__410) -> (match dtb__410 with
  | { B_dData_dPair.f_Pair_first = dtb__411; B_dData_dPair.f_Pair_second = dtb__412 } -> (let nd_uscrut9 = ((v_decExpr (fuel - 1)) dtb__412) in (match nd_uscrut9 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__413) -> (match dtb__413 with
  | { B_dData_dPair.f_Pair_first = dtb__414; B_dData_dPair.f_Pair_second = dtb__415 } -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = { Frontend_dAst.f_Alt_altPat = dtb__411; Frontend_dAst.f_Alt_altBody = dtb__414; Frontend_dAst.f_Alt_altRef = Frontend_dAst.v_noNodeRef }; B_dData_dPair.f_Pair_second = dtb__415 }))
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
# 848 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
and v_decClause = (fun (fuel : int) (bytes : Base_dBytes.t_Cur) -> (if (fuel <= 0) then B_dData_dMaybe.C_Maybe_Nothing else (let nd_uscrut2 = ((v_decPatList (fuel - 1)) bytes) in (match nd_uscrut2 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__416) -> (match dtb__416 with
  | { B_dData_dPair.f_Pair_first = dtb__417; B_dData_dPair.f_Pair_second = dtb__418 } -> (let nd_uscrut9 = ((v_decExpr (fuel - 1)) dtb__418) in (match nd_uscrut9 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__419) -> (match dtb__419 with
  | { B_dData_dPair.f_Pair_first = dtb__420; B_dData_dPair.f_Pair_second = dtb__421 } -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = { Frontend_dAst.f_LocalClause_lcPats = dtb__417; Frontend_dAst.f_LocalClause_lcBody = dtb__420; Frontend_dAst.f_LocalClause_lcRef = Frontend_dAst.v_noNodeRef; Frontend_dAst.f_LocalClause_lcHead = Frontend_dAst.v_noNodeRef }; B_dData_dPair.f_Pair_second = dtb__421 }))
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
# 861 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
and v_decStrExpr = (fun (fuel : int) (bytes : Base_dBytes.t_Cur) -> (if (fuel <= 0) then B_dData_dMaybe.C_Maybe_Nothing else (let nd_uscrut2 = ((Base_dBytes.v_decStr (fuel - 1)) bytes) in (match nd_uscrut2 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__422) -> (match dtb__422 with
  | { B_dData_dPair.f_Pair_first = dtb__423; B_dData_dPair.f_Pair_second = dtb__424 } -> (let nd_uscrut9 = ((v_decExpr (fuel - 1)) dtb__424) in (match nd_uscrut9 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__425) -> (match dtb__425 with
  | { B_dData_dPair.f_Pair_first = dtb__426; B_dData_dPair.f_Pair_second = dtb__427 } -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = { B_dData_dPair.f_Pair_first = dtb__423; B_dData_dPair.f_Pair_second = dtb__426 }; B_dData_dPair.f_Pair_second = dtb__427 }))
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
# 913 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
and v_decExprList = (fun (fuel : int) (bytes : Base_dBytes.t_Cur) -> (if (fuel <= 0) then B_dData_dMaybe.C_Maybe_Nothing else (let nd_uscrut2 = ((v_decListHead fuel) bytes) in (match nd_uscrut2 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__428) -> (match dtb__428 with
  | { B_dData_dPair.f_Pair_first = dtb__429; B_dData_dPair.f_Pair_second = dtb__430 } -> ((((v_decExprListItems (fuel - 1)) dtb__429) dtb__430) B_dData_dList.C_List_Nil)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))))
# 923 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
and v_decExprListItems = (fun (fuel : int) (n : int) (bytes : Base_dBytes.t_Cur) (acc : Frontend_dAst.t_Expr B_dData_dList.t_List) -> (if (fuel <= 0) then B_dData_dMaybe.C_Maybe_Nothing else (if (n <= 0) then (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (B_dData_dList.v_reverse acc); B_dData_dPair.f_Pair_second = bytes })) else (let nd_uscrut4 = ((v_decExpr (fuel - 1)) bytes) in (match nd_uscrut4 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__431) -> (match dtb__431 with
  | { B_dData_dPair.f_Pair_first = dtb__432; B_dData_dPair.f_Pair_second = dtb__433 } -> ((((v_decExprListItems (fuel - 1)) (n - 1)) dtb__433) (B_dData_dList.C_List__x58__x58_ (dtb__432, acc)))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)))))

# 344 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
let v_decMaybeExpr = (fun (fuel : int) (bytes : Base_dBytes.t_Cur) -> (((Base_dBytes.v_decMaybe v_decExpr) fuel) bytes))

# 611 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
let v_decCtor = (fun (fuel : int) (bytes : Base_dBytes.t_Cur) -> (if (fuel <= 0) then B_dData_dMaybe.C_Maybe_Nothing else (let nd_uscrut2 = ((Base_dBytes.v_decTag fuel) bytes) in (match nd_uscrut2 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__434) -> (match dtb__434 with
  | { B_dData_dPair.f_Pair_first = dtb__435; B_dData_dPair.f_Pair_second = dtb__436 } -> (if (dtb__435 = 0) then (let nd_uscrut9 = ((Base_dBytes.v_decStr (fuel - 1)) dtb__436) in (match nd_uscrut9 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__437) -> (match dtb__437 with
  | { B_dData_dPair.f_Pair_first = dtb__438; B_dData_dPair.f_Pair_second = dtb__439 } -> (let nd_uscrut16 = ((v_decExpr (fuel - 1)) dtb__439) in (match nd_uscrut16 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__440) -> (match dtb__440 with
  | { B_dData_dPair.f_Pair_first = dtb__441; B_dData_dPair.f_Pair_second = dtb__442 } -> (let nd_uscrut23 = ((Base_dBytes.v_decInt (fuel - 1)) dtb__442) in (match nd_uscrut23 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__443) -> (match dtb__443 with
  | { B_dData_dPair.f_Pair_first = dtb__444; B_dData_dPair.f_Pair_second = dtb__445 } -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = { Frontend_dAst.f_Ctor_ctorName = dtb__438; Frontend_dAst.f_Ctor_ctorType = dtb__441; Frontend_dAst.f_Ctor_ctorArity = dtb__444; Frontend_dAst.f_Ctor_ctorRef = Frontend_dAst.v_noNodeRef }; B_dData_dPair.f_Pair_second = dtb__445 }))
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

# 633 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
let v_decField = (fun (fuel : int) (bytes : Base_dBytes.t_Cur) -> (if (fuel <= 0) then B_dData_dMaybe.C_Maybe_Nothing else (let nd_uscrut2 = ((Base_dBytes.v_decTag fuel) bytes) in (match nd_uscrut2 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__446) -> (match dtb__446 with
  | { B_dData_dPair.f_Pair_first = dtb__447; B_dData_dPair.f_Pair_second = dtb__448 } -> (if (dtb__447 = 0) then (let nd_uscrut9 = ((Base_dBytes.v_decStr (fuel - 1)) dtb__448) in (match nd_uscrut9 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__449) -> (match dtb__449 with
  | { B_dData_dPair.f_Pair_first = dtb__450; B_dData_dPair.f_Pair_second = dtb__451 } -> (let nd_uscrut16 = ((v_decExpr (fuel - 1)) dtb__451) in (match nd_uscrut16 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__452) -> (match dtb__452 with
  | { B_dData_dPair.f_Pair_first = dtb__453; B_dData_dPair.f_Pair_second = dtb__454 } -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = { Frontend_dAst.f_Field_fieldName = dtb__450; Frontend_dAst.f_Field_fieldType = dtb__453; Frontend_dAst.f_Field_fieldRef = Frontend_dAst.v_noNodeRef }; B_dData_dPair.f_Pair_second = dtb__454 }))
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

# 652 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
let v_decTraitParam = (fun (fuel : int) (bytes : Base_dBytes.t_Cur) -> (if (fuel <= 0) then B_dData_dMaybe.C_Maybe_Nothing else (let nd_uscrut2 = ((Base_dBytes.v_decTag fuel) bytes) in (match nd_uscrut2 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__455) -> (match dtb__455 with
  | { B_dData_dPair.f_Pair_first = dtb__456; B_dData_dPair.f_Pair_second = dtb__457 } -> (if (dtb__456 = 0) then (let nd_uscrut9 = ((Base_dBytes.v_decStr (fuel - 1)) dtb__457) in (match nd_uscrut9 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__458) -> (match dtb__458 with
  | { B_dData_dPair.f_Pair_first = dtb__459; B_dData_dPair.f_Pair_second = dtb__460 } -> (let nd_uscrut16 = (((Base_dBytes.v_decMaybe v_decExpr) (fuel - 1)) dtb__460) in (match nd_uscrut16 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__461) -> (match dtb__461 with
  | { B_dData_dPair.f_Pair_first = dtb__462; B_dData_dPair.f_Pair_second = dtb__463 } -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = { Frontend_dAst.f_TraitParam_traitParamName = dtb__459; Frontend_dAst.f_TraitParam_traitParamKind = dtb__462 }; B_dData_dPair.f_Pair_second = dtb__463 }))
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

# 671 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
let v_decTraitMethod = (fun (fuel : int) (bytes : Base_dBytes.t_Cur) -> (if (fuel <= 0) then B_dData_dMaybe.C_Maybe_Nothing else (let nd_uscrut2 = ((Base_dBytes.v_decTag fuel) bytes) in (match nd_uscrut2 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__464) -> (match dtb__464 with
  | { B_dData_dPair.f_Pair_first = dtb__465; B_dData_dPair.f_Pair_second = dtb__466 } -> (if (dtb__465 = 0) then (let nd_uscrut9 = ((Base_dBytes.v_decStr (fuel - 1)) dtb__466) in (match nd_uscrut9 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__467) -> (match dtb__467 with
  | { B_dData_dPair.f_Pair_first = dtb__468; B_dData_dPair.f_Pair_second = dtb__469 } -> (let nd_uscrut16 = ((v_decExpr (fuel - 1)) dtb__469) in (match nd_uscrut16 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__470) -> (match dtb__470 with
  | { B_dData_dPair.f_Pair_first = dtb__471; B_dData_dPair.f_Pair_second = dtb__472 } -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = { Frontend_dAst.f_TraitMethod_traitMethodName = dtb__468; Frontend_dAst.f_TraitMethod_traitMethodType = dtb__471; Frontend_dAst.f_TraitMethod_traitMethodRef = Frontend_dAst.v_noNodeRef }; B_dData_dPair.f_Pair_second = dtb__472 }))
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

# 690 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
let rec v_decDecl = (fun (fuel : int) (bytes : Base_dBytes.t_Cur) -> (if (fuel <= 0) then B_dData_dMaybe.C_Maybe_Nothing else (let nd_uscrut2 = ((Base_dBytes.v_decTag fuel) bytes) in (match nd_uscrut2 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__473) -> (match dtb__473 with
  | { B_dData_dPair.f_Pair_first = dtb__474; B_dData_dPair.f_Pair_second = dtb__475 } -> (if (dtb__474 = 0) then (let nd_uscrut9 = ((Base_dBytes.v_decStr (fuel - 1)) dtb__475) in (match nd_uscrut9 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__476) -> (match dtb__476 with
  | { B_dData_dPair.f_Pair_first = dtb__477; B_dData_dPair.f_Pair_second = dtb__478 } -> (let nd_uscrut16 = (((Base_dBytes.v_decList Base_dBytes.v_decStr) (fuel - 1)) dtb__478) in (match nd_uscrut16 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__479) -> (match dtb__479 with
  | { B_dData_dPair.f_Pair_first = dtb__480; B_dData_dPair.f_Pair_second = dtb__481 } -> (let nd_uscrut23 = ((v_decExpr (fuel - 1)) dtb__481) in (match nd_uscrut23 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__482) -> (match dtb__482 with
  | { B_dData_dPair.f_Pair_first = dtb__483; B_dData_dPair.f_Pair_second = dtb__484 } -> (let nd_uscrut30 = (((Base_dBytes.v_decList v_decCtor) (fuel - 1)) dtb__484) in (match nd_uscrut30 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__485) -> (match dtb__485 with
  | { B_dData_dPair.f_Pair_first = dtb__486; B_dData_dPair.f_Pair_second = dtb__487 } -> (let nd_uscrut37 = (((Base_dBytes.v_decList Base_dBytes.v_decStr) (fuel - 1)) dtb__487) in (match nd_uscrut37 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__488) -> (match dtb__488 with
  | { B_dData_dPair.f_Pair_first = dtb__489; B_dData_dPair.f_Pair_second = dtb__490 } -> (let nd_uscrut44 = ((Base_dBytes.v_decBool (fuel - 1)) dtb__490) in (match nd_uscrut44 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__491) -> (match dtb__491 with
  | { B_dData_dPair.f_Pair_first = dtb__492; B_dData_dPair.f_Pair_second = dtb__493 } -> (let nd_uscrut51 = ((v_decReprTier (fuel - 1)) dtb__493) in (match nd_uscrut51 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__494) -> (match dtb__494 with
  | { B_dData_dPair.f_Pair_first = dtb__495; B_dData_dPair.f_Pair_second = dtb__496 } -> (let nd_uscrut58 = ((Base_dBytes.v_decBool (fuel - 1)) dtb__496) in (match nd_uscrut58 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__497) -> (match dtb__497 with
  | { B_dData_dPair.f_Pair_first = dtb__498; B_dData_dPair.f_Pair_second = dtb__499 } -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Decl_DData (dtb__477, dtb__480, dtb__483, dtb__486, dtb__489, dtb__492, dtb__495, dtb__498, Frontend_dAst.v_noNodeRef)); B_dData_dPair.f_Pair_second = dtb__499 }))
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
)) else (if (dtb__474 = 1) then (let nd_uscrut9 = ((Base_dBytes.v_decStr (fuel - 1)) dtb__475) in (match nd_uscrut9 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__500) -> (match dtb__500 with
  | { B_dData_dPair.f_Pair_first = dtb__501; B_dData_dPair.f_Pair_second = dtb__502 } -> (let nd_uscrut16 = ((v_decExpr (fuel - 1)) dtb__502) in (match nd_uscrut16 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__503) -> (match dtb__503 with
  | { B_dData_dPair.f_Pair_first = dtb__504; B_dData_dPair.f_Pair_second = dtb__505 } -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Decl_DAxiom (dtb__501, dtb__504, Frontend_dAst.v_noNodeRef)); B_dData_dPair.f_Pair_second = dtb__505 }))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) else (if (dtb__474 = 2) then (let nd_uscrut9 = ((Base_dBytes.v_decStr (fuel - 1)) dtb__475) in (match nd_uscrut9 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__506) -> (match dtb__506 with
  | { B_dData_dPair.f_Pair_first = dtb__507; B_dData_dPair.f_Pair_second = dtb__508 } -> (let nd_uscrut16 = ((Base_dBytes.v_decStr (fuel - 1)) dtb__508) in (match nd_uscrut16 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__509) -> (match dtb__509 with
  | { B_dData_dPair.f_Pair_first = dtb__510; B_dData_dPair.f_Pair_second = dtb__511 } -> (let nd_uscrut23 = ((v_decExpr (fuel - 1)) dtb__511) in (match nd_uscrut23 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__512) -> (match dtb__512 with
  | { B_dData_dPair.f_Pair_first = dtb__513; B_dData_dPair.f_Pair_second = dtb__514 } -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Decl_DExtern (dtb__507, dtb__510, dtb__513, Frontend_dAst.v_noNodeRef)); B_dData_dPair.f_Pair_second = dtb__514 }))
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
)) else (if (dtb__474 = 3) then (let nd_uscrut9 = ((Base_dBytes.v_decStr (fuel - 1)) dtb__475) in (match nd_uscrut9 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__515) -> (match dtb__515 with
  | { B_dData_dPair.f_Pair_first = dtb__516; B_dData_dPair.f_Pair_second = dtb__517 } -> (let nd_uscrut16 = ((v_decExprList (fuel - 1)) dtb__517) in (match nd_uscrut16 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__518) -> (match dtb__518 with
  | { B_dData_dPair.f_Pair_first = dtb__519; B_dData_dPair.f_Pair_second = dtb__520 } -> (let nd_uscrut23 = ((v_decExpr (fuel - 1)) dtb__520) in (match nd_uscrut23 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__521) -> (match dtb__521 with
  | { B_dData_dPair.f_Pair_first = dtb__522; B_dData_dPair.f_Pair_second = dtb__523 } -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Decl_DSig (dtb__516, dtb__519, dtb__522, Frontend_dAst.v_noNodeRef)); B_dData_dPair.f_Pair_second = dtb__523 }))
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
)) else (if (dtb__474 = 4) then (let nd_uscrut9 = ((Base_dBytes.v_decStr (fuel - 1)) dtb__475) in (match nd_uscrut9 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__524) -> (match dtb__524 with
  | { B_dData_dPair.f_Pair_first = dtb__525; B_dData_dPair.f_Pair_second = dtb__526 } -> (let nd_uscrut16 = ((v_decPatList (fuel - 1)) dtb__526) in (match nd_uscrut16 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__527) -> (match dtb__527 with
  | { B_dData_dPair.f_Pair_first = dtb__528; B_dData_dPair.f_Pair_second = dtb__529 } -> (let nd_uscrut23 = ((v_decExpr (fuel - 1)) dtb__529) in (match nd_uscrut23 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__530) -> (match dtb__530 with
  | { B_dData_dPair.f_Pair_first = dtb__531; B_dData_dPair.f_Pair_second = dtb__532 } -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Decl_DFun (dtb__525, dtb__528, dtb__531, Frontend_dAst.v_noNodeRef)); B_dData_dPair.f_Pair_second = dtb__532 }))
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
)) else (if (dtb__474 = 5) then (let nd_uscrut9 = ((Base_dBytes.v_decStr (fuel - 1)) dtb__475) in (match nd_uscrut9 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__533) -> (match dtb__533 with
  | { B_dData_dPair.f_Pair_first = dtb__534; B_dData_dPair.f_Pair_second = dtb__535 } -> (let nd_uscrut16 = (((Base_dBytes.v_decList Base_dBytes.v_decStr) (fuel - 1)) dtb__535) in (match nd_uscrut16 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__536) -> (match dtb__536 with
  | { B_dData_dPair.f_Pair_first = dtb__537; B_dData_dPair.f_Pair_second = dtb__538 } -> (let nd_uscrut23 = (((Base_dBytes.v_decList v_decField) (fuel - 1)) dtb__538) in (match nd_uscrut23 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__539) -> (match dtb__539 with
  | { B_dData_dPair.f_Pair_first = dtb__540; B_dData_dPair.f_Pair_second = dtb__541 } -> (let nd_uscrut30 = (((Base_dBytes.v_decList Base_dBytes.v_decStr) (fuel - 1)) dtb__541) in (match nd_uscrut30 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__542) -> (match dtb__542 with
  | { B_dData_dPair.f_Pair_first = dtb__543; B_dData_dPair.f_Pair_second = dtb__544 } -> (let nd_uscrut37 = ((Base_dBytes.v_decBool (fuel - 1)) dtb__544) in (match nd_uscrut37 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__545) -> (match dtb__545 with
  | { B_dData_dPair.f_Pair_first = dtb__546; B_dData_dPair.f_Pair_second = dtb__547 } -> (let nd_uscrut44 = ((v_decReprTier (fuel - 1)) dtb__547) in (match nd_uscrut44 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__548) -> (match dtb__548 with
  | { B_dData_dPair.f_Pair_first = dtb__549; B_dData_dPair.f_Pair_second = dtb__550 } -> (let nd_uscrut51 = ((Base_dBytes.v_decBool (fuel - 1)) dtb__550) in (match nd_uscrut51 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__551) -> (match dtb__551 with
  | { B_dData_dPair.f_Pair_first = dtb__552; B_dData_dPair.f_Pair_second = dtb__553 } -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Decl_DRecord (dtb__534, dtb__537, dtb__540, dtb__543, dtb__546, dtb__549, dtb__552, Frontend_dAst.v_noNodeRef)); B_dData_dPair.f_Pair_second = dtb__553 }))
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
)) else (if (dtb__474 = 6) then (let nd_uscrut9 = ((Base_dBytes.v_decStr (fuel - 1)) dtb__475) in (match nd_uscrut9 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__554) -> (match dtb__554 with
  | { B_dData_dPair.f_Pair_first = dtb__555; B_dData_dPair.f_Pair_second = dtb__556 } -> (let nd_uscrut16 = (((Base_dBytes.v_decList v_decTraitParam) (fuel - 1)) dtb__556) in (match nd_uscrut16 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__557) -> (match dtb__557 with
  | { B_dData_dPair.f_Pair_first = dtb__558; B_dData_dPair.f_Pair_second = dtb__559 } -> (let nd_uscrut23 = ((v_decExprList (fuel - 1)) dtb__559) in (match nd_uscrut23 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__560) -> (match dtb__560 with
  | { B_dData_dPair.f_Pair_first = dtb__561; B_dData_dPair.f_Pair_second = dtb__562 } -> (let nd_uscrut30 = (((Base_dBytes.v_decList v_decTraitMethod) (fuel - 1)) dtb__562) in (match nd_uscrut30 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__563) -> (match dtb__563 with
  | { B_dData_dPair.f_Pair_first = dtb__564; B_dData_dPair.f_Pair_second = dtb__565 } -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Decl_DTrait (dtb__555, dtb__558, dtb__561, dtb__564, Frontend_dAst.v_noNodeRef)); B_dData_dPair.f_Pair_second = dtb__565 }))
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
)) else (if (dtb__474 = 7) then (let nd_uscrut9 = ((v_decExprList (fuel - 1)) dtb__475) in (match nd_uscrut9 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__566) -> (match dtb__566 with
  | { B_dData_dPair.f_Pair_first = dtb__567; B_dData_dPair.f_Pair_second = dtb__568 } -> (let nd_uscrut16 = ((v_decExpr (fuel - 1)) dtb__568) in (match nd_uscrut16 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__569) -> (match dtb__569 with
  | { B_dData_dPair.f_Pair_first = dtb__570; B_dData_dPair.f_Pair_second = dtb__571 } -> (let nd_uscrut23 = ((v_decDecls (fuel - 1)) dtb__571) in (match nd_uscrut23 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__572) -> (match dtb__572 with
  | { B_dData_dPair.f_Pair_first = dtb__573; B_dData_dPair.f_Pair_second = dtb__574 } -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Decl_DInstance (dtb__567, dtb__570, dtb__573, Frontend_dAst.v_noNodeRef)); B_dData_dPair.f_Pair_second = dtb__574 }))
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
# 957 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
and v_decDecls = (fun (fuel : int) (bytes : Base_dBytes.t_Cur) -> (if (fuel <= 0) then B_dData_dMaybe.C_Maybe_Nothing else (let nd_uscrut2 = ((v_decListHead fuel) bytes) in (match nd_uscrut2 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__575) -> (match dtb__575 with
  | { B_dData_dPair.f_Pair_first = dtb__576; B_dData_dPair.f_Pair_second = dtb__577 } -> ((((v_decDeclsItems (fuel - 1)) dtb__576) dtb__577) B_dData_dList.C_List_Nil)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))))
# 967 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
and v_decDeclsItems = (fun (fuel : int) (n : int) (bytes : Base_dBytes.t_Cur) (acc : Frontend_dAst.t_Decl B_dData_dList.t_List) -> (if (fuel <= 0) then B_dData_dMaybe.C_Maybe_Nothing else (if (n <= 0) then (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (B_dData_dList.v_reverse acc); B_dData_dPair.f_Pair_second = bytes })) else (let nd_uscrut4 = ((v_decDecl (fuel - 1)) bytes) in (match nd_uscrut4 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__578) -> (match dtb__578 with
  | { B_dData_dPair.f_Pair_first = dtb__579; B_dData_dPair.f_Pair_second = dtb__580 } -> ((((v_decDeclsItems (fuel - 1)) (n - 1)) dtb__580) (B_dData_dList.C_List__x58__x58_ (dtb__579, acc)))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)))))

# 979 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
let v_decPatComplete = (fun (s : string) -> (let nd_uscrut1 = ((v_decPat (bi_strLength s)) (Base_dBytes.v_curOf s)) in (match nd_uscrut1 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__581) -> (match dtb__581 with
  | { B_dData_dPair.f_Pair_first = dtb__582; B_dData_dPair.f_Pair_second = dtb__583 } -> (if (Base_dBytes.v_curAtEnd dtb__583) then (B_dData_dMaybe.C_Maybe_Just (dtb__582)) else B_dData_dMaybe.C_Maybe_Nothing)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)))

# 986 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
let v_decExprComplete = (fun (s : string) -> (let nd_uscrut1 = ((v_decExpr (bi_strLength s)) (Base_dBytes.v_curOf s)) in (match nd_uscrut1 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__584) -> (match dtb__584 with
  | { B_dData_dPair.f_Pair_first = dtb__585; B_dData_dPair.f_Pair_second = dtb__586 } -> (if (Base_dBytes.v_curAtEnd dtb__586) then (B_dData_dMaybe.C_Maybe_Just (dtb__585)) else B_dData_dMaybe.C_Maybe_Nothing)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)))

# 993 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
let v_decDeclComplete = (fun (s : string) -> (let nd_uscrut1 = ((v_decDecl (bi_strLength s)) (Base_dBytes.v_curOf s)) in (match nd_uscrut1 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__587) -> (match dtb__587 with
  | { B_dData_dPair.f_Pair_first = dtb__588; B_dData_dPair.f_Pair_second = dtb__589 } -> (if (Base_dBytes.v_curAtEnd dtb__589) then (B_dData_dMaybe.C_Maybe_Just (dtb__588)) else B_dData_dMaybe.C_Maybe_Nothing)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)))

# 1000 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
let v_decQtyComplete = (fun (s : string) -> (let nd_uscrut1 = ((v_decQty (bi_strLength s)) (Base_dBytes.v_curOf s)) in (match nd_uscrut1 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__590) -> (match dtb__590 with
  | { B_dData_dPair.f_Pair_first = dtb__591; B_dData_dPair.f_Pair_second = dtb__592 } -> (if (Base_dBytes.v_curAtEnd dtb__592) then (B_dData_dMaybe.C_Maybe_Just (dtb__591)) else B_dData_dMaybe.C_Maybe_Nothing)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)))

# 1007 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
let v_decReprTierComplete = (fun (s : string) -> (let nd_uscrut1 = ((v_decReprTier (bi_strLength s)) (Base_dBytes.v_curOf s)) in (match nd_uscrut1 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__593) -> (match dtb__593 with
  | { B_dData_dPair.f_Pair_first = dtb__594; B_dData_dPair.f_Pair_second = dtb__595 } -> (if (Base_dBytes.v_curAtEnd dtb__595) then (B_dData_dMaybe.C_Maybe_Just (dtb__594)) else B_dData_dMaybe.C_Maybe_Nothing)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)))

# 1014 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
let v_decInterpPartComplete = (fun (s : string) -> (let nd_uscrut1 = ((v_decInterpPart (bi_strLength s)) (Base_dBytes.v_curOf s)) in (match nd_uscrut1 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__596) -> (match dtb__596 with
  | { B_dData_dPair.f_Pair_first = dtb__597; B_dData_dPair.f_Pair_second = dtb__598 } -> (if (Base_dBytes.v_curAtEnd dtb__598) then (B_dData_dMaybe.C_Maybe_Just (dtb__597)) else B_dData_dMaybe.C_Maybe_Nothing)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)))

# 1021 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
let v_decDoStmtComplete = (fun (s : string) -> (let nd_uscrut1 = ((v_decDoStmt (bi_strLength s)) (Base_dBytes.v_curOf s)) in (match nd_uscrut1 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__599) -> (match dtb__599 with
  | { B_dData_dPair.f_Pair_first = dtb__600; B_dData_dPair.f_Pair_second = dtb__601 } -> (if (Base_dBytes.v_curAtEnd dtb__601) then (B_dData_dMaybe.C_Maybe_Just (dtb__600)) else B_dData_dMaybe.C_Maybe_Nothing)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)))

# 1028 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
let v_decCtorComplete = (fun (s : string) -> (let nd_uscrut1 = ((v_decCtor (bi_strLength s)) (Base_dBytes.v_curOf s)) in (match nd_uscrut1 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__602) -> (match dtb__602 with
  | { B_dData_dPair.f_Pair_first = dtb__603; B_dData_dPair.f_Pair_second = dtb__604 } -> (if (Base_dBytes.v_curAtEnd dtb__604) then (B_dData_dMaybe.C_Maybe_Just (dtb__603)) else B_dData_dMaybe.C_Maybe_Nothing)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)))

# 1035 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
let v_decFieldComplete = (fun (s : string) -> (let nd_uscrut1 = ((v_decField (bi_strLength s)) (Base_dBytes.v_curOf s)) in (match nd_uscrut1 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__605) -> (match dtb__605 with
  | { B_dData_dPair.f_Pair_first = dtb__606; B_dData_dPair.f_Pair_second = dtb__607 } -> (if (Base_dBytes.v_curAtEnd dtb__607) then (B_dData_dMaybe.C_Maybe_Just (dtb__606)) else B_dData_dMaybe.C_Maybe_Nothing)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)))

# 1042 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
let v_decTraitParamComplete = (fun (s : string) -> (let nd_uscrut1 = ((v_decTraitParam (bi_strLength s)) (Base_dBytes.v_curOf s)) in (match nd_uscrut1 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__608) -> (match dtb__608 with
  | { B_dData_dPair.f_Pair_first = dtb__609; B_dData_dPair.f_Pair_second = dtb__610 } -> (if (Base_dBytes.v_curAtEnd dtb__610) then (B_dData_dMaybe.C_Maybe_Just (dtb__609)) else B_dData_dMaybe.C_Maybe_Nothing)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)))

# 1049 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
let v_decTraitMethodComplete = (fun (s : string) -> (let nd_uscrut1 = ((v_decTraitMethod (bi_strLength s)) (Base_dBytes.v_curOf s)) in (match nd_uscrut1 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__611) -> (match dtb__611 with
  | { B_dData_dPair.f_Pair_first = dtb__612; B_dData_dPair.f_Pair_second = dtb__613 } -> (if (Base_dBytes.v_curAtEnd dtb__613) then (B_dData_dMaybe.C_Maybe_Just (dtb__612)) else B_dData_dMaybe.C_Maybe_Nothing)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)))

# 1056 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
let v_decDeclsComplete = (fun (s : string) -> (let nd_uscrut1 = ((v_decDecls (bi_strLength s)) (Base_dBytes.v_curOf s)) in (match nd_uscrut1 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__614) -> (match dtb__614 with
  | { B_dData_dPair.f_Pair_first = dtb__615; B_dData_dPair.f_Pair_second = dtb__616 } -> (if (Base_dBytes.v_curAtEnd dtb__616) then (B_dData_dMaybe.C_Maybe_Just (dtb__615)) else B_dData_dMaybe.C_Maybe_Nothing)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)))

# 1070 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
let v_encExportItem = (fun (mc0 : Frontend_dAst.t_ExportItem) (mc1 : string B_dData_dList.t_List) -> (match mc0 with
  | Frontend_dAst.C_ExportItem_XNamespace (dtb__617, dtb__618, dtb__619) -> ((Base_dBytes.v_encTag 4) ((Base_dBytes.v_encStr dtb__617) (((Base_dBytes.v_encMaybe Base_dBytes.v_encStr) dtb__618) mc1)))
  | Frontend_dAst.C_ExportItem_XModule (dtb__620, dtb__621) -> ((Base_dBytes.v_encTag 2) ((Base_dBytes.v_encStr dtb__620) mc1))
  | Frontend_dAst.C_ExportItem_XTypeSome (dtb__622, dtb__623, dtb__624) -> ((Base_dBytes.v_encTag 3) ((Base_dBytes.v_encStr dtb__622) (((Base_dBytes.v_encList Base_dBytes.v_encStr) dtb__623) mc1)))
  | Frontend_dAst.C_ExportItem_XTypeAll (dtb__625, dtb__626) -> ((Base_dBytes.v_encTag 1) ((Base_dBytes.v_encStr dtb__625) mc1))
  | Frontend_dAst.C_ExportItem_XBare (dtb__627, dtb__628) -> ((Base_dBytes.v_encTag 0) ((Base_dBytes.v_encStr dtb__627) mc1))
  | _ -> failwith "DT: impossible branch"
))

# 1077 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
let v_encExportMembers = (fun (mc0 : Frontend_dAst.t_ExportMembers) (mc1 : string B_dData_dList.t_List) -> (match mc0 with
  | Frontend_dAst.C_ExportMembers_EMOnly (dtb__629) -> ((Base_dBytes.v_encTag 2) (((Base_dBytes.v_encList Base_dBytes.v_encStr) dtb__629) mc1))
  | Frontend_dAst.C_ExportMembers_EMAll -> ((Base_dBytes.v_encTag 1) mc1)
  | Frontend_dAst.C_ExportMembers_EMNone -> ((Base_dBytes.v_encTag 0) mc1)
  | _ -> failwith "DT: impossible branch"
))

# 1082 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
let v_encExportSpec = (fun (mc0 : Frontend_dAst.t_ExportSpec) (mc1 : string B_dData_dList.t_List) -> (match mc0 with
  | Frontend_dAst.C_ExportSpec_ESType (dtb__630, dtb__631, dtb__632) -> ((Base_dBytes.v_encTag 1) ((Base_dBytes.v_encStr dtb__630) ((v_encExportMembers dtb__631) mc1)))
  | Frontend_dAst.C_ExportSpec_ESValue (dtb__633, dtb__634) -> ((Base_dBytes.v_encTag 0) ((Base_dBytes.v_encStr dtb__633) mc1))
  | _ -> failwith "DT: impossible branch"
))

# 1086 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
let v_encOpacity = (fun (mc0 : Frontend_dAst.t_Opacity) (mc1 : string B_dData_dList.t_List) -> (match mc0 with
  | Frontend_dAst.C_Opacity_OpacityAbstract -> ((Base_dBytes.v_encTag 2) mc1)
  | Frontend_dAst.C_Opacity_OpacityTransparent -> ((Base_dBytes.v_encTag 1) mc1)
  | Frontend_dAst.C_Opacity_OpacityOpaque -> ((Base_dBytes.v_encTag 0) mc1)
  | _ -> failwith "DT: impossible branch"
))

# 1091 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
let v_encOpacitySpec = (fun (o : Frontend_dAst.t_OpacitySpec) (acc : string B_dData_dList.t_List) -> ((Base_dBytes.v_encStr (o).Frontend_dAst.f_OpacitySpec_opacityName) ((v_encOpacity (o).Frontend_dAst.f_OpacitySpec_opacityKind) acc)))

# 1095 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
let v_encModDecl = (fun (m : Frontend_dAst.t_ModDecl) (acc : string B_dData_dList.t_List) -> ((Base_dBytes.v_encStr (m).Frontend_dAst.f_ModDecl_modDeclName) ((Base_dBytes.v_encBool (m).Frontend_dAst.f_ModDecl_modDeclHasExportList) (((Base_dBytes.v_encList v_encExportItem) (m).Frontend_dAst.f_ModDecl_modDeclExportItems) (((Base_dBytes.v_encList v_encExportSpec) (m).Frontend_dAst.f_ModDecl_modDeclExports) (((Base_dBytes.v_encList v_encExportItem) (m).Frontend_dAst.f_ModDecl_modDeclReexports) (((Base_dBytes.v_encList v_encOpacitySpec) (m).Frontend_dAst.f_ModDecl_modDeclOpacity) acc)))))))

# 1112 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
let v_encImportLike = (fun (i : Frontend_dAst.t_Import) (acc : string B_dData_dList.t_List) -> ((Base_dBytes.v_encStr (i).Frontend_dAst.f_Import_importName) ((Base_dBytes.v_encBool (i).Frontend_dAst.f_Import_importIsQualified) (((Base_dBytes.v_encMaybe Base_dBytes.v_encStr) (i).Frontend_dAst.f_Import_importAlias) acc))))

# 1116 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
let v_encFixityLike = (fun (f : Frontend_dAst.t_FixityDecl) (acc : string B_dData_dList.t_List) -> ((Base_dBytes.v_encStr (f).Frontend_dAst.f_FixityDecl_fixityOp) ((Base_dBytes.v_encInt (f).Frontend_dAst.f_FixityDecl_fixityLevel) ((Base_dBytes.v_encInt (f).Frontend_dAst.f_FixityDecl_fixityAssoc) acc))))

# 1102 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
let v_encSourceFile = (fun (f : Frontend_dAst.t_SourceFile) (acc : string B_dData_dList.t_List) -> (((Base_dBytes.v_encMaybe v_encModDecl) (f).Frontend_dAst.f_SourceFile_sourceFileModDecl) (((Base_dBytes.v_encList v_encImportLike) (f).Frontend_dAst.f_SourceFile_sourceFileImports) (((Base_dBytes.v_encList v_encFixityLike) (f).Frontend_dAst.f_SourceFile_sourceFileFixities) (((Base_dBytes.v_encList v_encDecl) (f).Frontend_dAst.f_SourceFile_sourceFileDecls) (((Base_dBytes.v_encList v_encExportSpec) (f).Frontend_dAst.f_SourceFile_sourceFileExports) (((Base_dBytes.v_encList v_encExportItem) (f).Frontend_dAst.f_SourceFile_sourceFileReexports) (((Base_dBytes.v_encList v_encOpacitySpec) (f).Frontend_dAst.f_SourceFile_sourceFileOpacity) acc))))))))

# 1120 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
let v_decExportItem = (fun (fuel : int) (c : Base_dBytes.t_Cur) -> (if (fuel <= 0) then B_dData_dMaybe.C_Maybe_Nothing else ((Base_dBytes.v_thenPair ((Base_dBytes.v_decTag fuel) c)) (fun (tag : int) (b1 : Base_dBytes.t_Cur) -> (if (tag = 0) then ((Base_dBytes.v_thenPair ((Base_dBytes.v_decStr (fuel - 1)) b1)) (fun (n : string) (b2 : Base_dBytes.t_Cur) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_ExportItem_XBare (n, Frontend_dAst.v_noNodeRef)); B_dData_dPair.f_Pair_second = b2 })))) else (if (tag = 1) then ((Base_dBytes.v_thenPair ((Base_dBytes.v_decStr (fuel - 1)) b1)) (fun (n : string) (b2 : Base_dBytes.t_Cur) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_ExportItem_XTypeAll (n, Frontend_dAst.v_noNodeRef)); B_dData_dPair.f_Pair_second = b2 })))) else (if (tag = 3) then ((Base_dBytes.v_thenPair ((Base_dBytes.v_decStr (fuel - 1)) b1)) (fun (n : string) (b2 : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair (((Base_dBytes.v_decList Base_dBytes.v_decStr) (fuel - 1)) b2)) (fun (ms : string B_dData_dList.t_List) (b3 : Base_dBytes.t_Cur) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_ExportItem_XTypeSome (n, ms, Frontend_dAst.v_noNodeRef)); B_dData_dPair.f_Pair_second = b3 })))))) else (if (tag = 2) then ((Base_dBytes.v_thenPair ((Base_dBytes.v_decStr (fuel - 1)) b1)) (fun (n : string) (b2 : Base_dBytes.t_Cur) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_ExportItem_XModule (n, Frontend_dAst.v_noNodeRef)); B_dData_dPair.f_Pair_second = b2 })))) else (if (tag = 4) then ((Base_dBytes.v_thenPair ((Base_dBytes.v_decStr (fuel - 1)) b1)) (fun (n : string) (b2 : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair (((Base_dBytes.v_decMaybe Base_dBytes.v_decStr) (fuel - 1)) b2)) (fun (alias : string B_dData_dMaybe.t_Maybe) (b3 : Base_dBytes.t_Cur) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_ExportItem_XNamespace (n, alias, Frontend_dAst.v_noNodeRef)); B_dData_dPair.f_Pair_second = b3 })))))) else B_dData_dMaybe.C_Maybe_Nothing)))))))))

# 1136 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
let v_decExportMembers = (fun (fuel : int) (c : Base_dBytes.t_Cur) -> (if (fuel <= 0) then B_dData_dMaybe.C_Maybe_Nothing else ((Base_dBytes.v_thenPair ((Base_dBytes.v_decTag fuel) c)) (fun (tag : int) (b1 : Base_dBytes.t_Cur) -> (if (tag = 0) then (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = Frontend_dAst.C_ExportMembers_EMNone; B_dData_dPair.f_Pair_second = b1 })) else (if (tag = 1) then (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = Frontend_dAst.C_ExportMembers_EMAll; B_dData_dPair.f_Pair_second = b1 })) else (if (tag = 2) then ((Base_dBytes.v_thenPair (((Base_dBytes.v_decList Base_dBytes.v_decStr) (fuel - 1)) b1)) (fun (ms : string B_dData_dList.t_List) (b2 : Base_dBytes.t_Cur) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_ExportMembers_EMOnly (ms)); B_dData_dPair.f_Pair_second = b2 })))) else B_dData_dMaybe.C_Maybe_Nothing)))))))

# 1150 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
let v_decExportSpec = (fun (fuel : int) (c : Base_dBytes.t_Cur) -> (if (fuel <= 0) then B_dData_dMaybe.C_Maybe_Nothing else ((Base_dBytes.v_thenPair ((Base_dBytes.v_decTag fuel) c)) (fun (tag : int) (b1 : Base_dBytes.t_Cur) -> (if (tag = 0) then ((Base_dBytes.v_thenPair ((Base_dBytes.v_decStr (fuel - 1)) b1)) (fun (n : string) (b2 : Base_dBytes.t_Cur) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_ExportSpec_ESValue (n, v_noSpan)); B_dData_dPair.f_Pair_second = b2 })))) else (if (tag = 1) then ((Base_dBytes.v_thenPair ((Base_dBytes.v_decStr (fuel - 1)) b1)) (fun (n : string) (b2 : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair ((v_decExportMembers (fuel - 1)) b2)) (fun (ms : Frontend_dAst.t_ExportMembers) (b3 : Base_dBytes.t_Cur) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_ExportSpec_ESType (n, ms, v_noSpan)); B_dData_dPair.f_Pair_second = b3 })))))) else B_dData_dMaybe.C_Maybe_Nothing))))))

# 1163 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
let v_decOpacity = (fun (fuel : int) (c : Base_dBytes.t_Cur) -> (if (fuel <= 0) then B_dData_dMaybe.C_Maybe_Nothing else ((Base_dBytes.v_thenPair ((Base_dBytes.v_decTag fuel) c)) (fun (tag : int) (b1 : Base_dBytes.t_Cur) -> (if (tag = 0) then (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = Frontend_dAst.C_Opacity_OpacityOpaque; B_dData_dPair.f_Pair_second = b1 })) else (if (tag = 1) then (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = Frontend_dAst.C_Opacity_OpacityTransparent; B_dData_dPair.f_Pair_second = b1 })) else (if (tag = 2) then (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = Frontend_dAst.C_Opacity_OpacityAbstract; B_dData_dPair.f_Pair_second = b1 })) else B_dData_dMaybe.C_Maybe_Nothing)))))))

# 1177 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
let v_decOpacitySpec = (fun (fuel : int) (c : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair ((Base_dBytes.v_decStr (fuel - 1)) c)) (fun (name : string) (b1 : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair ((v_decOpacity (fuel - 1)) b1)) (fun (kind : Frontend_dAst.t_Opacity) (b2 : Base_dBytes.t_Cur) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = { Frontend_dAst.f_OpacitySpec_opacityName = name; Frontend_dAst.f_OpacitySpec_opacityKind = kind; Frontend_dAst.f_OpacitySpec_opacitySpan = v_noSpan }; B_dData_dPair.f_Pair_second = b2 })))))))

# 1184 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
let v_decModDecl = (fun (fuel : int) (c : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair ((Base_dBytes.v_decStr (fuel - 1)) c)) (fun (name : string) (b1 : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair ((Base_dBytes.v_decBool (fuel - 1)) b1)) (fun (hasList : bool) (b2 : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair (((Base_dBytes.v_decList v_decExportItem) (fuel - 1)) b2)) (fun (items : Frontend_dAst.t_ExportItem B_dData_dList.t_List) (b3 : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair (((Base_dBytes.v_decList v_decExportSpec) (fuel - 1)) b3)) (fun (exports : Frontend_dAst.t_ExportSpec B_dData_dList.t_List) (b4 : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair (((Base_dBytes.v_decList v_decExportItem) (fuel - 1)) b4)) (fun (reexports : Frontend_dAst.t_ExportItem B_dData_dList.t_List) (b5 : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair (((Base_dBytes.v_decList v_decOpacitySpec) (fuel - 1)) b5)) (fun (opacity : Frontend_dAst.t_OpacitySpec B_dData_dList.t_List) (b6 : Base_dBytes.t_Cur) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = { Frontend_dAst.f_ModDecl_modDeclName = name; Frontend_dAst.f_ModDecl_modDeclHasExportList = hasList; Frontend_dAst.f_ModDecl_modDeclExportItems = items; Frontend_dAst.f_ModDecl_modDeclExports = exports; Frontend_dAst.f_ModDecl_modDeclReexports = reexports; Frontend_dAst.f_ModDecl_modDeclOpacity = opacity; Frontend_dAst.f_ModDecl_modDeclRef = Frontend_dAst.v_noNodeRef }; B_dData_dPair.f_Pair_second = b6 })))))))))))))))

# 1190 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
let v_decImportLike = (fun (fuel : int) (c : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair ((Base_dBytes.v_decStr (fuel - 1)) c)) (fun (name : string) (b1 : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair ((Base_dBytes.v_decBool (fuel - 1)) b1)) (fun (qual : bool) (b2 : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair (((Base_dBytes.v_decMaybe Base_dBytes.v_decStr) (fuel - 1)) b2)) (fun (alias : string B_dData_dMaybe.t_Maybe) (b3 : Base_dBytes.t_Cur) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = { Frontend_dAst.f_Import_importName = name; Frontend_dAst.f_Import_importIsQualified = qual; Frontend_dAst.f_Import_importAlias = alias; Frontend_dAst.f_Import_importRef = Frontend_dAst.v_noNodeRef }; B_dData_dPair.f_Pair_second = b3 })))))))))

# 1196 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
let v_decFixityLike = (fun (fuel : int) (c : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair ((Base_dBytes.v_decStr (fuel - 1)) c)) (fun (op : string) (b1 : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair ((Base_dBytes.v_decInt (fuel - 1)) b1)) (fun (level : int) (b2 : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair ((Base_dBytes.v_decInt (fuel - 1)) b2)) (fun (assoc : int) (b3 : Base_dBytes.t_Cur) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = { Frontend_dAst.f_FixityDecl_fixityOp = op; Frontend_dAst.f_FixityDecl_fixityLevel = level; Frontend_dAst.f_FixityDecl_fixityAssoc = assoc; Frontend_dAst.f_FixityDecl_fixityRef = Frontend_dAst.v_noNodeRef }; B_dData_dPair.f_Pair_second = b3 })))))))))

# 1209 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
let v_decSourceFileGo = (fun (fuel : int) (c : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair (((Base_dBytes.v_decMaybe v_decModDecl) (fuel - 1)) c)) (fun (modDecl : Frontend_dAst.t_ModDecl B_dData_dMaybe.t_Maybe) (b1 : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair (((Base_dBytes.v_decList v_decImportLike) (fuel - 1)) b1)) (fun (imports : Frontend_dAst.t_Import B_dData_dList.t_List) (b2 : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair (((Base_dBytes.v_decList v_decFixityLike) (fuel - 1)) b2)) (fun (fixities : Frontend_dAst.t_FixityDecl B_dData_dList.t_List) (b3 : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair (((Base_dBytes.v_decList v_decDecl) (fuel - 1)) b3)) (fun (decls : Frontend_dAst.t_Decl B_dData_dList.t_List) (b4 : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair (((Base_dBytes.v_decList v_decExportSpec) (fuel - 1)) b4)) (fun (exports : Frontend_dAst.t_ExportSpec B_dData_dList.t_List) (b5 : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair (((Base_dBytes.v_decList v_decExportItem) (fuel - 1)) b5)) (fun (reexports : Frontend_dAst.t_ExportItem B_dData_dList.t_List) (b6 : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair (((Base_dBytes.v_decList v_decOpacitySpec) (fuel - 1)) b6)) (fun (opacity : Frontend_dAst.t_OpacitySpec B_dData_dList.t_List) (b7 : Base_dBytes.t_Cur) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = { Frontend_dAst.f_SourceFile_sourceFileModDecl = modDecl; Frontend_dAst.f_SourceFile_sourceFileImports = imports; Frontend_dAst.f_SourceFile_sourceFileFixities = fixities; Frontend_dAst.f_SourceFile_sourceFileDecls = decls; Frontend_dAst.f_SourceFile_sourceFileExports = exports; Frontend_dAst.f_SourceFile_sourceFileReexports = reexports; Frontend_dAst.f_SourceFile_sourceFileOpacity = opacity }; B_dData_dPair.f_Pair_second = b7 })))))))))))))))))

# 1203 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
let v_decSourceFileComplete = (fun (s : string) -> (let nd_uscrut1 = ((v_decSourceFileGo (bi_strLength s)) (Base_dBytes.v_curOf s)) in (match nd_uscrut1 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__635) -> (match dtb__635 with
  | { B_dData_dPair.f_Pair_first = dtb__636; B_dData_dPair.f_Pair_second = dtb__637 } -> (if (Base_dBytes.v_curAtEnd dtb__637) then (B_dData_dMaybe.C_Maybe_Just (dtb__636)) else B_dData_dMaybe.C_Maybe_Nothing)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)))
