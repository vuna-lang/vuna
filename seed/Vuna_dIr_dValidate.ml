open Vuna_runtime
# 58 "Vuna/Ir/Validate.vuna"
let rec v_firstMissingDep = (fun (mc0 : (string, bool) B_dContainer_dHashMap.t_HashMap) (mc1 : (string, bool) B_dContainer_dHashMap.t_HashMap) (mc2 : string) (mc3 : string B_dData_dList.t_List) -> (match mc3 with
  | B_dData_dList.C_List__x58__x58_ (dtb__0, dtb__1) -> (if ((((B_dContainer_dHashMap.v_member B_dData_dString.v_Hashable_uString) B_dData_dString.v_Eq_uString) dtb__0) mc0) then (if ((((B_dContainer_dHashMap.v_member B_dData_dString.v_Hashable_uString) B_dData_dString.v_Eq_uString) dtb__0) mc1) then ((((v_firstMissingDep mc0) mc1) mc2) dtb__1) else (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = mc2; B_dData_dPair.f_Pair_second = dtb__0 }))) else ((((v_firstMissingDep mc0) mc1) mc2) dtb__1))
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 51 "Vuna/Ir/Validate.vuna"
let rec v_firstUnorderedDepGo = (fun (mc0 : (string, bool) B_dContainer_dHashMap.t_HashMap) (mc1 : (string, bool) B_dContainer_dHashMap.t_HashMap) (mc2 : Vuna_dIr_dModel.t_IrDef B_dData_dList.t_List) -> (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__2, dtb__3) -> (match ((((v_firstMissingDep mc0) mc1) (Vuna_dIr_dModel.v_irDefName dtb__2)) (Vuna_dIr_dModel.v_irDefDeps dtb__2)) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__4) -> (B_dData_dMaybe.C_Maybe_Just (dtb__4))
  | B_dData_dMaybe.C_Maybe_Nothing -> (((v_firstUnorderedDepGo mc0) mc1) dtb__3)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 48 "Vuna/Ir/Validate.vuna"
let v_firstUnorderedDep = (fun (nameTbl : (string, bool) B_dContainer_dHashMap.t_HashMap) (visible : (string, bool) B_dContainer_dHashMap.t_HashMap) (defs : Vuna_dIr_dModel.t_IrDef B_dData_dList.t_List) -> (((v_firstUnorderedDepGo nameTbl) visible) defs))

# 36 "Vuna/Ir/Validate.vuna"
let rec v_checkGroupOrderGo = (fun (mc0 : Vuna_dIr_dModel.t_IrGroup B_dData_dList.t_List) (mc1 : (string, bool) B_dContainer_dHashMap.t_HashMap) (mc2 : (string, bool) B_dContainer_dHashMap.t_HashMap) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__5, dtb__6) -> (let members = (Vuna_dIr_dModel.v_irGroupDefs dtb__5) in (let visible = (((B_dData_dList.v_foldl (fun (acc : (string, bool) B_dContainer_dHashMap.t_HashMap) (d : Vuna_dIr_dModel.t_IrDef) -> (((((B_dContainer_dHashMap.v_insert B_dData_dString.v_Hashable_uString) B_dData_dString.v_Eq_uString) (Vuna_dIr_dModel.v_irDefName d)) true) acc))) mc1) members) in (match (((v_firstUnorderedDep mc2) visible) members) with
  | B_dData_dMaybe.C_Maybe_Nothing -> (((v_checkGroupOrderGo dtb__6) visible) mc2)
  | B_dData_dMaybe.C_Maybe_Just (dtb__7) -> (Base_dDiag.v_icInternal (String.concat "" ["IR group order is inconsistent: `"; (B_dData_dPair.v_secondOf dtb__7); "` referenced before it is defined (group of `"; (B_dData_dPair.v_firstOf dtb__7); "`)"]))
  | _ -> failwith "DT: impossible branch"
)))
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (0))
  | _ -> failwith "DT: impossible branch"
))

# 33 "Vuna/Ir/Validate.vuna"
let v_checkGroupOrder = (fun (groups : Vuna_dIr_dModel.t_IrGroup B_dData_dList.t_List) (nameTbl : (string, bool) B_dContainer_dHashMap.t_HashMap) -> (((v_checkGroupOrderGo groups) (((B_dContainer_dHashMap.v_fromList B_dData_dString.v_Hashable_uString) B_dData_dString.v_Eq_uString) B_dData_dList.C_List_Nil)) nameTbl))

# 71 "Vuna/Ir/Validate.vuna"
let rec v_checkSymbolRefs = (fun (mc0 : (string, int B_dData_dMaybe.t_Maybe) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__8, dtb__9) -> (match (Vuna_dIr_dRuntime.v_irRtLookup (B_dData_dPair.v_firstOf dtb__8)) with
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.v_icInternal (String.concat "" ["IR references an undeclared runtime symbol: `"; (B_dData_dPair.v_firstOf dtb__8); "`"]))
  | B_dData_dMaybe.C_Maybe_Just (dtb__10) -> (match (B_dData_dPair.v_secondOf dtb__8) with
  | B_dData_dMaybe.C_Maybe_Nothing -> (v_checkSymbolRefs dtb__9)
  | B_dData_dMaybe.C_Maybe_Just (dtb__11) -> (if (if (dtb__11 > 0) then ((Vuna_dIr_dModel.v_irInlineArity (B_dData_dPair.v_firstOf dtb__8)) = dtb__11) else false) then (v_checkSymbolRefs dtb__9) else (Base_dDiag.v_icInternal (String.concat "" ["IR saturated runtime symbol `"; (B_dData_dPair.v_firstOf dtb__8); "` has the wrong arity ("; (bi_strFromInt dtb__11); ")"])))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (0))
  | _ -> failwith "DT: impossible branch"
))

# 140 "Vuna/Ir/Validate.vuna"
let rec v_irTyArrowArity = (fun (mc0 : Vuna_dIr_dModel.t_IrTy) -> (match mc0 with
  | Vuna_dIr_dModel.C_IrTy_IrTyFun (dtb__12, dtb__13) -> (1 + (v_irTyArrowArity dtb__13))
  | _ -> 0
))

# 122 "Vuna/Ir/Validate.vuna"
let v_checkDefArityVsSig = (fun (d : Vuna_dIr_dModel.t_IrDef) -> (match (Vuna_dIr_dModel.v_irDefExtern d) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__14) -> (Base_dDiag.C_Check_OkC (0))
  | B_dData_dMaybe.C_Maybe_Nothing -> (match (Vuna_dIr_dModel.v_irDefTy d) with
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.C_Check_OkC (0))
  | B_dData_dMaybe.C_Maybe_Just (dtb__15) -> (let arrows = (v_irTyArrowArity dtb__15) in (if (if ((Vuna_dIr_dModel.v_irDefArity d) = 0) then true else (arrows = 0)) then (Base_dDiag.C_Check_OkC (0)) else (if ((Vuna_dIr_dModel.v_irDefArity d) <= arrows) then (Base_dDiag.C_Check_OkC (0)) else (Base_dDiag.v_icInternal (String.concat "" ["definition `"; (Vuna_dIr_dModel.v_irDefName d); "` has "; (bi_strFromInt (Vuna_dIr_dModel.v_irDefArity d)); " runtime parameters but its signature has "; (bi_strFromInt arrows)])))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 223 "Vuna/Ir/Validate.vuna"
let rec v_countKeptFlags = (fun (mc0 : bool B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__16, dtb__17) -> (if dtb__16 then (1 + (v_countKeptFlags dtb__17)) else (v_countKeptFlags dtb__17))
  | B_dData_dList.C_List_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))

# 211 "Vuna/Ir/Validate.vuna"
let v_checkCtorArity = (fun (shared : Vuna_dIr_dModel.t_IrShared) (family : string) (ctor : string) (nargs : int) -> (let nd_uscrut4 = ((Vuna_dIr_dModel.v_irSharedCtorShapeOf ctor) (shared).Vuna_dIr_dModel.f_IrShared_irSharedCtorShapes) in (match nd_uscrut4 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__18) -> (match dtb__18 with
  | { B_dData_dPair.f_Pair_first = dtb__19; B_dData_dPair.f_Pair_second = dtb__20 } -> (if (dtb__19 = family) then (let n = (v_countKeptFlags dtb__20) in (if (nargs = n) then (Base_dDiag.C_Check_OkC (0)) else (Base_dDiag.v_icInternal (String.concat "" ["constructor `"; ctor; "` has "; (bi_strFromInt nargs); " runtime arguments, expected "; (bi_strFromInt n)])))) else (Base_dDiag.v_icInternal (String.concat "" ["constructor `"; ctor; "` belongs to family `"; dtb__19; "`, not `"; family; "`"])))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.v_icInternal (String.concat "" ["IR references an undeclared constructor: `"; ctor; "`"]))
  | _ -> failwith "DT: impossible branch"
)))

# 318 "Vuna/Ir/Validate.vuna"
let rec v_tyDeclArityOf = (fun (mc0 : Vuna_dIr_dModel.t_IrTyDecl B_dData_dList.t_List) (mc1 : string) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__21, dtb__22) -> (match dtb__21 with
  | Vuna_dIr_dModel.C_IrTyDecl_IrUnboxedDecl (dtb__23, dtb__24, dtb__25) -> (if (dtb__23 = mc1) then (B_dData_dMaybe.C_Maybe_Just (dtb__24)) else ((v_tyDeclArityOf dtb__22) mc1))
  | Vuna_dIr_dModel.C_IrTyDecl_IrRecordDecl (dtb__26, dtb__27, dtb__28, dtb__29) -> (if (dtb__26 = mc1) then (B_dData_dMaybe.C_Maybe_Just (dtb__27)) else ((v_tyDeclArityOf dtb__22) mc1))
  | Vuna_dIr_dModel.C_IrTyDecl_IrVariantDecl (dtb__30, dtb__31, dtb__32) -> (if (dtb__30 = mc1) then (B_dData_dMaybe.C_Maybe_Just (dtb__31)) else ((v_tyDeclArityOf dtb__22) mc1))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 327 "Vuna/Ir/Validate.vuna"
let rec v_listLength = (fun mc0 -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__33, dtb__34) -> (1 + (v_listLength dtb__34))
  | B_dData_dList.C_List_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))

# 259 "Vuna/Ir/Validate.vuna"
let rec v_checkTyArityIn = (fun (mc0 : Vuna_dIr_dModel.t_IrTyDecl B_dData_dList.t_List) (mc1 : int B_dData_dMaybe.t_Maybe) (mc2 : Vuna_dIr_dModel.t_IrTy) -> (match mc2 with
  | Vuna_dIr_dModel.C_IrTy_IrTyData (dtb__35, dtb__36) -> (match ((v_tyDeclArityOf mc0) dtb__35) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__37) -> (if ((v_listLength dtb__36) = dtb__37) then (((v_checkTyArityListIn mc0) mc1) dtb__36) else (Base_dDiag.v_icInternal (String.concat "" ["binder type annotation has the wrong type argument count for `"; dtb__35; "` (expected "; (bi_strFromInt dtb__37); ", got "; (bi_strFromInt (v_listLength dtb__36)); ")"])))
  | B_dData_dMaybe.C_Maybe_Nothing -> (((v_checkTyArityListIn mc0) mc1) dtb__36)
  | _ -> failwith "DT: impossible branch"
)
  | Vuna_dIr_dModel.C_IrTy_IrTyFun (dtb__38, dtb__39) -> ((Base_dCommon.v_bind (((v_checkTyArityIn mc0) mc1) dtb__38)) (fun (_u : int) -> (((v_checkTyArityIn mc0) mc1) dtb__39)))
  | Vuna_dIr_dModel.C_IrTy_IrTyRef (dtb__40) -> (((v_checkTyArityIn mc0) mc1) dtb__40)
  | Vuna_dIr_dModel.C_IrTy_IrTyArray (dtb__41) -> (((v_checkTyArityIn mc0) mc1) dtb__41)
  | Vuna_dIr_dModel.C_IrTy_IrTyOpaque -> (Base_dDiag.C_Check_OkC (0))
  | Vuna_dIr_dModel.C_IrTy_IrTyFloat -> (Base_dDiag.C_Check_OkC (0))
  | Vuna_dIr_dModel.C_IrTy_IrTyBool -> (Base_dDiag.C_Check_OkC (0))
  | Vuna_dIr_dModel.C_IrTy_IrTyStr -> (Base_dDiag.C_Check_OkC (0))
  | Vuna_dIr_dModel.C_IrTy_IrTyInt -> (Base_dDiag.C_Check_OkC (0))
  | Vuna_dIr_dModel.C_IrTy_IrTyVar (dtb__42) -> (if (dtb__42 < 0) then (Base_dDiag.v_icInternal "negative runtime type parameter slot") else (match mc1 with
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.C_Check_OkC (0))
  | B_dData_dMaybe.C_Maybe_Just (dtb__43) -> (if (dtb__42 < dtb__43) then (Base_dDiag.C_Check_OkC (0)) else (Base_dDiag.v_icInternal (String.concat "" ["runtime type parameter slot "; (bi_strFromInt dtb__42); " is out of range (declaration has "; (bi_strFromInt dtb__43); " type parameters)"])))
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
))
# 289 "Vuna/Ir/Validate.vuna"
and v_checkTyArityListIn = (fun (mc0 : Vuna_dIr_dModel.t_IrTyDecl B_dData_dList.t_List) (mc1 : int B_dData_dMaybe.t_Maybe) (mc2 : Vuna_dIr_dModel.t_IrTy B_dData_dList.t_List) -> (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__44, dtb__45) -> ((Base_dCommon.v_bind (((v_checkTyArityIn mc0) mc1) dtb__44)) (fun (_u : int) -> (((v_checkTyArityListIn mc0) mc1) dtb__45)))
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (0))
  | _ -> failwith "DT: impossible branch"
))

# 254 "Vuna/Ir/Validate.vuna"
let v_checkTyArity = (fun (decls : Vuna_dIr_dModel.t_IrTyDecl B_dData_dList.t_List) (ty : Vuna_dIr_dModel.t_IrTy) -> (((v_checkTyArityIn decls) B_dData_dMaybe.C_Maybe_Nothing) ty))

# 144 "Vuna/Ir/Validate.vuna"
let v_checkDefTy = (fun (mc0 : Vuna_dIr_dModel.t_IrTyDecl B_dData_dList.t_List) (mc1 : string) (mc2 : Vuna_dIr_dModel.t_IrTy B_dData_dMaybe.t_Maybe) -> (match mc2 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__46) -> (match ((v_checkTyArity mc0) dtb__46) with
  | Base_dDiag.C_Check_ErrC (dtb__47) -> (Base_dDiag.v_icInternal (String.concat "" ["definition `"; mc1; "` has an invalid runtime signature"]))
  | Base_dDiag.C_Check_OkC (dtb__48) -> (Base_dDiag.C_Check_OkC (dtb__48))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.C_Check_OkC (0))
  | _ -> failwith "DT: impossible branch"
))

# 227 "Vuna/Ir/Validate.vuna"
let v_checkIrTyM = (fun (mc0 : Vuna_dIr_dModel.t_IrTyDecl B_dData_dList.t_List) (mc1 : Vuna_dIr_dModel.t_IrTy B_dData_dMaybe.t_Maybe) -> (match mc1 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__49) -> ((v_checkTyArity mc0) dtb__49)
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.C_Check_OkC (0))
  | _ -> failwith "DT: impossible branch"
))

# 183 "Vuna/Ir/Validate.vuna"
let v_checkAppTyM = (fun (mc0 : Vuna_dIr_dModel.t_IrTyDecl B_dData_dList.t_List) (mc1 : (Vuna_dIr_dModel.t_IrTy, Vuna_dIr_dModel.t_IrTy) B_dData_dPair.t_Pair B_dData_dMaybe.t_Maybe) -> (match mc1 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__50) -> ((Base_dCommon.v_bind ((v_checkIrTyM mc0) (B_dData_dMaybe.C_Maybe_Just ((B_dData_dPair.v_firstOf dtb__50))))) (fun (_u : int) -> ((v_checkIrTyM mc0) (B_dData_dMaybe.C_Maybe_Just ((B_dData_dPair.v_secondOf dtb__50))))))
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.C_Check_OkC (0))
  | _ -> failwith "DT: impossible branch"
))

# 231 "Vuna/Ir/Validate.vuna"
let rec v_checkBinderTysOf = (fun (mc0 : Vuna_dIr_dModel.t_IrTyDecl B_dData_dList.t_List) (mc1 : Vuna_dIr_dModel.t_IrBinder B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__51, dtb__52) -> (if (dtb__51).Vuna_dIr_dModel.f_IrBinder_irBinderErased then (match (dtb__51).Vuna_dIr_dModel.f_IrBinder_irBinderTy with
  | B_dData_dMaybe.C_Maybe_Nothing -> ((v_checkBinderTysOf mc0) dtb__52)
  | B_dData_dMaybe.C_Maybe_Just (dtb__53) -> (Base_dDiag.v_icInternal "erased binder carries a runtime type annotation")
  | _ -> failwith "DT: impossible branch"
) else (match (dtb__51).Vuna_dIr_dModel.f_IrBinder_irBinderTy with
  | B_dData_dMaybe.C_Maybe_Nothing -> ((v_checkBinderTysOf mc0) dtb__52)
  | B_dData_dMaybe.C_Maybe_Just (dtb__54) -> ((Base_dCommon.v_bind ((v_checkTyArity mc0) dtb__54)) (fun (_u : int) -> ((v_checkBinderTysOf mc0) dtb__52)))
  | _ -> failwith "DT: impossible branch"
))
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (0))
  | _ -> failwith "DT: impossible branch"
))

# 243 "Vuna/Ir/Validate.vuna"
let rec v_checkAltBinderTys = (fun (mc0 : Vuna_dIr_dModel.t_IrTyDecl B_dData_dList.t_List) (mc1 : Vuna_dIr_dModel.t_IrAlt B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__55, dtb__56) -> ((Base_dCommon.v_bind ((v_checkBinderTysOf mc0) (Vuna_dIr_dModel.v_irAltBindersOf dtb__55))) (fun (_u : int) -> ((v_checkAltBinderTys mc0) dtb__56)))
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (0))
  | _ -> failwith "DT: impossible branch"
))

# 250 "Vuna/Ir/Validate.vuna"
let v_checkAltBinderTysM = (fun (mc0 : Vuna_dIr_dModel.t_IrTyDecl B_dData_dList.t_List) (mc1 : Vuna_dIr_dModel.t_IrAlt B_dData_dMaybe.t_Maybe) -> (match mc1 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__57) -> ((v_checkBinderTysOf mc0) (Vuna_dIr_dModel.v_irAltBindersOf dtb__57))
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.C_Check_OkC (0))
  | _ -> failwith "DT: impossible branch"
))

# 286 "Vuna/Ir/Validate.vuna"
let v_checkTyArityList = (fun (decls : Vuna_dIr_dModel.t_IrTyDecl B_dData_dList.t_List) (tys : Vuna_dIr_dModel.t_IrTy B_dData_dList.t_List) -> (((v_checkTyArityListIn decls) B_dData_dMaybe.C_Maybe_Nothing) tys))

# 205 "Vuna/Ir/Validate.vuna"
let v_checkTyArityListM = (fun (mc0 : Vuna_dIr_dModel.t_IrTyDecl B_dData_dList.t_List) (mc1 : Vuna_dIr_dModel.t_IrTy B_dData_dList.t_List B_dData_dMaybe.t_Maybe) -> (match mc1 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__58) -> ((v_checkTyArityList mc0) dtb__58)
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.C_Check_OkC (0))
  | _ -> failwith "DT: impossible branch"
))

# 190 "Vuna/Ir/Validate.vuna"
let v_checkCtorTys = (fun (shared : Vuna_dIr_dModel.t_IrShared) (decls : Vuna_dIr_dModel.t_IrTyDecl B_dData_dList.t_List) (family : string) (ctor : string) (tys : Vuna_dIr_dModel.t_IrTy B_dData_dList.t_List B_dData_dMaybe.t_Maybe) (nargs : int) -> ((Base_dCommon.v_bind ((v_checkTyArityListM decls) tys)) (fun (_u : int) -> (let typeArityOk = (match ((v_tyDeclArityOf decls) family) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__59) -> (match tys with
  | B_dData_dMaybe.C_Maybe_Just (dtb__60) -> ((v_listLength dtb__60) = dtb__59)
  | B_dData_dMaybe.C_Maybe_Nothing -> true
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> true
  | _ -> failwith "DT: impossible branch"
) in (if typeArityOk then ((((v_checkCtorArity shared) family) ctor) nargs) else (Base_dDiag.v_icInternal (String.concat "" ["constructor application has the wrong runtime type argument count for `"; family; "`"])))))))

# 160 "Vuna/Ir/Validate.vuna"
let rec v_checkNodeBinderTys = (fun (mc0 : Vuna_dIr_dModel.t_IrShared) (mc1 : Vuna_dIr_dModel.t_IrTyDecl B_dData_dList.t_List) (mc2 : Vuna_dIr_dModel.t_Ir) -> (match mc2 with
  | Vuna_dIr_dModel.C_Ir_IrTail (dtb__61) -> (((v_checkNodeBinderTys mc0) mc1) dtb__61)
  | Vuna_dIr_dModel.C_Ir_IrCast (dtb__62, dtb__63, dtb__64) -> ((Base_dCommon.v_bind ((v_checkIrTyM mc1) dtb__62)) (fun (_u : int) -> ((v_checkIrTyM mc1) dtb__63)))
  | Vuna_dIr_dModel.C_Ir_IrNatCase (dtb__65, dtb__66, dtb__67, dtb__68, dtb__69) -> ((Base_dCommon.v_bind ((v_checkAltBinderTysM mc1) dtb__67)) (fun (_u : int) -> ((Base_dCommon.v_bind ((v_checkAltBinderTysM mc1) dtb__68)) (fun (_u : int) -> ((v_checkAltBinderTysM mc1) dtb__69)))))
  | Vuna_dIr_dModel.C_Ir_IrRecUpd (dtb__70, dtb__71, dtb__72, dtb__73) -> ((v_checkIrTyM mc1) dtb__73)
  | Vuna_dIr_dModel.C_Ir_IrProj (dtb__74, dtb__75, dtb__76, dtb__77) -> ((v_checkIrTyM mc1) dtb__77)
  | Vuna_dIr_dModel.C_Ir_IrRecord (dtb__78, dtb__79, dtb__80) -> ((v_checkIrTyM mc1) dtb__79)
  | Vuna_dIr_dModel.C_Ir_IrCtor (dtb__81, dtb__82, dtb__83, dtb__84) -> ((((((v_checkCtorTys mc0) mc1) dtb__81) dtb__82) dtb__83) (v_listLength dtb__84))
  | Vuna_dIr_dModel.C_Ir_IrApp (dtb__85, dtb__86, dtb__87) -> ((v_checkAppTyM mc1) dtb__85)
  | Vuna_dIr_dModel.C_Ir_IrCase (dtb__88, dtb__89, dtb__90, dtb__91) -> ((Base_dCommon.v_bind ((v_checkIrTyM mc1) dtb__88)) (fun (_u : int) -> ((Base_dCommon.v_bind ((v_checkIrTyM mc1) dtb__89)) (fun (_u : int) -> ((v_checkAltBinderTys mc1) dtb__91)))))
  | Vuna_dIr_dModel.C_Ir_IrLet (dtb__92, dtb__93, dtb__94) -> ((v_checkBinderTysOf mc1) dtb__92)
  | Vuna_dIr_dModel.C_Ir_IrLam (dtb__95, dtb__96, dtb__97) -> ((Base_dCommon.v_bind ((v_checkBinderTysOf mc1) dtb__95)) (fun (_u : int) -> ((v_checkIrTyM mc1) dtb__96)))
  | _ -> (Base_dDiag.C_Check_OkC (0))
))

# 311 "Vuna/Ir/Validate.vuna"
let rec v_checkDeclCtorSlots = (fun (mc0 : Vuna_dIr_dModel.t_IrTyDecl B_dData_dList.t_List) (mc1 : string) (mc2 : int) (mc3 : (string, Vuna_dIr_dModel.t_IrTy B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc3 with
  | B_dData_dList.C_List__x58__x58_ (dtb__98, dtb__99) -> (match dtb__98 with
  | { B_dData_dPair.f_Pair_first = dtb__100; B_dData_dPair.f_Pair_second = dtb__101 } -> ((Base_dCommon.v_bind (((v_checkTyArityListIn mc0) (B_dData_dMaybe.C_Maybe_Just (mc2))) dtb__101)) (fun (_u : int) -> ((((v_checkDeclCtorSlots mc0) mc1) mc2) dtb__99)))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (0))
  | _ -> failwith "DT: impossible branch"
))

# 306 "Vuna/Ir/Validate.vuna"
let v_checkDeclSlots = (fun (mc0 : Vuna_dIr_dModel.t_IrTyDecl B_dData_dList.t_List) (mc1 : Vuna_dIr_dModel.t_IrTyDecl) -> (match mc1 with
  | Vuna_dIr_dModel.C_IrTyDecl_IrUnboxedDecl (dtb__102, dtb__103, dtb__104) -> (((v_checkTyArityIn mc0) (B_dData_dMaybe.C_Maybe_Just (dtb__103))) dtb__104)
  | Vuna_dIr_dModel.C_IrTyDecl_IrRecordDecl (dtb__105, dtb__106, dtb__107, dtb__108) -> (((v_checkTyArityListIn mc0) (B_dData_dMaybe.C_Maybe_Just (dtb__106))) dtb__108)
  | Vuna_dIr_dModel.C_IrTyDecl_IrVariantDecl (dtb__109, dtb__110, dtb__111) -> ((((v_checkDeclCtorSlots mc0) dtb__109) dtb__110) dtb__111)
  | _ -> failwith "DT: impossible branch"
))

# 301 "Vuna/Ir/Validate.vuna"
let rec v_validateTyDeclsGo = (fun (mc0 : Vuna_dIr_dModel.t_IrTyDecl B_dData_dList.t_List) (mc1 : Vuna_dIr_dModel.t_IrTyDecl B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__112, dtb__113) -> ((Base_dCommon.v_bind ((v_checkDeclSlots mc0) dtb__112)) (fun (_u : int) -> ((v_validateTyDeclsGo mc0) dtb__113)))
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (0))
  | _ -> failwith "DT: impossible branch"
))

# 298 "Vuna/Ir/Validate.vuna"
let v_validateTyDecls = (fun (decls : Vuna_dIr_dModel.t_IrTyDecl B_dData_dList.t_List) -> ((v_validateTyDeclsGo decls) decls))

# 353 "Vuna/Ir/Validate.vuna"
let v_scopedFuelOf = (fun (body : Vuna_dIr_dModel.t_Ir) -> ((8 * (Vuna_dIr_dModel.v_irSize body)) + 64))

# 391 "Vuna/Ir/Validate.vuna"
let v_maybeAlts = (fun (mc0 : Vuna_dIr_dModel.t_IrAlt B_dData_dMaybe.t_Maybe) -> (match mc0 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__114) -> (B_dData_dList.C_List__x58__x58_ (dtb__114, B_dData_dList.C_List_Nil))
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 395 "Vuna/Ir/Validate.vuna"
let rec v_altWork = (fun (mc0 : Vuna_dIr_dModel.t_IrBinder B_dData_dList.t_List) (mc1 : Vuna_dIr_dModel.t_IrAlt B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__115, dtb__116) -> (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = ((B_dData_dList.v_append (Vuna_dIr_dModel.v_irAltBindersOf dtb__115)) mc0); B_dData_dPair.f_Pair_second = (Vuna_dIr_dModel.v_irAltBodyOf dtb__115) }, ((v_altWork mc0) dtb__116)))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 369 "Vuna/Ir/Validate.vuna"
let v_scopedChildren = (fun (mc0 : Vuna_dIr_dModel.t_IrBinder B_dData_dList.t_List) (mc1 : Vuna_dIr_dModel.t_Ir) -> (match mc1 with
  | Vuna_dIr_dModel.C_Ir_IrTail (dtb__117) -> (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = mc0; B_dData_dPair.f_Pair_second = dtb__117 }, B_dData_dList.C_List_Nil))
  | Vuna_dIr_dModel.C_Ir_IrEffThunk (dtb__118, dtb__119, dtb__120, dtb__121, dtb__122) -> (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = mc0; B_dData_dPair.f_Pair_second = dtb__122 }, B_dData_dList.C_List_Nil))
  | Vuna_dIr_dModel.C_Ir_IrConcatMany (dtb__123) -> ((B_dData_dList.v_map (fun (a : Vuna_dIr_dModel.t_Ir) -> { B_dData_dPair.f_Pair_first = mc0; B_dData_dPair.f_Pair_second = a })) dtb__123)
  | Vuna_dIr_dModel.C_Ir_IrNatCase (dtb__124, dtb__125, dtb__126, dtb__127, dtb__128) -> ((B_dData_dList.v_append (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = mc0; B_dData_dPair.f_Pair_second = dtb__124 }, B_dData_dList.C_List_Nil))) ((B_dData_dList.v_append ((v_altWork mc0) (v_maybeAlts dtb__126))) ((B_dData_dList.v_append ((v_altWork mc0) (v_maybeAlts dtb__127))) ((v_altWork mc0) (v_maybeAlts dtb__128)))))
  | Vuna_dIr_dModel.C_Ir_IrCase (dtb__129, dtb__130, dtb__131, dtb__132) -> (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = mc0; B_dData_dPair.f_Pair_second = dtb__131 }, ((v_altWork mc0) dtb__132)))
  | Vuna_dIr_dModel.C_Ir_IrIf (dtb__133, dtb__134, dtb__135) -> (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = mc0; B_dData_dPair.f_Pair_second = dtb__133 }, (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = mc0; B_dData_dPair.f_Pair_second = dtb__134 }, (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = mc0; B_dData_dPair.f_Pair_second = dtb__135 }, B_dData_dList.C_List_Nil))))))
  | Vuna_dIr_dModel.C_Ir_IrApp (dtb__136, dtb__137, dtb__138) -> (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = mc0; B_dData_dPair.f_Pair_second = dtb__137 }, (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = mc0; B_dData_dPair.f_Pair_second = dtb__138 }, B_dData_dList.C_List_Nil))))
  | Vuna_dIr_dModel.C_Ir_IrLam (dtb__139, dtb__140, dtb__141) -> (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = ((B_dData_dList.v_append dtb__139) mc0); B_dData_dPair.f_Pair_second = dtb__141 }, B_dData_dList.C_List_Nil))
  | Vuna_dIr_dModel.C_Ir_IrLet (dtb__142, dtb__143, dtb__144) -> (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = mc0; B_dData_dPair.f_Pair_second = dtb__143 }, (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = ((B_dData_dList.v_append dtb__142) mc0); B_dData_dPair.f_Pair_second = dtb__144 }, B_dData_dList.C_List_Nil))))
  | Vuna_dIr_dModel.C_Ir_IrCast (dtb__145, dtb__146, dtb__147) -> (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = mc0; B_dData_dPair.f_Pair_second = dtb__147 }, B_dData_dList.C_List_Nil))
  | Vuna_dIr_dModel.C_Ir_IrRtApp (dtb__148, dtb__149) -> ((B_dData_dList.v_map (fun (a : Vuna_dIr_dModel.t_Ir) -> { B_dData_dPair.f_Pair_first = mc0; B_dData_dPair.f_Pair_second = a })) dtb__149)
  | Vuna_dIr_dModel.C_Ir_IrRecUpd (dtb__150, dtb__151, dtb__152, dtb__153) -> (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = mc0; B_dData_dPair.f_Pair_second = dtb__150 }, ((B_dData_dList.v_map (fun (p : (string, Vuna_dIr_dModel.t_Ir) B_dData_dPair.t_Pair) -> { B_dData_dPair.f_Pair_first = mc0; B_dData_dPair.f_Pair_second = (B_dData_dPair.v_secondOf p) })) dtb__152)))
  | Vuna_dIr_dModel.C_Ir_IrProj (dtb__154, dtb__155, dtb__156, dtb__157) -> (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = mc0; B_dData_dPair.f_Pair_second = dtb__154 }, B_dData_dList.C_List_Nil))
  | Vuna_dIr_dModel.C_Ir_IrRecord (dtb__158, dtb__159, dtb__160) -> ((B_dData_dList.v_map (fun (p : (string, Vuna_dIr_dModel.t_Ir) B_dData_dPair.t_Pair) -> { B_dData_dPair.f_Pair_first = mc0; B_dData_dPair.f_Pair_second = (B_dData_dPair.v_secondOf p) })) dtb__160)
  | Vuna_dIr_dModel.C_Ir_IrCtor (dtb__161, dtb__162, dtb__163, dtb__164) -> ((B_dData_dList.v_map (fun (a : Vuna_dIr_dModel.t_Ir) -> { B_dData_dPair.f_Pair_first = mc0; B_dData_dPair.f_Pair_second = a })) dtb__164)
  | _ -> B_dData_dList.C_List_Nil
))

# 151 "Vuna/Ir/Validate.vuna"
let rec v_checkBinderTysWork = (fun (shared : Vuna_dIr_dModel.t_IrShared) (fuel : int) (decls : Vuna_dIr_dModel.t_IrTyDecl B_dData_dList.t_List) (work : Vuna_dIr_dModel.t_Ir B_dData_dList.t_List) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "ir-binder-ty") else (match work with
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (0))
  | B_dData_dList.C_List__x58__x58_ (dtb__165, dtb__166) -> ((Base_dCommon.v_bind (((v_checkNodeBinderTys shared) decls) dtb__165)) (fun (_u : int) -> ((((v_checkBinderTysWork shared) (fuel - 1)) decls) ((B_dData_dList.v_append ((B_dData_dList.v_map B_dData_dPair.v_secondOf) ((v_scopedChildren B_dData_dList.C_List_Nil) dtb__165))) dtb__166))))
  | _ -> failwith "DT: impossible branch"
)))

# 106 "Vuna/Ir/Validate.vuna"
let rec v_checkBinderTys = (fun (mc0 : Vuna_dIr_dModel.t_IrShared) (mc1 : Vuna_dIr_dModel.t_IrTyDecl B_dData_dList.t_List) (mc2 : Vuna_dIr_dModel.t_IrDef B_dData_dList.t_List) -> (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__167, dtb__168) -> ((Base_dCommon.v_bind (((v_checkDefTy mc1) (Vuna_dIr_dModel.v_irDefName dtb__167)) (Vuna_dIr_dModel.v_irDefTy dtb__167))) (fun (_u : int) -> ((Base_dCommon.v_bind (v_checkDefArityVsSig dtb__167)) (fun (_u : int) -> (match (Vuna_dIr_dModel.v_irDefBody dtb__167) with
  | B_dData_dMaybe.C_Maybe_Nothing -> (((v_checkBinderTys mc0) mc1) dtb__168)
  | B_dData_dMaybe.C_Maybe_Just (dtb__169) -> ((Base_dCommon.v_bind ((((v_checkBinderTysWork mc0) ((8 * (Vuna_dIr_dModel.v_irSize dtb__169)) + 64)) mc1) (B_dData_dList.C_List__x58__x58_ (dtb__169, B_dData_dList.C_List_Nil)))) (fun (_u : int) -> (((v_checkBinderTys mc0) mc1) dtb__168)))
  | _ -> failwith "DT: impossible branch"
)))))
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (0))
  | _ -> failwith "DT: impossible branch"
))

# 408 "Vuna/Ir/Validate.vuna"
let v_sameBName = (fun (mc0 : Vuna_dIr_dModel.t_IrBName) (mc1 : Vuna_dIr_dModel.t_IrBName) -> (match mc0 with
  | Vuna_dIr_dModel.C_IrBName_IrBWild -> (match mc1 with
  | Vuna_dIr_dModel.C_IrBName_IrBWild -> true
  | _ -> false
)
  | Vuna_dIr_dModel.C_IrBName_IrBNat (dtb__170) -> (match mc1 with
  | Vuna_dIr_dModel.C_IrBName_IrBNat (dtb__171) -> (dtb__170 = dtb__171)
  | _ -> false
)
  | Vuna_dIr_dModel.C_IrBName_IrBArm (dtb__172) -> (match mc1 with
  | Vuna_dIr_dModel.C_IrBName_IrBArm (dtb__173) -> (dtb__172 = dtb__173)
  | _ -> false
)
  | Vuna_dIr_dModel.C_IrBName_IrBUser (dtb__174) -> (match mc1 with
  | Vuna_dIr_dModel.C_IrBName_IrBUser (dtb__175) -> (dtb__174 = dtb__175)
  | _ -> false
)
  | _ -> failwith "DT: impossible branch"
))

# 404 "Vuna/Ir/Validate.vuna"
let v_sameBinder = (fun (b1 : Vuna_dIr_dModel.t_IrBinder) (b2 : Vuna_dIr_dModel.t_IrBinder) -> (if (((B_dTrait_dEq.v__x61__x61_ B_dTrait_dEq.v_Eq_uBase_uData_uBool_uBool) (b1).Vuna_dIr_dModel.f_IrBinder_irBinderErased) (b2).Vuna_dIr_dModel.f_IrBinder_irBinderErased) then ((v_sameBName (b1).Vuna_dIr_dModel.f_IrBinder_irBinderName) (b2).Vuna_dIr_dModel.f_IrBinder_irBinderName) else false))

# 400 "Vuna/Ir/Validate.vuna"
let rec v_memBinder = (fun (mc0 : Vuna_dIr_dModel.t_IrBinder) (mc1 : Vuna_dIr_dModel.t_IrBinder B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__176, dtb__177) -> (if ((v_sameBinder mc0) dtb__176) then true else ((v_memBinder mc0) dtb__177))
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 356 "Vuna/Ir/Validate.vuna"
let rec v_checkScopedWork = (fun (fuel : int) (work : (Vuna_dIr_dModel.t_IrBinder B_dData_dList.t_List, Vuna_dIr_dModel.t_Ir) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "ir-scope") else (let nd_uscrut2 = work in (match nd_uscrut2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__178, dtb__179) -> (match dtb__178 with
  | { B_dData_dPair.f_Pair_first = dtb__180; B_dData_dPair.f_Pair_second = dtb__181 } -> (match dtb__181 with
  | Vuna_dIr_dModel.C_Ir_IrVar (dtb__182) -> (if (dtb__182).Vuna_dIr_dModel.f_IrBinder_irBinderErased then (Base_dDiag.v_icInternal "erased binder reached runtime IR") else (if ((v_memBinder dtb__182) dtb__180) then ((v_checkScopedWork (fuel - 1)) dtb__179) else (Base_dDiag.v_icInternal "IR variable references a binder outside its scope")))
  | _ -> ((v_checkScopedWork (fuel - 1)) ((B_dData_dList.v_append ((v_scopedChildren dtb__180) dtb__181)) dtb__179))
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (0))
  | _ -> failwith "DT: impossible branch"
))))

# 343 "Vuna/Ir/Validate.vuna"
let rec v_checkScopedDefs = (fun (mc0 : Vuna_dIr_dModel.t_IrDef B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__183, dtb__184) -> (match (Vuna_dIr_dModel.v_irDefBody dtb__183) with
  | B_dData_dMaybe.C_Maybe_Nothing -> (v_checkScopedDefs dtb__184)
  | B_dData_dMaybe.C_Maybe_Just (dtb__185) -> ((Base_dCommon.v_bind ((v_checkScopedWork ((v_scopedFuelOf dtb__185) + 1)) (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = dtb__185 }, B_dData_dList.C_List_Nil)))) (fun (_u : int) -> (v_checkScopedDefs dtb__184)))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (0))
  | _ -> failwith "DT: impossible branch"
))

# 340 "Vuna/Ir/Validate.vuna"
let v_checkScopedUnit = (fun (u : Vuna_dIr_dModel.t_IrUnit) -> (v_checkScopedDefs ((B_dData_dList.v_concatMap Vuna_dIr_dModel.v_irGroupDefs) (u).Vuna_dIr_dModel.f_IrUnit_irUnitGroups)))

# 23 "Vuna/Ir/Validate.vuna"
let v_validateUnit = (fun (shared : Vuna_dIr_dModel.t_IrShared) (u : Vuna_dIr_dModel.t_IrUnit) -> (let defs = ((B_dData_dList.v_concatMap Vuna_dIr_dModel.v_irGroupDefs) (u).Vuna_dIr_dModel.f_IrUnit_irUnitGroups) in (let nameTbl = (B_dContainer_dHashMap.v_ofNames ((B_dData_dList.v_map Vuna_dIr_dModel.v_irDefName) defs)) in ((Base_dCommon.v_bind (Vuna_dIr_dAnalysis.v_checkUniqueDefNames defs)) (fun (_u : int) -> ((Base_dCommon.v_bind ((v_checkGroupOrder (u).Vuna_dIr_dModel.f_IrUnit_irUnitGroups) nameTbl)) (fun (_u : int) -> ((Base_dCommon.v_bind (v_checkSymbolRefs (Vuna_dIr_dRuntime.v_irSymbolsOfUnit u))) (fun (_u : int) -> ((Base_dCommon.v_bind (v_checkScopedUnit u)) (fun (_u : int) -> ((Base_dCommon.v_bind (v_validateTyDecls (u).Vuna_dIr_dModel.f_IrUnit_irUnitTyDecls)) (fun (_u : int) -> (((v_checkBinderTys shared) (u).Vuna_dIr_dModel.f_IrUnit_irUnitTyDecls) defs))))))))))))))

# 87 "Vuna/Ir/Validate.vuna"
let v_validateProgram = (fun (p : Vuna_dIr_dModel.t_IrProgram) -> (let u = (p).Vuna_dIr_dModel.f_IrProgram_irProgUnit in (let shared = (p).Vuna_dIr_dModel.f_IrProgram_irProgShared in (let defs = ((B_dData_dList.v_concatMap Vuna_dIr_dModel.v_irGroupDefs) (u).Vuna_dIr_dModel.f_IrUnit_irUnitGroups) in (match (u).Vuna_dIr_dModel.f_IrUnit_irUnitEntry with
  | B_dData_dMaybe.C_Maybe_Nothing -> ((v_validateUnit shared) u)
  | B_dData_dMaybe.C_Maybe_Just (dtb__186) -> (if ((B_dData_dList.v_memName (dtb__186).Vuna_dIr_dModel.f_IrEntry_irEntryMain) ((B_dData_dList.v_map Vuna_dIr_dModel.v_irDefName) defs)) then ((v_validateUnit shared) u) else (Base_dDiag.v_icInternal (String.concat "" ["IR entry references an undefined main: `"; (dtb__186).Vuna_dIr_dModel.f_IrEntry_irEntryMain; "`"])))
  | _ -> failwith "DT: impossible branch"
)))))
