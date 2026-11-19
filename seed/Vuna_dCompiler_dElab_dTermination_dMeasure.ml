open Vuna_runtime
# 12 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_Vuna_dCompiler_dElab_dTermination_dMeasure_dmaxInt = (fun (a : int) (b : int) -> (if (a >= b) then a else b))

# 15 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_Vuna_dCompiler_dElab_dTermination_dMeasure_dnotEmpty = (fun mc0 -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> false
  | _ -> true
))

# 19 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let rec v_Vuna_dCompiler_dElab_dTermination_dMeasure_dallEqTo = (fun (mc0 : int) (mc1 : int Base_dData_dList.t_Base_dData_dList_dList) -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__0, dtb__1) -> (if (mc0 = dtb__0) then ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dallEqTo mc0) dtb__1) else false)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

# 23 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_Vuna_dCompiler_dElab_dTermination_dMeasure_dallSame = (fun (mc0 : int Base_dData_dList.t_Base_dData_dList_dList) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__2, dtb__3) -> ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dallEqTo dtb__2) dtb__3)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

# 28 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_Vuna_dCompiler_dElab_dTermination_dMeasure_ddedup = (fun (names : string Base_dData_dList.t_Base_dData_dList_dList) -> (Base_dData_dList.v_Base_dData_dList_dnubNames names))

# 31 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let rec v_Vuna_dCompiler_dElab_dTermination_dMeasure_djoinComma = (fun (mc0 : string Base_dData_dList.t_Base_dData_dList_dList) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__4, dtb__5) -> (match dtb__5 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> dtb__4
  | _ -> (String.concat "" [dtb__4; ", "; (v_Vuna_dCompiler_dElab_dTermination_dMeasure_djoinComma dtb__5)])
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))

# 37 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let rec v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposHas = (fun (mc0 : string) (mc1 : int) (mc2 : (string, int) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) -> (match mc2 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__6, dtb__7) -> (match dtb__6 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__8; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__9 } -> (if (mc0 = dtb__8) then (if (mc1 = dtb__9) then true else (((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposHas mc0) mc1) dtb__7)) else (((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposHas mc0) mc1) dtb__7))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 47 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let rec v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposTblOfGo = (fun (mc0 : (string, int) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (mc1 : (string, int Base_dData_dList.t_Base_dData_dList_dList) Base_dContainer_dHashMap.t_Base_dContainer_dHashMap_dHashMap) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__10, dtb__11) -> (match dtb__10 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__12; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__13 } -> (match ((((Base_dContainer_dHashMap.v_Base_dContainer_dHashMap_dlookup Base_dData_dString.v_Hashable_uString) Base_dData_dString.v_Eq_uString) dtb__12) mc1) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__14) -> ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposTblOfGo dtb__11) ((((Base_dContainer_dHashMap.v_Base_dContainer_dHashMap_dinsert Base_dData_dString.v_Hashable_uString) dtb__12) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__13, dtb__14))) mc1))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposTblOfGo dtb__11) ((((Base_dContainer_dHashMap.v_Base_dContainer_dHashMap_dinsert Base_dData_dString.v_Hashable_uString) dtb__12) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__13, Base_dData_dList.C_Base_dData_dList_dList_Nil))) mc1))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> mc1
  | _ -> failwith "DT: impossible branch"
))

# 44 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposTblOf = (fun (xs : (string, int) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) -> ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposTblOfGo xs) ((Base_dContainer_dHashMap.v_Base_dContainer_dHashMap_dfromList Base_dData_dString.v_Hashable_uString) Base_dData_dList.C_Base_dData_dList_dList_Nil)))

# 60 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let rec v_Vuna_dCompiler_dElab_dTermination_dMeasure_dmemInt = (fun (mc0 : int) (mc1 : int Base_dData_dList.t_Base_dData_dList_dList) -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__15, dtb__16) -> (if (mc0 = dtb__15) then true else ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dmemInt mc0) dtb__16))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 54 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposHasTbl = (fun (f : string) (i : int) (tbl : (string, int Base_dData_dList.t_Base_dData_dList_dList) Base_dContainer_dHashMap.t_Base_dContainer_dHashMap_dHashMap) -> (match ((((Base_dContainer_dHashMap.v_Base_dContainer_dHashMap_dlookup Base_dData_dString.v_Hashable_uString) Base_dData_dString.v_Eq_uString) f) tbl) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__17) -> ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dmemInt i) dtb__17)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
))

# 64 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposAdd = (fun (f : string) (i : int) (facts : (string, int) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) -> (if (((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposHas f) i) facts) then facts else (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = f; Base_dData_dPair.f_Base_dData_dPair_dPair_second = i }, facts))))

# 67 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let rec v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposSubset = (fun (mc0 : (string, int) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (mc1 : (string, int) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__18, dtb__19) -> (match dtb__18 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__20; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__21 } -> (if (((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposHas dtb__20) dtb__21) mc1) then ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposSubset dtb__19) mc1) else false)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

# 71 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposSetEq = (fun (a : (string, int) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (b : (string, int) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) -> (if ((Base_dData_dList.v_Base_dData_dList_dlength a) = (Base_dData_dList.v_Base_dData_dList_dlength b)) then ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposSubset a) b) else false))

# 74 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let rec v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposFilter = (fun (mc0 : (string, int) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (mc1 : (string, int) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__22, dtb__23) -> (match dtb__22 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__24; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__25 } -> (if (((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposHas dtb__24) dtb__25) mc1) then ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposFilter dtb__23) mc1) else (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__24; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__25 }, ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposFilter dtb__23) mc1))))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 79 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let rec v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposUnion = (fun (mc0 : (string, int) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (mc1 : (string, int) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__26, dtb__27) -> (match dtb__26 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__28; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__29 } -> ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposUnion dtb__27) (((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposAdd dtb__28) dtb__29) mc1))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> mc1
  | _ -> failwith "DT: impossible branch"
))

# 85 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let rec v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposFilterTbl = (fun (mc0 : (string, int) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (mc1 : (string, int Base_dData_dList.t_Base_dData_dList_dList) Base_dContainer_dHashMap.t_Base_dContainer_dHashMap_dHashMap) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__30, dtb__31) -> (match dtb__30 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__32; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__33 } -> (if (((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposHasTbl dtb__32) dtb__33) mc1) then ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposFilterTbl dtb__31) mc1) else (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__32; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__33 }, ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposFilterTbl dtb__31) mc1))))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 90 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let rec v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposSubsetTbl = (fun (mc0 : (string, int) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (mc1 : (string, int Base_dData_dList.t_Base_dData_dList_dList) Base_dContainer_dHashMap.t_Base_dContainer_dHashMap_dHashMap) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__34, dtb__35) -> (match dtb__34 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__36; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__37 } -> (if (((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposHasTbl dtb__36) dtb__37) mc1) then ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposSubsetTbl dtb__35) mc1) else false)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

# 94 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposSetEqTbl = (fun (a : (string, int) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (b : (string, int) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) -> (if (if ((Base_dData_dList.v_Base_dData_dList_dlength a) = (Base_dData_dList.v_Base_dData_dList_dlength b)) then ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposSubsetTbl a) (v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposTblOf b)) else false) then ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposSubsetTbl b) (v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposTblOf a)) else false))

# 98 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposUnionTbl = (fun (facts : (string, int) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (fresh : (string, int) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) -> ((Base_dData_dList.v_Base_dData_dList_dappend fresh) ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposFilterTbl facts) (v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposTblOf fresh))))

# 101 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let rec v_Vuna_dCompiler_dElab_dTermination_dMeasure_dfunDeclsOf = (fun (mc0 : Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dDecl Base_dData_dList.t_Base_dData_dList_dList) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__38, dtb__39) -> (match dtb__38 with
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dDecl_DFun (dtb__40, dtb__41, dtb__42, dtb__43) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__40; Base_dData_dPair.f_Base_dData_dPair_dPair_second = { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__41; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__42 } }, (v_Vuna_dCompiler_dElab_dTermination_dMeasure_dfunDeclsOf dtb__39)))
  | _ -> (v_Vuna_dCompiler_dElab_dTermination_dMeasure_dfunDeclsOf dtb__39)
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 108 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let rec v_Vuna_dCompiler_dElab_dTermination_dMeasure_dlookupGroup = (fun (mc0 : string) (mc1 : (string, (Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dPat Base_dData_dList.t_Base_dData_dList_dList, Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dExpr) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__44, dtb__45) -> (match dtb__44 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__46; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__47 } -> (if (dtb__46 = mc0) then (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__47)) else ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dlookupGroup mc0) dtb__45))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 112 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let rec v_Vuna_dCompiler_dElab_dTermination_dMeasure_dreplaceGroup = (fun (mc0 : string) (mc1 : (Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dPat Base_dData_dList.t_Base_dData_dList_dList, Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dExpr) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (mc2 : (string, (Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dPat Base_dData_dList.t_Base_dData_dList_dList, Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dExpr) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) -> (match mc2 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__48, dtb__49) -> (match dtb__48 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__50; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__51 } -> (if (dtb__50 = mc0) then (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__50; Base_dData_dPair.f_Base_dData_dPair_dPair_second = mc1 }, dtb__49)) else (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__50; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__51 }, (((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dreplaceGroup mc0) mc1) dtb__49))))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 133 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let rec v_Vuna_dCompiler_dElab_dTermination_dMeasure_dgroupDefsGo = (fun (mc0 : (string, (Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dPat Base_dData_dList.t_Base_dData_dList_dList, Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dExpr) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) Base_dContainer_dHashMap.t_Base_dContainer_dHashMap_dHashMap) (mc1 : string Base_dData_dList.t_Base_dData_dList_dList) (mc2 : (string, (Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dPat Base_dData_dList.t_Base_dData_dList_dList, Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dExpr) Base_dData_dPair.t_Base_dData_dPair_dPair) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) -> (match mc2 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__52, dtb__53) -> (match dtb__52 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__54; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__55 } -> (match ((((Base_dContainer_dHashMap.v_Base_dContainer_dHashMap_dlookup Base_dData_dString.v_Hashable_uString) Base_dData_dString.v_Eq_uString) dtb__54) mc0) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__56) -> (((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dgroupDefsGo ((((Base_dContainer_dHashMap.v_Base_dContainer_dHashMap_dinsert Base_dData_dString.v_Hashable_uString) dtb__54) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__55, dtb__56))) mc0)) mc1) dtb__53)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dgroupDefsGo ((((Base_dContainer_dHashMap.v_Base_dContainer_dHashMap_dinsert Base_dData_dString.v_Hashable_uString) dtb__54) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__55, Base_dData_dList.C_Base_dData_dList_dList_Nil))) mc0)) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__54, mc1))) dtb__53)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> { Base_dData_dPair.f_Base_dData_dPair_dPair_first = mc0; Base_dData_dPair.f_Base_dData_dPair_dPair_second = mc1 }
  | _ -> failwith "DT: impossible branch"
))

# 117 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_Vuna_dCompiler_dElab_dTermination_dMeasure_dgroupDefs = (fun (decls : Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dDecl Base_dData_dList.t_Base_dData_dList_dList) -> ((fun stepped -> ((fun tbl -> ((fun order -> ((Base_dData_dList.v_Base_dData_dList_dmap (fun (n : string) -> { Base_dData_dPair.f_Base_dData_dPair_dPair_first = n; Base_dData_dPair.f_Base_dData_dPair_dPair_second = (match ((((Base_dContainer_dHashMap.v_Base_dContainer_dHashMap_dlookup Base_dData_dString.v_Hashable_uString) Base_dData_dString.v_Eq_uString) n) tbl) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__57) -> (Base_dData_dList.v_Base_dData_dList_dreverse dtb__57)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
) })) (Base_dData_dList.v_Base_dData_dList_dreverse order))) (Base_dData_dPair.v_Base_dData_dPair_dsecondOf stepped))) (Base_dData_dPair.v_Base_dData_dPair_dfirstOf stepped))) (((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dgroupDefsGo ((Base_dContainer_dHashMap.v_Base_dContainer_dHashMap_dfromList Base_dData_dString.v_Hashable_uString) Base_dData_dList.C_Base_dData_dList_dList_Nil)) Base_dData_dList.C_Base_dData_dList_dList_Nil) (v_Vuna_dCompiler_dElab_dTermination_dMeasure_dfunDeclsOf decls))))

# 140 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_Vuna_dCompiler_dElab_dTermination_dMeasure_ddefNames = (fun (defs : (string, (Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dPat Base_dData_dList.t_Base_dData_dList_dList, Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dExpr) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) -> ((Base_dData_dList.v_Base_dData_dList_dmap Base_dData_dPair.v_Base_dData_dPair_dfirstOf) defs))

# 143 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let rec v_Vuna_dCompiler_dElab_dTermination_dMeasure_dclausesOfDef = (fun (mc0 : string) (mc1 : (string, (Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dPat Base_dData_dList.t_Base_dData_dList_dList, Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dExpr) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__58, dtb__59) -> (match dtb__58 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__60; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__61 } -> (if (dtb__60 = mc0) then dtb__61 else ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dclausesOfDef mc0) dtb__59))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 148 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_Vuna_dCompiler_dElab_dTermination_dMeasure_dclausesOfDefTbl = (fun (name : string) (tbl : (string, (Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dPat Base_dData_dList.t_Base_dData_dList_dList, Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dExpr) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) Base_dContainer_dHashMap.t_Base_dContainer_dHashMap_dHashMap) -> (match ((((Base_dContainer_dHashMap.v_Base_dContainer_dHashMap_dlookup Base_dData_dString.v_Hashable_uString) Base_dData_dString.v_Eq_uString) name) tbl) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__62) -> dtb__62
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 154 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let rec v_Vuna_dCompiler_dElab_dTermination_dMeasure_ddefArity = (fun (mc0 : (Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dPat Base_dData_dList.t_Base_dData_dList_dList, Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dExpr) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__63, dtb__64) -> ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dmaxInt (Base_dData_dList.v_Base_dData_dList_dlength (Base_dData_dPair.v_Base_dData_dPair_dfirstOf dtb__63))) (v_Vuna_dCompiler_dElab_dTermination_dMeasure_ddefArity dtb__64))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))

# 158 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let rec v_Vuna_dCompiler_dElab_dTermination_dMeasure_dmaxArityOf = (fun (mc0 : string Base_dData_dList.t_Base_dData_dList_dList) (mc1 : (string, (Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dPat Base_dData_dList.t_Base_dData_dList_dList, Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dExpr) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) Base_dContainer_dHashMap.t_Base_dContainer_dHashMap_dHashMap) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__65, dtb__66) -> ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dmaxInt (v_Vuna_dCompiler_dElab_dTermination_dMeasure_ddefArity ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dclausesOfDefTbl dtb__65) mc1))) ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dmaxArityOf dtb__66) mc1))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))

# 172 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_Vuna_dCompiler_dElab_dTermination_dMeasure_dctorNameOf = (fun (mc0 : Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dCtor) -> (match mc0 with
  | { Vuna_dCompiler_dFrontend_dRast.f_Vuna_dCompiler_dFrontend_dRast_dCtor_ctorName = dtb__67; Vuna_dCompiler_dFrontend_dRast.f_Vuna_dCompiler_dFrontend_dRast_dCtor_ctorType = dtb__68; Vuna_dCompiler_dFrontend_dRast.f_Vuna_dCompiler_dFrontend_dRast_dCtor_ctorArity = dtb__69; Vuna_dCompiler_dFrontend_dRast.f_Vuna_dCompiler_dFrontend_dRast_dCtor_ctorSpan = dtb__70 } -> dtb__67
  | _ -> failwith "DT: impossible branch"
))

# 163 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let rec v_Vuna_dCompiler_dElab_dTermination_dMeasure_dctorNamesOf = (fun (mc0 : Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dDecl Base_dData_dList.t_Base_dData_dList_dList) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__71, dtb__72) -> (match dtb__71 with
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dDecl_DData (dtb__73, dtb__74, dtb__75, dtb__76, dtb__77, dtb__78, dtb__79, dtb__80, dtb__81) -> ((Base_dData_dList.v_Base_dData_dList_dappend ((Base_dData_dList.v_Base_dData_dList_dmap v_Vuna_dCompiler_dElab_dTermination_dMeasure_dctorNameOf) dtb__76)) (v_Vuna_dCompiler_dElab_dTermination_dMeasure_dctorNamesOf dtb__72))
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dDecl_DRecord (dtb__82, dtb__83, dtb__84, dtb__85, dtb__86, dtb__87, dtb__88, dtb__89) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__82, (v_Vuna_dCompiler_dElab_dTermination_dMeasure_dctorNamesOf dtb__72)))
  | _ -> (v_Vuna_dCompiler_dElab_dTermination_dMeasure_dctorNamesOf dtb__72)
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 175 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let rec v_Vuna_dCompiler_dElab_dTermination_dMeasure_dpatSizeStrict = (fun (mc0 : Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dPat) (mc1 : int) (mc2 : int Base_dData_dList.t_Base_dData_dList_dList) (mc3 : (string, (int, (int, int Base_dData_dList.t_Base_dData_dList_dList) Base_dData_dPair.t_Base_dData_dPair_dPair) Base_dData_dPair.t_Base_dData_dPair_dPair) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) -> (match mc0 with
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dPat_PRecord (dtb__90, dtb__91, dtb__92) -> (((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dfieldsSizeStrict dtb__91) mc1) mc2) 0) mc3)
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dPat_PCon (dtb__93, dtb__94, dtb__95) -> (((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dpatsSizeStrict dtb__94) mc1) mc2) 0) mc3)
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dPat_PWild (dtb__96) -> mc3
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dPat_PVar (dtb__97, dtb__98) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__97; Base_dData_dPair.f_Base_dData_dPair_dPair_second = { Base_dData_dPair.f_Base_dData_dPair_dPair_first = mc1; Base_dData_dPair.f_Base_dData_dPair_dPair_second = { Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Base_dData_dList.v_Base_dData_dList_dlength mc2); Base_dData_dPair.f_Base_dData_dPair_dPair_second = mc2 } } }, mc3))
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dPat_PAs (dtb__99, dtb__100, dtb__101) -> ((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dpatSizeStrict dtb__100) mc1) mc2) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__99; Base_dData_dPair.f_Base_dData_dPair_dPair_second = { Base_dData_dPair.f_Base_dData_dPair_dPair_first = mc1; Base_dData_dPair.f_Base_dData_dPair_dPair_second = { Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Base_dData_dList.v_Base_dData_dList_dlength mc2); Base_dData_dPair.f_Base_dData_dPair_dPair_second = mc2 } } }, mc3)))
  | _ -> mc3
))
# 185 "Vuna/Compiler/Elab/Termination/Measure.vuna"
and v_Vuna_dCompiler_dElab_dTermination_dMeasure_dpatsSizeStrict = (fun (mc0 : Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dPat Base_dData_dList.t_Base_dData_dList_dList) (mc1 : int) (mc2 : int Base_dData_dList.t_Base_dData_dList_dList) (mc3 : int) (mc4 : (string, (int, (int, int Base_dData_dList.t_Base_dData_dList_dList) Base_dData_dPair.t_Base_dData_dPair_dPair) Base_dData_dPair.t_Base_dData_dPair_dPair) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__102, dtb__103) -> (((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dpatsSizeStrict dtb__103) mc1) mc2) (mc3 + 1)) ((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dpatSizeStrict dtb__102) mc1) ((Base_dData_dList.v_Base_dData_dList_dappend mc2) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (mc3, Base_dData_dList.C_Base_dData_dList_dList_Nil)))) mc4))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> mc4
  | _ -> failwith "DT: impossible branch"
))
# 190 "Vuna/Compiler/Elab/Termination/Measure.vuna"
and v_Vuna_dCompiler_dElab_dTermination_dMeasure_dfieldsSizeStrict = (fun (mc0 : (string, Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dPat) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (mc1 : int) (mc2 : int Base_dData_dList.t_Base_dData_dList_dList) (mc3 : int) (mc4 : (string, (int, (int, int Base_dData_dList.t_Base_dData_dList_dList) Base_dData_dPair.t_Base_dData_dPair_dPair) Base_dData_dPair.t_Base_dData_dPair_dPair) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__104, dtb__105) -> (match dtb__104 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__106; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__107 } -> (((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dfieldsSizeStrict dtb__105) mc1) mc2) (mc3 + 1)) ((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dpatSizeStrict dtb__107) mc1) ((Base_dData_dList.v_Base_dData_dList_dappend mc2) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (mc3, Base_dData_dList.C_Base_dData_dList_dList_Nil)))) mc4))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> mc4
  | _ -> failwith "DT: impossible branch"
))

# 198 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let rec v_Vuna_dCompiler_dElab_dTermination_dMeasure_dstrSizeEntriesGo = (fun (mc0 : Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dPat Base_dData_dList.t_Base_dData_dList_dList) (mc1 : int) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__108, dtb__109) -> ((Base_dData_dList.v_Base_dData_dList_dappend ((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dpatSizeStrict dtb__108) mc1) Base_dData_dList.C_Base_dData_dList_dList_Nil) Base_dData_dList.C_Base_dData_dList_dList_Nil)) ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dstrSizeEntriesGo dtb__109) (mc1 + 1)))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 195 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_Vuna_dCompiler_dElab_dTermination_dMeasure_dstrSizeEntries = (fun (pats : Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dPat Base_dData_dList.t_Base_dData_dList_dList) -> ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dstrSizeEntriesGo pats) 0))

# 223 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let rec v_Vuna_dCompiler_dElab_dTermination_dMeasure_dsizeOfVarStrict = (fun (mc0 : string) (mc1 : (string, (int, (int, int Base_dData_dList.t_Base_dData_dList_dList) Base_dData_dPair.t_Base_dData_dPair_dPair) Base_dData_dPair.t_Base_dData_dPair_dPair) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__110, dtb__111) -> (match dtb__110 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__112; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__113 } -> (if (dtb__112 = mc0) then (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__113)) else ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dsizeOfVarStrict mc0) dtb__111))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 202 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let rec v_Vuna_dCompiler_dElab_dTermination_dMeasure_dextendSizesStrict = (fun (mc0 : (string, (int, (int, int Base_dData_dList.t_Base_dData_dList_dList) Base_dData_dPair.t_Base_dData_dPair_dPair) Base_dData_dPair.t_Base_dData_dPair_dPair) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (mc1 : Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dExpr) (mc2 : Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dPat) -> (match mc1 with
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dExpr_EVar (dtb__114, dtb__115) -> (match ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dsizeOfVarStrict (Vuna_dCompiler_dFrontend_dRast_dName.v_Vuna_dCompiler_dFrontend_dRast_dName_drnameKey dtb__114)) mc0) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__116) -> ((fun nd_uscrut7 -> (match nd_uscrut7 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__117; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__118 } -> (match dtb__118 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__119; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__120 } -> (match mc2 with
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dPat_PVar (dtb__121, dtb__122) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__121; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__116 }, mc0))
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dPat_PAs (dtb__123, dtb__124, dtb__125) -> (((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dextendSizesStrict (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__123; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__116 }, mc0))) (Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dExpr_EVar (dtb__114, dtb__115))) dtb__124)
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dPat_PCon (dtb__126, dtb__127, dtb__128) -> ((Base_dData_dList.v_Base_dData_dList_dappend mc0) (((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dpatsSizeStrict dtb__127) dtb__117) dtb__120) 0) Base_dData_dList.C_Base_dData_dList_dList_Nil))
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dPat_PRecord (dtb__129, dtb__130, dtb__131) -> ((Base_dData_dList.v_Base_dData_dList_dappend mc0) (((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dfieldsSizeStrict dtb__130) dtb__117) dtb__120) 0) Base_dData_dList.C_Base_dData_dList_dList_Nil))
  | _ -> mc0
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) dtb__116)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> mc0
  | _ -> failwith "DT: impossible branch"
)
  | _ -> mc0
))

# 219 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let rec v_Vuna_dCompiler_dElab_dTermination_dMeasure_dextendByBinds = (fun (mc0 : (Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dPat, Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dExpr) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (mc1 : (string, (int, (int, int Base_dData_dList.t_Base_dData_dList_dList) Base_dData_dPair.t_Base_dData_dPair_dPair) Base_dData_dPair.t_Base_dData_dPair_dPair) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__132, dtb__133) -> (match dtb__132 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__134; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__135 } -> ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dextendByBinds dtb__133) (((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dextendSizesStrict mc1) dtb__135) dtb__134))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> mc1
  | _ -> failwith "DT: impossible branch"
))

# 248 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_Vuna_dCompiler_dElab_dTermination_dMeasure_dopBaseName = (fun (name : string) -> (Base_dData_dPair.v_Base_dData_dPair_dsecondOf (Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dsplitLastDot (Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dsplitOnDot name))))

# 272 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_Vuna_dCompiler_dElab_dTermination_dMeasure_dvarOfExpr = (fun (mc0 : Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dExpr) -> (match mc0 with
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dExpr_EVar (dtb__136, dtb__137) -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ((Vuna_dCompiler_dFrontend_dRast_dName.v_Vuna_dCompiler_dFrontend_dRast_dName_drnameKey dtb__136)))
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
))

# 251 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_Vuna_dCompiler_dElab_dTermination_dMeasure_dguardLE = (fun (mc0 : Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dExpr Base_dData_dList.t_Base_dData_dList_dList) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__138, dtb__139) -> (match dtb__139 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__140, dtb__141) -> (match dtb__141 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (match dtb__140 with
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dExpr_EInt (dtb__142, dtb__143) -> (if (dtb__142 = 0) then (v_Vuna_dCompiler_dElab_dTermination_dMeasure_dvarOfExpr dtb__138) else Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing)
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
))

# 258 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_Vuna_dCompiler_dElab_dTermination_dMeasure_dguardGE = (fun (mc0 : Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dExpr Base_dData_dList.t_Base_dData_dList_dList) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__144, dtb__145) -> (match dtb__145 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__146, dtb__147) -> (match dtb__147 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (match dtb__144 with
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dExpr_EInt (dtb__148, dtb__149) -> (if (dtb__148 = 0) then (v_Vuna_dCompiler_dElab_dTermination_dMeasure_dvarOfExpr dtb__146) else Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing)
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
))

# 265 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_Vuna_dCompiler_dElab_dTermination_dMeasure_dguardLT = (fun (mc0 : Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dExpr Base_dData_dList.t_Base_dData_dList_dList) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__150, dtb__151) -> (match dtb__151 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__152, dtb__153) -> (match dtb__153 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (match dtb__152 with
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dExpr_EInt (dtb__154, dtb__155) -> (if (dtb__154 = 1) then (v_Vuna_dCompiler_dElab_dTermination_dMeasure_dvarOfExpr dtb__150) else Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing)
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
))

# 231 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_Vuna_dCompiler_dElab_dTermination_dMeasure_dguardPosVar = (fun (e : Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dExpr) -> ((fun nd_uscrut1 -> (match nd_uscrut1 with
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dExpr_EApp (dtb__156, dtb__157, dtb__158) -> (match dtb__156 with
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dExpr_EVar (dtb__159, dtb__160) -> (if ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dopBaseName (Vuna_dCompiler_dFrontend_dRast_dName.v_Vuna_dCompiler_dFrontend_dRast_dName_drnameKey dtb__159)) = "le") then (v_Vuna_dCompiler_dElab_dTermination_dMeasure_dguardLE dtb__157) else (if ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dopBaseName (Vuna_dCompiler_dFrontend_dRast_dName.v_Vuna_dCompiler_dFrontend_dRast_dName_drnameKey dtb__159)) = "ge") then (v_Vuna_dCompiler_dElab_dTermination_dMeasure_dguardGE dtb__157) else (if ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dopBaseName (Vuna_dCompiler_dFrontend_dRast_dName.v_Vuna_dCompiler_dFrontend_dRast_dName_drnameKey dtb__159)) = "lt") then (v_Vuna_dCompiler_dElab_dTermination_dMeasure_dguardLT dtb__157) else (if ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dopBaseName (Vuna_dCompiler_dFrontend_dRast_dName.v_Vuna_dCompiler_dFrontend_dRast_dName_drnameKey dtb__159)) = "<=") then (v_Vuna_dCompiler_dElab_dTermination_dMeasure_dguardLE dtb__157) else (if ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dopBaseName (Vuna_dCompiler_dFrontend_dRast_dName.v_Vuna_dCompiler_dFrontend_dRast_dName_drnameKey dtb__159)) = ">=") then (v_Vuna_dCompiler_dElab_dTermination_dMeasure_dguardGE dtb__157) else (if ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dopBaseName (Vuna_dCompiler_dFrontend_dRast_dName.v_Vuna_dCompiler_dFrontend_dRast_dName_drnameKey dtb__159)) = "<") then (v_Vuna_dCompiler_dElab_dTermination_dMeasure_dguardLT dtb__157) else Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing))))))
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
)) e))

# 278 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let rec v_Vuna_dCompiler_dElab_dTermination_dMeasure_dlocalClauseBinds = (fun (mc0 : (Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dPat Base_dData_dList.t_Base_dData_dList_dList, Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dExpr) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__161, dtb__162) -> (match dtb__161 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__163; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__164 } -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dPat_PWild ((Vuna_dCompiler_dFrontend_dRast.v_Vuna_dCompiler_dFrontend_dRast_dexprSpan dtb__164))); Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__164 }, (v_Vuna_dCompiler_dElab_dTermination_dMeasure_dlocalClauseBinds dtb__162)))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 285 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_Vuna_dCompiler_dElab_dTermination_dMeasure_dguardUnion = (fun (a : string Base_dData_dList.t_Base_dData_dList_dList) (b : string Base_dData_dList.t_Base_dData_dList_dList) -> (v_Vuna_dCompiler_dElab_dTermination_dMeasure_ddedup ((Base_dData_dList.v_Base_dData_dList_dappend a) b)))

# 288 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let rec v_Vuna_dCompiler_dElab_dTermination_dMeasure_dguardInter = (fun (mc0 : string Base_dData_dList.t_Base_dData_dList_dList) (mc1 : string Base_dData_dList.t_Base_dData_dList_dList) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__165, dtb__166) -> (if ((Base_dData_dList.v_Base_dData_dList_dmemName dtb__165) mc1) then (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__165, ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dguardInter dtb__166) mc1))) else ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dguardInter dtb__166) mc1))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 293 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_Vuna_dCompiler_dElab_dTermination_dMeasure_dguardThenPosAtom = (fun (op : string) (args : Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dExpr Base_dData_dList.t_Base_dData_dList_dList) -> ((fun nd_uscrut2 -> (match nd_uscrut2 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__167, dtb__168) -> (match dtb__168 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__169, dtb__170) -> (match dtb__170 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (match dtb__169 with
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dExpr_EInt (dtb__171, dtb__172) -> (if (if (op = "gt") then true else (op = ">")) then (if (dtb__171 >= 0) then (v_Vuna_dCompiler_dElab_dTermination_dMeasure_dvarOfExpr dtb__167) else Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing) else (if (if (op = "ge") then true else (op = ">=")) then (if (dtb__171 >= 1) then (v_Vuna_dCompiler_dElab_dTermination_dMeasure_dvarOfExpr dtb__167) else Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing) else Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing))
  | _ -> (match dtb__167 with
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dExpr_EInt (dtb__173, dtb__174) -> (if (if (op = "lt") then true else (op = "<")) then (if (dtb__173 >= 0) then (v_Vuna_dCompiler_dElab_dTermination_dMeasure_dvarOfExpr dtb__169) else Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing) else (if (if (op = "le") then true else (op = "<=")) then (if (dtb__173 >= 1) then (v_Vuna_dCompiler_dElab_dTermination_dMeasure_dvarOfExpr dtb__169) else Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing) else Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing))
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
)
)
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
)) args))

# 319 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_Vuna_dCompiler_dElab_dTermination_dMeasure_dguardElsePosAtom = (fun (op : string) (args : Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dExpr Base_dData_dList.t_Base_dData_dList_dList) -> ((fun nd_uscrut2 -> (match nd_uscrut2 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__175, dtb__176) -> (match dtb__176 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__177, dtb__178) -> (match dtb__178 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (match dtb__177 with
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dExpr_EInt (dtb__179, dtb__180) -> (if (if (op = "le") then true else (op = "<=")) then (if (dtb__179 >= 0) then (v_Vuna_dCompiler_dElab_dTermination_dMeasure_dvarOfExpr dtb__175) else Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing) else (if (if (op = "lt") then true else (op = "<")) then (if (dtb__179 >= 1) then (v_Vuna_dCompiler_dElab_dTermination_dMeasure_dvarOfExpr dtb__175) else Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing) else Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing))
  | _ -> (match dtb__175 with
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dExpr_EInt (dtb__181, dtb__182) -> (if (if (op = "ge") then true else (op = ">=")) then (if (dtb__181 >= 0) then (v_Vuna_dCompiler_dElab_dTermination_dMeasure_dvarOfExpr dtb__177) else Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing) else (if (if (op = "gt") then true else (op = ">")) then (if (dtb__181 >= 1) then (v_Vuna_dCompiler_dElab_dTermination_dMeasure_dvarOfExpr dtb__177) else Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing) else Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing))
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
)
)
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
)) args))

# 345 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let rec v_Vuna_dCompiler_dElab_dTermination_dMeasure_dguardThenPosVars = (fun (e : Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dExpr) -> ((fun nd_uscrut1 -> (match nd_uscrut1 with
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dExpr_EApp (dtb__183, dtb__184, dtb__185) -> (match dtb__183 with
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dExpr_EVar (dtb__186, dtb__187) -> ((fun opn -> (if (opn = "&&") then ((fun nd_uscrut8 -> (match nd_uscrut8 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__188, dtb__189) -> (match dtb__189 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__190, dtb__191) -> (match dtb__191 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dguardUnion (v_Vuna_dCompiler_dElab_dTermination_dMeasure_dguardThenPosVars dtb__188)) (v_Vuna_dCompiler_dElab_dTermination_dMeasure_dguardThenPosVars dtb__190))
  | _ -> Base_dData_dList.C_Base_dData_dList_dList_Nil
)
  | _ -> Base_dData_dList.C_Base_dData_dList_dList_Nil
)
  | _ -> Base_dData_dList.C_Base_dData_dList_dList_Nil
)) dtb__184) else (if (opn = "||") then ((fun nd_uscrut8 -> (match nd_uscrut8 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__192, dtb__193) -> (match dtb__193 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__194, dtb__195) -> (match dtb__195 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dguardInter (v_Vuna_dCompiler_dElab_dTermination_dMeasure_dguardThenPosVars dtb__192)) (v_Vuna_dCompiler_dElab_dTermination_dMeasure_dguardThenPosVars dtb__194))
  | _ -> Base_dData_dList.C_Base_dData_dList_dList_Nil
)
  | _ -> Base_dData_dList.C_Base_dData_dList_dList_Nil
)
  | _ -> Base_dData_dList.C_Base_dData_dList_dList_Nil
)) dtb__184) else (match ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dguardThenPosAtom opn) dtb__184) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__196) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__196, Base_dData_dList.C_Base_dData_dList_dList_Nil))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
)))) (v_Vuna_dCompiler_dElab_dTermination_dMeasure_dopBaseName (Vuna_dCompiler_dFrontend_dRast_dName.v_Vuna_dCompiler_dFrontend_dRast_dName_drnameKey dtb__186)))
  | _ -> Base_dData_dList.C_Base_dData_dList_dList_Nil
)
  | _ -> Base_dData_dList.C_Base_dData_dList_dList_Nil
)) e))

# 367 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let rec v_Vuna_dCompiler_dElab_dTermination_dMeasure_dguardElsePosVars = (fun (e : Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dExpr) -> ((fun nd_uscrut1 -> (match nd_uscrut1 with
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dExpr_EApp (dtb__197, dtb__198, dtb__199) -> (match dtb__197 with
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dExpr_EVar (dtb__200, dtb__201) -> ((fun opn -> (if (opn = "&&") then ((fun nd_uscrut8 -> (match nd_uscrut8 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__202, dtb__203) -> (match dtb__203 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__204, dtb__205) -> (match dtb__205 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dguardInter (v_Vuna_dCompiler_dElab_dTermination_dMeasure_dguardElsePosVars dtb__202)) (v_Vuna_dCompiler_dElab_dTermination_dMeasure_dguardElsePosVars dtb__204))
  | _ -> Base_dData_dList.C_Base_dData_dList_dList_Nil
)
  | _ -> Base_dData_dList.C_Base_dData_dList_dList_Nil
)
  | _ -> Base_dData_dList.C_Base_dData_dList_dList_Nil
)) dtb__198) else (if (opn = "||") then ((fun nd_uscrut8 -> (match nd_uscrut8 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__206, dtb__207) -> (match dtb__207 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__208, dtb__209) -> (match dtb__209 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dguardUnion (v_Vuna_dCompiler_dElab_dTermination_dMeasure_dguardElsePosVars dtb__206)) (v_Vuna_dCompiler_dElab_dTermination_dMeasure_dguardElsePosVars dtb__208))
  | _ -> Base_dData_dList.C_Base_dData_dList_dList_Nil
)
  | _ -> Base_dData_dList.C_Base_dData_dList_dList_Nil
)
  | _ -> Base_dData_dList.C_Base_dData_dList_dList_Nil
)) dtb__198) else (match ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dguardElsePosAtom opn) dtb__198) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__210) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__210, Base_dData_dList.C_Base_dData_dList_dList_Nil))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
)))) (v_Vuna_dCompiler_dElab_dTermination_dMeasure_dopBaseName (Vuna_dCompiler_dFrontend_dRast_dName.v_Vuna_dCompiler_dFrontend_dRast_dName_drnameKey dtb__200)))
  | _ -> Base_dData_dList.C_Base_dData_dList_dList_Nil
)
  | _ -> Base_dData_dList.C_Base_dData_dList_dList_Nil
)) e))

# 410 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposMarkPos = (fun (f : string) (i : int) (st : ((string, int) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList, (string, int) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) Base_dData_dPair.t_Base_dData_dPair_dPair) -> { Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = f; Base_dData_dPair.f_Base_dData_dPair_dPair_second = i }, (Base_dData_dPair.v_Base_dData_dPair_dfirstOf st))); Base_dData_dPair.f_Base_dData_dPair_dPair_second = (Base_dData_dPair.v_Base_dData_dPair_dsecondOf st) })

# 413 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposMarkNeg = (fun (f : string) (i : int) (st : ((string, int) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList, (string, int) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) Base_dData_dPair.t_Base_dData_dPair_dPair) -> { Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Base_dData_dPair.v_Base_dData_dPair_dfirstOf st); Base_dData_dPair.f_Base_dData_dPair_dPair_second = (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = f; Base_dData_dPair.f_Base_dData_dPair_dPair_second = i }, (Base_dData_dPair.v_Base_dData_dPair_dsecondOf st))) })

# 426 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let rec v_Vuna_dCompiler_dElab_dTermination_dMeasure_ddedupInts = (fun (mc0 : int Base_dData_dList.t_Base_dData_dList_dList) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__211, dtb__212) -> (if ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dmemInt dtb__211) dtb__212) then (v_Vuna_dCompiler_dElab_dTermination_dMeasure_ddedupInts dtb__212) else (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__211, (v_Vuna_dCompiler_dElab_dTermination_dMeasure_ddedupInts dtb__212))))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 423 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposEntryPairs = (fun (mc0 : (string, int Base_dData_dList.t_Base_dData_dList_dList) Base_dData_dPair.t_Base_dData_dPair_dPair) -> (match mc0 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__213; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__214 } -> ((Base_dData_dList.v_Base_dData_dList_dmap (fun (i : int) -> { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__213; Base_dData_dPair.f_Base_dData_dPair_dPair_second = i })) (v_Vuna_dCompiler_dElab_dTermination_dMeasure_ddedupInts dtb__214))
  | _ -> failwith "DT: impossible branch"
))

# 420 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposTblPairs = (fun (tbl : (string, int Base_dData_dList.t_Base_dData_dList_dList) Base_dContainer_dHashMap.t_Base_dContainer_dHashMap_dHashMap) -> ((Base_dData_dList.v_Base_dData_dList_dconcatMap v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposEntryPairs) ((Base_dContainer_dHashMap.v_Base_dContainer_dHashMap_dtoList Base_dData_dString.v_Eq_uString) tbl)))

# 417 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposNormalize = (fun (xs : (string, int) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) -> (v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposTblPairs (v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposTblOf xs)))

# 664 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let rec v_Vuna_dCompiler_dElab_dTermination_dMeasure_dpathInPats = (fun (mc0 : string) (mc1 : Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dPat Base_dData_dList.t_Base_dData_dList_dList) (mc2 : int Base_dData_dList.t_Base_dData_dList_dList) (mc3 : int) -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__215, dtb__216) -> (match (((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dpathInPat mc0) dtb__215) ((Base_dData_dList.v_Base_dData_dList_dappend mc2) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (mc3, Base_dData_dList.C_Base_dData_dList_dList_Nil)))) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__217) -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__217))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> ((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dpathInPats mc0) dtb__216) mc2) (mc3 + 1))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))
# 671 "Vuna/Compiler/Elab/Termination/Measure.vuna"
and v_Vuna_dCompiler_dElab_dTermination_dMeasure_dpathInFields = (fun (mc0 : string) (mc1 : (string, Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dPat) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (mc2 : int Base_dData_dList.t_Base_dData_dList_dList) (mc3 : int) -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__218, dtb__219) -> (match dtb__218 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__220; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__221 } -> (match (((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dpathInPat mc0) dtb__221) ((Base_dData_dList.v_Base_dData_dList_dappend mc2) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (mc3, Base_dData_dList.C_Base_dData_dList_dList_Nil)))) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__222) -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__222))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> ((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dpathInFields mc0) dtb__219) mc2) (mc3 + 1))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))
# 678 "Vuna/Compiler/Elab/Termination/Measure.vuna"
and v_Vuna_dCompiler_dElab_dTermination_dMeasure_dpathInPat = (fun (mc0 : string) (mc1 : Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dPat) (mc2 : int Base_dData_dList.t_Base_dData_dList_dList) -> (match mc1 with
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dPat_PRecord (dtb__223, dtb__224, dtb__225) -> ((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dpathInFields mc0) dtb__224) mc2) 0)
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dPat_PCon (dtb__226, dtb__227, dtb__228) -> ((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dpathInPats mc0) dtb__227) mc2) 0)
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dPat_PWild (dtb__229) -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dPat_PVar (dtb__230, dtb__231) -> (if (dtb__230 = mc0) then (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (mc2)) else Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing)
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
))

# 685 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_Vuna_dCompiler_dElab_dTermination_dMeasure_dprojectionOfDef = (fun (d : (string, (Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dPat Base_dData_dList.t_Base_dData_dList_dList, Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dExpr) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) Base_dData_dPair.t_Base_dData_dPair_dPair) -> ((fun nd_uscrut1 -> (match nd_uscrut1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__232, dtb__233) -> (match dtb__233 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> ((fun nd_uscrut6 -> (match nd_uscrut6 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__234, dtb__235) -> (match dtb__235 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (match (Base_dData_dPair.v_Base_dData_dPair_dsecondOf dtb__232) with
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dExpr_EVar (dtb__236, dtb__237) -> (match (((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dpathInPat (Vuna_dCompiler_dFrontend_dRast_dName.v_Vuna_dCompiler_dFrontend_dRast_dName_drnameKey dtb__236)) dtb__234) Base_dData_dList.C_Base_dData_dList_dList_Nil) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__238) -> (if (v_Vuna_dCompiler_dElab_dTermination_dMeasure_dnotEmpty dtb__238) then (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Base_dData_dPair.v_Base_dData_dPair_dfirstOf d); Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__238 })) else Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
)) (Base_dData_dPair.v_Base_dData_dPair_dfirstOf dtb__232))
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
)) (Base_dData_dPair.v_Base_dData_dPair_dsecondOf d)))

# 700 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let rec v_Vuna_dCompiler_dElab_dTermination_dMeasure_dprojectionsOf = (fun (mc0 : (string, (Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dPat Base_dData_dList.t_Base_dData_dList_dList, Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dExpr) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__239, dtb__240) -> (match (v_Vuna_dCompiler_dElab_dTermination_dMeasure_dprojectionOfDef dtb__239) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__241) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__241, (v_Vuna_dCompiler_dElab_dTermination_dMeasure_dprojectionsOf dtb__240)))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (v_Vuna_dCompiler_dElab_dTermination_dMeasure_dprojectionsOf dtb__240)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 707 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let rec v_Vuna_dCompiler_dElab_dTermination_dMeasure_dprojHas = (fun (mc0 : string) (mc1 : (string, int Base_dData_dList.t_Base_dData_dList_dList) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__242, dtb__243) -> (match dtb__242 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__244; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__245 } -> (if (mc0 = dtb__244) then true else ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dprojHas mc0) dtb__243))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 716 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let rec v_Vuna_dCompiler_dElab_dTermination_dMeasure_dsameCtorGo = (fun (mc0 : int) (mc1 : Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dExpr Base_dData_dList.t_Base_dData_dList_dList) (mc2 : (string, (int, (int, int Base_dData_dList.t_Base_dData_dList_dList) Base_dData_dPair.t_Base_dData_dPair_dPair) Base_dData_dPair.t_Base_dData_dPair_dPair) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (mc3 : int) -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__246, dtb__247) -> (match dtb__246 with
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dExpr_EVar (dtb__248, dtb__249) -> (match ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dsizeOfVarStrict (Vuna_dCompiler_dFrontend_dRast_dName.v_Vuna_dCompiler_dFrontend_dRast_dName_drnameKey dtb__248)) mc2) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__250) -> ((fun nd_uscrut11 -> (match nd_uscrut11 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__251; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__252 } -> (match dtb__252 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__253; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__254 } -> (((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dsameCtorField dtb__251) dtb__253) dtb__254) mc0) dtb__247) mc2) mc3)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) dtb__250)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
)
  | _ -> false
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (mc3 > 0)
  | _ -> failwith "DT: impossible branch"
))
# 728 "Vuna/Compiler/Elab/Termination/Measure.vuna"
and v_Vuna_dCompiler_dElab_dTermination_dMeasure_dsameCtorField = (fun (base : int) (depth : int) (path : int Base_dData_dList.t_Base_dData_dList_dList) (p : int) (rest : Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dExpr Base_dData_dList.t_Base_dData_dList_dList) (sizes : (string, (int, (int, int Base_dData_dList.t_Base_dData_dList_dList) Base_dData_dPair.t_Base_dData_dPair_dPair) Base_dData_dPair.t_Base_dData_dPair_dPair) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (k : int) -> (if (base = p) then (if (depth = 1) then (match path with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__255, dtb__256) -> (match dtb__256 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (if (dtb__255 = k) then ((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dsameCtorGo p) rest) sizes) (k + 1)) else false)
  | _ -> false
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
) else false) else false))

# 713 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_Vuna_dCompiler_dElab_dTermination_dMeasure_dsameCtorApp = (fun (p : int) (args : Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dExpr Base_dData_dList.t_Base_dData_dList_dList) (sizes : (string, (int, (int, int Base_dData_dList.t_Base_dData_dList_dList) Base_dData_dPair.t_Base_dData_dPair_dPair) Base_dData_dPair.t_Base_dData_dPair_dPair) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) -> ((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dsameCtorGo p) args) sizes) 0))

# 743 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let rec v_Vuna_dCompiler_dElab_dTermination_dMeasure_dfindWrapField = (fun (mc0 : int) (mc1 : Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dExpr Base_dData_dList.t_Base_dData_dList_dList) (mc2 : (string, (int, (int, int Base_dData_dList.t_Base_dData_dList_dList) Base_dData_dPair.t_Base_dData_dPair_dPair) Base_dData_dPair.t_Base_dData_dPair_dPair) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (mc3 : int) -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__257, dtb__258) -> (match dtb__257 with
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dExpr_EVar (dtb__259, dtb__260) -> (match ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dsizeOfVarStrict (Vuna_dCompiler_dFrontend_dRast_dName.v_Vuna_dCompiler_dFrontend_dRast_dName_drnameKey dtb__259)) mc2) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__261) -> ((fun nd_uscrut11 -> (match nd_uscrut11 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__262; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__263 } -> (match dtb__263 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__264; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__265 } -> (if (dtb__262 = mc0) then ((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dwrapCheck mc0) dtb__258) mc2) mc3) dtb__264) dtb__265) else ((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dfindWrapField mc0) dtb__258) mc2) (mc3 + 1)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) dtb__261)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> ((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dfindWrapField mc0) dtb__258) mc2) (mc3 + 1))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> ((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dfindWrapField mc0) dtb__258) mc2) (mc3 + 1))
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))
# 761 "Vuna/Compiler/Elab/Termination/Measure.vuna"
and v_Vuna_dCompiler_dElab_dTermination_dMeasure_dwrapCheck = (fun (p : int) (rest : Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dExpr Base_dData_dList.t_Base_dData_dList_dList) (sizes : (string, (int, (int, int Base_dData_dList.t_Base_dData_dList_dList) Base_dData_dPair.t_Base_dData_dPair_dPair) Base_dData_dPair.t_Base_dData_dPair_dPair) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (k : int) (depth : int) (path : int Base_dData_dList.t_Base_dData_dList_dList) -> (if (depth > 0) then (match path with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__266, dtb__267) -> (if (dtb__266 = k) then (if (v_Vuna_dCompiler_dElab_dTermination_dMeasure_dnotEmpty dtb__267) then (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ((k + 2))) else ((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dfindWrapField p) rest) sizes) (k + 1))) else ((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dfindWrapField p) rest) sizes) (k + 1)))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> ((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dfindWrapField p) rest) sizes) (k + 1))
  | _ -> failwith "DT: impossible branch"
) else ((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dfindWrapField p) rest) sizes) (k + 1))))

# 774 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposVarIn = (fun (x : string) (p : int) (caller : string) (facts : (string, int Base_dData_dList.t_Base_dData_dList_dList) Base_dContainer_dHashMap.t_Base_dContainer_dHashMap_dHashMap) (region : string Base_dData_dList.t_Base_dData_dList_dList) -> (if ((Base_dData_dList.v_Base_dData_dList_dmemName x) region) then true else (((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposHasTbl caller) p) facts)))

# 785 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_Vuna_dCompiler_dElab_dTermination_dMeasure_disSubOpName = (fun (op : string) -> (if (if (op = "-") then true else (op = "Base.Trait.Num.sub")) then true else (op = "Base.Trait.Num.-")))

# 789 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_Vuna_dCompiler_dElab_dTermination_dMeasure_disAddOpName = (fun (op : string) -> (if (if (op = "+") then true else (op = "Base.Trait.Num.add")) then true else (op = "Base.Trait.Num.+")))

# 797 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_Vuna_dCompiler_dElab_dTermination_dMeasure_darithMinusBase = (fun (mc0 : int) (mc1 : Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dExpr) (mc2 : int) (mc3 : (string, (int, (int, int Base_dData_dList.t_Base_dData_dList_dList) Base_dData_dPair.t_Base_dData_dPair_dPair) Base_dData_dPair.t_Base_dData_dPair_dPair) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (mc4 : string) (mc5 : (string, int Base_dData_dList.t_Base_dData_dList_dList) Base_dContainer_dHashMap.t_Base_dContainer_dHashMap_dHashMap) (mc6 : string Base_dData_dList.t_Base_dData_dList_dList) -> (match mc1 with
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dExpr_EVar (dtb__268, dtb__269) -> (match ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dsizeOfVarStrict (Vuna_dCompiler_dFrontend_dRast_dName.v_Vuna_dCompiler_dFrontend_dRast_dName_drnameKey dtb__268)) mc3) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__270) -> ((fun nd_uscrut11 -> (match nd_uscrut11 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__271; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__272 } -> (match dtb__272 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__273; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__274 } -> (if (dtb__271 = mc0) then (if (dtb__273 = 0) then (if (((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposVarIn (Vuna_dCompiler_dFrontend_dRast_dName.v_Vuna_dCompiler_dFrontend_dRast_dName_drnameKey dtb__268)) mc0) mc4) mc5) mc6) then (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (4)) else Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing) else Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing) else Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) dtb__270)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
))

# 792 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_Vuna_dCompiler_dElab_dTermination_dMeasure_darithMinus = (fun (mc0 : int) (mc1 : Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dExpr Base_dData_dList.t_Base_dData_dList_dList) (mc2 : (string, (int, (int, int Base_dData_dList.t_Base_dData_dList_dList) Base_dData_dPair.t_Base_dData_dPair_dPair) Base_dData_dPair.t_Base_dData_dPair_dPair) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (mc3 : string) (mc4 : (string, int Base_dData_dList.t_Base_dData_dList_dList) Base_dContainer_dHashMap.t_Base_dContainer_dHashMap_dHashMap) (mc5 : string Base_dData_dList.t_Base_dData_dList_dList) -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__275, dtb__276) -> (match dtb__276 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__277, dtb__278) -> (match dtb__277 with
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dExpr_EInt (dtb__279, dtb__280) -> (match dtb__278 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (if (dtb__279 > 0) then (((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_darithMinusBase mc0) dtb__275) dtb__279) mc2) mc3) mc4) mc5) else Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing)
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
))

# 777 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_Vuna_dCompiler_dElab_dTermination_dMeasure_darithRel = (fun (mc0 : int) (mc1 : Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dExpr) (mc2 : (string, (int, (int, int Base_dData_dList.t_Base_dData_dList_dList) Base_dData_dPair.t_Base_dData_dPair_dPair) Base_dData_dPair.t_Base_dData_dPair_dPair) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (mc3 : string) (mc4 : (string, int Base_dData_dList.t_Base_dData_dList_dList) Base_dContainer_dHashMap.t_Base_dContainer_dHashMap_dHashMap) (mc5 : string Base_dData_dList.t_Base_dData_dList_dList) -> (match mc1 with
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dExpr_EApp (dtb__281, dtb__282, dtb__283) -> (match dtb__281 with
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dExpr_EVar (dtb__284, dtb__285) -> (if (v_Vuna_dCompiler_dElab_dTermination_dMeasure_disSubOpName (Vuna_dCompiler_dFrontend_dRast_dName.v_Vuna_dCompiler_dFrontend_dRast_dName_drnameKey dtb__284)) then ((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_darithMinus mc0) dtb__282) mc2) mc3) mc4) mc5) else Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing)
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
))

# 814 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_Vuna_dCompiler_dElab_dTermination_dMeasure_dprojRel = (fun (mc0 : int) (mc1 : Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dExpr Base_dData_dList.t_Base_dData_dList_dList) (mc2 : (string, (int, (int, int Base_dData_dList.t_Base_dData_dList_dList) Base_dData_dPair.t_Base_dData_dPair_dPair) Base_dData_dPair.t_Base_dData_dPair_dPair) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__286, dtb__287) -> (match dtb__287 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (match dtb__286 with
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dExpr_EVar (dtb__288, dtb__289) -> (match ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dsizeOfVarStrict (Vuna_dCompiler_dFrontend_dRast_dName.v_Vuna_dCompiler_dFrontend_dRast_dName_drnameKey dtb__288)) mc2) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__290) -> ((fun nd_uscrut11 -> (match nd_uscrut11 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__291; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__292 } -> (match dtb__292 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__293; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__294 } -> (if (dtb__291 = mc0) then (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (1)) else Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) dtb__290)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
))

# 889 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_Vuna_dCompiler_dElab_dTermination_dMeasure_dmarkInvalid = (fun (acc : (bool, (((string, string) Base_dData_dPair.t_Base_dData_dPair_dPair, int) Base_dData_dPair.t_Base_dData_dPair_dPair, Vuna_dCompiler_dBase_dSource.t_Vuna_dCompiler_dBase_dSource_dSpan) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) Base_dData_dPair.t_Base_dData_dPair_dPair) -> { Base_dData_dPair.f_Base_dData_dPair_dPair_first = false; Base_dData_dPair.f_Base_dData_dPair_dPair_second = (Base_dData_dPair.v_Base_dData_dPair_dsecondOf acc) })

# 892 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_Vuna_dCompiler_dElab_dTermination_dMeasure_daddEdgeMode = (fun (caller : string) (callee : string) (m : int) (sp : Vuna_dCompiler_dBase_dSource.t_Vuna_dCompiler_dBase_dSource_dSpan) (acc : (bool, (((string, string) Base_dData_dPair.t_Base_dData_dPair_dPair, int) Base_dData_dPair.t_Base_dData_dPair_dPair, Vuna_dCompiler_dBase_dSource.t_Vuna_dCompiler_dBase_dSource_dSpan) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) Base_dData_dPair.t_Base_dData_dPair_dPair) -> { Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Base_dData_dPair.v_Base_dData_dPair_dfirstOf acc); Base_dData_dPair.f_Base_dData_dPair_dPair_second = (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = { Base_dData_dPair.f_Base_dData_dPair_dPair_first = { Base_dData_dPair.f_Base_dData_dPair_dPair_first = caller; Base_dData_dPair.f_Base_dData_dPair_dPair_second = callee }; Base_dData_dPair.f_Base_dData_dPair_dPair_second = m }; Base_dData_dPair.f_Base_dData_dPair_dPair_second = sp }, (Base_dData_dPair.v_Base_dData_dPair_dsecondOf acc))) })

# 896 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_Vuna_dCompiler_dElab_dTermination_dMeasure_dgroupHead = (fun (mc0 : string Base_dData_dList.t_Base_dData_dList_dList) (mc1 : Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dExpr) -> (match mc1 with
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dExpr_EVar (dtb__295, dtb__296) -> (if ((Base_dData_dList.v_Base_dData_dList_dmemName (Vuna_dCompiler_dFrontend_dRast_dName.v_Vuna_dCompiler_dFrontend_dRast_dName_drnameKey dtb__295)) mc0) then (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ((Vuna_dCompiler_dFrontend_dRast_dName.v_Vuna_dCompiler_dFrontend_dRast_dName_drnameKey dtb__295))) else Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing)
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
))

# 900 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let rec v_Vuna_dCompiler_dElab_dTermination_dMeasure_dnthExpr = (fun (mc0 : Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dExpr Base_dData_dList.t_Base_dData_dList_dList) (mc1 : int) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__297, dtb__298) -> (if (mc1 <= 0) then (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__297)) else ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dnthExpr dtb__298) (mc1 - 1)))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 388 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_Vuna_dCompiler_dElab_dTermination_dMeasure_dargPositive = (fun (args : Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dExpr Base_dData_dList.t_Base_dData_dList_dList) (i : int) (sizes : (string, (int, (int, int Base_dData_dList.t_Base_dData_dList_dList) Base_dData_dPair.t_Base_dData_dPair_dPair) Base_dData_dPair.t_Base_dData_dPair_dPair) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (caller : string) (facts : (string, int Base_dData_dList.t_Base_dData_dList_dList) Base_dContainer_dHashMap.t_Base_dContainer_dHashMap_dHashMap) (region : string Base_dData_dList.t_Base_dData_dList_dList) -> (match ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dnthExpr args) i) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> false
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__299) -> (match dtb__299 with
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dExpr_EInt (dtb__300, dtb__301) -> (dtb__300 > 0)
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dExpr_EVar (dtb__302, dtb__303) -> (if ((Base_dData_dList.v_Base_dData_dList_dmemName (Vuna_dCompiler_dFrontend_dRast_dName.v_Vuna_dCompiler_dFrontend_dRast_dName_drnameKey dtb__302)) region) then true else (match ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dsizeOfVarStrict (Vuna_dCompiler_dFrontend_dRast_dName.v_Vuna_dCompiler_dFrontend_dRast_dName_drnameKey dtb__302)) sizes) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__304) -> ((fun nd_uscrut12 -> (match nd_uscrut12 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__305; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__306 } -> (match dtb__306 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__307; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__308 } -> (if (dtb__307 = 0) then (((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposHasTbl caller) dtb__305) facts) else false)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) dtb__304)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
))
  | _ -> false
)
  | _ -> failwith "DT: impossible branch"
))

# 605 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let rec v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalkCalleeGo = (fun (namesTbl : (string, bool) Base_dContainer_dHashMap.t_Base_dContainer_dHashMap_dHashMap) (caller : string) (sizes : (string, (int, (int, int Base_dData_dList.t_Base_dData_dList_dList) Base_dData_dPair.t_Base_dData_dPair_dPair) Base_dData_dPair.t_Base_dData_dPair_dPair) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (facts : (string, int Base_dData_dList.t_Base_dData_dList_dList) Base_dContainer_dHashMap.t_Base_dContainer_dHashMap_dHashMap) (region : string Base_dData_dList.t_Base_dData_dList_dList) (g : string) (remaining : int) (args : Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dExpr Base_dData_dList.t_Base_dData_dList_dList) (st : ((string, int) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList, (string, int) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) Base_dData_dPair.t_Base_dData_dPair_dPair) -> (if (remaining <= 0) then st else ((fun i -> ((fun st1 -> (((((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalkCalleeGo namesTbl) caller) sizes) facts) region) g) (remaining - 1)) args) st1)) (if ((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dargPositive args) i) sizes) caller) facts) region) then (((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposMarkPos g) i) st) else (((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposMarkNeg g) i) st)))) ((Base_dData_dList.v_Base_dData_dList_dlength args) - remaining))))

# 601 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalkCallee = (fun (namesTbl : (string, bool) Base_dContainer_dHashMap.t_Base_dContainer_dHashMap_dHashMap) (caller : string) (sizes : (string, (int, (int, int Base_dData_dList.t_Base_dData_dList_dList) Base_dData_dPair.t_Base_dData_dPair_dPair) Base_dData_dPair.t_Base_dData_dPair_dPair) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (facts : (string, int Base_dData_dList.t_Base_dData_dList_dList) Base_dContainer_dHashMap.t_Base_dContainer_dHashMap_dHashMap) (region : string Base_dData_dList.t_Base_dData_dList_dList) (g : string) (i : int) (args : Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dExpr Base_dData_dList.t_Base_dData_dList_dList) (st : ((string, int) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList, (string, int) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) Base_dData_dPair.t_Base_dData_dPair_dPair) -> (((((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalkCalleeGo namesTbl) caller) sizes) facts) region) g) ((Base_dData_dList.v_Base_dData_dList_dlength args) - i)) args) st))

# 430 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let rec v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalkArgs = (fun (mc0 : (string, bool) Base_dContainer_dHashMap.t_Base_dContainer_dHashMap_dHashMap) (mc1 : string) (mc2 : (string, (int, (int, int Base_dData_dList.t_Base_dData_dList_dList) Base_dData_dPair.t_Base_dData_dPair_dPair) Base_dData_dPair.t_Base_dData_dPair_dPair) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (mc3 : (string, int Base_dData_dList.t_Base_dData_dList_dList) Base_dContainer_dHashMap.t_Base_dContainer_dHashMap_dHashMap) (mc4 : string Base_dData_dList.t_Base_dData_dList_dList) (mc5 : Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dExpr Base_dData_dList.t_Base_dData_dList_dList) (mc6 : ((string, int) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList, (string, int) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) Base_dData_dPair.t_Base_dData_dPair_dPair) -> (match mc5 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__309, dtb__310) -> (((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalkArgs mc0) mc1) mc2) mc3) mc4) dtb__310) (((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalk mc0) mc1) mc2) mc3) mc4) dtb__309) mc6))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> mc6
  | _ -> failwith "DT: impossible branch"
))
# 442 "Vuna/Compiler/Elab/Termination/Measure.vuna"
and v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalkFields = (fun (mc0 : (string, bool) Base_dContainer_dHashMap.t_Base_dContainer_dHashMap_dHashMap) (mc1 : string) (mc2 : (string, (int, (int, int Base_dData_dList.t_Base_dData_dList_dList) Base_dData_dPair.t_Base_dData_dPair_dPair) Base_dData_dPair.t_Base_dData_dPair_dPair) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (mc3 : (string, int Base_dData_dList.t_Base_dData_dList_dList) Base_dContainer_dHashMap.t_Base_dContainer_dHashMap_dHashMap) (mc4 : string Base_dData_dList.t_Base_dData_dList_dList) (mc5 : (string, Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dExpr) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (mc6 : ((string, int) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList, (string, int) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) Base_dData_dPair.t_Base_dData_dPair_dPair) -> (match mc5 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__311, dtb__312) -> (match dtb__311 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__313; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__314 } -> (((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalkFields mc0) mc1) mc2) mc3) mc4) dtb__312) (((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalk mc0) mc1) mc2) mc3) mc4) dtb__314) mc6))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> mc6
  | _ -> failwith "DT: impossible branch"
))
# 454 "Vuna/Compiler/Elab/Termination/Measure.vuna"
and v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalkAlts = (fun (mc0 : (string, bool) Base_dContainer_dHashMap.t_Base_dContainer_dHashMap_dHashMap) (mc1 : string) (mc2 : (string, (int, (int, int Base_dData_dList.t_Base_dData_dList_dList) Base_dData_dPair.t_Base_dData_dPair_dPair) Base_dData_dPair.t_Base_dData_dPair_dPair) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (mc3 : (string, int Base_dData_dList.t_Base_dData_dList_dList) Base_dContainer_dHashMap.t_Base_dContainer_dHashMap_dHashMap) (mc4 : string Base_dData_dList.t_Base_dData_dList_dList) (mc5 : (Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dPat, Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dExpr) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (mc6 : ((string, int) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList, (string, int) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) Base_dData_dPair.t_Base_dData_dPair_dPair) -> (match mc5 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__315, dtb__316) -> (match dtb__315 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__317; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__318 } -> (((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalkAlts mc0) mc1) mc2) mc3) mc4) dtb__316) (((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalk mc0) mc1) mc2) mc3) mc4) dtb__318) mc6))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> mc6
  | _ -> failwith "DT: impossible branch"
))
# 467 "Vuna/Compiler/Elab/Termination/Measure.vuna"
and v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalkClauses = (fun (mc0 : (string, bool) Base_dContainer_dHashMap.t_Base_dContainer_dHashMap_dHashMap) (mc1 : string) (mc2 : (string, (int, (int, int Base_dData_dList.t_Base_dData_dList_dList) Base_dData_dPair.t_Base_dData_dPair_dPair) Base_dData_dPair.t_Base_dData_dPair_dPair) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (mc3 : (string, int Base_dData_dList.t_Base_dData_dList_dList) Base_dContainer_dHashMap.t_Base_dContainer_dHashMap_dHashMap) (mc4 : string Base_dData_dList.t_Base_dData_dList_dList) (mc5 : (Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dPat Base_dData_dList.t_Base_dData_dList_dList, Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dExpr) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (mc6 : ((string, int) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList, (string, int) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) Base_dData_dPair.t_Base_dData_dPair_dPair) -> (match mc5 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__319, dtb__320) -> (match dtb__319 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__321; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__322 } -> (((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalkClauses mc0) mc1) mc2) mc3) mc4) dtb__320) (((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalk mc0) mc1) mc2) mc3) mc4) dtb__322) mc6))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> mc6
  | _ -> failwith "DT: impossible branch"
))
# 479 "Vuna/Compiler/Elab/Termination/Measure.vuna"
and v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalkBinds = (fun (mc0 : (string, bool) Base_dContainer_dHashMap.t_Base_dContainer_dHashMap_dHashMap) (mc1 : string) (mc2 : (string, (int, (int, int Base_dData_dList.t_Base_dData_dList_dList) Base_dData_dPair.t_Base_dData_dPair_dPair) Base_dData_dPair.t_Base_dData_dPair_dPair) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (mc3 : (string, int Base_dData_dList.t_Base_dData_dList_dList) Base_dContainer_dHashMap.t_Base_dContainer_dHashMap_dHashMap) (mc4 : string Base_dData_dList.t_Base_dData_dList_dList) (mc5 : (Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dPat, Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dExpr) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (mc6 : ((string, int) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList, (string, int) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) Base_dData_dPair.t_Base_dData_dPair_dPair) -> (match mc5 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__323, dtb__324) -> (match dtb__323 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__325; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__326 } -> (((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalkBinds mc0) mc1) mc2) mc3) mc4) dtb__324) (((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalk mc0) mc1) mc2) mc3) mc4) dtb__326) mc6))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> mc6
  | _ -> failwith "DT: impossible branch"
))
# 491 "Vuna/Compiler/Elab/Termination/Measure.vuna"
and v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalkStmts = (fun (mc0 : (string, bool) Base_dContainer_dHashMap.t_Base_dContainer_dHashMap_dHashMap) (mc1 : string) (mc2 : (string, (int, (int, int Base_dData_dList.t_Base_dData_dList_dList) Base_dData_dPair.t_Base_dData_dPair_dPair) Base_dData_dPair.t_Base_dData_dPair_dPair) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (mc3 : (string, int Base_dData_dList.t_Base_dData_dList_dList) Base_dContainer_dHashMap.t_Base_dContainer_dHashMap_dHashMap) (mc4 : string Base_dData_dList.t_Base_dData_dList_dList) (mc5 : Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dDoStmt Base_dData_dList.t_Base_dData_dList_dList) (mc6 : ((string, int) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList, (string, int) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) Base_dData_dPair.t_Base_dData_dPair_dPair) -> (match mc5 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__327, dtb__328) -> (match dtb__327 with
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dDoStmt_DBind (dtb__329, dtb__330, dtb__331) -> (((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalkStmts mc0) mc1) mc2) mc3) mc4) dtb__328) (((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalk mc0) mc1) mc2) mc3) mc4) dtb__330) mc6))
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dDoStmt_DExpr (dtb__332, dtb__333) -> (((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalkStmts mc0) mc1) mc2) mc3) mc4) dtb__328) (((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalk mc0) mc1) mc2) mc3) mc4) dtb__332) mc6))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> mc6
  | _ -> failwith "DT: impossible branch"
))
# 514 "Vuna/Compiler/Elab/Termination/Measure.vuna"
and v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalk = (fun (mc0 : (string, bool) Base_dContainer_dHashMap.t_Base_dContainer_dHashMap_dHashMap) (mc1 : string) (mc2 : (string, (int, (int, int Base_dData_dList.t_Base_dData_dList_dList) Base_dData_dPair.t_Base_dData_dPair_dPair) Base_dData_dPair.t_Base_dData_dPair_dPair) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (mc3 : (string, int Base_dData_dList.t_Base_dData_dList_dList) Base_dContainer_dHashMap.t_Base_dContainer_dHashMap_dHashMap) (mc4 : string Base_dData_dList.t_Base_dData_dList_dList) (mc5 : Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dExpr) (mc6 : ((string, int) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList, (string, int) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) Base_dData_dPair.t_Base_dData_dPair_dPair) -> (match mc5 with
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dExpr_EVar (dtb__334, dtb__335) -> mc6
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dExpr_EAnn (dtb__336, dtb__337, dtb__338) -> (((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalk mc0) mc1) mc2) mc3) mc4) dtb__337) (((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalk mc0) mc1) mc2) mc3) mc4) dtb__336) mc6))
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dExpr_EDo (dtb__339, dtb__340) -> (((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalkStmts mc0) mc1) mc2) mc3) mc4) dtb__339) mc6)
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dExpr_ERecUpdate (dtb__341, dtb__342, dtb__343) -> (((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalkFields mc0) mc1) mc2) mc3) mc4) dtb__342) (((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalk mc0) mc1) mc2) mc3) mc4) dtb__341) mc6))
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dExpr_ERecord (dtb__344, dtb__345, dtb__346) -> (((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalkFields mc0) mc1) mc2) mc3) mc4) dtb__345) mc6)
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dExpr_EField (dtb__347, dtb__348, dtb__349) -> (((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalk mc0) mc1) mc2) mc3) mc4) dtb__347) mc6)
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dExpr_EPi (dtb__350, dtb__351, dtb__352, dtb__353, dtb__354, dtb__355) -> (((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalk mc0) mc1) mc2) mc3) mc4) dtb__354) (((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalk mc0) mc1) mc2) mc3) mc4) dtb__353) mc6))
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dExpr_ELet (dtb__356, dtb__357, dtb__358, dtb__359) -> (((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalk mc0) mc1) mc2) mc3) mc4) dtb__357) (((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalkBinds mc0) mc1) mc2) mc3) mc4) dtb__356) mc6))
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dExpr_ELocalFun (dtb__360, dtb__361) -> (((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalkClauses mc0) mc1) mc2) mc3) mc4) dtb__360) mc6)
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dExpr_ELam (dtb__362, dtb__363, dtb__364) -> (((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalk mc0) mc1) mc2) mc3) mc4) dtb__363) mc6)
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dExpr_ECase (dtb__365, dtb__366, dtb__367) -> (((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalkAlts mc0) mc1) mc2) mc3) mc4) dtb__366) (((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalk mc0) mc1) mc2) mc3) mc4) dtb__365) mc6))
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dExpr_EIf (dtb__368, dtb__369, dtb__370, dtb__371) -> ((fun st1 -> ((fun st2 -> (((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalk mc0) mc1) mc2) mc3) ((Base_dData_dList.v_Base_dData_dList_dappend (v_Vuna_dCompiler_dElab_dTermination_dMeasure_dguardElsePosVars dtb__368)) mc4)) dtb__370) st2)) (((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalk mc0) mc1) mc2) mc3) ((Base_dData_dList.v_Base_dData_dList_dappend (v_Vuna_dCompiler_dElab_dTermination_dMeasure_dguardThenPosVars dtb__368)) mc4)) dtb__369) st1))) (((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalk mc0) mc1) mc2) mc3) mc4) dtb__368) mc6))
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dExpr_EApp (dtb__372, dtb__373, dtb__374) -> (match dtb__372 with
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dExpr_EVar (dtb__375, dtb__376) -> (if ((((Base_dContainer_dHashMap.v_Base_dContainer_dHashMap_dmember Base_dData_dString.v_Hashable_uString) Base_dData_dString.v_Eq_uString) (Vuna_dCompiler_dFrontend_dRast_dName.v_Vuna_dCompiler_dFrontend_dRast_dName_drnameKey dtb__375)) mc0) then (((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalkArgs mc0) mc1) mc2) mc3) mc4) dtb__373) (((((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalkCallee mc0) mc1) mc2) mc3) mc4) (Vuna_dCompiler_dFrontend_dRast_dName.v_Vuna_dCompiler_dFrontend_dRast_dName_drnameKey dtb__375)) 0) dtb__373) mc6)) else (((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalkArgs mc0) mc1) mc2) mc3) mc4) dtb__373) (((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalk mc0) mc1) mc2) mc3) mc4) dtb__372) mc6)))
  | _ -> (((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalkArgs mc0) mc1) mc2) mc3) mc4) dtb__373) (((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalk mc0) mc1) mc2) mc3) mc4) dtb__372) mc6))
)
  | _ -> mc6
))

# 615 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let rec v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposScanClauses = (fun (mc0 : (string, bool) Base_dContainer_dHashMap.t_Base_dContainer_dHashMap_dHashMap) (mc1 : (string, (Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dPat Base_dData_dList.t_Base_dData_dList_dList, Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dExpr) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (mc2 : (string, int Base_dData_dList.t_Base_dData_dList_dList) Base_dContainer_dHashMap.t_Base_dContainer_dHashMap_dHashMap) (mc3 : string) (mc4 : (Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dPat Base_dData_dList.t_Base_dData_dList_dList, Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dExpr) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (mc5 : ((string, int) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList, (string, int) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) Base_dData_dPair.t_Base_dData_dPair_dPair) -> (match mc4 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__377, dtb__378) -> ((fun sizes -> ((fun st2 -> ((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposScanClauses mc0) mc1) mc2) mc3) dtb__378) st2)) (((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalk mc0) mc3) sizes) mc2) Base_dData_dList.C_Base_dData_dList_dList_Nil) (Base_dData_dPair.v_Base_dData_dPair_dsecondOf dtb__377)) mc5))) (v_Vuna_dCompiler_dElab_dTermination_dMeasure_dstrSizeEntries (Base_dData_dPair.v_Base_dData_dPair_dfirstOf dtb__377)))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> mc5
  | _ -> failwith "DT: impossible branch"
))

# 623 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let rec v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposScanDefs = (fun (mc0 : (string, bool) Base_dContainer_dHashMap.t_Base_dContainer_dHashMap_dHashMap) (mc1 : (string, (Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dPat Base_dData_dList.t_Base_dData_dList_dList, Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dExpr) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (mc2 : (string, int Base_dData_dList.t_Base_dData_dList_dList) Base_dContainer_dHashMap.t_Base_dContainer_dHashMap_dHashMap) (mc3 : (string, (Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dPat Base_dData_dList.t_Base_dData_dList_dList, Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dExpr) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (mc4 : ((string, int) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList, (string, int) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) Base_dData_dPair.t_Base_dData_dPair_dPair) -> (match mc3 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__379, dtb__380) -> (((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposScanDefs mc0) mc1) mc2) dtb__380) ((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposScanClauses mc0) mc1) mc2) (Base_dData_dPair.v_Base_dData_dPair_dfirstOf dtb__379)) (Base_dData_dPair.v_Base_dData_dPair_dsecondOf dtb__379)) mc4))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> mc4
  | _ -> failwith "DT: impossible branch"
))

# 640 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let rec v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposScanNamesGo = (fun (mc0 : (string, bool) Base_dContainer_dHashMap.t_Base_dContainer_dHashMap_dHashMap) (mc1 : (string, (Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dPat Base_dData_dList.t_Base_dData_dList_dList, Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dExpr) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) Base_dContainer_dHashMap.t_Base_dContainer_dHashMap_dHashMap) (mc2 : (string, int Base_dData_dList.t_Base_dData_dList_dList) Base_dContainer_dHashMap.t_Base_dContainer_dHashMap_dHashMap) (mc3 : string Base_dData_dList.t_Base_dData_dList_dList) (mc4 : ((string, int) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList, (string, int) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) Base_dData_dPair.t_Base_dData_dPair_dPair) -> (match mc3 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__381, dtb__382) -> (((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposScanNamesGo mc0) mc1) mc2) dtb__382) ((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposScanClauses mc0) Base_dData_dList.C_Base_dData_dList_dList_Nil) mc2) dtb__381) ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dclausesOfDefTbl dtb__381) mc1)) mc4))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> mc4
  | _ -> failwith "DT: impossible branch"
))

# 634 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposScanNames = (fun (namesTbl : (string, bool) Base_dContainer_dHashMap.t_Base_dContainer_dHashMap_dHashMap) (defTbl : (string, (Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dPat Base_dData_dList.t_Base_dData_dList_dList, Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dExpr) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) Base_dContainer_dHashMap.t_Base_dContainer_dHashMap_dHashMap) (factsTbl : (string, int Base_dData_dList.t_Base_dData_dList_dList) Base_dContainer_dHashMap.t_Base_dContainer_dHashMap_dHashMap) (work : string Base_dData_dList.t_Base_dData_dList_dList) (st : ((string, int) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList, (string, int) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) Base_dData_dPair.t_Base_dData_dPair_dPair) -> ((fun scanned -> { Base_dData_dPair.f_Base_dData_dPair_dPair_first = (v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposNormalize (Base_dData_dPair.v_Base_dData_dPair_dfirstOf scanned)); Base_dData_dPair.f_Base_dData_dPair_dPair_second = (v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposNormalize (Base_dData_dPair.v_Base_dData_dPair_dsecondOf scanned)) }) (((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposScanNamesGo namesTbl) defTbl) factsTbl) work) st)))

# 651 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let rec v_Vuna_dCompiler_dElab_dTermination_dMeasure_dcomputePosFacts = (fun (defs : (string, (Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dPat Base_dData_dList.t_Base_dData_dList_dList, Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dExpr) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (fuel : int) (facts : (string, int) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) -> (if (fuel <= 0) then facts else (((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dcomputePosFactsStep defs) fuel) facts)))
# 654 "Vuna/Compiler/Elab/Termination/Measure.vuna"
and v_Vuna_dCompiler_dElab_dTermination_dMeasure_dcomputePosFactsStep = (fun (defs : (string, (Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dPat Base_dData_dList.t_Base_dData_dList_dList, Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dExpr) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (fuel : int) (facts : (string, int) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) -> ((fun namesTbl -> ((fun scanned -> ((fun scan -> ((fun fresh -> ((fun merged -> (if ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposSetEqTbl facts) merged) then merged else (((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dcomputePosFacts defs) (fuel - 1)) merged))) ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposUnionTbl facts) fresh))) ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposFilterTbl (Base_dData_dPair.v_Base_dData_dPair_dfirstOf scan)) (v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposTblOf (Base_dData_dPair.v_Base_dData_dPair_dsecondOf scan))))) { Base_dData_dPair.f_Base_dData_dPair_dPair_first = (v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposNormalize (Base_dData_dPair.v_Base_dData_dPair_dfirstOf scanned)); Base_dData_dPair.f_Base_dData_dPair_dPair_second = (v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposNormalize (Base_dData_dPair.v_Base_dData_dPair_dsecondOf scanned)) })) (((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposScanDefs namesTbl) defs) (v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposTblOf facts)) defs) { Base_dData_dPair.f_Base_dData_dPair_dPair_first = Base_dData_dList.C_Base_dData_dList_dList_Nil; Base_dData_dPair.f_Base_dData_dPair_dPair_second = Base_dData_dList.C_Base_dData_dList_dList_Nil }))) (Base_dContainer_dHashMap.v_Base_dContainer_dHashMap_dofNames (v_Vuna_dCompiler_dElab_dTermination_dMeasure_ddefNames defs))))

# 904 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_Vuna_dCompiler_dElab_dTermination_dMeasure_ddotBase = (fun (n : string) -> (Base_dData_dPair.v_Base_dData_dPair_dsecondOf (Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dsplitLastDot (Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dsplitOnDot n))))

# 907 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_Vuna_dCompiler_dElab_dTermination_dMeasure_disMapLike = (fun (n : string) -> (if (if (if (if ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_ddotBase n) = "map") then true else ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_ddotBase n) = "traverse")) then true else ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_ddotBase n) = "concatMap")) then true else ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_ddotBase n) = "mapMaybe")) then true else ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_ddotBase n) = "filter")))

# 914 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_Vuna_dCompiler_dElab_dTermination_dMeasure_dextendElemSizes = (fun (mc0 : (string, (int, (int, int Base_dData_dList.t_Base_dData_dList_dList) Base_dData_dPair.t_Base_dData_dPair_dPair) Base_dData_dPair.t_Base_dData_dPair_dPair) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (mc1 : Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dExpr) (mc2 : string) -> (match mc1 with
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dExpr_EVar (dtb__383, dtb__384) -> (match ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dsizeOfVarStrict (Vuna_dCompiler_dFrontend_dRast_dName.v_Vuna_dCompiler_dFrontend_dRast_dName_drnameKey dtb__383)) mc0) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__385) -> ((fun nd_uscrut7 -> (match nd_uscrut7 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__386; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__387 } -> (match dtb__387 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__388; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__389 } -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = mc2; Base_dData_dPair.f_Base_dData_dPair_dPair_second = { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__386; Base_dData_dPair.f_Base_dData_dPair_dPair_second = { Base_dData_dPair.f_Base_dData_dPair_dPair_first = (dtb__388 + 1); Base_dData_dPair.f_Base_dData_dPair_dPair_second = ((Base_dData_dList.v_Base_dData_dList_dappend dtb__389) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (0, Base_dData_dList.C_Base_dData_dList_dList_Nil))) } } }, mc0))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) dtb__385)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> mc0
  | _ -> failwith "DT: impossible branch"
)
  | _ -> mc0
))

# 927 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let rec v_Vuna_dCompiler_dElab_dTermination_dMeasure_dedgeStrictGo = (fun (mc0 : string) (mc1 : string) (mc2 : (((string, string) Base_dData_dPair.t_Base_dData_dPair_dPair, int) Base_dData_dPair.t_Base_dData_dPair_dPair, Vuna_dCompiler_dBase_dSource.t_Vuna_dCompiler_dBase_dSource_dSpan) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (mc3 : bool) (mc4 : bool) -> (match mc2 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__390, dtb__391) -> (match dtb__390 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__392; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__393 } -> (match dtb__392 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__394; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__395 } -> (match dtb__394 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__396; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__397 } -> (if (dtb__396 = mc0) then (if (dtb__397 = mc1) then (((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dedgeStrictGo mc0) mc1) dtb__391) true) (if (dtb__395 > 0) then mc4 else false)) else (((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dedgeStrictGo mc0) mc1) dtb__391) mc3) mc4)) else (((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dedgeStrictGo mc0) mc1) dtb__391) mc3) mc4))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (if mc3 then mc4 else false)
  | _ -> failwith "DT: impossible branch"
))

# 924 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_Vuna_dCompiler_dElab_dTermination_dMeasure_dedgeStrict = (fun (f : string) (g : string) (edges : (((string, string) Base_dData_dPair.t_Base_dData_dPair_dPair, int) Base_dData_dPair.t_Base_dData_dPair_dPair, Vuna_dCompiler_dBase_dSource.t_Vuna_dCompiler_dBase_dSource_dSpan) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) -> (((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dedgeStrictGo f) g) edges) false) true))

# 941 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let rec v_Vuna_dCompiler_dElab_dTermination_dMeasure_dedgeTargetsGo = (fun (mc0 : string) (mc1 : (((string, string) Base_dData_dPair.t_Base_dData_dPair_dPair, int) Base_dData_dPair.t_Base_dData_dPair_dPair, Vuna_dCompiler_dBase_dSource.t_Vuna_dCompiler_dBase_dSource_dSpan) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__398, dtb__399) -> (match dtb__398 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__400; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__401 } -> (match dtb__400 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__402; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__403 } -> (match dtb__402 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__404; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__405 } -> (if (dtb__404 = mc0) then (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__405, ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dedgeTargetsGo mc0) dtb__399))) else ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dedgeTargetsGo mc0) dtb__399))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 938 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_Vuna_dCompiler_dElab_dTermination_dMeasure_dedgeTargets = (fun (f : string) (edges : (((string, string) Base_dData_dPair.t_Base_dData_dPair_dPair, int) Base_dData_dPair.t_Base_dData_dPair_dPair, Vuna_dCompiler_dBase_dSource.t_Vuna_dCompiler_dBase_dSource_dSpan) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) -> (v_Vuna_dCompiler_dElab_dTermination_dMeasure_ddedup ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dedgeTargetsGo f) edges)))

# 950 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let rec v_Vuna_dCompiler_dElab_dTermination_dMeasure_dweakAdjGo = (fun (mc0 : string Base_dData_dList.t_Base_dData_dList_dList) (mc1 : (((string, string) Base_dData_dPair.t_Base_dData_dPair_dPair, int) Base_dData_dPair.t_Base_dData_dPair_dPair, Vuna_dCompiler_dBase_dSource.t_Vuna_dCompiler_dBase_dSource_dSpan) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (mc2 : string) (mc3 : string Base_dData_dList.t_Base_dData_dList_dList) -> (match mc3 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__406, dtb__407) -> (if (((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dedgeStrict mc2) dtb__406) mc1) then ((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dweakAdjGo mc0) mc1) mc2) dtb__407) else (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__406, ((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dweakAdjGo mc0) mc1) mc2) dtb__407))))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 947 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_Vuna_dCompiler_dElab_dTermination_dMeasure_dweakAdj = (fun (comp : string Base_dData_dList.t_Base_dData_dList_dList) (edges : (((string, string) Base_dData_dPair.t_Base_dData_dPair_dPair, int) Base_dData_dPair.t_Base_dData_dPair_dPair, Vuna_dCompiler_dBase_dSource.t_Vuna_dCompiler_dBase_dSource_dSpan) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (f : string) -> ((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dweakAdjGo comp) edges) f) ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dedgeTargets f) edges)))

# 958 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let rec v_Vuna_dCompiler_dElab_dTermination_dMeasure_dweakReachFuel = (fun (fuel : int) (comp : string Base_dData_dList.t_Base_dData_dList_dList) (edges : (((string, string) Base_dData_dPair.t_Base_dData_dPair_dPair, int) Base_dData_dPair.t_Base_dData_dPair_dPair, Vuna_dCompiler_dBase_dSource.t_Vuna_dCompiler_dBase_dSource_dSpan) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (start : string) (frontier : string Base_dData_dList.t_Base_dData_dList_dList) (visited : string Base_dData_dList.t_Base_dData_dList_dList) -> (if (fuel <= 0) then true else (match frontier with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> false
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__408, dtb__409) -> (if (dtb__408 = start) then true else (if ((Base_dData_dList.v_Base_dData_dList_dmemName dtb__408) visited) then ((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dweakReachFuel (fuel - 1)) comp) edges) start) dtb__409) visited) else ((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dweakReachFuel (fuel - 1)) comp) edges) start) ((Base_dData_dList.v_Base_dData_dList_dappend dtb__409) (((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dweakAdj comp) edges) dtb__408))) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__408, visited)))))
  | _ -> failwith "DT: impossible branch"
)))

# 955 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_Vuna_dCompiler_dElab_dTermination_dMeasure_dweakReach = (fun (comp : string Base_dData_dList.t_Base_dData_dList_dList) (edges : (((string, string) Base_dData_dPair.t_Base_dData_dPair_dPair, int) Base_dData_dPair.t_Base_dData_dPair_dPair, Vuna_dCompiler_dBase_dSource.t_Vuna_dCompiler_dBase_dSource_dSpan) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (start : string) (frontier : string Base_dData_dList.t_Base_dData_dList_dList) (visited : string Base_dData_dList.t_Base_dData_dList_dList) -> ((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dweakReachFuel 100000) comp) edges) start) frontier) visited))

# 971 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let rec v_Vuna_dCompiler_dElab_dTermination_dMeasure_dhasWeakCycleGo = (fun (mc0 : string Base_dData_dList.t_Base_dData_dList_dList) (mc1 : (((string, string) Base_dData_dPair.t_Base_dData_dPair_dPair, int) Base_dData_dPair.t_Base_dData_dPair_dPair, Vuna_dCompiler_dBase_dSource.t_Vuna_dCompiler_dBase_dSource_dSpan) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (mc2 : string Base_dData_dList.t_Base_dData_dList_dList) -> (match mc2 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__410, dtb__411) -> (if (((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dweakReach mc0) mc1) dtb__410) (((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dweakAdj mc0) mc1) dtb__410)) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__410, Base_dData_dList.C_Base_dData_dList_dList_Nil))) then true else (((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dhasWeakCycleGo mc0) mc1) dtb__411))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 968 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_Vuna_dCompiler_dElab_dTermination_dMeasure_dhasWeakCycle = (fun (comp : string Base_dData_dList.t_Base_dData_dList_dList) (edges : (((string, string) Base_dData_dPair.t_Base_dData_dPair_dPair, int) Base_dData_dPair.t_Base_dData_dPair_dPair, Vuna_dCompiler_dBase_dSource.t_Vuna_dCompiler_dBase_dSource_dSpan) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) -> (((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dhasWeakCycleGo comp) edges) comp))

# 978 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_Vuna_dCompiler_dElab_dTermination_dMeasure_drelEqual = 0

# 826 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_Vuna_dCompiler_dElab_dTermination_dMeasure_drelOfArg = (fun (mc0 : int) (mc1 : Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dExpr) (mc2 : (string, (int, (int, int Base_dData_dList.t_Base_dData_dList_dList) Base_dData_dPair.t_Base_dData_dPair_dPair) Base_dData_dPair.t_Base_dData_dPair_dPair) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (mc3 : string Base_dData_dList.t_Base_dData_dList_dList) (mc4 : (string, int Base_dData_dList.t_Base_dData_dList_dList) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (mc5 : string) (mc6 : (string, int Base_dData_dList.t_Base_dData_dList_dList) Base_dContainer_dHashMap.t_Base_dContainer_dHashMap_dHashMap) (mc7 : string Base_dData_dList.t_Base_dData_dList_dList) -> (match mc1 with
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dExpr_EApp (dtb__412, dtb__413, dtb__414) -> (match dtb__412 with
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dExpr_EVar (dtb__415, dtb__416) -> (if ((Base_dData_dList.v_Base_dData_dList_dmemName (Vuna_dCompiler_dFrontend_dRast_dName.v_Vuna_dCompiler_dFrontend_dRast_dName_drnameKey dtb__415)) mc3) then (match ((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dfindWrapField mc0) dtb__413) mc2) 0) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__417) -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__417))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (if (((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dsameCtorApp mc0) dtb__413) mc2) then (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (v_Vuna_dCompiler_dElab_dTermination_dMeasure_drelEqual)) else Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing)
  | _ -> failwith "DT: impossible branch"
) else (if ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dprojHas (Vuna_dCompiler_dFrontend_dRast_dName.v_Vuna_dCompiler_dFrontend_dRast_dName_drnameKey dtb__415)) mc4) then (((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dprojRel mc0) dtb__413) mc2) else ((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_darithRel mc0) mc1) mc2) mc5) mc6) mc7)))
  | _ -> ((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_darithRel mc0) mc1) mc2) mc5) mc6) mc7)
)
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dExpr_EVar (dtb__418, dtb__419) -> (match ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dsizeOfVarStrict (Vuna_dCompiler_dFrontend_dRast_dName.v_Vuna_dCompiler_dFrontend_dRast_dName_drnameKey dtb__418)) mc2) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__420) -> ((fun nd_uscrut12 -> (match nd_uscrut12 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__421; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__422 } -> (match dtb__422 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__423; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__424 } -> (if (dtb__421 = mc0) then (if (dtb__423 > 0) then (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (1)) else (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (0))) else Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) dtb__420)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
))

# 845 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_Vuna_dCompiler_dElab_dTermination_dMeasure_dargRel = (fun (p : int) (args : Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dExpr Base_dData_dList.t_Base_dData_dList_dList) (sizes : (string, (int, (int, int Base_dData_dList.t_Base_dData_dList_dList) Base_dData_dPair.t_Base_dData_dPair_dPair) Base_dData_dPair.t_Base_dData_dPair_dPair) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (ctors : string Base_dData_dList.t_Base_dData_dList_dList) (projs : (string, int Base_dData_dList.t_Base_dData_dList_dList) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (caller : string) (facts : (string, int Base_dData_dList.t_Base_dData_dList_dList) Base_dContainer_dHashMap.t_Base_dContainer_dHashMap_dHashMap) (region : string Base_dData_dList.t_Base_dData_dList_dList) -> (match ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dnthExpr args) p) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__425) -> ((((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_drelOfArg p) dtb__425) sizes) ctors) projs) caller) facts) region)
  | _ -> failwith "DT: impossible branch"
))

# 981 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_Vuna_dCompiler_dElab_dTermination_dMeasure_drelStrictSub = 1

# 984 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_Vuna_dCompiler_dElab_dTermination_dMeasure_drelStrictMinus = 4

# 987 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_Vuna_dCompiler_dElab_dTermination_dMeasure_drelUnknownSize = -1

# 990 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_Vuna_dCompiler_dElab_dTermination_dMeasure_drelMissingGuard = -2

# 993 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_Vuna_dCompiler_dElab_dTermination_dMeasure_drelNoRelation = -3

# 996 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_Vuna_dCompiler_dElab_dTermination_dMeasure_drelOtherPosition = -4

# 877 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_Vuna_dCompiler_dElab_dTermination_dMeasure_dhintArith = (fun (mc0 : int) (mc1 : Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dExpr Base_dData_dList.t_Base_dData_dList_dList) (mc2 : (string, (int, (int, int Base_dData_dList.t_Base_dData_dList_dList) Base_dData_dPair.t_Base_dData_dPair_dPair) Base_dData_dPair.t_Base_dData_dPair_dPair) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (mc3 : int) -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__426, dtb__427) -> (match dtb__426 with
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dExpr_EVar (dtb__428, dtb__429) -> (match dtb__427 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__430, dtb__431) -> (match dtb__430 with
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dExpr_EInt (dtb__432, dtb__433) -> (match dtb__431 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (if (dtb__432 <= 0) then (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (v_Vuna_dCompiler_dElab_dTermination_dMeasure_drelNoRelation)) else (match ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dsizeOfVarStrict (Vuna_dCompiler_dFrontend_dRast_dName.v_Vuna_dCompiler_dFrontend_dRast_dName_drnameKey dtb__428)) mc2) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__434) -> ((fun nd_uscrut17 -> (match nd_uscrut17 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__435; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__436 } -> (match dtb__436 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__437; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__438 } -> (if (dtb__435 = mc0) then (if (dtb__437 = 0) then (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (mc3)) else (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (v_Vuna_dCompiler_dElab_dTermination_dMeasure_drelNoRelation))) else (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (v_Vuna_dCompiler_dElab_dTermination_dMeasure_drelOtherPosition)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) dtb__434)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (v_Vuna_dCompiler_dElab_dTermination_dMeasure_drelUnknownSize))
  | _ -> failwith "DT: impossible branch"
))
  | _ -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (v_Vuna_dCompiler_dElab_dTermination_dMeasure_drelNoRelation))
)
  | _ -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (v_Vuna_dCompiler_dElab_dTermination_dMeasure_drelNoRelation))
)
  | _ -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (v_Vuna_dCompiler_dElab_dTermination_dMeasure_drelNoRelation))
)
  | _ -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (v_Vuna_dCompiler_dElab_dTermination_dMeasure_drelNoRelation))
)
  | _ -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (v_Vuna_dCompiler_dElab_dTermination_dMeasure_drelNoRelation))
))

# 999 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_Vuna_dCompiler_dElab_dTermination_dMeasure_drelAscending = -5

# 853 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_Vuna_dCompiler_dElab_dTermination_dMeasure_dargRelHint = (fun (p : int) (args : Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dExpr Base_dData_dList.t_Base_dData_dList_dList) (sizes : (string, (int, (int, int Base_dData_dList.t_Base_dData_dList_dList) Base_dData_dPair.t_Base_dData_dPair_dPair) Base_dData_dPair.t_Base_dData_dPair_dPair) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (ctors : string Base_dData_dList.t_Base_dData_dList_dList) -> (match ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dnthExpr args) p) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__439) -> ((fun nd_uscrut6 -> (match nd_uscrut6 with
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dExpr_EApp (dtb__440, dtb__441, dtb__442) -> (match dtb__440 with
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dExpr_EVar (dtb__443, dtb__444) -> (if (v_Vuna_dCompiler_dElab_dTermination_dMeasure_disSubOpName (Vuna_dCompiler_dFrontend_dRast_dName.v_Vuna_dCompiler_dFrontend_dRast_dName_drnameKey dtb__443)) then ((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dhintArith p) dtb__441) sizes) v_Vuna_dCompiler_dElab_dTermination_dMeasure_drelMissingGuard) else (if (v_Vuna_dCompiler_dElab_dTermination_dMeasure_disAddOpName (Vuna_dCompiler_dFrontend_dRast_dName.v_Vuna_dCompiler_dFrontend_dRast_dName_drnameKey dtb__443)) then ((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dhintArith p) dtb__441) sizes) v_Vuna_dCompiler_dElab_dTermination_dMeasure_drelAscending) else (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (v_Vuna_dCompiler_dElab_dTermination_dMeasure_drelNoRelation))))
  | _ -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (v_Vuna_dCompiler_dElab_dTermination_dMeasure_drelNoRelation))
)
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dExpr_EVar (dtb__445, dtb__446) -> (if ((Base_dData_dList.v_Base_dData_dList_dmemName (Vuna_dCompiler_dFrontend_dRast_dName.v_Vuna_dCompiler_dFrontend_dRast_dName_drnameKey dtb__445)) ctors) then (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (v_Vuna_dCompiler_dElab_dTermination_dMeasure_drelNoRelation)) else (match ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dsizeOfVarStrict (Vuna_dCompiler_dFrontend_dRast_dName.v_Vuna_dCompiler_dFrontend_dRast_dName_drnameKey dtb__445)) sizes) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__447) -> ((fun nd_uscrut11 -> (match nd_uscrut11 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__448; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__449 } -> (match dtb__449 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__450; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__451 } -> (if (dtb__448 = p) then (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (v_Vuna_dCompiler_dElab_dTermination_dMeasure_drelNoRelation)) else (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (v_Vuna_dCompiler_dElab_dTermination_dMeasure_drelOtherPosition)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) dtb__447)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (v_Vuna_dCompiler_dElab_dTermination_dMeasure_drelUnknownSize))
  | _ -> failwith "DT: impossible branch"
))
  | _ -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (v_Vuna_dCompiler_dElab_dTermination_dMeasure_drelNoRelation))
)) dtb__439)
  | _ -> failwith "DT: impossible branch"
))

# 1003 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_Vuna_dCompiler_dElab_dTermination_dMeasure_drelText = (fun (m : int) -> (if (m = v_Vuna_dCompiler_dElab_dTermination_dMeasure_drelStrictSub) then "strict subterm" else (if (m = v_Vuna_dCompiler_dElab_dTermination_dMeasure_drelStrictMinus) then "decreases by a constant, with the non-negativity guard proven" else (if (m = v_Vuna_dCompiler_dElab_dTermination_dMeasure_drelMissingGuard) then "decreases by a constant, but the non-negativity guard is missing" else (if (m = v_Vuna_dCompiler_dElab_dTermination_dMeasure_drelUnknownSize) then "no known size (not a subterm of a parameter)" else (if (m = v_Vuna_dCompiler_dElab_dTermination_dMeasure_drelOtherPosition) then "decreases a different parameter" else (if (m = v_Vuna_dCompiler_dElab_dTermination_dMeasure_drelEqual) then "unchanged" else (if (m = v_Vuna_dCompiler_dElab_dTermination_dMeasure_drelAscending) then "increases instead of decreasing (ascending counters are not supported)" else "no size relation"))))))))

# 1022 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_Vuna_dCompiler_dElab_dTermination_dMeasure_disDescent = (fun (m : int) -> (m > 0))

# 1025 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let rec v_Vuna_dCompiler_dElab_dTermination_dMeasure_dfilterModes = (fun (mc0 : int Base_dData_dList.t_Base_dData_dList_dList) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__452, dtb__453) -> (if (v_Vuna_dCompiler_dElab_dTermination_dMeasure_disDescent dtb__452) then (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__452, (v_Vuna_dCompiler_dElab_dTermination_dMeasure_dfilterModes dtb__453))) else (v_Vuna_dCompiler_dElab_dTermination_dMeasure_dfilterModes dtb__453))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))
