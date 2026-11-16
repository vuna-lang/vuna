open Vuna_runtime
# 61 "Vuna/Compiler/Ir.vuna"
let rec v_Vuna_dCompiler_dIr_dfirstMissingDep = (fun mc0 mc1 mc2 mc3 -> (match mc3 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__0, dtb__1) -> (if ((((Base_dHashMap.v_Base_dHashMap_dmember Base_dString.v_Hashable_uString) Base_dString.v_Eq_uString) dtb__0) mc0) then (if ((((Base_dHashMap.v_Base_dHashMap_dmember Base_dString.v_Hashable_uString) Base_dString.v_Eq_uString) dtb__0) mc1) then ((((v_Vuna_dCompiler_dIr_dfirstMissingDep mc0) mc1) mc2) dtb__1) else (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Base_dPair.f_Base_dPair_dPair_first = mc2; Base_dPair.f_Base_dPair_dPair_second = dtb__0 }))) else ((((v_Vuna_dCompiler_dIr_dfirstMissingDep mc0) mc1) mc2) dtb__1))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 55 "Vuna/Compiler/Ir.vuna"
let rec v_Vuna_dCompiler_dIr_dfirstUnorderedDepGo = (fun mc0 mc1 mc2 -> (match mc2 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__2, dtb__3) -> (match ((((v_Vuna_dCompiler_dIr_dfirstMissingDep mc0) mc1) (Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirDefName dtb__2)) (Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirDefDeps dtb__2)) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__4) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__4))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (((v_Vuna_dCompiler_dIr_dfirstUnorderedDepGo mc0) mc1) dtb__3)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 52 "Vuna/Compiler/Ir.vuna"
let v_Vuna_dCompiler_dIr_dfirstUnorderedDep = (fun nameTbl visible defs -> (((v_Vuna_dCompiler_dIr_dfirstUnorderedDepGo nameTbl) visible) defs))

# 40 "Vuna/Compiler/Ir.vuna"
let rec v_Vuna_dCompiler_dIr_dcheckGroupOrderGo = (fun mc0 mc1 mc2 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__5, dtb__6) -> ((fun members -> ((fun visible -> (match (((v_Vuna_dCompiler_dIr_dfirstUnorderedDep mc2) visible) members) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (((v_Vuna_dCompiler_dIr_dcheckGroupOrderGo dtb__6) visible) mc2)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__7) -> (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicInternal (String.concat "" ["IR group order is inconsistent: `"; (Base_dPair.v_Base_dPair_dsecondOf dtb__7); "` referenced before it is defined (group of `"; (Base_dPair.v_Base_dPair_dfirstOf dtb__7); "`)"]))
  | _ -> failwith "DT: impossible branch"
)) (((Base_dList.v_Base_dList_dfoldl (fun acc d -> ((((Base_dHashMap.v_Base_dHashMap_dinsert Base_dString.v_Hashable_uString) (Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirDefName d)) true) acc))) mc1) members))) (Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirGroupDefs dtb__5))
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (0))
  | _ -> failwith "DT: impossible branch"
))

# 37 "Vuna/Compiler/Ir.vuna"
let v_Vuna_dCompiler_dIr_dcheckGroupOrder = (fun groups nameTbl -> (((v_Vuna_dCompiler_dIr_dcheckGroupOrderGo groups) ((Base_dHashMap.v_Base_dHashMap_dfromList Base_dString.v_Hashable_uString) Base_dList.C_Base_dList_dList_Nil)) nameTbl))

# 70 "Vuna/Compiler/Ir.vuna"
let rec v_Vuna_dCompiler_dIr_dcheckSymbolRefs = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__8, dtb__9) -> (match (Vuna_dCompiler_dIr_dRuntime.v_Vuna_dCompiler_dIr_dRuntime_dirRtLookup (Base_dPair.v_Base_dPair_dfirstOf dtb__8)) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicInternal (String.concat "" ["IR references an undeclared runtime symbol: `"; (Base_dPair.v_Base_dPair_dfirstOf dtb__8); "`"]))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__10) -> (match (Base_dPair.v_Base_dPair_dsecondOf dtb__8) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (v_Vuna_dCompiler_dIr_dcheckSymbolRefs dtb__9)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__11) -> (if (if (dtb__11 > 0) then ((Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirInlineArity (Base_dPair.v_Base_dPair_dfirstOf dtb__8)) = dtb__11) else false) then (v_Vuna_dCompiler_dIr_dcheckSymbolRefs dtb__9) else (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicInternal (String.concat "" ["IR saturated runtime symbol `"; (Base_dPair.v_Base_dPair_dfirstOf dtb__8); "` has the wrong arity ("; (bi_strFromInt dtb__11); ")"])))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (0))
  | _ -> failwith "DT: impossible branch"
))

# 28 "Vuna/Compiler/Ir.vuna"
let v_Vuna_dCompiler_dIr_dvalidateUnit = (fun u -> ((fun defs -> ((fun nameTbl -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (Vuna_dCompiler_dIr_dAnalysis.v_Vuna_dCompiler_dIr_dAnalysis_dcheckUniqueDefNames defs)) (fun _u -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((v_Vuna_dCompiler_dIr_dcheckGroupOrder (u).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrUnit_irUnitGroups) nameTbl)) (fun _u -> (v_Vuna_dCompiler_dIr_dcheckSymbolRefs (Vuna_dCompiler_dIr_dRuntime.v_Vuna_dCompiler_dIr_dRuntime_dirSymbolsOfUnit u))))))) (Base_dHashMap.v_Base_dHashMap_dofNames ((Base_dList.v_Base_dList_dmap Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirDefName) defs)))) ((Base_dList.v_Base_dList_dconcatMap Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirGroupDefs) (u).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrUnit_irUnitGroups)))

# 81 "Vuna/Compiler/Ir.vuna"
let v_Vuna_dCompiler_dIr_dvalidateProgram = (fun p -> ((fun u -> ((fun defs -> (match (u).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrUnit_irUnitEntry with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (v_Vuna_dCompiler_dIr_dvalidateUnit u)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__12) -> (if ((Base_dList.v_Base_dList_dmemName (dtb__12).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrEntry_irEntryMain) ((Base_dList.v_Base_dList_dmap Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirDefName) defs)) then (v_Vuna_dCompiler_dIr_dvalidateUnit u) else (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicInternal (String.concat "" ["IR entry references an undefined main: `"; (dtb__12).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrEntry_irEntryMain; "`"])))
  | _ -> failwith "DT: impossible branch"
)) ((Base_dList.v_Base_dList_dconcatMap Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirGroupDefs) (u).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrUnit_irUnitGroups))) (p).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrProgram_irProgUnit))
