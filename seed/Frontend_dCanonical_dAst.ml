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
# 151 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
and v_encStrPatList = (fun (xs : (string, Frontend_dAst.t_Pat) B_dData_dPair.t_Pair B_dData_dList.t_List) (acc : string B_dData_dList.t_List) -> (B_dData_dList.C_List__x58__x58_ ((String.concat "" ["["; (bi_strFromInt (Base_dBytes.v_lenOf xs)); ":"]), ((v_encStrPatListGo xs) acc))))
# 155 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
and v_encStrPatListGo = (fun (mc0 : (string, Frontend_dAst.t_Pat) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc1 : string B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__5, dtb__6) -> (match dtb__5 with
  | { B_dData_dPair.f_Pair_first = dtb__7; B_dData_dPair.f_Pair_second = dtb__8 } -> ((Base_dBytes.v_encStr dtb__7) ((v_encPat dtb__8) ((v_encStrPatListGo dtb__6) mc1)))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> mc1
  | _ -> failwith "DT: impossible branch"
))
# 210 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
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
and v_encPatExprList = (fun (xs : (Frontend_dAst.t_Pat, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (acc : string B_dData_dList.t_List) -> (B_dData_dList.C_List__x58__x58_ ((String.concat "" ["["; (bi_strFromInt (Base_dBytes.v_lenOf xs)); ":"]), ((v_encPatExprListGo xs) acc))))
# 110 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
and v_encPatExprListGo = (fun (mc0 : (Frontend_dAst.t_Pat, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc1 : string B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__27, dtb__28) -> (match dtb__27 with
  | { B_dData_dPair.f_Pair_first = dtb__29; B_dData_dPair.f_Pair_second = dtb__30 } -> ((v_encPat dtb__29) ((v_encExpr dtb__30) ((v_encPatExprListGo dtb__28) mc1)))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> mc1
  | _ -> failwith "DT: impossible branch"
))
# 115 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
and v_encClauses = (fun (xs : (Frontend_dAst.t_Pat B_dData_dList.t_List, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (acc : string B_dData_dList.t_List) -> (B_dData_dList.C_List__x58__x58_ ((String.concat "" ["["; (bi_strFromInt (Base_dBytes.v_lenOf xs)); ":"]), ((v_encClausesGo xs) acc))))
# 119 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
and v_encClausesGo = (fun (mc0 : (Frontend_dAst.t_Pat B_dData_dList.t_List, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc1 : string B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__31, dtb__32) -> (match dtb__31 with
  | { B_dData_dPair.f_Pair_first = dtb__33; B_dData_dPair.f_Pair_second = dtb__34 } -> ((v_encPatList dtb__33) ((v_encExpr dtb__34) ((v_encClausesGo dtb__32) mc1)))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> mc1
  | _ -> failwith "DT: impossible branch"
))
# 124 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
and v_encStmtList = (fun (xs : Frontend_dAst.t_DoStmt B_dData_dList.t_List) (acc : string B_dData_dList.t_List) -> (B_dData_dList.C_List__x58__x58_ ((String.concat "" ["["; (bi_strFromInt (Base_dBytes.v_lenOf xs)); ":"]), ((v_encStmtListGo xs) acc))))
# 128 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
and v_encStmtListGo = (fun (mc0 : Frontend_dAst.t_DoStmt B_dData_dList.t_List) (mc1 : string B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__35, dtb__36) -> ((v_encDoStmt dtb__35) ((v_encStmtListGo dtb__36) mc1))
  | B_dData_dList.C_List_Nil -> mc1
  | _ -> failwith "DT: impossible branch"
))
# 133 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
and v_encPartList = (fun (xs : Frontend_dAst.t_InterpPart B_dData_dList.t_List) (acc : string B_dData_dList.t_List) -> (B_dData_dList.C_List__x58__x58_ ((String.concat "" ["["; (bi_strFromInt (Base_dBytes.v_lenOf xs)); ":"]), ((v_encPartListGo xs) acc))))
# 137 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
and v_encPartListGo = (fun (mc0 : Frontend_dAst.t_InterpPart B_dData_dList.t_List) (mc1 : string B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__37, dtb__38) -> ((v_encInterpPart dtb__37) ((v_encPartListGo dtb__38) mc1))
  | B_dData_dList.C_List_Nil -> mc1
  | _ -> failwith "DT: impossible branch"
))
# 142 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
and v_encStrExprList = (fun (xs : (string, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (acc : string B_dData_dList.t_List) -> (B_dData_dList.C_List__x58__x58_ ((String.concat "" ["["; (bi_strFromInt (Base_dBytes.v_lenOf xs)); ":"]), ((v_encStrExprListGo xs) acc))))
# 146 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
and v_encStrExprListGo = (fun (mc0 : (string, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc1 : string B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__39, dtb__40) -> (match dtb__39 with
  | { B_dData_dPair.f_Pair_first = dtb__41; B_dData_dPair.f_Pair_second = dtb__42 } -> ((Base_dBytes.v_encStr dtb__41) ((v_encExpr dtb__42) ((v_encStrExprListGo dtb__40) mc1)))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> mc1
  | _ -> failwith "DT: impossible branch"
))
# 205 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
and v_encInterpPart = (fun (mc0 : Frontend_dAst.t_InterpPart) (mc1 : string B_dData_dList.t_List) -> (match mc0 with
  | Frontend_dAst.C_InterpPart_IPHole (dtb__43) -> ((Base_dBytes.v_encTag 1) ((v_encExpr dtb__43) mc1))
  | Frontend_dAst.C_InterpPart_IPText (dtb__44) -> ((Base_dBytes.v_encTag 0) ((Base_dBytes.v_encStr dtb__44) mc1))
  | _ -> failwith "DT: impossible branch"
))
# 220 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
and v_encDoStmt = (fun (mc0 : Frontend_dAst.t_DoStmt) (mc1 : string B_dData_dList.t_List) -> (match mc0 with
  | Frontend_dAst.C_DoStmt_DLet (dtb__45, dtb__46) -> ((Base_dBytes.v_encTag 2) ((v_encPatExprList dtb__45) mc1))
  | Frontend_dAst.C_DoStmt_DExpr (dtb__47, dtb__48) -> ((Base_dBytes.v_encTag 1) ((v_encExpr dtb__47) mc1))
  | Frontend_dAst.C_DoStmt_DBind (dtb__49, dtb__50, dtb__51) -> ((Base_dBytes.v_encTag 0) ((v_encPat dtb__49) ((v_encExpr dtb__50) mc1)))
  | _ -> failwith "DT: impossible branch"
))
# 226 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
and v_encExpr = (fun (mc0 : Frontend_dAst.t_Expr) (mc1 : string B_dData_dList.t_List) -> (match mc0 with
  | Frontend_dAst.C_Expr_EFloat (dtb__52, dtb__53) -> ((Base_dBytes.v_encTag 22) ((Base_dBytes.v_encStr dtb__52) mc1))
  | Frontend_dAst.C_Expr_EInterp (dtb__54, dtb__55, dtb__56) -> ((Base_dBytes.v_encTag 21) ((Base_dBytes.v_encBool dtb__54) ((v_encPartList dtb__55) mc1)))
  | Frontend_dAst.C_Expr_EAnn (dtb__57, dtb__58, dtb__59) -> ((Base_dBytes.v_encTag 20) ((v_encExpr dtb__57) ((v_encExpr dtb__58) mc1)))
  | Frontend_dAst.C_Expr_ESectR (dtb__60, dtb__61, dtb__62) -> ((Base_dBytes.v_encTag 19) ((v_encExpr dtb__60) ((Base_dBytes.v_encStr dtb__61) mc1)))
  | Frontend_dAst.C_Expr_ESectL (dtb__63, dtb__64, dtb__65) -> ((Base_dBytes.v_encTag 18) ((Base_dBytes.v_encStr dtb__63) ((v_encExpr dtb__64) mc1)))
  | Frontend_dAst.C_Expr_ESectOp (dtb__66, dtb__67) -> ((Base_dBytes.v_encTag 17) ((Base_dBytes.v_encStr dtb__66) mc1))
  | Frontend_dAst.C_Expr_EBacktick (dtb__68, dtb__69, dtb__70, dtb__71) -> ((Base_dBytes.v_encTag 16) ((Base_dBytes.v_encStr dtb__68) ((v_encExpr dtb__69) ((v_encExpr dtb__70) mc1))))
  | Frontend_dAst.C_Expr_EParen (dtb__72, dtb__73) -> ((Base_dBytes.v_encTag 15) ((v_encExpr dtb__72) mc1))
  | Frontend_dAst.C_Expr_EInfix (dtb__74, dtb__75, dtb__76, dtb__77) -> ((Base_dBytes.v_encTag 14) ((Base_dBytes.v_encStr dtb__74) ((v_encExpr dtb__75) ((v_encExpr dtb__76) mc1))))
  | Frontend_dAst.C_Expr_EDo (dtb__78, dtb__79) -> ((Base_dBytes.v_encTag 13) ((v_encStmtList dtb__78) mc1))
  | Frontend_dAst.C_Expr_ERecUpdate (dtb__80, dtb__81, dtb__82) -> ((Base_dBytes.v_encTag 12) ((v_encExpr dtb__80) ((v_encStrExprList dtb__81) mc1)))
  | Frontend_dAst.C_Expr_ERecord (dtb__83, dtb__84, dtb__85) -> ((Base_dBytes.v_encTag 11) ((Base_dBytes.v_encStr dtb__83) ((v_encStrExprList dtb__84) mc1)))
  | Frontend_dAst.C_Expr_EField (dtb__86, dtb__87, dtb__88) -> ((Base_dBytes.v_encTag 10) ((v_encExpr dtb__86) ((Base_dBytes.v_encStr dtb__87) mc1)))
  | Frontend_dAst.C_Expr_EIf (dtb__89, dtb__90, dtb__91, dtb__92) -> ((Base_dBytes.v_encTag 9) ((v_encExpr dtb__89) ((v_encExpr dtb__90) ((v_encExpr dtb__91) mc1))))
  | Frontend_dAst.C_Expr_ECase (dtb__93, dtb__94, dtb__95) -> ((Base_dBytes.v_encTag 8) ((v_encExpr dtb__93) ((v_encPatExprList dtb__94) mc1)))
  | Frontend_dAst.C_Expr_ELocalFun (dtb__96, dtb__97) -> ((Base_dBytes.v_encTag 7) ((v_encClauses dtb__96) mc1))
  | Frontend_dAst.C_Expr_ELet (dtb__98, dtb__99, dtb__100, dtb__101) -> ((Base_dBytes.v_encTag 6) ((v_encPatExprList dtb__98) ((v_encExpr dtb__99) ((Base_dBytes.v_encBool dtb__100) mc1))))
  | Frontend_dAst.C_Expr_EPi (dtb__102, dtb__103, dtb__104, dtb__105, dtb__106, dtb__107) -> ((Base_dBytes.v_encTag 5) ((Base_dBytes.v_encStr dtb__102) ((Base_dBytes.v_encBool dtb__103) ((v_encMaybeQty dtb__104) ((v_encExpr dtb__105) ((v_encExpr dtb__106) mc1))))))
  | Frontend_dAst.C_Expr_EApp (dtb__108, dtb__109, dtb__110) -> ((Base_dBytes.v_encTag 4) ((v_encExpr dtb__108) ((v_encExprList dtb__109) mc1)))
  | Frontend_dAst.C_Expr_ELam (dtb__111, dtb__112, dtb__113) -> ((Base_dBytes.v_encTag 3) ((v_encStrList ((B_dData_dList.v_map B_dData_dPair.v_firstOf) dtb__111)) ((v_encExpr dtb__112) mc1)))
  | Frontend_dAst.C_Expr_EStr (dtb__114, dtb__115) -> ((Base_dBytes.v_encTag 2) ((Base_dBytes.v_encStr dtb__114) mc1))
  | Frontend_dAst.C_Expr_EInt (dtb__116, dtb__117) -> ((Base_dBytes.v_encTag 1) ((Base_dBytes.v_encInt dtb__116) mc1))
  | Frontend_dAst.C_Expr_EVar (dtb__118, dtb__119) -> ((Base_dBytes.v_encTag 0) ((Base_dBytes.v_encStr dtb__118) mc1))
  | _ -> failwith "DT: impossible branch"
))

# 69 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
let v_encMaybeExpr = (fun (mc0 : Frontend_dAst.t_Expr B_dData_dMaybe.t_Maybe) (mc1 : string B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__120) -> (B_dData_dList.C_List__x58__x58_ ("1", ((v_encExpr dtb__120) mc1)))
  | B_dData_dMaybe.C_Maybe_Nothing -> (B_dData_dList.C_List__x58__x58_ ("0", mc1))
  | _ -> failwith "DT: impossible branch"
))

# 254 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
let v_encCtor = (fun (mc0 : Frontend_dAst.t_Ctor) (mc1 : string B_dData_dList.t_List) -> (match mc0 with
  | { Frontend_dAst.f_Ctor_ctorName = dtb__121; Frontend_dAst.f_Ctor_ctorType = dtb__122; Frontend_dAst.f_Ctor_ctorArity = dtb__123; Frontend_dAst.f_Ctor_ctorSpan = dtb__124 } -> ((Base_dBytes.v_encTag 0) ((Base_dBytes.v_encStr dtb__121) ((v_encExpr dtb__122) ((Base_dBytes.v_encInt dtb__123) mc1))))
  | _ -> failwith "DT: impossible branch"
))

# 164 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
let rec v_encCtorListGo = (fun (mc0 : Frontend_dAst.t_Ctor B_dData_dList.t_List) (mc1 : string B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__125, dtb__126) -> ((v_encCtor dtb__125) ((v_encCtorListGo dtb__126) mc1))
  | B_dData_dList.C_List_Nil -> mc1
  | _ -> failwith "DT: impossible branch"
))

# 160 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
let v_encCtorList = (fun (xs : Frontend_dAst.t_Ctor B_dData_dList.t_List) (acc : string B_dData_dList.t_List) -> (B_dData_dList.C_List__x58__x58_ ((String.concat "" ["["; (bi_strFromInt (Base_dBytes.v_lenOf xs)); ":"]), ((v_encCtorListGo xs) acc))))

# 258 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
let v_encField = (fun (mc0 : Frontend_dAst.t_Field) (mc1 : string B_dData_dList.t_List) -> (match mc0 with
  | { Frontend_dAst.f_Field_fieldName = dtb__127; Frontend_dAst.f_Field_fieldType = dtb__128; Frontend_dAst.f_Field_fieldSpan = dtb__129 } -> ((Base_dBytes.v_encTag 0) ((Base_dBytes.v_encStr dtb__127) ((v_encExpr dtb__128) mc1)))
  | _ -> failwith "DT: impossible branch"
))

# 173 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
let rec v_encFieldListGo = (fun (mc0 : Frontend_dAst.t_Field B_dData_dList.t_List) (mc1 : string B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__130, dtb__131) -> ((v_encField dtb__130) ((v_encFieldListGo dtb__131) mc1))
  | B_dData_dList.C_List_Nil -> mc1
  | _ -> failwith "DT: impossible branch"
))

# 169 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
let v_encFieldList = (fun (xs : Frontend_dAst.t_Field B_dData_dList.t_List) (acc : string B_dData_dList.t_List) -> (B_dData_dList.C_List__x58__x58_ ((String.concat "" ["["; (bi_strFromInt (Base_dBytes.v_lenOf xs)); ":"]), ((v_encFieldListGo xs) acc))))

# 262 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
let v_encTraitParam = (fun (mc0 : Frontend_dAst.t_TraitParam) (mc1 : string B_dData_dList.t_List) -> (match mc0 with
  | { Frontend_dAst.f_TraitParam_traitParamName = dtb__132; Frontend_dAst.f_TraitParam_traitParamKind = dtb__133 } -> ((Base_dBytes.v_encTag 0) ((Base_dBytes.v_encStr dtb__132) ((v_encMaybeExpr dtb__133) mc1)))
  | _ -> failwith "DT: impossible branch"
))

# 182 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
let rec v_encTraitParamListGo = (fun (mc0 : Frontend_dAst.t_TraitParam B_dData_dList.t_List) (mc1 : string B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__134, dtb__135) -> ((v_encTraitParam dtb__134) ((v_encTraitParamListGo dtb__135) mc1))
  | B_dData_dList.C_List_Nil -> mc1
  | _ -> failwith "DT: impossible branch"
))

# 178 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
let v_encTraitParamList = (fun (xs : Frontend_dAst.t_TraitParam B_dData_dList.t_List) (acc : string B_dData_dList.t_List) -> (B_dData_dList.C_List__x58__x58_ ((String.concat "" ["["; (bi_strFromInt (Base_dBytes.v_lenOf xs)); ":"]), ((v_encTraitParamListGo xs) acc))))

# 266 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
let v_encTraitMethod = (fun (mc0 : Frontend_dAst.t_TraitMethod) (mc1 : string B_dData_dList.t_List) -> (match mc0 with
  | { Frontend_dAst.f_TraitMethod_traitMethodName = dtb__136; Frontend_dAst.f_TraitMethod_traitMethodType = dtb__137; Frontend_dAst.f_TraitMethod_traitMethodSpan = dtb__138 } -> ((Base_dBytes.v_encTag 0) ((Base_dBytes.v_encStr dtb__136) ((v_encExpr dtb__137) mc1)))
  | _ -> failwith "DT: impossible branch"
))

# 191 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
let rec v_encTraitMethodListGo = (fun (mc0 : Frontend_dAst.t_TraitMethod B_dData_dList.t_List) (mc1 : string B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__139, dtb__140) -> ((v_encTraitMethod dtb__139) ((v_encTraitMethodListGo dtb__140) mc1))
  | B_dData_dList.C_List_Nil -> mc1
  | _ -> failwith "DT: impossible branch"
))

# 187 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
let v_encTraitMethodList = (fun (xs : Frontend_dAst.t_TraitMethod B_dData_dList.t_List) (acc : string B_dData_dList.t_List) -> (B_dData_dList.C_List__x58__x58_ ((String.concat "" ["["; (bi_strFromInt (Base_dBytes.v_lenOf xs)); ":"]), ((v_encTraitMethodListGo xs) acc))))

# 196 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
let rec v_encDecls = (fun (xs : Frontend_dAst.t_Decl B_dData_dList.t_List) (acc : string B_dData_dList.t_List) -> (B_dData_dList.C_List__x58__x58_ ((String.concat "" ["["; (bi_strFromInt (Base_dBytes.v_lenOf xs)); ":"]), ((v_encDeclsGo xs) acc))))
# 200 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
and v_encDeclsGo = (fun (mc0 : Frontend_dAst.t_Decl B_dData_dList.t_List) (mc1 : string B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__141, dtb__142) -> ((v_encDecl dtb__141) ((v_encDeclsGo dtb__142) mc1))
  | B_dData_dList.C_List_Nil -> mc1
  | _ -> failwith "DT: impossible branch"
))
# 270 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
and v_encDecl = (fun (mc0 : Frontend_dAst.t_Decl) (mc1 : string B_dData_dList.t_List) -> (match mc0 with
  | Frontend_dAst.C_Decl_DInstance (dtb__143, dtb__144, dtb__145, dtb__146) -> ((Base_dBytes.v_encTag 7) ((v_encExprList dtb__143) ((v_encExpr dtb__144) ((v_encDecls dtb__145) mc1))))
  | Frontend_dAst.C_Decl_DTrait (dtb__147, dtb__148, dtb__149, dtb__150, dtb__151) -> ((Base_dBytes.v_encTag 6) ((Base_dBytes.v_encStr dtb__147) ((v_encTraitParamList dtb__148) ((v_encExprList dtb__149) ((v_encTraitMethodList dtb__150) mc1)))))
  | Frontend_dAst.C_Decl_DRecord (dtb__152, dtb__153, dtb__154, dtb__155, dtb__156, dtb__157, dtb__158, dtb__159) -> ((Base_dBytes.v_encTag 5) ((Base_dBytes.v_encStr dtb__152) ((v_encStrList dtb__153) ((v_encFieldList dtb__154) ((v_encStrList dtb__155) ((Base_dBytes.v_encBool dtb__156) ((v_encReprTier dtb__157) ((Base_dBytes.v_encBool dtb__158) mc1))))))))
  | Frontend_dAst.C_Decl_DFun (dtb__160, dtb__161, dtb__162, dtb__163) -> ((Base_dBytes.v_encTag 4) ((Base_dBytes.v_encStr dtb__160) ((v_encPatList dtb__161) ((v_encExpr dtb__162) mc1))))
  | Frontend_dAst.C_Decl_DSig (dtb__164, dtb__165, dtb__166, dtb__167) -> ((Base_dBytes.v_encTag 3) ((Base_dBytes.v_encStr dtb__164) ((v_encExprList dtb__165) ((v_encExpr dtb__166) mc1))))
  | Frontend_dAst.C_Decl_DExtern (dtb__168, dtb__169, dtb__170, dtb__171) -> ((Base_dBytes.v_encTag 2) ((Base_dBytes.v_encStr dtb__168) ((Base_dBytes.v_encStr dtb__169) ((v_encExpr dtb__170) mc1))))
  | Frontend_dAst.C_Decl_DAxiom (dtb__172, dtb__173, dtb__174) -> ((Base_dBytes.v_encTag 1) ((Base_dBytes.v_encStr dtb__172) ((v_encExpr dtb__173) mc1)))
  | Frontend_dAst.C_Decl_DData (dtb__175, dtb__176, dtb__177, dtb__178, dtb__179, dtb__180, dtb__181, dtb__182, dtb__183) -> ((Base_dBytes.v_encTag 0) ((Base_dBytes.v_encStr dtb__175) ((v_encStrList dtb__176) ((v_encExpr dtb__177) ((v_encCtorList dtb__178) ((v_encStrList dtb__179) ((Base_dBytes.v_encBool dtb__180) ((v_encReprTier dtb__181) ((Base_dBytes.v_encBool dtb__182) mc1)))))))))
  | _ -> failwith "DT: impossible branch"
))

# 294 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
let v_decQty = (fun (fuel : int) (bytes : Base_dBytes.t_Cur) -> (if (fuel <= 0) then B_dData_dMaybe.C_Maybe_Nothing else (let nd_uscrut2 = ((Base_dBytes.v_decTag fuel) bytes) in (match nd_uscrut2 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__184) -> (match dtb__184 with
  | { B_dData_dPair.f_Pair_first = dtb__185; B_dData_dPair.f_Pair_second = dtb__186 } -> (if (dtb__185 = 0) then (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = Frontend_dAst.C_Qty_Q0; B_dData_dPair.f_Pair_second = dtb__186 })) else (if (dtb__185 = 1) then (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = Frontend_dAst.C_Qty_Q1; B_dData_dPair.f_Pair_second = dtb__186 })) else B_dData_dMaybe.C_Maybe_Nothing))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))))

# 308 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
let v_decReprTier = (fun (fuel : int) (bytes : Base_dBytes.t_Cur) -> (if (fuel <= 0) then B_dData_dMaybe.C_Maybe_Nothing else (let nd_uscrut2 = ((Base_dBytes.v_decTag fuel) bytes) in (match nd_uscrut2 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__187) -> (match dtb__187 with
  | { B_dData_dPair.f_Pair_first = dtb__188; B_dData_dPair.f_Pair_second = dtb__189 } -> (if (dtb__188 = 0) then (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = Frontend_dAst.C_ReprTier_ReprAuto; B_dData_dPair.f_Pair_second = dtb__189 })) else (if (dtb__188 = 1) then (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = Frontend_dAst.C_ReprTier_ReprAlias; B_dData_dPair.f_Pair_second = dtb__189 })) else (if (dtb__188 = 2) then (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = Frontend_dAst.C_ReprTier_ReprBoxed; B_dData_dPair.f_Pair_second = dtb__189 })) else B_dData_dMaybe.C_Maybe_Nothing)))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))))

# 323 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
let v_decMaybeQty = (fun (fuel : int) (bytes : Base_dBytes.t_Cur) -> (((Base_dBytes.v_decMaybe v_decQty) fuel) bytes))

# 855 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
let rec v_decListDigits = (fun (fuel : int) (acc : int) (c : Base_dBytes.t_Cur) -> (if (fuel <= 0) then B_dData_dMaybe.C_Maybe_Nothing else (match (Base_dBytes.v_curChar c) with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb__190) -> (if (dtb__190 = 58) then (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = acc; B_dData_dPair.f_Pair_second = (Base_dBytes.v_curSkip c) })) else (if (if (dtb__190 >= 48) then (dtb__190 <= 57) else false) then (((v_decListDigits (fuel - 1)) ((acc * 10) + (dtb__190 - 48))) (Base_dBytes.v_curSkip c)) else B_dData_dMaybe.C_Maybe_Nothing))
  | _ -> failwith "DT: impossible branch"
)))

# 845 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
let v_decListHead = (fun (fuel : int) (c : Base_dBytes.t_Cur) -> (if (fuel <= 0) then B_dData_dMaybe.C_Maybe_Nothing else (let nd_uscrut2 = (Base_dBytes.v_curChar c) in (match nd_uscrut2 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__191) -> (if (dtb__191 = 91) then (((v_decListDigits (fuel - 1)) 0) (Base_dBytes.v_curSkip c)) else B_dData_dMaybe.C_Maybe_Nothing)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
))))

# 351 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
let rec v_decPat = (fun (fuel : int) (bytes : Base_dBytes.t_Cur) -> (if (fuel <= 0) then B_dData_dMaybe.C_Maybe_Nothing else (let nd_uscrut2 = ((Base_dBytes.v_decTag fuel) bytes) in (match nd_uscrut2 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__192) -> (match dtb__192 with
  | { B_dData_dPair.f_Pair_first = dtb__193; B_dData_dPair.f_Pair_second = dtb__194 } -> (if (dtb__193 = 0) then (let nd_uscrut9 = ((Base_dBytes.v_decStr (fuel - 1)) dtb__194) in (match nd_uscrut9 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__195) -> (match dtb__195 with
  | { B_dData_dPair.f_Pair_first = dtb__196; B_dData_dPair.f_Pair_second = dtb__197 } -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Pat_PVar (dtb__196, v_noSpan)); B_dData_dPair.f_Pair_second = dtb__197 }))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) else (if (dtb__193 = 1) then (let nd_uscrut9 = ((Base_dBytes.v_decStr (fuel - 1)) dtb__194) in (match nd_uscrut9 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__198) -> (match dtb__198 with
  | { B_dData_dPair.f_Pair_first = dtb__199; B_dData_dPair.f_Pair_second = dtb__200 } -> (let nd_uscrut16 = ((v_decPat (fuel - 1)) dtb__200) in (match nd_uscrut16 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__201) -> (match dtb__201 with
  | { B_dData_dPair.f_Pair_first = dtb__202; B_dData_dPair.f_Pair_second = dtb__203 } -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Pat_PAs (dtb__199, dtb__202, v_noSpan)); B_dData_dPair.f_Pair_second = dtb__203 }))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) else (if (dtb__193 = 2) then (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Pat_PWild (v_noSpan)); B_dData_dPair.f_Pair_second = dtb__194 })) else (if (dtb__193 = 3) then (let nd_uscrut9 = ((Base_dBytes.v_decStr (fuel - 1)) dtb__194) in (match nd_uscrut9 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__204) -> (match dtb__204 with
  | { B_dData_dPair.f_Pair_first = dtb__205; B_dData_dPair.f_Pair_second = dtb__206 } -> (let nd_uscrut16 = ((v_decPatList (fuel - 1)) dtb__206) in (match nd_uscrut16 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__207) -> (match dtb__207 with
  | { B_dData_dPair.f_Pair_first = dtb__208; B_dData_dPair.f_Pair_second = dtb__209 } -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Pat_PCon (dtb__205, dtb__208, v_noSpan)); B_dData_dPair.f_Pair_second = dtb__209 }))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) else (if (dtb__193 = 4) then (let nd_uscrut9 = ((Base_dBytes.v_decInt (fuel - 1)) dtb__194) in (match nd_uscrut9 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__210) -> (match dtb__210 with
  | { B_dData_dPair.f_Pair_first = dtb__211; B_dData_dPair.f_Pair_second = dtb__212 } -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Pat_PInt (dtb__211, v_noSpan)); B_dData_dPair.f_Pair_second = dtb__212 }))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) else (if (dtb__193 = 5) then (let nd_uscrut9 = ((Base_dBytes.v_decStr (fuel - 1)) dtb__194) in (match nd_uscrut9 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__213) -> (match dtb__213 with
  | { B_dData_dPair.f_Pair_first = dtb__214; B_dData_dPair.f_Pair_second = dtb__215 } -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Pat_PStr (dtb__214, v_noSpan)); B_dData_dPair.f_Pair_second = dtb__215 }))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) else (if (dtb__193 = 6) then (let nd_uscrut9 = ((Base_dBytes.v_decStr (fuel - 1)) dtb__194) in (match nd_uscrut9 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__216) -> (match dtb__216 with
  | { B_dData_dPair.f_Pair_first = dtb__217; B_dData_dPair.f_Pair_second = dtb__218 } -> (let nd_uscrut16 = (((Base_dBytes.v_decList v_decStrPat) (fuel - 1)) dtb__218) in (match nd_uscrut16 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__219) -> (match dtb__219 with
  | { B_dData_dPair.f_Pair_first = dtb__220; B_dData_dPair.f_Pair_second = dtb__221 } -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Pat_PRecord (dtb__217, dtb__220, v_noSpan)); B_dData_dPair.f_Pair_second = dtb__221 }))
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
# 831 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
and v_decStrPat = (fun (fuel : int) (bytes : Base_dBytes.t_Cur) -> (if (fuel <= 0) then B_dData_dMaybe.C_Maybe_Nothing else (let nd_uscrut2 = ((Base_dBytes.v_decStr (fuel - 1)) bytes) in (match nd_uscrut2 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__222) -> (match dtb__222 with
  | { B_dData_dPair.f_Pair_first = dtb__223; B_dData_dPair.f_Pair_second = dtb__224 } -> (let nd_uscrut9 = ((v_decPat (fuel - 1)) dtb__224) in (match nd_uscrut9 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__225) -> (match dtb__225 with
  | { B_dData_dPair.f_Pair_first = dtb__226; B_dData_dPair.f_Pair_second = dtb__227 } -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = { B_dData_dPair.f_Pair_first = dtb__223; B_dData_dPair.f_Pair_second = dtb__226 }; B_dData_dPair.f_Pair_second = dtb__227 }))
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
# 892 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
and v_decPatList = (fun (fuel : int) (bytes : Base_dBytes.t_Cur) -> (if (fuel <= 0) then B_dData_dMaybe.C_Maybe_Nothing else (let nd_uscrut2 = ((v_decListHead fuel) bytes) in (match nd_uscrut2 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__228) -> (match dtb__228 with
  | { B_dData_dPair.f_Pair_first = dtb__229; B_dData_dPair.f_Pair_second = dtb__230 } -> ((((v_decPatListItems (fuel - 1)) dtb__229) dtb__230) B_dData_dList.C_List_Nil)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))))
# 902 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
and v_decPatListItems = (fun (fuel : int) (n : int) (bytes : Base_dBytes.t_Cur) (acc : Frontend_dAst.t_Pat B_dData_dList.t_List) -> (if (fuel <= 0) then B_dData_dMaybe.C_Maybe_Nothing else (if (n <= 0) then (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (B_dData_dList.v_reverse acc); B_dData_dPair.f_Pair_second = bytes })) else (let nd_uscrut4 = ((v_decPat (fuel - 1)) bytes) in (match nd_uscrut4 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__231) -> (match dtb__231 with
  | { B_dData_dPair.f_Pair_first = dtb__232; B_dData_dPair.f_Pair_second = dtb__233 } -> ((((v_decPatListItems (fuel - 1)) (n - 1)) dtb__233) (B_dData_dList.C_List__x58__x58_ (dtb__232, acc)))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)))))

# 331 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
let rec v_decInterpPart = (fun (fuel : int) (bytes : Base_dBytes.t_Cur) -> (if (fuel <= 0) then B_dData_dMaybe.C_Maybe_Nothing else (let nd_uscrut2 = ((Base_dBytes.v_decTag fuel) bytes) in (match nd_uscrut2 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__234) -> (match dtb__234 with
  | { B_dData_dPair.f_Pair_first = dtb__235; B_dData_dPair.f_Pair_second = dtb__236 } -> (if (dtb__235 = 0) then (let nd_uscrut9 = ((Base_dBytes.v_decStr (fuel - 1)) dtb__236) in (match nd_uscrut9 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__237) -> (match dtb__237 with
  | { B_dData_dPair.f_Pair_first = dtb__238; B_dData_dPair.f_Pair_second = dtb__239 } -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_InterpPart_IPText (dtb__238)); B_dData_dPair.f_Pair_second = dtb__239 }))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) else (if (dtb__235 = 1) then (let nd_uscrut9 = ((v_decExpr (fuel - 1)) dtb__236) in (match nd_uscrut9 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__240) -> (match dtb__240 with
  | { B_dData_dPair.f_Pair_first = dtb__241; B_dData_dPair.f_Pair_second = dtb__242 } -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_InterpPart_IPHole (dtb__241)); B_dData_dPair.f_Pair_second = dtb__242 }))
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
# 397 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
and v_decDoStmt = (fun (fuel : int) (bytes : Base_dBytes.t_Cur) -> (if (fuel <= 0) then B_dData_dMaybe.C_Maybe_Nothing else (let nd_uscrut2 = ((Base_dBytes.v_decTag fuel) bytes) in (match nd_uscrut2 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__243) -> (match dtb__243 with
  | { B_dData_dPair.f_Pair_first = dtb__244; B_dData_dPair.f_Pair_second = dtb__245 } -> (if (dtb__244 = 0) then (let nd_uscrut9 = ((v_decPat (fuel - 1)) dtb__245) in (match nd_uscrut9 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__246) -> (match dtb__246 with
  | { B_dData_dPair.f_Pair_first = dtb__247; B_dData_dPair.f_Pair_second = dtb__248 } -> (let nd_uscrut16 = ((v_decExpr (fuel - 1)) dtb__248) in (match nd_uscrut16 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__249) -> (match dtb__249 with
  | { B_dData_dPair.f_Pair_first = dtb__250; B_dData_dPair.f_Pair_second = dtb__251 } -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_DoStmt_DBind (dtb__247, dtb__250, v_noSpan)); B_dData_dPair.f_Pair_second = dtb__251 }))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) else (if (dtb__244 = 1) then (let nd_uscrut9 = ((v_decExpr (fuel - 1)) dtb__245) in (match nd_uscrut9 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__252) -> (match dtb__252 with
  | { B_dData_dPair.f_Pair_first = dtb__253; B_dData_dPair.f_Pair_second = dtb__254 } -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_DoStmt_DExpr (dtb__253, v_noSpan)); B_dData_dPair.f_Pair_second = dtb__254 }))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) else (if (dtb__244 = 2) then (let nd_uscrut9 = (((Base_dBytes.v_decList v_decPatExpr) (fuel - 1)) dtb__245) in (match nd_uscrut9 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__255) -> (match dtb__255 with
  | { B_dData_dPair.f_Pair_first = dtb__256; B_dData_dPair.f_Pair_second = dtb__257 } -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_DoStmt_DLet (dtb__256, v_noSpan)); B_dData_dPair.f_Pair_second = dtb__257 }))
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
# 424 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
and v_decExpr = (fun (fuel : int) (bytes : Base_dBytes.t_Cur) -> (if (fuel <= 0) then B_dData_dMaybe.C_Maybe_Nothing else (let nd_uscrut2 = ((Base_dBytes.v_decTag fuel) bytes) in (match nd_uscrut2 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__258) -> (match dtb__258 with
  | { B_dData_dPair.f_Pair_first = dtb__259; B_dData_dPair.f_Pair_second = dtb__260 } -> (if (dtb__259 = 0) then (let nd_uscrut9 = ((Base_dBytes.v_decStr (fuel - 1)) dtb__260) in (match nd_uscrut9 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__261) -> (match dtb__261 with
  | { B_dData_dPair.f_Pair_first = dtb__262; B_dData_dPair.f_Pair_second = dtb__263 } -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Expr_EVar (dtb__262, v_noSpan)); B_dData_dPair.f_Pair_second = dtb__263 }))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) else (if (dtb__259 = 1) then (let nd_uscrut9 = ((Base_dBytes.v_decInt (fuel - 1)) dtb__260) in (match nd_uscrut9 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__264) -> (match dtb__264 with
  | { B_dData_dPair.f_Pair_first = dtb__265; B_dData_dPair.f_Pair_second = dtb__266 } -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Expr_EInt (dtb__265, v_noSpan)); B_dData_dPair.f_Pair_second = dtb__266 }))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) else (if (dtb__259 = 2) then (let nd_uscrut9 = ((Base_dBytes.v_decStr (fuel - 1)) dtb__260) in (match nd_uscrut9 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__267) -> (match dtb__267 with
  | { B_dData_dPair.f_Pair_first = dtb__268; B_dData_dPair.f_Pair_second = dtb__269 } -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Expr_EStr (dtb__268, v_noSpan)); B_dData_dPair.f_Pair_second = dtb__269 }))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) else (if (dtb__259 = 3) then (let nd_uscrut9 = (((Base_dBytes.v_decList Base_dBytes.v_decStr) (fuel - 1)) dtb__260) in (match nd_uscrut9 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__270) -> (match dtb__270 with
  | { B_dData_dPair.f_Pair_first = dtb__271; B_dData_dPair.f_Pair_second = dtb__272 } -> (let nd_uscrut16 = ((v_decExpr (fuel - 1)) dtb__272) in (match nd_uscrut16 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__273) -> (match dtb__273 with
  | { B_dData_dPair.f_Pair_first = dtb__274; B_dData_dPair.f_Pair_second = dtb__275 } -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Expr_ELam (((B_dData_dList.v_map (fun (n : string) -> { B_dData_dPair.f_Pair_first = n; B_dData_dPair.f_Pair_second = v_noSpan })) dtb__271), dtb__274, v_noSpan)); B_dData_dPair.f_Pair_second = dtb__275 }))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) else (if (dtb__259 = 4) then (let nd_uscrut9 = ((v_decExpr (fuel - 1)) dtb__260) in (match nd_uscrut9 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__276) -> (match dtb__276 with
  | { B_dData_dPair.f_Pair_first = dtb__277; B_dData_dPair.f_Pair_second = dtb__278 } -> (let nd_uscrut16 = ((v_decExprList (fuel - 1)) dtb__278) in (match nd_uscrut16 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__279) -> (match dtb__279 with
  | { B_dData_dPair.f_Pair_first = dtb__280; B_dData_dPair.f_Pair_second = dtb__281 } -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Expr_EApp (dtb__277, dtb__280, v_noSpan)); B_dData_dPair.f_Pair_second = dtb__281 }))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) else (if (dtb__259 = 5) then (let nd_uscrut9 = ((Base_dBytes.v_decStr (fuel - 1)) dtb__260) in (match nd_uscrut9 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__282) -> (match dtb__282 with
  | { B_dData_dPair.f_Pair_first = dtb__283; B_dData_dPair.f_Pair_second = dtb__284 } -> (let nd_uscrut16 = ((Base_dBytes.v_decBool (fuel - 1)) dtb__284) in (match nd_uscrut16 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__285) -> (match dtb__285 with
  | { B_dData_dPair.f_Pair_first = dtb__286; B_dData_dPair.f_Pair_second = dtb__287 } -> (let nd_uscrut23 = (((Base_dBytes.v_decMaybe v_decQty) (fuel - 1)) dtb__287) in (match nd_uscrut23 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__288) -> (match dtb__288 with
  | { B_dData_dPair.f_Pair_first = dtb__289; B_dData_dPair.f_Pair_second = dtb__290 } -> (let nd_uscrut30 = ((v_decExpr (fuel - 1)) dtb__290) in (match nd_uscrut30 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__291) -> (match dtb__291 with
  | { B_dData_dPair.f_Pair_first = dtb__292; B_dData_dPair.f_Pair_second = dtb__293 } -> (let nd_uscrut37 = ((v_decExpr (fuel - 1)) dtb__293) in (match nd_uscrut37 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__294) -> (match dtb__294 with
  | { B_dData_dPair.f_Pair_first = dtb__295; B_dData_dPair.f_Pair_second = dtb__296 } -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Expr_EPi (dtb__283, dtb__286, dtb__289, dtb__292, dtb__295, v_noSpan)); B_dData_dPair.f_Pair_second = dtb__296 }))
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
)) else (if (dtb__259 = 6) then (let nd_uscrut9 = (((Base_dBytes.v_decList v_decPatExpr) (fuel - 1)) dtb__260) in (match nd_uscrut9 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__297) -> (match dtb__297 with
  | { B_dData_dPair.f_Pair_first = dtb__298; B_dData_dPair.f_Pair_second = dtb__299 } -> (let nd_uscrut16 = ((v_decExpr (fuel - 1)) dtb__299) in (match nd_uscrut16 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__300) -> (match dtb__300 with
  | { B_dData_dPair.f_Pair_first = dtb__301; B_dData_dPair.f_Pair_second = dtb__302 } -> (let nd_uscrut23 = ((Base_dBytes.v_decBool (fuel - 1)) dtb__302) in (match nd_uscrut23 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__303) -> (match dtb__303 with
  | { B_dData_dPair.f_Pair_first = dtb__304; B_dData_dPair.f_Pair_second = dtb__305 } -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Expr_ELet (dtb__298, dtb__301, dtb__304, v_noSpan)); B_dData_dPair.f_Pair_second = dtb__305 }))
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
)) else (if (dtb__259 = 7) then (let nd_uscrut9 = (((Base_dBytes.v_decList v_decClause) (fuel - 1)) dtb__260) in (match nd_uscrut9 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__306) -> (match dtb__306 with
  | { B_dData_dPair.f_Pair_first = dtb__307; B_dData_dPair.f_Pair_second = dtb__308 } -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Expr_ELocalFun (dtb__307, v_noSpan)); B_dData_dPair.f_Pair_second = dtb__308 }))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) else (if (dtb__259 = 8) then (let nd_uscrut9 = ((v_decExpr (fuel - 1)) dtb__260) in (match nd_uscrut9 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__309) -> (match dtb__309 with
  | { B_dData_dPair.f_Pair_first = dtb__310; B_dData_dPair.f_Pair_second = dtb__311 } -> (let nd_uscrut16 = (((Base_dBytes.v_decList v_decPatExpr) (fuel - 1)) dtb__311) in (match nd_uscrut16 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__312) -> (match dtb__312 with
  | { B_dData_dPair.f_Pair_first = dtb__313; B_dData_dPair.f_Pair_second = dtb__314 } -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Expr_ECase (dtb__310, dtb__313, v_noSpan)); B_dData_dPair.f_Pair_second = dtb__314 }))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) else (if (dtb__259 = 9) then (let nd_uscrut9 = ((v_decExpr (fuel - 1)) dtb__260) in (match nd_uscrut9 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__315) -> (match dtb__315 with
  | { B_dData_dPair.f_Pair_first = dtb__316; B_dData_dPair.f_Pair_second = dtb__317 } -> (let nd_uscrut16 = ((v_decExpr (fuel - 1)) dtb__317) in (match nd_uscrut16 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__318) -> (match dtb__318 with
  | { B_dData_dPair.f_Pair_first = dtb__319; B_dData_dPair.f_Pair_second = dtb__320 } -> (let nd_uscrut23 = ((v_decExpr (fuel - 1)) dtb__320) in (match nd_uscrut23 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__321) -> (match dtb__321 with
  | { B_dData_dPair.f_Pair_first = dtb__322; B_dData_dPair.f_Pair_second = dtb__323 } -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Expr_EIf (dtb__316, dtb__319, dtb__322, v_noSpan)); B_dData_dPair.f_Pair_second = dtb__323 }))
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
)) else (if (dtb__259 = 10) then (let nd_uscrut9 = ((v_decExpr (fuel - 1)) dtb__260) in (match nd_uscrut9 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__324) -> (match dtb__324 with
  | { B_dData_dPair.f_Pair_first = dtb__325; B_dData_dPair.f_Pair_second = dtb__326 } -> (let nd_uscrut16 = ((Base_dBytes.v_decStr (fuel - 1)) dtb__326) in (match nd_uscrut16 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__327) -> (match dtb__327 with
  | { B_dData_dPair.f_Pair_first = dtb__328; B_dData_dPair.f_Pair_second = dtb__329 } -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Expr_EField (dtb__325, dtb__328, v_noSpan)); B_dData_dPair.f_Pair_second = dtb__329 }))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) else (if (dtb__259 = 11) then (let nd_uscrut9 = ((Base_dBytes.v_decStr (fuel - 1)) dtb__260) in (match nd_uscrut9 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__330) -> (match dtb__330 with
  | { B_dData_dPair.f_Pair_first = dtb__331; B_dData_dPair.f_Pair_second = dtb__332 } -> (let nd_uscrut16 = (((Base_dBytes.v_decList v_decStrExpr) (fuel - 1)) dtb__332) in (match nd_uscrut16 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__333) -> (match dtb__333 with
  | { B_dData_dPair.f_Pair_first = dtb__334; B_dData_dPair.f_Pair_second = dtb__335 } -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Expr_ERecord (dtb__331, dtb__334, v_noSpan)); B_dData_dPair.f_Pair_second = dtb__335 }))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) else (if (dtb__259 = 12) then (let nd_uscrut9 = ((v_decExpr (fuel - 1)) dtb__260) in (match nd_uscrut9 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__336) -> (match dtb__336 with
  | { B_dData_dPair.f_Pair_first = dtb__337; B_dData_dPair.f_Pair_second = dtb__338 } -> (let nd_uscrut16 = (((Base_dBytes.v_decList v_decStrExpr) (fuel - 1)) dtb__338) in (match nd_uscrut16 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__339) -> (match dtb__339 with
  | { B_dData_dPair.f_Pair_first = dtb__340; B_dData_dPair.f_Pair_second = dtb__341 } -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Expr_ERecUpdate (dtb__337, dtb__340, v_noSpan)); B_dData_dPair.f_Pair_second = dtb__341 }))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) else (if (dtb__259 = 13) then (let nd_uscrut9 = (((Base_dBytes.v_decList v_decDoStmt) (fuel - 1)) dtb__260) in (match nd_uscrut9 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__342) -> (match dtb__342 with
  | { B_dData_dPair.f_Pair_first = dtb__343; B_dData_dPair.f_Pair_second = dtb__344 } -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Expr_EDo (dtb__343, v_noSpan)); B_dData_dPair.f_Pair_second = dtb__344 }))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) else (if (dtb__259 = 14) then (let nd_uscrut9 = ((Base_dBytes.v_decStr (fuel - 1)) dtb__260) in (match nd_uscrut9 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__345) -> (match dtb__345 with
  | { B_dData_dPair.f_Pair_first = dtb__346; B_dData_dPair.f_Pair_second = dtb__347 } -> (let nd_uscrut16 = ((v_decExpr (fuel - 1)) dtb__347) in (match nd_uscrut16 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__348) -> (match dtb__348 with
  | { B_dData_dPair.f_Pair_first = dtb__349; B_dData_dPair.f_Pair_second = dtb__350 } -> (let nd_uscrut23 = ((v_decExpr (fuel - 1)) dtb__350) in (match nd_uscrut23 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__351) -> (match dtb__351 with
  | { B_dData_dPair.f_Pair_first = dtb__352; B_dData_dPair.f_Pair_second = dtb__353 } -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Expr_EInfix (dtb__346, dtb__349, dtb__352, v_noSpan)); B_dData_dPair.f_Pair_second = dtb__353 }))
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
)) else (if (dtb__259 = 15) then (let nd_uscrut9 = ((v_decExpr (fuel - 1)) dtb__260) in (match nd_uscrut9 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__354) -> (match dtb__354 with
  | { B_dData_dPair.f_Pair_first = dtb__355; B_dData_dPair.f_Pair_second = dtb__356 } -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Expr_EParen (dtb__355, v_noSpan)); B_dData_dPair.f_Pair_second = dtb__356 }))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) else (if (dtb__259 = 16) then (let nd_uscrut9 = ((Base_dBytes.v_decStr (fuel - 1)) dtb__260) in (match nd_uscrut9 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__357) -> (match dtb__357 with
  | { B_dData_dPair.f_Pair_first = dtb__358; B_dData_dPair.f_Pair_second = dtb__359 } -> (let nd_uscrut16 = ((v_decExpr (fuel - 1)) dtb__359) in (match nd_uscrut16 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__360) -> (match dtb__360 with
  | { B_dData_dPair.f_Pair_first = dtb__361; B_dData_dPair.f_Pair_second = dtb__362 } -> (let nd_uscrut23 = ((v_decExpr (fuel - 1)) dtb__362) in (match nd_uscrut23 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__363) -> (match dtb__363 with
  | { B_dData_dPair.f_Pair_first = dtb__364; B_dData_dPair.f_Pair_second = dtb__365 } -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Expr_EBacktick (dtb__358, dtb__361, dtb__364, v_noSpan)); B_dData_dPair.f_Pair_second = dtb__365 }))
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
)) else (if (dtb__259 = 17) then (let nd_uscrut9 = ((Base_dBytes.v_decStr (fuel - 1)) dtb__260) in (match nd_uscrut9 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__366) -> (match dtb__366 with
  | { B_dData_dPair.f_Pair_first = dtb__367; B_dData_dPair.f_Pair_second = dtb__368 } -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Expr_ESectOp (dtb__367, v_noSpan)); B_dData_dPair.f_Pair_second = dtb__368 }))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) else (if (dtb__259 = 18) then (let nd_uscrut9 = ((Base_dBytes.v_decStr (fuel - 1)) dtb__260) in (match nd_uscrut9 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__369) -> (match dtb__369 with
  | { B_dData_dPair.f_Pair_first = dtb__370; B_dData_dPair.f_Pair_second = dtb__371 } -> (let nd_uscrut16 = ((v_decExpr (fuel - 1)) dtb__371) in (match nd_uscrut16 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__372) -> (match dtb__372 with
  | { B_dData_dPair.f_Pair_first = dtb__373; B_dData_dPair.f_Pair_second = dtb__374 } -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Expr_ESectL (dtb__370, dtb__373, v_noSpan)); B_dData_dPair.f_Pair_second = dtb__374 }))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) else (if (dtb__259 = 19) then (let nd_uscrut9 = ((v_decExpr (fuel - 1)) dtb__260) in (match nd_uscrut9 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__375) -> (match dtb__375 with
  | { B_dData_dPair.f_Pair_first = dtb__376; B_dData_dPair.f_Pair_second = dtb__377 } -> (let nd_uscrut16 = ((Base_dBytes.v_decStr (fuel - 1)) dtb__377) in (match nd_uscrut16 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__378) -> (match dtb__378 with
  | { B_dData_dPair.f_Pair_first = dtb__379; B_dData_dPair.f_Pair_second = dtb__380 } -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Expr_ESectR (dtb__376, dtb__379, v_noSpan)); B_dData_dPair.f_Pair_second = dtb__380 }))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) else (if (dtb__259 = 20) then (let nd_uscrut9 = ((v_decExpr (fuel - 1)) dtb__260) in (match nd_uscrut9 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__381) -> (match dtb__381 with
  | { B_dData_dPair.f_Pair_first = dtb__382; B_dData_dPair.f_Pair_second = dtb__383 } -> (let nd_uscrut16 = ((v_decExpr (fuel - 1)) dtb__383) in (match nd_uscrut16 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__384) -> (match dtb__384 with
  | { B_dData_dPair.f_Pair_first = dtb__385; B_dData_dPair.f_Pair_second = dtb__386 } -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Expr_EAnn (dtb__382, dtb__385, v_noSpan)); B_dData_dPair.f_Pair_second = dtb__386 }))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) else (if (dtb__259 = 21) then (let nd_uscrut9 = ((Base_dBytes.v_decBool (fuel - 1)) dtb__260) in (match nd_uscrut9 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__387) -> (match dtb__387 with
  | { B_dData_dPair.f_Pair_first = dtb__388; B_dData_dPair.f_Pair_second = dtb__389 } -> (let nd_uscrut16 = (((Base_dBytes.v_decList v_decInterpPart) (fuel - 1)) dtb__389) in (match nd_uscrut16 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__390) -> (match dtb__390 with
  | { B_dData_dPair.f_Pair_first = dtb__391; B_dData_dPair.f_Pair_second = dtb__392 } -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Expr_EInterp (dtb__388, dtb__391, v_noSpan)); B_dData_dPair.f_Pair_second = dtb__392 }))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) else (if (dtb__259 = 22) then (let nd_uscrut9 = ((Base_dBytes.v_decStr (fuel - 1)) dtb__260) in (match nd_uscrut9 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__393) -> (match dtb__393 with
  | { B_dData_dPair.f_Pair_first = dtb__394; B_dData_dPair.f_Pair_second = dtb__395 } -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Expr_EFloat (dtb__394, v_noSpan)); B_dData_dPair.f_Pair_second = dtb__395 }))
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
# 792 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
and v_decPatExpr = (fun (fuel : int) (bytes : Base_dBytes.t_Cur) -> (if (fuel <= 0) then B_dData_dMaybe.C_Maybe_Nothing else (let nd_uscrut2 = ((v_decPat (fuel - 1)) bytes) in (match nd_uscrut2 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__396) -> (match dtb__396 with
  | { B_dData_dPair.f_Pair_first = dtb__397; B_dData_dPair.f_Pair_second = dtb__398 } -> (let nd_uscrut9 = ((v_decExpr (fuel - 1)) dtb__398) in (match nd_uscrut9 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__399) -> (match dtb__399 with
  | { B_dData_dPair.f_Pair_first = dtb__400; B_dData_dPair.f_Pair_second = dtb__401 } -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = { B_dData_dPair.f_Pair_first = dtb__397; B_dData_dPair.f_Pair_second = dtb__400 }; B_dData_dPair.f_Pair_second = dtb__401 }))
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
# 805 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
and v_decClause = (fun (fuel : int) (bytes : Base_dBytes.t_Cur) -> (if (fuel <= 0) then B_dData_dMaybe.C_Maybe_Nothing else (let nd_uscrut2 = ((v_decPatList (fuel - 1)) bytes) in (match nd_uscrut2 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__402) -> (match dtb__402 with
  | { B_dData_dPair.f_Pair_first = dtb__403; B_dData_dPair.f_Pair_second = dtb__404 } -> (let nd_uscrut9 = ((v_decExpr (fuel - 1)) dtb__404) in (match nd_uscrut9 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__405) -> (match dtb__405 with
  | { B_dData_dPair.f_Pair_first = dtb__406; B_dData_dPair.f_Pair_second = dtb__407 } -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = { B_dData_dPair.f_Pair_first = dtb__403; B_dData_dPair.f_Pair_second = dtb__406 }; B_dData_dPair.f_Pair_second = dtb__407 }))
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
# 818 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
and v_decStrExpr = (fun (fuel : int) (bytes : Base_dBytes.t_Cur) -> (if (fuel <= 0) then B_dData_dMaybe.C_Maybe_Nothing else (let nd_uscrut2 = ((Base_dBytes.v_decStr (fuel - 1)) bytes) in (match nd_uscrut2 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__408) -> (match dtb__408 with
  | { B_dData_dPair.f_Pair_first = dtb__409; B_dData_dPair.f_Pair_second = dtb__410 } -> (let nd_uscrut9 = ((v_decExpr (fuel - 1)) dtb__410) in (match nd_uscrut9 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__411) -> (match dtb__411 with
  | { B_dData_dPair.f_Pair_first = dtb__412; B_dData_dPair.f_Pair_second = dtb__413 } -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = { B_dData_dPair.f_Pair_first = dtb__409; B_dData_dPair.f_Pair_second = dtb__412 }; B_dData_dPair.f_Pair_second = dtb__413 }))
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
# 870 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
and v_decExprList = (fun (fuel : int) (bytes : Base_dBytes.t_Cur) -> (if (fuel <= 0) then B_dData_dMaybe.C_Maybe_Nothing else (let nd_uscrut2 = ((v_decListHead fuel) bytes) in (match nd_uscrut2 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__414) -> (match dtb__414 with
  | { B_dData_dPair.f_Pair_first = dtb__415; B_dData_dPair.f_Pair_second = dtb__416 } -> ((((v_decExprListItems (fuel - 1)) dtb__415) dtb__416) B_dData_dList.C_List_Nil)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))))
# 880 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
and v_decExprListItems = (fun (fuel : int) (n : int) (bytes : Base_dBytes.t_Cur) (acc : Frontend_dAst.t_Expr B_dData_dList.t_List) -> (if (fuel <= 0) then B_dData_dMaybe.C_Maybe_Nothing else (if (n <= 0) then (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (B_dData_dList.v_reverse acc); B_dData_dPair.f_Pair_second = bytes })) else (let nd_uscrut4 = ((v_decExpr (fuel - 1)) bytes) in (match nd_uscrut4 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__417) -> (match dtb__417 with
  | { B_dData_dPair.f_Pair_first = dtb__418; B_dData_dPair.f_Pair_second = dtb__419 } -> ((((v_decExprListItems (fuel - 1)) (n - 1)) dtb__419) (B_dData_dList.C_List__x58__x58_ (dtb__418, acc)))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)))))

# 327 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
let v_decMaybeExpr = (fun (fuel : int) (bytes : Base_dBytes.t_Cur) -> (((Base_dBytes.v_decMaybe v_decExpr) fuel) bytes))

# 594 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
let v_decCtor = (fun (fuel : int) (bytes : Base_dBytes.t_Cur) -> (if (fuel <= 0) then B_dData_dMaybe.C_Maybe_Nothing else (let nd_uscrut2 = ((Base_dBytes.v_decTag fuel) bytes) in (match nd_uscrut2 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__420) -> (match dtb__420 with
  | { B_dData_dPair.f_Pair_first = dtb__421; B_dData_dPair.f_Pair_second = dtb__422 } -> (if (dtb__421 = 0) then (let nd_uscrut9 = ((Base_dBytes.v_decStr (fuel - 1)) dtb__422) in (match nd_uscrut9 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__423) -> (match dtb__423 with
  | { B_dData_dPair.f_Pair_first = dtb__424; B_dData_dPair.f_Pair_second = dtb__425 } -> (let nd_uscrut16 = ((v_decExpr (fuel - 1)) dtb__425) in (match nd_uscrut16 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__426) -> (match dtb__426 with
  | { B_dData_dPair.f_Pair_first = dtb__427; B_dData_dPair.f_Pair_second = dtb__428 } -> (let nd_uscrut23 = ((Base_dBytes.v_decInt (fuel - 1)) dtb__428) in (match nd_uscrut23 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__429) -> (match dtb__429 with
  | { B_dData_dPair.f_Pair_first = dtb__430; B_dData_dPair.f_Pair_second = dtb__431 } -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = { Frontend_dAst.f_Ctor_ctorName = dtb__424; Frontend_dAst.f_Ctor_ctorType = dtb__427; Frontend_dAst.f_Ctor_ctorArity = dtb__430; Frontend_dAst.f_Ctor_ctorSpan = v_noSpan }; B_dData_dPair.f_Pair_second = dtb__431 }))
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

# 616 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
let v_decField = (fun (fuel : int) (bytes : Base_dBytes.t_Cur) -> (if (fuel <= 0) then B_dData_dMaybe.C_Maybe_Nothing else (let nd_uscrut2 = ((Base_dBytes.v_decTag fuel) bytes) in (match nd_uscrut2 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__432) -> (match dtb__432 with
  | { B_dData_dPair.f_Pair_first = dtb__433; B_dData_dPair.f_Pair_second = dtb__434 } -> (if (dtb__433 = 0) then (let nd_uscrut9 = ((Base_dBytes.v_decStr (fuel - 1)) dtb__434) in (match nd_uscrut9 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__435) -> (match dtb__435 with
  | { B_dData_dPair.f_Pair_first = dtb__436; B_dData_dPair.f_Pair_second = dtb__437 } -> (let nd_uscrut16 = ((v_decExpr (fuel - 1)) dtb__437) in (match nd_uscrut16 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__438) -> (match dtb__438 with
  | { B_dData_dPair.f_Pair_first = dtb__439; B_dData_dPair.f_Pair_second = dtb__440 } -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = { Frontend_dAst.f_Field_fieldName = dtb__436; Frontend_dAst.f_Field_fieldType = dtb__439; Frontend_dAst.f_Field_fieldSpan = v_noSpan }; B_dData_dPair.f_Pair_second = dtb__440 }))
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

# 635 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
let v_decTraitParam = (fun (fuel : int) (bytes : Base_dBytes.t_Cur) -> (if (fuel <= 0) then B_dData_dMaybe.C_Maybe_Nothing else (let nd_uscrut2 = ((Base_dBytes.v_decTag fuel) bytes) in (match nd_uscrut2 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__441) -> (match dtb__441 with
  | { B_dData_dPair.f_Pair_first = dtb__442; B_dData_dPair.f_Pair_second = dtb__443 } -> (if (dtb__442 = 0) then (let nd_uscrut9 = ((Base_dBytes.v_decStr (fuel - 1)) dtb__443) in (match nd_uscrut9 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__444) -> (match dtb__444 with
  | { B_dData_dPair.f_Pair_first = dtb__445; B_dData_dPair.f_Pair_second = dtb__446 } -> (let nd_uscrut16 = (((Base_dBytes.v_decMaybe v_decExpr) (fuel - 1)) dtb__446) in (match nd_uscrut16 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__447) -> (match dtb__447 with
  | { B_dData_dPair.f_Pair_first = dtb__448; B_dData_dPair.f_Pair_second = dtb__449 } -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = { Frontend_dAst.f_TraitParam_traitParamName = dtb__445; Frontend_dAst.f_TraitParam_traitParamKind = dtb__448 }; B_dData_dPair.f_Pair_second = dtb__449 }))
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

# 654 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
let v_decTraitMethod = (fun (fuel : int) (bytes : Base_dBytes.t_Cur) -> (if (fuel <= 0) then B_dData_dMaybe.C_Maybe_Nothing else (let nd_uscrut2 = ((Base_dBytes.v_decTag fuel) bytes) in (match nd_uscrut2 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__450) -> (match dtb__450 with
  | { B_dData_dPair.f_Pair_first = dtb__451; B_dData_dPair.f_Pair_second = dtb__452 } -> (if (dtb__451 = 0) then (let nd_uscrut9 = ((Base_dBytes.v_decStr (fuel - 1)) dtb__452) in (match nd_uscrut9 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__453) -> (match dtb__453 with
  | { B_dData_dPair.f_Pair_first = dtb__454; B_dData_dPair.f_Pair_second = dtb__455 } -> (let nd_uscrut16 = ((v_decExpr (fuel - 1)) dtb__455) in (match nd_uscrut16 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__456) -> (match dtb__456 with
  | { B_dData_dPair.f_Pair_first = dtb__457; B_dData_dPair.f_Pair_second = dtb__458 } -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = { Frontend_dAst.f_TraitMethod_traitMethodName = dtb__454; Frontend_dAst.f_TraitMethod_traitMethodType = dtb__457; Frontend_dAst.f_TraitMethod_traitMethodSpan = v_noSpan }; B_dData_dPair.f_Pair_second = dtb__458 }))
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

# 673 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
let rec v_decDecl = (fun (fuel : int) (bytes : Base_dBytes.t_Cur) -> (if (fuel <= 0) then B_dData_dMaybe.C_Maybe_Nothing else (let nd_uscrut2 = ((Base_dBytes.v_decTag fuel) bytes) in (match nd_uscrut2 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__459) -> (match dtb__459 with
  | { B_dData_dPair.f_Pair_first = dtb__460; B_dData_dPair.f_Pair_second = dtb__461 } -> (if (dtb__460 = 0) then (let nd_uscrut9 = ((Base_dBytes.v_decStr (fuel - 1)) dtb__461) in (match nd_uscrut9 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__462) -> (match dtb__462 with
  | { B_dData_dPair.f_Pair_first = dtb__463; B_dData_dPair.f_Pair_second = dtb__464 } -> (let nd_uscrut16 = (((Base_dBytes.v_decList Base_dBytes.v_decStr) (fuel - 1)) dtb__464) in (match nd_uscrut16 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__465) -> (match dtb__465 with
  | { B_dData_dPair.f_Pair_first = dtb__466; B_dData_dPair.f_Pair_second = dtb__467 } -> (let nd_uscrut23 = ((v_decExpr (fuel - 1)) dtb__467) in (match nd_uscrut23 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__468) -> (match dtb__468 with
  | { B_dData_dPair.f_Pair_first = dtb__469; B_dData_dPair.f_Pair_second = dtb__470 } -> (let nd_uscrut30 = (((Base_dBytes.v_decList v_decCtor) (fuel - 1)) dtb__470) in (match nd_uscrut30 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__471) -> (match dtb__471 with
  | { B_dData_dPair.f_Pair_first = dtb__472; B_dData_dPair.f_Pair_second = dtb__473 } -> (let nd_uscrut37 = (((Base_dBytes.v_decList Base_dBytes.v_decStr) (fuel - 1)) dtb__473) in (match nd_uscrut37 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__474) -> (match dtb__474 with
  | { B_dData_dPair.f_Pair_first = dtb__475; B_dData_dPair.f_Pair_second = dtb__476 } -> (let nd_uscrut44 = ((Base_dBytes.v_decBool (fuel - 1)) dtb__476) in (match nd_uscrut44 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__477) -> (match dtb__477 with
  | { B_dData_dPair.f_Pair_first = dtb__478; B_dData_dPair.f_Pair_second = dtb__479 } -> (let nd_uscrut51 = ((v_decReprTier (fuel - 1)) dtb__479) in (match nd_uscrut51 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__480) -> (match dtb__480 with
  | { B_dData_dPair.f_Pair_first = dtb__481; B_dData_dPair.f_Pair_second = dtb__482 } -> (let nd_uscrut58 = ((Base_dBytes.v_decBool (fuel - 1)) dtb__482) in (match nd_uscrut58 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__483) -> (match dtb__483 with
  | { B_dData_dPair.f_Pair_first = dtb__484; B_dData_dPair.f_Pair_second = dtb__485 } -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Decl_DData (dtb__463, dtb__466, dtb__469, dtb__472, dtb__475, dtb__478, dtb__481, dtb__484, v_noSpan)); B_dData_dPair.f_Pair_second = dtb__485 }))
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
)) else (if (dtb__460 = 1) then (let nd_uscrut9 = ((Base_dBytes.v_decStr (fuel - 1)) dtb__461) in (match nd_uscrut9 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__486) -> (match dtb__486 with
  | { B_dData_dPair.f_Pair_first = dtb__487; B_dData_dPair.f_Pair_second = dtb__488 } -> (let nd_uscrut16 = ((v_decExpr (fuel - 1)) dtb__488) in (match nd_uscrut16 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__489) -> (match dtb__489 with
  | { B_dData_dPair.f_Pair_first = dtb__490; B_dData_dPair.f_Pair_second = dtb__491 } -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Decl_DAxiom (dtb__487, dtb__490, v_noSpan)); B_dData_dPair.f_Pair_second = dtb__491 }))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) else (if (dtb__460 = 2) then (let nd_uscrut9 = ((Base_dBytes.v_decStr (fuel - 1)) dtb__461) in (match nd_uscrut9 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__492) -> (match dtb__492 with
  | { B_dData_dPair.f_Pair_first = dtb__493; B_dData_dPair.f_Pair_second = dtb__494 } -> (let nd_uscrut16 = ((Base_dBytes.v_decStr (fuel - 1)) dtb__494) in (match nd_uscrut16 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__495) -> (match dtb__495 with
  | { B_dData_dPair.f_Pair_first = dtb__496; B_dData_dPair.f_Pair_second = dtb__497 } -> (let nd_uscrut23 = ((v_decExpr (fuel - 1)) dtb__497) in (match nd_uscrut23 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__498) -> (match dtb__498 with
  | { B_dData_dPair.f_Pair_first = dtb__499; B_dData_dPair.f_Pair_second = dtb__500 } -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Decl_DExtern (dtb__493, dtb__496, dtb__499, v_noSpan)); B_dData_dPair.f_Pair_second = dtb__500 }))
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
)) else (if (dtb__460 = 3) then (let nd_uscrut9 = ((Base_dBytes.v_decStr (fuel - 1)) dtb__461) in (match nd_uscrut9 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__501) -> (match dtb__501 with
  | { B_dData_dPair.f_Pair_first = dtb__502; B_dData_dPair.f_Pair_second = dtb__503 } -> (let nd_uscrut16 = ((v_decExprList (fuel - 1)) dtb__503) in (match nd_uscrut16 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__504) -> (match dtb__504 with
  | { B_dData_dPair.f_Pair_first = dtb__505; B_dData_dPair.f_Pair_second = dtb__506 } -> (let nd_uscrut23 = ((v_decExpr (fuel - 1)) dtb__506) in (match nd_uscrut23 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__507) -> (match dtb__507 with
  | { B_dData_dPair.f_Pair_first = dtb__508; B_dData_dPair.f_Pair_second = dtb__509 } -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Decl_DSig (dtb__502, dtb__505, dtb__508, v_noSpan)); B_dData_dPair.f_Pair_second = dtb__509 }))
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
)) else (if (dtb__460 = 4) then (let nd_uscrut9 = ((Base_dBytes.v_decStr (fuel - 1)) dtb__461) in (match nd_uscrut9 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__510) -> (match dtb__510 with
  | { B_dData_dPair.f_Pair_first = dtb__511; B_dData_dPair.f_Pair_second = dtb__512 } -> (let nd_uscrut16 = ((v_decPatList (fuel - 1)) dtb__512) in (match nd_uscrut16 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__513) -> (match dtb__513 with
  | { B_dData_dPair.f_Pair_first = dtb__514; B_dData_dPair.f_Pair_second = dtb__515 } -> (let nd_uscrut23 = ((v_decExpr (fuel - 1)) dtb__515) in (match nd_uscrut23 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__516) -> (match dtb__516 with
  | { B_dData_dPair.f_Pair_first = dtb__517; B_dData_dPair.f_Pair_second = dtb__518 } -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Decl_DFun (dtb__511, dtb__514, dtb__517, v_noSpan)); B_dData_dPair.f_Pair_second = dtb__518 }))
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
)) else (if (dtb__460 = 5) then (let nd_uscrut9 = ((Base_dBytes.v_decStr (fuel - 1)) dtb__461) in (match nd_uscrut9 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__519) -> (match dtb__519 with
  | { B_dData_dPair.f_Pair_first = dtb__520; B_dData_dPair.f_Pair_second = dtb__521 } -> (let nd_uscrut16 = (((Base_dBytes.v_decList Base_dBytes.v_decStr) (fuel - 1)) dtb__521) in (match nd_uscrut16 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__522) -> (match dtb__522 with
  | { B_dData_dPair.f_Pair_first = dtb__523; B_dData_dPair.f_Pair_second = dtb__524 } -> (let nd_uscrut23 = (((Base_dBytes.v_decList v_decField) (fuel - 1)) dtb__524) in (match nd_uscrut23 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__525) -> (match dtb__525 with
  | { B_dData_dPair.f_Pair_first = dtb__526; B_dData_dPair.f_Pair_second = dtb__527 } -> (let nd_uscrut30 = (((Base_dBytes.v_decList Base_dBytes.v_decStr) (fuel - 1)) dtb__527) in (match nd_uscrut30 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__528) -> (match dtb__528 with
  | { B_dData_dPair.f_Pair_first = dtb__529; B_dData_dPair.f_Pair_second = dtb__530 } -> (let nd_uscrut37 = ((Base_dBytes.v_decBool (fuel - 1)) dtb__530) in (match nd_uscrut37 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__531) -> (match dtb__531 with
  | { B_dData_dPair.f_Pair_first = dtb__532; B_dData_dPair.f_Pair_second = dtb__533 } -> (let nd_uscrut44 = ((v_decReprTier (fuel - 1)) dtb__533) in (match nd_uscrut44 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__534) -> (match dtb__534 with
  | { B_dData_dPair.f_Pair_first = dtb__535; B_dData_dPair.f_Pair_second = dtb__536 } -> (let nd_uscrut51 = ((Base_dBytes.v_decBool (fuel - 1)) dtb__536) in (match nd_uscrut51 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__537) -> (match dtb__537 with
  | { B_dData_dPair.f_Pair_first = dtb__538; B_dData_dPair.f_Pair_second = dtb__539 } -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Decl_DRecord (dtb__520, dtb__523, dtb__526, dtb__529, dtb__532, dtb__535, dtb__538, v_noSpan)); B_dData_dPair.f_Pair_second = dtb__539 }))
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
)) else (if (dtb__460 = 6) then (let nd_uscrut9 = ((Base_dBytes.v_decStr (fuel - 1)) dtb__461) in (match nd_uscrut9 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__540) -> (match dtb__540 with
  | { B_dData_dPair.f_Pair_first = dtb__541; B_dData_dPair.f_Pair_second = dtb__542 } -> (let nd_uscrut16 = (((Base_dBytes.v_decList v_decTraitParam) (fuel - 1)) dtb__542) in (match nd_uscrut16 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__543) -> (match dtb__543 with
  | { B_dData_dPair.f_Pair_first = dtb__544; B_dData_dPair.f_Pair_second = dtb__545 } -> (let nd_uscrut23 = ((v_decExprList (fuel - 1)) dtb__545) in (match nd_uscrut23 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__546) -> (match dtb__546 with
  | { B_dData_dPair.f_Pair_first = dtb__547; B_dData_dPair.f_Pair_second = dtb__548 } -> (let nd_uscrut30 = (((Base_dBytes.v_decList v_decTraitMethod) (fuel - 1)) dtb__548) in (match nd_uscrut30 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__549) -> (match dtb__549 with
  | { B_dData_dPair.f_Pair_first = dtb__550; B_dData_dPair.f_Pair_second = dtb__551 } -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Decl_DTrait (dtb__541, dtb__544, dtb__547, dtb__550, v_noSpan)); B_dData_dPair.f_Pair_second = dtb__551 }))
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
)) else (if (dtb__460 = 7) then (let nd_uscrut9 = ((v_decExprList (fuel - 1)) dtb__461) in (match nd_uscrut9 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__552) -> (match dtb__552 with
  | { B_dData_dPair.f_Pair_first = dtb__553; B_dData_dPair.f_Pair_second = dtb__554 } -> (let nd_uscrut16 = ((v_decExpr (fuel - 1)) dtb__554) in (match nd_uscrut16 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__555) -> (match dtb__555 with
  | { B_dData_dPair.f_Pair_first = dtb__556; B_dData_dPair.f_Pair_second = dtb__557 } -> (let nd_uscrut23 = ((v_decDecls (fuel - 1)) dtb__557) in (match nd_uscrut23 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__558) -> (match dtb__558 with
  | { B_dData_dPair.f_Pair_first = dtb__559; B_dData_dPair.f_Pair_second = dtb__560 } -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Decl_DInstance (dtb__553, dtb__556, dtb__559, v_noSpan)); B_dData_dPair.f_Pair_second = dtb__560 }))
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
# 914 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
and v_decDecls = (fun (fuel : int) (bytes : Base_dBytes.t_Cur) -> (if (fuel <= 0) then B_dData_dMaybe.C_Maybe_Nothing else (let nd_uscrut2 = ((v_decListHead fuel) bytes) in (match nd_uscrut2 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__561) -> (match dtb__561 with
  | { B_dData_dPair.f_Pair_first = dtb__562; B_dData_dPair.f_Pair_second = dtb__563 } -> ((((v_decDeclsItems (fuel - 1)) dtb__562) dtb__563) B_dData_dList.C_List_Nil)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))))
# 924 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
and v_decDeclsItems = (fun (fuel : int) (n : int) (bytes : Base_dBytes.t_Cur) (acc : Frontend_dAst.t_Decl B_dData_dList.t_List) -> (if (fuel <= 0) then B_dData_dMaybe.C_Maybe_Nothing else (if (n <= 0) then (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (B_dData_dList.v_reverse acc); B_dData_dPair.f_Pair_second = bytes })) else (let nd_uscrut4 = ((v_decDecl (fuel - 1)) bytes) in (match nd_uscrut4 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__564) -> (match dtb__564 with
  | { B_dData_dPair.f_Pair_first = dtb__565; B_dData_dPair.f_Pair_second = dtb__566 } -> ((((v_decDeclsItems (fuel - 1)) (n - 1)) dtb__566) (B_dData_dList.C_List__x58__x58_ (dtb__565, acc)))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)))))

# 936 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
let v_decPatComplete = (fun (s : string) -> (let nd_uscrut1 = ((v_decPat (bi_strLength s)) (Base_dBytes.v_curOf s)) in (match nd_uscrut1 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__567) -> (match dtb__567 with
  | { B_dData_dPair.f_Pair_first = dtb__568; B_dData_dPair.f_Pair_second = dtb__569 } -> (if (Base_dBytes.v_curAtEnd dtb__569) then (B_dData_dMaybe.C_Maybe_Just (dtb__568)) else B_dData_dMaybe.C_Maybe_Nothing)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)))

# 943 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
let v_decExprComplete = (fun (s : string) -> (let nd_uscrut1 = ((v_decExpr (bi_strLength s)) (Base_dBytes.v_curOf s)) in (match nd_uscrut1 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__570) -> (match dtb__570 with
  | { B_dData_dPair.f_Pair_first = dtb__571; B_dData_dPair.f_Pair_second = dtb__572 } -> (if (Base_dBytes.v_curAtEnd dtb__572) then (B_dData_dMaybe.C_Maybe_Just (dtb__571)) else B_dData_dMaybe.C_Maybe_Nothing)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)))

# 950 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
let v_decDeclComplete = (fun (s : string) -> (let nd_uscrut1 = ((v_decDecl (bi_strLength s)) (Base_dBytes.v_curOf s)) in (match nd_uscrut1 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__573) -> (match dtb__573 with
  | { B_dData_dPair.f_Pair_first = dtb__574; B_dData_dPair.f_Pair_second = dtb__575 } -> (if (Base_dBytes.v_curAtEnd dtb__575) then (B_dData_dMaybe.C_Maybe_Just (dtb__574)) else B_dData_dMaybe.C_Maybe_Nothing)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)))

# 957 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
let v_decQtyComplete = (fun (s : string) -> (let nd_uscrut1 = ((v_decQty (bi_strLength s)) (Base_dBytes.v_curOf s)) in (match nd_uscrut1 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__576) -> (match dtb__576 with
  | { B_dData_dPair.f_Pair_first = dtb__577; B_dData_dPair.f_Pair_second = dtb__578 } -> (if (Base_dBytes.v_curAtEnd dtb__578) then (B_dData_dMaybe.C_Maybe_Just (dtb__577)) else B_dData_dMaybe.C_Maybe_Nothing)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)))

# 964 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
let v_decReprTierComplete = (fun (s : string) -> (let nd_uscrut1 = ((v_decReprTier (bi_strLength s)) (Base_dBytes.v_curOf s)) in (match nd_uscrut1 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__579) -> (match dtb__579 with
  | { B_dData_dPair.f_Pair_first = dtb__580; B_dData_dPair.f_Pair_second = dtb__581 } -> (if (Base_dBytes.v_curAtEnd dtb__581) then (B_dData_dMaybe.C_Maybe_Just (dtb__580)) else B_dData_dMaybe.C_Maybe_Nothing)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)))

# 971 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
let v_decInterpPartComplete = (fun (s : string) -> (let nd_uscrut1 = ((v_decInterpPart (bi_strLength s)) (Base_dBytes.v_curOf s)) in (match nd_uscrut1 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__582) -> (match dtb__582 with
  | { B_dData_dPair.f_Pair_first = dtb__583; B_dData_dPair.f_Pair_second = dtb__584 } -> (if (Base_dBytes.v_curAtEnd dtb__584) then (B_dData_dMaybe.C_Maybe_Just (dtb__583)) else B_dData_dMaybe.C_Maybe_Nothing)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)))

# 978 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
let v_decDoStmtComplete = (fun (s : string) -> (let nd_uscrut1 = ((v_decDoStmt (bi_strLength s)) (Base_dBytes.v_curOf s)) in (match nd_uscrut1 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__585) -> (match dtb__585 with
  | { B_dData_dPair.f_Pair_first = dtb__586; B_dData_dPair.f_Pair_second = dtb__587 } -> (if (Base_dBytes.v_curAtEnd dtb__587) then (B_dData_dMaybe.C_Maybe_Just (dtb__586)) else B_dData_dMaybe.C_Maybe_Nothing)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)))

# 985 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
let v_decCtorComplete = (fun (s : string) -> (let nd_uscrut1 = ((v_decCtor (bi_strLength s)) (Base_dBytes.v_curOf s)) in (match nd_uscrut1 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__588) -> (match dtb__588 with
  | { B_dData_dPair.f_Pair_first = dtb__589; B_dData_dPair.f_Pair_second = dtb__590 } -> (if (Base_dBytes.v_curAtEnd dtb__590) then (B_dData_dMaybe.C_Maybe_Just (dtb__589)) else B_dData_dMaybe.C_Maybe_Nothing)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)))

# 992 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
let v_decFieldComplete = (fun (s : string) -> (let nd_uscrut1 = ((v_decField (bi_strLength s)) (Base_dBytes.v_curOf s)) in (match nd_uscrut1 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__591) -> (match dtb__591 with
  | { B_dData_dPair.f_Pair_first = dtb__592; B_dData_dPair.f_Pair_second = dtb__593 } -> (if (Base_dBytes.v_curAtEnd dtb__593) then (B_dData_dMaybe.C_Maybe_Just (dtb__592)) else B_dData_dMaybe.C_Maybe_Nothing)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)))

# 999 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
let v_decTraitParamComplete = (fun (s : string) -> (let nd_uscrut1 = ((v_decTraitParam (bi_strLength s)) (Base_dBytes.v_curOf s)) in (match nd_uscrut1 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__594) -> (match dtb__594 with
  | { B_dData_dPair.f_Pair_first = dtb__595; B_dData_dPair.f_Pair_second = dtb__596 } -> (if (Base_dBytes.v_curAtEnd dtb__596) then (B_dData_dMaybe.C_Maybe_Just (dtb__595)) else B_dData_dMaybe.C_Maybe_Nothing)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)))

# 1006 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
let v_decTraitMethodComplete = (fun (s : string) -> (let nd_uscrut1 = ((v_decTraitMethod (bi_strLength s)) (Base_dBytes.v_curOf s)) in (match nd_uscrut1 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__597) -> (match dtb__597 with
  | { B_dData_dPair.f_Pair_first = dtb__598; B_dData_dPair.f_Pair_second = dtb__599 } -> (if (Base_dBytes.v_curAtEnd dtb__599) then (B_dData_dMaybe.C_Maybe_Just (dtb__598)) else B_dData_dMaybe.C_Maybe_Nothing)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)))

# 1013 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
let v_decDeclsComplete = (fun (s : string) -> (let nd_uscrut1 = ((v_decDecls (bi_strLength s)) (Base_dBytes.v_curOf s)) in (match nd_uscrut1 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__600) -> (match dtb__600 with
  | { B_dData_dPair.f_Pair_first = dtb__601; B_dData_dPair.f_Pair_second = dtb__602 } -> (if (Base_dBytes.v_curAtEnd dtb__602) then (B_dData_dMaybe.C_Maybe_Just (dtb__601)) else B_dData_dMaybe.C_Maybe_Nothing)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)))

# 1027 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
let v_encExportItem = (fun (mc0 : Frontend_dAst.t_ExportItem) (mc1 : string B_dData_dList.t_List) -> (match mc0 with
  | Frontend_dAst.C_ExportItem_XNamespace (dtb__603, dtb__604, dtb__605) -> ((Base_dBytes.v_encTag 4) ((Base_dBytes.v_encStr dtb__603) (((Base_dBytes.v_encMaybe Base_dBytes.v_encStr) dtb__604) mc1)))
  | Frontend_dAst.C_ExportItem_XModule (dtb__606, dtb__607) -> ((Base_dBytes.v_encTag 2) ((Base_dBytes.v_encStr dtb__606) mc1))
  | Frontend_dAst.C_ExportItem_XTypeSome (dtb__608, dtb__609, dtb__610) -> ((Base_dBytes.v_encTag 3) ((Base_dBytes.v_encStr dtb__608) (((Base_dBytes.v_encList Base_dBytes.v_encStr) dtb__609) mc1)))
  | Frontend_dAst.C_ExportItem_XTypeAll (dtb__611, dtb__612) -> ((Base_dBytes.v_encTag 1) ((Base_dBytes.v_encStr dtb__611) mc1))
  | Frontend_dAst.C_ExportItem_XBare (dtb__613, dtb__614) -> ((Base_dBytes.v_encTag 0) ((Base_dBytes.v_encStr dtb__613) mc1))
  | _ -> failwith "DT: impossible branch"
))

# 1034 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
let v_encExportMembers = (fun (mc0 : Frontend_dAst.t_ExportMembers) (mc1 : string B_dData_dList.t_List) -> (match mc0 with
  | Frontend_dAst.C_ExportMembers_EMOnly (dtb__615) -> ((Base_dBytes.v_encTag 2) (((Base_dBytes.v_encList Base_dBytes.v_encStr) dtb__615) mc1))
  | Frontend_dAst.C_ExportMembers_EMAll -> ((Base_dBytes.v_encTag 1) mc1)
  | Frontend_dAst.C_ExportMembers_EMNone -> ((Base_dBytes.v_encTag 0) mc1)
  | _ -> failwith "DT: impossible branch"
))

# 1039 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
let v_encExportSpec = (fun (mc0 : Frontend_dAst.t_ExportSpec) (mc1 : string B_dData_dList.t_List) -> (match mc0 with
  | Frontend_dAst.C_ExportSpec_ESType (dtb__616, dtb__617, dtb__618) -> ((Base_dBytes.v_encTag 1) ((Base_dBytes.v_encStr dtb__616) ((v_encExportMembers dtb__617) mc1)))
  | Frontend_dAst.C_ExportSpec_ESValue (dtb__619, dtb__620) -> ((Base_dBytes.v_encTag 0) ((Base_dBytes.v_encStr dtb__619) mc1))
  | _ -> failwith "DT: impossible branch"
))

# 1043 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
let v_encOpacity = (fun (mc0 : Frontend_dAst.t_Opacity) (mc1 : string B_dData_dList.t_List) -> (match mc0 with
  | Frontend_dAst.C_Opacity_OpacityAbstract -> ((Base_dBytes.v_encTag 2) mc1)
  | Frontend_dAst.C_Opacity_OpacityTransparent -> ((Base_dBytes.v_encTag 1) mc1)
  | Frontend_dAst.C_Opacity_OpacityOpaque -> ((Base_dBytes.v_encTag 0) mc1)
  | _ -> failwith "DT: impossible branch"
))

# 1048 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
let v_encOpacitySpec = (fun (o : Frontend_dAst.t_OpacitySpec) (acc : string B_dData_dList.t_List) -> ((Base_dBytes.v_encStr (o).Frontend_dAst.f_OpacitySpec_opacityName) ((v_encOpacity (o).Frontend_dAst.f_OpacitySpec_opacityKind) acc)))

# 1052 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
let v_encModDecl = (fun (m : Frontend_dAst.t_ModDecl) (acc : string B_dData_dList.t_List) -> ((Base_dBytes.v_encStr (m).Frontend_dAst.f_ModDecl_modDeclName) ((Base_dBytes.v_encBool (m).Frontend_dAst.f_ModDecl_modDeclHasExportList) (((Base_dBytes.v_encList v_encExportItem) (m).Frontend_dAst.f_ModDecl_modDeclExportItems) (((Base_dBytes.v_encList v_encExportSpec) (m).Frontend_dAst.f_ModDecl_modDeclExports) (((Base_dBytes.v_encList v_encExportItem) (m).Frontend_dAst.f_ModDecl_modDeclReexports) (((Base_dBytes.v_encList v_encOpacitySpec) (m).Frontend_dAst.f_ModDecl_modDeclOpacity) acc)))))))

# 1069 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
let v_encImportLike = (fun (i : Frontend_dAst.t_Import) (acc : string B_dData_dList.t_List) -> ((Base_dBytes.v_encStr (i).Frontend_dAst.f_Import_importName) ((Base_dBytes.v_encBool (i).Frontend_dAst.f_Import_importIsQualified) (((Base_dBytes.v_encMaybe Base_dBytes.v_encStr) (i).Frontend_dAst.f_Import_importAlias) acc))))

# 1073 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
let v_encFixityLike = (fun (f : Frontend_dAst.t_FixityDecl) (acc : string B_dData_dList.t_List) -> ((Base_dBytes.v_encStr (f).Frontend_dAst.f_FixityDecl_fixityOp) ((Base_dBytes.v_encInt (f).Frontend_dAst.f_FixityDecl_fixityLevel) ((Base_dBytes.v_encInt (f).Frontend_dAst.f_FixityDecl_fixityAssoc) acc))))

# 1059 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
let v_encSourceFile = (fun (f : Frontend_dAst.t_SourceFile) (acc : string B_dData_dList.t_List) -> (((Base_dBytes.v_encMaybe v_encModDecl) (f).Frontend_dAst.f_SourceFile_sourceFileModDecl) (((Base_dBytes.v_encList v_encImportLike) (f).Frontend_dAst.f_SourceFile_sourceFileImports) (((Base_dBytes.v_encList v_encFixityLike) (f).Frontend_dAst.f_SourceFile_sourceFileFixities) (((Base_dBytes.v_encList v_encDecl) (f).Frontend_dAst.f_SourceFile_sourceFileDecls) (((Base_dBytes.v_encList v_encExportSpec) (f).Frontend_dAst.f_SourceFile_sourceFileExports) (((Base_dBytes.v_encList v_encExportItem) (f).Frontend_dAst.f_SourceFile_sourceFileReexports) (((Base_dBytes.v_encList v_encOpacitySpec) (f).Frontend_dAst.f_SourceFile_sourceFileOpacity) acc))))))))

# 1077 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
let v_decExportItem = (fun (fuel : int) (c : Base_dBytes.t_Cur) -> (if (fuel <= 0) then B_dData_dMaybe.C_Maybe_Nothing else ((Base_dBytes.v_thenPair ((Base_dBytes.v_decTag fuel) c)) (fun (tag : int) (b1 : Base_dBytes.t_Cur) -> (if (tag = 0) then ((Base_dBytes.v_thenPair ((Base_dBytes.v_decStr (fuel - 1)) b1)) (fun (n : string) (b2 : Base_dBytes.t_Cur) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_ExportItem_XBare (n, v_noSpan)); B_dData_dPair.f_Pair_second = b2 })))) else (if (tag = 1) then ((Base_dBytes.v_thenPair ((Base_dBytes.v_decStr (fuel - 1)) b1)) (fun (n : string) (b2 : Base_dBytes.t_Cur) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_ExportItem_XTypeAll (n, v_noSpan)); B_dData_dPair.f_Pair_second = b2 })))) else (if (tag = 3) then ((Base_dBytes.v_thenPair ((Base_dBytes.v_decStr (fuel - 1)) b1)) (fun (n : string) (b2 : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair (((Base_dBytes.v_decList Base_dBytes.v_decStr) (fuel - 1)) b2)) (fun (ms : string B_dData_dList.t_List) (b3 : Base_dBytes.t_Cur) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_ExportItem_XTypeSome (n, ms, v_noSpan)); B_dData_dPair.f_Pair_second = b3 })))))) else (if (tag = 2) then ((Base_dBytes.v_thenPair ((Base_dBytes.v_decStr (fuel - 1)) b1)) (fun (n : string) (b2 : Base_dBytes.t_Cur) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_ExportItem_XModule (n, v_noSpan)); B_dData_dPair.f_Pair_second = b2 })))) else (if (tag = 4) then ((Base_dBytes.v_thenPair ((Base_dBytes.v_decStr (fuel - 1)) b1)) (fun (n : string) (b2 : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair (((Base_dBytes.v_decMaybe Base_dBytes.v_decStr) (fuel - 1)) b2)) (fun (alias : string B_dData_dMaybe.t_Maybe) (b3 : Base_dBytes.t_Cur) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_ExportItem_XNamespace (n, alias, v_noSpan)); B_dData_dPair.f_Pair_second = b3 })))))) else B_dData_dMaybe.C_Maybe_Nothing)))))))))

# 1093 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
let v_decExportMembers = (fun (fuel : int) (c : Base_dBytes.t_Cur) -> (if (fuel <= 0) then B_dData_dMaybe.C_Maybe_Nothing else ((Base_dBytes.v_thenPair ((Base_dBytes.v_decTag fuel) c)) (fun (tag : int) (b1 : Base_dBytes.t_Cur) -> (if (tag = 0) then (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = Frontend_dAst.C_ExportMembers_EMNone; B_dData_dPair.f_Pair_second = b1 })) else (if (tag = 1) then (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = Frontend_dAst.C_ExportMembers_EMAll; B_dData_dPair.f_Pair_second = b1 })) else (if (tag = 2) then ((Base_dBytes.v_thenPair (((Base_dBytes.v_decList Base_dBytes.v_decStr) (fuel - 1)) b1)) (fun (ms : string B_dData_dList.t_List) (b2 : Base_dBytes.t_Cur) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_ExportMembers_EMOnly (ms)); B_dData_dPair.f_Pair_second = b2 })))) else B_dData_dMaybe.C_Maybe_Nothing)))))))

# 1107 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
let v_decExportSpec = (fun (fuel : int) (c : Base_dBytes.t_Cur) -> (if (fuel <= 0) then B_dData_dMaybe.C_Maybe_Nothing else ((Base_dBytes.v_thenPair ((Base_dBytes.v_decTag fuel) c)) (fun (tag : int) (b1 : Base_dBytes.t_Cur) -> (if (tag = 0) then ((Base_dBytes.v_thenPair ((Base_dBytes.v_decStr (fuel - 1)) b1)) (fun (n : string) (b2 : Base_dBytes.t_Cur) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_ExportSpec_ESValue (n, v_noSpan)); B_dData_dPair.f_Pair_second = b2 })))) else (if (tag = 1) then ((Base_dBytes.v_thenPair ((Base_dBytes.v_decStr (fuel - 1)) b1)) (fun (n : string) (b2 : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair ((v_decExportMembers (fuel - 1)) b2)) (fun (ms : Frontend_dAst.t_ExportMembers) (b3 : Base_dBytes.t_Cur) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_ExportSpec_ESType (n, ms, v_noSpan)); B_dData_dPair.f_Pair_second = b3 })))))) else B_dData_dMaybe.C_Maybe_Nothing))))))

# 1120 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
let v_decOpacity = (fun (fuel : int) (c : Base_dBytes.t_Cur) -> (if (fuel <= 0) then B_dData_dMaybe.C_Maybe_Nothing else ((Base_dBytes.v_thenPair ((Base_dBytes.v_decTag fuel) c)) (fun (tag : int) (b1 : Base_dBytes.t_Cur) -> (if (tag = 0) then (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = Frontend_dAst.C_Opacity_OpacityOpaque; B_dData_dPair.f_Pair_second = b1 })) else (if (tag = 1) then (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = Frontend_dAst.C_Opacity_OpacityTransparent; B_dData_dPair.f_Pair_second = b1 })) else (if (tag = 2) then (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = Frontend_dAst.C_Opacity_OpacityAbstract; B_dData_dPair.f_Pair_second = b1 })) else B_dData_dMaybe.C_Maybe_Nothing)))))))

# 1134 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
let v_decOpacitySpec = (fun (fuel : int) (c : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair ((Base_dBytes.v_decStr (fuel - 1)) c)) (fun (name : string) (b1 : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair ((v_decOpacity (fuel - 1)) b1)) (fun (kind : Frontend_dAst.t_Opacity) (b2 : Base_dBytes.t_Cur) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = { Frontend_dAst.f_OpacitySpec_opacityName = name; Frontend_dAst.f_OpacitySpec_opacityKind = kind; Frontend_dAst.f_OpacitySpec_opacitySpan = v_noSpan }; B_dData_dPair.f_Pair_second = b2 })))))))

# 1141 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
let v_decModDecl = (fun (fuel : int) (c : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair ((Base_dBytes.v_decStr (fuel - 1)) c)) (fun (name : string) (b1 : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair ((Base_dBytes.v_decBool (fuel - 1)) b1)) (fun (hasList : bool) (b2 : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair (((Base_dBytes.v_decList v_decExportItem) (fuel - 1)) b2)) (fun (items : Frontend_dAst.t_ExportItem B_dData_dList.t_List) (b3 : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair (((Base_dBytes.v_decList v_decExportSpec) (fuel - 1)) b3)) (fun (exports : Frontend_dAst.t_ExportSpec B_dData_dList.t_List) (b4 : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair (((Base_dBytes.v_decList v_decExportItem) (fuel - 1)) b4)) (fun (reexports : Frontend_dAst.t_ExportItem B_dData_dList.t_List) (b5 : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair (((Base_dBytes.v_decList v_decOpacitySpec) (fuel - 1)) b5)) (fun (opacity : Frontend_dAst.t_OpacitySpec B_dData_dList.t_List) (b6 : Base_dBytes.t_Cur) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = { Frontend_dAst.f_ModDecl_modDeclName = name; Frontend_dAst.f_ModDecl_modDeclHasExportList = hasList; Frontend_dAst.f_ModDecl_modDeclExportItems = items; Frontend_dAst.f_ModDecl_modDeclExports = exports; Frontend_dAst.f_ModDecl_modDeclReexports = reexports; Frontend_dAst.f_ModDecl_modDeclOpacity = opacity; Frontend_dAst.f_ModDecl_modDeclSpan = v_noSpan }; B_dData_dPair.f_Pair_second = b6 })))))))))))))))

# 1147 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
let v_decImportLike = (fun (fuel : int) (c : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair ((Base_dBytes.v_decStr (fuel - 1)) c)) (fun (name : string) (b1 : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair ((Base_dBytes.v_decBool (fuel - 1)) b1)) (fun (qual : bool) (b2 : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair (((Base_dBytes.v_decMaybe Base_dBytes.v_decStr) (fuel - 1)) b2)) (fun (alias : string B_dData_dMaybe.t_Maybe) (b3 : Base_dBytes.t_Cur) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = { Frontend_dAst.f_Import_importName = name; Frontend_dAst.f_Import_importIsQualified = qual; Frontend_dAst.f_Import_importAlias = alias; Frontend_dAst.f_Import_importSpan = v_noSpan }; B_dData_dPair.f_Pair_second = b3 })))))))))

# 1153 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
let v_decFixityLike = (fun (fuel : int) (c : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair ((Base_dBytes.v_decStr (fuel - 1)) c)) (fun (op : string) (b1 : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair ((Base_dBytes.v_decInt (fuel - 1)) b1)) (fun (level : int) (b2 : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair ((Base_dBytes.v_decInt (fuel - 1)) b2)) (fun (assoc : int) (b3 : Base_dBytes.t_Cur) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = { Frontend_dAst.f_FixityDecl_fixityOp = op; Frontend_dAst.f_FixityDecl_fixityLevel = level; Frontend_dAst.f_FixityDecl_fixityAssoc = assoc; Frontend_dAst.f_FixityDecl_fixitySpan = v_noSpan }; B_dData_dPair.f_Pair_second = b3 })))))))))

# 1166 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
let v_decSourceFileGo = (fun (fuel : int) (c : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair (((Base_dBytes.v_decMaybe v_decModDecl) (fuel - 1)) c)) (fun (modDecl : Frontend_dAst.t_ModDecl B_dData_dMaybe.t_Maybe) (b1 : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair (((Base_dBytes.v_decList v_decImportLike) (fuel - 1)) b1)) (fun (imports : Frontend_dAst.t_Import B_dData_dList.t_List) (b2 : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair (((Base_dBytes.v_decList v_decFixityLike) (fuel - 1)) b2)) (fun (fixities : Frontend_dAst.t_FixityDecl B_dData_dList.t_List) (b3 : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair (((Base_dBytes.v_decList v_decDecl) (fuel - 1)) b3)) (fun (decls : Frontend_dAst.t_Decl B_dData_dList.t_List) (b4 : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair (((Base_dBytes.v_decList v_decExportSpec) (fuel - 1)) b4)) (fun (exports : Frontend_dAst.t_ExportSpec B_dData_dList.t_List) (b5 : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair (((Base_dBytes.v_decList v_decExportItem) (fuel - 1)) b5)) (fun (reexports : Frontend_dAst.t_ExportItem B_dData_dList.t_List) (b6 : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair (((Base_dBytes.v_decList v_decOpacitySpec) (fuel - 1)) b6)) (fun (opacity : Frontend_dAst.t_OpacitySpec B_dData_dList.t_List) (b7 : Base_dBytes.t_Cur) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = { Frontend_dAst.f_SourceFile_sourceFileModDecl = modDecl; Frontend_dAst.f_SourceFile_sourceFileImports = imports; Frontend_dAst.f_SourceFile_sourceFileFixities = fixities; Frontend_dAst.f_SourceFile_sourceFileDecls = decls; Frontend_dAst.f_SourceFile_sourceFileExports = exports; Frontend_dAst.f_SourceFile_sourceFileReexports = reexports; Frontend_dAst.f_SourceFile_sourceFileOpacity = opacity }; B_dData_dPair.f_Pair_second = b7 })))))))))))))))))

# 1160 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
let v_decSourceFileComplete = (fun (s : string) -> (let nd_uscrut1 = ((v_decSourceFileGo (bi_strLength s)) (Base_dBytes.v_curOf s)) in (match nd_uscrut1 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__621) -> (match dtb__621 with
  | { B_dData_dPair.f_Pair_first = dtb__622; B_dData_dPair.f_Pair_second = dtb__623 } -> (if (Base_dBytes.v_curAtEnd dtb__623) then (B_dData_dMaybe.C_Maybe_Just (dtb__622)) else B_dData_dMaybe.C_Maybe_Nothing)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)))
