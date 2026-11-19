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
let v_Vuna_dCompiler_dIr_dValidate_dfirstUnorderedDep = (fun (nameTbl : (string, bool) Base_dContainer_dHashMap.t_Base_dContainer_dHashMap_dHashMap) (visible : (string, bool) Base_dContainer_dHashMap.t_Base_dContainer_dHashMap_dHashMap) (defs : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrDef Base_dData_dList.t_Base_dData_dList_dList) -> (((v_Vuna_dCompiler_dIr_dValidate_dfirstUnorderedDepGo nameTbl) visible) defs))

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
let v_Vuna_dCompiler_dIr_dValidate_dcheckGroupOrder = (fun (groups : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrGroup Base_dData_dList.t_Base_dData_dList_dList) (nameTbl : (string, bool) Base_dContainer_dHashMap.t_Base_dContainer_dHashMap_dHashMap) -> (((v_Vuna_dCompiler_dIr_dValidate_dcheckGroupOrderGo groups) ((Base_dContainer_dHashMap.v_Base_dContainer_dHashMap_dfromList Base_dData_dString.v_Hashable_uString) Base_dData_dList.C_Base_dData_dList_dList_Nil)) nameTbl))

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

# 139 "Vuna/Compiler/Ir/Validate.vuna"
let rec v_Vuna_dCompiler_dIr_dValidate_dirTyArrowArity = (fun (mc0 : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrTy) -> (match mc0 with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyFun (dtb__12, dtb__13) -> (1 + (v_Vuna_dCompiler_dIr_dValidate_dirTyArrowArity dtb__13))
  | _ -> 0
))

# 121 "Vuna/Compiler/Ir/Validate.vuna"
let v_Vuna_dCompiler_dIr_dValidate_dcheckDefArityVsSig = (fun (d : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrDef) -> (match (Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirDefExtern d) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__14) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (0))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (match (Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirDefTy d) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (0))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__15) -> ((fun arrows -> (if (if ((Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirDefArity d) = 0) then true else (arrows = 0)) then (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (0)) else (if ((Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirDefArity d) <= arrows) then (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (0)) else (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicInternal (String.concat "" ["definition `"; (Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirDefName d); "` has "; (bi_strFromInt (Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirDefArity d)); " runtime parameters but its signature has "; (bi_strFromInt arrows)]))))) (v_Vuna_dCompiler_dIr_dValidate_dirTyArrowArity dtb__15))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 288 "Vuna/Compiler/Ir/Validate.vuna"
let rec v_Vuna_dCompiler_dIr_dValidate_dtyDeclArityOf = (fun (mc0 : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrTyDecl Base_dData_dList.t_Base_dData_dList_dList) (mc1 : string) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__16, dtb__17) -> (match dtb__16 with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTyDecl_IrUnboxedDecl (dtb__18, dtb__19, dtb__20) -> (if (dtb__18 = mc1) then (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__19)) else ((v_Vuna_dCompiler_dIr_dValidate_dtyDeclArityOf dtb__17) mc1))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTyDecl_IrRecordDecl (dtb__21, dtb__22, dtb__23, dtb__24) -> (if (dtb__21 = mc1) then (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__22)) else ((v_Vuna_dCompiler_dIr_dValidate_dtyDeclArityOf dtb__17) mc1))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTyDecl_IrVariantDecl (dtb__25, dtb__26, dtb__27) -> (if (dtb__25 = mc1) then (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__26)) else ((v_Vuna_dCompiler_dIr_dValidate_dtyDeclArityOf dtb__17) mc1))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 297 "Vuna/Compiler/Ir/Validate.vuna"
let rec v_Vuna_dCompiler_dIr_dValidate_dlistLength = (fun mc0 -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__28, dtb__29) -> (1 + (v_Vuna_dCompiler_dIr_dValidate_dlistLength dtb__29))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))

# 229 "Vuna/Compiler/Ir/Validate.vuna"
let rec v_Vuna_dCompiler_dIr_dValidate_dctorFieldsIn = (fun (mc0 : string) (mc1 : (string, Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrTy Base_dData_dList.t_Base_dData_dList_dList) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__30, dtb__31) -> (if ((Base_dData_dPair.v_Base_dData_dPair_dfirstOf dtb__30) = mc0) then (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ((v_Vuna_dCompiler_dIr_dValidate_dlistLength (Base_dData_dPair.v_Base_dData_dPair_dsecondOf dtb__30)))) else ((v_Vuna_dCompiler_dIr_dValidate_dctorFieldsIn mc0) dtb__31))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 219 "Vuna/Compiler/Ir/Validate.vuna"
let rec v_Vuna_dCompiler_dIr_dValidate_dctorFieldCountOf = (fun (mc0 : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrTyDecl Base_dData_dList.t_Base_dData_dList_dList) (mc1 : string) (mc2 : string) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__32, dtb__33) -> (match dtb__32 with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTyDecl_IrVariantDecl (dtb__34, dtb__35, dtb__36) -> (if (dtb__34 = mc1) then ((v_Vuna_dCompiler_dIr_dValidate_dctorFieldsIn mc2) dtb__36) else (((v_Vuna_dCompiler_dIr_dValidate_dctorFieldCountOf dtb__33) mc1) mc2))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTyDecl_IrRecordDecl (dtb__37, dtb__38, dtb__39, dtb__40) -> (if (dtb__37 = mc1) then (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ((v_Vuna_dCompiler_dIr_dValidate_dlistLength dtb__40))) else (((v_Vuna_dCompiler_dIr_dValidate_dctorFieldCountOf dtb__33) mc1) mc2))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTyDecl_IrUnboxedDecl (dtb__41, dtb__42, dtb__43) -> (if (dtb__41 = mc1) then (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (1)) else (((v_Vuna_dCompiler_dIr_dValidate_dctorFieldCountOf dtb__33) mc1) mc2))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 208 "Vuna/Compiler/Ir/Validate.vuna"
let v_Vuna_dCompiler_dIr_dValidate_dcheckCtorArity = (fun (decls : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrTyDecl Base_dData_dList.t_Base_dData_dList_dList) (family : string) (ctor : string) (nargs : int) -> (match (((v_Vuna_dCompiler_dIr_dValidate_dctorFieldCountOf decls) family) ctor) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__44) -> (if (nargs = dtb__44) then (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (0)) else (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicInternal (String.concat "" ["constructor `"; ctor; "` has "; (bi_strFromInt nargs); " runtime arguments, expected "; (bi_strFromInt dtb__44)])))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (0))
  | _ -> failwith "DT: impossible branch"
))

# 261 "Vuna/Compiler/Ir/Validate.vuna"
let rec v_Vuna_dCompiler_dIr_dValidate_dcheckTyArity = (fun (mc0 : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrTyDecl Base_dData_dList.t_Base_dData_dList_dList) (mc1 : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrTy) -> (match mc1 with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyData (dtb__45, dtb__46) -> (match ((v_Vuna_dCompiler_dIr_dValidate_dtyDeclArityOf mc0) dtb__45) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__47) -> (if ((v_Vuna_dCompiler_dIr_dValidate_dlistLength dtb__46) = dtb__47) then ((v_Vuna_dCompiler_dIr_dValidate_dcheckTyArityList mc0) dtb__46) else (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicInternal (String.concat "" ["binder type annotation has the wrong type argument count for `"; dtb__45; "` (expected "; (bi_strFromInt dtb__47); ", got "; (bi_strFromInt (v_Vuna_dCompiler_dIr_dValidate_dlistLength dtb__46)); ")"])))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> ((v_Vuna_dCompiler_dIr_dValidate_dcheckTyArityList mc0) dtb__46)
  | _ -> failwith "DT: impossible branch"
)
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyFun (dtb__48, dtb__49) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((v_Vuna_dCompiler_dIr_dValidate_dcheckTyArity mc0) dtb__48)) (fun (_u : int) -> ((v_Vuna_dCompiler_dIr_dValidate_dcheckTyArity mc0) dtb__49)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyRef (dtb__50) -> ((v_Vuna_dCompiler_dIr_dValidate_dcheckTyArity mc0) dtb__50)
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyArray (dtb__51) -> ((v_Vuna_dCompiler_dIr_dValidate_dcheckTyArity mc0) dtb__51)
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyOpaque -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (0))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyFloat -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (0))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyBool -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (0))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyStr -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (0))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyInt -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (0))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyVar (dtb__52) -> (if (dtb__52 >= 0) then (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (0)) else (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicInternal "negative runtime type parameter slot"))
  | _ -> failwith "DT: impossible branch"
))
# 283 "Vuna/Compiler/Ir/Validate.vuna"
and v_Vuna_dCompiler_dIr_dValidate_dcheckTyArityList = (fun (mc0 : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrTyDecl Base_dData_dList.t_Base_dData_dList_dList) (mc1 : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrTy Base_dData_dList.t_Base_dData_dList_dList) -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__53, dtb__54) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((v_Vuna_dCompiler_dIr_dValidate_dcheckTyArity mc0) dtb__53)) (fun (_u : int) -> ((v_Vuna_dCompiler_dIr_dValidate_dcheckTyArityList mc0) dtb__54)))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (0))
  | _ -> failwith "DT: impossible branch"
))

# 143 "Vuna/Compiler/Ir/Validate.vuna"
let v_Vuna_dCompiler_dIr_dValidate_dcheckDefTy = (fun (mc0 : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrTyDecl Base_dData_dList.t_Base_dData_dList_dList) (mc1 : string) (mc2 : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrTy Base_dData_dMaybe.t_Base_dData_dMaybe_dMaybe) -> (match mc2 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__55) -> (match ((v_Vuna_dCompiler_dIr_dValidate_dcheckTyArity mc0) dtb__55) with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__56) -> (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicInternal (String.concat "" ["definition `"; mc1; "` has an invalid runtime signature"]))
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__57) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__57))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (0))
  | _ -> failwith "DT: impossible branch"
))

# 204 "Vuna/Compiler/Ir/Validate.vuna"
let v_Vuna_dCompiler_dIr_dValidate_dcheckTyArityListM = (fun (mc0 : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrTyDecl Base_dData_dList.t_Base_dData_dList_dList) (mc1 : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrTy Base_dData_dList.t_Base_dData_dList_dList Base_dData_dMaybe.t_Base_dData_dMaybe_dMaybe) -> (match mc1 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__58) -> ((v_Vuna_dCompiler_dIr_dValidate_dcheckTyArityList mc0) dtb__58)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (0))
  | _ -> failwith "DT: impossible branch"
))

# 189 "Vuna/Compiler/Ir/Validate.vuna"
let v_Vuna_dCompiler_dIr_dValidate_dcheckCtorTys = (fun (decls : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrTyDecl Base_dData_dList.t_Base_dData_dList_dList) (family : string) (ctor : string) (tys : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrTy Base_dData_dList.t_Base_dData_dList_dList Base_dData_dMaybe.t_Base_dData_dMaybe_dMaybe) (nargs : int) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((v_Vuna_dCompiler_dIr_dValidate_dcheckTyArityListM decls) tys)) (fun (_u : int) -> ((fun typeArityOk -> (if typeArityOk then ((((v_Vuna_dCompiler_dIr_dValidate_dcheckCtorArity decls) family) ctor) nargs) else (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicInternal (String.concat "" ["constructor application has the wrong runtime type argument count for `"; family; "`"])))) (match ((v_Vuna_dCompiler_dIr_dValidate_dtyDeclArityOf decls) family) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__59) -> (match tys with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__60) -> ((v_Vuna_dCompiler_dIr_dValidate_dlistLength dtb__60) = dtb__59)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> true
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> true
  | _ -> failwith "DT: impossible branch"
)))))

# 234 "Vuna/Compiler/Ir/Validate.vuna"
let v_Vuna_dCompiler_dIr_dValidate_dcheckIrTyM = (fun (mc0 : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrTyDecl Base_dData_dList.t_Base_dData_dList_dList) (mc1 : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrTy Base_dData_dMaybe.t_Base_dData_dMaybe_dMaybe) -> (match mc1 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__61) -> ((v_Vuna_dCompiler_dIr_dValidate_dcheckTyArity mc0) dtb__61)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (0))
  | _ -> failwith "DT: impossible branch"
))

# 182 "Vuna/Compiler/Ir/Validate.vuna"
let v_Vuna_dCompiler_dIr_dValidate_dcheckAppTyM = (fun (mc0 : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrTyDecl Base_dData_dList.t_Base_dData_dList_dList) (mc1 : (Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrTy, Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrTy) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dMaybe.t_Base_dData_dMaybe_dMaybe) -> (match mc1 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__62) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((v_Vuna_dCompiler_dIr_dValidate_dcheckIrTyM mc0) (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ((Base_dData_dPair.v_Base_dData_dPair_dfirstOf dtb__62))))) (fun (_u : int) -> ((v_Vuna_dCompiler_dIr_dValidate_dcheckIrTyM mc0) (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ((Base_dData_dPair.v_Base_dData_dPair_dsecondOf dtb__62))))))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (0))
  | _ -> failwith "DT: impossible branch"
))

# 238 "Vuna/Compiler/Ir/Validate.vuna"
let rec v_Vuna_dCompiler_dIr_dValidate_dcheckBinderTysOf = (fun (mc0 : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrTyDecl Base_dData_dList.t_Base_dData_dList_dList) (mc1 : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrBinder Base_dData_dList.t_Base_dData_dList_dList) -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__63, dtb__64) -> (if (dtb__63).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrBinder_irBinderErased then (match (dtb__63).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrBinder_irBinderTy with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> ((v_Vuna_dCompiler_dIr_dValidate_dcheckBinderTysOf mc0) dtb__64)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__65) -> (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicInternal "erased binder carries a runtime type annotation")
  | _ -> failwith "DT: impossible branch"
) else (match (dtb__63).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrBinder_irBinderTy with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> ((v_Vuna_dCompiler_dIr_dValidate_dcheckBinderTysOf mc0) dtb__64)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__66) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((v_Vuna_dCompiler_dIr_dValidate_dcheckTyArity mc0) dtb__66)) (fun (_u : int) -> ((v_Vuna_dCompiler_dIr_dValidate_dcheckBinderTysOf mc0) dtb__64)))
  | _ -> failwith "DT: impossible branch"
))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (0))
  | _ -> failwith "DT: impossible branch"
))

# 250 "Vuna/Compiler/Ir/Validate.vuna"
let rec v_Vuna_dCompiler_dIr_dValidate_dcheckAltBinderTys = (fun (mc0 : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrTyDecl Base_dData_dList.t_Base_dData_dList_dList) (mc1 : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrAlt Base_dData_dList.t_Base_dData_dList_dList) -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__67, dtb__68) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((v_Vuna_dCompiler_dIr_dValidate_dcheckBinderTysOf mc0) (Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirAltBindersOf dtb__67))) (fun (_u : int) -> ((v_Vuna_dCompiler_dIr_dValidate_dcheckAltBinderTys mc0) dtb__68)))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (0))
  | _ -> failwith "DT: impossible branch"
))

# 257 "Vuna/Compiler/Ir/Validate.vuna"
let v_Vuna_dCompiler_dIr_dValidate_dcheckAltBinderTysM = (fun (mc0 : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrTyDecl Base_dData_dList.t_Base_dData_dList_dList) (mc1 : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrAlt Base_dData_dMaybe.t_Base_dData_dMaybe_dMaybe) -> (match mc1 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__69) -> ((v_Vuna_dCompiler_dIr_dValidate_dcheckBinderTysOf mc0) (Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirAltBindersOf dtb__69))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (0))
  | _ -> failwith "DT: impossible branch"
))

# 159 "Vuna/Compiler/Ir/Validate.vuna"
let v_Vuna_dCompiler_dIr_dValidate_dcheckNodeBinderTys = (fun (decls : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrTyDecl Base_dData_dList.t_Base_dData_dList_dList) (ir : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIr) -> (match ir with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLam (dtb__70, dtb__71, dtb__72) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((v_Vuna_dCompiler_dIr_dValidate_dcheckBinderTysOf decls) dtb__70)) (fun (_u : int) -> ((v_Vuna_dCompiler_dIr_dValidate_dcheckIrTyM decls) dtb__71)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLet (dtb__73, dtb__74, dtb__75) -> ((v_Vuna_dCompiler_dIr_dValidate_dcheckBinderTysOf decls) dtb__73)
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCase (dtb__76, dtb__77, dtb__78, dtb__79) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((v_Vuna_dCompiler_dIr_dValidate_dcheckIrTyM decls) dtb__76)) (fun (_u : int) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((v_Vuna_dCompiler_dIr_dValidate_dcheckIrTyM decls) dtb__77)) (fun (_u : int) -> ((v_Vuna_dCompiler_dIr_dValidate_dcheckAltBinderTys decls) dtb__79)))))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (dtb__80, dtb__81, dtb__82) -> ((v_Vuna_dCompiler_dIr_dValidate_dcheckAppTyM decls) dtb__80)
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCtor (dtb__83, dtb__84, dtb__85, dtb__86) -> (((((v_Vuna_dCompiler_dIr_dValidate_dcheckCtorTys decls) dtb__83) dtb__84) dtb__85) (v_Vuna_dCompiler_dIr_dValidate_dlistLength dtb__86))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRecord (dtb__87, dtb__88, dtb__89) -> ((v_Vuna_dCompiler_dIr_dValidate_dcheckIrTyM decls) dtb__88)
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrProj (dtb__90, dtb__91, dtb__92, dtb__93) -> ((v_Vuna_dCompiler_dIr_dValidate_dcheckIrTyM decls) dtb__93)
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRecUpd (dtb__94, dtb__95, dtb__96, dtb__97) -> ((v_Vuna_dCompiler_dIr_dValidate_dcheckIrTyM decls) dtb__97)
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrNatCase (dtb__98, dtb__99, dtb__100, dtb__101, dtb__102) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((v_Vuna_dCompiler_dIr_dValidate_dcheckAltBinderTysM decls) dtb__100)) (fun (_u : int) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((v_Vuna_dCompiler_dIr_dValidate_dcheckAltBinderTysM decls) dtb__101)) (fun (_u : int) -> ((v_Vuna_dCompiler_dIr_dValidate_dcheckAltBinderTysM decls) dtb__102)))))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCast (dtb__103, dtb__104, dtb__105) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((v_Vuna_dCompiler_dIr_dValidate_dcheckIrTyM decls) dtb__103)) (fun (_u : int) -> ((v_Vuna_dCompiler_dIr_dValidate_dcheckIrTyM decls) dtb__104)))
  | _ -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (0))
))

# 323 "Vuna/Compiler/Ir/Validate.vuna"
let v_Vuna_dCompiler_dIr_dValidate_dscopedFuelOf = (fun (body : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIr) -> ((8 * (Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirSize body)) + 64))

# 361 "Vuna/Compiler/Ir/Validate.vuna"
let v_Vuna_dCompiler_dIr_dValidate_dmaybeAlts = (fun (mc0 : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrAlt Base_dData_dMaybe.t_Base_dData_dMaybe_dMaybe) -> (match mc0 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__106) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__106, Base_dData_dList.C_Base_dData_dList_dList_Nil))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 365 "Vuna/Compiler/Ir/Validate.vuna"
let rec v_Vuna_dCompiler_dIr_dValidate_daltWork = (fun (mc0 : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrBinder Base_dData_dList.t_Base_dData_dList_dList) (mc1 : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrAlt Base_dData_dList.t_Base_dData_dList_dList) -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__107, dtb__108) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = ((Base_dData_dList.v_Base_dData_dList_dappend (Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirAltBindersOf dtb__107)) mc0); Base_dData_dPair.f_Base_dData_dPair_dPair_second = (Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirAltBodyOf dtb__107) }, ((v_Vuna_dCompiler_dIr_dValidate_daltWork mc0) dtb__108)))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 339 "Vuna/Compiler/Ir/Validate.vuna"
let v_Vuna_dCompiler_dIr_dValidate_dscopedChildren = (fun (scope : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrBinder Base_dData_dList.t_Base_dData_dList_dList) (ir : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIr) -> (match ir with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCtor (dtb__109, dtb__110, dtb__111, dtb__112) -> ((Base_dData_dList.v_Base_dData_dList_dmap (fun (a : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIr) -> { Base_dData_dPair.f_Base_dData_dPair_dPair_first = scope; Base_dData_dPair.f_Base_dData_dPair_dPair_second = a })) dtb__112)
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRecord (dtb__113, dtb__114, dtb__115) -> ((Base_dData_dList.v_Base_dData_dList_dmap (fun (p : (string, Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIr) Base_dData_dPair.t_Base_dData_dPair_dPair) -> { Base_dData_dPair.f_Base_dData_dPair_dPair_first = scope; Base_dData_dPair.f_Base_dData_dPair_dPair_second = (Base_dData_dPair.v_Base_dData_dPair_dsecondOf p) })) dtb__115)
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrProj (dtb__116, dtb__117, dtb__118, dtb__119) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = scope; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__116 }, Base_dData_dList.C_Base_dData_dList_dList_Nil))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRecUpd (dtb__120, dtb__121, dtb__122, dtb__123) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = scope; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__120 }, ((Base_dData_dList.v_Base_dData_dList_dmap (fun (p : (string, Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIr) Base_dData_dPair.t_Base_dData_dPair_dPair) -> { Base_dData_dPair.f_Base_dData_dPair_dPair_first = scope; Base_dData_dPair.f_Base_dData_dPair_dPair_second = (Base_dData_dPair.v_Base_dData_dPair_dsecondOf p) })) dtb__122)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRtApp (dtb__124, dtb__125) -> ((Base_dData_dList.v_Base_dData_dList_dmap (fun (a : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIr) -> { Base_dData_dPair.f_Base_dData_dPair_dPair_first = scope; Base_dData_dPair.f_Base_dData_dPair_dPair_second = a })) dtb__125)
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCast (dtb__126, dtb__127, dtb__128) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = scope; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__128 }, Base_dData_dList.C_Base_dData_dList_dList_Nil))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLet (dtb__129, dtb__130, dtb__131) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = scope; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__130 }, (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = ((Base_dData_dList.v_Base_dData_dList_dappend dtb__129) scope); Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__131 }, Base_dData_dList.C_Base_dData_dList_dList_Nil))))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLam (dtb__132, dtb__133, dtb__134) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = ((Base_dData_dList.v_Base_dData_dList_dappend dtb__132) scope); Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__134 }, Base_dData_dList.C_Base_dData_dList_dList_Nil))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (dtb__135, dtb__136, dtb__137) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = scope; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__136 }, (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = scope; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__137 }, Base_dData_dList.C_Base_dData_dList_dList_Nil))))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrIf (dtb__138, dtb__139, dtb__140) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = scope; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__138 }, (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = scope; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__139 }, (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = scope; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__140 }, Base_dData_dList.C_Base_dData_dList_dList_Nil))))))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCase (dtb__141, dtb__142, dtb__143, dtb__144) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = scope; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__143 }, ((v_Vuna_dCompiler_dIr_dValidate_daltWork scope) dtb__144)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrNatCase (dtb__145, dtb__146, dtb__147, dtb__148, dtb__149) -> ((Base_dData_dList.v_Base_dData_dList_dappend (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = scope; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__145 }, Base_dData_dList.C_Base_dData_dList_dList_Nil))) ((Base_dData_dList.v_Base_dData_dList_dappend ((v_Vuna_dCompiler_dIr_dValidate_daltWork scope) (v_Vuna_dCompiler_dIr_dValidate_dmaybeAlts dtb__147))) ((Base_dData_dList.v_Base_dData_dList_dappend ((v_Vuna_dCompiler_dIr_dValidate_daltWork scope) (v_Vuna_dCompiler_dIr_dValidate_dmaybeAlts dtb__148))) ((v_Vuna_dCompiler_dIr_dValidate_daltWork scope) (v_Vuna_dCompiler_dIr_dValidate_dmaybeAlts dtb__149)))))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrConcatMany (dtb__150) -> ((Base_dData_dList.v_Base_dData_dList_dmap (fun (a : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIr) -> { Base_dData_dPair.f_Base_dData_dPair_dPair_first = scope; Base_dData_dPair.f_Base_dData_dPair_dPair_second = a })) dtb__150)
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrEffThunk (dtb__151, dtb__152, dtb__153, dtb__154, dtb__155) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = scope; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__155 }, Base_dData_dList.C_Base_dData_dList_dList_Nil))
  | _ -> Base_dData_dList.C_Base_dData_dList_dList_Nil
))

# 150 "Vuna/Compiler/Ir/Validate.vuna"
let rec v_Vuna_dCompiler_dIr_dValidate_dcheckBinderTysWork = (fun (fuel : int) (decls : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrTyDecl Base_dData_dList.t_Base_dData_dList_dList) (work : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIr Base_dData_dList.t_Base_dData_dList_dList) -> (if (fuel <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "ir-binder-ty") else (match work with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (0))
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__156, dtb__157) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((v_Vuna_dCompiler_dIr_dValidate_dcheckNodeBinderTys decls) dtb__156)) (fun (_u : int) -> (((v_Vuna_dCompiler_dIr_dValidate_dcheckBinderTysWork (fuel - 1)) decls) ((Base_dData_dList.v_Base_dData_dList_dappend ((Base_dData_dList.v_Base_dData_dList_dmap Base_dData_dPair.v_Base_dData_dPair_dsecondOf) ((v_Vuna_dCompiler_dIr_dValidate_dscopedChildren Base_dData_dList.C_Base_dData_dList_dList_Nil) dtb__156))) dtb__157))))
  | _ -> failwith "DT: impossible branch"
)))

# 105 "Vuna/Compiler/Ir/Validate.vuna"
let rec v_Vuna_dCompiler_dIr_dValidate_dcheckBinderTys = (fun (mc0 : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrTyDecl Base_dData_dList.t_Base_dData_dList_dList) (mc1 : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrDef Base_dData_dList.t_Base_dData_dList_dList) -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__158, dtb__159) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((v_Vuna_dCompiler_dIr_dValidate_dcheckDefTy mc0) (Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirDefName dtb__158)) (Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirDefTy dtb__158))) (fun (_u : int) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (v_Vuna_dCompiler_dIr_dValidate_dcheckDefArityVsSig dtb__158)) (fun (_u : int) -> (match (Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirDefBody dtb__158) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> ((v_Vuna_dCompiler_dIr_dValidate_dcheckBinderTys mc0) dtb__159)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__160) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((v_Vuna_dCompiler_dIr_dValidate_dcheckBinderTysWork ((8 * (Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirSize dtb__160)) + 64)) mc0) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__160, Base_dData_dList.C_Base_dData_dList_dList_Nil)))) (fun (_u : int) -> ((v_Vuna_dCompiler_dIr_dValidate_dcheckBinderTys mc0) dtb__159)))
  | _ -> failwith "DT: impossible branch"
)))))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (0))
  | _ -> failwith "DT: impossible branch"
))

# 378 "Vuna/Compiler/Ir/Validate.vuna"
let v_Vuna_dCompiler_dIr_dValidate_dsameBName = (fun (mc0 : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrBName) (mc1 : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrBName) -> (match mc0 with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrBName_IrBWild -> (match mc1 with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrBName_IrBWild -> true
  | _ -> false
)
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrBName_IrBNat (dtb__161) -> (match mc1 with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrBName_IrBNat (dtb__162) -> (dtb__161 = dtb__162)
  | _ -> false
)
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrBName_IrBArm (dtb__163) -> (match mc1 with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrBName_IrBArm (dtb__164) -> (dtb__163 = dtb__164)
  | _ -> false
)
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrBName_IrBUser (dtb__165) -> (match mc1 with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrBName_IrBUser (dtb__166) -> (dtb__165 = dtb__166)
  | _ -> false
)
  | _ -> failwith "DT: impossible branch"
))

# 374 "Vuna/Compiler/Ir/Validate.vuna"
let v_Vuna_dCompiler_dIr_dValidate_dsameBinder = (fun (b1 : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrBinder) (b2 : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrBinder) -> (if (((Base_dTrait_dEq.v_Base_dTrait_dEq_d_x61__x61_ Base_dTrait_dEq.v_Eq_uBase_uData_uBool_uBool) (b1).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrBinder_irBinderErased) (b2).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrBinder_irBinderErased) then ((v_Vuna_dCompiler_dIr_dValidate_dsameBName (b1).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrBinder_irBinderName) (b2).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrBinder_irBinderName) else false))

# 370 "Vuna/Compiler/Ir/Validate.vuna"
let rec v_Vuna_dCompiler_dIr_dValidate_dmemBinder = (fun (mc0 : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrBinder) (mc1 : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrBinder Base_dData_dList.t_Base_dData_dList_dList) -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__167, dtb__168) -> (if ((v_Vuna_dCompiler_dIr_dValidate_dsameBinder mc0) dtb__167) then true else ((v_Vuna_dCompiler_dIr_dValidate_dmemBinder mc0) dtb__168))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 326 "Vuna/Compiler/Ir/Validate.vuna"
let rec v_Vuna_dCompiler_dIr_dValidate_dcheckScopedWork = (fun (fuel : int) (work : (Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrBinder Base_dData_dList.t_Base_dData_dList_dList, Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIr) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) -> (if (fuel <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "ir-scope") else ((fun nd_uscrut2 -> (match nd_uscrut2 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__169, dtb__170) -> (match dtb__169 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__171; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__172 } -> (match dtb__172 with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrVar (dtb__173) -> (if (dtb__173).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrBinder_irBinderErased then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicInternal "erased binder reached runtime IR") else (if ((v_Vuna_dCompiler_dIr_dValidate_dmemBinder dtb__173) dtb__171) then ((v_Vuna_dCompiler_dIr_dValidate_dcheckScopedWork (fuel - 1)) dtb__170) else (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicInternal "IR variable references a binder outside its scope")))
  | _ -> ((v_Vuna_dCompiler_dIr_dValidate_dcheckScopedWork (fuel - 1)) ((Base_dData_dList.v_Base_dData_dList_dappend ((v_Vuna_dCompiler_dIr_dValidate_dscopedChildren dtb__171) dtb__172)) dtb__170))
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (0))
  | _ -> failwith "DT: impossible branch"
)) work)))

# 313 "Vuna/Compiler/Ir/Validate.vuna"
let rec v_Vuna_dCompiler_dIr_dValidate_dcheckScopedDefs = (fun (mc0 : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrDef Base_dData_dList.t_Base_dData_dList_dList) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__174, dtb__175) -> (match (Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirDefBody dtb__174) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (v_Vuna_dCompiler_dIr_dValidate_dcheckScopedDefs dtb__175)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__176) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((v_Vuna_dCompiler_dIr_dValidate_dcheckScopedWork ((v_Vuna_dCompiler_dIr_dValidate_dscopedFuelOf dtb__176) + 1)) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = Base_dData_dList.C_Base_dData_dList_dList_Nil; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__176 }, Base_dData_dList.C_Base_dData_dList_dList_Nil)))) (fun (_u : int) -> (v_Vuna_dCompiler_dIr_dValidate_dcheckScopedDefs dtb__175)))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (0))
  | _ -> failwith "DT: impossible branch"
))

# 310 "Vuna/Compiler/Ir/Validate.vuna"
let v_Vuna_dCompiler_dIr_dValidate_dcheckScopedUnit = (fun (u : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrUnit) -> (v_Vuna_dCompiler_dIr_dValidate_dcheckScopedDefs ((Base_dData_dList.v_Base_dData_dList_dconcatMap Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirGroupDefs) (u).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrUnit_irUnitGroups)))

# 23 "Vuna/Compiler/Ir/Validate.vuna"
let v_Vuna_dCompiler_dIr_dValidate_dvalidateUnit = (fun (u : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrUnit) -> ((fun defs -> ((fun nameTbl -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (Vuna_dCompiler_dIr_dAnalysis.v_Vuna_dCompiler_dIr_dAnalysis_dcheckUniqueDefNames defs)) (fun (_u : int) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((v_Vuna_dCompiler_dIr_dValidate_dcheckGroupOrder (u).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrUnit_irUnitGroups) nameTbl)) (fun (_u : int) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (v_Vuna_dCompiler_dIr_dValidate_dcheckSymbolRefs (Vuna_dCompiler_dIr_dRuntime.v_Vuna_dCompiler_dIr_dRuntime_dirSymbolsOfUnit u))) (fun (_u : int) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (v_Vuna_dCompiler_dIr_dValidate_dcheckScopedUnit u)) (fun (_u : int) -> ((v_Vuna_dCompiler_dIr_dValidate_dcheckBinderTys (u).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrUnit_irUnitTyDecls) defs)))))))))) (Base_dContainer_dHashMap.v_Base_dContainer_dHashMap_dofNames ((Base_dData_dList.v_Base_dData_dList_dmap Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirDefName) defs)))) ((Base_dData_dList.v_Base_dData_dList_dconcatMap Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirGroupDefs) (u).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrUnit_irUnitGroups)))

# 87 "Vuna/Compiler/Ir/Validate.vuna"
let v_Vuna_dCompiler_dIr_dValidate_dvalidateProgram = (fun (p : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrProgram) -> ((fun u -> ((fun defs -> (match (u).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrUnit_irUnitEntry with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (v_Vuna_dCompiler_dIr_dValidate_dvalidateUnit u)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__177) -> (if ((Base_dData_dList.v_Base_dData_dList_dmemName (dtb__177).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrEntry_irEntryMain) ((Base_dData_dList.v_Base_dData_dList_dmap Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirDefName) defs)) then (v_Vuna_dCompiler_dIr_dValidate_dvalidateUnit u) else (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicInternal (String.concat "" ["IR entry references an undefined main: `"; (dtb__177).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrEntry_irEntryMain; "`"])))
  | _ -> failwith "DT: impossible branch"
)) ((Base_dData_dList.v_Base_dData_dList_dconcatMap Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirGroupDefs) (u).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrUnit_irUnitGroups))) (p).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrProgram_irProgUnit))
