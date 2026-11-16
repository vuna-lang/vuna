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
  | Base_dList.C_Base_dList_dList_Cons (dtb__0, dtb__1) -> (if (mc0 = dtb__0) then ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dallEqTo mc0) dtb__1) else false)
  | Base_dList.C_Base_dList_dList_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

# 22 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_Vuna_dCompiler_dElab_dTermination_dMeasure_dallSame = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__2, dtb__3) -> ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dallEqTo dtb__2) dtb__3)
  | Base_dList.C_Base_dList_dList_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

# 27 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_Vuna_dCompiler_dElab_dTermination_dMeasure_ddedup = (fun names -> (Base_dList.v_Base_dList_dnubNames names))

# 30 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let rec v_Vuna_dCompiler_dElab_dTermination_dMeasure_djoinComma = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__4, dtb__5) -> (match dtb__5 with
  | Base_dList.C_Base_dList_dList_Nil -> dtb__4
  | _ -> (String.concat "" [dtb__4; ", "; (v_Vuna_dCompiler_dElab_dTermination_dMeasure_djoinComma dtb__5)])
)
  | Base_dList.C_Base_dList_dList_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))

# 36 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let rec v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposHas = (fun mc0 mc1 mc2 -> (match mc2 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__6, dtb__7) -> (match dtb__6 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__8; Base_dPair.f_Base_dPair_dPair_second = dtb__9 } -> (if (mc0 = dtb__8) then (if (mc1 = dtb__9) then true else (((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposHas mc0) mc1) dtb__7)) else (((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposHas mc0) mc1) dtb__7))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 46 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let rec v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposTblOfGo = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__10, dtb__11) -> (match dtb__10 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__12; Base_dPair.f_Base_dPair_dPair_second = dtb__13 } -> (match ((((Base_dHashMap.v_Base_dHashMap_dlookup Base_dString.v_Hashable_uString) Base_dString.v_Eq_uString) dtb__12) mc1) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__14) -> ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposTblOfGo dtb__11) ((((Base_dHashMap.v_Base_dHashMap_dinsert Base_dString.v_Hashable_uString) dtb__12) (Base_dList.C_Base_dList_dList_Cons (dtb__13, dtb__14))) mc1))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposTblOfGo dtb__11) ((((Base_dHashMap.v_Base_dHashMap_dinsert Base_dString.v_Hashable_uString) dtb__12) (Base_dList.C_Base_dList_dList_Cons (dtb__13, Base_dList.C_Base_dList_dList_Nil))) mc1))
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
  | Base_dList.C_Base_dList_dList_Cons (dtb__15, dtb__16) -> (if (mc0 = dtb__15) then true else ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dmemInt mc0) dtb__16))
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
let v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposAdd = (fun f i facts -> (if (((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposHas f) i) facts) then facts else (Base_dList.C_Base_dList_dList_Cons ({ Base_dPair.f_Base_dPair_dPair_first = f; Base_dPair.f_Base_dPair_dPair_second = i }, facts))))

# 64 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let rec v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposSubset = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__18, dtb__19) -> (match dtb__18 with
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
  | Base_dList.C_Base_dList_dList_Cons (dtb__22, dtb__23) -> (match dtb__22 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__24; Base_dPair.f_Base_dPair_dPair_second = dtb__25 } -> (if (((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposHas dtb__24) dtb__25) mc1) then ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposFilter dtb__23) mc1) else (Base_dList.C_Base_dList_dList_Cons ({ Base_dPair.f_Base_dPair_dPair_first = dtb__24; Base_dPair.f_Base_dPair_dPair_second = dtb__25 }, ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposFilter dtb__23) mc1))))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 76 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let rec v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposUnion = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__26, dtb__27) -> (match dtb__26 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__28; Base_dPair.f_Base_dPair_dPair_second = dtb__29 } -> ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposUnion dtb__27) (((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposAdd dtb__28) dtb__29) mc1))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> mc1
  | _ -> failwith "DT: impossible branch"
))

# 82 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let rec v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposFilterTbl = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__30, dtb__31) -> (match dtb__30 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__32; Base_dPair.f_Base_dPair_dPair_second = dtb__33 } -> (if (((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposHasTbl dtb__32) dtb__33) mc1) then ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposFilterTbl dtb__31) mc1) else (Base_dList.C_Base_dList_dList_Cons ({ Base_dPair.f_Base_dPair_dPair_first = dtb__32; Base_dPair.f_Base_dPair_dPair_second = dtb__33 }, ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposFilterTbl dtb__31) mc1))))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 87 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let rec v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposSubsetTbl = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__34, dtb__35) -> (match dtb__34 with
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
  | Base_dList.C_Base_dList_dList_Cons (dtb__38, dtb__39) -> (match dtb__38 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DFun (dtb__40, dtb__41, dtb__42, dtb__43) -> (Base_dList.C_Base_dList_dList_Cons ({ Base_dPair.f_Base_dPair_dPair_first = dtb__40; Base_dPair.f_Base_dPair_dPair_second = { Base_dPair.f_Base_dPair_dPair_first = dtb__41; Base_dPair.f_Base_dPair_dPair_second = dtb__42 } }, (v_Vuna_dCompiler_dElab_dTermination_dMeasure_dfunDeclsOf dtb__39)))
  | _ -> (v_Vuna_dCompiler_dElab_dTermination_dMeasure_dfunDeclsOf dtb__39)
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 104 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let rec v_Vuna_dCompiler_dElab_dTermination_dMeasure_dlookupGroup = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__44, dtb__45) -> (match dtb__44 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__46; Base_dPair.f_Base_dPair_dPair_second = dtb__47 } -> (if (dtb__46 = mc0) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__47)) else ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dlookupGroup mc0) dtb__45))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 108 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let rec v_Vuna_dCompiler_dElab_dTermination_dMeasure_dreplaceGroup = (fun mc0 mc1 mc2 -> (match mc2 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__48, dtb__49) -> (match dtb__48 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__50; Base_dPair.f_Base_dPair_dPair_second = dtb__51 } -> (if (dtb__50 = mc0) then (Base_dList.C_Base_dList_dList_Cons ({ Base_dPair.f_Base_dPair_dPair_first = dtb__50; Base_dPair.f_Base_dPair_dPair_second = mc1 }, dtb__49)) else (Base_dList.C_Base_dList_dList_Cons ({ Base_dPair.f_Base_dPair_dPair_first = dtb__50; Base_dPair.f_Base_dPair_dPair_second = dtb__51 }, (((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dreplaceGroup mc0) mc1) dtb__49))))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 126 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let rec v_Vuna_dCompiler_dElab_dTermination_dMeasure_dgroupDefsGo = (fun mc0 mc1 mc2 -> (match mc2 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__52, dtb__53) -> (match dtb__52 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__54; Base_dPair.f_Base_dPair_dPair_second = dtb__55 } -> (match ((((Base_dHashMap.v_Base_dHashMap_dlookup Base_dString.v_Hashable_uString) Base_dString.v_Eq_uString) dtb__54) mc0) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__56) -> (((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dgroupDefsGo ((((Base_dHashMap.v_Base_dHashMap_dinsert Base_dString.v_Hashable_uString) dtb__54) (Base_dList.C_Base_dList_dList_Cons (dtb__55, dtb__56))) mc0)) mc1) dtb__53)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dgroupDefsGo ((((Base_dHashMap.v_Base_dHashMap_dinsert Base_dString.v_Hashable_uString) dtb__54) (Base_dList.C_Base_dList_dList_Cons (dtb__55, Base_dList.C_Base_dList_dList_Nil))) mc0)) (Base_dList.C_Base_dList_dList_Cons (dtb__54, mc1))) dtb__53)
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
  | Base_dList.C_Base_dList_dList_Cons (dtb__58, dtb__59) -> (match dtb__58 with
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
  | Base_dList.C_Base_dList_dList_Cons (dtb__63, dtb__64) -> ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dmaxInt (Base_dList.v_Base_dList_dlength (Base_dPair.v_Base_dPair_dfirstOf dtb__63))) (v_Vuna_dCompiler_dElab_dTermination_dMeasure_ddefArity dtb__64))
  | Base_dList.C_Base_dList_dList_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))

# 149 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let rec v_Vuna_dCompiler_dElab_dTermination_dMeasure_dmaxArityOf = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__65, dtb__66) -> ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dmaxInt (v_Vuna_dCompiler_dElab_dTermination_dMeasure_ddefArity ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dclausesOfDefTbl dtb__65) mc1))) ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dmaxArityOf dtb__66) mc1))
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
  | Base_dList.C_Base_dList_dList_Cons (dtb__71, dtb__72) -> (match dtb__71 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DData (dtb__73, dtb__74, dtb__75, dtb__76, dtb__77, dtb__78, dtb__79, dtb__80, dtb__81) -> ((Base_dList.v_Base_dList_dappend ((Base_dList.v_Base_dList_dmap v_Vuna_dCompiler_dElab_dTermination_dMeasure_dctorNameOf) dtb__76)) (v_Vuna_dCompiler_dElab_dTermination_dMeasure_dctorNamesOf dtb__72))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DRecord (dtb__82, dtb__83, dtb__84, dtb__85, dtb__86, dtb__87, dtb__88, dtb__89) -> (Base_dList.C_Base_dList_dList_Cons (dtb__82, (v_Vuna_dCompiler_dElab_dTermination_dMeasure_dctorNamesOf dtb__72)))
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
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PVar (dtb__97, dtb__98) -> (Base_dList.C_Base_dList_dList_Cons ({ Base_dPair.f_Base_dPair_dPair_first = dtb__97; Base_dPair.f_Base_dPair_dPair_second = { Base_dPair.f_Base_dPair_dPair_first = mc1; Base_dPair.f_Base_dPair_dPair_second = { Base_dPair.f_Base_dPair_dPair_first = (Base_dList.v_Base_dList_dlength mc2); Base_dPair.f_Base_dPair_dPair_second = mc2 } } }, mc3))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PAs (dtb__99, dtb__100, dtb__101) -> ((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dpatSizeStrict dtb__100) mc1) mc2) (Base_dList.C_Base_dList_dList_Cons ({ Base_dPair.f_Base_dPair_dPair_first = dtb__99; Base_dPair.f_Base_dPair_dPair_second = { Base_dPair.f_Base_dPair_dPair_first = mc1; Base_dPair.f_Base_dPair_dPair_second = { Base_dPair.f_Base_dPair_dPair_first = (Base_dList.v_Base_dList_dlength mc2); Base_dPair.f_Base_dPair_dPair_second = mc2 } } }, mc3)))
  | _ -> mc3
))
# 175 "Vuna/Compiler/Elab/Termination/Measure.vuna"
and v_Vuna_dCompiler_dElab_dTermination_dMeasure_dpatsSizeStrict = (fun mc0 mc1 mc2 mc3 mc4 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__102, dtb__103) -> (((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dpatsSizeStrict dtb__103) mc1) mc2) (mc3 + 1)) ((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dpatSizeStrict dtb__102) mc1) ((Base_dList.v_Base_dList_dappend mc2) (Base_dList.C_Base_dList_dList_Cons (mc3, Base_dList.C_Base_dList_dList_Nil)))) mc4))
  | Base_dList.C_Base_dList_dList_Nil -> mc4
  | _ -> failwith "DT: impossible branch"
))
# 180 "Vuna/Compiler/Elab/Termination/Measure.vuna"
and v_Vuna_dCompiler_dElab_dTermination_dMeasure_dfieldsSizeStrict = (fun mc0 mc1 mc2 mc3 mc4 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__104, dtb__105) -> (match dtb__104 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__106; Base_dPair.f_Base_dPair_dPair_second = dtb__107 } -> (((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dfieldsSizeStrict dtb__105) mc1) mc2) (mc3 + 1)) ((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dpatSizeStrict dtb__107) mc1) ((Base_dList.v_Base_dList_dappend mc2) (Base_dList.C_Base_dList_dList_Cons (mc3, Base_dList.C_Base_dList_dList_Nil)))) mc4))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> mc4
  | _ -> failwith "DT: impossible branch"
))

# 188 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let rec v_Vuna_dCompiler_dElab_dTermination_dMeasure_dstrSizeEntriesGo = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__108, dtb__109) -> ((Base_dList.v_Base_dList_dappend ((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dpatSizeStrict dtb__108) mc1) Base_dList.C_Base_dList_dList_Nil) Base_dList.C_Base_dList_dList_Nil)) ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dstrSizeEntriesGo dtb__109) (mc1 + 1)))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 185 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_Vuna_dCompiler_dElab_dTermination_dMeasure_dstrSizeEntries = (fun pats -> ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dstrSizeEntriesGo pats) 0))

# 202 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let rec v_Vuna_dCompiler_dElab_dTermination_dMeasure_dsizeOfVarStrict = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__110, dtb__111) -> (match dtb__110 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__112; Base_dPair.f_Base_dPair_dPair_second = dtb__113 } -> (if (dtb__112 = mc0) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__113)) else ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dsizeOfVarStrict mc0) dtb__111))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 192 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_Vuna_dCompiler_dElab_dTermination_dMeasure_dextendSizesStrict = (fun mc0 mc1 mc2 -> (match mc1 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__114, dtb__115) -> (match ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dsizeOfVarStrict dtb__114) mc0) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__116) -> ((fun nd_uscrut7 -> (match nd_uscrut7 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__117; Base_dPair.f_Base_dPair_dPair_second = dtb__118 } -> (match dtb__118 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__119; Base_dPair.f_Base_dPair_dPair_second = dtb__120 } -> (match mc2 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PCon (dtb__121, dtb__122, dtb__123) -> ((Base_dList.v_Base_dList_dappend mc0) (((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dpatsSizeStrict dtb__122) dtb__117) dtb__120) 0) Base_dList.C_Base_dList_dList_Nil))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PRecord (dtb__124, dtb__125, dtb__126) -> ((Base_dList.v_Base_dList_dappend mc0) (((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dfieldsSizeStrict dtb__125) dtb__117) dtb__120) 0) Base_dList.C_Base_dList_dList_Nil))
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

# 225 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_Vuna_dCompiler_dElab_dTermination_dMeasure_dopBaseName = (fun name -> (Base_dPair.v_Base_dPair_dsecondOf (Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dsplitLastDot (Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dsplitOnDot name))))

# 246 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_Vuna_dCompiler_dElab_dTermination_dMeasure_dvarOfExpr = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__127, dtb__128) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__127))
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
))

# 228 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_Vuna_dCompiler_dElab_dTermination_dMeasure_dguardLE = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__129, dtb__130) -> (match dtb__130 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__131, dtb__132) -> (match dtb__132 with
  | Base_dList.C_Base_dList_dList_Nil -> (match dtb__131 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EInt (dtb__133, dtb__134) -> (if (dtb__133 = 0) then (v_Vuna_dCompiler_dElab_dTermination_dMeasure_dvarOfExpr dtb__129) else Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
))

# 234 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_Vuna_dCompiler_dElab_dTermination_dMeasure_dguardGE = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__135, dtb__136) -> (match dtb__136 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__137, dtb__138) -> (match dtb__138 with
  | Base_dList.C_Base_dList_dList_Nil -> (match dtb__135 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EInt (dtb__139, dtb__140) -> (if (dtb__139 = 0) then (v_Vuna_dCompiler_dElab_dTermination_dMeasure_dvarOfExpr dtb__137) else Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
))

# 240 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_Vuna_dCompiler_dElab_dTermination_dMeasure_dguardLT = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__141, dtb__142) -> (match dtb__142 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__143, dtb__144) -> (match dtb__144 with
  | Base_dList.C_Base_dList_dList_Nil -> (match dtb__143 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EInt (dtb__145, dtb__146) -> (if (dtb__145 = 1) then (v_Vuna_dCompiler_dElab_dTermination_dMeasure_dvarOfExpr dtb__141) else Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
))

# 210 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_Vuna_dCompiler_dElab_dTermination_dMeasure_dguardPosVar = (fun e -> ((fun nd_uscrut1 -> (match nd_uscrut1 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp (dtb__147, dtb__148, dtb__149) -> (match dtb__147 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__150, dtb__151) -> (if ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dopBaseName dtb__150) = "le") then (v_Vuna_dCompiler_dElab_dTermination_dMeasure_dguardLE dtb__148) else (if ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dopBaseName dtb__150) = "ge") then (v_Vuna_dCompiler_dElab_dTermination_dMeasure_dguardGE dtb__148) else (if ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dopBaseName dtb__150) = "lt") then (v_Vuna_dCompiler_dElab_dTermination_dMeasure_dguardLT dtb__148) else (if ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dopBaseName dtb__150) = "<=") then (v_Vuna_dCompiler_dElab_dTermination_dMeasure_dguardLE dtb__148) else (if ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dopBaseName dtb__150) = ">=") then (v_Vuna_dCompiler_dElab_dTermination_dMeasure_dguardGE dtb__148) else (if ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dopBaseName dtb__150) = "<") then (v_Vuna_dCompiler_dElab_dTermination_dMeasure_dguardLT dtb__148) else Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing))))))
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)) e))

# 267 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposMarkPos = (fun f i st -> { Base_dPair.f_Base_dPair_dPair_first = (Base_dList.C_Base_dList_dList_Cons ({ Base_dPair.f_Base_dPair_dPair_first = f; Base_dPair.f_Base_dPair_dPair_second = i }, (Base_dPair.v_Base_dPair_dfirstOf st))); Base_dPair.f_Base_dPair_dPair_second = (Base_dPair.v_Base_dPair_dsecondOf st) })

# 270 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposMarkNeg = (fun f i st -> { Base_dPair.f_Base_dPair_dPair_first = (Base_dPair.v_Base_dPair_dfirstOf st); Base_dPair.f_Base_dPair_dPair_second = (Base_dList.C_Base_dList_dList_Cons ({ Base_dPair.f_Base_dPair_dPair_first = f; Base_dPair.f_Base_dPair_dPair_second = i }, (Base_dPair.v_Base_dPair_dsecondOf st))) })

# 283 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let rec v_Vuna_dCompiler_dElab_dTermination_dMeasure_ddedupInts = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__152, dtb__153) -> (if ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dmemInt dtb__152) dtb__153) then (v_Vuna_dCompiler_dElab_dTermination_dMeasure_ddedupInts dtb__153) else (Base_dList.C_Base_dList_dList_Cons (dtb__152, (v_Vuna_dCompiler_dElab_dTermination_dMeasure_ddedupInts dtb__153))))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 280 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposEntryPairs = (fun mc0 -> (match mc0 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__154; Base_dPair.f_Base_dPair_dPair_second = dtb__155 } -> ((Base_dList.v_Base_dList_dmap (fun i -> { Base_dPair.f_Base_dPair_dPair_first = dtb__154; Base_dPair.f_Base_dPair_dPair_second = i })) (v_Vuna_dCompiler_dElab_dTermination_dMeasure_ddedupInts dtb__155))
  | _ -> failwith "DT: impossible branch"
))

# 277 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposTblPairs = (fun tbl -> ((Base_dList.v_Base_dList_dconcatMap v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposEntryPairs) ((Base_dHashMap.v_Base_dHashMap_dtoList Base_dString.v_Eq_uString) tbl)))

# 274 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposNormalize = (fun xs -> (v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposTblPairs (v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposTblOf xs)))

# 421 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let rec v_Vuna_dCompiler_dElab_dTermination_dMeasure_dpathInPats = (fun mc0 mc1 mc2 mc3 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__156, dtb__157) -> (match (((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dpathInPat mc0) dtb__156) ((Base_dList.v_Base_dList_dappend mc2) (Base_dList.C_Base_dList_dList_Cons (mc3, Base_dList.C_Base_dList_dList_Nil)))) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__158) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__158))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dpathInPats mc0) dtb__157) mc2) (mc3 + 1))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))
# 427 "Vuna/Compiler/Elab/Termination/Measure.vuna"
and v_Vuna_dCompiler_dElab_dTermination_dMeasure_dpathInFields = (fun mc0 mc1 mc2 mc3 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__159, dtb__160) -> (match dtb__159 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__161; Base_dPair.f_Base_dPair_dPair_second = dtb__162 } -> (match (((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dpathInPat mc0) dtb__162) ((Base_dList.v_Base_dList_dappend mc2) (Base_dList.C_Base_dList_dList_Cons (mc3, Base_dList.C_Base_dList_dList_Nil)))) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__163) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__163))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dpathInFields mc0) dtb__160) mc2) (mc3 + 1))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))
# 433 "Vuna/Compiler/Elab/Termination/Measure.vuna"
and v_Vuna_dCompiler_dElab_dTermination_dMeasure_dpathInPat = (fun mc0 mc1 mc2 -> (match mc1 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PRecord (dtb__164, dtb__165, dtb__166) -> ((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dpathInFields mc0) dtb__165) mc2) 0)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PCon (dtb__167, dtb__168, dtb__169) -> ((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dpathInPats mc0) dtb__168) mc2) 0)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PWild (dtb__170) -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PVar (dtb__171, dtb__172) -> (if (dtb__171 = mc0) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (mc2)) else Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
))

# 440 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_Vuna_dCompiler_dElab_dTermination_dMeasure_dprojectionOfDef = (fun d -> ((fun nd_uscrut1 -> (match nd_uscrut1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__173, dtb__174) -> (match dtb__174 with
  | Base_dList.C_Base_dList_dList_Nil -> ((fun nd_uscrut6 -> (match nd_uscrut6 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__175, dtb__176) -> (match dtb__176 with
  | Base_dList.C_Base_dList_dList_Nil -> (match (Base_dPair.v_Base_dPair_dsecondOf dtb__173) with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__177, dtb__178) -> (match (((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dpathInPat dtb__177) dtb__175) Base_dList.C_Base_dList_dList_Nil) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__179) -> (if (v_Vuna_dCompiler_dElab_dTermination_dMeasure_dnotEmpty dtb__179) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Base_dPair.f_Base_dPair_dPair_first = (Base_dPair.v_Base_dPair_dfirstOf d); Base_dPair.f_Base_dPair_dPair_second = dtb__179 })) else Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)) (Base_dPair.v_Base_dPair_dfirstOf dtb__173))
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)) (Base_dPair.v_Base_dPair_dsecondOf d)))

# 451 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let rec v_Vuna_dCompiler_dElab_dTermination_dMeasure_dprojectionsOf = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__180, dtb__181) -> (match (v_Vuna_dCompiler_dElab_dTermination_dMeasure_dprojectionOfDef dtb__180) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__182) -> (Base_dList.C_Base_dList_dList_Cons (dtb__182, (v_Vuna_dCompiler_dElab_dTermination_dMeasure_dprojectionsOf dtb__181)))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (v_Vuna_dCompiler_dElab_dTermination_dMeasure_dprojectionsOf dtb__181)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 457 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let rec v_Vuna_dCompiler_dElab_dTermination_dMeasure_dprojHas = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__183, dtb__184) -> (match dtb__183 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__185; Base_dPair.f_Base_dPair_dPair_second = dtb__186 } -> (if (mc0 = dtb__185) then true else ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dprojHas mc0) dtb__184))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 461 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let rec v_Vuna_dCompiler_dElab_dTermination_dMeasure_dfindWrapField = (fun mc0 mc1 mc2 mc3 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__187, dtb__188) -> (match dtb__187 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__189, dtb__190) -> (match ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dsizeOfVarStrict dtb__189) mc2) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__191) -> ((fun nd_uscrut11 -> (match nd_uscrut11 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__192; Base_dPair.f_Base_dPair_dPair_second = dtb__193 } -> (match dtb__193 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__194; Base_dPair.f_Base_dPair_dPair_second = dtb__195 } -> (if (dtb__192 = mc0) then ((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dwrapCheck mc0) dtb__188) mc2) mc3) dtb__194) dtb__195) else ((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dfindWrapField mc0) dtb__188) mc2) (mc3 + 1)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) dtb__191)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dfindWrapField mc0) dtb__188) mc2) (mc3 + 1))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> ((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dfindWrapField mc0) dtb__188) mc2) (mc3 + 1))
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))
# 472 "Vuna/Compiler/Elab/Termination/Measure.vuna"
and v_Vuna_dCompiler_dElab_dTermination_dMeasure_dwrapCheck = (fun p rest sizes k depth path -> (if (depth > 0) then (match path with
  | Base_dList.C_Base_dList_dList_Cons (dtb__196, dtb__197) -> (if (dtb__196 = k) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((k + 2))) else ((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dfindWrapField p) rest) sizes) (k + 1)))
  | Base_dList.C_Base_dList_dList_Nil -> ((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dfindWrapField p) rest) sizes) (k + 1))
  | _ -> failwith "DT: impossible branch"
) else ((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dfindWrapField p) rest) sizes) (k + 1))))

# 479 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposVarIn = (fun x p caller facts region -> (if ((Base_dList.v_Base_dList_dmemName x) region) then true else (((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposHasTbl caller) p) facts)))

# 490 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_Vuna_dCompiler_dElab_dTermination_dMeasure_disSubOpName = (fun op -> (if (op = "-") then true else (op = "Base.Num.sub")))

# 498 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_Vuna_dCompiler_dElab_dTermination_dMeasure_darithMinusBase = (fun mc0 mc1 mc2 mc3 mc4 mc5 mc6 -> (match mc1 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__198, dtb__199) -> (match ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dsizeOfVarStrict dtb__198) mc3) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__200) -> ((fun nd_uscrut11 -> (match nd_uscrut11 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__201; Base_dPair.f_Base_dPair_dPair_second = dtb__202 } -> (match dtb__202 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__203; Base_dPair.f_Base_dPair_dPair_second = dtb__204 } -> (if (dtb__201 = mc0) then (if (dtb__203 = 0) then (if (((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposVarIn dtb__198) mc0) mc4) mc5) mc6) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (4)) else Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing) else Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing) else Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) dtb__200)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
))

# 493 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_Vuna_dCompiler_dElab_dTermination_dMeasure_darithMinus = (fun mc0 mc1 mc2 mc3 mc4 mc5 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__205, dtb__206) -> (match dtb__206 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__207, dtb__208) -> (match dtb__207 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EInt (dtb__209, dtb__210) -> (match dtb__208 with
  | Base_dList.C_Base_dList_dList_Nil -> (if (dtb__209 > 0) then (((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_darithMinusBase mc0) dtb__205) dtb__209) mc2) mc3) mc4) mc5) else Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
))

# 482 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_Vuna_dCompiler_dElab_dTermination_dMeasure_darithRel = (fun mc0 mc1 mc2 mc3 mc4 mc5 -> (match mc1 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp (dtb__211, dtb__212, dtb__213) -> (match dtb__211 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__214, dtb__215) -> (if (v_Vuna_dCompiler_dElab_dTermination_dMeasure_disSubOpName dtb__214) then ((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_darithMinus mc0) dtb__212) mc2) mc3) mc4) mc5) else Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
))

# 508 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_Vuna_dCompiler_dElab_dTermination_dMeasure_dprojRel = (fun mc0 mc1 mc2 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__216, dtb__217) -> (match dtb__217 with
  | Base_dList.C_Base_dList_dList_Nil -> (match dtb__216 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__218, dtb__219) -> (match ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dsizeOfVarStrict dtb__218) mc2) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__220) -> ((fun nd_uscrut11 -> (match nd_uscrut11 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__221; Base_dPair.f_Base_dPair_dPair_second = dtb__222 } -> (match dtb__222 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__223; Base_dPair.f_Base_dPair_dPair_second = dtb__224 } -> (if (dtb__221 = mc0) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (1)) else Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) dtb__220)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
))

# 517 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_Vuna_dCompiler_dElab_dTermination_dMeasure_drelOfArg = (fun mc0 mc1 mc2 mc3 mc4 mc5 mc6 mc7 -> (match mc1 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp (dtb__225, dtb__226, dtb__227) -> (match dtb__225 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__228, dtb__229) -> (if ((Base_dList.v_Base_dList_dmemName dtb__228) mc3) then ((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dfindWrapField mc0) dtb__226) mc2) 0) else (if ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dprojHas dtb__228) mc4) then (((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dprojRel mc0) dtb__226) mc2) else ((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_darithRel mc0) mc1) mc2) mc5) mc6) mc7)))
  | _ -> ((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_darithRel mc0) mc1) mc2) mc5) mc6) mc7)
)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__230, dtb__231) -> (match ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dsizeOfVarStrict dtb__230) mc2) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__232) -> ((fun nd_uscrut12 -> (match nd_uscrut12 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__233; Base_dPair.f_Base_dPair_dPair_second = dtb__234 } -> (match dtb__234 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__235; Base_dPair.f_Base_dPair_dPair_second = dtb__236 } -> (if (dtb__233 = mc0) then (if (dtb__235 > 0) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (1)) else (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (0))) else Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) dtb__232)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
))

# 535 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_Vuna_dCompiler_dElab_dTermination_dMeasure_dmarkInvalid = (fun acc -> { Base_dPair.f_Base_dPair_dPair_first = false; Base_dPair.f_Base_dPair_dPair_second = (Base_dPair.v_Base_dPair_dsecondOf acc) })

# 538 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_Vuna_dCompiler_dElab_dTermination_dMeasure_daddEdgeMode = (fun caller callee m sp acc -> { Base_dPair.f_Base_dPair_dPair_first = (Base_dPair.v_Base_dPair_dfirstOf acc); Base_dPair.f_Base_dPair_dPair_second = (Base_dList.C_Base_dList_dList_Cons ({ Base_dPair.f_Base_dPair_dPair_first = { Base_dPair.f_Base_dPair_dPair_first = { Base_dPair.f_Base_dPair_dPair_first = caller; Base_dPair.f_Base_dPair_dPair_second = callee }; Base_dPair.f_Base_dPair_dPair_second = m }; Base_dPair.f_Base_dPair_dPair_second = sp }, (Base_dPair.v_Base_dPair_dsecondOf acc))) })

# 542 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_Vuna_dCompiler_dElab_dTermination_dMeasure_dgroupHead = (fun mc0 mc1 -> (match mc1 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__237, dtb__238) -> (if ((Base_dList.v_Base_dList_dmemName dtb__237) mc0) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__237)) else Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
))

# 546 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let rec v_Vuna_dCompiler_dElab_dTermination_dMeasure_dnthExpr = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__239, dtb__240) -> (if (mc1 <= 0) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__239)) else ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dnthExpr dtb__240) (mc1 - 1)))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 251 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_Vuna_dCompiler_dElab_dTermination_dMeasure_dargPositive = (fun args i sizes caller facts region -> (match ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dnthExpr args) i) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> false
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__241) -> (match dtb__241 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EInt (dtb__242, dtb__243) -> (dtb__242 > 0)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__244, dtb__245) -> (if ((Base_dList.v_Base_dList_dmemName dtb__244) region) then true else (match ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dsizeOfVarStrict dtb__244) sizes) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__246) -> ((fun nd_uscrut12 -> (match nd_uscrut12 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__247; Base_dPair.f_Base_dPair_dPair_second = dtb__248 } -> (match dtb__248 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__249; Base_dPair.f_Base_dPair_dPair_second = dtb__250 } -> (if (dtb__249 = 0) then (((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposHasTbl caller) dtb__247) facts) else false)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) dtb__246)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
))
  | _ -> false
)
  | _ -> failwith "DT: impossible branch"
))

# 371 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let rec v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalkCalleeGo = (fun namesTbl caller sizes facts region g remaining args st -> (if (remaining <= 0) then st else ((fun i -> ((fun st1 -> (((((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalkCalleeGo namesTbl) caller) sizes) facts) region) g) (remaining - 1)) args) st1)) (if ((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dargPositive args) i) sizes) caller) facts) region) then (((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposMarkPos g) i) st) else (((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposMarkNeg g) i) st)))) ((Base_dList.v_Base_dList_dlength args) - remaining))))

# 367 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalkCallee = (fun namesTbl caller sizes facts region g i args st -> (((((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalkCalleeGo namesTbl) caller) sizes) facts) region) g) ((Base_dList.v_Base_dList_dlength args) - i)) args) st))

# 287 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let rec v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalkArgs = (fun mc0 mc1 mc2 mc3 mc4 mc5 mc6 -> (match mc5 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__251, dtb__252) -> (((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalkArgs mc0) mc1) mc2) mc3) mc4) dtb__252) (((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalk mc0) mc1) mc2) mc3) mc4) dtb__251) mc6))
  | Base_dList.C_Base_dList_dList_Nil -> mc6
  | _ -> failwith "DT: impossible branch"
))
# 293 "Vuna/Compiler/Elab/Termination/Measure.vuna"
and v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalkFields = (fun mc0 mc1 mc2 mc3 mc4 mc5 mc6 -> (match mc5 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__253, dtb__254) -> (match dtb__253 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__255; Base_dPair.f_Base_dPair_dPair_second = dtb__256 } -> (((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalkFields mc0) mc1) mc2) mc3) mc4) dtb__254) (((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalk mc0) mc1) mc2) mc3) mc4) dtb__256) mc6))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> mc6
  | _ -> failwith "DT: impossible branch"
))
# 299 "Vuna/Compiler/Elab/Termination/Measure.vuna"
and v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalkAlts = (fun mc0 mc1 mc2 mc3 mc4 mc5 mc6 -> (match mc5 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__257, dtb__258) -> (match dtb__257 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__259; Base_dPair.f_Base_dPair_dPair_second = dtb__260 } -> (((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalkAlts mc0) mc1) mc2) mc3) mc4) dtb__258) (((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalk mc0) mc1) mc2) mc3) mc4) dtb__260) mc6))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> mc6
  | _ -> failwith "DT: impossible branch"
))
# 305 "Vuna/Compiler/Elab/Termination/Measure.vuna"
and v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalkBinds = (fun mc0 mc1 mc2 mc3 mc4 mc5 mc6 -> (match mc5 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__261, dtb__262) -> (match dtb__261 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__263; Base_dPair.f_Base_dPair_dPair_second = dtb__264 } -> (((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalkBinds mc0) mc1) mc2) mc3) mc4) dtb__262) (((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalk mc0) mc1) mc2) mc3) mc4) dtb__264) mc6))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> mc6
  | _ -> failwith "DT: impossible branch"
))
# 311 "Vuna/Compiler/Elab/Termination/Measure.vuna"
and v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalkStmts = (fun mc0 mc1 mc2 mc3 mc4 mc5 mc6 -> (match mc5 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__265, dtb__266) -> (match dtb__265 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDoStmt_DBind (dtb__267, dtb__268, dtb__269) -> (((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalkStmts mc0) mc1) mc2) mc3) mc4) dtb__266) (((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalk mc0) mc1) mc2) mc3) mc4) dtb__268) mc6))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDoStmt_DExpr (dtb__270, dtb__271) -> (((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalkStmts mc0) mc1) mc2) mc3) mc4) dtb__266) (((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalk mc0) mc1) mc2) mc3) mc4) dtb__270) mc6))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> mc6
  | _ -> failwith "DT: impossible branch"
))
# 321 "Vuna/Compiler/Elab/Termination/Measure.vuna"
and v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalk = (fun mc0 mc1 mc2 mc3 mc4 mc5 mc6 -> (match mc5 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__272, dtb__273) -> mc6
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EAnn (dtb__274, dtb__275, dtb__276) -> (((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalk mc0) mc1) mc2) mc3) mc4) dtb__275) (((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalk mc0) mc1) mc2) mc3) mc4) dtb__274) mc6))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EDo (dtb__277, dtb__278) -> (((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalkStmts mc0) mc1) mc2) mc3) mc4) dtb__277) mc6)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ERecUpdate (dtb__279, dtb__280, dtb__281) -> (((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalkFields mc0) mc1) mc2) mc3) mc4) dtb__280) (((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalk mc0) mc1) mc2) mc3) mc4) dtb__279) mc6))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ERecord (dtb__282, dtb__283, dtb__284) -> (((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalkFields mc0) mc1) mc2) mc3) mc4) dtb__283) mc6)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EField (dtb__285, dtb__286, dtb__287) -> (((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalk mc0) mc1) mc2) mc3) mc4) dtb__285) mc6)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EPi (dtb__288, dtb__289, dtb__290, dtb__291, dtb__292, dtb__293) -> (((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalk mc0) mc1) mc2) mc3) mc4) dtb__292) (((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalk mc0) mc1) mc2) mc3) mc4) dtb__291) mc6))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ELet (dtb__294, dtb__295, dtb__296, dtb__297) -> (((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalk mc0) mc1) mc2) mc3) mc4) dtb__295) (((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalkBinds mc0) mc1) mc2) mc3) mc4) dtb__294) mc6))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ELam (dtb__298, dtb__299, dtb__300) -> (((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalk mc0) mc1) mc2) mc3) mc4) dtb__299) mc6)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ECase (dtb__301, dtb__302, dtb__303) -> (((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalkAlts mc0) mc1) mc2) mc3) mc4) dtb__302) (((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalk mc0) mc1) mc2) mc3) mc4) dtb__301) mc6))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EIf (dtb__304, dtb__305, dtb__306, dtb__307) -> (match (v_Vuna_dCompiler_dElab_dTermination_dMeasure_dguardPosVar dtb__304) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__308) -> ((fun st1 -> ((fun st2 -> (((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalk mc0) mc1) mc2) mc3) (Base_dList.C_Base_dList_dList_Cons (dtb__308, mc4))) dtb__306) st2)) (((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalk mc0) mc1) mc2) mc3) mc4) dtb__305) st1))) (((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalk mc0) mc1) mc2) mc3) mc4) dtb__304) mc6))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((fun st1 -> ((fun st2 -> (((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalk mc0) mc1) mc2) mc3) mc4) dtb__306) st2)) (((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalk mc0) mc1) mc2) mc3) mc4) dtb__305) st1))) (((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalk mc0) mc1) mc2) mc3) mc4) dtb__304) mc6))
  | _ -> failwith "DT: impossible branch"
)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp (dtb__309, dtb__310, dtb__311) -> (match dtb__309 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__312, dtb__313) -> (if ((((Base_dHashMap.v_Base_dHashMap_dmember Base_dString.v_Hashable_uString) Base_dString.v_Eq_uString) dtb__312) mc0) then (((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalkArgs mc0) mc1) mc2) mc3) mc4) dtb__310) (((((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalkCallee mc0) mc1) mc2) mc3) mc4) dtb__312) 0) dtb__310) mc6)) else (((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalkArgs mc0) mc1) mc2) mc3) mc4) dtb__310) (((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalk mc0) mc1) mc2) mc3) mc4) dtb__309) mc6)))
  | _ -> (((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalkArgs mc0) mc1) mc2) mc3) mc4) dtb__310) (((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalk mc0) mc1) mc2) mc3) mc4) dtb__309) mc6))
)
  | _ -> mc6
))

# 380 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let rec v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposScanClauses = (fun mc0 mc1 mc2 mc3 mc4 mc5 -> (match mc4 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__314, dtb__315) -> ((fun sizes -> ((fun st2 -> ((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposScanClauses mc0) mc1) mc2) mc3) dtb__315) st2)) (((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalk mc0) mc3) sizes) mc2) Base_dList.C_Base_dList_dList_Nil) (Base_dPair.v_Base_dPair_dsecondOf dtb__314)) mc5))) (v_Vuna_dCompiler_dElab_dTermination_dMeasure_dstrSizeEntries (Base_dPair.v_Base_dPair_dfirstOf dtb__314)))
  | Base_dList.C_Base_dList_dList_Nil -> mc5
  | _ -> failwith "DT: impossible branch"
))

# 388 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let rec v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposScanDefs = (fun mc0 mc1 mc2 mc3 mc4 -> (match mc3 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__316, dtb__317) -> (((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposScanDefs mc0) mc1) mc2) dtb__317) ((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposScanClauses mc0) mc1) mc2) (Base_dPair.v_Base_dPair_dfirstOf dtb__316)) (Base_dPair.v_Base_dPair_dsecondOf dtb__316)) mc4))
  | Base_dList.C_Base_dList_dList_Nil -> mc4
  | _ -> failwith "DT: impossible branch"
))

# 401 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let rec v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposScanNamesGo = (fun mc0 mc1 mc2 mc3 mc4 -> (match mc3 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__318, dtb__319) -> (((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposScanNamesGo mc0) mc1) mc2) dtb__319) ((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposScanClauses mc0) Base_dList.C_Base_dList_dList_Nil) mc2) dtb__318) ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dclausesOfDefTbl dtb__318) mc1)) mc4))
  | Base_dList.C_Base_dList_dList_Nil -> mc4
  | _ -> failwith "DT: impossible branch"
))

# 395 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposScanNames = (fun namesTbl defTbl factsTbl work st -> ((fun scanned -> { Base_dPair.f_Base_dPair_dPair_first = (v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposNormalize (Base_dPair.v_Base_dPair_dfirstOf scanned)); Base_dPair.f_Base_dPair_dPair_second = (v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposNormalize (Base_dPair.v_Base_dPair_dsecondOf scanned)) }) (((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposScanNamesGo namesTbl) defTbl) factsTbl) work) st)))

# 408 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let rec v_Vuna_dCompiler_dElab_dTermination_dMeasure_dcomputePosFacts = (fun defs fuel facts -> (if (fuel <= 0) then facts else (((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dcomputePosFactsStep defs) fuel) facts)))
# 411 "Vuna/Compiler/Elab/Termination/Measure.vuna"
and v_Vuna_dCompiler_dElab_dTermination_dMeasure_dcomputePosFactsStep = (fun defs fuel facts -> ((fun namesTbl -> ((fun scanned -> ((fun scan -> ((fun fresh -> ((fun merged -> (if ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposSetEqTbl facts) merged) then merged else (((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dcomputePosFacts defs) (fuel - 1)) merged))) ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposUnionTbl facts) fresh))) ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposFilterTbl (Base_dPair.v_Base_dPair_dfirstOf scan)) (v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposTblOf (Base_dPair.v_Base_dPair_dsecondOf scan))))) { Base_dPair.f_Base_dPair_dPair_first = (v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposNormalize (Base_dPair.v_Base_dPair_dfirstOf scanned)); Base_dPair.f_Base_dPair_dPair_second = (v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposNormalize (Base_dPair.v_Base_dPair_dsecondOf scanned)) })) (((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposScanDefs namesTbl) defs) (v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposTblOf facts)) defs) { Base_dPair.f_Base_dPair_dPair_first = Base_dList.C_Base_dList_dList_Nil; Base_dPair.f_Base_dPair_dPair_second = Base_dList.C_Base_dList_dList_Nil }))) (Base_dHashMap.v_Base_dHashMap_dofNames (v_Vuna_dCompiler_dElab_dTermination_dMeasure_ddefNames defs))))

# 530 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_Vuna_dCompiler_dElab_dTermination_dMeasure_dargRel = (fun p args sizes ctors projs caller facts region -> (match ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dnthExpr args) p) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__320) -> ((((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_drelOfArg p) dtb__320) sizes) ctors) projs) caller) facts) region)
  | _ -> failwith "DT: impossible branch"
))

# 550 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_Vuna_dCompiler_dElab_dTermination_dMeasure_ddotBase = (fun n -> (Base_dPair.v_Base_dPair_dsecondOf (Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dsplitLastDot (Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dsplitOnDot n))))

# 553 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_Vuna_dCompiler_dElab_dTermination_dMeasure_disMapLike = (fun n -> (if (if (if (if ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_ddotBase n) = "map") then true else ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_ddotBase n) = "traverse")) then true else ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_ddotBase n) = "concatMap")) then true else ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_ddotBase n) = "mapMaybe")) then true else ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_ddotBase n) = "filter")))

# 561 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_Vuna_dCompiler_dElab_dTermination_dMeasure_dextendElemSizes = (fun mc0 mc1 mc2 -> (match mc1 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__321, dtb__322) -> (match ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dsizeOfVarStrict dtb__321) mc0) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__323) -> ((fun nd_uscrut7 -> (match nd_uscrut7 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__324; Base_dPair.f_Base_dPair_dPair_second = dtb__325 } -> (match dtb__325 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__326; Base_dPair.f_Base_dPair_dPair_second = dtb__327 } -> (Base_dList.C_Base_dList_dList_Cons ({ Base_dPair.f_Base_dPair_dPair_first = mc2; Base_dPair.f_Base_dPair_dPair_second = { Base_dPair.f_Base_dPair_dPair_first = dtb__324; Base_dPair.f_Base_dPair_dPair_second = { Base_dPair.f_Base_dPair_dPair_first = (dtb__326 + 1); Base_dPair.f_Base_dPair_dPair_second = ((Base_dList.v_Base_dList_dappend dtb__327) (Base_dList.C_Base_dList_dList_Cons (0, Base_dList.C_Base_dList_dList_Nil))) } } }, mc0))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) dtb__323)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> mc0
  | _ -> failwith "DT: impossible branch"
)
  | _ -> mc0
))

# 571 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let rec v_Vuna_dCompiler_dElab_dTermination_dMeasure_dedgeStrictGo = (fun mc0 mc1 mc2 mc3 mc4 -> (match mc2 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__328, dtb__329) -> (match dtb__328 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__330; Base_dPair.f_Base_dPair_dPair_second = dtb__331 } -> (match dtb__330 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__332; Base_dPair.f_Base_dPair_dPair_second = dtb__333 } -> (match dtb__332 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__334; Base_dPair.f_Base_dPair_dPair_second = dtb__335 } -> (if (dtb__334 = mc0) then (if (dtb__335 = mc1) then (((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dedgeStrictGo mc0) mc1) dtb__329) true) (if (dtb__333 = 0) then false else mc4)) else (((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dedgeStrictGo mc0) mc1) dtb__329) mc3) mc4)) else (((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dedgeStrictGo mc0) mc1) dtb__329) mc3) mc4))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> (if mc3 then mc4 else false)
  | _ -> failwith "DT: impossible branch"
))

# 568 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_Vuna_dCompiler_dElab_dTermination_dMeasure_dedgeStrict = (fun f g edges -> (((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dedgeStrictGo f) g) edges) false) true))

# 581 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let rec v_Vuna_dCompiler_dElab_dTermination_dMeasure_dedgeTargetsGo = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__336, dtb__337) -> (match dtb__336 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__338; Base_dPair.f_Base_dPair_dPair_second = dtb__339 } -> (match dtb__338 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__340; Base_dPair.f_Base_dPair_dPair_second = dtb__341 } -> (match dtb__340 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__342; Base_dPair.f_Base_dPair_dPair_second = dtb__343 } -> (if (dtb__342 = mc0) then (Base_dList.C_Base_dList_dList_Cons (dtb__343, ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dedgeTargetsGo mc0) dtb__337))) else ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dedgeTargetsGo mc0) dtb__337))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 578 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_Vuna_dCompiler_dElab_dTermination_dMeasure_dedgeTargets = (fun f edges -> (v_Vuna_dCompiler_dElab_dTermination_dMeasure_ddedup ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dedgeTargetsGo f) edges)))

# 590 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let rec v_Vuna_dCompiler_dElab_dTermination_dMeasure_dweakAdjGo = (fun mc0 mc1 mc2 mc3 -> (match mc3 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__344, dtb__345) -> (if (((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dedgeStrict mc2) dtb__344) mc1) then ((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dweakAdjGo mc0) mc1) mc2) dtb__345) else (Base_dList.C_Base_dList_dList_Cons (dtb__344, ((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dweakAdjGo mc0) mc1) mc2) dtb__345))))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 587 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_Vuna_dCompiler_dElab_dTermination_dMeasure_dweakAdj = (fun comp edges f -> ((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dweakAdjGo comp) edges) f) ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dedgeTargets f) edges)))

# 598 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let rec v_Vuna_dCompiler_dElab_dTermination_dMeasure_dweakReachFuel = (fun fuel comp edges start frontier visited -> (if (fuel <= 0) then false else (match frontier with
  | Base_dList.C_Base_dList_dList_Nil -> false
  | Base_dList.C_Base_dList_dList_Cons (dtb__346, dtb__347) -> (if (dtb__346 = start) then true else (if ((Base_dList.v_Base_dList_dmemName dtb__346) visited) then ((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dweakReachFuel (fuel - 1)) comp) edges) start) dtb__347) visited) else ((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dweakReachFuel (fuel - 1)) comp) edges) start) ((Base_dList.v_Base_dList_dappend dtb__347) (((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dweakAdj comp) edges) dtb__346))) (Base_dList.C_Base_dList_dList_Cons (dtb__346, visited)))))
  | _ -> failwith "DT: impossible branch"
)))

# 595 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_Vuna_dCompiler_dElab_dTermination_dMeasure_dweakReach = (fun comp edges start frontier visited -> ((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dweakReachFuel 100000) comp) edges) start) frontier) visited))

# 610 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let rec v_Vuna_dCompiler_dElab_dTermination_dMeasure_dhasWeakCycleGo = (fun mc0 mc1 mc2 -> (match mc2 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__348, dtb__349) -> (if (((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dweakReach mc0) mc1) dtb__348) (((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dweakAdj mc0) mc1) dtb__348)) (Base_dList.C_Base_dList_dList_Cons (dtb__348, Base_dList.C_Base_dList_dList_Nil))) then true else (((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dhasWeakCycleGo mc0) mc1) dtb__349))
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 607 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_Vuna_dCompiler_dElab_dTermination_dMeasure_dhasWeakCycle = (fun comp edges -> (((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dhasWeakCycleGo comp) edges) comp))

# 615 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_Vuna_dCompiler_dElab_dTermination_dMeasure_disDescent = (fun m -> (m <> 0))

# 618 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let rec v_Vuna_dCompiler_dElab_dTermination_dMeasure_dfilterModes = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__350, dtb__351) -> (if (v_Vuna_dCompiler_dElab_dTermination_dMeasure_disDescent dtb__350) then (Base_dList.C_Base_dList_dList_Cons (dtb__350, (v_Vuna_dCompiler_dElab_dTermination_dMeasure_dfilterModes dtb__351))) else (v_Vuna_dCompiler_dElab_dTermination_dMeasure_dfilterModes dtb__351))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))
