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
and t_IrShared = { f_IrShared_irSharedRecordFields : (string, (int, string) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List; f_IrShared_irSharedListFam : t_IrListFam B_dData_dMaybe.t_Maybe; f_IrShared_irSharedUsesFloat : bool; f_IrShared_irSharedUsesTrace : bool; f_IrShared_irSharedUsesObs : bool; f_IrShared_irSharedDefLocs : (string, (string, int) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List; f_IrShared_irSharedUnboxed : (string, (string, int) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List; f_IrShared_irSharedCtorShapes : (string, (string, bool B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List }
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

# 423 "Vuna/Ir/Model.vuna"
let rec v_irSharedUnboxedOf = (fun (mc0 : string) (mc1 : (string, (string, int) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__174, dtb__175) -> (if ((B_dData_dPair.v_firstOf dtb__174) = mc0) then (B_dData_dMaybe.C_Maybe_Just ((B_dData_dPair.v_secondOf dtb__174))) else ((v_irSharedUnboxedOf mc0) dtb__175))
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 428 "Vuna/Ir/Model.vuna"
let rec v_irSharedCtorShapeOf = (fun (mc0 : string) (mc1 : (string, (string, bool B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__176, dtb__177) -> (if ((B_dData_dPair.v_firstOf dtb__176) = mc0) then (B_dData_dMaybe.C_Maybe_Just ((B_dData_dPair.v_secondOf dtb__176))) else ((v_irSharedCtorShapeOf mc0) dtb__177))
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 433 "Vuna/Ir/Model.vuna"
let rec v_irSharedRecordFieldsOf = (fun (mc0 : string) (mc1 : (string, (int, string) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__178, dtb__179) -> (if ((B_dData_dPair.v_firstOf dtb__178) = mc0) then (B_dData_dPair.v_secondOf dtb__178) else ((v_irSharedRecordFieldsOf mc0) dtb__179))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 460 "Vuna/Ir/Model.vuna"
let v_irInlineArity = (fun (mc0 : string) -> (if (mc0 = "+") then 2 else (if (mc0 = "-") then 2 else (if (mc0 = "*") then 2 else (if (mc0 = "/") then 2 else (if (mc0 = "&&") then 2 else (if (mc0 = "||") then 2 else (if (mc0 = "bitAnd") then 2 else (if (mc0 = "bitOr") then 2 else (if (mc0 = "bitXor") then 2 else (if (mc0 = "bitNot") then 1 else (if (mc0 = "bitShl") then 2 else (if (mc0 = "bitShr") then 2 else (if (mc0 = "++") then 2 else (if (mc0 = "bi_eq_int") then 2 else (if (mc0 = "bi_neq_int") then 2 else (if (mc0 = "effectId") then 1 else (if (mc0 = "bi_eq_str") then 2 else (if (mc0 = "bi_neq_str") then 2 else (if (mc0 = "bi_lt_int") then 2 else (if (mc0 = "bi_le_int") then 2 else (if (mc0 = "bi_gt_int") then 2 else (if (mc0 = "bi_ge_int") then 2 else (if (mc0 = "bi_lt_str") then 2 else (if (mc0 = "bi_le_str") then 2 else (if (mc0 = "bi_gt_str") then 2 else (if (mc0 = "bi_ge_str") then 2 else (if (mc0 = "bi_lt_bool") then 2 else (if (mc0 = "bi_le_bool") then 2 else (if (mc0 = "bi_gt_bool") then 2 else (if (mc0 = "bi_ge_bool") then 2 else (if (mc0 = "bi_add_float") then 2 else (if (mc0 = "bi_sub_float") then 2 else (if (mc0 = "bi_mul_float") then 2 else (if (mc0 = "bi_div_float") then 2 else (if (mc0 = "bi_eq_float") then 2 else (if (mc0 = "bi_neq_float") then 2 else (if (mc0 = "bi_lt_float") then 2 else (if (mc0 = "bi_le_float") then 2 else (if (mc0 = "bi_gt_float") then 2 else (if (mc0 = "bi_ge_float") then 2 else (if (mc0 = "@ir@m@runEff") then 2 else (if (mc0 = "natToInt") then 1 else (if (mc0 = "natFromInt") then 1 else (if (mc0 = "natAdd") then 2 else (if (mc0 = "natSub") then 2 else (if (mc0 = "natMul") then 2 else (if (mc0 = "natDiv") then 2 else 0))))))))))))))))))))))))))))))))))))))))))))))))

# 511 "Vuna/Ir/Model.vuna"
let v_irListFamilyOf = (fun (mc0 : t_IrListFam) -> (match mc0 with
  | { f_IrListFam_irListFamily = dtb__180; f_IrListFam_irListNil = dtb__181; f_IrListFam_irListCons = dtb__182 } -> dtb__180
  | _ -> failwith "DT: impossible branch"
))

# 515 "Vuna/Ir/Model.vuna"
let v_irListNilOf = (fun (mc0 : t_IrListFam) -> (match mc0 with
  | { f_IrListFam_irListFamily = dtb__183; f_IrListFam_irListNil = dtb__184; f_IrListFam_irListCons = dtb__185 } -> dtb__184
  | _ -> failwith "DT: impossible branch"
))

# 519 "Vuna/Ir/Model.vuna"
let v_irListConsOf = (fun (mc0 : t_IrListFam) -> (match mc0 with
  | { f_IrListFam_irListFamily = dtb__186; f_IrListFam_irListNil = dtb__187; f_IrListFam_irListCons = dtb__188 } -> dtb__188
  | _ -> failwith "DT: impossible branch"
))

# 523 "Vuna/Ir/Model.vuna"
let v_irAltCtorOf = (fun (mc0 : t_IrAlt) -> (match mc0 with
  | { f_IrAlt_irAltCtor = dtb__189; f_IrAlt_irAltBinders = dtb__190; f_IrAlt_irAltBody = dtb__191 } -> dtb__189
  | _ -> failwith "DT: impossible branch"
))

# 527 "Vuna/Ir/Model.vuna"
let v_irAltBindersOf = (fun (mc0 : t_IrAlt) -> (match mc0 with
  | { f_IrAlt_irAltCtor = dtb__192; f_IrAlt_irAltBinders = dtb__193; f_IrAlt_irAltBody = dtb__194 } -> dtb__193
  | _ -> failwith "DT: impossible branch"
))

# 531 "Vuna/Ir/Model.vuna"
let v_irAltBodyOf = (fun (mc0 : t_IrAlt) -> (match mc0 with
  | { f_IrAlt_irAltCtor = dtb__195; f_IrAlt_irAltBinders = dtb__196; f_IrAlt_irAltBody = dtb__197 } -> dtb__197
  | _ -> failwith "DT: impossible branch"
))

# 535 "Vuna/Ir/Model.vuna"
let v_irEntryShowOf = (fun (mc0 : t_IrEntry) -> (match mc0 with
  | { f_IrEntry_irEntryShow = dtb__198; f_IrEntry_irEntryMain = dtb__199; f_IrEntry_irEntryIsAction = dtb__200; f_IrEntry_irEntryRunMain = dtb__201; f_IrEntry_irEntryHandlers = dtb__202; f_IrEntry_irEntryRowTags = dtb__203 } -> dtb__198
  | _ -> failwith "DT: impossible branch"
))

# 539 "Vuna/Ir/Model.vuna"
let v_irEntryMainOf = (fun (mc0 : t_IrEntry) -> (match mc0 with
  | { f_IrEntry_irEntryShow = dtb__204; f_IrEntry_irEntryMain = dtb__205; f_IrEntry_irEntryIsAction = dtb__206; f_IrEntry_irEntryRunMain = dtb__207; f_IrEntry_irEntryHandlers = dtb__208; f_IrEntry_irEntryRowTags = dtb__209 } -> dtb__205
  | _ -> failwith "DT: impossible branch"
))

# 543 "Vuna/Ir/Model.vuna"
let v_irEntryIsActionOf = (fun (mc0 : t_IrEntry) -> (match mc0 with
  | { f_IrEntry_irEntryShow = dtb__210; f_IrEntry_irEntryMain = dtb__211; f_IrEntry_irEntryIsAction = dtb__212; f_IrEntry_irEntryRunMain = dtb__213; f_IrEntry_irEntryHandlers = dtb__214; f_IrEntry_irEntryRowTags = dtb__215 } -> dtb__212
  | _ -> failwith "DT: impossible branch"
))

# 547 "Vuna/Ir/Model.vuna"
let v_irEntryRunMainOf = (fun (mc0 : t_IrEntry) -> (match mc0 with
  | { f_IrEntry_irEntryShow = dtb__216; f_IrEntry_irEntryMain = dtb__217; f_IrEntry_irEntryIsAction = dtb__218; f_IrEntry_irEntryRunMain = dtb__219; f_IrEntry_irEntryHandlers = dtb__220; f_IrEntry_irEntryRowTags = dtb__221 } -> dtb__219
  | _ -> failwith "DT: impossible branch"
))

# 551 "Vuna/Ir/Model.vuna"
let v_irEntryHandlersOf = (fun (mc0 : t_IrEntry) -> (match mc0 with
  | { f_IrEntry_irEntryShow = dtb__222; f_IrEntry_irEntryMain = dtb__223; f_IrEntry_irEntryIsAction = dtb__224; f_IrEntry_irEntryRunMain = dtb__225; f_IrEntry_irEntryHandlers = dtb__226; f_IrEntry_irEntryRowTags = dtb__227 } -> dtb__226
  | _ -> failwith "DT: impossible branch"
))

# 555 "Vuna/Ir/Model.vuna"
let v_irEntryRowTagsOf = (fun (mc0 : t_IrEntry) -> (match mc0 with
  | { f_IrEntry_irEntryShow = dtb__228; f_IrEntry_irEntryMain = dtb__229; f_IrEntry_irEntryIsAction = dtb__230; f_IrEntry_irEntryRunMain = dtb__231; f_IrEntry_irEntryHandlers = dtb__232; f_IrEntry_irEntryRowTags = dtb__233 } -> dtb__233
  | _ -> failwith "DT: impossible branch"
))

# 559 "Vuna/Ir/Model.vuna"
let v_irProgSharedOf = (fun (mc0 : t_IrProgram) -> (match mc0 with
  | { f_IrProgram_irProgShared = dtb__234; f_IrProgram_irProgUnit = dtb__235 } -> dtb__234
  | _ -> failwith "DT: impossible branch"
))

# 563 "Vuna/Ir/Model.vuna"
let v_irProgUnitOf = (fun (mc0 : t_IrProgram) -> (match mc0 with
  | { f_IrProgram_irProgShared = dtb__236; f_IrProgram_irProgUnit = dtb__237 } -> dtb__237
  | _ -> failwith "DT: impossible branch"
))

# 570 "Vuna/Ir/Model.vuna"
let rec v_irSize = (fun (mc0 : t_Ir) -> (match mc0 with
  | C_Ir_IrTail (dtb__238) -> (v_irSize dtb__238)
  | _ -> (1 + (v_irSizeChildren mc0))
))
# 574 "Vuna/Ir/Model.vuna"
and v_irSizeChildren = (fun (mc0 : t_Ir) -> (match mc0 with
  | C_Ir_IrEffThunk (dtb__239, dtb__240, dtb__241, dtb__242, dtb__243) -> (v_irSize dtb__243)
  | C_Ir_IrConcatMany (dtb__244) -> (v_irSizeList dtb__244)
  | C_Ir_IrNatCase (dtb__245, dtb__246, dtb__247, dtb__248, dtb__249) -> ((((v_irSize dtb__245) + (v_irSizeAlt dtb__247)) + (v_irSizeAlt dtb__248)) + (v_irSizeAlt dtb__249))
  | C_Ir_IrCase (dtb__250, dtb__251, dtb__252, dtb__253) -> ((v_irSize dtb__252) + (v_irSizeAlts dtb__253))
  | C_Ir_IrIf (dtb__254, dtb__255, dtb__256) -> (((v_irSize dtb__254) + (v_irSize dtb__255)) + (v_irSize dtb__256))
  | C_Ir_IrTail (dtb__257) -> (v_irSize dtb__257)
  | C_Ir_IrApp (dtb__258, dtb__259, dtb__260) -> ((v_irSize dtb__259) + (v_irSize dtb__260))
  | C_Ir_IrLam (dtb__261, dtb__262, dtb__263) -> (v_irSize dtb__263)
  | C_Ir_IrLet (dtb__264, dtb__265, dtb__266) -> ((v_irSize dtb__265) + (v_irSize dtb__266))
  | C_Ir_IrCast (dtb__267, dtb__268, dtb__269) -> (v_irSize dtb__269)
  | C_Ir_IrRtApp (dtb__270, dtb__271) -> (v_irSizeList dtb__271)
  | C_Ir_IrRecUpd (dtb__272, dtb__273, dtb__274, dtb__275) -> ((v_irSize dtb__272) + (v_irSizeFields dtb__274))
  | C_Ir_IrProj (dtb__276, dtb__277, dtb__278, dtb__279) -> (v_irSize dtb__276)
  | C_Ir_IrRecord (dtb__280, dtb__281, dtb__282) -> (v_irSizeFields dtb__282)
  | C_Ir_IrCtor (dtb__283, dtb__284, dtb__285, dtb__286) -> (v_irSizeList dtb__286)
  | _ -> 0
))
# 593 "Vuna/Ir/Model.vuna"
and v_irSizeList = (fun (mc0 : t_Ir B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__287, dtb__288) -> ((v_irSize dtb__287) + (v_irSizeList dtb__288))
  | B_dData_dList.C_List_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))
# 597 "Vuna/Ir/Model.vuna"
and v_irSizeFields = (fun (mc0 : (string, t_Ir) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__289, dtb__290) -> (match dtb__289 with
  | { B_dData_dPair.f_Pair_first = dtb__291; B_dData_dPair.f_Pair_second = dtb__292 } -> ((v_irSize dtb__292) + (v_irSizeFields dtb__290))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))
# 601 "Vuna/Ir/Model.vuna"
and v_irSizeAlts = (fun (mc0 : t_IrAlt B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__293, dtb__294) -> ((v_irSize (v_irAltBodyOf dtb__293)) + (v_irSizeAlts dtb__294))
  | B_dData_dList.C_List_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))
# 605 "Vuna/Ir/Model.vuna"
and v_irSizeAlt = (fun (mc0 : t_IrAlt B_dData_dMaybe.t_Maybe) -> (match mc0 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__295) -> (v_irSize (v_irAltBodyOf dtb__295))
  | B_dData_dMaybe.C_Maybe_Nothing -> 0
  | _ -> failwith "DT: impossible branch"
))

# 121 "Vuna/Ir/Model.vuna"
let v_irBinderId = (fun (p : t_IrBinder) -> (match p with
  | { f_IrBinder_irBinderId = dtb__296; f_IrBinder_irBinderName = dtb__297; f_IrBinder_irBinderErased = dtb__298; f_IrBinder_irBinderTy = dtb__299 } -> dtb__296
  | _ -> failwith "DT: impossible branch"
))

# 122 "Vuna/Ir/Model.vuna"
let v_irBinderName = (fun (p : t_IrBinder) -> (match p with
  | { f_IrBinder_irBinderId = dtb__300; f_IrBinder_irBinderName = dtb__301; f_IrBinder_irBinderErased = dtb__302; f_IrBinder_irBinderTy = dtb__303 } -> dtb__301
  | _ -> failwith "DT: impossible branch"
))

# 124 "Vuna/Ir/Model.vuna"
let v_irBinderErased = (fun (p : t_IrBinder) -> (match p with
  | { f_IrBinder_irBinderId = dtb__304; f_IrBinder_irBinderName = dtb__305; f_IrBinder_irBinderErased = dtb__306; f_IrBinder_irBinderTy = dtb__307 } -> dtb__306
  | _ -> failwith "DT: impossible branch"
))

# 126 "Vuna/Ir/Model.vuna"
let v_irBinderTy = (fun (p : t_IrBinder) -> (match p with
  | { f_IrBinder_irBinderId = dtb__308; f_IrBinder_irBinderName = dtb__309; f_IrBinder_irBinderErased = dtb__310; f_IrBinder_irBinderTy = dtb__311 } -> dtb__311
  | _ -> failwith "DT: impossible branch"
))

# 168 "Vuna/Ir/Model.vuna"
let v_irAltCtor = (fun (p : t_IrAlt) -> (match p with
  | { f_IrAlt_irAltCtor = dtb__312; f_IrAlt_irAltBinders = dtb__313; f_IrAlt_irAltBody = dtb__314 } -> dtb__312
  | _ -> failwith "DT: impossible branch"
))

# 169 "Vuna/Ir/Model.vuna"
let v_irAltBinders = (fun (p : t_IrAlt) -> (match p with
  | { f_IrAlt_irAltCtor = dtb__315; f_IrAlt_irAltBinders = dtb__316; f_IrAlt_irAltBody = dtb__317 } -> dtb__316
  | _ -> failwith "DT: impossible branch"
))

# 170 "Vuna/Ir/Model.vuna"
let v_irAltBody = (fun (p : t_IrAlt) -> (match p with
  | { f_IrAlt_irAltCtor = dtb__318; f_IrAlt_irAltBinders = dtb__319; f_IrAlt_irAltBody = dtb__320 } -> dtb__320
  | _ -> failwith "DT: impossible branch"
))

# 363 "Vuna/Ir/Model.vuna"
let v_irGroupIsRec = (fun (p : t_IrGroup) -> (match p with
  | { f_IrGroup_irGroupIsRec = dtb__321; f_IrGroup_irGroupDefs = dtb__322 } -> dtb__321
  | _ -> failwith "DT: impossible branch"
))

# 364 "Vuna/Ir/Model.vuna"
let v_irGroupDefs = (fun (p : t_IrGroup) -> (match p with
  | { f_IrGroup_irGroupIsRec = dtb__323; f_IrGroup_irGroupDefs = dtb__324 } -> dtb__324
  | _ -> failwith "DT: impossible branch"
))

# 374 "Vuna/Ir/Model.vuna"
let v_irEntryShow = (fun (p : t_IrEntry) -> (match p with
  | { f_IrEntry_irEntryShow = dtb__325; f_IrEntry_irEntryMain = dtb__326; f_IrEntry_irEntryIsAction = dtb__327; f_IrEntry_irEntryRunMain = dtb__328; f_IrEntry_irEntryHandlers = dtb__329; f_IrEntry_irEntryRowTags = dtb__330 } -> dtb__325
  | _ -> failwith "DT: impossible branch"
))

# 376 "Vuna/Ir/Model.vuna"
let v_irEntryMain = (fun (p : t_IrEntry) -> (match p with
  | { f_IrEntry_irEntryShow = dtb__331; f_IrEntry_irEntryMain = dtb__332; f_IrEntry_irEntryIsAction = dtb__333; f_IrEntry_irEntryRunMain = dtb__334; f_IrEntry_irEntryHandlers = dtb__335; f_IrEntry_irEntryRowTags = dtb__336 } -> dtb__332
  | _ -> failwith "DT: impossible branch"
))

# 378 "Vuna/Ir/Model.vuna"
let v_irEntryIsAction = (fun (p : t_IrEntry) -> (match p with
  | { f_IrEntry_irEntryShow = dtb__337; f_IrEntry_irEntryMain = dtb__338; f_IrEntry_irEntryIsAction = dtb__339; f_IrEntry_irEntryRunMain = dtb__340; f_IrEntry_irEntryHandlers = dtb__341; f_IrEntry_irEntryRowTags = dtb__342 } -> dtb__339
  | _ -> failwith "DT: impossible branch"
))

# 380 "Vuna/Ir/Model.vuna"
let v_irEntryRunMain = (fun (p : t_IrEntry) -> (match p with
  | { f_IrEntry_irEntryShow = dtb__343; f_IrEntry_irEntryMain = dtb__344; f_IrEntry_irEntryIsAction = dtb__345; f_IrEntry_irEntryRunMain = dtb__346; f_IrEntry_irEntryHandlers = dtb__347; f_IrEntry_irEntryRowTags = dtb__348 } -> dtb__346
  | _ -> failwith "DT: impossible branch"
))

# 382 "Vuna/Ir/Model.vuna"
let v_irEntryHandlers = (fun (p : t_IrEntry) -> (match p with
  | { f_IrEntry_irEntryShow = dtb__349; f_IrEntry_irEntryMain = dtb__350; f_IrEntry_irEntryIsAction = dtb__351; f_IrEntry_irEntryRunMain = dtb__352; f_IrEntry_irEntryHandlers = dtb__353; f_IrEntry_irEntryRowTags = dtb__354 } -> dtb__353
  | _ -> failwith "DT: impossible branch"
))

# 384 "Vuna/Ir/Model.vuna"
let v_irEntryRowTags = (fun (p : t_IrEntry) -> (match p with
  | { f_IrEntry_irEntryShow = dtb__355; f_IrEntry_irEntryMain = dtb__356; f_IrEntry_irEntryIsAction = dtb__357; f_IrEntry_irEntryRunMain = dtb__358; f_IrEntry_irEntryHandlers = dtb__359; f_IrEntry_irEntryRowTags = dtb__360 } -> dtb__360
  | _ -> failwith "DT: impossible branch"
))

# 391 "Vuna/Ir/Model.vuna"
let v_irListFamily = (fun (p : t_IrListFam) -> (match p with
  | { f_IrListFam_irListFamily = dtb__361; f_IrListFam_irListNil = dtb__362; f_IrListFam_irListCons = dtb__363 } -> dtb__361
  | _ -> failwith "DT: impossible branch"
))

# 392 "Vuna/Ir/Model.vuna"
let v_irListNil = (fun (p : t_IrListFam) -> (match p with
  | { f_IrListFam_irListFamily = dtb__364; f_IrListFam_irListNil = dtb__365; f_IrListFam_irListCons = dtb__366 } -> dtb__365
  | _ -> failwith "DT: impossible branch"
))

# 393 "Vuna/Ir/Model.vuna"
let v_irListCons = (fun (p : t_IrListFam) -> (match p with
  | { f_IrListFam_irListFamily = dtb__367; f_IrListFam_irListNil = dtb__368; f_IrListFam_irListCons = dtb__369 } -> dtb__369
  | _ -> failwith "DT: impossible branch"
))

# 403 "Vuna/Ir/Model.vuna"
let v_irSharedRecordFields = (fun (p : t_IrShared) -> (match p with
  | { f_IrShared_irSharedRecordFields = dtb__370; f_IrShared_irSharedListFam = dtb__371; f_IrShared_irSharedUsesFloat = dtb__372; f_IrShared_irSharedUsesTrace = dtb__373; f_IrShared_irSharedUsesObs = dtb__374; f_IrShared_irSharedDefLocs = dtb__375; f_IrShared_irSharedUnboxed = dtb__376; f_IrShared_irSharedCtorShapes = dtb__377 } -> dtb__370
  | _ -> failwith "DT: impossible branch"
))

# 405 "Vuna/Ir/Model.vuna"
let v_irSharedListFam = (fun (p : t_IrShared) -> (match p with
  | { f_IrShared_irSharedRecordFields = dtb__378; f_IrShared_irSharedListFam = dtb__379; f_IrShared_irSharedUsesFloat = dtb__380; f_IrShared_irSharedUsesTrace = dtb__381; f_IrShared_irSharedUsesObs = dtb__382; f_IrShared_irSharedDefLocs = dtb__383; f_IrShared_irSharedUnboxed = dtb__384; f_IrShared_irSharedCtorShapes = dtb__385 } -> dtb__379
  | _ -> failwith "DT: impossible branch"
))

# 407 "Vuna/Ir/Model.vuna"
let v_irSharedUsesFloat = (fun (p : t_IrShared) -> (match p with
  | { f_IrShared_irSharedRecordFields = dtb__386; f_IrShared_irSharedListFam = dtb__387; f_IrShared_irSharedUsesFloat = dtb__388; f_IrShared_irSharedUsesTrace = dtb__389; f_IrShared_irSharedUsesObs = dtb__390; f_IrShared_irSharedDefLocs = dtb__391; f_IrShared_irSharedUnboxed = dtb__392; f_IrShared_irSharedCtorShapes = dtb__393 } -> dtb__388
  | _ -> failwith "DT: impossible branch"
))

# 409 "Vuna/Ir/Model.vuna"
let v_irSharedUsesTrace = (fun (p : t_IrShared) -> (match p with
  | { f_IrShared_irSharedRecordFields = dtb__394; f_IrShared_irSharedListFam = dtb__395; f_IrShared_irSharedUsesFloat = dtb__396; f_IrShared_irSharedUsesTrace = dtb__397; f_IrShared_irSharedUsesObs = dtb__398; f_IrShared_irSharedDefLocs = dtb__399; f_IrShared_irSharedUnboxed = dtb__400; f_IrShared_irSharedCtorShapes = dtb__401 } -> dtb__397
  | _ -> failwith "DT: impossible branch"
))

# 412 "Vuna/Ir/Model.vuna"
let v_irSharedUsesObs = (fun (p : t_IrShared) -> (match p with
  | { f_IrShared_irSharedRecordFields = dtb__402; f_IrShared_irSharedListFam = dtb__403; f_IrShared_irSharedUsesFloat = dtb__404; f_IrShared_irSharedUsesTrace = dtb__405; f_IrShared_irSharedUsesObs = dtb__406; f_IrShared_irSharedDefLocs = dtb__407; f_IrShared_irSharedUnboxed = dtb__408; f_IrShared_irSharedCtorShapes = dtb__409 } -> dtb__406
  | _ -> failwith "DT: impossible branch"
))

# 415 "Vuna/Ir/Model.vuna"
let v_irSharedDefLocs = (fun (p : t_IrShared) -> (match p with
  | { f_IrShared_irSharedRecordFields = dtb__410; f_IrShared_irSharedListFam = dtb__411; f_IrShared_irSharedUsesFloat = dtb__412; f_IrShared_irSharedUsesTrace = dtb__413; f_IrShared_irSharedUsesObs = dtb__414; f_IrShared_irSharedDefLocs = dtb__415; f_IrShared_irSharedUnboxed = dtb__416; f_IrShared_irSharedCtorShapes = dtb__417 } -> dtb__415
  | _ -> failwith "DT: impossible branch"
))

# 417 "Vuna/Ir/Model.vuna"
let v_irSharedUnboxed = (fun (p : t_IrShared) -> (match p with
  | { f_IrShared_irSharedRecordFields = dtb__418; f_IrShared_irSharedListFam = dtb__419; f_IrShared_irSharedUsesFloat = dtb__420; f_IrShared_irSharedUsesTrace = dtb__421; f_IrShared_irSharedUsesObs = dtb__422; f_IrShared_irSharedDefLocs = dtb__423; f_IrShared_irSharedUnboxed = dtb__424; f_IrShared_irSharedCtorShapes = dtb__425 } -> dtb__424
  | _ -> failwith "DT: impossible branch"
))

# 420 "Vuna/Ir/Model.vuna"
let v_irSharedCtorShapes = (fun (p : t_IrShared) -> (match p with
  | { f_IrShared_irSharedRecordFields = dtb__426; f_IrShared_irSharedListFam = dtb__427; f_IrShared_irSharedUsesFloat = dtb__428; f_IrShared_irSharedUsesTrace = dtb__429; f_IrShared_irSharedUsesObs = dtb__430; f_IrShared_irSharedDefLocs = dtb__431; f_IrShared_irSharedUnboxed = dtb__432; f_IrShared_irSharedCtorShapes = dtb__433 } -> dtb__433
  | _ -> failwith "DT: impossible branch"
))

# 440 "Vuna/Ir/Model.vuna"
let v_irUnitTyDecls = (fun (p : t_IrUnit) -> (match p with
  | { f_IrUnit_irUnitTyDecls = dtb__434; f_IrUnit_irUnitGroups = dtb__435; f_IrUnit_irUnitHasListFamily = dtb__436; f_IrUnit_irUnitTypeRefs = dtb__437; f_IrUnit_irUnitEntry = dtb__438 } -> dtb__434
  | _ -> failwith "DT: impossible branch"
))

# 442 "Vuna/Ir/Model.vuna"
let v_irUnitGroups = (fun (p : t_IrUnit) -> (match p with
  | { f_IrUnit_irUnitTyDecls = dtb__439; f_IrUnit_irUnitGroups = dtb__440; f_IrUnit_irUnitHasListFamily = dtb__441; f_IrUnit_irUnitTypeRefs = dtb__442; f_IrUnit_irUnitEntry = dtb__443 } -> dtb__440
  | _ -> failwith "DT: impossible branch"
))

# 444 "Vuna/Ir/Model.vuna"
let v_irUnitHasListFamily = (fun (p : t_IrUnit) -> (match p with
  | { f_IrUnit_irUnitTyDecls = dtb__444; f_IrUnit_irUnitGroups = dtb__445; f_IrUnit_irUnitHasListFamily = dtb__446; f_IrUnit_irUnitTypeRefs = dtb__447; f_IrUnit_irUnitEntry = dtb__448 } -> dtb__446
  | _ -> failwith "DT: impossible branch"
))

# 446 "Vuna/Ir/Model.vuna"
let v_irUnitTypeRefs = (fun (p : t_IrUnit) -> (match p with
  | { f_IrUnit_irUnitTyDecls = dtb__449; f_IrUnit_irUnitGroups = dtb__450; f_IrUnit_irUnitHasListFamily = dtb__451; f_IrUnit_irUnitTypeRefs = dtb__452; f_IrUnit_irUnitEntry = dtb__453 } -> dtb__452
  | _ -> failwith "DT: impossible branch"
))

# 448 "Vuna/Ir/Model.vuna"
let v_irUnitEntry = (fun (p : t_IrUnit) -> (match p with
  | { f_IrUnit_irUnitTyDecls = dtb__454; f_IrUnit_irUnitGroups = dtb__455; f_IrUnit_irUnitHasListFamily = dtb__456; f_IrUnit_irUnitTypeRefs = dtb__457; f_IrUnit_irUnitEntry = dtb__458 } -> dtb__458
  | _ -> failwith "DT: impossible branch"
))

# 452 "Vuna/Ir/Model.vuna"
let v_irProgShared = (fun (p : t_IrProgram) -> (match p with
  | { f_IrProgram_irProgShared = dtb__459; f_IrProgram_irProgUnit = dtb__460 } -> dtb__459
  | _ -> failwith "DT: impossible branch"
))

# 453 "Vuna/Ir/Model.vuna"
let v_irProgUnit = (fun (p : t_IrProgram) -> (match p with
  | { f_IrProgram_irProgShared = dtb__461; f_IrProgram_irProgUnit = dtb__462 } -> dtb__462
  | _ -> failwith "DT: impossible branch"
))
