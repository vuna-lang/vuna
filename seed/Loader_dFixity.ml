open Vuna_runtime
type t_FixityTable = { f_FixityTable_renameMode : bool; f_FixityTable_fixityDecls : Frontend_dAst.t_FixityDecl B_dData_dList.t_List; f_FixityTable_fixFacts : Frontend_dCst.t_FixityFacts }
and t_ChainOp = { f_ChainOp_chainOp : string; f_ChainOp_chainIsBacktick : bool; f_ChainOp_chainRhs : Frontend_dAst.t_Expr; f_ChainOp_chainRef : Frontend_dAst.t_NodeRef }

# 34 "Vuna/Compiler/Loader/Fixity.vuna"
let v_tableOf = (fun (dtb_u_u1 : Frontend_dCst.t_FixityFacts) (dtb_u_u2 : Frontend_dAst.t_FixityDecl B_dData_dList.t_List) -> { f_FixityTable_renameMode = true; f_FixityTable_fixityDecls = dtb_u_u2; f_FixityTable_fixFacts = dtb_u_u1 })

# 38 "Vuna/Compiler/Loader/Fixity.vuna"
let v_tableOfKeepOps = (fun (dtb_u_u3 : Frontend_dCst.t_FixityFacts) (dtb_u_u4 : Frontend_dAst.t_FixityDecl B_dData_dList.t_List) -> { f_FixityTable_renameMode = false; f_FixityTable_fixityDecls = dtb_u_u4; f_FixityTable_fixFacts = dtb_u_u3 })

# 42 "Vuna/Compiler/Loader/Fixity.vuna"
let v_tableOfCst = (fun dtb_u_u5 -> (v_tableOf (Frontend_dCst.v_fixityFactsOf dtb_u_u5)))

# 45 "Vuna/Compiler/Loader/Fixity.vuna"
let v_tableOfKeepOpsCst = (fun dtb_u_u6 -> (v_tableOfKeepOps (Frontend_dCst.v_fixityFactsOf dtb_u_u6)))

# 50 "Vuna/Compiler/Loader/Fixity.vuna"
let v_builtinFixityDecls = (B_dData_dList.C_List__x58__x58_ ({ Frontend_dAst.f_FixityDecl_fixityOp = "->"; Frontend_dAst.f_FixityDecl_fixityLevel = 1; Frontend_dAst.f_FixityDecl_fixityAssoc = 2; Frontend_dAst.f_FixityDecl_fixityRef = Frontend_dAst.v_noNodeRef }, (B_dData_dList.C_List__x58__x58_ ({ Frontend_dAst.f_FixityDecl_fixityOp = "&&"; Frontend_dAst.f_FixityDecl_fixityLevel = 3; Frontend_dAst.f_FixityDecl_fixityAssoc = 1; Frontend_dAst.f_FixityDecl_fixityRef = Frontend_dAst.v_noNodeRef }, (B_dData_dList.C_List__x58__x58_ ({ Frontend_dAst.f_FixityDecl_fixityOp = "||"; Frontend_dAst.f_FixityDecl_fixityLevel = 2; Frontend_dAst.f_FixityDecl_fixityAssoc = 1; Frontend_dAst.f_FixityDecl_fixityRef = Frontend_dAst.v_noNodeRef }, B_dData_dList.C_List_Nil))))))

# 57 "Vuna/Compiler/Loader/Fixity.vuna"
let v_fixityOpOf = (fun (dtb_u_u7 : Frontend_dAst.t_FixityDecl) -> (dtb_u_u7).Frontend_dAst.f_FixityDecl_fixityOp)

# 54 "Vuna/Compiler/Loader/Fixity.vuna"
let v_builtinFixityOps = ((B_dData_dList.v_map v_fixityOpOf) v_builtinFixityDecls)

# 78 "Vuna/Compiler/Loader/Fixity.vuna"
let v_withFixitySpan = (fun (dtb_u_u8 : Base_dSource.t_Span) (dtb_u_u9 : Base_dDiag.t_Diagnostic) -> (if ((Base_dSource.v_spanFile dtb_u_u8) = "") then dtb_u_u9 else ((Base_dDiag.v_withFallbackSpan dtb_u_u8) dtb_u_u9)))

# 65 "Vuna/Compiler/Loader/Fixity.vuna"
let rec v_checkUniqueFixitiesGo = (fun (dtb_u_u10 : Frontend_dAst.t_FixityDecl B_dData_dList.t_List) (dtb_u_u11 : (string, int) B_dContainer_dHashMap.t_HashMap) -> (match dtb_u_u10 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u12, dtb_u_u13) -> (let dtb_u_u14 = (Frontend_dAst.v_fixitySpan dtb_u_u12) in (if ((B_dData_dList.v_memName (dtb_u_u12).Frontend_dAst.f_FixityDecl_fixityOp) v_builtinFixityOps) then ((Base_dDiag.v_onErrDiag (v_withFixitySpan dtb_u_u14)) ((Base_dDiagnostics_dRn.v_rnNoLoc1 (Base_dDiagnostics_dRn.C_RnErr_BuiltinFixity ((dtb_u_u12).Frontend_dAst.f_FixityDecl_fixityOp))) (dtb_u_u12).Frontend_dAst.f_FixityDecl_fixityOp)) else (match ((((B_dContainer_dHashMap.v_lookup B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) (dtb_u_u12).Frontend_dAst.f_FixityDecl_fixityOp) dtb_u_u11) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u15) -> ((Base_dDiag.v_onErrDiag (v_withFixitySpan dtb_u_u14)) ((Base_dDiagnostics_dRn.v_rnNoLoc1 (Base_dDiagnostics_dRn.C_RnErr_DuplicateFixity ((dtb_u_u12).Frontend_dAst.f_FixityDecl_fixityOp))) (dtb_u_u12).Frontend_dAst.f_FixityDecl_fixityOp))
  | B_dData_dMaybe.C_Maybe_Nothing -> ((Base_dCommon.v_bind ((v_checkUniqueFixitiesGo dtb_u_u13) (((((B_dContainer_dHashMap.v_insert B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) (dtb_u_u12).Frontend_dAst.f_FixityDecl_fixityOp) 1) dtb_u_u11))) (fun (dtb_u_u16 : Frontend_dAst.t_FixityDecl B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((B_dData_dList.C_List__x58__x58_ (dtb_u_u12, dtb_u_u16))))))
  | _ -> failwith "DT: impossible branch"
)))
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (B_dData_dList.C_List_Nil))
  | _ -> failwith "DT: impossible branch"
))

# 62 "Vuna/Compiler/Loader/Fixity.vuna"
let v_checkUniqueFixities = (fun (dtb_u_u17 : Frontend_dAst.t_FixityDecl B_dData_dList.t_List) -> ((v_checkUniqueFixitiesGo dtb_u_u17) (((B_dContainer_dHashMap.v_fromList B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) B_dData_dList.C_List_Nil)))

# 82 "Vuna/Compiler/Loader/Fixity.vuna"
let rec v_lookupDecl = (fun (dtb_u_u18 : string) (dtb_u_u19 : Frontend_dAst.t_FixityDecl B_dData_dList.t_List) -> (match dtb_u_u19 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u20, dtb_u_u21) -> (if ((dtb_u_u20).Frontend_dAst.f_FixityDecl_fixityOp = dtb_u_u18) then (B_dData_dMaybe.C_Maybe_Just (dtb_u_u20)) else ((v_lookupDecl dtb_u_u18) dtb_u_u21))
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 87 "Vuna/Compiler/Loader/Fixity.vuna"
let v_lookupFixityDecl = (fun (dtb_u_u22 : t_FixityTable) (dtb_u_u23 : string) -> (match ((v_lookupDecl dtb_u_u23) (dtb_u_u22).f_FixityTable_fixityDecls) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u24) -> (B_dData_dMaybe.C_Maybe_Just (dtb_u_u24))
  | B_dData_dMaybe.C_Maybe_Nothing -> ((v_lookupDecl dtb_u_u23) v_builtinFixityDecls)
  | _ -> failwith "DT: impossible branch"
))

# 93 "Vuna/Compiler/Loader/Fixity.vuna"
let v_lookupFixity = (fun (dtb_u_u25 : t_FixityTable) (dtb_u_u26 : string) -> (match ((v_lookupFixityDecl dtb_u_u25) dtb_u_u26) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u27) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (dtb_u_u27).Frontend_dAst.f_FixityDecl_fixityLevel; B_dData_dPair.f_Pair_second = (dtb_u_u27).Frontend_dAst.f_FixityDecl_fixityAssoc }))
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 107 "Vuna/Compiler/Loader/Fixity.vuna"
let v_unknownFixityMsg = (fun (dtb_u_u28 : string) -> ((Base_dDiagnostics_dRn.v_rnMsg (Base_dDiagnostics_dRn.C_RnErr_UnknownFixity (dtb_u_u28))) (B_dData_dVec.C_Vec__x58__x58_ (dtb_u_u28, B_dData_dVec.C_Vec_Nil))))

# 112 "Vuna/Compiler/Loader/Fixity.vuna"
let v_fixityOf = (fun (dtb_u_u29 : t_FixityTable) (dtb_u_u30 : t_ChainOp) -> (match ((v_lookupFixity dtb_u_u29) (dtb_u_u30).f_ChainOp_chainOp) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u31) -> (Base_dDiag.C_Check_OkC (dtb_u_u31))
  | B_dData_dMaybe.C_Maybe_Nothing -> (if (dtb_u_u30).f_ChainOp_chainIsBacktick then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = 9; B_dData_dPair.f_Pair_second = 1 })) else ((Base_dDiag.v_onErrDiag (Base_dDiag.v_withFallbackSpan (Frontend_dAst.v_nodeRefSpan (dtb_u_u30).f_ChainOp_chainRef))) (Base_dDiag.C_Check_ErrC ((v_unknownFixityMsg (dtb_u_u30).f_ChainOp_chainOp)))))
  | _ -> failwith "DT: impossible branch"
))

# 144 "Vuna/Compiler/Loader/Fixity.vuna"
let v_chainBacktick = (fun (dtb_u_u32 : t_FixityTable) (dtb_u_u33 : Frontend_dAst.t_Expr) -> ((Frontend_dCst.v_backtickOfFacts (dtb_u_u32).f_FixityTable_fixFacts) (Frontend_dAst.v_nodeRefId (Frontend_dAst.v_exprRef dtb_u_u33))))

# 133 "Vuna/Compiler/Loader/Fixity.vuna"
let v_isChainNode = (fun (dtb_u_u34 : t_FixityTable) (dtb_u_u35 : Frontend_dAst.t_Expr) -> (match ((Frontend_dCst.v_sectionOfFacts (dtb_u_u34).f_FixityTable_fixFacts) (Frontend_dAst.v_exprSpan dtb_u_u35)) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u36) -> false
  | B_dData_dMaybe.C_Maybe_Nothing -> (let dtb_u_u37 = dtb_u_u35 in (match dtb_u_u37 with
  | Frontend_dAst.C_Expr_EApp (dtb_u_u38, dtb_u_u39, dtb_u_u40) -> (match dtb_u_u38 with
  | Frontend_dAst.C_Expr_EVar (dtb_u_u41, dtb_u_u42) -> (match dtb_u_u39 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u43, dtb_u_u44) -> (match dtb_u_u44 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u45, dtb_u_u46) -> (match dtb_u_u46 with
  | B_dData_dList.C_List_Nil -> (if (Frontend_dLexer.v_isSymbolName dtb_u_u41) then true else ((v_chainBacktick dtb_u_u34) dtb_u_u35))
  | _ -> false
)
  | _ -> false
)
  | _ -> false
)
  | _ -> false
)
  | _ -> false
))
  | _ -> failwith "DT: impossible branch"
))

# 212 "Vuna/Compiler/Loader/Fixity.vuna"
let rec v_foldApps = (fun (dtb_u_u47 : Frontend_dAst.t_Expr) (dtb_u_u48 : Frontend_dAst.t_Expr B_dData_dList.t_List) (dtb_u_u49 : Frontend_dAst.t_NodeRef) -> (match dtb_u_u48 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u50, dtb_u_u51) -> (((v_foldApps (Frontend_dAst.C_Expr_EApp (dtb_u_u47, (B_dData_dList.C_List__x58__x58_ (dtb_u_u50, B_dData_dList.C_List_Nil)), dtb_u_u49))) dtb_u_u51) dtb_u_u49)
  | B_dData_dList.C_List_Nil -> dtb_u_u47
  | _ -> failwith "DT: impossible branch"
))

# 390 "Vuna/Compiler/Loader/Fixity.vuna"
let rec v_reorderPattern = (fun (dtb_u_u52 : t_FixityTable) (dtb_u_u53 : Frontend_dAst.t_Pat) -> (match dtb_u_u53 with
  | Frontend_dAst.C_Pat_PVar (dtb_u_u54, dtb_u_u55) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Pat_PVar (dtb_u_u54, dtb_u_u55))))
  | Frontend_dAst.C_Pat_PWild (dtb_u_u56) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Pat_PWild (dtb_u_u56))))
  | Frontend_dAst.C_Pat_PInt (dtb_u_u57, dtb_u_u58) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Pat_PInt (dtb_u_u57, dtb_u_u58))))
  | Frontend_dAst.C_Pat_PStr (dtb_u_u59, dtb_u_u60) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Pat_PStr (dtb_u_u59, dtb_u_u60))))
  | Frontend_dAst.C_Pat_PCon (dtb_u_u61, dtb_u_u62, dtb_u_u63) -> ((Base_dCommon.v_bind ((Base_dCommon.v_traverse (fun (dtb_u_u64 : Frontend_dAst.t_Pat) -> ((v_reorderPattern dtb_u_u52) dtb_u_u64))) dtb_u_u62)) (fun (dtb_u_u65 : Frontend_dAst.t_Pat B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Pat_PCon (dtb_u_u61, dtb_u_u65, dtb_u_u63))))))
  | Frontend_dAst.C_Pat_PAs (dtb_u_u66, dtb_u_u67, dtb_u_u68) -> ((Base_dCommon.v_bind ((v_reorderPattern dtb_u_u52) dtb_u_u67)) (fun (dtb_u_u69 : Frontend_dAst.t_Pat) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Pat_PAs (dtb_u_u66, dtb_u_u69, dtb_u_u68))))))
  | Frontend_dAst.C_Pat_PRecord (dtb_u_u70, dtb_u_u71, dtb_u_u72) -> ((Base_dCommon.v_bind ((Base_dCommon.v_traverse (fun (dtb_u_u73 : (string, Frontend_dAst.t_Pat) B_dData_dPair.t_Pair) -> ((v_reorderRecPatField dtb_u_u52) dtb_u_u73))) dtb_u_u71)) (fun (dtb_u_u74 : (string, Frontend_dAst.t_Pat) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Pat_PRecord (dtb_u_u70, dtb_u_u74, dtb_u_u72))))))
  | _ -> failwith "DT: impossible branch"
))
# 409 "Vuna/Compiler/Loader/Fixity.vuna"
and v_reorderRecPatField = (fun (dtb_u_u75 : t_FixityTable) (dtb_u_u76 : (string, Frontend_dAst.t_Pat) B_dData_dPair.t_Pair) -> (match dtb_u_u76 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u77; B_dData_dPair.f_Pair_second = dtb_u_u78 } -> ((Base_dCommon.v_bind ((v_reorderPattern dtb_u_u75) dtb_u_u78)) (fun (dtb_u_u79 : Frontend_dAst.t_Pat) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb_u_u77; B_dData_dPair.f_Pair_second = dtb_u_u79 }))))
  | _ -> failwith "DT: impossible branch"
))

# 29 "Vuna/Compiler/Loader/Fixity.vuna"
let v_renameMode = (fun (dtb_u_u80 : t_FixityTable) -> (match dtb_u_u80 with
  | { f_FixityTable_renameMode = dtb_u_u81; f_FixityTable_fixityDecls = dtb_u_u82; f_FixityTable_fixFacts = dtb_u_u83 } -> dtb_u_u81
  | _ -> failwith "DT: impossible branch"
))

# 124 "Vuna/Compiler/Loader/Fixity.vuna"
let v_infixTerm = (fun (dtb_u_u84 : t_FixityTable) (dtb_u_u85 : t_ChainOp) (dtb_u_u86 : Frontend_dAst.t_Expr) (dtb_u_u87 : Frontend_dAst.t_Expr) (dtb_u_u88 : Frontend_dAst.t_NodeRef) -> (if (if (v_renameMode dtb_u_u84) then ((dtb_u_u85).f_ChainOp_chainOp = ">>") else false) then (Frontend_dAst.C_Expr_EApp ((Frontend_dAst.C_Expr_EVar (">>=", dtb_u_u88)), (B_dData_dList.C_List__x58__x58_ (dtb_u_u86, (B_dData_dList.C_List__x58__x58_ ((Frontend_dAst.C_Expr_ELam ((B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = "_"; B_dData_dPair.f_Pair_second = Base_dSource.v_spanEmpty }, B_dData_dList.C_List_Nil)), dtb_u_u87, dtb_u_u88)), B_dData_dList.C_List_Nil)))), dtb_u_u88)) else (Frontend_dAst.C_Expr_EApp ((Frontend_dAst.C_Expr_EVar ((dtb_u_u85).f_ChainOp_chainOp, dtb_u_u88)), (B_dData_dList.C_List__x58__x58_ (dtb_u_u86, (B_dData_dList.C_List__x58__x58_ (dtb_u_u87, B_dData_dList.C_List_Nil)))), dtb_u_u88))))

# 171 "Vuna/Compiler/Loader/Fixity.vuna"
let rec v_climb = (fun (dtb_u_u89 : int) (dtb_u_u90 : t_FixityTable) (dtb_u_u91 : int) (dtb_u_u92 : Frontend_dAst.t_Expr) (dtb_u_u93 : t_ChainOp B_dData_dList.t_List) (dtb_u_u94 : Frontend_dAst.t_NodeRef) -> (if (dtb_u_u89 <= 0) then (Base_dDiag.v_icInternal "infix reorder fuel exhausted") else (match dtb_u_u93 with
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb_u_u92; B_dData_dPair.f_Pair_second = B_dData_dList.C_List_Nil }))
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u95, dtb_u_u96) -> (match ((v_fixityOf dtb_u_u90) dtb_u_u95) with
  | Base_dDiag.C_Check_ErrC (dtb_u_u97) -> (Base_dDiag.C_Check_ErrC (dtb_u_u97))
  | Base_dDiag.C_Check_OkC (dtb_u_u98) -> (let dtb_u_u99 = (B_dData_dPair.v_firstOf dtb_u_u98) in (let dtb_u_u100 = (B_dData_dPair.v_secondOf dtb_u_u98) in (let dtb_u_u101 = (if (dtb_u_u100 = 2) then dtb_u_u99 else (dtb_u_u99 + 1)) in (let dtb_u_u102 = (dtb_u_u95).f_ChainOp_chainRhs in (if (dtb_u_u99 < dtb_u_u91) then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb_u_u92; B_dData_dPair.f_Pair_second = dtb_u_u93 })) else ((Base_dCommon.v_bind ((((((v_climb (dtb_u_u89 - 1)) dtb_u_u90) dtb_u_u101) dtb_u_u102) dtb_u_u96) dtb_u_u94)) (fun (dtb_u_u103 : (Frontend_dAst.t_Expr, t_ChainOp B_dData_dList.t_List) B_dData_dPair.t_Pair) -> (match dtb_u_u103 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u104; B_dData_dPair.f_Pair_second = dtb_u_u105 } -> ((((((v_climb (dtb_u_u89 - 1)) dtb_u_u90) dtb_u_u91) (((((v_infixTerm dtb_u_u90) dtb_u_u95) dtb_u_u92) dtb_u_u104) dtb_u_u94)) dtb_u_u105) dtb_u_u94)
  | _ -> failwith "DT: impossible branch"
))))))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))

# 149 "Vuna/Compiler/Loader/Fixity.vuna"
let rec v_collectChain = (fun (dtb_u_u106 : t_FixityTable) (dtb_u_u107 : Frontend_dAst.t_Expr) -> (match dtb_u_u107 with
  | Frontend_dAst.C_Expr_EApp (dtb_u_u108, dtb_u_u109, dtb_u_u110) -> (match dtb_u_u108 with
  | Frontend_dAst.C_Expr_EVar (dtb_u_u111, dtb_u_u112) -> (match dtb_u_u109 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u113, dtb_u_u114) -> (match dtb_u_u114 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u115, dtb_u_u116) -> (match dtb_u_u116 with
  | B_dData_dList.C_List_Nil -> (if ((v_isChainNode dtb_u_u106) dtb_u_u107) then ((Base_dCommon.v_bind ((v_reorderExpr dtb_u_u106) dtb_u_u113)) (fun (dtb_u_u117 : Frontend_dAst.t_Expr) -> ((Base_dCommon.v_bind ((v_chainOperand dtb_u_u106) dtb_u_u115)) (fun (dtb_u_u118 : (Frontend_dAst.t_Expr, t_ChainOp B_dData_dList.t_List) B_dData_dPair.t_Pair) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb_u_u117; B_dData_dPair.f_Pair_second = (B_dData_dList.C_List__x58__x58_ ({ f_ChainOp_chainOp = dtb_u_u111; f_ChainOp_chainIsBacktick = ((v_chainBacktick dtb_u_u106) dtb_u_u107); f_ChainOp_chainRhs = (B_dData_dPair.v_firstOf dtb_u_u118); f_ChainOp_chainRef = dtb_u_u110 }, (B_dData_dPair.v_secondOf dtb_u_u118))) })))))) else ((Base_dCommon.v_bind ((v_reorderNonChain dtb_u_u106) dtb_u_u107)) (fun (dtb_u_u119 : Frontend_dAst.t_Expr) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb_u_u119; B_dData_dPair.f_Pair_second = B_dData_dList.C_List_Nil })))))
  | _ -> ((Base_dCommon.v_bind ((v_reorderNonChain dtb_u_u106) dtb_u_u107)) (fun (dtb_u_u120 : Frontend_dAst.t_Expr) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb_u_u120; B_dData_dPair.f_Pair_second = B_dData_dList.C_List_Nil }))))
)
  | _ -> ((Base_dCommon.v_bind ((v_reorderNonChain dtb_u_u106) dtb_u_u107)) (fun (dtb_u_u121 : Frontend_dAst.t_Expr) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb_u_u121; B_dData_dPair.f_Pair_second = B_dData_dList.C_List_Nil }))))
)
  | _ -> ((Base_dCommon.v_bind ((v_reorderNonChain dtb_u_u106) dtb_u_u107)) (fun (dtb_u_u122 : Frontend_dAst.t_Expr) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb_u_u122; B_dData_dPair.f_Pair_second = B_dData_dList.C_List_Nil }))))
)
  | _ -> ((Base_dCommon.v_bind ((v_reorderNonChain dtb_u_u106) dtb_u_u107)) (fun (dtb_u_u123 : Frontend_dAst.t_Expr) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb_u_u123; B_dData_dPair.f_Pair_second = B_dData_dList.C_List_Nil }))))
)
  | _ -> ((Base_dCommon.v_bind ((v_reorderNonChain dtb_u_u106) dtb_u_u107)) (fun (dtb_u_u124 : Frontend_dAst.t_Expr) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb_u_u124; B_dData_dPair.f_Pair_second = B_dData_dList.C_List_Nil }))))
))
# 161 "Vuna/Compiler/Loader/Fixity.vuna"
and v_chainOperand = (fun (dtb_u_u125 : t_FixityTable) (dtb_u_u126 : Frontend_dAst.t_Expr) -> (if (((Frontend_dCst.v_parenDepthOfFacts (dtb_u_u125).f_FixityTable_fixFacts) (Frontend_dAst.v_nodeRefId (Frontend_dAst.v_exprRef dtb_u_u126))) > 0) then ((Base_dCommon.v_bind ((v_reorderExpr dtb_u_u125) dtb_u_u126)) (fun (dtb_u_u127 : Frontend_dAst.t_Expr) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb_u_u127; B_dData_dPair.f_Pair_second = B_dData_dList.C_List_Nil })))) else ((v_collectChain dtb_u_u125) dtb_u_u126)))
# 197 "Vuna/Compiler/Loader/Fixity.vuna"
and v_reorderChain = (fun (dtb_u_u128 : t_FixityTable) (dtb_u_u129 : Frontend_dAst.t_Expr) -> ((Base_dCommon.v_bind ((v_collectChain dtb_u_u128) dtb_u_u129)) (fun (dtb_u_u130 : (Frontend_dAst.t_Expr, t_ChainOp B_dData_dList.t_List) B_dData_dPair.t_Pair) -> (match dtb_u_u130 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u131; B_dData_dPair.f_Pair_second = dtb_u_u132 } -> ((Base_dCommon.v_bind ((((((v_climb ((2 * (B_dData_dList.v_length dtb_u_u132)) + 2)) dtb_u_u128) 0) dtb_u_u131) dtb_u_u132) (Frontend_dAst.v_exprRef dtb_u_u129))) (fun (dtb_u_u133 : (Frontend_dAst.t_Expr, t_ChainOp B_dData_dList.t_List) B_dData_dPair.t_Pair) -> (match dtb_u_u133 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u134; B_dData_dPair.f_Pair_second = dtb_u_u135 } -> (if ((B_dData_dList.v_length dtb_u_u135) = 0) then (Base_dDiag.C_Check_OkC (dtb_u_u134)) else (Base_dDiag.v_icInternal "infix reorder left an operator"))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
))))
# 217 "Vuna/Compiler/Loader/Fixity.vuna"
and v_reorderNonChain = (fun (dtb_u_u136 : t_FixityTable) (dtb_u_u137 : Frontend_dAst.t_Expr) -> (match dtb_u_u137 with
  | Frontend_dAst.C_Expr_EInterp (dtb_u_u138, dtb_u_u139) -> ((Base_dCommon.v_bind ((v_reorderInterpParts dtb_u_u136) dtb_u_u138)) (fun (dtb_u_u140 : Frontend_dAst.t_InterpPart B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Expr_EInterp (dtb_u_u140, dtb_u_u139))))))
  | Frontend_dAst.C_Expr_EDo (dtb_u_u141, dtb_u_u142) -> ((Base_dCommon.v_bind ((Base_dCommon.v_traverse (fun (dtb_u_u143 : Frontend_dAst.t_DoStmt) -> ((v_reorderDoStmt dtb_u_u136) dtb_u_u143))) dtb_u_u141)) (fun (dtb_u_u144 : Frontend_dAst.t_DoStmt B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Expr_EDo (dtb_u_u144, dtb_u_u142))))))
  | Frontend_dAst.C_Expr_ERecUpdate (dtb_u_u145, dtb_u_u146, dtb_u_u147) -> ((Base_dCommon.v_bind ((v_reorderExpr dtb_u_u136) dtb_u_u145)) (fun (dtb_u_u148 : Frontend_dAst.t_Expr) -> ((Base_dCommon.v_bind ((v_reorderFields dtb_u_u136) dtb_u_u146)) (fun (dtb_u_u149 : (string, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Expr_ERecUpdate (dtb_u_u148, dtb_u_u149, dtb_u_u147))))))))
  | Frontend_dAst.C_Expr_ERecord (dtb_u_u150, dtb_u_u151, dtb_u_u152) -> ((Base_dCommon.v_bind ((v_reorderFields dtb_u_u136) dtb_u_u151)) (fun (dtb_u_u153 : (string, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Expr_ERecord (dtb_u_u150, dtb_u_u153, dtb_u_u152))))))
  | Frontend_dAst.C_Expr_EField (dtb_u_u154, dtb_u_u155, dtb_u_u156) -> ((Base_dCommon.v_bind ((v_reorderExpr dtb_u_u136) dtb_u_u154)) (fun (dtb_u_u157 : Frontend_dAst.t_Expr) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Expr_EField (dtb_u_u157, dtb_u_u155, dtb_u_u156))))))
  | Frontend_dAst.C_Expr_EIf (dtb_u_u158, dtb_u_u159, dtb_u_u160, dtb_u_u161) -> ((Base_dCommon.v_bind ((v_reorderExpr dtb_u_u136) dtb_u_u158)) (fun (dtb_u_u162 : Frontend_dAst.t_Expr) -> ((Base_dCommon.v_bind ((v_reorderExpr dtb_u_u136) dtb_u_u159)) (fun (dtb_u_u163 : Frontend_dAst.t_Expr) -> ((Base_dCommon.v_bind ((v_reorderExpr dtb_u_u136) dtb_u_u160)) (fun (dtb_u_u164 : Frontend_dAst.t_Expr) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Expr_EIf (dtb_u_u162, dtb_u_u163, dtb_u_u164, dtb_u_u161))))))))))
  | Frontend_dAst.C_Expr_ECase (dtb_u_u165, dtb_u_u166, dtb_u_u167) -> ((Base_dCommon.v_bind ((v_reorderExpr dtb_u_u136) dtb_u_u165)) (fun (dtb_u_u168 : Frontend_dAst.t_Expr) -> ((Base_dCommon.v_bind ((v_reorderAlts dtb_u_u136) dtb_u_u166)) (fun (dtb_u_u169 : Frontend_dAst.t_Alt B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Expr_ECase (dtb_u_u168, dtb_u_u169, dtb_u_u167))))))))
  | Frontend_dAst.C_Expr_ELet (dtb_u_u170, dtb_u_u171, dtb_u_u172, dtb_u_u173) -> ((Base_dCommon.v_bind ((v_reorderBinds dtb_u_u136) dtb_u_u170)) (fun (dtb_u_u174 : Frontend_dAst.t_Binding B_dData_dList.t_List) -> ((Base_dCommon.v_bind ((v_reorderExpr dtb_u_u136) dtb_u_u171)) (fun (dtb_u_u175 : Frontend_dAst.t_Expr) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Expr_ELet (dtb_u_u174, dtb_u_u175, dtb_u_u172, dtb_u_u173))))))))
  | Frontend_dAst.C_Expr_EPi (dtb_u_u176, dtb_u_u177, dtb_u_u178, dtb_u_u179, dtb_u_u180, dtb_u_u181) -> ((Base_dCommon.v_bind ((v_reorderExpr dtb_u_u136) dtb_u_u179)) (fun (dtb_u_u182 : Frontend_dAst.t_Expr) -> ((Base_dCommon.v_bind ((v_reorderExpr dtb_u_u136) dtb_u_u180)) (fun (dtb_u_u183 : Frontend_dAst.t_Expr) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Expr_EPi (dtb_u_u176, dtb_u_u177, dtb_u_u178, dtb_u_u182, dtb_u_u183, dtb_u_u181))))))))
  | Frontend_dAst.C_Expr_EApp (dtb_u_u184, dtb_u_u185, dtb_u_u186) -> (match dtb_u_u184 with
  | Frontend_dAst.C_Expr_ELam (dtb_u_u187, dtb_u_u188, dtb_u_u189) -> (match ((Frontend_dCst.v_sectionOfFacts (dtb_u_u136).f_FixityTable_fixFacts) (Frontend_dAst.v_nodeRefSpan dtb_u_u189)) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u190) -> (if (v_renameMode dtb_u_u136) then (((((v_reorderSectionApply dtb_u_u136) dtb_u_u190) dtb_u_u188) dtb_u_u185) dtb_u_u186) else ((((v_reorderApp dtb_u_u136) dtb_u_u184) dtb_u_u185) dtb_u_u186))
  | B_dData_dMaybe.C_Maybe_Nothing -> ((((v_reorderApp dtb_u_u136) dtb_u_u184) dtb_u_u185) dtb_u_u186)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> ((((v_reorderApp dtb_u_u136) dtb_u_u184) dtb_u_u185) dtb_u_u186)
)
  | Frontend_dAst.C_Expr_ELam (dtb_u_u191, dtb_u_u192, dtb_u_u193) -> (match ((Frontend_dCst.v_sectionOfFacts (dtb_u_u136).f_FixityTable_fixFacts) (Frontend_dAst.v_nodeRefSpan dtb_u_u193)) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u194) -> (match dtb_u_u192 with
  | Frontend_dAst.C_Expr_EApp (dtb_u_u195, dtb_u_u196, dtb_u_u197) -> ((Base_dCommon.v_bind ((v_reorderExpr dtb_u_u136) dtb_u_u195)) (fun (dtb_u_u198 : Frontend_dAst.t_Expr) -> ((Base_dCommon.v_bind ((Base_dCommon.v_traverse (fun (dtb_u_u199 : Frontend_dAst.t_Expr) -> ((v_reorderExpr dtb_u_u136) dtb_u_u199))) dtb_u_u196)) (fun (dtb_u_u200 : Frontend_dAst.t_Expr B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Expr_ELam (dtb_u_u191, (Frontend_dAst.C_Expr_EApp (dtb_u_u198, dtb_u_u200, dtb_u_u197)), dtb_u_u193))))))))
  | _ -> ((Base_dCommon.v_bind ((v_reorderExpr dtb_u_u136) dtb_u_u192)) (fun (dtb_u_u201 : Frontend_dAst.t_Expr) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Expr_ELam (dtb_u_u191, dtb_u_u201, dtb_u_u193))))))
)
  | B_dData_dMaybe.C_Maybe_Nothing -> ((Base_dCommon.v_bind ((v_reorderExpr dtb_u_u136) dtb_u_u192)) (fun (dtb_u_u202 : Frontend_dAst.t_Expr) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Expr_ELam (dtb_u_u191, dtb_u_u202, dtb_u_u193))))))
  | _ -> failwith "DT: impossible branch"
)
  | Frontend_dAst.C_Expr_EFloat (dtb_u_u203, dtb_u_u204) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Expr_EFloat (dtb_u_u203, dtb_u_u204))))
  | Frontend_dAst.C_Expr_EStr (dtb_u_u205, dtb_u_u206) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Expr_EStr (dtb_u_u205, dtb_u_u206))))
  | Frontend_dAst.C_Expr_EInt (dtb_u_u207, dtb_u_u208) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Expr_EInt (dtb_u_u207, dtb_u_u208))))
  | Frontend_dAst.C_Expr_EVar (dtb_u_u209, dtb_u_u210) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Expr_EVar (dtb_u_u209, dtb_u_u210))))
  | _ -> failwith "DT: impossible branch"
))
# 278 "Vuna/Compiler/Loader/Fixity.vuna"
and v_reorderApp = (fun (dtb_u_u211 : t_FixityTable) (dtb_u_u212 : Frontend_dAst.t_Expr) (dtb_u_u213 : Frontend_dAst.t_Expr B_dData_dList.t_List) (dtb_u_u214 : Frontend_dAst.t_NodeRef) -> ((Base_dCommon.v_bind ((v_reorderExpr dtb_u_u211) dtb_u_u212)) (fun (dtb_u_u215 : Frontend_dAst.t_Expr) -> ((Base_dCommon.v_bind ((Base_dCommon.v_traverse (fun (dtb_u_u216 : Frontend_dAst.t_Expr) -> ((v_reorderExpr dtb_u_u211) dtb_u_u216))) dtb_u_u213)) (fun (dtb_u_u217 : Frontend_dAst.t_Expr B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Expr_EApp (dtb_u_u215, dtb_u_u217, dtb_u_u214)))))))))
# 284 "Vuna/Compiler/Loader/Fixity.vuna"
and v_reorderSectionApply = (fun (dtb_u_u218 : t_FixityTable) (dtb_u_u219 : Frontend_dCst.t_SectionShape) (dtb_u_u220 : Frontend_dAst.t_Expr) (dtb_u_u221 : Frontend_dAst.t_Expr B_dData_dList.t_List) (dtb_u_u222 : Frontend_dAst.t_NodeRef) -> (match dtb_u_u220 with
  | Frontend_dAst.C_Expr_EApp (dtb_u_u223, dtb_u_u224, dtb_u_u225) -> (match dtb_u_u223 with
  | Frontend_dAst.C_Expr_EVar (dtb_u_u226, dtb_u_u227) -> (match dtb_u_u219 with
  | Frontend_dCst.C_SectionShape_SectionLeft (dtb_u_u228) -> (let dtb_u_u229 = dtb_u_u224 in (match dtb_u_u229 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u230, dtb_u_u231) -> (match dtb_u_u231 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u232, dtb_u_u233) -> (match dtb_u_u233 with
  | B_dData_dList.C_List_Nil -> ((((((v_applySectionLeft dtb_u_u218) dtb_u_u226) dtb_u_u227) dtb_u_u232) dtb_u_u221) dtb_u_u222)
  | _ -> ((((v_reorderApp dtb_u_u218) (Frontend_dAst.C_Expr_EApp ((Frontend_dAst.C_Expr_EVar (dtb_u_u226, dtb_u_u227)), dtb_u_u224, dtb_u_u225))) dtb_u_u221) dtb_u_u222)
)
  | _ -> ((((v_reorderApp dtb_u_u218) (Frontend_dAst.C_Expr_EApp ((Frontend_dAst.C_Expr_EVar (dtb_u_u226, dtb_u_u227)), dtb_u_u224, dtb_u_u225))) dtb_u_u221) dtb_u_u222)
)
  | _ -> ((((v_reorderApp dtb_u_u218) (Frontend_dAst.C_Expr_EApp ((Frontend_dAst.C_Expr_EVar (dtb_u_u226, dtb_u_u227)), dtb_u_u224, dtb_u_u225))) dtb_u_u221) dtb_u_u222)
))
  | Frontend_dCst.C_SectionShape_SectionRight (dtb_u_u234) -> (let dtb_u_u235 = dtb_u_u224 in (match dtb_u_u235 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u236, dtb_u_u237) -> (match dtb_u_u237 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u238, dtb_u_u239) -> (match dtb_u_u239 with
  | B_dData_dList.C_List_Nil -> ((((((v_applySectionRight dtb_u_u218) dtb_u_u226) dtb_u_u227) dtb_u_u236) dtb_u_u221) dtb_u_u222)
  | _ -> ((((v_reorderApp dtb_u_u218) (Frontend_dAst.C_Expr_EApp ((Frontend_dAst.C_Expr_EVar (dtb_u_u226, dtb_u_u227)), dtb_u_u224, dtb_u_u225))) dtb_u_u221) dtb_u_u222)
)
  | _ -> ((((v_reorderApp dtb_u_u218) (Frontend_dAst.C_Expr_EApp ((Frontend_dAst.C_Expr_EVar (dtb_u_u226, dtb_u_u227)), dtb_u_u224, dtb_u_u225))) dtb_u_u221) dtb_u_u222)
)
  | _ -> ((((v_reorderApp dtb_u_u218) (Frontend_dAst.C_Expr_EApp ((Frontend_dAst.C_Expr_EVar (dtb_u_u226, dtb_u_u227)), dtb_u_u224, dtb_u_u225))) dtb_u_u221) dtb_u_u222)
))
  | Frontend_dCst.C_SectionShape_SectionOp (dtb_u_u240) -> ((((v_reorderApp dtb_u_u218) (Frontend_dAst.C_Expr_EApp ((Frontend_dAst.C_Expr_EVar (dtb_u_u226, dtb_u_u227)), dtb_u_u224, dtb_u_u225))) dtb_u_u221) dtb_u_u222)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> ((((v_reorderApp dtb_u_u218) dtb_u_u220) dtb_u_u221) dtb_u_u222)
)
  | _ -> ((((v_reorderApp dtb_u_u218) dtb_u_u220) dtb_u_u221) dtb_u_u222)
))
# 298 "Vuna/Compiler/Loader/Fixity.vuna"
and v_applySectionLeft = (fun (dtb_u_u241 : t_FixityTable) (dtb_u_u242 : string) (dtb_u_u243 : Frontend_dAst.t_NodeRef) (dtb_u_u244 : Frontend_dAst.t_Expr) (dtb_u_u245 : Frontend_dAst.t_Expr B_dData_dList.t_List) (dtb_u_u246 : Frontend_dAst.t_NodeRef) -> (match dtb_u_u245 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u247, dtb_u_u248) -> ((Base_dCommon.v_bind ((v_reorderExpr dtb_u_u241) dtb_u_u247)) (fun (dtb_u_u249 : Frontend_dAst.t_Expr) -> ((Base_dCommon.v_bind ((v_reorderExpr dtb_u_u241) dtb_u_u244)) (fun (dtb_u_u250 : Frontend_dAst.t_Expr) -> ((Base_dCommon.v_bind ((Base_dCommon.v_traverse (fun (dtb_u_u251 : Frontend_dAst.t_Expr) -> ((v_reorderExpr dtb_u_u241) dtb_u_u251))) dtb_u_u248)) (fun (dtb_u_u252 : Frontend_dAst.t_Expr B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((((v_foldApps (Frontend_dAst.C_Expr_EApp ((Frontend_dAst.C_Expr_EVar (dtb_u_u242, dtb_u_u243)), (B_dData_dList.C_List__x58__x58_ (dtb_u_u249, (B_dData_dList.C_List__x58__x58_ (dtb_u_u250, B_dData_dList.C_List_Nil)))), dtb_u_u246))) dtb_u_u252) dtb_u_u246)))))))))
  | B_dData_dList.C_List_Nil -> (Base_dDiag.v_icInternal "section application without arguments")
  | _ -> failwith "DT: impossible branch"
))
# 305 "Vuna/Compiler/Loader/Fixity.vuna"
and v_applySectionRight = (fun (dtb_u_u253 : t_FixityTable) (dtb_u_u254 : string) (dtb_u_u255 : Frontend_dAst.t_NodeRef) (dtb_u_u256 : Frontend_dAst.t_Expr) (dtb_u_u257 : Frontend_dAst.t_Expr B_dData_dList.t_List) (dtb_u_u258 : Frontend_dAst.t_NodeRef) -> (match dtb_u_u257 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u259, dtb_u_u260) -> ((Base_dCommon.v_bind ((v_reorderExpr dtb_u_u253) dtb_u_u256)) (fun (dtb_u_u261 : Frontend_dAst.t_Expr) -> ((Base_dCommon.v_bind ((v_reorderExpr dtb_u_u253) dtb_u_u259)) (fun (dtb_u_u262 : Frontend_dAst.t_Expr) -> ((Base_dCommon.v_bind ((Base_dCommon.v_traverse (fun (dtb_u_u263 : Frontend_dAst.t_Expr) -> ((v_reorderExpr dtb_u_u253) dtb_u_u263))) dtb_u_u260)) (fun (dtb_u_u264 : Frontend_dAst.t_Expr B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((((v_foldApps (Frontend_dAst.C_Expr_EApp ((Frontend_dAst.C_Expr_EVar (dtb_u_u254, dtb_u_u255)), (B_dData_dList.C_List__x58__x58_ (dtb_u_u261, (B_dData_dList.C_List__x58__x58_ (dtb_u_u262, B_dData_dList.C_List_Nil)))), dtb_u_u258))) dtb_u_u264) dtb_u_u258)))))))))
  | B_dData_dList.C_List_Nil -> (Base_dDiag.v_icInternal "section application without arguments")
  | _ -> failwith "DT: impossible branch"
))
# 313 "Vuna/Compiler/Loader/Fixity.vuna"
and v_reorderExpr = (fun (dtb_u_u265 : t_FixityTable) (dtb_u_u266 : Frontend_dAst.t_Expr) -> (match dtb_u_u266 with
  | Frontend_dAst.C_Expr_EApp (dtb_u_u267, dtb_u_u268, dtb_u_u269) -> (match dtb_u_u267 with
  | Frontend_dAst.C_Expr_EVar (dtb_u_u270, dtb_u_u271) -> (match dtb_u_u268 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u272, dtb_u_u273) -> (match dtb_u_u273 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u274, dtb_u_u275) -> (match dtb_u_u275 with
  | B_dData_dList.C_List_Nil -> (if ((v_isChainNode dtb_u_u265) dtb_u_u266) then ((v_reorderChain dtb_u_u265) dtb_u_u266) else ((v_reorderNonChain dtb_u_u265) dtb_u_u266))
  | _ -> ((v_reorderNonChain dtb_u_u265) dtb_u_u266)
)
  | _ -> ((v_reorderNonChain dtb_u_u265) dtb_u_u266)
)
  | _ -> ((v_reorderNonChain dtb_u_u265) dtb_u_u266)
)
  | _ -> ((v_reorderNonChain dtb_u_u265) dtb_u_u266)
)
  | _ -> ((v_reorderNonChain dtb_u_u265) dtb_u_u266)
))
# 319 "Vuna/Compiler/Loader/Fixity.vuna"
and v_reorderInterpParts = (fun (dtb_u_u276 : t_FixityTable) (dtb_u_u277 : Frontend_dAst.t_InterpPart B_dData_dList.t_List) -> (match dtb_u_u277 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u278, dtb_u_u279) -> (match dtb_u_u278 with
  | Frontend_dAst.C_InterpPart_IPText (dtb_u_u280) -> ((Base_dCommon.v_bind ((v_reorderInterpParts dtb_u_u276) dtb_u_u279)) (fun (dtb_u_u281 : Frontend_dAst.t_InterpPart B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((B_dData_dList.C_List__x58__x58_ ((Frontend_dAst.C_InterpPart_IPText (dtb_u_u280)), dtb_u_u281))))))
  | Frontend_dAst.C_InterpPart_IPHole (dtb_u_u282) -> ((Base_dCommon.v_bind ((v_reorderExpr dtb_u_u276) dtb_u_u282)) (fun (dtb_u_u283 : Frontend_dAst.t_Expr) -> ((Base_dCommon.v_bind ((v_reorderInterpParts dtb_u_u276) dtb_u_u279)) (fun (dtb_u_u284 : Frontend_dAst.t_InterpPart B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((B_dData_dList.C_List__x58__x58_ ((Frontend_dAst.C_InterpPart_IPHole (dtb_u_u283)), dtb_u_u284))))))))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (B_dData_dList.C_List_Nil))
  | _ -> failwith "DT: impossible branch"
))
# 330 "Vuna/Compiler/Loader/Fixity.vuna"
and v_reorderBinds = (fun (dtb_u_u285 : t_FixityTable) (dtb_u_u286 : Frontend_dAst.t_Binding B_dData_dList.t_List) -> ((Base_dCommon.v_traverse (fun (dtb_u_u287 : Frontend_dAst.t_Binding) -> ((v_reorderBind dtb_u_u285) dtb_u_u287))) dtb_u_u286))
# 333 "Vuna/Compiler/Loader/Fixity.vuna"
and v_reorderBind = (fun (dtb_u_u288 : t_FixityTable) (dtb_u_u289 : Frontend_dAst.t_Binding) -> ((Base_dCommon.v_bind ((v_reorderPattern dtb_u_u288) (dtb_u_u289).Frontend_dAst.f_Binding_bindPat)) (fun (dtb_u_u290 : Frontend_dAst.t_Pat) -> ((Base_dCommon.v_bind ((v_reorderBindingSig dtb_u_u288) (dtb_u_u289).Frontend_dAst.f_Binding_bindSig)) (fun (dtb_u_u291 : Frontend_dAst.t_BindingSig B_dData_dMaybe.t_Maybe) -> ((Base_dCommon.v_bind ((v_reorderBindingValue dtb_u_u288) (dtb_u_u289).Frontend_dAst.f_Binding_bindValue)) (fun (dtb_u_u292 : Frontend_dAst.t_BindingValue) -> (Base_dDiag.C_Check_OkC ({ Frontend_dAst.f_Binding_bindPat = dtb_u_u290; Frontend_dAst.f_Binding_bindValue = dtb_u_u292; Frontend_dAst.f_Binding_bindSig = dtb_u_u291; Frontend_dAst.f_Binding_bindRef = (dtb_u_u289).Frontend_dAst.f_Binding_bindRef })))))))))
# 340 "Vuna/Compiler/Loader/Fixity.vuna"
and v_reorderBindingValue = (fun (dtb_u_u293 : t_FixityTable) (dtb_u_u294 : Frontend_dAst.t_BindingValue) -> (match dtb_u_u294 with
  | Frontend_dAst.C_BindingValue_BClauses (dtb_u_u295) -> ((Base_dCommon.v_bind ((v_reorderClauses dtb_u_u293) dtb_u_u295)) (fun (dtb_u_u296 : Frontend_dAst.t_LocalClause B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_BindingValue_BClauses (dtb_u_u296))))))
  | Frontend_dAst.C_BindingValue_BVal (dtb_u_u297) -> ((Base_dCommon.v_bind ((v_reorderExpr dtb_u_u293) dtb_u_u297)) (fun (dtb_u_u298 : Frontend_dAst.t_Expr) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_BindingValue_BVal (dtb_u_u298))))))
  | _ -> failwith "DT: impossible branch"
))
# 347 "Vuna/Compiler/Loader/Fixity.vuna"
and v_reorderBindingSig = (fun (dtb_u_u299 : t_FixityTable) (dtb_u_u300 : Frontend_dAst.t_BindingSig B_dData_dMaybe.t_Maybe) -> (match dtb_u_u300 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u301) -> ((Base_dCommon.v_bind ((v_reorderExpr dtb_u_u299) (dtb_u_u301).Frontend_dAst.f_BindingSig_sigType)) (fun (dtb_u_u302 : Frontend_dAst.t_Expr) -> (Base_dDiag.C_Check_OkC ((B_dData_dMaybe.C_Maybe_Just ({ Frontend_dAst.f_BindingSig_sigType = dtb_u_u302; Frontend_dAst.f_BindingSig_sigRef = (dtb_u_u301).Frontend_dAst.f_BindingSig_sigRef }))))))
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.C_Check_OkC (B_dData_dMaybe.C_Maybe_Nothing))
  | _ -> failwith "DT: impossible branch"
))
# 354 "Vuna/Compiler/Loader/Fixity.vuna"
and v_reorderFields = (fun (dtb_u_u303 : t_FixityTable) (dtb_u_u304 : (string, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> ((Base_dCommon.v_traverse (fun (dtb_u_u305 : (string, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair) -> ((v_reorderField dtb_u_u303) dtb_u_u305))) dtb_u_u304))
# 357 "Vuna/Compiler/Loader/Fixity.vuna"
and v_reorderField = (fun (dtb_u_u306 : t_FixityTable) (dtb_u_u307 : (string, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair) -> (match dtb_u_u307 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u308; B_dData_dPair.f_Pair_second = dtb_u_u309 } -> ((Base_dCommon.v_bind ((v_reorderExpr dtb_u_u306) dtb_u_u309)) (fun (dtb_u_u310 : Frontend_dAst.t_Expr) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb_u_u308; B_dData_dPair.f_Pair_second = dtb_u_u310 }))))
  | _ -> failwith "DT: impossible branch"
))
# 361 "Vuna/Compiler/Loader/Fixity.vuna"
and v_reorderClauses = (fun (dtb_u_u311 : t_FixityTable) (dtb_u_u312 : Frontend_dAst.t_LocalClause B_dData_dList.t_List) -> ((Base_dCommon.v_traverse (fun (dtb_u_u313 : Frontend_dAst.t_LocalClause) -> ((v_reorderClause dtb_u_u311) dtb_u_u313))) dtb_u_u312))
# 365 "Vuna/Compiler/Loader/Fixity.vuna"
and v_reorderAlts = (fun (dtb_u_u314 : t_FixityTable) (dtb_u_u315 : Frontend_dAst.t_Alt B_dData_dList.t_List) -> ((Base_dCommon.v_traverse (fun (dtb_u_u316 : Frontend_dAst.t_Alt) -> ((v_reorderAlt dtb_u_u314) dtb_u_u316))) dtb_u_u315))
# 368 "Vuna/Compiler/Loader/Fixity.vuna"
and v_reorderAlt = (fun (dtb_u_u317 : t_FixityTable) (dtb_u_u318 : Frontend_dAst.t_Alt) -> ((Base_dCommon.v_bind ((v_reorderPattern dtb_u_u317) (dtb_u_u318).Frontend_dAst.f_Alt_altPat)) (fun (dtb_u_u319 : Frontend_dAst.t_Pat) -> ((Base_dCommon.v_bind ((v_reorderExpr dtb_u_u317) (dtb_u_u318).Frontend_dAst.f_Alt_altBody)) (fun (dtb_u_u320 : Frontend_dAst.t_Expr) -> (Base_dDiag.C_Check_OkC ({ Frontend_dAst.f_Alt_altPat = dtb_u_u319; Frontend_dAst.f_Alt_altBody = dtb_u_u320; Frontend_dAst.f_Alt_altRef = (dtb_u_u318).Frontend_dAst.f_Alt_altRef })))))))
# 374 "Vuna/Compiler/Loader/Fixity.vuna"
and v_reorderClause = (fun (dtb_u_u321 : t_FixityTable) (dtb_u_u322 : Frontend_dAst.t_LocalClause) -> ((Base_dCommon.v_bind ((Base_dCommon.v_traverse (fun (dtb_u_u323 : Frontend_dAst.t_Pat) -> ((v_reorderPattern dtb_u_u321) dtb_u_u323))) (dtb_u_u322).Frontend_dAst.f_LocalClause_lcPats)) (fun (dtb_u_u324 : Frontend_dAst.t_Pat B_dData_dList.t_List) -> ((Base_dCommon.v_bind ((v_reorderExpr dtb_u_u321) (dtb_u_u322).Frontend_dAst.f_LocalClause_lcBody)) (fun (dtb_u_u325 : Frontend_dAst.t_Expr) -> (Base_dDiag.C_Check_OkC ({ Frontend_dAst.f_LocalClause_lcPats = dtb_u_u324; Frontend_dAst.f_LocalClause_lcBody = dtb_u_u325; Frontend_dAst.f_LocalClause_lcRef = (dtb_u_u322).Frontend_dAst.f_LocalClause_lcRef; Frontend_dAst.f_LocalClause_lcHead = (dtb_u_u322).Frontend_dAst.f_LocalClause_lcHead })))))))
# 380 "Vuna/Compiler/Loader/Fixity.vuna"
and v_reorderDoStmt = (fun (dtb_u_u326 : t_FixityTable) (dtb_u_u327 : Frontend_dAst.t_DoStmt) -> (match dtb_u_u327 with
  | Frontend_dAst.C_DoStmt_DLet (dtb_u_u328, dtb_u_u329) -> ((Base_dCommon.v_bind ((v_reorderBinds dtb_u_u326) dtb_u_u328)) (fun (dtb_u_u330 : Frontend_dAst.t_Binding B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_DoStmt_DLet (dtb_u_u330, dtb_u_u329))))))
  | Frontend_dAst.C_DoStmt_DExpr (dtb_u_u331, dtb_u_u332) -> ((Base_dCommon.v_bind ((v_reorderExpr dtb_u_u326) dtb_u_u331)) (fun (dtb_u_u333 : Frontend_dAst.t_Expr) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_DoStmt_DExpr (dtb_u_u333, dtb_u_u332))))))
  | Frontend_dAst.C_DoStmt_DBind (dtb_u_u334, dtb_u_u335, dtb_u_u336) -> ((Base_dCommon.v_bind ((v_reorderPattern dtb_u_u326) dtb_u_u334)) (fun (dtb_u_u337 : Frontend_dAst.t_Pat) -> ((Base_dCommon.v_bind ((v_reorderExpr dtb_u_u326) dtb_u_u335)) (fun (dtb_u_u338 : Frontend_dAst.t_Expr) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_DoStmt_DBind (dtb_u_u337, dtb_u_u338, dtb_u_u336))))))))
  | _ -> failwith "DT: impossible branch"
))

# 445 "Vuna/Compiler/Loader/Fixity.vuna"
let v_reorderTraitParam = (fun (dtb_u_u339 : t_FixityTable) (dtb_u_u340 : Frontend_dAst.t_TraitParam) -> (match (dtb_u_u340).Frontend_dAst.f_TraitParam_traitParamKind with
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.C_Check_OkC (dtb_u_u340))
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u341) -> ((Base_dCommon.v_bind ((v_reorderExpr dtb_u_u339) dtb_u_u341)) (fun (dtb_u_u342 : Frontend_dAst.t_Expr) -> (Base_dDiag.C_Check_OkC ({ Frontend_dAst.f_TraitParam_traitParamName = (dtb_u_u340).Frontend_dAst.f_TraitParam_traitParamName; Frontend_dAst.f_TraitParam_traitParamKind = (B_dData_dMaybe.C_Maybe_Just (dtb_u_u342)) }))))
  | _ -> failwith "DT: impossible branch"
))

# 454 "Vuna/Compiler/Loader/Fixity.vuna"
let v_reorderCtor = (fun (dtb_u_u343 : t_FixityTable) (dtb_u_u344 : Frontend_dAst.t_Ctor) -> (match dtb_u_u344 with
  | { Frontend_dAst.f_Ctor_ctorName = dtb_u_u345; Frontend_dAst.f_Ctor_ctorType = dtb_u_u346; Frontend_dAst.f_Ctor_ctorArity = dtb_u_u347; Frontend_dAst.f_Ctor_ctorRef = dtb_u_u348 } -> ((Base_dCommon.v_bind ((v_reorderExpr dtb_u_u343) dtb_u_u346)) (fun (dtb_u_u349 : Frontend_dAst.t_Expr) -> (Base_dDiag.C_Check_OkC ({ Frontend_dAst.f_Ctor_ctorName = dtb_u_u345; Frontend_dAst.f_Ctor_ctorType = dtb_u_u349; Frontend_dAst.f_Ctor_ctorArity = dtb_u_u347; Frontend_dAst.f_Ctor_ctorRef = dtb_u_u348 }))))
  | _ -> failwith "DT: impossible branch"
))

# 458 "Vuna/Compiler/Loader/Fixity.vuna"
let v_reorderRecordField = (fun (dtb_u_u350 : t_FixityTable) (dtb_u_u351 : Frontend_dAst.t_Field) -> (match dtb_u_u351 with
  | { Frontend_dAst.f_Field_fieldName = dtb_u_u352; Frontend_dAst.f_Field_fieldType = dtb_u_u353; Frontend_dAst.f_Field_fieldRef = dtb_u_u354 } -> ((Base_dCommon.v_bind ((v_reorderExpr dtb_u_u350) dtb_u_u353)) (fun (dtb_u_u355 : Frontend_dAst.t_Expr) -> (Base_dDiag.C_Check_OkC ({ Frontend_dAst.f_Field_fieldName = dtb_u_u352; Frontend_dAst.f_Field_fieldType = dtb_u_u355; Frontend_dAst.f_Field_fieldRef = dtb_u_u354 }))))
  | _ -> failwith "DT: impossible branch"
))

# 462 "Vuna/Compiler/Loader/Fixity.vuna"
let v_reorderTraitMethod = (fun (dtb_u_u356 : t_FixityTable) (dtb_u_u357 : Frontend_dAst.t_TraitMethod) -> (match dtb_u_u357 with
  | { Frontend_dAst.f_TraitMethod_traitMethodName = dtb_u_u358; Frontend_dAst.f_TraitMethod_traitMethodType = dtb_u_u359; Frontend_dAst.f_TraitMethod_traitMethodRef = dtb_u_u360 } -> ((Base_dCommon.v_bind ((v_reorderExpr dtb_u_u356) dtb_u_u359)) (fun (dtb_u_u361 : Frontend_dAst.t_Expr) -> (Base_dDiag.C_Check_OkC ({ Frontend_dAst.f_TraitMethod_traitMethodName = dtb_u_u358; Frontend_dAst.f_TraitMethod_traitMethodType = dtb_u_u361; Frontend_dAst.f_TraitMethod_traitMethodRef = dtb_u_u360 }))))
  | _ -> failwith "DT: impossible branch"
))

# 466 "Vuna/Compiler/Loader/Fixity.vuna"
let v_reorderInstanceMethodDecl = (fun (dtb_u_u362 : t_FixityTable) (dtb_u_u363 : Frontend_dAst.t_Decl) -> (match dtb_u_u363 with
  | Frontend_dAst.C_Decl_DFun (dtb_u_u364, dtb_u_u365, dtb_u_u366, dtb_u_u367) -> ((Base_dCommon.v_bind ((Base_dCommon.v_traverse (fun (dtb_u_u368 : Frontend_dAst.t_Pat) -> ((v_reorderPattern dtb_u_u362) dtb_u_u368))) dtb_u_u365)) (fun (dtb_u_u369 : Frontend_dAst.t_Pat B_dData_dList.t_List) -> ((Base_dCommon.v_bind ((v_reorderExpr dtb_u_u362) dtb_u_u366)) (fun (dtb_u_u370 : Frontend_dAst.t_Expr) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Decl_DFun (dtb_u_u364, dtb_u_u369, dtb_u_u370, dtb_u_u367))))))))
  | Frontend_dAst.C_Decl_DSig (dtb_u_u371, dtb_u_u372, dtb_u_u373, dtb_u_u374) -> ((Base_dCommon.v_bind ((Base_dCommon.v_traverse (fun (dtb_u_u375 : Frontend_dAst.t_Expr) -> ((v_reorderExpr dtb_u_u362) dtb_u_u375))) dtb_u_u372)) (fun (dtb_u_u376 : Frontend_dAst.t_Expr B_dData_dList.t_List) -> ((Base_dCommon.v_bind ((v_reorderExpr dtb_u_u362) dtb_u_u373)) (fun (dtb_u_u377 : Frontend_dAst.t_Expr) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Decl_DSig (dtb_u_u371, dtb_u_u376, dtb_u_u377, dtb_u_u374))))))))
  | _ -> ((Base_dDiag.v_onErrDiag (Base_dDiag.v_withFallbackSpan (Frontend_dAst.v_declSpan dtb_u_u363))) (Base_dDiag.v_icInternal "instance body has a declaration that is neither a signature nor a function"))
))

# 414 "Vuna/Compiler/Loader/Fixity.vuna"
let v_reorderDecl = (fun (dtb_u_u378 : t_FixityTable) (dtb_u_u379 : Frontend_dAst.t_Decl) -> (match dtb_u_u379 with
  | Frontend_dAst.C_Decl_DInstance (dtb_u_u380, dtb_u_u381, dtb_u_u382, dtb_u_u383) -> ((Base_dCommon.v_bind ((Base_dCommon.v_traverse (fun (dtb_u_u384 : Frontend_dAst.t_Expr) -> ((v_reorderExpr dtb_u_u378) dtb_u_u384))) dtb_u_u380)) (fun (dtb_u_u385 : Frontend_dAst.t_Expr B_dData_dList.t_List) -> ((Base_dCommon.v_bind ((v_reorderExpr dtb_u_u378) dtb_u_u381)) (fun (dtb_u_u386 : Frontend_dAst.t_Expr) -> ((Base_dCommon.v_bind ((Base_dCommon.v_traverse (fun (dtb_u_u387 : Frontend_dAst.t_Decl) -> ((v_reorderInstanceMethodDecl dtb_u_u378) dtb_u_u387))) dtb_u_u382)) (fun (dtb_u_u388 : Frontend_dAst.t_Decl B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Decl_DInstance (dtb_u_u385, dtb_u_u386, dtb_u_u388, dtb_u_u383))))))))))
  | Frontend_dAst.C_Decl_DTrait (dtb_u_u389, dtb_u_u390, dtb_u_u391, dtb_u_u392, dtb_u_u393) -> ((Base_dCommon.v_bind ((Base_dCommon.v_traverse (fun (dtb_u_u394 : Frontend_dAst.t_TraitParam) -> ((v_reorderTraitParam dtb_u_u378) dtb_u_u394))) dtb_u_u390)) (fun (dtb_u_u395 : Frontend_dAst.t_TraitParam B_dData_dList.t_List) -> ((Base_dCommon.v_bind ((Base_dCommon.v_traverse (fun (dtb_u_u396 : Frontend_dAst.t_Expr) -> ((v_reorderExpr dtb_u_u378) dtb_u_u396))) dtb_u_u391)) (fun (dtb_u_u397 : Frontend_dAst.t_Expr B_dData_dList.t_List) -> ((Base_dCommon.v_bind ((Base_dCommon.v_traverse (fun (dtb_u_u398 : Frontend_dAst.t_TraitMethod) -> ((v_reorderTraitMethod dtb_u_u378) dtb_u_u398))) dtb_u_u392)) (fun (dtb_u_u399 : Frontend_dAst.t_TraitMethod B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Decl_DTrait (dtb_u_u389, dtb_u_u395, dtb_u_u397, dtb_u_u399, dtb_u_u393))))))))))
  | Frontend_dAst.C_Decl_DRecord (dtb_u_u400, dtb_u_u401, dtb_u_u402, dtb_u_u403, dtb_u_u404, dtb_u_u405, dtb_u_u406, dtb_u_u407) -> ((Base_dCommon.v_bind ((Base_dCommon.v_traverse (fun (dtb_u_u408 : Frontend_dAst.t_Field) -> ((v_reorderRecordField dtb_u_u378) dtb_u_u408))) dtb_u_u402)) (fun (dtb_u_u409 : Frontend_dAst.t_Field B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Decl_DRecord (dtb_u_u400, dtb_u_u401, dtb_u_u409, dtb_u_u403, dtb_u_u404, dtb_u_u405, dtb_u_u406, dtb_u_u407))))))
  | Frontend_dAst.C_Decl_DFun (dtb_u_u410, dtb_u_u411, dtb_u_u412, dtb_u_u413) -> ((Base_dCommon.v_bind ((Base_dCommon.v_traverse (fun (dtb_u_u414 : Frontend_dAst.t_Pat) -> ((v_reorderPattern dtb_u_u378) dtb_u_u414))) dtb_u_u411)) (fun (dtb_u_u415 : Frontend_dAst.t_Pat B_dData_dList.t_List) -> ((Base_dCommon.v_bind ((v_reorderExpr dtb_u_u378) dtb_u_u412)) (fun (dtb_u_u416 : Frontend_dAst.t_Expr) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Decl_DFun (dtb_u_u410, dtb_u_u415, dtb_u_u416, dtb_u_u413))))))))
  | Frontend_dAst.C_Decl_DSig (dtb_u_u417, dtb_u_u418, dtb_u_u419, dtb_u_u420) -> ((Base_dCommon.v_bind ((Base_dCommon.v_traverse (fun (dtb_u_u421 : Frontend_dAst.t_Expr) -> ((v_reorderExpr dtb_u_u378) dtb_u_u421))) dtb_u_u418)) (fun (dtb_u_u422 : Frontend_dAst.t_Expr B_dData_dList.t_List) -> ((Base_dCommon.v_bind ((v_reorderExpr dtb_u_u378) dtb_u_u419)) (fun (dtb_u_u423 : Frontend_dAst.t_Expr) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Decl_DSig (dtb_u_u417, dtb_u_u422, dtb_u_u423, dtb_u_u420))))))))
  | Frontend_dAst.C_Decl_DExtern (dtb_u_u424, dtb_u_u425, dtb_u_u426, dtb_u_u427) -> ((Base_dCommon.v_bind ((v_reorderExpr dtb_u_u378) dtb_u_u426)) (fun (dtb_u_u428 : Frontend_dAst.t_Expr) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Decl_DExtern (dtb_u_u424, dtb_u_u425, dtb_u_u428, dtb_u_u427))))))
  | Frontend_dAst.C_Decl_DAxiom (dtb_u_u429, dtb_u_u430, dtb_u_u431) -> ((Base_dCommon.v_bind ((v_reorderExpr dtb_u_u378) dtb_u_u430)) (fun (dtb_u_u432 : Frontend_dAst.t_Expr) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Decl_DAxiom (dtb_u_u429, dtb_u_u432, dtb_u_u431))))))
  | Frontend_dAst.C_Decl_DData (dtb_u_u433, dtb_u_u434, dtb_u_u435, dtb_u_u436, dtb_u_u437, dtb_u_u438, dtb_u_u439, dtb_u_u440, dtb_u_u441) -> ((Base_dCommon.v_bind ((v_reorderExpr dtb_u_u378) dtb_u_u435)) (fun (dtb_u_u442 : Frontend_dAst.t_Expr) -> ((Base_dCommon.v_bind ((Base_dCommon.v_traverse (fun (dtb_u_u443 : Frontend_dAst.t_Ctor) -> ((v_reorderCtor dtb_u_u378) dtb_u_u443))) dtb_u_u436)) (fun (dtb_u_u444 : Frontend_dAst.t_Ctor B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Decl_DData (dtb_u_u433, dtb_u_u434, dtb_u_u442, dtb_u_u444, dtb_u_u437, dtb_u_u438, dtb_u_u439, dtb_u_u440, dtb_u_u441))))))))
  | _ -> failwith "DT: impossible branch"
))

# 482 "Vuna/Compiler/Loader/Fixity.vuna"
let v_reorderProgram = (fun (dtb_u_u445 : t_FixityTable) (dtb_u_u446 : Frontend_dAst.t_Decl B_dData_dList.t_List) -> ((Base_dCommon.v_traverse (fun (dtb_u_u447 : Frontend_dAst.t_Decl) -> ((v_reorderDecl dtb_u_u445) dtb_u_u447))) dtb_u_u446))

# 30 "Vuna/Compiler/Loader/Fixity.vuna"
let v_fixityDecls = (fun (dtb_u_u448 : t_FixityTable) -> (match dtb_u_u448 with
  | { f_FixityTable_renameMode = dtb_u_u449; f_FixityTable_fixityDecls = dtb_u_u450; f_FixityTable_fixFacts = dtb_u_u451 } -> dtb_u_u450
  | _ -> failwith "DT: impossible branch"
))

# 31 "Vuna/Compiler/Loader/Fixity.vuna"
let v_fixFacts = (fun (dtb_u_u452 : t_FixityTable) -> (match dtb_u_u452 with
  | { f_FixityTable_renameMode = dtb_u_u453; f_FixityTable_fixityDecls = dtb_u_u454; f_FixityTable_fixFacts = dtb_u_u455 } -> dtb_u_u455
  | _ -> failwith "DT: impossible branch"
))

# 100 "Vuna/Compiler/Loader/Fixity.vuna"
let v_chainOp = (fun (dtb_u_u456 : t_ChainOp) -> (match dtb_u_u456 with
  | { f_ChainOp_chainOp = dtb_u_u457; f_ChainOp_chainIsBacktick = dtb_u_u458; f_ChainOp_chainRhs = dtb_u_u459; f_ChainOp_chainRef = dtb_u_u460 } -> dtb_u_u457
  | _ -> failwith "DT: impossible branch"
))

# 101 "Vuna/Compiler/Loader/Fixity.vuna"
let v_chainIsBacktick = (fun (dtb_u_u461 : t_ChainOp) -> (match dtb_u_u461 with
  | { f_ChainOp_chainOp = dtb_u_u462; f_ChainOp_chainIsBacktick = dtb_u_u463; f_ChainOp_chainRhs = dtb_u_u464; f_ChainOp_chainRef = dtb_u_u465 } -> dtb_u_u463
  | _ -> failwith "DT: impossible branch"
))

# 102 "Vuna/Compiler/Loader/Fixity.vuna"
let v_chainRhs = (fun (dtb_u_u466 : t_ChainOp) -> (match dtb_u_u466 with
  | { f_ChainOp_chainOp = dtb_u_u467; f_ChainOp_chainIsBacktick = dtb_u_u468; f_ChainOp_chainRhs = dtb_u_u469; f_ChainOp_chainRef = dtb_u_u470 } -> dtb_u_u469
  | _ -> failwith "DT: impossible branch"
))

# 103 "Vuna/Compiler/Loader/Fixity.vuna"
let v_chainRef = (fun (dtb_u_u471 : t_ChainOp) -> (match dtb_u_u471 with
  | { f_ChainOp_chainOp = dtb_u_u472; f_ChainOp_chainIsBacktick = dtb_u_u473; f_ChainOp_chainRhs = dtb_u_u474; f_ChainOp_chainRef = dtb_u_u475 } -> dtb_u_u475
  | _ -> failwith "DT: impossible branch"
))
