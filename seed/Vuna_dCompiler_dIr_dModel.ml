open Vuna_runtime
type t_Vuna_dCompiler_dIr_dModel_dIrTy = C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyVar of (int) | C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyInt | C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyStr | C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyBool | C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyFloat | C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyOpaque | C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyArray of (t_Vuna_dCompiler_dIr_dModel_dIrTy) | C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyRef of (t_Vuna_dCompiler_dIr_dModel_dIrTy) | C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyData of (string) * (t_Vuna_dCompiler_dIr_dModel_dIrTy Base_dData_dList.t_Base_dData_dList_dList) | C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyFun of (t_Vuna_dCompiler_dIr_dModel_dIrTy) * (t_Vuna_dCompiler_dIr_dModel_dIrTy)
and t_Vuna_dCompiler_dIr_dModel_dIrBName = C_Vuna_dCompiler_dIr_dModel_dIrBName_IrBUser of (string) | C_Vuna_dCompiler_dIr_dModel_dIrBName_IrBArm of (int) | C_Vuna_dCompiler_dIr_dModel_dIrBName_IrBNat of (int) | C_Vuna_dCompiler_dIr_dModel_dIrBName_IrBWild
and t_Vuna_dCompiler_dIr_dModel_dIrBinder = { f_Vuna_dCompiler_dIr_dModel_dIrBinder_irBinderName : t_Vuna_dCompiler_dIr_dModel_dIrBName; f_Vuna_dCompiler_dIr_dModel_dIrBinder_irBinderErased : bool; f_Vuna_dCompiler_dIr_dModel_dIrBinder_irBinderTy : t_Vuna_dCompiler_dIr_dModel_dIrTy Base_dData_dMaybe.t_Base_dData_dMaybe_dMaybe }
and t_Vuna_dCompiler_dIr_dModel_dIrAlt = { f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltCtor : (string, string) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dMaybe.t_Base_dData_dMaybe_dMaybe; f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBinders : t_Vuna_dCompiler_dIr_dModel_dIrBinder Base_dData_dList.t_Base_dData_dList_dList; f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBody : t_Vuna_dCompiler_dIr_dModel_dIr }
and t_Vuna_dCompiler_dIr_dModel_dIr = C_Vuna_dCompiler_dIr_dModel_dIr_IrVar of (t_Vuna_dCompiler_dIr_dModel_dIrBinder) | C_Vuna_dCompiler_dIr_dModel_dIr_IrGlobal of (string) | C_Vuna_dCompiler_dIr_dModel_dIr_IrCtor of (string) * (string) * (t_Vuna_dCompiler_dIr_dModel_dIrTy Base_dData_dList.t_Base_dData_dList_dList Base_dData_dMaybe.t_Base_dData_dMaybe_dMaybe) * (t_Vuna_dCompiler_dIr_dModel_dIr Base_dData_dList.t_Base_dData_dList_dList) | C_Vuna_dCompiler_dIr_dModel_dIr_IrRecord of (string) * (t_Vuna_dCompiler_dIr_dModel_dIrTy Base_dData_dMaybe.t_Base_dData_dMaybe_dMaybe) * ((string, t_Vuna_dCompiler_dIr_dModel_dIr) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) | C_Vuna_dCompiler_dIr_dModel_dIr_IrProj of (t_Vuna_dCompiler_dIr_dModel_dIr) * (string) * (string) * (t_Vuna_dCompiler_dIr_dModel_dIrTy Base_dData_dMaybe.t_Base_dData_dMaybe_dMaybe) | C_Vuna_dCompiler_dIr_dModel_dIr_IrRecUpd of (t_Vuna_dCompiler_dIr_dModel_dIr) * (string) * ((string, t_Vuna_dCompiler_dIr_dModel_dIr) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) * (t_Vuna_dCompiler_dIr_dModel_dIrTy Base_dData_dMaybe.t_Base_dData_dMaybe_dMaybe) | C_Vuna_dCompiler_dIr_dModel_dIr_IrRt of (string) | C_Vuna_dCompiler_dIr_dModel_dIr_IrRtApp of (string) * (t_Vuna_dCompiler_dIr_dModel_dIr Base_dData_dList.t_Base_dData_dList_dList) | C_Vuna_dCompiler_dIr_dModel_dIr_IrCast of (t_Vuna_dCompiler_dIr_dModel_dIrTy Base_dData_dMaybe.t_Base_dData_dMaybe_dMaybe) * (t_Vuna_dCompiler_dIr_dModel_dIrTy Base_dData_dMaybe.t_Base_dData_dMaybe_dMaybe) * (t_Vuna_dCompiler_dIr_dModel_dIr) | C_Vuna_dCompiler_dIr_dModel_dIr_IrInt of (int) | C_Vuna_dCompiler_dIr_dModel_dIr_IrStr of (string) | C_Vuna_dCompiler_dIr_dModel_dIr_IrBool of (bool) | C_Vuna_dCompiler_dIr_dModel_dIr_IrFloatLit of (string) | C_Vuna_dCompiler_dIr_dModel_dIr_IrLet of (t_Vuna_dCompiler_dIr_dModel_dIrBinder Base_dData_dList.t_Base_dData_dList_dList) * (t_Vuna_dCompiler_dIr_dModel_dIr) * (t_Vuna_dCompiler_dIr_dModel_dIr) | C_Vuna_dCompiler_dIr_dModel_dIr_IrLam of (t_Vuna_dCompiler_dIr_dModel_dIrBinder Base_dData_dList.t_Base_dData_dList_dList) * (t_Vuna_dCompiler_dIr_dModel_dIrTy Base_dData_dMaybe.t_Base_dData_dMaybe_dMaybe) * (t_Vuna_dCompiler_dIr_dModel_dIr) | C_Vuna_dCompiler_dIr_dModel_dIr_IrApp of ((t_Vuna_dCompiler_dIr_dModel_dIrTy, t_Vuna_dCompiler_dIr_dModel_dIrTy) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dMaybe.t_Base_dData_dMaybe_dMaybe) * (t_Vuna_dCompiler_dIr_dModel_dIr) * (t_Vuna_dCompiler_dIr_dModel_dIr) | C_Vuna_dCompiler_dIr_dModel_dIr_IrIf of (t_Vuna_dCompiler_dIr_dModel_dIr) * (t_Vuna_dCompiler_dIr_dModel_dIr) * (t_Vuna_dCompiler_dIr_dModel_dIr) | C_Vuna_dCompiler_dIr_dModel_dIr_IrCase of (t_Vuna_dCompiler_dIr_dModel_dIrTy Base_dData_dMaybe.t_Base_dData_dMaybe_dMaybe) * (t_Vuna_dCompiler_dIr_dModel_dIrTy Base_dData_dMaybe.t_Base_dData_dMaybe_dMaybe) * (t_Vuna_dCompiler_dIr_dModel_dIr) * (t_Vuna_dCompiler_dIr_dModel_dIrAlt Base_dData_dList.t_Base_dData_dList_dList) | C_Vuna_dCompiler_dIr_dModel_dIr_IrNatCase of (t_Vuna_dCompiler_dIr_dModel_dIr) * (int) * (t_Vuna_dCompiler_dIr_dModel_dIrAlt Base_dData_dMaybe.t_Base_dData_dMaybe_dMaybe) * (t_Vuna_dCompiler_dIr_dModel_dIrAlt Base_dData_dMaybe.t_Base_dData_dMaybe_dMaybe) * (t_Vuna_dCompiler_dIr_dModel_dIrAlt Base_dData_dMaybe.t_Base_dData_dMaybe_dMaybe) | C_Vuna_dCompiler_dIr_dModel_dIr_IrConcatMany of (t_Vuna_dCompiler_dIr_dModel_dIr Base_dData_dList.t_Base_dData_dList_dList) | C_Vuna_dCompiler_dIr_dModel_dIr_IrEffThunk of (string) * (string) * (t_Vuna_dCompiler_dIr_dModel_dIrTy) * (int) * (t_Vuna_dCompiler_dIr_dModel_dIr) | C_Vuna_dCompiler_dIr_dModel_dIr_IrEffBind of (string) * (string) * (t_Vuna_dCompiler_dIr_dModel_dIrTy)
and t_Vuna_dCompiler_dIr_dModel_dIrTyDecl = C_Vuna_dCompiler_dIr_dModel_dIrTyDecl_IrVariantDecl of (string) * (int) * ((string, t_Vuna_dCompiler_dIr_dModel_dIrTy Base_dData_dList.t_Base_dData_dList_dList) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) | C_Vuna_dCompiler_dIr_dModel_dIrTyDecl_IrRecordDecl of (string) * (int) * ((int, string) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) * (t_Vuna_dCompiler_dIr_dModel_dIrTy Base_dData_dList.t_Base_dData_dList_dList) | C_Vuna_dCompiler_dIr_dModel_dIrTyDecl_IrUnboxedDecl of (string) * (int) * (t_Vuna_dCompiler_dIr_dModel_dIrTy)
and t_Vuna_dCompiler_dIr_dModel_dIrDef = C_Vuna_dCompiler_dIr_dModel_dIrDef_IrDef of (string) * (int) * (string Base_dData_dList.t_Base_dData_dList_dList) * (t_Vuna_dCompiler_dIr_dModel_dIrTy Base_dData_dMaybe.t_Base_dData_dMaybe_dMaybe) * (t_Vuna_dCompiler_dIr_dModel_dIr) * (bool) * (bool) * (Vuna_dCompiler_dBase_dSource.t_Vuna_dCompiler_dBase_dSource_dSpan Base_dData_dMaybe.t_Base_dData_dMaybe_dMaybe) | C_Vuna_dCompiler_dIr_dModel_dIrDef_IrExternDef of (string) * (t_Vuna_dCompiler_dIr_dModel_dIrTy) * (string) * (Vuna_dCompiler_dBase_dSource.t_Vuna_dCompiler_dBase_dSource_dSpan Base_dData_dMaybe.t_Base_dData_dMaybe_dMaybe)
and t_Vuna_dCompiler_dIr_dModel_dIrGroup = { f_Vuna_dCompiler_dIr_dModel_dIrGroup_irGroupIsRec : bool; f_Vuna_dCompiler_dIr_dModel_dIrGroup_irGroupDefs : t_Vuna_dCompiler_dIr_dModel_dIrDef Base_dData_dList.t_Base_dData_dList_dList }
and t_Vuna_dCompiler_dIr_dModel_dIrEntry = { f_Vuna_dCompiler_dIr_dModel_dIrEntry_irEntryShow : t_Vuna_dCompiler_dIr_dModel_dIr; f_Vuna_dCompiler_dIr_dModel_dIrEntry_irEntryMain : string; f_Vuna_dCompiler_dIr_dModel_dIrEntry_irEntryIsAction : bool; f_Vuna_dCompiler_dIr_dModel_dIrEntry_irEntryRunMain : string Base_dData_dMaybe.t_Base_dData_dMaybe_dMaybe; f_Vuna_dCompiler_dIr_dModel_dIrEntry_irEntryHandlers : string Base_dData_dList.t_Base_dData_dList_dList; f_Vuna_dCompiler_dIr_dModel_dIrEntry_irEntryRowTags : string Base_dData_dList.t_Base_dData_dList_dList }
and t_Vuna_dCompiler_dIr_dModel_dIrListFam = { f_Vuna_dCompiler_dIr_dModel_dIrListFam_irListFamily : string; f_Vuna_dCompiler_dIr_dModel_dIrListFam_irListNil : string; f_Vuna_dCompiler_dIr_dModel_dIrListFam_irListCons : string }
and t_Vuna_dCompiler_dIr_dModel_dIrShared = { f_Vuna_dCompiler_dIr_dModel_dIrShared_irSharedRecordFields : (string, (int, string) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList; f_Vuna_dCompiler_dIr_dModel_dIrShared_irSharedListFam : t_Vuna_dCompiler_dIr_dModel_dIrListFam Base_dData_dMaybe.t_Base_dData_dMaybe_dMaybe; f_Vuna_dCompiler_dIr_dModel_dIrShared_irSharedUsesFloat : bool; f_Vuna_dCompiler_dIr_dModel_dIrShared_irSharedUsesTrace : bool; f_Vuna_dCompiler_dIr_dModel_dIrShared_irSharedUsesObs : bool; f_Vuna_dCompiler_dIr_dModel_dIrShared_irSharedDefLocs : (string, (string, int) Base_dData_dPair.t_Base_dData_dPair_dPair) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList; f_Vuna_dCompiler_dIr_dModel_dIrShared_irSharedUnboxed : (string, (string, int) Base_dData_dPair.t_Base_dData_dPair_dPair) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList; f_Vuna_dCompiler_dIr_dModel_dIrShared_irSharedCtorShapes : (string, (string, bool Base_dData_dList.t_Base_dData_dList_dList) Base_dData_dPair.t_Base_dData_dPair_dPair) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList }
and t_Vuna_dCompiler_dIr_dModel_dIrUnit = { f_Vuna_dCompiler_dIr_dModel_dIrUnit_irUnitTyDecls : t_Vuna_dCompiler_dIr_dModel_dIrTyDecl Base_dData_dList.t_Base_dData_dList_dList; f_Vuna_dCompiler_dIr_dModel_dIrUnit_irUnitGroups : t_Vuna_dCompiler_dIr_dModel_dIrGroup Base_dData_dList.t_Base_dData_dList_dList; f_Vuna_dCompiler_dIr_dModel_dIrUnit_irUnitHasListFamily : bool; f_Vuna_dCompiler_dIr_dModel_dIrUnit_irUnitTypeRefs : string Base_dData_dList.t_Base_dData_dList_dList; f_Vuna_dCompiler_dIr_dModel_dIrUnit_irUnitEntry : t_Vuna_dCompiler_dIr_dModel_dIrEntry Base_dData_dMaybe.t_Base_dData_dMaybe_dMaybe }
and t_Vuna_dCompiler_dIr_dModel_dIrProgram = { f_Vuna_dCompiler_dIr_dModel_dIrProgram_irProgShared : t_Vuna_dCompiler_dIr_dModel_dIrShared; f_Vuna_dCompiler_dIr_dModel_dIrProgram_irProgUnit : t_Vuna_dCompiler_dIr_dModel_dIrUnit }

# 70 "Vuna/Compiler/Ir/Model.vuna"
let rec v_Vuna_dCompiler_dIr_dModel_dirTyVarAt = (fun (mc0 : t_Vuna_dCompiler_dIr_dModel_dIrTy Base_dData_dList.t_Base_dData_dList_dList) (mc1 : int) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__0, dtb__1) -> (if (mc1 <= 0) then dtb__0 else ((v_Vuna_dCompiler_dIr_dModel_dirTyVarAt dtb__1) (mc1 - 1)))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyOpaque
  | _ -> failwith "DT: impossible branch"
))

# 56 "Vuna/Compiler/Ir/Model.vuna"
let rec v_Vuna_dCompiler_dIr_dModel_dirTySubstVars = (fun args ty -> (match ty with
  | C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyVar (dtb__2) -> ((v_Vuna_dCompiler_dIr_dModel_dirTyVarAt args) dtb__2)
  | C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyInt -> C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyInt
  | C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyStr -> C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyStr
  | C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyBool -> C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyBool
  | C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyFloat -> C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyFloat
  | C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyOpaque -> C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyOpaque
  | C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyArray (dtb__3) -> (C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyArray (((v_Vuna_dCompiler_dIr_dModel_dirTySubstVars args) dtb__3)))
  | C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyRef (dtb__4) -> (C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyRef (((v_Vuna_dCompiler_dIr_dModel_dirTySubstVars args) dtb__4)))
  | C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyData (dtb__5, dtb__6) -> (C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyData (dtb__5, ((Base_dData_dList.v_Base_dData_dList_dmap (fun (x : t_Vuna_dCompiler_dIr_dModel_dIrTy) -> ((v_Vuna_dCompiler_dIr_dModel_dirTySubstVars args) x))) dtb__6)))
  | C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyFun (dtb__7, dtb__8) -> (C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyFun (((v_Vuna_dCompiler_dIr_dModel_dirTySubstVars args) dtb__7), ((v_Vuna_dCompiler_dIr_dModel_dirTySubstVars args) dtb__8)))
  | _ -> failwith "DT: impossible branch"
))

# 75 "Vuna/Compiler/Ir/Model.vuna"
let v_Vuna_dCompiler_dIr_dModel_dirTyDataArgsOf = (fun (mc0 : t_Vuna_dCompiler_dIr_dModel_dIrTy Base_dData_dMaybe.t_Base_dData_dMaybe_dMaybe) -> (match mc0 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__9) -> (match dtb__9 with
  | C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyData (dtb__10, dtb__11) -> dtb__11
  | _ -> Base_dData_dList.C_Base_dData_dList_dList_Nil
)
  | _ -> Base_dData_dList.C_Base_dData_dList_dList_Nil
))

# 80 "Vuna/Compiler/Ir/Model.vuna"
let rec v_Vuna_dCompiler_dIr_dModel_dirTyAt = (fun (mc0 : t_Vuna_dCompiler_dIr_dModel_dIrTy Base_dData_dList.t_Base_dData_dList_dList) (mc1 : int) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__12, dtb__13) -> (if (mc1 <= 0) then (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__12)) else ((v_Vuna_dCompiler_dIr_dModel_dirTyAt dtb__13) (mc1 - 1)))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 109 "Vuna/Compiler/Ir/Model.vuna"
let v_Vuna_dCompiler_dIr_dModel_dmkIrBinder = (fun name -> { f_Vuna_dCompiler_dIr_dModel_dIrBinder_irBinderName = (C_Vuna_dCompiler_dIr_dModel_dIrBName_IrBUser (name)); f_Vuna_dCompiler_dIr_dModel_dIrBinder_irBinderErased = false; f_Vuna_dCompiler_dIr_dModel_dIrBinder_irBinderTy = Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing })

# 113 "Vuna/Compiler/Ir/Model.vuna"
let v_Vuna_dCompiler_dIr_dModel_dmkIrBinderTyped = (fun name ty -> { f_Vuna_dCompiler_dIr_dModel_dIrBinder_irBinderName = (C_Vuna_dCompiler_dIr_dModel_dIrBName_IrBUser (name)); f_Vuna_dCompiler_dIr_dModel_dIrBinder_irBinderErased = false; f_Vuna_dCompiler_dIr_dModel_dIrBinder_irBinderTy = (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (ty)) })

# 117 "Vuna/Compiler/Ir/Model.vuna"
let v_Vuna_dCompiler_dIr_dModel_dmkIrBinderErased = { f_Vuna_dCompiler_dIr_dModel_dIrBinder_irBinderName = C_Vuna_dCompiler_dIr_dModel_dIrBName_IrBWild; f_Vuna_dCompiler_dIr_dModel_dIrBinder_irBinderErased = true; f_Vuna_dCompiler_dIr_dModel_dIrBinder_irBinderTy = Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing }

# 121 "Vuna/Compiler/Ir/Model.vuna"
let v_Vuna_dCompiler_dIr_dModel_dmkIrBinderArm = (fun n -> { f_Vuna_dCompiler_dIr_dModel_dIrBinder_irBinderName = (C_Vuna_dCompiler_dIr_dModel_dIrBName_IrBArm (n)); f_Vuna_dCompiler_dIr_dModel_dIrBinder_irBinderErased = false; f_Vuna_dCompiler_dIr_dModel_dIrBinder_irBinderTy = Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing })

# 125 "Vuna/Compiler/Ir/Model.vuna"
let v_Vuna_dCompiler_dIr_dModel_dmkIrBinderNat = (fun n -> { f_Vuna_dCompiler_dIr_dModel_dIrBinder_irBinderName = (C_Vuna_dCompiler_dIr_dModel_dIrBName_IrBNat (n)); f_Vuna_dCompiler_dIr_dModel_dIrBinder_irBinderErased = false; f_Vuna_dCompiler_dIr_dModel_dIrBinder_irBinderTy = Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing })

# 129 "Vuna/Compiler/Ir/Model.vuna"
let v_Vuna_dCompiler_dIr_dModel_dmkIrBinderWild = { f_Vuna_dCompiler_dIr_dModel_dIrBinder_irBinderName = C_Vuna_dCompiler_dIr_dModel_dIrBName_IrBWild; f_Vuna_dCompiler_dIr_dModel_dIrBinder_irBinderErased = false; f_Vuna_dCompiler_dIr_dModel_dIrBinder_irBinderTy = Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing }

# 203 "Vuna/Compiler/Ir/Model.vuna"
let v_Vuna_dCompiler_dIr_dModel_dirEffTypeName = "Base.Effect.Core.Eff"

# 206 "Vuna/Compiler/Ir/Model.vuna"
let v_Vuna_dCompiler_dIr_dModel_dirEffMkCtor = "Base.Effect.Core.Eff.MkEff"

# 236 "Vuna/Compiler/Ir/Model.vuna"
let v_Vuna_dCompiler_dIr_dModel_dirDefName = (fun (mc0 : t_Vuna_dCompiler_dIr_dModel_dIrDef) -> (match mc0 with
  | C_Vuna_dCompiler_dIr_dModel_dIrDef_IrExternDef (dtb__14, dtb__15, dtb__16, dtb__17) -> dtb__14
  | C_Vuna_dCompiler_dIr_dModel_dIrDef_IrDef (dtb__18, dtb__19, dtb__20, dtb__21, dtb__22, dtb__23, dtb__24, dtb__25) -> dtb__18
  | _ -> failwith "DT: impossible branch"
))

# 240 "Vuna/Compiler/Ir/Model.vuna"
let v_Vuna_dCompiler_dIr_dModel_dirDefArity = (fun (mc0 : t_Vuna_dCompiler_dIr_dModel_dIrDef) -> (match mc0 with
  | C_Vuna_dCompiler_dIr_dModel_dIrDef_IrExternDef (dtb__26, dtb__27, dtb__28, dtb__29) -> 0
  | C_Vuna_dCompiler_dIr_dModel_dIrDef_IrDef (dtb__30, dtb__31, dtb__32, dtb__33, dtb__34, dtb__35, dtb__36, dtb__37) -> dtb__31
  | _ -> failwith "DT: impossible branch"
))

# 244 "Vuna/Compiler/Ir/Model.vuna"
let v_Vuna_dCompiler_dIr_dModel_dirDefDeps = (fun (mc0 : t_Vuna_dCompiler_dIr_dModel_dIrDef) -> (match mc0 with
  | C_Vuna_dCompiler_dIr_dModel_dIrDef_IrExternDef (dtb__38, dtb__39, dtb__40, dtb__41) -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | C_Vuna_dCompiler_dIr_dModel_dIrDef_IrDef (dtb__42, dtb__43, dtb__44, dtb__45, dtb__46, dtb__47, dtb__48, dtb__49) -> dtb__44
  | _ -> failwith "DT: impossible branch"
))

# 248 "Vuna/Compiler/Ir/Model.vuna"
let v_Vuna_dCompiler_dIr_dModel_dirDefTy = (fun (mc0 : t_Vuna_dCompiler_dIr_dModel_dIrDef) -> (match mc0 with
  | C_Vuna_dCompiler_dIr_dModel_dIrDef_IrExternDef (dtb__50, dtb__51, dtb__52, dtb__53) -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__51))
  | C_Vuna_dCompiler_dIr_dModel_dIrDef_IrDef (dtb__54, dtb__55, dtb__56, dtb__57, dtb__58, dtb__59, dtb__60, dtb__61) -> dtb__57
  | _ -> failwith "DT: impossible branch"
))

# 252 "Vuna/Compiler/Ir/Model.vuna"
let v_Vuna_dCompiler_dIr_dModel_dirDefBody = (fun (mc0 : t_Vuna_dCompiler_dIr_dModel_dIrDef) -> (match mc0 with
  | C_Vuna_dCompiler_dIr_dModel_dIrDef_IrExternDef (dtb__62, dtb__63, dtb__64, dtb__65) -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | C_Vuna_dCompiler_dIr_dModel_dIrDef_IrDef (dtb__66, dtb__67, dtb__68, dtb__69, dtb__70, dtb__71, dtb__72, dtb__73) -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__70))
  | _ -> failwith "DT: impossible branch"
))

# 256 "Vuna/Compiler/Ir/Model.vuna"
let v_Vuna_dCompiler_dIr_dModel_dirDefExtern = (fun (mc0 : t_Vuna_dCompiler_dIr_dModel_dIrDef) -> (match mc0 with
  | C_Vuna_dCompiler_dIr_dModel_dIrDef_IrExternDef (dtb__74, dtb__75, dtb__76, dtb__77) -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__75; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__76 }))
  | C_Vuna_dCompiler_dIr_dModel_dIrDef_IrDef (dtb__78, dtb__79, dtb__80, dtb__81, dtb__82, dtb__83, dtb__84, dtb__85) -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 261 "Vuna/Compiler/Ir/Model.vuna"
let v_Vuna_dCompiler_dIr_dModel_dirDefRecValueOk = (fun (mc0 : t_Vuna_dCompiler_dIr_dModel_dIrDef) -> (match mc0 with
  | C_Vuna_dCompiler_dIr_dModel_dIrDef_IrExternDef (dtb__86, dtb__87, dtb__88, dtb__89) -> true
  | C_Vuna_dCompiler_dIr_dModel_dIrDef_IrDef (dtb__90, dtb__91, dtb__92, dtb__93, dtb__94, dtb__95, dtb__96, dtb__97) -> dtb__95
  | _ -> failwith "DT: impossible branch"
))

# 266 "Vuna/Compiler/Ir/Model.vuna"
let v_Vuna_dCompiler_dIr_dModel_dirDefInitGuard = (fun (mc0 : t_Vuna_dCompiler_dIr_dModel_dIrDef) -> (match mc0 with
  | C_Vuna_dCompiler_dIr_dModel_dIrDef_IrExternDef (dtb__98, dtb__99, dtb__100, dtb__101) -> false
  | C_Vuna_dCompiler_dIr_dModel_dIrDef_IrDef (dtb__102, dtb__103, dtb__104, dtb__105, dtb__106, dtb__107, dtb__108, dtb__109) -> dtb__108
  | _ -> failwith "DT: impossible branch"
))

# 270 "Vuna/Compiler/Ir/Model.vuna"
let v_Vuna_dCompiler_dIr_dModel_dirDefSpan = (fun (mc0 : t_Vuna_dCompiler_dIr_dModel_dIrDef) -> (match mc0 with
  | C_Vuna_dCompiler_dIr_dModel_dIrDef_IrExternDef (dtb__110, dtb__111, dtb__112, dtb__113) -> dtb__113
  | C_Vuna_dCompiler_dIr_dModel_dIrDef_IrDef (dtb__114, dtb__115, dtb__116, dtb__117, dtb__118, dtb__119, dtb__120, dtb__121) -> dtb__121
  | _ -> failwith "DT: impossible branch"
))

# 279 "Vuna/Compiler/Ir/Model.vuna"
let v_Vuna_dCompiler_dIr_dModel_dirGroupIsRec = (fun (mc0 : t_Vuna_dCompiler_dIr_dModel_dIrGroup) -> (match mc0 with
  | { f_Vuna_dCompiler_dIr_dModel_dIrGroup_irGroupIsRec = dtb__122; f_Vuna_dCompiler_dIr_dModel_dIrGroup_irGroupDefs = dtb__123 } -> dtb__122
  | _ -> failwith "DT: impossible branch"
))

# 282 "Vuna/Compiler/Ir/Model.vuna"
let v_Vuna_dCompiler_dIr_dModel_dirGroupDefs = (fun (mc0 : t_Vuna_dCompiler_dIr_dModel_dIrGroup) -> (match mc0 with
  | { f_Vuna_dCompiler_dIr_dModel_dIrGroup_irGroupIsRec = dtb__124; f_Vuna_dCompiler_dIr_dModel_dIrGroup_irGroupDefs = dtb__125 } -> dtb__125
  | _ -> failwith "DT: impossible branch"
))

# 341 "Vuna/Compiler/Ir/Model.vuna"
let rec v_Vuna_dCompiler_dIr_dModel_dirSharedUnboxedOf = (fun (mc0 : string) (mc1 : (string, (string, int) Base_dData_dPair.t_Base_dData_dPair_dPair) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__126, dtb__127) -> (if ((Base_dData_dPair.v_Base_dData_dPair_dfirstOf dtb__126) = mc0) then (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ((Base_dData_dPair.v_Base_dData_dPair_dsecondOf dtb__126))) else ((v_Vuna_dCompiler_dIr_dModel_dirSharedUnboxedOf mc0) dtb__127))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 346 "Vuna/Compiler/Ir/Model.vuna"
let rec v_Vuna_dCompiler_dIr_dModel_dirSharedCtorShapeOf = (fun (mc0 : string) (mc1 : (string, (string, bool Base_dData_dList.t_Base_dData_dList_dList) Base_dData_dPair.t_Base_dData_dPair_dPair) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__128, dtb__129) -> (if ((Base_dData_dPair.v_Base_dData_dPair_dfirstOf dtb__128) = mc0) then (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ((Base_dData_dPair.v_Base_dData_dPair_dsecondOf dtb__128))) else ((v_Vuna_dCompiler_dIr_dModel_dirSharedCtorShapeOf mc0) dtb__129))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 351 "Vuna/Compiler/Ir/Model.vuna"
let rec v_Vuna_dCompiler_dIr_dModel_dirSharedRecordFieldsOf = (fun (mc0 : string) (mc1 : (string, (int, string) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__130, dtb__131) -> (if ((Base_dData_dPair.v_Base_dData_dPair_dfirstOf dtb__130) = mc0) then (Base_dData_dPair.v_Base_dData_dPair_dsecondOf dtb__130) else ((v_Vuna_dCompiler_dIr_dModel_dirSharedRecordFieldsOf mc0) dtb__131))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 378 "Vuna/Compiler/Ir/Model.vuna"
let v_Vuna_dCompiler_dIr_dModel_dirInlineArity = (fun (mc0 : string) -> (if (mc0 = "+") then 2 else (if (mc0 = "-") then 2 else (if (mc0 = "*") then 2 else (if (mc0 = "/") then 2 else (if (mc0 = "&&") then 2 else (if (mc0 = "||") then 2 else (if (mc0 = "bitAnd") then 2 else (if (mc0 = "bitOr") then 2 else (if (mc0 = "bitXor") then 2 else (if (mc0 = "bitNot") then 1 else (if (mc0 = "bitShl") then 2 else (if (mc0 = "bitShr") then 2 else (if (mc0 = "++") then 2 else (if (mc0 = "bi_eq_int") then 2 else (if (mc0 = "bi_neq_int") then 2 else (if (mc0 = "bi_eq_str") then 2 else (if (mc0 = "bi_neq_str") then 2 else (if (mc0 = "bi_lt_int") then 2 else (if (mc0 = "bi_le_int") then 2 else (if (mc0 = "bi_gt_int") then 2 else (if (mc0 = "bi_ge_int") then 2 else (if (mc0 = "bi_lt_str") then 2 else (if (mc0 = "bi_le_str") then 2 else (if (mc0 = "bi_gt_str") then 2 else (if (mc0 = "bi_ge_str") then 2 else (if (mc0 = "bi_lt_bool") then 2 else (if (mc0 = "bi_le_bool") then 2 else (if (mc0 = "bi_gt_bool") then 2 else (if (mc0 = "bi_ge_bool") then 2 else (if (mc0 = "bi_add_float") then 2 else (if (mc0 = "bi_sub_float") then 2 else (if (mc0 = "bi_mul_float") then 2 else (if (mc0 = "bi_div_float") then 2 else (if (mc0 = "bi_eq_float") then 2 else (if (mc0 = "bi_neq_float") then 2 else (if (mc0 = "bi_lt_float") then 2 else (if (mc0 = "bi_le_float") then 2 else (if (mc0 = "bi_gt_float") then 2 else (if (mc0 = "bi_ge_float") then 2 else (if (mc0 = "@ir@m@runEff") then 2 else (if (mc0 = "natToInt") then 1 else (if (mc0 = "natFromInt") then 1 else (if (mc0 = "natAdd") then 2 else (if (mc0 = "natSub") then 2 else (if (mc0 = "natMul") then 2 else (if (mc0 = "natDiv") then 2 else 0)))))))))))))))))))))))))))))))))))))))))))))))

# 428 "Vuna/Compiler/Ir/Model.vuna"
let v_Vuna_dCompiler_dIr_dModel_dirListFamilyOf = (fun (mc0 : t_Vuna_dCompiler_dIr_dModel_dIrListFam) -> (match mc0 with
  | { f_Vuna_dCompiler_dIr_dModel_dIrListFam_irListFamily = dtb__132; f_Vuna_dCompiler_dIr_dModel_dIrListFam_irListNil = dtb__133; f_Vuna_dCompiler_dIr_dModel_dIrListFam_irListCons = dtb__134 } -> dtb__132
  | _ -> failwith "DT: impossible branch"
))

# 432 "Vuna/Compiler/Ir/Model.vuna"
let v_Vuna_dCompiler_dIr_dModel_dirListNilOf = (fun (mc0 : t_Vuna_dCompiler_dIr_dModel_dIrListFam) -> (match mc0 with
  | { f_Vuna_dCompiler_dIr_dModel_dIrListFam_irListFamily = dtb__135; f_Vuna_dCompiler_dIr_dModel_dIrListFam_irListNil = dtb__136; f_Vuna_dCompiler_dIr_dModel_dIrListFam_irListCons = dtb__137 } -> dtb__136
  | _ -> failwith "DT: impossible branch"
))

# 436 "Vuna/Compiler/Ir/Model.vuna"
let v_Vuna_dCompiler_dIr_dModel_dirListConsOf = (fun (mc0 : t_Vuna_dCompiler_dIr_dModel_dIrListFam) -> (match mc0 with
  | { f_Vuna_dCompiler_dIr_dModel_dIrListFam_irListFamily = dtb__138; f_Vuna_dCompiler_dIr_dModel_dIrListFam_irListNil = dtb__139; f_Vuna_dCompiler_dIr_dModel_dIrListFam_irListCons = dtb__140 } -> dtb__140
  | _ -> failwith "DT: impossible branch"
))

# 440 "Vuna/Compiler/Ir/Model.vuna"
let v_Vuna_dCompiler_dIr_dModel_dirAltCtorOf = (fun (mc0 : t_Vuna_dCompiler_dIr_dModel_dIrAlt) -> (match mc0 with
  | { f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltCtor = dtb__141; f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBinders = dtb__142; f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBody = dtb__143 } -> dtb__141
  | _ -> failwith "DT: impossible branch"
))

# 444 "Vuna/Compiler/Ir/Model.vuna"
let v_Vuna_dCompiler_dIr_dModel_dirAltBindersOf = (fun (mc0 : t_Vuna_dCompiler_dIr_dModel_dIrAlt) -> (match mc0 with
  | { f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltCtor = dtb__144; f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBinders = dtb__145; f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBody = dtb__146 } -> dtb__145
  | _ -> failwith "DT: impossible branch"
))

# 448 "Vuna/Compiler/Ir/Model.vuna"
let v_Vuna_dCompiler_dIr_dModel_dirAltBodyOf = (fun (mc0 : t_Vuna_dCompiler_dIr_dModel_dIrAlt) -> (match mc0 with
  | { f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltCtor = dtb__147; f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBinders = dtb__148; f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBody = dtb__149 } -> dtb__149
  | _ -> failwith "DT: impossible branch"
))

# 452 "Vuna/Compiler/Ir/Model.vuna"
let v_Vuna_dCompiler_dIr_dModel_dirEntryShowOf = (fun (mc0 : t_Vuna_dCompiler_dIr_dModel_dIrEntry) -> (match mc0 with
  | { f_Vuna_dCompiler_dIr_dModel_dIrEntry_irEntryShow = dtb__150; f_Vuna_dCompiler_dIr_dModel_dIrEntry_irEntryMain = dtb__151; f_Vuna_dCompiler_dIr_dModel_dIrEntry_irEntryIsAction = dtb__152; f_Vuna_dCompiler_dIr_dModel_dIrEntry_irEntryRunMain = dtb__153; f_Vuna_dCompiler_dIr_dModel_dIrEntry_irEntryHandlers = dtb__154; f_Vuna_dCompiler_dIr_dModel_dIrEntry_irEntryRowTags = dtb__155 } -> dtb__150
  | _ -> failwith "DT: impossible branch"
))

# 456 "Vuna/Compiler/Ir/Model.vuna"
let v_Vuna_dCompiler_dIr_dModel_dirEntryMainOf = (fun (mc0 : t_Vuna_dCompiler_dIr_dModel_dIrEntry) -> (match mc0 with
  | { f_Vuna_dCompiler_dIr_dModel_dIrEntry_irEntryShow = dtb__156; f_Vuna_dCompiler_dIr_dModel_dIrEntry_irEntryMain = dtb__157; f_Vuna_dCompiler_dIr_dModel_dIrEntry_irEntryIsAction = dtb__158; f_Vuna_dCompiler_dIr_dModel_dIrEntry_irEntryRunMain = dtb__159; f_Vuna_dCompiler_dIr_dModel_dIrEntry_irEntryHandlers = dtb__160; f_Vuna_dCompiler_dIr_dModel_dIrEntry_irEntryRowTags = dtb__161 } -> dtb__157
  | _ -> failwith "DT: impossible branch"
))

# 460 "Vuna/Compiler/Ir/Model.vuna"
let v_Vuna_dCompiler_dIr_dModel_dirEntryIsActionOf = (fun (mc0 : t_Vuna_dCompiler_dIr_dModel_dIrEntry) -> (match mc0 with
  | { f_Vuna_dCompiler_dIr_dModel_dIrEntry_irEntryShow = dtb__162; f_Vuna_dCompiler_dIr_dModel_dIrEntry_irEntryMain = dtb__163; f_Vuna_dCompiler_dIr_dModel_dIrEntry_irEntryIsAction = dtb__164; f_Vuna_dCompiler_dIr_dModel_dIrEntry_irEntryRunMain = dtb__165; f_Vuna_dCompiler_dIr_dModel_dIrEntry_irEntryHandlers = dtb__166; f_Vuna_dCompiler_dIr_dModel_dIrEntry_irEntryRowTags = dtb__167 } -> dtb__164
  | _ -> failwith "DT: impossible branch"
))

# 464 "Vuna/Compiler/Ir/Model.vuna"
let v_Vuna_dCompiler_dIr_dModel_dirEntryRunMainOf = (fun (mc0 : t_Vuna_dCompiler_dIr_dModel_dIrEntry) -> (match mc0 with
  | { f_Vuna_dCompiler_dIr_dModel_dIrEntry_irEntryShow = dtb__168; f_Vuna_dCompiler_dIr_dModel_dIrEntry_irEntryMain = dtb__169; f_Vuna_dCompiler_dIr_dModel_dIrEntry_irEntryIsAction = dtb__170; f_Vuna_dCompiler_dIr_dModel_dIrEntry_irEntryRunMain = dtb__171; f_Vuna_dCompiler_dIr_dModel_dIrEntry_irEntryHandlers = dtb__172; f_Vuna_dCompiler_dIr_dModel_dIrEntry_irEntryRowTags = dtb__173 } -> dtb__171
  | _ -> failwith "DT: impossible branch"
))

# 468 "Vuna/Compiler/Ir/Model.vuna"
let v_Vuna_dCompiler_dIr_dModel_dirEntryHandlersOf = (fun (mc0 : t_Vuna_dCompiler_dIr_dModel_dIrEntry) -> (match mc0 with
  | { f_Vuna_dCompiler_dIr_dModel_dIrEntry_irEntryShow = dtb__174; f_Vuna_dCompiler_dIr_dModel_dIrEntry_irEntryMain = dtb__175; f_Vuna_dCompiler_dIr_dModel_dIrEntry_irEntryIsAction = dtb__176; f_Vuna_dCompiler_dIr_dModel_dIrEntry_irEntryRunMain = dtb__177; f_Vuna_dCompiler_dIr_dModel_dIrEntry_irEntryHandlers = dtb__178; f_Vuna_dCompiler_dIr_dModel_dIrEntry_irEntryRowTags = dtb__179 } -> dtb__178
  | _ -> failwith "DT: impossible branch"
))

# 472 "Vuna/Compiler/Ir/Model.vuna"
let v_Vuna_dCompiler_dIr_dModel_dirEntryRowTagsOf = (fun (mc0 : t_Vuna_dCompiler_dIr_dModel_dIrEntry) -> (match mc0 with
  | { f_Vuna_dCompiler_dIr_dModel_dIrEntry_irEntryShow = dtb__180; f_Vuna_dCompiler_dIr_dModel_dIrEntry_irEntryMain = dtb__181; f_Vuna_dCompiler_dIr_dModel_dIrEntry_irEntryIsAction = dtb__182; f_Vuna_dCompiler_dIr_dModel_dIrEntry_irEntryRunMain = dtb__183; f_Vuna_dCompiler_dIr_dModel_dIrEntry_irEntryHandlers = dtb__184; f_Vuna_dCompiler_dIr_dModel_dIrEntry_irEntryRowTags = dtb__185 } -> dtb__185
  | _ -> failwith "DT: impossible branch"
))

# 476 "Vuna/Compiler/Ir/Model.vuna"
let v_Vuna_dCompiler_dIr_dModel_dirProgSharedOf = (fun (mc0 : t_Vuna_dCompiler_dIr_dModel_dIrProgram) -> (match mc0 with
  | { f_Vuna_dCompiler_dIr_dModel_dIrProgram_irProgShared = dtb__186; f_Vuna_dCompiler_dIr_dModel_dIrProgram_irProgUnit = dtb__187 } -> dtb__186
  | _ -> failwith "DT: impossible branch"
))

# 480 "Vuna/Compiler/Ir/Model.vuna"
let v_Vuna_dCompiler_dIr_dModel_dirProgUnitOf = (fun (mc0 : t_Vuna_dCompiler_dIr_dModel_dIrProgram) -> (match mc0 with
  | { f_Vuna_dCompiler_dIr_dModel_dIrProgram_irProgShared = dtb__188; f_Vuna_dCompiler_dIr_dModel_dIrProgram_irProgUnit = dtb__189 } -> dtb__189
  | _ -> failwith "DT: impossible branch"
))
