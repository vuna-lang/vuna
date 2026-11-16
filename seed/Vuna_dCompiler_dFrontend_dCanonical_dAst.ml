open Vuna_runtime
# 46 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
let v_Vuna_dCompiler_dFrontend_dCanonical_dAst_dnoSpan = { Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanFile = ""; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanStartLine = 0; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanStartCol = 0; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanEndLine = 0; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanEndCol = 0 }

# 53 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
let v_Vuna_dCompiler_dFrontend_dCanonical_dAst_dencQty = (fun mc0 mc1 -> (match mc0 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dQty_Q1 -> ((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_dencTag 1) mc1)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dQty_Q0 -> ((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_dencTag 0) mc1)
  | _ -> failwith "DT: impossible branch"
))

# 58 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
let v_Vuna_dCompiler_dFrontend_dCanonical_dAst_dencReprTier = (fun mc0 mc1 -> (match mc0 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dReprTier_ReprBoxed -> ((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_dencTag 2) mc1)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dReprTier_ReprAlias -> ((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_dencTag 1) mc1)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dReprTier_ReprAuto -> ((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_dencTag 0) mc1)
  | _ -> failwith "DT: impossible branch"
))

# 64 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
let v_Vuna_dCompiler_dFrontend_dCanonical_dAst_dencMaybeQty = (fun mc0 mc1 -> (match mc0 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__0) -> (Base_dList.C_Base_dList_dList__x58__x58_ ("1", ((v_Vuna_dCompiler_dFrontend_dCanonical_dAst_dencQty dtb__0) mc1)))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (Base_dList.C_Base_dList_dList__x58__x58_ ("0", mc1))
  | _ -> failwith "DT: impossible branch"
))

# 83 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
let rec v_Vuna_dCompiler_dFrontend_dCanonical_dAst_dencStrListGo = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__1, dtb__2) -> ((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_dencStr dtb__1) ((v_Vuna_dCompiler_dFrontend_dCanonical_dAst_dencStrListGo dtb__2) mc1))
  | Base_dList.C_Base_dList_dList_Nil -> mc1
  | _ -> failwith "DT: impossible branch"
))

# 79 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
let v_Vuna_dCompiler_dFrontend_dCanonical_dAst_dencStrList = (fun xs acc -> (Base_dList.C_Base_dList_dList__x58__x58_ ((String.concat "" ["["; (bi_strFromInt (Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_dlenOf xs)); ":"]), ((v_Vuna_dCompiler_dFrontend_dCanonical_dAst_dencStrListGo xs) acc))))

# 97 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
let rec v_Vuna_dCompiler_dFrontend_dCanonical_dAst_dencPatList = (fun xs acc -> (Base_dList.C_Base_dList_dList__x58__x58_ ((String.concat "" ["["; (bi_strFromInt (Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_dlenOf xs)); ":"]), ((v_Vuna_dCompiler_dFrontend_dCanonical_dAst_dencPatListGo xs) acc))))
# 101 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
and v_Vuna_dCompiler_dFrontend_dCanonical_dAst_dencPatListGo = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__3, dtb__4) -> ((v_Vuna_dCompiler_dFrontend_dCanonical_dAst_dencPat dtb__3) ((v_Vuna_dCompiler_dFrontend_dCanonical_dAst_dencPatListGo dtb__4) mc1))
  | Base_dList.C_Base_dList_dList_Nil -> mc1
  | _ -> failwith "DT: impossible branch"
))
# 151 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
and v_Vuna_dCompiler_dFrontend_dCanonical_dAst_dencStrPatList = (fun xs acc -> (Base_dList.C_Base_dList_dList__x58__x58_ ((String.concat "" ["["; (bi_strFromInt (Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_dlenOf xs)); ":"]), ((v_Vuna_dCompiler_dFrontend_dCanonical_dAst_dencStrPatListGo xs) acc))))
# 155 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
and v_Vuna_dCompiler_dFrontend_dCanonical_dAst_dencStrPatListGo = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__5, dtb__6) -> (match dtb__5 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__7; Base_dPair.f_Base_dPair_dPair_second = dtb__8 } -> ((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_dencStr dtb__7) ((v_Vuna_dCompiler_dFrontend_dCanonical_dAst_dencPat dtb__8) ((v_Vuna_dCompiler_dFrontend_dCanonical_dAst_dencStrPatListGo dtb__6) mc1)))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> mc1
  | _ -> failwith "DT: impossible branch"
))
# 210 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
and v_Vuna_dCompiler_dFrontend_dCanonical_dAst_dencPat = (fun mc0 mc1 -> (match mc0 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PRecord (dtb__9, dtb__10, dtb__11) -> ((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_dencTag 6) ((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_dencStr dtb__9) ((v_Vuna_dCompiler_dFrontend_dCanonical_dAst_dencStrPatList dtb__10) mc1)))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PStr (dtb__12, dtb__13) -> ((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_dencTag 5) ((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_dencStr dtb__12) mc1))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PInt (dtb__14, dtb__15) -> ((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_dencTag 4) ((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_dencInt dtb__14) mc1))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PCon (dtb__16, dtb__17, dtb__18) -> ((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_dencTag 3) ((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_dencStr dtb__16) ((v_Vuna_dCompiler_dFrontend_dCanonical_dAst_dencPatList dtb__17) mc1)))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PWild (dtb__19) -> ((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_dencTag 2) mc1)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PAs (dtb__20, dtb__21, dtb__22) -> ((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_dencTag 1) ((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_dencStr dtb__20) ((v_Vuna_dCompiler_dFrontend_dCanonical_dAst_dencPat dtb__21) mc1)))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PVar (dtb__23, dtb__24) -> ((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_dencTag 0) ((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_dencStr dtb__23) mc1))
  | _ -> failwith "DT: impossible branch"
))

# 88 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
let rec v_Vuna_dCompiler_dFrontend_dCanonical_dAst_dencExprList = (fun xs acc -> (Base_dList.C_Base_dList_dList__x58__x58_ ((String.concat "" ["["; (bi_strFromInt (Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_dlenOf xs)); ":"]), ((v_Vuna_dCompiler_dFrontend_dCanonical_dAst_dencExprListGo xs) acc))))
# 92 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
and v_Vuna_dCompiler_dFrontend_dCanonical_dAst_dencExprListGo = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__25, dtb__26) -> ((v_Vuna_dCompiler_dFrontend_dCanonical_dAst_dencExpr dtb__25) ((v_Vuna_dCompiler_dFrontend_dCanonical_dAst_dencExprListGo dtb__26) mc1))
  | Base_dList.C_Base_dList_dList_Nil -> mc1
  | _ -> failwith "DT: impossible branch"
))
# 106 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
and v_Vuna_dCompiler_dFrontend_dCanonical_dAst_dencPatExprList = (fun xs acc -> (Base_dList.C_Base_dList_dList__x58__x58_ ((String.concat "" ["["; (bi_strFromInt (Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_dlenOf xs)); ":"]), ((v_Vuna_dCompiler_dFrontend_dCanonical_dAst_dencPatExprListGo xs) acc))))
# 110 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
and v_Vuna_dCompiler_dFrontend_dCanonical_dAst_dencPatExprListGo = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__27, dtb__28) -> (match dtb__27 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__29; Base_dPair.f_Base_dPair_dPair_second = dtb__30 } -> ((v_Vuna_dCompiler_dFrontend_dCanonical_dAst_dencPat dtb__29) ((v_Vuna_dCompiler_dFrontend_dCanonical_dAst_dencExpr dtb__30) ((v_Vuna_dCompiler_dFrontend_dCanonical_dAst_dencPatExprListGo dtb__28) mc1)))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> mc1
  | _ -> failwith "DT: impossible branch"
))
# 115 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
and v_Vuna_dCompiler_dFrontend_dCanonical_dAst_dencClauses = (fun xs acc -> (Base_dList.C_Base_dList_dList__x58__x58_ ((String.concat "" ["["; (bi_strFromInt (Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_dlenOf xs)); ":"]), ((v_Vuna_dCompiler_dFrontend_dCanonical_dAst_dencClausesGo xs) acc))))
# 119 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
and v_Vuna_dCompiler_dFrontend_dCanonical_dAst_dencClausesGo = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__31, dtb__32) -> (match dtb__31 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__33; Base_dPair.f_Base_dPair_dPair_second = dtb__34 } -> ((v_Vuna_dCompiler_dFrontend_dCanonical_dAst_dencPatList dtb__33) ((v_Vuna_dCompiler_dFrontend_dCanonical_dAst_dencExpr dtb__34) ((v_Vuna_dCompiler_dFrontend_dCanonical_dAst_dencClausesGo dtb__32) mc1)))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> mc1
  | _ -> failwith "DT: impossible branch"
))
# 124 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
and v_Vuna_dCompiler_dFrontend_dCanonical_dAst_dencStmtList = (fun xs acc -> (Base_dList.C_Base_dList_dList__x58__x58_ ((String.concat "" ["["; (bi_strFromInt (Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_dlenOf xs)); ":"]), ((v_Vuna_dCompiler_dFrontend_dCanonical_dAst_dencStmtListGo xs) acc))))
# 128 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
and v_Vuna_dCompiler_dFrontend_dCanonical_dAst_dencStmtListGo = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__35, dtb__36) -> ((v_Vuna_dCompiler_dFrontend_dCanonical_dAst_dencDoStmt dtb__35) ((v_Vuna_dCompiler_dFrontend_dCanonical_dAst_dencStmtListGo dtb__36) mc1))
  | Base_dList.C_Base_dList_dList_Nil -> mc1
  | _ -> failwith "DT: impossible branch"
))
# 133 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
and v_Vuna_dCompiler_dFrontend_dCanonical_dAst_dencPartList = (fun xs acc -> (Base_dList.C_Base_dList_dList__x58__x58_ ((String.concat "" ["["; (bi_strFromInt (Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_dlenOf xs)); ":"]), ((v_Vuna_dCompiler_dFrontend_dCanonical_dAst_dencPartListGo xs) acc))))
# 137 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
and v_Vuna_dCompiler_dFrontend_dCanonical_dAst_dencPartListGo = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__37, dtb__38) -> ((v_Vuna_dCompiler_dFrontend_dCanonical_dAst_dencInterpPart dtb__37) ((v_Vuna_dCompiler_dFrontend_dCanonical_dAst_dencPartListGo dtb__38) mc1))
  | Base_dList.C_Base_dList_dList_Nil -> mc1
  | _ -> failwith "DT: impossible branch"
))
# 142 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
and v_Vuna_dCompiler_dFrontend_dCanonical_dAst_dencStrExprList = (fun xs acc -> (Base_dList.C_Base_dList_dList__x58__x58_ ((String.concat "" ["["; (bi_strFromInt (Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_dlenOf xs)); ":"]), ((v_Vuna_dCompiler_dFrontend_dCanonical_dAst_dencStrExprListGo xs) acc))))
# 146 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
and v_Vuna_dCompiler_dFrontend_dCanonical_dAst_dencStrExprListGo = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__39, dtb__40) -> (match dtb__39 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__41; Base_dPair.f_Base_dPair_dPair_second = dtb__42 } -> ((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_dencStr dtb__41) ((v_Vuna_dCompiler_dFrontend_dCanonical_dAst_dencExpr dtb__42) ((v_Vuna_dCompiler_dFrontend_dCanonical_dAst_dencStrExprListGo dtb__40) mc1)))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> mc1
  | _ -> failwith "DT: impossible branch"
))
# 205 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
and v_Vuna_dCompiler_dFrontend_dCanonical_dAst_dencInterpPart = (fun mc0 mc1 -> (match mc0 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dInterpPart_IPHole (dtb__43) -> ((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_dencTag 1) ((v_Vuna_dCompiler_dFrontend_dCanonical_dAst_dencExpr dtb__43) mc1))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dInterpPart_IPText (dtb__44) -> ((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_dencTag 0) ((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_dencStr dtb__44) mc1))
  | _ -> failwith "DT: impossible branch"
))
# 220 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
and v_Vuna_dCompiler_dFrontend_dCanonical_dAst_dencDoStmt = (fun mc0 mc1 -> (match mc0 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDoStmt_DExpr (dtb__45, dtb__46) -> ((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_dencTag 1) ((v_Vuna_dCompiler_dFrontend_dCanonical_dAst_dencExpr dtb__45) mc1))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDoStmt_DBind (dtb__47, dtb__48, dtb__49) -> ((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_dencTag 0) ((v_Vuna_dCompiler_dFrontend_dCanonical_dAst_dencPat dtb__47) ((v_Vuna_dCompiler_dFrontend_dCanonical_dAst_dencExpr dtb__48) mc1)))
  | _ -> failwith "DT: impossible branch"
))
# 225 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
and v_Vuna_dCompiler_dFrontend_dCanonical_dAst_dencExpr = (fun mc0 mc1 -> (match mc0 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EFloat (dtb__50, dtb__51) -> ((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_dencTag 22) ((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_dencStr dtb__50) mc1))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EInterp (dtb__52, dtb__53, dtb__54) -> ((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_dencTag 21) ((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_dencBool dtb__52) ((v_Vuna_dCompiler_dFrontend_dCanonical_dAst_dencPartList dtb__53) mc1)))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EAnn (dtb__55, dtb__56, dtb__57) -> ((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_dencTag 20) ((v_Vuna_dCompiler_dFrontend_dCanonical_dAst_dencExpr dtb__55) ((v_Vuna_dCompiler_dFrontend_dCanonical_dAst_dencExpr dtb__56) mc1)))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ESectR (dtb__58, dtb__59, dtb__60) -> ((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_dencTag 19) ((v_Vuna_dCompiler_dFrontend_dCanonical_dAst_dencExpr dtb__58) ((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_dencStr dtb__59) mc1)))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ESectL (dtb__61, dtb__62, dtb__63) -> ((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_dencTag 18) ((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_dencStr dtb__61) ((v_Vuna_dCompiler_dFrontend_dCanonical_dAst_dencExpr dtb__62) mc1)))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ESectOp (dtb__64, dtb__65) -> ((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_dencTag 17) ((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_dencStr dtb__64) mc1))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EBacktick (dtb__66, dtb__67, dtb__68, dtb__69) -> ((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_dencTag 16) ((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_dencStr dtb__66) ((v_Vuna_dCompiler_dFrontend_dCanonical_dAst_dencExpr dtb__67) ((v_Vuna_dCompiler_dFrontend_dCanonical_dAst_dencExpr dtb__68) mc1))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EParen (dtb__70, dtb__71) -> ((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_dencTag 15) ((v_Vuna_dCompiler_dFrontend_dCanonical_dAst_dencExpr dtb__70) mc1))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EInfix (dtb__72, dtb__73, dtb__74, dtb__75) -> ((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_dencTag 14) ((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_dencStr dtb__72) ((v_Vuna_dCompiler_dFrontend_dCanonical_dAst_dencExpr dtb__73) ((v_Vuna_dCompiler_dFrontend_dCanonical_dAst_dencExpr dtb__74) mc1))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EDo (dtb__76, dtb__77) -> ((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_dencTag 13) ((v_Vuna_dCompiler_dFrontend_dCanonical_dAst_dencStmtList dtb__76) mc1))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ERecUpdate (dtb__78, dtb__79, dtb__80) -> ((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_dencTag 12) ((v_Vuna_dCompiler_dFrontend_dCanonical_dAst_dencExpr dtb__78) ((v_Vuna_dCompiler_dFrontend_dCanonical_dAst_dencStrExprList dtb__79) mc1)))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ERecord (dtb__81, dtb__82, dtb__83) -> ((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_dencTag 11) ((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_dencStr dtb__81) ((v_Vuna_dCompiler_dFrontend_dCanonical_dAst_dencStrExprList dtb__82) mc1)))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EField (dtb__84, dtb__85, dtb__86) -> ((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_dencTag 10) ((v_Vuna_dCompiler_dFrontend_dCanonical_dAst_dencExpr dtb__84) ((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_dencStr dtb__85) mc1)))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EIf (dtb__87, dtb__88, dtb__89, dtb__90) -> ((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_dencTag 9) ((v_Vuna_dCompiler_dFrontend_dCanonical_dAst_dencExpr dtb__87) ((v_Vuna_dCompiler_dFrontend_dCanonical_dAst_dencExpr dtb__88) ((v_Vuna_dCompiler_dFrontend_dCanonical_dAst_dencExpr dtb__89) mc1))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ECase (dtb__91, dtb__92, dtb__93) -> ((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_dencTag 8) ((v_Vuna_dCompiler_dFrontend_dCanonical_dAst_dencExpr dtb__91) ((v_Vuna_dCompiler_dFrontend_dCanonical_dAst_dencPatExprList dtb__92) mc1)))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ELocalFun (dtb__94, dtb__95) -> ((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_dencTag 7) ((v_Vuna_dCompiler_dFrontend_dCanonical_dAst_dencClauses dtb__94) mc1))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ELet (dtb__96, dtb__97, dtb__98, dtb__99) -> ((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_dencTag 6) ((v_Vuna_dCompiler_dFrontend_dCanonical_dAst_dencPatExprList dtb__96) ((v_Vuna_dCompiler_dFrontend_dCanonical_dAst_dencExpr dtb__97) ((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_dencBool dtb__98) mc1))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EPi (dtb__100, dtb__101, dtb__102, dtb__103, dtb__104, dtb__105) -> ((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_dencTag 5) ((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_dencStr dtb__100) ((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_dencBool dtb__101) ((v_Vuna_dCompiler_dFrontend_dCanonical_dAst_dencMaybeQty dtb__102) ((v_Vuna_dCompiler_dFrontend_dCanonical_dAst_dencExpr dtb__103) ((v_Vuna_dCompiler_dFrontend_dCanonical_dAst_dencExpr dtb__104) mc1))))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp (dtb__106, dtb__107, dtb__108) -> ((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_dencTag 4) ((v_Vuna_dCompiler_dFrontend_dCanonical_dAst_dencExpr dtb__106) ((v_Vuna_dCompiler_dFrontend_dCanonical_dAst_dencExprList dtb__107) mc1)))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ELam (dtb__109, dtb__110, dtb__111) -> ((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_dencTag 3) ((v_Vuna_dCompiler_dFrontend_dCanonical_dAst_dencStrList dtb__109) ((v_Vuna_dCompiler_dFrontend_dCanonical_dAst_dencExpr dtb__110) mc1)))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EStr (dtb__112, dtb__113) -> ((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_dencTag 2) ((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_dencStr dtb__112) mc1))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EInt (dtb__114, dtb__115) -> ((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_dencTag 1) ((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_dencInt dtb__114) mc1))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__116, dtb__117) -> ((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_dencTag 0) ((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_dencStr dtb__116) mc1))
  | _ -> failwith "DT: impossible branch"
))

# 69 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
let v_Vuna_dCompiler_dFrontend_dCanonical_dAst_dencMaybeExpr = (fun mc0 mc1 -> (match mc0 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__118) -> (Base_dList.C_Base_dList_dList__x58__x58_ ("1", ((v_Vuna_dCompiler_dFrontend_dCanonical_dAst_dencExpr dtb__118) mc1)))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (Base_dList.C_Base_dList_dList__x58__x58_ ("0", mc1))
  | _ -> failwith "DT: impossible branch"
))

# 253 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
let v_Vuna_dCompiler_dFrontend_dCanonical_dAst_dencCtor = (fun mc0 mc1 -> (match mc0 with
  | { Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dCtor_ctorName = dtb__119; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dCtor_ctorType = dtb__120; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dCtor_ctorArity = dtb__121; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dCtor_ctorSpan = dtb__122 } -> ((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_dencTag 0) ((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_dencStr dtb__119) ((v_Vuna_dCompiler_dFrontend_dCanonical_dAst_dencExpr dtb__120) ((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_dencInt dtb__121) mc1))))
  | _ -> failwith "DT: impossible branch"
))

# 164 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
let rec v_Vuna_dCompiler_dFrontend_dCanonical_dAst_dencCtorListGo = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__123, dtb__124) -> ((v_Vuna_dCompiler_dFrontend_dCanonical_dAst_dencCtor dtb__123) ((v_Vuna_dCompiler_dFrontend_dCanonical_dAst_dencCtorListGo dtb__124) mc1))
  | Base_dList.C_Base_dList_dList_Nil -> mc1
  | _ -> failwith "DT: impossible branch"
))

# 160 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
let v_Vuna_dCompiler_dFrontend_dCanonical_dAst_dencCtorList = (fun xs acc -> (Base_dList.C_Base_dList_dList__x58__x58_ ((String.concat "" ["["; (bi_strFromInt (Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_dlenOf xs)); ":"]), ((v_Vuna_dCompiler_dFrontend_dCanonical_dAst_dencCtorListGo xs) acc))))

# 257 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
let v_Vuna_dCompiler_dFrontend_dCanonical_dAst_dencField = (fun mc0 mc1 -> (match mc0 with
  | { Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dField_fieldName = dtb__125; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dField_fieldType = dtb__126; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dField_fieldSpan = dtb__127 } -> ((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_dencTag 0) ((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_dencStr dtb__125) ((v_Vuna_dCompiler_dFrontend_dCanonical_dAst_dencExpr dtb__126) mc1)))
  | _ -> failwith "DT: impossible branch"
))

# 173 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
let rec v_Vuna_dCompiler_dFrontend_dCanonical_dAst_dencFieldListGo = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__128, dtb__129) -> ((v_Vuna_dCompiler_dFrontend_dCanonical_dAst_dencField dtb__128) ((v_Vuna_dCompiler_dFrontend_dCanonical_dAst_dencFieldListGo dtb__129) mc1))
  | Base_dList.C_Base_dList_dList_Nil -> mc1
  | _ -> failwith "DT: impossible branch"
))

# 169 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
let v_Vuna_dCompiler_dFrontend_dCanonical_dAst_dencFieldList = (fun xs acc -> (Base_dList.C_Base_dList_dList__x58__x58_ ((String.concat "" ["["; (bi_strFromInt (Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_dlenOf xs)); ":"]), ((v_Vuna_dCompiler_dFrontend_dCanonical_dAst_dencFieldListGo xs) acc))))

# 261 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
let v_Vuna_dCompiler_dFrontend_dCanonical_dAst_dencTraitParam = (fun mc0 mc1 -> (match mc0 with
  | { Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dTraitParam_traitParamName = dtb__130; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dTraitParam_traitParamKind = dtb__131 } -> ((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_dencTag 0) ((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_dencStr dtb__130) ((v_Vuna_dCompiler_dFrontend_dCanonical_dAst_dencMaybeExpr dtb__131) mc1)))
  | _ -> failwith "DT: impossible branch"
))

# 182 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
let rec v_Vuna_dCompiler_dFrontend_dCanonical_dAst_dencTraitParamListGo = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__132, dtb__133) -> ((v_Vuna_dCompiler_dFrontend_dCanonical_dAst_dencTraitParam dtb__132) ((v_Vuna_dCompiler_dFrontend_dCanonical_dAst_dencTraitParamListGo dtb__133) mc1))
  | Base_dList.C_Base_dList_dList_Nil -> mc1
  | _ -> failwith "DT: impossible branch"
))

# 178 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
let v_Vuna_dCompiler_dFrontend_dCanonical_dAst_dencTraitParamList = (fun xs acc -> (Base_dList.C_Base_dList_dList__x58__x58_ ((String.concat "" ["["; (bi_strFromInt (Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_dlenOf xs)); ":"]), ((v_Vuna_dCompiler_dFrontend_dCanonical_dAst_dencTraitParamListGo xs) acc))))

# 265 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
let v_Vuna_dCompiler_dFrontend_dCanonical_dAst_dencTraitMethod = (fun mc0 mc1 -> (match mc0 with
  | { Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dTraitMethod_traitMethodName = dtb__134; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dTraitMethod_traitMethodType = dtb__135; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dTraitMethod_traitMethodSpan = dtb__136 } -> ((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_dencTag 0) ((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_dencStr dtb__134) ((v_Vuna_dCompiler_dFrontend_dCanonical_dAst_dencExpr dtb__135) mc1)))
  | _ -> failwith "DT: impossible branch"
))

# 191 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
let rec v_Vuna_dCompiler_dFrontend_dCanonical_dAst_dencTraitMethodListGo = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__137, dtb__138) -> ((v_Vuna_dCompiler_dFrontend_dCanonical_dAst_dencTraitMethod dtb__137) ((v_Vuna_dCompiler_dFrontend_dCanonical_dAst_dencTraitMethodListGo dtb__138) mc1))
  | Base_dList.C_Base_dList_dList_Nil -> mc1
  | _ -> failwith "DT: impossible branch"
))

# 187 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
let v_Vuna_dCompiler_dFrontend_dCanonical_dAst_dencTraitMethodList = (fun xs acc -> (Base_dList.C_Base_dList_dList__x58__x58_ ((String.concat "" ["["; (bi_strFromInt (Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_dlenOf xs)); ":"]), ((v_Vuna_dCompiler_dFrontend_dCanonical_dAst_dencTraitMethodListGo xs) acc))))

# 196 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
let rec v_Vuna_dCompiler_dFrontend_dCanonical_dAst_dencDecls = (fun xs acc -> (Base_dList.C_Base_dList_dList__x58__x58_ ((String.concat "" ["["; (bi_strFromInt (Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_dlenOf xs)); ":"]), ((v_Vuna_dCompiler_dFrontend_dCanonical_dAst_dencDeclsGo xs) acc))))
# 200 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
and v_Vuna_dCompiler_dFrontend_dCanonical_dAst_dencDeclsGo = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__139, dtb__140) -> ((v_Vuna_dCompiler_dFrontend_dCanonical_dAst_dencDecl dtb__139) ((v_Vuna_dCompiler_dFrontend_dCanonical_dAst_dencDeclsGo dtb__140) mc1))
  | Base_dList.C_Base_dList_dList_Nil -> mc1
  | _ -> failwith "DT: impossible branch"
))
# 269 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
and v_Vuna_dCompiler_dFrontend_dCanonical_dAst_dencDecl = (fun mc0 mc1 -> (match mc0 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DInstance (dtb__141, dtb__142, dtb__143, dtb__144) -> ((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_dencTag 7) ((v_Vuna_dCompiler_dFrontend_dCanonical_dAst_dencExprList dtb__141) ((v_Vuna_dCompiler_dFrontend_dCanonical_dAst_dencExpr dtb__142) ((v_Vuna_dCompiler_dFrontend_dCanonical_dAst_dencDecls dtb__143) mc1))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DTrait (dtb__145, dtb__146, dtb__147, dtb__148, dtb__149) -> ((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_dencTag 6) ((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_dencStr dtb__145) ((v_Vuna_dCompiler_dFrontend_dCanonical_dAst_dencTraitParamList dtb__146) ((v_Vuna_dCompiler_dFrontend_dCanonical_dAst_dencExprList dtb__147) ((v_Vuna_dCompiler_dFrontend_dCanonical_dAst_dencTraitMethodList dtb__148) mc1)))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DRecord (dtb__150, dtb__151, dtb__152, dtb__153, dtb__154, dtb__155, dtb__156, dtb__157) -> ((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_dencTag 5) ((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_dencStr dtb__150) ((v_Vuna_dCompiler_dFrontend_dCanonical_dAst_dencStrList dtb__151) ((v_Vuna_dCompiler_dFrontend_dCanonical_dAst_dencFieldList dtb__152) ((v_Vuna_dCompiler_dFrontend_dCanonical_dAst_dencStrList dtb__153) ((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_dencBool dtb__154) ((v_Vuna_dCompiler_dFrontend_dCanonical_dAst_dencReprTier dtb__155) ((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_dencBool dtb__156) mc1))))))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DFun (dtb__158, dtb__159, dtb__160, dtb__161) -> ((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_dencTag 4) ((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_dencStr dtb__158) ((v_Vuna_dCompiler_dFrontend_dCanonical_dAst_dencPatList dtb__159) ((v_Vuna_dCompiler_dFrontend_dCanonical_dAst_dencExpr dtb__160) mc1))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DSig (dtb__162, dtb__163, dtb__164, dtb__165) -> ((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_dencTag 3) ((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_dencStr dtb__162) ((v_Vuna_dCompiler_dFrontend_dCanonical_dAst_dencExprList dtb__163) ((v_Vuna_dCompiler_dFrontend_dCanonical_dAst_dencExpr dtb__164) mc1))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DExtern (dtb__166, dtb__167, dtb__168, dtb__169) -> ((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_dencTag 2) ((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_dencStr dtb__166) ((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_dencStr dtb__167) ((v_Vuna_dCompiler_dFrontend_dCanonical_dAst_dencExpr dtb__168) mc1))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DAxiom (dtb__170, dtb__171, dtb__172) -> ((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_dencTag 1) ((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_dencStr dtb__170) ((v_Vuna_dCompiler_dFrontend_dCanonical_dAst_dencExpr dtb__171) mc1)))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DData (dtb__173, dtb__174, dtb__175, dtb__176, dtb__177, dtb__178, dtb__179, dtb__180, dtb__181) -> ((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_dencTag 0) ((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_dencStr dtb__173) ((v_Vuna_dCompiler_dFrontend_dCanonical_dAst_dencStrList dtb__174) ((v_Vuna_dCompiler_dFrontend_dCanonical_dAst_dencExpr dtb__175) ((v_Vuna_dCompiler_dFrontend_dCanonical_dAst_dencCtorList dtb__176) ((v_Vuna_dCompiler_dFrontend_dCanonical_dAst_dencStrList dtb__177) ((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_dencBool dtb__178) ((v_Vuna_dCompiler_dFrontend_dCanonical_dAst_dencReprTier dtb__179) ((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_dencBool dtb__180) mc1)))))))))
  | _ -> failwith "DT: impossible branch"
))

# 290 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
let v_Vuna_dCompiler_dFrontend_dCanonical_dAst_ddecQty = (fun fuel bytes -> (if (fuel <= 0) then Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing else ((fun nd_uscrut2 -> (match nd_uscrut2 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__182) -> (match dtb__182 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__183; Base_dPair.f_Base_dPair_dPair_second = dtb__184 } -> (if (dtb__183 = 0) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Base_dPair.f_Base_dPair_dPair_first = Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dQty_Q0; Base_dPair.f_Base_dPair_dPair_second = dtb__184 })) else (if (dtb__183 = 1) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Base_dPair.f_Base_dPair_dPair_first = Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dQty_Q1; Base_dPair.f_Base_dPair_dPair_second = dtb__184 })) else Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_ddecTag fuel) bytes))))

# 300 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
let v_Vuna_dCompiler_dFrontend_dCanonical_dAst_ddecReprTier = (fun fuel bytes -> (if (fuel <= 0) then Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing else ((fun nd_uscrut2 -> (match nd_uscrut2 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__185) -> (match dtb__185 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__186; Base_dPair.f_Base_dPair_dPair_second = dtb__187 } -> (if (dtb__186 = 0) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Base_dPair.f_Base_dPair_dPair_first = Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dReprTier_ReprAuto; Base_dPair.f_Base_dPair_dPair_second = dtb__187 })) else (if (dtb__186 = 1) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Base_dPair.f_Base_dPair_dPair_first = Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dReprTier_ReprAlias; Base_dPair.f_Base_dPair_dPair_second = dtb__187 })) else (if (dtb__186 = 2) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Base_dPair.f_Base_dPair_dPair_first = Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dReprTier_ReprBoxed; Base_dPair.f_Base_dPair_dPair_second = dtb__187 })) else Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing)))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_ddecTag fuel) bytes))))

# 311 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
let v_Vuna_dCompiler_dFrontend_dCanonical_dAst_ddecMaybeQty = (fun fuel bytes -> (((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_ddecMaybe v_Vuna_dCompiler_dFrontend_dCanonical_dAst_ddecQty) fuel) bytes))

# 683 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
let rec v_Vuna_dCompiler_dFrontend_dCanonical_dAst_ddecListDigits = (fun fuel acc c -> (if (fuel <= 0) then Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing else (match (Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_dcurChar c) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__188) -> (if (dtb__188 = 58) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Base_dPair.f_Base_dPair_dPair_first = acc; Base_dPair.f_Base_dPair_dPair_second = (Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_dcurSkip c) })) else (if (if (dtb__188 >= 48) then (dtb__188 <= 57) else false) then (((v_Vuna_dCompiler_dFrontend_dCanonical_dAst_ddecListDigits (fuel - 1)) ((acc * 10) + (dtb__188 - 48))) (Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_dcurSkip c)) else Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing))
  | _ -> failwith "DT: impossible branch"
)))

# 676 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
let v_Vuna_dCompiler_dFrontend_dCanonical_dAst_ddecListHead = (fun fuel c -> (if (fuel <= 0) then Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing else ((fun nd_uscrut2 -> (match nd_uscrut2 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__189) -> (if (dtb__189 = 91) then (((v_Vuna_dCompiler_dFrontend_dCanonical_dAst_ddecListDigits (fuel - 1)) 0) (Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_dcurSkip c)) else Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)) (Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_dcurChar c))))

# 333 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
let rec v_Vuna_dCompiler_dFrontend_dCanonical_dAst_ddecPat = (fun fuel bytes -> (if (fuel <= 0) then Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing else ((fun nd_uscrut2 -> (match nd_uscrut2 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__190) -> (match dtb__190 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__191; Base_dPair.f_Base_dPair_dPair_second = dtb__192 } -> (if (dtb__191 = 0) then ((fun nd_uscrut9 -> (match nd_uscrut9 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__193) -> (match dtb__193 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__194; Base_dPair.f_Base_dPair_dPair_second = dtb__195 } -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PVar (dtb__194, v_Vuna_dCompiler_dFrontend_dCanonical_dAst_dnoSpan)); Base_dPair.f_Base_dPair_dPair_second = dtb__195 }))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_ddecStr (fuel - 1)) dtb__192)) else (if (dtb__191 = 1) then ((fun nd_uscrut9 -> (match nd_uscrut9 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__196) -> (match dtb__196 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__197; Base_dPair.f_Base_dPair_dPair_second = dtb__198 } -> ((fun nd_uscrut16 -> (match nd_uscrut16 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__199) -> (match dtb__199 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__200; Base_dPair.f_Base_dPair_dPair_second = dtb__201 } -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PAs (dtb__197, dtb__200, v_Vuna_dCompiler_dFrontend_dCanonical_dAst_dnoSpan)); Base_dPair.f_Base_dPair_dPair_second = dtb__201 }))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dFrontend_dCanonical_dAst_ddecPat (fuel - 1)) dtb__198))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_ddecStr (fuel - 1)) dtb__192)) else (if (dtb__191 = 2) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PWild (v_Vuna_dCompiler_dFrontend_dCanonical_dAst_dnoSpan)); Base_dPair.f_Base_dPair_dPair_second = dtb__192 })) else (if (dtb__191 = 3) then ((fun nd_uscrut9 -> (match nd_uscrut9 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__202) -> (match dtb__202 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__203; Base_dPair.f_Base_dPair_dPair_second = dtb__204 } -> ((fun nd_uscrut16 -> (match nd_uscrut16 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__205) -> (match dtb__205 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__206; Base_dPair.f_Base_dPair_dPair_second = dtb__207 } -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PCon (dtb__203, dtb__206, v_Vuna_dCompiler_dFrontend_dCanonical_dAst_dnoSpan)); Base_dPair.f_Base_dPair_dPair_second = dtb__207 }))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dFrontend_dCanonical_dAst_ddecPatList (fuel - 1)) dtb__204))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_ddecStr (fuel - 1)) dtb__192)) else (if (dtb__191 = 4) then ((fun nd_uscrut9 -> (match nd_uscrut9 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__208) -> (match dtb__208 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__209; Base_dPair.f_Base_dPair_dPair_second = dtb__210 } -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PInt (dtb__209, v_Vuna_dCompiler_dFrontend_dCanonical_dAst_dnoSpan)); Base_dPair.f_Base_dPair_dPair_second = dtb__210 }))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_ddecInt (fuel - 1)) dtb__192)) else (if (dtb__191 = 5) then ((fun nd_uscrut9 -> (match nd_uscrut9 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__211) -> (match dtb__211 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__212; Base_dPair.f_Base_dPair_dPair_second = dtb__213 } -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PStr (dtb__212, v_Vuna_dCompiler_dFrontend_dCanonical_dAst_dnoSpan)); Base_dPair.f_Base_dPair_dPair_second = dtb__213 }))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_ddecStr (fuel - 1)) dtb__192)) else (if (dtb__191 = 6) then ((fun nd_uscrut9 -> (match nd_uscrut9 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__214) -> (match dtb__214 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__215; Base_dPair.f_Base_dPair_dPair_second = dtb__216 } -> ((fun nd_uscrut16 -> (match nd_uscrut16 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__217) -> (match dtb__217 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__218; Base_dPair.f_Base_dPair_dPair_second = dtb__219 } -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PRecord (dtb__215, dtb__218, v_Vuna_dCompiler_dFrontend_dCanonical_dAst_dnoSpan)); Base_dPair.f_Base_dPair_dPair_second = dtb__219 }))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) (((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_ddecList v_Vuna_dCompiler_dFrontend_dCanonical_dAst_ddecStrPat) (fuel - 1)) dtb__216))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_ddecStr (fuel - 1)) dtb__192)) else Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing)))))))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_ddecTag fuel) bytes))))
# 666 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
and v_Vuna_dCompiler_dFrontend_dCanonical_dAst_ddecStrPat = (fun fuel bytes -> (if (fuel <= 0) then Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing else ((fun nd_uscrut2 -> (match nd_uscrut2 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__220) -> (match dtb__220 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__221; Base_dPair.f_Base_dPair_dPair_second = dtb__222 } -> ((fun nd_uscrut9 -> (match nd_uscrut9 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__223) -> (match dtb__223 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__224; Base_dPair.f_Base_dPair_dPair_second = dtb__225 } -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Base_dPair.f_Base_dPair_dPair_first = { Base_dPair.f_Base_dPair_dPair_first = dtb__221; Base_dPair.f_Base_dPair_dPair_second = dtb__224 }; Base_dPair.f_Base_dPair_dPair_second = dtb__225 }))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dFrontend_dCanonical_dAst_ddecPat (fuel - 1)) dtb__222))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_ddecStr (fuel - 1)) bytes))))
# 713 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
and v_Vuna_dCompiler_dFrontend_dCanonical_dAst_ddecPatList = (fun fuel bytes -> (if (fuel <= 0) then Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing else ((fun nd_uscrut2 -> (match nd_uscrut2 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__226) -> (match dtb__226 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__227; Base_dPair.f_Base_dPair_dPair_second = dtb__228 } -> ((((v_Vuna_dCompiler_dFrontend_dCanonical_dAst_ddecPatListItems (fuel - 1)) dtb__227) dtb__228) Base_dList.C_Base_dList_dList_Nil)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dFrontend_dCanonical_dAst_ddecListHead fuel) bytes))))
# 720 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
and v_Vuna_dCompiler_dFrontend_dCanonical_dAst_ddecPatListItems = (fun fuel n bytes acc -> (if (fuel <= 0) then Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing else (if (n <= 0) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Base_dPair.f_Base_dPair_dPair_first = (Base_dList.v_Base_dList_dreverse acc); Base_dPair.f_Base_dPair_dPair_second = bytes })) else ((fun nd_uscrut4 -> (match nd_uscrut4 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__229) -> (match dtb__229 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__230; Base_dPair.f_Base_dPair_dPair_second = dtb__231 } -> ((((v_Vuna_dCompiler_dFrontend_dCanonical_dAst_ddecPatListItems (fuel - 1)) (n - 1)) dtb__231) (Base_dList.C_Base_dList_dList__x58__x58_ (dtb__230, acc)))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dFrontend_dCanonical_dAst_ddecPat (fuel - 1)) bytes)))))

# 319 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
let rec v_Vuna_dCompiler_dFrontend_dCanonical_dAst_ddecInterpPart = (fun fuel bytes -> (if (fuel <= 0) then Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing else ((fun nd_uscrut2 -> (match nd_uscrut2 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__232) -> (match dtb__232 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__233; Base_dPair.f_Base_dPair_dPair_second = dtb__234 } -> (if (dtb__233 = 0) then ((fun nd_uscrut9 -> (match nd_uscrut9 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__235) -> (match dtb__235 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__236; Base_dPair.f_Base_dPair_dPair_second = dtb__237 } -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dInterpPart_IPText (dtb__236)); Base_dPair.f_Base_dPair_dPair_second = dtb__237 }))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_ddecStr (fuel - 1)) dtb__234)) else (if (dtb__233 = 1) then ((fun nd_uscrut9 -> (match nd_uscrut9 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__238) -> (match dtb__238 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__239; Base_dPair.f_Base_dPair_dPair_second = dtb__240 } -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dInterpPart_IPHole (dtb__239)); Base_dPair.f_Base_dPair_dPair_second = dtb__240 }))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dFrontend_dCanonical_dAst_ddecExpr (fuel - 1)) dtb__234)) else Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_ddecTag fuel) bytes))))
# 366 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
and v_Vuna_dCompiler_dFrontend_dCanonical_dAst_ddecDoStmt = (fun fuel bytes -> (if (fuel <= 0) then Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing else ((fun nd_uscrut2 -> (match nd_uscrut2 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__241) -> (match dtb__241 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__242; Base_dPair.f_Base_dPair_dPair_second = dtb__243 } -> (if (dtb__242 = 0) then ((fun nd_uscrut9 -> (match nd_uscrut9 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__244) -> (match dtb__244 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__245; Base_dPair.f_Base_dPair_dPair_second = dtb__246 } -> ((fun nd_uscrut16 -> (match nd_uscrut16 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__247) -> (match dtb__247 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__248; Base_dPair.f_Base_dPair_dPair_second = dtb__249 } -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDoStmt_DBind (dtb__245, dtb__248, v_Vuna_dCompiler_dFrontend_dCanonical_dAst_dnoSpan)); Base_dPair.f_Base_dPair_dPair_second = dtb__249 }))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dFrontend_dCanonical_dAst_ddecExpr (fuel - 1)) dtb__246))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dFrontend_dCanonical_dAst_ddecPat (fuel - 1)) dtb__243)) else (if (dtb__242 = 1) then ((fun nd_uscrut9 -> (match nd_uscrut9 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__250) -> (match dtb__250 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__251; Base_dPair.f_Base_dPair_dPair_second = dtb__252 } -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDoStmt_DExpr (dtb__251, v_Vuna_dCompiler_dFrontend_dCanonical_dAst_dnoSpan)); Base_dPair.f_Base_dPair_dPair_second = dtb__252 }))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dFrontend_dCanonical_dAst_ddecExpr (fuel - 1)) dtb__243)) else Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_ddecTag fuel) bytes))))
# 382 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
and v_Vuna_dCompiler_dFrontend_dCanonical_dAst_ddecExpr = (fun fuel bytes -> (if (fuel <= 0) then Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing else ((fun nd_uscrut2 -> (match nd_uscrut2 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__253) -> (match dtb__253 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__254; Base_dPair.f_Base_dPair_dPair_second = dtb__255 } -> (if (dtb__254 = 0) then ((fun nd_uscrut9 -> (match nd_uscrut9 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__256) -> (match dtb__256 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__257; Base_dPair.f_Base_dPair_dPair_second = dtb__258 } -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__257, v_Vuna_dCompiler_dFrontend_dCanonical_dAst_dnoSpan)); Base_dPair.f_Base_dPair_dPair_second = dtb__258 }))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_ddecStr (fuel - 1)) dtb__255)) else (if (dtb__254 = 1) then ((fun nd_uscrut9 -> (match nd_uscrut9 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__259) -> (match dtb__259 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__260; Base_dPair.f_Base_dPair_dPair_second = dtb__261 } -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EInt (dtb__260, v_Vuna_dCompiler_dFrontend_dCanonical_dAst_dnoSpan)); Base_dPair.f_Base_dPair_dPair_second = dtb__261 }))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_ddecInt (fuel - 1)) dtb__255)) else (if (dtb__254 = 2) then ((fun nd_uscrut9 -> (match nd_uscrut9 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__262) -> (match dtb__262 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__263; Base_dPair.f_Base_dPair_dPair_second = dtb__264 } -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EStr (dtb__263, v_Vuna_dCompiler_dFrontend_dCanonical_dAst_dnoSpan)); Base_dPair.f_Base_dPair_dPair_second = dtb__264 }))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_ddecStr (fuel - 1)) dtb__255)) else (if (dtb__254 = 3) then ((fun nd_uscrut9 -> (match nd_uscrut9 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__265) -> (match dtb__265 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__266; Base_dPair.f_Base_dPair_dPair_second = dtb__267 } -> ((fun nd_uscrut16 -> (match nd_uscrut16 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__268) -> (match dtb__268 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__269; Base_dPair.f_Base_dPair_dPair_second = dtb__270 } -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ELam (dtb__266, dtb__269, v_Vuna_dCompiler_dFrontend_dCanonical_dAst_dnoSpan)); Base_dPair.f_Base_dPair_dPair_second = dtb__270 }))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dFrontend_dCanonical_dAst_ddecExpr (fuel - 1)) dtb__267))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) (((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_ddecList Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_ddecStr) (fuel - 1)) dtb__255)) else (if (dtb__254 = 4) then ((fun nd_uscrut9 -> (match nd_uscrut9 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__271) -> (match dtb__271 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__272; Base_dPair.f_Base_dPair_dPair_second = dtb__273 } -> ((fun nd_uscrut16 -> (match nd_uscrut16 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__274) -> (match dtb__274 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__275; Base_dPair.f_Base_dPair_dPair_second = dtb__276 } -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp (dtb__272, dtb__275, v_Vuna_dCompiler_dFrontend_dCanonical_dAst_dnoSpan)); Base_dPair.f_Base_dPair_dPair_second = dtb__276 }))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dFrontend_dCanonical_dAst_ddecExprList (fuel - 1)) dtb__273))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dFrontend_dCanonical_dAst_ddecExpr (fuel - 1)) dtb__255)) else (if (dtb__254 = 5) then ((fun nd_uscrut9 -> (match nd_uscrut9 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__277) -> (match dtb__277 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__278; Base_dPair.f_Base_dPair_dPair_second = dtb__279 } -> ((fun nd_uscrut16 -> (match nd_uscrut16 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__280) -> (match dtb__280 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__281; Base_dPair.f_Base_dPair_dPair_second = dtb__282 } -> ((fun nd_uscrut23 -> (match nd_uscrut23 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__283) -> (match dtb__283 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__284; Base_dPair.f_Base_dPair_dPair_second = dtb__285 } -> ((fun nd_uscrut30 -> (match nd_uscrut30 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__286) -> (match dtb__286 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__287; Base_dPair.f_Base_dPair_dPair_second = dtb__288 } -> ((fun nd_uscrut37 -> (match nd_uscrut37 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__289) -> (match dtb__289 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__290; Base_dPair.f_Base_dPair_dPair_second = dtb__291 } -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EPi (dtb__278, dtb__281, dtb__284, dtb__287, dtb__290, v_Vuna_dCompiler_dFrontend_dCanonical_dAst_dnoSpan)); Base_dPair.f_Base_dPair_dPair_second = dtb__291 }))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dFrontend_dCanonical_dAst_ddecExpr (fuel - 1)) dtb__288))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dFrontend_dCanonical_dAst_ddecExpr (fuel - 1)) dtb__285))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) (((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_ddecMaybe v_Vuna_dCompiler_dFrontend_dCanonical_dAst_ddecQty) (fuel - 1)) dtb__282))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_ddecBool (fuel - 1)) dtb__279))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_ddecStr (fuel - 1)) dtb__255)) else (if (dtb__254 = 6) then ((fun nd_uscrut9 -> (match nd_uscrut9 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__292) -> (match dtb__292 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__293; Base_dPair.f_Base_dPair_dPair_second = dtb__294 } -> ((fun nd_uscrut16 -> (match nd_uscrut16 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__295) -> (match dtb__295 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__296; Base_dPair.f_Base_dPair_dPair_second = dtb__297 } -> ((fun nd_uscrut23 -> (match nd_uscrut23 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__298) -> (match dtb__298 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__299; Base_dPair.f_Base_dPair_dPair_second = dtb__300 } -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ELet (dtb__293, dtb__296, dtb__299, v_Vuna_dCompiler_dFrontend_dCanonical_dAst_dnoSpan)); Base_dPair.f_Base_dPair_dPair_second = dtb__300 }))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_ddecBool (fuel - 1)) dtb__297))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dFrontend_dCanonical_dAst_ddecExpr (fuel - 1)) dtb__294))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) (((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_ddecList v_Vuna_dCompiler_dFrontend_dCanonical_dAst_ddecPatExpr) (fuel - 1)) dtb__255)) else (if (dtb__254 = 7) then ((fun nd_uscrut9 -> (match nd_uscrut9 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__301) -> (match dtb__301 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__302; Base_dPair.f_Base_dPair_dPair_second = dtb__303 } -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ELocalFun (dtb__302, v_Vuna_dCompiler_dFrontend_dCanonical_dAst_dnoSpan)); Base_dPair.f_Base_dPair_dPair_second = dtb__303 }))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) (((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_ddecList v_Vuna_dCompiler_dFrontend_dCanonical_dAst_ddecClause) (fuel - 1)) dtb__255)) else (if (dtb__254 = 8) then ((fun nd_uscrut9 -> (match nd_uscrut9 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__304) -> (match dtb__304 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__305; Base_dPair.f_Base_dPair_dPair_second = dtb__306 } -> ((fun nd_uscrut16 -> (match nd_uscrut16 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__307) -> (match dtb__307 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__308; Base_dPair.f_Base_dPair_dPair_second = dtb__309 } -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ECase (dtb__305, dtb__308, v_Vuna_dCompiler_dFrontend_dCanonical_dAst_dnoSpan)); Base_dPair.f_Base_dPair_dPair_second = dtb__309 }))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) (((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_ddecList v_Vuna_dCompiler_dFrontend_dCanonical_dAst_ddecPatExpr) (fuel - 1)) dtb__306))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dFrontend_dCanonical_dAst_ddecExpr (fuel - 1)) dtb__255)) else (if (dtb__254 = 9) then ((fun nd_uscrut9 -> (match nd_uscrut9 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__310) -> (match dtb__310 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__311; Base_dPair.f_Base_dPair_dPair_second = dtb__312 } -> ((fun nd_uscrut16 -> (match nd_uscrut16 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__313) -> (match dtb__313 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__314; Base_dPair.f_Base_dPair_dPair_second = dtb__315 } -> ((fun nd_uscrut23 -> (match nd_uscrut23 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__316) -> (match dtb__316 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__317; Base_dPair.f_Base_dPair_dPair_second = dtb__318 } -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EIf (dtb__311, dtb__314, dtb__317, v_Vuna_dCompiler_dFrontend_dCanonical_dAst_dnoSpan)); Base_dPair.f_Base_dPair_dPair_second = dtb__318 }))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dFrontend_dCanonical_dAst_ddecExpr (fuel - 1)) dtb__315))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dFrontend_dCanonical_dAst_ddecExpr (fuel - 1)) dtb__312))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dFrontend_dCanonical_dAst_ddecExpr (fuel - 1)) dtb__255)) else (if (dtb__254 = 10) then ((fun nd_uscrut9 -> (match nd_uscrut9 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__319) -> (match dtb__319 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__320; Base_dPair.f_Base_dPair_dPair_second = dtb__321 } -> ((fun nd_uscrut16 -> (match nd_uscrut16 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__322) -> (match dtb__322 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__323; Base_dPair.f_Base_dPair_dPair_second = dtb__324 } -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EField (dtb__320, dtb__323, v_Vuna_dCompiler_dFrontend_dCanonical_dAst_dnoSpan)); Base_dPair.f_Base_dPair_dPair_second = dtb__324 }))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_ddecStr (fuel - 1)) dtb__321))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dFrontend_dCanonical_dAst_ddecExpr (fuel - 1)) dtb__255)) else (if (dtb__254 = 11) then ((fun nd_uscrut9 -> (match nd_uscrut9 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__325) -> (match dtb__325 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__326; Base_dPair.f_Base_dPair_dPair_second = dtb__327 } -> ((fun nd_uscrut16 -> (match nd_uscrut16 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__328) -> (match dtb__328 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__329; Base_dPair.f_Base_dPair_dPair_second = dtb__330 } -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ERecord (dtb__326, dtb__329, v_Vuna_dCompiler_dFrontend_dCanonical_dAst_dnoSpan)); Base_dPair.f_Base_dPair_dPair_second = dtb__330 }))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) (((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_ddecList v_Vuna_dCompiler_dFrontend_dCanonical_dAst_ddecStrExpr) (fuel - 1)) dtb__327))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_ddecStr (fuel - 1)) dtb__255)) else (if (dtb__254 = 12) then ((fun nd_uscrut9 -> (match nd_uscrut9 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__331) -> (match dtb__331 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__332; Base_dPair.f_Base_dPair_dPair_second = dtb__333 } -> ((fun nd_uscrut16 -> (match nd_uscrut16 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__334) -> (match dtb__334 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__335; Base_dPair.f_Base_dPair_dPair_second = dtb__336 } -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ERecUpdate (dtb__332, dtb__335, v_Vuna_dCompiler_dFrontend_dCanonical_dAst_dnoSpan)); Base_dPair.f_Base_dPair_dPair_second = dtb__336 }))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) (((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_ddecList v_Vuna_dCompiler_dFrontend_dCanonical_dAst_ddecStrExpr) (fuel - 1)) dtb__333))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dFrontend_dCanonical_dAst_ddecExpr (fuel - 1)) dtb__255)) else (if (dtb__254 = 13) then ((fun nd_uscrut9 -> (match nd_uscrut9 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__337) -> (match dtb__337 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__338; Base_dPair.f_Base_dPair_dPair_second = dtb__339 } -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EDo (dtb__338, v_Vuna_dCompiler_dFrontend_dCanonical_dAst_dnoSpan)); Base_dPair.f_Base_dPair_dPair_second = dtb__339 }))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) (((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_ddecList v_Vuna_dCompiler_dFrontend_dCanonical_dAst_ddecDoStmt) (fuel - 1)) dtb__255)) else (if (dtb__254 = 14) then ((fun nd_uscrut9 -> (match nd_uscrut9 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__340) -> (match dtb__340 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__341; Base_dPair.f_Base_dPair_dPair_second = dtb__342 } -> ((fun nd_uscrut16 -> (match nd_uscrut16 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__343) -> (match dtb__343 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__344; Base_dPair.f_Base_dPair_dPair_second = dtb__345 } -> ((fun nd_uscrut23 -> (match nd_uscrut23 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__346) -> (match dtb__346 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__347; Base_dPair.f_Base_dPair_dPair_second = dtb__348 } -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EInfix (dtb__341, dtb__344, dtb__347, v_Vuna_dCompiler_dFrontend_dCanonical_dAst_dnoSpan)); Base_dPair.f_Base_dPair_dPair_second = dtb__348 }))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dFrontend_dCanonical_dAst_ddecExpr (fuel - 1)) dtb__345))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dFrontend_dCanonical_dAst_ddecExpr (fuel - 1)) dtb__342))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_ddecStr (fuel - 1)) dtb__255)) else (if (dtb__254 = 15) then ((fun nd_uscrut9 -> (match nd_uscrut9 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__349) -> (match dtb__349 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__350; Base_dPair.f_Base_dPair_dPair_second = dtb__351 } -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EParen (dtb__350, v_Vuna_dCompiler_dFrontend_dCanonical_dAst_dnoSpan)); Base_dPair.f_Base_dPair_dPair_second = dtb__351 }))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dFrontend_dCanonical_dAst_ddecExpr (fuel - 1)) dtb__255)) else (if (dtb__254 = 16) then ((fun nd_uscrut9 -> (match nd_uscrut9 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__352) -> (match dtb__352 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__353; Base_dPair.f_Base_dPair_dPair_second = dtb__354 } -> ((fun nd_uscrut16 -> (match nd_uscrut16 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__355) -> (match dtb__355 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__356; Base_dPair.f_Base_dPair_dPair_second = dtb__357 } -> ((fun nd_uscrut23 -> (match nd_uscrut23 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__358) -> (match dtb__358 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__359; Base_dPair.f_Base_dPair_dPair_second = dtb__360 } -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EBacktick (dtb__353, dtb__356, dtb__359, v_Vuna_dCompiler_dFrontend_dCanonical_dAst_dnoSpan)); Base_dPair.f_Base_dPair_dPair_second = dtb__360 }))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dFrontend_dCanonical_dAst_ddecExpr (fuel - 1)) dtb__357))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dFrontend_dCanonical_dAst_ddecExpr (fuel - 1)) dtb__354))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_ddecStr (fuel - 1)) dtb__255)) else (if (dtb__254 = 17) then ((fun nd_uscrut9 -> (match nd_uscrut9 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__361) -> (match dtb__361 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__362; Base_dPair.f_Base_dPair_dPair_second = dtb__363 } -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ESectOp (dtb__362, v_Vuna_dCompiler_dFrontend_dCanonical_dAst_dnoSpan)); Base_dPair.f_Base_dPair_dPair_second = dtb__363 }))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_ddecStr (fuel - 1)) dtb__255)) else (if (dtb__254 = 18) then ((fun nd_uscrut9 -> (match nd_uscrut9 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__364) -> (match dtb__364 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__365; Base_dPair.f_Base_dPair_dPair_second = dtb__366 } -> ((fun nd_uscrut16 -> (match nd_uscrut16 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__367) -> (match dtb__367 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__368; Base_dPair.f_Base_dPair_dPair_second = dtb__369 } -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ESectL (dtb__365, dtb__368, v_Vuna_dCompiler_dFrontend_dCanonical_dAst_dnoSpan)); Base_dPair.f_Base_dPair_dPair_second = dtb__369 }))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dFrontend_dCanonical_dAst_ddecExpr (fuel - 1)) dtb__366))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_ddecStr (fuel - 1)) dtb__255)) else (if (dtb__254 = 19) then ((fun nd_uscrut9 -> (match nd_uscrut9 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__370) -> (match dtb__370 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__371; Base_dPair.f_Base_dPair_dPair_second = dtb__372 } -> ((fun nd_uscrut16 -> (match nd_uscrut16 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__373) -> (match dtb__373 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__374; Base_dPair.f_Base_dPair_dPair_second = dtb__375 } -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ESectR (dtb__371, dtb__374, v_Vuna_dCompiler_dFrontend_dCanonical_dAst_dnoSpan)); Base_dPair.f_Base_dPair_dPair_second = dtb__375 }))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_ddecStr (fuel - 1)) dtb__372))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dFrontend_dCanonical_dAst_ddecExpr (fuel - 1)) dtb__255)) else (if (dtb__254 = 20) then ((fun nd_uscrut9 -> (match nd_uscrut9 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__376) -> (match dtb__376 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__377; Base_dPair.f_Base_dPair_dPair_second = dtb__378 } -> ((fun nd_uscrut16 -> (match nd_uscrut16 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__379) -> (match dtb__379 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__380; Base_dPair.f_Base_dPair_dPair_second = dtb__381 } -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EAnn (dtb__377, dtb__380, v_Vuna_dCompiler_dFrontend_dCanonical_dAst_dnoSpan)); Base_dPair.f_Base_dPair_dPair_second = dtb__381 }))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dFrontend_dCanonical_dAst_ddecExpr (fuel - 1)) dtb__378))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dFrontend_dCanonical_dAst_ddecExpr (fuel - 1)) dtb__255)) else (if (dtb__254 = 21) then ((fun nd_uscrut9 -> (match nd_uscrut9 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__382) -> (match dtb__382 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__383; Base_dPair.f_Base_dPair_dPair_second = dtb__384 } -> ((fun nd_uscrut16 -> (match nd_uscrut16 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__385) -> (match dtb__385 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__386; Base_dPair.f_Base_dPair_dPair_second = dtb__387 } -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EInterp (dtb__383, dtb__386, v_Vuna_dCompiler_dFrontend_dCanonical_dAst_dnoSpan)); Base_dPair.f_Base_dPair_dPair_second = dtb__387 }))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) (((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_ddecList v_Vuna_dCompiler_dFrontend_dCanonical_dAst_ddecInterpPart) (fuel - 1)) dtb__384))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_ddecBool (fuel - 1)) dtb__255)) else (if (dtb__254 = 22) then ((fun nd_uscrut9 -> (match nd_uscrut9 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__388) -> (match dtb__388 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__389; Base_dPair.f_Base_dPair_dPair_second = dtb__390 } -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EFloat (dtb__389, v_Vuna_dCompiler_dFrontend_dCanonical_dAst_dnoSpan)); Base_dPair.f_Base_dPair_dPair_second = dtb__390 }))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_ddecStr (fuel - 1)) dtb__255)) else Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing)))))))))))))))))))))))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_ddecTag fuel) bytes))))
# 639 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
and v_Vuna_dCompiler_dFrontend_dCanonical_dAst_ddecPatExpr = (fun fuel bytes -> (if (fuel <= 0) then Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing else ((fun nd_uscrut2 -> (match nd_uscrut2 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__391) -> (match dtb__391 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__392; Base_dPair.f_Base_dPair_dPair_second = dtb__393 } -> ((fun nd_uscrut9 -> (match nd_uscrut9 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__394) -> (match dtb__394 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__395; Base_dPair.f_Base_dPair_dPair_second = dtb__396 } -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Base_dPair.f_Base_dPair_dPair_first = { Base_dPair.f_Base_dPair_dPair_first = dtb__392; Base_dPair.f_Base_dPair_dPair_second = dtb__395 }; Base_dPair.f_Base_dPair_dPair_second = dtb__396 }))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dFrontend_dCanonical_dAst_ddecExpr (fuel - 1)) dtb__393))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dFrontend_dCanonical_dAst_ddecPat (fuel - 1)) bytes))))
# 648 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
and v_Vuna_dCompiler_dFrontend_dCanonical_dAst_ddecClause = (fun fuel bytes -> (if (fuel <= 0) then Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing else ((fun nd_uscrut2 -> (match nd_uscrut2 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__397) -> (match dtb__397 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__398; Base_dPair.f_Base_dPair_dPair_second = dtb__399 } -> ((fun nd_uscrut9 -> (match nd_uscrut9 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__400) -> (match dtb__400 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__401; Base_dPair.f_Base_dPair_dPair_second = dtb__402 } -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Base_dPair.f_Base_dPair_dPair_first = { Base_dPair.f_Base_dPair_dPair_first = dtb__398; Base_dPair.f_Base_dPair_dPair_second = dtb__401 }; Base_dPair.f_Base_dPair_dPair_second = dtb__402 }))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dFrontend_dCanonical_dAst_ddecExpr (fuel - 1)) dtb__399))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dFrontend_dCanonical_dAst_ddecPatList (fuel - 1)) bytes))))
# 657 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
and v_Vuna_dCompiler_dFrontend_dCanonical_dAst_ddecStrExpr = (fun fuel bytes -> (if (fuel <= 0) then Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing else ((fun nd_uscrut2 -> (match nd_uscrut2 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__403) -> (match dtb__403 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__404; Base_dPair.f_Base_dPair_dPair_second = dtb__405 } -> ((fun nd_uscrut9 -> (match nd_uscrut9 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__406) -> (match dtb__406 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__407; Base_dPair.f_Base_dPair_dPair_second = dtb__408 } -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Base_dPair.f_Base_dPair_dPair_first = { Base_dPair.f_Base_dPair_dPair_first = dtb__404; Base_dPair.f_Base_dPair_dPair_second = dtb__407 }; Base_dPair.f_Base_dPair_dPair_second = dtb__408 }))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dFrontend_dCanonical_dAst_ddecExpr (fuel - 1)) dtb__405))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_ddecStr (fuel - 1)) bytes))))
# 698 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
and v_Vuna_dCompiler_dFrontend_dCanonical_dAst_ddecExprList = (fun fuel bytes -> (if (fuel <= 0) then Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing else ((fun nd_uscrut2 -> (match nd_uscrut2 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__409) -> (match dtb__409 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__410; Base_dPair.f_Base_dPair_dPair_second = dtb__411 } -> ((((v_Vuna_dCompiler_dFrontend_dCanonical_dAst_ddecExprListItems (fuel - 1)) dtb__410) dtb__411) Base_dList.C_Base_dList_dList_Nil)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dFrontend_dCanonical_dAst_ddecListHead fuel) bytes))))
# 705 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
and v_Vuna_dCompiler_dFrontend_dCanonical_dAst_ddecExprListItems = (fun fuel n bytes acc -> (if (fuel <= 0) then Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing else (if (n <= 0) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Base_dPair.f_Base_dPair_dPair_first = (Base_dList.v_Base_dList_dreverse acc); Base_dPair.f_Base_dPair_dPair_second = bytes })) else ((fun nd_uscrut4 -> (match nd_uscrut4 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__412) -> (match dtb__412 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__413; Base_dPair.f_Base_dPair_dPair_second = dtb__414 } -> ((((v_Vuna_dCompiler_dFrontend_dCanonical_dAst_ddecExprListItems (fuel - 1)) (n - 1)) dtb__414) (Base_dList.C_Base_dList_dList__x58__x58_ (dtb__413, acc)))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dFrontend_dCanonical_dAst_ddecExpr (fuel - 1)) bytes)))))

# 315 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
let v_Vuna_dCompiler_dFrontend_dCanonical_dAst_ddecMaybeExpr = (fun fuel bytes -> (((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_ddecMaybe v_Vuna_dCompiler_dFrontend_dCanonical_dAst_ddecExpr) fuel) bytes))

# 503 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
let v_Vuna_dCompiler_dFrontend_dCanonical_dAst_ddecCtor = (fun fuel bytes -> (if (fuel <= 0) then Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing else ((fun nd_uscrut2 -> (match nd_uscrut2 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__415) -> (match dtb__415 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__416; Base_dPair.f_Base_dPair_dPair_second = dtb__417 } -> (if (dtb__416 = 0) then ((fun nd_uscrut9 -> (match nd_uscrut9 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__418) -> (match dtb__418 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__419; Base_dPair.f_Base_dPair_dPair_second = dtb__420 } -> ((fun nd_uscrut16 -> (match nd_uscrut16 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__421) -> (match dtb__421 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__422; Base_dPair.f_Base_dPair_dPair_second = dtb__423 } -> ((fun nd_uscrut23 -> (match nd_uscrut23 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__424) -> (match dtb__424 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__425; Base_dPair.f_Base_dPair_dPair_second = dtb__426 } -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Base_dPair.f_Base_dPair_dPair_first = { Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dCtor_ctorName = dtb__419; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dCtor_ctorType = dtb__422; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dCtor_ctorArity = dtb__425; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dCtor_ctorSpan = v_Vuna_dCompiler_dFrontend_dCanonical_dAst_dnoSpan }; Base_dPair.f_Base_dPair_dPair_second = dtb__426 }))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_ddecInt (fuel - 1)) dtb__423))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dFrontend_dCanonical_dAst_ddecExpr (fuel - 1)) dtb__420))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_ddecStr (fuel - 1)) dtb__417)) else Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_ddecTag fuel) bytes))))

# 518 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
let v_Vuna_dCompiler_dFrontend_dCanonical_dAst_ddecField = (fun fuel bytes -> (if (fuel <= 0) then Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing else ((fun nd_uscrut2 -> (match nd_uscrut2 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__427) -> (match dtb__427 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__428; Base_dPair.f_Base_dPair_dPair_second = dtb__429 } -> (if (dtb__428 = 0) then ((fun nd_uscrut9 -> (match nd_uscrut9 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__430) -> (match dtb__430 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__431; Base_dPair.f_Base_dPair_dPair_second = dtb__432 } -> ((fun nd_uscrut16 -> (match nd_uscrut16 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__433) -> (match dtb__433 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__434; Base_dPair.f_Base_dPair_dPair_second = dtb__435 } -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Base_dPair.f_Base_dPair_dPair_first = { Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dField_fieldName = dtb__431; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dField_fieldType = dtb__434; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dField_fieldSpan = v_Vuna_dCompiler_dFrontend_dCanonical_dAst_dnoSpan }; Base_dPair.f_Base_dPair_dPair_second = dtb__435 }))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dFrontend_dCanonical_dAst_ddecExpr (fuel - 1)) dtb__432))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_ddecStr (fuel - 1)) dtb__429)) else Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_ddecTag fuel) bytes))))

# 531 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
let v_Vuna_dCompiler_dFrontend_dCanonical_dAst_ddecTraitParam = (fun fuel bytes -> (if (fuel <= 0) then Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing else ((fun nd_uscrut2 -> (match nd_uscrut2 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__436) -> (match dtb__436 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__437; Base_dPair.f_Base_dPair_dPair_second = dtb__438 } -> (if (dtb__437 = 0) then ((fun nd_uscrut9 -> (match nd_uscrut9 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__439) -> (match dtb__439 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__440; Base_dPair.f_Base_dPair_dPair_second = dtb__441 } -> ((fun nd_uscrut16 -> (match nd_uscrut16 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__442) -> (match dtb__442 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__443; Base_dPair.f_Base_dPair_dPair_second = dtb__444 } -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Base_dPair.f_Base_dPair_dPair_first = { Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dTraitParam_traitParamName = dtb__440; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dTraitParam_traitParamKind = dtb__443 }; Base_dPair.f_Base_dPair_dPair_second = dtb__444 }))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) (((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_ddecMaybe v_Vuna_dCompiler_dFrontend_dCanonical_dAst_ddecExpr) (fuel - 1)) dtb__441))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_ddecStr (fuel - 1)) dtb__438)) else Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_ddecTag fuel) bytes))))

# 544 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
let v_Vuna_dCompiler_dFrontend_dCanonical_dAst_ddecTraitMethod = (fun fuel bytes -> (if (fuel <= 0) then Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing else ((fun nd_uscrut2 -> (match nd_uscrut2 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__445) -> (match dtb__445 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__446; Base_dPair.f_Base_dPair_dPair_second = dtb__447 } -> (if (dtb__446 = 0) then ((fun nd_uscrut9 -> (match nd_uscrut9 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__448) -> (match dtb__448 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__449; Base_dPair.f_Base_dPair_dPair_second = dtb__450 } -> ((fun nd_uscrut16 -> (match nd_uscrut16 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__451) -> (match dtb__451 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__452; Base_dPair.f_Base_dPair_dPair_second = dtb__453 } -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Base_dPair.f_Base_dPair_dPair_first = { Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dTraitMethod_traitMethodName = dtb__449; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dTraitMethod_traitMethodType = dtb__452; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dTraitMethod_traitMethodSpan = v_Vuna_dCompiler_dFrontend_dCanonical_dAst_dnoSpan }; Base_dPair.f_Base_dPair_dPair_second = dtb__453 }))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dFrontend_dCanonical_dAst_ddecExpr (fuel - 1)) dtb__450))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_ddecStr (fuel - 1)) dtb__447)) else Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_ddecTag fuel) bytes))))

# 557 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
let rec v_Vuna_dCompiler_dFrontend_dCanonical_dAst_ddecDecl = (fun fuel bytes -> (if (fuel <= 0) then Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing else ((fun nd_uscrut2 -> (match nd_uscrut2 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__454) -> (match dtb__454 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__455; Base_dPair.f_Base_dPair_dPair_second = dtb__456 } -> (if (dtb__455 = 0) then ((fun nd_uscrut9 -> (match nd_uscrut9 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__457) -> (match dtb__457 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__458; Base_dPair.f_Base_dPair_dPair_second = dtb__459 } -> ((fun nd_uscrut16 -> (match nd_uscrut16 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__460) -> (match dtb__460 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__461; Base_dPair.f_Base_dPair_dPair_second = dtb__462 } -> ((fun nd_uscrut23 -> (match nd_uscrut23 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__463) -> (match dtb__463 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__464; Base_dPair.f_Base_dPair_dPair_second = dtb__465 } -> ((fun nd_uscrut30 -> (match nd_uscrut30 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__466) -> (match dtb__466 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__467; Base_dPair.f_Base_dPair_dPair_second = dtb__468 } -> ((fun nd_uscrut37 -> (match nd_uscrut37 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__469) -> (match dtb__469 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__470; Base_dPair.f_Base_dPair_dPair_second = dtb__471 } -> ((fun nd_uscrut44 -> (match nd_uscrut44 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__472) -> (match dtb__472 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__473; Base_dPair.f_Base_dPair_dPair_second = dtb__474 } -> ((fun nd_uscrut51 -> (match nd_uscrut51 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__475) -> (match dtb__475 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__476; Base_dPair.f_Base_dPair_dPair_second = dtb__477 } -> ((fun nd_uscrut58 -> (match nd_uscrut58 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__478) -> (match dtb__478 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__479; Base_dPair.f_Base_dPair_dPair_second = dtb__480 } -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DData (dtb__458, dtb__461, dtb__464, dtb__467, dtb__470, dtb__473, dtb__476, dtb__479, v_Vuna_dCompiler_dFrontend_dCanonical_dAst_dnoSpan)); Base_dPair.f_Base_dPair_dPair_second = dtb__480 }))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_ddecBool (fuel - 1)) dtb__477))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dFrontend_dCanonical_dAst_ddecReprTier (fuel - 1)) dtb__474))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_ddecBool (fuel - 1)) dtb__471))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) (((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_ddecList Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_ddecStr) (fuel - 1)) dtb__468))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) (((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_ddecList v_Vuna_dCompiler_dFrontend_dCanonical_dAst_ddecCtor) (fuel - 1)) dtb__465))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dFrontend_dCanonical_dAst_ddecExpr (fuel - 1)) dtb__462))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) (((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_ddecList Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_ddecStr) (fuel - 1)) dtb__459))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_ddecStr (fuel - 1)) dtb__456)) else (if (dtb__455 = 1) then ((fun nd_uscrut9 -> (match nd_uscrut9 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__481) -> (match dtb__481 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__482; Base_dPair.f_Base_dPair_dPair_second = dtb__483 } -> ((fun nd_uscrut16 -> (match nd_uscrut16 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__484) -> (match dtb__484 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__485; Base_dPair.f_Base_dPair_dPair_second = dtb__486 } -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DAxiom (dtb__482, dtb__485, v_Vuna_dCompiler_dFrontend_dCanonical_dAst_dnoSpan)); Base_dPair.f_Base_dPair_dPair_second = dtb__486 }))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dFrontend_dCanonical_dAst_ddecExpr (fuel - 1)) dtb__483))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_ddecStr (fuel - 1)) dtb__456)) else (if (dtb__455 = 2) then ((fun nd_uscrut9 -> (match nd_uscrut9 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__487) -> (match dtb__487 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__488; Base_dPair.f_Base_dPair_dPair_second = dtb__489 } -> ((fun nd_uscrut16 -> (match nd_uscrut16 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__490) -> (match dtb__490 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__491; Base_dPair.f_Base_dPair_dPair_second = dtb__492 } -> ((fun nd_uscrut23 -> (match nd_uscrut23 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__493) -> (match dtb__493 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__494; Base_dPair.f_Base_dPair_dPair_second = dtb__495 } -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DExtern (dtb__488, dtb__491, dtb__494, v_Vuna_dCompiler_dFrontend_dCanonical_dAst_dnoSpan)); Base_dPair.f_Base_dPair_dPair_second = dtb__495 }))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dFrontend_dCanonical_dAst_ddecExpr (fuel - 1)) dtb__492))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_ddecStr (fuel - 1)) dtb__489))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_ddecStr (fuel - 1)) dtb__456)) else (if (dtb__455 = 3) then ((fun nd_uscrut9 -> (match nd_uscrut9 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__496) -> (match dtb__496 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__497; Base_dPair.f_Base_dPair_dPair_second = dtb__498 } -> ((fun nd_uscrut16 -> (match nd_uscrut16 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__499) -> (match dtb__499 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__500; Base_dPair.f_Base_dPair_dPair_second = dtb__501 } -> ((fun nd_uscrut23 -> (match nd_uscrut23 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__502) -> (match dtb__502 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__503; Base_dPair.f_Base_dPair_dPair_second = dtb__504 } -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DSig (dtb__497, dtb__500, dtb__503, v_Vuna_dCompiler_dFrontend_dCanonical_dAst_dnoSpan)); Base_dPair.f_Base_dPair_dPair_second = dtb__504 }))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dFrontend_dCanonical_dAst_ddecExpr (fuel - 1)) dtb__501))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dFrontend_dCanonical_dAst_ddecExprList (fuel - 1)) dtb__498))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_ddecStr (fuel - 1)) dtb__456)) else (if (dtb__455 = 4) then ((fun nd_uscrut9 -> (match nd_uscrut9 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__505) -> (match dtb__505 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__506; Base_dPair.f_Base_dPair_dPair_second = dtb__507 } -> ((fun nd_uscrut16 -> (match nd_uscrut16 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__508) -> (match dtb__508 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__509; Base_dPair.f_Base_dPair_dPair_second = dtb__510 } -> ((fun nd_uscrut23 -> (match nd_uscrut23 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__511) -> (match dtb__511 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__512; Base_dPair.f_Base_dPair_dPair_second = dtb__513 } -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DFun (dtb__506, dtb__509, dtb__512, v_Vuna_dCompiler_dFrontend_dCanonical_dAst_dnoSpan)); Base_dPair.f_Base_dPair_dPair_second = dtb__513 }))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dFrontend_dCanonical_dAst_ddecExpr (fuel - 1)) dtb__510))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dFrontend_dCanonical_dAst_ddecPatList (fuel - 1)) dtb__507))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_ddecStr (fuel - 1)) dtb__456)) else (if (dtb__455 = 5) then ((fun nd_uscrut9 -> (match nd_uscrut9 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__514) -> (match dtb__514 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__515; Base_dPair.f_Base_dPair_dPair_second = dtb__516 } -> ((fun nd_uscrut16 -> (match nd_uscrut16 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__517) -> (match dtb__517 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__518; Base_dPair.f_Base_dPair_dPair_second = dtb__519 } -> ((fun nd_uscrut23 -> (match nd_uscrut23 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__520) -> (match dtb__520 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__521; Base_dPair.f_Base_dPair_dPair_second = dtb__522 } -> ((fun nd_uscrut30 -> (match nd_uscrut30 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__523) -> (match dtb__523 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__524; Base_dPair.f_Base_dPair_dPair_second = dtb__525 } -> ((fun nd_uscrut37 -> (match nd_uscrut37 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__526) -> (match dtb__526 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__527; Base_dPair.f_Base_dPair_dPair_second = dtb__528 } -> ((fun nd_uscrut44 -> (match nd_uscrut44 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__529) -> (match dtb__529 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__530; Base_dPair.f_Base_dPair_dPair_second = dtb__531 } -> ((fun nd_uscrut51 -> (match nd_uscrut51 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__532) -> (match dtb__532 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__533; Base_dPair.f_Base_dPair_dPair_second = dtb__534 } -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DRecord (dtb__515, dtb__518, dtb__521, dtb__524, dtb__527, dtb__530, dtb__533, v_Vuna_dCompiler_dFrontend_dCanonical_dAst_dnoSpan)); Base_dPair.f_Base_dPair_dPair_second = dtb__534 }))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_ddecBool (fuel - 1)) dtb__531))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dFrontend_dCanonical_dAst_ddecReprTier (fuel - 1)) dtb__528))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_ddecBool (fuel - 1)) dtb__525))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) (((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_ddecList Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_ddecStr) (fuel - 1)) dtb__522))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) (((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_ddecList v_Vuna_dCompiler_dFrontend_dCanonical_dAst_ddecField) (fuel - 1)) dtb__519))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) (((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_ddecList Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_ddecStr) (fuel - 1)) dtb__516))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_ddecStr (fuel - 1)) dtb__456)) else (if (dtb__455 = 6) then ((fun nd_uscrut9 -> (match nd_uscrut9 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__535) -> (match dtb__535 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__536; Base_dPair.f_Base_dPair_dPair_second = dtb__537 } -> ((fun nd_uscrut16 -> (match nd_uscrut16 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__538) -> (match dtb__538 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__539; Base_dPair.f_Base_dPair_dPair_second = dtb__540 } -> ((fun nd_uscrut23 -> (match nd_uscrut23 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__541) -> (match dtb__541 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__542; Base_dPair.f_Base_dPair_dPair_second = dtb__543 } -> ((fun nd_uscrut30 -> (match nd_uscrut30 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__544) -> (match dtb__544 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__545; Base_dPair.f_Base_dPair_dPair_second = dtb__546 } -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DTrait (dtb__536, dtb__539, dtb__542, dtb__545, v_Vuna_dCompiler_dFrontend_dCanonical_dAst_dnoSpan)); Base_dPair.f_Base_dPair_dPair_second = dtb__546 }))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) (((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_ddecList v_Vuna_dCompiler_dFrontend_dCanonical_dAst_ddecTraitMethod) (fuel - 1)) dtb__543))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dFrontend_dCanonical_dAst_ddecExprList (fuel - 1)) dtb__540))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) (((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_ddecList v_Vuna_dCompiler_dFrontend_dCanonical_dAst_ddecTraitParam) (fuel - 1)) dtb__537))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_ddecStr (fuel - 1)) dtb__456)) else (if (dtb__455 = 7) then ((fun nd_uscrut9 -> (match nd_uscrut9 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__547) -> (match dtb__547 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__548; Base_dPair.f_Base_dPair_dPair_second = dtb__549 } -> ((fun nd_uscrut16 -> (match nd_uscrut16 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__550) -> (match dtb__550 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__551; Base_dPair.f_Base_dPair_dPair_second = dtb__552 } -> ((fun nd_uscrut23 -> (match nd_uscrut23 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__553) -> (match dtb__553 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__554; Base_dPair.f_Base_dPair_dPair_second = dtb__555 } -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DInstance (dtb__548, dtb__551, dtb__554, v_Vuna_dCompiler_dFrontend_dCanonical_dAst_dnoSpan)); Base_dPair.f_Base_dPair_dPair_second = dtb__555 }))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dFrontend_dCanonical_dAst_ddecDecls (fuel - 1)) dtb__552))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dFrontend_dCanonical_dAst_ddecExpr (fuel - 1)) dtb__549))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dFrontend_dCanonical_dAst_ddecExprList (fuel - 1)) dtb__456)) else Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing))))))))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_ddecTag fuel) bytes))))
# 728 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
and v_Vuna_dCompiler_dFrontend_dCanonical_dAst_ddecDecls = (fun fuel bytes -> (if (fuel <= 0) then Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing else ((fun nd_uscrut2 -> (match nd_uscrut2 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__556) -> (match dtb__556 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__557; Base_dPair.f_Base_dPair_dPair_second = dtb__558 } -> ((((v_Vuna_dCompiler_dFrontend_dCanonical_dAst_ddecDeclsItems (fuel - 1)) dtb__557) dtb__558) Base_dList.C_Base_dList_dList_Nil)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dFrontend_dCanonical_dAst_ddecListHead fuel) bytes))))
# 735 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
and v_Vuna_dCompiler_dFrontend_dCanonical_dAst_ddecDeclsItems = (fun fuel n bytes acc -> (if (fuel <= 0) then Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing else (if (n <= 0) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Base_dPair.f_Base_dPair_dPair_first = (Base_dList.v_Base_dList_dreverse acc); Base_dPair.f_Base_dPair_dPair_second = bytes })) else ((fun nd_uscrut4 -> (match nd_uscrut4 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__559) -> (match dtb__559 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__560; Base_dPair.f_Base_dPair_dPair_second = dtb__561 } -> ((((v_Vuna_dCompiler_dFrontend_dCanonical_dAst_ddecDeclsItems (fuel - 1)) (n - 1)) dtb__561) (Base_dList.C_Base_dList_dList__x58__x58_ (dtb__560, acc)))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dFrontend_dCanonical_dAst_ddecDecl (fuel - 1)) bytes)))))

# 743 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
let v_Vuna_dCompiler_dFrontend_dCanonical_dAst_ddecPatComplete = (fun s -> ((fun nd_uscrut1 -> (match nd_uscrut1 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__562) -> (match dtb__562 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__563; Base_dPair.f_Base_dPair_dPair_second = dtb__564 } -> (if (Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_dcurAtEnd dtb__564) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__563)) else Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dFrontend_dCanonical_dAst_ddecPat (bi_strLength s)) (Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_dcurOf s))))

# 749 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
let v_Vuna_dCompiler_dFrontend_dCanonical_dAst_ddecExprComplete = (fun s -> ((fun nd_uscrut1 -> (match nd_uscrut1 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__565) -> (match dtb__565 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__566; Base_dPair.f_Base_dPair_dPair_second = dtb__567 } -> (if (Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_dcurAtEnd dtb__567) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__566)) else Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dFrontend_dCanonical_dAst_ddecExpr (bi_strLength s)) (Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_dcurOf s))))

# 755 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
let v_Vuna_dCompiler_dFrontend_dCanonical_dAst_ddecDeclComplete = (fun s -> ((fun nd_uscrut1 -> (match nd_uscrut1 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__568) -> (match dtb__568 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__569; Base_dPair.f_Base_dPair_dPair_second = dtb__570 } -> (if (Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_dcurAtEnd dtb__570) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__569)) else Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dFrontend_dCanonical_dAst_ddecDecl (bi_strLength s)) (Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_dcurOf s))))

# 761 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
let v_Vuna_dCompiler_dFrontend_dCanonical_dAst_ddecQtyComplete = (fun s -> ((fun nd_uscrut1 -> (match nd_uscrut1 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__571) -> (match dtb__571 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__572; Base_dPair.f_Base_dPair_dPair_second = dtb__573 } -> (if (Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_dcurAtEnd dtb__573) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__572)) else Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dFrontend_dCanonical_dAst_ddecQty (bi_strLength s)) (Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_dcurOf s))))

# 767 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
let v_Vuna_dCompiler_dFrontend_dCanonical_dAst_ddecReprTierComplete = (fun s -> ((fun nd_uscrut1 -> (match nd_uscrut1 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__574) -> (match dtb__574 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__575; Base_dPair.f_Base_dPair_dPair_second = dtb__576 } -> (if (Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_dcurAtEnd dtb__576) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__575)) else Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dFrontend_dCanonical_dAst_ddecReprTier (bi_strLength s)) (Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_dcurOf s))))

# 773 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
let v_Vuna_dCompiler_dFrontend_dCanonical_dAst_ddecInterpPartComplete = (fun s -> ((fun nd_uscrut1 -> (match nd_uscrut1 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__577) -> (match dtb__577 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__578; Base_dPair.f_Base_dPair_dPair_second = dtb__579 } -> (if (Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_dcurAtEnd dtb__579) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__578)) else Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dFrontend_dCanonical_dAst_ddecInterpPart (bi_strLength s)) (Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_dcurOf s))))

# 779 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
let v_Vuna_dCompiler_dFrontend_dCanonical_dAst_ddecDoStmtComplete = (fun s -> ((fun nd_uscrut1 -> (match nd_uscrut1 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__580) -> (match dtb__580 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__581; Base_dPair.f_Base_dPair_dPair_second = dtb__582 } -> (if (Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_dcurAtEnd dtb__582) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__581)) else Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dFrontend_dCanonical_dAst_ddecDoStmt (bi_strLength s)) (Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_dcurOf s))))

# 785 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
let v_Vuna_dCompiler_dFrontend_dCanonical_dAst_ddecCtorComplete = (fun s -> ((fun nd_uscrut1 -> (match nd_uscrut1 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__583) -> (match dtb__583 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__584; Base_dPair.f_Base_dPair_dPair_second = dtb__585 } -> (if (Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_dcurAtEnd dtb__585) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__584)) else Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dFrontend_dCanonical_dAst_ddecCtor (bi_strLength s)) (Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_dcurOf s))))

# 791 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
let v_Vuna_dCompiler_dFrontend_dCanonical_dAst_ddecFieldComplete = (fun s -> ((fun nd_uscrut1 -> (match nd_uscrut1 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__586) -> (match dtb__586 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__587; Base_dPair.f_Base_dPair_dPair_second = dtb__588 } -> (if (Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_dcurAtEnd dtb__588) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__587)) else Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dFrontend_dCanonical_dAst_ddecField (bi_strLength s)) (Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_dcurOf s))))

# 797 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
let v_Vuna_dCompiler_dFrontend_dCanonical_dAst_ddecTraitParamComplete = (fun s -> ((fun nd_uscrut1 -> (match nd_uscrut1 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__589) -> (match dtb__589 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__590; Base_dPair.f_Base_dPair_dPair_second = dtb__591 } -> (if (Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_dcurAtEnd dtb__591) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__590)) else Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dFrontend_dCanonical_dAst_ddecTraitParam (bi_strLength s)) (Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_dcurOf s))))

# 803 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
let v_Vuna_dCompiler_dFrontend_dCanonical_dAst_ddecTraitMethodComplete = (fun s -> ((fun nd_uscrut1 -> (match nd_uscrut1 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__592) -> (match dtb__592 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__593; Base_dPair.f_Base_dPair_dPair_second = dtb__594 } -> (if (Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_dcurAtEnd dtb__594) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__593)) else Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dFrontend_dCanonical_dAst_ddecTraitMethod (bi_strLength s)) (Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_dcurOf s))))

# 809 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
let v_Vuna_dCompiler_dFrontend_dCanonical_dAst_ddecDeclsComplete = (fun s -> ((fun nd_uscrut1 -> (match nd_uscrut1 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__595) -> (match dtb__595 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__596; Base_dPair.f_Base_dPair_dPair_second = dtb__597 } -> (if (Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_dcurAtEnd dtb__597) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__596)) else Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dFrontend_dCanonical_dAst_ddecDecls (bi_strLength s)) (Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_dcurOf s))))

# 823 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
let v_Vuna_dCompiler_dFrontend_dCanonical_dAst_dencExportItem = (fun mc0 mc1 -> (match mc0 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExportItem_XModule (dtb__598, dtb__599) -> ((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_dencTag 2) ((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_dencStr dtb__598) mc1))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExportItem_XTypeSome (dtb__600, dtb__601, dtb__602) -> ((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_dencTag 3) ((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_dencStr dtb__600) (((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_dencList Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_dencStr) dtb__601) mc1)))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExportItem_XTypeAll (dtb__603, dtb__604) -> ((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_dencTag 1) ((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_dencStr dtb__603) mc1))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExportItem_XBare (dtb__605, dtb__606) -> ((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_dencTag 0) ((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_dencStr dtb__605) mc1))
  | _ -> failwith "DT: impossible branch"
))

# 829 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
let v_Vuna_dCompiler_dFrontend_dCanonical_dAst_dencExportMembers = (fun mc0 mc1 -> (match mc0 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExportMembers_EMOnly (dtb__607) -> ((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_dencTag 2) (((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_dencList Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_dencStr) dtb__607) mc1))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExportMembers_EMAll -> ((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_dencTag 1) mc1)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExportMembers_EMNone -> ((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_dencTag 0) mc1)
  | _ -> failwith "DT: impossible branch"
))

# 834 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
let v_Vuna_dCompiler_dFrontend_dCanonical_dAst_dencExportSpec = (fun mc0 mc1 -> (match mc0 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExportSpec_ESType (dtb__608, dtb__609, dtb__610) -> ((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_dencTag 1) ((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_dencStr dtb__608) ((v_Vuna_dCompiler_dFrontend_dCanonical_dAst_dencExportMembers dtb__609) mc1)))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExportSpec_ESValue (dtb__611, dtb__612) -> ((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_dencTag 0) ((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_dencStr dtb__611) mc1))
  | _ -> failwith "DT: impossible branch"
))

# 838 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
let v_Vuna_dCompiler_dFrontend_dCanonical_dAst_dencOpacity = (fun mc0 mc1 -> (match mc0 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dOpacity_OpacityAbstract -> ((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_dencTag 2) mc1)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dOpacity_OpacityTransparent -> ((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_dencTag 1) mc1)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dOpacity_OpacityOpaque -> ((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_dencTag 0) mc1)
  | _ -> failwith "DT: impossible branch"
))

# 843 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
let v_Vuna_dCompiler_dFrontend_dCanonical_dAst_dencOpacitySpec = (fun o acc -> ((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_dencStr (o).Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dOpacitySpec_opacityName) ((v_Vuna_dCompiler_dFrontend_dCanonical_dAst_dencOpacity (o).Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dOpacitySpec_opacityKind) acc)))

# 847 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
let v_Vuna_dCompiler_dFrontend_dCanonical_dAst_dencModDecl = (fun m acc -> ((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_dencStr (m).Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dModDecl_modDeclName) ((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_dencBool (m).Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dModDecl_modDeclHasExportList) (((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_dencList v_Vuna_dCompiler_dFrontend_dCanonical_dAst_dencExportItem) (m).Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dModDecl_modDeclExportItems) (((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_dencList v_Vuna_dCompiler_dFrontend_dCanonical_dAst_dencExportSpec) (m).Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dModDecl_modDeclExports) (((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_dencList v_Vuna_dCompiler_dFrontend_dCanonical_dAst_dencExportItem) (m).Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dModDecl_modDeclReexports) (((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_dencList v_Vuna_dCompiler_dFrontend_dCanonical_dAst_dencOpacitySpec) (m).Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dModDecl_modDeclOpacity) acc)))))))

# 861 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
let v_Vuna_dCompiler_dFrontend_dCanonical_dAst_dencImportLike = (fun i acc -> ((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_dencStr (i).Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dImport_importName) ((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_dencBool (i).Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dImport_importIsQualified) (((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_dencMaybe Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_dencStr) (i).Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dImport_importAlias) acc))))

# 865 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
let v_Vuna_dCompiler_dFrontend_dCanonical_dAst_dencFixityLike = (fun f acc -> ((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_dencStr (f).Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dFixityDecl_fixityOp) ((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_dencInt (f).Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dFixityDecl_fixityLevel) ((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_dencInt (f).Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dFixityDecl_fixityAssoc) (((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_dencMaybe Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_dencStr) (f).Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dFixityDecl_fixityTarget) acc)))))

# 853 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
let v_Vuna_dCompiler_dFrontend_dCanonical_dAst_dencSourceFile = (fun f acc -> (((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_dencMaybe v_Vuna_dCompiler_dFrontend_dCanonical_dAst_dencModDecl) (f).Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dSourceFile_sourceFileModDecl) (((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_dencList v_Vuna_dCompiler_dFrontend_dCanonical_dAst_dencImportLike) (f).Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dSourceFile_sourceFileImports) (((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_dencList v_Vuna_dCompiler_dFrontend_dCanonical_dAst_dencFixityLike) (f).Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dSourceFile_sourceFileFixities) (((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_dencList v_Vuna_dCompiler_dFrontend_dCanonical_dAst_dencDecl) (f).Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dSourceFile_sourceFileDecls) (((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_dencList v_Vuna_dCompiler_dFrontend_dCanonical_dAst_dencExportSpec) (f).Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dSourceFile_sourceFileExports) (((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_dencList v_Vuna_dCompiler_dFrontend_dCanonical_dAst_dencExportItem) (f).Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dSourceFile_sourceFileReexports) (((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_dencList v_Vuna_dCompiler_dFrontend_dCanonical_dAst_dencOpacitySpec) (f).Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dSourceFile_sourceFileOpacity) acc))))))))

# 871 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
let v_Vuna_dCompiler_dFrontend_dCanonical_dAst_ddecExportItem = (fun fuel c -> (if (fuel <= 0) then Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing else ((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_dthenPair ((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_ddecTag fuel) c)) (fun tag b1 -> (if (tag = 0) then ((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_dthenPair ((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_ddecStr (fuel - 1)) b1)) (fun n b2 -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExportItem_XBare (n, v_Vuna_dCompiler_dFrontend_dCanonical_dAst_dnoSpan)); Base_dPair.f_Base_dPair_dPair_second = b2 })))) else (if (tag = 1) then ((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_dthenPair ((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_ddecStr (fuel - 1)) b1)) (fun n b2 -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExportItem_XTypeAll (n, v_Vuna_dCompiler_dFrontend_dCanonical_dAst_dnoSpan)); Base_dPair.f_Base_dPair_dPair_second = b2 })))) else (if (tag = 3) then ((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_dthenPair ((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_ddecStr (fuel - 1)) b1)) (fun n b2 -> ((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_dthenPair (((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_ddecList Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_ddecStr) (fuel - 1)) b2)) (fun ms b3 -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExportItem_XTypeSome (n, ms, v_Vuna_dCompiler_dFrontend_dCanonical_dAst_dnoSpan)); Base_dPair.f_Base_dPair_dPair_second = b3 })))))) else (if (tag = 2) then ((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_dthenPair ((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_ddecStr (fuel - 1)) b1)) (fun n b2 -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExportItem_XModule (n, v_Vuna_dCompiler_dFrontend_dCanonical_dAst_dnoSpan)); Base_dPair.f_Base_dPair_dPair_second = b2 })))) else Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing))))))))

# 883 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
let v_Vuna_dCompiler_dFrontend_dCanonical_dAst_ddecExportMembers = (fun fuel c -> (if (fuel <= 0) then Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing else ((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_dthenPair ((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_ddecTag fuel) c)) (fun tag b1 -> (if (tag = 0) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Base_dPair.f_Base_dPair_dPair_first = Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExportMembers_EMNone; Base_dPair.f_Base_dPair_dPair_second = b1 })) else (if (tag = 1) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Base_dPair.f_Base_dPair_dPair_first = Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExportMembers_EMAll; Base_dPair.f_Base_dPair_dPair_second = b1 })) else (if (tag = 2) then ((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_dthenPair (((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_ddecList Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_ddecStr) (fuel - 1)) b1)) (fun ms b2 -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExportMembers_EMOnly (ms)); Base_dPair.f_Base_dPair_dPair_second = b2 })))) else Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing)))))))

# 892 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
let v_Vuna_dCompiler_dFrontend_dCanonical_dAst_ddecExportSpec = (fun fuel c -> (if (fuel <= 0) then Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing else ((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_dthenPair ((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_ddecTag fuel) c)) (fun tag b1 -> (if (tag = 0) then ((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_dthenPair ((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_ddecStr (fuel - 1)) b1)) (fun n b2 -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExportSpec_ESValue (n, v_Vuna_dCompiler_dFrontend_dCanonical_dAst_dnoSpan)); Base_dPair.f_Base_dPair_dPair_second = b2 })))) else (if (tag = 1) then ((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_dthenPair ((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_ddecStr (fuel - 1)) b1)) (fun n b2 -> ((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_dthenPair ((v_Vuna_dCompiler_dFrontend_dCanonical_dAst_ddecExportMembers (fuel - 1)) b2)) (fun ms b3 -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExportSpec_ESType (n, ms, v_Vuna_dCompiler_dFrontend_dCanonical_dAst_dnoSpan)); Base_dPair.f_Base_dPair_dPair_second = b3 })))))) else Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing))))))

# 902 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
let v_Vuna_dCompiler_dFrontend_dCanonical_dAst_ddecOpacity = (fun fuel c -> (if (fuel <= 0) then Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing else ((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_dthenPair ((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_ddecTag fuel) c)) (fun tag b1 -> (if (tag = 0) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Base_dPair.f_Base_dPair_dPair_first = Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dOpacity_OpacityOpaque; Base_dPair.f_Base_dPair_dPair_second = b1 })) else (if (tag = 1) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Base_dPair.f_Base_dPair_dPair_first = Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dOpacity_OpacityTransparent; Base_dPair.f_Base_dPair_dPair_second = b1 })) else (if (tag = 2) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Base_dPair.f_Base_dPair_dPair_first = Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dOpacity_OpacityAbstract; Base_dPair.f_Base_dPair_dPair_second = b1 })) else Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing)))))))

# 911 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
let v_Vuna_dCompiler_dFrontend_dCanonical_dAst_ddecOpacitySpec = (fun fuel c -> ((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_dthenPair ((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_ddecStr (fuel - 1)) c)) (fun name b1 -> ((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_dthenPair ((v_Vuna_dCompiler_dFrontend_dCanonical_dAst_ddecOpacity (fuel - 1)) b1)) (fun kind b2 -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Base_dPair.f_Base_dPair_dPair_first = { Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dOpacitySpec_opacityName = name; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dOpacitySpec_opacityKind = kind; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dOpacitySpec_opacitySpan = v_Vuna_dCompiler_dFrontend_dCanonical_dAst_dnoSpan }; Base_dPair.f_Base_dPair_dPair_second = b2 })))))))

# 917 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
let v_Vuna_dCompiler_dFrontend_dCanonical_dAst_ddecModDecl = (fun fuel c -> ((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_dthenPair ((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_ddecStr (fuel - 1)) c)) (fun name b1 -> ((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_dthenPair ((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_ddecBool (fuel - 1)) b1)) (fun hasList b2 -> ((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_dthenPair (((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_ddecList v_Vuna_dCompiler_dFrontend_dCanonical_dAst_ddecExportItem) (fuel - 1)) b2)) (fun items b3 -> ((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_dthenPair (((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_ddecList v_Vuna_dCompiler_dFrontend_dCanonical_dAst_ddecExportSpec) (fuel - 1)) b3)) (fun exports b4 -> ((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_dthenPair (((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_ddecList v_Vuna_dCompiler_dFrontend_dCanonical_dAst_ddecExportItem) (fuel - 1)) b4)) (fun reexports b5 -> ((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_dthenPair (((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_ddecList v_Vuna_dCompiler_dFrontend_dCanonical_dAst_ddecOpacitySpec) (fuel - 1)) b5)) (fun opacity b6 -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Base_dPair.f_Base_dPair_dPair_first = { Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dModDecl_modDeclName = name; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dModDecl_modDeclHasExportList = hasList; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dModDecl_modDeclExportItems = items; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dModDecl_modDeclExports = exports; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dModDecl_modDeclReexports = reexports; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dModDecl_modDeclOpacity = opacity; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dModDecl_modDeclSpan = v_Vuna_dCompiler_dFrontend_dCanonical_dAst_dnoSpan }; Base_dPair.f_Base_dPair_dPair_second = b6 })))))))))))))))

# 922 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
let v_Vuna_dCompiler_dFrontend_dCanonical_dAst_ddecImportLike = (fun fuel c -> ((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_dthenPair ((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_ddecStr (fuel - 1)) c)) (fun name b1 -> ((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_dthenPair ((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_ddecBool (fuel - 1)) b1)) (fun qual b2 -> ((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_dthenPair (((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_ddecMaybe Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_ddecStr) (fuel - 1)) b2)) (fun alias b3 -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Base_dPair.f_Base_dPair_dPair_first = { Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dImport_importName = name; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dImport_importIsQualified = qual; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dImport_importAlias = alias; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dImport_importSpan = v_Vuna_dCompiler_dFrontend_dCanonical_dAst_dnoSpan }; Base_dPair.f_Base_dPair_dPair_second = b3 })))))))))

# 927 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
let v_Vuna_dCompiler_dFrontend_dCanonical_dAst_ddecFixityLike = (fun fuel c -> ((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_dthenPair ((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_ddecStr (fuel - 1)) c)) (fun op b1 -> ((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_dthenPair ((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_ddecInt (fuel - 1)) b1)) (fun level b2 -> ((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_dthenPair ((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_ddecInt (fuel - 1)) b2)) (fun assoc b3 -> ((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_dthenPair (((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_ddecMaybe Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_ddecStr) (fuel - 1)) b3)) (fun target b4 -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Base_dPair.f_Base_dPair_dPair_first = { Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dFixityDecl_fixityOp = op; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dFixityDecl_fixityLevel = level; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dFixityDecl_fixityAssoc = assoc; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dFixityDecl_fixityTarget = target; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dFixityDecl_fixitySpan = v_Vuna_dCompiler_dFrontend_dCanonical_dAst_dnoSpan }; Base_dPair.f_Base_dPair_dPair_second = b4 })))))))))))

# 938 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
let v_Vuna_dCompiler_dFrontend_dCanonical_dAst_ddecSourceFileGo = (fun fuel c -> ((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_dthenPair (((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_ddecMaybe v_Vuna_dCompiler_dFrontend_dCanonical_dAst_ddecModDecl) (fuel - 1)) c)) (fun modDecl b1 -> ((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_dthenPair (((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_ddecList v_Vuna_dCompiler_dFrontend_dCanonical_dAst_ddecImportLike) (fuel - 1)) b1)) (fun imports b2 -> ((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_dthenPair (((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_ddecList v_Vuna_dCompiler_dFrontend_dCanonical_dAst_ddecFixityLike) (fuel - 1)) b2)) (fun fixities b3 -> ((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_dthenPair (((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_ddecList v_Vuna_dCompiler_dFrontend_dCanonical_dAst_ddecDecl) (fuel - 1)) b3)) (fun decls b4 -> ((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_dthenPair (((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_ddecList v_Vuna_dCompiler_dFrontend_dCanonical_dAst_ddecExportSpec) (fuel - 1)) b4)) (fun exports b5 -> ((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_dthenPair (((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_ddecList v_Vuna_dCompiler_dFrontend_dCanonical_dAst_ddecExportItem) (fuel - 1)) b5)) (fun reexports b6 -> ((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_dthenPair (((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_ddecList v_Vuna_dCompiler_dFrontend_dCanonical_dAst_ddecOpacitySpec) (fuel - 1)) b6)) (fun opacity b7 -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Base_dPair.f_Base_dPair_dPair_first = { Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dSourceFile_sourceFileModDecl = modDecl; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dSourceFile_sourceFileImports = imports; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dSourceFile_sourceFileFixities = fixities; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dSourceFile_sourceFileDecls = decls; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dSourceFile_sourceFileExports = exports; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dSourceFile_sourceFileReexports = reexports; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dSourceFile_sourceFileOpacity = opacity }; Base_dPair.f_Base_dPair_dPair_second = b7 })))))))))))))))))

# 933 "Vuna/Compiler/Frontend/Canonical/Ast.vuna"
let v_Vuna_dCompiler_dFrontend_dCanonical_dAst_ddecSourceFileComplete = (fun s -> ((fun nd_uscrut1 -> (match nd_uscrut1 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__613) -> (match dtb__613 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__614; Base_dPair.f_Base_dPair_dPair_second = dtb__615 } -> (if (Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_dcurAtEnd dtb__615) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__614)) else Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dFrontend_dCanonical_dAst_ddecSourceFileGo (bi_strLength s)) (Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_dcurOf s))))
