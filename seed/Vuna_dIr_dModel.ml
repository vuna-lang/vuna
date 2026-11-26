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

# 272 "Vuna/Ir/Model.vuna"
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
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)))

# 237 "Vuna/Ir/Model.vuna"
let v_irResultTyOf = (fun (ir : t_Ir) -> ((v_irResultTyFuel 256) ir))

# 291 "Vuna/Ir/Model.vuna"
let v_irEffTypeName = "Base.Effect.Core.Eff"

# 294 "Vuna/Ir/Model.vuna"
let v_irEffMkCtor = "Base.Effect.Core.Eff.MkEff"

# 324 "Vuna/Ir/Model.vuna"
let v_irDefName = (fun (mc0 : t_IrDef) -> (match mc0 with
  | C_IrDef_IrExternDef (dtb__66, dtb__67, dtb__68, dtb__69) -> dtb__66
  | C_IrDef_IrDef (dtb__70, dtb__71, dtb__72, dtb__73, dtb__74, dtb__75, dtb__76, dtb__77) -> dtb__70
  | _ -> failwith "DT: impossible branch"
))

# 328 "Vuna/Ir/Model.vuna"
let v_irDefArity = (fun (mc0 : t_IrDef) -> (match mc0 with
  | C_IrDef_IrExternDef (dtb__78, dtb__79, dtb__80, dtb__81) -> 0
  | C_IrDef_IrDef (dtb__82, dtb__83, dtb__84, dtb__85, dtb__86, dtb__87, dtb__88, dtb__89) -> dtb__83
  | _ -> failwith "DT: impossible branch"
))

# 332 "Vuna/Ir/Model.vuna"
let v_irDefDeps = (fun (mc0 : t_IrDef) -> (match mc0 with
  | C_IrDef_IrExternDef (dtb__90, dtb__91, dtb__92, dtb__93) -> B_dData_dList.C_List_Nil
  | C_IrDef_IrDef (dtb__94, dtb__95, dtb__96, dtb__97, dtb__98, dtb__99, dtb__100, dtb__101) -> dtb__96
  | _ -> failwith "DT: impossible branch"
))

# 336 "Vuna/Ir/Model.vuna"
let v_irDefTy = (fun (mc0 : t_IrDef) -> (match mc0 with
  | C_IrDef_IrExternDef (dtb__102, dtb__103, dtb__104, dtb__105) -> (B_dData_dMaybe.C_Maybe_Just (dtb__103))
  | C_IrDef_IrDef (dtb__106, dtb__107, dtb__108, dtb__109, dtb__110, dtb__111, dtb__112, dtb__113) -> dtb__109
  | _ -> failwith "DT: impossible branch"
))

# 340 "Vuna/Ir/Model.vuna"
let v_irDefBody = (fun (mc0 : t_IrDef) -> (match mc0 with
  | C_IrDef_IrExternDef (dtb__114, dtb__115, dtb__116, dtb__117) -> B_dData_dMaybe.C_Maybe_Nothing
  | C_IrDef_IrDef (dtb__118, dtb__119, dtb__120, dtb__121, dtb__122, dtb__123, dtb__124, dtb__125) -> (B_dData_dMaybe.C_Maybe_Just (dtb__122))
  | _ -> failwith "DT: impossible branch"
))

# 344 "Vuna/Ir/Model.vuna"
let v_irDefExtern = (fun (mc0 : t_IrDef) -> (match mc0 with
  | C_IrDef_IrExternDef (dtb__126, dtb__127, dtb__128, dtb__129) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = dtb__127; B_dData_dPair.f_Pair_second = dtb__128 }))
  | C_IrDef_IrDef (dtb__130, dtb__131, dtb__132, dtb__133, dtb__134, dtb__135, dtb__136, dtb__137) -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 349 "Vuna/Ir/Model.vuna"
let v_irDefRecValueOk = (fun (mc0 : t_IrDef) -> (match mc0 with
  | C_IrDef_IrExternDef (dtb__138, dtb__139, dtb__140, dtb__141) -> true
  | C_IrDef_IrDef (dtb__142, dtb__143, dtb__144, dtb__145, dtb__146, dtb__147, dtb__148, dtb__149) -> dtb__147
  | _ -> failwith "DT: impossible branch"
))

# 354 "Vuna/Ir/Model.vuna"
let v_irDefInitGuard = (fun (mc0 : t_IrDef) -> (match mc0 with
  | C_IrDef_IrExternDef (dtb__150, dtb__151, dtb__152, dtb__153) -> false
  | C_IrDef_IrDef (dtb__154, dtb__155, dtb__156, dtb__157, dtb__158, dtb__159, dtb__160, dtb__161) -> dtb__160
  | _ -> failwith "DT: impossible branch"
))

# 358 "Vuna/Ir/Model.vuna"
let v_irDefSpan = (fun (mc0 : t_IrDef) -> (match mc0 with
  | C_IrDef_IrExternDef (dtb__162, dtb__163, dtb__164, dtb__165) -> dtb__165
  | C_IrDef_IrDef (dtb__166, dtb__167, dtb__168, dtb__169, dtb__170, dtb__171, dtb__172, dtb__173) -> dtb__173
  | _ -> failwith "DT: impossible branch"
))

# 433 "Vuna/Ir/Model.vuna"
let rec v_irSharedUnboxedOf = (fun (mc0 : string) (mc1 : (string, (string, int) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__174, dtb__175) -> (if ((B_dData_dPair.v_firstOf dtb__174) = mc0) then (B_dData_dMaybe.C_Maybe_Just ((B_dData_dPair.v_secondOf dtb__174))) else ((v_irSharedUnboxedOf mc0) dtb__175))
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 438 "Vuna/Ir/Model.vuna"
let rec v_irSharedCtorShapeOf = (fun (mc0 : string) (mc1 : (string, (string, bool B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__176, dtb__177) -> (if ((B_dData_dPair.v_firstOf dtb__176) = mc0) then (B_dData_dMaybe.C_Maybe_Just ((B_dData_dPair.v_secondOf dtb__176))) else ((v_irSharedCtorShapeOf mc0) dtb__177))
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 443 "Vuna/Ir/Model.vuna"
let rec v_irSharedRecordFieldsOf = (fun (mc0 : string) (mc1 : (string, (int, string) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__178, dtb__179) -> (if ((B_dData_dPair.v_firstOf dtb__178) = mc0) then (B_dData_dPair.v_secondOf dtb__178) else ((v_irSharedRecordFieldsOf mc0) dtb__179))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 470 "Vuna/Ir/Model.vuna"
let v_irInlineArity = (fun (mc0 : string) -> (if (mc0 = "+") then 2 else (if (mc0 = "-") then 2 else (if (mc0 = "*") then 2 else (if (mc0 = "/") then 2 else (if (mc0 = "&&") then 2 else (if (mc0 = "||") then 2 else (if (mc0 = "bitAnd") then 2 else (if (mc0 = "bitOr") then 2 else (if (mc0 = "bitXor") then 2 else (if (mc0 = "bitNot") then 1 else (if (mc0 = "bitShl") then 2 else (if (mc0 = "bitShr") then 2 else (if (mc0 = "++") then 2 else (if (mc0 = "strLength") then 1 else (if (mc0 = "strAt") then 2 else (if (mc0 = "strFromInt") then 1 else (if (mc0 = "bi_eq_int") then 2 else (if (mc0 = "bi_neq_int") then 2 else (if (mc0 = "effectId") then 1 else (if (mc0 = "bi_eq_str") then 2 else (if (mc0 = "bi_neq_str") then 2 else (if (mc0 = "bi_lt_int") then 2 else (if (mc0 = "bi_le_int") then 2 else (if (mc0 = "bi_gt_int") then 2 else (if (mc0 = "bi_ge_int") then 2 else (if (mc0 = "bi_lt_str") then 2 else (if (mc0 = "bi_le_str") then 2 else (if (mc0 = "bi_gt_str") then 2 else (if (mc0 = "bi_ge_str") then 2 else (if (mc0 = "bi_lt_bool") then 2 else (if (mc0 = "bi_le_bool") then 2 else (if (mc0 = "bi_gt_bool") then 2 else (if (mc0 = "bi_ge_bool") then 2 else (if (mc0 = "bi_add_float") then 2 else (if (mc0 = "bi_sub_float") then 2 else (if (mc0 = "bi_mul_float") then 2 else (if (mc0 = "bi_div_float") then 2 else (if (mc0 = "bi_eq_float") then 2 else (if (mc0 = "bi_neq_float") then 2 else (if (mc0 = "bi_lt_float") then 2 else (if (mc0 = "bi_le_float") then 2 else (if (mc0 = "bi_gt_float") then 2 else (if (mc0 = "bi_ge_float") then 2 else (if (mc0 = "@ir@m@runEff") then 2 else (if (mc0 = "natToInt") then 1 else (if (mc0 = "natFromInt") then 1 else (if (mc0 = "natAdd") then 2 else (if (mc0 = "natSub") then 2 else (if (mc0 = "natMul") then 2 else (if (mc0 = "natDiv") then 2 else 0)))))))))))))))))))))))))))))))))))))))))))))))))))

# 524 "Vuna/Ir/Model.vuna"
let v_irListFamilyOf = (fun (mc0 : t_IrListFam) -> (match mc0 with
  | { f_IrListFam_irListFamily = dtb__180; f_IrListFam_irListNil = dtb__181; f_IrListFam_irListCons = dtb__182 } -> dtb__180
  | _ -> failwith "DT: impossible branch"
))

# 528 "Vuna/Ir/Model.vuna"
let v_irListNilOf = (fun (mc0 : t_IrListFam) -> (match mc0 with
  | { f_IrListFam_irListFamily = dtb__183; f_IrListFam_irListNil = dtb__184; f_IrListFam_irListCons = dtb__185 } -> dtb__184
  | _ -> failwith "DT: impossible branch"
))

# 532 "Vuna/Ir/Model.vuna"
let v_irListConsOf = (fun (mc0 : t_IrListFam) -> (match mc0 with
  | { f_IrListFam_irListFamily = dtb__186; f_IrListFam_irListNil = dtb__187; f_IrListFam_irListCons = dtb__188 } -> dtb__188
  | _ -> failwith "DT: impossible branch"
))

# 536 "Vuna/Ir/Model.vuna"
let v_irAltCtorOf = (fun (mc0 : t_IrAlt) -> (match mc0 with
  | { f_IrAlt_irAltCtor = dtb__189; f_IrAlt_irAltBinders = dtb__190; f_IrAlt_irAltBody = dtb__191 } -> dtb__189
  | _ -> failwith "DT: impossible branch"
))

# 540 "Vuna/Ir/Model.vuna"
let v_irAltBindersOf = (fun (mc0 : t_IrAlt) -> (match mc0 with
  | { f_IrAlt_irAltCtor = dtb__192; f_IrAlt_irAltBinders = dtb__193; f_IrAlt_irAltBody = dtb__194 } -> dtb__193
  | _ -> failwith "DT: impossible branch"
))

# 544 "Vuna/Ir/Model.vuna"
let v_irAltBodyOf = (fun (mc0 : t_IrAlt) -> (match mc0 with
  | { f_IrAlt_irAltCtor = dtb__195; f_IrAlt_irAltBinders = dtb__196; f_IrAlt_irAltBody = dtb__197 } -> dtb__197
  | _ -> failwith "DT: impossible branch"
))

# 570 "Vuna/Ir/Model.vuna"
let[@tail_mod_cons] rec v_altBodies = (fun (mc0 : t_IrAlt B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__198, dtb__199) -> (B_dData_dList.C_List__x58__x58_ ((v_irAltBodyOf dtb__198), (v_altBodies dtb__199)))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 574 "Vuna/Ir/Model.vuna"
let v_maybeAltBodies = (fun (mc0 : t_IrAlt B_dData_dMaybe.t_Maybe) -> (match mc0 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__200) -> (B_dData_dList.C_List__x58__x58_ ((v_irAltBodyOf dtb__200), B_dData_dList.C_List_Nil))
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 549 "Vuna/Ir/Model.vuna"
let v_irChildren = (fun (mc0 : t_Ir) -> (match mc0 with
  | C_Ir_IrTail (dtb__201) -> (B_dData_dList.C_List__x58__x58_ (dtb__201, B_dData_dList.C_List_Nil))
  | C_Ir_IrEffThunk (dtb__202, dtb__203, dtb__204, dtb__205, dtb__206) -> (B_dData_dList.C_List__x58__x58_ (dtb__206, B_dData_dList.C_List_Nil))
  | C_Ir_IrConcatMany (dtb__207) -> dtb__207
  | C_Ir_IrNatCase (dtb__208, dtb__209, dtb__210, dtb__211, dtb__212) -> ((B_dData_dList.v_append (B_dData_dList.C_List__x58__x58_ (dtb__208, B_dData_dList.C_List_Nil))) ((B_dData_dList.v_append (v_maybeAltBodies dtb__210)) ((B_dData_dList.v_append (v_maybeAltBodies dtb__211)) (v_maybeAltBodies dtb__212))))
  | C_Ir_IrCase (dtb__213, dtb__214, dtb__215, dtb__216) -> (B_dData_dList.C_List__x58__x58_ (dtb__215, (v_altBodies dtb__216)))
  | C_Ir_IrIf (dtb__217, dtb__218, dtb__219) -> (B_dData_dList.C_List__x58__x58_ (dtb__217, (B_dData_dList.C_List__x58__x58_ (dtb__218, (B_dData_dList.C_List__x58__x58_ (dtb__219, B_dData_dList.C_List_Nil))))))
  | C_Ir_IrApp (dtb__220, dtb__221, dtb__222) -> (B_dData_dList.C_List__x58__x58_ (dtb__221, (B_dData_dList.C_List__x58__x58_ (dtb__222, B_dData_dList.C_List_Nil))))
  | C_Ir_IrLam (dtb__223, dtb__224, dtb__225) -> (B_dData_dList.C_List__x58__x58_ (dtb__225, B_dData_dList.C_List_Nil))
  | C_Ir_IrLet (dtb__226, dtb__227, dtb__228) -> (B_dData_dList.C_List__x58__x58_ (dtb__227, (B_dData_dList.C_List__x58__x58_ (dtb__228, B_dData_dList.C_List_Nil))))
  | C_Ir_IrCast (dtb__229, dtb__230, dtb__231) -> (B_dData_dList.C_List__x58__x58_ (dtb__231, B_dData_dList.C_List_Nil))
  | C_Ir_IrRtApp (dtb__232, dtb__233) -> dtb__233
  | C_Ir_IrRecUpd (dtb__234, dtb__235, dtb__236, dtb__237) -> (B_dData_dList.C_List__x58__x58_ (dtb__234, ((B_dData_dList.v_map B_dData_dPair.v_secondOf) dtb__236)))
  | C_Ir_IrProj (dtb__238, dtb__239, dtb__240, dtb__241) -> (B_dData_dList.C_List__x58__x58_ (dtb__238, B_dData_dList.C_List_Nil))
  | C_Ir_IrRecord (dtb__242, dtb__243, dtb__244) -> ((B_dData_dList.v_map B_dData_dPair.v_secondOf) dtb__244)
  | C_Ir_IrCtor (dtb__245, dtb__246, dtb__247, dtb__248) -> dtb__248
  | _ -> B_dData_dList.C_List_Nil
))

# 579 "Vuna/Ir/Model.vuna"
let v_irEntryShowOf = (fun (mc0 : t_IrEntry) -> (match mc0 with
  | { f_IrEntry_irEntryShow = dtb__249; f_IrEntry_irEntryMain = dtb__250; f_IrEntry_irEntryIsAction = dtb__251; f_IrEntry_irEntryRunMain = dtb__252; f_IrEntry_irEntryHandlers = dtb__253; f_IrEntry_irEntryRowTags = dtb__254 } -> dtb__249
  | _ -> failwith "DT: impossible branch"
))

# 583 "Vuna/Ir/Model.vuna"
let v_irEntryMainOf = (fun (mc0 : t_IrEntry) -> (match mc0 with
  | { f_IrEntry_irEntryShow = dtb__255; f_IrEntry_irEntryMain = dtb__256; f_IrEntry_irEntryIsAction = dtb__257; f_IrEntry_irEntryRunMain = dtb__258; f_IrEntry_irEntryHandlers = dtb__259; f_IrEntry_irEntryRowTags = dtb__260 } -> dtb__256
  | _ -> failwith "DT: impossible branch"
))

# 587 "Vuna/Ir/Model.vuna"
let v_irEntryIsActionOf = (fun (mc0 : t_IrEntry) -> (match mc0 with
  | { f_IrEntry_irEntryShow = dtb__261; f_IrEntry_irEntryMain = dtb__262; f_IrEntry_irEntryIsAction = dtb__263; f_IrEntry_irEntryRunMain = dtb__264; f_IrEntry_irEntryHandlers = dtb__265; f_IrEntry_irEntryRowTags = dtb__266 } -> dtb__263
  | _ -> failwith "DT: impossible branch"
))

# 591 "Vuna/Ir/Model.vuna"
let v_irEntryRunMainOf = (fun (mc0 : t_IrEntry) -> (match mc0 with
  | { f_IrEntry_irEntryShow = dtb__267; f_IrEntry_irEntryMain = dtb__268; f_IrEntry_irEntryIsAction = dtb__269; f_IrEntry_irEntryRunMain = dtb__270; f_IrEntry_irEntryHandlers = dtb__271; f_IrEntry_irEntryRowTags = dtb__272 } -> dtb__270
  | _ -> failwith "DT: impossible branch"
))

# 595 "Vuna/Ir/Model.vuna"
let v_irEntryHandlersOf = (fun (mc0 : t_IrEntry) -> (match mc0 with
  | { f_IrEntry_irEntryShow = dtb__273; f_IrEntry_irEntryMain = dtb__274; f_IrEntry_irEntryIsAction = dtb__275; f_IrEntry_irEntryRunMain = dtb__276; f_IrEntry_irEntryHandlers = dtb__277; f_IrEntry_irEntryRowTags = dtb__278 } -> dtb__277
  | _ -> failwith "DT: impossible branch"
))

# 599 "Vuna/Ir/Model.vuna"
let v_irEntryRowTagsOf = (fun (mc0 : t_IrEntry) -> (match mc0 with
  | { f_IrEntry_irEntryShow = dtb__279; f_IrEntry_irEntryMain = dtb__280; f_IrEntry_irEntryIsAction = dtb__281; f_IrEntry_irEntryRunMain = dtb__282; f_IrEntry_irEntryHandlers = dtb__283; f_IrEntry_irEntryRowTags = dtb__284 } -> dtb__284
  | _ -> failwith "DT: impossible branch"
))

# 603 "Vuna/Ir/Model.vuna"
let v_irProgSharedOf = (fun (mc0 : t_IrProgram) -> (match mc0 with
  | { f_IrProgram_irProgShared = dtb__285; f_IrProgram_irProgUnit = dtb__286 } -> dtb__285
  | _ -> failwith "DT: impossible branch"
))

# 607 "Vuna/Ir/Model.vuna"
let v_irProgUnitOf = (fun (mc0 : t_IrProgram) -> (match mc0 with
  | { f_IrProgram_irProgShared = dtb__287; f_IrProgram_irProgUnit = dtb__288 } -> dtb__288
  | _ -> failwith "DT: impossible branch"
))

# 614 "Vuna/Ir/Model.vuna"
let rec v_irSize = (fun (mc0 : t_Ir) -> (match mc0 with
  | C_Ir_IrTail (dtb__289) -> (v_irSize dtb__289)
  | _ -> (1 + (v_irSizeChildren mc0))
))
# 618 "Vuna/Ir/Model.vuna"
and v_irSizeChildren = (fun (mc0 : t_Ir) -> (match mc0 with
  | C_Ir_IrEffThunk (dtb__290, dtb__291, dtb__292, dtb__293, dtb__294) -> (v_irSize dtb__294)
  | C_Ir_IrConcatMany (dtb__295) -> (v_irSizeList dtb__295)
  | C_Ir_IrNatCase (dtb__296, dtb__297, dtb__298, dtb__299, dtb__300) -> ((((v_irSize dtb__296) + (v_irSizeAlt dtb__298)) + (v_irSizeAlt dtb__299)) + (v_irSizeAlt dtb__300))
  | C_Ir_IrCase (dtb__301, dtb__302, dtb__303, dtb__304) -> ((v_irSize dtb__303) + (v_irSizeAlts dtb__304))
  | C_Ir_IrIf (dtb__305, dtb__306, dtb__307) -> (((v_irSize dtb__305) + (v_irSize dtb__306)) + (v_irSize dtb__307))
  | C_Ir_IrTail (dtb__308) -> (v_irSize dtb__308)
  | C_Ir_IrApp (dtb__309, dtb__310, dtb__311) -> ((v_irSize dtb__310) + (v_irSize dtb__311))
  | C_Ir_IrLam (dtb__312, dtb__313, dtb__314) -> (v_irSize dtb__314)
  | C_Ir_IrLet (dtb__315, dtb__316, dtb__317) -> ((v_irSize dtb__316) + (v_irSize dtb__317))
  | C_Ir_IrCast (dtb__318, dtb__319, dtb__320) -> (v_irSize dtb__320)
  | C_Ir_IrRtApp (dtb__321, dtb__322) -> (v_irSizeList dtb__322)
  | C_Ir_IrRecUpd (dtb__323, dtb__324, dtb__325, dtb__326) -> ((v_irSize dtb__323) + (v_irSizeFields dtb__325))
  | C_Ir_IrProj (dtb__327, dtb__328, dtb__329, dtb__330) -> (v_irSize dtb__327)
  | C_Ir_IrRecord (dtb__331, dtb__332, dtb__333) -> (v_irSizeFields dtb__333)
  | C_Ir_IrCtor (dtb__334, dtb__335, dtb__336, dtb__337) -> (v_irSizeList dtb__337)
  | _ -> 0
))
# 637 "Vuna/Ir/Model.vuna"
and v_irSizeList = (fun (mc0 : t_Ir B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__338, dtb__339) -> ((v_irSize dtb__338) + (v_irSizeList dtb__339))
  | B_dData_dList.C_List_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))
# 641 "Vuna/Ir/Model.vuna"
and v_irSizeFields = (fun (mc0 : (string, t_Ir) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__340, dtb__341) -> (match dtb__340 with
  | { B_dData_dPair.f_Pair_first = dtb__342; B_dData_dPair.f_Pair_second = dtb__343 } -> ((v_irSize dtb__343) + (v_irSizeFields dtb__341))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))
# 645 "Vuna/Ir/Model.vuna"
and v_irSizeAlts = (fun (mc0 : t_IrAlt B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__344, dtb__345) -> ((v_irSize (v_irAltBodyOf dtb__344)) + (v_irSizeAlts dtb__345))
  | B_dData_dList.C_List_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))
# 649 "Vuna/Ir/Model.vuna"
and v_irSizeAlt = (fun (mc0 : t_IrAlt B_dData_dMaybe.t_Maybe) -> (match mc0 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__346) -> (v_irSize (v_irAltBodyOf dtb__346))
  | B_dData_dMaybe.C_Maybe_Nothing -> 0
  | _ -> failwith "DT: impossible branch"
))

# 121 "Vuna/Ir/Model.vuna"
let v_irBinderId = (fun (p : t_IrBinder) -> (match p with
  | { f_IrBinder_irBinderId = dtb__347; f_IrBinder_irBinderName = dtb__348; f_IrBinder_irBinderErased = dtb__349; f_IrBinder_irBinderTy = dtb__350 } -> dtb__347
  | _ -> failwith "DT: impossible branch"
))

# 122 "Vuna/Ir/Model.vuna"
let v_irBinderName = (fun (p : t_IrBinder) -> (match p with
  | { f_IrBinder_irBinderId = dtb__351; f_IrBinder_irBinderName = dtb__352; f_IrBinder_irBinderErased = dtb__353; f_IrBinder_irBinderTy = dtb__354 } -> dtb__352
  | _ -> failwith "DT: impossible branch"
))

# 124 "Vuna/Ir/Model.vuna"
let v_irBinderErased = (fun (p : t_IrBinder) -> (match p with
  | { f_IrBinder_irBinderId = dtb__355; f_IrBinder_irBinderName = dtb__356; f_IrBinder_irBinderErased = dtb__357; f_IrBinder_irBinderTy = dtb__358 } -> dtb__357
  | _ -> failwith "DT: impossible branch"
))

# 126 "Vuna/Ir/Model.vuna"
let v_irBinderTy = (fun (p : t_IrBinder) -> (match p with
  | { f_IrBinder_irBinderId = dtb__359; f_IrBinder_irBinderName = dtb__360; f_IrBinder_irBinderErased = dtb__361; f_IrBinder_irBinderTy = dtb__362 } -> dtb__362
  | _ -> failwith "DT: impossible branch"
))

# 168 "Vuna/Ir/Model.vuna"
let v_irAltCtor = (fun (p : t_IrAlt) -> (match p with
  | { f_IrAlt_irAltCtor = dtb__363; f_IrAlt_irAltBinders = dtb__364; f_IrAlt_irAltBody = dtb__365 } -> dtb__363
  | _ -> failwith "DT: impossible branch"
))

# 169 "Vuna/Ir/Model.vuna"
let v_irAltBinders = (fun (p : t_IrAlt) -> (match p with
  | { f_IrAlt_irAltCtor = dtb__366; f_IrAlt_irAltBinders = dtb__367; f_IrAlt_irAltBody = dtb__368 } -> dtb__367
  | _ -> failwith "DT: impossible branch"
))

# 170 "Vuna/Ir/Model.vuna"
let v_irAltBody = (fun (p : t_IrAlt) -> (match p with
  | { f_IrAlt_irAltCtor = dtb__369; f_IrAlt_irAltBinders = dtb__370; f_IrAlt_irAltBody = dtb__371 } -> dtb__371
  | _ -> failwith "DT: impossible branch"
))

# 363 "Vuna/Ir/Model.vuna"
let v_irGroupIsRec = (fun (p : t_IrGroup) -> (match p with
  | { f_IrGroup_irGroupIsRec = dtb__372; f_IrGroup_irGroupDefs = dtb__373 } -> dtb__372
  | _ -> failwith "DT: impossible branch"
))

# 364 "Vuna/Ir/Model.vuna"
let v_irGroupDefs = (fun (p : t_IrGroup) -> (match p with
  | { f_IrGroup_irGroupIsRec = dtb__374; f_IrGroup_irGroupDefs = dtb__375 } -> dtb__375
  | _ -> failwith "DT: impossible branch"
))

# 374 "Vuna/Ir/Model.vuna"
let v_irEntryShow = (fun (p : t_IrEntry) -> (match p with
  | { f_IrEntry_irEntryShow = dtb__376; f_IrEntry_irEntryMain = dtb__377; f_IrEntry_irEntryIsAction = dtb__378; f_IrEntry_irEntryRunMain = dtb__379; f_IrEntry_irEntryHandlers = dtb__380; f_IrEntry_irEntryRowTags = dtb__381 } -> dtb__376
  | _ -> failwith "DT: impossible branch"
))

# 376 "Vuna/Ir/Model.vuna"
let v_irEntryMain = (fun (p : t_IrEntry) -> (match p with
  | { f_IrEntry_irEntryShow = dtb__382; f_IrEntry_irEntryMain = dtb__383; f_IrEntry_irEntryIsAction = dtb__384; f_IrEntry_irEntryRunMain = dtb__385; f_IrEntry_irEntryHandlers = dtb__386; f_IrEntry_irEntryRowTags = dtb__387 } -> dtb__383
  | _ -> failwith "DT: impossible branch"
))

# 378 "Vuna/Ir/Model.vuna"
let v_irEntryIsAction = (fun (p : t_IrEntry) -> (match p with
  | { f_IrEntry_irEntryShow = dtb__388; f_IrEntry_irEntryMain = dtb__389; f_IrEntry_irEntryIsAction = dtb__390; f_IrEntry_irEntryRunMain = dtb__391; f_IrEntry_irEntryHandlers = dtb__392; f_IrEntry_irEntryRowTags = dtb__393 } -> dtb__390
  | _ -> failwith "DT: impossible branch"
))

# 380 "Vuna/Ir/Model.vuna"
let v_irEntryRunMain = (fun (p : t_IrEntry) -> (match p with
  | { f_IrEntry_irEntryShow = dtb__394; f_IrEntry_irEntryMain = dtb__395; f_IrEntry_irEntryIsAction = dtb__396; f_IrEntry_irEntryRunMain = dtb__397; f_IrEntry_irEntryHandlers = dtb__398; f_IrEntry_irEntryRowTags = dtb__399 } -> dtb__397
  | _ -> failwith "DT: impossible branch"
))

# 382 "Vuna/Ir/Model.vuna"
let v_irEntryHandlers = (fun (p : t_IrEntry) -> (match p with
  | { f_IrEntry_irEntryShow = dtb__400; f_IrEntry_irEntryMain = dtb__401; f_IrEntry_irEntryIsAction = dtb__402; f_IrEntry_irEntryRunMain = dtb__403; f_IrEntry_irEntryHandlers = dtb__404; f_IrEntry_irEntryRowTags = dtb__405 } -> dtb__404
  | _ -> failwith "DT: impossible branch"
))

# 384 "Vuna/Ir/Model.vuna"
let v_irEntryRowTags = (fun (p : t_IrEntry) -> (match p with
  | { f_IrEntry_irEntryShow = dtb__406; f_IrEntry_irEntryMain = dtb__407; f_IrEntry_irEntryIsAction = dtb__408; f_IrEntry_irEntryRunMain = dtb__409; f_IrEntry_irEntryHandlers = dtb__410; f_IrEntry_irEntryRowTags = dtb__411 } -> dtb__411
  | _ -> failwith "DT: impossible branch"
))

# 391 "Vuna/Ir/Model.vuna"
let v_irListFamily = (fun (p : t_IrListFam) -> (match p with
  | { f_IrListFam_irListFamily = dtb__412; f_IrListFam_irListNil = dtb__413; f_IrListFam_irListCons = dtb__414 } -> dtb__412
  | _ -> failwith "DT: impossible branch"
))

# 392 "Vuna/Ir/Model.vuna"
let v_irListNil = (fun (p : t_IrListFam) -> (match p with
  | { f_IrListFam_irListFamily = dtb__415; f_IrListFam_irListNil = dtb__416; f_IrListFam_irListCons = dtb__417 } -> dtb__416
  | _ -> failwith "DT: impossible branch"
))

# 393 "Vuna/Ir/Model.vuna"
let v_irListCons = (fun (p : t_IrListFam) -> (match p with
  | { f_IrListFam_irListFamily = dtb__418; f_IrListFam_irListNil = dtb__419; f_IrListFam_irListCons = dtb__420 } -> dtb__420
  | _ -> failwith "DT: impossible branch"
))

# 403 "Vuna/Ir/Model.vuna"
let v_irSharedRecordFields = (fun (p : t_IrShared) -> (match p with
  | { f_IrShared_irSharedRecordFields = dtb__421; f_IrShared_irSharedListFam = dtb__422; f_IrShared_irSharedUsesFloat = dtb__423; f_IrShared_irSharedUsesTrace = dtb__424; f_IrShared_irSharedUsesObs = dtb__425; f_IrShared_irSharedDefLocs = dtb__426; f_IrShared_irSharedUnboxed = dtb__427; f_IrShared_irSharedCtorShapes = dtb__428; f_IrShared_irSharedUsesHost = dtb__429; f_IrShared_irSharedUsesSched = dtb__430; f_IrShared_irSharedUsesEff = dtb__431 } -> dtb__421
  | _ -> failwith "DT: impossible branch"
))

# 405 "Vuna/Ir/Model.vuna"
let v_irSharedListFam = (fun (p : t_IrShared) -> (match p with
  | { f_IrShared_irSharedRecordFields = dtb__432; f_IrShared_irSharedListFam = dtb__433; f_IrShared_irSharedUsesFloat = dtb__434; f_IrShared_irSharedUsesTrace = dtb__435; f_IrShared_irSharedUsesObs = dtb__436; f_IrShared_irSharedDefLocs = dtb__437; f_IrShared_irSharedUnboxed = dtb__438; f_IrShared_irSharedCtorShapes = dtb__439; f_IrShared_irSharedUsesHost = dtb__440; f_IrShared_irSharedUsesSched = dtb__441; f_IrShared_irSharedUsesEff = dtb__442 } -> dtb__433
  | _ -> failwith "DT: impossible branch"
))

# 407 "Vuna/Ir/Model.vuna"
let v_irSharedUsesFloat = (fun (p : t_IrShared) -> (match p with
  | { f_IrShared_irSharedRecordFields = dtb__443; f_IrShared_irSharedListFam = dtb__444; f_IrShared_irSharedUsesFloat = dtb__445; f_IrShared_irSharedUsesTrace = dtb__446; f_IrShared_irSharedUsesObs = dtb__447; f_IrShared_irSharedDefLocs = dtb__448; f_IrShared_irSharedUnboxed = dtb__449; f_IrShared_irSharedCtorShapes = dtb__450; f_IrShared_irSharedUsesHost = dtb__451; f_IrShared_irSharedUsesSched = dtb__452; f_IrShared_irSharedUsesEff = dtb__453 } -> dtb__445
  | _ -> failwith "DT: impossible branch"
))

# 409 "Vuna/Ir/Model.vuna"
let v_irSharedUsesTrace = (fun (p : t_IrShared) -> (match p with
  | { f_IrShared_irSharedRecordFields = dtb__454; f_IrShared_irSharedListFam = dtb__455; f_IrShared_irSharedUsesFloat = dtb__456; f_IrShared_irSharedUsesTrace = dtb__457; f_IrShared_irSharedUsesObs = dtb__458; f_IrShared_irSharedDefLocs = dtb__459; f_IrShared_irSharedUnboxed = dtb__460; f_IrShared_irSharedCtorShapes = dtb__461; f_IrShared_irSharedUsesHost = dtb__462; f_IrShared_irSharedUsesSched = dtb__463; f_IrShared_irSharedUsesEff = dtb__464 } -> dtb__457
  | _ -> failwith "DT: impossible branch"
))

# 412 "Vuna/Ir/Model.vuna"
let v_irSharedUsesObs = (fun (p : t_IrShared) -> (match p with
  | { f_IrShared_irSharedRecordFields = dtb__465; f_IrShared_irSharedListFam = dtb__466; f_IrShared_irSharedUsesFloat = dtb__467; f_IrShared_irSharedUsesTrace = dtb__468; f_IrShared_irSharedUsesObs = dtb__469; f_IrShared_irSharedDefLocs = dtb__470; f_IrShared_irSharedUnboxed = dtb__471; f_IrShared_irSharedCtorShapes = dtb__472; f_IrShared_irSharedUsesHost = dtb__473; f_IrShared_irSharedUsesSched = dtb__474; f_IrShared_irSharedUsesEff = dtb__475 } -> dtb__469
  | _ -> failwith "DT: impossible branch"
))

# 415 "Vuna/Ir/Model.vuna"
let v_irSharedDefLocs = (fun (p : t_IrShared) -> (match p with
  | { f_IrShared_irSharedRecordFields = dtb__476; f_IrShared_irSharedListFam = dtb__477; f_IrShared_irSharedUsesFloat = dtb__478; f_IrShared_irSharedUsesTrace = dtb__479; f_IrShared_irSharedUsesObs = dtb__480; f_IrShared_irSharedDefLocs = dtb__481; f_IrShared_irSharedUnboxed = dtb__482; f_IrShared_irSharedCtorShapes = dtb__483; f_IrShared_irSharedUsesHost = dtb__484; f_IrShared_irSharedUsesSched = dtb__485; f_IrShared_irSharedUsesEff = dtb__486 } -> dtb__481
  | _ -> failwith "DT: impossible branch"
))

# 417 "Vuna/Ir/Model.vuna"
let v_irSharedUnboxed = (fun (p : t_IrShared) -> (match p with
  | { f_IrShared_irSharedRecordFields = dtb__487; f_IrShared_irSharedListFam = dtb__488; f_IrShared_irSharedUsesFloat = dtb__489; f_IrShared_irSharedUsesTrace = dtb__490; f_IrShared_irSharedUsesObs = dtb__491; f_IrShared_irSharedDefLocs = dtb__492; f_IrShared_irSharedUnboxed = dtb__493; f_IrShared_irSharedCtorShapes = dtb__494; f_IrShared_irSharedUsesHost = dtb__495; f_IrShared_irSharedUsesSched = dtb__496; f_IrShared_irSharedUsesEff = dtb__497 } -> dtb__493
  | _ -> failwith "DT: impossible branch"
))

# 420 "Vuna/Ir/Model.vuna"
let v_irSharedCtorShapes = (fun (p : t_IrShared) -> (match p with
  | { f_IrShared_irSharedRecordFields = dtb__498; f_IrShared_irSharedListFam = dtb__499; f_IrShared_irSharedUsesFloat = dtb__500; f_IrShared_irSharedUsesTrace = dtb__501; f_IrShared_irSharedUsesObs = dtb__502; f_IrShared_irSharedDefLocs = dtb__503; f_IrShared_irSharedUnboxed = dtb__504; f_IrShared_irSharedCtorShapes = dtb__505; f_IrShared_irSharedUsesHost = dtb__506; f_IrShared_irSharedUsesSched = dtb__507; f_IrShared_irSharedUsesEff = dtb__508 } -> dtb__505
  | _ -> failwith "DT: impossible branch"
))

# 423 "Vuna/Ir/Model.vuna"
let v_irSharedUsesHost = (fun (p : t_IrShared) -> (match p with
  | { f_IrShared_irSharedRecordFields = dtb__509; f_IrShared_irSharedListFam = dtb__510; f_IrShared_irSharedUsesFloat = dtb__511; f_IrShared_irSharedUsesTrace = dtb__512; f_IrShared_irSharedUsesObs = dtb__513; f_IrShared_irSharedDefLocs = dtb__514; f_IrShared_irSharedUnboxed = dtb__515; f_IrShared_irSharedCtorShapes = dtb__516; f_IrShared_irSharedUsesHost = dtb__517; f_IrShared_irSharedUsesSched = dtb__518; f_IrShared_irSharedUsesEff = dtb__519 } -> dtb__517
  | _ -> failwith "DT: impossible branch"
))

# 426 "Vuna/Ir/Model.vuna"
let v_irSharedUsesSched = (fun (p : t_IrShared) -> (match p with
  | { f_IrShared_irSharedRecordFields = dtb__520; f_IrShared_irSharedListFam = dtb__521; f_IrShared_irSharedUsesFloat = dtb__522; f_IrShared_irSharedUsesTrace = dtb__523; f_IrShared_irSharedUsesObs = dtb__524; f_IrShared_irSharedDefLocs = dtb__525; f_IrShared_irSharedUnboxed = dtb__526; f_IrShared_irSharedCtorShapes = dtb__527; f_IrShared_irSharedUsesHost = dtb__528; f_IrShared_irSharedUsesSched = dtb__529; f_IrShared_irSharedUsesEff = dtb__530 } -> dtb__529
  | _ -> failwith "DT: impossible branch"
))

# 430 "Vuna/Ir/Model.vuna"
let v_irSharedUsesEff = (fun (p : t_IrShared) -> (match p with
  | { f_IrShared_irSharedRecordFields = dtb__531; f_IrShared_irSharedListFam = dtb__532; f_IrShared_irSharedUsesFloat = dtb__533; f_IrShared_irSharedUsesTrace = dtb__534; f_IrShared_irSharedUsesObs = dtb__535; f_IrShared_irSharedDefLocs = dtb__536; f_IrShared_irSharedUnboxed = dtb__537; f_IrShared_irSharedCtorShapes = dtb__538; f_IrShared_irSharedUsesHost = dtb__539; f_IrShared_irSharedUsesSched = dtb__540; f_IrShared_irSharedUsesEff = dtb__541 } -> dtb__541
  | _ -> failwith "DT: impossible branch"
))

# 450 "Vuna/Ir/Model.vuna"
let v_irUnitTyDecls = (fun (p : t_IrUnit) -> (match p with
  | { f_IrUnit_irUnitTyDecls = dtb__542; f_IrUnit_irUnitGroups = dtb__543; f_IrUnit_irUnitHasListFamily = dtb__544; f_IrUnit_irUnitTypeRefs = dtb__545; f_IrUnit_irUnitEntry = dtb__546 } -> dtb__542
  | _ -> failwith "DT: impossible branch"
))

# 452 "Vuna/Ir/Model.vuna"
let v_irUnitGroups = (fun (p : t_IrUnit) -> (match p with
  | { f_IrUnit_irUnitTyDecls = dtb__547; f_IrUnit_irUnitGroups = dtb__548; f_IrUnit_irUnitHasListFamily = dtb__549; f_IrUnit_irUnitTypeRefs = dtb__550; f_IrUnit_irUnitEntry = dtb__551 } -> dtb__548
  | _ -> failwith "DT: impossible branch"
))

# 454 "Vuna/Ir/Model.vuna"
let v_irUnitHasListFamily = (fun (p : t_IrUnit) -> (match p with
  | { f_IrUnit_irUnitTyDecls = dtb__552; f_IrUnit_irUnitGroups = dtb__553; f_IrUnit_irUnitHasListFamily = dtb__554; f_IrUnit_irUnitTypeRefs = dtb__555; f_IrUnit_irUnitEntry = dtb__556 } -> dtb__554
  | _ -> failwith "DT: impossible branch"
))

# 456 "Vuna/Ir/Model.vuna"
let v_irUnitTypeRefs = (fun (p : t_IrUnit) -> (match p with
  | { f_IrUnit_irUnitTyDecls = dtb__557; f_IrUnit_irUnitGroups = dtb__558; f_IrUnit_irUnitHasListFamily = dtb__559; f_IrUnit_irUnitTypeRefs = dtb__560; f_IrUnit_irUnitEntry = dtb__561 } -> dtb__560
  | _ -> failwith "DT: impossible branch"
))

# 458 "Vuna/Ir/Model.vuna"
let v_irUnitEntry = (fun (p : t_IrUnit) -> (match p with
  | { f_IrUnit_irUnitTyDecls = dtb__562; f_IrUnit_irUnitGroups = dtb__563; f_IrUnit_irUnitHasListFamily = dtb__564; f_IrUnit_irUnitTypeRefs = dtb__565; f_IrUnit_irUnitEntry = dtb__566 } -> dtb__566
  | _ -> failwith "DT: impossible branch"
))

# 462 "Vuna/Ir/Model.vuna"
let v_irProgShared = (fun (p : t_IrProgram) -> (match p with
  | { f_IrProgram_irProgShared = dtb__567; f_IrProgram_irProgUnit = dtb__568 } -> dtb__567
  | _ -> failwith "DT: impossible branch"
))

# 463 "Vuna/Ir/Model.vuna"
let v_irProgUnit = (fun (p : t_IrProgram) -> (match p with
  | { f_IrProgram_irProgShared = dtb__569; f_IrProgram_irProgUnit = dtb__570 } -> dtb__570
  | _ -> failwith "DT: impossible branch"
))
