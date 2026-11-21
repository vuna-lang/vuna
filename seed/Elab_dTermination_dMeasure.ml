open Vuna_runtime
type t_Forwarder = { f_Forwarder_fwdCallee : string; f_Forwarder_fwdCbParam : int; f_Forwarder_fwdArgParams : int B_dData_dList.t_List }
and t_HofSpec = { f_HofSpec_hofLambdaArity : int; f_HofSpec_hofElemParam : int; f_HofSpec_hofListArg : int }
and t_HofCall = { f_HofCall_hofElemBinder : string; f_HofCall_hofListExpr : Frontend_dRast.t_Expr; f_HofCall_hofSideArgs : Frontend_dRast.t_Expr B_dData_dList.t_List; f_HofCall_hofBody : Frontend_dRast.t_Expr }

# 12 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_maxInt = (fun (a : int) (b : int) -> (if (a >= b) then a else b))

# 15 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_notEmpty = (fun mc0 -> (match mc0 with
  | B_dData_dList.C_List_Nil -> false
  | _ -> true
))

# 19 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let rec v_allEqTo = (fun (mc0 : int) (mc1 : int B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__0, dtb__1) -> (if (mc0 = dtb__0) then ((v_allEqTo mc0) dtb__1) else false)
  | B_dData_dList.C_List_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

# 23 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_allSame = (fun (mc0 : int B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__2, dtb__3) -> ((v_allEqTo dtb__2) dtb__3)
  | B_dData_dList.C_List_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

# 28 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_dedup = (fun (names : string B_dData_dList.t_List) -> (B_dData_dList.v_nubNames names))

# 31 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let rec v_joinComma = (fun (mc0 : string B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__4, dtb__5) -> (match dtb__5 with
  | B_dData_dList.C_List_Nil -> dtb__4
  | _ -> (String.concat "" [dtb__4; ", "; (v_joinComma dtb__5)])
)
  | B_dData_dList.C_List_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))

# 37 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let rec v_posHas = (fun (mc0 : string) (mc1 : int) (mc2 : (string, int) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__6, dtb__7) -> (match dtb__6 with
  | { B_dData_dPair.f_Pair_first = dtb__8; B_dData_dPair.f_Pair_second = dtb__9 } -> (if (mc0 = dtb__8) then (if (mc1 = dtb__9) then true else (((v_posHas mc0) mc1) dtb__7)) else (((v_posHas mc0) mc1) dtb__7))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 47 "Vuna/Compiler/Elab/Termination/Measure.vuna"
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

# 44 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_posTblOf = (fun (xs : (string, int) B_dData_dPair.t_Pair B_dData_dList.t_List) -> ((v_posTblOfGo xs) (((B_dContainer_dHashMap.v_fromList B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) B_dData_dList.C_List_Nil)))

# 60 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let rec v_memInt = (fun (mc0 : int) (mc1 : int B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__15, dtb__16) -> (if (mc0 = dtb__15) then true else ((v_memInt mc0) dtb__16))
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 54 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_posHasTbl = (fun (f : string) (i : int) (tbl : (string, int B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) -> (match ((((B_dContainer_dHashMap.v_lookup B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) f) tbl) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__17) -> ((v_memInt i) dtb__17)
  | B_dData_dMaybe.C_Maybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
))

# 64 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_posAdd = (fun (f : string) (i : int) (facts : (string, int) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (if (((v_posHas f) i) facts) then facts else (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = f; B_dData_dPair.f_Pair_second = i }, facts))))

# 67 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let rec v_posSubset = (fun (mc0 : (string, int) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc1 : (string, int) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__18, dtb__19) -> (match dtb__18 with
  | { B_dData_dPair.f_Pair_first = dtb__20; B_dData_dPair.f_Pair_second = dtb__21 } -> (if (((v_posHas dtb__20) dtb__21) mc1) then ((v_posSubset dtb__19) mc1) else false)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

# 71 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_posSetEq = (fun (a : (string, int) B_dData_dPair.t_Pair B_dData_dList.t_List) (b : (string, int) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (if ((B_dData_dList.v_length a) = (B_dData_dList.v_length b)) then ((v_posSubset a) b) else false))

# 74 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let rec v_posFilter = (fun (mc0 : (string, int) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc1 : (string, int) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__22, dtb__23) -> (match dtb__22 with
  | { B_dData_dPair.f_Pair_first = dtb__24; B_dData_dPair.f_Pair_second = dtb__25 } -> (if (((v_posHas dtb__24) dtb__25) mc1) then ((v_posFilter dtb__23) mc1) else (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__24; B_dData_dPair.f_Pair_second = dtb__25 }, ((v_posFilter dtb__23) mc1))))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 79 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let rec v_posUnion = (fun (mc0 : (string, int) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc1 : (string, int) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__26, dtb__27) -> (match dtb__26 with
  | { B_dData_dPair.f_Pair_first = dtb__28; B_dData_dPair.f_Pair_second = dtb__29 } -> ((v_posUnion dtb__27) (((v_posAdd dtb__28) dtb__29) mc1))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> mc1
  | _ -> failwith "DT: impossible branch"
))

# 85 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let rec v_posFilterTbl = (fun (mc0 : (string, int) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc1 : (string, int B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__30, dtb__31) -> (match dtb__30 with
  | { B_dData_dPair.f_Pair_first = dtb__32; B_dData_dPair.f_Pair_second = dtb__33 } -> (if (((v_posHasTbl dtb__32) dtb__33) mc1) then ((v_posFilterTbl dtb__31) mc1) else (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__32; B_dData_dPair.f_Pair_second = dtb__33 }, ((v_posFilterTbl dtb__31) mc1))))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 90 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let rec v_posSubsetTbl = (fun (mc0 : (string, int) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc1 : (string, int B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__34, dtb__35) -> (match dtb__34 with
  | { B_dData_dPair.f_Pair_first = dtb__36; B_dData_dPair.f_Pair_second = dtb__37 } -> (if (((v_posHasTbl dtb__36) dtb__37) mc1) then ((v_posSubsetTbl dtb__35) mc1) else false)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

# 94 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_posSetEqTbl = (fun (a : (string, int) B_dData_dPair.t_Pair B_dData_dList.t_List) (b : (string, int) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (if (if ((B_dData_dList.v_length a) = (B_dData_dList.v_length b)) then ((v_posSubsetTbl a) (v_posTblOf b)) else false) then ((v_posSubsetTbl b) (v_posTblOf a)) else false))

# 98 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_posUnionTbl = (fun (facts : (string, int) B_dData_dPair.t_Pair B_dData_dList.t_List) (fresh : (string, int) B_dData_dPair.t_Pair B_dData_dList.t_List) -> ((B_dData_dList.v_append fresh) ((v_posFilterTbl facts) (v_posTblOf fresh))))

# 101 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let rec v_funDeclsOf = (fun (mc0 : Frontend_dRast.t_Decl B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__38, dtb__39) -> (match dtb__38 with
  | Frontend_dRast.C_Decl_DFun (dtb__40, dtb__41, dtb__42, dtb__43) -> (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__40; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = dtb__41; B_dData_dPair.f_Pair_second = dtb__42 } }, (v_funDeclsOf dtb__39)))
  | Frontend_dRast.C_Decl_DInstance (dtb__44, dtb__45, dtb__46, dtb__47) -> ((B_dData_dList.v_append (v_funDeclsOf dtb__46)) (v_funDeclsOf dtb__39))
  | _ -> (v_funDeclsOf dtb__39)
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 111 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let rec v_lookupGroup = (fun (mc0 : string) (mc1 : (string, (Frontend_dRast.t_Pat B_dData_dList.t_List, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__48, dtb__49) -> (match dtb__48 with
  | { B_dData_dPair.f_Pair_first = dtb__50; B_dData_dPair.f_Pair_second = dtb__51 } -> (if (dtb__50 = mc0) then (B_dData_dMaybe.C_Maybe_Just (dtb__51)) else ((v_lookupGroup mc0) dtb__49))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 115 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let rec v_replaceGroup = (fun (mc0 : string) (mc1 : (Frontend_dRast.t_Pat B_dData_dList.t_List, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc2 : (string, (Frontend_dRast.t_Pat B_dData_dList.t_List, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__52, dtb__53) -> (match dtb__52 with
  | { B_dData_dPair.f_Pair_first = dtb__54; B_dData_dPair.f_Pair_second = dtb__55 } -> (if (dtb__54 = mc0) then (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__54; B_dData_dPair.f_Pair_second = mc1 }, dtb__53)) else (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__54; B_dData_dPair.f_Pair_second = dtb__55 }, (((v_replaceGroup mc0) mc1) dtb__53))))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 136 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let rec v_groupDefsGo = (fun (mc0 : (string, (Frontend_dRast.t_Pat B_dData_dList.t_List, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (mc1 : string B_dData_dList.t_List) (mc2 : (string, (Frontend_dRast.t_Pat B_dData_dList.t_List, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc2 with
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

# 120 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_groupDefs = (fun (decls : Frontend_dRast.t_Decl B_dData_dList.t_List) -> (let stepped = (((v_groupDefsGo (((B_dContainer_dHashMap.v_fromList B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) B_dData_dList.C_List_Nil)) B_dData_dList.C_List_Nil) (v_funDeclsOf decls)) in (let tbl = (B_dData_dPair.v_firstOf stepped) in (let order = (B_dData_dPair.v_secondOf stepped) in ((B_dData_dList.v_map (fun (n : string) -> { B_dData_dPair.f_Pair_first = n; B_dData_dPair.f_Pair_second = (match ((((B_dContainer_dHashMap.v_lookup B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) n) tbl) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__61) -> (B_dData_dList.v_reverse dtb__61)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
) })) (B_dData_dList.v_reverse order))))))

# 143 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_defNames = (fun (defs : (string, (Frontend_dRast.t_Pat B_dData_dList.t_List, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) -> ((B_dData_dList.v_map B_dData_dPair.v_firstOf) defs))

# 156 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let rec v_pvarParamsOf = (fun (mc0 : Frontend_dRast.t_Pat B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__62, dtb__63) -> (match dtb__62 with
  | Frontend_dRast.C_Pat_PVar (dtb__64, dtb__65) -> (B_dData_dList.C_List__x58__x58_ (dtb__64, (v_pvarParamsOf dtb__63)))
  | _ -> B_dData_dList.C_List_Nil
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 163 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let rec v_paramPositionOf = (fun (mc0 : string) (mc1 : string B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__66, dtb__67) -> (if (mc0 = dtb__66) then (B_dData_dMaybe.C_Maybe_Just (0)) else (match ((v_paramPositionOf mc0) dtb__67) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__68) -> (B_dData_dMaybe.C_Maybe_Just ((dtb__68 + 1)))
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 173 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let rec v_argParamIndices = (fun (mc0 : string B_dData_dList.t_List) (mc1 : Frontend_dRast.t_Expr B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__69, dtb__70) -> (match dtb__69 with
  | Frontend_dRast.C_Expr_EVar (dtb__71, dtb__72) -> (match ((v_paramPositionOf (Frontend_dRast_dName.v_rnameKey dtb__71)) mc0) with
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

# 186 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_forwarderOfClause = (fun (mc0 : string) (mc1 : (Frontend_dRast.t_Pat B_dData_dList.t_List, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair) -> (match mc1 with
  | { B_dData_dPair.f_Pair_first = dtb__75; B_dData_dPair.f_Pair_second = dtb__76 } -> (let params = (v_pvarParamsOf dtb__75) in (if ((B_dData_dList.v_length params) = (B_dData_dList.v_length dtb__75)) then (let nd_uscrut7 = dtb__76 in (match nd_uscrut7 with
  | Frontend_dRast.C_Expr_EApp (dtb__77, dtb__78, dtb__79) -> (match dtb__77 with
  | Frontend_dRast.C_Expr_EVar (dtb__80, dtb__81) -> (match ((v_paramPositionOf (Frontend_dRast_dName.v_rnameKey dtb__80)) params) with
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

# 203 "Vuna/Compiler/Elab/Termination/Measure.vuna"
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

# 208 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_sameForwarder = (fun (a : t_Forwarder) (b : t_Forwarder) -> (if ((a).f_Forwarder_fwdCbParam = (b).f_Forwarder_fwdCbParam) then ((v_sameIntLists (a).f_Forwarder_fwdArgParams) (b).f_Forwarder_fwdArgParams) else false))

# 211 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let rec v_matchForwarders = (fun (mc0 : t_Forwarder) (mc1 : (Frontend_dRast.t_Pat B_dData_dList.t_List, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__88, dtb__89) -> (match ((v_forwarderOfClause (mc0).f_Forwarder_fwdCallee) dtb__88) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__90) -> (if ((v_sameForwarder mc0) dtb__90) then ((v_matchForwarders mc0) dtb__89) else false)
  | B_dData_dMaybe.C_Maybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

# 218 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_forwarderOfGroup = (fun (mc0 : (string, (Frontend_dRast.t_Pat B_dData_dList.t_List, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dData_dPair.t_Pair) -> (match mc0 with
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

# 225 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let rec v_forwardersOfDefs = (fun (mc0 : (string, (Frontend_dRast.t_Pat B_dData_dList.t_List, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__96, dtb__97) -> (match (v_forwarderOfGroup dtb__96) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__98) -> (B_dData_dList.C_List__x58__x58_ (dtb__98, (v_forwardersOfDefs dtb__97)))
  | B_dData_dMaybe.C_Maybe_Nothing -> (v_forwardersOfDefs dtb__97)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 232 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_forwardersOf = (fun (decls : Frontend_dRast.t_Decl B_dData_dList.t_List) -> (v_forwardersOfDefs (v_groupDefs decls)))

# 235 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let rec v_lookupForwarder = (fun (mc0 : string) (mc1 : t_Forwarder B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__99, dtb__100) -> (if ((dtb__99).f_Forwarder_fwdCallee = mc0) then (B_dData_dMaybe.C_Maybe_Just (dtb__99)) else ((v_lookupForwarder mc0) dtb__100))
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 332 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let rec v_clausesOfDef = (fun (mc0 : string) (mc1 : (string, (Frontend_dRast.t_Pat B_dData_dList.t_List, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__101, dtb__102) -> (match dtb__101 with
  | { B_dData_dPair.f_Pair_first = dtb__103; B_dData_dPair.f_Pair_second = dtb__104 } -> (if (dtb__103 = mc0) then dtb__104 else ((v_clausesOfDef mc0) dtb__102))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 337 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_clausesOfDefTbl = (fun (name : string) (tbl : (string, (Frontend_dRast.t_Pat B_dData_dList.t_List, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) -> (match ((((B_dContainer_dHashMap.v_lookup B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) name) tbl) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__105) -> dtb__105
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 343 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let rec v_defArity = (fun (mc0 : (Frontend_dRast.t_Pat B_dData_dList.t_List, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__106, dtb__107) -> ((v_maxInt (B_dData_dList.v_length (B_dData_dPair.v_firstOf dtb__106))) (v_defArity dtb__107))
  | B_dData_dList.C_List_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))

# 347 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let rec v_maxArityOf = (fun (mc0 : string B_dData_dList.t_List) (mc1 : (string, (Frontend_dRast.t_Pat B_dData_dList.t_List, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__108, dtb__109) -> ((v_maxInt (v_defArity ((v_clausesOfDefTbl dtb__108) mc1))) ((v_maxArityOf dtb__109) mc1))
  | B_dData_dList.C_List_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))

# 361 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_ctorNameOf = (fun (mc0 : Frontend_dRast.t_Ctor) -> (match mc0 with
  | { Frontend_dRast.f_Ctor_ctorName = dtb__110; Frontend_dRast.f_Ctor_ctorType = dtb__111; Frontend_dRast.f_Ctor_ctorArity = dtb__112; Frontend_dRast.f_Ctor_ctorSpan = dtb__113 } -> dtb__110
  | _ -> failwith "DT: impossible branch"
))

# 352 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let rec v_ctorNamesOf = (fun (mc0 : Frontend_dRast.t_Decl B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__114, dtb__115) -> (match dtb__114 with
  | Frontend_dRast.C_Decl_DData (dtb__116, dtb__117, dtb__118, dtb__119, dtb__120, dtb__121, dtb__122, dtb__123, dtb__124) -> ((B_dData_dList.v_append ((B_dData_dList.v_map v_ctorNameOf) dtb__119)) (v_ctorNamesOf dtb__115))
  | Frontend_dRast.C_Decl_DRecord (dtb__125, dtb__126, dtb__127, dtb__128, dtb__129, dtb__130, dtb__131, dtb__132) -> (B_dData_dList.C_List__x58__x58_ (dtb__125, (v_ctorNamesOf dtb__115)))
  | _ -> (v_ctorNamesOf dtb__115)
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 364 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let rec v_patSizeStrict = (fun (mc0 : Frontend_dRast.t_Pat) (mc1 : int) (mc2 : int B_dData_dList.t_List) (mc3 : (string, (int, (int, int B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc0 with
  | Frontend_dRast.C_Pat_PRecord (dtb__133, dtb__134, dtb__135) -> (((((v_fieldsSizeStrict dtb__134) mc1) mc2) 0) mc3)
  | Frontend_dRast.C_Pat_PCon (dtb__136, dtb__137, dtb__138) -> (((((v_patsSizeStrict dtb__137) mc1) mc2) 0) mc3)
  | Frontend_dRast.C_Pat_PWild (dtb__139) -> mc3
  | Frontend_dRast.C_Pat_PVar (dtb__140, dtb__141) -> (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__140; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = mc1; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = (B_dData_dList.v_length mc2); B_dData_dPair.f_Pair_second = mc2 } } }, mc3))
  | Frontend_dRast.C_Pat_PAs (dtb__142, dtb__143, dtb__144) -> ((((v_patSizeStrict dtb__143) mc1) mc2) (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__142; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = mc1; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = (B_dData_dList.v_length mc2); B_dData_dPair.f_Pair_second = mc2 } } }, mc3)))
  | _ -> mc3
))
# 374 "Vuna/Compiler/Elab/Termination/Measure.vuna"
and v_patsSizeStrict = (fun (mc0 : Frontend_dRast.t_Pat B_dData_dList.t_List) (mc1 : int) (mc2 : int B_dData_dList.t_List) (mc3 : int) (mc4 : (string, (int, (int, int B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__145, dtb__146) -> (((((v_patsSizeStrict dtb__146) mc1) mc2) (mc3 + 1)) ((((v_patSizeStrict dtb__145) mc1) ((B_dData_dList.v_append mc2) (B_dData_dList.C_List__x58__x58_ (mc3, B_dData_dList.C_List_Nil)))) mc4))
  | B_dData_dList.C_List_Nil -> mc4
  | _ -> failwith "DT: impossible branch"
))
# 379 "Vuna/Compiler/Elab/Termination/Measure.vuna"
and v_fieldsSizeStrict = (fun (mc0 : (string, Frontend_dRast.t_Pat) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc1 : int) (mc2 : int B_dData_dList.t_List) (mc3 : int) (mc4 : (string, (int, (int, int B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__147, dtb__148) -> (match dtb__147 with
  | { B_dData_dPair.f_Pair_first = dtb__149; B_dData_dPair.f_Pair_second = dtb__150 } -> (((((v_fieldsSizeStrict dtb__148) mc1) mc2) (mc3 + 1)) ((((v_patSizeStrict dtb__150) mc1) ((B_dData_dList.v_append mc2) (B_dData_dList.C_List__x58__x58_ (mc3, B_dData_dList.C_List_Nil)))) mc4))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> mc4
  | _ -> failwith "DT: impossible branch"
))

# 387 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let rec v_strSizeEntriesGo = (fun (mc0 : Frontend_dRast.t_Pat B_dData_dList.t_List) (mc1 : int) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__151, dtb__152) -> ((B_dData_dList.v_append ((((v_patSizeStrict dtb__151) mc1) B_dData_dList.C_List_Nil) B_dData_dList.C_List_Nil)) ((v_strSizeEntriesGo dtb__152) (mc1 + 1)))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 384 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_strSizeEntries = (fun (pats : Frontend_dRast.t_Pat B_dData_dList.t_List) -> ((v_strSizeEntriesGo pats) 0))

# 426 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let rec v_sizeOfVarStrict = (fun (mc0 : string) (mc1 : (string, (int, (int, int B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__153, dtb__154) -> (match dtb__153 with
  | { B_dData_dPair.f_Pair_first = dtb__155; B_dData_dPair.f_Pair_second = dtb__156 } -> (if (dtb__155 = mc0) then (B_dData_dMaybe.C_Maybe_Just (dtb__156)) else ((v_sizeOfVarStrict mc0) dtb__154))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 452 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_cmpOpOf = (fun (mc0 : string) -> (if (mc0 = "bi_le_int") then "le" else (if (mc0 = "bi_ge_int") then "ge" else (if (mc0 = "bi_lt_int") then "lt" else (if (mc0 = "bi_gt_int") then "gt" else mc0)))))

# 460 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_opBaseName = (fun (name : string) -> (B_dData_dPair.v_secondOf (Base_dSource.v_splitLastDot (Base_dSource.v_splitOnDot name))))

# 469 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let rec v_lastTwoGo = (fun (mc0 : Frontend_dRast.t_Expr) (mc1 : Frontend_dRast.t_Expr) (mc2 : Frontend_dRast.t_Expr B_dData_dList.t_List) -> (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__157, dtb__158) -> (((v_lastTwoGo mc1) dtb__157) dtb__158)
  | B_dData_dList.C_List_Nil -> { B_dData_dPair.f_Pair_first = mc0; B_dData_dPair.f_Pair_second = mc1 }
  | _ -> failwith "DT: impossible branch"
))

# 465 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_lastTwo = (fun (mc0 : Frontend_dRast.t_Expr B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__159, dtb__160) -> (match dtb__160 with
  | B_dData_dList.C_List__x58__x58_ (dtb__161, dtb__162) -> (B_dData_dMaybe.C_Maybe_Just ((((v_lastTwoGo dtb__159) dtb__161) dtb__162)))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
))

# 507 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_isNatCoerceName = (fun (name : string) -> (let b = (v_opBaseName name) in (if (if (b = "natToInt") then true else (b = "natFromInt")) then true else (b = "toInt"))))

# 500 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let rec v_varOfExpr = (fun (mc0 : Frontend_dRast.t_Expr) -> (match mc0 with
  | Frontend_dRast.C_Expr_EApp (dtb__163, dtb__164, dtb__165) -> (match dtb__163 with
  | Frontend_dRast.C_Expr_EVar (dtb__166, dtb__167) -> (match dtb__164 with
  | B_dData_dList.C_List__x58__x58_ (dtb__168, dtb__169) -> (match dtb__169 with
  | B_dData_dList.C_List_Nil -> (if (v_isNatCoerceName (Frontend_dRast_dName.v_rnameKey dtb__166)) then (v_varOfExpr dtb__168) else B_dData_dMaybe.C_Maybe_Nothing)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | Frontend_dRast.C_Expr_EVar (dtb__170, dtb__171) -> (B_dData_dMaybe.C_Maybe_Just ((Frontend_dRast_dName.v_rnameKey dtb__170)))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
))

# 473 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_guardLE = (fun (args : Frontend_dRast.t_Expr B_dData_dList.t_List) -> (let nd_uscrut1 = (v_lastTwo args) in (match nd_uscrut1 with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb__172) -> (match dtb__172 with
  | { B_dData_dPair.f_Pair_first = dtb__173; B_dData_dPair.f_Pair_second = dtb__174 } -> (match dtb__174 with
  | Frontend_dRast.C_Expr_EInt (dtb__175, dtb__176) -> (if (dtb__175 = 0) then (v_varOfExpr dtb__173) else B_dData_dMaybe.C_Maybe_Nothing)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))

# 482 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_guardGE = (fun (args : Frontend_dRast.t_Expr B_dData_dList.t_List) -> (let nd_uscrut1 = (v_lastTwo args) in (match nd_uscrut1 with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb__177) -> (match dtb__177 with
  | { B_dData_dPair.f_Pair_first = dtb__178; B_dData_dPair.f_Pair_second = dtb__179 } -> (match dtb__178 with
  | Frontend_dRast.C_Expr_EInt (dtb__180, dtb__181) -> (if (dtb__180 = 0) then (v_varOfExpr dtb__179) else B_dData_dMaybe.C_Maybe_Nothing)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))

# 491 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_guardLT = (fun (args : Frontend_dRast.t_Expr B_dData_dList.t_List) -> (let nd_uscrut1 = (v_lastTwo args) in (match nd_uscrut1 with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb__182) -> (match dtb__182 with
  | { B_dData_dPair.f_Pair_first = dtb__183; B_dData_dPair.f_Pair_second = dtb__184 } -> (match dtb__184 with
  | Frontend_dRast.C_Expr_EInt (dtb__185, dtb__186) -> (if (dtb__185 = 1) then (v_varOfExpr dtb__183) else B_dData_dMaybe.C_Maybe_Nothing)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))

# 434 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_guardPosVar = (fun (e : Frontend_dRast.t_Expr) -> (let nd_uscrut1 = e in (match nd_uscrut1 with
  | Frontend_dRast.C_Expr_EApp (dtb__187, dtb__188, dtb__189) -> (match dtb__187 with
  | Frontend_dRast.C_Expr_EVar (dtb__190, dtb__191) -> (if ((v_cmpOpOf (v_opBaseName (Frontend_dRast_dName.v_rnameKey dtb__190))) = "le") then (v_guardLE dtb__188) else (if ((v_cmpOpOf (v_opBaseName (Frontend_dRast_dName.v_rnameKey dtb__190))) = "ge") then (v_guardGE dtb__188) else (if ((v_cmpOpOf (v_opBaseName (Frontend_dRast_dName.v_rnameKey dtb__190))) = "lt") then (v_guardLT dtb__188) else (if ((v_cmpOpOf (v_opBaseName (Frontend_dRast_dName.v_rnameKey dtb__190))) = "<=") then (v_guardLE dtb__188) else (if ((v_cmpOpOf (v_opBaseName (Frontend_dRast_dName.v_rnameKey dtb__190))) = ">=") then (v_guardGE dtb__188) else (if ((v_cmpOpOf (v_opBaseName (Frontend_dRast_dName.v_rnameKey dtb__190))) = "<") then (v_guardLT dtb__188) else B_dData_dMaybe.C_Maybe_Nothing))))))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)))

# 515 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let rec v_localClauseBinds = (fun (mc0 : (Frontend_dRast.t_Pat B_dData_dList.t_List, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__192, dtb__193) -> (match dtb__192 with
  | { B_dData_dPair.f_Pair_first = dtb__194; B_dData_dPair.f_Pair_second = dtb__195 } -> (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = (Frontend_dRast.C_Pat_PWild ((Frontend_dRast.v_exprSpan dtb__195))); B_dData_dPair.f_Pair_second = dtb__195 }, (v_localClauseBinds dtb__193)))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 522 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_guardUnion = (fun (a : string B_dData_dList.t_List) (b : string B_dData_dList.t_List) -> (v_dedup ((B_dData_dList.v_append a) b)))

# 525 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let rec v_guardInter = (fun (mc0 : string B_dData_dList.t_List) (mc1 : string B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__196, dtb__197) -> (if ((B_dData_dList.v_memName dtb__196) mc1) then (B_dData_dList.C_List__x58__x58_ (dtb__196, ((v_guardInter dtb__197) mc1))) else ((v_guardInter dtb__197) mc1))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 530 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_guardThenPosAtom = (fun (op : string) (args : Frontend_dRast.t_Expr B_dData_dList.t_List) -> (let nd_uscrut2 = (v_lastTwo args) in (match nd_uscrut2 with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb__198) -> (match dtb__198 with
  | { B_dData_dPair.f_Pair_first = dtb__199; B_dData_dPair.f_Pair_second = dtb__200 } -> (match dtb__200 with
  | Frontend_dRast.C_Expr_EInt (dtb__201, dtb__202) -> (if (if (op = "gt") then true else (op = ">")) then (if (dtb__201 >= 0) then (v_varOfExpr dtb__199) else B_dData_dMaybe.C_Maybe_Nothing) else (if (if (op = "ge") then true else (op = ">=")) then (if (dtb__201 >= 1) then (v_varOfExpr dtb__199) else B_dData_dMaybe.C_Maybe_Nothing) else B_dData_dMaybe.C_Maybe_Nothing))
  | _ -> (match dtb__199 with
  | Frontend_dRast.C_Expr_EInt (dtb__203, dtb__204) -> (if (if (op = "lt") then true else (op = "<")) then (if (dtb__203 >= 0) then (v_varOfExpr dtb__200) else B_dData_dMaybe.C_Maybe_Nothing) else (if (if (op = "le") then true else (op = "<=")) then (if (dtb__203 >= 1) then (v_varOfExpr dtb__200) else B_dData_dMaybe.C_Maybe_Nothing) else B_dData_dMaybe.C_Maybe_Nothing))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))

# 556 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_guardElsePosAtom = (fun (op : string) (args : Frontend_dRast.t_Expr B_dData_dList.t_List) -> (let nd_uscrut2 = (v_lastTwo args) in (match nd_uscrut2 with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb__205) -> (match dtb__205 with
  | { B_dData_dPair.f_Pair_first = dtb__206; B_dData_dPair.f_Pair_second = dtb__207 } -> (match dtb__207 with
  | Frontend_dRast.C_Expr_EInt (dtb__208, dtb__209) -> (if (if (op = "le") then true else (op = "<=")) then (if (dtb__208 >= 0) then (v_varOfExpr dtb__206) else B_dData_dMaybe.C_Maybe_Nothing) else (if (if (op = "lt") then true else (op = "<")) then (if (dtb__208 >= 1) then (v_varOfExpr dtb__206) else B_dData_dMaybe.C_Maybe_Nothing) else B_dData_dMaybe.C_Maybe_Nothing))
  | _ -> (match dtb__206 with
  | Frontend_dRast.C_Expr_EInt (dtb__210, dtb__211) -> (if (if (op = "ge") then true else (op = ">=")) then (if (dtb__210 >= 0) then (v_varOfExpr dtb__207) else B_dData_dMaybe.C_Maybe_Nothing) else (if (if (op = "gt") then true else (op = ">")) then (if (dtb__210 >= 1) then (v_varOfExpr dtb__207) else B_dData_dMaybe.C_Maybe_Nothing) else B_dData_dMaybe.C_Maybe_Nothing))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))

# 626 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_isTrueLit = (fun (mc0 : Frontend_dRast.t_Expr) -> (match mc0 with
  | Frontend_dRast.C_Expr_EInt (dtb__212, dtb__213) -> (dtb__212 <> 0)
  | _ -> false
))

# 606 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let rec v_guardElsePosVars = (fun (mc0 : Frontend_dRast.t_Expr) -> (match mc0 with
  | Frontend_dRast.C_Expr_EApp (dtb__214, dtb__215, dtb__216) -> (match dtb__214 with
  | Frontend_dRast.C_Expr_EVar (dtb__217, dtb__218) -> (let opn = (v_cmpOpOf (v_opBaseName (Frontend_dRast_dName.v_rnameKey dtb__217))) in (if (opn = "&&") then (let nd_uscrut7 = dtb__215 in (match nd_uscrut7 with
  | B_dData_dList.C_List__x58__x58_ (dtb__219, dtb__220) -> (match dtb__220 with
  | B_dData_dList.C_List__x58__x58_ (dtb__221, dtb__222) -> (match dtb__222 with
  | B_dData_dList.C_List_Nil -> ((v_guardInter (v_guardElsePosVars dtb__219)) (v_guardElsePosVars dtb__221))
  | _ -> B_dData_dList.C_List_Nil
)
  | _ -> B_dData_dList.C_List_Nil
)
  | _ -> B_dData_dList.C_List_Nil
)) else (if (opn = "||") then (let nd_uscrut7 = dtb__215 in (match nd_uscrut7 with
  | B_dData_dList.C_List__x58__x58_ (dtb__223, dtb__224) -> (match dtb__224 with
  | B_dData_dList.C_List__x58__x58_ (dtb__225, dtb__226) -> (match dtb__226 with
  | B_dData_dList.C_List_Nil -> ((v_guardUnion (v_guardElsePosVars dtb__223)) (v_guardElsePosVars dtb__225))
  | _ -> B_dData_dList.C_List_Nil
)
  | _ -> B_dData_dList.C_List_Nil
)
  | _ -> B_dData_dList.C_List_Nil
)) else (match ((v_guardElsePosAtom opn) dtb__215) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__227) -> (B_dData_dList.C_List__x58__x58_ (dtb__227, B_dData_dList.C_List_Nil))
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))))
  | _ -> B_dData_dList.C_List_Nil
)
  | Frontend_dRast.C_Expr_EIf (dtb__228, dtb__229, dtb__230, dtb__231) -> (if (v_isTrueLit dtb__229) then ((v_guardUnion (v_guardElsePosVars dtb__228)) (v_guardElsePosVars dtb__230)) else B_dData_dList.C_List_Nil)
  | _ -> B_dData_dList.C_List_Nil
))

# 630 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_isFalseLit = (fun (mc0 : Frontend_dRast.t_Expr) -> (match mc0 with
  | Frontend_dRast.C_Expr_EInt (dtb__232, dtb__233) -> (dtb__232 = 0)
  | _ -> false
))

# 583 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let rec v_guardThenPosVars = (fun (mc0 : Frontend_dRast.t_Expr) -> (match mc0 with
  | Frontend_dRast.C_Expr_EApp (dtb__234, dtb__235, dtb__236) -> (match dtb__234 with
  | Frontend_dRast.C_Expr_EVar (dtb__237, dtb__238) -> (let opn = (v_cmpOpOf (v_opBaseName (Frontend_dRast_dName.v_rnameKey dtb__237))) in (if (opn = "&&") then (let nd_uscrut7 = dtb__235 in (match nd_uscrut7 with
  | B_dData_dList.C_List__x58__x58_ (dtb__239, dtb__240) -> (match dtb__240 with
  | B_dData_dList.C_List__x58__x58_ (dtb__241, dtb__242) -> (match dtb__242 with
  | B_dData_dList.C_List_Nil -> ((v_guardUnion (v_guardThenPosVars dtb__239)) (v_guardThenPosVars dtb__241))
  | _ -> B_dData_dList.C_List_Nil
)
  | _ -> B_dData_dList.C_List_Nil
)
  | _ -> B_dData_dList.C_List_Nil
)) else (if (opn = "||") then (let nd_uscrut7 = dtb__235 in (match nd_uscrut7 with
  | B_dData_dList.C_List__x58__x58_ (dtb__243, dtb__244) -> (match dtb__244 with
  | B_dData_dList.C_List__x58__x58_ (dtb__245, dtb__246) -> (match dtb__246 with
  | B_dData_dList.C_List_Nil -> ((v_guardInter (v_guardThenPosVars dtb__243)) (v_guardThenPosVars dtb__245))
  | _ -> B_dData_dList.C_List_Nil
)
  | _ -> B_dData_dList.C_List_Nil
)
  | _ -> B_dData_dList.C_List_Nil
)) else (match ((v_guardThenPosAtom opn) dtb__235) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__247) -> (B_dData_dList.C_List__x58__x58_ (dtb__247, B_dData_dList.C_List_Nil))
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))))
  | _ -> B_dData_dList.C_List_Nil
)
  | Frontend_dRast.C_Expr_EIf (dtb__248, dtb__249, dtb__250, dtb__251) -> (if (v_isFalseLit dtb__250) then ((v_guardUnion (v_guardThenPosVars dtb__248)) (v_guardThenPosVars dtb__249)) else B_dData_dList.C_List_Nil)
  | _ -> B_dData_dList.C_List_Nil
))

# 657 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_posMarkPos = (fun (f : string) (i : int) (st : ((string, int) B_dData_dPair.t_Pair B_dData_dList.t_List, (string, int) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dData_dPair.t_Pair) -> { B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = f; B_dData_dPair.f_Pair_second = i }, (B_dData_dPair.v_firstOf st))); B_dData_dPair.f_Pair_second = (B_dData_dPair.v_secondOf st) })

# 660 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_posMarkNeg = (fun (f : string) (i : int) (st : ((string, int) B_dData_dPair.t_Pair B_dData_dList.t_List, (string, int) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dData_dPair.t_Pair) -> { B_dData_dPair.f_Pair_first = (B_dData_dPair.v_firstOf st); B_dData_dPair.f_Pair_second = (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = f; B_dData_dPair.f_Pair_second = i }, (B_dData_dPair.v_secondOf st))) })

# 673 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let rec v_dedupInts = (fun (mc0 : int B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__252, dtb__253) -> (if ((v_memInt dtb__252) dtb__253) then (v_dedupInts dtb__253) else (B_dData_dList.C_List__x58__x58_ (dtb__252, (v_dedupInts dtb__253))))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 670 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_posEntryPairs = (fun (mc0 : (string, int B_dData_dList.t_List) B_dData_dPair.t_Pair) -> (match mc0 with
  | { B_dData_dPair.f_Pair_first = dtb__254; B_dData_dPair.f_Pair_second = dtb__255 } -> ((B_dData_dList.v_map (fun (i : int) -> { B_dData_dPair.f_Pair_first = dtb__254; B_dData_dPair.f_Pair_second = i })) (v_dedupInts dtb__255))
  | _ -> failwith "DT: impossible branch"
))

# 667 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_posTblPairs = (fun (tbl : (string, int B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) -> ((B_dData_dList.v_concatMap v_posEntryPairs) (B_dContainer_dHashMap.v_toList tbl)))

# 664 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_posNormalize = (fun (xs : (string, int) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (v_posTblPairs (v_posTblOf xs)))

# 928 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let rec v_pathInPats = (fun (mc0 : string) (mc1 : Frontend_dRast.t_Pat B_dData_dList.t_List) (mc2 : int B_dData_dList.t_List) (mc3 : int) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__256, dtb__257) -> (match (((v_pathInPat mc0) dtb__256) ((B_dData_dList.v_append mc2) (B_dData_dList.C_List__x58__x58_ (mc3, B_dData_dList.C_List_Nil)))) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__258) -> (B_dData_dMaybe.C_Maybe_Just (dtb__258))
  | B_dData_dMaybe.C_Maybe_Nothing -> ((((v_pathInPats mc0) dtb__257) mc2) (mc3 + 1))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))
# 935 "Vuna/Compiler/Elab/Termination/Measure.vuna"
and v_pathInFields = (fun (mc0 : string) (mc1 : (string, Frontend_dRast.t_Pat) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc2 : int B_dData_dList.t_List) (mc3 : int) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__259, dtb__260) -> (match dtb__259 with
  | { B_dData_dPair.f_Pair_first = dtb__261; B_dData_dPair.f_Pair_second = dtb__262 } -> (match (((v_pathInPat mc0) dtb__262) ((B_dData_dList.v_append mc2) (B_dData_dList.C_List__x58__x58_ (mc3, B_dData_dList.C_List_Nil)))) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__263) -> (B_dData_dMaybe.C_Maybe_Just (dtb__263))
  | B_dData_dMaybe.C_Maybe_Nothing -> ((((v_pathInFields mc0) dtb__260) mc2) (mc3 + 1))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))
# 942 "Vuna/Compiler/Elab/Termination/Measure.vuna"
and v_pathInPat = (fun (mc0 : string) (mc1 : Frontend_dRast.t_Pat) (mc2 : int B_dData_dList.t_List) -> (match mc1 with
  | Frontend_dRast.C_Pat_PRecord (dtb__264, dtb__265, dtb__266) -> ((((v_pathInFields mc0) dtb__265) mc2) 0)
  | Frontend_dRast.C_Pat_PCon (dtb__267, dtb__268, dtb__269) -> ((((v_pathInPats mc0) dtb__268) mc2) 0)
  | Frontend_dRast.C_Pat_PWild (dtb__270) -> B_dData_dMaybe.C_Maybe_Nothing
  | Frontend_dRast.C_Pat_PVar (dtb__271, dtb__272) -> (if (dtb__271 = mc0) then (B_dData_dMaybe.C_Maybe_Just (mc2)) else B_dData_dMaybe.C_Maybe_Nothing)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
))

# 949 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_projectionOfDef = (fun (d : (string, (Frontend_dRast.t_Pat B_dData_dList.t_List, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dData_dPair.t_Pair) -> (let nd_uscrut1 = (B_dData_dPair.v_secondOf d) in (match nd_uscrut1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__273, dtb__274) -> (match dtb__274 with
  | B_dData_dList.C_List_Nil -> (let nd_uscrut6 = (B_dData_dPair.v_firstOf dtb__273) in (match nd_uscrut6 with
  | B_dData_dList.C_List__x58__x58_ (dtb__275, dtb__276) -> (match dtb__276 with
  | B_dData_dList.C_List_Nil -> (match (B_dData_dPair.v_secondOf dtb__273) with
  | Frontend_dRast.C_Expr_EVar (dtb__277, dtb__278) -> (match (((v_pathInPat (Frontend_dRast_dName.v_rnameKey dtb__277)) dtb__275) B_dData_dList.C_List_Nil) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__279) -> (if (v_notEmpty dtb__279) then (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (B_dData_dPair.v_firstOf d); B_dData_dPair.f_Pair_second = dtb__279 })) else B_dData_dMaybe.C_Maybe_Nothing)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)
  | Frontend_dRast.C_Expr_ECase (dtb__280, dtb__281, dtb__282) -> (let nd_uscrut14 = { B_dData_dPair.f_Pair_first = dtb__275; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = dtb__280; B_dData_dPair.f_Pair_second = dtb__281 } } in (match nd_uscrut14 with
  | { B_dData_dPair.f_Pair_first = dtb__283; B_dData_dPair.f_Pair_second = dtb__284 } -> (match dtb__283 with
  | Frontend_dRast.C_Pat_PVar (dtb__285, dtb__286) -> (match dtb__284 with
  | { B_dData_dPair.f_Pair_first = dtb__287; B_dData_dPair.f_Pair_second = dtb__288 } -> (match dtb__287 with
  | Frontend_dRast.C_Expr_EVar (dtb__289, dtb__290) -> (match dtb__288 with
  | B_dData_dList.C_List__x58__x58_ (dtb__291, dtb__292) -> (match dtb__291 with
  | { B_dData_dPair.f_Pair_first = dtb__293; B_dData_dPair.f_Pair_second = dtb__294 } -> (match dtb__294 with
  | Frontend_dRast.C_Expr_EVar (dtb__295, dtb__296) -> (match dtb__292 with
  | B_dData_dList.C_List_Nil -> (if (dtb__285 = (Frontend_dRast_dName.v_rnameKey dtb__289)) then (match (((v_pathInPat (Frontend_dRast_dName.v_rnameKey dtb__295)) dtb__293) B_dData_dList.C_List_Nil) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__297) -> (if (v_notEmpty dtb__297) then (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (B_dData_dPair.v_firstOf d); B_dData_dPair.f_Pair_second = dtb__297 })) else B_dData_dMaybe.C_Maybe_Nothing)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
) else B_dData_dMaybe.C_Maybe_Nothing)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> failwith "DT: impossible branch"
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

# 977 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let rec v_projectionsOf = (fun (mc0 : (string, (Frontend_dRast.t_Pat B_dData_dList.t_List, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__298, dtb__299) -> (match (v_projectionOfDef dtb__298) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__300) -> (B_dData_dList.C_List__x58__x58_ (dtb__300, (v_projectionsOf dtb__299)))
  | B_dData_dMaybe.C_Maybe_Nothing -> (v_projectionsOf dtb__299)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 989 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_fieldProjPrefix = "$field."

# 992 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_fieldEntryName = (fun (p : (string, int) B_dData_dPair.t_Pair) -> (B_dData_dPair.v_firstOf p))

# 995 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_fieldEntryIndex = (fun (p : (string, int) B_dData_dPair.t_Pair) -> (B_dData_dPair.v_secondOf p))

# 998 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_fieldNameOfField = (fun (f : Frontend_dRast.t_Field) -> (f).Frontend_dRast.f_Field_fieldName)

# 1001 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let rec v_numberedFieldNames = (fun (mc0 : Frontend_dRast.t_Field B_dData_dList.t_List) (mc1 : int) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__301, dtb__302) -> (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = (v_fieldNameOfField dtb__301); B_dData_dPair.f_Pair_second = mc1 }, ((v_numberedFieldNames dtb__302) (mc1 + 1))))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 1018 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_reprAlias = (fun (mc0 : Frontend_dAst.t_ReprTier) -> (match mc0 with
  | Frontend_dAst.C_ReprTier_ReprAlias -> true
  | _ -> false
))

# 1005 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let rec v_recordFieldEntries = (fun (mc0 : Frontend_dRast.t_Decl B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__303, dtb__304) -> (let prev = (v_recordFieldEntries dtb__304) in (match dtb__303 with
  | Frontend_dRast.C_Decl_DRecord (dtb__305, dtb__306, dtb__307, dtb__308, dtb__309, dtb__310, dtb__311, dtb__312) -> (if (v_reprAlias dtb__310) then { B_dData_dPair.f_Pair_first = (B_dData_dPair.v_firstOf prev); B_dData_dPair.f_Pair_second = ((B_dData_dList.v_append ((B_dData_dList.v_map v_fieldNameOfField) dtb__307)) (B_dData_dPair.v_secondOf prev)) } else { B_dData_dPair.f_Pair_first = ((B_dData_dList.v_append ((v_numberedFieldNames dtb__307) 0)) (B_dData_dPair.v_firstOf prev)); B_dData_dPair.f_Pair_second = (B_dData_dPair.v_secondOf prev) })
  | _ -> prev
))
  | B_dData_dList.C_List_Nil -> { B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = B_dData_dList.C_List_Nil }
  | _ -> failwith "DT: impossible branch"
))

# 1022 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_fieldIndexOfEntries = (fun (name : string) (entries : (string, int) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (let nd_uscrut2 = (v_dedupInts ((B_dData_dList.v_map v_fieldEntryIndex) ((B_dData_dList.v_filter (fun (p : (string, int) B_dData_dPair.t_Pair) -> ((v_fieldEntryName p) = name))) entries))) in (match nd_uscrut2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__313, dtb__314) -> (match dtb__314 with
  | B_dData_dList.C_List_Nil -> (B_dData_dMaybe.C_Maybe_Just (dtb__313))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)))

# 1036 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let rec v_fieldProjectionsGo = (fun (mc0 : string B_dData_dList.t_List) (mc1 : (string, int) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc2 : string B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__315, dtb__316) -> (if ((B_dData_dList.v_memName dtb__315) mc2) then (((v_fieldProjectionsGo dtb__316) mc1) mc2) else (match ((v_fieldIndexOfEntries dtb__315) mc1) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__317) -> (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = (v_fieldProjPrefix ^ dtb__315); B_dData_dPair.f_Pair_second = (B_dData_dList.C_List__x58__x58_ (dtb__317, B_dData_dList.C_List_Nil)) }, (((v_fieldProjectionsGo dtb__316) mc1) mc2)))
  | B_dData_dMaybe.C_Maybe_Nothing -> (((v_fieldProjectionsGo dtb__316) mc1) mc2)
  | _ -> failwith "DT: impossible branch"
))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 1028 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_fieldProjectionsOf = (fun (decls : Frontend_dRast.t_Decl B_dData_dList.t_List) -> (let collected = (v_recordFieldEntries decls) in (let entries = (B_dData_dPair.v_firstOf collected) in (let poisoned = (B_dData_dPair.v_secondOf collected) in (((v_fieldProjectionsGo (v_dedup ((B_dData_dList.v_map v_fieldEntryName) entries))) entries) poisoned)))))

# 1056 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let rec v_fieldProjPath = (fun (mc0 : string) (mc1 : (string, int B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__318, dtb__319) -> (match dtb__318 with
  | { B_dData_dPair.f_Pair_first = dtb__320; B_dData_dPair.f_Pair_second = dtb__321 } -> (if (mc0 = dtb__320) then (B_dData_dMaybe.C_Maybe_Just (dtb__321)) else ((v_fieldProjPath mc0) dtb__319))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 1047 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_fieldIndexOf = (fun (f : string) (projs : (string, int B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match ((v_fieldProjPath (v_fieldProjPrefix ^ f)) projs) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__322) -> (let nd_uscrut4 = dtb__322 in (match nd_uscrut4 with
  | B_dData_dList.C_List__x58__x58_ (dtb__323, dtb__324) -> (match dtb__324 with
  | B_dData_dList.C_List_Nil -> (B_dData_dMaybe.C_Maybe_Just (dtb__323))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
))
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 393 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let rec v_sizeOfExpr = (fun (mc0 : (string, int B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc1 : (string, (int, (int, int B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc2 : Frontend_dRast.t_Expr) -> (match mc2 with
  | Frontend_dRast.C_Expr_EParen (dtb__325, dtb__326) -> (((v_sizeOfExpr mc0) mc1) dtb__325)
  | Frontend_dRast.C_Expr_EField (dtb__327, dtb__328, dtb__329) -> (let nd_uscrut6 = (((v_sizeOfExpr mc0) mc1) dtb__327) in (match nd_uscrut6 with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb__330) -> (match dtb__330 with
  | { B_dData_dPair.f_Pair_first = dtb__331; B_dData_dPair.f_Pair_second = dtb__332 } -> (match dtb__332 with
  | { B_dData_dPair.f_Pair_first = dtb__333; B_dData_dPair.f_Pair_second = dtb__334 } -> (match ((v_fieldIndexOf dtb__328) mc0) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__335) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = dtb__331; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = (dtb__333 + 1); B_dData_dPair.f_Pair_second = ((B_dData_dList.v_append dtb__334) (B_dData_dList.C_List__x58__x58_ (dtb__335, B_dData_dList.C_List_Nil))) } }))
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))
  | Frontend_dRast.C_Expr_EVar (dtb__336, dtb__337) -> ((v_sizeOfVarStrict (Frontend_dRast_dName.v_rnameKey dtb__336)) mc1)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
))

# 405 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let rec v_extendSizesStrict = (fun (projs : (string, int B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (sizes : (string, (int, (int, int B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (scrut : Frontend_dRast.t_Expr) (pat : Frontend_dRast.t_Pat) -> (match (((v_sizeOfExpr projs) sizes) scrut) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__338) -> (let nd_uscrut6 = dtb__338 in (match nd_uscrut6 with
  | { B_dData_dPair.f_Pair_first = dtb__339; B_dData_dPair.f_Pair_second = dtb__340 } -> (match dtb__340 with
  | { B_dData_dPair.f_Pair_first = dtb__341; B_dData_dPair.f_Pair_second = dtb__342 } -> (match pat with
  | Frontend_dRast.C_Pat_PVar (dtb__343, dtb__344) -> (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__343; B_dData_dPair.f_Pair_second = dtb__338 }, sizes))
  | Frontend_dRast.C_Pat_PAs (dtb__345, dtb__346, dtb__347) -> ((((v_extendSizesStrict projs) (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__345; B_dData_dPair.f_Pair_second = dtb__338 }, sizes))) scrut) dtb__346)
  | Frontend_dRast.C_Pat_PCon (dtb__348, dtb__349, dtb__350) -> ((B_dData_dList.v_append sizes) (((((v_patsSizeStrict dtb__349) dtb__339) dtb__342) 0) B_dData_dList.C_List_Nil))
  | Frontend_dRast.C_Pat_PRecord (dtb__351, dtb__352, dtb__353) -> ((B_dData_dList.v_append sizes) (((((v_fieldsSizeStrict dtb__352) dtb__339) dtb__342) 0) B_dData_dList.C_List_Nil))
  | _ -> sizes
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))
  | B_dData_dMaybe.C_Maybe_Nothing -> sizes
  | _ -> failwith "DT: impossible branch"
))

# 421 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let rec v_extendByBinds = (fun (mc0 : (string, int B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc1 : (Frontend_dRast.t_Pat, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc2 : (string, (int, (int, int B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__354, dtb__355) -> (match dtb__354 with
  | { B_dData_dPair.f_Pair_first = dtb__356; B_dData_dPair.f_Pair_second = dtb__357 } -> (((v_extendByBinds mc0) dtb__355) ((((v_extendSizesStrict mc0) mc2) dtb__357) dtb__356))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> mc2
  | _ -> failwith "DT: impossible branch"
))

# 716 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_extendSizesVarOnly = (fun (mc0 : (string, (int, (int, int B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc1 : Frontend_dRast.t_Expr) (mc2 : Frontend_dRast.t_Pat) -> (match mc1 with
  | Frontend_dRast.C_Expr_EVar (dtb__358, dtb__359) -> ((((v_extendSizesStrict B_dData_dList.C_List_Nil) mc0) mc1) mc2)
  | _ -> mc0
))

# 1061 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let rec v_projHas = (fun (mc0 : string) (mc1 : (string, int B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__360, dtb__361) -> (match dtb__360 with
  | { B_dData_dPair.f_Pair_first = dtb__362; B_dData_dPair.f_Pair_second = dtb__363 } -> (if (mc0 = dtb__362) then true else ((v_projHas mc0) dtb__361))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 1070 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let rec v_sameCtorGo = (fun (mc0 : int) (mc1 : Frontend_dRast.t_Expr B_dData_dList.t_List) (mc2 : (string, (int, (int, int B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc3 : int) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__364, dtb__365) -> (match dtb__364 with
  | Frontend_dRast.C_Expr_EVar (dtb__366, dtb__367) -> (match ((v_sizeOfVarStrict (Frontend_dRast_dName.v_rnameKey dtb__366)) mc2) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__368) -> (let nd_uscrut11 = dtb__368 in (match nd_uscrut11 with
  | { B_dData_dPair.f_Pair_first = dtb__369; B_dData_dPair.f_Pair_second = dtb__370 } -> (match dtb__370 with
  | { B_dData_dPair.f_Pair_first = dtb__371; B_dData_dPair.f_Pair_second = dtb__372 } -> (((((((v_sameCtorField dtb__369) dtb__371) dtb__372) mc0) dtb__365) mc2) mc3)
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
# 1082 "Vuna/Compiler/Elab/Termination/Measure.vuna"
and v_sameCtorField = (fun (base : int) (depth : int) (path : int B_dData_dList.t_List) (p : int) (rest : Frontend_dRast.t_Expr B_dData_dList.t_List) (sizes : (string, (int, (int, int B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (k : int) -> (if (base = p) then (if (depth = 1) then (match path with
  | B_dData_dList.C_List__x58__x58_ (dtb__373, dtb__374) -> (match dtb__374 with
  | B_dData_dList.C_List_Nil -> (if (dtb__373 = k) then ((((v_sameCtorGo p) rest) sizes) (k + 1)) else false)
  | _ -> false
)
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
) else false) else false))

# 1067 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_sameCtorApp = (fun (p : int) (args : Frontend_dRast.t_Expr B_dData_dList.t_List) (sizes : (string, (int, (int, int B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) -> ((((v_sameCtorGo p) args) sizes) 0))

# 1097 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let rec v_findWrapField = (fun (mc0 : int) (mc1 : Frontend_dRast.t_Expr B_dData_dList.t_List) (mc2 : (string, (int, (int, int B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc3 : int) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__375, dtb__376) -> (match dtb__375 with
  | Frontend_dRast.C_Expr_EVar (dtb__377, dtb__378) -> (match ((v_sizeOfVarStrict (Frontend_dRast_dName.v_rnameKey dtb__377)) mc2) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__379) -> (let nd_uscrut11 = dtb__379 in (match nd_uscrut11 with
  | { B_dData_dPair.f_Pair_first = dtb__380; B_dData_dPair.f_Pair_second = dtb__381 } -> (match dtb__381 with
  | { B_dData_dPair.f_Pair_first = dtb__382; B_dData_dPair.f_Pair_second = dtb__383 } -> (if (dtb__380 = mc0) then ((((((v_wrapCheck mc0) dtb__376) mc2) mc3) dtb__382) dtb__383) else ((((v_findWrapField mc0) dtb__376) mc2) (mc3 + 1)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))
  | B_dData_dMaybe.C_Maybe_Nothing -> ((((v_findWrapField mc0) dtb__376) mc2) (mc3 + 1))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> ((((v_findWrapField mc0) dtb__376) mc2) (mc3 + 1))
)
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))
# 1115 "Vuna/Compiler/Elab/Termination/Measure.vuna"
and v_wrapCheck = (fun (p : int) (rest : Frontend_dRast.t_Expr B_dData_dList.t_List) (sizes : (string, (int, (int, int B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (k : int) (depth : int) (path : int B_dData_dList.t_List) -> (if (depth > 0) then (match path with
  | B_dData_dList.C_List__x58__x58_ (dtb__384, dtb__385) -> (if (dtb__384 = k) then (if (v_notEmpty dtb__385) then (B_dData_dMaybe.C_Maybe_Just ((k + 2))) else ((((v_findWrapField p) rest) sizes) (k + 1))) else ((((v_findWrapField p) rest) sizes) (k + 1)))
  | B_dData_dList.C_List_Nil -> ((((v_findWrapField p) rest) sizes) (k + 1))
  | _ -> failwith "DT: impossible branch"
) else ((((v_findWrapField p) rest) sizes) (k + 1))))

# 1128 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_posVarIn = (fun (x : string) (p : int) (caller : string) (facts : (string, int B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (region : string B_dData_dList.t_List) -> (if ((B_dData_dList.v_memName x) region) then true else (((v_posHasTbl caller) p) facts)))

# 1139 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_isSubOpName = (fun (op : string) -> (if (if (if (op = "-") then true else (op = "Base.Trait.Num.sub")) then true else (op = "Base.Trait.Num.-")) then true else ((v_opBaseName op) = "natSub")))

# 1144 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_isAddOpName = (fun (op : string) -> (if (if (op = "+") then true else (op = "Base.Trait.Num.add")) then true else (op = "Base.Trait.Num.+")))

# 1157 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let rec v_natLitOf = (fun (mc0 : Frontend_dRast.t_Expr) -> (match mc0 with
  | Frontend_dRast.C_Expr_EApp (dtb__386, dtb__387, dtb__388) -> (match dtb__386 with
  | Frontend_dRast.C_Expr_EVar (dtb__389, dtb__390) -> (match dtb__387 with
  | B_dData_dList.C_List__x58__x58_ (dtb__391, dtb__392) -> (match dtb__392 with
  | B_dData_dList.C_List_Nil -> (let b = (v_opBaseName (Frontend_dRast_dName.v_rnameKey dtb__389)) in (if (if (b = "S") then true else (b = "Succ")) then (match (v_natLitOf dtb__391) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__393) -> (B_dData_dMaybe.C_Maybe_Just ((dtb__393 + 1)))
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
) else B_dData_dMaybe.C_Maybe_Nothing))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | Frontend_dRast.C_Expr_EVar (dtb__394, dtb__395) -> (let b = (v_opBaseName (Frontend_dRast_dName.v_rnameKey dtb__394)) in (if (if (b = "Z") then true else (b = "Zero")) then (B_dData_dMaybe.C_Maybe_Just (0)) else B_dData_dMaybe.C_Maybe_Nothing))
  | Frontend_dRast.C_Expr_EInt (dtb__396, dtb__397) -> (if (dtb__396 >= 0) then (B_dData_dMaybe.C_Maybe_Just (dtb__396)) else B_dData_dMaybe.C_Maybe_Nothing)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
))

# 1174 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_arithMinusBase = (fun (mc0 : int) (mc1 : Frontend_dRast.t_Expr) (mc2 : int) (mc3 : (string, (int, (int, int B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc4 : string) (mc5 : (string, int B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (mc6 : string B_dData_dList.t_List) -> (match mc1 with
  | Frontend_dRast.C_Expr_EVar (dtb__398, dtb__399) -> (match ((v_sizeOfVarStrict (Frontend_dRast_dName.v_rnameKey dtb__398)) mc3) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__400) -> (let nd_uscrut11 = dtb__400 in (match nd_uscrut11 with
  | { B_dData_dPair.f_Pair_first = dtb__401; B_dData_dPair.f_Pair_second = dtb__402 } -> (match dtb__402 with
  | { B_dData_dPair.f_Pair_first = dtb__403; B_dData_dPair.f_Pair_second = dtb__404 } -> (if (dtb__401 = mc0) then (if (dtb__403 = 0) then (if (((((v_posVarIn (Frontend_dRast_dName.v_rnameKey dtb__398)) mc0) mc4) mc5) mc6) then (B_dData_dMaybe.C_Maybe_Just (4)) else B_dData_dMaybe.C_Maybe_Nothing) else B_dData_dMaybe.C_Maybe_Nothing) else B_dData_dMaybe.C_Maybe_Nothing)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
))

# 1147 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_arithMinus = (fun (p : int) (args : Frontend_dRast.t_Expr B_dData_dList.t_List) (sizes : (string, (int, (int, int B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (caller : string) (facts : (string, int B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (region : string B_dData_dList.t_List) -> (let nd_uscrut6 = (v_lastTwo args) in (match nd_uscrut6 with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb__405) -> (match dtb__405 with
  | { B_dData_dPair.f_Pair_first = dtb__406; B_dData_dPair.f_Pair_second = dtb__407 } -> (match (v_natLitOf dtb__407) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__408) -> (if (dtb__408 > 0) then (((((((v_arithMinusBase p) dtb__406) dtb__408) sizes) caller) facts) region) else B_dData_dMaybe.C_Maybe_Nothing)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))

# 1131 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_arithRel = (fun (mc0 : int) (mc1 : Frontend_dRast.t_Expr) (mc2 : (string, (int, (int, int B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc3 : string) (mc4 : (string, int B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (mc5 : string B_dData_dList.t_List) -> (match mc1 with
  | Frontend_dRast.C_Expr_EApp (dtb__409, dtb__410, dtb__411) -> (match dtb__409 with
  | Frontend_dRast.C_Expr_EVar (dtb__412, dtb__413) -> (if (v_isSubOpName (Frontend_dRast_dName.v_rnameKey dtb__412)) then ((((((v_arithMinus mc0) dtb__410) mc2) mc3) mc4) mc5) else B_dData_dMaybe.C_Maybe_Nothing)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
))

# 1205 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let rec v_lastOf = (fun mc0 -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__414, dtb__415) -> (match dtb__415 with
  | B_dData_dList.C_List_Nil -> (B_dData_dMaybe.C_Maybe_Just (dtb__414))
  | _ -> (v_lastOf dtb__415)
)
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 1191 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_projRel = (fun (p : int) (args : Frontend_dRast.t_Expr B_dData_dList.t_List) (sizes : (string, (int, (int, int B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match (v_lastOf args) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__416) -> (match dtb__416 with
  | Frontend_dRast.C_Expr_EVar (dtb__417, dtb__418) -> (match ((v_sizeOfVarStrict (Frontend_dRast_dName.v_rnameKey dtb__417)) sizes) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__419) -> (let nd_uscrut9 = dtb__419 in (match nd_uscrut9 with
  | { B_dData_dPair.f_Pair_first = dtb__420; B_dData_dPair.f_Pair_second = dtb__421 } -> (match dtb__421 with
  | { B_dData_dPair.f_Pair_first = dtb__422; B_dData_dPair.f_Pair_second = dtb__423 } -> (if (dtb__420 = p) then (B_dData_dMaybe.C_Maybe_Just (1)) else B_dData_dMaybe.C_Maybe_Nothing)
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

# 1279 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_markInvalid = (fun (acc : (bool, (((string, string) B_dData_dPair.t_Pair, int) B_dData_dPair.t_Pair, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dData_dPair.t_Pair) -> { B_dData_dPair.f_Pair_first = false; B_dData_dPair.f_Pair_second = (B_dData_dPair.v_secondOf acc) })

# 1282 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_addEdgeMode = (fun (caller : string) (callee : string) (m : int) (sp : Base_dSource.t_Span) (acc : (bool, (((string, string) B_dData_dPair.t_Pair, int) B_dData_dPair.t_Pair, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dData_dPair.t_Pair) -> { B_dData_dPair.f_Pair_first = (B_dData_dPair.v_firstOf acc); B_dData_dPair.f_Pair_second = (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = { B_dData_dPair.f_Pair_first = { B_dData_dPair.f_Pair_first = caller; B_dData_dPair.f_Pair_second = callee }; B_dData_dPair.f_Pair_second = m }; B_dData_dPair.f_Pair_second = sp }, (B_dData_dPair.v_secondOf acc))) })

# 1286 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_groupHead = (fun (mc0 : string B_dData_dList.t_List) (mc1 : Frontend_dRast.t_Expr) -> (match mc1 with
  | Frontend_dRast.C_Expr_EVar (dtb__424, dtb__425) -> (if ((B_dData_dList.v_memName (Frontend_dRast_dName.v_rnameKey dtb__424)) mc0) then (B_dData_dMaybe.C_Maybe_Just ((Frontend_dRast_dName.v_rnameKey dtb__424))) else B_dData_dMaybe.C_Maybe_Nothing)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
))

# 1290 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let rec v_nthExpr = (fun (mc0 : Frontend_dRast.t_Expr B_dData_dList.t_List) (mc1 : int) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__426, dtb__427) -> (if (mc1 <= 0) then (B_dData_dMaybe.C_Maybe_Just (dtb__426)) else ((v_nthExpr dtb__427) (mc1 - 1)))
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 239 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let rec v_argsAt = (fun (mc0 : Frontend_dRast.t_Expr B_dData_dList.t_List) (mc1 : int B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__428, dtb__429) -> (match ((v_nthExpr mc0) dtb__428) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__430) -> (match ((v_argsAt mc0) dtb__429) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__431) -> (B_dData_dMaybe.C_Maybe_Just ((B_dData_dList.C_List__x58__x58_ (dtb__430, dtb__431))))
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (B_dData_dMaybe.C_Maybe_Just (B_dData_dList.C_List_Nil))
  | _ -> failwith "DT: impossible branch"
))

# 249 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let rec v_fwArgs = (fun (mc0 : t_Forwarder B_dData_dList.t_List) (mc1 : Frontend_dRast.t_Expr B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__432, dtb__433) -> (B_dData_dList.C_List__x58__x58_ (((v_fwExpr mc0) dtb__432), ((v_fwArgs mc0) dtb__433)))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))
# 253 "Vuna/Compiler/Elab/Termination/Measure.vuna"
and v_fwFields = (fun (mc0 : t_Forwarder B_dData_dList.t_List) (mc1 : (string, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__434, dtb__435) -> (match dtb__434 with
  | { B_dData_dPair.f_Pair_first = dtb__436; B_dData_dPair.f_Pair_second = dtb__437 } -> (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__436; B_dData_dPair.f_Pair_second = ((v_fwExpr mc0) dtb__437) }, ((v_fwFields mc0) dtb__435)))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))
# 257 "Vuna/Compiler/Elab/Termination/Measure.vuna"
and v_fwBinds = (fun (mc0 : t_Forwarder B_dData_dList.t_List) (mc1 : (Frontend_dRast.t_Pat, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__438, dtb__439) -> (match dtb__438 with
  | { B_dData_dPair.f_Pair_first = dtb__440; B_dData_dPair.f_Pair_second = dtb__441 } -> (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__440; B_dData_dPair.f_Pair_second = ((v_fwExpr mc0) dtb__441) }, ((v_fwBinds mc0) dtb__439)))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))
# 261 "Vuna/Compiler/Elab/Termination/Measure.vuna"
and v_fwAlts = (fun (mc0 : t_Forwarder B_dData_dList.t_List) (mc1 : (Frontend_dRast.t_Pat, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__442, dtb__443) -> (match dtb__442 with
  | { B_dData_dPair.f_Pair_first = dtb__444; B_dData_dPair.f_Pair_second = dtb__445 } -> (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__444; B_dData_dPair.f_Pair_second = ((v_fwExpr mc0) dtb__445) }, ((v_fwAlts mc0) dtb__443)))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))
# 265 "Vuna/Compiler/Elab/Termination/Measure.vuna"
and v_fwClauses = (fun (mc0 : t_Forwarder B_dData_dList.t_List) (mc1 : (Frontend_dRast.t_Pat B_dData_dList.t_List, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__446, dtb__447) -> (match dtb__446 with
  | { B_dData_dPair.f_Pair_first = dtb__448; B_dData_dPair.f_Pair_second = dtb__449 } -> (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__448; B_dData_dPair.f_Pair_second = ((v_fwExpr mc0) dtb__449) }, ((v_fwClauses mc0) dtb__447)))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))
# 269 "Vuna/Compiler/Elab/Termination/Measure.vuna"
and v_fwStmts = (fun (mc0 : t_Forwarder B_dData_dList.t_List) (mc1 : Frontend_dRast.t_DoStmt B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__450, dtb__451) -> (match dtb__450 with
  | Frontend_dRast.C_DoStmt_DBind (dtb__452, dtb__453, dtb__454) -> (B_dData_dList.C_List__x58__x58_ ((Frontend_dRast.C_DoStmt_DBind (dtb__452, ((v_fwExpr mc0) dtb__453), dtb__454)), ((v_fwStmts mc0) dtb__451)))
  | Frontend_dRast.C_DoStmt_DExpr (dtb__455, dtb__456) -> (B_dData_dList.C_List__x58__x58_ ((Frontend_dRast.C_DoStmt_DExpr (((v_fwExpr mc0) dtb__455), dtb__456)), ((v_fwStmts mc0) dtb__451)))
  | Frontend_dRast.C_DoStmt_DLet (dtb__457, dtb__458) -> (B_dData_dList.C_List__x58__x58_ ((Frontend_dRast.C_DoStmt_DLet (((v_fwBinds mc0) dtb__457), dtb__458)), ((v_fwStmts mc0) dtb__451)))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))
# 277 "Vuna/Compiler/Elab/Termination/Measure.vuna"
and v_fwParts = (fun (mc0 : t_Forwarder B_dData_dList.t_List) (mc1 : Frontend_dRast.t_InterpPart B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__459, dtb__460) -> (match dtb__459 with
  | Frontend_dRast.C_InterpPart_IPText (dtb__461) -> (B_dData_dList.C_List__x58__x58_ ((Frontend_dRast.C_InterpPart_IPText (dtb__461)), ((v_fwParts mc0) dtb__460)))
  | Frontend_dRast.C_InterpPart_IPHole (dtb__462) -> (B_dData_dList.C_List__x58__x58_ ((Frontend_dRast.C_InterpPart_IPHole (((v_fwExpr mc0) dtb__462))), ((v_fwParts mc0) dtb__460)))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))
# 284 "Vuna/Compiler/Elab/Termination/Measure.vuna"
and v_fwExpr = (fun (mc0 : t_Forwarder B_dData_dList.t_List) (mc1 : Frontend_dRast.t_Expr) -> (match mc1 with
  | Frontend_dRast.C_Expr_EInterp (dtb__463, dtb__464, dtb__465) -> (Frontend_dRast.C_Expr_EInterp (dtb__463, ((v_fwParts mc0) dtb__464), dtb__465))
  | Frontend_dRast.C_Expr_EAnn (dtb__466, dtb__467, dtb__468) -> (Frontend_dRast.C_Expr_EAnn (((v_fwExpr mc0) dtb__466), ((v_fwExpr mc0) dtb__467), dtb__468))
  | Frontend_dRast.C_Expr_ESectR (dtb__469, dtb__470, dtb__471) -> (Frontend_dRast.C_Expr_ESectR (((v_fwExpr mc0) dtb__469), dtb__470, dtb__471))
  | Frontend_dRast.C_Expr_ESectL (dtb__472, dtb__473, dtb__474) -> (Frontend_dRast.C_Expr_ESectL (dtb__472, ((v_fwExpr mc0) dtb__473), dtb__474))
  | Frontend_dRast.C_Expr_EBacktick (dtb__475, dtb__476, dtb__477, dtb__478) -> (Frontend_dRast.C_Expr_EBacktick (dtb__475, ((v_fwExpr mc0) dtb__476), ((v_fwExpr mc0) dtb__477), dtb__478))
  | Frontend_dRast.C_Expr_EParen (dtb__479, dtb__480) -> (Frontend_dRast.C_Expr_EParen (((v_fwExpr mc0) dtb__479), dtb__480))
  | Frontend_dRast.C_Expr_EInfix (dtb__481, dtb__482, dtb__483, dtb__484) -> (Frontend_dRast.C_Expr_EInfix (dtb__481, ((v_fwExpr mc0) dtb__482), ((v_fwExpr mc0) dtb__483), dtb__484))
  | Frontend_dRast.C_Expr_EPi (dtb__485, dtb__486, dtb__487, dtb__488, dtb__489, dtb__490) -> (Frontend_dRast.C_Expr_EPi (dtb__485, dtb__486, dtb__487, ((v_fwExpr mc0) dtb__488), ((v_fwExpr mc0) dtb__489), dtb__490))
  | Frontend_dRast.C_Expr_EDo (dtb__491, dtb__492) -> (Frontend_dRast.C_Expr_EDo (((v_fwStmts mc0) dtb__491), dtb__492))
  | Frontend_dRast.C_Expr_ERecUpdate (dtb__493, dtb__494, dtb__495) -> (Frontend_dRast.C_Expr_ERecUpdate (((v_fwExpr mc0) dtb__493), ((v_fwFields mc0) dtb__494), dtb__495))
  | Frontend_dRast.C_Expr_ERecord (dtb__496, dtb__497, dtb__498) -> (Frontend_dRast.C_Expr_ERecord (dtb__496, ((v_fwFields mc0) dtb__497), dtb__498))
  | Frontend_dRast.C_Expr_EField (dtb__499, dtb__500, dtb__501) -> (Frontend_dRast.C_Expr_EField (((v_fwExpr mc0) dtb__499), dtb__500, dtb__501))
  | Frontend_dRast.C_Expr_EIf (dtb__502, dtb__503, dtb__504, dtb__505) -> (Frontend_dRast.C_Expr_EIf (((v_fwExpr mc0) dtb__502), ((v_fwExpr mc0) dtb__503), ((v_fwExpr mc0) dtb__504), dtb__505))
  | Frontend_dRast.C_Expr_ECase (dtb__506, dtb__507, dtb__508) -> (Frontend_dRast.C_Expr_ECase (((v_fwExpr mc0) dtb__506), ((v_fwAlts mc0) dtb__507), dtb__508))
  | Frontend_dRast.C_Expr_ELocalFun (dtb__509, dtb__510) -> (Frontend_dRast.C_Expr_ELocalFun (((v_fwClauses mc0) dtb__509), dtb__510))
  | Frontend_dRast.C_Expr_ELet (dtb__511, dtb__512, dtb__513, dtb__514) -> (Frontend_dRast.C_Expr_ELet (((v_fwBinds mc0) dtb__511), ((v_fwExpr mc0) dtb__512), dtb__513, dtb__514))
  | Frontend_dRast.C_Expr_ELam (dtb__515, dtb__516, dtb__517) -> (Frontend_dRast.C_Expr_ELam (dtb__515, ((v_fwExpr mc0) dtb__516), dtb__517))
  | Frontend_dRast.C_Expr_EApp (dtb__518, dtb__519, dtb__520) -> (let args2 = ((v_fwArgs mc0) dtb__519) in (match dtb__518 with
  | Frontend_dRast.C_Expr_EVar (dtb__521, dtb__522) -> (match ((v_lookupForwarder (Frontend_dRast_dName.v_rnameKey dtb__521)) mc0) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__523) -> (let nd_uscrut10 = ((v_nthExpr args2) (dtb__523).f_Forwarder_fwdCbParam) in (match nd_uscrut10 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__524) -> (match dtb__524 with
  | Frontend_dRast.C_Expr_EVar (dtb__525, dtb__526) -> (match ((v_argsAt args2) (dtb__523).f_Forwarder_fwdArgParams) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__527) -> (Frontend_dRast.C_Expr_EApp ((Frontend_dRast.C_Expr_EVar (dtb__525, dtb__526)), dtb__527, dtb__520))
  | B_dData_dMaybe.C_Maybe_Nothing -> (Frontend_dRast.C_Expr_EApp ((Frontend_dRast.C_Expr_EVar (dtb__521, dtb__522)), args2, dtb__520))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> (Frontend_dRast.C_Expr_EApp ((Frontend_dRast.C_Expr_EVar (dtb__521, dtb__522)), args2, dtb__520))
)
  | _ -> (Frontend_dRast.C_Expr_EApp ((Frontend_dRast.C_Expr_EVar (dtb__521, dtb__522)), args2, dtb__520))
))
  | B_dData_dMaybe.C_Maybe_Nothing -> (Frontend_dRast.C_Expr_EApp (((v_fwExpr mc0) dtb__518), args2, dtb__520))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> (Frontend_dRast.C_Expr_EApp (((v_fwExpr mc0) dtb__518), args2, dtb__520))
))
  | _ -> mc1
))

# 320 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let rec v_fwDecl = (fun (mc0 : t_Forwarder B_dData_dList.t_List) (mc1 : Frontend_dRast.t_Decl) -> (match mc1 with
  | Frontend_dRast.C_Decl_DInstance (dtb__528, dtb__529, dtb__530, dtb__531) -> (Frontend_dRast.C_Decl_DInstance (dtb__528, dtb__529, ((B_dData_dList.v_map (v_fwDecl mc0)) dtb__530), dtb__531))
  | Frontend_dRast.C_Decl_DFun (dtb__532, dtb__533, dtb__534, dtb__535) -> (Frontend_dRast.C_Decl_DFun (dtb__532, dtb__533, ((v_fwExpr mc0) dtb__534), dtb__535))
  | _ -> mc1
))

# 326 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_expandForwarders = (fun (decls : Frontend_dRast.t_Decl B_dData_dList.t_List) -> (match (v_forwardersOf decls) with
  | B_dData_dList.C_List_Nil -> decls
  | dtb__536 -> ((B_dData_dList.v_map (v_fwDecl dtb__536)) decls)
))

# 635 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_argPositive = (fun (args : Frontend_dRast.t_Expr B_dData_dList.t_List) (i : int) (sizes : (string, (int, (int, int B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (caller : string) (facts : (string, int B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (region : string B_dData_dList.t_List) -> (match ((v_nthExpr args) i) with
  | B_dData_dMaybe.C_Maybe_Nothing -> false
  | B_dData_dMaybe.C_Maybe_Just (dtb__537) -> (match dtb__537 with
  | Frontend_dRast.C_Expr_EInt (dtb__538, dtb__539) -> (dtb__538 > 0)
  | Frontend_dRast.C_Expr_EVar (dtb__540, dtb__541) -> (if ((B_dData_dList.v_memName (Frontend_dRast_dName.v_rnameKey dtb__540)) region) then true else (match ((v_sizeOfVarStrict (Frontend_dRast_dName.v_rnameKey dtb__540)) sizes) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__542) -> (let nd_uscrut12 = dtb__542 in (match nd_uscrut12 with
  | { B_dData_dPair.f_Pair_first = dtb__543; B_dData_dPair.f_Pair_second = dtb__544 } -> (match dtb__544 with
  | { B_dData_dPair.f_Pair_first = dtb__545; B_dData_dPair.f_Pair_second = dtb__546 } -> (if (dtb__545 = 0) then (((v_posHasTbl caller) dtb__543) facts) else false)
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

# 869 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let rec v_posWalkCalleeGo = (fun (namesTbl : (string, bool) B_dContainer_dHashMap.t_HashMap) (caller : string) (sizes : (string, (int, (int, int B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (facts : (string, int B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (region : string B_dData_dList.t_List) (g : string) (remaining : int) (args : Frontend_dRast.t_Expr B_dData_dList.t_List) (st : ((string, int) B_dData_dPair.t_Pair B_dData_dList.t_List, (string, int) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dData_dPair.t_Pair) -> (if (remaining <= 0) then st else (let i = ((B_dData_dList.v_length args) - remaining) in (let st1 = (if ((((((v_argPositive args) i) sizes) caller) facts) region) then (((v_posMarkPos g) i) st) else (((v_posMarkNeg g) i) st)) in (((((((((v_posWalkCalleeGo namesTbl) caller) sizes) facts) region) g) (remaining - 1)) args) st1)))))

# 865 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_posWalkCallee = (fun (namesTbl : (string, bool) B_dContainer_dHashMap.t_HashMap) (caller : string) (sizes : (string, (int, (int, int B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (facts : (string, int B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (region : string B_dData_dList.t_List) (g : string) (i : int) (args : Frontend_dRast.t_Expr B_dData_dList.t_List) (st : ((string, int) B_dData_dPair.t_Pair B_dData_dList.t_List, (string, int) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dData_dPair.t_Pair) -> (((((((((v_posWalkCalleeGo namesTbl) caller) sizes) facts) region) g) ((B_dData_dList.v_length args) - i)) args) st))

# 677 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let rec v_posWalkArgs = (fun (mc0 : (string, bool) B_dContainer_dHashMap.t_HashMap) (mc1 : string) (mc2 : (string, (int, (int, int B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc3 : (string, int B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (mc4 : string B_dData_dList.t_List) (mc5 : Frontend_dRast.t_Expr B_dData_dList.t_List) (mc6 : ((string, int) B_dData_dPair.t_Pair B_dData_dList.t_List, (string, int) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dData_dPair.t_Pair) -> (match mc5 with
  | B_dData_dList.C_List__x58__x58_ (dtb__547, dtb__548) -> (((((((v_posWalkArgs mc0) mc1) mc2) mc3) mc4) dtb__548) (((((((v_posWalk mc0) mc1) mc2) mc3) mc4) dtb__547) mc6))
  | B_dData_dList.C_List_Nil -> mc6
  | _ -> failwith "DT: impossible branch"
))
# 689 "Vuna/Compiler/Elab/Termination/Measure.vuna"
and v_posWalkFields = (fun (mc0 : (string, bool) B_dContainer_dHashMap.t_HashMap) (mc1 : string) (mc2 : (string, (int, (int, int B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc3 : (string, int B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (mc4 : string B_dData_dList.t_List) (mc5 : (string, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc6 : ((string, int) B_dData_dPair.t_Pair B_dData_dList.t_List, (string, int) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dData_dPair.t_Pair) -> (match mc5 with
  | B_dData_dList.C_List__x58__x58_ (dtb__549, dtb__550) -> (match dtb__549 with
  | { B_dData_dPair.f_Pair_first = dtb__551; B_dData_dPair.f_Pair_second = dtb__552 } -> (((((((v_posWalkFields mc0) mc1) mc2) mc3) mc4) dtb__550) (((((((v_posWalk mc0) mc1) mc2) mc3) mc4) dtb__552) mc6))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> mc6
  | _ -> failwith "DT: impossible branch"
))
# 701 "Vuna/Compiler/Elab/Termination/Measure.vuna"
and v_posWalkAlts = (fun (mc0 : (string, bool) B_dContainer_dHashMap.t_HashMap) (mc1 : string) (mc2 : (string, (int, (int, int B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc3 : (string, int B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (mc4 : string B_dData_dList.t_List) (mc5 : Frontend_dRast.t_Expr) (mc6 : (Frontend_dRast.t_Pat, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc7 : ((string, int) B_dData_dPair.t_Pair B_dData_dList.t_List, (string, int) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dData_dPair.t_Pair) -> (match mc6 with
  | B_dData_dList.C_List__x58__x58_ (dtb__553, dtb__554) -> (match dtb__553 with
  | { B_dData_dPair.f_Pair_first = dtb__555; B_dData_dPair.f_Pair_second = dtb__556 } -> ((((((((v_posWalkAlts mc0) mc1) mc2) mc3) mc4) mc5) dtb__554) (((((((v_posWalk mc0) mc1) (((v_extendSizesVarOnly mc2) mc5) dtb__555)) mc3) mc4) dtb__556) mc7))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> mc7
  | _ -> failwith "DT: impossible branch"
))
# 721 "Vuna/Compiler/Elab/Termination/Measure.vuna"
and v_posWalkClauses = (fun (mc0 : (string, bool) B_dContainer_dHashMap.t_HashMap) (mc1 : string) (mc2 : (string, (int, (int, int B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc3 : (string, int B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (mc4 : string B_dData_dList.t_List) (mc5 : (Frontend_dRast.t_Pat B_dData_dList.t_List, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc6 : ((string, int) B_dData_dPair.t_Pair B_dData_dList.t_List, (string, int) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dData_dPair.t_Pair) -> (match mc5 with
  | B_dData_dList.C_List__x58__x58_ (dtb__557, dtb__558) -> (match dtb__557 with
  | { B_dData_dPair.f_Pair_first = dtb__559; B_dData_dPair.f_Pair_second = dtb__560 } -> (((((((v_posWalkClauses mc0) mc1) mc2) mc3) mc4) dtb__558) (((((((v_posWalk mc0) mc1) mc2) mc3) mc4) dtb__560) mc6))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> mc6
  | _ -> failwith "DT: impossible branch"
))
# 733 "Vuna/Compiler/Elab/Termination/Measure.vuna"
and v_posWalkBinds = (fun (mc0 : (string, bool) B_dContainer_dHashMap.t_HashMap) (mc1 : string) (mc2 : (string, (int, (int, int B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc3 : (string, int B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (mc4 : string B_dData_dList.t_List) (mc5 : (Frontend_dRast.t_Pat, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc6 : ((string, int) B_dData_dPair.t_Pair B_dData_dList.t_List, (string, int) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dData_dPair.t_Pair) -> (match mc5 with
  | B_dData_dList.C_List__x58__x58_ (dtb__561, dtb__562) -> (match dtb__561 with
  | { B_dData_dPair.f_Pair_first = dtb__563; B_dData_dPair.f_Pair_second = dtb__564 } -> (((((((v_posWalkBinds mc0) mc1) mc2) mc3) mc4) dtb__562) (((((((v_posWalk mc0) mc1) mc2) mc3) mc4) dtb__564) mc6))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> mc6
  | _ -> failwith "DT: impossible branch"
))
# 745 "Vuna/Compiler/Elab/Termination/Measure.vuna"
and v_posWalkStmts = (fun (mc0 : (string, bool) B_dContainer_dHashMap.t_HashMap) (mc1 : string) (mc2 : (string, (int, (int, int B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc3 : (string, int B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (mc4 : string B_dData_dList.t_List) (mc5 : Frontend_dRast.t_DoStmt B_dData_dList.t_List) (mc6 : ((string, int) B_dData_dPair.t_Pair B_dData_dList.t_List, (string, int) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dData_dPair.t_Pair) -> (match mc5 with
  | B_dData_dList.C_List__x58__x58_ (dtb__565, dtb__566) -> (match dtb__565 with
  | Frontend_dRast.C_DoStmt_DBind (dtb__567, dtb__568, dtb__569) -> (((((((v_posWalkStmts mc0) mc1) mc2) mc3) mc4) dtb__566) (((((((v_posWalk mc0) mc1) mc2) mc3) mc4) dtb__568) mc6))
  | Frontend_dRast.C_DoStmt_DExpr (dtb__570, dtb__571) -> (((((((v_posWalkStmts mc0) mc1) mc2) mc3) mc4) dtb__566) (((((((v_posWalk mc0) mc1) mc2) mc3) mc4) dtb__570) mc6))
  | Frontend_dRast.C_DoStmt_DLet (dtb__572, dtb__573) -> (((((((v_posWalkStmts mc0) mc1) mc2) mc3) mc4) dtb__566) (((((((v_posWalkBinds mc0) mc1) mc2) mc3) mc4) dtb__572) mc6))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> mc6
  | _ -> failwith "DT: impossible branch"
))
# 777 "Vuna/Compiler/Elab/Termination/Measure.vuna"
and v_posWalk = (fun (mc0 : (string, bool) B_dContainer_dHashMap.t_HashMap) (mc1 : string) (mc2 : (string, (int, (int, int B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc3 : (string, int B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (mc4 : string B_dData_dList.t_List) (mc5 : Frontend_dRast.t_Expr) (mc6 : ((string, int) B_dData_dPair.t_Pair B_dData_dList.t_List, (string, int) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dData_dPair.t_Pair) -> (match mc5 with
  | Frontend_dRast.C_Expr_EVar (dtb__574, dtb__575) -> mc6
  | Frontend_dRast.C_Expr_EAnn (dtb__576, dtb__577, dtb__578) -> (((((((v_posWalk mc0) mc1) mc2) mc3) mc4) dtb__577) (((((((v_posWalk mc0) mc1) mc2) mc3) mc4) dtb__576) mc6))
  | Frontend_dRast.C_Expr_EDo (dtb__579, dtb__580) -> (((((((v_posWalkStmts mc0) mc1) mc2) mc3) mc4) dtb__579) mc6)
  | Frontend_dRast.C_Expr_ERecUpdate (dtb__581, dtb__582, dtb__583) -> (((((((v_posWalkFields mc0) mc1) mc2) mc3) mc4) dtb__582) (((((((v_posWalk mc0) mc1) mc2) mc3) mc4) dtb__581) mc6))
  | Frontend_dRast.C_Expr_ERecord (dtb__584, dtb__585, dtb__586) -> (((((((v_posWalkFields mc0) mc1) mc2) mc3) mc4) dtb__585) mc6)
  | Frontend_dRast.C_Expr_EField (dtb__587, dtb__588, dtb__589) -> (((((((v_posWalk mc0) mc1) mc2) mc3) mc4) dtb__587) mc6)
  | Frontend_dRast.C_Expr_EPi (dtb__590, dtb__591, dtb__592, dtb__593, dtb__594, dtb__595) -> (((((((v_posWalk mc0) mc1) mc2) mc3) mc4) dtb__594) (((((((v_posWalk mc0) mc1) mc2) mc3) mc4) dtb__593) mc6))
  | Frontend_dRast.C_Expr_ELet (dtb__596, dtb__597, dtb__598, dtb__599) -> (((((((v_posWalk mc0) mc1) mc2) mc3) mc4) dtb__597) (((((((v_posWalkBinds mc0) mc1) mc2) mc3) mc4) dtb__596) mc6))
  | Frontend_dRast.C_Expr_ELocalFun (dtb__600, dtb__601) -> (((((((v_posWalkClauses mc0) mc1) mc2) mc3) mc4) dtb__600) mc6)
  | Frontend_dRast.C_Expr_ELam (dtb__602, dtb__603, dtb__604) -> (((((((v_posWalk mc0) mc1) mc2) mc3) mc4) dtb__603) mc6)
  | Frontend_dRast.C_Expr_ECase (dtb__605, dtb__606, dtb__607) -> ((((((((v_posWalkAlts mc0) mc1) mc2) mc3) mc4) dtb__605) dtb__606) (((((((v_posWalk mc0) mc1) mc2) mc3) mc4) dtb__605) mc6))
  | Frontend_dRast.C_Expr_EIf (dtb__608, dtb__609, dtb__610, dtb__611) -> (let st1 = (((((((v_posWalk mc0) mc1) mc2) mc3) mc4) dtb__608) mc6) in (let st2 = (((((((v_posWalk mc0) mc1) mc2) mc3) ((B_dData_dList.v_append (v_guardThenPosVars dtb__608)) mc4)) dtb__609) st1) in (((((((v_posWalk mc0) mc1) mc2) mc3) ((B_dData_dList.v_append (v_guardElsePosVars dtb__608)) mc4)) dtb__610) st2)))
  | Frontend_dRast.C_Expr_EApp (dtb__612, dtb__613, dtb__614) -> (match dtb__612 with
  | Frontend_dRast.C_Expr_EVar (dtb__615, dtb__616) -> (if ((((B_dContainer_dHashMap.v_member B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) (Frontend_dRast_dName.v_rnameKey dtb__615)) mc0) then (((((((v_posWalkArgs mc0) mc1) mc2) mc3) mc4) dtb__613) (((((((((v_posWalkCallee mc0) mc1) mc2) mc3) mc4) (Frontend_dRast_dName.v_rnameKey dtb__615)) 0) dtb__613) mc6)) else (((((((v_posWalkArgs mc0) mc1) mc2) mc3) mc4) dtb__613) (((((((v_posWalk mc0) mc1) mc2) mc3) mc4) dtb__612) mc6)))
  | _ -> (((((((v_posWalkArgs mc0) mc1) mc2) mc3) mc4) dtb__613) (((((((v_posWalk mc0) mc1) mc2) mc3) mc4) dtb__612) mc6))
)
  | _ -> mc6
))

# 879 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let rec v_posScanClauses = (fun (mc0 : (string, bool) B_dContainer_dHashMap.t_HashMap) (mc1 : (string, (Frontend_dRast.t_Pat B_dData_dList.t_List, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc2 : (string, int B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (mc3 : string) (mc4 : (Frontend_dRast.t_Pat B_dData_dList.t_List, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc5 : ((string, int) B_dData_dPair.t_Pair B_dData_dList.t_List, (string, int) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dData_dPair.t_Pair) -> (match mc4 with
  | B_dData_dList.C_List__x58__x58_ (dtb__617, dtb__618) -> (let sizes = (v_strSizeEntries (B_dData_dPair.v_firstOf dtb__617)) in (let st2 = (((((((v_posWalk mc0) mc3) sizes) mc2) B_dData_dList.C_List_Nil) (B_dData_dPair.v_secondOf dtb__617)) mc5) in ((((((v_posScanClauses mc0) mc1) mc2) mc3) dtb__618) st2)))
  | B_dData_dList.C_List_Nil -> mc5
  | _ -> failwith "DT: impossible branch"
))

# 887 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let rec v_posScanDefs = (fun (mc0 : (string, bool) B_dContainer_dHashMap.t_HashMap) (mc1 : (string, (Frontend_dRast.t_Pat B_dData_dList.t_List, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc2 : (string, int B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (mc3 : (string, (Frontend_dRast.t_Pat B_dData_dList.t_List, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc4 : ((string, int) B_dData_dPair.t_Pair B_dData_dList.t_List, (string, int) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dData_dPair.t_Pair) -> (match mc3 with
  | B_dData_dList.C_List__x58__x58_ (dtb__619, dtb__620) -> (((((v_posScanDefs mc0) mc1) mc2) dtb__620) ((((((v_posScanClauses mc0) mc1) mc2) (B_dData_dPair.v_firstOf dtb__619)) (B_dData_dPair.v_secondOf dtb__619)) mc4))
  | B_dData_dList.C_List_Nil -> mc4
  | _ -> failwith "DT: impossible branch"
))

# 904 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let rec v_posScanNamesGo = (fun (mc0 : (string, bool) B_dContainer_dHashMap.t_HashMap) (mc1 : (string, (Frontend_dRast.t_Pat B_dData_dList.t_List, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (mc2 : (string, int B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (mc3 : string B_dData_dList.t_List) (mc4 : ((string, int) B_dData_dPair.t_Pair B_dData_dList.t_List, (string, int) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dData_dPair.t_Pair) -> (match mc3 with
  | B_dData_dList.C_List__x58__x58_ (dtb__621, dtb__622) -> (((((v_posScanNamesGo mc0) mc1) mc2) dtb__622) ((((((v_posScanClauses mc0) B_dData_dList.C_List_Nil) mc2) dtb__621) ((v_clausesOfDefTbl dtb__621) mc1)) mc4))
  | B_dData_dList.C_List_Nil -> mc4
  | _ -> failwith "DT: impossible branch"
))

# 898 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_posScanNames = (fun (namesTbl : (string, bool) B_dContainer_dHashMap.t_HashMap) (defTbl : (string, (Frontend_dRast.t_Pat B_dData_dList.t_List, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (factsTbl : (string, int B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (work : string B_dData_dList.t_List) (st : ((string, int) B_dData_dPair.t_Pair B_dData_dList.t_List, (string, int) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dData_dPair.t_Pair) -> (let scanned = (((((v_posScanNamesGo namesTbl) defTbl) factsTbl) work) st) in { B_dData_dPair.f_Pair_first = (v_posNormalize (B_dData_dPair.v_firstOf scanned)); B_dData_dPair.f_Pair_second = (v_posNormalize (B_dData_dPair.v_secondOf scanned)) }))

# 915 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let rec v_computePosFacts = (fun (defs : (string, (Frontend_dRast.t_Pat B_dData_dList.t_List, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (fuel : int) (facts : (string, int) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (if (fuel <= 0) then facts else (((v_computePosFactsStep defs) fuel) facts)))
# 918 "Vuna/Compiler/Elab/Termination/Measure.vuna"
and v_computePosFactsStep = (fun (defs : (string, (Frontend_dRast.t_Pat B_dData_dList.t_List, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (fuel : int) (facts : (string, int) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (let namesTbl = (B_dContainer_dHashMap.v_ofNames (v_defNames defs)) in (let scanned = (((((v_posScanDefs namesTbl) defs) (v_posTblOf facts)) defs) { B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = B_dData_dList.C_List_Nil }) in (let scan = { B_dData_dPair.f_Pair_first = (v_posNormalize (B_dData_dPair.v_firstOf scanned)); B_dData_dPair.f_Pair_second = (v_posNormalize (B_dData_dPair.v_secondOf scanned)) } in (let fresh = ((v_posFilterTbl (B_dData_dPair.v_firstOf scan)) (v_posTblOf (B_dData_dPair.v_secondOf scan))) in (let merged = ((v_posUnionTbl facts) fresh) in (if ((v_posSetEqTbl facts) merged) then merged else (((v_computePosFacts defs) (fuel - 1)) merged))))))))

# 1310 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_unaryHofSpec = { f_HofSpec_hofLambdaArity = 1; f_HofSpec_hofElemParam = 0; f_HofSpec_hofListArg = 1 }

# 1313 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_foldLHofSpec = { f_HofSpec_hofLambdaArity = 2; f_HofSpec_hofElemParam = 1; f_HofSpec_hofListArg = 2 }

# 1316 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_foldRHofSpec = { f_HofSpec_hofLambdaArity = 2; f_HofSpec_hofElemParam = 0; f_HofSpec_hofListArg = 2 }

# 1319 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_hofSpecOf = (fun (mc0 : Frontend_dRast_dName.t_RName) -> (match mc0 with
  | Frontend_dRast_dName.C_RName_RGlobal (dtb__623, dtb__624) -> (if (dtb__623 = "Base.Data.List") then (if (if (if (if (dtb__624 = "map") then true else (dtb__624 = "filter")) then true else (dtb__624 = "concatMap")) then true else (dtb__624 = "mapMaybe")) then (B_dData_dMaybe.C_Maybe_Just (v_unaryHofSpec)) else (if (dtb__624 = "foldl") then (B_dData_dMaybe.C_Maybe_Just (v_foldLHofSpec)) else (if (dtb__624 = "foldr") then (B_dData_dMaybe.C_Maybe_Just (v_foldRHofSpec)) else B_dData_dMaybe.C_Maybe_Nothing))) else (if (if (dtb__623 = "Base.Data.Result") then true else (dtb__623 = "Vuna.Compiler.Base.Common")) then (if (dtb__624 = "traverse") then (B_dData_dMaybe.C_Maybe_Just (v_unaryHofSpec)) else B_dData_dMaybe.C_Maybe_Nothing) else B_dData_dMaybe.C_Maybe_Nothing))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
))

# 1332 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let rec v_nthName = (fun (mc0 : string B_dData_dList.t_List) (mc1 : int) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__625, dtb__626) -> (if (mc1 <= 0) then (B_dData_dMaybe.C_Maybe_Just (dtb__625)) else ((v_nthName dtb__626) (mc1 - 1)))
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 1337 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let rec v_peelLam = (fun (n : int) (e : Frontend_dRast.t_Expr) -> (if (n <= 0) then (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = e })) else (match e with
  | Frontend_dRast.C_Expr_ELam (dtb__627, dtb__628, dtb__629) -> (if ((B_dData_dList.v_length dtb__627) > n) then B_dData_dMaybe.C_Maybe_Nothing else (let nd_uscrut5 = ((v_peelLam (n - (B_dData_dList.v_length dtb__627))) dtb__628) in (match nd_uscrut5 with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb__630) -> (match dtb__630 with
  | { B_dData_dPair.f_Pair_first = dtb__631; B_dData_dPair.f_Pair_second = dtb__632 } -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = ((B_dData_dList.v_append ((B_dData_dList.v_map B_dData_dPair.v_firstOf) dtb__627)) dtb__631); B_dData_dPair.f_Pair_second = dtb__632 }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)))

# 1354 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_hofLambdaCall = (fun (mc0 : t_HofSpec) (mc1 : Frontend_dRast.t_Expr B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__633, dtb__634) -> (let nd_uscrut5 = ((v_peelLam (mc0).f_HofSpec_hofLambdaArity) dtb__633) in (match nd_uscrut5 with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb__635) -> (match dtb__635 with
  | { B_dData_dPair.f_Pair_first = dtb__636; B_dData_dPair.f_Pair_second = dtb__637 } -> (if ((B_dData_dList.v_length dtb__634) = (mc0).f_HofSpec_hofListArg) then (match ((v_nthExpr dtb__634) ((mc0).f_HofSpec_hofListArg - 1)) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__638) -> (match ((v_nthName dtb__636) (mc0).f_HofSpec_hofElemParam) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__639) -> (B_dData_dMaybe.C_Maybe_Just ({ f_HofCall_hofElemBinder = dtb__639; f_HofCall_hofListExpr = dtb__638; f_HofCall_hofSideArgs = dtb__634; f_HofCall_hofBody = dtb__637 }))
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

# 1370 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_extendElemSizes = (fun (mc0 : (string, (int, (int, int B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc1 : Frontend_dRast.t_Expr) (mc2 : string) -> (match mc1 with
  | Frontend_dRast.C_Expr_EVar (dtb__640, dtb__641) -> (match ((v_sizeOfVarStrict (Frontend_dRast_dName.v_rnameKey dtb__640)) mc0) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__642) -> (let nd_uscrut7 = dtb__642 in (match nd_uscrut7 with
  | { B_dData_dPair.f_Pair_first = dtb__643; B_dData_dPair.f_Pair_second = dtb__644 } -> (match dtb__644 with
  | { B_dData_dPair.f_Pair_first = dtb__645; B_dData_dPair.f_Pair_second = dtb__646 } -> (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = mc2; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = dtb__643; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = (dtb__645 + 1); B_dData_dPair.f_Pair_second = ((B_dData_dList.v_append dtb__646) (B_dData_dList.C_List__x58__x58_ (0, B_dData_dList.C_List_Nil))) } } }, mc0))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))
  | B_dData_dMaybe.C_Maybe_Nothing -> mc0
  | _ -> failwith "DT: impossible branch"
)
  | _ -> mc0
))

# 1383 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let rec v_edgeStrictGo = (fun (mc0 : string) (mc1 : string) (mc2 : (((string, string) B_dData_dPair.t_Pair, int) B_dData_dPair.t_Pair, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc3 : bool) (mc4 : bool) -> (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__647, dtb__648) -> (match dtb__647 with
  | { B_dData_dPair.f_Pair_first = dtb__649; B_dData_dPair.f_Pair_second = dtb__650 } -> (match dtb__649 with
  | { B_dData_dPair.f_Pair_first = dtb__651; B_dData_dPair.f_Pair_second = dtb__652 } -> (match dtb__651 with
  | { B_dData_dPair.f_Pair_first = dtb__653; B_dData_dPair.f_Pair_second = dtb__654 } -> (if (dtb__653 = mc0) then (if (dtb__654 = mc1) then (((((v_edgeStrictGo mc0) mc1) dtb__648) true) (if (dtb__652 > 0) then mc4 else false)) else (((((v_edgeStrictGo mc0) mc1) dtb__648) mc3) mc4)) else (((((v_edgeStrictGo mc0) mc1) dtb__648) mc3) mc4))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (if mc3 then mc4 else false)
  | _ -> failwith "DT: impossible branch"
))

# 1380 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_edgeStrict = (fun (f : string) (g : string) (edges : (((string, string) B_dData_dPair.t_Pair, int) B_dData_dPair.t_Pair, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (((((v_edgeStrictGo f) g) edges) false) true))

# 1397 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let rec v_edgeTargetsGo = (fun (mc0 : string) (mc1 : (((string, string) B_dData_dPair.t_Pair, int) B_dData_dPair.t_Pair, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__655, dtb__656) -> (match dtb__655 with
  | { B_dData_dPair.f_Pair_first = dtb__657; B_dData_dPair.f_Pair_second = dtb__658 } -> (match dtb__657 with
  | { B_dData_dPair.f_Pair_first = dtb__659; B_dData_dPair.f_Pair_second = dtb__660 } -> (match dtb__659 with
  | { B_dData_dPair.f_Pair_first = dtb__661; B_dData_dPair.f_Pair_second = dtb__662 } -> (if (dtb__661 = mc0) then (B_dData_dList.C_List__x58__x58_ (dtb__662, ((v_edgeTargetsGo mc0) dtb__656))) else ((v_edgeTargetsGo mc0) dtb__656))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 1394 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_edgeTargets = (fun (f : string) (edges : (((string, string) B_dData_dPair.t_Pair, int) B_dData_dPair.t_Pair, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (v_dedup ((v_edgeTargetsGo f) edges)))

# 1406 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let rec v_weakAdjGo = (fun (mc0 : string B_dData_dList.t_List) (mc1 : (((string, string) B_dData_dPair.t_Pair, int) B_dData_dPair.t_Pair, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc2 : string) (mc3 : string B_dData_dList.t_List) -> (match mc3 with
  | B_dData_dList.C_List__x58__x58_ (dtb__663, dtb__664) -> (if (((v_edgeStrict mc2) dtb__663) mc1) then ((((v_weakAdjGo mc0) mc1) mc2) dtb__664) else (B_dData_dList.C_List__x58__x58_ (dtb__663, ((((v_weakAdjGo mc0) mc1) mc2) dtb__664))))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 1403 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_weakAdj = (fun (comp : string B_dData_dList.t_List) (edges : (((string, string) B_dData_dPair.t_Pair, int) B_dData_dPair.t_Pair, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List) (f : string) -> ((((v_weakAdjGo comp) edges) f) ((v_edgeTargets f) edges)))

# 1414 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let rec v_weakReachFuel = (fun (fuel : int) (comp : string B_dData_dList.t_List) (edges : (((string, string) B_dData_dPair.t_Pair, int) B_dData_dPair.t_Pair, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List) (start : string) (frontier : string B_dData_dList.t_List) (visited : string B_dData_dList.t_List) -> (if (fuel <= 0) then true else (match frontier with
  | B_dData_dList.C_List_Nil -> false
  | B_dData_dList.C_List__x58__x58_ (dtb__665, dtb__666) -> (if (dtb__665 = start) then true else (if ((B_dData_dList.v_memName dtb__665) visited) then ((((((v_weakReachFuel (fuel - 1)) comp) edges) start) dtb__666) visited) else ((((((v_weakReachFuel (fuel - 1)) comp) edges) start) ((B_dData_dList.v_append dtb__666) (((v_weakAdj comp) edges) dtb__665))) (B_dData_dList.C_List__x58__x58_ (dtb__665, visited)))))
  | _ -> failwith "DT: impossible branch"
)))

# 1411 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_weakReach = (fun (comp : string B_dData_dList.t_List) (edges : (((string, string) B_dData_dPair.t_Pair, int) B_dData_dPair.t_Pair, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List) (start : string) (frontier : string B_dData_dList.t_List) (visited : string B_dData_dList.t_List) -> ((((((v_weakReachFuel 100000) comp) edges) start) frontier) visited))

# 1427 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let rec v_hasWeakCycleGo = (fun (mc0 : string B_dData_dList.t_List) (mc1 : (((string, string) B_dData_dPair.t_Pair, int) B_dData_dPair.t_Pair, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc2 : string B_dData_dList.t_List) -> (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__667, dtb__668) -> (if (((((v_weakReach mc0) mc1) dtb__667) (((v_weakAdj mc0) mc1) dtb__667)) (B_dData_dList.C_List__x58__x58_ (dtb__667, B_dData_dList.C_List_Nil))) then true else (((v_hasWeakCycleGo mc0) mc1) dtb__668))
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 1424 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_hasWeakCycle = (fun (comp : string B_dData_dList.t_List) (edges : (((string, string) B_dData_dPair.t_Pair, int) B_dData_dPair.t_Pair, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (((v_hasWeakCycleGo comp) edges) comp))

# 1434 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_relEqual = 0

# 1212 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_relOfArg = (fun (mc0 : int) (mc1 : Frontend_dRast.t_Expr) (mc2 : (string, (int, (int, int B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc3 : string B_dData_dList.t_List) (mc4 : (string, int B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc5 : string) (mc6 : (string, int B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (mc7 : string B_dData_dList.t_List) -> (match mc1 with
  | Frontend_dRast.C_Expr_EApp (dtb__669, dtb__670, dtb__671) -> (match dtb__669 with
  | Frontend_dRast.C_Expr_EVar (dtb__672, dtb__673) -> (if ((B_dData_dList.v_memName (Frontend_dRast_dName.v_rnameKey dtb__672)) mc3) then (match ((((v_findWrapField mc0) dtb__670) mc2) 0) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__674) -> (B_dData_dMaybe.C_Maybe_Just (dtb__674))
  | B_dData_dMaybe.C_Maybe_Nothing -> (if (((v_sameCtorApp mc0) dtb__670) mc2) then (B_dData_dMaybe.C_Maybe_Just (v_relEqual)) else B_dData_dMaybe.C_Maybe_Nothing)
  | _ -> failwith "DT: impossible branch"
) else (if ((v_projHas (Frontend_dRast_dName.v_rnameKey dtb__672)) mc4) then (((v_projRel mc0) dtb__670) mc2) else ((((((v_arithRel mc0) mc1) mc2) mc5) mc6) mc7)))
  | _ -> ((((((v_arithRel mc0) mc1) mc2) mc5) mc6) mc7)
)
  | Frontend_dRast.C_Expr_EField (dtb__675, dtb__676, dtb__677) -> (let nd_uscrut11 = (((v_sizeOfExpr mc4) mc2) (Frontend_dRast.C_Expr_EField (dtb__675, dtb__676, dtb__677))) in (match nd_uscrut11 with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb__678) -> (match dtb__678 with
  | { B_dData_dPair.f_Pair_first = dtb__679; B_dData_dPair.f_Pair_second = dtb__680 } -> (match dtb__680 with
  | { B_dData_dPair.f_Pair_first = dtb__681; B_dData_dPair.f_Pair_second = dtb__682 } -> (if (dtb__679 = mc0) then (if (dtb__681 > 0) then (B_dData_dMaybe.C_Maybe_Just (1)) else (B_dData_dMaybe.C_Maybe_Just (0))) else B_dData_dMaybe.C_Maybe_Nothing)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))
  | Frontend_dRast.C_Expr_EVar (dtb__683, dtb__684) -> (match ((v_sizeOfVarStrict (Frontend_dRast_dName.v_rnameKey dtb__683)) mc2) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__685) -> (let nd_uscrut12 = dtb__685 in (match nd_uscrut12 with
  | { B_dData_dPair.f_Pair_first = dtb__686; B_dData_dPair.f_Pair_second = dtb__687 } -> (match dtb__687 with
  | { B_dData_dPair.f_Pair_first = dtb__688; B_dData_dPair.f_Pair_second = dtb__689 } -> (if (dtb__686 = mc0) then (if (dtb__688 > 0) then (B_dData_dMaybe.C_Maybe_Just (1)) else (B_dData_dMaybe.C_Maybe_Just (0))) else B_dData_dMaybe.C_Maybe_Nothing)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
))

# 1235 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_argRel = (fun (p : int) (args : Frontend_dRast.t_Expr B_dData_dList.t_List) (sizes : (string, (int, (int, int B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctors : string B_dData_dList.t_List) (projs : (string, int B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (caller : string) (facts : (string, int B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (region : string B_dData_dList.t_List) -> (match ((v_nthExpr args) p) with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb__690) -> ((((((((v_relOfArg p) dtb__690) sizes) ctors) projs) caller) facts) region)
  | _ -> failwith "DT: impossible branch"
))

# 1437 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_relStrictSub = 1

# 1440 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_relStrictMinus = 4

# 1443 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_relUnknownSize = (-1)

# 1446 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_relMissingGuard = (-2)

# 1449 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_relNoRelation = (-3)

# 1452 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_relOtherPosition = (-4)

# 1267 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_hintArith = (fun (mc0 : int) (mc1 : Frontend_dRast.t_Expr B_dData_dList.t_List) (mc2 : (string, (int, (int, int B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc3 : int) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__691, dtb__692) -> (match dtb__691 with
  | Frontend_dRast.C_Expr_EVar (dtb__693, dtb__694) -> (match dtb__692 with
  | B_dData_dList.C_List__x58__x58_ (dtb__695, dtb__696) -> (match dtb__695 with
  | Frontend_dRast.C_Expr_EInt (dtb__697, dtb__698) -> (match dtb__696 with
  | B_dData_dList.C_List_Nil -> (if (dtb__697 <= 0) then (B_dData_dMaybe.C_Maybe_Just (v_relNoRelation)) else (match ((v_sizeOfVarStrict (Frontend_dRast_dName.v_rnameKey dtb__693)) mc2) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__699) -> (let nd_uscrut17 = dtb__699 in (match nd_uscrut17 with
  | { B_dData_dPair.f_Pair_first = dtb__700; B_dData_dPair.f_Pair_second = dtb__701 } -> (match dtb__701 with
  | { B_dData_dPair.f_Pair_first = dtb__702; B_dData_dPair.f_Pair_second = dtb__703 } -> (if (dtb__700 = mc0) then (if (dtb__702 = 0) then (B_dData_dMaybe.C_Maybe_Just (mc3)) else (B_dData_dMaybe.C_Maybe_Just (v_relNoRelation))) else (B_dData_dMaybe.C_Maybe_Just (v_relOtherPosition)))
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

# 1455 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_relAscending = (-5)

# 1243 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_argRelHint = (fun (p : int) (args : Frontend_dRast.t_Expr B_dData_dList.t_List) (sizes : (string, (int, (int, int B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctors : string B_dData_dList.t_List) -> (match ((v_nthExpr args) p) with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb__704) -> (let nd_uscrut6 = dtb__704 in (match nd_uscrut6 with
  | Frontend_dRast.C_Expr_EApp (dtb__705, dtb__706, dtb__707) -> (match dtb__705 with
  | Frontend_dRast.C_Expr_EVar (dtb__708, dtb__709) -> (if (v_isSubOpName (Frontend_dRast_dName.v_rnameKey dtb__708)) then ((((v_hintArith p) dtb__706) sizes) v_relMissingGuard) else (if (v_isAddOpName (Frontend_dRast_dName.v_rnameKey dtb__708)) then ((((v_hintArith p) dtb__706) sizes) v_relAscending) else (B_dData_dMaybe.C_Maybe_Just (v_relNoRelation))))
  | _ -> (B_dData_dMaybe.C_Maybe_Just (v_relNoRelation))
)
  | Frontend_dRast.C_Expr_EVar (dtb__710, dtb__711) -> (if ((B_dData_dList.v_memName (Frontend_dRast_dName.v_rnameKey dtb__710)) ctors) then (B_dData_dMaybe.C_Maybe_Just (v_relNoRelation)) else (match ((v_sizeOfVarStrict (Frontend_dRast_dName.v_rnameKey dtb__710)) sizes) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__712) -> (let nd_uscrut11 = dtb__712 in (match nd_uscrut11 with
  | { B_dData_dPair.f_Pair_first = dtb__713; B_dData_dPair.f_Pair_second = dtb__714 } -> (match dtb__714 with
  | { B_dData_dPair.f_Pair_first = dtb__715; B_dData_dPair.f_Pair_second = dtb__716 } -> (if (dtb__713 = p) then (B_dData_dMaybe.C_Maybe_Just (v_relNoRelation)) else (B_dData_dMaybe.C_Maybe_Just (v_relOtherPosition)))
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

# 1459 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_relText = (fun (m : int) -> (if (m = v_relStrictSub) then "strict subterm" else (if (m = v_relStrictMinus) then "decreases by a constant, with the non-negativity guard proven" else (if (m = v_relMissingGuard) then "decreases by a constant, but the non-negativity guard is missing" else (if (m = v_relUnknownSize) then "no known size (not a subterm of a parameter)" else (if (m = v_relOtherPosition) then "decreases a different parameter" else (if (m = v_relEqual) then "unchanged" else (if (m = v_relAscending) then "increases instead of decreasing (ascending counters are not supported)" else "no size relation"))))))))

# 1478 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_isDescent = (fun (m : int) -> (m > 0))

# 1481 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let rec v_filterModes = (fun (mc0 : int B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__717, dtb__718) -> (if (v_isDescent dtb__717) then (B_dData_dList.C_List__x58__x58_ (dtb__717, (v_filterModes dtb__718))) else (v_filterModes dtb__718))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))
