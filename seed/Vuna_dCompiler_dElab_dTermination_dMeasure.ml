open Vuna_runtime
let v_Vuna_dCompiler_dElab_dTermination_dMeasure_dmaxInt = (fun a b -> (if (a >= b) then a else b))

let v_Vuna_dCompiler_dElab_dTermination_dMeasure_dnotEmpty = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> true
))

let rec v_Vuna_dCompiler_dElab_dTermination_dMeasure_dallEqTo = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__0, dtb__1) -> (if (mc0 = dtb__0) then ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dallEqTo mc0) dtb__1) else false)
  | Base_dList.C_Base_dList_dList_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTermination_dMeasure_dallSame = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__2, dtb__3) -> ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dallEqTo dtb__2) dtb__3)
  | Base_dList.C_Base_dList_dList_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dTermination_dMeasure_ddedup = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__4, dtb__5) -> (if ((Base_dList.v_Base_dList_dmemName dtb__4) dtb__5) then (v_Vuna_dCompiler_dElab_dTermination_dMeasure_ddedup dtb__5) else (Base_dList.C_Base_dList_dList_Cons (dtb__4, (v_Vuna_dCompiler_dElab_dTermination_dMeasure_ddedup dtb__5))))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dTermination_dMeasure_djoinComma = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__6, dtb__7) -> (match dtb__7 with
  | Base_dList.C_Base_dList_dList_Nil -> dtb__6
  | _ -> (String.concat "" [dtb__6; ", "; (v_Vuna_dCompiler_dElab_dTermination_dMeasure_djoinComma dtb__7)])
)
  | Base_dList.C_Base_dList_dList_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposHas = (fun mc0 mc1 mc2 -> (match mc2 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__8, dtb__9) -> (match dtb__8 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__10; Base_dPair.f_Base_dPair_dPair_second = dtb__11 } -> (if (mc0 = dtb__10) then (if (mc1 = dtb__11) then true else (((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposHas mc0) mc1) dtb__9)) else (((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposHas mc0) mc1) dtb__9))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposTblOfGo = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__12, dtb__13) -> (match dtb__12 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__14; Base_dPair.f_Base_dPair_dPair_second = dtb__15 } -> (match ((((Base_dHashMap.v_Base_dHashMap_dlookup Base_dString.v_Hashable_uString) Base_dString.v_Eq_uString) dtb__14) mc1) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__16) -> ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposTblOfGo dtb__13) ((((Base_dHashMap.v_Base_dHashMap_dinsert Base_dString.v_Hashable_uString) dtb__14) (Base_dList.C_Base_dList_dList_Cons (dtb__15, dtb__16))) mc1))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposTblOfGo dtb__13) ((((Base_dHashMap.v_Base_dHashMap_dinsert Base_dString.v_Hashable_uString) dtb__14) (Base_dList.C_Base_dList_dList_Cons (dtb__15, Base_dList.C_Base_dList_dList_Nil))) mc1))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> mc1
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposTblOf = (fun xs -> ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposTblOfGo xs) ((Base_dHashMap.v_Base_dHashMap_dfromList Base_dString.v_Hashable_uString) Base_dList.C_Base_dList_dList_Nil)))

let rec v_Vuna_dCompiler_dElab_dTermination_dMeasure_dmemInt = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__17, dtb__18) -> (if (mc0 = dtb__17) then true else ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dmemInt mc0) dtb__18))
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposHasTbl = (fun f i tbl -> (match ((((Base_dHashMap.v_Base_dHashMap_dlookup Base_dString.v_Hashable_uString) Base_dString.v_Eq_uString) f) tbl) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__19) -> ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dmemInt i) dtb__19)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposAdd = (fun f i facts -> (if (((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposHas f) i) facts) then facts else (Base_dList.C_Base_dList_dList_Cons ({ Base_dPair.f_Base_dPair_dPair_first = f; Base_dPair.f_Base_dPair_dPair_second = i }, facts))))

let rec v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposSubset = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__20, dtb__21) -> (match dtb__20 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__22; Base_dPair.f_Base_dPair_dPair_second = dtb__23 } -> (if (((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposHas dtb__22) dtb__23) mc1) then ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposSubset dtb__21) mc1) else false)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposSetEq = (fun a b -> (if ((Base_dList.v_Base_dList_dlength a) = (Base_dList.v_Base_dList_dlength b)) then ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposSubset a) b) else false))

let rec v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposFilter = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__24, dtb__25) -> (match dtb__24 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__26; Base_dPair.f_Base_dPair_dPair_second = dtb__27 } -> (if (((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposHas dtb__26) dtb__27) mc1) then ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposFilter dtb__25) mc1) else (Base_dList.C_Base_dList_dList_Cons ({ Base_dPair.f_Base_dPair_dPair_first = dtb__26; Base_dPair.f_Base_dPair_dPair_second = dtb__27 }, ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposFilter dtb__25) mc1))))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposUnion = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__28, dtb__29) -> (match dtb__28 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__30; Base_dPair.f_Base_dPair_dPair_second = dtb__31 } -> ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposUnion dtb__29) (((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposAdd dtb__30) dtb__31) mc1))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> mc1
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposFilterTbl = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__32, dtb__33) -> (match dtb__32 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__34; Base_dPair.f_Base_dPair_dPair_second = dtb__35 } -> (if (((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposHasTbl dtb__34) dtb__35) mc1) then ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposFilterTbl dtb__33) mc1) else (Base_dList.C_Base_dList_dList_Cons ({ Base_dPair.f_Base_dPair_dPair_first = dtb__34; Base_dPair.f_Base_dPair_dPair_second = dtb__35 }, ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposFilterTbl dtb__33) mc1))))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposSubsetTbl = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__36, dtb__37) -> (match dtb__36 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__38; Base_dPair.f_Base_dPair_dPair_second = dtb__39 } -> (if (((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposHasTbl dtb__38) dtb__39) mc1) then ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposSubsetTbl dtb__37) mc1) else false)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposSetEqTbl = (fun a b -> (if (if ((Base_dList.v_Base_dList_dlength a) = (Base_dList.v_Base_dList_dlength b)) then ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposSubsetTbl a) (v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposTblOf b)) else false) then ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposSubsetTbl b) (v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposTblOf a)) else false))

let v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposUnionTbl = (fun facts fresh -> ((Base_dList.v_Base_dList_dappend fresh) ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposFilterTbl facts) (v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposTblOf fresh))))

let rec v_Vuna_dCompiler_dElab_dTermination_dMeasure_dfunDeclsOf = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__40, dtb__41) -> (match dtb__40 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DFun (dtb__42, dtb__43, dtb__44, dtb__45) -> (Base_dList.C_Base_dList_dList_Cons ({ Base_dPair.f_Base_dPair_dPair_first = dtb__42; Base_dPair.f_Base_dPair_dPair_second = { Base_dPair.f_Base_dPair_dPair_first = dtb__43; Base_dPair.f_Base_dPair_dPair_second = dtb__44 } }, (v_Vuna_dCompiler_dElab_dTermination_dMeasure_dfunDeclsOf dtb__41)))
  | _ -> (v_Vuna_dCompiler_dElab_dTermination_dMeasure_dfunDeclsOf dtb__41)
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dTermination_dMeasure_dlookupGroup = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__46, dtb__47) -> (match dtb__46 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__48; Base_dPair.f_Base_dPair_dPair_second = dtb__49 } -> (if (dtb__48 = mc0) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__49)) else ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dlookupGroup mc0) dtb__47))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dTermination_dMeasure_dreplaceGroup = (fun mc0 mc1 mc2 -> (match mc2 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__50, dtb__51) -> (match dtb__50 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__52; Base_dPair.f_Base_dPair_dPair_second = dtb__53 } -> (if (dtb__52 = mc0) then (Base_dList.C_Base_dList_dList_Cons ({ Base_dPair.f_Base_dPair_dPair_first = dtb__52; Base_dPair.f_Base_dPair_dPair_second = mc1 }, dtb__51)) else (Base_dList.C_Base_dList_dList_Cons ({ Base_dPair.f_Base_dPair_dPair_first = dtb__52; Base_dPair.f_Base_dPair_dPair_second = dtb__53 }, (((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dreplaceGroup mc0) mc1) dtb__51))))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dTermination_dMeasure_dgroupDefsGo = (fun mc0 mc1 mc2 -> (match mc2 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__54, dtb__55) -> (match dtb__54 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__56; Base_dPair.f_Base_dPair_dPair_second = dtb__57 } -> (match ((((Base_dHashMap.v_Base_dHashMap_dlookup Base_dString.v_Hashable_uString) Base_dString.v_Eq_uString) dtb__56) mc0) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__58) -> (((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dgroupDefsGo ((((Base_dHashMap.v_Base_dHashMap_dinsert Base_dString.v_Hashable_uString) dtb__56) (Base_dList.C_Base_dList_dList_Cons (dtb__57, dtb__58))) mc0)) mc1) dtb__55)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dgroupDefsGo ((((Base_dHashMap.v_Base_dHashMap_dinsert Base_dString.v_Hashable_uString) dtb__56) (Base_dList.C_Base_dList_dList_Cons (dtb__57, Base_dList.C_Base_dList_dList_Nil))) mc0)) (Base_dList.C_Base_dList_dList_Cons (dtb__56, mc1))) dtb__55)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> { Base_dPair.f_Base_dPair_dPair_first = mc0; Base_dPair.f_Base_dPair_dPair_second = mc1 }
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTermination_dMeasure_dgroupDefs = (fun decls -> ((fun stepped -> ((fun tbl -> ((fun order -> ((Base_dList.v_Base_dList_dmap (fun n -> { Base_dPair.f_Base_dPair_dPair_first = n; Base_dPair.f_Base_dPair_dPair_second = (match ((((Base_dHashMap.v_Base_dHashMap_dlookup Base_dString.v_Hashable_uString) Base_dString.v_Eq_uString) n) tbl) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__59) -> (Base_dList.v_Base_dList_dreverse dtb__59)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
) })) (Base_dList.v_Base_dList_dreverse order))) (Base_dPair.v_Base_dPair_dsecondOf stepped))) (Base_dPair.v_Base_dPair_dfirstOf stepped))) (((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dgroupDefsGo ((Base_dHashMap.v_Base_dHashMap_dfromList Base_dString.v_Hashable_uString) Base_dList.C_Base_dList_dList_Nil)) Base_dList.C_Base_dList_dList_Nil) (v_Vuna_dCompiler_dElab_dTermination_dMeasure_dfunDeclsOf decls))))

let v_Vuna_dCompiler_dElab_dTermination_dMeasure_ddefNames = (fun defs -> ((Base_dList.v_Base_dList_dmap Base_dPair.v_Base_dPair_dfirstOf) defs))

let rec v_Vuna_dCompiler_dElab_dTermination_dMeasure_dclausesOfDef = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__60, dtb__61) -> (match dtb__60 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__62; Base_dPair.f_Base_dPair_dPair_second = dtb__63 } -> (if (dtb__62 = mc0) then dtb__63 else ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dclausesOfDef mc0) dtb__61))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTermination_dMeasure_dclausesOfDefTbl = (fun name tbl -> (match ((((Base_dHashMap.v_Base_dHashMap_dlookup Base_dString.v_Hashable_uString) Base_dString.v_Eq_uString) name) tbl) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__64) -> dtb__64
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dTermination_dMeasure_ddefArity = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__65, dtb__66) -> ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dmaxInt (Base_dList.v_Base_dList_dlength (Base_dPair.v_Base_dPair_dfirstOf dtb__65))) (v_Vuna_dCompiler_dElab_dTermination_dMeasure_ddefArity dtb__66))
  | Base_dList.C_Base_dList_dList_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dTermination_dMeasure_dmaxArityOf = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__67, dtb__68) -> ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dmaxInt (v_Vuna_dCompiler_dElab_dTermination_dMeasure_ddefArity ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dclausesOfDefTbl dtb__67) mc1))) ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dmaxArityOf dtb__68) mc1))
  | Base_dList.C_Base_dList_dList_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTermination_dMeasure_dctorNameOf = (fun mc0 -> (match mc0 with
  | { Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dCtor_ctorName = dtb__69; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dCtor_ctorType = dtb__70; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dCtor_ctorArity = dtb__71; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dCtor_ctorSpan = dtb__72 } -> dtb__69
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dTermination_dMeasure_dctorNamesOf = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__73, dtb__74) -> (match dtb__73 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DData (dtb__75, dtb__76, dtb__77, dtb__78, dtb__79, dtb__80, dtb__81, dtb__82, dtb__83) -> ((Base_dList.v_Base_dList_dappend ((Base_dList.v_Base_dList_dmap v_Vuna_dCompiler_dElab_dTermination_dMeasure_dctorNameOf) dtb__78)) (v_Vuna_dCompiler_dElab_dTermination_dMeasure_dctorNamesOf dtb__74))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DRecord (dtb__84, dtb__85, dtb__86, dtb__87, dtb__88, dtb__89, dtb__90, dtb__91) -> (Base_dList.C_Base_dList_dList_Cons (dtb__84, (v_Vuna_dCompiler_dElab_dTermination_dMeasure_dctorNamesOf dtb__74)))
  | _ -> (v_Vuna_dCompiler_dElab_dTermination_dMeasure_dctorNamesOf dtb__74)
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dTermination_dMeasure_dpatSizeStrict = (fun mc0 mc1 mc2 mc3 -> (match mc0 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PRecord (dtb__92, dtb__93, dtb__94) -> (((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dfieldsSizeStrict dtb__93) mc1) mc2) 0) mc3)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PCon (dtb__95, dtb__96, dtb__97) -> (((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dpatsSizeStrict dtb__96) mc1) mc2) 0) mc3)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PWild (dtb__98) -> mc3
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PVar (dtb__99, dtb__100) -> (Base_dList.C_Base_dList_dList_Cons ({ Base_dPair.f_Base_dPair_dPair_first = dtb__99; Base_dPair.f_Base_dPair_dPair_second = { Base_dPair.f_Base_dPair_dPair_first = mc1; Base_dPair.f_Base_dPair_dPair_second = { Base_dPair.f_Base_dPair_dPair_first = (Base_dList.v_Base_dList_dlength mc2); Base_dPair.f_Base_dPair_dPair_second = mc2 } } }, mc3))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PAs (dtb__101, dtb__102, dtb__103) -> ((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dpatSizeStrict dtb__102) mc1) mc2) (Base_dList.C_Base_dList_dList_Cons ({ Base_dPair.f_Base_dPair_dPair_first = dtb__101; Base_dPair.f_Base_dPair_dPair_second = { Base_dPair.f_Base_dPair_dPair_first = mc1; Base_dPair.f_Base_dPair_dPair_second = { Base_dPair.f_Base_dPair_dPair_first = (Base_dList.v_Base_dList_dlength mc2); Base_dPair.f_Base_dPair_dPair_second = mc2 } } }, mc3)))
  | _ -> mc3
))
and v_Vuna_dCompiler_dElab_dTermination_dMeasure_dpatsSizeStrict = (fun mc0 mc1 mc2 mc3 mc4 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__104, dtb__105) -> (((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dpatsSizeStrict dtb__105) mc1) mc2) (mc3 + 1)) ((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dpatSizeStrict dtb__104) mc1) ((Base_dList.v_Base_dList_dappend mc2) (Base_dList.C_Base_dList_dList_Cons (mc3, Base_dList.C_Base_dList_dList_Nil)))) mc4))
  | Base_dList.C_Base_dList_dList_Nil -> mc4
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dElab_dTermination_dMeasure_dfieldsSizeStrict = (fun mc0 mc1 mc2 mc3 mc4 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__106, dtb__107) -> (match dtb__106 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__108; Base_dPair.f_Base_dPair_dPair_second = dtb__109 } -> (((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dfieldsSizeStrict dtb__107) mc1) mc2) (mc3 + 1)) ((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dpatSizeStrict dtb__109) mc1) ((Base_dList.v_Base_dList_dappend mc2) (Base_dList.C_Base_dList_dList_Cons (mc3, Base_dList.C_Base_dList_dList_Nil)))) mc4))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> mc4
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dTermination_dMeasure_dstrSizeEntriesGo = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__110, dtb__111) -> ((Base_dList.v_Base_dList_dappend ((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dpatSizeStrict dtb__110) mc1) Base_dList.C_Base_dList_dList_Nil) Base_dList.C_Base_dList_dList_Nil)) ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dstrSizeEntriesGo dtb__111) (mc1 + 1)))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTermination_dMeasure_dstrSizeEntries = (fun pats -> ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dstrSizeEntriesGo pats) 0))

let rec v_Vuna_dCompiler_dElab_dTermination_dMeasure_dsizeOfVarStrict = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__112, dtb__113) -> (match dtb__112 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__114; Base_dPair.f_Base_dPair_dPair_second = dtb__115 } -> (if (dtb__114 = mc0) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__115)) else ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dsizeOfVarStrict mc0) dtb__113))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTermination_dMeasure_dextendSizesStrict = (fun mc0 mc1 mc2 -> (match mc1 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__116, dtb__117) -> (match ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dsizeOfVarStrict dtb__116) mc0) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__118) -> ((fun nd_uscrut7 -> (match nd_uscrut7 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__119; Base_dPair.f_Base_dPair_dPair_second = dtb__120 } -> (match dtb__120 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__121; Base_dPair.f_Base_dPair_dPair_second = dtb__122 } -> (match mc2 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PCon (dtb__123, dtb__124, dtb__125) -> ((Base_dList.v_Base_dList_dappend mc0) (((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dpatsSizeStrict dtb__124) dtb__119) dtb__122) 0) Base_dList.C_Base_dList_dList_Nil))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PRecord (dtb__126, dtb__127, dtb__128) -> ((Base_dList.v_Base_dList_dappend mc0) (((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dfieldsSizeStrict dtb__127) dtb__119) dtb__122) 0) Base_dList.C_Base_dList_dList_Nil))
  | _ -> mc0
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) dtb__118)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> mc0
  | _ -> failwith "DT: impossible branch"
)
  | _ -> mc0
))

let v_Vuna_dCompiler_dElab_dTermination_dMeasure_dopBaseName = (fun name -> (Base_dPair.v_Base_dPair_dsecondOf (Vuna_dCompiler_dSource.v_Vuna_dCompiler_dSource_dsplitLastDot (Vuna_dCompiler_dSource.v_Vuna_dCompiler_dSource_dsplitOnDot name))))

let v_Vuna_dCompiler_dElab_dTermination_dMeasure_dvarOfExpr = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__129, dtb__130) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__129))
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
))

let v_Vuna_dCompiler_dElab_dTermination_dMeasure_dguardLE = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__131, dtb__132) -> (match dtb__132 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__133, dtb__134) -> (match dtb__134 with
  | Base_dList.C_Base_dList_dList_Nil -> (match dtb__133 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EInt (dtb__135, dtb__136) -> (if (dtb__135 = 0) then (v_Vuna_dCompiler_dElab_dTermination_dMeasure_dvarOfExpr dtb__131) else Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
))

let v_Vuna_dCompiler_dElab_dTermination_dMeasure_dguardGE = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__137, dtb__138) -> (match dtb__138 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__139, dtb__140) -> (match dtb__140 with
  | Base_dList.C_Base_dList_dList_Nil -> (match dtb__137 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EInt (dtb__141, dtb__142) -> (if (dtb__141 = 0) then (v_Vuna_dCompiler_dElab_dTermination_dMeasure_dvarOfExpr dtb__139) else Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
))

let v_Vuna_dCompiler_dElab_dTermination_dMeasure_dguardLT = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__143, dtb__144) -> (match dtb__144 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__145, dtb__146) -> (match dtb__146 with
  | Base_dList.C_Base_dList_dList_Nil -> (match dtb__145 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EInt (dtb__147, dtb__148) -> (if (dtb__147 = 1) then (v_Vuna_dCompiler_dElab_dTermination_dMeasure_dvarOfExpr dtb__143) else Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
))

let v_Vuna_dCompiler_dElab_dTermination_dMeasure_dguardPosVar = (fun e -> ((fun nd_uscrut1 -> (match nd_uscrut1 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp (dtb__149, dtb__150, dtb__151) -> (match dtb__149 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__152, dtb__153) -> (if ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dopBaseName dtb__152) = "le") then (v_Vuna_dCompiler_dElab_dTermination_dMeasure_dguardLE dtb__150) else (if ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dopBaseName dtb__152) = "ge") then (v_Vuna_dCompiler_dElab_dTermination_dMeasure_dguardGE dtb__150) else (if ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dopBaseName dtb__152) = "lt") then (v_Vuna_dCompiler_dElab_dTermination_dMeasure_dguardLT dtb__150) else (if ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dopBaseName dtb__152) = "<=") then (v_Vuna_dCompiler_dElab_dTermination_dMeasure_dguardLE dtb__150) else (if ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dopBaseName dtb__152) = ">=") then (v_Vuna_dCompiler_dElab_dTermination_dMeasure_dguardGE dtb__150) else (if ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dopBaseName dtb__152) = "<") then (v_Vuna_dCompiler_dElab_dTermination_dMeasure_dguardLT dtb__150) else Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing))))))
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)) e))

let v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposMarkPos = (fun f i st -> { Base_dPair.f_Base_dPair_dPair_first = (Base_dList.C_Base_dList_dList_Cons ({ Base_dPair.f_Base_dPair_dPair_first = f; Base_dPair.f_Base_dPair_dPair_second = i }, (Base_dPair.v_Base_dPair_dfirstOf st))); Base_dPair.f_Base_dPair_dPair_second = (Base_dPair.v_Base_dPair_dsecondOf st) })

let v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposMarkNeg = (fun f i st -> { Base_dPair.f_Base_dPair_dPair_first = (Base_dPair.v_Base_dPair_dfirstOf st); Base_dPair.f_Base_dPair_dPair_second = (Base_dList.C_Base_dList_dList_Cons ({ Base_dPair.f_Base_dPair_dPair_first = f; Base_dPair.f_Base_dPair_dPair_second = i }, (Base_dPair.v_Base_dPair_dsecondOf st))) })

let rec v_Vuna_dCompiler_dElab_dTermination_dMeasure_ddedupInts = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__154, dtb__155) -> (if ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dmemInt dtb__154) dtb__155) then (v_Vuna_dCompiler_dElab_dTermination_dMeasure_ddedupInts dtb__155) else (Base_dList.C_Base_dList_dList_Cons (dtb__154, (v_Vuna_dCompiler_dElab_dTermination_dMeasure_ddedupInts dtb__155))))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposEntryPairs = (fun mc0 -> (match mc0 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__156; Base_dPair.f_Base_dPair_dPair_second = dtb__157 } -> ((Base_dList.v_Base_dList_dmap (fun i -> { Base_dPair.f_Base_dPair_dPair_first = dtb__156; Base_dPair.f_Base_dPair_dPair_second = i })) (v_Vuna_dCompiler_dElab_dTermination_dMeasure_ddedupInts dtb__157))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposTblPairs = (fun tbl -> ((Base_dList.v_Base_dList_dconcatMap v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposEntryPairs) ((Base_dHashMap.v_Base_dHashMap_dtoList Base_dString.v_Eq_uString) tbl)))

let v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposNormalize = (fun xs -> (v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposTblPairs (v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposTblOf xs)))

let rec v_Vuna_dCompiler_dElab_dTermination_dMeasure_dpathInPats = (fun mc0 mc1 mc2 mc3 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__158, dtb__159) -> (match (((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dpathInPat mc0) dtb__158) ((Base_dList.v_Base_dList_dappend mc2) (Base_dList.C_Base_dList_dList_Cons (mc3, Base_dList.C_Base_dList_dList_Nil)))) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__160) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__160))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dpathInPats mc0) dtb__159) mc2) (mc3 + 1))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dElab_dTermination_dMeasure_dpathInFields = (fun mc0 mc1 mc2 mc3 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__161, dtb__162) -> (match dtb__161 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__163; Base_dPair.f_Base_dPair_dPair_second = dtb__164 } -> (match (((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dpathInPat mc0) dtb__164) ((Base_dList.v_Base_dList_dappend mc2) (Base_dList.C_Base_dList_dList_Cons (mc3, Base_dList.C_Base_dList_dList_Nil)))) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__165) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__165))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dpathInFields mc0) dtb__162) mc2) (mc3 + 1))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dElab_dTermination_dMeasure_dpathInPat = (fun mc0 mc1 mc2 -> (match mc1 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PRecord (dtb__166, dtb__167, dtb__168) -> ((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dpathInFields mc0) dtb__167) mc2) 0)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PCon (dtb__169, dtb__170, dtb__171) -> ((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dpathInPats mc0) dtb__170) mc2) 0)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PWild (dtb__172) -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PVar (dtb__173, dtb__174) -> (if (dtb__173 = mc0) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (mc2)) else Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
))

let v_Vuna_dCompiler_dElab_dTermination_dMeasure_dprojectionOfDef = (fun d -> ((fun nd_uscrut1 -> (match nd_uscrut1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__175, dtb__176) -> (match dtb__176 with
  | Base_dList.C_Base_dList_dList_Nil -> ((fun nd_uscrut6 -> (match nd_uscrut6 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__177, dtb__178) -> (match dtb__178 with
  | Base_dList.C_Base_dList_dList_Nil -> (match (Base_dPair.v_Base_dPair_dsecondOf dtb__175) with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__179, dtb__180) -> (match (((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dpathInPat dtb__179) dtb__177) Base_dList.C_Base_dList_dList_Nil) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__181) -> (if (v_Vuna_dCompiler_dElab_dTermination_dMeasure_dnotEmpty dtb__181) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Base_dPair.f_Base_dPair_dPair_first = (Base_dPair.v_Base_dPair_dfirstOf d); Base_dPair.f_Base_dPair_dPair_second = dtb__181 })) else Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)) (Base_dPair.v_Base_dPair_dfirstOf dtb__175))
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)) (Base_dPair.v_Base_dPair_dsecondOf d)))

let rec v_Vuna_dCompiler_dElab_dTermination_dMeasure_dprojectionsOf = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__182, dtb__183) -> (match (v_Vuna_dCompiler_dElab_dTermination_dMeasure_dprojectionOfDef dtb__182) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__184) -> (Base_dList.C_Base_dList_dList_Cons (dtb__184, (v_Vuna_dCompiler_dElab_dTermination_dMeasure_dprojectionsOf dtb__183)))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (v_Vuna_dCompiler_dElab_dTermination_dMeasure_dprojectionsOf dtb__183)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dTermination_dMeasure_dprojHas = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__185, dtb__186) -> (match dtb__185 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__187; Base_dPair.f_Base_dPair_dPair_second = dtb__188 } -> (if (mc0 = dtb__187) then true else ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dprojHas mc0) dtb__186))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dTermination_dMeasure_dfindWrapField = (fun mc0 mc1 mc2 mc3 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__189, dtb__190) -> (match dtb__189 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__191, dtb__192) -> (match ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dsizeOfVarStrict dtb__191) mc2) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__193) -> ((fun nd_uscrut11 -> (match nd_uscrut11 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__194; Base_dPair.f_Base_dPair_dPair_second = dtb__195 } -> (match dtb__195 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__196; Base_dPair.f_Base_dPair_dPair_second = dtb__197 } -> (if (dtb__194 = mc0) then ((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dwrapCheck mc0) dtb__190) mc2) mc3) dtb__196) dtb__197) else ((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dfindWrapField mc0) dtb__190) mc2) (mc3 + 1)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) dtb__193)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dfindWrapField mc0) dtb__190) mc2) (mc3 + 1))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> ((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dfindWrapField mc0) dtb__190) mc2) (mc3 + 1))
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dElab_dTermination_dMeasure_dwrapCheck = (fun p rest sizes k depth path -> (if (depth > 0) then (match path with
  | Base_dList.C_Base_dList_dList_Cons (dtb__198, dtb__199) -> (if (dtb__198 = k) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((k + 2))) else ((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dfindWrapField p) rest) sizes) (k + 1)))
  | Base_dList.C_Base_dList_dList_Nil -> ((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dfindWrapField p) rest) sizes) (k + 1))
  | _ -> failwith "DT: impossible branch"
) else ((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dfindWrapField p) rest) sizes) (k + 1))))

let v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposVarIn = (fun x p caller facts region -> (if ((Base_dList.v_Base_dList_dmemName x) region) then true else (((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposHasTbl caller) p) facts)))

let v_Vuna_dCompiler_dElab_dTermination_dMeasure_disSubOpName = (fun op -> (if (op = "-") then true else (op = "Base.Num.sub")))

let v_Vuna_dCompiler_dElab_dTermination_dMeasure_darithMinusBase = (fun mc0 mc1 mc2 mc3 mc4 mc5 mc6 -> (match mc1 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__200, dtb__201) -> (match ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dsizeOfVarStrict dtb__200) mc3) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__202) -> ((fun nd_uscrut11 -> (match nd_uscrut11 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__203; Base_dPair.f_Base_dPair_dPair_second = dtb__204 } -> (match dtb__204 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__205; Base_dPair.f_Base_dPair_dPair_second = dtb__206 } -> (if (dtb__203 = mc0) then (if (dtb__205 = 0) then (if (((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposVarIn dtb__200) mc0) mc4) mc5) mc6) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (4)) else Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing) else Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing) else Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) dtb__202)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
))

let v_Vuna_dCompiler_dElab_dTermination_dMeasure_darithMinus = (fun mc0 mc1 mc2 mc3 mc4 mc5 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__207, dtb__208) -> (match dtb__208 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__209, dtb__210) -> (match dtb__209 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EInt (dtb__211, dtb__212) -> (match dtb__210 with
  | Base_dList.C_Base_dList_dList_Nil -> (if (dtb__211 > 0) then (((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_darithMinusBase mc0) dtb__207) dtb__211) mc2) mc3) mc4) mc5) else Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
))

let v_Vuna_dCompiler_dElab_dTermination_dMeasure_darithRel = (fun mc0 mc1 mc2 mc3 mc4 mc5 -> (match mc1 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp (dtb__213, dtb__214, dtb__215) -> (match dtb__213 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__216, dtb__217) -> (if (v_Vuna_dCompiler_dElab_dTermination_dMeasure_disSubOpName dtb__216) then ((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_darithMinus mc0) dtb__214) mc2) mc3) mc4) mc5) else Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
))

let v_Vuna_dCompiler_dElab_dTermination_dMeasure_dprojRel = (fun mc0 mc1 mc2 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__218, dtb__219) -> (match dtb__219 with
  | Base_dList.C_Base_dList_dList_Nil -> (match dtb__218 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__220, dtb__221) -> (match ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dsizeOfVarStrict dtb__220) mc2) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__222) -> ((fun nd_uscrut11 -> (match nd_uscrut11 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__223; Base_dPair.f_Base_dPair_dPair_second = dtb__224 } -> (match dtb__224 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__225; Base_dPair.f_Base_dPair_dPair_second = dtb__226 } -> (if (dtb__223 = mc0) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (1)) else Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) dtb__222)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
))

let v_Vuna_dCompiler_dElab_dTermination_dMeasure_drelOfArg = (fun mc0 mc1 mc2 mc3 mc4 mc5 mc6 mc7 -> (match mc1 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp (dtb__227, dtb__228, dtb__229) -> (match dtb__227 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__230, dtb__231) -> (if ((Base_dList.v_Base_dList_dmemName dtb__230) mc3) then ((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dfindWrapField mc0) dtb__228) mc2) 0) else (if ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dprojHas dtb__230) mc4) then (((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dprojRel mc0) dtb__228) mc2) else ((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_darithRel mc0) mc1) mc2) mc5) mc6) mc7)))
  | _ -> ((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_darithRel mc0) mc1) mc2) mc5) mc6) mc7)
)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__232, dtb__233) -> (match ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dsizeOfVarStrict dtb__232) mc2) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__234) -> ((fun nd_uscrut12 -> (match nd_uscrut12 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__235; Base_dPair.f_Base_dPair_dPair_second = dtb__236 } -> (match dtb__236 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__237; Base_dPair.f_Base_dPair_dPair_second = dtb__238 } -> (if (dtb__235 = mc0) then (if (dtb__237 > 0) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (1)) else (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (0))) else Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) dtb__234)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
))

let v_Vuna_dCompiler_dElab_dTermination_dMeasure_dmarkInvalid = (fun acc -> { Base_dPair.f_Base_dPair_dPair_first = false; Base_dPair.f_Base_dPair_dPair_second = (Base_dPair.v_Base_dPair_dsecondOf acc) })

let v_Vuna_dCompiler_dElab_dTermination_dMeasure_daddEdgeMode = (fun caller callee m sp acc -> { Base_dPair.f_Base_dPair_dPair_first = (Base_dPair.v_Base_dPair_dfirstOf acc); Base_dPair.f_Base_dPair_dPair_second = (Base_dList.C_Base_dList_dList_Cons ({ Base_dPair.f_Base_dPair_dPair_first = { Base_dPair.f_Base_dPair_dPair_first = { Base_dPair.f_Base_dPair_dPair_first = caller; Base_dPair.f_Base_dPair_dPair_second = callee }; Base_dPair.f_Base_dPair_dPair_second = m }; Base_dPair.f_Base_dPair_dPair_second = sp }, (Base_dPair.v_Base_dPair_dsecondOf acc))) })

let v_Vuna_dCompiler_dElab_dTermination_dMeasure_dgroupHead = (fun mc0 mc1 -> (match mc1 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__239, dtb__240) -> (if ((Base_dList.v_Base_dList_dmemName dtb__239) mc0) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__239)) else Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
))

let rec v_Vuna_dCompiler_dElab_dTermination_dMeasure_dnthExpr = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__241, dtb__242) -> (if (mc1 <= 0) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__241)) else ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dnthExpr dtb__242) (mc1 - 1)))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTermination_dMeasure_dargPositive = (fun args i sizes caller facts region -> (match ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dnthExpr args) i) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> false
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__243) -> (match dtb__243 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EInt (dtb__244, dtb__245) -> (dtb__244 > 0)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__246, dtb__247) -> (if ((Base_dList.v_Base_dList_dmemName dtb__246) region) then true else (match ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dsizeOfVarStrict dtb__246) sizes) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__248) -> ((fun nd_uscrut12 -> (match nd_uscrut12 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__249; Base_dPair.f_Base_dPair_dPair_second = dtb__250 } -> (match dtb__250 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__251; Base_dPair.f_Base_dPair_dPair_second = dtb__252 } -> (if (dtb__251 = 0) then (((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposHasTbl caller) dtb__249) facts) else false)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) dtb__248)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
))
  | _ -> false
)
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalkCalleeGo = (fun namesTbl caller sizes facts region g remaining args st -> (if (remaining <= 0) then st else ((fun i -> ((fun st1 -> (((((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalkCalleeGo namesTbl) caller) sizes) facts) region) g) (remaining - 1)) args) st1)) (if ((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dargPositive args) i) sizes) caller) facts) region) then (((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposMarkPos g) i) st) else (((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposMarkNeg g) i) st)))) ((Base_dList.v_Base_dList_dlength args) - remaining))))

let v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalkCallee = (fun namesTbl caller sizes facts region g i args st -> (((((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalkCalleeGo namesTbl) caller) sizes) facts) region) g) ((Base_dList.v_Base_dList_dlength args) - i)) args) st))

let rec v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalkArgs = (fun mc0 mc1 mc2 mc3 mc4 mc5 mc6 -> (match mc5 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__253, dtb__254) -> (((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalkArgs mc0) mc1) mc2) mc3) mc4) dtb__254) (((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalk mc0) mc1) mc2) mc3) mc4) dtb__253) mc6))
  | Base_dList.C_Base_dList_dList_Nil -> mc6
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalkFields = (fun mc0 mc1 mc2 mc3 mc4 mc5 mc6 -> (match mc5 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__255, dtb__256) -> (match dtb__255 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__257; Base_dPair.f_Base_dPair_dPair_second = dtb__258 } -> (((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalkFields mc0) mc1) mc2) mc3) mc4) dtb__256) (((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalk mc0) mc1) mc2) mc3) mc4) dtb__258) mc6))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> mc6
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalkAlts = (fun mc0 mc1 mc2 mc3 mc4 mc5 mc6 -> (match mc5 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__259, dtb__260) -> (match dtb__259 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__261; Base_dPair.f_Base_dPair_dPair_second = dtb__262 } -> (((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalkAlts mc0) mc1) mc2) mc3) mc4) dtb__260) (((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalk mc0) mc1) mc2) mc3) mc4) dtb__262) mc6))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> mc6
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalkBinds = (fun mc0 mc1 mc2 mc3 mc4 mc5 mc6 -> (match mc5 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__263, dtb__264) -> (match dtb__263 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__265; Base_dPair.f_Base_dPair_dPair_second = dtb__266 } -> (((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalkBinds mc0) mc1) mc2) mc3) mc4) dtb__264) (((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalk mc0) mc1) mc2) mc3) mc4) dtb__266) mc6))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> mc6
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalkStmts = (fun mc0 mc1 mc2 mc3 mc4 mc5 mc6 -> (match mc5 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__267, dtb__268) -> (match dtb__267 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDoStmt_DBind (dtb__269, dtb__270, dtb__271) -> (((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalkStmts mc0) mc1) mc2) mc3) mc4) dtb__268) (((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalk mc0) mc1) mc2) mc3) mc4) dtb__270) mc6))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDoStmt_DExpr (dtb__272, dtb__273) -> (((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalkStmts mc0) mc1) mc2) mc3) mc4) dtb__268) (((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalk mc0) mc1) mc2) mc3) mc4) dtb__272) mc6))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> mc6
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalk = (fun mc0 mc1 mc2 mc3 mc4 mc5 mc6 -> (match mc5 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__274, dtb__275) -> mc6
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EAnn (dtb__276, dtb__277, dtb__278) -> (((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalk mc0) mc1) mc2) mc3) mc4) dtb__277) (((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalk mc0) mc1) mc2) mc3) mc4) dtb__276) mc6))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EDo (dtb__279, dtb__280) -> (((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalkStmts mc0) mc1) mc2) mc3) mc4) dtb__279) mc6)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ERecUpdate (dtb__281, dtb__282, dtb__283) -> (((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalkFields mc0) mc1) mc2) mc3) mc4) dtb__282) (((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalk mc0) mc1) mc2) mc3) mc4) dtb__281) mc6))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ERecord (dtb__284, dtb__285, dtb__286) -> (((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalkFields mc0) mc1) mc2) mc3) mc4) dtb__285) mc6)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EField (dtb__287, dtb__288, dtb__289) -> (((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalk mc0) mc1) mc2) mc3) mc4) dtb__287) mc6)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EPi (dtb__290, dtb__291, dtb__292, dtb__293, dtb__294, dtb__295) -> (((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalk mc0) mc1) mc2) mc3) mc4) dtb__294) (((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalk mc0) mc1) mc2) mc3) mc4) dtb__293) mc6))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ELet (dtb__296, dtb__297, dtb__298, dtb__299) -> (((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalk mc0) mc1) mc2) mc3) mc4) dtb__297) (((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalkBinds mc0) mc1) mc2) mc3) mc4) dtb__296) mc6))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ELam (dtb__300, dtb__301, dtb__302) -> (((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalk mc0) mc1) mc2) mc3) mc4) dtb__301) mc6)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ECase (dtb__303, dtb__304, dtb__305) -> (((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalkAlts mc0) mc1) mc2) mc3) mc4) dtb__304) (((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalk mc0) mc1) mc2) mc3) mc4) dtb__303) mc6))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EIf (dtb__306, dtb__307, dtb__308, dtb__309) -> (match (v_Vuna_dCompiler_dElab_dTermination_dMeasure_dguardPosVar dtb__306) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__310) -> ((fun st1 -> ((fun st2 -> (((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalk mc0) mc1) mc2) mc3) (Base_dList.C_Base_dList_dList_Cons (dtb__310, mc4))) dtb__308) st2)) (((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalk mc0) mc1) mc2) mc3) mc4) dtb__307) st1))) (((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalk mc0) mc1) mc2) mc3) mc4) dtb__306) mc6))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((fun st1 -> ((fun st2 -> (((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalk mc0) mc1) mc2) mc3) mc4) dtb__308) st2)) (((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalk mc0) mc1) mc2) mc3) mc4) dtb__307) st1))) (((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalk mc0) mc1) mc2) mc3) mc4) dtb__306) mc6))
  | _ -> failwith "DT: impossible branch"
)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp (dtb__311, dtb__312, dtb__313) -> (match dtb__311 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__314, dtb__315) -> (if ((((Base_dHashMap.v_Base_dHashMap_dmember Base_dString.v_Hashable_uString) Base_dString.v_Eq_uString) dtb__314) mc0) then (((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalkArgs mc0) mc1) mc2) mc3) mc4) dtb__312) (((((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalkCallee mc0) mc1) mc2) mc3) mc4) dtb__314) 0) dtb__312) mc6)) else (((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalkArgs mc0) mc1) mc2) mc3) mc4) dtb__312) (((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalk mc0) mc1) mc2) mc3) mc4) dtb__311) mc6)))
  | _ -> (((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalkArgs mc0) mc1) mc2) mc3) mc4) dtb__312) (((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalk mc0) mc1) mc2) mc3) mc4) dtb__311) mc6))
)
  | _ -> mc6
))

let rec v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposScanClauses = (fun mc0 mc1 mc2 mc3 mc4 mc5 -> (match mc4 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__316, dtb__317) -> ((fun sizes -> ((fun st2 -> ((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposScanClauses mc0) mc1) mc2) mc3) dtb__317) st2)) (((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalk mc0) mc3) sizes) mc2) Base_dList.C_Base_dList_dList_Nil) (Base_dPair.v_Base_dPair_dsecondOf dtb__316)) mc5))) (v_Vuna_dCompiler_dElab_dTermination_dMeasure_dstrSizeEntries (Base_dPair.v_Base_dPair_dfirstOf dtb__316)))
  | Base_dList.C_Base_dList_dList_Nil -> mc5
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposScanDefs = (fun mc0 mc1 mc2 mc3 mc4 -> (match mc3 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__318, dtb__319) -> (((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposScanDefs mc0) mc1) mc2) dtb__319) ((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposScanClauses mc0) mc1) mc2) (Base_dPair.v_Base_dPair_dfirstOf dtb__318)) (Base_dPair.v_Base_dPair_dsecondOf dtb__318)) mc4))
  | Base_dList.C_Base_dList_dList_Nil -> mc4
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposScanNamesGo = (fun mc0 mc1 mc2 mc3 mc4 -> (match mc3 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__320, dtb__321) -> (((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposScanNamesGo mc0) mc1) mc2) dtb__321) ((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposScanClauses mc0) Base_dList.C_Base_dList_dList_Nil) mc2) dtb__320) ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dclausesOfDefTbl dtb__320) mc1)) mc4))
  | Base_dList.C_Base_dList_dList_Nil -> mc4
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposScanNames = (fun namesTbl defTbl factsTbl work st -> ((fun scanned -> { Base_dPair.f_Base_dPair_dPair_first = (v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposNormalize (Base_dPair.v_Base_dPair_dfirstOf scanned)); Base_dPair.f_Base_dPair_dPair_second = (v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposNormalize (Base_dPair.v_Base_dPair_dsecondOf scanned)) }) (((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposScanNamesGo namesTbl) defTbl) factsTbl) work) st)))

let rec v_Vuna_dCompiler_dElab_dTermination_dMeasure_dcomputePosFacts = (fun defs fuel facts -> (if (fuel <= 0) then facts else (((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dcomputePosFactsStep defs) fuel) facts)))
and v_Vuna_dCompiler_dElab_dTermination_dMeasure_dcomputePosFactsStep = (fun defs fuel facts -> ((fun namesTbl -> ((fun scanned -> ((fun scan -> ((fun fresh -> ((fun merged -> (if ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposSetEqTbl facts) merged) then merged else (((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dcomputePosFacts defs) (fuel - 1)) merged))) ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposUnionTbl facts) fresh))) ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposFilterTbl (Base_dPair.v_Base_dPair_dfirstOf scan)) (v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposTblOf (Base_dPair.v_Base_dPair_dsecondOf scan))))) { Base_dPair.f_Base_dPair_dPair_first = (v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposNormalize (Base_dPair.v_Base_dPair_dfirstOf scanned)); Base_dPair.f_Base_dPair_dPair_second = (v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposNormalize (Base_dPair.v_Base_dPair_dsecondOf scanned)) })) (((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposScanDefs namesTbl) defs) (v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposTblOf facts)) defs) { Base_dPair.f_Base_dPair_dPair_first = Base_dList.C_Base_dList_dList_Nil; Base_dPair.f_Base_dPair_dPair_second = Base_dList.C_Base_dList_dList_Nil }))) (Base_dHashMap.v_Base_dHashMap_dofNames (v_Vuna_dCompiler_dElab_dTermination_dMeasure_ddefNames defs))))

let v_Vuna_dCompiler_dElab_dTermination_dMeasure_dargRel = (fun p args sizes ctors projs caller facts region -> (match ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dnthExpr args) p) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__322) -> ((((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_drelOfArg p) dtb__322) sizes) ctors) projs) caller) facts) region)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTermination_dMeasure_ddotBase = (fun n -> (Base_dPair.v_Base_dPair_dsecondOf (Vuna_dCompiler_dSource.v_Vuna_dCompiler_dSource_dsplitLastDot (Vuna_dCompiler_dSource.v_Vuna_dCompiler_dSource_dsplitOnDot n))))

let v_Vuna_dCompiler_dElab_dTermination_dMeasure_disMapLike = (fun n -> (if (if (if (if ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_ddotBase n) = "map") then true else ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_ddotBase n) = "traverse")) then true else ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_ddotBase n) = "concatMap")) then true else ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_ddotBase n) = "mapMaybe")) then true else ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_ddotBase n) = "filter")))

let v_Vuna_dCompiler_dElab_dTermination_dMeasure_dextendElemSizes = (fun mc0 mc1 mc2 -> (match mc1 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__323, dtb__324) -> (match ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dsizeOfVarStrict dtb__323) mc0) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__325) -> ((fun nd_uscrut7 -> (match nd_uscrut7 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__326; Base_dPair.f_Base_dPair_dPair_second = dtb__327 } -> (match dtb__327 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__328; Base_dPair.f_Base_dPair_dPair_second = dtb__329 } -> (Base_dList.C_Base_dList_dList_Cons ({ Base_dPair.f_Base_dPair_dPair_first = mc2; Base_dPair.f_Base_dPair_dPair_second = { Base_dPair.f_Base_dPair_dPair_first = dtb__326; Base_dPair.f_Base_dPair_dPair_second = { Base_dPair.f_Base_dPair_dPair_first = (dtb__328 + 1); Base_dPair.f_Base_dPair_dPair_second = ((Base_dList.v_Base_dList_dappend dtb__329) (Base_dList.C_Base_dList_dList_Cons (0, Base_dList.C_Base_dList_dList_Nil))) } } }, mc0))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) dtb__325)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> mc0
  | _ -> failwith "DT: impossible branch"
)
  | _ -> mc0
))

let rec v_Vuna_dCompiler_dElab_dTermination_dMeasure_dedgeStrictGo = (fun mc0 mc1 mc2 mc3 mc4 -> (match mc2 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__330, dtb__331) -> (match dtb__330 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__332; Base_dPair.f_Base_dPair_dPair_second = dtb__333 } -> (match dtb__332 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__334; Base_dPair.f_Base_dPair_dPair_second = dtb__335 } -> (match dtb__334 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__336; Base_dPair.f_Base_dPair_dPair_second = dtb__337 } -> (if (dtb__336 = mc0) then (if (dtb__337 = mc1) then (((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dedgeStrictGo mc0) mc1) dtb__331) true) (if (dtb__335 = 0) then false else mc4)) else (((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dedgeStrictGo mc0) mc1) dtb__331) mc3) mc4)) else (((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dedgeStrictGo mc0) mc1) dtb__331) mc3) mc4))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> (if mc3 then mc4 else false)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTermination_dMeasure_dedgeStrict = (fun f g edges -> (((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dedgeStrictGo f) g) edges) false) true))

let rec v_Vuna_dCompiler_dElab_dTermination_dMeasure_dedgeTargetsGo = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__338, dtb__339) -> (match dtb__338 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__340; Base_dPair.f_Base_dPair_dPair_second = dtb__341 } -> (match dtb__340 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__342; Base_dPair.f_Base_dPair_dPair_second = dtb__343 } -> (match dtb__342 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__344; Base_dPair.f_Base_dPair_dPair_second = dtb__345 } -> (if (dtb__344 = mc0) then (Base_dList.C_Base_dList_dList_Cons (dtb__345, ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dedgeTargetsGo mc0) dtb__339))) else ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dedgeTargetsGo mc0) dtb__339))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTermination_dMeasure_dedgeTargets = (fun f edges -> (v_Vuna_dCompiler_dElab_dTermination_dMeasure_ddedup ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dedgeTargetsGo f) edges)))

let rec v_Vuna_dCompiler_dElab_dTermination_dMeasure_dweakAdjGo = (fun mc0 mc1 mc2 mc3 -> (match mc3 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__346, dtb__347) -> (if (((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dedgeStrict mc2) dtb__346) mc1) then ((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dweakAdjGo mc0) mc1) mc2) dtb__347) else (Base_dList.C_Base_dList_dList_Cons (dtb__346, ((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dweakAdjGo mc0) mc1) mc2) dtb__347))))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTermination_dMeasure_dweakAdj = (fun comp edges f -> ((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dweakAdjGo comp) edges) f) ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dedgeTargets f) edges)))

let rec v_Vuna_dCompiler_dElab_dTermination_dMeasure_dweakReachFuel = (fun fuel comp edges start frontier visited -> (if (fuel <= 0) then false else (match frontier with
  | Base_dList.C_Base_dList_dList_Nil -> false
  | Base_dList.C_Base_dList_dList_Cons (dtb__348, dtb__349) -> (if (dtb__348 = start) then true else (if ((Base_dList.v_Base_dList_dmemName dtb__348) visited) then ((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dweakReachFuel (fuel - 1)) comp) edges) start) dtb__349) visited) else ((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dweakReachFuel (fuel - 1)) comp) edges) start) ((Base_dList.v_Base_dList_dappend dtb__349) (((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dweakAdj comp) edges) dtb__348))) (Base_dList.C_Base_dList_dList_Cons (dtb__348, visited)))))
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dElab_dTermination_dMeasure_dweakReach = (fun comp edges start frontier visited -> ((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dweakReachFuel 100000) comp) edges) start) frontier) visited))

let rec v_Vuna_dCompiler_dElab_dTermination_dMeasure_dhasWeakCycleGo = (fun mc0 mc1 mc2 -> (match mc2 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__350, dtb__351) -> (if (((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dweakReach mc0) mc1) dtb__350) (((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dweakAdj mc0) mc1) dtb__350)) (Base_dList.C_Base_dList_dList_Cons (dtb__350, Base_dList.C_Base_dList_dList_Nil))) then true else (((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dhasWeakCycleGo mc0) mc1) dtb__351))
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTermination_dMeasure_dhasWeakCycle = (fun comp edges -> (((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dhasWeakCycleGo comp) edges) comp))

let v_Vuna_dCompiler_dElab_dTermination_dMeasure_disDescent = (fun m -> (m <> 0))

let rec v_Vuna_dCompiler_dElab_dTermination_dMeasure_dfilterModes = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__352, dtb__353) -> (if (v_Vuna_dCompiler_dElab_dTermination_dMeasure_disDescent dtb__352) then (Base_dList.C_Base_dList_dList_Cons (dtb__352, (v_Vuna_dCompiler_dElab_dTermination_dMeasure_dfilterModes dtb__353))) else (v_Vuna_dCompiler_dElab_dTermination_dMeasure_dfilterModes dtb__353))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))
