open Vuna_runtime
type t_HofSpec = { f_HofSpec_hofLambdaArity : int; f_HofSpec_hofElemParam : int; f_HofSpec_hofListArg : int }
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
  | { B_dData_dPair.f_Pair_first = dtb__12; B_dData_dPair.f_Pair_second = dtb__13 } -> (match ((((B_dContainer_dHashMap.v_lookup B_dData_dString.v_Hashable_uString) B_dData_dString.v_Eq_uString) dtb__12) mc1) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__14) -> ((v_posTblOfGo dtb__11) (((((B_dContainer_dHashMap.v_insert B_dData_dString.v_Hashable_uString) B_dData_dString.v_Eq_uString) dtb__12) (B_dData_dList.C_List__x58__x58_ (dtb__13, dtb__14))) mc1))
  | B_dData_dMaybe.C_Maybe_Nothing -> ((v_posTblOfGo dtb__11) (((((B_dContainer_dHashMap.v_insert B_dData_dString.v_Hashable_uString) B_dData_dString.v_Eq_uString) dtb__12) (B_dData_dList.C_List__x58__x58_ (dtb__13, B_dData_dList.C_List_Nil))) mc1))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> mc1
  | _ -> failwith "DT: impossible branch"
))

# 44 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_posTblOf = (fun (xs : (string, int) B_dData_dPair.t_Pair B_dData_dList.t_List) -> ((v_posTblOfGo xs) (((B_dContainer_dHashMap.v_fromList B_dData_dString.v_Hashable_uString) B_dData_dString.v_Eq_uString) B_dData_dList.C_List_Nil)))

# 60 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let rec v_memInt = (fun (mc0 : int) (mc1 : int B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__15, dtb__16) -> (if (mc0 = dtb__15) then true else ((v_memInt mc0) dtb__16))
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 54 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_posHasTbl = (fun (f : string) (i : int) (tbl : (string, int B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) -> (match ((((B_dContainer_dHashMap.v_lookup B_dData_dString.v_Hashable_uString) B_dData_dString.v_Eq_uString) f) tbl) with
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
  | _ -> (v_funDeclsOf dtb__39)
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 108 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let rec v_lookupGroup = (fun (mc0 : string) (mc1 : (string, (Frontend_dRast.t_Pat B_dData_dList.t_List, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__44, dtb__45) -> (match dtb__44 with
  | { B_dData_dPair.f_Pair_first = dtb__46; B_dData_dPair.f_Pair_second = dtb__47 } -> (if (dtb__46 = mc0) then (B_dData_dMaybe.C_Maybe_Just (dtb__47)) else ((v_lookupGroup mc0) dtb__45))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 112 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let rec v_replaceGroup = (fun (mc0 : string) (mc1 : (Frontend_dRast.t_Pat B_dData_dList.t_List, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc2 : (string, (Frontend_dRast.t_Pat B_dData_dList.t_List, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__48, dtb__49) -> (match dtb__48 with
  | { B_dData_dPair.f_Pair_first = dtb__50; B_dData_dPair.f_Pair_second = dtb__51 } -> (if (dtb__50 = mc0) then (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__50; B_dData_dPair.f_Pair_second = mc1 }, dtb__49)) else (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__50; B_dData_dPair.f_Pair_second = dtb__51 }, (((v_replaceGroup mc0) mc1) dtb__49))))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 133 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let rec v_groupDefsGo = (fun (mc0 : (string, (Frontend_dRast.t_Pat B_dData_dList.t_List, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (mc1 : string B_dData_dList.t_List) (mc2 : (string, (Frontend_dRast.t_Pat B_dData_dList.t_List, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__52, dtb__53) -> (match dtb__52 with
  | { B_dData_dPair.f_Pair_first = dtb__54; B_dData_dPair.f_Pair_second = dtb__55 } -> (match ((((B_dContainer_dHashMap.v_lookup B_dData_dString.v_Hashable_uString) B_dData_dString.v_Eq_uString) dtb__54) mc0) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__56) -> (((v_groupDefsGo (((((B_dContainer_dHashMap.v_insert B_dData_dString.v_Hashable_uString) B_dData_dString.v_Eq_uString) dtb__54) (B_dData_dList.C_List__x58__x58_ (dtb__55, dtb__56))) mc0)) mc1) dtb__53)
  | B_dData_dMaybe.C_Maybe_Nothing -> (((v_groupDefsGo (((((B_dContainer_dHashMap.v_insert B_dData_dString.v_Hashable_uString) B_dData_dString.v_Eq_uString) dtb__54) (B_dData_dList.C_List__x58__x58_ (dtb__55, B_dData_dList.C_List_Nil))) mc0)) (B_dData_dList.C_List__x58__x58_ (dtb__54, mc1))) dtb__53)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> { B_dData_dPair.f_Pair_first = mc0; B_dData_dPair.f_Pair_second = mc1 }
  | _ -> failwith "DT: impossible branch"
))

# 117 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_groupDefs = (fun (decls : Frontend_dRast.t_Decl B_dData_dList.t_List) -> (let stepped = (((v_groupDefsGo (((B_dContainer_dHashMap.v_fromList B_dData_dString.v_Hashable_uString) B_dData_dString.v_Eq_uString) B_dData_dList.C_List_Nil)) B_dData_dList.C_List_Nil) (v_funDeclsOf decls)) in (let tbl = (B_dData_dPair.v_firstOf stepped) in (let order = (B_dData_dPair.v_secondOf stepped) in ((B_dData_dList.v_map (fun (n : string) -> { B_dData_dPair.f_Pair_first = n; B_dData_dPair.f_Pair_second = (match ((((B_dContainer_dHashMap.v_lookup B_dData_dString.v_Hashable_uString) B_dData_dString.v_Eq_uString) n) tbl) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__57) -> (B_dData_dList.v_reverse dtb__57)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
) })) (B_dData_dList.v_reverse order))))))

# 140 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_defNames = (fun (defs : (string, (Frontend_dRast.t_Pat B_dData_dList.t_List, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) -> ((B_dData_dList.v_map B_dData_dPair.v_firstOf) defs))

# 143 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let rec v_clausesOfDef = (fun (mc0 : string) (mc1 : (string, (Frontend_dRast.t_Pat B_dData_dList.t_List, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__58, dtb__59) -> (match dtb__58 with
  | { B_dData_dPair.f_Pair_first = dtb__60; B_dData_dPair.f_Pair_second = dtb__61 } -> (if (dtb__60 = mc0) then dtb__61 else ((v_clausesOfDef mc0) dtb__59))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 148 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_clausesOfDefTbl = (fun (name : string) (tbl : (string, (Frontend_dRast.t_Pat B_dData_dList.t_List, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) -> (match ((((B_dContainer_dHashMap.v_lookup B_dData_dString.v_Hashable_uString) B_dData_dString.v_Eq_uString) name) tbl) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__62) -> dtb__62
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 154 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let rec v_defArity = (fun (mc0 : (Frontend_dRast.t_Pat B_dData_dList.t_List, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__63, dtb__64) -> ((v_maxInt (B_dData_dList.v_length (B_dData_dPair.v_firstOf dtb__63))) (v_defArity dtb__64))
  | B_dData_dList.C_List_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))

# 158 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let rec v_maxArityOf = (fun (mc0 : string B_dData_dList.t_List) (mc1 : (string, (Frontend_dRast.t_Pat B_dData_dList.t_List, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__65, dtb__66) -> ((v_maxInt (v_defArity ((v_clausesOfDefTbl dtb__65) mc1))) ((v_maxArityOf dtb__66) mc1))
  | B_dData_dList.C_List_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))

# 172 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_ctorNameOf = (fun (mc0 : Frontend_dRast.t_Ctor) -> (match mc0 with
  | { Frontend_dRast.f_Ctor_ctorName = dtb__67; Frontend_dRast.f_Ctor_ctorType = dtb__68; Frontend_dRast.f_Ctor_ctorArity = dtb__69; Frontend_dRast.f_Ctor_ctorSpan = dtb__70 } -> dtb__67
  | _ -> failwith "DT: impossible branch"
))

# 163 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let rec v_ctorNamesOf = (fun (mc0 : Frontend_dRast.t_Decl B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__71, dtb__72) -> (match dtb__71 with
  | Frontend_dRast.C_Decl_DData (dtb__73, dtb__74, dtb__75, dtb__76, dtb__77, dtb__78, dtb__79, dtb__80, dtb__81) -> ((B_dData_dList.v_append ((B_dData_dList.v_map v_ctorNameOf) dtb__76)) (v_ctorNamesOf dtb__72))
  | Frontend_dRast.C_Decl_DRecord (dtb__82, dtb__83, dtb__84, dtb__85, dtb__86, dtb__87, dtb__88, dtb__89) -> (B_dData_dList.C_List__x58__x58_ (dtb__82, (v_ctorNamesOf dtb__72)))
  | _ -> (v_ctorNamesOf dtb__72)
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 175 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let rec v_patSizeStrict = (fun (mc0 : Frontend_dRast.t_Pat) (mc1 : int) (mc2 : int B_dData_dList.t_List) (mc3 : (string, (int, (int, int B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc0 with
  | Frontend_dRast.C_Pat_PRecord (dtb__90, dtb__91, dtb__92) -> (((((v_fieldsSizeStrict dtb__91) mc1) mc2) 0) mc3)
  | Frontend_dRast.C_Pat_PCon (dtb__93, dtb__94, dtb__95) -> (((((v_patsSizeStrict dtb__94) mc1) mc2) 0) mc3)
  | Frontend_dRast.C_Pat_PWild (dtb__96) -> mc3
  | Frontend_dRast.C_Pat_PVar (dtb__97, dtb__98) -> (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__97; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = mc1; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = (B_dData_dList.v_length mc2); B_dData_dPair.f_Pair_second = mc2 } } }, mc3))
  | Frontend_dRast.C_Pat_PAs (dtb__99, dtb__100, dtb__101) -> ((((v_patSizeStrict dtb__100) mc1) mc2) (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__99; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = mc1; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = (B_dData_dList.v_length mc2); B_dData_dPair.f_Pair_second = mc2 } } }, mc3)))
  | _ -> mc3
))
# 185 "Vuna/Compiler/Elab/Termination/Measure.vuna"
and v_patsSizeStrict = (fun (mc0 : Frontend_dRast.t_Pat B_dData_dList.t_List) (mc1 : int) (mc2 : int B_dData_dList.t_List) (mc3 : int) (mc4 : (string, (int, (int, int B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__102, dtb__103) -> (((((v_patsSizeStrict dtb__103) mc1) mc2) (mc3 + 1)) ((((v_patSizeStrict dtb__102) mc1) ((B_dData_dList.v_append mc2) (B_dData_dList.C_List__x58__x58_ (mc3, B_dData_dList.C_List_Nil)))) mc4))
  | B_dData_dList.C_List_Nil -> mc4
  | _ -> failwith "DT: impossible branch"
))
# 190 "Vuna/Compiler/Elab/Termination/Measure.vuna"
and v_fieldsSizeStrict = (fun (mc0 : (string, Frontend_dRast.t_Pat) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc1 : int) (mc2 : int B_dData_dList.t_List) (mc3 : int) (mc4 : (string, (int, (int, int B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__104, dtb__105) -> (match dtb__104 with
  | { B_dData_dPair.f_Pair_first = dtb__106; B_dData_dPair.f_Pair_second = dtb__107 } -> (((((v_fieldsSizeStrict dtb__105) mc1) mc2) (mc3 + 1)) ((((v_patSizeStrict dtb__107) mc1) ((B_dData_dList.v_append mc2) (B_dData_dList.C_List__x58__x58_ (mc3, B_dData_dList.C_List_Nil)))) mc4))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> mc4
  | _ -> failwith "DT: impossible branch"
))

# 198 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let rec v_strSizeEntriesGo = (fun (mc0 : Frontend_dRast.t_Pat B_dData_dList.t_List) (mc1 : int) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__108, dtb__109) -> ((B_dData_dList.v_append ((((v_patSizeStrict dtb__108) mc1) B_dData_dList.C_List_Nil) B_dData_dList.C_List_Nil)) ((v_strSizeEntriesGo dtb__109) (mc1 + 1)))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 195 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_strSizeEntries = (fun (pats : Frontend_dRast.t_Pat B_dData_dList.t_List) -> ((v_strSizeEntriesGo pats) 0))

# 223 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let rec v_sizeOfVarStrict = (fun (mc0 : string) (mc1 : (string, (int, (int, int B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__110, dtb__111) -> (match dtb__110 with
  | { B_dData_dPair.f_Pair_first = dtb__112; B_dData_dPair.f_Pair_second = dtb__113 } -> (if (dtb__112 = mc0) then (B_dData_dMaybe.C_Maybe_Just (dtb__113)) else ((v_sizeOfVarStrict mc0) dtb__111))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 202 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let rec v_extendSizesStrict = (fun (mc0 : (string, (int, (int, int B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc1 : Frontend_dRast.t_Expr) (mc2 : Frontend_dRast.t_Pat) -> (match mc1 with
  | Frontend_dRast.C_Expr_EVar (dtb__114, dtb__115) -> (match ((v_sizeOfVarStrict (Frontend_dRast_dName.v_rnameKey dtb__114)) mc0) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__116) -> (let nd_uscrut7 = dtb__116 in (match nd_uscrut7 with
  | { B_dData_dPair.f_Pair_first = dtb__117; B_dData_dPair.f_Pair_second = dtb__118 } -> (match dtb__118 with
  | { B_dData_dPair.f_Pair_first = dtb__119; B_dData_dPair.f_Pair_second = dtb__120 } -> (match mc2 with
  | Frontend_dRast.C_Pat_PVar (dtb__121, dtb__122) -> (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__121; B_dData_dPair.f_Pair_second = dtb__116 }, mc0))
  | Frontend_dRast.C_Pat_PAs (dtb__123, dtb__124, dtb__125) -> (((v_extendSizesStrict (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__123; B_dData_dPair.f_Pair_second = dtb__116 }, mc0))) (Frontend_dRast.C_Expr_EVar (dtb__114, dtb__115))) dtb__124)
  | Frontend_dRast.C_Pat_PCon (dtb__126, dtb__127, dtb__128) -> ((B_dData_dList.v_append mc0) (((((v_patsSizeStrict dtb__127) dtb__117) dtb__120) 0) B_dData_dList.C_List_Nil))
  | Frontend_dRast.C_Pat_PRecord (dtb__129, dtb__130, dtb__131) -> ((B_dData_dList.v_append mc0) (((((v_fieldsSizeStrict dtb__130) dtb__117) dtb__120) 0) B_dData_dList.C_List_Nil))
  | _ -> mc0
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))
  | B_dData_dMaybe.C_Maybe_Nothing -> mc0
  | _ -> failwith "DT: impossible branch"
)
  | _ -> mc0
))

# 219 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let rec v_extendByBinds = (fun (mc0 : (Frontend_dRast.t_Pat, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc1 : (string, (int, (int, int B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__132, dtb__133) -> (match dtb__132 with
  | { B_dData_dPair.f_Pair_first = dtb__134; B_dData_dPair.f_Pair_second = dtb__135 } -> ((v_extendByBinds dtb__133) (((v_extendSizesStrict mc1) dtb__135) dtb__134))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> mc1
  | _ -> failwith "DT: impossible branch"
))

# 248 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_opBaseName = (fun (name : string) -> (B_dData_dPair.v_secondOf (Base_dSource.v_splitLastDot (Base_dSource.v_splitOnDot name))))

# 272 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_varOfExpr = (fun (mc0 : Frontend_dRast.t_Expr) -> (match mc0 with
  | Frontend_dRast.C_Expr_EVar (dtb__136, dtb__137) -> (B_dData_dMaybe.C_Maybe_Just ((Frontend_dRast_dName.v_rnameKey dtb__136)))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
))

# 251 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_guardLE = (fun (mc0 : Frontend_dRast.t_Expr B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__138, dtb__139) -> (match dtb__139 with
  | B_dData_dList.C_List__x58__x58_ (dtb__140, dtb__141) -> (match dtb__141 with
  | B_dData_dList.C_List_Nil -> (match dtb__140 with
  | Frontend_dRast.C_Expr_EInt (dtb__142, dtb__143) -> (if (dtb__142 = 0) then (v_varOfExpr dtb__138) else B_dData_dMaybe.C_Maybe_Nothing)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
))

# 258 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_guardGE = (fun (mc0 : Frontend_dRast.t_Expr B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__144, dtb__145) -> (match dtb__145 with
  | B_dData_dList.C_List__x58__x58_ (dtb__146, dtb__147) -> (match dtb__147 with
  | B_dData_dList.C_List_Nil -> (match dtb__144 with
  | Frontend_dRast.C_Expr_EInt (dtb__148, dtb__149) -> (if (dtb__148 = 0) then (v_varOfExpr dtb__146) else B_dData_dMaybe.C_Maybe_Nothing)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
))

# 265 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_guardLT = (fun (mc0 : Frontend_dRast.t_Expr B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__150, dtb__151) -> (match dtb__151 with
  | B_dData_dList.C_List__x58__x58_ (dtb__152, dtb__153) -> (match dtb__153 with
  | B_dData_dList.C_List_Nil -> (match dtb__152 with
  | Frontend_dRast.C_Expr_EInt (dtb__154, dtb__155) -> (if (dtb__154 = 1) then (v_varOfExpr dtb__150) else B_dData_dMaybe.C_Maybe_Nothing)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
))

# 231 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_guardPosVar = (fun (e : Frontend_dRast.t_Expr) -> (let nd_uscrut1 = e in (match nd_uscrut1 with
  | Frontend_dRast.C_Expr_EApp (dtb__156, dtb__157, dtb__158) -> (match dtb__156 with
  | Frontend_dRast.C_Expr_EVar (dtb__159, dtb__160) -> (if ((v_opBaseName (Frontend_dRast_dName.v_rnameKey dtb__159)) = "le") then (v_guardLE dtb__157) else (if ((v_opBaseName (Frontend_dRast_dName.v_rnameKey dtb__159)) = "ge") then (v_guardGE dtb__157) else (if ((v_opBaseName (Frontend_dRast_dName.v_rnameKey dtb__159)) = "lt") then (v_guardLT dtb__157) else (if ((v_opBaseName (Frontend_dRast_dName.v_rnameKey dtb__159)) = "<=") then (v_guardLE dtb__157) else (if ((v_opBaseName (Frontend_dRast_dName.v_rnameKey dtb__159)) = ">=") then (v_guardGE dtb__157) else (if ((v_opBaseName (Frontend_dRast_dName.v_rnameKey dtb__159)) = "<") then (v_guardLT dtb__157) else B_dData_dMaybe.C_Maybe_Nothing))))))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)))

# 278 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let rec v_localClauseBinds = (fun (mc0 : (Frontend_dRast.t_Pat B_dData_dList.t_List, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__161, dtb__162) -> (match dtb__161 with
  | { B_dData_dPair.f_Pair_first = dtb__163; B_dData_dPair.f_Pair_second = dtb__164 } -> (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = (Frontend_dRast.C_Pat_PWild ((Frontend_dRast.v_exprSpan dtb__164))); B_dData_dPair.f_Pair_second = dtb__164 }, (v_localClauseBinds dtb__162)))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 285 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_guardUnion = (fun (a : string B_dData_dList.t_List) (b : string B_dData_dList.t_List) -> (v_dedup ((B_dData_dList.v_append a) b)))

# 288 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let rec v_guardInter = (fun (mc0 : string B_dData_dList.t_List) (mc1 : string B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__165, dtb__166) -> (if ((B_dData_dList.v_memName dtb__165) mc1) then (B_dData_dList.C_List__x58__x58_ (dtb__165, ((v_guardInter dtb__166) mc1))) else ((v_guardInter dtb__166) mc1))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 293 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_guardThenPosAtom = (fun (mc0 : string) (mc1 : Frontend_dRast.t_Expr B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__167, dtb__168) -> (match dtb__168 with
  | B_dData_dList.C_List__x58__x58_ (dtb__169, dtb__170) -> (match dtb__170 with
  | B_dData_dList.C_List_Nil -> (match dtb__169 with
  | Frontend_dRast.C_Expr_EInt (dtb__171, dtb__172) -> (if (if (mc0 = "gt") then true else (mc0 = ">")) then (if (dtb__171 >= 0) then (v_varOfExpr dtb__167) else B_dData_dMaybe.C_Maybe_Nothing) else (if (if (mc0 = "ge") then true else (mc0 = ">=")) then (if (dtb__171 >= 1) then (v_varOfExpr dtb__167) else B_dData_dMaybe.C_Maybe_Nothing) else B_dData_dMaybe.C_Maybe_Nothing))
  | _ -> (match dtb__167 with
  | Frontend_dRast.C_Expr_EInt (dtb__173, dtb__174) -> (if (if (mc0 = "lt") then true else (mc0 = "<")) then (if (dtb__173 >= 0) then (v_varOfExpr dtb__169) else B_dData_dMaybe.C_Maybe_Nothing) else (if (if (mc0 = "le") then true else (mc0 = "<=")) then (if (dtb__173 >= 1) then (v_varOfExpr dtb__169) else B_dData_dMaybe.C_Maybe_Nothing) else B_dData_dMaybe.C_Maybe_Nothing))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
))

# 314 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_guardElsePosAtom = (fun (mc0 : string) (mc1 : Frontend_dRast.t_Expr B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__175, dtb__176) -> (match dtb__176 with
  | B_dData_dList.C_List__x58__x58_ (dtb__177, dtb__178) -> (match dtb__178 with
  | B_dData_dList.C_List_Nil -> (match dtb__177 with
  | Frontend_dRast.C_Expr_EInt (dtb__179, dtb__180) -> (if (if (mc0 = "le") then true else (mc0 = "<=")) then (if (dtb__179 >= 0) then (v_varOfExpr dtb__175) else B_dData_dMaybe.C_Maybe_Nothing) else (if (if (mc0 = "lt") then true else (mc0 = "<")) then (if (dtb__179 >= 1) then (v_varOfExpr dtb__175) else B_dData_dMaybe.C_Maybe_Nothing) else B_dData_dMaybe.C_Maybe_Nothing))
  | _ -> (match dtb__175 with
  | Frontend_dRast.C_Expr_EInt (dtb__181, dtb__182) -> (if (if (mc0 = "ge") then true else (mc0 = ">=")) then (if (dtb__181 >= 0) then (v_varOfExpr dtb__177) else B_dData_dMaybe.C_Maybe_Nothing) else (if (if (mc0 = "gt") then true else (mc0 = ">")) then (if (dtb__181 >= 1) then (v_varOfExpr dtb__177) else B_dData_dMaybe.C_Maybe_Nothing) else B_dData_dMaybe.C_Maybe_Nothing))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
))

# 335 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let rec v_guardThenPosVars = (fun (mc0 : Frontend_dRast.t_Expr) -> (match mc0 with
  | Frontend_dRast.C_Expr_EApp (dtb__183, dtb__184, dtb__185) -> (match dtb__183 with
  | Frontend_dRast.C_Expr_EVar (dtb__186, dtb__187) -> (let opn = (v_opBaseName (Frontend_dRast_dName.v_rnameKey dtb__186)) in (if (opn = "&&") then (let nd_uscrut7 = dtb__184 in (match nd_uscrut7 with
  | B_dData_dList.C_List__x58__x58_ (dtb__188, dtb__189) -> (match dtb__189 with
  | B_dData_dList.C_List__x58__x58_ (dtb__190, dtb__191) -> (match dtb__191 with
  | B_dData_dList.C_List_Nil -> ((v_guardUnion (v_guardThenPosVars dtb__188)) (v_guardThenPosVars dtb__190))
  | _ -> B_dData_dList.C_List_Nil
)
  | _ -> B_dData_dList.C_List_Nil
)
  | _ -> B_dData_dList.C_List_Nil
)) else (if (opn = "||") then (let nd_uscrut7 = dtb__184 in (match nd_uscrut7 with
  | B_dData_dList.C_List__x58__x58_ (dtb__192, dtb__193) -> (match dtb__193 with
  | B_dData_dList.C_List__x58__x58_ (dtb__194, dtb__195) -> (match dtb__195 with
  | B_dData_dList.C_List_Nil -> ((v_guardInter (v_guardThenPosVars dtb__192)) (v_guardThenPosVars dtb__194))
  | _ -> B_dData_dList.C_List_Nil
)
  | _ -> B_dData_dList.C_List_Nil
)
  | _ -> B_dData_dList.C_List_Nil
)) else (match ((v_guardThenPosAtom opn) dtb__184) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__196) -> (B_dData_dList.C_List__x58__x58_ (dtb__196, B_dData_dList.C_List_Nil))
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))))
  | _ -> B_dData_dList.C_List_Nil
)
  | _ -> B_dData_dList.C_List_Nil
))

# 355 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let rec v_guardElsePosVars = (fun (mc0 : Frontend_dRast.t_Expr) -> (match mc0 with
  | Frontend_dRast.C_Expr_EApp (dtb__197, dtb__198, dtb__199) -> (match dtb__197 with
  | Frontend_dRast.C_Expr_EVar (dtb__200, dtb__201) -> (let opn = (v_opBaseName (Frontend_dRast_dName.v_rnameKey dtb__200)) in (if (opn = "&&") then (let nd_uscrut7 = dtb__198 in (match nd_uscrut7 with
  | B_dData_dList.C_List__x58__x58_ (dtb__202, dtb__203) -> (match dtb__203 with
  | B_dData_dList.C_List__x58__x58_ (dtb__204, dtb__205) -> (match dtb__205 with
  | B_dData_dList.C_List_Nil -> ((v_guardInter (v_guardElsePosVars dtb__202)) (v_guardElsePosVars dtb__204))
  | _ -> B_dData_dList.C_List_Nil
)
  | _ -> B_dData_dList.C_List_Nil
)
  | _ -> B_dData_dList.C_List_Nil
)) else (if (opn = "||") then (let nd_uscrut7 = dtb__198 in (match nd_uscrut7 with
  | B_dData_dList.C_List__x58__x58_ (dtb__206, dtb__207) -> (match dtb__207 with
  | B_dData_dList.C_List__x58__x58_ (dtb__208, dtb__209) -> (match dtb__209 with
  | B_dData_dList.C_List_Nil -> ((v_guardUnion (v_guardElsePosVars dtb__206)) (v_guardElsePosVars dtb__208))
  | _ -> B_dData_dList.C_List_Nil
)
  | _ -> B_dData_dList.C_List_Nil
)
  | _ -> B_dData_dList.C_List_Nil
)) else (match ((v_guardElsePosAtom opn) dtb__198) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__210) -> (B_dData_dList.C_List__x58__x58_ (dtb__210, B_dData_dList.C_List_Nil))
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))))
  | _ -> B_dData_dList.C_List_Nil
)
  | _ -> B_dData_dList.C_List_Nil
))

# 396 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_posMarkPos = (fun (f : string) (i : int) (st : ((string, int) B_dData_dPair.t_Pair B_dData_dList.t_List, (string, int) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dData_dPair.t_Pair) -> { B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = f; B_dData_dPair.f_Pair_second = i }, (B_dData_dPair.v_firstOf st))); B_dData_dPair.f_Pair_second = (B_dData_dPair.v_secondOf st) })

# 399 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_posMarkNeg = (fun (f : string) (i : int) (st : ((string, int) B_dData_dPair.t_Pair B_dData_dList.t_List, (string, int) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dData_dPair.t_Pair) -> { B_dData_dPair.f_Pair_first = (B_dData_dPair.v_firstOf st); B_dData_dPair.f_Pair_second = (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = f; B_dData_dPair.f_Pair_second = i }, (B_dData_dPair.v_secondOf st))) })

# 412 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let rec v_dedupInts = (fun (mc0 : int B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__211, dtb__212) -> (if ((v_memInt dtb__211) dtb__212) then (v_dedupInts dtb__212) else (B_dData_dList.C_List__x58__x58_ (dtb__211, (v_dedupInts dtb__212))))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 409 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_posEntryPairs = (fun (mc0 : (string, int B_dData_dList.t_List) B_dData_dPair.t_Pair) -> (match mc0 with
  | { B_dData_dPair.f_Pair_first = dtb__213; B_dData_dPair.f_Pair_second = dtb__214 } -> ((B_dData_dList.v_map (fun (i : int) -> { B_dData_dPair.f_Pair_first = dtb__213; B_dData_dPair.f_Pair_second = i })) (v_dedupInts dtb__214))
  | _ -> failwith "DT: impossible branch"
))

# 406 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_posTblPairs = (fun (tbl : (string, int B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) -> ((B_dData_dList.v_concatMap v_posEntryPairs) (B_dContainer_dHashMap.v_toList tbl)))

# 403 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_posNormalize = (fun (xs : (string, int) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (v_posTblPairs (v_posTblOf xs)))

# 650 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let rec v_pathInPats = (fun (mc0 : string) (mc1 : Frontend_dRast.t_Pat B_dData_dList.t_List) (mc2 : int B_dData_dList.t_List) (mc3 : int) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__215, dtb__216) -> (match (((v_pathInPat mc0) dtb__215) ((B_dData_dList.v_append mc2) (B_dData_dList.C_List__x58__x58_ (mc3, B_dData_dList.C_List_Nil)))) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__217) -> (B_dData_dMaybe.C_Maybe_Just (dtb__217))
  | B_dData_dMaybe.C_Maybe_Nothing -> ((((v_pathInPats mc0) dtb__216) mc2) (mc3 + 1))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))
# 657 "Vuna/Compiler/Elab/Termination/Measure.vuna"
and v_pathInFields = (fun (mc0 : string) (mc1 : (string, Frontend_dRast.t_Pat) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc2 : int B_dData_dList.t_List) (mc3 : int) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__218, dtb__219) -> (match dtb__218 with
  | { B_dData_dPair.f_Pair_first = dtb__220; B_dData_dPair.f_Pair_second = dtb__221 } -> (match (((v_pathInPat mc0) dtb__221) ((B_dData_dList.v_append mc2) (B_dData_dList.C_List__x58__x58_ (mc3, B_dData_dList.C_List_Nil)))) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__222) -> (B_dData_dMaybe.C_Maybe_Just (dtb__222))
  | B_dData_dMaybe.C_Maybe_Nothing -> ((((v_pathInFields mc0) dtb__219) mc2) (mc3 + 1))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))
# 664 "Vuna/Compiler/Elab/Termination/Measure.vuna"
and v_pathInPat = (fun (mc0 : string) (mc1 : Frontend_dRast.t_Pat) (mc2 : int B_dData_dList.t_List) -> (match mc1 with
  | Frontend_dRast.C_Pat_PRecord (dtb__223, dtb__224, dtb__225) -> ((((v_pathInFields mc0) dtb__224) mc2) 0)
  | Frontend_dRast.C_Pat_PCon (dtb__226, dtb__227, dtb__228) -> ((((v_pathInPats mc0) dtb__227) mc2) 0)
  | Frontend_dRast.C_Pat_PWild (dtb__229) -> B_dData_dMaybe.C_Maybe_Nothing
  | Frontend_dRast.C_Pat_PVar (dtb__230, dtb__231) -> (if (dtb__230 = mc0) then (B_dData_dMaybe.C_Maybe_Just (mc2)) else B_dData_dMaybe.C_Maybe_Nothing)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
))

# 671 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_projectionOfDef = (fun (d : (string, (Frontend_dRast.t_Pat B_dData_dList.t_List, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dData_dPair.t_Pair) -> (let nd_uscrut1 = (B_dData_dPair.v_secondOf d) in (match nd_uscrut1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__232, dtb__233) -> (match dtb__233 with
  | B_dData_dList.C_List_Nil -> (let nd_uscrut6 = (B_dData_dPair.v_firstOf dtb__232) in (match nd_uscrut6 with
  | B_dData_dList.C_List__x58__x58_ (dtb__234, dtb__235) -> (match dtb__235 with
  | B_dData_dList.C_List_Nil -> (match (B_dData_dPair.v_secondOf dtb__232) with
  | Frontend_dRast.C_Expr_EVar (dtb__236, dtb__237) -> (match (((v_pathInPat (Frontend_dRast_dName.v_rnameKey dtb__236)) dtb__234) B_dData_dList.C_List_Nil) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__238) -> (if (v_notEmpty dtb__238) then (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (B_dData_dPair.v_firstOf d); B_dData_dPair.f_Pair_second = dtb__238 })) else B_dData_dMaybe.C_Maybe_Nothing)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)
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

# 686 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let rec v_projectionsOf = (fun (mc0 : (string, (Frontend_dRast.t_Pat B_dData_dList.t_List, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__239, dtb__240) -> (match (v_projectionOfDef dtb__239) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__241) -> (B_dData_dList.C_List__x58__x58_ (dtb__241, (v_projectionsOf dtb__240)))
  | B_dData_dMaybe.C_Maybe_Nothing -> (v_projectionsOf dtb__240)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 693 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let rec v_projHas = (fun (mc0 : string) (mc1 : (string, int B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__242, dtb__243) -> (match dtb__242 with
  | { B_dData_dPair.f_Pair_first = dtb__244; B_dData_dPair.f_Pair_second = dtb__245 } -> (if (mc0 = dtb__244) then true else ((v_projHas mc0) dtb__243))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 702 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let rec v_sameCtorGo = (fun (mc0 : int) (mc1 : Frontend_dRast.t_Expr B_dData_dList.t_List) (mc2 : (string, (int, (int, int B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc3 : int) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__246, dtb__247) -> (match dtb__246 with
  | Frontend_dRast.C_Expr_EVar (dtb__248, dtb__249) -> (match ((v_sizeOfVarStrict (Frontend_dRast_dName.v_rnameKey dtb__248)) mc2) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__250) -> (let nd_uscrut11 = dtb__250 in (match nd_uscrut11 with
  | { B_dData_dPair.f_Pair_first = dtb__251; B_dData_dPair.f_Pair_second = dtb__252 } -> (match dtb__252 with
  | { B_dData_dPair.f_Pair_first = dtb__253; B_dData_dPair.f_Pair_second = dtb__254 } -> (((((((v_sameCtorField dtb__251) dtb__253) dtb__254) mc0) dtb__247) mc2) mc3)
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
# 714 "Vuna/Compiler/Elab/Termination/Measure.vuna"
and v_sameCtorField = (fun (base : int) (depth : int) (path : int B_dData_dList.t_List) (p : int) (rest : Frontend_dRast.t_Expr B_dData_dList.t_List) (sizes : (string, (int, (int, int B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (k : int) -> (if (base = p) then (if (depth = 1) then (match path with
  | B_dData_dList.C_List__x58__x58_ (dtb__255, dtb__256) -> (match dtb__256 with
  | B_dData_dList.C_List_Nil -> (if (dtb__255 = k) then ((((v_sameCtorGo p) rest) sizes) (k + 1)) else false)
  | _ -> false
)
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
) else false) else false))

# 699 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_sameCtorApp = (fun (p : int) (args : Frontend_dRast.t_Expr B_dData_dList.t_List) (sizes : (string, (int, (int, int B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) -> ((((v_sameCtorGo p) args) sizes) 0))

# 729 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let rec v_findWrapField = (fun (mc0 : int) (mc1 : Frontend_dRast.t_Expr B_dData_dList.t_List) (mc2 : (string, (int, (int, int B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc3 : int) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__257, dtb__258) -> (match dtb__257 with
  | Frontend_dRast.C_Expr_EVar (dtb__259, dtb__260) -> (match ((v_sizeOfVarStrict (Frontend_dRast_dName.v_rnameKey dtb__259)) mc2) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__261) -> (let nd_uscrut11 = dtb__261 in (match nd_uscrut11 with
  | { B_dData_dPair.f_Pair_first = dtb__262; B_dData_dPair.f_Pair_second = dtb__263 } -> (match dtb__263 with
  | { B_dData_dPair.f_Pair_first = dtb__264; B_dData_dPair.f_Pair_second = dtb__265 } -> (if (dtb__262 = mc0) then ((((((v_wrapCheck mc0) dtb__258) mc2) mc3) dtb__264) dtb__265) else ((((v_findWrapField mc0) dtb__258) mc2) (mc3 + 1)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))
  | B_dData_dMaybe.C_Maybe_Nothing -> ((((v_findWrapField mc0) dtb__258) mc2) (mc3 + 1))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> ((((v_findWrapField mc0) dtb__258) mc2) (mc3 + 1))
)
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))
# 747 "Vuna/Compiler/Elab/Termination/Measure.vuna"
and v_wrapCheck = (fun (p : int) (rest : Frontend_dRast.t_Expr B_dData_dList.t_List) (sizes : (string, (int, (int, int B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (k : int) (depth : int) (path : int B_dData_dList.t_List) -> (if (depth > 0) then (match path with
  | B_dData_dList.C_List__x58__x58_ (dtb__266, dtb__267) -> (if (dtb__266 = k) then (if (v_notEmpty dtb__267) then (B_dData_dMaybe.C_Maybe_Just ((k + 2))) else ((((v_findWrapField p) rest) sizes) (k + 1))) else ((((v_findWrapField p) rest) sizes) (k + 1)))
  | B_dData_dList.C_List_Nil -> ((((v_findWrapField p) rest) sizes) (k + 1))
  | _ -> failwith "DT: impossible branch"
) else ((((v_findWrapField p) rest) sizes) (k + 1))))

# 760 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_posVarIn = (fun (x : string) (p : int) (caller : string) (facts : (string, int B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (region : string B_dData_dList.t_List) -> (if ((B_dData_dList.v_memName x) region) then true else (((v_posHasTbl caller) p) facts)))

# 771 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_isSubOpName = (fun (op : string) -> (if (if (op = "-") then true else (op = "Base.Trait.Num.sub")) then true else (op = "Base.Trait.Num.-")))

# 775 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_isAddOpName = (fun (op : string) -> (if (if (op = "+") then true else (op = "Base.Trait.Num.add")) then true else (op = "Base.Trait.Num.+")))

# 783 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_arithMinusBase = (fun (mc0 : int) (mc1 : Frontend_dRast.t_Expr) (mc2 : int) (mc3 : (string, (int, (int, int B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc4 : string) (mc5 : (string, int B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (mc6 : string B_dData_dList.t_List) -> (match mc1 with
  | Frontend_dRast.C_Expr_EVar (dtb__268, dtb__269) -> (match ((v_sizeOfVarStrict (Frontend_dRast_dName.v_rnameKey dtb__268)) mc3) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__270) -> (let nd_uscrut11 = dtb__270 in (match nd_uscrut11 with
  | { B_dData_dPair.f_Pair_first = dtb__271; B_dData_dPair.f_Pair_second = dtb__272 } -> (match dtb__272 with
  | { B_dData_dPair.f_Pair_first = dtb__273; B_dData_dPair.f_Pair_second = dtb__274 } -> (if (dtb__271 = mc0) then (if (dtb__273 = 0) then (if (((((v_posVarIn (Frontend_dRast_dName.v_rnameKey dtb__268)) mc0) mc4) mc5) mc6) then (B_dData_dMaybe.C_Maybe_Just (4)) else B_dData_dMaybe.C_Maybe_Nothing) else B_dData_dMaybe.C_Maybe_Nothing) else B_dData_dMaybe.C_Maybe_Nothing)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
))

# 778 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_arithMinus = (fun (mc0 : int) (mc1 : Frontend_dRast.t_Expr B_dData_dList.t_List) (mc2 : (string, (int, (int, int B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc3 : string) (mc4 : (string, int B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (mc5 : string B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__275, dtb__276) -> (match dtb__276 with
  | B_dData_dList.C_List__x58__x58_ (dtb__277, dtb__278) -> (match dtb__277 with
  | Frontend_dRast.C_Expr_EInt (dtb__279, dtb__280) -> (match dtb__278 with
  | B_dData_dList.C_List_Nil -> (if (dtb__279 > 0) then (((((((v_arithMinusBase mc0) dtb__275) dtb__279) mc2) mc3) mc4) mc5) else B_dData_dMaybe.C_Maybe_Nothing)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
))

# 763 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_arithRel = (fun (mc0 : int) (mc1 : Frontend_dRast.t_Expr) (mc2 : (string, (int, (int, int B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc3 : string) (mc4 : (string, int B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (mc5 : string B_dData_dList.t_List) -> (match mc1 with
  | Frontend_dRast.C_Expr_EApp (dtb__281, dtb__282, dtb__283) -> (match dtb__281 with
  | Frontend_dRast.C_Expr_EVar (dtb__284, dtb__285) -> (if (v_isSubOpName (Frontend_dRast_dName.v_rnameKey dtb__284)) then ((((((v_arithMinus mc0) dtb__282) mc2) mc3) mc4) mc5) else B_dData_dMaybe.C_Maybe_Nothing)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
))

# 800 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_projRel = (fun (mc0 : int) (mc1 : Frontend_dRast.t_Expr B_dData_dList.t_List) (mc2 : (string, (int, (int, int B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__286, dtb__287) -> (match dtb__287 with
  | B_dData_dList.C_List_Nil -> (match dtb__286 with
  | Frontend_dRast.C_Expr_EVar (dtb__288, dtb__289) -> (match ((v_sizeOfVarStrict (Frontend_dRast_dName.v_rnameKey dtb__288)) mc2) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__290) -> (let nd_uscrut11 = dtb__290 in (match nd_uscrut11 with
  | { B_dData_dPair.f_Pair_first = dtb__291; B_dData_dPair.f_Pair_second = dtb__292 } -> (match dtb__292 with
  | { B_dData_dPair.f_Pair_first = dtb__293; B_dData_dPair.f_Pair_second = dtb__294 } -> (if (dtb__291 = mc0) then (B_dData_dMaybe.C_Maybe_Just (1)) else B_dData_dMaybe.C_Maybe_Nothing)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
))

# 875 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_markInvalid = (fun (acc : (bool, (((string, string) B_dData_dPair.t_Pair, int) B_dData_dPair.t_Pair, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dData_dPair.t_Pair) -> { B_dData_dPair.f_Pair_first = false; B_dData_dPair.f_Pair_second = (B_dData_dPair.v_secondOf acc) })

# 878 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_addEdgeMode = (fun (caller : string) (callee : string) (m : int) (sp : Base_dSource.t_Span) (acc : (bool, (((string, string) B_dData_dPair.t_Pair, int) B_dData_dPair.t_Pair, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dData_dPair.t_Pair) -> { B_dData_dPair.f_Pair_first = (B_dData_dPair.v_firstOf acc); B_dData_dPair.f_Pair_second = (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = { B_dData_dPair.f_Pair_first = { B_dData_dPair.f_Pair_first = caller; B_dData_dPair.f_Pair_second = callee }; B_dData_dPair.f_Pair_second = m }; B_dData_dPair.f_Pair_second = sp }, (B_dData_dPair.v_secondOf acc))) })

# 882 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_groupHead = (fun (mc0 : string B_dData_dList.t_List) (mc1 : Frontend_dRast.t_Expr) -> (match mc1 with
  | Frontend_dRast.C_Expr_EVar (dtb__295, dtb__296) -> (if ((B_dData_dList.v_memName (Frontend_dRast_dName.v_rnameKey dtb__295)) mc0) then (B_dData_dMaybe.C_Maybe_Just ((Frontend_dRast_dName.v_rnameKey dtb__295))) else B_dData_dMaybe.C_Maybe_Nothing)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
))

# 886 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let rec v_nthExpr = (fun (mc0 : Frontend_dRast.t_Expr B_dData_dList.t_List) (mc1 : int) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__297, dtb__298) -> (if (mc1 <= 0) then (B_dData_dMaybe.C_Maybe_Just (dtb__297)) else ((v_nthExpr dtb__298) (mc1 - 1)))
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 374 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_argPositive = (fun (args : Frontend_dRast.t_Expr B_dData_dList.t_List) (i : int) (sizes : (string, (int, (int, int B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (caller : string) (facts : (string, int B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (region : string B_dData_dList.t_List) -> (match ((v_nthExpr args) i) with
  | B_dData_dMaybe.C_Maybe_Nothing -> false
  | B_dData_dMaybe.C_Maybe_Just (dtb__299) -> (match dtb__299 with
  | Frontend_dRast.C_Expr_EInt (dtb__300, dtb__301) -> (dtb__300 > 0)
  | Frontend_dRast.C_Expr_EVar (dtb__302, dtb__303) -> (if ((B_dData_dList.v_memName (Frontend_dRast_dName.v_rnameKey dtb__302)) region) then true else (match ((v_sizeOfVarStrict (Frontend_dRast_dName.v_rnameKey dtb__302)) sizes) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__304) -> (let nd_uscrut12 = dtb__304 in (match nd_uscrut12 with
  | { B_dData_dPair.f_Pair_first = dtb__305; B_dData_dPair.f_Pair_second = dtb__306 } -> (match dtb__306 with
  | { B_dData_dPair.f_Pair_first = dtb__307; B_dData_dPair.f_Pair_second = dtb__308 } -> (if (dtb__307 = 0) then (((v_posHasTbl caller) dtb__305) facts) else false)
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

# 591 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let rec v_posWalkCalleeGo = (fun (namesTbl : (string, bool) B_dContainer_dHashMap.t_HashMap) (caller : string) (sizes : (string, (int, (int, int B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (facts : (string, int B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (region : string B_dData_dList.t_List) (g : string) (remaining : int) (args : Frontend_dRast.t_Expr B_dData_dList.t_List) (st : ((string, int) B_dData_dPair.t_Pair B_dData_dList.t_List, (string, int) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dData_dPair.t_Pair) -> (if (remaining <= 0) then st else (let i = ((B_dData_dList.v_length args) - remaining) in (let st1 = (if ((((((v_argPositive args) i) sizes) caller) facts) region) then (((v_posMarkPos g) i) st) else (((v_posMarkNeg g) i) st)) in (((((((((v_posWalkCalleeGo namesTbl) caller) sizes) facts) region) g) (remaining - 1)) args) st1)))))

# 587 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_posWalkCallee = (fun (namesTbl : (string, bool) B_dContainer_dHashMap.t_HashMap) (caller : string) (sizes : (string, (int, (int, int B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (facts : (string, int B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (region : string B_dData_dList.t_List) (g : string) (i : int) (args : Frontend_dRast.t_Expr B_dData_dList.t_List) (st : ((string, int) B_dData_dPair.t_Pair B_dData_dList.t_List, (string, int) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dData_dPair.t_Pair) -> (((((((((v_posWalkCalleeGo namesTbl) caller) sizes) facts) region) g) ((B_dData_dList.v_length args) - i)) args) st))

# 416 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let rec v_posWalkArgs = (fun (mc0 : (string, bool) B_dContainer_dHashMap.t_HashMap) (mc1 : string) (mc2 : (string, (int, (int, int B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc3 : (string, int B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (mc4 : string B_dData_dList.t_List) (mc5 : Frontend_dRast.t_Expr B_dData_dList.t_List) (mc6 : ((string, int) B_dData_dPair.t_Pair B_dData_dList.t_List, (string, int) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dData_dPair.t_Pair) -> (match mc5 with
  | B_dData_dList.C_List__x58__x58_ (dtb__309, dtb__310) -> (((((((v_posWalkArgs mc0) mc1) mc2) mc3) mc4) dtb__310) (((((((v_posWalk mc0) mc1) mc2) mc3) mc4) dtb__309) mc6))
  | B_dData_dList.C_List_Nil -> mc6
  | _ -> failwith "DT: impossible branch"
))
# 428 "Vuna/Compiler/Elab/Termination/Measure.vuna"
and v_posWalkFields = (fun (mc0 : (string, bool) B_dContainer_dHashMap.t_HashMap) (mc1 : string) (mc2 : (string, (int, (int, int B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc3 : (string, int B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (mc4 : string B_dData_dList.t_List) (mc5 : (string, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc6 : ((string, int) B_dData_dPair.t_Pair B_dData_dList.t_List, (string, int) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dData_dPair.t_Pair) -> (match mc5 with
  | B_dData_dList.C_List__x58__x58_ (dtb__311, dtb__312) -> (match dtb__311 with
  | { B_dData_dPair.f_Pair_first = dtb__313; B_dData_dPair.f_Pair_second = dtb__314 } -> (((((((v_posWalkFields mc0) mc1) mc2) mc3) mc4) dtb__312) (((((((v_posWalk mc0) mc1) mc2) mc3) mc4) dtb__314) mc6))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> mc6
  | _ -> failwith "DT: impossible branch"
))
# 440 "Vuna/Compiler/Elab/Termination/Measure.vuna"
and v_posWalkAlts = (fun (mc0 : (string, bool) B_dContainer_dHashMap.t_HashMap) (mc1 : string) (mc2 : (string, (int, (int, int B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc3 : (string, int B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (mc4 : string B_dData_dList.t_List) (mc5 : (Frontend_dRast.t_Pat, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc6 : ((string, int) B_dData_dPair.t_Pair B_dData_dList.t_List, (string, int) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dData_dPair.t_Pair) -> (match mc5 with
  | B_dData_dList.C_List__x58__x58_ (dtb__315, dtb__316) -> (match dtb__315 with
  | { B_dData_dPair.f_Pair_first = dtb__317; B_dData_dPair.f_Pair_second = dtb__318 } -> (((((((v_posWalkAlts mc0) mc1) mc2) mc3) mc4) dtb__316) (((((((v_posWalk mc0) mc1) mc2) mc3) mc4) dtb__318) mc6))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> mc6
  | _ -> failwith "DT: impossible branch"
))
# 453 "Vuna/Compiler/Elab/Termination/Measure.vuna"
and v_posWalkClauses = (fun (mc0 : (string, bool) B_dContainer_dHashMap.t_HashMap) (mc1 : string) (mc2 : (string, (int, (int, int B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc3 : (string, int B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (mc4 : string B_dData_dList.t_List) (mc5 : (Frontend_dRast.t_Pat B_dData_dList.t_List, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc6 : ((string, int) B_dData_dPair.t_Pair B_dData_dList.t_List, (string, int) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dData_dPair.t_Pair) -> (match mc5 with
  | B_dData_dList.C_List__x58__x58_ (dtb__319, dtb__320) -> (match dtb__319 with
  | { B_dData_dPair.f_Pair_first = dtb__321; B_dData_dPair.f_Pair_second = dtb__322 } -> (((((((v_posWalkClauses mc0) mc1) mc2) mc3) mc4) dtb__320) (((((((v_posWalk mc0) mc1) mc2) mc3) mc4) dtb__322) mc6))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> mc6
  | _ -> failwith "DT: impossible branch"
))
# 465 "Vuna/Compiler/Elab/Termination/Measure.vuna"
and v_posWalkBinds = (fun (mc0 : (string, bool) B_dContainer_dHashMap.t_HashMap) (mc1 : string) (mc2 : (string, (int, (int, int B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc3 : (string, int B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (mc4 : string B_dData_dList.t_List) (mc5 : (Frontend_dRast.t_Pat, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc6 : ((string, int) B_dData_dPair.t_Pair B_dData_dList.t_List, (string, int) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dData_dPair.t_Pair) -> (match mc5 with
  | B_dData_dList.C_List__x58__x58_ (dtb__323, dtb__324) -> (match dtb__323 with
  | { B_dData_dPair.f_Pair_first = dtb__325; B_dData_dPair.f_Pair_second = dtb__326 } -> (((((((v_posWalkBinds mc0) mc1) mc2) mc3) mc4) dtb__324) (((((((v_posWalk mc0) mc1) mc2) mc3) mc4) dtb__326) mc6))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> mc6
  | _ -> failwith "DT: impossible branch"
))
# 477 "Vuna/Compiler/Elab/Termination/Measure.vuna"
and v_posWalkStmts = (fun (mc0 : (string, bool) B_dContainer_dHashMap.t_HashMap) (mc1 : string) (mc2 : (string, (int, (int, int B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc3 : (string, int B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (mc4 : string B_dData_dList.t_List) (mc5 : Frontend_dRast.t_DoStmt B_dData_dList.t_List) (mc6 : ((string, int) B_dData_dPair.t_Pair B_dData_dList.t_List, (string, int) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dData_dPair.t_Pair) -> (match mc5 with
  | B_dData_dList.C_List__x58__x58_ (dtb__327, dtb__328) -> (match dtb__327 with
  | Frontend_dRast.C_DoStmt_DBind (dtb__329, dtb__330, dtb__331) -> (((((((v_posWalkStmts mc0) mc1) mc2) mc3) mc4) dtb__328) (((((((v_posWalk mc0) mc1) mc2) mc3) mc4) dtb__330) mc6))
  | Frontend_dRast.C_DoStmt_DExpr (dtb__332, dtb__333) -> (((((((v_posWalkStmts mc0) mc1) mc2) mc3) mc4) dtb__328) (((((((v_posWalk mc0) mc1) mc2) mc3) mc4) dtb__332) mc6))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> mc6
  | _ -> failwith "DT: impossible branch"
))
# 500 "Vuna/Compiler/Elab/Termination/Measure.vuna"
and v_posWalk = (fun (mc0 : (string, bool) B_dContainer_dHashMap.t_HashMap) (mc1 : string) (mc2 : (string, (int, (int, int B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc3 : (string, int B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (mc4 : string B_dData_dList.t_List) (mc5 : Frontend_dRast.t_Expr) (mc6 : ((string, int) B_dData_dPair.t_Pair B_dData_dList.t_List, (string, int) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dData_dPair.t_Pair) -> (match mc5 with
  | Frontend_dRast.C_Expr_EVar (dtb__334, dtb__335) -> mc6
  | Frontend_dRast.C_Expr_EAnn (dtb__336, dtb__337, dtb__338) -> (((((((v_posWalk mc0) mc1) mc2) mc3) mc4) dtb__337) (((((((v_posWalk mc0) mc1) mc2) mc3) mc4) dtb__336) mc6))
  | Frontend_dRast.C_Expr_EDo (dtb__339, dtb__340) -> (((((((v_posWalkStmts mc0) mc1) mc2) mc3) mc4) dtb__339) mc6)
  | Frontend_dRast.C_Expr_ERecUpdate (dtb__341, dtb__342, dtb__343) -> (((((((v_posWalkFields mc0) mc1) mc2) mc3) mc4) dtb__342) (((((((v_posWalk mc0) mc1) mc2) mc3) mc4) dtb__341) mc6))
  | Frontend_dRast.C_Expr_ERecord (dtb__344, dtb__345, dtb__346) -> (((((((v_posWalkFields mc0) mc1) mc2) mc3) mc4) dtb__345) mc6)
  | Frontend_dRast.C_Expr_EField (dtb__347, dtb__348, dtb__349) -> (((((((v_posWalk mc0) mc1) mc2) mc3) mc4) dtb__347) mc6)
  | Frontend_dRast.C_Expr_EPi (dtb__350, dtb__351, dtb__352, dtb__353, dtb__354, dtb__355) -> (((((((v_posWalk mc0) mc1) mc2) mc3) mc4) dtb__354) (((((((v_posWalk mc0) mc1) mc2) mc3) mc4) dtb__353) mc6))
  | Frontend_dRast.C_Expr_ELet (dtb__356, dtb__357, dtb__358, dtb__359) -> (((((((v_posWalk mc0) mc1) mc2) mc3) mc4) dtb__357) (((((((v_posWalkBinds mc0) mc1) mc2) mc3) mc4) dtb__356) mc6))
  | Frontend_dRast.C_Expr_ELocalFun (dtb__360, dtb__361) -> (((((((v_posWalkClauses mc0) mc1) mc2) mc3) mc4) dtb__360) mc6)
  | Frontend_dRast.C_Expr_ELam (dtb__362, dtb__363, dtb__364) -> (((((((v_posWalk mc0) mc1) mc2) mc3) mc4) dtb__363) mc6)
  | Frontend_dRast.C_Expr_ECase (dtb__365, dtb__366, dtb__367) -> (((((((v_posWalkAlts mc0) mc1) mc2) mc3) mc4) dtb__366) (((((((v_posWalk mc0) mc1) mc2) mc3) mc4) dtb__365) mc6))
  | Frontend_dRast.C_Expr_EIf (dtb__368, dtb__369, dtb__370, dtb__371) -> (let st1 = (((((((v_posWalk mc0) mc1) mc2) mc3) mc4) dtb__368) mc6) in (let st2 = (((((((v_posWalk mc0) mc1) mc2) mc3) ((B_dData_dList.v_append (v_guardThenPosVars dtb__368)) mc4)) dtb__369) st1) in (((((((v_posWalk mc0) mc1) mc2) mc3) ((B_dData_dList.v_append (v_guardElsePosVars dtb__368)) mc4)) dtb__370) st2)))
  | Frontend_dRast.C_Expr_EApp (dtb__372, dtb__373, dtb__374) -> (match dtb__372 with
  | Frontend_dRast.C_Expr_EVar (dtb__375, dtb__376) -> (if ((((B_dContainer_dHashMap.v_member B_dData_dString.v_Hashable_uString) B_dData_dString.v_Eq_uString) (Frontend_dRast_dName.v_rnameKey dtb__375)) mc0) then (((((((v_posWalkArgs mc0) mc1) mc2) mc3) mc4) dtb__373) (((((((((v_posWalkCallee mc0) mc1) mc2) mc3) mc4) (Frontend_dRast_dName.v_rnameKey dtb__375)) 0) dtb__373) mc6)) else (((((((v_posWalkArgs mc0) mc1) mc2) mc3) mc4) dtb__373) (((((((v_posWalk mc0) mc1) mc2) mc3) mc4) dtb__372) mc6)))
  | _ -> (((((((v_posWalkArgs mc0) mc1) mc2) mc3) mc4) dtb__373) (((((((v_posWalk mc0) mc1) mc2) mc3) mc4) dtb__372) mc6))
)
  | _ -> mc6
))

# 601 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let rec v_posScanClauses = (fun (mc0 : (string, bool) B_dContainer_dHashMap.t_HashMap) (mc1 : (string, (Frontend_dRast.t_Pat B_dData_dList.t_List, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc2 : (string, int B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (mc3 : string) (mc4 : (Frontend_dRast.t_Pat B_dData_dList.t_List, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc5 : ((string, int) B_dData_dPair.t_Pair B_dData_dList.t_List, (string, int) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dData_dPair.t_Pair) -> (match mc4 with
  | B_dData_dList.C_List__x58__x58_ (dtb__377, dtb__378) -> (let sizes = (v_strSizeEntries (B_dData_dPair.v_firstOf dtb__377)) in (let st2 = (((((((v_posWalk mc0) mc3) sizes) mc2) B_dData_dList.C_List_Nil) (B_dData_dPair.v_secondOf dtb__377)) mc5) in ((((((v_posScanClauses mc0) mc1) mc2) mc3) dtb__378) st2)))
  | B_dData_dList.C_List_Nil -> mc5
  | _ -> failwith "DT: impossible branch"
))

# 609 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let rec v_posScanDefs = (fun (mc0 : (string, bool) B_dContainer_dHashMap.t_HashMap) (mc1 : (string, (Frontend_dRast.t_Pat B_dData_dList.t_List, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc2 : (string, int B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (mc3 : (string, (Frontend_dRast.t_Pat B_dData_dList.t_List, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc4 : ((string, int) B_dData_dPair.t_Pair B_dData_dList.t_List, (string, int) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dData_dPair.t_Pair) -> (match mc3 with
  | B_dData_dList.C_List__x58__x58_ (dtb__379, dtb__380) -> (((((v_posScanDefs mc0) mc1) mc2) dtb__380) ((((((v_posScanClauses mc0) mc1) mc2) (B_dData_dPair.v_firstOf dtb__379)) (B_dData_dPair.v_secondOf dtb__379)) mc4))
  | B_dData_dList.C_List_Nil -> mc4
  | _ -> failwith "DT: impossible branch"
))

# 626 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let rec v_posScanNamesGo = (fun (mc0 : (string, bool) B_dContainer_dHashMap.t_HashMap) (mc1 : (string, (Frontend_dRast.t_Pat B_dData_dList.t_List, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (mc2 : (string, int B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (mc3 : string B_dData_dList.t_List) (mc4 : ((string, int) B_dData_dPair.t_Pair B_dData_dList.t_List, (string, int) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dData_dPair.t_Pair) -> (match mc3 with
  | B_dData_dList.C_List__x58__x58_ (dtb__381, dtb__382) -> (((((v_posScanNamesGo mc0) mc1) mc2) dtb__382) ((((((v_posScanClauses mc0) B_dData_dList.C_List_Nil) mc2) dtb__381) ((v_clausesOfDefTbl dtb__381) mc1)) mc4))
  | B_dData_dList.C_List_Nil -> mc4
  | _ -> failwith "DT: impossible branch"
))

# 620 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_posScanNames = (fun (namesTbl : (string, bool) B_dContainer_dHashMap.t_HashMap) (defTbl : (string, (Frontend_dRast.t_Pat B_dData_dList.t_List, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (factsTbl : (string, int B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (work : string B_dData_dList.t_List) (st : ((string, int) B_dData_dPair.t_Pair B_dData_dList.t_List, (string, int) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dData_dPair.t_Pair) -> (let scanned = (((((v_posScanNamesGo namesTbl) defTbl) factsTbl) work) st) in { B_dData_dPair.f_Pair_first = (v_posNormalize (B_dData_dPair.v_firstOf scanned)); B_dData_dPair.f_Pair_second = (v_posNormalize (B_dData_dPair.v_secondOf scanned)) }))

# 637 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let rec v_computePosFacts = (fun (defs : (string, (Frontend_dRast.t_Pat B_dData_dList.t_List, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (fuel : int) (facts : (string, int) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (if (fuel <= 0) then facts else (((v_computePosFactsStep defs) fuel) facts)))
# 640 "Vuna/Compiler/Elab/Termination/Measure.vuna"
and v_computePosFactsStep = (fun (defs : (string, (Frontend_dRast.t_Pat B_dData_dList.t_List, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (fuel : int) (facts : (string, int) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (let namesTbl = (B_dContainer_dHashMap.v_ofNames (v_defNames defs)) in (let scanned = (((((v_posScanDefs namesTbl) defs) (v_posTblOf facts)) defs) { B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = B_dData_dList.C_List_Nil }) in (let scan = { B_dData_dPair.f_Pair_first = (v_posNormalize (B_dData_dPair.v_firstOf scanned)); B_dData_dPair.f_Pair_second = (v_posNormalize (B_dData_dPair.v_secondOf scanned)) } in (let fresh = ((v_posFilterTbl (B_dData_dPair.v_firstOf scan)) (v_posTblOf (B_dData_dPair.v_secondOf scan))) in (let merged = ((v_posUnionTbl facts) fresh) in (if ((v_posSetEqTbl facts) merged) then merged else (((v_computePosFacts defs) (fuel - 1)) merged))))))))

# 906 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_unaryHofSpec = { f_HofSpec_hofLambdaArity = 1; f_HofSpec_hofElemParam = 0; f_HofSpec_hofListArg = 1 }

# 909 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_foldLHofSpec = { f_HofSpec_hofLambdaArity = 2; f_HofSpec_hofElemParam = 1; f_HofSpec_hofListArg = 2 }

# 912 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_foldRHofSpec = { f_HofSpec_hofLambdaArity = 2; f_HofSpec_hofElemParam = 0; f_HofSpec_hofListArg = 2 }

# 915 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_hofSpecOf = (fun (mc0 : Frontend_dRast_dName.t_RName) -> (match mc0 with
  | Frontend_dRast_dName.C_RName_RGlobal (dtb__383, dtb__384) -> (if (dtb__383 = "Base.Data.List") then (if (if (if (if (dtb__384 = "map") then true else (dtb__384 = "filter")) then true else (dtb__384 = "concatMap")) then true else (dtb__384 = "mapMaybe")) then (B_dData_dMaybe.C_Maybe_Just (v_unaryHofSpec)) else (if (dtb__384 = "foldl") then (B_dData_dMaybe.C_Maybe_Just (v_foldLHofSpec)) else (if (dtb__384 = "foldr") then (B_dData_dMaybe.C_Maybe_Just (v_foldRHofSpec)) else B_dData_dMaybe.C_Maybe_Nothing))) else (if (if (dtb__383 = "Base.Data.Result") then true else (dtb__383 = "Vuna.Compiler.Base.Common")) then (if (dtb__384 = "traverse") then (B_dData_dMaybe.C_Maybe_Just (v_unaryHofSpec)) else B_dData_dMaybe.C_Maybe_Nothing) else B_dData_dMaybe.C_Maybe_Nothing))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
))

# 928 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let rec v_nthName = (fun (mc0 : string B_dData_dList.t_List) (mc1 : int) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__385, dtb__386) -> (if (mc1 <= 0) then (B_dData_dMaybe.C_Maybe_Just (dtb__385)) else ((v_nthName dtb__386) (mc1 - 1)))
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 933 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let rec v_peelLam = (fun (n : int) (e : Frontend_dRast.t_Expr) -> (if (n <= 0) then (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = e })) else (match e with
  | Frontend_dRast.C_Expr_ELam (dtb__387, dtb__388, dtb__389) -> (if ((B_dData_dList.v_length dtb__387) > n) then B_dData_dMaybe.C_Maybe_Nothing else (let nd_uscrut5 = ((v_peelLam (n - (B_dData_dList.v_length dtb__387))) dtb__388) in (match nd_uscrut5 with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb__390) -> (match dtb__390 with
  | { B_dData_dPair.f_Pair_first = dtb__391; B_dData_dPair.f_Pair_second = dtb__392 } -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = ((B_dData_dList.v_append ((B_dData_dList.v_map B_dData_dPair.v_firstOf) dtb__387)) dtb__391); B_dData_dPair.f_Pair_second = dtb__392 }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)))

# 950 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_hofLambdaCall = (fun (mc0 : t_HofSpec) (mc1 : Frontend_dRast.t_Expr B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__393, dtb__394) -> (let nd_uscrut5 = ((v_peelLam (mc0).f_HofSpec_hofLambdaArity) dtb__393) in (match nd_uscrut5 with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb__395) -> (match dtb__395 with
  | { B_dData_dPair.f_Pair_first = dtb__396; B_dData_dPair.f_Pair_second = dtb__397 } -> (if ((B_dData_dList.v_length dtb__394) = (mc0).f_HofSpec_hofListArg) then (match ((v_nthExpr dtb__394) ((mc0).f_HofSpec_hofListArg - 1)) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__398) -> (match ((v_nthName dtb__396) (mc0).f_HofSpec_hofElemParam) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__399) -> (B_dData_dMaybe.C_Maybe_Just ({ f_HofCall_hofElemBinder = dtb__399; f_HofCall_hofListExpr = dtb__398; f_HofCall_hofSideArgs = dtb__394; f_HofCall_hofBody = dtb__397 }))
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

# 966 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_extendElemSizes = (fun (mc0 : (string, (int, (int, int B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc1 : Frontend_dRast.t_Expr) (mc2 : string) -> (match mc1 with
  | Frontend_dRast.C_Expr_EVar (dtb__400, dtb__401) -> (match ((v_sizeOfVarStrict (Frontend_dRast_dName.v_rnameKey dtb__400)) mc0) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__402) -> (let nd_uscrut7 = dtb__402 in (match nd_uscrut7 with
  | { B_dData_dPair.f_Pair_first = dtb__403; B_dData_dPair.f_Pair_second = dtb__404 } -> (match dtb__404 with
  | { B_dData_dPair.f_Pair_first = dtb__405; B_dData_dPair.f_Pair_second = dtb__406 } -> (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = mc2; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = dtb__403; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = (dtb__405 + 1); B_dData_dPair.f_Pair_second = ((B_dData_dList.v_append dtb__406) (B_dData_dList.C_List__x58__x58_ (0, B_dData_dList.C_List_Nil))) } } }, mc0))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))
  | B_dData_dMaybe.C_Maybe_Nothing -> mc0
  | _ -> failwith "DT: impossible branch"
)
  | _ -> mc0
))

# 979 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let rec v_edgeStrictGo = (fun (mc0 : string) (mc1 : string) (mc2 : (((string, string) B_dData_dPair.t_Pair, int) B_dData_dPair.t_Pair, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc3 : bool) (mc4 : bool) -> (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__407, dtb__408) -> (match dtb__407 with
  | { B_dData_dPair.f_Pair_first = dtb__409; B_dData_dPair.f_Pair_second = dtb__410 } -> (match dtb__409 with
  | { B_dData_dPair.f_Pair_first = dtb__411; B_dData_dPair.f_Pair_second = dtb__412 } -> (match dtb__411 with
  | { B_dData_dPair.f_Pair_first = dtb__413; B_dData_dPair.f_Pair_second = dtb__414 } -> (if (dtb__413 = mc0) then (if (dtb__414 = mc1) then (((((v_edgeStrictGo mc0) mc1) dtb__408) true) (if (dtb__412 > 0) then mc4 else false)) else (((((v_edgeStrictGo mc0) mc1) dtb__408) mc3) mc4)) else (((((v_edgeStrictGo mc0) mc1) dtb__408) mc3) mc4))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (if mc3 then mc4 else false)
  | _ -> failwith "DT: impossible branch"
))

# 976 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_edgeStrict = (fun (f : string) (g : string) (edges : (((string, string) B_dData_dPair.t_Pair, int) B_dData_dPair.t_Pair, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (((((v_edgeStrictGo f) g) edges) false) true))

# 993 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let rec v_edgeTargetsGo = (fun (mc0 : string) (mc1 : (((string, string) B_dData_dPair.t_Pair, int) B_dData_dPair.t_Pair, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__415, dtb__416) -> (match dtb__415 with
  | { B_dData_dPair.f_Pair_first = dtb__417; B_dData_dPair.f_Pair_second = dtb__418 } -> (match dtb__417 with
  | { B_dData_dPair.f_Pair_first = dtb__419; B_dData_dPair.f_Pair_second = dtb__420 } -> (match dtb__419 with
  | { B_dData_dPair.f_Pair_first = dtb__421; B_dData_dPair.f_Pair_second = dtb__422 } -> (if (dtb__421 = mc0) then (B_dData_dList.C_List__x58__x58_ (dtb__422, ((v_edgeTargetsGo mc0) dtb__416))) else ((v_edgeTargetsGo mc0) dtb__416))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 990 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_edgeTargets = (fun (f : string) (edges : (((string, string) B_dData_dPair.t_Pair, int) B_dData_dPair.t_Pair, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (v_dedup ((v_edgeTargetsGo f) edges)))

# 1002 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let rec v_weakAdjGo = (fun (mc0 : string B_dData_dList.t_List) (mc1 : (((string, string) B_dData_dPair.t_Pair, int) B_dData_dPair.t_Pair, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc2 : string) (mc3 : string B_dData_dList.t_List) -> (match mc3 with
  | B_dData_dList.C_List__x58__x58_ (dtb__423, dtb__424) -> (if (((v_edgeStrict mc2) dtb__423) mc1) then ((((v_weakAdjGo mc0) mc1) mc2) dtb__424) else (B_dData_dList.C_List__x58__x58_ (dtb__423, ((((v_weakAdjGo mc0) mc1) mc2) dtb__424))))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 999 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_weakAdj = (fun (comp : string B_dData_dList.t_List) (edges : (((string, string) B_dData_dPair.t_Pair, int) B_dData_dPair.t_Pair, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List) (f : string) -> ((((v_weakAdjGo comp) edges) f) ((v_edgeTargets f) edges)))

# 1010 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let rec v_weakReachFuel = (fun (fuel : int) (comp : string B_dData_dList.t_List) (edges : (((string, string) B_dData_dPair.t_Pair, int) B_dData_dPair.t_Pair, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List) (start : string) (frontier : string B_dData_dList.t_List) (visited : string B_dData_dList.t_List) -> (if (fuel <= 0) then true else (match frontier with
  | B_dData_dList.C_List_Nil -> false
  | B_dData_dList.C_List__x58__x58_ (dtb__425, dtb__426) -> (if (dtb__425 = start) then true else (if ((B_dData_dList.v_memName dtb__425) visited) then ((((((v_weakReachFuel (fuel - 1)) comp) edges) start) dtb__426) visited) else ((((((v_weakReachFuel (fuel - 1)) comp) edges) start) ((B_dData_dList.v_append dtb__426) (((v_weakAdj comp) edges) dtb__425))) (B_dData_dList.C_List__x58__x58_ (dtb__425, visited)))))
  | _ -> failwith "DT: impossible branch"
)))

# 1007 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_weakReach = (fun (comp : string B_dData_dList.t_List) (edges : (((string, string) B_dData_dPair.t_Pair, int) B_dData_dPair.t_Pair, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List) (start : string) (frontier : string B_dData_dList.t_List) (visited : string B_dData_dList.t_List) -> ((((((v_weakReachFuel 100000) comp) edges) start) frontier) visited))

# 1023 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let rec v_hasWeakCycleGo = (fun (mc0 : string B_dData_dList.t_List) (mc1 : (((string, string) B_dData_dPair.t_Pair, int) B_dData_dPair.t_Pair, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc2 : string B_dData_dList.t_List) -> (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__427, dtb__428) -> (if (((((v_weakReach mc0) mc1) dtb__427) (((v_weakAdj mc0) mc1) dtb__427)) (B_dData_dList.C_List__x58__x58_ (dtb__427, B_dData_dList.C_List_Nil))) then true else (((v_hasWeakCycleGo mc0) mc1) dtb__428))
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 1020 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_hasWeakCycle = (fun (comp : string B_dData_dList.t_List) (edges : (((string, string) B_dData_dPair.t_Pair, int) B_dData_dPair.t_Pair, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (((v_hasWeakCycleGo comp) edges) comp))

# 1030 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_relEqual = 0

# 812 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_relOfArg = (fun (mc0 : int) (mc1 : Frontend_dRast.t_Expr) (mc2 : (string, (int, (int, int B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc3 : string B_dData_dList.t_List) (mc4 : (string, int B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc5 : string) (mc6 : (string, int B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (mc7 : string B_dData_dList.t_List) -> (match mc1 with
  | Frontend_dRast.C_Expr_EApp (dtb__429, dtb__430, dtb__431) -> (match dtb__429 with
  | Frontend_dRast.C_Expr_EVar (dtb__432, dtb__433) -> (if ((B_dData_dList.v_memName (Frontend_dRast_dName.v_rnameKey dtb__432)) mc3) then (match ((((v_findWrapField mc0) dtb__430) mc2) 0) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__434) -> (B_dData_dMaybe.C_Maybe_Just (dtb__434))
  | B_dData_dMaybe.C_Maybe_Nothing -> (if (((v_sameCtorApp mc0) dtb__430) mc2) then (B_dData_dMaybe.C_Maybe_Just (v_relEqual)) else B_dData_dMaybe.C_Maybe_Nothing)
  | _ -> failwith "DT: impossible branch"
) else (if ((v_projHas (Frontend_dRast_dName.v_rnameKey dtb__432)) mc4) then (((v_projRel mc0) dtb__430) mc2) else ((((((v_arithRel mc0) mc1) mc2) mc5) mc6) mc7)))
  | _ -> ((((((v_arithRel mc0) mc1) mc2) mc5) mc6) mc7)
)
  | Frontend_dRast.C_Expr_EVar (dtb__435, dtb__436) -> (match ((v_sizeOfVarStrict (Frontend_dRast_dName.v_rnameKey dtb__435)) mc2) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__437) -> (let nd_uscrut12 = dtb__437 in (match nd_uscrut12 with
  | { B_dData_dPair.f_Pair_first = dtb__438; B_dData_dPair.f_Pair_second = dtb__439 } -> (match dtb__439 with
  | { B_dData_dPair.f_Pair_first = dtb__440; B_dData_dPair.f_Pair_second = dtb__441 } -> (if (dtb__438 = mc0) then (if (dtb__440 > 0) then (B_dData_dMaybe.C_Maybe_Just (1)) else (B_dData_dMaybe.C_Maybe_Just (0))) else B_dData_dMaybe.C_Maybe_Nothing)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
))

# 831 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_argRel = (fun (p : int) (args : Frontend_dRast.t_Expr B_dData_dList.t_List) (sizes : (string, (int, (int, int B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctors : string B_dData_dList.t_List) (projs : (string, int B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (caller : string) (facts : (string, int B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (region : string B_dData_dList.t_List) -> (match ((v_nthExpr args) p) with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb__442) -> ((((((((v_relOfArg p) dtb__442) sizes) ctors) projs) caller) facts) region)
  | _ -> failwith "DT: impossible branch"
))

# 1033 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_relStrictSub = 1

# 1036 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_relStrictMinus = 4

# 1039 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_relUnknownSize = -1

# 1042 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_relMissingGuard = -2

# 1045 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_relNoRelation = -3

# 1048 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_relOtherPosition = -4

# 863 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_hintArith = (fun (mc0 : int) (mc1 : Frontend_dRast.t_Expr B_dData_dList.t_List) (mc2 : (string, (int, (int, int B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc3 : int) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__443, dtb__444) -> (match dtb__443 with
  | Frontend_dRast.C_Expr_EVar (dtb__445, dtb__446) -> (match dtb__444 with
  | B_dData_dList.C_List__x58__x58_ (dtb__447, dtb__448) -> (match dtb__447 with
  | Frontend_dRast.C_Expr_EInt (dtb__449, dtb__450) -> (match dtb__448 with
  | B_dData_dList.C_List_Nil -> (if (dtb__449 <= 0) then (B_dData_dMaybe.C_Maybe_Just (v_relNoRelation)) else (match ((v_sizeOfVarStrict (Frontend_dRast_dName.v_rnameKey dtb__445)) mc2) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__451) -> (let nd_uscrut17 = dtb__451 in (match nd_uscrut17 with
  | { B_dData_dPair.f_Pair_first = dtb__452; B_dData_dPair.f_Pair_second = dtb__453 } -> (match dtb__453 with
  | { B_dData_dPair.f_Pair_first = dtb__454; B_dData_dPair.f_Pair_second = dtb__455 } -> (if (dtb__452 = mc0) then (if (dtb__454 = 0) then (B_dData_dMaybe.C_Maybe_Just (mc3)) else (B_dData_dMaybe.C_Maybe_Just (v_relNoRelation))) else (B_dData_dMaybe.C_Maybe_Just (v_relOtherPosition)))
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

# 1051 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_relAscending = -5

# 839 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_argRelHint = (fun (p : int) (args : Frontend_dRast.t_Expr B_dData_dList.t_List) (sizes : (string, (int, (int, int B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctors : string B_dData_dList.t_List) -> (match ((v_nthExpr args) p) with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb__456) -> (let nd_uscrut6 = dtb__456 in (match nd_uscrut6 with
  | Frontend_dRast.C_Expr_EApp (dtb__457, dtb__458, dtb__459) -> (match dtb__457 with
  | Frontend_dRast.C_Expr_EVar (dtb__460, dtb__461) -> (if (v_isSubOpName (Frontend_dRast_dName.v_rnameKey dtb__460)) then ((((v_hintArith p) dtb__458) sizes) v_relMissingGuard) else (if (v_isAddOpName (Frontend_dRast_dName.v_rnameKey dtb__460)) then ((((v_hintArith p) dtb__458) sizes) v_relAscending) else (B_dData_dMaybe.C_Maybe_Just (v_relNoRelation))))
  | _ -> (B_dData_dMaybe.C_Maybe_Just (v_relNoRelation))
)
  | Frontend_dRast.C_Expr_EVar (dtb__462, dtb__463) -> (if ((B_dData_dList.v_memName (Frontend_dRast_dName.v_rnameKey dtb__462)) ctors) then (B_dData_dMaybe.C_Maybe_Just (v_relNoRelation)) else (match ((v_sizeOfVarStrict (Frontend_dRast_dName.v_rnameKey dtb__462)) sizes) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__464) -> (let nd_uscrut11 = dtb__464 in (match nd_uscrut11 with
  | { B_dData_dPair.f_Pair_first = dtb__465; B_dData_dPair.f_Pair_second = dtb__466 } -> (match dtb__466 with
  | { B_dData_dPair.f_Pair_first = dtb__467; B_dData_dPair.f_Pair_second = dtb__468 } -> (if (dtb__465 = p) then (B_dData_dMaybe.C_Maybe_Just (v_relNoRelation)) else (B_dData_dMaybe.C_Maybe_Just (v_relOtherPosition)))
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

# 1055 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_relText = (fun (m : int) -> (if (m = v_relStrictSub) then "strict subterm" else (if (m = v_relStrictMinus) then "decreases by a constant, with the non-negativity guard proven" else (if (m = v_relMissingGuard) then "decreases by a constant, but the non-negativity guard is missing" else (if (m = v_relUnknownSize) then "no known size (not a subterm of a parameter)" else (if (m = v_relOtherPosition) then "decreases a different parameter" else (if (m = v_relEqual) then "unchanged" else (if (m = v_relAscending) then "increases instead of decreasing (ascending counters are not supported)" else "no size relation"))))))))

# 1074 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_isDescent = (fun (m : int) -> (m > 0))

# 1077 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let rec v_filterModes = (fun (mc0 : int B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__469, dtb__470) -> (if (v_isDescent dtb__469) then (B_dData_dList.C_List__x58__x58_ (dtb__469, (v_filterModes dtb__470))) else (v_filterModes dtb__470))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))
