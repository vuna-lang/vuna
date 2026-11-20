open Vuna_runtime
# 46 "Vuna/Compiler/Lowering/Ty.vuna"
let v_reprTyIr = (fun (name : string) -> (if (name = Base_dIntrinsics.v_intTypeName) then (B_dData_dMaybe.C_Maybe_Just (Vuna_dIr_dModel.C_IrTy_IrTyInt)) else (if (name = Base_dIntrinsics.v_strTypeName) then (B_dData_dMaybe.C_Maybe_Just (Vuna_dIr_dModel.C_IrTy_IrTyStr)) else (if (name = Base_dIntrinsics.v_floatTypeName) then (B_dData_dMaybe.C_Maybe_Just (Vuna_dIr_dModel.C_IrTy_IrTyFloat)) else (let nd_uscrut1 = (Base_dIntrinsics.v_canonicalReprOf name) in (match nd_uscrut1 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__0) -> (match dtb__0 with
  | Base_dIntrinsics.C_FamilyRepr_FamReprBool -> (B_dData_dMaybe.C_Maybe_Just (Vuna_dIr_dModel.C_IrTy_IrTyBool))
  | Base_dIntrinsics.C_FamilyRepr_FamReprNat -> (B_dData_dMaybe.C_Maybe_Just (Vuna_dIr_dModel.C_IrTy_IrTyInt))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
))))))

# 78 "Vuna/Compiler/Lowering/Ty.vuna"
let v_renderTyIntrinsicWith = (fun (mc0 : (Core_dTerm.t_Value) -> Vuna_dIr_dModel.t_IrTy) (mc1 : string) (mc2 : Core_dTerm.t_Value B_dData_dList.t_List) -> (if (mc1 = "Array") then (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__1, dtb__2) -> (match dtb__2 with
  | B_dData_dList.C_List_Nil -> (B_dData_dMaybe.C_Maybe_Just ((Vuna_dIr_dModel.C_IrTy_IrTyArray ((mc0 dtb__1)))))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
) else (if (mc1 = "IORef") then (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__3, dtb__4) -> (match dtb__4 with
  | B_dData_dList.C_List_Nil -> (B_dData_dMaybe.C_Maybe_Just ((Vuna_dIr_dModel.C_IrTy_IrTyRef ((mc0 dtb__3)))))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
) else B_dData_dMaybe.C_Maybe_Nothing)))

# 29 "Vuna/Compiler/Lowering/Ty.vuna"
let rec v_renderTyFuel = (fun (fuel : int) (levels : int B_dData_dList.t_List) (table : (string, int B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (datas : Elab_dTypes.t_DtData B_dData_dList.t_List) (v : Core_dTerm.t_Value) -> (if (fuel <= 0) then Vuna_dIr_dModel.C_IrTy_IrTyOpaque else (match v with
  | Core_dTerm.C_Value_VNeutral (dtb__5) -> (match dtb__5 with
  | Core_dTerm.C_Neutral_NVar (dtb__6, dtb__7, dtb__8) -> (match ((Lowering_dEnv.v_levelSlotIn levels) dtb__7) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__9) -> (Vuna_dIr_dModel.C_IrTy_IrTyVar (dtb__9))
  | B_dData_dMaybe.C_Maybe_Nothing -> Vuna_dIr_dModel.C_IrTy_IrTyOpaque
  | _ -> failwith "DT: impossible branch"
)
  | Core_dTerm.C_Neutral_NGlobal (dtb__10, dtb__11) -> ((((((v_renderTyGlobal fuel) levels) table) datas) dtb__10) dtb__11)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> Vuna_dIr_dModel.C_IrTy_IrTyOpaque
)))
# 60 "Vuna/Compiler/Lowering/Ty.vuna"
and v_renderTyGlobal = (fun (fuel : int) (levels : int B_dData_dList.t_List) (table : (string, int B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (datas : Elab_dTypes.t_DtData B_dData_dList.t_List) (g : string) (sp : Core_dTerm.t_Value B_dData_dList.t_List) -> (match (((v_renderTyIntrinsicWith (fun (x : Core_dTerm.t_Value) -> (((((v_renderTyFuel (fuel - 1)) levels) table) datas) x))) g) sp) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__12) -> dtb__12
  | B_dData_dMaybe.C_Maybe_Nothing -> (match (v_reprTyIr g) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__13) -> dtb__13
  | B_dData_dMaybe.C_Maybe_Nothing -> (match ((Elab_dRepresentation.v_findDtData g) datas) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__14) -> (Vuna_dIr_dModel.C_IrTy_IrTyData (g, ((((((v_renderFamilyArgs (fuel - 1)) levels) table) datas) ((Lowering_dEnv.v_lookupTyParamsIn table) g)) sp)))
  | B_dData_dMaybe.C_Maybe_Nothing -> Vuna_dIr_dModel.C_IrTy_IrTyOpaque
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))
# 83 "Vuna/Compiler/Lowering/Ty.vuna"
and v_renderFamilyArgs = (fun (fuel : int) (levels : int B_dData_dList.t_List) (table : (string, int B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (datas : Elab_dTypes.t_DtData B_dData_dList.t_List) (usedPats : int B_dData_dList.t_List) (args : Core_dTerm.t_Value B_dData_dList.t_List) -> (if (fuel <= 0) then B_dData_dList.C_List_Nil else (match usedPats with
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | B_dData_dList.C_List__x58__x58_ (dtb__15, dtb__16) -> (match ((Lowering_dEnv.v_nthValueIn args) dtb__15) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__17) -> (B_dData_dList.C_List__x58__x58_ ((((((v_renderTyFuel (fuel - 1)) levels) table) datas) dtb__17), ((((((v_renderFamilyArgs (fuel - 1)) levels) table) datas) dtb__16) args)))
  | B_dData_dMaybe.C_Maybe_Nothing -> (B_dData_dList.C_List__x58__x58_ (Vuna_dIr_dModel.C_IrTy_IrTyOpaque, ((((((v_renderFamilyArgs (fuel - 1)) levels) table) datas) dtb__16) args)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))

# 26 "Vuna/Compiler/Lowering/Ty.vuna"
let v_renderTyOf = (fun (levels : int B_dData_dList.t_List) (table : (string, int B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (datas : Elab_dTypes.t_DtData B_dData_dList.t_List) (v : Core_dTerm.t_Value) -> (((((v_renderTyFuel 256) levels) table) datas) v))

# 102 "Vuna/Compiler/Lowering/Ty.vuna"
let rec v_renderPiTyFuel = (fun (fuel : int) (levels : int B_dData_dList.t_List) (table : (string, int B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (datas : Elab_dTypes.t_DtData B_dData_dList.t_List) (lvl : int) (v : Core_dTerm.t_Value) -> (if (fuel <= 0) then (((((v_renderTyFuel fuel) levels) table) datas) v) else (match v with
  | Core_dTerm.C_Value_VPi (dtb__18, dtb__19, dtb__20, dtb__21, dtb__22) -> (let next = ((Core_dEval.v_applyClosure dtb__22) (Core_dTerm.C_Value_VNeutral ((Core_dTerm.C_Neutral_NVar (dtb__18, lvl, B_dData_dList.C_List_Nil))))) in (if (Core_dTerm.v_rigIsErased dtb__20) then ((((((v_renderPiTyFuel (fuel - 1)) levels) table) datas) (lvl + 1)) next) else (Vuna_dIr_dModel.C_IrTy_IrTyFun (((((((v_renderPiTyFuel (fuel - 1)) levels) table) datas) lvl) dtb__21), ((((((v_renderPiTyFuel (fuel - 1)) levels) table) datas) (lvl + 1)) next)))))
  | _ -> (((((v_renderTyFuel fuel) levels) table) datas) v)
)))

# 99 "Vuna/Compiler/Lowering/Ty.vuna"
let v_renderPiTy = (fun (levels : int B_dData_dList.t_List) (table : (string, int B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (datas : Elab_dTypes.t_DtData B_dData_dList.t_List) (lvl : int) (v : Core_dTerm.t_Value) -> ((((((v_renderPiTyFuel 256) levels) table) datas) lvl) v))

# 117 "Vuna/Compiler/Lowering/Ty.vuna"
let v_renderFieldTy = (fun (mc0 : int B_dData_dList.t_List) (mc1 : (string, int B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (mc2 : Elab_dTypes.t_DtData B_dData_dList.t_List) (mc3 : int) (mc4 : Core_dTerm.t_Value) (mc5 : int) -> (match mc4 with
  | Core_dTerm.C_Value_VNeutral (dtb__23) -> (match dtb__23 with
  | Core_dTerm.C_Neutral_NVar (dtb__24, dtb__25, dtb__26) -> (match ((Lowering_dEnv.v_levelSlotIn mc0) dtb__25) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__27) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Vuna_dIr_dModel.C_IrTy_IrTyVar (dtb__27)); B_dData_dPair.f_Pair_second = mc5 }))
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.v_icInternal "constructor field type mentions a type variable outside the family's runtime parameter slots")
  | _ -> failwith "DT: impossible branch"
)
  | Core_dTerm.C_Neutral_NGlobal (dtb__28, dtb__29) -> (match (((v_renderTyIntrinsicWith (fun (x : Core_dTerm.t_Value) -> (((((v_renderTyFuel 256) mc0) mc1) mc2) x))) dtb__28) dtb__29) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__30) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb__30; B_dData_dPair.f_Pair_second = mc5 }))
  | B_dData_dMaybe.C_Maybe_Nothing -> (match (v_reprTyIr dtb__28) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__31) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb__31; B_dData_dPair.f_Pair_second = mc5 }))
  | B_dData_dMaybe.C_Maybe_Nothing -> (match ((Elab_dRepresentation.v_findDtData dtb__28) mc2) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__32) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Vuna_dIr_dModel.C_IrTy_IrTyData (dtb__28, ((((((v_renderFamilyArgs 256) mc0) mc1) mc2) ((Lowering_dEnv.v_lookupTyParamsIn mc1) dtb__28)) dtb__29))); B_dData_dPair.f_Pair_second = mc5 }))
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.v_icInternal ("constructor field type head is not a known family: " ^ dtb__28))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Core_dTerm.C_Value_VPi (dtb__33, dtb__34, dtb__35, dtb__36, dtb__37) -> (if dtb__34 then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Vuna_dIr_dModel.C_IrTy_IrTyVar (mc5)); B_dData_dPair.f_Pair_second = (mc5 + 1) })) else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (((((v_renderPiTy mc0) mc1) mc2) mc3) mc4); B_dData_dPair.f_Pair_second = mc5 })))
  | _ -> (Base_dDiag.v_icInternal "constructor field type has no runtime rendering")
))

# 146 "Vuna/Compiler/Lowering/Ty.vuna"
let v_flagMatchesRigIn = (fun (mc0 : bool) (mc1 : Core_dTerm.t_Rig) -> (if mc0 then (B_dData_dBool.v_not (Core_dTerm.v_rigIsErased mc1)) else (Core_dTerm.v_rigIsErased mc1)))

# 151 "Vuna/Compiler/Lowering/Ty.vuna"
let rec v_ctorFieldTys = (fun (mc0 : int B_dData_dList.t_List) (mc1 : (string, int B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (mc2 : Elab_dTypes.t_DtData B_dData_dList.t_List) (mc3 : bool B_dData_dList.t_List) (mc4 : bool B_dData_dList.t_List) (mc5 : (string, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc6 : int) (mc7 : Core_dTerm.t_Value) (mc8 : int) -> (match mc3 with
  | B_dData_dList.C_List__x58__x58_ (dtb__38, dtb__39) -> (match mc4 with
  | B_dData_dList.C_List__x58__x58_ (dtb__40, dtb__41) -> (match mc5 with
  | B_dData_dList.C_List__x58__x58_ (dtb__42, dtb__43) -> (match dtb__42 with
  | { B_dData_dPair.f_Pair_first = dtb__44; B_dData_dPair.f_Pair_second = dtb__45 } -> (if ((v_flagMatchesRigIn dtb__38) dtb__45) then (match mc7 with
  | Core_dTerm.C_Value_VPi (dtb__46, dtb__47, dtb__48, dtb__49, dtb__50) -> (let next = ((Core_dEval.v_applyClosure dtb__50) (Core_dTerm.C_Value_VNeutral ((Core_dTerm.C_Neutral_NVar (dtb__46, mc6, B_dData_dList.C_List_Nil))))) in (if dtb__38 then (if dtb__40 then ((Base_dCommon.v_bind (((((((((v_ctorFieldTys mc0) mc1) mc2) dtb__39) dtb__41) dtb__43) (mc6 + 1)) next) mc8)) (fun (p : (Vuna_dIr_dModel.t_IrTy B_dData_dList.t_List, int) B_dData_dPair.t_Pair) -> (match p with
  | { B_dData_dPair.f_Pair_first = dtb__51; B_dData_dPair.f_Pair_second = dtb__52 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ (Vuna_dIr_dModel.C_IrTy_IrTyOpaque, dtb__51)); B_dData_dPair.f_Pair_second = dtb__52 }))
  | _ -> failwith "DT: impossible branch"
))) else ((Base_dCommon.v_bind ((((((v_renderFieldTy mc0) mc1) mc2) mc6) dtb__49) mc8)) (fun (p : (Vuna_dIr_dModel.t_IrTy, int) B_dData_dPair.t_Pair) -> (match p with
  | { B_dData_dPair.f_Pair_first = dtb__53; B_dData_dPair.f_Pair_second = dtb__54 } -> ((Base_dCommon.v_bind (((((((((v_ctorFieldTys mc0) mc1) mc2) dtb__39) dtb__41) dtb__43) (mc6 + 1)) next) dtb__54)) (fun (q : (Vuna_dIr_dModel.t_IrTy B_dData_dList.t_List, int) B_dData_dPair.t_Pair) -> (match q with
  | { B_dData_dPair.f_Pair_first = dtb__55; B_dData_dPair.f_Pair_second = dtb__56 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ (dtb__53, dtb__55)); B_dData_dPair.f_Pair_second = dtb__56 }))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))) else (((((((((v_ctorFieldTys mc0) mc1) mc2) dtb__39) dtb__41) dtb__43) (mc6 + 1)) next) mc8)))
  | _ -> (Base_dDiag.v_icInternal "constructor telescope does not match its type")
) else (Base_dDiag.v_icInternal "constructor keep flag disagrees with telescope rig"))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = mc8 }))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (match mc5 with
  | B_dData_dList.C_List__x58__x58_ (dtb__57, dtb__58) -> (Base_dDiag.v_icInternal "constructor opaque flags shorter than its shape")
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = mc8 }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (match mc4 with
  | B_dData_dList.C_List_Nil -> (match mc5 with
  | B_dData_dList.C_List__x58__x58_ (dtb__59, dtb__60) -> (Base_dDiag.v_icInternal "constructor shape has more binders than its telescope")
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = mc8 }))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List__x58__x58_ (dtb__61, dtb__62) -> (match mc5 with
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = mc8 }))
  | _ -> (Base_dDiag.v_icInternal "constructor opaque flags longer than its shape")
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 190 "Vuna/Compiler/Lowering/Ty.vuna"
let v_ctorArityNeed = (fun (levels : int B_dData_dList.t_List) (table : (string, int B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (datas : Elab_dTypes.t_DtData B_dData_dList.t_List) (c : Elab_dTypes.t_DtCtor) -> ((Base_dCommon.v_bind (((((((((v_ctorFieldTys levels) table) datas) (Elab_dRepresentation.v_ctorKeepFlags c)) ((Lowering_dEnv.v_ctorOpaqueFlagsOf datas) c)) (Elab_dTypes.v_dtCtorTelescope c)) 0) ((Core_dEval.v_eval B_dData_dList.C_List_Nil) (Elab_dTypes.v_dtCtorType c))) (Lowering_dEnv.v_listLength levels))) (fun (p : (Vuna_dIr_dModel.t_IrTy B_dData_dList.t_List, int) B_dData_dPair.t_Pair) -> (Base_dDiag.C_Check_OkC (((B_dData_dPair.v_secondOf p) - (Lowering_dEnv.v_listLength levels)))))))

# 202 "Vuna/Compiler/Lowering/Ty.vuna"
let rec v_maxIntListIn = (fun (mc0 : int B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__63, dtb__64) -> (if (dtb__63 >= (v_maxIntListIn dtb__64)) then dtb__63 else (v_maxIntListIn dtb__64))
  | B_dData_dList.C_List_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))

# 196 "Vuna/Compiler/Lowering/Ty.vuna"
let v_dataArityNeed = (fun (levels : int B_dData_dList.t_List) (table : (string, int B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (datas : Elab_dTypes.t_DtData B_dData_dList.t_List) (ctors : Elab_dTypes.t_DtCtor B_dData_dList.t_List) -> ((Base_dCommon.v_bind ((Base_dCommon.v_traverse (((v_ctorArityNeed levels) table) datas)) ctors)) (fun (ns : int B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC (((Lowering_dEnv.v_listLength levels) + (v_maxIntListIn ns)))))))

# 283 "Vuna/Compiler/Lowering/Ty.vuna"
let rec v_binderTyAtIn = (fun (mc0 : int) (mc1 : Vuna_dIr_dModel.t_IrBinder B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__65, dtb__66) -> (if (mc0 <= 0) then (if (dtb__65).Vuna_dIr_dModel.f_IrBinder_irBinderErased then B_dData_dMaybe.C_Maybe_Nothing else (dtb__65).Vuna_dIr_dModel.f_IrBinder_irBinderTy) else ((v_binderTyAtIn (mc0 - 1)) dtb__66))
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 292 "Vuna/Compiler/Lowering/Ty.vuna"
let rec v_flattenAnnotAppGo = (fun (mc0 : Core_dTerm.t_Term) (mc1 : Core_dTerm.t_Term B_dData_dList.t_List) -> (match mc0 with
  | Core_dTerm.C_Term_TRecord (dtb__67, dtb__68) -> { B_dData_dPair.f_Pair_first = (Core_dTerm.C_Term_TGlobal (dtb__67)); B_dData_dPair.f_Pair_second = ((B_dData_dList.v_append ((B_dData_dList.v_map B_dData_dPair.v_firstOf) dtb__68)) mc1) }
  | Core_dTerm.C_Term_TApp (dtb__69, dtb__70, dtb__71) -> ((v_flattenAnnotAppGo dtb__69) (B_dData_dList.C_List__x58__x58_ (dtb__70, mc1)))
  | _ -> { B_dData_dPair.f_Pair_first = mc0; B_dData_dPair.f_Pair_second = mc1 }
))

# 289 "Vuna/Compiler/Lowering/Ty.vuna"
let v_flattenAnnotApp = (fun (t : Core_dTerm.t_Term) -> ((v_flattenAnnotAppGo t) B_dData_dList.C_List_Nil))

# 351 "Vuna/Compiler/Lowering/Ty.vuna"
let v_globalTyTermOf = (fun (env : Lowering_dEnv.t_LwEnv) (g : string) -> (match ((((B_dContainer_dHashMap.v_lookup B_dData_dString.v_Hashable_uString) B_dData_dString.v_Eq_uString) g) (env).Lowering_dEnv.f_LwEnv_lwDefTbl) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__72) -> (B_dData_dMaybe.C_Maybe_Just ((Elab_dTypes.v_dtDefType dtb__72)))
  | B_dData_dMaybe.C_Maybe_Nothing -> ((((B_dContainer_dHashMap.v_lookup B_dData_dString.v_Hashable_uString) B_dData_dString.v_Eq_uString) g) (env).Lowering_dEnv.f_LwEnv_lwGlobals)
  | _ -> failwith "DT: impossible branch"
))

# 371 "Vuna/Compiler/Lowering/Ty.vuna"
let rec v_flattenAnnotAppRigGo = (fun (mc0 : Core_dTerm.t_Term) (mc1 : (Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc0 with
  | Core_dTerm.C_Term_TRecord (dtb__73, dtb__74) -> { B_dData_dPair.f_Pair_first = (Core_dTerm.C_Term_TGlobal (dtb__73)); B_dData_dPair.f_Pair_second = ((B_dData_dList.v_append dtb__74) mc1) }
  | Core_dTerm.C_Term_TApp (dtb__75, dtb__76, dtb__77) -> ((v_flattenAnnotAppRigGo dtb__75) (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__76; B_dData_dPair.f_Pair_second = dtb__77 }, mc1)))
  | _ -> { B_dData_dPair.f_Pair_first = mc0; B_dData_dPair.f_Pair_second = mc1 }
))

# 368 "Vuna/Compiler/Lowering/Ty.vuna"
let v_flattenAnnotAppRig = (fun (t : Core_dTerm.t_Term) -> ((v_flattenAnnotAppRigGo t) B_dData_dList.C_List_Nil))

# 376 "Vuna/Compiler/Lowering/Ty.vuna"
let rec v_countRuntimeArgs = (fun (mc0 : (Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__78, dtb__79) -> (match dtb__78 with
  | { B_dData_dPair.f_Pair_first = dtb__80; B_dData_dPair.f_Pair_second = dtb__81 } -> (if (Core_dTerm.v_rigIsErased dtb__81) then (v_countRuntimeArgs dtb__79) else (1 + (v_countRuntimeArgs dtb__79)))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))

# 381 "Vuna/Compiler/Lowering/Ty.vuna"
let rec v_peelIrFuns = (fun (mc0 : int) (mc1 : Vuna_dIr_dModel.t_IrTy B_dData_dMaybe.t_Maybe) -> (match mc1 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__82) -> (if (mc0 <= 0) then (B_dData_dMaybe.C_Maybe_Just (dtb__82)) else (match dtb__82 with
  | Vuna_dIr_dModel.C_IrTy_IrTyFun (dtb__83, dtb__84) -> ((v_peelIrFuns (mc0 - 1)) (B_dData_dMaybe.C_Maybe_Just (dtb__84)))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
))
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 393 "Vuna/Compiler/Lowering/Ty.vuna"
let rec v_peelPiArgsTy = (fun (fuel : int) (env : Lowering_dEnv.t_LwEnv) (v : Core_dTerm.t_Value) (args : (Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (if (fuel <= 0) then B_dData_dMaybe.C_Maybe_Nothing else (match v with
  | Core_dTerm.C_Value_VPi (dtb__85, dtb__86, dtb__87, dtb__88, dtb__89) -> (if (Core_dTerm.v_rigIsErased dtb__87) then (let nd_uscrut9 = args in (match nd_uscrut9 with
  | B_dData_dList.C_List_Nil -> (B_dData_dMaybe.C_Maybe_Just ((((((v_renderPiTy B_dData_dList.C_List_Nil) (env).Lowering_dEnv.f_LwEnv_lwTyParams) (env).Lowering_dEnv.f_LwEnv_lwDatas) 0) v)))
  | B_dData_dList.C_List__x58__x58_ (dtb__90, dtb__91) -> (match dtb__90 with
  | { B_dData_dPair.f_Pair_first = dtb__92; B_dData_dPair.f_Pair_second = dtb__93 } -> (if (Core_dTerm.v_rigIsErased dtb__93) then ((((v_peelPiArgsTy (fuel - 1)) env) ((Core_dEval.v_applyClosure dtb__89) ((Core_dEval.v_eval B_dData_dList.C_List_Nil) dtb__92))) dtb__91) else ((((v_peelPiArgsTy (fuel - 1)) env) ((Core_dEval.v_applyClosure dtb__89) (Core_dTerm.C_Value_VNeutral ((Core_dTerm.C_Neutral_NVar (dtb__85, 0, B_dData_dList.C_List_Nil)))))) args))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) else (let nd_uscrut9 = args in (match nd_uscrut9 with
  | B_dData_dList.C_List_Nil -> (B_dData_dMaybe.C_Maybe_Just ((((((v_renderPiTy B_dData_dList.C_List_Nil) (env).Lowering_dEnv.f_LwEnv_lwTyParams) (env).Lowering_dEnv.f_LwEnv_lwDatas) 0) v)))
  | B_dData_dList.C_List__x58__x58_ (dtb__94, dtb__95) -> (match dtb__94 with
  | { B_dData_dPair.f_Pair_first = dtb__96; B_dData_dPair.f_Pair_second = dtb__97 } -> ((((v_peelPiArgsTy (fuel - 1)) env) ((Core_dEval.v_applyClosure dtb__89) (Core_dTerm.C_Value_VNeutral ((Core_dTerm.C_Neutral_NVar (dtb__85, 0, B_dData_dList.C_List_Nil)))))) dtb__95)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> (B_dData_dMaybe.C_Maybe_Just ((((((v_renderPiTy B_dData_dList.C_List_Nil) (env).Lowering_dEnv.f_LwEnv_lwTyParams) (env).Lowering_dEnv.f_LwEnv_lwDatas) 0) v)))
)))

# 430 "Vuna/Compiler/Lowering/Ty.vuna"
let rec v_nthTermIn = (fun (mc0 : Core_dTerm.t_Term B_dData_dList.t_List) (mc1 : int) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__98, dtb__99) -> (if (mc1 <= 0) then (B_dData_dMaybe.C_Maybe_Just (dtb__98)) else ((v_nthTermIn dtb__99) (mc1 - 1)))
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 229 "Vuna/Compiler/Lowering/Ty.vuna"
let rec v_annotTyOfFuel = (fun (fuel : int) (dflt : Vuna_dIr_dModel.t_IrTy B_dData_dMaybe.t_Maybe) (env : Lowering_dEnv.t_LwEnv) (binders : Vuna_dIr_dModel.t_IrBinder B_dData_dList.t_List) (t : Core_dTerm.t_Term) -> (if (fuel <= 0) then dflt else (match t with
  | Core_dTerm.C_Term_TVar (dtb__100, dtb__101, dtb__102) -> (match ((v_binderTyAtIn dtb__101) binders) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__103) -> (B_dData_dMaybe.C_Maybe_Just (dtb__103))
  | B_dData_dMaybe.C_Maybe_Nothing -> dflt
  | _ -> failwith "DT: impossible branch"
)
  | Core_dTerm.C_Term_TGlobal (dtb__104) -> ((((((v_annotHeadTy (fuel - 1)) dflt) env) binders) dtb__104) B_dData_dList.C_List_Nil)
  | Core_dTerm.C_Term_TApp (dtb__105, dtb__106, dtb__107) -> (match (v_flattenAnnotApp t) with
  | { B_dData_dPair.f_Pair_first = dtb__108; B_dData_dPair.f_Pair_second = dtb__109 } -> (match dtb__108 with
  | Core_dTerm.C_Term_TGlobal (dtb__110) -> ((((((v_annotHeadTy (fuel - 1)) dflt) env) binders) dtb__110) dtb__109)
  | _ -> dflt
)
  | _ -> failwith "DT: impossible branch"
)
  | Core_dTerm.C_Term_TRecord (dtb__111, dtb__112) -> ((((((v_annotHeadTy (fuel - 1)) dflt) env) binders) dtb__111) ((B_dData_dList.v_map B_dData_dPair.v_firstOf) dtb__112))
  | Core_dTerm.C_Term_TCon (dtb__113, dtb__114) -> (((((v_annotConTy (fuel - 1)) dflt) env) dtb__113) dtb__114)
  | Core_dTerm.C_Term_TMk (dtb__115, dtb__116) -> (((((v_annotConTy (fuel - 1)) dflt) env) dtb__115) dtb__116)
  | Core_dTerm.C_Term_TInt (dtb__117) -> (B_dData_dMaybe.C_Maybe_Just (Vuna_dIr_dModel.C_IrTy_IrTyInt))
  | Core_dTerm.C_Term_TStr (dtb__118) -> (B_dData_dMaybe.C_Maybe_Just (Vuna_dIr_dModel.C_IrTy_IrTyStr))
  | Core_dTerm.C_Term_TBool (dtb__119) -> (B_dData_dMaybe.C_Maybe_Just (Vuna_dIr_dModel.C_IrTy_IrTyBool))
  | Core_dTerm.C_Term_TFloat (dtb__120) -> (B_dData_dMaybe.C_Maybe_Just (Vuna_dIr_dModel.C_IrTy_IrTyFloat))
  | Core_dTerm.C_Term_TIf (dtb__121, dtb__122, dtb__123) -> (((((v_annotTyOfFuel (fuel - 1)) dflt) env) binders) dtb__122)
  | Core_dTerm.C_Term_TPi (dtb__124, dtb__125, dtb__126, dtb__127, dtb__128) -> (if (Core_dTerm.v_rigIsErased dtb__126) then dflt else (match (((((v_annotTyOfFuel (fuel - 1)) dflt) env) binders) dtb__127) with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb__129) -> (match (((((v_annotTyOfFuel (fuel - 1)) dflt) env) (B_dData_dList.C_List__x58__x58_ (((Vuna_dIr_dModel.v_mkIrBinderTyped dtb__124) dtb__129), binders))) dtb__128) with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb__130) -> (B_dData_dMaybe.C_Maybe_Just ((Vuna_dIr_dModel.C_IrTy_IrTyFun (dtb__129, dtb__130))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))
  | _ -> dflt
)))
# 266 "Vuna/Compiler/Lowering/Ty.vuna"
and v_annotConTy = (fun (fuel : int) (dflt : Vuna_dIr_dModel.t_IrTy B_dData_dMaybe.t_Maybe) (env : Lowering_dEnv.t_LwEnv) (c : string) (args : (Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (if (fuel <= 0) then dflt else (let nd_uscrut5 = ((((B_dContainer_dHashMap.v_lookup B_dData_dString.v_Hashable_uString) B_dData_dString.v_Eq_uString) c) (env).Lowering_dEnv.f_LwEnv_lwCtors) in (match nd_uscrut5 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__131) -> (match dtb__131 with
  | { B_dData_dPair.f_Pair_first = dtb__132; B_dData_dPair.f_Pair_second = dtb__133 } -> (match (v_reprTyIr dtb__132) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__134) -> (B_dData_dMaybe.C_Maybe_Just (dtb__134))
  | B_dData_dMaybe.C_Maybe_Nothing -> (match (((v_ctorTypeArgsOf env) c) args) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__135) -> (B_dData_dMaybe.C_Maybe_Just ((Vuna_dIr_dModel.C_IrTy_IrTyData (dtb__132, dtb__135))))
  | B_dData_dMaybe.C_Maybe_Nothing -> dflt
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> dflt
  | _ -> failwith "DT: impossible branch"
))))
# 297 "Vuna/Compiler/Lowering/Ty.vuna"
and v_annotHeadTy = (fun (fuel : int) (dflt : Vuna_dIr_dModel.t_IrTy B_dData_dMaybe.t_Maybe) (env : Lowering_dEnv.t_LwEnv) (binders : Vuna_dIr_dModel.t_IrBinder B_dData_dList.t_List) (g : string) (args : Core_dTerm.t_Term B_dData_dList.t_List) -> (if (fuel <= 0) then dflt else (if (g = "Array") then (let nd_uscrut6 = args in (match nd_uscrut6 with
  | B_dData_dList.C_List__x58__x58_ (dtb__136, dtb__137) -> (match dtb__137 with
  | B_dData_dList.C_List_Nil -> (match (((((v_annotTyOfFuel (fuel - 1)) dflt) env) binders) dtb__136) with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb__138) -> (B_dData_dMaybe.C_Maybe_Just ((Vuna_dIr_dModel.C_IrTy_IrTyArray (dtb__138))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> dflt
)
  | _ -> dflt
)) else (if (g = "IORef") then (let nd_uscrut6 = args in (match nd_uscrut6 with
  | B_dData_dList.C_List__x58__x58_ (dtb__139, dtb__140) -> (match dtb__140 with
  | B_dData_dList.C_List_Nil -> (match (((((v_annotTyOfFuel (fuel - 1)) dflt) env) binders) dtb__139) with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb__141) -> (B_dData_dMaybe.C_Maybe_Just ((Vuna_dIr_dModel.C_IrTy_IrTyRef (dtb__141))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> dflt
)
  | _ -> dflt
)) else (match (v_reprTyIr g) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__142) -> (match args with
  | B_dData_dList.C_List_Nil -> (B_dData_dMaybe.C_Maybe_Just (dtb__142))
  | _ -> dflt
)
  | B_dData_dMaybe.C_Maybe_Nothing -> (match ((Elab_dRepresentation.v_findDtData g) (env).Lowering_dEnv.f_LwEnv_lwDatas) with
  | B_dData_dMaybe.C_Maybe_Nothing -> dflt
  | B_dData_dMaybe.C_Maybe_Just (dtb__143) -> (match ((((((v_annotFamilyArgs (fuel - 1)) dflt) env) binders) ((Lowering_dEnv.v_lookupTyParamsIn (env).Lowering_dEnv.f_LwEnv_lwTyParams) g)) args) with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb__144) -> (B_dData_dMaybe.C_Maybe_Just ((Vuna_dIr_dModel.C_IrTy_IrTyData (g, dtb__144))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))))
# 412 "Vuna/Compiler/Lowering/Ty.vuna"
and v_annotFamilyArgs = (fun (fuel : int) (dflt : Vuna_dIr_dModel.t_IrTy B_dData_dMaybe.t_Maybe) (env : Lowering_dEnv.t_LwEnv) (binders : Vuna_dIr_dModel.t_IrBinder B_dData_dList.t_List) (usedPats : int B_dData_dList.t_List) (args : Core_dTerm.t_Term B_dData_dList.t_List) -> (if (fuel <= 0) then B_dData_dMaybe.C_Maybe_Nothing else (match usedPats with
  | B_dData_dList.C_List_Nil -> (B_dData_dMaybe.C_Maybe_Just (B_dData_dList.C_List_Nil))
  | B_dData_dList.C_List__x58__x58_ (dtb__145, dtb__146) -> (match ((v_nthTermIn args) dtb__145) with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb__147) -> (match (((((v_annotTyOfFuel (fuel - 1)) dflt) env) binders) dtb__147) with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb__148) -> (match ((((((v_annotFamilyArgs (fuel - 1)) dflt) env) binders) dtb__146) args) with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb__149) -> (B_dData_dMaybe.C_Maybe_Just ((B_dData_dList.C_List__x58__x58_ (dtb__148, dtb__149))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))
# 435 "Vuna/Compiler/Lowering/Ty.vuna"
and v_ctorTypeArgsOf = (fun (env : Lowering_dEnv.t_LwEnv) (ctor : string) (args : (Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (let nd_uscrut3 = ((((B_dContainer_dHashMap.v_lookup B_dData_dString.v_Hashable_uString) B_dData_dString.v_Eq_uString) ctor) (env).Lowering_dEnv.f_LwEnv_lwCtors) in (match nd_uscrut3 with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb__150) -> (match dtb__150 with
  | { B_dData_dPair.f_Pair_first = dtb__151; B_dData_dPair.f_Pair_second = dtb__152 } -> (match ((Elab_dRepresentation.v_findDtData dtb__151) (env).Lowering_dEnv.f_LwEnv_lwDatas) with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb__153) -> ((((((v_annotFamilyArgs 256) B_dData_dMaybe.C_Maybe_Nothing) env) B_dData_dList.C_List_Nil) ((Lowering_dEnv.v_lookupTyParamsIn (env).Lowering_dEnv.f_LwEnv_lwTyParams) dtb__151)) ((B_dData_dList.v_map B_dData_dPair.v_firstOf) args))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))

# 218 "Vuna/Compiler/Lowering/Ty.vuna"
let v_annotTyOf = (fun (env : Lowering_dEnv.t_LwEnv) (binders : Vuna_dIr_dModel.t_IrBinder B_dData_dList.t_List) (t : Core_dTerm.t_Term) -> (((((v_annotTyOfFuel 256) B_dData_dMaybe.C_Maybe_Nothing) env) binders) t))

# 221 "Vuna/Compiler/Lowering/Ty.vuna"
let v_annotTyOfTotal = (fun (env : Lowering_dEnv.t_LwEnv) (binders : Vuna_dIr_dModel.t_IrBinder B_dData_dList.t_List) (t : Core_dTerm.t_Term) -> (match (((((v_annotTyOfFuel 256) (B_dData_dMaybe.C_Maybe_Just (Vuna_dIr_dModel.C_IrTy_IrTyOpaque))) env) binders) t) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__154) -> dtb__154
  | B_dData_dMaybe.C_Maybe_Nothing -> Vuna_dIr_dModel.C_IrTy_IrTyOpaque
  | _ -> failwith "DT: impossible branch"
))

# 358 "Vuna/Compiler/Lowering/Ty.vuna"
let v_annotGlobalTy = (fun (env : Lowering_dEnv.t_LwEnv) (binders : Vuna_dIr_dModel.t_IrBinder B_dData_dList.t_List) (g : string) -> (match ((Elab_dRepresentation.v_findDtData g) (env).Lowering_dEnv.f_LwEnv_lwDatas) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__155) -> (((v_annotTyOf env) binders) (Core_dTerm.C_Term_TGlobal (g)))
  | B_dData_dMaybe.C_Maybe_Nothing -> (match ((v_globalTyTermOf env) g) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__156) -> (B_dData_dMaybe.C_Maybe_Just ((((((v_renderPiTy B_dData_dList.C_List_Nil) (env).Lowering_dEnv.f_LwEnv_lwTyParams) (env).Lowering_dEnv.f_LwEnv_lwDatas) 0) ((Core_dEval.v_eval B_dData_dList.C_List_Nil) dtb__156))))
  | B_dData_dMaybe.C_Maybe_Nothing -> (((v_annotTyOf env) binders) (Core_dTerm.C_Term_TGlobal (g)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 335 "Vuna/Compiler/Lowering/Ty.vuna"
let v_annotCalleeTy = (fun (mc0 : Lowering_dEnv.t_LwEnv) (mc1 : Vuna_dIr_dModel.t_IrBinder B_dData_dList.t_List) (mc2 : Core_dTerm.t_Term) -> (match mc2 with
  | Core_dTerm.C_Term_TApp (dtb__157, dtb__158, dtb__159) -> (let nd_uscrut6 = (v_flattenAnnotAppRig mc2) in (match nd_uscrut6 with
  | { B_dData_dPair.f_Pair_first = dtb__160; B_dData_dPair.f_Pair_second = dtb__161 } -> (match dtb__160 with
  | Core_dTerm.C_Term_TGlobal (dtb__162) -> (match ((Elab_dRepresentation.v_findDtData dtb__162) (mc0).Lowering_dEnv.f_LwEnv_lwDatas) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__163) -> (((v_annotTyOf mc0) mc1) mc2)
  | B_dData_dMaybe.C_Maybe_Nothing -> (match ((v_globalTyTermOf mc0) dtb__162) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__164) -> ((((v_peelPiArgsTy 256) mc0) ((Core_dEval.v_eval B_dData_dList.C_List_Nil) dtb__164)) dtb__161)
  | B_dData_dMaybe.C_Maybe_Nothing -> ((v_peelIrFuns (v_countRuntimeArgs dtb__161)) (((v_annotTyOf mc0) mc1) (Core_dTerm.C_Term_TGlobal (dtb__162))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> ((v_peelIrFuns (v_countRuntimeArgs dtb__161)) (B_dData_dMaybe.C_Maybe_Just ((((v_annotTyOfTotal mc0) mc1) dtb__160))))
)
  | _ -> failwith "DT: impossible branch"
))
  | Core_dTerm.C_Term_TGlobal (dtb__165) -> (((v_annotGlobalTy mc0) mc1) dtb__165)
  | _ -> (((v_annotTyOf mc0) mc1) mc2)
))

# 451 "Vuna/Compiler/Lowering/Ty.vuna"
let rec v_findCtorInLocal = (fun (mc0 : string) (mc1 : Elab_dTypes.t_DtCtor B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__166, dtb__167) -> (if ((Elab_dTypes.v_dtCtorName dtb__166) = mc0) then (B_dData_dMaybe.C_Maybe_Just (dtb__166)) else ((v_findCtorInLocal mc0) dtb__167))
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 457 "Vuna/Compiler/Lowering/Ty.vuna"
let v_ctorKeptFieldTys = (fun (env : Lowering_dEnv.t_LwEnv) (ctor : string) -> (let nd_uscrut2 = ((((B_dContainer_dHashMap.v_lookup B_dData_dString.v_Hashable_uString) B_dData_dString.v_Eq_uString) ctor) (env).Lowering_dEnv.f_LwEnv_lwCtors) in (match nd_uscrut2 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__168) -> (match dtb__168 with
  | { B_dData_dPair.f_Pair_first = dtb__169; B_dData_dPair.f_Pair_second = dtb__170 } -> (match ((Elab_dRepresentation.v_findDtData dtb__169) (env).Lowering_dEnv.f_LwEnv_lwDatas) with
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.C_Check_OkC (B_dData_dList.C_List_Nil))
  | B_dData_dMaybe.C_Maybe_Just (dtb__171) -> (match ((v_findCtorInLocal ctor) (Elab_dTypes.v_dtDataCtors dtb__171)) with
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.C_Check_OkC (B_dData_dList.C_List_Nil))
  | B_dData_dMaybe.C_Maybe_Just (dtb__172) -> (let levels = ((Lowering_dEnv.v_lookupTyParamsIn (env).Lowering_dEnv.f_LwEnv_lwTyParams) dtb__169) in ((Base_dCommon.v_bind (((((((((v_ctorFieldTys levels) (env).Lowering_dEnv.f_LwEnv_lwTyParams) (env).Lowering_dEnv.f_LwEnv_lwDatas) dtb__170) ((Lowering_dEnv.v_ctorOpaqueFlagsOf (env).Lowering_dEnv.f_LwEnv_lwDatas) dtb__172)) (Elab_dTypes.v_dtCtorTelescope dtb__172)) 0) ((Core_dEval.v_eval B_dData_dList.C_List_Nil) (Elab_dTypes.v_dtCtorType dtb__172))) (Lowering_dEnv.v_listLength levels))) (fun (p : (Vuna_dIr_dModel.t_IrTy B_dData_dList.t_List, int) B_dData_dPair.t_Pair) -> (Base_dDiag.C_Check_OkC ((B_dData_dPair.v_firstOf p))))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.C_Check_OkC (B_dData_dList.C_List_Nil))
  | _ -> failwith "DT: impossible branch"
)))

# 490 "Vuna/Compiler/Lowering/Ty.vuna"
let v_tyDeclOf = (fun (table : (string, int B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (allDatas : Elab_dTypes.t_DtData B_dData_dList.t_List) (unboxed : (string, (Elab_dTypes.t_DtCtor, int) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (d : Elab_dTypes.t_DtData) -> (let levels = ((Lowering_dEnv.v_lookupTyParamsIn table) (Elab_dTypes.v_dtDataName d)) in (let arity = (Lowering_dEnv.v_listLength levels) in (let nd_uscrut6 = ((Elab_dRepresentation.v_lookupUnboxedInfo (Elab_dTypes.v_dtDataName d)) unboxed) in (match nd_uscrut6 with
  | B_dData_dMaybe.C_Maybe_Nothing -> (if (Lowering_dEnv.v_hasRecordRepr d) then (let nd_uscrut8 = (Elab_dTypes.v_dtDataCtors d) in (match nd_uscrut8 with
  | B_dData_dList.C_List__x58__x58_ (dtb__173, dtb__174) -> (match dtb__174 with
  | B_dData_dList.C_List_Nil -> ((Base_dCommon.v_bind (((((((((v_ctorFieldTys levels) table) allDatas) (Elab_dRepresentation.v_ctorKeepFlags dtb__173)) ((Lowering_dEnv.v_ctorOpaqueFlagsOf allDatas) dtb__173)) (Elab_dTypes.v_dtCtorTelescope dtb__173)) 0) ((Core_dEval.v_eval B_dData_dList.C_List_Nil) (Elab_dTypes.v_dtCtorType dtb__173))) arity)) (fun (p : (Vuna_dIr_dModel.t_IrTy B_dData_dList.t_List, int) B_dData_dPair.t_Pair) -> (let fields = (Lowering_dEnv.v_recordRtFields d) in (let tys = (B_dData_dPair.v_firstOf p) in (if ((Lowering_dEnv.v_listLength fields) = (Lowering_dEnv.v_listLength tys)) then (Base_dDiag.C_Check_OkC ((Vuna_dIr_dModel.C_IrTyDecl_IrRecordDecl ((Elab_dTypes.v_dtDataName d), (B_dData_dPair.v_secondOf p), fields, tys)))) else (Base_dDiag.v_icInternal (String.concat "" ["record `"; (Elab_dTypes.v_dtDataName d); "` has "; (bi_strFromInt (Lowering_dEnv.v_listLength fields)); " runtime fields but "; (bi_strFromInt (Lowering_dEnv.v_listLength tys)); " field types"])))))))
  | _ -> (Base_dDiag.v_icInternal ("record family must have exactly one constructor: " ^ (Elab_dTypes.v_dtDataName d)))
)
  | _ -> (Base_dDiag.v_icInternal ("record family must have exactly one constructor: " ^ (Elab_dTypes.v_dtDataName d)))
)) else ((Base_dCommon.v_bind ((((v_dataArityNeed levels) table) allDatas) (Elab_dTypes.v_dtDataCtors d))) (fun (fullArity : int) -> ((Base_dCommon.v_bind ((Base_dCommon.v_traverse (fun (c : Elab_dTypes.t_DtCtor) -> ((Base_dCommon.v_bind (((((((((v_ctorFieldTys levels) table) allDatas) (Elab_dRepresentation.v_ctorKeepFlags c)) ((Lowering_dEnv.v_ctorOpaqueFlagsOf allDatas) c)) (Elab_dTypes.v_dtCtorTelescope c)) 0) ((Core_dEval.v_eval B_dData_dList.C_List_Nil) (Elab_dTypes.v_dtCtorType c))) (Lowering_dEnv.v_listLength levels))) (fun (p : (Vuna_dIr_dModel.t_IrTy B_dData_dList.t_List, int) B_dData_dPair.t_Pair) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Elab_dTypes.v_dtCtorName c); B_dData_dPair.f_Pair_second = (B_dData_dPair.v_firstOf p) })))))) (Elab_dTypes.v_dtDataCtors d))) (fun (ctors : (string, Vuna_dIr_dModel.t_IrTy B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((Vuna_dIr_dModel.C_IrTyDecl_IrVariantDecl ((Elab_dTypes.v_dtDataName d), fullArity, ctors)))))))))
  | B_dData_dMaybe.C_Maybe_Just (dtb__175) -> (match dtb__175 with
  | { B_dData_dPair.f_Pair_first = dtb__176; B_dData_dPair.f_Pair_second = dtb__177 } -> ((Base_dCommon.v_bind (((((((((v_ctorFieldTys levels) table) allDatas) (Elab_dRepresentation.v_ctorKeepFlags dtb__176)) ((Lowering_dEnv.v_ctorOpaqueFlagsOf allDatas) dtb__176)) (Elab_dTypes.v_dtCtorTelescope dtb__176)) 0) ((Core_dEval.v_eval B_dData_dList.C_List_Nil) (Elab_dTypes.v_dtCtorType dtb__176))) arity)) (fun (p : (Vuna_dIr_dModel.t_IrTy B_dData_dList.t_List, int) B_dData_dPair.t_Pair) -> (let nd_uscrut14 = (B_dData_dPair.v_firstOf p) in (match nd_uscrut14 with
  | B_dData_dList.C_List__x58__x58_ (dtb__178, dtb__179) -> (match dtb__179 with
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC ((Vuna_dIr_dModel.C_IrTyDecl_IrUnboxedDecl ((Elab_dTypes.v_dtDataName d), (B_dData_dPair.v_secondOf p), dtb__178))))
  | _ -> (Base_dDiag.v_icInternal ("unboxed constructor does not have exactly one kept field: " ^ (Elab_dTypes.v_dtCtorName dtb__176)))
)
  | _ -> (Base_dDiag.v_icInternal ("unboxed constructor does not have exactly one kept field: " ^ (Elab_dTypes.v_dtCtorName dtb__176)))
))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))))

# 483 "Vuna/Compiler/Lowering/Ty.vuna"
let rec v_tyDeclsGo = (fun (mc0 : (string, int B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (mc1 : Elab_dTypes.t_DtData B_dData_dList.t_List) (mc2 : (string, (Elab_dTypes.t_DtCtor, int) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc3 : Elab_dTypes.t_DtData B_dData_dList.t_List) -> (match mc3 with
  | B_dData_dList.C_List__x58__x58_ (dtb__180, dtb__181) -> ((Base_dCommon.v_bind ((((v_tyDeclOf mc0) mc1) mc2) dtb__180)) (fun (decl : Vuna_dIr_dModel.t_IrTyDecl) -> ((Base_dCommon.v_bind ((((v_tyDeclsGo mc0) mc1) mc2) dtb__181)) (fun (tail : Vuna_dIr_dModel.t_IrTyDecl B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((B_dData_dList.C_List__x58__x58_ (decl, tail))))))))
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (B_dData_dList.C_List_Nil))
  | _ -> failwith "DT: impossible branch"
))

# 480 "Vuna/Compiler/Lowering/Ty.vuna"
let v_tyDeclsOf = (fun (tyParams : (string, int B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (unboxed : (string, (Elab_dTypes.t_DtCtor, int) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (allDatas : Elab_dTypes.t_DtData B_dData_dList.t_List) (subset : Elab_dTypes.t_DtData B_dData_dList.t_List) -> ((((v_tyDeclsGo tyParams) allDatas) unboxed) subset))

# 524 "Vuna/Compiler/Lowering/Ty.vuna"
let v_tyDeclTys = (fun (mc0 : Vuna_dIr_dModel.t_IrTyDecl) -> (match mc0 with
  | Vuna_dIr_dModel.C_IrTyDecl_IrUnboxedDecl (dtb__182, dtb__183, dtb__184) -> (B_dData_dList.C_List__x58__x58_ (dtb__184, B_dData_dList.C_List_Nil))
  | Vuna_dIr_dModel.C_IrTyDecl_IrRecordDecl (dtb__185, dtb__186, dtb__187, dtb__188) -> dtb__188
  | Vuna_dIr_dModel.C_IrTyDecl_IrVariantDecl (dtb__189, dtb__190, dtb__191) -> ((B_dData_dList.v_concatMap B_dData_dPair.v_secondOf) dtb__191)
  | _ -> failwith "DT: impossible branch"
))

# 533 "Vuna/Compiler/Lowering/Ty.vuna"
let rec v_foldlTyNames = (fun (mc0 : Vuna_dIr_dModel.t_IrTy B_dData_dList.t_List) (mc1 : string B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__192, dtb__193) -> ((v_foldlTyNames dtb__193) ((v_tyNamesInto dtb__192) mc1))
  | B_dData_dList.C_List_Nil -> mc1
  | _ -> failwith "DT: impossible branch"
))
# 537 "Vuna/Compiler/Lowering/Ty.vuna"
and v_tyNamesInto = (fun (mc0 : Vuna_dIr_dModel.t_IrTy) (mc1 : string B_dData_dList.t_List) -> (match mc0 with
  | Vuna_dIr_dModel.C_IrTy_IrTyData (dtb__194, dtb__195) -> ((v_foldlTyNames dtb__195) ((Lowering_dEnv.v_pushDep dtb__194) mc1))
  | Vuna_dIr_dModel.C_IrTy_IrTyFun (dtb__196, dtb__197) -> ((v_tyNamesInto dtb__197) ((v_tyNamesInto dtb__196) mc1))
  | Vuna_dIr_dModel.C_IrTy_IrTyRef (dtb__198) -> ((v_tyNamesInto dtb__198) mc1)
  | Vuna_dIr_dModel.C_IrTy_IrTyArray (dtb__199) -> ((v_tyNamesInto dtb__199) mc1)
  | Vuna_dIr_dModel.C_IrTy_IrTyOpaque -> mc1
  | Vuna_dIr_dModel.C_IrTy_IrTyFloat -> mc1
  | Vuna_dIr_dModel.C_IrTy_IrTyBool -> mc1
  | Vuna_dIr_dModel.C_IrTy_IrTyStr -> mc1
  | Vuna_dIr_dModel.C_IrTy_IrTyInt -> mc1
  | Vuna_dIr_dModel.C_IrTy_IrTyVar (dtb__200) -> mc1
  | _ -> failwith "DT: impossible branch"
))

# 529 "Vuna/Compiler/Lowering/Ty.vuna"
let rec v_tyDeclRefsGo = (fun (mc0 : Vuna_dIr_dModel.t_IrTy B_dData_dList.t_List B_dData_dList.t_List) (mc1 : string B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__201, dtb__202) -> ((v_tyDeclRefsGo dtb__202) ((v_foldlTyNames dtb__201) mc1))
  | B_dData_dList.C_List_Nil -> (B_dData_dList.v_reverse mc1)
  | _ -> failwith "DT: impossible branch"
))

# 521 "Vuna/Compiler/Lowering/Ty.vuna"
let v_tyDeclRefs = (fun (decls : Vuna_dIr_dModel.t_IrTyDecl B_dData_dList.t_List) -> ((v_tyDeclRefsGo ((B_dData_dList.v_map v_tyDeclTys) decls)) B_dData_dList.C_List_Nil))
