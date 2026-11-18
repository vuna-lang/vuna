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

# 220 "Vuna/Compiler/Ir/Validate.vuna"
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

# 229 "Vuna/Compiler/Ir/Validate.vuna"
let rec v_Vuna_dCompiler_dIr_dValidate_dlistLength = (fun mc0 -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__24, dtb__25) -> (1 + (v_Vuna_dCompiler_dIr_dValidate_dlistLength dtb__25))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))

# 193 "Vuna/Compiler/Ir/Validate.vuna"
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
# 215 "Vuna/Compiler/Ir/Validate.vuna"
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

# 156 "Vuna/Compiler/Ir/Validate.vuna"
let v_Vuna_dCompiler_dIr_dValidate_dcheckCtorTys = (fun (mc0 : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrTyDecl Base_dData_dList.t_Base_dData_dList_dList) (mc1 : string) (mc2 : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrTy Base_dData_dList.t_Base_dData_dList_dList Base_dData_dMaybe.t_Base_dData_dMaybe_dMaybe) -> (match mc2 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__39) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((v_Vuna_dCompiler_dIr_dValidate_dcheckTyArityList mc0) dtb__39)) (fun (_u : int) -> (match ((v_Vuna_dCompiler_dIr_dValidate_dtyDeclArityOf mc0) mc1) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__40) -> (if ((v_Vuna_dCompiler_dIr_dValidate_dlistLength dtb__39) = dtb__40) then (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (0)) else (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicInternal (String.concat "" ["constructor application has the wrong runtime type argument count for `"; mc1; "`"])))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (0))
  | _ -> failwith "DT: impossible branch"
)))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (0))
  | _ -> failwith "DT: impossible branch"
))

# 166 "Vuna/Compiler/Ir/Validate.vuna"
let v_Vuna_dCompiler_dIr_dValidate_dcheckIrTyM = (fun (mc0 : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrTyDecl Base_dData_dList.t_Base_dData_dList_dList) (mc1 : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrTy Base_dData_dMaybe.t_Base_dData_dMaybe_dMaybe) -> (match mc1 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__41) -> ((v_Vuna_dCompiler_dIr_dValidate_dcheckTyArity mc0) dtb__41)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (0))
  | _ -> failwith "DT: impossible branch"
))

# 149 "Vuna/Compiler/Ir/Validate.vuna"
let v_Vuna_dCompiler_dIr_dValidate_dcheckAppTyM = (fun (mc0 : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrTyDecl Base_dData_dList.t_Base_dData_dList_dList) (mc1 : (Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrTy, Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrTy) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dMaybe.t_Base_dData_dMaybe_dMaybe) -> (match mc1 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__42) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((v_Vuna_dCompiler_dIr_dValidate_dcheckIrTyM mc0) (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ((Base_dData_dPair.v_Base_dData_dPair_dfirstOf dtb__42))))) (fun (_u : int) -> ((v_Vuna_dCompiler_dIr_dValidate_dcheckIrTyM mc0) (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ((Base_dData_dPair.v_Base_dData_dPair_dsecondOf dtb__42))))))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (0))
  | _ -> failwith "DT: impossible branch"
))

# 170 "Vuna/Compiler/Ir/Validate.vuna"
let rec v_Vuna_dCompiler_dIr_dValidate_dcheckBinderTysOf = (fun (mc0 : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrTyDecl Base_dData_dList.t_Base_dData_dList_dList) (mc1 : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrBinder Base_dData_dList.t_Base_dData_dList_dList) -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__43, dtb__44) -> (if (dtb__43).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrBinder_irBinderErased then (match (dtb__43).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrBinder_irBinderTy with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> ((v_Vuna_dCompiler_dIr_dValidate_dcheckBinderTysOf mc0) dtb__44)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__45) -> (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicInternal "erased binder carries a runtime type annotation")
  | _ -> failwith "DT: impossible branch"
) else (match (dtb__43).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrBinder_irBinderTy with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> ((v_Vuna_dCompiler_dIr_dValidate_dcheckBinderTysOf mc0) dtb__44)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__46) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((v_Vuna_dCompiler_dIr_dValidate_dcheckTyArity mc0) dtb__46)) (fun (_u : int) -> ((v_Vuna_dCompiler_dIr_dValidate_dcheckBinderTysOf mc0) dtb__44)))
  | _ -> failwith "DT: impossible branch"
))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (0))
  | _ -> failwith "DT: impossible branch"
))

# 182 "Vuna/Compiler/Ir/Validate.vuna"
let rec v_Vuna_dCompiler_dIr_dValidate_dcheckAltBinderTys = (fun (mc0 : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrTyDecl Base_dData_dList.t_Base_dData_dList_dList) (mc1 : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrAlt Base_dData_dList.t_Base_dData_dList_dList) -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__47, dtb__48) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((v_Vuna_dCompiler_dIr_dValidate_dcheckBinderTysOf mc0) (Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirAltBindersOf dtb__47))) (fun (_u : int) -> ((v_Vuna_dCompiler_dIr_dValidate_dcheckAltBinderTys mc0) dtb__48)))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (0))
  | _ -> failwith "DT: impossible branch"
))

# 189 "Vuna/Compiler/Ir/Validate.vuna"
let v_Vuna_dCompiler_dIr_dValidate_dcheckAltBinderTysM = (fun (mc0 : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrTyDecl Base_dData_dList.t_Base_dData_dList_dList) (mc1 : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrAlt Base_dData_dMaybe.t_Base_dData_dMaybe_dMaybe) -> (match mc1 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__49) -> ((v_Vuna_dCompiler_dIr_dValidate_dcheckBinderTysOf mc0) (Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirAltBindersOf dtb__49))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (0))
  | _ -> failwith "DT: impossible branch"
))

# 131 "Vuna/Compiler/Ir/Validate.vuna"
let v_Vuna_dCompiler_dIr_dValidate_dcheckNodeBinderTys = (fun decls ir -> (match ir with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLam (dtb__50, dtb__51, dtb__52) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((v_Vuna_dCompiler_dIr_dValidate_dcheckBinderTysOf decls) dtb__50)) (fun (_u : int) -> ((v_Vuna_dCompiler_dIr_dValidate_dcheckIrTyM decls) dtb__51)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLet (dtb__53, dtb__54, dtb__55) -> ((v_Vuna_dCompiler_dIr_dValidate_dcheckBinderTysOf decls) dtb__53)
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCase (dtb__56, dtb__57, dtb__58) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((v_Vuna_dCompiler_dIr_dValidate_dcheckIrTyM decls) dtb__56)) (fun (_u : int) -> ((v_Vuna_dCompiler_dIr_dValidate_dcheckAltBinderTys decls) dtb__58)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (dtb__59, dtb__60, dtb__61) -> ((v_Vuna_dCompiler_dIr_dValidate_dcheckAppTyM decls) dtb__59)
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCtor (dtb__62, dtb__63, dtb__64, dtb__65) -> (((v_Vuna_dCompiler_dIr_dValidate_dcheckCtorTys decls) dtb__62) dtb__64)
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrNatCase (dtb__66, dtb__67, dtb__68, dtb__69, dtb__70) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((v_Vuna_dCompiler_dIr_dValidate_dcheckAltBinderTysM decls) dtb__68)) (fun (_u : int) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((v_Vuna_dCompiler_dIr_dValidate_dcheckAltBinderTysM decls) dtb__69)) (fun (_u : int) -> ((v_Vuna_dCompiler_dIr_dValidate_dcheckAltBinderTysM decls) dtb__70)))))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCast (dtb__71, dtb__72, dtb__73) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((v_Vuna_dCompiler_dIr_dValidate_dcheckIrTyM decls) dtb__71)) (fun (_u : int) -> ((v_Vuna_dCompiler_dIr_dValidate_dcheckIrTyM decls) dtb__72)))
  | _ -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (0))
))

# 293 "Vuna/Compiler/Ir/Validate.vuna"
let v_Vuna_dCompiler_dIr_dValidate_dmaybeAlts = (fun (mc0 : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrAlt Base_dData_dMaybe.t_Base_dData_dMaybe_dMaybe) -> (match mc0 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__74) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__74, Base_dData_dList.C_Base_dData_dList_dList_Nil))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 297 "Vuna/Compiler/Ir/Validate.vuna"
let rec v_Vuna_dCompiler_dIr_dValidate_daltWork = (fun (mc0 : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrBinder Base_dData_dList.t_Base_dData_dList_dList) (mc1 : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrAlt Base_dData_dList.t_Base_dData_dList_dList) -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__75, dtb__76) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = ((Base_dData_dList.v_Base_dData_dList_dappend (Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirAltBindersOf dtb__75)) mc0); Base_dData_dPair.f_Base_dData_dPair_dPair_second = (Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirAltBodyOf dtb__75) }, ((v_Vuna_dCompiler_dIr_dValidate_daltWork mc0) dtb__76)))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 271 "Vuna/Compiler/Ir/Validate.vuna"
let v_Vuna_dCompiler_dIr_dValidate_dscopedChildren = (fun scope ir -> (match ir with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCtor (dtb__77, dtb__78, dtb__79, dtb__80) -> ((Base_dData_dList.v_Base_dData_dList_dmap (fun (a : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIr) -> { Base_dData_dPair.f_Base_dData_dPair_dPair_first = scope; Base_dData_dPair.f_Base_dData_dPair_dPair_second = a })) dtb__80)
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRecord (dtb__81, dtb__82) -> ((Base_dData_dList.v_Base_dData_dList_dmap (fun (p : (string, Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIr) Base_dData_dPair.t_Base_dData_dPair_dPair) -> { Base_dData_dPair.f_Base_dData_dPair_dPair_first = scope; Base_dData_dPair.f_Base_dData_dPair_dPair_second = (Base_dData_dPair.v_Base_dData_dPair_dsecondOf p) })) dtb__82)
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrProj (dtb__83, dtb__84, dtb__85) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = scope; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__83 }, Base_dData_dList.C_Base_dData_dList_dList_Nil))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRecUpd (dtb__86, dtb__87, dtb__88) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = scope; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__86 }, ((Base_dData_dList.v_Base_dData_dList_dmap (fun (p : (string, Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIr) Base_dData_dPair.t_Base_dData_dPair_dPair) -> { Base_dData_dPair.f_Base_dData_dPair_dPair_first = scope; Base_dData_dPair.f_Base_dData_dPair_dPair_second = (Base_dData_dPair.v_Base_dData_dPair_dsecondOf p) })) dtb__88)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRtApp (dtb__89, dtb__90) -> ((Base_dData_dList.v_Base_dData_dList_dmap (fun (a : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIr) -> { Base_dData_dPair.f_Base_dData_dPair_dPair_first = scope; Base_dData_dPair.f_Base_dData_dPair_dPair_second = a })) dtb__90)
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCast (dtb__91, dtb__92, dtb__93) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = scope; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__93 }, Base_dData_dList.C_Base_dData_dList_dList_Nil))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLet (dtb__94, dtb__95, dtb__96) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = scope; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__95 }, (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = ((Base_dData_dList.v_Base_dData_dList_dappend dtb__94) scope); Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__96 }, Base_dData_dList.C_Base_dData_dList_dList_Nil))))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLam (dtb__97, dtb__98, dtb__99) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = ((Base_dData_dList.v_Base_dData_dList_dappend dtb__97) scope); Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__99 }, Base_dData_dList.C_Base_dData_dList_dList_Nil))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (dtb__100, dtb__101, dtb__102) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = scope; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__101 }, (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = scope; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__102 }, Base_dData_dList.C_Base_dData_dList_dList_Nil))))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrIf (dtb__103, dtb__104, dtb__105) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = scope; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__103 }, (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = scope; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__104 }, (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = scope; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__105 }, Base_dData_dList.C_Base_dData_dList_dList_Nil))))))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCase (dtb__106, dtb__107, dtb__108) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = scope; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__107 }, ((v_Vuna_dCompiler_dIr_dValidate_daltWork scope) dtb__108)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrNatCase (dtb__109, dtb__110, dtb__111, dtb__112, dtb__113) -> ((Base_dData_dList.v_Base_dData_dList_dappend (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = scope; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__109 }, Base_dData_dList.C_Base_dData_dList_dList_Nil))) ((Base_dData_dList.v_Base_dData_dList_dappend ((v_Vuna_dCompiler_dIr_dValidate_daltWork scope) (v_Vuna_dCompiler_dIr_dValidate_dmaybeAlts dtb__111))) ((Base_dData_dList.v_Base_dData_dList_dappend ((v_Vuna_dCompiler_dIr_dValidate_daltWork scope) (v_Vuna_dCompiler_dIr_dValidate_dmaybeAlts dtb__112))) ((v_Vuna_dCompiler_dIr_dValidate_daltWork scope) (v_Vuna_dCompiler_dIr_dValidate_dmaybeAlts dtb__113)))))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrConcatMany (dtb__114) -> ((Base_dData_dList.v_Base_dData_dList_dmap (fun (a : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIr) -> { Base_dData_dPair.f_Base_dData_dPair_dPair_first = scope; Base_dData_dPair.f_Base_dData_dPair_dPair_second = a })) dtb__114)
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrEffThunk (dtb__115, dtb__116, dtb__117, dtb__118, dtb__119) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = scope; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__119 }, Base_dData_dList.C_Base_dData_dList_dList_Nil))
  | _ -> Base_dData_dList.C_Base_dData_dList_dList_Nil
))

# 122 "Vuna/Compiler/Ir/Validate.vuna"
let rec v_Vuna_dCompiler_dIr_dValidate_dcheckBinderTysWork = (fun fuel decls work -> (if (fuel <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "ir-binder-ty") else (match work with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (0))
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__120, dtb__121) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((v_Vuna_dCompiler_dIr_dValidate_dcheckNodeBinderTys decls) dtb__120)) (fun (_u : int) -> (((v_Vuna_dCompiler_dIr_dValidate_dcheckBinderTysWork (fuel - 1)) decls) ((Base_dData_dList.v_Base_dData_dList_dappend ((Base_dData_dList.v_Base_dData_dList_dmap Base_dData_dPair.v_Base_dData_dPair_dsecondOf) ((v_Vuna_dCompiler_dIr_dValidate_dscopedChildren Base_dData_dList.C_Base_dData_dList_dList_Nil) dtb__120))) dtb__121))))
  | _ -> failwith "DT: impossible branch"
)))

# 310 "Vuna/Compiler/Ir/Validate.vuna"
let v_Vuna_dCompiler_dIr_dValidate_dsameBName = (fun (mc0 : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrBName) (mc1 : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrBName) -> (match mc0 with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrBName_IrBWild -> (match mc1 with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrBName_IrBWild -> true
  | _ -> false
)
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrBName_IrBNat (dtb__122) -> (match mc1 with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrBName_IrBNat (dtb__123) -> (dtb__122 = dtb__123)
  | _ -> false
)
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrBName_IrBArm (dtb__124) -> (match mc1 with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrBName_IrBArm (dtb__125) -> (dtb__124 = dtb__125)
  | _ -> false
)
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrBName_IrBUser (dtb__126) -> (match mc1 with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrBName_IrBUser (dtb__127) -> (dtb__126 = dtb__127)
  | _ -> false
)
  | _ -> failwith "DT: impossible branch"
))

# 306 "Vuna/Compiler/Ir/Validate.vuna"
let v_Vuna_dCompiler_dIr_dValidate_dsameBinder = (fun b1 b2 -> (if (((Base_dTrait_dEq.v_Base_dTrait_dEq_d_x61__x61_ Base_dTrait_dEq.v_Eq_uBase_uData_uBool_uBool) (b1).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrBinder_irBinderErased) (b2).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrBinder_irBinderErased) then ((v_Vuna_dCompiler_dIr_dValidate_dsameBName (b1).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrBinder_irBinderName) (b2).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrBinder_irBinderName) else false))

# 302 "Vuna/Compiler/Ir/Validate.vuna"
let rec v_Vuna_dCompiler_dIr_dValidate_dmemBinder = (fun (mc0 : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrBinder) (mc1 : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrBinder Base_dData_dList.t_Base_dData_dList_dList) -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__128, dtb__129) -> (if ((v_Vuna_dCompiler_dIr_dValidate_dsameBinder mc0) dtb__128) then true else ((v_Vuna_dCompiler_dIr_dValidate_dmemBinder mc0) dtb__129))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 258 "Vuna/Compiler/Ir/Validate.vuna"
let rec v_Vuna_dCompiler_dIr_dValidate_dcheckScopedWork = (fun fuel work -> (if (fuel <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "ir-scope") else ((fun nd_uscrut2 -> (match nd_uscrut2 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__130, dtb__131) -> (match dtb__130 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__132; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__133 } -> (match dtb__133 with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrVar (dtb__134) -> (if (dtb__134).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrBinder_irBinderErased then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicInternal "erased binder reached runtime IR") else (if ((v_Vuna_dCompiler_dIr_dValidate_dmemBinder dtb__134) dtb__132) then ((v_Vuna_dCompiler_dIr_dValidate_dcheckScopedWork (fuel - 1)) dtb__131) else (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicInternal "IR variable references a binder outside its scope")))
  | _ -> ((v_Vuna_dCompiler_dIr_dValidate_dcheckScopedWork (fuel - 1)) ((Base_dData_dList.v_Base_dData_dList_dappend ((v_Vuna_dCompiler_dIr_dValidate_dscopedChildren dtb__132) dtb__133)) dtb__131))
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (0))
  | _ -> failwith "DT: impossible branch"
)) work)))

# 317 "Vuna/Compiler/Ir/Validate.vuna"
let rec v_Vuna_dCompiler_dIr_dValidate_dirSize = (fun ir -> (1 + (v_Vuna_dCompiler_dIr_dValidate_dirSizeChildren ir)))
# 320 "Vuna/Compiler/Ir/Validate.vuna"
and v_Vuna_dCompiler_dIr_dValidate_dirSizeChildren = (fun ir -> (match ir with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCtor (dtb__135, dtb__136, dtb__137, dtb__138) -> (v_Vuna_dCompiler_dIr_dValidate_dirSizeList dtb__138)
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRecord (dtb__139, dtb__140) -> (v_Vuna_dCompiler_dIr_dValidate_dirSizeFields dtb__140)
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrProj (dtb__141, dtb__142, dtb__143) -> (v_Vuna_dCompiler_dIr_dValidate_dirSize dtb__141)
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRecUpd (dtb__144, dtb__145, dtb__146) -> ((v_Vuna_dCompiler_dIr_dValidate_dirSize dtb__144) + (v_Vuna_dCompiler_dIr_dValidate_dirSizeFields dtb__146))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRtApp (dtb__147, dtb__148) -> (v_Vuna_dCompiler_dIr_dValidate_dirSizeList dtb__148)
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCast (dtb__149, dtb__150, dtb__151) -> (v_Vuna_dCompiler_dIr_dValidate_dirSize dtb__151)
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLet (dtb__152, dtb__153, dtb__154) -> ((v_Vuna_dCompiler_dIr_dValidate_dirSize dtb__153) + (v_Vuna_dCompiler_dIr_dValidate_dirSize dtb__154))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLam (dtb__155, dtb__156, dtb__157) -> (v_Vuna_dCompiler_dIr_dValidate_dirSize dtb__157)
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (dtb__158, dtb__159, dtb__160) -> ((v_Vuna_dCompiler_dIr_dValidate_dirSize dtb__159) + (v_Vuna_dCompiler_dIr_dValidate_dirSize dtb__160))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrIf (dtb__161, dtb__162, dtb__163) -> (((v_Vuna_dCompiler_dIr_dValidate_dirSize dtb__161) + (v_Vuna_dCompiler_dIr_dValidate_dirSize dtb__162)) + (v_Vuna_dCompiler_dIr_dValidate_dirSize dtb__163))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCase (dtb__164, dtb__165, dtb__166) -> ((v_Vuna_dCompiler_dIr_dValidate_dirSize dtb__165) + (v_Vuna_dCompiler_dIr_dValidate_dirSizeAlts dtb__166))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrNatCase (dtb__167, dtb__168, dtb__169, dtb__170, dtb__171) -> ((((v_Vuna_dCompiler_dIr_dValidate_dirSize dtb__167) + (v_Vuna_dCompiler_dIr_dValidate_dirSizeAlt dtb__169)) + (v_Vuna_dCompiler_dIr_dValidate_dirSizeAlt dtb__170)) + (v_Vuna_dCompiler_dIr_dValidate_dirSizeAlt dtb__171))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrConcatMany (dtb__172) -> (v_Vuna_dCompiler_dIr_dValidate_dirSizeList dtb__172)
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrEffThunk (dtb__173, dtb__174, dtb__175, dtb__176, dtb__177) -> (v_Vuna_dCompiler_dIr_dValidate_dirSize dtb__177)
  | _ -> 0
))
# 340 "Vuna/Compiler/Ir/Validate.vuna"
and v_Vuna_dCompiler_dIr_dValidate_dirSizeList = (fun (mc0 : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIr Base_dData_dList.t_Base_dData_dList_dList) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__178, dtb__179) -> ((v_Vuna_dCompiler_dIr_dValidate_dirSize dtb__178) + (v_Vuna_dCompiler_dIr_dValidate_dirSizeList dtb__179))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))
# 344 "Vuna/Compiler/Ir/Validate.vuna"
and v_Vuna_dCompiler_dIr_dValidate_dirSizeFields = (fun (mc0 : (string, Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIr) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__180, dtb__181) -> (match dtb__180 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__182; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__183 } -> ((v_Vuna_dCompiler_dIr_dValidate_dirSize dtb__183) + (v_Vuna_dCompiler_dIr_dValidate_dirSizeFields dtb__181))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))
# 348 "Vuna/Compiler/Ir/Validate.vuna"
and v_Vuna_dCompiler_dIr_dValidate_dirSizeAlts = (fun (mc0 : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrAlt Base_dData_dList.t_Base_dData_dList_dList) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__184, dtb__185) -> ((v_Vuna_dCompiler_dIr_dValidate_dirSize (Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirAltBodyOf dtb__184)) + (v_Vuna_dCompiler_dIr_dValidate_dirSizeAlts dtb__185))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))
# 352 "Vuna/Compiler/Ir/Validate.vuna"
and v_Vuna_dCompiler_dIr_dValidate_dirSizeAlt = (fun (mc0 : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrAlt Base_dData_dMaybe.t_Base_dData_dMaybe_dMaybe) -> (match mc0 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__186) -> (v_Vuna_dCompiler_dIr_dValidate_dirSize (Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirAltBodyOf dtb__186))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> 0
  | _ -> failwith "DT: impossible branch"
))

# 105 "Vuna/Compiler/Ir/Validate.vuna"
let rec v_Vuna_dCompiler_dIr_dValidate_dcheckBinderTys = (fun (mc0 : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrTyDecl Base_dData_dList.t_Base_dData_dList_dList) (mc1 : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrDef Base_dData_dList.t_Base_dData_dList_dList) -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__187, dtb__188) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((v_Vuna_dCompiler_dIr_dValidate_dcheckDefTy mc0) (Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirDefName dtb__187)) (Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirDefTy dtb__187))) (fun (_u : int) -> (match (Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirDefBody dtb__187) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> ((v_Vuna_dCompiler_dIr_dValidate_dcheckBinderTys mc0) dtb__188)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__189) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((v_Vuna_dCompiler_dIr_dValidate_dcheckBinderTysWork ((8 * (v_Vuna_dCompiler_dIr_dValidate_dirSize dtb__189)) + 64)) mc0) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__189, Base_dData_dList.C_Base_dData_dList_dList_Nil)))) (fun (_u : int) -> ((v_Vuna_dCompiler_dIr_dValidate_dcheckBinderTys mc0) dtb__188)))
  | _ -> failwith "DT: impossible branch"
)))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (0))
  | _ -> failwith "DT: impossible branch"
))

# 255 "Vuna/Compiler/Ir/Validate.vuna"
let v_Vuna_dCompiler_dIr_dValidate_dscopedFuelOf = (fun body -> ((8 * (v_Vuna_dCompiler_dIr_dValidate_dirSize body)) + 64))

# 245 "Vuna/Compiler/Ir/Validate.vuna"
let rec v_Vuna_dCompiler_dIr_dValidate_dcheckScopedDefs = (fun (mc0 : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrDef Base_dData_dList.t_Base_dData_dList_dList) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__190, dtb__191) -> (match (Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirDefBody dtb__190) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (v_Vuna_dCompiler_dIr_dValidate_dcheckScopedDefs dtb__191)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__192) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((v_Vuna_dCompiler_dIr_dValidate_dcheckScopedWork ((v_Vuna_dCompiler_dIr_dValidate_dscopedFuelOf dtb__192) + 1)) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = Base_dData_dList.C_Base_dData_dList_dList_Nil; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__192 }, Base_dData_dList.C_Base_dData_dList_dList_Nil)))) (fun (_u : int) -> (v_Vuna_dCompiler_dIr_dValidate_dcheckScopedDefs dtb__191)))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (0))
  | _ -> failwith "DT: impossible branch"
))

# 242 "Vuna/Compiler/Ir/Validate.vuna"
let v_Vuna_dCompiler_dIr_dValidate_dcheckScopedUnit = (fun u -> (v_Vuna_dCompiler_dIr_dValidate_dcheckScopedDefs ((Base_dData_dList.v_Base_dData_dList_dconcatMap Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirGroupDefs) (u).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrUnit_irUnitGroups)))

# 23 "Vuna/Compiler/Ir/Validate.vuna"
let v_Vuna_dCompiler_dIr_dValidate_dvalidateUnit = (fun u -> ((fun defs -> ((fun nameTbl -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (Vuna_dCompiler_dIr_dAnalysis.v_Vuna_dCompiler_dIr_dAnalysis_dcheckUniqueDefNames defs)) (fun (_u : int) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((v_Vuna_dCompiler_dIr_dValidate_dcheckGroupOrder (u).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrUnit_irUnitGroups) nameTbl)) (fun (_u : int) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (v_Vuna_dCompiler_dIr_dValidate_dcheckSymbolRefs (Vuna_dCompiler_dIr_dRuntime.v_Vuna_dCompiler_dIr_dRuntime_dirSymbolsOfUnit u))) (fun (_u : int) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (v_Vuna_dCompiler_dIr_dValidate_dcheckScopedUnit u)) (fun (_u : int) -> ((v_Vuna_dCompiler_dIr_dValidate_dcheckBinderTys (u).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrUnit_irUnitTyDecls) defs)))))))))) (Base_dContainer_dHashMap.v_Base_dContainer_dHashMap_dofNames ((Base_dData_dList.v_Base_dData_dList_dmap Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirDefName) defs)))) ((Base_dData_dList.v_Base_dData_dList_dconcatMap Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirGroupDefs) (u).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrUnit_irUnitGroups)))

# 87 "Vuna/Compiler/Ir/Validate.vuna"
let v_Vuna_dCompiler_dIr_dValidate_dvalidateProgram = (fun p -> ((fun u -> ((fun defs -> (match (u).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrUnit_irUnitEntry with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (v_Vuna_dCompiler_dIr_dValidate_dvalidateUnit u)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__193) -> (if ((Base_dData_dList.v_Base_dData_dList_dmemName (dtb__193).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrEntry_irEntryMain) ((Base_dData_dList.v_Base_dData_dList_dmap Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirDefName) defs)) then (v_Vuna_dCompiler_dIr_dValidate_dvalidateUnit u) else (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicInternal (String.concat "" ["IR entry references an undefined main: `"; (dtb__193).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrEntry_irEntryMain; "`"])))
  | _ -> failwith "DT: impossible branch"
)) ((Base_dData_dList.v_Base_dData_dList_dconcatMap Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirGroupDefs) (u).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrUnit_irUnitGroups))) (p).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrProgram_irProgUnit))
