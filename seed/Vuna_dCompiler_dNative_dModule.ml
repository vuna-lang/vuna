open Vuna_runtime
type 'a0 t_Vuna_dCompiler_dNative_dModule_dNRes = C_Vuna_dCompiler_dNative_dModule_dNRes_NOk of ('a0) | C_Vuna_dCompiler_dNative_dModule_dNRes_NFail of (Vuna_dCompiler_dNative_dModel.t_Vuna_dCompiler_dNative_dModel_dNativeErr)
and t_Vuna_dCompiler_dNative_dModule_dFGen = { f_Vuna_dCompiler_dNative_dModule_dFGen_fgDefs : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrDef Base_dList.t_Base_dList_dList; f_Vuna_dCompiler_dNative_dModule_dFGen_fgPool : (string, string) Base_dPair.t_Base_dPair_dPair Base_dList.t_Base_dList_dList; f_Vuna_dCompiler_dNative_dModule_dFGen_fgSlots : (Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrBinder, int) Base_dPair.t_Base_dPair_dPair Base_dList.t_Base_dList_dList; f_Vuna_dCompiler_dNative_dModule_dFGen_fgFams : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrTyDecl Base_dList.t_Base_dList_dList; f_Vuna_dCompiler_dNative_dModule_dFGen_fgNextSlot : int; f_Vuna_dCompiler_dNative_dModule_dFGen_fgNextLabel : int }

# 40 "Vuna/Compiler/Native/Module.vuna"
let v_Vuna_dCompiler_dNative_dModule_dnbind = (fun mc0 mc1 -> (match mc0 with
  | C_Vuna_dCompiler_dNative_dModule_dNRes_NFail (dtb__0) -> (C_Vuna_dCompiler_dNative_dModule_dNRes_NFail (dtb__0))
  | C_Vuna_dCompiler_dNative_dModule_dNRes_NOk (dtb__1) -> (mc1 dtb__1)
  | _ -> failwith "DT: impossible branch"
))

# 44 "Vuna/Compiler/Native/Module.vuna"
let v_Vuna_dCompiler_dNative_dModule_dunsupported = (fun msg -> (C_Vuna_dCompiler_dNative_dModule_dNRes_NFail ((Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dNativeErr_NativeUnsupported (msg)))))

# 47 "Vuna/Compiler/Native/Module.vuna"
let v_Vuna_dCompiler_dNative_dModule_dinternal = (fun msg -> (C_Vuna_dCompiler_dNative_dModule_dNRes_NFail ((Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dNativeErr_NativeInternal (msg)))))

# 61 "Vuna/Compiler/Native/Module.vuna"
let v_Vuna_dCompiler_dNative_dModule_dfreshSlot = (fun st -> ((fun slot -> ((fun st1 -> { Base_dPair.f_Base_dPair_dPair_first = slot; Base_dPair.f_Base_dPair_dPair_second = st1 }) { st with f_Vuna_dCompiler_dNative_dModule_dFGen_fgNextSlot = ((st).f_Vuna_dCompiler_dNative_dModule_dFGen_fgNextSlot + 1) })) (st).f_Vuna_dCompiler_dNative_dModule_dFGen_fgNextSlot))

# 68 "Vuna/Compiler/Native/Module.vuna"
let v_Vuna_dCompiler_dNative_dModule_dfreshLabel = (fun st -> ((fun label -> ((fun st1 -> { Base_dPair.f_Base_dPair_dPair_first = label; Base_dPair.f_Base_dPair_dPair_second = st1 }) { st with f_Vuna_dCompiler_dNative_dModule_dFGen_fgNextLabel = ((st).f_Vuna_dCompiler_dNative_dModule_dFGen_fgNextLabel + 1) })) (Vuna_dCompiler_dNative_dAbi.v_Vuna_dCompiler_dNative_dAbi_dnativeJumpLabel (st).f_Vuna_dCompiler_dNative_dModule_dFGen_fgNextLabel)))

# 75 "Vuna/Compiler/Native/Module.vuna"
let v_Vuna_dCompiler_dNative_dModule_dstoreSlot = (fun slot -> (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dInstr_IMov ((Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dOperand_OpMem (Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dReg_Rbp, (Vuna_dCompiler_dNative_dAbi.v_Vuna_dCompiler_dNative_dAbi_dnativeSlotOff slot))), (Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dOperand_OpReg (Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dReg_Rax)))), Base_dList.C_Base_dList_dList_Nil)))

# 78 "Vuna/Compiler/Native/Module.vuna"
let v_Vuna_dCompiler_dNative_dModule_dloadSlot = (fun slot -> (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dInstr_IMov ((Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dOperand_OpReg (Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dReg_Rax)), (Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dOperand_OpMem (Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dReg_Rbp, (Vuna_dCompiler_dNative_dAbi.v_Vuna_dCompiler_dNative_dAbi_dnativeSlotOff slot))))), Base_dList.C_Base_dList_dList_Nil)))

# 81 "Vuna/Compiler/Native/Module.vuna"
let v_Vuna_dCompiler_dNative_dModule_dloadReg = (fun r slot -> (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dInstr_IMov ((Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dOperand_OpReg (r)), (Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dOperand_OpMem (Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dReg_Rbp, (Vuna_dCompiler_dNative_dAbi.v_Vuna_dCompiler_dNative_dAbi_dnativeSlotOff slot))))), Base_dList.C_Base_dList_dList_Nil)))

# 87 "Vuna/Compiler/Native/Module.vuna"
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

# 94 "Vuna/Compiler/Native/Module.vuna"
let v_Vuna_dCompiler_dNative_dModule_dbinderEq = (fun a b -> (if ((v_Vuna_dCompiler_dNative_dModule_dbNameEq (a).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrBinder_irBinderName) (b).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrBinder_irBinderName) then (((Base_dEq.v_Base_dEq_deq Base_dEq.v_Eq_uBase_uBool_uBool) (a).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrBinder_irBinderErased) (b).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrBinder_irBinderErased) else false))

# 97 "Vuna/Compiler/Native/Module.vuna"
let rec v_Vuna_dCompiler_dNative_dModule_dlookupBinder = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__8, dtb__9) -> (if ((v_Vuna_dCompiler_dNative_dModule_dbinderEq mc0) (Base_dPair.v_Base_dPair_dfirstOf dtb__8)) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((Base_dPair.v_Base_dPair_dsecondOf dtb__8))) else ((v_Vuna_dCompiler_dNative_dModule_dlookupBinder mc0) dtb__9))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 102 "Vuna/Compiler/Native/Module.vuna"
let v_Vuna_dCompiler_dNative_dModule_dpushBinder = (fun b slot st -> { st with f_Vuna_dCompiler_dNative_dModule_dFGen_fgSlots = (Base_dList.C_Base_dList_dList_Cons ({ Base_dPair.f_Base_dPair_dPair_first = b; Base_dPair.f_Base_dPair_dPair_second = slot }, (st).f_Vuna_dCompiler_dNative_dModule_dFGen_fgSlots)) })

# 105 "Vuna/Compiler/Native/Module.vuna"
let v_Vuna_dCompiler_dNative_dModule_disErasedBinder = (fun b -> (b).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrBinder_irBinderErased)

# 109 "Vuna/Compiler/Native/Module.vuna"
let v_Vuna_dCompiler_dNative_dModule_drestoreBinderScope = (fun st slots -> { st with f_Vuna_dCompiler_dNative_dModule_dFGen_fgSlots = slots })

# 112 "Vuna/Compiler/Native/Module.vuna"
let v_Vuna_dCompiler_dNative_dModule_druntimeBinders = (fun bs -> ((Base_dList.v_Base_dList_dfilter (fun b -> (Base_dBool.v_Base_dBool_dnot (v_Vuna_dCompiler_dNative_dModule_disErasedBinder b)))) bs))

# 118 "Vuna/Compiler/Native/Module.vuna"
let rec v_Vuna_dCompiler_dNative_dModule_dfindDef = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__10, dtb__11) -> (if ((Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirDefName dtb__10) = mc0) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__10)) else ((v_Vuna_dCompiler_dNative_dModule_dfindDef mc0) dtb__11))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 122 "Vuna/Compiler/Native/Module.vuna"
let rec v_Vuna_dCompiler_dNative_dModule_dmemStr = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__12, dtb__13) -> (if (mc0 = dtb__12) then true else ((v_Vuna_dCompiler_dNative_dModule_dmemStr mc0) dtb__13))
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 126 "Vuna/Compiler/Native/Module.vuna"
let rec v_Vuna_dCompiler_dNative_dModule_dcollectNeeded = (fun fuel work seen defs -> (if (fuel <= 0) then (Base_dList.v_Base_dList_dreverse seen) else (match work with
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dList.v_Base_dList_dreverse seen)
  | Base_dList.C_Base_dList_dList_Cons (dtb__14, dtb__15) -> (if ((v_Vuna_dCompiler_dNative_dModule_dmemStr dtb__14) seen) then ((((v_Vuna_dCompiler_dNative_dModule_dcollectNeeded (fuel - 1)) dtb__15) seen) defs) else (match ((v_Vuna_dCompiler_dNative_dModule_dfindDef dtb__14) defs) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((((v_Vuna_dCompiler_dNative_dModule_dcollectNeeded (fuel - 1)) dtb__15) (Base_dList.C_Base_dList_dList_Cons (dtb__14, seen))) defs)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__16) -> ((((v_Vuna_dCompiler_dNative_dModule_dcollectNeeded (fuel - 1)) ((Base_dList.v_Base_dList_dappend dtb__15) (Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirDefDeps dtb__16))) (Base_dList.C_Base_dList_dList_Cons (dtb__14, seen))) defs)
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
)))

# 139 "Vuna/Compiler/Native/Module.vuna"
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
# 159 "Vuna/Compiler/Native/Module.vuna"
and v_Vuna_dCompiler_dNative_dModule_dstrLitsOfField = (fun p -> (v_Vuna_dCompiler_dNative_dModule_dstrLitsOf (Base_dPair.v_Base_dPair_dsecondOf p)))
# 162 "Vuna/Compiler/Native/Module.vuna"
and v_Vuna_dCompiler_dNative_dModule_dstrLitsOfAlt = (fun alt -> (v_Vuna_dCompiler_dNative_dModule_dstrLitsOf (Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirAltBodyOf alt)))
# 165 "Vuna/Compiler/Native/Module.vuna"
and v_Vuna_dCompiler_dNative_dModule_dstrLitsOfAltMaybe = (fun mc0 -> (match mc0 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__55) -> (v_Vuna_dCompiler_dNative_dModule_dstrLitsOfAlt dtb__55)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 169 "Vuna/Compiler/Native/Module.vuna"
let v_Vuna_dCompiler_dNative_dModule_dstrLitsOfDef = (fun d -> (match (Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirDefBody d) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dList.C_Base_dList_dList_Nil
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__56) -> (v_Vuna_dCompiler_dNative_dModule_dstrLitsOf dtb__56)
  | _ -> failwith "DT: impossible branch"
))

# 174 "Vuna/Compiler/Native/Module.vuna"
let v_Vuna_dCompiler_dNative_dModule_daddLit = (fun pool s -> (if ((v_Vuna_dCompiler_dNative_dModule_dmemStr s) ((Base_dList.v_Base_dList_dmap (fun p -> (Base_dPair.v_Base_dPair_dfirstOf p))) pool)) then pool else ((Base_dList.v_Base_dList_dappend pool) (Base_dList.C_Base_dList_dList_Cons ({ Base_dPair.f_Base_dPair_dPair_first = s; Base_dPair.f_Base_dPair_dPair_second = (Vuna_dCompiler_dNative_dAbi.v_Vuna_dCompiler_dNative_dAbi_dnativeStrLitLabel (Base_dList.v_Base_dList_dlength pool)) }, Base_dList.C_Base_dList_dList_Nil)))))

# 179 "Vuna/Compiler/Native/Module.vuna"
let v_Vuna_dCompiler_dNative_dModule_dpoolOfDefs = (fun defs -> (((Base_dList.v_Base_dList_dfoldl v_Vuna_dCompiler_dNative_dModule_daddLit) Base_dList.C_Base_dList_dList_Nil) ((Base_dList.v_Base_dList_dconcatMap v_Vuna_dCompiler_dNative_dModule_dstrLitsOfDef) defs)))

# 182 "Vuna/Compiler/Native/Module.vuna"
let rec v_Vuna_dCompiler_dNative_dModule_dpoolLabelOf = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__57, dtb__58) -> (if ((Base_dPair.v_Base_dPair_dfirstOf dtb__57) = mc0) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((Base_dPair.v_Base_dPair_dsecondOf dtb__57))) else ((v_Vuna_dCompiler_dNative_dModule_dpoolLabelOf mc0) dtb__58))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 186 "Vuna/Compiler/Native/Module.vuna"
let rec v_Vuna_dCompiler_dNative_dModule_dpoolItems = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__59, dtb__60) -> (match dtb__59 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__61; Base_dPair.f_Base_dPair_dPair_second = dtb__62 } -> (Base_dList.C_Base_dList_dList_Cons ({ Vuna_dCompiler_dNative_dModel.f_Vuna_dCompiler_dNative_dModel_dNativeStrLit_nsLabel = dtb__62; Vuna_dCompiler_dNative_dModel.f_Vuna_dCompiler_dNative_dModel_dNativeStrLit_nsText = dtb__61 }, (v_Vuna_dCompiler_dNative_dModule_dpoolItems dtb__60)))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 193 "Vuna/Compiler/Native/Module.vuna"
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

# 201 "Vuna/Compiler/Native/Module.vuna"
let rec v_Vuna_dCompiler_dNative_dModule_dargRegAtIn = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__67, dtb__68) -> (if (mc0 = 0) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__67)) else ((v_Vuna_dCompiler_dNative_dModule_dargRegAtIn (mc0 - 1)) dtb__68))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 198 "Vuna/Compiler/Native/Module.vuna"
let v_Vuna_dCompiler_dNative_dModule_dargRegAt = (fun i -> ((v_Vuna_dCompiler_dNative_dModule_dargRegAtIn i) Vuna_dCompiler_dNative_dAbi.v_Vuna_dCompiler_dNative_dAbi_dnativeArgRegs))

# 252 "Vuna/Compiler/Native/Module.vuna"
let v_Vuna_dCompiler_dNative_dModule_dpushOne = (fun slot -> (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dInstr_IMov ((Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dOperand_OpReg (Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dReg_Rax)), (Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dOperand_OpMem (Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dReg_Rbp, (Vuna_dCompiler_dNative_dAbi.v_Vuna_dCompiler_dNative_dAbi_dnativeSlotOff slot))))), (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dInstr_IPush (Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dReg_Rax)), Base_dList.C_Base_dList_dList_Nil)))))

# 244 "Vuna/Compiler/Native/Module.vuna"
let v_Vuna_dCompiler_dNative_dModule_dpushStackArgs = (fun slots -> ((fun k -> ((fun pad -> ((fun pushes -> ((Base_dList.v_Base_dList_dappend pad) pushes)) ((Base_dList.v_Base_dList_dconcatMap v_Vuna_dCompiler_dNative_dModule_dpushOne) (Base_dList.v_Base_dList_dreverse slots)))) (if ((bi_natSub k (bi_natMul (bi_natDiv k 2) 2)) = 1) then (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dInstr_IBinReg ("sub", Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dReg_Rsp, (Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dOperand_OpImm (8)))), Base_dList.C_Base_dList_dList_Nil)) else Base_dList.C_Base_dList_dList_Nil))) (Base_dList.v_Base_dList_dlength slots)))

# 406 "Vuna/Compiler/Native/Module.vuna"
let rec v_Vuna_dCompiler_dNative_dModule_dflattenApp = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (dtb__69, dtb__70) -> ((fun p -> { Base_dPair.f_Base_dPair_dPair_first = (Base_dPair.v_Base_dPair_dfirstOf p); Base_dPair.f_Base_dPair_dPair_second = ((Base_dList.v_Base_dList_dappend (Base_dPair.v_Base_dPair_dsecondOf p)) (Base_dList.C_Base_dList_dList_Cons (dtb__70, Base_dList.C_Base_dList_dList_Nil))) }) (v_Vuna_dCompiler_dNative_dModule_dflattenApp dtb__69))
  | _ -> { Base_dPair.f_Base_dPair_dPair_first = mc0; Base_dPair.f_Base_dPair_dPair_second = Base_dList.C_Base_dList_dList_Nil }
))

# 446 "Vuna/Compiler/Native/Module.vuna"
let v_Vuna_dCompiler_dNative_dModule_dcat = (fun xs -> ((Base_dList.v_Base_dList_dconcatMap (fun x -> x)) xs))

# 449 "Vuna/Compiler/Native/Module.vuna"
let rec v_Vuna_dCompiler_dNative_dModule_dlistLengthI = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__71, dtb__72) -> (1 + (v_Vuna_dCompiler_dNative_dModule_dlistLengthI dtb__72))
  | Base_dList.C_Base_dList_dList_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))

# 453 "Vuna/Compiler/Native/Module.vuna"
let v_Vuna_dCompiler_dNative_dModule_dsetLocal = (fun slot -> (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dInstr_IMov ((Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dOperand_OpMem (Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dReg_Rbp, (Vuna_dCompiler_dNative_dAbi.v_Vuna_dCompiler_dNative_dAbi_dnativeSlotOff slot))), (Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dOperand_OpReg (Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dReg_Rax)))), Base_dList.C_Base_dList_dList_Nil)))

# 456 "Vuna/Compiler/Native/Module.vuna"
let v_Vuna_dCompiler_dNative_dModule_dgetLocal = (fun slot -> (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dInstr_IMov ((Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dOperand_OpReg (Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dReg_Rax)), (Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dOperand_OpMem (Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dReg_Rbp, (Vuna_dCompiler_dNative_dAbi.v_Vuna_dCompiler_dNative_dAbi_dnativeSlotOff slot))))), Base_dList.C_Base_dList_dList_Nil)))

# 460 "Vuna/Compiler/Native/Module.vuna"
let v_Vuna_dCompiler_dNative_dModule_dsetObjFromSlot = (fun obj off fromSlot -> (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dInstr_IMov ((Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dOperand_OpReg (Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dReg_Rax)), (Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dOperand_OpMem (Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dReg_Rbp, (Vuna_dCompiler_dNative_dAbi.v_Vuna_dCompiler_dNative_dAbi_dnativeSlotOff fromSlot))))), (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dInstr_IMov ((Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dOperand_OpReg (Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dReg_Rdx)), (Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dOperand_OpMem (Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dReg_Rbp, (Vuna_dCompiler_dNative_dAbi.v_Vuna_dCompiler_dNative_dAbi_dnativeSlotOff obj))))), (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dInstr_IMov ((Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dOperand_OpMem (Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dReg_Rdx, off)), (Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dOperand_OpReg (Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dReg_Rax)))), Base_dList.C_Base_dList_dList_Nil)))))))

# 467 "Vuna/Compiler/Native/Module.vuna"
let v_Vuna_dCompiler_dNative_dModule_dsetObjImm = (fun obj off imm -> (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dInstr_IMov ((Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dOperand_OpReg (Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dReg_Rdx)), (Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dOperand_OpMem (Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dReg_Rbp, (Vuna_dCompiler_dNative_dAbi.v_Vuna_dCompiler_dNative_dAbi_dnativeSlotOff obj))))), (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dInstr_IMov ((Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dOperand_OpMem (Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dReg_Rdx, off)), (Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dOperand_OpImm (imm)))), Base_dList.C_Base_dList_dList_Nil)))))

# 471 "Vuna/Compiler/Native/Module.vuna"
let v_Vuna_dCompiler_dNative_dModule_dgetObjField = (fun obj off -> (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dInstr_IMov ((Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dOperand_OpReg (Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dReg_Rdx)), (Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dOperand_OpMem (Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dReg_Rbp, (Vuna_dCompiler_dNative_dAbi.v_Vuna_dCompiler_dNative_dAbi_dnativeSlotOff obj))))), (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dInstr_IMov ((Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dOperand_OpReg (Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dReg_Rax)), (Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dOperand_OpMem (Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dReg_Rdx, off)))), Base_dList.C_Base_dList_dList_Nil)))))

# 476 "Vuna/Compiler/Native/Module.vuna"
let v_Vuna_dCompiler_dNative_dModule_dgenAlloc = (fun st slots -> ((fun slotP -> ((fun obj -> ((fun st1 -> ((fun instrs -> { Base_dPair.f_Base_dPair_dPair_first = instrs; Base_dPair.f_Base_dPair_dPair_second = { Base_dPair.f_Base_dPair_dPair_first = obj; Base_dPair.f_Base_dPair_dPair_second = st1 } }) (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dInstr_IMov ((Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dOperand_OpReg (Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dReg_Rdi)), (Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dOperand_OpImm ((8 * slots))))), (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dInstr_ICall ((Vuna_dCompiler_dNative_dAbi.v_Vuna_dCompiler_dNative_dAbi_dnativeRtLabel "alloc"))), (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dInstr_IMov ((Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dOperand_OpMem (Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dReg_Rbp, (Vuna_dCompiler_dNative_dAbi.v_Vuna_dCompiler_dNative_dAbi_dnativeSlotOff obj))), (Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dOperand_OpReg (Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dReg_Rax)))), Base_dList.C_Base_dList_dList_Nil)))))))) (Base_dPair.v_Base_dPair_dsecondOf slotP))) (Base_dPair.v_Base_dPair_dfirstOf slotP))) (v_Vuna_dCompiler_dNative_dModule_dfreshSlot st)))

# 493 "Vuna/Compiler/Native/Module.vuna"
let v_Vuna_dCompiler_dNative_dModule_ddeclName = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTyDecl_IrUnboxedDecl (dtb__73, dtb__74, dtb__75) -> dtb__73
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTyDecl_IrRecordDecl (dtb__76, dtb__77, dtb__78, dtb__79) -> dtb__76
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTyDecl_IrVariantDecl (dtb__80, dtb__81, dtb__82) -> dtb__80
  | _ -> failwith "DT: impossible branch"
))

# 489 "Vuna/Compiler/Native/Module.vuna"
let rec v_Vuna_dCompiler_dNative_dModule_ddeclOf = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__83, dtb__84) -> (if ((v_Vuna_dCompiler_dNative_dModule_ddeclName dtb__83) = mc0) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__83)) else ((v_Vuna_dCompiler_dNative_dModule_ddeclOf mc0) dtb__84))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 501 "Vuna/Compiler/Native/Module.vuna"
let rec v_Vuna_dCompiler_dNative_dModule_dctorTagGo = (fun mc0 mc1 mc2 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__85, dtb__86) -> (if ((Base_dPair.v_Base_dPair_dfirstOf dtb__85) = mc1) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (mc2)) else (((v_Vuna_dCompiler_dNative_dModule_dctorTagGo dtb__86) mc1) (mc2 + 1)))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 498 "Vuna/Compiler/Native/Module.vuna"
let v_Vuna_dCompiler_dNative_dModule_dctorTagIn = (fun ctors ctor -> (((v_Vuna_dCompiler_dNative_dModule_dctorTagGo ctors) ctor) 0))

# 505 "Vuna/Compiler/Native/Module.vuna"
let rec v_Vuna_dCompiler_dNative_dModule_dctorArityIn = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__87, dtb__88) -> (if ((Base_dPair.v_Base_dPair_dfirstOf dtb__87) = mc1) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((v_Vuna_dCompiler_dNative_dModule_dlistLengthI (Base_dPair.v_Base_dPair_dsecondOf dtb__87)))) else ((v_Vuna_dCompiler_dNative_dModule_dctorArityIn dtb__88) mc1))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 510 "Vuna/Compiler/Native/Module.vuna"
let rec v_Vuna_dCompiler_dNative_dModule_dmaxArityIn = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__89, dtb__90) -> ((fun n -> ((fun m -> (if (n > m) then n else m)) (v_Vuna_dCompiler_dNative_dModule_dmaxArityIn dtb__90))) (v_Vuna_dCompiler_dNative_dModule_dlistLengthI (Base_dPair.v_Base_dPair_dsecondOf dtb__89)))
  | Base_dList.C_Base_dList_dList_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))

# 521 "Vuna/Compiler/Native/Module.vuna"
let rec v_Vuna_dCompiler_dNative_dModule_drecordPosGo = (fun mc0 mc1 mc2 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__91, dtb__92) -> (if ((Base_dPair.v_Base_dPair_dsecondOf dtb__91) = mc1) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (mc2)) else (((v_Vuna_dCompiler_dNative_dModule_drecordPosGo dtb__92) mc1) (mc2 + 1)))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 518 "Vuna/Compiler/Native/Module.vuna"
let v_Vuna_dCompiler_dNative_dModule_drecordPosOf = (fun fields name -> (((v_Vuna_dCompiler_dNative_dModule_drecordPosGo fields) name) 0))

# 526 "Vuna/Compiler/Native/Module.vuna"
let rec v_Vuna_dCompiler_dNative_dModule_dstoreSlotFields = (fun mc0 mc1 mc2 -> (match mc2 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__93, dtb__94) -> ((Base_dList.v_Base_dList_dappend (((v_Vuna_dCompiler_dNative_dModule_dsetObjFromSlot mc0) (8 * mc1)) dtb__93)) (((v_Vuna_dCompiler_dNative_dModule_dstoreSlotFields mc0) (mc1 + 1)) dtb__94))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 531 "Vuna/Compiler/Native/Module.vuna"
let v_Vuna_dCompiler_dNative_dModule_dpadObjZero = (fun obj idx maxIdx -> ((Base_dList.v_Base_dList_dconcatMap (fun i -> (((v_Vuna_dCompiler_dNative_dModule_dsetObjImm obj) (8 * i)) 0))) ((Base_dList.v_Base_dList_drange idx) maxIdx)))

# 553 "Vuna/Compiler/Native/Module.vuna"
let v_Vuna_dCompiler_dNative_dModule_dgenCtorFinish = (fun n tag p ctors -> ((fun st -> ((fun maxF -> ((fun allocP -> ((fun obj -> ((fun body -> (C_Vuna_dCompiler_dNative_dModule_dNRes_NOk ({ Base_dPair.f_Base_dPair_dPair_first = body; Base_dPair.f_Base_dPair_dPair_second = (Base_dPair.v_Base_dPair_dsecondOf (Base_dPair.v_Base_dPair_dsecondOf allocP)) }))) (v_Vuna_dCompiler_dNative_dModule_dcat (Base_dList.C_Base_dList_dList_Cons ((Base_dPair.v_Base_dPair_dfirstOf p), (Base_dList.C_Base_dList_dList_Cons ((Base_dPair.v_Base_dPair_dfirstOf allocP), (Base_dList.C_Base_dList_dList_Cons ((((v_Vuna_dCompiler_dNative_dModule_dsetObjImm obj) 0) tag), (Base_dList.C_Base_dList_dList_Cons ((((v_Vuna_dCompiler_dNative_dModule_dstoreSlotFields obj) 1) (Base_dPair.v_Base_dPair_dfirstOf (Base_dPair.v_Base_dPair_dsecondOf p))), (Base_dList.C_Base_dList_dList_Cons ((((v_Vuna_dCompiler_dNative_dModule_dpadObjZero obj) (1 + n)) (1 + maxF)), (Base_dList.C_Base_dList_dList_Cons ((v_Vuna_dCompiler_dNative_dModule_dgetLocal obj), Base_dList.C_Base_dList_dList_Nil))))))))))))))) (Base_dPair.v_Base_dPair_dfirstOf (Base_dPair.v_Base_dPair_dsecondOf allocP)))) ((v_Vuna_dCompiler_dNative_dModule_dgenAlloc st) (1 + maxF)))) (v_Vuna_dCompiler_dNative_dModule_dmaxArityIn ctors))) (Base_dPair.v_Base_dPair_dsecondOf (Base_dPair.v_Base_dPair_dsecondOf p))))

# 575 "Vuna/Compiler/Native/Module.vuna"
let v_Vuna_dCompiler_dNative_dModule_dgenRecordFinish = (fun p flds -> ((fun st -> ((fun slots -> ((fun allocP -> ((fun obj -> ((fun body -> (C_Vuna_dCompiler_dNative_dModule_dNRes_NOk ({ Base_dPair.f_Base_dPair_dPair_first = body; Base_dPair.f_Base_dPair_dPair_second = (Base_dPair.v_Base_dPair_dsecondOf (Base_dPair.v_Base_dPair_dsecondOf allocP)) }))) (v_Vuna_dCompiler_dNative_dModule_dcat (Base_dList.C_Base_dList_dList_Cons ((Base_dPair.v_Base_dPair_dfirstOf p), (Base_dList.C_Base_dList_dList_Cons ((Base_dPair.v_Base_dPair_dfirstOf allocP), (Base_dList.C_Base_dList_dList_Cons ((((v_Vuna_dCompiler_dNative_dModule_dstoreSlotFields obj) 0) slots), (Base_dList.C_Base_dList_dList_Cons ((v_Vuna_dCompiler_dNative_dModule_dgetLocal obj), Base_dList.C_Base_dList_dList_Nil))))))))))) (Base_dPair.v_Base_dPair_dfirstOf (Base_dPair.v_Base_dPair_dsecondOf allocP)))) ((v_Vuna_dCompiler_dNative_dModule_dgenAlloc st) (v_Vuna_dCompiler_dNative_dModule_dlistLengthI flds)))) (Base_dPair.v_Base_dPair_dfirstOf (Base_dPair.v_Base_dPair_dsecondOf p)))) (Base_dPair.v_Base_dPair_dsecondOf (Base_dPair.v_Base_dPair_dsecondOf p))))

# 594 "Vuna/Compiler/Native/Module.vuna"
let v_Vuna_dCompiler_dNative_dModule_dgenProjFinish = (fun p idx -> ((fun slotP -> ((fun slot -> ((fun body -> (C_Vuna_dCompiler_dNative_dModule_dNRes_NOk ({ Base_dPair.f_Base_dPair_dPair_first = body; Base_dPair.f_Base_dPair_dPair_second = (Base_dPair.v_Base_dPair_dsecondOf slotP) }))) (v_Vuna_dCompiler_dNative_dModule_dcat (Base_dList.C_Base_dList_dList_Cons ((Base_dPair.v_Base_dPair_dfirstOf p), (Base_dList.C_Base_dList_dList_Cons ((v_Vuna_dCompiler_dNative_dModule_dsetLocal slot), (Base_dList.C_Base_dList_dList_Cons (((v_Vuna_dCompiler_dNative_dModule_dgetObjField slot) (8 * idx)), Base_dList.C_Base_dList_dList_Nil))))))))) (Base_dPair.v_Base_dPair_dfirstOf slotP))) (v_Vuna_dCompiler_dNative_dModule_dfreshSlot (Base_dPair.v_Base_dPair_dsecondOf p))))

# 641 "Vuna/Compiler/Native/Module.vuna"
let rec v_Vuna_dCompiler_dNative_dModule_dlookupFieldIr = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__95, dtb__96) -> (if ((Base_dPair.v_Base_dPair_dfirstOf dtb__95) = mc0) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((Base_dPair.v_Base_dPair_dsecondOf dtb__95))) else ((v_Vuna_dCompiler_dNative_dModule_dlookupFieldIr mc0) dtb__96))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 669 "Vuna/Compiler/Native/Module.vuna"
let rec v_Vuna_dCompiler_dNative_dModule_dcaseFamilyOf = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__97, dtb__98) -> (match (Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirAltCtorOf dtb__97) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (v_Vuna_dCompiler_dNative_dModule_dcaseFamilyOf dtb__98)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__99) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((Base_dPair.v_Base_dPair_dfirstOf dtb__99)))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 675 "Vuna/Compiler/Native/Module.vuna"
let rec v_Vuna_dCompiler_dNative_dModule_dfindCatchAll = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__100, dtb__101) -> (match (Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirAltCtorOf dtb__100) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__100))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__102) -> (v_Vuna_dCompiler_dNative_dModule_dfindCatchAll dtb__101)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 681 "Vuna/Compiler/Native/Module.vuna"
let v_Vuna_dCompiler_dNative_dModule_dtrapImpossible = (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dInstr_ICall ((Vuna_dCompiler_dNative_dAbi.v_Vuna_dCompiler_dNative_dAbi_dnativeRtLabel "trap_impossible"))), Base_dList.C_Base_dList_dList_Nil))

# 702 "Vuna/Compiler/Native/Module.vuna"
let v_Vuna_dCompiler_dNative_dModule_dtagOfScrut = (fun sc -> (v_Vuna_dCompiler_dNative_dModule_dcat (Base_dList.C_Base_dList_dList_Cons ((v_Vuna_dCompiler_dNative_dModule_dgetLocal sc), (Base_dList.C_Base_dList_dList_Cons ((Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dInstr_IMov ((Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dOperand_OpReg (Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dReg_Rdx)), (Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dOperand_OpReg (Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dReg_Rax)))), (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dInstr_IMov ((Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dOperand_OpReg (Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dReg_Rax)), (Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dOperand_OpMem (Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dReg_Rdx, 0)))), Base_dList.C_Base_dList_dList_Nil)))), Base_dList.C_Base_dList_dList_Nil))))))

# 730 "Vuna/Compiler/Native/Module.vuna"
let rec v_Vuna_dCompiler_dNative_dModule_dbindFields = (fun mc0 mc1 mc2 mc3 -> (match mc3 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__103, dtb__104) -> ((fun slotP -> ((fun slot -> ((v_Vuna_dCompiler_dNative_dModule_dnbind ((((v_Vuna_dCompiler_dNative_dModule_dbindFields (((v_Vuna_dCompiler_dNative_dModule_dpushBinder dtb__103) slot) (Base_dPair.v_Base_dPair_dsecondOf slotP))) mc1) (mc2 + 1)) dtb__104)) (fun q -> (C_Vuna_dCompiler_dNative_dModule_dNRes_NOk ({ Base_dPair.f_Base_dPair_dPair_first = (v_Vuna_dCompiler_dNative_dModule_dcat (Base_dList.C_Base_dList_dList_Cons (((v_Vuna_dCompiler_dNative_dModule_dgetObjField mc1) (8 * mc2)), (Base_dList.C_Base_dList_dList_Cons ((v_Vuna_dCompiler_dNative_dModule_dsetLocal slot), (Base_dList.C_Base_dList_dList_Cons ((Base_dPair.v_Base_dPair_dfirstOf q), Base_dList.C_Base_dList_dList_Nil))))))); Base_dPair.f_Base_dPair_dPair_second = (Base_dPair.v_Base_dPair_dsecondOf q) }))))) (Base_dPair.v_Base_dPair_dfirstOf slotP))) (v_Vuna_dCompiler_dNative_dModule_dfreshSlot mc0))
  | Base_dList.C_Base_dList_dList_Nil -> (C_Vuna_dCompiler_dNative_dModule_dNRes_NOk ({ Base_dPair.f_Base_dPair_dPair_first = Base_dList.C_Base_dList_dList_Nil; Base_dPair.f_Base_dPair_dPair_second = mc0 }))
  | _ -> failwith "DT: impossible branch"
))

# 771 "Vuna/Compiler/Native/Module.vuna"
let v_Vuna_dCompiler_dNative_dModule_dhasNatBranch = (fun mc0 mc1 -> (match mc0 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (match mc1 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> false
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__105) -> true
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__106) -> true
  | _ -> failwith "DT: impossible branch"
))

# 208 "Vuna/Compiler/Native/Module.vuna"
let rec v_Vuna_dCompiler_dNative_dModule_dgenArgs = (fun mc0 mc1 mc2 -> (match mc2 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__107, dtb__108) -> (if (mc0 <= 0) then (v_Vuna_dCompiler_dNative_dModule_dinternal "native codegen fuel exhausted") else ((v_Vuna_dCompiler_dNative_dModule_dnbind (((v_Vuna_dCompiler_dNative_dModule_dgenExpr (mc0 - 1)) mc1) dtb__107)) (fun p -> ((fun st1 -> ((fun slotP -> ((fun slot -> ((fun st2 -> ((v_Vuna_dCompiler_dNative_dModule_dnbind (((v_Vuna_dCompiler_dNative_dModule_dgenArgs (mc0 - 1)) st2) dtb__108)) (fun q -> ((fun qInstrs -> ((fun qSlots -> ((fun st3 -> (C_Vuna_dCompiler_dNative_dModule_dNRes_NOk ({ Base_dPair.f_Base_dPair_dPair_first = ((Base_dList.v_Base_dList_dappend (Base_dPair.v_Base_dPair_dfirstOf p)) ((Base_dList.v_Base_dList_dappend (v_Vuna_dCompiler_dNative_dModule_dstoreSlot slot)) qInstrs)); Base_dPair.f_Base_dPair_dPair_second = { Base_dPair.f_Base_dPair_dPair_first = (Base_dList.C_Base_dList_dList_Cons (slot, qSlots)); Base_dPair.f_Base_dPair_dPair_second = st3 } }))) (Base_dPair.v_Base_dPair_dsecondOf (Base_dPair.v_Base_dPair_dsecondOf q)))) (Base_dPair.v_Base_dPair_dfirstOf (Base_dPair.v_Base_dPair_dsecondOf q)))) (Base_dPair.v_Base_dPair_dfirstOf q))))) (Base_dPair.v_Base_dPair_dsecondOf slotP))) (Base_dPair.v_Base_dPair_dfirstOf slotP))) (v_Vuna_dCompiler_dNative_dModule_dfreshSlot st1))) (Base_dPair.v_Base_dPair_dsecondOf p)))))
  | Base_dList.C_Base_dList_dList_Nil -> (C_Vuna_dCompiler_dNative_dModule_dNRes_NOk ({ Base_dPair.f_Base_dPair_dPair_first = Base_dList.C_Base_dList_dList_Nil; Base_dPair.f_Base_dPair_dPair_second = { Base_dPair.f_Base_dPair_dPair_first = Base_dList.C_Base_dList_dList_Nil; Base_dPair.f_Base_dPair_dPair_second = mc1 } }))
  | _ -> failwith "DT: impossible branch"
))
# 227 "Vuna/Compiler/Native/Module.vuna"
and v_Vuna_dCompiler_dNative_dModule_dgenSaturatedCall = (fun fuel st label args -> (if (fuel <= 0) then (v_Vuna_dCompiler_dNative_dModule_dinternal "native codegen fuel exhausted") else ((v_Vuna_dCompiler_dNative_dModule_dnbind (((v_Vuna_dCompiler_dNative_dModule_dgenArgs (fuel - 1)) st) args)) (fun p -> ((fun slots -> ((fun st1 -> ((fun regSlots -> ((fun stackSlots -> ((fun k -> ((fun pad -> ((fun popped -> ((fun callPart -> ((fun body -> (C_Vuna_dCompiler_dNative_dModule_dNRes_NOk ({ Base_dPair.f_Base_dPair_dPair_first = ((Base_dList.v_Base_dList_dappend (Base_dPair.v_Base_dPair_dfirstOf p)) body); Base_dPair.f_Base_dPair_dPair_second = st1 }))) ((Base_dList.v_Base_dList_dappend (v_Vuna_dCompiler_dNative_dModule_dpushStackArgs stackSlots)) ((Base_dList.v_Base_dList_dappend ((v_Vuna_dCompiler_dNative_dModule_dloadArgRegs Vuna_dCompiler_dNative_dAbi.v_Vuna_dCompiler_dNative_dAbi_dnativeArgRegs) regSlots)) callPart)))) ((Base_dList.v_Base_dList_dappend (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dInstr_ICall (label)), Base_dList.C_Base_dList_dList_Nil))) (if (popped = 0) then Base_dList.C_Base_dList_dList_Nil else (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dInstr_IBinReg ("add", Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dReg_Rsp, (Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dOperand_OpImm (popped)))), Base_dList.C_Base_dList_dList_Nil)))))) ((bi_natMul 8 k) + pad))) (if ((bi_natSub k (bi_natMul (bi_natDiv k 2) 2)) = 1) then 8 else 0))) (Base_dList.v_Base_dList_dlength stackSlots))) ((Base_dList.v_Base_dList_ddrop Vuna_dCompiler_dNative_dAbi.v_Vuna_dCompiler_dNative_dAbi_dnativeMaxArgs) slots))) ((Base_dList.v_Base_dList_dtake Vuna_dCompiler_dNative_dAbi.v_Vuna_dCompiler_dNative_dAbi_dnativeMaxArgs) slots))) (Base_dPair.v_Base_dPair_dsecondOf (Base_dPair.v_Base_dPair_dsecondOf p)))) (Base_dPair.v_Base_dPair_dfirstOf (Base_dPair.v_Base_dPair_dsecondOf p)))))))
# 255 "Vuna/Compiler/Native/Module.vuna"
and v_Vuna_dCompiler_dNative_dModule_dgenGlobalCall = (fun fuel st name args -> (if (fuel <= 0) then (v_Vuna_dCompiler_dNative_dModule_dinternal "native codegen fuel exhausted") else (match ((v_Vuna_dCompiler_dNative_dModule_dfindDef name) (st).f_Vuna_dCompiler_dNative_dModule_dFGen_fgDefs) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (v_Vuna_dCompiler_dNative_dModule_dinternal ("undefined global in native codegen: " ^ name))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__109) -> ((fun arity -> (if ((Base_dList.v_Base_dList_dlength args) <> arity) then (v_Vuna_dCompiler_dNative_dModule_dunsupported "native target: partial application is not supported yet") else ((((v_Vuna_dCompiler_dNative_dModule_dgenSaturatedCall (fuel - 1)) st) (Vuna_dCompiler_dNative_dAbi.v_Vuna_dCompiler_dNative_dAbi_dnativeFuncLabel name)) args))) (Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirDefArity dtb__109))
  | _ -> failwith "DT: impossible branch"
)))
# 265 "Vuna/Compiler/Native/Module.vuna"
and v_Vuna_dCompiler_dNative_dModule_dgenNatSuccCall = (fun fuel st arg -> (if (fuel <= 0) then (v_Vuna_dCompiler_dNative_dModule_dinternal "native codegen fuel exhausted") else ((v_Vuna_dCompiler_dNative_dModule_dnbind (((v_Vuna_dCompiler_dNative_dModule_dgenExpr (fuel - 1)) st) arg)) (fun p -> (C_Vuna_dCompiler_dNative_dModule_dNRes_NOk ({ Base_dPair.f_Base_dPair_dPair_first = ((Base_dList.v_Base_dList_dappend (Base_dPair.v_Base_dPair_dfirstOf p)) (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dInstr_IMov ((Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dOperand_OpReg (Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dReg_Rdi)), (Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dOperand_OpReg (Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dReg_Rax)))), (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dInstr_ICall ((Vuna_dCompiler_dNative_dAbi.v_Vuna_dCompiler_dNative_dAbi_dnativeRtLabel "nat_succ"))), Base_dList.C_Base_dList_dList_Nil))))); Base_dPair.f_Base_dPair_dPair_second = (Base_dPair.v_Base_dPair_dsecondOf p) }))))))
# 271 "Vuna/Compiler/Native/Module.vuna"
and v_Vuna_dCompiler_dNative_dModule_dgenRtApp = (fun fuel st sym args -> (if (fuel <= 0) then (v_Vuna_dCompiler_dNative_dModule_dinternal "native codegen fuel exhausted") else (if (sym = "&&") then ((((v_Vuna_dCompiler_dNative_dModule_dgenBoolChain (fuel - 1)) st) args) true) else (if (sym = "||") then ((((v_Vuna_dCompiler_dNative_dModule_dgenBoolChain (fuel - 1)) st) args) false) else (match (Vuna_dCompiler_dNative_dRuntime.v_Vuna_dCompiler_dNative_dRuntime_dnativeRtTarget sym) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (v_Vuna_dCompiler_dNative_dModule_dunsupported (String.concat "" ["native target: runtime symbol `"; sym; "` is not supported yet"]))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__110) -> (if ((Base_dList.v_Base_dList_dlength args) <> (Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirInlineArity sym)) then (v_Vuna_dCompiler_dNative_dModule_dinternal ("runtime symbol arity mismatch: " ^ sym)) else ((((v_Vuna_dCompiler_dNative_dModule_dgenSaturatedCall (fuel - 1)) st) dtb__110) args))
  | _ -> failwith "DT: impossible branch"
)))))
# 283 "Vuna/Compiler/Native/Module.vuna"
and v_Vuna_dCompiler_dNative_dModule_dgenRtValueCall = (fun fuel st sym args -> (if (fuel <= 0) then (v_Vuna_dCompiler_dNative_dModule_dinternal "native codegen fuel exhausted") else ((fun arity -> (if (if (sym = "@vuna@obs@span") then true else (sym = "@vuna@obs@spanLab")) then (v_Vuna_dCompiler_dNative_dModule_dunsupported "native target: obs spans need closures (not supported yet); leaf obs primitives (level/log/counter/mark/sample) are no-op stubs") else (if (arity <= 0) then (v_Vuna_dCompiler_dNative_dModule_dunsupported "native target: runtime function values are not supported yet") else (if ((Base_dList.v_Base_dList_dlength args) <> arity) then (v_Vuna_dCompiler_dNative_dModule_dunsupported "native target: partial application of runtime functions is not supported yet") else (match (Vuna_dCompiler_dNative_dRuntime.v_Vuna_dCompiler_dNative_dRuntime_dnativeRtTarget sym) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (v_Vuna_dCompiler_dNative_dModule_dunsupported (String.concat "" ["native target: runtime symbol `"; sym; "` is not supported yet"]))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__111) -> ((((v_Vuna_dCompiler_dNative_dModule_dgenSaturatedCall (fuel - 1)) st) dtb__111) args)
  | _ -> failwith "DT: impossible branch"
))))) (Vuna_dCompiler_dNative_dRuntime.v_Vuna_dCompiler_dNative_dRuntime_dnativeRtValueArity sym))))
# 298 "Vuna/Compiler/Native/Module.vuna"
and v_Vuna_dCompiler_dNative_dModule_dgenConcatMany = (fun fuel st parts -> (if (fuel <= 0) then (v_Vuna_dCompiler_dNative_dModule_dinternal "native codegen fuel exhausted") else ((fun nd_uscrut3 -> (match nd_uscrut3 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__112, dtb__113) -> (match dtb__113 with
  | Base_dList.C_Base_dList_dList_Nil -> (((v_Vuna_dCompiler_dNative_dModule_dgenExpr (fuel - 1)) st) dtb__112)
  | _ -> ((v_Vuna_dCompiler_dNative_dModule_dnbind (((v_Vuna_dCompiler_dNative_dModule_dgenExpr (fuel - 1)) st) dtb__112)) (fun p -> ((fun slotP -> ((fun slot -> ((fun st1 -> ((v_Vuna_dCompiler_dNative_dModule_dnbind ((((v_Vuna_dCompiler_dNative_dModule_dgenConcatRest (fuel - 1)) st1) slot) dtb__113)) (fun q -> (C_Vuna_dCompiler_dNative_dModule_dNRes_NOk ({ Base_dPair.f_Base_dPair_dPair_first = ((Base_dList.v_Base_dList_dappend (Base_dPair.v_Base_dPair_dfirstOf p)) ((Base_dList.v_Base_dList_dappend (v_Vuna_dCompiler_dNative_dModule_dstoreSlot slot)) (Base_dPair.v_Base_dPair_dfirstOf q))); Base_dPair.f_Base_dPair_dPair_second = (Base_dPair.v_Base_dPair_dsecondOf q) }))))) (Base_dPair.v_Base_dPair_dsecondOf slotP))) (Base_dPair.v_Base_dPair_dfirstOf slotP))) (v_Vuna_dCompiler_dNative_dModule_dfreshSlot (Base_dPair.v_Base_dPair_dsecondOf p)))))
)
  | Base_dList.C_Base_dList_dList_Nil -> (v_Vuna_dCompiler_dNative_dModule_dinternal "empty string concatenation in native codegen")
  | _ -> failwith "DT: impossible branch"
)) parts)))
# 312 "Vuna/Compiler/Native/Module.vuna"
and v_Vuna_dCompiler_dNative_dModule_dgenConcatRest = (fun mc0 mc1 mc2 mc3 -> (match mc3 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__114, dtb__115) -> (if (mc0 <= 0) then (v_Vuna_dCompiler_dNative_dModule_dinternal "native codegen fuel exhausted") else ((v_Vuna_dCompiler_dNative_dModule_dnbind (((v_Vuna_dCompiler_dNative_dModule_dgenExpr (mc0 - 1)) mc1) dtb__114)) (fun p -> ((v_Vuna_dCompiler_dNative_dModule_dnbind ((((v_Vuna_dCompiler_dNative_dModule_dgenConcatRest (mc0 - 1)) (Base_dPair.v_Base_dPair_dsecondOf p)) mc2) dtb__115)) (fun q -> (C_Vuna_dCompiler_dNative_dModule_dNRes_NOk ({ Base_dPair.f_Base_dPair_dPair_first = ((Base_dList.v_Base_dList_dappend (Base_dPair.v_Base_dPair_dfirstOf p)) ((Base_dList.v_Base_dList_dappend (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dInstr_IMov ((Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dOperand_OpReg (Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dReg_Rsi)), (Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dOperand_OpReg (Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dReg_Rax)))), Base_dList.C_Base_dList_dList_Nil))) ((Base_dList.v_Base_dList_dappend ((v_Vuna_dCompiler_dNative_dModule_dloadReg Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dReg_Rdi) mc2)) ((Base_dList.v_Base_dList_dappend (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dInstr_ICall ((Vuna_dCompiler_dNative_dAbi.v_Vuna_dCompiler_dNative_dAbi_dnativeRtLabel "str_concat"))), (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dInstr_IMov ((Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dOperand_OpMem (Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dReg_Rbp, (Vuna_dCompiler_dNative_dAbi.v_Vuna_dCompiler_dNative_dAbi_dnativeSlotOff mc2))), (Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dOperand_OpReg (Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dReg_Rax)))), Base_dList.C_Base_dList_dList_Nil))))) (Base_dPair.v_Base_dPair_dfirstOf q))))); Base_dPair.f_Base_dPair_dPair_second = (Base_dPair.v_Base_dPair_dsecondOf q) })))))))
  | Base_dList.C_Base_dList_dList_Nil -> (C_Vuna_dCompiler_dNative_dModule_dNRes_NOk ({ Base_dPair.f_Base_dPair_dPair_first = (v_Vuna_dCompiler_dNative_dModule_dloadSlot mc2); Base_dPair.f_Base_dPair_dPair_second = mc1 }))
  | _ -> failwith "DT: impossible branch"
))
# 319 "Vuna/Compiler/Native/Module.vuna"
and v_Vuna_dCompiler_dNative_dModule_dgenExpr = (fun fuel st ir -> (if (fuel <= 0) then (v_Vuna_dCompiler_dNative_dModule_dinternal "native codegen fuel exhausted") else ((fun nd_uscrut3 -> (match nd_uscrut3 with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrEffBind (dtb__116, dtb__117, dtb__118) -> (v_Vuna_dCompiler_dNative_dModule_dunsupported "native target: effect bindings are not supported yet")
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrEffThunk (dtb__119, dtb__120, dtb__121, dtb__122, dtb__123) -> (v_Vuna_dCompiler_dNative_dModule_dunsupported "native target: effect thunks are not supported yet")
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrFloatLit (dtb__124) -> (v_Vuna_dCompiler_dNative_dModule_dunsupported "native target: float literals are not supported yet")
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRt (dtb__125) -> (if (dtb__125 = "@vuna@obs@span") then (v_Vuna_dCompiler_dNative_dModule_dunsupported "native target: obs spans need closures (not supported yet); leaf obs primitives (level/log/counter/mark/sample) are no-op stubs") else (if (dtb__125 = "@vuna@obs@spanLab") then (v_Vuna_dCompiler_dNative_dModule_dunsupported "native target: obs spans need closures (not supported yet); leaf obs primitives (level/log/counter/mark/sample) are no-op stubs") else (v_Vuna_dCompiler_dNative_dModule_dunsupported "native target: runtime function values are not supported yet")))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLam (dtb__126, dtb__127) -> (v_Vuna_dCompiler_dNative_dModule_dunsupported "native target: lambdas are not supported yet")
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCase (dtb__128, dtb__129) -> ((((v_Vuna_dCompiler_dNative_dModule_dgenCase (fuel - 1)) st) dtb__128) dtb__129)
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrNatCase (dtb__130, dtb__131, dtb__132, dtb__133, dtb__134) -> ((((((v_Vuna_dCompiler_dNative_dModule_dgenNatCase (fuel - 1)) st) dtb__130) dtb__132) dtb__133) dtb__134)
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrConcatMany (dtb__135) -> (((v_Vuna_dCompiler_dNative_dModule_dgenConcatMany (fuel - 1)) st) dtb__135)
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRtApp (dtb__136, dtb__137) -> ((((v_Vuna_dCompiler_dNative_dModule_dgenRtApp (fuel - 1)) st) dtb__136) dtb__137)
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (dtb__138, dtb__139) -> (((v_Vuna_dCompiler_dNative_dModule_dgenApp (fuel - 1)) st) ir)
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRecUpd (dtb__140, dtb__141, dtb__142) -> (((((v_Vuna_dCompiler_dNative_dModule_dgenRecUpd (fuel - 1)) st) dtb__140) dtb__141) dtb__142)
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrProj (dtb__143, dtb__144, dtb__145) -> (((((v_Vuna_dCompiler_dNative_dModule_dgenProj (fuel - 1)) st) dtb__143) dtb__144) dtb__145)
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRecord (dtb__146, dtb__147) -> ((((v_Vuna_dCompiler_dNative_dModule_dgenRecord (fuel - 1)) st) dtb__146) dtb__147)
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCtor (dtb__148, dtb__149, dtb__150) -> (((((v_Vuna_dCompiler_dNative_dModule_dgenCtor (fuel - 1)) st) dtb__148) dtb__149) dtb__150)
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrIf (dtb__151, dtb__152, dtb__153) -> ((v_Vuna_dCompiler_dNative_dModule_dnbind (((v_Vuna_dCompiler_dNative_dModule_dgenExpr (fuel - 1)) st) dtb__151)) (fun p -> ((fun lElseP -> ((fun lElse -> ((fun st1 -> ((fun lEndP -> ((fun lEnd -> ((fun st2 -> ((v_Vuna_dCompiler_dNative_dModule_dnbind (((v_Vuna_dCompiler_dNative_dModule_dgenExpr (fuel - 1)) st2) dtb__152)) (fun pt -> ((v_Vuna_dCompiler_dNative_dModule_dnbind (((v_Vuna_dCompiler_dNative_dModule_dgenExpr (fuel - 1)) (Base_dPair.v_Base_dPair_dsecondOf pt)) dtb__153)) (fun pe -> ((fun body -> (C_Vuna_dCompiler_dNative_dModule_dNRes_NOk ({ Base_dPair.f_Base_dPair_dPair_first = body; Base_dPair.f_Base_dPair_dPair_second = (Base_dPair.v_Base_dPair_dsecondOf pe) }))) ((Base_dList.v_Base_dList_dappend (Base_dPair.v_Base_dPair_dfirstOf p)) ((Base_dList.v_Base_dList_dappend (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dInstr_ITest (Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dReg_Rax, Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dReg_Rax)), (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dInstr_IJcc ("je", lElse)), Base_dList.C_Base_dList_dList_Nil))))) ((Base_dList.v_Base_dList_dappend (Base_dPair.v_Base_dPair_dfirstOf pt)) ((Base_dList.v_Base_dList_dappend (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dInstr_IJmp (lEnd)), (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dInstr_ILabel (lElse)), Base_dList.C_Base_dList_dList_Nil))))) ((Base_dList.v_Base_dList_dappend (Base_dPair.v_Base_dPair_dfirstOf pe)) (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dInstr_ILabel (lEnd)), Base_dList.C_Base_dList_dList_Nil))))))))))))) (Base_dPair.v_Base_dPair_dsecondOf lEndP))) (Base_dPair.v_Base_dPair_dfirstOf lEndP))) (v_Vuna_dCompiler_dNative_dModule_dfreshLabel st1))) (Base_dPair.v_Base_dPair_dsecondOf lElseP))) (Base_dPair.v_Base_dPair_dfirstOf lElseP))) (v_Vuna_dCompiler_dNative_dModule_dfreshLabel (Base_dPair.v_Base_dPair_dsecondOf p)))))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLet (dtb__154, dtb__155, dtb__156) -> ((v_Vuna_dCompiler_dNative_dModule_dnbind (((v_Vuna_dCompiler_dNative_dModule_dgenExpr (fuel - 1)) st) dtb__155)) (fun p -> ((fun rbs -> ((fun st1 -> ((fun nd_uscrut10 -> (match nd_uscrut10 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__157, dtb__158) -> (match dtb__158 with
  | Base_dList.C_Base_dList_dList_Nil -> ((fun slotP -> ((fun slot -> ((fun st2 -> ((v_Vuna_dCompiler_dNative_dModule_dnbind (((v_Vuna_dCompiler_dNative_dModule_dgenExpr (fuel - 1)) (((v_Vuna_dCompiler_dNative_dModule_dpushBinder dtb__157) slot) st2)) dtb__156)) (fun q -> (C_Vuna_dCompiler_dNative_dModule_dNRes_NOk ({ Base_dPair.f_Base_dPair_dPair_first = ((Base_dList.v_Base_dList_dappend (Base_dPair.v_Base_dPair_dfirstOf p)) ((Base_dList.v_Base_dList_dappend (v_Vuna_dCompiler_dNative_dModule_dstoreSlot slot)) (Base_dPair.v_Base_dPair_dfirstOf q))); Base_dPair.f_Base_dPair_dPair_second = ((v_Vuna_dCompiler_dNative_dModule_drestoreBinderScope (Base_dPair.v_Base_dPair_dsecondOf q)) (st1).f_Vuna_dCompiler_dNative_dModule_dFGen_fgSlots) }))))) (Base_dPair.v_Base_dPair_dsecondOf slotP))) (Base_dPair.v_Base_dPair_dfirstOf slotP))) (v_Vuna_dCompiler_dNative_dModule_dfreshSlot st1))
  | _ -> (v_Vuna_dCompiler_dNative_dModule_dunsupported "native target: let with more than one runtime binder is not supported yet")
)
  | Base_dList.C_Base_dList_dList_Nil -> ((v_Vuna_dCompiler_dNative_dModule_dnbind (((v_Vuna_dCompiler_dNative_dModule_dgenExpr (fuel - 1)) st1) dtb__156)) (fun q -> (C_Vuna_dCompiler_dNative_dModule_dNRes_NOk ({ Base_dPair.f_Base_dPair_dPair_first = ((Base_dList.v_Base_dList_dappend (Base_dPair.v_Base_dPair_dfirstOf p)) (Base_dPair.v_Base_dPair_dfirstOf q)); Base_dPair.f_Base_dPair_dPair_second = (Base_dPair.v_Base_dPair_dsecondOf q) }))))
  | _ -> failwith "DT: impossible branch"
)) rbs)) (Base_dPair.v_Base_dPair_dsecondOf p))) (v_Vuna_dCompiler_dNative_dModule_druntimeBinders dtb__154))))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCast (dtb__159) -> (((v_Vuna_dCompiler_dNative_dModule_dgenExpr (fuel - 1)) st) dtb__159)
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrBool (dtb__160) -> (C_Vuna_dCompiler_dNative_dModule_dNRes_NOk ({ Base_dPair.f_Base_dPair_dPair_first = (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dInstr_IMov ((Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dOperand_OpReg (Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dReg_Rax)), (Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dOperand_OpImm ((if dtb__160 then 1 else 0))))), Base_dList.C_Base_dList_dList_Nil)); Base_dPair.f_Base_dPair_dPair_second = st }))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrStr (dtb__161) -> (match ((v_Vuna_dCompiler_dNative_dModule_dpoolLabelOf dtb__161) (st).f_Vuna_dCompiler_dNative_dModule_dFGen_fgPool) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (v_Vuna_dCompiler_dNative_dModule_dinternal "string literal missing from native pool")
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__162) -> (C_Vuna_dCompiler_dNative_dModule_dNRes_NOk ({ Base_dPair.f_Base_dPair_dPair_first = (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dInstr_ILea (Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dReg_Rax, dtb__162)), Base_dList.C_Base_dList_dList_Nil)); Base_dPair.f_Base_dPair_dPair_second = st }))
  | _ -> failwith "DT: impossible branch"
)
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrInt (dtb__163) -> (if (if (dtb__163 < ((0 - 4611686018427387903) - 1)) then true else (dtb__163 > 4611686018427387903)) then (v_Vuna_dCompiler_dNative_dModule_dunsupported "native target: integer literal outside the 63-bit range") else (C_Vuna_dCompiler_dNative_dModule_dNRes_NOk ({ Base_dPair.f_Base_dPair_dPair_first = (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dInstr_IMov ((Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dOperand_OpReg (Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dReg_Rax)), (Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dOperand_OpImm (dtb__163)))), Base_dList.C_Base_dList_dList_Nil)); Base_dPair.f_Base_dPair_dPair_second = st })))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrGlobal (dtb__164) -> (match ((v_Vuna_dCompiler_dNative_dModule_dfindDef dtb__164) (st).f_Vuna_dCompiler_dNative_dModule_dFGen_fgDefs) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (v_Vuna_dCompiler_dNative_dModule_dinternal ("undefined global in native codegen: " ^ dtb__164))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__165) -> (if ((Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirDefArity dtb__165) = 0) then (C_Vuna_dCompiler_dNative_dModule_dNRes_NOk ({ Base_dPair.f_Base_dPair_dPair_first = (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dInstr_ICall ((Vuna_dCompiler_dNative_dAbi.v_Vuna_dCompiler_dNative_dAbi_dnativeFuncLabel dtb__164))), Base_dList.C_Base_dList_dList_Nil)); Base_dPair.f_Base_dPair_dPair_second = st })) else (v_Vuna_dCompiler_dNative_dModule_dunsupported "native target: function values are not supported yet"))
  | _ -> failwith "DT: impossible branch"
)
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrVar (dtb__166) -> (match ((v_Vuna_dCompiler_dNative_dModule_dlookupBinder dtb__166) (st).f_Vuna_dCompiler_dNative_dModule_dFGen_fgSlots) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__167) -> (C_Vuna_dCompiler_dNative_dModule_dNRes_NOk ({ Base_dPair.f_Base_dPair_dPair_first = (v_Vuna_dCompiler_dNative_dModule_dloadSlot dtb__167); Base_dPair.f_Base_dPair_dPair_second = st }))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (v_Vuna_dCompiler_dNative_dModule_dinternal "unbound runtime binder in native codegen")
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) ir)))
# 392 "Vuna/Compiler/Native/Module.vuna"
and v_Vuna_dCompiler_dNative_dModule_dgenBoolChain = (fun fuel st args isAnd -> (if (fuel <= 0) then (v_Vuna_dCompiler_dNative_dModule_dinternal "native codegen fuel exhausted") else ((fun nd_uscrut4 -> (match nd_uscrut4 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__168, dtb__169) -> (match dtb__169 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__170, dtb__171) -> (match dtb__171 with
  | Base_dList.C_Base_dList_dList_Nil -> ((v_Vuna_dCompiler_dNative_dModule_dnbind (((v_Vuna_dCompiler_dNative_dModule_dgenExpr (fuel - 1)) st) dtb__168)) (fun p -> ((fun lEndP -> ((fun lEnd -> ((fun st1 -> ((fun cond -> ((v_Vuna_dCompiler_dNative_dModule_dnbind (((v_Vuna_dCompiler_dNative_dModule_dgenExpr (fuel - 1)) st1) dtb__170)) (fun q -> (C_Vuna_dCompiler_dNative_dModule_dNRes_NOk ({ Base_dPair.f_Base_dPair_dPair_first = ((Base_dList.v_Base_dList_dappend (Base_dPair.v_Base_dPair_dfirstOf p)) ((Base_dList.v_Base_dList_dappend (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dInstr_ITest (Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dReg_Rax, Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dReg_Rax)), (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dInstr_IJcc (cond, lEnd)), Base_dList.C_Base_dList_dList_Nil))))) ((Base_dList.v_Base_dList_dappend (Base_dPair.v_Base_dPair_dfirstOf q)) (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dInstr_ILabel (lEnd)), Base_dList.C_Base_dList_dList_Nil))))); Base_dPair.f_Base_dPair_dPair_second = (Base_dPair.v_Base_dPair_dsecondOf q) }))))) (if isAnd then "je" else "jne"))) (Base_dPair.v_Base_dPair_dsecondOf lEndP))) (Base_dPair.v_Base_dPair_dfirstOf lEndP))) (v_Vuna_dCompiler_dNative_dModule_dfreshLabel (Base_dPair.v_Base_dPair_dsecondOf p)))))
  | _ -> (v_Vuna_dCompiler_dNative_dModule_dinternal "`&&`/`||` must have exactly two arguments")
)
  | _ -> (v_Vuna_dCompiler_dNative_dModule_dinternal "`&&`/`||` must have exactly two arguments")
)
  | _ -> (v_Vuna_dCompiler_dNative_dModule_dinternal "`&&`/`||` must have exactly two arguments")
)) args)))
# 413 "Vuna/Compiler/Native/Module.vuna"
and v_Vuna_dCompiler_dNative_dModule_dgenLamApp = (fun fuel st b arg body -> (if (fuel <= 0) then (v_Vuna_dCompiler_dNative_dModule_dinternal "native codegen fuel exhausted") else ((v_Vuna_dCompiler_dNative_dModule_dnbind (((v_Vuna_dCompiler_dNative_dModule_dgenExpr (fuel - 1)) st) arg)) (fun p -> ((fun slotP -> ((fun slot -> ((fun st1 -> ((v_Vuna_dCompiler_dNative_dModule_dnbind (((v_Vuna_dCompiler_dNative_dModule_dgenExpr (fuel - 1)) (((v_Vuna_dCompiler_dNative_dModule_dpushBinder b) slot) st1)) body)) (fun q -> (C_Vuna_dCompiler_dNative_dModule_dNRes_NOk ({ Base_dPair.f_Base_dPair_dPair_first = ((Base_dList.v_Base_dList_dappend (Base_dPair.v_Base_dPair_dfirstOf p)) ((Base_dList.v_Base_dList_dappend (v_Vuna_dCompiler_dNative_dModule_dstoreSlot slot)) (Base_dPair.v_Base_dPair_dfirstOf q))); Base_dPair.f_Base_dPair_dPair_second = ((v_Vuna_dCompiler_dNative_dModule_drestoreBinderScope (Base_dPair.v_Base_dPair_dsecondOf q)) (st).f_Vuna_dCompiler_dNative_dModule_dFGen_fgSlots) }))))) (Base_dPair.v_Base_dPair_dsecondOf slotP))) (Base_dPair.v_Base_dPair_dfirstOf slotP))) (v_Vuna_dCompiler_dNative_dModule_dfreshSlot (Base_dPair.v_Base_dPair_dsecondOf p)))))))
# 423 "Vuna/Compiler/Native/Module.vuna"
and v_Vuna_dCompiler_dNative_dModule_dgenApp = (fun fuel st ir -> (if (fuel <= 0) then (v_Vuna_dCompiler_dNative_dModule_dinternal "native codegen fuel exhausted") else (match (v_Vuna_dCompiler_dNative_dModule_dflattenApp ir) with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__172; Base_dPair.f_Base_dPair_dPair_second = dtb__173 } -> (match dtb__172 with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrGlobal (dtb__174) -> ((((v_Vuna_dCompiler_dNative_dModule_dgenGlobalCall (fuel - 1)) st) dtb__174) dtb__173)
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRt (dtb__175) -> (if (dtb__175 = Vuna_dCompiler_dIr_dRuntime.v_Vuna_dCompiler_dIr_dRuntime_dirRtNatSucc) then ((fun nd_uscrut8 -> (match nd_uscrut8 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__176, dtb__177) -> (match dtb__177 with
  | Base_dList.C_Base_dList_dList_Nil -> (((v_Vuna_dCompiler_dNative_dModule_dgenNatSuccCall (fuel - 1)) st) dtb__176)
  | _ -> (v_Vuna_dCompiler_dNative_dModule_dinternal "Nat Succ must have exactly one argument")
)
  | _ -> (v_Vuna_dCompiler_dNative_dModule_dinternal "Nat Succ must have exactly one argument")
)) dtb__173) else ((((v_Vuna_dCompiler_dNative_dModule_dgenRtValueCall (fuel - 1)) st) dtb__175) dtb__173))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLam (dtb__178, dtb__179) -> ((fun nd_uscrut9 -> (match nd_uscrut9 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__180, dtb__181) -> (match dtb__181 with
  | Base_dList.C_Base_dList_dList_Nil -> ((fun nd_uscrut14 -> (match nd_uscrut14 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__182, dtb__183) -> (match dtb__183 with
  | Base_dList.C_Base_dList_dList_Nil -> (((((v_Vuna_dCompiler_dNative_dModule_dgenLamApp (fuel - 1)) st) dtb__180) dtb__182) dtb__179)
  | _ -> (v_Vuna_dCompiler_dNative_dModule_dunsupported "native target: only saturated single-argument lambdas are supported yet")
)
  | _ -> (v_Vuna_dCompiler_dNative_dModule_dunsupported "native target: only saturated single-argument lambdas are supported yet")
)) dtb__173)
  | _ -> (v_Vuna_dCompiler_dNative_dModule_dunsupported "native target: lambdas are not supported yet")
)
  | _ -> (v_Vuna_dCompiler_dNative_dModule_dunsupported "native target: lambdas are not supported yet")
)) (v_Vuna_dCompiler_dNative_dModule_druntimeBinders dtb__178))
  | _ -> (v_Vuna_dCompiler_dNative_dModule_dunsupported "native target: higher-order application is not supported yet")
)
  | _ -> failwith "DT: impossible branch"
)))
# 535 "Vuna/Compiler/Native/Module.vuna"
and v_Vuna_dCompiler_dNative_dModule_dgenCtor = (fun fuel st family ctor args -> (if (fuel <= 0) then (v_Vuna_dCompiler_dNative_dModule_dinternal "native codegen fuel exhausted") else ((fun nd_uscrut5 -> (match nd_uscrut5 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__184) -> (match dtb__184 with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTyDecl_IrVariantDecl (dtb__185, dtb__186, dtb__187) -> (((((v_Vuna_dCompiler_dNative_dModule_dgenCtorGo fuel) st) dtb__187) ctor) args)
  | _ -> (v_Vuna_dCompiler_dNative_dModule_dinternal (String.concat "" ["constructor `"; ctor; "` does not belong to a variant family: "; family]))
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (v_Vuna_dCompiler_dNative_dModule_dinternal ("unknown data family in native codegen: " ^ family))
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dNative_dModule_ddeclOf family) (st).f_Vuna_dCompiler_dNative_dModule_dFGen_fgFams))))
# 542 "Vuna/Compiler/Native/Module.vuna"
and v_Vuna_dCompiler_dNative_dModule_dgenCtorGo = (fun fuel st ctors ctor args -> (if (fuel <= 0) then (v_Vuna_dCompiler_dNative_dModule_dinternal "native codegen fuel exhausted") else (match ((v_Vuna_dCompiler_dNative_dModule_dctorTagIn ctors) ctor) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (v_Vuna_dCompiler_dNative_dModule_dinternal ("unknown constructor in native codegen: " ^ ctor))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__188) -> (match ((v_Vuna_dCompiler_dNative_dModule_dctorArityIn ctors) ctor) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (v_Vuna_dCompiler_dNative_dModule_dinternal ("unknown constructor in native codegen: " ^ ctor))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__189) -> (if ((v_Vuna_dCompiler_dNative_dModule_dlistLengthI args) <> dtb__189) then (v_Vuna_dCompiler_dNative_dModule_dinternal (String.concat "" ["constructor `"; ctor; "` applied to the wrong number of arguments"])) else ((v_Vuna_dCompiler_dNative_dModule_dnbind (((v_Vuna_dCompiler_dNative_dModule_dgenArgs (fuel - 1)) st) args)) (fun p -> ((((v_Vuna_dCompiler_dNative_dModule_dgenCtorFinish dtb__189) dtb__188) p) ctors))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))
# 566 "Vuna/Compiler/Native/Module.vuna"
and v_Vuna_dCompiler_dNative_dModule_dgenRecord = (fun fuel st family fields -> (if (fuel <= 0) then (v_Vuna_dCompiler_dNative_dModule_dinternal "native codegen fuel exhausted") else ((fun nd_uscrut4 -> (match nd_uscrut4 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__190) -> (match dtb__190 with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTyDecl_IrRecordDecl (dtb__191, dtb__192, dtb__193, dtb__194) -> (if ((v_Vuna_dCompiler_dNative_dModule_dlistLengthI fields) <> (v_Vuna_dCompiler_dNative_dModule_dlistLengthI dtb__193)) then (v_Vuna_dCompiler_dNative_dModule_dinternal (String.concat "" ["record `"; family; "` constructed with the wrong number of fields"])) else ((v_Vuna_dCompiler_dNative_dModule_dnbind (((v_Vuna_dCompiler_dNative_dModule_dgenArgs (fuel - 1)) st) ((Base_dList.v_Base_dList_dmap (fun p -> (Base_dPair.v_Base_dPair_dsecondOf p))) fields))) (fun p -> ((v_Vuna_dCompiler_dNative_dModule_dgenRecordFinish p) dtb__193))))
  | _ -> (v_Vuna_dCompiler_dNative_dModule_dinternal (String.concat "" ["family `"; family; "` is not a record"]))
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (v_Vuna_dCompiler_dNative_dModule_dinternal ("unknown record family in native codegen: " ^ family))
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dNative_dModule_ddeclOf family) (st).f_Vuna_dCompiler_dNative_dModule_dFGen_fgFams))))
# 585 "Vuna/Compiler/Native/Module.vuna"
and v_Vuna_dCompiler_dNative_dModule_dgenProj = (fun fuel st base family field -> (if (fuel <= 0) then (v_Vuna_dCompiler_dNative_dModule_dinternal "native codegen fuel exhausted") else ((fun nd_uscrut5 -> (match nd_uscrut5 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__195) -> (match dtb__195 with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTyDecl_IrRecordDecl (dtb__196, dtb__197, dtb__198, dtb__199) -> (match ((v_Vuna_dCompiler_dNative_dModule_drecordPosOf dtb__198) field) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (v_Vuna_dCompiler_dNative_dModule_dinternal (String.concat "" ["unknown record field in native codegen: `"; family; "."; field; "`"]))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__200) -> ((v_Vuna_dCompiler_dNative_dModule_dnbind (((v_Vuna_dCompiler_dNative_dModule_dgenExpr (fuel - 1)) st) base)) (fun p -> ((v_Vuna_dCompiler_dNative_dModule_dgenProjFinish p) dtb__200)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> (v_Vuna_dCompiler_dNative_dModule_dinternal (String.concat "" ["family `"; family; "` is not a record"]))
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (v_Vuna_dCompiler_dNative_dModule_dinternal ("unknown record family in native codegen: " ^ family))
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dNative_dModule_ddeclOf family) (st).f_Vuna_dCompiler_dNative_dModule_dFGen_fgFams))))
# 603 "Vuna/Compiler/Native/Module.vuna"
and v_Vuna_dCompiler_dNative_dModule_dgenRecUpd = (fun fuel st base family fields -> (if (fuel <= 0) then (v_Vuna_dCompiler_dNative_dModule_dinternal "native codegen fuel exhausted") else ((fun nd_uscrut5 -> (match nd_uscrut5 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__201) -> (match dtb__201 with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTyDecl_IrRecordDecl (dtb__202, dtb__203, dtb__204, dtb__205) -> ((v_Vuna_dCompiler_dNative_dModule_dnbind (((v_Vuna_dCompiler_dNative_dModule_dgenExpr (fuel - 1)) st) base)) (fun p -> (((((v_Vuna_dCompiler_dNative_dModule_dgenRecUpdStart fuel) (Base_dPair.v_Base_dPair_dfirstOf p)) (Base_dPair.v_Base_dPair_dsecondOf p)) dtb__204) fields)))
  | _ -> (v_Vuna_dCompiler_dNative_dModule_dinternal (String.concat "" ["family `"; family; "` is not a record"]))
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (v_Vuna_dCompiler_dNative_dModule_dinternal ("unknown record family in native codegen: " ^ family))
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dNative_dModule_ddeclOf family) (st).f_Vuna_dCompiler_dNative_dModule_dFGen_fgFams))))
# 612 "Vuna/Compiler/Native/Module.vuna"
and v_Vuna_dCompiler_dNative_dModule_dgenRecUpdStart = (fun fuel baseInstrs st flds fields -> (if (fuel <= 0) then (v_Vuna_dCompiler_dNative_dModule_dinternal "native codegen fuel exhausted") else ((fun baseP -> ((fun baseSlot -> ((fun allocP -> ((fun obj -> ((v_Vuna_dCompiler_dNative_dModule_dnbind (((((((v_Vuna_dCompiler_dNative_dModule_dgenUpdFields (fuel - 1)) (Base_dPair.v_Base_dPair_dsecondOf (Base_dPair.v_Base_dPair_dsecondOf allocP))) baseSlot) obj) 0) flds) fields)) (fun q -> (C_Vuna_dCompiler_dNative_dModule_dNRes_NOk ({ Base_dPair.f_Base_dPair_dPair_first = (v_Vuna_dCompiler_dNative_dModule_dcat (Base_dList.C_Base_dList_dList_Cons (baseInstrs, (Base_dList.C_Base_dList_dList_Cons ((v_Vuna_dCompiler_dNative_dModule_dsetLocal baseSlot), (Base_dList.C_Base_dList_dList_Cons ((Base_dPair.v_Base_dPair_dfirstOf allocP), (Base_dList.C_Base_dList_dList_Cons ((Base_dPair.v_Base_dPair_dfirstOf q), (Base_dList.C_Base_dList_dList_Cons ((v_Vuna_dCompiler_dNative_dModule_dgetLocal obj), Base_dList.C_Base_dList_dList_Nil))))))))))); Base_dPair.f_Base_dPair_dPair_second = (Base_dPair.v_Base_dPair_dsecondOf q) }))))) (Base_dPair.v_Base_dPair_dfirstOf (Base_dPair.v_Base_dPair_dsecondOf allocP)))) ((v_Vuna_dCompiler_dNative_dModule_dgenAlloc (Base_dPair.v_Base_dPair_dsecondOf baseP)) (v_Vuna_dCompiler_dNative_dModule_dlistLengthI flds)))) (Base_dPair.v_Base_dPair_dfirstOf baseP))) (v_Vuna_dCompiler_dNative_dModule_dfreshSlot st))))
# 623 "Vuna/Compiler/Native/Module.vuna"
and v_Vuna_dCompiler_dNative_dModule_dgenUpdFields = (fun fuel st baseSlot obj idx flds fields -> (if (fuel <= 0) then (v_Vuna_dCompiler_dNative_dModule_dinternal "native codegen fuel exhausted") else ((fun nd_uscrut7 -> (match nd_uscrut7 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__206, dtb__207) -> (match dtb__206 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__208; Base_dPair.f_Base_dPair_dPair_second = dtb__209 } -> (match ((v_Vuna_dCompiler_dNative_dModule_dlookupFieldIr dtb__209) fields) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__210) -> ((v_Vuna_dCompiler_dNative_dModule_dnbind (((v_Vuna_dCompiler_dNative_dModule_dgenExpr (fuel - 1)) st) dtb__210)) (fun p -> ((fun valP -> ((fun val_ -> ((v_Vuna_dCompiler_dNative_dModule_dnbind (((((((v_Vuna_dCompiler_dNative_dModule_dgenUpdFields (fuel - 1)) (Base_dPair.v_Base_dPair_dsecondOf valP)) baseSlot) obj) (idx + 1)) dtb__207) fields)) (fun q -> (C_Vuna_dCompiler_dNative_dModule_dNRes_NOk ({ Base_dPair.f_Base_dPair_dPair_first = (v_Vuna_dCompiler_dNative_dModule_dcat (Base_dList.C_Base_dList_dList_Cons ((Base_dPair.v_Base_dPair_dfirstOf p), (Base_dList.C_Base_dList_dList_Cons ((v_Vuna_dCompiler_dNative_dModule_dsetLocal val_), (Base_dList.C_Base_dList_dList_Cons ((((v_Vuna_dCompiler_dNative_dModule_dsetObjFromSlot obj) (8 * idx)) val_), (Base_dList.C_Base_dList_dList_Cons ((Base_dPair.v_Base_dPair_dfirstOf q), Base_dList.C_Base_dList_dList_Nil))))))))); Base_dPair.f_Base_dPair_dPair_second = (Base_dPair.v_Base_dPair_dsecondOf q) }))))) (Base_dPair.v_Base_dPair_dfirstOf valP))) (v_Vuna_dCompiler_dNative_dModule_dfreshSlot (Base_dPair.v_Base_dPair_dsecondOf p)))))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((fun srcP -> ((fun src -> ((v_Vuna_dCompiler_dNative_dModule_dnbind (((((((v_Vuna_dCompiler_dNative_dModule_dgenUpdFields (fuel - 1)) (Base_dPair.v_Base_dPair_dsecondOf srcP)) baseSlot) obj) (idx + 1)) dtb__207) fields)) (fun q -> (C_Vuna_dCompiler_dNative_dModule_dNRes_NOk ({ Base_dPair.f_Base_dPair_dPair_first = (v_Vuna_dCompiler_dNative_dModule_dcat (Base_dList.C_Base_dList_dList_Cons (((v_Vuna_dCompiler_dNative_dModule_dgetObjField baseSlot) (8 * idx)), (Base_dList.C_Base_dList_dList_Cons ((v_Vuna_dCompiler_dNative_dModule_dsetLocal src), (Base_dList.C_Base_dList_dList_Cons ((((v_Vuna_dCompiler_dNative_dModule_dsetObjFromSlot obj) (8 * idx)) src), (Base_dList.C_Base_dList_dList_Cons ((Base_dPair.v_Base_dPair_dfirstOf q), Base_dList.C_Base_dList_dList_Nil))))))))); Base_dPair.f_Base_dPair_dPair_second = (Base_dPair.v_Base_dPair_dsecondOf q) }))))) (Base_dPair.v_Base_dPair_dfirstOf srcP))) (v_Vuna_dCompiler_dNative_dModule_dfreshSlot st))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> (C_Vuna_dCompiler_dNative_dModule_dNRes_NOk ({ Base_dPair.f_Base_dPair_dPair_first = Base_dList.C_Base_dList_dList_Nil; Base_dPair.f_Base_dPair_dPair_second = st }))
  | _ -> failwith "DT: impossible branch"
)) flds)))
# 650 "Vuna/Compiler/Native/Module.vuna"
and v_Vuna_dCompiler_dNative_dModule_dgenCase = (fun fuel st scrut alts -> (if (fuel <= 0) then (v_Vuna_dCompiler_dNative_dModule_dinternal "native codegen fuel exhausted") else ((v_Vuna_dCompiler_dNative_dModule_dnbind (((v_Vuna_dCompiler_dNative_dModule_dgenExpr (fuel - 1)) st) scrut)) (fun p -> ((fun scP -> ((fun sc -> ((v_Vuna_dCompiler_dNative_dModule_dnbind ((((v_Vuna_dCompiler_dNative_dModule_dgenCaseAlts (fuel - 1)) (Base_dPair.v_Base_dPair_dsecondOf scP)) sc) alts)) (fun q -> (C_Vuna_dCompiler_dNative_dModule_dNRes_NOk ({ Base_dPair.f_Base_dPair_dPair_first = (v_Vuna_dCompiler_dNative_dModule_dcat (Base_dList.C_Base_dList_dList_Cons ((Base_dPair.v_Base_dPair_dfirstOf p), (Base_dList.C_Base_dList_dList_Cons ((v_Vuna_dCompiler_dNative_dModule_dsetLocal sc), (Base_dList.C_Base_dList_dList_Cons ((Base_dPair.v_Base_dPair_dfirstOf q), Base_dList.C_Base_dList_dList_Nil))))))); Base_dPair.f_Base_dPair_dPair_second = (Base_dPair.v_Base_dPair_dsecondOf q) }))))) (Base_dPair.v_Base_dPair_dfirstOf scP))) (v_Vuna_dCompiler_dNative_dModule_dfreshSlot (Base_dPair.v_Base_dPair_dsecondOf p)))))))
# 659 "Vuna/Compiler/Native/Module.vuna"
and v_Vuna_dCompiler_dNative_dModule_dgenCaseAlts = (fun fuel st sc alts -> (if (fuel <= 0) then (v_Vuna_dCompiler_dNative_dModule_dinternal "native codegen fuel exhausted") else (match (v_Vuna_dCompiler_dNative_dModule_dcaseFamilyOf alts) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((((v_Vuna_dCompiler_dNative_dModule_dgenDefault fuel) st) sc) alts)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__211) -> ((fun nd_uscrut6 -> (match nd_uscrut6 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__212) -> (match dtb__212 with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTyDecl_IrRecordDecl (dtb__213, dtb__214, dtb__215, dtb__216) -> ((((v_Vuna_dCompiler_dNative_dModule_dgenRecordAlts fuel) st) sc) alts)
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTyDecl_IrVariantDecl (dtb__217, dtb__218, dtb__219) -> (((((v_Vuna_dCompiler_dNative_dModule_dgenVariantAlts fuel) st) sc) dtb__219) alts)
  | _ -> (v_Vuna_dCompiler_dNative_dModule_dinternal "case on an unboxed family is not supported yet")
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (v_Vuna_dCompiler_dNative_dModule_dinternal ("unknown data family in native codegen: " ^ dtb__211))
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dNative_dModule_ddeclOf dtb__211) (st).f_Vuna_dCompiler_dNative_dModule_dFGen_fgFams))
  | _ -> failwith "DT: impossible branch"
)))
# 684 "Vuna/Compiler/Native/Module.vuna"
and v_Vuna_dCompiler_dNative_dModule_dgenDefault = (fun fuel st sc alts -> (if (fuel <= 0) then (v_Vuna_dCompiler_dNative_dModule_dinternal "native codegen fuel exhausted") else (match (v_Vuna_dCompiler_dNative_dModule_dfindCatchAll alts) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (C_Vuna_dCompiler_dNative_dModule_dNRes_NOk ({ Base_dPair.f_Base_dPair_dPair_first = v_Vuna_dCompiler_dNative_dModule_dtrapImpossible; Base_dPair.f_Base_dPair_dPair_second = st }))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__220) -> ((((v_Vuna_dCompiler_dNative_dModule_dgenArm fuel) st) sc) dtb__220)
  | _ -> failwith "DT: impossible branch"
)))
# 690 "Vuna/Compiler/Native/Module.vuna"
and v_Vuna_dCompiler_dNative_dModule_dgenArm = (fun fuel st sc alt -> (if (fuel <= 0) then (v_Vuna_dCompiler_dNative_dModule_dinternal "native codegen fuel exhausted") else ((fun nd_uscrut4 -> (match nd_uscrut4 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__221, dtb__222) -> (match dtb__222 with
  | Base_dList.C_Base_dList_dList_Nil -> ((fun slotP -> ((fun slot -> ((v_Vuna_dCompiler_dNative_dModule_dnbind (((v_Vuna_dCompiler_dNative_dModule_dgenExpr (fuel - 1)) (((v_Vuna_dCompiler_dNative_dModule_dpushBinder dtb__221) slot) (Base_dPair.v_Base_dPair_dsecondOf slotP))) (Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirAltBodyOf alt))) (fun q -> (C_Vuna_dCompiler_dNative_dModule_dNRes_NOk ({ Base_dPair.f_Base_dPair_dPair_first = (v_Vuna_dCompiler_dNative_dModule_dcat (Base_dList.C_Base_dList_dList_Cons ((v_Vuna_dCompiler_dNative_dModule_dgetLocal sc), (Base_dList.C_Base_dList_dList_Cons ((v_Vuna_dCompiler_dNative_dModule_dsetLocal slot), (Base_dList.C_Base_dList_dList_Cons ((Base_dPair.v_Base_dPair_dfirstOf q), Base_dList.C_Base_dList_dList_Nil))))))); Base_dPair.f_Base_dPair_dPair_second = (Base_dPair.v_Base_dPair_dsecondOf q) }))))) (Base_dPair.v_Base_dPair_dfirstOf slotP))) (v_Vuna_dCompiler_dNative_dModule_dfreshSlot st))
  | _ -> (v_Vuna_dCompiler_dNative_dModule_dinternal "case arm has more than one runtime binder")
)
  | Base_dList.C_Base_dList_dList_Nil -> (((v_Vuna_dCompiler_dNative_dModule_dgenExpr (fuel - 1)) st) (Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirAltBodyOf alt))
  | _ -> failwith "DT: impossible branch"
)) (v_Vuna_dCompiler_dNative_dModule_druntimeBinders (Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirAltBindersOf alt)))))
# 706 "Vuna/Compiler/Native/Module.vuna"
and v_Vuna_dCompiler_dNative_dModule_dgenVariantAlts = (fun fuel st sc ctors alts -> (if (fuel <= 0) then (v_Vuna_dCompiler_dNative_dModule_dinternal "native codegen fuel exhausted") else (match alts with
  | Base_dList.C_Base_dList_dList_Nil -> ((((v_Vuna_dCompiler_dNative_dModule_dgenDefault (fuel - 1)) st) sc) Base_dList.C_Base_dList_dList_Nil)
  | Base_dList.C_Base_dList_dList_Cons (dtb__223, dtb__224) -> ((fun nd_uscrut8 -> (match nd_uscrut8 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__225) -> (match dtb__225 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__226; Base_dPair.f_Base_dPair_dPair_second = dtb__227 } -> (match ((v_Vuna_dCompiler_dNative_dModule_dctorTagIn ctors) dtb__227) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (v_Vuna_dCompiler_dNative_dModule_dinternal ("unknown constructor in native codegen: " ^ dtb__227))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__228) -> ((fun lNextP -> ((fun lNext -> ((fun lEndP -> ((fun lEnd -> ((v_Vuna_dCompiler_dNative_dModule_dnbind ((((v_Vuna_dCompiler_dNative_dModule_dgenVariantArm (fuel - 1)) (Base_dPair.v_Base_dPair_dsecondOf lEndP)) sc) dtb__223)) (fun a -> ((v_Vuna_dCompiler_dNative_dModule_dnbind (((((v_Vuna_dCompiler_dNative_dModule_dgenVariantAlts (fuel - 1)) (Base_dPair.v_Base_dPair_dsecondOf a)) sc) ctors) dtb__224)) (fun r -> (C_Vuna_dCompiler_dNative_dModule_dNRes_NOk ({ Base_dPair.f_Base_dPair_dPair_first = (v_Vuna_dCompiler_dNative_dModule_dcat (Base_dList.C_Base_dList_dList_Cons ((v_Vuna_dCompiler_dNative_dModule_dtagOfScrut sc), (Base_dList.C_Base_dList_dList_Cons ((Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dInstr_ICmp ((Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dOperand_OpReg (Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dReg_Rax)), (Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dOperand_OpImm (dtb__228)))), (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dInstr_IJcc ("jne", lNext)), Base_dList.C_Base_dList_dList_Nil)))), (Base_dList.C_Base_dList_dList_Cons ((Base_dPair.v_Base_dPair_dfirstOf a), (Base_dList.C_Base_dList_dList_Cons ((Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dInstr_IJmp (lEnd)), (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dInstr_ILabel (lNext)), Base_dList.C_Base_dList_dList_Nil)))), (Base_dList.C_Base_dList_dList_Cons ((Base_dPair.v_Base_dPair_dfirstOf r), (Base_dList.C_Base_dList_dList_Cons ((Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dInstr_ILabel (lEnd)), Base_dList.C_Base_dList_dList_Nil)), Base_dList.C_Base_dList_dList_Nil))))))))))))); Base_dPair.f_Base_dPair_dPair_second = (Base_dPair.v_Base_dPair_dsecondOf r) }))))))) (Base_dPair.v_Base_dPair_dfirstOf lEndP))) (v_Vuna_dCompiler_dNative_dModule_dfreshLabel (Base_dPair.v_Base_dPair_dsecondOf lNextP)))) (Base_dPair.v_Base_dPair_dfirstOf lNextP))) (v_Vuna_dCompiler_dNative_dModule_dfreshLabel st))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (((((v_Vuna_dCompiler_dNative_dModule_dgenVariantAlts (fuel - 1)) st) sc) ctors) dtb__224)
  | _ -> failwith "DT: impossible branch"
)) (Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirAltCtorOf dtb__223))
  | _ -> failwith "DT: impossible branch"
)))
# 724 "Vuna/Compiler/Native/Module.vuna"
and v_Vuna_dCompiler_dNative_dModule_dgenVariantArm = (fun fuel st sc alt -> (if (fuel <= 0) then (v_Vuna_dCompiler_dNative_dModule_dinternal "native codegen fuel exhausted") else ((v_Vuna_dCompiler_dNative_dModule_dnbind ((((v_Vuna_dCompiler_dNative_dModule_dbindFields st) sc) 1) (v_Vuna_dCompiler_dNative_dModule_druntimeBinders (Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirAltBindersOf alt)))) (fun bp -> ((v_Vuna_dCompiler_dNative_dModule_dnbind (((v_Vuna_dCompiler_dNative_dModule_dgenExpr (fuel - 1)) (Base_dPair.v_Base_dPair_dsecondOf bp)) (Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirAltBodyOf alt))) (fun q -> (C_Vuna_dCompiler_dNative_dModule_dNRes_NOk ({ Base_dPair.f_Base_dPair_dPair_first = ((Base_dList.v_Base_dList_dappend (Base_dPair.v_Base_dPair_dfirstOf bp)) (Base_dPair.v_Base_dPair_dfirstOf q)); Base_dPair.f_Base_dPair_dPair_second = (Base_dPair.v_Base_dPair_dsecondOf q) }))))))))
# 740 "Vuna/Compiler/Native/Module.vuna"
and v_Vuna_dCompiler_dNative_dModule_dgenRecordAlts = (fun fuel st sc alts -> (if (fuel <= 0) then (v_Vuna_dCompiler_dNative_dModule_dinternal "native codegen fuel exhausted") else (match alts with
  | Base_dList.C_Base_dList_dList_Nil -> ((((v_Vuna_dCompiler_dNative_dModule_dgenDefault (fuel - 1)) st) sc) Base_dList.C_Base_dList_dList_Nil)
  | Base_dList.C_Base_dList_dList_Cons (dtb__229, dtb__230) -> (match (Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirAltCtorOf dtb__229) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((((v_Vuna_dCompiler_dNative_dModule_dgenDefault (fuel - 1)) st) sc) alts)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__231) -> ((v_Vuna_dCompiler_dNative_dModule_dnbind ((((v_Vuna_dCompiler_dNative_dModule_dbindFields st) sc) 0) (v_Vuna_dCompiler_dNative_dModule_druntimeBinders (Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirAltBindersOf dtb__229)))) (fun bp -> ((v_Vuna_dCompiler_dNative_dModule_dnbind (((v_Vuna_dCompiler_dNative_dModule_dgenExpr (fuel - 1)) (Base_dPair.v_Base_dPair_dsecondOf bp)) (Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirAltBodyOf dtb__229))) (fun q -> (C_Vuna_dCompiler_dNative_dModule_dNRes_NOk ({ Base_dPair.f_Base_dPair_dPair_first = ((Base_dList.v_Base_dList_dappend (Base_dPair.v_Base_dPair_dfirstOf bp)) (Base_dPair.v_Base_dPair_dfirstOf q)); Base_dPair.f_Base_dPair_dPair_second = (Base_dPair.v_Base_dPair_dsecondOf q) }))))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))
# 750 "Vuna/Compiler/Native/Module.vuna"
and v_Vuna_dCompiler_dNative_dModule_dgenNatArm = (fun mc0 mc1 mc2 mc3 mc4 -> (match mc2 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__232) -> (if (mc0 <= 0) then (v_Vuna_dCompiler_dNative_dModule_dinternal "native codegen fuel exhausted") else ((fun bs -> ((fun nd_uscrut8 -> (match nd_uscrut8 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__233, dtb__234) -> (match dtb__234 with
  | Base_dList.C_Base_dList_dList_Nil -> (if (mc3 = "none") then (v_Vuna_dCompiler_dNative_dModule_dinternal "Nat case arm has a binder but no runtime binding") else ((fun slotP -> ((fun slot -> ((fun st1 -> ((fun bindInstrs -> ((v_Vuna_dCompiler_dNative_dModule_dnbind (((v_Vuna_dCompiler_dNative_dModule_dgenExpr (mc0 - 1)) (((v_Vuna_dCompiler_dNative_dModule_dpushBinder dtb__233) slot) st1)) (Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirAltBodyOf dtb__232))) (fun q -> (C_Vuna_dCompiler_dNative_dModule_dNRes_NOk ({ Base_dPair.f_Base_dPair_dPair_first = ((Base_dList.v_Base_dList_dappend bindInstrs) ((Base_dList.v_Base_dList_dappend (v_Vuna_dCompiler_dNative_dModule_dstoreSlot slot)) (Base_dPair.v_Base_dPair_dfirstOf q))); Base_dPair.f_Base_dPair_dPair_second = ((v_Vuna_dCompiler_dNative_dModule_drestoreBinderScope (Base_dPair.v_Base_dPair_dsecondOf q)) (mc1).f_Vuna_dCompiler_dNative_dModule_dFGen_fgSlots) }))))) (if (mc3 = "pred") then ((Base_dList.v_Base_dList_dappend (v_Vuna_dCompiler_dNative_dModule_dloadSlot mc4)) (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dInstr_IBin ("sub", (Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dOperand_OpImm (1)))), Base_dList.C_Base_dList_dList_Nil))) else (v_Vuna_dCompiler_dNative_dModule_dloadSlot mc4)))) (Base_dPair.v_Base_dPair_dsecondOf slotP))) (Base_dPair.v_Base_dPair_dfirstOf slotP))) (v_Vuna_dCompiler_dNative_dModule_dfreshSlot mc1)))
  | _ -> (v_Vuna_dCompiler_dNative_dModule_dinternal "Nat case arm has more than one runtime binder")
)
  | Base_dList.C_Base_dList_dList_Nil -> (((v_Vuna_dCompiler_dNative_dModule_dgenExpr (mc0 - 1)) mc1) (Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirAltBodyOf dtb__232))
  | _ -> failwith "DT: impossible branch"
)) bs)) (v_Vuna_dCompiler_dNative_dModule_druntimeBinders (Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirAltBindersOf dtb__232))))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (C_Vuna_dCompiler_dNative_dModule_dNRes_NOk ({ Base_dPair.f_Base_dPair_dPair_first = Base_dList.C_Base_dList_dList_Nil; Base_dPair.f_Base_dPair_dPair_second = mc1 }))
  | _ -> failwith "DT: impossible branch"
))
# 776 "Vuna/Compiler/Native/Module.vuna"
and v_Vuna_dCompiler_dNative_dModule_dgenNatCase = (fun fuel st scrut zero succ catch -> (if (fuel <= 0) then (v_Vuna_dCompiler_dNative_dModule_dinternal "native codegen fuel exhausted") else ((v_Vuna_dCompiler_dNative_dModule_dnbind (((v_Vuna_dCompiler_dNative_dModule_dgenExpr (fuel - 1)) st) scrut)) (fun p -> ((fun st1 -> ((fun slotP -> ((fun slotSc -> ((fun st2 -> ((fun lzP -> ((fun lz -> ((fun st3 -> ((fun lendP -> ((fun lend -> ((fun st4 -> ((fun zeroAlt -> ((fun zeroMode -> ((fun succAlt -> ((fun succMode -> (if (Base_dBool.v_Base_dBool_dnot ((v_Vuna_dCompiler_dNative_dModule_dhasNatBranch zero) catch)) then (v_Vuna_dCompiler_dNative_dModule_dinternal "Nat case has no zero/catch branch") else (if (Base_dBool.v_Base_dBool_dnot ((v_Vuna_dCompiler_dNative_dModule_dhasNatBranch succ) catch)) then (v_Vuna_dCompiler_dNative_dModule_dinternal "Nat case has no succ/catch branch") else ((v_Vuna_dCompiler_dNative_dModule_dnbind (((((v_Vuna_dCompiler_dNative_dModule_dgenNatArm (fuel - 1)) st4) zeroAlt) zeroMode) slotSc)) (fun z -> ((v_Vuna_dCompiler_dNative_dModule_dnbind (((((v_Vuna_dCompiler_dNative_dModule_dgenNatArm (fuel - 1)) (Base_dPair.v_Base_dPair_dsecondOf z)) succAlt) succMode) slotSc)) (fun s -> ((fun body -> (C_Vuna_dCompiler_dNative_dModule_dNRes_NOk ({ Base_dPair.f_Base_dPair_dPair_first = body; Base_dPair.f_Base_dPair_dPair_second = (Base_dPair.v_Base_dPair_dsecondOf s) }))) ((Base_dList.v_Base_dList_dappend (Base_dPair.v_Base_dPair_dfirstOf p)) ((Base_dList.v_Base_dList_dappend (v_Vuna_dCompiler_dNative_dModule_dstoreSlot slotSc)) ((Base_dList.v_Base_dList_dappend (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dInstr_ICmp ((Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dOperand_OpMem (Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dReg_Rbp, (Vuna_dCompiler_dNative_dAbi.v_Vuna_dCompiler_dNative_dAbi_dnativeSlotOff slotSc))), (Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dOperand_OpImm (0)))), (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dInstr_IJcc ("je", lz)), Base_dList.C_Base_dList_dList_Nil))))) ((Base_dList.v_Base_dList_dappend (Base_dPair.v_Base_dPair_dfirstOf s)) ((Base_dList.v_Base_dList_dappend (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dInstr_IJmp (lend)), (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dInstr_ILabel (lz)), Base_dList.C_Base_dList_dList_Nil))))) ((Base_dList.v_Base_dList_dappend (Base_dPair.v_Base_dPair_dfirstOf z)) (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dInstr_ILabel (lend)), Base_dList.C_Base_dList_dList_Nil)))))))))))))))) (match succ with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__235) -> "pred"
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> "sc"
  | _ -> failwith "DT: impossible branch"
))) (match succ with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__236) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__236))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> catch
  | _ -> failwith "DT: impossible branch"
))) (match zero with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__237) -> "none"
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> "sc"
  | _ -> failwith "DT: impossible branch"
))) (match zero with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__238) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__238))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> catch
  | _ -> failwith "DT: impossible branch"
))) (Base_dPair.v_Base_dPair_dsecondOf lendP))) (Base_dPair.v_Base_dPair_dfirstOf lendP))) (v_Vuna_dCompiler_dNative_dModule_dfreshLabel st3))) (Base_dPair.v_Base_dPair_dsecondOf lzP))) (Base_dPair.v_Base_dPair_dfirstOf lzP))) (v_Vuna_dCompiler_dNative_dModule_dfreshLabel st2))) (Base_dPair.v_Base_dPair_dsecondOf slotP))) (Base_dPair.v_Base_dPair_dfirstOf slotP))) (v_Vuna_dCompiler_dNative_dModule_dfreshSlot st1))) (Base_dPair.v_Base_dPair_dsecondOf p))))))

# 819 "Vuna/Compiler/Native/Module.vuna"
let rec v_Vuna_dCompiler_dNative_dModule_dbindArgsGo = (fun mc0 mc1 mc2 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__239, dtb__240) -> ((fun src -> ((fun slotP -> ((fun slot -> ((fun st1 -> ((fun store -> ((v_Vuna_dCompiler_dNative_dModule_dnbind (((v_Vuna_dCompiler_dNative_dModule_dbindArgsGo dtb__240) (mc1 + 1)) (((v_Vuna_dCompiler_dNative_dModule_dpushBinder dtb__239) slot) st1))) (fun q -> (C_Vuna_dCompiler_dNative_dModule_dNRes_NOk ({ Base_dPair.f_Base_dPair_dPair_first = ((Base_dList.v_Base_dList_dappend store) (Base_dPair.v_Base_dPair_dfirstOf q)); Base_dPair.f_Base_dPair_dPair_second = (Base_dPair.v_Base_dPair_dsecondOf q) }))))) ((Base_dList.v_Base_dList_dappend src) (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dInstr_IMov ((Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dOperand_OpMem (Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dReg_Rbp, (Vuna_dCompiler_dNative_dAbi.v_Vuna_dCompiler_dNative_dAbi_dnativeSlotOff slot))), (Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dOperand_OpReg (Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dReg_Rax)))), Base_dList.C_Base_dList_dList_Nil))))) (Base_dPair.v_Base_dPair_dsecondOf slotP))) (Base_dPair.v_Base_dPair_dfirstOf slotP))) (v_Vuna_dCompiler_dNative_dModule_dfreshSlot mc2))) (match (v_Vuna_dCompiler_dNative_dModule_dargRegAt mc1) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__241) -> (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dInstr_IMov ((Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dOperand_OpReg (Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dReg_Rax)), (Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dOperand_OpReg (dtb__241)))), Base_dList.C_Base_dList_dList_Nil))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dInstr_IMov ((Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dOperand_OpReg (Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dReg_Rax)), (Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dOperand_OpMem (Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dReg_Rbp, (Vuna_dCompiler_dNative_dAbi.v_Vuna_dCompiler_dNative_dAbi_dnativeStackArgOff mc1))))), Base_dList.C_Base_dList_dList_Nil))
  | _ -> failwith "DT: impossible branch"
))
  | Base_dList.C_Base_dList_dList_Nil -> (C_Vuna_dCompiler_dNative_dModule_dNRes_NOk ({ Base_dPair.f_Base_dPair_dPair_first = Base_dList.C_Base_dList_dList_Nil; Base_dPair.f_Base_dPair_dPair_second = mc2 }))
  | _ -> failwith "DT: impossible branch"
))

# 815 "Vuna/Compiler/Native/Module.vuna"
let v_Vuna_dCompiler_dNative_dModule_dbindArgs = (fun bs st -> (((v_Vuna_dCompiler_dNative_dModule_dbindArgsGo bs) 0) st))

# 835 "Vuna/Compiler/Native/Module.vuna"
let v_Vuna_dCompiler_dNative_dModule_dgenDefFunc = (fun mc0 mc1 mc2 mc3 mc4 -> (match mc4 with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrDef_IrDef (dtb__242, dtb__243, dtb__244, dtb__245, dtb__246, dtb__247, dtb__248) -> ((fun st0 -> (if (dtb__243 = 0) then ((v_Vuna_dCompiler_dNative_dModule_dnbind (((v_Vuna_dCompiler_dNative_dModule_dgenExpr 100000) st0) dtb__245)) (fun p -> ((fun st1 -> ((fun frame -> ((fun instrs -> (C_Vuna_dCompiler_dNative_dModule_dNRes_NOk ({ Base_dPair.f_Base_dPair_dPair_first = { Vuna_dCompiler_dNative_dModel.f_Vuna_dCompiler_dNative_dModel_dNativeFunc_nfLabel = (Vuna_dCompiler_dNative_dAbi.v_Vuna_dCompiler_dNative_dAbi_dnativeFuncLabel dtb__242); Vuna_dCompiler_dNative_dModel.f_Vuna_dCompiler_dNative_dModel_dNativeFunc_nfFrame = frame; Vuna_dCompiler_dNative_dModel.f_Vuna_dCompiler_dNative_dModel_dNativeFunc_nfBody = ((Base_dList.v_Base_dList_dappend (Vuna_dCompiler_dNative_dAbi.v_Vuna_dCompiler_dNative_dAbi_dnativePrologue frame)) instrs) }; Base_dPair.f_Base_dPair_dPair_second = (st1).f_Vuna_dCompiler_dNative_dModule_dFGen_fgNextLabel }))) ((Base_dList.v_Base_dList_dappend (Base_dPair.v_Base_dPair_dfirstOf p)) Vuna_dCompiler_dNative_dAbi.v_Vuna_dCompiler_dNative_dAbi_dnativeEpilogue))) (Vuna_dCompiler_dNative_dAbi.v_Vuna_dCompiler_dNative_dAbi_dnativeFrameBytes (st1).f_Vuna_dCompiler_dNative_dModule_dFGen_fgNextSlot))) (Base_dPair.v_Base_dPair_dsecondOf p)))) else (match dtb__245 with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLam (dtb__249, dtb__250) -> ((fun rbs -> (if ((Base_dList.v_Base_dList_dlength rbs) <> dtb__243) then (v_Vuna_dCompiler_dNative_dModule_dinternal ("function body lambda arity mismatch: " ^ dtb__242)) else ((v_Vuna_dCompiler_dNative_dModule_dnbind ((v_Vuna_dCompiler_dNative_dModule_dbindArgs rbs) st0)) (fun bp -> ((v_Vuna_dCompiler_dNative_dModule_dnbind (((v_Vuna_dCompiler_dNative_dModule_dgenExpr 100000) (Base_dPair.v_Base_dPair_dsecondOf bp)) dtb__250)) (fun q -> ((fun st1 -> ((fun frame -> ((fun instrs -> (C_Vuna_dCompiler_dNative_dModule_dNRes_NOk ({ Base_dPair.f_Base_dPair_dPair_first = { Vuna_dCompiler_dNative_dModel.f_Vuna_dCompiler_dNative_dModel_dNativeFunc_nfLabel = (Vuna_dCompiler_dNative_dAbi.v_Vuna_dCompiler_dNative_dAbi_dnativeFuncLabel dtb__242); Vuna_dCompiler_dNative_dModel.f_Vuna_dCompiler_dNative_dModel_dNativeFunc_nfFrame = frame; Vuna_dCompiler_dNative_dModel.f_Vuna_dCompiler_dNative_dModel_dNativeFunc_nfBody = ((Base_dList.v_Base_dList_dappend (Vuna_dCompiler_dNative_dAbi.v_Vuna_dCompiler_dNative_dAbi_dnativePrologue frame)) instrs) }; Base_dPair.f_Base_dPair_dPair_second = (st1).f_Vuna_dCompiler_dNative_dModule_dFGen_fgNextLabel }))) ((Base_dList.v_Base_dList_dappend (Base_dPair.v_Base_dPair_dfirstOf bp)) ((Base_dList.v_Base_dList_dappend (Base_dPair.v_Base_dPair_dfirstOf q)) Vuna_dCompiler_dNative_dAbi.v_Vuna_dCompiler_dNative_dAbi_dnativeEpilogue)))) (Vuna_dCompiler_dNative_dAbi.v_Vuna_dCompiler_dNative_dAbi_dnativeFrameBytes (st1).f_Vuna_dCompiler_dNative_dModule_dFGen_fgNextSlot))) (Base_dPair.v_Base_dPair_dsecondOf q)))))))) (v_Vuna_dCompiler_dNative_dModule_druntimeBinders dtb__249))
  | _ -> (v_Vuna_dCompiler_dNative_dModule_dinternal ("function body is not a lambda: " ^ dtb__242))
))) { f_Vuna_dCompiler_dNative_dModule_dFGen_fgDefs = mc0; f_Vuna_dCompiler_dNative_dModule_dFGen_fgPool = mc1; f_Vuna_dCompiler_dNative_dModule_dFGen_fgSlots = Base_dList.C_Base_dList_dList_Nil; f_Vuna_dCompiler_dNative_dModule_dFGen_fgFams = mc2; f_Vuna_dCompiler_dNative_dModule_dFGen_fgNextSlot = 0; f_Vuna_dCompiler_dNative_dModule_dFGen_fgNextLabel = mc3 })
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrDef_IrExternDef (dtb__251, dtb__252, dtb__253, dtb__254) -> (v_Vuna_dCompiler_dNative_dModule_dunsupported (String.concat "" ["native target: extern definition `"; dtb__251; "` is not supported yet"]))
  | _ -> failwith "DT: impossible branch"
))

# 863 "Vuna/Compiler/Native/Module.vuna"
let rec v_Vuna_dCompiler_dNative_dModule_dgenDefs = (fun mc0 mc1 mc2 mc3 mc4 mc5 -> (match mc4 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__255, dtb__256) -> ((v_Vuna_dCompiler_dNative_dModule_dnbind (((((v_Vuna_dCompiler_dNative_dModule_dgenDefFunc mc0) mc1) mc2) mc3) dtb__255)) (fun p -> ((((((v_Vuna_dCompiler_dNative_dModule_dgenDefs mc0) mc1) mc2) (Base_dPair.v_Base_dPair_dsecondOf p)) dtb__256) (Base_dList.C_Base_dList_dList_Cons ((Base_dPair.v_Base_dPair_dfirstOf p), mc5)))))
  | Base_dList.C_Base_dList_dList_Nil -> (C_Vuna_dCompiler_dNative_dModule_dNRes_NOk ({ Base_dPair.f_Base_dPair_dPair_first = (Base_dList.v_Base_dList_dreverse mc5); Base_dPair.f_Base_dPair_dPair_second = mc3 }))
  | _ -> failwith "DT: impossible branch"
))

# 872 "Vuna/Compiler/Native/Module.vuna"
let v_Vuna_dCompiler_dNative_dModule_dentryShowKind = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRt (dtb__257) -> (if (dtb__257 = "@ir@showInt") then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ("int")) else (if (dtb__257 = "@ir@showNat") then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ("int")) else (if (dtb__257 = "@ir@showBool") then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ("bool")) else (if (dtb__257 = "@ir@showStr") then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ("str")) else Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing))))
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
))

# 881 "Vuna/Compiler/Native/Module.vuna"
let v_Vuna_dCompiler_dNative_dModule_dstartFunc = (fun printResult kind mainName -> ((fun initHeap -> ((fun callMain -> ((fun printer -> ((fun exitInstrs -> { Vuna_dCompiler_dNative_dModel.f_Vuna_dCompiler_dNative_dModel_dNativeFunc_nfLabel = Vuna_dCompiler_dNative_dAbi.v_Vuna_dCompiler_dNative_dAbi_dnativeEntryLabel; Vuna_dCompiler_dNative_dModel.f_Vuna_dCompiler_dNative_dModel_dNativeFunc_nfFrame = 0; Vuna_dCompiler_dNative_dModel.f_Vuna_dCompiler_dNative_dModel_dNativeFunc_nfBody = ((Base_dList.v_Base_dList_dappend initHeap) ((Base_dList.v_Base_dList_dappend callMain) ((Base_dList.v_Base_dList_dappend printer) exitInstrs))) }) (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dInstr_IMov ((Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dOperand_OpReg (Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dReg_Rax)), (Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dOperand_OpImm (60)))), (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dInstr_IMov ((Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dOperand_OpReg (Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dReg_Rdi)), (Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dOperand_OpImm (0)))), (Base_dList.C_Base_dList_dList_Cons (Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dInstr_ISyscall, Base_dList.C_Base_dList_dList_Nil)))))))) (if printResult then (if (kind = "bool") then (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dInstr_IMov ((Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dOperand_OpReg (Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dReg_Rdi)), (Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dOperand_OpReg (Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dReg_Rax)))), (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dInstr_ICall ((Vuna_dCompiler_dNative_dAbi.v_Vuna_dCompiler_dNative_dAbi_dnativeRtLabel "print_bool"))), Base_dList.C_Base_dList_dList_Nil)))) else (if (kind = "str") then (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dInstr_IMov ((Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dOperand_OpReg (Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dReg_Rdi)), (Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dOperand_OpReg (Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dReg_Rax)))), (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dInstr_ICall ((Vuna_dCompiler_dNative_dAbi.v_Vuna_dCompiler_dNative_dAbi_dnativeRtLabel "show_str"))), (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dInstr_IMov ((Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dOperand_OpReg (Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dReg_Rdi)), (Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dOperand_OpReg (Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dReg_Rax)))), (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dInstr_ICall ((Vuna_dCompiler_dNative_dAbi.v_Vuna_dCompiler_dNative_dAbi_dnativeRtLabel "print_str"))), Base_dList.C_Base_dList_dList_Nil)))))))) else (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dInstr_IMov ((Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dOperand_OpReg (Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dReg_Rdi)), (Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dOperand_OpReg (Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dReg_Rax)))), (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dInstr_ICall ((Vuna_dCompiler_dNative_dAbi.v_Vuna_dCompiler_dNative_dAbi_dnativeRtLabel "print_int"))), Base_dList.C_Base_dList_dList_Nil)))))) else Base_dList.C_Base_dList_dList_Nil))) (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dInstr_IBinReg ("and", Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dReg_Rsp, (Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dOperand_OpImm ((0 - 16))))), (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dInstr_ICall ((Vuna_dCompiler_dNative_dAbi.v_Vuna_dCompiler_dNative_dAbi_dnativeFuncLabel mainName))), Base_dList.C_Base_dList_dList_Nil)))))) (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dInstr_ILea (Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dReg_Rax, Vuna_dCompiler_dNative_dAbi.v_Vuna_dCompiler_dNative_dAbi_dnativeHeapLabel)), (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dInstr_IMov ((Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dOperand_OpRip (Vuna_dCompiler_dNative_dAbi.v_Vuna_dCompiler_dNative_dAbi_dnativeHeapPtrLabel)), (Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dOperand_OpReg (Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dReg_Rax)))), (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dInstr_IMov ((Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dOperand_OpReg (Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dReg_Rcx)), (Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dOperand_OpReg (Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dReg_Rax)))), (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dInstr_IBinReg ("add", Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dReg_Rcx, (Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dOperand_OpImm (Vuna_dCompiler_dNative_dAbi.v_Vuna_dCompiler_dNative_dAbi_dnativeHeapBytes)))), (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dInstr_IMov ((Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dOperand_OpRip (Vuna_dCompiler_dNative_dAbi.v_Vuna_dCompiler_dNative_dAbi_dnativeArenaEndLabel)), (Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dOperand_OpReg (Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dReg_Rcx)))), Base_dList.C_Base_dList_dList_Nil))))))))))))

# 908 "Vuna/Compiler/Native/Module.vuna"
let v_Vuna_dCompiler_dNative_dModule_dbuild = (fun program printResult -> ((fun unit -> ((fun defs -> (match (unit).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrUnit_irUnitEntry with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dNativeOutcome_NativeRejected ((Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dNativeErr_NativeUnsupported ("native target: no main definition"))))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__258) -> (if (Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirEntryIsActionOf dtb__258) then (Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dNativeOutcome_NativeRejected ((Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dNativeErr_NativeUnsupported ("native target: effectful main is not supported yet")))) else ((fun mainName -> (match ((v_Vuna_dCompiler_dNative_dModule_dfindDef mainName) defs) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dNativeOutcome_NativeRejected ((Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dNativeErr_NativeUnsupported ("native target: main definition not found"))))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__259) -> (if ((Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirDefArity dtb__259) <> 0) then (Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dNativeOutcome_NativeRejected ((Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dNativeErr_NativeUnsupported ("native target: main must be a zero-argument value")))) else ((fun kindM -> (match kindM with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dNativeOutcome_NativeRejected ((Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dNativeErr_NativeUnsupported ("native target: custom Show entry is not supported yet"))))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__260) -> ((fun needed -> ((fun ordered -> ((fun pool -> (match ((((((v_Vuna_dCompiler_dNative_dModule_dgenDefs defs) pool) (unit).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrUnit_irUnitTyDecls) 0) ordered) Base_dList.C_Base_dList_dList_Nil) with
  | C_Vuna_dCompiler_dNative_dModule_dNRes_NFail (dtb__261) -> (Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dNativeOutcome_NativeRejected (dtb__261))
  | C_Vuna_dCompiler_dNative_dModule_dNRes_NOk (dtb__262) -> ((fun start -> (Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dNativeOutcome_NativeOk ({ Vuna_dCompiler_dNative_dModel.f_Vuna_dCompiler_dNative_dModel_dNativeProgram_npRodata = Vuna_dCompiler_dNative_dRuntime.v_Vuna_dCompiler_dNative_dRuntime_dnativeRodata; Vuna_dCompiler_dNative_dModel.f_Vuna_dCompiler_dNative_dModel_dNativeProgram_npStrLits = (v_Vuna_dCompiler_dNative_dModule_dpoolItems pool); Vuna_dCompiler_dNative_dModel.f_Vuna_dCompiler_dNative_dModel_dNativeProgram_npBss = Vuna_dCompiler_dNative_dRuntime.v_Vuna_dCompiler_dNative_dRuntime_dnativeBss; Vuna_dCompiler_dNative_dModel.f_Vuna_dCompiler_dNative_dModel_dNativeProgram_npFuncs = ((Base_dList.v_Base_dList_dappend Vuna_dCompiler_dNative_dRuntime.v_Vuna_dCompiler_dNative_dRuntime_dnativeRtFuncs) ((Base_dList.v_Base_dList_dappend (Base_dPair.v_Base_dPair_dfirstOf dtb__262)) (Base_dList.C_Base_dList_dList_Cons (start, Base_dList.C_Base_dList_dList_Nil)))) }))) (((v_Vuna_dCompiler_dNative_dModule_dstartFunc printResult) dtb__260) mainName))
  | _ -> failwith "DT: impossible branch"
)) (v_Vuna_dCompiler_dNative_dModule_dpoolOfDefs ordered))) ((Base_dList.v_Base_dList_dfilter (fun d -> ((v_Vuna_dCompiler_dNative_dModule_dmemStr (Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirDefName d)) needed))) defs))) ((((v_Vuna_dCompiler_dNative_dModule_dcollectNeeded 100000) (Base_dList.C_Base_dList_dList_Cons (mainName, Base_dList.C_Base_dList_dList_Nil))) Base_dList.C_Base_dList_dList_Nil) defs))
  | _ -> failwith "DT: impossible branch"
)) (if printResult then (v_Vuna_dCompiler_dNative_dModule_dentryShowKind (Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirEntryShowOf dtb__258)) else (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ("none")))))
  | _ -> failwith "DT: impossible branch"
)) (Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirEntryMainOf dtb__258)))
  | _ -> failwith "DT: impossible branch"
)) ((Base_dList.v_Base_dList_dconcatMap Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirGroupDefs) (unit).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrUnit_irUnitGroups))) (Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirProgUnitOf program)))
