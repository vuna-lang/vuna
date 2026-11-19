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
  | Frontend_dAst.C_DoStmt_DExpr (dtb__45, dtb__46) -> ((Base_dBytes.v_encTag 1) ((v_encExpr dtb__45) mc1))
  | Frontend_dAst.C_DoStmt_DBind (dtb__47, dtb__48, dtb__49) -> ((Base_dBytes.v_encTag 0) ((v_encPat dtb__47) ((v_encExpr dtb__48) mc1)))
  | _ -> failwith "DT: impossible branch"
))
# 225 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
and v_encExpr = (fun (mc0 : Frontend_dAst.t_Expr) (mc1 : string B_dData_dList.t_List) -> (match mc0 with
  | Frontend_dAst.C_Expr_EFloat (dtb__50, dtb__51) -> ((Base_dBytes.v_encTag 22) ((Base_dBytes.v_encStr dtb__50) mc1))
  | Frontend_dAst.C_Expr_EInterp (dtb__52, dtb__53, dtb__54) -> ((Base_dBytes.v_encTag 21) ((Base_dBytes.v_encBool dtb__52) ((v_encPartList dtb__53) mc1)))
  | Frontend_dAst.C_Expr_EAnn (dtb__55, dtb__56, dtb__57) -> ((Base_dBytes.v_encTag 20) ((v_encExpr dtb__55) ((v_encExpr dtb__56) mc1)))
  | Frontend_dAst.C_Expr_ESectR (dtb__58, dtb__59, dtb__60) -> ((Base_dBytes.v_encTag 19) ((v_encExpr dtb__58) ((Base_dBytes.v_encStr dtb__59) mc1)))
  | Frontend_dAst.C_Expr_ESectL (dtb__61, dtb__62, dtb__63) -> ((Base_dBytes.v_encTag 18) ((Base_dBytes.v_encStr dtb__61) ((v_encExpr dtb__62) mc1)))
  | Frontend_dAst.C_Expr_ESectOp (dtb__64, dtb__65) -> ((Base_dBytes.v_encTag 17) ((Base_dBytes.v_encStr dtb__64) mc1))
  | Frontend_dAst.C_Expr_EBacktick (dtb__66, dtb__67, dtb__68, dtb__69) -> ((Base_dBytes.v_encTag 16) ((Base_dBytes.v_encStr dtb__66) ((v_encExpr dtb__67) ((v_encExpr dtb__68) mc1))))
  | Frontend_dAst.C_Expr_EParen (dtb__70, dtb__71) -> ((Base_dBytes.v_encTag 15) ((v_encExpr dtb__70) mc1))
  | Frontend_dAst.C_Expr_EInfix (dtb__72, dtb__73, dtb__74, dtb__75) -> ((Base_dBytes.v_encTag 14) ((Base_dBytes.v_encStr dtb__72) ((v_encExpr dtb__73) ((v_encExpr dtb__74) mc1))))
  | Frontend_dAst.C_Expr_EDo (dtb__76, dtb__77) -> ((Base_dBytes.v_encTag 13) ((v_encStmtList dtb__76) mc1))
  | Frontend_dAst.C_Expr_ERecUpdate (dtb__78, dtb__79, dtb__80) -> ((Base_dBytes.v_encTag 12) ((v_encExpr dtb__78) ((v_encStrExprList dtb__79) mc1)))
  | Frontend_dAst.C_Expr_ERecord (dtb__81, dtb__82, dtb__83) -> ((Base_dBytes.v_encTag 11) ((Base_dBytes.v_encStr dtb__81) ((v_encStrExprList dtb__82) mc1)))
  | Frontend_dAst.C_Expr_EField (dtb__84, dtb__85, dtb__86) -> ((Base_dBytes.v_encTag 10) ((v_encExpr dtb__84) ((Base_dBytes.v_encStr dtb__85) mc1)))
  | Frontend_dAst.C_Expr_EIf (dtb__87, dtb__88, dtb__89, dtb__90) -> ((Base_dBytes.v_encTag 9) ((v_encExpr dtb__87) ((v_encExpr dtb__88) ((v_encExpr dtb__89) mc1))))
  | Frontend_dAst.C_Expr_ECase (dtb__91, dtb__92, dtb__93) -> ((Base_dBytes.v_encTag 8) ((v_encExpr dtb__91) ((v_encPatExprList dtb__92) mc1)))
  | Frontend_dAst.C_Expr_ELocalFun (dtb__94, dtb__95) -> ((Base_dBytes.v_encTag 7) ((v_encClauses dtb__94) mc1))
  | Frontend_dAst.C_Expr_ELet (dtb__96, dtb__97, dtb__98, dtb__99) -> ((Base_dBytes.v_encTag 6) ((v_encPatExprList dtb__96) ((v_encExpr dtb__97) ((Base_dBytes.v_encBool dtb__98) mc1))))
  | Frontend_dAst.C_Expr_EPi (dtb__100, dtb__101, dtb__102, dtb__103, dtb__104, dtb__105) -> ((Base_dBytes.v_encTag 5) ((Base_dBytes.v_encStr dtb__100) ((Base_dBytes.v_encBool dtb__101) ((v_encMaybeQty dtb__102) ((v_encExpr dtb__103) ((v_encExpr dtb__104) mc1))))))
  | Frontend_dAst.C_Expr_EApp (dtb__106, dtb__107, dtb__108) -> ((Base_dBytes.v_encTag 4) ((v_encExpr dtb__106) ((v_encExprList dtb__107) mc1)))
  | Frontend_dAst.C_Expr_ELam (dtb__109, dtb__110, dtb__111) -> ((Base_dBytes.v_encTag 3) ((v_encStrList ((B_dData_dList.v_map B_dData_dPair.v_firstOf) dtb__109)) ((v_encExpr dtb__110) mc1)))
  | Frontend_dAst.C_Expr_EStr (dtb__112, dtb__113) -> ((Base_dBytes.v_encTag 2) ((Base_dBytes.v_encStr dtb__112) mc1))
  | Frontend_dAst.C_Expr_EInt (dtb__114, dtb__115) -> ((Base_dBytes.v_encTag 1) ((Base_dBytes.v_encInt dtb__114) mc1))
  | Frontend_dAst.C_Expr_EVar (dtb__116, dtb__117) -> ((Base_dBytes.v_encTag 0) ((Base_dBytes.v_encStr dtb__116) mc1))
  | _ -> failwith "DT: impossible branch"
))

# 69 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
let v_encMaybeExpr = (fun (mc0 : Frontend_dAst.t_Expr B_dData_dMaybe.t_Maybe) (mc1 : string B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__118) -> (B_dData_dList.C_List__x58__x58_ ("1", ((v_encExpr dtb__118) mc1)))
  | B_dData_dMaybe.C_Maybe_Nothing -> (B_dData_dList.C_List__x58__x58_ ("0", mc1))
  | _ -> failwith "DT: impossible branch"
))

# 253 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
let v_encCtor = (fun (mc0 : Frontend_dAst.t_Ctor) (mc1 : string B_dData_dList.t_List) -> (match mc0 with
  | { Frontend_dAst.f_Ctor_ctorName = dtb__119; Frontend_dAst.f_Ctor_ctorType = dtb__120; Frontend_dAst.f_Ctor_ctorArity = dtb__121; Frontend_dAst.f_Ctor_ctorSpan = dtb__122 } -> ((Base_dBytes.v_encTag 0) ((Base_dBytes.v_encStr dtb__119) ((v_encExpr dtb__120) ((Base_dBytes.v_encInt dtb__121) mc1))))
  | _ -> failwith "DT: impossible branch"
))

# 164 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
let rec v_encCtorListGo = (fun (mc0 : Frontend_dAst.t_Ctor B_dData_dList.t_List) (mc1 : string B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__123, dtb__124) -> ((v_encCtor dtb__123) ((v_encCtorListGo dtb__124) mc1))
  | B_dData_dList.C_List_Nil -> mc1
  | _ -> failwith "DT: impossible branch"
))

# 160 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
let v_encCtorList = (fun (xs : Frontend_dAst.t_Ctor B_dData_dList.t_List) (acc : string B_dData_dList.t_List) -> (B_dData_dList.C_List__x58__x58_ ((String.concat "" ["["; (bi_strFromInt (Base_dBytes.v_lenOf xs)); ":"]), ((v_encCtorListGo xs) acc))))

# 257 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
let v_encField = (fun (mc0 : Frontend_dAst.t_Field) (mc1 : string B_dData_dList.t_List) -> (match mc0 with
  | { Frontend_dAst.f_Field_fieldName = dtb__125; Frontend_dAst.f_Field_fieldType = dtb__126; Frontend_dAst.f_Field_fieldSpan = dtb__127 } -> ((Base_dBytes.v_encTag 0) ((Base_dBytes.v_encStr dtb__125) ((v_encExpr dtb__126) mc1)))
  | _ -> failwith "DT: impossible branch"
))

# 173 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
let rec v_encFieldListGo = (fun (mc0 : Frontend_dAst.t_Field B_dData_dList.t_List) (mc1 : string B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__128, dtb__129) -> ((v_encField dtb__128) ((v_encFieldListGo dtb__129) mc1))
  | B_dData_dList.C_List_Nil -> mc1
  | _ -> failwith "DT: impossible branch"
))

# 169 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
let v_encFieldList = (fun (xs : Frontend_dAst.t_Field B_dData_dList.t_List) (acc : string B_dData_dList.t_List) -> (B_dData_dList.C_List__x58__x58_ ((String.concat "" ["["; (bi_strFromInt (Base_dBytes.v_lenOf xs)); ":"]), ((v_encFieldListGo xs) acc))))

# 261 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
let v_encTraitParam = (fun (mc0 : Frontend_dAst.t_TraitParam) (mc1 : string B_dData_dList.t_List) -> (match mc0 with
  | { Frontend_dAst.f_TraitParam_traitParamName = dtb__130; Frontend_dAst.f_TraitParam_traitParamKind = dtb__131 } -> ((Base_dBytes.v_encTag 0) ((Base_dBytes.v_encStr dtb__130) ((v_encMaybeExpr dtb__131) mc1)))
  | _ -> failwith "DT: impossible branch"
))

# 182 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
let rec v_encTraitParamListGo = (fun (mc0 : Frontend_dAst.t_TraitParam B_dData_dList.t_List) (mc1 : string B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__132, dtb__133) -> ((v_encTraitParam dtb__132) ((v_encTraitParamListGo dtb__133) mc1))
  | B_dData_dList.C_List_Nil -> mc1
  | _ -> failwith "DT: impossible branch"
))

# 178 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
let v_encTraitParamList = (fun (xs : Frontend_dAst.t_TraitParam B_dData_dList.t_List) (acc : string B_dData_dList.t_List) -> (B_dData_dList.C_List__x58__x58_ ((String.concat "" ["["; (bi_strFromInt (Base_dBytes.v_lenOf xs)); ":"]), ((v_encTraitParamListGo xs) acc))))

# 265 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
let v_encTraitMethod = (fun (mc0 : Frontend_dAst.t_TraitMethod) (mc1 : string B_dData_dList.t_List) -> (match mc0 with
  | { Frontend_dAst.f_TraitMethod_traitMethodName = dtb__134; Frontend_dAst.f_TraitMethod_traitMethodType = dtb__135; Frontend_dAst.f_TraitMethod_traitMethodSpan = dtb__136 } -> ((Base_dBytes.v_encTag 0) ((Base_dBytes.v_encStr dtb__134) ((v_encExpr dtb__135) mc1)))
  | _ -> failwith "DT: impossible branch"
))

# 191 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
let rec v_encTraitMethodListGo = (fun (mc0 : Frontend_dAst.t_TraitMethod B_dData_dList.t_List) (mc1 : string B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__137, dtb__138) -> ((v_encTraitMethod dtb__137) ((v_encTraitMethodListGo dtb__138) mc1))
  | B_dData_dList.C_List_Nil -> mc1
  | _ -> failwith "DT: impossible branch"
))

# 187 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
let v_encTraitMethodList = (fun (xs : Frontend_dAst.t_TraitMethod B_dData_dList.t_List) (acc : string B_dData_dList.t_List) -> (B_dData_dList.C_List__x58__x58_ ((String.concat "" ["["; (bi_strFromInt (Base_dBytes.v_lenOf xs)); ":"]), ((v_encTraitMethodListGo xs) acc))))

# 196 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
let rec v_encDecls = (fun (xs : Frontend_dAst.t_Decl B_dData_dList.t_List) (acc : string B_dData_dList.t_List) -> (B_dData_dList.C_List__x58__x58_ ((String.concat "" ["["; (bi_strFromInt (Base_dBytes.v_lenOf xs)); ":"]), ((v_encDeclsGo xs) acc))))
# 200 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
and v_encDeclsGo = (fun (mc0 : Frontend_dAst.t_Decl B_dData_dList.t_List) (mc1 : string B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__139, dtb__140) -> ((v_encDecl dtb__139) ((v_encDeclsGo dtb__140) mc1))
  | B_dData_dList.C_List_Nil -> mc1
  | _ -> failwith "DT: impossible branch"
))
# 269 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
and v_encDecl = (fun (mc0 : Frontend_dAst.t_Decl) (mc1 : string B_dData_dList.t_List) -> (match mc0 with
  | Frontend_dAst.C_Decl_DInstance (dtb__141, dtb__142, dtb__143, dtb__144) -> ((Base_dBytes.v_encTag 7) ((v_encExprList dtb__141) ((v_encExpr dtb__142) ((v_encDecls dtb__143) mc1))))
  | Frontend_dAst.C_Decl_DTrait (dtb__145, dtb__146, dtb__147, dtb__148, dtb__149) -> ((Base_dBytes.v_encTag 6) ((Base_dBytes.v_encStr dtb__145) ((v_encTraitParamList dtb__146) ((v_encExprList dtb__147) ((v_encTraitMethodList dtb__148) mc1)))))
  | Frontend_dAst.C_Decl_DRecord (dtb__150, dtb__151, dtb__152, dtb__153, dtb__154, dtb__155, dtb__156, dtb__157) -> ((Base_dBytes.v_encTag 5) ((Base_dBytes.v_encStr dtb__150) ((v_encStrList dtb__151) ((v_encFieldList dtb__152) ((v_encStrList dtb__153) ((Base_dBytes.v_encBool dtb__154) ((v_encReprTier dtb__155) ((Base_dBytes.v_encBool dtb__156) mc1))))))))
  | Frontend_dAst.C_Decl_DFun (dtb__158, dtb__159, dtb__160, dtb__161) -> ((Base_dBytes.v_encTag 4) ((Base_dBytes.v_encStr dtb__158) ((v_encPatList dtb__159) ((v_encExpr dtb__160) mc1))))
  | Frontend_dAst.C_Decl_DSig (dtb__162, dtb__163, dtb__164, dtb__165) -> ((Base_dBytes.v_encTag 3) ((Base_dBytes.v_encStr dtb__162) ((v_encExprList dtb__163) ((v_encExpr dtb__164) mc1))))
  | Frontend_dAst.C_Decl_DExtern (dtb__166, dtb__167, dtb__168, dtb__169) -> ((Base_dBytes.v_encTag 2) ((Base_dBytes.v_encStr dtb__166) ((Base_dBytes.v_encStr dtb__167) ((v_encExpr dtb__168) mc1))))
  | Frontend_dAst.C_Decl_DAxiom (dtb__170, dtb__171, dtb__172) -> ((Base_dBytes.v_encTag 1) ((Base_dBytes.v_encStr dtb__170) ((v_encExpr dtb__171) mc1)))
  | Frontend_dAst.C_Decl_DData (dtb__173, dtb__174, dtb__175, dtb__176, dtb__177, dtb__178, dtb__179, dtb__180, dtb__181) -> ((Base_dBytes.v_encTag 0) ((Base_dBytes.v_encStr dtb__173) ((v_encStrList dtb__174) ((v_encExpr dtb__175) ((v_encCtorList dtb__176) ((v_encStrList dtb__177) ((Base_dBytes.v_encBool dtb__178) ((v_encReprTier dtb__179) ((Base_dBytes.v_encBool dtb__180) mc1)))))))))
  | _ -> failwith "DT: impossible branch"
))

# 293 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
let v_decQty = (fun (fuel : int) (bytes : Base_dBytes.t_Cur) -> (if (fuel <= 0) then B_dData_dMaybe.C_Maybe_Nothing else ((fun nd_uscrut2 -> (match nd_uscrut2 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__182) -> (match dtb__182 with
  | { B_dData_dPair.f_Pair_first = dtb__183; B_dData_dPair.f_Pair_second = dtb__184 } -> (if (dtb__183 = 0) then (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = Frontend_dAst.C_Qty_Q0; B_dData_dPair.f_Pair_second = dtb__184 })) else (if (dtb__183 = 1) then (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = Frontend_dAst.C_Qty_Q1; B_dData_dPair.f_Pair_second = dtb__184 })) else B_dData_dMaybe.C_Maybe_Nothing))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((Base_dBytes.v_decTag fuel) bytes))))

# 307 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
let v_decReprTier = (fun (fuel : int) (bytes : Base_dBytes.t_Cur) -> (if (fuel <= 0) then B_dData_dMaybe.C_Maybe_Nothing else ((fun nd_uscrut2 -> (match nd_uscrut2 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__185) -> (match dtb__185 with
  | { B_dData_dPair.f_Pair_first = dtb__186; B_dData_dPair.f_Pair_second = dtb__187 } -> (if (dtb__186 = 0) then (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = Frontend_dAst.C_ReprTier_ReprAuto; B_dData_dPair.f_Pair_second = dtb__187 })) else (if (dtb__186 = 1) then (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = Frontend_dAst.C_ReprTier_ReprAlias; B_dData_dPair.f_Pair_second = dtb__187 })) else (if (dtb__186 = 2) then (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = Frontend_dAst.C_ReprTier_ReprBoxed; B_dData_dPair.f_Pair_second = dtb__187 })) else B_dData_dMaybe.C_Maybe_Nothing)))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((Base_dBytes.v_decTag fuel) bytes))))

# 322 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
let v_decMaybeQty = (fun (fuel : int) (bytes : Base_dBytes.t_Cur) -> (((Base_dBytes.v_decMaybe v_decQty) fuel) bytes))

# 850 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
let rec v_decListDigits = (fun (fuel : int) (acc : int) (c : Base_dBytes.t_Cur) -> (if (fuel <= 0) then B_dData_dMaybe.C_Maybe_Nothing else (match (Base_dBytes.v_curChar c) with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb__188) -> (if (dtb__188 = 58) then (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = acc; B_dData_dPair.f_Pair_second = (Base_dBytes.v_curSkip c) })) else (if (if (dtb__188 >= 48) then (dtb__188 <= 57) else false) then (((v_decListDigits (fuel - 1)) ((acc * 10) + (dtb__188 - 48))) (Base_dBytes.v_curSkip c)) else B_dData_dMaybe.C_Maybe_Nothing))
  | _ -> failwith "DT: impossible branch"
)))

# 840 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
let v_decListHead = (fun (fuel : int) (c : Base_dBytes.t_Cur) -> (if (fuel <= 0) then B_dData_dMaybe.C_Maybe_Nothing else ((fun nd_uscrut2 -> (match nd_uscrut2 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__189) -> (if (dtb__189 = 91) then (((v_decListDigits (fuel - 1)) 0) (Base_dBytes.v_curSkip c)) else B_dData_dMaybe.C_Maybe_Nothing)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)) (Base_dBytes.v_curChar c))))

# 350 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
let rec v_decPat = (fun (fuel : int) (bytes : Base_dBytes.t_Cur) -> (if (fuel <= 0) then B_dData_dMaybe.C_Maybe_Nothing else ((fun nd_uscrut2 -> (match nd_uscrut2 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__190) -> (match dtb__190 with
  | { B_dData_dPair.f_Pair_first = dtb__191; B_dData_dPair.f_Pair_second = dtb__192 } -> (if (dtb__191 = 0) then ((fun nd_uscrut9 -> (match nd_uscrut9 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__193) -> (match dtb__193 with
  | { B_dData_dPair.f_Pair_first = dtb__194; B_dData_dPair.f_Pair_second = dtb__195 } -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Pat_PVar (dtb__194, v_noSpan)); B_dData_dPair.f_Pair_second = dtb__195 }))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((Base_dBytes.v_decStr (fuel - 1)) dtb__192)) else (if (dtb__191 = 1) then ((fun nd_uscrut9 -> (match nd_uscrut9 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__196) -> (match dtb__196 with
  | { B_dData_dPair.f_Pair_first = dtb__197; B_dData_dPair.f_Pair_second = dtb__198 } -> ((fun nd_uscrut16 -> (match nd_uscrut16 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__199) -> (match dtb__199 with
  | { B_dData_dPair.f_Pair_first = dtb__200; B_dData_dPair.f_Pair_second = dtb__201 } -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Pat_PAs (dtb__197, dtb__200, v_noSpan)); B_dData_dPair.f_Pair_second = dtb__201 }))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((v_decPat (fuel - 1)) dtb__198))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((Base_dBytes.v_decStr (fuel - 1)) dtb__192)) else (if (dtb__191 = 2) then (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Pat_PWild (v_noSpan)); B_dData_dPair.f_Pair_second = dtb__192 })) else (if (dtb__191 = 3) then ((fun nd_uscrut9 -> (match nd_uscrut9 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__202) -> (match dtb__202 with
  | { B_dData_dPair.f_Pair_first = dtb__203; B_dData_dPair.f_Pair_second = dtb__204 } -> ((fun nd_uscrut16 -> (match nd_uscrut16 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__205) -> (match dtb__205 with
  | { B_dData_dPair.f_Pair_first = dtb__206; B_dData_dPair.f_Pair_second = dtb__207 } -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Pat_PCon (dtb__203, dtb__206, v_noSpan)); B_dData_dPair.f_Pair_second = dtb__207 }))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((v_decPatList (fuel - 1)) dtb__204))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((Base_dBytes.v_decStr (fuel - 1)) dtb__192)) else (if (dtb__191 = 4) then ((fun nd_uscrut9 -> (match nd_uscrut9 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__208) -> (match dtb__208 with
  | { B_dData_dPair.f_Pair_first = dtb__209; B_dData_dPair.f_Pair_second = dtb__210 } -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Pat_PInt (dtb__209, v_noSpan)); B_dData_dPair.f_Pair_second = dtb__210 }))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((Base_dBytes.v_decInt (fuel - 1)) dtb__192)) else (if (dtb__191 = 5) then ((fun nd_uscrut9 -> (match nd_uscrut9 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__211) -> (match dtb__211 with
  | { B_dData_dPair.f_Pair_first = dtb__212; B_dData_dPair.f_Pair_second = dtb__213 } -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Pat_PStr (dtb__212, v_noSpan)); B_dData_dPair.f_Pair_second = dtb__213 }))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((Base_dBytes.v_decStr (fuel - 1)) dtb__192)) else (if (dtb__191 = 6) then ((fun nd_uscrut9 -> (match nd_uscrut9 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__214) -> (match dtb__214 with
  | { B_dData_dPair.f_Pair_first = dtb__215; B_dData_dPair.f_Pair_second = dtb__216 } -> ((fun nd_uscrut16 -> (match nd_uscrut16 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__217) -> (match dtb__217 with
  | { B_dData_dPair.f_Pair_first = dtb__218; B_dData_dPair.f_Pair_second = dtb__219 } -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Pat_PRecord (dtb__215, dtb__218, v_noSpan)); B_dData_dPair.f_Pair_second = dtb__219 }))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) (((Base_dBytes.v_decList v_decStrPat) (fuel - 1)) dtb__216))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((Base_dBytes.v_decStr (fuel - 1)) dtb__192)) else B_dData_dMaybe.C_Maybe_Nothing)))))))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((Base_dBytes.v_decTag fuel) bytes))))
# 826 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
and v_decStrPat = (fun (fuel : int) (bytes : Base_dBytes.t_Cur) -> (if (fuel <= 0) then B_dData_dMaybe.C_Maybe_Nothing else ((fun nd_uscrut2 -> (match nd_uscrut2 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__220) -> (match dtb__220 with
  | { B_dData_dPair.f_Pair_first = dtb__221; B_dData_dPair.f_Pair_second = dtb__222 } -> ((fun nd_uscrut9 -> (match nd_uscrut9 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__223) -> (match dtb__223 with
  | { B_dData_dPair.f_Pair_first = dtb__224; B_dData_dPair.f_Pair_second = dtb__225 } -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = { B_dData_dPair.f_Pair_first = dtb__221; B_dData_dPair.f_Pair_second = dtb__224 }; B_dData_dPair.f_Pair_second = dtb__225 }))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((v_decPat (fuel - 1)) dtb__222))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((Base_dBytes.v_decStr (fuel - 1)) bytes))))
# 887 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
and v_decPatList = (fun (fuel : int) (bytes : Base_dBytes.t_Cur) -> (if (fuel <= 0) then B_dData_dMaybe.C_Maybe_Nothing else ((fun nd_uscrut2 -> (match nd_uscrut2 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__226) -> (match dtb__226 with
  | { B_dData_dPair.f_Pair_first = dtb__227; B_dData_dPair.f_Pair_second = dtb__228 } -> ((((v_decPatListItems (fuel - 1)) dtb__227) dtb__228) B_dData_dList.C_List_Nil)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((v_decListHead fuel) bytes))))
# 897 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
and v_decPatListItems = (fun (fuel : int) (n : int) (bytes : Base_dBytes.t_Cur) (acc : Frontend_dAst.t_Pat B_dData_dList.t_List) -> (if (fuel <= 0) then B_dData_dMaybe.C_Maybe_Nothing else (if (n <= 0) then (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (B_dData_dList.v_reverse acc); B_dData_dPair.f_Pair_second = bytes })) else ((fun nd_uscrut4 -> (match nd_uscrut4 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__229) -> (match dtb__229 with
  | { B_dData_dPair.f_Pair_first = dtb__230; B_dData_dPair.f_Pair_second = dtb__231 } -> ((((v_decPatListItems (fuel - 1)) (n - 1)) dtb__231) (B_dData_dList.C_List__x58__x58_ (dtb__230, acc)))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((v_decPat (fuel - 1)) bytes)))))

# 330 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
let rec v_decInterpPart = (fun (fuel : int) (bytes : Base_dBytes.t_Cur) -> (if (fuel <= 0) then B_dData_dMaybe.C_Maybe_Nothing else ((fun nd_uscrut2 -> (match nd_uscrut2 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__232) -> (match dtb__232 with
  | { B_dData_dPair.f_Pair_first = dtb__233; B_dData_dPair.f_Pair_second = dtb__234 } -> (if (dtb__233 = 0) then ((fun nd_uscrut9 -> (match nd_uscrut9 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__235) -> (match dtb__235 with
  | { B_dData_dPair.f_Pair_first = dtb__236; B_dData_dPair.f_Pair_second = dtb__237 } -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_InterpPart_IPText (dtb__236)); B_dData_dPair.f_Pair_second = dtb__237 }))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((Base_dBytes.v_decStr (fuel - 1)) dtb__234)) else (if (dtb__233 = 1) then ((fun nd_uscrut9 -> (match nd_uscrut9 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__238) -> (match dtb__238 with
  | { B_dData_dPair.f_Pair_first = dtb__239; B_dData_dPair.f_Pair_second = dtb__240 } -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_InterpPart_IPHole (dtb__239)); B_dData_dPair.f_Pair_second = dtb__240 }))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((v_decExpr (fuel - 1)) dtb__234)) else B_dData_dMaybe.C_Maybe_Nothing))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((Base_dBytes.v_decTag fuel) bytes))))
# 396 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
and v_decDoStmt = (fun (fuel : int) (bytes : Base_dBytes.t_Cur) -> (if (fuel <= 0) then B_dData_dMaybe.C_Maybe_Nothing else ((fun nd_uscrut2 -> (match nd_uscrut2 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__241) -> (match dtb__241 with
  | { B_dData_dPair.f_Pair_first = dtb__242; B_dData_dPair.f_Pair_second = dtb__243 } -> (if (dtb__242 = 0) then ((fun nd_uscrut9 -> (match nd_uscrut9 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__244) -> (match dtb__244 with
  | { B_dData_dPair.f_Pair_first = dtb__245; B_dData_dPair.f_Pair_second = dtb__246 } -> ((fun nd_uscrut16 -> (match nd_uscrut16 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__247) -> (match dtb__247 with
  | { B_dData_dPair.f_Pair_first = dtb__248; B_dData_dPair.f_Pair_second = dtb__249 } -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_DoStmt_DBind (dtb__245, dtb__248, v_noSpan)); B_dData_dPair.f_Pair_second = dtb__249 }))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((v_decExpr (fuel - 1)) dtb__246))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((v_decPat (fuel - 1)) dtb__243)) else (if (dtb__242 = 1) then ((fun nd_uscrut9 -> (match nd_uscrut9 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__250) -> (match dtb__250 with
  | { B_dData_dPair.f_Pair_first = dtb__251; B_dData_dPair.f_Pair_second = dtb__252 } -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_DoStmt_DExpr (dtb__251, v_noSpan)); B_dData_dPair.f_Pair_second = dtb__252 }))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((v_decExpr (fuel - 1)) dtb__243)) else B_dData_dMaybe.C_Maybe_Nothing))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((Base_dBytes.v_decTag fuel) bytes))))
# 419 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
and v_decExpr = (fun (fuel : int) (bytes : Base_dBytes.t_Cur) -> (if (fuel <= 0) then B_dData_dMaybe.C_Maybe_Nothing else ((fun nd_uscrut2 -> (match nd_uscrut2 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__253) -> (match dtb__253 with
  | { B_dData_dPair.f_Pair_first = dtb__254; B_dData_dPair.f_Pair_second = dtb__255 } -> (if (dtb__254 = 0) then ((fun nd_uscrut9 -> (match nd_uscrut9 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__256) -> (match dtb__256 with
  | { B_dData_dPair.f_Pair_first = dtb__257; B_dData_dPair.f_Pair_second = dtb__258 } -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Expr_EVar (dtb__257, v_noSpan)); B_dData_dPair.f_Pair_second = dtb__258 }))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((Base_dBytes.v_decStr (fuel - 1)) dtb__255)) else (if (dtb__254 = 1) then ((fun nd_uscrut9 -> (match nd_uscrut9 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__259) -> (match dtb__259 with
  | { B_dData_dPair.f_Pair_first = dtb__260; B_dData_dPair.f_Pair_second = dtb__261 } -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Expr_EInt (dtb__260, v_noSpan)); B_dData_dPair.f_Pair_second = dtb__261 }))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((Base_dBytes.v_decInt (fuel - 1)) dtb__255)) else (if (dtb__254 = 2) then ((fun nd_uscrut9 -> (match nd_uscrut9 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__262) -> (match dtb__262 with
  | { B_dData_dPair.f_Pair_first = dtb__263; B_dData_dPair.f_Pair_second = dtb__264 } -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Expr_EStr (dtb__263, v_noSpan)); B_dData_dPair.f_Pair_second = dtb__264 }))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((Base_dBytes.v_decStr (fuel - 1)) dtb__255)) else (if (dtb__254 = 3) then ((fun nd_uscrut9 -> (match nd_uscrut9 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__265) -> (match dtb__265 with
  | { B_dData_dPair.f_Pair_first = dtb__266; B_dData_dPair.f_Pair_second = dtb__267 } -> ((fun nd_uscrut16 -> (match nd_uscrut16 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__268) -> (match dtb__268 with
  | { B_dData_dPair.f_Pair_first = dtb__269; B_dData_dPair.f_Pair_second = dtb__270 } -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Expr_ELam (((B_dData_dList.v_map (fun (n : string) -> { B_dData_dPair.f_Pair_first = n; B_dData_dPair.f_Pair_second = v_noSpan })) dtb__266), dtb__269, v_noSpan)); B_dData_dPair.f_Pair_second = dtb__270 }))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((v_decExpr (fuel - 1)) dtb__267))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) (((Base_dBytes.v_decList Base_dBytes.v_decStr) (fuel - 1)) dtb__255)) else (if (dtb__254 = 4) then ((fun nd_uscrut9 -> (match nd_uscrut9 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__271) -> (match dtb__271 with
  | { B_dData_dPair.f_Pair_first = dtb__272; B_dData_dPair.f_Pair_second = dtb__273 } -> ((fun nd_uscrut16 -> (match nd_uscrut16 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__274) -> (match dtb__274 with
  | { B_dData_dPair.f_Pair_first = dtb__275; B_dData_dPair.f_Pair_second = dtb__276 } -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Expr_EApp (dtb__272, dtb__275, v_noSpan)); B_dData_dPair.f_Pair_second = dtb__276 }))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((v_decExprList (fuel - 1)) dtb__273))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((v_decExpr (fuel - 1)) dtb__255)) else (if (dtb__254 = 5) then ((fun nd_uscrut9 -> (match nd_uscrut9 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__277) -> (match dtb__277 with
  | { B_dData_dPair.f_Pair_first = dtb__278; B_dData_dPair.f_Pair_second = dtb__279 } -> ((fun nd_uscrut16 -> (match nd_uscrut16 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__280) -> (match dtb__280 with
  | { B_dData_dPair.f_Pair_first = dtb__281; B_dData_dPair.f_Pair_second = dtb__282 } -> ((fun nd_uscrut23 -> (match nd_uscrut23 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__283) -> (match dtb__283 with
  | { B_dData_dPair.f_Pair_first = dtb__284; B_dData_dPair.f_Pair_second = dtb__285 } -> ((fun nd_uscrut30 -> (match nd_uscrut30 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__286) -> (match dtb__286 with
  | { B_dData_dPair.f_Pair_first = dtb__287; B_dData_dPair.f_Pair_second = dtb__288 } -> ((fun nd_uscrut37 -> (match nd_uscrut37 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__289) -> (match dtb__289 with
  | { B_dData_dPair.f_Pair_first = dtb__290; B_dData_dPair.f_Pair_second = dtb__291 } -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Expr_EPi (dtb__278, dtb__281, dtb__284, dtb__287, dtb__290, v_noSpan)); B_dData_dPair.f_Pair_second = dtb__291 }))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((v_decExpr (fuel - 1)) dtb__288))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((v_decExpr (fuel - 1)) dtb__285))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) (((Base_dBytes.v_decMaybe v_decQty) (fuel - 1)) dtb__282))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((Base_dBytes.v_decBool (fuel - 1)) dtb__279))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((Base_dBytes.v_decStr (fuel - 1)) dtb__255)) else (if (dtb__254 = 6) then ((fun nd_uscrut9 -> (match nd_uscrut9 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__292) -> (match dtb__292 with
  | { B_dData_dPair.f_Pair_first = dtb__293; B_dData_dPair.f_Pair_second = dtb__294 } -> ((fun nd_uscrut16 -> (match nd_uscrut16 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__295) -> (match dtb__295 with
  | { B_dData_dPair.f_Pair_first = dtb__296; B_dData_dPair.f_Pair_second = dtb__297 } -> ((fun nd_uscrut23 -> (match nd_uscrut23 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__298) -> (match dtb__298 with
  | { B_dData_dPair.f_Pair_first = dtb__299; B_dData_dPair.f_Pair_second = dtb__300 } -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Expr_ELet (dtb__293, dtb__296, dtb__299, v_noSpan)); B_dData_dPair.f_Pair_second = dtb__300 }))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((Base_dBytes.v_decBool (fuel - 1)) dtb__297))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((v_decExpr (fuel - 1)) dtb__294))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) (((Base_dBytes.v_decList v_decPatExpr) (fuel - 1)) dtb__255)) else (if (dtb__254 = 7) then ((fun nd_uscrut9 -> (match nd_uscrut9 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__301) -> (match dtb__301 with
  | { B_dData_dPair.f_Pair_first = dtb__302; B_dData_dPair.f_Pair_second = dtb__303 } -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Expr_ELocalFun (dtb__302, v_noSpan)); B_dData_dPair.f_Pair_second = dtb__303 }))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) (((Base_dBytes.v_decList v_decClause) (fuel - 1)) dtb__255)) else (if (dtb__254 = 8) then ((fun nd_uscrut9 -> (match nd_uscrut9 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__304) -> (match dtb__304 with
  | { B_dData_dPair.f_Pair_first = dtb__305; B_dData_dPair.f_Pair_second = dtb__306 } -> ((fun nd_uscrut16 -> (match nd_uscrut16 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__307) -> (match dtb__307 with
  | { B_dData_dPair.f_Pair_first = dtb__308; B_dData_dPair.f_Pair_second = dtb__309 } -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Expr_ECase (dtb__305, dtb__308, v_noSpan)); B_dData_dPair.f_Pair_second = dtb__309 }))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) (((Base_dBytes.v_decList v_decPatExpr) (fuel - 1)) dtb__306))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((v_decExpr (fuel - 1)) dtb__255)) else (if (dtb__254 = 9) then ((fun nd_uscrut9 -> (match nd_uscrut9 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__310) -> (match dtb__310 with
  | { B_dData_dPair.f_Pair_first = dtb__311; B_dData_dPair.f_Pair_second = dtb__312 } -> ((fun nd_uscrut16 -> (match nd_uscrut16 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__313) -> (match dtb__313 with
  | { B_dData_dPair.f_Pair_first = dtb__314; B_dData_dPair.f_Pair_second = dtb__315 } -> ((fun nd_uscrut23 -> (match nd_uscrut23 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__316) -> (match dtb__316 with
  | { B_dData_dPair.f_Pair_first = dtb__317; B_dData_dPair.f_Pair_second = dtb__318 } -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Expr_EIf (dtb__311, dtb__314, dtb__317, v_noSpan)); B_dData_dPair.f_Pair_second = dtb__318 }))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((v_decExpr (fuel - 1)) dtb__315))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((v_decExpr (fuel - 1)) dtb__312))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((v_decExpr (fuel - 1)) dtb__255)) else (if (dtb__254 = 10) then ((fun nd_uscrut9 -> (match nd_uscrut9 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__319) -> (match dtb__319 with
  | { B_dData_dPair.f_Pair_first = dtb__320; B_dData_dPair.f_Pair_second = dtb__321 } -> ((fun nd_uscrut16 -> (match nd_uscrut16 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__322) -> (match dtb__322 with
  | { B_dData_dPair.f_Pair_first = dtb__323; B_dData_dPair.f_Pair_second = dtb__324 } -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Expr_EField (dtb__320, dtb__323, v_noSpan)); B_dData_dPair.f_Pair_second = dtb__324 }))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((Base_dBytes.v_decStr (fuel - 1)) dtb__321))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((v_decExpr (fuel - 1)) dtb__255)) else (if (dtb__254 = 11) then ((fun nd_uscrut9 -> (match nd_uscrut9 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__325) -> (match dtb__325 with
  | { B_dData_dPair.f_Pair_first = dtb__326; B_dData_dPair.f_Pair_second = dtb__327 } -> ((fun nd_uscrut16 -> (match nd_uscrut16 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__328) -> (match dtb__328 with
  | { B_dData_dPair.f_Pair_first = dtb__329; B_dData_dPair.f_Pair_second = dtb__330 } -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Expr_ERecord (dtb__326, dtb__329, v_noSpan)); B_dData_dPair.f_Pair_second = dtb__330 }))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) (((Base_dBytes.v_decList v_decStrExpr) (fuel - 1)) dtb__327))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((Base_dBytes.v_decStr (fuel - 1)) dtb__255)) else (if (dtb__254 = 12) then ((fun nd_uscrut9 -> (match nd_uscrut9 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__331) -> (match dtb__331 with
  | { B_dData_dPair.f_Pair_first = dtb__332; B_dData_dPair.f_Pair_second = dtb__333 } -> ((fun nd_uscrut16 -> (match nd_uscrut16 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__334) -> (match dtb__334 with
  | { B_dData_dPair.f_Pair_first = dtb__335; B_dData_dPair.f_Pair_second = dtb__336 } -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Expr_ERecUpdate (dtb__332, dtb__335, v_noSpan)); B_dData_dPair.f_Pair_second = dtb__336 }))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) (((Base_dBytes.v_decList v_decStrExpr) (fuel - 1)) dtb__333))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((v_decExpr (fuel - 1)) dtb__255)) else (if (dtb__254 = 13) then ((fun nd_uscrut9 -> (match nd_uscrut9 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__337) -> (match dtb__337 with
  | { B_dData_dPair.f_Pair_first = dtb__338; B_dData_dPair.f_Pair_second = dtb__339 } -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Expr_EDo (dtb__338, v_noSpan)); B_dData_dPair.f_Pair_second = dtb__339 }))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) (((Base_dBytes.v_decList v_decDoStmt) (fuel - 1)) dtb__255)) else (if (dtb__254 = 14) then ((fun nd_uscrut9 -> (match nd_uscrut9 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__340) -> (match dtb__340 with
  | { B_dData_dPair.f_Pair_first = dtb__341; B_dData_dPair.f_Pair_second = dtb__342 } -> ((fun nd_uscrut16 -> (match nd_uscrut16 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__343) -> (match dtb__343 with
  | { B_dData_dPair.f_Pair_first = dtb__344; B_dData_dPair.f_Pair_second = dtb__345 } -> ((fun nd_uscrut23 -> (match nd_uscrut23 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__346) -> (match dtb__346 with
  | { B_dData_dPair.f_Pair_first = dtb__347; B_dData_dPair.f_Pair_second = dtb__348 } -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Expr_EInfix (dtb__341, dtb__344, dtb__347, v_noSpan)); B_dData_dPair.f_Pair_second = dtb__348 }))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((v_decExpr (fuel - 1)) dtb__345))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((v_decExpr (fuel - 1)) dtb__342))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((Base_dBytes.v_decStr (fuel - 1)) dtb__255)) else (if (dtb__254 = 15) then ((fun nd_uscrut9 -> (match nd_uscrut9 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__349) -> (match dtb__349 with
  | { B_dData_dPair.f_Pair_first = dtb__350; B_dData_dPair.f_Pair_second = dtb__351 } -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Expr_EParen (dtb__350, v_noSpan)); B_dData_dPair.f_Pair_second = dtb__351 }))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((v_decExpr (fuel - 1)) dtb__255)) else (if (dtb__254 = 16) then ((fun nd_uscrut9 -> (match nd_uscrut9 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__352) -> (match dtb__352 with
  | { B_dData_dPair.f_Pair_first = dtb__353; B_dData_dPair.f_Pair_second = dtb__354 } -> ((fun nd_uscrut16 -> (match nd_uscrut16 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__355) -> (match dtb__355 with
  | { B_dData_dPair.f_Pair_first = dtb__356; B_dData_dPair.f_Pair_second = dtb__357 } -> ((fun nd_uscrut23 -> (match nd_uscrut23 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__358) -> (match dtb__358 with
  | { B_dData_dPair.f_Pair_first = dtb__359; B_dData_dPair.f_Pair_second = dtb__360 } -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Expr_EBacktick (dtb__353, dtb__356, dtb__359, v_noSpan)); B_dData_dPair.f_Pair_second = dtb__360 }))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((v_decExpr (fuel - 1)) dtb__357))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((v_decExpr (fuel - 1)) dtb__354))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((Base_dBytes.v_decStr (fuel - 1)) dtb__255)) else (if (dtb__254 = 17) then ((fun nd_uscrut9 -> (match nd_uscrut9 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__361) -> (match dtb__361 with
  | { B_dData_dPair.f_Pair_first = dtb__362; B_dData_dPair.f_Pair_second = dtb__363 } -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Expr_ESectOp (dtb__362, v_noSpan)); B_dData_dPair.f_Pair_second = dtb__363 }))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((Base_dBytes.v_decStr (fuel - 1)) dtb__255)) else (if (dtb__254 = 18) then ((fun nd_uscrut9 -> (match nd_uscrut9 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__364) -> (match dtb__364 with
  | { B_dData_dPair.f_Pair_first = dtb__365; B_dData_dPair.f_Pair_second = dtb__366 } -> ((fun nd_uscrut16 -> (match nd_uscrut16 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__367) -> (match dtb__367 with
  | { B_dData_dPair.f_Pair_first = dtb__368; B_dData_dPair.f_Pair_second = dtb__369 } -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Expr_ESectL (dtb__365, dtb__368, v_noSpan)); B_dData_dPair.f_Pair_second = dtb__369 }))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((v_decExpr (fuel - 1)) dtb__366))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((Base_dBytes.v_decStr (fuel - 1)) dtb__255)) else (if (dtb__254 = 19) then ((fun nd_uscrut9 -> (match nd_uscrut9 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__370) -> (match dtb__370 with
  | { B_dData_dPair.f_Pair_first = dtb__371; B_dData_dPair.f_Pair_second = dtb__372 } -> ((fun nd_uscrut16 -> (match nd_uscrut16 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__373) -> (match dtb__373 with
  | { B_dData_dPair.f_Pair_first = dtb__374; B_dData_dPair.f_Pair_second = dtb__375 } -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Expr_ESectR (dtb__371, dtb__374, v_noSpan)); B_dData_dPair.f_Pair_second = dtb__375 }))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((Base_dBytes.v_decStr (fuel - 1)) dtb__372))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((v_decExpr (fuel - 1)) dtb__255)) else (if (dtb__254 = 20) then ((fun nd_uscrut9 -> (match nd_uscrut9 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__376) -> (match dtb__376 with
  | { B_dData_dPair.f_Pair_first = dtb__377; B_dData_dPair.f_Pair_second = dtb__378 } -> ((fun nd_uscrut16 -> (match nd_uscrut16 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__379) -> (match dtb__379 with
  | { B_dData_dPair.f_Pair_first = dtb__380; B_dData_dPair.f_Pair_second = dtb__381 } -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Expr_EAnn (dtb__377, dtb__380, v_noSpan)); B_dData_dPair.f_Pair_second = dtb__381 }))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((v_decExpr (fuel - 1)) dtb__378))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((v_decExpr (fuel - 1)) dtb__255)) else (if (dtb__254 = 21) then ((fun nd_uscrut9 -> (match nd_uscrut9 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__382) -> (match dtb__382 with
  | { B_dData_dPair.f_Pair_first = dtb__383; B_dData_dPair.f_Pair_second = dtb__384 } -> ((fun nd_uscrut16 -> (match nd_uscrut16 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__385) -> (match dtb__385 with
  | { B_dData_dPair.f_Pair_first = dtb__386; B_dData_dPair.f_Pair_second = dtb__387 } -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Expr_EInterp (dtb__383, dtb__386, v_noSpan)); B_dData_dPair.f_Pair_second = dtb__387 }))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) (((Base_dBytes.v_decList v_decInterpPart) (fuel - 1)) dtb__384))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((Base_dBytes.v_decBool (fuel - 1)) dtb__255)) else (if (dtb__254 = 22) then ((fun nd_uscrut9 -> (match nd_uscrut9 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__388) -> (match dtb__388 with
  | { B_dData_dPair.f_Pair_first = dtb__389; B_dData_dPair.f_Pair_second = dtb__390 } -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Expr_EFloat (dtb__389, v_noSpan)); B_dData_dPair.f_Pair_second = dtb__390 }))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((Base_dBytes.v_decStr (fuel - 1)) dtb__255)) else B_dData_dMaybe.C_Maybe_Nothing)))))))))))))))))))))))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((Base_dBytes.v_decTag fuel) bytes))))
# 787 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
and v_decPatExpr = (fun (fuel : int) (bytes : Base_dBytes.t_Cur) -> (if (fuel <= 0) then B_dData_dMaybe.C_Maybe_Nothing else ((fun nd_uscrut2 -> (match nd_uscrut2 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__391) -> (match dtb__391 with
  | { B_dData_dPair.f_Pair_first = dtb__392; B_dData_dPair.f_Pair_second = dtb__393 } -> ((fun nd_uscrut9 -> (match nd_uscrut9 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__394) -> (match dtb__394 with
  | { B_dData_dPair.f_Pair_first = dtb__395; B_dData_dPair.f_Pair_second = dtb__396 } -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = { B_dData_dPair.f_Pair_first = dtb__392; B_dData_dPair.f_Pair_second = dtb__395 }; B_dData_dPair.f_Pair_second = dtb__396 }))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((v_decExpr (fuel - 1)) dtb__393))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((v_decPat (fuel - 1)) bytes))))
# 800 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
and v_decClause = (fun (fuel : int) (bytes : Base_dBytes.t_Cur) -> (if (fuel <= 0) then B_dData_dMaybe.C_Maybe_Nothing else ((fun nd_uscrut2 -> (match nd_uscrut2 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__397) -> (match dtb__397 with
  | { B_dData_dPair.f_Pair_first = dtb__398; B_dData_dPair.f_Pair_second = dtb__399 } -> ((fun nd_uscrut9 -> (match nd_uscrut9 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__400) -> (match dtb__400 with
  | { B_dData_dPair.f_Pair_first = dtb__401; B_dData_dPair.f_Pair_second = dtb__402 } -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = { B_dData_dPair.f_Pair_first = dtb__398; B_dData_dPair.f_Pair_second = dtb__401 }; B_dData_dPair.f_Pair_second = dtb__402 }))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((v_decExpr (fuel - 1)) dtb__399))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((v_decPatList (fuel - 1)) bytes))))
# 813 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
and v_decStrExpr = (fun (fuel : int) (bytes : Base_dBytes.t_Cur) -> (if (fuel <= 0) then B_dData_dMaybe.C_Maybe_Nothing else ((fun nd_uscrut2 -> (match nd_uscrut2 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__403) -> (match dtb__403 with
  | { B_dData_dPair.f_Pair_first = dtb__404; B_dData_dPair.f_Pair_second = dtb__405 } -> ((fun nd_uscrut9 -> (match nd_uscrut9 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__406) -> (match dtb__406 with
  | { B_dData_dPair.f_Pair_first = dtb__407; B_dData_dPair.f_Pair_second = dtb__408 } -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = { B_dData_dPair.f_Pair_first = dtb__404; B_dData_dPair.f_Pair_second = dtb__407 }; B_dData_dPair.f_Pair_second = dtb__408 }))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((v_decExpr (fuel - 1)) dtb__405))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((Base_dBytes.v_decStr (fuel - 1)) bytes))))
# 865 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
and v_decExprList = (fun (fuel : int) (bytes : Base_dBytes.t_Cur) -> (if (fuel <= 0) then B_dData_dMaybe.C_Maybe_Nothing else ((fun nd_uscrut2 -> (match nd_uscrut2 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__409) -> (match dtb__409 with
  | { B_dData_dPair.f_Pair_first = dtb__410; B_dData_dPair.f_Pair_second = dtb__411 } -> ((((v_decExprListItems (fuel - 1)) dtb__410) dtb__411) B_dData_dList.C_List_Nil)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((v_decListHead fuel) bytes))))
# 875 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
and v_decExprListItems = (fun (fuel : int) (n : int) (bytes : Base_dBytes.t_Cur) (acc : Frontend_dAst.t_Expr B_dData_dList.t_List) -> (if (fuel <= 0) then B_dData_dMaybe.C_Maybe_Nothing else (if (n <= 0) then (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (B_dData_dList.v_reverse acc); B_dData_dPair.f_Pair_second = bytes })) else ((fun nd_uscrut4 -> (match nd_uscrut4 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__412) -> (match dtb__412 with
  | { B_dData_dPair.f_Pair_first = dtb__413; B_dData_dPair.f_Pair_second = dtb__414 } -> ((((v_decExprListItems (fuel - 1)) (n - 1)) dtb__414) (B_dData_dList.C_List__x58__x58_ (dtb__413, acc)))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((v_decExpr (fuel - 1)) bytes)))))

# 326 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
let v_decMaybeExpr = (fun (fuel : int) (bytes : Base_dBytes.t_Cur) -> (((Base_dBytes.v_decMaybe v_decExpr) fuel) bytes))

# 589 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
let v_decCtor = (fun (fuel : int) (bytes : Base_dBytes.t_Cur) -> (if (fuel <= 0) then B_dData_dMaybe.C_Maybe_Nothing else ((fun nd_uscrut2 -> (match nd_uscrut2 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__415) -> (match dtb__415 with
  | { B_dData_dPair.f_Pair_first = dtb__416; B_dData_dPair.f_Pair_second = dtb__417 } -> (if (dtb__416 = 0) then ((fun nd_uscrut9 -> (match nd_uscrut9 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__418) -> (match dtb__418 with
  | { B_dData_dPair.f_Pair_first = dtb__419; B_dData_dPair.f_Pair_second = dtb__420 } -> ((fun nd_uscrut16 -> (match nd_uscrut16 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__421) -> (match dtb__421 with
  | { B_dData_dPair.f_Pair_first = dtb__422; B_dData_dPair.f_Pair_second = dtb__423 } -> ((fun nd_uscrut23 -> (match nd_uscrut23 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__424) -> (match dtb__424 with
  | { B_dData_dPair.f_Pair_first = dtb__425; B_dData_dPair.f_Pair_second = dtb__426 } -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = { Frontend_dAst.f_Ctor_ctorName = dtb__419; Frontend_dAst.f_Ctor_ctorType = dtb__422; Frontend_dAst.f_Ctor_ctorArity = dtb__425; Frontend_dAst.f_Ctor_ctorSpan = v_noSpan }; B_dData_dPair.f_Pair_second = dtb__426 }))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((Base_dBytes.v_decInt (fuel - 1)) dtb__423))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((v_decExpr (fuel - 1)) dtb__420))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((Base_dBytes.v_decStr (fuel - 1)) dtb__417)) else B_dData_dMaybe.C_Maybe_Nothing)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((Base_dBytes.v_decTag fuel) bytes))))

# 611 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
let v_decField = (fun (fuel : int) (bytes : Base_dBytes.t_Cur) -> (if (fuel <= 0) then B_dData_dMaybe.C_Maybe_Nothing else ((fun nd_uscrut2 -> (match nd_uscrut2 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__427) -> (match dtb__427 with
  | { B_dData_dPair.f_Pair_first = dtb__428; B_dData_dPair.f_Pair_second = dtb__429 } -> (if (dtb__428 = 0) then ((fun nd_uscrut9 -> (match nd_uscrut9 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__430) -> (match dtb__430 with
  | { B_dData_dPair.f_Pair_first = dtb__431; B_dData_dPair.f_Pair_second = dtb__432 } -> ((fun nd_uscrut16 -> (match nd_uscrut16 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__433) -> (match dtb__433 with
  | { B_dData_dPair.f_Pair_first = dtb__434; B_dData_dPair.f_Pair_second = dtb__435 } -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = { Frontend_dAst.f_Field_fieldName = dtb__431; Frontend_dAst.f_Field_fieldType = dtb__434; Frontend_dAst.f_Field_fieldSpan = v_noSpan }; B_dData_dPair.f_Pair_second = dtb__435 }))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((v_decExpr (fuel - 1)) dtb__432))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((Base_dBytes.v_decStr (fuel - 1)) dtb__429)) else B_dData_dMaybe.C_Maybe_Nothing)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((Base_dBytes.v_decTag fuel) bytes))))

# 630 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
let v_decTraitParam = (fun (fuel : int) (bytes : Base_dBytes.t_Cur) -> (if (fuel <= 0) then B_dData_dMaybe.C_Maybe_Nothing else ((fun nd_uscrut2 -> (match nd_uscrut2 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__436) -> (match dtb__436 with
  | { B_dData_dPair.f_Pair_first = dtb__437; B_dData_dPair.f_Pair_second = dtb__438 } -> (if (dtb__437 = 0) then ((fun nd_uscrut9 -> (match nd_uscrut9 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__439) -> (match dtb__439 with
  | { B_dData_dPair.f_Pair_first = dtb__440; B_dData_dPair.f_Pair_second = dtb__441 } -> ((fun nd_uscrut16 -> (match nd_uscrut16 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__442) -> (match dtb__442 with
  | { B_dData_dPair.f_Pair_first = dtb__443; B_dData_dPair.f_Pair_second = dtb__444 } -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = { Frontend_dAst.f_TraitParam_traitParamName = dtb__440; Frontend_dAst.f_TraitParam_traitParamKind = dtb__443 }; B_dData_dPair.f_Pair_second = dtb__444 }))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) (((Base_dBytes.v_decMaybe v_decExpr) (fuel - 1)) dtb__441))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((Base_dBytes.v_decStr (fuel - 1)) dtb__438)) else B_dData_dMaybe.C_Maybe_Nothing)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((Base_dBytes.v_decTag fuel) bytes))))

# 649 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
let v_decTraitMethod = (fun (fuel : int) (bytes : Base_dBytes.t_Cur) -> (if (fuel <= 0) then B_dData_dMaybe.C_Maybe_Nothing else ((fun nd_uscrut2 -> (match nd_uscrut2 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__445) -> (match dtb__445 with
  | { B_dData_dPair.f_Pair_first = dtb__446; B_dData_dPair.f_Pair_second = dtb__447 } -> (if (dtb__446 = 0) then ((fun nd_uscrut9 -> (match nd_uscrut9 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__448) -> (match dtb__448 with
  | { B_dData_dPair.f_Pair_first = dtb__449; B_dData_dPair.f_Pair_second = dtb__450 } -> ((fun nd_uscrut16 -> (match nd_uscrut16 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__451) -> (match dtb__451 with
  | { B_dData_dPair.f_Pair_first = dtb__452; B_dData_dPair.f_Pair_second = dtb__453 } -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = { Frontend_dAst.f_TraitMethod_traitMethodName = dtb__449; Frontend_dAst.f_TraitMethod_traitMethodType = dtb__452; Frontend_dAst.f_TraitMethod_traitMethodSpan = v_noSpan }; B_dData_dPair.f_Pair_second = dtb__453 }))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((v_decExpr (fuel - 1)) dtb__450))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((Base_dBytes.v_decStr (fuel - 1)) dtb__447)) else B_dData_dMaybe.C_Maybe_Nothing)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((Base_dBytes.v_decTag fuel) bytes))))

# 668 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
let rec v_decDecl = (fun (fuel : int) (bytes : Base_dBytes.t_Cur) -> (if (fuel <= 0) then B_dData_dMaybe.C_Maybe_Nothing else ((fun nd_uscrut2 -> (match nd_uscrut2 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__454) -> (match dtb__454 with
  | { B_dData_dPair.f_Pair_first = dtb__455; B_dData_dPair.f_Pair_second = dtb__456 } -> (if (dtb__455 = 0) then ((fun nd_uscrut9 -> (match nd_uscrut9 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__457) -> (match dtb__457 with
  | { B_dData_dPair.f_Pair_first = dtb__458; B_dData_dPair.f_Pair_second = dtb__459 } -> ((fun nd_uscrut16 -> (match nd_uscrut16 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__460) -> (match dtb__460 with
  | { B_dData_dPair.f_Pair_first = dtb__461; B_dData_dPair.f_Pair_second = dtb__462 } -> ((fun nd_uscrut23 -> (match nd_uscrut23 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__463) -> (match dtb__463 with
  | { B_dData_dPair.f_Pair_first = dtb__464; B_dData_dPair.f_Pair_second = dtb__465 } -> ((fun nd_uscrut30 -> (match nd_uscrut30 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__466) -> (match dtb__466 with
  | { B_dData_dPair.f_Pair_first = dtb__467; B_dData_dPair.f_Pair_second = dtb__468 } -> ((fun nd_uscrut37 -> (match nd_uscrut37 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__469) -> (match dtb__469 with
  | { B_dData_dPair.f_Pair_first = dtb__470; B_dData_dPair.f_Pair_second = dtb__471 } -> ((fun nd_uscrut44 -> (match nd_uscrut44 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__472) -> (match dtb__472 with
  | { B_dData_dPair.f_Pair_first = dtb__473; B_dData_dPair.f_Pair_second = dtb__474 } -> ((fun nd_uscrut51 -> (match nd_uscrut51 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__475) -> (match dtb__475 with
  | { B_dData_dPair.f_Pair_first = dtb__476; B_dData_dPair.f_Pair_second = dtb__477 } -> ((fun nd_uscrut58 -> (match nd_uscrut58 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__478) -> (match dtb__478 with
  | { B_dData_dPair.f_Pair_first = dtb__479; B_dData_dPair.f_Pair_second = dtb__480 } -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Decl_DData (dtb__458, dtb__461, dtb__464, dtb__467, dtb__470, dtb__473, dtb__476, dtb__479, v_noSpan)); B_dData_dPair.f_Pair_second = dtb__480 }))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((Base_dBytes.v_decBool (fuel - 1)) dtb__477))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((v_decReprTier (fuel - 1)) dtb__474))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((Base_dBytes.v_decBool (fuel - 1)) dtb__471))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) (((Base_dBytes.v_decList Base_dBytes.v_decStr) (fuel - 1)) dtb__468))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) (((Base_dBytes.v_decList v_decCtor) (fuel - 1)) dtb__465))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((v_decExpr (fuel - 1)) dtb__462))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) (((Base_dBytes.v_decList Base_dBytes.v_decStr) (fuel - 1)) dtb__459))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((Base_dBytes.v_decStr (fuel - 1)) dtb__456)) else (if (dtb__455 = 1) then ((fun nd_uscrut9 -> (match nd_uscrut9 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__481) -> (match dtb__481 with
  | { B_dData_dPair.f_Pair_first = dtb__482; B_dData_dPair.f_Pair_second = dtb__483 } -> ((fun nd_uscrut16 -> (match nd_uscrut16 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__484) -> (match dtb__484 with
  | { B_dData_dPair.f_Pair_first = dtb__485; B_dData_dPair.f_Pair_second = dtb__486 } -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Decl_DAxiom (dtb__482, dtb__485, v_noSpan)); B_dData_dPair.f_Pair_second = dtb__486 }))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((v_decExpr (fuel - 1)) dtb__483))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((Base_dBytes.v_decStr (fuel - 1)) dtb__456)) else (if (dtb__455 = 2) then ((fun nd_uscrut9 -> (match nd_uscrut9 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__487) -> (match dtb__487 with
  | { B_dData_dPair.f_Pair_first = dtb__488; B_dData_dPair.f_Pair_second = dtb__489 } -> ((fun nd_uscrut16 -> (match nd_uscrut16 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__490) -> (match dtb__490 with
  | { B_dData_dPair.f_Pair_first = dtb__491; B_dData_dPair.f_Pair_second = dtb__492 } -> ((fun nd_uscrut23 -> (match nd_uscrut23 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__493) -> (match dtb__493 with
  | { B_dData_dPair.f_Pair_first = dtb__494; B_dData_dPair.f_Pair_second = dtb__495 } -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Decl_DExtern (dtb__488, dtb__491, dtb__494, v_noSpan)); B_dData_dPair.f_Pair_second = dtb__495 }))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((v_decExpr (fuel - 1)) dtb__492))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((Base_dBytes.v_decStr (fuel - 1)) dtb__489))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((Base_dBytes.v_decStr (fuel - 1)) dtb__456)) else (if (dtb__455 = 3) then ((fun nd_uscrut9 -> (match nd_uscrut9 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__496) -> (match dtb__496 with
  | { B_dData_dPair.f_Pair_first = dtb__497; B_dData_dPair.f_Pair_second = dtb__498 } -> ((fun nd_uscrut16 -> (match nd_uscrut16 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__499) -> (match dtb__499 with
  | { B_dData_dPair.f_Pair_first = dtb__500; B_dData_dPair.f_Pair_second = dtb__501 } -> ((fun nd_uscrut23 -> (match nd_uscrut23 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__502) -> (match dtb__502 with
  | { B_dData_dPair.f_Pair_first = dtb__503; B_dData_dPair.f_Pair_second = dtb__504 } -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Decl_DSig (dtb__497, dtb__500, dtb__503, v_noSpan)); B_dData_dPair.f_Pair_second = dtb__504 }))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((v_decExpr (fuel - 1)) dtb__501))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((v_decExprList (fuel - 1)) dtb__498))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((Base_dBytes.v_decStr (fuel - 1)) dtb__456)) else (if (dtb__455 = 4) then ((fun nd_uscrut9 -> (match nd_uscrut9 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__505) -> (match dtb__505 with
  | { B_dData_dPair.f_Pair_first = dtb__506; B_dData_dPair.f_Pair_second = dtb__507 } -> ((fun nd_uscrut16 -> (match nd_uscrut16 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__508) -> (match dtb__508 with
  | { B_dData_dPair.f_Pair_first = dtb__509; B_dData_dPair.f_Pair_second = dtb__510 } -> ((fun nd_uscrut23 -> (match nd_uscrut23 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__511) -> (match dtb__511 with
  | { B_dData_dPair.f_Pair_first = dtb__512; B_dData_dPair.f_Pair_second = dtb__513 } -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Decl_DFun (dtb__506, dtb__509, dtb__512, v_noSpan)); B_dData_dPair.f_Pair_second = dtb__513 }))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((v_decExpr (fuel - 1)) dtb__510))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((v_decPatList (fuel - 1)) dtb__507))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((Base_dBytes.v_decStr (fuel - 1)) dtb__456)) else (if (dtb__455 = 5) then ((fun nd_uscrut9 -> (match nd_uscrut9 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__514) -> (match dtb__514 with
  | { B_dData_dPair.f_Pair_first = dtb__515; B_dData_dPair.f_Pair_second = dtb__516 } -> ((fun nd_uscrut16 -> (match nd_uscrut16 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__517) -> (match dtb__517 with
  | { B_dData_dPair.f_Pair_first = dtb__518; B_dData_dPair.f_Pair_second = dtb__519 } -> ((fun nd_uscrut23 -> (match nd_uscrut23 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__520) -> (match dtb__520 with
  | { B_dData_dPair.f_Pair_first = dtb__521; B_dData_dPair.f_Pair_second = dtb__522 } -> ((fun nd_uscrut30 -> (match nd_uscrut30 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__523) -> (match dtb__523 with
  | { B_dData_dPair.f_Pair_first = dtb__524; B_dData_dPair.f_Pair_second = dtb__525 } -> ((fun nd_uscrut37 -> (match nd_uscrut37 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__526) -> (match dtb__526 with
  | { B_dData_dPair.f_Pair_first = dtb__527; B_dData_dPair.f_Pair_second = dtb__528 } -> ((fun nd_uscrut44 -> (match nd_uscrut44 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__529) -> (match dtb__529 with
  | { B_dData_dPair.f_Pair_first = dtb__530; B_dData_dPair.f_Pair_second = dtb__531 } -> ((fun nd_uscrut51 -> (match nd_uscrut51 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__532) -> (match dtb__532 with
  | { B_dData_dPair.f_Pair_first = dtb__533; B_dData_dPair.f_Pair_second = dtb__534 } -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Decl_DRecord (dtb__515, dtb__518, dtb__521, dtb__524, dtb__527, dtb__530, dtb__533, v_noSpan)); B_dData_dPair.f_Pair_second = dtb__534 }))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((Base_dBytes.v_decBool (fuel - 1)) dtb__531))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((v_decReprTier (fuel - 1)) dtb__528))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((Base_dBytes.v_decBool (fuel - 1)) dtb__525))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) (((Base_dBytes.v_decList Base_dBytes.v_decStr) (fuel - 1)) dtb__522))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) (((Base_dBytes.v_decList v_decField) (fuel - 1)) dtb__519))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) (((Base_dBytes.v_decList Base_dBytes.v_decStr) (fuel - 1)) dtb__516))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((Base_dBytes.v_decStr (fuel - 1)) dtb__456)) else (if (dtb__455 = 6) then ((fun nd_uscrut9 -> (match nd_uscrut9 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__535) -> (match dtb__535 with
  | { B_dData_dPair.f_Pair_first = dtb__536; B_dData_dPair.f_Pair_second = dtb__537 } -> ((fun nd_uscrut16 -> (match nd_uscrut16 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__538) -> (match dtb__538 with
  | { B_dData_dPair.f_Pair_first = dtb__539; B_dData_dPair.f_Pair_second = dtb__540 } -> ((fun nd_uscrut23 -> (match nd_uscrut23 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__541) -> (match dtb__541 with
  | { B_dData_dPair.f_Pair_first = dtb__542; B_dData_dPair.f_Pair_second = dtb__543 } -> ((fun nd_uscrut30 -> (match nd_uscrut30 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__544) -> (match dtb__544 with
  | { B_dData_dPair.f_Pair_first = dtb__545; B_dData_dPair.f_Pair_second = dtb__546 } -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Decl_DTrait (dtb__536, dtb__539, dtb__542, dtb__545, v_noSpan)); B_dData_dPair.f_Pair_second = dtb__546 }))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) (((Base_dBytes.v_decList v_decTraitMethod) (fuel - 1)) dtb__543))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((v_decExprList (fuel - 1)) dtb__540))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) (((Base_dBytes.v_decList v_decTraitParam) (fuel - 1)) dtb__537))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((Base_dBytes.v_decStr (fuel - 1)) dtb__456)) else (if (dtb__455 = 7) then ((fun nd_uscrut9 -> (match nd_uscrut9 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__547) -> (match dtb__547 with
  | { B_dData_dPair.f_Pair_first = dtb__548; B_dData_dPair.f_Pair_second = dtb__549 } -> ((fun nd_uscrut16 -> (match nd_uscrut16 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__550) -> (match dtb__550 with
  | { B_dData_dPair.f_Pair_first = dtb__551; B_dData_dPair.f_Pair_second = dtb__552 } -> ((fun nd_uscrut23 -> (match nd_uscrut23 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__553) -> (match dtb__553 with
  | { B_dData_dPair.f_Pair_first = dtb__554; B_dData_dPair.f_Pair_second = dtb__555 } -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Decl_DInstance (dtb__548, dtb__551, dtb__554, v_noSpan)); B_dData_dPair.f_Pair_second = dtb__555 }))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((v_decDecls (fuel - 1)) dtb__552))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((v_decExpr (fuel - 1)) dtb__549))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((v_decExprList (fuel - 1)) dtb__456)) else B_dData_dMaybe.C_Maybe_Nothing))))))))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((Base_dBytes.v_decTag fuel) bytes))))
# 909 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
and v_decDecls = (fun (fuel : int) (bytes : Base_dBytes.t_Cur) -> (if (fuel <= 0) then B_dData_dMaybe.C_Maybe_Nothing else ((fun nd_uscrut2 -> (match nd_uscrut2 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__556) -> (match dtb__556 with
  | { B_dData_dPair.f_Pair_first = dtb__557; B_dData_dPair.f_Pair_second = dtb__558 } -> ((((v_decDeclsItems (fuel - 1)) dtb__557) dtb__558) B_dData_dList.C_List_Nil)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((v_decListHead fuel) bytes))))
# 919 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
and v_decDeclsItems = (fun (fuel : int) (n : int) (bytes : Base_dBytes.t_Cur) (acc : Frontend_dAst.t_Decl B_dData_dList.t_List) -> (if (fuel <= 0) then B_dData_dMaybe.C_Maybe_Nothing else (if (n <= 0) then (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (B_dData_dList.v_reverse acc); B_dData_dPair.f_Pair_second = bytes })) else ((fun nd_uscrut4 -> (match nd_uscrut4 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__559) -> (match dtb__559 with
  | { B_dData_dPair.f_Pair_first = dtb__560; B_dData_dPair.f_Pair_second = dtb__561 } -> ((((v_decDeclsItems (fuel - 1)) (n - 1)) dtb__561) (B_dData_dList.C_List__x58__x58_ (dtb__560, acc)))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((v_decDecl (fuel - 1)) bytes)))))

# 931 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
let v_decPatComplete = (fun (s : string) -> ((fun nd_uscrut1 -> (match nd_uscrut1 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__562) -> (match dtb__562 with
  | { B_dData_dPair.f_Pair_first = dtb__563; B_dData_dPair.f_Pair_second = dtb__564 } -> (if (Base_dBytes.v_curAtEnd dtb__564) then (B_dData_dMaybe.C_Maybe_Just (dtb__563)) else B_dData_dMaybe.C_Maybe_Nothing)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((v_decPat (bi_strLength s)) (Base_dBytes.v_curOf s))))

# 938 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
let v_decExprComplete = (fun (s : string) -> ((fun nd_uscrut1 -> (match nd_uscrut1 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__565) -> (match dtb__565 with
  | { B_dData_dPair.f_Pair_first = dtb__566; B_dData_dPair.f_Pair_second = dtb__567 } -> (if (Base_dBytes.v_curAtEnd dtb__567) then (B_dData_dMaybe.C_Maybe_Just (dtb__566)) else B_dData_dMaybe.C_Maybe_Nothing)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((v_decExpr (bi_strLength s)) (Base_dBytes.v_curOf s))))

# 945 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
let v_decDeclComplete = (fun (s : string) -> ((fun nd_uscrut1 -> (match nd_uscrut1 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__568) -> (match dtb__568 with
  | { B_dData_dPair.f_Pair_first = dtb__569; B_dData_dPair.f_Pair_second = dtb__570 } -> (if (Base_dBytes.v_curAtEnd dtb__570) then (B_dData_dMaybe.C_Maybe_Just (dtb__569)) else B_dData_dMaybe.C_Maybe_Nothing)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((v_decDecl (bi_strLength s)) (Base_dBytes.v_curOf s))))

# 952 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
let v_decQtyComplete = (fun (s : string) -> ((fun nd_uscrut1 -> (match nd_uscrut1 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__571) -> (match dtb__571 with
  | { B_dData_dPair.f_Pair_first = dtb__572; B_dData_dPair.f_Pair_second = dtb__573 } -> (if (Base_dBytes.v_curAtEnd dtb__573) then (B_dData_dMaybe.C_Maybe_Just (dtb__572)) else B_dData_dMaybe.C_Maybe_Nothing)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((v_decQty (bi_strLength s)) (Base_dBytes.v_curOf s))))

# 959 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
let v_decReprTierComplete = (fun (s : string) -> ((fun nd_uscrut1 -> (match nd_uscrut1 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__574) -> (match dtb__574 with
  | { B_dData_dPair.f_Pair_first = dtb__575; B_dData_dPair.f_Pair_second = dtb__576 } -> (if (Base_dBytes.v_curAtEnd dtb__576) then (B_dData_dMaybe.C_Maybe_Just (dtb__575)) else B_dData_dMaybe.C_Maybe_Nothing)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((v_decReprTier (bi_strLength s)) (Base_dBytes.v_curOf s))))

# 966 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
let v_decInterpPartComplete = (fun (s : string) -> ((fun nd_uscrut1 -> (match nd_uscrut1 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__577) -> (match dtb__577 with
  | { B_dData_dPair.f_Pair_first = dtb__578; B_dData_dPair.f_Pair_second = dtb__579 } -> (if (Base_dBytes.v_curAtEnd dtb__579) then (B_dData_dMaybe.C_Maybe_Just (dtb__578)) else B_dData_dMaybe.C_Maybe_Nothing)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((v_decInterpPart (bi_strLength s)) (Base_dBytes.v_curOf s))))

# 973 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
let v_decDoStmtComplete = (fun (s : string) -> ((fun nd_uscrut1 -> (match nd_uscrut1 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__580) -> (match dtb__580 with
  | { B_dData_dPair.f_Pair_first = dtb__581; B_dData_dPair.f_Pair_second = dtb__582 } -> (if (Base_dBytes.v_curAtEnd dtb__582) then (B_dData_dMaybe.C_Maybe_Just (dtb__581)) else B_dData_dMaybe.C_Maybe_Nothing)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((v_decDoStmt (bi_strLength s)) (Base_dBytes.v_curOf s))))

# 980 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
let v_decCtorComplete = (fun (s : string) -> ((fun nd_uscrut1 -> (match nd_uscrut1 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__583) -> (match dtb__583 with
  | { B_dData_dPair.f_Pair_first = dtb__584; B_dData_dPair.f_Pair_second = dtb__585 } -> (if (Base_dBytes.v_curAtEnd dtb__585) then (B_dData_dMaybe.C_Maybe_Just (dtb__584)) else B_dData_dMaybe.C_Maybe_Nothing)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((v_decCtor (bi_strLength s)) (Base_dBytes.v_curOf s))))

# 987 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
let v_decFieldComplete = (fun (s : string) -> ((fun nd_uscrut1 -> (match nd_uscrut1 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__586) -> (match dtb__586 with
  | { B_dData_dPair.f_Pair_first = dtb__587; B_dData_dPair.f_Pair_second = dtb__588 } -> (if (Base_dBytes.v_curAtEnd dtb__588) then (B_dData_dMaybe.C_Maybe_Just (dtb__587)) else B_dData_dMaybe.C_Maybe_Nothing)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((v_decField (bi_strLength s)) (Base_dBytes.v_curOf s))))

# 994 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
let v_decTraitParamComplete = (fun (s : string) -> ((fun nd_uscrut1 -> (match nd_uscrut1 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__589) -> (match dtb__589 with
  | { B_dData_dPair.f_Pair_first = dtb__590; B_dData_dPair.f_Pair_second = dtb__591 } -> (if (Base_dBytes.v_curAtEnd dtb__591) then (B_dData_dMaybe.C_Maybe_Just (dtb__590)) else B_dData_dMaybe.C_Maybe_Nothing)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((v_decTraitParam (bi_strLength s)) (Base_dBytes.v_curOf s))))

# 1001 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
let v_decTraitMethodComplete = (fun (s : string) -> ((fun nd_uscrut1 -> (match nd_uscrut1 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__592) -> (match dtb__592 with
  | { B_dData_dPair.f_Pair_first = dtb__593; B_dData_dPair.f_Pair_second = dtb__594 } -> (if (Base_dBytes.v_curAtEnd dtb__594) then (B_dData_dMaybe.C_Maybe_Just (dtb__593)) else B_dData_dMaybe.C_Maybe_Nothing)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((v_decTraitMethod (bi_strLength s)) (Base_dBytes.v_curOf s))))

# 1008 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
let v_decDeclsComplete = (fun (s : string) -> ((fun nd_uscrut1 -> (match nd_uscrut1 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__595) -> (match dtb__595 with
  | { B_dData_dPair.f_Pair_first = dtb__596; B_dData_dPair.f_Pair_second = dtb__597 } -> (if (Base_dBytes.v_curAtEnd dtb__597) then (B_dData_dMaybe.C_Maybe_Just (dtb__596)) else B_dData_dMaybe.C_Maybe_Nothing)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((v_decDecls (bi_strLength s)) (Base_dBytes.v_curOf s))))

# 1022 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
let v_encExportItem = (fun (mc0 : Frontend_dAst.t_ExportItem) (mc1 : string B_dData_dList.t_List) -> (match mc0 with
  | Frontend_dAst.C_ExportItem_XNamespace (dtb__598, dtb__599, dtb__600) -> ((Base_dBytes.v_encTag 4) ((Base_dBytes.v_encStr dtb__598) (((Base_dBytes.v_encMaybe Base_dBytes.v_encStr) dtb__599) mc1)))
  | Frontend_dAst.C_ExportItem_XModule (dtb__601, dtb__602) -> ((Base_dBytes.v_encTag 2) ((Base_dBytes.v_encStr dtb__601) mc1))
  | Frontend_dAst.C_ExportItem_XTypeSome (dtb__603, dtb__604, dtb__605) -> ((Base_dBytes.v_encTag 3) ((Base_dBytes.v_encStr dtb__603) (((Base_dBytes.v_encList Base_dBytes.v_encStr) dtb__604) mc1)))
  | Frontend_dAst.C_ExportItem_XTypeAll (dtb__606, dtb__607) -> ((Base_dBytes.v_encTag 1) ((Base_dBytes.v_encStr dtb__606) mc1))
  | Frontend_dAst.C_ExportItem_XBare (dtb__608, dtb__609) -> ((Base_dBytes.v_encTag 0) ((Base_dBytes.v_encStr dtb__608) mc1))
  | _ -> failwith "DT: impossible branch"
))

# 1029 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
let v_encExportMembers = (fun (mc0 : Frontend_dAst.t_ExportMembers) (mc1 : string B_dData_dList.t_List) -> (match mc0 with
  | Frontend_dAst.C_ExportMembers_EMOnly (dtb__610) -> ((Base_dBytes.v_encTag 2) (((Base_dBytes.v_encList Base_dBytes.v_encStr) dtb__610) mc1))
  | Frontend_dAst.C_ExportMembers_EMAll -> ((Base_dBytes.v_encTag 1) mc1)
  | Frontend_dAst.C_ExportMembers_EMNone -> ((Base_dBytes.v_encTag 0) mc1)
  | _ -> failwith "DT: impossible branch"
))

# 1034 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
let v_encExportSpec = (fun (mc0 : Frontend_dAst.t_ExportSpec) (mc1 : string B_dData_dList.t_List) -> (match mc0 with
  | Frontend_dAst.C_ExportSpec_ESType (dtb__611, dtb__612, dtb__613) -> ((Base_dBytes.v_encTag 1) ((Base_dBytes.v_encStr dtb__611) ((v_encExportMembers dtb__612) mc1)))
  | Frontend_dAst.C_ExportSpec_ESValue (dtb__614, dtb__615) -> ((Base_dBytes.v_encTag 0) ((Base_dBytes.v_encStr dtb__614) mc1))
  | _ -> failwith "DT: impossible branch"
))

# 1038 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
let v_encOpacity = (fun (mc0 : Frontend_dAst.t_Opacity) (mc1 : string B_dData_dList.t_List) -> (match mc0 with
  | Frontend_dAst.C_Opacity_OpacityAbstract -> ((Base_dBytes.v_encTag 2) mc1)
  | Frontend_dAst.C_Opacity_OpacityTransparent -> ((Base_dBytes.v_encTag 1) mc1)
  | Frontend_dAst.C_Opacity_OpacityOpaque -> ((Base_dBytes.v_encTag 0) mc1)
  | _ -> failwith "DT: impossible branch"
))

# 1043 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
let v_encOpacitySpec = (fun (o : Frontend_dAst.t_OpacitySpec) (acc : string B_dData_dList.t_List) -> ((Base_dBytes.v_encStr (o).Frontend_dAst.f_OpacitySpec_opacityName) ((v_encOpacity (o).Frontend_dAst.f_OpacitySpec_opacityKind) acc)))

# 1047 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
let v_encModDecl = (fun (m : Frontend_dAst.t_ModDecl) (acc : string B_dData_dList.t_List) -> ((Base_dBytes.v_encStr (m).Frontend_dAst.f_ModDecl_modDeclName) ((Base_dBytes.v_encBool (m).Frontend_dAst.f_ModDecl_modDeclHasExportList) (((Base_dBytes.v_encList v_encExportItem) (m).Frontend_dAst.f_ModDecl_modDeclExportItems) (((Base_dBytes.v_encList v_encExportSpec) (m).Frontend_dAst.f_ModDecl_modDeclExports) (((Base_dBytes.v_encList v_encExportItem) (m).Frontend_dAst.f_ModDecl_modDeclReexports) (((Base_dBytes.v_encList v_encOpacitySpec) (m).Frontend_dAst.f_ModDecl_modDeclOpacity) acc)))))))

# 1064 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
let v_encImportLike = (fun (i : Frontend_dAst.t_Import) (acc : string B_dData_dList.t_List) -> ((Base_dBytes.v_encStr (i).Frontend_dAst.f_Import_importName) ((Base_dBytes.v_encBool (i).Frontend_dAst.f_Import_importIsQualified) (((Base_dBytes.v_encMaybe Base_dBytes.v_encStr) (i).Frontend_dAst.f_Import_importAlias) acc))))

# 1068 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
let v_encFixityLike = (fun (f : Frontend_dAst.t_FixityDecl) (acc : string B_dData_dList.t_List) -> ((Base_dBytes.v_encStr (f).Frontend_dAst.f_FixityDecl_fixityOp) ((Base_dBytes.v_encInt (f).Frontend_dAst.f_FixityDecl_fixityLevel) ((Base_dBytes.v_encInt (f).Frontend_dAst.f_FixityDecl_fixityAssoc) acc))))

# 1054 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
let v_encSourceFile = (fun (f : Frontend_dAst.t_SourceFile) (acc : string B_dData_dList.t_List) -> (((Base_dBytes.v_encMaybe v_encModDecl) (f).Frontend_dAst.f_SourceFile_sourceFileModDecl) (((Base_dBytes.v_encList v_encImportLike) (f).Frontend_dAst.f_SourceFile_sourceFileImports) (((Base_dBytes.v_encList v_encFixityLike) (f).Frontend_dAst.f_SourceFile_sourceFileFixities) (((Base_dBytes.v_encList v_encDecl) (f).Frontend_dAst.f_SourceFile_sourceFileDecls) (((Base_dBytes.v_encList v_encExportSpec) (f).Frontend_dAst.f_SourceFile_sourceFileExports) (((Base_dBytes.v_encList v_encExportItem) (f).Frontend_dAst.f_SourceFile_sourceFileReexports) (((Base_dBytes.v_encList v_encOpacitySpec) (f).Frontend_dAst.f_SourceFile_sourceFileOpacity) acc))))))))

# 1072 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
let v_decExportItem = (fun (fuel : int) (c : Base_dBytes.t_Cur) -> (if (fuel <= 0) then B_dData_dMaybe.C_Maybe_Nothing else ((Base_dBytes.v_thenPair ((Base_dBytes.v_decTag fuel) c)) (fun (tag : int) (b1 : Base_dBytes.t_Cur) -> (if (tag = 0) then ((Base_dBytes.v_thenPair ((Base_dBytes.v_decStr (fuel - 1)) b1)) (fun (n : string) (b2 : Base_dBytes.t_Cur) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_ExportItem_XBare (n, v_noSpan)); B_dData_dPair.f_Pair_second = b2 })))) else (if (tag = 1) then ((Base_dBytes.v_thenPair ((Base_dBytes.v_decStr (fuel - 1)) b1)) (fun (n : string) (b2 : Base_dBytes.t_Cur) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_ExportItem_XTypeAll (n, v_noSpan)); B_dData_dPair.f_Pair_second = b2 })))) else (if (tag = 3) then ((Base_dBytes.v_thenPair ((Base_dBytes.v_decStr (fuel - 1)) b1)) (fun (n : string) (b2 : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair (((Base_dBytes.v_decList Base_dBytes.v_decStr) (fuel - 1)) b2)) (fun (ms : string B_dData_dList.t_List) (b3 : Base_dBytes.t_Cur) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_ExportItem_XTypeSome (n, ms, v_noSpan)); B_dData_dPair.f_Pair_second = b3 })))))) else (if (tag = 2) then ((Base_dBytes.v_thenPair ((Base_dBytes.v_decStr (fuel - 1)) b1)) (fun (n : string) (b2 : Base_dBytes.t_Cur) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_ExportItem_XModule (n, v_noSpan)); B_dData_dPair.f_Pair_second = b2 })))) else (if (tag = 4) then ((Base_dBytes.v_thenPair ((Base_dBytes.v_decStr (fuel - 1)) b1)) (fun (n : string) (b2 : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair (((Base_dBytes.v_decMaybe Base_dBytes.v_decStr) (fuel - 1)) b2)) (fun (alias : string B_dData_dMaybe.t_Maybe) (b3 : Base_dBytes.t_Cur) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_ExportItem_XNamespace (n, alias, v_noSpan)); B_dData_dPair.f_Pair_second = b3 })))))) else B_dData_dMaybe.C_Maybe_Nothing)))))))))

# 1088 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
let v_decExportMembers = (fun (fuel : int) (c : Base_dBytes.t_Cur) -> (if (fuel <= 0) then B_dData_dMaybe.C_Maybe_Nothing else ((Base_dBytes.v_thenPair ((Base_dBytes.v_decTag fuel) c)) (fun (tag : int) (b1 : Base_dBytes.t_Cur) -> (if (tag = 0) then (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = Frontend_dAst.C_ExportMembers_EMNone; B_dData_dPair.f_Pair_second = b1 })) else (if (tag = 1) then (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = Frontend_dAst.C_ExportMembers_EMAll; B_dData_dPair.f_Pair_second = b1 })) else (if (tag = 2) then ((Base_dBytes.v_thenPair (((Base_dBytes.v_decList Base_dBytes.v_decStr) (fuel - 1)) b1)) (fun (ms : string B_dData_dList.t_List) (b2 : Base_dBytes.t_Cur) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_ExportMembers_EMOnly (ms)); B_dData_dPair.f_Pair_second = b2 })))) else B_dData_dMaybe.C_Maybe_Nothing)))))))

# 1102 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
let v_decExportSpec = (fun (fuel : int) (c : Base_dBytes.t_Cur) -> (if (fuel <= 0) then B_dData_dMaybe.C_Maybe_Nothing else ((Base_dBytes.v_thenPair ((Base_dBytes.v_decTag fuel) c)) (fun (tag : int) (b1 : Base_dBytes.t_Cur) -> (if (tag = 0) then ((Base_dBytes.v_thenPair ((Base_dBytes.v_decStr (fuel - 1)) b1)) (fun (n : string) (b2 : Base_dBytes.t_Cur) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_ExportSpec_ESValue (n, v_noSpan)); B_dData_dPair.f_Pair_second = b2 })))) else (if (tag = 1) then ((Base_dBytes.v_thenPair ((Base_dBytes.v_decStr (fuel - 1)) b1)) (fun (n : string) (b2 : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair ((v_decExportMembers (fuel - 1)) b2)) (fun (ms : Frontend_dAst.t_ExportMembers) (b3 : Base_dBytes.t_Cur) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_ExportSpec_ESType (n, ms, v_noSpan)); B_dData_dPair.f_Pair_second = b3 })))))) else B_dData_dMaybe.C_Maybe_Nothing))))))

# 1115 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
let v_decOpacity = (fun (fuel : int) (c : Base_dBytes.t_Cur) -> (if (fuel <= 0) then B_dData_dMaybe.C_Maybe_Nothing else ((Base_dBytes.v_thenPair ((Base_dBytes.v_decTag fuel) c)) (fun (tag : int) (b1 : Base_dBytes.t_Cur) -> (if (tag = 0) then (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = Frontend_dAst.C_Opacity_OpacityOpaque; B_dData_dPair.f_Pair_second = b1 })) else (if (tag = 1) then (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = Frontend_dAst.C_Opacity_OpacityTransparent; B_dData_dPair.f_Pair_second = b1 })) else (if (tag = 2) then (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = Frontend_dAst.C_Opacity_OpacityAbstract; B_dData_dPair.f_Pair_second = b1 })) else B_dData_dMaybe.C_Maybe_Nothing)))))))

# 1129 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
let v_decOpacitySpec = (fun (fuel : int) (c : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair ((Base_dBytes.v_decStr (fuel - 1)) c)) (fun (name : string) (b1 : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair ((v_decOpacity (fuel - 1)) b1)) (fun (kind : Frontend_dAst.t_Opacity) (b2 : Base_dBytes.t_Cur) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = { Frontend_dAst.f_OpacitySpec_opacityName = name; Frontend_dAst.f_OpacitySpec_opacityKind = kind; Frontend_dAst.f_OpacitySpec_opacitySpan = v_noSpan }; B_dData_dPair.f_Pair_second = b2 })))))))

# 1136 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
let v_decModDecl = (fun (fuel : int) (c : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair ((Base_dBytes.v_decStr (fuel - 1)) c)) (fun (name : string) (b1 : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair ((Base_dBytes.v_decBool (fuel - 1)) b1)) (fun (hasList : bool) (b2 : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair (((Base_dBytes.v_decList v_decExportItem) (fuel - 1)) b2)) (fun (items : Frontend_dAst.t_ExportItem B_dData_dList.t_List) (b3 : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair (((Base_dBytes.v_decList v_decExportSpec) (fuel - 1)) b3)) (fun (exports : Frontend_dAst.t_ExportSpec B_dData_dList.t_List) (b4 : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair (((Base_dBytes.v_decList v_decExportItem) (fuel - 1)) b4)) (fun (reexports : Frontend_dAst.t_ExportItem B_dData_dList.t_List) (b5 : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair (((Base_dBytes.v_decList v_decOpacitySpec) (fuel - 1)) b5)) (fun (opacity : Frontend_dAst.t_OpacitySpec B_dData_dList.t_List) (b6 : Base_dBytes.t_Cur) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = { Frontend_dAst.f_ModDecl_modDeclName = name; Frontend_dAst.f_ModDecl_modDeclHasExportList = hasList; Frontend_dAst.f_ModDecl_modDeclExportItems = items; Frontend_dAst.f_ModDecl_modDeclExports = exports; Frontend_dAst.f_ModDecl_modDeclReexports = reexports; Frontend_dAst.f_ModDecl_modDeclOpacity = opacity; Frontend_dAst.f_ModDecl_modDeclSpan = v_noSpan }; B_dData_dPair.f_Pair_second = b6 })))))))))))))))

# 1142 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
let v_decImportLike = (fun (fuel : int) (c : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair ((Base_dBytes.v_decStr (fuel - 1)) c)) (fun (name : string) (b1 : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair ((Base_dBytes.v_decBool (fuel - 1)) b1)) (fun (qual : bool) (b2 : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair (((Base_dBytes.v_decMaybe Base_dBytes.v_decStr) (fuel - 1)) b2)) (fun (alias : string B_dData_dMaybe.t_Maybe) (b3 : Base_dBytes.t_Cur) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = { Frontend_dAst.f_Import_importName = name; Frontend_dAst.f_Import_importIsQualified = qual; Frontend_dAst.f_Import_importAlias = alias; Frontend_dAst.f_Import_importSpan = v_noSpan }; B_dData_dPair.f_Pair_second = b3 })))))))))

# 1148 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
let v_decFixityLike = (fun (fuel : int) (c : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair ((Base_dBytes.v_decStr (fuel - 1)) c)) (fun (op : string) (b1 : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair ((Base_dBytes.v_decInt (fuel - 1)) b1)) (fun (level : int) (b2 : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair ((Base_dBytes.v_decInt (fuel - 1)) b2)) (fun (assoc : int) (b3 : Base_dBytes.t_Cur) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = { Frontend_dAst.f_FixityDecl_fixityOp = op; Frontend_dAst.f_FixityDecl_fixityLevel = level; Frontend_dAst.f_FixityDecl_fixityAssoc = assoc; Frontend_dAst.f_FixityDecl_fixitySpan = v_noSpan }; B_dData_dPair.f_Pair_second = b3 })))))))))

# 1161 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
let v_decSourceFileGo = (fun (fuel : int) (c : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair (((Base_dBytes.v_decMaybe v_decModDecl) (fuel - 1)) c)) (fun (modDecl : Frontend_dAst.t_ModDecl B_dData_dMaybe.t_Maybe) (b1 : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair (((Base_dBytes.v_decList v_decImportLike) (fuel - 1)) b1)) (fun (imports : Frontend_dAst.t_Import B_dData_dList.t_List) (b2 : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair (((Base_dBytes.v_decList v_decFixityLike) (fuel - 1)) b2)) (fun (fixities : Frontend_dAst.t_FixityDecl B_dData_dList.t_List) (b3 : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair (((Base_dBytes.v_decList v_decDecl) (fuel - 1)) b3)) (fun (decls : Frontend_dAst.t_Decl B_dData_dList.t_List) (b4 : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair (((Base_dBytes.v_decList v_decExportSpec) (fuel - 1)) b4)) (fun (exports : Frontend_dAst.t_ExportSpec B_dData_dList.t_List) (b5 : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair (((Base_dBytes.v_decList v_decExportItem) (fuel - 1)) b5)) (fun (reexports : Frontend_dAst.t_ExportItem B_dData_dList.t_List) (b6 : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair (((Base_dBytes.v_decList v_decOpacitySpec) (fuel - 1)) b6)) (fun (opacity : Frontend_dAst.t_OpacitySpec B_dData_dList.t_List) (b7 : Base_dBytes.t_Cur) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = { Frontend_dAst.f_SourceFile_sourceFileModDecl = modDecl; Frontend_dAst.f_SourceFile_sourceFileImports = imports; Frontend_dAst.f_SourceFile_sourceFileFixities = fixities; Frontend_dAst.f_SourceFile_sourceFileDecls = decls; Frontend_dAst.f_SourceFile_sourceFileExports = exports; Frontend_dAst.f_SourceFile_sourceFileReexports = reexports; Frontend_dAst.f_SourceFile_sourceFileOpacity = opacity }; B_dData_dPair.f_Pair_second = b7 })))))))))))))))))

# 1155 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
let v_decSourceFileComplete = (fun (s : string) -> ((fun nd_uscrut1 -> (match nd_uscrut1 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__616) -> (match dtb__616 with
  | { B_dData_dPair.f_Pair_first = dtb__617; B_dData_dPair.f_Pair_second = dtb__618 } -> (if (Base_dBytes.v_curAtEnd dtb__618) then (B_dData_dMaybe.C_Maybe_Just (dtb__617)) else B_dData_dMaybe.C_Maybe_Nothing)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((v_decSourceFileGo (bi_strLength s)) (Base_dBytes.v_curOf s))))
