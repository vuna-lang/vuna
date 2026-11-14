open Vuna_runtime
type 'a0 t_Vuna_dCompiler_dNative_dModule_dNRes = C_Vuna_dCompiler_dNative_dModule_dNRes_NOk of ('a0) | C_Vuna_dCompiler_dNative_dModule_dNRes_NFail of (Vuna_dCompiler_dNative_dModel.t_Vuna_dCompiler_dNative_dModel_dNativeErr)
and t_Vuna_dCompiler_dNative_dModule_dFGen = { f_Vuna_dCompiler_dNative_dModule_dFGen_fgDefs : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrDef Base_dList.t_Base_dList_dList; f_Vuna_dCompiler_dNative_dModule_dFGen_fgPool : (string, string) Base_dPair.t_Base_dPair_dPair Base_dList.t_Base_dList_dList; f_Vuna_dCompiler_dNative_dModule_dFGen_fgSlots : (Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrBinder, int) Base_dPair.t_Base_dPair_dPair Base_dList.t_Base_dList_dList; f_Vuna_dCompiler_dNative_dModule_dFGen_fgNextSlot : int; f_Vuna_dCompiler_dNative_dModule_dFGen_fgNextLabel : int }

# 38 "Vuna/Compiler/Native/Module.vuna"
let v_Vuna_dCompiler_dNative_dModule_dnbind = (fun mc0 mc1 -> (match mc0 with
  | C_Vuna_dCompiler_dNative_dModule_dNRes_NFail (dtb__0) -> (C_Vuna_dCompiler_dNative_dModule_dNRes_NFail (dtb__0))
  | C_Vuna_dCompiler_dNative_dModule_dNRes_NOk (dtb__1) -> (mc1 dtb__1)
  | _ -> failwith "DT: impossible branch"
))

# 42 "Vuna/Compiler/Native/Module.vuna"
let v_Vuna_dCompiler_dNative_dModule_dunsupported = (fun msg -> (C_Vuna_dCompiler_dNative_dModule_dNRes_NFail ((Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dNativeErr_NativeUnsupported (msg)))))

# 45 "Vuna/Compiler/Native/Module.vuna"
let v_Vuna_dCompiler_dNative_dModule_dinternal = (fun msg -> (C_Vuna_dCompiler_dNative_dModule_dNRes_NFail ((Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dNativeErr_NativeInternal (msg)))))

# 58 "Vuna/Compiler/Native/Module.vuna"
let v_Vuna_dCompiler_dNative_dModule_dfreshSlot = (fun st -> ((fun slot -> ((fun st1 -> { Base_dPair.f_Base_dPair_dPair_first = slot; Base_dPair.f_Base_dPair_dPair_second = st1 }) { st with f_Vuna_dCompiler_dNative_dModule_dFGen_fgNextSlot = ((st).f_Vuna_dCompiler_dNative_dModule_dFGen_fgNextSlot + 1) })) (st).f_Vuna_dCompiler_dNative_dModule_dFGen_fgNextSlot))

# 65 "Vuna/Compiler/Native/Module.vuna"
let v_Vuna_dCompiler_dNative_dModule_dfreshLabel = (fun st -> ((fun label -> ((fun st1 -> { Base_dPair.f_Base_dPair_dPair_first = label; Base_dPair.f_Base_dPair_dPair_second = st1 }) { st with f_Vuna_dCompiler_dNative_dModule_dFGen_fgNextLabel = ((st).f_Vuna_dCompiler_dNative_dModule_dFGen_fgNextLabel + 1) })) (Vuna_dCompiler_dNative_dAbi.v_Vuna_dCompiler_dNative_dAbi_dnativeJumpLabel (st).f_Vuna_dCompiler_dNative_dModule_dFGen_fgNextLabel)))

# 72 "Vuna/Compiler/Native/Module.vuna"
let v_Vuna_dCompiler_dNative_dModule_dstoreSlot = (fun slot -> (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dInstr_IMov ((Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dOperand_OpMem (Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dReg_Rbp, (Vuna_dCompiler_dNative_dAbi.v_Vuna_dCompiler_dNative_dAbi_dnativeSlotOff slot))), (Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dOperand_OpReg (Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dReg_Rax)))), Base_dList.C_Base_dList_dList_Nil)))

# 75 "Vuna/Compiler/Native/Module.vuna"
let v_Vuna_dCompiler_dNative_dModule_dloadSlot = (fun slot -> (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dInstr_IMov ((Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dOperand_OpReg (Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dReg_Rax)), (Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dOperand_OpMem (Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dReg_Rbp, (Vuna_dCompiler_dNative_dAbi.v_Vuna_dCompiler_dNative_dAbi_dnativeSlotOff slot))))), Base_dList.C_Base_dList_dList_Nil)))

# 78 "Vuna/Compiler/Native/Module.vuna"
let v_Vuna_dCompiler_dNative_dModule_dloadReg = (fun r slot -> (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dInstr_IMov ((Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dOperand_OpReg (r)), (Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dOperand_OpMem (Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dReg_Rbp, (Vuna_dCompiler_dNative_dAbi.v_Vuna_dCompiler_dNative_dAbi_dnativeSlotOff slot))))), Base_dList.C_Base_dList_dList_Nil)))

# 84 "Vuna/Compiler/Native/Module.vuna"
let v_Vuna_dCompiler_dNative_dModule_dbNameEq = (fun mc0 mc1 -> (match mc0 with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrBName_IrBWild -> (match mc1 with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrBName_IrBWild -> true
  | _ -> false
)
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrBName_IrBNat (dtb__2) -> (match mc1 with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrBName_IrBNat (dtb__3) -> (dtb__2 = dtb__3)
  | _ -> false
)
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrBName_IrBArm (dtb__4) -> (match mc1 with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrBName_IrBArm (dtb__5) -> (dtb__4 = dtb__5)
  | _ -> false
)
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrBName_IrBUser (dtb__6) -> (match mc1 with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrBName_IrBUser (dtb__7) -> (dtb__6 = dtb__7)
  | _ -> false
)
  | _ -> failwith "DT: impossible branch"
))

# 91 "Vuna/Compiler/Native/Module.vuna"
let v_Vuna_dCompiler_dNative_dModule_dbinderEq = (fun a b -> (if ((v_Vuna_dCompiler_dNative_dModule_dbNameEq (a).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrBinder_irBinderName) (b).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrBinder_irBinderName) then (((Base_dEq.v_Base_dEq_deq Base_dEq.v_Eq_uBase_uBool_uBool) (a).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrBinder_irBinderErased) (b).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrBinder_irBinderErased) else false))

# 94 "Vuna/Compiler/Native/Module.vuna"
let rec v_Vuna_dCompiler_dNative_dModule_dlookupBinder = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__8, dtb__9) -> (if ((v_Vuna_dCompiler_dNative_dModule_dbinderEq mc0) (Base_dPair.v_Base_dPair_dfirstOf dtb__8)) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((Base_dPair.v_Base_dPair_dsecondOf dtb__8))) else ((v_Vuna_dCompiler_dNative_dModule_dlookupBinder mc0) dtb__9))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 99 "Vuna/Compiler/Native/Module.vuna"
let v_Vuna_dCompiler_dNative_dModule_dpushBinder = (fun b slot st -> { st with f_Vuna_dCompiler_dNative_dModule_dFGen_fgSlots = (Base_dList.C_Base_dList_dList_Cons ({ Base_dPair.f_Base_dPair_dPair_first = b; Base_dPair.f_Base_dPair_dPair_second = slot }, (st).f_Vuna_dCompiler_dNative_dModule_dFGen_fgSlots)) })

# 102 "Vuna/Compiler/Native/Module.vuna"
let v_Vuna_dCompiler_dNative_dModule_disErasedBinder = (fun b -> (b).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrBinder_irBinderErased)

# 106 "Vuna/Compiler/Native/Module.vuna"
let v_Vuna_dCompiler_dNative_dModule_drestoreBinderScope = (fun st slots -> { st with f_Vuna_dCompiler_dNative_dModule_dFGen_fgSlots = slots })

# 109 "Vuna/Compiler/Native/Module.vuna"
let v_Vuna_dCompiler_dNative_dModule_druntimeBinders = (fun bs -> ((Base_dList.v_Base_dList_dfilter (fun b -> (Base_dBool.v_Base_dBool_dnot (v_Vuna_dCompiler_dNative_dModule_disErasedBinder b)))) bs))

# 115 "Vuna/Compiler/Native/Module.vuna"
let rec v_Vuna_dCompiler_dNative_dModule_dfindDef = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__10, dtb__11) -> (if ((Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirDefName dtb__10) = mc0) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__10)) else ((v_Vuna_dCompiler_dNative_dModule_dfindDef mc0) dtb__11))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 119 "Vuna/Compiler/Native/Module.vuna"
let rec v_Vuna_dCompiler_dNative_dModule_dmemStr = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__12, dtb__13) -> (if (mc0 = dtb__12) then true else ((v_Vuna_dCompiler_dNative_dModule_dmemStr mc0) dtb__13))
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 123 "Vuna/Compiler/Native/Module.vuna"
let rec v_Vuna_dCompiler_dNative_dModule_dcollectNeeded = (fun fuel work seen defs -> (if (fuel <= 0) then (Base_dList.v_Base_dList_dreverse seen) else (match work with
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dList.v_Base_dList_dreverse seen)
  | Base_dList.C_Base_dList_dList_Cons (dtb__14, dtb__15) -> (if ((v_Vuna_dCompiler_dNative_dModule_dmemStr dtb__14) seen) then ((((v_Vuna_dCompiler_dNative_dModule_dcollectNeeded (fuel - 1)) dtb__15) seen) defs) else (match ((v_Vuna_dCompiler_dNative_dModule_dfindDef dtb__14) defs) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((((v_Vuna_dCompiler_dNative_dModule_dcollectNeeded (fuel - 1)) dtb__15) (Base_dList.C_Base_dList_dList_Cons (dtb__14, seen))) defs)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__16) -> ((((v_Vuna_dCompiler_dNative_dModule_dcollectNeeded (fuel - 1)) ((Base_dList.v_Base_dList_dappend dtb__15) (Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirDefDeps dtb__16))) (Base_dList.C_Base_dList_dList_Cons (dtb__14, seen))) defs)
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
)))

# 136 "Vuna/Compiler/Native/Module.vuna"
let rec v_Vuna_dCompiler_dNative_dModule_dstrLitsOf = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrEffThunk (dtb__17, dtb__18, dtb__19, dtb__20, dtb__21) -> (v_Vuna_dCompiler_dNative_dModule_dstrLitsOf dtb__21)
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrConcatMany (dtb__22) -> ((Base_dList.v_Base_dList_dconcatMap v_Vuna_dCompiler_dNative_dModule_dstrLitsOf) dtb__22)
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrNatCase (dtb__23, dtb__24, dtb__25, dtb__26, dtb__27) -> ((Base_dList.v_Base_dList_dappend (v_Vuna_dCompiler_dNative_dModule_dstrLitsOf dtb__23)) ((Base_dList.v_Base_dList_dappend (v_Vuna_dCompiler_dNative_dModule_dstrLitsOfAltMaybe dtb__25)) ((Base_dList.v_Base_dList_dappend (v_Vuna_dCompiler_dNative_dModule_dstrLitsOfAltMaybe dtb__26)) (v_Vuna_dCompiler_dNative_dModule_dstrLitsOfAltMaybe dtb__27))))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCase (dtb__28, dtb__29) -> ((Base_dList.v_Base_dList_dappend (v_Vuna_dCompiler_dNative_dModule_dstrLitsOf dtb__28)) ((Base_dList.v_Base_dList_dconcatMap v_Vuna_dCompiler_dNative_dModule_dstrLitsOfAlt) dtb__29))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrIf (dtb__30, dtb__31, dtb__32) -> ((Base_dList.v_Base_dList_dappend (v_Vuna_dCompiler_dNative_dModule_dstrLitsOf dtb__30)) ((Base_dList.v_Base_dList_dappend (v_Vuna_dCompiler_dNative_dModule_dstrLitsOf dtb__31)) (v_Vuna_dCompiler_dNative_dModule_dstrLitsOf dtb__32)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (dtb__33, dtb__34) -> ((Base_dList.v_Base_dList_dappend (v_Vuna_dCompiler_dNative_dModule_dstrLitsOf dtb__33)) (v_Vuna_dCompiler_dNative_dModule_dstrLitsOf dtb__34))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLam (dtb__35, dtb__36) -> (v_Vuna_dCompiler_dNative_dModule_dstrLitsOf dtb__36)
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLet (dtb__37, dtb__38, dtb__39) -> ((Base_dList.v_Base_dList_dappend (v_Vuna_dCompiler_dNative_dModule_dstrLitsOf dtb__38)) (v_Vuna_dCompiler_dNative_dModule_dstrLitsOf dtb__39))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCast (dtb__40) -> (v_Vuna_dCompiler_dNative_dModule_dstrLitsOf dtb__40)
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRtApp (dtb__41, dtb__42) -> ((Base_dList.v_Base_dList_dconcatMap v_Vuna_dCompiler_dNative_dModule_dstrLitsOf) dtb__42)
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRecUpd (dtb__43, dtb__44, dtb__45) -> ((Base_dList.v_Base_dList_dappend (v_Vuna_dCompiler_dNative_dModule_dstrLitsOf dtb__43)) ((Base_dList.v_Base_dList_dconcatMap v_Vuna_dCompiler_dNative_dModule_dstrLitsOfField) dtb__45))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrProj (dtb__46, dtb__47, dtb__48) -> (v_Vuna_dCompiler_dNative_dModule_dstrLitsOf dtb__46)
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRecord (dtb__49, dtb__50) -> ((Base_dList.v_Base_dList_dconcatMap v_Vuna_dCompiler_dNative_dModule_dstrLitsOfField) dtb__50)
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCtor (dtb__51, dtb__52, dtb__53) -> ((Base_dList.v_Base_dList_dconcatMap v_Vuna_dCompiler_dNative_dModule_dstrLitsOf) dtb__53)
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrStr (dtb__54) -> (Base_dList.C_Base_dList_dList_Cons (dtb__54, Base_dList.C_Base_dList_dList_Nil))
  | _ -> Base_dList.C_Base_dList_dList_Nil
))
# 156 "Vuna/Compiler/Native/Module.vuna"
and v_Vuna_dCompiler_dNative_dModule_dstrLitsOfField = (fun p -> (v_Vuna_dCompiler_dNative_dModule_dstrLitsOf (Base_dPair.v_Base_dPair_dsecondOf p)))
# 159 "Vuna/Compiler/Native/Module.vuna"
and v_Vuna_dCompiler_dNative_dModule_dstrLitsOfAlt = (fun alt -> (v_Vuna_dCompiler_dNative_dModule_dstrLitsOf (Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirAltBodyOf alt)))
# 162 "Vuna/Compiler/Native/Module.vuna"
and v_Vuna_dCompiler_dNative_dModule_dstrLitsOfAltMaybe = (fun mc0 -> (match mc0 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__55) -> (v_Vuna_dCompiler_dNative_dModule_dstrLitsOfAlt dtb__55)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 166 "Vuna/Compiler/Native/Module.vuna"
let v_Vuna_dCompiler_dNative_dModule_dstrLitsOfDef = (fun d -> (match (Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirDefBody d) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dList.C_Base_dList_dList_Nil
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__56) -> (v_Vuna_dCompiler_dNative_dModule_dstrLitsOf dtb__56)
  | _ -> failwith "DT: impossible branch"
))

# 171 "Vuna/Compiler/Native/Module.vuna"
let v_Vuna_dCompiler_dNative_dModule_daddLit = (fun pool s -> (if ((v_Vuna_dCompiler_dNative_dModule_dmemStr s) ((Base_dList.v_Base_dList_dmap (fun p -> (Base_dPair.v_Base_dPair_dfirstOf p))) pool)) then pool else ((Base_dList.v_Base_dList_dappend pool) (Base_dList.C_Base_dList_dList_Cons ({ Base_dPair.f_Base_dPair_dPair_first = s; Base_dPair.f_Base_dPair_dPair_second = (Vuna_dCompiler_dNative_dAbi.v_Vuna_dCompiler_dNative_dAbi_dnativeStrLitLabel (Base_dList.v_Base_dList_dlength pool)) }, Base_dList.C_Base_dList_dList_Nil)))))

# 176 "Vuna/Compiler/Native/Module.vuna"
let v_Vuna_dCompiler_dNative_dModule_dpoolOfDefs = (fun defs -> (((Base_dList.v_Base_dList_dfoldl v_Vuna_dCompiler_dNative_dModule_daddLit) Base_dList.C_Base_dList_dList_Nil) ((Base_dList.v_Base_dList_dconcatMap v_Vuna_dCompiler_dNative_dModule_dstrLitsOfDef) defs)))

# 179 "Vuna/Compiler/Native/Module.vuna"
let rec v_Vuna_dCompiler_dNative_dModule_dpoolLabelOf = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__57, dtb__58) -> (if ((Base_dPair.v_Base_dPair_dfirstOf dtb__57) = mc0) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((Base_dPair.v_Base_dPair_dsecondOf dtb__57))) else ((v_Vuna_dCompiler_dNative_dModule_dpoolLabelOf mc0) dtb__58))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 183 "Vuna/Compiler/Native/Module.vuna"
let rec v_Vuna_dCompiler_dNative_dModule_dpoolItems = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__59, dtb__60) -> (match dtb__59 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__61; Base_dPair.f_Base_dPair_dPair_second = dtb__62 } -> (Base_dList.C_Base_dList_dList_Cons ({ Vuna_dCompiler_dNative_dModel.f_Vuna_dCompiler_dNative_dModel_dNativeStrLit_nsLabel = dtb__62; Vuna_dCompiler_dNative_dModel.f_Vuna_dCompiler_dNative_dModel_dNativeStrLit_nsText = dtb__61 }, (v_Vuna_dCompiler_dNative_dModule_dpoolItems dtb__60)))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 190 "Vuna/Compiler/Native/Module.vuna"
let rec v_Vuna_dCompiler_dNative_dModule_dloadArgRegs = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__63, dtb__64) -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__65, dtb__66) -> ((Base_dList.v_Base_dList_dappend ((v_Vuna_dCompiler_dNative_dModule_dloadReg dtb__63) dtb__65)) ((v_Vuna_dCompiler_dNative_dModule_dloadArgRegs dtb__64) dtb__66))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> Base_dList.C_Base_dList_dList_Nil
)
  | _ -> failwith "DT: impossible branch"
))

# 198 "Vuna/Compiler/Native/Module.vuna"
let rec v_Vuna_dCompiler_dNative_dModule_dargRegAtIn = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__67, dtb__68) -> (if (mc0 = 0) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__67)) else ((v_Vuna_dCompiler_dNative_dModule_dargRegAtIn (mc0 - 1)) dtb__68))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 195 "Vuna/Compiler/Native/Module.vuna"
let v_Vuna_dCompiler_dNative_dModule_dargRegAt = (fun i -> ((v_Vuna_dCompiler_dNative_dModule_dargRegAtIn i) Vuna_dCompiler_dNative_dAbi.v_Vuna_dCompiler_dNative_dAbi_dnativeArgRegs))

# 381 "Vuna/Compiler/Native/Module.vuna"
let rec v_Vuna_dCompiler_dNative_dModule_dflattenApp = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (dtb__69, dtb__70) -> ((fun p -> { Base_dPair.f_Base_dPair_dPair_first = (Base_dPair.v_Base_dPair_dfirstOf p); Base_dPair.f_Base_dPair_dPair_second = ((Base_dList.v_Base_dList_dappend (Base_dPair.v_Base_dPair_dsecondOf p)) (Base_dList.C_Base_dList_dList_Cons (dtb__70, Base_dList.C_Base_dList_dList_Nil))) }) (v_Vuna_dCompiler_dNative_dModule_dflattenApp dtb__69))
  | _ -> { Base_dPair.f_Base_dPair_dPair_first = mc0; Base_dPair.f_Base_dPair_dPair_second = Base_dList.C_Base_dList_dList_Nil }
))

# 438 "Vuna/Compiler/Native/Module.vuna"
let v_Vuna_dCompiler_dNative_dModule_dhasNatBranch = (fun mc0 mc1 -> (match mc0 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (match mc1 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> false
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__71) -> true
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__72) -> true
  | _ -> failwith "DT: impossible branch"
))

# 205 "Vuna/Compiler/Native/Module.vuna"
let rec v_Vuna_dCompiler_dNative_dModule_dgenArgs = (fun mc0 mc1 mc2 -> (match mc2 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__73, dtb__74) -> (if (mc0 <= 0) then (v_Vuna_dCompiler_dNative_dModule_dinternal "native codegen fuel exhausted") else ((v_Vuna_dCompiler_dNative_dModule_dnbind (((v_Vuna_dCompiler_dNative_dModule_dgenExpr (mc0 - 1)) mc1) dtb__73)) (fun p -> ((fun st1 -> ((fun slotP -> ((fun slot -> ((fun st2 -> ((v_Vuna_dCompiler_dNative_dModule_dnbind (((v_Vuna_dCompiler_dNative_dModule_dgenArgs (mc0 - 1)) st2) dtb__74)) (fun q -> ((fun qInstrs -> ((fun qSlots -> ((fun st3 -> (C_Vuna_dCompiler_dNative_dModule_dNRes_NOk ({ Base_dPair.f_Base_dPair_dPair_first = ((Base_dList.v_Base_dList_dappend (Base_dPair.v_Base_dPair_dfirstOf p)) ((Base_dList.v_Base_dList_dappend (v_Vuna_dCompiler_dNative_dModule_dstoreSlot slot)) qInstrs)); Base_dPair.f_Base_dPair_dPair_second = { Base_dPair.f_Base_dPair_dPair_first = (Base_dList.C_Base_dList_dList_Cons (slot, qSlots)); Base_dPair.f_Base_dPair_dPair_second = st3 } }))) (Base_dPair.v_Base_dPair_dsecondOf (Base_dPair.v_Base_dPair_dsecondOf q)))) (Base_dPair.v_Base_dPair_dfirstOf (Base_dPair.v_Base_dPair_dsecondOf q)))) (Base_dPair.v_Base_dPair_dfirstOf q))))) (Base_dPair.v_Base_dPair_dsecondOf slotP))) (Base_dPair.v_Base_dPair_dfirstOf slotP))) (v_Vuna_dCompiler_dNative_dModule_dfreshSlot st1))) (Base_dPair.v_Base_dPair_dsecondOf p)))))
  | Base_dList.C_Base_dList_dList_Nil -> (C_Vuna_dCompiler_dNative_dModule_dNRes_NOk ({ Base_dPair.f_Base_dPair_dPair_first = Base_dList.C_Base_dList_dList_Nil; Base_dPair.f_Base_dPair_dPair_second = { Base_dPair.f_Base_dPair_dPair_first = Base_dList.C_Base_dList_dList_Nil; Base_dPair.f_Base_dPair_dPair_second = mc1 } }))
  | _ -> failwith "DT: impossible branch"
))
# 222 "Vuna/Compiler/Native/Module.vuna"
and v_Vuna_dCompiler_dNative_dModule_dgenSaturatedCall = (fun fuel st label args -> (if (fuel <= 0) then (v_Vuna_dCompiler_dNative_dModule_dinternal "native codegen fuel exhausted") else (if ((Base_dList.v_Base_dList_dlength args) > Vuna_dCompiler_dNative_dAbi.v_Vuna_dCompiler_dNative_dAbi_dnativeMaxArgs) then (v_Vuna_dCompiler_dNative_dModule_dunsupported "native target: functions with more than 6 arguments are not supported yet") else ((v_Vuna_dCompiler_dNative_dModule_dnbind (((v_Vuna_dCompiler_dNative_dModule_dgenArgs (fuel - 1)) st) args)) (fun p -> ((fun slots -> ((fun st1 -> (C_Vuna_dCompiler_dNative_dModule_dNRes_NOk ({ Base_dPair.f_Base_dPair_dPair_first = ((Base_dList.v_Base_dList_dappend (Base_dPair.v_Base_dPair_dfirstOf p)) ((Base_dList.v_Base_dList_dappend ((v_Vuna_dCompiler_dNative_dModule_dloadArgRegs Vuna_dCompiler_dNative_dAbi.v_Vuna_dCompiler_dNative_dAbi_dnativeArgRegs) slots)) (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dInstr_ICall (label)), Base_dList.C_Base_dList_dList_Nil)))); Base_dPair.f_Base_dPair_dPair_second = st1 }))) (Base_dPair.v_Base_dPair_dsecondOf (Base_dPair.v_Base_dPair_dsecondOf p)))) (Base_dPair.v_Base_dPair_dfirstOf (Base_dPair.v_Base_dPair_dsecondOf p))))))))
# 231 "Vuna/Compiler/Native/Module.vuna"
and v_Vuna_dCompiler_dNative_dModule_dgenGlobalCall = (fun fuel st name args -> (if (fuel <= 0) then (v_Vuna_dCompiler_dNative_dModule_dinternal "native codegen fuel exhausted") else (match ((v_Vuna_dCompiler_dNative_dModule_dfindDef name) (st).f_Vuna_dCompiler_dNative_dModule_dFGen_fgDefs) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (v_Vuna_dCompiler_dNative_dModule_dinternal ("undefined global in native codegen: " ^ name))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__75) -> ((fun arity -> (if ((Base_dList.v_Base_dList_dlength args) <> arity) then (v_Vuna_dCompiler_dNative_dModule_dunsupported "native target: partial application is not supported yet") else ((((v_Vuna_dCompiler_dNative_dModule_dgenSaturatedCall (fuel - 1)) st) (Vuna_dCompiler_dNative_dAbi.v_Vuna_dCompiler_dNative_dAbi_dnativeFuncLabel name)) args))) (Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirDefArity dtb__75))
  | _ -> failwith "DT: impossible branch"
)))
# 241 "Vuna/Compiler/Native/Module.vuna"
and v_Vuna_dCompiler_dNative_dModule_dgenNatSuccCall = (fun fuel st arg -> (if (fuel <= 0) then (v_Vuna_dCompiler_dNative_dModule_dinternal "native codegen fuel exhausted") else ((v_Vuna_dCompiler_dNative_dModule_dnbind (((v_Vuna_dCompiler_dNative_dModule_dgenExpr (fuel - 1)) st) arg)) (fun p -> (C_Vuna_dCompiler_dNative_dModule_dNRes_NOk ({ Base_dPair.f_Base_dPair_dPair_first = ((Base_dList.v_Base_dList_dappend (Base_dPair.v_Base_dPair_dfirstOf p)) (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dInstr_IMov ((Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dOperand_OpReg (Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dReg_Rdi)), (Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dOperand_OpReg (Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dReg_Rax)))), (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dInstr_ICall ((Vuna_dCompiler_dNative_dAbi.v_Vuna_dCompiler_dNative_dAbi_dnativeRtLabel "nat_succ"))), Base_dList.C_Base_dList_dList_Nil))))); Base_dPair.f_Base_dPair_dPair_second = (Base_dPair.v_Base_dPair_dsecondOf p) }))))))
# 247 "Vuna/Compiler/Native/Module.vuna"
and v_Vuna_dCompiler_dNative_dModule_dgenRtApp = (fun fuel st sym args -> (if (fuel <= 0) then (v_Vuna_dCompiler_dNative_dModule_dinternal "native codegen fuel exhausted") else (if (sym = "&&") then ((((v_Vuna_dCompiler_dNative_dModule_dgenBoolChain (fuel - 1)) st) args) true) else (if (sym = "||") then ((((v_Vuna_dCompiler_dNative_dModule_dgenBoolChain (fuel - 1)) st) args) false) else (match (Vuna_dCompiler_dNative_dRuntime.v_Vuna_dCompiler_dNative_dRuntime_dnativeRtTarget sym) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (v_Vuna_dCompiler_dNative_dModule_dunsupported (String.concat "" ["native target: runtime symbol `"; sym; "` is not supported yet"]))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__76) -> (if ((Base_dList.v_Base_dList_dlength args) <> (Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirInlineArity sym)) then (v_Vuna_dCompiler_dNative_dModule_dinternal ("runtime symbol arity mismatch: " ^ sym)) else ((((v_Vuna_dCompiler_dNative_dModule_dgenSaturatedCall (fuel - 1)) st) dtb__76) args))
  | _ -> failwith "DT: impossible branch"
)))))
# 259 "Vuna/Compiler/Native/Module.vuna"
and v_Vuna_dCompiler_dNative_dModule_dgenRtValueCall = (fun fuel st sym args -> (if (fuel <= 0) then (v_Vuna_dCompiler_dNative_dModule_dinternal "native codegen fuel exhausted") else ((fun arity -> (if (if (sym = "@vuna@obs@span") then true else (sym = "@vuna@obs@spanLab")) then (v_Vuna_dCompiler_dNative_dModule_dunsupported "native target: obs spans need closures (not supported yet); leaf obs primitives (level/log/counter/mark/sample) are no-op stubs") else (if (arity <= 0) then (v_Vuna_dCompiler_dNative_dModule_dunsupported "native target: runtime function values are not supported yet") else (if ((Base_dList.v_Base_dList_dlength args) <> arity) then (v_Vuna_dCompiler_dNative_dModule_dunsupported "native target: partial application of runtime functions is not supported yet") else (match (Vuna_dCompiler_dNative_dRuntime.v_Vuna_dCompiler_dNative_dRuntime_dnativeRtTarget sym) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (v_Vuna_dCompiler_dNative_dModule_dunsupported (String.concat "" ["native target: runtime symbol `"; sym; "` is not supported yet"]))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__77) -> ((((v_Vuna_dCompiler_dNative_dModule_dgenSaturatedCall (fuel - 1)) st) dtb__77) args)
  | _ -> failwith "DT: impossible branch"
))))) (Vuna_dCompiler_dNative_dRuntime.v_Vuna_dCompiler_dNative_dRuntime_dnativeRtValueArity sym))))
# 274 "Vuna/Compiler/Native/Module.vuna"
and v_Vuna_dCompiler_dNative_dModule_dgenConcatMany = (fun fuel st parts -> (if (fuel <= 0) then (v_Vuna_dCompiler_dNative_dModule_dinternal "native codegen fuel exhausted") else ((fun nd_uscrut3 -> (match nd_uscrut3 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__78, dtb__79) -> (match dtb__79 with
  | Base_dList.C_Base_dList_dList_Nil -> (((v_Vuna_dCompiler_dNative_dModule_dgenExpr (fuel - 1)) st) dtb__78)
  | _ -> ((v_Vuna_dCompiler_dNative_dModule_dnbind (((v_Vuna_dCompiler_dNative_dModule_dgenExpr (fuel - 1)) st) dtb__78)) (fun p -> ((fun slotP -> ((fun slot -> ((fun st1 -> ((v_Vuna_dCompiler_dNative_dModule_dnbind ((((v_Vuna_dCompiler_dNative_dModule_dgenConcatRest (fuel - 1)) st1) slot) dtb__79)) (fun q -> (C_Vuna_dCompiler_dNative_dModule_dNRes_NOk ({ Base_dPair.f_Base_dPair_dPair_first = ((Base_dList.v_Base_dList_dappend (Base_dPair.v_Base_dPair_dfirstOf p)) ((Base_dList.v_Base_dList_dappend (v_Vuna_dCompiler_dNative_dModule_dstoreSlot slot)) (Base_dPair.v_Base_dPair_dfirstOf q))); Base_dPair.f_Base_dPair_dPair_second = (Base_dPair.v_Base_dPair_dsecondOf q) }))))) (Base_dPair.v_Base_dPair_dsecondOf slotP))) (Base_dPair.v_Base_dPair_dfirstOf slotP))) (v_Vuna_dCompiler_dNative_dModule_dfreshSlot (Base_dPair.v_Base_dPair_dsecondOf p)))))
)
  | Base_dList.C_Base_dList_dList_Nil -> (v_Vuna_dCompiler_dNative_dModule_dinternal "empty string concatenation in native codegen")
  | _ -> failwith "DT: impossible branch"
)) parts)))
# 288 "Vuna/Compiler/Native/Module.vuna"
and v_Vuna_dCompiler_dNative_dModule_dgenConcatRest = (fun mc0 mc1 mc2 mc3 -> (match mc3 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__80, dtb__81) -> (if (mc0 <= 0) then (v_Vuna_dCompiler_dNative_dModule_dinternal "native codegen fuel exhausted") else ((v_Vuna_dCompiler_dNative_dModule_dnbind (((v_Vuna_dCompiler_dNative_dModule_dgenExpr (mc0 - 1)) mc1) dtb__80)) (fun p -> ((v_Vuna_dCompiler_dNative_dModule_dnbind ((((v_Vuna_dCompiler_dNative_dModule_dgenConcatRest (mc0 - 1)) (Base_dPair.v_Base_dPair_dsecondOf p)) mc2) dtb__81)) (fun q -> (C_Vuna_dCompiler_dNative_dModule_dNRes_NOk ({ Base_dPair.f_Base_dPair_dPair_first = ((Base_dList.v_Base_dList_dappend (Base_dPair.v_Base_dPair_dfirstOf p)) ((Base_dList.v_Base_dList_dappend (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dInstr_IMov ((Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dOperand_OpReg (Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dReg_Rsi)), (Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dOperand_OpReg (Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dReg_Rax)))), Base_dList.C_Base_dList_dList_Nil))) ((Base_dList.v_Base_dList_dappend ((v_Vuna_dCompiler_dNative_dModule_dloadReg Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dReg_Rdi) mc2)) ((Base_dList.v_Base_dList_dappend (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dInstr_ICall ((Vuna_dCompiler_dNative_dAbi.v_Vuna_dCompiler_dNative_dAbi_dnativeRtLabel "str_concat"))), (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dInstr_IMov ((Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dOperand_OpMem (Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dReg_Rbp, (Vuna_dCompiler_dNative_dAbi.v_Vuna_dCompiler_dNative_dAbi_dnativeSlotOff mc2))), (Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dOperand_OpReg (Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dReg_Rax)))), Base_dList.C_Base_dList_dList_Nil))))) (Base_dPair.v_Base_dPair_dfirstOf q))))); Base_dPair.f_Base_dPair_dPair_second = (Base_dPair.v_Base_dPair_dsecondOf q) })))))))
  | Base_dList.C_Base_dList_dList_Nil -> (C_Vuna_dCompiler_dNative_dModule_dNRes_NOk ({ Base_dPair.f_Base_dPair_dPair_first = (v_Vuna_dCompiler_dNative_dModule_dloadSlot mc2); Base_dPair.f_Base_dPair_dPair_second = mc1 }))
  | _ -> failwith "DT: impossible branch"
))
# 295 "Vuna/Compiler/Native/Module.vuna"
and v_Vuna_dCompiler_dNative_dModule_dgenExpr = (fun fuel st ir -> (if (fuel <= 0) then (v_Vuna_dCompiler_dNative_dModule_dinternal "native codegen fuel exhausted") else ((fun nd_uscrut3 -> (match nd_uscrut3 with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrEffBind (dtb__82, dtb__83, dtb__84) -> (v_Vuna_dCompiler_dNative_dModule_dunsupported "native target: effect bindings are not supported yet")
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrEffThunk (dtb__85, dtb__86, dtb__87, dtb__88, dtb__89) -> (v_Vuna_dCompiler_dNative_dModule_dunsupported "native target: effect thunks are not supported yet")
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCase (dtb__90, dtb__91) -> (v_Vuna_dCompiler_dNative_dModule_dunsupported "native target: case is not supported yet")
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRecUpd (dtb__92, dtb__93, dtb__94) -> (v_Vuna_dCompiler_dNative_dModule_dunsupported "native target: record update is not supported yet")
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrProj (dtb__95, dtb__96, dtb__97) -> (v_Vuna_dCompiler_dNative_dModule_dunsupported "native target: record projection is not supported yet")
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRecord (dtb__98, dtb__99) -> (v_Vuna_dCompiler_dNative_dModule_dunsupported "native target: records are not supported yet")
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCtor (dtb__100, dtb__101, dtb__102) -> (v_Vuna_dCompiler_dNative_dModule_dunsupported "native target: data constructors are not supported yet")
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrFloatLit (dtb__103) -> (v_Vuna_dCompiler_dNative_dModule_dunsupported "native target: float literals are not supported yet")
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRt (dtb__104) -> (if (dtb__104 = "@vuna@obs@span") then (v_Vuna_dCompiler_dNative_dModule_dunsupported "native target: obs spans need closures (not supported yet); leaf obs primitives (level/log/counter/mark/sample) are no-op stubs") else (if (dtb__104 = "@vuna@obs@spanLab") then (v_Vuna_dCompiler_dNative_dModule_dunsupported "native target: obs spans need closures (not supported yet); leaf obs primitives (level/log/counter/mark/sample) are no-op stubs") else (v_Vuna_dCompiler_dNative_dModule_dunsupported "native target: runtime function values are not supported yet")))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLam (dtb__105, dtb__106) -> (v_Vuna_dCompiler_dNative_dModule_dunsupported "native target: lambdas are not supported yet")
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrNatCase (dtb__107, dtb__108, dtb__109, dtb__110, dtb__111) -> ((((((v_Vuna_dCompiler_dNative_dModule_dgenNatCase (fuel - 1)) st) dtb__107) dtb__109) dtb__110) dtb__111)
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrConcatMany (dtb__112) -> (((v_Vuna_dCompiler_dNative_dModule_dgenConcatMany (fuel - 1)) st) dtb__112)
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRtApp (dtb__113, dtb__114) -> ((((v_Vuna_dCompiler_dNative_dModule_dgenRtApp (fuel - 1)) st) dtb__113) dtb__114)
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (dtb__115, dtb__116) -> (((v_Vuna_dCompiler_dNative_dModule_dgenApp (fuel - 1)) st) ir)
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrIf (dtb__117, dtb__118, dtb__119) -> ((v_Vuna_dCompiler_dNative_dModule_dnbind (((v_Vuna_dCompiler_dNative_dModule_dgenExpr (fuel - 1)) st) dtb__117)) (fun p -> ((fun lElseP -> ((fun lElse -> ((fun st1 -> ((fun lEndP -> ((fun lEnd -> ((fun st2 -> ((v_Vuna_dCompiler_dNative_dModule_dnbind (((v_Vuna_dCompiler_dNative_dModule_dgenExpr (fuel - 1)) st2) dtb__118)) (fun pt -> ((v_Vuna_dCompiler_dNative_dModule_dnbind (((v_Vuna_dCompiler_dNative_dModule_dgenExpr (fuel - 1)) (Base_dPair.v_Base_dPair_dsecondOf pt)) dtb__119)) (fun pe -> ((fun body -> (C_Vuna_dCompiler_dNative_dModule_dNRes_NOk ({ Base_dPair.f_Base_dPair_dPair_first = body; Base_dPair.f_Base_dPair_dPair_second = (Base_dPair.v_Base_dPair_dsecondOf pe) }))) ((Base_dList.v_Base_dList_dappend (Base_dPair.v_Base_dPair_dfirstOf p)) ((Base_dList.v_Base_dList_dappend (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dInstr_ITest (Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dReg_Rax, Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dReg_Rax)), (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dInstr_IJcc ("je", lElse)), Base_dList.C_Base_dList_dList_Nil))))) ((Base_dList.v_Base_dList_dappend (Base_dPair.v_Base_dPair_dfirstOf pt)) ((Base_dList.v_Base_dList_dappend (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dInstr_IJmp (lEnd)), (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dInstr_ILabel (lElse)), Base_dList.C_Base_dList_dList_Nil))))) ((Base_dList.v_Base_dList_dappend (Base_dPair.v_Base_dPair_dfirstOf pe)) (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dInstr_ILabel (lEnd)), Base_dList.C_Base_dList_dList_Nil))))))))))))) (Base_dPair.v_Base_dPair_dsecondOf lEndP))) (Base_dPair.v_Base_dPair_dfirstOf lEndP))) (v_Vuna_dCompiler_dNative_dModule_dfreshLabel st1))) (Base_dPair.v_Base_dPair_dsecondOf lElseP))) (Base_dPair.v_Base_dPair_dfirstOf lElseP))) (v_Vuna_dCompiler_dNative_dModule_dfreshLabel (Base_dPair.v_Base_dPair_dsecondOf p)))))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLet (dtb__120, dtb__121, dtb__122) -> ((v_Vuna_dCompiler_dNative_dModule_dnbind (((v_Vuna_dCompiler_dNative_dModule_dgenExpr (fuel - 1)) st) dtb__121)) (fun p -> ((fun rbs -> ((fun st1 -> ((fun nd_uscrut10 -> (match nd_uscrut10 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__123, dtb__124) -> (match dtb__124 with
  | Base_dList.C_Base_dList_dList_Nil -> ((fun slotP -> ((fun slot -> ((fun st2 -> ((v_Vuna_dCompiler_dNative_dModule_dnbind (((v_Vuna_dCompiler_dNative_dModule_dgenExpr (fuel - 1)) (((v_Vuna_dCompiler_dNative_dModule_dpushBinder dtb__123) slot) st2)) dtb__122)) (fun q -> (C_Vuna_dCompiler_dNative_dModule_dNRes_NOk ({ Base_dPair.f_Base_dPair_dPair_first = ((Base_dList.v_Base_dList_dappend (Base_dPair.v_Base_dPair_dfirstOf p)) ((Base_dList.v_Base_dList_dappend (v_Vuna_dCompiler_dNative_dModule_dstoreSlot slot)) (Base_dPair.v_Base_dPair_dfirstOf q))); Base_dPair.f_Base_dPair_dPair_second = ((v_Vuna_dCompiler_dNative_dModule_drestoreBinderScope (Base_dPair.v_Base_dPair_dsecondOf q)) (st1).f_Vuna_dCompiler_dNative_dModule_dFGen_fgSlots) }))))) (Base_dPair.v_Base_dPair_dsecondOf slotP))) (Base_dPair.v_Base_dPair_dfirstOf slotP))) (v_Vuna_dCompiler_dNative_dModule_dfreshSlot st1))
  | _ -> (v_Vuna_dCompiler_dNative_dModule_dunsupported "native target: let with more than one runtime binder is not supported yet")
)
  | Base_dList.C_Base_dList_dList_Nil -> ((v_Vuna_dCompiler_dNative_dModule_dnbind (((v_Vuna_dCompiler_dNative_dModule_dgenExpr (fuel - 1)) st1) dtb__122)) (fun q -> (C_Vuna_dCompiler_dNative_dModule_dNRes_NOk ({ Base_dPair.f_Base_dPair_dPair_first = ((Base_dList.v_Base_dList_dappend (Base_dPair.v_Base_dPair_dfirstOf p)) (Base_dPair.v_Base_dPair_dfirstOf q)); Base_dPair.f_Base_dPair_dPair_second = (Base_dPair.v_Base_dPair_dsecondOf q) }))))
  | _ -> failwith "DT: impossible branch"
)) rbs)) (Base_dPair.v_Base_dPair_dsecondOf p))) (v_Vuna_dCompiler_dNative_dModule_druntimeBinders dtb__120))))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCast (dtb__125) -> (((v_Vuna_dCompiler_dNative_dModule_dgenExpr (fuel - 1)) st) dtb__125)
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrBool (dtb__126) -> (C_Vuna_dCompiler_dNative_dModule_dNRes_NOk ({ Base_dPair.f_Base_dPair_dPair_first = (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dInstr_IMov ((Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dOperand_OpReg (Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dReg_Rax)), (Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dOperand_OpImm ((if dtb__126 then 1 else 0))))), Base_dList.C_Base_dList_dList_Nil)); Base_dPair.f_Base_dPair_dPair_second = st }))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrStr (dtb__127) -> (match ((v_Vuna_dCompiler_dNative_dModule_dpoolLabelOf dtb__127) (st).f_Vuna_dCompiler_dNative_dModule_dFGen_fgPool) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (v_Vuna_dCompiler_dNative_dModule_dinternal "string literal missing from native pool")
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__128) -> (C_Vuna_dCompiler_dNative_dModule_dNRes_NOk ({ Base_dPair.f_Base_dPair_dPair_first = (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dInstr_ILea (Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dReg_Rax, dtb__128)), Base_dList.C_Base_dList_dList_Nil)); Base_dPair.f_Base_dPair_dPair_second = st }))
  | _ -> failwith "DT: impossible branch"
)
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrInt (dtb__129) -> (if (if (dtb__129 < ((0 - 4611686018427387903) - 1)) then true else (dtb__129 > 4611686018427387903)) then (v_Vuna_dCompiler_dNative_dModule_dunsupported "native target: integer literal outside the 63-bit range") else (C_Vuna_dCompiler_dNative_dModule_dNRes_NOk ({ Base_dPair.f_Base_dPair_dPair_first = (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dInstr_IMov ((Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dOperand_OpReg (Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dReg_Rax)), (Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dOperand_OpImm (dtb__129)))), Base_dList.C_Base_dList_dList_Nil)); Base_dPair.f_Base_dPair_dPair_second = st })))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrGlobal (dtb__130) -> (match ((v_Vuna_dCompiler_dNative_dModule_dfindDef dtb__130) (st).f_Vuna_dCompiler_dNative_dModule_dFGen_fgDefs) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (v_Vuna_dCompiler_dNative_dModule_dinternal ("undefined global in native codegen: " ^ dtb__130))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__131) -> (if ((Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirDefArity dtb__131) = 0) then (C_Vuna_dCompiler_dNative_dModule_dNRes_NOk ({ Base_dPair.f_Base_dPair_dPair_first = (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dInstr_ICall ((Vuna_dCompiler_dNative_dAbi.v_Vuna_dCompiler_dNative_dAbi_dnativeFuncLabel dtb__130))), Base_dList.C_Base_dList_dList_Nil)); Base_dPair.f_Base_dPair_dPair_second = st })) else (v_Vuna_dCompiler_dNative_dModule_dunsupported "native target: function values are not supported yet"))
  | _ -> failwith "DT: impossible branch"
)
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrVar (dtb__132) -> (match ((v_Vuna_dCompiler_dNative_dModule_dlookupBinder dtb__132) (st).f_Vuna_dCompiler_dNative_dModule_dFGen_fgSlots) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__133) -> (C_Vuna_dCompiler_dNative_dModule_dNRes_NOk ({ Base_dPair.f_Base_dPair_dPair_first = (v_Vuna_dCompiler_dNative_dModule_dloadSlot dtb__133); Base_dPair.f_Base_dPair_dPair_second = st }))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (v_Vuna_dCompiler_dNative_dModule_dinternal "unbound runtime binder in native codegen")
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) ir)))
# 367 "Vuna/Compiler/Native/Module.vuna"
and v_Vuna_dCompiler_dNative_dModule_dgenBoolChain = (fun fuel st args isAnd -> (if (fuel <= 0) then (v_Vuna_dCompiler_dNative_dModule_dinternal "native codegen fuel exhausted") else ((fun nd_uscrut4 -> (match nd_uscrut4 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__134, dtb__135) -> (match dtb__135 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__136, dtb__137) -> (match dtb__137 with
  | Base_dList.C_Base_dList_dList_Nil -> ((v_Vuna_dCompiler_dNative_dModule_dnbind (((v_Vuna_dCompiler_dNative_dModule_dgenExpr (fuel - 1)) st) dtb__134)) (fun p -> ((fun lEndP -> ((fun lEnd -> ((fun st1 -> ((fun cond -> ((v_Vuna_dCompiler_dNative_dModule_dnbind (((v_Vuna_dCompiler_dNative_dModule_dgenExpr (fuel - 1)) st1) dtb__136)) (fun q -> (C_Vuna_dCompiler_dNative_dModule_dNRes_NOk ({ Base_dPair.f_Base_dPair_dPair_first = ((Base_dList.v_Base_dList_dappend (Base_dPair.v_Base_dPair_dfirstOf p)) ((Base_dList.v_Base_dList_dappend (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dInstr_ITest (Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dReg_Rax, Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dReg_Rax)), (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dInstr_IJcc (cond, lEnd)), Base_dList.C_Base_dList_dList_Nil))))) ((Base_dList.v_Base_dList_dappend (Base_dPair.v_Base_dPair_dfirstOf q)) (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dInstr_ILabel (lEnd)), Base_dList.C_Base_dList_dList_Nil))))); Base_dPair.f_Base_dPair_dPair_second = (Base_dPair.v_Base_dPair_dsecondOf q) }))))) (if isAnd then "je" else "jne"))) (Base_dPair.v_Base_dPair_dsecondOf lEndP))) (Base_dPair.v_Base_dPair_dfirstOf lEndP))) (v_Vuna_dCompiler_dNative_dModule_dfreshLabel (Base_dPair.v_Base_dPair_dsecondOf p)))))
  | _ -> (v_Vuna_dCompiler_dNative_dModule_dinternal "`&&`/`||` must have exactly two arguments")
)
  | _ -> (v_Vuna_dCompiler_dNative_dModule_dinternal "`&&`/`||` must have exactly two arguments")
)
  | _ -> (v_Vuna_dCompiler_dNative_dModule_dinternal "`&&`/`||` must have exactly two arguments")
)) args)))
# 388 "Vuna/Compiler/Native/Module.vuna"
and v_Vuna_dCompiler_dNative_dModule_dgenLamApp = (fun fuel st b arg body -> (if (fuel <= 0) then (v_Vuna_dCompiler_dNative_dModule_dinternal "native codegen fuel exhausted") else ((v_Vuna_dCompiler_dNative_dModule_dnbind (((v_Vuna_dCompiler_dNative_dModule_dgenExpr (fuel - 1)) st) arg)) (fun p -> ((fun slotP -> ((fun slot -> ((fun st1 -> ((v_Vuna_dCompiler_dNative_dModule_dnbind (((v_Vuna_dCompiler_dNative_dModule_dgenExpr (fuel - 1)) (((v_Vuna_dCompiler_dNative_dModule_dpushBinder b) slot) st1)) body)) (fun q -> (C_Vuna_dCompiler_dNative_dModule_dNRes_NOk ({ Base_dPair.f_Base_dPair_dPair_first = ((Base_dList.v_Base_dList_dappend (Base_dPair.v_Base_dPair_dfirstOf p)) ((Base_dList.v_Base_dList_dappend (v_Vuna_dCompiler_dNative_dModule_dstoreSlot slot)) (Base_dPair.v_Base_dPair_dfirstOf q))); Base_dPair.f_Base_dPair_dPair_second = ((v_Vuna_dCompiler_dNative_dModule_drestoreBinderScope (Base_dPair.v_Base_dPair_dsecondOf q)) (st).f_Vuna_dCompiler_dNative_dModule_dFGen_fgSlots) }))))) (Base_dPair.v_Base_dPair_dsecondOf slotP))) (Base_dPair.v_Base_dPair_dfirstOf slotP))) (v_Vuna_dCompiler_dNative_dModule_dfreshSlot (Base_dPair.v_Base_dPair_dsecondOf p)))))))
# 398 "Vuna/Compiler/Native/Module.vuna"
and v_Vuna_dCompiler_dNative_dModule_dgenApp = (fun fuel st ir -> (if (fuel <= 0) then (v_Vuna_dCompiler_dNative_dModule_dinternal "native codegen fuel exhausted") else (match (v_Vuna_dCompiler_dNative_dModule_dflattenApp ir) with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__138; Base_dPair.f_Base_dPair_dPair_second = dtb__139 } -> (match dtb__138 with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrGlobal (dtb__140) -> ((((v_Vuna_dCompiler_dNative_dModule_dgenGlobalCall (fuel - 1)) st) dtb__140) dtb__139)
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRt (dtb__141) -> (if (dtb__141 = Vuna_dCompiler_dIr_dRuntime.v_Vuna_dCompiler_dIr_dRuntime_dirRtNatSucc) then ((fun nd_uscrut8 -> (match nd_uscrut8 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__142, dtb__143) -> (match dtb__143 with
  | Base_dList.C_Base_dList_dList_Nil -> (((v_Vuna_dCompiler_dNative_dModule_dgenNatSuccCall (fuel - 1)) st) dtb__142)
  | _ -> (v_Vuna_dCompiler_dNative_dModule_dinternal "Nat Succ must have exactly one argument")
)
  | _ -> (v_Vuna_dCompiler_dNative_dModule_dinternal "Nat Succ must have exactly one argument")
)) dtb__139) else ((((v_Vuna_dCompiler_dNative_dModule_dgenRtValueCall (fuel - 1)) st) dtb__141) dtb__139))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLam (dtb__144, dtb__145) -> ((fun nd_uscrut9 -> (match nd_uscrut9 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__146, dtb__147) -> (match dtb__147 with
  | Base_dList.C_Base_dList_dList_Nil -> ((fun nd_uscrut14 -> (match nd_uscrut14 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__148, dtb__149) -> (match dtb__149 with
  | Base_dList.C_Base_dList_dList_Nil -> (((((v_Vuna_dCompiler_dNative_dModule_dgenLamApp (fuel - 1)) st) dtb__146) dtb__148) dtb__145)
  | _ -> (v_Vuna_dCompiler_dNative_dModule_dunsupported "native target: only saturated single-argument lambdas are supported yet")
)
  | _ -> (v_Vuna_dCompiler_dNative_dModule_dunsupported "native target: only saturated single-argument lambdas are supported yet")
)) dtb__139)
  | _ -> (v_Vuna_dCompiler_dNative_dModule_dunsupported "native target: lambdas are not supported yet")
)
  | _ -> (v_Vuna_dCompiler_dNative_dModule_dunsupported "native target: lambdas are not supported yet")
)) (v_Vuna_dCompiler_dNative_dModule_druntimeBinders dtb__144))
  | _ -> (v_Vuna_dCompiler_dNative_dModule_dunsupported "native target: higher-order application is not supported yet")
)
  | _ -> failwith "DT: impossible branch"
)))
# 417 "Vuna/Compiler/Native/Module.vuna"
and v_Vuna_dCompiler_dNative_dModule_dgenNatArm = (fun mc0 mc1 mc2 mc3 mc4 -> (match mc2 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__150) -> (if (mc0 <= 0) then (v_Vuna_dCompiler_dNative_dModule_dinternal "native codegen fuel exhausted") else ((fun bs -> ((fun nd_uscrut8 -> (match nd_uscrut8 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__151, dtb__152) -> (match dtb__152 with
  | Base_dList.C_Base_dList_dList_Nil -> (if (mc3 = "none") then (v_Vuna_dCompiler_dNative_dModule_dinternal "Nat case arm has a binder but no runtime binding") else ((fun slotP -> ((fun slot -> ((fun st1 -> ((fun bindInstrs -> ((v_Vuna_dCompiler_dNative_dModule_dnbind (((v_Vuna_dCompiler_dNative_dModule_dgenExpr (mc0 - 1)) (((v_Vuna_dCompiler_dNative_dModule_dpushBinder dtb__151) slot) st1)) (Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirAltBodyOf dtb__150))) (fun q -> (C_Vuna_dCompiler_dNative_dModule_dNRes_NOk ({ Base_dPair.f_Base_dPair_dPair_first = ((Base_dList.v_Base_dList_dappend bindInstrs) ((Base_dList.v_Base_dList_dappend (v_Vuna_dCompiler_dNative_dModule_dstoreSlot slot)) (Base_dPair.v_Base_dPair_dfirstOf q))); Base_dPair.f_Base_dPair_dPair_second = ((v_Vuna_dCompiler_dNative_dModule_drestoreBinderScope (Base_dPair.v_Base_dPair_dsecondOf q)) (mc1).f_Vuna_dCompiler_dNative_dModule_dFGen_fgSlots) }))))) (if (mc3 = "pred") then ((Base_dList.v_Base_dList_dappend (v_Vuna_dCompiler_dNative_dModule_dloadSlot mc4)) (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dInstr_IBin ("sub", (Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dOperand_OpImm (1)))), Base_dList.C_Base_dList_dList_Nil))) else (v_Vuna_dCompiler_dNative_dModule_dloadSlot mc4)))) (Base_dPair.v_Base_dPair_dsecondOf slotP))) (Base_dPair.v_Base_dPair_dfirstOf slotP))) (v_Vuna_dCompiler_dNative_dModule_dfreshSlot mc1)))
  | _ -> (v_Vuna_dCompiler_dNative_dModule_dinternal "Nat case arm has more than one runtime binder")
)
  | Base_dList.C_Base_dList_dList_Nil -> (((v_Vuna_dCompiler_dNative_dModule_dgenExpr (mc0 - 1)) mc1) (Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirAltBodyOf dtb__150))
  | _ -> failwith "DT: impossible branch"
)) bs)) (v_Vuna_dCompiler_dNative_dModule_druntimeBinders (Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirAltBindersOf dtb__150))))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (C_Vuna_dCompiler_dNative_dModule_dNRes_NOk ({ Base_dPair.f_Base_dPair_dPair_first = Base_dList.C_Base_dList_dList_Nil; Base_dPair.f_Base_dPair_dPair_second = mc1 }))
  | _ -> failwith "DT: impossible branch"
))
# 443 "Vuna/Compiler/Native/Module.vuna"
and v_Vuna_dCompiler_dNative_dModule_dgenNatCase = (fun fuel st scrut zero succ catch -> (if (fuel <= 0) then (v_Vuna_dCompiler_dNative_dModule_dinternal "native codegen fuel exhausted") else ((v_Vuna_dCompiler_dNative_dModule_dnbind (((v_Vuna_dCompiler_dNative_dModule_dgenExpr (fuel - 1)) st) scrut)) (fun p -> ((fun st1 -> ((fun slotP -> ((fun slotSc -> ((fun st2 -> ((fun lzP -> ((fun lz -> ((fun st3 -> ((fun lendP -> ((fun lend -> ((fun st4 -> ((fun zeroAlt -> ((fun zeroMode -> ((fun succAlt -> ((fun succMode -> (if (Base_dBool.v_Base_dBool_dnot ((v_Vuna_dCompiler_dNative_dModule_dhasNatBranch zero) catch)) then (v_Vuna_dCompiler_dNative_dModule_dinternal "Nat case has no zero/catch branch") else (if (Base_dBool.v_Base_dBool_dnot ((v_Vuna_dCompiler_dNative_dModule_dhasNatBranch succ) catch)) then (v_Vuna_dCompiler_dNative_dModule_dinternal "Nat case has no succ/catch branch") else ((v_Vuna_dCompiler_dNative_dModule_dnbind (((((v_Vuna_dCompiler_dNative_dModule_dgenNatArm (fuel - 1)) st4) zeroAlt) zeroMode) slotSc)) (fun z -> ((v_Vuna_dCompiler_dNative_dModule_dnbind (((((v_Vuna_dCompiler_dNative_dModule_dgenNatArm (fuel - 1)) (Base_dPair.v_Base_dPair_dsecondOf z)) succAlt) succMode) slotSc)) (fun s -> ((fun body -> (C_Vuna_dCompiler_dNative_dModule_dNRes_NOk ({ Base_dPair.f_Base_dPair_dPair_first = body; Base_dPair.f_Base_dPair_dPair_second = (Base_dPair.v_Base_dPair_dsecondOf s) }))) ((Base_dList.v_Base_dList_dappend (Base_dPair.v_Base_dPair_dfirstOf p)) ((Base_dList.v_Base_dList_dappend (v_Vuna_dCompiler_dNative_dModule_dstoreSlot slotSc)) ((Base_dList.v_Base_dList_dappend (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dInstr_ICmp ((Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dOperand_OpMem (Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dReg_Rbp, (Vuna_dCompiler_dNative_dAbi.v_Vuna_dCompiler_dNative_dAbi_dnativeSlotOff slotSc))), (Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dOperand_OpImm (0)))), (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dInstr_IJcc ("je", lz)), Base_dList.C_Base_dList_dList_Nil))))) ((Base_dList.v_Base_dList_dappend (Base_dPair.v_Base_dPair_dfirstOf s)) ((Base_dList.v_Base_dList_dappend (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dInstr_IJmp (lend)), (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dInstr_ILabel (lz)), Base_dList.C_Base_dList_dList_Nil))))) ((Base_dList.v_Base_dList_dappend (Base_dPair.v_Base_dPair_dfirstOf z)) (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dInstr_ILabel (lend)), Base_dList.C_Base_dList_dList_Nil)))))))))))))))) (match succ with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__153) -> "pred"
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> "sc"
  | _ -> failwith "DT: impossible branch"
))) (match succ with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__154) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__154))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> catch
  | _ -> failwith "DT: impossible branch"
))) (match zero with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__155) -> "none"
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> "sc"
  | _ -> failwith "DT: impossible branch"
))) (match zero with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__156) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__156))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> catch
  | _ -> failwith "DT: impossible branch"
))) (Base_dPair.v_Base_dPair_dsecondOf lendP))) (Base_dPair.v_Base_dPair_dfirstOf lendP))) (v_Vuna_dCompiler_dNative_dModule_dfreshLabel st3))) (Base_dPair.v_Base_dPair_dsecondOf lzP))) (Base_dPair.v_Base_dPair_dfirstOf lzP))) (v_Vuna_dCompiler_dNative_dModule_dfreshLabel st2))) (Base_dPair.v_Base_dPair_dsecondOf slotP))) (Base_dPair.v_Base_dPair_dfirstOf slotP))) (v_Vuna_dCompiler_dNative_dModule_dfreshSlot st1))) (Base_dPair.v_Base_dPair_dsecondOf p))))))

# 485 "Vuna/Compiler/Native/Module.vuna"
let rec v_Vuna_dCompiler_dNative_dModule_dbindArgsGo = (fun mc0 mc1 mc2 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__157, dtb__158) -> (match (v_Vuna_dCompiler_dNative_dModule_dargRegAt mc1) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (v_Vuna_dCompiler_dNative_dModule_dunsupported "native target: functions with more than 6 arguments are not supported yet")
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__159) -> ((fun slotP -> ((fun slot -> ((fun st1 -> ((fun store -> ((v_Vuna_dCompiler_dNative_dModule_dnbind (((v_Vuna_dCompiler_dNative_dModule_dbindArgsGo dtb__158) (mc1 + 1)) (((v_Vuna_dCompiler_dNative_dModule_dpushBinder dtb__157) slot) st1))) (fun q -> (C_Vuna_dCompiler_dNative_dModule_dNRes_NOk ({ Base_dPair.f_Base_dPair_dPair_first = ((Base_dList.v_Base_dList_dappend store) (Base_dPair.v_Base_dPair_dfirstOf q)); Base_dPair.f_Base_dPair_dPair_second = (Base_dPair.v_Base_dPair_dsecondOf q) }))))) (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dInstr_IMov ((Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dOperand_OpMem (Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dReg_Rbp, (Vuna_dCompiler_dNative_dAbi.v_Vuna_dCompiler_dNative_dAbi_dnativeSlotOff slot))), (Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dOperand_OpReg (dtb__159)))), Base_dList.C_Base_dList_dList_Nil)))) (Base_dPair.v_Base_dPair_dsecondOf slotP))) (Base_dPair.v_Base_dPair_dfirstOf slotP))) (v_Vuna_dCompiler_dNative_dModule_dfreshSlot mc2))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> (C_Vuna_dCompiler_dNative_dModule_dNRes_NOk ({ Base_dPair.f_Base_dPair_dPair_first = Base_dList.C_Base_dList_dList_Nil; Base_dPair.f_Base_dPair_dPair_second = mc2 }))
  | _ -> failwith "DT: impossible branch"
))

# 482 "Vuna/Compiler/Native/Module.vuna"
let v_Vuna_dCompiler_dNative_dModule_dbindArgs = (fun bs st -> (((v_Vuna_dCompiler_dNative_dModule_dbindArgsGo bs) 0) st))

# 500 "Vuna/Compiler/Native/Module.vuna"
let v_Vuna_dCompiler_dNative_dModule_dgenDefFunc = (fun mc0 mc1 mc2 mc3 -> (match mc3 with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrDef_IrDef (dtb__160, dtb__161, dtb__162, dtb__163, dtb__164, dtb__165, dtb__166) -> (if (dtb__161 > Vuna_dCompiler_dNative_dAbi.v_Vuna_dCompiler_dNative_dAbi_dnativeMaxArgs) then (v_Vuna_dCompiler_dNative_dModule_dunsupported "native target: functions with more than 6 arguments are not supported yet") else ((fun st0 -> (if (dtb__161 = 0) then ((v_Vuna_dCompiler_dNative_dModule_dnbind (((v_Vuna_dCompiler_dNative_dModule_dgenExpr 100000) st0) dtb__163)) (fun p -> ((fun st1 -> ((fun frame -> ((fun instrs -> (C_Vuna_dCompiler_dNative_dModule_dNRes_NOk ({ Base_dPair.f_Base_dPair_dPair_first = { Vuna_dCompiler_dNative_dModel.f_Vuna_dCompiler_dNative_dModel_dNativeFunc_nfLabel = (Vuna_dCompiler_dNative_dAbi.v_Vuna_dCompiler_dNative_dAbi_dnativeFuncLabel dtb__160); Vuna_dCompiler_dNative_dModel.f_Vuna_dCompiler_dNative_dModel_dNativeFunc_nfFrame = frame; Vuna_dCompiler_dNative_dModel.f_Vuna_dCompiler_dNative_dModel_dNativeFunc_nfBody = ((Base_dList.v_Base_dList_dappend (Vuna_dCompiler_dNative_dAbi.v_Vuna_dCompiler_dNative_dAbi_dnativePrologue frame)) instrs) }; Base_dPair.f_Base_dPair_dPair_second = (st1).f_Vuna_dCompiler_dNative_dModule_dFGen_fgNextLabel }))) ((Base_dList.v_Base_dList_dappend (Base_dPair.v_Base_dPair_dfirstOf p)) Vuna_dCompiler_dNative_dAbi.v_Vuna_dCompiler_dNative_dAbi_dnativeEpilogue))) (Vuna_dCompiler_dNative_dAbi.v_Vuna_dCompiler_dNative_dAbi_dnativeFrameBytes (st1).f_Vuna_dCompiler_dNative_dModule_dFGen_fgNextSlot))) (Base_dPair.v_Base_dPair_dsecondOf p)))) else (match dtb__163 with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLam (dtb__167, dtb__168) -> ((fun rbs -> (if ((Base_dList.v_Base_dList_dlength rbs) <> dtb__161) then (v_Vuna_dCompiler_dNative_dModule_dinternal ("function body lambda arity mismatch: " ^ dtb__160)) else ((v_Vuna_dCompiler_dNative_dModule_dnbind ((v_Vuna_dCompiler_dNative_dModule_dbindArgs rbs) st0)) (fun bp -> ((v_Vuna_dCompiler_dNative_dModule_dnbind (((v_Vuna_dCompiler_dNative_dModule_dgenExpr 100000) (Base_dPair.v_Base_dPair_dsecondOf bp)) dtb__168)) (fun q -> ((fun st1 -> ((fun frame -> ((fun instrs -> (C_Vuna_dCompiler_dNative_dModule_dNRes_NOk ({ Base_dPair.f_Base_dPair_dPair_first = { Vuna_dCompiler_dNative_dModel.f_Vuna_dCompiler_dNative_dModel_dNativeFunc_nfLabel = (Vuna_dCompiler_dNative_dAbi.v_Vuna_dCompiler_dNative_dAbi_dnativeFuncLabel dtb__160); Vuna_dCompiler_dNative_dModel.f_Vuna_dCompiler_dNative_dModel_dNativeFunc_nfFrame = frame; Vuna_dCompiler_dNative_dModel.f_Vuna_dCompiler_dNative_dModel_dNativeFunc_nfBody = ((Base_dList.v_Base_dList_dappend (Vuna_dCompiler_dNative_dAbi.v_Vuna_dCompiler_dNative_dAbi_dnativePrologue frame)) instrs) }; Base_dPair.f_Base_dPair_dPair_second = (st1).f_Vuna_dCompiler_dNative_dModule_dFGen_fgNextLabel }))) ((Base_dList.v_Base_dList_dappend (Base_dPair.v_Base_dPair_dfirstOf bp)) ((Base_dList.v_Base_dList_dappend (Base_dPair.v_Base_dPair_dfirstOf q)) Vuna_dCompiler_dNative_dAbi.v_Vuna_dCompiler_dNative_dAbi_dnativeEpilogue)))) (Vuna_dCompiler_dNative_dAbi.v_Vuna_dCompiler_dNative_dAbi_dnativeFrameBytes (st1).f_Vuna_dCompiler_dNative_dModule_dFGen_fgNextSlot))) (Base_dPair.v_Base_dPair_dsecondOf q)))))))) (v_Vuna_dCompiler_dNative_dModule_druntimeBinders dtb__167))
  | _ -> (v_Vuna_dCompiler_dNative_dModule_dinternal ("function body is not a lambda: " ^ dtb__160))
))) { f_Vuna_dCompiler_dNative_dModule_dFGen_fgDefs = mc0; f_Vuna_dCompiler_dNative_dModule_dFGen_fgPool = mc1; f_Vuna_dCompiler_dNative_dModule_dFGen_fgSlots = Base_dList.C_Base_dList_dList_Nil; f_Vuna_dCompiler_dNative_dModule_dFGen_fgNextSlot = 0; f_Vuna_dCompiler_dNative_dModule_dFGen_fgNextLabel = mc2 }))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrDef_IrExternDef (dtb__169, dtb__170, dtb__171, dtb__172) -> (v_Vuna_dCompiler_dNative_dModule_dunsupported (String.concat "" ["native target: extern definition `"; dtb__169; "` is not supported yet"]))
  | _ -> failwith "DT: impossible branch"
))

# 529 "Vuna/Compiler/Native/Module.vuna"
let rec v_Vuna_dCompiler_dNative_dModule_dgenDefs = (fun mc0 mc1 mc2 mc3 mc4 -> (match mc3 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__173, dtb__174) -> ((v_Vuna_dCompiler_dNative_dModule_dnbind ((((v_Vuna_dCompiler_dNative_dModule_dgenDefFunc mc0) mc1) mc2) dtb__173)) (fun p -> (((((v_Vuna_dCompiler_dNative_dModule_dgenDefs mc0) mc1) (Base_dPair.v_Base_dPair_dsecondOf p)) dtb__174) (Base_dList.C_Base_dList_dList_Cons ((Base_dPair.v_Base_dPair_dfirstOf p), mc4)))))
  | Base_dList.C_Base_dList_dList_Nil -> (C_Vuna_dCompiler_dNative_dModule_dNRes_NOk ({ Base_dPair.f_Base_dPair_dPair_first = (Base_dList.v_Base_dList_dreverse mc4); Base_dPair.f_Base_dPair_dPair_second = mc2 }))
  | _ -> failwith "DT: impossible branch"
))

# 537 "Vuna/Compiler/Native/Module.vuna"
let v_Vuna_dCompiler_dNative_dModule_dentryShowKind = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRt (dtb__175) -> (if (dtb__175 = "@ir@showInt") then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ("int")) else (if (dtb__175 = "@ir@showNat") then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ("int")) else (if (dtb__175 = "@ir@showBool") then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ("bool")) else (if (dtb__175 = "@ir@showStr") then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ("str")) else Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing))))
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
))

# 546 "Vuna/Compiler/Native/Module.vuna"
let v_Vuna_dCompiler_dNative_dModule_dstartFunc = (fun printResult kind mainName -> ((fun initHeap -> ((fun callMain -> ((fun printer -> ((fun exitInstrs -> { Vuna_dCompiler_dNative_dModel.f_Vuna_dCompiler_dNative_dModel_dNativeFunc_nfLabel = Vuna_dCompiler_dNative_dAbi.v_Vuna_dCompiler_dNative_dAbi_dnativeEntryLabel; Vuna_dCompiler_dNative_dModel.f_Vuna_dCompiler_dNative_dModel_dNativeFunc_nfFrame = 0; Vuna_dCompiler_dNative_dModel.f_Vuna_dCompiler_dNative_dModel_dNativeFunc_nfBody = ((Base_dList.v_Base_dList_dappend initHeap) ((Base_dList.v_Base_dList_dappend callMain) ((Base_dList.v_Base_dList_dappend printer) exitInstrs))) }) (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dInstr_IMov ((Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dOperand_OpReg (Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dReg_Rax)), (Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dOperand_OpImm (60)))), (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dInstr_IMov ((Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dOperand_OpReg (Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dReg_Rdi)), (Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dOperand_OpImm (0)))), (Base_dList.C_Base_dList_dList_Cons (Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dInstr_ISyscall, Base_dList.C_Base_dList_dList_Nil)))))))) (if printResult then (if (kind = "bool") then (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dInstr_IMov ((Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dOperand_OpReg (Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dReg_Rdi)), (Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dOperand_OpReg (Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dReg_Rax)))), (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dInstr_ICall ((Vuna_dCompiler_dNative_dAbi.v_Vuna_dCompiler_dNative_dAbi_dnativeRtLabel "print_bool"))), Base_dList.C_Base_dList_dList_Nil)))) else (if (kind = "str") then (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dInstr_IMov ((Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dOperand_OpReg (Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dReg_Rdi)), (Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dOperand_OpReg (Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dReg_Rax)))), (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dInstr_ICall ((Vuna_dCompiler_dNative_dAbi.v_Vuna_dCompiler_dNative_dAbi_dnativeRtLabel "show_str"))), (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dInstr_IMov ((Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dOperand_OpReg (Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dReg_Rdi)), (Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dOperand_OpReg (Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dReg_Rax)))), (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dInstr_ICall ((Vuna_dCompiler_dNative_dAbi.v_Vuna_dCompiler_dNative_dAbi_dnativeRtLabel "print_str"))), Base_dList.C_Base_dList_dList_Nil)))))))) else (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dInstr_IMov ((Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dOperand_OpReg (Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dReg_Rdi)), (Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dOperand_OpReg (Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dReg_Rax)))), (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dInstr_ICall ((Vuna_dCompiler_dNative_dAbi.v_Vuna_dCompiler_dNative_dAbi_dnativeRtLabel "print_int"))), Base_dList.C_Base_dList_dList_Nil)))))) else Base_dList.C_Base_dList_dList_Nil))) (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dInstr_IBinReg ("and", Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dReg_Rsp, (Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dOperand_OpImm ((0 - 16))))), (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dInstr_ICall ((Vuna_dCompiler_dNative_dAbi.v_Vuna_dCompiler_dNative_dAbi_dnativeFuncLabel mainName))), Base_dList.C_Base_dList_dList_Nil)))))) (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dInstr_ILea (Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dReg_Rax, Vuna_dCompiler_dNative_dAbi.v_Vuna_dCompiler_dNative_dAbi_dnativeHeapLabel)), (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dInstr_IMov ((Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dOperand_OpRip (Vuna_dCompiler_dNative_dAbi.v_Vuna_dCompiler_dNative_dAbi_dnativeHeapPtrLabel)), (Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dOperand_OpReg (Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dReg_Rax)))), Base_dList.C_Base_dList_dList_Nil))))))

# 567 "Vuna/Compiler/Native/Module.vuna"
let v_Vuna_dCompiler_dNative_dModule_dbuild = (fun program printResult -> ((fun unit -> ((fun defs -> (match (unit).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrUnit_irUnitEntry with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dNativeOutcome_NativeRejected ((Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dNativeErr_NativeUnsupported ("native target: no main definition"))))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__176) -> (if (Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirEntryIsActionOf dtb__176) then (Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dNativeOutcome_NativeRejected ((Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dNativeErr_NativeUnsupported ("native target: effectful main is not supported yet")))) else ((fun mainName -> (match ((v_Vuna_dCompiler_dNative_dModule_dfindDef mainName) defs) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dNativeOutcome_NativeRejected ((Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dNativeErr_NativeUnsupported ("native target: main definition not found"))))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__177) -> (if ((Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirDefArity dtb__177) <> 0) then (Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dNativeOutcome_NativeRejected ((Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dNativeErr_NativeUnsupported ("native target: main must be a zero-argument value")))) else ((fun kindM -> (match kindM with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dNativeOutcome_NativeRejected ((Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dNativeErr_NativeUnsupported ("native target: custom Show entry is not supported yet"))))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__178) -> ((fun needed -> ((fun ordered -> ((fun pool -> (match (((((v_Vuna_dCompiler_dNative_dModule_dgenDefs defs) pool) 0) ordered) Base_dList.C_Base_dList_dList_Nil) with
  | C_Vuna_dCompiler_dNative_dModule_dNRes_NFail (dtb__179) -> (Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dNativeOutcome_NativeRejected (dtb__179))
  | C_Vuna_dCompiler_dNative_dModule_dNRes_NOk (dtb__180) -> ((fun start -> (Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dNativeOutcome_NativeOk ({ Vuna_dCompiler_dNative_dModel.f_Vuna_dCompiler_dNative_dModel_dNativeProgram_npRodata = Vuna_dCompiler_dNative_dRuntime.v_Vuna_dCompiler_dNative_dRuntime_dnativeRodata; Vuna_dCompiler_dNative_dModel.f_Vuna_dCompiler_dNative_dModel_dNativeProgram_npStrLits = (v_Vuna_dCompiler_dNative_dModule_dpoolItems pool); Vuna_dCompiler_dNative_dModel.f_Vuna_dCompiler_dNative_dModel_dNativeProgram_npBss = Vuna_dCompiler_dNative_dRuntime.v_Vuna_dCompiler_dNative_dRuntime_dnativeBss; Vuna_dCompiler_dNative_dModel.f_Vuna_dCompiler_dNative_dModel_dNativeProgram_npFuncs = ((Base_dList.v_Base_dList_dappend Vuna_dCompiler_dNative_dRuntime.v_Vuna_dCompiler_dNative_dRuntime_dnativeRtFuncs) ((Base_dList.v_Base_dList_dappend (Base_dPair.v_Base_dPair_dfirstOf dtb__180)) (Base_dList.C_Base_dList_dList_Cons (start, Base_dList.C_Base_dList_dList_Nil)))) }))) (((v_Vuna_dCompiler_dNative_dModule_dstartFunc printResult) dtb__178) mainName))
  | _ -> failwith "DT: impossible branch"
)) (v_Vuna_dCompiler_dNative_dModule_dpoolOfDefs ordered))) ((Base_dList.v_Base_dList_dfilter (fun d -> ((v_Vuna_dCompiler_dNative_dModule_dmemStr (Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirDefName d)) needed))) defs))) ((((v_Vuna_dCompiler_dNative_dModule_dcollectNeeded 100000) (Base_dList.C_Base_dList_dList_Cons (mainName, Base_dList.C_Base_dList_dList_Nil))) Base_dList.C_Base_dList_dList_Nil) defs))
  | _ -> failwith "DT: impossible branch"
)) (if printResult then (v_Vuna_dCompiler_dNative_dModule_dentryShowKind (Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirEntryShowOf dtb__176)) else (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ("none")))))
  | _ -> failwith "DT: impossible branch"
)) (Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirEntryMainOf dtb__176)))
  | _ -> failwith "DT: impossible branch"
)) ((Base_dList.v_Base_dList_dconcatMap Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirGroupDefs) (unit).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrUnit_irUnitGroups))) (Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirProgUnitOf program)))
