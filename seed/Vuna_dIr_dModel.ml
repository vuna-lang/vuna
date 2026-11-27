open Vuna_runtime
type t_IrTy = C_IrTy_IrTyVar of (int) | C_IrTy_IrTyInt | C_IrTy_IrTyStr | C_IrTy_IrTyBool | C_IrTy_IrTyFloat | C_IrTy_IrTyOpaque | C_IrTy_IrTyArray of (t_IrTy) | C_IrTy_IrTyRef of (t_IrTy) | C_IrTy_IrTyData of (string) * (t_IrTy B_dData_dList.t_List) | C_IrTy_IrTyFun of (t_IrTy) * (t_IrTy)
and t_IrBName = C_IrBName_IrBUser of (string) | C_IrBName_IrBArm of (int) | C_IrBName_IrBNat of (int) | C_IrBName_IrBWild
and t_IrBinder = { f_IrBinder_irBinderId : int; f_IrBinder_irBinderName : t_IrBName; f_IrBinder_irBinderErased : bool; f_IrBinder_irBinderTy : t_IrTy B_dData_dMaybe.t_Maybe }
and t_IrAlt = { f_IrAlt_irAltCtor : (string, string) B_dData_dPair.t_Pair B_dData_dMaybe.t_Maybe; f_IrAlt_irAltBinders : t_IrBinder B_dData_dList.t_List; f_IrAlt_irAltBody : t_Ir }
and t_Ir = C_Ir_IrVar of (t_IrBinder) | C_Ir_IrGlobal of (string) | C_Ir_IrCtor of (string) * (string) * (t_IrTy B_dData_dList.t_List B_dData_dMaybe.t_Maybe) * (t_Ir B_dData_dList.t_List) | C_Ir_IrRecord of (string) * (t_IrTy B_dData_dMaybe.t_Maybe) * ((string, t_Ir) B_dData_dPair.t_Pair B_dData_dList.t_List) | C_Ir_IrProj of (t_Ir) * (string) * (string) * (t_IrTy B_dData_dMaybe.t_Maybe) | C_Ir_IrRecUpd of (t_Ir) * (string) * ((string, t_Ir) B_dData_dPair.t_Pair B_dData_dList.t_List) * (t_IrTy B_dData_dMaybe.t_Maybe) | C_Ir_IrRt of (string) | C_Ir_IrRtApp of (string) * (t_Ir B_dData_dList.t_List) | C_Ir_IrCast of (t_IrTy B_dData_dMaybe.t_Maybe) * (t_IrTy B_dData_dMaybe.t_Maybe) * (t_Ir) | C_Ir_IrInt of (int) | C_Ir_IrStr of (string) | C_Ir_IrBool of (bool) | C_Ir_IrFloatLit of (string) | C_Ir_IrLet of (t_IrBinder B_dData_dList.t_List) * (t_Ir) * (t_Ir) | C_Ir_IrLam of (t_IrBinder B_dData_dList.t_List) * (t_IrTy B_dData_dMaybe.t_Maybe) * (t_Ir) | C_Ir_IrApp of ((t_IrTy, t_IrTy) B_dData_dPair.t_Pair B_dData_dMaybe.t_Maybe) * (t_Ir) * (t_Ir) | C_Ir_IrTail of (t_Ir) | C_Ir_IrIf of (t_Ir) * (t_Ir) * (t_Ir) | C_Ir_IrCase of (t_IrTy B_dData_dMaybe.t_Maybe) * (t_IrTy B_dData_dMaybe.t_Maybe) * (t_Ir) * (t_IrAlt B_dData_dList.t_List) | C_Ir_IrNatCase of (t_Ir) * (int) * (t_IrAlt B_dData_dMaybe.t_Maybe) * (t_IrAlt B_dData_dMaybe.t_Maybe) * (t_IrAlt B_dData_dMaybe.t_Maybe) | C_Ir_IrConcatMany of (t_Ir B_dData_dList.t_List) | C_Ir_IrEffThunk of (string) * (string) * (t_IrTy) * (int) * (t_Ir) | C_Ir_IrEffBind of (string) * (string) * (t_IrTy)
and t_IrTyDecl = C_IrTyDecl_IrVariantDecl of (string) * (int) * ((string, t_IrTy B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) | C_IrTyDecl_IrRecordDecl of (string) * (int) * ((int, string) B_dData_dPair.t_Pair B_dData_dList.t_List) * (t_IrTy B_dData_dList.t_List) | C_IrTyDecl_IrUnboxedDecl of (string) * (int) * (t_IrTy)
and t_IrDef = C_IrDef_IrDef of (string) * (int) * (string B_dData_dList.t_List) * (t_IrTy B_dData_dMaybe.t_Maybe) * (t_Ir) * (bool) * (bool) * (Base_dSource.t_Span B_dData_dMaybe.t_Maybe) | C_IrDef_IrExternDef of (string) * (t_IrTy) * (string) * (Base_dSource.t_Span B_dData_dMaybe.t_Maybe)
and t_IrGroup = { f_IrGroup_irGroupIsRec : bool; f_IrGroup_irGroupDefs : t_IrDef B_dData_dList.t_List }
and t_IrEntry = { f_IrEntry_irEntryShow : t_Ir; f_IrEntry_irEntryMain : string; f_IrEntry_irEntryIsAction : bool; f_IrEntry_irEntryRunMain : string B_dData_dMaybe.t_Maybe; f_IrEntry_irEntryHandlers : string B_dData_dList.t_List; f_IrEntry_irEntryRowTags : string B_dData_dList.t_List }
and t_IrListFam = { f_IrListFam_irListFamily : string; f_IrListFam_irListNil : string; f_IrListFam_irListCons : string }
and t_IrShared = { f_IrShared_irSharedRecordFields : (string, (int, string) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List; f_IrShared_irSharedListFam : t_IrListFam B_dData_dMaybe.t_Maybe; f_IrShared_irSharedUsesFloat : bool; f_IrShared_irSharedUsesTrace : bool; f_IrShared_irSharedUsesObs : bool; f_IrShared_irSharedDefLocs : (string, (string, int) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List; f_IrShared_irSharedUnboxed : (string, (string, int) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List; f_IrShared_irSharedCtorShapes : (string, (string, bool B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List; f_IrShared_irSharedUsesHost : bool; f_IrShared_irSharedUsesSched : bool; f_IrShared_irSharedUsesEff : bool }
and t_IrUnit = { f_IrUnit_irUnitTyDecls : t_IrTyDecl B_dData_dList.t_List; f_IrUnit_irUnitGroups : t_IrGroup B_dData_dList.t_List; f_IrUnit_irUnitHasListFamily : bool; f_IrUnit_irUnitTypeRefs : string B_dData_dList.t_List; f_IrUnit_irUnitEntry : t_IrEntry B_dData_dMaybe.t_Maybe }
and t_IrProgram = { f_IrProgram_irProgShared : t_IrShared; f_IrProgram_irProgUnit : t_IrUnit }

# 68 "Vuna/Ir/Model.vuna"
let rec v_irTyVarAt = (fun (mc0 : t_IrTy B_dData_dList.t_List) (mc1 : int) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__0, dtb__1) -> (if (mc1 <= 0) then dtb__0 else ((v_irTyVarAt dtb__1) (mc1 - 1)))
  | B_dData_dList.C_List_Nil -> C_IrTy_IrTyOpaque
  | _ -> failwith "DT: impossible branch"
))

# 56 "Vuna/Ir/Model.vuna"
let rec v_irTySubstVars = (fun (mc0 : t_IrTy B_dData_dList.t_List) (mc1 : t_IrTy) -> (match mc1 with
  | C_IrTy_IrTyFun (dtb__2, dtb__3) -> (C_IrTy_IrTyFun (((v_irTySubstVars mc0) dtb__2), ((v_irTySubstVars mc0) dtb__3)))
  | C_IrTy_IrTyData (dtb__4, dtb__5) -> (C_IrTy_IrTyData (dtb__4, ((B_dData_dList.v_map (fun (x : t_IrTy) -> ((v_irTySubstVars mc0) x))) dtb__5)))
  | C_IrTy_IrTyRef (dtb__6) -> (C_IrTy_IrTyRef (((v_irTySubstVars mc0) dtb__6)))
  | C_IrTy_IrTyArray (dtb__7) -> (C_IrTy_IrTyArray (((v_irTySubstVars mc0) dtb__7)))
  | C_IrTy_IrTyOpaque -> C_IrTy_IrTyOpaque
  | C_IrTy_IrTyFloat -> C_IrTy_IrTyFloat
  | C_IrTy_IrTyBool -> C_IrTy_IrTyBool
  | C_IrTy_IrTyStr -> C_IrTy_IrTyStr
  | C_IrTy_IrTyInt -> C_IrTy_IrTyInt
  | C_IrTy_IrTyVar (dtb__8) -> ((v_irTyVarAt mc0) dtb__8)
  | _ -> failwith "DT: impossible branch"
))

# 73 "Vuna/Ir/Model.vuna"
let v_irTyDataArgsOf = (fun (mc0 : t_IrTy B_dData_dMaybe.t_Maybe) -> (match mc0 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__9) -> (match dtb__9 with
  | C_IrTy_IrTyData (dtb__10, dtb__11) -> dtb__11
  | _ -> B_dData_dList.C_List_Nil
)
  | _ -> B_dData_dList.C_List_Nil
))

# 78 "Vuna/Ir/Model.vuna"
let rec v_irTyAt = (fun (mc0 : t_IrTy B_dData_dList.t_List) (mc1 : int) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__12, dtb__13) -> (if (mc1 <= 0) then (B_dData_dMaybe.C_Maybe_Just (dtb__12)) else ((v_irTyAt dtb__13) (mc1 - 1)))
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 85 "Vuna/Ir/Model.vuna"
let rec v_irTyAnnotatable = (fun (mc0 : t_IrTy) -> (match mc0 with
  | C_IrTy_IrTyFun (dtb__14, dtb__15) -> (if (v_irTyAnnotatable dtb__14) then (v_irTyAnnotatable dtb__15) else false)
  | C_IrTy_IrTyData (dtb__16, dtb__17) -> (v_allAnnotatableIrTys dtb__17)
  | C_IrTy_IrTyRef (dtb__18) -> (v_irTyAnnotatable dtb__18)
  | C_IrTy_IrTyArray (dtb__19) -> (v_irTyAnnotatable dtb__19)
  | C_IrTy_IrTyOpaque -> false
  | C_IrTy_IrTyFloat -> true
  | C_IrTy_IrTyBool -> true
  | C_IrTy_IrTyStr -> true
  | C_IrTy_IrTyInt -> true
  | C_IrTy_IrTyVar (dtb__20) -> false
  | _ -> failwith "DT: impossible branch"
))
# 97 "Vuna/Ir/Model.vuna"
and v_allAnnotatableIrTys = (fun (mc0 : t_IrTy B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__21, dtb__22) -> (if (v_irTyAnnotatable dtb__21) then (v_allAnnotatableIrTys dtb__22) else false)
  | B_dData_dList.C_List_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

# 130 "Vuna/Ir/Model.vuna"
let v_sameBinderId = (fun (a : t_IrBinder) (b : t_IrBinder) -> ((a).f_IrBinder_irBinderId = (b).f_IrBinder_irBinderId))

# 134 "Vuna/Ir/Model.vuna"
let v_mkIrBinder = (fun (id : int) (name : string) -> { f_IrBinder_irBinderId = id; f_IrBinder_irBinderName = (C_IrBName_IrBUser (name)); f_IrBinder_irBinderErased = false; f_IrBinder_irBinderTy = B_dData_dMaybe.C_Maybe_Nothing })

# 138 "Vuna/Ir/Model.vuna"
let v_mkIrBinderTyped = (fun (id : int) (name : string) (ty : t_IrTy) -> { f_IrBinder_irBinderId = id; f_IrBinder_irBinderName = (C_IrBName_IrBUser (name)); f_IrBinder_irBinderErased = false; f_IrBinder_irBinderTy = (B_dData_dMaybe.C_Maybe_Just (ty)) })

# 142 "Vuna/Ir/Model.vuna"
let v_mkIrBinderOpaque = (fun (id : int) (name : string) -> { f_IrBinder_irBinderId = id; f_IrBinder_irBinderName = (C_IrBName_IrBUser (name)); f_IrBinder_irBinderErased = false; f_IrBinder_irBinderTy = (B_dData_dMaybe.C_Maybe_Just (C_IrTy_IrTyOpaque)) })

# 146 "Vuna/Ir/Model.vuna"
let v_mkIrBinderErased = { f_IrBinder_irBinderId = 0; f_IrBinder_irBinderName = C_IrBName_IrBWild; f_IrBinder_irBinderErased = true; f_IrBinder_irBinderTy = B_dData_dMaybe.C_Maybe_Nothing }

# 150 "Vuna/Ir/Model.vuna"
let v_mkIrBinderArm = (fun (id : int) (n : int) -> { f_IrBinder_irBinderId = id; f_IrBinder_irBinderName = (C_IrBName_IrBArm (n)); f_IrBinder_irBinderErased = false; f_IrBinder_irBinderTy = B_dData_dMaybe.C_Maybe_Nothing })

# 154 "Vuna/Ir/Model.vuna"
let v_mkIrBinderNat = (fun (id : int) (n : int) -> { f_IrBinder_irBinderId = id; f_IrBinder_irBinderName = (C_IrBName_IrBNat (n)); f_IrBinder_irBinderErased = false; f_IrBinder_irBinderTy = B_dData_dMaybe.C_Maybe_Nothing })

# 158 "Vuna/Ir/Model.vuna"
let v_mkIrBinderWild = (fun (id : int) -> { f_IrBinder_irBinderId = id; f_IrBinder_irBinderName = C_IrBName_IrBWild; f_IrBinder_irBinderErased = false; f_IrBinder_irBinderTy = B_dData_dMaybe.C_Maybe_Nothing })

# 278 "Vuna/Ir/Model.vuna"
let rec v_irLamTyFuel = (fun (fuel : int) (bodyTy : t_IrTy B_dData_dMaybe.t_Maybe) (bs : t_IrBinder B_dData_dList.t_List) -> (if (fuel <= 0) then B_dData_dMaybe.C_Maybe_Nothing else (match bs with
  | B_dData_dList.C_List_Nil -> bodyTy
  | B_dData_dList.C_List__x58__x58_ (dtb__23, dtb__24) -> (match (((v_irLamTyFuel (fuel - 1)) bodyTy) dtb__24) with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb__25) -> (if (dtb__23).f_IrBinder_irBinderErased then (B_dData_dMaybe.C_Maybe_Just (dtb__25)) else (match (dtb__23).f_IrBinder_irBinderTy with
  | B_dData_dMaybe.C_Maybe_Just (dtb__26) -> (B_dData_dMaybe.C_Maybe_Just ((C_IrTy_IrTyFun (dtb__26, dtb__25))))
  | B_dData_dMaybe.C_Maybe_Nothing -> (B_dData_dMaybe.C_Maybe_Just ((C_IrTy_IrTyFun (C_IrTy_IrTyOpaque, dtb__25))))
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))

# 240 "Vuna/Ir/Model.vuna"
let rec v_irResultTyFuel = (fun (fuel : int) (ir : t_Ir) -> (if (fuel <= 0) then B_dData_dMaybe.C_Maybe_Nothing else (match ir with
  | C_Ir_IrVar (dtb__27) -> (if (dtb__27).f_IrBinder_irBinderErased then B_dData_dMaybe.C_Maybe_Nothing else (dtb__27).f_IrBinder_irBinderTy)
  | C_Ir_IrRecord (dtb__28, dtb__29, dtb__30) -> dtb__29
  | C_Ir_IrProj (dtb__31, dtb__32, dtb__33, dtb__34) -> dtb__34
  | C_Ir_IrRecUpd (dtb__35, dtb__36, dtb__37, dtb__38) -> dtb__38
  | C_Ir_IrCast (dtb__39, dtb__40, dtb__41) -> dtb__40
  | C_Ir_IrInt (dtb__42) -> (B_dData_dMaybe.C_Maybe_Just (C_IrTy_IrTyInt))
  | C_Ir_IrStr (dtb__43) -> (B_dData_dMaybe.C_Maybe_Just (C_IrTy_IrTyStr))
  | C_Ir_IrBool (dtb__44) -> (B_dData_dMaybe.C_Maybe_Just (C_IrTy_IrTyBool))
  | C_Ir_IrFloatLit (dtb__45) -> (B_dData_dMaybe.C_Maybe_Just (C_IrTy_IrTyFloat))
  | C_Ir_IrLet (dtb__46, dtb__47, dtb__48) -> ((v_irResultTyFuel (fuel - 1)) dtb__48)
  | C_Ir_IrLam (dtb__49, dtb__50, dtb__51) -> (((v_irLamTyFuel (fuel - 1)) dtb__50) dtb__49)
  | C_Ir_IrApp (dtb__52, dtb__53, dtb__54) -> (match dtb__52 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__55) -> (B_dData_dMaybe.C_Maybe_Just ((B_dData_dPair.v_secondOf dtb__55)))
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)
  | C_Ir_IrTail (dtb__56) -> ((v_irResultTyFuel (fuel - 1)) dtb__56)
  | C_Ir_IrIf (dtb__57, dtb__58, dtb__59) -> (match ((v_irResultTyFuel (fuel - 1)) dtb__58) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__60) -> (B_dData_dMaybe.C_Maybe_Just (dtb__60))
  | B_dData_dMaybe.C_Maybe_Nothing -> ((v_irResultTyFuel (fuel - 1)) dtb__59)
  | _ -> failwith "DT: impossible branch"
)
  | C_Ir_IrCase (dtb__61, dtb__62, dtb__63, dtb__64) -> dtb__62
  | C_Ir_IrConcatMany (dtb__65) -> (B_dData_dMaybe.C_Maybe_Just (C_IrTy_IrTyStr))
  | C_Ir_IrGlobal (dtb__66) -> B_dData_dMaybe.C_Maybe_Nothing
  | C_Ir_IrCtor (dtb__67, dtb__68, dtb__69, dtb__70) -> B_dData_dMaybe.C_Maybe_Nothing
  | C_Ir_IrRt (dtb__71) -> B_dData_dMaybe.C_Maybe_Nothing
  | C_Ir_IrRtApp (dtb__72, dtb__73) -> B_dData_dMaybe.C_Maybe_Nothing
  | C_Ir_IrNatCase (dtb__74, dtb__75, dtb__76, dtb__77, dtb__78) -> B_dData_dMaybe.C_Maybe_Nothing
  | C_Ir_IrEffThunk (dtb__79, dtb__80, dtb__81, dtb__82, dtb__83) -> B_dData_dMaybe.C_Maybe_Nothing
  | C_Ir_IrEffBind (dtb__84, dtb__85, dtb__86) -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)))

# 237 "Vuna/Ir/Model.vuna"
let v_irResultTyOf = (fun (ir : t_Ir) -> ((v_irResultTyFuel 256) ir))

# 297 "Vuna/Ir/Model.vuna"
let v_irEffTypeName = "Base.Effect.Core.Eff"

# 300 "Vuna/Ir/Model.vuna"
let v_irEffMkCtor = "Base.Effect.Core.Eff.MkEff"

# 330 "Vuna/Ir/Model.vuna"
let v_irDefName = (fun (mc0 : t_IrDef) -> (match mc0 with
  | C_IrDef_IrExternDef (dtb__87, dtb__88, dtb__89, dtb__90) -> dtb__87
  | C_IrDef_IrDef (dtb__91, dtb__92, dtb__93, dtb__94, dtb__95, dtb__96, dtb__97, dtb__98) -> dtb__91
  | _ -> failwith "DT: impossible branch"
))

# 334 "Vuna/Ir/Model.vuna"
let v_irDefArity = (fun (mc0 : t_IrDef) -> (match mc0 with
  | C_IrDef_IrExternDef (dtb__99, dtb__100, dtb__101, dtb__102) -> 0
  | C_IrDef_IrDef (dtb__103, dtb__104, dtb__105, dtb__106, dtb__107, dtb__108, dtb__109, dtb__110) -> dtb__104
  | _ -> failwith "DT: impossible branch"
))

# 338 "Vuna/Ir/Model.vuna"
let v_irDefDeps = (fun (mc0 : t_IrDef) -> (match mc0 with
  | C_IrDef_IrExternDef (dtb__111, dtb__112, dtb__113, dtb__114) -> B_dData_dList.C_List_Nil
  | C_IrDef_IrDef (dtb__115, dtb__116, dtb__117, dtb__118, dtb__119, dtb__120, dtb__121, dtb__122) -> dtb__117
  | _ -> failwith "DT: impossible branch"
))

# 342 "Vuna/Ir/Model.vuna"
let v_irDefTy = (fun (mc0 : t_IrDef) -> (match mc0 with
  | C_IrDef_IrExternDef (dtb__123, dtb__124, dtb__125, dtb__126) -> (B_dData_dMaybe.C_Maybe_Just (dtb__124))
  | C_IrDef_IrDef (dtb__127, dtb__128, dtb__129, dtb__130, dtb__131, dtb__132, dtb__133, dtb__134) -> dtb__130
  | _ -> failwith "DT: impossible branch"
))

# 346 "Vuna/Ir/Model.vuna"
let v_irDefBody = (fun (mc0 : t_IrDef) -> (match mc0 with
  | C_IrDef_IrExternDef (dtb__135, dtb__136, dtb__137, dtb__138) -> B_dData_dMaybe.C_Maybe_Nothing
  | C_IrDef_IrDef (dtb__139, dtb__140, dtb__141, dtb__142, dtb__143, dtb__144, dtb__145, dtb__146) -> (B_dData_dMaybe.C_Maybe_Just (dtb__143))
  | _ -> failwith "DT: impossible branch"
))

# 350 "Vuna/Ir/Model.vuna"
let v_irDefExtern = (fun (mc0 : t_IrDef) -> (match mc0 with
  | C_IrDef_IrExternDef (dtb__147, dtb__148, dtb__149, dtb__150) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = dtb__148; B_dData_dPair.f_Pair_second = dtb__149 }))
  | C_IrDef_IrDef (dtb__151, dtb__152, dtb__153, dtb__154, dtb__155, dtb__156, dtb__157, dtb__158) -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 355 "Vuna/Ir/Model.vuna"
let v_irDefRecValueOk = (fun (mc0 : t_IrDef) -> (match mc0 with
  | C_IrDef_IrExternDef (dtb__159, dtb__160, dtb__161, dtb__162) -> true
  | C_IrDef_IrDef (dtb__163, dtb__164, dtb__165, dtb__166, dtb__167, dtb__168, dtb__169, dtb__170) -> dtb__168
  | _ -> failwith "DT: impossible branch"
))

# 360 "Vuna/Ir/Model.vuna"
let v_irDefInitGuard = (fun (mc0 : t_IrDef) -> (match mc0 with
  | C_IrDef_IrExternDef (dtb__171, dtb__172, dtb__173, dtb__174) -> false
  | C_IrDef_IrDef (dtb__175, dtb__176, dtb__177, dtb__178, dtb__179, dtb__180, dtb__181, dtb__182) -> dtb__181
  | _ -> failwith "DT: impossible branch"
))

# 364 "Vuna/Ir/Model.vuna"
let v_irDefSpan = (fun (mc0 : t_IrDef) -> (match mc0 with
  | C_IrDef_IrExternDef (dtb__183, dtb__184, dtb__185, dtb__186) -> dtb__186
  | C_IrDef_IrDef (dtb__187, dtb__188, dtb__189, dtb__190, dtb__191, dtb__192, dtb__193, dtb__194) -> dtb__194
  | _ -> failwith "DT: impossible branch"
))

# 439 "Vuna/Ir/Model.vuna"
let rec v_irSharedUnboxedOf = (fun (mc0 : string) (mc1 : (string, (string, int) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__195, dtb__196) -> (if ((B_dData_dPair.v_firstOf dtb__195) = mc0) then (B_dData_dMaybe.C_Maybe_Just ((B_dData_dPair.v_secondOf dtb__195))) else ((v_irSharedUnboxedOf mc0) dtb__196))
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 444 "Vuna/Ir/Model.vuna"
let rec v_irSharedCtorShapeOf = (fun (mc0 : string) (mc1 : (string, (string, bool B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__197, dtb__198) -> (if ((B_dData_dPair.v_firstOf dtb__197) = mc0) then (B_dData_dMaybe.C_Maybe_Just ((B_dData_dPair.v_secondOf dtb__197))) else ((v_irSharedCtorShapeOf mc0) dtb__198))
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 449 "Vuna/Ir/Model.vuna"
let rec v_irSharedRecordFieldsOf = (fun (mc0 : string) (mc1 : (string, (int, string) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__199, dtb__200) -> (if ((B_dData_dPair.v_firstOf dtb__199) = mc0) then (B_dData_dPair.v_secondOf dtb__199) else ((v_irSharedRecordFieldsOf mc0) dtb__200))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 476 "Vuna/Ir/Model.vuna"
let v_irInlineArity = (fun (mc0 : string) -> (if (mc0 = "+") then 2 else (if (mc0 = "-") then 2 else (if (mc0 = "*") then 2 else (if (mc0 = "/") then 2 else (if (mc0 = "&&") then 2 else (if (mc0 = "||") then 2 else (if (mc0 = "bitAnd") then 2 else (if (mc0 = "bitOr") then 2 else (if (mc0 = "bitXor") then 2 else (if (mc0 = "bitNot") then 1 else (if (mc0 = "bitShl") then 2 else (if (mc0 = "bitShr") then 2 else (if (mc0 = "++") then 2 else (if (mc0 = "strLength") then 1 else (if (mc0 = "strAt") then 2 else (if (mc0 = "strFromInt") then 1 else (if (mc0 = "bi_eq_int") then 2 else (if (mc0 = "bi_neq_int") then 2 else (if (mc0 = "effectId") then 1 else (if (mc0 = "bi_eq_str") then 2 else (if (mc0 = "bi_neq_str") then 2 else (if (mc0 = "bi_lt_int") then 2 else (if (mc0 = "bi_le_int") then 2 else (if (mc0 = "bi_gt_int") then 2 else (if (mc0 = "bi_ge_int") then 2 else (if (mc0 = "bi_lt_str") then 2 else (if (mc0 = "bi_le_str") then 2 else (if (mc0 = "bi_gt_str") then 2 else (if (mc0 = "bi_ge_str") then 2 else (if (mc0 = "bi_lt_bool") then 2 else (if (mc0 = "bi_le_bool") then 2 else (if (mc0 = "bi_gt_bool") then 2 else (if (mc0 = "bi_ge_bool") then 2 else (if (mc0 = "bi_add_float") then 2 else (if (mc0 = "bi_sub_float") then 2 else (if (mc0 = "bi_mul_float") then 2 else (if (mc0 = "bi_div_float") then 2 else (if (mc0 = "bi_eq_float") then 2 else (if (mc0 = "bi_neq_float") then 2 else (if (mc0 = "bi_lt_float") then 2 else (if (mc0 = "bi_le_float") then 2 else (if (mc0 = "bi_gt_float") then 2 else (if (mc0 = "bi_ge_float") then 2 else (if (mc0 = "@ir@m@runEff") then 2 else (if (mc0 = "natToInt") then 1 else (if (mc0 = "natFromInt") then 1 else (if (mc0 = "natAdd") then 2 else (if (mc0 = "natSub") then 2 else (if (mc0 = "natMul") then 2 else (if (mc0 = "natDiv") then 2 else 0)))))))))))))))))))))))))))))))))))))))))))))))))))

# 530 "Vuna/Ir/Model.vuna"
let v_irListFamilyOf = (fun (mc0 : t_IrListFam) -> (match mc0 with
  | { f_IrListFam_irListFamily = dtb__201; f_IrListFam_irListNil = dtb__202; f_IrListFam_irListCons = dtb__203 } -> dtb__201
  | _ -> failwith "DT: impossible branch"
))

# 534 "Vuna/Ir/Model.vuna"
let v_irListNilOf = (fun (mc0 : t_IrListFam) -> (match mc0 with
  | { f_IrListFam_irListFamily = dtb__204; f_IrListFam_irListNil = dtb__205; f_IrListFam_irListCons = dtb__206 } -> dtb__205
  | _ -> failwith "DT: impossible branch"
))

# 538 "Vuna/Ir/Model.vuna"
let v_irListConsOf = (fun (mc0 : t_IrListFam) -> (match mc0 with
  | { f_IrListFam_irListFamily = dtb__207; f_IrListFam_irListNil = dtb__208; f_IrListFam_irListCons = dtb__209 } -> dtb__209
  | _ -> failwith "DT: impossible branch"
))

# 542 "Vuna/Ir/Model.vuna"
let v_irAltCtorOf = (fun (mc0 : t_IrAlt) -> (match mc0 with
  | { f_IrAlt_irAltCtor = dtb__210; f_IrAlt_irAltBinders = dtb__211; f_IrAlt_irAltBody = dtb__212 } -> dtb__210
  | _ -> failwith "DT: impossible branch"
))

# 546 "Vuna/Ir/Model.vuna"
let v_irAltBindersOf = (fun (mc0 : t_IrAlt) -> (match mc0 with
  | { f_IrAlt_irAltCtor = dtb__213; f_IrAlt_irAltBinders = dtb__214; f_IrAlt_irAltBody = dtb__215 } -> dtb__214
  | _ -> failwith "DT: impossible branch"
))

# 550 "Vuna/Ir/Model.vuna"
let v_irAltBodyOf = (fun (mc0 : t_IrAlt) -> (match mc0 with
  | { f_IrAlt_irAltCtor = dtb__216; f_IrAlt_irAltBinders = dtb__217; f_IrAlt_irAltBody = dtb__218 } -> dtb__218
  | _ -> failwith "DT: impossible branch"
))

# 583 "Vuna/Ir/Model.vuna"
let[@tail_mod_cons] rec v_altBodies = (fun (mc0 : t_IrAlt B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__219, dtb__220) -> (B_dData_dList.C_List__x58__x58_ ((v_irAltBodyOf dtb__219), (v_altBodies dtb__220)))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 587 "Vuna/Ir/Model.vuna"
let v_maybeAltBodies = (fun (mc0 : t_IrAlt B_dData_dMaybe.t_Maybe) -> (match mc0 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__221) -> (B_dData_dList.C_List__x58__x58_ ((v_irAltBodyOf dtb__221), B_dData_dList.C_List_Nil))
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 555 "Vuna/Ir/Model.vuna"
let v_irChildren = (fun (mc0 : t_Ir) -> (match mc0 with
  | C_Ir_IrEffBind (dtb__222, dtb__223, dtb__224) -> B_dData_dList.C_List_Nil
  | C_Ir_IrFloatLit (dtb__225) -> B_dData_dList.C_List_Nil
  | C_Ir_IrBool (dtb__226) -> B_dData_dList.C_List_Nil
  | C_Ir_IrStr (dtb__227) -> B_dData_dList.C_List_Nil
  | C_Ir_IrInt (dtb__228) -> B_dData_dList.C_List_Nil
  | C_Ir_IrRt (dtb__229) -> B_dData_dList.C_List_Nil
  | C_Ir_IrGlobal (dtb__230) -> B_dData_dList.C_List_Nil
  | C_Ir_IrVar (dtb__231) -> B_dData_dList.C_List_Nil
  | C_Ir_IrTail (dtb__232) -> (B_dData_dList.C_List__x58__x58_ (dtb__232, B_dData_dList.C_List_Nil))
  | C_Ir_IrEffThunk (dtb__233, dtb__234, dtb__235, dtb__236, dtb__237) -> (B_dData_dList.C_List__x58__x58_ (dtb__237, B_dData_dList.C_List_Nil))
  | C_Ir_IrConcatMany (dtb__238) -> dtb__238
  | C_Ir_IrNatCase (dtb__239, dtb__240, dtb__241, dtb__242, dtb__243) -> ((B_dData_dList.v_append (B_dData_dList.C_List__x58__x58_ (dtb__239, B_dData_dList.C_List_Nil))) ((B_dData_dList.v_append (v_maybeAltBodies dtb__241)) ((B_dData_dList.v_append (v_maybeAltBodies dtb__242)) (v_maybeAltBodies dtb__243))))
  | C_Ir_IrCase (dtb__244, dtb__245, dtb__246, dtb__247) -> (B_dData_dList.C_List__x58__x58_ (dtb__246, (v_altBodies dtb__247)))
  | C_Ir_IrIf (dtb__248, dtb__249, dtb__250) -> (B_dData_dList.C_List__x58__x58_ (dtb__248, (B_dData_dList.C_List__x58__x58_ (dtb__249, (B_dData_dList.C_List__x58__x58_ (dtb__250, B_dData_dList.C_List_Nil))))))
  | C_Ir_IrApp (dtb__251, dtb__252, dtb__253) -> (B_dData_dList.C_List__x58__x58_ (dtb__252, (B_dData_dList.C_List__x58__x58_ (dtb__253, B_dData_dList.C_List_Nil))))
  | C_Ir_IrLam (dtb__254, dtb__255, dtb__256) -> (B_dData_dList.C_List__x58__x58_ (dtb__256, B_dData_dList.C_List_Nil))
  | C_Ir_IrLet (dtb__257, dtb__258, dtb__259) -> (B_dData_dList.C_List__x58__x58_ (dtb__258, (B_dData_dList.C_List__x58__x58_ (dtb__259, B_dData_dList.C_List_Nil))))
  | C_Ir_IrCast (dtb__260, dtb__261, dtb__262) -> (B_dData_dList.C_List__x58__x58_ (dtb__262, B_dData_dList.C_List_Nil))
  | C_Ir_IrRtApp (dtb__263, dtb__264) -> dtb__264
  | C_Ir_IrRecUpd (dtb__265, dtb__266, dtb__267, dtb__268) -> (B_dData_dList.C_List__x58__x58_ (dtb__265, ((B_dData_dList.v_map B_dData_dPair.v_secondOf) dtb__267)))
  | C_Ir_IrProj (dtb__269, dtb__270, dtb__271, dtb__272) -> (B_dData_dList.C_List__x58__x58_ (dtb__269, B_dData_dList.C_List_Nil))
  | C_Ir_IrRecord (dtb__273, dtb__274, dtb__275) -> ((B_dData_dList.v_map B_dData_dPair.v_secondOf) dtb__275)
  | C_Ir_IrCtor (dtb__276, dtb__277, dtb__278, dtb__279) -> dtb__279
  | _ -> failwith "DT: impossible branch"
))

# 592 "Vuna/Ir/Model.vuna"
let v_irEntryShowOf = (fun (mc0 : t_IrEntry) -> (match mc0 with
  | { f_IrEntry_irEntryShow = dtb__280; f_IrEntry_irEntryMain = dtb__281; f_IrEntry_irEntryIsAction = dtb__282; f_IrEntry_irEntryRunMain = dtb__283; f_IrEntry_irEntryHandlers = dtb__284; f_IrEntry_irEntryRowTags = dtb__285 } -> dtb__280
  | _ -> failwith "DT: impossible branch"
))

# 596 "Vuna/Ir/Model.vuna"
let v_irEntryMainOf = (fun (mc0 : t_IrEntry) -> (match mc0 with
  | { f_IrEntry_irEntryShow = dtb__286; f_IrEntry_irEntryMain = dtb__287; f_IrEntry_irEntryIsAction = dtb__288; f_IrEntry_irEntryRunMain = dtb__289; f_IrEntry_irEntryHandlers = dtb__290; f_IrEntry_irEntryRowTags = dtb__291 } -> dtb__287
  | _ -> failwith "DT: impossible branch"
))

# 600 "Vuna/Ir/Model.vuna"
let v_irEntryIsActionOf = (fun (mc0 : t_IrEntry) -> (match mc0 with
  | { f_IrEntry_irEntryShow = dtb__292; f_IrEntry_irEntryMain = dtb__293; f_IrEntry_irEntryIsAction = dtb__294; f_IrEntry_irEntryRunMain = dtb__295; f_IrEntry_irEntryHandlers = dtb__296; f_IrEntry_irEntryRowTags = dtb__297 } -> dtb__294
  | _ -> failwith "DT: impossible branch"
))

# 604 "Vuna/Ir/Model.vuna"
let v_irEntryRunMainOf = (fun (mc0 : t_IrEntry) -> (match mc0 with
  | { f_IrEntry_irEntryShow = dtb__298; f_IrEntry_irEntryMain = dtb__299; f_IrEntry_irEntryIsAction = dtb__300; f_IrEntry_irEntryRunMain = dtb__301; f_IrEntry_irEntryHandlers = dtb__302; f_IrEntry_irEntryRowTags = dtb__303 } -> dtb__301
  | _ -> failwith "DT: impossible branch"
))

# 608 "Vuna/Ir/Model.vuna"
let v_irEntryHandlersOf = (fun (mc0 : t_IrEntry) -> (match mc0 with
  | { f_IrEntry_irEntryShow = dtb__304; f_IrEntry_irEntryMain = dtb__305; f_IrEntry_irEntryIsAction = dtb__306; f_IrEntry_irEntryRunMain = dtb__307; f_IrEntry_irEntryHandlers = dtb__308; f_IrEntry_irEntryRowTags = dtb__309 } -> dtb__308
  | _ -> failwith "DT: impossible branch"
))

# 612 "Vuna/Ir/Model.vuna"
let v_irEntryRowTagsOf = (fun (mc0 : t_IrEntry) -> (match mc0 with
  | { f_IrEntry_irEntryShow = dtb__310; f_IrEntry_irEntryMain = dtb__311; f_IrEntry_irEntryIsAction = dtb__312; f_IrEntry_irEntryRunMain = dtb__313; f_IrEntry_irEntryHandlers = dtb__314; f_IrEntry_irEntryRowTags = dtb__315 } -> dtb__315
  | _ -> failwith "DT: impossible branch"
))

# 616 "Vuna/Ir/Model.vuna"
let v_irProgSharedOf = (fun (mc0 : t_IrProgram) -> (match mc0 with
  | { f_IrProgram_irProgShared = dtb__316; f_IrProgram_irProgUnit = dtb__317 } -> dtb__316
  | _ -> failwith "DT: impossible branch"
))

# 620 "Vuna/Ir/Model.vuna"
let v_irProgUnitOf = (fun (mc0 : t_IrProgram) -> (match mc0 with
  | { f_IrProgram_irProgShared = dtb__318; f_IrProgram_irProgUnit = dtb__319 } -> dtb__319
  | _ -> failwith "DT: impossible branch"
))

# 627 "Vuna/Ir/Model.vuna"
let rec v_irSize = (fun (mc0 : t_Ir) -> (match mc0 with
  | C_Ir_IrTail (dtb__320) -> (v_irSize dtb__320)
  | _ -> (1 + (v_irSizeChildren mc0))
))
# 631 "Vuna/Ir/Model.vuna"
and v_irSizeChildren = (fun (mc0 : t_Ir) -> (match mc0 with
  | C_Ir_IrEffBind (dtb__321, dtb__322, dtb__323) -> 0
  | C_Ir_IrFloatLit (dtb__324) -> 0
  | C_Ir_IrBool (dtb__325) -> 0
  | C_Ir_IrStr (dtb__326) -> 0
  | C_Ir_IrInt (dtb__327) -> 0
  | C_Ir_IrRt (dtb__328) -> 0
  | C_Ir_IrGlobal (dtb__329) -> 0
  | C_Ir_IrVar (dtb__330) -> 0
  | C_Ir_IrEffThunk (dtb__331, dtb__332, dtb__333, dtb__334, dtb__335) -> (v_irSize dtb__335)
  | C_Ir_IrConcatMany (dtb__336) -> (v_irSizeList dtb__336)
  | C_Ir_IrNatCase (dtb__337, dtb__338, dtb__339, dtb__340, dtb__341) -> ((((v_irSize dtb__337) + (v_irSizeAlt dtb__339)) + (v_irSizeAlt dtb__340)) + (v_irSizeAlt dtb__341))
  | C_Ir_IrCase (dtb__342, dtb__343, dtb__344, dtb__345) -> ((v_irSize dtb__344) + (v_irSizeAlts dtb__345))
  | C_Ir_IrIf (dtb__346, dtb__347, dtb__348) -> (((v_irSize dtb__346) + (v_irSize dtb__347)) + (v_irSize dtb__348))
  | C_Ir_IrTail (dtb__349) -> (v_irSize dtb__349)
  | C_Ir_IrApp (dtb__350, dtb__351, dtb__352) -> ((v_irSize dtb__351) + (v_irSize dtb__352))
  | C_Ir_IrLam (dtb__353, dtb__354, dtb__355) -> (v_irSize dtb__355)
  | C_Ir_IrLet (dtb__356, dtb__357, dtb__358) -> ((v_irSize dtb__357) + (v_irSize dtb__358))
  | C_Ir_IrCast (dtb__359, dtb__360, dtb__361) -> (v_irSize dtb__361)
  | C_Ir_IrRtApp (dtb__362, dtb__363) -> (v_irSizeList dtb__363)
  | C_Ir_IrRecUpd (dtb__364, dtb__365, dtb__366, dtb__367) -> ((v_irSize dtb__364) + (v_irSizeFields dtb__366))
  | C_Ir_IrProj (dtb__368, dtb__369, dtb__370, dtb__371) -> (v_irSize dtb__368)
  | C_Ir_IrRecord (dtb__372, dtb__373, dtb__374) -> (v_irSizeFields dtb__374)
  | C_Ir_IrCtor (dtb__375, dtb__376, dtb__377, dtb__378) -> (v_irSizeList dtb__378)
  | _ -> failwith "DT: impossible branch"
))
# 657 "Vuna/Ir/Model.vuna"
and v_irSizeList = (fun (mc0 : t_Ir B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__379, dtb__380) -> ((v_irSize dtb__379) + (v_irSizeList dtb__380))
  | B_dData_dList.C_List_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))
# 661 "Vuna/Ir/Model.vuna"
and v_irSizeFields = (fun (mc0 : (string, t_Ir) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__381, dtb__382) -> (match dtb__381 with
  | { B_dData_dPair.f_Pair_first = dtb__383; B_dData_dPair.f_Pair_second = dtb__384 } -> ((v_irSize dtb__384) + (v_irSizeFields dtb__382))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))
# 665 "Vuna/Ir/Model.vuna"
and v_irSizeAlts = (fun (mc0 : t_IrAlt B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__385, dtb__386) -> ((v_irSize (v_irAltBodyOf dtb__385)) + (v_irSizeAlts dtb__386))
  | B_dData_dList.C_List_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))
# 669 "Vuna/Ir/Model.vuna"
and v_irSizeAlt = (fun (mc0 : t_IrAlt B_dData_dMaybe.t_Maybe) -> (match mc0 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__387) -> (v_irSize (v_irAltBodyOf dtb__387))
  | B_dData_dMaybe.C_Maybe_Nothing -> 0
  | _ -> failwith "DT: impossible branch"
))

# 121 "Vuna/Ir/Model.vuna"
let v_irBinderId = (fun (p : t_IrBinder) -> (match p with
  | { f_IrBinder_irBinderId = dtb__388; f_IrBinder_irBinderName = dtb__389; f_IrBinder_irBinderErased = dtb__390; f_IrBinder_irBinderTy = dtb__391 } -> dtb__388
  | _ -> failwith "DT: impossible branch"
))

# 122 "Vuna/Ir/Model.vuna"
let v_irBinderName = (fun (p : t_IrBinder) -> (match p with
  | { f_IrBinder_irBinderId = dtb__392; f_IrBinder_irBinderName = dtb__393; f_IrBinder_irBinderErased = dtb__394; f_IrBinder_irBinderTy = dtb__395 } -> dtb__393
  | _ -> failwith "DT: impossible branch"
))

# 124 "Vuna/Ir/Model.vuna"
let v_irBinderErased = (fun (p : t_IrBinder) -> (match p with
  | { f_IrBinder_irBinderId = dtb__396; f_IrBinder_irBinderName = dtb__397; f_IrBinder_irBinderErased = dtb__398; f_IrBinder_irBinderTy = dtb__399 } -> dtb__398
  | _ -> failwith "DT: impossible branch"
))

# 126 "Vuna/Ir/Model.vuna"
let v_irBinderTy = (fun (p : t_IrBinder) -> (match p with
  | { f_IrBinder_irBinderId = dtb__400; f_IrBinder_irBinderName = dtb__401; f_IrBinder_irBinderErased = dtb__402; f_IrBinder_irBinderTy = dtb__403 } -> dtb__403
  | _ -> failwith "DT: impossible branch"
))

# 168 "Vuna/Ir/Model.vuna"
let v_irAltCtor = (fun (p : t_IrAlt) -> (match p with
  | { f_IrAlt_irAltCtor = dtb__404; f_IrAlt_irAltBinders = dtb__405; f_IrAlt_irAltBody = dtb__406 } -> dtb__404
  | _ -> failwith "DT: impossible branch"
))

# 169 "Vuna/Ir/Model.vuna"
let v_irAltBinders = (fun (p : t_IrAlt) -> (match p with
  | { f_IrAlt_irAltCtor = dtb__407; f_IrAlt_irAltBinders = dtb__408; f_IrAlt_irAltBody = dtb__409 } -> dtb__408
  | _ -> failwith "DT: impossible branch"
))

# 170 "Vuna/Ir/Model.vuna"
let v_irAltBody = (fun (p : t_IrAlt) -> (match p with
  | { f_IrAlt_irAltCtor = dtb__410; f_IrAlt_irAltBinders = dtb__411; f_IrAlt_irAltBody = dtb__412 } -> dtb__412
  | _ -> failwith "DT: impossible branch"
))

# 369 "Vuna/Ir/Model.vuna"
let v_irGroupIsRec = (fun (p : t_IrGroup) -> (match p with
  | { f_IrGroup_irGroupIsRec = dtb__413; f_IrGroup_irGroupDefs = dtb__414 } -> dtb__413
  | _ -> failwith "DT: impossible branch"
))

# 370 "Vuna/Ir/Model.vuna"
let v_irGroupDefs = (fun (p : t_IrGroup) -> (match p with
  | { f_IrGroup_irGroupIsRec = dtb__415; f_IrGroup_irGroupDefs = dtb__416 } -> dtb__416
  | _ -> failwith "DT: impossible branch"
))

# 380 "Vuna/Ir/Model.vuna"
let v_irEntryShow = (fun (p : t_IrEntry) -> (match p with
  | { f_IrEntry_irEntryShow = dtb__417; f_IrEntry_irEntryMain = dtb__418; f_IrEntry_irEntryIsAction = dtb__419; f_IrEntry_irEntryRunMain = dtb__420; f_IrEntry_irEntryHandlers = dtb__421; f_IrEntry_irEntryRowTags = dtb__422 } -> dtb__417
  | _ -> failwith "DT: impossible branch"
))

# 382 "Vuna/Ir/Model.vuna"
let v_irEntryMain = (fun (p : t_IrEntry) -> (match p with
  | { f_IrEntry_irEntryShow = dtb__423; f_IrEntry_irEntryMain = dtb__424; f_IrEntry_irEntryIsAction = dtb__425; f_IrEntry_irEntryRunMain = dtb__426; f_IrEntry_irEntryHandlers = dtb__427; f_IrEntry_irEntryRowTags = dtb__428 } -> dtb__424
  | _ -> failwith "DT: impossible branch"
))

# 384 "Vuna/Ir/Model.vuna"
let v_irEntryIsAction = (fun (p : t_IrEntry) -> (match p with
  | { f_IrEntry_irEntryShow = dtb__429; f_IrEntry_irEntryMain = dtb__430; f_IrEntry_irEntryIsAction = dtb__431; f_IrEntry_irEntryRunMain = dtb__432; f_IrEntry_irEntryHandlers = dtb__433; f_IrEntry_irEntryRowTags = dtb__434 } -> dtb__431
  | _ -> failwith "DT: impossible branch"
))

# 386 "Vuna/Ir/Model.vuna"
let v_irEntryRunMain = (fun (p : t_IrEntry) -> (match p with
  | { f_IrEntry_irEntryShow = dtb__435; f_IrEntry_irEntryMain = dtb__436; f_IrEntry_irEntryIsAction = dtb__437; f_IrEntry_irEntryRunMain = dtb__438; f_IrEntry_irEntryHandlers = dtb__439; f_IrEntry_irEntryRowTags = dtb__440 } -> dtb__438
  | _ -> failwith "DT: impossible branch"
))

# 388 "Vuna/Ir/Model.vuna"
let v_irEntryHandlers = (fun (p : t_IrEntry) -> (match p with
  | { f_IrEntry_irEntryShow = dtb__441; f_IrEntry_irEntryMain = dtb__442; f_IrEntry_irEntryIsAction = dtb__443; f_IrEntry_irEntryRunMain = dtb__444; f_IrEntry_irEntryHandlers = dtb__445; f_IrEntry_irEntryRowTags = dtb__446 } -> dtb__445
  | _ -> failwith "DT: impossible branch"
))

# 390 "Vuna/Ir/Model.vuna"
let v_irEntryRowTags = (fun (p : t_IrEntry) -> (match p with
  | { f_IrEntry_irEntryShow = dtb__447; f_IrEntry_irEntryMain = dtb__448; f_IrEntry_irEntryIsAction = dtb__449; f_IrEntry_irEntryRunMain = dtb__450; f_IrEntry_irEntryHandlers = dtb__451; f_IrEntry_irEntryRowTags = dtb__452 } -> dtb__452
  | _ -> failwith "DT: impossible branch"
))

# 397 "Vuna/Ir/Model.vuna"
let v_irListFamily = (fun (p : t_IrListFam) -> (match p with
  | { f_IrListFam_irListFamily = dtb__453; f_IrListFam_irListNil = dtb__454; f_IrListFam_irListCons = dtb__455 } -> dtb__453
  | _ -> failwith "DT: impossible branch"
))

# 398 "Vuna/Ir/Model.vuna"
let v_irListNil = (fun (p : t_IrListFam) -> (match p with
  | { f_IrListFam_irListFamily = dtb__456; f_IrListFam_irListNil = dtb__457; f_IrListFam_irListCons = dtb__458 } -> dtb__457
  | _ -> failwith "DT: impossible branch"
))

# 399 "Vuna/Ir/Model.vuna"
let v_irListCons = (fun (p : t_IrListFam) -> (match p with
  | { f_IrListFam_irListFamily = dtb__459; f_IrListFam_irListNil = dtb__460; f_IrListFam_irListCons = dtb__461 } -> dtb__461
  | _ -> failwith "DT: impossible branch"
))

# 409 "Vuna/Ir/Model.vuna"
let v_irSharedRecordFields = (fun (p : t_IrShared) -> (match p with
  | { f_IrShared_irSharedRecordFields = dtb__462; f_IrShared_irSharedListFam = dtb__463; f_IrShared_irSharedUsesFloat = dtb__464; f_IrShared_irSharedUsesTrace = dtb__465; f_IrShared_irSharedUsesObs = dtb__466; f_IrShared_irSharedDefLocs = dtb__467; f_IrShared_irSharedUnboxed = dtb__468; f_IrShared_irSharedCtorShapes = dtb__469; f_IrShared_irSharedUsesHost = dtb__470; f_IrShared_irSharedUsesSched = dtb__471; f_IrShared_irSharedUsesEff = dtb__472 } -> dtb__462
  | _ -> failwith "DT: impossible branch"
))

# 411 "Vuna/Ir/Model.vuna"
let v_irSharedListFam = (fun (p : t_IrShared) -> (match p with
  | { f_IrShared_irSharedRecordFields = dtb__473; f_IrShared_irSharedListFam = dtb__474; f_IrShared_irSharedUsesFloat = dtb__475; f_IrShared_irSharedUsesTrace = dtb__476; f_IrShared_irSharedUsesObs = dtb__477; f_IrShared_irSharedDefLocs = dtb__478; f_IrShared_irSharedUnboxed = dtb__479; f_IrShared_irSharedCtorShapes = dtb__480; f_IrShared_irSharedUsesHost = dtb__481; f_IrShared_irSharedUsesSched = dtb__482; f_IrShared_irSharedUsesEff = dtb__483 } -> dtb__474
  | _ -> failwith "DT: impossible branch"
))

# 413 "Vuna/Ir/Model.vuna"
let v_irSharedUsesFloat = (fun (p : t_IrShared) -> (match p with
  | { f_IrShared_irSharedRecordFields = dtb__484; f_IrShared_irSharedListFam = dtb__485; f_IrShared_irSharedUsesFloat = dtb__486; f_IrShared_irSharedUsesTrace = dtb__487; f_IrShared_irSharedUsesObs = dtb__488; f_IrShared_irSharedDefLocs = dtb__489; f_IrShared_irSharedUnboxed = dtb__490; f_IrShared_irSharedCtorShapes = dtb__491; f_IrShared_irSharedUsesHost = dtb__492; f_IrShared_irSharedUsesSched = dtb__493; f_IrShared_irSharedUsesEff = dtb__494 } -> dtb__486
  | _ -> failwith "DT: impossible branch"
))

# 415 "Vuna/Ir/Model.vuna"
let v_irSharedUsesTrace = (fun (p : t_IrShared) -> (match p with
  | { f_IrShared_irSharedRecordFields = dtb__495; f_IrShared_irSharedListFam = dtb__496; f_IrShared_irSharedUsesFloat = dtb__497; f_IrShared_irSharedUsesTrace = dtb__498; f_IrShared_irSharedUsesObs = dtb__499; f_IrShared_irSharedDefLocs = dtb__500; f_IrShared_irSharedUnboxed = dtb__501; f_IrShared_irSharedCtorShapes = dtb__502; f_IrShared_irSharedUsesHost = dtb__503; f_IrShared_irSharedUsesSched = dtb__504; f_IrShared_irSharedUsesEff = dtb__505 } -> dtb__498
  | _ -> failwith "DT: impossible branch"
))

# 418 "Vuna/Ir/Model.vuna"
let v_irSharedUsesObs = (fun (p : t_IrShared) -> (match p with
  | { f_IrShared_irSharedRecordFields = dtb__506; f_IrShared_irSharedListFam = dtb__507; f_IrShared_irSharedUsesFloat = dtb__508; f_IrShared_irSharedUsesTrace = dtb__509; f_IrShared_irSharedUsesObs = dtb__510; f_IrShared_irSharedDefLocs = dtb__511; f_IrShared_irSharedUnboxed = dtb__512; f_IrShared_irSharedCtorShapes = dtb__513; f_IrShared_irSharedUsesHost = dtb__514; f_IrShared_irSharedUsesSched = dtb__515; f_IrShared_irSharedUsesEff = dtb__516 } -> dtb__510
  | _ -> failwith "DT: impossible branch"
))

# 421 "Vuna/Ir/Model.vuna"
let v_irSharedDefLocs = (fun (p : t_IrShared) -> (match p with
  | { f_IrShared_irSharedRecordFields = dtb__517; f_IrShared_irSharedListFam = dtb__518; f_IrShared_irSharedUsesFloat = dtb__519; f_IrShared_irSharedUsesTrace = dtb__520; f_IrShared_irSharedUsesObs = dtb__521; f_IrShared_irSharedDefLocs = dtb__522; f_IrShared_irSharedUnboxed = dtb__523; f_IrShared_irSharedCtorShapes = dtb__524; f_IrShared_irSharedUsesHost = dtb__525; f_IrShared_irSharedUsesSched = dtb__526; f_IrShared_irSharedUsesEff = dtb__527 } -> dtb__522
  | _ -> failwith "DT: impossible branch"
))

# 423 "Vuna/Ir/Model.vuna"
let v_irSharedUnboxed = (fun (p : t_IrShared) -> (match p with
  | { f_IrShared_irSharedRecordFields = dtb__528; f_IrShared_irSharedListFam = dtb__529; f_IrShared_irSharedUsesFloat = dtb__530; f_IrShared_irSharedUsesTrace = dtb__531; f_IrShared_irSharedUsesObs = dtb__532; f_IrShared_irSharedDefLocs = dtb__533; f_IrShared_irSharedUnboxed = dtb__534; f_IrShared_irSharedCtorShapes = dtb__535; f_IrShared_irSharedUsesHost = dtb__536; f_IrShared_irSharedUsesSched = dtb__537; f_IrShared_irSharedUsesEff = dtb__538 } -> dtb__534
  | _ -> failwith "DT: impossible branch"
))

# 426 "Vuna/Ir/Model.vuna"
let v_irSharedCtorShapes = (fun (p : t_IrShared) -> (match p with
  | { f_IrShared_irSharedRecordFields = dtb__539; f_IrShared_irSharedListFam = dtb__540; f_IrShared_irSharedUsesFloat = dtb__541; f_IrShared_irSharedUsesTrace = dtb__542; f_IrShared_irSharedUsesObs = dtb__543; f_IrShared_irSharedDefLocs = dtb__544; f_IrShared_irSharedUnboxed = dtb__545; f_IrShared_irSharedCtorShapes = dtb__546; f_IrShared_irSharedUsesHost = dtb__547; f_IrShared_irSharedUsesSched = dtb__548; f_IrShared_irSharedUsesEff = dtb__549 } -> dtb__546
  | _ -> failwith "DT: impossible branch"
))

# 429 "Vuna/Ir/Model.vuna"
let v_irSharedUsesHost = (fun (p : t_IrShared) -> (match p with
  | { f_IrShared_irSharedRecordFields = dtb__550; f_IrShared_irSharedListFam = dtb__551; f_IrShared_irSharedUsesFloat = dtb__552; f_IrShared_irSharedUsesTrace = dtb__553; f_IrShared_irSharedUsesObs = dtb__554; f_IrShared_irSharedDefLocs = dtb__555; f_IrShared_irSharedUnboxed = dtb__556; f_IrShared_irSharedCtorShapes = dtb__557; f_IrShared_irSharedUsesHost = dtb__558; f_IrShared_irSharedUsesSched = dtb__559; f_IrShared_irSharedUsesEff = dtb__560 } -> dtb__558
  | _ -> failwith "DT: impossible branch"
))

# 432 "Vuna/Ir/Model.vuna"
let v_irSharedUsesSched = (fun (p : t_IrShared) -> (match p with
  | { f_IrShared_irSharedRecordFields = dtb__561; f_IrShared_irSharedListFam = dtb__562; f_IrShared_irSharedUsesFloat = dtb__563; f_IrShared_irSharedUsesTrace = dtb__564; f_IrShared_irSharedUsesObs = dtb__565; f_IrShared_irSharedDefLocs = dtb__566; f_IrShared_irSharedUnboxed = dtb__567; f_IrShared_irSharedCtorShapes = dtb__568; f_IrShared_irSharedUsesHost = dtb__569; f_IrShared_irSharedUsesSched = dtb__570; f_IrShared_irSharedUsesEff = dtb__571 } -> dtb__570
  | _ -> failwith "DT: impossible branch"
))

# 436 "Vuna/Ir/Model.vuna"
let v_irSharedUsesEff = (fun (p : t_IrShared) -> (match p with
  | { f_IrShared_irSharedRecordFields = dtb__572; f_IrShared_irSharedListFam = dtb__573; f_IrShared_irSharedUsesFloat = dtb__574; f_IrShared_irSharedUsesTrace = dtb__575; f_IrShared_irSharedUsesObs = dtb__576; f_IrShared_irSharedDefLocs = dtb__577; f_IrShared_irSharedUnboxed = dtb__578; f_IrShared_irSharedCtorShapes = dtb__579; f_IrShared_irSharedUsesHost = dtb__580; f_IrShared_irSharedUsesSched = dtb__581; f_IrShared_irSharedUsesEff = dtb__582 } -> dtb__582
  | _ -> failwith "DT: impossible branch"
))

# 456 "Vuna/Ir/Model.vuna"
let v_irUnitTyDecls = (fun (p : t_IrUnit) -> (match p with
  | { f_IrUnit_irUnitTyDecls = dtb__583; f_IrUnit_irUnitGroups = dtb__584; f_IrUnit_irUnitHasListFamily = dtb__585; f_IrUnit_irUnitTypeRefs = dtb__586; f_IrUnit_irUnitEntry = dtb__587 } -> dtb__583
  | _ -> failwith "DT: impossible branch"
))

# 458 "Vuna/Ir/Model.vuna"
let v_irUnitGroups = (fun (p : t_IrUnit) -> (match p with
  | { f_IrUnit_irUnitTyDecls = dtb__588; f_IrUnit_irUnitGroups = dtb__589; f_IrUnit_irUnitHasListFamily = dtb__590; f_IrUnit_irUnitTypeRefs = dtb__591; f_IrUnit_irUnitEntry = dtb__592 } -> dtb__589
  | _ -> failwith "DT: impossible branch"
))

# 460 "Vuna/Ir/Model.vuna"
let v_irUnitHasListFamily = (fun (p : t_IrUnit) -> (match p with
  | { f_IrUnit_irUnitTyDecls = dtb__593; f_IrUnit_irUnitGroups = dtb__594; f_IrUnit_irUnitHasListFamily = dtb__595; f_IrUnit_irUnitTypeRefs = dtb__596; f_IrUnit_irUnitEntry = dtb__597 } -> dtb__595
  | _ -> failwith "DT: impossible branch"
))

# 462 "Vuna/Ir/Model.vuna"
let v_irUnitTypeRefs = (fun (p : t_IrUnit) -> (match p with
  | { f_IrUnit_irUnitTyDecls = dtb__598; f_IrUnit_irUnitGroups = dtb__599; f_IrUnit_irUnitHasListFamily = dtb__600; f_IrUnit_irUnitTypeRefs = dtb__601; f_IrUnit_irUnitEntry = dtb__602 } -> dtb__601
  | _ -> failwith "DT: impossible branch"
))

# 464 "Vuna/Ir/Model.vuna"
let v_irUnitEntry = (fun (p : t_IrUnit) -> (match p with
  | { f_IrUnit_irUnitTyDecls = dtb__603; f_IrUnit_irUnitGroups = dtb__604; f_IrUnit_irUnitHasListFamily = dtb__605; f_IrUnit_irUnitTypeRefs = dtb__606; f_IrUnit_irUnitEntry = dtb__607 } -> dtb__607
  | _ -> failwith "DT: impossible branch"
))

# 468 "Vuna/Ir/Model.vuna"
let v_irProgShared = (fun (p : t_IrProgram) -> (match p with
  | { f_IrProgram_irProgShared = dtb__608; f_IrProgram_irProgUnit = dtb__609 } -> dtb__608
  | _ -> failwith "DT: impossible branch"
))

# 469 "Vuna/Ir/Model.vuna"
let v_irProgUnit = (fun (p : t_IrProgram) -> (match p with
  | { f_IrProgram_irProgShared = dtb__610; f_IrProgram_irProgUnit = dtb__611 } -> dtb__611
  | _ -> failwith "DT: impossible branch"
))
