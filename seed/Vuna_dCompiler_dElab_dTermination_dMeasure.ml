open Vuna_runtime
let v_Vuna_dCompiler_dElab_dTermination_dMeasure_dmaxInt = (fun a b -> (if (a >= b) then a else b))

let v_Vuna_dCompiler_dElab_dTermination_dMeasure_dnotEmpty = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> false
  | _ -> true
))

let rec v_Vuna_dCompiler_dElab_dTermination_dMeasure_dallEqTo = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__0, dtb__1) -> (if (mc0 = dtb__0) then ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dallEqTo mc0) dtb__1) else false)
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> true
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTermination_dMeasure_dallSame = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__2, dtb__3) -> ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dallEqTo dtb__2) dtb__3)
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> true
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dTermination_dMeasure_ddedup = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__4, dtb__5) -> (if ((Base_dList.v_Base_dList_dmemName dtb__4) dtb__5) then (v_Vuna_dCompiler_dElab_dTermination_dMeasure_ddedup dtb__5) else (Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__4, (v_Vuna_dCompiler_dElab_dTermination_dMeasure_ddedup dtb__5))))
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> Base_dList.C_Base_dList_dList_Base_dList_dNil
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dTermination_dMeasure_djoinComma = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__6, dtb__7) -> (match dtb__7 with
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> dtb__6
  | _ -> (String.concat "" [dtb__6; ", "; (v_Vuna_dCompiler_dElab_dTermination_dMeasure_djoinComma dtb__7)])
)
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> ""
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposHas = (fun mc0 mc1 mc2 -> (match mc2 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__8, dtb__9) -> (match dtb__8 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__10, dtb__11) -> (if (mc0 = dtb__10) then (if (mc1 = dtb__11) then true else (((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposHas mc0) mc1) dtb__9)) else (((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposHas mc0) mc1) dtb__9))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> false
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposTblOfGo = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__12, dtb__13) -> (match dtb__12 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__14, dtb__15) -> (match ((Base_dHashMap.v_Base_dHashMap_dlookup dtb__14) mc1) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__16) -> ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposTblOfGo dtb__13) (((Base_dHashMap.v_Base_dHashMap_dinsert dtb__14) (Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__15, dtb__16))) mc1))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposTblOfGo dtb__13) (((Base_dHashMap.v_Base_dHashMap_dinsert dtb__14) (Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__15, Base_dList.C_Base_dList_dList_Base_dList_dNil))) mc1))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> mc1
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposTblOf = (fun xs -> ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposTblOfGo xs) (Base_dHashMap.v_Base_dHashMap_dfromList Base_dList.C_Base_dList_dList_Base_dList_dNil)))

let rec v_Vuna_dCompiler_dElab_dTermination_dMeasure_dmemInt = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__17, dtb__18) -> (if (mc0 = dtb__17) then true else ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dmemInt mc0) dtb__18))
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> false
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposHasTbl = (fun f i tbl -> (match ((Base_dHashMap.v_Base_dHashMap_dlookup f) tbl) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__19) -> ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dmemInt i) dtb__19)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> false
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposAdd = (fun f i facts -> (if (((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposHas f) i) facts) then facts else (Base_dList.C_Base_dList_dList_Base_dList_dCons ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (f, i)), facts))))

let rec v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposSubset = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__20, dtb__21) -> (match dtb__20 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__22, dtb__23) -> (if (((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposHas dtb__22) dtb__23) mc1) then ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposSubset dtb__21) mc1) else false)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> true
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposSetEq = (fun a b -> (if ((Base_dList.v_Base_dList_dlength a) = (Base_dList.v_Base_dList_dlength b)) then ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposSubset a) b) else false))

let rec v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposFilter = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__24, dtb__25) -> (match dtb__24 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__26, dtb__27) -> (if (((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposHas dtb__26) dtb__27) mc1) then ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposFilter dtb__25) mc1) else (Base_dList.C_Base_dList_dList_Base_dList_dCons ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__26, dtb__27)), ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposFilter dtb__25) mc1))))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> Base_dList.C_Base_dList_dList_Base_dList_dNil
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposUnion = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__28, dtb__29) -> (match dtb__28 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__30, dtb__31) -> ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposUnion dtb__29) (((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposAdd dtb__30) dtb__31) mc1))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> mc1
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposFilterTbl = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__32, dtb__33) -> (match dtb__32 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__34, dtb__35) -> (if (((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposHasTbl dtb__34) dtb__35) mc1) then ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposFilterTbl dtb__33) mc1) else (Base_dList.C_Base_dList_dList_Base_dList_dCons ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__34, dtb__35)), ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposFilterTbl dtb__33) mc1))))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> Base_dList.C_Base_dList_dList_Base_dList_dNil
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposSubsetTbl = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__36, dtb__37) -> (match dtb__36 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__38, dtb__39) -> (if (((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposHasTbl dtb__38) dtb__39) mc1) then ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposSubsetTbl dtb__37) mc1) else false)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> true
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposSetEqTbl = (fun a b -> (if (if ((Base_dList.v_Base_dList_dlength a) = (Base_dList.v_Base_dList_dlength b)) then ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposSubsetTbl a) (v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposTblOf b)) else false) then ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposSubsetTbl b) (v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposTblOf a)) else false))

let v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposUnionTbl = (fun facts fresh -> ((Base_dList.v_Base_dList_dappend fresh) ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposFilterTbl facts) (v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposTblOf fresh))))

let rec v_Vuna_dCompiler_dElab_dTermination_dMeasure_dfunDeclsOf = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__40, dtb__41) -> (match dtb__40 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDFun (dtb__42, dtb__43, dtb__44, dtb__45) -> (Base_dList.C_Base_dList_dList_Base_dList_dCons ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__42, (Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__43, dtb__44)))), (v_Vuna_dCompiler_dElab_dTermination_dMeasure_dfunDeclsOf dtb__41)))
  | _ -> (v_Vuna_dCompiler_dElab_dTermination_dMeasure_dfunDeclsOf dtb__41)
)
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> Base_dList.C_Base_dList_dList_Base_dList_dNil
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dTermination_dMeasure_dlookupGroup = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__46, dtb__47) -> (match dtb__46 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__48, dtb__49) -> (if (dtb__48 = mc0) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__49)) else ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dlookupGroup mc0) dtb__47))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dTermination_dMeasure_dreplaceGroup = (fun mc0 mc1 mc2 -> (match mc2 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__50, dtb__51) -> (match dtb__50 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__52, dtb__53) -> (if (dtb__52 = mc0) then (Base_dList.C_Base_dList_dList_Base_dList_dCons ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__52, mc1)), dtb__51)) else (Base_dList.C_Base_dList_dList_Base_dList_dCons ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__52, dtb__53)), (((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dreplaceGroup mc0) mc1) dtb__51))))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> Base_dList.C_Base_dList_dList_Base_dList_dNil
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dTermination_dMeasure_dgroupDefsGo = (fun mc0 mc1 mc2 -> (match mc2 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__54, dtb__55) -> (match dtb__54 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__56, dtb__57) -> (match ((Base_dHashMap.v_Base_dHashMap_dlookup dtb__56) mc0) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__58) -> (((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dgroupDefsGo (((Base_dHashMap.v_Base_dHashMap_dinsert dtb__56) (Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__57, dtb__58))) mc0)) mc1) dtb__55)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dgroupDefsGo (((Base_dHashMap.v_Base_dHashMap_dinsert dtb__56) (Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__57, Base_dList.C_Base_dList_dList_Base_dList_dNil))) mc0)) (Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__56, mc1))) dtb__55)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (mc0, mc1))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTermination_dMeasure_dgroupDefs = (fun decls -> ((fun stepped -> ((fun tbl -> ((fun order -> ((Base_dList.v_Base_dList_dmap (fun n -> (Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (n, (match ((Base_dHashMap.v_Base_dHashMap_dlookup n) tbl) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__59) -> (Base_dList.v_Base_dList_dreverse dtb__59)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> Base_dList.C_Base_dList_dList_Base_dList_dNil
  | _ -> failwith "DT: impossible branch"
))))) (Base_dList.v_Base_dList_dreverse order))) (Base_dPair.v_Base_dPair_dsecondOf stepped))) (Base_dPair.v_Base_dPair_dfirstOf stepped))) (((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dgroupDefsGo (Base_dHashMap.v_Base_dHashMap_dfromList Base_dList.C_Base_dList_dList_Base_dList_dNil)) Base_dList.C_Base_dList_dList_Base_dList_dNil) (v_Vuna_dCompiler_dElab_dTermination_dMeasure_dfunDeclsOf decls))))

let v_Vuna_dCompiler_dElab_dTermination_dMeasure_ddefNames = (fun defs -> ((Base_dList.v_Base_dList_dmap Base_dPair.v_Base_dPair_dfirstOf) defs))

let rec v_Vuna_dCompiler_dElab_dTermination_dMeasure_dclausesOfDef = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__60, dtb__61) -> (match dtb__60 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__62, dtb__63) -> (if (dtb__62 = mc0) then dtb__63 else ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dclausesOfDef mc0) dtb__61))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> Base_dList.C_Base_dList_dList_Base_dList_dNil
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTermination_dMeasure_dclausesOfDefTbl = (fun name tbl -> (match ((Base_dHashMap.v_Base_dHashMap_dlookup name) tbl) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__64) -> dtb__64
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> Base_dList.C_Base_dList_dList_Base_dList_dNil
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dTermination_dMeasure_ddefArity = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__65, dtb__66) -> ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dmaxInt (Base_dList.v_Base_dList_dlength (Base_dPair.v_Base_dPair_dfirstOf dtb__65))) (v_Vuna_dCompiler_dElab_dTermination_dMeasure_ddefArity dtb__66))
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> 0
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dTermination_dMeasure_dmaxArityOf = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__67, dtb__68) -> ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dmaxInt (v_Vuna_dCompiler_dElab_dTermination_dMeasure_ddefArity ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dclausesOfDefTbl dtb__67) mc1))) ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dmaxArityOf dtb__68) mc1))
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> 0
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTermination_dMeasure_dctorNameOf = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dCtor_Vuna_dCompiler_dFrontend_dAst_dCtor (dtb__69, dtb__70, dtb__71, dtb__72) -> dtb__69
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dTermination_dMeasure_dctorNamesOf = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__73, dtb__74) -> (match dtb__73 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDData (dtb__75, dtb__76, dtb__77, dtb__78, dtb__79, dtb__80, dtb__81) -> ((Base_dList.v_Base_dList_dappend ((Base_dList.v_Base_dList_dmap v_Vuna_dCompiler_dElab_dTermination_dMeasure_dctorNameOf) dtb__78)) (v_Vuna_dCompiler_dElab_dTermination_dMeasure_dctorNamesOf dtb__74))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDRecord (dtb__82, dtb__83, dtb__84, dtb__85, dtb__86, dtb__87) -> (Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__82, (v_Vuna_dCompiler_dElab_dTermination_dMeasure_dctorNamesOf dtb__74)))
  | _ -> (v_Vuna_dCompiler_dElab_dTermination_dMeasure_dctorNamesOf dtb__74)
)
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> Base_dList.C_Base_dList_dList_Base_dList_dNil
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dTermination_dMeasure_dpatSizeStrict = (fun mc0 mc1 mc2 mc3 -> (match mc0 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPRecord (dtb__88, dtb__89, dtb__90) -> (((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dfieldsSizeStrict dtb__89) mc1) mc2) 0) mc3)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPCon (dtb__91, dtb__92, dtb__93) -> (((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dpatsSizeStrict dtb__92) mc1) mc2) 0) mc3)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPWild (dtb__94) -> mc3
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPVar (dtb__95, dtb__96) -> (Base_dList.C_Base_dList_dList_Base_dList_dCons ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__95, (Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (mc1, (Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ((Base_dList.v_Base_dList_dlength mc2), mc2)))))), mc3))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPAs (dtb__97, dtb__98, dtb__99) -> ((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dpatSizeStrict dtb__98) mc1) mc2) (Base_dList.C_Base_dList_dList_Base_dList_dCons ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__97, (Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (mc1, (Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ((Base_dList.v_Base_dList_dlength mc2), mc2)))))), mc3)))
  | _ -> mc3
))
and v_Vuna_dCompiler_dElab_dTermination_dMeasure_dpatsSizeStrict = (fun mc0 mc1 mc2 mc3 mc4 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__100, dtb__101) -> (((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dpatsSizeStrict dtb__101) mc1) mc2) (mc3 + 1)) ((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dpatSizeStrict dtb__100) mc1) ((Base_dList.v_Base_dList_dappend mc2) (Base_dList.C_Base_dList_dList_Base_dList_dCons (mc3, Base_dList.C_Base_dList_dList_Base_dList_dNil)))) mc4))
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> mc4
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dElab_dTermination_dMeasure_dfieldsSizeStrict = (fun mc0 mc1 mc2 mc3 mc4 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__102, dtb__103) -> (match dtb__102 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__104, dtb__105) -> (((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dfieldsSizeStrict dtb__103) mc1) mc2) (mc3 + 1)) ((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dpatSizeStrict dtb__105) mc1) ((Base_dList.v_Base_dList_dappend mc2) (Base_dList.C_Base_dList_dList_Base_dList_dCons (mc3, Base_dList.C_Base_dList_dList_Base_dList_dNil)))) mc4))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> mc4
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dTermination_dMeasure_dstrSizeEntriesGo = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__106, dtb__107) -> ((Base_dList.v_Base_dList_dappend ((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dpatSizeStrict dtb__106) mc1) Base_dList.C_Base_dList_dList_Base_dList_dNil) Base_dList.C_Base_dList_dList_Base_dList_dNil)) ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dstrSizeEntriesGo dtb__107) (mc1 + 1)))
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> Base_dList.C_Base_dList_dList_Base_dList_dNil
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTermination_dMeasure_dstrSizeEntries = (fun pats -> ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dstrSizeEntriesGo pats) 0))

let rec v_Vuna_dCompiler_dElab_dTermination_dMeasure_dsizeOfVarStrict = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__108, dtb__109) -> (match dtb__108 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__110, dtb__111) -> (if (dtb__110 = mc0) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__111)) else ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dsizeOfVarStrict mc0) dtb__109))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTermination_dMeasure_dextendSizesStrict = (fun mc0 mc1 mc2 -> (match mc1 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (dtb__112, dtb__113) -> (match ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dsizeOfVarStrict dtb__112) mc0) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__114) -> ((fun nd_uscrut7 -> (match nd_uscrut7 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__115, dtb__116) -> (match dtb__116 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__117, dtb__118) -> (match mc2 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPCon (dtb__119, dtb__120, dtb__121) -> ((Base_dList.v_Base_dList_dappend mc0) (((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dpatsSizeStrict dtb__120) dtb__115) dtb__118) 0) Base_dList.C_Base_dList_dList_Base_dList_dNil))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPRecord (dtb__122, dtb__123, dtb__124) -> ((Base_dList.v_Base_dList_dappend mc0) (((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dfieldsSizeStrict dtb__123) dtb__115) dtb__118) 0) Base_dList.C_Base_dList_dList_Base_dList_dNil))
  | _ -> mc0
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) dtb__114)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> mc0
  | _ -> failwith "DT: impossible branch"
)
  | _ -> mc0
))

let v_Vuna_dCompiler_dElab_dTermination_dMeasure_dopBaseName = (fun name -> (Base_dPair.v_Base_dPair_dsecondOf (Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dsplitLastDot (Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dsplitOnDot name))))

let v_Vuna_dCompiler_dElab_dTermination_dMeasure_dvarOfExpr = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (dtb__125, dtb__126) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__125))
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
))

let v_Vuna_dCompiler_dElab_dTermination_dMeasure_dguardLE = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__127, dtb__128) -> (match dtb__128 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__129, dtb__130) -> (match dtb__130 with
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (match dtb__129 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEInt (dtb__131, dtb__132) -> (if (dtb__131 = 0) then (v_Vuna_dCompiler_dElab_dTermination_dMeasure_dvarOfExpr dtb__127) else Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
))

let v_Vuna_dCompiler_dElab_dTermination_dMeasure_dguardGE = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__133, dtb__134) -> (match dtb__134 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__135, dtb__136) -> (match dtb__136 with
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (match dtb__133 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEInt (dtb__137, dtb__138) -> (if (dtb__137 = 0) then (v_Vuna_dCompiler_dElab_dTermination_dMeasure_dvarOfExpr dtb__135) else Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
))

let v_Vuna_dCompiler_dElab_dTermination_dMeasure_dguardLT = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__139, dtb__140) -> (match dtb__140 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__141, dtb__142) -> (match dtb__142 with
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (match dtb__141 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEInt (dtb__143, dtb__144) -> (if (dtb__143 = 1) then (v_Vuna_dCompiler_dElab_dTermination_dMeasure_dvarOfExpr dtb__139) else Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
))

let v_Vuna_dCompiler_dElab_dTermination_dMeasure_dguardPosVar = (fun e -> ((fun nd_uscrut1 -> (match nd_uscrut1 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEApp (dtb__145, dtb__146, dtb__147) -> (match dtb__145 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (dtb__148, dtb__149) -> (if ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dopBaseName dtb__148) = "le") then (v_Vuna_dCompiler_dElab_dTermination_dMeasure_dguardLE dtb__146) else (if ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dopBaseName dtb__148) = "ge") then (v_Vuna_dCompiler_dElab_dTermination_dMeasure_dguardGE dtb__146) else (if ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dopBaseName dtb__148) = "lt") then (v_Vuna_dCompiler_dElab_dTermination_dMeasure_dguardLT dtb__146) else (if ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dopBaseName dtb__148) = "<=") then (v_Vuna_dCompiler_dElab_dTermination_dMeasure_dguardLE dtb__146) else (if ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dopBaseName dtb__148) = ">=") then (v_Vuna_dCompiler_dElab_dTermination_dMeasure_dguardGE dtb__146) else (if ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dopBaseName dtb__148) = "<") then (v_Vuna_dCompiler_dElab_dTermination_dMeasure_dguardLT dtb__146) else Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing))))))
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)) e))

let v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposMarkPos = (fun f i st -> (Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposAdd f) i) (Base_dPair.v_Base_dPair_dfirstOf st)), (Base_dPair.v_Base_dPair_dsecondOf st))))

let v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposMarkNeg = (fun f i st -> (Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ((Base_dPair.v_Base_dPair_dfirstOf st), (((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposAdd f) i) (Base_dPair.v_Base_dPair_dsecondOf st)))))

let rec v_Vuna_dCompiler_dElab_dTermination_dMeasure_dpathInPats = (fun mc0 mc1 mc2 mc3 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__150, dtb__151) -> (match (((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dpathInPat mc0) dtb__150) ((Base_dList.v_Base_dList_dappend mc2) (Base_dList.C_Base_dList_dList_Base_dList_dCons (mc3, Base_dList.C_Base_dList_dList_Base_dList_dNil)))) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__152) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__152))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dpathInPats mc0) dtb__151) mc2) (mc3 + 1))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dElab_dTermination_dMeasure_dpathInFields = (fun mc0 mc1 mc2 mc3 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__153, dtb__154) -> (match dtb__153 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__155, dtb__156) -> (match (((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dpathInPat mc0) dtb__156) ((Base_dList.v_Base_dList_dappend mc2) (Base_dList.C_Base_dList_dList_Base_dList_dCons (mc3, Base_dList.C_Base_dList_dList_Base_dList_dNil)))) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__157) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__157))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dpathInFields mc0) dtb__154) mc2) (mc3 + 1))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dElab_dTermination_dMeasure_dpathInPat = (fun mc0 mc1 mc2 -> (match mc1 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPRecord (dtb__158, dtb__159, dtb__160) -> ((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dpathInFields mc0) dtb__159) mc2) 0)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPCon (dtb__161, dtb__162, dtb__163) -> ((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dpathInPats mc0) dtb__162) mc2) 0)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPWild (dtb__164) -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPVar (dtb__165, dtb__166) -> (if (dtb__165 = mc0) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (mc2)) else Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
))

let v_Vuna_dCompiler_dElab_dTermination_dMeasure_dprojectionOfDef = (fun d -> ((fun nd_uscrut1 -> (match nd_uscrut1 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__167, dtb__168) -> (match dtb__168 with
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> ((fun nd_uscrut6 -> (match nd_uscrut6 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__169, dtb__170) -> (match dtb__170 with
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (match (Base_dPair.v_Base_dPair_dsecondOf dtb__167) with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (dtb__171, dtb__172) -> (match (((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dpathInPat dtb__171) dtb__169) Base_dList.C_Base_dList_dList_Base_dList_dNil) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__173) -> (if (v_Vuna_dCompiler_dElab_dTermination_dMeasure_dnotEmpty dtb__173) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ((Base_dPair.v_Base_dPair_dfirstOf d), dtb__173)))) else Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)) (Base_dPair.v_Base_dPair_dfirstOf dtb__167))
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)) (Base_dPair.v_Base_dPair_dsecondOf d)))

let rec v_Vuna_dCompiler_dElab_dTermination_dMeasure_dprojectionsOf = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__174, dtb__175) -> (match (v_Vuna_dCompiler_dElab_dTermination_dMeasure_dprojectionOfDef dtb__174) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__176) -> (Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__176, (v_Vuna_dCompiler_dElab_dTermination_dMeasure_dprojectionsOf dtb__175)))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (v_Vuna_dCompiler_dElab_dTermination_dMeasure_dprojectionsOf dtb__175)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> Base_dList.C_Base_dList_dList_Base_dList_dNil
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dTermination_dMeasure_dprojHas = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__177, dtb__178) -> (match dtb__177 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__179, dtb__180) -> (if (mc0 = dtb__179) then true else ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dprojHas mc0) dtb__178))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> false
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dTermination_dMeasure_dfindWrapField = (fun mc0 mc1 mc2 mc3 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__181, dtb__182) -> (match dtb__181 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (dtb__183, dtb__184) -> (match ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dsizeOfVarStrict dtb__183) mc2) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__185) -> ((fun nd_uscrut11 -> (match nd_uscrut11 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__186, dtb__187) -> (match dtb__187 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__188, dtb__189) -> (if (dtb__186 = mc0) then ((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dwrapCheck mc0) dtb__182) mc2) mc3) dtb__188) dtb__189) else ((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dfindWrapField mc0) dtb__182) mc2) (mc3 + 1)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) dtb__185)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dfindWrapField mc0) dtb__182) mc2) (mc3 + 1))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> ((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dfindWrapField mc0) dtb__182) mc2) (mc3 + 1))
)
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dElab_dTermination_dMeasure_dwrapCheck = (fun p rest sizes k depth path -> (if (depth > 0) then (match path with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__190, dtb__191) -> (if (dtb__190 = k) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((k + 2))) else ((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dfindWrapField p) rest) sizes) (k + 1)))
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> ((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dfindWrapField p) rest) sizes) (k + 1))
  | _ -> failwith "DT: impossible branch"
) else ((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dfindWrapField p) rest) sizes) (k + 1))))

let v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposVarIn = (fun x p caller facts region -> (if ((Base_dList.v_Base_dList_dmemName x) region) then true else (((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposHasTbl caller) p) facts)))

let v_Vuna_dCompiler_dElab_dTermination_dMeasure_darithMinusBase = (fun mc0 mc1 mc2 mc3 mc4 mc5 mc6 -> (match mc1 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (dtb__192, dtb__193) -> (match ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dsizeOfVarStrict dtb__192) mc3) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__194) -> ((fun nd_uscrut11 -> (match nd_uscrut11 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__195, dtb__196) -> (match dtb__196 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__197, dtb__198) -> (if (dtb__195 = mc0) then (if (dtb__197 = 0) then (if (((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposVarIn dtb__192) mc0) mc4) mc5) mc6) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (4)) else Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing) else Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing) else Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) dtb__194)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
))

let v_Vuna_dCompiler_dElab_dTermination_dMeasure_darithMinus = (fun mc0 mc1 mc2 mc3 mc4 mc5 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__199, dtb__200) -> (match dtb__200 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__201, dtb__202) -> (match dtb__201 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEInt (dtb__203, dtb__204) -> (match dtb__202 with
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (if (dtb__203 > 0) then (((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_darithMinusBase mc0) dtb__199) dtb__203) mc2) mc3) mc4) mc5) else Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
))

let v_Vuna_dCompiler_dElab_dTermination_dMeasure_darithRel = (fun mc0 mc1 mc2 mc3 mc4 mc5 -> (match mc1 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEApp (dtb__205, dtb__206, dtb__207) -> (match dtb__205 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (dtb__208, dtb__209) -> (if (dtb__208 = "-") then ((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_darithMinus mc0) dtb__206) mc2) mc3) mc4) mc5) else Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
))

let v_Vuna_dCompiler_dElab_dTermination_dMeasure_dprojRel = (fun mc0 mc1 mc2 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__210, dtb__211) -> (match dtb__211 with
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (match dtb__210 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (dtb__212, dtb__213) -> (match ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dsizeOfVarStrict dtb__212) mc2) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__214) -> ((fun nd_uscrut11 -> (match nd_uscrut11 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__215, dtb__216) -> (match dtb__216 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__217, dtb__218) -> (if (dtb__215 = mc0) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (1)) else Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) dtb__214)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
))

let v_Vuna_dCompiler_dElab_dTermination_dMeasure_drelOfArg = (fun mc0 mc1 mc2 mc3 mc4 mc5 mc6 mc7 -> (match mc1 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEApp (dtb__219, dtb__220, dtb__221) -> (match dtb__219 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (dtb__222, dtb__223) -> (if ((Base_dList.v_Base_dList_dmemName dtb__222) mc3) then ((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dfindWrapField mc0) dtb__220) mc2) 0) else (if ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dprojHas dtb__222) mc4) then (((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dprojRel mc0) dtb__220) mc2) else ((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_darithRel mc0) mc1) mc2) mc5) mc6) mc7)))
  | _ -> ((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_darithRel mc0) mc1) mc2) mc5) mc6) mc7)
)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (dtb__224, dtb__225) -> (match ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dsizeOfVarStrict dtb__224) mc2) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__226) -> ((fun nd_uscrut12 -> (match nd_uscrut12 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__227, dtb__228) -> (match dtb__228 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__229, dtb__230) -> (if (dtb__227 = mc0) then (if (dtb__229 > 0) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (1)) else (Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (0))) else Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) dtb__226)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
))

let v_Vuna_dCompiler_dElab_dTermination_dMeasure_dmarkInvalid = (fun acc -> (Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (false, (Base_dPair.v_Base_dPair_dsecondOf acc))))

let v_Vuna_dCompiler_dElab_dTermination_dMeasure_daddEdgeMode = (fun caller callee m acc -> (Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ((Base_dPair.v_Base_dPair_dfirstOf acc), (Base_dList.C_Base_dList_dList_Base_dList_dCons ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (caller, callee)), m)), (Base_dPair.v_Base_dPair_dsecondOf acc))))))

let v_Vuna_dCompiler_dElab_dTermination_dMeasure_dgroupHead = (fun mc0 mc1 -> (match mc1 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (dtb__231, dtb__232) -> (if ((Base_dList.v_Base_dList_dmemName dtb__231) mc0) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__231)) else Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
))

let rec v_Vuna_dCompiler_dElab_dTermination_dMeasure_dnthExpr = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__233, dtb__234) -> (if (mc1 <= 0) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__233)) else ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dnthExpr dtb__234) (mc1 - 1)))
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTermination_dMeasure_dargPositive = (fun args i sizes caller facts region -> (match ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dnthExpr args) i) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> false
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__235) -> (match dtb__235 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEInt (dtb__236, dtb__237) -> (dtb__236 > 0)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (dtb__238, dtb__239) -> (if ((Base_dList.v_Base_dList_dmemName dtb__238) region) then true else (match ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dsizeOfVarStrict dtb__238) sizes) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__240) -> ((fun nd_uscrut12 -> (match nd_uscrut12 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__241, dtb__242) -> (match dtb__242 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__243, dtb__244) -> (if (dtb__243 = 0) then (((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposHasTbl caller) dtb__241) facts) else false)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) dtb__240)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> false
  | _ -> failwith "DT: impossible branch"
))
  | _ -> false
)
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalkCalleeGo = (fun names caller sizes facts region g remaining args st -> (if (remaining <= 0) then st else ((fun i -> ((fun st1 -> (((((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalkCalleeGo names) caller) sizes) facts) region) g) (remaining - 1)) args) st1)) (if ((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dargPositive args) i) sizes) caller) facts) region) then (((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposMarkPos g) i) st) else (((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposMarkNeg g) i) st)))) ((Base_dList.v_Base_dList_dlength args) - remaining))))

let v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalkCallee = (fun names caller sizes facts region g i args st -> (((((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalkCalleeGo names) caller) sizes) facts) region) g) ((Base_dList.v_Base_dList_dlength args) - i)) args) st))

let rec v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalkArgs = (fun mc0 mc1 mc2 mc3 mc4 mc5 mc6 -> (match mc5 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__245, dtb__246) -> (((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalkArgs mc0) mc1) mc2) mc3) mc4) dtb__246) (((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalk mc0) mc1) mc2) mc3) mc4) dtb__245) mc6))
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> mc6
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalkFields = (fun mc0 mc1 mc2 mc3 mc4 mc5 mc6 -> (match mc5 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__247, dtb__248) -> (match dtb__247 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__249, dtb__250) -> (((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalkFields mc0) mc1) mc2) mc3) mc4) dtb__248) (((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalk mc0) mc1) mc2) mc3) mc4) dtb__250) mc6))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> mc6
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalkAlts = (fun mc0 mc1 mc2 mc3 mc4 mc5 mc6 -> (match mc5 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__251, dtb__252) -> (match dtb__251 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__253, dtb__254) -> (((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalkAlts mc0) mc1) mc2) mc3) mc4) dtb__252) (((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalk mc0) mc1) mc2) mc3) mc4) dtb__254) mc6))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> mc6
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalkBinds = (fun mc0 mc1 mc2 mc3 mc4 mc5 mc6 -> (match mc5 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__255, dtb__256) -> (match dtb__255 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__257, dtb__258) -> (((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalkBinds mc0) mc1) mc2) mc3) mc4) dtb__256) (((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalk mc0) mc1) mc2) mc3) mc4) dtb__258) mc6))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> mc6
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalkStmts = (fun mc0 mc1 mc2 mc3 mc4 mc5 mc6 -> (match mc5 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__259, dtb__260) -> (match dtb__259 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDoStmt_Vuna_dCompiler_dFrontend_dAst_dDBind (dtb__261, dtb__262, dtb__263) -> (((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalkStmts mc0) mc1) mc2) mc3) mc4) dtb__260) (((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalk mc0) mc1) mc2) mc3) mc4) dtb__262) mc6))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDoStmt_Vuna_dCompiler_dFrontend_dAst_dDExpr (dtb__264, dtb__265) -> (((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalkStmts mc0) mc1) mc2) mc3) mc4) dtb__260) (((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalk mc0) mc1) mc2) mc3) mc4) dtb__264) mc6))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> mc6
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalk = (fun mc0 mc1 mc2 mc3 mc4 mc5 mc6 -> (match mc5 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (dtb__266, dtb__267) -> mc6
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEAnn (dtb__268, dtb__269, dtb__270) -> (((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalk mc0) mc1) mc2) mc3) mc4) dtb__269) (((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalk mc0) mc1) mc2) mc3) mc4) dtb__268) mc6))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEDo (dtb__271, dtb__272) -> (((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalkStmts mc0) mc1) mc2) mc3) mc4) dtb__271) mc6)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dERecUpdate (dtb__273, dtb__274, dtb__275) -> (((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalkFields mc0) mc1) mc2) mc3) mc4) dtb__274) (((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalk mc0) mc1) mc2) mc3) mc4) dtb__273) mc6))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dERecord (dtb__276, dtb__277, dtb__278) -> (((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalkFields mc0) mc1) mc2) mc3) mc4) dtb__277) mc6)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEField (dtb__279, dtb__280, dtb__281) -> (((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalk mc0) mc1) mc2) mc3) mc4) dtb__279) mc6)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEPi (dtb__282, dtb__283, dtb__284, dtb__285, dtb__286, dtb__287) -> (((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalk mc0) mc1) mc2) mc3) mc4) dtb__286) (((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalk mc0) mc1) mc2) mc3) mc4) dtb__285) mc6))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dELet (dtb__288, dtb__289, dtb__290, dtb__291) -> (((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalk mc0) mc1) mc2) mc3) mc4) dtb__289) (((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalkBinds mc0) mc1) mc2) mc3) mc4) dtb__288) mc6))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dELam (dtb__292, dtb__293, dtb__294) -> (((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalk mc0) mc1) mc2) mc3) mc4) dtb__293) mc6)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dECase (dtb__295, dtb__296, dtb__297) -> (((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalkAlts mc0) mc1) mc2) mc3) mc4) dtb__296) (((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalk mc0) mc1) mc2) mc3) mc4) dtb__295) mc6))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEIf (dtb__298, dtb__299, dtb__300, dtb__301) -> (match (v_Vuna_dCompiler_dElab_dTermination_dMeasure_dguardPosVar dtb__298) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__302) -> ((fun st1 -> ((fun st2 -> (((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalk mc0) mc1) mc2) mc3) (Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__302, mc4))) dtb__300) st2)) (((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalk mc0) mc1) mc2) mc3) mc4) dtb__299) st1))) (((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalk mc0) mc1) mc2) mc3) mc4) dtb__298) mc6))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((fun st1 -> ((fun st2 -> (((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalk mc0) mc1) mc2) mc3) mc4) dtb__300) st2)) (((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalk mc0) mc1) mc2) mc3) mc4) dtb__299) st1))) (((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalk mc0) mc1) mc2) mc3) mc4) dtb__298) mc6))
  | _ -> failwith "DT: impossible branch"
)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEApp (dtb__303, dtb__304, dtb__305) -> (match dtb__303 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (dtb__306, dtb__307) -> (if ((Base_dList.v_Base_dList_dmemName dtb__306) mc0) then (((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalkArgs mc0) mc1) mc2) mc3) mc4) dtb__304) (((((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalkCallee mc0) mc1) mc2) mc3) mc4) dtb__306) 0) dtb__304) mc6)) else (((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalkArgs mc0) mc1) mc2) mc3) mc4) dtb__304) (((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalk mc0) mc1) mc2) mc3) mc4) dtb__303) mc6)))
  | _ -> (((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalkArgs mc0) mc1) mc2) mc3) mc4) dtb__304) (((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalk mc0) mc1) mc2) mc3) mc4) dtb__303) mc6))
)
  | _ -> mc6
))

let rec v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposScanClauses = (fun mc0 mc1 mc2 mc3 mc4 mc5 -> (match mc4 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__308, dtb__309) -> ((fun sizes -> ((fun st2 -> ((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposScanClauses mc0) mc1) mc2) mc3) dtb__309) st2)) (((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalk mc0) mc3) sizes) mc2) Base_dList.C_Base_dList_dList_Base_dList_dNil) (Base_dPair.v_Base_dPair_dsecondOf dtb__308)) mc5))) (v_Vuna_dCompiler_dElab_dTermination_dMeasure_dstrSizeEntries (Base_dPair.v_Base_dPair_dfirstOf dtb__308)))
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> mc5
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposScanDefs = (fun mc0 mc1 mc2 mc3 mc4 -> (match mc3 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__310, dtb__311) -> (((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposScanDefs mc0) mc1) mc2) dtb__311) ((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposScanClauses mc0) mc1) mc2) (Base_dPair.v_Base_dPair_dfirstOf dtb__310)) (Base_dPair.v_Base_dPair_dsecondOf dtb__310)) mc4))
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> mc4
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposScanNamesGo = (fun mc0 mc1 mc2 mc3 mc4 -> (match mc3 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__312, dtb__313) -> (((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposScanNamesGo mc0) mc1) mc2) dtb__313) ((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposScanClauses mc0) Base_dList.C_Base_dList_dList_Base_dList_dNil) mc2) dtb__312) ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dclausesOfDefTbl dtb__312) mc1)) mc4))
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> mc4
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposScanNames = (fun names defTbl factsTbl work st -> (((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposScanNamesGo names) defTbl) factsTbl) work) st))

let rec v_Vuna_dCompiler_dElab_dTermination_dMeasure_dcomputePosFacts = (fun defs fuel facts -> (if (fuel <= 0) then facts else (((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dcomputePosFactsStep defs) fuel) facts)))
and v_Vuna_dCompiler_dElab_dTermination_dMeasure_dcomputePosFactsStep = (fun defs fuel facts -> ((fun names -> ((fun scan -> ((fun fresh -> ((fun merged -> (if ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposSetEqTbl facts) merged) then merged else (((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dcomputePosFacts defs) (fuel - 1)) merged))) ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposUnionTbl facts) fresh))) ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposFilterTbl (Base_dPair.v_Base_dPair_dfirstOf scan)) (v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposTblOf (Base_dPair.v_Base_dPair_dsecondOf scan))))) (((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposScanDefs names) defs) (v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposTblOf facts)) defs) (Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (Base_dList.C_Base_dList_dList_Base_dList_dNil, Base_dList.C_Base_dList_dList_Base_dList_dNil))))) (v_Vuna_dCompiler_dElab_dTermination_dMeasure_ddefNames defs)))

let v_Vuna_dCompiler_dElab_dTermination_dMeasure_dargRel = (fun p args sizes ctors projs caller facts region -> (match ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dnthExpr args) p) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__314) -> ((((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_drelOfArg p) dtb__314) sizes) ctors) projs) caller) facts) region)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTermination_dMeasure_ddotBase = (fun n -> (Base_dPair.v_Base_dPair_dsecondOf (Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dsplitLastDot (Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dsplitOnDot n))))

let v_Vuna_dCompiler_dElab_dTermination_dMeasure_disMapLike = (fun n -> (if (if (if (if ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_ddotBase n) = "map") then true else ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_ddotBase n) = "traverse")) then true else ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_ddotBase n) = "concatMap")) then true else ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_ddotBase n) = "mapMaybe")) then true else ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_ddotBase n) = "filter")))

let v_Vuna_dCompiler_dElab_dTermination_dMeasure_dextendElemSizes = (fun mc0 mc1 mc2 -> (match mc1 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (dtb__315, dtb__316) -> (match ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dsizeOfVarStrict dtb__315) mc0) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__317) -> ((fun nd_uscrut7 -> (match nd_uscrut7 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__318, dtb__319) -> (match dtb__319 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__320, dtb__321) -> (Base_dList.C_Base_dList_dList_Base_dList_dCons ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (mc2, (Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__318, (Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ((dtb__320 + 1), ((Base_dList.v_Base_dList_dappend dtb__321) (Base_dList.C_Base_dList_dList_Base_dList_dCons (0, Base_dList.C_Base_dList_dList_Base_dList_dNil))))))))), mc0))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) dtb__317)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> mc0
  | _ -> failwith "DT: impossible branch"
)
  | _ -> mc0
))

let rec v_Vuna_dCompiler_dElab_dTermination_dMeasure_dedgeStrictGo = (fun mc0 mc1 mc2 mc3 mc4 -> (match mc2 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__322, dtb__323) -> (match dtb__322 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__324, dtb__325) -> (match dtb__324 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__326, dtb__327) -> (if (dtb__326 = mc0) then (if (dtb__327 = mc1) then (((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dedgeStrictGo mc0) mc1) dtb__323) true) (if (dtb__325 = 0) then false else mc4)) else (((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dedgeStrictGo mc0) mc1) dtb__323) mc3) mc4)) else (((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dedgeStrictGo mc0) mc1) dtb__323) mc3) mc4))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (if mc3 then mc4 else false)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTermination_dMeasure_dedgeStrict = (fun f g edges -> (((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dedgeStrictGo f) g) edges) false) true))

let rec v_Vuna_dCompiler_dElab_dTermination_dMeasure_dedgeTargetsGo = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__328, dtb__329) -> (match dtb__328 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__330, dtb__331) -> (match dtb__330 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__332, dtb__333) -> (if (dtb__332 = mc0) then (Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__333, ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dedgeTargetsGo mc0) dtb__329))) else ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dedgeTargetsGo mc0) dtb__329))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> Base_dList.C_Base_dList_dList_Base_dList_dNil
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTermination_dMeasure_dedgeTargets = (fun f edges -> (v_Vuna_dCompiler_dElab_dTermination_dMeasure_ddedup ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dedgeTargetsGo f) edges)))

let rec v_Vuna_dCompiler_dElab_dTermination_dMeasure_dweakAdjGo = (fun mc0 mc1 mc2 mc3 -> (match mc3 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__334, dtb__335) -> (if (((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dedgeStrict mc2) dtb__334) mc1) then ((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dweakAdjGo mc0) mc1) mc2) dtb__335) else (Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__334, ((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dweakAdjGo mc0) mc1) mc2) dtb__335))))
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> Base_dList.C_Base_dList_dList_Base_dList_dNil
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTermination_dMeasure_dweakAdj = (fun comp edges f -> ((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dweakAdjGo comp) edges) f) ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dedgeTargets f) edges)))

let rec v_Vuna_dCompiler_dElab_dTermination_dMeasure_dweakReachFuel = (fun fuel comp edges start frontier visited -> (if (fuel <= 0) then false else (match frontier with
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> false
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__336, dtb__337) -> (if (dtb__336 = start) then true else (if ((Base_dList.v_Base_dList_dmemName dtb__336) visited) then ((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dweakReachFuel (fuel - 1)) comp) edges) start) dtb__337) visited) else ((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dweakReachFuel (fuel - 1)) comp) edges) start) ((Base_dList.v_Base_dList_dappend dtb__337) (((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dweakAdj comp) edges) dtb__336))) (Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__336, visited)))))
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dElab_dTermination_dMeasure_dweakReach = (fun comp edges start frontier visited -> ((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dweakReachFuel 100000) comp) edges) start) frontier) visited))

let rec v_Vuna_dCompiler_dElab_dTermination_dMeasure_dhasWeakCycleGo = (fun mc0 mc1 mc2 -> (match mc2 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__338, dtb__339) -> (if (((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dweakReach mc0) mc1) dtb__338) (((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dweakAdj mc0) mc1) dtb__338)) (Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__338, Base_dList.C_Base_dList_dList_Base_dList_dNil))) then true else (((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dhasWeakCycleGo mc0) mc1) dtb__339))
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> false
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTermination_dMeasure_dhasWeakCycle = (fun comp edges -> (((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dhasWeakCycleGo comp) edges) comp))

let v_Vuna_dCompiler_dElab_dTermination_dMeasure_disDescent = (fun m -> (m <> 0))

let rec v_Vuna_dCompiler_dElab_dTermination_dMeasure_dfilterModes = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__340, dtb__341) -> (if (v_Vuna_dCompiler_dElab_dTermination_dMeasure_disDescent dtb__340) then (Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__340, (v_Vuna_dCompiler_dElab_dTermination_dMeasure_dfilterModes dtb__341))) else (v_Vuna_dCompiler_dElab_dTermination_dMeasure_dfilterModes dtb__341))
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> Base_dList.C_Base_dList_dList_Base_dList_dNil
  | _ -> failwith "DT: impossible branch"
))
