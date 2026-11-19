open Vuna_runtime
# 22 "Vuna/Compiler/Ir/Analysis.vuna"
let v_Vuna_dCompiler_dIr_dAnalysis_dneighborsOf = (fun (adjT : (string, string Base_dData_dList.t_Base_dData_dList_dList) Base_dContainer_dHashMap.t_Base_dContainer_dHashMap_dHashMap) (name : string) -> (match ((((Base_dContainer_dHashMap.v_Base_dContainer_dHashMap_dlookup Base_dData_dString.v_Hashable_uString) Base_dData_dString.v_Eq_uString) name) adjT) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__0) -> dtb__0
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 28 "Vuna/Compiler/Ir/Analysis.vuna"
let v_Vuna_dCompiler_dIr_dAnalysis_dadjTblOf = (fun (adj : (string, string Base_dData_dList.t_Base_dData_dList_dList) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) -> (((Base_dContainer_dHashMap.v_Base_dContainer_dHashMap_dinsertAll Base_dData_dString.v_Hashable_uString) adj) ((Base_dContainer_dHashMap.v_Base_dContainer_dHashMap_dfromList Base_dData_dString.v_Hashable_uString) Base_dData_dList.C_Base_dData_dList_dList_Nil)))

# 31 "Vuna/Compiler/Ir/Analysis.vuna"
let rec v_Vuna_dCompiler_dIr_dAnalysis_daddDependents = (fun (mc0 : string) (mc1 : string Base_dData_dList.t_Base_dData_dList_dList) (mc2 : (string, string Base_dData_dList.t_Base_dData_dList_dList) Base_dContainer_dHashMap.t_Base_dContainer_dHashMap_dHashMap) -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__1, dtb__2) -> ((fun cur -> (((v_Vuna_dCompiler_dIr_dAnalysis_daddDependents mc0) dtb__2) ((((Base_dContainer_dHashMap.v_Base_dContainer_dHashMap_dinsert Base_dData_dString.v_Hashable_uString) dtb__1) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (mc0, cur))) mc2))) (match ((((Base_dContainer_dHashMap.v_Base_dContainer_dHashMap_dlookup Base_dData_dString.v_Hashable_uString) Base_dData_dString.v_Eq_uString) dtb__1) mc2) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__3) -> dtb__3
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> mc2
  | _ -> failwith "DT: impossible branch"
))

# 41 "Vuna/Compiler/Ir/Analysis.vuna"
let rec v_Vuna_dCompiler_dIr_dAnalysis_dreverseAdjTbl = (fun (mc0 : (string, string Base_dData_dList.t_Base_dData_dList_dList) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__4, dtb__5) -> (match dtb__4 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__6; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__7 } -> (((v_Vuna_dCompiler_dIr_dAnalysis_daddDependents dtb__6) dtb__7) (v_Vuna_dCompiler_dIr_dAnalysis_dreverseAdjTbl dtb__5))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> ((Base_dContainer_dHashMap.v_Base_dContainer_dHashMap_dfromList Base_dData_dString.v_Hashable_uString) Base_dData_dList.C_Base_dData_dList_dList_Nil)
  | _ -> failwith "DT: impossible branch"
))

# 51 "Vuna/Compiler/Ir/Analysis.vuna"
let rec v_Vuna_dCompiler_dIr_dAnalysis_dfoldNeighborsPostFuel = (fun (fuel : int) (adjT : (string, string Base_dData_dList.t_Base_dData_dList_dList) Base_dContainer_dHashMap.t_Base_dContainer_dHashMap_dHashMap) (ms : string Base_dData_dList.t_Base_dData_dList_dList) (visited : (string, bool) Base_dContainer_dHashMap.t_Base_dContainer_dHashMap_dHashMap) (order : string Base_dData_dList.t_Base_dData_dList_dList) -> (if (fuel <= 0) then { Base_dData_dPair.f_Base_dData_dPair_dPair_first = visited; Base_dData_dPair.f_Base_dData_dPair_dPair_second = order } else (match ms with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> { Base_dData_dPair.f_Base_dData_dPair_dPair_first = visited; Base_dData_dPair.f_Base_dData_dPair_dPair_second = order }
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__8, dtb__9) -> (if ((((Base_dContainer_dHashMap.v_Base_dContainer_dHashMap_dmember Base_dData_dString.v_Hashable_uString) Base_dData_dString.v_Eq_uString) dtb__8) visited) then (((((v_Vuna_dCompiler_dIr_dAnalysis_dfoldNeighborsPostFuel (fuel - 1)) adjT) dtb__9) visited) order) else (match (((((v_Vuna_dCompiler_dIr_dAnalysis_ddfsPostFuel (fuel - 1)) adjT) dtb__8) ((((Base_dContainer_dHashMap.v_Base_dContainer_dHashMap_dinsert Base_dData_dString.v_Hashable_uString) dtb__8) true) visited)) order) with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__10; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__11 } -> (((((v_Vuna_dCompiler_dIr_dAnalysis_dfoldNeighborsPostFuel (fuel - 1)) adjT) dtb__9) dtb__10) dtb__11)
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
)))
# 68 "Vuna/Compiler/Ir/Analysis.vuna"
and v_Vuna_dCompiler_dIr_dAnalysis_ddfsPostFuel = (fun (fuel : int) (adjT : (string, string Base_dData_dList.t_Base_dData_dList_dList) Base_dContainer_dHashMap.t_Base_dContainer_dHashMap_dHashMap) (n : string) (visited : (string, bool) Base_dContainer_dHashMap.t_Base_dContainer_dHashMap_dHashMap) (order : string Base_dData_dList.t_Base_dData_dList_dList) -> (if (fuel <= 0) then { Base_dData_dPair.f_Base_dData_dPair_dPair_first = visited; Base_dData_dPair.f_Base_dData_dPair_dPair_second = order } else (match (((((v_Vuna_dCompiler_dIr_dAnalysis_dfoldNeighborsPostFuel (fuel - 1)) adjT) ((v_Vuna_dCompiler_dIr_dAnalysis_dneighborsOf adjT) n)) visited) order) with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__12; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__13 } -> { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__12; Base_dData_dPair.f_Base_dData_dPair_dPair_second = (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (n, dtb__13)) }
  | _ -> failwith "DT: impossible branch"
)))

# 48 "Vuna/Compiler/Ir/Analysis.vuna"
let v_Vuna_dCompiler_dIr_dAnalysis_dfoldNeighborsPost = (fun (adjT : (string, string Base_dData_dList.t_Base_dData_dList_dList) Base_dContainer_dHashMap.t_Base_dContainer_dHashMap_dHashMap) (ms : string Base_dData_dList.t_Base_dData_dList_dList) (visited : (string, bool) Base_dContainer_dHashMap.t_Base_dContainer_dHashMap_dHashMap) (order : string Base_dData_dList.t_Base_dData_dList_dList) -> (((((v_Vuna_dCompiler_dIr_dAnalysis_dfoldNeighborsPostFuel 100000) adjT) ms) visited) order))

# 65 "Vuna/Compiler/Ir/Analysis.vuna"
let v_Vuna_dCompiler_dIr_dAnalysis_ddfsPost = (fun (adjT : (string, string Base_dData_dList.t_Base_dData_dList_dList) Base_dContainer_dHashMap.t_Base_dContainer_dHashMap_dHashMap) (n : string) (visited : (string, bool) Base_dContainer_dHashMap.t_Base_dContainer_dHashMap_dHashMap) (order : string Base_dData_dList.t_Base_dData_dList_dList) -> (((((v_Vuna_dCompiler_dIr_dAnalysis_ddfsPostFuel 100000) adjT) n) visited) order))

# 76 "Vuna/Compiler/Ir/Analysis.vuna"
let rec v_Vuna_dCompiler_dIr_dAnalysis_dpostOrder = (fun (mc0 : (string, string Base_dData_dList.t_Base_dData_dList_dList) Base_dContainer_dHashMap.t_Base_dContainer_dHashMap_dHashMap) (mc1 : string Base_dData_dList.t_Base_dData_dList_dList) (mc2 : (string, bool) Base_dContainer_dHashMap.t_Base_dContainer_dHashMap_dHashMap) (mc3 : string Base_dData_dList.t_Base_dData_dList_dList) -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__14, dtb__15) -> (if ((((Base_dContainer_dHashMap.v_Base_dContainer_dHashMap_dmember Base_dData_dString.v_Hashable_uString) Base_dData_dString.v_Eq_uString) dtb__14) mc2) then ((((v_Vuna_dCompiler_dIr_dAnalysis_dpostOrder mc0) dtb__15) mc2) mc3) else (match ((((v_Vuna_dCompiler_dIr_dAnalysis_ddfsPost mc0) dtb__14) ((((Base_dContainer_dHashMap.v_Base_dContainer_dHashMap_dinsert Base_dData_dString.v_Hashable_uString) dtb__14) true) mc2)) mc3) with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__16; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__17 } -> ((((v_Vuna_dCompiler_dIr_dAnalysis_dpostOrder mc0) dtb__15) dtb__16) dtb__17)
  | _ -> failwith "DT: impossible branch"
))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> { Base_dData_dPair.f_Base_dData_dPair_dPair_first = mc2; Base_dData_dPair.f_Base_dData_dPair_dPair_second = mc3 }
  | _ -> failwith "DT: impossible branch"
))

# 91 "Vuna/Compiler/Ir/Analysis.vuna"
let rec v_Vuna_dCompiler_dIr_dAnalysis_dfoldNeighborsCollectFuel = (fun (fuel : int) (adjT : (string, string Base_dData_dList.t_Base_dData_dList_dList) Base_dContainer_dHashMap.t_Base_dContainer_dHashMap_dHashMap) (ms : string Base_dData_dList.t_Base_dData_dList_dList) (visited : (string, bool) Base_dContainer_dHashMap.t_Base_dContainer_dHashMap_dHashMap) (comp : string Base_dData_dList.t_Base_dData_dList_dList) -> (if (fuel <= 0) then { Base_dData_dPair.f_Base_dData_dPair_dPair_first = visited; Base_dData_dPair.f_Base_dData_dPair_dPair_second = comp } else (match ms with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> { Base_dData_dPair.f_Base_dData_dPair_dPair_first = visited; Base_dData_dPair.f_Base_dData_dPair_dPair_second = comp }
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__18, dtb__19) -> (if ((((Base_dContainer_dHashMap.v_Base_dContainer_dHashMap_dmember Base_dData_dString.v_Hashable_uString) Base_dData_dString.v_Eq_uString) dtb__18) visited) then (((((v_Vuna_dCompiler_dIr_dAnalysis_dfoldNeighborsCollectFuel (fuel - 1)) adjT) dtb__19) visited) comp) else (match (((((v_Vuna_dCompiler_dIr_dAnalysis_ddfsCollectFuel (fuel - 1)) adjT) dtb__18) ((((Base_dContainer_dHashMap.v_Base_dContainer_dHashMap_dinsert Base_dData_dString.v_Hashable_uString) dtb__18) true) visited)) comp) with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__20; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__21 } -> (((((v_Vuna_dCompiler_dIr_dAnalysis_dfoldNeighborsCollectFuel (fuel - 1)) adjT) dtb__19) dtb__20) dtb__21)
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
)))
# 108 "Vuna/Compiler/Ir/Analysis.vuna"
and v_Vuna_dCompiler_dIr_dAnalysis_ddfsCollectFuel = (fun (fuel : int) (adjT : (string, string Base_dData_dList.t_Base_dData_dList_dList) Base_dContainer_dHashMap.t_Base_dContainer_dHashMap_dHashMap) (n : string) (visited : (string, bool) Base_dContainer_dHashMap.t_Base_dContainer_dHashMap_dHashMap) (comp : string Base_dData_dList.t_Base_dData_dList_dList) -> (if (fuel <= 0) then { Base_dData_dPair.f_Base_dData_dPair_dPair_first = visited; Base_dData_dPair.f_Base_dData_dPair_dPair_second = comp } else (match (((((v_Vuna_dCompiler_dIr_dAnalysis_dfoldNeighborsCollectFuel (fuel - 1)) adjT) ((v_Vuna_dCompiler_dIr_dAnalysis_dneighborsOf adjT) n)) visited) comp) with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__22; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__23 } -> { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__22; Base_dData_dPair.f_Base_dData_dPair_dPair_second = (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (n, dtb__23)) }
  | _ -> failwith "DT: impossible branch"
)))

# 88 "Vuna/Compiler/Ir/Analysis.vuna"
let v_Vuna_dCompiler_dIr_dAnalysis_dfoldNeighborsCollect = (fun (adjT : (string, string Base_dData_dList.t_Base_dData_dList_dList) Base_dContainer_dHashMap.t_Base_dContainer_dHashMap_dHashMap) (ms : string Base_dData_dList.t_Base_dData_dList_dList) (visited : (string, bool) Base_dContainer_dHashMap.t_Base_dContainer_dHashMap_dHashMap) (comp : string Base_dData_dList.t_Base_dData_dList_dList) -> (((((v_Vuna_dCompiler_dIr_dAnalysis_dfoldNeighborsCollectFuel 100000) adjT) ms) visited) comp))

# 105 "Vuna/Compiler/Ir/Analysis.vuna"
let v_Vuna_dCompiler_dIr_dAnalysis_ddfsCollect = (fun (adjT : (string, string Base_dData_dList.t_Base_dData_dList_dList) Base_dContainer_dHashMap.t_Base_dContainer_dHashMap_dHashMap) (n : string) (visited : (string, bool) Base_dContainer_dHashMap.t_Base_dContainer_dHashMap_dHashMap) (comp : string Base_dData_dList.t_Base_dData_dList_dList) -> (((((v_Vuna_dCompiler_dIr_dAnalysis_ddfsCollectFuel 100000) adjT) n) visited) comp))

# 116 "Vuna/Compiler/Ir/Analysis.vuna"
let rec v_Vuna_dCompiler_dIr_dAnalysis_dcollectComps = (fun (mc0 : (string, string Base_dData_dList.t_Base_dData_dList_dList) Base_dContainer_dHashMap.t_Base_dContainer_dHashMap_dHashMap) (mc1 : string Base_dData_dList.t_Base_dData_dList_dList) (mc2 : (string, bool) Base_dContainer_dHashMap.t_Base_dContainer_dHashMap_dHashMap) (mc3 : string Base_dData_dList.t_Base_dData_dList_dList Base_dData_dList.t_Base_dData_dList_dList) -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__24, dtb__25) -> (if ((((Base_dContainer_dHashMap.v_Base_dContainer_dHashMap_dmember Base_dData_dString.v_Hashable_uString) Base_dData_dString.v_Eq_uString) dtb__24) mc2) then ((((v_Vuna_dCompiler_dIr_dAnalysis_dcollectComps mc0) dtb__25) mc2) mc3) else (match ((((v_Vuna_dCompiler_dIr_dAnalysis_ddfsCollect mc0) dtb__24) ((((Base_dContainer_dHashMap.v_Base_dContainer_dHashMap_dinsert Base_dData_dString.v_Hashable_uString) dtb__24) true) mc2)) Base_dData_dList.C_Base_dData_dList_dList_Nil) with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__26; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__27 } -> ((((v_Vuna_dCompiler_dIr_dAnalysis_dcollectComps mc0) dtb__25) dtb__26) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__27, mc3)))
  | _ -> failwith "DT: impossible branch"
))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> mc3
  | _ -> failwith "DT: impossible branch"
))

# 126 "Vuna/Compiler/Ir/Analysis.vuna"
let v_Vuna_dCompiler_dIr_dAnalysis_dcomponentTblOf = (fun (comps : string Base_dData_dList.t_Base_dData_dList_dList Base_dData_dList.t_Base_dData_dList_dList) -> (((Base_dContainer_dHashMap.v_Base_dContainer_dHashMap_dinsertAll Base_dData_dString.v_Hashable_uString) ((Base_dData_dList.v_Base_dData_dList_dconcatMap (fun (g : string Base_dData_dList.t_Base_dData_dList_dList) -> ((Base_dData_dList.v_Base_dData_dList_dmap (fun (n : string) -> { Base_dData_dPair.f_Base_dData_dPair_dPair_first = n; Base_dData_dPair.f_Base_dData_dPair_dPair_second = g })) g))) comps)) ((Base_dContainer_dHashMap.v_Base_dContainer_dHashMap_dfromList Base_dData_dString.v_Hashable_uString) Base_dData_dList.C_Base_dData_dList_dList_Nil)))

# 130 "Vuna/Compiler/Ir/Analysis.vuna"
let rec v_Vuna_dCompiler_dIr_dAnalysis_daddAllNames = (fun (mc0 : string Base_dData_dList.t_Base_dData_dList_dList) (mc1 : (string, bool) Base_dContainer_dHashMap.t_Base_dContainer_dHashMap_dHashMap) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__28, dtb__29) -> ((v_Vuna_dCompiler_dIr_dAnalysis_daddAllNames dtb__29) ((((Base_dContainer_dHashMap.v_Base_dContainer_dHashMap_dinsert Base_dData_dString.v_Hashable_uString) dtb__28) true) mc1))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> mc1
  | _ -> failwith "DT: impossible branch"
))

# 157 "Vuna/Compiler/Ir/Analysis.vuna"
let rec v_Vuna_dCompiler_dIr_dAnalysis_dfilterNames = (fun (mc0 : (string) -> bool) (mc1 : string Base_dData_dList.t_Base_dData_dList_dList) -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__30, dtb__31) -> (if (mc0 dtb__30) then (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__30, ((v_Vuna_dCompiler_dIr_dAnalysis_dfilterNames mc0) dtb__31))) else ((v_Vuna_dCompiler_dIr_dAnalysis_dfilterNames mc0) dtb__31))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 150 "Vuna/Compiler/Ir/Analysis.vuna"
let v_Vuna_dCompiler_dIr_dAnalysis_dgroupOf = (fun (mc0 : string Base_dData_dList.t_Base_dData_dList_dList) (mc1 : string Base_dData_dList.t_Base_dData_dList_dList) -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__32, dtb__33) -> (match dtb__33 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__32, Base_dData_dList.C_Base_dData_dList_dList_Nil))
  | _ -> ((fun memberTbl -> ((v_Vuna_dCompiler_dIr_dAnalysis_dfilterNames (fun (m : string) -> ((((Base_dContainer_dHashMap.v_Base_dContainer_dHashMap_dmember Base_dData_dString.v_Hashable_uString) Base_dData_dString.v_Eq_uString) m) memberTbl))) mc0)) (Base_dContainer_dHashMap.v_Base_dContainer_dHashMap_dofNames mc1))
)
  | _ -> ((fun memberTbl -> ((v_Vuna_dCompiler_dIr_dAnalysis_dfilterNames (fun (m : string) -> ((((Base_dContainer_dHashMap.v_Base_dContainer_dHashMap_dmember Base_dData_dString.v_Hashable_uString) Base_dData_dString.v_Eq_uString) m) memberTbl))) mc0)) (Base_dContainer_dHashMap.v_Base_dContainer_dHashMap_dofNames mc1))
))

# 139 "Vuna/Compiler/Ir/Analysis.vuna"
let rec v_Vuna_dCompiler_dIr_dAnalysis_dgroupsFromCompsGo = (fun (mc0 : (string, string Base_dData_dList.t_Base_dData_dList_dList) Base_dContainer_dHashMap.t_Base_dContainer_dHashMap_dHashMap) (mc1 : string Base_dData_dList.t_Base_dData_dList_dList) (mc2 : string Base_dData_dList.t_Base_dData_dList_dList) (mc3 : (string, bool) Base_dContainer_dHashMap.t_Base_dContainer_dHashMap_dHashMap) -> (match mc2 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__34, dtb__35) -> (if ((((Base_dContainer_dHashMap.v_Base_dContainer_dHashMap_dmember Base_dData_dString.v_Hashable_uString) Base_dData_dString.v_Eq_uString) dtb__34) mc3) then ((((v_Vuna_dCompiler_dIr_dAnalysis_dgroupsFromCompsGo mc0) mc1) dtb__35) mc3) else (match ((((Base_dContainer_dHashMap.v_Base_dContainer_dHashMap_dlookup Base_dData_dString.v_Hashable_uString) Base_dData_dString.v_Eq_uString) dtb__34) mc0) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__36) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (((v_Vuna_dCompiler_dIr_dAnalysis_dgroupOf mc1) dtb__36), ((((v_Vuna_dCompiler_dIr_dAnalysis_dgroupsFromCompsGo mc0) mc1) dtb__35) ((v_Vuna_dCompiler_dIr_dAnalysis_daddAllNames dtb__36) mc3))))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> ((((v_Vuna_dCompiler_dIr_dAnalysis_dgroupsFromCompsGo mc0) mc1) dtb__35) mc3)
  | _ -> failwith "DT: impossible branch"
))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 135 "Vuna/Compiler/Ir/Analysis.vuna"
let v_Vuna_dCompiler_dIr_dAnalysis_dgroupsFromComps = (fun (comps : string Base_dData_dList.t_Base_dData_dList_dList Base_dData_dList.t_Base_dData_dList_dList) (names : string Base_dData_dList.t_Base_dData_dList_dList) -> ((((v_Vuna_dCompiler_dIr_dAnalysis_dgroupsFromCompsGo (v_Vuna_dCompiler_dIr_dAnalysis_dcomponentTblOf comps)) names) names) ((Base_dContainer_dHashMap.v_Base_dContainer_dHashMap_dfromList Base_dData_dString.v_Hashable_uString) Base_dData_dList.C_Base_dData_dList_dList_Nil)))

# 162 "Vuna/Compiler/Ir/Analysis.vuna"
let v_Vuna_dCompiler_dIr_dAnalysis_dnotIn = (fun (name : string) (names : string Base_dData_dList.t_Base_dData_dList_dList) -> (Base_dData_dBool.v_Base_dData_dBool_dnot ((Base_dData_dList.v_Base_dData_dList_dmemName name) names)))

# 189 "Vuna/Compiler/Ir/Analysis.vuna"
let rec v_Vuna_dCompiler_dIr_dAnalysis_dindexGroups = (fun (mc0 : int) (mc1 : string Base_dData_dList.t_Base_dData_dList_dList Base_dData_dList.t_Base_dData_dList_dList) (mc2 : (int, string Base_dData_dList.t_Base_dData_dList_dList) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__37, dtb__38) -> (((v_Vuna_dCompiler_dIr_dAnalysis_dindexGroups (mc0 + 1)) dtb__38) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = mc0; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__37 }, mc2)))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Base_dData_dList.v_Base_dData_dList_dreverse mc2)
  | _ -> failwith "DT: impossible branch"
))

# 193 "Vuna/Compiler/Ir/Analysis.vuna"
let v_Vuna_dCompiler_dIr_dAnalysis_dgroupIndexTbl = (fun (indexed : (int, string Base_dData_dList.t_Base_dData_dList_dList) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) -> (((Base_dContainer_dHashMap.v_Base_dContainer_dHashMap_dinsertAll Base_dData_dString.v_Hashable_uString) ((Base_dData_dList.v_Base_dData_dList_dconcatMap (fun (p : (int, string Base_dData_dList.t_Base_dData_dList_dList) Base_dData_dPair.t_Base_dData_dPair_dPair) -> ((Base_dData_dList.v_Base_dData_dList_dmap (fun (n : string) -> { Base_dData_dPair.f_Base_dData_dPair_dPair_first = n; Base_dData_dPair.f_Base_dData_dPair_dPair_second = (Base_dData_dPair.v_Base_dData_dPair_dfirstOf p) })) (Base_dData_dPair.v_Base_dData_dPair_dsecondOf p)))) indexed)) ((Base_dContainer_dHashMap.v_Base_dContainer_dHashMap_dfromList Base_dData_dString.v_Hashable_uString) Base_dData_dList.C_Base_dData_dList_dList_Nil)))

# 205 "Vuna/Compiler/Ir/Analysis.vuna"
let rec v_Vuna_dCompiler_dIr_dAnalysis_dgroupDepIdxGo = (fun (mc0 : int) (mc1 : (string, int) Base_dContainer_dHashMap.t_Base_dContainer_dHashMap_dHashMap) (mc2 : string Base_dData_dList.t_Base_dData_dList_dList) (mc3 : (int, bool) Base_dContainer_dHashMap.t_Base_dContainer_dHashMap_dHashMap) (mc4 : int Base_dData_dList.t_Base_dData_dList_dList) -> (match mc2 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__39, dtb__40) -> (match ((((Base_dContainer_dHashMap.v_Base_dContainer_dHashMap_dlookup Base_dData_dString.v_Hashable_uString) Base_dData_dString.v_Eq_uString) dtb__39) mc1) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__41) -> (if (if (dtb__41 = mc0) then true else ((((Base_dContainer_dHashMap.v_Base_dContainer_dHashMap_dmember Base_dData_dInt.v_Hashable_uInt) Base_dData_dInt.v_Eq_uInt) dtb__41) mc3)) then (((((v_Vuna_dCompiler_dIr_dAnalysis_dgroupDepIdxGo mc0) mc1) dtb__40) mc3) mc4) else (((((v_Vuna_dCompiler_dIr_dAnalysis_dgroupDepIdxGo mc0) mc1) dtb__40) ((((Base_dContainer_dHashMap.v_Base_dContainer_dHashMap_dinsert Base_dData_dInt.v_Hashable_uInt) dtb__41) true) mc3)) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__41, mc4))))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (((((v_Vuna_dCompiler_dIr_dAnalysis_dgroupDepIdxGo mc0) mc1) dtb__40) mc3) mc4)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Base_dData_dList.v_Base_dData_dList_dreverse mc4)
  | _ -> failwith "DT: impossible branch"
))

# 201 "Vuna/Compiler/Ir/Analysis.vuna"
let v_Vuna_dCompiler_dIr_dAnalysis_dgroupDepIdx = (fun (mc0 : (string, string Base_dData_dList.t_Base_dData_dList_dList) Base_dContainer_dHashMap.t_Base_dContainer_dHashMap_dHashMap) (mc1 : (string, int) Base_dContainer_dHashMap.t_Base_dContainer_dHashMap_dHashMap) (mc2 : (int, string Base_dData_dList.t_Base_dData_dList_dList) Base_dData_dPair.t_Base_dData_dPair_dPair) -> (match mc2 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__42; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__43 } -> (((((v_Vuna_dCompiler_dIr_dAnalysis_dgroupDepIdxGo dtb__42) mc1) ((Base_dData_dList.v_Base_dData_dList_dconcatMap (v_Vuna_dCompiler_dIr_dAnalysis_dneighborsOf mc0)) dtb__43)) ((Base_dContainer_dHashMap.v_Base_dContainer_dHashMap_dfromList Base_dData_dInt.v_Hashable_uInt) Base_dData_dList.C_Base_dData_dList_dList_Nil)) Base_dData_dList.C_Base_dData_dList_dList_Nil)
  | _ -> failwith "DT: impossible branch"
))

# 224 "Vuna/Compiler/Ir/Analysis.vuna"
let v_Vuna_dCompiler_dIr_dAnalysis_dlookupInt = (fun (tbl : (int, int) Base_dContainer_dHashMap.t_Base_dContainer_dHashMap_dHashMap) (k : int) -> (match ((((Base_dContainer_dHashMap.v_Base_dContainer_dHashMap_dlookup Base_dData_dInt.v_Hashable_uInt) Base_dData_dInt.v_Eq_uInt) k) tbl) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__44) -> dtb__44
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> 0
  | _ -> failwith "DT: impossible branch"
))

# 230 "Vuna/Compiler/Ir/Analysis.vuna"
let v_Vuna_dCompiler_dIr_dAnalysis_dlookupNames = (fun (tbl : (int, string Base_dData_dList.t_Base_dData_dList_dList) Base_dContainer_dHashMap.t_Base_dContainer_dHashMap_dHashMap) (k : int) -> (match ((((Base_dContainer_dHashMap.v_Base_dContainer_dHashMap_dlookup Base_dData_dInt.v_Hashable_uInt) Base_dData_dInt.v_Eq_uInt) k) tbl) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__45) -> dtb__45
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 236 "Vuna/Compiler/Ir/Analysis.vuna"
let v_Vuna_dCompiler_dIr_dAnalysis_dlookupDeps = (fun (tbl : (int, int Base_dData_dList.t_Base_dData_dList_dList) Base_dContainer_dHashMap.t_Base_dContainer_dHashMap_dHashMap) (k : int) -> (match ((((Base_dContainer_dHashMap.v_Base_dContainer_dHashMap_dlookup Base_dData_dInt.v_Hashable_uInt) Base_dData_dInt.v_Eq_uInt) k) tbl) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__46) -> dtb__46
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 220 "Vuna/Compiler/Ir/Analysis.vuna"
let v_Vuna_dCompiler_dIr_dAnalysis_daddReverseEdges = (fun (mc0 : (int, int Base_dData_dList.t_Base_dData_dList_dList) Base_dContainer_dHashMap.t_Base_dContainer_dHashMap_dHashMap) (mc1 : (int, int Base_dData_dList.t_Base_dData_dList_dList) Base_dData_dPair.t_Base_dData_dPair_dPair) -> (match mc1 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__47; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__48 } -> (((Base_dData_dList.v_Base_dData_dList_dfoldl (fun (acc : (int, int Base_dData_dList.t_Base_dData_dList_dList) Base_dContainer_dHashMap.t_Base_dContainer_dHashMap_dHashMap) (d : int) -> ((((Base_dContainer_dHashMap.v_Base_dContainer_dHashMap_dinsert Base_dData_dInt.v_Hashable_uInt) d) ((Base_dData_dList.v_Base_dData_dList_dappend ((v_Vuna_dCompiler_dIr_dAnalysis_dlookupDeps acc) d)) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__47, Base_dData_dList.C_Base_dData_dList_dList_Nil)))) acc))) mc0) dtb__48)
  | _ -> failwith "DT: impossible branch"
))

# 216 "Vuna/Compiler/Ir/Analysis.vuna"
let v_Vuna_dCompiler_dIr_dAnalysis_dreverseDepTbl = (fun (pairs : (int, int Base_dData_dList.t_Base_dData_dList_dList) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) -> (((Base_dData_dList.v_Base_dData_dList_dfoldl v_Vuna_dCompiler_dIr_dAnalysis_daddReverseEdges) ((Base_dContainer_dHashMap.v_Base_dContainer_dHashMap_dfromList Base_dData_dInt.v_Hashable_uInt) Base_dData_dList.C_Base_dData_dList_dList_Nil)) pairs))

# 243 "Vuna/Compiler/Ir/Analysis.vuna"
let rec v_Vuna_dCompiler_dIr_dAnalysis_dinsertReady = (fun (mc0 : int) (mc1 : int Base_dData_dList.t_Base_dData_dList_dList) -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__49, dtb__50) -> (if (mc0 <= dtb__49) then (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (mc0, (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__49, dtb__50)))) else (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__49, ((v_Vuna_dCompiler_dIr_dAnalysis_dinsertReady mc0) dtb__50))))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (mc0, Base_dData_dList.C_Base_dData_dList_dList_Nil))
  | _ -> failwith "DT: impossible branch"
))

# 247 "Vuna/Compiler/Ir/Analysis.vuna"
let rec v_Vuna_dCompiler_dIr_dAnalysis_dorderGroupsGo = (fun (fuel : int) (grpTbl : (int, string Base_dData_dList.t_Base_dData_dList_dList) Base_dContainer_dHashMap.t_Base_dContainer_dHashMap_dHashMap) (revTbl : (int, int Base_dData_dList.t_Base_dData_dList_dList) Base_dContainer_dHashMap.t_Base_dContainer_dHashMap_dHashMap) (indeg : (int, int) Base_dContainer_dHashMap.t_Base_dContainer_dHashMap_dHashMap) (ready : int Base_dData_dList.t_Base_dData_dList_dList) (remaining : int) (acc : string Base_dData_dList.t_Base_dData_dList_dList Base_dData_dList.t_Base_dData_dList_dList) -> (if (fuel <= 0) then (Vuna_dCompiler_dBase_dDiagnostics_dCg.v_Vuna_dCompiler_dBase_dDiagnostics_dCg_dcgErr0 Vuna_dCompiler_dBase_dDiagnostics_dCg.C_Vuna_dCompiler_dBase_dDiagnostics_dCg_dCgErr_DependencyCycle) else (if (remaining = 0) then (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Base_dData_dList.v_Base_dData_dList_dreverse acc))) else (match ready with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Vuna_dCompiler_dBase_dDiagnostics_dCg.v_Vuna_dCompiler_dBase_dDiagnostics_dCg_dcgErr0 Vuna_dCompiler_dBase_dDiagnostics_dCg.C_Vuna_dCompiler_dBase_dDiagnostics_dCg_dCgErr_DependencyCycle)
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__51, dtb__52) -> ((fun deps -> ((fun indeg2 -> ((fun ready2 -> (((((((v_Vuna_dCompiler_dIr_dAnalysis_dorderGroupsGo (fuel - 1)) grpTbl) revTbl) indeg2) ready2) (remaining - 1)) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (((v_Vuna_dCompiler_dIr_dAnalysis_dlookupNames grpTbl) dtb__51), acc)))) (((Base_dData_dList.v_Base_dData_dList_dfoldl (fun (r : int Base_dData_dList.t_Base_dData_dList_dList) (d : int) -> (if (((v_Vuna_dCompiler_dIr_dAnalysis_dlookupInt indeg2) d) = 0) then ((v_Vuna_dCompiler_dIr_dAnalysis_dinsertReady d) r) else r))) dtb__52) deps))) (((Base_dData_dList.v_Base_dData_dList_dfoldl (fun (acc2 : (int, int) Base_dContainer_dHashMap.t_Base_dContainer_dHashMap_dHashMap) (d : int) -> ((((Base_dContainer_dHashMap.v_Base_dContainer_dHashMap_dinsert Base_dData_dInt.v_Hashable_uInt) d) (((v_Vuna_dCompiler_dIr_dAnalysis_dlookupInt indeg) d) - 1)) acc2))) indeg) deps))) ((v_Vuna_dCompiler_dIr_dAnalysis_dlookupDeps revTbl) dtb__51))
  | _ -> failwith "DT: impossible branch"
))))

# 296 "Vuna/Compiler/Ir/Analysis.vuna"
let rec v_Vuna_dCompiler_dIr_dAnalysis_dallCovered = (fun (mc0 : (string, bool) Base_dContainer_dHashMap.t_Base_dContainer_dHashMap_dHashMap) (mc1 : string Base_dData_dList.t_Base_dData_dList_dList) -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__53, dtb__54) -> (if ((((Base_dContainer_dHashMap.v_Base_dContainer_dHashMap_dmember Base_dData_dString.v_Hashable_uString) Base_dData_dString.v_Eq_uString) dtb__53) mc0) then ((v_Vuna_dCompiler_dIr_dAnalysis_dallCovered mc0) dtb__54) else false)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

# 287 "Vuna/Compiler/Ir/Analysis.vuna"
let v_Vuna_dCompiler_dIr_dAnalysis_dcheckGroupsCover = (fun (groups : string Base_dData_dList.t_Base_dData_dList_dList Base_dData_dList.t_Base_dData_dList_dList) (names : string Base_dData_dList.t_Base_dData_dList_dList) -> ((fun covered -> (if ((v_Vuna_dCompiler_dIr_dAnalysis_dallCovered covered) names) then (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (groups)) else (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicInternal "SCC grouping dropped definitions (DFS budget exhausted?)"))) (Base_dContainer_dHashMap.v_Base_dContainer_dHashMap_dofNames ((Base_dData_dList.v_Base_dData_dList_dconcatMap (fun (g : string Base_dData_dList.t_Base_dData_dList_dList) -> g)) groups))))

# 301 "Vuna/Compiler/Ir/Analysis.vuna"
let v_Vuna_dCompiler_dIr_dAnalysis_dgroupNeedsRec = (fun (mc0 : (string, string Base_dData_dList.t_Base_dData_dList_dList) Base_dContainer_dHashMap.t_Base_dContainer_dHashMap_dHashMap) (mc1 : string Base_dData_dList.t_Base_dData_dList_dList) -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__55, dtb__56) -> (match dtb__56 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> ((Base_dData_dList.v_Base_dData_dList_dmemName dtb__55) ((v_Vuna_dCompiler_dIr_dAnalysis_dneighborsOf mc0) dtb__55))
  | _ -> true
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 308 "Vuna/Compiler/Ir/Analysis.vuna"
let rec v_Vuna_dCompiler_dIr_dAnalysis_dfirstBadRecursiveValue = (fun (mc0 : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrDef Base_dData_dList.t_Base_dData_dList_dList) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__57, dtb__58) -> (if ((Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirDefArity dtb__57) = 0) then (if (Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirDefRecValueOk dtb__57) then (v_Vuna_dCompiler_dIr_dAnalysis_dfirstBadRecursiveValue dtb__58) else (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ((Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirDefName dtb__57)))) else (v_Vuna_dCompiler_dIr_dAnalysis_dfirstBadRecursiveValue dtb__58))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 316 "Vuna/Compiler/Ir/Analysis.vuna"
let rec v_Vuna_dCompiler_dIr_dAnalysis_dfindDefByName = (fun (mc0 : string) (mc1 : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrDef Base_dData_dList.t_Base_dData_dList_dList) -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__59, dtb__60) -> (if ((Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirDefName dtb__59) = mc0) then (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__59)) else ((v_Vuna_dCompiler_dIr_dAnalysis_dfindDefByName mc0) dtb__60))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 320 "Vuna/Compiler/Ir/Analysis.vuna"
let rec v_Vuna_dCompiler_dIr_dAnalysis_dgroupDefsOf = (fun (mc0 : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrDef Base_dData_dList.t_Base_dData_dList_dList) (mc1 : string Base_dData_dList.t_Base_dData_dList_dList) -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__61, dtb__62) -> (match ((v_Vuna_dCompiler_dIr_dAnalysis_dfindDefByName dtb__61) mc0) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> ((v_Vuna_dCompiler_dIr_dAnalysis_dgroupDefsOf mc0) dtb__62)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__63) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__63, ((v_Vuna_dCompiler_dIr_dAnalysis_dgroupDefsOf mc0) dtb__62)))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 329 "Vuna/Compiler/Ir/Analysis.vuna"
let rec v_Vuna_dCompiler_dIr_dAnalysis_dassembleGroups = (fun (mc0 : (string, string Base_dData_dList.t_Base_dData_dList_dList) Base_dContainer_dHashMap.t_Base_dContainer_dHashMap_dHashMap) (mc1 : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrDef Base_dData_dList.t_Base_dData_dList_dList) (mc2 : string Base_dData_dList.t_Base_dData_dList_dList Base_dData_dList.t_Base_dData_dList_dList) -> (match mc2 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__64, dtb__65) -> ((fun members -> ((fun isRec -> ((fun checked -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind checked) (fun (grp : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrGroup) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((v_Vuna_dCompiler_dIr_dAnalysis_dassembleGroups mc0) mc1) dtb__65)) (fun (tail : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrGroup Base_dData_dList.t_Base_dData_dList_dList) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (grp, tail))))))))) (if isRec then (match (v_Vuna_dCompiler_dIr_dAnalysis_dfirstBadRecursiveValue members) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__66) -> (match ((v_Vuna_dCompiler_dIr_dAnalysis_dfindDefByName dtb__66) members) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__67) -> ((((Vuna_dCompiler_dBase_dDiagnostics_dCg.v_Vuna_dCompiler_dBase_dDiagnostics_dCg_dcgErrDefAt (Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirDefSpan dtb__67)) dtb__66) (Vuna_dCompiler_dBase_dDiagnostics_dCg.C_Vuna_dCompiler_dBase_dDiagnostics_dCg_dCgErr_RecursiveValueDefinition (dtb__66))) (Base_dData_dVec.C_Base_dData_dVec_dVec_VCons (dtb__66, Base_dData_dVec.C_Base_dData_dVec_dVec_Nil)))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> ((Vuna_dCompiler_dBase_dDiagnostics_dCg.v_Vuna_dCompiler_dBase_dDiagnostics_dCg_dcgErr1 (Vuna_dCompiler_dBase_dDiagnostics_dCg.C_Vuna_dCompiler_dBase_dDiagnostics_dCg_dCgErr_RecursiveValueDefinition (dtb__66))) dtb__66)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrGroup_irGroupIsRec = true; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrGroup_irGroupDefs = members }))
  | _ -> failwith "DT: impossible branch"
) else (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrGroup_irGroupIsRec = false; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrGroup_irGroupDefs = members }))))) ((v_Vuna_dCompiler_dIr_dAnalysis_dgroupNeedsRec mc0) dtb__64))) ((v_Vuna_dCompiler_dIr_dAnalysis_dgroupDefsOf mc1) dtb__64))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (Base_dData_dList.C_Base_dData_dList_dList_Nil))
  | _ -> failwith "DT: impossible branch"
))

# 366 "Vuna/Compiler/Ir/Analysis.vuna"
let rec v_Vuna_dCompiler_dIr_dAnalysis_dcountList = (fun mc0 -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__68, dtb__69) -> (1 + (v_Vuna_dCompiler_dIr_dAnalysis_dcountList dtb__69))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))

# 172 "Vuna/Compiler/Ir/Analysis.vuna"
let v_Vuna_dCompiler_dIr_dAnalysis_dorderGroups = (fun (adjT : (string, string Base_dData_dList.t_Base_dData_dList_dList) Base_dContainer_dHashMap.t_Base_dContainer_dHashMap_dHashMap) (groups : string Base_dData_dList.t_Base_dData_dList_dList Base_dData_dList.t_Base_dData_dList_dList) -> ((fun indexed -> ((fun groupIdxT -> ((fun grpTbl -> ((fun depPairs -> ((fun revTbl -> ((fun indeg -> ((fun ready -> (((((((v_Vuna_dCompiler_dIr_dAnalysis_dorderGroupsGo ((v_Vuna_dCompiler_dIr_dAnalysis_dcountList groups) + 1)) grpTbl) revTbl) indeg) ready) (v_Vuna_dCompiler_dIr_dAnalysis_dcountList groups)) Base_dData_dList.C_Base_dData_dList_dList_Nil)) ((Base_dData_dList.v_Base_dData_dList_dfilter (fun (n : int) -> (((v_Vuna_dCompiler_dIr_dAnalysis_dlookupInt indeg) n) = 0))) ((Base_dData_dList.v_Base_dData_dList_dmap Base_dData_dPair.v_Base_dData_dPair_dfirstOf) indexed)))) (((Base_dData_dList.v_Base_dData_dList_dfoldl (fun (acc : (int, int) Base_dContainer_dHashMap.t_Base_dContainer_dHashMap_dHashMap) (p : (int, int Base_dData_dList.t_Base_dData_dList_dList) Base_dData_dPair.t_Base_dData_dPair_dPair) -> ((((Base_dContainer_dHashMap.v_Base_dContainer_dHashMap_dinsert Base_dData_dInt.v_Hashable_uInt) (Base_dData_dPair.v_Base_dData_dPair_dfirstOf p)) (v_Vuna_dCompiler_dIr_dAnalysis_dcountList (Base_dData_dPair.v_Base_dData_dPair_dsecondOf p))) acc))) ((Base_dContainer_dHashMap.v_Base_dContainer_dHashMap_dfromList Base_dData_dInt.v_Hashable_uInt) Base_dData_dList.C_Base_dData_dList_dList_Nil)) depPairs))) (v_Vuna_dCompiler_dIr_dAnalysis_dreverseDepTbl depPairs))) ((Base_dData_dList.v_Base_dData_dList_dmap (fun (p : (int, string Base_dData_dList.t_Base_dData_dList_dList) Base_dData_dPair.t_Base_dData_dPair_dPair) -> { Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Base_dData_dPair.v_Base_dData_dPair_dfirstOf p); Base_dData_dPair.f_Base_dData_dPair_dPair_second = (((v_Vuna_dCompiler_dIr_dAnalysis_dgroupDepIdx adjT) groupIdxT) p) })) indexed))) (((Base_dContainer_dHashMap.v_Base_dContainer_dHashMap_dinsertAll Base_dData_dInt.v_Hashable_uInt) ((Base_dData_dList.v_Base_dData_dList_dmap (fun (p : (int, string Base_dData_dList.t_Base_dData_dList_dList) Base_dData_dPair.t_Base_dData_dPair_dPair) -> { Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Base_dData_dPair.v_Base_dData_dPair_dfirstOf p); Base_dData_dPair.f_Base_dData_dPair_dPair_second = (Base_dData_dPair.v_Base_dData_dPair_dsecondOf p) })) indexed)) ((Base_dContainer_dHashMap.v_Base_dContainer_dHashMap_dfromList Base_dData_dInt.v_Hashable_uInt) Base_dData_dList.C_Base_dData_dList_dList_Nil)))) (v_Vuna_dCompiler_dIr_dAnalysis_dgroupIndexTbl indexed))) (((v_Vuna_dCompiler_dIr_dAnalysis_dindexGroups 0) groups) Base_dData_dList.C_Base_dData_dList_dList_Nil)))

# 269 "Vuna/Compiler/Ir/Analysis.vuna"
let v_Vuna_dCompiler_dIr_dAnalysis_dgroupNames = (fun (adj : (string, string Base_dData_dList.t_Base_dData_dList_dList) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (names : string Base_dData_dList.t_Base_dData_dList_dList) -> ((fun nameTbl -> ((fun adj2 -> ((fun adjT -> ((fun revT -> (match ((((v_Vuna_dCompiler_dIr_dAnalysis_dpostOrder adjT) names) ((Base_dContainer_dHashMap.v_Base_dContainer_dHashMap_dfromList Base_dData_dString.v_Hashable_uString) Base_dData_dList.C_Base_dData_dList_dList_Nil)) Base_dData_dList.C_Base_dData_dList_dList_Nil) with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__70; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__71 } -> ((fun comps -> ((fun groups -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((v_Vuna_dCompiler_dIr_dAnalysis_dorderGroups adjT) groups)) (fun (ordered : string Base_dData_dList.t_Base_dData_dList_dList Base_dData_dList.t_Base_dData_dList_dList) -> ((v_Vuna_dCompiler_dIr_dAnalysis_dcheckGroupsCover ordered) names)))) ((v_Vuna_dCompiler_dIr_dAnalysis_dgroupsFromComps comps) names))) ((((v_Vuna_dCompiler_dIr_dAnalysis_dcollectComps revT) dtb__71) ((Base_dContainer_dHashMap.v_Base_dContainer_dHashMap_dfromList Base_dData_dString.v_Hashable_uString) Base_dData_dList.C_Base_dData_dList_dList_Nil)) Base_dData_dList.C_Base_dData_dList_dList_Nil))
  | _ -> failwith "DT: impossible branch"
)) (v_Vuna_dCompiler_dIr_dAnalysis_dreverseAdjTbl adj2))) (v_Vuna_dCompiler_dIr_dAnalysis_dadjTblOf adj2))) ((Base_dData_dList.v_Base_dData_dList_dmap (fun (p : (string, string Base_dData_dList.t_Base_dData_dList_dList) Base_dData_dPair.t_Base_dData_dPair_dPair) -> { Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Base_dData_dPair.v_Base_dData_dPair_dfirstOf p); Base_dData_dPair.f_Base_dData_dPair_dPair_second = ((Base_dData_dList.v_Base_dData_dList_dfilter (fun (n : string) -> ((((Base_dContainer_dHashMap.v_Base_dContainer_dHashMap_dmember Base_dData_dString.v_Hashable_uString) Base_dData_dString.v_Eq_uString) n) nameTbl))) (Base_dData_dPair.v_Base_dData_dPair_dsecondOf p)) })) adj))) (Base_dContainer_dHashMap.v_Base_dContainer_dHashMap_dofNames names)))

# 363 "Vuna/Compiler/Ir/Analysis.vuna"
let v_Vuna_dCompiler_dIr_dAnalysis_ddepEdgeCount = (fun (defs : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrDef Base_dData_dList.t_Base_dData_dList_dList) -> (((Base_dData_dList.v_Base_dData_dList_dfoldl (fun (acc : int) (d : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrDef) -> (((Base_dTrait_dNum.v_Base_dTrait_dNum_d_x43_ Base_dData_dInt.v_Num_uInt) acc) (v_Vuna_dCompiler_dIr_dAnalysis_dcountList (Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirDefDeps d))))) 0) defs))

# 370 "Vuna/Compiler/Ir/Analysis.vuna"
let rec v_Vuna_dCompiler_dIr_dAnalysis_dreachableNames = (fun (fuel : int) (pending : string Base_dData_dList.t_Base_dData_dList_dList) (defTbl : (string, Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrDef) Base_dContainer_dHashMap.t_Base_dContainer_dHashMap_dHashMap) (seen : (string, bool) Base_dContainer_dHashMap.t_Base_dContainer_dHashMap_dHashMap) -> (if (fuel <= 0) then seen else (match pending with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> seen
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__72, dtb__73) -> (if ((((Base_dContainer_dHashMap.v_Base_dContainer_dHashMap_dmember Base_dData_dString.v_Hashable_uString) Base_dData_dString.v_Eq_uString) dtb__72) seen) then ((((v_Vuna_dCompiler_dIr_dAnalysis_dreachableNames (fuel - 1)) dtb__73) defTbl) seen) else ((fun seen2 -> (match ((((Base_dContainer_dHashMap.v_Base_dContainer_dHashMap_dlookup Base_dData_dString.v_Hashable_uString) Base_dData_dString.v_Eq_uString) dtb__72) defTbl) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> ((((v_Vuna_dCompiler_dIr_dAnalysis_dreachableNames (fuel - 1)) dtb__73) defTbl) seen2)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__74) -> ((((v_Vuna_dCompiler_dIr_dAnalysis_dreachableNames (fuel - 1)) ((Base_dData_dList.v_Base_dData_dList_dappend (Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirDefDeps dtb__74)) dtb__73)) defTbl) seen2)
  | _ -> failwith "DT: impossible branch"
)) ((((Base_dContainer_dHashMap.v_Base_dContainer_dHashMap_dinsert Base_dData_dString.v_Hashable_uString) dtb__72) true) seen)))
  | _ -> failwith "DT: impossible branch"
)))

# 355 "Vuna/Compiler/Ir/Analysis.vuna"
let v_Vuna_dCompiler_dIr_dAnalysis_dreachableDefs = (fun (seeds : string Base_dData_dList.t_Base_dData_dList_dList) (defs : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrDef Base_dData_dList.t_Base_dData_dList_dList) -> ((fun defTbl -> ((fun budget -> ((fun seen -> ((Base_dData_dList.v_Base_dData_dList_dfilter (fun (d : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrDef) -> ((((Base_dContainer_dHashMap.v_Base_dContainer_dHashMap_dmember Base_dData_dString.v_Hashable_uString) Base_dData_dString.v_Eq_uString) (Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirDefName d)) seen))) defs)) ((((v_Vuna_dCompiler_dIr_dAnalysis_dreachableNames budget) seeds) defTbl) ((Base_dContainer_dHashMap.v_Base_dContainer_dHashMap_dfromList Base_dData_dString.v_Hashable_uString) Base_dData_dList.C_Base_dData_dList_dList_Nil)))) ((8 + (v_Vuna_dCompiler_dIr_dAnalysis_dcountList seeds)) + (v_Vuna_dCompiler_dIr_dAnalysis_ddepEdgeCount defs)))) (((Base_dContainer_dHashMap.v_Base_dContainer_dHashMap_dinsertAll Base_dData_dString.v_Hashable_uString) ((Base_dData_dList.v_Base_dData_dList_dmap (fun (d : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrDef) -> { Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirDefName d); Base_dData_dPair.f_Base_dData_dPair_dPair_second = d })) defs)) ((Base_dContainer_dHashMap.v_Base_dContainer_dHashMap_dfromList Base_dData_dString.v_Hashable_uString) Base_dData_dList.C_Base_dData_dList_dList_Nil))))

# 392 "Vuna/Compiler/Ir/Analysis.vuna"
let rec v_Vuna_dCompiler_dIr_dAnalysis_dirStringsOf = (fun (mc0 : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIr) -> (match mc0 with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrEffThunk (dtb__75, dtb__76, dtb__77, dtb__78, dtb__79) -> (v_Vuna_dCompiler_dIr_dAnalysis_dirStringsOf dtb__79)
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrConcatMany (dtb__80) -> ((Base_dData_dList.v_Base_dData_dList_dconcatMap v_Vuna_dCompiler_dIr_dAnalysis_dirStringsOf) dtb__80)
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrNatCase (dtb__81, dtb__82, dtb__83, dtb__84, dtb__85) -> ((Base_dData_dList.v_Base_dData_dList_dappend (v_Vuna_dCompiler_dIr_dAnalysis_dirStringsOf dtb__81)) ((Base_dData_dList.v_Base_dData_dList_dappend (v_Vuna_dCompiler_dIr_dAnalysis_dirStringsOfAltMaybe dtb__83)) ((Base_dData_dList.v_Base_dData_dList_dappend (v_Vuna_dCompiler_dIr_dAnalysis_dirStringsOfAltMaybe dtb__84)) (v_Vuna_dCompiler_dIr_dAnalysis_dirStringsOfAltMaybe dtb__85))))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCase (dtb__86, dtb__87, dtb__88, dtb__89) -> ((Base_dData_dList.v_Base_dData_dList_dappend (v_Vuna_dCompiler_dIr_dAnalysis_dirStringsOf dtb__88)) ((Base_dData_dList.v_Base_dData_dList_dconcatMap v_Vuna_dCompiler_dIr_dAnalysis_dirStringsOfAlt) dtb__89))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrIf (dtb__90, dtb__91, dtb__92) -> ((Base_dData_dList.v_Base_dData_dList_dappend (v_Vuna_dCompiler_dIr_dAnalysis_dirStringsOf dtb__90)) ((Base_dData_dList.v_Base_dData_dList_dappend (v_Vuna_dCompiler_dIr_dAnalysis_dirStringsOf dtb__91)) (v_Vuna_dCompiler_dIr_dAnalysis_dirStringsOf dtb__92)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrTail (dtb__93) -> (v_Vuna_dCompiler_dIr_dAnalysis_dirStringsOf dtb__93)
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (dtb__94, dtb__95, dtb__96) -> ((Base_dData_dList.v_Base_dData_dList_dappend (v_Vuna_dCompiler_dIr_dAnalysis_dirStringsOf dtb__95)) (v_Vuna_dCompiler_dIr_dAnalysis_dirStringsOf dtb__96))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLam (dtb__97, dtb__98, dtb__99) -> (v_Vuna_dCompiler_dIr_dAnalysis_dirStringsOf dtb__99)
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLet (dtb__100, dtb__101, dtb__102) -> ((Base_dData_dList.v_Base_dData_dList_dappend (v_Vuna_dCompiler_dIr_dAnalysis_dirStringsOf dtb__101)) (v_Vuna_dCompiler_dIr_dAnalysis_dirStringsOf dtb__102))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCast (dtb__103, dtb__104, dtb__105) -> (v_Vuna_dCompiler_dIr_dAnalysis_dirStringsOf dtb__105)
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRtApp (dtb__106, dtb__107) -> ((Base_dData_dList.v_Base_dData_dList_dconcatMap v_Vuna_dCompiler_dIr_dAnalysis_dirStringsOf) dtb__107)
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRecUpd (dtb__108, dtb__109, dtb__110, dtb__111) -> ((Base_dData_dList.v_Base_dData_dList_dappend (v_Vuna_dCompiler_dIr_dAnalysis_dirStringsOf dtb__108)) ((Base_dData_dList.v_Base_dData_dList_dconcatMap v_Vuna_dCompiler_dIr_dAnalysis_dirStringsOfField) dtb__110))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrProj (dtb__112, dtb__113, dtb__114, dtb__115) -> (v_Vuna_dCompiler_dIr_dAnalysis_dirStringsOf dtb__112)
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRecord (dtb__116, dtb__117, dtb__118) -> ((Base_dData_dList.v_Base_dData_dList_dconcatMap v_Vuna_dCompiler_dIr_dAnalysis_dirStringsOfField) dtb__118)
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCtor (dtb__119, dtb__120, dtb__121, dtb__122) -> ((Base_dData_dList.v_Base_dData_dList_dconcatMap v_Vuna_dCompiler_dIr_dAnalysis_dirStringsOf) dtb__122)
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrStr (dtb__123) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__123, Base_dData_dList.C_Base_dData_dList_dList_Nil))
  | _ -> Base_dData_dList.C_Base_dData_dList_dList_Nil
))
# 415 "Vuna/Compiler/Ir/Analysis.vuna"
and v_Vuna_dCompiler_dIr_dAnalysis_dirStringsOfField = (fun (p : (string, Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIr) Base_dData_dPair.t_Base_dData_dPair_dPair) -> (v_Vuna_dCompiler_dIr_dAnalysis_dirStringsOf (Base_dData_dPair.v_Base_dData_dPair_dsecondOf p)))
# 418 "Vuna/Compiler/Ir/Analysis.vuna"
and v_Vuna_dCompiler_dIr_dAnalysis_dirStringsOfAlt = (fun (alt : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrAlt) -> (v_Vuna_dCompiler_dIr_dAnalysis_dirStringsOf (Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirAltBodyOf alt)))
# 421 "Vuna/Compiler/Ir/Analysis.vuna"
and v_Vuna_dCompiler_dIr_dAnalysis_dirStringsOfAltMaybe = (fun (mc0 : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrAlt Base_dData_dMaybe.t_Base_dData_dMaybe_dMaybe) -> (match mc0 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__124) -> (v_Vuna_dCompiler_dIr_dAnalysis_dirStringsOfAlt dtb__124)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 426 "Vuna/Compiler/Ir/Analysis.vuna"
let rec v_Vuna_dCompiler_dIr_dAnalysis_dflattenApp = (fun (mc0 : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIr) -> (match mc0 with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (dtb__125, dtb__126, dtb__127) -> ((fun p -> { Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Base_dData_dPair.v_Base_dData_dPair_dfirstOf p); Base_dData_dPair.f_Base_dData_dPair_dPair_second = ((Base_dData_dList.v_Base_dData_dList_dappend (Base_dData_dPair.v_Base_dData_dPair_dsecondOf p)) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__127, Base_dData_dList.C_Base_dData_dList_dList_Nil))) }) (v_Vuna_dCompiler_dIr_dAnalysis_dflattenApp dtb__126))
  | _ -> { Base_dData_dPair.f_Base_dData_dPair_dPair_first = mc0; Base_dData_dPair.f_Base_dData_dPair_dPair_second = Base_dData_dList.C_Base_dData_dList_dList_Nil }
))

# 434 "Vuna/Compiler/Ir/Analysis.vuna"
let v_Vuna_dCompiler_dIr_dAnalysis_dirStringsOfDef = (fun (d : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrDef) -> (match (Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirDefBody d) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__128) -> (v_Vuna_dCompiler_dIr_dAnalysis_dirStringsOf dtb__128)
  | _ -> failwith "DT: impossible branch"
))

# 445 "Vuna/Compiler/Ir/Analysis.vuna"
let rec v_Vuna_dCompiler_dIr_dAnalysis_dcheckUniqueDefNamesGo = (fun (mc0 : string Base_dData_dList.t_Base_dData_dList_dList) (mc1 : (string, bool) Base_dContainer_dHashMap.t_Base_dContainer_dHashMap_dHashMap) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__129, dtb__130) -> (if ((((Base_dContainer_dHashMap.v_Base_dContainer_dHashMap_dmember Base_dData_dString.v_Hashable_uString) Base_dData_dString.v_Eq_uString) dtb__129) mc1) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicInternal (String.concat "" ["duplicate runtime definition name in IR: `"; dtb__129; "`"])) else ((v_Vuna_dCompiler_dIr_dAnalysis_dcheckUniqueDefNamesGo dtb__130) ((((Base_dContainer_dHashMap.v_Base_dContainer_dHashMap_dinsert Base_dData_dString.v_Hashable_uString) dtb__129) true) mc1)))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (0))
  | _ -> failwith "DT: impossible branch"
))

# 442 "Vuna/Compiler/Ir/Analysis.vuna"
let v_Vuna_dCompiler_dIr_dAnalysis_dcheckUniqueDefNames = (fun (defs : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrDef Base_dData_dList.t_Base_dData_dList_dList) -> ((v_Vuna_dCompiler_dIr_dAnalysis_dcheckUniqueDefNamesGo ((Base_dData_dList.v_Base_dData_dList_dmap Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirDefName) defs)) ((Base_dContainer_dHashMap.v_Base_dContainer_dHashMap_dfromList Base_dData_dString.v_Hashable_uString) Base_dData_dList.C_Base_dData_dList_dList_Nil)))

# 482 "Vuna/Compiler/Ir/Analysis.vuna"
let rec v_Vuna_dCompiler_dIr_dAnalysis_dfirstBadRecName = (fun (mc0 : string Base_dData_dList.t_Base_dData_dList_dList) (mc1 : (string) -> bool) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__131, dtb__132) -> (if (mc1 dtb__131) then ((v_Vuna_dCompiler_dIr_dAnalysis_dfirstBadRecName dtb__132) mc1) else (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__131)))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 466 "Vuna/Compiler/Ir/Analysis.vuna"
let rec v_Vuna_dCompiler_dIr_dAnalysis_dassembleGo = (fun (mc0 : (string, string Base_dData_dList.t_Base_dData_dList_dList) Base_dContainer_dHashMap.t_Base_dContainer_dHashMap_dHashMap) (mc1 : string Base_dData_dList.t_Base_dData_dList_dList Base_dData_dList.t_Base_dData_dList_dList) (mc2 : (string) -> bool) (mc3 : (string) -> Vuna_dCompiler_dBase_dSource.t_Vuna_dCompiler_dBase_dSource_dSpan Base_dData_dMaybe.t_Base_dData_dMaybe_dMaybe) -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__133, dtb__134) -> ((fun isRec -> ((fun checked -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind checked) (fun (grp : (bool, string Base_dData_dList.t_Base_dData_dList_dList) Base_dData_dPair.t_Base_dData_dPair_dPair) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((v_Vuna_dCompiler_dIr_dAnalysis_dassembleGo mc0) dtb__134) mc2) mc3)) (fun (tail : (bool, string Base_dData_dList.t_Base_dData_dList_dList) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (grp, tail))))))))) (if isRec then (match ((v_Vuna_dCompiler_dIr_dAnalysis_dfirstBadRecName dtb__133) mc2) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__135) -> ((((Vuna_dCompiler_dBase_dDiagnostics_dCg.v_Vuna_dCompiler_dBase_dDiagnostics_dCg_dcgErrDefAt (mc3 dtb__135)) dtb__135) (Vuna_dCompiler_dBase_dDiagnostics_dCg.C_Vuna_dCompiler_dBase_dDiagnostics_dCg_dCgErr_RecursiveValueDefinition (dtb__135))) (Base_dData_dVec.C_Base_dData_dVec_dVec_VCons (dtb__135, Base_dData_dVec.C_Base_dData_dVec_dVec_Nil)))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = true; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__133 }))
  | _ -> failwith "DT: impossible branch"
) else (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = false; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__133 }))))) ((v_Vuna_dCompiler_dIr_dAnalysis_dgroupNeedsRec mc0) dtb__133))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (Base_dData_dList.C_Base_dData_dList_dList_Nil))
  | _ -> failwith "DT: impossible branch"
))

# 462 "Vuna/Compiler/Ir/Analysis.vuna"
let v_Vuna_dCompiler_dIr_dAnalysis_dgroupNamesGo = (fun (mc0 : (string, string Base_dData_dList.t_Base_dData_dList_dList) Base_dContainer_dHashMap.t_Base_dContainer_dHashMap_dHashMap) (mc1 : string Base_dData_dList.t_Base_dData_dList_dList) (mc2 : string Base_dData_dList.t_Base_dData_dList_dList Base_dData_dList.t_Base_dData_dList_dList Vuna_dCompiler_dBase_dDiag.t_Vuna_dCompiler_dBase_dDiag_dCheck) (mc3 : (string) -> bool) (mc4 : (string) -> Vuna_dCompiler_dBase_dSource.t_Vuna_dCompiler_dBase_dSource_dSpan Base_dData_dMaybe.t_Base_dData_dMaybe_dMaybe) -> (match mc2 with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__136) -> ((((v_Vuna_dCompiler_dIr_dAnalysis_dassembleGo mc0) dtb__136) mc3) mc4)
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__137) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__137))
  | _ -> failwith "DT: impossible branch"
))

# 458 "Vuna/Compiler/Ir/Analysis.vuna"
let v_Vuna_dCompiler_dIr_dAnalysis_dassembleGroupNames = (fun (adj : (string, string Base_dData_dList.t_Base_dData_dList_dList) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (names : string Base_dData_dList.t_Base_dData_dList_dList) (recOk : (string) -> bool) (spanOf : (string) -> Vuna_dCompiler_dBase_dSource.t_Vuna_dCompiler_dBase_dSource_dSpan Base_dData_dMaybe.t_Base_dData_dMaybe_dMaybe) -> (((((v_Vuna_dCompiler_dIr_dAnalysis_dgroupNamesGo (v_Vuna_dCompiler_dIr_dAnalysis_dadjTblOf adj)) names) ((v_Vuna_dCompiler_dIr_dAnalysis_dgroupNames adj) names)) recOk) spanOf))

# 488 "Vuna/Compiler/Ir/Analysis.vuna"
let rec v_Vuna_dCompiler_dIr_dAnalysis_dirMentionsGlobal = (fun (mc0 : string) (mc1 : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIr) -> (match mc1 with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrEffThunk (dtb__138, dtb__139, dtb__140, dtb__141, dtb__142) -> ((v_Vuna_dCompiler_dIr_dAnalysis_dirMentionsGlobal mc0) dtb__142)
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrConcatMany (dtb__143) -> ((v_Vuna_dCompiler_dIr_dAnalysis_danyMentions mc0) dtb__143)
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrNatCase (dtb__144, dtb__145, dtb__146, dtb__147, dtb__148) -> (if ((v_Vuna_dCompiler_dIr_dAnalysis_dirMentionsGlobal mc0) dtb__144) then true else (if ((v_Vuna_dCompiler_dIr_dAnalysis_danyMentionsAltM mc0) dtb__146) then true else (if ((v_Vuna_dCompiler_dIr_dAnalysis_danyMentionsAltM mc0) dtb__147) then true else ((v_Vuna_dCompiler_dIr_dAnalysis_danyMentionsAltM mc0) dtb__148))))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCase (dtb__149, dtb__150, dtb__151, dtb__152) -> (if ((v_Vuna_dCompiler_dIr_dAnalysis_dirMentionsGlobal mc0) dtb__151) then true else ((v_Vuna_dCompiler_dIr_dAnalysis_danyMentionsAlts mc0) dtb__152))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrIf (dtb__153, dtb__154, dtb__155) -> (if ((v_Vuna_dCompiler_dIr_dAnalysis_dirMentionsGlobal mc0) dtb__153) then true else (if ((v_Vuna_dCompiler_dIr_dAnalysis_dirMentionsGlobal mc0) dtb__154) then true else ((v_Vuna_dCompiler_dIr_dAnalysis_dirMentionsGlobal mc0) dtb__155)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (dtb__156, dtb__157, dtb__158) -> (if ((v_Vuna_dCompiler_dIr_dAnalysis_dirMentionsGlobal mc0) dtb__157) then true else ((v_Vuna_dCompiler_dIr_dAnalysis_dirMentionsGlobal mc0) dtb__158))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLam (dtb__159, dtb__160, dtb__161) -> ((v_Vuna_dCompiler_dIr_dAnalysis_dirMentionsGlobal mc0) dtb__161)
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLet (dtb__162, dtb__163, dtb__164) -> (if ((v_Vuna_dCompiler_dIr_dAnalysis_dirMentionsGlobal mc0) dtb__163) then true else ((v_Vuna_dCompiler_dIr_dAnalysis_dirMentionsGlobal mc0) dtb__164))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCast (dtb__165, dtb__166, dtb__167) -> ((v_Vuna_dCompiler_dIr_dAnalysis_dirMentionsGlobal mc0) dtb__167)
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRtApp (dtb__168, dtb__169) -> ((v_Vuna_dCompiler_dIr_dAnalysis_danyMentions mc0) dtb__169)
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRecUpd (dtb__170, dtb__171, dtb__172, dtb__173) -> (if ((v_Vuna_dCompiler_dIr_dAnalysis_dirMentionsGlobal mc0) dtb__170) then true else ((v_Vuna_dCompiler_dIr_dAnalysis_danyMentionsFields mc0) dtb__172))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrProj (dtb__174, dtb__175, dtb__176, dtb__177) -> ((v_Vuna_dCompiler_dIr_dAnalysis_dirMentionsGlobal mc0) dtb__174)
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRecord (dtb__178, dtb__179, dtb__180) -> ((v_Vuna_dCompiler_dIr_dAnalysis_danyMentionsFields mc0) dtb__180)
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCtor (dtb__181, dtb__182, dtb__183, dtb__184) -> ((v_Vuna_dCompiler_dIr_dAnalysis_danyMentions mc0) dtb__184)
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrGlobal (dtb__185) -> (dtb__185 = mc0)
  | _ -> false
))
# 512 "Vuna/Compiler/Ir/Analysis.vuna"
and v_Vuna_dCompiler_dIr_dAnalysis_danyMentions = (fun (mc0 : string) (mc1 : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIr Base_dData_dList.t_Base_dData_dList_dList) -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__186, dtb__187) -> (if ((v_Vuna_dCompiler_dIr_dAnalysis_dirMentionsGlobal mc0) dtb__186) then true else ((v_Vuna_dCompiler_dIr_dAnalysis_danyMentions mc0) dtb__187))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))
# 516 "Vuna/Compiler/Ir/Analysis.vuna"
and v_Vuna_dCompiler_dIr_dAnalysis_danyMentionsFields = (fun (mc0 : string) (mc1 : (string, Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIr) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__188, dtb__189) -> (match dtb__188 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__190; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__191 } -> (if ((v_Vuna_dCompiler_dIr_dAnalysis_dirMentionsGlobal mc0) dtb__191) then true else ((v_Vuna_dCompiler_dIr_dAnalysis_danyMentionsFields mc0) dtb__189))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))
# 521 "Vuna/Compiler/Ir/Analysis.vuna"
and v_Vuna_dCompiler_dIr_dAnalysis_danyMentionsAlts = (fun (mc0 : string) (mc1 : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrAlt Base_dData_dList.t_Base_dData_dList_dList) -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__192, dtb__193) -> (if ((v_Vuna_dCompiler_dIr_dAnalysis_dirMentionsGlobal mc0) (Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirAltBodyOf dtb__192)) then true else ((v_Vuna_dCompiler_dIr_dAnalysis_danyMentionsAlts mc0) dtb__193))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))
# 526 "Vuna/Compiler/Ir/Analysis.vuna"
and v_Vuna_dCompiler_dIr_dAnalysis_danyMentionsAltM = (fun (mc0 : string) (mc1 : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrAlt Base_dData_dMaybe.t_Base_dData_dMaybe_dMaybe) -> (match mc1 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__194) -> ((v_Vuna_dCompiler_dIr_dAnalysis_dirMentionsGlobal mc0) (Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirAltBodyOf dtb__194))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
))
