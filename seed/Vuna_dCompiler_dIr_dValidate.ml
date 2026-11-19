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

# 140 "Vuna/Compiler/Ir/Validate.vuna"
let rec v_Vuna_dCompiler_dIr_dValidate_dirTyArrowArity = (fun (mc0 : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrTy) -> (match mc0 with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyFun (dtb__12, dtb__13) -> (1 + (v_Vuna_dCompiler_dIr_dValidate_dirTyArrowArity dtb__13))
  | _ -> 0
))

# 122 "Vuna/Compiler/Ir/Validate.vuna"
let v_Vuna_dCompiler_dIr_dValidate_dcheckDefArityVsSig = (fun (d : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrDef) -> (match (Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirDefExtern d) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__14) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (0))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (match (Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirDefTy d) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (0))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__15) -> ((fun arrows -> (if (if ((Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirDefArity d) = 0) then true else (arrows = 0)) then (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (0)) else (if ((Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirDefArity d) <= arrows) then (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (0)) else (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicInternal (String.concat "" ["definition `"; (Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirDefName d); "` has "; (bi_strFromInt (Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirDefArity d)); " runtime parameters but its signature has "; (bi_strFromInt arrows)]))))) (v_Vuna_dCompiler_dIr_dValidate_dirTyArrowArity dtb__15))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 223 "Vuna/Compiler/Ir/Validate.vuna"
let rec v_Vuna_dCompiler_dIr_dValidate_dcountKeptFlags = (fun (mc0 : bool Base_dData_dList.t_Base_dData_dList_dList) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__16, dtb__17) -> (if dtb__16 then (1 + (v_Vuna_dCompiler_dIr_dValidate_dcountKeptFlags dtb__17)) else (v_Vuna_dCompiler_dIr_dValidate_dcountKeptFlags dtb__17))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))

# 211 "Vuna/Compiler/Ir/Validate.vuna"
let v_Vuna_dCompiler_dIr_dValidate_dcheckCtorArity = (fun (shared : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrShared) (family : string) (ctor : string) (nargs : int) -> ((fun nd_uscrut4 -> (match nd_uscrut4 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__18) -> (match dtb__18 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__19; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__20 } -> (if (dtb__19 = family) then ((fun n -> (if (nargs = n) then (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (0)) else (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicInternal (String.concat "" ["constructor `"; ctor; "` has "; (bi_strFromInt nargs); " runtime arguments, expected "; (bi_strFromInt n)])))) (v_Vuna_dCompiler_dIr_dValidate_dcountKeptFlags dtb__20)) else (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicInternal (String.concat "" ["constructor `"; ctor; "` belongs to family `"; dtb__19; "`, not `"; family; "`"])))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicInternal (String.concat "" ["IR references an undeclared constructor: `"; ctor; "`"]))
  | _ -> failwith "DT: impossible branch"
)) ((Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirSharedCtorShapeOf ctor) (shared).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrShared_irSharedCtorShapes)))

# 318 "Vuna/Compiler/Ir/Validate.vuna"
let rec v_Vuna_dCompiler_dIr_dValidate_dtyDeclArityOf = (fun (mc0 : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrTyDecl Base_dData_dList.t_Base_dData_dList_dList) (mc1 : string) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__21, dtb__22) -> (match dtb__21 with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTyDecl_IrUnboxedDecl (dtb__23, dtb__24, dtb__25) -> (if (dtb__23 = mc1) then (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__24)) else ((v_Vuna_dCompiler_dIr_dValidate_dtyDeclArityOf dtb__22) mc1))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTyDecl_IrRecordDecl (dtb__26, dtb__27, dtb__28, dtb__29) -> (if (dtb__26 = mc1) then (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__27)) else ((v_Vuna_dCompiler_dIr_dValidate_dtyDeclArityOf dtb__22) mc1))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTyDecl_IrVariantDecl (dtb__30, dtb__31, dtb__32) -> (if (dtb__30 = mc1) then (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__31)) else ((v_Vuna_dCompiler_dIr_dValidate_dtyDeclArityOf dtb__22) mc1))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 327 "Vuna/Compiler/Ir/Validate.vuna"
let rec v_Vuna_dCompiler_dIr_dValidate_dlistLength = (fun mc0 -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__33, dtb__34) -> (1 + (v_Vuna_dCompiler_dIr_dValidate_dlistLength dtb__34))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))

# 259 "Vuna/Compiler/Ir/Validate.vuna"
let rec v_Vuna_dCompiler_dIr_dValidate_dcheckTyArityIn = (fun (mc0 : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrTyDecl Base_dData_dList.t_Base_dData_dList_dList) (mc1 : int Base_dData_dMaybe.t_Base_dData_dMaybe_dMaybe) (mc2 : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrTy) -> (match mc2 with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyData (dtb__35, dtb__36) -> (match ((v_Vuna_dCompiler_dIr_dValidate_dtyDeclArityOf mc0) dtb__35) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__37) -> (if ((v_Vuna_dCompiler_dIr_dValidate_dlistLength dtb__36) = dtb__37) then (((v_Vuna_dCompiler_dIr_dValidate_dcheckTyArityListIn mc0) mc1) dtb__36) else (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicInternal (String.concat "" ["binder type annotation has the wrong type argument count for `"; dtb__35; "` (expected "; (bi_strFromInt dtb__37); ", got "; (bi_strFromInt (v_Vuna_dCompiler_dIr_dValidate_dlistLength dtb__36)); ")"])))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (((v_Vuna_dCompiler_dIr_dValidate_dcheckTyArityListIn mc0) mc1) dtb__36)
  | _ -> failwith "DT: impossible branch"
)
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyFun (dtb__38, dtb__39) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((v_Vuna_dCompiler_dIr_dValidate_dcheckTyArityIn mc0) mc1) dtb__38)) (fun (_u : int) -> (((v_Vuna_dCompiler_dIr_dValidate_dcheckTyArityIn mc0) mc1) dtb__39)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyRef (dtb__40) -> (((v_Vuna_dCompiler_dIr_dValidate_dcheckTyArityIn mc0) mc1) dtb__40)
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyArray (dtb__41) -> (((v_Vuna_dCompiler_dIr_dValidate_dcheckTyArityIn mc0) mc1) dtb__41)
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyOpaque -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (0))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyFloat -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (0))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyBool -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (0))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyStr -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (0))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyInt -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (0))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyVar (dtb__42) -> (if (dtb__42 < 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicInternal "negative runtime type parameter slot") else (match mc1 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (0))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__43) -> (if (dtb__42 < dtb__43) then (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (0)) else (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicInternal (String.concat "" ["runtime type parameter slot "; (bi_strFromInt dtb__42); " is out of range (declaration has "; (bi_strFromInt dtb__43); " type parameters)"])))
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
))
# 289 "Vuna/Compiler/Ir/Validate.vuna"
and v_Vuna_dCompiler_dIr_dValidate_dcheckTyArityListIn = (fun (mc0 : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrTyDecl Base_dData_dList.t_Base_dData_dList_dList) (mc1 : int Base_dData_dMaybe.t_Base_dData_dMaybe_dMaybe) (mc2 : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrTy Base_dData_dList.t_Base_dData_dList_dList) -> (match mc2 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__44, dtb__45) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((v_Vuna_dCompiler_dIr_dValidate_dcheckTyArityIn mc0) mc1) dtb__44)) (fun (_u : int) -> (((v_Vuna_dCompiler_dIr_dValidate_dcheckTyArityListIn mc0) mc1) dtb__45)))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (0))
  | _ -> failwith "DT: impossible branch"
))

# 254 "Vuna/Compiler/Ir/Validate.vuna"
let v_Vuna_dCompiler_dIr_dValidate_dcheckTyArity = (fun (decls : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrTyDecl Base_dData_dList.t_Base_dData_dList_dList) (ty : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrTy) -> (((v_Vuna_dCompiler_dIr_dValidate_dcheckTyArityIn decls) Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing) ty))

# 144 "Vuna/Compiler/Ir/Validate.vuna"
let v_Vuna_dCompiler_dIr_dValidate_dcheckDefTy = (fun (mc0 : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrTyDecl Base_dData_dList.t_Base_dData_dList_dList) (mc1 : string) (mc2 : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrTy Base_dData_dMaybe.t_Base_dData_dMaybe_dMaybe) -> (match mc2 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__46) -> (match ((v_Vuna_dCompiler_dIr_dValidate_dcheckTyArity mc0) dtb__46) with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__47) -> (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicInternal (String.concat "" ["definition `"; mc1; "` has an invalid runtime signature"]))
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__48) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__48))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (0))
  | _ -> failwith "DT: impossible branch"
))

# 227 "Vuna/Compiler/Ir/Validate.vuna"
let v_Vuna_dCompiler_dIr_dValidate_dcheckIrTyM = (fun (mc0 : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrTyDecl Base_dData_dList.t_Base_dData_dList_dList) (mc1 : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrTy Base_dData_dMaybe.t_Base_dData_dMaybe_dMaybe) -> (match mc1 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__49) -> ((v_Vuna_dCompiler_dIr_dValidate_dcheckTyArity mc0) dtb__49)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (0))
  | _ -> failwith "DT: impossible branch"
))

# 183 "Vuna/Compiler/Ir/Validate.vuna"
let v_Vuna_dCompiler_dIr_dValidate_dcheckAppTyM = (fun (mc0 : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrTyDecl Base_dData_dList.t_Base_dData_dList_dList) (mc1 : (Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrTy, Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrTy) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dMaybe.t_Base_dData_dMaybe_dMaybe) -> (match mc1 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__50) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((v_Vuna_dCompiler_dIr_dValidate_dcheckIrTyM mc0) (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ((Base_dData_dPair.v_Base_dData_dPair_dfirstOf dtb__50))))) (fun (_u : int) -> ((v_Vuna_dCompiler_dIr_dValidate_dcheckIrTyM mc0) (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ((Base_dData_dPair.v_Base_dData_dPair_dsecondOf dtb__50))))))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (0))
  | _ -> failwith "DT: impossible branch"
))

# 231 "Vuna/Compiler/Ir/Validate.vuna"
let rec v_Vuna_dCompiler_dIr_dValidate_dcheckBinderTysOf = (fun (mc0 : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrTyDecl Base_dData_dList.t_Base_dData_dList_dList) (mc1 : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrBinder Base_dData_dList.t_Base_dData_dList_dList) -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__51, dtb__52) -> (if (dtb__51).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrBinder_irBinderErased then (match (dtb__51).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrBinder_irBinderTy with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> ((v_Vuna_dCompiler_dIr_dValidate_dcheckBinderTysOf mc0) dtb__52)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__53) -> (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicInternal "erased binder carries a runtime type annotation")
  | _ -> failwith "DT: impossible branch"
) else (match (dtb__51).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrBinder_irBinderTy with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> ((v_Vuna_dCompiler_dIr_dValidate_dcheckBinderTysOf mc0) dtb__52)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__54) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((v_Vuna_dCompiler_dIr_dValidate_dcheckTyArity mc0) dtb__54)) (fun (_u : int) -> ((v_Vuna_dCompiler_dIr_dValidate_dcheckBinderTysOf mc0) dtb__52)))
  | _ -> failwith "DT: impossible branch"
))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (0))
  | _ -> failwith "DT: impossible branch"
))

# 243 "Vuna/Compiler/Ir/Validate.vuna"
let rec v_Vuna_dCompiler_dIr_dValidate_dcheckAltBinderTys = (fun (mc0 : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrTyDecl Base_dData_dList.t_Base_dData_dList_dList) (mc1 : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrAlt Base_dData_dList.t_Base_dData_dList_dList) -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__55, dtb__56) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((v_Vuna_dCompiler_dIr_dValidate_dcheckBinderTysOf mc0) (Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirAltBindersOf dtb__55))) (fun (_u : int) -> ((v_Vuna_dCompiler_dIr_dValidate_dcheckAltBinderTys mc0) dtb__56)))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (0))
  | _ -> failwith "DT: impossible branch"
))

# 250 "Vuna/Compiler/Ir/Validate.vuna"
let v_Vuna_dCompiler_dIr_dValidate_dcheckAltBinderTysM = (fun (mc0 : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrTyDecl Base_dData_dList.t_Base_dData_dList_dList) (mc1 : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrAlt Base_dData_dMaybe.t_Base_dData_dMaybe_dMaybe) -> (match mc1 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__57) -> ((v_Vuna_dCompiler_dIr_dValidate_dcheckBinderTysOf mc0) (Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirAltBindersOf dtb__57))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (0))
  | _ -> failwith "DT: impossible branch"
))

# 286 "Vuna/Compiler/Ir/Validate.vuna"
let v_Vuna_dCompiler_dIr_dValidate_dcheckTyArityList = (fun (decls : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrTyDecl Base_dData_dList.t_Base_dData_dList_dList) (tys : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrTy Base_dData_dList.t_Base_dData_dList_dList) -> (((v_Vuna_dCompiler_dIr_dValidate_dcheckTyArityListIn decls) Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing) tys))

# 205 "Vuna/Compiler/Ir/Validate.vuna"
let v_Vuna_dCompiler_dIr_dValidate_dcheckTyArityListM = (fun (mc0 : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrTyDecl Base_dData_dList.t_Base_dData_dList_dList) (mc1 : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrTy Base_dData_dList.t_Base_dData_dList_dList Base_dData_dMaybe.t_Base_dData_dMaybe_dMaybe) -> (match mc1 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__58) -> ((v_Vuna_dCompiler_dIr_dValidate_dcheckTyArityList mc0) dtb__58)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (0))
  | _ -> failwith "DT: impossible branch"
))

# 190 "Vuna/Compiler/Ir/Validate.vuna"
let v_Vuna_dCompiler_dIr_dValidate_dcheckCtorTys = (fun (shared : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrShared) (decls : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrTyDecl Base_dData_dList.t_Base_dData_dList_dList) (family : string) (ctor : string) (tys : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrTy Base_dData_dList.t_Base_dData_dList_dList Base_dData_dMaybe.t_Base_dData_dMaybe_dMaybe) (nargs : int) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((v_Vuna_dCompiler_dIr_dValidate_dcheckTyArityListM decls) tys)) (fun (_u : int) -> ((fun typeArityOk -> (if typeArityOk then ((((v_Vuna_dCompiler_dIr_dValidate_dcheckCtorArity shared) family) ctor) nargs) else (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicInternal (String.concat "" ["constructor application has the wrong runtime type argument count for `"; family; "`"])))) (match ((v_Vuna_dCompiler_dIr_dValidate_dtyDeclArityOf decls) family) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__59) -> (match tys with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__60) -> ((v_Vuna_dCompiler_dIr_dValidate_dlistLength dtb__60) = dtb__59)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> true
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> true
  | _ -> failwith "DT: impossible branch"
)))))

# 160 "Vuna/Compiler/Ir/Validate.vuna"
let v_Vuna_dCompiler_dIr_dValidate_dcheckNodeBinderTys = (fun (shared : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrShared) (decls : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrTyDecl Base_dData_dList.t_Base_dData_dList_dList) (ir : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIr) -> (match ir with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLam (dtb__61, dtb__62, dtb__63) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((v_Vuna_dCompiler_dIr_dValidate_dcheckBinderTysOf decls) dtb__61)) (fun (_u : int) -> ((v_Vuna_dCompiler_dIr_dValidate_dcheckIrTyM decls) dtb__62)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLet (dtb__64, dtb__65, dtb__66) -> ((v_Vuna_dCompiler_dIr_dValidate_dcheckBinderTysOf decls) dtb__64)
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCase (dtb__67, dtb__68, dtb__69, dtb__70) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((v_Vuna_dCompiler_dIr_dValidate_dcheckIrTyM decls) dtb__67)) (fun (_u : int) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((v_Vuna_dCompiler_dIr_dValidate_dcheckIrTyM decls) dtb__68)) (fun (_u : int) -> ((v_Vuna_dCompiler_dIr_dValidate_dcheckAltBinderTys decls) dtb__70)))))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (dtb__71, dtb__72, dtb__73) -> ((v_Vuna_dCompiler_dIr_dValidate_dcheckAppTyM decls) dtb__71)
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCtor (dtb__74, dtb__75, dtb__76, dtb__77) -> ((((((v_Vuna_dCompiler_dIr_dValidate_dcheckCtorTys shared) decls) dtb__74) dtb__75) dtb__76) (v_Vuna_dCompiler_dIr_dValidate_dlistLength dtb__77))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRecord (dtb__78, dtb__79, dtb__80) -> ((v_Vuna_dCompiler_dIr_dValidate_dcheckIrTyM decls) dtb__79)
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrProj (dtb__81, dtb__82, dtb__83, dtb__84) -> ((v_Vuna_dCompiler_dIr_dValidate_dcheckIrTyM decls) dtb__84)
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRecUpd (dtb__85, dtb__86, dtb__87, dtb__88) -> ((v_Vuna_dCompiler_dIr_dValidate_dcheckIrTyM decls) dtb__88)
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrNatCase (dtb__89, dtb__90, dtb__91, dtb__92, dtb__93) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((v_Vuna_dCompiler_dIr_dValidate_dcheckAltBinderTysM decls) dtb__91)) (fun (_u : int) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((v_Vuna_dCompiler_dIr_dValidate_dcheckAltBinderTysM decls) dtb__92)) (fun (_u : int) -> ((v_Vuna_dCompiler_dIr_dValidate_dcheckAltBinderTysM decls) dtb__93)))))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCast (dtb__94, dtb__95, dtb__96) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((v_Vuna_dCompiler_dIr_dValidate_dcheckIrTyM decls) dtb__94)) (fun (_u : int) -> ((v_Vuna_dCompiler_dIr_dValidate_dcheckIrTyM decls) dtb__95)))
  | _ -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (0))
))

# 311 "Vuna/Compiler/Ir/Validate.vuna"
let rec v_Vuna_dCompiler_dIr_dValidate_dcheckDeclCtorSlots = (fun (mc0 : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrTyDecl Base_dData_dList.t_Base_dData_dList_dList) (mc1 : string) (mc2 : int) (mc3 : (string, Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrTy Base_dData_dList.t_Base_dData_dList_dList) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) -> (match mc3 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__97, dtb__98) -> (match dtb__97 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__99; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__100 } -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((v_Vuna_dCompiler_dIr_dValidate_dcheckTyArityListIn mc0) (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (mc2))) dtb__100)) (fun (_u : int) -> ((((v_Vuna_dCompiler_dIr_dValidate_dcheckDeclCtorSlots mc0) mc1) mc2) dtb__98)))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (0))
  | _ -> failwith "DT: impossible branch"
))

# 306 "Vuna/Compiler/Ir/Validate.vuna"
let v_Vuna_dCompiler_dIr_dValidate_dcheckDeclSlots = (fun (mc0 : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrTyDecl Base_dData_dList.t_Base_dData_dList_dList) (mc1 : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrTyDecl) -> (match mc1 with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTyDecl_IrUnboxedDecl (dtb__101, dtb__102, dtb__103) -> (((v_Vuna_dCompiler_dIr_dValidate_dcheckTyArityIn mc0) (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__102))) dtb__103)
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTyDecl_IrRecordDecl (dtb__104, dtb__105, dtb__106, dtb__107) -> (((v_Vuna_dCompiler_dIr_dValidate_dcheckTyArityListIn mc0) (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__105))) dtb__107)
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTyDecl_IrVariantDecl (dtb__108, dtb__109, dtb__110) -> ((((v_Vuna_dCompiler_dIr_dValidate_dcheckDeclCtorSlots mc0) dtb__108) dtb__109) dtb__110)
  | _ -> failwith "DT: impossible branch"
))

# 301 "Vuna/Compiler/Ir/Validate.vuna"
let rec v_Vuna_dCompiler_dIr_dValidate_dvalidateTyDeclsGo = (fun (mc0 : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrTyDecl Base_dData_dList.t_Base_dData_dList_dList) (mc1 : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrTyDecl Base_dData_dList.t_Base_dData_dList_dList) -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__111, dtb__112) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((v_Vuna_dCompiler_dIr_dValidate_dcheckDeclSlots mc0) dtb__111)) (fun (_u : int) -> ((v_Vuna_dCompiler_dIr_dValidate_dvalidateTyDeclsGo mc0) dtb__112)))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (0))
  | _ -> failwith "DT: impossible branch"
))

# 298 "Vuna/Compiler/Ir/Validate.vuna"
let v_Vuna_dCompiler_dIr_dValidate_dvalidateTyDecls = (fun (decls : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrTyDecl Base_dData_dList.t_Base_dData_dList_dList) -> ((v_Vuna_dCompiler_dIr_dValidate_dvalidateTyDeclsGo decls) decls))

# 353 "Vuna/Compiler/Ir/Validate.vuna"
let v_Vuna_dCompiler_dIr_dValidate_dscopedFuelOf = (fun (body : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIr) -> ((8 * (Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirSize body)) + 64))

# 391 "Vuna/Compiler/Ir/Validate.vuna"
let v_Vuna_dCompiler_dIr_dValidate_dmaybeAlts = (fun (mc0 : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrAlt Base_dData_dMaybe.t_Base_dData_dMaybe_dMaybe) -> (match mc0 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__113) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__113, Base_dData_dList.C_Base_dData_dList_dList_Nil))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 395 "Vuna/Compiler/Ir/Validate.vuna"
let rec v_Vuna_dCompiler_dIr_dValidate_daltWork = (fun (mc0 : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrBinder Base_dData_dList.t_Base_dData_dList_dList) (mc1 : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrAlt Base_dData_dList.t_Base_dData_dList_dList) -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__114, dtb__115) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = ((Base_dData_dList.v_Base_dData_dList_dappend (Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirAltBindersOf dtb__114)) mc0); Base_dData_dPair.f_Base_dData_dPair_dPair_second = (Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirAltBodyOf dtb__114) }, ((v_Vuna_dCompiler_dIr_dValidate_daltWork mc0) dtb__115)))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 369 "Vuna/Compiler/Ir/Validate.vuna"
let v_Vuna_dCompiler_dIr_dValidate_dscopedChildren = (fun (scope : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrBinder Base_dData_dList.t_Base_dData_dList_dList) (ir : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIr) -> (match ir with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCtor (dtb__116, dtb__117, dtb__118, dtb__119) -> ((Base_dData_dList.v_Base_dData_dList_dmap (fun (a : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIr) -> { Base_dData_dPair.f_Base_dData_dPair_dPair_first = scope; Base_dData_dPair.f_Base_dData_dPair_dPair_second = a })) dtb__119)
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRecord (dtb__120, dtb__121, dtb__122) -> ((Base_dData_dList.v_Base_dData_dList_dmap (fun (p : (string, Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIr) Base_dData_dPair.t_Base_dData_dPair_dPair) -> { Base_dData_dPair.f_Base_dData_dPair_dPair_first = scope; Base_dData_dPair.f_Base_dData_dPair_dPair_second = (Base_dData_dPair.v_Base_dData_dPair_dsecondOf p) })) dtb__122)
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrProj (dtb__123, dtb__124, dtb__125, dtb__126) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = scope; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__123 }, Base_dData_dList.C_Base_dData_dList_dList_Nil))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRecUpd (dtb__127, dtb__128, dtb__129, dtb__130) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = scope; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__127 }, ((Base_dData_dList.v_Base_dData_dList_dmap (fun (p : (string, Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIr) Base_dData_dPair.t_Base_dData_dPair_dPair) -> { Base_dData_dPair.f_Base_dData_dPair_dPair_first = scope; Base_dData_dPair.f_Base_dData_dPair_dPair_second = (Base_dData_dPair.v_Base_dData_dPair_dsecondOf p) })) dtb__129)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRtApp (dtb__131, dtb__132) -> ((Base_dData_dList.v_Base_dData_dList_dmap (fun (a : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIr) -> { Base_dData_dPair.f_Base_dData_dPair_dPair_first = scope; Base_dData_dPair.f_Base_dData_dPair_dPair_second = a })) dtb__132)
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCast (dtb__133, dtb__134, dtb__135) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = scope; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__135 }, Base_dData_dList.C_Base_dData_dList_dList_Nil))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLet (dtb__136, dtb__137, dtb__138) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = scope; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__137 }, (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = ((Base_dData_dList.v_Base_dData_dList_dappend dtb__136) scope); Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__138 }, Base_dData_dList.C_Base_dData_dList_dList_Nil))))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLam (dtb__139, dtb__140, dtb__141) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = ((Base_dData_dList.v_Base_dData_dList_dappend dtb__139) scope); Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__141 }, Base_dData_dList.C_Base_dData_dList_dList_Nil))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (dtb__142, dtb__143, dtb__144) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = scope; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__143 }, (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = scope; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__144 }, Base_dData_dList.C_Base_dData_dList_dList_Nil))))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrIf (dtb__145, dtb__146, dtb__147) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = scope; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__145 }, (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = scope; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__146 }, (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = scope; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__147 }, Base_dData_dList.C_Base_dData_dList_dList_Nil))))))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCase (dtb__148, dtb__149, dtb__150, dtb__151) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = scope; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__150 }, ((v_Vuna_dCompiler_dIr_dValidate_daltWork scope) dtb__151)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrNatCase (dtb__152, dtb__153, dtb__154, dtb__155, dtb__156) -> ((Base_dData_dList.v_Base_dData_dList_dappend (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = scope; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__152 }, Base_dData_dList.C_Base_dData_dList_dList_Nil))) ((Base_dData_dList.v_Base_dData_dList_dappend ((v_Vuna_dCompiler_dIr_dValidate_daltWork scope) (v_Vuna_dCompiler_dIr_dValidate_dmaybeAlts dtb__154))) ((Base_dData_dList.v_Base_dData_dList_dappend ((v_Vuna_dCompiler_dIr_dValidate_daltWork scope) (v_Vuna_dCompiler_dIr_dValidate_dmaybeAlts dtb__155))) ((v_Vuna_dCompiler_dIr_dValidate_daltWork scope) (v_Vuna_dCompiler_dIr_dValidate_dmaybeAlts dtb__156)))))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrConcatMany (dtb__157) -> ((Base_dData_dList.v_Base_dData_dList_dmap (fun (a : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIr) -> { Base_dData_dPair.f_Base_dData_dPair_dPair_first = scope; Base_dData_dPair.f_Base_dData_dPair_dPair_second = a })) dtb__157)
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrEffThunk (dtb__158, dtb__159, dtb__160, dtb__161, dtb__162) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = scope; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__162 }, Base_dData_dList.C_Base_dData_dList_dList_Nil))
  | _ -> Base_dData_dList.C_Base_dData_dList_dList_Nil
))

# 151 "Vuna/Compiler/Ir/Validate.vuna"
let rec v_Vuna_dCompiler_dIr_dValidate_dcheckBinderTysWork = (fun (shared : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrShared) (fuel : int) (decls : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrTyDecl Base_dData_dList.t_Base_dData_dList_dList) (work : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIr Base_dData_dList.t_Base_dData_dList_dList) -> (if (fuel <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "ir-binder-ty") else (match work with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (0))
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__163, dtb__164) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((v_Vuna_dCompiler_dIr_dValidate_dcheckNodeBinderTys shared) decls) dtb__163)) (fun (_u : int) -> ((((v_Vuna_dCompiler_dIr_dValidate_dcheckBinderTysWork shared) (fuel - 1)) decls) ((Base_dData_dList.v_Base_dData_dList_dappend ((Base_dData_dList.v_Base_dData_dList_dmap Base_dData_dPair.v_Base_dData_dPair_dsecondOf) ((v_Vuna_dCompiler_dIr_dValidate_dscopedChildren Base_dData_dList.C_Base_dData_dList_dList_Nil) dtb__163))) dtb__164))))
  | _ -> failwith "DT: impossible branch"
)))

# 106 "Vuna/Compiler/Ir/Validate.vuna"
let rec v_Vuna_dCompiler_dIr_dValidate_dcheckBinderTys = (fun (mc0 : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrShared) (mc1 : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrTyDecl Base_dData_dList.t_Base_dData_dList_dList) (mc2 : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrDef Base_dData_dList.t_Base_dData_dList_dList) -> (match mc2 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__165, dtb__166) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((v_Vuna_dCompiler_dIr_dValidate_dcheckDefTy mc1) (Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirDefName dtb__165)) (Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirDefTy dtb__165))) (fun (_u : int) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (v_Vuna_dCompiler_dIr_dValidate_dcheckDefArityVsSig dtb__165)) (fun (_u : int) -> (match (Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirDefBody dtb__165) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (((v_Vuna_dCompiler_dIr_dValidate_dcheckBinderTys mc0) mc1) dtb__166)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__167) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((v_Vuna_dCompiler_dIr_dValidate_dcheckBinderTysWork mc0) ((8 * (Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirSize dtb__167)) + 64)) mc1) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__167, Base_dData_dList.C_Base_dData_dList_dList_Nil)))) (fun (_u : int) -> (((v_Vuna_dCompiler_dIr_dValidate_dcheckBinderTys mc0) mc1) dtb__166)))
  | _ -> failwith "DT: impossible branch"
)))))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (0))
  | _ -> failwith "DT: impossible branch"
))

# 408 "Vuna/Compiler/Ir/Validate.vuna"
let v_Vuna_dCompiler_dIr_dValidate_dsameBName = (fun (mc0 : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrBName) (mc1 : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrBName) -> (match mc0 with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrBName_IrBWild -> (match mc1 with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrBName_IrBWild -> true
  | _ -> false
)
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrBName_IrBNat (dtb__168) -> (match mc1 with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrBName_IrBNat (dtb__169) -> (dtb__168 = dtb__169)
  | _ -> false
)
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrBName_IrBArm (dtb__170) -> (match mc1 with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrBName_IrBArm (dtb__171) -> (dtb__170 = dtb__171)
  | _ -> false
)
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrBName_IrBUser (dtb__172) -> (match mc1 with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrBName_IrBUser (dtb__173) -> (dtb__172 = dtb__173)
  | _ -> false
)
  | _ -> failwith "DT: impossible branch"
))

# 404 "Vuna/Compiler/Ir/Validate.vuna"
let v_Vuna_dCompiler_dIr_dValidate_dsameBinder = (fun (b1 : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrBinder) (b2 : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrBinder) -> (if (((Base_dTrait_dEq.v_Base_dTrait_dEq_d_x61__x61_ Base_dTrait_dEq.v_Eq_uBase_uData_uBool_uBool) (b1).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrBinder_irBinderErased) (b2).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrBinder_irBinderErased) then ((v_Vuna_dCompiler_dIr_dValidate_dsameBName (b1).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrBinder_irBinderName) (b2).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrBinder_irBinderName) else false))

# 400 "Vuna/Compiler/Ir/Validate.vuna"
let rec v_Vuna_dCompiler_dIr_dValidate_dmemBinder = (fun (mc0 : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrBinder) (mc1 : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrBinder Base_dData_dList.t_Base_dData_dList_dList) -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__174, dtb__175) -> (if ((v_Vuna_dCompiler_dIr_dValidate_dsameBinder mc0) dtb__174) then true else ((v_Vuna_dCompiler_dIr_dValidate_dmemBinder mc0) dtb__175))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 356 "Vuna/Compiler/Ir/Validate.vuna"
let rec v_Vuna_dCompiler_dIr_dValidate_dcheckScopedWork = (fun (fuel : int) (work : (Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrBinder Base_dData_dList.t_Base_dData_dList_dList, Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIr) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) -> (if (fuel <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "ir-scope") else ((fun nd_uscrut2 -> (match nd_uscrut2 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__176, dtb__177) -> (match dtb__176 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__178; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__179 } -> (match dtb__179 with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrVar (dtb__180) -> (if (dtb__180).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrBinder_irBinderErased then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicInternal "erased binder reached runtime IR") else (if ((v_Vuna_dCompiler_dIr_dValidate_dmemBinder dtb__180) dtb__178) then ((v_Vuna_dCompiler_dIr_dValidate_dcheckScopedWork (fuel - 1)) dtb__177) else (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicInternal "IR variable references a binder outside its scope")))
  | _ -> ((v_Vuna_dCompiler_dIr_dValidate_dcheckScopedWork (fuel - 1)) ((Base_dData_dList.v_Base_dData_dList_dappend ((v_Vuna_dCompiler_dIr_dValidate_dscopedChildren dtb__178) dtb__179)) dtb__177))
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (0))
  | _ -> failwith "DT: impossible branch"
)) work)))

# 343 "Vuna/Compiler/Ir/Validate.vuna"
let rec v_Vuna_dCompiler_dIr_dValidate_dcheckScopedDefs = (fun (mc0 : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrDef Base_dData_dList.t_Base_dData_dList_dList) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__181, dtb__182) -> (match (Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirDefBody dtb__181) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (v_Vuna_dCompiler_dIr_dValidate_dcheckScopedDefs dtb__182)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__183) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((v_Vuna_dCompiler_dIr_dValidate_dcheckScopedWork ((v_Vuna_dCompiler_dIr_dValidate_dscopedFuelOf dtb__183) + 1)) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = Base_dData_dList.C_Base_dData_dList_dList_Nil; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__183 }, Base_dData_dList.C_Base_dData_dList_dList_Nil)))) (fun (_u : int) -> (v_Vuna_dCompiler_dIr_dValidate_dcheckScopedDefs dtb__182)))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (0))
  | _ -> failwith "DT: impossible branch"
))

# 340 "Vuna/Compiler/Ir/Validate.vuna"
let v_Vuna_dCompiler_dIr_dValidate_dcheckScopedUnit = (fun (u : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrUnit) -> (v_Vuna_dCompiler_dIr_dValidate_dcheckScopedDefs ((Base_dData_dList.v_Base_dData_dList_dconcatMap Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirGroupDefs) (u).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrUnit_irUnitGroups)))

# 23 "Vuna/Compiler/Ir/Validate.vuna"
let v_Vuna_dCompiler_dIr_dValidate_dvalidateUnit = (fun (shared : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrShared) (u : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrUnit) -> ((fun defs -> ((fun nameTbl -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (Vuna_dCompiler_dIr_dAnalysis.v_Vuna_dCompiler_dIr_dAnalysis_dcheckUniqueDefNames defs)) (fun (_u : int) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((v_Vuna_dCompiler_dIr_dValidate_dcheckGroupOrder (u).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrUnit_irUnitGroups) nameTbl)) (fun (_u : int) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (v_Vuna_dCompiler_dIr_dValidate_dcheckSymbolRefs (Vuna_dCompiler_dIr_dRuntime.v_Vuna_dCompiler_dIr_dRuntime_dirSymbolsOfUnit u))) (fun (_u : int) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (v_Vuna_dCompiler_dIr_dValidate_dcheckScopedUnit u)) (fun (_u : int) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (v_Vuna_dCompiler_dIr_dValidate_dvalidateTyDecls (u).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrUnit_irUnitTyDecls)) (fun (_u : int) -> (((v_Vuna_dCompiler_dIr_dValidate_dcheckBinderTys shared) (u).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrUnit_irUnitTyDecls) defs)))))))))))) (Base_dContainer_dHashMap.v_Base_dContainer_dHashMap_dofNames ((Base_dData_dList.v_Base_dData_dList_dmap Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirDefName) defs)))) ((Base_dData_dList.v_Base_dData_dList_dconcatMap Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirGroupDefs) (u).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrUnit_irUnitGroups)))

# 87 "Vuna/Compiler/Ir/Validate.vuna"
let v_Vuna_dCompiler_dIr_dValidate_dvalidateProgram = (fun (p : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrProgram) -> ((fun u -> ((fun shared -> ((fun defs -> (match (u).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrUnit_irUnitEntry with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> ((v_Vuna_dCompiler_dIr_dValidate_dvalidateUnit shared) u)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__184) -> (if ((Base_dData_dList.v_Base_dData_dList_dmemName (dtb__184).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrEntry_irEntryMain) ((Base_dData_dList.v_Base_dData_dList_dmap Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirDefName) defs)) then ((v_Vuna_dCompiler_dIr_dValidate_dvalidateUnit shared) u) else (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicInternal (String.concat "" ["IR entry references an undefined main: `"; (dtb__184).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrEntry_irEntryMain; "`"])))
  | _ -> failwith "DT: impossible branch"
)) ((Base_dData_dList.v_Base_dData_dList_dconcatMap Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirGroupDefs) (u).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrUnit_irUnitGroups))) (p).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrProgram_irProgShared)) (p).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrProgram_irProgUnit))
