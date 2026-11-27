open Vuna_runtime
# 25 "Vuna/Ir/Tail.vuna"
let v_addDef = (fun (mc0 : (string, int) B_dContainer_dHashMap.t_HashMap) (mc1 : Vuna_dIr_dModel.t_IrDef) -> (match mc1 with
  | Vuna_dIr_dModel.C_IrDef_IrExternDef (dtb__0, dtb__1, dtb__2, dtb__3) -> mc0
  | Vuna_dIr_dModel.C_IrDef_IrDef (dtb__4, dtb__5, dtb__6, dtb__7, dtb__8, dtb__9, dtb__10, dtb__11) -> (((((B_dContainer_dHashMap.v_insert B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) dtb__4) dtb__5) mc0)
  | _ -> failwith "DT: impossible branch"
))

# 22 "Vuna/Ir/Tail.vuna"
let v_arityTableOf = (fun (defs : Vuna_dIr_dModel.t_IrDef B_dData_dList.t_List) -> (((B_dData_dList.v_foldl v_addDef) (((B_dContainer_dHashMap.v_fromList B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) B_dData_dList.C_List_Nil)) defs))

# 29 "Vuna/Ir/Tail.vuna"
let v_arityOfTable = (fun (tbl : (string, int) B_dContainer_dHashMap.t_HashMap) (name : string) -> ((((B_dContainer_dHashMap.v_lookup B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) name) tbl))

# 32 "Vuna/Ir/Tail.vuna"
let v_tailFuelOf = (fun (ir : Vuna_dIr_dModel.t_Ir) -> (64 + (16 * (Vuna_dIr_dModel.v_irSize ir))))

# 59 "Vuna/Ir/Tail.vuna"
let rec v_stripTailAt = (fun (fuel : int) (ir : Vuna_dIr_dModel.t_Ir) -> (if (fuel <= 0) then ir else (match ir with
  | Vuna_dIr_dModel.C_Ir_IrTail (dtb__12) -> ((v_stripTailAt (fuel - 1)) dtb__12)
  | Vuna_dIr_dModel.C_Ir_IrVar (dtb__13) -> ir
  | Vuna_dIr_dModel.C_Ir_IrGlobal (dtb__14) -> ir
  | Vuna_dIr_dModel.C_Ir_IrCtor (dtb__15, dtb__16, dtb__17, dtb__18) -> (Vuna_dIr_dModel.C_Ir_IrCtor (dtb__15, dtb__16, dtb__17, ((B_dData_dList.v_map (v_stripTailAt (fuel - 1))) dtb__18)))
  | Vuna_dIr_dModel.C_Ir_IrRecord (dtb__19, dtb__20, dtb__21) -> (Vuna_dIr_dModel.C_Ir_IrRecord (dtb__19, dtb__20, ((B_dData_dList.v_map (v_stripField (fuel - 1))) dtb__21)))
  | Vuna_dIr_dModel.C_Ir_IrProj (dtb__22, dtb__23, dtb__24, dtb__25) -> (Vuna_dIr_dModel.C_Ir_IrProj (((v_stripTailAt (fuel - 1)) dtb__22), dtb__23, dtb__24, dtb__25))
  | Vuna_dIr_dModel.C_Ir_IrRecUpd (dtb__26, dtb__27, dtb__28, dtb__29) -> (Vuna_dIr_dModel.C_Ir_IrRecUpd (((v_stripTailAt (fuel - 1)) dtb__26), dtb__27, ((B_dData_dList.v_map (v_stripField (fuel - 1))) dtb__28), dtb__29))
  | Vuna_dIr_dModel.C_Ir_IrRt (dtb__30) -> ir
  | Vuna_dIr_dModel.C_Ir_IrRtApp (dtb__31, dtb__32) -> (Vuna_dIr_dModel.C_Ir_IrRtApp (dtb__31, ((B_dData_dList.v_map (v_stripTailAt (fuel - 1))) dtb__32)))
  | Vuna_dIr_dModel.C_Ir_IrCast (dtb__33, dtb__34, dtb__35) -> (Vuna_dIr_dModel.C_Ir_IrCast (dtb__33, dtb__34, ((v_stripTailAt (fuel - 1)) dtb__35)))
  | Vuna_dIr_dModel.C_Ir_IrInt (dtb__36) -> ir
  | Vuna_dIr_dModel.C_Ir_IrStr (dtb__37) -> ir
  | Vuna_dIr_dModel.C_Ir_IrBool (dtb__38) -> ir
  | Vuna_dIr_dModel.C_Ir_IrFloatLit (dtb__39) -> ir
  | Vuna_dIr_dModel.C_Ir_IrLet (dtb__40, dtb__41, dtb__42) -> (Vuna_dIr_dModel.C_Ir_IrLet (dtb__40, ((v_stripTailAt (fuel - 1)) dtb__41), ((v_stripTailAt (fuel - 1)) dtb__42)))
  | Vuna_dIr_dModel.C_Ir_IrLam (dtb__43, dtb__44, dtb__45) -> (Vuna_dIr_dModel.C_Ir_IrLam (dtb__43, dtb__44, ((v_stripTailAt (fuel - 1)) dtb__45)))
  | Vuna_dIr_dModel.C_Ir_IrApp (dtb__46, dtb__47, dtb__48) -> (Vuna_dIr_dModel.C_Ir_IrApp (dtb__46, ((v_stripTailAt (fuel - 1)) dtb__47), ((v_stripTailAt (fuel - 1)) dtb__48)))
  | Vuna_dIr_dModel.C_Ir_IrIf (dtb__49, dtb__50, dtb__51) -> (Vuna_dIr_dModel.C_Ir_IrIf (((v_stripTailAt (fuel - 1)) dtb__49), ((v_stripTailAt (fuel - 1)) dtb__50), ((v_stripTailAt (fuel - 1)) dtb__51)))
  | Vuna_dIr_dModel.C_Ir_IrCase (dtb__52, dtb__53, dtb__54, dtb__55) -> (Vuna_dIr_dModel.C_Ir_IrCase (dtb__52, dtb__53, ((v_stripTailAt (fuel - 1)) dtb__54), ((B_dData_dList.v_map (v_stripAlt (fuel - 1))) dtb__55)))
  | Vuna_dIr_dModel.C_Ir_IrNatCase (dtb__56, dtb__57, dtb__58, dtb__59, dtb__60) -> (Vuna_dIr_dModel.C_Ir_IrNatCase (((v_stripTailAt (fuel - 1)) dtb__56), dtb__57, ((v_stripAltM (fuel - 1)) dtb__58), ((v_stripAltM (fuel - 1)) dtb__59), ((v_stripAltM (fuel - 1)) dtb__60)))
  | Vuna_dIr_dModel.C_Ir_IrConcatMany (dtb__61) -> (Vuna_dIr_dModel.C_Ir_IrConcatMany (((B_dData_dList.v_map (v_stripTailAt (fuel - 1))) dtb__61)))
  | Vuna_dIr_dModel.C_Ir_IrEffThunk (dtb__62, dtb__63, dtb__64, dtb__65, dtb__66) -> (Vuna_dIr_dModel.C_Ir_IrEffThunk (dtb__62, dtb__63, dtb__64, dtb__65, ((v_stripTailAt (fuel - 1)) dtb__66)))
  | Vuna_dIr_dModel.C_Ir_IrEffBind (dtb__67, dtb__68, dtb__69) -> ir
  | _ -> failwith "DT: impossible branch"
)))
# 89 "Vuna/Ir/Tail.vuna"
and v_stripField = (fun (fuel : int) (p : (string, Vuna_dIr_dModel.t_Ir) B_dData_dPair.t_Pair) -> { B_dData_dPair.f_Pair_first = (B_dData_dPair.v_firstOf p); B_dData_dPair.f_Pair_second = ((v_stripTailAt fuel) (B_dData_dPair.v_secondOf p)) })
# 92 "Vuna/Ir/Tail.vuna"
and v_stripAlt = (fun (fuel : int) (alt : Vuna_dIr_dModel.t_IrAlt) -> { Vuna_dIr_dModel.f_IrAlt_irAltCtor = (alt).Vuna_dIr_dModel.f_IrAlt_irAltCtor; Vuna_dIr_dModel.f_IrAlt_irAltBinders = (alt).Vuna_dIr_dModel.f_IrAlt_irAltBinders; Vuna_dIr_dModel.f_IrAlt_irAltBody = ((v_stripTailAt fuel) (alt).Vuna_dIr_dModel.f_IrAlt_irAltBody) })
# 95 "Vuna/Ir/Tail.vuna"
and v_stripAltM = (fun (mc0 : int) (mc1 : Vuna_dIr_dModel.t_IrAlt B_dData_dMaybe.t_Maybe) -> (match mc1 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__70) -> (B_dData_dMaybe.C_Maybe_Just (((v_stripAlt mc0) dtb__70)))
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 56 "Vuna/Ir/Tail.vuna"
let v_stripTail = (fun (ir : Vuna_dIr_dModel.t_Ir) -> ((v_stripTailAt (v_tailFuelOf ir)) ir))

# 99 "Vuna/Ir/Tail.vuna"
let rec v_annotateAt = (fun (fuel : int) (arityOf : (string) -> int B_dData_dMaybe.t_Maybe) (tail : bool) (ir : Vuna_dIr_dModel.t_Ir) -> (if (fuel <= 0) then ir else (match ir with
  | Vuna_dIr_dModel.C_Ir_IrVar (dtb__71) -> ir
  | Vuna_dIr_dModel.C_Ir_IrGlobal (dtb__72) -> (if tail then (let nd_uscrut5 = (arityOf dtb__72) in (match nd_uscrut5 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__73) -> (if (dtb__73 = 0) then (Vuna_dIr_dModel.C_Ir_IrTail ((Vuna_dIr_dModel.C_Ir_IrGlobal (dtb__72)))) else (Vuna_dIr_dModel.C_Ir_IrGlobal (dtb__72)))
  | _ -> (Vuna_dIr_dModel.C_Ir_IrGlobal (dtb__72))
)) else (Vuna_dIr_dModel.C_Ir_IrGlobal (dtb__72)))
  | Vuna_dIr_dModel.C_Ir_IrCtor (dtb__74, dtb__75, dtb__76, dtb__77) -> (Vuna_dIr_dModel.C_Ir_IrCtor (dtb__74, dtb__75, dtb__76, ((B_dData_dList.v_map (((v_annotateAt (fuel - 1)) arityOf) false)) dtb__77)))
  | Vuna_dIr_dModel.C_Ir_IrRecord (dtb__78, dtb__79, dtb__80) -> (Vuna_dIr_dModel.C_Ir_IrRecord (dtb__78, dtb__79, ((B_dData_dList.v_map ((v_annotateField (fuel - 1)) arityOf)) dtb__80)))
  | Vuna_dIr_dModel.C_Ir_IrProj (dtb__81, dtb__82, dtb__83, dtb__84) -> (Vuna_dIr_dModel.C_Ir_IrProj (((((v_annotateAt (fuel - 1)) arityOf) false) dtb__81), dtb__82, dtb__83, dtb__84))
  | Vuna_dIr_dModel.C_Ir_IrRecUpd (dtb__85, dtb__86, dtb__87, dtb__88) -> (Vuna_dIr_dModel.C_Ir_IrRecUpd (((((v_annotateAt (fuel - 1)) arityOf) false) dtb__85), dtb__86, ((B_dData_dList.v_map ((v_annotateField (fuel - 1)) arityOf)) dtb__87), dtb__88))
  | Vuna_dIr_dModel.C_Ir_IrRt (dtb__89) -> (if tail then (Vuna_dIr_dModel.C_Ir_IrTail ((Vuna_dIr_dModel.C_Ir_IrRt (dtb__89)))) else (Vuna_dIr_dModel.C_Ir_IrRt (dtb__89)))
  | Vuna_dIr_dModel.C_Ir_IrRtApp (dtb__90, dtb__91) -> (let args2 = ((B_dData_dList.v_map (((v_annotateAt (fuel - 1)) arityOf) false)) dtb__91) in (if tail then (Vuna_dIr_dModel.C_Ir_IrTail ((Vuna_dIr_dModel.C_Ir_IrRtApp (dtb__90, args2)))) else (Vuna_dIr_dModel.C_Ir_IrRtApp (dtb__90, args2))))
  | Vuna_dIr_dModel.C_Ir_IrCast (dtb__92, dtb__93, dtb__94) -> (Vuna_dIr_dModel.C_Ir_IrCast (dtb__92, dtb__93, ((((v_annotateAt (fuel - 1)) arityOf) tail) dtb__94)))
  | Vuna_dIr_dModel.C_Ir_IrInt (dtb__95) -> ir
  | Vuna_dIr_dModel.C_Ir_IrStr (dtb__96) -> ir
  | Vuna_dIr_dModel.C_Ir_IrBool (dtb__97) -> ir
  | Vuna_dIr_dModel.C_Ir_IrFloatLit (dtb__98) -> ir
  | Vuna_dIr_dModel.C_Ir_IrLet (dtb__99, dtb__100, dtb__101) -> (Vuna_dIr_dModel.C_Ir_IrLet (dtb__99, ((((v_annotateAt (fuel - 1)) arityOf) false) dtb__100), ((((v_annotateAt (fuel - 1)) arityOf) tail) dtb__101)))
  | Vuna_dIr_dModel.C_Ir_IrLam (dtb__102, dtb__103, dtb__104) -> (Vuna_dIr_dModel.C_Ir_IrLam (dtb__102, dtb__103, ((((v_annotateAt (fuel - 1)) arityOf) true) dtb__104)))
  | Vuna_dIr_dModel.C_Ir_IrApp (dtb__105, dtb__106, dtb__107) -> (let f2 = ((((v_annotateAt (fuel - 1)) arityOf) false) dtb__106) in (let a2 = ((((v_annotateAt (fuel - 1)) arityOf) false) dtb__107) in (if tail then (Vuna_dIr_dModel.C_Ir_IrTail ((Vuna_dIr_dModel.C_Ir_IrApp (dtb__105, f2, a2)))) else (Vuna_dIr_dModel.C_Ir_IrApp (dtb__105, f2, a2)))))
  | Vuna_dIr_dModel.C_Ir_IrTail (dtb__108) -> (Vuna_dIr_dModel.C_Ir_IrTail (((((v_annotateAt (fuel - 1)) arityOf) false) dtb__108)))
  | Vuna_dIr_dModel.C_Ir_IrIf (dtb__109, dtb__110, dtb__111) -> (Vuna_dIr_dModel.C_Ir_IrIf (((((v_annotateAt (fuel - 1)) arityOf) false) dtb__109), ((((v_annotateAt (fuel - 1)) arityOf) tail) dtb__110), ((((v_annotateAt (fuel - 1)) arityOf) tail) dtb__111)))
  | Vuna_dIr_dModel.C_Ir_IrCase (dtb__112, dtb__113, dtb__114, dtb__115) -> (Vuna_dIr_dModel.C_Ir_IrCase (dtb__112, dtb__113, ((((v_annotateAt (fuel - 1)) arityOf) false) dtb__114), ((B_dData_dList.v_map (((v_annotateAlt (fuel - 1)) arityOf) tail)) dtb__115)))
  | Vuna_dIr_dModel.C_Ir_IrNatCase (dtb__116, dtb__117, dtb__118, dtb__119, dtb__120) -> (Vuna_dIr_dModel.C_Ir_IrNatCase (((((v_annotateAt (fuel - 1)) arityOf) false) dtb__116), dtb__117, ((((v_annotateAltMaybe (fuel - 1)) arityOf) tail) dtb__118), ((((v_annotateAltMaybe (fuel - 1)) arityOf) tail) dtb__119), ((((v_annotateAltMaybe (fuel - 1)) arityOf) tail) dtb__120)))
  | Vuna_dIr_dModel.C_Ir_IrConcatMany (dtb__121) -> (Vuna_dIr_dModel.C_Ir_IrConcatMany (((B_dData_dList.v_map (((v_annotateAt (fuel - 1)) arityOf) false)) dtb__121)))
  | Vuna_dIr_dModel.C_Ir_IrEffThunk (dtb__122, dtb__123, dtb__124, dtb__125, dtb__126) -> (Vuna_dIr_dModel.C_Ir_IrEffThunk (dtb__122, dtb__123, dtb__124, dtb__125, ((((v_annotateAt (fuel - 1)) arityOf) false) dtb__126)))
  | Vuna_dIr_dModel.C_Ir_IrEffBind (dtb__127, dtb__128, dtb__129) -> ir
  | _ -> failwith "DT: impossible branch"
)))
# 142 "Vuna/Ir/Tail.vuna"
and v_annotateField = (fun (fuel : int) (arityOf : (string) -> int B_dData_dMaybe.t_Maybe) (p : (string, Vuna_dIr_dModel.t_Ir) B_dData_dPair.t_Pair) -> { B_dData_dPair.f_Pair_first = (B_dData_dPair.v_firstOf p); B_dData_dPair.f_Pair_second = ((((v_annotateAt fuel) arityOf) false) (B_dData_dPair.v_secondOf p)) })
# 145 "Vuna/Ir/Tail.vuna"
and v_annotateAlt = (fun (fuel : int) (arityOf : (string) -> int B_dData_dMaybe.t_Maybe) (tail : bool) (alt : Vuna_dIr_dModel.t_IrAlt) -> { Vuna_dIr_dModel.f_IrAlt_irAltCtor = (alt).Vuna_dIr_dModel.f_IrAlt_irAltCtor; Vuna_dIr_dModel.f_IrAlt_irAltBinders = (alt).Vuna_dIr_dModel.f_IrAlt_irAltBinders; Vuna_dIr_dModel.f_IrAlt_irAltBody = ((((v_annotateAt fuel) arityOf) tail) (alt).Vuna_dIr_dModel.f_IrAlt_irAltBody) })
# 149 "Vuna/Ir/Tail.vuna"
and v_annotateAltMaybe = (fun (mc0 : int) (mc1 : (string) -> int B_dData_dMaybe.t_Maybe) (mc2 : bool) (mc3 : Vuna_dIr_dModel.t_IrAlt B_dData_dMaybe.t_Maybe) -> (match mc3 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__130) -> (B_dData_dMaybe.C_Maybe_Just (((((v_annotateAlt mc0) mc1) mc2) dtb__130)))
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 38 "Vuna/Ir/Tail.vuna"
let v_annotateDef = (fun (mc0 : (string) -> int B_dData_dMaybe.t_Maybe) (mc1 : Vuna_dIr_dModel.t_IrDef) -> (match mc1 with
  | Vuna_dIr_dModel.C_IrDef_IrExternDef (dtb__131, dtb__132, dtb__133, dtb__134) -> mc1
  | Vuna_dIr_dModel.C_IrDef_IrDef (dtb__135, dtb__136, dtb__137, dtb__138, dtb__139, dtb__140, dtb__141, dtb__142) -> (Vuna_dIr_dModel.C_IrDef_IrDef (dtb__135, dtb__136, dtb__137, dtb__138, ((((v_annotateAt (v_tailFuelOf dtb__139)) mc0) true) dtb__139), dtb__140, dtb__141, dtb__142))
  | _ -> failwith "DT: impossible branch"
))

# 35 "Vuna/Ir/Tail.vuna"
let v_annotateDefsWith = (fun (arityOf : (string) -> int B_dData_dMaybe.t_Maybe) (defs : Vuna_dIr_dModel.t_IrDef B_dData_dList.t_List) -> ((B_dData_dList.v_map (v_annotateDef arityOf)) defs))

# 44 "Vuna/Ir/Tail.vuna"
let v_annotateBody = (fun (arityOf : (string) -> int B_dData_dMaybe.t_Maybe) (ir : Vuna_dIr_dModel.t_Ir) -> ((((v_annotateAt (v_tailFuelOf ir)) arityOf) true) ir))

# 48 "Vuna/Ir/Tail.vuna"
let v_annotateDefs = (fun (defs : Vuna_dIr_dModel.t_IrDef B_dData_dList.t_List) -> (let tbl = (v_arityTableOf defs) in (B_dData_dResult.C_Result_Ok (((v_annotateDefsWith (v_arityOfTable tbl)) defs)))))

# 175 "Vuna/Ir/Tail.vuna"
let rec v_tmcStripLams = (fun (mc0 : Vuna_dIr_dModel.t_Ir) -> (match mc0 with
  | Vuna_dIr_dModel.C_Ir_IrLam (dtb__143, dtb__144, dtb__145) -> (v_tmcStripLams dtb__145)
  | _ -> mc0
))

# 230 "Vuna/Ir/Tail.vuna"
let rec v_spineOf = (fun (fuel : int) (ir : Vuna_dIr_dModel.t_Ir) (acc : Vuna_dIr_dModel.t_Ir B_dData_dList.t_List) -> (if (fuel <= 0) then { B_dData_dPair.f_Pair_first = ir; B_dData_dPair.f_Pair_second = acc } else (match ir with
  | Vuna_dIr_dModel.C_Ir_IrApp (dtb__146, dtb__147, dtb__148) -> (((v_spineOf (fuel - 1)) dtb__147) (B_dData_dList.C_List__x58__x58_ (dtb__148, acc)))
  | _ -> { B_dData_dPair.f_Pair_first = ir; B_dData_dPair.f_Pair_second = acc }
)))

# 266 "Vuna/Ir/Tail.vuna"
let v_tmcAnd2 = (fun (fuel : int) (self : string) (a : (bool, bool) B_dData_dPair.t_Pair) (b : (bool, bool) B_dData_dPair.t_Pair) -> { B_dData_dPair.f_Pair_first = (if (B_dData_dPair.v_firstOf a) then (B_dData_dPair.v_firstOf b) else false); B_dData_dPair.f_Pair_second = (if (B_dData_dPair.v_secondOf a) then true else (B_dData_dPair.v_secondOf b)) })

# 262 "Vuna/Ir/Tail.vuna"
let rec v_tmcEach = (fun (mc0 : int) (mc1 : string) (mc2 : (bool, bool) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__149, dtb__150) -> ((((v_tmcAnd2 mc0) mc1) dtb__149) (((v_tmcEach (mc0 - 1)) mc1) dtb__150))
  | B_dData_dList.C_List_Nil -> { B_dData_dPair.f_Pair_first = true; B_dData_dPair.f_Pair_second = false }
  | _ -> failwith "DT: impossible branch"
))

# 269 "Vuna/Ir/Tail.vuna"
let v_tmcAnd3 = (fun (fuel : int) (self : string) (a : (bool, bool) B_dData_dPair.t_Pair) (b : (bool, bool) B_dData_dPair.t_Pair) (c : (bool, bool) B_dData_dPair.t_Pair) -> ((((v_tmcAnd2 fuel) self) ((((v_tmcAnd2 fuel) self) a) b)) c))

# 180 "Vuna/Ir/Tail.vuna"
let rec v_tmcProbe = (fun (fuel : int) (self : string) (tail : bool) (dest : bool) (ir : Vuna_dIr_dModel.t_Ir) -> (if (fuel <= 0) then { B_dData_dPair.f_Pair_first = true; B_dData_dPair.f_Pair_second = false } else (match ir with
  | Vuna_dIr_dModel.C_Ir_IrVar (dtb__151) -> { B_dData_dPair.f_Pair_first = true; B_dData_dPair.f_Pair_second = false }
  | Vuna_dIr_dModel.C_Ir_IrInt (dtb__152) -> { B_dData_dPair.f_Pair_first = true; B_dData_dPair.f_Pair_second = false }
  | Vuna_dIr_dModel.C_Ir_IrStr (dtb__153) -> { B_dData_dPair.f_Pair_first = true; B_dData_dPair.f_Pair_second = false }
  | Vuna_dIr_dModel.C_Ir_IrBool (dtb__154) -> { B_dData_dPair.f_Pair_first = true; B_dData_dPair.f_Pair_second = false }
  | Vuna_dIr_dModel.C_Ir_IrFloatLit (dtb__155) -> { B_dData_dPair.f_Pair_first = true; B_dData_dPair.f_Pair_second = false }
  | Vuna_dIr_dModel.C_Ir_IrRt (dtb__156) -> { B_dData_dPair.f_Pair_first = true; B_dData_dPair.f_Pair_second = false }
  | Vuna_dIr_dModel.C_Ir_IrEffBind (dtb__157, dtb__158, dtb__159) -> { B_dData_dPair.f_Pair_first = true; B_dData_dPair.f_Pair_second = false }
  | Vuna_dIr_dModel.C_Ir_IrGlobal (dtb__160) -> (if (dtb__160 = self) then (if (if tail then true else dest) then { B_dData_dPair.f_Pair_first = true; B_dData_dPair.f_Pair_second = dest } else { B_dData_dPair.f_Pair_first = false; B_dData_dPair.f_Pair_second = false }) else { B_dData_dPair.f_Pair_first = true; B_dData_dPair.f_Pair_second = false })
  | Vuna_dIr_dModel.C_Ir_IrTail (dtb__161) -> (((((v_tmcProbe (fuel - 1)) self) true) dest) dtb__161)
  | Vuna_dIr_dModel.C_Ir_IrCast (dtb__162, dtb__163, dtb__164) -> (((((v_tmcProbe (fuel - 1)) self) tail) dest) dtb__164)
  | Vuna_dIr_dModel.C_Ir_IrApp (dtb__165, dtb__166, dtb__167) -> (((((v_tmcApp (fuel - 1)) self) tail) dest) ir)
  | Vuna_dIr_dModel.C_Ir_IrCtor (dtb__168, dtb__169, dtb__170, dtb__171) -> ((((v_tmcCtorArgs (fuel - 1)) self) (if tail then true else dest)) dtb__171)
  | Vuna_dIr_dModel.C_Ir_IrProj (dtb__172, dtb__173, dtb__174, dtb__175) -> (((((v_tmcProbe (fuel - 1)) self) false) false) dtb__172)
  | Vuna_dIr_dModel.C_Ir_IrRecord (dtb__176, dtb__177, dtb__178) -> (((v_tmcFields (fuel - 1)) self) ((B_dData_dList.v_map (fun (f : (string, Vuna_dIr_dModel.t_Ir) B_dData_dPair.t_Pair) -> (B_dData_dPair.v_secondOf (Obj.magic f)))) dtb__178))
  | Vuna_dIr_dModel.C_Ir_IrRecUpd (dtb__179, dtb__180, dtb__181, dtb__182) -> ((((v_tmcAnd2 (fuel - 1)) self) (((((v_tmcProbe (fuel - 1)) self) false) false) dtb__179)) (((v_tmcFields (fuel - 1)) self) ((B_dData_dList.v_map (fun (f : (string, Vuna_dIr_dModel.t_Ir) B_dData_dPair.t_Pair) -> (B_dData_dPair.v_secondOf (Obj.magic f)))) dtb__181)))
  | Vuna_dIr_dModel.C_Ir_IrRtApp (dtb__183, dtb__184) -> (((v_tmcEach (fuel - 1)) self) ((B_dData_dList.v_map (fun (a : Vuna_dIr_dModel.t_Ir) -> (((((v_tmcProbe (fuel - 1)) self) false) false) a))) dtb__184))
  | Vuna_dIr_dModel.C_Ir_IrConcatMany (dtb__185) -> (((v_tmcEach (fuel - 1)) self) ((B_dData_dList.v_map (fun (a : Vuna_dIr_dModel.t_Ir) -> (((((v_tmcProbe (fuel - 1)) self) false) false) a))) dtb__185))
  | Vuna_dIr_dModel.C_Ir_IrLet (dtb__186, dtb__187, dtb__188) -> ((((v_tmcAnd2 (fuel - 1)) self) (((((v_tmcProbe (fuel - 1)) self) false) false) dtb__187)) (((((v_tmcProbe (fuel - 1)) self) tail) dest) dtb__188))
  | Vuna_dIr_dModel.C_Ir_IrLam (dtb__189, dtb__190, dtb__191) -> (((((v_tmcProbe (fuel - 1)) self) false) false) dtb__191)
  | Vuna_dIr_dModel.C_Ir_IrIf (dtb__192, dtb__193, dtb__194) -> (((((v_tmcAnd3 (fuel - 1)) self) (((((v_tmcProbe (fuel - 1)) self) false) false) dtb__192)) (((((v_tmcProbe (fuel - 1)) self) tail) dest) dtb__193)) (((((v_tmcProbe (fuel - 1)) self) tail) dest) dtb__194))
  | Vuna_dIr_dModel.C_Ir_IrCase (dtb__195, dtb__196, dtb__197, dtb__198) -> ((((v_tmcAnd2 (fuel - 1)) self) (((((v_tmcProbe (fuel - 1)) self) false) false) dtb__197)) (((((v_tmcAlts (fuel - 1)) self) tail) dest) dtb__198))
  | Vuna_dIr_dModel.C_Ir_IrNatCase (dtb__199, dtb__200, dtb__201, dtb__202, dtb__203) -> (((((v_tmcAnd3 (fuel - 1)) self) (((((v_tmcProbe (fuel - 1)) self) false) false) dtb__199)) (((((v_tmcAltM (fuel - 1)) self) tail) dest) dtb__201)) ((((v_tmcAnd2 (fuel - 1)) self) (((((v_tmcAltM (fuel - 1)) self) tail) dest) dtb__202)) (((((v_tmcAltM (fuel - 1)) self) tail) dest) dtb__203)))
  | Vuna_dIr_dModel.C_Ir_IrEffThunk (dtb__204, dtb__205, dtb__206, dtb__207, dtb__208) -> (((((v_tmcProbe (fuel - 1)) self) false) false) dtb__208)
  | _ -> failwith "DT: impossible branch"
)))
# 212 "Vuna/Ir/Tail.vuna"
and v_tmcApp = (fun (fuel : int) (self : string) (tail : bool) (dest : bool) (ir : Vuna_dIr_dModel.t_Ir) -> (match (((v_spineOf fuel) ir) B_dData_dList.C_List_Nil) with
  | { B_dData_dPair.f_Pair_first = dtb__209; B_dData_dPair.f_Pair_second = dtb__210 } -> (match dtb__209 with
  | Vuna_dIr_dModel.C_Ir_IrGlobal (dtb__211) -> (if (dtb__211 = self) then (match (((v_tmcEach (fuel - 1)) self) ((B_dData_dList.v_map (fun (a : Vuna_dIr_dModel.t_Ir) -> (((((v_tmcProbe (fuel - 1)) self) false) false) a))) dtb__210)) with
  | { B_dData_dPair.f_Pair_first = dtb__212; B_dData_dPair.f_Pair_second = dtb__213 } -> { B_dData_dPair.f_Pair_first = (if dtb__212 then (if tail then true else dest) else false); B_dData_dPair.f_Pair_second = dest }
  | _ -> failwith "DT: impossible branch"
) else (((v_tmcEach (fuel - 1)) self) ((B_dData_dList.v_map (fun (a : Vuna_dIr_dModel.t_Ir) -> (((((v_tmcProbe (fuel - 1)) self) false) false) a))) dtb__210)))
  | _ -> ((((v_tmcAnd2 (fuel - 1)) self) (((((v_tmcProbe (fuel - 1)) self) false) false) dtb__209)) (((v_tmcEach (fuel - 1)) self) ((B_dData_dList.v_map (fun (a : Vuna_dIr_dModel.t_Ir) -> (((((v_tmcProbe (fuel - 1)) self) false) false) a))) dtb__210)))
)
  | _ -> failwith "DT: impossible branch"
))
# 240 "Vuna/Ir/Tail.vuna"
and v_tmcCtorArgs = (fun (fuel : int) (self : string) (dest : bool) (args : Vuna_dIr_dModel.t_Ir B_dData_dList.t_List) -> (match (B_dData_dList.v_reverse args) with
  | B_dData_dList.C_List_Nil -> { B_dData_dPair.f_Pair_first = true; B_dData_dPair.f_Pair_second = false }
  | B_dData_dList.C_List__x58__x58_ (dtb__214, dtb__215) -> (match (((v_tmcEach (fuel - 1)) self) ((B_dData_dList.v_map (fun (a : Vuna_dIr_dModel.t_Ir) -> (((((v_tmcProbe (fuel - 1)) self) false) false) a))) dtb__215)) with
  | { B_dData_dPair.f_Pair_first = dtb__216; B_dData_dPair.f_Pair_second = dtb__217 } -> (match (((((v_tmcProbe (fuel - 1)) self) false) dest) dtb__214) with
  | { B_dData_dPair.f_Pair_first = dtb__218; B_dData_dPair.f_Pair_second = dtb__219 } -> { B_dData_dPair.f_Pair_first = (if dtb__216 then dtb__218 else false); B_dData_dPair.f_Pair_second = dtb__219 }
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))
# 250 "Vuna/Ir/Tail.vuna"
and v_tmcFields = (fun (fuel : int) (self : string) (fields : Vuna_dIr_dModel.t_Ir B_dData_dList.t_List) -> (((v_tmcEach (fuel - 1)) self) ((B_dData_dList.v_map (fun (f : Vuna_dIr_dModel.t_Ir) -> (((((v_tmcProbe (fuel - 1)) self) false) false) f))) fields)))
# 254 "Vuna/Ir/Tail.vuna"
and v_tmcAlts = (fun (fuel : int) (self : string) (tail : bool) (dest : bool) (alts : Vuna_dIr_dModel.t_IrAlt B_dData_dList.t_List) -> (((v_tmcEach (fuel - 1)) self) ((B_dData_dList.v_map (fun (a : Vuna_dIr_dModel.t_IrAlt) -> (((((v_tmcProbe (fuel - 1)) self) tail) dest) (Vuna_dIr_dModel.v_irAltBodyOf a)))) alts)))
# 258 "Vuna/Ir/Tail.vuna"
and v_tmcAltM = (fun (mc0 : int) (mc1 : string) (mc2 : bool) (mc3 : bool) (mc4 : Vuna_dIr_dModel.t_IrAlt B_dData_dMaybe.t_Maybe) -> (match mc4 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__220) -> (((((v_tmcProbe (mc0 - 1)) mc1) mc2) mc3) (Vuna_dIr_dModel.v_irAltBodyOf dtb__220))
  | B_dData_dMaybe.C_Maybe_Nothing -> { B_dData_dPair.f_Pair_first = true; B_dData_dPair.f_Pair_second = false }
  | _ -> failwith "DT: impossible branch"
))

# 166 "Vuna/Ir/Tail.vuna"
let v_tmcCandidate = (fun (mc0 : Vuna_dIr_dModel.t_IrDef) -> (match mc0 with
  | Vuna_dIr_dModel.C_IrDef_IrDef (dtb__221, dtb__222, dtb__223, dtb__224, dtb__225, dtb__226, dtb__227, dtb__228) -> (let core = (v_tmcStripLams dtb__225) in (match (((((v_tmcProbe (64 + (16 * (Vuna_dIr_dModel.v_irSize core)))) dtb__221) true) false) core) with
  | { B_dData_dPair.f_Pair_first = dtb__229; B_dData_dPair.f_Pair_second = dtb__230 } -> (if dtb__229 then dtb__230 else false)
  | _ -> failwith "DT: impossible branch"
))
  | Vuna_dIr_dModel.C_IrDef_IrExternDef (dtb__231, dtb__232, dtb__233, dtb__234) -> false
  | _ -> failwith "DT: impossible branch"
))
