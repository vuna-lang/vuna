open Vuna_runtime
# 58 "Vuna/Compiler/Ir/Validate.vuna"
let rec v_firstMissingDep = (fun (mc0 : (string, bool) B_dContainer_dHashMap.t_HashMap) (mc1 : (string, bool) B_dContainer_dHashMap.t_HashMap) (mc2 : string) (mc3 : string B_dData_dList.t_List) -> (match mc3 with
  | B_dData_dList.C_List__x58__x58_ (dtb__0, dtb__1) -> (if ((((B_dContainer_dHashMap.v_member B_dData_dString.v_Hashable_uString) B_dData_dString.v_Eq_uString) dtb__0) mc0) then (if ((((B_dContainer_dHashMap.v_member B_dData_dString.v_Hashable_uString) B_dData_dString.v_Eq_uString) dtb__0) mc1) then ((((v_firstMissingDep mc0) mc1) mc2) dtb__1) else (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = mc2; B_dData_dPair.f_Pair_second = dtb__0 }))) else ((((v_firstMissingDep mc0) mc1) mc2) dtb__1))
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 51 "Vuna/Compiler/Ir/Validate.vuna"
let rec v_firstUnorderedDepGo = (fun (mc0 : (string, bool) B_dContainer_dHashMap.t_HashMap) (mc1 : (string, bool) B_dContainer_dHashMap.t_HashMap) (mc2 : Ir_dModel.t_IrDef B_dData_dList.t_List) -> (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__2, dtb__3) -> (match ((((v_firstMissingDep mc0) mc1) (Ir_dModel.v_irDefName dtb__2)) (Ir_dModel.v_irDefDeps dtb__2)) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__4) -> (B_dData_dMaybe.C_Maybe_Just (dtb__4))
  | B_dData_dMaybe.C_Maybe_Nothing -> (((v_firstUnorderedDepGo mc0) mc1) dtb__3)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 48 "Vuna/Compiler/Ir/Validate.vuna"
let v_firstUnorderedDep = (fun (nameTbl : (string, bool) B_dContainer_dHashMap.t_HashMap) (visible : (string, bool) B_dContainer_dHashMap.t_HashMap) (defs : Ir_dModel.t_IrDef B_dData_dList.t_List) -> (((v_firstUnorderedDepGo nameTbl) visible) defs))

# 36 "Vuna/Compiler/Ir/Validate.vuna"
let rec v_checkGroupOrderGo = (fun (mc0 : Ir_dModel.t_IrGroup B_dData_dList.t_List) (mc1 : (string, bool) B_dContainer_dHashMap.t_HashMap) (mc2 : (string, bool) B_dContainer_dHashMap.t_HashMap) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__5, dtb__6) -> ((fun members -> ((fun visible -> (match (((v_firstUnorderedDep mc2) visible) members) with
  | B_dData_dMaybe.C_Maybe_Nothing -> (((v_checkGroupOrderGo dtb__6) visible) mc2)
  | B_dData_dMaybe.C_Maybe_Just (dtb__7) -> (Base_dDiag.v_icInternal (String.concat "" ["IR group order is inconsistent: `"; (B_dData_dPair.v_secondOf dtb__7); "` referenced before it is defined (group of `"; (B_dData_dPair.v_firstOf dtb__7); "`)"]))
  | _ -> failwith "DT: impossible branch"
)) (((B_dData_dList.v_foldl (fun (acc : (string, bool) B_dContainer_dHashMap.t_HashMap) (d : Ir_dModel.t_IrDef) -> ((((B_dContainer_dHashMap.v_insert B_dData_dString.v_Hashable_uString) (Ir_dModel.v_irDefName d)) true) acc))) mc1) members))) (Ir_dModel.v_irGroupDefs dtb__5))
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (0))
  | _ -> failwith "DT: impossible branch"
))

# 33 "Vuna/Compiler/Ir/Validate.vuna"
let v_checkGroupOrder = (fun (groups : Ir_dModel.t_IrGroup B_dData_dList.t_List) (nameTbl : (string, bool) B_dContainer_dHashMap.t_HashMap) -> (((v_checkGroupOrderGo groups) ((B_dContainer_dHashMap.v_fromList B_dData_dString.v_Hashable_uString) B_dData_dList.C_List_Nil)) nameTbl))

# 71 "Vuna/Compiler/Ir/Validate.vuna"
let rec v_checkSymbolRefs = (fun (mc0 : (string, int B_dData_dMaybe.t_Maybe) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__8, dtb__9) -> (match (Ir_dRuntime.v_irRtLookup (B_dData_dPair.v_firstOf dtb__8)) with
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.v_icInternal (String.concat "" ["IR references an undeclared runtime symbol: `"; (B_dData_dPair.v_firstOf dtb__8); "`"]))
  | B_dData_dMaybe.C_Maybe_Just (dtb__10) -> (match (B_dData_dPair.v_secondOf dtb__8) with
  | B_dData_dMaybe.C_Maybe_Nothing -> (v_checkSymbolRefs dtb__9)
  | B_dData_dMaybe.C_Maybe_Just (dtb__11) -> (if (if (dtb__11 > 0) then ((Ir_dModel.v_irInlineArity (B_dData_dPair.v_firstOf dtb__8)) = dtb__11) else false) then (v_checkSymbolRefs dtb__9) else (Base_dDiag.v_icInternal (String.concat "" ["IR saturated runtime symbol `"; (B_dData_dPair.v_firstOf dtb__8); "` has the wrong arity ("; (bi_strFromInt dtb__11); ")"])))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (0))
  | _ -> failwith "DT: impossible branch"
))

# 140 "Vuna/Compiler/Ir/Validate.vuna"
let rec v_irTyArrowArity = (fun (mc0 : Ir_dModel.t_IrTy) -> (match mc0 with
  | Ir_dModel.C_IrTy_IrTyFun (dtb__12, dtb__13) -> (1 + (v_irTyArrowArity dtb__13))
  | _ -> 0
))

# 122 "Vuna/Compiler/Ir/Validate.vuna"
let v_checkDefArityVsSig = (fun (d : Ir_dModel.t_IrDef) -> (match (Ir_dModel.v_irDefExtern d) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__14) -> (Base_dDiag.C_Check_OkC (0))
  | B_dData_dMaybe.C_Maybe_Nothing -> (match (Ir_dModel.v_irDefTy d) with
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.C_Check_OkC (0))
  | B_dData_dMaybe.C_Maybe_Just (dtb__15) -> ((fun arrows -> (if (if ((Ir_dModel.v_irDefArity d) = 0) then true else (arrows = 0)) then (Base_dDiag.C_Check_OkC (0)) else (if ((Ir_dModel.v_irDefArity d) <= arrows) then (Base_dDiag.C_Check_OkC (0)) else (Base_dDiag.v_icInternal (String.concat "" ["definition `"; (Ir_dModel.v_irDefName d); "` has "; (bi_strFromInt (Ir_dModel.v_irDefArity d)); " runtime parameters but its signature has "; (bi_strFromInt arrows)]))))) (v_irTyArrowArity dtb__15))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 224 "Vuna/Compiler/Ir/Validate.vuna"
let rec v_countKeptFlags = (fun (mc0 : bool B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__16, dtb__17) -> (if dtb__16 then (1 + (v_countKeptFlags dtb__17)) else (v_countKeptFlags dtb__17))
  | B_dData_dList.C_List_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))

# 212 "Vuna/Compiler/Ir/Validate.vuna"
let v_checkCtorArity = (fun (shared : Ir_dModel.t_IrShared) (family : string) (ctor : string) (nargs : int) -> ((fun nd_uscrut4 -> (match nd_uscrut4 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__18) -> (match dtb__18 with
  | { B_dData_dPair.f_Pair_first = dtb__19; B_dData_dPair.f_Pair_second = dtb__20 } -> (if (dtb__19 = family) then ((fun n -> (if (nargs = n) then (Base_dDiag.C_Check_OkC (0)) else (Base_dDiag.v_icInternal (String.concat "" ["constructor `"; ctor; "` has "; (bi_strFromInt nargs); " runtime arguments, expected "; (bi_strFromInt n)])))) (v_countKeptFlags dtb__20)) else (Base_dDiag.v_icInternal (String.concat "" ["constructor `"; ctor; "` belongs to family `"; dtb__19; "`, not `"; family; "`"])))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.v_icInternal (String.concat "" ["IR references an undeclared constructor: `"; ctor; "`"]))
  | _ -> failwith "DT: impossible branch"
)) ((Ir_dModel.v_irSharedCtorShapeOf ctor) (shared).Ir_dModel.f_IrShared_irSharedCtorShapes)))

# 319 "Vuna/Compiler/Ir/Validate.vuna"
let rec v_tyDeclArityOf = (fun (mc0 : Ir_dModel.t_IrTyDecl B_dData_dList.t_List) (mc1 : string) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__21, dtb__22) -> (match dtb__21 with
  | Ir_dModel.C_IrTyDecl_IrUnboxedDecl (dtb__23, dtb__24, dtb__25) -> (if (dtb__23 = mc1) then (B_dData_dMaybe.C_Maybe_Just (dtb__24)) else ((v_tyDeclArityOf dtb__22) mc1))
  | Ir_dModel.C_IrTyDecl_IrRecordDecl (dtb__26, dtb__27, dtb__28, dtb__29) -> (if (dtb__26 = mc1) then (B_dData_dMaybe.C_Maybe_Just (dtb__27)) else ((v_tyDeclArityOf dtb__22) mc1))
  | Ir_dModel.C_IrTyDecl_IrVariantDecl (dtb__30, dtb__31, dtb__32) -> (if (dtb__30 = mc1) then (B_dData_dMaybe.C_Maybe_Just (dtb__31)) else ((v_tyDeclArityOf dtb__22) mc1))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 328 "Vuna/Compiler/Ir/Validate.vuna"
let rec v_listLength = (fun mc0 -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__33, dtb__34) -> (1 + (v_listLength dtb__34))
  | B_dData_dList.C_List_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))

# 260 "Vuna/Compiler/Ir/Validate.vuna"
let rec v_checkTyArityIn = (fun (mc0 : Ir_dModel.t_IrTyDecl B_dData_dList.t_List) (mc1 : int B_dData_dMaybe.t_Maybe) (mc2 : Ir_dModel.t_IrTy) -> (match mc2 with
  | Ir_dModel.C_IrTy_IrTyData (dtb__35, dtb__36) -> (match ((v_tyDeclArityOf mc0) dtb__35) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__37) -> (if ((v_listLength dtb__36) = dtb__37) then (((v_checkTyArityListIn mc0) mc1) dtb__36) else (Base_dDiag.v_icInternal (String.concat "" ["binder type annotation has the wrong type argument count for `"; dtb__35; "` (expected "; (bi_strFromInt dtb__37); ", got "; (bi_strFromInt (v_listLength dtb__36)); ")"])))
  | B_dData_dMaybe.C_Maybe_Nothing -> (((v_checkTyArityListIn mc0) mc1) dtb__36)
  | _ -> failwith "DT: impossible branch"
)
  | Ir_dModel.C_IrTy_IrTyFun (dtb__38, dtb__39) -> ((Base_dCommon.v_bind (((v_checkTyArityIn mc0) mc1) dtb__38)) (fun (_u : int) -> (((v_checkTyArityIn mc0) mc1) dtb__39)))
  | Ir_dModel.C_IrTy_IrTyRef (dtb__40) -> (((v_checkTyArityIn mc0) mc1) dtb__40)
  | Ir_dModel.C_IrTy_IrTyArray (dtb__41) -> (((v_checkTyArityIn mc0) mc1) dtb__41)
  | Ir_dModel.C_IrTy_IrTyOpaque -> (Base_dDiag.C_Check_OkC (0))
  | Ir_dModel.C_IrTy_IrTyFloat -> (Base_dDiag.C_Check_OkC (0))
  | Ir_dModel.C_IrTy_IrTyBool -> (Base_dDiag.C_Check_OkC (0))
  | Ir_dModel.C_IrTy_IrTyStr -> (Base_dDiag.C_Check_OkC (0))
  | Ir_dModel.C_IrTy_IrTyInt -> (Base_dDiag.C_Check_OkC (0))
  | Ir_dModel.C_IrTy_IrTyVar (dtb__42) -> (if (dtb__42 < 0) then (Base_dDiag.v_icInternal "negative runtime type parameter slot") else (match mc1 with
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.C_Check_OkC (0))
  | B_dData_dMaybe.C_Maybe_Just (dtb__43) -> (if (dtb__42 < dtb__43) then (Base_dDiag.C_Check_OkC (0)) else (Base_dDiag.v_icInternal (String.concat "" ["runtime type parameter slot "; (bi_strFromInt dtb__42); " is out of range (declaration has "; (bi_strFromInt dtb__43); " type parameters)"])))
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
))
# 290 "Vuna/Compiler/Ir/Validate.vuna"
and v_checkTyArityListIn = (fun (mc0 : Ir_dModel.t_IrTyDecl B_dData_dList.t_List) (mc1 : int B_dData_dMaybe.t_Maybe) (mc2 : Ir_dModel.t_IrTy B_dData_dList.t_List) -> (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__44, dtb__45) -> ((Base_dCommon.v_bind (((v_checkTyArityIn mc0) mc1) dtb__44)) (fun (_u : int) -> (((v_checkTyArityListIn mc0) mc1) dtb__45)))
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (0))
  | _ -> failwith "DT: impossible branch"
))

# 255 "Vuna/Compiler/Ir/Validate.vuna"
let v_checkTyArity = (fun (decls : Ir_dModel.t_IrTyDecl B_dData_dList.t_List) (ty : Ir_dModel.t_IrTy) -> (((v_checkTyArityIn decls) B_dData_dMaybe.C_Maybe_Nothing) ty))

# 144 "Vuna/Compiler/Ir/Validate.vuna"
let v_checkDefTy = (fun (mc0 : Ir_dModel.t_IrTyDecl B_dData_dList.t_List) (mc1 : string) (mc2 : Ir_dModel.t_IrTy B_dData_dMaybe.t_Maybe) -> (match mc2 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__46) -> (match ((v_checkTyArity mc0) dtb__46) with
  | Base_dDiag.C_Check_ErrC (dtb__47) -> (Base_dDiag.v_icInternal (String.concat "" ["definition `"; mc1; "` has an invalid runtime signature"]))
  | Base_dDiag.C_Check_OkC (dtb__48) -> (Base_dDiag.C_Check_OkC (dtb__48))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.C_Check_OkC (0))
  | _ -> failwith "DT: impossible branch"
))

# 228 "Vuna/Compiler/Ir/Validate.vuna"
let v_checkIrTyM = (fun (mc0 : Ir_dModel.t_IrTyDecl B_dData_dList.t_List) (mc1 : Ir_dModel.t_IrTy B_dData_dMaybe.t_Maybe) -> (match mc1 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__49) -> ((v_checkTyArity mc0) dtb__49)
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.C_Check_OkC (0))
  | _ -> failwith "DT: impossible branch"
))

# 184 "Vuna/Compiler/Ir/Validate.vuna"
let v_checkAppTyM = (fun (mc0 : Ir_dModel.t_IrTyDecl B_dData_dList.t_List) (mc1 : (Ir_dModel.t_IrTy, Ir_dModel.t_IrTy) B_dData_dPair.t_Pair B_dData_dMaybe.t_Maybe) -> (match mc1 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__50) -> ((Base_dCommon.v_bind ((v_checkIrTyM mc0) (B_dData_dMaybe.C_Maybe_Just ((B_dData_dPair.v_firstOf dtb__50))))) (fun (_u : int) -> ((v_checkIrTyM mc0) (B_dData_dMaybe.C_Maybe_Just ((B_dData_dPair.v_secondOf dtb__50))))))
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.C_Check_OkC (0))
  | _ -> failwith "DT: impossible branch"
))

# 232 "Vuna/Compiler/Ir/Validate.vuna"
let rec v_checkBinderTysOf = (fun (mc0 : Ir_dModel.t_IrTyDecl B_dData_dList.t_List) (mc1 : Ir_dModel.t_IrBinder B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__51, dtb__52) -> (if (dtb__51).Ir_dModel.f_IrBinder_irBinderErased then (match (dtb__51).Ir_dModel.f_IrBinder_irBinderTy with
  | B_dData_dMaybe.C_Maybe_Nothing -> ((v_checkBinderTysOf mc0) dtb__52)
  | B_dData_dMaybe.C_Maybe_Just (dtb__53) -> (Base_dDiag.v_icInternal "erased binder carries a runtime type annotation")
  | _ -> failwith "DT: impossible branch"
) else (match (dtb__51).Ir_dModel.f_IrBinder_irBinderTy with
  | B_dData_dMaybe.C_Maybe_Nothing -> ((v_checkBinderTysOf mc0) dtb__52)
  | B_dData_dMaybe.C_Maybe_Just (dtb__54) -> ((Base_dCommon.v_bind ((v_checkTyArity mc0) dtb__54)) (fun (_u : int) -> ((v_checkBinderTysOf mc0) dtb__52)))
  | _ -> failwith "DT: impossible branch"
))
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (0))
  | _ -> failwith "DT: impossible branch"
))

# 244 "Vuna/Compiler/Ir/Validate.vuna"
let rec v_checkAltBinderTys = (fun (mc0 : Ir_dModel.t_IrTyDecl B_dData_dList.t_List) (mc1 : Ir_dModel.t_IrAlt B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__55, dtb__56) -> ((Base_dCommon.v_bind ((v_checkBinderTysOf mc0) (Ir_dModel.v_irAltBindersOf dtb__55))) (fun (_u : int) -> ((v_checkAltBinderTys mc0) dtb__56)))
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (0))
  | _ -> failwith "DT: impossible branch"
))

# 251 "Vuna/Compiler/Ir/Validate.vuna"
let v_checkAltBinderTysM = (fun (mc0 : Ir_dModel.t_IrTyDecl B_dData_dList.t_List) (mc1 : Ir_dModel.t_IrAlt B_dData_dMaybe.t_Maybe) -> (match mc1 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__57) -> ((v_checkBinderTysOf mc0) (Ir_dModel.v_irAltBindersOf dtb__57))
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.C_Check_OkC (0))
  | _ -> failwith "DT: impossible branch"
))

# 287 "Vuna/Compiler/Ir/Validate.vuna"
let v_checkTyArityList = (fun (decls : Ir_dModel.t_IrTyDecl B_dData_dList.t_List) (tys : Ir_dModel.t_IrTy B_dData_dList.t_List) -> (((v_checkTyArityListIn decls) B_dData_dMaybe.C_Maybe_Nothing) tys))

# 206 "Vuna/Compiler/Ir/Validate.vuna"
let v_checkTyArityListM = (fun (mc0 : Ir_dModel.t_IrTyDecl B_dData_dList.t_List) (mc1 : Ir_dModel.t_IrTy B_dData_dList.t_List B_dData_dMaybe.t_Maybe) -> (match mc1 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__58) -> ((v_checkTyArityList mc0) dtb__58)
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.C_Check_OkC (0))
  | _ -> failwith "DT: impossible branch"
))

# 191 "Vuna/Compiler/Ir/Validate.vuna"
let v_checkCtorTys = (fun (shared : Ir_dModel.t_IrShared) (decls : Ir_dModel.t_IrTyDecl B_dData_dList.t_List) (family : string) (ctor : string) (tys : Ir_dModel.t_IrTy B_dData_dList.t_List B_dData_dMaybe.t_Maybe) (nargs : int) -> ((Base_dCommon.v_bind ((v_checkTyArityListM decls) tys)) (fun (_u : int) -> ((fun typeArityOk -> (if typeArityOk then ((((v_checkCtorArity shared) family) ctor) nargs) else (Base_dDiag.v_icInternal (String.concat "" ["constructor application has the wrong runtime type argument count for `"; family; "`"])))) (match ((v_tyDeclArityOf decls) family) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__59) -> (match tys with
  | B_dData_dMaybe.C_Maybe_Just (dtb__60) -> ((v_listLength dtb__60) = dtb__59)
  | B_dData_dMaybe.C_Maybe_Nothing -> true
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> true
  | _ -> failwith "DT: impossible branch"
)))))

# 160 "Vuna/Compiler/Ir/Validate.vuna"
let rec v_checkNodeBinderTys = (fun (shared : Ir_dModel.t_IrShared) (decls : Ir_dModel.t_IrTyDecl B_dData_dList.t_List) (ir : Ir_dModel.t_Ir) -> (match ir with
  | Ir_dModel.C_Ir_IrLam (dtb__61, dtb__62, dtb__63) -> ((Base_dCommon.v_bind ((v_checkBinderTysOf decls) dtb__61)) (fun (_u : int) -> ((v_checkIrTyM decls) dtb__62)))
  | Ir_dModel.C_Ir_IrLet (dtb__64, dtb__65, dtb__66) -> ((v_checkBinderTysOf decls) dtb__64)
  | Ir_dModel.C_Ir_IrCase (dtb__67, dtb__68, dtb__69, dtb__70) -> ((Base_dCommon.v_bind ((v_checkIrTyM decls) dtb__67)) (fun (_u : int) -> ((Base_dCommon.v_bind ((v_checkIrTyM decls) dtb__68)) (fun (_u : int) -> ((v_checkAltBinderTys decls) dtb__70)))))
  | Ir_dModel.C_Ir_IrApp (dtb__71, dtb__72, dtb__73) -> ((v_checkAppTyM decls) dtb__71)
  | Ir_dModel.C_Ir_IrCtor (dtb__74, dtb__75, dtb__76, dtb__77) -> ((((((v_checkCtorTys shared) decls) dtb__74) dtb__75) dtb__76) (v_listLength dtb__77))
  | Ir_dModel.C_Ir_IrRecord (dtb__78, dtb__79, dtb__80) -> ((v_checkIrTyM decls) dtb__79)
  | Ir_dModel.C_Ir_IrProj (dtb__81, dtb__82, dtb__83, dtb__84) -> ((v_checkIrTyM decls) dtb__84)
  | Ir_dModel.C_Ir_IrRecUpd (dtb__85, dtb__86, dtb__87, dtb__88) -> ((v_checkIrTyM decls) dtb__88)
  | Ir_dModel.C_Ir_IrNatCase (dtb__89, dtb__90, dtb__91, dtb__92, dtb__93) -> ((Base_dCommon.v_bind ((v_checkAltBinderTysM decls) dtb__91)) (fun (_u : int) -> ((Base_dCommon.v_bind ((v_checkAltBinderTysM decls) dtb__92)) (fun (_u : int) -> ((v_checkAltBinderTysM decls) dtb__93)))))
  | Ir_dModel.C_Ir_IrCast (dtb__94, dtb__95, dtb__96) -> ((Base_dCommon.v_bind ((v_checkIrTyM decls) dtb__94)) (fun (_u : int) -> ((v_checkIrTyM decls) dtb__95)))
  | Ir_dModel.C_Ir_IrTail (dtb__97) -> (((v_checkNodeBinderTys shared) decls) dtb__97)
  | _ -> (Base_dDiag.C_Check_OkC (0))
))

# 312 "Vuna/Compiler/Ir/Validate.vuna"
let rec v_checkDeclCtorSlots = (fun (mc0 : Ir_dModel.t_IrTyDecl B_dData_dList.t_List) (mc1 : string) (mc2 : int) (mc3 : (string, Ir_dModel.t_IrTy B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc3 with
  | B_dData_dList.C_List__x58__x58_ (dtb__98, dtb__99) -> (match dtb__98 with
  | { B_dData_dPair.f_Pair_first = dtb__100; B_dData_dPair.f_Pair_second = dtb__101 } -> ((Base_dCommon.v_bind (((v_checkTyArityListIn mc0) (B_dData_dMaybe.C_Maybe_Just (mc2))) dtb__101)) (fun (_u : int) -> ((((v_checkDeclCtorSlots mc0) mc1) mc2) dtb__99)))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (0))
  | _ -> failwith "DT: impossible branch"
))

# 307 "Vuna/Compiler/Ir/Validate.vuna"
let v_checkDeclSlots = (fun (mc0 : Ir_dModel.t_IrTyDecl B_dData_dList.t_List) (mc1 : Ir_dModel.t_IrTyDecl) -> (match mc1 with
  | Ir_dModel.C_IrTyDecl_IrUnboxedDecl (dtb__102, dtb__103, dtb__104) -> (((v_checkTyArityIn mc0) (B_dData_dMaybe.C_Maybe_Just (dtb__103))) dtb__104)
  | Ir_dModel.C_IrTyDecl_IrRecordDecl (dtb__105, dtb__106, dtb__107, dtb__108) -> (((v_checkTyArityListIn mc0) (B_dData_dMaybe.C_Maybe_Just (dtb__106))) dtb__108)
  | Ir_dModel.C_IrTyDecl_IrVariantDecl (dtb__109, dtb__110, dtb__111) -> ((((v_checkDeclCtorSlots mc0) dtb__109) dtb__110) dtb__111)
  | _ -> failwith "DT: impossible branch"
))

# 302 "Vuna/Compiler/Ir/Validate.vuna"
let rec v_validateTyDeclsGo = (fun (mc0 : Ir_dModel.t_IrTyDecl B_dData_dList.t_List) (mc1 : Ir_dModel.t_IrTyDecl B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__112, dtb__113) -> ((Base_dCommon.v_bind ((v_checkDeclSlots mc0) dtb__112)) (fun (_u : int) -> ((v_validateTyDeclsGo mc0) dtb__113)))
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (0))
  | _ -> failwith "DT: impossible branch"
))

# 299 "Vuna/Compiler/Ir/Validate.vuna"
let v_validateTyDecls = (fun (decls : Ir_dModel.t_IrTyDecl B_dData_dList.t_List) -> ((v_validateTyDeclsGo decls) decls))

# 354 "Vuna/Compiler/Ir/Validate.vuna"
let v_scopedFuelOf = (fun (body : Ir_dModel.t_Ir) -> ((8 * (Ir_dModel.v_irSize body)) + 64))

# 393 "Vuna/Compiler/Ir/Validate.vuna"
let v_maybeAlts = (fun (mc0 : Ir_dModel.t_IrAlt B_dData_dMaybe.t_Maybe) -> (match mc0 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__114) -> (B_dData_dList.C_List__x58__x58_ (dtb__114, B_dData_dList.C_List_Nil))
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 397 "Vuna/Compiler/Ir/Validate.vuna"
let rec v_altWork = (fun (mc0 : Ir_dModel.t_IrBinder B_dData_dList.t_List) (mc1 : Ir_dModel.t_IrAlt B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__115, dtb__116) -> (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = ((B_dData_dList.v_append (Ir_dModel.v_irAltBindersOf dtb__115)) mc0); B_dData_dPair.f_Pair_second = (Ir_dModel.v_irAltBodyOf dtb__115) }, ((v_altWork mc0) dtb__116)))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 370 "Vuna/Compiler/Ir/Validate.vuna"
let v_scopedChildren = (fun (scope : Ir_dModel.t_IrBinder B_dData_dList.t_List) (ir : Ir_dModel.t_Ir) -> (match ir with
  | Ir_dModel.C_Ir_IrCtor (dtb__117, dtb__118, dtb__119, dtb__120) -> ((B_dData_dList.v_map (fun (a : Ir_dModel.t_Ir) -> { B_dData_dPair.f_Pair_first = scope; B_dData_dPair.f_Pair_second = a })) dtb__120)
  | Ir_dModel.C_Ir_IrRecord (dtb__121, dtb__122, dtb__123) -> ((B_dData_dList.v_map (fun (p : (string, Ir_dModel.t_Ir) B_dData_dPair.t_Pair) -> { B_dData_dPair.f_Pair_first = scope; B_dData_dPair.f_Pair_second = (B_dData_dPair.v_secondOf p) })) dtb__123)
  | Ir_dModel.C_Ir_IrProj (dtb__124, dtb__125, dtb__126, dtb__127) -> (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = scope; B_dData_dPair.f_Pair_second = dtb__124 }, B_dData_dList.C_List_Nil))
  | Ir_dModel.C_Ir_IrRecUpd (dtb__128, dtb__129, dtb__130, dtb__131) -> (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = scope; B_dData_dPair.f_Pair_second = dtb__128 }, ((B_dData_dList.v_map (fun (p : (string, Ir_dModel.t_Ir) B_dData_dPair.t_Pair) -> { B_dData_dPair.f_Pair_first = scope; B_dData_dPair.f_Pair_second = (B_dData_dPair.v_secondOf p) })) dtb__130)))
  | Ir_dModel.C_Ir_IrRtApp (dtb__132, dtb__133) -> ((B_dData_dList.v_map (fun (a : Ir_dModel.t_Ir) -> { B_dData_dPair.f_Pair_first = scope; B_dData_dPair.f_Pair_second = a })) dtb__133)
  | Ir_dModel.C_Ir_IrCast (dtb__134, dtb__135, dtb__136) -> (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = scope; B_dData_dPair.f_Pair_second = dtb__136 }, B_dData_dList.C_List_Nil))
  | Ir_dModel.C_Ir_IrLet (dtb__137, dtb__138, dtb__139) -> (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = scope; B_dData_dPair.f_Pair_second = dtb__138 }, (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = ((B_dData_dList.v_append dtb__137) scope); B_dData_dPair.f_Pair_second = dtb__139 }, B_dData_dList.C_List_Nil))))
  | Ir_dModel.C_Ir_IrLam (dtb__140, dtb__141, dtb__142) -> (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = ((B_dData_dList.v_append dtb__140) scope); B_dData_dPair.f_Pair_second = dtb__142 }, B_dData_dList.C_List_Nil))
  | Ir_dModel.C_Ir_IrApp (dtb__143, dtb__144, dtb__145) -> (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = scope; B_dData_dPair.f_Pair_second = dtb__144 }, (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = scope; B_dData_dPair.f_Pair_second = dtb__145 }, B_dData_dList.C_List_Nil))))
  | Ir_dModel.C_Ir_IrIf (dtb__146, dtb__147, dtb__148) -> (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = scope; B_dData_dPair.f_Pair_second = dtb__146 }, (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = scope; B_dData_dPair.f_Pair_second = dtb__147 }, (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = scope; B_dData_dPair.f_Pair_second = dtb__148 }, B_dData_dList.C_List_Nil))))))
  | Ir_dModel.C_Ir_IrCase (dtb__149, dtb__150, dtb__151, dtb__152) -> (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = scope; B_dData_dPair.f_Pair_second = dtb__151 }, ((v_altWork scope) dtb__152)))
  | Ir_dModel.C_Ir_IrNatCase (dtb__153, dtb__154, dtb__155, dtb__156, dtb__157) -> ((B_dData_dList.v_append (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = scope; B_dData_dPair.f_Pair_second = dtb__153 }, B_dData_dList.C_List_Nil))) ((B_dData_dList.v_append ((v_altWork scope) (v_maybeAlts dtb__155))) ((B_dData_dList.v_append ((v_altWork scope) (v_maybeAlts dtb__156))) ((v_altWork scope) (v_maybeAlts dtb__157)))))
  | Ir_dModel.C_Ir_IrConcatMany (dtb__158) -> ((B_dData_dList.v_map (fun (a : Ir_dModel.t_Ir) -> { B_dData_dPair.f_Pair_first = scope; B_dData_dPair.f_Pair_second = a })) dtb__158)
  | Ir_dModel.C_Ir_IrEffThunk (dtb__159, dtb__160, dtb__161, dtb__162, dtb__163) -> (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = scope; B_dData_dPair.f_Pair_second = dtb__163 }, B_dData_dList.C_List_Nil))
  | Ir_dModel.C_Ir_IrTail (dtb__164) -> (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = scope; B_dData_dPair.f_Pair_second = dtb__164 }, B_dData_dList.C_List_Nil))
  | _ -> B_dData_dList.C_List_Nil
))

# 151 "Vuna/Compiler/Ir/Validate.vuna"
let rec v_checkBinderTysWork = (fun (shared : Ir_dModel.t_IrShared) (fuel : int) (decls : Ir_dModel.t_IrTyDecl B_dData_dList.t_List) (work : Ir_dModel.t_Ir B_dData_dList.t_List) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "ir-binder-ty") else (match work with
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (0))
  | B_dData_dList.C_List__x58__x58_ (dtb__165, dtb__166) -> ((Base_dCommon.v_bind (((v_checkNodeBinderTys shared) decls) dtb__165)) (fun (_u : int) -> ((((v_checkBinderTysWork shared) (fuel - 1)) decls) ((B_dData_dList.v_append ((B_dData_dList.v_map B_dData_dPair.v_secondOf) ((v_scopedChildren B_dData_dList.C_List_Nil) dtb__165))) dtb__166))))
  | _ -> failwith "DT: impossible branch"
)))

# 106 "Vuna/Compiler/Ir/Validate.vuna"
let rec v_checkBinderTys = (fun (mc0 : Ir_dModel.t_IrShared) (mc1 : Ir_dModel.t_IrTyDecl B_dData_dList.t_List) (mc2 : Ir_dModel.t_IrDef B_dData_dList.t_List) -> (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__167, dtb__168) -> ((Base_dCommon.v_bind (((v_checkDefTy mc1) (Ir_dModel.v_irDefName dtb__167)) (Ir_dModel.v_irDefTy dtb__167))) (fun (_u : int) -> ((Base_dCommon.v_bind (v_checkDefArityVsSig dtb__167)) (fun (_u : int) -> (match (Ir_dModel.v_irDefBody dtb__167) with
  | B_dData_dMaybe.C_Maybe_Nothing -> (((v_checkBinderTys mc0) mc1) dtb__168)
  | B_dData_dMaybe.C_Maybe_Just (dtb__169) -> ((Base_dCommon.v_bind ((((v_checkBinderTysWork mc0) ((8 * (Ir_dModel.v_irSize dtb__169)) + 64)) mc1) (B_dData_dList.C_List__x58__x58_ (dtb__169, B_dData_dList.C_List_Nil)))) (fun (_u : int) -> (((v_checkBinderTys mc0) mc1) dtb__168)))
  | _ -> failwith "DT: impossible branch"
)))))
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (0))
  | _ -> failwith "DT: impossible branch"
))

# 410 "Vuna/Compiler/Ir/Validate.vuna"
let v_sameBName = (fun (mc0 : Ir_dModel.t_IrBName) (mc1 : Ir_dModel.t_IrBName) -> (match mc0 with
  | Ir_dModel.C_IrBName_IrBWild -> (match mc1 with
  | Ir_dModel.C_IrBName_IrBWild -> true
  | _ -> false
)
  | Ir_dModel.C_IrBName_IrBNat (dtb__170) -> (match mc1 with
  | Ir_dModel.C_IrBName_IrBNat (dtb__171) -> (dtb__170 = dtb__171)
  | _ -> false
)
  | Ir_dModel.C_IrBName_IrBArm (dtb__172) -> (match mc1 with
  | Ir_dModel.C_IrBName_IrBArm (dtb__173) -> (dtb__172 = dtb__173)
  | _ -> false
)
  | Ir_dModel.C_IrBName_IrBUser (dtb__174) -> (match mc1 with
  | Ir_dModel.C_IrBName_IrBUser (dtb__175) -> (dtb__174 = dtb__175)
  | _ -> false
)
  | _ -> failwith "DT: impossible branch"
))

# 406 "Vuna/Compiler/Ir/Validate.vuna"
let v_sameBinder = (fun (b1 : Ir_dModel.t_IrBinder) (b2 : Ir_dModel.t_IrBinder) -> (if (((B_dTrait_dEq.v__x61__x61_ B_dTrait_dEq.v_Eq_uBase_uData_uBool_uBool) (b1).Ir_dModel.f_IrBinder_irBinderErased) (b2).Ir_dModel.f_IrBinder_irBinderErased) then ((v_sameBName (b1).Ir_dModel.f_IrBinder_irBinderName) (b2).Ir_dModel.f_IrBinder_irBinderName) else false))

# 402 "Vuna/Compiler/Ir/Validate.vuna"
let rec v_memBinder = (fun (mc0 : Ir_dModel.t_IrBinder) (mc1 : Ir_dModel.t_IrBinder B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__176, dtb__177) -> (if ((v_sameBinder mc0) dtb__176) then true else ((v_memBinder mc0) dtb__177))
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 357 "Vuna/Compiler/Ir/Validate.vuna"
let rec v_checkScopedWork = (fun (fuel : int) (work : (Ir_dModel.t_IrBinder B_dData_dList.t_List, Ir_dModel.t_Ir) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "ir-scope") else ((fun nd_uscrut2 -> (match nd_uscrut2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__178, dtb__179) -> (match dtb__178 with
  | { B_dData_dPair.f_Pair_first = dtb__180; B_dData_dPair.f_Pair_second = dtb__181 } -> (match dtb__181 with
  | Ir_dModel.C_Ir_IrVar (dtb__182) -> (if (dtb__182).Ir_dModel.f_IrBinder_irBinderErased then (Base_dDiag.v_icInternal "erased binder reached runtime IR") else (if ((v_memBinder dtb__182) dtb__180) then ((v_checkScopedWork (fuel - 1)) dtb__179) else (Base_dDiag.v_icInternal "IR variable references a binder outside its scope")))
  | _ -> ((v_checkScopedWork (fuel - 1)) ((B_dData_dList.v_append ((v_scopedChildren dtb__180) dtb__181)) dtb__179))
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (0))
  | _ -> failwith "DT: impossible branch"
)) work)))

# 344 "Vuna/Compiler/Ir/Validate.vuna"
let rec v_checkScopedDefs = (fun (mc0 : Ir_dModel.t_IrDef B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__183, dtb__184) -> (match (Ir_dModel.v_irDefBody dtb__183) with
  | B_dData_dMaybe.C_Maybe_Nothing -> (v_checkScopedDefs dtb__184)
  | B_dData_dMaybe.C_Maybe_Just (dtb__185) -> ((Base_dCommon.v_bind ((v_checkScopedWork ((v_scopedFuelOf dtb__185) + 1)) (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = dtb__185 }, B_dData_dList.C_List_Nil)))) (fun (_u : int) -> (v_checkScopedDefs dtb__184)))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (0))
  | _ -> failwith "DT: impossible branch"
))

# 341 "Vuna/Compiler/Ir/Validate.vuna"
let v_checkScopedUnit = (fun (u : Ir_dModel.t_IrUnit) -> (v_checkScopedDefs ((B_dData_dList.v_concatMap Ir_dModel.v_irGroupDefs) (u).Ir_dModel.f_IrUnit_irUnitGroups)))

# 23 "Vuna/Compiler/Ir/Validate.vuna"
let v_validateUnit = (fun (shared : Ir_dModel.t_IrShared) (u : Ir_dModel.t_IrUnit) -> ((fun defs -> ((fun nameTbl -> ((Base_dCommon.v_bind (Ir_dAnalysis.v_checkUniqueDefNames defs)) (fun (_u : int) -> ((Base_dCommon.v_bind ((v_checkGroupOrder (u).Ir_dModel.f_IrUnit_irUnitGroups) nameTbl)) (fun (_u : int) -> ((Base_dCommon.v_bind (v_checkSymbolRefs (Ir_dRuntime.v_irSymbolsOfUnit u))) (fun (_u : int) -> ((Base_dCommon.v_bind (v_checkScopedUnit u)) (fun (_u : int) -> ((Base_dCommon.v_bind (v_validateTyDecls (u).Ir_dModel.f_IrUnit_irUnitTyDecls)) (fun (_u : int) -> (((v_checkBinderTys shared) (u).Ir_dModel.f_IrUnit_irUnitTyDecls) defs)))))))))))) (B_dContainer_dHashMap.v_ofNames ((B_dData_dList.v_map Ir_dModel.v_irDefName) defs)))) ((B_dData_dList.v_concatMap Ir_dModel.v_irGroupDefs) (u).Ir_dModel.f_IrUnit_irUnitGroups)))

# 87 "Vuna/Compiler/Ir/Validate.vuna"
let v_validateProgram = (fun (p : Ir_dModel.t_IrProgram) -> ((fun u -> ((fun shared -> ((fun defs -> (match (u).Ir_dModel.f_IrUnit_irUnitEntry with
  | B_dData_dMaybe.C_Maybe_Nothing -> ((v_validateUnit shared) u)
  | B_dData_dMaybe.C_Maybe_Just (dtb__186) -> (if ((B_dData_dList.v_memName (dtb__186).Ir_dModel.f_IrEntry_irEntryMain) ((B_dData_dList.v_map Ir_dModel.v_irDefName) defs)) then ((v_validateUnit shared) u) else (Base_dDiag.v_icInternal (String.concat "" ["IR entry references an undefined main: `"; (dtb__186).Ir_dModel.f_IrEntry_irEntryMain; "`"])))
  | _ -> failwith "DT: impossible branch"
)) ((B_dData_dList.v_concatMap Ir_dModel.v_irGroupDefs) (u).Ir_dModel.f_IrUnit_irUnitGroups))) (p).Ir_dModel.f_IrProgram_irProgShared)) (p).Ir_dModel.f_IrProgram_irProgUnit))
