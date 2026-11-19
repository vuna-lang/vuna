open Vuna_runtime
type t_Vuna_dCompiler_dIr_dModel_dIrTy = C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyVar of (int) | C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyInt | C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyStr | C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyBool | C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyFloat | C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyOpaque | C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyArray of (t_Vuna_dCompiler_dIr_dModel_dIrTy) | C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyRef of (t_Vuna_dCompiler_dIr_dModel_dIrTy) | C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyData of (string) * (t_Vuna_dCompiler_dIr_dModel_dIrTy Base_dData_dList.t_Base_dData_dList_dList) | C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyFun of (t_Vuna_dCompiler_dIr_dModel_dIrTy) * (t_Vuna_dCompiler_dIr_dModel_dIrTy)
and t_Vuna_dCompiler_dIr_dModel_dIrBName = C_Vuna_dCompiler_dIr_dModel_dIrBName_IrBUser of (string) | C_Vuna_dCompiler_dIr_dModel_dIrBName_IrBArm of (int) | C_Vuna_dCompiler_dIr_dModel_dIrBName_IrBNat of (int) | C_Vuna_dCompiler_dIr_dModel_dIrBName_IrBWild
and t_Vuna_dCompiler_dIr_dModel_dIrBinder = { f_Vuna_dCompiler_dIr_dModel_dIrBinder_irBinderName : t_Vuna_dCompiler_dIr_dModel_dIrBName; f_Vuna_dCompiler_dIr_dModel_dIrBinder_irBinderErased : bool; f_Vuna_dCompiler_dIr_dModel_dIrBinder_irBinderTy : t_Vuna_dCompiler_dIr_dModel_dIrTy Base_dData_dMaybe.t_Base_dData_dMaybe_dMaybe }
and t_Vuna_dCompiler_dIr_dModel_dIrAlt = { f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltCtor : (string, string) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dMaybe.t_Base_dData_dMaybe_dMaybe; f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBinders : t_Vuna_dCompiler_dIr_dModel_dIrBinder Base_dData_dList.t_Base_dData_dList_dList; f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBody : t_Vuna_dCompiler_dIr_dModel_dIr }
and t_Vuna_dCompiler_dIr_dModel_dIr = C_Vuna_dCompiler_dIr_dModel_dIr_IrVar of (t_Vuna_dCompiler_dIr_dModel_dIrBinder) | C_Vuna_dCompiler_dIr_dModel_dIr_IrGlobal of (string) | C_Vuna_dCompiler_dIr_dModel_dIr_IrCtor of (string) * (string) * (t_Vuna_dCompiler_dIr_dModel_dIrTy Base_dData_dList.t_Base_dData_dList_dList Base_dData_dMaybe.t_Base_dData_dMaybe_dMaybe) * (t_Vuna_dCompiler_dIr_dModel_dIr Base_dData_dList.t_Base_dData_dList_dList) | C_Vuna_dCompiler_dIr_dModel_dIr_IrRecord of (string) * (t_Vuna_dCompiler_dIr_dModel_dIrTy Base_dData_dMaybe.t_Base_dData_dMaybe_dMaybe) * ((string, t_Vuna_dCompiler_dIr_dModel_dIr) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) | C_Vuna_dCompiler_dIr_dModel_dIr_IrProj of (t_Vuna_dCompiler_dIr_dModel_dIr) * (string) * (string) * (t_Vuna_dCompiler_dIr_dModel_dIrTy Base_dData_dMaybe.t_Base_dData_dMaybe_dMaybe) | C_Vuna_dCompiler_dIr_dModel_dIr_IrRecUpd of (t_Vuna_dCompiler_dIr_dModel_dIr) * (string) * ((string, t_Vuna_dCompiler_dIr_dModel_dIr) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) * (t_Vuna_dCompiler_dIr_dModel_dIrTy Base_dData_dMaybe.t_Base_dData_dMaybe_dMaybe) | C_Vuna_dCompiler_dIr_dModel_dIr_IrRt of (string) | C_Vuna_dCompiler_dIr_dModel_dIr_IrRtApp of (string) * (t_Vuna_dCompiler_dIr_dModel_dIr Base_dData_dList.t_Base_dData_dList_dList) | C_Vuna_dCompiler_dIr_dModel_dIr_IrCast of (t_Vuna_dCompiler_dIr_dModel_dIrTy Base_dData_dMaybe.t_Base_dData_dMaybe_dMaybe) * (t_Vuna_dCompiler_dIr_dModel_dIrTy Base_dData_dMaybe.t_Base_dData_dMaybe_dMaybe) * (t_Vuna_dCompiler_dIr_dModel_dIr) | C_Vuna_dCompiler_dIr_dModel_dIr_IrInt of (int) | C_Vuna_dCompiler_dIr_dModel_dIr_IrStr of (string) | C_Vuna_dCompiler_dIr_dModel_dIr_IrBool of (bool) | C_Vuna_dCompiler_dIr_dModel_dIr_IrFloatLit of (string) | C_Vuna_dCompiler_dIr_dModel_dIr_IrLet of (t_Vuna_dCompiler_dIr_dModel_dIrBinder Base_dData_dList.t_Base_dData_dList_dList) * (t_Vuna_dCompiler_dIr_dModel_dIr) * (t_Vuna_dCompiler_dIr_dModel_dIr) | C_Vuna_dCompiler_dIr_dModel_dIr_IrLam of (t_Vuna_dCompiler_dIr_dModel_dIrBinder Base_dData_dList.t_Base_dData_dList_dList) * (t_Vuna_dCompiler_dIr_dModel_dIrTy Base_dData_dMaybe.t_Base_dData_dMaybe_dMaybe) * (t_Vuna_dCompiler_dIr_dModel_dIr) | C_Vuna_dCompiler_dIr_dModel_dIr_IrApp of ((t_Vuna_dCompiler_dIr_dModel_dIrTy, t_Vuna_dCompiler_dIr_dModel_dIrTy) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dMaybe.t_Base_dData_dMaybe_dMaybe) * (t_Vuna_dCompiler_dIr_dModel_dIr) * (t_Vuna_dCompiler_dIr_dModel_dIr) | C_Vuna_dCompiler_dIr_dModel_dIr_IrTail of (t_Vuna_dCompiler_dIr_dModel_dIr) | C_Vuna_dCompiler_dIr_dModel_dIr_IrIf of (t_Vuna_dCompiler_dIr_dModel_dIr) * (t_Vuna_dCompiler_dIr_dModel_dIr) * (t_Vuna_dCompiler_dIr_dModel_dIr) | C_Vuna_dCompiler_dIr_dModel_dIr_IrCase of (t_Vuna_dCompiler_dIr_dModel_dIrTy Base_dData_dMaybe.t_Base_dData_dMaybe_dMaybe) * (t_Vuna_dCompiler_dIr_dModel_dIrTy Base_dData_dMaybe.t_Base_dData_dMaybe_dMaybe) * (t_Vuna_dCompiler_dIr_dModel_dIr) * (t_Vuna_dCompiler_dIr_dModel_dIrAlt Base_dData_dList.t_Base_dData_dList_dList) | C_Vuna_dCompiler_dIr_dModel_dIr_IrNatCase of (t_Vuna_dCompiler_dIr_dModel_dIr) * (int) * (t_Vuna_dCompiler_dIr_dModel_dIrAlt Base_dData_dMaybe.t_Base_dData_dMaybe_dMaybe) * (t_Vuna_dCompiler_dIr_dModel_dIrAlt Base_dData_dMaybe.t_Base_dData_dMaybe_dMaybe) * (t_Vuna_dCompiler_dIr_dModel_dIrAlt Base_dData_dMaybe.t_Base_dData_dMaybe_dMaybe) | C_Vuna_dCompiler_dIr_dModel_dIr_IrConcatMany of (t_Vuna_dCompiler_dIr_dModel_dIr Base_dData_dList.t_Base_dData_dList_dList) | C_Vuna_dCompiler_dIr_dModel_dIr_IrEffThunk of (string) * (string) * (t_Vuna_dCompiler_dIr_dModel_dIrTy) * (int) * (t_Vuna_dCompiler_dIr_dModel_dIr) | C_Vuna_dCompiler_dIr_dModel_dIr_IrEffBind of (string) * (string) * (t_Vuna_dCompiler_dIr_dModel_dIrTy)
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

# 262 "Vuna/Compiler/Ir/Model.vuna"
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

# 230 "Vuna/Compiler/Ir/Model.vuna"
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
  | C_Vuna_dCompiler_dIr_dModel_dIr_IrTail (dtb__56) -> ((v_Vuna_dCompiler_dIr_dModel_dirResultTyFuel (fuel - 1)) dtb__56)
  | C_Vuna_dCompiler_dIr_dModel_dIr_IrIf (dtb__57, dtb__58, dtb__59) -> (match ((v_Vuna_dCompiler_dIr_dModel_dirResultTyFuel (fuel - 1)) dtb__58) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__60) -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__60))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> ((v_Vuna_dCompiler_dIr_dModel_dirResultTyFuel (fuel - 1)) dtb__59)
  | _ -> failwith "DT: impossible branch"
)
  | C_Vuna_dCompiler_dIr_dModel_dIr_IrCase (dtb__61, dtb__62, dtb__63, dtb__64) -> dtb__62
  | C_Vuna_dCompiler_dIr_dModel_dIr_IrConcatMany (dtb__65) -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyStr))
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
)))

# 227 "Vuna/Compiler/Ir/Model.vuna"
let v_Vuna_dCompiler_dIr_dModel_dirResultTyOf = (fun (ir : t_Vuna_dCompiler_dIr_dModel_dIr) -> ((v_Vuna_dCompiler_dIr_dModel_dirResultTyFuel 256) ir))

# 281 "Vuna/Compiler/Ir/Model.vuna"
let v_Vuna_dCompiler_dIr_dModel_dirEffTypeName = "Base.Effect.Core.Eff"

# 284 "Vuna/Compiler/Ir/Model.vuna"
let v_Vuna_dCompiler_dIr_dModel_dirEffMkCtor = "Base.Effect.Core.Eff.MkEff"

# 314 "Vuna/Compiler/Ir/Model.vuna"
let v_Vuna_dCompiler_dIr_dModel_dirDefName = (fun (mc0 : t_Vuna_dCompiler_dIr_dModel_dIrDef) -> (match mc0 with
  | C_Vuna_dCompiler_dIr_dModel_dIrDef_IrExternDef (dtb__66, dtb__67, dtb__68, dtb__69) -> dtb__66
  | C_Vuna_dCompiler_dIr_dModel_dIrDef_IrDef (dtb__70, dtb__71, dtb__72, dtb__73, dtb__74, dtb__75, dtb__76, dtb__77) -> dtb__70
  | _ -> failwith "DT: impossible branch"
))

# 318 "Vuna/Compiler/Ir/Model.vuna"
let v_Vuna_dCompiler_dIr_dModel_dirDefArity = (fun (mc0 : t_Vuna_dCompiler_dIr_dModel_dIrDef) -> (match mc0 with
  | C_Vuna_dCompiler_dIr_dModel_dIrDef_IrExternDef (dtb__78, dtb__79, dtb__80, dtb__81) -> 0
  | C_Vuna_dCompiler_dIr_dModel_dIrDef_IrDef (dtb__82, dtb__83, dtb__84, dtb__85, dtb__86, dtb__87, dtb__88, dtb__89) -> dtb__83
  | _ -> failwith "DT: impossible branch"
))

# 322 "Vuna/Compiler/Ir/Model.vuna"
let v_Vuna_dCompiler_dIr_dModel_dirDefDeps = (fun (mc0 : t_Vuna_dCompiler_dIr_dModel_dIrDef) -> (match mc0 with
  | C_Vuna_dCompiler_dIr_dModel_dIrDef_IrExternDef (dtb__90, dtb__91, dtb__92, dtb__93) -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | C_Vuna_dCompiler_dIr_dModel_dIrDef_IrDef (dtb__94, dtb__95, dtb__96, dtb__97, dtb__98, dtb__99, dtb__100, dtb__101) -> dtb__96
  | _ -> failwith "DT: impossible branch"
))

# 326 "Vuna/Compiler/Ir/Model.vuna"
let v_Vuna_dCompiler_dIr_dModel_dirDefTy = (fun (mc0 : t_Vuna_dCompiler_dIr_dModel_dIrDef) -> (match mc0 with
  | C_Vuna_dCompiler_dIr_dModel_dIrDef_IrExternDef (dtb__102, dtb__103, dtb__104, dtb__105) -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__103))
  | C_Vuna_dCompiler_dIr_dModel_dIrDef_IrDef (dtb__106, dtb__107, dtb__108, dtb__109, dtb__110, dtb__111, dtb__112, dtb__113) -> dtb__109
  | _ -> failwith "DT: impossible branch"
))

# 330 "Vuna/Compiler/Ir/Model.vuna"
let v_Vuna_dCompiler_dIr_dModel_dirDefBody = (fun (mc0 : t_Vuna_dCompiler_dIr_dModel_dIrDef) -> (match mc0 with
  | C_Vuna_dCompiler_dIr_dModel_dIrDef_IrExternDef (dtb__114, dtb__115, dtb__116, dtb__117) -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | C_Vuna_dCompiler_dIr_dModel_dIrDef_IrDef (dtb__118, dtb__119, dtb__120, dtb__121, dtb__122, dtb__123, dtb__124, dtb__125) -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__122))
  | _ -> failwith "DT: impossible branch"
))

# 334 "Vuna/Compiler/Ir/Model.vuna"
let v_Vuna_dCompiler_dIr_dModel_dirDefExtern = (fun (mc0 : t_Vuna_dCompiler_dIr_dModel_dIrDef) -> (match mc0 with
  | C_Vuna_dCompiler_dIr_dModel_dIrDef_IrExternDef (dtb__126, dtb__127, dtb__128, dtb__129) -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__127; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__128 }))
  | C_Vuna_dCompiler_dIr_dModel_dIrDef_IrDef (dtb__130, dtb__131, dtb__132, dtb__133, dtb__134, dtb__135, dtb__136, dtb__137) -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 339 "Vuna/Compiler/Ir/Model.vuna"
let v_Vuna_dCompiler_dIr_dModel_dirDefRecValueOk = (fun (mc0 : t_Vuna_dCompiler_dIr_dModel_dIrDef) -> (match mc0 with
  | C_Vuna_dCompiler_dIr_dModel_dIrDef_IrExternDef (dtb__138, dtb__139, dtb__140, dtb__141) -> true
  | C_Vuna_dCompiler_dIr_dModel_dIrDef_IrDef (dtb__142, dtb__143, dtb__144, dtb__145, dtb__146, dtb__147, dtb__148, dtb__149) -> dtb__147
  | _ -> failwith "DT: impossible branch"
))

# 344 "Vuna/Compiler/Ir/Model.vuna"
let v_Vuna_dCompiler_dIr_dModel_dirDefInitGuard = (fun (mc0 : t_Vuna_dCompiler_dIr_dModel_dIrDef) -> (match mc0 with
  | C_Vuna_dCompiler_dIr_dModel_dIrDef_IrExternDef (dtb__150, dtb__151, dtb__152, dtb__153) -> false
  | C_Vuna_dCompiler_dIr_dModel_dIrDef_IrDef (dtb__154, dtb__155, dtb__156, dtb__157, dtb__158, dtb__159, dtb__160, dtb__161) -> dtb__160
  | _ -> failwith "DT: impossible branch"
))

# 348 "Vuna/Compiler/Ir/Model.vuna"
let v_Vuna_dCompiler_dIr_dModel_dirDefSpan = (fun (mc0 : t_Vuna_dCompiler_dIr_dModel_dIrDef) -> (match mc0 with
  | C_Vuna_dCompiler_dIr_dModel_dIrDef_IrExternDef (dtb__162, dtb__163, dtb__164, dtb__165) -> dtb__165
  | C_Vuna_dCompiler_dIr_dModel_dIrDef_IrDef (dtb__166, dtb__167, dtb__168, dtb__169, dtb__170, dtb__171, dtb__172, dtb__173) -> dtb__173
  | _ -> failwith "DT: impossible branch"
))

# 357 "Vuna/Compiler/Ir/Model.vuna"
let v_Vuna_dCompiler_dIr_dModel_dirGroupIsRec = (fun (mc0 : t_Vuna_dCompiler_dIr_dModel_dIrGroup) -> (match mc0 with
  | { f_Vuna_dCompiler_dIr_dModel_dIrGroup_irGroupIsRec = dtb__174; f_Vuna_dCompiler_dIr_dModel_dIrGroup_irGroupDefs = dtb__175 } -> dtb__174
  | _ -> failwith "DT: impossible branch"
))

# 360 "Vuna/Compiler/Ir/Model.vuna"
let v_Vuna_dCompiler_dIr_dModel_dirGroupDefs = (fun (mc0 : t_Vuna_dCompiler_dIr_dModel_dIrGroup) -> (match mc0 with
  | { f_Vuna_dCompiler_dIr_dModel_dIrGroup_irGroupIsRec = dtb__176; f_Vuna_dCompiler_dIr_dModel_dIrGroup_irGroupDefs = dtb__177 } -> dtb__177
  | _ -> failwith "DT: impossible branch"
))

# 419 "Vuna/Compiler/Ir/Model.vuna"
let rec v_Vuna_dCompiler_dIr_dModel_dirSharedUnboxedOf = (fun (mc0 : string) (mc1 : (string, (string, int) Base_dData_dPair.t_Base_dData_dPair_dPair) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__178, dtb__179) -> (if ((Base_dData_dPair.v_Base_dData_dPair_dfirstOf dtb__178) = mc0) then (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ((Base_dData_dPair.v_Base_dData_dPair_dsecondOf dtb__178))) else ((v_Vuna_dCompiler_dIr_dModel_dirSharedUnboxedOf mc0) dtb__179))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 424 "Vuna/Compiler/Ir/Model.vuna"
let rec v_Vuna_dCompiler_dIr_dModel_dirSharedCtorShapeOf = (fun (mc0 : string) (mc1 : (string, (string, bool Base_dData_dList.t_Base_dData_dList_dList) Base_dData_dPair.t_Base_dData_dPair_dPair) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__180, dtb__181) -> (if ((Base_dData_dPair.v_Base_dData_dPair_dfirstOf dtb__180) = mc0) then (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ((Base_dData_dPair.v_Base_dData_dPair_dsecondOf dtb__180))) else ((v_Vuna_dCompiler_dIr_dModel_dirSharedCtorShapeOf mc0) dtb__181))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 429 "Vuna/Compiler/Ir/Model.vuna"
let rec v_Vuna_dCompiler_dIr_dModel_dirSharedRecordFieldsOf = (fun (mc0 : string) (mc1 : (string, (int, string) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__182, dtb__183) -> (if ((Base_dData_dPair.v_Base_dData_dPair_dfirstOf dtb__182) = mc0) then (Base_dData_dPair.v_Base_dData_dPair_dsecondOf dtb__182) else ((v_Vuna_dCompiler_dIr_dModel_dirSharedRecordFieldsOf mc0) dtb__183))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 456 "Vuna/Compiler/Ir/Model.vuna"
let v_Vuna_dCompiler_dIr_dModel_dirInlineArity = (fun (mc0 : string) -> (if (mc0 = "+") then 2 else (if (mc0 = "-") then 2 else (if (mc0 = "*") then 2 else (if (mc0 = "/") then 2 else (if (mc0 = "&&") then 2 else (if (mc0 = "||") then 2 else (if (mc0 = "bitAnd") then 2 else (if (mc0 = "bitOr") then 2 else (if (mc0 = "bitXor") then 2 else (if (mc0 = "bitNot") then 1 else (if (mc0 = "bitShl") then 2 else (if (mc0 = "bitShr") then 2 else (if (mc0 = "++") then 2 else (if (mc0 = "bi_eq_int") then 2 else (if (mc0 = "bi_neq_int") then 2 else (if (mc0 = "effectId") then 1 else (if (mc0 = "bi_eq_str") then 2 else (if (mc0 = "bi_neq_str") then 2 else (if (mc0 = "bi_lt_int") then 2 else (if (mc0 = "bi_le_int") then 2 else (if (mc0 = "bi_gt_int") then 2 else (if (mc0 = "bi_ge_int") then 2 else (if (mc0 = "bi_lt_str") then 2 else (if (mc0 = "bi_le_str") then 2 else (if (mc0 = "bi_gt_str") then 2 else (if (mc0 = "bi_ge_str") then 2 else (if (mc0 = "bi_lt_bool") then 2 else (if (mc0 = "bi_le_bool") then 2 else (if (mc0 = "bi_gt_bool") then 2 else (if (mc0 = "bi_ge_bool") then 2 else (if (mc0 = "bi_add_float") then 2 else (if (mc0 = "bi_sub_float") then 2 else (if (mc0 = "bi_mul_float") then 2 else (if (mc0 = "bi_div_float") then 2 else (if (mc0 = "bi_eq_float") then 2 else (if (mc0 = "bi_neq_float") then 2 else (if (mc0 = "bi_lt_float") then 2 else (if (mc0 = "bi_le_float") then 2 else (if (mc0 = "bi_gt_float") then 2 else (if (mc0 = "bi_ge_float") then 2 else (if (mc0 = "@ir@m@runEff") then 2 else (if (mc0 = "natToInt") then 1 else (if (mc0 = "natFromInt") then 1 else (if (mc0 = "natAdd") then 2 else (if (mc0 = "natSub") then 2 else (if (mc0 = "natMul") then 2 else (if (mc0 = "natDiv") then 2 else 0))))))))))))))))))))))))))))))))))))))))))))))))

# 507 "Vuna/Compiler/Ir/Model.vuna"
let v_Vuna_dCompiler_dIr_dModel_dirListFamilyOf = (fun (mc0 : t_Vuna_dCompiler_dIr_dModel_dIrListFam) -> (match mc0 with
  | { f_Vuna_dCompiler_dIr_dModel_dIrListFam_irListFamily = dtb__184; f_Vuna_dCompiler_dIr_dModel_dIrListFam_irListNil = dtb__185; f_Vuna_dCompiler_dIr_dModel_dIrListFam_irListCons = dtb__186 } -> dtb__184
  | _ -> failwith "DT: impossible branch"
))

# 511 "Vuna/Compiler/Ir/Model.vuna"
let v_Vuna_dCompiler_dIr_dModel_dirListNilOf = (fun (mc0 : t_Vuna_dCompiler_dIr_dModel_dIrListFam) -> (match mc0 with
  | { f_Vuna_dCompiler_dIr_dModel_dIrListFam_irListFamily = dtb__187; f_Vuna_dCompiler_dIr_dModel_dIrListFam_irListNil = dtb__188; f_Vuna_dCompiler_dIr_dModel_dIrListFam_irListCons = dtb__189 } -> dtb__188
  | _ -> failwith "DT: impossible branch"
))

# 515 "Vuna/Compiler/Ir/Model.vuna"
let v_Vuna_dCompiler_dIr_dModel_dirListConsOf = (fun (mc0 : t_Vuna_dCompiler_dIr_dModel_dIrListFam) -> (match mc0 with
  | { f_Vuna_dCompiler_dIr_dModel_dIrListFam_irListFamily = dtb__190; f_Vuna_dCompiler_dIr_dModel_dIrListFam_irListNil = dtb__191; f_Vuna_dCompiler_dIr_dModel_dIrListFam_irListCons = dtb__192 } -> dtb__192
  | _ -> failwith "DT: impossible branch"
))

# 519 "Vuna/Compiler/Ir/Model.vuna"
let v_Vuna_dCompiler_dIr_dModel_dirAltCtorOf = (fun (mc0 : t_Vuna_dCompiler_dIr_dModel_dIrAlt) -> (match mc0 with
  | { f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltCtor = dtb__193; f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBinders = dtb__194; f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBody = dtb__195 } -> dtb__193
  | _ -> failwith "DT: impossible branch"
))

# 523 "Vuna/Compiler/Ir/Model.vuna"
let v_Vuna_dCompiler_dIr_dModel_dirAltBindersOf = (fun (mc0 : t_Vuna_dCompiler_dIr_dModel_dIrAlt) -> (match mc0 with
  | { f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltCtor = dtb__196; f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBinders = dtb__197; f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBody = dtb__198 } -> dtb__197
  | _ -> failwith "DT: impossible branch"
))

# 527 "Vuna/Compiler/Ir/Model.vuna"
let v_Vuna_dCompiler_dIr_dModel_dirAltBodyOf = (fun (mc0 : t_Vuna_dCompiler_dIr_dModel_dIrAlt) -> (match mc0 with
  | { f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltCtor = dtb__199; f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBinders = dtb__200; f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBody = dtb__201 } -> dtb__201
  | _ -> failwith "DT: impossible branch"
))

# 531 "Vuna/Compiler/Ir/Model.vuna"
let v_Vuna_dCompiler_dIr_dModel_dirEntryShowOf = (fun (mc0 : t_Vuna_dCompiler_dIr_dModel_dIrEntry) -> (match mc0 with
  | { f_Vuna_dCompiler_dIr_dModel_dIrEntry_irEntryShow = dtb__202; f_Vuna_dCompiler_dIr_dModel_dIrEntry_irEntryMain = dtb__203; f_Vuna_dCompiler_dIr_dModel_dIrEntry_irEntryIsAction = dtb__204; f_Vuna_dCompiler_dIr_dModel_dIrEntry_irEntryRunMain = dtb__205; f_Vuna_dCompiler_dIr_dModel_dIrEntry_irEntryHandlers = dtb__206; f_Vuna_dCompiler_dIr_dModel_dIrEntry_irEntryRowTags = dtb__207 } -> dtb__202
  | _ -> failwith "DT: impossible branch"
))

# 535 "Vuna/Compiler/Ir/Model.vuna"
let v_Vuna_dCompiler_dIr_dModel_dirEntryMainOf = (fun (mc0 : t_Vuna_dCompiler_dIr_dModel_dIrEntry) -> (match mc0 with
  | { f_Vuna_dCompiler_dIr_dModel_dIrEntry_irEntryShow = dtb__208; f_Vuna_dCompiler_dIr_dModel_dIrEntry_irEntryMain = dtb__209; f_Vuna_dCompiler_dIr_dModel_dIrEntry_irEntryIsAction = dtb__210; f_Vuna_dCompiler_dIr_dModel_dIrEntry_irEntryRunMain = dtb__211; f_Vuna_dCompiler_dIr_dModel_dIrEntry_irEntryHandlers = dtb__212; f_Vuna_dCompiler_dIr_dModel_dIrEntry_irEntryRowTags = dtb__213 } -> dtb__209
  | _ -> failwith "DT: impossible branch"
))

# 539 "Vuna/Compiler/Ir/Model.vuna"
let v_Vuna_dCompiler_dIr_dModel_dirEntryIsActionOf = (fun (mc0 : t_Vuna_dCompiler_dIr_dModel_dIrEntry) -> (match mc0 with
  | { f_Vuna_dCompiler_dIr_dModel_dIrEntry_irEntryShow = dtb__214; f_Vuna_dCompiler_dIr_dModel_dIrEntry_irEntryMain = dtb__215; f_Vuna_dCompiler_dIr_dModel_dIrEntry_irEntryIsAction = dtb__216; f_Vuna_dCompiler_dIr_dModel_dIrEntry_irEntryRunMain = dtb__217; f_Vuna_dCompiler_dIr_dModel_dIrEntry_irEntryHandlers = dtb__218; f_Vuna_dCompiler_dIr_dModel_dIrEntry_irEntryRowTags = dtb__219 } -> dtb__216
  | _ -> failwith "DT: impossible branch"
))

# 543 "Vuna/Compiler/Ir/Model.vuna"
let v_Vuna_dCompiler_dIr_dModel_dirEntryRunMainOf = (fun (mc0 : t_Vuna_dCompiler_dIr_dModel_dIrEntry) -> (match mc0 with
  | { f_Vuna_dCompiler_dIr_dModel_dIrEntry_irEntryShow = dtb__220; f_Vuna_dCompiler_dIr_dModel_dIrEntry_irEntryMain = dtb__221; f_Vuna_dCompiler_dIr_dModel_dIrEntry_irEntryIsAction = dtb__222; f_Vuna_dCompiler_dIr_dModel_dIrEntry_irEntryRunMain = dtb__223; f_Vuna_dCompiler_dIr_dModel_dIrEntry_irEntryHandlers = dtb__224; f_Vuna_dCompiler_dIr_dModel_dIrEntry_irEntryRowTags = dtb__225 } -> dtb__223
  | _ -> failwith "DT: impossible branch"
))

# 547 "Vuna/Compiler/Ir/Model.vuna"
let v_Vuna_dCompiler_dIr_dModel_dirEntryHandlersOf = (fun (mc0 : t_Vuna_dCompiler_dIr_dModel_dIrEntry) -> (match mc0 with
  | { f_Vuna_dCompiler_dIr_dModel_dIrEntry_irEntryShow = dtb__226; f_Vuna_dCompiler_dIr_dModel_dIrEntry_irEntryMain = dtb__227; f_Vuna_dCompiler_dIr_dModel_dIrEntry_irEntryIsAction = dtb__228; f_Vuna_dCompiler_dIr_dModel_dIrEntry_irEntryRunMain = dtb__229; f_Vuna_dCompiler_dIr_dModel_dIrEntry_irEntryHandlers = dtb__230; f_Vuna_dCompiler_dIr_dModel_dIrEntry_irEntryRowTags = dtb__231 } -> dtb__230
  | _ -> failwith "DT: impossible branch"
))

# 551 "Vuna/Compiler/Ir/Model.vuna"
let v_Vuna_dCompiler_dIr_dModel_dirEntryRowTagsOf = (fun (mc0 : t_Vuna_dCompiler_dIr_dModel_dIrEntry) -> (match mc0 with
  | { f_Vuna_dCompiler_dIr_dModel_dIrEntry_irEntryShow = dtb__232; f_Vuna_dCompiler_dIr_dModel_dIrEntry_irEntryMain = dtb__233; f_Vuna_dCompiler_dIr_dModel_dIrEntry_irEntryIsAction = dtb__234; f_Vuna_dCompiler_dIr_dModel_dIrEntry_irEntryRunMain = dtb__235; f_Vuna_dCompiler_dIr_dModel_dIrEntry_irEntryHandlers = dtb__236; f_Vuna_dCompiler_dIr_dModel_dIrEntry_irEntryRowTags = dtb__237 } -> dtb__237
  | _ -> failwith "DT: impossible branch"
))

# 555 "Vuna/Compiler/Ir/Model.vuna"
let v_Vuna_dCompiler_dIr_dModel_dirProgSharedOf = (fun (mc0 : t_Vuna_dCompiler_dIr_dModel_dIrProgram) -> (match mc0 with
  | { f_Vuna_dCompiler_dIr_dModel_dIrProgram_irProgShared = dtb__238; f_Vuna_dCompiler_dIr_dModel_dIrProgram_irProgUnit = dtb__239 } -> dtb__238
  | _ -> failwith "DT: impossible branch"
))

# 559 "Vuna/Compiler/Ir/Model.vuna"
let v_Vuna_dCompiler_dIr_dModel_dirProgUnitOf = (fun (mc0 : t_Vuna_dCompiler_dIr_dModel_dIrProgram) -> (match mc0 with
  | { f_Vuna_dCompiler_dIr_dModel_dIrProgram_irProgShared = dtb__240; f_Vuna_dCompiler_dIr_dModel_dIrProgram_irProgUnit = dtb__241 } -> dtb__241
  | _ -> failwith "DT: impossible branch"
))

# 566 "Vuna/Compiler/Ir/Model.vuna"
let rec v_Vuna_dCompiler_dIr_dModel_dirSize = (fun (mc0 : t_Vuna_dCompiler_dIr_dModel_dIr) -> (match mc0 with
  | C_Vuna_dCompiler_dIr_dModel_dIr_IrTail (dtb__242) -> (v_Vuna_dCompiler_dIr_dModel_dirSize dtb__242)
  | _ -> (1 + (v_Vuna_dCompiler_dIr_dModel_dirSizeChildren mc0))
))
# 570 "Vuna/Compiler/Ir/Model.vuna"
and v_Vuna_dCompiler_dIr_dModel_dirSizeChildren = (fun (ir : t_Vuna_dCompiler_dIr_dModel_dIr) -> (match ir with
  | C_Vuna_dCompiler_dIr_dModel_dIr_IrCtor (dtb__243, dtb__244, dtb__245, dtb__246) -> (v_Vuna_dCompiler_dIr_dModel_dirSizeList dtb__246)
  | C_Vuna_dCompiler_dIr_dModel_dIr_IrRecord (dtb__247, dtb__248, dtb__249) -> (v_Vuna_dCompiler_dIr_dModel_dirSizeFields dtb__249)
  | C_Vuna_dCompiler_dIr_dModel_dIr_IrProj (dtb__250, dtb__251, dtb__252, dtb__253) -> (v_Vuna_dCompiler_dIr_dModel_dirSize dtb__250)
  | C_Vuna_dCompiler_dIr_dModel_dIr_IrRecUpd (dtb__254, dtb__255, dtb__256, dtb__257) -> ((v_Vuna_dCompiler_dIr_dModel_dirSize dtb__254) + (v_Vuna_dCompiler_dIr_dModel_dirSizeFields dtb__256))
  | C_Vuna_dCompiler_dIr_dModel_dIr_IrRtApp (dtb__258, dtb__259) -> (v_Vuna_dCompiler_dIr_dModel_dirSizeList dtb__259)
  | C_Vuna_dCompiler_dIr_dModel_dIr_IrCast (dtb__260, dtb__261, dtb__262) -> (v_Vuna_dCompiler_dIr_dModel_dirSize dtb__262)
  | C_Vuna_dCompiler_dIr_dModel_dIr_IrLet (dtb__263, dtb__264, dtb__265) -> ((v_Vuna_dCompiler_dIr_dModel_dirSize dtb__264) + (v_Vuna_dCompiler_dIr_dModel_dirSize dtb__265))
  | C_Vuna_dCompiler_dIr_dModel_dIr_IrLam (dtb__266, dtb__267, dtb__268) -> (v_Vuna_dCompiler_dIr_dModel_dirSize dtb__268)
  | C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (dtb__269, dtb__270, dtb__271) -> ((v_Vuna_dCompiler_dIr_dModel_dirSize dtb__270) + (v_Vuna_dCompiler_dIr_dModel_dirSize dtb__271))
  | C_Vuna_dCompiler_dIr_dModel_dIr_IrTail (dtb__272) -> (v_Vuna_dCompiler_dIr_dModel_dirSize dtb__272)
  | C_Vuna_dCompiler_dIr_dModel_dIr_IrIf (dtb__273, dtb__274, dtb__275) -> (((v_Vuna_dCompiler_dIr_dModel_dirSize dtb__273) + (v_Vuna_dCompiler_dIr_dModel_dirSize dtb__274)) + (v_Vuna_dCompiler_dIr_dModel_dirSize dtb__275))
  | C_Vuna_dCompiler_dIr_dModel_dIr_IrCase (dtb__276, dtb__277, dtb__278, dtb__279) -> ((v_Vuna_dCompiler_dIr_dModel_dirSize dtb__278) + (v_Vuna_dCompiler_dIr_dModel_dirSizeAlts dtb__279))
  | C_Vuna_dCompiler_dIr_dModel_dIr_IrNatCase (dtb__280, dtb__281, dtb__282, dtb__283, dtb__284) -> ((((v_Vuna_dCompiler_dIr_dModel_dirSize dtb__280) + (v_Vuna_dCompiler_dIr_dModel_dirSizeAlt dtb__282)) + (v_Vuna_dCompiler_dIr_dModel_dirSizeAlt dtb__283)) + (v_Vuna_dCompiler_dIr_dModel_dirSizeAlt dtb__284))
  | C_Vuna_dCompiler_dIr_dModel_dIr_IrConcatMany (dtb__285) -> (v_Vuna_dCompiler_dIr_dModel_dirSizeList dtb__285)
  | C_Vuna_dCompiler_dIr_dModel_dIr_IrEffThunk (dtb__286, dtb__287, dtb__288, dtb__289, dtb__290) -> (v_Vuna_dCompiler_dIr_dModel_dirSize dtb__290)
  | _ -> 0
))
# 591 "Vuna/Compiler/Ir/Model.vuna"
and v_Vuna_dCompiler_dIr_dModel_dirSizeList = (fun (mc0 : t_Vuna_dCompiler_dIr_dModel_dIr Base_dData_dList.t_Base_dData_dList_dList) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__291, dtb__292) -> ((v_Vuna_dCompiler_dIr_dModel_dirSize dtb__291) + (v_Vuna_dCompiler_dIr_dModel_dirSizeList dtb__292))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))
# 595 "Vuna/Compiler/Ir/Model.vuna"
and v_Vuna_dCompiler_dIr_dModel_dirSizeFields = (fun (mc0 : (string, t_Vuna_dCompiler_dIr_dModel_dIr) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__293, dtb__294) -> (match dtb__293 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__295; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__296 } -> ((v_Vuna_dCompiler_dIr_dModel_dirSize dtb__296) + (v_Vuna_dCompiler_dIr_dModel_dirSizeFields dtb__294))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))
# 599 "Vuna/Compiler/Ir/Model.vuna"
and v_Vuna_dCompiler_dIr_dModel_dirSizeAlts = (fun (mc0 : t_Vuna_dCompiler_dIr_dModel_dIrAlt Base_dData_dList.t_Base_dData_dList_dList) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__297, dtb__298) -> ((v_Vuna_dCompiler_dIr_dModel_dirSize (v_Vuna_dCompiler_dIr_dModel_dirAltBodyOf dtb__297)) + (v_Vuna_dCompiler_dIr_dModel_dirSizeAlts dtb__298))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))
# 603 "Vuna/Compiler/Ir/Model.vuna"
and v_Vuna_dCompiler_dIr_dModel_dirSizeAlt = (fun (mc0 : t_Vuna_dCompiler_dIr_dModel_dIrAlt Base_dData_dMaybe.t_Base_dData_dMaybe_dMaybe) -> (match mc0 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__299) -> (v_Vuna_dCompiler_dIr_dModel_dirSize (v_Vuna_dCompiler_dIr_dModel_dirAltBodyOf dtb__299))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> 0
  | _ -> failwith "DT: impossible branch"
))
