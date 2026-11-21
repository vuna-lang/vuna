open Vuna_runtime
# 58 "Vuna/Ir/Validate.vuna"
let rec v_firstMissingDep = (fun (mc0 : (string, bool) B_dContainer_dHashMap.t_HashMap) (mc1 : (string, bool) B_dContainer_dHashMap.t_HashMap) (mc2 : string) (mc3 : string B_dData_dList.t_List) -> (match mc3 with
  | B_dData_dList.C_List__x58__x58_ (dtb__0, dtb__1) -> (if ((((B_dContainer_dHashMap.v_member B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) dtb__0) mc0) then (if ((((B_dContainer_dHashMap.v_member B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) dtb__0) mc1) then ((((v_firstMissingDep mc0) mc1) mc2) dtb__1) else (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = mc2; B_dData_dPair.f_Pair_second = dtb__0 }))) else ((((v_firstMissingDep mc0) mc1) mc2) dtb__1))
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
  | B_dData_dList.C_List__x58__x58_ (dtb__5, dtb__6) -> (let members = (Vuna_dIr_dModel.v_irGroupDefs dtb__5) in (let visible = (((B_dData_dList.v_foldl (fun (acc : (string, bool) B_dContainer_dHashMap.t_HashMap) (d : Vuna_dIr_dModel.t_IrDef) -> (((((B_dContainer_dHashMap.v_insert B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) (Vuna_dIr_dModel.v_irDefName d)) true) acc))) mc1) members) in (match (((v_firstUnorderedDep mc2) visible) members) with
  | B_dData_dMaybe.C_Maybe_Nothing -> (((v_checkGroupOrderGo dtb__6) visible) mc2)
  | B_dData_dMaybe.C_Maybe_Just (dtb__7) -> (Base_dDiag.v_icInternal (String.concat "" ["IR group order is inconsistent: `"; (B_dData_dPair.v_secondOf dtb__7); "` referenced before it is defined (group of `"; (B_dData_dPair.v_firstOf dtb__7); "`)"]))
  | _ -> failwith "DT: impossible branch"
)))
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (0))
  | _ -> failwith "DT: impossible branch"
))

# 33 "Vuna/Ir/Validate.vuna"
let v_checkGroupOrder = (fun (groups : Vuna_dIr_dModel.t_IrGroup B_dData_dList.t_List) (nameTbl : (string, bool) B_dContainer_dHashMap.t_HashMap) -> (((v_checkGroupOrderGo groups) (((B_dContainer_dHashMap.v_fromList B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) B_dData_dList.C_List_Nil)) nameTbl))

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

# 228 "Vuna/Ir/Validate.vuna"
let rec v_countKeptFlags = (fun (mc0 : bool B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__16, dtb__17) -> (if dtb__16 then (1 + (v_countKeptFlags dtb__17)) else (v_countKeptFlags dtb__17))
  | B_dData_dList.C_List_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))

# 216 "Vuna/Ir/Validate.vuna"
let v_checkCtorArity = (fun (shared : Vuna_dIr_dModel.t_IrShared) (family : string) (ctor : string) (nargs : int) -> (let nd_uscrut4 = ((Vuna_dIr_dModel.v_irSharedCtorShapeOf ctor) (shared).Vuna_dIr_dModel.f_IrShared_irSharedCtorShapes) in (match nd_uscrut4 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__18) -> (match dtb__18 with
  | { B_dData_dPair.f_Pair_first = dtb__19; B_dData_dPair.f_Pair_second = dtb__20 } -> (if (dtb__19 = family) then (let n = (v_countKeptFlags dtb__20) in (if (nargs = n) then (Base_dDiag.C_Check_OkC (0)) else (Base_dDiag.v_icInternal (String.concat "" ["constructor `"; ctor; "` has "; (bi_strFromInt nargs); " runtime arguments, expected "; (bi_strFromInt n)])))) else (Base_dDiag.v_icInternal (String.concat "" ["constructor `"; ctor; "` belongs to family `"; dtb__19; "`, not `"; family; "`"])))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.v_icInternal (String.concat "" ["IR references an undeclared constructor: `"; ctor; "`"]))
  | _ -> failwith "DT: impossible branch"
)))

# 242 "Vuna/Ir/Validate.vuna"
let rec v_anyErasedBinder = (fun (mc0 : Vuna_dIr_dModel.t_IrBinder B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__21, dtb__22) -> (if (dtb__21).Vuna_dIr_dModel.f_IrBinder_irBinderErased then true else (v_anyErasedBinder dtb__22))
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 263 "Vuna/Ir/Validate.vuna"
let rec v_memBinderId = (fun (mc0 : int) (mc1 : Vuna_dIr_dModel.t_IrBinder B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__23, dtb__24) -> (if (dtb__23).Vuna_dIr_dModel.f_IrBinder_irBinderErased then ((v_memBinderId mc0) dtb__24) else (if ((dtb__23).Vuna_dIr_dModel.f_IrBinder_irBinderId = mc0) then true else ((v_memBinderId mc0) dtb__24)))
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 251 "Vuna/Ir/Validate.vuna"
let rec v_checkBinderIds = (fun (mc0 : Vuna_dIr_dModel.t_IrBinder B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__25, dtb__26) -> (if (dtb__25).Vuna_dIr_dModel.f_IrBinder_irBinderErased then (v_checkBinderIds dtb__26) else (if ((dtb__25).Vuna_dIr_dModel.f_IrBinder_irBinderId = 0) then (Base_dDiag.v_icInternal "runtime binder has no stable id") else (if ((v_memBinderId (dtb__25).Vuna_dIr_dModel.f_IrBinder_irBinderId) dtb__26) then (Base_dDiag.v_icInternal "duplicate binder id in the same telescope") else (v_checkBinderIds dtb__26))))
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (0))
  | _ -> failwith "DT: impossible branch"
))

# 355 "Vuna/Ir/Validate.vuna"
let rec v_tyDeclArityOf = (fun (mc0 : Vuna_dIr_dModel.t_IrTyDecl B_dData_dList.t_List) (mc1 : string) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__27, dtb__28) -> (match dtb__27 with
  | Vuna_dIr_dModel.C_IrTyDecl_IrUnboxedDecl (dtb__29, dtb__30, dtb__31) -> (if (dtb__29 = mc1) then (B_dData_dMaybe.C_Maybe_Just (dtb__30)) else ((v_tyDeclArityOf dtb__28) mc1))
  | Vuna_dIr_dModel.C_IrTyDecl_IrRecordDecl (dtb__32, dtb__33, dtb__34, dtb__35) -> (if (dtb__32 = mc1) then (B_dData_dMaybe.C_Maybe_Just (dtb__33)) else ((v_tyDeclArityOf dtb__28) mc1))
  | Vuna_dIr_dModel.C_IrTyDecl_IrVariantDecl (dtb__36, dtb__37, dtb__38) -> (if (dtb__36 = mc1) then (B_dData_dMaybe.C_Maybe_Just (dtb__37)) else ((v_tyDeclArityOf dtb__28) mc1))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 364 "Vuna/Ir/Validate.vuna"
let rec v_listLength = (fun mc0 -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__39, dtb__40) -> (1 + (v_listLength dtb__40))
  | B_dData_dList.C_List_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))

# 296 "Vuna/Ir/Validate.vuna"
let rec v_checkTyArityIn = (fun (mc0 : Vuna_dIr_dModel.t_IrTyDecl B_dData_dList.t_List) (mc1 : int B_dData_dMaybe.t_Maybe) (mc2 : Vuna_dIr_dModel.t_IrTy) -> (match mc2 with
  | Vuna_dIr_dModel.C_IrTy_IrTyData (dtb__41, dtb__42) -> (match ((v_tyDeclArityOf mc0) dtb__41) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__43) -> (if ((v_listLength dtb__42) = dtb__43) then (((v_checkTyArityListIn mc0) mc1) dtb__42) else (Base_dDiag.v_icInternal (String.concat "" ["binder type annotation has the wrong type argument count for `"; dtb__41; "` (expected "; (bi_strFromInt dtb__43); ", got "; (bi_strFromInt (v_listLength dtb__42)); ")"])))
  | B_dData_dMaybe.C_Maybe_Nothing -> (((v_checkTyArityListIn mc0) mc1) dtb__42)
  | _ -> failwith "DT: impossible branch"
)
  | Vuna_dIr_dModel.C_IrTy_IrTyFun (dtb__44, dtb__45) -> ((Base_dCommon.v_bind (((v_checkTyArityIn mc0) mc1) dtb__44)) (fun (_u : int) -> (((v_checkTyArityIn mc0) mc1) dtb__45)))
  | Vuna_dIr_dModel.C_IrTy_IrTyRef (dtb__46) -> (((v_checkTyArityIn mc0) mc1) dtb__46)
  | Vuna_dIr_dModel.C_IrTy_IrTyArray (dtb__47) -> (((v_checkTyArityIn mc0) mc1) dtb__47)
  | Vuna_dIr_dModel.C_IrTy_IrTyOpaque -> (Base_dDiag.C_Check_OkC (0))
  | Vuna_dIr_dModel.C_IrTy_IrTyFloat -> (Base_dDiag.C_Check_OkC (0))
  | Vuna_dIr_dModel.C_IrTy_IrTyBool -> (Base_dDiag.C_Check_OkC (0))
  | Vuna_dIr_dModel.C_IrTy_IrTyStr -> (Base_dDiag.C_Check_OkC (0))
  | Vuna_dIr_dModel.C_IrTy_IrTyInt -> (Base_dDiag.C_Check_OkC (0))
  | Vuna_dIr_dModel.C_IrTy_IrTyVar (dtb__48) -> (if (dtb__48 < 0) then (Base_dDiag.v_icInternal "negative runtime type parameter slot") else (match mc1 with
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.C_Check_OkC (0))
  | B_dData_dMaybe.C_Maybe_Just (dtb__49) -> (if (dtb__48 < dtb__49) then (Base_dDiag.C_Check_OkC (0)) else (Base_dDiag.v_icInternal (String.concat "" ["runtime type parameter slot "; (bi_strFromInt dtb__48); " is out of range (declaration has "; (bi_strFromInt dtb__49); " type parameters)"])))
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
))
# 326 "Vuna/Ir/Validate.vuna"
and v_checkTyArityListIn = (fun (mc0 : Vuna_dIr_dModel.t_IrTyDecl B_dData_dList.t_List) (mc1 : int B_dData_dMaybe.t_Maybe) (mc2 : Vuna_dIr_dModel.t_IrTy B_dData_dList.t_List) -> (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__50, dtb__51) -> ((Base_dCommon.v_bind (((v_checkTyArityIn mc0) mc1) dtb__50)) (fun (_u : int) -> (((v_checkTyArityListIn mc0) mc1) dtb__51)))
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (0))
  | _ -> failwith "DT: impossible branch"
))

# 291 "Vuna/Ir/Validate.vuna"
let v_checkTyArity = (fun (decls : Vuna_dIr_dModel.t_IrTyDecl B_dData_dList.t_List) (ty : Vuna_dIr_dModel.t_IrTy) -> (((v_checkTyArityIn decls) B_dData_dMaybe.C_Maybe_Nothing) ty))

# 144 "Vuna/Ir/Validate.vuna"
let v_checkDefTy = (fun (mc0 : Vuna_dIr_dModel.t_IrTyDecl B_dData_dList.t_List) (mc1 : string) (mc2 : Vuna_dIr_dModel.t_IrTy B_dData_dMaybe.t_Maybe) -> (match mc2 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__52) -> (match ((v_checkTyArity mc0) dtb__52) with
  | Base_dDiag.C_Check_ErrC (dtb__53) -> (Base_dDiag.v_icInternal (String.concat "" ["definition `"; mc1; "` has an invalid runtime signature"]))
  | Base_dDiag.C_Check_OkC (dtb__54) -> (Base_dDiag.C_Check_OkC (dtb__54))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.C_Check_OkC (0))
  | _ -> failwith "DT: impossible branch"
))

# 188 "Vuna/Ir/Validate.vuna"
let v_checkAppTy = (fun (mc0 : Vuna_dIr_dModel.t_IrTyDecl B_dData_dList.t_List) (mc1 : (Vuna_dIr_dModel.t_IrTy, Vuna_dIr_dModel.t_IrTy) B_dData_dPair.t_Pair B_dData_dMaybe.t_Maybe) -> (match mc1 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__55) -> ((Base_dCommon.v_bind ((v_checkTyArity mc0) (B_dData_dPair.v_firstOf dtb__55))) (fun (_u : int) -> ((v_checkTyArity mc0) (B_dData_dPair.v_secondOf dtb__55))))
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.v_icInternal "IR application has an empty runtime type slot")
  | _ -> failwith "DT: impossible branch"
))

# 232 "Vuna/Ir/Validate.vuna"
let v_checkIrTyM = (fun (mc0 : Vuna_dIr_dModel.t_IrTyDecl B_dData_dList.t_List) (mc1 : Vuna_dIr_dModel.t_IrTy B_dData_dMaybe.t_Maybe) -> (match mc1 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__56) -> ((v_checkTyArity mc0) dtb__56)
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.C_Check_OkC (0))
  | _ -> failwith "DT: impossible branch"
))

# 238 "Vuna/Ir/Validate.vuna"
let v_checkNodeTy = (fun (mc0 : Vuna_dIr_dModel.t_IrTyDecl B_dData_dList.t_List) (mc1 : string) (mc2 : Vuna_dIr_dModel.t_IrTy B_dData_dMaybe.t_Maybe) -> (match mc2 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__57) -> ((v_checkTyArity mc0) dtb__57)
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.v_icInternal (String.concat "" ["IR node `"; mc1; "` has an empty runtime type slot"]))
  | _ -> failwith "DT: impossible branch"
))

# 268 "Vuna/Ir/Validate.vuna"
let rec v_checkBinderTysList = (fun (mc0 : Vuna_dIr_dModel.t_IrTyDecl B_dData_dList.t_List) (mc1 : Vuna_dIr_dModel.t_IrBinder B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__58, dtb__59) -> (if (dtb__58).Vuna_dIr_dModel.f_IrBinder_irBinderErased then (match (dtb__58).Vuna_dIr_dModel.f_IrBinder_irBinderTy with
  | B_dData_dMaybe.C_Maybe_Nothing -> ((v_checkBinderTysList mc0) dtb__59)
  | B_dData_dMaybe.C_Maybe_Just (dtb__60) -> (Base_dDiag.v_icInternal "erased binder carries a runtime type annotation")
  | _ -> failwith "DT: impossible branch"
) else (match (dtb__58).Vuna_dIr_dModel.f_IrBinder_irBinderTy with
  | B_dData_dMaybe.C_Maybe_Nothing -> ((v_checkBinderTysList mc0) dtb__59)
  | B_dData_dMaybe.C_Maybe_Just (dtb__61) -> ((Base_dCommon.v_bind ((v_checkTyArity mc0) dtb__61)) (fun (_u : int) -> ((v_checkBinderTysList mc0) dtb__59)))
  | _ -> failwith "DT: impossible branch"
))
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (0))
  | _ -> failwith "DT: impossible branch"
))

# 246 "Vuna/Ir/Validate.vuna"
let v_checkBinderTysOf = (fun (decls : Vuna_dIr_dModel.t_IrTyDecl B_dData_dList.t_List) (bs : Vuna_dIr_dModel.t_IrBinder B_dData_dList.t_List) -> ((Base_dCommon.v_bind (v_checkBinderIds bs)) (fun (_u : int) -> ((v_checkBinderTysList decls) bs))))

# 280 "Vuna/Ir/Validate.vuna"
let rec v_checkAltBinderTys = (fun (mc0 : Vuna_dIr_dModel.t_IrTyDecl B_dData_dList.t_List) (mc1 : Vuna_dIr_dModel.t_IrAlt B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__62, dtb__63) -> ((Base_dCommon.v_bind ((v_checkBinderTysOf mc0) (Vuna_dIr_dModel.v_irAltBindersOf dtb__62))) (fun (_u : int) -> ((v_checkAltBinderTys mc0) dtb__63)))
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (0))
  | _ -> failwith "DT: impossible branch"
))

# 287 "Vuna/Ir/Validate.vuna"
let v_checkAltBinderTysM = (fun (mc0 : Vuna_dIr_dModel.t_IrTyDecl B_dData_dList.t_List) (mc1 : Vuna_dIr_dModel.t_IrAlt B_dData_dMaybe.t_Maybe) -> (match mc1 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__64) -> ((v_checkBinderTysOf mc0) (Vuna_dIr_dModel.v_irAltBindersOf dtb__64))
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.C_Check_OkC (0))
  | _ -> failwith "DT: impossible branch"
))

# 323 "Vuna/Ir/Validate.vuna"
let v_checkTyArityList = (fun (decls : Vuna_dIr_dModel.t_IrTyDecl B_dData_dList.t_List) (tys : Vuna_dIr_dModel.t_IrTy B_dData_dList.t_List) -> (((v_checkTyArityListIn decls) B_dData_dMaybe.C_Maybe_Nothing) tys))

# 210 "Vuna/Ir/Validate.vuna"
let v_checkTyArityListM = (fun (mc0 : Vuna_dIr_dModel.t_IrTyDecl B_dData_dList.t_List) (mc1 : Vuna_dIr_dModel.t_IrTy B_dData_dList.t_List B_dData_dMaybe.t_Maybe) -> (match mc1 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__65) -> ((v_checkTyArityList mc0) dtb__65)
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.C_Check_OkC (0))
  | _ -> failwith "DT: impossible branch"
))

# 195 "Vuna/Ir/Validate.vuna"
let v_checkCtorTys = (fun (shared : Vuna_dIr_dModel.t_IrShared) (decls : Vuna_dIr_dModel.t_IrTyDecl B_dData_dList.t_List) (family : string) (ctor : string) (tys : Vuna_dIr_dModel.t_IrTy B_dData_dList.t_List B_dData_dMaybe.t_Maybe) (nargs : int) -> ((Base_dCommon.v_bind ((v_checkTyArityListM decls) tys)) (fun (_u : int) -> (let typeArityOk = (match ((v_tyDeclArityOf decls) family) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__66) -> (match tys with
  | B_dData_dMaybe.C_Maybe_Just (dtb__67) -> ((v_listLength dtb__67) = dtb__66)
  | B_dData_dMaybe.C_Maybe_Nothing -> true
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> true
  | _ -> failwith "DT: impossible branch"
) in (if typeArityOk then ((((v_checkCtorArity shared) family) ctor) nargs) else (Base_dDiag.v_icInternal (String.concat "" ["constructor application has the wrong runtime type argument count for `"; family; "`"])))))))

# 160 "Vuna/Ir/Validate.vuna"
let rec v_checkNodeBinderTys = (fun (mc0 : Vuna_dIr_dModel.t_IrShared) (mc1 : Vuna_dIr_dModel.t_IrTyDecl B_dData_dList.t_List) (mc2 : Vuna_dIr_dModel.t_Ir) -> (match mc2 with
  | Vuna_dIr_dModel.C_Ir_IrTail (dtb__68) -> (((v_checkNodeBinderTys mc0) mc1) dtb__68)
  | Vuna_dIr_dModel.C_Ir_IrCast (dtb__69, dtb__70, dtb__71) -> ((Base_dCommon.v_bind ((v_checkIrTyM mc1) dtb__69)) (fun (_u : int) -> ((v_checkIrTyM mc1) dtb__70)))
  | Vuna_dIr_dModel.C_Ir_IrNatCase (dtb__72, dtb__73, dtb__74, dtb__75, dtb__76) -> ((Base_dCommon.v_bind ((v_checkAltBinderTysM mc1) dtb__74)) (fun (_u : int) -> ((Base_dCommon.v_bind ((v_checkAltBinderTysM mc1) dtb__75)) (fun (_u : int) -> ((v_checkAltBinderTysM mc1) dtb__76)))))
  | Vuna_dIr_dModel.C_Ir_IrRecUpd (dtb__77, dtb__78, dtb__79, dtb__80) -> (((v_checkNodeTy mc1) "update") dtb__80)
  | Vuna_dIr_dModel.C_Ir_IrProj (dtb__81, dtb__82, dtb__83, dtb__84) -> (((v_checkNodeTy mc1) "projection") dtb__84)
  | Vuna_dIr_dModel.C_Ir_IrRecord (dtb__85, dtb__86, dtb__87) -> (((v_checkNodeTy mc1) "record") dtb__86)
  | Vuna_dIr_dModel.C_Ir_IrCtor (dtb__88, dtb__89, dtb__90, dtb__91) -> ((((((v_checkCtorTys mc0) mc1) dtb__88) dtb__89) dtb__90) (v_listLength dtb__91))
  | Vuna_dIr_dModel.C_Ir_IrApp (dtb__92, dtb__93, dtb__94) -> ((v_checkAppTy mc1) dtb__92)
  | Vuna_dIr_dModel.C_Ir_IrCase (dtb__95, dtb__96, dtb__97, dtb__98) -> ((Base_dCommon.v_bind (((v_checkNodeTy mc1) "case scrutinee") dtb__95)) (fun (_u : int) -> ((Base_dCommon.v_bind (((v_checkNodeTy mc1) "case") dtb__96)) (fun (_u : int) -> ((v_checkAltBinderTys mc1) dtb__98)))))
  | Vuna_dIr_dModel.C_Ir_IrLet (dtb__99, dtb__100, dtb__101) -> ((v_checkBinderTysOf mc1) dtb__99)
  | Vuna_dIr_dModel.C_Ir_IrLam (dtb__102, dtb__103, dtb__104) -> (if (v_anyErasedBinder dtb__102) then (Base_dDiag.v_icInternal "IR lambda carries an erased binder placeholder") else ((Base_dCommon.v_bind ((v_checkBinderTysOf mc1) dtb__102)) (fun (_u : int) -> (((v_checkNodeTy mc1) "lambda") dtb__103))))
  | _ -> (Base_dDiag.C_Check_OkC (0))
))

# 348 "Vuna/Ir/Validate.vuna"
let rec v_checkDeclCtorSlots = (fun (mc0 : Vuna_dIr_dModel.t_IrTyDecl B_dData_dList.t_List) (mc1 : string) (mc2 : int) (mc3 : (string, Vuna_dIr_dModel.t_IrTy B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc3 with
  | B_dData_dList.C_List__x58__x58_ (dtb__105, dtb__106) -> (match dtb__105 with
  | { B_dData_dPair.f_Pair_first = dtb__107; B_dData_dPair.f_Pair_second = dtb__108 } -> ((Base_dCommon.v_bind (((v_checkTyArityListIn mc0) (B_dData_dMaybe.C_Maybe_Just (mc2))) dtb__108)) (fun (_u : int) -> ((((v_checkDeclCtorSlots mc0) mc1) mc2) dtb__106)))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (0))
  | _ -> failwith "DT: impossible branch"
))

# 343 "Vuna/Ir/Validate.vuna"
let v_checkDeclSlots = (fun (mc0 : Vuna_dIr_dModel.t_IrTyDecl B_dData_dList.t_List) (mc1 : Vuna_dIr_dModel.t_IrTyDecl) -> (match mc1 with
  | Vuna_dIr_dModel.C_IrTyDecl_IrUnboxedDecl (dtb__109, dtb__110, dtb__111) -> (((v_checkTyArityIn mc0) (B_dData_dMaybe.C_Maybe_Just (dtb__110))) dtb__111)
  | Vuna_dIr_dModel.C_IrTyDecl_IrRecordDecl (dtb__112, dtb__113, dtb__114, dtb__115) -> (((v_checkTyArityListIn mc0) (B_dData_dMaybe.C_Maybe_Just (dtb__113))) dtb__115)
  | Vuna_dIr_dModel.C_IrTyDecl_IrVariantDecl (dtb__116, dtb__117, dtb__118) -> ((((v_checkDeclCtorSlots mc0) dtb__116) dtb__117) dtb__118)
  | _ -> failwith "DT: impossible branch"
))

# 338 "Vuna/Ir/Validate.vuna"
let rec v_validateTyDeclsGo = (fun (mc0 : Vuna_dIr_dModel.t_IrTyDecl B_dData_dList.t_List) (mc1 : Vuna_dIr_dModel.t_IrTyDecl B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__119, dtb__120) -> ((Base_dCommon.v_bind ((v_checkDeclSlots mc0) dtb__119)) (fun (_u : int) -> ((v_validateTyDeclsGo mc0) dtb__120)))
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (0))
  | _ -> failwith "DT: impossible branch"
))

# 335 "Vuna/Ir/Validate.vuna"
let v_validateTyDecls = (fun (decls : Vuna_dIr_dModel.t_IrTyDecl B_dData_dList.t_List) -> ((v_validateTyDeclsGo decls) decls))

# 390 "Vuna/Ir/Validate.vuna"
let v_scopedFuelOf = (fun (body : Vuna_dIr_dModel.t_Ir) -> ((8 * (Vuna_dIr_dModel.v_irSize body)) + 64))

# 428 "Vuna/Ir/Validate.vuna"
let v_maybeAlts = (fun (mc0 : Vuna_dIr_dModel.t_IrAlt B_dData_dMaybe.t_Maybe) -> (match mc0 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__121) -> (B_dData_dList.C_List__x58__x58_ (dtb__121, B_dData_dList.C_List_Nil))
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 432 "Vuna/Ir/Validate.vuna"
let rec v_altWork = (fun (mc0 : Vuna_dIr_dModel.t_IrBinder B_dData_dList.t_List) (mc1 : Vuna_dIr_dModel.t_IrAlt B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__122, dtb__123) -> (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = ((B_dData_dList.v_append (Vuna_dIr_dModel.v_irAltBindersOf dtb__122)) mc0); B_dData_dPair.f_Pair_second = (Vuna_dIr_dModel.v_irAltBodyOf dtb__122) }, ((v_altWork mc0) dtb__123)))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 406 "Vuna/Ir/Validate.vuna"
let v_scopedChildren = (fun (mc0 : Vuna_dIr_dModel.t_IrBinder B_dData_dList.t_List) (mc1 : Vuna_dIr_dModel.t_Ir) -> (match mc1 with
  | Vuna_dIr_dModel.C_Ir_IrTail (dtb__124) -> (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = mc0; B_dData_dPair.f_Pair_second = dtb__124 }, B_dData_dList.C_List_Nil))
  | Vuna_dIr_dModel.C_Ir_IrEffThunk (dtb__125, dtb__126, dtb__127, dtb__128, dtb__129) -> (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = mc0; B_dData_dPair.f_Pair_second = dtb__129 }, B_dData_dList.C_List_Nil))
  | Vuna_dIr_dModel.C_Ir_IrConcatMany (dtb__130) -> ((B_dData_dList.v_map (fun (a : Vuna_dIr_dModel.t_Ir) -> { B_dData_dPair.f_Pair_first = mc0; B_dData_dPair.f_Pair_second = a })) dtb__130)
  | Vuna_dIr_dModel.C_Ir_IrNatCase (dtb__131, dtb__132, dtb__133, dtb__134, dtb__135) -> ((B_dData_dList.v_append (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = mc0; B_dData_dPair.f_Pair_second = dtb__131 }, B_dData_dList.C_List_Nil))) ((B_dData_dList.v_append ((v_altWork mc0) (v_maybeAlts dtb__133))) ((B_dData_dList.v_append ((v_altWork mc0) (v_maybeAlts dtb__134))) ((v_altWork mc0) (v_maybeAlts dtb__135)))))
  | Vuna_dIr_dModel.C_Ir_IrCase (dtb__136, dtb__137, dtb__138, dtb__139) -> (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = mc0; B_dData_dPair.f_Pair_second = dtb__138 }, ((v_altWork mc0) dtb__139)))
  | Vuna_dIr_dModel.C_Ir_IrIf (dtb__140, dtb__141, dtb__142) -> (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = mc0; B_dData_dPair.f_Pair_second = dtb__140 }, (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = mc0; B_dData_dPair.f_Pair_second = dtb__141 }, (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = mc0; B_dData_dPair.f_Pair_second = dtb__142 }, B_dData_dList.C_List_Nil))))))
  | Vuna_dIr_dModel.C_Ir_IrApp (dtb__143, dtb__144, dtb__145) -> (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = mc0; B_dData_dPair.f_Pair_second = dtb__144 }, (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = mc0; B_dData_dPair.f_Pair_second = dtb__145 }, B_dData_dList.C_List_Nil))))
  | Vuna_dIr_dModel.C_Ir_IrLam (dtb__146, dtb__147, dtb__148) -> (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = ((B_dData_dList.v_append dtb__146) mc0); B_dData_dPair.f_Pair_second = dtb__148 }, B_dData_dList.C_List_Nil))
  | Vuna_dIr_dModel.C_Ir_IrLet (dtb__149, dtb__150, dtb__151) -> (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = mc0; B_dData_dPair.f_Pair_second = dtb__150 }, (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = ((B_dData_dList.v_append dtb__149) mc0); B_dData_dPair.f_Pair_second = dtb__151 }, B_dData_dList.C_List_Nil))))
  | Vuna_dIr_dModel.C_Ir_IrCast (dtb__152, dtb__153, dtb__154) -> (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = mc0; B_dData_dPair.f_Pair_second = dtb__154 }, B_dData_dList.C_List_Nil))
  | Vuna_dIr_dModel.C_Ir_IrRtApp (dtb__155, dtb__156) -> ((B_dData_dList.v_map (fun (a : Vuna_dIr_dModel.t_Ir) -> { B_dData_dPair.f_Pair_first = mc0; B_dData_dPair.f_Pair_second = a })) dtb__156)
  | Vuna_dIr_dModel.C_Ir_IrRecUpd (dtb__157, dtb__158, dtb__159, dtb__160) -> (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = mc0; B_dData_dPair.f_Pair_second = dtb__157 }, ((B_dData_dList.v_map (fun (p : (string, Vuna_dIr_dModel.t_Ir) B_dData_dPair.t_Pair) -> { B_dData_dPair.f_Pair_first = mc0; B_dData_dPair.f_Pair_second = (B_dData_dPair.v_secondOf p) })) dtb__159)))
  | Vuna_dIr_dModel.C_Ir_IrProj (dtb__161, dtb__162, dtb__163, dtb__164) -> (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = mc0; B_dData_dPair.f_Pair_second = dtb__161 }, B_dData_dList.C_List_Nil))
  | Vuna_dIr_dModel.C_Ir_IrRecord (dtb__165, dtb__166, dtb__167) -> ((B_dData_dList.v_map (fun (p : (string, Vuna_dIr_dModel.t_Ir) B_dData_dPair.t_Pair) -> { B_dData_dPair.f_Pair_first = mc0; B_dData_dPair.f_Pair_second = (B_dData_dPair.v_secondOf p) })) dtb__167)
  | Vuna_dIr_dModel.C_Ir_IrCtor (dtb__168, dtb__169, dtb__170, dtb__171) -> ((B_dData_dList.v_map (fun (a : Vuna_dIr_dModel.t_Ir) -> { B_dData_dPair.f_Pair_first = mc0; B_dData_dPair.f_Pair_second = a })) dtb__171)
  | _ -> B_dData_dList.C_List_Nil
))

# 460 "Vuna/Ir/Validate.vuna"
let rec v_altBodies = (fun (mc0 : Vuna_dIr_dModel.t_IrAlt B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__172, dtb__173) -> (B_dData_dList.C_List__x58__x58_ ((Vuna_dIr_dModel.v_irAltBodyOf dtb__172), (v_altBodies dtb__173)))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 464 "Vuna/Ir/Validate.vuna"
let v_maybeAltBodies = (fun (mc0 : Vuna_dIr_dModel.t_IrAlt B_dData_dMaybe.t_Maybe) -> (match mc0 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__174) -> (B_dData_dList.C_List__x58__x58_ ((Vuna_dIr_dModel.v_irAltBodyOf dtb__174), B_dData_dList.C_List_Nil))
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 439 "Vuna/Ir/Validate.vuna"
let v_irChildren = (fun (mc0 : Vuna_dIr_dModel.t_Ir) -> (match mc0 with
  | Vuna_dIr_dModel.C_Ir_IrTail (dtb__175) -> (B_dData_dList.C_List__x58__x58_ (dtb__175, B_dData_dList.C_List_Nil))
  | Vuna_dIr_dModel.C_Ir_IrEffThunk (dtb__176, dtb__177, dtb__178, dtb__179, dtb__180) -> (B_dData_dList.C_List__x58__x58_ (dtb__180, B_dData_dList.C_List_Nil))
  | Vuna_dIr_dModel.C_Ir_IrConcatMany (dtb__181) -> dtb__181
  | Vuna_dIr_dModel.C_Ir_IrNatCase (dtb__182, dtb__183, dtb__184, dtb__185, dtb__186) -> ((B_dData_dList.v_append (B_dData_dList.C_List__x58__x58_ (dtb__182, B_dData_dList.C_List_Nil))) ((B_dData_dList.v_append (v_maybeAltBodies dtb__184)) ((B_dData_dList.v_append (v_maybeAltBodies dtb__185)) (v_maybeAltBodies dtb__186))))
  | Vuna_dIr_dModel.C_Ir_IrCase (dtb__187, dtb__188, dtb__189, dtb__190) -> (B_dData_dList.C_List__x58__x58_ (dtb__189, (v_altBodies dtb__190)))
  | Vuna_dIr_dModel.C_Ir_IrIf (dtb__191, dtb__192, dtb__193) -> (B_dData_dList.C_List__x58__x58_ (dtb__191, (B_dData_dList.C_List__x58__x58_ (dtb__192, (B_dData_dList.C_List__x58__x58_ (dtb__193, B_dData_dList.C_List_Nil))))))
  | Vuna_dIr_dModel.C_Ir_IrApp (dtb__194, dtb__195, dtb__196) -> (B_dData_dList.C_List__x58__x58_ (dtb__195, (B_dData_dList.C_List__x58__x58_ (dtb__196, B_dData_dList.C_List_Nil))))
  | Vuna_dIr_dModel.C_Ir_IrLam (dtb__197, dtb__198, dtb__199) -> (B_dData_dList.C_List__x58__x58_ (dtb__199, B_dData_dList.C_List_Nil))
  | Vuna_dIr_dModel.C_Ir_IrLet (dtb__200, dtb__201, dtb__202) -> (B_dData_dList.C_List__x58__x58_ (dtb__201, (B_dData_dList.C_List__x58__x58_ (dtb__202, B_dData_dList.C_List_Nil))))
  | Vuna_dIr_dModel.C_Ir_IrCast (dtb__203, dtb__204, dtb__205) -> (B_dData_dList.C_List__x58__x58_ (dtb__205, B_dData_dList.C_List_Nil))
  | Vuna_dIr_dModel.C_Ir_IrRtApp (dtb__206, dtb__207) -> dtb__207
  | Vuna_dIr_dModel.C_Ir_IrRecUpd (dtb__208, dtb__209, dtb__210, dtb__211) -> (B_dData_dList.C_List__x58__x58_ (dtb__208, ((B_dData_dList.v_map B_dData_dPair.v_secondOf) dtb__210)))
  | Vuna_dIr_dModel.C_Ir_IrProj (dtb__212, dtb__213, dtb__214, dtb__215) -> (B_dData_dList.C_List__x58__x58_ (dtb__212, B_dData_dList.C_List_Nil))
  | Vuna_dIr_dModel.C_Ir_IrRecord (dtb__216, dtb__217, dtb__218) -> ((B_dData_dList.v_map B_dData_dPair.v_secondOf) dtb__218)
  | Vuna_dIr_dModel.C_Ir_IrCtor (dtb__219, dtb__220, dtb__221, dtb__222) -> dtb__222
  | _ -> B_dData_dList.C_List_Nil
))

# 151 "Vuna/Ir/Validate.vuna"
let rec v_checkBinderTysWork = (fun (shared : Vuna_dIr_dModel.t_IrShared) (fuel : int) (decls : Vuna_dIr_dModel.t_IrTyDecl B_dData_dList.t_List) (work : Vuna_dIr_dModel.t_Ir B_dData_dList.t_List) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "ir-binder-ty") else (match work with
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (0))
  | B_dData_dList.C_List__x58__x58_ (dtb__223, dtb__224) -> ((Base_dCommon.v_bind (((v_checkNodeBinderTys shared) decls) dtb__223)) (fun (_u : int) -> ((((v_checkBinderTysWork shared) (fuel - 1)) decls) ((B_dData_dList.v_append (v_irChildren dtb__223)) dtb__224))))
  | _ -> failwith "DT: impossible branch"
)))

# 106 "Vuna/Ir/Validate.vuna"
let rec v_checkBinderTys = (fun (mc0 : Vuna_dIr_dModel.t_IrShared) (mc1 : Vuna_dIr_dModel.t_IrTyDecl B_dData_dList.t_List) (mc2 : Vuna_dIr_dModel.t_IrDef B_dData_dList.t_List) -> (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__225, dtb__226) -> ((Base_dCommon.v_bind (((v_checkDefTy mc1) (Vuna_dIr_dModel.v_irDefName dtb__225)) (Vuna_dIr_dModel.v_irDefTy dtb__225))) (fun (_u : int) -> ((Base_dCommon.v_bind (v_checkDefArityVsSig dtb__225)) (fun (_u : int) -> (match (Vuna_dIr_dModel.v_irDefBody dtb__225) with
  | B_dData_dMaybe.C_Maybe_Nothing -> (((v_checkBinderTys mc0) mc1) dtb__226)
  | B_dData_dMaybe.C_Maybe_Just (dtb__227) -> ((Base_dCommon.v_bind ((((v_checkBinderTysWork mc0) ((8 * (Vuna_dIr_dModel.v_irSize dtb__227)) + 64)) mc1) (B_dData_dList.C_List__x58__x58_ (dtb__227, B_dData_dList.C_List_Nil)))) (fun (_u : int) -> (((v_checkBinderTys mc0) mc1) dtb__226)))
  | _ -> failwith "DT: impossible branch"
)))))
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (0))
  | _ -> failwith "DT: impossible branch"
))

# 472 "Vuna/Ir/Validate.vuna"
let v_sameBinder = Vuna_dIr_dModel.v_sameBinderId

# 468 "Vuna/Ir/Validate.vuna"
let rec v_memBinder = (fun (mc0 : Vuna_dIr_dModel.t_IrBinder) (mc1 : Vuna_dIr_dModel.t_IrBinder B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__228, dtb__229) -> (if ((v_sameBinder mc0) dtb__228) then true else ((v_memBinder mc0) dtb__229))
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 393 "Vuna/Ir/Validate.vuna"
let rec v_checkScopedWork = (fun (fuel : int) (work : (Vuna_dIr_dModel.t_IrBinder B_dData_dList.t_List, Vuna_dIr_dModel.t_Ir) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "ir-scope") else (let nd_uscrut2 = work in (match nd_uscrut2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__230, dtb__231) -> (match dtb__230 with
  | { B_dData_dPair.f_Pair_first = dtb__232; B_dData_dPair.f_Pair_second = dtb__233 } -> (match dtb__233 with
  | Vuna_dIr_dModel.C_Ir_IrVar (dtb__234) -> (if (dtb__234).Vuna_dIr_dModel.f_IrBinder_irBinderErased then (Base_dDiag.v_icInternal "erased binder reached runtime IR") else (if ((v_memBinder dtb__234) dtb__232) then ((v_checkScopedWork (fuel - 1)) dtb__231) else (Base_dDiag.v_icInternal "IR variable references a binder outside its scope")))
  | _ -> ((v_checkScopedWork (fuel - 1)) ((B_dData_dList.v_append ((v_scopedChildren dtb__232) dtb__233)) dtb__231))
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (0))
  | _ -> failwith "DT: impossible branch"
))))

# 380 "Vuna/Ir/Validate.vuna"
let rec v_checkScopedDefs = (fun (mc0 : Vuna_dIr_dModel.t_IrDef B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__235, dtb__236) -> (match (Vuna_dIr_dModel.v_irDefBody dtb__235) with
  | B_dData_dMaybe.C_Maybe_Nothing -> (v_checkScopedDefs dtb__236)
  | B_dData_dMaybe.C_Maybe_Just (dtb__237) -> ((Base_dCommon.v_bind ((v_checkScopedWork ((v_scopedFuelOf dtb__237) + 1)) (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = dtb__237 }, B_dData_dList.C_List_Nil)))) (fun (_u : int) -> (v_checkScopedDefs dtb__236)))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (0))
  | _ -> failwith "DT: impossible branch"
))

# 377 "Vuna/Ir/Validate.vuna"
let v_checkScopedUnit = (fun (u : Vuna_dIr_dModel.t_IrUnit) -> (v_checkScopedDefs ((B_dData_dList.v_concatMap Vuna_dIr_dModel.v_irGroupDefs) (u).Vuna_dIr_dModel.f_IrUnit_irUnitGroups)))

# 23 "Vuna/Ir/Validate.vuna"
let v_validateUnit = (fun (shared : Vuna_dIr_dModel.t_IrShared) (u : Vuna_dIr_dModel.t_IrUnit) -> (let defs = ((B_dData_dList.v_concatMap Vuna_dIr_dModel.v_irGroupDefs) (u).Vuna_dIr_dModel.f_IrUnit_irUnitGroups) in (let nameTbl = (B_dContainer_dHashMap.v_ofNames ((B_dData_dList.v_map Vuna_dIr_dModel.v_irDefName) defs)) in ((Base_dCommon.v_bind (Vuna_dIr_dAnalysis.v_checkUniqueDefNames defs)) (fun (_u : int) -> ((Base_dCommon.v_bind ((v_checkGroupOrder (u).Vuna_dIr_dModel.f_IrUnit_irUnitGroups) nameTbl)) (fun (_u : int) -> ((Base_dCommon.v_bind (v_checkSymbolRefs (Vuna_dIr_dRuntime.v_irSymbolsOfUnit u))) (fun (_u : int) -> ((Base_dCommon.v_bind (v_checkScopedUnit u)) (fun (_u : int) -> ((Base_dCommon.v_bind (v_validateTyDecls (u).Vuna_dIr_dModel.f_IrUnit_irUnitTyDecls)) (fun (_u : int) -> (((v_checkBinderTys shared) (u).Vuna_dIr_dModel.f_IrUnit_irUnitTyDecls) defs))))))))))))))

# 87 "Vuna/Ir/Validate.vuna"
let v_validateProgram = (fun (p : Vuna_dIr_dModel.t_IrProgram) -> (let u = (p).Vuna_dIr_dModel.f_IrProgram_irProgUnit in (let shared = (p).Vuna_dIr_dModel.f_IrProgram_irProgShared in (let defs = ((B_dData_dList.v_concatMap Vuna_dIr_dModel.v_irGroupDefs) (u).Vuna_dIr_dModel.f_IrUnit_irUnitGroups) in (match (u).Vuna_dIr_dModel.f_IrUnit_irUnitEntry with
  | B_dData_dMaybe.C_Maybe_Nothing -> ((v_validateUnit shared) u)
  | B_dData_dMaybe.C_Maybe_Just (dtb__238) -> (if ((B_dData_dList.v_memName (dtb__238).Vuna_dIr_dModel.f_IrEntry_irEntryMain) ((B_dData_dList.v_map Vuna_dIr_dModel.v_irDefName) defs)) then ((v_validateUnit shared) u) else (Base_dDiag.v_icInternal (String.concat "" ["IR entry references an undefined main: `"; (dtb__238).Vuna_dIr_dModel.f_IrEntry_irEntryMain; "`"])))
  | _ -> failwith "DT: impossible branch"
)))))
