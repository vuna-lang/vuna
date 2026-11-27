open Vuna_runtime
type t_Forwarder = { f_Forwarder_fwdCallee : string; f_Forwarder_fwdCbParam : int; f_Forwarder_fwdArgParams : int B_dData_dList.t_List }
and t_HofSpec = { f_HofSpec_hofLambdaArity : int; f_HofSpec_hofElemParam : int; f_HofSpec_hofListArg : int }
and t_HofCall = { f_HofCall_hofElemBinder : string; f_HofCall_hofListExpr : Frontend_dAst.t_Expr; f_HofCall_hofSideArgs : Frontend_dAst.t_Expr B_dData_dList.t_List; f_HofCall_hofBody : Frontend_dAst.t_Expr }

# 13 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_maxInt = (fun (a : int) (b : int) -> (if (a >= b) then a else b))

# 16 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_notEmpty = (fun mc0 -> (match mc0 with
  | B_dData_dList.C_List_Nil -> false
  | _ -> true
))

# 20 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let rec v_allEqTo = (fun (mc0 : int) (mc1 : int B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__0, dtb__1) -> (if (mc0 = dtb__0) then ((v_allEqTo mc0) dtb__1) else false)
  | B_dData_dList.C_List_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

# 24 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_allSame = (fun (mc0 : int B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__2, dtb__3) -> ((v_allEqTo dtb__2) dtb__3)
  | B_dData_dList.C_List_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

# 29 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_dedup = (fun (names : string B_dData_dList.t_List) -> (B_dData_dList.v_nubNames names))

# 32 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let rec v_joinComma = (fun (mc0 : string B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__4, dtb__5) -> (match dtb__5 with
  | B_dData_dList.C_List_Nil -> dtb__4
  | _ -> (String.concat "" [dtb__4; ", "; (v_joinComma dtb__5)])
)
  | B_dData_dList.C_List_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))

# 38 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let rec v_posHas = (fun (mc0 : string) (mc1 : int) (mc2 : (string, int) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__6, dtb__7) -> (match dtb__6 with
  | { B_dData_dPair.f_Pair_first = dtb__8; B_dData_dPair.f_Pair_second = dtb__9 } -> (if (mc0 = dtb__8) then (if (mc1 = dtb__9) then true else (((v_posHas mc0) mc1) dtb__7)) else (((v_posHas mc0) mc1) dtb__7))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 48 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let rec v_posTblOfGo = (fun (mc0 : (string, int) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc1 : (string, int B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__10, dtb__11) -> (match dtb__10 with
  | { B_dData_dPair.f_Pair_first = dtb__12; B_dData_dPair.f_Pair_second = dtb__13 } -> (match ((((B_dContainer_dHashMap.v_lookup B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) dtb__12) mc1) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__14) -> ((v_posTblOfGo dtb__11) (((((B_dContainer_dHashMap.v_insert B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) dtb__12) (B_dData_dList.C_List__x58__x58_ (dtb__13, dtb__14))) mc1))
  | B_dData_dMaybe.C_Maybe_Nothing -> ((v_posTblOfGo dtb__11) (((((B_dContainer_dHashMap.v_insert B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) dtb__12) (B_dData_dList.C_List__x58__x58_ (dtb__13, B_dData_dList.C_List_Nil))) mc1))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> mc1
  | _ -> failwith "DT: impossible branch"
))

# 45 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_posTblOf = (fun (xs : (string, int) B_dData_dPair.t_Pair B_dData_dList.t_List) -> ((v_posTblOfGo xs) (((B_dContainer_dHashMap.v_fromList B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) B_dData_dList.C_List_Nil)))

# 61 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let rec v_memInt = (fun (mc0 : int) (mc1 : int B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__15, dtb__16) -> (if (mc0 = dtb__15) then true else ((v_memInt mc0) dtb__16))
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 55 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_posHasTbl = (fun (f : string) (i : int) (tbl : (string, int B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) -> (match ((((B_dContainer_dHashMap.v_lookup B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) f) tbl) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__17) -> ((v_memInt i) dtb__17)
  | B_dData_dMaybe.C_Maybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
))

# 65 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_posAdd = (fun (f : string) (i : int) (facts : (string, int) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (if (((v_posHas f) i) facts) then facts else (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = f; B_dData_dPair.f_Pair_second = i }, facts))))

# 68 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let rec v_posSubset = (fun (mc0 : (string, int) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc1 : (string, int) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__18, dtb__19) -> (match dtb__18 with
  | { B_dData_dPair.f_Pair_first = dtb__20; B_dData_dPair.f_Pair_second = dtb__21 } -> (if (((v_posHas dtb__20) dtb__21) mc1) then ((v_posSubset dtb__19) mc1) else false)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

# 72 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_posSetEq = (fun (a : (string, int) B_dData_dPair.t_Pair B_dData_dList.t_List) (b : (string, int) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (if ((B_dData_dList.v_length a) = (B_dData_dList.v_length b)) then ((v_posSubset a) b) else false))

# 75 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let[@tail_mod_cons] rec v_posFilter = (fun (mc0 : (string, int) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc1 : (string, int) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__22, dtb__23) -> (match dtb__22 with
  | { B_dData_dPair.f_Pair_first = dtb__24; B_dData_dPair.f_Pair_second = dtb__25 } -> (if (((v_posHas dtb__24) dtb__25) mc1) then ((v_posFilter dtb__23) mc1) else (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__24; B_dData_dPair.f_Pair_second = dtb__25 }, ((v_posFilter dtb__23) mc1))))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 80 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let rec v_posUnion = (fun (mc0 : (string, int) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc1 : (string, int) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__26, dtb__27) -> (match dtb__26 with
  | { B_dData_dPair.f_Pair_first = dtb__28; B_dData_dPair.f_Pair_second = dtb__29 } -> ((v_posUnion dtb__27) (((v_posAdd dtb__28) dtb__29) mc1))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> mc1
  | _ -> failwith "DT: impossible branch"
))

# 86 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let[@tail_mod_cons] rec v_posFilterTbl = (fun (mc0 : (string, int) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc1 : (string, int B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__30, dtb__31) -> (match dtb__30 with
  | { B_dData_dPair.f_Pair_first = dtb__32; B_dData_dPair.f_Pair_second = dtb__33 } -> (if (((v_posHasTbl dtb__32) dtb__33) mc1) then ((v_posFilterTbl dtb__31) mc1) else (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__32; B_dData_dPair.f_Pair_second = dtb__33 }, ((v_posFilterTbl dtb__31) mc1))))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 91 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let rec v_posSubsetTbl = (fun (mc0 : (string, int) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc1 : (string, int B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__34, dtb__35) -> (match dtb__34 with
  | { B_dData_dPair.f_Pair_first = dtb__36; B_dData_dPair.f_Pair_second = dtb__37 } -> (if (((v_posHasTbl dtb__36) dtb__37) mc1) then ((v_posSubsetTbl dtb__35) mc1) else false)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

# 95 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_posSetEqTbl = (fun (a : (string, int) B_dData_dPair.t_Pair B_dData_dList.t_List) (b : (string, int) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (if (if ((B_dData_dList.v_length a) = (B_dData_dList.v_length b)) then ((v_posSubsetTbl a) (v_posTblOf b)) else false) then ((v_posSubsetTbl b) (v_posTblOf a)) else false))

# 99 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_posUnionTbl = (fun (facts : (string, int) B_dData_dPair.t_Pair B_dData_dList.t_List) (fresh : (string, int) B_dData_dPair.t_Pair B_dData_dList.t_List) -> ((B_dData_dList.v_append fresh) ((v_posFilterTbl facts) (v_posTblOf fresh))))

# 102 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let rec v_funDeclsOf = (fun (mc0 : Frontend_dAst.t_Decl B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__38, dtb__39) -> (match dtb__38 with
  | Frontend_dAst.C_Decl_DFun (dtb__40, dtb__41, dtb__42, dtb__43) -> (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__40; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = dtb__41; B_dData_dPair.f_Pair_second = dtb__42 } }, (v_funDeclsOf dtb__39)))
  | Frontend_dAst.C_Decl_DInstance (dtb__44, dtb__45, dtb__46, dtb__47) -> ((B_dData_dList.v_append (v_funDeclsOf dtb__46)) (v_funDeclsOf dtb__39))
  | _ -> (v_funDeclsOf dtb__39)
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 112 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let rec v_lookupGroup = (fun (mc0 : string) (mc1 : (string, (Frontend_dAst.t_Pat B_dData_dList.t_List, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__48, dtb__49) -> (match dtb__48 with
  | { B_dData_dPair.f_Pair_first = dtb__50; B_dData_dPair.f_Pair_second = dtb__51 } -> (if (dtb__50 = mc0) then (B_dData_dMaybe.C_Maybe_Just (dtb__51)) else ((v_lookupGroup mc0) dtb__49))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 116 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let[@tail_mod_cons] rec v_replaceGroup = (fun (mc0 : string) (mc1 : (Frontend_dAst.t_Pat B_dData_dList.t_List, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc2 : (string, (Frontend_dAst.t_Pat B_dData_dList.t_List, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__52, dtb__53) -> (match dtb__52 with
  | { B_dData_dPair.f_Pair_first = dtb__54; B_dData_dPair.f_Pair_second = dtb__55 } -> (if (dtb__54 = mc0) then (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__54; B_dData_dPair.f_Pair_second = mc1 }, dtb__53)) else (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__54; B_dData_dPair.f_Pair_second = dtb__55 }, (((v_replaceGroup mc0) mc1) dtb__53))))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 138 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let rec v_groupDefsGo = (fun (mc0 : (string, (Frontend_dAst.t_Pat B_dData_dList.t_List, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (mc1 : string B_dData_dList.t_List) (mc2 : (string, (Frontend_dAst.t_Pat B_dData_dList.t_List, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__56, dtb__57) -> (match dtb__56 with
  | { B_dData_dPair.f_Pair_first = dtb__58; B_dData_dPair.f_Pair_second = dtb__59 } -> (match ((((B_dContainer_dHashMap.v_lookup B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) dtb__58) mc0) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__60) -> (((v_groupDefsGo (((((B_dContainer_dHashMap.v_insert B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) dtb__58) (B_dData_dList.C_List__x58__x58_ (dtb__59, dtb__60))) mc0)) mc1) dtb__57)
  | B_dData_dMaybe.C_Maybe_Nothing -> (((v_groupDefsGo (((((B_dContainer_dHashMap.v_insert B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) dtb__58) (B_dData_dList.C_List__x58__x58_ (dtb__59, B_dData_dList.C_List_Nil))) mc0)) (B_dData_dList.C_List__x58__x58_ (dtb__58, mc1))) dtb__57)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> { B_dData_dPair.f_Pair_first = mc0; B_dData_dPair.f_Pair_second = mc1 }
  | _ -> failwith "DT: impossible branch"
))

# 121 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_groupDefs = (fun (decls : Frontend_dAst.t_Decl B_dData_dList.t_List) -> (let stepped = (((v_groupDefsGo (((B_dContainer_dHashMap.v_fromList B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) B_dData_dList.C_List_Nil)) B_dData_dList.C_List_Nil) (v_funDeclsOf decls)) in (let tbl = (B_dData_dPair.v_firstOf stepped) in (let order = (B_dData_dPair.v_secondOf stepped) in ((B_dData_dList.v_map (fun (n : string) -> (let cls2 = (match ((((B_dContainer_dHashMap.v_lookup B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) n) tbl) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__61) -> (B_dData_dList.v_reverse dtb__61)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
) in { B_dData_dPair.f_Pair_first = n; B_dData_dPair.f_Pair_second = cls2 }))) (B_dData_dList.v_reverse order))))))

# 145 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_defNames = (fun (defs : (string, (Frontend_dAst.t_Pat B_dData_dList.t_List, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) -> ((B_dData_dList.v_map B_dData_dPair.v_firstOf) defs))

# 158 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let[@tail_mod_cons] rec v_pvarParamsOf = (fun (mc0 : Frontend_dAst.t_Pat B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__62, dtb__63) -> (match dtb__62 with
  | Frontend_dAst.C_Pat_PVar (dtb__64, dtb__65) -> (B_dData_dList.C_List__x58__x58_ (dtb__64, (v_pvarParamsOf dtb__63)))
  | _ -> B_dData_dList.C_List_Nil
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 165 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let rec v_paramPositionOf = (fun (mc0 : string) (mc1 : string B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__66, dtb__67) -> (if (mc0 = dtb__66) then (B_dData_dMaybe.C_Maybe_Just (0)) else (match ((v_paramPositionOf mc0) dtb__67) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__68) -> (B_dData_dMaybe.C_Maybe_Just ((dtb__68 + 1)))
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 175 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let rec v_argParamIndices = (fun (mc0 : string B_dData_dList.t_List) (mc1 : Frontend_dAst.t_Expr B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__69, dtb__70) -> (match dtb__69 with
  | Frontend_dAst.C_Expr_EVar (dtb__71, dtb__72) -> (match ((v_paramPositionOf dtb__71) mc0) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__73) -> (match ((v_argParamIndices mc0) dtb__70) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__74) -> (B_dData_dMaybe.C_Maybe_Just ((B_dData_dList.C_List__x58__x58_ (dtb__73, dtb__74))))
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | B_dData_dList.C_List_Nil -> (B_dData_dMaybe.C_Maybe_Just (B_dData_dList.C_List_Nil))
  | _ -> failwith "DT: impossible branch"
))

# 188 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_forwarderOfClause = (fun (mc0 : string) (mc1 : (Frontend_dAst.t_Pat B_dData_dList.t_List, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair) -> (match mc1 with
  | { B_dData_dPair.f_Pair_first = dtb__75; B_dData_dPair.f_Pair_second = dtb__76 } -> (let params = (v_pvarParamsOf dtb__75) in (if ((B_dData_dList.v_length params) = (B_dData_dList.v_length dtb__75)) then (let nd_uscrut7 = dtb__76 in (match nd_uscrut7 with
  | Frontend_dAst.C_Expr_EApp (dtb__77, dtb__78, dtb__79) -> (match dtb__77 with
  | Frontend_dAst.C_Expr_EVar (dtb__80, dtb__81) -> (match ((v_paramPositionOf dtb__80) params) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__82) -> (match ((v_argParamIndices params) dtb__78) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__83) -> (B_dData_dMaybe.C_Maybe_Just ({ f_Forwarder_fwdCallee = mc0; f_Forwarder_fwdCbParam = dtb__82; f_Forwarder_fwdArgParams = dtb__83 }))
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)) else B_dData_dMaybe.C_Maybe_Nothing))
  | _ -> failwith "DT: impossible branch"
))

# 205 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let rec v_sameIntLists = (fun (mc0 : int B_dData_dList.t_List) (mc1 : int B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__84, dtb__85) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__86, dtb__87) -> (if (dtb__84 = dtb__86) then ((v_sameIntLists dtb__85) dtb__87) else false)
  | _ -> false
)
  | B_dData_dList.C_List_Nil -> (match mc1 with
  | B_dData_dList.C_List_Nil -> true
  | _ -> false
)
  | _ -> failwith "DT: impossible branch"
))

# 210 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_sameForwarder = (fun (a : t_Forwarder) (b : t_Forwarder) -> (if ((a).f_Forwarder_fwdCbParam = (b).f_Forwarder_fwdCbParam) then ((v_sameIntLists (a).f_Forwarder_fwdArgParams) (b).f_Forwarder_fwdArgParams) else false))

# 213 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let rec v_matchForwarders = (fun (mc0 : t_Forwarder) (mc1 : (Frontend_dAst.t_Pat B_dData_dList.t_List, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__88, dtb__89) -> (match ((v_forwarderOfClause (mc0).f_Forwarder_fwdCallee) dtb__88) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__90) -> (if ((v_sameForwarder mc0) dtb__90) then ((v_matchForwarders mc0) dtb__89) else false)
  | B_dData_dMaybe.C_Maybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

# 220 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_forwarderOfGroup = (fun (mc0 : (string, (Frontend_dAst.t_Pat B_dData_dList.t_List, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dData_dPair.t_Pair) -> (match mc0 with
  | { B_dData_dPair.f_Pair_first = dtb__91; B_dData_dPair.f_Pair_second = dtb__92 } -> (match dtb__92 with
  | B_dData_dList.C_List__x58__x58_ (dtb__93, dtb__94) -> (match ((v_forwarderOfClause dtb__91) dtb__93) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__95) -> (if ((v_matchForwarders dtb__95) dtb__94) then (B_dData_dMaybe.C_Maybe_Just (dtb__95)) else B_dData_dMaybe.C_Maybe_Nothing)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> failwith "DT: impossible branch"
))

# 227 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let[@tail_mod_cons] rec v_forwardersOfDefs = (fun (mc0 : (string, (Frontend_dAst.t_Pat B_dData_dList.t_List, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__96, dtb__97) -> (match (v_forwarderOfGroup dtb__96) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__98) -> (B_dData_dList.C_List__x58__x58_ (dtb__98, (v_forwardersOfDefs dtb__97)))
  | B_dData_dMaybe.C_Maybe_Nothing -> (v_forwardersOfDefs dtb__97)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 234 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_forwardersOf = (fun (decls : Frontend_dAst.t_Decl B_dData_dList.t_List) -> (v_forwardersOfDefs (v_groupDefs decls)))

# 237 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let rec v_lookupForwarder = (fun (mc0 : string) (mc1 : t_Forwarder B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__99, dtb__100) -> (if ((dtb__99).f_Forwarder_fwdCallee = mc0) then (B_dData_dMaybe.C_Maybe_Just (dtb__99)) else ((v_lookupForwarder mc0) dtb__100))
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 350 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let rec v_sumF = (fun (mc0 : int B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__101, dtb__102) -> (dtb__101 + (v_sumF dtb__102))
  | B_dData_dList.C_List_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))

# 345 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let rec v_declFuel = (fun (mc0 : Frontend_dAst.t_Decl) -> (match mc0 with
  | Frontend_dAst.C_Decl_DInstance (dtb__103, dtb__104, dtb__105, dtb__106) -> (64 + (v_sumF ((B_dData_dList.v_map v_declFuel) dtb__105)))
  | Frontend_dAst.C_Decl_DFun (dtb__107, dtb__108, dtb__109, dtb__110) -> ((Frontend_dAstQuery.v_exprBudget 64) dtb__109)
  | _ -> 0
))

# 374 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let rec v_clausesOfDef = (fun (mc0 : string) (mc1 : (string, (Frontend_dAst.t_Pat B_dData_dList.t_List, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__111, dtb__112) -> (match dtb__111 with
  | { B_dData_dPair.f_Pair_first = dtb__113; B_dData_dPair.f_Pair_second = dtb__114 } -> (if (dtb__113 = mc0) then dtb__114 else ((v_clausesOfDef mc0) dtb__112))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 379 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_clausesOfDefTbl = (fun (name : string) (tbl : (string, (Frontend_dAst.t_Pat B_dData_dList.t_List, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) -> (match ((((B_dContainer_dHashMap.v_lookup B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) name) tbl) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__115) -> dtb__115
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 385 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let rec v_defArity = (fun (mc0 : (Frontend_dAst.t_Pat B_dData_dList.t_List, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__116, dtb__117) -> ((v_maxInt (B_dData_dList.v_length (B_dData_dPair.v_firstOf dtb__116))) (v_defArity dtb__117))
  | B_dData_dList.C_List_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))

# 389 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let rec v_maxArityOf = (fun (mc0 : string B_dData_dList.t_List) (mc1 : (string, (Frontend_dAst.t_Pat B_dData_dList.t_List, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__118, dtb__119) -> ((v_maxInt (v_defArity ((v_clausesOfDefTbl dtb__118) mc1))) ((v_maxArityOf dtb__119) mc1))
  | B_dData_dList.C_List_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))

# 403 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_ctorNameOf = (fun (mc0 : Frontend_dAst.t_Ctor) -> (match mc0 with
  | { Frontend_dAst.f_Ctor_ctorName = dtb__120; Frontend_dAst.f_Ctor_ctorType = dtb__121; Frontend_dAst.f_Ctor_ctorArity = dtb__122; Frontend_dAst.f_Ctor_ctorRef = dtb__123 } -> dtb__120
  | _ -> failwith "DT: impossible branch"
))

# 394 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let rec v_ctorNamesOf = (fun (mc0 : Frontend_dAst.t_Decl B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__124, dtb__125) -> (match dtb__124 with
  | Frontend_dAst.C_Decl_DData (dtb__126, dtb__127, dtb__128, dtb__129, dtb__130, dtb__131, dtb__132, dtb__133, dtb__134) -> ((B_dData_dList.v_append ((B_dData_dList.v_map v_ctorNameOf) dtb__129)) (v_ctorNamesOf dtb__125))
  | Frontend_dAst.C_Decl_DRecord (dtb__135, dtb__136, dtb__137, dtb__138, dtb__139, dtb__140, dtb__141, dtb__142) -> (B_dData_dList.C_List__x58__x58_ (dtb__135, (v_ctorNamesOf dtb__125)))
  | _ -> (v_ctorNamesOf dtb__125)
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 406 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let rec v_patSizeStrict = (fun (mc0 : Frontend_dAst.t_Pat) (mc1 : int) (mc2 : int B_dData_dList.t_List) (mc3 : (string, (int, (int, int B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc0 with
  | Frontend_dAst.C_Pat_PRecord (dtb__143, dtb__144, dtb__145) -> (((((v_fieldsSizeStrict dtb__144) mc1) mc2) 0) mc3)
  | Frontend_dAst.C_Pat_PCon (dtb__146, dtb__147, dtb__148) -> (((((v_patsSizeStrict dtb__147) mc1) mc2) 0) mc3)
  | Frontend_dAst.C_Pat_PWild (dtb__149) -> mc3
  | Frontend_dAst.C_Pat_PVar (dtb__150, dtb__151) -> (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__150; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = mc1; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = (B_dData_dList.v_length mc2); B_dData_dPair.f_Pair_second = mc2 } } }, mc3))
  | Frontend_dAst.C_Pat_PAs (dtb__152, dtb__153, dtb__154) -> ((((v_patSizeStrict dtb__153) mc1) mc2) (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__152; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = mc1; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = (B_dData_dList.v_length mc2); B_dData_dPair.f_Pair_second = mc2 } } }, mc3)))
  | _ -> mc3
))
# 415 "Vuna/Compiler/Elab/Termination/Measure.vuna"
and v_patsSizeStrict = (fun (mc0 : Frontend_dAst.t_Pat B_dData_dList.t_List) (mc1 : int) (mc2 : int B_dData_dList.t_List) (mc3 : int) (mc4 : (string, (int, (int, int B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__155, dtb__156) -> (((((v_patsSizeStrict dtb__156) mc1) mc2) (mc3 + 1)) ((((v_patSizeStrict dtb__155) mc1) ((B_dData_dList.v_append mc2) (B_dData_dList.C_List__x58__x58_ (mc3, B_dData_dList.C_List_Nil)))) mc4))
  | B_dData_dList.C_List_Nil -> mc4
  | _ -> failwith "DT: impossible branch"
))
# 420 "Vuna/Compiler/Elab/Termination/Measure.vuna"
and v_fieldsSizeStrict = (fun (mc0 : (string, Frontend_dAst.t_Pat) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc1 : int) (mc2 : int B_dData_dList.t_List) (mc3 : int) (mc4 : (string, (int, (int, int B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__157, dtb__158) -> (match dtb__157 with
  | { B_dData_dPair.f_Pair_first = dtb__159; B_dData_dPair.f_Pair_second = dtb__160 } -> (((((v_fieldsSizeStrict dtb__158) mc1) mc2) (mc3 + 1)) ((((v_patSizeStrict dtb__160) mc1) ((B_dData_dList.v_append mc2) (B_dData_dList.C_List__x58__x58_ (mc3, B_dData_dList.C_List_Nil)))) mc4))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> mc4
  | _ -> failwith "DT: impossible branch"
))

# 428 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let rec v_strSizeEntriesGo = (fun (mc0 : Frontend_dAst.t_Pat B_dData_dList.t_List) (mc1 : int) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__161, dtb__162) -> ((B_dData_dList.v_append ((((v_patSizeStrict dtb__161) mc1) B_dData_dList.C_List_Nil) B_dData_dList.C_List_Nil)) ((v_strSizeEntriesGo dtb__162) (mc1 + 1)))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 425 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_strSizeEntries = (fun (pats : Frontend_dAst.t_Pat B_dData_dList.t_List) -> ((v_strSizeEntriesGo pats) 0))

# 479 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let rec v_sizeOfVarStrict = (fun (mc0 : string) (mc1 : (string, (int, (int, int B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__163, dtb__164) -> (match dtb__163 with
  | { B_dData_dPair.f_Pair_first = dtb__165; B_dData_dPair.f_Pair_second = dtb__166 } -> (if (dtb__165 = mc0) then (B_dData_dMaybe.C_Maybe_Just (dtb__166)) else ((v_sizeOfVarStrict mc0) dtb__164))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 504 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_cmpOpOf = (fun (mc0 : string) -> (if (mc0 = "bi_le_int") then "le" else (if (mc0 = "bi_ge_int") then "ge" else (if (mc0 = "bi_lt_int") then "lt" else (if (mc0 = "bi_gt_int") then "gt" else mc0)))))

# 512 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_opBaseName = (fun (name : string) -> (B_dData_dPair.v_secondOf (Base_dSource.v_splitLastDot (Base_dSource.v_splitOnDot name))))

# 521 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let rec v_lastTwoGo = (fun (mc0 : Frontend_dAst.t_Expr) (mc1 : Frontend_dAst.t_Expr) (mc2 : Frontend_dAst.t_Expr B_dData_dList.t_List) -> (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__167, dtb__168) -> (((v_lastTwoGo mc1) dtb__167) dtb__168)
  | B_dData_dList.C_List_Nil -> { B_dData_dPair.f_Pair_first = mc0; B_dData_dPair.f_Pair_second = mc1 }
  | _ -> failwith "DT: impossible branch"
))

# 517 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_lastTwo = (fun (mc0 : Frontend_dAst.t_Expr B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__169, dtb__170) -> (match dtb__170 with
  | B_dData_dList.C_List__x58__x58_ (dtb__171, dtb__172) -> (B_dData_dMaybe.C_Maybe_Just ((((v_lastTwoGo dtb__169) dtb__171) dtb__172)))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
))

# 558 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_isNatCoerceName = (fun (name : string) -> (let b = (v_opBaseName name) in (if (if (b = "natToInt") then true else (b = "natFromInt")) then true else (b = "toInt"))))

# 552 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let rec v_varOfExpr = (fun (mc0 : Frontend_dAst.t_Expr) -> (match mc0 with
  | Frontend_dAst.C_Expr_EApp (dtb__173, dtb__174, dtb__175) -> (match dtb__173 with
  | Frontend_dAst.C_Expr_EVar (dtb__176, dtb__177) -> (match dtb__174 with
  | B_dData_dList.C_List__x58__x58_ (dtb__178, dtb__179) -> (match dtb__179 with
  | B_dData_dList.C_List_Nil -> (if (v_isNatCoerceName dtb__176) then (v_varOfExpr dtb__178) else B_dData_dMaybe.C_Maybe_Nothing)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | Frontend_dAst.C_Expr_EVar (dtb__180, dtb__181) -> (B_dData_dMaybe.C_Maybe_Just (dtb__180))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
))

# 525 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_guardLE = (fun (args : Frontend_dAst.t_Expr B_dData_dList.t_List) -> (let nd_uscrut1 = (v_lastTwo args) in (match nd_uscrut1 with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb__182) -> (match dtb__182 with
  | { B_dData_dPair.f_Pair_first = dtb__183; B_dData_dPair.f_Pair_second = dtb__184 } -> (match dtb__184 with
  | Frontend_dAst.C_Expr_EInt (dtb__185, dtb__186) -> (if (dtb__185 = 0) then (v_varOfExpr dtb__183) else B_dData_dMaybe.C_Maybe_Nothing)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))

# 534 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_guardGE = (fun (args : Frontend_dAst.t_Expr B_dData_dList.t_List) -> (let nd_uscrut1 = (v_lastTwo args) in (match nd_uscrut1 with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb__187) -> (match dtb__187 with
  | { B_dData_dPair.f_Pair_first = dtb__188; B_dData_dPair.f_Pair_second = dtb__189 } -> (match dtb__188 with
  | Frontend_dAst.C_Expr_EInt (dtb__190, dtb__191) -> (if (dtb__190 = 0) then (v_varOfExpr dtb__189) else B_dData_dMaybe.C_Maybe_Nothing)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))

# 543 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_guardLT = (fun (args : Frontend_dAst.t_Expr B_dData_dList.t_List) -> (let nd_uscrut1 = (v_lastTwo args) in (match nd_uscrut1 with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb__192) -> (match dtb__192 with
  | { B_dData_dPair.f_Pair_first = dtb__193; B_dData_dPair.f_Pair_second = dtb__194 } -> (match dtb__194 with
  | Frontend_dAst.C_Expr_EInt (dtb__195, dtb__196) -> (if (dtb__195 = 1) then (v_varOfExpr dtb__193) else B_dData_dMaybe.C_Maybe_Nothing)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))

# 486 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_guardPosVar = (fun (e : Frontend_dAst.t_Expr) -> (let nd_uscrut1 = e in (match nd_uscrut1 with
  | Frontend_dAst.C_Expr_EApp (dtb__197, dtb__198, dtb__199) -> (match dtb__197 with
  | Frontend_dAst.C_Expr_EVar (dtb__200, dtb__201) -> (if ((v_cmpOpOf (v_opBaseName dtb__200)) = "le") then (v_guardLE dtb__198) else (if ((v_cmpOpOf (v_opBaseName dtb__200)) = "ge") then (v_guardGE dtb__198) else (if ((v_cmpOpOf (v_opBaseName dtb__200)) = "lt") then (v_guardLT dtb__198) else (if ((v_cmpOpOf (v_opBaseName dtb__200)) = "<=") then (v_guardLE dtb__198) else (if ((v_cmpOpOf (v_opBaseName dtb__200)) = ">=") then (v_guardGE dtb__198) else (if ((v_cmpOpOf (v_opBaseName dtb__200)) = "<") then (v_guardLT dtb__198) else B_dData_dMaybe.C_Maybe_Nothing))))))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)))

# 566 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let[@tail_mod_cons] rec v_localClauseBinds = (fun (mc0 : Frontend_dAst.t_LocalClause B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__202, dtb__203) -> (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Pat_PWild ((dtb__202).Frontend_dAst.f_LocalClause_lcRef)); B_dData_dPair.f_Pair_second = (dtb__202).Frontend_dAst.f_LocalClause_lcBody }, (v_localClauseBinds dtb__203)))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 572 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_guardUnion = (fun (a : string B_dData_dList.t_List) (b : string B_dData_dList.t_List) -> (v_dedup ((B_dData_dList.v_append a) b)))

# 575 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let[@tail_mod_cons] rec v_guardInter = (fun (mc0 : string B_dData_dList.t_List) (mc1 : string B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__204, dtb__205) -> (if ((B_dData_dList.v_memName dtb__204) mc1) then (B_dData_dList.C_List__x58__x58_ (dtb__204, ((v_guardInter dtb__205) mc1))) else ((v_guardInter dtb__205) mc1))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 580 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_guardThenPosAtom = (fun (op : string) (args : Frontend_dAst.t_Expr B_dData_dList.t_List) -> (let nd_uscrut2 = (v_lastTwo args) in (match nd_uscrut2 with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb__206) -> (match dtb__206 with
  | { B_dData_dPair.f_Pair_first = dtb__207; B_dData_dPair.f_Pair_second = dtb__208 } -> (match dtb__208 with
  | Frontend_dAst.C_Expr_EInt (dtb__209, dtb__210) -> (if (if (op = "gt") then true else (op = ">")) then (if (dtb__209 >= 0) then (v_varOfExpr dtb__207) else B_dData_dMaybe.C_Maybe_Nothing) else (if (if (op = "ge") then true else (op = ">=")) then (if (dtb__209 >= 1) then (v_varOfExpr dtb__207) else B_dData_dMaybe.C_Maybe_Nothing) else B_dData_dMaybe.C_Maybe_Nothing))
  | _ -> (match dtb__207 with
  | Frontend_dAst.C_Expr_EInt (dtb__211, dtb__212) -> (if (if (op = "lt") then true else (op = "<")) then (if (dtb__211 >= 0) then (v_varOfExpr dtb__208) else B_dData_dMaybe.C_Maybe_Nothing) else (if (if (op = "le") then true else (op = "<=")) then (if (dtb__211 >= 1) then (v_varOfExpr dtb__208) else B_dData_dMaybe.C_Maybe_Nothing) else B_dData_dMaybe.C_Maybe_Nothing))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))

# 606 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_guardElsePosAtom = (fun (op : string) (args : Frontend_dAst.t_Expr B_dData_dList.t_List) -> (let nd_uscrut2 = (v_lastTwo args) in (match nd_uscrut2 with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb__213) -> (match dtb__213 with
  | { B_dData_dPair.f_Pair_first = dtb__214; B_dData_dPair.f_Pair_second = dtb__215 } -> (match dtb__215 with
  | Frontend_dAst.C_Expr_EInt (dtb__216, dtb__217) -> (if (if (op = "le") then true else (op = "<=")) then (if (dtb__216 >= 0) then (v_varOfExpr dtb__214) else B_dData_dMaybe.C_Maybe_Nothing) else (if (if (op = "lt") then true else (op = "<")) then (if (dtb__216 >= 1) then (v_varOfExpr dtb__214) else B_dData_dMaybe.C_Maybe_Nothing) else B_dData_dMaybe.C_Maybe_Nothing))
  | _ -> (match dtb__214 with
  | Frontend_dAst.C_Expr_EInt (dtb__218, dtb__219) -> (if (if (op = "ge") then true else (op = ">=")) then (if (dtb__218 >= 0) then (v_varOfExpr dtb__215) else B_dData_dMaybe.C_Maybe_Nothing) else (if (if (op = "gt") then true else (op = ">")) then (if (dtb__218 >= 1) then (v_varOfExpr dtb__215) else B_dData_dMaybe.C_Maybe_Nothing) else B_dData_dMaybe.C_Maybe_Nothing))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))

# 676 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_isTrueLit = (fun (mc0 : Frontend_dAst.t_Expr) -> (match mc0 with
  | Frontend_dAst.C_Expr_EInt (dtb__220, dtb__221) -> (dtb__220 <> 0)
  | _ -> false
))

# 656 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let rec v_guardElsePosVars = (fun (mc0 : Frontend_dAst.t_Expr) -> (match mc0 with
  | Frontend_dAst.C_Expr_EApp (dtb__222, dtb__223, dtb__224) -> (match dtb__222 with
  | Frontend_dAst.C_Expr_EVar (dtb__225, dtb__226) -> (let opn = (v_cmpOpOf (v_opBaseName dtb__225)) in (if (opn = "&&") then (let nd_uscrut7 = dtb__223 in (match nd_uscrut7 with
  | B_dData_dList.C_List__x58__x58_ (dtb__227, dtb__228) -> (match dtb__228 with
  | B_dData_dList.C_List__x58__x58_ (dtb__229, dtb__230) -> (match dtb__230 with
  | B_dData_dList.C_List_Nil -> ((v_guardInter (v_guardElsePosVars dtb__227)) (v_guardElsePosVars dtb__229))
  | _ -> B_dData_dList.C_List_Nil
)
  | _ -> B_dData_dList.C_List_Nil
)
  | _ -> B_dData_dList.C_List_Nil
)) else (if (opn = "||") then (let nd_uscrut7 = dtb__223 in (match nd_uscrut7 with
  | B_dData_dList.C_List__x58__x58_ (dtb__231, dtb__232) -> (match dtb__232 with
  | B_dData_dList.C_List__x58__x58_ (dtb__233, dtb__234) -> (match dtb__234 with
  | B_dData_dList.C_List_Nil -> ((v_guardUnion (v_guardElsePosVars dtb__231)) (v_guardElsePosVars dtb__233))
  | _ -> B_dData_dList.C_List_Nil
)
  | _ -> B_dData_dList.C_List_Nil
)
  | _ -> B_dData_dList.C_List_Nil
)) else (match ((v_guardElsePosAtom opn) dtb__223) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__235) -> (B_dData_dList.C_List__x58__x58_ (dtb__235, B_dData_dList.C_List_Nil))
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))))
  | _ -> B_dData_dList.C_List_Nil
)
  | Frontend_dAst.C_Expr_EIf (dtb__236, dtb__237, dtb__238, dtb__239) -> (if (v_isTrueLit dtb__237) then ((v_guardUnion (v_guardElsePosVars dtb__236)) (v_guardElsePosVars dtb__238)) else B_dData_dList.C_List_Nil)
  | _ -> B_dData_dList.C_List_Nil
))

# 680 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_isFalseLit = (fun (mc0 : Frontend_dAst.t_Expr) -> (match mc0 with
  | Frontend_dAst.C_Expr_EInt (dtb__240, dtb__241) -> (dtb__240 = 0)
  | _ -> false
))

# 633 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let rec v_guardThenPosVars = (fun (mc0 : Frontend_dAst.t_Expr) -> (match mc0 with
  | Frontend_dAst.C_Expr_EApp (dtb__242, dtb__243, dtb__244) -> (match dtb__242 with
  | Frontend_dAst.C_Expr_EVar (dtb__245, dtb__246) -> (let opn = (v_cmpOpOf (v_opBaseName dtb__245)) in (if (opn = "&&") then (let nd_uscrut7 = dtb__243 in (match nd_uscrut7 with
  | B_dData_dList.C_List__x58__x58_ (dtb__247, dtb__248) -> (match dtb__248 with
  | B_dData_dList.C_List__x58__x58_ (dtb__249, dtb__250) -> (match dtb__250 with
  | B_dData_dList.C_List_Nil -> ((v_guardUnion (v_guardThenPosVars dtb__247)) (v_guardThenPosVars dtb__249))
  | _ -> B_dData_dList.C_List_Nil
)
  | _ -> B_dData_dList.C_List_Nil
)
  | _ -> B_dData_dList.C_List_Nil
)) else (if (opn = "||") then (let nd_uscrut7 = dtb__243 in (match nd_uscrut7 with
  | B_dData_dList.C_List__x58__x58_ (dtb__251, dtb__252) -> (match dtb__252 with
  | B_dData_dList.C_List__x58__x58_ (dtb__253, dtb__254) -> (match dtb__254 with
  | B_dData_dList.C_List_Nil -> ((v_guardInter (v_guardThenPosVars dtb__251)) (v_guardThenPosVars dtb__253))
  | _ -> B_dData_dList.C_List_Nil
)
  | _ -> B_dData_dList.C_List_Nil
)
  | _ -> B_dData_dList.C_List_Nil
)) else (match ((v_guardThenPosAtom opn) dtb__243) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__255) -> (B_dData_dList.C_List__x58__x58_ (dtb__255, B_dData_dList.C_List_Nil))
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))))
  | _ -> B_dData_dList.C_List_Nil
)
  | Frontend_dAst.C_Expr_EIf (dtb__256, dtb__257, dtb__258, dtb__259) -> (if (v_isFalseLit dtb__258) then ((v_guardUnion (v_guardThenPosVars dtb__256)) (v_guardThenPosVars dtb__257)) else B_dData_dList.C_List_Nil)
  | _ -> B_dData_dList.C_List_Nil
))

# 707 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_posMarkPos = (fun (f : string) (i : int) (st : ((string, int) B_dData_dPair.t_Pair B_dData_dList.t_List, (string, int) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dData_dPair.t_Pair) -> { B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = f; B_dData_dPair.f_Pair_second = i }, (B_dData_dPair.v_firstOf st))); B_dData_dPair.f_Pair_second = (B_dData_dPair.v_secondOf st) })

# 710 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_posMarkNeg = (fun (f : string) (i : int) (st : ((string, int) B_dData_dPair.t_Pair B_dData_dList.t_List, (string, int) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dData_dPair.t_Pair) -> { B_dData_dPair.f_Pair_first = (B_dData_dPair.v_firstOf st); B_dData_dPair.f_Pair_second = (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = f; B_dData_dPair.f_Pair_second = i }, (B_dData_dPair.v_secondOf st))) })

# 723 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let[@tail_mod_cons] rec v_dedupInts = (fun (mc0 : int B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__260, dtb__261) -> (if ((v_memInt dtb__260) dtb__261) then (v_dedupInts dtb__261) else (B_dData_dList.C_List__x58__x58_ (dtb__260, (v_dedupInts dtb__261))))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 720 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_posEntryPairs = (fun (mc0 : (string, int B_dData_dList.t_List) B_dData_dPair.t_Pair) -> (match mc0 with
  | { B_dData_dPair.f_Pair_first = dtb__262; B_dData_dPair.f_Pair_second = dtb__263 } -> ((B_dData_dList.v_map (fun (i : int) -> { B_dData_dPair.f_Pair_first = dtb__262; B_dData_dPair.f_Pair_second = i })) (v_dedupInts dtb__263))
  | _ -> failwith "DT: impossible branch"
))

# 717 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_posTblPairs = (fun (tbl : (string, int B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) -> ((B_dData_dList.v_concatMap v_posEntryPairs) (B_dContainer_dHashMap.v_toList tbl)))

# 714 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_posNormalize = (fun (xs : (string, int) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (v_posTblPairs (v_posTblOf xs)))

# 932 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let rec v_pathInPats = (fun (mc0 : string) (mc1 : Frontend_dAst.t_Pat B_dData_dList.t_List) (mc2 : int B_dData_dList.t_List) (mc3 : int) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__264, dtb__265) -> (match (((v_pathInPat mc0) dtb__264) ((B_dData_dList.v_append mc2) (B_dData_dList.C_List__x58__x58_ (mc3, B_dData_dList.C_List_Nil)))) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__266) -> (B_dData_dMaybe.C_Maybe_Just (dtb__266))
  | B_dData_dMaybe.C_Maybe_Nothing -> ((((v_pathInPats mc0) dtb__265) mc2) (mc3 + 1))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))
# 939 "Vuna/Compiler/Elab/Termination/Measure.vuna"
and v_pathInFields = (fun (mc0 : string) (mc1 : (string, Frontend_dAst.t_Pat) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc2 : int B_dData_dList.t_List) (mc3 : int) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__267, dtb__268) -> (match dtb__267 with
  | { B_dData_dPair.f_Pair_first = dtb__269; B_dData_dPair.f_Pair_second = dtb__270 } -> (match (((v_pathInPat mc0) dtb__270) ((B_dData_dList.v_append mc2) (B_dData_dList.C_List__x58__x58_ (mc3, B_dData_dList.C_List_Nil)))) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__271) -> (B_dData_dMaybe.C_Maybe_Just (dtb__271))
  | B_dData_dMaybe.C_Maybe_Nothing -> ((((v_pathInFields mc0) dtb__268) mc2) (mc3 + 1))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))
# 946 "Vuna/Compiler/Elab/Termination/Measure.vuna"
and v_pathInPat = (fun (mc0 : string) (mc1 : Frontend_dAst.t_Pat) (mc2 : int B_dData_dList.t_List) -> (match mc1 with
  | Frontend_dAst.C_Pat_PRecord (dtb__272, dtb__273, dtb__274) -> ((((v_pathInFields mc0) dtb__273) mc2) 0)
  | Frontend_dAst.C_Pat_PCon (dtb__275, dtb__276, dtb__277) -> ((((v_pathInPats mc0) dtb__276) mc2) 0)
  | Frontend_dAst.C_Pat_PWild (dtb__278) -> B_dData_dMaybe.C_Maybe_Nothing
  | Frontend_dAst.C_Pat_PVar (dtb__279, dtb__280) -> (if (dtb__279 = mc0) then (B_dData_dMaybe.C_Maybe_Just (mc2)) else B_dData_dMaybe.C_Maybe_Nothing)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
))

# 953 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_projectionOfDef = (fun (d : (string, (Frontend_dAst.t_Pat B_dData_dList.t_List, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dData_dPair.t_Pair) -> (let nd_uscrut1 = (B_dData_dPair.v_secondOf d) in (match nd_uscrut1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__281, dtb__282) -> (match dtb__282 with
  | B_dData_dList.C_List_Nil -> (let nd_uscrut6 = (B_dData_dPair.v_firstOf dtb__281) in (match nd_uscrut6 with
  | B_dData_dList.C_List__x58__x58_ (dtb__283, dtb__284) -> (match dtb__284 with
  | B_dData_dList.C_List_Nil -> (match (B_dData_dPair.v_secondOf dtb__281) with
  | Frontend_dAst.C_Expr_EVar (dtb__285, dtb__286) -> (match (((v_pathInPat dtb__285) dtb__283) B_dData_dList.C_List_Nil) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__287) -> (if (v_notEmpty dtb__287) then (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (B_dData_dPair.v_firstOf d); B_dData_dPair.f_Pair_second = dtb__287 })) else B_dData_dMaybe.C_Maybe_Nothing)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)
  | Frontend_dAst.C_Expr_ECase (dtb__288, dtb__289, dtb__290) -> (let nd_uscrut14 = { B_dData_dPair.f_Pair_first = dtb__283; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = dtb__288; B_dData_dPair.f_Pair_second = dtb__289 } } in (match nd_uscrut14 with
  | { B_dData_dPair.f_Pair_first = dtb__291; B_dData_dPair.f_Pair_second = dtb__292 } -> (match dtb__291 with
  | Frontend_dAst.C_Pat_PVar (dtb__293, dtb__294) -> (match dtb__292 with
  | { B_dData_dPair.f_Pair_first = dtb__295; B_dData_dPair.f_Pair_second = dtb__296 } -> (match dtb__295 with
  | Frontend_dAst.C_Expr_EVar (dtb__297, dtb__298) -> (match dtb__296 with
  | B_dData_dList.C_List__x58__x58_ (dtb__299, dtb__300) -> (match dtb__300 with
  | B_dData_dList.C_List_Nil -> (if (dtb__293 = dtb__297) then (match (dtb__299).Frontend_dAst.f_Alt_altBody with
  | Frontend_dAst.C_Expr_EVar (dtb__301, dtb__302) -> (match (((v_pathInPat dtb__301) (dtb__299).Frontend_dAst.f_Alt_altPat) B_dData_dList.C_List_Nil) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__303) -> (if (v_notEmpty dtb__303) then (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (B_dData_dPair.v_firstOf d); B_dData_dPair.f_Pair_second = dtb__303 })) else B_dData_dMaybe.C_Maybe_Nothing)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
) else B_dData_dMaybe.C_Maybe_Nothing)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> failwith "DT: impossible branch"
))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)))

# 984 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let[@tail_mod_cons] rec v_projectionsOf = (fun (mc0 : (string, (Frontend_dAst.t_Pat B_dData_dList.t_List, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__304, dtb__305) -> (match (v_projectionOfDef dtb__304) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__306) -> (B_dData_dList.C_List__x58__x58_ (dtb__306, (v_projectionsOf dtb__305)))
  | B_dData_dMaybe.C_Maybe_Nothing -> (v_projectionsOf dtb__305)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 996 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_fieldProjPrefix = "$field."

# 999 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_fieldEntryName = (fun (p : (string, int) B_dData_dPair.t_Pair) -> (B_dData_dPair.v_firstOf p))

# 1002 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_fieldEntryIndex = (fun (p : (string, int) B_dData_dPair.t_Pair) -> (B_dData_dPair.v_secondOf p))

# 1005 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_fieldNameOfField = (fun (f : Frontend_dAst.t_Field) -> (f).Frontend_dAst.f_Field_fieldName)

# 1008 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let[@tail_mod_cons] rec v_numberedFieldNames = (fun (mc0 : Frontend_dAst.t_Field B_dData_dList.t_List) (mc1 : int) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__307, dtb__308) -> (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = (v_fieldNameOfField dtb__307); B_dData_dPair.f_Pair_second = mc1 }, ((v_numberedFieldNames dtb__308) (mc1 + 1))))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 1025 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_reprAlias = (fun (mc0 : Frontend_dAst.t_ReprTier) -> (match mc0 with
  | Frontend_dAst.C_ReprTier_ReprAlias -> true
  | _ -> false
))

# 1012 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let rec v_recordFieldEntries = (fun (mc0 : Frontend_dAst.t_Decl B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__309, dtb__310) -> (let prev = (v_recordFieldEntries dtb__310) in (match dtb__309 with
  | Frontend_dAst.C_Decl_DRecord (dtb__311, dtb__312, dtb__313, dtb__314, dtb__315, dtb__316, dtb__317, dtb__318) -> (if (v_reprAlias dtb__316) then { B_dData_dPair.f_Pair_first = (B_dData_dPair.v_firstOf prev); B_dData_dPair.f_Pair_second = ((B_dData_dList.v_append ((B_dData_dList.v_map v_fieldNameOfField) dtb__313)) (B_dData_dPair.v_secondOf prev)) } else { B_dData_dPair.f_Pair_first = ((B_dData_dList.v_append ((v_numberedFieldNames dtb__313) 0)) (B_dData_dPair.v_firstOf prev)); B_dData_dPair.f_Pair_second = (B_dData_dPair.v_secondOf prev) })
  | _ -> prev
))
  | B_dData_dList.C_List_Nil -> { B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = B_dData_dList.C_List_Nil }
  | _ -> failwith "DT: impossible branch"
))

# 1029 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_fieldIndexOfEntries = (fun (name : string) (entries : (string, int) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (let nd_uscrut2 = (v_dedupInts ((B_dData_dList.v_map v_fieldEntryIndex) ((B_dData_dList.v_filter (fun (p : (string, int) B_dData_dPair.t_Pair) -> ((v_fieldEntryName p) = name))) entries))) in (match nd_uscrut2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__319, dtb__320) -> (match dtb__320 with
  | B_dData_dList.C_List_Nil -> (B_dData_dMaybe.C_Maybe_Just (dtb__319))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)))

# 1043 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let[@tail_mod_cons] rec v_fieldProjectionsGo = (fun (mc0 : string B_dData_dList.t_List) (mc1 : (string, int) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc2 : string B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__321, dtb__322) -> (if ((B_dData_dList.v_memName dtb__321) mc2) then (((v_fieldProjectionsGo dtb__322) mc1) mc2) else (match ((v_fieldIndexOfEntries dtb__321) mc1) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__323) -> (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = (v_fieldProjPrefix ^ dtb__321); B_dData_dPair.f_Pair_second = (B_dData_dList.C_List__x58__x58_ (dtb__323, B_dData_dList.C_List_Nil)) }, (((v_fieldProjectionsGo dtb__322) mc1) mc2)))
  | B_dData_dMaybe.C_Maybe_Nothing -> (((v_fieldProjectionsGo dtb__322) mc1) mc2)
  | _ -> failwith "DT: impossible branch"
))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 1035 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_fieldProjectionsOf = (fun (decls : Frontend_dAst.t_Decl B_dData_dList.t_List) -> (let collected = (v_recordFieldEntries decls) in (let entries = (B_dData_dPair.v_firstOf collected) in (let poisoned = (B_dData_dPair.v_secondOf collected) in (((v_fieldProjectionsGo (v_dedup ((B_dData_dList.v_map v_fieldEntryName) entries))) entries) poisoned)))))

# 1063 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let rec v_fieldProjPath = (fun (mc0 : string) (mc1 : (string, int B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__324, dtb__325) -> (match dtb__324 with
  | { B_dData_dPair.f_Pair_first = dtb__326; B_dData_dPair.f_Pair_second = dtb__327 } -> (if (mc0 = dtb__326) then (B_dData_dMaybe.C_Maybe_Just (dtb__327)) else ((v_fieldProjPath mc0) dtb__325))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 1054 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_fieldIndexOf = (fun (f : string) (projs : (string, int B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match ((v_fieldProjPath (v_fieldProjPrefix ^ f)) projs) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__328) -> (let nd_uscrut4 = dtb__328 in (match nd_uscrut4 with
  | B_dData_dList.C_List__x58__x58_ (dtb__329, dtb__330) -> (match dtb__330 with
  | B_dData_dList.C_List_Nil -> (B_dData_dMaybe.C_Maybe_Just (dtb__329))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
))
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 434 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let rec v_sizeOfExpr = (fun (mc0 : (string, int B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc1 : (string, (int, (int, int B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc2 : Frontend_dAst.t_Expr) -> (match mc2 with
  | Frontend_dAst.C_Expr_EField (dtb__331, dtb__332, dtb__333) -> (let nd_uscrut6 = (((v_sizeOfExpr mc0) mc1) dtb__331) in (match nd_uscrut6 with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb__334) -> (match dtb__334 with
  | { B_dData_dPair.f_Pair_first = dtb__335; B_dData_dPair.f_Pair_second = dtb__336 } -> (match dtb__336 with
  | { B_dData_dPair.f_Pair_first = dtb__337; B_dData_dPair.f_Pair_second = dtb__338 } -> (match ((v_fieldIndexOf dtb__332) mc0) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__339) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = dtb__335; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = (dtb__337 + 1); B_dData_dPair.f_Pair_second = ((B_dData_dList.v_append dtb__338) (B_dData_dList.C_List__x58__x58_ (dtb__339, B_dData_dList.C_List_Nil))) } }))
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))
  | Frontend_dAst.C_Expr_EVar (dtb__340, dtb__341) -> ((v_sizeOfVarStrict dtb__340) mc1)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
))

# 445 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let rec v_extendSizesStrict = (fun (projs : (string, int B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (sizes : (string, (int, (int, int B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (scrut : Frontend_dAst.t_Expr) (pat : Frontend_dAst.t_Pat) -> (match (((v_sizeOfExpr projs) sizes) scrut) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__342) -> (let nd_uscrut6 = dtb__342 in (match nd_uscrut6 with
  | { B_dData_dPair.f_Pair_first = dtb__343; B_dData_dPair.f_Pair_second = dtb__344 } -> (match dtb__344 with
  | { B_dData_dPair.f_Pair_first = dtb__345; B_dData_dPair.f_Pair_second = dtb__346 } -> (match pat with
  | Frontend_dAst.C_Pat_PVar (dtb__347, dtb__348) -> (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__347; B_dData_dPair.f_Pair_second = dtb__342 }, sizes))
  | Frontend_dAst.C_Pat_PAs (dtb__349, dtb__350, dtb__351) -> ((((v_extendSizesStrict projs) (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__349; B_dData_dPair.f_Pair_second = dtb__342 }, sizes))) scrut) dtb__350)
  | Frontend_dAst.C_Pat_PCon (dtb__352, dtb__353, dtb__354) -> ((B_dData_dList.v_append sizes) (((((v_patsSizeStrict dtb__353) dtb__343) dtb__346) 0) B_dData_dList.C_List_Nil))
  | Frontend_dAst.C_Pat_PRecord (dtb__355, dtb__356, dtb__357) -> ((B_dData_dList.v_append sizes) (((((v_fieldsSizeStrict dtb__356) dtb__343) dtb__346) 0) B_dData_dList.C_List_Nil))
  | _ -> sizes
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))
  | B_dData_dMaybe.C_Maybe_Nothing -> sizes
  | _ -> failwith "DT: impossible branch"
))

# 471 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let rec v_extendLocalClauses = (fun (mc0 : (string, int B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc1 : (string, (int, (int, int B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc2 : Frontend_dAst.t_LocalClause B_dData_dList.t_List) -> (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__358, dtb__359) -> (((v_extendLocalClauses mc0) ((((v_extendSizesStrict mc0) mc1) (dtb__358).Frontend_dAst.f_LocalClause_lcBody) (Frontend_dAst.C_Pat_PWild ((Frontend_dAst.v_detachedNodeRef Base_dSource.v_spanEmpty))))) dtb__359)
  | B_dData_dList.C_List_Nil -> mc1
  | _ -> failwith "DT: impossible branch"
))

# 465 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_extendBindingSizes = (fun (projs : (string, int B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (sizes : (string, (int, (int, int B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (b : Frontend_dAst.t_Binding) -> (match (b).Frontend_dAst.f_Binding_bindValue with
  | Frontend_dAst.C_BindingValue_BVal (dtb__360) -> ((((v_extendSizesStrict projs) sizes) dtb__360) (b).Frontend_dAst.f_Binding_bindPat)
  | Frontend_dAst.C_BindingValue_BClauses (dtb__361) -> (((v_extendLocalClauses projs) sizes) dtb__361)
  | _ -> failwith "DT: impossible branch"
))

# 461 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let rec v_extendByBinds = (fun (mc0 : (string, int B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc1 : Frontend_dAst.t_Binding B_dData_dList.t_List) (mc2 : (string, (int, (int, int B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__362, dtb__363) -> (((v_extendByBinds mc0) dtb__363) (((v_extendBindingSizes mc0) mc2) dtb__362))
  | B_dData_dList.C_List_Nil -> mc2
  | _ -> failwith "DT: impossible branch"
))

# 778 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_extendSizesVarOnly = (fun (mc0 : (string, (int, (int, int B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc1 : Frontend_dAst.t_Expr) (mc2 : Frontend_dAst.t_Pat) -> (match mc1 with
  | Frontend_dAst.C_Expr_EVar (dtb__364, dtb__365) -> ((((v_extendSizesStrict B_dData_dList.C_List_Nil) mc0) mc1) mc2)
  | _ -> mc0
))

# 1067 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let rec v_projHas = (fun (mc0 : string) (mc1 : (string, int B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__366, dtb__367) -> (match dtb__366 with
  | { B_dData_dPair.f_Pair_first = dtb__368; B_dData_dPair.f_Pair_second = dtb__369 } -> (if (mc0 = dtb__368) then true else ((v_projHas mc0) dtb__367))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 1076 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let rec v_sameCtorGo = (fun (mc0 : int) (mc1 : Frontend_dAst.t_Expr B_dData_dList.t_List) (mc2 : (string, (int, (int, int B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc3 : int) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__370, dtb__371) -> (match dtb__370 with
  | Frontend_dAst.C_Expr_EVar (dtb__372, dtb__373) -> (match ((v_sizeOfVarStrict dtb__372) mc2) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__374) -> (let nd_uscrut11 = dtb__374 in (match nd_uscrut11 with
  | { B_dData_dPair.f_Pair_first = dtb__375; B_dData_dPair.f_Pair_second = dtb__376 } -> (match dtb__376 with
  | { B_dData_dPair.f_Pair_first = dtb__377; B_dData_dPair.f_Pair_second = dtb__378 } -> (((((((v_sameCtorField dtb__375) dtb__377) dtb__378) mc0) dtb__371) mc2) mc3)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))
  | B_dData_dMaybe.C_Maybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
)
  | _ -> false
)
  | B_dData_dList.C_List_Nil -> (mc3 > 0)
  | _ -> failwith "DT: impossible branch"
))
# 1088 "Vuna/Compiler/Elab/Termination/Measure.vuna"
and v_sameCtorField = (fun (base : int) (depth : int) (path : int B_dData_dList.t_List) (p : int) (rest : Frontend_dAst.t_Expr B_dData_dList.t_List) (sizes : (string, (int, (int, int B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (k : int) -> (if (base = p) then (if (depth = 1) then (match path with
  | B_dData_dList.C_List__x58__x58_ (dtb__379, dtb__380) -> (match dtb__380 with
  | B_dData_dList.C_List_Nil -> (if (dtb__379 = k) then ((((v_sameCtorGo p) rest) sizes) (k + 1)) else false)
  | _ -> false
)
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
) else false) else false))

# 1073 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_sameCtorApp = (fun (p : int) (args : Frontend_dAst.t_Expr B_dData_dList.t_List) (sizes : (string, (int, (int, int B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) -> ((((v_sameCtorGo p) args) sizes) 0))

# 1103 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let rec v_findWrapField = (fun (mc0 : int) (mc1 : Frontend_dAst.t_Expr B_dData_dList.t_List) (mc2 : (string, (int, (int, int B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc3 : int) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__381, dtb__382) -> (match dtb__381 with
  | Frontend_dAst.C_Expr_EVar (dtb__383, dtb__384) -> (match ((v_sizeOfVarStrict dtb__383) mc2) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__385) -> (let nd_uscrut11 = dtb__385 in (match nd_uscrut11 with
  | { B_dData_dPair.f_Pair_first = dtb__386; B_dData_dPair.f_Pair_second = dtb__387 } -> (match dtb__387 with
  | { B_dData_dPair.f_Pair_first = dtb__388; B_dData_dPair.f_Pair_second = dtb__389 } -> (if (dtb__386 = mc0) then ((((((v_wrapCheck mc0) dtb__382) mc2) mc3) dtb__388) dtb__389) else ((((v_findWrapField mc0) dtb__382) mc2) (mc3 + 1)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))
  | B_dData_dMaybe.C_Maybe_Nothing -> ((((v_findWrapField mc0) dtb__382) mc2) (mc3 + 1))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> ((((v_findWrapField mc0) dtb__382) mc2) (mc3 + 1))
)
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))
# 1121 "Vuna/Compiler/Elab/Termination/Measure.vuna"
and v_wrapCheck = (fun (p : int) (rest : Frontend_dAst.t_Expr B_dData_dList.t_List) (sizes : (string, (int, (int, int B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (k : int) (depth : int) (path : int B_dData_dList.t_List) -> (if (depth > 0) then (match path with
  | B_dData_dList.C_List__x58__x58_ (dtb__390, dtb__391) -> (if (dtb__390 = k) then (if (v_notEmpty dtb__391) then (B_dData_dMaybe.C_Maybe_Just ((k + 2))) else ((((v_findWrapField p) rest) sizes) (k + 1))) else ((((v_findWrapField p) rest) sizes) (k + 1)))
  | B_dData_dList.C_List_Nil -> ((((v_findWrapField p) rest) sizes) (k + 1))
  | _ -> failwith "DT: impossible branch"
) else ((((v_findWrapField p) rest) sizes) (k + 1))))

# 1134 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_posVarIn = (fun (x : string) (p : int) (caller : string) (facts : (string, int B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (region : string B_dData_dList.t_List) -> (if ((B_dData_dList.v_memName x) region) then true else (((v_posHasTbl caller) p) facts)))

# 1145 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_isSubOpName = (fun (op : string) -> (if (if (if (op = "-") then true else (op = "Base.Trait.Num.sub")) then true else (op = "Base.Trait.Num.-")) then true else ((v_opBaseName op) = "natSub")))

# 1150 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_isAddOpName = (fun (op : string) -> (if (if (op = "+") then true else (op = "Base.Trait.Num.add")) then true else (op = "Base.Trait.Num.+")))

# 1163 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let rec v_natLitOf = (fun (mc0 : Frontend_dAst.t_Expr) -> (match mc0 with
  | Frontend_dAst.C_Expr_EApp (dtb__392, dtb__393, dtb__394) -> (match dtb__392 with
  | Frontend_dAst.C_Expr_EVar (dtb__395, dtb__396) -> (match dtb__393 with
  | B_dData_dList.C_List__x58__x58_ (dtb__397, dtb__398) -> (match dtb__398 with
  | B_dData_dList.C_List_Nil -> (let b = (v_opBaseName dtb__395) in (if (if (b = "S") then true else (b = "Succ")) then (match (v_natLitOf dtb__397) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__399) -> (B_dData_dMaybe.C_Maybe_Just ((dtb__399 + 1)))
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
) else B_dData_dMaybe.C_Maybe_Nothing))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | Frontend_dAst.C_Expr_EVar (dtb__400, dtb__401) -> (let b = (v_opBaseName dtb__400) in (if (if (b = "Z") then true else (b = "Zero")) then (B_dData_dMaybe.C_Maybe_Just (0)) else B_dData_dMaybe.C_Maybe_Nothing))
  | Frontend_dAst.C_Expr_EInt (dtb__402, dtb__403) -> (if (dtb__402 >= 0) then (B_dData_dMaybe.C_Maybe_Just (dtb__402)) else B_dData_dMaybe.C_Maybe_Nothing)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
))

# 1180 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_arithMinusBase = (fun (mc0 : int) (mc1 : Frontend_dAst.t_Expr) (mc2 : int) (mc3 : (string, (int, (int, int B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc4 : string) (mc5 : (string, int B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (mc6 : string B_dData_dList.t_List) -> (match mc1 with
  | Frontend_dAst.C_Expr_EVar (dtb__404, dtb__405) -> (match ((v_sizeOfVarStrict dtb__404) mc3) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__406) -> (let nd_uscrut11 = dtb__406 in (match nd_uscrut11 with
  | { B_dData_dPair.f_Pair_first = dtb__407; B_dData_dPair.f_Pair_second = dtb__408 } -> (match dtb__408 with
  | { B_dData_dPair.f_Pair_first = dtb__409; B_dData_dPair.f_Pair_second = dtb__410 } -> (if (dtb__407 = mc0) then (if (dtb__409 = 0) then (if (((((v_posVarIn dtb__404) mc0) mc4) mc5) mc6) then (B_dData_dMaybe.C_Maybe_Just (4)) else B_dData_dMaybe.C_Maybe_Nothing) else B_dData_dMaybe.C_Maybe_Nothing) else B_dData_dMaybe.C_Maybe_Nothing)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
))

# 1153 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_arithMinus = (fun (p : int) (args : Frontend_dAst.t_Expr B_dData_dList.t_List) (sizes : (string, (int, (int, int B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (caller : string) (facts : (string, int B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (region : string B_dData_dList.t_List) -> (let nd_uscrut6 = (v_lastTwo args) in (match nd_uscrut6 with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb__411) -> (match dtb__411 with
  | { B_dData_dPair.f_Pair_first = dtb__412; B_dData_dPair.f_Pair_second = dtb__413 } -> (match (v_natLitOf dtb__413) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__414) -> (if (dtb__414 > 0) then (((((((v_arithMinusBase p) dtb__412) dtb__414) sizes) caller) facts) region) else B_dData_dMaybe.C_Maybe_Nothing)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))

# 1137 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_arithRel = (fun (mc0 : int) (mc1 : Frontend_dAst.t_Expr) (mc2 : (string, (int, (int, int B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc3 : string) (mc4 : (string, int B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (mc5 : string B_dData_dList.t_List) -> (match mc1 with
  | Frontend_dAst.C_Expr_EApp (dtb__415, dtb__416, dtb__417) -> (match dtb__415 with
  | Frontend_dAst.C_Expr_EVar (dtb__418, dtb__419) -> (if (v_isSubOpName dtb__418) then ((((((v_arithMinus mc0) dtb__416) mc2) mc3) mc4) mc5) else B_dData_dMaybe.C_Maybe_Nothing)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
))

# 1211 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let rec v_lastOf = (fun mc0 -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__420, dtb__421) -> (match dtb__421 with
  | B_dData_dList.C_List_Nil -> (B_dData_dMaybe.C_Maybe_Just (dtb__420))
  | _ -> (v_lastOf dtb__421)
)
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 1197 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_projRel = (fun (p : int) (args : Frontend_dAst.t_Expr B_dData_dList.t_List) (sizes : (string, (int, (int, int B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match (v_lastOf args) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__422) -> (match dtb__422 with
  | Frontend_dAst.C_Expr_EVar (dtb__423, dtb__424) -> (match ((v_sizeOfVarStrict dtb__423) sizes) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__425) -> (let nd_uscrut9 = dtb__425 in (match nd_uscrut9 with
  | { B_dData_dPair.f_Pair_first = dtb__426; B_dData_dPair.f_Pair_second = dtb__427 } -> (match dtb__427 with
  | { B_dData_dPair.f_Pair_first = dtb__428; B_dData_dPair.f_Pair_second = dtb__429 } -> (if (dtb__426 = p) then (B_dData_dMaybe.C_Maybe_Just (1)) else B_dData_dMaybe.C_Maybe_Nothing)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 1281 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_markInvalid = (fun (acc : (bool, (((string, string) B_dData_dPair.t_Pair, int) B_dData_dPair.t_Pair, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dData_dPair.t_Pair) -> { B_dData_dPair.f_Pair_first = false; B_dData_dPair.f_Pair_second = (B_dData_dPair.v_secondOf acc) })

# 1284 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_addEdgeMode = (fun (caller : string) (callee : string) (m : int) (sp : Base_dSource.t_Span) (acc : (bool, (((string, string) B_dData_dPair.t_Pair, int) B_dData_dPair.t_Pair, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dData_dPair.t_Pair) -> { B_dData_dPair.f_Pair_first = (B_dData_dPair.v_firstOf acc); B_dData_dPair.f_Pair_second = (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = { B_dData_dPair.f_Pair_first = { B_dData_dPair.f_Pair_first = caller; B_dData_dPair.f_Pair_second = callee }; B_dData_dPair.f_Pair_second = m }; B_dData_dPair.f_Pair_second = sp }, (B_dData_dPair.v_secondOf acc))) })

# 1287 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_groupHead = (fun (mc0 : string B_dData_dList.t_List) (mc1 : Frontend_dAst.t_Expr) -> (match mc1 with
  | Frontend_dAst.C_Expr_EVar (dtb__430, dtb__431) -> (if ((B_dData_dList.v_memName dtb__430) mc0) then (B_dData_dMaybe.C_Maybe_Just (dtb__430)) else B_dData_dMaybe.C_Maybe_Nothing)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
))

# 1291 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let rec v_nthExpr = (fun (mc0 : Frontend_dAst.t_Expr B_dData_dList.t_List) (mc1 : int) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__432, dtb__433) -> (if (mc1 <= 0) then (B_dData_dMaybe.C_Maybe_Just (dtb__432)) else ((v_nthExpr dtb__433) (mc1 - 1)))
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 241 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let rec v_argsAt = (fun (mc0 : Frontend_dAst.t_Expr B_dData_dList.t_List) (mc1 : int B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__434, dtb__435) -> (match ((v_nthExpr mc0) dtb__434) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__436) -> (match ((v_argsAt mc0) dtb__435) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__437) -> (B_dData_dMaybe.C_Maybe_Just ((B_dData_dList.C_List__x58__x58_ (dtb__436, dtb__437))))
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (B_dData_dMaybe.C_Maybe_Just (B_dData_dList.C_List_Nil))
  | _ -> failwith "DT: impossible branch"
))

# 258 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let[@tail_mod_cons] rec v_fwFieldsF = (fun (mc0 : int) (mc1 : t_Forwarder B_dData_dList.t_List) (mc2 : (string, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__438, dtb__439) -> (match dtb__438 with
  | { B_dData_dPair.f_Pair_first = dtb__440; B_dData_dPair.f_Pair_second = dtb__441 } -> (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__440; B_dData_dPair.f_Pair_second = (((v_fwExprF (mc0 - 1)) mc1) dtb__441) }, (((v_fwFieldsF (mc0 - 1)) mc1) dtb__439)))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))
# 263 "Vuna/Compiler/Elab/Termination/Measure.vuna"
and v_fwBindsF = (fun (mc0 : int) (mc1 : t_Forwarder B_dData_dList.t_List) (mc2 : Frontend_dAst.t_Binding B_dData_dList.t_List) -> (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__442, dtb__443) -> (B_dData_dList.C_List__x58__x58_ ((((v_fwBindingF (mc0 - 1)) mc1) dtb__442), (((v_fwBindsF (mc0 - 1)) mc1) dtb__443)))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))
# 267 "Vuna/Compiler/Elab/Termination/Measure.vuna"
and v_fwBindingF = (fun (fuel : int) (fwds : t_Forwarder B_dData_dList.t_List) (b : Frontend_dAst.t_Binding) -> (let value = (match (b).Frontend_dAst.f_Binding_bindValue with
  | Frontend_dAst.C_BindingValue_BVal (dtb__445) -> (Frontend_dAst.C_BindingValue_BVal ((((v_fwExprF (fuel - 1)) fwds) dtb__445)))
  | Frontend_dAst.C_BindingValue_BClauses (dtb__446) -> (Frontend_dAst.C_BindingValue_BClauses ((((v_fwClausesF (fuel - 1)) fwds) dtb__446)))
  | _ -> failwith "DT: impossible branch"
) in (let sig_ = (match (b).Frontend_dAst.f_Binding_bindSig with
  | B_dData_dMaybe.C_Maybe_Just (dtb__444) -> (B_dData_dMaybe.C_Maybe_Just ({ dtb__444 with Frontend_dAst.f_BindingSig_sigType = (((v_fwExprF (fuel - 1)) fwds) (dtb__444).Frontend_dAst.f_BindingSig_sigType) }))
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
) in { b with Frontend_dAst.f_Binding_bindValue = value; Frontend_dAst.f_Binding_bindSig = sig_ })))
# 280 "Vuna/Compiler/Elab/Termination/Measure.vuna"
and v_fwAltsF = (fun (mc0 : int) (mc1 : t_Forwarder B_dData_dList.t_List) (mc2 : Frontend_dAst.t_Alt B_dData_dList.t_List) -> (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__447, dtb__448) -> (B_dData_dList.C_List__x58__x58_ ({ dtb__447 with Frontend_dAst.f_Alt_altBody = (((v_fwExprF (mc0 - 1)) mc1) (dtb__447).Frontend_dAst.f_Alt_altBody) }, (((v_fwAltsF (mc0 - 1)) mc1) dtb__448)))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))
# 285 "Vuna/Compiler/Elab/Termination/Measure.vuna"
and v_fwClausesF = (fun (mc0 : int) (mc1 : t_Forwarder B_dData_dList.t_List) (mc2 : Frontend_dAst.t_LocalClause B_dData_dList.t_List) -> (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__449, dtb__450) -> (B_dData_dList.C_List__x58__x58_ ({ dtb__449 with Frontend_dAst.f_LocalClause_lcBody = (((v_fwExprF (mc0 - 1)) mc1) (dtb__449).Frontend_dAst.f_LocalClause_lcBody) }, (((v_fwClausesF (mc0 - 1)) mc1) dtb__450)))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))
# 290 "Vuna/Compiler/Elab/Termination/Measure.vuna"
and v_fwStmtsF = (fun (mc0 : int) (mc1 : t_Forwarder B_dData_dList.t_List) (mc2 : Frontend_dAst.t_DoStmt B_dData_dList.t_List) -> (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__451, dtb__452) -> (match dtb__451 with
  | Frontend_dAst.C_DoStmt_DBind (dtb__453, dtb__454, dtb__455) -> (B_dData_dList.C_List__x58__x58_ ((Frontend_dAst.C_DoStmt_DBind (dtb__453, (((v_fwExprF (mc0 - 1)) mc1) dtb__454), dtb__455)), (((v_fwStmtsF (mc0 - 1)) mc1) dtb__452)))
  | Frontend_dAst.C_DoStmt_DExpr (dtb__456, dtb__457) -> (B_dData_dList.C_List__x58__x58_ ((Frontend_dAst.C_DoStmt_DExpr ((((v_fwExprF (mc0 - 1)) mc1) dtb__456), dtb__457)), (((v_fwStmtsF (mc0 - 1)) mc1) dtb__452)))
  | Frontend_dAst.C_DoStmt_DLet (dtb__458, dtb__459) -> (B_dData_dList.C_List__x58__x58_ ((Frontend_dAst.C_DoStmt_DLet ((((v_fwBindsF (mc0 - 1)) mc1) dtb__458), dtb__459)), (((v_fwStmtsF (mc0 - 1)) mc1) dtb__452)))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))
# 298 "Vuna/Compiler/Elab/Termination/Measure.vuna"
and v_fwPartsF = (fun (mc0 : int) (mc1 : t_Forwarder B_dData_dList.t_List) (mc2 : Frontend_dAst.t_InterpPart B_dData_dList.t_List) -> (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__460, dtb__461) -> (match dtb__460 with
  | Frontend_dAst.C_InterpPart_IPText (dtb__462) -> (B_dData_dList.C_List__x58__x58_ ((Frontend_dAst.C_InterpPart_IPText (dtb__462)), (((v_fwPartsF (mc0 - 1)) mc1) dtb__461)))
  | Frontend_dAst.C_InterpPart_IPHole (dtb__463) -> (B_dData_dList.C_List__x58__x58_ ((Frontend_dAst.C_InterpPart_IPHole ((((v_fwExprF (mc0 - 1)) mc1) dtb__463))), (((v_fwPartsF (mc0 - 1)) mc1) dtb__461)))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))
# 305 "Vuna/Compiler/Elab/Termination/Measure.vuna"
and v_fwArgsF = (fun (mc0 : int) (mc1 : t_Forwarder B_dData_dList.t_List) (mc2 : Frontend_dAst.t_Expr B_dData_dList.t_List) -> (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__464, dtb__465) -> (B_dData_dList.C_List__x58__x58_ ((((v_fwExprF (mc0 - 1)) mc1) dtb__464), (((v_fwArgsF (mc0 - 1)) mc1) dtb__465)))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))
# 312 "Vuna/Compiler/Elab/Termination/Measure.vuna"
and v_fwExprF = (fun (fuel : int) (fwds : t_Forwarder B_dData_dList.t_List) (e : Frontend_dAst.t_Expr) -> (if (fuel <= 0) then e else (match e with
  | Frontend_dAst.C_Expr_EApp (dtb__466, dtb__467, dtb__468) -> (let args2 = (((v_fwArgsF (fuel - 1)) fwds) dtb__467) in (match dtb__466 with
  | Frontend_dAst.C_Expr_EVar (dtb__469, dtb__470) -> (match ((v_lookupForwarder dtb__469) fwds) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__471) -> (let nd_uscrut11 = ((v_nthExpr args2) (dtb__471).f_Forwarder_fwdCbParam) in (match nd_uscrut11 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__472) -> (match dtb__472 with
  | Frontend_dAst.C_Expr_EVar (dtb__473, dtb__474) -> (match ((v_argsAt args2) (dtb__471).f_Forwarder_fwdArgParams) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__475) -> (Frontend_dAst.C_Expr_EApp ((Frontend_dAst.C_Expr_EVar (dtb__473, dtb__474)), dtb__475, dtb__468))
  | B_dData_dMaybe.C_Maybe_Nothing -> (Frontend_dAst.C_Expr_EApp ((Frontend_dAst.C_Expr_EVar (dtb__469, dtb__470)), args2, dtb__468))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> (Frontend_dAst.C_Expr_EApp ((Frontend_dAst.C_Expr_EVar (dtb__469, dtb__470)), args2, dtb__468))
)
  | _ -> (Frontend_dAst.C_Expr_EApp ((Frontend_dAst.C_Expr_EVar (dtb__469, dtb__470)), args2, dtb__468))
))
  | B_dData_dMaybe.C_Maybe_Nothing -> (Frontend_dAst.C_Expr_EApp ((((v_fwExprF (fuel - 1)) fwds) dtb__466), args2, dtb__468))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> (Frontend_dAst.C_Expr_EApp ((((v_fwExprF (fuel - 1)) fwds) dtb__466), args2, dtb__468))
))
  | Frontend_dAst.C_Expr_ELam (dtb__476, dtb__477, dtb__478) -> (Frontend_dAst.C_Expr_ELam (dtb__476, (((v_fwExprF (fuel - 1)) fwds) dtb__477), dtb__478))
  | Frontend_dAst.C_Expr_ELet (dtb__479, dtb__480, dtb__481, dtb__482) -> (Frontend_dAst.C_Expr_ELet ((((v_fwBindsF (fuel - 1)) fwds) dtb__479), (((v_fwExprF (fuel - 1)) fwds) dtb__480), dtb__481, dtb__482))
  | Frontend_dAst.C_Expr_ECase (dtb__483, dtb__484, dtb__485) -> (Frontend_dAst.C_Expr_ECase ((((v_fwExprF (fuel - 1)) fwds) dtb__483), (((v_fwAltsF (fuel - 1)) fwds) dtb__484), dtb__485))
  | Frontend_dAst.C_Expr_EIf (dtb__486, dtb__487, dtb__488, dtb__489) -> (Frontend_dAst.C_Expr_EIf ((((v_fwExprF (fuel - 1)) fwds) dtb__486), (((v_fwExprF (fuel - 1)) fwds) dtb__487), (((v_fwExprF (fuel - 1)) fwds) dtb__488), dtb__489))
  | Frontend_dAst.C_Expr_EField (dtb__490, dtb__491, dtb__492) -> (Frontend_dAst.C_Expr_EField ((((v_fwExprF (fuel - 1)) fwds) dtb__490), dtb__491, dtb__492))
  | Frontend_dAst.C_Expr_ERecord (dtb__493, dtb__494, dtb__495) -> (Frontend_dAst.C_Expr_ERecord (dtb__493, (((v_fwFieldsF (fuel - 1)) fwds) dtb__494), dtb__495))
  | Frontend_dAst.C_Expr_ERecUpdate (dtb__496, dtb__497, dtb__498) -> (Frontend_dAst.C_Expr_ERecUpdate ((((v_fwExprF (fuel - 1)) fwds) dtb__496), (((v_fwFieldsF (fuel - 1)) fwds) dtb__497), dtb__498))
  | Frontend_dAst.C_Expr_EDo (dtb__499, dtb__500) -> (Frontend_dAst.C_Expr_EDo ((((v_fwStmtsF (fuel - 1)) fwds) dtb__499), dtb__500))
  | Frontend_dAst.C_Expr_EPi (dtb__501, dtb__502, dtb__503, dtb__504, dtb__505, dtb__506) -> (Frontend_dAst.C_Expr_EPi (dtb__501, dtb__502, dtb__503, (((v_fwExprF (fuel - 1)) fwds) dtb__504), (((v_fwExprF (fuel - 1)) fwds) dtb__505), dtb__506))
  | Frontend_dAst.C_Expr_EInterp (dtb__507, dtb__508) -> (Frontend_dAst.C_Expr_EInterp ((((v_fwPartsF (fuel - 1)) fwds) dtb__507), dtb__508))
  | _ -> e
)))

# 255 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_fwFields = (fun (fwds : t_Forwarder B_dData_dList.t_List) (fields : (string, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (((v_fwFieldsF ((Frontend_dAstQuery.v_exprBudget 32) (Frontend_dAst.C_Expr_ERecord ("", fields, Frontend_dAst.v_noNodeRef)))) fwds) fields))

# 309 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_fwExpr = (fun (fwds : t_Forwarder B_dData_dList.t_List) (e : Frontend_dAst.t_Expr) -> (((v_fwExprF ((Frontend_dAstQuery.v_exprBudget 64) e)) fwds) e))

# 251 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let[@tail_mod_cons] rec v_fwArgs = (fun (mc0 : t_Forwarder B_dData_dList.t_List) (mc1 : Frontend_dAst.t_Expr B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__509, dtb__510) -> (B_dData_dList.C_List__x58__x58_ (((v_fwExpr mc0) dtb__509), ((v_fwArgs mc0) dtb__510)))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 357 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let rec v_fwDeclF = (fun (fuel : int) (fwds : t_Forwarder B_dData_dList.t_List) (d : Frontend_dAst.t_Decl) -> (if (fuel <= 0) then d else (match d with
  | Frontend_dAst.C_Decl_DFun (dtb__511, dtb__512, dtb__513, dtb__514) -> (Frontend_dAst.C_Decl_DFun (dtb__511, dtb__512, (((v_fwExprF (fuel - 1)) fwds) dtb__513), dtb__514))
  | Frontend_dAst.C_Decl_DInstance (dtb__515, dtb__516, dtb__517, dtb__518) -> (Frontend_dAst.C_Decl_DInstance (dtb__515, dtb__516, ((B_dData_dList.v_map ((v_fwDeclF (fuel - 1)) fwds)) dtb__517), dtb__518))
  | _ -> d
)))

# 354 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_fwDecl = (fun (fwds : t_Forwarder B_dData_dList.t_List) (d : Frontend_dAst.t_Decl) -> (((v_fwDeclF (v_declFuel d)) fwds) d))

# 368 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_expandForwarders = (fun (decls : Frontend_dAst.t_Decl B_dData_dList.t_List) -> (match (v_forwardersOf decls) with
  | B_dData_dList.C_List_Nil -> decls
  | dtb__519 -> ((B_dData_dList.v_map (v_fwDecl dtb__519)) decls)
))

# 685 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_argPositive = (fun (args : Frontend_dAst.t_Expr B_dData_dList.t_List) (i : int) (sizes : (string, (int, (int, int B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (caller : string) (facts : (string, int B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (region : string B_dData_dList.t_List) -> (match ((v_nthExpr args) i) with
  | B_dData_dMaybe.C_Maybe_Nothing -> false
  | B_dData_dMaybe.C_Maybe_Just (dtb__520) -> (match dtb__520 with
  | Frontend_dAst.C_Expr_EInt (dtb__521, dtb__522) -> (dtb__521 > 0)
  | Frontend_dAst.C_Expr_EVar (dtb__523, dtb__524) -> (if ((B_dData_dList.v_memName dtb__523) region) then true else (match ((v_sizeOfVarStrict dtb__523) sizes) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__525) -> (let nd_uscrut12 = dtb__525 in (match nd_uscrut12 with
  | { B_dData_dPair.f_Pair_first = dtb__526; B_dData_dPair.f_Pair_second = dtb__527 } -> (match dtb__527 with
  | { B_dData_dPair.f_Pair_first = dtb__528; B_dData_dPair.f_Pair_second = dtb__529 } -> (if (dtb__528 = 0) then (((v_posHasTbl caller) dtb__526) facts) else false)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))
  | B_dData_dMaybe.C_Maybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
))
  | _ -> false
)
  | _ -> failwith "DT: impossible branch"
))

# 873 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let rec v_posWalkCalleeGo = (fun (namesTbl : (string, bool) B_dContainer_dHashMap.t_HashMap) (caller : string) (sizes : (string, (int, (int, int B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (facts : (string, int B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (region : string B_dData_dList.t_List) (g : string) (remaining : int) (args : Frontend_dAst.t_Expr B_dData_dList.t_List) (st : ((string, int) B_dData_dPair.t_Pair B_dData_dList.t_List, (string, int) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dData_dPair.t_Pair) -> (if (remaining <= 0) then st else (let i = ((B_dData_dList.v_length args) - remaining) in (let st1 = (if ((((((v_argPositive args) i) sizes) caller) facts) region) then (((v_posMarkPos g) i) st) else (((v_posMarkNeg g) i) st)) in (((((((((v_posWalkCalleeGo namesTbl) caller) sizes) facts) region) g) (remaining - 1)) args) st1)))))

# 869 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_posWalkCallee = (fun (namesTbl : (string, bool) B_dContainer_dHashMap.t_HashMap) (caller : string) (sizes : (string, (int, (int, int B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (facts : (string, int B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (region : string B_dData_dList.t_List) (g : string) (i : int) (args : Frontend_dAst.t_Expr B_dData_dList.t_List) (st : ((string, int) B_dData_dPair.t_Pair B_dData_dList.t_List, (string, int) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dData_dPair.t_Pair) -> (((((((((v_posWalkCalleeGo namesTbl) caller) sizes) facts) region) g) ((B_dData_dList.v_length args) - i)) args) st))

# 727 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let rec v_posWalkArgsF = (fun (mc0 : int) (mc1 : (string, bool) B_dContainer_dHashMap.t_HashMap) (mc2 : string) (mc3 : (string, (int, (int, int B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc4 : (string, int B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (mc5 : string B_dData_dList.t_List) (mc6 : Frontend_dAst.t_Expr B_dData_dList.t_List) (mc7 : ((string, int) B_dData_dPair.t_Pair B_dData_dList.t_List, (string, int) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dData_dPair.t_Pair) -> (match mc6 with
  | B_dData_dList.C_List__x58__x58_ (dtb__530, dtb__531) -> (if (mc0 <= 0) then mc7 else ((((((((v_posWalkArgsF (mc0 - 1)) mc1) mc2) mc3) mc4) mc5) dtb__531) ((((((((v_posWalkF (mc0 - 1)) mc1) mc2) mc3) mc4) mc5) dtb__530) mc7)))
  | B_dData_dList.C_List_Nil -> mc7
  | _ -> failwith "DT: impossible branch"
))
# 743 "Vuna/Compiler/Elab/Termination/Measure.vuna"
and v_posWalkFieldsF = (fun (mc0 : int) (mc1 : (string, bool) B_dContainer_dHashMap.t_HashMap) (mc2 : string) (mc3 : (string, (int, (int, int B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc4 : (string, int B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (mc5 : string B_dData_dList.t_List) (mc6 : (string, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc7 : ((string, int) B_dData_dPair.t_Pair B_dData_dList.t_List, (string, int) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dData_dPair.t_Pair) -> (match mc6 with
  | B_dData_dList.C_List__x58__x58_ (dtb__532, dtb__533) -> (match dtb__532 with
  | { B_dData_dPair.f_Pair_first = dtb__534; B_dData_dPair.f_Pair_second = dtb__535 } -> (if (mc0 <= 0) then mc7 else ((((((((v_posWalkFieldsF (mc0 - 1)) mc1) mc2) mc3) mc4) mc5) dtb__533) ((((((((v_posWalkF (mc0 - 1)) mc1) mc2) mc3) mc4) mc5) dtb__535) mc7)))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> mc7
  | _ -> failwith "DT: impossible branch"
))
# 759 "Vuna/Compiler/Elab/Termination/Measure.vuna"
and v_posWalkAltsF = (fun (mc0 : int) (mc1 : (string, bool) B_dContainer_dHashMap.t_HashMap) (mc2 : string) (mc3 : (string, (int, (int, int B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc4 : (string, int B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (mc5 : string B_dData_dList.t_List) (mc6 : Frontend_dAst.t_Expr) (mc7 : Frontend_dAst.t_Alt B_dData_dList.t_List) (mc8 : ((string, int) B_dData_dPair.t_Pair B_dData_dList.t_List, (string, int) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dData_dPair.t_Pair) -> (match mc7 with
  | B_dData_dList.C_List__x58__x58_ (dtb__536, dtb__537) -> (if (mc0 <= 0) then mc8 else (((((((((v_posWalkAltsF (mc0 - 1)) mc1) mc2) mc3) mc4) mc5) mc6) dtb__537) ((((((((v_posWalkF (mc0 - 1)) mc1) mc2) (((v_extendSizesVarOnly mc3) mc6) (dtb__536).Frontend_dAst.f_Alt_altPat)) mc4) mc5) (dtb__536).Frontend_dAst.f_Alt_altBody) mc8)))
  | B_dData_dList.C_List_Nil -> mc8
  | _ -> failwith "DT: impossible branch"
))
# 782 "Vuna/Compiler/Elab/Termination/Measure.vuna"
and v_posWalkClausesF = (fun (mc0 : int) (mc1 : (string, bool) B_dContainer_dHashMap.t_HashMap) (mc2 : string) (mc3 : (string, (int, (int, int B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc4 : (string, int B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (mc5 : string B_dData_dList.t_List) (mc6 : Frontend_dAst.t_LocalClause B_dData_dList.t_List) (mc7 : ((string, int) B_dData_dPair.t_Pair B_dData_dList.t_List, (string, int) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dData_dPair.t_Pair) -> (match mc6 with
  | B_dData_dList.C_List__x58__x58_ (dtb__538, dtb__539) -> (if (mc0 <= 0) then mc7 else ((((((((v_posWalkClausesF (mc0 - 1)) mc1) mc2) mc3) mc4) mc5) dtb__539) ((((((((v_posWalkF (mc0 - 1)) mc1) mc2) mc3) mc4) mc5) (dtb__538).Frontend_dAst.f_LocalClause_lcBody) mc7)))
  | B_dData_dList.C_List_Nil -> mc7
  | _ -> failwith "DT: impossible branch"
))
# 798 "Vuna/Compiler/Elab/Termination/Measure.vuna"
and v_posWalkBindsF = (fun (mc0 : int) (mc1 : (string, bool) B_dContainer_dHashMap.t_HashMap) (mc2 : string) (mc3 : (string, (int, (int, int B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc4 : (string, int B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (mc5 : string B_dData_dList.t_List) (mc6 : Frontend_dAst.t_Binding B_dData_dList.t_List) (mc7 : ((string, int) B_dData_dPair.t_Pair B_dData_dList.t_List, (string, int) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dData_dPair.t_Pair) -> (match mc6 with
  | B_dData_dList.C_List__x58__x58_ (dtb__540, dtb__541) -> (if (mc0 <= 0) then mc7 else ((((((((v_posWalkBindsF (mc0 - 1)) mc1) mc2) mc3) mc4) mc5) dtb__541) ((((((((v_posWalkBindingF (mc0 - 1)) mc1) mc2) mc3) mc4) mc5) dtb__540) mc7)))
  | B_dData_dList.C_List_Nil -> mc7
  | _ -> failwith "DT: impossible branch"
))
# 814 "Vuna/Compiler/Elab/Termination/Measure.vuna"
and v_posWalkBindingF = (fun (fuel : int) (namesTbl : (string, bool) B_dContainer_dHashMap.t_HashMap) (caller : string) (sizes : (string, (int, (int, int B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (facts : (string, int B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (region : string B_dData_dList.t_List) (b : Frontend_dAst.t_Binding) (st : ((string, int) B_dData_dPair.t_Pair B_dData_dList.t_List, (string, int) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dData_dPair.t_Pair) -> (if (fuel <= 0) then st else (let st1 = (match (b).Frontend_dAst.f_Binding_bindValue with
  | Frontend_dAst.C_BindingValue_BVal (dtb__543) -> ((((((((v_posWalkF (fuel - 1)) namesTbl) caller) sizes) facts) region) dtb__543) st)
  | Frontend_dAst.C_BindingValue_BClauses (dtb__544) -> ((((((((v_posWalkClausesF (fuel - 1)) namesTbl) caller) sizes) facts) region) dtb__544) st)
  | _ -> failwith "DT: impossible branch"
) in (match (b).Frontend_dAst.f_Binding_bindSig with
  | B_dData_dMaybe.C_Maybe_Just (dtb__542) -> ((((((((v_posWalkF (fuel - 1)) namesTbl) caller) sizes) facts) region) (dtb__542).Frontend_dAst.f_BindingSig_sigType) st1)
  | B_dData_dMaybe.C_Maybe_Nothing -> st1
  | _ -> failwith "DT: impossible branch"
))))
# 828 "Vuna/Compiler/Elab/Termination/Measure.vuna"
and v_posWalkStmtsF = (fun (mc0 : int) (mc1 : (string, bool) B_dContainer_dHashMap.t_HashMap) (mc2 : string) (mc3 : (string, (int, (int, int B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc4 : (string, int B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (mc5 : string B_dData_dList.t_List) (mc6 : Frontend_dAst.t_DoStmt B_dData_dList.t_List) (mc7 : ((string, int) B_dData_dPair.t_Pair B_dData_dList.t_List, (string, int) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dData_dPair.t_Pair) -> (match mc6 with
  | B_dData_dList.C_List__x58__x58_ (dtb__545, dtb__546) -> (if (mc0 <= 0) then mc7 else (match dtb__545 with
  | Frontend_dAst.C_DoStmt_DBind (dtb__547, dtb__548, dtb__549) -> ((((((((v_posWalkStmtsF (mc0 - 1)) mc1) mc2) mc3) mc4) mc5) dtb__546) ((((((((v_posWalkF (mc0 - 1)) mc1) mc2) mc3) mc4) mc5) dtb__548) mc7))
  | Frontend_dAst.C_DoStmt_DExpr (dtb__550, dtb__551) -> ((((((((v_posWalkStmtsF (mc0 - 1)) mc1) mc2) mc3) mc4) mc5) dtb__546) ((((((((v_posWalkF (mc0 - 1)) mc1) mc2) mc3) mc4) mc5) dtb__550) mc7))
  | Frontend_dAst.C_DoStmt_DLet (dtb__552, dtb__553) -> ((((((((v_posWalkStmtsF (mc0 - 1)) mc1) mc2) mc3) mc4) mc5) dtb__546) ((((((((v_posWalkBindsF (mc0 - 1)) mc1) mc2) mc3) mc4) mc5) dtb__552) mc7))
  | _ -> failwith "DT: impossible branch"
))
  | B_dData_dList.C_List_Nil -> mc7
  | _ -> failwith "DT: impossible branch"
))
# 843 "Vuna/Compiler/Elab/Termination/Measure.vuna"
and v_posWalkF = (fun (fuel : int) (namesTbl : (string, bool) B_dContainer_dHashMap.t_HashMap) (caller : string) (sizes : (string, (int, (int, int B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (facts : (string, int B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (region : string B_dData_dList.t_List) (e : Frontend_dAst.t_Expr) (st : ((string, int) B_dData_dPair.t_Pair B_dData_dList.t_List, (string, int) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dData_dPair.t_Pair) -> (if (fuel <= 0) then st else (match e with
  | Frontend_dAst.C_Expr_EApp (dtb__554, dtb__555, dtb__556) -> (match dtb__554 with
  | Frontend_dAst.C_Expr_EVar (dtb__557, dtb__558) -> (if ((((B_dContainer_dHashMap.v_member B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) dtb__557) namesTbl) then ((((((((v_posWalkArgsF (fuel - 1)) namesTbl) caller) sizes) facts) region) dtb__555) (((((((((v_posWalkCallee namesTbl) caller) sizes) facts) region) dtb__557) 0) dtb__555) st)) else ((((((((v_posWalkArgsF (fuel - 1)) namesTbl) caller) sizes) facts) region) dtb__555) ((((((((v_posWalkF (fuel - 1)) namesTbl) caller) sizes) facts) region) dtb__554) st)))
  | _ -> ((((((((v_posWalkArgsF (fuel - 1)) namesTbl) caller) sizes) facts) region) dtb__555) ((((((((v_posWalkF (fuel - 1)) namesTbl) caller) sizes) facts) region) dtb__554) st))
)
  | Frontend_dAst.C_Expr_EIf (dtb__559, dtb__560, dtb__561, dtb__562) -> (let st1 = ((((((((v_posWalkF (fuel - 1)) namesTbl) caller) sizes) facts) region) dtb__559) st) in (let st2 = ((((((((v_posWalkF (fuel - 1)) namesTbl) caller) sizes) facts) ((B_dData_dList.v_append (v_guardThenPosVars dtb__559)) region)) dtb__560) st1) in ((((((((v_posWalkF (fuel - 1)) namesTbl) caller) sizes) facts) ((B_dData_dList.v_append (v_guardElsePosVars dtb__559)) region)) dtb__561) st2)))
  | Frontend_dAst.C_Expr_ECase (dtb__563, dtb__564, dtb__565) -> (((((((((v_posWalkAltsF (fuel - 1)) namesTbl) caller) sizes) facts) region) dtb__563) dtb__564) ((((((((v_posWalkF (fuel - 1)) namesTbl) caller) sizes) facts) region) dtb__563) st))
  | Frontend_dAst.C_Expr_ELam (dtb__566, dtb__567, dtb__568) -> ((((((((v_posWalkF (fuel - 1)) namesTbl) caller) sizes) facts) region) dtb__567) st)
  | Frontend_dAst.C_Expr_ELet (dtb__569, dtb__570, dtb__571, dtb__572) -> ((((((((v_posWalkF (fuel - 1)) namesTbl) caller) sizes) facts) region) dtb__570) ((((((((v_posWalkBindsF (fuel - 1)) namesTbl) caller) sizes) facts) region) dtb__569) st))
  | Frontend_dAst.C_Expr_EPi (dtb__573, dtb__574, dtb__575, dtb__576, dtb__577, dtb__578) -> ((((((((v_posWalkF (fuel - 1)) namesTbl) caller) sizes) facts) region) dtb__577) ((((((((v_posWalkF (fuel - 1)) namesTbl) caller) sizes) facts) region) dtb__576) st))
  | Frontend_dAst.C_Expr_EField (dtb__579, dtb__580, dtb__581) -> ((((((((v_posWalkF (fuel - 1)) namesTbl) caller) sizes) facts) region) dtb__579) st)
  | Frontend_dAst.C_Expr_ERecord (dtb__582, dtb__583, dtb__584) -> ((((((((v_posWalkFieldsF (fuel - 1)) namesTbl) caller) sizes) facts) region) dtb__583) st)
  | Frontend_dAst.C_Expr_ERecUpdate (dtb__585, dtb__586, dtb__587) -> ((((((((v_posWalkFieldsF (fuel - 1)) namesTbl) caller) sizes) facts) region) dtb__586) ((((((((v_posWalkF (fuel - 1)) namesTbl) caller) sizes) facts) region) dtb__585) st))
  | Frontend_dAst.C_Expr_EDo (dtb__588, dtb__589) -> ((((((((v_posWalkStmtsF (fuel - 1)) namesTbl) caller) sizes) facts) region) dtb__588) st)
  | Frontend_dAst.C_Expr_EVar (dtb__590, dtb__591) -> st
  | _ -> st
)))

# 839 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_posWalk = (fun (namesTbl : (string, bool) B_dContainer_dHashMap.t_HashMap) (caller : string) (sizes : (string, (int, (int, int B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (facts : (string, int B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (region : string B_dData_dList.t_List) (e : Frontend_dAst.t_Expr) (st : ((string, int) B_dData_dPair.t_Pair B_dData_dList.t_List, (string, int) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dData_dPair.t_Pair) -> ((((((((v_posWalkF ((Frontend_dAstQuery.v_exprBudget 32) e)) namesTbl) caller) sizes) facts) region) e) st))

# 883 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let rec v_posScanClauses = (fun (mc0 : (string, bool) B_dContainer_dHashMap.t_HashMap) (mc1 : (string, (Frontend_dAst.t_Pat B_dData_dList.t_List, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc2 : (string, int B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (mc3 : string) (mc4 : (Frontend_dAst.t_Pat B_dData_dList.t_List, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc5 : ((string, int) B_dData_dPair.t_Pair B_dData_dList.t_List, (string, int) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dData_dPair.t_Pair) -> (match mc4 with
  | B_dData_dList.C_List__x58__x58_ (dtb__592, dtb__593) -> (let sizes = (v_strSizeEntries (B_dData_dPair.v_firstOf dtb__592)) in (let st2 = (((((((v_posWalk mc0) mc3) sizes) mc2) B_dData_dList.C_List_Nil) (B_dData_dPair.v_secondOf dtb__592)) mc5) in ((((((v_posScanClauses mc0) mc1) mc2) mc3) dtb__593) st2)))
  | B_dData_dList.C_List_Nil -> mc5
  | _ -> failwith "DT: impossible branch"
))

# 891 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let rec v_posScanDefs = (fun (mc0 : (string, bool) B_dContainer_dHashMap.t_HashMap) (mc1 : (string, (Frontend_dAst.t_Pat B_dData_dList.t_List, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc2 : (string, int B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (mc3 : (string, (Frontend_dAst.t_Pat B_dData_dList.t_List, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc4 : ((string, int) B_dData_dPair.t_Pair B_dData_dList.t_List, (string, int) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dData_dPair.t_Pair) -> (match mc3 with
  | B_dData_dList.C_List__x58__x58_ (dtb__594, dtb__595) -> (((((v_posScanDefs mc0) mc1) mc2) dtb__595) ((((((v_posScanClauses mc0) mc1) mc2) (B_dData_dPair.v_firstOf dtb__594)) (B_dData_dPair.v_secondOf dtb__594)) mc4))
  | B_dData_dList.C_List_Nil -> mc4
  | _ -> failwith "DT: impossible branch"
))

# 908 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let rec v_posScanNamesGo = (fun (mc0 : (string, bool) B_dContainer_dHashMap.t_HashMap) (mc1 : (string, (Frontend_dAst.t_Pat B_dData_dList.t_List, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (mc2 : (string, int B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (mc3 : string B_dData_dList.t_List) (mc4 : ((string, int) B_dData_dPair.t_Pair B_dData_dList.t_List, (string, int) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dData_dPair.t_Pair) -> (match mc3 with
  | B_dData_dList.C_List__x58__x58_ (dtb__596, dtb__597) -> (((((v_posScanNamesGo mc0) mc1) mc2) dtb__597) ((((((v_posScanClauses mc0) B_dData_dList.C_List_Nil) mc2) dtb__596) ((v_clausesOfDefTbl dtb__596) mc1)) mc4))
  | B_dData_dList.C_List_Nil -> mc4
  | _ -> failwith "DT: impossible branch"
))

# 902 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_posScanNames = (fun (namesTbl : (string, bool) B_dContainer_dHashMap.t_HashMap) (defTbl : (string, (Frontend_dAst.t_Pat B_dData_dList.t_List, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (factsTbl : (string, int B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (work : string B_dData_dList.t_List) (st : ((string, int) B_dData_dPair.t_Pair B_dData_dList.t_List, (string, int) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dData_dPair.t_Pair) -> (let scanned = (((((v_posScanNamesGo namesTbl) defTbl) factsTbl) work) st) in { B_dData_dPair.f_Pair_first = (v_posNormalize (B_dData_dPair.v_firstOf scanned)); B_dData_dPair.f_Pair_second = (v_posNormalize (B_dData_dPair.v_secondOf scanned)) }))

# 919 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let rec v_computePosFacts = (fun (defs : (string, (Frontend_dAst.t_Pat B_dData_dList.t_List, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (fuel : int) (facts : (string, int) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (if (fuel <= 0) then facts else (((v_computePosFactsStep defs) fuel) facts)))
# 922 "Vuna/Compiler/Elab/Termination/Measure.vuna"
and v_computePosFactsStep = (fun (defs : (string, (Frontend_dAst.t_Pat B_dData_dList.t_List, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (fuel : int) (facts : (string, int) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (let namesTbl = (B_dContainer_dHashMap.v_ofNames (v_defNames defs)) in (let scanned = (((((v_posScanDefs namesTbl) defs) (v_posTblOf facts)) defs) { B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = B_dData_dList.C_List_Nil }) in (let scan = { B_dData_dPair.f_Pair_first = (v_posNormalize (B_dData_dPair.v_firstOf scanned)); B_dData_dPair.f_Pair_second = (v_posNormalize (B_dData_dPair.v_secondOf scanned)) } in (let fresh = ((v_posFilterTbl (B_dData_dPair.v_firstOf scan)) (v_posTblOf (B_dData_dPair.v_secondOf scan))) in (let merged = ((v_posUnionTbl facts) fresh) in (if ((v_posSetEqTbl facts) merged) then merged else (((v_computePosFacts defs) (fuel - 1)) merged))))))))

# 1311 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_unaryHofSpec = { f_HofSpec_hofLambdaArity = 1; f_HofSpec_hofElemParam = 0; f_HofSpec_hofListArg = 1 }

# 1314 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_foldLHofSpec = { f_HofSpec_hofLambdaArity = 2; f_HofSpec_hofElemParam = 1; f_HofSpec_hofListArg = 2 }

# 1317 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_foldRHofSpec = { f_HofSpec_hofLambdaArity = 2; f_HofSpec_hofElemParam = 0; f_HofSpec_hofListArg = 2 }

# 1326 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_hofSpecIn = (fun (m : string) (b : string) -> (if (m = "Base.Data.List") then (if (if (if (if (b = "map") then true else (b = "filter")) then true else (b = "concatMap")) then true else (b = "mapMaybe")) then (B_dData_dMaybe.C_Maybe_Just (v_unaryHofSpec)) else (if (b = "foldl") then (B_dData_dMaybe.C_Maybe_Just (v_foldLHofSpec)) else (if (b = "foldr") then (B_dData_dMaybe.C_Maybe_Just (v_foldRHofSpec)) else B_dData_dMaybe.C_Maybe_Nothing))) else (if (if (m = "Base.Data.Result") then true else (m = "Vuna.Compiler.Base.Common")) then (if (b = "traverse") then (B_dData_dMaybe.C_Maybe_Just (v_unaryHofSpec)) else B_dData_dMaybe.C_Maybe_Nothing) else B_dData_dMaybe.C_Maybe_Nothing)))

# 1320 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_hofSpecOf = (fun (name : string) -> (match (Frontend_dName.v_splitGlobalKey name) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__598) -> ((v_hofSpecIn (B_dData_dPair.v_firstOf dtb__598)) (B_dData_dPair.v_secondOf dtb__598))
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 1338 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let rec v_nthName = (fun (mc0 : string B_dData_dList.t_List) (mc1 : int) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__599, dtb__600) -> (if (mc1 <= 0) then (B_dData_dMaybe.C_Maybe_Just (dtb__599)) else ((v_nthName dtb__600) (mc1 - 1)))
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 1343 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let rec v_peelLam = (fun (n : int) (e : Frontend_dAst.t_Expr) -> (if (n <= 0) then (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = e })) else (match e with
  | Frontend_dAst.C_Expr_ELam (dtb__601, dtb__602, dtb__603) -> (if ((B_dData_dList.v_length dtb__601) > n) then B_dData_dMaybe.C_Maybe_Nothing else (let nd_uscrut5 = ((v_peelLam (n - (B_dData_dList.v_length dtb__601))) dtb__602) in (match nd_uscrut5 with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb__604) -> (match dtb__604 with
  | { B_dData_dPair.f_Pair_first = dtb__605; B_dData_dPair.f_Pair_second = dtb__606 } -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = ((B_dData_dList.v_append ((B_dData_dList.v_map B_dData_dPair.v_firstOf) dtb__601)) dtb__605); B_dData_dPair.f_Pair_second = dtb__606 }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)))

# 1360 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_hofLambdaCall = (fun (mc0 : t_HofSpec) (mc1 : Frontend_dAst.t_Expr B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__607, dtb__608) -> (let nd_uscrut5 = ((v_peelLam (mc0).f_HofSpec_hofLambdaArity) dtb__607) in (match nd_uscrut5 with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb__609) -> (match dtb__609 with
  | { B_dData_dPair.f_Pair_first = dtb__610; B_dData_dPair.f_Pair_second = dtb__611 } -> (if ((B_dData_dList.v_length dtb__608) = (mc0).f_HofSpec_hofListArg) then (match ((v_nthExpr dtb__608) ((mc0).f_HofSpec_hofListArg - 1)) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__612) -> (match ((v_nthName dtb__610) (mc0).f_HofSpec_hofElemParam) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__613) -> (B_dData_dMaybe.C_Maybe_Just ({ f_HofCall_hofElemBinder = dtb__613; f_HofCall_hofListExpr = dtb__612; f_HofCall_hofSideArgs = dtb__608; f_HofCall_hofBody = dtb__611 }))
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
) else B_dData_dMaybe.C_Maybe_Nothing)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
))

# 1376 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_extendElemSizes = (fun (mc0 : (string, (int, (int, int B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc1 : Frontend_dAst.t_Expr) (mc2 : string) -> (match mc1 with
  | Frontend_dAst.C_Expr_EVar (dtb__614, dtb__615) -> (match ((v_sizeOfVarStrict dtb__614) mc0) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__616) -> (let nd_uscrut7 = dtb__616 in (match nd_uscrut7 with
  | { B_dData_dPair.f_Pair_first = dtb__617; B_dData_dPair.f_Pair_second = dtb__618 } -> (match dtb__618 with
  | { B_dData_dPair.f_Pair_first = dtb__619; B_dData_dPair.f_Pair_second = dtb__620 } -> (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = mc2; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = dtb__617; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = (dtb__619 + 1); B_dData_dPair.f_Pair_second = ((B_dData_dList.v_append dtb__620) (B_dData_dList.C_List__x58__x58_ (0, B_dData_dList.C_List_Nil))) } } }, mc0))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))
  | B_dData_dMaybe.C_Maybe_Nothing -> mc0
  | _ -> failwith "DT: impossible branch"
)
  | _ -> mc0
))

# 1388 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let rec v_edgeStrictGo = (fun (mc0 : string) (mc1 : string) (mc2 : (((string, string) B_dData_dPair.t_Pair, int) B_dData_dPair.t_Pair, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc3 : bool) (mc4 : bool) -> (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__621, dtb__622) -> (match dtb__621 with
  | { B_dData_dPair.f_Pair_first = dtb__623; B_dData_dPair.f_Pair_second = dtb__624 } -> (match dtb__623 with
  | { B_dData_dPair.f_Pair_first = dtb__625; B_dData_dPair.f_Pair_second = dtb__626 } -> (match dtb__625 with
  | { B_dData_dPair.f_Pair_first = dtb__627; B_dData_dPair.f_Pair_second = dtb__628 } -> (if (dtb__627 = mc0) then (if (dtb__628 = mc1) then (((((v_edgeStrictGo mc0) mc1) dtb__622) true) (if (dtb__626 > 0) then mc4 else false)) else (((((v_edgeStrictGo mc0) mc1) dtb__622) mc3) mc4)) else (((((v_edgeStrictGo mc0) mc1) dtb__622) mc3) mc4))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (if mc3 then mc4 else false)
  | _ -> failwith "DT: impossible branch"
))

# 1385 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_edgeStrict = (fun (f : string) (g : string) (edges : (((string, string) B_dData_dPair.t_Pair, int) B_dData_dPair.t_Pair, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (((((v_edgeStrictGo f) g) edges) false) true))

# 1402 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let[@tail_mod_cons] rec v_edgeTargetsGo = (fun (mc0 : string) (mc1 : (((string, string) B_dData_dPair.t_Pair, int) B_dData_dPair.t_Pair, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__629, dtb__630) -> (match dtb__629 with
  | { B_dData_dPair.f_Pair_first = dtb__631; B_dData_dPair.f_Pair_second = dtb__632 } -> (match dtb__631 with
  | { B_dData_dPair.f_Pair_first = dtb__633; B_dData_dPair.f_Pair_second = dtb__634 } -> (match dtb__633 with
  | { B_dData_dPair.f_Pair_first = dtb__635; B_dData_dPair.f_Pair_second = dtb__636 } -> (if (dtb__635 = mc0) then (B_dData_dList.C_List__x58__x58_ (dtb__636, ((v_edgeTargetsGo mc0) dtb__630))) else ((v_edgeTargetsGo mc0) dtb__630))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 1399 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_edgeTargets = (fun (f : string) (edges : (((string, string) B_dData_dPair.t_Pair, int) B_dData_dPair.t_Pair, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (v_dedup ((v_edgeTargetsGo f) edges)))

# 1411 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let[@tail_mod_cons] rec v_weakAdjGo = (fun (mc0 : string B_dData_dList.t_List) (mc1 : (((string, string) B_dData_dPair.t_Pair, int) B_dData_dPair.t_Pair, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc2 : string) (mc3 : string B_dData_dList.t_List) -> (match mc3 with
  | B_dData_dList.C_List__x58__x58_ (dtb__637, dtb__638) -> (if (((v_edgeStrict mc2) dtb__637) mc1) then ((((v_weakAdjGo mc0) mc1) mc2) dtb__638) else (B_dData_dList.C_List__x58__x58_ (dtb__637, ((((v_weakAdjGo mc0) mc1) mc2) dtb__638))))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 1408 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_weakAdj = (fun (comp : string B_dData_dList.t_List) (edges : (((string, string) B_dData_dPair.t_Pair, int) B_dData_dPair.t_Pair, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List) (f : string) -> ((((v_weakAdjGo comp) edges) f) ((v_edgeTargets f) edges)))

# 1419 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let rec v_weakReachFuel = (fun (fuel : int) (comp : string B_dData_dList.t_List) (edges : (((string, string) B_dData_dPair.t_Pair, int) B_dData_dPair.t_Pair, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List) (start : string) (frontier : string B_dData_dList.t_List) (visited : string B_dData_dList.t_List) -> (if (fuel <= 0) then true else (match frontier with
  | B_dData_dList.C_List_Nil -> false
  | B_dData_dList.C_List__x58__x58_ (dtb__639, dtb__640) -> (if (dtb__639 = start) then true else (if ((B_dData_dList.v_memName dtb__639) visited) then ((((((v_weakReachFuel (fuel - 1)) comp) edges) start) dtb__640) visited) else ((((((v_weakReachFuel (fuel - 1)) comp) edges) start) ((B_dData_dList.v_append dtb__640) (((v_weakAdj comp) edges) dtb__639))) (B_dData_dList.C_List__x58__x58_ (dtb__639, visited)))))
  | _ -> failwith "DT: impossible branch"
)))

# 1416 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_weakReach = (fun (comp : string B_dData_dList.t_List) (edges : (((string, string) B_dData_dPair.t_Pair, int) B_dData_dPair.t_Pair, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List) (start : string) (frontier : string B_dData_dList.t_List) (visited : string B_dData_dList.t_List) -> ((((((v_weakReachFuel 100000) comp) edges) start) frontier) visited))

# 1432 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let rec v_hasWeakCycleGo = (fun (mc0 : string B_dData_dList.t_List) (mc1 : (((string, string) B_dData_dPair.t_Pair, int) B_dData_dPair.t_Pair, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc2 : string B_dData_dList.t_List) -> (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__641, dtb__642) -> (if (((((v_weakReach mc0) mc1) dtb__641) (((v_weakAdj mc0) mc1) dtb__641)) (B_dData_dList.C_List__x58__x58_ (dtb__641, B_dData_dList.C_List_Nil))) then true else (((v_hasWeakCycleGo mc0) mc1) dtb__642))
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 1429 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_hasWeakCycle = (fun (comp : string B_dData_dList.t_List) (edges : (((string, string) B_dData_dPair.t_Pair, int) B_dData_dPair.t_Pair, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (((v_hasWeakCycleGo comp) edges) comp))

# 1439 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_relEqual = 0

# 1218 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_relOfArg = (fun (mc0 : int) (mc1 : Frontend_dAst.t_Expr) (mc2 : (string, (int, (int, int B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc3 : string B_dData_dList.t_List) (mc4 : (string, int B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc5 : string) (mc6 : (string, int B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (mc7 : string B_dData_dList.t_List) -> (match mc1 with
  | Frontend_dAst.C_Expr_EApp (dtb__643, dtb__644, dtb__645) -> (match dtb__643 with
  | Frontend_dAst.C_Expr_EVar (dtb__646, dtb__647) -> (if ((B_dData_dList.v_memName dtb__646) mc3) then (match ((((v_findWrapField mc0) dtb__644) mc2) 0) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__648) -> (B_dData_dMaybe.C_Maybe_Just (dtb__648))
  | B_dData_dMaybe.C_Maybe_Nothing -> (if (((v_sameCtorApp mc0) dtb__644) mc2) then (B_dData_dMaybe.C_Maybe_Just (v_relEqual)) else B_dData_dMaybe.C_Maybe_Nothing)
  | _ -> failwith "DT: impossible branch"
) else (if ((v_projHas dtb__646) mc4) then (((v_projRel mc0) dtb__644) mc2) else ((((((v_arithRel mc0) mc1) mc2) mc5) mc6) mc7)))
  | _ -> ((((((v_arithRel mc0) mc1) mc2) mc5) mc6) mc7)
)
  | Frontend_dAst.C_Expr_EField (dtb__649, dtb__650, dtb__651) -> (let nd_uscrut11 = (((v_sizeOfExpr mc4) mc2) (Frontend_dAst.C_Expr_EField (dtb__649, dtb__650, dtb__651))) in (match nd_uscrut11 with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb__652) -> (match dtb__652 with
  | { B_dData_dPair.f_Pair_first = dtb__653; B_dData_dPair.f_Pair_second = dtb__654 } -> (match dtb__654 with
  | { B_dData_dPair.f_Pair_first = dtb__655; B_dData_dPair.f_Pair_second = dtb__656 } -> (if (dtb__653 = mc0) then (if (dtb__655 > 0) then (B_dData_dMaybe.C_Maybe_Just (1)) else (B_dData_dMaybe.C_Maybe_Just (0))) else B_dData_dMaybe.C_Maybe_Nothing)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))
  | Frontend_dAst.C_Expr_EVar (dtb__657, dtb__658) -> (match ((v_sizeOfVarStrict dtb__657) mc2) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__659) -> (let nd_uscrut12 = dtb__659 in (match nd_uscrut12 with
  | { B_dData_dPair.f_Pair_first = dtb__660; B_dData_dPair.f_Pair_second = dtb__661 } -> (match dtb__661 with
  | { B_dData_dPair.f_Pair_first = dtb__662; B_dData_dPair.f_Pair_second = dtb__663 } -> (if (dtb__660 = mc0) then (if (dtb__662 > 0) then (B_dData_dMaybe.C_Maybe_Just (1)) else (B_dData_dMaybe.C_Maybe_Just (0))) else B_dData_dMaybe.C_Maybe_Nothing)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
))

# 1240 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_argRel = (fun (p : int) (args : Frontend_dAst.t_Expr B_dData_dList.t_List) (sizes : (string, (int, (int, int B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctors : string B_dData_dList.t_List) (projs : (string, int B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (caller : string) (facts : (string, int B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (region : string B_dData_dList.t_List) -> (match ((v_nthExpr args) p) with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb__664) -> ((((((((v_relOfArg p) dtb__664) sizes) ctors) projs) caller) facts) region)
  | _ -> failwith "DT: impossible branch"
))

# 1442 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_relStrictSub = 1

# 1445 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_relStrictMinus = 4

# 1448 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_relUnknownSize = (-1)

# 1451 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_relMissingGuard = (-2)

# 1454 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_relNoRelation = (-3)

# 1457 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_relOtherPosition = (-4)

# 1269 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_hintArith = (fun (mc0 : int) (mc1 : Frontend_dAst.t_Expr B_dData_dList.t_List) (mc2 : (string, (int, (int, int B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc3 : int) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__665, dtb__666) -> (match dtb__665 with
  | Frontend_dAst.C_Expr_EVar (dtb__667, dtb__668) -> (match dtb__666 with
  | B_dData_dList.C_List__x58__x58_ (dtb__669, dtb__670) -> (match dtb__669 with
  | Frontend_dAst.C_Expr_EInt (dtb__671, dtb__672) -> (match dtb__670 with
  | B_dData_dList.C_List_Nil -> (if (dtb__671 <= 0) then (B_dData_dMaybe.C_Maybe_Just (v_relNoRelation)) else (match ((v_sizeOfVarStrict dtb__667) mc2) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__673) -> (let nd_uscrut17 = dtb__673 in (match nd_uscrut17 with
  | { B_dData_dPair.f_Pair_first = dtb__674; B_dData_dPair.f_Pair_second = dtb__675 } -> (match dtb__675 with
  | { B_dData_dPair.f_Pair_first = dtb__676; B_dData_dPair.f_Pair_second = dtb__677 } -> (if (dtb__674 = mc0) then (if (dtb__676 = 0) then (B_dData_dMaybe.C_Maybe_Just (mc3)) else (B_dData_dMaybe.C_Maybe_Just (v_relNoRelation))) else (B_dData_dMaybe.C_Maybe_Just (v_relOtherPosition)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))
  | B_dData_dMaybe.C_Maybe_Nothing -> (B_dData_dMaybe.C_Maybe_Just (v_relUnknownSize))
  | _ -> failwith "DT: impossible branch"
))
  | _ -> (B_dData_dMaybe.C_Maybe_Just (v_relNoRelation))
)
  | _ -> (B_dData_dMaybe.C_Maybe_Just (v_relNoRelation))
)
  | _ -> (B_dData_dMaybe.C_Maybe_Just (v_relNoRelation))
)
  | _ -> (B_dData_dMaybe.C_Maybe_Just (v_relNoRelation))
)
  | _ -> (B_dData_dMaybe.C_Maybe_Just (v_relNoRelation))
))

# 1460 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_relAscending = (-5)

# 1248 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_argRelHint = (fun (p : int) (args : Frontend_dAst.t_Expr B_dData_dList.t_List) (sizes : (string, (int, (int, int B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctors : string B_dData_dList.t_List) -> (match ((v_nthExpr args) p) with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb__678) -> (let nd_uscrut6 = dtb__678 in (match nd_uscrut6 with
  | Frontend_dAst.C_Expr_EApp (dtb__679, dtb__680, dtb__681) -> (match dtb__679 with
  | Frontend_dAst.C_Expr_EVar (dtb__682, dtb__683) -> (if (v_isSubOpName dtb__682) then ((((v_hintArith p) dtb__680) sizes) v_relMissingGuard) else (if (v_isAddOpName dtb__682) then ((((v_hintArith p) dtb__680) sizes) v_relAscending) else (B_dData_dMaybe.C_Maybe_Just (v_relNoRelation))))
  | _ -> (B_dData_dMaybe.C_Maybe_Just (v_relNoRelation))
)
  | Frontend_dAst.C_Expr_EVar (dtb__684, dtb__685) -> (if ((B_dData_dList.v_memName dtb__684) ctors) then (B_dData_dMaybe.C_Maybe_Just (v_relNoRelation)) else (match ((v_sizeOfVarStrict dtb__684) sizes) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__686) -> (let nd_uscrut11 = dtb__686 in (match nd_uscrut11 with
  | { B_dData_dPair.f_Pair_first = dtb__687; B_dData_dPair.f_Pair_second = dtb__688 } -> (match dtb__688 with
  | { B_dData_dPair.f_Pair_first = dtb__689; B_dData_dPair.f_Pair_second = dtb__690 } -> (if (dtb__687 = p) then (B_dData_dMaybe.C_Maybe_Just (v_relNoRelation)) else (B_dData_dMaybe.C_Maybe_Just (v_relOtherPosition)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))
  | B_dData_dMaybe.C_Maybe_Nothing -> (B_dData_dMaybe.C_Maybe_Just (v_relUnknownSize))
  | _ -> failwith "DT: impossible branch"
))
  | _ -> (B_dData_dMaybe.C_Maybe_Just (v_relNoRelation))
))
  | _ -> failwith "DT: impossible branch"
))

# 1464 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_relText = (fun (m : int) -> (if (m = v_relStrictSub) then "strict subterm" else (if (m = v_relStrictMinus) then "decreases by a constant, with the non-negativity guard proven" else (if (m = v_relMissingGuard) then "decreases by a constant, but the non-negativity guard is missing" else (if (m = v_relUnknownSize) then "no known size (not a subterm of a parameter)" else (if (m = v_relOtherPosition) then "decreases a different parameter" else (if (m = v_relEqual) then "unchanged" else (if (m = v_relAscending) then "increases instead of decreasing (ascending counters are not supported)" else "no size relation"))))))))

# 1483 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_isDescent = (fun (m : int) -> (m > 0))

# 1486 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let[@tail_mod_cons] rec v_filterModes = (fun (mc0 : int B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__691, dtb__692) -> (if (v_isDescent dtb__691) then (B_dData_dList.C_List__x58__x58_ (dtb__691, (v_filterModes dtb__692))) else (v_filterModes dtb__692))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 153 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_fwdCallee = (fun (p : t_Forwarder) -> (match p with
  | { f_Forwarder_fwdCallee = dtb__693; f_Forwarder_fwdCbParam = dtb__694; f_Forwarder_fwdArgParams = dtb__695 } -> dtb__693
  | _ -> failwith "DT: impossible branch"
))

# 154 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_fwdCbParam = (fun (p : t_Forwarder) -> (match p with
  | { f_Forwarder_fwdCallee = dtb__696; f_Forwarder_fwdCbParam = dtb__697; f_Forwarder_fwdArgParams = dtb__698 } -> dtb__697
  | _ -> failwith "DT: impossible branch"
))

# 155 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_fwdArgParams = (fun (p : t_Forwarder) -> (match p with
  | { f_Forwarder_fwdCallee = dtb__699; f_Forwarder_fwdCbParam = dtb__700; f_Forwarder_fwdArgParams = dtb__701 } -> dtb__701
  | _ -> failwith "DT: impossible branch"
))

# 1300 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_hofLambdaArity = (fun (p : t_HofSpec) -> (match p with
  | { f_HofSpec_hofLambdaArity = dtb__702; f_HofSpec_hofElemParam = dtb__703; f_HofSpec_hofListArg = dtb__704 } -> dtb__702
  | _ -> failwith "DT: impossible branch"
))

# 1301 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_hofElemParam = (fun (p : t_HofSpec) -> (match p with
  | { f_HofSpec_hofLambdaArity = dtb__705; f_HofSpec_hofElemParam = dtb__706; f_HofSpec_hofListArg = dtb__707 } -> dtb__706
  | _ -> failwith "DT: impossible branch"
))

# 1302 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_hofListArg = (fun (p : t_HofSpec) -> (match p with
  | { f_HofSpec_hofLambdaArity = dtb__708; f_HofSpec_hofElemParam = dtb__709; f_HofSpec_hofListArg = dtb__710 } -> dtb__710
  | _ -> failwith "DT: impossible branch"
))

# 1305 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_hofElemBinder = (fun (p : t_HofCall) -> (match p with
  | { f_HofCall_hofElemBinder = dtb__711; f_HofCall_hofListExpr = dtb__712; f_HofCall_hofSideArgs = dtb__713; f_HofCall_hofBody = dtb__714 } -> dtb__711
  | _ -> failwith "DT: impossible branch"
))

# 1306 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_hofListExpr = (fun (p : t_HofCall) -> (match p with
  | { f_HofCall_hofElemBinder = dtb__715; f_HofCall_hofListExpr = dtb__716; f_HofCall_hofSideArgs = dtb__717; f_HofCall_hofBody = dtb__718 } -> dtb__716
  | _ -> failwith "DT: impossible branch"
))

# 1307 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_hofSideArgs = (fun (p : t_HofCall) -> (match p with
  | { f_HofCall_hofElemBinder = dtb__719; f_HofCall_hofListExpr = dtb__720; f_HofCall_hofSideArgs = dtb__721; f_HofCall_hofBody = dtb__722 } -> dtb__721
  | _ -> failwith "DT: impossible branch"
))

# 1308 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_hofBody = (fun (p : t_HofCall) -> (match p with
  | { f_HofCall_hofElemBinder = dtb__723; f_HofCall_hofListExpr = dtb__724; f_HofCall_hofSideArgs = dtb__725; f_HofCall_hofBody = dtb__726 } -> dtb__726
  | _ -> failwith "DT: impossible branch"
))
