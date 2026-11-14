open Vuna_runtime
type t_Vuna_dCompiler_dIr_dModel_dIrTy = C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyVar of (int) | C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyInt | C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyStr | C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyBool | C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyFloat | C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyOpaque | C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyArray of (t_Vuna_dCompiler_dIr_dModel_dIrTy) | C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyRef of (t_Vuna_dCompiler_dIr_dModel_dIrTy) | C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyData of (string) * (t_Vuna_dCompiler_dIr_dModel_dIrTy Base_dList.t_Base_dList_dList) | C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyFun of (t_Vuna_dCompiler_dIr_dModel_dIrTy) * (t_Vuna_dCompiler_dIr_dModel_dIrTy)
and t_Vuna_dCompiler_dIr_dModel_dIrBName = C_Vuna_dCompiler_dIr_dModel_dIrBName_IrBUser of (string) | C_Vuna_dCompiler_dIr_dModel_dIrBName_IrBArm of (int) | C_Vuna_dCompiler_dIr_dModel_dIrBName_IrBNat of (int) | C_Vuna_dCompiler_dIr_dModel_dIrBName_IrBWild
and t_Vuna_dCompiler_dIr_dModel_dIrBinder = { f_Vuna_dCompiler_dIr_dModel_dIrBinder_irBinderName : t_Vuna_dCompiler_dIr_dModel_dIrBName; f_Vuna_dCompiler_dIr_dModel_dIrBinder_irBinderErased : bool }
and t_Vuna_dCompiler_dIr_dModel_dIrAlt = { f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltCtor : (string, string) Base_dPair.t_Base_dPair_dPair Base_dMaybe.t_Base_dMaybe_dMaybe; f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBinders : t_Vuna_dCompiler_dIr_dModel_dIrBinder Base_dList.t_Base_dList_dList; f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBody : t_Vuna_dCompiler_dIr_dModel_dIr }
and t_Vuna_dCompiler_dIr_dModel_dIr = C_Vuna_dCompiler_dIr_dModel_dIr_IrVar of (t_Vuna_dCompiler_dIr_dModel_dIrBinder) | C_Vuna_dCompiler_dIr_dModel_dIr_IrGlobal of (string) | C_Vuna_dCompiler_dIr_dModel_dIr_IrCtor of (string) * (string) * (t_Vuna_dCompiler_dIr_dModel_dIr Base_dList.t_Base_dList_dList) | C_Vuna_dCompiler_dIr_dModel_dIr_IrRecord of (string) * ((string, t_Vuna_dCompiler_dIr_dModel_dIr) Base_dPair.t_Base_dPair_dPair Base_dList.t_Base_dList_dList) | C_Vuna_dCompiler_dIr_dModel_dIr_IrProj of (t_Vuna_dCompiler_dIr_dModel_dIr) * (string) * (string) | C_Vuna_dCompiler_dIr_dModel_dIr_IrRecUpd of (t_Vuna_dCompiler_dIr_dModel_dIr) * (string) * ((string, t_Vuna_dCompiler_dIr_dModel_dIr) Base_dPair.t_Base_dPair_dPair Base_dList.t_Base_dList_dList) | C_Vuna_dCompiler_dIr_dModel_dIr_IrRt of (string) | C_Vuna_dCompiler_dIr_dModel_dIr_IrRtApp of (string) * (t_Vuna_dCompiler_dIr_dModel_dIr Base_dList.t_Base_dList_dList) | C_Vuna_dCompiler_dIr_dModel_dIr_IrCast of (t_Vuna_dCompiler_dIr_dModel_dIr) | C_Vuna_dCompiler_dIr_dModel_dIr_IrInt of (int) | C_Vuna_dCompiler_dIr_dModel_dIr_IrStr of (string) | C_Vuna_dCompiler_dIr_dModel_dIr_IrBool of (bool) | C_Vuna_dCompiler_dIr_dModel_dIr_IrFloatLit of (string) | C_Vuna_dCompiler_dIr_dModel_dIr_IrLet of (t_Vuna_dCompiler_dIr_dModel_dIrBinder Base_dList.t_Base_dList_dList) * (t_Vuna_dCompiler_dIr_dModel_dIr) * (t_Vuna_dCompiler_dIr_dModel_dIr) | C_Vuna_dCompiler_dIr_dModel_dIr_IrLam of (t_Vuna_dCompiler_dIr_dModel_dIrBinder Base_dList.t_Base_dList_dList) * (t_Vuna_dCompiler_dIr_dModel_dIr) | C_Vuna_dCompiler_dIr_dModel_dIr_IrApp of (t_Vuna_dCompiler_dIr_dModel_dIr) * (t_Vuna_dCompiler_dIr_dModel_dIr) | C_Vuna_dCompiler_dIr_dModel_dIr_IrIf of (t_Vuna_dCompiler_dIr_dModel_dIr) * (t_Vuna_dCompiler_dIr_dModel_dIr) * (t_Vuna_dCompiler_dIr_dModel_dIr) | C_Vuna_dCompiler_dIr_dModel_dIr_IrCase of (t_Vuna_dCompiler_dIr_dModel_dIr) * (t_Vuna_dCompiler_dIr_dModel_dIrAlt Base_dList.t_Base_dList_dList) | C_Vuna_dCompiler_dIr_dModel_dIr_IrNatCase of (t_Vuna_dCompiler_dIr_dModel_dIr) * (int) * (t_Vuna_dCompiler_dIr_dModel_dIrAlt Base_dMaybe.t_Base_dMaybe_dMaybe) * (t_Vuna_dCompiler_dIr_dModel_dIrAlt Base_dMaybe.t_Base_dMaybe_dMaybe) * (t_Vuna_dCompiler_dIr_dModel_dIrAlt Base_dMaybe.t_Base_dMaybe_dMaybe) | C_Vuna_dCompiler_dIr_dModel_dIr_IrConcatMany of (t_Vuna_dCompiler_dIr_dModel_dIr Base_dList.t_Base_dList_dList) | C_Vuna_dCompiler_dIr_dModel_dIr_IrEffThunk of (string) * (string) * (t_Vuna_dCompiler_dIr_dModel_dIrTy) * (int) * (t_Vuna_dCompiler_dIr_dModel_dIr) | C_Vuna_dCompiler_dIr_dModel_dIr_IrEffBind of (string) * (string) * (t_Vuna_dCompiler_dIr_dModel_dIrTy)
and t_Vuna_dCompiler_dIr_dModel_dIrTyDecl = C_Vuna_dCompiler_dIr_dModel_dIrTyDecl_IrVariantDecl of (string) * (int) * ((string, t_Vuna_dCompiler_dIr_dModel_dIrTy Base_dList.t_Base_dList_dList) Base_dPair.t_Base_dPair_dPair Base_dList.t_Base_dList_dList) | C_Vuna_dCompiler_dIr_dModel_dIrTyDecl_IrRecordDecl of (string) * (int) * ((int, string) Base_dPair.t_Base_dPair_dPair Base_dList.t_Base_dList_dList) * (t_Vuna_dCompiler_dIr_dModel_dIrTy Base_dList.t_Base_dList_dList) | C_Vuna_dCompiler_dIr_dModel_dIrTyDecl_IrUnboxedDecl of (string) * (int) * (t_Vuna_dCompiler_dIr_dModel_dIrTy)
and t_Vuna_dCompiler_dIr_dModel_dIrDef = C_Vuna_dCompiler_dIr_dModel_dIrDef_IrDef of (string) * (int) * (string Base_dList.t_Base_dList_dList) * (t_Vuna_dCompiler_dIr_dModel_dIr) * (bool) * (bool) * (Vuna_dCompiler_dSource.t_Vuna_dCompiler_dSource_dSpan Base_dMaybe.t_Base_dMaybe_dMaybe) | C_Vuna_dCompiler_dIr_dModel_dIrDef_IrExternDef of (string) * (t_Vuna_dCompiler_dIr_dModel_dIrTy) * (string) * (Vuna_dCompiler_dSource.t_Vuna_dCompiler_dSource_dSpan Base_dMaybe.t_Base_dMaybe_dMaybe)
and t_Vuna_dCompiler_dIr_dModel_dIrGroup = { f_Vuna_dCompiler_dIr_dModel_dIrGroup_irGroupIsRec : bool; f_Vuna_dCompiler_dIr_dModel_dIrGroup_irGroupDefs : t_Vuna_dCompiler_dIr_dModel_dIrDef Base_dList.t_Base_dList_dList }
and t_Vuna_dCompiler_dIr_dModel_dIrEntry = { f_Vuna_dCompiler_dIr_dModel_dIrEntry_irEntryShow : t_Vuna_dCompiler_dIr_dModel_dIr; f_Vuna_dCompiler_dIr_dModel_dIrEntry_irEntryMain : string; f_Vuna_dCompiler_dIr_dModel_dIrEntry_irEntryIsAction : bool; f_Vuna_dCompiler_dIr_dModel_dIrEntry_irEntryRunMain : string Base_dMaybe.t_Base_dMaybe_dMaybe; f_Vuna_dCompiler_dIr_dModel_dIrEntry_irEntryHandlers : string Base_dList.t_Base_dList_dList }
and t_Vuna_dCompiler_dIr_dModel_dIrListFam = { f_Vuna_dCompiler_dIr_dModel_dIrListFam_irListFamily : string; f_Vuna_dCompiler_dIr_dModel_dIrListFam_irListNil : string; f_Vuna_dCompiler_dIr_dModel_dIrListFam_irListCons : string }
and t_Vuna_dCompiler_dIr_dModel_dIrShared = { f_Vuna_dCompiler_dIr_dModel_dIrShared_irSharedRecordFields : (string, (int, string) Base_dPair.t_Base_dPair_dPair Base_dList.t_Base_dList_dList) Base_dPair.t_Base_dPair_dPair Base_dList.t_Base_dList_dList; f_Vuna_dCompiler_dIr_dModel_dIrShared_irSharedListFam : t_Vuna_dCompiler_dIr_dModel_dIrListFam Base_dMaybe.t_Base_dMaybe_dMaybe; f_Vuna_dCompiler_dIr_dModel_dIrShared_irSharedUsesFloat : bool; f_Vuna_dCompiler_dIr_dModel_dIrShared_irSharedUsesTrace : bool; f_Vuna_dCompiler_dIr_dModel_dIrShared_irSharedUsesObs : bool; f_Vuna_dCompiler_dIr_dModel_dIrShared_irSharedCtors : (string, (string, bool Base_dList.t_Base_dList_dList) Base_dPair.t_Base_dPair_dPair) Base_dPair.t_Base_dPair_dPair Base_dList.t_Base_dList_dList; f_Vuna_dCompiler_dIr_dModel_dIrShared_irSharedCtorOpaques : (string, bool Base_dList.t_Base_dList_dList) Base_dPair.t_Base_dPair_dPair Base_dList.t_Base_dList_dList; f_Vuna_dCompiler_dIr_dModel_dIrShared_irSharedUnboxed : string Base_dList.t_Base_dList_dList; f_Vuna_dCompiler_dIr_dModel_dIrShared_irSharedTyParams : (string, int Base_dList.t_Base_dList_dList) Base_dPair.t_Base_dPair_dPair Base_dList.t_Base_dList_dList; f_Vuna_dCompiler_dIr_dModel_dIrShared_irSharedDefLocs : (string, (string, int) Base_dPair.t_Base_dPair_dPair) Base_dPair.t_Base_dPair_dPair Base_dList.t_Base_dList_dList }
and t_Vuna_dCompiler_dIr_dModel_dIrUnit = { f_Vuna_dCompiler_dIr_dModel_dIrUnit_irUnitTyDecls : t_Vuna_dCompiler_dIr_dModel_dIrTyDecl Base_dList.t_Base_dList_dList; f_Vuna_dCompiler_dIr_dModel_dIrUnit_irUnitGroups : t_Vuna_dCompiler_dIr_dModel_dIrGroup Base_dList.t_Base_dList_dList; f_Vuna_dCompiler_dIr_dModel_dIrUnit_irUnitHasListFamily : bool; f_Vuna_dCompiler_dIr_dModel_dIrUnit_irUnitTypeRefs : string Base_dList.t_Base_dList_dList; f_Vuna_dCompiler_dIr_dModel_dIrUnit_irUnitEntry : t_Vuna_dCompiler_dIr_dModel_dIrEntry Base_dMaybe.t_Base_dMaybe_dMaybe }
and t_Vuna_dCompiler_dIr_dModel_dIrProgram = { f_Vuna_dCompiler_dIr_dModel_dIrProgram_irProgShared : t_Vuna_dCompiler_dIr_dModel_dIrShared; f_Vuna_dCompiler_dIr_dModel_dIrProgram_irProgUnit : t_Vuna_dCompiler_dIr_dModel_dIrUnit }

# 83 "Vuna/Compiler/Ir/Model.vuna"
let v_Vuna_dCompiler_dIr_dModel_dmkIrBinder = (fun name -> { f_Vuna_dCompiler_dIr_dModel_dIrBinder_irBinderName = (C_Vuna_dCompiler_dIr_dModel_dIrBName_IrBUser (name)); f_Vuna_dCompiler_dIr_dModel_dIrBinder_irBinderErased = false })

# 87 "Vuna/Compiler/Ir/Model.vuna"
let v_Vuna_dCompiler_dIr_dModel_dmkIrBinderErased = { f_Vuna_dCompiler_dIr_dModel_dIrBinder_irBinderName = C_Vuna_dCompiler_dIr_dModel_dIrBName_IrBWild; f_Vuna_dCompiler_dIr_dModel_dIrBinder_irBinderErased = true }

# 91 "Vuna/Compiler/Ir/Model.vuna"
let v_Vuna_dCompiler_dIr_dModel_dmkIrBinderArm = (fun n -> { f_Vuna_dCompiler_dIr_dModel_dIrBinder_irBinderName = (C_Vuna_dCompiler_dIr_dModel_dIrBName_IrBArm (n)); f_Vuna_dCompiler_dIr_dModel_dIrBinder_irBinderErased = false })

# 95 "Vuna/Compiler/Ir/Model.vuna"
let v_Vuna_dCompiler_dIr_dModel_dmkIrBinderNat = (fun n -> { f_Vuna_dCompiler_dIr_dModel_dIrBinder_irBinderName = (C_Vuna_dCompiler_dIr_dModel_dIrBName_IrBNat (n)); f_Vuna_dCompiler_dIr_dModel_dIrBinder_irBinderErased = false })

# 99 "Vuna/Compiler/Ir/Model.vuna"
let v_Vuna_dCompiler_dIr_dModel_dmkIrBinderWild = { f_Vuna_dCompiler_dIr_dModel_dIrBinder_irBinderName = C_Vuna_dCompiler_dIr_dModel_dIrBName_IrBWild; f_Vuna_dCompiler_dIr_dModel_dIrBinder_irBinderErased = false }

# 194 "Vuna/Compiler/Ir/Model.vuna"
let v_Vuna_dCompiler_dIr_dModel_dirDefName = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dIr_dModel_dIrDef_IrExternDef (dtb__0, dtb__1, dtb__2, dtb__3) -> dtb__0
  | C_Vuna_dCompiler_dIr_dModel_dIrDef_IrDef (dtb__4, dtb__5, dtb__6, dtb__7, dtb__8, dtb__9, dtb__10) -> dtb__4
  | _ -> failwith "DT: impossible branch"
))

# 198 "Vuna/Compiler/Ir/Model.vuna"
let v_Vuna_dCompiler_dIr_dModel_dirDefArity = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dIr_dModel_dIrDef_IrExternDef (dtb__11, dtb__12, dtb__13, dtb__14) -> 0
  | C_Vuna_dCompiler_dIr_dModel_dIrDef_IrDef (dtb__15, dtb__16, dtb__17, dtb__18, dtb__19, dtb__20, dtb__21) -> dtb__16
  | _ -> failwith "DT: impossible branch"
))

# 202 "Vuna/Compiler/Ir/Model.vuna"
let v_Vuna_dCompiler_dIr_dModel_dirDefDeps = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dIr_dModel_dIrDef_IrExternDef (dtb__22, dtb__23, dtb__24, dtb__25) -> Base_dList.C_Base_dList_dList_Nil
  | C_Vuna_dCompiler_dIr_dModel_dIrDef_IrDef (dtb__26, dtb__27, dtb__28, dtb__29, dtb__30, dtb__31, dtb__32) -> dtb__28
  | _ -> failwith "DT: impossible branch"
))

# 206 "Vuna/Compiler/Ir/Model.vuna"
let v_Vuna_dCompiler_dIr_dModel_dirDefBody = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dIr_dModel_dIrDef_IrExternDef (dtb__33, dtb__34, dtb__35, dtb__36) -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | C_Vuna_dCompiler_dIr_dModel_dIrDef_IrDef (dtb__37, dtb__38, dtb__39, dtb__40, dtb__41, dtb__42, dtb__43) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__40))
  | _ -> failwith "DT: impossible branch"
))

# 210 "Vuna/Compiler/Ir/Model.vuna"
let v_Vuna_dCompiler_dIr_dModel_dirDefExtern = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dIr_dModel_dIrDef_IrExternDef (dtb__44, dtb__45, dtb__46, dtb__47) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Base_dPair.f_Base_dPair_dPair_first = dtb__45; Base_dPair.f_Base_dPair_dPair_second = dtb__46 }))
  | C_Vuna_dCompiler_dIr_dModel_dIrDef_IrDef (dtb__48, dtb__49, dtb__50, dtb__51, dtb__52, dtb__53, dtb__54) -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 215 "Vuna/Compiler/Ir/Model.vuna"
let v_Vuna_dCompiler_dIr_dModel_dirDefRecValueOk = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dIr_dModel_dIrDef_IrExternDef (dtb__55, dtb__56, dtb__57, dtb__58) -> true
  | C_Vuna_dCompiler_dIr_dModel_dIrDef_IrDef (dtb__59, dtb__60, dtb__61, dtb__62, dtb__63, dtb__64, dtb__65) -> dtb__63
  | _ -> failwith "DT: impossible branch"
))

# 220 "Vuna/Compiler/Ir/Model.vuna"
let v_Vuna_dCompiler_dIr_dModel_dirDefInitGuard = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dIr_dModel_dIrDef_IrExternDef (dtb__66, dtb__67, dtb__68, dtb__69) -> false
  | C_Vuna_dCompiler_dIr_dModel_dIrDef_IrDef (dtb__70, dtb__71, dtb__72, dtb__73, dtb__74, dtb__75, dtb__76) -> dtb__75
  | _ -> failwith "DT: impossible branch"
))

# 224 "Vuna/Compiler/Ir/Model.vuna"
let v_Vuna_dCompiler_dIr_dModel_dirDefSpan = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dIr_dModel_dIrDef_IrExternDef (dtb__77, dtb__78, dtb__79, dtb__80) -> dtb__80
  | C_Vuna_dCompiler_dIr_dModel_dIrDef_IrDef (dtb__81, dtb__82, dtb__83, dtb__84, dtb__85, dtb__86, dtb__87) -> dtb__87
  | _ -> failwith "DT: impossible branch"
))

# 233 "Vuna/Compiler/Ir/Model.vuna"
let v_Vuna_dCompiler_dIr_dModel_dirGroupIsRec = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dIr_dModel_dIrGroup_irGroupIsRec = dtb__88; f_Vuna_dCompiler_dIr_dModel_dIrGroup_irGroupDefs = dtb__89 } -> dtb__88
  | _ -> failwith "DT: impossible branch"
))

# 236 "Vuna/Compiler/Ir/Model.vuna"
let v_Vuna_dCompiler_dIr_dModel_dirGroupDefs = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dIr_dModel_dIrGroup_irGroupIsRec = dtb__90; f_Vuna_dCompiler_dIr_dModel_dIrGroup_irGroupDefs = dtb__91 } -> dtb__91
  | _ -> failwith "DT: impossible branch"
))

# 296 "Vuna/Compiler/Ir/Model.vuna"
let rec v_Vuna_dCompiler_dIr_dModel_dirSharedRecordFieldsOf = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__92, dtb__93) -> (if ((Base_dPair.v_Base_dPair_dfirstOf dtb__92) = mc0) then (Base_dPair.v_Base_dPair_dsecondOf dtb__92) else ((v_Vuna_dCompiler_dIr_dModel_dirSharedRecordFieldsOf mc0) dtb__93))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 306 "Vuna/Compiler/Ir/Model.vuna"
let rec v_Vuna_dCompiler_dIr_dModel_dirSharedCtorFamilyGo = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__94, dtb__95) -> (if ((Base_dPair.v_Base_dPair_dfirstOf dtb__94) = mc0) then (Base_dPair.v_Base_dPair_dfirstOf (Base_dPair.v_Base_dPair_dsecondOf dtb__94)) else ((v_Vuna_dCompiler_dIr_dModel_dirSharedCtorFamilyGo mc0) dtb__95))
  | Base_dList.C_Base_dList_dList_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))

# 302 "Vuna/Compiler/Ir/Model.vuna"
let v_Vuna_dCompiler_dIr_dModel_dirSharedCtorFamily = (fun mc0 mc1 -> (match mc0 with
  | { f_Vuna_dCompiler_dIr_dModel_dIrShared_irSharedRecordFields = dtb__96; f_Vuna_dCompiler_dIr_dModel_dIrShared_irSharedListFam = dtb__97; f_Vuna_dCompiler_dIr_dModel_dIrShared_irSharedUsesFloat = dtb__98; f_Vuna_dCompiler_dIr_dModel_dIrShared_irSharedUsesTrace = dtb__99; f_Vuna_dCompiler_dIr_dModel_dIrShared_irSharedUsesObs = dtb__100; f_Vuna_dCompiler_dIr_dModel_dIrShared_irSharedCtors = dtb__101; f_Vuna_dCompiler_dIr_dModel_dIrShared_irSharedCtorOpaques = dtb__102; f_Vuna_dCompiler_dIr_dModel_dIrShared_irSharedUnboxed = dtb__103; f_Vuna_dCompiler_dIr_dModel_dIrShared_irSharedTyParams = dtb__104; f_Vuna_dCompiler_dIr_dModel_dIrShared_irSharedDefLocs = dtb__105 } -> ((v_Vuna_dCompiler_dIr_dModel_dirSharedCtorFamilyGo mc1) dtb__101)
  | _ -> failwith "DT: impossible branch"
))

# 316 "Vuna/Compiler/Ir/Model.vuna"
let rec v_Vuna_dCompiler_dIr_dModel_dirSharedCtorKeepFlagsGo = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__106, dtb__107) -> (if ((Base_dPair.v_Base_dPair_dfirstOf dtb__106) = mc0) then (Base_dPair.v_Base_dPair_dsecondOf (Base_dPair.v_Base_dPair_dsecondOf dtb__106)) else ((v_Vuna_dCompiler_dIr_dModel_dirSharedCtorKeepFlagsGo mc0) dtb__107))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 312 "Vuna/Compiler/Ir/Model.vuna"
let v_Vuna_dCompiler_dIr_dModel_dirSharedCtorKeepFlags = (fun mc0 mc1 -> (match mc0 with
  | { f_Vuna_dCompiler_dIr_dModel_dIrShared_irSharedRecordFields = dtb__108; f_Vuna_dCompiler_dIr_dModel_dIrShared_irSharedListFam = dtb__109; f_Vuna_dCompiler_dIr_dModel_dIrShared_irSharedUsesFloat = dtb__110; f_Vuna_dCompiler_dIr_dModel_dIrShared_irSharedUsesTrace = dtb__111; f_Vuna_dCompiler_dIr_dModel_dIrShared_irSharedUsesObs = dtb__112; f_Vuna_dCompiler_dIr_dModel_dIrShared_irSharedCtors = dtb__113; f_Vuna_dCompiler_dIr_dModel_dIrShared_irSharedCtorOpaques = dtb__114; f_Vuna_dCompiler_dIr_dModel_dIrShared_irSharedUnboxed = dtb__115; f_Vuna_dCompiler_dIr_dModel_dIrShared_irSharedTyParams = dtb__116; f_Vuna_dCompiler_dIr_dModel_dIrShared_irSharedDefLocs = dtb__117 } -> ((v_Vuna_dCompiler_dIr_dModel_dirSharedCtorKeepFlagsGo mc1) dtb__113)
  | _ -> failwith "DT: impossible branch"
))

# 326 "Vuna/Compiler/Ir/Model.vuna"
let rec v_Vuna_dCompiler_dIr_dModel_dirSharedCtorOpaqueFlagsGo = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__118, dtb__119) -> (if ((Base_dPair.v_Base_dPair_dfirstOf dtb__118) = mc0) then (Base_dPair.v_Base_dPair_dsecondOf dtb__118) else ((v_Vuna_dCompiler_dIr_dModel_dirSharedCtorOpaqueFlagsGo mc0) dtb__119))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 322 "Vuna/Compiler/Ir/Model.vuna"
let v_Vuna_dCompiler_dIr_dModel_dirSharedCtorOpaqueFlags = (fun mc0 mc1 -> (match mc0 with
  | { f_Vuna_dCompiler_dIr_dModel_dIrShared_irSharedRecordFields = dtb__120; f_Vuna_dCompiler_dIr_dModel_dIrShared_irSharedListFam = dtb__121; f_Vuna_dCompiler_dIr_dModel_dIrShared_irSharedUsesFloat = dtb__122; f_Vuna_dCompiler_dIr_dModel_dIrShared_irSharedUsesTrace = dtb__123; f_Vuna_dCompiler_dIr_dModel_dIrShared_irSharedUsesObs = dtb__124; f_Vuna_dCompiler_dIr_dModel_dIrShared_irSharedCtors = dtb__125; f_Vuna_dCompiler_dIr_dModel_dIrShared_irSharedCtorOpaques = dtb__126; f_Vuna_dCompiler_dIr_dModel_dIrShared_irSharedUnboxed = dtb__127; f_Vuna_dCompiler_dIr_dModel_dIrShared_irSharedTyParams = dtb__128; f_Vuna_dCompiler_dIr_dModel_dIrShared_irSharedDefLocs = dtb__129 } -> ((v_Vuna_dCompiler_dIr_dModel_dirSharedCtorOpaqueFlagsGo mc1) dtb__126)
  | _ -> failwith "DT: impossible branch"
))

# 332 "Vuna/Compiler/Ir/Model.vuna"
let v_Vuna_dCompiler_dIr_dModel_dirSharedIsUnboxed = (fun mc0 mc1 -> (match mc0 with
  | { f_Vuna_dCompiler_dIr_dModel_dIrShared_irSharedRecordFields = dtb__130; f_Vuna_dCompiler_dIr_dModel_dIrShared_irSharedListFam = dtb__131; f_Vuna_dCompiler_dIr_dModel_dIrShared_irSharedUsesFloat = dtb__132; f_Vuna_dCompiler_dIr_dModel_dIrShared_irSharedUsesTrace = dtb__133; f_Vuna_dCompiler_dIr_dModel_dIrShared_irSharedUsesObs = dtb__134; f_Vuna_dCompiler_dIr_dModel_dIrShared_irSharedCtors = dtb__135; f_Vuna_dCompiler_dIr_dModel_dIrShared_irSharedCtorOpaques = dtb__136; f_Vuna_dCompiler_dIr_dModel_dIrShared_irSharedUnboxed = dtb__137; f_Vuna_dCompiler_dIr_dModel_dIrShared_irSharedTyParams = dtb__138; f_Vuna_dCompiler_dIr_dModel_dIrShared_irSharedDefLocs = dtb__139 } -> ((Base_dList.v_Base_dList_dmemName mc1) dtb__137)
  | _ -> failwith "DT: impossible branch"
))

# 341 "Vuna/Compiler/Ir/Model.vuna"
let rec v_Vuna_dCompiler_dIr_dModel_dirSharedTyParamsOfGo = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__140, dtb__141) -> (if ((Base_dPair.v_Base_dPair_dfirstOf dtb__140) = mc0) then (Base_dPair.v_Base_dPair_dsecondOf dtb__140) else ((v_Vuna_dCompiler_dIr_dModel_dirSharedTyParamsOfGo mc0) dtb__141))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 337 "Vuna/Compiler/Ir/Model.vuna"
let v_Vuna_dCompiler_dIr_dModel_dirSharedTyParamsOf = (fun mc0 mc1 -> (match mc0 with
  | { f_Vuna_dCompiler_dIr_dModel_dIrShared_irSharedRecordFields = dtb__142; f_Vuna_dCompiler_dIr_dModel_dIrShared_irSharedListFam = dtb__143; f_Vuna_dCompiler_dIr_dModel_dIrShared_irSharedUsesFloat = dtb__144; f_Vuna_dCompiler_dIr_dModel_dIrShared_irSharedUsesTrace = dtb__145; f_Vuna_dCompiler_dIr_dModel_dIrShared_irSharedUsesObs = dtb__146; f_Vuna_dCompiler_dIr_dModel_dIrShared_irSharedCtors = dtb__147; f_Vuna_dCompiler_dIr_dModel_dIrShared_irSharedCtorOpaques = dtb__148; f_Vuna_dCompiler_dIr_dModel_dIrShared_irSharedUnboxed = dtb__149; f_Vuna_dCompiler_dIr_dModel_dIrShared_irSharedTyParams = dtb__150; f_Vuna_dCompiler_dIr_dModel_dIrShared_irSharedDefLocs = dtb__151 } -> ((v_Vuna_dCompiler_dIr_dModel_dirSharedTyParamsOfGo mc1) dtb__150)
  | _ -> failwith "DT: impossible branch"
))

# 365 "Vuna/Compiler/Ir/Model.vuna"
let v_Vuna_dCompiler_dIr_dModel_dirNatChainMax = 4611686018427387903

# 372 "Vuna/Compiler/Ir/Model.vuna"
let v_Vuna_dCompiler_dIr_dModel_dirInlineArity = (fun mc0 -> (if (mc0 = "+") then 2 else (if (mc0 = "-") then 2 else (if (mc0 = "*") then 2 else (if (mc0 = "/") then 2 else (if (mc0 = "&&") then 2 else (if (mc0 = "||") then 2 else (if (mc0 = "bi_bitAnd") then 2 else (if (mc0 = "bi_bitOr") then 2 else (if (mc0 = "bi_bitXor") then 2 else (if (mc0 = "bi_bitNot") then 1 else (if (mc0 = "++") then 2 else (if (mc0 = "bi_eq_int") then 2 else (if (mc0 = "bi_neq_int") then 2 else (if (mc0 = "bi_eq_str") then 2 else (if (mc0 = "bi_neq_str") then 2 else (if (mc0 = "bi_lt_int") then 2 else (if (mc0 = "bi_le_int") then 2 else (if (mc0 = "bi_gt_int") then 2 else (if (mc0 = "bi_ge_int") then 2 else (if (mc0 = "bi_lt_generic") then 2 else (if (mc0 = "bi_le_generic") then 2 else (if (mc0 = "bi_gt_generic") then 2 else (if (mc0 = "bi_ge_generic") then 2 else (if (mc0 = "bi_add_float") then 2 else (if (mc0 = "bi_sub_float") then 2 else (if (mc0 = "bi_mul_float") then 2 else (if (mc0 = "bi_div_float") then 2 else (if (mc0 = "bi_eq_float") then 2 else (if (mc0 = "bi_neq_float") then 2 else (if (mc0 = "bi_lt_float") then 2 else (if (mc0 = "bi_le_float") then 2 else (if (mc0 = "bi_gt_float") then 2 else (if (mc0 = "bi_ge_float") then 2 else (if (mc0 = "natToInt") then 1 else (if (mc0 = "natFromInt") then 1 else (if (mc0 = "natAdd") then 2 else (if (mc0 = "natSub") then 2 else (if (mc0 = "natMul") then 2 else (if (mc0 = "natDiv") then 2 else 0))))))))))))))))))))))))))))))))))))))))

# 415 "Vuna/Compiler/Ir/Model.vuna"
let v_Vuna_dCompiler_dIr_dModel_dirListFamilyOf = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dIr_dModel_dIrListFam_irListFamily = dtb__152; f_Vuna_dCompiler_dIr_dModel_dIrListFam_irListNil = dtb__153; f_Vuna_dCompiler_dIr_dModel_dIrListFam_irListCons = dtb__154 } -> dtb__152
  | _ -> failwith "DT: impossible branch"
))

# 419 "Vuna/Compiler/Ir/Model.vuna"
let v_Vuna_dCompiler_dIr_dModel_dirListNilOf = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dIr_dModel_dIrListFam_irListFamily = dtb__155; f_Vuna_dCompiler_dIr_dModel_dIrListFam_irListNil = dtb__156; f_Vuna_dCompiler_dIr_dModel_dIrListFam_irListCons = dtb__157 } -> dtb__156
  | _ -> failwith "DT: impossible branch"
))

# 423 "Vuna/Compiler/Ir/Model.vuna"
let v_Vuna_dCompiler_dIr_dModel_dirListConsOf = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dIr_dModel_dIrListFam_irListFamily = dtb__158; f_Vuna_dCompiler_dIr_dModel_dIrListFam_irListNil = dtb__159; f_Vuna_dCompiler_dIr_dModel_dIrListFam_irListCons = dtb__160 } -> dtb__160
  | _ -> failwith "DT: impossible branch"
))

# 427 "Vuna/Compiler/Ir/Model.vuna"
let v_Vuna_dCompiler_dIr_dModel_dirAltCtorOf = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltCtor = dtb__161; f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBinders = dtb__162; f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBody = dtb__163 } -> dtb__161
  | _ -> failwith "DT: impossible branch"
))

# 431 "Vuna/Compiler/Ir/Model.vuna"
let v_Vuna_dCompiler_dIr_dModel_dirAltBindersOf = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltCtor = dtb__164; f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBinders = dtb__165; f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBody = dtb__166 } -> dtb__165
  | _ -> failwith "DT: impossible branch"
))

# 435 "Vuna/Compiler/Ir/Model.vuna"
let v_Vuna_dCompiler_dIr_dModel_dirAltBodyOf = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltCtor = dtb__167; f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBinders = dtb__168; f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBody = dtb__169 } -> dtb__169
  | _ -> failwith "DT: impossible branch"
))

# 439 "Vuna/Compiler/Ir/Model.vuna"
let v_Vuna_dCompiler_dIr_dModel_dirEntryShowOf = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dIr_dModel_dIrEntry_irEntryShow = dtb__170; f_Vuna_dCompiler_dIr_dModel_dIrEntry_irEntryMain = dtb__171; f_Vuna_dCompiler_dIr_dModel_dIrEntry_irEntryIsAction = dtb__172; f_Vuna_dCompiler_dIr_dModel_dIrEntry_irEntryRunMain = dtb__173; f_Vuna_dCompiler_dIr_dModel_dIrEntry_irEntryHandlers = dtb__174 } -> dtb__170
  | _ -> failwith "DT: impossible branch"
))

# 443 "Vuna/Compiler/Ir/Model.vuna"
let v_Vuna_dCompiler_dIr_dModel_dirEntryMainOf = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dIr_dModel_dIrEntry_irEntryShow = dtb__175; f_Vuna_dCompiler_dIr_dModel_dIrEntry_irEntryMain = dtb__176; f_Vuna_dCompiler_dIr_dModel_dIrEntry_irEntryIsAction = dtb__177; f_Vuna_dCompiler_dIr_dModel_dIrEntry_irEntryRunMain = dtb__178; f_Vuna_dCompiler_dIr_dModel_dIrEntry_irEntryHandlers = dtb__179 } -> dtb__176
  | _ -> failwith "DT: impossible branch"
))

# 447 "Vuna/Compiler/Ir/Model.vuna"
let v_Vuna_dCompiler_dIr_dModel_dirEntryIsActionOf = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dIr_dModel_dIrEntry_irEntryShow = dtb__180; f_Vuna_dCompiler_dIr_dModel_dIrEntry_irEntryMain = dtb__181; f_Vuna_dCompiler_dIr_dModel_dIrEntry_irEntryIsAction = dtb__182; f_Vuna_dCompiler_dIr_dModel_dIrEntry_irEntryRunMain = dtb__183; f_Vuna_dCompiler_dIr_dModel_dIrEntry_irEntryHandlers = dtb__184 } -> dtb__182
  | _ -> failwith "DT: impossible branch"
))

# 451 "Vuna/Compiler/Ir/Model.vuna"
let v_Vuna_dCompiler_dIr_dModel_dirEntryRunMainOf = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dIr_dModel_dIrEntry_irEntryShow = dtb__185; f_Vuna_dCompiler_dIr_dModel_dIrEntry_irEntryMain = dtb__186; f_Vuna_dCompiler_dIr_dModel_dIrEntry_irEntryIsAction = dtb__187; f_Vuna_dCompiler_dIr_dModel_dIrEntry_irEntryRunMain = dtb__188; f_Vuna_dCompiler_dIr_dModel_dIrEntry_irEntryHandlers = dtb__189 } -> dtb__188
  | _ -> failwith "DT: impossible branch"
))

# 455 "Vuna/Compiler/Ir/Model.vuna"
let v_Vuna_dCompiler_dIr_dModel_dirEntryHandlersOf = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dIr_dModel_dIrEntry_irEntryShow = dtb__190; f_Vuna_dCompiler_dIr_dModel_dIrEntry_irEntryMain = dtb__191; f_Vuna_dCompiler_dIr_dModel_dIrEntry_irEntryIsAction = dtb__192; f_Vuna_dCompiler_dIr_dModel_dIrEntry_irEntryRunMain = dtb__193; f_Vuna_dCompiler_dIr_dModel_dIrEntry_irEntryHandlers = dtb__194 } -> dtb__194
  | _ -> failwith "DT: impossible branch"
))

# 459 "Vuna/Compiler/Ir/Model.vuna"
let v_Vuna_dCompiler_dIr_dModel_dirProgSharedOf = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dIr_dModel_dIrProgram_irProgShared = dtb__195; f_Vuna_dCompiler_dIr_dModel_dIrProgram_irProgUnit = dtb__196 } -> dtb__195
  | _ -> failwith "DT: impossible branch"
))

# 463 "Vuna/Compiler/Ir/Model.vuna"
let v_Vuna_dCompiler_dIr_dModel_dirProgUnitOf = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dIr_dModel_dIrProgram_irProgShared = dtb__197; f_Vuna_dCompiler_dIr_dModel_dIrProgram_irProgUnit = dtb__198 } -> dtb__198
  | _ -> failwith "DT: impossible branch"
))
