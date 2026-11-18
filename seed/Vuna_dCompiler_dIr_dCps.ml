open Vuna_runtime
type t_Vuna_dCompiler_dIr_dCps_dHandlerTables = { f_Vuna_dCompiler_dIr_dCps_dHandlerTables_htArities : (string, int) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList; f_Vuna_dCompiler_dIr_dCps_dHandlerTables_htSigs : (string, Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrTy Base_dData_dMaybe.t_Base_dData_dMaybe_dMaybe) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList }

# 32 "Vuna/Compiler/Ir/Cps.vuna"
let v_Vuna_dCompiler_dIr_dCps_dirCpsPerformName = "@ir@cps@perform"

# 35 "Vuna/Compiler/Ir/Cps.vuna"
let v_Vuna_dCompiler_dIr_dCps_dirCpsHandleName = "@ir@cps@handle"

# 38 "Vuna/Compiler/Ir/Cps.vuna"
let v_Vuna_dCompiler_dIr_dCps_dirCpsSelfName = "@ir@cps@self"

# 42 "Vuna/Compiler/Ir/Cps.vuna"
let v_Vuna_dCompiler_dIr_dCps_dirSelPerformName = "@ir@sel@perform"

# 45 "Vuna/Compiler/Ir/Cps.vuna"
let v_Vuna_dCompiler_dIr_dCps_dirSelHandleName = "@ir@sel@handle"

# 48 "Vuna/Compiler/Ir/Cps.vuna"
let v_Vuna_dCompiler_dIr_dCps_dirSelSelfName = "@ir@sel@self"

# 51 "Vuna/Compiler/Ir/Cps.vuna"
let v_Vuna_dCompiler_dIr_dCps_dirSelRunName = "@ir@sel@run"

# 54 "Vuna/Compiler/Ir/Cps.vuna"
let v_Vuna_dCompiler_dIr_dCps_dirSelDoneName = "@ir@sel@done"

# 57 "Vuna/Compiler/Ir/Cps.vuna"
let v_Vuna_dCompiler_dIr_dCps_dirMPerformName = "@ir@m@perform"

# 60 "Vuna/Compiler/Ir/Cps.vuna"
let v_Vuna_dCompiler_dIr_dCps_dirMHandleName = "@ir@m@handle"

# 63 "Vuna/Compiler/Ir/Cps.vuna"
let v_Vuna_dCompiler_dIr_dCps_dirMSelfName = "@ir@m@self"

# 68 "Vuna/Compiler/Ir/Cps.vuna"
let v_Vuna_dCompiler_dIr_dCps_dirMApplyName = "@ir@m@apply"

# 71 "Vuna/Compiler/Ir/Cps.vuna"
let v_Vuna_dCompiler_dIr_dCps_dirMRunEffName = "@ir@m@runEff"

# 74 "Vuna/Compiler/Ir/Cps.vuna"
let v_Vuna_dCompiler_dIr_dCps_dirMRunName = "@ir@m@run"

# 77 "Vuna/Compiler/Ir/Cps.vuna"
let v_Vuna_dCompiler_dIr_dCps_dirMDoneName = "@ir@m@done"

# 81 "Vuna/Compiler/Ir/Cps.vuna"
let v_Vuna_dCompiler_dIr_dCps_dirScopedTypeName = "Base.Effect.Core.Scoped"

# 84 "Vuna/Compiler/Ir/Cps.vuna"
let v_Vuna_dCompiler_dIr_dCps_dirScopedMkCtor = "Base.Effect.Core.Scoped.MkScoped"

# 88 "Vuna/Compiler/Ir/Cps.vuna"
let v_Vuna_dCompiler_dIr_dCps_drunThunkName = "Base.Effect.Core.runThunk"

# 91 "Vuna/Compiler/Ir/Cps.vuna"
let v_Vuna_dCompiler_dIr_dCps_drunPureName = "Base.Effect.Core.runPure"

# 94 "Vuna/Compiler/Ir/Cps.vuna"
let v_Vuna_dCompiler_dIr_dCps_drunEffName = "Base.Effect.Core.runEff"

# 97 "Vuna/Compiler/Ir/Cps.vuna"
let v_Vuna_dCompiler_dIr_dCps_drunMainName = "Base.Effect.Core.runMain"

# 100 "Vuna/Compiler/Ir/Cps.vuna"
let v_Vuna_dCompiler_dIr_dCps_dhandleScopedName = "Base.Effect.Core.handleScoped"

# 104 "Vuna/Compiler/Ir/Cps.vuna"
let v_Vuna_dCompiler_dIr_dCps_dstartFuel = 200000

# 110 "Vuna/Compiler/Ir/Cps.vuna"
let v_Vuna_dCompiler_dIr_dCps_dbNameEq = (fun (mc0 : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrBName) (mc1 : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrBName) -> (match mc0 with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrBName_IrBWild -> (match mc1 with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrBName_IrBWild -> true
  | _ -> false
)
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrBName_IrBNat (dtb__0) -> (match mc1 with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrBName_IrBNat (dtb__1) -> (dtb__0 = dtb__1)
  | _ -> false
)
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrBName_IrBArm (dtb__2) -> (match mc1 with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrBName_IrBArm (dtb__3) -> (dtb__2 = dtb__3)
  | _ -> false
)
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrBName_IrBUser (dtb__4) -> (match mc1 with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrBName_IrBUser (dtb__5) -> (dtb__4 = dtb__5)
  | _ -> false
)
  | _ -> failwith "DT: impossible branch"
))

# 117 "Vuna/Compiler/Ir/Cps.vuna"
let v_Vuna_dCompiler_dIr_dCps_dbinderEq = (fun (mc0 : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrBinder) (mc1 : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrBinder) -> (match mc0 with
  | { Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrBinder_irBinderName = dtb__6; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrBinder_irBinderErased = dtb__7; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrBinder_irBinderTy = dtb__8 } -> (match mc1 with
  | { Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrBinder_irBinderName = dtb__9; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrBinder_irBinderErased = dtb__10; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrBinder_irBinderTy = dtb__11 } -> (if ((v_Vuna_dCompiler_dIr_dCps_dbNameEq dtb__6) dtb__9) then (((Base_dTrait_dEq.v_Base_dTrait_dEq_d_x61__x61_ Base_dTrait_dEq.v_Eq_uBase_uData_uBool_uBool) dtb__7) dtb__10) else false)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 120 "Vuna/Compiler/Ir/Cps.vuna"
let rec v_Vuna_dCompiler_dIr_dCps_dmemBinder = (fun (mc0 : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrBinder) (mc1 : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrBinder Base_dData_dList.t_Base_dData_dList_dList) -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__12, dtb__13) -> (if ((v_Vuna_dCompiler_dIr_dCps_dbinderEq mc0) dtb__12) then true else ((v_Vuna_dCompiler_dIr_dCps_dmemBinder mc0) dtb__13))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 124 "Vuna/Compiler/Ir/Cps.vuna"
let v_Vuna_dCompiler_dIr_dCps_dbinderErased = (fun (mc0 : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrBinder) -> (match mc0 with
  | { Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrBinder_irBinderName = dtb__14; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrBinder_irBinderErased = dtb__15; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrBinder_irBinderTy = dtb__16 } -> dtb__15
  | _ -> failwith "DT: impossible branch"
))

# 128 "Vuna/Compiler/Ir/Cps.vuna"
let v_Vuna_dCompiler_dIr_dCps_druntimeBinders = (fun bs -> ((Base_dData_dList.v_Base_dData_dList_dfilter (fun (b : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrBinder) -> (Base_dData_dBool.v_Base_dData_dBool_dnot (v_Vuna_dCompiler_dIr_dCps_dbinderErased b)))) bs))

# 131 "Vuna/Compiler/Ir/Cps.vuna"
let v_Vuna_dCompiler_dIr_dCps_dmkBinder = (fun name -> (Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dmkIrBinder name))

# 136 "Vuna/Compiler/Ir/Cps.vuna"
let v_Vuna_dCompiler_dIr_dCps_dfreshV = (fun fuel -> (v_Vuna_dCompiler_dIr_dCps_dmkBinder ("__cpsV" ^ (bi_strFromInt fuel))))

# 139 "Vuna/Compiler/Ir/Cps.vuna"
let v_Vuna_dCompiler_dIr_dCps_dfreshK = (fun fuel -> (v_Vuna_dCompiler_dIr_dCps_dmkBinder ("__cpsK" ^ (bi_strFromInt fuel))))

# 142 "Vuna/Compiler/Ir/Cps.vuna"
let v_Vuna_dCompiler_dIr_dCps_dfreshU = (fun fuel -> (v_Vuna_dCompiler_dIr_dCps_dmkBinder ("__cpsU" ^ (bi_strFromInt fuel))))

# 145 "Vuna/Compiler/Ir/Cps.vuna"
let v_Vuna_dCompiler_dIr_dCps_dfreshA = (fun fuel i -> (v_Vuna_dCompiler_dIr_dCps_dmkBinder (String.concat "" ["__cpsA"; (bi_strFromInt fuel); "_"; (bi_strFromInt i)])))

# 148 "Vuna/Compiler/Ir/Cps.vuna"
let rec v_Vuna_dCompiler_dIr_dCps_dapplyAll = (fun (mc0 : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIr) (mc1 : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIr Base_dData_dList.t_Base_dData_dList_dList) -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__17, dtb__18) -> ((v_Vuna_dCompiler_dIr_dCps_dapplyAll (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (mc0, dtb__17))) dtb__18)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> mc0
  | _ -> failwith "DT: impossible branch"
))

# 152 "Vuna/Compiler/Ir/Cps.vuna"
let rec v_Vuna_dCompiler_dIr_dCps_dflattenApp = (fun (mc0 : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIr) -> (match mc0 with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (dtb__19, dtb__20) -> ((fun p -> { Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Base_dData_dPair.v_Base_dData_dPair_dfirstOf p); Base_dData_dPair.f_Base_dData_dPair_dPair_second = ((Base_dData_dList.v_Base_dData_dList_dappend (Base_dData_dPair.v_Base_dData_dPair_dsecondOf p)) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__20, Base_dData_dList.C_Base_dData_dList_dList_Nil))) }) (v_Vuna_dCompiler_dIr_dCps_dflattenApp dtb__19))
  | _ -> { Base_dData_dPair.f_Base_dData_dPair_dPair_first = mc0; Base_dData_dPair.f_Base_dData_dPair_dPair_second = Base_dData_dList.C_Base_dData_dList_dList_Nil }
))

# 197 "Vuna/Compiler/Ir/Cps.vuna"
let v_Vuna_dCompiler_dIr_dCps_disThunkCtor = (fun family ctor -> (if (if (family = Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirEffTypeName) then (ctor = Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirEffMkCtor) else false) then true else (if (family = v_Vuna_dCompiler_dIr_dCps_dirScopedTypeName) then (ctor = v_Vuna_dCompiler_dIr_dCps_dirScopedMkCtor) else false)))

# 202 "Vuna/Compiler/Ir/Cps.vuna"
let v_Vuna_dCompiler_dIr_dCps_disThunkAlt = (fun alt -> ((fun nd_uscrut1 -> (match nd_uscrut1 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> false
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__21) -> (match dtb__21 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__22; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__23 } -> ((v_Vuna_dCompiler_dIr_dCps_disThunkCtor dtb__22) dtb__23)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) (alt).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltCtor))

# 209 "Vuna/Compiler/Ir/Cps.vuna"
let v_Vuna_dCompiler_dIr_dCps_dthunkBindersOfAlt = (fun alt -> (if (v_Vuna_dCompiler_dIr_dCps_disThunkAlt alt) then (v_Vuna_dCompiler_dIr_dCps_druntimeBinders (alt).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBinders) else Base_dData_dList.C_Base_dData_dList_dList_Nil))

# 160 "Vuna/Compiler/Ir/Cps.vuna"
let rec v_Vuna_dCompiler_dIr_dCps_dmapDirect = (fun fuel xs -> (if (fuel <= 0) then xs else (match xs with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__24, dtb__25) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (((v_Vuna_dCompiler_dIr_dCps_dtransformDirect (fuel - 1)) dtb__24), ((v_Vuna_dCompiler_dIr_dCps_dmapDirect (fuel - 1)) dtb__25)))
  | _ -> failwith "DT: impossible branch"
)))
# 169 "Vuna/Compiler/Ir/Cps.vuna"
and v_Vuna_dCompiler_dIr_dCps_dmapAltDirect = (fun fuel xs -> (if (fuel <= 0) then xs else (match xs with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__26, dtb__27) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (((v_Vuna_dCompiler_dIr_dCps_dtransformAltDirect (fuel - 1)) dtb__26), ((v_Vuna_dCompiler_dIr_dCps_dmapAltDirect (fuel - 1)) dtb__27)))
  | _ -> failwith "DT: impossible branch"
)))
# 178 "Vuna/Compiler/Ir/Cps.vuna"
and v_Vuna_dCompiler_dIr_dCps_dmapAltCps = (fun fuel env xs k -> (if (fuel <= 0) then xs else (match xs with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__28, dtb__29) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (((((v_Vuna_dCompiler_dIr_dCps_dcpsAlt (fuel - 1)) env) dtb__28) k), ((((v_Vuna_dCompiler_dIr_dCps_dmapAltCps (fuel - 1)) env) dtb__29) k)))
  | _ -> failwith "DT: impossible branch"
)))
# 187 "Vuna/Compiler/Ir/Cps.vuna"
and v_Vuna_dCompiler_dIr_dCps_dmapFieldsDirect = (fun fuel xs -> (if (fuel <= 0) then xs else (match xs with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__30, dtb__31) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Base_dData_dPair.v_Base_dData_dPair_dfirstOf dtb__30); Base_dData_dPair.f_Base_dData_dPair_dPair_second = ((v_Vuna_dCompiler_dIr_dCps_dtransformDirect (fuel - 1)) (Base_dData_dPair.v_Base_dData_dPair_dsecondOf dtb__30)) }, ((v_Vuna_dCompiler_dIr_dCps_dmapFieldsDirect (fuel - 1)) dtb__31)))
  | _ -> failwith "DT: impossible branch"
)))
# 224 "Vuna/Compiler/Ir/Cps.vuna"
and v_Vuna_dCompiler_dIr_dCps_dcpsExpr = (fun fuel env e k -> (if (fuel <= 0) then (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (k, ((v_Vuna_dCompiler_dIr_dCps_dtransformDirect (fuel - 1)) e))) else (match e with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (dtb__32, dtb__33) -> ((((v_Vuna_dCompiler_dIr_dCps_dcpsApp (fuel - 1)) env) e) k)
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCase (dtb__34, dtb__35) -> ((fun v -> ((fun kCase -> ((((v_Vuna_dCompiler_dIr_dCps_dcpsExpr (fuel - 1)) env) dtb__34) kCase)) (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLam ((Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (v, Base_dData_dList.C_Base_dData_dList_dList_Nil)), Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCase ((Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrVar (v)), ((((v_Vuna_dCompiler_dIr_dCps_dmapAltCps (fuel - 1)) env) dtb__35) k))))))) (v_Vuna_dCompiler_dIr_dCps_dfreshV fuel))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrNatCase (dtb__36, dtb__37, dtb__38, dtb__39, dtb__40) -> ((fun v -> ((fun kCase -> ((((v_Vuna_dCompiler_dIr_dCps_dcpsExpr (fuel - 1)) env) dtb__36) kCase)) (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLam ((Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (v, Base_dData_dList.C_Base_dData_dList_dList_Nil)), Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrNatCase ((Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrVar (v)), dtb__37, ((((v_Vuna_dCompiler_dIr_dCps_dcpsAltMaybe (fuel - 1)) env) dtb__38) k), ((((v_Vuna_dCompiler_dIr_dCps_dcpsAltMaybe (fuel - 1)) env) dtb__39) k), ((((v_Vuna_dCompiler_dIr_dCps_dcpsAltMaybe (fuel - 1)) env) dtb__40) k))))))) (v_Vuna_dCompiler_dIr_dCps_dfreshV fuel))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrIf (dtb__41, dtb__42, dtb__43) -> ((fun v -> ((fun kIf -> ((((v_Vuna_dCompiler_dIr_dCps_dcpsExpr (fuel - 1)) env) dtb__41) kIf)) (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLam ((Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (v, Base_dData_dList.C_Base_dData_dList_dList_Nil)), Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrIf ((Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrVar (v)), ((((v_Vuna_dCompiler_dIr_dCps_dcpsExpr (fuel - 1)) env) dtb__42) k), ((((v_Vuna_dCompiler_dIr_dCps_dcpsExpr (fuel - 1)) env) dtb__43) k))))))) (v_Vuna_dCompiler_dIr_dCps_dfreshV fuel))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLet (dtb__44, dtb__45, dtb__46) -> ((fun v -> ((fun kLet -> ((((v_Vuna_dCompiler_dIr_dCps_dcpsExpr (fuel - 1)) env) dtb__45) kLet)) (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLam ((Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (v, Base_dData_dList.C_Base_dData_dList_dList_Nil)), Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLet (dtb__44, (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrVar (v)), ((((v_Vuna_dCompiler_dIr_dCps_dcpsExpr (fuel - 1)) env) dtb__46) k))))))) (v_Vuna_dCompiler_dIr_dCps_dfreshV fuel))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCast (dtb__47, dtb__48, dtb__49) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCast (dtb__47, dtb__48, ((((v_Vuna_dCompiler_dIr_dCps_dcpsExpr (fuel - 1)) env) dtb__49) k)))
  | _ -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (k, ((v_Vuna_dCompiler_dIr_dCps_dtransformDirect (fuel - 1)) e)))
)))
# 254 "Vuna/Compiler/Ir/Cps.vuna"
and v_Vuna_dCompiler_dIr_dCps_dcpsAlt = (fun fuel env alt k -> (if (fuel <= 0) then alt else ((fun env1 -> { Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltCtor = (alt).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltCtor; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBinders = (alt).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBinders; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBody = ((((v_Vuna_dCompiler_dIr_dCps_dcpsExpr (fuel - 1)) env1) (alt).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBody) k) }) ((Base_dData_dList.v_Base_dData_dList_dappend (v_Vuna_dCompiler_dIr_dCps_dthunkBindersOfAlt alt)) env))))
# 263 "Vuna/Compiler/Ir/Cps.vuna"
and v_Vuna_dCompiler_dIr_dCps_dcpsAltMaybe = (fun fuel env m k -> (if (fuel <= 0) then m else (match m with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__50) -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (((((v_Vuna_dCompiler_dIr_dCps_dcpsAlt (fuel - 1)) env) dtb__50) k)))
  | _ -> failwith "DT: impossible branch"
)))
# 273 "Vuna/Compiler/Ir/Cps.vuna"
and v_Vuna_dCompiler_dIr_dCps_dcpsArgs = (fun fuel env args head acc k -> (if (fuel <= 0) then (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (k, ((v_Vuna_dCompiler_dIr_dCps_dapplyAll head) (Base_dData_dList.v_Base_dData_dList_dreverse acc)))) else (match args with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (k, ((v_Vuna_dCompiler_dIr_dCps_dapplyAll head) (Base_dData_dList.v_Base_dData_dList_dreverse acc))))
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__51, dtb__52) -> ((fun v -> ((((v_Vuna_dCompiler_dIr_dCps_dcpsExpr (fuel - 1)) env) dtb__51) (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLam ((Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (v, Base_dData_dList.C_Base_dData_dList_dList_Nil)), Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, ((((((v_Vuna_dCompiler_dIr_dCps_dcpsArgs (fuel - 1)) env) dtb__52) head) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ((Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrVar (v)), acc))) k))))) (v_Vuna_dCompiler_dIr_dCps_dfreshV fuel))
  | _ -> failwith "DT: impossible branch"
)))
# 286 "Vuna/Compiler/Ir/Cps.vuna"
and v_Vuna_dCompiler_dIr_dCps_dcpsThunkCall = (fun fuel head args k -> (if (fuel <= 0) then ((v_Vuna_dCompiler_dIr_dCps_dapplyAll head) ((Base_dData_dList.v_Base_dData_dList_dappend args) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (k, Base_dData_dList.C_Base_dData_dList_dList_Nil)))) else ((v_Vuna_dCompiler_dIr_dCps_dapplyAll ((v_Vuna_dCompiler_dIr_dCps_dtransformDirect (fuel - 1)) head)) ((Base_dData_dList.v_Base_dData_dList_dappend ((v_Vuna_dCompiler_dIr_dCps_dmapDirect (fuel - 1)) args)) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (k, Base_dData_dList.C_Base_dData_dList_dList_Nil))))))
# 294 "Vuna/Compiler/Ir/Cps.vuna"
and v_Vuna_dCompiler_dIr_dCps_dcpsApp = (fun fuel env e k -> (if (fuel <= 0) then (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (k, e)) else ((fun p -> ((fun head -> ((fun args -> ((fun v -> (match head with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrVar (dtb__53) -> (if ((v_Vuna_dCompiler_dIr_dCps_dmemBinder dtb__53) env) then ((((v_Vuna_dCompiler_dIr_dCps_dcpsThunkCall (fuel - 1)) head) args) k) else ((((v_Vuna_dCompiler_dIr_dCps_dcpsExpr (fuel - 1)) env) head) (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLam ((Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (v, Base_dData_dList.C_Base_dData_dList_dList_Nil)), Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, ((((((v_Vuna_dCompiler_dIr_dCps_dcpsArgs (fuel - 1)) env) args) (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrVar (v))) Base_dData_dList.C_Base_dData_dList_dList_Nil) k)))))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrGlobal (dtb__54) -> (if (dtb__54 = v_Vuna_dCompiler_dIr_dCps_drunThunkName) then ((((v_Vuna_dCompiler_dIr_dCps_dcpsThunkCall (fuel - 1)) head) args) k) else ((((v_Vuna_dCompiler_dIr_dCps_dcpsExpr (fuel - 1)) env) head) (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLam ((Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (v, Base_dData_dList.C_Base_dData_dList_dList_Nil)), Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, ((((((v_Vuna_dCompiler_dIr_dCps_dcpsArgs (fuel - 1)) env) args) (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrVar (v))) Base_dData_dList.C_Base_dData_dList_dList_Nil) k)))))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRt (dtb__55) -> (if (dtb__55 = "prim_effectPerform") then ((((v_Vuna_dCompiler_dIr_dCps_dcpsThunkCall (fuel - 1)) (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRt (v_Vuna_dCompiler_dIr_dCps_dirCpsPerformName))) args) k) else (if (dtb__55 = "prim_effectHandle") then ((((v_Vuna_dCompiler_dIr_dCps_dcpsThunkCall (fuel - 1)) (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRt (v_Vuna_dCompiler_dIr_dCps_dirCpsHandleName))) args) k) else (if (dtb__55 = "prim_effectSelf") then ((((v_Vuna_dCompiler_dIr_dCps_dcpsThunkCall (fuel - 1)) (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRt (v_Vuna_dCompiler_dIr_dCps_dirCpsSelfName))) args) k) else ((((v_Vuna_dCompiler_dIr_dCps_dcpsExpr (fuel - 1)) env) head) (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLam ((Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (v, Base_dData_dList.C_Base_dData_dList_dList_Nil)), Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, ((((((v_Vuna_dCompiler_dIr_dCps_dcpsArgs (fuel - 1)) env) args) (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrVar (v))) Base_dData_dList.C_Base_dData_dList_dList_Nil) k)))))))
  | _ -> ((((v_Vuna_dCompiler_dIr_dCps_dcpsExpr (fuel - 1)) env) head) (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLam ((Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (v, Base_dData_dList.C_Base_dData_dList_dList_Nil)), Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, ((((((v_Vuna_dCompiler_dIr_dCps_dcpsArgs (fuel - 1)) env) args) (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrVar (v))) Base_dData_dList.C_Base_dData_dList_dList_Nil) k))))
)) (v_Vuna_dCompiler_dIr_dCps_dfreshV fuel))) (Base_dData_dPair.v_Base_dData_dPair_dsecondOf p))) (Base_dData_dPair.v_Base_dData_dPair_dfirstOf p))) (v_Vuna_dCompiler_dIr_dCps_dflattenApp e))))
# 318 "Vuna/Compiler/Ir/Cps.vuna"
and v_Vuna_dCompiler_dIr_dCps_dtransformDirect = (fun fuel e -> (if (fuel <= 0) then e else (match e with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCtor (dtb__56, dtb__57, dtb__58) -> (if ((v_Vuna_dCompiler_dIr_dCps_disThunkCtor dtb__56) dtb__57) then ((fun nd_uscrut5 -> (match nd_uscrut5 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__59, dtb__60) -> (match dtb__59 with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLam (dtb__61, dtb__62, dtb__63) -> (match dtb__60 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> ((fun k -> ((fun body1 -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCtor (dtb__56, dtb__57, (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ((Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLam (((Base_dData_dList.v_Base_dData_dList_dappend dtb__61) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (k, Base_dData_dList.C_Base_dData_dList_dList_Nil))), Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, body1)), Base_dData_dList.C_Base_dData_dList_dList_Nil))))) ((((v_Vuna_dCompiler_dIr_dCps_dcpsExpr (fuel - 1)) Base_dData_dList.C_Base_dData_dList_dList_Nil) dtb__63) (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrVar (k))))) (v_Vuna_dCompiler_dIr_dCps_dfreshK fuel))
  | _ -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCtor (dtb__56, dtb__57, ((v_Vuna_dCompiler_dIr_dCps_dmapDirect (fuel - 1)) dtb__58)))
)
  | _ -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCtor (dtb__56, dtb__57, ((v_Vuna_dCompiler_dIr_dCps_dmapDirect (fuel - 1)) dtb__58)))
)
  | _ -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCtor (dtb__56, dtb__57, ((v_Vuna_dCompiler_dIr_dCps_dmapDirect (fuel - 1)) dtb__58)))
)) dtb__58) else (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCtor (dtb__56, dtb__57, ((v_Vuna_dCompiler_dIr_dCps_dmapDirect (fuel - 1)) dtb__58))))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrEffThunk (dtb__64, dtb__65, dtb__66, dtb__67, dtb__68) -> ((fun u -> ((fun k -> ((fun argBs -> ((fun applied -> ((fun inner -> (if (dtb__67 <= 0) then inner else (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLam (argBs, Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, inner)))) (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCtor (dtb__64, dtb__65, (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ((Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLam ((Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (u, (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (k, Base_dData_dList.C_Base_dData_dList_dList_Nil)))), Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp ((Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrVar (k)), applied)))), Base_dData_dList.C_Base_dData_dList_dList_Nil)))))) ((v_Vuna_dCompiler_dIr_dCps_dapplyAll ((v_Vuna_dCompiler_dIr_dCps_dtransformDirect (fuel - 1)) dtb__68)) ((Base_dData_dList.v_Base_dData_dList_dmap (fun _heta0 -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrVar (_heta0)))) argBs)))) ((Base_dData_dList.v_Base_dData_dList_dmap (fun (i : int) -> ((v_Vuna_dCompiler_dIr_dCps_dfreshA fuel) i))) ((Base_dData_dList.v_Base_dData_dList_drange 0) dtb__67)))) (v_Vuna_dCompiler_dIr_dCps_dfreshK fuel))) (v_Vuna_dCompiler_dIr_dCps_dfreshU fuel))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRecord (dtb__69, dtb__70) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRecord (dtb__69, ((v_Vuna_dCompiler_dIr_dCps_dmapFieldsDirect (fuel - 1)) dtb__70)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrProj (dtb__71, dtb__72, dtb__73) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrProj (((v_Vuna_dCompiler_dIr_dCps_dtransformDirect (fuel - 1)) dtb__71), dtb__72, dtb__73))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRecUpd (dtb__74, dtb__75, dtb__76) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRecUpd (((v_Vuna_dCompiler_dIr_dCps_dtransformDirect (fuel - 1)) dtb__74), dtb__75, ((v_Vuna_dCompiler_dIr_dCps_dmapFieldsDirect (fuel - 1)) dtb__76)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRtApp (dtb__77, dtb__78) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRtApp (dtb__77, ((v_Vuna_dCompiler_dIr_dCps_dmapDirect (fuel - 1)) dtb__78)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCast (dtb__79, dtb__80, dtb__81) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCast (dtb__79, dtb__80, ((v_Vuna_dCompiler_dIr_dCps_dtransformDirect (fuel - 1)) dtb__81)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLet (dtb__82, dtb__83, dtb__84) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLet (dtb__82, ((v_Vuna_dCompiler_dIr_dCps_dtransformDirect (fuel - 1)) dtb__83), ((v_Vuna_dCompiler_dIr_dCps_dtransformDirect (fuel - 1)) dtb__84)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLam (dtb__85, dtb__86, dtb__87) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLam (dtb__85, dtb__86, ((v_Vuna_dCompiler_dIr_dCps_dtransformDirect (fuel - 1)) dtb__87)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (dtb__88, dtb__89) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (((v_Vuna_dCompiler_dIr_dCps_dtransformDirect (fuel - 1)) dtb__88), ((v_Vuna_dCompiler_dIr_dCps_dtransformDirect (fuel - 1)) dtb__89)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrIf (dtb__90, dtb__91, dtb__92) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrIf (((v_Vuna_dCompiler_dIr_dCps_dtransformDirect (fuel - 1)) dtb__90), ((v_Vuna_dCompiler_dIr_dCps_dtransformDirect (fuel - 1)) dtb__91), ((v_Vuna_dCompiler_dIr_dCps_dtransformDirect (fuel - 1)) dtb__92)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCase (dtb__93, dtb__94) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCase (((v_Vuna_dCompiler_dIr_dCps_dtransformDirect (fuel - 1)) dtb__93), ((v_Vuna_dCompiler_dIr_dCps_dmapAltDirect (fuel - 1)) dtb__94)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrNatCase (dtb__95, dtb__96, dtb__97, dtb__98, dtb__99) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrNatCase (((v_Vuna_dCompiler_dIr_dCps_dtransformDirect (fuel - 1)) dtb__95), dtb__96, ((v_Vuna_dCompiler_dIr_dCps_dtransformAltMaybe (fuel - 1)) dtb__97), ((v_Vuna_dCompiler_dIr_dCps_dtransformAltMaybe (fuel - 1)) dtb__98), ((v_Vuna_dCompiler_dIr_dCps_dtransformAltMaybe (fuel - 1)) dtb__99)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrConcatMany (dtb__100) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrConcatMany (((v_Vuna_dCompiler_dIr_dCps_dmapDirect (fuel - 1)) dtb__100)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrVar (dtb__101) -> e
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrGlobal (dtb__102) -> e
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRt (dtb__103) -> e
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrInt (dtb__104) -> e
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrStr (dtb__105) -> e
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrBool (dtb__106) -> e
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrFloatLit (dtb__107) -> e
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrEffBind (dtb__108, dtb__109, dtb__110) -> e
  | _ -> failwith "DT: impossible branch"
)))
# 364 "Vuna/Compiler/Ir/Cps.vuna"
and v_Vuna_dCompiler_dIr_dCps_dtransformAltDirect = (fun fuel alt -> (if (fuel <= 0) then alt else { Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltCtor = (alt).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltCtor; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBinders = (alt).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBinders; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBody = ((v_Vuna_dCompiler_dIr_dCps_dtransformDirect (fuel - 1)) (alt).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBody) }))
# 371 "Vuna/Compiler/Ir/Cps.vuna"
and v_Vuna_dCompiler_dIr_dCps_dtransformAltMaybe = (fun fuel m -> (if (fuel <= 0) then m else (match m with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__111) -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (((v_Vuna_dCompiler_dIr_dCps_dtransformAltDirect (fuel - 1)) dtb__111)))
  | _ -> failwith "DT: impossible branch"
)))

# 213 "Vuna/Compiler/Ir/Cps.vuna"
let v_Vuna_dCompiler_dIr_dCps_didentityCont = ((fun v -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLam ((Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (v, Base_dData_dList.C_Base_dData_dList_dList_Nil)), Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrVar (v))))) (v_Vuna_dCompiler_dIr_dCps_dmkBinder "__cpsId"))

# 385 "Vuna/Compiler/Ir/Cps.vuna"
let rec v_Vuna_dCompiler_dIr_dCps_dtrampolineBody = (fun (mc0 : string) (mc1 : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIr) -> (match mc1 with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (dtb__112, dtb__113) -> (match dtb__112 with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (dtb__114, dtb__115) -> (match dtb__114 with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrGlobal (dtb__116) -> (if (dtb__116 = v_Vuna_dCompiler_dIr_dCps_drunThunkName) then (Base_dData_dResult.C_Base_dData_dResult_dResult_Ok (((v_Vuna_dCompiler_dIr_dCps_dapplyAll (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrGlobal (dtb__116))) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__115, (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__113, (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (v_Vuna_dCompiler_dIr_dCps_didentityCont, Base_dData_dList.C_Base_dData_dList_dList_Nil))))))))) else (Base_dData_dResult.C_Base_dData_dResult_dResult_Err (("CPS: unexpected trampoline shape: " ^ mc0))))
  | _ -> (Base_dData_dResult.C_Base_dData_dResult_dResult_Err (("CPS: unexpected trampoline shape: " ^ mc0)))
)
  | _ -> (Base_dData_dResult.C_Base_dData_dResult_dResult_Err (("CPS: unexpected trampoline shape: " ^ mc0)))
)
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCast (dtb__117, dtb__118, dtb__119) -> (match ((v_Vuna_dCompiler_dIr_dCps_dtrampolineBody mc0) dtb__119) with
  | Base_dData_dResult.C_Base_dData_dResult_dResult_Err (dtb__120) -> (Base_dData_dResult.C_Base_dData_dResult_dResult_Err (dtb__120))
  | Base_dData_dResult.C_Base_dData_dResult_dResult_Ok (dtb__121) -> (Base_dData_dResult.C_Base_dData_dResult_dResult_Ok ((Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCast (dtb__117, dtb__118, dtb__121))))
  | _ -> failwith "DT: impossible branch"
)
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLam (dtb__122, dtb__123, dtb__124) -> (match ((v_Vuna_dCompiler_dIr_dCps_dtrampolineBody mc0) dtb__124) with
  | Base_dData_dResult.C_Base_dData_dResult_dResult_Err (dtb__125) -> (Base_dData_dResult.C_Base_dData_dResult_dResult_Err (dtb__125))
  | Base_dData_dResult.C_Base_dData_dResult_dResult_Ok (dtb__126) -> (Base_dData_dResult.C_Base_dData_dResult_dResult_Ok ((Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLam (dtb__122, dtb__123, dtb__126))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> (Base_dData_dResult.C_Base_dData_dResult_dResult_Err (("CPS: unexpected trampoline shape: " ^ mc0)))
))

# 402 "Vuna/Compiler/Ir/Cps.vuna"
let rec v_Vuna_dCompiler_dIr_dCps_dselfAlt = (fun fuel alt name -> (if (fuel <= 0) then (Base_dData_dResult.C_Base_dData_dResult_dResult_Ok (alt)) else (match (((v_Vuna_dCompiler_dIr_dCps_dselfBody (fuel - 1)) (alt).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBody) name) with
  | Base_dData_dResult.C_Base_dData_dResult_dResult_Err (dtb__127) -> (Base_dData_dResult.C_Base_dData_dResult_dResult_Err (dtb__127))
  | Base_dData_dResult.C_Base_dData_dResult_dResult_Ok (dtb__128) -> (Base_dData_dResult.C_Base_dData_dResult_dResult_Ok ({ Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltCtor = (alt).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltCtor; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBinders = (alt).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBinders; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBody = dtb__128 }))
  | _ -> failwith "DT: impossible branch"
)))
# 411 "Vuna/Compiler/Ir/Cps.vuna"
and v_Vuna_dCompiler_dIr_dCps_dselfAlts = (fun fuel alts name -> (if (fuel <= 0) then (Base_dData_dResult.C_Base_dData_dResult_dResult_Ok (alts)) else (match alts with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Base_dData_dResult.C_Base_dData_dResult_dResult_Ok (Base_dData_dList.C_Base_dData_dList_dList_Nil))
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__129, dtb__130) -> (match (((v_Vuna_dCompiler_dIr_dCps_dselfAlt (fuel - 1)) dtb__129) name) with
  | Base_dData_dResult.C_Base_dData_dResult_dResult_Err (dtb__131) -> (Base_dData_dResult.C_Base_dData_dResult_dResult_Err (dtb__131))
  | Base_dData_dResult.C_Base_dData_dResult_dResult_Ok (dtb__132) -> (match (((v_Vuna_dCompiler_dIr_dCps_dselfAlts (fuel - 1)) dtb__130) name) with
  | Base_dData_dResult.C_Base_dData_dResult_dResult_Err (dtb__133) -> (Base_dData_dResult.C_Base_dData_dResult_dResult_Err (dtb__133))
  | Base_dData_dResult.C_Base_dData_dResult_dResult_Ok (dtb__134) -> (Base_dData_dResult.C_Base_dData_dResult_dResult_Ok ((Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__132, dtb__134))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))
# 426 "Vuna/Compiler/Ir/Cps.vuna"
and v_Vuna_dCompiler_dIr_dCps_dselfBody = (fun fuel body name -> (if (fuel <= 0) then (Base_dData_dResult.C_Base_dData_dResult_dResult_Ok (body)) else ((fun nd_uscrut3 -> (match nd_uscrut3 with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (dtb__135, dtb__136) -> (match dtb__135 with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRt (dtb__137) -> (if (dtb__137 = "prim_effectSelf") then (Base_dData_dResult.C_Base_dData_dResult_dResult_Ok (((v_Vuna_dCompiler_dIr_dCps_dapplyAll (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRt (v_Vuna_dCompiler_dIr_dCps_dirCpsSelfName))) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__136, (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (v_Vuna_dCompiler_dIr_dCps_didentityCont, Base_dData_dList.C_Base_dData_dList_dList_Nil))))))) else (Base_dData_dResult.C_Base_dData_dResult_dResult_Err (("CPS: unexpected handleScoped shape: " ^ name))))
  | _ -> (Base_dData_dResult.C_Base_dData_dResult_dResult_Err (("CPS: unexpected handleScoped shape: " ^ name)))
)
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCase (dtb__138, dtb__139) -> (match (((v_Vuna_dCompiler_dIr_dCps_dselfAlts (fuel - 1)) dtb__139) name) with
  | Base_dData_dResult.C_Base_dData_dResult_dResult_Err (dtb__140) -> (Base_dData_dResult.C_Base_dData_dResult_dResult_Err (dtb__140))
  | Base_dData_dResult.C_Base_dData_dResult_dResult_Ok (dtb__141) -> (Base_dData_dResult.C_Base_dData_dResult_dResult_Ok ((Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCase (dtb__138, dtb__141))))
  | _ -> failwith "DT: impossible branch"
)
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCast (dtb__142, dtb__143, dtb__144) -> (match (((v_Vuna_dCompiler_dIr_dCps_dselfBody (fuel - 1)) dtb__144) name) with
  | Base_dData_dResult.C_Base_dData_dResult_dResult_Err (dtb__145) -> (Base_dData_dResult.C_Base_dData_dResult_dResult_Err (dtb__145))
  | Base_dData_dResult.C_Base_dData_dResult_dResult_Ok (dtb__146) -> (Base_dData_dResult.C_Base_dData_dResult_dResult_Ok ((Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCast (dtb__142, dtb__143, dtb__146))))
  | _ -> failwith "DT: impossible branch"
)
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLam (dtb__147, dtb__148, dtb__149) -> (match (((v_Vuna_dCompiler_dIr_dCps_dselfBody (fuel - 1)) dtb__149) name) with
  | Base_dData_dResult.C_Base_dData_dResult_dResult_Err (dtb__150) -> (Base_dData_dResult.C_Base_dData_dResult_dResult_Err (dtb__150))
  | Base_dData_dResult.C_Base_dData_dResult_dResult_Ok (dtb__151) -> (Base_dData_dResult.C_Base_dData_dResult_dResult_Ok ((Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLam (dtb__147, dtb__148, dtb__151))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> (Base_dData_dResult.C_Base_dData_dResult_dResult_Err (("CPS: unexpected handleScoped shape: " ^ name)))
)) body)))

# 447 "Vuna/Compiler/Ir/Cps.vuna"
let v_Vuna_dCompiler_dIr_dCps_dtransformDef = (fun fuel d -> (if (fuel <= 0) then (Base_dData_dResult.C_Base_dData_dResult_dResult_Ok (d)) else (match d with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrDef_IrExternDef (dtb__152, dtb__153, dtb__154, dtb__155) -> (Base_dData_dResult.C_Base_dData_dResult_dResult_Ok (d))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrDef_IrDef (dtb__156, dtb__157, dtb__158, dtb__159, dtb__160, dtb__161, dtb__162, dtb__163) -> (if (if (if (dtb__156 = v_Vuna_dCompiler_dIr_dCps_drunPureName) then true else (dtb__156 = v_Vuna_dCompiler_dIr_dCps_drunEffName)) then true else (dtb__156 = v_Vuna_dCompiler_dIr_dCps_drunMainName)) then (match ((v_Vuna_dCompiler_dIr_dCps_dtrampolineBody dtb__156) dtb__160) with
  | Base_dData_dResult.C_Base_dData_dResult_dResult_Err (dtb__164) -> (Base_dData_dResult.C_Base_dData_dResult_dResult_Err (dtb__164))
  | Base_dData_dResult.C_Base_dData_dResult_dResult_Ok (dtb__165) -> (Base_dData_dResult.C_Base_dData_dResult_dResult_Ok ((Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrDef_IrDef (dtb__156, dtb__157, dtb__158, Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, dtb__165, dtb__161, dtb__162, dtb__163))))
  | _ -> failwith "DT: impossible branch"
) else (if (dtb__156 = v_Vuna_dCompiler_dIr_dCps_dhandleScopedName) then (match (((v_Vuna_dCompiler_dIr_dCps_dselfBody (fuel - 1)) dtb__160) dtb__156) with
  | Base_dData_dResult.C_Base_dData_dResult_dResult_Err (dtb__166) -> (Base_dData_dResult.C_Base_dData_dResult_dResult_Err (dtb__166))
  | Base_dData_dResult.C_Base_dData_dResult_dResult_Ok (dtb__167) -> (Base_dData_dResult.C_Base_dData_dResult_dResult_Ok ((Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrDef_IrDef (dtb__156, dtb__157, dtb__158, Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, dtb__167, dtb__161, dtb__162, dtb__163))))
  | _ -> failwith "DT: impossible branch"
) else (Base_dData_dResult.C_Base_dData_dResult_dResult_Ok ((Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrDef_IrDef (dtb__156, dtb__157, dtb__158, Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, ((v_Vuna_dCompiler_dIr_dCps_dtransformDirect (fuel - 1)) dtb__160), dtb__161, dtb__162, dtb__163))))))
  | _ -> failwith "DT: impossible branch"
)))

# 466 "Vuna/Compiler/Ir/Cps.vuna"
let rec v_Vuna_dCompiler_dIr_dCps_dtransformDefs = (fun fuel xs -> (if (fuel <= 0) then (Base_dData_dResult.C_Base_dData_dResult_dResult_Ok (xs)) else (match xs with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Base_dData_dResult.C_Base_dData_dResult_dResult_Ok (Base_dData_dList.C_Base_dData_dList_dList_Nil))
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__168, dtb__169) -> (match ((v_Vuna_dCompiler_dIr_dCps_dtransformDef (fuel - 1)) dtb__168) with
  | Base_dData_dResult.C_Base_dData_dResult_dResult_Err (dtb__170) -> (Base_dData_dResult.C_Base_dData_dResult_dResult_Err (dtb__170))
  | Base_dData_dResult.C_Base_dData_dResult_dResult_Ok (dtb__171) -> (match ((v_Vuna_dCompiler_dIr_dCps_dtransformDefs (fuel - 1)) dtb__169) with
  | Base_dData_dResult.C_Base_dData_dResult_dResult_Err (dtb__172) -> (Base_dData_dResult.C_Base_dData_dResult_dResult_Err (dtb__172))
  | Base_dData_dResult.C_Base_dData_dResult_dResult_Ok (dtb__173) -> (Base_dData_dResult.C_Base_dData_dResult_dResult_Ok ((Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__171, dtb__173))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))

# 481 "Vuna/Compiler/Ir/Cps.vuna"
let v_Vuna_dCompiler_dIr_dCps_dtransformGroup = (fun fuel g -> (if (fuel <= 0) then (Base_dData_dResult.C_Base_dData_dResult_dResult_Ok (g)) else (match ((v_Vuna_dCompiler_dIr_dCps_dtransformDefs (fuel - 1)) (g).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrGroup_irGroupDefs) with
  | Base_dData_dResult.C_Base_dData_dResult_dResult_Err (dtb__174) -> (Base_dData_dResult.C_Base_dData_dResult_dResult_Err (dtb__174))
  | Base_dData_dResult.C_Base_dData_dResult_dResult_Ok (dtb__175) -> (Base_dData_dResult.C_Base_dData_dResult_dResult_Ok ({ Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrGroup_irGroupIsRec = (g).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrGroup_irGroupIsRec; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrGroup_irGroupDefs = dtb__175 }))
  | _ -> failwith "DT: impossible branch"
)))

# 490 "Vuna/Compiler/Ir/Cps.vuna"
let rec v_Vuna_dCompiler_dIr_dCps_dtransformGroups = (fun fuel xs -> (if (fuel <= 0) then (Base_dData_dResult.C_Base_dData_dResult_dResult_Ok (xs)) else (match xs with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Base_dData_dResult.C_Base_dData_dResult_dResult_Ok (Base_dData_dList.C_Base_dData_dList_dList_Nil))
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__176, dtb__177) -> (match ((v_Vuna_dCompiler_dIr_dCps_dtransformGroup (fuel - 1)) dtb__176) with
  | Base_dData_dResult.C_Base_dData_dResult_dResult_Err (dtb__178) -> (Base_dData_dResult.C_Base_dData_dResult_dResult_Err (dtb__178))
  | Base_dData_dResult.C_Base_dData_dResult_dResult_Ok (dtb__179) -> (match ((v_Vuna_dCompiler_dIr_dCps_dtransformGroups (fuel - 1)) dtb__177) with
  | Base_dData_dResult.C_Base_dData_dResult_dResult_Err (dtb__180) -> (Base_dData_dResult.C_Base_dData_dResult_dResult_Err (dtb__180))
  | Base_dData_dResult.C_Base_dData_dResult_dResult_Ok (dtb__181) -> (Base_dData_dResult.C_Base_dData_dResult_dResult_Ok ((Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__179, dtb__181))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))

# 512 "Vuna/Compiler/Ir/Cps.vuna"
let v_Vuna_dCompiler_dIr_dCps_dselSym = (fun s -> (if (s = v_Vuna_dCompiler_dIr_dCps_dirCpsPerformName) then v_Vuna_dCompiler_dIr_dCps_dirSelPerformName else (if (s = v_Vuna_dCompiler_dIr_dCps_dirCpsHandleName) then v_Vuna_dCompiler_dIr_dCps_dirSelHandleName else (if (s = v_Vuna_dCompiler_dIr_dCps_dirCpsSelfName) then v_Vuna_dCompiler_dIr_dCps_dirSelSelfName else s))))

# 520 "Vuna/Compiler/Ir/Cps.vuna"
let rec v_Vuna_dCompiler_dIr_dCps_dselSyms = (fun fuel e -> (if (fuel <= 0) then e else (match e with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRt (dtb__182) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRt ((v_Vuna_dCompiler_dIr_dCps_dselSym dtb__182)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRtApp (dtb__183, dtb__184) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRtApp ((v_Vuna_dCompiler_dIr_dCps_dselSym dtb__183), ((v_Vuna_dCompiler_dIr_dCps_dselSList (fuel - 1)) dtb__184)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCtor (dtb__185, dtb__186, dtb__187) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCtor (dtb__185, dtb__186, ((v_Vuna_dCompiler_dIr_dCps_dselSList (fuel - 1)) dtb__187)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRecord (dtb__188, dtb__189) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRecord (dtb__188, ((v_Vuna_dCompiler_dIr_dCps_dselSFields (fuel - 1)) dtb__189)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrProj (dtb__190, dtb__191, dtb__192) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrProj (((v_Vuna_dCompiler_dIr_dCps_dselSyms (fuel - 1)) dtb__190), dtb__191, dtb__192))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRecUpd (dtb__193, dtb__194, dtb__195) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRecUpd (((v_Vuna_dCompiler_dIr_dCps_dselSyms (fuel - 1)) dtb__193), dtb__194, ((v_Vuna_dCompiler_dIr_dCps_dselSFields (fuel - 1)) dtb__195)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCast (dtb__196, dtb__197, dtb__198) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCast (dtb__196, dtb__197, ((v_Vuna_dCompiler_dIr_dCps_dselSyms (fuel - 1)) dtb__198)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLet (dtb__199, dtb__200, dtb__201) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLet (dtb__199, ((v_Vuna_dCompiler_dIr_dCps_dselSyms (fuel - 1)) dtb__200), ((v_Vuna_dCompiler_dIr_dCps_dselSyms (fuel - 1)) dtb__201)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLam (dtb__202, dtb__203, dtb__204) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLam (dtb__202, dtb__203, ((v_Vuna_dCompiler_dIr_dCps_dselSyms (fuel - 1)) dtb__204)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (dtb__205, dtb__206) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (((v_Vuna_dCompiler_dIr_dCps_dselSyms (fuel - 1)) dtb__205), ((v_Vuna_dCompiler_dIr_dCps_dselSyms (fuel - 1)) dtb__206)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrIf (dtb__207, dtb__208, dtb__209) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrIf (((v_Vuna_dCompiler_dIr_dCps_dselSyms (fuel - 1)) dtb__207), ((v_Vuna_dCompiler_dIr_dCps_dselSyms (fuel - 1)) dtb__208), ((v_Vuna_dCompiler_dIr_dCps_dselSyms (fuel - 1)) dtb__209)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCase (dtb__210, dtb__211) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCase (((v_Vuna_dCompiler_dIr_dCps_dselSyms (fuel - 1)) dtb__210), ((v_Vuna_dCompiler_dIr_dCps_dselSymsAlt (fuel - 1)) dtb__211)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrNatCase (dtb__212, dtb__213, dtb__214, dtb__215, dtb__216) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrNatCase (((v_Vuna_dCompiler_dIr_dCps_dselSyms (fuel - 1)) dtb__212), dtb__213, ((v_Vuna_dCompiler_dIr_dCps_dselSymsAltM (fuel - 1)) dtb__214), ((v_Vuna_dCompiler_dIr_dCps_dselSymsAltM (fuel - 1)) dtb__215), ((v_Vuna_dCompiler_dIr_dCps_dselSymsAltM (fuel - 1)) dtb__216)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrConcatMany (dtb__217) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrConcatMany (((v_Vuna_dCompiler_dIr_dCps_dselSList (fuel - 1)) dtb__217)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrEffThunk (dtb__218, dtb__219, dtb__220, dtb__221, dtb__222) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrEffThunk (dtb__218, dtb__219, dtb__220, dtb__221, ((v_Vuna_dCompiler_dIr_dCps_dselSyms (fuel - 1)) dtb__222)))
  | _ -> e
)))
# 543 "Vuna/Compiler/Ir/Cps.vuna"
and v_Vuna_dCompiler_dIr_dCps_dselSList = (fun fuel xs -> (if (fuel <= 0) then xs else (match xs with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__223, dtb__224) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (((v_Vuna_dCompiler_dIr_dCps_dselSyms (fuel - 1)) dtb__223), ((v_Vuna_dCompiler_dIr_dCps_dselSList (fuel - 1)) dtb__224)))
  | _ -> failwith "DT: impossible branch"
)))
# 552 "Vuna/Compiler/Ir/Cps.vuna"
and v_Vuna_dCompiler_dIr_dCps_dselSFields = (fun fuel fs -> (if (fuel <= 0) then fs else (match fs with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__225, dtb__226) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Base_dData_dPair.v_Base_dData_dPair_dfirstOf dtb__225); Base_dData_dPair.f_Base_dData_dPair_dPair_second = ((v_Vuna_dCompiler_dIr_dCps_dselSyms (fuel - 1)) (Base_dData_dPair.v_Base_dData_dPair_dsecondOf dtb__225)) }, ((v_Vuna_dCompiler_dIr_dCps_dselSFields (fuel - 1)) dtb__226)))
  | _ -> failwith "DT: impossible branch"
)))
# 561 "Vuna/Compiler/Ir/Cps.vuna"
and v_Vuna_dCompiler_dIr_dCps_dselSymsAlt = (fun fuel alts -> (if (fuel <= 0) then alts else (match alts with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__227, dtb__228) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltCtor = (dtb__227).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltCtor; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBinders = (dtb__227).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBinders; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBody = ((v_Vuna_dCompiler_dIr_dCps_dselSyms (fuel - 1)) (dtb__227).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBody) }, ((v_Vuna_dCompiler_dIr_dCps_dselSymsAlt (fuel - 1)) dtb__228)))
  | _ -> failwith "DT: impossible branch"
)))
# 570 "Vuna/Compiler/Ir/Cps.vuna"
and v_Vuna_dCompiler_dIr_dCps_dselSymsAltM = (fun fuel m -> (if (fuel <= 0) then m else (match m with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__229) -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ({ Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltCtor = (dtb__229).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltCtor; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBinders = (dtb__229).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBinders; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBody = ((v_Vuna_dCompiler_dIr_dCps_dselSyms (fuel - 1)) (dtb__229).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBody) }))
  | _ -> failwith "DT: impossible branch"
)))

# 580 "Vuna/Compiler/Ir/Cps.vuna"
let v_Vuna_dCompiler_dIr_dCps_dstepDoneCont = ((fun v -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLam ((Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (v, Base_dData_dList.C_Base_dData_dList_dList_Nil)), Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp ((Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRt (v_Vuna_dCompiler_dIr_dCps_dirSelDoneName)), (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrVar (v))))))) (v_Vuna_dCompiler_dIr_dCps_dmkBinder "__selId"))

# 586 "Vuna/Compiler/Ir/Cps.vuna"
let rec v_Vuna_dCompiler_dIr_dCps_dselTrampolineBody = (fun (mc0 : string) (mc1 : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIr) -> (match mc1 with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (dtb__230, dtb__231) -> (match dtb__230 with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (dtb__232, dtb__233) -> (match dtb__232 with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (dtb__234, dtb__235) -> (match dtb__234 with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrGlobal (dtb__236) -> (if (dtb__236 = v_Vuna_dCompiler_dIr_dCps_drunThunkName) then (Base_dData_dResult.C_Base_dData_dResult_dResult_Ok ((Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp ((Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRt (v_Vuna_dCompiler_dIr_dCps_dirSelRunName)), ((v_Vuna_dCompiler_dIr_dCps_dapplyAll (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrGlobal (dtb__236))) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__235, (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__233, (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (v_Vuna_dCompiler_dIr_dCps_dstepDoneCont, Base_dData_dList.C_Base_dData_dList_dList_Nil))))))))))) else (Base_dData_dResult.C_Base_dData_dResult_dResult_Err (("selective CPS: unexpected trampoline shape: " ^ mc0))))
  | _ -> (Base_dData_dResult.C_Base_dData_dResult_dResult_Err (("selective CPS: unexpected trampoline shape: " ^ mc0)))
)
  | _ -> (Base_dData_dResult.C_Base_dData_dResult_dResult_Err (("selective CPS: unexpected trampoline shape: " ^ mc0)))
)
  | _ -> (Base_dData_dResult.C_Base_dData_dResult_dResult_Err (("selective CPS: unexpected trampoline shape: " ^ mc0)))
)
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCast (dtb__237, dtb__238, dtb__239) -> (match ((v_Vuna_dCompiler_dIr_dCps_dselTrampolineBody mc0) dtb__239) with
  | Base_dData_dResult.C_Base_dData_dResult_dResult_Err (dtb__240) -> (Base_dData_dResult.C_Base_dData_dResult_dResult_Err (dtb__240))
  | Base_dData_dResult.C_Base_dData_dResult_dResult_Ok (dtb__241) -> (Base_dData_dResult.C_Base_dData_dResult_dResult_Ok ((Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCast (dtb__237, dtb__238, dtb__241))))
  | _ -> failwith "DT: impossible branch"
)
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLam (dtb__242, dtb__243, dtb__244) -> (match ((v_Vuna_dCompiler_dIr_dCps_dselTrampolineBody mc0) dtb__244) with
  | Base_dData_dResult.C_Base_dData_dResult_dResult_Err (dtb__245) -> (Base_dData_dResult.C_Base_dData_dResult_dResult_Err (dtb__245))
  | Base_dData_dResult.C_Base_dData_dResult_dResult_Ok (dtb__246) -> (Base_dData_dResult.C_Base_dData_dResult_dResult_Ok ((Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLam (dtb__242, dtb__243, dtb__246))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> (Base_dData_dResult.C_Base_dData_dResult_dResult_Err (("selective CPS: unexpected trampoline shape: " ^ mc0)))
))

# 603 "Vuna/Compiler/Ir/Cps.vuna"
let rec v_Vuna_dCompiler_dIr_dCps_dselSelfBody = (fun fuel body -> (if (fuel <= 0) then (Base_dData_dResult.C_Base_dData_dResult_dResult_Ok (body)) else ((fun nd_uscrut2 -> (match nd_uscrut2 with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (dtb__247, dtb__248) -> (match dtb__247 with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (dtb__249, dtb__250) -> (match dtb__249 with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRt (dtb__251) -> (if (dtb__251 = v_Vuna_dCompiler_dIr_dCps_dirSelSelfName) then (Base_dData_dResult.C_Base_dData_dResult_dResult_Ok ((Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp ((Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp ((Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRt (dtb__251)), dtb__250)), v_Vuna_dCompiler_dIr_dCps_dstepDoneCont)))) else (Base_dData_dResult.C_Base_dData_dResult_dResult_Err ("selective CPS: unexpected handleScoped shape")))
  | _ -> (Base_dData_dResult.C_Base_dData_dResult_dResult_Err ("selective CPS: unexpected handleScoped shape"))
)
  | _ -> (Base_dData_dResult.C_Base_dData_dResult_dResult_Err ("selective CPS: unexpected handleScoped shape"))
)
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCase (dtb__252, dtb__253) -> (match ((v_Vuna_dCompiler_dIr_dCps_dselSelfAlts (fuel - 1)) dtb__253) with
  | Base_dData_dResult.C_Base_dData_dResult_dResult_Err (dtb__254) -> (Base_dData_dResult.C_Base_dData_dResult_dResult_Err (dtb__254))
  | Base_dData_dResult.C_Base_dData_dResult_dResult_Ok (dtb__255) -> (Base_dData_dResult.C_Base_dData_dResult_dResult_Ok ((Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCase (dtb__252, dtb__255))))
  | _ -> failwith "DT: impossible branch"
)
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCast (dtb__256, dtb__257, dtb__258) -> (match ((v_Vuna_dCompiler_dIr_dCps_dselSelfBody (fuel - 1)) dtb__258) with
  | Base_dData_dResult.C_Base_dData_dResult_dResult_Err (dtb__259) -> (Base_dData_dResult.C_Base_dData_dResult_dResult_Err (dtb__259))
  | Base_dData_dResult.C_Base_dData_dResult_dResult_Ok (dtb__260) -> (Base_dData_dResult.C_Base_dData_dResult_dResult_Ok ((Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCast (dtb__256, dtb__257, dtb__260))))
  | _ -> failwith "DT: impossible branch"
)
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLam (dtb__261, dtb__262, dtb__263) -> (match ((v_Vuna_dCompiler_dIr_dCps_dselSelfBody (fuel - 1)) dtb__263) with
  | Base_dData_dResult.C_Base_dData_dResult_dResult_Err (dtb__264) -> (Base_dData_dResult.C_Base_dData_dResult_dResult_Err (dtb__264))
  | Base_dData_dResult.C_Base_dData_dResult_dResult_Ok (dtb__265) -> (Base_dData_dResult.C_Base_dData_dResult_dResult_Ok ((Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLam (dtb__261, dtb__262, dtb__265))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> (Base_dData_dResult.C_Base_dData_dResult_dResult_Err ("selective CPS: unexpected handleScoped shape"))
)) body)))
# 624 "Vuna/Compiler/Ir/Cps.vuna"
and v_Vuna_dCompiler_dIr_dCps_dselSelfAlts = (fun fuel alts -> (if (fuel <= 0) then (Base_dData_dResult.C_Base_dData_dResult_dResult_Ok (alts)) else (match alts with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Base_dData_dResult.C_Base_dData_dResult_dResult_Ok (Base_dData_dList.C_Base_dData_dList_dList_Nil))
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__266, dtb__267) -> (match ((v_Vuna_dCompiler_dIr_dCps_dselSelfBody (fuel - 1)) (dtb__266).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBody) with
  | Base_dData_dResult.C_Base_dData_dResult_dResult_Err (dtb__268) -> (Base_dData_dResult.C_Base_dData_dResult_dResult_Err (dtb__268))
  | Base_dData_dResult.C_Base_dData_dResult_dResult_Ok (dtb__269) -> (match ((v_Vuna_dCompiler_dIr_dCps_dselSelfAlts (fuel - 1)) dtb__267) with
  | Base_dData_dResult.C_Base_dData_dResult_dResult_Err (dtb__270) -> (Base_dData_dResult.C_Base_dData_dResult_dResult_Err (dtb__270))
  | Base_dData_dResult.C_Base_dData_dResult_dResult_Ok (dtb__271) -> (Base_dData_dResult.C_Base_dData_dResult_dResult_Ok ((Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltCtor = (dtb__266).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltCtor; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBinders = (dtb__266).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBinders; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBody = dtb__269 }, dtb__271))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))

# 639 "Vuna/Compiler/Ir/Cps.vuna"
let v_Vuna_dCompiler_dIr_dCps_dselDef = (fun fuel d -> (if (fuel <= 0) then (Base_dData_dResult.C_Base_dData_dResult_dResult_Ok (d)) else (match d with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrDef_IrExternDef (dtb__272, dtb__273, dtb__274, dtb__275) -> (Base_dData_dResult.C_Base_dData_dResult_dResult_Ok (d))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrDef_IrDef (dtb__276, dtb__277, dtb__278, dtb__279, dtb__280, dtb__281, dtb__282, dtb__283) -> ((fun b -> (if (if (if (dtb__276 = v_Vuna_dCompiler_dIr_dCps_drunPureName) then true else (dtb__276 = v_Vuna_dCompiler_dIr_dCps_drunEffName)) then true else (dtb__276 = v_Vuna_dCompiler_dIr_dCps_drunMainName)) then (match ((v_Vuna_dCompiler_dIr_dCps_dselTrampolineBody dtb__276) b) with
  | Base_dData_dResult.C_Base_dData_dResult_dResult_Err (dtb__284) -> (Base_dData_dResult.C_Base_dData_dResult_dResult_Err (dtb__284))
  | Base_dData_dResult.C_Base_dData_dResult_dResult_Ok (dtb__285) -> (Base_dData_dResult.C_Base_dData_dResult_dResult_Ok ((Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrDef_IrDef (dtb__276, dtb__277, dtb__278, Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, dtb__285, dtb__281, dtb__282, dtb__283))))
  | _ -> failwith "DT: impossible branch"
) else (if (dtb__276 = v_Vuna_dCompiler_dIr_dCps_dhandleScopedName) then (match ((v_Vuna_dCompiler_dIr_dCps_dselSelfBody (fuel - 1)) b) with
  | Base_dData_dResult.C_Base_dData_dResult_dResult_Err (dtb__286) -> (Base_dData_dResult.C_Base_dData_dResult_dResult_Err (dtb__286))
  | Base_dData_dResult.C_Base_dData_dResult_dResult_Ok (dtb__287) -> (Base_dData_dResult.C_Base_dData_dResult_dResult_Ok ((Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrDef_IrDef (dtb__276, dtb__277, dtb__278, Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, dtb__287, dtb__281, dtb__282, dtb__283))))
  | _ -> failwith "DT: impossible branch"
) else (Base_dData_dResult.C_Base_dData_dResult_dResult_Ok ((Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrDef_IrDef (dtb__276, dtb__277, dtb__278, Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, b, dtb__281, dtb__282, dtb__283))))))) ((v_Vuna_dCompiler_dIr_dCps_dselSyms (fuel - 1)) dtb__280))
  | _ -> failwith "DT: impossible branch"
)))

# 660 "Vuna/Compiler/Ir/Cps.vuna"
let rec v_Vuna_dCompiler_dIr_dCps_dselDefs = (fun fuel defs -> (if (fuel <= 0) then (Base_dData_dResult.C_Base_dData_dResult_dResult_Ok (defs)) else (match defs with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Base_dData_dResult.C_Base_dData_dResult_dResult_Ok (Base_dData_dList.C_Base_dData_dList_dList_Nil))
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__288, dtb__289) -> (match ((v_Vuna_dCompiler_dIr_dCps_dselDef (fuel - 1)) dtb__288) with
  | Base_dData_dResult.C_Base_dData_dResult_dResult_Err (dtb__290) -> (Base_dData_dResult.C_Base_dData_dResult_dResult_Err (dtb__290))
  | Base_dData_dResult.C_Base_dData_dResult_dResult_Ok (dtb__291) -> (match ((v_Vuna_dCompiler_dIr_dCps_dselDefs (fuel - 1)) dtb__289) with
  | Base_dData_dResult.C_Base_dData_dResult_dResult_Err (dtb__292) -> (Base_dData_dResult.C_Base_dData_dResult_dResult_Err (dtb__292))
  | Base_dData_dResult.C_Base_dData_dResult_dResult_Ok (dtb__293) -> (Base_dData_dResult.C_Base_dData_dResult_dResult_Ok ((Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__291, dtb__293))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))

# 679 "Vuna/Compiler/Ir/Cps.vuna"
let v_Vuna_dCompiler_dIr_dCps_dmBNameText = (fun (mc0 : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrBName) -> (match mc0 with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrBName_IrBWild -> "wild"
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrBName_IrBNat (dtb__294) -> ("nat" ^ (bi_strFromInt dtb__294))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrBName_IrBArm (dtb__295) -> ("arm" ^ (bi_strFromInt dtb__295))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrBName_IrBUser (dtb__296) -> dtb__296
  | _ -> failwith "DT: impossible branch"
))

# 685 "Vuna/Compiler/Ir/Cps.vuna"
let v_Vuna_dCompiler_dIr_dCps_dmIsOp = (fun b -> (match (b).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrBinder_irBinderName with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrBName_IrBUser (dtb__297) -> (dtb__297 = "@vuna@handle@o")
  | _ -> false
))

# 694 "Vuna/Compiler/Ir/Cps.vuna"
let rec v_Vuna_dCompiler_dIr_dCps_dmResumeGo = (fun (mc0 : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrBinder Base_dData_dList.t_Base_dData_dList_dList) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__298, dtb__299) -> (if (v_Vuna_dCompiler_dIr_dCps_dmIsOp dtb__298) then (match dtb__299 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__300, dtb__301) -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__300))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
) else (v_Vuna_dCompiler_dIr_dCps_dmResumeGo dtb__299))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 691 "Vuna/Compiler/Ir/Cps.vuna"
let v_Vuna_dCompiler_dIr_dCps_dmResumption = (fun bs -> (v_Vuna_dCompiler_dIr_dCps_dmResumeGo (v_Vuna_dCompiler_dIr_dCps_druntimeBinders bs)))

# 704 "Vuna/Compiler/Ir/Cps.vuna"
let rec v_Vuna_dCompiler_dIr_dCps_dmEraseHead = (fun (mc0 : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIr) -> (match mc0 with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCast (dtb__302, dtb__303, dtb__304) -> (v_Vuna_dCompiler_dIr_dCps_dmEraseHead dtb__304)
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (dtb__305, dtb__306) -> (match dtb__305 with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRt (dtb__307) -> (if (dtb__307 = "prim_erase") then (v_Vuna_dCompiler_dIr_dCps_dmEraseHead dtb__306) else mc0)
  | _ -> mc0
)
  | _ -> mc0
))

# 711 "Vuna/Compiler/Ir/Cps.vuna"
let rec v_Vuna_dCompiler_dIr_dCps_dmStripErase = (fun (mc0 : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIr) -> (match mc0 with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (dtb__308, dtb__309) -> (match dtb__308 with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRt (dtb__310) -> (if (dtb__310 = "prim_erase") then (v_Vuna_dCompiler_dIr_dCps_dmStripErase dtb__309) else (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp ((Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRt (dtb__310)), dtb__309)))
  | _ -> mc0
)
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCast (dtb__311, dtb__312, dtb__313) -> (v_Vuna_dCompiler_dIr_dCps_dmStripErase dtb__313)
  | _ -> mc0
))

# 719 "Vuna/Compiler/Ir/Cps.vuna"
let v_Vuna_dCompiler_dIr_dCps_dmIsResumeAppGo = (fun (mc0 : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrBinder) (mc1 : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIr) -> (match mc1 with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (dtb__314, dtb__315) -> ((fun p -> (match (v_Vuna_dCompiler_dIr_dCps_dmEraseHead (Base_dData_dPair.v_Base_dData_dPair_dfirstOf p)) with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrVar (dtb__316) -> ((v_Vuna_dCompiler_dIr_dCps_dmBNameText (dtb__316).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrBinder_irBinderName) = (v_Vuna_dCompiler_dIr_dCps_dmBNameText (mc0).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrBinder_irBinderName))
  | _ -> (match (Base_dData_dPair.v_Base_dData_dPair_dsecondOf p) with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__317, dtb__318) -> (match (v_Vuna_dCompiler_dIr_dCps_dmEraseHead dtb__317) with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrVar (dtb__319) -> ((v_Vuna_dCompiler_dIr_dCps_dmBNameText (dtb__319).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrBinder_irBinderName) = (v_Vuna_dCompiler_dIr_dCps_dmBNameText (mc0).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrBinder_irBinderName))
  | _ -> false
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
)
)) (v_Vuna_dCompiler_dIr_dCps_dflattenApp mc1))
  | _ -> false
))

# 716 "Vuna/Compiler/Ir/Cps.vuna"
let v_Vuna_dCompiler_dIr_dCps_dmIsResumeApp = (fun r e0 -> ((v_Vuna_dCompiler_dIr_dCps_dmIsResumeAppGo r) (v_Vuna_dCompiler_dIr_dCps_dmStripErase e0)))

# 734 "Vuna/Compiler/Ir/Cps.vuna"
let v_Vuna_dCompiler_dIr_dCps_dmFreshV = (fun n -> (v_Vuna_dCompiler_dIr_dCps_dmkBinder ("__mchV" ^ (bi_strFromInt n))))

# 737 "Vuna/Compiler/Ir/Cps.vuna"
let v_Vuna_dCompiler_dIr_dCps_dmFreshK = (fun n -> (v_Vuna_dCompiler_dIr_dCps_dmkBinder ("__mchK" ^ (bi_strFromInt n))))

# 740 "Vuna/Compiler/Ir/Cps.vuna"
let v_Vuna_dCompiler_dIr_dCps_dmFreshR = (fun n -> (v_Vuna_dCompiler_dIr_dCps_dmkBinder ("__mchR" ^ (bi_strFromInt n))))

# 745 "Vuna/Compiler/Ir/Cps.vuna"
let v_Vuna_dCompiler_dIr_dCps_disEffResultTy = (fun (mc0 : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrTy Base_dData_dMaybe.t_Base_dData_dMaybe_dMaybe) -> (match mc0 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__320) -> (match dtb__320 with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyData (dtb__321, dtb__322) -> (dtb__321 = Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirEffTypeName)
  | _ -> false
)
  | _ -> false
))

# 749 "Vuna/Compiler/Ir/Cps.vuna"
let v_Vuna_dCompiler_dIr_dCps_disEffContLambda = (fun _uarity0 -> (v_Vuna_dCompiler_dIr_dCps_disEffResultTy _uarity0))

# 753 "Vuna/Compiler/Ir/Cps.vuna"
let v_Vuna_dCompiler_dIr_dCps_disEffThunkBody = (fun (mc0 : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIr) -> (match mc0 with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCtor (dtb__323, dtb__324, dtb__325) -> (match dtb__325 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__326, dtb__327) -> (match dtb__326 with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLam (dtb__328, dtb__329, dtb__330) -> (match dtb__327 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (if (dtb__323 = Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirEffTypeName) then (dtb__324 = Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirEffMkCtor) else false)
  | _ -> false
)
  | _ -> false
)
  | _ -> false
)
  | _ -> false
))

# 758 "Vuna/Compiler/Ir/Cps.vuna"
let v_Vuna_dCompiler_dIr_dCps_dmRunEffTerm = (fun eff k -> ((fun th -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCase (eff, (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltCtor = (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirEffTypeName; Base_dData_dPair.f_Base_dData_dPair_dPair_second = Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirEffMkCtor })); Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBinders = (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (th, Base_dData_dList.C_Base_dData_dList_dList_Nil)); Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBody = (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRtApp (v_Vuna_dCompiler_dIr_dCps_dirMRunEffName, (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ((Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrVar (th)), (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (k, Base_dData_dList.C_Base_dData_dList_dList_Nil)))))) }, Base_dData_dList.C_Base_dData_dList_dList_Nil))))) (v_Vuna_dCompiler_dIr_dCps_dmkBinder "__mEffTh")))

# 766 "Vuna/Compiler/Ir/Cps.vuna"
let v_Vuna_dCompiler_dIr_dCps_dmNoResumption = (v_Vuna_dCompiler_dIr_dCps_dmkBinder "@vuna@noresume")

# 771 "Vuna/Compiler/Ir/Cps.vuna"
let rec v_Vuna_dCompiler_dIr_dCps_dmEffContLambda = (fun fuel r bs rt body -> ((fun kd -> ((fun u -> ((fun v -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLam (bs, rt, (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCtor (Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirEffTypeName, Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirEffMkCtor, (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ((Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLam ((Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (u, (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (kd, Base_dData_dList.C_Base_dData_dList_dList_Nil)))), Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, ((((v_Vuna_dCompiler_dIr_dCps_dmCps (fuel - 1)) r) (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLam ((Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (v, Base_dData_dList.C_Base_dData_dList_dList_Nil)), Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, ((v_Vuna_dCompiler_dIr_dCps_dmRunEffTerm (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrVar (v))) (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrVar (kd)))))) body))), Base_dData_dList.C_Base_dData_dList_dList_Nil))))))) (v_Vuna_dCompiler_dIr_dCps_dmFreshV fuel))) (v_Vuna_dCompiler_dIr_dCps_dmkBinder "__mEffU"))) (v_Vuna_dCompiler_dIr_dCps_dmFreshK fuel)))
# 782 "Vuna/Compiler/Ir/Cps.vuna"
and v_Vuna_dCompiler_dIr_dCps_dmCpsAlts = (fun fuel r k alts -> (if (fuel <= 0) then alts else (match alts with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__331, dtb__332) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltCtor = (dtb__331).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltCtor; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBinders = (dtb__331).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBinders; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBody = ((((v_Vuna_dCompiler_dIr_dCps_dmCps (fuel - 1)) r) k) (dtb__331).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBody) }, ((((v_Vuna_dCompiler_dIr_dCps_dmCpsAlts (fuel - 1)) r) k) dtb__332)))
  | _ -> failwith "DT: impossible branch"
)))
# 791 "Vuna/Compiler/Ir/Cps.vuna"
and v_Vuna_dCompiler_dIr_dCps_dmCpsAltM = (fun fuel r k m -> (if (fuel <= 0) then m else (match m with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__333) -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ({ Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltCtor = (dtb__333).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltCtor; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBinders = (dtb__333).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBinders; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBody = ((((v_Vuna_dCompiler_dIr_dCps_dmCps (fuel - 1)) r) k) (dtb__333).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBody) }))
  | _ -> failwith "DT: impossible branch"
)))
# 807 "Vuna/Compiler/Ir/Cps.vuna"
and v_Vuna_dCompiler_dIr_dCps_dmCpsArgs = (fun fuel r k sym args acc -> (if (fuel <= 0) then (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (k, (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRtApp (sym, (Base_dData_dList.v_Base_dData_dList_dreverse acc))))) else (match args with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (k, (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRtApp (sym, (Base_dData_dList.v_Base_dData_dList_dreverse acc)))))
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__334, dtb__335) -> ((fun v -> ((((v_Vuna_dCompiler_dIr_dCps_dmCps (fuel - 1)) r) (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLam ((Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (v, Base_dData_dList.C_Base_dData_dList_dList_Nil)), Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, ((((((v_Vuna_dCompiler_dIr_dCps_dmCpsArgs (fuel - 1)) r) k) sym) dtb__335) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ((Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrVar (v)), acc)))))) dtb__334)) (v_Vuna_dCompiler_dIr_dCps_dmFreshV fuel))
  | _ -> failwith "DT: impossible branch"
)))
# 820 "Vuna/Compiler/Ir/Cps.vuna"
and v_Vuna_dCompiler_dIr_dCps_dmCpsApply = (fun fuel r k parts -> (if (fuel <= 0) then (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (k, (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrGlobal ("?")))) else ((fun nd_uscrut4 -> (match nd_uscrut4 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__336, dtb__337) -> (match dtb__337 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> ((((v_Vuna_dCompiler_dIr_dCps_dmCps (fuel - 1)) r) k) dtb__336)
  | _ -> ((fun v -> ((((v_Vuna_dCompiler_dIr_dCps_dmCps (fuel - 1)) r) (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLam ((Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (v, Base_dData_dList.C_Base_dData_dList_dList_Nil)), Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, ((((((v_Vuna_dCompiler_dIr_dCps_dmCpsApplyArgs (fuel - 1)) r) k) dtb__337) Base_dData_dList.C_Base_dData_dList_dList_Nil) v)))) dtb__336)) (v_Vuna_dCompiler_dIr_dCps_dmFreshV fuel))
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (k, (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrGlobal ("?"))))
  | _ -> failwith "DT: impossible branch"
)) parts)))
# 833 "Vuna/Compiler/Ir/Cps.vuna"
and v_Vuna_dCompiler_dIr_dCps_dmCpsApplyArgs = (fun fuel r k args acc headV -> (if (fuel <= 0) then (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (k, (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrGlobal ("?")))) else (match args with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (k, ((v_Vuna_dCompiler_dIr_dCps_dapplyAll (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrVar (headV))) (Base_dData_dList.v_Base_dData_dList_dreverse acc))))
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__338, dtb__339) -> ((fun v -> ((((v_Vuna_dCompiler_dIr_dCps_dmCps (fuel - 1)) r) (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLam ((Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (v, Base_dData_dList.C_Base_dData_dList_dList_Nil)), Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, ((((((v_Vuna_dCompiler_dIr_dCps_dmCpsApplyArgs (fuel - 1)) r) k) dtb__339) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ((Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrVar (v)), acc))) headV)))) dtb__338)) (v_Vuna_dCompiler_dIr_dCps_dmFreshV fuel))
  | _ -> failwith "DT: impossible branch"
)))
# 845 "Vuna/Compiler/Ir/Cps.vuna"
and v_Vuna_dCompiler_dIr_dCps_dmCps = (fun fuel r k e -> (if (fuel <= 0) then (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (k, e)) else (if ((v_Vuna_dCompiler_dIr_dCps_dmIsResumeApp r) e) then (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (e, k)) else (match e with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLet (dtb__340, dtb__341, dtb__342) -> ((fun v -> ((fun cont -> ((((v_Vuna_dCompiler_dIr_dCps_dmCps (fuel - 1)) r) cont) dtb__341)) (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLam ((Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (v, Base_dData_dList.C_Base_dData_dList_dList_Nil)), Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLet (dtb__340, (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrVar (v)), ((((v_Vuna_dCompiler_dIr_dCps_dmCps (fuel - 1)) r) k) dtb__342))))))) (v_Vuna_dCompiler_dIr_dCps_dmFreshV fuel))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCase (dtb__343, dtb__344) -> ((fun v -> ((fun cont -> ((((v_Vuna_dCompiler_dIr_dCps_dmCps (fuel - 1)) r) cont) dtb__343)) (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLam ((Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (v, Base_dData_dList.C_Base_dData_dList_dList_Nil)), Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCase ((Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrVar (v)), ((((v_Vuna_dCompiler_dIr_dCps_dmCpsAlts (fuel - 2)) r) k) dtb__344))))))) (v_Vuna_dCompiler_dIr_dCps_dmFreshV fuel))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrIf (dtb__345, dtb__346, dtb__347) -> ((fun v -> ((fun cont -> ((((v_Vuna_dCompiler_dIr_dCps_dmCps (fuel - 1)) r) cont) dtb__345)) (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLam ((Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (v, Base_dData_dList.C_Base_dData_dList_dList_Nil)), Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrIf ((Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrVar (v)), ((((v_Vuna_dCompiler_dIr_dCps_dmCps (fuel - 2)) r) k) dtb__346), ((((v_Vuna_dCompiler_dIr_dCps_dmCps (fuel - 2)) r) k) dtb__347))))))) (v_Vuna_dCompiler_dIr_dCps_dmFreshV fuel))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrNatCase (dtb__348, dtb__349, dtb__350, dtb__351, dtb__352) -> ((fun v -> ((fun cont -> ((((v_Vuna_dCompiler_dIr_dCps_dmCps (fuel - 1)) r) cont) dtb__348)) (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLam ((Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (v, Base_dData_dList.C_Base_dData_dList_dList_Nil)), Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrNatCase ((Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrVar (v)), dtb__349, ((((v_Vuna_dCompiler_dIr_dCps_dmCpsAltM (fuel - 2)) r) k) dtb__350), ((((v_Vuna_dCompiler_dIr_dCps_dmCpsAltM (fuel - 2)) r) k) dtb__351), ((((v_Vuna_dCompiler_dIr_dCps_dmCpsAltM (fuel - 2)) r) k) dtb__352))))))) (v_Vuna_dCompiler_dIr_dCps_dmFreshV fuel))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCast (dtb__353, dtb__354, dtb__355) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCast (dtb__353, dtb__354, ((((v_Vuna_dCompiler_dIr_dCps_dmCps (fuel - 1)) r) k) dtb__355)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRtApp (dtb__356, dtb__357) -> ((((((v_Vuna_dCompiler_dIr_dCps_dmCpsArgs (fuel - 1)) r) k) dtb__356) dtb__357) Base_dData_dList.C_Base_dData_dList_dList_Nil)
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLam (dtb__358, dtb__359, dtb__360) -> (if (v_Vuna_dCompiler_dIr_dCps_disEffContLambda dtb__359) then (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (k, (((((v_Vuna_dCompiler_dIr_dCps_dmEffContLambda (fuel - 1)) r) dtb__358) dtb__359) dtb__360))) else (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (k, e)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (dtb__361, dtb__362) -> ((fun p -> ((((v_Vuna_dCompiler_dIr_dCps_dmCpsApply (fuel - 1)) r) k) ((Base_dData_dList.v_Base_dData_dList_dappend (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ((Base_dData_dPair.v_Base_dData_dPair_dfirstOf p), Base_dData_dList.C_Base_dData_dList_dList_Nil))) (Base_dData_dPair.v_Base_dData_dPair_dsecondOf p)))) (v_Vuna_dCompiler_dIr_dCps_dflattenApp e))
  | _ -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (k, e))
))))

# 800 "Vuna/Compiler/Ir/Cps.vuna"
let v_Vuna_dCompiler_dIr_dCps_dmIsControl = (fun (mc0 : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIr) -> (match mc0 with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrNatCase (dtb__363, dtb__364, dtb__365, dtb__366, dtb__367) -> true
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrIf (dtb__368, dtb__369, dtb__370) -> true
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCase (dtb__371, dtb__372) -> true
  | _ -> false
))

# 953 "Vuna/Compiler/Ir/Cps.vuna"
let v_Vuna_dCompiler_dIr_dCps_dmSym = (fun x -> (if (x = v_Vuna_dCompiler_dIr_dCps_dirCpsPerformName) then v_Vuna_dCompiler_dIr_dCps_dirMPerformName else (if (x = v_Vuna_dCompiler_dIr_dCps_dirCpsHandleName) then v_Vuna_dCompiler_dIr_dCps_dirMHandleName else (if (x = v_Vuna_dCompiler_dIr_dCps_dirCpsSelfName) then v_Vuna_dCompiler_dIr_dCps_dirMSelfName else x))))

# 959 "Vuna/Compiler/Ir/Cps.vuna"
let rec v_Vuna_dCompiler_dIr_dCps_dmSyms = (fun fuel e -> (if (fuel <= 0) then e else (match e with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRt (dtb__373) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRt ((v_Vuna_dCompiler_dIr_dCps_dmSym dtb__373)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRtApp (dtb__374, dtb__375) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRtApp ((v_Vuna_dCompiler_dIr_dCps_dmSym dtb__374), ((v_Vuna_dCompiler_dIr_dCps_dmListS (fuel - 1)) dtb__375)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCtor (dtb__376, dtb__377, dtb__378) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCtor (dtb__376, dtb__377, ((v_Vuna_dCompiler_dIr_dCps_dmListS (fuel - 1)) dtb__378)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRecord (dtb__379, dtb__380) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRecord (dtb__379, ((v_Vuna_dCompiler_dIr_dCps_dmFieldsS (fuel - 1)) dtb__380)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrProj (dtb__381, dtb__382, dtb__383) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrProj (((v_Vuna_dCompiler_dIr_dCps_dmSyms (fuel - 1)) dtb__381), dtb__382, dtb__383))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRecUpd (dtb__384, dtb__385, dtb__386) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRecUpd (((v_Vuna_dCompiler_dIr_dCps_dmSyms (fuel - 1)) dtb__384), dtb__385, ((v_Vuna_dCompiler_dIr_dCps_dmFieldsS (fuel - 1)) dtb__386)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCast (dtb__387, dtb__388, dtb__389) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCast (dtb__387, dtb__388, ((v_Vuna_dCompiler_dIr_dCps_dmSyms (fuel - 1)) dtb__389)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLet (dtb__390, dtb__391, dtb__392) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLet (dtb__390, ((v_Vuna_dCompiler_dIr_dCps_dmSyms (fuel - 1)) dtb__391), ((v_Vuna_dCompiler_dIr_dCps_dmSyms (fuel - 1)) dtb__392)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLam (dtb__393, dtb__394, dtb__395) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLam (dtb__393, dtb__394, ((v_Vuna_dCompiler_dIr_dCps_dmSyms (fuel - 1)) dtb__395)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (dtb__396, dtb__397) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (((v_Vuna_dCompiler_dIr_dCps_dmSyms (fuel - 1)) dtb__396), ((v_Vuna_dCompiler_dIr_dCps_dmSyms (fuel - 1)) dtb__397)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrIf (dtb__398, dtb__399, dtb__400) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrIf (((v_Vuna_dCompiler_dIr_dCps_dmSyms (fuel - 1)) dtb__398), ((v_Vuna_dCompiler_dIr_dCps_dmSyms (fuel - 1)) dtb__399), ((v_Vuna_dCompiler_dIr_dCps_dmSyms (fuel - 1)) dtb__400)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCase (dtb__401, dtb__402) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCase (((v_Vuna_dCompiler_dIr_dCps_dmSyms (fuel - 1)) dtb__401), ((v_Vuna_dCompiler_dIr_dCps_dmSymsAltsM (fuel - 1)) dtb__402)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrNatCase (dtb__403, dtb__404, dtb__405, dtb__406, dtb__407) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrNatCase (((v_Vuna_dCompiler_dIr_dCps_dmSyms (fuel - 1)) dtb__403), dtb__404, ((v_Vuna_dCompiler_dIr_dCps_dmSymsAltMM (fuel - 1)) dtb__405), ((v_Vuna_dCompiler_dIr_dCps_dmSymsAltMM (fuel - 1)) dtb__406), ((v_Vuna_dCompiler_dIr_dCps_dmSymsAltMM (fuel - 1)) dtb__407)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrConcatMany (dtb__408) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrConcatMany (((v_Vuna_dCompiler_dIr_dCps_dmListS (fuel - 1)) dtb__408)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrEffThunk (dtb__409, dtb__410, dtb__411, dtb__412, dtb__413) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrEffThunk (dtb__409, dtb__410, dtb__411, dtb__412, ((v_Vuna_dCompiler_dIr_dCps_dmSyms (fuel - 1)) dtb__413)))
  | _ -> e
)))
# 982 "Vuna/Compiler/Ir/Cps.vuna"
and v_Vuna_dCompiler_dIr_dCps_dmListS = (fun fuel xs -> (if (fuel <= 0) then xs else (match xs with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__414, dtb__415) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (((v_Vuna_dCompiler_dIr_dCps_dmSyms (fuel - 1)) dtb__414), ((v_Vuna_dCompiler_dIr_dCps_dmListS (fuel - 1)) dtb__415)))
  | _ -> failwith "DT: impossible branch"
)))
# 991 "Vuna/Compiler/Ir/Cps.vuna"
and v_Vuna_dCompiler_dIr_dCps_dmFieldsS = (fun fuel fs -> (if (fuel <= 0) then fs else (match fs with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__416, dtb__417) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Base_dData_dPair.v_Base_dData_dPair_dfirstOf dtb__416); Base_dData_dPair.f_Base_dData_dPair_dPair_second = ((v_Vuna_dCompiler_dIr_dCps_dmSyms (fuel - 1)) (Base_dData_dPair.v_Base_dData_dPair_dsecondOf dtb__416)) }, ((v_Vuna_dCompiler_dIr_dCps_dmFieldsS (fuel - 1)) dtb__417)))
  | _ -> failwith "DT: impossible branch"
)))
# 1000 "Vuna/Compiler/Ir/Cps.vuna"
and v_Vuna_dCompiler_dIr_dCps_dmSymsAltsM = (fun fuel alts -> (if (fuel <= 0) then alts else (match alts with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__418, dtb__419) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltCtor = (dtb__418).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltCtor; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBinders = (dtb__418).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBinders; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBody = ((v_Vuna_dCompiler_dIr_dCps_dmSyms (fuel - 1)) (dtb__418).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBody) }, ((v_Vuna_dCompiler_dIr_dCps_dmSymsAltsM (fuel - 1)) dtb__419)))
  | _ -> failwith "DT: impossible branch"
)))
# 1009 "Vuna/Compiler/Ir/Cps.vuna"
and v_Vuna_dCompiler_dIr_dCps_dmSymsAltMM = (fun fuel m -> (if (fuel <= 0) then m else (match m with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__420) -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ({ Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltCtor = (dtb__420).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltCtor; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBinders = (dtb__420).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBinders; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBody = ((v_Vuna_dCompiler_dIr_dCps_dmSyms (fuel - 1)) (dtb__420).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBody) }))
  | _ -> failwith "DT: impossible branch"
)))

# 1018 "Vuna/Compiler/Ir/Cps.vuna"
let v_Vuna_dCompiler_dIr_dCps_dmDoneCont = ((fun v -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLam ((Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (v, Base_dData_dList.C_Base_dData_dList_dList_Nil)), Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp ((Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRt (v_Vuna_dCompiler_dIr_dCps_dirMDoneName)), (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrVar (v))))))) (v_Vuna_dCompiler_dIr_dCps_dmkBinder "__mDoneV"))

# 1024 "Vuna/Compiler/Ir/Cps.vuna"
let rec v_Vuna_dCompiler_dIr_dCps_dmTrampolineBody = (fun (mc0 : string) (mc1 : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIr) -> (match mc1 with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (dtb__421, dtb__422) -> (match dtb__421 with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (dtb__423, dtb__424) -> (match dtb__423 with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (dtb__425, dtb__426) -> (match dtb__425 with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrGlobal (dtb__427) -> (if (dtb__427 = v_Vuna_dCompiler_dIr_dCps_drunThunkName) then (Base_dData_dResult.C_Base_dData_dResult_dResult_Ok ((Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp ((Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRt (v_Vuna_dCompiler_dIr_dCps_dirMRunName)), ((v_Vuna_dCompiler_dIr_dCps_dapplyAll (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrGlobal (dtb__427))) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__426, (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__424, (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (v_Vuna_dCompiler_dIr_dCps_dmDoneCont, Base_dData_dList.C_Base_dData_dList_dList_Nil))))))))))) else (Base_dData_dResult.C_Base_dData_dResult_dResult_Err (("machine CPS: unexpected trampoline shape: " ^ mc0))))
  | _ -> (Base_dData_dResult.C_Base_dData_dResult_dResult_Err (("machine CPS: unexpected trampoline shape: " ^ mc0)))
)
  | _ -> (Base_dData_dResult.C_Base_dData_dResult_dResult_Err (("machine CPS: unexpected trampoline shape: " ^ mc0)))
)
  | _ -> (Base_dData_dResult.C_Base_dData_dResult_dResult_Err (("machine CPS: unexpected trampoline shape: " ^ mc0)))
)
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCast (dtb__428, dtb__429, dtb__430) -> (match ((v_Vuna_dCompiler_dIr_dCps_dmTrampolineBody mc0) dtb__430) with
  | Base_dData_dResult.C_Base_dData_dResult_dResult_Err (dtb__431) -> (Base_dData_dResult.C_Base_dData_dResult_dResult_Err (dtb__431))
  | Base_dData_dResult.C_Base_dData_dResult_dResult_Ok (dtb__432) -> (Base_dData_dResult.C_Base_dData_dResult_dResult_Ok ((Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCast (dtb__428, dtb__429, dtb__432))))
  | _ -> failwith "DT: impossible branch"
)
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLam (dtb__433, dtb__434, dtb__435) -> (match ((v_Vuna_dCompiler_dIr_dCps_dmTrampolineBody mc0) dtb__435) with
  | Base_dData_dResult.C_Base_dData_dResult_dResult_Err (dtb__436) -> (Base_dData_dResult.C_Base_dData_dResult_dResult_Err (dtb__436))
  | Base_dData_dResult.C_Base_dData_dResult_dResult_Ok (dtb__437) -> (Base_dData_dResult.C_Base_dData_dResult_dResult_Ok ((Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLam (dtb__433, dtb__434, dtb__437))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> (Base_dData_dResult.C_Base_dData_dResult_dResult_Err (("machine CPS: unexpected trampoline shape: " ^ mc0)))
))

# 1046 "Vuna/Compiler/Ir/Cps.vuna"
let v_Vuna_dCompiler_dIr_dCps_dmBodyOf = (fun d -> (match (Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirDefBody d) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__438) -> dtb__438
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrInt (0))
  | _ -> failwith "DT: impossible branch"
))

# 1056 "Vuna/Compiler/Ir/Cps.vuna"
let rec v_Vuna_dCompiler_dIr_dCps_ddefArities = (fun fuel ds -> (if (fuel <= 0) then Base_dData_dList.C_Base_dData_dList_dList_Nil else (match ds with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__439, dtb__440) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirDefName dtb__439); Base_dData_dPair.f_Base_dData_dPair_dPair_second = (Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirDefArity dtb__439) }, ((v_Vuna_dCompiler_dIr_dCps_ddefArities (fuel - 1)) dtb__440)))
  | _ -> failwith "DT: impossible branch"
)))

# 1065 "Vuna/Compiler/Ir/Cps.vuna"
let rec v_Vuna_dCompiler_dIr_dCps_ddefSigs = (fun fuel ds -> (if (fuel <= 0) then Base_dData_dList.C_Base_dData_dList_dList_Nil else (match ds with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__441, dtb__442) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirDefName dtb__441); Base_dData_dPair.f_Base_dData_dPair_dPair_second = (Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirDefTy dtb__441) }, ((v_Vuna_dCompiler_dIr_dCps_ddefSigs (fuel - 1)) dtb__442)))
  | _ -> failwith "DT: impossible branch"
)))

# 1074 "Vuna/Compiler/Ir/Cps.vuna"
let v_Vuna_dCompiler_dIr_dCps_dhandlerTables = (fun fuel ds -> { f_Vuna_dCompiler_dIr_dCps_dHandlerTables_htArities = ((v_Vuna_dCompiler_dIr_dCps_ddefArities fuel) ds); f_Vuna_dCompiler_dIr_dCps_dHandlerTables_htSigs = ((v_Vuna_dCompiler_dIr_dCps_ddefSigs fuel) ds) })

# 1077 "Vuna/Compiler/Ir/Cps.vuna"
let rec v_Vuna_dCompiler_dIr_dCps_darityOf = (fun (mc0 : (string, int) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (mc1 : string) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__443, dtb__444) -> (if ((Base_dData_dPair.v_Base_dData_dPair_dfirstOf dtb__443) = mc1) then (Base_dData_dPair.v_Base_dData_dPair_dsecondOf dtb__443) else ((v_Vuna_dCompiler_dIr_dCps_darityOf dtb__444) mc1))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))

# 1081 "Vuna/Compiler/Ir/Cps.vuna"
let rec v_Vuna_dCompiler_dIr_dCps_dsigOf = (fun (mc0 : (string, Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrTy Base_dData_dMaybe.t_Base_dData_dMaybe_dMaybe) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (mc1 : string) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__445, dtb__446) -> (if ((Base_dData_dPair.v_Base_dData_dPair_dfirstOf dtb__445) = mc1) then (Base_dData_dPair.v_Base_dData_dPair_dsecondOf dtb__445) else ((v_Vuna_dCompiler_dIr_dCps_dsigOf dtb__446) mc1))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 1085 "Vuna/Compiler/Ir/Cps.vuna"
let rec v_Vuna_dCompiler_dIr_dCps_dfunArity = (fun (mc0 : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrTy) -> (match mc0 with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyFun (dtb__447, dtb__448) -> (1 + (v_Vuna_dCompiler_dIr_dCps_dfunArity dtb__448))
  | _ -> 0
))

# 1089 "Vuna/Compiler/Ir/Cps.vuna"
let rec v_Vuna_dCompiler_dIr_dCps_dfunResult = (fun (mc0 : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrTy) -> (match mc0 with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyFun (dtb__449, dtb__450) -> (v_Vuna_dCompiler_dIr_dCps_dfunResult dtb__450)
  | _ -> mc0
))

# 1093 "Vuna/Compiler/Ir/Cps.vuna"
let v_Vuna_dCompiler_dIr_dCps_disFunTy = (fun (mc0 : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrTy) -> (match mc0 with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyFun (dtb__451, dtb__452) -> true
  | _ -> false
))

# 1100 "Vuna/Compiler/Ir/Cps.vuna"
let v_Vuna_dCompiler_dIr_dCps_disClauseTy = (fun (mc0 : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrTy) -> (match mc0 with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyFun (dtb__453, dtb__454) -> (match dtb__454 with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyFun (dtb__455, dtb__456) -> (v_Vuna_dCompiler_dIr_dCps_disFunTy dtb__455)
  | _ -> false
)
  | _ -> false
))

# 1109 "Vuna/Compiler/Ir/Cps.vuna"
let rec v_Vuna_dCompiler_dIr_dCps_dhasClauseParam = (fun (mc0 : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrTy) -> (match mc0 with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyFun (dtb__457, dtb__458) -> (if (v_Vuna_dCompiler_dIr_dCps_disClauseTy dtb__457) then true else (v_Vuna_dCompiler_dIr_dCps_dhasClauseParam dtb__458))
  | _ -> false
))

# 1105 "Vuna/Compiler/Ir/Cps.vuna"
let v_Vuna_dCompiler_dIr_dCps_disHandlerCombinatorTy = (fun ty -> (if (if ((v_Vuna_dCompiler_dIr_dCps_dfunArity ty) >= 2) then (v_Vuna_dCompiler_dIr_dCps_disEffResultTy (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ((v_Vuna_dCompiler_dIr_dCps_dfunResult ty)))) else false) then (v_Vuna_dCompiler_dIr_dCps_dhasClauseParam ty) else false))

# 1113 "Vuna/Compiler/Ir/Cps.vuna"
let v_Vuna_dCompiler_dIr_dCps_disHandleCombinator = (fun t n -> (match ((v_Vuna_dCompiler_dIr_dCps_dsigOf (t).f_Vuna_dCompiler_dIr_dCps_dHandlerTables_htSigs) n) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__459) -> (if ((v_Vuna_dCompiler_dIr_dCps_dfunArity dtb__459) = 0) then (if ((Base_dData_dString.v_Base_dData_dString_dstartsWith "Base.Effect.") n) then ((Base_dData_dString.v_Base_dData_dString_dcontains "handle") n) else false) else (v_Vuna_dCompiler_dIr_dCps_disHandlerCombinatorTy dtb__459))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (if ((Base_dData_dString.v_Base_dData_dString_dstartsWith "Base.Effect.") n) then ((Base_dData_dString.v_Base_dData_dString_dcontains "handle") n) else false)
  | _ -> failwith "DT: impossible branch"
))

# 1123 "Vuna/Compiler/Ir/Cps.vuna"
let v_Vuna_dCompiler_dIr_dCps_dclauseArityOf = (fun t n -> (match ((v_Vuna_dCompiler_dIr_dCps_dsigOf (t).f_Vuna_dCompiler_dIr_dCps_dHandlerTables_htSigs) n) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__460) -> (if ((v_Vuna_dCompiler_dIr_dCps_dfunArity dtb__460) > 0) then (v_Vuna_dCompiler_dIr_dCps_dfunArity dtb__460) else ((v_Vuna_dCompiler_dIr_dCps_darityOf (t).f_Vuna_dCompiler_dIr_dCps_dHandlerTables_htArities) n))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> ((v_Vuna_dCompiler_dIr_dCps_darityOf (t).f_Vuna_dCompiler_dIr_dCps_dHandlerTables_htArities) n)
  | _ -> failwith "DT: impossible branch"
))

# 1129 "Vuna/Compiler/Ir/Cps.vuna"
let v_Vuna_dCompiler_dIr_dCps_disClauseGlobal = (fun t n -> (match ((v_Vuna_dCompiler_dIr_dCps_dsigOf (t).f_Vuna_dCompiler_dIr_dCps_dHandlerTables_htSigs) n) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__461) -> (if ((v_Vuna_dCompiler_dIr_dCps_dfunArity dtb__461) > 0) then (v_Vuna_dCompiler_dIr_dCps_disClauseTy dtb__461) else (((v_Vuna_dCompiler_dIr_dCps_darityOf (t).f_Vuna_dCompiler_dIr_dCps_dHandlerTables_htArities) n) >= 2))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (((v_Vuna_dCompiler_dIr_dCps_darityOf (t).f_Vuna_dCompiler_dIr_dCps_dHandlerTables_htArities) n) >= 2)
  | _ -> failwith "DT: impossible branch"
))

# 1152 "Vuna/Compiler/Ir/Cps.vuna"
let rec v_Vuna_dCompiler_dIr_dCps_dlenOf = (fun xs -> (match xs with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> 0
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__462, dtb__463) -> (1 + (v_Vuna_dCompiler_dIr_dCps_dlenOf dtb__463))
  | _ -> failwith "DT: impossible branch"
))

# 1158 "Vuna/Compiler/Ir/Cps.vuna"
let v_Vuna_dCompiler_dIr_dCps_dfuelOf = (fun _u -> 1)

# 1135 "Vuna/Compiler/Ir/Cps.vuna"
let rec v_Vuna_dCompiler_dIr_dCps_dclauseGlobals = (fun t args -> (if ((v_Vuna_dCompiler_dIr_dCps_dfuelOf args) <= 0) then Base_dData_dList.C_Base_dData_dList_dList_Nil else (match args with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__464, dtb__465) -> (match dtb__464 with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrGlobal (dtb__466) -> (if (if ((v_Vuna_dCompiler_dIr_dCps_disClauseGlobal t) dtb__466) then (((v_Vuna_dCompiler_dIr_dCps_dclauseArityOf t) dtb__466) >= 2) else false) then (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__466, ((v_Vuna_dCompiler_dIr_dCps_dclauseGlobals t) dtb__465))) else ((v_Vuna_dCompiler_dIr_dCps_dclauseGlobals t) dtb__465))
  | _ -> ((fun nd_uscrut5 -> (match nd_uscrut5 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__467; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__468 } -> (match dtb__467 with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrGlobal (dtb__469) -> (if (if ((v_Vuna_dCompiler_dIr_dCps_disClauseGlobal t) dtb__469) then ((((v_Vuna_dCompiler_dIr_dCps_dclauseArityOf t) dtb__469) - (v_Vuna_dCompiler_dIr_dCps_dlenOf dtb__468)) >= 2) else false) then (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__469, ((v_Vuna_dCompiler_dIr_dCps_dclauseGlobals t) dtb__465))) else ((v_Vuna_dCompiler_dIr_dCps_dclauseGlobals t) dtb__465))
  | _ -> ((v_Vuna_dCompiler_dIr_dCps_dclauseGlobals t) dtb__465)
)
  | _ -> failwith "DT: impossible branch"
)) (v_Vuna_dCompiler_dIr_dCps_dflattenApp dtb__464))
)
  | _ -> failwith "DT: impossible branch"
)))

# 1161 "Vuna/Compiler/Ir/Cps.vuna"
let rec v_Vuna_dCompiler_dIr_dCps_dcollectHandlerGlobals = (fun t fuel e -> (if (fuel <= 0) then Base_dData_dList.C_Base_dData_dList_dList_Nil else (match e with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (dtb__470, dtb__471) -> ((fun p -> ((fun head -> ((fun args -> ((fun here -> ((Base_dData_dList.v_Base_dData_dList_dappend here) ((Base_dData_dList.v_Base_dData_dList_dappend (((v_Vuna_dCompiler_dIr_dCps_dcollectHandlerGlobals t) (fuel - 1)) head)) (((v_Vuna_dCompiler_dIr_dCps_dcollectHandlerGlobalsList t) (fuel - 1)) args)))) (match head with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrGlobal (dtb__472) -> (if ((v_Vuna_dCompiler_dIr_dCps_disHandleCombinator t) dtb__472) then ((v_Vuna_dCompiler_dIr_dCps_dclauseGlobals t) args) else Base_dData_dList.C_Base_dData_dList_dList_Nil)
  | _ -> Base_dData_dList.C_Base_dData_dList_dList_Nil
))) (Base_dData_dPair.v_Base_dData_dPair_dsecondOf p))) (Base_dData_dPair.v_Base_dData_dPair_dfirstOf p))) (v_Vuna_dCompiler_dIr_dCps_dflattenApp e))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCtor (dtb__473, dtb__474, dtb__475) -> (((v_Vuna_dCompiler_dIr_dCps_dcollectHandlerGlobalsList t) (fuel - 1)) dtb__475)
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRecord (dtb__476, dtb__477) -> (((v_Vuna_dCompiler_dIr_dCps_dcollectHandlerGlobalsFields t) (fuel - 1)) dtb__477)
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrProj (dtb__478, dtb__479, dtb__480) -> (((v_Vuna_dCompiler_dIr_dCps_dcollectHandlerGlobals t) (fuel - 1)) dtb__478)
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRecUpd (dtb__481, dtb__482, dtb__483) -> ((Base_dData_dList.v_Base_dData_dList_dappend (((v_Vuna_dCompiler_dIr_dCps_dcollectHandlerGlobals t) (fuel - 1)) dtb__481)) (((v_Vuna_dCompiler_dIr_dCps_dcollectHandlerGlobalsFields t) (fuel - 1)) dtb__483))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRtApp (dtb__484, dtb__485) -> (((v_Vuna_dCompiler_dIr_dCps_dcollectHandlerGlobalsList t) (fuel - 1)) dtb__485)
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCast (dtb__486, dtb__487, dtb__488) -> (((v_Vuna_dCompiler_dIr_dCps_dcollectHandlerGlobals t) (fuel - 1)) dtb__488)
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLet (dtb__489, dtb__490, dtb__491) -> ((Base_dData_dList.v_Base_dData_dList_dappend (((v_Vuna_dCompiler_dIr_dCps_dcollectHandlerGlobals t) (fuel - 1)) dtb__490)) (((v_Vuna_dCompiler_dIr_dCps_dcollectHandlerGlobals t) (fuel - 1)) dtb__491))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLam (dtb__492, dtb__493, dtb__494) -> (((v_Vuna_dCompiler_dIr_dCps_dcollectHandlerGlobals t) (fuel - 1)) dtb__494)
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrIf (dtb__495, dtb__496, dtb__497) -> ((Base_dData_dList.v_Base_dData_dList_dappend (((v_Vuna_dCompiler_dIr_dCps_dcollectHandlerGlobals t) (fuel - 1)) dtb__495)) ((Base_dData_dList.v_Base_dData_dList_dappend (((v_Vuna_dCompiler_dIr_dCps_dcollectHandlerGlobals t) (fuel - 1)) dtb__496)) (((v_Vuna_dCompiler_dIr_dCps_dcollectHandlerGlobals t) (fuel - 1)) dtb__497)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCase (dtb__498, dtb__499) -> ((Base_dData_dList.v_Base_dData_dList_dappend (((v_Vuna_dCompiler_dIr_dCps_dcollectHandlerGlobals t) (fuel - 1)) dtb__498)) (((v_Vuna_dCompiler_dIr_dCps_dcollectHandlerGlobalsAlts t) (fuel - 1)) dtb__499))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrNatCase (dtb__500, dtb__501, dtb__502, dtb__503, dtb__504) -> ((Base_dData_dList.v_Base_dData_dList_dappend (((v_Vuna_dCompiler_dIr_dCps_dcollectHandlerGlobals t) (fuel - 1)) dtb__500)) ((Base_dData_dList.v_Base_dData_dList_dappend (((v_Vuna_dCompiler_dIr_dCps_dcollectHandlerGlobalsAltM t) (fuel - 1)) dtb__502)) ((Base_dData_dList.v_Base_dData_dList_dappend (((v_Vuna_dCompiler_dIr_dCps_dcollectHandlerGlobalsAltM t) (fuel - 1)) dtb__503)) (((v_Vuna_dCompiler_dIr_dCps_dcollectHandlerGlobalsAltM t) (fuel - 1)) dtb__504))))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrConcatMany (dtb__505) -> (((v_Vuna_dCompiler_dIr_dCps_dcollectHandlerGlobalsList t) (fuel - 1)) dtb__505)
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrEffThunk (dtb__506, dtb__507, dtb__508, dtb__509, dtb__510) -> (((v_Vuna_dCompiler_dIr_dCps_dcollectHandlerGlobals t) (fuel - 1)) dtb__510)
  | _ -> Base_dData_dList.C_Base_dData_dList_dList_Nil
)))
# 1192 "Vuna/Compiler/Ir/Cps.vuna"
and v_Vuna_dCompiler_dIr_dCps_dcollectHandlerGlobalsList = (fun t fuel xs -> (if (fuel <= 0) then Base_dData_dList.C_Base_dData_dList_dList_Nil else (match xs with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__511, dtb__512) -> ((Base_dData_dList.v_Base_dData_dList_dappend (((v_Vuna_dCompiler_dIr_dCps_dcollectHandlerGlobals t) (fuel - 1)) dtb__511)) (((v_Vuna_dCompiler_dIr_dCps_dcollectHandlerGlobalsList t) (fuel - 1)) dtb__512))
  | _ -> failwith "DT: impossible branch"
)))
# 1201 "Vuna/Compiler/Ir/Cps.vuna"
and v_Vuna_dCompiler_dIr_dCps_dcollectHandlerGlobalsFields = (fun t fuel fs -> (if (fuel <= 0) then Base_dData_dList.C_Base_dData_dList_dList_Nil else (match fs with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__513, dtb__514) -> ((Base_dData_dList.v_Base_dData_dList_dappend (((v_Vuna_dCompiler_dIr_dCps_dcollectHandlerGlobals t) (fuel - 1)) (Base_dData_dPair.v_Base_dData_dPair_dsecondOf dtb__513))) (((v_Vuna_dCompiler_dIr_dCps_dcollectHandlerGlobalsFields t) (fuel - 1)) dtb__514))
  | _ -> failwith "DT: impossible branch"
)))
# 1210 "Vuna/Compiler/Ir/Cps.vuna"
and v_Vuna_dCompiler_dIr_dCps_dcollectHandlerGlobalsAlts = (fun t fuel alts -> (if (fuel <= 0) then Base_dData_dList.C_Base_dData_dList_dList_Nil else (match alts with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__515, dtb__516) -> ((Base_dData_dList.v_Base_dData_dList_dappend (((v_Vuna_dCompiler_dIr_dCps_dcollectHandlerGlobals t) (fuel - 1)) (dtb__515).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBody)) (((v_Vuna_dCompiler_dIr_dCps_dcollectHandlerGlobalsAlts t) (fuel - 1)) dtb__516))
  | _ -> failwith "DT: impossible branch"
)))
# 1219 "Vuna/Compiler/Ir/Cps.vuna"
and v_Vuna_dCompiler_dIr_dCps_dcollectHandlerGlobalsAltM = (fun t fuel m -> (if (fuel <= 0) then Base_dData_dList.C_Base_dData_dList_dList_Nil else (match m with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__517) -> (((v_Vuna_dCompiler_dIr_dCps_dcollectHandlerGlobals t) (fuel - 1)) (dtb__517).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBody)
  | _ -> failwith "DT: impossible branch"
)))

# 1234 "Vuna/Compiler/Ir/Cps.vuna"
let rec v_Vuna_dCompiler_dIr_dCps_dcollectHandleOpsDefsGo = (fun fuel t ds -> (if (fuel <= 0) then Base_dData_dList.C_Base_dData_dList_dList_Nil else (match ds with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__518, dtb__519) -> ((Base_dData_dList.v_Base_dData_dList_dappend (((v_Vuna_dCompiler_dIr_dCps_dcollectHandlerGlobals t) (fuel - 1)) (v_Vuna_dCompiler_dIr_dCps_dmBodyOf dtb__518))) (((v_Vuna_dCompiler_dIr_dCps_dcollectHandleOpsDefsGo (fuel - 1)) t) dtb__519))
  | _ -> failwith "DT: impossible branch"
)))

# 1228 "Vuna/Compiler/Ir/Cps.vuna"
let v_Vuna_dCompiler_dIr_dCps_dcollectHandleOpsDefs = (fun fuel ds -> ((fun tables -> (((v_Vuna_dCompiler_dIr_dCps_dcollectHandleOpsDefsGo fuel) tables) ds)) ((v_Vuna_dCompiler_dIr_dCps_dhandlerTables 100000) ds)))

# 1243 "Vuna/Compiler/Ir/Cps.vuna"
let rec v_Vuna_dCompiler_dIr_dCps_dmemName = (fun (mc0 : string) (mc1 : string Base_dData_dList.t_Base_dData_dList_dList) -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__520, dtb__521) -> (if (mc0 = dtb__520) then true else ((v_Vuna_dCompiler_dIr_dCps_dmemName mc0) dtb__521))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 1249 "Vuna/Compiler/Ir/Cps.vuna"
let v_Vuna_dCompiler_dIr_dCps_dscopedName = "Base.Effect.Core.handleScoped"

# 1252 "Vuna/Compiler/Ir/Cps.vuna"
let v_Vuna_dCompiler_dIr_dCps_dselfName = "Base.Effect.Core.handleSelf"

# 1255 "Vuna/Compiler/Ir/Cps.vuna"
let v_Vuna_dCompiler_dIr_dCps_dscopeName = "Base.Effect.Core.scope"

# 1258 "Vuna/Compiler/Ir/Cps.vuna"
let v_Vuna_dCompiler_dIr_dCps_dcleanupPushName = "Base.Effect.Core.pushCleanup"

# 1261 "Vuna/Compiler/Ir/Cps.vuna"
let v_Vuna_dCompiler_dIr_dCps_dcleanupPopName = "Base.Effect.Core.popCleanup"

# 1264 "Vuna/Compiler/Ir/Cps.vuna"
let rec v_Vuna_dCompiler_dIr_dCps_dmScopedCalls = (fun fuel rs e -> (if (fuel <= 0) then e else (match e with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (dtb__522, dtb__523) -> ((fun f1 -> ((fun a1 -> (match f1 with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrGlobal (dtb__524) -> (if (dtb__524 = v_Vuna_dCompiler_dIr_dCps_dscopedName) then (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp ((Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrVar (rs)), a1)) else (if (dtb__524 = v_Vuna_dCompiler_dIr_dCps_dselfName) then (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp ((Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrVar (rs)), (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp ((Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrGlobal (v_Vuna_dCompiler_dIr_dCps_dscopeName)), a1)))) else (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (f1, a1))))
  | _ -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (f1, a1))
)) (((v_Vuna_dCompiler_dIr_dCps_dmScopedCalls (fuel - 1)) rs) dtb__523))) (((v_Vuna_dCompiler_dIr_dCps_dmScopedCalls (fuel - 1)) rs) dtb__522))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRtApp (dtb__525, dtb__526) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRtApp (dtb__525, (((v_Vuna_dCompiler_dIr_dCps_dmScopedList (fuel - 1)) rs) dtb__526)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCtor (dtb__527, dtb__528, dtb__529) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCtor (dtb__527, dtb__528, (((v_Vuna_dCompiler_dIr_dCps_dmScopedList (fuel - 1)) rs) dtb__529)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRecord (dtb__530, dtb__531) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRecord (dtb__530, (((v_Vuna_dCompiler_dIr_dCps_dmScopedFields (fuel - 1)) rs) dtb__531)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrProj (dtb__532, dtb__533, dtb__534) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrProj ((((v_Vuna_dCompiler_dIr_dCps_dmScopedCalls (fuel - 1)) rs) dtb__532), dtb__533, dtb__534))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRecUpd (dtb__535, dtb__536, dtb__537) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRecUpd ((((v_Vuna_dCompiler_dIr_dCps_dmScopedCalls (fuel - 1)) rs) dtb__535), dtb__536, (((v_Vuna_dCompiler_dIr_dCps_dmScopedFields (fuel - 1)) rs) dtb__537)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCast (dtb__538, dtb__539, dtb__540) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCast (dtb__538, dtb__539, (((v_Vuna_dCompiler_dIr_dCps_dmScopedCalls (fuel - 1)) rs) dtb__540)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLet (dtb__541, dtb__542, dtb__543) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLet (dtb__541, (((v_Vuna_dCompiler_dIr_dCps_dmScopedCalls (fuel - 1)) rs) dtb__542), (((v_Vuna_dCompiler_dIr_dCps_dmScopedCalls (fuel - 1)) rs) dtb__543)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLam (dtb__544, dtb__545, dtb__546) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLam (dtb__544, dtb__545, (((v_Vuna_dCompiler_dIr_dCps_dmScopedCalls (fuel - 1)) rs) dtb__546)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrIf (dtb__547, dtb__548, dtb__549) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrIf ((((v_Vuna_dCompiler_dIr_dCps_dmScopedCalls (fuel - 1)) rs) dtb__547), (((v_Vuna_dCompiler_dIr_dCps_dmScopedCalls (fuel - 1)) rs) dtb__548), (((v_Vuna_dCompiler_dIr_dCps_dmScopedCalls (fuel - 1)) rs) dtb__549)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCase (dtb__550, dtb__551) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCase ((((v_Vuna_dCompiler_dIr_dCps_dmScopedCalls (fuel - 1)) rs) dtb__550), (((v_Vuna_dCompiler_dIr_dCps_dmScopedAlts (fuel - 1)) rs) dtb__551)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrNatCase (dtb__552, dtb__553, dtb__554, dtb__555, dtb__556) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrNatCase ((((v_Vuna_dCompiler_dIr_dCps_dmScopedCalls (fuel - 1)) rs) dtb__552), dtb__553, (((v_Vuna_dCompiler_dIr_dCps_dmScopedAltM (fuel - 1)) rs) dtb__554), (((v_Vuna_dCompiler_dIr_dCps_dmScopedAltM (fuel - 1)) rs) dtb__555), (((v_Vuna_dCompiler_dIr_dCps_dmScopedAltM (fuel - 1)) rs) dtb__556)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrConcatMany (dtb__557) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrConcatMany ((((v_Vuna_dCompiler_dIr_dCps_dmScopedList (fuel - 1)) rs) dtb__557)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrEffThunk (dtb__558, dtb__559, dtb__560, dtb__561, dtb__562) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrEffThunk (dtb__558, dtb__559, dtb__560, dtb__561, (((v_Vuna_dCompiler_dIr_dCps_dmScopedCalls (fuel - 1)) rs) dtb__562)))
  | _ -> e
)))
# 1292 "Vuna/Compiler/Ir/Cps.vuna"
and v_Vuna_dCompiler_dIr_dCps_dmScopedList = (fun fuel rs xs -> (if (fuel <= 0) then xs else (match xs with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__563, dtb__564) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ((((v_Vuna_dCompiler_dIr_dCps_dmScopedCalls (fuel - 1)) rs) dtb__563), (((v_Vuna_dCompiler_dIr_dCps_dmScopedList (fuel - 1)) rs) dtb__564)))
  | _ -> failwith "DT: impossible branch"
)))
# 1301 "Vuna/Compiler/Ir/Cps.vuna"
and v_Vuna_dCompiler_dIr_dCps_dmScopedFields = (fun fuel rs fs -> (if (fuel <= 0) then fs else (match fs with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__565, dtb__566) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Base_dData_dPair.v_Base_dData_dPair_dfirstOf dtb__565); Base_dData_dPair.f_Base_dData_dPair_dPair_second = (((v_Vuna_dCompiler_dIr_dCps_dmScopedCalls (fuel - 1)) rs) (Base_dData_dPair.v_Base_dData_dPair_dsecondOf dtb__565)) }, (((v_Vuna_dCompiler_dIr_dCps_dmScopedFields (fuel - 1)) rs) dtb__566)))
  | _ -> failwith "DT: impossible branch"
)))
# 1310 "Vuna/Compiler/Ir/Cps.vuna"
and v_Vuna_dCompiler_dIr_dCps_dmScopedAlts = (fun fuel rs alts -> (if (fuel <= 0) then alts else (match alts with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__567, dtb__568) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltCtor = (dtb__567).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltCtor; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBinders = (dtb__567).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBinders; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBody = (((v_Vuna_dCompiler_dIr_dCps_dmScopedCalls (fuel - 1)) rs) (dtb__567).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBody) }, (((v_Vuna_dCompiler_dIr_dCps_dmScopedAlts (fuel - 1)) rs) dtb__568)))
  | _ -> failwith "DT: impossible branch"
)))
# 1319 "Vuna/Compiler/Ir/Cps.vuna"
and v_Vuna_dCompiler_dIr_dCps_dmScopedAltM = (fun fuel rs m -> (if (fuel <= 0) then m else (match m with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__569) -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ({ Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltCtor = (dtb__569).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltCtor; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBinders = (dtb__569).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBinders; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBody = (((v_Vuna_dCompiler_dIr_dCps_dmScopedCalls (fuel - 1)) rs) (dtb__569).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBody) }))
  | _ -> failwith "DT: impossible branch"
)))

# 882 "Vuna/Compiler/Ir/Cps.vuna"
let rec v_Vuna_dCompiler_dIr_dCps_dmHandlerLam = (fun fuel bs body -> (match (v_Vuna_dCompiler_dIr_dCps_dmResumption bs) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLam (bs, Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, ((v_Vuna_dCompiler_dIr_dCps_dmHandlers (fuel - 1)) body)))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__570) -> ((fun kd -> ((fun rs -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLam (((Base_dData_dList.v_Base_dData_dList_dappend bs) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (kd, (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (rs, Base_dData_dList.C_Base_dData_dList_dList_Nil))))), Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, (((v_Vuna_dCompiler_dIr_dCps_dmScopedCalls (fuel - 1)) rs) ((((v_Vuna_dCompiler_dIr_dCps_dmCps (fuel - 1)) dtb__570) (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrVar (kd))) body))))) (v_Vuna_dCompiler_dIr_dCps_dmFreshR fuel))) (v_Vuna_dCompiler_dIr_dCps_dmFreshK fuel))
  | _ -> failwith "DT: impossible branch"
))
# 895 "Vuna/Compiler/Ir/Cps.vuna"
and v_Vuna_dCompiler_dIr_dCps_dmListH = (fun fuel xs -> (if (fuel <= 0) then xs else (match xs with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__571, dtb__572) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (((v_Vuna_dCompiler_dIr_dCps_dmHandlers (fuel - 1)) dtb__571), ((v_Vuna_dCompiler_dIr_dCps_dmListH (fuel - 1)) dtb__572)))
  | _ -> failwith "DT: impossible branch"
)))
# 904 "Vuna/Compiler/Ir/Cps.vuna"
and v_Vuna_dCompiler_dIr_dCps_dmFieldsH = (fun fuel fs -> (if (fuel <= 0) then fs else (match fs with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__573, dtb__574) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Base_dData_dPair.v_Base_dData_dPair_dfirstOf dtb__573); Base_dData_dPair.f_Base_dData_dPair_dPair_second = ((v_Vuna_dCompiler_dIr_dCps_dmHandlers (fuel - 1)) (Base_dData_dPair.v_Base_dData_dPair_dsecondOf dtb__573)) }, ((v_Vuna_dCompiler_dIr_dCps_dmFieldsH (fuel - 1)) dtb__574)))
  | _ -> failwith "DT: impossible branch"
)))
# 913 "Vuna/Compiler/Ir/Cps.vuna"
and v_Vuna_dCompiler_dIr_dCps_dmHandlers = (fun fuel e -> (if (fuel <= 0) then e else (match e with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLam (dtb__575, dtb__576, dtb__577) -> (((v_Vuna_dCompiler_dIr_dCps_dmHandlerLam (fuel - 1)) dtb__575) dtb__577)
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCtor (dtb__578, dtb__579, dtb__580) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCtor (dtb__578, dtb__579, ((v_Vuna_dCompiler_dIr_dCps_dmListH (fuel - 1)) dtb__580)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRecord (dtb__581, dtb__582) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRecord (dtb__581, ((v_Vuna_dCompiler_dIr_dCps_dmFieldsH (fuel - 1)) dtb__582)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrProj (dtb__583, dtb__584, dtb__585) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrProj (((v_Vuna_dCompiler_dIr_dCps_dmHandlers (fuel - 1)) dtb__583), dtb__584, dtb__585))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRecUpd (dtb__586, dtb__587, dtb__588) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRecUpd (((v_Vuna_dCompiler_dIr_dCps_dmHandlers (fuel - 1)) dtb__586), dtb__587, ((v_Vuna_dCompiler_dIr_dCps_dmFieldsH (fuel - 1)) dtb__588)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRtApp (dtb__589, dtb__590) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRtApp (dtb__589, ((v_Vuna_dCompiler_dIr_dCps_dmListH (fuel - 1)) dtb__590)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCast (dtb__591, dtb__592, dtb__593) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCast (dtb__591, dtb__592, ((v_Vuna_dCompiler_dIr_dCps_dmHandlers (fuel - 1)) dtb__593)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLet (dtb__594, dtb__595, dtb__596) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLet (dtb__594, ((v_Vuna_dCompiler_dIr_dCps_dmHandlers (fuel - 1)) dtb__595), ((v_Vuna_dCompiler_dIr_dCps_dmHandlers (fuel - 1)) dtb__596)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (dtb__597, dtb__598) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (((v_Vuna_dCompiler_dIr_dCps_dmHandlers (fuel - 1)) dtb__597), ((v_Vuna_dCompiler_dIr_dCps_dmHandlers (fuel - 1)) dtb__598)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrIf (dtb__599, dtb__600, dtb__601) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrIf (((v_Vuna_dCompiler_dIr_dCps_dmHandlers (fuel - 1)) dtb__599), ((v_Vuna_dCompiler_dIr_dCps_dmHandlers (fuel - 1)) dtb__600), ((v_Vuna_dCompiler_dIr_dCps_dmHandlers (fuel - 1)) dtb__601)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCase (dtb__602, dtb__603) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCase (((v_Vuna_dCompiler_dIr_dCps_dmHandlers (fuel - 1)) dtb__602), ((v_Vuna_dCompiler_dIr_dCps_dmHandlersAlts (fuel - 1)) dtb__603)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrNatCase (dtb__604, dtb__605, dtb__606, dtb__607, dtb__608) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrNatCase (((v_Vuna_dCompiler_dIr_dCps_dmHandlers (fuel - 1)) dtb__604), dtb__605, ((v_Vuna_dCompiler_dIr_dCps_dmHandlersAltM (fuel - 1)) dtb__606), ((v_Vuna_dCompiler_dIr_dCps_dmHandlersAltM (fuel - 1)) dtb__607), ((v_Vuna_dCompiler_dIr_dCps_dmHandlersAltM (fuel - 1)) dtb__608)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrConcatMany (dtb__609) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrConcatMany (((v_Vuna_dCompiler_dIr_dCps_dmListH (fuel - 1)) dtb__609)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrEffThunk (dtb__610, dtb__611, dtb__612, dtb__613, dtb__614) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrEffThunk (dtb__610, dtb__611, dtb__612, dtb__613, ((v_Vuna_dCompiler_dIr_dCps_dmHandlers (fuel - 1)) dtb__614)))
  | _ -> e
)))
# 935 "Vuna/Compiler/Ir/Cps.vuna"
and v_Vuna_dCompiler_dIr_dCps_dmHandlersAlts = (fun fuel alts -> (if (fuel <= 0) then alts else (match alts with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__615, dtb__616) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltCtor = (dtb__615).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltCtor; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBinders = (dtb__615).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBinders; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBody = ((v_Vuna_dCompiler_dIr_dCps_dmHandlers (fuel - 1)) (dtb__615).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBody) }, ((v_Vuna_dCompiler_dIr_dCps_dmHandlersAlts (fuel - 1)) dtb__616)))
  | _ -> failwith "DT: impossible branch"
)))
# 944 "Vuna/Compiler/Ir/Cps.vuna"
and v_Vuna_dCompiler_dIr_dCps_dmHandlersAltM = (fun fuel m -> (if (fuel <= 0) then m else (match m with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__617) -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ({ Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltCtor = (dtb__617).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltCtor; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBinders = (dtb__617).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBinders; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBody = ((v_Vuna_dCompiler_dIr_dCps_dmHandlers (fuel - 1)) (dtb__617).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBody) }))
  | _ -> failwith "DT: impossible branch"
)))

# 1328 "Vuna/Compiler/Ir/Cps.vuna"
let rec v_Vuna_dCompiler_dIr_dCps_dlastBinderOf = (fun bs -> (match bs with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__618, dtb__619) -> (match dtb__619 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__618))
  | _ -> (v_Vuna_dCompiler_dIr_dCps_dlastBinderOf dtb__619)
)
  | _ -> failwith "DT: impossible branch"
))

# 1355 "Vuna/Compiler/Ir/Cps.vuna"
let v_Vuna_dCompiler_dIr_dCps_dmHandlerFun = (fun fuel body -> (if (fuel <= 0) then body else (match body with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLam (dtb__620, dtb__621, dtb__622) -> ((fun nd_uscrut5 -> (match nd_uscrut5 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__623, dtb__624) -> (match dtb__624 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__625, dtb__626) -> ((fun kd -> ((fun rs -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLam (((Base_dData_dList.v_Base_dData_dList_dappend dtb__620) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (kd, (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (rs, Base_dData_dList.C_Base_dData_dList_dList_Nil))))), Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, (((v_Vuna_dCompiler_dIr_dCps_dmScopedCalls (fuel - 1)) rs) ((((v_Vuna_dCompiler_dIr_dCps_dmCps (fuel - 1)) dtb__625) (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrVar (kd))) dtb__622))))) (v_Vuna_dCompiler_dIr_dCps_dmFreshR fuel))) (v_Vuna_dCompiler_dIr_dCps_dmFreshK fuel))
  | _ -> body
)
  | _ -> body
)) (v_Vuna_dCompiler_dIr_dCps_druntimeBinders dtb__620))
  | _ -> body
)))

# 1407 "Vuna/Compiler/Ir/Cps.vuna"
let v_Vuna_dCompiler_dIr_dCps_disContBinder = (fun b -> ((fun n -> (if ((Base_dData_dString.v_Base_dData_dString_dstartsWith "__cpsK") n) then true else ((Base_dData_dString.v_Base_dData_dString_dstartsWith "__mchK") n))) (v_Vuna_dCompiler_dIr_dCps_dmBNameText (b).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrBinder_irBinderName)))

# 1413 "Vuna/Compiler/Ir/Cps.vuna"
let rec v_Vuna_dCompiler_dIr_dCps_dmApplys = (fun fuel e -> (if (fuel <= 0) then e else (match e with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (dtb__627, dtb__628) -> (match dtb__627 with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrVar (dtb__629) -> (if (v_Vuna_dCompiler_dIr_dCps_disContBinder dtb__629) then (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRtApp (v_Vuna_dCompiler_dIr_dCps_dirMApplyName, (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ((Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrVar (dtb__629)), (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (((v_Vuna_dCompiler_dIr_dCps_dmApplys (fuel - 1)) dtb__628), Base_dData_dList.C_Base_dData_dList_dList_Nil)))))) else (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (((v_Vuna_dCompiler_dIr_dCps_dmApplys (fuel - 1)) dtb__627), ((v_Vuna_dCompiler_dIr_dCps_dmApplys (fuel - 1)) dtb__628))))
  | _ -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (((v_Vuna_dCompiler_dIr_dCps_dmApplys (fuel - 1)) dtb__627), ((v_Vuna_dCompiler_dIr_dCps_dmApplys (fuel - 1)) dtb__628)))
)
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRtApp (dtb__630, dtb__631) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRtApp (dtb__630, ((v_Vuna_dCompiler_dIr_dCps_dmApplysList (fuel - 1)) dtb__631)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCtor (dtb__632, dtb__633, dtb__634) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCtor (dtb__632, dtb__633, ((v_Vuna_dCompiler_dIr_dCps_dmApplysList (fuel - 1)) dtb__634)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRecord (dtb__635, dtb__636) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRecord (dtb__635, ((v_Vuna_dCompiler_dIr_dCps_dmApplysFields (fuel - 1)) dtb__636)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrProj (dtb__637, dtb__638, dtb__639) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrProj (((v_Vuna_dCompiler_dIr_dCps_dmApplys (fuel - 1)) dtb__637), dtb__638, dtb__639))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRecUpd (dtb__640, dtb__641, dtb__642) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRecUpd (((v_Vuna_dCompiler_dIr_dCps_dmApplys (fuel - 1)) dtb__640), dtb__641, ((v_Vuna_dCompiler_dIr_dCps_dmApplysFields (fuel - 1)) dtb__642)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCast (dtb__643, dtb__644, dtb__645) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCast (dtb__643, dtb__644, ((v_Vuna_dCompiler_dIr_dCps_dmApplys (fuel - 1)) dtb__645)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLet (dtb__646, dtb__647, dtb__648) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLet (dtb__646, ((v_Vuna_dCompiler_dIr_dCps_dmApplys (fuel - 1)) dtb__647), ((v_Vuna_dCompiler_dIr_dCps_dmApplys (fuel - 1)) dtb__648)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLam (dtb__649, dtb__650, dtb__651) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLam (dtb__649, dtb__650, ((v_Vuna_dCompiler_dIr_dCps_dmApplys (fuel - 1)) dtb__651)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrIf (dtb__652, dtb__653, dtb__654) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrIf (((v_Vuna_dCompiler_dIr_dCps_dmApplys (fuel - 1)) dtb__652), ((v_Vuna_dCompiler_dIr_dCps_dmApplys (fuel - 1)) dtb__653), ((v_Vuna_dCompiler_dIr_dCps_dmApplys (fuel - 1)) dtb__654)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCase (dtb__655, dtb__656) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCase (((v_Vuna_dCompiler_dIr_dCps_dmApplys (fuel - 1)) dtb__655), ((v_Vuna_dCompiler_dIr_dCps_dmApplysAlts (fuel - 1)) dtb__656)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrNatCase (dtb__657, dtb__658, dtb__659, dtb__660, dtb__661) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrNatCase (((v_Vuna_dCompiler_dIr_dCps_dmApplys (fuel - 1)) dtb__657), dtb__658, ((v_Vuna_dCompiler_dIr_dCps_dmApplysAltM (fuel - 1)) dtb__659), ((v_Vuna_dCompiler_dIr_dCps_dmApplysAltM (fuel - 1)) dtb__660), ((v_Vuna_dCompiler_dIr_dCps_dmApplysAltM (fuel - 1)) dtb__661)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrConcatMany (dtb__662) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrConcatMany (((v_Vuna_dCompiler_dIr_dCps_dmApplysList (fuel - 1)) dtb__662)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrEffThunk (dtb__663, dtb__664, dtb__665, dtb__666, dtb__667) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrEffThunk (dtb__663, dtb__664, dtb__665, dtb__666, ((v_Vuna_dCompiler_dIr_dCps_dmApplys (fuel - 1)) dtb__667)))
  | _ -> e
)))
# 1438 "Vuna/Compiler/Ir/Cps.vuna"
and v_Vuna_dCompiler_dIr_dCps_dmApplysList = (fun fuel xs -> (if (fuel <= 0) then xs else (match xs with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__668, dtb__669) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (((v_Vuna_dCompiler_dIr_dCps_dmApplys (fuel - 1)) dtb__668), ((v_Vuna_dCompiler_dIr_dCps_dmApplysList (fuel - 1)) dtb__669)))
  | _ -> failwith "DT: impossible branch"
)))
# 1447 "Vuna/Compiler/Ir/Cps.vuna"
and v_Vuna_dCompiler_dIr_dCps_dmApplysFields = (fun fuel fs -> (if (fuel <= 0) then fs else (match fs with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__670, dtb__671) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Base_dData_dPair.v_Base_dData_dPair_dfirstOf dtb__670); Base_dData_dPair.f_Base_dData_dPair_dPair_second = ((v_Vuna_dCompiler_dIr_dCps_dmApplys (fuel - 1)) (Base_dData_dPair.v_Base_dData_dPair_dsecondOf dtb__670)) }, ((v_Vuna_dCompiler_dIr_dCps_dmApplysFields (fuel - 1)) dtb__671)))
  | _ -> failwith "DT: impossible branch"
)))
# 1456 "Vuna/Compiler/Ir/Cps.vuna"
and v_Vuna_dCompiler_dIr_dCps_dmApplysAlts = (fun fuel alts -> (if (fuel <= 0) then alts else (match alts with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__672, dtb__673) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltCtor = (dtb__672).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltCtor; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBinders = (dtb__672).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBinders; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBody = ((v_Vuna_dCompiler_dIr_dCps_dmApplys (fuel - 1)) (dtb__672).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBody) }, ((v_Vuna_dCompiler_dIr_dCps_dmApplysAlts (fuel - 1)) dtb__673)))
  | _ -> failwith "DT: impossible branch"
)))
# 1465 "Vuna/Compiler/Ir/Cps.vuna"
and v_Vuna_dCompiler_dIr_dCps_dmApplysAltM = (fun fuel m -> (if (fuel <= 0) then m else (match m with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__674) -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ({ Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltCtor = (dtb__674).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltCtor; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBinders = (dtb__674).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBinders; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBody = ((v_Vuna_dCompiler_dIr_dCps_dmApplys (fuel - 1)) (dtb__674).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBody) }))
  | _ -> failwith "DT: impossible branch"
)))

# 1480 "Vuna/Compiler/Ir/Cps.vuna"
let rec v_Vuna_dCompiler_dIr_dCps_dmMarked = (fun fuel e -> (if (fuel <= 0) then e else ((fun nd_uscrut2 -> (match nd_uscrut2 with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrEffThunk (dtb__675, dtb__676, dtb__677, dtb__678, dtb__679) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrEffThunk (dtb__675, dtb__676, dtb__677, dtb__678, ((v_Vuna_dCompiler_dIr_dCps_dmMarked (fuel - 1)) dtb__679)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrConcatMany (dtb__680) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrConcatMany (((v_Vuna_dCompiler_dIr_dCps_dmMarkedList (fuel - 1)) dtb__680)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrNatCase (dtb__681, dtb__682, dtb__683, dtb__684, dtb__685) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrNatCase (((v_Vuna_dCompiler_dIr_dCps_dmMarked (fuel - 1)) dtb__681), dtb__682, ((v_Vuna_dCompiler_dIr_dCps_dmMarkedAltM (fuel - 1)) dtb__683), ((v_Vuna_dCompiler_dIr_dCps_dmMarkedAltM (fuel - 1)) dtb__684), ((v_Vuna_dCompiler_dIr_dCps_dmMarkedAltM (fuel - 1)) dtb__685)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCase (dtb__686, dtb__687) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCase (((v_Vuna_dCompiler_dIr_dCps_dmMarked (fuel - 1)) dtb__686), ((v_Vuna_dCompiler_dIr_dCps_dmMarkedAlts (fuel - 1)) dtb__687)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrIf (dtb__688, dtb__689, dtb__690) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrIf (((v_Vuna_dCompiler_dIr_dCps_dmMarked (fuel - 1)) dtb__688), ((v_Vuna_dCompiler_dIr_dCps_dmMarked (fuel - 1)) dtb__689), ((v_Vuna_dCompiler_dIr_dCps_dmMarked (fuel - 1)) dtb__690)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (dtb__691, dtb__692) -> (match dtb__691 with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (dtb__693, dtb__694) -> (match dtb__693 with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRt (dtb__695) -> (if (dtb__695 = "@ir@m@self") then (match dtb__692 with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLam (dtb__696, dtb__697, dtb__698) -> (match dtb__696 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__699, dtb__700) -> (match dtb__700 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp ((Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRt (v_Vuna_dCompiler_dIr_dCps_dirMRunName)), (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp ((Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp ((Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRt ("@ir@m@self")), ((v_Vuna_dCompiler_dIr_dCps_dmMarked (fuel - 1)) dtb__694))), v_Vuna_dCompiler_dIr_dCps_dmDoneCont))))
  | _ -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (((v_Vuna_dCompiler_dIr_dCps_dmMarked (fuel - 1)) dtb__691), ((v_Vuna_dCompiler_dIr_dCps_dmMarked (fuel - 1)) dtb__692)))
)
  | _ -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (((v_Vuna_dCompiler_dIr_dCps_dmMarked (fuel - 1)) dtb__691), ((v_Vuna_dCompiler_dIr_dCps_dmMarked (fuel - 1)) dtb__692)))
)
  | _ -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (((v_Vuna_dCompiler_dIr_dCps_dmMarked (fuel - 1)) dtb__691), ((v_Vuna_dCompiler_dIr_dCps_dmMarked (fuel - 1)) dtb__692)))
) else (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (((v_Vuna_dCompiler_dIr_dCps_dmMarked (fuel - 1)) dtb__691), ((v_Vuna_dCompiler_dIr_dCps_dmMarked (fuel - 1)) dtb__692))))
  | _ -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (((v_Vuna_dCompiler_dIr_dCps_dmMarked (fuel - 1)) dtb__691), ((v_Vuna_dCompiler_dIr_dCps_dmMarked (fuel - 1)) dtb__692)))
)
  | _ -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (((v_Vuna_dCompiler_dIr_dCps_dmMarked (fuel - 1)) dtb__691), ((v_Vuna_dCompiler_dIr_dCps_dmMarked (fuel - 1)) dtb__692)))
)
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLet (dtb__701, dtb__702, dtb__703) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLet (dtb__701, ((v_Vuna_dCompiler_dIr_dCps_dmMarked (fuel - 1)) dtb__702), ((v_Vuna_dCompiler_dIr_dCps_dmMarked (fuel - 1)) dtb__703)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCast (dtb__704, dtb__705, dtb__706) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCast (dtb__704, dtb__705, ((v_Vuna_dCompiler_dIr_dCps_dmMarked (fuel - 1)) dtb__706)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRecUpd (dtb__707, dtb__708, dtb__709) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRecUpd (((v_Vuna_dCompiler_dIr_dCps_dmMarked (fuel - 1)) dtb__707), dtb__708, ((v_Vuna_dCompiler_dIr_dCps_dmMarkedFields (fuel - 1)) dtb__709)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrProj (dtb__710, dtb__711, dtb__712) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrProj (((v_Vuna_dCompiler_dIr_dCps_dmMarked (fuel - 1)) dtb__710), dtb__711, dtb__712))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRecord (dtb__713, dtb__714) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRecord (dtb__713, ((v_Vuna_dCompiler_dIr_dCps_dmMarkedFields (fuel - 1)) dtb__714)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCtor (dtb__715, dtb__716, dtb__717) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCtor (dtb__715, dtb__716, ((v_Vuna_dCompiler_dIr_dCps_dmMarkedList (fuel - 1)) dtb__717)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRtApp (dtb__718, dtb__719) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRtApp (dtb__718, ((v_Vuna_dCompiler_dIr_dCps_dmMarkedList (fuel - 1)) dtb__719)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLam (dtb__720, dtb__721, dtb__722) -> (if (if (v_Vuna_dCompiler_dIr_dCps_disEffContLambda dtb__721) then (Base_dData_dBool.v_Base_dData_dBool_dnot (v_Vuna_dCompiler_dIr_dCps_disEffThunkBody dtb__722)) else false) then (((((v_Vuna_dCompiler_dIr_dCps_dmEffContLambda (fuel - 1)) v_Vuna_dCompiler_dIr_dCps_dmNoResumption) dtb__720) dtb__721) dtb__722) else (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLam (dtb__720, dtb__721, ((v_Vuna_dCompiler_dIr_dCps_dmMarked (fuel - 1)) dtb__722))))
  | _ -> e
)) e)))
# 1504 "Vuna/Compiler/Ir/Cps.vuna"
and v_Vuna_dCompiler_dIr_dCps_dmMarkedList = (fun fuel xs -> (if (fuel <= 0) then xs else (match xs with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__723, dtb__724) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (((v_Vuna_dCompiler_dIr_dCps_dmMarked (fuel - 1)) dtb__723), ((v_Vuna_dCompiler_dIr_dCps_dmMarkedList (fuel - 1)) dtb__724)))
  | _ -> failwith "DT: impossible branch"
)))
# 1513 "Vuna/Compiler/Ir/Cps.vuna"
and v_Vuna_dCompiler_dIr_dCps_dmMarkedFields = (fun fuel fs -> (if (fuel <= 0) then fs else (match fs with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__725, dtb__726) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Base_dData_dPair.v_Base_dData_dPair_dfirstOf dtb__725); Base_dData_dPair.f_Base_dData_dPair_dPair_second = ((v_Vuna_dCompiler_dIr_dCps_dmMarked (fuel - 1)) (Base_dData_dPair.v_Base_dData_dPair_dsecondOf dtb__725)) }, ((v_Vuna_dCompiler_dIr_dCps_dmMarkedFields (fuel - 1)) dtb__726)))
  | _ -> failwith "DT: impossible branch"
)))
# 1522 "Vuna/Compiler/Ir/Cps.vuna"
and v_Vuna_dCompiler_dIr_dCps_dmMarkedAlts = (fun fuel alts -> (if (fuel <= 0) then alts else (match alts with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__727, dtb__728) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltCtor = (dtb__727).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltCtor; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBinders = (dtb__727).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBinders; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBody = ((v_Vuna_dCompiler_dIr_dCps_dmMarked (fuel - 1)) (dtb__727).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBody) }, ((v_Vuna_dCompiler_dIr_dCps_dmMarkedAlts (fuel - 1)) dtb__728)))
  | _ -> failwith "DT: impossible branch"
)))
# 1531 "Vuna/Compiler/Ir/Cps.vuna"
and v_Vuna_dCompiler_dIr_dCps_dmMarkedAltM = (fun fuel m -> (if (fuel <= 0) then m else (match m with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__729) -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ({ Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltCtor = (dtb__729).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltCtor; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBinders = (dtb__729).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBinders; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBody = ((v_Vuna_dCompiler_dIr_dCps_dmMarked (fuel - 1)) (dtb__729).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBody) }))
  | _ -> failwith "DT: impossible branch"
)))

# 1540 "Vuna/Compiler/Ir/Cps.vuna"
let v_Vuna_dCompiler_dIr_dCps_dmMarkedDef = (fun (mc0 : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrDef) -> (match mc0 with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrDef_IrDef (dtb__730, dtb__731, dtb__732, dtb__733, dtb__734, dtb__735, dtb__736, dtb__737) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrDef_IrDef (dtb__730, dtb__731, dtb__732, Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, ((v_Vuna_dCompiler_dIr_dCps_dmMarked v_Vuna_dCompiler_dIr_dCps_dstartFuel) dtb__734), dtb__735, dtb__736, dtb__737))
  | _ -> mc0
))

# 1545 "Vuna/Compiler/Ir/Cps.vuna"
let v_Vuna_dCompiler_dIr_dCps_dmApplysDef = (fun (mc0 : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrDef) -> (match mc0 with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrDef_IrDef (dtb__738, dtb__739, dtb__740, dtb__741, dtb__742, dtb__743, dtb__744, dtb__745) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrDef_IrDef (dtb__738, dtb__739, dtb__740, Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, ((v_Vuna_dCompiler_dIr_dCps_dmApplys v_Vuna_dCompiler_dIr_dCps_dstartFuel) dtb__742), dtb__743, dtb__744, dtb__745))
  | _ -> mc0
))

# 1555 "Vuna/Compiler/Ir/Cps.vuna"
let v_Vuna_dCompiler_dIr_dCps_dmachineCtl = "Base.Effect.Core.Control"

# 1339 "Vuna/Compiler/Ir/Cps.vuna"
let v_Vuna_dCompiler_dIr_dCps_dmCleanupDef = (fun n body -> (if (n = v_Vuna_dCompiler_dIr_dCps_dcleanupPushName) then (match body with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLam (dtb__746, dtb__747, dtb__748) -> (match (v_Vuna_dCompiler_dIr_dCps_dlastBinderOf dtb__746) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__749) -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ((Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLam (dtb__746, Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCtor (Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirEffTypeName, Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirEffMkCtor, (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ((Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLam ((Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ((v_Vuna_dCompiler_dIr_dCps_dmkBinder "__mCleanU"), (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ((v_Vuna_dCompiler_dIr_dCps_dmkBinder "__mCleanK"), Base_dData_dList.C_Base_dData_dList_dList_Nil)))), Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCtor (v_Vuna_dCompiler_dIr_dCps_dmachineCtl, (v_Vuna_dCompiler_dIr_dCps_dmachineCtl ^ ".MkPushCleanup"), (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ((Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCtor ("Base.Effect.Core.Cleanup", "Base.Effect.Core.Cleanup.MkCleanup", (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ((Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrVar (dtb__749)), Base_dData_dList.C_Base_dData_dList_dList_Nil)))), (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ((Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrVar ((v_Vuna_dCompiler_dIr_dCps_dmkBinder "__mCleanK"))), Base_dData_dList.C_Base_dData_dList_dList_Nil)))))))), Base_dData_dList.C_Base_dData_dList_dList_Nil))))))))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
) else (if (n = v_Vuna_dCompiler_dIr_dCps_dcleanupPopName) then (match body with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLam (dtb__750, dtb__751, dtb__752) -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ((Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLam (dtb__750, Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCtor (Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirEffTypeName, Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirEffMkCtor, (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ((Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLam ((Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ((v_Vuna_dCompiler_dIr_dCps_dmkBinder "__mCleanU"), (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ((v_Vuna_dCompiler_dIr_dCps_dmkBinder "__mCleanK"), Base_dData_dList.C_Base_dData_dList_dList_Nil)))), Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCtor (v_Vuna_dCompiler_dIr_dCps_dmachineCtl, (v_Vuna_dCompiler_dIr_dCps_dmachineCtl ^ ".MkPopCleanup"), (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ((Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrVar ((v_Vuna_dCompiler_dIr_dCps_dmkBinder "__mCleanK"))), Base_dData_dList.C_Base_dData_dList_dList_Nil)))))), Base_dData_dList.C_Base_dData_dList_dList_Nil))))))))
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
) else Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing)))

# 1371 "Vuna/Compiler/Ir/Cps.vuna"
let v_Vuna_dCompiler_dIr_dCps_dmDef = (fun handlers fuel d -> (if (fuel <= 0) then d else (match d with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrDef_IrExternDef (dtb__753, dtb__754, dtb__755, dtb__756) -> d
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrDef_IrDef (dtb__757, dtb__758, dtb__759, dtb__760, dtb__761, dtb__762, dtb__763, dtb__764) -> ((fun marked -> ((fun h -> ((fun ar2 -> ((fun b -> (if (if (if (dtb__757 = v_Vuna_dCompiler_dIr_dCps_drunPureName) then true else (dtb__757 = v_Vuna_dCompiler_dIr_dCps_drunEffName)) then true else (dtb__757 = v_Vuna_dCompiler_dIr_dCps_drunMainName)) then (match ((v_Vuna_dCompiler_dIr_dCps_dmTrampolineBody dtb__757) b) with
  | Base_dData_dResult.C_Base_dData_dResult_dResult_Ok (dtb__765) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrDef_IrDef (dtb__757, ar2, dtb__759, Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, dtb__765, dtb__762, dtb__763, dtb__764))
  | Base_dData_dResult.C_Base_dData_dResult_dResult_Err (dtb__766) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrDef_IrDef (dtb__757, ar2, dtb__759, Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, b, dtb__762, dtb__763, dtb__764))
  | _ -> failwith "DT: impossible branch"
) else (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrDef_IrDef (dtb__757, ar2, dtb__759, Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, b, dtb__762, dtb__763, dtb__764)))) ((v_Vuna_dCompiler_dIr_dCps_dmSyms (fuel - 1)) ((v_Vuna_dCompiler_dIr_dCps_dmHandlers (fuel - 1)) h)))) (if marked then (dtb__758 + 2) else dtb__758))) (match ((v_Vuna_dCompiler_dIr_dCps_dmCleanupDef dtb__757) dtb__761) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__767) -> dtb__767
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (if marked then ((v_Vuna_dCompiler_dIr_dCps_dmHandlerFun (fuel - 1)) dtb__761) else dtb__761)
  | _ -> failwith "DT: impossible branch"
))) ((v_Vuna_dCompiler_dIr_dCps_dmemName dtb__757) handlers))
  | _ -> failwith "DT: impossible branch"
)))

# 1394 "Vuna/Compiler/Ir/Cps.vuna"
let rec v_Vuna_dCompiler_dIr_dCps_dmDefs = (fun handlers fuel ds -> (if (fuel <= 0) then ds else (match ds with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__768, dtb__769) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ((((v_Vuna_dCompiler_dIr_dCps_dmDef handlers) (fuel - 1)) dtb__768), (((v_Vuna_dCompiler_dIr_dCps_dmDefs handlers) (fuel - 1)) dtb__769)))
  | _ -> failwith "DT: impossible branch"
)))

# 1558 "Vuna/Compiler/Ir/Cps.vuna"
let v_Vuna_dCompiler_dIr_dCps_dmachineCtorOf = (fun sym -> (if (sym = v_Vuna_dCompiler_dIr_dCps_dirMDoneName) then (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ("MkDone")) else (if (sym = v_Vuna_dCompiler_dIr_dCps_dirMApplyName) then (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ("MkApply")) else (if (sym = v_Vuna_dCompiler_dIr_dCps_dirMPerformName) then (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ("MkPerform")) else (if (sym = v_Vuna_dCompiler_dIr_dCps_dirMHandleName) then (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ("MkHandle")) else (if (sym = v_Vuna_dCompiler_dIr_dCps_dirMSelfName) then (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ("MkSelf")) else Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing))))))

# 1572 "Vuna/Compiler/Ir/Cps.vuna"
let v_Vuna_dCompiler_dIr_dCps_dmachineArgsOf = (fun sym args -> (if (sym = v_Vuna_dCompiler_dIr_dCps_dirMHandleName) then ((fun nd_uscrut2 -> (match nd_uscrut2 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__770, dtb__771) -> (match dtb__771 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__772, dtb__773) -> (match dtb__773 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__774, dtb__775) -> (match dtb__775 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__776, dtb__777) -> (match dtb__777 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__778, dtb__779) -> (match dtb__779 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__780, dtb__781) -> ((Base_dData_dList.v_Base_dData_dList_dappend (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__770, (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__772, (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__774, (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__776, (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__778, Base_dData_dList.C_Base_dData_dList_dList_Nil))))))))))) dtb__781)
  | _ -> args
)
  | _ -> args
)
  | _ -> args
)
  | _ -> args
)
  | _ -> args
)
  | _ -> args
)) args) else args))

# 1581 "Vuna/Compiler/Ir/Cps.vuna"
let rec v_Vuna_dCompiler_dIr_dCps_dmSteps = (fun fuel e -> (if (fuel <= 0) then e else (match e with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRtApp (dtb__782, dtb__783) -> (match (v_Vuna_dCompiler_dIr_dCps_dmachineCtorOf dtb__782) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__784) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCtor (v_Vuna_dCompiler_dIr_dCps_dmachineCtl, (String.concat "" [v_Vuna_dCompiler_dIr_dCps_dmachineCtl; "."; dtb__784]), ((v_Vuna_dCompiler_dIr_dCps_dmStepsList (fuel - 1)) ((v_Vuna_dCompiler_dIr_dCps_dmachineArgsOf dtb__782) dtb__783))))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (if (dtb__782 = v_Vuna_dCompiler_dIr_dCps_dirMRunName) then ((fun nd_uscrut5 -> (match nd_uscrut5 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__785, dtb__786) -> (match dtb__786 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp ((Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrGlobal ("Base.Effect.Core.machineRun")), ((v_Vuna_dCompiler_dIr_dCps_dmSteps (fuel - 1)) dtb__785)))
  | _ -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRtApp (dtb__782, ((v_Vuna_dCompiler_dIr_dCps_dmStepsList (fuel - 1)) dtb__783)))
)
  | _ -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRtApp (dtb__782, ((v_Vuna_dCompiler_dIr_dCps_dmStepsList (fuel - 1)) dtb__783)))
)) dtb__783) else (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRtApp (dtb__782, ((v_Vuna_dCompiler_dIr_dCps_dmStepsList (fuel - 1)) dtb__783))))
  | _ -> failwith "DT: impossible branch"
)
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (dtb__787, dtb__788) -> ((fun p -> ((fun head -> ((fun args -> (match head with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRt (dtb__789) -> (match (v_Vuna_dCompiler_dIr_dCps_dmachineCtorOf dtb__789) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__790) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCtor (v_Vuna_dCompiler_dIr_dCps_dmachineCtl, (String.concat "" [v_Vuna_dCompiler_dIr_dCps_dmachineCtl; "."; dtb__790]), ((v_Vuna_dCompiler_dIr_dCps_dmStepsList (fuel - 1)) ((v_Vuna_dCompiler_dIr_dCps_dmachineArgsOf dtb__789) args))))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (if (dtb__789 = v_Vuna_dCompiler_dIr_dCps_dirMRunName) then ((fun nd_uscrut9 -> (match nd_uscrut9 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__791, dtb__792) -> (match dtb__792 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp ((Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrGlobal ("Base.Effect.Core.machineRun")), ((v_Vuna_dCompiler_dIr_dCps_dmSteps (fuel - 1)) dtb__791)))
  | _ -> (((v_Vuna_dCompiler_dIr_dCps_dfoldAppMap (fuel - 1)) ((v_Vuna_dCompiler_dIr_dCps_dmSteps (fuel - 1)) head)) args)
)
  | _ -> (((v_Vuna_dCompiler_dIr_dCps_dfoldAppMap (fuel - 1)) ((v_Vuna_dCompiler_dIr_dCps_dmSteps (fuel - 1)) head)) args)
)) args) else (((v_Vuna_dCompiler_dIr_dCps_dfoldAppMap (fuel - 1)) ((v_Vuna_dCompiler_dIr_dCps_dmSteps (fuel - 1)) head)) args))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> (((v_Vuna_dCompiler_dIr_dCps_dfoldAppMap (fuel - 1)) ((v_Vuna_dCompiler_dIr_dCps_dmSteps (fuel - 1)) head)) args)
)) (Base_dData_dPair.v_Base_dData_dPair_dsecondOf p))) (Base_dData_dPair.v_Base_dData_dPair_dfirstOf p))) (v_Vuna_dCompiler_dIr_dCps_dflattenApp e))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCtor (dtb__793, dtb__794, dtb__795) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCtor (dtb__793, dtb__794, ((v_Vuna_dCompiler_dIr_dCps_dmStepsList (fuel - 1)) dtb__795)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRecord (dtb__796, dtb__797) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRecord (dtb__796, ((v_Vuna_dCompiler_dIr_dCps_dmStepsFields (fuel - 1)) dtb__797)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrProj (dtb__798, dtb__799, dtb__800) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrProj (((v_Vuna_dCompiler_dIr_dCps_dmSteps (fuel - 1)) dtb__798), dtb__799, dtb__800))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRecUpd (dtb__801, dtb__802, dtb__803) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRecUpd (((v_Vuna_dCompiler_dIr_dCps_dmSteps (fuel - 1)) dtb__801), dtb__802, ((v_Vuna_dCompiler_dIr_dCps_dmStepsFields (fuel - 1)) dtb__803)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCast (dtb__804, dtb__805, dtb__806) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCast (dtb__804, dtb__805, ((v_Vuna_dCompiler_dIr_dCps_dmSteps (fuel - 1)) dtb__806)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLet (dtb__807, dtb__808, dtb__809) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLet (dtb__807, ((v_Vuna_dCompiler_dIr_dCps_dmSteps (fuel - 1)) dtb__808), ((v_Vuna_dCompiler_dIr_dCps_dmSteps (fuel - 1)) dtb__809)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLam (dtb__810, dtb__811, dtb__812) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLam (dtb__810, dtb__811, ((v_Vuna_dCompiler_dIr_dCps_dmSteps (fuel - 1)) dtb__812)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrIf (dtb__813, dtb__814, dtb__815) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrIf (((v_Vuna_dCompiler_dIr_dCps_dmSteps (fuel - 1)) dtb__813), ((v_Vuna_dCompiler_dIr_dCps_dmSteps (fuel - 1)) dtb__814), ((v_Vuna_dCompiler_dIr_dCps_dmSteps (fuel - 1)) dtb__815)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCase (dtb__816, dtb__817) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCase (((v_Vuna_dCompiler_dIr_dCps_dmSteps (fuel - 1)) dtb__816), ((v_Vuna_dCompiler_dIr_dCps_dmStepsAlts (fuel - 1)) dtb__817)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrNatCase (dtb__818, dtb__819, dtb__820, dtb__821, dtb__822) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrNatCase (((v_Vuna_dCompiler_dIr_dCps_dmSteps (fuel - 1)) dtb__818), dtb__819, ((v_Vuna_dCompiler_dIr_dCps_dmStepsAltM (fuel - 1)) dtb__820), ((v_Vuna_dCompiler_dIr_dCps_dmStepsAltM (fuel - 1)) dtb__821), ((v_Vuna_dCompiler_dIr_dCps_dmStepsAltM (fuel - 1)) dtb__822)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrConcatMany (dtb__823) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrConcatMany (((v_Vuna_dCompiler_dIr_dCps_dmStepsList (fuel - 1)) dtb__823)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrEffThunk (dtb__824, dtb__825, dtb__826, dtb__827, dtb__828) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrEffThunk (dtb__824, dtb__825, dtb__826, dtb__827, ((v_Vuna_dCompiler_dIr_dCps_dmSteps (fuel - 1)) dtb__828)))
  | _ -> e
)))
# 1628 "Vuna/Compiler/Ir/Cps.vuna"
and v_Vuna_dCompiler_dIr_dCps_dmStepsList = (fun fuel xs -> (if (fuel <= 0) then xs else (match xs with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__829, dtb__830) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (((v_Vuna_dCompiler_dIr_dCps_dmSteps (fuel - 1)) dtb__829), ((v_Vuna_dCompiler_dIr_dCps_dmStepsList (fuel - 1)) dtb__830)))
  | _ -> failwith "DT: impossible branch"
)))
# 1637 "Vuna/Compiler/Ir/Cps.vuna"
and v_Vuna_dCompiler_dIr_dCps_dmStepsFields = (fun fuel fs -> (if (fuel <= 0) then fs else (match fs with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__831, dtb__832) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Base_dData_dPair.v_Base_dData_dPair_dfirstOf dtb__831); Base_dData_dPair.f_Base_dData_dPair_dPair_second = ((v_Vuna_dCompiler_dIr_dCps_dmSteps (fuel - 1)) (Base_dData_dPair.v_Base_dData_dPair_dsecondOf dtb__831)) }, ((v_Vuna_dCompiler_dIr_dCps_dmStepsFields (fuel - 1)) dtb__832)))
  | _ -> failwith "DT: impossible branch"
)))
# 1646 "Vuna/Compiler/Ir/Cps.vuna"
and v_Vuna_dCompiler_dIr_dCps_dmStepsAlts = (fun fuel alts -> (if (fuel <= 0) then alts else (match alts with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__833, dtb__834) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltCtor = (dtb__833).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltCtor; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBinders = (dtb__833).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBinders; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBody = ((v_Vuna_dCompiler_dIr_dCps_dmSteps (fuel - 1)) (dtb__833).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBody) }, ((v_Vuna_dCompiler_dIr_dCps_dmStepsAlts (fuel - 1)) dtb__834)))
  | _ -> failwith "DT: impossible branch"
)))
# 1655 "Vuna/Compiler/Ir/Cps.vuna"
and v_Vuna_dCompiler_dIr_dCps_dmStepsAltM = (fun fuel m -> (if (fuel <= 0) then m else (match m with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__835) -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ({ Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltCtor = (dtb__835).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltCtor; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBinders = (dtb__835).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBinders; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBody = ((v_Vuna_dCompiler_dIr_dCps_dmSteps (fuel - 1)) (dtb__835).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBody) }))
  | _ -> failwith "DT: impossible branch"
)))
# 1665 "Vuna/Compiler/Ir/Cps.vuna"
and v_Vuna_dCompiler_dIr_dCps_dfoldAppMap = (fun fuel acc xs -> (if (fuel <= 0) then acc else (match xs with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> acc
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__836, dtb__837) -> (((v_Vuna_dCompiler_dIr_dCps_dfoldAppMap (fuel - 1)) (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (acc, ((v_Vuna_dCompiler_dIr_dCps_dmSteps (fuel - 1)) dtb__836)))) dtb__837)
  | _ -> failwith "DT: impossible branch"
)))

# 1674 "Vuna/Compiler/Ir/Cps.vuna"
let v_Vuna_dCompiler_dIr_dCps_dmStepsDef = (fun (mc0 : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrDef) -> (match mc0 with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrDef_IrDef (dtb__838, dtb__839, dtb__840, dtb__841, dtb__842, dtb__843, dtb__844, dtb__845) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrDef_IrDef (dtb__838, dtb__839, dtb__840, Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, ((v_Vuna_dCompiler_dIr_dCps_dmSteps v_Vuna_dCompiler_dIr_dCps_dstartFuel) dtb__842), dtb__843, dtb__844, dtb__845))
  | _ -> mc0
))

# 1693 "Vuna/Compiler/Ir/Cps.vuna"
let v_Vuna_dCompiler_dIr_dCps_dcpsUnit = (fun u -> (match ((v_Vuna_dCompiler_dIr_dCps_dtransformGroups v_Vuna_dCompiler_dIr_dCps_dstartFuel) (u).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrUnit_irUnitGroups) with
  | Base_dData_dResult.C_Base_dData_dResult_dResult_Err (dtb__846) -> (Base_dData_dResult.C_Base_dData_dResult_dResult_Err (dtb__846))
  | Base_dData_dResult.C_Base_dData_dResult_dResult_Ok (dtb__847) -> (Base_dData_dResult.C_Base_dData_dResult_dResult_Ok ({ Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrUnit_irUnitTyDecls = (u).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrUnit_irUnitTyDecls; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrUnit_irUnitGroups = dtb__847; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrUnit_irUnitHasListFamily = (u).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrUnit_irUnitHasListFamily; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrUnit_irUnitTypeRefs = (u).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrUnit_irUnitTypeRefs; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrUnit_irUnitEntry = (u).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrUnit_irUnitEntry }))
  | _ -> failwith "DT: impossible branch"
))

# 1701 "Vuna/Compiler/Ir/Cps.vuna"
let v_Vuna_dCompiler_dIr_dCps_dcpsDefs = (fun defs -> ((v_Vuna_dCompiler_dIr_dCps_dtransformDefs v_Vuna_dCompiler_dIr_dCps_dstartFuel) defs))

# 1678 "Vuna/Compiler/Ir/Cps.vuna"
let v_Vuna_dCompiler_dIr_dCps_dcpsDefsMachine = (fun defs -> (match (v_Vuna_dCompiler_dIr_dCps_dcpsDefs defs) with
  | Base_dData_dResult.C_Base_dData_dResult_dResult_Err (dtb__848) -> (Base_dData_dResult.C_Base_dData_dResult_dResult_Err (dtb__848))
  | Base_dData_dResult.C_Base_dData_dResult_dResult_Ok (dtb__849) -> (Base_dData_dResult.C_Base_dData_dResult_dResult_Ok (((Base_dData_dList.v_Base_dData_dList_dmap v_Vuna_dCompiler_dIr_dCps_dmStepsDef) ((Base_dData_dList.v_Base_dData_dList_dmap v_Vuna_dCompiler_dIr_dCps_dmApplysDef) ((Base_dData_dList.v_Base_dData_dList_dmap v_Vuna_dCompiler_dIr_dCps_dmMarkedDef) (((v_Vuna_dCompiler_dIr_dCps_dmDefs ((v_Vuna_dCompiler_dIr_dCps_dcollectHandleOpsDefs 100000) dtb__849)) v_Vuna_dCompiler_dIr_dCps_dstartFuel) dtb__849))))))
  | _ -> failwith "DT: impossible branch"
))

# 1686 "Vuna/Compiler/Ir/Cps.vuna"
let v_Vuna_dCompiler_dIr_dCps_dcpsDefsStep = (fun defs -> (match (v_Vuna_dCompiler_dIr_dCps_dcpsDefs defs) with
  | Base_dData_dResult.C_Base_dData_dResult_dResult_Err (dtb__850) -> (Base_dData_dResult.C_Base_dData_dResult_dResult_Err (dtb__850))
  | Base_dData_dResult.C_Base_dData_dResult_dResult_Ok (dtb__851) -> ((v_Vuna_dCompiler_dIr_dCps_dselDefs v_Vuna_dCompiler_dIr_dCps_dstartFuel) dtb__851)
  | _ -> failwith "DT: impossible branch"
))
