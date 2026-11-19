open Vuna_runtime
type t_Vuna_dCompiler_dIr_dDispatch_dSpineArg = { f_Vuna_dCompiler_dIr_dDispatch_dSpineArg_saTy : (Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrTy, Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrTy) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dMaybe.t_Base_dData_dMaybe_dMaybe; f_Vuna_dCompiler_dIr_dDispatch_dSpineArg_saValue : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIr }

# 23 "Vuna/Compiler/Ir/Dispatch.vuna"
let v_Vuna_dCompiler_dIr_dDispatch_ddispatchIdNameOf = (fun (name : string) (arity : int) -> (if (name = Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_deffSendCoreName) then (if (arity = 3) then (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_deffSendCoreIdName)) else Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing) else (if (name = "Base.Effect.Core.performCore") then (if (arity = 3) then (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ("Base.Effect.Core.performCoreId")) else Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing) else (if (name = "Base.Effect.Core.handleCore") then (if (arity = 5) then (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ("Base.Effect.Core.handleCoreId")) else Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing) else (if (name = "Base.Effect.Core.handleCoreAt") then (if (arity = 5) then (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ("Base.Effect.Core.handleCoreAtId")) else Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing) else (if (name = "Base.Effect.Core.handleCoreLin") then (if (arity = 5) then (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ("Base.Effect.Core.handleCoreLinId")) else Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing) else (if (name = "Base.Effect.Core.handleWith") then (if (arity = 5) then (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ("Base.Effect.Core.handleWithId")) else Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing) else (if (name = "Base.Effect.Core.handleWithAt") then (if (arity = 5) then (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ("Base.Effect.Core.handleWithAtId")) else Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing) else Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing))))))))

# 47 "Vuna/Compiler/Ir/Dispatch.vuna"
let rec v_Vuna_dCompiler_dIr_dDispatch_dflattenSpine = (fun (mc0 : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIr) -> (match mc0 with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (dtb__0, dtb__1, dtb__2) -> ((fun p -> { Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Base_dData_dPair.v_Base_dData_dPair_dfirstOf p); Base_dData_dPair.f_Base_dData_dPair_dPair_second = ((Base_dData_dList.v_Base_dData_dList_dappend (Base_dData_dPair.v_Base_dData_dPair_dsecondOf p)) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ f_Vuna_dCompiler_dIr_dDispatch_dSpineArg_saTy = dtb__0; f_Vuna_dCompiler_dIr_dDispatch_dSpineArg_saValue = dtb__2 }, Base_dData_dList.C_Base_dData_dList_dList_Nil))) }) (v_Vuna_dCompiler_dIr_dDispatch_dflattenSpine dtb__1))
  | _ -> { Base_dData_dPair.f_Base_dData_dPair_dPair_first = mc0; Base_dData_dPair.f_Base_dData_dPair_dPair_second = Base_dData_dList.C_Base_dData_dList_dList_Nil }
))

# 54 "Vuna/Compiler/Ir/Dispatch.vuna"
let rec v_Vuna_dCompiler_dIr_dDispatch_dbuildSpine = (fun (mc0 : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIr) (mc1 : t_Vuna_dCompiler_dIr_dDispatch_dSpineArg Base_dData_dList.t_Base_dData_dList_dList) -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__3, dtb__4) -> ((v_Vuna_dCompiler_dIr_dDispatch_dbuildSpine (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp ((dtb__3).f_Vuna_dCompiler_dIr_dDispatch_dSpineArg_saTy, mc0, (dtb__3).f_Vuna_dCompiler_dIr_dDispatch_dSpineArg_saValue))) dtb__4)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> mc0
  | _ -> failwith "DT: impossible branch"
))

# 58 "Vuna/Compiler/Ir/Dispatch.vuna"
let rec v_Vuna_dCompiler_dIr_dDispatch_dargCount = (fun (mc0 : t_Vuna_dCompiler_dIr_dDispatch_dSpineArg Base_dData_dList.t_Base_dData_dList_dList) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__5, dtb__6) -> (1 + (v_Vuna_dCompiler_dIr_dDispatch_dargCount dtb__6))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))

# 63 "Vuna/Compiler/Ir/Dispatch.vuna"
let v_Vuna_dCompiler_dIr_dDispatch_ddispatchIdArg = (fun (mc0 : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIr) -> (match mc0 with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrStr (dtb__7) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrInt ((Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_ddispatchIdOf dtb__7)))
  | _ -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRtApp (Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_ddispatchIdIntrinsicName, (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (mc0, Base_dData_dList.C_Base_dData_dList_dList_Nil))))
))

# 69 "Vuna/Compiler/Ir/Dispatch.vuna"
let v_Vuna_dCompiler_dIr_dDispatch_ddispatchSpine = (fun (head : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIr) (args : t_Vuna_dCompiler_dIr_dDispatch_dSpineArg Base_dData_dList.t_Base_dData_dList_dList) -> (match head with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrGlobal (dtb__8) -> (match ((v_Vuna_dCompiler_dIr_dDispatch_ddispatchIdNameOf dtb__8) (v_Vuna_dCompiler_dIr_dDispatch_dargCount args)) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__9) -> ((fun nd_uscrut5 -> (match nd_uscrut5 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__10, dtb__11) -> (match dtb__11 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__12, dtb__13) -> ((v_Vuna_dCompiler_dIr_dDispatch_dbuildSpine (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrGlobal (dtb__9))) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__10, (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__12, (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ f_Vuna_dCompiler_dIr_dDispatch_dSpineArg_saTy = Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing; f_Vuna_dCompiler_dIr_dDispatch_dSpineArg_saValue = (v_Vuna_dCompiler_dIr_dDispatch_ddispatchIdArg (dtb__10).f_Vuna_dCompiler_dIr_dDispatch_dSpineArg_saValue) }, (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ f_Vuna_dCompiler_dIr_dDispatch_dSpineArg_saTy = Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing; f_Vuna_dCompiler_dIr_dDispatch_dSpineArg_saValue = (v_Vuna_dCompiler_dIr_dDispatch_ddispatchIdArg (dtb__12).f_Vuna_dCompiler_dIr_dDispatch_dSpineArg_saValue) }, dtb__13)))))))))
  | _ -> ((v_Vuna_dCompiler_dIr_dDispatch_dbuildSpine head) args)
)
  | _ -> ((v_Vuna_dCompiler_dIr_dDispatch_dbuildSpine head) args)
)) args)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> ((v_Vuna_dCompiler_dIr_dDispatch_dbuildSpine head) args)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> ((v_Vuna_dCompiler_dIr_dDispatch_dbuildSpine head) args)
))

# 84 "Vuna/Compiler/Ir/Dispatch.vuna"
let rec v_Vuna_dCompiler_dIr_dDispatch_ddispatchSpineArgs = (fun (fuel : int) (args : t_Vuna_dCompiler_dIr_dDispatch_dSpineArg Base_dData_dList.t_Base_dData_dList_dList) -> (if (fuel <= 0) then args else (match args with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__14, dtb__15) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ f_Vuna_dCompiler_dIr_dDispatch_dSpineArg_saTy = (dtb__14).f_Vuna_dCompiler_dIr_dDispatch_dSpineArg_saTy; f_Vuna_dCompiler_dIr_dDispatch_dSpineArg_saValue = ((v_Vuna_dCompiler_dIr_dDispatch_ddispatch (fuel - 1)) (dtb__14).f_Vuna_dCompiler_dIr_dDispatch_dSpineArg_saValue) }, ((v_Vuna_dCompiler_dIr_dDispatch_ddispatchSpineArgs (fuel - 1)) dtb__15)))
  | _ -> failwith "DT: impossible branch"
)))
# 94 "Vuna/Compiler/Ir/Dispatch.vuna"
and v_Vuna_dCompiler_dIr_dDispatch_ddispatch = (fun (fuel : int) (e : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIr) -> (if (fuel <= 0) then e else (match e with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrVar (dtb__16) -> e
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrGlobal (dtb__17) -> e
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRt (dtb__18) -> e
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrInt (dtb__19) -> e
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrStr (dtb__20) -> e
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrBool (dtb__21) -> e
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrFloatLit (dtb__22) -> e
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrEffBind (dtb__23, dtb__24, dtb__25) -> e
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCtor (dtb__26, dtb__27, dtb__28, dtb__29) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCtor (dtb__26, dtb__27, dtb__28, ((v_Vuna_dCompiler_dIr_dDispatch_ddispatchList (fuel - 1)) dtb__29)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRecord (dtb__30, dtb__31, dtb__32) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRecord (dtb__30, dtb__31, ((v_Vuna_dCompiler_dIr_dDispatch_ddispatchFields (fuel - 1)) dtb__32)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrProj (dtb__33, dtb__34, dtb__35, dtb__36) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrProj (((v_Vuna_dCompiler_dIr_dDispatch_ddispatch (fuel - 1)) dtb__33), dtb__34, dtb__35, dtb__36))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRecUpd (dtb__37, dtb__38, dtb__39, dtb__40) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRecUpd (((v_Vuna_dCompiler_dIr_dDispatch_ddispatch (fuel - 1)) dtb__37), dtb__38, ((v_Vuna_dCompiler_dIr_dDispatch_ddispatchFields (fuel - 1)) dtb__39), dtb__40))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (dtb__41, dtb__42, dtb__43) -> ((fun p -> ((v_Vuna_dCompiler_dIr_dDispatch_ddispatchSpine ((v_Vuna_dCompiler_dIr_dDispatch_ddispatch (fuel - 1)) (Base_dData_dPair.v_Base_dData_dPair_dfirstOf p))) ((v_Vuna_dCompiler_dIr_dDispatch_ddispatchSpineArgs (fuel - 1)) (Base_dData_dPair.v_Base_dData_dPair_dsecondOf p)))) (v_Vuna_dCompiler_dIr_dDispatch_dflattenSpine (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (dtb__41, dtb__42, dtb__43))))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrIf (dtb__44, dtb__45, dtb__46) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrIf (((v_Vuna_dCompiler_dIr_dDispatch_ddispatch (fuel - 1)) dtb__44), ((v_Vuna_dCompiler_dIr_dDispatch_ddispatch (fuel - 1)) dtb__45), ((v_Vuna_dCompiler_dIr_dDispatch_ddispatch (fuel - 1)) dtb__46)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCase (dtb__47, dtb__48, dtb__49, dtb__50) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCase (dtb__47, dtb__48, ((v_Vuna_dCompiler_dIr_dDispatch_ddispatch (fuel - 1)) dtb__49), ((v_Vuna_dCompiler_dIr_dDispatch_ddispatchAlts (fuel - 1)) dtb__50)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrNatCase (dtb__51, dtb__52, dtb__53, dtb__54, dtb__55) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrNatCase (((v_Vuna_dCompiler_dIr_dDispatch_ddispatch (fuel - 1)) dtb__51), dtb__52, ((v_Vuna_dCompiler_dIr_dDispatch_ddispatchAltM (fuel - 1)) dtb__53), ((v_Vuna_dCompiler_dIr_dDispatch_ddispatchAltM (fuel - 1)) dtb__54), ((v_Vuna_dCompiler_dIr_dDispatch_ddispatchAltM (fuel - 1)) dtb__55)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrConcatMany (dtb__56) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrConcatMany (((v_Vuna_dCompiler_dIr_dDispatch_ddispatchList (fuel - 1)) dtb__56)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrEffThunk (dtb__57, dtb__58, dtb__59, dtb__60, dtb__61) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrEffThunk (dtb__57, dtb__58, dtb__59, dtb__60, ((v_Vuna_dCompiler_dIr_dDispatch_ddispatch (fuel - 1)) dtb__61)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCast (dtb__62, dtb__63, dtb__64) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCast (dtb__62, dtb__63, ((v_Vuna_dCompiler_dIr_dDispatch_ddispatch (fuel - 1)) dtb__64)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLet (dtb__65, dtb__66, dtb__67) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLet (dtb__65, ((v_Vuna_dCompiler_dIr_dDispatch_ddispatch (fuel - 1)) dtb__66), ((v_Vuna_dCompiler_dIr_dDispatch_ddispatch (fuel - 1)) dtb__67)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLam (dtb__68, dtb__69, dtb__70) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLam (dtb__68, dtb__69, ((v_Vuna_dCompiler_dIr_dDispatch_ddispatch (fuel - 1)) dtb__70)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrTail (dtb__71) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrTail (((v_Vuna_dCompiler_dIr_dDispatch_ddispatch (fuel - 1)) dtb__71)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRtApp (dtb__72, dtb__73) -> ((fun args1 -> (if (dtb__72 = Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_ddispatchIdIntrinsicName) then ((fun nd_uscrut5 -> (match nd_uscrut5 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__74, dtb__75) -> (match dtb__74 with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrStr (dtb__76) -> (match dtb__75 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrInt ((Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_ddispatchIdOf dtb__76)))
  | _ -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRtApp (dtb__72, args1))
)
  | _ -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRtApp (dtb__72, args1))
)
  | _ -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRtApp (dtb__72, args1))
)) args1) else (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRtApp (dtb__72, args1)))) ((v_Vuna_dCompiler_dIr_dDispatch_ddispatchList (fuel - 1)) dtb__73))
  | _ -> failwith "DT: impossible branch"
)))
# 135 "Vuna/Compiler/Ir/Dispatch.vuna"
and v_Vuna_dCompiler_dIr_dDispatch_ddispatchList = (fun (fuel : int) (xs : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIr Base_dData_dList.t_Base_dData_dList_dList) -> (if (fuel <= 0) then xs else (match xs with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__77, dtb__78) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (((v_Vuna_dCompiler_dIr_dDispatch_ddispatch (fuel - 1)) dtb__77), ((v_Vuna_dCompiler_dIr_dDispatch_ddispatchList (fuel - 1)) dtb__78)))
  | _ -> failwith "DT: impossible branch"
)))
# 144 "Vuna/Compiler/Ir/Dispatch.vuna"
and v_Vuna_dCompiler_dIr_dDispatch_ddispatchFields = (fun (fuel : int) (fs : (string, Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIr) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) -> (if (fuel <= 0) then fs else (match fs with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__79, dtb__80) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Base_dData_dPair.v_Base_dData_dPair_dfirstOf dtb__79); Base_dData_dPair.f_Base_dData_dPair_dPair_second = ((v_Vuna_dCompiler_dIr_dDispatch_ddispatch (fuel - 1)) (Base_dData_dPair.v_Base_dData_dPair_dsecondOf dtb__79)) }, ((v_Vuna_dCompiler_dIr_dDispatch_ddispatchFields (fuel - 1)) dtb__80)))
  | _ -> failwith "DT: impossible branch"
)))
# 153 "Vuna/Compiler/Ir/Dispatch.vuna"
and v_Vuna_dCompiler_dIr_dDispatch_ddispatchAlt = (fun (fuel : int) (a : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrAlt) -> (if (fuel <= 0) then a else { Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltCtor = (a).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltCtor; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBinders = (a).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBinders; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBody = ((v_Vuna_dCompiler_dIr_dDispatch_ddispatch (fuel - 1)) (a).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBody) }))
# 157 "Vuna/Compiler/Ir/Dispatch.vuna"
and v_Vuna_dCompiler_dIr_dDispatch_ddispatchAltM = (fun (fuel : int) (m : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrAlt Base_dData_dMaybe.t_Base_dData_dMaybe_dMaybe) -> (if (fuel <= 0) then m else (match m with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__81) -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (((v_Vuna_dCompiler_dIr_dDispatch_ddispatchAlt (fuel - 1)) dtb__81)))
  | _ -> failwith "DT: impossible branch"
)))
# 166 "Vuna/Compiler/Ir/Dispatch.vuna"
and v_Vuna_dCompiler_dIr_dDispatch_ddispatchAlts = (fun (fuel : int) (alts : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrAlt Base_dData_dList.t_Base_dData_dList_dList) -> (if (fuel <= 0) then alts else (match alts with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__82, dtb__83) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (((v_Vuna_dCompiler_dIr_dDispatch_ddispatchAlt (fuel - 1)) dtb__82), ((v_Vuna_dCompiler_dIr_dDispatch_ddispatchAlts (fuel - 1)) dtb__83)))
  | _ -> failwith "DT: impossible branch"
)))

# 207 "Vuna/Compiler/Ir/Dispatch.vuna"
let v_Vuna_dCompiler_dIr_dDispatch_ddispatchFuelBase = 64

# 210 "Vuna/Compiler/Ir/Dispatch.vuna"
let v_Vuna_dCompiler_dIr_dDispatch_ddispatchFuelOfBody = (fun (body : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIr) -> (v_Vuna_dCompiler_dIr_dDispatch_ddispatchFuelBase + (2 * (Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirSize body))))

# 175 "Vuna/Compiler/Ir/Dispatch.vuna"
let v_Vuna_dCompiler_dIr_dDispatch_ddispatchDef = (fun (mc0 : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrDef) -> (match mc0 with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrDef_IrDef (dtb__84, dtb__85, dtb__86, dtb__87, dtb__88, dtb__89, dtb__90, dtb__91) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrDef_IrDef (dtb__84, dtb__85, dtb__86, dtb__87, ((v_Vuna_dCompiler_dIr_dDispatch_ddispatch (v_Vuna_dCompiler_dIr_dDispatch_ddispatchFuelOfBody dtb__88)) dtb__88), dtb__89, dtb__90, dtb__91))
  | _ -> mc0
))

# 180 "Vuna/Compiler/Ir/Dispatch.vuna"
let v_Vuna_dCompiler_dIr_dDispatch_ddispatchGroup = (fun (mc0 : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrGroup) -> (match mc0 with
  | { Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrGroup_irGroupIsRec = dtb__92; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrGroup_irGroupDefs = dtb__93 } -> { Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrGroup_irGroupIsRec = dtb__92; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrGroup_irGroupDefs = ((Base_dData_dList.v_Base_dData_dList_dmap v_Vuna_dCompiler_dIr_dDispatch_ddispatchDef) dtb__93) }
  | _ -> failwith "DT: impossible branch"
))

# 183 "Vuna/Compiler/Ir/Dispatch.vuna"
let v_Vuna_dCompiler_dIr_dDispatch_ddispatchEntry = (fun (e : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrEntry) -> { Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrEntry_irEntryShow = ((v_Vuna_dCompiler_dIr_dDispatch_ddispatch (v_Vuna_dCompiler_dIr_dDispatch_ddispatchFuelOfBody (e).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrEntry_irEntryShow)) (e).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrEntry_irEntryShow); Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrEntry_irEntryMain = (e).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrEntry_irEntryMain; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrEntry_irEntryIsAction = (e).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrEntry_irEntryIsAction; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrEntry_irEntryRunMain = (e).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrEntry_irEntryRunMain; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrEntry_irEntryHandlers = (e).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrEntry_irEntryHandlers; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrEntry_irEntryRowTags = (e).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrEntry_irEntryRowTags })

# 193 "Vuna/Compiler/Ir/Dispatch.vuna"
let v_Vuna_dCompiler_dIr_dDispatch_ddispatchEntryM = (fun (mc0 : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrEntry Base_dData_dMaybe.t_Base_dData_dMaybe_dMaybe) -> (match mc0 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__94) -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ((v_Vuna_dCompiler_dIr_dDispatch_ddispatchEntry dtb__94)))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 198 "Vuna/Compiler/Ir/Dispatch.vuna"
let v_Vuna_dCompiler_dIr_dDispatch_ddispatchIdsUnit = (fun (u : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrUnit) -> { Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrUnit_irUnitTyDecls = (u).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrUnit_irUnitTyDecls; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrUnit_irUnitGroups = ((Base_dData_dList.v_Base_dData_dList_dmap v_Vuna_dCompiler_dIr_dDispatch_ddispatchGroup) (u).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrUnit_irUnitGroups); Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrUnit_irUnitHasListFamily = (u).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrUnit_irUnitHasListFamily; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrUnit_irUnitTypeRefs = (u).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrUnit_irUnitTypeRefs; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrUnit_irUnitEntry = (v_Vuna_dCompiler_dIr_dDispatch_ddispatchEntryM (u).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrUnit_irUnitEntry) })
