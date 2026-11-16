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
and t_Vuna_dCompiler_dIr_dModel_dIrShared = { f_Vuna_dCompiler_dIr_dModel_dIrShared_irSharedRecordFields : (string, (int, string) Base_dPair.t_Base_dPair_dPair Base_dList.t_Base_dList_dList) Base_dPair.t_Base_dPair_dPair Base_dList.t_Base_dList_dList; f_Vuna_dCompiler_dIr_dModel_dIrShared_irSharedListFam : t_Vuna_dCompiler_dIr_dModel_dIrListFam Base_dMaybe.t_Base_dMaybe_dMaybe; f_Vuna_dCompiler_dIr_dModel_dIrShared_irSharedUsesFloat : bool; f_Vuna_dCompiler_dIr_dModel_dIrShared_irSharedUsesTrace : bool; f_Vuna_dCompiler_dIr_dModel_dIrShared_irSharedUsesObs : bool; f_Vuna_dCompiler_dIr_dModel_dIrShared_irSharedDefLocs : (string, (string, int) Base_dPair.t_Base_dPair_dPair) Base_dPair.t_Base_dPair_dPair Base_dList.t_Base_dList_dList }
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

# 288 "Vuna/Compiler/Ir/Model.vuna"
let rec v_Vuna_dCompiler_dIr_dModel_dirSharedRecordFieldsOf = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__92, dtb__93) -> (if ((Base_dPair.v_Base_dPair_dfirstOf dtb__92) = mc0) then (Base_dPair.v_Base_dPair_dsecondOf dtb__92) else ((v_Vuna_dCompiler_dIr_dModel_dirSharedRecordFieldsOf mc0) dtb__93))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 315 "Vuna/Compiler/Ir/Model.vuna"
let v_Vuna_dCompiler_dIr_dModel_dirInlineArity = (fun mc0 -> (if (mc0 = "+") then 2 else (if (mc0 = "-") then 2 else (if (mc0 = "*") then 2 else (if (mc0 = "/") then 2 else (if (mc0 = "&&") then 2 else (if (mc0 = "||") then 2 else (if (mc0 = "bitAnd") then 2 else (if (mc0 = "bitOr") then 2 else (if (mc0 = "bitXor") then 2 else (if (mc0 = "bitNot") then 1 else (if (mc0 = "bitShl") then 2 else (if (mc0 = "bitShr") then 2 else (if (mc0 = "++") then 2 else (if (mc0 = "bi_eq_int") then 2 else (if (mc0 = "bi_neq_int") then 2 else (if (mc0 = "bi_eq_str") then 2 else (if (mc0 = "bi_neq_str") then 2 else (if (mc0 = "bi_lt_int") then 2 else (if (mc0 = "bi_le_int") then 2 else (if (mc0 = "bi_gt_int") then 2 else (if (mc0 = "bi_ge_int") then 2 else (if (mc0 = "bi_lt_generic") then 2 else (if (mc0 = "bi_le_generic") then 2 else (if (mc0 = "bi_gt_generic") then 2 else (if (mc0 = "bi_ge_generic") then 2 else (if (mc0 = "bi_add_float") then 2 else (if (mc0 = "bi_sub_float") then 2 else (if (mc0 = "bi_mul_float") then 2 else (if (mc0 = "bi_div_float") then 2 else (if (mc0 = "bi_eq_float") then 2 else (if (mc0 = "bi_neq_float") then 2 else (if (mc0 = "bi_lt_float") then 2 else (if (mc0 = "bi_le_float") then 2 else (if (mc0 = "bi_gt_float") then 2 else (if (mc0 = "bi_ge_float") then 2 else (if (mc0 = "natToInt") then 1 else (if (mc0 = "natFromInt") then 1 else (if (mc0 = "natAdd") then 2 else (if (mc0 = "natSub") then 2 else (if (mc0 = "natMul") then 2 else (if (mc0 = "natDiv") then 2 else 0))))))))))))))))))))))))))))))))))))))))))

# 360 "Vuna/Compiler/Ir/Model.vuna"
let v_Vuna_dCompiler_dIr_dModel_dirListFamilyOf = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dIr_dModel_dIrListFam_irListFamily = dtb__94; f_Vuna_dCompiler_dIr_dModel_dIrListFam_irListNil = dtb__95; f_Vuna_dCompiler_dIr_dModel_dIrListFam_irListCons = dtb__96 } -> dtb__94
  | _ -> failwith "DT: impossible branch"
))

# 364 "Vuna/Compiler/Ir/Model.vuna"
let v_Vuna_dCompiler_dIr_dModel_dirListNilOf = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dIr_dModel_dIrListFam_irListFamily = dtb__97; f_Vuna_dCompiler_dIr_dModel_dIrListFam_irListNil = dtb__98; f_Vuna_dCompiler_dIr_dModel_dIrListFam_irListCons = dtb__99 } -> dtb__98
  | _ -> failwith "DT: impossible branch"
))

# 368 "Vuna/Compiler/Ir/Model.vuna"
let v_Vuna_dCompiler_dIr_dModel_dirListConsOf = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dIr_dModel_dIrListFam_irListFamily = dtb__100; f_Vuna_dCompiler_dIr_dModel_dIrListFam_irListNil = dtb__101; f_Vuna_dCompiler_dIr_dModel_dIrListFam_irListCons = dtb__102 } -> dtb__102
  | _ -> failwith "DT: impossible branch"
))

# 372 "Vuna/Compiler/Ir/Model.vuna"
let v_Vuna_dCompiler_dIr_dModel_dirAltCtorOf = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltCtor = dtb__103; f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBinders = dtb__104; f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBody = dtb__105 } -> dtb__103
  | _ -> failwith "DT: impossible branch"
))

# 376 "Vuna/Compiler/Ir/Model.vuna"
let v_Vuna_dCompiler_dIr_dModel_dirAltBindersOf = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltCtor = dtb__106; f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBinders = dtb__107; f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBody = dtb__108 } -> dtb__107
  | _ -> failwith "DT: impossible branch"
))

# 380 "Vuna/Compiler/Ir/Model.vuna"
let v_Vuna_dCompiler_dIr_dModel_dirAltBodyOf = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltCtor = dtb__109; f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBinders = dtb__110; f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBody = dtb__111 } -> dtb__111
  | _ -> failwith "DT: impossible branch"
))

# 384 "Vuna/Compiler/Ir/Model.vuna"
let v_Vuna_dCompiler_dIr_dModel_dirEntryShowOf = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dIr_dModel_dIrEntry_irEntryShow = dtb__112; f_Vuna_dCompiler_dIr_dModel_dIrEntry_irEntryMain = dtb__113; f_Vuna_dCompiler_dIr_dModel_dIrEntry_irEntryIsAction = dtb__114; f_Vuna_dCompiler_dIr_dModel_dIrEntry_irEntryRunMain = dtb__115; f_Vuna_dCompiler_dIr_dModel_dIrEntry_irEntryHandlers = dtb__116 } -> dtb__112
  | _ -> failwith "DT: impossible branch"
))

# 388 "Vuna/Compiler/Ir/Model.vuna"
let v_Vuna_dCompiler_dIr_dModel_dirEntryMainOf = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dIr_dModel_dIrEntry_irEntryShow = dtb__117; f_Vuna_dCompiler_dIr_dModel_dIrEntry_irEntryMain = dtb__118; f_Vuna_dCompiler_dIr_dModel_dIrEntry_irEntryIsAction = dtb__119; f_Vuna_dCompiler_dIr_dModel_dIrEntry_irEntryRunMain = dtb__120; f_Vuna_dCompiler_dIr_dModel_dIrEntry_irEntryHandlers = dtb__121 } -> dtb__118
  | _ -> failwith "DT: impossible branch"
))

# 392 "Vuna/Compiler/Ir/Model.vuna"
let v_Vuna_dCompiler_dIr_dModel_dirEntryIsActionOf = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dIr_dModel_dIrEntry_irEntryShow = dtb__122; f_Vuna_dCompiler_dIr_dModel_dIrEntry_irEntryMain = dtb__123; f_Vuna_dCompiler_dIr_dModel_dIrEntry_irEntryIsAction = dtb__124; f_Vuna_dCompiler_dIr_dModel_dIrEntry_irEntryRunMain = dtb__125; f_Vuna_dCompiler_dIr_dModel_dIrEntry_irEntryHandlers = dtb__126 } -> dtb__124
  | _ -> failwith "DT: impossible branch"
))

# 396 "Vuna/Compiler/Ir/Model.vuna"
let v_Vuna_dCompiler_dIr_dModel_dirEntryRunMainOf = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dIr_dModel_dIrEntry_irEntryShow = dtb__127; f_Vuna_dCompiler_dIr_dModel_dIrEntry_irEntryMain = dtb__128; f_Vuna_dCompiler_dIr_dModel_dIrEntry_irEntryIsAction = dtb__129; f_Vuna_dCompiler_dIr_dModel_dIrEntry_irEntryRunMain = dtb__130; f_Vuna_dCompiler_dIr_dModel_dIrEntry_irEntryHandlers = dtb__131 } -> dtb__130
  | _ -> failwith "DT: impossible branch"
))

# 400 "Vuna/Compiler/Ir/Model.vuna"
let v_Vuna_dCompiler_dIr_dModel_dirEntryHandlersOf = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dIr_dModel_dIrEntry_irEntryShow = dtb__132; f_Vuna_dCompiler_dIr_dModel_dIrEntry_irEntryMain = dtb__133; f_Vuna_dCompiler_dIr_dModel_dIrEntry_irEntryIsAction = dtb__134; f_Vuna_dCompiler_dIr_dModel_dIrEntry_irEntryRunMain = dtb__135; f_Vuna_dCompiler_dIr_dModel_dIrEntry_irEntryHandlers = dtb__136 } -> dtb__136
  | _ -> failwith "DT: impossible branch"
))

# 404 "Vuna/Compiler/Ir/Model.vuna"
let v_Vuna_dCompiler_dIr_dModel_dirProgSharedOf = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dIr_dModel_dIrProgram_irProgShared = dtb__137; f_Vuna_dCompiler_dIr_dModel_dIrProgram_irProgUnit = dtb__138 } -> dtb__137
  | _ -> failwith "DT: impossible branch"
))

# 408 "Vuna/Compiler/Ir/Model.vuna"
let v_Vuna_dCompiler_dIr_dModel_dirProgUnitOf = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dIr_dModel_dIrProgram_irProgShared = dtb__139; f_Vuna_dCompiler_dIr_dModel_dIrProgram_irProgUnit = dtb__140 } -> dtb__140
  | _ -> failwith "DT: impossible branch"
))
