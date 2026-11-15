open Vuna_runtime
type t_Vuna_dCompiler_dWasm_dModule_dWasmOutcome = C_Vuna_dCompiler_dWasm_dModule_dWasmOutcome_WasmOk of (Vuna_dCompiler_dWasm_dModel.t_Vuna_dCompiler_dWasm_dModel_dWasmModule) | C_Vuna_dCompiler_dWasm_dModule_dWasmOutcome_WasmRejected of (Vuna_dCompiler_dWasm_dModel.t_Vuna_dCompiler_dWasm_dModel_dWasmErr)
and t_Vuna_dCompiler_dWasm_dModule_dGenState = { f_Vuna_dCompiler_dWasm_dModule_dGenState_gsFams : Vuna_dCompiler_dWasm_dTypes.t_Vuna_dCompiler_dWasm_dTypes_dWasmFam Base_dList.t_Base_dList_dList; f_Vuna_dCompiler_dWasm_dModule_dGenState_gsDefs : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrDef Base_dList.t_Base_dList_dList; f_Vuna_dCompiler_dWasm_dModule_dGenState_gsPool : (string, (int, int) Base_dPair.t_Base_dPair_dPair) Base_dPair.t_Base_dPair_dPair Base_dList.t_Base_dList_dList; f_Vuna_dCompiler_dWasm_dModule_dGenState_gsFuncs : Vuna_dCompiler_dWasm_dModel.t_Vuna_dCompiler_dWasm_dModel_dWatFunc Base_dList.t_Base_dList_dList; f_Vuna_dCompiler_dWasm_dModule_dGenState_gsLocals : (string, Vuna_dCompiler_dWasm_dModel.t_Vuna_dCompiler_dWasm_dModel_dWatValTy) Base_dPair.t_Base_dPair_dPair Base_dList.t_Base_dList_dList; f_Vuna_dCompiler_dWasm_dModule_dGenState_gsNextLocal : int; f_Vuna_dCompiler_dWasm_dModule_dGenState_gsScope : (Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrBinder, string) Base_dPair.t_Base_dPair_dPair Base_dList.t_Base_dList_dList; f_Vuna_dCompiler_dWasm_dModule_dGenState_gsConsts : Vuna_dCompiler_dWasm_dRuntime.t_Vuna_dCompiler_dWasm_dRuntime_dRtConsts }

# 40 "Vuna/Compiler/Wasm/Module.vuna"
let v_Vuna_dCompiler_dWasm_dModule_dbinderNameOf = (fun mc0 -> (match mc0 with
  | { Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrBinder_irBinderName = dtb__0; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrBinder_irBinderErased = dtb__1 } -> dtb__0
  | _ -> failwith "DT: impossible branch"
))

# 43 "Vuna/Compiler/Wasm/Module.vuna"
let v_Vuna_dCompiler_dWasm_dModule_dbinderErasedOf = (fun mc0 -> (match mc0 with
  | { Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrBinder_irBinderName = dtb__2; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrBinder_irBinderErased = dtb__3 } -> dtb__3
  | _ -> failwith "DT: impossible branch"
))

# 46 "Vuna/Compiler/Wasm/Module.vuna"
let v_Vuna_dCompiler_dWasm_dModule_dbNameEq = (fun a b -> (match a with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrBName_IrBUser (dtb__4) -> (match b with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrBName_IrBUser (dtb__5) -> (dtb__4 = dtb__5)
  | _ -> false
)
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrBName_IrBArm (dtb__6) -> (match b with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrBName_IrBArm (dtb__7) -> (dtb__6 = dtb__7)
  | _ -> false
)
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrBName_IrBNat (dtb__8) -> (match b with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrBName_IrBNat (dtb__9) -> (dtb__8 = dtb__9)
  | _ -> false
)
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrBName_IrBWild -> (match b with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrBName_IrBWild -> true
  | _ -> false
)
  | _ -> failwith "DT: impossible branch"
))

# 61 "Vuna/Compiler/Wasm/Module.vuna"
let v_Vuna_dCompiler_dWasm_dModule_dbinderEq = (fun a b -> (if ((v_Vuna_dCompiler_dWasm_dModule_dbNameEq (v_Vuna_dCompiler_dWasm_dModule_dbinderNameOf a)) (v_Vuna_dCompiler_dWasm_dModule_dbinderNameOf b)) then (((Base_dEq.v_Base_dEq_deq Base_dEq.v_Eq_uBase_uBool_uBool) (v_Vuna_dCompiler_dWasm_dModule_dbinderErasedOf a)) (v_Vuna_dCompiler_dWasm_dModule_dbinderErasedOf b)) else false))

# 64 "Vuna/Compiler/Wasm/Module.vuna"
let rec v_Vuna_dCompiler_dWasm_dModule_dlookupBinder = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__10, dtb__11) -> (if ((v_Vuna_dCompiler_dWasm_dModule_dbinderEq mc0) (Base_dPair.v_Base_dPair_dfirstOf dtb__10)) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((Base_dPair.v_Base_dPair_dsecondOf dtb__10))) else ((v_Vuna_dCompiler_dWasm_dModule_dlookupBinder mc0) dtb__11))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 69 "Vuna/Compiler/Wasm/Module.vuna"
let v_Vuna_dCompiler_dWasm_dModule_dfreshLocal = (fun st ty -> ((fun name -> ((fun st1 -> { Base_dPair.f_Base_dPair_dPair_first = name; Base_dPair.f_Base_dPair_dPair_second = st1 }) { st with f_Vuna_dCompiler_dWasm_dModule_dGenState_gsLocals = ((Base_dList.v_Base_dList_dappend (st).f_Vuna_dCompiler_dWasm_dModule_dGenState_gsLocals) (Base_dList.C_Base_dList_dList_Cons ({ Base_dPair.f_Base_dPair_dPair_first = name; Base_dPair.f_Base_dPair_dPair_second = ty }, Base_dList.C_Base_dList_dList_Nil))); f_Vuna_dCompiler_dWasm_dModule_dGenState_gsNextLocal = ((st).f_Vuna_dCompiler_dWasm_dModule_dGenState_gsNextLocal + 1) })) ("$l" ^ (bi_strFromInt (st).f_Vuna_dCompiler_dWasm_dModule_dGenState_gsNextLocal))))

# 76 "Vuna/Compiler/Wasm/Module.vuna"
let v_Vuna_dCompiler_dWasm_dModule_dpushBinder = (fun b l st -> { st with f_Vuna_dCompiler_dWasm_dModule_dGenState_gsScope = (Base_dList.C_Base_dList_dList_Cons ({ Base_dPair.f_Base_dPair_dPair_first = b; Base_dPair.f_Base_dPair_dPair_second = l }, (st).f_Vuna_dCompiler_dWasm_dModule_dGenState_gsScope)) })

# 80 "Vuna/Compiler/Wasm/Module.vuna"
let v_Vuna_dCompiler_dWasm_dModule_drestoreScope = (fun scope st -> { st with f_Vuna_dCompiler_dWasm_dModule_dGenState_gsScope = scope })

# 84 "Vuna/Compiler/Wasm/Module.vuna"
let v_Vuna_dCompiler_dWasm_dModule_druntimeBinders = (fun bs -> ((Base_dList.v_Base_dList_dfilter (fun b -> (Base_dBool.v_Base_dBool_dnot (v_Vuna_dCompiler_dWasm_dModule_dbinderErasedOf b)))) bs))

# 88 "Vuna/Compiler/Wasm/Module.vuna"
let v_Vuna_dCompiler_dWasm_dModule_dbeginFuncScope = (fun st -> ((fun st1 -> { st1 with f_Vuna_dCompiler_dWasm_dModule_dGenState_gsNextLocal = 0; f_Vuna_dCompiler_dWasm_dModule_dGenState_gsScope = Base_dList.C_Base_dList_dList_Nil }) { st with f_Vuna_dCompiler_dWasm_dModule_dGenState_gsLocals = Base_dList.C_Base_dList_dList_Nil }))

# 95 "Vuna/Compiler/Wasm/Module.vuna"
let v_Vuna_dCompiler_dWasm_dModule_dendFuncScope = (fun st locals next scope -> ((fun st1 -> { st1 with f_Vuna_dCompiler_dWasm_dModule_dGenState_gsNextLocal = next; f_Vuna_dCompiler_dWasm_dModule_dGenState_gsScope = scope }) { st with f_Vuna_dCompiler_dWasm_dModule_dGenState_gsLocals = locals }))

# 103 "Vuna/Compiler/Wasm/Module.vuna"
let v_Vuna_dCompiler_dWasm_dModule_dmergeArmState = (fun a b -> (if ((b).f_Vuna_dCompiler_dWasm_dModule_dGenState_gsNextLocal > (a).f_Vuna_dCompiler_dWasm_dModule_dGenState_gsNextLocal) then b else a))

# 106 "Vuna/Compiler/Wasm/Module.vuna"
let rec v_Vuna_dCompiler_dWasm_dModule_dzipIdx = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__12, dtb__13) -> (Base_dList.C_Base_dList_dList_Cons ({ Base_dPair.f_Base_dPair_dPair_first = dtb__12; Base_dPair.f_Base_dPair_dPair_second = ("$p" ^ (bi_strFromInt mc0)) }, ((v_Vuna_dCompiler_dWasm_dModule_dzipIdx (mc0 + 1)) dtb__13)))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 110 "Vuna/Compiler/Wasm/Module.vuna"
let v_Vuna_dCompiler_dWasm_dModule_dfuncParams = (fun n -> ((Base_dList.v_Base_dList_dmap (fun i -> { Base_dPair.f_Base_dPair_dPair_first = ("$p" ^ (bi_strFromInt i)); Base_dPair.f_Base_dPair_dPair_second = Vuna_dCompiler_dWasm_dModel.C_Vuna_dCompiler_dWasm_dModel_dWatValTy_WvAnyRef })) ((Base_dList.v_Base_dList_drange 0) n)))

# 116 "Vuna/Compiler/Wasm/Module.vuna"
let rec v_Vuna_dCompiler_dWasm_dModule_dmemStr = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__14, dtb__15) -> (if (mc0 = dtb__14) then true else ((v_Vuna_dCompiler_dWasm_dModule_dmemStr mc0) dtb__15))
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 120 "Vuna/Compiler/Wasm/Module.vuna"
let v_Vuna_dCompiler_dWasm_dModule_daddString = (fun s pool -> (if ((v_Vuna_dCompiler_dWasm_dModule_dmemStr s) pool) then pool else ((Base_dList.v_Base_dList_dappend pool) (Base_dList.C_Base_dList_dList_Cons (s, Base_dList.C_Base_dList_dList_Nil)))))

# 123 "Vuna/Compiler/Wasm/Module.vuna"
let rec v_Vuna_dCompiler_dWasm_dModule_dstrLitsAltFuel = (fun fuel alts -> (if (fuel <= 0) then Base_dList.C_Base_dList_dList_Nil else (match alts with
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | Base_dList.C_Base_dList_dList_Cons (dtb__16, dtb__17) -> ((Base_dList.v_Base_dList_dappend ((v_Vuna_dCompiler_dWasm_dModule_dstrLitsOfFuel (fuel - 1)) (Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirAltBodyOf dtb__16))) ((v_Vuna_dCompiler_dWasm_dModule_dstrLitsAltFuel (fuel - 1)) dtb__17))
  | _ -> failwith "DT: impossible branch"
)))
# 129 "Vuna/Compiler/Wasm/Module.vuna"
and v_Vuna_dCompiler_dWasm_dModule_dstrLitsAltMaybeFuel = (fun fuel ms -> (if (fuel <= 0) then Base_dList.C_Base_dList_dList_Nil else ((fun nd_uscrut2 -> (match nd_uscrut2 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__18, dtb__19) -> (match dtb__18 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__20) -> ((Base_dList.v_Base_dList_dappend ((v_Vuna_dCompiler_dWasm_dModule_dstrLitsOfFuel (fuel - 1)) (Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirAltBodyOf dtb__20))) ((v_Vuna_dCompiler_dWasm_dModule_dstrLitsAltMaybeFuel (fuel - 1)) dtb__19))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((v_Vuna_dCompiler_dWasm_dModule_dstrLitsAltMaybeFuel (fuel - 1)) dtb__19)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
)) ms)))
# 137 "Vuna/Compiler/Wasm/Module.vuna"
and v_Vuna_dCompiler_dWasm_dModule_dstrLitsFieldsFuel = (fun fuel fs -> (if (fuel <= 0) then Base_dList.C_Base_dList_dList_Nil else (match fs with
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | Base_dList.C_Base_dList_dList_Cons (dtb__21, dtb__22) -> ((Base_dList.v_Base_dList_dappend ((v_Vuna_dCompiler_dWasm_dModule_dstrLitsOfFuel (fuel - 1)) (Base_dPair.v_Base_dPair_dsecondOf dtb__21))) ((v_Vuna_dCompiler_dWasm_dModule_dstrLitsFieldsFuel (fuel - 1)) dtb__22))
  | _ -> failwith "DT: impossible branch"
)))
# 143 "Vuna/Compiler/Wasm/Module.vuna"
and v_Vuna_dCompiler_dWasm_dModule_dstrLitsArgsFuel = (fun fuel args -> (if (fuel <= 0) then Base_dList.C_Base_dList_dList_Nil else (match args with
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | Base_dList.C_Base_dList_dList_Cons (dtb__23, dtb__24) -> ((Base_dList.v_Base_dList_dappend ((v_Vuna_dCompiler_dWasm_dModule_dstrLitsOfFuel (fuel - 1)) dtb__23)) ((v_Vuna_dCompiler_dWasm_dModule_dstrLitsArgsFuel (fuel - 1)) dtb__24))
  | _ -> failwith "DT: impossible branch"
)))
# 149 "Vuna/Compiler/Wasm/Module.vuna"
and v_Vuna_dCompiler_dWasm_dModule_dstrLitsOfFuel = (fun fuel ir -> (if (fuel <= 0) then Base_dList.C_Base_dList_dList_Nil else (match ir with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrStr (dtb__25) -> (Base_dList.C_Base_dList_dList_Cons (dtb__25, Base_dList.C_Base_dList_dList_Nil))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrVar (dtb__26) -> Base_dList.C_Base_dList_dList_Nil
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrGlobal (dtb__27) -> Base_dList.C_Base_dList_dList_Nil
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrInt (dtb__28) -> Base_dList.C_Base_dList_dList_Nil
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrBool (dtb__29) -> Base_dList.C_Base_dList_dList_Nil
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrFloatLit (dtb__30) -> Base_dList.C_Base_dList_dList_Nil
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRt (dtb__31) -> Base_dList.C_Base_dList_dList_Nil
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCast (dtb__32) -> ((v_Vuna_dCompiler_dWasm_dModule_dstrLitsOfFuel (fuel - 1)) dtb__32)
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (dtb__33, dtb__34) -> ((Base_dList.v_Base_dList_dappend ((v_Vuna_dCompiler_dWasm_dModule_dstrLitsOfFuel (fuel - 1)) dtb__33)) ((v_Vuna_dCompiler_dWasm_dModule_dstrLitsOfFuel (fuel - 1)) dtb__34))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLam (dtb__35, dtb__36) -> ((v_Vuna_dCompiler_dWasm_dModule_dstrLitsOfFuel (fuel - 1)) dtb__36)
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLet (dtb__37, dtb__38, dtb__39) -> ((Base_dList.v_Base_dList_dappend ((v_Vuna_dCompiler_dWasm_dModule_dstrLitsOfFuel (fuel - 1)) dtb__38)) ((v_Vuna_dCompiler_dWasm_dModule_dstrLitsOfFuel (fuel - 1)) dtb__39))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrIf (dtb__40, dtb__41, dtb__42) -> ((Base_dList.v_Base_dList_dappend ((v_Vuna_dCompiler_dWasm_dModule_dstrLitsOfFuel (fuel - 1)) dtb__40)) ((Base_dList.v_Base_dList_dappend ((v_Vuna_dCompiler_dWasm_dModule_dstrLitsOfFuel (fuel - 1)) dtb__41)) ((v_Vuna_dCompiler_dWasm_dModule_dstrLitsOfFuel (fuel - 1)) dtb__42)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCase (dtb__43, dtb__44) -> ((Base_dList.v_Base_dList_dappend ((v_Vuna_dCompiler_dWasm_dModule_dstrLitsOfFuel (fuel - 1)) dtb__43)) ((v_Vuna_dCompiler_dWasm_dModule_dstrLitsAltFuel (fuel - 1)) dtb__44))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrNatCase (dtb__45, dtb__46, dtb__47, dtb__48, dtb__49) -> ((Base_dList.v_Base_dList_dappend ((v_Vuna_dCompiler_dWasm_dModule_dstrLitsOfFuel (fuel - 1)) dtb__45)) ((v_Vuna_dCompiler_dWasm_dModule_dstrLitsAltMaybeFuel (fuel - 1)) (Base_dList.C_Base_dList_dList_Cons (dtb__47, (Base_dList.C_Base_dList_dList_Cons (dtb__48, (Base_dList.C_Base_dList_dList_Cons (dtb__49, Base_dList.C_Base_dList_dList_Nil))))))))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRtApp (dtb__50, dtb__51) -> ((v_Vuna_dCompiler_dWasm_dModule_dstrLitsArgsFuel (fuel - 1)) dtb__51)
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrConcatMany (dtb__52) -> ((v_Vuna_dCompiler_dWasm_dModule_dstrLitsArgsFuel (fuel - 1)) dtb__52)
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCtor (dtb__53, dtb__54, dtb__55) -> ((v_Vuna_dCompiler_dWasm_dModule_dstrLitsArgsFuel (fuel - 1)) dtb__55)
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRecord (dtb__56, dtb__57) -> ((v_Vuna_dCompiler_dWasm_dModule_dstrLitsFieldsFuel (fuel - 1)) dtb__57)
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrProj (dtb__58, dtb__59, dtb__60) -> ((v_Vuna_dCompiler_dWasm_dModule_dstrLitsOfFuel (fuel - 1)) dtb__58)
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRecUpd (dtb__61, dtb__62, dtb__63) -> ((Base_dList.v_Base_dList_dappend ((v_Vuna_dCompiler_dWasm_dModule_dstrLitsOfFuel (fuel - 1)) dtb__61)) ((v_Vuna_dCompiler_dWasm_dModule_dstrLitsFieldsFuel (fuel - 1)) dtb__63))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrEffThunk (dtb__64, dtb__65, dtb__66, dtb__67, dtb__68) -> ((v_Vuna_dCompiler_dWasm_dModule_dstrLitsOfFuel (fuel - 1)) dtb__68)
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrEffBind (dtb__69, dtb__70, dtb__71) -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
)))

# 178 "Vuna/Compiler/Wasm/Module.vuna"
let v_Vuna_dCompiler_dWasm_dModule_dstrLitsDef = (fun d -> (match d with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrDef_IrDef (dtb__72, dtb__73, dtb__74, dtb__75, dtb__76, dtb__77, dtb__78) -> ((v_Vuna_dCompiler_dWasm_dModule_dstrLitsOfFuel 100000) dtb__75)
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrDef_IrExternDef (dtb__79, dtb__80, dtb__81, dtb__82) -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 183 "Vuna/Compiler/Wasm/Module.vuna"
let rec v_Vuna_dCompiler_dWasm_dModule_dpoolOffsets = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__83, dtb__84) -> (Base_dList.C_Base_dList_dList_Cons ({ Base_dPair.f_Base_dPair_dPair_first = dtb__83; Base_dPair.f_Base_dPair_dPair_second = { Base_dPair.f_Base_dPair_dPair_first = mc1; Base_dPair.f_Base_dPair_dPair_second = (bi_strLength dtb__83) } }, ((v_Vuna_dCompiler_dWasm_dModule_dpoolOffsets dtb__84) (mc1 + (bi_strLength dtb__83)))))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 188 "Vuna/Compiler/Wasm/Module.vuna"
let rec v_Vuna_dCompiler_dWasm_dModule_dpoolLookup = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__85, dtb__86) -> (if ((Base_dPair.v_Base_dPair_dfirstOf dtb__85) = mc0) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((Base_dPair.v_Base_dPair_dsecondOf dtb__85))) else ((v_Vuna_dCompiler_dWasm_dModule_dpoolLookup mc0) dtb__86))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 198 "Vuna/Compiler/Wasm/Module.vuna"
let v_Vuna_dCompiler_dWasm_dModule_dboolI31 = (fun b -> (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dWasm_dInstr.C_Vuna_dCompiler_dWasm_dInstr_dInstr_IConstI32 ((if b then 1 else 0))), (Base_dList.C_Base_dList_dList_Cons (Vuna_dCompiler_dWasm_dInstr.C_Vuna_dCompiler_dWasm_dInstr_dInstr_II31New, Base_dList.C_Base_dList_dList_Nil)))))

# 201 "Vuna/Compiler/Wasm/Module.vuna"
let v_Vuna_dCompiler_dWasm_dModule_demptyStr = (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dWasm_dInstr.C_Vuna_dCompiler_dWasm_dInstr_dInstr_IConstI32 (0)), (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dWasm_dInstr.C_Vuna_dCompiler_dWasm_dInstr_dInstr_IArrayNewDefault ("$str")), Base_dList.C_Base_dList_dList_Nil))))

# 230 "Vuna/Compiler/Wasm/Module.vuna"
let v_Vuna_dCompiler_dWasm_dModule_dgenVar = (fun st b -> (match ((v_Vuna_dCompiler_dWasm_dModule_dlookupBinder b) (st).f_Vuna_dCompiler_dWasm_dModule_dGenState_gsScope) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__87) -> (Base_dResult.C_Base_dResult_dResult_Ok ({ Base_dPair.f_Base_dPair_dPair_first = (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dWasm_dInstr.C_Vuna_dCompiler_dWasm_dInstr_dInstr_ILocalGet (dtb__87)), Base_dList.C_Base_dList_dList_Nil)); Base_dPair.f_Base_dPair_dPair_second = st }))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (Base_dResult.C_Base_dResult_dResult_Err ("unbound runtime binder in wasm codegen"))
  | _ -> failwith "DT: impossible branch"
))

# 243 "Vuna/Compiler/Wasm/Module.vuna"
let v_Vuna_dCompiler_dWasm_dModule_dgenStr = (fun st s -> (if ((bi_strLength s) = 0) then (Base_dResult.C_Base_dResult_dResult_Ok ({ Base_dPair.f_Base_dPair_dPair_first = v_Vuna_dCompiler_dWasm_dModule_demptyStr; Base_dPair.f_Base_dPair_dPair_second = st })) else (match ((v_Vuna_dCompiler_dWasm_dModule_dpoolLookup s) (st).f_Vuna_dCompiler_dWasm_dModule_dGenState_gsPool) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (Base_dResult.C_Base_dResult_dResult_Err ("string literal missing from wasm data pool"))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__88) -> (Base_dResult.C_Base_dResult_dResult_Ok ({ Base_dPair.f_Base_dPair_dPair_first = (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dWasm_dInstr.C_Vuna_dCompiler_dWasm_dInstr_dInstr_IConstI32 ((Base_dPair.v_Base_dPair_dfirstOf dtb__88))), (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dWasm_dInstr.C_Vuna_dCompiler_dWasm_dInstr_dInstr_IConstI32 ((Base_dPair.v_Base_dPair_dsecondOf dtb__88))), (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dWasm_dInstr.C_Vuna_dCompiler_dWasm_dInstr_dInstr_IArrayNewData ("$str", "$d0")), Base_dList.C_Base_dList_dList_Nil)))))); Base_dPair.f_Base_dPair_dPair_second = st }))
  | _ -> failwith "DT: impossible branch"
)))

# 290 "Vuna/Compiler/Wasm/Module.vuna"
let rec v_Vuna_dCompiler_dWasm_dModule_dlistLengthB = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__89, dtb__90) -> (1 + (v_Vuna_dCompiler_dWasm_dModule_dlistLengthB dtb__90))
  | Base_dList.C_Base_dList_dList_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))

# 297 "Vuna/Compiler/Wasm/Module.vuna"
let rec v_Vuna_dCompiler_dWasm_dModule_dflattenApp = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (dtb__91, dtb__92) -> ((fun p -> { Base_dPair.f_Base_dPair_dPair_first = (Base_dPair.v_Base_dPair_dfirstOf p); Base_dPair.f_Base_dPair_dPair_second = ((Base_dList.v_Base_dList_dappend (Base_dPair.v_Base_dPair_dsecondOf p)) (Base_dList.C_Base_dList_dList_Cons (dtb__92, Base_dList.C_Base_dList_dList_Nil))) }) (v_Vuna_dCompiler_dWasm_dModule_dflattenApp dtb__91))
  | _ -> { Base_dPair.f_Base_dPair_dPair_first = mc0; Base_dPair.f_Base_dPair_dPair_second = Base_dList.C_Base_dList_dList_Nil }
))

# 367 "Vuna/Compiler/Wasm/Module.vuna"
let v_Vuna_dCompiler_dWasm_dModule_dunboxLocalInt = (fun l -> (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dWasm_dInstr.C_Vuna_dCompiler_dWasm_dInstr_dInstr_ILocalGet (l)), (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dWasm_dInstr.C_Vuna_dCompiler_dWasm_dInstr_dInstr_IRefCast ("$int")), (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dWasm_dInstr.C_Vuna_dCompiler_dWasm_dInstr_dInstr_IStructGet ("$int", 0)), Base_dList.C_Base_dList_dList_Nil)))))))

# 370 "Vuna/Compiler/Wasm/Module.vuna"
let v_Vuna_dCompiler_dWasm_dModule_dboxInstr = (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dWasm_dInstr.C_Vuna_dCompiler_dWasm_dInstr_dInstr_IStructNew ("$int")), Base_dList.C_Base_dList_dList_Nil))

# 447 "Vuna/Compiler/Wasm/Module.vuna"
let v_Vuna_dCompiler_dWasm_dModule_dfamOrFail = (fun st family -> (match ((Vuna_dCompiler_dWasm_dTypes.v_Vuna_dCompiler_dWasm_dTypes_dwasmFamLookup (st).f_Vuna_dCompiler_dWasm_dModule_dGenState_gsFams) family) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__93) -> (Base_dResult.C_Base_dResult_dResult_Ok (dtb__93))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (Base_dResult.C_Base_dResult_dResult_Err ((String.concat "" ["unknown data family in wasm codegen: `"; family; "`"])))
  | _ -> failwith "DT: impossible branch"
))

# 452 "Vuna/Compiler/Wasm/Module.vuna"
let rec v_Vuna_dCompiler_dWasm_dModule_drefNullN = (fun n -> (if (n <= 0) then Base_dList.C_Base_dList_dList_Nil else (Base_dList.C_Base_dList_dList_Cons (Vuna_dCompiler_dWasm_dInstr.C_Vuna_dCompiler_dWasm_dInstr_dInstr_IRefNull, (v_Vuna_dCompiler_dWasm_dModule_drefNullN (n - 1))))))

# 534 "Vuna/Compiler/Wasm/Module.vuna"
let rec v_Vuna_dCompiler_dWasm_dModule_dlookupFieldIr = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__94, dtb__95) -> (if ((Base_dPair.v_Base_dPair_dfirstOf dtb__94) = mc0) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((Base_dPair.v_Base_dPair_dsecondOf dtb__94))) else ((v_Vuna_dCompiler_dWasm_dModule_dlookupFieldIr mc0) dtb__95))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 558 "Vuna/Compiler/Wasm/Module.vuna"
let v_Vuna_dCompiler_dWasm_dModule_dscrutSlot = "$sc0"

# 561 "Vuna/Compiler/Wasm/Module.vuna"
let v_Vuna_dCompiler_dWasm_dModule_dscrutInstrs = (fun p -> ((Base_dList.v_Base_dList_dappend (Base_dPair.v_Base_dPair_dfirstOf p)) (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dWasm_dInstr.C_Vuna_dCompiler_dWasm_dInstr_dInstr_ILocalSet (v_Vuna_dCompiler_dWasm_dModule_dscrutSlot)), Base_dList.C_Base_dList_dList_Nil))))

# 564 "Vuna/Compiler/Wasm/Module.vuna"
let v_Vuna_dCompiler_dWasm_dModule_densureLocal = (fun name ty st -> (if ((v_Vuna_dCompiler_dWasm_dModule_dmemStr name) ((Base_dList.v_Base_dList_dmap (fun q -> (Base_dPair.v_Base_dPair_dfirstOf q))) (st).f_Vuna_dCompiler_dWasm_dModule_dGenState_gsLocals)) then st else { st with f_Vuna_dCompiler_dWasm_dModule_dGenState_gsLocals = ((Base_dList.v_Base_dList_dappend (st).f_Vuna_dCompiler_dWasm_dModule_dGenState_gsLocals) (Base_dList.C_Base_dList_dList_Cons ({ Base_dPair.f_Base_dPair_dPair_first = name; Base_dPair.f_Base_dPair_dPair_second = ty }, Base_dList.C_Base_dList_dList_Nil))) }))

# 569 "Vuna/Compiler/Wasm/Module.vuna"
let v_Vuna_dCompiler_dWasm_dModule_dprepend = (fun ins r -> (match r with
  | Base_dResult.C_Base_dResult_dResult_Err (dtb__96) -> (Base_dResult.C_Base_dResult_dResult_Err (dtb__96))
  | Base_dResult.C_Base_dResult_dResult_Ok (dtb__97) -> (Base_dResult.C_Base_dResult_dResult_Ok ({ Base_dPair.f_Base_dPair_dPair_first = ((Base_dList.v_Base_dList_dappend ins) (Base_dPair.v_Base_dPair_dfirstOf dtb__97)); Base_dPair.f_Base_dPair_dPair_second = (Base_dPair.v_Base_dPair_dsecondOf dtb__97) }))
  | _ -> failwith "DT: impossible branch"
))

# 574 "Vuna/Compiler/Wasm/Module.vuna"
let rec v_Vuna_dCompiler_dWasm_dModule_dcaseFamilyOf = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__98, dtb__99) -> (match (Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirAltCtorOf dtb__98) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (v_Vuna_dCompiler_dWasm_dModule_dcaseFamilyOf dtb__99)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__100) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((Base_dPair.v_Base_dPair_dfirstOf dtb__100)))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 591 "Vuna/Compiler/Wasm/Module.vuna"
let v_Vuna_dCompiler_dWasm_dModule_dbindScrutBinder = (fun bs scLocal st -> ((fun nd_uscrut3 -> (match nd_uscrut3 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__101, dtb__102) -> (match dtb__102 with
  | Base_dList.C_Base_dList_dList_Nil -> (match ((v_Vuna_dCompiler_dWasm_dModule_dfreshLocal st) Vuna_dCompiler_dWasm_dModel.C_Vuna_dCompiler_dWasm_dModel_dWatValTy_WvAnyRef) with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__103; Base_dPair.f_Base_dPair_dPair_second = dtb__104 } -> (Base_dResult.C_Base_dResult_dResult_Ok ({ Base_dPair.f_Base_dPair_dPair_first = (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dWasm_dInstr.C_Vuna_dCompiler_dWasm_dInstr_dInstr_ILocalGet (scLocal)), (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dWasm_dInstr.C_Vuna_dCompiler_dWasm_dInstr_dInstr_ILocalSet (dtb__103)), Base_dList.C_Base_dList_dList_Nil)))); Base_dPair.f_Base_dPair_dPair_second = (((v_Vuna_dCompiler_dWasm_dModule_dpushBinder dtb__101) dtb__103) dtb__104) }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> (Base_dResult.C_Base_dResult_dResult_Err ("case arm has more than one runtime binder"))
)
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dResult.C_Base_dResult_dResult_Ok ({ Base_dPair.f_Base_dPair_dPair_first = Base_dList.C_Base_dList_dList_Nil; Base_dPair.f_Base_dPair_dPair_second = st }))
  | _ -> failwith "DT: impossible branch"
)) (v_Vuna_dCompiler_dWasm_dModule_druntimeBinders bs)))

# 627 "Vuna/Compiler/Wasm/Module.vuna"
let rec v_Vuna_dCompiler_dWasm_dModule_dbindFields = (fun mc0 mc1 mc2 mc3 mc4 mc5 -> (match mc4 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__105, dtb__106) -> (if (mc0 <= 0) then (Base_dResult.C_Base_dResult_dResult_Err ("wasm codegen fuel exhausted")) else (match ((v_Vuna_dCompiler_dWasm_dModule_dfreshLocal mc1) Vuna_dCompiler_dWasm_dModel.C_Vuna_dCompiler_dWasm_dModel_dWatValTy_WvAnyRef) with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__107; Base_dPair.f_Base_dPair_dPair_second = dtb__108 } -> (match ((((((v_Vuna_dCompiler_dWasm_dModule_dbindFields (mc0 - 1)) (((v_Vuna_dCompiler_dWasm_dModule_dpushBinder dtb__105) dtb__107) dtb__108)) mc2) mc3) dtb__106) (mc5 + 1)) with
  | Base_dResult.C_Base_dResult_dResult_Err (dtb__109) -> (Base_dResult.C_Base_dResult_dResult_Err (dtb__109))
  | Base_dResult.C_Base_dResult_dResult_Ok (dtb__110) -> (Base_dResult.C_Base_dResult_dResult_Ok ({ Base_dPair.f_Base_dPair_dPair_first = ((Base_dList.v_Base_dList_dappend (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dWasm_dInstr.C_Vuna_dCompiler_dWasm_dInstr_dInstr_ILocalGet (mc2)), (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dWasm_dInstr.C_Vuna_dCompiler_dWasm_dInstr_dInstr_IRefCast (mc3)), (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dWasm_dInstr.C_Vuna_dCompiler_dWasm_dInstr_dInstr_IStructGet (mc3, mc5)), (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dWasm_dInstr.C_Vuna_dCompiler_dWasm_dInstr_dInstr_ILocalSet (dtb__107)), Base_dList.C_Base_dList_dList_Nil))))))))) (Base_dPair.v_Base_dPair_dfirstOf dtb__110)); Base_dPair.f_Base_dPair_dPair_second = (Base_dPair.v_Base_dPair_dsecondOf dtb__110) }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dResult.C_Base_dResult_dResult_Ok ({ Base_dPair.f_Base_dPair_dPair_first = Base_dList.C_Base_dList_dList_Nil; Base_dPair.f_Base_dPair_dPair_second = mc1 }))
  | _ -> failwith "DT: impossible branch"
))

# 653 "Vuna/Compiler/Wasm/Module.vuna"
let v_Vuna_dCompiler_dWasm_dModule_dcatI = (fun xs -> ((Base_dList.v_Base_dList_dconcatMap (fun x -> x)) xs))

# 656 "Vuna/Compiler/Wasm/Module.vuna"
let rec v_Vuna_dCompiler_dWasm_dModule_drefNulls = (fun n -> (if (n <= 0) then Base_dList.C_Base_dList_dList_Nil else (Base_dList.C_Base_dList_dList_Cons (Vuna_dCompiler_dWasm_dInstr.C_Vuna_dCompiler_dWasm_dInstr_dInstr_IRefNull, (v_Vuna_dCompiler_dWasm_dModule_drefNulls (n - 1))))))

# 659 "Vuna/Compiler/Wasm/Module.vuna"
let v_Vuna_dCompiler_dWasm_dModule_dwasmListTy = (fun lf -> (Vuna_dCompiler_dWasm_dTypes.v_Vuna_dCompiler_dWasm_dTypes_dwatFamName (lf).Vuna_dCompiler_dWasm_dTypes.f_Vuna_dCompiler_dWasm_dTypes_dWasmListFam_wasmListFamily))

# 662 "Vuna/Compiler/Wasm/Module.vuna"
let v_Vuna_dCompiler_dWasm_dModule_dwasmNilCell = (fun lf -> ((Base_dList.v_Base_dList_dappend (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dWasm_dInstr.C_Vuna_dCompiler_dWasm_dInstr_dInstr_IConstI32 ((lf).Vuna_dCompiler_dWasm_dTypes.f_Vuna_dCompiler_dWasm_dTypes_dWasmListFam_wasmListNilTag)), Base_dList.C_Base_dList_dList_Nil))) ((Base_dList.v_Base_dList_dappend (v_Vuna_dCompiler_dWasm_dModule_drefNulls (lf).Vuna_dCompiler_dWasm_dTypes.f_Vuna_dCompiler_dWasm_dTypes_dWasmListFam_wasmListConsFields)) (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dWasm_dInstr.C_Vuna_dCompiler_dWasm_dInstr_dInstr_IStructNew ((v_Vuna_dCompiler_dWasm_dModule_dwasmListTy lf))), Base_dList.C_Base_dList_dList_Nil)))))

# 671 "Vuna/Compiler/Wasm/Module.vuna"
let v_Vuna_dCompiler_dWasm_dModule_drtStrUnpackF = (fun lf -> ((fun ty -> ((fun params -> ((fun locals -> ((fun body -> { Vuna_dCompiler_dWasm_dModel.f_Vuna_dCompiler_dWasm_dModel_dWatFunc_watFuncName = "$rt_strUnpack"; Vuna_dCompiler_dWasm_dModel.f_Vuna_dCompiler_dWasm_dModel_dWatFunc_watFuncType = ""; Vuna_dCompiler_dWasm_dModel.f_Vuna_dCompiler_dWasm_dModel_dWatFunc_watFuncParams = params; Vuna_dCompiler_dWasm_dModel.f_Vuna_dCompiler_dWasm_dModel_dWatFunc_watFuncResults = (Base_dList.C_Base_dList_dList_Cons (Vuna_dCompiler_dWasm_dModel.C_Vuna_dCompiler_dWasm_dModel_dWatValTy_WvAnyRef, Base_dList.C_Base_dList_dList_Nil)); Vuna_dCompiler_dWasm_dModel.f_Vuna_dCompiler_dWasm_dModel_dWatFunc_watFuncLocals = locals; Vuna_dCompiler_dWasm_dModel.f_Vuna_dCompiler_dWasm_dModel_dWatFunc_watFuncBody = body }) (v_Vuna_dCompiler_dWasm_dModule_dcatI (Base_dList.C_Base_dList_dList_Cons ((Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dWasm_dInstr.C_Vuna_dCompiler_dWasm_dInstr_dInstr_ILocalGet ("$p0")), (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dWasm_dInstr.C_Vuna_dCompiler_dWasm_dInstr_dInstr_IRefCast ("$str")), (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dWasm_dInstr.C_Vuna_dCompiler_dWasm_dInstr_dInstr_ILocalSet ("$s")), (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dWasm_dInstr.C_Vuna_dCompiler_dWasm_dInstr_dInstr_ILocalGet ("$s")), (Base_dList.C_Base_dList_dList_Cons (Vuna_dCompiler_dWasm_dInstr.C_Vuna_dCompiler_dWasm_dInstr_dInstr_IArrayLen, (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dWasm_dInstr.C_Vuna_dCompiler_dWasm_dInstr_dInstr_ILocalSet ("$n")), Base_dList.C_Base_dList_dList_Nil)))))))))))), (Base_dList.C_Base_dList_dList_Cons ((v_Vuna_dCompiler_dWasm_dModule_dwasmNilCell lf), (Base_dList.C_Base_dList_dList_Cons ((Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dWasm_dInstr.C_Vuna_dCompiler_dWasm_dInstr_dInstr_ILocalSet ("$acc")), (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dWasm_dInstr.C_Vuna_dCompiler_dWasm_dInstr_dInstr_ILocalGet ("$n")), (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dWasm_dInstr.C_Vuna_dCompiler_dWasm_dInstr_dInstr_ILocalSet ("$i")), Base_dList.C_Base_dList_dList_Nil)))))), (Base_dList.C_Base_dList_dList_Cons ((Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dWasm_dInstr.C_Vuna_dCompiler_dWasm_dInstr_dInstr_IBlock ("$u_done", "", (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dWasm_dInstr.C_Vuna_dCompiler_dWasm_dInstr_dInstr_ILoop ("$u_l", "", (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dWasm_dInstr.C_Vuna_dCompiler_dWasm_dInstr_dInstr_ILocalGet ("$i")), (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dWasm_dInstr.C_Vuna_dCompiler_dWasm_dInstr_dInstr_IPlain ("i32.eqz")), (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dWasm_dInstr.C_Vuna_dCompiler_dWasm_dInstr_dInstr_IBrIf ("$u_done")), (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dWasm_dInstr.C_Vuna_dCompiler_dWasm_dInstr_dInstr_ILocalGet ("$i")), (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dWasm_dInstr.C_Vuna_dCompiler_dWasm_dInstr_dInstr_IConstI32 (1)), (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dWasm_dInstr.C_Vuna_dCompiler_dWasm_dInstr_dInstr_IBinop ("i32.sub")), (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dWasm_dInstr.C_Vuna_dCompiler_dWasm_dInstr_dInstr_ILocalSet ("$i")), (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dWasm_dInstr.C_Vuna_dCompiler_dWasm_dInstr_dInstr_ILocalGet ("$s")), (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dWasm_dInstr.C_Vuna_dCompiler_dWasm_dInstr_dInstr_ILocalGet ("$i")), (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dWasm_dInstr.C_Vuna_dCompiler_dWasm_dInstr_dInstr_IArrayGetU ("$str")), (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dWasm_dInstr.C_Vuna_dCompiler_dWasm_dInstr_dInstr_ILocalSet ("$b")), (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dWasm_dInstr.C_Vuna_dCompiler_dWasm_dInstr_dInstr_IConstI32 ((lf).Vuna_dCompiler_dWasm_dTypes.f_Vuna_dCompiler_dWasm_dTypes_dWasmListFam_wasmListConsTag)), (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dWasm_dInstr.C_Vuna_dCompiler_dWasm_dInstr_dInstr_ILocalGet ("$b")), (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dWasm_dInstr.C_Vuna_dCompiler_dWasm_dInstr_dInstr_IPlain ("i64.extend_i32_u")), (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dWasm_dInstr.C_Vuna_dCompiler_dWasm_dInstr_dInstr_IStructNew ("$int")), (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dWasm_dInstr.C_Vuna_dCompiler_dWasm_dInstr_dInstr_ILocalGet ("$acc")), (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dWasm_dInstr.C_Vuna_dCompiler_dWasm_dInstr_dInstr_IStructNew (ty)), (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dWasm_dInstr.C_Vuna_dCompiler_dWasm_dInstr_dInstr_ILocalSet ("$acc")), (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dWasm_dInstr.C_Vuna_dCompiler_dWasm_dInstr_dInstr_IBr ("$u_l")), Base_dList.C_Base_dList_dList_Nil)))))))))))))))))))))))))))))))))))))))), Base_dList.C_Base_dList_dList_Nil)))), Base_dList.C_Base_dList_dList_Nil)), (Base_dList.C_Base_dList_dList_Cons ((Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dWasm_dInstr.C_Vuna_dCompiler_dWasm_dInstr_dInstr_ILocalGet ("$acc")), Base_dList.C_Base_dList_dList_Nil)), Base_dList.C_Base_dList_dList_Nil))))))))))))) (Base_dList.C_Base_dList_dList_Cons ({ Base_dPair.f_Base_dPair_dPair_first = "$s"; Base_dPair.f_Base_dPair_dPair_second = (Vuna_dCompiler_dWasm_dModel.C_Vuna_dCompiler_dWasm_dModel_dWatValTy_WvRef ("$str")) }, (Base_dList.C_Base_dList_dList_Cons ({ Base_dPair.f_Base_dPair_dPair_first = "$n"; Base_dPair.f_Base_dPair_dPair_second = Vuna_dCompiler_dWasm_dModel.C_Vuna_dCompiler_dWasm_dModel_dWatValTy_WvI32 }, (Base_dList.C_Base_dList_dList_Cons ({ Base_dPair.f_Base_dPair_dPair_first = "$i"; Base_dPair.f_Base_dPair_dPair_second = Vuna_dCompiler_dWasm_dModel.C_Vuna_dCompiler_dWasm_dModel_dWatValTy_WvI32 }, (Base_dList.C_Base_dList_dList_Cons ({ Base_dPair.f_Base_dPair_dPair_first = "$acc"; Base_dPair.f_Base_dPair_dPair_second = Vuna_dCompiler_dWasm_dModel.C_Vuna_dCompiler_dWasm_dModel_dWatValTy_WvAnyRef }, (Base_dList.C_Base_dList_dList_Cons ({ Base_dPair.f_Base_dPair_dPair_first = "$b"; Base_dPair.f_Base_dPair_dPair_second = Vuna_dCompiler_dWasm_dModel.C_Vuna_dCompiler_dWasm_dModel_dWatValTy_WvI32 }, Base_dList.C_Base_dList_dList_Nil)))))))))))) (Base_dList.C_Base_dList_dList_Cons ({ Base_dPair.f_Base_dPair_dPair_first = "$p0"; Base_dPair.f_Base_dPair_dPair_second = Vuna_dCompiler_dWasm_dModel.C_Vuna_dCompiler_dWasm_dModel_dWatValTy_WvAnyRef }, Base_dList.C_Base_dList_dList_Nil)))) (v_Vuna_dCompiler_dWasm_dModule_dwasmListTy lf)))

# 688 "Vuna/Compiler/Wasm/Module.vuna"
let v_Vuna_dCompiler_dWasm_dModule_drtStrPackF = (fun lf -> ((fun ty -> ((fun params -> ((fun locals -> ((fun body -> { Vuna_dCompiler_dWasm_dModel.f_Vuna_dCompiler_dWasm_dModel_dWatFunc_watFuncName = "$rt_strPack"; Vuna_dCompiler_dWasm_dModel.f_Vuna_dCompiler_dWasm_dModel_dWatFunc_watFuncType = ""; Vuna_dCompiler_dWasm_dModel.f_Vuna_dCompiler_dWasm_dModel_dWatFunc_watFuncParams = params; Vuna_dCompiler_dWasm_dModel.f_Vuna_dCompiler_dWasm_dModel_dWatFunc_watFuncResults = (Base_dList.C_Base_dList_dList_Cons (Vuna_dCompiler_dWasm_dModel.C_Vuna_dCompiler_dWasm_dModel_dWatValTy_WvAnyRef, Base_dList.C_Base_dList_dList_Nil)); Vuna_dCompiler_dWasm_dModel.f_Vuna_dCompiler_dWasm_dModel_dWatFunc_watFuncLocals = locals; Vuna_dCompiler_dWasm_dModel.f_Vuna_dCompiler_dWasm_dModel_dWatFunc_watFuncBody = body }) (v_Vuna_dCompiler_dWasm_dModule_dcatI (Base_dList.C_Base_dList_dList_Cons ((Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dWasm_dInstr.C_Vuna_dCompiler_dWasm_dInstr_dInstr_ILocalGet ("$p0")), (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dWasm_dInstr.C_Vuna_dCompiler_dWasm_dInstr_dInstr_ILocalSet ("$cur")), (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dWasm_dInstr.C_Vuna_dCompiler_dWasm_dInstr_dInstr_IConstI32 (0)), (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dWasm_dInstr.C_Vuna_dCompiler_dWasm_dInstr_dInstr_ILocalSet ("$n")), Base_dList.C_Base_dList_dList_Nil)))))))), (Base_dList.C_Base_dList_dList_Cons ((Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dWasm_dInstr.C_Vuna_dCompiler_dWasm_dInstr_dInstr_IBlock ("$p_count_done", "", (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dWasm_dInstr.C_Vuna_dCompiler_dWasm_dInstr_dInstr_ILoop ("$p_count", "", (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dWasm_dInstr.C_Vuna_dCompiler_dWasm_dInstr_dInstr_ILocalGet ("$cur")), (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dWasm_dInstr.C_Vuna_dCompiler_dWasm_dInstr_dInstr_IRefCast (ty)), (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dWasm_dInstr.C_Vuna_dCompiler_dWasm_dInstr_dInstr_IStructGet (ty, 0)), (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dWasm_dInstr.C_Vuna_dCompiler_dWasm_dInstr_dInstr_IConstI32 ((lf).Vuna_dCompiler_dWasm_dTypes.f_Vuna_dCompiler_dWasm_dTypes_dWasmListFam_wasmListNilTag)), (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dWasm_dInstr.C_Vuna_dCompiler_dWasm_dInstr_dInstr_IBinop ("i32.eq")), (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dWasm_dInstr.C_Vuna_dCompiler_dWasm_dInstr_dInstr_IBrIf ("$p_count_done")), (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dWasm_dInstr.C_Vuna_dCompiler_dWasm_dInstr_dInstr_ILocalGet ("$n")), (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dWasm_dInstr.C_Vuna_dCompiler_dWasm_dInstr_dInstr_IConstI32 (1)), (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dWasm_dInstr.C_Vuna_dCompiler_dWasm_dInstr_dInstr_IBinop ("i32.add")), (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dWasm_dInstr.C_Vuna_dCompiler_dWasm_dInstr_dInstr_ILocalSet ("$n")), (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dWasm_dInstr.C_Vuna_dCompiler_dWasm_dInstr_dInstr_ILocalGet ("$cur")), (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dWasm_dInstr.C_Vuna_dCompiler_dWasm_dInstr_dInstr_IRefCast (ty)), (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dWasm_dInstr.C_Vuna_dCompiler_dWasm_dInstr_dInstr_IStructGet (ty, 2)), (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dWasm_dInstr.C_Vuna_dCompiler_dWasm_dInstr_dInstr_ILocalSet ("$cur")), (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dWasm_dInstr.C_Vuna_dCompiler_dWasm_dInstr_dInstr_IBr ("$p_count")), Base_dList.C_Base_dList_dList_Nil)))))))))))))))))))))))))))))))), Base_dList.C_Base_dList_dList_Nil)))), Base_dList.C_Base_dList_dList_Nil)), (Base_dList.C_Base_dList_dList_Cons ((Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dWasm_dInstr.C_Vuna_dCompiler_dWasm_dInstr_dInstr_ILocalGet ("$n")), (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dWasm_dInstr.C_Vuna_dCompiler_dWasm_dInstr_dInstr_IArrayNewDefault ("$str")), (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dWasm_dInstr.C_Vuna_dCompiler_dWasm_dInstr_dInstr_ILocalSet ("$out")), (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dWasm_dInstr.C_Vuna_dCompiler_dWasm_dInstr_dInstr_IConstI32 (0)), (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dWasm_dInstr.C_Vuna_dCompiler_dWasm_dInstr_dInstr_ILocalSet ("$idx")), (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dWasm_dInstr.C_Vuna_dCompiler_dWasm_dInstr_dInstr_ILocalGet ("$p0")), (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dWasm_dInstr.C_Vuna_dCompiler_dWasm_dInstr_dInstr_ILocalSet ("$cur")), Base_dList.C_Base_dList_dList_Nil)))))))))))))), (Base_dList.C_Base_dList_dList_Cons ((Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dWasm_dInstr.C_Vuna_dCompiler_dWasm_dInstr_dInstr_IBlock ("$p_fill_done", "", (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dWasm_dInstr.C_Vuna_dCompiler_dWasm_dInstr_dInstr_ILoop ("$p_fill", "", (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dWasm_dInstr.C_Vuna_dCompiler_dWasm_dInstr_dInstr_ILocalGet ("$cur")), (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dWasm_dInstr.C_Vuna_dCompiler_dWasm_dInstr_dInstr_IRefCast (ty)), (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dWasm_dInstr.C_Vuna_dCompiler_dWasm_dInstr_dInstr_IStructGet (ty, 0)), (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dWasm_dInstr.C_Vuna_dCompiler_dWasm_dInstr_dInstr_IConstI32 ((lf).Vuna_dCompiler_dWasm_dTypes.f_Vuna_dCompiler_dWasm_dTypes_dWasmListFam_wasmListNilTag)), (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dWasm_dInstr.C_Vuna_dCompiler_dWasm_dInstr_dInstr_IBinop ("i32.eq")), (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dWasm_dInstr.C_Vuna_dCompiler_dWasm_dInstr_dInstr_IBrIf ("$p_fill_done")), (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dWasm_dInstr.C_Vuna_dCompiler_dWasm_dInstr_dInstr_ILocalGet ("$out")), (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dWasm_dInstr.C_Vuna_dCompiler_dWasm_dInstr_dInstr_ILocalGet ("$idx")), (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dWasm_dInstr.C_Vuna_dCompiler_dWasm_dInstr_dInstr_ILocalGet ("$cur")), (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dWasm_dInstr.C_Vuna_dCompiler_dWasm_dInstr_dInstr_IRefCast (ty)), (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dWasm_dInstr.C_Vuna_dCompiler_dWasm_dInstr_dInstr_IStructGet (ty, 1)), (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dWasm_dInstr.C_Vuna_dCompiler_dWasm_dInstr_dInstr_IRefCast ("$int")), (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dWasm_dInstr.C_Vuna_dCompiler_dWasm_dInstr_dInstr_IStructGet ("$int", 0)), (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dWasm_dInstr.C_Vuna_dCompiler_dWasm_dInstr_dInstr_IPlain ("i32.wrap_i64")), (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dWasm_dInstr.C_Vuna_dCompiler_dWasm_dInstr_dInstr_IArraySet ("$str")), (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dWasm_dInstr.C_Vuna_dCompiler_dWasm_dInstr_dInstr_ILocalGet ("$idx")), (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dWasm_dInstr.C_Vuna_dCompiler_dWasm_dInstr_dInstr_IConstI32 (1)), (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dWasm_dInstr.C_Vuna_dCompiler_dWasm_dInstr_dInstr_IBinop ("i32.add")), (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dWasm_dInstr.C_Vuna_dCompiler_dWasm_dInstr_dInstr_ILocalSet ("$idx")), (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dWasm_dInstr.C_Vuna_dCompiler_dWasm_dInstr_dInstr_ILocalGet ("$cur")), (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dWasm_dInstr.C_Vuna_dCompiler_dWasm_dInstr_dInstr_IRefCast (ty)), (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dWasm_dInstr.C_Vuna_dCompiler_dWasm_dInstr_dInstr_IStructGet (ty, 2)), (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dWasm_dInstr.C_Vuna_dCompiler_dWasm_dInstr_dInstr_ILocalSet ("$cur")), (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dWasm_dInstr.C_Vuna_dCompiler_dWasm_dInstr_dInstr_IBr ("$p_fill")), Base_dList.C_Base_dList_dList_Nil)))))))))))))))))))))))))))))))))))))))))))))))))), Base_dList.C_Base_dList_dList_Nil)))), Base_dList.C_Base_dList_dList_Nil)), (Base_dList.C_Base_dList_dList_Cons ((Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dWasm_dInstr.C_Vuna_dCompiler_dWasm_dInstr_dInstr_ILocalGet ("$out")), Base_dList.C_Base_dList_dList_Nil)), Base_dList.C_Base_dList_dList_Nil))))))))))))) (Base_dList.C_Base_dList_dList_Cons ({ Base_dPair.f_Base_dPair_dPair_first = "$cur"; Base_dPair.f_Base_dPair_dPair_second = Vuna_dCompiler_dWasm_dModel.C_Vuna_dCompiler_dWasm_dModel_dWatValTy_WvAnyRef }, (Base_dList.C_Base_dList_dList_Cons ({ Base_dPair.f_Base_dPair_dPair_first = "$n"; Base_dPair.f_Base_dPair_dPair_second = Vuna_dCompiler_dWasm_dModel.C_Vuna_dCompiler_dWasm_dModel_dWatValTy_WvI32 }, (Base_dList.C_Base_dList_dList_Cons ({ Base_dPair.f_Base_dPair_dPair_first = "$out"; Base_dPair.f_Base_dPair_dPair_second = (Vuna_dCompiler_dWasm_dModel.C_Vuna_dCompiler_dWasm_dModel_dWatValTy_WvRef ("$str")) }, (Base_dList.C_Base_dList_dList_Cons ({ Base_dPair.f_Base_dPair_dPair_first = "$idx"; Base_dPair.f_Base_dPair_dPair_second = Vuna_dCompiler_dWasm_dModel.C_Vuna_dCompiler_dWasm_dModel_dWatValTy_WvI32 }, Base_dList.C_Base_dList_dList_Nil)))))))))) (Base_dList.C_Base_dList_dList_Cons ({ Base_dPair.f_Base_dPair_dPair_first = "$p0"; Base_dPair.f_Base_dPair_dPair_second = Vuna_dCompiler_dWasm_dModel.C_Vuna_dCompiler_dWasm_dModel_dWatValTy_WvAnyRef }, Base_dList.C_Base_dList_dList_Nil)))) (v_Vuna_dCompiler_dWasm_dModule_dwasmListTy lf)))

# 699 "Vuna/Compiler/Wasm/Module.vuna"
let v_Vuna_dCompiler_dWasm_dModule_drtStrConcatManyF = (fun lf -> ((fun ty -> ((fun params -> ((fun locals -> ((fun body -> { Vuna_dCompiler_dWasm_dModel.f_Vuna_dCompiler_dWasm_dModel_dWatFunc_watFuncName = "$rt_strConcatMany"; Vuna_dCompiler_dWasm_dModel.f_Vuna_dCompiler_dWasm_dModel_dWatFunc_watFuncType = ""; Vuna_dCompiler_dWasm_dModel.f_Vuna_dCompiler_dWasm_dModel_dWatFunc_watFuncParams = params; Vuna_dCompiler_dWasm_dModel.f_Vuna_dCompiler_dWasm_dModel_dWatFunc_watFuncResults = (Base_dList.C_Base_dList_dList_Cons (Vuna_dCompiler_dWasm_dModel.C_Vuna_dCompiler_dWasm_dModel_dWatValTy_WvAnyRef, Base_dList.C_Base_dList_dList_Nil)); Vuna_dCompiler_dWasm_dModel.f_Vuna_dCompiler_dWasm_dModel_dWatFunc_watFuncLocals = locals; Vuna_dCompiler_dWasm_dModel.f_Vuna_dCompiler_dWasm_dModel_dWatFunc_watFuncBody = body }) (v_Vuna_dCompiler_dWasm_dModule_dcatI (Base_dList.C_Base_dList_dList_Cons ((Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dWasm_dInstr.C_Vuna_dCompiler_dWasm_dInstr_dInstr_ILocalGet ("$p0")), (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dWasm_dInstr.C_Vuna_dCompiler_dWasm_dInstr_dInstr_ILocalSet ("$cur")), (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dWasm_dInstr.C_Vuna_dCompiler_dWasm_dInstr_dInstr_IConstI32 (0)), (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dWasm_dInstr.C_Vuna_dCompiler_dWasm_dInstr_dInstr_ILocalSet ("$total")), Base_dList.C_Base_dList_dList_Nil)))))))), (Base_dList.C_Base_dList_dList_Cons ((Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dWasm_dInstr.C_Vuna_dCompiler_dWasm_dInstr_dInstr_IBlock ("$c_count_done", "", (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dWasm_dInstr.C_Vuna_dCompiler_dWasm_dInstr_dInstr_ILoop ("$c_count", "", (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dWasm_dInstr.C_Vuna_dCompiler_dWasm_dInstr_dInstr_ILocalGet ("$cur")), (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dWasm_dInstr.C_Vuna_dCompiler_dWasm_dInstr_dInstr_IRefCast (ty)), (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dWasm_dInstr.C_Vuna_dCompiler_dWasm_dInstr_dInstr_IStructGet (ty, 0)), (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dWasm_dInstr.C_Vuna_dCompiler_dWasm_dInstr_dInstr_IConstI32 ((lf).Vuna_dCompiler_dWasm_dTypes.f_Vuna_dCompiler_dWasm_dTypes_dWasmListFam_wasmListNilTag)), (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dWasm_dInstr.C_Vuna_dCompiler_dWasm_dInstr_dInstr_IBinop ("i32.eq")), (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dWasm_dInstr.C_Vuna_dCompiler_dWasm_dInstr_dInstr_IBrIf ("$c_count_done")), (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dWasm_dInstr.C_Vuna_dCompiler_dWasm_dInstr_dInstr_ILocalGet ("$total")), (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dWasm_dInstr.C_Vuna_dCompiler_dWasm_dInstr_dInstr_ILocalGet ("$cur")), (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dWasm_dInstr.C_Vuna_dCompiler_dWasm_dInstr_dInstr_IRefCast (ty)), (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dWasm_dInstr.C_Vuna_dCompiler_dWasm_dInstr_dInstr_IStructGet (ty, 1)), (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dWasm_dInstr.C_Vuna_dCompiler_dWasm_dInstr_dInstr_IRefCast ("$str")), (Base_dList.C_Base_dList_dList_Cons (Vuna_dCompiler_dWasm_dInstr.C_Vuna_dCompiler_dWasm_dInstr_dInstr_IArrayLen, (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dWasm_dInstr.C_Vuna_dCompiler_dWasm_dInstr_dInstr_IBinop ("i32.add")), (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dWasm_dInstr.C_Vuna_dCompiler_dWasm_dInstr_dInstr_ILocalSet ("$total")), (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dWasm_dInstr.C_Vuna_dCompiler_dWasm_dInstr_dInstr_ILocalGet ("$cur")), (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dWasm_dInstr.C_Vuna_dCompiler_dWasm_dInstr_dInstr_IRefCast (ty)), (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dWasm_dInstr.C_Vuna_dCompiler_dWasm_dInstr_dInstr_IStructGet (ty, 2)), (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dWasm_dInstr.C_Vuna_dCompiler_dWasm_dInstr_dInstr_ILocalSet ("$cur")), (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dWasm_dInstr.C_Vuna_dCompiler_dWasm_dInstr_dInstr_IBr ("$c_count")), Base_dList.C_Base_dList_dList_Nil)))))))))))))))))))))))))))))))))))))))), Base_dList.C_Base_dList_dList_Nil)))), Base_dList.C_Base_dList_dList_Nil)), (Base_dList.C_Base_dList_dList_Cons ((Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dWasm_dInstr.C_Vuna_dCompiler_dWasm_dInstr_dInstr_ILocalGet ("$total")), (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dWasm_dInstr.C_Vuna_dCompiler_dWasm_dInstr_dInstr_IArrayNewDefault ("$str")), (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dWasm_dInstr.C_Vuna_dCompiler_dWasm_dInstr_dInstr_ILocalSet ("$out")), (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dWasm_dInstr.C_Vuna_dCompiler_dWasm_dInstr_dInstr_IConstI32 (0)), (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dWasm_dInstr.C_Vuna_dCompiler_dWasm_dInstr_dInstr_ILocalSet ("$idx")), (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dWasm_dInstr.C_Vuna_dCompiler_dWasm_dInstr_dInstr_ILocalGet ("$p0")), (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dWasm_dInstr.C_Vuna_dCompiler_dWasm_dInstr_dInstr_ILocalSet ("$cur")), Base_dList.C_Base_dList_dList_Nil)))))))))))))), (Base_dList.C_Base_dList_dList_Cons ((Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dWasm_dInstr.C_Vuna_dCompiler_dWasm_dInstr_dInstr_IBlock ("$c_fill_done", "", (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dWasm_dInstr.C_Vuna_dCompiler_dWasm_dInstr_dInstr_ILoop ("$c_fill", "", (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dWasm_dInstr.C_Vuna_dCompiler_dWasm_dInstr_dInstr_ILocalGet ("$cur")), (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dWasm_dInstr.C_Vuna_dCompiler_dWasm_dInstr_dInstr_IRefCast (ty)), (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dWasm_dInstr.C_Vuna_dCompiler_dWasm_dInstr_dInstr_IStructGet (ty, 0)), (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dWasm_dInstr.C_Vuna_dCompiler_dWasm_dInstr_dInstr_IConstI32 ((lf).Vuna_dCompiler_dWasm_dTypes.f_Vuna_dCompiler_dWasm_dTypes_dWasmListFam_wasmListNilTag)), (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dWasm_dInstr.C_Vuna_dCompiler_dWasm_dInstr_dInstr_IBinop ("i32.eq")), (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dWasm_dInstr.C_Vuna_dCompiler_dWasm_dInstr_dInstr_IBrIf ("$c_fill_done")), (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dWasm_dInstr.C_Vuna_dCompiler_dWasm_dInstr_dInstr_ILocalGet ("$out")), (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dWasm_dInstr.C_Vuna_dCompiler_dWasm_dInstr_dInstr_ILocalGet ("$idx")), (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dWasm_dInstr.C_Vuna_dCompiler_dWasm_dInstr_dInstr_ILocalGet ("$cur")), (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dWasm_dInstr.C_Vuna_dCompiler_dWasm_dInstr_dInstr_IRefCast (ty)), (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dWasm_dInstr.C_Vuna_dCompiler_dWasm_dInstr_dInstr_IStructGet (ty, 1)), (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dWasm_dInstr.C_Vuna_dCompiler_dWasm_dInstr_dInstr_IRefCast ("$str")), (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dWasm_dInstr.C_Vuna_dCompiler_dWasm_dInstr_dInstr_ILocalTee ("$src")), (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dWasm_dInstr.C_Vuna_dCompiler_dWasm_dInstr_dInstr_IConstI32 (0)), (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dWasm_dInstr.C_Vuna_dCompiler_dWasm_dInstr_dInstr_ILocalGet ("$src")), (Base_dList.C_Base_dList_dList_Cons (Vuna_dCompiler_dWasm_dInstr.C_Vuna_dCompiler_dWasm_dInstr_dInstr_IArrayLen, (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dWasm_dInstr.C_Vuna_dCompiler_dWasm_dInstr_dInstr_IArrayCopy ("$str", "$str")), (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dWasm_dInstr.C_Vuna_dCompiler_dWasm_dInstr_dInstr_ILocalGet ("$idx")), (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dWasm_dInstr.C_Vuna_dCompiler_dWasm_dInstr_dInstr_ILocalGet ("$src")), (Base_dList.C_Base_dList_dList_Cons (Vuna_dCompiler_dWasm_dInstr.C_Vuna_dCompiler_dWasm_dInstr_dInstr_IArrayLen, (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dWasm_dInstr.C_Vuna_dCompiler_dWasm_dInstr_dInstr_IBinop ("i32.add")), (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dWasm_dInstr.C_Vuna_dCompiler_dWasm_dInstr_dInstr_ILocalSet ("$idx")), (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dWasm_dInstr.C_Vuna_dCompiler_dWasm_dInstr_dInstr_ILocalGet ("$cur")), (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dWasm_dInstr.C_Vuna_dCompiler_dWasm_dInstr_dInstr_IRefCast (ty)), (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dWasm_dInstr.C_Vuna_dCompiler_dWasm_dInstr_dInstr_IStructGet (ty, 2)), (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dWasm_dInstr.C_Vuna_dCompiler_dWasm_dInstr_dInstr_ILocalSet ("$cur")), (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dWasm_dInstr.C_Vuna_dCompiler_dWasm_dInstr_dInstr_IBr ("$c_fill")), Base_dList.C_Base_dList_dList_Nil)))))))))))))))))))))))))))))))))))))))))))))))))))))))), Base_dList.C_Base_dList_dList_Nil)))), Base_dList.C_Base_dList_dList_Nil)), (Base_dList.C_Base_dList_dList_Cons ((Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dWasm_dInstr.C_Vuna_dCompiler_dWasm_dInstr_dInstr_ILocalGet ("$out")), Base_dList.C_Base_dList_dList_Nil)), Base_dList.C_Base_dList_dList_Nil))))))))))))) (Base_dList.C_Base_dList_dList_Cons ({ Base_dPair.f_Base_dPair_dPair_first = "$cur"; Base_dPair.f_Base_dPair_dPair_second = Vuna_dCompiler_dWasm_dModel.C_Vuna_dCompiler_dWasm_dModel_dWatValTy_WvAnyRef }, (Base_dList.C_Base_dList_dList_Cons ({ Base_dPair.f_Base_dPair_dPair_first = "$total"; Base_dPair.f_Base_dPair_dPair_second = Vuna_dCompiler_dWasm_dModel.C_Vuna_dCompiler_dWasm_dModel_dWatValTy_WvI32 }, (Base_dList.C_Base_dList_dList_Cons ({ Base_dPair.f_Base_dPair_dPair_first = "$out"; Base_dPair.f_Base_dPair_dPair_second = (Vuna_dCompiler_dWasm_dModel.C_Vuna_dCompiler_dWasm_dModel_dWatValTy_WvRef ("$str")) }, (Base_dList.C_Base_dList_dList_Cons ({ Base_dPair.f_Base_dPair_dPair_first = "$idx"; Base_dPair.f_Base_dPair_dPair_second = Vuna_dCompiler_dWasm_dModel.C_Vuna_dCompiler_dWasm_dModel_dWatValTy_WvI32 }, (Base_dList.C_Base_dList_dList_Cons ({ Base_dPair.f_Base_dPair_dPair_first = "$src"; Base_dPair.f_Base_dPair_dPair_second = (Vuna_dCompiler_dWasm_dModel.C_Vuna_dCompiler_dWasm_dModel_dWatValTy_WvRef ("$str")) }, Base_dList.C_Base_dList_dList_Nil)))))))))))) (Base_dList.C_Base_dList_dList_Cons ({ Base_dPair.f_Base_dPair_dPair_first = "$p0"; Base_dPair.f_Base_dPair_dPair_second = Vuna_dCompiler_dWasm_dModel.C_Vuna_dCompiler_dWasm_dModel_dWatValTy_WvAnyRef }, Base_dList.C_Base_dList_dList_Nil)))) (v_Vuna_dCompiler_dWasm_dModule_dwasmListTy lf)))

# 667 "Vuna/Compiler/Wasm/Module.vuna"
let v_Vuna_dCompiler_dWasm_dModule_dwasmBridgeFuncs = (fun mc0 -> (match mc0 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__111) -> (Base_dList.C_Base_dList_dList_Cons ((v_Vuna_dCompiler_dWasm_dModule_drtStrUnpackF dtb__111), (Base_dList.C_Base_dList_dList_Cons ((v_Vuna_dCompiler_dWasm_dModule_drtStrPackF dtb__111), (Base_dList.C_Base_dList_dList_Cons ((v_Vuna_dCompiler_dWasm_dModule_drtStrConcatManyF dtb__111), Base_dList.C_Base_dList_dList_Nil))))))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 783 "Vuna/Compiler/Wasm/Module.vuna"
let v_Vuna_dCompiler_dWasm_dModule_dentryShowFunc = (fun ir -> (match ir with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRt (dtb__112) -> (if (dtb__112 = "@ir@showInt") then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ("$rt_strFromInt")) else (if (dtb__112 = "@ir@showNat") then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ("$rt_strFromInt")) else (if (dtb__112 = "@ir@showBool") then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ("$rt_showBool")) else (if (dtb__112 = "@ir@showStr") then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ("$rt_showStr")) else Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing))))
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
))

# 818 "Vuna/Compiler/Wasm/Module.vuna"
let rec v_Vuna_dCompiler_dWasm_dModule_dfindDef = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__113, dtb__114) -> (if ((Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirDefName dtb__113) = mc0) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__113)) else ((v_Vuna_dCompiler_dWasm_dModule_dfindDef mc0) dtb__114))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 236 "Vuna/Compiler/Wasm/Module.vuna"
let v_Vuna_dCompiler_dWasm_dModule_dgenGlobalRef = (fun st name -> (match ((v_Vuna_dCompiler_dWasm_dModule_dfindDef name) (st).f_Vuna_dCompiler_dWasm_dModule_dGenState_gsDefs) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__115) -> (if ((Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirDefArity dtb__115) = 0) then (Base_dResult.C_Base_dResult_dResult_Ok ({ Base_dPair.f_Base_dPair_dPair_first = (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dWasm_dInstr.C_Vuna_dCompiler_dWasm_dInstr_dInstr_IGlobalGet ((Vuna_dCompiler_dWasm_dTypes.v_Vuna_dCompiler_dWasm_dTypes_dwatGlobalNameOf name))), Base_dList.C_Base_dList_dList_Nil)); Base_dPair.f_Base_dPair_dPair_second = st })) else (Base_dResult.C_Base_dResult_dResult_Err ((String.concat "" ["wasm target: function values are not supported yet (referenced `"; name; "`)"]))))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (Base_dResult.C_Base_dResult_dResult_Err ((String.concat "" ["unknown top-level definition in wasm codegen: `"; name; "`"])))
  | _ -> failwith "DT: impossible branch"
))

# 204 "Vuna/Compiler/Wasm/Module.vuna"
let rec v_Vuna_dCompiler_dWasm_dModule_dgenExpr = (fun fuel st ir -> (if (fuel <= 0) then (Base_dResult.C_Base_dResult_dResult_Err ("wasm codegen fuel exhausted")) else (match ir with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrVar (dtb__116) -> ((v_Vuna_dCompiler_dWasm_dModule_dgenVar st) dtb__116)
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrGlobal (dtb__117) -> ((v_Vuna_dCompiler_dWasm_dModule_dgenGlobalRef st) dtb__117)
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrInt (dtb__118) -> (Base_dResult.C_Base_dResult_dResult_Ok ({ Base_dPair.f_Base_dPair_dPair_first = (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dWasm_dInstr.C_Vuna_dCompiler_dWasm_dInstr_dInstr_IConstI64 (dtb__118)), (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dWasm_dInstr.C_Vuna_dCompiler_dWasm_dInstr_dInstr_IStructNew ("$int")), Base_dList.C_Base_dList_dList_Nil)))); Base_dPair.f_Base_dPair_dPair_second = st }))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrBool (dtb__119) -> (Base_dResult.C_Base_dResult_dResult_Ok ({ Base_dPair.f_Base_dPair_dPair_first = (v_Vuna_dCompiler_dWasm_dModule_dboolI31 dtb__119); Base_dPair.f_Base_dPair_dPair_second = st }))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrStr (dtb__120) -> ((v_Vuna_dCompiler_dWasm_dModule_dgenStr st) dtb__120)
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCast (dtb__121) -> (((v_Vuna_dCompiler_dWasm_dModule_dgenExpr (fuel - 1)) st) dtb__121)
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLet (dtb__122, dtb__123, dtb__124) -> (((((v_Vuna_dCompiler_dWasm_dModule_dgenLet (fuel - 1)) st) dtb__122) dtb__123) dtb__124)
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrIf (dtb__125, dtb__126, dtb__127) -> (((((v_Vuna_dCompiler_dWasm_dModule_dgenIf (fuel - 1)) st) dtb__125) dtb__126) dtb__127)
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRtApp (dtb__128, dtb__129) -> ((((v_Vuna_dCompiler_dWasm_dModule_dgenRtApp (fuel - 1)) st) dtb__128) dtb__129)
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (dtb__130, dtb__131) -> (((v_Vuna_dCompiler_dWasm_dModule_dgenApp (fuel - 1)) st) ir)
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrNatCase (dtb__132, dtb__133, dtb__134, dtb__135, dtb__136) -> ((((((v_Vuna_dCompiler_dWasm_dModule_dgenNatCase (fuel - 1)) st) dtb__132) dtb__134) dtb__135) dtb__136)
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrConcatMany (dtb__137) -> (((v_Vuna_dCompiler_dWasm_dModule_dgenConcatMany (fuel - 1)) st) dtb__137)
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCtor (dtb__138, dtb__139, dtb__140) -> (((((v_Vuna_dCompiler_dWasm_dModule_dgenCtor (fuel - 1)) st) dtb__138) dtb__139) dtb__140)
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRecord (dtb__141, dtb__142) -> ((((v_Vuna_dCompiler_dWasm_dModule_dgenRecord (fuel - 1)) st) dtb__141) dtb__142)
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrProj (dtb__143, dtb__144, dtb__145) -> (((((v_Vuna_dCompiler_dWasm_dModule_dgenProj (fuel - 1)) st) dtb__143) dtb__144) dtb__145)
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRecUpd (dtb__146, dtb__147, dtb__148) -> (((((v_Vuna_dCompiler_dWasm_dModule_dgenRecUpd (fuel - 1)) st) dtb__146) dtb__147) dtb__148)
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCase (dtb__149, dtb__150) -> ((((v_Vuna_dCompiler_dWasm_dModule_dgenCase (fuel - 1)) st) dtb__149) dtb__150)
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLam (dtb__151, dtb__152) -> (Base_dResult.C_Base_dResult_dResult_Err ("wasm target: lambda values are not supported yet"))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrEffThunk (dtb__153, dtb__154, dtb__155, dtb__156, dtb__157) -> (Base_dResult.C_Base_dResult_dResult_Err ("wasm target: effect thunks are not supported yet"))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrEffBind (dtb__158, dtb__159, dtb__160) -> (Base_dResult.C_Base_dResult_dResult_Err ("wasm target: effect bindings are not supported yet"))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrFloatLit (dtb__161) -> (Base_dResult.C_Base_dResult_dResult_Err ("wasm target: float literals are not supported yet"))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRt (dtb__162) -> (Base_dResult.C_Base_dResult_dResult_Err ("wasm target: runtime function values are not supported yet"))
  | _ -> failwith "DT: impossible branch"
)))
# 249 "Vuna/Compiler/Wasm/Module.vuna"
and v_Vuna_dCompiler_dWasm_dModule_dgenIf = (fun fuel st c th el -> (if (fuel <= 0) then (Base_dResult.C_Base_dResult_dResult_Err ("wasm codegen fuel exhausted")) else (match (((v_Vuna_dCompiler_dWasm_dModule_dgenExpr (fuel - 1)) st) c) with
  | Base_dResult.C_Base_dResult_dResult_Err (dtb__163) -> (Base_dResult.C_Base_dResult_dResult_Err (dtb__163))
  | Base_dResult.C_Base_dResult_dResult_Ok (dtb__164) -> (match (((v_Vuna_dCompiler_dWasm_dModule_dgenExpr (fuel - 1)) (Base_dPair.v_Base_dPair_dsecondOf dtb__164)) th) with
  | Base_dResult.C_Base_dResult_dResult_Err (dtb__165) -> (Base_dResult.C_Base_dResult_dResult_Err (dtb__165))
  | Base_dResult.C_Base_dResult_dResult_Ok (dtb__166) -> (match (((v_Vuna_dCompiler_dWasm_dModule_dgenExpr (fuel - 1)) (Base_dPair.v_Base_dPair_dsecondOf dtb__164)) el) with
  | Base_dResult.C_Base_dResult_dResult_Err (dtb__167) -> (Base_dResult.C_Base_dResult_dResult_Err (dtb__167))
  | Base_dResult.C_Base_dResult_dResult_Ok (dtb__168) -> ((fun merged -> (Base_dResult.C_Base_dResult_dResult_Ok ({ Base_dPair.f_Base_dPair_dPair_first = ((Base_dList.v_Base_dList_dappend (Base_dPair.v_Base_dPair_dfirstOf dtb__164)) (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dWasm_dInstr.C_Vuna_dCompiler_dWasm_dInstr_dInstr_IRefCast ("i31")), (Base_dList.C_Base_dList_dList_Cons (Vuna_dCompiler_dWasm_dInstr.C_Vuna_dCompiler_dWasm_dInstr_dInstr_II31GetU, (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dWasm_dInstr.C_Vuna_dCompiler_dWasm_dInstr_dInstr_IIf ("anyref", (Base_dPair.v_Base_dPair_dfirstOf dtb__166), (Base_dPair.v_Base_dPair_dfirstOf dtb__168))), Base_dList.C_Base_dList_dList_Nil))))))); Base_dPair.f_Base_dPair_dPair_second = merged }))) ((v_Vuna_dCompiler_dWasm_dModule_dmergeArmState (Base_dPair.v_Base_dPair_dsecondOf dtb__166)) (Base_dPair.v_Base_dPair_dsecondOf dtb__168)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))
# 264 "Vuna/Compiler/Wasm/Module.vuna"
and v_Vuna_dCompiler_dWasm_dModule_dgenLet = (fun fuel st bs scrut body -> (if (fuel <= 0) then (Base_dResult.C_Base_dResult_dResult_Err ("wasm codegen fuel exhausted")) else ((fun runtimeBs -> ((fun savedScope -> (match (((v_Vuna_dCompiler_dWasm_dModule_dgenExpr (fuel - 1)) st) scrut) with
  | Base_dResult.C_Base_dResult_dResult_Err (dtb__169) -> (Base_dResult.C_Base_dResult_dResult_Err (dtb__169))
  | Base_dResult.C_Base_dResult_dResult_Ok (dtb__170) -> ((((((v_Vuna_dCompiler_dWasm_dModule_dgenLetBound (fuel - 1)) (Base_dPair.v_Base_dPair_dsecondOf dtb__170)) runtimeBs) (Base_dPair.v_Base_dPair_dfirstOf dtb__170)) body) savedScope)
  | _ -> failwith "DT: impossible branch"
)) (st).f_Vuna_dCompiler_dWasm_dModule_dGenState_gsScope)) (v_Vuna_dCompiler_dWasm_dModule_druntimeBinders bs))))
# 274 "Vuna/Compiler/Wasm/Module.vuna"
and v_Vuna_dCompiler_dWasm_dModule_dgenLetBound = (fun mc0 mc1 mc2 mc3 mc4 mc5 -> (match mc2 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__171, dtb__172) -> (if (mc0 <= 0) then (Base_dResult.C_Base_dResult_dResult_Err ("wasm codegen fuel exhausted")) else (if ((v_Vuna_dCompiler_dWasm_dModule_dlistLengthB dtb__172) <> 0) then (Base_dResult.C_Base_dResult_dResult_Err ("unboxed let has more than one runtime binder")) else (match ((v_Vuna_dCompiler_dWasm_dModule_dfreshLocal mc1) Vuna_dCompiler_dWasm_dModel.C_Vuna_dCompiler_dWasm_dModel_dWatValTy_WvAnyRef) with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__173; Base_dPair.f_Base_dPair_dPair_second = dtb__174 } -> (match (((v_Vuna_dCompiler_dWasm_dModule_dgenExpr (mc0 - 1)) (((v_Vuna_dCompiler_dWasm_dModule_dpushBinder dtb__171) dtb__173) dtb__174)) mc4) with
  | Base_dResult.C_Base_dResult_dResult_Err (dtb__175) -> (Base_dResult.C_Base_dResult_dResult_Err (dtb__175))
  | Base_dResult.C_Base_dResult_dResult_Ok (dtb__176) -> (Base_dResult.C_Base_dResult_dResult_Ok ({ Base_dPair.f_Base_dPair_dPair_first = ((Base_dList.v_Base_dList_dappend mc3) ((Base_dList.v_Base_dList_dappend (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dWasm_dInstr.C_Vuna_dCompiler_dWasm_dInstr_dInstr_ILocalSet (dtb__173)), Base_dList.C_Base_dList_dList_Nil))) (Base_dPair.v_Base_dPair_dfirstOf dtb__176))); Base_dPair.f_Base_dPair_dPair_second = ((v_Vuna_dCompiler_dWasm_dModule_drestoreScope mc5) (Base_dPair.v_Base_dPair_dsecondOf dtb__176)) }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))
  | Base_dList.C_Base_dList_dList_Nil -> (if (mc0 <= 0) then (Base_dResult.C_Base_dResult_dResult_Err ("wasm codegen fuel exhausted")) else (match (((v_Vuna_dCompiler_dWasm_dModule_dgenExpr (mc0 - 1)) mc1) mc4) with
  | Base_dResult.C_Base_dResult_dResult_Err (dtb__177) -> (Base_dResult.C_Base_dResult_dResult_Err (dtb__177))
  | Base_dResult.C_Base_dResult_dResult_Ok (dtb__178) -> (Base_dResult.C_Base_dResult_dResult_Ok ({ Base_dPair.f_Base_dPair_dPair_first = ((Base_dList.v_Base_dList_dappend mc3) ((Base_dList.v_Base_dList_dappend (Base_dList.C_Base_dList_dList_Cons (Vuna_dCompiler_dWasm_dInstr.C_Vuna_dCompiler_dWasm_dInstr_dInstr_IDrop, Base_dList.C_Base_dList_dList_Nil))) (Base_dPair.v_Base_dPair_dfirstOf dtb__178))); Base_dPair.f_Base_dPair_dPair_second = ((v_Vuna_dCompiler_dWasm_dModule_drestoreScope mc5) (Base_dPair.v_Base_dPair_dsecondOf dtb__178)) }))
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
))
# 304 "Vuna/Compiler/Wasm/Module.vuna"
and v_Vuna_dCompiler_dWasm_dModule_dgenApp = (fun fuel st ir -> (if (fuel <= 0) then (Base_dResult.C_Base_dResult_dResult_Err ("wasm codegen fuel exhausted")) else (match (v_Vuna_dCompiler_dWasm_dModule_dflattenApp ir) with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__179; Base_dPair.f_Base_dPair_dPair_second = dtb__180 } -> (match dtb__179 with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrGlobal (dtb__181) -> ((((v_Vuna_dCompiler_dWasm_dModule_dgenGlobalCall (fuel - 1)) st) dtb__181) dtb__180)
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLam (dtb__182, dtb__183) -> (((((v_Vuna_dCompiler_dWasm_dModule_dgenLamApp (fuel - 1)) st) dtb__182) dtb__183) dtb__180)
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRt (dtb__184) -> ((((v_Vuna_dCompiler_dWasm_dModule_dgenRtApp (fuel - 1)) st) dtb__184) dtb__180)
  | _ -> (Base_dResult.C_Base_dResult_dResult_Err ("wasm target: higher-order application is not supported yet"))
)
  | _ -> failwith "DT: impossible branch"
)))
# 313 "Vuna/Compiler/Wasm/Module.vuna"
and v_Vuna_dCompiler_dWasm_dModule_dgenGlobalCall = (fun fuel st name args -> (if (fuel <= 0) then (Base_dResult.C_Base_dResult_dResult_Err ("wasm codegen fuel exhausted")) else (match ((v_Vuna_dCompiler_dWasm_dModule_dfindDef name) (st).f_Vuna_dCompiler_dWasm_dModule_dGenState_gsDefs) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (Base_dResult.C_Base_dResult_dResult_Err ((String.concat "" ["unknown top-level definition in wasm codegen: `"; name; "`"])))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__185) -> (if ((Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirDefArity dtb__185) <> (v_Vuna_dCompiler_dWasm_dModule_dlistLengthB args)) then (Base_dResult.C_Base_dResult_dResult_Err ((String.concat "" ["wasm target: call to `"; name; "` is not saturated"]))) else ((((v_Vuna_dCompiler_dWasm_dModule_dgenArgsThen (fuel - 1)) st) args) (Vuna_dCompiler_dWasm_dInstr.C_Vuna_dCompiler_dWasm_dInstr_dInstr_ICall ((Vuna_dCompiler_dWasm_dTypes.v_Vuna_dCompiler_dWasm_dTypes_dwatFuncNameOf name)))))
  | _ -> failwith "DT: impossible branch"
)))
# 322 "Vuna/Compiler/Wasm/Module.vuna"
and v_Vuna_dCompiler_dWasm_dModule_dgenLamApp = (fun fuel st bs body args -> (if (fuel <= 0) then (Base_dResult.C_Base_dResult_dResult_Err ("wasm codegen fuel exhausted")) else ((fun rbs -> ((fun savedScope -> (if ((v_Vuna_dCompiler_dWasm_dModule_dlistLengthB rbs) <> 1) then (Base_dResult.C_Base_dResult_dResult_Err ("wasm target: only single-binder lambdas are supported yet")) else (if ((v_Vuna_dCompiler_dWasm_dModule_dlistLengthB args) <> 1) then (Base_dResult.C_Base_dResult_dResult_Err ("wasm target: only saturated single-argument lambda application is supported yet")) else ((fun nd_uscrut7 -> (match nd_uscrut7 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__186, dtb__187) -> (match dtb__187 with
  | Base_dList.C_Base_dList_dList_Nil -> (match (((v_Vuna_dCompiler_dWasm_dModule_dgenExpr (fuel - 1)) st) dtb__186) with
  | Base_dResult.C_Base_dResult_dResult_Err (dtb__188) -> (Base_dResult.C_Base_dResult_dResult_Err (dtb__188))
  | Base_dResult.C_Base_dResult_dResult_Ok (dtb__189) -> ((fun nd_uscrut14 -> (match nd_uscrut14 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__190, dtb__191) -> (match dtb__191 with
  | Base_dList.C_Base_dList_dList_Nil -> (match ((v_Vuna_dCompiler_dWasm_dModule_dfreshLocal (Base_dPair.v_Base_dPair_dsecondOf dtb__189)) Vuna_dCompiler_dWasm_dModel.C_Vuna_dCompiler_dWasm_dModel_dWatValTy_WvAnyRef) with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__192; Base_dPair.f_Base_dPair_dPair_second = dtb__193 } -> (match (((v_Vuna_dCompiler_dWasm_dModule_dgenExpr (fuel - 1)) (((v_Vuna_dCompiler_dWasm_dModule_dpushBinder dtb__190) dtb__192) dtb__193)) body) with
  | Base_dResult.C_Base_dResult_dResult_Err (dtb__194) -> (Base_dResult.C_Base_dResult_dResult_Err (dtb__194))
  | Base_dResult.C_Base_dResult_dResult_Ok (dtb__195) -> (Base_dResult.C_Base_dResult_dResult_Ok ({ Base_dPair.f_Base_dPair_dPair_first = ((Base_dList.v_Base_dList_dappend (Base_dPair.v_Base_dPair_dfirstOf dtb__189)) ((Base_dList.v_Base_dList_dappend (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dWasm_dInstr.C_Vuna_dCompiler_dWasm_dInstr_dInstr_ILocalSet (dtb__192)), Base_dList.C_Base_dList_dList_Nil))) (Base_dPair.v_Base_dPair_dfirstOf dtb__195))); Base_dPair.f_Base_dPair_dPair_second = ((v_Vuna_dCompiler_dWasm_dModule_drestoreScope savedScope) (Base_dPair.v_Base_dPair_dsecondOf dtb__195)) }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> (Base_dResult.C_Base_dResult_dResult_Err ("wasm target: lambda binder shape mismatch"))
)
  | _ -> (Base_dResult.C_Base_dResult_dResult_Err ("wasm target: lambda binder shape mismatch"))
)) rbs)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> (Base_dResult.C_Base_dResult_dResult_Err ("wasm target: lambda application shape mismatch"))
)
  | _ -> (Base_dResult.C_Base_dResult_dResult_Err ("wasm target: lambda application shape mismatch"))
)) args)))) (st).f_Vuna_dCompiler_dWasm_dModule_dGenState_gsScope)) (v_Vuna_dCompiler_dWasm_dModule_druntimeBinders bs))))
# 344 "Vuna/Compiler/Wasm/Module.vuna"
and v_Vuna_dCompiler_dWasm_dModule_dgenArgsThen = (fun mc0 mc1 mc2 mc3 -> (match mc2 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__196, dtb__197) -> (if (mc0 <= 0) then (Base_dResult.C_Base_dResult_dResult_Err ("wasm codegen fuel exhausted")) else (match (((v_Vuna_dCompiler_dWasm_dModule_dgenExpr (mc0 - 1)) mc1) dtb__196) with
  | Base_dResult.C_Base_dResult_dResult_Err (dtb__198) -> (Base_dResult.C_Base_dResult_dResult_Err (dtb__198))
  | Base_dResult.C_Base_dResult_dResult_Ok (dtb__199) -> (match ((((v_Vuna_dCompiler_dWasm_dModule_dgenArgsThen (mc0 - 1)) (Base_dPair.v_Base_dPair_dsecondOf dtb__199)) dtb__197) mc3) with
  | Base_dResult.C_Base_dResult_dResult_Err (dtb__200) -> (Base_dResult.C_Base_dResult_dResult_Err (dtb__200))
  | Base_dResult.C_Base_dResult_dResult_Ok (dtb__201) -> (Base_dResult.C_Base_dResult_dResult_Ok ({ Base_dPair.f_Base_dPair_dPair_first = ((Base_dList.v_Base_dList_dappend (Base_dPair.v_Base_dPair_dfirstOf dtb__199)) (Base_dPair.v_Base_dPair_dfirstOf dtb__201)); Base_dPair.f_Base_dPair_dPair_second = (Base_dPair.v_Base_dPair_dsecondOf dtb__201) }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dResult.C_Base_dResult_dResult_Ok ({ Base_dPair.f_Base_dPair_dPair_first = (Base_dList.C_Base_dList_dList_Cons (mc3, Base_dList.C_Base_dList_dList_Nil)); Base_dPair.f_Base_dPair_dPair_second = mc1 }))
  | _ -> failwith "DT: impossible branch"
))
# 353 "Vuna/Compiler/Wasm/Module.vuna"
and v_Vuna_dCompiler_dWasm_dModule_dgenRtApp = (fun fuel st sym args -> (if (fuel <= 0) then (Base_dResult.C_Base_dResult_dResult_Err ("wasm codegen fuel exhausted")) else (if (if (sym = "@vuna@obs@span") then true else (sym = "@vuna@obs@spanLab")) then (Base_dResult.C_Base_dResult_dResult_Err ("wasm target: obs spans need closures (not supported yet); leaf obs primitives (level/log/counter/mark/sample) are no-op stubs")) else (match (Vuna_dCompiler_dWasm_dRuntime.v_Vuna_dCompiler_dWasm_dRuntime_drtImplOf sym) with
  | Vuna_dCompiler_dWasm_dRuntime.C_Vuna_dCompiler_dWasm_dRuntime_dRtImpl_RtUnsupported -> (Base_dResult.C_Base_dResult_dResult_Err ((String.concat "" ["wasm target: runtime symbol `"; sym; "` is not supported yet"])))
  | Vuna_dCompiler_dWasm_dRuntime.C_Vuna_dCompiler_dWasm_dRuntime_dRtImpl_RtValue (dtb__202) -> (Base_dResult.C_Base_dResult_dResult_Ok ({ Base_dPair.f_Base_dPair_dPair_first = dtb__202; Base_dPair.f_Base_dPair_dPair_second = st }))
  | Vuna_dCompiler_dWasm_dRuntime.C_Vuna_dCompiler_dWasm_dRuntime_dRtImpl_RtFunc (dtb__203, dtb__204) -> (if (dtb__203 <> (v_Vuna_dCompiler_dWasm_dModule_dlistLengthB args)) then (Base_dResult.C_Base_dResult_dResult_Err ((String.concat "" ["wasm target: runtime symbol `"; sym; "` applied to the wrong number of arguments"]))) else ((((v_Vuna_dCompiler_dWasm_dModule_dgenArgsThen (fuel - 1)) st) args) (Vuna_dCompiler_dWasm_dInstr.C_Vuna_dCompiler_dWasm_dInstr_dInstr_ICall (dtb__204))))
  | _ -> failwith "DT: impossible branch"
))))
# 375 "Vuna/Compiler/Wasm/Module.vuna"
and v_Vuna_dCompiler_dWasm_dModule_dgenNatArm = (fun fuel st alt valueInstrs -> (if (fuel <= 0) then (Base_dResult.C_Base_dResult_dResult_Err ("wasm codegen fuel exhausted")) else (match alt with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (Base_dResult.C_Base_dResult_dResult_Err ("wasm target: Nat case has no zero/succ/catch branch"))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__205) -> ((((v_Vuna_dCompiler_dWasm_dModule_dgenNatArmAlt fuel) st) dtb__205) valueInstrs)
  | _ -> failwith "DT: impossible branch"
)))
# 381 "Vuna/Compiler/Wasm/Module.vuna"
and v_Vuna_dCompiler_dWasm_dModule_dgenNatArmAlt = (fun fuel st a valueInstrs -> (if (fuel <= 0) then (Base_dResult.C_Base_dResult_dResult_Err ("wasm codegen fuel exhausted")) else ((fun bs -> ((fun savedScope -> ((fun nd_uscrut6 -> (match nd_uscrut6 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__206, dtb__207) -> (match dtb__207 with
  | Base_dList.C_Base_dList_dList_Nil -> (match ((v_Vuna_dCompiler_dWasm_dModule_dfreshLocal st) Vuna_dCompiler_dWasm_dModel.C_Vuna_dCompiler_dWasm_dModel_dWatValTy_WvAnyRef) with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__208; Base_dPair.f_Base_dPair_dPair_second = dtb__209 } -> (match (((v_Vuna_dCompiler_dWasm_dModule_dgenExpr (fuel - 1)) (((v_Vuna_dCompiler_dWasm_dModule_dpushBinder dtb__206) dtb__208) dtb__209)) (Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirAltBodyOf a)) with
  | Base_dResult.C_Base_dResult_dResult_Err (dtb__210) -> (Base_dResult.C_Base_dResult_dResult_Err (dtb__210))
  | Base_dResult.C_Base_dResult_dResult_Ok (dtb__211) -> (Base_dResult.C_Base_dResult_dResult_Ok ({ Base_dPair.f_Base_dPair_dPair_first = ((Base_dList.v_Base_dList_dappend valueInstrs) ((Base_dList.v_Base_dList_dappend (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dWasm_dInstr.C_Vuna_dCompiler_dWasm_dInstr_dInstr_ILocalSet (dtb__208)), Base_dList.C_Base_dList_dList_Nil))) (Base_dPair.v_Base_dPair_dfirstOf dtb__211))); Base_dPair.f_Base_dPair_dPair_second = ((v_Vuna_dCompiler_dWasm_dModule_drestoreScope savedScope) (Base_dPair.v_Base_dPair_dsecondOf dtb__211)) }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> (Base_dResult.C_Base_dResult_dResult_Err ("wasm target: Nat case arm has more than one runtime binder"))
)
  | Base_dList.C_Base_dList_dList_Nil -> (((v_Vuna_dCompiler_dWasm_dModule_dgenExpr (fuel - 1)) st) (Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirAltBodyOf a))
  | _ -> failwith "DT: impossible branch"
)) bs)) (st).f_Vuna_dCompiler_dWasm_dModule_dGenState_gsScope)) (v_Vuna_dCompiler_dWasm_dModule_druntimeBinders (Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirAltBindersOf a)))))
# 397 "Vuna/Compiler/Wasm/Module.vuna"
and v_Vuna_dCompiler_dWasm_dModule_dgenNatCase = (fun fuel st scrut zero succ catch -> (if (fuel <= 0) then (Base_dResult.C_Base_dResult_dResult_Err ("wasm codegen fuel exhausted")) else (match (((v_Vuna_dCompiler_dWasm_dModule_dgenExpr (fuel - 1)) st) scrut) with
  | Base_dResult.C_Base_dResult_dResult_Err (dtb__212) -> (Base_dResult.C_Base_dResult_dResult_Err (dtb__212))
  | Base_dResult.C_Base_dResult_dResult_Ok (dtb__213) -> (match ((v_Vuna_dCompiler_dWasm_dModule_dfreshLocal (Base_dPair.v_Base_dPair_dsecondOf dtb__213)) Vuna_dCompiler_dWasm_dModel.C_Vuna_dCompiler_dWasm_dModel_dWatValTy_WvAnyRef) with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__214; Base_dPair.f_Base_dPair_dPair_second = dtb__215 } -> ((fun zeroAlt -> ((fun succAlt -> ((fun zeroValue -> ((fun succValue -> ((fun succBoxed -> (match ((((v_Vuna_dCompiler_dWasm_dModule_dgenNatArm (fuel - 1)) dtb__215) zeroAlt) zeroValue) with
  | Base_dResult.C_Base_dResult_dResult_Err (dtb__216) -> (Base_dResult.C_Base_dResult_dResult_Err (dtb__216))
  | Base_dResult.C_Base_dResult_dResult_Ok (dtb__217) -> (match ((((v_Vuna_dCompiler_dWasm_dModule_dgenNatArm (fuel - 1)) dtb__215) succAlt) succBoxed) with
  | Base_dResult.C_Base_dResult_dResult_Err (dtb__218) -> (Base_dResult.C_Base_dResult_dResult_Err (dtb__218))
  | Base_dResult.C_Base_dResult_dResult_Ok (dtb__219) -> ((fun merged -> ((fun cond -> (Base_dResult.C_Base_dResult_dResult_Ok ({ Base_dPair.f_Base_dPair_dPair_first = ((Base_dList.v_Base_dList_dappend (Base_dPair.v_Base_dPair_dfirstOf dtb__213)) ((Base_dList.v_Base_dList_dappend (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dWasm_dInstr.C_Vuna_dCompiler_dWasm_dInstr_dInstr_ILocalSet (dtb__214)), Base_dList.C_Base_dList_dList_Nil))) ((Base_dList.v_Base_dList_dappend cond) (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dWasm_dInstr.C_Vuna_dCompiler_dWasm_dInstr_dInstr_IIf ("anyref", (Base_dPair.v_Base_dPair_dfirstOf dtb__217), (Base_dPair.v_Base_dPair_dfirstOf dtb__219))), Base_dList.C_Base_dList_dList_Nil))))); Base_dPair.f_Base_dPair_dPair_second = merged }))) ((Base_dList.v_Base_dList_dappend (v_Vuna_dCompiler_dWasm_dModule_dunboxLocalInt dtb__214)) (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dWasm_dInstr.C_Vuna_dCompiler_dWasm_dInstr_dInstr_IConstI64 (0)), (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dWasm_dInstr.C_Vuna_dCompiler_dWasm_dInstr_dInstr_IBinop ("i64.eq")), Base_dList.C_Base_dList_dList_Nil))))))) ((v_Vuna_dCompiler_dWasm_dModule_dmergeArmState (Base_dPair.v_Base_dPair_dsecondOf dtb__217)) (Base_dPair.v_Base_dPair_dsecondOf dtb__219)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) ((Base_dList.v_Base_dList_dappend succValue) v_Vuna_dCompiler_dWasm_dModule_dboxInstr))) ((Base_dList.v_Base_dList_dappend (v_Vuna_dCompiler_dWasm_dModule_dunboxLocalInt dtb__214)) (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dWasm_dInstr.C_Vuna_dCompiler_dWasm_dInstr_dInstr_IConstI64 (1)), (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dWasm_dInstr.C_Vuna_dCompiler_dWasm_dInstr_dInstr_IBinop ("i64.sub")), Base_dList.C_Base_dList_dList_Nil))))))) (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dWasm_dInstr.C_Vuna_dCompiler_dWasm_dInstr_dInstr_ILocalGet (dtb__214)), Base_dList.C_Base_dList_dList_Nil)))) (match succ with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__220) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__220))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> catch
  | _ -> failwith "DT: impossible branch"
))) (match zero with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__221) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__221))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> catch
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))
# 424 "Vuna/Compiler/Wasm/Module.vuna"
and v_Vuna_dCompiler_dWasm_dModule_dgenConcatMany = (fun fuel st parts -> (if (fuel <= 0) then (Base_dResult.C_Base_dResult_dResult_Err ("wasm codegen fuel exhausted")) else ((fun nd_uscrut3 -> (match nd_uscrut3 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__222, dtb__223) -> (match dtb__223 with
  | Base_dList.C_Base_dList_dList_Nil -> (((v_Vuna_dCompiler_dWasm_dModule_dgenExpr (fuel - 1)) st) dtb__222)
  | _ -> (match (((v_Vuna_dCompiler_dWasm_dModule_dgenExpr (fuel - 1)) st) dtb__222) with
  | Base_dResult.C_Base_dResult_dResult_Err (dtb__224) -> (Base_dResult.C_Base_dResult_dResult_Err (dtb__224))
  | Base_dResult.C_Base_dResult_dResult_Ok (dtb__225) -> (match (((v_Vuna_dCompiler_dWasm_dModule_dgenConcatRest (fuel - 1)) (Base_dPair.v_Base_dPair_dsecondOf dtb__225)) dtb__223) with
  | Base_dResult.C_Base_dResult_dResult_Err (dtb__226) -> (Base_dResult.C_Base_dResult_dResult_Err (dtb__226))
  | Base_dResult.C_Base_dResult_dResult_Ok (dtb__227) -> (Base_dResult.C_Base_dResult_dResult_Ok ({ Base_dPair.f_Base_dPair_dPair_first = ((Base_dList.v_Base_dList_dappend (Base_dPair.v_Base_dPair_dfirstOf dtb__225)) (Base_dPair.v_Base_dPair_dfirstOf dtb__227)); Base_dPair.f_Base_dPair_dPair_second = (Base_dPair.v_Base_dPair_dsecondOf dtb__227) }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
)
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dResult.C_Base_dResult_dResult_Ok ({ Base_dPair.f_Base_dPair_dPair_first = v_Vuna_dCompiler_dWasm_dModule_demptyStr; Base_dPair.f_Base_dPair_dPair_second = st }))
  | _ -> failwith "DT: impossible branch"
)) parts)))
# 435 "Vuna/Compiler/Wasm/Module.vuna"
and v_Vuna_dCompiler_dWasm_dModule_dgenConcatRest = (fun mc0 mc1 mc2 -> (match mc2 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__228, dtb__229) -> (if (mc0 <= 0) then (Base_dResult.C_Base_dResult_dResult_Err ("wasm codegen fuel exhausted")) else (match (((v_Vuna_dCompiler_dWasm_dModule_dgenExpr (mc0 - 1)) mc1) dtb__228) with
  | Base_dResult.C_Base_dResult_dResult_Err (dtb__230) -> (Base_dResult.C_Base_dResult_dResult_Err (dtb__230))
  | Base_dResult.C_Base_dResult_dResult_Ok (dtb__231) -> (match (((v_Vuna_dCompiler_dWasm_dModule_dgenConcatRest (mc0 - 1)) (Base_dPair.v_Base_dPair_dsecondOf dtb__231)) dtb__229) with
  | Base_dResult.C_Base_dResult_dResult_Err (dtb__232) -> (Base_dResult.C_Base_dResult_dResult_Err (dtb__232))
  | Base_dResult.C_Base_dResult_dResult_Ok (dtb__233) -> (Base_dResult.C_Base_dResult_dResult_Ok ({ Base_dPair.f_Base_dPair_dPair_first = ((Base_dList.v_Base_dList_dappend (Base_dPair.v_Base_dPair_dfirstOf dtb__231)) ((Base_dList.v_Base_dList_dappend (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dWasm_dInstr.C_Vuna_dCompiler_dWasm_dInstr_dInstr_ICall ("$rt_strConcat")), Base_dList.C_Base_dList_dList_Nil))) (Base_dPair.v_Base_dPair_dfirstOf dtb__233))); Base_dPair.f_Base_dPair_dPair_second = (Base_dPair.v_Base_dPair_dsecondOf dtb__233) }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dResult.C_Base_dResult_dResult_Ok ({ Base_dPair.f_Base_dPair_dPair_first = Base_dList.C_Base_dList_dList_Nil; Base_dPair.f_Base_dPair_dPair_second = mc1 }))
  | _ -> failwith "DT: impossible branch"
))
# 455 "Vuna/Compiler/Wasm/Module.vuna"
and v_Vuna_dCompiler_dWasm_dModule_dgenExprs = (fun mc0 mc1 mc2 -> (match mc2 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__234, dtb__235) -> (if (mc0 <= 0) then (Base_dResult.C_Base_dResult_dResult_Err ("wasm codegen fuel exhausted")) else (match (((v_Vuna_dCompiler_dWasm_dModule_dgenExpr (mc0 - 1)) mc1) dtb__234) with
  | Base_dResult.C_Base_dResult_dResult_Err (dtb__236) -> (Base_dResult.C_Base_dResult_dResult_Err (dtb__236))
  | Base_dResult.C_Base_dResult_dResult_Ok (dtb__237) -> (match (((v_Vuna_dCompiler_dWasm_dModule_dgenExprs (mc0 - 1)) (Base_dPair.v_Base_dPair_dsecondOf dtb__237)) dtb__235) with
  | Base_dResult.C_Base_dResult_dResult_Err (dtb__238) -> (Base_dResult.C_Base_dResult_dResult_Err (dtb__238))
  | Base_dResult.C_Base_dResult_dResult_Ok (dtb__239) -> (Base_dResult.C_Base_dResult_dResult_Ok ({ Base_dPair.f_Base_dPair_dPair_first = ((Base_dList.v_Base_dList_dappend (Base_dPair.v_Base_dPair_dfirstOf dtb__237)) (Base_dPair.v_Base_dPair_dfirstOf dtb__239)); Base_dPair.f_Base_dPair_dPair_second = (Base_dPair.v_Base_dPair_dsecondOf dtb__239) }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dResult.C_Base_dResult_dResult_Ok ({ Base_dPair.f_Base_dPair_dPair_first = Base_dList.C_Base_dList_dList_Nil; Base_dPair.f_Base_dPair_dPair_second = mc1 }))
  | _ -> failwith "DT: impossible branch"
))
# 466 "Vuna/Compiler/Wasm/Module.vuna"
and v_Vuna_dCompiler_dWasm_dModule_dgenCtor = (fun fuel st family ctor args -> (if (fuel <= 0) then (Base_dResult.C_Base_dResult_dResult_Err ("wasm codegen fuel exhausted")) else (match ((v_Vuna_dCompiler_dWasm_dModule_dfamOrFail st) family) with
  | Base_dResult.C_Base_dResult_dResult_Err (dtb__240) -> (Base_dResult.C_Base_dResult_dResult_Err (dtb__240))
  | Base_dResult.C_Base_dResult_dResult_Ok (dtb__241) -> (match ((Vuna_dCompiler_dWasm_dTypes.v_Vuna_dCompiler_dWasm_dTypes_dwasmCtorTagOf dtb__241) ctor) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (Base_dResult.C_Base_dResult_dResult_Err ((String.concat "" ["unknown constructor in wasm codegen: `"; ctor; "`"])))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__242) -> (match ((Vuna_dCompiler_dWasm_dTypes.v_Vuna_dCompiler_dWasm_dTypes_dwasmCtorFieldCountOf dtb__241) ctor) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (Base_dResult.C_Base_dResult_dResult_Err ((String.concat "" ["unknown constructor in wasm codegen: `"; ctor; "`"])))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__243) -> (if ((v_Vuna_dCompiler_dWasm_dModule_dlistLengthB args) <> dtb__243) then (Base_dResult.C_Base_dResult_dResult_Err ((String.concat "" ["constructor `"; ctor; "` applied to the wrong number of arguments"]))) else (match (((v_Vuna_dCompiler_dWasm_dModule_dgenExprs (fuel - 1)) st) args) with
  | Base_dResult.C_Base_dResult_dResult_Err (dtb__244) -> (Base_dResult.C_Base_dResult_dResult_Err (dtb__244))
  | Base_dResult.C_Base_dResult_dResult_Ok (dtb__245) -> ((fun instrs -> (Base_dResult.C_Base_dResult_dResult_Ok ({ Base_dPair.f_Base_dPair_dPair_first = instrs; Base_dPair.f_Base_dPair_dPair_second = (Base_dPair.v_Base_dPair_dsecondOf dtb__245) }))) ((Base_dList.v_Base_dList_dappend (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dWasm_dInstr.C_Vuna_dCompiler_dWasm_dInstr_dInstr_IConstI32 (dtb__242)), (Base_dPair.v_Base_dPair_dfirstOf dtb__245)))) ((Base_dList.v_Base_dList_dappend (v_Vuna_dCompiler_dWasm_dModule_drefNullN ((dtb__241).Vuna_dCompiler_dWasm_dTypes.f_Vuna_dCompiler_dWasm_dTypes_dWasmFam_wasmFamMaxFields - dtb__243))) (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dWasm_dInstr.C_Vuna_dCompiler_dWasm_dInstr_dInstr_IStructNew ((Vuna_dCompiler_dWasm_dTypes.v_Vuna_dCompiler_dWasm_dTypes_dwatFamName family))), Base_dList.C_Base_dList_dList_Nil)))))
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))
# 485 "Vuna/Compiler/Wasm/Module.vuna"
and v_Vuna_dCompiler_dWasm_dModule_dgenRecord = (fun fuel st family fields -> (if (fuel <= 0) then (Base_dResult.C_Base_dResult_dResult_Err ("wasm codegen fuel exhausted")) else (match ((v_Vuna_dCompiler_dWasm_dModule_dfamOrFail st) family) with
  | Base_dResult.C_Base_dResult_dResult_Err (dtb__246) -> (Base_dResult.C_Base_dResult_dResult_Err (dtb__246))
  | Base_dResult.C_Base_dResult_dResult_Ok (dtb__247) -> (if ((v_Vuna_dCompiler_dWasm_dModule_dlistLengthB fields) <> (v_Vuna_dCompiler_dWasm_dModule_dlistLengthB (dtb__247).Vuna_dCompiler_dWasm_dTypes.f_Vuna_dCompiler_dWasm_dTypes_dWasmFam_wasmFamRecordFields)) then (Base_dResult.C_Base_dResult_dResult_Err ((String.concat "" ["record `"; family; "` constructed with the wrong number of fields"]))) else (match (((v_Vuna_dCompiler_dWasm_dModule_dgenExprs (fuel - 1)) st) ((Base_dList.v_Base_dList_dmap (fun p -> (Base_dPair.v_Base_dPair_dsecondOf p))) fields)) with
  | Base_dResult.C_Base_dResult_dResult_Err (dtb__248) -> (Base_dResult.C_Base_dResult_dResult_Err (dtb__248))
  | Base_dResult.C_Base_dResult_dResult_Ok (dtb__249) -> (Base_dResult.C_Base_dResult_dResult_Ok ({ Base_dPair.f_Base_dPair_dPair_first = ((Base_dList.v_Base_dList_dappend (Base_dPair.v_Base_dPair_dfirstOf dtb__249)) (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dWasm_dInstr.C_Vuna_dCompiler_dWasm_dInstr_dInstr_IStructNew ((Vuna_dCompiler_dWasm_dTypes.v_Vuna_dCompiler_dWasm_dTypes_dwatFamName family))), Base_dList.C_Base_dList_dList_Nil))); Base_dPair.f_Base_dPair_dPair_second = (Base_dPair.v_Base_dPair_dsecondOf dtb__249) }))
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
)))
# 494 "Vuna/Compiler/Wasm/Module.vuna"
and v_Vuna_dCompiler_dWasm_dModule_dgenProj = (fun fuel st base family field -> (if (fuel <= 0) then (Base_dResult.C_Base_dResult_dResult_Err ("wasm codegen fuel exhausted")) else (match ((v_Vuna_dCompiler_dWasm_dModule_dfamOrFail st) family) with
  | Base_dResult.C_Base_dResult_dResult_Err (dtb__250) -> (Base_dResult.C_Base_dResult_dResult_Err (dtb__250))
  | Base_dResult.C_Base_dResult_dResult_Ok (dtb__251) -> (match ((Vuna_dCompiler_dWasm_dTypes.v_Vuna_dCompiler_dWasm_dTypes_dwasmRecordFieldIndex dtb__251) field) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (Base_dResult.C_Base_dResult_dResult_Err ((String.concat "" ["unknown record field in wasm codegen: `"; family; "."; field; "`"])))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__252) -> (match (((v_Vuna_dCompiler_dWasm_dModule_dgenExpr (fuel - 1)) st) base) with
  | Base_dResult.C_Base_dResult_dResult_Err (dtb__253) -> (Base_dResult.C_Base_dResult_dResult_Err (dtb__253))
  | Base_dResult.C_Base_dResult_dResult_Ok (dtb__254) -> (Base_dResult.C_Base_dResult_dResult_Ok ({ Base_dPair.f_Base_dPair_dPair_first = ((Base_dList.v_Base_dList_dappend (Base_dPair.v_Base_dPair_dfirstOf dtb__254)) (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dWasm_dInstr.C_Vuna_dCompiler_dWasm_dInstr_dInstr_IRefCast ((Vuna_dCompiler_dWasm_dTypes.v_Vuna_dCompiler_dWasm_dTypes_dwatFamName family))), (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dWasm_dInstr.C_Vuna_dCompiler_dWasm_dInstr_dInstr_IStructGet ((Vuna_dCompiler_dWasm_dTypes.v_Vuna_dCompiler_dWasm_dTypes_dwatFamName family), dtb__252)), Base_dList.C_Base_dList_dList_Nil))))); Base_dPair.f_Base_dPair_dPair_second = (Base_dPair.v_Base_dPair_dsecondOf dtb__254) }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))
# 507 "Vuna/Compiler/Wasm/Module.vuna"
and v_Vuna_dCompiler_dWasm_dModule_dgenRecUpd = (fun fuel st base family fields -> (if (fuel <= 0) then (Base_dResult.C_Base_dResult_dResult_Err ("wasm codegen fuel exhausted")) else (match ((v_Vuna_dCompiler_dWasm_dModule_dfamOrFail st) family) with
  | Base_dResult.C_Base_dResult_dResult_Err (dtb__255) -> (Base_dResult.C_Base_dResult_dResult_Err (dtb__255))
  | Base_dResult.C_Base_dResult_dResult_Ok (dtb__256) -> (match (((v_Vuna_dCompiler_dWasm_dModule_dgenExpr (fuel - 1)) st) base) with
  | Base_dResult.C_Base_dResult_dResult_Err (dtb__257) -> (Base_dResult.C_Base_dResult_dResult_Err (dtb__257))
  | Base_dResult.C_Base_dResult_dResult_Ok (dtb__258) -> (match ((v_Vuna_dCompiler_dWasm_dModule_dfreshLocal (Base_dPair.v_Base_dPair_dsecondOf dtb__258)) Vuna_dCompiler_dWasm_dModel.C_Vuna_dCompiler_dWasm_dModel_dWatValTy_WvAnyRef) with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__259; Base_dPair.f_Base_dPair_dPair_second = dtb__260 } -> (match ((((((v_Vuna_dCompiler_dWasm_dModule_dgenUpdFields (fuel - 1)) dtb__260) dtb__259) (Vuna_dCompiler_dWasm_dTypes.v_Vuna_dCompiler_dWasm_dTypes_dwatFamName family)) (dtb__256).Vuna_dCompiler_dWasm_dTypes.f_Vuna_dCompiler_dWasm_dTypes_dWasmFam_wasmFamRecordFields) fields) with
  | Base_dResult.C_Base_dResult_dResult_Err (dtb__261) -> (Base_dResult.C_Base_dResult_dResult_Err (dtb__261))
  | Base_dResult.C_Base_dResult_dResult_Ok (dtb__262) -> (Base_dResult.C_Base_dResult_dResult_Ok ({ Base_dPair.f_Base_dPair_dPair_first = ((Base_dList.v_Base_dList_dappend (Base_dPair.v_Base_dPair_dfirstOf dtb__258)) ((Base_dList.v_Base_dList_dappend (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dWasm_dInstr.C_Vuna_dCompiler_dWasm_dInstr_dInstr_ILocalSet (dtb__259)), Base_dList.C_Base_dList_dList_Nil))) ((Base_dList.v_Base_dList_dappend (Base_dPair.v_Base_dPair_dfirstOf dtb__262)) (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dWasm_dInstr.C_Vuna_dCompiler_dWasm_dInstr_dInstr_IStructNew ((Vuna_dCompiler_dWasm_dTypes.v_Vuna_dCompiler_dWasm_dTypes_dwatFamName family))), Base_dList.C_Base_dList_dList_Nil))))); Base_dPair.f_Base_dPair_dPair_second = (Base_dPair.v_Base_dPair_dsecondOf dtb__262) }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))
# 520 "Vuna/Compiler/Wasm/Module.vuna"
and v_Vuna_dCompiler_dWasm_dModule_dgenUpdFields = (fun mc0 mc1 mc2 mc3 mc4 mc5 -> (match mc4 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__263, dtb__264) -> (match dtb__263 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__265; Base_dPair.f_Base_dPair_dPair_second = dtb__266 } -> (if (mc0 <= 0) then (Base_dResult.C_Base_dResult_dResult_Err ("wasm codegen fuel exhausted")) else (match ((v_Vuna_dCompiler_dWasm_dModule_dlookupFieldIr dtb__266) mc5) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__267) -> (match (((v_Vuna_dCompiler_dWasm_dModule_dgenExpr (mc0 - 1)) mc1) dtb__267) with
  | Base_dResult.C_Base_dResult_dResult_Err (dtb__268) -> (Base_dResult.C_Base_dResult_dResult_Err (dtb__268))
  | Base_dResult.C_Base_dResult_dResult_Ok (dtb__269) -> (match ((((((v_Vuna_dCompiler_dWasm_dModule_dgenUpdFields (mc0 - 1)) (Base_dPair.v_Base_dPair_dsecondOf dtb__269)) mc2) mc3) dtb__264) mc5) with
  | Base_dResult.C_Base_dResult_dResult_Err (dtb__270) -> (Base_dResult.C_Base_dResult_dResult_Err (dtb__270))
  | Base_dResult.C_Base_dResult_dResult_Ok (dtb__271) -> (Base_dResult.C_Base_dResult_dResult_Ok ({ Base_dPair.f_Base_dPair_dPair_first = ((Base_dList.v_Base_dList_dappend (Base_dPair.v_Base_dPair_dfirstOf dtb__269)) (Base_dPair.v_Base_dPair_dfirstOf dtb__271)); Base_dPair.f_Base_dPair_dPair_second = (Base_dPair.v_Base_dPair_dsecondOf dtb__271) }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (match ((((((v_Vuna_dCompiler_dWasm_dModule_dgenUpdFields (mc0 - 1)) mc1) mc2) mc3) dtb__264) mc5) with
  | Base_dResult.C_Base_dResult_dResult_Err (dtb__272) -> (Base_dResult.C_Base_dResult_dResult_Err (dtb__272))
  | Base_dResult.C_Base_dResult_dResult_Ok (dtb__273) -> (Base_dResult.C_Base_dResult_dResult_Ok ({ Base_dPair.f_Base_dPair_dPair_first = ((Base_dList.v_Base_dList_dappend (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dWasm_dInstr.C_Vuna_dCompiler_dWasm_dInstr_dInstr_ILocalGet (mc2)), (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dWasm_dInstr.C_Vuna_dCompiler_dWasm_dInstr_dInstr_IRefCast (mc3)), (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dWasm_dInstr.C_Vuna_dCompiler_dWasm_dInstr_dInstr_IStructGet (mc3, dtb__265)), Base_dList.C_Base_dList_dList_Nil))))))) (Base_dPair.v_Base_dPair_dfirstOf dtb__273)); Base_dPair.f_Base_dPair_dPair_second = (Base_dPair.v_Base_dPair_dsecondOf dtb__273) }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dResult.C_Base_dResult_dResult_Ok ({ Base_dPair.f_Base_dPair_dPair_first = Base_dList.C_Base_dList_dList_Nil; Base_dPair.f_Base_dPair_dPair_second = mc1 }))
  | _ -> failwith "DT: impossible branch"
))
# 541 "Vuna/Compiler/Wasm/Module.vuna"
and v_Vuna_dCompiler_dWasm_dModule_dgenCase = (fun fuel st scrut alts -> (if (fuel <= 0) then (Base_dResult.C_Base_dResult_dResult_Err ("wasm codegen fuel exhausted")) else (match (((v_Vuna_dCompiler_dWasm_dModule_dgenExpr (fuel - 1)) st) scrut) with
  | Base_dResult.C_Base_dResult_dResult_Err (dtb__274) -> (Base_dResult.C_Base_dResult_dResult_Err (dtb__274))
  | Base_dResult.C_Base_dResult_dResult_Ok (dtb__275) -> ((fun st1 -> (match (v_Vuna_dCompiler_dWasm_dModule_dcaseFamilyOf alts) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((v_Vuna_dCompiler_dWasm_dModule_dprepend (v_Vuna_dCompiler_dWasm_dModule_dscrutInstrs dtb__275)) ((((v_Vuna_dCompiler_dWasm_dModule_dgenCatchAllOnly (fuel - 1)) st1) v_Vuna_dCompiler_dWasm_dModule_dscrutSlot) alts))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__276) -> (match ((v_Vuna_dCompiler_dWasm_dModule_dfamOrFail st1) dtb__276) with
  | Base_dResult.C_Base_dResult_dResult_Err (dtb__277) -> (Base_dResult.C_Base_dResult_dResult_Err (dtb__277))
  | Base_dResult.C_Base_dResult_dResult_Ok (dtb__278) -> (match (dtb__278).Vuna_dCompiler_dWasm_dTypes.f_Vuna_dCompiler_dWasm_dTypes_dWasmFam_wasmFamKind with
  | Vuna_dCompiler_dWasm_dTypes.C_Vuna_dCompiler_dWasm_dTypes_dWasmFamKind_FamRecord -> ((v_Vuna_dCompiler_dWasm_dModule_dprepend (v_Vuna_dCompiler_dWasm_dModule_dscrutInstrs dtb__275)) ((((((v_Vuna_dCompiler_dWasm_dModule_dgenRecordCase (fuel - 1)) st1) v_Vuna_dCompiler_dWasm_dModule_dscrutSlot) dtb__276) dtb__278) alts))
  | _ -> ((v_Vuna_dCompiler_dWasm_dModule_dprepend (v_Vuna_dCompiler_dWasm_dModule_dscrutInstrs dtb__275)) ((((((v_Vuna_dCompiler_dWasm_dModule_dgenVariantCase (fuel - 1)) st1) v_Vuna_dCompiler_dWasm_dModule_dscrutSlot) dtb__276) dtb__278) alts))
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) (((v_Vuna_dCompiler_dWasm_dModule_densureLocal v_Vuna_dCompiler_dWasm_dModule_dscrutSlot) Vuna_dCompiler_dWasm_dModel.C_Vuna_dCompiler_dWasm_dModel_dWatValTy_WvAnyRef) (Base_dPair.v_Base_dPair_dsecondOf dtb__275)))
  | _ -> failwith "DT: impossible branch"
)))
# 581 "Vuna/Compiler/Wasm/Module.vuna"
and v_Vuna_dCompiler_dWasm_dModule_dgenCatchAllOnly = (fun fuel st scLocal alts -> (if (fuel <= 0) then (Base_dResult.C_Base_dResult_dResult_Err ("wasm codegen fuel exhausted")) else (match alts with
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dResult.C_Base_dResult_dResult_Ok ({ Base_dPair.f_Base_dPair_dPair_first = (Base_dList.C_Base_dList_dList_Cons (Vuna_dCompiler_dWasm_dInstr.C_Vuna_dCompiler_dWasm_dInstr_dInstr_IUnreachable, Base_dList.C_Base_dList_dList_Nil)); Base_dPair.f_Base_dPair_dPair_second = st }))
  | Base_dList.C_Base_dList_dList_Cons (dtb__279, dtb__280) -> (match (((v_Vuna_dCompiler_dWasm_dModule_dbindScrutBinder (Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirAltBindersOf dtb__279)) scLocal) st) with
  | Base_dResult.C_Base_dResult_dResult_Err (dtb__281) -> (Base_dResult.C_Base_dResult_dResult_Err (dtb__281))
  | Base_dResult.C_Base_dResult_dResult_Ok (dtb__282) -> (match (((v_Vuna_dCompiler_dWasm_dModule_dgenExpr (fuel - 1)) (Base_dPair.v_Base_dPair_dsecondOf dtb__282)) (Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirAltBodyOf dtb__279)) with
  | Base_dResult.C_Base_dResult_dResult_Err (dtb__283) -> (Base_dResult.C_Base_dResult_dResult_Err (dtb__283))
  | Base_dResult.C_Base_dResult_dResult_Ok (dtb__284) -> (Base_dResult.C_Base_dResult_dResult_Ok ({ Base_dPair.f_Base_dPair_dPair_first = ((Base_dList.v_Base_dList_dappend (Base_dPair.v_Base_dPair_dfirstOf dtb__282)) (Base_dPair.v_Base_dPair_dfirstOf dtb__284)); Base_dPair.f_Base_dPair_dPair_second = (Base_dPair.v_Base_dPair_dsecondOf dtb__284) }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))
# 598 "Vuna/Compiler/Wasm/Module.vuna"
and v_Vuna_dCompiler_dWasm_dModule_dgenVariantCase = (fun fuel st scLocal family fam alts -> (if (fuel <= 0) then (Base_dResult.C_Base_dResult_dResult_Err ("wasm codegen fuel exhausted")) else (match alts with
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dResult.C_Base_dResult_dResult_Ok ({ Base_dPair.f_Base_dPair_dPair_first = (Base_dList.C_Base_dList_dList_Cons (Vuna_dCompiler_dWasm_dInstr.C_Vuna_dCompiler_dWasm_dInstr_dInstr_IUnreachable, Base_dList.C_Base_dList_dList_Nil)); Base_dPair.f_Base_dPair_dPair_second = st }))
  | Base_dList.C_Base_dList_dList_Cons (dtb__285, dtb__286) -> ((fun nd_uscrut9 -> (match nd_uscrut9 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__287) -> (match dtb__287 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__288; Base_dPair.f_Base_dPair_dPair_second = dtb__289 } -> (match ((Vuna_dCompiler_dWasm_dTypes.v_Vuna_dCompiler_dWasm_dTypes_dwasmCtorTagOf fam) dtb__289) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (Base_dResult.C_Base_dResult_dResult_Err ((String.concat "" ["unknown constructor in wasm codegen: `"; dtb__289; "`"])))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__290) -> (match ((((((v_Vuna_dCompiler_dWasm_dModule_dgenAltBody (fuel - 1)) st) scLocal) family) fam) dtb__285) with
  | Base_dResult.C_Base_dResult_dResult_Err (dtb__291) -> (Base_dResult.C_Base_dResult_dResult_Err (dtb__291))
  | Base_dResult.C_Base_dResult_dResult_Ok (dtb__292) -> (match ((((((v_Vuna_dCompiler_dWasm_dModule_dgenVariantCase (fuel - 1)) (Base_dPair.v_Base_dPair_dsecondOf dtb__292)) scLocal) family) fam) dtb__286) with
  | Base_dResult.C_Base_dResult_dResult_Err (dtb__293) -> (Base_dResult.C_Base_dResult_dResult_Err (dtb__293))
  | Base_dResult.C_Base_dResult_dResult_Ok (dtb__294) -> (Base_dResult.C_Base_dResult_dResult_Ok ({ Base_dPair.f_Base_dPair_dPair_first = ((Base_dList.v_Base_dList_dappend (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dWasm_dInstr.C_Vuna_dCompiler_dWasm_dInstr_dInstr_ILocalGet (scLocal)), (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dWasm_dInstr.C_Vuna_dCompiler_dWasm_dInstr_dInstr_IRefCast ((Vuna_dCompiler_dWasm_dTypes.v_Vuna_dCompiler_dWasm_dTypes_dwatFamName family))), (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dWasm_dInstr.C_Vuna_dCompiler_dWasm_dInstr_dInstr_IStructGet ((Vuna_dCompiler_dWasm_dTypes.v_Vuna_dCompiler_dWasm_dTypes_dwatFamName family), 0)), (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dWasm_dInstr.C_Vuna_dCompiler_dWasm_dInstr_dInstr_IConstI32 (dtb__290)), (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dWasm_dInstr.C_Vuna_dCompiler_dWasm_dInstr_dInstr_IBinop ("i32.eq")), Base_dList.C_Base_dList_dList_Nil))))))))))) (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dWasm_dInstr.C_Vuna_dCompiler_dWasm_dInstr_dInstr_IIf ("anyref", (Base_dPair.v_Base_dPair_dfirstOf dtb__292), (Base_dPair.v_Base_dPair_dfirstOf dtb__294))), Base_dList.C_Base_dList_dList_Nil))); Base_dPair.f_Base_dPair_dPair_second = (Base_dPair.v_Base_dPair_dsecondOf dtb__294) }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (match ((((((v_Vuna_dCompiler_dWasm_dModule_dgenAltBody (fuel - 1)) st) scLocal) family) fam) dtb__285) with
  | Base_dResult.C_Base_dResult_dResult_Err (dtb__295) -> (Base_dResult.C_Base_dResult_dResult_Err (dtb__295))
  | Base_dResult.C_Base_dResult_dResult_Ok (dtb__296) -> (Base_dResult.C_Base_dResult_dResult_Ok ({ Base_dPair.f_Base_dPair_dPair_first = (Base_dPair.v_Base_dPair_dfirstOf dtb__296); Base_dPair.f_Base_dPair_dPair_second = (Base_dPair.v_Base_dPair_dsecondOf dtb__296) }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) (Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirAltCtorOf dtb__285))
  | _ -> failwith "DT: impossible branch"
)))
# 617 "Vuna/Compiler/Wasm/Module.vuna"
and v_Vuna_dCompiler_dWasm_dModule_dgenAltBody = (fun fuel st scLocal family fam alt -> (if (fuel <= 0) then (Base_dResult.C_Base_dResult_dResult_Err ("wasm codegen fuel exhausted")) else (match (Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirAltCtorOf alt) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((((v_Vuna_dCompiler_dWasm_dModule_dgenCatchAllOnly (fuel - 1)) st) scLocal) (Base_dList.C_Base_dList_dList_Cons (alt, Base_dList.C_Base_dList_dList_Nil)))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__297) -> (match ((((((v_Vuna_dCompiler_dWasm_dModule_dbindFields (fuel - 1)) st) scLocal) (Vuna_dCompiler_dWasm_dTypes.v_Vuna_dCompiler_dWasm_dTypes_dwatFamName family)) (v_Vuna_dCompiler_dWasm_dModule_druntimeBinders (Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirAltBindersOf alt))) 1) with
  | Base_dResult.C_Base_dResult_dResult_Err (dtb__298) -> (Base_dResult.C_Base_dResult_dResult_Err (dtb__298))
  | Base_dResult.C_Base_dResult_dResult_Ok (dtb__299) -> (match (((v_Vuna_dCompiler_dWasm_dModule_dgenExpr (fuel - 1)) (Base_dPair.v_Base_dPair_dsecondOf dtb__299)) (Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirAltBodyOf alt)) with
  | Base_dResult.C_Base_dResult_dResult_Err (dtb__300) -> (Base_dResult.C_Base_dResult_dResult_Err (dtb__300))
  | Base_dResult.C_Base_dResult_dResult_Ok (dtb__301) -> (Base_dResult.C_Base_dResult_dResult_Ok ({ Base_dPair.f_Base_dPair_dPair_first = ((Base_dList.v_Base_dList_dappend (Base_dPair.v_Base_dPair_dfirstOf dtb__299)) (Base_dPair.v_Base_dPair_dfirstOf dtb__301)); Base_dPair.f_Base_dPair_dPair_second = (Base_dPair.v_Base_dPair_dsecondOf dtb__301) }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))
# 637 "Vuna/Compiler/Wasm/Module.vuna"
and v_Vuna_dCompiler_dWasm_dModule_dgenRecordCase = (fun fuel st scLocal family fam alts -> (if (fuel <= 0) then (Base_dResult.C_Base_dResult_dResult_Err ("wasm codegen fuel exhausted")) else (match alts with
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dResult.C_Base_dResult_dResult_Ok ({ Base_dPair.f_Base_dPair_dPair_first = (Base_dList.C_Base_dList_dList_Cons (Vuna_dCompiler_dWasm_dInstr.C_Vuna_dCompiler_dWasm_dInstr_dInstr_IUnreachable, Base_dList.C_Base_dList_dList_Nil)); Base_dPair.f_Base_dPair_dPair_second = st }))
  | Base_dList.C_Base_dList_dList_Cons (dtb__302, dtb__303) -> (match (Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirAltCtorOf dtb__302) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((((v_Vuna_dCompiler_dWasm_dModule_dgenCatchAllOnly (fuel - 1)) st) scLocal) (Base_dList.C_Base_dList_dList_Cons (dtb__302, dtb__303)))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__304) -> (match ((((((v_Vuna_dCompiler_dWasm_dModule_dbindFields (fuel - 1)) st) scLocal) (Vuna_dCompiler_dWasm_dTypes.v_Vuna_dCompiler_dWasm_dTypes_dwatFamName family)) (v_Vuna_dCompiler_dWasm_dModule_druntimeBinders (Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirAltBindersOf dtb__302))) 0) with
  | Base_dResult.C_Base_dResult_dResult_Err (dtb__305) -> (Base_dResult.C_Base_dResult_dResult_Err (dtb__305))
  | Base_dResult.C_Base_dResult_dResult_Ok (dtb__306) -> (match (((v_Vuna_dCompiler_dWasm_dModule_dgenExpr (fuel - 1)) (Base_dPair.v_Base_dPair_dsecondOf dtb__306)) (Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirAltBodyOf dtb__302)) with
  | Base_dResult.C_Base_dResult_dResult_Err (dtb__307) -> (Base_dResult.C_Base_dResult_dResult_Err (dtb__307))
  | Base_dResult.C_Base_dResult_dResult_Ok (dtb__308) -> (Base_dResult.C_Base_dResult_dResult_Ok ({ Base_dPair.f_Base_dPair_dPair_first = ((Base_dList.v_Base_dList_dappend (Base_dPair.v_Base_dPair_dfirstOf dtb__306)) (Base_dPair.v_Base_dPair_dfirstOf dtb__308)); Base_dPair.f_Base_dPair_dPair_second = (Base_dPair.v_Base_dPair_dsecondOf dtb__308) }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))

# 736 "Vuna/Compiler/Wasm/Module.vuna"
let v_Vuna_dCompiler_dWasm_dModule_dgenDefFuncGo = (fun fuel st name arity inner paramScope savedLocals savedNext savedScope -> ((fun st1 -> (match (((v_Vuna_dCompiler_dWasm_dModule_dgenExpr (fuel - 1)) st1) inner) with
  | Base_dResult.C_Base_dResult_dResult_Err (dtb__309) -> (Base_dResult.C_Base_dResult_dResult_Err (dtb__309))
  | Base_dResult.C_Base_dResult_dResult_Ok (dtb__310) -> ((fun bodyState -> ((fun func -> ((fun st2 -> (Base_dResult.C_Base_dResult_dResult_Ok ({ Base_dPair.f_Base_dPair_dPair_first = (Base_dList.C_Base_dList_dList_Cons (func, Base_dList.C_Base_dList_dList_Nil)); Base_dPair.f_Base_dPair_dPair_second = st2 }))) ((((v_Vuna_dCompiler_dWasm_dModule_dendFuncScope bodyState) savedLocals) savedNext) savedScope))) { Vuna_dCompiler_dWasm_dModel.f_Vuna_dCompiler_dWasm_dModel_dWatFunc_watFuncName = (Vuna_dCompiler_dWasm_dTypes.v_Vuna_dCompiler_dWasm_dTypes_dwatFuncNameOf name); Vuna_dCompiler_dWasm_dModel.f_Vuna_dCompiler_dWasm_dModel_dWatFunc_watFuncType = ""; Vuna_dCompiler_dWasm_dModel.f_Vuna_dCompiler_dWasm_dModel_dWatFunc_watFuncParams = (v_Vuna_dCompiler_dWasm_dModule_dfuncParams arity); Vuna_dCompiler_dWasm_dModel.f_Vuna_dCompiler_dWasm_dModel_dWatFunc_watFuncResults = (Base_dList.C_Base_dList_dList_Cons (Vuna_dCompiler_dWasm_dModel.C_Vuna_dCompiler_dWasm_dModel_dWatValTy_WvAnyRef, Base_dList.C_Base_dList_dList_Nil)); Vuna_dCompiler_dWasm_dModel.f_Vuna_dCompiler_dWasm_dModel_dWatFunc_watFuncLocals = (bodyState).f_Vuna_dCompiler_dWasm_dModule_dGenState_gsLocals; Vuna_dCompiler_dWasm_dModel.f_Vuna_dCompiler_dWasm_dModel_dWatFunc_watFuncBody = (Base_dPair.v_Base_dPair_dfirstOf dtb__310) })) (Base_dPair.v_Base_dPair_dsecondOf dtb__310))
  | _ -> failwith "DT: impossible branch"
)) { st with f_Vuna_dCompiler_dWasm_dModule_dGenState_gsScope = paramScope }))

# 722 "Vuna/Compiler/Wasm/Module.vuna"
let v_Vuna_dCompiler_dWasm_dModule_dgenDefFuncBody = (fun fuel st name arity body -> ((fun savedLocals -> ((fun savedNext -> ((fun savedScope -> ((fun st1 -> (match body with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLam (dtb__311, dtb__312) -> (match (v_Vuna_dCompiler_dWasm_dModule_druntimeBinders dtb__311) with
  | dtb__313 -> (if ((v_Vuna_dCompiler_dWasm_dModule_dlistLengthB dtb__313) <> arity) then (Base_dResult.C_Base_dResult_dResult_Err ((String.concat "" ["wasm target: function body lambda arity mismatch: `"; name; "`"]))) else (((((((((v_Vuna_dCompiler_dWasm_dModule_dgenDefFuncGo fuel) st1) name) arity) dtb__312) ((v_Vuna_dCompiler_dWasm_dModule_dzipIdx 0) dtb__313)) savedLocals) savedNext) savedScope))
)
  | _ -> (Base_dResult.C_Base_dResult_dResult_Err ((String.concat "" ["wasm target: function body is not a lambda: `"; name; "`"])))
)) (v_Vuna_dCompiler_dWasm_dModule_dbeginFuncScope st))) (st).f_Vuna_dCompiler_dWasm_dModule_dGenState_gsScope)) (st).f_Vuna_dCompiler_dWasm_dModule_dGenState_gsNextLocal)) (st).f_Vuna_dCompiler_dWasm_dModule_dGenState_gsLocals))

# 716 "Vuna/Compiler/Wasm/Module.vuna"
let v_Vuna_dCompiler_dWasm_dModule_dgenDefFunc = (fun fuel st d -> (match d with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrDef_IrExternDef (dtb__314, dtb__315, dtb__316, dtb__317) -> (Base_dResult.C_Base_dResult_dResult_Err ((String.concat "" ["wasm target: extern definition `"; dtb__314; "` is not supported yet"])))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrDef_IrDef (dtb__318, dtb__319, dtb__320, dtb__321, dtb__322, dtb__323, dtb__324) -> (if (dtb__319 = 0) then (Base_dResult.C_Base_dResult_dResult_Ok ({ Base_dPair.f_Base_dPair_dPair_first = Base_dList.C_Base_dList_dList_Nil; Base_dPair.f_Base_dPair_dPair_second = st })) else (((((v_Vuna_dCompiler_dWasm_dModule_dgenDefFuncBody fuel) st) dtb__318) dtb__319) dtb__321))
  | _ -> failwith "DT: impossible branch"
))

# 751 "Vuna/Compiler/Wasm/Module.vuna"
let rec v_Vuna_dCompiler_dWasm_dModule_dgenDefFuncs = (fun mc0 mc1 mc2 -> (match mc2 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__325, dtb__326) -> (if (mc0 <= 0) then (Base_dResult.C_Base_dResult_dResult_Err ("wasm codegen fuel exhausted")) else (match (((v_Vuna_dCompiler_dWasm_dModule_dgenDefFunc mc0) mc1) dtb__325) with
  | Base_dResult.C_Base_dResult_dResult_Err (dtb__327) -> (Base_dResult.C_Base_dResult_dResult_Err (dtb__327))
  | Base_dResult.C_Base_dResult_dResult_Ok (dtb__328) -> (match (((v_Vuna_dCompiler_dWasm_dModule_dgenDefFuncs (mc0 - 1)) (Base_dPair.v_Base_dPair_dsecondOf dtb__328)) dtb__326) with
  | Base_dResult.C_Base_dResult_dResult_Err (dtb__329) -> (Base_dResult.C_Base_dResult_dResult_Err (dtb__329))
  | Base_dResult.C_Base_dResult_dResult_Ok (dtb__330) -> (Base_dResult.C_Base_dResult_dResult_Ok ({ Base_dPair.f_Base_dPair_dPair_first = ((Base_dList.v_Base_dList_dappend (Base_dPair.v_Base_dPair_dfirstOf dtb__328)) (Base_dPair.v_Base_dPair_dfirstOf dtb__330)); Base_dPair.f_Base_dPair_dPair_second = (Base_dPair.v_Base_dPair_dsecondOf dtb__330) }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dResult.C_Base_dResult_dResult_Ok ({ Base_dPair.f_Base_dPair_dPair_first = Base_dList.C_Base_dList_dList_Nil; Base_dPair.f_Base_dPair_dPair_second = mc1 }))
  | _ -> failwith "DT: impossible branch"
))

# 763 "Vuna/Compiler/Wasm/Module.vuna"
let v_Vuna_dCompiler_dWasm_dModule_dgenDefInit = (fun fuel st d -> (match d with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrDef_IrExternDef (dtb__331, dtb__332, dtb__333, dtb__334) -> (Base_dResult.C_Base_dResult_dResult_Err ("extern definition reached wasm codegen"))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrDef_IrDef (dtb__335, dtb__336, dtb__337, dtb__338, dtb__339, dtb__340, dtb__341) -> (if (dtb__336 <> 0) then (Base_dResult.C_Base_dResult_dResult_Ok ({ Base_dPair.f_Base_dPair_dPair_first = Base_dList.C_Base_dList_dList_Nil; Base_dPair.f_Base_dPair_dPair_second = st })) else ((fun st1 -> (match (((v_Vuna_dCompiler_dWasm_dModule_dgenExpr (fuel - 1)) st1) dtb__338) with
  | Base_dResult.C_Base_dResult_dResult_Err (dtb__342) -> (Base_dResult.C_Base_dResult_dResult_Err (dtb__342))
  | Base_dResult.C_Base_dResult_dResult_Ok (dtb__343) -> (Base_dResult.C_Base_dResult_dResult_Ok ({ Base_dPair.f_Base_dPair_dPair_first = ((Base_dList.v_Base_dList_dappend (Base_dPair.v_Base_dPair_dfirstOf dtb__343)) (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dWasm_dInstr.C_Vuna_dCompiler_dWasm_dInstr_dInstr_IGlobalSet ((Vuna_dCompiler_dWasm_dTypes.v_Vuna_dCompiler_dWasm_dTypes_dwatGlobalNameOf dtb__335))), Base_dList.C_Base_dList_dList_Nil))); Base_dPair.f_Base_dPair_dPair_second = (Base_dPair.v_Base_dPair_dsecondOf dtb__343) }))
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dWasm_dModule_drestoreScope Base_dList.C_Base_dList_dList_Nil) st)))
  | _ -> failwith "DT: impossible branch"
))

# 774 "Vuna/Compiler/Wasm/Module.vuna"
let rec v_Vuna_dCompiler_dWasm_dModule_dgenDefsInits = (fun mc0 mc1 mc2 -> (match mc2 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__344, dtb__345) -> (if (mc0 <= 0) then (Base_dResult.C_Base_dResult_dResult_Err ("wasm codegen fuel exhausted")) else (match (((v_Vuna_dCompiler_dWasm_dModule_dgenDefInit (mc0 - 1)) mc1) dtb__344) with
  | Base_dResult.C_Base_dResult_dResult_Err (dtb__346) -> (Base_dResult.C_Base_dResult_dResult_Err (dtb__346))
  | Base_dResult.C_Base_dResult_dResult_Ok (dtb__347) -> (match (((v_Vuna_dCompiler_dWasm_dModule_dgenDefsInits (mc0 - 1)) (Base_dPair.v_Base_dPair_dsecondOf dtb__347)) dtb__345) with
  | Base_dResult.C_Base_dResult_dResult_Err (dtb__348) -> (Base_dResult.C_Base_dResult_dResult_Err (dtb__348))
  | Base_dResult.C_Base_dResult_dResult_Ok (dtb__349) -> (Base_dResult.C_Base_dResult_dResult_Ok ({ Base_dPair.f_Base_dPair_dPair_first = ((Base_dList.v_Base_dList_dappend (Base_dPair.v_Base_dPair_dfirstOf dtb__347)) (Base_dPair.v_Base_dPair_dfirstOf dtb__349)); Base_dPair.f_Base_dPair_dPair_second = (Base_dPair.v_Base_dPair_dsecondOf dtb__349) }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dResult.C_Base_dResult_dResult_Ok ({ Base_dPair.f_Base_dPair_dPair_first = Base_dList.C_Base_dList_dList_Nil; Base_dPair.f_Base_dPair_dPair_second = mc1 }))
  | _ -> failwith "DT: impossible branch"
))

# 810 "Vuna/Compiler/Wasm/Module.vuna"
let rec v_Vuna_dCompiler_dWasm_dModule_dcollectNeeded = (fun mc0 mc1 mc2 mc3 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__350, dtb__351) -> (if (mc0 <= 0) then (Base_dList.v_Base_dList_dreverse mc2) else (if ((v_Vuna_dCompiler_dWasm_dModule_dmemStr dtb__350) mc2) then ((((v_Vuna_dCompiler_dWasm_dModule_dcollectNeeded (mc0 - 1)) dtb__351) mc2) mc3) else (match ((v_Vuna_dCompiler_dWasm_dModule_dfindDef dtb__350) mc3) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((((v_Vuna_dCompiler_dWasm_dModule_dcollectNeeded (mc0 - 1)) dtb__351) (Base_dList.C_Base_dList_dList_Cons (dtb__350, mc2))) mc3)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__352) -> ((((v_Vuna_dCompiler_dWasm_dModule_dcollectNeeded (mc0 - 1)) ((Base_dList.v_Base_dList_dappend dtb__351) (Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirDefDeps dtb__352))) (Base_dList.C_Base_dList_dList_Cons (dtb__350, mc2))) mc3)
  | _ -> failwith "DT: impossible branch"
)))
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dList.v_Base_dList_dreverse mc2)
  | _ -> failwith "DT: impossible branch"
))

# 792 "Vuna/Compiler/Wasm/Module.vuna"
let v_Vuna_dCompiler_dWasm_dModule_dgenStartBody = (fun fuel st entry printResult -> (if (fuel <= 0) then (Base_dResult.C_Base_dResult_dResult_Err ("wasm codegen fuel exhausted")) else (match entry with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (Base_dResult.C_Base_dResult_dResult_Ok ({ Base_dPair.f_Base_dPair_dPair_first = Base_dList.C_Base_dList_dList_Nil; Base_dPair.f_Base_dPair_dPair_second = st }))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__353) -> ((fun st1 -> ((fun needed -> ((fun ordered -> (match (((v_Vuna_dCompiler_dWasm_dModule_dgenDefsInits (fuel - 1)) st1) ordered) with
  | Base_dResult.C_Base_dResult_dResult_Err (dtb__354) -> (Base_dResult.C_Base_dResult_dResult_Err (dtb__354))
  | Base_dResult.C_Base_dResult_dResult_Ok (dtb__355) -> (if (Base_dBool.v_Base_dBool_dnot printResult) then (Base_dResult.C_Base_dResult_dResult_Ok (dtb__355)) else (match (v_Vuna_dCompiler_dWasm_dModule_dentryShowFunc (Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirEntryShowOf dtb__353)) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (Base_dResult.C_Base_dResult_dResult_Err ("wasm target: custom Show entry is not supported yet"))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__356) -> (Base_dResult.C_Base_dResult_dResult_Ok ({ Base_dPair.f_Base_dPair_dPair_first = ((Base_dList.v_Base_dList_dappend (Base_dPair.v_Base_dPair_dfirstOf dtb__355)) (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dWasm_dInstr.C_Vuna_dCompiler_dWasm_dInstr_dInstr_IGlobalGet ((Vuna_dCompiler_dWasm_dTypes.v_Vuna_dCompiler_dWasm_dTypes_dwatGlobalNameOf (Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirEntryMainOf dtb__353)))), (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dWasm_dInstr.C_Vuna_dCompiler_dWasm_dInstr_dInstr_ICall (dtb__356)), (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dWasm_dInstr.C_Vuna_dCompiler_dWasm_dInstr_dInstr_ICall ("$rt_println")), Base_dList.C_Base_dList_dList_Nil))))))); Base_dPair.f_Base_dPair_dPair_second = (Base_dPair.v_Base_dPair_dsecondOf dtb__355) }))
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
)) ((Base_dList.v_Base_dList_dfilter (fun d -> ((v_Vuna_dCompiler_dWasm_dModule_dmemStr (Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirDefName d)) needed))) (st1).f_Vuna_dCompiler_dWasm_dModule_dGenState_gsDefs))) ((((v_Vuna_dCompiler_dWasm_dModule_dcollectNeeded 100000) (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirEntryMainOf dtb__353), Base_dList.C_Base_dList_dList_Nil))) Base_dList.C_Base_dList_dList_Nil) (st1).f_Vuna_dCompiler_dWasm_dModule_dGenState_gsDefs))) (v_Vuna_dCompiler_dWasm_dModule_dbeginFuncScope st))
  | _ -> failwith "DT: impossible branch"
)))

# 825 "Vuna/Compiler/Wasm/Module.vuna"
let v_Vuna_dCompiler_dWasm_dModule_dbaseTypes = (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dWasm_dModel.C_Vuna_dCompiler_dWasm_dModel_dWatType_WatFuncType ("$ft", (Base_dList.C_Base_dList_dList_Cons (Vuna_dCompiler_dWasm_dModel.C_Vuna_dCompiler_dWasm_dModel_dWatValTy_WvAnyRef, (Base_dList.C_Base_dList_dList_Cons (Vuna_dCompiler_dWasm_dModel.C_Vuna_dCompiler_dWasm_dModel_dWatValTy_WvAnyRef, Base_dList.C_Base_dList_dList_Nil)))), (Base_dList.C_Base_dList_dList_Cons (Vuna_dCompiler_dWasm_dModel.C_Vuna_dCompiler_dWasm_dModel_dWatValTy_WvAnyRef, Base_dList.C_Base_dList_dList_Nil)))), (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dWasm_dModel.C_Vuna_dCompiler_dWasm_dModel_dWatType_WatStructType ("$clo", (Base_dList.C_Base_dList_dList_Cons ({ Vuna_dCompiler_dWasm_dModel.f_Vuna_dCompiler_dWasm_dModel_dWatField_watFieldMut = false; Vuna_dCompiler_dWasm_dModel.f_Vuna_dCompiler_dWasm_dModel_dWatField_watFieldTy = (Vuna_dCompiler_dWasm_dModel.C_Vuna_dCompiler_dWasm_dModel_dWatValTy_WvRef ("$ft")) }, (Base_dList.C_Base_dList_dList_Cons ({ Vuna_dCompiler_dWasm_dModel.f_Vuna_dCompiler_dWasm_dModel_dWatField_watFieldMut = false; Vuna_dCompiler_dWasm_dModel.f_Vuna_dCompiler_dWasm_dModel_dWatField_watFieldTy = Vuna_dCompiler_dWasm_dModel.C_Vuna_dCompiler_dWasm_dModel_dWatValTy_WvAnyRef }, Base_dList.C_Base_dList_dList_Nil)))))), (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dWasm_dModel.C_Vuna_dCompiler_dWasm_dModel_dWatType_WatArrayType ("$env", false, Vuna_dCompiler_dWasm_dModel.C_Vuna_dCompiler_dWasm_dModel_dWatValTy_WvAnyRef)), (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dWasm_dModel.C_Vuna_dCompiler_dWasm_dModel_dWatType_WatStructType ("$int", (Base_dList.C_Base_dList_dList_Cons ({ Vuna_dCompiler_dWasm_dModel.f_Vuna_dCompiler_dWasm_dModel_dWatField_watFieldMut = false; Vuna_dCompiler_dWasm_dModel.f_Vuna_dCompiler_dWasm_dModel_dWatField_watFieldTy = Vuna_dCompiler_dWasm_dModel.C_Vuna_dCompiler_dWasm_dModel_dWatValTy_WvI64 }, Base_dList.C_Base_dList_dList_Nil)))), (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dWasm_dModel.C_Vuna_dCompiler_dWasm_dModel_dWatType_WatStructType ("$float", (Base_dList.C_Base_dList_dList_Cons ({ Vuna_dCompiler_dWasm_dModel.f_Vuna_dCompiler_dWasm_dModel_dWatField_watFieldMut = false; Vuna_dCompiler_dWasm_dModel.f_Vuna_dCompiler_dWasm_dModel_dWatField_watFieldTy = Vuna_dCompiler_dWasm_dModel.C_Vuna_dCompiler_dWasm_dModel_dWatValTy_WvF64 }, Base_dList.C_Base_dList_dList_Nil)))), (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dWasm_dModel.C_Vuna_dCompiler_dWasm_dModel_dWatType_WatArrayType ("$str", true, Vuna_dCompiler_dWasm_dModel.C_Vuna_dCompiler_dWasm_dModel_dWatValTy_WvI8)), (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dWasm_dModel.C_Vuna_dCompiler_dWasm_dModel_dWatType_WatArrayType ("$arr", true, Vuna_dCompiler_dWasm_dModel.C_Vuna_dCompiler_dWasm_dModel_dWatValTy_WvAnyRef)), Base_dList.C_Base_dList_dList_Nil))))))))))))))

# 836 "Vuna/Compiler/Wasm/Module.vuna"
let v_Vuna_dCompiler_dWasm_dModule_dbaseImports = (Base_dList.C_Base_dList_dList_Cons ({ Vuna_dCompiler_dWasm_dModel.f_Vuna_dCompiler_dWasm_dModel_dWatImport_watImportModule = "wasi_snapshot_preview1"; Vuna_dCompiler_dWasm_dModel.f_Vuna_dCompiler_dWasm_dModel_dWatImport_watImportName = "fd_write"; Vuna_dCompiler_dWasm_dModel.f_Vuna_dCompiler_dWasm_dModel_dWatImport_watImportFunc = "$fd_write"; Vuna_dCompiler_dWasm_dModel.f_Vuna_dCompiler_dWasm_dModel_dWatImport_watImportParams = (Base_dList.C_Base_dList_dList_Cons (Vuna_dCompiler_dWasm_dModel.C_Vuna_dCompiler_dWasm_dModel_dWatValTy_WvI32, (Base_dList.C_Base_dList_dList_Cons (Vuna_dCompiler_dWasm_dModel.C_Vuna_dCompiler_dWasm_dModel_dWatValTy_WvI32, (Base_dList.C_Base_dList_dList_Cons (Vuna_dCompiler_dWasm_dModel.C_Vuna_dCompiler_dWasm_dModel_dWatValTy_WvI32, (Base_dList.C_Base_dList_dList_Cons (Vuna_dCompiler_dWasm_dModel.C_Vuna_dCompiler_dWasm_dModel_dWatValTy_WvI32, Base_dList.C_Base_dList_dList_Nil)))))))); Vuna_dCompiler_dWasm_dModel.f_Vuna_dCompiler_dWasm_dModel_dWatImport_watImportResults = (Base_dList.C_Base_dList_dList_Cons (Vuna_dCompiler_dWasm_dModel.C_Vuna_dCompiler_dWasm_dModel_dWatValTy_WvI32, Base_dList.C_Base_dList_dList_Nil)) }, (Base_dList.C_Base_dList_dList_Cons ({ Vuna_dCompiler_dWasm_dModel.f_Vuna_dCompiler_dWasm_dModel_dWatImport_watImportModule = "wasi_snapshot_preview1"; Vuna_dCompiler_dWasm_dModel.f_Vuna_dCompiler_dWasm_dModel_dWatImport_watImportName = "proc_exit"; Vuna_dCompiler_dWasm_dModel.f_Vuna_dCompiler_dWasm_dModel_dWatImport_watImportFunc = "$proc_exit"; Vuna_dCompiler_dWasm_dModel.f_Vuna_dCompiler_dWasm_dModel_dWatImport_watImportParams = (Base_dList.C_Base_dList_dList_Cons (Vuna_dCompiler_dWasm_dModel.C_Vuna_dCompiler_dWasm_dModel_dWatValTy_WvI32, Base_dList.C_Base_dList_dList_Nil)); Vuna_dCompiler_dWasm_dModel.f_Vuna_dCompiler_dWasm_dModel_dWatImport_watImportResults = Base_dList.C_Base_dList_dList_Nil }, Base_dList.C_Base_dList_dList_Nil))))

# 846 "Vuna/Compiler/Wasm/Module.vuna"
let v_Vuna_dCompiler_dWasm_dModule_dglobalOfDef = (fun d -> (if ((Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirDefArity d) = 0) then (Base_dList.C_Base_dList_dList_Cons ({ Vuna_dCompiler_dWasm_dModel.f_Vuna_dCompiler_dWasm_dModel_dWatGlobal_watGlobalName = (Vuna_dCompiler_dWasm_dTypes.v_Vuna_dCompiler_dWasm_dTypes_dwatGlobalNameOf (Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirDefName d)); Vuna_dCompiler_dWasm_dModel.f_Vuna_dCompiler_dWasm_dModel_dWatGlobal_watGlobalTy = Vuna_dCompiler_dWasm_dModel.C_Vuna_dCompiler_dWasm_dModel_dWatValTy_WvAnyRef; Vuna_dCompiler_dWasm_dModel.f_Vuna_dCompiler_dWasm_dModel_dWatGlobal_watGlobalInit = (Base_dList.C_Base_dList_dList_Cons (Vuna_dCompiler_dWasm_dInstr.C_Vuna_dCompiler_dWasm_dInstr_dInstr_IRefNull, Base_dList.C_Base_dList_dList_Nil)) }, Base_dList.C_Base_dList_dList_Nil)) else Base_dList.C_Base_dList_dList_Nil))

# 843 "Vuna/Compiler/Wasm/Module.vuna"
let v_Vuna_dCompiler_dWasm_dModule_dglobalsOf = (fun defs -> ((Base_dList.v_Base_dList_dconcatMap v_Vuna_dCompiler_dWasm_dModule_dglobalOfDef) defs))

# 850 "Vuna/Compiler/Wasm/Module.vuna"
let rec v_Vuna_dCompiler_dWasm_dModule_dconcatMapType = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__357, dtb__358) -> (match (Vuna_dCompiler_dWasm_dTypes.v_Vuna_dCompiler_dWasm_dTypes_dwasmFamType dtb__357) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (v_Vuna_dCompiler_dWasm_dModule_dconcatMapType dtb__358)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__359) -> (Base_dList.C_Base_dList_dList_Cons (dtb__359, (v_Vuna_dCompiler_dWasm_dModule_dconcatMapType dtb__358)))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 910 "Vuna/Compiler/Wasm/Module.vuna"
let v_Vuna_dCompiler_dWasm_dModule_dclassifyWasmErr = (fun msg -> (if ((Base_dString.v_Base_dString_dstartsWith "wasm target:") msg) then (Vuna_dCompiler_dWasm_dModel.C_Vuna_dCompiler_dWasm_dModel_dWasmErr_WasmUnsupported (msg)) else (Vuna_dCompiler_dWasm_dModel.C_Vuna_dCompiler_dWasm_dModel_dWasmErr_WasmInternal (msg))))

# 914 "Vuna/Compiler/Wasm/Module.vuna"
let rec v_Vuna_dCompiler_dWasm_dModule_dfoldlStrings = (fun mc0 mc1 mc2 -> (match mc2 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__360, dtb__361) -> (((v_Vuna_dCompiler_dWasm_dModule_dfoldlStrings mc0) ((mc0 mc1) dtb__360)) dtb__361)
  | Base_dList.C_Base_dList_dList_Nil -> mc1
  | _ -> failwith "DT: impossible branch"
))

# 918 "Vuna/Compiler/Wasm/Module.vuna"
let v_Vuna_dCompiler_dWasm_dModule_dmkConsts = (fun offsets -> ((fun offOf -> ((fun lenOf -> { Vuna_dCompiler_dWasm_dRuntime.f_Vuna_dCompiler_dWasm_dRuntime_dRtConsts_rtcTrueOff = (offOf "True"); Vuna_dCompiler_dWasm_dRuntime.f_Vuna_dCompiler_dWasm_dRuntime_dRtConsts_rtcTrueLen = (lenOf "True"); Vuna_dCompiler_dWasm_dRuntime.f_Vuna_dCompiler_dWasm_dRuntime_dRtConsts_rtcFalseOff = (offOf "False"); Vuna_dCompiler_dWasm_dRuntime.f_Vuna_dCompiler_dWasm_dRuntime_dRtConsts_rtcFalseLen = (lenOf "False"); Vuna_dCompiler_dWasm_dRuntime.f_Vuna_dCompiler_dWasm_dRuntime_dRtConsts_rtcTodoOff = (offOf "TODO: "); Vuna_dCompiler_dWasm_dRuntime.f_Vuna_dCompiler_dWasm_dRuntime_dRtConsts_rtcTodoLen = (lenOf "TODO: "); Vuna_dCompiler_dWasm_dRuntime.f_Vuna_dCompiler_dWasm_dRuntime_dRtConsts_rtcDivOff = (offOf "division by zero"); Vuna_dCompiler_dWasm_dRuntime.f_Vuna_dCompiler_dWasm_dRuntime_dRtConsts_rtcDivLen = (lenOf "division by zero"); Vuna_dCompiler_dWasm_dRuntime.f_Vuna_dCompiler_dWasm_dRuntime_dRtConsts_rtcErrOff = (offOf "vuna: runtime error: "); Vuna_dCompiler_dWasm_dRuntime.f_Vuna_dCompiler_dWasm_dRuntime_dRtConsts_rtcErrLen = (lenOf "vuna: runtime error: "); Vuna_dCompiler_dWasm_dRuntime.f_Vuna_dCompiler_dWasm_dRuntime_dRtConsts_rtcAssertOff = (offOf "assertion failed: "); Vuna_dCompiler_dWasm_dRuntime.f_Vuna_dCompiler_dWasm_dRuntime_dRtConsts_rtcAssertLen = (lenOf "assertion failed: ") }) (fun mc0 -> (match ((v_Vuna_dCompiler_dWasm_dModule_dpoolLookup mc0) offsets) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__362) -> (Base_dPair.v_Base_dPair_dsecondOf dtb__362)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> 0
  | _ -> failwith "DT: impossible branch"
)))) (fun mc0 -> (match ((v_Vuna_dCompiler_dWasm_dModule_dpoolLookup mc0) offsets) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__363) -> (Base_dPair.v_Base_dPair_dfirstOf dtb__363)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> 0
  | _ -> failwith "DT: impossible branch"
))))

# 934 "Vuna/Compiler/Wasm/Module.vuna"
let v_Vuna_dCompiler_dWasm_dModule_djoinWith = (fun sep xs -> ((Base_dString.v_Base_dString_djoin sep) xs))

# 192 "Vuna/Compiler/Wasm/Module.vuna"
let v_Vuna_dCompiler_dWasm_dModule_dpoolBytes = (fun pool -> ((v_Vuna_dCompiler_dWasm_dModule_djoinWith "") ((Base_dList.v_Base_dList_dmap (fun p -> (Base_dPair.v_Base_dPair_dfirstOf p))) pool)))

# 856 "Vuna/Compiler/Wasm/Module.vuna"
let v_Vuna_dCompiler_dWasm_dModule_dbuildModule = (fun fuel st ordered entry printResult listFamM -> (match (((v_Vuna_dCompiler_dWasm_dModule_dgenDefFuncs fuel) st) ordered) with
  | Base_dResult.C_Base_dResult_dResult_Err (dtb__364) -> (Base_dResult.C_Base_dResult_dResult_Err (dtb__364))
  | Base_dResult.C_Base_dResult_dResult_Ok (dtb__365) -> ((fun userFuncs -> ((fun stFuncs -> (match ((((v_Vuna_dCompiler_dWasm_dModule_dgenStartBody (fuel - 1)) stFuncs) entry) printResult) with
  | Base_dResult.C_Base_dResult_dResult_Err (dtb__366) -> (Base_dResult.C_Base_dResult_dResult_Err (dtb__366))
  | Base_dResult.C_Base_dResult_dResult_Ok (dtb__367) -> ((fun startState -> ((fun startFunc -> ((fun funcs -> ((fun famTypes -> ((fun allTypes -> ((fun globals -> ((fun dataText -> ((fun dataM -> (Base_dResult.C_Base_dResult_dResult_Ok ({ Vuna_dCompiler_dWasm_dModel.f_Vuna_dCompiler_dWasm_dModel_dWasmModule_wmTypes = allTypes; Vuna_dCompiler_dWasm_dModel.f_Vuna_dCompiler_dWasm_dModel_dWasmModule_wmImports = v_Vuna_dCompiler_dWasm_dModule_dbaseImports; Vuna_dCompiler_dWasm_dModel.f_Vuna_dCompiler_dWasm_dModel_dWasmModule_wmGlobals = globals; Vuna_dCompiler_dWasm_dModel.f_Vuna_dCompiler_dWasm_dModel_dWasmModule_wmFuncs = funcs; Vuna_dCompiler_dWasm_dModel.f_Vuna_dCompiler_dWasm_dModel_dWasmModule_wmElems = Base_dList.C_Base_dList_dList_Nil; Vuna_dCompiler_dWasm_dModel.f_Vuna_dCompiler_dWasm_dModel_dWasmModule_wmData = dataM; Vuna_dCompiler_dWasm_dModel.f_Vuna_dCompiler_dWasm_dModel_dWasmModule_wmExports = (Base_dList.C_Base_dList_dList_Cons ({ Vuna_dCompiler_dWasm_dModel.f_Vuna_dCompiler_dWasm_dModel_dWatExport_watExportKind = "func"; Vuna_dCompiler_dWasm_dModel.f_Vuna_dCompiler_dWasm_dModel_dWatExport_watExportName = "_start"; Vuna_dCompiler_dWasm_dModel.f_Vuna_dCompiler_dWasm_dModel_dWatExport_watExportRef = "$_start" }, Base_dList.C_Base_dList_dList_Nil)); Vuna_dCompiler_dWasm_dModel.f_Vuna_dCompiler_dWasm_dModel_dWasmModule_wmMemPages = 4 }))) (if ((bi_strLength dataText) = 0) then Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing else (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Vuna_dCompiler_dWasm_dModel.f_Vuna_dCompiler_dWasm_dModel_dWatData_watDataName = "$d0"; Vuna_dCompiler_dWasm_dModel.f_Vuna_dCompiler_dWasm_dModel_dWatData_watDataBytes = dataText }))))) (v_Vuna_dCompiler_dWasm_dModule_dpoolBytes (st).f_Vuna_dCompiler_dWasm_dModule_dGenState_gsPool))) (v_Vuna_dCompiler_dWasm_dModule_dglobalsOf ordered))) ((Base_dList.v_Base_dList_dappend v_Vuna_dCompiler_dWasm_dModule_dbaseTypes) famTypes))) (v_Vuna_dCompiler_dWasm_dModule_dconcatMapType (st).f_Vuna_dCompiler_dWasm_dModule_dGenState_gsFams))) ((Base_dList.v_Base_dList_dappend (Vuna_dCompiler_dWasm_dRuntime.v_Vuna_dCompiler_dWasm_dRuntime_drtFunctions (st).f_Vuna_dCompiler_dWasm_dModule_dGenState_gsConsts)) ((Base_dList.v_Base_dList_dappend (v_Vuna_dCompiler_dWasm_dModule_dwasmBridgeFuncs listFamM)) ((Base_dList.v_Base_dList_dappend userFuncs) (Base_dList.C_Base_dList_dList_Cons (startFunc, Base_dList.C_Base_dList_dList_Nil))))))) { Vuna_dCompiler_dWasm_dModel.f_Vuna_dCompiler_dWasm_dModel_dWatFunc_watFuncName = "$_start"; Vuna_dCompiler_dWasm_dModel.f_Vuna_dCompiler_dWasm_dModel_dWatFunc_watFuncType = ""; Vuna_dCompiler_dWasm_dModel.f_Vuna_dCompiler_dWasm_dModel_dWatFunc_watFuncParams = Base_dList.C_Base_dList_dList_Nil; Vuna_dCompiler_dWasm_dModel.f_Vuna_dCompiler_dWasm_dModel_dWatFunc_watFuncResults = Base_dList.C_Base_dList_dList_Nil; Vuna_dCompiler_dWasm_dModel.f_Vuna_dCompiler_dWasm_dModel_dWatFunc_watFuncLocals = (startState).f_Vuna_dCompiler_dWasm_dModule_dGenState_gsLocals; Vuna_dCompiler_dWasm_dModel.f_Vuna_dCompiler_dWasm_dModel_dWatFunc_watFuncBody = (Base_dPair.v_Base_dPair_dfirstOf dtb__367) })) (Base_dPair.v_Base_dPair_dsecondOf dtb__367))
  | _ -> failwith "DT: impossible branch"
)) (Base_dPair.v_Base_dPair_dsecondOf dtb__365))) (Base_dPair.v_Base_dPair_dfirstOf dtb__365))
  | _ -> failwith "DT: impossible branch"
))

# 883 "Vuna/Compiler/Wasm/Module.vuna"
let v_Vuna_dCompiler_dWasm_dModule_dbuild = (fun program printResult -> ((fun unit -> ((fun defs -> ((fun entry -> ((fun fams -> ((fun statics -> ((fun users -> ((fun pool -> ((fun offsets -> ((fun consts -> ((fun st0 -> (match entry with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (C_Vuna_dCompiler_dWasm_dModule_dWasmOutcome_WasmRejected ((Vuna_dCompiler_dWasm_dModel.C_Vuna_dCompiler_dWasm_dModel_dWasmErr_WasmUnsupported ("wasm target: no main definition"))))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__368) -> (if (Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirEntryIsActionOf dtb__368) then (C_Vuna_dCompiler_dWasm_dModule_dWasmOutcome_WasmRejected ((Vuna_dCompiler_dWasm_dModel.C_Vuna_dCompiler_dWasm_dModel_dWasmErr_WasmUnsupported ("wasm target: effectful main is not supported yet")))) else ((fun needed -> ((fun ordered -> ((fun listFamM -> (match ((((((v_Vuna_dCompiler_dWasm_dModule_dbuildModule 100000) st0) ordered) (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__368))) printResult) listFamM) with
  | Base_dResult.C_Base_dResult_dResult_Ok (dtb__369) -> (C_Vuna_dCompiler_dWasm_dModule_dWasmOutcome_WasmOk (dtb__369))
  | Base_dResult.C_Base_dResult_dResult_Err (dtb__370) -> (C_Vuna_dCompiler_dWasm_dModule_dWasmOutcome_WasmRejected ((v_Vuna_dCompiler_dWasm_dModule_dclassifyWasmErr dtb__370)))
  | _ -> failwith "DT: impossible branch"
)) ((Vuna_dCompiler_dWasm_dTypes.v_Vuna_dCompiler_dWasm_dTypes_dwasmListFamFromFams ((Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirProgSharedOf program)).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrShared_irSharedListFam) fams))) ((Base_dList.v_Base_dList_dfilter (fun d -> ((v_Vuna_dCompiler_dWasm_dModule_dmemStr (Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirDefName d)) needed))) defs))) ((((v_Vuna_dCompiler_dWasm_dModule_dcollectNeeded 100000) (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirEntryMainOf dtb__368), Base_dList.C_Base_dList_dList_Nil))) Base_dList.C_Base_dList_dList_Nil) defs)))
  | _ -> failwith "DT: impossible branch"
)) { f_Vuna_dCompiler_dWasm_dModule_dGenState_gsFams = fams; f_Vuna_dCompiler_dWasm_dModule_dGenState_gsDefs = defs; f_Vuna_dCompiler_dWasm_dModule_dGenState_gsPool = offsets; f_Vuna_dCompiler_dWasm_dModule_dGenState_gsFuncs = Base_dList.C_Base_dList_dList_Nil; f_Vuna_dCompiler_dWasm_dModule_dGenState_gsLocals = Base_dList.C_Base_dList_dList_Nil; f_Vuna_dCompiler_dWasm_dModule_dGenState_gsNextLocal = 0; f_Vuna_dCompiler_dWasm_dModule_dGenState_gsScope = Base_dList.C_Base_dList_dList_Nil; f_Vuna_dCompiler_dWasm_dModule_dGenState_gsConsts = consts })) (v_Vuna_dCompiler_dWasm_dModule_dmkConsts offsets))) ((v_Vuna_dCompiler_dWasm_dModule_dpoolOffsets pool) 0))) (((v_Vuna_dCompiler_dWasm_dModule_dfoldlStrings (fun acc s -> ((v_Vuna_dCompiler_dWasm_dModule_daddString s) acc))) statics) users))) ((Base_dList.v_Base_dList_dconcatMap v_Vuna_dCompiler_dWasm_dModule_dstrLitsDef) defs))) (Base_dList.C_Base_dList_dList_Cons ("True", (Base_dList.C_Base_dList_dList_Cons ("False", (Base_dList.C_Base_dList_dList_Cons ("TODO: ", (Base_dList.C_Base_dList_dList_Cons ("division by zero", (Base_dList.C_Base_dList_dList_Cons ("vuna: runtime error: ", (Base_dList.C_Base_dList_dList_Cons ("assertion failed: ", Base_dList.C_Base_dList_dList_Nil)))))))))))))) (Vuna_dCompiler_dWasm_dTypes.v_Vuna_dCompiler_dWasm_dTypes_dwasmFamsOf (unit).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrUnit_irUnitTyDecls))) (unit).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrUnit_irUnitEntry)) ((Base_dList.v_Base_dList_dconcatMap Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirGroupDefs) (unit).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrUnit_irUnitGroups))) (Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirProgUnitOf program)))
