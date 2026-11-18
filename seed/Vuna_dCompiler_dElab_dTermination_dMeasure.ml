open Vuna_runtime
# 11 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_Vuna_dCompiler_dElab_dTermination_dMeasure_dmaxInt = (fun a b -> (if (a >= b) then a else b))

# 14 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_Vuna_dCompiler_dElab_dTermination_dMeasure_dnotEmpty = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> true
))

# 18 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let rec v_Vuna_dCompiler_dElab_dTermination_dMeasure_dallEqTo = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__0, dtb__1) -> (if (mc0 = dtb__0) then ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dallEqTo mc0) dtb__1) else false)
  | Base_dList.C_Base_dList_dList_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

# 22 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_Vuna_dCompiler_dElab_dTermination_dMeasure_dallSame = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__2, dtb__3) -> ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dallEqTo dtb__2) dtb__3)
  | Base_dList.C_Base_dList_dList_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

# 27 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_Vuna_dCompiler_dElab_dTermination_dMeasure_ddedup = (fun names -> (Base_dList.v_Base_dList_dnubNames names))

# 30 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let rec v_Vuna_dCompiler_dElab_dTermination_dMeasure_djoinComma = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__4, dtb__5) -> (match dtb__5 with
  | Base_dList.C_Base_dList_dList_Nil -> dtb__4
  | _ -> (String.concat "" [dtb__4; ", "; (v_Vuna_dCompiler_dElab_dTermination_dMeasure_djoinComma dtb__5)])
)
  | Base_dList.C_Base_dList_dList_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))

# 36 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let rec v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposHas = (fun mc0 mc1 mc2 -> (match mc2 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__6, dtb__7) -> (match dtb__6 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__8; Base_dPair.f_Base_dPair_dPair_second = dtb__9 } -> (if (mc0 = dtb__8) then (if (mc1 = dtb__9) then true else (((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposHas mc0) mc1) dtb__7)) else (((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposHas mc0) mc1) dtb__7))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 46 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let rec v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposTblOfGo = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__10, dtb__11) -> (match dtb__10 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__12; Base_dPair.f_Base_dPair_dPair_second = dtb__13 } -> (match ((((Base_dHashMap.v_Base_dHashMap_dlookup Base_dString.v_Hashable_uString) Base_dString.v_Eq_uString) dtb__12) mc1) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__14) -> ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposTblOfGo dtb__11) ((((Base_dHashMap.v_Base_dHashMap_dinsert Base_dString.v_Hashable_uString) dtb__12) (Base_dList.C_Base_dList_dList__x58__x58_ (dtb__13, dtb__14))) mc1))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposTblOfGo dtb__11) ((((Base_dHashMap.v_Base_dHashMap_dinsert Base_dString.v_Hashable_uString) dtb__12) (Base_dList.C_Base_dList_dList__x58__x58_ (dtb__13, Base_dList.C_Base_dList_dList_Nil))) mc1))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> mc1
  | _ -> failwith "DT: impossible branch"
))

# 43 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposTblOf = (fun xs -> ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposTblOfGo xs) ((Base_dHashMap.v_Base_dHashMap_dfromList Base_dString.v_Hashable_uString) Base_dList.C_Base_dList_dList_Nil)))

# 57 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let rec v_Vuna_dCompiler_dElab_dTermination_dMeasure_dmemInt = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__15, dtb__16) -> (if (mc0 = dtb__15) then true else ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dmemInt mc0) dtb__16))
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 52 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposHasTbl = (fun f i tbl -> (match ((((Base_dHashMap.v_Base_dHashMap_dlookup Base_dString.v_Hashable_uString) Base_dString.v_Eq_uString) f) tbl) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__17) -> ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dmemInt i) dtb__17)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
))

# 61 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposAdd = (fun f i facts -> (if (((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposHas f) i) facts) then facts else (Base_dList.C_Base_dList_dList__x58__x58_ ({ Base_dPair.f_Base_dPair_dPair_first = f; Base_dPair.f_Base_dPair_dPair_second = i }, facts))))

# 64 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let rec v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposSubset = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__18, dtb__19) -> (match dtb__18 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__20; Base_dPair.f_Base_dPair_dPair_second = dtb__21 } -> (if (((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposHas dtb__20) dtb__21) mc1) then ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposSubset dtb__19) mc1) else false)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

# 68 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposSetEq = (fun a b -> (if ((Base_dList.v_Base_dList_dlength a) = (Base_dList.v_Base_dList_dlength b)) then ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposSubset a) b) else false))

# 71 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let rec v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposFilter = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__22, dtb__23) -> (match dtb__22 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__24; Base_dPair.f_Base_dPair_dPair_second = dtb__25 } -> (if (((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposHas dtb__24) dtb__25) mc1) then ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposFilter dtb__23) mc1) else (Base_dList.C_Base_dList_dList__x58__x58_ ({ Base_dPair.f_Base_dPair_dPair_first = dtb__24; Base_dPair.f_Base_dPair_dPair_second = dtb__25 }, ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposFilter dtb__23) mc1))))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 76 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let rec v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposUnion = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__26, dtb__27) -> (match dtb__26 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__28; Base_dPair.f_Base_dPair_dPair_second = dtb__29 } -> ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposUnion dtb__27) (((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposAdd dtb__28) dtb__29) mc1))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> mc1
  | _ -> failwith "DT: impossible branch"
))

# 82 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let rec v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposFilterTbl = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__30, dtb__31) -> (match dtb__30 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__32; Base_dPair.f_Base_dPair_dPair_second = dtb__33 } -> (if (((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposHasTbl dtb__32) dtb__33) mc1) then ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposFilterTbl dtb__31) mc1) else (Base_dList.C_Base_dList_dList__x58__x58_ ({ Base_dPair.f_Base_dPair_dPair_first = dtb__32; Base_dPair.f_Base_dPair_dPair_second = dtb__33 }, ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposFilterTbl dtb__31) mc1))))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 87 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let rec v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposSubsetTbl = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__34, dtb__35) -> (match dtb__34 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__36; Base_dPair.f_Base_dPair_dPair_second = dtb__37 } -> (if (((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposHasTbl dtb__36) dtb__37) mc1) then ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposSubsetTbl dtb__35) mc1) else false)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

# 91 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposSetEqTbl = (fun a b -> (if (if ((Base_dList.v_Base_dList_dlength a) = (Base_dList.v_Base_dList_dlength b)) then ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposSubsetTbl a) (v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposTblOf b)) else false) then ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposSubsetTbl b) (v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposTblOf a)) else false))

# 95 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposUnionTbl = (fun facts fresh -> ((Base_dList.v_Base_dList_dappend fresh) ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposFilterTbl facts) (v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposTblOf fresh))))

# 98 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let rec v_Vuna_dCompiler_dElab_dTermination_dMeasure_dfunDeclsOf = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__38, dtb__39) -> (match dtb__38 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DFun (dtb__40, dtb__41, dtb__42, dtb__43) -> (Base_dList.C_Base_dList_dList__x58__x58_ ({ Base_dPair.f_Base_dPair_dPair_first = dtb__40; Base_dPair.f_Base_dPair_dPair_second = { Base_dPair.f_Base_dPair_dPair_first = dtb__41; Base_dPair.f_Base_dPair_dPair_second = dtb__42 } }, (v_Vuna_dCompiler_dElab_dTermination_dMeasure_dfunDeclsOf dtb__39)))
  | _ -> (v_Vuna_dCompiler_dElab_dTermination_dMeasure_dfunDeclsOf dtb__39)
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 104 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let rec v_Vuna_dCompiler_dElab_dTermination_dMeasure_dlookupGroup = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__44, dtb__45) -> (match dtb__44 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__46; Base_dPair.f_Base_dPair_dPair_second = dtb__47 } -> (if (dtb__46 = mc0) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__47)) else ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dlookupGroup mc0) dtb__45))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 108 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let rec v_Vuna_dCompiler_dElab_dTermination_dMeasure_dreplaceGroup = (fun mc0 mc1 mc2 -> (match mc2 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__48, dtb__49) -> (match dtb__48 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__50; Base_dPair.f_Base_dPair_dPair_second = dtb__51 } -> (if (dtb__50 = mc0) then (Base_dList.C_Base_dList_dList__x58__x58_ ({ Base_dPair.f_Base_dPair_dPair_first = dtb__50; Base_dPair.f_Base_dPair_dPair_second = mc1 }, dtb__49)) else (Base_dList.C_Base_dList_dList__x58__x58_ ({ Base_dPair.f_Base_dPair_dPair_first = dtb__50; Base_dPair.f_Base_dPair_dPair_second = dtb__51 }, (((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dreplaceGroup mc0) mc1) dtb__49))))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 126 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let rec v_Vuna_dCompiler_dElab_dTermination_dMeasure_dgroupDefsGo = (fun mc0 mc1 mc2 -> (match mc2 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__52, dtb__53) -> (match dtb__52 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__54; Base_dPair.f_Base_dPair_dPair_second = dtb__55 } -> (match ((((Base_dHashMap.v_Base_dHashMap_dlookup Base_dString.v_Hashable_uString) Base_dString.v_Eq_uString) dtb__54) mc0) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__56) -> (((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dgroupDefsGo ((((Base_dHashMap.v_Base_dHashMap_dinsert Base_dString.v_Hashable_uString) dtb__54) (Base_dList.C_Base_dList_dList__x58__x58_ (dtb__55, dtb__56))) mc0)) mc1) dtb__53)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dgroupDefsGo ((((Base_dHashMap.v_Base_dHashMap_dinsert Base_dString.v_Hashable_uString) dtb__54) (Base_dList.C_Base_dList_dList__x58__x58_ (dtb__55, Base_dList.C_Base_dList_dList_Nil))) mc0)) (Base_dList.C_Base_dList_dList__x58__x58_ (dtb__54, mc1))) dtb__53)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> { Base_dPair.f_Base_dPair_dPair_first = mc0; Base_dPair.f_Base_dPair_dPair_second = mc1 }
  | _ -> failwith "DT: impossible branch"
))

# 113 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_Vuna_dCompiler_dElab_dTermination_dMeasure_dgroupDefs = (fun decls -> ((fun stepped -> ((fun tbl -> ((fun order -> ((Base_dList.v_Base_dList_dmap (fun n -> { Base_dPair.f_Base_dPair_dPair_first = n; Base_dPair.f_Base_dPair_dPair_second = (match ((((Base_dHashMap.v_Base_dHashMap_dlookup Base_dString.v_Hashable_uString) Base_dString.v_Eq_uString) n) tbl) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__57) -> (Base_dList.v_Base_dList_dreverse dtb__57)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
) })) (Base_dList.v_Base_dList_dreverse order))) (Base_dPair.v_Base_dPair_dsecondOf stepped))) (Base_dPair.v_Base_dPair_dfirstOf stepped))) (((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dgroupDefsGo ((Base_dHashMap.v_Base_dHashMap_dfromList Base_dString.v_Hashable_uString) Base_dList.C_Base_dList_dList_Nil)) Base_dList.C_Base_dList_dList_Nil) (v_Vuna_dCompiler_dElab_dTermination_dMeasure_dfunDeclsOf decls))))

# 132 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_Vuna_dCompiler_dElab_dTermination_dMeasure_ddefNames = (fun defs -> ((Base_dList.v_Base_dList_dmap Base_dPair.v_Base_dPair_dfirstOf) defs))

# 135 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let rec v_Vuna_dCompiler_dElab_dTermination_dMeasure_dclausesOfDef = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__58, dtb__59) -> (match dtb__58 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__60; Base_dPair.f_Base_dPair_dPair_second = dtb__61 } -> (if (dtb__60 = mc0) then dtb__61 else ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dclausesOfDef mc0) dtb__59))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 140 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_Vuna_dCompiler_dElab_dTermination_dMeasure_dclausesOfDefTbl = (fun name tbl -> (match ((((Base_dHashMap.v_Base_dHashMap_dlookup Base_dString.v_Hashable_uString) Base_dString.v_Eq_uString) name) tbl) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__62) -> dtb__62
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 145 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let rec v_Vuna_dCompiler_dElab_dTermination_dMeasure_ddefArity = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__63, dtb__64) -> ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dmaxInt (Base_dList.v_Base_dList_dlength (Base_dPair.v_Base_dPair_dfirstOf dtb__63))) (v_Vuna_dCompiler_dElab_dTermination_dMeasure_ddefArity dtb__64))
  | Base_dList.C_Base_dList_dList_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))

# 149 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let rec v_Vuna_dCompiler_dElab_dTermination_dMeasure_dmaxArityOf = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__65, dtb__66) -> ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dmaxInt (v_Vuna_dCompiler_dElab_dTermination_dMeasure_ddefArity ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dclausesOfDefTbl dtb__65) mc1))) ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dmaxArityOf dtb__66) mc1))
  | Base_dList.C_Base_dList_dList_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))

# 162 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_Vuna_dCompiler_dElab_dTermination_dMeasure_dctorNameOf = (fun mc0 -> (match mc0 with
  | { Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dCtor_ctorName = dtb__67; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dCtor_ctorType = dtb__68; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dCtor_ctorArity = dtb__69; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dCtor_ctorSpan = dtb__70 } -> dtb__67
  | _ -> failwith "DT: impossible branch"
))

# 154 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let rec v_Vuna_dCompiler_dElab_dTermination_dMeasure_dctorNamesOf = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__71, dtb__72) -> (match dtb__71 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DData (dtb__73, dtb__74, dtb__75, dtb__76, dtb__77, dtb__78, dtb__79, dtb__80, dtb__81) -> ((Base_dList.v_Base_dList_dappend ((Base_dList.v_Base_dList_dmap v_Vuna_dCompiler_dElab_dTermination_dMeasure_dctorNameOf) dtb__76)) (v_Vuna_dCompiler_dElab_dTermination_dMeasure_dctorNamesOf dtb__72))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DRecord (dtb__82, dtb__83, dtb__84, dtb__85, dtb__86, dtb__87, dtb__88, dtb__89) -> (Base_dList.C_Base_dList_dList__x58__x58_ (dtb__82, (v_Vuna_dCompiler_dElab_dTermination_dMeasure_dctorNamesOf dtb__72)))
  | _ -> (v_Vuna_dCompiler_dElab_dTermination_dMeasure_dctorNamesOf dtb__72)
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 165 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let rec v_Vuna_dCompiler_dElab_dTermination_dMeasure_dpatSizeStrict = (fun mc0 mc1 mc2 mc3 -> (match mc0 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PRecord (dtb__90, dtb__91, dtb__92) -> (((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dfieldsSizeStrict dtb__91) mc1) mc2) 0) mc3)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PCon (dtb__93, dtb__94, dtb__95) -> (((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dpatsSizeStrict dtb__94) mc1) mc2) 0) mc3)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PWild (dtb__96) -> mc3
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PVar (dtb__97, dtb__98) -> (Base_dList.C_Base_dList_dList__x58__x58_ ({ Base_dPair.f_Base_dPair_dPair_first = dtb__97; Base_dPair.f_Base_dPair_dPair_second = { Base_dPair.f_Base_dPair_dPair_first = mc1; Base_dPair.f_Base_dPair_dPair_second = { Base_dPair.f_Base_dPair_dPair_first = (Base_dList.v_Base_dList_dlength mc2); Base_dPair.f_Base_dPair_dPair_second = mc2 } } }, mc3))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PAs (dtb__99, dtb__100, dtb__101) -> ((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dpatSizeStrict dtb__100) mc1) mc2) (Base_dList.C_Base_dList_dList__x58__x58_ ({ Base_dPair.f_Base_dPair_dPair_first = dtb__99; Base_dPair.f_Base_dPair_dPair_second = { Base_dPair.f_Base_dPair_dPair_first = mc1; Base_dPair.f_Base_dPair_dPair_second = { Base_dPair.f_Base_dPair_dPair_first = (Base_dList.v_Base_dList_dlength mc2); Base_dPair.f_Base_dPair_dPair_second = mc2 } } }, mc3)))
  | _ -> mc3
))
# 175 "Vuna/Compiler/Elab/Termination/Measure.vuna"
and v_Vuna_dCompiler_dElab_dTermination_dMeasure_dpatsSizeStrict = (fun mc0 mc1 mc2 mc3 mc4 -> (match mc0 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__102, dtb__103) -> (((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dpatsSizeStrict dtb__103) mc1) mc2) (mc3 + 1)) ((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dpatSizeStrict dtb__102) mc1) ((Base_dList.v_Base_dList_dappend mc2) (Base_dList.C_Base_dList_dList__x58__x58_ (mc3, Base_dList.C_Base_dList_dList_Nil)))) mc4))
  | Base_dList.C_Base_dList_dList_Nil -> mc4
  | _ -> failwith "DT: impossible branch"
))
# 180 "Vuna/Compiler/Elab/Termination/Measure.vuna"
and v_Vuna_dCompiler_dElab_dTermination_dMeasure_dfieldsSizeStrict = (fun mc0 mc1 mc2 mc3 mc4 -> (match mc0 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__104, dtb__105) -> (match dtb__104 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__106; Base_dPair.f_Base_dPair_dPair_second = dtb__107 } -> (((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dfieldsSizeStrict dtb__105) mc1) mc2) (mc3 + 1)) ((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dpatSizeStrict dtb__107) mc1) ((Base_dList.v_Base_dList_dappend mc2) (Base_dList.C_Base_dList_dList__x58__x58_ (mc3, Base_dList.C_Base_dList_dList_Nil)))) mc4))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> mc4
  | _ -> failwith "DT: impossible branch"
))

# 188 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let rec v_Vuna_dCompiler_dElab_dTermination_dMeasure_dstrSizeEntriesGo = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__108, dtb__109) -> ((Base_dList.v_Base_dList_dappend ((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dpatSizeStrict dtb__108) mc1) Base_dList.C_Base_dList_dList_Nil) Base_dList.C_Base_dList_dList_Nil)) ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dstrSizeEntriesGo dtb__109) (mc1 + 1)))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 185 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_Vuna_dCompiler_dElab_dTermination_dMeasure_dstrSizeEntries = (fun pats -> ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dstrSizeEntriesGo pats) 0))

# 210 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let rec v_Vuna_dCompiler_dElab_dTermination_dMeasure_dsizeOfVarStrict = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__110, dtb__111) -> (match dtb__110 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__112; Base_dPair.f_Base_dPair_dPair_second = dtb__113 } -> (if (dtb__112 = mc0) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__113)) else ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dsizeOfVarStrict mc0) dtb__111))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 192 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let rec v_Vuna_dCompiler_dElab_dTermination_dMeasure_dextendSizesStrict = (fun mc0 mc1 mc2 -> (match mc1 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__114, dtb__115) -> (match ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dsizeOfVarStrict dtb__114) mc0) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__116) -> ((fun nd_uscrut7 -> (match nd_uscrut7 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__117; Base_dPair.f_Base_dPair_dPair_second = dtb__118 } -> (match dtb__118 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__119; Base_dPair.f_Base_dPair_dPair_second = dtb__120 } -> (match mc2 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PVar (dtb__121, dtb__122) -> (Base_dList.C_Base_dList_dList__x58__x58_ ({ Base_dPair.f_Base_dPair_dPair_first = dtb__121; Base_dPair.f_Base_dPair_dPair_second = dtb__116 }, mc0))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PAs (dtb__123, dtb__124, dtb__125) -> (((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dextendSizesStrict (Base_dList.C_Base_dList_dList__x58__x58_ ({ Base_dPair.f_Base_dPair_dPair_first = dtb__123; Base_dPair.f_Base_dPair_dPair_second = dtb__116 }, mc0))) (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__114, dtb__115))) dtb__124)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PCon (dtb__126, dtb__127, dtb__128) -> ((Base_dList.v_Base_dList_dappend mc0) (((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dpatsSizeStrict dtb__127) dtb__117) dtb__120) 0) Base_dList.C_Base_dList_dList_Nil))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PRecord (dtb__129, dtb__130, dtb__131) -> ((Base_dList.v_Base_dList_dappend mc0) (((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dfieldsSizeStrict dtb__130) dtb__117) dtb__120) 0) Base_dList.C_Base_dList_dList_Nil))
  | _ -> mc0
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) dtb__116)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> mc0
  | _ -> failwith "DT: impossible branch"
)
  | _ -> mc0
))

# 206 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let rec v_Vuna_dCompiler_dElab_dTermination_dMeasure_dextendByBinds = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__132, dtb__133) -> (match dtb__132 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__134; Base_dPair.f_Base_dPair_dPair_second = dtb__135 } -> ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dextendByBinds dtb__133) (((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dextendSizesStrict mc1) dtb__135) dtb__134))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> mc1
  | _ -> failwith "DT: impossible branch"
))

# 233 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_Vuna_dCompiler_dElab_dTermination_dMeasure_dopBaseName = (fun name -> (Base_dPair.v_Base_dPair_dsecondOf (Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dsplitLastDot (Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dsplitOnDot name))))

# 254 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_Vuna_dCompiler_dElab_dTermination_dMeasure_dvarOfExpr = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__136, dtb__137) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__136))
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
))

# 236 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_Vuna_dCompiler_dElab_dTermination_dMeasure_dguardLE = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__138, dtb__139) -> (match dtb__139 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__140, dtb__141) -> (match dtb__141 with
  | Base_dList.C_Base_dList_dList_Nil -> (match dtb__140 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EInt (dtb__142, dtb__143) -> (if (dtb__142 = 0) then (v_Vuna_dCompiler_dElab_dTermination_dMeasure_dvarOfExpr dtb__138) else Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
))

# 242 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_Vuna_dCompiler_dElab_dTermination_dMeasure_dguardGE = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__144, dtb__145) -> (match dtb__145 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__146, dtb__147) -> (match dtb__147 with
  | Base_dList.C_Base_dList_dList_Nil -> (match dtb__144 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EInt (dtb__148, dtb__149) -> (if (dtb__148 = 0) then (v_Vuna_dCompiler_dElab_dTermination_dMeasure_dvarOfExpr dtb__146) else Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
))

# 248 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_Vuna_dCompiler_dElab_dTermination_dMeasure_dguardLT = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__150, dtb__151) -> (match dtb__151 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__152, dtb__153) -> (match dtb__153 with
  | Base_dList.C_Base_dList_dList_Nil -> (match dtb__152 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EInt (dtb__154, dtb__155) -> (if (dtb__154 = 1) then (v_Vuna_dCompiler_dElab_dTermination_dMeasure_dvarOfExpr dtb__150) else Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
))

# 218 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_Vuna_dCompiler_dElab_dTermination_dMeasure_dguardPosVar = (fun e -> ((fun nd_uscrut1 -> (match nd_uscrut1 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp (dtb__156, dtb__157, dtb__158) -> (match dtb__156 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__159, dtb__160) -> (if ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dopBaseName dtb__159) = "le") then (v_Vuna_dCompiler_dElab_dTermination_dMeasure_dguardLE dtb__157) else (if ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dopBaseName dtb__159) = "ge") then (v_Vuna_dCompiler_dElab_dTermination_dMeasure_dguardGE dtb__157) else (if ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dopBaseName dtb__159) = "lt") then (v_Vuna_dCompiler_dElab_dTermination_dMeasure_dguardLT dtb__157) else (if ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dopBaseName dtb__159) = "<=") then (v_Vuna_dCompiler_dElab_dTermination_dMeasure_dguardLE dtb__157) else (if ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dopBaseName dtb__159) = ">=") then (v_Vuna_dCompiler_dElab_dTermination_dMeasure_dguardGE dtb__157) else (if ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dopBaseName dtb__159) = "<") then (v_Vuna_dCompiler_dElab_dTermination_dMeasure_dguardLT dtb__157) else Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing))))))
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)) e))

# 275 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposMarkPos = (fun f i st -> { Base_dPair.f_Base_dPair_dPair_first = (Base_dList.C_Base_dList_dList__x58__x58_ ({ Base_dPair.f_Base_dPair_dPair_first = f; Base_dPair.f_Base_dPair_dPair_second = i }, (Base_dPair.v_Base_dPair_dfirstOf st))); Base_dPair.f_Base_dPair_dPair_second = (Base_dPair.v_Base_dPair_dsecondOf st) })

# 278 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposMarkNeg = (fun f i st -> { Base_dPair.f_Base_dPair_dPair_first = (Base_dPair.v_Base_dPair_dfirstOf st); Base_dPair.f_Base_dPair_dPair_second = (Base_dList.C_Base_dList_dList__x58__x58_ ({ Base_dPair.f_Base_dPair_dPair_first = f; Base_dPair.f_Base_dPair_dPair_second = i }, (Base_dPair.v_Base_dPair_dsecondOf st))) })

# 291 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let rec v_Vuna_dCompiler_dElab_dTermination_dMeasure_ddedupInts = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__161, dtb__162) -> (if ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dmemInt dtb__161) dtb__162) then (v_Vuna_dCompiler_dElab_dTermination_dMeasure_ddedupInts dtb__162) else (Base_dList.C_Base_dList_dList__x58__x58_ (dtb__161, (v_Vuna_dCompiler_dElab_dTermination_dMeasure_ddedupInts dtb__162))))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 288 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposEntryPairs = (fun mc0 -> (match mc0 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__163; Base_dPair.f_Base_dPair_dPair_second = dtb__164 } -> ((Base_dList.v_Base_dList_dmap (fun i -> { Base_dPair.f_Base_dPair_dPair_first = dtb__163; Base_dPair.f_Base_dPair_dPair_second = i })) (v_Vuna_dCompiler_dElab_dTermination_dMeasure_ddedupInts dtb__164))
  | _ -> failwith "DT: impossible branch"
))

# 285 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposTblPairs = (fun tbl -> ((Base_dList.v_Base_dList_dconcatMap v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposEntryPairs) ((Base_dHashMap.v_Base_dHashMap_dtoList Base_dString.v_Eq_uString) tbl)))

# 282 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposNormalize = (fun xs -> (v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposTblPairs (v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposTblOf xs)))

# 429 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let rec v_Vuna_dCompiler_dElab_dTermination_dMeasure_dpathInPats = (fun mc0 mc1 mc2 mc3 -> (match mc1 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__165, dtb__166) -> (match (((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dpathInPat mc0) dtb__165) ((Base_dList.v_Base_dList_dappend mc2) (Base_dList.C_Base_dList_dList__x58__x58_ (mc3, Base_dList.C_Base_dList_dList_Nil)))) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__167) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__167))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dpathInPats mc0) dtb__166) mc2) (mc3 + 1))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))
# 435 "Vuna/Compiler/Elab/Termination/Measure.vuna"
and v_Vuna_dCompiler_dElab_dTermination_dMeasure_dpathInFields = (fun mc0 mc1 mc2 mc3 -> (match mc1 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__168, dtb__169) -> (match dtb__168 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__170; Base_dPair.f_Base_dPair_dPair_second = dtb__171 } -> (match (((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dpathInPat mc0) dtb__171) ((Base_dList.v_Base_dList_dappend mc2) (Base_dList.C_Base_dList_dList__x58__x58_ (mc3, Base_dList.C_Base_dList_dList_Nil)))) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__172) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__172))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dpathInFields mc0) dtb__169) mc2) (mc3 + 1))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))
# 441 "Vuna/Compiler/Elab/Termination/Measure.vuna"
and v_Vuna_dCompiler_dElab_dTermination_dMeasure_dpathInPat = (fun mc0 mc1 mc2 -> (match mc1 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PRecord (dtb__173, dtb__174, dtb__175) -> ((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dpathInFields mc0) dtb__174) mc2) 0)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PCon (dtb__176, dtb__177, dtb__178) -> ((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dpathInPats mc0) dtb__177) mc2) 0)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PWild (dtb__179) -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PVar (dtb__180, dtb__181) -> (if (dtb__180 = mc0) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (mc2)) else Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
))

# 448 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_Vuna_dCompiler_dElab_dTermination_dMeasure_dprojectionOfDef = (fun d -> ((fun nd_uscrut1 -> (match nd_uscrut1 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__182, dtb__183) -> (match dtb__183 with
  | Base_dList.C_Base_dList_dList_Nil -> ((fun nd_uscrut6 -> (match nd_uscrut6 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__184, dtb__185) -> (match dtb__185 with
  | Base_dList.C_Base_dList_dList_Nil -> (match (Base_dPair.v_Base_dPair_dsecondOf dtb__182) with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__186, dtb__187) -> (match (((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dpathInPat dtb__186) dtb__184) Base_dList.C_Base_dList_dList_Nil) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__188) -> (if (v_Vuna_dCompiler_dElab_dTermination_dMeasure_dnotEmpty dtb__188) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Base_dPair.f_Base_dPair_dPair_first = (Base_dPair.v_Base_dPair_dfirstOf d); Base_dPair.f_Base_dPair_dPair_second = dtb__188 })) else Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)) (Base_dPair.v_Base_dPair_dfirstOf dtb__182))
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)) (Base_dPair.v_Base_dPair_dsecondOf d)))

# 459 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let rec v_Vuna_dCompiler_dElab_dTermination_dMeasure_dprojectionsOf = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__189, dtb__190) -> (match (v_Vuna_dCompiler_dElab_dTermination_dMeasure_dprojectionOfDef dtb__189) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__191) -> (Base_dList.C_Base_dList_dList__x58__x58_ (dtb__191, (v_Vuna_dCompiler_dElab_dTermination_dMeasure_dprojectionsOf dtb__190)))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (v_Vuna_dCompiler_dElab_dTermination_dMeasure_dprojectionsOf dtb__190)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 465 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let rec v_Vuna_dCompiler_dElab_dTermination_dMeasure_dprojHas = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__192, dtb__193) -> (match dtb__192 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__194; Base_dPair.f_Base_dPair_dPair_second = dtb__195 } -> (if (mc0 = dtb__194) then true else ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dprojHas mc0) dtb__193))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 474 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let rec v_Vuna_dCompiler_dElab_dTermination_dMeasure_dsameCtorGo = (fun mc0 mc1 mc2 mc3 -> (match mc1 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__196, dtb__197) -> (match dtb__196 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__198, dtb__199) -> (match ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dsizeOfVarStrict dtb__198) mc2) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__200) -> ((fun nd_uscrut11 -> (match nd_uscrut11 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__201; Base_dPair.f_Base_dPair_dPair_second = dtb__202 } -> (match dtb__202 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__203; Base_dPair.f_Base_dPair_dPair_second = dtb__204 } -> (((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dsameCtorField dtb__201) dtb__203) dtb__204) mc0) dtb__197) mc2) mc3)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) dtb__200)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
)
  | _ -> false
)
  | Base_dList.C_Base_dList_dList_Nil -> (mc3 > 0)
  | _ -> failwith "DT: impossible branch"
))
# 483 "Vuna/Compiler/Elab/Termination/Measure.vuna"
and v_Vuna_dCompiler_dElab_dTermination_dMeasure_dsameCtorField = (fun base depth path p rest sizes k -> (if (base = p) then (if (depth = 1) then (match path with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__205, dtb__206) -> (match dtb__206 with
  | Base_dList.C_Base_dList_dList_Nil -> (if (dtb__205 = k) then ((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dsameCtorGo p) rest) sizes) (k + 1)) else false)
  | _ -> false
)
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
) else false) else false))

# 471 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_Vuna_dCompiler_dElab_dTermination_dMeasure_dsameCtorApp = (fun p args sizes -> ((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dsameCtorGo p) args) sizes) 0))

# 494 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let rec v_Vuna_dCompiler_dElab_dTermination_dMeasure_dfindWrapField = (fun mc0 mc1 mc2 mc3 -> (match mc1 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__207, dtb__208) -> (match dtb__207 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__209, dtb__210) -> (match ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dsizeOfVarStrict dtb__209) mc2) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__211) -> ((fun nd_uscrut11 -> (match nd_uscrut11 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__212; Base_dPair.f_Base_dPair_dPair_second = dtb__213 } -> (match dtb__213 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__214; Base_dPair.f_Base_dPair_dPair_second = dtb__215 } -> (if (dtb__212 = mc0) then ((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dwrapCheck mc0) dtb__208) mc2) mc3) dtb__214) dtb__215) else ((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dfindWrapField mc0) dtb__208) mc2) (mc3 + 1)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) dtb__211)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dfindWrapField mc0) dtb__208) mc2) (mc3 + 1))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> ((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dfindWrapField mc0) dtb__208) mc2) (mc3 + 1))
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))
# 507 "Vuna/Compiler/Elab/Termination/Measure.vuna"
and v_Vuna_dCompiler_dElab_dTermination_dMeasure_dwrapCheck = (fun p rest sizes k depth path -> (if (depth > 0) then (match path with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__216, dtb__217) -> (if (dtb__216 = k) then (if (v_Vuna_dCompiler_dElab_dTermination_dMeasure_dnotEmpty dtb__217) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((k + 2))) else ((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dfindWrapField p) rest) sizes) (k + 1))) else ((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dfindWrapField p) rest) sizes) (k + 1)))
  | Base_dList.C_Base_dList_dList_Nil -> ((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dfindWrapField p) rest) sizes) (k + 1))
  | _ -> failwith "DT: impossible branch"
) else ((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dfindWrapField p) rest) sizes) (k + 1))))

# 516 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposVarIn = (fun x p caller facts region -> (if ((Base_dList.v_Base_dList_dmemName x) region) then true else (((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposHasTbl caller) p) facts)))

# 527 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_Vuna_dCompiler_dElab_dTermination_dMeasure_disSubOpName = (fun op -> (if (if (op = "-") then true else (op = "Base.Num.sub")) then true else (op = "Base.Num.-")))

# 531 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_Vuna_dCompiler_dElab_dTermination_dMeasure_disAddOpName = (fun op -> (if (if (op = "+") then true else (op = "Base.Num.add")) then true else (op = "Base.Num.+")))

# 539 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_Vuna_dCompiler_dElab_dTermination_dMeasure_darithMinusBase = (fun mc0 mc1 mc2 mc3 mc4 mc5 mc6 -> (match mc1 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__218, dtb__219) -> (match ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dsizeOfVarStrict dtb__218) mc3) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__220) -> ((fun nd_uscrut11 -> (match nd_uscrut11 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__221; Base_dPair.f_Base_dPair_dPair_second = dtb__222 } -> (match dtb__222 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__223; Base_dPair.f_Base_dPair_dPair_second = dtb__224 } -> (if (dtb__221 = mc0) then (if (dtb__223 = 0) then (if (((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposVarIn dtb__218) mc0) mc4) mc5) mc6) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (4)) else Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing) else Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing) else Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) dtb__220)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
))

# 534 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_Vuna_dCompiler_dElab_dTermination_dMeasure_darithMinus = (fun mc0 mc1 mc2 mc3 mc4 mc5 -> (match mc1 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__225, dtb__226) -> (match dtb__226 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__227, dtb__228) -> (match dtb__227 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EInt (dtb__229, dtb__230) -> (match dtb__228 with
  | Base_dList.C_Base_dList_dList_Nil -> (if (dtb__229 > 0) then (((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_darithMinusBase mc0) dtb__225) dtb__229) mc2) mc3) mc4) mc5) else Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
))

# 519 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_Vuna_dCompiler_dElab_dTermination_dMeasure_darithRel = (fun mc0 mc1 mc2 mc3 mc4 mc5 -> (match mc1 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp (dtb__231, dtb__232, dtb__233) -> (match dtb__231 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__234, dtb__235) -> (if (v_Vuna_dCompiler_dElab_dTermination_dMeasure_disSubOpName dtb__234) then ((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_darithMinus mc0) dtb__232) mc2) mc3) mc4) mc5) else Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
))

# 549 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_Vuna_dCompiler_dElab_dTermination_dMeasure_dprojRel = (fun mc0 mc1 mc2 -> (match mc1 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__236, dtb__237) -> (match dtb__237 with
  | Base_dList.C_Base_dList_dList_Nil -> (match dtb__236 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__238, dtb__239) -> (match ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dsizeOfVarStrict dtb__238) mc2) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__240) -> ((fun nd_uscrut11 -> (match nd_uscrut11 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__241; Base_dPair.f_Base_dPair_dPair_second = dtb__242 } -> (match dtb__242 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__243; Base_dPair.f_Base_dPair_dPair_second = dtb__244 } -> (if (dtb__241 = mc0) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (1)) else Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) dtb__240)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
))

# 604 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_Vuna_dCompiler_dElab_dTermination_dMeasure_dmarkInvalid = (fun acc -> { Base_dPair.f_Base_dPair_dPair_first = false; Base_dPair.f_Base_dPair_dPair_second = (Base_dPair.v_Base_dPair_dsecondOf acc) })

# 607 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_Vuna_dCompiler_dElab_dTermination_dMeasure_daddEdgeMode = (fun caller callee m sp acc -> { Base_dPair.f_Base_dPair_dPair_first = (Base_dPair.v_Base_dPair_dfirstOf acc); Base_dPair.f_Base_dPair_dPair_second = (Base_dList.C_Base_dList_dList__x58__x58_ ({ Base_dPair.f_Base_dPair_dPair_first = { Base_dPair.f_Base_dPair_dPair_first = { Base_dPair.f_Base_dPair_dPair_first = caller; Base_dPair.f_Base_dPair_dPair_second = callee }; Base_dPair.f_Base_dPair_dPair_second = m }; Base_dPair.f_Base_dPair_dPair_second = sp }, (Base_dPair.v_Base_dPair_dsecondOf acc))) })

# 611 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_Vuna_dCompiler_dElab_dTermination_dMeasure_dgroupHead = (fun mc0 mc1 -> (match mc1 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__245, dtb__246) -> (if ((Base_dList.v_Base_dList_dmemName dtb__245) mc0) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__245)) else Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
))

# 615 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let rec v_Vuna_dCompiler_dElab_dTermination_dMeasure_dnthExpr = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__247, dtb__248) -> (if (mc1 <= 0) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__247)) else ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dnthExpr dtb__248) (mc1 - 1)))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 259 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_Vuna_dCompiler_dElab_dTermination_dMeasure_dargPositive = (fun args i sizes caller facts region -> (match ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dnthExpr args) i) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> false
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__249) -> (match dtb__249 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EInt (dtb__250, dtb__251) -> (dtb__250 > 0)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__252, dtb__253) -> (if ((Base_dList.v_Base_dList_dmemName dtb__252) region) then true else (match ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dsizeOfVarStrict dtb__252) sizes) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__254) -> ((fun nd_uscrut12 -> (match nd_uscrut12 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__255; Base_dPair.f_Base_dPair_dPair_second = dtb__256 } -> (match dtb__256 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__257; Base_dPair.f_Base_dPair_dPair_second = dtb__258 } -> (if (dtb__257 = 0) then (((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposHasTbl caller) dtb__255) facts) else false)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) dtb__254)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
))
  | _ -> false
)
  | _ -> failwith "DT: impossible branch"
))

# 379 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let rec v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalkCalleeGo = (fun namesTbl caller sizes facts region g remaining args st -> (if (remaining <= 0) then st else ((fun i -> ((fun st1 -> (((((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalkCalleeGo namesTbl) caller) sizes) facts) region) g) (remaining - 1)) args) st1)) (if ((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dargPositive args) i) sizes) caller) facts) region) then (((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposMarkPos g) i) st) else (((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposMarkNeg g) i) st)))) ((Base_dList.v_Base_dList_dlength args) - remaining))))

# 375 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalkCallee = (fun namesTbl caller sizes facts region g i args st -> (((((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalkCalleeGo namesTbl) caller) sizes) facts) region) g) ((Base_dList.v_Base_dList_dlength args) - i)) args) st))

# 295 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let rec v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalkArgs = (fun mc0 mc1 mc2 mc3 mc4 mc5 mc6 -> (match mc5 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__259, dtb__260) -> (((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalkArgs mc0) mc1) mc2) mc3) mc4) dtb__260) (((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalk mc0) mc1) mc2) mc3) mc4) dtb__259) mc6))
  | Base_dList.C_Base_dList_dList_Nil -> mc6
  | _ -> failwith "DT: impossible branch"
))
# 301 "Vuna/Compiler/Elab/Termination/Measure.vuna"
and v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalkFields = (fun mc0 mc1 mc2 mc3 mc4 mc5 mc6 -> (match mc5 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__261, dtb__262) -> (match dtb__261 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__263; Base_dPair.f_Base_dPair_dPair_second = dtb__264 } -> (((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalkFields mc0) mc1) mc2) mc3) mc4) dtb__262) (((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalk mc0) mc1) mc2) mc3) mc4) dtb__264) mc6))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> mc6
  | _ -> failwith "DT: impossible branch"
))
# 307 "Vuna/Compiler/Elab/Termination/Measure.vuna"
and v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalkAlts = (fun mc0 mc1 mc2 mc3 mc4 mc5 mc6 -> (match mc5 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__265, dtb__266) -> (match dtb__265 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__267; Base_dPair.f_Base_dPair_dPair_second = dtb__268 } -> (((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalkAlts mc0) mc1) mc2) mc3) mc4) dtb__266) (((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalk mc0) mc1) mc2) mc3) mc4) dtb__268) mc6))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> mc6
  | _ -> failwith "DT: impossible branch"
))
# 313 "Vuna/Compiler/Elab/Termination/Measure.vuna"
and v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalkBinds = (fun mc0 mc1 mc2 mc3 mc4 mc5 mc6 -> (match mc5 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__269, dtb__270) -> (match dtb__269 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__271; Base_dPair.f_Base_dPair_dPair_second = dtb__272 } -> (((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalkBinds mc0) mc1) mc2) mc3) mc4) dtb__270) (((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalk mc0) mc1) mc2) mc3) mc4) dtb__272) mc6))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> mc6
  | _ -> failwith "DT: impossible branch"
))
# 319 "Vuna/Compiler/Elab/Termination/Measure.vuna"
and v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalkStmts = (fun mc0 mc1 mc2 mc3 mc4 mc5 mc6 -> (match mc5 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__273, dtb__274) -> (match dtb__273 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDoStmt_DBind (dtb__275, dtb__276, dtb__277) -> (((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalkStmts mc0) mc1) mc2) mc3) mc4) dtb__274) (((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalk mc0) mc1) mc2) mc3) mc4) dtb__276) mc6))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDoStmt_DExpr (dtb__278, dtb__279) -> (((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalkStmts mc0) mc1) mc2) mc3) mc4) dtb__274) (((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalk mc0) mc1) mc2) mc3) mc4) dtb__278) mc6))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> mc6
  | _ -> failwith "DT: impossible branch"
))
# 329 "Vuna/Compiler/Elab/Termination/Measure.vuna"
and v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalk = (fun mc0 mc1 mc2 mc3 mc4 mc5 mc6 -> (match mc5 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__280, dtb__281) -> mc6
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EAnn (dtb__282, dtb__283, dtb__284) -> (((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalk mc0) mc1) mc2) mc3) mc4) dtb__283) (((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalk mc0) mc1) mc2) mc3) mc4) dtb__282) mc6))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EDo (dtb__285, dtb__286) -> (((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalkStmts mc0) mc1) mc2) mc3) mc4) dtb__285) mc6)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ERecUpdate (dtb__287, dtb__288, dtb__289) -> (((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalkFields mc0) mc1) mc2) mc3) mc4) dtb__288) (((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalk mc0) mc1) mc2) mc3) mc4) dtb__287) mc6))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ERecord (dtb__290, dtb__291, dtb__292) -> (((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalkFields mc0) mc1) mc2) mc3) mc4) dtb__291) mc6)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EField (dtb__293, dtb__294, dtb__295) -> (((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalk mc0) mc1) mc2) mc3) mc4) dtb__293) mc6)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EPi (dtb__296, dtb__297, dtb__298, dtb__299, dtb__300, dtb__301) -> (((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalk mc0) mc1) mc2) mc3) mc4) dtb__300) (((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalk mc0) mc1) mc2) mc3) mc4) dtb__299) mc6))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ELet (dtb__302, dtb__303, dtb__304, dtb__305) -> (((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalk mc0) mc1) mc2) mc3) mc4) dtb__303) (((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalkBinds mc0) mc1) mc2) mc3) mc4) dtb__302) mc6))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ELam (dtb__306, dtb__307, dtb__308) -> (((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalk mc0) mc1) mc2) mc3) mc4) dtb__307) mc6)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ECase (dtb__309, dtb__310, dtb__311) -> (((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalkAlts mc0) mc1) mc2) mc3) mc4) dtb__310) (((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalk mc0) mc1) mc2) mc3) mc4) dtb__309) mc6))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EIf (dtb__312, dtb__313, dtb__314, dtb__315) -> (match (v_Vuna_dCompiler_dElab_dTermination_dMeasure_dguardPosVar dtb__312) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__316) -> ((fun st1 -> ((fun st2 -> (((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalk mc0) mc1) mc2) mc3) (Base_dList.C_Base_dList_dList__x58__x58_ (dtb__316, mc4))) dtb__314) st2)) (((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalk mc0) mc1) mc2) mc3) mc4) dtb__313) st1))) (((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalk mc0) mc1) mc2) mc3) mc4) dtb__312) mc6))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((fun st1 -> ((fun st2 -> (((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalk mc0) mc1) mc2) mc3) mc4) dtb__314) st2)) (((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalk mc0) mc1) mc2) mc3) mc4) dtb__313) st1))) (((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalk mc0) mc1) mc2) mc3) mc4) dtb__312) mc6))
  | _ -> failwith "DT: impossible branch"
)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp (dtb__317, dtb__318, dtb__319) -> (match dtb__317 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__320, dtb__321) -> (if ((((Base_dHashMap.v_Base_dHashMap_dmember Base_dString.v_Hashable_uString) Base_dString.v_Eq_uString) dtb__320) mc0) then (((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalkArgs mc0) mc1) mc2) mc3) mc4) dtb__318) (((((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalkCallee mc0) mc1) mc2) mc3) mc4) dtb__320) 0) dtb__318) mc6)) else (((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalkArgs mc0) mc1) mc2) mc3) mc4) dtb__318) (((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalk mc0) mc1) mc2) mc3) mc4) dtb__317) mc6)))
  | _ -> (((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalkArgs mc0) mc1) mc2) mc3) mc4) dtb__318) (((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalk mc0) mc1) mc2) mc3) mc4) dtb__317) mc6))
)
  | _ -> mc6
))

# 388 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let rec v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposScanClauses = (fun mc0 mc1 mc2 mc3 mc4 mc5 -> (match mc4 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__322, dtb__323) -> ((fun sizes -> ((fun st2 -> ((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposScanClauses mc0) mc1) mc2) mc3) dtb__323) st2)) (((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalk mc0) mc3) sizes) mc2) Base_dList.C_Base_dList_dList_Nil) (Base_dPair.v_Base_dPair_dsecondOf dtb__322)) mc5))) (v_Vuna_dCompiler_dElab_dTermination_dMeasure_dstrSizeEntries (Base_dPair.v_Base_dPair_dfirstOf dtb__322)))
  | Base_dList.C_Base_dList_dList_Nil -> mc5
  | _ -> failwith "DT: impossible branch"
))

# 396 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let rec v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposScanDefs = (fun mc0 mc1 mc2 mc3 mc4 -> (match mc3 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__324, dtb__325) -> (((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposScanDefs mc0) mc1) mc2) dtb__325) ((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposScanClauses mc0) mc1) mc2) (Base_dPair.v_Base_dPair_dfirstOf dtb__324)) (Base_dPair.v_Base_dPair_dsecondOf dtb__324)) mc4))
  | Base_dList.C_Base_dList_dList_Nil -> mc4
  | _ -> failwith "DT: impossible branch"
))

# 409 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let rec v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposScanNamesGo = (fun mc0 mc1 mc2 mc3 mc4 -> (match mc3 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__326, dtb__327) -> (((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposScanNamesGo mc0) mc1) mc2) dtb__327) ((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposScanClauses mc0) Base_dList.C_Base_dList_dList_Nil) mc2) dtb__326) ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dclausesOfDefTbl dtb__326) mc1)) mc4))
  | Base_dList.C_Base_dList_dList_Nil -> mc4
  | _ -> failwith "DT: impossible branch"
))

# 403 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposScanNames = (fun namesTbl defTbl factsTbl work st -> ((fun scanned -> { Base_dPair.f_Base_dPair_dPair_first = (v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposNormalize (Base_dPair.v_Base_dPair_dfirstOf scanned)); Base_dPair.f_Base_dPair_dPair_second = (v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposNormalize (Base_dPair.v_Base_dPair_dsecondOf scanned)) }) (((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposScanNamesGo namesTbl) defTbl) factsTbl) work) st)))

# 416 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let rec v_Vuna_dCompiler_dElab_dTermination_dMeasure_dcomputePosFacts = (fun defs fuel facts -> (if (fuel <= 0) then facts else (((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dcomputePosFactsStep defs) fuel) facts)))
# 419 "Vuna/Compiler/Elab/Termination/Measure.vuna"
and v_Vuna_dCompiler_dElab_dTermination_dMeasure_dcomputePosFactsStep = (fun defs fuel facts -> ((fun namesTbl -> ((fun scanned -> ((fun scan -> ((fun fresh -> ((fun merged -> (if ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposSetEqTbl facts) merged) then merged else (((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dcomputePosFacts defs) (fuel - 1)) merged))) ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposUnionTbl facts) fresh))) ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposFilterTbl (Base_dPair.v_Base_dPair_dfirstOf scan)) (v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposTblOf (Base_dPair.v_Base_dPair_dsecondOf scan))))) { Base_dPair.f_Base_dPair_dPair_first = (v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposNormalize (Base_dPair.v_Base_dPair_dfirstOf scanned)); Base_dPair.f_Base_dPair_dPair_second = (v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposNormalize (Base_dPair.v_Base_dPair_dsecondOf scanned)) })) (((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposScanDefs namesTbl) defs) (v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposTblOf facts)) defs) { Base_dPair.f_Base_dPair_dPair_first = Base_dList.C_Base_dList_dList_Nil; Base_dPair.f_Base_dPair_dPair_second = Base_dList.C_Base_dList_dList_Nil }))) (Base_dHashMap.v_Base_dHashMap_dofNames (v_Vuna_dCompiler_dElab_dTermination_dMeasure_ddefNames defs))))

# 619 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_Vuna_dCompiler_dElab_dTermination_dMeasure_ddotBase = (fun n -> (Base_dPair.v_Base_dPair_dsecondOf (Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dsplitLastDot (Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dsplitOnDot n))))

# 622 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_Vuna_dCompiler_dElab_dTermination_dMeasure_disMapLike = (fun n -> (if (if (if (if ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_ddotBase n) = "map") then true else ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_ddotBase n) = "traverse")) then true else ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_ddotBase n) = "concatMap")) then true else ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_ddotBase n) = "mapMaybe")) then true else ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_ddotBase n) = "filter")))

# 630 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_Vuna_dCompiler_dElab_dTermination_dMeasure_dextendElemSizes = (fun mc0 mc1 mc2 -> (match mc1 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__328, dtb__329) -> (match ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dsizeOfVarStrict dtb__328) mc0) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__330) -> ((fun nd_uscrut7 -> (match nd_uscrut7 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__331; Base_dPair.f_Base_dPair_dPair_second = dtb__332 } -> (match dtb__332 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__333; Base_dPair.f_Base_dPair_dPair_second = dtb__334 } -> (Base_dList.C_Base_dList_dList__x58__x58_ ({ Base_dPair.f_Base_dPair_dPair_first = mc2; Base_dPair.f_Base_dPair_dPair_second = { Base_dPair.f_Base_dPair_dPair_first = dtb__331; Base_dPair.f_Base_dPair_dPair_second = { Base_dPair.f_Base_dPair_dPair_first = (dtb__333 + 1); Base_dPair.f_Base_dPair_dPair_second = ((Base_dList.v_Base_dList_dappend dtb__334) (Base_dList.C_Base_dList_dList__x58__x58_ (0, Base_dList.C_Base_dList_dList_Nil))) } } }, mc0))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) dtb__330)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> mc0
  | _ -> failwith "DT: impossible branch"
)
  | _ -> mc0
))

# 640 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let rec v_Vuna_dCompiler_dElab_dTermination_dMeasure_dedgeStrictGo = (fun mc0 mc1 mc2 mc3 mc4 -> (match mc2 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__335, dtb__336) -> (match dtb__335 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__337; Base_dPair.f_Base_dPair_dPair_second = dtb__338 } -> (match dtb__337 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__339; Base_dPair.f_Base_dPair_dPair_second = dtb__340 } -> (match dtb__339 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__341; Base_dPair.f_Base_dPair_dPair_second = dtb__342 } -> (if (dtb__341 = mc0) then (if (dtb__342 = mc1) then (((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dedgeStrictGo mc0) mc1) dtb__336) true) (if (dtb__340 > 0) then mc4 else false)) else (((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dedgeStrictGo mc0) mc1) dtb__336) mc3) mc4)) else (((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dedgeStrictGo mc0) mc1) dtb__336) mc3) mc4))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> (if mc3 then mc4 else false)
  | _ -> failwith "DT: impossible branch"
))

# 637 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_Vuna_dCompiler_dElab_dTermination_dMeasure_dedgeStrict = (fun f g edges -> (((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dedgeStrictGo f) g) edges) false) true))

# 650 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let rec v_Vuna_dCompiler_dElab_dTermination_dMeasure_dedgeTargetsGo = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__343, dtb__344) -> (match dtb__343 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__345; Base_dPair.f_Base_dPair_dPair_second = dtb__346 } -> (match dtb__345 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__347; Base_dPair.f_Base_dPair_dPair_second = dtb__348 } -> (match dtb__347 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__349; Base_dPair.f_Base_dPair_dPair_second = dtb__350 } -> (if (dtb__349 = mc0) then (Base_dList.C_Base_dList_dList__x58__x58_ (dtb__350, ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dedgeTargetsGo mc0) dtb__344))) else ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dedgeTargetsGo mc0) dtb__344))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 647 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_Vuna_dCompiler_dElab_dTermination_dMeasure_dedgeTargets = (fun f edges -> (v_Vuna_dCompiler_dElab_dTermination_dMeasure_ddedup ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dedgeTargetsGo f) edges)))

# 659 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let rec v_Vuna_dCompiler_dElab_dTermination_dMeasure_dweakAdjGo = (fun mc0 mc1 mc2 mc3 -> (match mc3 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__351, dtb__352) -> (if (((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dedgeStrict mc2) dtb__351) mc1) then ((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dweakAdjGo mc0) mc1) mc2) dtb__352) else (Base_dList.C_Base_dList_dList__x58__x58_ (dtb__351, ((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dweakAdjGo mc0) mc1) mc2) dtb__352))))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 656 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_Vuna_dCompiler_dElab_dTermination_dMeasure_dweakAdj = (fun comp edges f -> ((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dweakAdjGo comp) edges) f) ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dedgeTargets f) edges)))

# 667 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let rec v_Vuna_dCompiler_dElab_dTermination_dMeasure_dweakReachFuel = (fun fuel comp edges start frontier visited -> (if (fuel <= 0) then false else (match frontier with
  | Base_dList.C_Base_dList_dList_Nil -> false
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__353, dtb__354) -> (if (dtb__353 = start) then true else (if ((Base_dList.v_Base_dList_dmemName dtb__353) visited) then ((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dweakReachFuel (fuel - 1)) comp) edges) start) dtb__354) visited) else ((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dweakReachFuel (fuel - 1)) comp) edges) start) ((Base_dList.v_Base_dList_dappend dtb__354) (((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dweakAdj comp) edges) dtb__353))) (Base_dList.C_Base_dList_dList__x58__x58_ (dtb__353, visited)))))
  | _ -> failwith "DT: impossible branch"
)))

# 664 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_Vuna_dCompiler_dElab_dTermination_dMeasure_dweakReach = (fun comp edges start frontier visited -> ((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dweakReachFuel 100000) comp) edges) start) frontier) visited))

# 679 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let rec v_Vuna_dCompiler_dElab_dTermination_dMeasure_dhasWeakCycleGo = (fun mc0 mc1 mc2 -> (match mc2 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__355, dtb__356) -> (if (((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dweakReach mc0) mc1) dtb__355) (((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dweakAdj mc0) mc1) dtb__355)) (Base_dList.C_Base_dList_dList__x58__x58_ (dtb__355, Base_dList.C_Base_dList_dList_Nil))) then true else (((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dhasWeakCycleGo mc0) mc1) dtb__356))
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 676 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_Vuna_dCompiler_dElab_dTermination_dMeasure_dhasWeakCycle = (fun comp edges -> (((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dhasWeakCycleGo comp) edges) comp))

# 686 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_Vuna_dCompiler_dElab_dTermination_dMeasure_drelEqual = 0

# 558 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_Vuna_dCompiler_dElab_dTermination_dMeasure_drelOfArg = (fun mc0 mc1 mc2 mc3 mc4 mc5 mc6 mc7 -> (match mc1 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp (dtb__357, dtb__358, dtb__359) -> (match dtb__357 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__360, dtb__361) -> (if ((Base_dList.v_Base_dList_dmemName dtb__360) mc3) then (match ((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dfindWrapField mc0) dtb__358) mc2) 0) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__362) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__362))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (if (((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dsameCtorApp mc0) dtb__358) mc2) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (v_Vuna_dCompiler_dElab_dTermination_dMeasure_drelEqual)) else Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing)
  | _ -> failwith "DT: impossible branch"
) else (if ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dprojHas dtb__360) mc4) then (((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dprojRel mc0) dtb__358) mc2) else ((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_darithRel mc0) mc1) mc2) mc5) mc6) mc7)))
  | _ -> ((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_darithRel mc0) mc1) mc2) mc5) mc6) mc7)
)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__363, dtb__364) -> (match ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dsizeOfVarStrict dtb__363) mc2) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__365) -> ((fun nd_uscrut12 -> (match nd_uscrut12 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__366; Base_dPair.f_Base_dPair_dPair_second = dtb__367 } -> (match dtb__367 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__368; Base_dPair.f_Base_dPair_dPair_second = dtb__369 } -> (if (dtb__366 = mc0) then (if (dtb__368 > 0) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (1)) else (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (0))) else Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) dtb__365)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
))

# 572 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_Vuna_dCompiler_dElab_dTermination_dMeasure_dargRel = (fun p args sizes ctors projs caller facts region -> (match ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dnthExpr args) p) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__370) -> ((((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_drelOfArg p) dtb__370) sizes) ctors) projs) caller) facts) region)
  | _ -> failwith "DT: impossible branch"
))

# 689 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_Vuna_dCompiler_dElab_dTermination_dMeasure_drelStrictSub = 1

# 692 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_Vuna_dCompiler_dElab_dTermination_dMeasure_drelStrictMinus = 4

# 695 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_Vuna_dCompiler_dElab_dTermination_dMeasure_drelUnknownSize = -1

# 698 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_Vuna_dCompiler_dElab_dTermination_dMeasure_drelMissingGuard = -2

# 701 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_Vuna_dCompiler_dElab_dTermination_dMeasure_drelNoRelation = -3

# 704 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_Vuna_dCompiler_dElab_dTermination_dMeasure_drelOtherPosition = -4

# 594 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_Vuna_dCompiler_dElab_dTermination_dMeasure_dhintArith = (fun mc0 mc1 mc2 mc3 -> (match mc1 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__371, dtb__372) -> (match dtb__371 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__373, dtb__374) -> (match dtb__372 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__375, dtb__376) -> (match dtb__375 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EInt (dtb__377, dtb__378) -> (match dtb__376 with
  | Base_dList.C_Base_dList_dList_Nil -> (if (dtb__377 <= 0) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (v_Vuna_dCompiler_dElab_dTermination_dMeasure_drelNoRelation)) else (match ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dsizeOfVarStrict dtb__373) mc2) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__379) -> ((fun nd_uscrut17 -> (match nd_uscrut17 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__380; Base_dPair.f_Base_dPair_dPair_second = dtb__381 } -> (match dtb__381 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__382; Base_dPair.f_Base_dPair_dPair_second = dtb__383 } -> (if (dtb__380 = mc0) then (if (dtb__382 = 0) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (mc3)) else (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (v_Vuna_dCompiler_dElab_dTermination_dMeasure_drelNoRelation))) else (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (v_Vuna_dCompiler_dElab_dTermination_dMeasure_drelOtherPosition)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) dtb__379)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (v_Vuna_dCompiler_dElab_dTermination_dMeasure_drelUnknownSize))
  | _ -> failwith "DT: impossible branch"
))
  | _ -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (v_Vuna_dCompiler_dElab_dTermination_dMeasure_drelNoRelation))
)
  | _ -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (v_Vuna_dCompiler_dElab_dTermination_dMeasure_drelNoRelation))
)
  | _ -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (v_Vuna_dCompiler_dElab_dTermination_dMeasure_drelNoRelation))
)
  | _ -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (v_Vuna_dCompiler_dElab_dTermination_dMeasure_drelNoRelation))
)
  | _ -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (v_Vuna_dCompiler_dElab_dTermination_dMeasure_drelNoRelation))
))

# 707 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_Vuna_dCompiler_dElab_dTermination_dMeasure_drelAscending = -5

# 579 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_Vuna_dCompiler_dElab_dTermination_dMeasure_dargRelHint = (fun p args sizes ctors -> (match ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dnthExpr args) p) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__384) -> ((fun nd_uscrut6 -> (match nd_uscrut6 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp (dtb__385, dtb__386, dtb__387) -> (match dtb__385 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__388, dtb__389) -> (if (v_Vuna_dCompiler_dElab_dTermination_dMeasure_disSubOpName dtb__388) then ((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dhintArith p) dtb__386) sizes) v_Vuna_dCompiler_dElab_dTermination_dMeasure_drelMissingGuard) else (if (v_Vuna_dCompiler_dElab_dTermination_dMeasure_disAddOpName dtb__388) then ((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dhintArith p) dtb__386) sizes) v_Vuna_dCompiler_dElab_dTermination_dMeasure_drelAscending) else (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (v_Vuna_dCompiler_dElab_dTermination_dMeasure_drelNoRelation))))
  | _ -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (v_Vuna_dCompiler_dElab_dTermination_dMeasure_drelNoRelation))
)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__390, dtb__391) -> (if ((Base_dList.v_Base_dList_dmemName dtb__390) ctors) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (v_Vuna_dCompiler_dElab_dTermination_dMeasure_drelNoRelation)) else (match ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dsizeOfVarStrict dtb__390) sizes) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__392) -> ((fun nd_uscrut11 -> (match nd_uscrut11 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__393; Base_dPair.f_Base_dPair_dPair_second = dtb__394 } -> (match dtb__394 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__395; Base_dPair.f_Base_dPair_dPair_second = dtb__396 } -> (if (dtb__393 = p) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (v_Vuna_dCompiler_dElab_dTermination_dMeasure_drelNoRelation)) else (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (v_Vuna_dCompiler_dElab_dTermination_dMeasure_drelOtherPosition)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) dtb__392)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (v_Vuna_dCompiler_dElab_dTermination_dMeasure_drelUnknownSize))
  | _ -> failwith "DT: impossible branch"
))
  | _ -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (v_Vuna_dCompiler_dElab_dTermination_dMeasure_drelNoRelation))
)) dtb__384)
  | _ -> failwith "DT: impossible branch"
))

# 711 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_Vuna_dCompiler_dElab_dTermination_dMeasure_drelText = (fun m -> (if (m = v_Vuna_dCompiler_dElab_dTermination_dMeasure_drelStrictSub) then "strict subterm" else (if (m = v_Vuna_dCompiler_dElab_dTermination_dMeasure_drelStrictMinus) then "decreases by a constant, with the non-negativity guard proven" else (if (m = v_Vuna_dCompiler_dElab_dTermination_dMeasure_drelMissingGuard) then "decreases by a constant, but the non-negativity guard is missing" else (if (m = v_Vuna_dCompiler_dElab_dTermination_dMeasure_drelUnknownSize) then "no known size (not a subterm of a parameter)" else (if (m = v_Vuna_dCompiler_dElab_dTermination_dMeasure_drelOtherPosition) then "decreases a different parameter" else (if (m = v_Vuna_dCompiler_dElab_dTermination_dMeasure_drelEqual) then "unchanged" else (if (m = v_Vuna_dCompiler_dElab_dTermination_dMeasure_drelAscending) then "increases instead of decreasing (ascending counters are not supported)" else "no size relation"))))))))

# 722 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_Vuna_dCompiler_dElab_dTermination_dMeasure_disDescent = (fun m -> (m > 0))

# 725 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let rec v_Vuna_dCompiler_dElab_dTermination_dMeasure_dfilterModes = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__397, dtb__398) -> (if (v_Vuna_dCompiler_dElab_dTermination_dMeasure_disDescent dtb__397) then (Base_dList.C_Base_dList_dList__x58__x58_ (dtb__397, (v_Vuna_dCompiler_dElab_dTermination_dMeasure_dfilterModes dtb__398))) else (v_Vuna_dCompiler_dElab_dTermination_dMeasure_dfilterModes dtb__398))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))
