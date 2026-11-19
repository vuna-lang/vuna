open Vuna_runtime
# 25 "Vuna/Compiler/Ir/Tail.vuna"
let v_Vuna_dCompiler_dIr_dTail_daddDef = (fun (tbl : (string, int) Base_dContainer_dHashMap.t_Base_dContainer_dHashMap_dHashMap) (d : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrDef) -> (match d with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrDef_IrDef (dtb__0, dtb__1, dtb__2, dtb__3, dtb__4, dtb__5, dtb__6, dtb__7) -> ((((Base_dContainer_dHashMap.v_Base_dContainer_dHashMap_dinsert Base_dData_dString.v_Hashable_uString) dtb__0) dtb__1) tbl)
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrDef_IrExternDef (dtb__8, dtb__9, dtb__10, dtb__11) -> tbl
  | _ -> failwith "DT: impossible branch"
))

# 22 "Vuna/Compiler/Ir/Tail.vuna"
let v_Vuna_dCompiler_dIr_dTail_darityTableOf = (fun (defs : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrDef Base_dData_dList.t_Base_dData_dList_dList) -> (((Base_dData_dList.v_Base_dData_dList_dfoldl v_Vuna_dCompiler_dIr_dTail_daddDef) ((Base_dContainer_dHashMap.v_Base_dContainer_dHashMap_dfromList Base_dData_dString.v_Hashable_uString) Base_dData_dList.C_Base_dData_dList_dList_Nil)) defs))

# 31 "Vuna/Compiler/Ir/Tail.vuna"
let v_Vuna_dCompiler_dIr_dTail_darityOfTable = (fun (tbl : (string, int) Base_dContainer_dHashMap.t_Base_dContainer_dHashMap_dHashMap) (name : string) -> ((((Base_dContainer_dHashMap.v_Base_dContainer_dHashMap_dlookup Base_dData_dString.v_Hashable_uString) Base_dData_dString.v_Eq_uString) name) tbl))

# 34 "Vuna/Compiler/Ir/Tail.vuna"
let v_Vuna_dCompiler_dIr_dTail_dtailFuelOf = (fun (ir : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIr) -> (64 + (16 * (Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirSize ir))))

# 63 "Vuna/Compiler/Ir/Tail.vuna"
let rec v_Vuna_dCompiler_dIr_dTail_dstripTailAt = (fun (fuel : int) (ir : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIr) -> (if (fuel <= 0) then ir else (match ir with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrTail (dtb__12) -> ((v_Vuna_dCompiler_dIr_dTail_dstripTailAt (fuel - 1)) dtb__12)
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrVar (dtb__13) -> ir
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrGlobal (dtb__14) -> ir
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCtor (dtb__15, dtb__16, dtb__17, dtb__18) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCtor (dtb__15, dtb__16, dtb__17, ((Base_dData_dList.v_Base_dData_dList_dmap (v_Vuna_dCompiler_dIr_dTail_dstripTailAt (fuel - 1))) dtb__18)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRecord (dtb__19, dtb__20, dtb__21) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRecord (dtb__19, dtb__20, ((Base_dData_dList.v_Base_dData_dList_dmap (v_Vuna_dCompiler_dIr_dTail_dstripField (fuel - 1))) dtb__21)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrProj (dtb__22, dtb__23, dtb__24, dtb__25) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrProj (((v_Vuna_dCompiler_dIr_dTail_dstripTailAt (fuel - 1)) dtb__22), dtb__23, dtb__24, dtb__25))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRecUpd (dtb__26, dtb__27, dtb__28, dtb__29) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRecUpd (((v_Vuna_dCompiler_dIr_dTail_dstripTailAt (fuel - 1)) dtb__26), dtb__27, ((Base_dData_dList.v_Base_dData_dList_dmap (v_Vuna_dCompiler_dIr_dTail_dstripField (fuel - 1))) dtb__28), dtb__29))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRt (dtb__30) -> ir
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRtApp (dtb__31, dtb__32) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRtApp (dtb__31, ((Base_dData_dList.v_Base_dData_dList_dmap (v_Vuna_dCompiler_dIr_dTail_dstripTailAt (fuel - 1))) dtb__32)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCast (dtb__33, dtb__34, dtb__35) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCast (dtb__33, dtb__34, ((v_Vuna_dCompiler_dIr_dTail_dstripTailAt (fuel - 1)) dtb__35)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrInt (dtb__36) -> ir
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrStr (dtb__37) -> ir
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrBool (dtb__38) -> ir
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrFloatLit (dtb__39) -> ir
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLet (dtb__40, dtb__41, dtb__42) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLet (dtb__40, ((v_Vuna_dCompiler_dIr_dTail_dstripTailAt (fuel - 1)) dtb__41), ((v_Vuna_dCompiler_dIr_dTail_dstripTailAt (fuel - 1)) dtb__42)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLam (dtb__43, dtb__44, dtb__45) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLam (dtb__43, dtb__44, ((v_Vuna_dCompiler_dIr_dTail_dstripTailAt (fuel - 1)) dtb__45)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (dtb__46, dtb__47, dtb__48) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (dtb__46, ((v_Vuna_dCompiler_dIr_dTail_dstripTailAt (fuel - 1)) dtb__47), ((v_Vuna_dCompiler_dIr_dTail_dstripTailAt (fuel - 1)) dtb__48)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrIf (dtb__49, dtb__50, dtb__51) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrIf (((v_Vuna_dCompiler_dIr_dTail_dstripTailAt (fuel - 1)) dtb__49), ((v_Vuna_dCompiler_dIr_dTail_dstripTailAt (fuel - 1)) dtb__50), ((v_Vuna_dCompiler_dIr_dTail_dstripTailAt (fuel - 1)) dtb__51)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCase (dtb__52, dtb__53, dtb__54, dtb__55) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCase (dtb__52, dtb__53, ((v_Vuna_dCompiler_dIr_dTail_dstripTailAt (fuel - 1)) dtb__54), ((Base_dData_dList.v_Base_dData_dList_dmap (v_Vuna_dCompiler_dIr_dTail_dstripAlt (fuel - 1))) dtb__55)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrNatCase (dtb__56, dtb__57, dtb__58, dtb__59, dtb__60) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrNatCase (((v_Vuna_dCompiler_dIr_dTail_dstripTailAt (fuel - 1)) dtb__56), dtb__57, ((v_Vuna_dCompiler_dIr_dTail_dstripAltM (fuel - 1)) dtb__58), ((v_Vuna_dCompiler_dIr_dTail_dstripAltM (fuel - 1)) dtb__59), ((v_Vuna_dCompiler_dIr_dTail_dstripAltM (fuel - 1)) dtb__60)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrConcatMany (dtb__61) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrConcatMany (((Base_dData_dList.v_Base_dData_dList_dmap (v_Vuna_dCompiler_dIr_dTail_dstripTailAt (fuel - 1))) dtb__61)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrEffThunk (dtb__62, dtb__63, dtb__64, dtb__65, dtb__66) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrEffThunk (dtb__62, dtb__63, dtb__64, dtb__65, ((v_Vuna_dCompiler_dIr_dTail_dstripTailAt (fuel - 1)) dtb__66)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrEffBind (dtb__67, dtb__68, dtb__69) -> ir
  | _ -> failwith "DT: impossible branch"
)))
# 93 "Vuna/Compiler/Ir/Tail.vuna"
and v_Vuna_dCompiler_dIr_dTail_dstripField = (fun (fuel : int) (p : (string, Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIr) Base_dData_dPair.t_Base_dData_dPair_dPair) -> { Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Base_dData_dPair.v_Base_dData_dPair_dfirstOf p); Base_dData_dPair.f_Base_dData_dPair_dPair_second = ((v_Vuna_dCompiler_dIr_dTail_dstripTailAt fuel) (Base_dData_dPair.v_Base_dData_dPair_dsecondOf p)) })
# 96 "Vuna/Compiler/Ir/Tail.vuna"
and v_Vuna_dCompiler_dIr_dTail_dstripAlt = (fun (fuel : int) (alt : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrAlt) -> { Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltCtor = (alt).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltCtor; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBinders = (alt).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBinders; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBody = ((v_Vuna_dCompiler_dIr_dTail_dstripTailAt fuel) (alt).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBody) })
# 99 "Vuna/Compiler/Ir/Tail.vuna"
and v_Vuna_dCompiler_dIr_dTail_dstripAltM = (fun (fuel : int) (m : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrAlt Base_dData_dMaybe.t_Base_dData_dMaybe_dMaybe) -> (match m with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__70) -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (((v_Vuna_dCompiler_dIr_dTail_dstripAlt fuel) dtb__70)))
  | _ -> failwith "DT: impossible branch"
))

# 60 "Vuna/Compiler/Ir/Tail.vuna"
let v_Vuna_dCompiler_dIr_dTail_dstripTail = (fun (ir : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIr) -> ((v_Vuna_dCompiler_dIr_dTail_dstripTailAt (v_Vuna_dCompiler_dIr_dTail_dtailFuelOf ir)) ir))

# 105 "Vuna/Compiler/Ir/Tail.vuna"
let rec v_Vuna_dCompiler_dIr_dTail_dannotateAt = (fun (fuel : int) (arityOf : (string) -> int Base_dData_dMaybe.t_Base_dData_dMaybe_dMaybe) (tail : bool) (ir : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIr) -> (if (fuel <= 0) then ir else (match ir with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrVar (dtb__71) -> ir
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrGlobal (dtb__72) -> (if tail then ((fun nd_uscrut5 -> (match nd_uscrut5 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__73) -> (if (dtb__73 = 0) then (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrTail ((Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrGlobal (dtb__72)))) else (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrGlobal (dtb__72)))
  | _ -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrGlobal (dtb__72))
)) (arityOf dtb__72)) else (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrGlobal (dtb__72)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCtor (dtb__74, dtb__75, dtb__76, dtb__77) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCtor (dtb__74, dtb__75, dtb__76, ((Base_dData_dList.v_Base_dData_dList_dmap (((v_Vuna_dCompiler_dIr_dTail_dannotateAt (fuel - 1)) arityOf) false)) dtb__77)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRecord (dtb__78, dtb__79, dtb__80) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRecord (dtb__78, dtb__79, ((Base_dData_dList.v_Base_dData_dList_dmap ((v_Vuna_dCompiler_dIr_dTail_dannotateField (fuel - 1)) arityOf)) dtb__80)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrProj (dtb__81, dtb__82, dtb__83, dtb__84) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrProj (((((v_Vuna_dCompiler_dIr_dTail_dannotateAt (fuel - 1)) arityOf) false) dtb__81), dtb__82, dtb__83, dtb__84))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRecUpd (dtb__85, dtb__86, dtb__87, dtb__88) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRecUpd (((((v_Vuna_dCompiler_dIr_dTail_dannotateAt (fuel - 1)) arityOf) false) dtb__85), dtb__86, ((Base_dData_dList.v_Base_dData_dList_dmap ((v_Vuna_dCompiler_dIr_dTail_dannotateField (fuel - 1)) arityOf)) dtb__87), dtb__88))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRt (dtb__89) -> (if tail then (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrTail ((Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRt (dtb__89)))) else (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRt (dtb__89)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRtApp (dtb__90, dtb__91) -> ((fun args2 -> (if tail then (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrTail ((Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRtApp (dtb__90, args2)))) else (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRtApp (dtb__90, args2)))) ((Base_dData_dList.v_Base_dData_dList_dmap (((v_Vuna_dCompiler_dIr_dTail_dannotateAt (fuel - 1)) arityOf) false)) dtb__91))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCast (dtb__92, dtb__93, dtb__94) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCast (dtb__92, dtb__93, ((((v_Vuna_dCompiler_dIr_dTail_dannotateAt (fuel - 1)) arityOf) tail) dtb__94)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrInt (dtb__95) -> ir
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrStr (dtb__96) -> ir
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrBool (dtb__97) -> ir
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrFloatLit (dtb__98) -> ir
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLet (dtb__99, dtb__100, dtb__101) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLet (dtb__99, ((((v_Vuna_dCompiler_dIr_dTail_dannotateAt (fuel - 1)) arityOf) false) dtb__100), ((((v_Vuna_dCompiler_dIr_dTail_dannotateAt (fuel - 1)) arityOf) tail) dtb__101)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLam (dtb__102, dtb__103, dtb__104) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLam (dtb__102, dtb__103, ((((v_Vuna_dCompiler_dIr_dTail_dannotateAt (fuel - 1)) arityOf) true) dtb__104)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (dtb__105, dtb__106, dtb__107) -> ((fun f2 -> ((fun a2 -> (if tail then (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrTail ((Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (dtb__105, f2, a2)))) else (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (dtb__105, f2, a2)))) ((((v_Vuna_dCompiler_dIr_dTail_dannotateAt (fuel - 1)) arityOf) false) dtb__107))) ((((v_Vuna_dCompiler_dIr_dTail_dannotateAt (fuel - 1)) arityOf) false) dtb__106))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrTail (dtb__108) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrTail (((((v_Vuna_dCompiler_dIr_dTail_dannotateAt (fuel - 1)) arityOf) false) dtb__108)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrIf (dtb__109, dtb__110, dtb__111) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrIf (((((v_Vuna_dCompiler_dIr_dTail_dannotateAt (fuel - 1)) arityOf) false) dtb__109), ((((v_Vuna_dCompiler_dIr_dTail_dannotateAt (fuel - 1)) arityOf) tail) dtb__110), ((((v_Vuna_dCompiler_dIr_dTail_dannotateAt (fuel - 1)) arityOf) tail) dtb__111)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCase (dtb__112, dtb__113, dtb__114, dtb__115) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCase (dtb__112, dtb__113, ((((v_Vuna_dCompiler_dIr_dTail_dannotateAt (fuel - 1)) arityOf) false) dtb__114), ((Base_dData_dList.v_Base_dData_dList_dmap (((v_Vuna_dCompiler_dIr_dTail_dannotateAlt (fuel - 1)) arityOf) tail)) dtb__115)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrNatCase (dtb__116, dtb__117, dtb__118, dtb__119, dtb__120) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrNatCase (((((v_Vuna_dCompiler_dIr_dTail_dannotateAt (fuel - 1)) arityOf) false) dtb__116), dtb__117, ((((v_Vuna_dCompiler_dIr_dTail_dannotateAltMaybe (fuel - 1)) arityOf) tail) dtb__118), ((((v_Vuna_dCompiler_dIr_dTail_dannotateAltMaybe (fuel - 1)) arityOf) tail) dtb__119), ((((v_Vuna_dCompiler_dIr_dTail_dannotateAltMaybe (fuel - 1)) arityOf) tail) dtb__120)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrConcatMany (dtb__121) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrConcatMany (((Base_dData_dList.v_Base_dData_dList_dmap (((v_Vuna_dCompiler_dIr_dTail_dannotateAt (fuel - 1)) arityOf) false)) dtb__121)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrEffThunk (dtb__122, dtb__123, dtb__124, dtb__125, dtb__126) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrEffThunk (dtb__122, dtb__123, dtb__124, dtb__125, ((((v_Vuna_dCompiler_dIr_dTail_dannotateAt (fuel - 1)) arityOf) false) dtb__126)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrEffBind (dtb__127, dtb__128, dtb__129) -> ir
  | _ -> failwith "DT: impossible branch"
)))
# 148 "Vuna/Compiler/Ir/Tail.vuna"
and v_Vuna_dCompiler_dIr_dTail_dannotateField = (fun (fuel : int) (arityOf : (string) -> int Base_dData_dMaybe.t_Base_dData_dMaybe_dMaybe) (p : (string, Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIr) Base_dData_dPair.t_Base_dData_dPair_dPair) -> { Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Base_dData_dPair.v_Base_dData_dPair_dfirstOf p); Base_dData_dPair.f_Base_dData_dPair_dPair_second = ((((v_Vuna_dCompiler_dIr_dTail_dannotateAt fuel) arityOf) false) (Base_dData_dPair.v_Base_dData_dPair_dsecondOf p)) })
# 151 "Vuna/Compiler/Ir/Tail.vuna"
and v_Vuna_dCompiler_dIr_dTail_dannotateAlt = (fun (fuel : int) (arityOf : (string) -> int Base_dData_dMaybe.t_Base_dData_dMaybe_dMaybe) (tail : bool) (alt : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrAlt) -> { Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltCtor = (alt).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltCtor; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBinders = (alt).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBinders; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBody = ((((v_Vuna_dCompiler_dIr_dTail_dannotateAt fuel) arityOf) tail) (alt).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBody) })
# 155 "Vuna/Compiler/Ir/Tail.vuna"
and v_Vuna_dCompiler_dIr_dTail_dannotateAltMaybe = (fun (fuel : int) (arityOf : (string) -> int Base_dData_dMaybe.t_Base_dData_dMaybe_dMaybe) (tail : bool) (m : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrAlt Base_dData_dMaybe.t_Base_dData_dMaybe_dMaybe) -> (match m with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__130) -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (((((v_Vuna_dCompiler_dIr_dTail_dannotateAlt fuel) arityOf) tail) dtb__130)))
  | _ -> failwith "DT: impossible branch"
))

# 40 "Vuna/Compiler/Ir/Tail.vuna"
let v_Vuna_dCompiler_dIr_dTail_dannotateDef = (fun (arityOf : (string) -> int Base_dData_dMaybe.t_Base_dData_dMaybe_dMaybe) (d : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrDef) -> (match d with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrDef_IrDef (dtb__131, dtb__132, dtb__133, dtb__134, dtb__135, dtb__136, dtb__137, dtb__138) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrDef_IrDef (dtb__131, dtb__132, dtb__133, dtb__134, ((((v_Vuna_dCompiler_dIr_dTail_dannotateAt (v_Vuna_dCompiler_dIr_dTail_dtailFuelOf dtb__135)) arityOf) true) dtb__135), dtb__136, dtb__137, dtb__138))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrDef_IrExternDef (dtb__139, dtb__140, dtb__141, dtb__142) -> d
  | _ -> failwith "DT: impossible branch"
))

# 37 "Vuna/Compiler/Ir/Tail.vuna"
let v_Vuna_dCompiler_dIr_dTail_dannotateDefsWith = (fun (arityOf : (string) -> int Base_dData_dMaybe.t_Base_dData_dMaybe_dMaybe) (defs : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrDef Base_dData_dList.t_Base_dData_dList_dList) -> ((Base_dData_dList.v_Base_dData_dList_dmap (v_Vuna_dCompiler_dIr_dTail_dannotateDef arityOf)) defs))

# 48 "Vuna/Compiler/Ir/Tail.vuna"
let v_Vuna_dCompiler_dIr_dTail_dannotateBody = (fun (arityOf : (string) -> int Base_dData_dMaybe.t_Base_dData_dMaybe_dMaybe) (ir : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIr) -> ((((v_Vuna_dCompiler_dIr_dTail_dannotateAt (v_Vuna_dCompiler_dIr_dTail_dtailFuelOf ir)) arityOf) true) ir))

# 52 "Vuna/Compiler/Ir/Tail.vuna"
let v_Vuna_dCompiler_dIr_dTail_dannotateDefs = (fun (defs : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrDef Base_dData_dList.t_Base_dData_dList_dList) -> ((fun tbl -> (Base_dData_dResult.C_Base_dData_dResult_dResult_Ok (((v_Vuna_dCompiler_dIr_dTail_dannotateDefsWith (v_Vuna_dCompiler_dIr_dTail_darityOfTable tbl)) defs)))) (v_Vuna_dCompiler_dIr_dTail_darityTableOf defs)))
