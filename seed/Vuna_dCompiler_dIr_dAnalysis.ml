open Vuna_runtime
# 21 "Vuna/Compiler/Ir/Analysis.vuna"
let v_Vuna_dCompiler_dIr_dAnalysis_dneighborsOf = (fun adjT name -> (match ((((Base_dHashMap.v_Base_dHashMap_dlookup Base_dString.v_Hashable_uString) Base_dString.v_Eq_uString) name) adjT) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__0) -> dtb__0
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 26 "Vuna/Compiler/Ir/Analysis.vuna"
let v_Vuna_dCompiler_dIr_dAnalysis_dadjTblOf = (fun adj -> (((Base_dHashMap.v_Base_dHashMap_dinsertAll Base_dString.v_Hashable_uString) adj) ((Base_dHashMap.v_Base_dHashMap_dfromList Base_dString.v_Hashable_uString) Base_dList.C_Base_dList_dList_Nil)))

# 29 "Vuna/Compiler/Ir/Analysis.vuna"
let rec v_Vuna_dCompiler_dIr_dAnalysis_daddDependents = (fun mc0 mc1 mc2 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__1, dtb__2) -> ((fun cur -> (((v_Vuna_dCompiler_dIr_dAnalysis_daddDependents mc0) dtb__2) ((((Base_dHashMap.v_Base_dHashMap_dinsert Base_dString.v_Hashable_uString) dtb__1) (Base_dList.C_Base_dList_dList_Cons (mc0, cur))) mc2))) (match ((((Base_dHashMap.v_Base_dHashMap_dlookup Base_dString.v_Hashable_uString) Base_dString.v_Eq_uString) dtb__1) mc2) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__3) -> dtb__3
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))
  | Base_dList.C_Base_dList_dList_Nil -> mc2
  | _ -> failwith "DT: impossible branch"
))

# 38 "Vuna/Compiler/Ir/Analysis.vuna"
let rec v_Vuna_dCompiler_dIr_dAnalysis_dreverseAdjTbl = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__4, dtb__5) -> (match dtb__4 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__6; Base_dPair.f_Base_dPair_dPair_second = dtb__7 } -> (((v_Vuna_dCompiler_dIr_dAnalysis_daddDependents dtb__6) dtb__7) (v_Vuna_dCompiler_dIr_dAnalysis_dreverseAdjTbl dtb__5))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> ((Base_dHashMap.v_Base_dHashMap_dfromList Base_dString.v_Hashable_uString) Base_dList.C_Base_dList_dList_Nil)
  | _ -> failwith "DT: impossible branch"
))

# 48 "Vuna/Compiler/Ir/Analysis.vuna"
let rec v_Vuna_dCompiler_dIr_dAnalysis_dfoldNeighborsPostFuel = (fun fuel adjT ms visited order -> (if (fuel <= 0) then { Base_dPair.f_Base_dPair_dPair_first = visited; Base_dPair.f_Base_dPair_dPair_second = order } else (match ms with
  | Base_dList.C_Base_dList_dList_Nil -> { Base_dPair.f_Base_dPair_dPair_first = visited; Base_dPair.f_Base_dPair_dPair_second = order }
  | Base_dList.C_Base_dList_dList_Cons (dtb__8, dtb__9) -> (if ((((Base_dHashMap.v_Base_dHashMap_dmember Base_dString.v_Hashable_uString) Base_dString.v_Eq_uString) dtb__8) visited) then (((((v_Vuna_dCompiler_dIr_dAnalysis_dfoldNeighborsPostFuel (fuel - 1)) adjT) dtb__9) visited) order) else (match (((((v_Vuna_dCompiler_dIr_dAnalysis_ddfsPostFuel (fuel - 1)) adjT) dtb__8) ((((Base_dHashMap.v_Base_dHashMap_dinsert Base_dString.v_Hashable_uString) dtb__8) true) visited)) order) with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__10; Base_dPair.f_Base_dPair_dPair_second = dtb__11 } -> (((((v_Vuna_dCompiler_dIr_dAnalysis_dfoldNeighborsPostFuel (fuel - 1)) adjT) dtb__9) dtb__10) dtb__11)
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
)))
# 59 "Vuna/Compiler/Ir/Analysis.vuna"
and v_Vuna_dCompiler_dIr_dAnalysis_ddfsPostFuel = (fun fuel adjT n visited order -> (if (fuel <= 0) then { Base_dPair.f_Base_dPair_dPair_first = visited; Base_dPair.f_Base_dPair_dPair_second = order } else (match (((((v_Vuna_dCompiler_dIr_dAnalysis_dfoldNeighborsPostFuel (fuel - 1)) adjT) ((v_Vuna_dCompiler_dIr_dAnalysis_dneighborsOf adjT) n)) visited) order) with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__12; Base_dPair.f_Base_dPair_dPair_second = dtb__13 } -> { Base_dPair.f_Base_dPair_dPair_first = dtb__12; Base_dPair.f_Base_dPair_dPair_second = (Base_dList.C_Base_dList_dList_Cons (n, dtb__13)) }
  | _ -> failwith "DT: impossible branch"
)))

# 45 "Vuna/Compiler/Ir/Analysis.vuna"
let v_Vuna_dCompiler_dIr_dAnalysis_dfoldNeighborsPost = (fun adjT ms visited order -> (((((v_Vuna_dCompiler_dIr_dAnalysis_dfoldNeighborsPostFuel 100000) adjT) ms) visited) order))

# 56 "Vuna/Compiler/Ir/Analysis.vuna"
let v_Vuna_dCompiler_dIr_dAnalysis_ddfsPost = (fun adjT n visited order -> (((((v_Vuna_dCompiler_dIr_dAnalysis_ddfsPostFuel 100000) adjT) n) visited) order))

# 64 "Vuna/Compiler/Ir/Analysis.vuna"
let rec v_Vuna_dCompiler_dIr_dAnalysis_dpostOrder = (fun mc0 mc1 mc2 mc3 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__14, dtb__15) -> (if ((((Base_dHashMap.v_Base_dHashMap_dmember Base_dString.v_Hashable_uString) Base_dString.v_Eq_uString) dtb__14) mc2) then ((((v_Vuna_dCompiler_dIr_dAnalysis_dpostOrder mc0) dtb__15) mc2) mc3) else (match ((((v_Vuna_dCompiler_dIr_dAnalysis_ddfsPost mc0) dtb__14) ((((Base_dHashMap.v_Base_dHashMap_dinsert Base_dString.v_Hashable_uString) dtb__14) true) mc2)) mc3) with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__16; Base_dPair.f_Base_dPair_dPair_second = dtb__17 } -> ((((v_Vuna_dCompiler_dIr_dAnalysis_dpostOrder mc0) dtb__15) dtb__16) dtb__17)
  | _ -> failwith "DT: impossible branch"
))
  | Base_dList.C_Base_dList_dList_Nil -> { Base_dPair.f_Base_dPair_dPair_first = mc2; Base_dPair.f_Base_dPair_dPair_second = mc3 }
  | _ -> failwith "DT: impossible branch"
))

# 76 "Vuna/Compiler/Ir/Analysis.vuna"
let rec v_Vuna_dCompiler_dIr_dAnalysis_dfoldNeighborsCollectFuel = (fun fuel adjT ms visited comp -> (if (fuel <= 0) then { Base_dPair.f_Base_dPair_dPair_first = visited; Base_dPair.f_Base_dPair_dPair_second = comp } else (match ms with
  | Base_dList.C_Base_dList_dList_Nil -> { Base_dPair.f_Base_dPair_dPair_first = visited; Base_dPair.f_Base_dPair_dPair_second = comp }
  | Base_dList.C_Base_dList_dList_Cons (dtb__18, dtb__19) -> (if ((((Base_dHashMap.v_Base_dHashMap_dmember Base_dString.v_Hashable_uString) Base_dString.v_Eq_uString) dtb__18) visited) then (((((v_Vuna_dCompiler_dIr_dAnalysis_dfoldNeighborsCollectFuel (fuel - 1)) adjT) dtb__19) visited) comp) else (match (((((v_Vuna_dCompiler_dIr_dAnalysis_ddfsCollectFuel (fuel - 1)) adjT) dtb__18) ((((Base_dHashMap.v_Base_dHashMap_dinsert Base_dString.v_Hashable_uString) dtb__18) true) visited)) comp) with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__20; Base_dPair.f_Base_dPair_dPair_second = dtb__21 } -> (((((v_Vuna_dCompiler_dIr_dAnalysis_dfoldNeighborsCollectFuel (fuel - 1)) adjT) dtb__19) dtb__20) dtb__21)
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
)))
# 87 "Vuna/Compiler/Ir/Analysis.vuna"
and v_Vuna_dCompiler_dIr_dAnalysis_ddfsCollectFuel = (fun fuel adjT n visited comp -> (if (fuel <= 0) then { Base_dPair.f_Base_dPair_dPair_first = visited; Base_dPair.f_Base_dPair_dPair_second = comp } else (match (((((v_Vuna_dCompiler_dIr_dAnalysis_dfoldNeighborsCollectFuel (fuel - 1)) adjT) ((v_Vuna_dCompiler_dIr_dAnalysis_dneighborsOf adjT) n)) visited) comp) with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__22; Base_dPair.f_Base_dPair_dPair_second = dtb__23 } -> { Base_dPair.f_Base_dPair_dPair_first = dtb__22; Base_dPair.f_Base_dPair_dPair_second = (Base_dList.C_Base_dList_dList_Cons (n, dtb__23)) }
  | _ -> failwith "DT: impossible branch"
)))

# 73 "Vuna/Compiler/Ir/Analysis.vuna"
let v_Vuna_dCompiler_dIr_dAnalysis_dfoldNeighborsCollect = (fun adjT ms visited comp -> (((((v_Vuna_dCompiler_dIr_dAnalysis_dfoldNeighborsCollectFuel 100000) adjT) ms) visited) comp))

# 84 "Vuna/Compiler/Ir/Analysis.vuna"
let v_Vuna_dCompiler_dIr_dAnalysis_ddfsCollect = (fun adjT n visited comp -> (((((v_Vuna_dCompiler_dIr_dAnalysis_ddfsCollectFuel 100000) adjT) n) visited) comp))

# 92 "Vuna/Compiler/Ir/Analysis.vuna"
let rec v_Vuna_dCompiler_dIr_dAnalysis_dcollectComps = (fun mc0 mc1 mc2 mc3 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__24, dtb__25) -> (if ((((Base_dHashMap.v_Base_dHashMap_dmember Base_dString.v_Hashable_uString) Base_dString.v_Eq_uString) dtb__24) mc2) then ((((v_Vuna_dCompiler_dIr_dAnalysis_dcollectComps mc0) dtb__25) mc2) mc3) else (match ((((v_Vuna_dCompiler_dIr_dAnalysis_ddfsCollect mc0) dtb__24) ((((Base_dHashMap.v_Base_dHashMap_dinsert Base_dString.v_Hashable_uString) dtb__24) true) mc2)) Base_dList.C_Base_dList_dList_Nil) with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__26; Base_dPair.f_Base_dPair_dPair_second = dtb__27 } -> ((((v_Vuna_dCompiler_dIr_dAnalysis_dcollectComps mc0) dtb__25) dtb__26) (Base_dList.C_Base_dList_dList_Cons (dtb__27, mc3)))
  | _ -> failwith "DT: impossible branch"
))
  | Base_dList.C_Base_dList_dList_Nil -> mc3
  | _ -> failwith "DT: impossible branch"
))

# 99 "Vuna/Compiler/Ir/Analysis.vuna"
let v_Vuna_dCompiler_dIr_dAnalysis_dcomponentTblOf = (fun comps -> (((Base_dHashMap.v_Base_dHashMap_dinsertAll Base_dString.v_Hashable_uString) ((Base_dList.v_Base_dList_dconcatMap (fun g -> ((Base_dList.v_Base_dList_dmap (fun n -> { Base_dPair.f_Base_dPair_dPair_first = n; Base_dPair.f_Base_dPair_dPair_second = g })) g))) comps)) ((Base_dHashMap.v_Base_dHashMap_dfromList Base_dString.v_Hashable_uString) Base_dList.C_Base_dList_dList_Nil)))

# 103 "Vuna/Compiler/Ir/Analysis.vuna"
let rec v_Vuna_dCompiler_dIr_dAnalysis_daddAllNames = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__28, dtb__29) -> ((v_Vuna_dCompiler_dIr_dAnalysis_daddAllNames dtb__29) ((((Base_dHashMap.v_Base_dHashMap_dinsert Base_dString.v_Hashable_uString) dtb__28) true) mc1))
  | Base_dList.C_Base_dList_dList_Nil -> mc1
  | _ -> failwith "DT: impossible branch"
))

# 129 "Vuna/Compiler/Ir/Analysis.vuna"
let rec v_Vuna_dCompiler_dIr_dAnalysis_dfilterNames = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__30, dtb__31) -> (if (mc0 dtb__30) then (Base_dList.C_Base_dList_dList_Cons (dtb__30, ((v_Vuna_dCompiler_dIr_dAnalysis_dfilterNames mc0) dtb__31))) else ((v_Vuna_dCompiler_dIr_dAnalysis_dfilterNames mc0) dtb__31))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 122 "Vuna/Compiler/Ir/Analysis.vuna"
let v_Vuna_dCompiler_dIr_dAnalysis_dgroupOf = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__32, dtb__33) -> (match dtb__33 with
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dList.C_Base_dList_dList_Cons (dtb__32, Base_dList.C_Base_dList_dList_Nil))
  | _ -> ((fun memberTbl -> ((v_Vuna_dCompiler_dIr_dAnalysis_dfilterNames (fun m -> ((((Base_dHashMap.v_Base_dHashMap_dmember Base_dString.v_Hashable_uString) Base_dString.v_Eq_uString) m) memberTbl))) mc0)) (Base_dHashMap.v_Base_dHashMap_dofNames mc1))
)
  | _ -> ((fun memberTbl -> ((v_Vuna_dCompiler_dIr_dAnalysis_dfilterNames (fun m -> ((((Base_dHashMap.v_Base_dHashMap_dmember Base_dString.v_Hashable_uString) Base_dString.v_Eq_uString) m) memberTbl))) mc0)) (Base_dHashMap.v_Base_dHashMap_dofNames mc1))
))

# 112 "Vuna/Compiler/Ir/Analysis.vuna"
let rec v_Vuna_dCompiler_dIr_dAnalysis_dgroupsFromCompsGo = (fun mc0 mc1 mc2 mc3 -> (match mc2 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__34, dtb__35) -> (if ((((Base_dHashMap.v_Base_dHashMap_dmember Base_dString.v_Hashable_uString) Base_dString.v_Eq_uString) dtb__34) mc3) then ((((v_Vuna_dCompiler_dIr_dAnalysis_dgroupsFromCompsGo mc0) mc1) dtb__35) mc3) else (match ((((Base_dHashMap.v_Base_dHashMap_dlookup Base_dString.v_Hashable_uString) Base_dString.v_Eq_uString) dtb__34) mc0) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__36) -> (Base_dList.C_Base_dList_dList_Cons (((v_Vuna_dCompiler_dIr_dAnalysis_dgroupOf mc1) dtb__36), ((((v_Vuna_dCompiler_dIr_dAnalysis_dgroupsFromCompsGo mc0) mc1) dtb__35) ((v_Vuna_dCompiler_dIr_dAnalysis_daddAllNames dtb__36) mc3))))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((((v_Vuna_dCompiler_dIr_dAnalysis_dgroupsFromCompsGo mc0) mc1) dtb__35) mc3)
  | _ -> failwith "DT: impossible branch"
))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 108 "Vuna/Compiler/Ir/Analysis.vuna"
let v_Vuna_dCompiler_dIr_dAnalysis_dgroupsFromComps = (fun comps names -> ((((v_Vuna_dCompiler_dIr_dAnalysis_dgroupsFromCompsGo (v_Vuna_dCompiler_dIr_dAnalysis_dcomponentTblOf comps)) names) names) ((Base_dHashMap.v_Base_dHashMap_dfromList Base_dString.v_Hashable_uString) Base_dList.C_Base_dList_dList_Nil)))

# 134 "Vuna/Compiler/Ir/Analysis.vuna"
let v_Vuna_dCompiler_dIr_dAnalysis_dnotIn = (fun name names -> (Base_dBool.v_Base_dBool_dnot ((Base_dList.v_Base_dList_dmemName name) names)))

# 137 "Vuna/Compiler/Ir/Analysis.vuna"
let rec v_Vuna_dCompiler_dIr_dAnalysis_duniqueNames = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__37, dtb__38) -> (if (dtb__37 = "") then (v_Vuna_dCompiler_dIr_dAnalysis_duniqueNames dtb__38) else (if ((Base_dList.v_Base_dList_dmemName dtb__37) dtb__38) then (v_Vuna_dCompiler_dIr_dAnalysis_duniqueNames dtb__38) else (Base_dList.C_Base_dList_dList_Cons (dtb__37, (v_Vuna_dCompiler_dIr_dAnalysis_duniqueNames dtb__38)))))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 143 "Vuna/Compiler/Ir/Analysis.vuna"
let v_Vuna_dCompiler_dIr_dAnalysis_dgroupDeps = (fun adjT group -> ((v_Vuna_dCompiler_dIr_dAnalysis_dfilterNames (fun n -> ((v_Vuna_dCompiler_dIr_dAnalysis_dnotIn n) group))) (v_Vuna_dCompiler_dIr_dAnalysis_duniqueNames ((Base_dList.v_Base_dList_dconcatMap (v_Vuna_dCompiler_dIr_dAnalysis_dneighborsOf adjT)) group))))

# 147 "Vuna/Compiler/Ir/Analysis.vuna"
let rec v_Vuna_dCompiler_dIr_dAnalysis_dallIn = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__39, dtb__40) -> (if ((((Base_dHashMap.v_Base_dHashMap_dmember Base_dString.v_Hashable_uString) Base_dString.v_Eq_uString) dtb__39) mc1) then ((v_Vuna_dCompiler_dIr_dAnalysis_dallIn dtb__40) mc1) else false)
  | Base_dList.C_Base_dList_dList_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

# 151 "Vuna/Compiler/Ir/Analysis.vuna"
let v_Vuna_dCompiler_dIr_dAnalysis_dgroupReady = (fun adjT group emitted -> ((v_Vuna_dCompiler_dIr_dAnalysis_dallIn ((v_Vuna_dCompiler_dIr_dAnalysis_dgroupDeps adjT) group)) emitted))

# 157 "Vuna/Compiler/Ir/Analysis.vuna"
let rec v_Vuna_dCompiler_dIr_dAnalysis_dpickReadyAcc = (fun mc0 mc1 mc2 mc3 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__41, dtb__42) -> (if (((v_Vuna_dCompiler_dIr_dAnalysis_dgroupReady mc0) dtb__41) mc3) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Base_dPair.f_Base_dPair_dPair_first = dtb__41; Base_dPair.f_Base_dPair_dPair_second = ((Base_dList.v_Base_dList_dappend (Base_dList.v_Base_dList_dreverse mc2)) dtb__42) })) else ((((v_Vuna_dCompiler_dIr_dAnalysis_dpickReadyAcc mc0) dtb__42) (Base_dList.C_Base_dList_dList_Cons (dtb__41, mc2))) mc3))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 154 "Vuna/Compiler/Ir/Analysis.vuna"
let v_Vuna_dCompiler_dIr_dAnalysis_dpickReady = (fun adjT groups emitted -> ((((v_Vuna_dCompiler_dIr_dAnalysis_dpickReadyAcc adjT) groups) Base_dList.C_Base_dList_dList_Nil) emitted))

# 170 "Vuna/Compiler/Ir/Analysis.vuna"
let rec v_Vuna_dCompiler_dIr_dAnalysis_dorderGroupsAccFuel = (fun fuel adjT remaining emitted -> (if (fuel <= 0) then (Vuna_dCompiler_dDiagnostics_dCg.v_Vuna_dCompiler_dDiagnostics_dCg_dcgErr0 Vuna_dCompiler_dDiagnostics_dCg.C_Vuna_dCompiler_dDiagnostics_dCg_dCgErr_DependencyCycle) else (match remaining with
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (Base_dList.C_Base_dList_dList_Nil))
  | _ -> ((fun nd_uscrut4 -> (match nd_uscrut4 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__43) -> (match dtb__43 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__44; Base_dPair.f_Base_dPair_dPair_second = dtb__45 } -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((v_Vuna_dCompiler_dIr_dAnalysis_dorderGroupsAccFuel (fuel - 1)) adjT) dtb__45) ((v_Vuna_dCompiler_dIr_dAnalysis_daddAllNames dtb__44) emitted))) (fun tail -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ((Base_dList.C_Base_dList_dList_Cons (dtb__44, tail))))))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dDiagnostics_dCg.v_Vuna_dCompiler_dDiagnostics_dCg_dcgErr0 Vuna_dCompiler_dDiagnostics_dCg.C_Vuna_dCompiler_dDiagnostics_dCg_dCgErr_DependencyCycle)
  | _ -> failwith "DT: impossible branch"
)) (((v_Vuna_dCompiler_dIr_dAnalysis_dpickReady adjT) remaining) emitted))
)))

# 166 "Vuna/Compiler/Ir/Analysis.vuna"
let v_Vuna_dCompiler_dIr_dAnalysis_dorderGroupsAcc = (fun adjT remaining emitted -> ((((v_Vuna_dCompiler_dIr_dAnalysis_dorderGroupsAccFuel ((Base_dList.v_Base_dList_dlength remaining) + 1)) adjT) remaining) emitted))

# 163 "Vuna/Compiler/Ir/Analysis.vuna"
let v_Vuna_dCompiler_dIr_dAnalysis_dorderGroups = (fun adjT groups -> (((v_Vuna_dCompiler_dIr_dAnalysis_dorderGroupsAcc adjT) groups) ((Base_dHashMap.v_Base_dHashMap_dfromList Base_dString.v_Hashable_uString) Base_dList.C_Base_dList_dList_Nil)))

# 186 "Vuna/Compiler/Ir/Analysis.vuna"
let v_Vuna_dCompiler_dIr_dAnalysis_dgroupNames = (fun adj names -> ((fun nameTbl -> ((fun adj2 -> ((fun adjT -> ((fun revT -> (match ((((v_Vuna_dCompiler_dIr_dAnalysis_dpostOrder adjT) names) ((Base_dHashMap.v_Base_dHashMap_dfromList Base_dString.v_Hashable_uString) Base_dList.C_Base_dList_dList_Nil)) Base_dList.C_Base_dList_dList_Nil) with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__46; Base_dPair.f_Base_dPair_dPair_second = dtb__47 } -> ((fun comps -> ((fun groups -> ((v_Vuna_dCompiler_dIr_dAnalysis_dorderGroups adjT) groups)) ((v_Vuna_dCompiler_dIr_dAnalysis_dgroupsFromComps comps) names))) ((((v_Vuna_dCompiler_dIr_dAnalysis_dcollectComps revT) dtb__47) ((Base_dHashMap.v_Base_dHashMap_dfromList Base_dString.v_Hashable_uString) Base_dList.C_Base_dList_dList_Nil)) Base_dList.C_Base_dList_dList_Nil))
  | _ -> failwith "DT: impossible branch"
)) (v_Vuna_dCompiler_dIr_dAnalysis_dreverseAdjTbl adj2))) (v_Vuna_dCompiler_dIr_dAnalysis_dadjTblOf adj2))) ((Base_dList.v_Base_dList_dmap (fun p -> { Base_dPair.f_Base_dPair_dPair_first = (Base_dPair.v_Base_dPair_dfirstOf p); Base_dPair.f_Base_dPair_dPair_second = ((Base_dList.v_Base_dList_dfilter (fun n -> ((((Base_dHashMap.v_Base_dHashMap_dmember Base_dString.v_Hashable_uString) Base_dString.v_Eq_uString) n) nameTbl))) (Base_dPair.v_Base_dPair_dsecondOf p)) })) adj))) (Base_dHashMap.v_Base_dHashMap_dofNames names)))

# 202 "Vuna/Compiler/Ir/Analysis.vuna"
let v_Vuna_dCompiler_dIr_dAnalysis_dgroupNeedsRec = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__48, dtb__49) -> (match dtb__49 with
  | Base_dList.C_Base_dList_dList_Nil -> ((Base_dList.v_Base_dList_dmemName dtb__48) ((v_Vuna_dCompiler_dIr_dAnalysis_dneighborsOf mc0) dtb__48))
  | _ -> true
)
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 209 "Vuna/Compiler/Ir/Analysis.vuna"
let rec v_Vuna_dCompiler_dIr_dAnalysis_dfirstBadRecursiveValue = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__50, dtb__51) -> (if ((Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirDefArity dtb__50) = 0) then (if (Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirDefRecValueOk dtb__50) then (v_Vuna_dCompiler_dIr_dAnalysis_dfirstBadRecursiveValue dtb__51) else (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirDefName dtb__50)))) else (v_Vuna_dCompiler_dIr_dAnalysis_dfirstBadRecursiveValue dtb__51))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 215 "Vuna/Compiler/Ir/Analysis.vuna"
let rec v_Vuna_dCompiler_dIr_dAnalysis_dfindDefByName = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__52, dtb__53) -> (if ((Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirDefName dtb__52) = mc0) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__52)) else ((v_Vuna_dCompiler_dIr_dAnalysis_dfindDefByName mc0) dtb__53))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 219 "Vuna/Compiler/Ir/Analysis.vuna"
let rec v_Vuna_dCompiler_dIr_dAnalysis_dgroupDefsOf = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__54, dtb__55) -> (match ((v_Vuna_dCompiler_dIr_dAnalysis_dfindDefByName dtb__54) mc0) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((v_Vuna_dCompiler_dIr_dAnalysis_dgroupDefsOf mc0) dtb__55)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__56) -> (Base_dList.C_Base_dList_dList_Cons (dtb__56, ((v_Vuna_dCompiler_dIr_dAnalysis_dgroupDefsOf mc0) dtb__55)))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 227 "Vuna/Compiler/Ir/Analysis.vuna"
let rec v_Vuna_dCompiler_dIr_dAnalysis_dassembleGroups = (fun mc0 mc1 mc2 -> (match mc2 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__57, dtb__58) -> ((fun members -> ((fun isRec -> ((fun checked -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind checked) (fun grp -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((v_Vuna_dCompiler_dIr_dAnalysis_dassembleGroups mc0) mc1) dtb__58)) (fun tail -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ((Base_dList.C_Base_dList_dList_Cons (grp, tail))))))))) (if isRec then (match (v_Vuna_dCompiler_dIr_dAnalysis_dfirstBadRecursiveValue members) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__59) -> (match ((v_Vuna_dCompiler_dIr_dAnalysis_dfindDefByName dtb__59) members) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__60) -> ((((Vuna_dCompiler_dDiagnostics_dCg.v_Vuna_dCompiler_dDiagnostics_dCg_dcgErrDefAt (Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirDefSpan dtb__60)) dtb__59) (Vuna_dCompiler_dDiagnostics_dCg.C_Vuna_dCompiler_dDiagnostics_dCg_dCgErr_RecursiveValueDefinition (dtb__59))) (Base_dVec.C_Base_dVec_dVec_Cons (dtb__59, Base_dVec.C_Base_dVec_dVec_Nil)))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((Vuna_dCompiler_dDiagnostics_dCg.v_Vuna_dCompiler_dDiagnostics_dCg_dcgErr1 (Vuna_dCompiler_dDiagnostics_dCg.C_Vuna_dCompiler_dDiagnostics_dCg_dCgErr_RecursiveValueDefinition (dtb__59))) dtb__59)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrGroup_irGroupIsRec = true; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrGroup_irGroupDefs = members }))
  | _ -> failwith "DT: impossible branch"
) else (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrGroup_irGroupIsRec = false; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrGroup_irGroupDefs = members }))))) ((v_Vuna_dCompiler_dIr_dAnalysis_dgroupNeedsRec mc0) dtb__57))) ((v_Vuna_dCompiler_dIr_dAnalysis_dgroupDefsOf mc1) dtb__57))
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (Base_dList.C_Base_dList_dList_Nil))
  | _ -> failwith "DT: impossible branch"
))

# 250 "Vuna/Compiler/Ir/Analysis.vuna"
let rec v_Vuna_dCompiler_dIr_dAnalysis_dcheckUniqueDefNamesGo = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__61, dtb__62) -> (if ((((Base_dHashMap.v_Base_dHashMap_dmember Base_dString.v_Hashable_uString) Base_dString.v_Eq_uString) dtb__61) mc1) then (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicInternal (String.concat "" ["duplicate runtime definition name in IR: `"; dtb__61; "`"])) else ((v_Vuna_dCompiler_dIr_dAnalysis_dcheckUniqueDefNamesGo dtb__62) ((((Base_dHashMap.v_Base_dHashMap_dinsert Base_dString.v_Hashable_uString) dtb__61) true) mc1)))
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (0))
  | _ -> failwith "DT: impossible branch"
))

# 247 "Vuna/Compiler/Ir/Analysis.vuna"
let v_Vuna_dCompiler_dIr_dAnalysis_dcheckUniqueDefNames = (fun defs -> ((v_Vuna_dCompiler_dIr_dAnalysis_dcheckUniqueDefNamesGo ((Base_dList.v_Base_dList_dmap Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirDefName) defs)) ((Base_dHashMap.v_Base_dHashMap_dfromList Base_dString.v_Hashable_uString) Base_dList.C_Base_dList_dList_Nil)))

# 281 "Vuna/Compiler/Ir/Analysis.vuna"
let rec v_Vuna_dCompiler_dIr_dAnalysis_dfirstBadRecName = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__63, dtb__64) -> (if (mc1 dtb__63) then ((v_Vuna_dCompiler_dIr_dAnalysis_dfirstBadRecName dtb__64) mc1) else (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__63)))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 269 "Vuna/Compiler/Ir/Analysis.vuna"
let rec v_Vuna_dCompiler_dIr_dAnalysis_dassembleGo = (fun mc0 mc1 mc2 mc3 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__65, dtb__66) -> ((fun isRec -> ((fun checked -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind checked) (fun grp -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((v_Vuna_dCompiler_dIr_dAnalysis_dassembleGo mc0) dtb__66) mc2) mc3)) (fun tail -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ((Base_dList.C_Base_dList_dList_Cons (grp, tail))))))))) (if isRec then (match ((v_Vuna_dCompiler_dIr_dAnalysis_dfirstBadRecName dtb__65) mc2) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__67) -> ((((Vuna_dCompiler_dDiagnostics_dCg.v_Vuna_dCompiler_dDiagnostics_dCg_dcgErrDefAt (mc3 dtb__67)) dtb__67) (Vuna_dCompiler_dDiagnostics_dCg.C_Vuna_dCompiler_dDiagnostics_dCg_dCgErr_RecursiveValueDefinition (dtb__67))) (Base_dVec.C_Base_dVec_dVec_Cons (dtb__67, Base_dVec.C_Base_dVec_dVec_Nil)))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = true; Base_dPair.f_Base_dPair_dPair_second = dtb__65 }))
  | _ -> failwith "DT: impossible branch"
) else (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = false; Base_dPair.f_Base_dPair_dPair_second = dtb__65 }))))) ((v_Vuna_dCompiler_dIr_dAnalysis_dgroupNeedsRec mc0) dtb__65))
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (Base_dList.C_Base_dList_dList_Nil))
  | _ -> failwith "DT: impossible branch"
))

# 265 "Vuna/Compiler/Ir/Analysis.vuna"
let v_Vuna_dCompiler_dIr_dAnalysis_dgroupNamesGo = (fun mc0 mc1 mc2 mc3 mc4 -> (match mc2 with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__68) -> ((((v_Vuna_dCompiler_dIr_dAnalysis_dassembleGo mc0) dtb__68) mc3) mc4)
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__69) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__69))
  | _ -> failwith "DT: impossible branch"
))

# 261 "Vuna/Compiler/Ir/Analysis.vuna"
let v_Vuna_dCompiler_dIr_dAnalysis_dassembleGroupNames = (fun adj names recOk spanOf -> (((((v_Vuna_dCompiler_dIr_dAnalysis_dgroupNamesGo (v_Vuna_dCompiler_dIr_dAnalysis_dadjTblOf adj)) names) ((v_Vuna_dCompiler_dIr_dAnalysis_dgroupNames adj) names)) recOk) spanOf))
