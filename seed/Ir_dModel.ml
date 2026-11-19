open Vuna_runtime
type t_IrTy = C_IrTy_IrTyVar of (int) | C_IrTy_IrTyInt | C_IrTy_IrTyStr | C_IrTy_IrTyBool | C_IrTy_IrTyFloat | C_IrTy_IrTyOpaque | C_IrTy_IrTyArray of (t_IrTy) | C_IrTy_IrTyRef of (t_IrTy) | C_IrTy_IrTyData of (string) * (t_IrTy B_dData_dList.t_List) | C_IrTy_IrTyFun of (t_IrTy) * (t_IrTy)
and t_IrBName = C_IrBName_IrBUser of (string) | C_IrBName_IrBArm of (int) | C_IrBName_IrBNat of (int) | C_IrBName_IrBWild
and t_IrBinder = { f_IrBinder_irBinderName : t_IrBName; f_IrBinder_irBinderErased : bool; f_IrBinder_irBinderTy : t_IrTy B_dData_dMaybe.t_Maybe }
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

# 70 "Vuna/Compiler/Ir/Model.vuna"
let rec v_irTyVarAt = (fun (mc0 : t_IrTy B_dData_dList.t_List) (mc1 : int) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__0, dtb__1) -> (if (mc1 <= 0) then dtb__0 else ((v_irTyVarAt dtb__1) (mc1 - 1)))
  | B_dData_dList.C_List_Nil -> C_IrTy_IrTyOpaque
  | _ -> failwith "DT: impossible branch"
))

# 56 "Vuna/Compiler/Ir/Model.vuna"
let rec v_irTySubstVars = (fun (args : t_IrTy B_dData_dList.t_List) (ty : t_IrTy) -> (match ty with
  | C_IrTy_IrTyVar (dtb__2) -> ((v_irTyVarAt args) dtb__2)
  | C_IrTy_IrTyInt -> C_IrTy_IrTyInt
  | C_IrTy_IrTyStr -> C_IrTy_IrTyStr
  | C_IrTy_IrTyBool -> C_IrTy_IrTyBool
  | C_IrTy_IrTyFloat -> C_IrTy_IrTyFloat
  | C_IrTy_IrTyOpaque -> C_IrTy_IrTyOpaque
  | C_IrTy_IrTyArray (dtb__3) -> (C_IrTy_IrTyArray (((v_irTySubstVars args) dtb__3)))
  | C_IrTy_IrTyRef (dtb__4) -> (C_IrTy_IrTyRef (((v_irTySubstVars args) dtb__4)))
  | C_IrTy_IrTyData (dtb__5, dtb__6) -> (C_IrTy_IrTyData (dtb__5, ((B_dData_dList.v_map (fun (x : t_IrTy) -> ((v_irTySubstVars args) x))) dtb__6)))
  | C_IrTy_IrTyFun (dtb__7, dtb__8) -> (C_IrTy_IrTyFun (((v_irTySubstVars args) dtb__7), ((v_irTySubstVars args) dtb__8)))
  | _ -> failwith "DT: impossible branch"
))

# 75 "Vuna/Compiler/Ir/Model.vuna"
let v_irTyDataArgsOf = (fun (mc0 : t_IrTy B_dData_dMaybe.t_Maybe) -> (match mc0 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__9) -> (match dtb__9 with
  | C_IrTy_IrTyData (dtb__10, dtb__11) -> dtb__11
  | _ -> B_dData_dList.C_List_Nil
)
  | _ -> B_dData_dList.C_List_Nil
))

# 80 "Vuna/Compiler/Ir/Model.vuna"
let rec v_irTyAt = (fun (mc0 : t_IrTy B_dData_dList.t_List) (mc1 : int) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__12, dtb__13) -> (if (mc1 <= 0) then (B_dData_dMaybe.C_Maybe_Just (dtb__12)) else ((v_irTyAt dtb__13) (mc1 - 1)))
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 87 "Vuna/Compiler/Ir/Model.vuna"
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
# 99 "Vuna/Compiler/Ir/Model.vuna"
and v_allAnnotatableIrTys = (fun (mc0 : t_IrTy B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__21, dtb__22) -> (if (v_irTyAnnotatable dtb__21) then (v_allAnnotatableIrTys dtb__22) else false)
  | B_dData_dList.C_List_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

# 128 "Vuna/Compiler/Ir/Model.vuna"
let v_mkIrBinder = (fun (name : string) -> { f_IrBinder_irBinderName = (C_IrBName_IrBUser (name)); f_IrBinder_irBinderErased = false; f_IrBinder_irBinderTy = B_dData_dMaybe.C_Maybe_Nothing })

# 132 "Vuna/Compiler/Ir/Model.vuna"
let v_mkIrBinderTyped = (fun (name : string) (ty : t_IrTy) -> { f_IrBinder_irBinderName = (C_IrBName_IrBUser (name)); f_IrBinder_irBinderErased = false; f_IrBinder_irBinderTy = (B_dData_dMaybe.C_Maybe_Just (ty)) })

# 136 "Vuna/Compiler/Ir/Model.vuna"
let v_mkIrBinderErased = { f_IrBinder_irBinderName = C_IrBName_IrBWild; f_IrBinder_irBinderErased = true; f_IrBinder_irBinderTy = B_dData_dMaybe.C_Maybe_Nothing }

# 140 "Vuna/Compiler/Ir/Model.vuna"
let v_mkIrBinderArm = (fun (n : int) -> { f_IrBinder_irBinderName = (C_IrBName_IrBArm (n)); f_IrBinder_irBinderErased = false; f_IrBinder_irBinderTy = B_dData_dMaybe.C_Maybe_Nothing })

# 144 "Vuna/Compiler/Ir/Model.vuna"
let v_mkIrBinderNat = (fun (n : int) -> { f_IrBinder_irBinderName = (C_IrBName_IrBNat (n)); f_IrBinder_irBinderErased = false; f_IrBinder_irBinderTy = B_dData_dMaybe.C_Maybe_Nothing })

# 148 "Vuna/Compiler/Ir/Model.vuna"
let v_mkIrBinderWild = { f_IrBinder_irBinderName = C_IrBName_IrBWild; f_IrBinder_irBinderErased = false; f_IrBinder_irBinderTy = B_dData_dMaybe.C_Maybe_Nothing }

# 262 "Vuna/Compiler/Ir/Model.vuna"
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

# 230 "Vuna/Compiler/Ir/Model.vuna"
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

# 227 "Vuna/Compiler/Ir/Model.vuna"
let v_irResultTyOf = (fun (ir : t_Ir) -> ((v_irResultTyFuel 256) ir))

# 281 "Vuna/Compiler/Ir/Model.vuna"
let v_irEffTypeName = "Base.Effect.Core.Eff"

# 284 "Vuna/Compiler/Ir/Model.vuna"
let v_irEffMkCtor = "Base.Effect.Core.Eff.MkEff"

# 314 "Vuna/Compiler/Ir/Model.vuna"
let v_irDefName = (fun (mc0 : t_IrDef) -> (match mc0 with
  | C_IrDef_IrExternDef (dtb__66, dtb__67, dtb__68, dtb__69) -> dtb__66
  | C_IrDef_IrDef (dtb__70, dtb__71, dtb__72, dtb__73, dtb__74, dtb__75, dtb__76, dtb__77) -> dtb__70
  | _ -> failwith "DT: impossible branch"
))

# 318 "Vuna/Compiler/Ir/Model.vuna"
let v_irDefArity = (fun (mc0 : t_IrDef) -> (match mc0 with
  | C_IrDef_IrExternDef (dtb__78, dtb__79, dtb__80, dtb__81) -> 0
  | C_IrDef_IrDef (dtb__82, dtb__83, dtb__84, dtb__85, dtb__86, dtb__87, dtb__88, dtb__89) -> dtb__83
  | _ -> failwith "DT: impossible branch"
))

# 322 "Vuna/Compiler/Ir/Model.vuna"
let v_irDefDeps = (fun (mc0 : t_IrDef) -> (match mc0 with
  | C_IrDef_IrExternDef (dtb__90, dtb__91, dtb__92, dtb__93) -> B_dData_dList.C_List_Nil
  | C_IrDef_IrDef (dtb__94, dtb__95, dtb__96, dtb__97, dtb__98, dtb__99, dtb__100, dtb__101) -> dtb__96
  | _ -> failwith "DT: impossible branch"
))

# 326 "Vuna/Compiler/Ir/Model.vuna"
let v_irDefTy = (fun (mc0 : t_IrDef) -> (match mc0 with
  | C_IrDef_IrExternDef (dtb__102, dtb__103, dtb__104, dtb__105) -> (B_dData_dMaybe.C_Maybe_Just (dtb__103))
  | C_IrDef_IrDef (dtb__106, dtb__107, dtb__108, dtb__109, dtb__110, dtb__111, dtb__112, dtb__113) -> dtb__109
  | _ -> failwith "DT: impossible branch"
))

# 330 "Vuna/Compiler/Ir/Model.vuna"
let v_irDefBody = (fun (mc0 : t_IrDef) -> (match mc0 with
  | C_IrDef_IrExternDef (dtb__114, dtb__115, dtb__116, dtb__117) -> B_dData_dMaybe.C_Maybe_Nothing
  | C_IrDef_IrDef (dtb__118, dtb__119, dtb__120, dtb__121, dtb__122, dtb__123, dtb__124, dtb__125) -> (B_dData_dMaybe.C_Maybe_Just (dtb__122))
  | _ -> failwith "DT: impossible branch"
))

# 334 "Vuna/Compiler/Ir/Model.vuna"
let v_irDefExtern = (fun (mc0 : t_IrDef) -> (match mc0 with
  | C_IrDef_IrExternDef (dtb__126, dtb__127, dtb__128, dtb__129) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = dtb__127; B_dData_dPair.f_Pair_second = dtb__128 }))
  | C_IrDef_IrDef (dtb__130, dtb__131, dtb__132, dtb__133, dtb__134, dtb__135, dtb__136, dtb__137) -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 339 "Vuna/Compiler/Ir/Model.vuna"
let v_irDefRecValueOk = (fun (mc0 : t_IrDef) -> (match mc0 with
  | C_IrDef_IrExternDef (dtb__138, dtb__139, dtb__140, dtb__141) -> true
  | C_IrDef_IrDef (dtb__142, dtb__143, dtb__144, dtb__145, dtb__146, dtb__147, dtb__148, dtb__149) -> dtb__147
  | _ -> failwith "DT: impossible branch"
))

# 344 "Vuna/Compiler/Ir/Model.vuna"
let v_irDefInitGuard = (fun (mc0 : t_IrDef) -> (match mc0 with
  | C_IrDef_IrExternDef (dtb__150, dtb__151, dtb__152, dtb__153) -> false
  | C_IrDef_IrDef (dtb__154, dtb__155, dtb__156, dtb__157, dtb__158, dtb__159, dtb__160, dtb__161) -> dtb__160
  | _ -> failwith "DT: impossible branch"
))

# 348 "Vuna/Compiler/Ir/Model.vuna"
let v_irDefSpan = (fun (mc0 : t_IrDef) -> (match mc0 with
  | C_IrDef_IrExternDef (dtb__162, dtb__163, dtb__164, dtb__165) -> dtb__165
  | C_IrDef_IrDef (dtb__166, dtb__167, dtb__168, dtb__169, dtb__170, dtb__171, dtb__172, dtb__173) -> dtb__173
  | _ -> failwith "DT: impossible branch"
))

# 357 "Vuna/Compiler/Ir/Model.vuna"
let v_irGroupIsRec = (fun (mc0 : t_IrGroup) -> (match mc0 with
  | { f_IrGroup_irGroupIsRec = dtb__174; f_IrGroup_irGroupDefs = dtb__175 } -> dtb__174
  | _ -> failwith "DT: impossible branch"
))

# 360 "Vuna/Compiler/Ir/Model.vuna"
let v_irGroupDefs = (fun (mc0 : t_IrGroup) -> (match mc0 with
  | { f_IrGroup_irGroupIsRec = dtb__176; f_IrGroup_irGroupDefs = dtb__177 } -> dtb__177
  | _ -> failwith "DT: impossible branch"
))

# 419 "Vuna/Compiler/Ir/Model.vuna"
let rec v_irSharedUnboxedOf = (fun (mc0 : string) (mc1 : (string, (string, int) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__178, dtb__179) -> (if ((B_dData_dPair.v_firstOf dtb__178) = mc0) then (B_dData_dMaybe.C_Maybe_Just ((B_dData_dPair.v_secondOf dtb__178))) else ((v_irSharedUnboxedOf mc0) dtb__179))
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 424 "Vuna/Compiler/Ir/Model.vuna"
let rec v_irSharedCtorShapeOf = (fun (mc0 : string) (mc1 : (string, (string, bool B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__180, dtb__181) -> (if ((B_dData_dPair.v_firstOf dtb__180) = mc0) then (B_dData_dMaybe.C_Maybe_Just ((B_dData_dPair.v_secondOf dtb__180))) else ((v_irSharedCtorShapeOf mc0) dtb__181))
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 429 "Vuna/Compiler/Ir/Model.vuna"
let rec v_irSharedRecordFieldsOf = (fun (mc0 : string) (mc1 : (string, (int, string) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__182, dtb__183) -> (if ((B_dData_dPair.v_firstOf dtb__182) = mc0) then (B_dData_dPair.v_secondOf dtb__182) else ((v_irSharedRecordFieldsOf mc0) dtb__183))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 456 "Vuna/Compiler/Ir/Model.vuna"
let v_irInlineArity = (fun (mc0 : string) -> (if (mc0 = "+") then 2 else (if (mc0 = "-") then 2 else (if (mc0 = "*") then 2 else (if (mc0 = "/") then 2 else (if (mc0 = "&&") then 2 else (if (mc0 = "||") then 2 else (if (mc0 = "bitAnd") then 2 else (if (mc0 = "bitOr") then 2 else (if (mc0 = "bitXor") then 2 else (if (mc0 = "bitNot") then 1 else (if (mc0 = "bitShl") then 2 else (if (mc0 = "bitShr") then 2 else (if (mc0 = "++") then 2 else (if (mc0 = "bi_eq_int") then 2 else (if (mc0 = "bi_neq_int") then 2 else (if (mc0 = "effectId") then 1 else (if (mc0 = "bi_eq_str") then 2 else (if (mc0 = "bi_neq_str") then 2 else (if (mc0 = "bi_lt_int") then 2 else (if (mc0 = "bi_le_int") then 2 else (if (mc0 = "bi_gt_int") then 2 else (if (mc0 = "bi_ge_int") then 2 else (if (mc0 = "bi_lt_str") then 2 else (if (mc0 = "bi_le_str") then 2 else (if (mc0 = "bi_gt_str") then 2 else (if (mc0 = "bi_ge_str") then 2 else (if (mc0 = "bi_lt_bool") then 2 else (if (mc0 = "bi_le_bool") then 2 else (if (mc0 = "bi_gt_bool") then 2 else (if (mc0 = "bi_ge_bool") then 2 else (if (mc0 = "bi_add_float") then 2 else (if (mc0 = "bi_sub_float") then 2 else (if (mc0 = "bi_mul_float") then 2 else (if (mc0 = "bi_div_float") then 2 else (if (mc0 = "bi_eq_float") then 2 else (if (mc0 = "bi_neq_float") then 2 else (if (mc0 = "bi_lt_float") then 2 else (if (mc0 = "bi_le_float") then 2 else (if (mc0 = "bi_gt_float") then 2 else (if (mc0 = "bi_ge_float") then 2 else (if (mc0 = "@ir@m@runEff") then 2 else (if (mc0 = "natToInt") then 1 else (if (mc0 = "natFromInt") then 1 else (if (mc0 = "natAdd") then 2 else (if (mc0 = "natSub") then 2 else (if (mc0 = "natMul") then 2 else (if (mc0 = "natDiv") then 2 else 0))))))))))))))))))))))))))))))))))))))))))))))))

# 507 "Vuna/Compiler/Ir/Model.vuna"
let v_irListFamilyOf = (fun (mc0 : t_IrListFam) -> (match mc0 with
  | { f_IrListFam_irListFamily = dtb__184; f_IrListFam_irListNil = dtb__185; f_IrListFam_irListCons = dtb__186 } -> dtb__184
  | _ -> failwith "DT: impossible branch"
))

# 511 "Vuna/Compiler/Ir/Model.vuna"
let v_irListNilOf = (fun (mc0 : t_IrListFam) -> (match mc0 with
  | { f_IrListFam_irListFamily = dtb__187; f_IrListFam_irListNil = dtb__188; f_IrListFam_irListCons = dtb__189 } -> dtb__188
  | _ -> failwith "DT: impossible branch"
))

# 515 "Vuna/Compiler/Ir/Model.vuna"
let v_irListConsOf = (fun (mc0 : t_IrListFam) -> (match mc0 with
  | { f_IrListFam_irListFamily = dtb__190; f_IrListFam_irListNil = dtb__191; f_IrListFam_irListCons = dtb__192 } -> dtb__192
  | _ -> failwith "DT: impossible branch"
))

# 519 "Vuna/Compiler/Ir/Model.vuna"
let v_irAltCtorOf = (fun (mc0 : t_IrAlt) -> (match mc0 with
  | { f_IrAlt_irAltCtor = dtb__193; f_IrAlt_irAltBinders = dtb__194; f_IrAlt_irAltBody = dtb__195 } -> dtb__193
  | _ -> failwith "DT: impossible branch"
))

# 523 "Vuna/Compiler/Ir/Model.vuna"
let v_irAltBindersOf = (fun (mc0 : t_IrAlt) -> (match mc0 with
  | { f_IrAlt_irAltCtor = dtb__196; f_IrAlt_irAltBinders = dtb__197; f_IrAlt_irAltBody = dtb__198 } -> dtb__197
  | _ -> failwith "DT: impossible branch"
))

# 527 "Vuna/Compiler/Ir/Model.vuna"
let v_irAltBodyOf = (fun (mc0 : t_IrAlt) -> (match mc0 with
  | { f_IrAlt_irAltCtor = dtb__199; f_IrAlt_irAltBinders = dtb__200; f_IrAlt_irAltBody = dtb__201 } -> dtb__201
  | _ -> failwith "DT: impossible branch"
))

# 531 "Vuna/Compiler/Ir/Model.vuna"
let v_irEntryShowOf = (fun (mc0 : t_IrEntry) -> (match mc0 with
  | { f_IrEntry_irEntryShow = dtb__202; f_IrEntry_irEntryMain = dtb__203; f_IrEntry_irEntryIsAction = dtb__204; f_IrEntry_irEntryRunMain = dtb__205; f_IrEntry_irEntryHandlers = dtb__206; f_IrEntry_irEntryRowTags = dtb__207 } -> dtb__202
  | _ -> failwith "DT: impossible branch"
))

# 535 "Vuna/Compiler/Ir/Model.vuna"
let v_irEntryMainOf = (fun (mc0 : t_IrEntry) -> (match mc0 with
  | { f_IrEntry_irEntryShow = dtb__208; f_IrEntry_irEntryMain = dtb__209; f_IrEntry_irEntryIsAction = dtb__210; f_IrEntry_irEntryRunMain = dtb__211; f_IrEntry_irEntryHandlers = dtb__212; f_IrEntry_irEntryRowTags = dtb__213 } -> dtb__209
  | _ -> failwith "DT: impossible branch"
))

# 539 "Vuna/Compiler/Ir/Model.vuna"
let v_irEntryIsActionOf = (fun (mc0 : t_IrEntry) -> (match mc0 with
  | { f_IrEntry_irEntryShow = dtb__214; f_IrEntry_irEntryMain = dtb__215; f_IrEntry_irEntryIsAction = dtb__216; f_IrEntry_irEntryRunMain = dtb__217; f_IrEntry_irEntryHandlers = dtb__218; f_IrEntry_irEntryRowTags = dtb__219 } -> dtb__216
  | _ -> failwith "DT: impossible branch"
))

# 543 "Vuna/Compiler/Ir/Model.vuna"
let v_irEntryRunMainOf = (fun (mc0 : t_IrEntry) -> (match mc0 with
  | { f_IrEntry_irEntryShow = dtb__220; f_IrEntry_irEntryMain = dtb__221; f_IrEntry_irEntryIsAction = dtb__222; f_IrEntry_irEntryRunMain = dtb__223; f_IrEntry_irEntryHandlers = dtb__224; f_IrEntry_irEntryRowTags = dtb__225 } -> dtb__223
  | _ -> failwith "DT: impossible branch"
))

# 547 "Vuna/Compiler/Ir/Model.vuna"
let v_irEntryHandlersOf = (fun (mc0 : t_IrEntry) -> (match mc0 with
  | { f_IrEntry_irEntryShow = dtb__226; f_IrEntry_irEntryMain = dtb__227; f_IrEntry_irEntryIsAction = dtb__228; f_IrEntry_irEntryRunMain = dtb__229; f_IrEntry_irEntryHandlers = dtb__230; f_IrEntry_irEntryRowTags = dtb__231 } -> dtb__230
  | _ -> failwith "DT: impossible branch"
))

# 551 "Vuna/Compiler/Ir/Model.vuna"
let v_irEntryRowTagsOf = (fun (mc0 : t_IrEntry) -> (match mc0 with
  | { f_IrEntry_irEntryShow = dtb__232; f_IrEntry_irEntryMain = dtb__233; f_IrEntry_irEntryIsAction = dtb__234; f_IrEntry_irEntryRunMain = dtb__235; f_IrEntry_irEntryHandlers = dtb__236; f_IrEntry_irEntryRowTags = dtb__237 } -> dtb__237
  | _ -> failwith "DT: impossible branch"
))

# 555 "Vuna/Compiler/Ir/Model.vuna"
let v_irProgSharedOf = (fun (mc0 : t_IrProgram) -> (match mc0 with
  | { f_IrProgram_irProgShared = dtb__238; f_IrProgram_irProgUnit = dtb__239 } -> dtb__238
  | _ -> failwith "DT: impossible branch"
))

# 559 "Vuna/Compiler/Ir/Model.vuna"
let v_irProgUnitOf = (fun (mc0 : t_IrProgram) -> (match mc0 with
  | { f_IrProgram_irProgShared = dtb__240; f_IrProgram_irProgUnit = dtb__241 } -> dtb__241
  | _ -> failwith "DT: impossible branch"
))

# 566 "Vuna/Compiler/Ir/Model.vuna"
let rec v_irSize = (fun (mc0 : t_Ir) -> (match mc0 with
  | C_Ir_IrTail (dtb__242) -> (v_irSize dtb__242)
  | _ -> (1 + (v_irSizeChildren mc0))
))
# 570 "Vuna/Compiler/Ir/Model.vuna"
and v_irSizeChildren = (fun (ir : t_Ir) -> (match ir with
  | C_Ir_IrCtor (dtb__243, dtb__244, dtb__245, dtb__246) -> (v_irSizeList dtb__246)
  | C_Ir_IrRecord (dtb__247, dtb__248, dtb__249) -> (v_irSizeFields dtb__249)
  | C_Ir_IrProj (dtb__250, dtb__251, dtb__252, dtb__253) -> (v_irSize dtb__250)
  | C_Ir_IrRecUpd (dtb__254, dtb__255, dtb__256, dtb__257) -> ((v_irSize dtb__254) + (v_irSizeFields dtb__256))
  | C_Ir_IrRtApp (dtb__258, dtb__259) -> (v_irSizeList dtb__259)
  | C_Ir_IrCast (dtb__260, dtb__261, dtb__262) -> (v_irSize dtb__262)
  | C_Ir_IrLet (dtb__263, dtb__264, dtb__265) -> ((v_irSize dtb__264) + (v_irSize dtb__265))
  | C_Ir_IrLam (dtb__266, dtb__267, dtb__268) -> (v_irSize dtb__268)
  | C_Ir_IrApp (dtb__269, dtb__270, dtb__271) -> ((v_irSize dtb__270) + (v_irSize dtb__271))
  | C_Ir_IrTail (dtb__272) -> (v_irSize dtb__272)
  | C_Ir_IrIf (dtb__273, dtb__274, dtb__275) -> (((v_irSize dtb__273) + (v_irSize dtb__274)) + (v_irSize dtb__275))
  | C_Ir_IrCase (dtb__276, dtb__277, dtb__278, dtb__279) -> ((v_irSize dtb__278) + (v_irSizeAlts dtb__279))
  | C_Ir_IrNatCase (dtb__280, dtb__281, dtb__282, dtb__283, dtb__284) -> ((((v_irSize dtb__280) + (v_irSizeAlt dtb__282)) + (v_irSizeAlt dtb__283)) + (v_irSizeAlt dtb__284))
  | C_Ir_IrConcatMany (dtb__285) -> (v_irSizeList dtb__285)
  | C_Ir_IrEffThunk (dtb__286, dtb__287, dtb__288, dtb__289, dtb__290) -> (v_irSize dtb__290)
  | _ -> 0
))
# 591 "Vuna/Compiler/Ir/Model.vuna"
and v_irSizeList = (fun (mc0 : t_Ir B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__291, dtb__292) -> ((v_irSize dtb__291) + (v_irSizeList dtb__292))
  | B_dData_dList.C_List_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))
# 595 "Vuna/Compiler/Ir/Model.vuna"
and v_irSizeFields = (fun (mc0 : (string, t_Ir) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__293, dtb__294) -> (match dtb__293 with
  | { B_dData_dPair.f_Pair_first = dtb__295; B_dData_dPair.f_Pair_second = dtb__296 } -> ((v_irSize dtb__296) + (v_irSizeFields dtb__294))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))
# 599 "Vuna/Compiler/Ir/Model.vuna"
and v_irSizeAlts = (fun (mc0 : t_IrAlt B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__297, dtb__298) -> ((v_irSize (v_irAltBodyOf dtb__297)) + (v_irSizeAlts dtb__298))
  | B_dData_dList.C_List_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))
# 603 "Vuna/Compiler/Ir/Model.vuna"
and v_irSizeAlt = (fun (mc0 : t_IrAlt B_dData_dMaybe.t_Maybe) -> (match mc0 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__299) -> (v_irSize (v_irAltBodyOf dtb__299))
  | B_dData_dMaybe.C_Maybe_Nothing -> 0
  | _ -> failwith "DT: impossible branch"
))
