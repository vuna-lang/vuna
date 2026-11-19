open Vuna_runtime
# 25 "Vuna/Compiler/Ir/Tail.vuna"
let v_addDef = (fun (tbl : (string, int) B_dContainer_dHashMap.t_HashMap) (d : Ir_dModel.t_IrDef) -> (match d with
  | Ir_dModel.C_IrDef_IrDef (dtb__0, dtb__1, dtb__2, dtb__3, dtb__4, dtb__5, dtb__6, dtb__7) -> ((((B_dContainer_dHashMap.v_insert B_dData_dString.v_Hashable_uString) dtb__0) dtb__1) tbl)
  | Ir_dModel.C_IrDef_IrExternDef (dtb__8, dtb__9, dtb__10, dtb__11) -> tbl
  | _ -> failwith "DT: impossible branch"
))

# 22 "Vuna/Compiler/Ir/Tail.vuna"
let v_arityTableOf = (fun (defs : Ir_dModel.t_IrDef B_dData_dList.t_List) -> (((B_dData_dList.v_foldl v_addDef) ((B_dContainer_dHashMap.v_fromList B_dData_dString.v_Hashable_uString) B_dData_dList.C_List_Nil)) defs))

# 31 "Vuna/Compiler/Ir/Tail.vuna"
let v_arityOfTable = (fun (tbl : (string, int) B_dContainer_dHashMap.t_HashMap) (name : string) -> ((((B_dContainer_dHashMap.v_lookup B_dData_dString.v_Hashable_uString) B_dData_dString.v_Eq_uString) name) tbl))

# 34 "Vuna/Compiler/Ir/Tail.vuna"
let v_tailFuelOf = (fun (ir : Ir_dModel.t_Ir) -> (64 + (16 * (Ir_dModel.v_irSize ir))))

# 63 "Vuna/Compiler/Ir/Tail.vuna"
let rec v_stripTailAt = (fun (fuel : int) (ir : Ir_dModel.t_Ir) -> (if (fuel <= 0) then ir else (match ir with
  | Ir_dModel.C_Ir_IrTail (dtb__12) -> ((v_stripTailAt (fuel - 1)) dtb__12)
  | Ir_dModel.C_Ir_IrVar (dtb__13) -> ir
  | Ir_dModel.C_Ir_IrGlobal (dtb__14) -> ir
  | Ir_dModel.C_Ir_IrCtor (dtb__15, dtb__16, dtb__17, dtb__18) -> (Ir_dModel.C_Ir_IrCtor (dtb__15, dtb__16, dtb__17, ((B_dData_dList.v_map (v_stripTailAt (fuel - 1))) dtb__18)))
  | Ir_dModel.C_Ir_IrRecord (dtb__19, dtb__20, dtb__21) -> (Ir_dModel.C_Ir_IrRecord (dtb__19, dtb__20, ((B_dData_dList.v_map (v_stripField (fuel - 1))) dtb__21)))
  | Ir_dModel.C_Ir_IrProj (dtb__22, dtb__23, dtb__24, dtb__25) -> (Ir_dModel.C_Ir_IrProj (((v_stripTailAt (fuel - 1)) dtb__22), dtb__23, dtb__24, dtb__25))
  | Ir_dModel.C_Ir_IrRecUpd (dtb__26, dtb__27, dtb__28, dtb__29) -> (Ir_dModel.C_Ir_IrRecUpd (((v_stripTailAt (fuel - 1)) dtb__26), dtb__27, ((B_dData_dList.v_map (v_stripField (fuel - 1))) dtb__28), dtb__29))
  | Ir_dModel.C_Ir_IrRt (dtb__30) -> ir
  | Ir_dModel.C_Ir_IrRtApp (dtb__31, dtb__32) -> (Ir_dModel.C_Ir_IrRtApp (dtb__31, ((B_dData_dList.v_map (v_stripTailAt (fuel - 1))) dtb__32)))
  | Ir_dModel.C_Ir_IrCast (dtb__33, dtb__34, dtb__35) -> (Ir_dModel.C_Ir_IrCast (dtb__33, dtb__34, ((v_stripTailAt (fuel - 1)) dtb__35)))
  | Ir_dModel.C_Ir_IrInt (dtb__36) -> ir
  | Ir_dModel.C_Ir_IrStr (dtb__37) -> ir
  | Ir_dModel.C_Ir_IrBool (dtb__38) -> ir
  | Ir_dModel.C_Ir_IrFloatLit (dtb__39) -> ir
  | Ir_dModel.C_Ir_IrLet (dtb__40, dtb__41, dtb__42) -> (Ir_dModel.C_Ir_IrLet (dtb__40, ((v_stripTailAt (fuel - 1)) dtb__41), ((v_stripTailAt (fuel - 1)) dtb__42)))
  | Ir_dModel.C_Ir_IrLam (dtb__43, dtb__44, dtb__45) -> (Ir_dModel.C_Ir_IrLam (dtb__43, dtb__44, ((v_stripTailAt (fuel - 1)) dtb__45)))
  | Ir_dModel.C_Ir_IrApp (dtb__46, dtb__47, dtb__48) -> (Ir_dModel.C_Ir_IrApp (dtb__46, ((v_stripTailAt (fuel - 1)) dtb__47), ((v_stripTailAt (fuel - 1)) dtb__48)))
  | Ir_dModel.C_Ir_IrIf (dtb__49, dtb__50, dtb__51) -> (Ir_dModel.C_Ir_IrIf (((v_stripTailAt (fuel - 1)) dtb__49), ((v_stripTailAt (fuel - 1)) dtb__50), ((v_stripTailAt (fuel - 1)) dtb__51)))
  | Ir_dModel.C_Ir_IrCase (dtb__52, dtb__53, dtb__54, dtb__55) -> (Ir_dModel.C_Ir_IrCase (dtb__52, dtb__53, ((v_stripTailAt (fuel - 1)) dtb__54), ((B_dData_dList.v_map (v_stripAlt (fuel - 1))) dtb__55)))
  | Ir_dModel.C_Ir_IrNatCase (dtb__56, dtb__57, dtb__58, dtb__59, dtb__60) -> (Ir_dModel.C_Ir_IrNatCase (((v_stripTailAt (fuel - 1)) dtb__56), dtb__57, ((v_stripAltM (fuel - 1)) dtb__58), ((v_stripAltM (fuel - 1)) dtb__59), ((v_stripAltM (fuel - 1)) dtb__60)))
  | Ir_dModel.C_Ir_IrConcatMany (dtb__61) -> (Ir_dModel.C_Ir_IrConcatMany (((B_dData_dList.v_map (v_stripTailAt (fuel - 1))) dtb__61)))
  | Ir_dModel.C_Ir_IrEffThunk (dtb__62, dtb__63, dtb__64, dtb__65, dtb__66) -> (Ir_dModel.C_Ir_IrEffThunk (dtb__62, dtb__63, dtb__64, dtb__65, ((v_stripTailAt (fuel - 1)) dtb__66)))
  | Ir_dModel.C_Ir_IrEffBind (dtb__67, dtb__68, dtb__69) -> ir
  | _ -> failwith "DT: impossible branch"
)))
# 93 "Vuna/Compiler/Ir/Tail.vuna"
and v_stripField = (fun (fuel : int) (p : (string, Ir_dModel.t_Ir) B_dData_dPair.t_Pair) -> { B_dData_dPair.f_Pair_first = (B_dData_dPair.v_firstOf p); B_dData_dPair.f_Pair_second = ((v_stripTailAt fuel) (B_dData_dPair.v_secondOf p)) })
# 96 "Vuna/Compiler/Ir/Tail.vuna"
and v_stripAlt = (fun (fuel : int) (alt : Ir_dModel.t_IrAlt) -> { Ir_dModel.f_IrAlt_irAltCtor = (alt).Ir_dModel.f_IrAlt_irAltCtor; Ir_dModel.f_IrAlt_irAltBinders = (alt).Ir_dModel.f_IrAlt_irAltBinders; Ir_dModel.f_IrAlt_irAltBody = ((v_stripTailAt fuel) (alt).Ir_dModel.f_IrAlt_irAltBody) })
# 99 "Vuna/Compiler/Ir/Tail.vuna"
and v_stripAltM = (fun (fuel : int) (m : Ir_dModel.t_IrAlt B_dData_dMaybe.t_Maybe) -> (match m with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb__70) -> (B_dData_dMaybe.C_Maybe_Just (((v_stripAlt fuel) dtb__70)))
  | _ -> failwith "DT: impossible branch"
))

# 60 "Vuna/Compiler/Ir/Tail.vuna"
let v_stripTail = (fun (ir : Ir_dModel.t_Ir) -> ((v_stripTailAt (v_tailFuelOf ir)) ir))

# 105 "Vuna/Compiler/Ir/Tail.vuna"
let rec v_annotateAt = (fun (fuel : int) (arityOf : (string) -> int B_dData_dMaybe.t_Maybe) (tail : bool) (ir : Ir_dModel.t_Ir) -> (if (fuel <= 0) then ir else (match ir with
  | Ir_dModel.C_Ir_IrVar (dtb__71) -> ir
  | Ir_dModel.C_Ir_IrGlobal (dtb__72) -> (if tail then ((fun nd_uscrut5 -> (match nd_uscrut5 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__73) -> (if (dtb__73 = 0) then (Ir_dModel.C_Ir_IrTail ((Ir_dModel.C_Ir_IrGlobal (dtb__72)))) else (Ir_dModel.C_Ir_IrGlobal (dtb__72)))
  | _ -> (Ir_dModel.C_Ir_IrGlobal (dtb__72))
)) (arityOf dtb__72)) else (Ir_dModel.C_Ir_IrGlobal (dtb__72)))
  | Ir_dModel.C_Ir_IrCtor (dtb__74, dtb__75, dtb__76, dtb__77) -> (Ir_dModel.C_Ir_IrCtor (dtb__74, dtb__75, dtb__76, ((B_dData_dList.v_map (((v_annotateAt (fuel - 1)) arityOf) false)) dtb__77)))
  | Ir_dModel.C_Ir_IrRecord (dtb__78, dtb__79, dtb__80) -> (Ir_dModel.C_Ir_IrRecord (dtb__78, dtb__79, ((B_dData_dList.v_map ((v_annotateField (fuel - 1)) arityOf)) dtb__80)))
  | Ir_dModel.C_Ir_IrProj (dtb__81, dtb__82, dtb__83, dtb__84) -> (Ir_dModel.C_Ir_IrProj (((((v_annotateAt (fuel - 1)) arityOf) false) dtb__81), dtb__82, dtb__83, dtb__84))
  | Ir_dModel.C_Ir_IrRecUpd (dtb__85, dtb__86, dtb__87, dtb__88) -> (Ir_dModel.C_Ir_IrRecUpd (((((v_annotateAt (fuel - 1)) arityOf) false) dtb__85), dtb__86, ((B_dData_dList.v_map ((v_annotateField (fuel - 1)) arityOf)) dtb__87), dtb__88))
  | Ir_dModel.C_Ir_IrRt (dtb__89) -> (if tail then (Ir_dModel.C_Ir_IrTail ((Ir_dModel.C_Ir_IrRt (dtb__89)))) else (Ir_dModel.C_Ir_IrRt (dtb__89)))
  | Ir_dModel.C_Ir_IrRtApp (dtb__90, dtb__91) -> ((fun args2 -> (if tail then (Ir_dModel.C_Ir_IrTail ((Ir_dModel.C_Ir_IrRtApp (dtb__90, args2)))) else (Ir_dModel.C_Ir_IrRtApp (dtb__90, args2)))) ((B_dData_dList.v_map (((v_annotateAt (fuel - 1)) arityOf) false)) dtb__91))
  | Ir_dModel.C_Ir_IrCast (dtb__92, dtb__93, dtb__94) -> (Ir_dModel.C_Ir_IrCast (dtb__92, dtb__93, ((((v_annotateAt (fuel - 1)) arityOf) tail) dtb__94)))
  | Ir_dModel.C_Ir_IrInt (dtb__95) -> ir
  | Ir_dModel.C_Ir_IrStr (dtb__96) -> ir
  | Ir_dModel.C_Ir_IrBool (dtb__97) -> ir
  | Ir_dModel.C_Ir_IrFloatLit (dtb__98) -> ir
  | Ir_dModel.C_Ir_IrLet (dtb__99, dtb__100, dtb__101) -> (Ir_dModel.C_Ir_IrLet (dtb__99, ((((v_annotateAt (fuel - 1)) arityOf) false) dtb__100), ((((v_annotateAt (fuel - 1)) arityOf) tail) dtb__101)))
  | Ir_dModel.C_Ir_IrLam (dtb__102, dtb__103, dtb__104) -> (Ir_dModel.C_Ir_IrLam (dtb__102, dtb__103, ((((v_annotateAt (fuel - 1)) arityOf) true) dtb__104)))
  | Ir_dModel.C_Ir_IrApp (dtb__105, dtb__106, dtb__107) -> ((fun f2 -> ((fun a2 -> (if tail then (Ir_dModel.C_Ir_IrTail ((Ir_dModel.C_Ir_IrApp (dtb__105, f2, a2)))) else (Ir_dModel.C_Ir_IrApp (dtb__105, f2, a2)))) ((((v_annotateAt (fuel - 1)) arityOf) false) dtb__107))) ((((v_annotateAt (fuel - 1)) arityOf) false) dtb__106))
  | Ir_dModel.C_Ir_IrTail (dtb__108) -> (Ir_dModel.C_Ir_IrTail (((((v_annotateAt (fuel - 1)) arityOf) false) dtb__108)))
  | Ir_dModel.C_Ir_IrIf (dtb__109, dtb__110, dtb__111) -> (Ir_dModel.C_Ir_IrIf (((((v_annotateAt (fuel - 1)) arityOf) false) dtb__109), ((((v_annotateAt (fuel - 1)) arityOf) tail) dtb__110), ((((v_annotateAt (fuel - 1)) arityOf) tail) dtb__111)))
  | Ir_dModel.C_Ir_IrCase (dtb__112, dtb__113, dtb__114, dtb__115) -> (Ir_dModel.C_Ir_IrCase (dtb__112, dtb__113, ((((v_annotateAt (fuel - 1)) arityOf) false) dtb__114), ((B_dData_dList.v_map (((v_annotateAlt (fuel - 1)) arityOf) tail)) dtb__115)))
  | Ir_dModel.C_Ir_IrNatCase (dtb__116, dtb__117, dtb__118, dtb__119, dtb__120) -> (Ir_dModel.C_Ir_IrNatCase (((((v_annotateAt (fuel - 1)) arityOf) false) dtb__116), dtb__117, ((((v_annotateAltMaybe (fuel - 1)) arityOf) tail) dtb__118), ((((v_annotateAltMaybe (fuel - 1)) arityOf) tail) dtb__119), ((((v_annotateAltMaybe (fuel - 1)) arityOf) tail) dtb__120)))
  | Ir_dModel.C_Ir_IrConcatMany (dtb__121) -> (Ir_dModel.C_Ir_IrConcatMany (((B_dData_dList.v_map (((v_annotateAt (fuel - 1)) arityOf) false)) dtb__121)))
  | Ir_dModel.C_Ir_IrEffThunk (dtb__122, dtb__123, dtb__124, dtb__125, dtb__126) -> (Ir_dModel.C_Ir_IrEffThunk (dtb__122, dtb__123, dtb__124, dtb__125, ((((v_annotateAt (fuel - 1)) arityOf) false) dtb__126)))
  | Ir_dModel.C_Ir_IrEffBind (dtb__127, dtb__128, dtb__129) -> ir
  | _ -> failwith "DT: impossible branch"
)))
# 148 "Vuna/Compiler/Ir/Tail.vuna"
and v_annotateField = (fun (fuel : int) (arityOf : (string) -> int B_dData_dMaybe.t_Maybe) (p : (string, Ir_dModel.t_Ir) B_dData_dPair.t_Pair) -> { B_dData_dPair.f_Pair_first = (B_dData_dPair.v_firstOf p); B_dData_dPair.f_Pair_second = ((((v_annotateAt fuel) arityOf) false) (B_dData_dPair.v_secondOf p)) })
# 151 "Vuna/Compiler/Ir/Tail.vuna"
and v_annotateAlt = (fun (fuel : int) (arityOf : (string) -> int B_dData_dMaybe.t_Maybe) (tail : bool) (alt : Ir_dModel.t_IrAlt) -> { Ir_dModel.f_IrAlt_irAltCtor = (alt).Ir_dModel.f_IrAlt_irAltCtor; Ir_dModel.f_IrAlt_irAltBinders = (alt).Ir_dModel.f_IrAlt_irAltBinders; Ir_dModel.f_IrAlt_irAltBody = ((((v_annotateAt fuel) arityOf) tail) (alt).Ir_dModel.f_IrAlt_irAltBody) })
# 155 "Vuna/Compiler/Ir/Tail.vuna"
and v_annotateAltMaybe = (fun (fuel : int) (arityOf : (string) -> int B_dData_dMaybe.t_Maybe) (tail : bool) (m : Ir_dModel.t_IrAlt B_dData_dMaybe.t_Maybe) -> (match m with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb__130) -> (B_dData_dMaybe.C_Maybe_Just (((((v_annotateAlt fuel) arityOf) tail) dtb__130)))
  | _ -> failwith "DT: impossible branch"
))

# 40 "Vuna/Compiler/Ir/Tail.vuna"
let v_annotateDef = (fun (arityOf : (string) -> int B_dData_dMaybe.t_Maybe) (d : Ir_dModel.t_IrDef) -> (match d with
  | Ir_dModel.C_IrDef_IrDef (dtb__131, dtb__132, dtb__133, dtb__134, dtb__135, dtb__136, dtb__137, dtb__138) -> (Ir_dModel.C_IrDef_IrDef (dtb__131, dtb__132, dtb__133, dtb__134, ((((v_annotateAt (v_tailFuelOf dtb__135)) arityOf) true) dtb__135), dtb__136, dtb__137, dtb__138))
  | Ir_dModel.C_IrDef_IrExternDef (dtb__139, dtb__140, dtb__141, dtb__142) -> d
  | _ -> failwith "DT: impossible branch"
))

# 37 "Vuna/Compiler/Ir/Tail.vuna"
let v_annotateDefsWith = (fun (arityOf : (string) -> int B_dData_dMaybe.t_Maybe) (defs : Ir_dModel.t_IrDef B_dData_dList.t_List) -> ((B_dData_dList.v_map (v_annotateDef arityOf)) defs))

# 48 "Vuna/Compiler/Ir/Tail.vuna"
let v_annotateBody = (fun (arityOf : (string) -> int B_dData_dMaybe.t_Maybe) (ir : Ir_dModel.t_Ir) -> ((((v_annotateAt (v_tailFuelOf ir)) arityOf) true) ir))

# 52 "Vuna/Compiler/Ir/Tail.vuna"
let v_annotateDefs = (fun (defs : Ir_dModel.t_IrDef B_dData_dList.t_List) -> ((fun tbl -> (B_dData_dResult.C_Result_Ok (((v_annotateDefsWith (v_arityOfTable tbl)) defs)))) (v_arityTableOf defs)))
