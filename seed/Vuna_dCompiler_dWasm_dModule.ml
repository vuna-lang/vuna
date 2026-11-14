open Vuna_runtime
type t_Vuna_dCompiler_dWasm_dModule_dWasmOutcome = C_Vuna_dCompiler_dWasm_dModule_dWasmOutcome_WasmOk of (Vuna_dCompiler_dWasm_dModel.t_Vuna_dCompiler_dWasm_dModel_dWasmModule) | C_Vuna_dCompiler_dWasm_dModule_dWasmOutcome_WasmRejected of (Vuna_dCompiler_dWasm_dModel.t_Vuna_dCompiler_dWasm_dModel_dWasmErr)
and t_Vuna_dCompiler_dWasm_dModule_dGenState = { f_Vuna_dCompiler_dWasm_dModule_dGenState_gsFams : Vuna_dCompiler_dWasm_dTypes.t_Vuna_dCompiler_dWasm_dTypes_dWasmFam Base_dList.t_Base_dList_dList; f_Vuna_dCompiler_dWasm_dModule_dGenState_gsDefs : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrDef Base_dList.t_Base_dList_dList; f_Vuna_dCompiler_dWasm_dModule_dGenState_gsPool : (string, (int, int) Base_dPair.t_Base_dPair_dPair) Base_dPair.t_Base_dPair_dPair Base_dList.t_Base_dList_dList; f_Vuna_dCompiler_dWasm_dModule_dGenState_gsFuncs : Vuna_dCompiler_dWasm_dModel.t_Vuna_dCompiler_dWasm_dModel_dWatFunc Base_dList.t_Base_dList_dList; f_Vuna_dCompiler_dWasm_dModule_dGenState_gsLocals : (string, Vuna_dCompiler_dWasm_dModel.t_Vuna_dCompiler_dWasm_dModel_dWatValTy) Base_dPair.t_Base_dPair_dPair Base_dList.t_Base_dList_dList; f_Vuna_dCompiler_dWasm_dModule_dGenState_gsNextLocal : int; f_Vuna_dCompiler_dWasm_dModule_dGenState_gsScope : (Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrBinder, string) Base_dPair.t_Base_dPair_dPair Base_dList.t_Base_dList_dList; f_Vuna_dCompiler_dWasm_dModule_dGenState_gsConsts : Vuna_dCompiler_dWasm_dRuntime.t_Vuna_dCompiler_dWasm_dRuntime_dRtConsts }

# 38 "Vuna/Compiler/Wasm/Module.vuna"
let v_Vuna_dCompiler_dWasm_dModule_dbinderNameOf = (fun mc0 -> (match mc0 with
  | { Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrBinder_irBinderName = dtb__0; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrBinder_irBinderErased = dtb__1 } -> dtb__0
  | _ -> failwith "DT: impossible branch"
))

# 41 "Vuna/Compiler/Wasm/Module.vuna"
let v_Vuna_dCompiler_dWasm_dModule_dbinderErasedOf = (fun mc0 -> (match mc0 with
  | { Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrBinder_irBinderName = dtb__2; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrBinder_irBinderErased = dtb__3 } -> dtb__3
  | _ -> failwith "DT: impossible branch"
))

# 44 "Vuna/Compiler/Wasm/Module.vuna"
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

# 59 "Vuna/Compiler/Wasm/Module.vuna"
let v_Vuna_dCompiler_dWasm_dModule_dbinderEq = (fun a b -> (if ((v_Vuna_dCompiler_dWasm_dModule_dbNameEq (v_Vuna_dCompiler_dWasm_dModule_dbinderNameOf a)) (v_Vuna_dCompiler_dWasm_dModule_dbinderNameOf b)) then (((Base_dEq.v_Base_dEq_deq Base_dEq.v_Eq_uBase_uBool_uBool) (v_Vuna_dCompiler_dWasm_dModule_dbinderErasedOf a)) (v_Vuna_dCompiler_dWasm_dModule_dbinderErasedOf b)) else false))

# 62 "Vuna/Compiler/Wasm/Module.vuna"
let rec v_Vuna_dCompiler_dWasm_dModule_dlookupBinder = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__10, dtb__11) -> (if ((v_Vuna_dCompiler_dWasm_dModule_dbinderEq mc0) (Base_dPair.v_Base_dPair_dfirstOf dtb__10)) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((Base_dPair.v_Base_dPair_dsecondOf dtb__10))) else ((v_Vuna_dCompiler_dWasm_dModule_dlookupBinder mc0) dtb__11))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 67 "Vuna/Compiler/Wasm/Module.vuna"
let v_Vuna_dCompiler_dWasm_dModule_dfreshLocal = (fun st ty -> ((fun name -> ((fun st1 -> { Base_dPair.f_Base_dPair_dPair_first = name; Base_dPair.f_Base_dPair_dPair_second = st1 }) { st with f_Vuna_dCompiler_dWasm_dModule_dGenState_gsLocals = ((Base_dList.v_Base_dList_dappend (st).f_Vuna_dCompiler_dWasm_dModule_dGenState_gsLocals) (Base_dList.C_Base_dList_dList_Cons ({ Base_dPair.f_Base_dPair_dPair_first = name; Base_dPair.f_Base_dPair_dPair_second = ty }, Base_dList.C_Base_dList_dList_Nil))); f_Vuna_dCompiler_dWasm_dModule_dGenState_gsNextLocal = ((st).f_Vuna_dCompiler_dWasm_dModule_dGenState_gsNextLocal + 1) })) ("$l" ^ (bi_strFromInt (st).f_Vuna_dCompiler_dWasm_dModule_dGenState_gsNextLocal))))

# 74 "Vuna/Compiler/Wasm/Module.vuna"
let v_Vuna_dCompiler_dWasm_dModule_dpushBinder = (fun b l st -> { st with f_Vuna_dCompiler_dWasm_dModule_dGenState_gsScope = (Base_dList.C_Base_dList_dList_Cons ({ Base_dPair.f_Base_dPair_dPair_first = b; Base_dPair.f_Base_dPair_dPair_second = l }, (st).f_Vuna_dCompiler_dWasm_dModule_dGenState_gsScope)) })

# 78 "Vuna/Compiler/Wasm/Module.vuna"
let v_Vuna_dCompiler_dWasm_dModule_drestoreScope = (fun scope st -> { st with f_Vuna_dCompiler_dWasm_dModule_dGenState_gsScope = scope })

# 82 "Vuna/Compiler/Wasm/Module.vuna"
let v_Vuna_dCompiler_dWasm_dModule_druntimeBinders = (fun bs -> ((Base_dList.v_Base_dList_dfilter (fun b -> (Base_dBool.v_Base_dBool_dnot (v_Vuna_dCompiler_dWasm_dModule_dbinderErasedOf b)))) bs))

# 86 "Vuna/Compiler/Wasm/Module.vuna"
let v_Vuna_dCompiler_dWasm_dModule_dbeginFuncScope = (fun st -> ((fun st1 -> { st1 with f_Vuna_dCompiler_dWasm_dModule_dGenState_gsNextLocal = 0; f_Vuna_dCompiler_dWasm_dModule_dGenState_gsScope = Base_dList.C_Base_dList_dList_Nil }) { st with f_Vuna_dCompiler_dWasm_dModule_dGenState_gsLocals = Base_dList.C_Base_dList_dList_Nil }))

# 93 "Vuna/Compiler/Wasm/Module.vuna"
let v_Vuna_dCompiler_dWasm_dModule_dendFuncScope = (fun st locals next scope -> ((fun st1 -> { st1 with f_Vuna_dCompiler_dWasm_dModule_dGenState_gsNextLocal = next; f_Vuna_dCompiler_dWasm_dModule_dGenState_gsScope = scope }) { st with f_Vuna_dCompiler_dWasm_dModule_dGenState_gsLocals = locals }))

# 101 "Vuna/Compiler/Wasm/Module.vuna"
let v_Vuna_dCompiler_dWasm_dModule_dmergeArmState = (fun a b -> (if ((b).f_Vuna_dCompiler_dWasm_dModule_dGenState_gsNextLocal > (a).f_Vuna_dCompiler_dWasm_dModule_dGenState_gsNextLocal) then b else a))

# 104 "Vuna/Compiler/Wasm/Module.vuna"
let rec v_Vuna_dCompiler_dWasm_dModule_dzipIdx = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__12, dtb__13) -> (Base_dList.C_Base_dList_dList_Cons ({ Base_dPair.f_Base_dPair_dPair_first = dtb__12; Base_dPair.f_Base_dPair_dPair_second = ("$p" ^ (bi_strFromInt mc0)) }, ((v_Vuna_dCompiler_dWasm_dModule_dzipIdx (mc0 + 1)) dtb__13)))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 108 "Vuna/Compiler/Wasm/Module.vuna"
let v_Vuna_dCompiler_dWasm_dModule_dfuncParams = (fun n -> ((Base_dList.v_Base_dList_dmap (fun i -> { Base_dPair.f_Base_dPair_dPair_first = ("$p" ^ (bi_strFromInt i)); Base_dPair.f_Base_dPair_dPair_second = Vuna_dCompiler_dWasm_dModel.C_Vuna_dCompiler_dWasm_dModel_dWatValTy_WvAnyRef })) ((Base_dList.v_Base_dList_drange 0) n)))

# 114 "Vuna/Compiler/Wasm/Module.vuna"
let rec v_Vuna_dCompiler_dWasm_dModule_dmemStr = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__14, dtb__15) -> (if (mc0 = dtb__14) then true else ((v_Vuna_dCompiler_dWasm_dModule_dmemStr mc0) dtb__15))
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 118 "Vuna/Compiler/Wasm/Module.vuna"
let v_Vuna_dCompiler_dWasm_dModule_daddString = (fun s pool -> (if ((v_Vuna_dCompiler_dWasm_dModule_dmemStr s) pool) then pool else ((Base_dList.v_Base_dList_dappend pool) (Base_dList.C_Base_dList_dList_Cons (s, Base_dList.C_Base_dList_dList_Nil)))))

# 121 "Vuna/Compiler/Wasm/Module.vuna"
let rec v_Vuna_dCompiler_dWasm_dModule_dstrLitsAltFuel = (fun fuel alts -> (if (fuel <= 0) then Base_dList.C_Base_dList_dList_Nil else (match alts with
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | Base_dList.C_Base_dList_dList_Cons (dtb__16, dtb__17) -> ((Base_dList.v_Base_dList_dappend ((v_Vuna_dCompiler_dWasm_dModule_dstrLitsOfFuel (fuel - 1)) (Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirAltBodyOf dtb__16))) ((v_Vuna_dCompiler_dWasm_dModule_dstrLitsAltFuel (fuel - 1)) dtb__17))
  | _ -> failwith "DT: impossible branch"
)))
# 127 "Vuna/Compiler/Wasm/Module.vuna"
and v_Vuna_dCompiler_dWasm_dModule_dstrLitsAltMaybeFuel = (fun fuel ms -> (if (fuel <= 0) then Base_dList.C_Base_dList_dList_Nil else ((fun nd_uscrut2 -> (match nd_uscrut2 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__18, dtb__19) -> (match dtb__18 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__20) -> ((Base_dList.v_Base_dList_dappend ((v_Vuna_dCompiler_dWasm_dModule_dstrLitsOfFuel (fuel - 1)) (Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirAltBodyOf dtb__20))) ((v_Vuna_dCompiler_dWasm_dModule_dstrLitsAltMaybeFuel (fuel - 1)) dtb__19))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((v_Vuna_dCompiler_dWasm_dModule_dstrLitsAltMaybeFuel (fuel - 1)) dtb__19)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
)) ms)))
# 135 "Vuna/Compiler/Wasm/Module.vuna"
and v_Vuna_dCompiler_dWasm_dModule_dstrLitsFieldsFuel = (fun fuel fs -> (if (fuel <= 0) then Base_dList.C_Base_dList_dList_Nil else (match fs with
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | Base_dList.C_Base_dList_dList_Cons (dtb__21, dtb__22) -> ((Base_dList.v_Base_dList_dappend ((v_Vuna_dCompiler_dWasm_dModule_dstrLitsOfFuel (fuel - 1)) (Base_dPair.v_Base_dPair_dsecondOf dtb__21))) ((v_Vuna_dCompiler_dWasm_dModule_dstrLitsFieldsFuel (fuel - 1)) dtb__22))
  | _ -> failwith "DT: impossible branch"
)))
# 141 "Vuna/Compiler/Wasm/Module.vuna"
and v_Vuna_dCompiler_dWasm_dModule_dstrLitsArgsFuel = (fun fuel args -> (if (fuel <= 0) then Base_dList.C_Base_dList_dList_Nil else (match args with
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | Base_dList.C_Base_dList_dList_Cons (dtb__23, dtb__24) -> ((Base_dList.v_Base_dList_dappend ((v_Vuna_dCompiler_dWasm_dModule_dstrLitsOfFuel (fuel - 1)) dtb__23)) ((v_Vuna_dCompiler_dWasm_dModule_dstrLitsArgsFuel (fuel - 1)) dtb__24))
  | _ -> failwith "DT: impossible branch"
)))
# 147 "Vuna/Compiler/Wasm/Module.vuna"
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

# 176 "Vuna/Compiler/Wasm/Module.vuna"
let v_Vuna_dCompiler_dWasm_dModule_dstrLitsDef = (fun d -> (match d with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrDef_IrDef (dtb__72, dtb__73, dtb__74, dtb__75, dtb__76, dtb__77, dtb__78) -> ((v_Vuna_dCompiler_dWasm_dModule_dstrLitsOfFuel 100000) dtb__75)
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrDef_IrExternDef (dtb__79, dtb__80, dtb__81, dtb__82) -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 181 "Vuna/Compiler/Wasm/Module.vuna"
let rec v_Vuna_dCompiler_dWasm_dModule_dpoolOffsets = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__83, dtb__84) -> (Base_dList.C_Base_dList_dList_Cons ({ Base_dPair.f_Base_dPair_dPair_first = dtb__83; Base_dPair.f_Base_dPair_dPair_second = { Base_dPair.f_Base_dPair_dPair_first = mc1; Base_dPair.f_Base_dPair_dPair_second = (bi_strLength dtb__83) } }, ((v_Vuna_dCompiler_dWasm_dModule_dpoolOffsets dtb__84) (mc1 + (bi_strLength dtb__83)))))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 186 "Vuna/Compiler/Wasm/Module.vuna"
let rec v_Vuna_dCompiler_dWasm_dModule_dpoolLookup = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__85, dtb__86) -> (if ((Base_dPair.v_Base_dPair_dfirstOf dtb__85) = mc0) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((Base_dPair.v_Base_dPair_dsecondOf dtb__85))) else ((v_Vuna_dCompiler_dWasm_dModule_dpoolLookup mc0) dtb__86))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 196 "Vuna/Compiler/Wasm/Module.vuna"
let v_Vuna_dCompiler_dWasm_dModule_dboolI31 = (fun b -> (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dWasm_dInstr.C_Vuna_dCompiler_dWasm_dInstr_dInstr_IConstI32 ((if b then 1 else 0))), (Base_dList.C_Base_dList_dList_Cons (Vuna_dCompiler_dWasm_dInstr.C_Vuna_dCompiler_dWasm_dInstr_dInstr_II31New, Base_dList.C_Base_dList_dList_Nil)))))

# 199 "Vuna/Compiler/Wasm/Module.vuna"
let v_Vuna_dCompiler_dWasm_dModule_demptyStr = (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dWasm_dInstr.C_Vuna_dCompiler_dWasm_dInstr_dInstr_IConstI32 (0)), (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dWasm_dInstr.C_Vuna_dCompiler_dWasm_dInstr_dInstr_IArrayNewDefault ("$str")), Base_dList.C_Base_dList_dList_Nil))))

# 228 "Vuna/Compiler/Wasm/Module.vuna"
let v_Vuna_dCompiler_dWasm_dModule_dgenVar = (fun st b -> (match ((v_Vuna_dCompiler_dWasm_dModule_dlookupBinder b) (st).f_Vuna_dCompiler_dWasm_dModule_dGenState_gsScope) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__87) -> (Base_dResult.C_Base_dResult_dResult_Ok ({ Base_dPair.f_Base_dPair_dPair_first = (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dWasm_dInstr.C_Vuna_dCompiler_dWasm_dInstr_dInstr_ILocalGet (dtb__87)), Base_dList.C_Base_dList_dList_Nil)); Base_dPair.f_Base_dPair_dPair_second = st }))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (Base_dResult.C_Base_dResult_dResult_Err ("unbound runtime binder in wasm codegen"))
  | _ -> failwith "DT: impossible branch"
))

# 241 "Vuna/Compiler/Wasm/Module.vuna"
let v_Vuna_dCompiler_dWasm_dModule_dgenStr = (fun st s -> (if ((bi_strLength s) = 0) then (Base_dResult.C_Base_dResult_dResult_Ok ({ Base_dPair.f_Base_dPair_dPair_first = v_Vuna_dCompiler_dWasm_dModule_demptyStr; Base_dPair.f_Base_dPair_dPair_second = st })) else (match ((v_Vuna_dCompiler_dWasm_dModule_dpoolLookup s) (st).f_Vuna_dCompiler_dWasm_dModule_dGenState_gsPool) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (Base_dResult.C_Base_dResult_dResult_Err ("string literal missing from wasm data pool"))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__88) -> (Base_dResult.C_Base_dResult_dResult_Ok ({ Base_dPair.f_Base_dPair_dPair_first = (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dWasm_dInstr.C_Vuna_dCompiler_dWasm_dInstr_dInstr_IConstI32 ((Base_dPair.v_Base_dPair_dfirstOf dtb__88))), (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dWasm_dInstr.C_Vuna_dCompiler_dWasm_dInstr_dInstr_IConstI32 ((Base_dPair.v_Base_dPair_dsecondOf dtb__88))), (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dWasm_dInstr.C_Vuna_dCompiler_dWasm_dInstr_dInstr_IArrayNewData ("$str", "$d0")), Base_dList.C_Base_dList_dList_Nil)))))); Base_dPair.f_Base_dPair_dPair_second = st }))
  | _ -> failwith "DT: impossible branch"
)))

# 288 "Vuna/Compiler/Wasm/Module.vuna"
let rec v_Vuna_dCompiler_dWasm_dModule_dlistLengthB = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__89, dtb__90) -> (1 + (v_Vuna_dCompiler_dWasm_dModule_dlistLengthB dtb__90))
  | Base_dList.C_Base_dList_dList_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))

# 295 "Vuna/Compiler/Wasm/Module.vuna"
let rec v_Vuna_dCompiler_dWasm_dModule_dflattenApp = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (dtb__91, dtb__92) -> ((fun p -> { Base_dPair.f_Base_dPair_dPair_first = (Base_dPair.v_Base_dPair_dfirstOf p); Base_dPair.f_Base_dPair_dPair_second = ((Base_dList.v_Base_dList_dappend (Base_dPair.v_Base_dPair_dsecondOf p)) (Base_dList.C_Base_dList_dList_Cons (dtb__92, Base_dList.C_Base_dList_dList_Nil))) }) (v_Vuna_dCompiler_dWasm_dModule_dflattenApp dtb__91))
  | _ -> { Base_dPair.f_Base_dPair_dPair_first = mc0; Base_dPair.f_Base_dPair_dPair_second = Base_dList.C_Base_dList_dList_Nil }
))

# 363 "Vuna/Compiler/Wasm/Module.vuna"
let v_Vuna_dCompiler_dWasm_dModule_dunboxLocalInt = (fun l -> (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dWasm_dInstr.C_Vuna_dCompiler_dWasm_dInstr_dInstr_ILocalGet (l)), (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dWasm_dInstr.C_Vuna_dCompiler_dWasm_dInstr_dInstr_IRefCast ("$int")), (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dWasm_dInstr.C_Vuna_dCompiler_dWasm_dInstr_dInstr_IStructGet ("$int", 0)), Base_dList.C_Base_dList_dList_Nil)))))))

# 366 "Vuna/Compiler/Wasm/Module.vuna"
let v_Vuna_dCompiler_dWasm_dModule_dboxInstr = (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dWasm_dInstr.C_Vuna_dCompiler_dWasm_dInstr_dInstr_IStructNew ("$int")), Base_dList.C_Base_dList_dList_Nil))

# 510 "Vuna/Compiler/Wasm/Module.vuna"
let v_Vuna_dCompiler_dWasm_dModule_dentryShowFunc = (fun ir -> (match ir with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRt (dtb__93) -> (if (dtb__93 = "@ir@showInt") then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ("$rt_strFromInt")) else (if (dtb__93 = "@ir@showNat") then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ("$rt_strFromInt")) else (if (dtb__93 = "@ir@showBool") then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ("$rt_showBool")) else (if (dtb__93 = "@ir@showStr") then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ("$rt_showStr")) else Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing))))
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
))

# 545 "Vuna/Compiler/Wasm/Module.vuna"
let rec v_Vuna_dCompiler_dWasm_dModule_dfindDef = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__94, dtb__95) -> (if ((Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirDefName dtb__94) = mc0) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__94)) else ((v_Vuna_dCompiler_dWasm_dModule_dfindDef mc0) dtb__95))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 234 "Vuna/Compiler/Wasm/Module.vuna"
let v_Vuna_dCompiler_dWasm_dModule_dgenGlobalRef = (fun st name -> (match ((v_Vuna_dCompiler_dWasm_dModule_dfindDef name) (st).f_Vuna_dCompiler_dWasm_dModule_dGenState_gsDefs) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__96) -> (if ((Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirDefArity dtb__96) = 0) then (Base_dResult.C_Base_dResult_dResult_Ok ({ Base_dPair.f_Base_dPair_dPair_first = (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dWasm_dInstr.C_Vuna_dCompiler_dWasm_dInstr_dInstr_IGlobalGet ((Vuna_dCompiler_dWasm_dTypes.v_Vuna_dCompiler_dWasm_dTypes_dwatGlobalNameOf name))), Base_dList.C_Base_dList_dList_Nil)); Base_dPair.f_Base_dPair_dPair_second = st })) else (Base_dResult.C_Base_dResult_dResult_Err ((String.concat "" ["wasm target: function values are not supported yet (referenced `"; name; "`)"]))))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (Base_dResult.C_Base_dResult_dResult_Err ((String.concat "" ["unknown top-level definition in wasm codegen: `"; name; "`"])))
  | _ -> failwith "DT: impossible branch"
))

# 202 "Vuna/Compiler/Wasm/Module.vuna"
let rec v_Vuna_dCompiler_dWasm_dModule_dgenExpr = (fun fuel st ir -> (if (fuel <= 0) then (Base_dResult.C_Base_dResult_dResult_Err ("wasm codegen fuel exhausted")) else (match ir with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrVar (dtb__97) -> ((v_Vuna_dCompiler_dWasm_dModule_dgenVar st) dtb__97)
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrGlobal (dtb__98) -> ((v_Vuna_dCompiler_dWasm_dModule_dgenGlobalRef st) dtb__98)
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrInt (dtb__99) -> (Base_dResult.C_Base_dResult_dResult_Ok ({ Base_dPair.f_Base_dPair_dPair_first = (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dWasm_dInstr.C_Vuna_dCompiler_dWasm_dInstr_dInstr_IConstI64 (dtb__99)), (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dWasm_dInstr.C_Vuna_dCompiler_dWasm_dInstr_dInstr_IStructNew ("$int")), Base_dList.C_Base_dList_dList_Nil)))); Base_dPair.f_Base_dPair_dPair_second = st }))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrBool (dtb__100) -> (Base_dResult.C_Base_dResult_dResult_Ok ({ Base_dPair.f_Base_dPair_dPair_first = (v_Vuna_dCompiler_dWasm_dModule_dboolI31 dtb__100); Base_dPair.f_Base_dPair_dPair_second = st }))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrStr (dtb__101) -> ((v_Vuna_dCompiler_dWasm_dModule_dgenStr st) dtb__101)
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCast (dtb__102) -> (((v_Vuna_dCompiler_dWasm_dModule_dgenExpr (fuel - 1)) st) dtb__102)
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLet (dtb__103, dtb__104, dtb__105) -> (((((v_Vuna_dCompiler_dWasm_dModule_dgenLet (fuel - 1)) st) dtb__103) dtb__104) dtb__105)
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrIf (dtb__106, dtb__107, dtb__108) -> (((((v_Vuna_dCompiler_dWasm_dModule_dgenIf (fuel - 1)) st) dtb__106) dtb__107) dtb__108)
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRtApp (dtb__109, dtb__110) -> ((((v_Vuna_dCompiler_dWasm_dModule_dgenRtApp (fuel - 1)) st) dtb__109) dtb__110)
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (dtb__111, dtb__112) -> (((v_Vuna_dCompiler_dWasm_dModule_dgenApp (fuel - 1)) st) ir)
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrNatCase (dtb__113, dtb__114, dtb__115, dtb__116, dtb__117) -> ((((((v_Vuna_dCompiler_dWasm_dModule_dgenNatCase (fuel - 1)) st) dtb__113) dtb__115) dtb__116) dtb__117)
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrConcatMany (dtb__118) -> (((v_Vuna_dCompiler_dWasm_dModule_dgenConcatMany (fuel - 1)) st) dtb__118)
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLam (dtb__119, dtb__120) -> (Base_dResult.C_Base_dResult_dResult_Err ("wasm target: lambda values are not supported yet"))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCase (dtb__121, dtb__122) -> (Base_dResult.C_Base_dResult_dResult_Err ("wasm target: case is not supported yet"))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCtor (dtb__123, dtb__124, dtb__125) -> (Base_dResult.C_Base_dResult_dResult_Err ("wasm target: data constructors are not supported yet"))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRecord (dtb__126, dtb__127) -> (Base_dResult.C_Base_dResult_dResult_Err ("wasm target: records are not supported yet"))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrProj (dtb__128, dtb__129, dtb__130) -> (Base_dResult.C_Base_dResult_dResult_Err ("wasm target: record projection is not supported yet"))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRecUpd (dtb__131, dtb__132, dtb__133) -> (Base_dResult.C_Base_dResult_dResult_Err ("wasm target: record update is not supported yet"))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrEffThunk (dtb__134, dtb__135, dtb__136, dtb__137, dtb__138) -> (Base_dResult.C_Base_dResult_dResult_Err ("wasm target: effect thunks are not supported yet"))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrEffBind (dtb__139, dtb__140, dtb__141) -> (Base_dResult.C_Base_dResult_dResult_Err ("wasm target: effect bindings are not supported yet"))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrFloatLit (dtb__142) -> (Base_dResult.C_Base_dResult_dResult_Err ("wasm target: float literals are not supported yet"))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRt (dtb__143) -> (Base_dResult.C_Base_dResult_dResult_Err ("wasm target: runtime function values are not supported yet"))
  | _ -> failwith "DT: impossible branch"
)))
# 247 "Vuna/Compiler/Wasm/Module.vuna"
and v_Vuna_dCompiler_dWasm_dModule_dgenIf = (fun fuel st c th el -> (if (fuel <= 0) then (Base_dResult.C_Base_dResult_dResult_Err ("wasm codegen fuel exhausted")) else (match (((v_Vuna_dCompiler_dWasm_dModule_dgenExpr (fuel - 1)) st) c) with
  | Base_dResult.C_Base_dResult_dResult_Err (dtb__144) -> (Base_dResult.C_Base_dResult_dResult_Err (dtb__144))
  | Base_dResult.C_Base_dResult_dResult_Ok (dtb__145) -> (match (((v_Vuna_dCompiler_dWasm_dModule_dgenExpr (fuel - 1)) (Base_dPair.v_Base_dPair_dsecondOf dtb__145)) th) with
  | Base_dResult.C_Base_dResult_dResult_Err (dtb__146) -> (Base_dResult.C_Base_dResult_dResult_Err (dtb__146))
  | Base_dResult.C_Base_dResult_dResult_Ok (dtb__147) -> (match (((v_Vuna_dCompiler_dWasm_dModule_dgenExpr (fuel - 1)) (Base_dPair.v_Base_dPair_dsecondOf dtb__145)) el) with
  | Base_dResult.C_Base_dResult_dResult_Err (dtb__148) -> (Base_dResult.C_Base_dResult_dResult_Err (dtb__148))
  | Base_dResult.C_Base_dResult_dResult_Ok (dtb__149) -> ((fun merged -> (Base_dResult.C_Base_dResult_dResult_Ok ({ Base_dPair.f_Base_dPair_dPair_first = ((Base_dList.v_Base_dList_dappend (Base_dPair.v_Base_dPair_dfirstOf dtb__145)) (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dWasm_dInstr.C_Vuna_dCompiler_dWasm_dInstr_dInstr_IRefCast ("i31")), (Base_dList.C_Base_dList_dList_Cons (Vuna_dCompiler_dWasm_dInstr.C_Vuna_dCompiler_dWasm_dInstr_dInstr_II31GetU, (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dWasm_dInstr.C_Vuna_dCompiler_dWasm_dInstr_dInstr_IIf ("anyref", (Base_dPair.v_Base_dPair_dfirstOf dtb__147), (Base_dPair.v_Base_dPair_dfirstOf dtb__149))), Base_dList.C_Base_dList_dList_Nil))))))); Base_dPair.f_Base_dPair_dPair_second = merged }))) ((v_Vuna_dCompiler_dWasm_dModule_dmergeArmState (Base_dPair.v_Base_dPair_dsecondOf dtb__147)) (Base_dPair.v_Base_dPair_dsecondOf dtb__149)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))
# 262 "Vuna/Compiler/Wasm/Module.vuna"
and v_Vuna_dCompiler_dWasm_dModule_dgenLet = (fun fuel st bs scrut body -> (if (fuel <= 0) then (Base_dResult.C_Base_dResult_dResult_Err ("wasm codegen fuel exhausted")) else ((fun runtimeBs -> ((fun savedScope -> (match (((v_Vuna_dCompiler_dWasm_dModule_dgenExpr (fuel - 1)) st) scrut) with
  | Base_dResult.C_Base_dResult_dResult_Err (dtb__150) -> (Base_dResult.C_Base_dResult_dResult_Err (dtb__150))
  | Base_dResult.C_Base_dResult_dResult_Ok (dtb__151) -> ((((((v_Vuna_dCompiler_dWasm_dModule_dgenLetBound (fuel - 1)) (Base_dPair.v_Base_dPair_dsecondOf dtb__151)) runtimeBs) (Base_dPair.v_Base_dPair_dfirstOf dtb__151)) body) savedScope)
  | _ -> failwith "DT: impossible branch"
)) (st).f_Vuna_dCompiler_dWasm_dModule_dGenState_gsScope)) (v_Vuna_dCompiler_dWasm_dModule_druntimeBinders bs))))
# 272 "Vuna/Compiler/Wasm/Module.vuna"
and v_Vuna_dCompiler_dWasm_dModule_dgenLetBound = (fun mc0 mc1 mc2 mc3 mc4 mc5 -> (match mc2 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__152, dtb__153) -> (if (mc0 <= 0) then (Base_dResult.C_Base_dResult_dResult_Err ("wasm codegen fuel exhausted")) else (if ((v_Vuna_dCompiler_dWasm_dModule_dlistLengthB dtb__153) <> 0) then (Base_dResult.C_Base_dResult_dResult_Err ("unboxed let has more than one runtime binder")) else (match ((v_Vuna_dCompiler_dWasm_dModule_dfreshLocal mc1) Vuna_dCompiler_dWasm_dModel.C_Vuna_dCompiler_dWasm_dModel_dWatValTy_WvAnyRef) with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__154; Base_dPair.f_Base_dPair_dPair_second = dtb__155 } -> (match (((v_Vuna_dCompiler_dWasm_dModule_dgenExpr (mc0 - 1)) (((v_Vuna_dCompiler_dWasm_dModule_dpushBinder dtb__152) dtb__154) dtb__155)) mc4) with
  | Base_dResult.C_Base_dResult_dResult_Err (dtb__156) -> (Base_dResult.C_Base_dResult_dResult_Err (dtb__156))
  | Base_dResult.C_Base_dResult_dResult_Ok (dtb__157) -> (Base_dResult.C_Base_dResult_dResult_Ok ({ Base_dPair.f_Base_dPair_dPair_first = ((Base_dList.v_Base_dList_dappend mc3) ((Base_dList.v_Base_dList_dappend (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dWasm_dInstr.C_Vuna_dCompiler_dWasm_dInstr_dInstr_ILocalSet (dtb__154)), Base_dList.C_Base_dList_dList_Nil))) (Base_dPair.v_Base_dPair_dfirstOf dtb__157))); Base_dPair.f_Base_dPair_dPair_second = ((v_Vuna_dCompiler_dWasm_dModule_drestoreScope mc5) (Base_dPair.v_Base_dPair_dsecondOf dtb__157)) }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))
  | Base_dList.C_Base_dList_dList_Nil -> (if (mc0 <= 0) then (Base_dResult.C_Base_dResult_dResult_Err ("wasm codegen fuel exhausted")) else (match (((v_Vuna_dCompiler_dWasm_dModule_dgenExpr (mc0 - 1)) mc1) mc4) with
  | Base_dResult.C_Base_dResult_dResult_Err (dtb__158) -> (Base_dResult.C_Base_dResult_dResult_Err (dtb__158))
  | Base_dResult.C_Base_dResult_dResult_Ok (dtb__159) -> (Base_dResult.C_Base_dResult_dResult_Ok ({ Base_dPair.f_Base_dPair_dPair_first = ((Base_dList.v_Base_dList_dappend mc3) ((Base_dList.v_Base_dList_dappend (Base_dList.C_Base_dList_dList_Cons (Vuna_dCompiler_dWasm_dInstr.C_Vuna_dCompiler_dWasm_dInstr_dInstr_IDrop, Base_dList.C_Base_dList_dList_Nil))) (Base_dPair.v_Base_dPair_dfirstOf dtb__159))); Base_dPair.f_Base_dPair_dPair_second = ((v_Vuna_dCompiler_dWasm_dModule_drestoreScope mc5) (Base_dPair.v_Base_dPair_dsecondOf dtb__159)) }))
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
))
# 302 "Vuna/Compiler/Wasm/Module.vuna"
and v_Vuna_dCompiler_dWasm_dModule_dgenApp = (fun fuel st ir -> (if (fuel <= 0) then (Base_dResult.C_Base_dResult_dResult_Err ("wasm codegen fuel exhausted")) else (match (v_Vuna_dCompiler_dWasm_dModule_dflattenApp ir) with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__160; Base_dPair.f_Base_dPair_dPair_second = dtb__161 } -> (match dtb__160 with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrGlobal (dtb__162) -> ((((v_Vuna_dCompiler_dWasm_dModule_dgenGlobalCall (fuel - 1)) st) dtb__162) dtb__161)
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLam (dtb__163, dtb__164) -> (((((v_Vuna_dCompiler_dWasm_dModule_dgenLamApp (fuel - 1)) st) dtb__163) dtb__164) dtb__161)
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRt (dtb__165) -> ((((v_Vuna_dCompiler_dWasm_dModule_dgenRtApp (fuel - 1)) st) dtb__165) dtb__161)
  | _ -> (Base_dResult.C_Base_dResult_dResult_Err ("wasm target: higher-order application is not supported yet"))
)
  | _ -> failwith "DT: impossible branch"
)))
# 311 "Vuna/Compiler/Wasm/Module.vuna"
and v_Vuna_dCompiler_dWasm_dModule_dgenGlobalCall = (fun fuel st name args -> (if (fuel <= 0) then (Base_dResult.C_Base_dResult_dResult_Err ("wasm codegen fuel exhausted")) else (match ((v_Vuna_dCompiler_dWasm_dModule_dfindDef name) (st).f_Vuna_dCompiler_dWasm_dModule_dGenState_gsDefs) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (Base_dResult.C_Base_dResult_dResult_Err ((String.concat "" ["unknown top-level definition in wasm codegen: `"; name; "`"])))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__166) -> (if ((Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirDefArity dtb__166) <> (v_Vuna_dCompiler_dWasm_dModule_dlistLengthB args)) then (Base_dResult.C_Base_dResult_dResult_Err ((String.concat "" ["wasm target: call to `"; name; "` is not saturated"]))) else ((((v_Vuna_dCompiler_dWasm_dModule_dgenArgsThen (fuel - 1)) st) args) (Vuna_dCompiler_dWasm_dInstr.C_Vuna_dCompiler_dWasm_dInstr_dInstr_ICall ((Vuna_dCompiler_dWasm_dTypes.v_Vuna_dCompiler_dWasm_dTypes_dwatFuncNameOf name)))))
  | _ -> failwith "DT: impossible branch"
)))
# 320 "Vuna/Compiler/Wasm/Module.vuna"
and v_Vuna_dCompiler_dWasm_dModule_dgenLamApp = (fun fuel st bs body args -> (if (fuel <= 0) then (Base_dResult.C_Base_dResult_dResult_Err ("wasm codegen fuel exhausted")) else ((fun rbs -> ((fun savedScope -> (if ((v_Vuna_dCompiler_dWasm_dModule_dlistLengthB rbs) <> 1) then (Base_dResult.C_Base_dResult_dResult_Err ("wasm target: only single-binder lambdas are supported yet")) else (if ((v_Vuna_dCompiler_dWasm_dModule_dlistLengthB args) <> 1) then (Base_dResult.C_Base_dResult_dResult_Err ("wasm target: only saturated single-argument lambda application is supported yet")) else ((fun nd_uscrut7 -> (match nd_uscrut7 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__167, dtb__168) -> (match dtb__168 with
  | Base_dList.C_Base_dList_dList_Nil -> (match (((v_Vuna_dCompiler_dWasm_dModule_dgenExpr (fuel - 1)) st) dtb__167) with
  | Base_dResult.C_Base_dResult_dResult_Err (dtb__169) -> (Base_dResult.C_Base_dResult_dResult_Err (dtb__169))
  | Base_dResult.C_Base_dResult_dResult_Ok (dtb__170) -> ((fun nd_uscrut14 -> (match nd_uscrut14 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__171, dtb__172) -> (match dtb__172 with
  | Base_dList.C_Base_dList_dList_Nil -> (match ((v_Vuna_dCompiler_dWasm_dModule_dfreshLocal (Base_dPair.v_Base_dPair_dsecondOf dtb__170)) Vuna_dCompiler_dWasm_dModel.C_Vuna_dCompiler_dWasm_dModel_dWatValTy_WvAnyRef) with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__173; Base_dPair.f_Base_dPair_dPair_second = dtb__174 } -> (match (((v_Vuna_dCompiler_dWasm_dModule_dgenExpr (fuel - 1)) (((v_Vuna_dCompiler_dWasm_dModule_dpushBinder dtb__171) dtb__173) dtb__174)) body) with
  | Base_dResult.C_Base_dResult_dResult_Err (dtb__175) -> (Base_dResult.C_Base_dResult_dResult_Err (dtb__175))
  | Base_dResult.C_Base_dResult_dResult_Ok (dtb__176) -> (Base_dResult.C_Base_dResult_dResult_Ok ({ Base_dPair.f_Base_dPair_dPair_first = ((Base_dList.v_Base_dList_dappend (Base_dPair.v_Base_dPair_dfirstOf dtb__170)) ((Base_dList.v_Base_dList_dappend (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dWasm_dInstr.C_Vuna_dCompiler_dWasm_dInstr_dInstr_ILocalSet (dtb__173)), Base_dList.C_Base_dList_dList_Nil))) (Base_dPair.v_Base_dPair_dfirstOf dtb__176))); Base_dPair.f_Base_dPair_dPair_second = ((v_Vuna_dCompiler_dWasm_dModule_drestoreScope savedScope) (Base_dPair.v_Base_dPair_dsecondOf dtb__176)) }))
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
# 342 "Vuna/Compiler/Wasm/Module.vuna"
and v_Vuna_dCompiler_dWasm_dModule_dgenArgsThen = (fun mc0 mc1 mc2 mc3 -> (match mc2 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__177, dtb__178) -> (if (mc0 <= 0) then (Base_dResult.C_Base_dResult_dResult_Err ("wasm codegen fuel exhausted")) else (match (((v_Vuna_dCompiler_dWasm_dModule_dgenExpr (mc0 - 1)) mc1) dtb__177) with
  | Base_dResult.C_Base_dResult_dResult_Err (dtb__179) -> (Base_dResult.C_Base_dResult_dResult_Err (dtb__179))
  | Base_dResult.C_Base_dResult_dResult_Ok (dtb__180) -> (match ((((v_Vuna_dCompiler_dWasm_dModule_dgenArgsThen (mc0 - 1)) (Base_dPair.v_Base_dPair_dsecondOf dtb__180)) dtb__178) mc3) with
  | Base_dResult.C_Base_dResult_dResult_Err (dtb__181) -> (Base_dResult.C_Base_dResult_dResult_Err (dtb__181))
  | Base_dResult.C_Base_dResult_dResult_Ok (dtb__182) -> (Base_dResult.C_Base_dResult_dResult_Ok ({ Base_dPair.f_Base_dPair_dPair_first = ((Base_dList.v_Base_dList_dappend (Base_dPair.v_Base_dPair_dfirstOf dtb__180)) (Base_dPair.v_Base_dPair_dfirstOf dtb__182)); Base_dPair.f_Base_dPair_dPair_second = (Base_dPair.v_Base_dPair_dsecondOf dtb__182) }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dResult.C_Base_dResult_dResult_Ok ({ Base_dPair.f_Base_dPair_dPair_first = (Base_dList.C_Base_dList_dList_Cons (mc3, Base_dList.C_Base_dList_dList_Nil)); Base_dPair.f_Base_dPair_dPair_second = mc1 }))
  | _ -> failwith "DT: impossible branch"
))
# 351 "Vuna/Compiler/Wasm/Module.vuna"
and v_Vuna_dCompiler_dWasm_dModule_dgenRtApp = (fun fuel st sym args -> (if (fuel <= 0) then (Base_dResult.C_Base_dResult_dResult_Err ("wasm codegen fuel exhausted")) else (match (Vuna_dCompiler_dWasm_dRuntime.v_Vuna_dCompiler_dWasm_dRuntime_drtImplOf sym) with
  | Vuna_dCompiler_dWasm_dRuntime.C_Vuna_dCompiler_dWasm_dRuntime_dRtImpl_RtUnsupported -> (Base_dResult.C_Base_dResult_dResult_Err ((String.concat "" ["wasm target: runtime symbol `"; sym; "` is not supported yet"])))
  | Vuna_dCompiler_dWasm_dRuntime.C_Vuna_dCompiler_dWasm_dRuntime_dRtImpl_RtValue (dtb__183) -> (Base_dResult.C_Base_dResult_dResult_Ok ({ Base_dPair.f_Base_dPair_dPair_first = dtb__183; Base_dPair.f_Base_dPair_dPair_second = st }))
  | Vuna_dCompiler_dWasm_dRuntime.C_Vuna_dCompiler_dWasm_dRuntime_dRtImpl_RtFunc (dtb__184, dtb__185) -> (if (dtb__184 <> (v_Vuna_dCompiler_dWasm_dModule_dlistLengthB args)) then (Base_dResult.C_Base_dResult_dResult_Err ((String.concat "" ["wasm target: runtime symbol `"; sym; "` applied to the wrong number of arguments"]))) else ((((v_Vuna_dCompiler_dWasm_dModule_dgenArgsThen (fuel - 1)) st) args) (Vuna_dCompiler_dWasm_dInstr.C_Vuna_dCompiler_dWasm_dInstr_dInstr_ICall (dtb__185))))
  | _ -> failwith "DT: impossible branch"
)))
# 371 "Vuna/Compiler/Wasm/Module.vuna"
and v_Vuna_dCompiler_dWasm_dModule_dgenNatArm = (fun fuel st alt valueInstrs -> (if (fuel <= 0) then (Base_dResult.C_Base_dResult_dResult_Err ("wasm codegen fuel exhausted")) else (match alt with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (Base_dResult.C_Base_dResult_dResult_Err ("wasm target: Nat case has no zero/succ/catch branch"))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__186) -> ((((v_Vuna_dCompiler_dWasm_dModule_dgenNatArmAlt fuel) st) dtb__186) valueInstrs)
  | _ -> failwith "DT: impossible branch"
)))
# 377 "Vuna/Compiler/Wasm/Module.vuna"
and v_Vuna_dCompiler_dWasm_dModule_dgenNatArmAlt = (fun fuel st a valueInstrs -> (if (fuel <= 0) then (Base_dResult.C_Base_dResult_dResult_Err ("wasm codegen fuel exhausted")) else ((fun bs -> ((fun savedScope -> ((fun nd_uscrut6 -> (match nd_uscrut6 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__187, dtb__188) -> (match dtb__188 with
  | Base_dList.C_Base_dList_dList_Nil -> (match ((v_Vuna_dCompiler_dWasm_dModule_dfreshLocal st) Vuna_dCompiler_dWasm_dModel.C_Vuna_dCompiler_dWasm_dModel_dWatValTy_WvAnyRef) with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__189; Base_dPair.f_Base_dPair_dPair_second = dtb__190 } -> (match (((v_Vuna_dCompiler_dWasm_dModule_dgenExpr (fuel - 1)) (((v_Vuna_dCompiler_dWasm_dModule_dpushBinder dtb__187) dtb__189) dtb__190)) (Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirAltBodyOf a)) with
  | Base_dResult.C_Base_dResult_dResult_Err (dtb__191) -> (Base_dResult.C_Base_dResult_dResult_Err (dtb__191))
  | Base_dResult.C_Base_dResult_dResult_Ok (dtb__192) -> (Base_dResult.C_Base_dResult_dResult_Ok ({ Base_dPair.f_Base_dPair_dPair_first = ((Base_dList.v_Base_dList_dappend valueInstrs) ((Base_dList.v_Base_dList_dappend (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dWasm_dInstr.C_Vuna_dCompiler_dWasm_dInstr_dInstr_ILocalSet (dtb__189)), Base_dList.C_Base_dList_dList_Nil))) (Base_dPair.v_Base_dPair_dfirstOf dtb__192))); Base_dPair.f_Base_dPair_dPair_second = ((v_Vuna_dCompiler_dWasm_dModule_drestoreScope savedScope) (Base_dPair.v_Base_dPair_dsecondOf dtb__192)) }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> (Base_dResult.C_Base_dResult_dResult_Err ("wasm target: Nat case arm has more than one runtime binder"))
)
  | Base_dList.C_Base_dList_dList_Nil -> (((v_Vuna_dCompiler_dWasm_dModule_dgenExpr (fuel - 1)) st) (Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirAltBodyOf a))
  | _ -> failwith "DT: impossible branch"
)) bs)) (st).f_Vuna_dCompiler_dWasm_dModule_dGenState_gsScope)) (v_Vuna_dCompiler_dWasm_dModule_druntimeBinders (Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirAltBindersOf a)))))
# 393 "Vuna/Compiler/Wasm/Module.vuna"
and v_Vuna_dCompiler_dWasm_dModule_dgenNatCase = (fun fuel st scrut zero succ catch -> (if (fuel <= 0) then (Base_dResult.C_Base_dResult_dResult_Err ("wasm codegen fuel exhausted")) else (match (((v_Vuna_dCompiler_dWasm_dModule_dgenExpr (fuel - 1)) st) scrut) with
  | Base_dResult.C_Base_dResult_dResult_Err (dtb__193) -> (Base_dResult.C_Base_dResult_dResult_Err (dtb__193))
  | Base_dResult.C_Base_dResult_dResult_Ok (dtb__194) -> (match ((v_Vuna_dCompiler_dWasm_dModule_dfreshLocal (Base_dPair.v_Base_dPair_dsecondOf dtb__194)) Vuna_dCompiler_dWasm_dModel.C_Vuna_dCompiler_dWasm_dModel_dWatValTy_WvAnyRef) with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__195; Base_dPair.f_Base_dPair_dPair_second = dtb__196 } -> ((fun zeroAlt -> ((fun succAlt -> ((fun zeroValue -> ((fun succValue -> ((fun succBoxed -> (match ((((v_Vuna_dCompiler_dWasm_dModule_dgenNatArm (fuel - 1)) dtb__196) zeroAlt) zeroValue) with
  | Base_dResult.C_Base_dResult_dResult_Err (dtb__197) -> (Base_dResult.C_Base_dResult_dResult_Err (dtb__197))
  | Base_dResult.C_Base_dResult_dResult_Ok (dtb__198) -> (match ((((v_Vuna_dCompiler_dWasm_dModule_dgenNatArm (fuel - 1)) dtb__196) succAlt) succBoxed) with
  | Base_dResult.C_Base_dResult_dResult_Err (dtb__199) -> (Base_dResult.C_Base_dResult_dResult_Err (dtb__199))
  | Base_dResult.C_Base_dResult_dResult_Ok (dtb__200) -> ((fun merged -> ((fun cond -> (Base_dResult.C_Base_dResult_dResult_Ok ({ Base_dPair.f_Base_dPair_dPair_first = ((Base_dList.v_Base_dList_dappend (Base_dPair.v_Base_dPair_dfirstOf dtb__194)) ((Base_dList.v_Base_dList_dappend (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dWasm_dInstr.C_Vuna_dCompiler_dWasm_dInstr_dInstr_ILocalSet (dtb__195)), Base_dList.C_Base_dList_dList_Nil))) ((Base_dList.v_Base_dList_dappend cond) (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dWasm_dInstr.C_Vuna_dCompiler_dWasm_dInstr_dInstr_IIf ("anyref", (Base_dPair.v_Base_dPair_dfirstOf dtb__198), (Base_dPair.v_Base_dPair_dfirstOf dtb__200))), Base_dList.C_Base_dList_dList_Nil))))); Base_dPair.f_Base_dPair_dPair_second = merged }))) ((Base_dList.v_Base_dList_dappend (v_Vuna_dCompiler_dWasm_dModule_dunboxLocalInt dtb__195)) (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dWasm_dInstr.C_Vuna_dCompiler_dWasm_dInstr_dInstr_IConstI64 (0)), (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dWasm_dInstr.C_Vuna_dCompiler_dWasm_dInstr_dInstr_IBinop ("i64.eq")), Base_dList.C_Base_dList_dList_Nil))))))) ((v_Vuna_dCompiler_dWasm_dModule_dmergeArmState (Base_dPair.v_Base_dPair_dsecondOf dtb__198)) (Base_dPair.v_Base_dPair_dsecondOf dtb__200)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) ((Base_dList.v_Base_dList_dappend succValue) v_Vuna_dCompiler_dWasm_dModule_dboxInstr))) ((Base_dList.v_Base_dList_dappend (v_Vuna_dCompiler_dWasm_dModule_dunboxLocalInt dtb__195)) (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dWasm_dInstr.C_Vuna_dCompiler_dWasm_dInstr_dInstr_IConstI64 (1)), (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dWasm_dInstr.C_Vuna_dCompiler_dWasm_dInstr_dInstr_IBinop ("i64.sub")), Base_dList.C_Base_dList_dList_Nil))))))) (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dWasm_dInstr.C_Vuna_dCompiler_dWasm_dInstr_dInstr_ILocalGet (dtb__195)), Base_dList.C_Base_dList_dList_Nil)))) (match succ with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__201) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__201))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> catch
  | _ -> failwith "DT: impossible branch"
))) (match zero with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__202) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__202))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> catch
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))
# 420 "Vuna/Compiler/Wasm/Module.vuna"
and v_Vuna_dCompiler_dWasm_dModule_dgenConcatMany = (fun fuel st parts -> (if (fuel <= 0) then (Base_dResult.C_Base_dResult_dResult_Err ("wasm codegen fuel exhausted")) else ((fun nd_uscrut3 -> (match nd_uscrut3 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__203, dtb__204) -> (match dtb__204 with
  | Base_dList.C_Base_dList_dList_Nil -> (((v_Vuna_dCompiler_dWasm_dModule_dgenExpr (fuel - 1)) st) dtb__203)
  | _ -> (match (((v_Vuna_dCompiler_dWasm_dModule_dgenExpr (fuel - 1)) st) dtb__203) with
  | Base_dResult.C_Base_dResult_dResult_Err (dtb__205) -> (Base_dResult.C_Base_dResult_dResult_Err (dtb__205))
  | Base_dResult.C_Base_dResult_dResult_Ok (dtb__206) -> (match (((v_Vuna_dCompiler_dWasm_dModule_dgenConcatRest (fuel - 1)) (Base_dPair.v_Base_dPair_dsecondOf dtb__206)) dtb__204) with
  | Base_dResult.C_Base_dResult_dResult_Err (dtb__207) -> (Base_dResult.C_Base_dResult_dResult_Err (dtb__207))
  | Base_dResult.C_Base_dResult_dResult_Ok (dtb__208) -> (Base_dResult.C_Base_dResult_dResult_Ok ({ Base_dPair.f_Base_dPair_dPair_first = ((Base_dList.v_Base_dList_dappend (Base_dPair.v_Base_dPair_dfirstOf dtb__206)) (Base_dPair.v_Base_dPair_dfirstOf dtb__208)); Base_dPair.f_Base_dPair_dPair_second = (Base_dPair.v_Base_dPair_dsecondOf dtb__208) }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
)
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dResult.C_Base_dResult_dResult_Ok ({ Base_dPair.f_Base_dPair_dPair_first = v_Vuna_dCompiler_dWasm_dModule_demptyStr; Base_dPair.f_Base_dPair_dPair_second = st }))
  | _ -> failwith "DT: impossible branch"
)) parts)))
# 431 "Vuna/Compiler/Wasm/Module.vuna"
and v_Vuna_dCompiler_dWasm_dModule_dgenConcatRest = (fun mc0 mc1 mc2 -> (match mc2 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__209, dtb__210) -> (if (mc0 <= 0) then (Base_dResult.C_Base_dResult_dResult_Err ("wasm codegen fuel exhausted")) else (match (((v_Vuna_dCompiler_dWasm_dModule_dgenExpr (mc0 - 1)) mc1) dtb__209) with
  | Base_dResult.C_Base_dResult_dResult_Err (dtb__211) -> (Base_dResult.C_Base_dResult_dResult_Err (dtb__211))
  | Base_dResult.C_Base_dResult_dResult_Ok (dtb__212) -> (match (((v_Vuna_dCompiler_dWasm_dModule_dgenConcatRest (mc0 - 1)) (Base_dPair.v_Base_dPair_dsecondOf dtb__212)) dtb__210) with
  | Base_dResult.C_Base_dResult_dResult_Err (dtb__213) -> (Base_dResult.C_Base_dResult_dResult_Err (dtb__213))
  | Base_dResult.C_Base_dResult_dResult_Ok (dtb__214) -> (Base_dResult.C_Base_dResult_dResult_Ok ({ Base_dPair.f_Base_dPair_dPair_first = ((Base_dList.v_Base_dList_dappend (Base_dPair.v_Base_dPair_dfirstOf dtb__212)) ((Base_dList.v_Base_dList_dappend (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dWasm_dInstr.C_Vuna_dCompiler_dWasm_dInstr_dInstr_ICall ("$rt_strConcat")), Base_dList.C_Base_dList_dList_Nil))) (Base_dPair.v_Base_dPair_dfirstOf dtb__214))); Base_dPair.f_Base_dPair_dPair_second = (Base_dPair.v_Base_dPair_dsecondOf dtb__214) }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dResult.C_Base_dResult_dResult_Ok ({ Base_dPair.f_Base_dPair_dPair_first = Base_dList.C_Base_dList_dList_Nil; Base_dPair.f_Base_dPair_dPair_second = mc1 }))
  | _ -> failwith "DT: impossible branch"
))

# 463 "Vuna/Compiler/Wasm/Module.vuna"
let v_Vuna_dCompiler_dWasm_dModule_dgenDefFuncGo = (fun fuel st name arity inner paramScope savedLocals savedNext savedScope -> ((fun st1 -> (match (((v_Vuna_dCompiler_dWasm_dModule_dgenExpr (fuel - 1)) st1) inner) with
  | Base_dResult.C_Base_dResult_dResult_Err (dtb__215) -> (Base_dResult.C_Base_dResult_dResult_Err (dtb__215))
  | Base_dResult.C_Base_dResult_dResult_Ok (dtb__216) -> ((fun bodyState -> ((fun func -> ((fun st2 -> (Base_dResult.C_Base_dResult_dResult_Ok ({ Base_dPair.f_Base_dPair_dPair_first = (Base_dList.C_Base_dList_dList_Cons (func, Base_dList.C_Base_dList_dList_Nil)); Base_dPair.f_Base_dPair_dPair_second = st2 }))) ((((v_Vuna_dCompiler_dWasm_dModule_dendFuncScope bodyState) savedLocals) savedNext) savedScope))) { Vuna_dCompiler_dWasm_dModel.f_Vuna_dCompiler_dWasm_dModel_dWatFunc_watFuncName = (Vuna_dCompiler_dWasm_dTypes.v_Vuna_dCompiler_dWasm_dTypes_dwatFuncNameOf name); Vuna_dCompiler_dWasm_dModel.f_Vuna_dCompiler_dWasm_dModel_dWatFunc_watFuncType = ""; Vuna_dCompiler_dWasm_dModel.f_Vuna_dCompiler_dWasm_dModel_dWatFunc_watFuncParams = (v_Vuna_dCompiler_dWasm_dModule_dfuncParams arity); Vuna_dCompiler_dWasm_dModel.f_Vuna_dCompiler_dWasm_dModel_dWatFunc_watFuncResults = (Base_dList.C_Base_dList_dList_Cons (Vuna_dCompiler_dWasm_dModel.C_Vuna_dCompiler_dWasm_dModel_dWatValTy_WvAnyRef, Base_dList.C_Base_dList_dList_Nil)); Vuna_dCompiler_dWasm_dModel.f_Vuna_dCompiler_dWasm_dModel_dWatFunc_watFuncLocals = (bodyState).f_Vuna_dCompiler_dWasm_dModule_dGenState_gsLocals; Vuna_dCompiler_dWasm_dModel.f_Vuna_dCompiler_dWasm_dModel_dWatFunc_watFuncBody = (Base_dPair.v_Base_dPair_dfirstOf dtb__216) })) (Base_dPair.v_Base_dPair_dsecondOf dtb__216))
  | _ -> failwith "DT: impossible branch"
)) { st with f_Vuna_dCompiler_dWasm_dModule_dGenState_gsScope = paramScope }))

# 449 "Vuna/Compiler/Wasm/Module.vuna"
let v_Vuna_dCompiler_dWasm_dModule_dgenDefFuncBody = (fun fuel st name arity body -> ((fun savedLocals -> ((fun savedNext -> ((fun savedScope -> ((fun st1 -> (match body with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLam (dtb__217, dtb__218) -> (match (v_Vuna_dCompiler_dWasm_dModule_druntimeBinders dtb__217) with
  | dtb__219 -> (if ((v_Vuna_dCompiler_dWasm_dModule_dlistLengthB dtb__219) <> arity) then (Base_dResult.C_Base_dResult_dResult_Err ((String.concat "" ["wasm target: function body lambda arity mismatch: `"; name; "`"]))) else (((((((((v_Vuna_dCompiler_dWasm_dModule_dgenDefFuncGo fuel) st1) name) arity) dtb__218) ((v_Vuna_dCompiler_dWasm_dModule_dzipIdx 0) dtb__219)) savedLocals) savedNext) savedScope))
)
  | _ -> (Base_dResult.C_Base_dResult_dResult_Err ((String.concat "" ["wasm target: function body is not a lambda: `"; name; "`"])))
)) (v_Vuna_dCompiler_dWasm_dModule_dbeginFuncScope st))) (st).f_Vuna_dCompiler_dWasm_dModule_dGenState_gsScope)) (st).f_Vuna_dCompiler_dWasm_dModule_dGenState_gsNextLocal)) (st).f_Vuna_dCompiler_dWasm_dModule_dGenState_gsLocals))

# 443 "Vuna/Compiler/Wasm/Module.vuna"
let v_Vuna_dCompiler_dWasm_dModule_dgenDefFunc = (fun fuel st d -> (match d with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrDef_IrExternDef (dtb__220, dtb__221, dtb__222, dtb__223) -> (Base_dResult.C_Base_dResult_dResult_Err ((String.concat "" ["wasm target: extern definition `"; dtb__220; "` is not supported yet"])))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrDef_IrDef (dtb__224, dtb__225, dtb__226, dtb__227, dtb__228, dtb__229, dtb__230) -> (if (dtb__225 = 0) then (Base_dResult.C_Base_dResult_dResult_Ok ({ Base_dPair.f_Base_dPair_dPair_first = Base_dList.C_Base_dList_dList_Nil; Base_dPair.f_Base_dPair_dPair_second = st })) else (((((v_Vuna_dCompiler_dWasm_dModule_dgenDefFuncBody fuel) st) dtb__224) dtb__225) dtb__227))
  | _ -> failwith "DT: impossible branch"
))

# 478 "Vuna/Compiler/Wasm/Module.vuna"
let rec v_Vuna_dCompiler_dWasm_dModule_dgenDefFuncs = (fun mc0 mc1 mc2 -> (match mc2 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__231, dtb__232) -> (if (mc0 <= 0) then (Base_dResult.C_Base_dResult_dResult_Err ("wasm codegen fuel exhausted")) else (match (((v_Vuna_dCompiler_dWasm_dModule_dgenDefFunc mc0) mc1) dtb__231) with
  | Base_dResult.C_Base_dResult_dResult_Err (dtb__233) -> (Base_dResult.C_Base_dResult_dResult_Err (dtb__233))
  | Base_dResult.C_Base_dResult_dResult_Ok (dtb__234) -> (match (((v_Vuna_dCompiler_dWasm_dModule_dgenDefFuncs (mc0 - 1)) (Base_dPair.v_Base_dPair_dsecondOf dtb__234)) dtb__232) with
  | Base_dResult.C_Base_dResult_dResult_Err (dtb__235) -> (Base_dResult.C_Base_dResult_dResult_Err (dtb__235))
  | Base_dResult.C_Base_dResult_dResult_Ok (dtb__236) -> (Base_dResult.C_Base_dResult_dResult_Ok ({ Base_dPair.f_Base_dPair_dPair_first = ((Base_dList.v_Base_dList_dappend (Base_dPair.v_Base_dPair_dfirstOf dtb__234)) (Base_dPair.v_Base_dPair_dfirstOf dtb__236)); Base_dPair.f_Base_dPair_dPair_second = (Base_dPair.v_Base_dPair_dsecondOf dtb__236) }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dResult.C_Base_dResult_dResult_Ok ({ Base_dPair.f_Base_dPair_dPair_first = Base_dList.C_Base_dList_dList_Nil; Base_dPair.f_Base_dPair_dPair_second = mc1 }))
  | _ -> failwith "DT: impossible branch"
))

# 490 "Vuna/Compiler/Wasm/Module.vuna"
let v_Vuna_dCompiler_dWasm_dModule_dgenDefInit = (fun fuel st d -> (match d with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrDef_IrExternDef (dtb__237, dtb__238, dtb__239, dtb__240) -> (Base_dResult.C_Base_dResult_dResult_Err ("extern definition reached wasm codegen"))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrDef_IrDef (dtb__241, dtb__242, dtb__243, dtb__244, dtb__245, dtb__246, dtb__247) -> (if (dtb__242 <> 0) then (Base_dResult.C_Base_dResult_dResult_Ok ({ Base_dPair.f_Base_dPair_dPair_first = Base_dList.C_Base_dList_dList_Nil; Base_dPair.f_Base_dPair_dPair_second = st })) else ((fun st1 -> (match (((v_Vuna_dCompiler_dWasm_dModule_dgenExpr (fuel - 1)) st1) dtb__244) with
  | Base_dResult.C_Base_dResult_dResult_Err (dtb__248) -> (Base_dResult.C_Base_dResult_dResult_Err (dtb__248))
  | Base_dResult.C_Base_dResult_dResult_Ok (dtb__249) -> (Base_dResult.C_Base_dResult_dResult_Ok ({ Base_dPair.f_Base_dPair_dPair_first = ((Base_dList.v_Base_dList_dappend (Base_dPair.v_Base_dPair_dfirstOf dtb__249)) (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dWasm_dInstr.C_Vuna_dCompiler_dWasm_dInstr_dInstr_IGlobalSet ((Vuna_dCompiler_dWasm_dTypes.v_Vuna_dCompiler_dWasm_dTypes_dwatGlobalNameOf dtb__241))), Base_dList.C_Base_dList_dList_Nil))); Base_dPair.f_Base_dPair_dPair_second = (Base_dPair.v_Base_dPair_dsecondOf dtb__249) }))
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dWasm_dModule_drestoreScope Base_dList.C_Base_dList_dList_Nil) st)))
  | _ -> failwith "DT: impossible branch"
))

# 501 "Vuna/Compiler/Wasm/Module.vuna"
let rec v_Vuna_dCompiler_dWasm_dModule_dgenDefsInits = (fun mc0 mc1 mc2 -> (match mc2 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__250, dtb__251) -> (if (mc0 <= 0) then (Base_dResult.C_Base_dResult_dResult_Err ("wasm codegen fuel exhausted")) else (match (((v_Vuna_dCompiler_dWasm_dModule_dgenDefInit (mc0 - 1)) mc1) dtb__250) with
  | Base_dResult.C_Base_dResult_dResult_Err (dtb__252) -> (Base_dResult.C_Base_dResult_dResult_Err (dtb__252))
  | Base_dResult.C_Base_dResult_dResult_Ok (dtb__253) -> (match (((v_Vuna_dCompiler_dWasm_dModule_dgenDefsInits (mc0 - 1)) (Base_dPair.v_Base_dPair_dsecondOf dtb__253)) dtb__251) with
  | Base_dResult.C_Base_dResult_dResult_Err (dtb__254) -> (Base_dResult.C_Base_dResult_dResult_Err (dtb__254))
  | Base_dResult.C_Base_dResult_dResult_Ok (dtb__255) -> (Base_dResult.C_Base_dResult_dResult_Ok ({ Base_dPair.f_Base_dPair_dPair_first = ((Base_dList.v_Base_dList_dappend (Base_dPair.v_Base_dPair_dfirstOf dtb__253)) (Base_dPair.v_Base_dPair_dfirstOf dtb__255)); Base_dPair.f_Base_dPair_dPair_second = (Base_dPair.v_Base_dPair_dsecondOf dtb__255) }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dResult.C_Base_dResult_dResult_Ok ({ Base_dPair.f_Base_dPair_dPair_first = Base_dList.C_Base_dList_dList_Nil; Base_dPair.f_Base_dPair_dPair_second = mc1 }))
  | _ -> failwith "DT: impossible branch"
))

# 537 "Vuna/Compiler/Wasm/Module.vuna"
let rec v_Vuna_dCompiler_dWasm_dModule_dcollectNeeded = (fun mc0 mc1 mc2 mc3 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__256, dtb__257) -> (if (mc0 <= 0) then (Base_dList.v_Base_dList_dreverse mc2) else (if ((v_Vuna_dCompiler_dWasm_dModule_dmemStr dtb__256) mc2) then ((((v_Vuna_dCompiler_dWasm_dModule_dcollectNeeded (mc0 - 1)) dtb__257) mc2) mc3) else (match ((v_Vuna_dCompiler_dWasm_dModule_dfindDef dtb__256) mc3) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((((v_Vuna_dCompiler_dWasm_dModule_dcollectNeeded (mc0 - 1)) dtb__257) (Base_dList.C_Base_dList_dList_Cons (dtb__256, mc2))) mc3)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__258) -> ((((v_Vuna_dCompiler_dWasm_dModule_dcollectNeeded (mc0 - 1)) ((Base_dList.v_Base_dList_dappend dtb__257) (Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirDefDeps dtb__258))) (Base_dList.C_Base_dList_dList_Cons (dtb__256, mc2))) mc3)
  | _ -> failwith "DT: impossible branch"
)))
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dList.v_Base_dList_dreverse mc2)
  | _ -> failwith "DT: impossible branch"
))

# 519 "Vuna/Compiler/Wasm/Module.vuna"
let v_Vuna_dCompiler_dWasm_dModule_dgenStartBody = (fun fuel st entry printResult -> (if (fuel <= 0) then (Base_dResult.C_Base_dResult_dResult_Err ("wasm codegen fuel exhausted")) else (match entry with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (Base_dResult.C_Base_dResult_dResult_Ok ({ Base_dPair.f_Base_dPair_dPair_first = Base_dList.C_Base_dList_dList_Nil; Base_dPair.f_Base_dPair_dPair_second = st }))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__259) -> ((fun st1 -> ((fun needed -> ((fun ordered -> (match (((v_Vuna_dCompiler_dWasm_dModule_dgenDefsInits (fuel - 1)) st1) ordered) with
  | Base_dResult.C_Base_dResult_dResult_Err (dtb__260) -> (Base_dResult.C_Base_dResult_dResult_Err (dtb__260))
  | Base_dResult.C_Base_dResult_dResult_Ok (dtb__261) -> (if (Base_dBool.v_Base_dBool_dnot printResult) then (Base_dResult.C_Base_dResult_dResult_Ok (dtb__261)) else (match (v_Vuna_dCompiler_dWasm_dModule_dentryShowFunc (Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirEntryShowOf dtb__259)) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (Base_dResult.C_Base_dResult_dResult_Err ("wasm target: custom Show entry is not supported yet"))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__262) -> (Base_dResult.C_Base_dResult_dResult_Ok ({ Base_dPair.f_Base_dPair_dPair_first = ((Base_dList.v_Base_dList_dappend (Base_dPair.v_Base_dPair_dfirstOf dtb__261)) (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dWasm_dInstr.C_Vuna_dCompiler_dWasm_dInstr_dInstr_IGlobalGet ((Vuna_dCompiler_dWasm_dTypes.v_Vuna_dCompiler_dWasm_dTypes_dwatGlobalNameOf (Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirEntryMainOf dtb__259)))), (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dWasm_dInstr.C_Vuna_dCompiler_dWasm_dInstr_dInstr_ICall (dtb__262)), (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dWasm_dInstr.C_Vuna_dCompiler_dWasm_dInstr_dInstr_ICall ("$rt_println")), Base_dList.C_Base_dList_dList_Nil))))))); Base_dPair.f_Base_dPair_dPair_second = (Base_dPair.v_Base_dPair_dsecondOf dtb__261) }))
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
)) ((Base_dList.v_Base_dList_dfilter (fun d -> ((v_Vuna_dCompiler_dWasm_dModule_dmemStr (Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirDefName d)) needed))) (st1).f_Vuna_dCompiler_dWasm_dModule_dGenState_gsDefs))) ((((v_Vuna_dCompiler_dWasm_dModule_dcollectNeeded 100000) (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirEntryMainOf dtb__259), Base_dList.C_Base_dList_dList_Nil))) Base_dList.C_Base_dList_dList_Nil) (st1).f_Vuna_dCompiler_dWasm_dModule_dGenState_gsDefs))) (v_Vuna_dCompiler_dWasm_dModule_dbeginFuncScope st))
  | _ -> failwith "DT: impossible branch"
)))

# 552 "Vuna/Compiler/Wasm/Module.vuna"
let v_Vuna_dCompiler_dWasm_dModule_dbaseTypes = (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dWasm_dModel.C_Vuna_dCompiler_dWasm_dModel_dWatType_WatFuncType ("$ft", (Base_dList.C_Base_dList_dList_Cons (Vuna_dCompiler_dWasm_dModel.C_Vuna_dCompiler_dWasm_dModel_dWatValTy_WvAnyRef, (Base_dList.C_Base_dList_dList_Cons (Vuna_dCompiler_dWasm_dModel.C_Vuna_dCompiler_dWasm_dModel_dWatValTy_WvAnyRef, Base_dList.C_Base_dList_dList_Nil)))), (Base_dList.C_Base_dList_dList_Cons (Vuna_dCompiler_dWasm_dModel.C_Vuna_dCompiler_dWasm_dModel_dWatValTy_WvAnyRef, Base_dList.C_Base_dList_dList_Nil)))), (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dWasm_dModel.C_Vuna_dCompiler_dWasm_dModel_dWatType_WatStructType ("$clo", (Base_dList.C_Base_dList_dList_Cons ({ Vuna_dCompiler_dWasm_dModel.f_Vuna_dCompiler_dWasm_dModel_dWatField_watFieldMut = false; Vuna_dCompiler_dWasm_dModel.f_Vuna_dCompiler_dWasm_dModel_dWatField_watFieldTy = (Vuna_dCompiler_dWasm_dModel.C_Vuna_dCompiler_dWasm_dModel_dWatValTy_WvRef ("$ft")) }, (Base_dList.C_Base_dList_dList_Cons ({ Vuna_dCompiler_dWasm_dModel.f_Vuna_dCompiler_dWasm_dModel_dWatField_watFieldMut = false; Vuna_dCompiler_dWasm_dModel.f_Vuna_dCompiler_dWasm_dModel_dWatField_watFieldTy = Vuna_dCompiler_dWasm_dModel.C_Vuna_dCompiler_dWasm_dModel_dWatValTy_WvAnyRef }, Base_dList.C_Base_dList_dList_Nil)))))), (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dWasm_dModel.C_Vuna_dCompiler_dWasm_dModel_dWatType_WatArrayType ("$env", false, Vuna_dCompiler_dWasm_dModel.C_Vuna_dCompiler_dWasm_dModel_dWatValTy_WvAnyRef)), (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dWasm_dModel.C_Vuna_dCompiler_dWasm_dModel_dWatType_WatStructType ("$int", (Base_dList.C_Base_dList_dList_Cons ({ Vuna_dCompiler_dWasm_dModel.f_Vuna_dCompiler_dWasm_dModel_dWatField_watFieldMut = false; Vuna_dCompiler_dWasm_dModel.f_Vuna_dCompiler_dWasm_dModel_dWatField_watFieldTy = Vuna_dCompiler_dWasm_dModel.C_Vuna_dCompiler_dWasm_dModel_dWatValTy_WvI64 }, Base_dList.C_Base_dList_dList_Nil)))), (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dWasm_dModel.C_Vuna_dCompiler_dWasm_dModel_dWatType_WatStructType ("$float", (Base_dList.C_Base_dList_dList_Cons ({ Vuna_dCompiler_dWasm_dModel.f_Vuna_dCompiler_dWasm_dModel_dWatField_watFieldMut = false; Vuna_dCompiler_dWasm_dModel.f_Vuna_dCompiler_dWasm_dModel_dWatField_watFieldTy = Vuna_dCompiler_dWasm_dModel.C_Vuna_dCompiler_dWasm_dModel_dWatValTy_WvF64 }, Base_dList.C_Base_dList_dList_Nil)))), (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dWasm_dModel.C_Vuna_dCompiler_dWasm_dModel_dWatType_WatArrayType ("$str", true, Vuna_dCompiler_dWasm_dModel.C_Vuna_dCompiler_dWasm_dModel_dWatValTy_WvI8)), (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dWasm_dModel.C_Vuna_dCompiler_dWasm_dModel_dWatType_WatArrayType ("$arr", true, Vuna_dCompiler_dWasm_dModel.C_Vuna_dCompiler_dWasm_dModel_dWatValTy_WvAnyRef)), Base_dList.C_Base_dList_dList_Nil))))))))))))))

# 563 "Vuna/Compiler/Wasm/Module.vuna"
let v_Vuna_dCompiler_dWasm_dModule_dbaseImports = (Base_dList.C_Base_dList_dList_Cons ({ Vuna_dCompiler_dWasm_dModel.f_Vuna_dCompiler_dWasm_dModel_dWatImport_watImportModule = "wasi_snapshot_preview1"; Vuna_dCompiler_dWasm_dModel.f_Vuna_dCompiler_dWasm_dModel_dWatImport_watImportName = "fd_write"; Vuna_dCompiler_dWasm_dModel.f_Vuna_dCompiler_dWasm_dModel_dWatImport_watImportFunc = "$fd_write"; Vuna_dCompiler_dWasm_dModel.f_Vuna_dCompiler_dWasm_dModel_dWatImport_watImportParams = (Base_dList.C_Base_dList_dList_Cons (Vuna_dCompiler_dWasm_dModel.C_Vuna_dCompiler_dWasm_dModel_dWatValTy_WvI32, (Base_dList.C_Base_dList_dList_Cons (Vuna_dCompiler_dWasm_dModel.C_Vuna_dCompiler_dWasm_dModel_dWatValTy_WvI32, (Base_dList.C_Base_dList_dList_Cons (Vuna_dCompiler_dWasm_dModel.C_Vuna_dCompiler_dWasm_dModel_dWatValTy_WvI32, (Base_dList.C_Base_dList_dList_Cons (Vuna_dCompiler_dWasm_dModel.C_Vuna_dCompiler_dWasm_dModel_dWatValTy_WvI32, Base_dList.C_Base_dList_dList_Nil)))))))); Vuna_dCompiler_dWasm_dModel.f_Vuna_dCompiler_dWasm_dModel_dWatImport_watImportResults = (Base_dList.C_Base_dList_dList_Cons (Vuna_dCompiler_dWasm_dModel.C_Vuna_dCompiler_dWasm_dModel_dWatValTy_WvI32, Base_dList.C_Base_dList_dList_Nil)) }, (Base_dList.C_Base_dList_dList_Cons ({ Vuna_dCompiler_dWasm_dModel.f_Vuna_dCompiler_dWasm_dModel_dWatImport_watImportModule = "wasi_snapshot_preview1"; Vuna_dCompiler_dWasm_dModel.f_Vuna_dCompiler_dWasm_dModel_dWatImport_watImportName = "proc_exit"; Vuna_dCompiler_dWasm_dModel.f_Vuna_dCompiler_dWasm_dModel_dWatImport_watImportFunc = "$proc_exit"; Vuna_dCompiler_dWasm_dModel.f_Vuna_dCompiler_dWasm_dModel_dWatImport_watImportParams = (Base_dList.C_Base_dList_dList_Cons (Vuna_dCompiler_dWasm_dModel.C_Vuna_dCompiler_dWasm_dModel_dWatValTy_WvI32, Base_dList.C_Base_dList_dList_Nil)); Vuna_dCompiler_dWasm_dModel.f_Vuna_dCompiler_dWasm_dModel_dWatImport_watImportResults = Base_dList.C_Base_dList_dList_Nil }, Base_dList.C_Base_dList_dList_Nil))))

# 573 "Vuna/Compiler/Wasm/Module.vuna"
let v_Vuna_dCompiler_dWasm_dModule_dglobalOfDef = (fun d -> (if ((Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirDefArity d) = 0) then (Base_dList.C_Base_dList_dList_Cons ({ Vuna_dCompiler_dWasm_dModel.f_Vuna_dCompiler_dWasm_dModel_dWatGlobal_watGlobalName = (Vuna_dCompiler_dWasm_dTypes.v_Vuna_dCompiler_dWasm_dTypes_dwatGlobalNameOf (Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirDefName d)); Vuna_dCompiler_dWasm_dModel.f_Vuna_dCompiler_dWasm_dModel_dWatGlobal_watGlobalTy = Vuna_dCompiler_dWasm_dModel.C_Vuna_dCompiler_dWasm_dModel_dWatValTy_WvAnyRef; Vuna_dCompiler_dWasm_dModel.f_Vuna_dCompiler_dWasm_dModel_dWatGlobal_watGlobalInit = (Base_dList.C_Base_dList_dList_Cons (Vuna_dCompiler_dWasm_dInstr.C_Vuna_dCompiler_dWasm_dInstr_dInstr_IRefNull, Base_dList.C_Base_dList_dList_Nil)) }, Base_dList.C_Base_dList_dList_Nil)) else Base_dList.C_Base_dList_dList_Nil))

# 570 "Vuna/Compiler/Wasm/Module.vuna"
let v_Vuna_dCompiler_dWasm_dModule_dglobalsOf = (fun defs -> ((Base_dList.v_Base_dList_dconcatMap v_Vuna_dCompiler_dWasm_dModule_dglobalOfDef) defs))

# 577 "Vuna/Compiler/Wasm/Module.vuna"
let rec v_Vuna_dCompiler_dWasm_dModule_dconcatMapType = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__263, dtb__264) -> (match (Vuna_dCompiler_dWasm_dTypes.v_Vuna_dCompiler_dWasm_dTypes_dwasmFamType dtb__263) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (v_Vuna_dCompiler_dWasm_dModule_dconcatMapType dtb__264)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__265) -> (Base_dList.C_Base_dList_dList_Cons (dtb__265, (v_Vuna_dCompiler_dWasm_dModule_dconcatMapType dtb__264)))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 633 "Vuna/Compiler/Wasm/Module.vuna"
let v_Vuna_dCompiler_dWasm_dModule_dclassifyWasmErr = (fun msg -> (if ((Base_dString.v_Base_dString_dstartsWith "wasm target:") msg) then (Vuna_dCompiler_dWasm_dModel.C_Vuna_dCompiler_dWasm_dModel_dWasmErr_WasmUnsupported (msg)) else (Vuna_dCompiler_dWasm_dModel.C_Vuna_dCompiler_dWasm_dModel_dWasmErr_WasmInternal (msg))))

# 637 "Vuna/Compiler/Wasm/Module.vuna"
let rec v_Vuna_dCompiler_dWasm_dModule_dfoldlStrings = (fun mc0 mc1 mc2 -> (match mc2 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__266, dtb__267) -> (((v_Vuna_dCompiler_dWasm_dModule_dfoldlStrings mc0) ((mc0 mc1) dtb__266)) dtb__267)
  | Base_dList.C_Base_dList_dList_Nil -> mc1
  | _ -> failwith "DT: impossible branch"
))

# 641 "Vuna/Compiler/Wasm/Module.vuna"
let v_Vuna_dCompiler_dWasm_dModule_dmkConsts = (fun offsets -> ((fun offOf -> ((fun lenOf -> { Vuna_dCompiler_dWasm_dRuntime.f_Vuna_dCompiler_dWasm_dRuntime_dRtConsts_rtcTrueOff = (offOf "True"); Vuna_dCompiler_dWasm_dRuntime.f_Vuna_dCompiler_dWasm_dRuntime_dRtConsts_rtcTrueLen = (lenOf "True"); Vuna_dCompiler_dWasm_dRuntime.f_Vuna_dCompiler_dWasm_dRuntime_dRtConsts_rtcFalseOff = (offOf "False"); Vuna_dCompiler_dWasm_dRuntime.f_Vuna_dCompiler_dWasm_dRuntime_dRtConsts_rtcFalseLen = (lenOf "False"); Vuna_dCompiler_dWasm_dRuntime.f_Vuna_dCompiler_dWasm_dRuntime_dRtConsts_rtcTodoOff = (offOf "TODO: "); Vuna_dCompiler_dWasm_dRuntime.f_Vuna_dCompiler_dWasm_dRuntime_dRtConsts_rtcTodoLen = (lenOf "TODO: "); Vuna_dCompiler_dWasm_dRuntime.f_Vuna_dCompiler_dWasm_dRuntime_dRtConsts_rtcDivOff = (offOf "division by zero"); Vuna_dCompiler_dWasm_dRuntime.f_Vuna_dCompiler_dWasm_dRuntime_dRtConsts_rtcDivLen = (lenOf "division by zero") }) (fun mc0 -> (match ((v_Vuna_dCompiler_dWasm_dModule_dpoolLookup mc0) offsets) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__268) -> (Base_dPair.v_Base_dPair_dsecondOf dtb__268)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> 0
  | _ -> failwith "DT: impossible branch"
)))) (fun mc0 -> (match ((v_Vuna_dCompiler_dWasm_dModule_dpoolLookup mc0) offsets) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__269) -> (Base_dPair.v_Base_dPair_dfirstOf dtb__269)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> 0
  | _ -> failwith "DT: impossible branch"
))))

# 655 "Vuna/Compiler/Wasm/Module.vuna"
let v_Vuna_dCompiler_dWasm_dModule_djoinWith = (fun sep xs -> ((Base_dString.v_Base_dString_djoin sep) xs))

# 190 "Vuna/Compiler/Wasm/Module.vuna"
let v_Vuna_dCompiler_dWasm_dModule_dpoolBytes = (fun pool -> ((v_Vuna_dCompiler_dWasm_dModule_djoinWith "") ((Base_dList.v_Base_dList_dmap (fun p -> (Base_dPair.v_Base_dPair_dfirstOf p))) pool)))

# 583 "Vuna/Compiler/Wasm/Module.vuna"
let v_Vuna_dCompiler_dWasm_dModule_dbuildModule = (fun fuel st ordered entry printResult -> (match (((v_Vuna_dCompiler_dWasm_dModule_dgenDefFuncs fuel) st) ordered) with
  | Base_dResult.C_Base_dResult_dResult_Err (dtb__270) -> (Base_dResult.C_Base_dResult_dResult_Err (dtb__270))
  | Base_dResult.C_Base_dResult_dResult_Ok (dtb__271) -> ((fun userFuncs -> ((fun stFuncs -> (match ((((v_Vuna_dCompiler_dWasm_dModule_dgenStartBody (fuel - 1)) stFuncs) entry) printResult) with
  | Base_dResult.C_Base_dResult_dResult_Err (dtb__272) -> (Base_dResult.C_Base_dResult_dResult_Err (dtb__272))
  | Base_dResult.C_Base_dResult_dResult_Ok (dtb__273) -> ((fun startState -> ((fun startFunc -> ((fun funcs -> ((fun famTypes -> ((fun allTypes -> ((fun globals -> ((fun dataText -> ((fun dataM -> (Base_dResult.C_Base_dResult_dResult_Ok ({ Vuna_dCompiler_dWasm_dModel.f_Vuna_dCompiler_dWasm_dModel_dWasmModule_wmTypes = allTypes; Vuna_dCompiler_dWasm_dModel.f_Vuna_dCompiler_dWasm_dModel_dWasmModule_wmImports = v_Vuna_dCompiler_dWasm_dModule_dbaseImports; Vuna_dCompiler_dWasm_dModel.f_Vuna_dCompiler_dWasm_dModel_dWasmModule_wmGlobals = globals; Vuna_dCompiler_dWasm_dModel.f_Vuna_dCompiler_dWasm_dModel_dWasmModule_wmFuncs = funcs; Vuna_dCompiler_dWasm_dModel.f_Vuna_dCompiler_dWasm_dModel_dWasmModule_wmElems = Base_dList.C_Base_dList_dList_Nil; Vuna_dCompiler_dWasm_dModel.f_Vuna_dCompiler_dWasm_dModel_dWasmModule_wmData = dataM; Vuna_dCompiler_dWasm_dModel.f_Vuna_dCompiler_dWasm_dModel_dWasmModule_wmExports = (Base_dList.C_Base_dList_dList_Cons ({ Vuna_dCompiler_dWasm_dModel.f_Vuna_dCompiler_dWasm_dModel_dWatExport_watExportKind = "func"; Vuna_dCompiler_dWasm_dModel.f_Vuna_dCompiler_dWasm_dModel_dWatExport_watExportName = "_start"; Vuna_dCompiler_dWasm_dModel.f_Vuna_dCompiler_dWasm_dModel_dWatExport_watExportRef = "$_start" }, Base_dList.C_Base_dList_dList_Nil)); Vuna_dCompiler_dWasm_dModel.f_Vuna_dCompiler_dWasm_dModel_dWasmModule_wmMemPages = 4 }))) (if ((bi_strLength dataText) = 0) then Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing else (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Vuna_dCompiler_dWasm_dModel.f_Vuna_dCompiler_dWasm_dModel_dWatData_watDataName = "$d0"; Vuna_dCompiler_dWasm_dModel.f_Vuna_dCompiler_dWasm_dModel_dWatData_watDataBytes = dataText }))))) (v_Vuna_dCompiler_dWasm_dModule_dpoolBytes (st).f_Vuna_dCompiler_dWasm_dModule_dGenState_gsPool))) (v_Vuna_dCompiler_dWasm_dModule_dglobalsOf ordered))) ((Base_dList.v_Base_dList_dappend v_Vuna_dCompiler_dWasm_dModule_dbaseTypes) famTypes))) (v_Vuna_dCompiler_dWasm_dModule_dconcatMapType (st).f_Vuna_dCompiler_dWasm_dModule_dGenState_gsFams))) ((Base_dList.v_Base_dList_dappend (Vuna_dCompiler_dWasm_dRuntime.v_Vuna_dCompiler_dWasm_dRuntime_drtFunctions (st).f_Vuna_dCompiler_dWasm_dModule_dGenState_gsConsts)) ((Base_dList.v_Base_dList_dappend userFuncs) (Base_dList.C_Base_dList_dList_Cons (startFunc, Base_dList.C_Base_dList_dList_Nil)))))) { Vuna_dCompiler_dWasm_dModel.f_Vuna_dCompiler_dWasm_dModel_dWatFunc_watFuncName = "$_start"; Vuna_dCompiler_dWasm_dModel.f_Vuna_dCompiler_dWasm_dModel_dWatFunc_watFuncType = ""; Vuna_dCompiler_dWasm_dModel.f_Vuna_dCompiler_dWasm_dModel_dWatFunc_watFuncParams = Base_dList.C_Base_dList_dList_Nil; Vuna_dCompiler_dWasm_dModel.f_Vuna_dCompiler_dWasm_dModel_dWatFunc_watFuncResults = Base_dList.C_Base_dList_dList_Nil; Vuna_dCompiler_dWasm_dModel.f_Vuna_dCompiler_dWasm_dModel_dWatFunc_watFuncLocals = (startState).f_Vuna_dCompiler_dWasm_dModule_dGenState_gsLocals; Vuna_dCompiler_dWasm_dModel.f_Vuna_dCompiler_dWasm_dModel_dWatFunc_watFuncBody = (Base_dPair.v_Base_dPair_dfirstOf dtb__273) })) (Base_dPair.v_Base_dPair_dsecondOf dtb__273))
  | _ -> failwith "DT: impossible branch"
)) (Base_dPair.v_Base_dPair_dsecondOf dtb__271))) (Base_dPair.v_Base_dPair_dfirstOf dtb__271))
  | _ -> failwith "DT: impossible branch"
))

# 608 "Vuna/Compiler/Wasm/Module.vuna"
let v_Vuna_dCompiler_dWasm_dModule_dbuild = (fun program printResult -> ((fun unit -> ((fun defs -> ((fun entry -> ((fun fams -> ((fun statics -> ((fun users -> ((fun pool -> ((fun offsets -> ((fun consts -> ((fun st0 -> (match entry with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (C_Vuna_dCompiler_dWasm_dModule_dWasmOutcome_WasmRejected ((Vuna_dCompiler_dWasm_dModel.C_Vuna_dCompiler_dWasm_dModel_dWasmErr_WasmUnsupported ("wasm target: no main definition"))))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__274) -> (if (Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirEntryIsActionOf dtb__274) then (C_Vuna_dCompiler_dWasm_dModule_dWasmOutcome_WasmRejected ((Vuna_dCompiler_dWasm_dModel.C_Vuna_dCompiler_dWasm_dModel_dWasmErr_WasmUnsupported ("wasm target: effectful main is not supported yet")))) else ((fun needed -> ((fun ordered -> (match (((((v_Vuna_dCompiler_dWasm_dModule_dbuildModule 100000) st0) ordered) (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__274))) printResult) with
  | Base_dResult.C_Base_dResult_dResult_Ok (dtb__275) -> (C_Vuna_dCompiler_dWasm_dModule_dWasmOutcome_WasmOk (dtb__275))
  | Base_dResult.C_Base_dResult_dResult_Err (dtb__276) -> (C_Vuna_dCompiler_dWasm_dModule_dWasmOutcome_WasmRejected ((v_Vuna_dCompiler_dWasm_dModule_dclassifyWasmErr dtb__276)))
  | _ -> failwith "DT: impossible branch"
)) ((Base_dList.v_Base_dList_dfilter (fun d -> ((v_Vuna_dCompiler_dWasm_dModule_dmemStr (Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirDefName d)) needed))) defs))) ((((v_Vuna_dCompiler_dWasm_dModule_dcollectNeeded 100000) (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirEntryMainOf dtb__274), Base_dList.C_Base_dList_dList_Nil))) Base_dList.C_Base_dList_dList_Nil) defs)))
  | _ -> failwith "DT: impossible branch"
)) { f_Vuna_dCompiler_dWasm_dModule_dGenState_gsFams = fams; f_Vuna_dCompiler_dWasm_dModule_dGenState_gsDefs = defs; f_Vuna_dCompiler_dWasm_dModule_dGenState_gsPool = offsets; f_Vuna_dCompiler_dWasm_dModule_dGenState_gsFuncs = Base_dList.C_Base_dList_dList_Nil; f_Vuna_dCompiler_dWasm_dModule_dGenState_gsLocals = Base_dList.C_Base_dList_dList_Nil; f_Vuna_dCompiler_dWasm_dModule_dGenState_gsNextLocal = 0; f_Vuna_dCompiler_dWasm_dModule_dGenState_gsScope = Base_dList.C_Base_dList_dList_Nil; f_Vuna_dCompiler_dWasm_dModule_dGenState_gsConsts = consts })) (v_Vuna_dCompiler_dWasm_dModule_dmkConsts offsets))) ((v_Vuna_dCompiler_dWasm_dModule_dpoolOffsets pool) 0))) (((v_Vuna_dCompiler_dWasm_dModule_dfoldlStrings (fun acc s -> ((v_Vuna_dCompiler_dWasm_dModule_daddString s) acc))) statics) users))) ((Base_dList.v_Base_dList_dconcatMap v_Vuna_dCompiler_dWasm_dModule_dstrLitsDef) defs))) (Base_dList.C_Base_dList_dList_Cons ("True", (Base_dList.C_Base_dList_dList_Cons ("False", (Base_dList.C_Base_dList_dList_Cons ("TODO: ", (Base_dList.C_Base_dList_dList_Cons ("division by zero", Base_dList.C_Base_dList_dList_Nil)))))))))) (Vuna_dCompiler_dWasm_dTypes.v_Vuna_dCompiler_dWasm_dTypes_dwasmFamsOf (unit).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrUnit_irUnitTyDecls))) (unit).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrUnit_irUnitEntry)) ((Base_dList.v_Base_dList_dconcatMap Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirGroupDefs) (unit).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrUnit_irUnitGroups))) (Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirProgUnitOf program)))
