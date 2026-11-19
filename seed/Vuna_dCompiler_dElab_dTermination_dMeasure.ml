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

# 302 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_Vuna_dCompiler_dElab_dTermination_dMeasure_dguardGTZero = (fun (mc0 : Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dExpr Base_dData_dList.t_Base_dData_dList_dList) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__165, dtb__166) -> (match dtb__166 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__167, dtb__168) -> (match dtb__168 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (match dtb__167 with
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dExpr_EInt (dtb__169, dtb__170) -> (if (dtb__169 = 0) then (v_Vuna_dCompiler_dElab_dTermination_dMeasure_dvarOfExpr dtb__165) else Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing)
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
))

# 309 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_Vuna_dCompiler_dElab_dTermination_dMeasure_dguardGEOne = (fun (mc0 : Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dExpr Base_dData_dList.t_Base_dData_dList_dList) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__171, dtb__172) -> (match dtb__172 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__173, dtb__174) -> (match dtb__174 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (match dtb__173 with
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dExpr_EInt (dtb__175, dtb__176) -> (if (dtb__175 = 1) then (v_Vuna_dCompiler_dElab_dTermination_dMeasure_dvarOfExpr dtb__171) else Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing)
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
))

# 316 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_Vuna_dCompiler_dElab_dTermination_dMeasure_dguardZeroLT = (fun (mc0 : Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dExpr Base_dData_dList.t_Base_dData_dList_dList) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__177, dtb__178) -> (match dtb__178 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__179, dtb__180) -> (match dtb__180 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (match dtb__177 with
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dExpr_EInt (dtb__181, dtb__182) -> (if (dtb__181 = 0) then (v_Vuna_dCompiler_dElab_dTermination_dMeasure_dvarOfExpr dtb__179) else Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing)
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
))

# 323 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_Vuna_dCompiler_dElab_dTermination_dMeasure_dguardOneLE = (fun (mc0 : Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dExpr Base_dData_dList.t_Base_dData_dList_dList) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__183, dtb__184) -> (match dtb__184 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__185, dtb__186) -> (match dtb__186 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (match dtb__183 with
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dExpr_EInt (dtb__187, dtb__188) -> (if (dtb__187 = 1) then (v_Vuna_dCompiler_dElab_dTermination_dMeasure_dvarOfExpr dtb__185) else Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing)
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
))

# 286 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_Vuna_dCompiler_dElab_dTermination_dMeasure_dguardThenPosVar = (fun (e : Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dExpr) -> ((fun nd_uscrut1 -> (match nd_uscrut1 with
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dExpr_EApp (dtb__189, dtb__190, dtb__191) -> (match dtb__189 with
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dExpr_EVar (dtb__192, dtb__193) -> (if ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dopBaseName (Vuna_dCompiler_dFrontend_dRast_dName.v_Vuna_dCompiler_dFrontend_dRast_dName_drnameKey dtb__192)) = "gt") then (v_Vuna_dCompiler_dElab_dTermination_dMeasure_dguardGTZero dtb__190) else (if ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dopBaseName (Vuna_dCompiler_dFrontend_dRast_dName.v_Vuna_dCompiler_dFrontend_dRast_dName_drnameKey dtb__192)) = "ge") then (v_Vuna_dCompiler_dElab_dTermination_dMeasure_dguardGEOne dtb__190) else (if ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dopBaseName (Vuna_dCompiler_dFrontend_dRast_dName.v_Vuna_dCompiler_dFrontend_dRast_dName_drnameKey dtb__192)) = "lt") then (v_Vuna_dCompiler_dElab_dTermination_dMeasure_dguardZeroLT dtb__190) else (if ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dopBaseName (Vuna_dCompiler_dFrontend_dRast_dName.v_Vuna_dCompiler_dFrontend_dRast_dName_drnameKey dtb__192)) = "le") then (v_Vuna_dCompiler_dElab_dTermination_dMeasure_dguardOneLE dtb__190) else (if ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dopBaseName (Vuna_dCompiler_dFrontend_dRast_dName.v_Vuna_dCompiler_dFrontend_dRast_dName_drnameKey dtb__192)) = ">") then (v_Vuna_dCompiler_dElab_dTermination_dMeasure_dguardGTZero dtb__190) else (if ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dopBaseName (Vuna_dCompiler_dFrontend_dRast_dName.v_Vuna_dCompiler_dFrontend_dRast_dName_drnameKey dtb__192)) = ">=") then (v_Vuna_dCompiler_dElab_dTermination_dMeasure_dguardGEOne dtb__190) else (if ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dopBaseName (Vuna_dCompiler_dFrontend_dRast_dName.v_Vuna_dCompiler_dFrontend_dRast_dName_drnameKey dtb__192)) = "<") then (v_Vuna_dCompiler_dElab_dTermination_dMeasure_dguardZeroLT dtb__190) else (if ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dopBaseName (Vuna_dCompiler_dFrontend_dRast_dName.v_Vuna_dCompiler_dFrontend_dRast_dName_drnameKey dtb__192)) = "<=") then (v_Vuna_dCompiler_dElab_dTermination_dMeasure_dguardOneLE dtb__190) else Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing))))))))
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
)) e))

# 353 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposMarkPos = (fun (f : string) (i : int) (st : ((string, int) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList, (string, int) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) Base_dData_dPair.t_Base_dData_dPair_dPair) -> { Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = f; Base_dData_dPair.f_Base_dData_dPair_dPair_second = i }, (Base_dData_dPair.v_Base_dData_dPair_dfirstOf st))); Base_dData_dPair.f_Base_dData_dPair_dPair_second = (Base_dData_dPair.v_Base_dData_dPair_dsecondOf st) })

# 356 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposMarkNeg = (fun (f : string) (i : int) (st : ((string, int) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList, (string, int) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) Base_dData_dPair.t_Base_dData_dPair_dPair) -> { Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Base_dData_dPair.v_Base_dData_dPair_dfirstOf st); Base_dData_dPair.f_Base_dData_dPair_dPair_second = (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = f; Base_dData_dPair.f_Base_dData_dPair_dPair_second = i }, (Base_dData_dPair.v_Base_dData_dPair_dsecondOf st))) })

# 369 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let rec v_Vuna_dCompiler_dElab_dTermination_dMeasure_ddedupInts = (fun (mc0 : int Base_dData_dList.t_Base_dData_dList_dList) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__194, dtb__195) -> (if ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dmemInt dtb__194) dtb__195) then (v_Vuna_dCompiler_dElab_dTermination_dMeasure_ddedupInts dtb__195) else (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__194, (v_Vuna_dCompiler_dElab_dTermination_dMeasure_ddedupInts dtb__195))))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 366 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposEntryPairs = (fun (mc0 : (string, int Base_dData_dList.t_Base_dData_dList_dList) Base_dData_dPair.t_Base_dData_dPair_dPair) -> (match mc0 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__196; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__197 } -> ((Base_dData_dList.v_Base_dData_dList_dmap (fun (i : int) -> { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__196; Base_dData_dPair.f_Base_dData_dPair_dPair_second = i })) (v_Vuna_dCompiler_dElab_dTermination_dMeasure_ddedupInts dtb__197))
  | _ -> failwith "DT: impossible branch"
))

# 363 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposTblPairs = (fun (tbl : (string, int Base_dData_dList.t_Base_dData_dList_dList) Base_dContainer_dHashMap.t_Base_dContainer_dHashMap_dHashMap) -> ((Base_dData_dList.v_Base_dData_dList_dconcatMap v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposEntryPairs) ((Base_dContainer_dHashMap.v_Base_dContainer_dHashMap_dtoList Base_dData_dString.v_Eq_uString) tbl)))

# 360 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposNormalize = (fun (xs : (string, int) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) -> (v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposTblPairs (v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposTblOf xs)))

# 621 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let rec v_Vuna_dCompiler_dElab_dTermination_dMeasure_dpathInPats = (fun (mc0 : string) (mc1 : Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dPat Base_dData_dList.t_Base_dData_dList_dList) (mc2 : int Base_dData_dList.t_Base_dData_dList_dList) (mc3 : int) -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__198, dtb__199) -> (match (((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dpathInPat mc0) dtb__198) ((Base_dData_dList.v_Base_dData_dList_dappend mc2) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (mc3, Base_dData_dList.C_Base_dData_dList_dList_Nil)))) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__200) -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__200))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> ((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dpathInPats mc0) dtb__199) mc2) (mc3 + 1))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))
# 628 "Vuna/Compiler/Elab/Termination/Measure.vuna"
and v_Vuna_dCompiler_dElab_dTermination_dMeasure_dpathInFields = (fun (mc0 : string) (mc1 : (string, Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dPat) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (mc2 : int Base_dData_dList.t_Base_dData_dList_dList) (mc3 : int) -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__201, dtb__202) -> (match dtb__201 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__203; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__204 } -> (match (((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dpathInPat mc0) dtb__204) ((Base_dData_dList.v_Base_dData_dList_dappend mc2) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (mc3, Base_dData_dList.C_Base_dData_dList_dList_Nil)))) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__205) -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__205))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> ((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dpathInFields mc0) dtb__202) mc2) (mc3 + 1))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))
# 635 "Vuna/Compiler/Elab/Termination/Measure.vuna"
and v_Vuna_dCompiler_dElab_dTermination_dMeasure_dpathInPat = (fun (mc0 : string) (mc1 : Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dPat) (mc2 : int Base_dData_dList.t_Base_dData_dList_dList) -> (match mc1 with
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dPat_PRecord (dtb__206, dtb__207, dtb__208) -> ((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dpathInFields mc0) dtb__207) mc2) 0)
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dPat_PCon (dtb__209, dtb__210, dtb__211) -> ((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dpathInPats mc0) dtb__210) mc2) 0)
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dPat_PWild (dtb__212) -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dPat_PVar (dtb__213, dtb__214) -> (if (dtb__213 = mc0) then (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (mc2)) else Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing)
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
))

# 642 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_Vuna_dCompiler_dElab_dTermination_dMeasure_dprojectionOfDef = (fun (d : (string, (Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dPat Base_dData_dList.t_Base_dData_dList_dList, Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dExpr) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) Base_dData_dPair.t_Base_dData_dPair_dPair) -> ((fun nd_uscrut1 -> (match nd_uscrut1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__215, dtb__216) -> (match dtb__216 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> ((fun nd_uscrut6 -> (match nd_uscrut6 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__217, dtb__218) -> (match dtb__218 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (match (Base_dData_dPair.v_Base_dData_dPair_dsecondOf dtb__215) with
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dExpr_EVar (dtb__219, dtb__220) -> (match (((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dpathInPat (Vuna_dCompiler_dFrontend_dRast_dName.v_Vuna_dCompiler_dFrontend_dRast_dName_drnameKey dtb__219)) dtb__217) Base_dData_dList.C_Base_dData_dList_dList_Nil) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__221) -> (if (v_Vuna_dCompiler_dElab_dTermination_dMeasure_dnotEmpty dtb__221) then (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Base_dData_dPair.v_Base_dData_dPair_dfirstOf d); Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__221 })) else Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
)) (Base_dData_dPair.v_Base_dData_dPair_dfirstOf dtb__215))
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
)) (Base_dData_dPair.v_Base_dData_dPair_dsecondOf d)))

# 657 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let rec v_Vuna_dCompiler_dElab_dTermination_dMeasure_dprojectionsOf = (fun (mc0 : (string, (Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dPat Base_dData_dList.t_Base_dData_dList_dList, Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dExpr) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__222, dtb__223) -> (match (v_Vuna_dCompiler_dElab_dTermination_dMeasure_dprojectionOfDef dtb__222) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__224) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__224, (v_Vuna_dCompiler_dElab_dTermination_dMeasure_dprojectionsOf dtb__223)))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (v_Vuna_dCompiler_dElab_dTermination_dMeasure_dprojectionsOf dtb__223)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 664 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let rec v_Vuna_dCompiler_dElab_dTermination_dMeasure_dprojHas = (fun (mc0 : string) (mc1 : (string, int Base_dData_dList.t_Base_dData_dList_dList) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__225, dtb__226) -> (match dtb__225 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__227; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__228 } -> (if (mc0 = dtb__227) then true else ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dprojHas mc0) dtb__226))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 673 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let rec v_Vuna_dCompiler_dElab_dTermination_dMeasure_dsameCtorGo = (fun (mc0 : int) (mc1 : Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dExpr Base_dData_dList.t_Base_dData_dList_dList) (mc2 : (string, (int, (int, int Base_dData_dList.t_Base_dData_dList_dList) Base_dData_dPair.t_Base_dData_dPair_dPair) Base_dData_dPair.t_Base_dData_dPair_dPair) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (mc3 : int) -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__229, dtb__230) -> (match dtb__229 with
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dExpr_EVar (dtb__231, dtb__232) -> (match ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dsizeOfVarStrict (Vuna_dCompiler_dFrontend_dRast_dName.v_Vuna_dCompiler_dFrontend_dRast_dName_drnameKey dtb__231)) mc2) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__233) -> ((fun nd_uscrut11 -> (match nd_uscrut11 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__234; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__235 } -> (match dtb__235 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__236; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__237 } -> (((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dsameCtorField dtb__234) dtb__236) dtb__237) mc0) dtb__230) mc2) mc3)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) dtb__233)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
)
  | _ -> false
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (mc3 > 0)
  | _ -> failwith "DT: impossible branch"
))
# 685 "Vuna/Compiler/Elab/Termination/Measure.vuna"
and v_Vuna_dCompiler_dElab_dTermination_dMeasure_dsameCtorField = (fun (base : int) (depth : int) (path : int Base_dData_dList.t_Base_dData_dList_dList) (p : int) (rest : Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dExpr Base_dData_dList.t_Base_dData_dList_dList) (sizes : (string, (int, (int, int Base_dData_dList.t_Base_dData_dList_dList) Base_dData_dPair.t_Base_dData_dPair_dPair) Base_dData_dPair.t_Base_dData_dPair_dPair) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (k : int) -> (if (base = p) then (if (depth = 1) then (match path with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__238, dtb__239) -> (match dtb__239 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (if (dtb__238 = k) then ((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dsameCtorGo p) rest) sizes) (k + 1)) else false)
  | _ -> false
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
) else false) else false))

# 670 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_Vuna_dCompiler_dElab_dTermination_dMeasure_dsameCtorApp = (fun (p : int) (args : Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dExpr Base_dData_dList.t_Base_dData_dList_dList) (sizes : (string, (int, (int, int Base_dData_dList.t_Base_dData_dList_dList) Base_dData_dPair.t_Base_dData_dPair_dPair) Base_dData_dPair.t_Base_dData_dPair_dPair) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) -> ((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dsameCtorGo p) args) sizes) 0))

# 700 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let rec v_Vuna_dCompiler_dElab_dTermination_dMeasure_dfindWrapField = (fun (mc0 : int) (mc1 : Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dExpr Base_dData_dList.t_Base_dData_dList_dList) (mc2 : (string, (int, (int, int Base_dData_dList.t_Base_dData_dList_dList) Base_dData_dPair.t_Base_dData_dPair_dPair) Base_dData_dPair.t_Base_dData_dPair_dPair) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (mc3 : int) -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__240, dtb__241) -> (match dtb__240 with
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dExpr_EVar (dtb__242, dtb__243) -> (match ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dsizeOfVarStrict (Vuna_dCompiler_dFrontend_dRast_dName.v_Vuna_dCompiler_dFrontend_dRast_dName_drnameKey dtb__242)) mc2) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__244) -> ((fun nd_uscrut11 -> (match nd_uscrut11 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__245; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__246 } -> (match dtb__246 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__247; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__248 } -> (if (dtb__245 = mc0) then ((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dwrapCheck mc0) dtb__241) mc2) mc3) dtb__247) dtb__248) else ((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dfindWrapField mc0) dtb__241) mc2) (mc3 + 1)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) dtb__244)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> ((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dfindWrapField mc0) dtb__241) mc2) (mc3 + 1))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> ((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dfindWrapField mc0) dtb__241) mc2) (mc3 + 1))
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))
# 718 "Vuna/Compiler/Elab/Termination/Measure.vuna"
and v_Vuna_dCompiler_dElab_dTermination_dMeasure_dwrapCheck = (fun (p : int) (rest : Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dExpr Base_dData_dList.t_Base_dData_dList_dList) (sizes : (string, (int, (int, int Base_dData_dList.t_Base_dData_dList_dList) Base_dData_dPair.t_Base_dData_dPair_dPair) Base_dData_dPair.t_Base_dData_dPair_dPair) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (k : int) (depth : int) (path : int Base_dData_dList.t_Base_dData_dList_dList) -> (if (depth > 0) then (match path with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__249, dtb__250) -> (if (dtb__249 = k) then (if (v_Vuna_dCompiler_dElab_dTermination_dMeasure_dnotEmpty dtb__250) then (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ((k + 2))) else ((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dfindWrapField p) rest) sizes) (k + 1))) else ((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dfindWrapField p) rest) sizes) (k + 1)))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> ((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dfindWrapField p) rest) sizes) (k + 1))
  | _ -> failwith "DT: impossible branch"
) else ((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dfindWrapField p) rest) sizes) (k + 1))))

# 731 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposVarIn = (fun (x : string) (p : int) (caller : string) (facts : (string, int Base_dData_dList.t_Base_dData_dList_dList) Base_dContainer_dHashMap.t_Base_dContainer_dHashMap_dHashMap) (region : string Base_dData_dList.t_Base_dData_dList_dList) -> (if ((Base_dData_dList.v_Base_dData_dList_dmemName x) region) then true else (((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposHasTbl caller) p) facts)))

# 742 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_Vuna_dCompiler_dElab_dTermination_dMeasure_disSubOpName = (fun (op : string) -> (if (if (op = "-") then true else (op = "Base.Trait.Num.sub")) then true else (op = "Base.Trait.Num.-")))

# 746 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_Vuna_dCompiler_dElab_dTermination_dMeasure_disAddOpName = (fun (op : string) -> (if (if (op = "+") then true else (op = "Base.Trait.Num.add")) then true else (op = "Base.Trait.Num.+")))

# 754 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_Vuna_dCompiler_dElab_dTermination_dMeasure_darithMinusBase = (fun (mc0 : int) (mc1 : Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dExpr) (mc2 : int) (mc3 : (string, (int, (int, int Base_dData_dList.t_Base_dData_dList_dList) Base_dData_dPair.t_Base_dData_dPair_dPair) Base_dData_dPair.t_Base_dData_dPair_dPair) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (mc4 : string) (mc5 : (string, int Base_dData_dList.t_Base_dData_dList_dList) Base_dContainer_dHashMap.t_Base_dContainer_dHashMap_dHashMap) (mc6 : string Base_dData_dList.t_Base_dData_dList_dList) -> (match mc1 with
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dExpr_EVar (dtb__251, dtb__252) -> (match ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dsizeOfVarStrict (Vuna_dCompiler_dFrontend_dRast_dName.v_Vuna_dCompiler_dFrontend_dRast_dName_drnameKey dtb__251)) mc3) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__253) -> ((fun nd_uscrut11 -> (match nd_uscrut11 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__254; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__255 } -> (match dtb__255 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__256; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__257 } -> (if (dtb__254 = mc0) then (if (dtb__256 = 0) then (if (((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposVarIn (Vuna_dCompiler_dFrontend_dRast_dName.v_Vuna_dCompiler_dFrontend_dRast_dName_drnameKey dtb__251)) mc0) mc4) mc5) mc6) then (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (4)) else Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing) else Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing) else Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) dtb__253)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
))

# 749 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_Vuna_dCompiler_dElab_dTermination_dMeasure_darithMinus = (fun (mc0 : int) (mc1 : Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dExpr Base_dData_dList.t_Base_dData_dList_dList) (mc2 : (string, (int, (int, int Base_dData_dList.t_Base_dData_dList_dList) Base_dData_dPair.t_Base_dData_dPair_dPair) Base_dData_dPair.t_Base_dData_dPair_dPair) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (mc3 : string) (mc4 : (string, int Base_dData_dList.t_Base_dData_dList_dList) Base_dContainer_dHashMap.t_Base_dContainer_dHashMap_dHashMap) (mc5 : string Base_dData_dList.t_Base_dData_dList_dList) -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__258, dtb__259) -> (match dtb__259 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__260, dtb__261) -> (match dtb__260 with
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dExpr_EInt (dtb__262, dtb__263) -> (match dtb__261 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (if (dtb__262 > 0) then (((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_darithMinusBase mc0) dtb__258) dtb__262) mc2) mc3) mc4) mc5) else Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing)
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
))

# 734 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_Vuna_dCompiler_dElab_dTermination_dMeasure_darithRel = (fun (mc0 : int) (mc1 : Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dExpr) (mc2 : (string, (int, (int, int Base_dData_dList.t_Base_dData_dList_dList) Base_dData_dPair.t_Base_dData_dPair_dPair) Base_dData_dPair.t_Base_dData_dPair_dPair) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (mc3 : string) (mc4 : (string, int Base_dData_dList.t_Base_dData_dList_dList) Base_dContainer_dHashMap.t_Base_dContainer_dHashMap_dHashMap) (mc5 : string Base_dData_dList.t_Base_dData_dList_dList) -> (match mc1 with
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dExpr_EApp (dtb__264, dtb__265, dtb__266) -> (match dtb__264 with
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dExpr_EVar (dtb__267, dtb__268) -> (if (v_Vuna_dCompiler_dElab_dTermination_dMeasure_disSubOpName (Vuna_dCompiler_dFrontend_dRast_dName.v_Vuna_dCompiler_dFrontend_dRast_dName_drnameKey dtb__267)) then ((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_darithMinus mc0) dtb__265) mc2) mc3) mc4) mc5) else Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing)
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
))

# 771 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_Vuna_dCompiler_dElab_dTermination_dMeasure_dprojRel = (fun (mc0 : int) (mc1 : Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dExpr Base_dData_dList.t_Base_dData_dList_dList) (mc2 : (string, (int, (int, int Base_dData_dList.t_Base_dData_dList_dList) Base_dData_dPair.t_Base_dData_dPair_dPair) Base_dData_dPair.t_Base_dData_dPair_dPair) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__269, dtb__270) -> (match dtb__270 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (match dtb__269 with
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dExpr_EVar (dtb__271, dtb__272) -> (match ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dsizeOfVarStrict (Vuna_dCompiler_dFrontend_dRast_dName.v_Vuna_dCompiler_dFrontend_dRast_dName_drnameKey dtb__271)) mc2) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__273) -> ((fun nd_uscrut11 -> (match nd_uscrut11 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__274; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__275 } -> (match dtb__275 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__276; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__277 } -> (if (dtb__274 = mc0) then (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (1)) else Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) dtb__273)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
))

# 846 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_Vuna_dCompiler_dElab_dTermination_dMeasure_dmarkInvalid = (fun (acc : (bool, (((string, string) Base_dData_dPair.t_Base_dData_dPair_dPair, int) Base_dData_dPair.t_Base_dData_dPair_dPair, Vuna_dCompiler_dBase_dSource.t_Vuna_dCompiler_dBase_dSource_dSpan) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) Base_dData_dPair.t_Base_dData_dPair_dPair) -> { Base_dData_dPair.f_Base_dData_dPair_dPair_first = false; Base_dData_dPair.f_Base_dData_dPair_dPair_second = (Base_dData_dPair.v_Base_dData_dPair_dsecondOf acc) })

# 849 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_Vuna_dCompiler_dElab_dTermination_dMeasure_daddEdgeMode = (fun (caller : string) (callee : string) (m : int) (sp : Vuna_dCompiler_dBase_dSource.t_Vuna_dCompiler_dBase_dSource_dSpan) (acc : (bool, (((string, string) Base_dData_dPair.t_Base_dData_dPair_dPair, int) Base_dData_dPair.t_Base_dData_dPair_dPair, Vuna_dCompiler_dBase_dSource.t_Vuna_dCompiler_dBase_dSource_dSpan) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) Base_dData_dPair.t_Base_dData_dPair_dPair) -> { Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Base_dData_dPair.v_Base_dData_dPair_dfirstOf acc); Base_dData_dPair.f_Base_dData_dPair_dPair_second = (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = { Base_dData_dPair.f_Base_dData_dPair_dPair_first = { Base_dData_dPair.f_Base_dData_dPair_dPair_first = caller; Base_dData_dPair.f_Base_dData_dPair_dPair_second = callee }; Base_dData_dPair.f_Base_dData_dPair_dPair_second = m }; Base_dData_dPair.f_Base_dData_dPair_dPair_second = sp }, (Base_dData_dPair.v_Base_dData_dPair_dsecondOf acc))) })

# 853 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_Vuna_dCompiler_dElab_dTermination_dMeasure_dgroupHead = (fun (mc0 : string Base_dData_dList.t_Base_dData_dList_dList) (mc1 : Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dExpr) -> (match mc1 with
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dExpr_EVar (dtb__278, dtb__279) -> (if ((Base_dData_dList.v_Base_dData_dList_dmemName (Vuna_dCompiler_dFrontend_dRast_dName.v_Vuna_dCompiler_dFrontend_dRast_dName_drnameKey dtb__278)) mc0) then (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ((Vuna_dCompiler_dFrontend_dRast_dName.v_Vuna_dCompiler_dFrontend_dRast_dName_drnameKey dtb__278))) else Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing)
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
))

# 857 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let rec v_Vuna_dCompiler_dElab_dTermination_dMeasure_dnthExpr = (fun (mc0 : Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dExpr Base_dData_dList.t_Base_dData_dList_dList) (mc1 : int) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__280, dtb__281) -> (if (mc1 <= 0) then (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__280)) else ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dnthExpr dtb__281) (mc1 - 1)))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 331 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_Vuna_dCompiler_dElab_dTermination_dMeasure_dargPositive = (fun (args : Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dExpr Base_dData_dList.t_Base_dData_dList_dList) (i : int) (sizes : (string, (int, (int, int Base_dData_dList.t_Base_dData_dList_dList) Base_dData_dPair.t_Base_dData_dPair_dPair) Base_dData_dPair.t_Base_dData_dPair_dPair) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (caller : string) (facts : (string, int Base_dData_dList.t_Base_dData_dList_dList) Base_dContainer_dHashMap.t_Base_dContainer_dHashMap_dHashMap) (region : string Base_dData_dList.t_Base_dData_dList_dList) -> (match ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dnthExpr args) i) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> false
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__282) -> (match dtb__282 with
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dExpr_EInt (dtb__283, dtb__284) -> (dtb__283 > 0)
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dExpr_EVar (dtb__285, dtb__286) -> (if ((Base_dData_dList.v_Base_dData_dList_dmemName (Vuna_dCompiler_dFrontend_dRast_dName.v_Vuna_dCompiler_dFrontend_dRast_dName_drnameKey dtb__285)) region) then true else (match ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dsizeOfVarStrict (Vuna_dCompiler_dFrontend_dRast_dName.v_Vuna_dCompiler_dFrontend_dRast_dName_drnameKey dtb__285)) sizes) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__287) -> ((fun nd_uscrut12 -> (match nd_uscrut12 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__288; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__289 } -> (match dtb__289 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__290; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__291 } -> (if (dtb__290 = 0) then (((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposHasTbl caller) dtb__288) facts) else false)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) dtb__287)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
))
  | _ -> false
)
  | _ -> failwith "DT: impossible branch"
))

# 562 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let rec v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalkCalleeGo = (fun (namesTbl : (string, bool) Base_dContainer_dHashMap.t_Base_dContainer_dHashMap_dHashMap) (caller : string) (sizes : (string, (int, (int, int Base_dData_dList.t_Base_dData_dList_dList) Base_dData_dPair.t_Base_dData_dPair_dPair) Base_dData_dPair.t_Base_dData_dPair_dPair) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (facts : (string, int Base_dData_dList.t_Base_dData_dList_dList) Base_dContainer_dHashMap.t_Base_dContainer_dHashMap_dHashMap) (region : string Base_dData_dList.t_Base_dData_dList_dList) (g : string) (remaining : int) (args : Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dExpr Base_dData_dList.t_Base_dData_dList_dList) (st : ((string, int) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList, (string, int) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) Base_dData_dPair.t_Base_dData_dPair_dPair) -> (if (remaining <= 0) then st else ((fun i -> ((fun st1 -> (((((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalkCalleeGo namesTbl) caller) sizes) facts) region) g) (remaining - 1)) args) st1)) (if ((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dargPositive args) i) sizes) caller) facts) region) then (((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposMarkPos g) i) st) else (((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposMarkNeg g) i) st)))) ((Base_dData_dList.v_Base_dData_dList_dlength args) - remaining))))

# 558 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalkCallee = (fun (namesTbl : (string, bool) Base_dContainer_dHashMap.t_Base_dContainer_dHashMap_dHashMap) (caller : string) (sizes : (string, (int, (int, int Base_dData_dList.t_Base_dData_dList_dList) Base_dData_dPair.t_Base_dData_dPair_dPair) Base_dData_dPair.t_Base_dData_dPair_dPair) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (facts : (string, int Base_dData_dList.t_Base_dData_dList_dList) Base_dContainer_dHashMap.t_Base_dContainer_dHashMap_dHashMap) (region : string Base_dData_dList.t_Base_dData_dList_dList) (g : string) (i : int) (args : Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dExpr Base_dData_dList.t_Base_dData_dList_dList) (st : ((string, int) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList, (string, int) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) Base_dData_dPair.t_Base_dData_dPair_dPair) -> (((((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalkCalleeGo namesTbl) caller) sizes) facts) region) g) ((Base_dData_dList.v_Base_dData_dList_dlength args) - i)) args) st))

# 373 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let rec v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalkArgs = (fun (mc0 : (string, bool) Base_dContainer_dHashMap.t_Base_dContainer_dHashMap_dHashMap) (mc1 : string) (mc2 : (string, (int, (int, int Base_dData_dList.t_Base_dData_dList_dList) Base_dData_dPair.t_Base_dData_dPair_dPair) Base_dData_dPair.t_Base_dData_dPair_dPair) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (mc3 : (string, int Base_dData_dList.t_Base_dData_dList_dList) Base_dContainer_dHashMap.t_Base_dContainer_dHashMap_dHashMap) (mc4 : string Base_dData_dList.t_Base_dData_dList_dList) (mc5 : Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dExpr Base_dData_dList.t_Base_dData_dList_dList) (mc6 : ((string, int) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList, (string, int) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) Base_dData_dPair.t_Base_dData_dPair_dPair) -> (match mc5 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__292, dtb__293) -> (((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalkArgs mc0) mc1) mc2) mc3) mc4) dtb__293) (((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalk mc0) mc1) mc2) mc3) mc4) dtb__292) mc6))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> mc6
  | _ -> failwith "DT: impossible branch"
))
# 385 "Vuna/Compiler/Elab/Termination/Measure.vuna"
and v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalkFields = (fun (mc0 : (string, bool) Base_dContainer_dHashMap.t_Base_dContainer_dHashMap_dHashMap) (mc1 : string) (mc2 : (string, (int, (int, int Base_dData_dList.t_Base_dData_dList_dList) Base_dData_dPair.t_Base_dData_dPair_dPair) Base_dData_dPair.t_Base_dData_dPair_dPair) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (mc3 : (string, int Base_dData_dList.t_Base_dData_dList_dList) Base_dContainer_dHashMap.t_Base_dContainer_dHashMap_dHashMap) (mc4 : string Base_dData_dList.t_Base_dData_dList_dList) (mc5 : (string, Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dExpr) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (mc6 : ((string, int) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList, (string, int) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) Base_dData_dPair.t_Base_dData_dPair_dPair) -> (match mc5 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__294, dtb__295) -> (match dtb__294 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__296; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__297 } -> (((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalkFields mc0) mc1) mc2) mc3) mc4) dtb__295) (((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalk mc0) mc1) mc2) mc3) mc4) dtb__297) mc6))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> mc6
  | _ -> failwith "DT: impossible branch"
))
# 397 "Vuna/Compiler/Elab/Termination/Measure.vuna"
and v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalkAlts = (fun (mc0 : (string, bool) Base_dContainer_dHashMap.t_Base_dContainer_dHashMap_dHashMap) (mc1 : string) (mc2 : (string, (int, (int, int Base_dData_dList.t_Base_dData_dList_dList) Base_dData_dPair.t_Base_dData_dPair_dPair) Base_dData_dPair.t_Base_dData_dPair_dPair) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (mc3 : (string, int Base_dData_dList.t_Base_dData_dList_dList) Base_dContainer_dHashMap.t_Base_dContainer_dHashMap_dHashMap) (mc4 : string Base_dData_dList.t_Base_dData_dList_dList) (mc5 : (Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dPat, Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dExpr) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (mc6 : ((string, int) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList, (string, int) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) Base_dData_dPair.t_Base_dData_dPair_dPair) -> (match mc5 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__298, dtb__299) -> (match dtb__298 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__300; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__301 } -> (((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalkAlts mc0) mc1) mc2) mc3) mc4) dtb__299) (((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalk mc0) mc1) mc2) mc3) mc4) dtb__301) mc6))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> mc6
  | _ -> failwith "DT: impossible branch"
))
# 410 "Vuna/Compiler/Elab/Termination/Measure.vuna"
and v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalkClauses = (fun (mc0 : (string, bool) Base_dContainer_dHashMap.t_Base_dContainer_dHashMap_dHashMap) (mc1 : string) (mc2 : (string, (int, (int, int Base_dData_dList.t_Base_dData_dList_dList) Base_dData_dPair.t_Base_dData_dPair_dPair) Base_dData_dPair.t_Base_dData_dPair_dPair) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (mc3 : (string, int Base_dData_dList.t_Base_dData_dList_dList) Base_dContainer_dHashMap.t_Base_dContainer_dHashMap_dHashMap) (mc4 : string Base_dData_dList.t_Base_dData_dList_dList) (mc5 : (Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dPat Base_dData_dList.t_Base_dData_dList_dList, Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dExpr) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (mc6 : ((string, int) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList, (string, int) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) Base_dData_dPair.t_Base_dData_dPair_dPair) -> (match mc5 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__302, dtb__303) -> (match dtb__302 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__304; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__305 } -> (((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalkClauses mc0) mc1) mc2) mc3) mc4) dtb__303) (((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalk mc0) mc1) mc2) mc3) mc4) dtb__305) mc6))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> mc6
  | _ -> failwith "DT: impossible branch"
))
# 422 "Vuna/Compiler/Elab/Termination/Measure.vuna"
and v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalkBinds = (fun (mc0 : (string, bool) Base_dContainer_dHashMap.t_Base_dContainer_dHashMap_dHashMap) (mc1 : string) (mc2 : (string, (int, (int, int Base_dData_dList.t_Base_dData_dList_dList) Base_dData_dPair.t_Base_dData_dPair_dPair) Base_dData_dPair.t_Base_dData_dPair_dPair) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (mc3 : (string, int Base_dData_dList.t_Base_dData_dList_dList) Base_dContainer_dHashMap.t_Base_dContainer_dHashMap_dHashMap) (mc4 : string Base_dData_dList.t_Base_dData_dList_dList) (mc5 : (Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dPat, Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dExpr) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (mc6 : ((string, int) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList, (string, int) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) Base_dData_dPair.t_Base_dData_dPair_dPair) -> (match mc5 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__306, dtb__307) -> (match dtb__306 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__308; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__309 } -> (((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalkBinds mc0) mc1) mc2) mc3) mc4) dtb__307) (((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalk mc0) mc1) mc2) mc3) mc4) dtb__309) mc6))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> mc6
  | _ -> failwith "DT: impossible branch"
))
# 434 "Vuna/Compiler/Elab/Termination/Measure.vuna"
and v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalkStmts = (fun (mc0 : (string, bool) Base_dContainer_dHashMap.t_Base_dContainer_dHashMap_dHashMap) (mc1 : string) (mc2 : (string, (int, (int, int Base_dData_dList.t_Base_dData_dList_dList) Base_dData_dPair.t_Base_dData_dPair_dPair) Base_dData_dPair.t_Base_dData_dPair_dPair) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (mc3 : (string, int Base_dData_dList.t_Base_dData_dList_dList) Base_dContainer_dHashMap.t_Base_dContainer_dHashMap_dHashMap) (mc4 : string Base_dData_dList.t_Base_dData_dList_dList) (mc5 : Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dDoStmt Base_dData_dList.t_Base_dData_dList_dList) (mc6 : ((string, int) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList, (string, int) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) Base_dData_dPair.t_Base_dData_dPair_dPair) -> (match mc5 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__310, dtb__311) -> (match dtb__310 with
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dDoStmt_DBind (dtb__312, dtb__313, dtb__314) -> (((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalkStmts mc0) mc1) mc2) mc3) mc4) dtb__311) (((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalk mc0) mc1) mc2) mc3) mc4) dtb__313) mc6))
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dDoStmt_DExpr (dtb__315, dtb__316) -> (((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalkStmts mc0) mc1) mc2) mc3) mc4) dtb__311) (((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalk mc0) mc1) mc2) mc3) mc4) dtb__315) mc6))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> mc6
  | _ -> failwith "DT: impossible branch"
))
# 457 "Vuna/Compiler/Elab/Termination/Measure.vuna"
and v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalk = (fun (mc0 : (string, bool) Base_dContainer_dHashMap.t_Base_dContainer_dHashMap_dHashMap) (mc1 : string) (mc2 : (string, (int, (int, int Base_dData_dList.t_Base_dData_dList_dList) Base_dData_dPair.t_Base_dData_dPair_dPair) Base_dData_dPair.t_Base_dData_dPair_dPair) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (mc3 : (string, int Base_dData_dList.t_Base_dData_dList_dList) Base_dContainer_dHashMap.t_Base_dContainer_dHashMap_dHashMap) (mc4 : string Base_dData_dList.t_Base_dData_dList_dList) (mc5 : Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dExpr) (mc6 : ((string, int) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList, (string, int) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) Base_dData_dPair.t_Base_dData_dPair_dPair) -> (match mc5 with
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dExpr_EVar (dtb__317, dtb__318) -> mc6
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dExpr_EAnn (dtb__319, dtb__320, dtb__321) -> (((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalk mc0) mc1) mc2) mc3) mc4) dtb__320) (((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalk mc0) mc1) mc2) mc3) mc4) dtb__319) mc6))
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dExpr_EDo (dtb__322, dtb__323) -> (((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalkStmts mc0) mc1) mc2) mc3) mc4) dtb__322) mc6)
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dExpr_ERecUpdate (dtb__324, dtb__325, dtb__326) -> (((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalkFields mc0) mc1) mc2) mc3) mc4) dtb__325) (((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalk mc0) mc1) mc2) mc3) mc4) dtb__324) mc6))
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dExpr_ERecord (dtb__327, dtb__328, dtb__329) -> (((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalkFields mc0) mc1) mc2) mc3) mc4) dtb__328) mc6)
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dExpr_EField (dtb__330, dtb__331, dtb__332) -> (((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalk mc0) mc1) mc2) mc3) mc4) dtb__330) mc6)
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dExpr_EPi (dtb__333, dtb__334, dtb__335, dtb__336, dtb__337, dtb__338) -> (((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalk mc0) mc1) mc2) mc3) mc4) dtb__337) (((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalk mc0) mc1) mc2) mc3) mc4) dtb__336) mc6))
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dExpr_ELet (dtb__339, dtb__340, dtb__341, dtb__342) -> (((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalk mc0) mc1) mc2) mc3) mc4) dtb__340) (((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalkBinds mc0) mc1) mc2) mc3) mc4) dtb__339) mc6))
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dExpr_ELocalFun (dtb__343, dtb__344) -> (((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalkClauses mc0) mc1) mc2) mc3) mc4) dtb__343) mc6)
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dExpr_ELam (dtb__345, dtb__346, dtb__347) -> (((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalk mc0) mc1) mc2) mc3) mc4) dtb__346) mc6)
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dExpr_ECase (dtb__348, dtb__349, dtb__350) -> (((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalkAlts mc0) mc1) mc2) mc3) mc4) dtb__349) (((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalk mc0) mc1) mc2) mc3) mc4) dtb__348) mc6))
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dExpr_EIf (dtb__351, dtb__352, dtb__353, dtb__354) -> (match (v_Vuna_dCompiler_dElab_dTermination_dMeasure_dguardPosVar dtb__351) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__355) -> ((fun st1 -> ((fun st2 -> (((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalk mc0) mc1) mc2) mc3) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__355, mc4))) dtb__353) st2)) (((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalk mc0) mc1) mc2) mc3) mc4) dtb__352) st1))) (((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalk mc0) mc1) mc2) mc3) mc4) dtb__351) mc6))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (match (v_Vuna_dCompiler_dElab_dTermination_dMeasure_dguardThenPosVar dtb__351) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__356) -> ((fun st1 -> ((fun st2 -> (((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalk mc0) mc1) mc2) mc3) mc4) dtb__353) st2)) (((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalk mc0) mc1) mc2) mc3) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__356, mc4))) dtb__352) st1))) (((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalk mc0) mc1) mc2) mc3) mc4) dtb__351) mc6))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> ((fun st1 -> ((fun st2 -> (((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalk mc0) mc1) mc2) mc3) mc4) dtb__353) st2)) (((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalk mc0) mc1) mc2) mc3) mc4) dtb__352) st1))) (((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalk mc0) mc1) mc2) mc3) mc4) dtb__351) mc6))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dExpr_EApp (dtb__357, dtb__358, dtb__359) -> (match dtb__357 with
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dExpr_EVar (dtb__360, dtb__361) -> (if ((((Base_dContainer_dHashMap.v_Base_dContainer_dHashMap_dmember Base_dData_dString.v_Hashable_uString) Base_dData_dString.v_Eq_uString) (Vuna_dCompiler_dFrontend_dRast_dName.v_Vuna_dCompiler_dFrontend_dRast_dName_drnameKey dtb__360)) mc0) then (((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalkArgs mc0) mc1) mc2) mc3) mc4) dtb__358) (((((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalkCallee mc0) mc1) mc2) mc3) mc4) (Vuna_dCompiler_dFrontend_dRast_dName.v_Vuna_dCompiler_dFrontend_dRast_dName_drnameKey dtb__360)) 0) dtb__358) mc6)) else (((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalkArgs mc0) mc1) mc2) mc3) mc4) dtb__358) (((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalk mc0) mc1) mc2) mc3) mc4) dtb__357) mc6)))
  | _ -> (((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalkArgs mc0) mc1) mc2) mc3) mc4) dtb__358) (((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalk mc0) mc1) mc2) mc3) mc4) dtb__357) mc6))
)
  | _ -> mc6
))

# 572 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let rec v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposScanClauses = (fun (mc0 : (string, bool) Base_dContainer_dHashMap.t_Base_dContainer_dHashMap_dHashMap) (mc1 : (string, (Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dPat Base_dData_dList.t_Base_dData_dList_dList, Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dExpr) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (mc2 : (string, int Base_dData_dList.t_Base_dData_dList_dList) Base_dContainer_dHashMap.t_Base_dContainer_dHashMap_dHashMap) (mc3 : string) (mc4 : (Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dPat Base_dData_dList.t_Base_dData_dList_dList, Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dExpr) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (mc5 : ((string, int) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList, (string, int) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) Base_dData_dPair.t_Base_dData_dPair_dPair) -> (match mc4 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__362, dtb__363) -> ((fun sizes -> ((fun st2 -> ((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposScanClauses mc0) mc1) mc2) mc3) dtb__363) st2)) (((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalk mc0) mc3) sizes) mc2) Base_dData_dList.C_Base_dData_dList_dList_Nil) (Base_dData_dPair.v_Base_dData_dPair_dsecondOf dtb__362)) mc5))) (v_Vuna_dCompiler_dElab_dTermination_dMeasure_dstrSizeEntries (Base_dData_dPair.v_Base_dData_dPair_dfirstOf dtb__362)))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> mc5
  | _ -> failwith "DT: impossible branch"
))

# 580 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let rec v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposScanDefs = (fun (mc0 : (string, bool) Base_dContainer_dHashMap.t_Base_dContainer_dHashMap_dHashMap) (mc1 : (string, (Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dPat Base_dData_dList.t_Base_dData_dList_dList, Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dExpr) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (mc2 : (string, int Base_dData_dList.t_Base_dData_dList_dList) Base_dContainer_dHashMap.t_Base_dContainer_dHashMap_dHashMap) (mc3 : (string, (Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dPat Base_dData_dList.t_Base_dData_dList_dList, Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dExpr) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (mc4 : ((string, int) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList, (string, int) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) Base_dData_dPair.t_Base_dData_dPair_dPair) -> (match mc3 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__364, dtb__365) -> (((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposScanDefs mc0) mc1) mc2) dtb__365) ((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposScanClauses mc0) mc1) mc2) (Base_dData_dPair.v_Base_dData_dPair_dfirstOf dtb__364)) (Base_dData_dPair.v_Base_dData_dPair_dsecondOf dtb__364)) mc4))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> mc4
  | _ -> failwith "DT: impossible branch"
))

# 597 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let rec v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposScanNamesGo = (fun (mc0 : (string, bool) Base_dContainer_dHashMap.t_Base_dContainer_dHashMap_dHashMap) (mc1 : (string, (Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dPat Base_dData_dList.t_Base_dData_dList_dList, Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dExpr) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) Base_dContainer_dHashMap.t_Base_dContainer_dHashMap_dHashMap) (mc2 : (string, int Base_dData_dList.t_Base_dData_dList_dList) Base_dContainer_dHashMap.t_Base_dContainer_dHashMap_dHashMap) (mc3 : string Base_dData_dList.t_Base_dData_dList_dList) (mc4 : ((string, int) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList, (string, int) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) Base_dData_dPair.t_Base_dData_dPair_dPair) -> (match mc3 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__366, dtb__367) -> (((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposScanNamesGo mc0) mc1) mc2) dtb__367) ((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposScanClauses mc0) Base_dData_dList.C_Base_dData_dList_dList_Nil) mc2) dtb__366) ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dclausesOfDefTbl dtb__366) mc1)) mc4))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> mc4
  | _ -> failwith "DT: impossible branch"
))

# 591 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposScanNames = (fun (namesTbl : (string, bool) Base_dContainer_dHashMap.t_Base_dContainer_dHashMap_dHashMap) (defTbl : (string, (Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dPat Base_dData_dList.t_Base_dData_dList_dList, Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dExpr) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) Base_dContainer_dHashMap.t_Base_dContainer_dHashMap_dHashMap) (factsTbl : (string, int Base_dData_dList.t_Base_dData_dList_dList) Base_dContainer_dHashMap.t_Base_dContainer_dHashMap_dHashMap) (work : string Base_dData_dList.t_Base_dData_dList_dList) (st : ((string, int) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList, (string, int) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) Base_dData_dPair.t_Base_dData_dPair_dPair) -> ((fun scanned -> { Base_dData_dPair.f_Base_dData_dPair_dPair_first = (v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposNormalize (Base_dData_dPair.v_Base_dData_dPair_dfirstOf scanned)); Base_dData_dPair.f_Base_dData_dPair_dPair_second = (v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposNormalize (Base_dData_dPair.v_Base_dData_dPair_dsecondOf scanned)) }) (((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposScanNamesGo namesTbl) defTbl) factsTbl) work) st)))

# 608 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let rec v_Vuna_dCompiler_dElab_dTermination_dMeasure_dcomputePosFacts = (fun (defs : (string, (Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dPat Base_dData_dList.t_Base_dData_dList_dList, Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dExpr) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (fuel : int) (facts : (string, int) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) -> (if (fuel <= 0) then facts else (((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dcomputePosFactsStep defs) fuel) facts)))
# 611 "Vuna/Compiler/Elab/Termination/Measure.vuna"
and v_Vuna_dCompiler_dElab_dTermination_dMeasure_dcomputePosFactsStep = (fun (defs : (string, (Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dPat Base_dData_dList.t_Base_dData_dList_dList, Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dExpr) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (fuel : int) (facts : (string, int) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) -> ((fun namesTbl -> ((fun scanned -> ((fun scan -> ((fun fresh -> ((fun merged -> (if ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposSetEqTbl facts) merged) then merged else (((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dcomputePosFacts defs) (fuel - 1)) merged))) ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposUnionTbl facts) fresh))) ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposFilterTbl (Base_dData_dPair.v_Base_dData_dPair_dfirstOf scan)) (v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposTblOf (Base_dData_dPair.v_Base_dData_dPair_dsecondOf scan))))) { Base_dData_dPair.f_Base_dData_dPair_dPair_first = (v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposNormalize (Base_dData_dPair.v_Base_dData_dPair_dfirstOf scanned)); Base_dData_dPair.f_Base_dData_dPair_dPair_second = (v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposNormalize (Base_dData_dPair.v_Base_dData_dPair_dsecondOf scanned)) })) (((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposScanDefs namesTbl) defs) (v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposTblOf facts)) defs) { Base_dData_dPair.f_Base_dData_dPair_dPair_first = Base_dData_dList.C_Base_dData_dList_dList_Nil; Base_dData_dPair.f_Base_dData_dPair_dPair_second = Base_dData_dList.C_Base_dData_dList_dList_Nil }))) (Base_dContainer_dHashMap.v_Base_dContainer_dHashMap_dofNames (v_Vuna_dCompiler_dElab_dTermination_dMeasure_ddefNames defs))))

# 861 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_Vuna_dCompiler_dElab_dTermination_dMeasure_ddotBase = (fun (n : string) -> (Base_dData_dPair.v_Base_dData_dPair_dsecondOf (Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dsplitLastDot (Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dsplitOnDot n))))

# 864 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_Vuna_dCompiler_dElab_dTermination_dMeasure_disMapLike = (fun (n : string) -> (if (if (if (if ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_ddotBase n) = "map") then true else ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_ddotBase n) = "traverse")) then true else ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_ddotBase n) = "concatMap")) then true else ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_ddotBase n) = "mapMaybe")) then true else ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_ddotBase n) = "filter")))

# 871 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_Vuna_dCompiler_dElab_dTermination_dMeasure_dextendElemSizes = (fun (mc0 : (string, (int, (int, int Base_dData_dList.t_Base_dData_dList_dList) Base_dData_dPair.t_Base_dData_dPair_dPair) Base_dData_dPair.t_Base_dData_dPair_dPair) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (mc1 : Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dExpr) (mc2 : string) -> (match mc1 with
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dExpr_EVar (dtb__368, dtb__369) -> (match ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dsizeOfVarStrict (Vuna_dCompiler_dFrontend_dRast_dName.v_Vuna_dCompiler_dFrontend_dRast_dName_drnameKey dtb__368)) mc0) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__370) -> ((fun nd_uscrut7 -> (match nd_uscrut7 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__371; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__372 } -> (match dtb__372 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__373; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__374 } -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = mc2; Base_dData_dPair.f_Base_dData_dPair_dPair_second = { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__371; Base_dData_dPair.f_Base_dData_dPair_dPair_second = { Base_dData_dPair.f_Base_dData_dPair_dPair_first = (dtb__373 + 1); Base_dData_dPair.f_Base_dData_dPair_dPair_second = ((Base_dData_dList.v_Base_dData_dList_dappend dtb__374) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (0, Base_dData_dList.C_Base_dData_dList_dList_Nil))) } } }, mc0))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) dtb__370)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> mc0
  | _ -> failwith "DT: impossible branch"
)
  | _ -> mc0
))

# 884 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let rec v_Vuna_dCompiler_dElab_dTermination_dMeasure_dedgeStrictGo = (fun (mc0 : string) (mc1 : string) (mc2 : (((string, string) Base_dData_dPair.t_Base_dData_dPair_dPair, int) Base_dData_dPair.t_Base_dData_dPair_dPair, Vuna_dCompiler_dBase_dSource.t_Vuna_dCompiler_dBase_dSource_dSpan) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (mc3 : bool) (mc4 : bool) -> (match mc2 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__375, dtb__376) -> (match dtb__375 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__377; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__378 } -> (match dtb__377 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__379; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__380 } -> (match dtb__379 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__381; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__382 } -> (if (dtb__381 = mc0) then (if (dtb__382 = mc1) then (((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dedgeStrictGo mc0) mc1) dtb__376) true) (if (dtb__380 > 0) then mc4 else false)) else (((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dedgeStrictGo mc0) mc1) dtb__376) mc3) mc4)) else (((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dedgeStrictGo mc0) mc1) dtb__376) mc3) mc4))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (if mc3 then mc4 else false)
  | _ -> failwith "DT: impossible branch"
))

# 881 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_Vuna_dCompiler_dElab_dTermination_dMeasure_dedgeStrict = (fun (f : string) (g : string) (edges : (((string, string) Base_dData_dPair.t_Base_dData_dPair_dPair, int) Base_dData_dPair.t_Base_dData_dPair_dPair, Vuna_dCompiler_dBase_dSource.t_Vuna_dCompiler_dBase_dSource_dSpan) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) -> (((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dedgeStrictGo f) g) edges) false) true))

# 898 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let rec v_Vuna_dCompiler_dElab_dTermination_dMeasure_dedgeTargetsGo = (fun (mc0 : string) (mc1 : (((string, string) Base_dData_dPair.t_Base_dData_dPair_dPair, int) Base_dData_dPair.t_Base_dData_dPair_dPair, Vuna_dCompiler_dBase_dSource.t_Vuna_dCompiler_dBase_dSource_dSpan) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__383, dtb__384) -> (match dtb__383 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__385; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__386 } -> (match dtb__385 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__387; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__388 } -> (match dtb__387 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__389; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__390 } -> (if (dtb__389 = mc0) then (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__390, ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dedgeTargetsGo mc0) dtb__384))) else ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dedgeTargetsGo mc0) dtb__384))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 895 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_Vuna_dCompiler_dElab_dTermination_dMeasure_dedgeTargets = (fun (f : string) (edges : (((string, string) Base_dData_dPair.t_Base_dData_dPair_dPair, int) Base_dData_dPair.t_Base_dData_dPair_dPair, Vuna_dCompiler_dBase_dSource.t_Vuna_dCompiler_dBase_dSource_dSpan) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) -> (v_Vuna_dCompiler_dElab_dTermination_dMeasure_ddedup ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dedgeTargetsGo f) edges)))

# 907 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let rec v_Vuna_dCompiler_dElab_dTermination_dMeasure_dweakAdjGo = (fun (mc0 : string Base_dData_dList.t_Base_dData_dList_dList) (mc1 : (((string, string) Base_dData_dPair.t_Base_dData_dPair_dPair, int) Base_dData_dPair.t_Base_dData_dPair_dPair, Vuna_dCompiler_dBase_dSource.t_Vuna_dCompiler_dBase_dSource_dSpan) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (mc2 : string) (mc3 : string Base_dData_dList.t_Base_dData_dList_dList) -> (match mc3 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__391, dtb__392) -> (if (((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dedgeStrict mc2) dtb__391) mc1) then ((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dweakAdjGo mc0) mc1) mc2) dtb__392) else (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__391, ((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dweakAdjGo mc0) mc1) mc2) dtb__392))))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 904 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_Vuna_dCompiler_dElab_dTermination_dMeasure_dweakAdj = (fun (comp : string Base_dData_dList.t_Base_dData_dList_dList) (edges : (((string, string) Base_dData_dPair.t_Base_dData_dPair_dPair, int) Base_dData_dPair.t_Base_dData_dPair_dPair, Vuna_dCompiler_dBase_dSource.t_Vuna_dCompiler_dBase_dSource_dSpan) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (f : string) -> ((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dweakAdjGo comp) edges) f) ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dedgeTargets f) edges)))

# 915 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let rec v_Vuna_dCompiler_dElab_dTermination_dMeasure_dweakReachFuel = (fun (fuel : int) (comp : string Base_dData_dList.t_Base_dData_dList_dList) (edges : (((string, string) Base_dData_dPair.t_Base_dData_dPair_dPair, int) Base_dData_dPair.t_Base_dData_dPair_dPair, Vuna_dCompiler_dBase_dSource.t_Vuna_dCompiler_dBase_dSource_dSpan) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (start : string) (frontier : string Base_dData_dList.t_Base_dData_dList_dList) (visited : string Base_dData_dList.t_Base_dData_dList_dList) -> (if (fuel <= 0) then true else (match frontier with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> false
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__393, dtb__394) -> (if (dtb__393 = start) then true else (if ((Base_dData_dList.v_Base_dData_dList_dmemName dtb__393) visited) then ((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dweakReachFuel (fuel - 1)) comp) edges) start) dtb__394) visited) else ((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dweakReachFuel (fuel - 1)) comp) edges) start) ((Base_dData_dList.v_Base_dData_dList_dappend dtb__394) (((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dweakAdj comp) edges) dtb__393))) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__393, visited)))))
  | _ -> failwith "DT: impossible branch"
)))

# 912 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_Vuna_dCompiler_dElab_dTermination_dMeasure_dweakReach = (fun (comp : string Base_dData_dList.t_Base_dData_dList_dList) (edges : (((string, string) Base_dData_dPair.t_Base_dData_dPair_dPair, int) Base_dData_dPair.t_Base_dData_dPair_dPair, Vuna_dCompiler_dBase_dSource.t_Vuna_dCompiler_dBase_dSource_dSpan) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (start : string) (frontier : string Base_dData_dList.t_Base_dData_dList_dList) (visited : string Base_dData_dList.t_Base_dData_dList_dList) -> ((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dweakReachFuel 100000) comp) edges) start) frontier) visited))

# 928 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let rec v_Vuna_dCompiler_dElab_dTermination_dMeasure_dhasWeakCycleGo = (fun (mc0 : string Base_dData_dList.t_Base_dData_dList_dList) (mc1 : (((string, string) Base_dData_dPair.t_Base_dData_dPair_dPair, int) Base_dData_dPair.t_Base_dData_dPair_dPair, Vuna_dCompiler_dBase_dSource.t_Vuna_dCompiler_dBase_dSource_dSpan) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (mc2 : string Base_dData_dList.t_Base_dData_dList_dList) -> (match mc2 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__395, dtb__396) -> (if (((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dweakReach mc0) mc1) dtb__395) (((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dweakAdj mc0) mc1) dtb__395)) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__395, Base_dData_dList.C_Base_dData_dList_dList_Nil))) then true else (((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dhasWeakCycleGo mc0) mc1) dtb__396))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 925 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_Vuna_dCompiler_dElab_dTermination_dMeasure_dhasWeakCycle = (fun (comp : string Base_dData_dList.t_Base_dData_dList_dList) (edges : (((string, string) Base_dData_dPair.t_Base_dData_dPair_dPair, int) Base_dData_dPair.t_Base_dData_dPair_dPair, Vuna_dCompiler_dBase_dSource.t_Vuna_dCompiler_dBase_dSource_dSpan) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) -> (((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dhasWeakCycleGo comp) edges) comp))

# 935 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_Vuna_dCompiler_dElab_dTermination_dMeasure_drelEqual = 0

# 783 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_Vuna_dCompiler_dElab_dTermination_dMeasure_drelOfArg = (fun (mc0 : int) (mc1 : Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dExpr) (mc2 : (string, (int, (int, int Base_dData_dList.t_Base_dData_dList_dList) Base_dData_dPair.t_Base_dData_dPair_dPair) Base_dData_dPair.t_Base_dData_dPair_dPair) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (mc3 : string Base_dData_dList.t_Base_dData_dList_dList) (mc4 : (string, int Base_dData_dList.t_Base_dData_dList_dList) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (mc5 : string) (mc6 : (string, int Base_dData_dList.t_Base_dData_dList_dList) Base_dContainer_dHashMap.t_Base_dContainer_dHashMap_dHashMap) (mc7 : string Base_dData_dList.t_Base_dData_dList_dList) -> (match mc1 with
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dExpr_EApp (dtb__397, dtb__398, dtb__399) -> (match dtb__397 with
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dExpr_EVar (dtb__400, dtb__401) -> (if ((Base_dData_dList.v_Base_dData_dList_dmemName (Vuna_dCompiler_dFrontend_dRast_dName.v_Vuna_dCompiler_dFrontend_dRast_dName_drnameKey dtb__400)) mc3) then (match ((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dfindWrapField mc0) dtb__398) mc2) 0) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__402) -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__402))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (if (((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dsameCtorApp mc0) dtb__398) mc2) then (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (v_Vuna_dCompiler_dElab_dTermination_dMeasure_drelEqual)) else Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing)
  | _ -> failwith "DT: impossible branch"
) else (if ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dprojHas (Vuna_dCompiler_dFrontend_dRast_dName.v_Vuna_dCompiler_dFrontend_dRast_dName_drnameKey dtb__400)) mc4) then (((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dprojRel mc0) dtb__398) mc2) else ((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_darithRel mc0) mc1) mc2) mc5) mc6) mc7)))
  | _ -> ((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_darithRel mc0) mc1) mc2) mc5) mc6) mc7)
)
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dExpr_EVar (dtb__403, dtb__404) -> (match ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dsizeOfVarStrict (Vuna_dCompiler_dFrontend_dRast_dName.v_Vuna_dCompiler_dFrontend_dRast_dName_drnameKey dtb__403)) mc2) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__405) -> ((fun nd_uscrut12 -> (match nd_uscrut12 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__406; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__407 } -> (match dtb__407 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__408; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__409 } -> (if (dtb__406 = mc0) then (if (dtb__408 > 0) then (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (1)) else (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (0))) else Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) dtb__405)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
))

# 802 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_Vuna_dCompiler_dElab_dTermination_dMeasure_dargRel = (fun (p : int) (args : Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dExpr Base_dData_dList.t_Base_dData_dList_dList) (sizes : (string, (int, (int, int Base_dData_dList.t_Base_dData_dList_dList) Base_dData_dPair.t_Base_dData_dPair_dPair) Base_dData_dPair.t_Base_dData_dPair_dPair) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (ctors : string Base_dData_dList.t_Base_dData_dList_dList) (projs : (string, int Base_dData_dList.t_Base_dData_dList_dList) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (caller : string) (facts : (string, int Base_dData_dList.t_Base_dData_dList_dList) Base_dContainer_dHashMap.t_Base_dContainer_dHashMap_dHashMap) (region : string Base_dData_dList.t_Base_dData_dList_dList) -> (match ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dnthExpr args) p) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__410) -> ((((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_drelOfArg p) dtb__410) sizes) ctors) projs) caller) facts) region)
  | _ -> failwith "DT: impossible branch"
))

# 938 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_Vuna_dCompiler_dElab_dTermination_dMeasure_drelStrictSub = 1

# 941 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_Vuna_dCompiler_dElab_dTermination_dMeasure_drelStrictMinus = 4

# 944 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_Vuna_dCompiler_dElab_dTermination_dMeasure_drelUnknownSize = -1

# 947 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_Vuna_dCompiler_dElab_dTermination_dMeasure_drelMissingGuard = -2

# 950 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_Vuna_dCompiler_dElab_dTermination_dMeasure_drelNoRelation = -3

# 953 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_Vuna_dCompiler_dElab_dTermination_dMeasure_drelOtherPosition = -4

# 834 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_Vuna_dCompiler_dElab_dTermination_dMeasure_dhintArith = (fun (mc0 : int) (mc1 : Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dExpr Base_dData_dList.t_Base_dData_dList_dList) (mc2 : (string, (int, (int, int Base_dData_dList.t_Base_dData_dList_dList) Base_dData_dPair.t_Base_dData_dPair_dPair) Base_dData_dPair.t_Base_dData_dPair_dPair) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (mc3 : int) -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__411, dtb__412) -> (match dtb__411 with
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dExpr_EVar (dtb__413, dtb__414) -> (match dtb__412 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__415, dtb__416) -> (match dtb__415 with
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dExpr_EInt (dtb__417, dtb__418) -> (match dtb__416 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (if (dtb__417 <= 0) then (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (v_Vuna_dCompiler_dElab_dTermination_dMeasure_drelNoRelation)) else (match ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dsizeOfVarStrict (Vuna_dCompiler_dFrontend_dRast_dName.v_Vuna_dCompiler_dFrontend_dRast_dName_drnameKey dtb__413)) mc2) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__419) -> ((fun nd_uscrut17 -> (match nd_uscrut17 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__420; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__421 } -> (match dtb__421 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__422; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__423 } -> (if (dtb__420 = mc0) then (if (dtb__422 = 0) then (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (mc3)) else (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (v_Vuna_dCompiler_dElab_dTermination_dMeasure_drelNoRelation))) else (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (v_Vuna_dCompiler_dElab_dTermination_dMeasure_drelOtherPosition)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) dtb__419)
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

# 956 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_Vuna_dCompiler_dElab_dTermination_dMeasure_drelAscending = -5

# 810 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_Vuna_dCompiler_dElab_dTermination_dMeasure_dargRelHint = (fun (p : int) (args : Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dExpr Base_dData_dList.t_Base_dData_dList_dList) (sizes : (string, (int, (int, int Base_dData_dList.t_Base_dData_dList_dList) Base_dData_dPair.t_Base_dData_dPair_dPair) Base_dData_dPair.t_Base_dData_dPair_dPair) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (ctors : string Base_dData_dList.t_Base_dData_dList_dList) -> (match ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dnthExpr args) p) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__424) -> ((fun nd_uscrut6 -> (match nd_uscrut6 with
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dExpr_EApp (dtb__425, dtb__426, dtb__427) -> (match dtb__425 with
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dExpr_EVar (dtb__428, dtb__429) -> (if (v_Vuna_dCompiler_dElab_dTermination_dMeasure_disSubOpName (Vuna_dCompiler_dFrontend_dRast_dName.v_Vuna_dCompiler_dFrontend_dRast_dName_drnameKey dtb__428)) then ((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dhintArith p) dtb__426) sizes) v_Vuna_dCompiler_dElab_dTermination_dMeasure_drelMissingGuard) else (if (v_Vuna_dCompiler_dElab_dTermination_dMeasure_disAddOpName (Vuna_dCompiler_dFrontend_dRast_dName.v_Vuna_dCompiler_dFrontend_dRast_dName_drnameKey dtb__428)) then ((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dhintArith p) dtb__426) sizes) v_Vuna_dCompiler_dElab_dTermination_dMeasure_drelAscending) else (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (v_Vuna_dCompiler_dElab_dTermination_dMeasure_drelNoRelation))))
  | _ -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (v_Vuna_dCompiler_dElab_dTermination_dMeasure_drelNoRelation))
)
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dExpr_EVar (dtb__430, dtb__431) -> (if ((Base_dData_dList.v_Base_dData_dList_dmemName (Vuna_dCompiler_dFrontend_dRast_dName.v_Vuna_dCompiler_dFrontend_dRast_dName_drnameKey dtb__430)) ctors) then (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (v_Vuna_dCompiler_dElab_dTermination_dMeasure_drelNoRelation)) else (match ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dsizeOfVarStrict (Vuna_dCompiler_dFrontend_dRast_dName.v_Vuna_dCompiler_dFrontend_dRast_dName_drnameKey dtb__430)) sizes) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__432) -> ((fun nd_uscrut11 -> (match nd_uscrut11 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__433; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__434 } -> (match dtb__434 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__435; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__436 } -> (if (dtb__433 = p) then (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (v_Vuna_dCompiler_dElab_dTermination_dMeasure_drelNoRelation)) else (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (v_Vuna_dCompiler_dElab_dTermination_dMeasure_drelOtherPosition)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) dtb__432)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (v_Vuna_dCompiler_dElab_dTermination_dMeasure_drelUnknownSize))
  | _ -> failwith "DT: impossible branch"
))
  | _ -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (v_Vuna_dCompiler_dElab_dTermination_dMeasure_drelNoRelation))
)) dtb__424)
  | _ -> failwith "DT: impossible branch"
))

# 960 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_Vuna_dCompiler_dElab_dTermination_dMeasure_drelText = (fun (m : int) -> (if (m = v_Vuna_dCompiler_dElab_dTermination_dMeasure_drelStrictSub) then "strict subterm" else (if (m = v_Vuna_dCompiler_dElab_dTermination_dMeasure_drelStrictMinus) then "decreases by a constant, with the non-negativity guard proven" else (if (m = v_Vuna_dCompiler_dElab_dTermination_dMeasure_drelMissingGuard) then "decreases by a constant, but the non-negativity guard is missing" else (if (m = v_Vuna_dCompiler_dElab_dTermination_dMeasure_drelUnknownSize) then "no known size (not a subterm of a parameter)" else (if (m = v_Vuna_dCompiler_dElab_dTermination_dMeasure_drelOtherPosition) then "decreases a different parameter" else (if (m = v_Vuna_dCompiler_dElab_dTermination_dMeasure_drelEqual) then "unchanged" else (if (m = v_Vuna_dCompiler_dElab_dTermination_dMeasure_drelAscending) then "increases instead of decreasing (ascending counters are not supported)" else "no size relation"))))))))

# 979 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_Vuna_dCompiler_dElab_dTermination_dMeasure_disDescent = (fun (m : int) -> (m > 0))

# 982 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let rec v_Vuna_dCompiler_dElab_dTermination_dMeasure_dfilterModes = (fun (mc0 : int Base_dData_dList.t_Base_dData_dList_dList) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__437, dtb__438) -> (if (v_Vuna_dCompiler_dElab_dTermination_dMeasure_disDescent dtb__437) then (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__437, (v_Vuna_dCompiler_dElab_dTermination_dMeasure_dfilterModes dtb__438))) else (v_Vuna_dCompiler_dElab_dTermination_dMeasure_dfilterModes dtb__438))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))
