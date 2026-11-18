open Vuna_runtime
# 58 "Vuna/Compiler/Ir/Validate.vuna"
let rec v_Vuna_dCompiler_dIr_dValidate_dfirstMissingDep = (fun (mc0 : (string, bool) Base_dContainer_dHashMap.t_Base_dContainer_dHashMap_dHashMap) (mc1 : (string, bool) Base_dContainer_dHashMap.t_Base_dContainer_dHashMap_dHashMap) (mc2 : string) (mc3 : string Base_dData_dList.t_Base_dData_dList_dList) -> (match mc3 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__0, dtb__1) -> (if ((((Base_dContainer_dHashMap.v_Base_dContainer_dHashMap_dmember Base_dData_dString.v_Hashable_uString) Base_dData_dString.v_Eq_uString) dtb__0) mc0) then (if ((((Base_dContainer_dHashMap.v_Base_dContainer_dHashMap_dmember Base_dData_dString.v_Hashable_uString) Base_dData_dString.v_Eq_uString) dtb__0) mc1) then ((((v_Vuna_dCompiler_dIr_dValidate_dfirstMissingDep mc0) mc1) mc2) dtb__1) else (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = mc2; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__0 }))) else ((((v_Vuna_dCompiler_dIr_dValidate_dfirstMissingDep mc0) mc1) mc2) dtb__1))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 51 "Vuna/Compiler/Ir/Validate.vuna"
let rec v_Vuna_dCompiler_dIr_dValidate_dfirstUnorderedDepGo = (fun (mc0 : (string, bool) Base_dContainer_dHashMap.t_Base_dContainer_dHashMap_dHashMap) (mc1 : (string, bool) Base_dContainer_dHashMap.t_Base_dContainer_dHashMap_dHashMap) (mc2 : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrDef Base_dData_dList.t_Base_dData_dList_dList) -> (match mc2 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__2, dtb__3) -> (match ((((v_Vuna_dCompiler_dIr_dValidate_dfirstMissingDep mc0) mc1) (Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirDefName dtb__2)) (Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirDefDeps dtb__2)) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__4) -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__4))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (((v_Vuna_dCompiler_dIr_dValidate_dfirstUnorderedDepGo mc0) mc1) dtb__3)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 48 "Vuna/Compiler/Ir/Validate.vuna"
let v_Vuna_dCompiler_dIr_dValidate_dfirstUnorderedDep = (fun nameTbl visible defs -> (((v_Vuna_dCompiler_dIr_dValidate_dfirstUnorderedDepGo nameTbl) visible) defs))

# 36 "Vuna/Compiler/Ir/Validate.vuna"
let rec v_Vuna_dCompiler_dIr_dValidate_dcheckGroupOrderGo = (fun (mc0 : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrGroup Base_dData_dList.t_Base_dData_dList_dList) (mc1 : (string, bool) Base_dContainer_dHashMap.t_Base_dContainer_dHashMap_dHashMap) (mc2 : (string, bool) Base_dContainer_dHashMap.t_Base_dContainer_dHashMap_dHashMap) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__5, dtb__6) -> ((fun members -> ((fun visible -> (match (((v_Vuna_dCompiler_dIr_dValidate_dfirstUnorderedDep mc2) visible) members) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (((v_Vuna_dCompiler_dIr_dValidate_dcheckGroupOrderGo dtb__6) visible) mc2)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__7) -> (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicInternal (String.concat "" ["IR group order is inconsistent: `"; (Base_dData_dPair.v_Base_dData_dPair_dsecondOf dtb__7); "` referenced before it is defined (group of `"; (Base_dData_dPair.v_Base_dData_dPair_dfirstOf dtb__7); "`)"]))
  | _ -> failwith "DT: impossible branch"
)) (((Base_dData_dList.v_Base_dData_dList_dfoldl (fun (acc : (string, bool) Base_dContainer_dHashMap.t_Base_dContainer_dHashMap_dHashMap) (d : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrDef) -> ((((Base_dContainer_dHashMap.v_Base_dContainer_dHashMap_dinsert Base_dData_dString.v_Hashable_uString) (Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirDefName d)) true) acc))) mc1) members))) (Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirGroupDefs dtb__5))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (0))
  | _ -> failwith "DT: impossible branch"
))

# 33 "Vuna/Compiler/Ir/Validate.vuna"
let v_Vuna_dCompiler_dIr_dValidate_dcheckGroupOrder = (fun groups nameTbl -> (((v_Vuna_dCompiler_dIr_dValidate_dcheckGroupOrderGo groups) ((Base_dContainer_dHashMap.v_Base_dContainer_dHashMap_dfromList Base_dData_dString.v_Hashable_uString) Base_dData_dList.C_Base_dData_dList_dList_Nil)) nameTbl))

# 71 "Vuna/Compiler/Ir/Validate.vuna"
let rec v_Vuna_dCompiler_dIr_dValidate_dcheckSymbolRefs = (fun (mc0 : (string, int Base_dData_dMaybe.t_Base_dData_dMaybe_dMaybe) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__8, dtb__9) -> (match (Vuna_dCompiler_dIr_dRuntime.v_Vuna_dCompiler_dIr_dRuntime_dirRtLookup (Base_dData_dPair.v_Base_dData_dPair_dfirstOf dtb__8)) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicInternal (String.concat "" ["IR references an undeclared runtime symbol: `"; (Base_dData_dPair.v_Base_dData_dPair_dfirstOf dtb__8); "`"]))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__10) -> (match (Base_dData_dPair.v_Base_dData_dPair_dsecondOf dtb__8) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (v_Vuna_dCompiler_dIr_dValidate_dcheckSymbolRefs dtb__9)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__11) -> (if (if (dtb__11 > 0) then ((Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirInlineArity (Base_dData_dPair.v_Base_dData_dPair_dfirstOf dtb__8)) = dtb__11) else false) then (v_Vuna_dCompiler_dIr_dValidate_dcheckSymbolRefs dtb__9) else (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicInternal (String.concat "" ["IR saturated runtime symbol `"; (Base_dData_dPair.v_Base_dData_dPair_dfirstOf dtb__8); "` has the wrong arity ("; (bi_strFromInt dtb__11); ")"])))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (0))
  | _ -> failwith "DT: impossible branch"
))

# 200 "Vuna/Compiler/Ir/Validate.vuna"
let rec v_Vuna_dCompiler_dIr_dValidate_dtyDeclArityOf = (fun (mc0 : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrTyDecl Base_dData_dList.t_Base_dData_dList_dList) (mc1 : string) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__12, dtb__13) -> (match dtb__12 with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTyDecl_IrUnboxedDecl (dtb__14, dtb__15, dtb__16) -> (if (dtb__14 = mc1) then (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__15)) else ((v_Vuna_dCompiler_dIr_dValidate_dtyDeclArityOf dtb__13) mc1))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTyDecl_IrRecordDecl (dtb__17, dtb__18, dtb__19, dtb__20) -> (if (dtb__17 = mc1) then (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__18)) else ((v_Vuna_dCompiler_dIr_dValidate_dtyDeclArityOf dtb__13) mc1))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTyDecl_IrVariantDecl (dtb__21, dtb__22, dtb__23) -> (if (dtb__21 = mc1) then (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__22)) else ((v_Vuna_dCompiler_dIr_dValidate_dtyDeclArityOf dtb__13) mc1))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 209 "Vuna/Compiler/Ir/Validate.vuna"
let rec v_Vuna_dCompiler_dIr_dValidate_dlistLength = (fun mc0 -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__24, dtb__25) -> (1 + (v_Vuna_dCompiler_dIr_dValidate_dlistLength dtb__25))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))

# 173 "Vuna/Compiler/Ir/Validate.vuna"
let rec v_Vuna_dCompiler_dIr_dValidate_dcheckTyArity = (fun (mc0 : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrTyDecl Base_dData_dList.t_Base_dData_dList_dList) (mc1 : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrTy) -> (match mc1 with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyData (dtb__26, dtb__27) -> (match ((v_Vuna_dCompiler_dIr_dValidate_dtyDeclArityOf mc0) dtb__26) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__28) -> (if ((v_Vuna_dCompiler_dIr_dValidate_dlistLength dtb__27) = dtb__28) then ((v_Vuna_dCompiler_dIr_dValidate_dcheckTyArityList mc0) dtb__27) else (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicInternal (String.concat "" ["binder type annotation has the wrong type argument count for `"; dtb__26; "` (expected "; (bi_strFromInt dtb__28); ", got "; (bi_strFromInt (v_Vuna_dCompiler_dIr_dValidate_dlistLength dtb__27)); ")"])))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> ((v_Vuna_dCompiler_dIr_dValidate_dcheckTyArityList mc0) dtb__27)
  | _ -> failwith "DT: impossible branch"
)
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyFun (dtb__29, dtb__30) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((v_Vuna_dCompiler_dIr_dValidate_dcheckTyArity mc0) dtb__29)) (fun (_u : int) -> ((v_Vuna_dCompiler_dIr_dValidate_dcheckTyArity mc0) dtb__30)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyRef (dtb__31) -> ((v_Vuna_dCompiler_dIr_dValidate_dcheckTyArity mc0) dtb__31)
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyArray (dtb__32) -> ((v_Vuna_dCompiler_dIr_dValidate_dcheckTyArity mc0) dtb__32)
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyOpaque -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (0))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyFloat -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (0))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyBool -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (0))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyStr -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (0))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyInt -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (0))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyVar (dtb__33) -> (if (dtb__33 >= 0) then (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (0)) else (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicInternal "negative runtime type parameter slot"))
  | _ -> failwith "DT: impossible branch"
))
# 195 "Vuna/Compiler/Ir/Validate.vuna"
and v_Vuna_dCompiler_dIr_dValidate_dcheckTyArityList = (fun (mc0 : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrTyDecl Base_dData_dList.t_Base_dData_dList_dList) (mc1 : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrTy Base_dData_dList.t_Base_dData_dList_dList) -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__34, dtb__35) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((v_Vuna_dCompiler_dIr_dValidate_dcheckTyArity mc0) dtb__34)) (fun (_u : int) -> ((v_Vuna_dCompiler_dIr_dValidate_dcheckTyArityList mc0) dtb__35)))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (0))
  | _ -> failwith "DT: impossible branch"
))

# 115 "Vuna/Compiler/Ir/Validate.vuna"
let v_Vuna_dCompiler_dIr_dValidate_dcheckDefTy = (fun (mc0 : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrTyDecl Base_dData_dList.t_Base_dData_dList_dList) (mc1 : string) (mc2 : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrTy Base_dData_dMaybe.t_Base_dData_dMaybe_dMaybe) -> (match mc2 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__36) -> (match ((v_Vuna_dCompiler_dIr_dValidate_dcheckTyArity mc0) dtb__36) with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__37) -> (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicInternal (String.concat "" ["definition `"; mc1; "` has an invalid runtime signature"]))
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__38) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__38))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (0))
  | _ -> failwith "DT: impossible branch"
))

# 146 "Vuna/Compiler/Ir/Validate.vuna"
let v_Vuna_dCompiler_dIr_dValidate_dcheckIrTyM = (fun (mc0 : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrTyDecl Base_dData_dList.t_Base_dData_dList_dList) (mc1 : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrTy Base_dData_dMaybe.t_Base_dData_dMaybe_dMaybe) -> (match mc1 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__39) -> ((v_Vuna_dCompiler_dIr_dValidate_dcheckTyArity mc0) dtb__39)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (0))
  | _ -> failwith "DT: impossible branch"
))

# 150 "Vuna/Compiler/Ir/Validate.vuna"
let rec v_Vuna_dCompiler_dIr_dValidate_dcheckBinderTysOf = (fun (mc0 : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrTyDecl Base_dData_dList.t_Base_dData_dList_dList) (mc1 : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrBinder Base_dData_dList.t_Base_dData_dList_dList) -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__40, dtb__41) -> (if (dtb__40).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrBinder_irBinderErased then (match (dtb__40).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrBinder_irBinderTy with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> ((v_Vuna_dCompiler_dIr_dValidate_dcheckBinderTysOf mc0) dtb__41)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__42) -> (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicInternal "erased binder carries a runtime type annotation")
  | _ -> failwith "DT: impossible branch"
) else (match (dtb__40).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrBinder_irBinderTy with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> ((v_Vuna_dCompiler_dIr_dValidate_dcheckBinderTysOf mc0) dtb__41)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__43) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((v_Vuna_dCompiler_dIr_dValidate_dcheckTyArity mc0) dtb__43)) (fun (_u : int) -> ((v_Vuna_dCompiler_dIr_dValidate_dcheckBinderTysOf mc0) dtb__41)))
  | _ -> failwith "DT: impossible branch"
))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (0))
  | _ -> failwith "DT: impossible branch"
))

# 162 "Vuna/Compiler/Ir/Validate.vuna"
let rec v_Vuna_dCompiler_dIr_dValidate_dcheckAltBinderTys = (fun (mc0 : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrTyDecl Base_dData_dList.t_Base_dData_dList_dList) (mc1 : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrAlt Base_dData_dList.t_Base_dData_dList_dList) -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__44, dtb__45) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((v_Vuna_dCompiler_dIr_dValidate_dcheckBinderTysOf mc0) (Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirAltBindersOf dtb__44))) (fun (_u : int) -> ((v_Vuna_dCompiler_dIr_dValidate_dcheckAltBinderTys mc0) dtb__45)))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (0))
  | _ -> failwith "DT: impossible branch"
))

# 169 "Vuna/Compiler/Ir/Validate.vuna"
let v_Vuna_dCompiler_dIr_dValidate_dcheckAltBinderTysM = (fun (mc0 : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrTyDecl Base_dData_dList.t_Base_dData_dList_dList) (mc1 : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrAlt Base_dData_dMaybe.t_Base_dData_dMaybe_dMaybe) -> (match mc1 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__46) -> ((v_Vuna_dCompiler_dIr_dValidate_dcheckBinderTysOf mc0) (Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirAltBindersOf dtb__46))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (0))
  | _ -> failwith "DT: impossible branch"
))

# 131 "Vuna/Compiler/Ir/Validate.vuna"
let v_Vuna_dCompiler_dIr_dValidate_dcheckNodeBinderTys = (fun decls ir -> (match ir with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLam (dtb__47, dtb__48, dtb__49) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((v_Vuna_dCompiler_dIr_dValidate_dcheckBinderTysOf decls) dtb__47)) (fun (_u : int) -> ((v_Vuna_dCompiler_dIr_dValidate_dcheckIrTyM decls) dtb__48)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLet (dtb__50, dtb__51, dtb__52) -> ((v_Vuna_dCompiler_dIr_dValidate_dcheckBinderTysOf decls) dtb__50)
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCase (dtb__53, dtb__54) -> ((v_Vuna_dCompiler_dIr_dValidate_dcheckAltBinderTys decls) dtb__54)
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrNatCase (dtb__55, dtb__56, dtb__57, dtb__58, dtb__59) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((v_Vuna_dCompiler_dIr_dValidate_dcheckAltBinderTysM decls) dtb__57)) (fun (_u : int) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((v_Vuna_dCompiler_dIr_dValidate_dcheckAltBinderTysM decls) dtb__58)) (fun (_u : int) -> ((v_Vuna_dCompiler_dIr_dValidate_dcheckAltBinderTysM decls) dtb__59)))))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCast (dtb__60, dtb__61, dtb__62) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((v_Vuna_dCompiler_dIr_dValidate_dcheckIrTyM decls) dtb__60)) (fun (_u : int) -> ((v_Vuna_dCompiler_dIr_dValidate_dcheckIrTyM decls) dtb__61)))
  | _ -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (0))
))

# 273 "Vuna/Compiler/Ir/Validate.vuna"
let v_Vuna_dCompiler_dIr_dValidate_dmaybeAlts = (fun (mc0 : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrAlt Base_dData_dMaybe.t_Base_dData_dMaybe_dMaybe) -> (match mc0 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__63) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__63, Base_dData_dList.C_Base_dData_dList_dList_Nil))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 277 "Vuna/Compiler/Ir/Validate.vuna"
let rec v_Vuna_dCompiler_dIr_dValidate_daltWork = (fun (mc0 : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrBinder Base_dData_dList.t_Base_dData_dList_dList) (mc1 : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrAlt Base_dData_dList.t_Base_dData_dList_dList) -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__64, dtb__65) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = ((Base_dData_dList.v_Base_dData_dList_dappend (Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirAltBindersOf dtb__64)) mc0); Base_dData_dPair.f_Base_dData_dPair_dPair_second = (Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirAltBodyOf dtb__64) }, ((v_Vuna_dCompiler_dIr_dValidate_daltWork mc0) dtb__65)))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 251 "Vuna/Compiler/Ir/Validate.vuna"
let v_Vuna_dCompiler_dIr_dValidate_dscopedChildren = (fun scope ir -> (match ir with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCtor (dtb__66, dtb__67, dtb__68) -> ((Base_dData_dList.v_Base_dData_dList_dmap (fun (a : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIr) -> { Base_dData_dPair.f_Base_dData_dPair_dPair_first = scope; Base_dData_dPair.f_Base_dData_dPair_dPair_second = a })) dtb__68)
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRecord (dtb__69, dtb__70) -> ((Base_dData_dList.v_Base_dData_dList_dmap (fun (p : (string, Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIr) Base_dData_dPair.t_Base_dData_dPair_dPair) -> { Base_dData_dPair.f_Base_dData_dPair_dPair_first = scope; Base_dData_dPair.f_Base_dData_dPair_dPair_second = (Base_dData_dPair.v_Base_dData_dPair_dsecondOf p) })) dtb__70)
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrProj (dtb__71, dtb__72, dtb__73) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = scope; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__71 }, Base_dData_dList.C_Base_dData_dList_dList_Nil))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRecUpd (dtb__74, dtb__75, dtb__76) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = scope; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__74 }, ((Base_dData_dList.v_Base_dData_dList_dmap (fun (p : (string, Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIr) Base_dData_dPair.t_Base_dData_dPair_dPair) -> { Base_dData_dPair.f_Base_dData_dPair_dPair_first = scope; Base_dData_dPair.f_Base_dData_dPair_dPair_second = (Base_dData_dPair.v_Base_dData_dPair_dsecondOf p) })) dtb__76)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRtApp (dtb__77, dtb__78) -> ((Base_dData_dList.v_Base_dData_dList_dmap (fun (a : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIr) -> { Base_dData_dPair.f_Base_dData_dPair_dPair_first = scope; Base_dData_dPair.f_Base_dData_dPair_dPair_second = a })) dtb__78)
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCast (dtb__79, dtb__80, dtb__81) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = scope; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__81 }, Base_dData_dList.C_Base_dData_dList_dList_Nil))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLet (dtb__82, dtb__83, dtb__84) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = scope; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__83 }, (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = ((Base_dData_dList.v_Base_dData_dList_dappend dtb__82) scope); Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__84 }, Base_dData_dList.C_Base_dData_dList_dList_Nil))))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLam (dtb__85, dtb__86, dtb__87) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = ((Base_dData_dList.v_Base_dData_dList_dappend dtb__85) scope); Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__87 }, Base_dData_dList.C_Base_dData_dList_dList_Nil))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (dtb__88, dtb__89) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = scope; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__88 }, (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = scope; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__89 }, Base_dData_dList.C_Base_dData_dList_dList_Nil))))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrIf (dtb__90, dtb__91, dtb__92) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = scope; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__90 }, (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = scope; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__91 }, (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = scope; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__92 }, Base_dData_dList.C_Base_dData_dList_dList_Nil))))))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCase (dtb__93, dtb__94) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = scope; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__93 }, ((v_Vuna_dCompiler_dIr_dValidate_daltWork scope) dtb__94)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrNatCase (dtb__95, dtb__96, dtb__97, dtb__98, dtb__99) -> ((Base_dData_dList.v_Base_dData_dList_dappend (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = scope; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__95 }, Base_dData_dList.C_Base_dData_dList_dList_Nil))) ((Base_dData_dList.v_Base_dData_dList_dappend ((v_Vuna_dCompiler_dIr_dValidate_daltWork scope) (v_Vuna_dCompiler_dIr_dValidate_dmaybeAlts dtb__97))) ((Base_dData_dList.v_Base_dData_dList_dappend ((v_Vuna_dCompiler_dIr_dValidate_daltWork scope) (v_Vuna_dCompiler_dIr_dValidate_dmaybeAlts dtb__98))) ((v_Vuna_dCompiler_dIr_dValidate_daltWork scope) (v_Vuna_dCompiler_dIr_dValidate_dmaybeAlts dtb__99)))))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrConcatMany (dtb__100) -> ((Base_dData_dList.v_Base_dData_dList_dmap (fun (a : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIr) -> { Base_dData_dPair.f_Base_dData_dPair_dPair_first = scope; Base_dData_dPair.f_Base_dData_dPair_dPair_second = a })) dtb__100)
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrEffThunk (dtb__101, dtb__102, dtb__103, dtb__104, dtb__105) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = scope; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__105 }, Base_dData_dList.C_Base_dData_dList_dList_Nil))
  | _ -> Base_dData_dList.C_Base_dData_dList_dList_Nil
))

# 122 "Vuna/Compiler/Ir/Validate.vuna"
let rec v_Vuna_dCompiler_dIr_dValidate_dcheckBinderTysWork = (fun fuel decls work -> (if (fuel <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "ir-binder-ty") else (match work with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (0))
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__106, dtb__107) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((v_Vuna_dCompiler_dIr_dValidate_dcheckNodeBinderTys decls) dtb__106)) (fun (_u : int) -> (((v_Vuna_dCompiler_dIr_dValidate_dcheckBinderTysWork (fuel - 1)) decls) ((Base_dData_dList.v_Base_dData_dList_dappend ((Base_dData_dList.v_Base_dData_dList_dmap Base_dData_dPair.v_Base_dData_dPair_dsecondOf) ((v_Vuna_dCompiler_dIr_dValidate_dscopedChildren Base_dData_dList.C_Base_dData_dList_dList_Nil) dtb__106))) dtb__107))))
  | _ -> failwith "DT: impossible branch"
)))

# 290 "Vuna/Compiler/Ir/Validate.vuna"
let v_Vuna_dCompiler_dIr_dValidate_dsameBName = (fun (mc0 : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrBName) (mc1 : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrBName) -> (match mc0 with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrBName_IrBWild -> (match mc1 with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrBName_IrBWild -> true
  | _ -> false
)
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrBName_IrBNat (dtb__108) -> (match mc1 with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrBName_IrBNat (dtb__109) -> (dtb__108 = dtb__109)
  | _ -> false
)
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrBName_IrBArm (dtb__110) -> (match mc1 with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrBName_IrBArm (dtb__111) -> (dtb__110 = dtb__111)
  | _ -> false
)
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrBName_IrBUser (dtb__112) -> (match mc1 with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrBName_IrBUser (dtb__113) -> (dtb__112 = dtb__113)
  | _ -> false
)
  | _ -> failwith "DT: impossible branch"
))

# 286 "Vuna/Compiler/Ir/Validate.vuna"
let v_Vuna_dCompiler_dIr_dValidate_dsameBinder = (fun b1 b2 -> (if (((Base_dTrait_dEq.v_Base_dTrait_dEq_d_x61__x61_ Base_dTrait_dEq.v_Eq_uBase_uData_uBool_uBool) (b1).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrBinder_irBinderErased) (b2).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrBinder_irBinderErased) then ((v_Vuna_dCompiler_dIr_dValidate_dsameBName (b1).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrBinder_irBinderName) (b2).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrBinder_irBinderName) else false))

# 282 "Vuna/Compiler/Ir/Validate.vuna"
let rec v_Vuna_dCompiler_dIr_dValidate_dmemBinder = (fun (mc0 : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrBinder) (mc1 : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrBinder Base_dData_dList.t_Base_dData_dList_dList) -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__114, dtb__115) -> (if ((v_Vuna_dCompiler_dIr_dValidate_dsameBinder mc0) dtb__114) then true else ((v_Vuna_dCompiler_dIr_dValidate_dmemBinder mc0) dtb__115))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 238 "Vuna/Compiler/Ir/Validate.vuna"
let rec v_Vuna_dCompiler_dIr_dValidate_dcheckScopedWork = (fun fuel work -> (if (fuel <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "ir-scope") else ((fun nd_uscrut2 -> (match nd_uscrut2 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__116, dtb__117) -> (match dtb__116 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__118; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__119 } -> (match dtb__119 with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrVar (dtb__120) -> (if (dtb__120).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrBinder_irBinderErased then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicInternal "erased binder reached runtime IR") else (if ((v_Vuna_dCompiler_dIr_dValidate_dmemBinder dtb__120) dtb__118) then ((v_Vuna_dCompiler_dIr_dValidate_dcheckScopedWork (fuel - 1)) dtb__117) else (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicInternal "IR variable references a binder outside its scope")))
  | _ -> ((v_Vuna_dCompiler_dIr_dValidate_dcheckScopedWork (fuel - 1)) ((Base_dData_dList.v_Base_dData_dList_dappend ((v_Vuna_dCompiler_dIr_dValidate_dscopedChildren dtb__118) dtb__119)) dtb__117))
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (0))
  | _ -> failwith "DT: impossible branch"
)) work)))

# 297 "Vuna/Compiler/Ir/Validate.vuna"
let rec v_Vuna_dCompiler_dIr_dValidate_dirSize = (fun ir -> (1 + (v_Vuna_dCompiler_dIr_dValidate_dirSizeChildren ir)))
# 300 "Vuna/Compiler/Ir/Validate.vuna"
and v_Vuna_dCompiler_dIr_dValidate_dirSizeChildren = (fun ir -> (match ir with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCtor (dtb__121, dtb__122, dtb__123) -> (v_Vuna_dCompiler_dIr_dValidate_dirSizeList dtb__123)
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRecord (dtb__124, dtb__125) -> (v_Vuna_dCompiler_dIr_dValidate_dirSizeFields dtb__125)
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrProj (dtb__126, dtb__127, dtb__128) -> (v_Vuna_dCompiler_dIr_dValidate_dirSize dtb__126)
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRecUpd (dtb__129, dtb__130, dtb__131) -> ((v_Vuna_dCompiler_dIr_dValidate_dirSize dtb__129) + (v_Vuna_dCompiler_dIr_dValidate_dirSizeFields dtb__131))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRtApp (dtb__132, dtb__133) -> (v_Vuna_dCompiler_dIr_dValidate_dirSizeList dtb__133)
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCast (dtb__134, dtb__135, dtb__136) -> (v_Vuna_dCompiler_dIr_dValidate_dirSize dtb__136)
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLet (dtb__137, dtb__138, dtb__139) -> ((v_Vuna_dCompiler_dIr_dValidate_dirSize dtb__138) + (v_Vuna_dCompiler_dIr_dValidate_dirSize dtb__139))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLam (dtb__140, dtb__141, dtb__142) -> (v_Vuna_dCompiler_dIr_dValidate_dirSize dtb__142)
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (dtb__143, dtb__144) -> ((v_Vuna_dCompiler_dIr_dValidate_dirSize dtb__143) + (v_Vuna_dCompiler_dIr_dValidate_dirSize dtb__144))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrIf (dtb__145, dtb__146, dtb__147) -> (((v_Vuna_dCompiler_dIr_dValidate_dirSize dtb__145) + (v_Vuna_dCompiler_dIr_dValidate_dirSize dtb__146)) + (v_Vuna_dCompiler_dIr_dValidate_dirSize dtb__147))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCase (dtb__148, dtb__149) -> ((v_Vuna_dCompiler_dIr_dValidate_dirSize dtb__148) + (v_Vuna_dCompiler_dIr_dValidate_dirSizeAlts dtb__149))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrNatCase (dtb__150, dtb__151, dtb__152, dtb__153, dtb__154) -> ((((v_Vuna_dCompiler_dIr_dValidate_dirSize dtb__150) + (v_Vuna_dCompiler_dIr_dValidate_dirSizeAlt dtb__152)) + (v_Vuna_dCompiler_dIr_dValidate_dirSizeAlt dtb__153)) + (v_Vuna_dCompiler_dIr_dValidate_dirSizeAlt dtb__154))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrConcatMany (dtb__155) -> (v_Vuna_dCompiler_dIr_dValidate_dirSizeList dtb__155)
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrEffThunk (dtb__156, dtb__157, dtb__158, dtb__159, dtb__160) -> (v_Vuna_dCompiler_dIr_dValidate_dirSize dtb__160)
  | _ -> 0
))
# 320 "Vuna/Compiler/Ir/Validate.vuna"
and v_Vuna_dCompiler_dIr_dValidate_dirSizeList = (fun (mc0 : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIr Base_dData_dList.t_Base_dData_dList_dList) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__161, dtb__162) -> ((v_Vuna_dCompiler_dIr_dValidate_dirSize dtb__161) + (v_Vuna_dCompiler_dIr_dValidate_dirSizeList dtb__162))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))
# 324 "Vuna/Compiler/Ir/Validate.vuna"
and v_Vuna_dCompiler_dIr_dValidate_dirSizeFields = (fun (mc0 : (string, Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIr) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__163, dtb__164) -> (match dtb__163 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__165; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__166 } -> ((v_Vuna_dCompiler_dIr_dValidate_dirSize dtb__166) + (v_Vuna_dCompiler_dIr_dValidate_dirSizeFields dtb__164))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))
# 328 "Vuna/Compiler/Ir/Validate.vuna"
and v_Vuna_dCompiler_dIr_dValidate_dirSizeAlts = (fun (mc0 : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrAlt Base_dData_dList.t_Base_dData_dList_dList) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__167, dtb__168) -> ((v_Vuna_dCompiler_dIr_dValidate_dirSize (Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirAltBodyOf dtb__167)) + (v_Vuna_dCompiler_dIr_dValidate_dirSizeAlts dtb__168))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))
# 332 "Vuna/Compiler/Ir/Validate.vuna"
and v_Vuna_dCompiler_dIr_dValidate_dirSizeAlt = (fun (mc0 : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrAlt Base_dData_dMaybe.t_Base_dData_dMaybe_dMaybe) -> (match mc0 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__169) -> (v_Vuna_dCompiler_dIr_dValidate_dirSize (Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirAltBodyOf dtb__169))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> 0
  | _ -> failwith "DT: impossible branch"
))

# 105 "Vuna/Compiler/Ir/Validate.vuna"
let rec v_Vuna_dCompiler_dIr_dValidate_dcheckBinderTys = (fun (mc0 : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrTyDecl Base_dData_dList.t_Base_dData_dList_dList) (mc1 : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrDef Base_dData_dList.t_Base_dData_dList_dList) -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__170, dtb__171) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((v_Vuna_dCompiler_dIr_dValidate_dcheckDefTy mc0) (Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirDefName dtb__170)) (Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirDefTy dtb__170))) (fun (_u : int) -> (match (Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirDefBody dtb__170) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> ((v_Vuna_dCompiler_dIr_dValidate_dcheckBinderTys mc0) dtb__171)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__172) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((v_Vuna_dCompiler_dIr_dValidate_dcheckBinderTysWork ((8 * (v_Vuna_dCompiler_dIr_dValidate_dirSize dtb__172)) + 64)) mc0) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__172, Base_dData_dList.C_Base_dData_dList_dList_Nil)))) (fun (_u : int) -> ((v_Vuna_dCompiler_dIr_dValidate_dcheckBinderTys mc0) dtb__171)))
  | _ -> failwith "DT: impossible branch"
)))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (0))
  | _ -> failwith "DT: impossible branch"
))

# 235 "Vuna/Compiler/Ir/Validate.vuna"
let v_Vuna_dCompiler_dIr_dValidate_dscopedFuelOf = (fun body -> ((8 * (v_Vuna_dCompiler_dIr_dValidate_dirSize body)) + 64))

# 225 "Vuna/Compiler/Ir/Validate.vuna"
let rec v_Vuna_dCompiler_dIr_dValidate_dcheckScopedDefs = (fun (mc0 : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrDef Base_dData_dList.t_Base_dData_dList_dList) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__173, dtb__174) -> (match (Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirDefBody dtb__173) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (v_Vuna_dCompiler_dIr_dValidate_dcheckScopedDefs dtb__174)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__175) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((v_Vuna_dCompiler_dIr_dValidate_dcheckScopedWork ((v_Vuna_dCompiler_dIr_dValidate_dscopedFuelOf dtb__175) + 1)) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = Base_dData_dList.C_Base_dData_dList_dList_Nil; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__175 }, Base_dData_dList.C_Base_dData_dList_dList_Nil)))) (fun (_u : int) -> (v_Vuna_dCompiler_dIr_dValidate_dcheckScopedDefs dtb__174)))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (0))
  | _ -> failwith "DT: impossible branch"
))

# 222 "Vuna/Compiler/Ir/Validate.vuna"
let v_Vuna_dCompiler_dIr_dValidate_dcheckScopedUnit = (fun u -> (v_Vuna_dCompiler_dIr_dValidate_dcheckScopedDefs ((Base_dData_dList.v_Base_dData_dList_dconcatMap Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirGroupDefs) (u).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrUnit_irUnitGroups)))

# 23 "Vuna/Compiler/Ir/Validate.vuna"
let v_Vuna_dCompiler_dIr_dValidate_dvalidateUnit = (fun u -> ((fun defs -> ((fun nameTbl -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (Vuna_dCompiler_dIr_dAnalysis.v_Vuna_dCompiler_dIr_dAnalysis_dcheckUniqueDefNames defs)) (fun (_u : int) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((v_Vuna_dCompiler_dIr_dValidate_dcheckGroupOrder (u).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrUnit_irUnitGroups) nameTbl)) (fun (_u : int) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (v_Vuna_dCompiler_dIr_dValidate_dcheckSymbolRefs (Vuna_dCompiler_dIr_dRuntime.v_Vuna_dCompiler_dIr_dRuntime_dirSymbolsOfUnit u))) (fun (_u : int) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (v_Vuna_dCompiler_dIr_dValidate_dcheckScopedUnit u)) (fun (_u : int) -> ((v_Vuna_dCompiler_dIr_dValidate_dcheckBinderTys (u).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrUnit_irUnitTyDecls) defs)))))))))) (Base_dContainer_dHashMap.v_Base_dContainer_dHashMap_dofNames ((Base_dData_dList.v_Base_dData_dList_dmap Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirDefName) defs)))) ((Base_dData_dList.v_Base_dData_dList_dconcatMap Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirGroupDefs) (u).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrUnit_irUnitGroups)))

# 87 "Vuna/Compiler/Ir/Validate.vuna"
let v_Vuna_dCompiler_dIr_dValidate_dvalidateProgram = (fun p -> ((fun u -> ((fun defs -> (match (u).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrUnit_irUnitEntry with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (v_Vuna_dCompiler_dIr_dValidate_dvalidateUnit u)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__176) -> (if ((Base_dData_dList.v_Base_dData_dList_dmemName (dtb__176).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrEntry_irEntryMain) ((Base_dData_dList.v_Base_dData_dList_dmap Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirDefName) defs)) then (v_Vuna_dCompiler_dIr_dValidate_dvalidateUnit u) else (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicInternal (String.concat "" ["IR entry references an undefined main: `"; (dtb__176).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrEntry_irEntryMain; "`"])))
  | _ -> failwith "DT: impossible branch"
)) ((Base_dData_dList.v_Base_dData_dList_dconcatMap Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirGroupDefs) (u).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrUnit_irUnitGroups))) (p).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrProgram_irProgUnit))
