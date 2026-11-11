open Vuna_runtime
let v_Vuna_dCompiler_dCanonical_dAst_dnoSpan = { Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanFile = ""; Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanStartLine = 0; Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanStartCol = 0; Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanEndLine = 0; Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanEndCol = 0 }

let v_Vuna_dCompiler_dCanonical_dAst_dencQty = (fun mc0 mc1 -> (match mc0 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dQty_Q1 -> ((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_dencTag 1) mc1)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dQty_Q0 -> ((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_dencTag 0) mc1)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCanonical_dAst_dencReprTier = (fun mc0 mc1 -> (match mc0 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dReprTier_ReprOpaque -> ((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_dencTag 2) mc1)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dReprTier_ReprTransparent -> ((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_dencTag 1) mc1)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dReprTier_ReprAuto -> ((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_dencTag 0) mc1)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCanonical_dAst_dencMaybeQty = (fun mc0 mc1 -> (match mc0 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__0) -> (Base_dList.C_Base_dList_dList_Cons ("1", ((v_Vuna_dCompiler_dCanonical_dAst_dencQty dtb__0) mc1)))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (Base_dList.C_Base_dList_dList_Cons ("0", mc1))
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dCanonical_dAst_dencStrListGo = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__1, dtb__2) -> ((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_dencStr dtb__1) ((v_Vuna_dCompiler_dCanonical_dAst_dencStrListGo dtb__2) mc1))
  | Base_dList.C_Base_dList_dList_Nil -> mc1
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCanonical_dAst_dencStrList = (fun xs acc -> (Base_dList.C_Base_dList_dList_Cons ((String.concat "" ["["; (bi_strFromInt (Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_dlenOf xs)); ":"]), ((v_Vuna_dCompiler_dCanonical_dAst_dencStrListGo xs) acc))))

let rec v_Vuna_dCompiler_dCanonical_dAst_dencPatList = (fun xs acc -> (Base_dList.C_Base_dList_dList_Cons ((String.concat "" ["["; (bi_strFromInt (Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_dlenOf xs)); ":"]), ((v_Vuna_dCompiler_dCanonical_dAst_dencPatListGo xs) acc))))
and v_Vuna_dCompiler_dCanonical_dAst_dencPatListGo = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__3, dtb__4) -> ((v_Vuna_dCompiler_dCanonical_dAst_dencPat dtb__3) ((v_Vuna_dCompiler_dCanonical_dAst_dencPatListGo dtb__4) mc1))
  | Base_dList.C_Base_dList_dList_Nil -> mc1
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dCanonical_dAst_dencStrPatList = (fun xs acc -> (Base_dList.C_Base_dList_dList_Cons ((String.concat "" ["["; (bi_strFromInt (Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_dlenOf xs)); ":"]), ((v_Vuna_dCompiler_dCanonical_dAst_dencStrPatListGo xs) acc))))
and v_Vuna_dCompiler_dCanonical_dAst_dencStrPatListGo = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__5, dtb__6) -> (match dtb__5 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__7; Base_dPair.f_Base_dPair_dPair_second = dtb__8 } -> ((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_dencStr dtb__7) ((v_Vuna_dCompiler_dCanonical_dAst_dencPat dtb__8) ((v_Vuna_dCompiler_dCanonical_dAst_dencStrPatListGo dtb__6) mc1)))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> mc1
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dCanonical_dAst_dencPat = (fun mc0 mc1 -> (match mc0 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PRecord (dtb__9, dtb__10, dtb__11) -> ((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_dencTag 6) ((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_dencStr dtb__9) ((v_Vuna_dCompiler_dCanonical_dAst_dencStrPatList dtb__10) mc1)))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PStr (dtb__12, dtb__13) -> ((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_dencTag 5) ((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_dencStr dtb__12) mc1))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PInt (dtb__14, dtb__15) -> ((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_dencTag 4) ((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_dencInt dtb__14) mc1))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PCon (dtb__16, dtb__17, dtb__18) -> ((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_dencTag 3) ((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_dencStr dtb__16) ((v_Vuna_dCompiler_dCanonical_dAst_dencPatList dtb__17) mc1)))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PWild (dtb__19) -> ((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_dencTag 2) mc1)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PAs (dtb__20, dtb__21, dtb__22) -> ((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_dencTag 1) ((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_dencStr dtb__20) ((v_Vuna_dCompiler_dCanonical_dAst_dencPat dtb__21) mc1)))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PVar (dtb__23, dtb__24) -> ((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_dencTag 0) ((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_dencStr dtb__23) mc1))
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dCanonical_dAst_dencExprList = (fun xs acc -> (Base_dList.C_Base_dList_dList_Cons ((String.concat "" ["["; (bi_strFromInt (Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_dlenOf xs)); ":"]), ((v_Vuna_dCompiler_dCanonical_dAst_dencExprListGo xs) acc))))
and v_Vuna_dCompiler_dCanonical_dAst_dencExprListGo = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__25, dtb__26) -> ((v_Vuna_dCompiler_dCanonical_dAst_dencExpr dtb__25) ((v_Vuna_dCompiler_dCanonical_dAst_dencExprListGo dtb__26) mc1))
  | Base_dList.C_Base_dList_dList_Nil -> mc1
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dCanonical_dAst_dencPatExprList = (fun xs acc -> (Base_dList.C_Base_dList_dList_Cons ((String.concat "" ["["; (bi_strFromInt (Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_dlenOf xs)); ":"]), ((v_Vuna_dCompiler_dCanonical_dAst_dencPatExprListGo xs) acc))))
and v_Vuna_dCompiler_dCanonical_dAst_dencPatExprListGo = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__27, dtb__28) -> (match dtb__27 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__29; Base_dPair.f_Base_dPair_dPair_second = dtb__30 } -> ((v_Vuna_dCompiler_dCanonical_dAst_dencPat dtb__29) ((v_Vuna_dCompiler_dCanonical_dAst_dencExpr dtb__30) ((v_Vuna_dCompiler_dCanonical_dAst_dencPatExprListGo dtb__28) mc1)))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> mc1
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dCanonical_dAst_dencClauses = (fun xs acc -> (Base_dList.C_Base_dList_dList_Cons ((String.concat "" ["["; (bi_strFromInt (Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_dlenOf xs)); ":"]), ((v_Vuna_dCompiler_dCanonical_dAst_dencClausesGo xs) acc))))
and v_Vuna_dCompiler_dCanonical_dAst_dencClausesGo = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__31, dtb__32) -> (match dtb__31 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__33; Base_dPair.f_Base_dPair_dPair_second = dtb__34 } -> ((v_Vuna_dCompiler_dCanonical_dAst_dencPatList dtb__33) ((v_Vuna_dCompiler_dCanonical_dAst_dencExpr dtb__34) ((v_Vuna_dCompiler_dCanonical_dAst_dencClausesGo dtb__32) mc1)))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> mc1
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dCanonical_dAst_dencStmtList = (fun xs acc -> (Base_dList.C_Base_dList_dList_Cons ((String.concat "" ["["; (bi_strFromInt (Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_dlenOf xs)); ":"]), ((v_Vuna_dCompiler_dCanonical_dAst_dencStmtListGo xs) acc))))
and v_Vuna_dCompiler_dCanonical_dAst_dencStmtListGo = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__35, dtb__36) -> ((v_Vuna_dCompiler_dCanonical_dAst_dencDoStmt dtb__35) ((v_Vuna_dCompiler_dCanonical_dAst_dencStmtListGo dtb__36) mc1))
  | Base_dList.C_Base_dList_dList_Nil -> mc1
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dCanonical_dAst_dencPartList = (fun xs acc -> (Base_dList.C_Base_dList_dList_Cons ((String.concat "" ["["; (bi_strFromInt (Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_dlenOf xs)); ":"]), ((v_Vuna_dCompiler_dCanonical_dAst_dencPartListGo xs) acc))))
and v_Vuna_dCompiler_dCanonical_dAst_dencPartListGo = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__37, dtb__38) -> ((v_Vuna_dCompiler_dCanonical_dAst_dencInterpPart dtb__37) ((v_Vuna_dCompiler_dCanonical_dAst_dencPartListGo dtb__38) mc1))
  | Base_dList.C_Base_dList_dList_Nil -> mc1
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dCanonical_dAst_dencStrExprList = (fun xs acc -> (Base_dList.C_Base_dList_dList_Cons ((String.concat "" ["["; (bi_strFromInt (Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_dlenOf xs)); ":"]), ((v_Vuna_dCompiler_dCanonical_dAst_dencStrExprListGo xs) acc))))
and v_Vuna_dCompiler_dCanonical_dAst_dencStrExprListGo = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__39, dtb__40) -> (match dtb__39 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__41; Base_dPair.f_Base_dPair_dPair_second = dtb__42 } -> ((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_dencStr dtb__41) ((v_Vuna_dCompiler_dCanonical_dAst_dencExpr dtb__42) ((v_Vuna_dCompiler_dCanonical_dAst_dencStrExprListGo dtb__40) mc1)))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> mc1
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dCanonical_dAst_dencInterpPart = (fun mc0 mc1 -> (match mc0 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dInterpPart_IPHole (dtb__43) -> ((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_dencTag 1) ((v_Vuna_dCompiler_dCanonical_dAst_dencExpr dtb__43) mc1))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dInterpPart_IPText (dtb__44) -> ((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_dencTag 0) ((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_dencStr dtb__44) mc1))
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dCanonical_dAst_dencDoStmt = (fun mc0 mc1 -> (match mc0 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDoStmt_DExpr (dtb__45, dtb__46) -> ((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_dencTag 1) ((v_Vuna_dCompiler_dCanonical_dAst_dencExpr dtb__45) mc1))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDoStmt_DBind (dtb__47, dtb__48, dtb__49) -> ((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_dencTag 0) ((v_Vuna_dCompiler_dCanonical_dAst_dencPat dtb__47) ((v_Vuna_dCompiler_dCanonical_dAst_dencExpr dtb__48) mc1)))
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dCanonical_dAst_dencExpr = (fun mc0 mc1 -> (match mc0 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EFloat (dtb__50, dtb__51) -> ((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_dencTag 22) ((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_dencStr dtb__50) mc1))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EInterp (dtb__52, dtb__53, dtb__54) -> ((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_dencTag 21) ((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_dencBool dtb__52) ((v_Vuna_dCompiler_dCanonical_dAst_dencPartList dtb__53) mc1)))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EAnn (dtb__55, dtb__56, dtb__57) -> ((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_dencTag 20) ((v_Vuna_dCompiler_dCanonical_dAst_dencExpr dtb__55) ((v_Vuna_dCompiler_dCanonical_dAst_dencExpr dtb__56) mc1)))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ESectR (dtb__58, dtb__59, dtb__60) -> ((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_dencTag 19) ((v_Vuna_dCompiler_dCanonical_dAst_dencExpr dtb__58) ((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_dencStr dtb__59) mc1)))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ESectL (dtb__61, dtb__62, dtb__63) -> ((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_dencTag 18) ((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_dencStr dtb__61) ((v_Vuna_dCompiler_dCanonical_dAst_dencExpr dtb__62) mc1)))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ESectOp (dtb__64, dtb__65) -> ((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_dencTag 17) ((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_dencStr dtb__64) mc1))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EBacktick (dtb__66, dtb__67, dtb__68, dtb__69) -> ((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_dencTag 16) ((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_dencStr dtb__66) ((v_Vuna_dCompiler_dCanonical_dAst_dencExpr dtb__67) ((v_Vuna_dCompiler_dCanonical_dAst_dencExpr dtb__68) mc1))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EParen (dtb__70, dtb__71) -> ((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_dencTag 15) ((v_Vuna_dCompiler_dCanonical_dAst_dencExpr dtb__70) mc1))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EInfix (dtb__72, dtb__73, dtb__74, dtb__75) -> ((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_dencTag 14) ((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_dencStr dtb__72) ((v_Vuna_dCompiler_dCanonical_dAst_dencExpr dtb__73) ((v_Vuna_dCompiler_dCanonical_dAst_dencExpr dtb__74) mc1))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EDo (dtb__76, dtb__77) -> ((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_dencTag 13) ((v_Vuna_dCompiler_dCanonical_dAst_dencStmtList dtb__76) mc1))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ERecUpdate (dtb__78, dtb__79, dtb__80) -> ((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_dencTag 12) ((v_Vuna_dCompiler_dCanonical_dAst_dencExpr dtb__78) ((v_Vuna_dCompiler_dCanonical_dAst_dencStrExprList dtb__79) mc1)))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ERecord (dtb__81, dtb__82, dtb__83) -> ((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_dencTag 11) ((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_dencStr dtb__81) ((v_Vuna_dCompiler_dCanonical_dAst_dencStrExprList dtb__82) mc1)))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EField (dtb__84, dtb__85, dtb__86) -> ((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_dencTag 10) ((v_Vuna_dCompiler_dCanonical_dAst_dencExpr dtb__84) ((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_dencStr dtb__85) mc1)))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EIf (dtb__87, dtb__88, dtb__89, dtb__90) -> ((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_dencTag 9) ((v_Vuna_dCompiler_dCanonical_dAst_dencExpr dtb__87) ((v_Vuna_dCompiler_dCanonical_dAst_dencExpr dtb__88) ((v_Vuna_dCompiler_dCanonical_dAst_dencExpr dtb__89) mc1))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ECase (dtb__91, dtb__92, dtb__93) -> ((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_dencTag 8) ((v_Vuna_dCompiler_dCanonical_dAst_dencExpr dtb__91) ((v_Vuna_dCompiler_dCanonical_dAst_dencPatExprList dtb__92) mc1)))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ELocalFun (dtb__94, dtb__95) -> ((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_dencTag 7) ((v_Vuna_dCompiler_dCanonical_dAst_dencClauses dtb__94) mc1))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ELet (dtb__96, dtb__97, dtb__98, dtb__99) -> ((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_dencTag 6) ((v_Vuna_dCompiler_dCanonical_dAst_dencPatExprList dtb__96) ((v_Vuna_dCompiler_dCanonical_dAst_dencExpr dtb__97) ((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_dencBool dtb__98) mc1))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EPi (dtb__100, dtb__101, dtb__102, dtb__103, dtb__104, dtb__105) -> ((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_dencTag 5) ((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_dencStr dtb__100) ((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_dencBool dtb__101) ((v_Vuna_dCompiler_dCanonical_dAst_dencMaybeQty dtb__102) ((v_Vuna_dCompiler_dCanonical_dAst_dencExpr dtb__103) ((v_Vuna_dCompiler_dCanonical_dAst_dencExpr dtb__104) mc1))))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp (dtb__106, dtb__107, dtb__108) -> ((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_dencTag 4) ((v_Vuna_dCompiler_dCanonical_dAst_dencExpr dtb__106) ((v_Vuna_dCompiler_dCanonical_dAst_dencExprList dtb__107) mc1)))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ELam (dtb__109, dtb__110, dtb__111) -> ((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_dencTag 3) ((v_Vuna_dCompiler_dCanonical_dAst_dencStrList dtb__109) ((v_Vuna_dCompiler_dCanonical_dAst_dencExpr dtb__110) mc1)))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EStr (dtb__112, dtb__113) -> ((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_dencTag 2) ((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_dencStr dtb__112) mc1))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EInt (dtb__114, dtb__115) -> ((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_dencTag 1) ((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_dencInt dtb__114) mc1))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__116, dtb__117) -> ((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_dencTag 0) ((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_dencStr dtb__116) mc1))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCanonical_dAst_dencMaybeExpr = (fun mc0 mc1 -> (match mc0 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__118) -> (Base_dList.C_Base_dList_dList_Cons ("1", ((v_Vuna_dCompiler_dCanonical_dAst_dencExpr dtb__118) mc1)))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (Base_dList.C_Base_dList_dList_Cons ("0", mc1))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCanonical_dAst_dencCtor = (fun mc0 mc1 -> (match mc0 with
  | { Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dCtor_ctorName = dtb__119; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dCtor_ctorType = dtb__120; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dCtor_ctorArity = dtb__121; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dCtor_ctorSpan = dtb__122 } -> ((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_dencTag 0) ((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_dencStr dtb__119) ((v_Vuna_dCompiler_dCanonical_dAst_dencExpr dtb__120) ((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_dencInt dtb__121) mc1))))
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dCanonical_dAst_dencCtorListGo = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__123, dtb__124) -> ((v_Vuna_dCompiler_dCanonical_dAst_dencCtor dtb__123) ((v_Vuna_dCompiler_dCanonical_dAst_dencCtorListGo dtb__124) mc1))
  | Base_dList.C_Base_dList_dList_Nil -> mc1
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCanonical_dAst_dencCtorList = (fun xs acc -> (Base_dList.C_Base_dList_dList_Cons ((String.concat "" ["["; (bi_strFromInt (Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_dlenOf xs)); ":"]), ((v_Vuna_dCompiler_dCanonical_dAst_dencCtorListGo xs) acc))))

let v_Vuna_dCompiler_dCanonical_dAst_dencField = (fun mc0 mc1 -> (match mc0 with
  | { Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dField_fieldName = dtb__125; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dField_fieldType = dtb__126; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dField_fieldSpan = dtb__127 } -> ((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_dencTag 0) ((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_dencStr dtb__125) ((v_Vuna_dCompiler_dCanonical_dAst_dencExpr dtb__126) mc1)))
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dCanonical_dAst_dencFieldListGo = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__128, dtb__129) -> ((v_Vuna_dCompiler_dCanonical_dAst_dencField dtb__128) ((v_Vuna_dCompiler_dCanonical_dAst_dencFieldListGo dtb__129) mc1))
  | Base_dList.C_Base_dList_dList_Nil -> mc1
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCanonical_dAst_dencFieldList = (fun xs acc -> (Base_dList.C_Base_dList_dList_Cons ((String.concat "" ["["; (bi_strFromInt (Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_dlenOf xs)); ":"]), ((v_Vuna_dCompiler_dCanonical_dAst_dencFieldListGo xs) acc))))

let v_Vuna_dCompiler_dCanonical_dAst_dencTraitParam = (fun mc0 mc1 -> (match mc0 with
  | { Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dTraitParam_traitParamName = dtb__130; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dTraitParam_traitParamKind = dtb__131 } -> ((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_dencTag 0) ((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_dencStr dtb__130) ((v_Vuna_dCompiler_dCanonical_dAst_dencMaybeExpr dtb__131) mc1)))
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dCanonical_dAst_dencTraitParamListGo = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__132, dtb__133) -> ((v_Vuna_dCompiler_dCanonical_dAst_dencTraitParam dtb__132) ((v_Vuna_dCompiler_dCanonical_dAst_dencTraitParamListGo dtb__133) mc1))
  | Base_dList.C_Base_dList_dList_Nil -> mc1
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCanonical_dAst_dencTraitParamList = (fun xs acc -> (Base_dList.C_Base_dList_dList_Cons ((String.concat "" ["["; (bi_strFromInt (Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_dlenOf xs)); ":"]), ((v_Vuna_dCompiler_dCanonical_dAst_dencTraitParamListGo xs) acc))))

let v_Vuna_dCompiler_dCanonical_dAst_dencTraitMethod = (fun mc0 mc1 -> (match mc0 with
  | { Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dTraitMethod_traitMethodName = dtb__134; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dTraitMethod_traitMethodType = dtb__135; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dTraitMethod_traitMethodSpan = dtb__136 } -> ((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_dencTag 0) ((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_dencStr dtb__134) ((v_Vuna_dCompiler_dCanonical_dAst_dencExpr dtb__135) mc1)))
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dCanonical_dAst_dencTraitMethodListGo = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__137, dtb__138) -> ((v_Vuna_dCompiler_dCanonical_dAst_dencTraitMethod dtb__137) ((v_Vuna_dCompiler_dCanonical_dAst_dencTraitMethodListGo dtb__138) mc1))
  | Base_dList.C_Base_dList_dList_Nil -> mc1
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCanonical_dAst_dencTraitMethodList = (fun xs acc -> (Base_dList.C_Base_dList_dList_Cons ((String.concat "" ["["; (bi_strFromInt (Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_dlenOf xs)); ":"]), ((v_Vuna_dCompiler_dCanonical_dAst_dencTraitMethodListGo xs) acc))))

let rec v_Vuna_dCompiler_dCanonical_dAst_dencDecls = (fun xs acc -> (Base_dList.C_Base_dList_dList_Cons ((String.concat "" ["["; (bi_strFromInt (Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_dlenOf xs)); ":"]), ((v_Vuna_dCompiler_dCanonical_dAst_dencDeclsGo xs) acc))))
and v_Vuna_dCompiler_dCanonical_dAst_dencDeclsGo = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__139, dtb__140) -> ((v_Vuna_dCompiler_dCanonical_dAst_dencDecl dtb__139) ((v_Vuna_dCompiler_dCanonical_dAst_dencDeclsGo dtb__140) mc1))
  | Base_dList.C_Base_dList_dList_Nil -> mc1
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dCanonical_dAst_dencDecl = (fun mc0 mc1 -> (match mc0 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DInstance (dtb__141, dtb__142, dtb__143, dtb__144) -> ((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_dencTag 7) ((v_Vuna_dCompiler_dCanonical_dAst_dencExprList dtb__141) ((v_Vuna_dCompiler_dCanonical_dAst_dencExpr dtb__142) ((v_Vuna_dCompiler_dCanonical_dAst_dencDecls dtb__143) mc1))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DTrait (dtb__145, dtb__146, dtb__147, dtb__148) -> ((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_dencTag 6) ((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_dencStr dtb__145) ((v_Vuna_dCompiler_dCanonical_dAst_dencTraitParamList dtb__146) ((v_Vuna_dCompiler_dCanonical_dAst_dencTraitMethodList dtb__147) mc1))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DRecord (dtb__149, dtb__150, dtb__151, dtb__152, dtb__153, dtb__154, dtb__155, dtb__156) -> ((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_dencTag 5) ((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_dencStr dtb__149) ((v_Vuna_dCompiler_dCanonical_dAst_dencStrList dtb__150) ((v_Vuna_dCompiler_dCanonical_dAst_dencFieldList dtb__151) ((v_Vuna_dCompiler_dCanonical_dAst_dencStrList dtb__152) ((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_dencBool dtb__153) ((v_Vuna_dCompiler_dCanonical_dAst_dencReprTier dtb__154) ((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_dencBool dtb__155) mc1))))))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DFun (dtb__157, dtb__158, dtb__159, dtb__160) -> ((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_dencTag 4) ((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_dencStr dtb__157) ((v_Vuna_dCompiler_dCanonical_dAst_dencPatList dtb__158) ((v_Vuna_dCompiler_dCanonical_dAst_dencExpr dtb__159) mc1))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DSig (dtb__161, dtb__162, dtb__163, dtb__164) -> ((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_dencTag 3) ((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_dencStr dtb__161) ((v_Vuna_dCompiler_dCanonical_dAst_dencExprList dtb__162) ((v_Vuna_dCompiler_dCanonical_dAst_dencExpr dtb__163) mc1))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DExtern (dtb__165, dtb__166, dtb__167, dtb__168) -> ((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_dencTag 2) ((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_dencStr dtb__165) ((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_dencStr dtb__166) ((v_Vuna_dCompiler_dCanonical_dAst_dencExpr dtb__167) mc1))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DAxiom (dtb__169, dtb__170, dtb__171) -> ((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_dencTag 1) ((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_dencStr dtb__169) ((v_Vuna_dCompiler_dCanonical_dAst_dencExpr dtb__170) mc1)))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DData (dtb__172, dtb__173, dtb__174, dtb__175, dtb__176, dtb__177, dtb__178, dtb__179, dtb__180) -> ((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_dencTag 0) ((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_dencStr dtb__172) ((v_Vuna_dCompiler_dCanonical_dAst_dencStrList dtb__173) ((v_Vuna_dCompiler_dCanonical_dAst_dencExpr dtb__174) ((v_Vuna_dCompiler_dCanonical_dAst_dencCtorList dtb__175) ((v_Vuna_dCompiler_dCanonical_dAst_dencStrList dtb__176) ((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_dencBool dtb__177) ((v_Vuna_dCompiler_dCanonical_dAst_dencReprTier dtb__178) ((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_dencBool dtb__179) mc1)))))))))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCanonical_dAst_ddecQty = (fun fuel bytes -> (if (fuel <= 0) then Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing else ((fun nd_uscrut2 -> (match nd_uscrut2 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__181) -> (match dtb__181 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__182; Base_dPair.f_Base_dPair_dPair_second = dtb__183 } -> (if (dtb__182 = 0) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Base_dPair.f_Base_dPair_dPair_first = Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dQty_Q0; Base_dPair.f_Base_dPair_dPair_second = dtb__183 })) else (if (dtb__182 = 1) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Base_dPair.f_Base_dPair_dPair_first = Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dQty_Q1; Base_dPair.f_Base_dPair_dPair_second = dtb__183 })) else Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_ddecTag fuel) bytes))))

let v_Vuna_dCompiler_dCanonical_dAst_ddecReprTier = (fun fuel bytes -> (if (fuel <= 0) then Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing else ((fun nd_uscrut2 -> (match nd_uscrut2 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__184) -> (match dtb__184 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__185; Base_dPair.f_Base_dPair_dPair_second = dtb__186 } -> (if (dtb__185 = 0) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Base_dPair.f_Base_dPair_dPair_first = Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dReprTier_ReprAuto; Base_dPair.f_Base_dPair_dPair_second = dtb__186 })) else (if (dtb__185 = 1) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Base_dPair.f_Base_dPair_dPair_first = Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dReprTier_ReprTransparent; Base_dPair.f_Base_dPair_dPair_second = dtb__186 })) else (if (dtb__185 = 2) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Base_dPair.f_Base_dPair_dPair_first = Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dReprTier_ReprOpaque; Base_dPair.f_Base_dPair_dPair_second = dtb__186 })) else Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing)))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_ddecTag fuel) bytes))))

let v_Vuna_dCompiler_dCanonical_dAst_ddecMaybeQty = (fun fuel bytes -> (((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_ddecMaybe v_Vuna_dCompiler_dCanonical_dAst_ddecQty) fuel) bytes))

let rec v_Vuna_dCompiler_dCanonical_dAst_ddecListDigits = (fun fuel acc bytes -> (if (fuel <= 0) then Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing else (match bytes with
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | Base_dList.C_Base_dList_dList_Cons (dtb__187, dtb__188) -> (if (dtb__187 = 58) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Base_dPair.f_Base_dPair_dPair_first = acc; Base_dPair.f_Base_dPair_dPair_second = dtb__188 })) else (if (if (dtb__187 >= 48) then (dtb__187 <= 57) else false) then (((v_Vuna_dCompiler_dCanonical_dAst_ddecListDigits (fuel - 1)) ((acc * 10) + (dtb__187 - 48))) dtb__188) else Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing))
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dCanonical_dAst_ddecListHead = (fun fuel bytes -> (if (fuel <= 0) then Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing else (match bytes with
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | Base_dList.C_Base_dList_dList_Cons (dtb__189, dtb__190) -> (if (dtb__189 = 91) then (((v_Vuna_dCompiler_dCanonical_dAst_ddecListDigits (fuel - 1)) 0) dtb__190) else Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing)
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dCanonical_dAst_ddecPat = (fun fuel bytes -> (if (fuel <= 0) then Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing else ((fun nd_uscrut2 -> (match nd_uscrut2 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__191) -> (match dtb__191 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__192; Base_dPair.f_Base_dPair_dPair_second = dtb__193 } -> (if (dtb__192 = 0) then ((fun nd_uscrut9 -> (match nd_uscrut9 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__194) -> (match dtb__194 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__195; Base_dPair.f_Base_dPair_dPair_second = dtb__196 } -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PVar (dtb__195, v_Vuna_dCompiler_dCanonical_dAst_dnoSpan)); Base_dPair.f_Base_dPair_dPair_second = dtb__196 }))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_ddecStr (fuel - 1)) dtb__193)) else (if (dtb__192 = 1) then ((fun nd_uscrut9 -> (match nd_uscrut9 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__197) -> (match dtb__197 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__198; Base_dPair.f_Base_dPair_dPair_second = dtb__199 } -> ((fun nd_uscrut16 -> (match nd_uscrut16 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__200) -> (match dtb__200 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__201; Base_dPair.f_Base_dPair_dPair_second = dtb__202 } -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PAs (dtb__198, dtb__201, v_Vuna_dCompiler_dCanonical_dAst_dnoSpan)); Base_dPair.f_Base_dPair_dPair_second = dtb__202 }))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dCanonical_dAst_ddecPat (fuel - 1)) dtb__199))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_ddecStr (fuel - 1)) dtb__193)) else (if (dtb__192 = 2) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PWild (v_Vuna_dCompiler_dCanonical_dAst_dnoSpan)); Base_dPair.f_Base_dPair_dPair_second = dtb__193 })) else (if (dtb__192 = 3) then ((fun nd_uscrut9 -> (match nd_uscrut9 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__203) -> (match dtb__203 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__204; Base_dPair.f_Base_dPair_dPair_second = dtb__205 } -> ((fun nd_uscrut16 -> (match nd_uscrut16 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__206) -> (match dtb__206 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__207; Base_dPair.f_Base_dPair_dPair_second = dtb__208 } -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PCon (dtb__204, dtb__207, v_Vuna_dCompiler_dCanonical_dAst_dnoSpan)); Base_dPair.f_Base_dPair_dPair_second = dtb__208 }))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dCanonical_dAst_ddecPatList (fuel - 1)) dtb__205))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_ddecStr (fuel - 1)) dtb__193)) else (if (dtb__192 = 4) then ((fun nd_uscrut9 -> (match nd_uscrut9 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__209) -> (match dtb__209 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__210; Base_dPair.f_Base_dPair_dPair_second = dtb__211 } -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PInt (dtb__210, v_Vuna_dCompiler_dCanonical_dAst_dnoSpan)); Base_dPair.f_Base_dPair_dPair_second = dtb__211 }))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_ddecInt (fuel - 1)) dtb__193)) else (if (dtb__192 = 5) then ((fun nd_uscrut9 -> (match nd_uscrut9 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__212) -> (match dtb__212 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__213; Base_dPair.f_Base_dPair_dPair_second = dtb__214 } -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PStr (dtb__213, v_Vuna_dCompiler_dCanonical_dAst_dnoSpan)); Base_dPair.f_Base_dPair_dPair_second = dtb__214 }))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_ddecStr (fuel - 1)) dtb__193)) else (if (dtb__192 = 6) then ((fun nd_uscrut9 -> (match nd_uscrut9 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__215) -> (match dtb__215 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__216; Base_dPair.f_Base_dPair_dPair_second = dtb__217 } -> ((fun nd_uscrut16 -> (match nd_uscrut16 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__218) -> (match dtb__218 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__219; Base_dPair.f_Base_dPair_dPair_second = dtb__220 } -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PRecord (dtb__216, dtb__219, v_Vuna_dCompiler_dCanonical_dAst_dnoSpan)); Base_dPair.f_Base_dPair_dPair_second = dtb__220 }))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) (((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_ddecList v_Vuna_dCompiler_dCanonical_dAst_ddecStrPat) (fuel - 1)) dtb__217))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_ddecStr (fuel - 1)) dtb__193)) else Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing)))))))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_ddecTag fuel) bytes))))
and v_Vuna_dCompiler_dCanonical_dAst_ddecStrPat = (fun fuel bytes -> (if (fuel <= 0) then Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing else ((fun nd_uscrut2 -> (match nd_uscrut2 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__221) -> (match dtb__221 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__222; Base_dPair.f_Base_dPair_dPair_second = dtb__223 } -> ((fun nd_uscrut9 -> (match nd_uscrut9 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__224) -> (match dtb__224 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__225; Base_dPair.f_Base_dPair_dPair_second = dtb__226 } -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Base_dPair.f_Base_dPair_dPair_first = { Base_dPair.f_Base_dPair_dPair_first = dtb__222; Base_dPair.f_Base_dPair_dPair_second = dtb__225 }; Base_dPair.f_Base_dPair_dPair_second = dtb__226 }))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dCanonical_dAst_ddecPat (fuel - 1)) dtb__223))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_ddecStr (fuel - 1)) bytes))))
and v_Vuna_dCompiler_dCanonical_dAst_ddecPatList = (fun fuel bytes -> (if (fuel <= 0) then Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing else ((fun nd_uscrut2 -> (match nd_uscrut2 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__227) -> (match dtb__227 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__228; Base_dPair.f_Base_dPair_dPair_second = dtb__229 } -> ((((v_Vuna_dCompiler_dCanonical_dAst_ddecPatListItems (fuel - 1)) dtb__228) dtb__229) Base_dList.C_Base_dList_dList_Nil)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dCanonical_dAst_ddecListHead fuel) bytes))))
and v_Vuna_dCompiler_dCanonical_dAst_ddecPatListItems = (fun fuel n bytes acc -> (if (fuel <= 0) then Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing else (if (n <= 0) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Base_dPair.f_Base_dPair_dPair_first = (Base_dList.v_Base_dList_dreverse acc); Base_dPair.f_Base_dPair_dPair_second = bytes })) else ((fun nd_uscrut4 -> (match nd_uscrut4 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__230) -> (match dtb__230 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__231; Base_dPair.f_Base_dPair_dPair_second = dtb__232 } -> ((((v_Vuna_dCompiler_dCanonical_dAst_ddecPatListItems (fuel - 1)) (n - 1)) dtb__232) (Base_dList.C_Base_dList_dList_Cons (dtb__231, acc)))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dCanonical_dAst_ddecPat (fuel - 1)) bytes)))))

let rec v_Vuna_dCompiler_dCanonical_dAst_ddecInterpPart = (fun fuel bytes -> (if (fuel <= 0) then Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing else ((fun nd_uscrut2 -> (match nd_uscrut2 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__233) -> (match dtb__233 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__234; Base_dPair.f_Base_dPair_dPair_second = dtb__235 } -> (if (dtb__234 = 0) then ((fun nd_uscrut9 -> (match nd_uscrut9 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__236) -> (match dtb__236 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__237; Base_dPair.f_Base_dPair_dPair_second = dtb__238 } -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dInterpPart_IPText (dtb__237)); Base_dPair.f_Base_dPair_dPair_second = dtb__238 }))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_ddecStr (fuel - 1)) dtb__235)) else (if (dtb__234 = 1) then ((fun nd_uscrut9 -> (match nd_uscrut9 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__239) -> (match dtb__239 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__240; Base_dPair.f_Base_dPair_dPair_second = dtb__241 } -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dInterpPart_IPHole (dtb__240)); Base_dPair.f_Base_dPair_dPair_second = dtb__241 }))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dCanonical_dAst_ddecExpr (fuel - 1)) dtb__235)) else Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_ddecTag fuel) bytes))))
and v_Vuna_dCompiler_dCanonical_dAst_ddecDoStmt = (fun fuel bytes -> (if (fuel <= 0) then Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing else ((fun nd_uscrut2 -> (match nd_uscrut2 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__242) -> (match dtb__242 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__243; Base_dPair.f_Base_dPair_dPair_second = dtb__244 } -> (if (dtb__243 = 0) then ((fun nd_uscrut9 -> (match nd_uscrut9 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__245) -> (match dtb__245 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__246; Base_dPair.f_Base_dPair_dPair_second = dtb__247 } -> ((fun nd_uscrut16 -> (match nd_uscrut16 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__248) -> (match dtb__248 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__249; Base_dPair.f_Base_dPair_dPair_second = dtb__250 } -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDoStmt_DBind (dtb__246, dtb__249, v_Vuna_dCompiler_dCanonical_dAst_dnoSpan)); Base_dPair.f_Base_dPair_dPair_second = dtb__250 }))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dCanonical_dAst_ddecExpr (fuel - 1)) dtb__247))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dCanonical_dAst_ddecPat (fuel - 1)) dtb__244)) else (if (dtb__243 = 1) then ((fun nd_uscrut9 -> (match nd_uscrut9 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__251) -> (match dtb__251 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__252; Base_dPair.f_Base_dPair_dPair_second = dtb__253 } -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDoStmt_DExpr (dtb__252, v_Vuna_dCompiler_dCanonical_dAst_dnoSpan)); Base_dPair.f_Base_dPair_dPair_second = dtb__253 }))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dCanonical_dAst_ddecExpr (fuel - 1)) dtb__244)) else Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_ddecTag fuel) bytes))))
and v_Vuna_dCompiler_dCanonical_dAst_ddecExpr = (fun fuel bytes -> (if (fuel <= 0) then Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing else ((fun nd_uscrut2 -> (match nd_uscrut2 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__254) -> (match dtb__254 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__255; Base_dPair.f_Base_dPair_dPair_second = dtb__256 } -> (if (dtb__255 = 0) then ((fun nd_uscrut9 -> (match nd_uscrut9 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__257) -> (match dtb__257 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__258; Base_dPair.f_Base_dPair_dPair_second = dtb__259 } -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__258, v_Vuna_dCompiler_dCanonical_dAst_dnoSpan)); Base_dPair.f_Base_dPair_dPair_second = dtb__259 }))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_ddecStr (fuel - 1)) dtb__256)) else (if (dtb__255 = 1) then ((fun nd_uscrut9 -> (match nd_uscrut9 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__260) -> (match dtb__260 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__261; Base_dPair.f_Base_dPair_dPair_second = dtb__262 } -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EInt (dtb__261, v_Vuna_dCompiler_dCanonical_dAst_dnoSpan)); Base_dPair.f_Base_dPair_dPair_second = dtb__262 }))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_ddecInt (fuel - 1)) dtb__256)) else (if (dtb__255 = 2) then ((fun nd_uscrut9 -> (match nd_uscrut9 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__263) -> (match dtb__263 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__264; Base_dPair.f_Base_dPair_dPair_second = dtb__265 } -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EStr (dtb__264, v_Vuna_dCompiler_dCanonical_dAst_dnoSpan)); Base_dPair.f_Base_dPair_dPair_second = dtb__265 }))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_ddecStr (fuel - 1)) dtb__256)) else (if (dtb__255 = 3) then ((fun nd_uscrut9 -> (match nd_uscrut9 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__266) -> (match dtb__266 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__267; Base_dPair.f_Base_dPair_dPair_second = dtb__268 } -> ((fun nd_uscrut16 -> (match nd_uscrut16 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__269) -> (match dtb__269 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__270; Base_dPair.f_Base_dPair_dPair_second = dtb__271 } -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ELam (dtb__267, dtb__270, v_Vuna_dCompiler_dCanonical_dAst_dnoSpan)); Base_dPair.f_Base_dPair_dPair_second = dtb__271 }))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dCanonical_dAst_ddecExpr (fuel - 1)) dtb__268))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) (((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_ddecList Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_ddecStr) (fuel - 1)) dtb__256)) else (if (dtb__255 = 4) then ((fun nd_uscrut9 -> (match nd_uscrut9 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__272) -> (match dtb__272 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__273; Base_dPair.f_Base_dPair_dPair_second = dtb__274 } -> ((fun nd_uscrut16 -> (match nd_uscrut16 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__275) -> (match dtb__275 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__276; Base_dPair.f_Base_dPair_dPair_second = dtb__277 } -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp (dtb__273, dtb__276, v_Vuna_dCompiler_dCanonical_dAst_dnoSpan)); Base_dPair.f_Base_dPair_dPair_second = dtb__277 }))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dCanonical_dAst_ddecExprList (fuel - 1)) dtb__274))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dCanonical_dAst_ddecExpr (fuel - 1)) dtb__256)) else (if (dtb__255 = 5) then ((fun nd_uscrut9 -> (match nd_uscrut9 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__278) -> (match dtb__278 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__279; Base_dPair.f_Base_dPair_dPair_second = dtb__280 } -> ((fun nd_uscrut16 -> (match nd_uscrut16 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__281) -> (match dtb__281 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__282; Base_dPair.f_Base_dPair_dPair_second = dtb__283 } -> ((fun nd_uscrut23 -> (match nd_uscrut23 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__284) -> (match dtb__284 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__285; Base_dPair.f_Base_dPair_dPair_second = dtb__286 } -> ((fun nd_uscrut30 -> (match nd_uscrut30 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__287) -> (match dtb__287 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__288; Base_dPair.f_Base_dPair_dPair_second = dtb__289 } -> ((fun nd_uscrut37 -> (match nd_uscrut37 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__290) -> (match dtb__290 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__291; Base_dPair.f_Base_dPair_dPair_second = dtb__292 } -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EPi (dtb__279, dtb__282, dtb__285, dtb__288, dtb__291, v_Vuna_dCompiler_dCanonical_dAst_dnoSpan)); Base_dPair.f_Base_dPair_dPair_second = dtb__292 }))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dCanonical_dAst_ddecExpr (fuel - 1)) dtb__289))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dCanonical_dAst_ddecExpr (fuel - 1)) dtb__286))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) (((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_ddecMaybe v_Vuna_dCompiler_dCanonical_dAst_ddecQty) (fuel - 1)) dtb__283))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_ddecBool (fuel - 1)) dtb__280))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_ddecStr (fuel - 1)) dtb__256)) else (if (dtb__255 = 6) then ((fun nd_uscrut9 -> (match nd_uscrut9 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__293) -> (match dtb__293 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__294; Base_dPair.f_Base_dPair_dPair_second = dtb__295 } -> ((fun nd_uscrut16 -> (match nd_uscrut16 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__296) -> (match dtb__296 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__297; Base_dPair.f_Base_dPair_dPair_second = dtb__298 } -> ((fun nd_uscrut23 -> (match nd_uscrut23 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__299) -> (match dtb__299 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__300; Base_dPair.f_Base_dPair_dPair_second = dtb__301 } -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ELet (dtb__294, dtb__297, dtb__300, v_Vuna_dCompiler_dCanonical_dAst_dnoSpan)); Base_dPair.f_Base_dPair_dPair_second = dtb__301 }))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_ddecBool (fuel - 1)) dtb__298))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dCanonical_dAst_ddecExpr (fuel - 1)) dtb__295))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) (((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_ddecList v_Vuna_dCompiler_dCanonical_dAst_ddecPatExpr) (fuel - 1)) dtb__256)) else (if (dtb__255 = 7) then ((fun nd_uscrut9 -> (match nd_uscrut9 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__302) -> (match dtb__302 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__303; Base_dPair.f_Base_dPair_dPair_second = dtb__304 } -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ELocalFun (dtb__303, v_Vuna_dCompiler_dCanonical_dAst_dnoSpan)); Base_dPair.f_Base_dPair_dPair_second = dtb__304 }))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) (((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_ddecList v_Vuna_dCompiler_dCanonical_dAst_ddecClause) (fuel - 1)) dtb__256)) else (if (dtb__255 = 8) then ((fun nd_uscrut9 -> (match nd_uscrut9 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__305) -> (match dtb__305 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__306; Base_dPair.f_Base_dPair_dPair_second = dtb__307 } -> ((fun nd_uscrut16 -> (match nd_uscrut16 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__308) -> (match dtb__308 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__309; Base_dPair.f_Base_dPair_dPair_second = dtb__310 } -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ECase (dtb__306, dtb__309, v_Vuna_dCompiler_dCanonical_dAst_dnoSpan)); Base_dPair.f_Base_dPair_dPair_second = dtb__310 }))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) (((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_ddecList v_Vuna_dCompiler_dCanonical_dAst_ddecPatExpr) (fuel - 1)) dtb__307))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dCanonical_dAst_ddecExpr (fuel - 1)) dtb__256)) else (if (dtb__255 = 9) then ((fun nd_uscrut9 -> (match nd_uscrut9 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__311) -> (match dtb__311 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__312; Base_dPair.f_Base_dPair_dPair_second = dtb__313 } -> ((fun nd_uscrut16 -> (match nd_uscrut16 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__314) -> (match dtb__314 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__315; Base_dPair.f_Base_dPair_dPair_second = dtb__316 } -> ((fun nd_uscrut23 -> (match nd_uscrut23 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__317) -> (match dtb__317 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__318; Base_dPair.f_Base_dPair_dPair_second = dtb__319 } -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EIf (dtb__312, dtb__315, dtb__318, v_Vuna_dCompiler_dCanonical_dAst_dnoSpan)); Base_dPair.f_Base_dPair_dPair_second = dtb__319 }))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dCanonical_dAst_ddecExpr (fuel - 1)) dtb__316))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dCanonical_dAst_ddecExpr (fuel - 1)) dtb__313))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dCanonical_dAst_ddecExpr (fuel - 1)) dtb__256)) else (if (dtb__255 = 10) then ((fun nd_uscrut9 -> (match nd_uscrut9 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__320) -> (match dtb__320 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__321; Base_dPair.f_Base_dPair_dPair_second = dtb__322 } -> ((fun nd_uscrut16 -> (match nd_uscrut16 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__323) -> (match dtb__323 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__324; Base_dPair.f_Base_dPair_dPair_second = dtb__325 } -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EField (dtb__321, dtb__324, v_Vuna_dCompiler_dCanonical_dAst_dnoSpan)); Base_dPair.f_Base_dPair_dPair_second = dtb__325 }))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_ddecStr (fuel - 1)) dtb__322))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dCanonical_dAst_ddecExpr (fuel - 1)) dtb__256)) else (if (dtb__255 = 11) then ((fun nd_uscrut9 -> (match nd_uscrut9 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__326) -> (match dtb__326 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__327; Base_dPair.f_Base_dPair_dPair_second = dtb__328 } -> ((fun nd_uscrut16 -> (match nd_uscrut16 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__329) -> (match dtb__329 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__330; Base_dPair.f_Base_dPair_dPair_second = dtb__331 } -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ERecord (dtb__327, dtb__330, v_Vuna_dCompiler_dCanonical_dAst_dnoSpan)); Base_dPair.f_Base_dPair_dPair_second = dtb__331 }))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) (((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_ddecList v_Vuna_dCompiler_dCanonical_dAst_ddecStrExpr) (fuel - 1)) dtb__328))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_ddecStr (fuel - 1)) dtb__256)) else (if (dtb__255 = 12) then ((fun nd_uscrut9 -> (match nd_uscrut9 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__332) -> (match dtb__332 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__333; Base_dPair.f_Base_dPair_dPair_second = dtb__334 } -> ((fun nd_uscrut16 -> (match nd_uscrut16 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__335) -> (match dtb__335 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__336; Base_dPair.f_Base_dPair_dPair_second = dtb__337 } -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ERecUpdate (dtb__333, dtb__336, v_Vuna_dCompiler_dCanonical_dAst_dnoSpan)); Base_dPair.f_Base_dPair_dPair_second = dtb__337 }))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) (((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_ddecList v_Vuna_dCompiler_dCanonical_dAst_ddecStrExpr) (fuel - 1)) dtb__334))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dCanonical_dAst_ddecExpr (fuel - 1)) dtb__256)) else (if (dtb__255 = 13) then ((fun nd_uscrut9 -> (match nd_uscrut9 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__338) -> (match dtb__338 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__339; Base_dPair.f_Base_dPair_dPair_second = dtb__340 } -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EDo (dtb__339, v_Vuna_dCompiler_dCanonical_dAst_dnoSpan)); Base_dPair.f_Base_dPair_dPair_second = dtb__340 }))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) (((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_ddecList v_Vuna_dCompiler_dCanonical_dAst_ddecDoStmt) (fuel - 1)) dtb__256)) else (if (dtb__255 = 14) then ((fun nd_uscrut9 -> (match nd_uscrut9 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__341) -> (match dtb__341 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__342; Base_dPair.f_Base_dPair_dPair_second = dtb__343 } -> ((fun nd_uscrut16 -> (match nd_uscrut16 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__344) -> (match dtb__344 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__345; Base_dPair.f_Base_dPair_dPair_second = dtb__346 } -> ((fun nd_uscrut23 -> (match nd_uscrut23 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__347) -> (match dtb__347 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__348; Base_dPair.f_Base_dPair_dPair_second = dtb__349 } -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EInfix (dtb__342, dtb__345, dtb__348, v_Vuna_dCompiler_dCanonical_dAst_dnoSpan)); Base_dPair.f_Base_dPair_dPair_second = dtb__349 }))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dCanonical_dAst_ddecExpr (fuel - 1)) dtb__346))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dCanonical_dAst_ddecExpr (fuel - 1)) dtb__343))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_ddecStr (fuel - 1)) dtb__256)) else (if (dtb__255 = 15) then ((fun nd_uscrut9 -> (match nd_uscrut9 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__350) -> (match dtb__350 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__351; Base_dPair.f_Base_dPair_dPair_second = dtb__352 } -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EParen (dtb__351, v_Vuna_dCompiler_dCanonical_dAst_dnoSpan)); Base_dPair.f_Base_dPair_dPair_second = dtb__352 }))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dCanonical_dAst_ddecExpr (fuel - 1)) dtb__256)) else (if (dtb__255 = 16) then ((fun nd_uscrut9 -> (match nd_uscrut9 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__353) -> (match dtb__353 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__354; Base_dPair.f_Base_dPair_dPair_second = dtb__355 } -> ((fun nd_uscrut16 -> (match nd_uscrut16 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__356) -> (match dtb__356 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__357; Base_dPair.f_Base_dPair_dPair_second = dtb__358 } -> ((fun nd_uscrut23 -> (match nd_uscrut23 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__359) -> (match dtb__359 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__360; Base_dPair.f_Base_dPair_dPair_second = dtb__361 } -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EBacktick (dtb__354, dtb__357, dtb__360, v_Vuna_dCompiler_dCanonical_dAst_dnoSpan)); Base_dPair.f_Base_dPair_dPair_second = dtb__361 }))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dCanonical_dAst_ddecExpr (fuel - 1)) dtb__358))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dCanonical_dAst_ddecExpr (fuel - 1)) dtb__355))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_ddecStr (fuel - 1)) dtb__256)) else (if (dtb__255 = 17) then ((fun nd_uscrut9 -> (match nd_uscrut9 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__362) -> (match dtb__362 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__363; Base_dPair.f_Base_dPair_dPair_second = dtb__364 } -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ESectOp (dtb__363, v_Vuna_dCompiler_dCanonical_dAst_dnoSpan)); Base_dPair.f_Base_dPair_dPair_second = dtb__364 }))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_ddecStr (fuel - 1)) dtb__256)) else (if (dtb__255 = 18) then ((fun nd_uscrut9 -> (match nd_uscrut9 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__365) -> (match dtb__365 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__366; Base_dPair.f_Base_dPair_dPair_second = dtb__367 } -> ((fun nd_uscrut16 -> (match nd_uscrut16 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__368) -> (match dtb__368 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__369; Base_dPair.f_Base_dPair_dPair_second = dtb__370 } -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ESectL (dtb__366, dtb__369, v_Vuna_dCompiler_dCanonical_dAst_dnoSpan)); Base_dPair.f_Base_dPair_dPair_second = dtb__370 }))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dCanonical_dAst_ddecExpr (fuel - 1)) dtb__367))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_ddecStr (fuel - 1)) dtb__256)) else (if (dtb__255 = 19) then ((fun nd_uscrut9 -> (match nd_uscrut9 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__371) -> (match dtb__371 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__372; Base_dPair.f_Base_dPair_dPair_second = dtb__373 } -> ((fun nd_uscrut16 -> (match nd_uscrut16 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__374) -> (match dtb__374 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__375; Base_dPair.f_Base_dPair_dPair_second = dtb__376 } -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ESectR (dtb__372, dtb__375, v_Vuna_dCompiler_dCanonical_dAst_dnoSpan)); Base_dPair.f_Base_dPair_dPair_second = dtb__376 }))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_ddecStr (fuel - 1)) dtb__373))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dCanonical_dAst_ddecExpr (fuel - 1)) dtb__256)) else (if (dtb__255 = 20) then ((fun nd_uscrut9 -> (match nd_uscrut9 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__377) -> (match dtb__377 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__378; Base_dPair.f_Base_dPair_dPair_second = dtb__379 } -> ((fun nd_uscrut16 -> (match nd_uscrut16 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__380) -> (match dtb__380 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__381; Base_dPair.f_Base_dPair_dPair_second = dtb__382 } -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EAnn (dtb__378, dtb__381, v_Vuna_dCompiler_dCanonical_dAst_dnoSpan)); Base_dPair.f_Base_dPair_dPair_second = dtb__382 }))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dCanonical_dAst_ddecExpr (fuel - 1)) dtb__379))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dCanonical_dAst_ddecExpr (fuel - 1)) dtb__256)) else (if (dtb__255 = 21) then ((fun nd_uscrut9 -> (match nd_uscrut9 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__383) -> (match dtb__383 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__384; Base_dPair.f_Base_dPair_dPair_second = dtb__385 } -> ((fun nd_uscrut16 -> (match nd_uscrut16 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__386) -> (match dtb__386 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__387; Base_dPair.f_Base_dPair_dPair_second = dtb__388 } -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EInterp (dtb__384, dtb__387, v_Vuna_dCompiler_dCanonical_dAst_dnoSpan)); Base_dPair.f_Base_dPair_dPair_second = dtb__388 }))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) (((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_ddecList v_Vuna_dCompiler_dCanonical_dAst_ddecInterpPart) (fuel - 1)) dtb__385))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_ddecBool (fuel - 1)) dtb__256)) else (if (dtb__255 = 22) then ((fun nd_uscrut9 -> (match nd_uscrut9 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__389) -> (match dtb__389 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__390; Base_dPair.f_Base_dPair_dPair_second = dtb__391 } -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EFloat (dtb__390, v_Vuna_dCompiler_dCanonical_dAst_dnoSpan)); Base_dPair.f_Base_dPair_dPair_second = dtb__391 }))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_ddecStr (fuel - 1)) dtb__256)) else Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing)))))))))))))))))))))))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_ddecTag fuel) bytes))))
and v_Vuna_dCompiler_dCanonical_dAst_ddecPatExpr = (fun fuel bytes -> (if (fuel <= 0) then Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing else ((fun nd_uscrut2 -> (match nd_uscrut2 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__392) -> (match dtb__392 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__393; Base_dPair.f_Base_dPair_dPair_second = dtb__394 } -> ((fun nd_uscrut9 -> (match nd_uscrut9 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__395) -> (match dtb__395 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__396; Base_dPair.f_Base_dPair_dPair_second = dtb__397 } -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Base_dPair.f_Base_dPair_dPair_first = { Base_dPair.f_Base_dPair_dPair_first = dtb__393; Base_dPair.f_Base_dPair_dPair_second = dtb__396 }; Base_dPair.f_Base_dPair_dPair_second = dtb__397 }))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dCanonical_dAst_ddecExpr (fuel - 1)) dtb__394))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dCanonical_dAst_ddecPat (fuel - 1)) bytes))))
and v_Vuna_dCompiler_dCanonical_dAst_ddecClause = (fun fuel bytes -> (if (fuel <= 0) then Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing else ((fun nd_uscrut2 -> (match nd_uscrut2 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__398) -> (match dtb__398 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__399; Base_dPair.f_Base_dPair_dPair_second = dtb__400 } -> ((fun nd_uscrut9 -> (match nd_uscrut9 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__401) -> (match dtb__401 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__402; Base_dPair.f_Base_dPair_dPair_second = dtb__403 } -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Base_dPair.f_Base_dPair_dPair_first = { Base_dPair.f_Base_dPair_dPair_first = dtb__399; Base_dPair.f_Base_dPair_dPair_second = dtb__402 }; Base_dPair.f_Base_dPair_dPair_second = dtb__403 }))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dCanonical_dAst_ddecExpr (fuel - 1)) dtb__400))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dCanonical_dAst_ddecPatList (fuel - 1)) bytes))))
and v_Vuna_dCompiler_dCanonical_dAst_ddecStrExpr = (fun fuel bytes -> (if (fuel <= 0) then Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing else ((fun nd_uscrut2 -> (match nd_uscrut2 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__404) -> (match dtb__404 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__405; Base_dPair.f_Base_dPair_dPair_second = dtb__406 } -> ((fun nd_uscrut9 -> (match nd_uscrut9 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__407) -> (match dtb__407 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__408; Base_dPair.f_Base_dPair_dPair_second = dtb__409 } -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Base_dPair.f_Base_dPair_dPair_first = { Base_dPair.f_Base_dPair_dPair_first = dtb__405; Base_dPair.f_Base_dPair_dPair_second = dtb__408 }; Base_dPair.f_Base_dPair_dPair_second = dtb__409 }))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dCanonical_dAst_ddecExpr (fuel - 1)) dtb__406))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_ddecStr (fuel - 1)) bytes))))
and v_Vuna_dCompiler_dCanonical_dAst_ddecExprList = (fun fuel bytes -> (if (fuel <= 0) then Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing else ((fun nd_uscrut2 -> (match nd_uscrut2 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__410) -> (match dtb__410 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__411; Base_dPair.f_Base_dPair_dPair_second = dtb__412 } -> ((((v_Vuna_dCompiler_dCanonical_dAst_ddecExprListItems (fuel - 1)) dtb__411) dtb__412) Base_dList.C_Base_dList_dList_Nil)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dCanonical_dAst_ddecListHead fuel) bytes))))
and v_Vuna_dCompiler_dCanonical_dAst_ddecExprListItems = (fun fuel n bytes acc -> (if (fuel <= 0) then Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing else (if (n <= 0) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Base_dPair.f_Base_dPair_dPair_first = (Base_dList.v_Base_dList_dreverse acc); Base_dPair.f_Base_dPair_dPair_second = bytes })) else ((fun nd_uscrut4 -> (match nd_uscrut4 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__413) -> (match dtb__413 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__414; Base_dPair.f_Base_dPair_dPair_second = dtb__415 } -> ((((v_Vuna_dCompiler_dCanonical_dAst_ddecExprListItems (fuel - 1)) (n - 1)) dtb__415) (Base_dList.C_Base_dList_dList_Cons (dtb__414, acc)))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dCanonical_dAst_ddecExpr (fuel - 1)) bytes)))))

let v_Vuna_dCompiler_dCanonical_dAst_ddecMaybeExpr = (fun fuel bytes -> (((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_ddecMaybe v_Vuna_dCompiler_dCanonical_dAst_ddecExpr) fuel) bytes))

let v_Vuna_dCompiler_dCanonical_dAst_ddecCtor = (fun fuel bytes -> (if (fuel <= 0) then Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing else ((fun nd_uscrut2 -> (match nd_uscrut2 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__416) -> (match dtb__416 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__417; Base_dPair.f_Base_dPair_dPair_second = dtb__418 } -> (if (dtb__417 = 0) then ((fun nd_uscrut9 -> (match nd_uscrut9 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__419) -> (match dtb__419 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__420; Base_dPair.f_Base_dPair_dPair_second = dtb__421 } -> ((fun nd_uscrut16 -> (match nd_uscrut16 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__422) -> (match dtb__422 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__423; Base_dPair.f_Base_dPair_dPair_second = dtb__424 } -> ((fun nd_uscrut23 -> (match nd_uscrut23 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__425) -> (match dtb__425 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__426; Base_dPair.f_Base_dPair_dPair_second = dtb__427 } -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Base_dPair.f_Base_dPair_dPair_first = { Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dCtor_ctorName = dtb__420; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dCtor_ctorType = dtb__423; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dCtor_ctorArity = dtb__426; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dCtor_ctorSpan = v_Vuna_dCompiler_dCanonical_dAst_dnoSpan }; Base_dPair.f_Base_dPair_dPair_second = dtb__427 }))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_ddecInt (fuel - 1)) dtb__424))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dCanonical_dAst_ddecExpr (fuel - 1)) dtb__421))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_ddecStr (fuel - 1)) dtb__418)) else Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_ddecTag fuel) bytes))))

let v_Vuna_dCompiler_dCanonical_dAst_ddecField = (fun fuel bytes -> (if (fuel <= 0) then Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing else ((fun nd_uscrut2 -> (match nd_uscrut2 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__428) -> (match dtb__428 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__429; Base_dPair.f_Base_dPair_dPair_second = dtb__430 } -> (if (dtb__429 = 0) then ((fun nd_uscrut9 -> (match nd_uscrut9 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__431) -> (match dtb__431 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__432; Base_dPair.f_Base_dPair_dPair_second = dtb__433 } -> ((fun nd_uscrut16 -> (match nd_uscrut16 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__434) -> (match dtb__434 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__435; Base_dPair.f_Base_dPair_dPair_second = dtb__436 } -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Base_dPair.f_Base_dPair_dPair_first = { Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dField_fieldName = dtb__432; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dField_fieldType = dtb__435; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dField_fieldSpan = v_Vuna_dCompiler_dCanonical_dAst_dnoSpan }; Base_dPair.f_Base_dPair_dPair_second = dtb__436 }))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dCanonical_dAst_ddecExpr (fuel - 1)) dtb__433))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_ddecStr (fuel - 1)) dtb__430)) else Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_ddecTag fuel) bytes))))

let v_Vuna_dCompiler_dCanonical_dAst_ddecTraitParam = (fun fuel bytes -> (if (fuel <= 0) then Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing else ((fun nd_uscrut2 -> (match nd_uscrut2 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__437) -> (match dtb__437 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__438; Base_dPair.f_Base_dPair_dPair_second = dtb__439 } -> (if (dtb__438 = 0) then ((fun nd_uscrut9 -> (match nd_uscrut9 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__440) -> (match dtb__440 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__441; Base_dPair.f_Base_dPair_dPair_second = dtb__442 } -> ((fun nd_uscrut16 -> (match nd_uscrut16 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__443) -> (match dtb__443 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__444; Base_dPair.f_Base_dPair_dPair_second = dtb__445 } -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Base_dPair.f_Base_dPair_dPair_first = { Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dTraitParam_traitParamName = dtb__441; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dTraitParam_traitParamKind = dtb__444 }; Base_dPair.f_Base_dPair_dPair_second = dtb__445 }))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) (((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_ddecMaybe v_Vuna_dCompiler_dCanonical_dAst_ddecExpr) (fuel - 1)) dtb__442))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_ddecStr (fuel - 1)) dtb__439)) else Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_ddecTag fuel) bytes))))

let v_Vuna_dCompiler_dCanonical_dAst_ddecTraitMethod = (fun fuel bytes -> (if (fuel <= 0) then Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing else ((fun nd_uscrut2 -> (match nd_uscrut2 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__446) -> (match dtb__446 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__447; Base_dPair.f_Base_dPair_dPair_second = dtb__448 } -> (if (dtb__447 = 0) then ((fun nd_uscrut9 -> (match nd_uscrut9 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__449) -> (match dtb__449 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__450; Base_dPair.f_Base_dPair_dPair_second = dtb__451 } -> ((fun nd_uscrut16 -> (match nd_uscrut16 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__452) -> (match dtb__452 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__453; Base_dPair.f_Base_dPair_dPair_second = dtb__454 } -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Base_dPair.f_Base_dPair_dPair_first = { Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dTraitMethod_traitMethodName = dtb__450; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dTraitMethod_traitMethodType = dtb__453; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dTraitMethod_traitMethodSpan = v_Vuna_dCompiler_dCanonical_dAst_dnoSpan }; Base_dPair.f_Base_dPair_dPair_second = dtb__454 }))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dCanonical_dAst_ddecExpr (fuel - 1)) dtb__451))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_ddecStr (fuel - 1)) dtb__448)) else Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_ddecTag fuel) bytes))))

let rec v_Vuna_dCompiler_dCanonical_dAst_ddecDecl = (fun fuel bytes -> (if (fuel <= 0) then Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing else ((fun nd_uscrut2 -> (match nd_uscrut2 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__455) -> (match dtb__455 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__456; Base_dPair.f_Base_dPair_dPair_second = dtb__457 } -> (if (dtb__456 = 0) then ((fun nd_uscrut9 -> (match nd_uscrut9 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__458) -> (match dtb__458 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__459; Base_dPair.f_Base_dPair_dPair_second = dtb__460 } -> ((fun nd_uscrut16 -> (match nd_uscrut16 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__461) -> (match dtb__461 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__462; Base_dPair.f_Base_dPair_dPair_second = dtb__463 } -> ((fun nd_uscrut23 -> (match nd_uscrut23 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__464) -> (match dtb__464 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__465; Base_dPair.f_Base_dPair_dPair_second = dtb__466 } -> ((fun nd_uscrut30 -> (match nd_uscrut30 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__467) -> (match dtb__467 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__468; Base_dPair.f_Base_dPair_dPair_second = dtb__469 } -> ((fun nd_uscrut37 -> (match nd_uscrut37 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__470) -> (match dtb__470 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__471; Base_dPair.f_Base_dPair_dPair_second = dtb__472 } -> ((fun nd_uscrut44 -> (match nd_uscrut44 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__473) -> (match dtb__473 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__474; Base_dPair.f_Base_dPair_dPair_second = dtb__475 } -> ((fun nd_uscrut51 -> (match nd_uscrut51 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__476) -> (match dtb__476 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__477; Base_dPair.f_Base_dPair_dPair_second = dtb__478 } -> ((fun nd_uscrut58 -> (match nd_uscrut58 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__479) -> (match dtb__479 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__480; Base_dPair.f_Base_dPair_dPair_second = dtb__481 } -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DData (dtb__459, dtb__462, dtb__465, dtb__468, dtb__471, dtb__474, dtb__477, dtb__480, v_Vuna_dCompiler_dCanonical_dAst_dnoSpan)); Base_dPair.f_Base_dPair_dPair_second = dtb__481 }))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_ddecBool (fuel - 1)) dtb__478))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dCanonical_dAst_ddecReprTier (fuel - 1)) dtb__475))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_ddecBool (fuel - 1)) dtb__472))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) (((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_ddecList Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_ddecStr) (fuel - 1)) dtb__469))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) (((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_ddecList v_Vuna_dCompiler_dCanonical_dAst_ddecCtor) (fuel - 1)) dtb__466))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dCanonical_dAst_ddecExpr (fuel - 1)) dtb__463))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) (((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_ddecList Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_ddecStr) (fuel - 1)) dtb__460))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_ddecStr (fuel - 1)) dtb__457)) else (if (dtb__456 = 1) then ((fun nd_uscrut9 -> (match nd_uscrut9 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__482) -> (match dtb__482 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__483; Base_dPair.f_Base_dPair_dPair_second = dtb__484 } -> ((fun nd_uscrut16 -> (match nd_uscrut16 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__485) -> (match dtb__485 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__486; Base_dPair.f_Base_dPair_dPair_second = dtb__487 } -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DAxiom (dtb__483, dtb__486, v_Vuna_dCompiler_dCanonical_dAst_dnoSpan)); Base_dPair.f_Base_dPair_dPair_second = dtb__487 }))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dCanonical_dAst_ddecExpr (fuel - 1)) dtb__484))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_ddecStr (fuel - 1)) dtb__457)) else (if (dtb__456 = 2) then ((fun nd_uscrut9 -> (match nd_uscrut9 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__488) -> (match dtb__488 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__489; Base_dPair.f_Base_dPair_dPair_second = dtb__490 } -> ((fun nd_uscrut16 -> (match nd_uscrut16 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__491) -> (match dtb__491 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__492; Base_dPair.f_Base_dPair_dPair_second = dtb__493 } -> ((fun nd_uscrut23 -> (match nd_uscrut23 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__494) -> (match dtb__494 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__495; Base_dPair.f_Base_dPair_dPair_second = dtb__496 } -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DExtern (dtb__489, dtb__492, dtb__495, v_Vuna_dCompiler_dCanonical_dAst_dnoSpan)); Base_dPair.f_Base_dPair_dPair_second = dtb__496 }))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dCanonical_dAst_ddecExpr (fuel - 1)) dtb__493))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_ddecStr (fuel - 1)) dtb__490))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_ddecStr (fuel - 1)) dtb__457)) else (if (dtb__456 = 3) then ((fun nd_uscrut9 -> (match nd_uscrut9 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__497) -> (match dtb__497 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__498; Base_dPair.f_Base_dPair_dPair_second = dtb__499 } -> ((fun nd_uscrut16 -> (match nd_uscrut16 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__500) -> (match dtb__500 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__501; Base_dPair.f_Base_dPair_dPair_second = dtb__502 } -> ((fun nd_uscrut23 -> (match nd_uscrut23 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__503) -> (match dtb__503 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__504; Base_dPair.f_Base_dPair_dPair_second = dtb__505 } -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DSig (dtb__498, dtb__501, dtb__504, v_Vuna_dCompiler_dCanonical_dAst_dnoSpan)); Base_dPair.f_Base_dPair_dPair_second = dtb__505 }))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dCanonical_dAst_ddecExpr (fuel - 1)) dtb__502))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dCanonical_dAst_ddecExprList (fuel - 1)) dtb__499))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_ddecStr (fuel - 1)) dtb__457)) else (if (dtb__456 = 4) then ((fun nd_uscrut9 -> (match nd_uscrut9 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__506) -> (match dtb__506 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__507; Base_dPair.f_Base_dPair_dPair_second = dtb__508 } -> ((fun nd_uscrut16 -> (match nd_uscrut16 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__509) -> (match dtb__509 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__510; Base_dPair.f_Base_dPair_dPair_second = dtb__511 } -> ((fun nd_uscrut23 -> (match nd_uscrut23 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__512) -> (match dtb__512 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__513; Base_dPair.f_Base_dPair_dPair_second = dtb__514 } -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DFun (dtb__507, dtb__510, dtb__513, v_Vuna_dCompiler_dCanonical_dAst_dnoSpan)); Base_dPair.f_Base_dPair_dPair_second = dtb__514 }))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dCanonical_dAst_ddecExpr (fuel - 1)) dtb__511))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dCanonical_dAst_ddecPatList (fuel - 1)) dtb__508))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_ddecStr (fuel - 1)) dtb__457)) else (if (dtb__456 = 5) then ((fun nd_uscrut9 -> (match nd_uscrut9 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__515) -> (match dtb__515 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__516; Base_dPair.f_Base_dPair_dPair_second = dtb__517 } -> ((fun nd_uscrut16 -> (match nd_uscrut16 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__518) -> (match dtb__518 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__519; Base_dPair.f_Base_dPair_dPair_second = dtb__520 } -> ((fun nd_uscrut23 -> (match nd_uscrut23 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__521) -> (match dtb__521 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__522; Base_dPair.f_Base_dPair_dPair_second = dtb__523 } -> ((fun nd_uscrut30 -> (match nd_uscrut30 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__524) -> (match dtb__524 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__525; Base_dPair.f_Base_dPair_dPair_second = dtb__526 } -> ((fun nd_uscrut37 -> (match nd_uscrut37 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__527) -> (match dtb__527 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__528; Base_dPair.f_Base_dPair_dPair_second = dtb__529 } -> ((fun nd_uscrut44 -> (match nd_uscrut44 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__530) -> (match dtb__530 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__531; Base_dPair.f_Base_dPair_dPair_second = dtb__532 } -> ((fun nd_uscrut51 -> (match nd_uscrut51 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__533) -> (match dtb__533 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__534; Base_dPair.f_Base_dPair_dPair_second = dtb__535 } -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DRecord (dtb__516, dtb__519, dtb__522, dtb__525, dtb__528, dtb__531, dtb__534, v_Vuna_dCompiler_dCanonical_dAst_dnoSpan)); Base_dPair.f_Base_dPair_dPair_second = dtb__535 }))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_ddecBool (fuel - 1)) dtb__532))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dCanonical_dAst_ddecReprTier (fuel - 1)) dtb__529))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_ddecBool (fuel - 1)) dtb__526))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) (((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_ddecList Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_ddecStr) (fuel - 1)) dtb__523))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) (((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_ddecList v_Vuna_dCompiler_dCanonical_dAst_ddecField) (fuel - 1)) dtb__520))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) (((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_ddecList Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_ddecStr) (fuel - 1)) dtb__517))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_ddecStr (fuel - 1)) dtb__457)) else (if (dtb__456 = 6) then ((fun nd_uscrut9 -> (match nd_uscrut9 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__536) -> (match dtb__536 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__537; Base_dPair.f_Base_dPair_dPair_second = dtb__538 } -> ((fun nd_uscrut16 -> (match nd_uscrut16 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__539) -> (match dtb__539 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__540; Base_dPair.f_Base_dPair_dPair_second = dtb__541 } -> ((fun nd_uscrut23 -> (match nd_uscrut23 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__542) -> (match dtb__542 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__543; Base_dPair.f_Base_dPair_dPair_second = dtb__544 } -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DTrait (dtb__537, dtb__540, dtb__543, v_Vuna_dCompiler_dCanonical_dAst_dnoSpan)); Base_dPair.f_Base_dPair_dPair_second = dtb__544 }))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) (((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_ddecList v_Vuna_dCompiler_dCanonical_dAst_ddecTraitMethod) (fuel - 1)) dtb__541))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) (((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_ddecList v_Vuna_dCompiler_dCanonical_dAst_ddecTraitParam) (fuel - 1)) dtb__538))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_ddecStr (fuel - 1)) dtb__457)) else (if (dtb__456 = 7) then ((fun nd_uscrut9 -> (match nd_uscrut9 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__545) -> (match dtb__545 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__546; Base_dPair.f_Base_dPair_dPair_second = dtb__547 } -> ((fun nd_uscrut16 -> (match nd_uscrut16 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__548) -> (match dtb__548 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__549; Base_dPair.f_Base_dPair_dPair_second = dtb__550 } -> ((fun nd_uscrut23 -> (match nd_uscrut23 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__551) -> (match dtb__551 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__552; Base_dPair.f_Base_dPair_dPair_second = dtb__553 } -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DInstance (dtb__546, dtb__549, dtb__552, v_Vuna_dCompiler_dCanonical_dAst_dnoSpan)); Base_dPair.f_Base_dPair_dPair_second = dtb__553 }))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dCanonical_dAst_ddecDecls (fuel - 1)) dtb__550))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dCanonical_dAst_ddecExpr (fuel - 1)) dtb__547))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dCanonical_dAst_ddecExprList (fuel - 1)) dtb__457)) else Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing))))))))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_ddecTag fuel) bytes))))
and v_Vuna_dCompiler_dCanonical_dAst_ddecDecls = (fun fuel bytes -> (if (fuel <= 0) then Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing else ((fun nd_uscrut2 -> (match nd_uscrut2 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__554) -> (match dtb__554 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__555; Base_dPair.f_Base_dPair_dPair_second = dtb__556 } -> ((((v_Vuna_dCompiler_dCanonical_dAst_ddecDeclsItems (fuel - 1)) dtb__555) dtb__556) Base_dList.C_Base_dList_dList_Nil)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dCanonical_dAst_ddecListHead fuel) bytes))))
and v_Vuna_dCompiler_dCanonical_dAst_ddecDeclsItems = (fun fuel n bytes acc -> (if (fuel <= 0) then Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing else (if (n <= 0) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Base_dPair.f_Base_dPair_dPair_first = (Base_dList.v_Base_dList_dreverse acc); Base_dPair.f_Base_dPair_dPair_second = bytes })) else ((fun nd_uscrut4 -> (match nd_uscrut4 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__557) -> (match dtb__557 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__558; Base_dPair.f_Base_dPair_dPair_second = dtb__559 } -> ((((v_Vuna_dCompiler_dCanonical_dAst_ddecDeclsItems (fuel - 1)) (n - 1)) dtb__559) (Base_dList.C_Base_dList_dList_Cons (dtb__558, acc)))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dCanonical_dAst_ddecDecl (fuel - 1)) bytes)))))

let v_Vuna_dCompiler_dCanonical_dAst_ddecPatComplete = (fun s -> ((fun nd_uscrut1 -> (match nd_uscrut1 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__560) -> (match dtb__560 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__561; Base_dPair.f_Base_dPair_dPair_second = dtb__562 } -> (if ((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_dlenOf dtb__562) = 0) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__561)) else Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dCanonical_dAst_ddecPat (bi_strLength s)) (Base_dList.dtp_unpack s))))

let v_Vuna_dCompiler_dCanonical_dAst_ddecExprComplete = (fun s -> ((fun nd_uscrut1 -> (match nd_uscrut1 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__563) -> (match dtb__563 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__564; Base_dPair.f_Base_dPair_dPair_second = dtb__565 } -> (if ((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_dlenOf dtb__565) = 0) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__564)) else Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dCanonical_dAst_ddecExpr (bi_strLength s)) (Base_dList.dtp_unpack s))))

let v_Vuna_dCompiler_dCanonical_dAst_ddecDeclComplete = (fun s -> ((fun nd_uscrut1 -> (match nd_uscrut1 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__566) -> (match dtb__566 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__567; Base_dPair.f_Base_dPair_dPair_second = dtb__568 } -> (if ((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_dlenOf dtb__568) = 0) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__567)) else Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dCanonical_dAst_ddecDecl (bi_strLength s)) (Base_dList.dtp_unpack s))))

let v_Vuna_dCompiler_dCanonical_dAst_ddecQtyComplete = (fun s -> ((fun nd_uscrut1 -> (match nd_uscrut1 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__569) -> (match dtb__569 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__570; Base_dPair.f_Base_dPair_dPair_second = dtb__571 } -> (if ((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_dlenOf dtb__571) = 0) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__570)) else Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dCanonical_dAst_ddecQty (bi_strLength s)) (Base_dList.dtp_unpack s))))

let v_Vuna_dCompiler_dCanonical_dAst_ddecReprTierComplete = (fun s -> ((fun nd_uscrut1 -> (match nd_uscrut1 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__572) -> (match dtb__572 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__573; Base_dPair.f_Base_dPair_dPair_second = dtb__574 } -> (if ((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_dlenOf dtb__574) = 0) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__573)) else Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dCanonical_dAst_ddecReprTier (bi_strLength s)) (Base_dList.dtp_unpack s))))

let v_Vuna_dCompiler_dCanonical_dAst_ddecInterpPartComplete = (fun s -> ((fun nd_uscrut1 -> (match nd_uscrut1 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__575) -> (match dtb__575 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__576; Base_dPair.f_Base_dPair_dPair_second = dtb__577 } -> (if ((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_dlenOf dtb__577) = 0) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__576)) else Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dCanonical_dAst_ddecInterpPart (bi_strLength s)) (Base_dList.dtp_unpack s))))

let v_Vuna_dCompiler_dCanonical_dAst_ddecDoStmtComplete = (fun s -> ((fun nd_uscrut1 -> (match nd_uscrut1 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__578) -> (match dtb__578 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__579; Base_dPair.f_Base_dPair_dPair_second = dtb__580 } -> (if ((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_dlenOf dtb__580) = 0) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__579)) else Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dCanonical_dAst_ddecDoStmt (bi_strLength s)) (Base_dList.dtp_unpack s))))

let v_Vuna_dCompiler_dCanonical_dAst_ddecCtorComplete = (fun s -> ((fun nd_uscrut1 -> (match nd_uscrut1 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__581) -> (match dtb__581 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__582; Base_dPair.f_Base_dPair_dPair_second = dtb__583 } -> (if ((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_dlenOf dtb__583) = 0) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__582)) else Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dCanonical_dAst_ddecCtor (bi_strLength s)) (Base_dList.dtp_unpack s))))

let v_Vuna_dCompiler_dCanonical_dAst_ddecFieldComplete = (fun s -> ((fun nd_uscrut1 -> (match nd_uscrut1 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__584) -> (match dtb__584 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__585; Base_dPair.f_Base_dPair_dPair_second = dtb__586 } -> (if ((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_dlenOf dtb__586) = 0) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__585)) else Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dCanonical_dAst_ddecField (bi_strLength s)) (Base_dList.dtp_unpack s))))

let v_Vuna_dCompiler_dCanonical_dAst_ddecTraitParamComplete = (fun s -> ((fun nd_uscrut1 -> (match nd_uscrut1 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__587) -> (match dtb__587 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__588; Base_dPair.f_Base_dPair_dPair_second = dtb__589 } -> (if ((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_dlenOf dtb__589) = 0) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__588)) else Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dCanonical_dAst_ddecTraitParam (bi_strLength s)) (Base_dList.dtp_unpack s))))

let v_Vuna_dCompiler_dCanonical_dAst_ddecTraitMethodComplete = (fun s -> ((fun nd_uscrut1 -> (match nd_uscrut1 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__590) -> (match dtb__590 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__591; Base_dPair.f_Base_dPair_dPair_second = dtb__592 } -> (if ((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_dlenOf dtb__592) = 0) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__591)) else Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dCanonical_dAst_ddecTraitMethod (bi_strLength s)) (Base_dList.dtp_unpack s))))

let v_Vuna_dCompiler_dCanonical_dAst_ddecDeclsComplete = (fun s -> ((fun nd_uscrut1 -> (match nd_uscrut1 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__593) -> (match dtb__593 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__594; Base_dPair.f_Base_dPair_dPair_second = dtb__595 } -> (if ((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_dlenOf dtb__595) = 0) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__594)) else Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dCanonical_dAst_ddecDecls (bi_strLength s)) (Base_dList.dtp_unpack s))))
