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
let rec v_Vuna_dCompiler_dIr_dModel_dirTySubstVars = (fun (args : t_Vuna_dCompiler_dIr_dModel_dIrTy Base_dData_dList.t_Base_dData_dList_dList) (ty : t_Vuna_dCompiler_dIr_dModel_dIrTy) -> (match ty with
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

# 87 "Vuna/Compiler/Ir/Model.vuna"
let rec v_Vuna_dCompiler_dIr_dModel_dirTyAnnotatable = (fun (mc0 : t_Vuna_dCompiler_dIr_dModel_dIrTy) -> (match mc0 with
  | C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyFun (dtb__14, dtb__15) -> (if (v_Vuna_dCompiler_dIr_dModel_dirTyAnnotatable dtb__14) then (v_Vuna_dCompiler_dIr_dModel_dirTyAnnotatable dtb__15) else false)
  | C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyData (dtb__16, dtb__17) -> (v_Vuna_dCompiler_dIr_dModel_dallAnnotatableIrTys dtb__17)
  | C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyRef (dtb__18) -> (v_Vuna_dCompiler_dIr_dModel_dirTyAnnotatable dtb__18)
  | C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyArray (dtb__19) -> (v_Vuna_dCompiler_dIr_dModel_dirTyAnnotatable dtb__19)
  | C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyOpaque -> false
  | C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyFloat -> true
  | C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyBool -> true
  | C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyStr -> true
  | C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyInt -> true
  | C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyVar (dtb__20) -> false
  | _ -> failwith "DT: impossible branch"
))
# 99 "Vuna/Compiler/Ir/Model.vuna"
and v_Vuna_dCompiler_dIr_dModel_dallAnnotatableIrTys = (fun (mc0 : t_Vuna_dCompiler_dIr_dModel_dIrTy Base_dData_dList.t_Base_dData_dList_dList) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__21, dtb__22) -> (if (v_Vuna_dCompiler_dIr_dModel_dirTyAnnotatable dtb__21) then (v_Vuna_dCompiler_dIr_dModel_dallAnnotatableIrTys dtb__22) else false)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

# 128 "Vuna/Compiler/Ir/Model.vuna"
let v_Vuna_dCompiler_dIr_dModel_dmkIrBinder = (fun (name : string) -> { f_Vuna_dCompiler_dIr_dModel_dIrBinder_irBinderName = (C_Vuna_dCompiler_dIr_dModel_dIrBName_IrBUser (name)); f_Vuna_dCompiler_dIr_dModel_dIrBinder_irBinderErased = false; f_Vuna_dCompiler_dIr_dModel_dIrBinder_irBinderTy = Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing })

# 132 "Vuna/Compiler/Ir/Model.vuna"
let v_Vuna_dCompiler_dIr_dModel_dmkIrBinderTyped = (fun (name : string) (ty : t_Vuna_dCompiler_dIr_dModel_dIrTy) -> { f_Vuna_dCompiler_dIr_dModel_dIrBinder_irBinderName = (C_Vuna_dCompiler_dIr_dModel_dIrBName_IrBUser (name)); f_Vuna_dCompiler_dIr_dModel_dIrBinder_irBinderErased = false; f_Vuna_dCompiler_dIr_dModel_dIrBinder_irBinderTy = (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (ty)) })

# 136 "Vuna/Compiler/Ir/Model.vuna"
let v_Vuna_dCompiler_dIr_dModel_dmkIrBinderErased = { f_Vuna_dCompiler_dIr_dModel_dIrBinder_irBinderName = C_Vuna_dCompiler_dIr_dModel_dIrBName_IrBWild; f_Vuna_dCompiler_dIr_dModel_dIrBinder_irBinderErased = true; f_Vuna_dCompiler_dIr_dModel_dIrBinder_irBinderTy = Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing }

# 140 "Vuna/Compiler/Ir/Model.vuna"
let v_Vuna_dCompiler_dIr_dModel_dmkIrBinderArm = (fun (n : int) -> { f_Vuna_dCompiler_dIr_dModel_dIrBinder_irBinderName = (C_Vuna_dCompiler_dIr_dModel_dIrBName_IrBArm (n)); f_Vuna_dCompiler_dIr_dModel_dIrBinder_irBinderErased = false; f_Vuna_dCompiler_dIr_dModel_dIrBinder_irBinderTy = Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing })

# 144 "Vuna/Compiler/Ir/Model.vuna"
let v_Vuna_dCompiler_dIr_dModel_dmkIrBinderNat = (fun (n : int) -> { f_Vuna_dCompiler_dIr_dModel_dIrBinder_irBinderName = (C_Vuna_dCompiler_dIr_dModel_dIrBName_IrBNat (n)); f_Vuna_dCompiler_dIr_dModel_dIrBinder_irBinderErased = false; f_Vuna_dCompiler_dIr_dModel_dIrBinder_irBinderTy = Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing })

# 148 "Vuna/Compiler/Ir/Model.vuna"
let v_Vuna_dCompiler_dIr_dModel_dmkIrBinderWild = { f_Vuna_dCompiler_dIr_dModel_dIrBinder_irBinderName = C_Vuna_dCompiler_dIr_dModel_dIrBName_IrBWild; f_Vuna_dCompiler_dIr_dModel_dIrBinder_irBinderErased = false; f_Vuna_dCompiler_dIr_dModel_dIrBinder_irBinderTy = Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing }

# 258 "Vuna/Compiler/Ir/Model.vuna"
let rec v_Vuna_dCompiler_dIr_dModel_dirLamTyFuel = (fun (fuel : int) (bodyTy : t_Vuna_dCompiler_dIr_dModel_dIrTy Base_dData_dMaybe.t_Base_dData_dMaybe_dMaybe) (bs : t_Vuna_dCompiler_dIr_dModel_dIrBinder Base_dData_dList.t_Base_dData_dList_dList) -> (if (fuel <= 0) then Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing else (match bs with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> bodyTy
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__23, dtb__24) -> (match (((v_Vuna_dCompiler_dIr_dModel_dirLamTyFuel (fuel - 1)) bodyTy) dtb__24) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__25) -> (if (dtb__23).f_Vuna_dCompiler_dIr_dModel_dIrBinder_irBinderErased then (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__25)) else (match (dtb__23).f_Vuna_dCompiler_dIr_dModel_dIrBinder_irBinderTy with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__26) -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ((C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyFun (dtb__26, dtb__25))))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ((C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyFun (C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyOpaque, dtb__25))))
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))

# 227 "Vuna/Compiler/Ir/Model.vuna"
let rec v_Vuna_dCompiler_dIr_dModel_dirResultTyFuel = (fun (fuel : int) (ir : t_Vuna_dCompiler_dIr_dModel_dIr) -> (if (fuel <= 0) then Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing else (match ir with
  | C_Vuna_dCompiler_dIr_dModel_dIr_IrVar (dtb__27) -> (if (dtb__27).f_Vuna_dCompiler_dIr_dModel_dIrBinder_irBinderErased then Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing else (dtb__27).f_Vuna_dCompiler_dIr_dModel_dIrBinder_irBinderTy)
  | C_Vuna_dCompiler_dIr_dModel_dIr_IrRecord (dtb__28, dtb__29, dtb__30) -> dtb__29
  | C_Vuna_dCompiler_dIr_dModel_dIr_IrProj (dtb__31, dtb__32, dtb__33, dtb__34) -> dtb__34
  | C_Vuna_dCompiler_dIr_dModel_dIr_IrRecUpd (dtb__35, dtb__36, dtb__37, dtb__38) -> dtb__38
  | C_Vuna_dCompiler_dIr_dModel_dIr_IrCast (dtb__39, dtb__40, dtb__41) -> dtb__40
  | C_Vuna_dCompiler_dIr_dModel_dIr_IrInt (dtb__42) -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyInt))
  | C_Vuna_dCompiler_dIr_dModel_dIr_IrStr (dtb__43) -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyStr))
  | C_Vuna_dCompiler_dIr_dModel_dIr_IrBool (dtb__44) -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyBool))
  | C_Vuna_dCompiler_dIr_dModel_dIr_IrFloatLit (dtb__45) -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyFloat))
  | C_Vuna_dCompiler_dIr_dModel_dIr_IrLet (dtb__46, dtb__47, dtb__48) -> ((v_Vuna_dCompiler_dIr_dModel_dirResultTyFuel (fuel - 1)) dtb__48)
  | C_Vuna_dCompiler_dIr_dModel_dIr_IrLam (dtb__49, dtb__50, dtb__51) -> (((v_Vuna_dCompiler_dIr_dModel_dirLamTyFuel (fuel - 1)) dtb__50) dtb__49)
  | C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (dtb__52, dtb__53, dtb__54) -> (match dtb__52 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__55) -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ((Base_dData_dPair.v_Base_dData_dPair_dsecondOf dtb__55)))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)
  | C_Vuna_dCompiler_dIr_dModel_dIr_IrIf (dtb__56, dtb__57, dtb__58) -> (match ((v_Vuna_dCompiler_dIr_dModel_dirResultTyFuel (fuel - 1)) dtb__57) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__59) -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__59))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> ((v_Vuna_dCompiler_dIr_dModel_dirResultTyFuel (fuel - 1)) dtb__58)
  | _ -> failwith "DT: impossible branch"
)
  | C_Vuna_dCompiler_dIr_dModel_dIr_IrCase (dtb__60, dtb__61, dtb__62, dtb__63) -> dtb__61
  | C_Vuna_dCompiler_dIr_dModel_dIr_IrConcatMany (dtb__64) -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyStr))
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
)))

# 224 "Vuna/Compiler/Ir/Model.vuna"
let v_Vuna_dCompiler_dIr_dModel_dirResultTyOf = (fun (ir : t_Vuna_dCompiler_dIr_dModel_dIr) -> ((v_Vuna_dCompiler_dIr_dModel_dirResultTyFuel 256) ir))

# 277 "Vuna/Compiler/Ir/Model.vuna"
let v_Vuna_dCompiler_dIr_dModel_dirEffTypeName = "Base.Effect.Core.Eff"

# 280 "Vuna/Compiler/Ir/Model.vuna"
let v_Vuna_dCompiler_dIr_dModel_dirEffMkCtor = "Base.Effect.Core.Eff.MkEff"

# 310 "Vuna/Compiler/Ir/Model.vuna"
let v_Vuna_dCompiler_dIr_dModel_dirDefName = (fun (mc0 : t_Vuna_dCompiler_dIr_dModel_dIrDef) -> (match mc0 with
  | C_Vuna_dCompiler_dIr_dModel_dIrDef_IrExternDef (dtb__65, dtb__66, dtb__67, dtb__68) -> dtb__65
  | C_Vuna_dCompiler_dIr_dModel_dIrDef_IrDef (dtb__69, dtb__70, dtb__71, dtb__72, dtb__73, dtb__74, dtb__75, dtb__76) -> dtb__69
  | _ -> failwith "DT: impossible branch"
))

# 314 "Vuna/Compiler/Ir/Model.vuna"
let v_Vuna_dCompiler_dIr_dModel_dirDefArity = (fun (mc0 : t_Vuna_dCompiler_dIr_dModel_dIrDef) -> (match mc0 with
  | C_Vuna_dCompiler_dIr_dModel_dIrDef_IrExternDef (dtb__77, dtb__78, dtb__79, dtb__80) -> 0
  | C_Vuna_dCompiler_dIr_dModel_dIrDef_IrDef (dtb__81, dtb__82, dtb__83, dtb__84, dtb__85, dtb__86, dtb__87, dtb__88) -> dtb__82
  | _ -> failwith "DT: impossible branch"
))

# 318 "Vuna/Compiler/Ir/Model.vuna"
let v_Vuna_dCompiler_dIr_dModel_dirDefDeps = (fun (mc0 : t_Vuna_dCompiler_dIr_dModel_dIrDef) -> (match mc0 with
  | C_Vuna_dCompiler_dIr_dModel_dIrDef_IrExternDef (dtb__89, dtb__90, dtb__91, dtb__92) -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | C_Vuna_dCompiler_dIr_dModel_dIrDef_IrDef (dtb__93, dtb__94, dtb__95, dtb__96, dtb__97, dtb__98, dtb__99, dtb__100) -> dtb__95
  | _ -> failwith "DT: impossible branch"
))

# 322 "Vuna/Compiler/Ir/Model.vuna"
let v_Vuna_dCompiler_dIr_dModel_dirDefTy = (fun (mc0 : t_Vuna_dCompiler_dIr_dModel_dIrDef) -> (match mc0 with
  | C_Vuna_dCompiler_dIr_dModel_dIrDef_IrExternDef (dtb__101, dtb__102, dtb__103, dtb__104) -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__102))
  | C_Vuna_dCompiler_dIr_dModel_dIrDef_IrDef (dtb__105, dtb__106, dtb__107, dtb__108, dtb__109, dtb__110, dtb__111, dtb__112) -> dtb__108
  | _ -> failwith "DT: impossible branch"
))

# 326 "Vuna/Compiler/Ir/Model.vuna"
let v_Vuna_dCompiler_dIr_dModel_dirDefBody = (fun (mc0 : t_Vuna_dCompiler_dIr_dModel_dIrDef) -> (match mc0 with
  | C_Vuna_dCompiler_dIr_dModel_dIrDef_IrExternDef (dtb__113, dtb__114, dtb__115, dtb__116) -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | C_Vuna_dCompiler_dIr_dModel_dIrDef_IrDef (dtb__117, dtb__118, dtb__119, dtb__120, dtb__121, dtb__122, dtb__123, dtb__124) -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__121))
  | _ -> failwith "DT: impossible branch"
))

# 330 "Vuna/Compiler/Ir/Model.vuna"
let v_Vuna_dCompiler_dIr_dModel_dirDefExtern = (fun (mc0 : t_Vuna_dCompiler_dIr_dModel_dIrDef) -> (match mc0 with
  | C_Vuna_dCompiler_dIr_dModel_dIrDef_IrExternDef (dtb__125, dtb__126, dtb__127, dtb__128) -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__126; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__127 }))
  | C_Vuna_dCompiler_dIr_dModel_dIrDef_IrDef (dtb__129, dtb__130, dtb__131, dtb__132, dtb__133, dtb__134, dtb__135, dtb__136) -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 335 "Vuna/Compiler/Ir/Model.vuna"
let v_Vuna_dCompiler_dIr_dModel_dirDefRecValueOk = (fun (mc0 : t_Vuna_dCompiler_dIr_dModel_dIrDef) -> (match mc0 with
  | C_Vuna_dCompiler_dIr_dModel_dIrDef_IrExternDef (dtb__137, dtb__138, dtb__139, dtb__140) -> true
  | C_Vuna_dCompiler_dIr_dModel_dIrDef_IrDef (dtb__141, dtb__142, dtb__143, dtb__144, dtb__145, dtb__146, dtb__147, dtb__148) -> dtb__146
  | _ -> failwith "DT: impossible branch"
))

# 340 "Vuna/Compiler/Ir/Model.vuna"
let v_Vuna_dCompiler_dIr_dModel_dirDefInitGuard = (fun (mc0 : t_Vuna_dCompiler_dIr_dModel_dIrDef) -> (match mc0 with
  | C_Vuna_dCompiler_dIr_dModel_dIrDef_IrExternDef (dtb__149, dtb__150, dtb__151, dtb__152) -> false
  | C_Vuna_dCompiler_dIr_dModel_dIrDef_IrDef (dtb__153, dtb__154, dtb__155, dtb__156, dtb__157, dtb__158, dtb__159, dtb__160) -> dtb__159
  | _ -> failwith "DT: impossible branch"
))

# 344 "Vuna/Compiler/Ir/Model.vuna"
let v_Vuna_dCompiler_dIr_dModel_dirDefSpan = (fun (mc0 : t_Vuna_dCompiler_dIr_dModel_dIrDef) -> (match mc0 with
  | C_Vuna_dCompiler_dIr_dModel_dIrDef_IrExternDef (dtb__161, dtb__162, dtb__163, dtb__164) -> dtb__164
  | C_Vuna_dCompiler_dIr_dModel_dIrDef_IrDef (dtb__165, dtb__166, dtb__167, dtb__168, dtb__169, dtb__170, dtb__171, dtb__172) -> dtb__172
  | _ -> failwith "DT: impossible branch"
))

# 353 "Vuna/Compiler/Ir/Model.vuna"
let v_Vuna_dCompiler_dIr_dModel_dirGroupIsRec = (fun (mc0 : t_Vuna_dCompiler_dIr_dModel_dIrGroup) -> (match mc0 with
  | { f_Vuna_dCompiler_dIr_dModel_dIrGroup_irGroupIsRec = dtb__173; f_Vuna_dCompiler_dIr_dModel_dIrGroup_irGroupDefs = dtb__174 } -> dtb__173
  | _ -> failwith "DT: impossible branch"
))

# 356 "Vuna/Compiler/Ir/Model.vuna"
let v_Vuna_dCompiler_dIr_dModel_dirGroupDefs = (fun (mc0 : t_Vuna_dCompiler_dIr_dModel_dIrGroup) -> (match mc0 with
  | { f_Vuna_dCompiler_dIr_dModel_dIrGroup_irGroupIsRec = dtb__175; f_Vuna_dCompiler_dIr_dModel_dIrGroup_irGroupDefs = dtb__176 } -> dtb__176
  | _ -> failwith "DT: impossible branch"
))

# 415 "Vuna/Compiler/Ir/Model.vuna"
let rec v_Vuna_dCompiler_dIr_dModel_dirSharedUnboxedOf = (fun (mc0 : string) (mc1 : (string, (string, int) Base_dData_dPair.t_Base_dData_dPair_dPair) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__177, dtb__178) -> (if ((Base_dData_dPair.v_Base_dData_dPair_dfirstOf dtb__177) = mc0) then (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ((Base_dData_dPair.v_Base_dData_dPair_dsecondOf dtb__177))) else ((v_Vuna_dCompiler_dIr_dModel_dirSharedUnboxedOf mc0) dtb__178))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 420 "Vuna/Compiler/Ir/Model.vuna"
let rec v_Vuna_dCompiler_dIr_dModel_dirSharedCtorShapeOf = (fun (mc0 : string) (mc1 : (string, (string, bool Base_dData_dList.t_Base_dData_dList_dList) Base_dData_dPair.t_Base_dData_dPair_dPair) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__179, dtb__180) -> (if ((Base_dData_dPair.v_Base_dData_dPair_dfirstOf dtb__179) = mc0) then (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ((Base_dData_dPair.v_Base_dData_dPair_dsecondOf dtb__179))) else ((v_Vuna_dCompiler_dIr_dModel_dirSharedCtorShapeOf mc0) dtb__180))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 425 "Vuna/Compiler/Ir/Model.vuna"
let rec v_Vuna_dCompiler_dIr_dModel_dirSharedRecordFieldsOf = (fun (mc0 : string) (mc1 : (string, (int, string) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__181, dtb__182) -> (if ((Base_dData_dPair.v_Base_dData_dPair_dfirstOf dtb__181) = mc0) then (Base_dData_dPair.v_Base_dData_dPair_dsecondOf dtb__181) else ((v_Vuna_dCompiler_dIr_dModel_dirSharedRecordFieldsOf mc0) dtb__182))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 452 "Vuna/Compiler/Ir/Model.vuna"
let v_Vuna_dCompiler_dIr_dModel_dirInlineArity = (fun (mc0 : string) -> (if (mc0 = "+") then 2 else (if (mc0 = "-") then 2 else (if (mc0 = "*") then 2 else (if (mc0 = "/") then 2 else (if (mc0 = "&&") then 2 else (if (mc0 = "||") then 2 else (if (mc0 = "bitAnd") then 2 else (if (mc0 = "bitOr") then 2 else (if (mc0 = "bitXor") then 2 else (if (mc0 = "bitNot") then 1 else (if (mc0 = "bitShl") then 2 else (if (mc0 = "bitShr") then 2 else (if (mc0 = "++") then 2 else (if (mc0 = "bi_eq_int") then 2 else (if (mc0 = "bi_neq_int") then 2 else (if (mc0 = "bi_eq_str") then 2 else (if (mc0 = "bi_neq_str") then 2 else (if (mc0 = "bi_lt_int") then 2 else (if (mc0 = "bi_le_int") then 2 else (if (mc0 = "bi_gt_int") then 2 else (if (mc0 = "bi_ge_int") then 2 else (if (mc0 = "bi_lt_str") then 2 else (if (mc0 = "bi_le_str") then 2 else (if (mc0 = "bi_gt_str") then 2 else (if (mc0 = "bi_ge_str") then 2 else (if (mc0 = "bi_lt_bool") then 2 else (if (mc0 = "bi_le_bool") then 2 else (if (mc0 = "bi_gt_bool") then 2 else (if (mc0 = "bi_ge_bool") then 2 else (if (mc0 = "bi_add_float") then 2 else (if (mc0 = "bi_sub_float") then 2 else (if (mc0 = "bi_mul_float") then 2 else (if (mc0 = "bi_div_float") then 2 else (if (mc0 = "bi_eq_float") then 2 else (if (mc0 = "bi_neq_float") then 2 else (if (mc0 = "bi_lt_float") then 2 else (if (mc0 = "bi_le_float") then 2 else (if (mc0 = "bi_gt_float") then 2 else (if (mc0 = "bi_ge_float") then 2 else (if (mc0 = "@ir@m@runEff") then 2 else (if (mc0 = "natToInt") then 1 else (if (mc0 = "natFromInt") then 1 else (if (mc0 = "natAdd") then 2 else (if (mc0 = "natSub") then 2 else (if (mc0 = "natMul") then 2 else (if (mc0 = "natDiv") then 2 else 0)))))))))))))))))))))))))))))))))))))))))))))))

# 502 "Vuna/Compiler/Ir/Model.vuna"
let v_Vuna_dCompiler_dIr_dModel_dirListFamilyOf = (fun (mc0 : t_Vuna_dCompiler_dIr_dModel_dIrListFam) -> (match mc0 with
  | { f_Vuna_dCompiler_dIr_dModel_dIrListFam_irListFamily = dtb__183; f_Vuna_dCompiler_dIr_dModel_dIrListFam_irListNil = dtb__184; f_Vuna_dCompiler_dIr_dModel_dIrListFam_irListCons = dtb__185 } -> dtb__183
  | _ -> failwith "DT: impossible branch"
))

# 506 "Vuna/Compiler/Ir/Model.vuna"
let v_Vuna_dCompiler_dIr_dModel_dirListNilOf = (fun (mc0 : t_Vuna_dCompiler_dIr_dModel_dIrListFam) -> (match mc0 with
  | { f_Vuna_dCompiler_dIr_dModel_dIrListFam_irListFamily = dtb__186; f_Vuna_dCompiler_dIr_dModel_dIrListFam_irListNil = dtb__187; f_Vuna_dCompiler_dIr_dModel_dIrListFam_irListCons = dtb__188 } -> dtb__187
  | _ -> failwith "DT: impossible branch"
))

# 510 "Vuna/Compiler/Ir/Model.vuna"
let v_Vuna_dCompiler_dIr_dModel_dirListConsOf = (fun (mc0 : t_Vuna_dCompiler_dIr_dModel_dIrListFam) -> (match mc0 with
  | { f_Vuna_dCompiler_dIr_dModel_dIrListFam_irListFamily = dtb__189; f_Vuna_dCompiler_dIr_dModel_dIrListFam_irListNil = dtb__190; f_Vuna_dCompiler_dIr_dModel_dIrListFam_irListCons = dtb__191 } -> dtb__191
  | _ -> failwith "DT: impossible branch"
))

# 514 "Vuna/Compiler/Ir/Model.vuna"
let v_Vuna_dCompiler_dIr_dModel_dirAltCtorOf = (fun (mc0 : t_Vuna_dCompiler_dIr_dModel_dIrAlt) -> (match mc0 with
  | { f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltCtor = dtb__192; f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBinders = dtb__193; f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBody = dtb__194 } -> dtb__192
  | _ -> failwith "DT: impossible branch"
))

# 518 "Vuna/Compiler/Ir/Model.vuna"
let v_Vuna_dCompiler_dIr_dModel_dirAltBindersOf = (fun (mc0 : t_Vuna_dCompiler_dIr_dModel_dIrAlt) -> (match mc0 with
  | { f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltCtor = dtb__195; f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBinders = dtb__196; f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBody = dtb__197 } -> dtb__196
  | _ -> failwith "DT: impossible branch"
))

# 522 "Vuna/Compiler/Ir/Model.vuna"
let v_Vuna_dCompiler_dIr_dModel_dirAltBodyOf = (fun (mc0 : t_Vuna_dCompiler_dIr_dModel_dIrAlt) -> (match mc0 with
  | { f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltCtor = dtb__198; f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBinders = dtb__199; f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBody = dtb__200 } -> dtb__200
  | _ -> failwith "DT: impossible branch"
))

# 526 "Vuna/Compiler/Ir/Model.vuna"
let v_Vuna_dCompiler_dIr_dModel_dirEntryShowOf = (fun (mc0 : t_Vuna_dCompiler_dIr_dModel_dIrEntry) -> (match mc0 with
  | { f_Vuna_dCompiler_dIr_dModel_dIrEntry_irEntryShow = dtb__201; f_Vuna_dCompiler_dIr_dModel_dIrEntry_irEntryMain = dtb__202; f_Vuna_dCompiler_dIr_dModel_dIrEntry_irEntryIsAction = dtb__203; f_Vuna_dCompiler_dIr_dModel_dIrEntry_irEntryRunMain = dtb__204; f_Vuna_dCompiler_dIr_dModel_dIrEntry_irEntryHandlers = dtb__205; f_Vuna_dCompiler_dIr_dModel_dIrEntry_irEntryRowTags = dtb__206 } -> dtb__201
  | _ -> failwith "DT: impossible branch"
))

# 530 "Vuna/Compiler/Ir/Model.vuna"
let v_Vuna_dCompiler_dIr_dModel_dirEntryMainOf = (fun (mc0 : t_Vuna_dCompiler_dIr_dModel_dIrEntry) -> (match mc0 with
  | { f_Vuna_dCompiler_dIr_dModel_dIrEntry_irEntryShow = dtb__207; f_Vuna_dCompiler_dIr_dModel_dIrEntry_irEntryMain = dtb__208; f_Vuna_dCompiler_dIr_dModel_dIrEntry_irEntryIsAction = dtb__209; f_Vuna_dCompiler_dIr_dModel_dIrEntry_irEntryRunMain = dtb__210; f_Vuna_dCompiler_dIr_dModel_dIrEntry_irEntryHandlers = dtb__211; f_Vuna_dCompiler_dIr_dModel_dIrEntry_irEntryRowTags = dtb__212 } -> dtb__208
  | _ -> failwith "DT: impossible branch"
))

# 534 "Vuna/Compiler/Ir/Model.vuna"
let v_Vuna_dCompiler_dIr_dModel_dirEntryIsActionOf = (fun (mc0 : t_Vuna_dCompiler_dIr_dModel_dIrEntry) -> (match mc0 with
  | { f_Vuna_dCompiler_dIr_dModel_dIrEntry_irEntryShow = dtb__213; f_Vuna_dCompiler_dIr_dModel_dIrEntry_irEntryMain = dtb__214; f_Vuna_dCompiler_dIr_dModel_dIrEntry_irEntryIsAction = dtb__215; f_Vuna_dCompiler_dIr_dModel_dIrEntry_irEntryRunMain = dtb__216; f_Vuna_dCompiler_dIr_dModel_dIrEntry_irEntryHandlers = dtb__217; f_Vuna_dCompiler_dIr_dModel_dIrEntry_irEntryRowTags = dtb__218 } -> dtb__215
  | _ -> failwith "DT: impossible branch"
))

# 538 "Vuna/Compiler/Ir/Model.vuna"
let v_Vuna_dCompiler_dIr_dModel_dirEntryRunMainOf = (fun (mc0 : t_Vuna_dCompiler_dIr_dModel_dIrEntry) -> (match mc0 with
  | { f_Vuna_dCompiler_dIr_dModel_dIrEntry_irEntryShow = dtb__219; f_Vuna_dCompiler_dIr_dModel_dIrEntry_irEntryMain = dtb__220; f_Vuna_dCompiler_dIr_dModel_dIrEntry_irEntryIsAction = dtb__221; f_Vuna_dCompiler_dIr_dModel_dIrEntry_irEntryRunMain = dtb__222; f_Vuna_dCompiler_dIr_dModel_dIrEntry_irEntryHandlers = dtb__223; f_Vuna_dCompiler_dIr_dModel_dIrEntry_irEntryRowTags = dtb__224 } -> dtb__222
  | _ -> failwith "DT: impossible branch"
))

# 542 "Vuna/Compiler/Ir/Model.vuna"
let v_Vuna_dCompiler_dIr_dModel_dirEntryHandlersOf = (fun (mc0 : t_Vuna_dCompiler_dIr_dModel_dIrEntry) -> (match mc0 with
  | { f_Vuna_dCompiler_dIr_dModel_dIrEntry_irEntryShow = dtb__225; f_Vuna_dCompiler_dIr_dModel_dIrEntry_irEntryMain = dtb__226; f_Vuna_dCompiler_dIr_dModel_dIrEntry_irEntryIsAction = dtb__227; f_Vuna_dCompiler_dIr_dModel_dIrEntry_irEntryRunMain = dtb__228; f_Vuna_dCompiler_dIr_dModel_dIrEntry_irEntryHandlers = dtb__229; f_Vuna_dCompiler_dIr_dModel_dIrEntry_irEntryRowTags = dtb__230 } -> dtb__229
  | _ -> failwith "DT: impossible branch"
))

# 546 "Vuna/Compiler/Ir/Model.vuna"
let v_Vuna_dCompiler_dIr_dModel_dirEntryRowTagsOf = (fun (mc0 : t_Vuna_dCompiler_dIr_dModel_dIrEntry) -> (match mc0 with
  | { f_Vuna_dCompiler_dIr_dModel_dIrEntry_irEntryShow = dtb__231; f_Vuna_dCompiler_dIr_dModel_dIrEntry_irEntryMain = dtb__232; f_Vuna_dCompiler_dIr_dModel_dIrEntry_irEntryIsAction = dtb__233; f_Vuna_dCompiler_dIr_dModel_dIrEntry_irEntryRunMain = dtb__234; f_Vuna_dCompiler_dIr_dModel_dIrEntry_irEntryHandlers = dtb__235; f_Vuna_dCompiler_dIr_dModel_dIrEntry_irEntryRowTags = dtb__236 } -> dtb__236
  | _ -> failwith "DT: impossible branch"
))

# 550 "Vuna/Compiler/Ir/Model.vuna"
let v_Vuna_dCompiler_dIr_dModel_dirProgSharedOf = (fun (mc0 : t_Vuna_dCompiler_dIr_dModel_dIrProgram) -> (match mc0 with
  | { f_Vuna_dCompiler_dIr_dModel_dIrProgram_irProgShared = dtb__237; f_Vuna_dCompiler_dIr_dModel_dIrProgram_irProgUnit = dtb__238 } -> dtb__237
  | _ -> failwith "DT: impossible branch"
))

# 554 "Vuna/Compiler/Ir/Model.vuna"
let v_Vuna_dCompiler_dIr_dModel_dirProgUnitOf = (fun (mc0 : t_Vuna_dCompiler_dIr_dModel_dIrProgram) -> (match mc0 with
  | { f_Vuna_dCompiler_dIr_dModel_dIrProgram_irProgShared = dtb__239; f_Vuna_dCompiler_dIr_dModel_dIrProgram_irProgUnit = dtb__240 } -> dtb__240
  | _ -> failwith "DT: impossible branch"
))
