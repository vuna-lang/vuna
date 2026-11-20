open Vuna_runtime
# 41 "Vuna/Compiler/Elab/Term/Support.vuna"
let rec v_allImplicitPrefix = (fun (mc0 : Core_dTerm.t_Term) -> (match mc0 with
  | Core_dTerm.C_Term_TPi (dtb__0, dtb__1, dtb__2, dtb__3, dtb__4) -> (if dtb__1 then (v_allImplicitPrefix dtb__4) else false)
  | _ -> true
))

# 49 "Vuna/Compiler/Elab/Term/Support.vuna"
let rec v_instantiateAllImplicitFuel = (fun (fuel : int) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (head : Core_dTerm.t_Term) (ty : Core_dTerm.t_Value) (acc : (Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (if (fuel <= 0) then { B_dData_dPair.f_Pair_first = ((Elab_dMeta.v_foldAppTerms head) (B_dData_dList.v_reverse acc)); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = ty; B_dData_dPair.f_Pair_second = ec } } else (match ((Elab_dTypes.v_forceVal ec) ty) with
  | Core_dTerm.C_Value_VPi (dtb__5, dtb__6, dtb__7, dtb__8, dtb__9) -> (if dtb__6 then (let m = (Elab_dTypes.v_ecNext ec) in (match ((Elab_dTypes.v_newMeta ctx) ec) with
  | { B_dData_dPair.f_Pair_first = dtb__10; B_dData_dPair.f_Pair_second = dtb__11 } -> ((((((v_instantiateAllImplicitFuel (fuel - 1)) ctx) dtb__11) head) ((Core_dEval.v_applyClosure dtb__9) (Core_dTerm.C_Value_VMeta (m, B_dData_dList.C_List_Nil)))) (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__10; B_dData_dPair.f_Pair_second = dtb__7 }, acc)))
  | _ -> failwith "DT: impossible branch"
)) else { B_dData_dPair.f_Pair_first = ((Elab_dMeta.v_foldAppTerms head) (B_dData_dList.v_reverse acc)); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = ty; B_dData_dPair.f_Pair_second = ec } })
  | _ -> { B_dData_dPair.f_Pair_first = ((Elab_dMeta.v_foldAppTerms head) (B_dData_dList.v_reverse acc)); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = ty; B_dData_dPair.f_Pair_second = ec } }
)))

# 46 "Vuna/Compiler/Elab/Term/Support.vuna"
let v_instantiateAllImplicit = (fun (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (head : Core_dTerm.t_Term) (ty : Core_dTerm.t_Value) (acc : (Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) -> ((((((v_instantiateAllImplicitFuel 64) ctx) ec) head) ty) acc))

# 21 "Vuna/Compiler/Elab/Term/Support.vuna"
let v_inferVarRef = (fun (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (name : string) (sp : Base_dSource.t_Span) -> (let nd_uscrut5 = ((Elab_dTypes.v_ctxLookup name) ctx) in (match nd_uscrut5 with
  | B_dData_dMaybe.C_Maybe_Nothing -> (let nd_uscrut7 = (((Elab_dMeta.v_valueLookup globals) ec) name) in (match nd_uscrut7 with
  | B_dData_dMaybe.C_Maybe_Nothing -> (((Base_dDiagnostics_dTc.v_tcErr1 sp) (Base_dDiagnostics_dTc.C_TcErr_UnknownName (name))) name)
  | B_dData_dMaybe.C_Maybe_Just (dtb__12) -> (match dtb__12 with
  | Elab_dMeta.C_ValueEntry_VEDef (dtb__13) -> (if (v_allImplicitPrefix dtb__13) then (let inst = (((((v_instantiateAllImplicit ctx) ec) ((Elab_dMeta.v_ctorRefTerm (Elab_dTypes.v_ecDatas ec)) name)) ((Core_dEval.v_eval B_dData_dList.C_List_Nil) dtb__13)) B_dData_dList.C_List_Nil) in (Base_dDiag.C_Check_OkC (inst))) else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = ((Elab_dMeta.v_ctorRefTerm (Elab_dTypes.v_ecDatas ec)) name); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = ((Core_dEval.v_eval B_dData_dList.C_List_Nil) dtb__13); B_dData_dPair.f_Pair_second = ec } })))
  | Elab_dMeta.C_ValueEntry_VECtor (dtb__14) -> ((((Elab_dMeta.v_inferCtorRef ec) ctx) name) (Elab_dTypes.v_dtCtorType dtb__14))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))
  | B_dData_dMaybe.C_Maybe_Just (dtb__15) -> (match dtb__15 with
  | { B_dData_dPair.f_Pair_first = dtb__16; B_dData_dPair.f_Pair_second = dtb__17 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Core_dTerm.C_Term_TVar (name, dtb__16, sp)); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = (((Elab_dTypes.v_varTypeValue ctx) dtb__16) dtb__17); B_dData_dPair.f_Pair_second = ec } }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))

# 82 "Vuna/Compiler/Elab/Term/Support.vuna"
let v_whereBindingName = (fun (mc0 : Frontend_dRast.t_Pat) -> (match mc0 with
  | Frontend_dRast.C_Pat_PVar (dtb__18, dtb__19) -> dtb__18
  | _ -> "_"
))

# 72 "Vuna/Compiler/Elab/Term/Support.vuna"
let rec v_checkWhereSigs = (fun (mc0 : (Frontend_dRast.t_Pat, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__20, dtb__21) -> (match (B_dData_dPair.v_secondOf dtb__20) with
  | Frontend_dRast.C_Expr_EAnn (dtb__22, dtb__23, dtb__24) -> (v_checkWhereSigs dtb__21)
  | _ -> (let name = (v_whereBindingName (B_dData_dPair.v_firstOf dtb__20)) in ((((Base_dDiagnostics_dTc.v_tcErr2 (Frontend_dRast.v_patSpan (B_dData_dPair.v_firstOf dtb__20))) (Base_dDiagnostics_dTc.C_TcErr_WhereNeedsSig (name, name))) name) name))
)
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (0))
  | _ -> failwith "DT: impossible branch"
))

# 68 "Vuna/Compiler/Elab/Term/Support.vuna"
let v_checkBindingSigs = (fun (mc0 : bool) (mc1 : (Frontend_dRast.t_Pat, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (if mc0 then (v_checkWhereSigs mc1) else (Base_dDiag.C_Check_OkC (0))))

# 87 "Vuna/Compiler/Elab/Term/Support.vuna"
let rec v_withEffectLabels = (fun (mc0 : string B_dData_dList.t_List) (mc1 : Base_dDiag.t_Diagnostic) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__25, dtb__26) -> ((v_withEffectLabels dtb__26) ((Base_dDiag.v_withField (Base_dDiag.C_DiagField_FieldEffect (("unhandled: " ^ dtb__25)))) mc1))
  | B_dData_dList.C_List_Nil -> mc1
  | _ -> failwith "DT: impossible branch"
))
