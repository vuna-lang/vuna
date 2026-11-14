open Vuna_runtime
# 38 "Vuna/Compiler/Ir.vuna"
let rec v_Vuna_dCompiler_dIr_dcheckSymbolRefs = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__0, dtb__1) -> (match (Vuna_dCompiler_dIr_dRuntime.v_Vuna_dCompiler_dIr_dRuntime_dirRtLookup (Base_dPair.v_Base_dPair_dfirstOf dtb__0)) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicInternal (String.concat "" ["IR references an undeclared runtime symbol: `"; (Base_dPair.v_Base_dPair_dfirstOf dtb__0); "`"]))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__2) -> (match (Base_dPair.v_Base_dPair_dsecondOf dtb__0) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (v_Vuna_dCompiler_dIr_dcheckSymbolRefs dtb__1)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__3) -> (if (if (dtb__3 > 0) then ((Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirInlineArity (Base_dPair.v_Base_dPair_dfirstOf dtb__0)) = dtb__3) else false) then (v_Vuna_dCompiler_dIr_dcheckSymbolRefs dtb__1) else (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicInternal (String.concat "" ["IR saturated runtime symbol `"; (Base_dPair.v_Base_dPair_dfirstOf dtb__0); "` has the wrong arity ("; (bi_strFromInt dtb__3); ")"])))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (0))
  | _ -> failwith "DT: impossible branch"
))

# 27 "Vuna/Compiler/Ir.vuna"
let v_Vuna_dCompiler_dIr_dvalidateUnit = (fun u -> ((fun defs -> ((fun names -> ((fun adj -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (Vuna_dCompiler_dIr_dAnalysis.v_Vuna_dCompiler_dIr_dAnalysis_dcheckUniqueDefNames defs)) (fun _u -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((Vuna_dCompiler_dIr_dAnalysis.v_Vuna_dCompiler_dIr_dAnalysis_dgroupNames adj) names)) (fun _u -> (v_Vuna_dCompiler_dIr_dcheckSymbolRefs (Vuna_dCompiler_dIr_dRuntime.v_Vuna_dCompiler_dIr_dRuntime_dirSymbolsOfUnit u))))))) ((Base_dList.v_Base_dList_dmap (fun d -> { Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirDefName d); Base_dPair.f_Base_dPair_dPair_second = (Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirDefDeps d) })) defs))) ((Base_dList.v_Base_dList_dmap Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirDefName) defs))) ((Base_dList.v_Base_dList_dconcatMap Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirGroupDefs) (u).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrUnit_irUnitGroups)))

# 49 "Vuna/Compiler/Ir.vuna"
let v_Vuna_dCompiler_dIr_dvalidateProgram = (fun p -> ((fun u -> ((fun defs -> (match (u).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrUnit_irUnitEntry with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (v_Vuna_dCompiler_dIr_dvalidateUnit u)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__4) -> (if ((Base_dList.v_Base_dList_dmemName (dtb__4).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrEntry_irEntryMain) ((Base_dList.v_Base_dList_dmap Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirDefName) defs)) then (v_Vuna_dCompiler_dIr_dvalidateUnit u) else (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicInternal (String.concat "" ["IR entry references an undefined main: `"; (dtb__4).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrEntry_irEntryMain; "`"])))
  | _ -> failwith "DT: impossible branch"
)) ((Base_dList.v_Base_dList_dconcatMap Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirGroupDefs) (u).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrUnit_irUnitGroups))) (p).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrProgram_irProgUnit))
