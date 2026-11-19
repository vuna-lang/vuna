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

# 260 "Vuna/Compiler/Ir/Validate.vuna"
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

# 269 "Vuna/Compiler/Ir/Validate.vuna"
let rec v_Vuna_dCompiler_dIr_dValidate_dlistLength = (fun mc0 -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__24, dtb__25) -> (1 + (v_Vuna_dCompiler_dIr_dValidate_dlistLength dtb__25))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))

# 201 "Vuna/Compiler/Ir/Validate.vuna"
let rec v_Vuna_dCompiler_dIr_dValidate_dctorFieldsIn = (fun (mc0 : string) (mc1 : (string, Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrTy Base_dData_dList.t_Base_dData_dList_dList) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__26, dtb__27) -> (if ((Base_dData_dPair.v_Base_dData_dPair_dfirstOf dtb__26) = mc0) then (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ((v_Vuna_dCompiler_dIr_dValidate_dlistLength (Base_dData_dPair.v_Base_dData_dPair_dsecondOf dtb__26)))) else ((v_Vuna_dCompiler_dIr_dValidate_dctorFieldsIn mc0) dtb__27))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 191 "Vuna/Compiler/Ir/Validate.vuna"
let rec v_Vuna_dCompiler_dIr_dValidate_dctorFieldCountOf = (fun (mc0 : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrTyDecl Base_dData_dList.t_Base_dData_dList_dList) (mc1 : string) (mc2 : string) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__28, dtb__29) -> (match dtb__28 with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTyDecl_IrVariantDecl (dtb__30, dtb__31, dtb__32) -> (if (dtb__30 = mc1) then ((v_Vuna_dCompiler_dIr_dValidate_dctorFieldsIn mc2) dtb__32) else (((v_Vuna_dCompiler_dIr_dValidate_dctorFieldCountOf dtb__29) mc1) mc2))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTyDecl_IrRecordDecl (dtb__33, dtb__34, dtb__35, dtb__36) -> (if (dtb__33 = mc1) then (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ((v_Vuna_dCompiler_dIr_dValidate_dlistLength dtb__36))) else (((v_Vuna_dCompiler_dIr_dValidate_dctorFieldCountOf dtb__29) mc1) mc2))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTyDecl_IrUnboxedDecl (dtb__37, dtb__38, dtb__39) -> (if (dtb__37 = mc1) then (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (1)) else (((v_Vuna_dCompiler_dIr_dValidate_dctorFieldCountOf dtb__29) mc1) mc2))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 180 "Vuna/Compiler/Ir/Validate.vuna"
let v_Vuna_dCompiler_dIr_dValidate_dcheckCtorArity = (fun decls family ctor nargs -> (match (((v_Vuna_dCompiler_dIr_dValidate_dctorFieldCountOf decls) family) ctor) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__40) -> (if (nargs = dtb__40) then (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (0)) else (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicInternal (String.concat "" ["constructor `"; ctor; "` has "; (bi_strFromInt nargs); " runtime arguments, expected "; (bi_strFromInt dtb__40)])))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (0))
  | _ -> failwith "DT: impossible branch"
))

# 233 "Vuna/Compiler/Ir/Validate.vuna"
let rec v_Vuna_dCompiler_dIr_dValidate_dcheckTyArity = (fun (mc0 : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrTyDecl Base_dData_dList.t_Base_dData_dList_dList) (mc1 : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrTy) -> (match mc1 with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyData (dtb__41, dtb__42) -> (match ((v_Vuna_dCompiler_dIr_dValidate_dtyDeclArityOf mc0) dtb__41) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__43) -> (if ((v_Vuna_dCompiler_dIr_dValidate_dlistLength dtb__42) = dtb__43) then ((v_Vuna_dCompiler_dIr_dValidate_dcheckTyArityList mc0) dtb__42) else (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicInternal (String.concat "" ["binder type annotation has the wrong type argument count for `"; dtb__41; "` (expected "; (bi_strFromInt dtb__43); ", got "; (bi_strFromInt (v_Vuna_dCompiler_dIr_dValidate_dlistLength dtb__42)); ")"])))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> ((v_Vuna_dCompiler_dIr_dValidate_dcheckTyArityList mc0) dtb__42)
  | _ -> failwith "DT: impossible branch"
)
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyFun (dtb__44, dtb__45) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((v_Vuna_dCompiler_dIr_dValidate_dcheckTyArity mc0) dtb__44)) (fun (_u : int) -> ((v_Vuna_dCompiler_dIr_dValidate_dcheckTyArity mc0) dtb__45)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyRef (dtb__46) -> ((v_Vuna_dCompiler_dIr_dValidate_dcheckTyArity mc0) dtb__46)
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyArray (dtb__47) -> ((v_Vuna_dCompiler_dIr_dValidate_dcheckTyArity mc0) dtb__47)
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyOpaque -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (0))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyFloat -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (0))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyBool -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (0))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyStr -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (0))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyInt -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (0))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyVar (dtb__48) -> (if (dtb__48 >= 0) then (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (0)) else (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicInternal "negative runtime type parameter slot"))
  | _ -> failwith "DT: impossible branch"
))
# 255 "Vuna/Compiler/Ir/Validate.vuna"
and v_Vuna_dCompiler_dIr_dValidate_dcheckTyArityList = (fun (mc0 : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrTyDecl Base_dData_dList.t_Base_dData_dList_dList) (mc1 : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrTy Base_dData_dList.t_Base_dData_dList_dList) -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__49, dtb__50) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((v_Vuna_dCompiler_dIr_dValidate_dcheckTyArity mc0) dtb__49)) (fun (_u : int) -> ((v_Vuna_dCompiler_dIr_dValidate_dcheckTyArityList mc0) dtb__50)))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (0))
  | _ -> failwith "DT: impossible branch"
))

# 115 "Vuna/Compiler/Ir/Validate.vuna"
let v_Vuna_dCompiler_dIr_dValidate_dcheckDefTy = (fun (mc0 : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrTyDecl Base_dData_dList.t_Base_dData_dList_dList) (mc1 : string) (mc2 : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrTy Base_dData_dMaybe.t_Base_dData_dMaybe_dMaybe) -> (match mc2 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__51) -> (match ((v_Vuna_dCompiler_dIr_dValidate_dcheckTyArity mc0) dtb__51) with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__52) -> (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicInternal (String.concat "" ["definition `"; mc1; "` has an invalid runtime signature"]))
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__53) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__53))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (0))
  | _ -> failwith "DT: impossible branch"
))

# 176 "Vuna/Compiler/Ir/Validate.vuna"
let v_Vuna_dCompiler_dIr_dValidate_dcheckTyArityListM = (fun (mc0 : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrTyDecl Base_dData_dList.t_Base_dData_dList_dList) (mc1 : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrTy Base_dData_dList.t_Base_dData_dList_dList Base_dData_dMaybe.t_Base_dData_dMaybe_dMaybe) -> (match mc1 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__54) -> ((v_Vuna_dCompiler_dIr_dValidate_dcheckTyArityList mc0) dtb__54)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (0))
  | _ -> failwith "DT: impossible branch"
))

# 161 "Vuna/Compiler/Ir/Validate.vuna"
let v_Vuna_dCompiler_dIr_dValidate_dcheckCtorTys = (fun decls family ctor tys nargs -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((v_Vuna_dCompiler_dIr_dValidate_dcheckTyArityListM decls) tys)) (fun (_u : int) -> ((fun typeArityOk -> (if typeArityOk then ((((v_Vuna_dCompiler_dIr_dValidate_dcheckCtorArity decls) family) ctor) nargs) else (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicInternal (String.concat "" ["constructor application has the wrong runtime type argument count for `"; family; "`"])))) (match ((v_Vuna_dCompiler_dIr_dValidate_dtyDeclArityOf decls) family) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__55) -> (match tys with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__56) -> ((v_Vuna_dCompiler_dIr_dValidate_dlistLength dtb__56) = dtb__55)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> true
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> true
  | _ -> failwith "DT: impossible branch"
)))))

# 206 "Vuna/Compiler/Ir/Validate.vuna"
let v_Vuna_dCompiler_dIr_dValidate_dcheckIrTyM = (fun (mc0 : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrTyDecl Base_dData_dList.t_Base_dData_dList_dList) (mc1 : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrTy Base_dData_dMaybe.t_Base_dData_dMaybe_dMaybe) -> (match mc1 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__57) -> ((v_Vuna_dCompiler_dIr_dValidate_dcheckTyArity mc0) dtb__57)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (0))
  | _ -> failwith "DT: impossible branch"
))

# 154 "Vuna/Compiler/Ir/Validate.vuna"
let v_Vuna_dCompiler_dIr_dValidate_dcheckAppTyM = (fun (mc0 : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrTyDecl Base_dData_dList.t_Base_dData_dList_dList) (mc1 : (Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrTy, Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrTy) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dMaybe.t_Base_dData_dMaybe_dMaybe) -> (match mc1 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__58) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((v_Vuna_dCompiler_dIr_dValidate_dcheckIrTyM mc0) (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ((Base_dData_dPair.v_Base_dData_dPair_dfirstOf dtb__58))))) (fun (_u : int) -> ((v_Vuna_dCompiler_dIr_dValidate_dcheckIrTyM mc0) (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ((Base_dData_dPair.v_Base_dData_dPair_dsecondOf dtb__58))))))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (0))
  | _ -> failwith "DT: impossible branch"
))

# 210 "Vuna/Compiler/Ir/Validate.vuna"
let rec v_Vuna_dCompiler_dIr_dValidate_dcheckBinderTysOf = (fun (mc0 : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrTyDecl Base_dData_dList.t_Base_dData_dList_dList) (mc1 : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrBinder Base_dData_dList.t_Base_dData_dList_dList) -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__59, dtb__60) -> (if (dtb__59).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrBinder_irBinderErased then (match (dtb__59).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrBinder_irBinderTy with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> ((v_Vuna_dCompiler_dIr_dValidate_dcheckBinderTysOf mc0) dtb__60)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__61) -> (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicInternal "erased binder carries a runtime type annotation")
  | _ -> failwith "DT: impossible branch"
) else (match (dtb__59).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrBinder_irBinderTy with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> ((v_Vuna_dCompiler_dIr_dValidate_dcheckBinderTysOf mc0) dtb__60)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__62) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((v_Vuna_dCompiler_dIr_dValidate_dcheckTyArity mc0) dtb__62)) (fun (_u : int) -> ((v_Vuna_dCompiler_dIr_dValidate_dcheckBinderTysOf mc0) dtb__60)))
  | _ -> failwith "DT: impossible branch"
))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (0))
  | _ -> failwith "DT: impossible branch"
))

# 222 "Vuna/Compiler/Ir/Validate.vuna"
let rec v_Vuna_dCompiler_dIr_dValidate_dcheckAltBinderTys = (fun (mc0 : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrTyDecl Base_dData_dList.t_Base_dData_dList_dList) (mc1 : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrAlt Base_dData_dList.t_Base_dData_dList_dList) -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__63, dtb__64) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((v_Vuna_dCompiler_dIr_dValidate_dcheckBinderTysOf mc0) (Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirAltBindersOf dtb__63))) (fun (_u : int) -> ((v_Vuna_dCompiler_dIr_dValidate_dcheckAltBinderTys mc0) dtb__64)))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (0))
  | _ -> failwith "DT: impossible branch"
))

# 229 "Vuna/Compiler/Ir/Validate.vuna"
let v_Vuna_dCompiler_dIr_dValidate_dcheckAltBinderTysM = (fun (mc0 : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrTyDecl Base_dData_dList.t_Base_dData_dList_dList) (mc1 : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrAlt Base_dData_dMaybe.t_Base_dData_dMaybe_dMaybe) -> (match mc1 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__65) -> ((v_Vuna_dCompiler_dIr_dValidate_dcheckBinderTysOf mc0) (Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirAltBindersOf dtb__65))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (0))
  | _ -> failwith "DT: impossible branch"
))

# 131 "Vuna/Compiler/Ir/Validate.vuna"
let v_Vuna_dCompiler_dIr_dValidate_dcheckNodeBinderTys = (fun decls ir -> (match ir with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLam (dtb__66, dtb__67, dtb__68) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((v_Vuna_dCompiler_dIr_dValidate_dcheckBinderTysOf decls) dtb__66)) (fun (_u : int) -> ((v_Vuna_dCompiler_dIr_dValidate_dcheckIrTyM decls) dtb__67)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLet (dtb__69, dtb__70, dtb__71) -> ((v_Vuna_dCompiler_dIr_dValidate_dcheckBinderTysOf decls) dtb__69)
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCase (dtb__72, dtb__73, dtb__74, dtb__75) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((v_Vuna_dCompiler_dIr_dValidate_dcheckIrTyM decls) dtb__72)) (fun (_u : int) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((v_Vuna_dCompiler_dIr_dValidate_dcheckIrTyM decls) dtb__73)) (fun (_u : int) -> ((v_Vuna_dCompiler_dIr_dValidate_dcheckAltBinderTys decls) dtb__75)))))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (dtb__76, dtb__77, dtb__78) -> ((v_Vuna_dCompiler_dIr_dValidate_dcheckAppTyM decls) dtb__76)
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCtor (dtb__79, dtb__80, dtb__81, dtb__82) -> (((((v_Vuna_dCompiler_dIr_dValidate_dcheckCtorTys decls) dtb__79) dtb__80) dtb__81) (v_Vuna_dCompiler_dIr_dValidate_dlistLength dtb__82))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRecord (dtb__83, dtb__84, dtb__85) -> ((v_Vuna_dCompiler_dIr_dValidate_dcheckIrTyM decls) dtb__84)
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrProj (dtb__86, dtb__87, dtb__88, dtb__89) -> ((v_Vuna_dCompiler_dIr_dValidate_dcheckIrTyM decls) dtb__89)
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRecUpd (dtb__90, dtb__91, dtb__92, dtb__93) -> ((v_Vuna_dCompiler_dIr_dValidate_dcheckIrTyM decls) dtb__93)
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrNatCase (dtb__94, dtb__95, dtb__96, dtb__97, dtb__98) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((v_Vuna_dCompiler_dIr_dValidate_dcheckAltBinderTysM decls) dtb__96)) (fun (_u : int) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((v_Vuna_dCompiler_dIr_dValidate_dcheckAltBinderTysM decls) dtb__97)) (fun (_u : int) -> ((v_Vuna_dCompiler_dIr_dValidate_dcheckAltBinderTysM decls) dtb__98)))))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCast (dtb__99, dtb__100, dtb__101) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((v_Vuna_dCompiler_dIr_dValidate_dcheckIrTyM decls) dtb__99)) (fun (_u : int) -> ((v_Vuna_dCompiler_dIr_dValidate_dcheckIrTyM decls) dtb__100)))
  | _ -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (0))
))

# 333 "Vuna/Compiler/Ir/Validate.vuna"
let v_Vuna_dCompiler_dIr_dValidate_dmaybeAlts = (fun (mc0 : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrAlt Base_dData_dMaybe.t_Base_dData_dMaybe_dMaybe) -> (match mc0 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__102) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__102, Base_dData_dList.C_Base_dData_dList_dList_Nil))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 337 "Vuna/Compiler/Ir/Validate.vuna"
let rec v_Vuna_dCompiler_dIr_dValidate_daltWork = (fun (mc0 : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrBinder Base_dData_dList.t_Base_dData_dList_dList) (mc1 : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrAlt Base_dData_dList.t_Base_dData_dList_dList) -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__103, dtb__104) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = ((Base_dData_dList.v_Base_dData_dList_dappend (Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirAltBindersOf dtb__103)) mc0); Base_dData_dPair.f_Base_dData_dPair_dPair_second = (Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirAltBodyOf dtb__103) }, ((v_Vuna_dCompiler_dIr_dValidate_daltWork mc0) dtb__104)))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 311 "Vuna/Compiler/Ir/Validate.vuna"
let v_Vuna_dCompiler_dIr_dValidate_dscopedChildren = (fun scope ir -> (match ir with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCtor (dtb__105, dtb__106, dtb__107, dtb__108) -> ((Base_dData_dList.v_Base_dData_dList_dmap (fun (a : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIr) -> { Base_dData_dPair.f_Base_dData_dPair_dPair_first = scope; Base_dData_dPair.f_Base_dData_dPair_dPair_second = a })) dtb__108)
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRecord (dtb__109, dtb__110, dtb__111) -> ((Base_dData_dList.v_Base_dData_dList_dmap (fun (p : (string, Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIr) Base_dData_dPair.t_Base_dData_dPair_dPair) -> { Base_dData_dPair.f_Base_dData_dPair_dPair_first = scope; Base_dData_dPair.f_Base_dData_dPair_dPair_second = (Base_dData_dPair.v_Base_dData_dPair_dsecondOf p) })) dtb__111)
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrProj (dtb__112, dtb__113, dtb__114, dtb__115) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = scope; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__112 }, Base_dData_dList.C_Base_dData_dList_dList_Nil))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRecUpd (dtb__116, dtb__117, dtb__118, dtb__119) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = scope; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__116 }, ((Base_dData_dList.v_Base_dData_dList_dmap (fun (p : (string, Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIr) Base_dData_dPair.t_Base_dData_dPair_dPair) -> { Base_dData_dPair.f_Base_dData_dPair_dPair_first = scope; Base_dData_dPair.f_Base_dData_dPair_dPair_second = (Base_dData_dPair.v_Base_dData_dPair_dsecondOf p) })) dtb__118)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRtApp (dtb__120, dtb__121) -> ((Base_dData_dList.v_Base_dData_dList_dmap (fun (a : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIr) -> { Base_dData_dPair.f_Base_dData_dPair_dPair_first = scope; Base_dData_dPair.f_Base_dData_dPair_dPair_second = a })) dtb__121)
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCast (dtb__122, dtb__123, dtb__124) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = scope; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__124 }, Base_dData_dList.C_Base_dData_dList_dList_Nil))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLet (dtb__125, dtb__126, dtb__127) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = scope; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__126 }, (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = ((Base_dData_dList.v_Base_dData_dList_dappend dtb__125) scope); Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__127 }, Base_dData_dList.C_Base_dData_dList_dList_Nil))))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLam (dtb__128, dtb__129, dtb__130) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = ((Base_dData_dList.v_Base_dData_dList_dappend dtb__128) scope); Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__130 }, Base_dData_dList.C_Base_dData_dList_dList_Nil))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (dtb__131, dtb__132, dtb__133) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = scope; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__132 }, (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = scope; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__133 }, Base_dData_dList.C_Base_dData_dList_dList_Nil))))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrIf (dtb__134, dtb__135, dtb__136) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = scope; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__134 }, (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = scope; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__135 }, (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = scope; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__136 }, Base_dData_dList.C_Base_dData_dList_dList_Nil))))))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCase (dtb__137, dtb__138, dtb__139, dtb__140) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = scope; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__139 }, ((v_Vuna_dCompiler_dIr_dValidate_daltWork scope) dtb__140)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrNatCase (dtb__141, dtb__142, dtb__143, dtb__144, dtb__145) -> ((Base_dData_dList.v_Base_dData_dList_dappend (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = scope; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__141 }, Base_dData_dList.C_Base_dData_dList_dList_Nil))) ((Base_dData_dList.v_Base_dData_dList_dappend ((v_Vuna_dCompiler_dIr_dValidate_daltWork scope) (v_Vuna_dCompiler_dIr_dValidate_dmaybeAlts dtb__143))) ((Base_dData_dList.v_Base_dData_dList_dappend ((v_Vuna_dCompiler_dIr_dValidate_daltWork scope) (v_Vuna_dCompiler_dIr_dValidate_dmaybeAlts dtb__144))) ((v_Vuna_dCompiler_dIr_dValidate_daltWork scope) (v_Vuna_dCompiler_dIr_dValidate_dmaybeAlts dtb__145)))))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrConcatMany (dtb__146) -> ((Base_dData_dList.v_Base_dData_dList_dmap (fun (a : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIr) -> { Base_dData_dPair.f_Base_dData_dPair_dPair_first = scope; Base_dData_dPair.f_Base_dData_dPair_dPair_second = a })) dtb__146)
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrEffThunk (dtb__147, dtb__148, dtb__149, dtb__150, dtb__151) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = scope; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__151 }, Base_dData_dList.C_Base_dData_dList_dList_Nil))
  | _ -> Base_dData_dList.C_Base_dData_dList_dList_Nil
))

# 122 "Vuna/Compiler/Ir/Validate.vuna"
let rec v_Vuna_dCompiler_dIr_dValidate_dcheckBinderTysWork = (fun fuel decls work -> (if (fuel <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "ir-binder-ty") else (match work with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (0))
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__152, dtb__153) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((v_Vuna_dCompiler_dIr_dValidate_dcheckNodeBinderTys decls) dtb__152)) (fun (_u : int) -> (((v_Vuna_dCompiler_dIr_dValidate_dcheckBinderTysWork (fuel - 1)) decls) ((Base_dData_dList.v_Base_dData_dList_dappend ((Base_dData_dList.v_Base_dData_dList_dmap Base_dData_dPair.v_Base_dData_dPair_dsecondOf) ((v_Vuna_dCompiler_dIr_dValidate_dscopedChildren Base_dData_dList.C_Base_dData_dList_dList_Nil) dtb__152))) dtb__153))))
  | _ -> failwith "DT: impossible branch"
)))

# 350 "Vuna/Compiler/Ir/Validate.vuna"
let v_Vuna_dCompiler_dIr_dValidate_dsameBName = (fun (mc0 : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrBName) (mc1 : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrBName) -> (match mc0 with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrBName_IrBWild -> (match mc1 with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrBName_IrBWild -> true
  | _ -> false
)
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrBName_IrBNat (dtb__154) -> (match mc1 with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrBName_IrBNat (dtb__155) -> (dtb__154 = dtb__155)
  | _ -> false
)
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrBName_IrBArm (dtb__156) -> (match mc1 with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrBName_IrBArm (dtb__157) -> (dtb__156 = dtb__157)
  | _ -> false
)
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrBName_IrBUser (dtb__158) -> (match mc1 with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrBName_IrBUser (dtb__159) -> (dtb__158 = dtb__159)
  | _ -> false
)
  | _ -> failwith "DT: impossible branch"
))

# 346 "Vuna/Compiler/Ir/Validate.vuna"
let v_Vuna_dCompiler_dIr_dValidate_dsameBinder = (fun b1 b2 -> (if (((Base_dTrait_dEq.v_Base_dTrait_dEq_d_x61__x61_ Base_dTrait_dEq.v_Eq_uBase_uData_uBool_uBool) (b1).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrBinder_irBinderErased) (b2).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrBinder_irBinderErased) then ((v_Vuna_dCompiler_dIr_dValidate_dsameBName (b1).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrBinder_irBinderName) (b2).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrBinder_irBinderName) else false))

# 342 "Vuna/Compiler/Ir/Validate.vuna"
let rec v_Vuna_dCompiler_dIr_dValidate_dmemBinder = (fun (mc0 : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrBinder) (mc1 : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrBinder Base_dData_dList.t_Base_dData_dList_dList) -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__160, dtb__161) -> (if ((v_Vuna_dCompiler_dIr_dValidate_dsameBinder mc0) dtb__160) then true else ((v_Vuna_dCompiler_dIr_dValidate_dmemBinder mc0) dtb__161))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 298 "Vuna/Compiler/Ir/Validate.vuna"
let rec v_Vuna_dCompiler_dIr_dValidate_dcheckScopedWork = (fun fuel work -> (if (fuel <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "ir-scope") else ((fun nd_uscrut2 -> (match nd_uscrut2 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__162, dtb__163) -> (match dtb__162 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__164; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__165 } -> (match dtb__165 with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrVar (dtb__166) -> (if (dtb__166).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrBinder_irBinderErased then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicInternal "erased binder reached runtime IR") else (if ((v_Vuna_dCompiler_dIr_dValidate_dmemBinder dtb__166) dtb__164) then ((v_Vuna_dCompiler_dIr_dValidate_dcheckScopedWork (fuel - 1)) dtb__163) else (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicInternal "IR variable references a binder outside its scope")))
  | _ -> ((v_Vuna_dCompiler_dIr_dValidate_dcheckScopedWork (fuel - 1)) ((Base_dData_dList.v_Base_dData_dList_dappend ((v_Vuna_dCompiler_dIr_dValidate_dscopedChildren dtb__164) dtb__165)) dtb__163))
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (0))
  | _ -> failwith "DT: impossible branch"
)) work)))

# 357 "Vuna/Compiler/Ir/Validate.vuna"
let rec v_Vuna_dCompiler_dIr_dValidate_dirSize = (fun ir -> (1 + (v_Vuna_dCompiler_dIr_dValidate_dirSizeChildren ir)))
# 360 "Vuna/Compiler/Ir/Validate.vuna"
and v_Vuna_dCompiler_dIr_dValidate_dirSizeChildren = (fun ir -> (match ir with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCtor (dtb__167, dtb__168, dtb__169, dtb__170) -> (v_Vuna_dCompiler_dIr_dValidate_dirSizeList dtb__170)
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRecord (dtb__171, dtb__172, dtb__173) -> (v_Vuna_dCompiler_dIr_dValidate_dirSizeFields dtb__173)
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrProj (dtb__174, dtb__175, dtb__176, dtb__177) -> (v_Vuna_dCompiler_dIr_dValidate_dirSize dtb__174)
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRecUpd (dtb__178, dtb__179, dtb__180, dtb__181) -> ((v_Vuna_dCompiler_dIr_dValidate_dirSize dtb__178) + (v_Vuna_dCompiler_dIr_dValidate_dirSizeFields dtb__180))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRtApp (dtb__182, dtb__183) -> (v_Vuna_dCompiler_dIr_dValidate_dirSizeList dtb__183)
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCast (dtb__184, dtb__185, dtb__186) -> (v_Vuna_dCompiler_dIr_dValidate_dirSize dtb__186)
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLet (dtb__187, dtb__188, dtb__189) -> ((v_Vuna_dCompiler_dIr_dValidate_dirSize dtb__188) + (v_Vuna_dCompiler_dIr_dValidate_dirSize dtb__189))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLam (dtb__190, dtb__191, dtb__192) -> (v_Vuna_dCompiler_dIr_dValidate_dirSize dtb__192)
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (dtb__193, dtb__194, dtb__195) -> ((v_Vuna_dCompiler_dIr_dValidate_dirSize dtb__194) + (v_Vuna_dCompiler_dIr_dValidate_dirSize dtb__195))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrIf (dtb__196, dtb__197, dtb__198) -> (((v_Vuna_dCompiler_dIr_dValidate_dirSize dtb__196) + (v_Vuna_dCompiler_dIr_dValidate_dirSize dtb__197)) + (v_Vuna_dCompiler_dIr_dValidate_dirSize dtb__198))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCase (dtb__199, dtb__200, dtb__201, dtb__202) -> ((v_Vuna_dCompiler_dIr_dValidate_dirSize dtb__201) + (v_Vuna_dCompiler_dIr_dValidate_dirSizeAlts dtb__202))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrNatCase (dtb__203, dtb__204, dtb__205, dtb__206, dtb__207) -> ((((v_Vuna_dCompiler_dIr_dValidate_dirSize dtb__203) + (v_Vuna_dCompiler_dIr_dValidate_dirSizeAlt dtb__205)) + (v_Vuna_dCompiler_dIr_dValidate_dirSizeAlt dtb__206)) + (v_Vuna_dCompiler_dIr_dValidate_dirSizeAlt dtb__207))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrConcatMany (dtb__208) -> (v_Vuna_dCompiler_dIr_dValidate_dirSizeList dtb__208)
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrEffThunk (dtb__209, dtb__210, dtb__211, dtb__212, dtb__213) -> (v_Vuna_dCompiler_dIr_dValidate_dirSize dtb__213)
  | _ -> 0
))
# 380 "Vuna/Compiler/Ir/Validate.vuna"
and v_Vuna_dCompiler_dIr_dValidate_dirSizeList = (fun (mc0 : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIr Base_dData_dList.t_Base_dData_dList_dList) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__214, dtb__215) -> ((v_Vuna_dCompiler_dIr_dValidate_dirSize dtb__214) + (v_Vuna_dCompiler_dIr_dValidate_dirSizeList dtb__215))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))
# 384 "Vuna/Compiler/Ir/Validate.vuna"
and v_Vuna_dCompiler_dIr_dValidate_dirSizeFields = (fun (mc0 : (string, Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIr) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__216, dtb__217) -> (match dtb__216 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__218; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__219 } -> ((v_Vuna_dCompiler_dIr_dValidate_dirSize dtb__219) + (v_Vuna_dCompiler_dIr_dValidate_dirSizeFields dtb__217))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))
# 388 "Vuna/Compiler/Ir/Validate.vuna"
and v_Vuna_dCompiler_dIr_dValidate_dirSizeAlts = (fun (mc0 : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrAlt Base_dData_dList.t_Base_dData_dList_dList) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__220, dtb__221) -> ((v_Vuna_dCompiler_dIr_dValidate_dirSize (Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirAltBodyOf dtb__220)) + (v_Vuna_dCompiler_dIr_dValidate_dirSizeAlts dtb__221))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))
# 392 "Vuna/Compiler/Ir/Validate.vuna"
and v_Vuna_dCompiler_dIr_dValidate_dirSizeAlt = (fun (mc0 : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrAlt Base_dData_dMaybe.t_Base_dData_dMaybe_dMaybe) -> (match mc0 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__222) -> (v_Vuna_dCompiler_dIr_dValidate_dirSize (Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirAltBodyOf dtb__222))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> 0
  | _ -> failwith "DT: impossible branch"
))

# 105 "Vuna/Compiler/Ir/Validate.vuna"
let rec v_Vuna_dCompiler_dIr_dValidate_dcheckBinderTys = (fun (mc0 : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrTyDecl Base_dData_dList.t_Base_dData_dList_dList) (mc1 : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrDef Base_dData_dList.t_Base_dData_dList_dList) -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__223, dtb__224) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((v_Vuna_dCompiler_dIr_dValidate_dcheckDefTy mc0) (Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirDefName dtb__223)) (Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirDefTy dtb__223))) (fun (_u : int) -> (match (Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirDefBody dtb__223) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> ((v_Vuna_dCompiler_dIr_dValidate_dcheckBinderTys mc0) dtb__224)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__225) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((v_Vuna_dCompiler_dIr_dValidate_dcheckBinderTysWork ((8 * (v_Vuna_dCompiler_dIr_dValidate_dirSize dtb__225)) + 64)) mc0) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__225, Base_dData_dList.C_Base_dData_dList_dList_Nil)))) (fun (_u : int) -> ((v_Vuna_dCompiler_dIr_dValidate_dcheckBinderTys mc0) dtb__224)))
  | _ -> failwith "DT: impossible branch"
)))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (0))
  | _ -> failwith "DT: impossible branch"
))

# 295 "Vuna/Compiler/Ir/Validate.vuna"
let v_Vuna_dCompiler_dIr_dValidate_dscopedFuelOf = (fun body -> ((8 * (v_Vuna_dCompiler_dIr_dValidate_dirSize body)) + 64))

# 285 "Vuna/Compiler/Ir/Validate.vuna"
let rec v_Vuna_dCompiler_dIr_dValidate_dcheckScopedDefs = (fun (mc0 : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrDef Base_dData_dList.t_Base_dData_dList_dList) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__226, dtb__227) -> (match (Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirDefBody dtb__226) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (v_Vuna_dCompiler_dIr_dValidate_dcheckScopedDefs dtb__227)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__228) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((v_Vuna_dCompiler_dIr_dValidate_dcheckScopedWork ((v_Vuna_dCompiler_dIr_dValidate_dscopedFuelOf dtb__228) + 1)) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = Base_dData_dList.C_Base_dData_dList_dList_Nil; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__228 }, Base_dData_dList.C_Base_dData_dList_dList_Nil)))) (fun (_u : int) -> (v_Vuna_dCompiler_dIr_dValidate_dcheckScopedDefs dtb__227)))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (0))
  | _ -> failwith "DT: impossible branch"
))

# 282 "Vuna/Compiler/Ir/Validate.vuna"
let v_Vuna_dCompiler_dIr_dValidate_dcheckScopedUnit = (fun u -> (v_Vuna_dCompiler_dIr_dValidate_dcheckScopedDefs ((Base_dData_dList.v_Base_dData_dList_dconcatMap Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirGroupDefs) (u).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrUnit_irUnitGroups)))

# 23 "Vuna/Compiler/Ir/Validate.vuna"
let v_Vuna_dCompiler_dIr_dValidate_dvalidateUnit = (fun u -> ((fun defs -> ((fun nameTbl -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (Vuna_dCompiler_dIr_dAnalysis.v_Vuna_dCompiler_dIr_dAnalysis_dcheckUniqueDefNames defs)) (fun (_u : int) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((v_Vuna_dCompiler_dIr_dValidate_dcheckGroupOrder (u).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrUnit_irUnitGroups) nameTbl)) (fun (_u : int) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (v_Vuna_dCompiler_dIr_dValidate_dcheckSymbolRefs (Vuna_dCompiler_dIr_dRuntime.v_Vuna_dCompiler_dIr_dRuntime_dirSymbolsOfUnit u))) (fun (_u : int) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (v_Vuna_dCompiler_dIr_dValidate_dcheckScopedUnit u)) (fun (_u : int) -> ((v_Vuna_dCompiler_dIr_dValidate_dcheckBinderTys (u).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrUnit_irUnitTyDecls) defs)))))))))) (Base_dContainer_dHashMap.v_Base_dContainer_dHashMap_dofNames ((Base_dData_dList.v_Base_dData_dList_dmap Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirDefName) defs)))) ((Base_dData_dList.v_Base_dData_dList_dconcatMap Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirGroupDefs) (u).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrUnit_irUnitGroups)))

# 87 "Vuna/Compiler/Ir/Validate.vuna"
let v_Vuna_dCompiler_dIr_dValidate_dvalidateProgram = (fun p -> ((fun u -> ((fun defs -> (match (u).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrUnit_irUnitEntry with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (v_Vuna_dCompiler_dIr_dValidate_dvalidateUnit u)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__229) -> (if ((Base_dData_dList.v_Base_dData_dList_dmemName (dtb__229).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrEntry_irEntryMain) ((Base_dData_dList.v_Base_dData_dList_dmap Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirDefName) defs)) then (v_Vuna_dCompiler_dIr_dValidate_dvalidateUnit u) else (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicInternal (String.concat "" ["IR entry references an undefined main: `"; (dtb__229).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrEntry_irEntryMain; "`"])))
  | _ -> failwith "DT: impossible branch"
)) ((Base_dData_dList.v_Base_dData_dList_dconcatMap Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirGroupDefs) (u).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrUnit_irUnitGroups))) (p).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrProgram_irProgUnit))
