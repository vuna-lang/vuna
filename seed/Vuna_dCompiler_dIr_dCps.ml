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
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__17, dtb__18) -> ((v_Vuna_dCompiler_dIr_dCps_dapplyAll (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, mc0, dtb__17))) dtb__18)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> mc0
  | _ -> failwith "DT: impossible branch"
))

# 152 "Vuna/Compiler/Ir/Cps.vuna"
let rec v_Vuna_dCompiler_dIr_dCps_dflattenApp = (fun (mc0 : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIr) -> (match mc0 with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (dtb__19, dtb__20, dtb__21) -> ((fun p -> { Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Base_dData_dPair.v_Base_dData_dPair_dfirstOf p); Base_dData_dPair.f_Base_dData_dPair_dPair_second = ((Base_dData_dList.v_Base_dData_dList_dappend (Base_dData_dPair.v_Base_dData_dPair_dsecondOf p)) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__21, Base_dData_dList.C_Base_dData_dList_dList_Nil))) }) (v_Vuna_dCompiler_dIr_dCps_dflattenApp dtb__20))
  | _ -> { Base_dData_dPair.f_Base_dData_dPair_dPair_first = mc0; Base_dData_dPair.f_Base_dData_dPair_dPair_second = Base_dData_dList.C_Base_dData_dList_dList_Nil }
))

# 197 "Vuna/Compiler/Ir/Cps.vuna"
let v_Vuna_dCompiler_dIr_dCps_disThunkCtor = (fun family ctor -> (if (if (family = Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirEffTypeName) then (ctor = Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirEffMkCtor) else false) then true else (if (family = v_Vuna_dCompiler_dIr_dCps_dirScopedTypeName) then (ctor = v_Vuna_dCompiler_dIr_dCps_dirScopedMkCtor) else false)))

# 202 "Vuna/Compiler/Ir/Cps.vuna"
let v_Vuna_dCompiler_dIr_dCps_disThunkAlt = (fun alt -> ((fun nd_uscrut1 -> (match nd_uscrut1 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> false
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__22) -> (match dtb__22 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__23; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__24 } -> ((v_Vuna_dCompiler_dIr_dCps_disThunkCtor dtb__23) dtb__24)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) (alt).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltCtor))

# 209 "Vuna/Compiler/Ir/Cps.vuna"
let v_Vuna_dCompiler_dIr_dCps_dthunkBindersOfAlt = (fun alt -> (if (v_Vuna_dCompiler_dIr_dCps_disThunkAlt alt) then (v_Vuna_dCompiler_dIr_dCps_druntimeBinders (alt).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBinders) else Base_dData_dList.C_Base_dData_dList_dList_Nil))

# 160 "Vuna/Compiler/Ir/Cps.vuna"
let rec v_Vuna_dCompiler_dIr_dCps_dmapDirect = (fun fuel xs -> (if (fuel <= 0) then xs else (match xs with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__25, dtb__26) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (((v_Vuna_dCompiler_dIr_dCps_dtransformDirect (fuel - 1)) dtb__25), ((v_Vuna_dCompiler_dIr_dCps_dmapDirect (fuel - 1)) dtb__26)))
  | _ -> failwith "DT: impossible branch"
)))
# 169 "Vuna/Compiler/Ir/Cps.vuna"
and v_Vuna_dCompiler_dIr_dCps_dmapAltDirect = (fun fuel xs -> (if (fuel <= 0) then xs else (match xs with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__27, dtb__28) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (((v_Vuna_dCompiler_dIr_dCps_dtransformAltDirect (fuel - 1)) dtb__27), ((v_Vuna_dCompiler_dIr_dCps_dmapAltDirect (fuel - 1)) dtb__28)))
  | _ -> failwith "DT: impossible branch"
)))
# 178 "Vuna/Compiler/Ir/Cps.vuna"
and v_Vuna_dCompiler_dIr_dCps_dmapAltCps = (fun fuel env xs k -> (if (fuel <= 0) then xs else (match xs with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__29, dtb__30) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (((((v_Vuna_dCompiler_dIr_dCps_dcpsAlt (fuel - 1)) env) dtb__29) k), ((((v_Vuna_dCompiler_dIr_dCps_dmapAltCps (fuel - 1)) env) dtb__30) k)))
  | _ -> failwith "DT: impossible branch"
)))
# 187 "Vuna/Compiler/Ir/Cps.vuna"
and v_Vuna_dCompiler_dIr_dCps_dmapFieldsDirect = (fun fuel xs -> (if (fuel <= 0) then xs else (match xs with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__31, dtb__32) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Base_dData_dPair.v_Base_dData_dPair_dfirstOf dtb__31); Base_dData_dPair.f_Base_dData_dPair_dPair_second = ((v_Vuna_dCompiler_dIr_dCps_dtransformDirect (fuel - 1)) (Base_dData_dPair.v_Base_dData_dPair_dsecondOf dtb__31)) }, ((v_Vuna_dCompiler_dIr_dCps_dmapFieldsDirect (fuel - 1)) dtb__32)))
  | _ -> failwith "DT: impossible branch"
)))
# 224 "Vuna/Compiler/Ir/Cps.vuna"
and v_Vuna_dCompiler_dIr_dCps_dcpsExpr = (fun fuel env e k -> (if (fuel <= 0) then (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, k, ((v_Vuna_dCompiler_dIr_dCps_dtransformDirect (fuel - 1)) e))) else (match e with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (dtb__33, dtb__34, dtb__35) -> ((((v_Vuna_dCompiler_dIr_dCps_dcpsApp (fuel - 1)) env) e) k)
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCase (dtb__36, dtb__37, dtb__38) -> ((fun v -> ((fun kCase -> ((((v_Vuna_dCompiler_dIr_dCps_dcpsExpr (fuel - 1)) env) dtb__37) kCase)) (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLam ((Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (v, Base_dData_dList.C_Base_dData_dList_dList_Nil)), Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCase (dtb__36, (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrVar (v)), ((((v_Vuna_dCompiler_dIr_dCps_dmapAltCps (fuel - 1)) env) dtb__38) k))))))) (v_Vuna_dCompiler_dIr_dCps_dfreshV fuel))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrNatCase (dtb__39, dtb__40, dtb__41, dtb__42, dtb__43) -> ((fun v -> ((fun kCase -> ((((v_Vuna_dCompiler_dIr_dCps_dcpsExpr (fuel - 1)) env) dtb__39) kCase)) (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLam ((Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (v, Base_dData_dList.C_Base_dData_dList_dList_Nil)), Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrNatCase ((Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrVar (v)), dtb__40, ((((v_Vuna_dCompiler_dIr_dCps_dcpsAltMaybe (fuel - 1)) env) dtb__41) k), ((((v_Vuna_dCompiler_dIr_dCps_dcpsAltMaybe (fuel - 1)) env) dtb__42) k), ((((v_Vuna_dCompiler_dIr_dCps_dcpsAltMaybe (fuel - 1)) env) dtb__43) k))))))) (v_Vuna_dCompiler_dIr_dCps_dfreshV fuel))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrIf (dtb__44, dtb__45, dtb__46) -> ((fun v -> ((fun kIf -> ((((v_Vuna_dCompiler_dIr_dCps_dcpsExpr (fuel - 1)) env) dtb__44) kIf)) (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLam ((Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (v, Base_dData_dList.C_Base_dData_dList_dList_Nil)), Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrIf ((Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrVar (v)), ((((v_Vuna_dCompiler_dIr_dCps_dcpsExpr (fuel - 1)) env) dtb__45) k), ((((v_Vuna_dCompiler_dIr_dCps_dcpsExpr (fuel - 1)) env) dtb__46) k))))))) (v_Vuna_dCompiler_dIr_dCps_dfreshV fuel))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLet (dtb__47, dtb__48, dtb__49) -> ((fun v -> ((fun kLet -> ((((v_Vuna_dCompiler_dIr_dCps_dcpsExpr (fuel - 1)) env) dtb__48) kLet)) (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLam ((Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (v, Base_dData_dList.C_Base_dData_dList_dList_Nil)), Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLet (dtb__47, (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrVar (v)), ((((v_Vuna_dCompiler_dIr_dCps_dcpsExpr (fuel - 1)) env) dtb__49) k))))))) (v_Vuna_dCompiler_dIr_dCps_dfreshV fuel))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCast (dtb__50, dtb__51, dtb__52) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCast (dtb__50, dtb__51, ((((v_Vuna_dCompiler_dIr_dCps_dcpsExpr (fuel - 1)) env) dtb__52) k)))
  | _ -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, k, ((v_Vuna_dCompiler_dIr_dCps_dtransformDirect (fuel - 1)) e)))
)))
# 254 "Vuna/Compiler/Ir/Cps.vuna"
and v_Vuna_dCompiler_dIr_dCps_dcpsAlt = (fun fuel env alt k -> (if (fuel <= 0) then alt else ((fun env1 -> { Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltCtor = (alt).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltCtor; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBinders = (alt).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBinders; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBody = ((((v_Vuna_dCompiler_dIr_dCps_dcpsExpr (fuel - 1)) env1) (alt).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBody) k) }) ((Base_dData_dList.v_Base_dData_dList_dappend (v_Vuna_dCompiler_dIr_dCps_dthunkBindersOfAlt alt)) env))))
# 263 "Vuna/Compiler/Ir/Cps.vuna"
and v_Vuna_dCompiler_dIr_dCps_dcpsAltMaybe = (fun fuel env m k -> (if (fuel <= 0) then m else (match m with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__53) -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (((((v_Vuna_dCompiler_dIr_dCps_dcpsAlt (fuel - 1)) env) dtb__53) k)))
  | _ -> failwith "DT: impossible branch"
)))
# 273 "Vuna/Compiler/Ir/Cps.vuna"
and v_Vuna_dCompiler_dIr_dCps_dcpsArgs = (fun fuel env args head acc k -> (if (fuel <= 0) then (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, k, ((v_Vuna_dCompiler_dIr_dCps_dapplyAll head) (Base_dData_dList.v_Base_dData_dList_dreverse acc)))) else (match args with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, k, ((v_Vuna_dCompiler_dIr_dCps_dapplyAll head) (Base_dData_dList.v_Base_dData_dList_dreverse acc))))
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__54, dtb__55) -> ((fun v -> ((((v_Vuna_dCompiler_dIr_dCps_dcpsExpr (fuel - 1)) env) dtb__54) (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLam ((Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (v, Base_dData_dList.C_Base_dData_dList_dList_Nil)), Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, ((((((v_Vuna_dCompiler_dIr_dCps_dcpsArgs (fuel - 1)) env) dtb__55) head) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ((Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrVar (v)), acc))) k))))) (v_Vuna_dCompiler_dIr_dCps_dfreshV fuel))
  | _ -> failwith "DT: impossible branch"
)))
# 286 "Vuna/Compiler/Ir/Cps.vuna"
and v_Vuna_dCompiler_dIr_dCps_dcpsThunkCall = (fun fuel head args k -> (if (fuel <= 0) then ((v_Vuna_dCompiler_dIr_dCps_dapplyAll head) ((Base_dData_dList.v_Base_dData_dList_dappend args) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (k, Base_dData_dList.C_Base_dData_dList_dList_Nil)))) else ((v_Vuna_dCompiler_dIr_dCps_dapplyAll ((v_Vuna_dCompiler_dIr_dCps_dtransformDirect (fuel - 1)) head)) ((Base_dData_dList.v_Base_dData_dList_dappend ((v_Vuna_dCompiler_dIr_dCps_dmapDirect (fuel - 1)) args)) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (k, Base_dData_dList.C_Base_dData_dList_dList_Nil))))))
# 294 "Vuna/Compiler/Ir/Cps.vuna"
and v_Vuna_dCompiler_dIr_dCps_dcpsApp = (fun fuel env e k -> (if (fuel <= 0) then (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, k, e)) else ((fun p -> ((fun head -> ((fun args -> ((fun v -> (match head with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrVar (dtb__56) -> (if ((v_Vuna_dCompiler_dIr_dCps_dmemBinder dtb__56) env) then ((((v_Vuna_dCompiler_dIr_dCps_dcpsThunkCall (fuel - 1)) head) args) k) else ((((v_Vuna_dCompiler_dIr_dCps_dcpsExpr (fuel - 1)) env) head) (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLam ((Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (v, Base_dData_dList.C_Base_dData_dList_dList_Nil)), Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, ((((((v_Vuna_dCompiler_dIr_dCps_dcpsArgs (fuel - 1)) env) args) (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrVar (v))) Base_dData_dList.C_Base_dData_dList_dList_Nil) k)))))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrGlobal (dtb__57) -> (if (dtb__57 = v_Vuna_dCompiler_dIr_dCps_drunThunkName) then ((((v_Vuna_dCompiler_dIr_dCps_dcpsThunkCall (fuel - 1)) head) args) k) else ((((v_Vuna_dCompiler_dIr_dCps_dcpsExpr (fuel - 1)) env) head) (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLam ((Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (v, Base_dData_dList.C_Base_dData_dList_dList_Nil)), Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, ((((((v_Vuna_dCompiler_dIr_dCps_dcpsArgs (fuel - 1)) env) args) (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrVar (v))) Base_dData_dList.C_Base_dData_dList_dList_Nil) k)))))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRt (dtb__58) -> (if (dtb__58 = "prim_effectPerform") then ((((v_Vuna_dCompiler_dIr_dCps_dcpsThunkCall (fuel - 1)) (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRt (v_Vuna_dCompiler_dIr_dCps_dirCpsPerformName))) args) k) else (if (dtb__58 = "prim_effectHandle") then ((((v_Vuna_dCompiler_dIr_dCps_dcpsThunkCall (fuel - 1)) (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRt (v_Vuna_dCompiler_dIr_dCps_dirCpsHandleName))) args) k) else (if (dtb__58 = "prim_effectSelf") then ((((v_Vuna_dCompiler_dIr_dCps_dcpsThunkCall (fuel - 1)) (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRt (v_Vuna_dCompiler_dIr_dCps_dirCpsSelfName))) args) k) else ((((v_Vuna_dCompiler_dIr_dCps_dcpsExpr (fuel - 1)) env) head) (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLam ((Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (v, Base_dData_dList.C_Base_dData_dList_dList_Nil)), Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, ((((((v_Vuna_dCompiler_dIr_dCps_dcpsArgs (fuel - 1)) env) args) (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrVar (v))) Base_dData_dList.C_Base_dData_dList_dList_Nil) k)))))))
  | _ -> ((((v_Vuna_dCompiler_dIr_dCps_dcpsExpr (fuel - 1)) env) head) (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLam ((Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (v, Base_dData_dList.C_Base_dData_dList_dList_Nil)), Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, ((((((v_Vuna_dCompiler_dIr_dCps_dcpsArgs (fuel - 1)) env) args) (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrVar (v))) Base_dData_dList.C_Base_dData_dList_dList_Nil) k))))
)) (v_Vuna_dCompiler_dIr_dCps_dfreshV fuel))) (Base_dData_dPair.v_Base_dData_dPair_dsecondOf p))) (Base_dData_dPair.v_Base_dData_dPair_dfirstOf p))) (v_Vuna_dCompiler_dIr_dCps_dflattenApp e))))
# 318 "Vuna/Compiler/Ir/Cps.vuna"
and v_Vuna_dCompiler_dIr_dCps_dtransformDirect = (fun fuel e -> (if (fuel <= 0) then e else (match e with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCtor (dtb__59, dtb__60, dtb__61, dtb__62) -> (if ((v_Vuna_dCompiler_dIr_dCps_disThunkCtor dtb__59) dtb__60) then ((fun nd_uscrut6 -> (match nd_uscrut6 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__63, dtb__64) -> (match dtb__63 with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLam (dtb__65, dtb__66, dtb__67) -> (match dtb__64 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> ((fun k -> ((fun body1 -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCtor (dtb__59, dtb__60, Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ((Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLam (((Base_dData_dList.v_Base_dData_dList_dappend dtb__65) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (k, Base_dData_dList.C_Base_dData_dList_dList_Nil))), Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, body1)), Base_dData_dList.C_Base_dData_dList_dList_Nil))))) ((((v_Vuna_dCompiler_dIr_dCps_dcpsExpr (fuel - 1)) Base_dData_dList.C_Base_dData_dList_dList_Nil) dtb__67) (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrVar (k))))) (v_Vuna_dCompiler_dIr_dCps_dfreshK fuel))
  | _ -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCtor (dtb__59, dtb__60, Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, ((v_Vuna_dCompiler_dIr_dCps_dmapDirect (fuel - 1)) dtb__62)))
)
  | _ -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCtor (dtb__59, dtb__60, Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, ((v_Vuna_dCompiler_dIr_dCps_dmapDirect (fuel - 1)) dtb__62)))
)
  | _ -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCtor (dtb__59, dtb__60, Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, ((v_Vuna_dCompiler_dIr_dCps_dmapDirect (fuel - 1)) dtb__62)))
)) dtb__62) else (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCtor (dtb__59, dtb__60, Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, ((v_Vuna_dCompiler_dIr_dCps_dmapDirect (fuel - 1)) dtb__62))))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrEffThunk (dtb__68, dtb__69, dtb__70, dtb__71, dtb__72) -> ((fun u -> ((fun k -> ((fun argBs -> ((fun applied -> ((fun inner -> (if (dtb__71 <= 0) then inner else (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLam (argBs, Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, inner)))) (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCtor (dtb__68, dtb__69, Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ((Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLam ((Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (u, (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (k, Base_dData_dList.C_Base_dData_dList_dList_Nil)))), Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrVar (k)), applied)))), Base_dData_dList.C_Base_dData_dList_dList_Nil)))))) ((v_Vuna_dCompiler_dIr_dCps_dapplyAll ((v_Vuna_dCompiler_dIr_dCps_dtransformDirect (fuel - 1)) dtb__72)) ((Base_dData_dList.v_Base_dData_dList_dmap (fun _heta0 -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrVar (_heta0)))) argBs)))) ((Base_dData_dList.v_Base_dData_dList_dmap (fun (i : int) -> ((v_Vuna_dCompiler_dIr_dCps_dfreshA fuel) i))) ((Base_dData_dList.v_Base_dData_dList_drange 0) dtb__71)))) (v_Vuna_dCompiler_dIr_dCps_dfreshK fuel))) (v_Vuna_dCompiler_dIr_dCps_dfreshU fuel))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRecord (dtb__73, dtb__74) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRecord (dtb__73, ((v_Vuna_dCompiler_dIr_dCps_dmapFieldsDirect (fuel - 1)) dtb__74)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrProj (dtb__75, dtb__76, dtb__77) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrProj (((v_Vuna_dCompiler_dIr_dCps_dtransformDirect (fuel - 1)) dtb__75), dtb__76, dtb__77))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRecUpd (dtb__78, dtb__79, dtb__80) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRecUpd (((v_Vuna_dCompiler_dIr_dCps_dtransformDirect (fuel - 1)) dtb__78), dtb__79, ((v_Vuna_dCompiler_dIr_dCps_dmapFieldsDirect (fuel - 1)) dtb__80)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRtApp (dtb__81, dtb__82) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRtApp (dtb__81, ((v_Vuna_dCompiler_dIr_dCps_dmapDirect (fuel - 1)) dtb__82)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCast (dtb__83, dtb__84, dtb__85) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCast (dtb__83, dtb__84, ((v_Vuna_dCompiler_dIr_dCps_dtransformDirect (fuel - 1)) dtb__85)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLet (dtb__86, dtb__87, dtb__88) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLet (dtb__86, ((v_Vuna_dCompiler_dIr_dCps_dtransformDirect (fuel - 1)) dtb__87), ((v_Vuna_dCompiler_dIr_dCps_dtransformDirect (fuel - 1)) dtb__88)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLam (dtb__89, dtb__90, dtb__91) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLam (dtb__89, dtb__90, ((v_Vuna_dCompiler_dIr_dCps_dtransformDirect (fuel - 1)) dtb__91)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (dtb__92, dtb__93, dtb__94) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, ((v_Vuna_dCompiler_dIr_dCps_dtransformDirect (fuel - 1)) dtb__93), ((v_Vuna_dCompiler_dIr_dCps_dtransformDirect (fuel - 1)) dtb__94)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrIf (dtb__95, dtb__96, dtb__97) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrIf (((v_Vuna_dCompiler_dIr_dCps_dtransformDirect (fuel - 1)) dtb__95), ((v_Vuna_dCompiler_dIr_dCps_dtransformDirect (fuel - 1)) dtb__96), ((v_Vuna_dCompiler_dIr_dCps_dtransformDirect (fuel - 1)) dtb__97)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCase (dtb__98, dtb__99, dtb__100) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCase (dtb__98, ((v_Vuna_dCompiler_dIr_dCps_dtransformDirect (fuel - 1)) dtb__99), ((v_Vuna_dCompiler_dIr_dCps_dmapAltDirect (fuel - 1)) dtb__100)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrNatCase (dtb__101, dtb__102, dtb__103, dtb__104, dtb__105) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrNatCase (((v_Vuna_dCompiler_dIr_dCps_dtransformDirect (fuel - 1)) dtb__101), dtb__102, ((v_Vuna_dCompiler_dIr_dCps_dtransformAltMaybe (fuel - 1)) dtb__103), ((v_Vuna_dCompiler_dIr_dCps_dtransformAltMaybe (fuel - 1)) dtb__104), ((v_Vuna_dCompiler_dIr_dCps_dtransformAltMaybe (fuel - 1)) dtb__105)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrConcatMany (dtb__106) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrConcatMany (((v_Vuna_dCompiler_dIr_dCps_dmapDirect (fuel - 1)) dtb__106)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrVar (dtb__107) -> e
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrGlobal (dtb__108) -> e
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRt (dtb__109) -> e
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrInt (dtb__110) -> e
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrStr (dtb__111) -> e
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrBool (dtb__112) -> e
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrFloatLit (dtb__113) -> e
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrEffBind (dtb__114, dtb__115, dtb__116) -> e
  | _ -> failwith "DT: impossible branch"
)))
# 364 "Vuna/Compiler/Ir/Cps.vuna"
and v_Vuna_dCompiler_dIr_dCps_dtransformAltDirect = (fun fuel alt -> (if (fuel <= 0) then alt else { Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltCtor = (alt).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltCtor; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBinders = (alt).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBinders; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBody = ((v_Vuna_dCompiler_dIr_dCps_dtransformDirect (fuel - 1)) (alt).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBody) }))
# 371 "Vuna/Compiler/Ir/Cps.vuna"
and v_Vuna_dCompiler_dIr_dCps_dtransformAltMaybe = (fun fuel m -> (if (fuel <= 0) then m else (match m with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__117) -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (((v_Vuna_dCompiler_dIr_dCps_dtransformAltDirect (fuel - 1)) dtb__117)))
  | _ -> failwith "DT: impossible branch"
)))

# 213 "Vuna/Compiler/Ir/Cps.vuna"
let v_Vuna_dCompiler_dIr_dCps_didentityCont = ((fun v -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLam ((Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (v, Base_dData_dList.C_Base_dData_dList_dList_Nil)), Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrVar (v))))) (v_Vuna_dCompiler_dIr_dCps_dmkBinder "__cpsId"))

# 385 "Vuna/Compiler/Ir/Cps.vuna"
let rec v_Vuna_dCompiler_dIr_dCps_dtrampolineBody = (fun (mc0 : string) (mc1 : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIr) -> (match mc1 with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (dtb__118, dtb__119, dtb__120) -> (match dtb__119 with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (dtb__121, dtb__122, dtb__123) -> (match dtb__122 with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrGlobal (dtb__124) -> (if (dtb__124 = v_Vuna_dCompiler_dIr_dCps_drunThunkName) then (Base_dData_dResult.C_Base_dData_dResult_dResult_Ok (((v_Vuna_dCompiler_dIr_dCps_dapplyAll (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrGlobal (dtb__124))) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__123, (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__120, (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (v_Vuna_dCompiler_dIr_dCps_didentityCont, Base_dData_dList.C_Base_dData_dList_dList_Nil))))))))) else (Base_dData_dResult.C_Base_dData_dResult_dResult_Err (("CPS: unexpected trampoline shape: " ^ mc0))))
  | _ -> (Base_dData_dResult.C_Base_dData_dResult_dResult_Err (("CPS: unexpected trampoline shape: " ^ mc0)))
)
  | _ -> (Base_dData_dResult.C_Base_dData_dResult_dResult_Err (("CPS: unexpected trampoline shape: " ^ mc0)))
)
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCast (dtb__125, dtb__126, dtb__127) -> (match ((v_Vuna_dCompiler_dIr_dCps_dtrampolineBody mc0) dtb__127) with
  | Base_dData_dResult.C_Base_dData_dResult_dResult_Err (dtb__128) -> (Base_dData_dResult.C_Base_dData_dResult_dResult_Err (dtb__128))
  | Base_dData_dResult.C_Base_dData_dResult_dResult_Ok (dtb__129) -> (Base_dData_dResult.C_Base_dData_dResult_dResult_Ok ((Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCast (dtb__125, dtb__126, dtb__129))))
  | _ -> failwith "DT: impossible branch"
)
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLam (dtb__130, dtb__131, dtb__132) -> (match ((v_Vuna_dCompiler_dIr_dCps_dtrampolineBody mc0) dtb__132) with
  | Base_dData_dResult.C_Base_dData_dResult_dResult_Err (dtb__133) -> (Base_dData_dResult.C_Base_dData_dResult_dResult_Err (dtb__133))
  | Base_dData_dResult.C_Base_dData_dResult_dResult_Ok (dtb__134) -> (Base_dData_dResult.C_Base_dData_dResult_dResult_Ok ((Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLam (dtb__130, dtb__131, dtb__134))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> (Base_dData_dResult.C_Base_dData_dResult_dResult_Err (("CPS: unexpected trampoline shape: " ^ mc0)))
))

# 402 "Vuna/Compiler/Ir/Cps.vuna"
let rec v_Vuna_dCompiler_dIr_dCps_dselfAlt = (fun fuel alt name -> (if (fuel <= 0) then (Base_dData_dResult.C_Base_dData_dResult_dResult_Ok (alt)) else (match (((v_Vuna_dCompiler_dIr_dCps_dselfBody (fuel - 1)) (alt).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBody) name) with
  | Base_dData_dResult.C_Base_dData_dResult_dResult_Err (dtb__135) -> (Base_dData_dResult.C_Base_dData_dResult_dResult_Err (dtb__135))
  | Base_dData_dResult.C_Base_dData_dResult_dResult_Ok (dtb__136) -> (Base_dData_dResult.C_Base_dData_dResult_dResult_Ok ({ Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltCtor = (alt).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltCtor; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBinders = (alt).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBinders; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBody = dtb__136 }))
  | _ -> failwith "DT: impossible branch"
)))
# 411 "Vuna/Compiler/Ir/Cps.vuna"
and v_Vuna_dCompiler_dIr_dCps_dselfAlts = (fun fuel alts name -> (if (fuel <= 0) then (Base_dData_dResult.C_Base_dData_dResult_dResult_Ok (alts)) else (match alts with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Base_dData_dResult.C_Base_dData_dResult_dResult_Ok (Base_dData_dList.C_Base_dData_dList_dList_Nil))
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__137, dtb__138) -> (match (((v_Vuna_dCompiler_dIr_dCps_dselfAlt (fuel - 1)) dtb__137) name) with
  | Base_dData_dResult.C_Base_dData_dResult_dResult_Err (dtb__139) -> (Base_dData_dResult.C_Base_dData_dResult_dResult_Err (dtb__139))
  | Base_dData_dResult.C_Base_dData_dResult_dResult_Ok (dtb__140) -> (match (((v_Vuna_dCompiler_dIr_dCps_dselfAlts (fuel - 1)) dtb__138) name) with
  | Base_dData_dResult.C_Base_dData_dResult_dResult_Err (dtb__141) -> (Base_dData_dResult.C_Base_dData_dResult_dResult_Err (dtb__141))
  | Base_dData_dResult.C_Base_dData_dResult_dResult_Ok (dtb__142) -> (Base_dData_dResult.C_Base_dData_dResult_dResult_Ok ((Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__140, dtb__142))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))
# 426 "Vuna/Compiler/Ir/Cps.vuna"
and v_Vuna_dCompiler_dIr_dCps_dselfBody = (fun fuel body name -> (if (fuel <= 0) then (Base_dData_dResult.C_Base_dData_dResult_dResult_Ok (body)) else ((fun nd_uscrut3 -> (match nd_uscrut3 with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (dtb__143, dtb__144, dtb__145) -> (match dtb__144 with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRt (dtb__146) -> (if (dtb__146 = "prim_effectSelf") then (Base_dData_dResult.C_Base_dData_dResult_dResult_Ok (((v_Vuna_dCompiler_dIr_dCps_dapplyAll (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRt (v_Vuna_dCompiler_dIr_dCps_dirCpsSelfName))) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__145, (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (v_Vuna_dCompiler_dIr_dCps_didentityCont, Base_dData_dList.C_Base_dData_dList_dList_Nil))))))) else (Base_dData_dResult.C_Base_dData_dResult_dResult_Err (("CPS: unexpected handleScoped shape: " ^ name))))
  | _ -> (Base_dData_dResult.C_Base_dData_dResult_dResult_Err (("CPS: unexpected handleScoped shape: " ^ name)))
)
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCase (dtb__147, dtb__148, dtb__149) -> (match (((v_Vuna_dCompiler_dIr_dCps_dselfAlts (fuel - 1)) dtb__149) name) with
  | Base_dData_dResult.C_Base_dData_dResult_dResult_Err (dtb__150) -> (Base_dData_dResult.C_Base_dData_dResult_dResult_Err (dtb__150))
  | Base_dData_dResult.C_Base_dData_dResult_dResult_Ok (dtb__151) -> (Base_dData_dResult.C_Base_dData_dResult_dResult_Ok ((Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCase (dtb__147, dtb__148, dtb__151))))
  | _ -> failwith "DT: impossible branch"
)
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCast (dtb__152, dtb__153, dtb__154) -> (match (((v_Vuna_dCompiler_dIr_dCps_dselfBody (fuel - 1)) dtb__154) name) with
  | Base_dData_dResult.C_Base_dData_dResult_dResult_Err (dtb__155) -> (Base_dData_dResult.C_Base_dData_dResult_dResult_Err (dtb__155))
  | Base_dData_dResult.C_Base_dData_dResult_dResult_Ok (dtb__156) -> (Base_dData_dResult.C_Base_dData_dResult_dResult_Ok ((Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCast (dtb__152, dtb__153, dtb__156))))
  | _ -> failwith "DT: impossible branch"
)
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLam (dtb__157, dtb__158, dtb__159) -> (match (((v_Vuna_dCompiler_dIr_dCps_dselfBody (fuel - 1)) dtb__159) name) with
  | Base_dData_dResult.C_Base_dData_dResult_dResult_Err (dtb__160) -> (Base_dData_dResult.C_Base_dData_dResult_dResult_Err (dtb__160))
  | Base_dData_dResult.C_Base_dData_dResult_dResult_Ok (dtb__161) -> (Base_dData_dResult.C_Base_dData_dResult_dResult_Ok ((Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLam (dtb__157, dtb__158, dtb__161))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> (Base_dData_dResult.C_Base_dData_dResult_dResult_Err (("CPS: unexpected handleScoped shape: " ^ name)))
)) body)))

# 447 "Vuna/Compiler/Ir/Cps.vuna"
let v_Vuna_dCompiler_dIr_dCps_dtransformDef = (fun fuel d -> (if (fuel <= 0) then (Base_dData_dResult.C_Base_dData_dResult_dResult_Ok (d)) else (match d with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrDef_IrExternDef (dtb__162, dtb__163, dtb__164, dtb__165) -> (Base_dData_dResult.C_Base_dData_dResult_dResult_Ok (d))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrDef_IrDef (dtb__166, dtb__167, dtb__168, dtb__169, dtb__170, dtb__171, dtb__172, dtb__173) -> (if (if (if (dtb__166 = v_Vuna_dCompiler_dIr_dCps_drunPureName) then true else (dtb__166 = v_Vuna_dCompiler_dIr_dCps_drunEffName)) then true else (dtb__166 = v_Vuna_dCompiler_dIr_dCps_drunMainName)) then (match ((v_Vuna_dCompiler_dIr_dCps_dtrampolineBody dtb__166) dtb__170) with
  | Base_dData_dResult.C_Base_dData_dResult_dResult_Err (dtb__174) -> (Base_dData_dResult.C_Base_dData_dResult_dResult_Err (dtb__174))
  | Base_dData_dResult.C_Base_dData_dResult_dResult_Ok (dtb__175) -> (Base_dData_dResult.C_Base_dData_dResult_dResult_Ok ((Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrDef_IrDef (dtb__166, dtb__167, dtb__168, Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, dtb__175, dtb__171, dtb__172, dtb__173))))
  | _ -> failwith "DT: impossible branch"
) else (if (dtb__166 = v_Vuna_dCompiler_dIr_dCps_dhandleScopedName) then (match (((v_Vuna_dCompiler_dIr_dCps_dselfBody (fuel - 1)) dtb__170) dtb__166) with
  | Base_dData_dResult.C_Base_dData_dResult_dResult_Err (dtb__176) -> (Base_dData_dResult.C_Base_dData_dResult_dResult_Err (dtb__176))
  | Base_dData_dResult.C_Base_dData_dResult_dResult_Ok (dtb__177) -> (Base_dData_dResult.C_Base_dData_dResult_dResult_Ok ((Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrDef_IrDef (dtb__166, dtb__167, dtb__168, Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, dtb__177, dtb__171, dtb__172, dtb__173))))
  | _ -> failwith "DT: impossible branch"
) else (Base_dData_dResult.C_Base_dData_dResult_dResult_Ok ((Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrDef_IrDef (dtb__166, dtb__167, dtb__168, Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, ((v_Vuna_dCompiler_dIr_dCps_dtransformDirect (fuel - 1)) dtb__170), dtb__171, dtb__172, dtb__173))))))
  | _ -> failwith "DT: impossible branch"
)))

# 466 "Vuna/Compiler/Ir/Cps.vuna"
let rec v_Vuna_dCompiler_dIr_dCps_dtransformDefs = (fun fuel xs -> (if (fuel <= 0) then (Base_dData_dResult.C_Base_dData_dResult_dResult_Ok (xs)) else (match xs with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Base_dData_dResult.C_Base_dData_dResult_dResult_Ok (Base_dData_dList.C_Base_dData_dList_dList_Nil))
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__178, dtb__179) -> (match ((v_Vuna_dCompiler_dIr_dCps_dtransformDef (fuel - 1)) dtb__178) with
  | Base_dData_dResult.C_Base_dData_dResult_dResult_Err (dtb__180) -> (Base_dData_dResult.C_Base_dData_dResult_dResult_Err (dtb__180))
  | Base_dData_dResult.C_Base_dData_dResult_dResult_Ok (dtb__181) -> (match ((v_Vuna_dCompiler_dIr_dCps_dtransformDefs (fuel - 1)) dtb__179) with
  | Base_dData_dResult.C_Base_dData_dResult_dResult_Err (dtb__182) -> (Base_dData_dResult.C_Base_dData_dResult_dResult_Err (dtb__182))
  | Base_dData_dResult.C_Base_dData_dResult_dResult_Ok (dtb__183) -> (Base_dData_dResult.C_Base_dData_dResult_dResult_Ok ((Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__181, dtb__183))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))

# 481 "Vuna/Compiler/Ir/Cps.vuna"
let v_Vuna_dCompiler_dIr_dCps_dtransformGroup = (fun fuel g -> (if (fuel <= 0) then (Base_dData_dResult.C_Base_dData_dResult_dResult_Ok (g)) else (match ((v_Vuna_dCompiler_dIr_dCps_dtransformDefs (fuel - 1)) (g).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrGroup_irGroupDefs) with
  | Base_dData_dResult.C_Base_dData_dResult_dResult_Err (dtb__184) -> (Base_dData_dResult.C_Base_dData_dResult_dResult_Err (dtb__184))
  | Base_dData_dResult.C_Base_dData_dResult_dResult_Ok (dtb__185) -> (Base_dData_dResult.C_Base_dData_dResult_dResult_Ok ({ Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrGroup_irGroupIsRec = (g).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrGroup_irGroupIsRec; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrGroup_irGroupDefs = dtb__185 }))
  | _ -> failwith "DT: impossible branch"
)))

# 490 "Vuna/Compiler/Ir/Cps.vuna"
let rec v_Vuna_dCompiler_dIr_dCps_dtransformGroups = (fun fuel xs -> (if (fuel <= 0) then (Base_dData_dResult.C_Base_dData_dResult_dResult_Ok (xs)) else (match xs with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Base_dData_dResult.C_Base_dData_dResult_dResult_Ok (Base_dData_dList.C_Base_dData_dList_dList_Nil))
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__186, dtb__187) -> (match ((v_Vuna_dCompiler_dIr_dCps_dtransformGroup (fuel - 1)) dtb__186) with
  | Base_dData_dResult.C_Base_dData_dResult_dResult_Err (dtb__188) -> (Base_dData_dResult.C_Base_dData_dResult_dResult_Err (dtb__188))
  | Base_dData_dResult.C_Base_dData_dResult_dResult_Ok (dtb__189) -> (match ((v_Vuna_dCompiler_dIr_dCps_dtransformGroups (fuel - 1)) dtb__187) with
  | Base_dData_dResult.C_Base_dData_dResult_dResult_Err (dtb__190) -> (Base_dData_dResult.C_Base_dData_dResult_dResult_Err (dtb__190))
  | Base_dData_dResult.C_Base_dData_dResult_dResult_Ok (dtb__191) -> (Base_dData_dResult.C_Base_dData_dResult_dResult_Ok ((Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__189, dtb__191))))
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
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRt (dtb__192) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRt ((v_Vuna_dCompiler_dIr_dCps_dselSym dtb__192)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRtApp (dtb__193, dtb__194) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRtApp ((v_Vuna_dCompiler_dIr_dCps_dselSym dtb__193), ((v_Vuna_dCompiler_dIr_dCps_dselSList (fuel - 1)) dtb__194)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCtor (dtb__195, dtb__196, dtb__197, dtb__198) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCtor (dtb__195, dtb__196, Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, ((v_Vuna_dCompiler_dIr_dCps_dselSList (fuel - 1)) dtb__198)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRecord (dtb__199, dtb__200) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRecord (dtb__199, ((v_Vuna_dCompiler_dIr_dCps_dselSFields (fuel - 1)) dtb__200)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrProj (dtb__201, dtb__202, dtb__203) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrProj (((v_Vuna_dCompiler_dIr_dCps_dselSyms (fuel - 1)) dtb__201), dtb__202, dtb__203))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRecUpd (dtb__204, dtb__205, dtb__206) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRecUpd (((v_Vuna_dCompiler_dIr_dCps_dselSyms (fuel - 1)) dtb__204), dtb__205, ((v_Vuna_dCompiler_dIr_dCps_dselSFields (fuel - 1)) dtb__206)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCast (dtb__207, dtb__208, dtb__209) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCast (dtb__207, dtb__208, ((v_Vuna_dCompiler_dIr_dCps_dselSyms (fuel - 1)) dtb__209)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLet (dtb__210, dtb__211, dtb__212) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLet (dtb__210, ((v_Vuna_dCompiler_dIr_dCps_dselSyms (fuel - 1)) dtb__211), ((v_Vuna_dCompiler_dIr_dCps_dselSyms (fuel - 1)) dtb__212)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLam (dtb__213, dtb__214, dtb__215) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLam (dtb__213, dtb__214, ((v_Vuna_dCompiler_dIr_dCps_dselSyms (fuel - 1)) dtb__215)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (dtb__216, dtb__217, dtb__218) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, ((v_Vuna_dCompiler_dIr_dCps_dselSyms (fuel - 1)) dtb__217), ((v_Vuna_dCompiler_dIr_dCps_dselSyms (fuel - 1)) dtb__218)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrIf (dtb__219, dtb__220, dtb__221) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrIf (((v_Vuna_dCompiler_dIr_dCps_dselSyms (fuel - 1)) dtb__219), ((v_Vuna_dCompiler_dIr_dCps_dselSyms (fuel - 1)) dtb__220), ((v_Vuna_dCompiler_dIr_dCps_dselSyms (fuel - 1)) dtb__221)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCase (dtb__222, dtb__223, dtb__224) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCase (dtb__222, ((v_Vuna_dCompiler_dIr_dCps_dselSyms (fuel - 1)) dtb__223), ((v_Vuna_dCompiler_dIr_dCps_dselSymsAlt (fuel - 1)) dtb__224)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrNatCase (dtb__225, dtb__226, dtb__227, dtb__228, dtb__229) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrNatCase (((v_Vuna_dCompiler_dIr_dCps_dselSyms (fuel - 1)) dtb__225), dtb__226, ((v_Vuna_dCompiler_dIr_dCps_dselSymsAltM (fuel - 1)) dtb__227), ((v_Vuna_dCompiler_dIr_dCps_dselSymsAltM (fuel - 1)) dtb__228), ((v_Vuna_dCompiler_dIr_dCps_dselSymsAltM (fuel - 1)) dtb__229)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrConcatMany (dtb__230) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrConcatMany (((v_Vuna_dCompiler_dIr_dCps_dselSList (fuel - 1)) dtb__230)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrEffThunk (dtb__231, dtb__232, dtb__233, dtb__234, dtb__235) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrEffThunk (dtb__231, dtb__232, dtb__233, dtb__234, ((v_Vuna_dCompiler_dIr_dCps_dselSyms (fuel - 1)) dtb__235)))
  | _ -> e
)))
# 543 "Vuna/Compiler/Ir/Cps.vuna"
and v_Vuna_dCompiler_dIr_dCps_dselSList = (fun fuel xs -> (if (fuel <= 0) then xs else (match xs with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__236, dtb__237) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (((v_Vuna_dCompiler_dIr_dCps_dselSyms (fuel - 1)) dtb__236), ((v_Vuna_dCompiler_dIr_dCps_dselSList (fuel - 1)) dtb__237)))
  | _ -> failwith "DT: impossible branch"
)))
# 552 "Vuna/Compiler/Ir/Cps.vuna"
and v_Vuna_dCompiler_dIr_dCps_dselSFields = (fun fuel fs -> (if (fuel <= 0) then fs else (match fs with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__238, dtb__239) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Base_dData_dPair.v_Base_dData_dPair_dfirstOf dtb__238); Base_dData_dPair.f_Base_dData_dPair_dPair_second = ((v_Vuna_dCompiler_dIr_dCps_dselSyms (fuel - 1)) (Base_dData_dPair.v_Base_dData_dPair_dsecondOf dtb__238)) }, ((v_Vuna_dCompiler_dIr_dCps_dselSFields (fuel - 1)) dtb__239)))
  | _ -> failwith "DT: impossible branch"
)))
# 561 "Vuna/Compiler/Ir/Cps.vuna"
and v_Vuna_dCompiler_dIr_dCps_dselSymsAlt = (fun fuel alts -> (if (fuel <= 0) then alts else (match alts with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__240, dtb__241) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltCtor = (dtb__240).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltCtor; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBinders = (dtb__240).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBinders; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBody = ((v_Vuna_dCompiler_dIr_dCps_dselSyms (fuel - 1)) (dtb__240).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBody) }, ((v_Vuna_dCompiler_dIr_dCps_dselSymsAlt (fuel - 1)) dtb__241)))
  | _ -> failwith "DT: impossible branch"
)))
# 570 "Vuna/Compiler/Ir/Cps.vuna"
and v_Vuna_dCompiler_dIr_dCps_dselSymsAltM = (fun fuel m -> (if (fuel <= 0) then m else (match m with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__242) -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ({ Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltCtor = (dtb__242).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltCtor; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBinders = (dtb__242).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBinders; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBody = ((v_Vuna_dCompiler_dIr_dCps_dselSyms (fuel - 1)) (dtb__242).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBody) }))
  | _ -> failwith "DT: impossible branch"
)))

# 580 "Vuna/Compiler/Ir/Cps.vuna"
let v_Vuna_dCompiler_dIr_dCps_dstepDoneCont = ((fun v -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLam ((Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (v, Base_dData_dList.C_Base_dData_dList_dList_Nil)), Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRt (v_Vuna_dCompiler_dIr_dCps_dirSelDoneName)), (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrVar (v))))))) (v_Vuna_dCompiler_dIr_dCps_dmkBinder "__selId"))

# 586 "Vuna/Compiler/Ir/Cps.vuna"
let rec v_Vuna_dCompiler_dIr_dCps_dselTrampolineBody = (fun (mc0 : string) (mc1 : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIr) -> (match mc1 with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (dtb__243, dtb__244, dtb__245) -> (match dtb__244 with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (dtb__246, dtb__247, dtb__248) -> (match dtb__247 with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (dtb__249, dtb__250, dtb__251) -> (match dtb__250 with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrGlobal (dtb__252) -> (if (dtb__252 = v_Vuna_dCompiler_dIr_dCps_drunThunkName) then (Base_dData_dResult.C_Base_dData_dResult_dResult_Ok ((Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRt (v_Vuna_dCompiler_dIr_dCps_dirSelRunName)), ((v_Vuna_dCompiler_dIr_dCps_dapplyAll (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrGlobal (dtb__252))) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__251, (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__248, (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (v_Vuna_dCompiler_dIr_dCps_dstepDoneCont, Base_dData_dList.C_Base_dData_dList_dList_Nil))))))))))) else (Base_dData_dResult.C_Base_dData_dResult_dResult_Err (("selective CPS: unexpected trampoline shape: " ^ mc0))))
  | _ -> (Base_dData_dResult.C_Base_dData_dResult_dResult_Err (("selective CPS: unexpected trampoline shape: " ^ mc0)))
)
  | _ -> (Base_dData_dResult.C_Base_dData_dResult_dResult_Err (("selective CPS: unexpected trampoline shape: " ^ mc0)))
)
  | _ -> (Base_dData_dResult.C_Base_dData_dResult_dResult_Err (("selective CPS: unexpected trampoline shape: " ^ mc0)))
)
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCast (dtb__253, dtb__254, dtb__255) -> (match ((v_Vuna_dCompiler_dIr_dCps_dselTrampolineBody mc0) dtb__255) with
  | Base_dData_dResult.C_Base_dData_dResult_dResult_Err (dtb__256) -> (Base_dData_dResult.C_Base_dData_dResult_dResult_Err (dtb__256))
  | Base_dData_dResult.C_Base_dData_dResult_dResult_Ok (dtb__257) -> (Base_dData_dResult.C_Base_dData_dResult_dResult_Ok ((Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCast (dtb__253, dtb__254, dtb__257))))
  | _ -> failwith "DT: impossible branch"
)
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLam (dtb__258, dtb__259, dtb__260) -> (match ((v_Vuna_dCompiler_dIr_dCps_dselTrampolineBody mc0) dtb__260) with
  | Base_dData_dResult.C_Base_dData_dResult_dResult_Err (dtb__261) -> (Base_dData_dResult.C_Base_dData_dResult_dResult_Err (dtb__261))
  | Base_dData_dResult.C_Base_dData_dResult_dResult_Ok (dtb__262) -> (Base_dData_dResult.C_Base_dData_dResult_dResult_Ok ((Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLam (dtb__258, dtb__259, dtb__262))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> (Base_dData_dResult.C_Base_dData_dResult_dResult_Err (("selective CPS: unexpected trampoline shape: " ^ mc0)))
))

# 603 "Vuna/Compiler/Ir/Cps.vuna"
let rec v_Vuna_dCompiler_dIr_dCps_dselSelfBody = (fun fuel body -> (if (fuel <= 0) then (Base_dData_dResult.C_Base_dData_dResult_dResult_Ok (body)) else ((fun nd_uscrut2 -> (match nd_uscrut2 with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (dtb__263, dtb__264, dtb__265) -> (match dtb__264 with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (dtb__266, dtb__267, dtb__268) -> (match dtb__267 with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRt (dtb__269) -> (if (dtb__269 = v_Vuna_dCompiler_dIr_dCps_dirSelSelfName) then (Base_dData_dResult.C_Base_dData_dResult_dResult_Ok ((Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRt (dtb__269)), dtb__268)), v_Vuna_dCompiler_dIr_dCps_dstepDoneCont)))) else (Base_dData_dResult.C_Base_dData_dResult_dResult_Err ("selective CPS: unexpected handleScoped shape")))
  | _ -> (Base_dData_dResult.C_Base_dData_dResult_dResult_Err ("selective CPS: unexpected handleScoped shape"))
)
  | _ -> (Base_dData_dResult.C_Base_dData_dResult_dResult_Err ("selective CPS: unexpected handleScoped shape"))
)
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCase (dtb__270, dtb__271, dtb__272) -> (match ((v_Vuna_dCompiler_dIr_dCps_dselSelfAlts (fuel - 1)) dtb__272) with
  | Base_dData_dResult.C_Base_dData_dResult_dResult_Err (dtb__273) -> (Base_dData_dResult.C_Base_dData_dResult_dResult_Err (dtb__273))
  | Base_dData_dResult.C_Base_dData_dResult_dResult_Ok (dtb__274) -> (Base_dData_dResult.C_Base_dData_dResult_dResult_Ok ((Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCase (dtb__270, dtb__271, dtb__274))))
  | _ -> failwith "DT: impossible branch"
)
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCast (dtb__275, dtb__276, dtb__277) -> (match ((v_Vuna_dCompiler_dIr_dCps_dselSelfBody (fuel - 1)) dtb__277) with
  | Base_dData_dResult.C_Base_dData_dResult_dResult_Err (dtb__278) -> (Base_dData_dResult.C_Base_dData_dResult_dResult_Err (dtb__278))
  | Base_dData_dResult.C_Base_dData_dResult_dResult_Ok (dtb__279) -> (Base_dData_dResult.C_Base_dData_dResult_dResult_Ok ((Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCast (dtb__275, dtb__276, dtb__279))))
  | _ -> failwith "DT: impossible branch"
)
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLam (dtb__280, dtb__281, dtb__282) -> (match ((v_Vuna_dCompiler_dIr_dCps_dselSelfBody (fuel - 1)) dtb__282) with
  | Base_dData_dResult.C_Base_dData_dResult_dResult_Err (dtb__283) -> (Base_dData_dResult.C_Base_dData_dResult_dResult_Err (dtb__283))
  | Base_dData_dResult.C_Base_dData_dResult_dResult_Ok (dtb__284) -> (Base_dData_dResult.C_Base_dData_dResult_dResult_Ok ((Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLam (dtb__280, dtb__281, dtb__284))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> (Base_dData_dResult.C_Base_dData_dResult_dResult_Err ("selective CPS: unexpected handleScoped shape"))
)) body)))
# 624 "Vuna/Compiler/Ir/Cps.vuna"
and v_Vuna_dCompiler_dIr_dCps_dselSelfAlts = (fun fuel alts -> (if (fuel <= 0) then (Base_dData_dResult.C_Base_dData_dResult_dResult_Ok (alts)) else (match alts with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Base_dData_dResult.C_Base_dData_dResult_dResult_Ok (Base_dData_dList.C_Base_dData_dList_dList_Nil))
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__285, dtb__286) -> (match ((v_Vuna_dCompiler_dIr_dCps_dselSelfBody (fuel - 1)) (dtb__285).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBody) with
  | Base_dData_dResult.C_Base_dData_dResult_dResult_Err (dtb__287) -> (Base_dData_dResult.C_Base_dData_dResult_dResult_Err (dtb__287))
  | Base_dData_dResult.C_Base_dData_dResult_dResult_Ok (dtb__288) -> (match ((v_Vuna_dCompiler_dIr_dCps_dselSelfAlts (fuel - 1)) dtb__286) with
  | Base_dData_dResult.C_Base_dData_dResult_dResult_Err (dtb__289) -> (Base_dData_dResult.C_Base_dData_dResult_dResult_Err (dtb__289))
  | Base_dData_dResult.C_Base_dData_dResult_dResult_Ok (dtb__290) -> (Base_dData_dResult.C_Base_dData_dResult_dResult_Ok ((Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltCtor = (dtb__285).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltCtor; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBinders = (dtb__285).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBinders; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBody = dtb__288 }, dtb__290))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))

# 639 "Vuna/Compiler/Ir/Cps.vuna"
let v_Vuna_dCompiler_dIr_dCps_dselDef = (fun fuel d -> (if (fuel <= 0) then (Base_dData_dResult.C_Base_dData_dResult_dResult_Ok (d)) else (match d with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrDef_IrExternDef (dtb__291, dtb__292, dtb__293, dtb__294) -> (Base_dData_dResult.C_Base_dData_dResult_dResult_Ok (d))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrDef_IrDef (dtb__295, dtb__296, dtb__297, dtb__298, dtb__299, dtb__300, dtb__301, dtb__302) -> ((fun b -> (if (if (if (dtb__295 = v_Vuna_dCompiler_dIr_dCps_drunPureName) then true else (dtb__295 = v_Vuna_dCompiler_dIr_dCps_drunEffName)) then true else (dtb__295 = v_Vuna_dCompiler_dIr_dCps_drunMainName)) then (match ((v_Vuna_dCompiler_dIr_dCps_dselTrampolineBody dtb__295) b) with
  | Base_dData_dResult.C_Base_dData_dResult_dResult_Err (dtb__303) -> (Base_dData_dResult.C_Base_dData_dResult_dResult_Err (dtb__303))
  | Base_dData_dResult.C_Base_dData_dResult_dResult_Ok (dtb__304) -> (Base_dData_dResult.C_Base_dData_dResult_dResult_Ok ((Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrDef_IrDef (dtb__295, dtb__296, dtb__297, Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, dtb__304, dtb__300, dtb__301, dtb__302))))
  | _ -> failwith "DT: impossible branch"
) else (if (dtb__295 = v_Vuna_dCompiler_dIr_dCps_dhandleScopedName) then (match ((v_Vuna_dCompiler_dIr_dCps_dselSelfBody (fuel - 1)) b) with
  | Base_dData_dResult.C_Base_dData_dResult_dResult_Err (dtb__305) -> (Base_dData_dResult.C_Base_dData_dResult_dResult_Err (dtb__305))
  | Base_dData_dResult.C_Base_dData_dResult_dResult_Ok (dtb__306) -> (Base_dData_dResult.C_Base_dData_dResult_dResult_Ok ((Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrDef_IrDef (dtb__295, dtb__296, dtb__297, Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, dtb__306, dtb__300, dtb__301, dtb__302))))
  | _ -> failwith "DT: impossible branch"
) else (Base_dData_dResult.C_Base_dData_dResult_dResult_Ok ((Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrDef_IrDef (dtb__295, dtb__296, dtb__297, Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, b, dtb__300, dtb__301, dtb__302))))))) ((v_Vuna_dCompiler_dIr_dCps_dselSyms (fuel - 1)) dtb__299))
  | _ -> failwith "DT: impossible branch"
)))

# 660 "Vuna/Compiler/Ir/Cps.vuna"
let rec v_Vuna_dCompiler_dIr_dCps_dselDefs = (fun fuel defs -> (if (fuel <= 0) then (Base_dData_dResult.C_Base_dData_dResult_dResult_Ok (defs)) else (match defs with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Base_dData_dResult.C_Base_dData_dResult_dResult_Ok (Base_dData_dList.C_Base_dData_dList_dList_Nil))
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__307, dtb__308) -> (match ((v_Vuna_dCompiler_dIr_dCps_dselDef (fuel - 1)) dtb__307) with
  | Base_dData_dResult.C_Base_dData_dResult_dResult_Err (dtb__309) -> (Base_dData_dResult.C_Base_dData_dResult_dResult_Err (dtb__309))
  | Base_dData_dResult.C_Base_dData_dResult_dResult_Ok (dtb__310) -> (match ((v_Vuna_dCompiler_dIr_dCps_dselDefs (fuel - 1)) dtb__308) with
  | Base_dData_dResult.C_Base_dData_dResult_dResult_Err (dtb__311) -> (Base_dData_dResult.C_Base_dData_dResult_dResult_Err (dtb__311))
  | Base_dData_dResult.C_Base_dData_dResult_dResult_Ok (dtb__312) -> (Base_dData_dResult.C_Base_dData_dResult_dResult_Ok ((Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__310, dtb__312))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))

# 679 "Vuna/Compiler/Ir/Cps.vuna"
let v_Vuna_dCompiler_dIr_dCps_dmBNameText = (fun (mc0 : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrBName) -> (match mc0 with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrBName_IrBWild -> "wild"
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrBName_IrBNat (dtb__313) -> ("nat" ^ (bi_strFromInt dtb__313))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrBName_IrBArm (dtb__314) -> ("arm" ^ (bi_strFromInt dtb__314))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrBName_IrBUser (dtb__315) -> dtb__315
  | _ -> failwith "DT: impossible branch"
))

# 685 "Vuna/Compiler/Ir/Cps.vuna"
let v_Vuna_dCompiler_dIr_dCps_dmIsOp = (fun b -> (match (b).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrBinder_irBinderName with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrBName_IrBUser (dtb__316) -> (dtb__316 = "@vuna@handle@o")
  | _ -> false
))

# 694 "Vuna/Compiler/Ir/Cps.vuna"
let rec v_Vuna_dCompiler_dIr_dCps_dmResumeGo = (fun (mc0 : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrBinder Base_dData_dList.t_Base_dData_dList_dList) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__317, dtb__318) -> (if (v_Vuna_dCompiler_dIr_dCps_dmIsOp dtb__317) then (match dtb__318 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__319, dtb__320) -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__319))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
) else (v_Vuna_dCompiler_dIr_dCps_dmResumeGo dtb__318))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 691 "Vuna/Compiler/Ir/Cps.vuna"
let v_Vuna_dCompiler_dIr_dCps_dmResumption = (fun bs -> (v_Vuna_dCompiler_dIr_dCps_dmResumeGo (v_Vuna_dCompiler_dIr_dCps_druntimeBinders bs)))

# 704 "Vuna/Compiler/Ir/Cps.vuna"
let rec v_Vuna_dCompiler_dIr_dCps_dmEraseHead = (fun (mc0 : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIr) -> (match mc0 with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCast (dtb__321, dtb__322, dtb__323) -> (v_Vuna_dCompiler_dIr_dCps_dmEraseHead dtb__323)
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (dtb__324, dtb__325, dtb__326) -> (match dtb__325 with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRt (dtb__327) -> (if (dtb__327 = "prim_erase") then (v_Vuna_dCompiler_dIr_dCps_dmEraseHead dtb__326) else mc0)
  | _ -> mc0
)
  | _ -> mc0
))

# 711 "Vuna/Compiler/Ir/Cps.vuna"
let rec v_Vuna_dCompiler_dIr_dCps_dmStripErase = (fun (mc0 : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIr) -> (match mc0 with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (dtb__328, dtb__329, dtb__330) -> (match dtb__329 with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRt (dtb__331) -> (if (dtb__331 = "prim_erase") then (v_Vuna_dCompiler_dIr_dCps_dmStripErase dtb__330) else (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRt (dtb__331)), dtb__330)))
  | _ -> mc0
)
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCast (dtb__332, dtb__333, dtb__334) -> (v_Vuna_dCompiler_dIr_dCps_dmStripErase dtb__334)
  | _ -> mc0
))

# 720 "Vuna/Compiler/Ir/Cps.vuna"
let v_Vuna_dCompiler_dIr_dCps_dmIsResumeAppGo = (fun (mc0 : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrBinder) (mc1 : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIr) -> (match mc1 with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (dtb__335, dtb__336, dtb__337) -> ((fun p -> (match (v_Vuna_dCompiler_dIr_dCps_dmEraseHead (Base_dData_dPair.v_Base_dData_dPair_dfirstOf p)) with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrVar (dtb__338) -> ((v_Vuna_dCompiler_dIr_dCps_dmBNameText (dtb__338).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrBinder_irBinderName) = (v_Vuna_dCompiler_dIr_dCps_dmBNameText (mc0).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrBinder_irBinderName))
  | _ -> (match (Base_dData_dPair.v_Base_dData_dPair_dsecondOf p) with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__339, dtb__340) -> (match (v_Vuna_dCompiler_dIr_dCps_dmEraseHead dtb__339) with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrVar (dtb__341) -> ((v_Vuna_dCompiler_dIr_dCps_dmBNameText (dtb__341).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrBinder_irBinderName) = (v_Vuna_dCompiler_dIr_dCps_dmBNameText (mc0).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrBinder_irBinderName))
  | _ -> false
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
)
)) (v_Vuna_dCompiler_dIr_dCps_dflattenApp mc1))
  | _ -> false
))

# 717 "Vuna/Compiler/Ir/Cps.vuna"
let v_Vuna_dCompiler_dIr_dCps_dmIsResumeApp = (fun r e0 -> ((v_Vuna_dCompiler_dIr_dCps_dmIsResumeAppGo r) (v_Vuna_dCompiler_dIr_dCps_dmStripErase e0)))

# 735 "Vuna/Compiler/Ir/Cps.vuna"
let v_Vuna_dCompiler_dIr_dCps_dmFreshV = (fun n -> (v_Vuna_dCompiler_dIr_dCps_dmkBinder ("__mchV" ^ (bi_strFromInt n))))

# 738 "Vuna/Compiler/Ir/Cps.vuna"
let v_Vuna_dCompiler_dIr_dCps_dmFreshK = (fun n -> (v_Vuna_dCompiler_dIr_dCps_dmkBinder ("__mchK" ^ (bi_strFromInt n))))

# 741 "Vuna/Compiler/Ir/Cps.vuna"
let v_Vuna_dCompiler_dIr_dCps_dmFreshR = (fun n -> (v_Vuna_dCompiler_dIr_dCps_dmkBinder ("__mchR" ^ (bi_strFromInt n))))

# 746 "Vuna/Compiler/Ir/Cps.vuna"
let v_Vuna_dCompiler_dIr_dCps_disEffResultTy = (fun (mc0 : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrTy Base_dData_dMaybe.t_Base_dData_dMaybe_dMaybe) -> (match mc0 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__342) -> (match dtb__342 with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyData (dtb__343, dtb__344) -> (dtb__343 = Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirEffTypeName)
  | _ -> false
)
  | _ -> false
))

# 750 "Vuna/Compiler/Ir/Cps.vuna"
let v_Vuna_dCompiler_dIr_dCps_disEffContLambda = (fun _uarity0 -> (v_Vuna_dCompiler_dIr_dCps_disEffResultTy _uarity0))

# 754 "Vuna/Compiler/Ir/Cps.vuna"
let v_Vuna_dCompiler_dIr_dCps_disEffThunkBody = (fun (mc0 : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIr) -> (match mc0 with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCtor (dtb__345, dtb__346, dtb__347, dtb__348) -> (match dtb__348 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__349, dtb__350) -> (match dtb__349 with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLam (dtb__351, dtb__352, dtb__353) -> (match dtb__350 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (if (dtb__345 = Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirEffTypeName) then (dtb__346 = Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirEffMkCtor) else false)
  | _ -> false
)
  | _ -> false
)
  | _ -> false
)
  | _ -> false
))

# 760 "Vuna/Compiler/Ir/Cps.vuna"
let v_Vuna_dCompiler_dIr_dCps_dmRunEffTerm = (fun eff k -> ((fun th -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCase (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, eff, (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltCtor = (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirEffTypeName; Base_dData_dPair.f_Base_dData_dPair_dPair_second = Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirEffMkCtor })); Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBinders = (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (th, Base_dData_dList.C_Base_dData_dList_dList_Nil)); Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBody = (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRtApp (v_Vuna_dCompiler_dIr_dCps_dirMRunEffName, (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ((Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrVar (th)), (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (k, Base_dData_dList.C_Base_dData_dList_dList_Nil)))))) }, Base_dData_dList.C_Base_dData_dList_dList_Nil))))) (v_Vuna_dCompiler_dIr_dCps_dmkBinder "__mEffTh")))

# 769 "Vuna/Compiler/Ir/Cps.vuna"
let v_Vuna_dCompiler_dIr_dCps_dmNoResumption = (v_Vuna_dCompiler_dIr_dCps_dmkBinder "@vuna@noresume")

# 774 "Vuna/Compiler/Ir/Cps.vuna"
let rec v_Vuna_dCompiler_dIr_dCps_dmEffContLambda = (fun fuel r bs rt body -> ((fun kd -> ((fun u -> ((fun v -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLam (bs, rt, (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCtor (Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirEffTypeName, Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirEffMkCtor, Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ((Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLam ((Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (u, (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (kd, Base_dData_dList.C_Base_dData_dList_dList_Nil)))), Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, ((((v_Vuna_dCompiler_dIr_dCps_dmCps (fuel - 1)) r) (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLam ((Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (v, Base_dData_dList.C_Base_dData_dList_dList_Nil)), Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, ((v_Vuna_dCompiler_dIr_dCps_dmRunEffTerm (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrVar (v))) (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrVar (kd)))))) body))), Base_dData_dList.C_Base_dData_dList_dList_Nil))))))) (v_Vuna_dCompiler_dIr_dCps_dmFreshV fuel))) (v_Vuna_dCompiler_dIr_dCps_dmkBinder "__mEffU"))) (v_Vuna_dCompiler_dIr_dCps_dmFreshK fuel)))
# 785 "Vuna/Compiler/Ir/Cps.vuna"
and v_Vuna_dCompiler_dIr_dCps_dmCpsAlts = (fun fuel r k alts -> (if (fuel <= 0) then alts else (match alts with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__354, dtb__355) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltCtor = (dtb__354).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltCtor; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBinders = (dtb__354).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBinders; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBody = ((((v_Vuna_dCompiler_dIr_dCps_dmCps (fuel - 1)) r) k) (dtb__354).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBody) }, ((((v_Vuna_dCompiler_dIr_dCps_dmCpsAlts (fuel - 1)) r) k) dtb__355)))
  | _ -> failwith "DT: impossible branch"
)))
# 794 "Vuna/Compiler/Ir/Cps.vuna"
and v_Vuna_dCompiler_dIr_dCps_dmCpsAltM = (fun fuel r k m -> (if (fuel <= 0) then m else (match m with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__356) -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ({ Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltCtor = (dtb__356).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltCtor; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBinders = (dtb__356).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBinders; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBody = ((((v_Vuna_dCompiler_dIr_dCps_dmCps (fuel - 1)) r) k) (dtb__356).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBody) }))
  | _ -> failwith "DT: impossible branch"
)))
# 810 "Vuna/Compiler/Ir/Cps.vuna"
and v_Vuna_dCompiler_dIr_dCps_dmCpsArgs = (fun fuel r k sym args acc -> (if (fuel <= 0) then (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, k, (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRtApp (sym, (Base_dData_dList.v_Base_dData_dList_dreverse acc))))) else (match args with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, k, (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRtApp (sym, (Base_dData_dList.v_Base_dData_dList_dreverse acc)))))
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__357, dtb__358) -> ((fun v -> ((((v_Vuna_dCompiler_dIr_dCps_dmCps (fuel - 1)) r) (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLam ((Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (v, Base_dData_dList.C_Base_dData_dList_dList_Nil)), Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, ((((((v_Vuna_dCompiler_dIr_dCps_dmCpsArgs (fuel - 1)) r) k) sym) dtb__358) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ((Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrVar (v)), acc)))))) dtb__357)) (v_Vuna_dCompiler_dIr_dCps_dmFreshV fuel))
  | _ -> failwith "DT: impossible branch"
)))
# 823 "Vuna/Compiler/Ir/Cps.vuna"
and v_Vuna_dCompiler_dIr_dCps_dmCpsApply = (fun fuel r k parts -> (if (fuel <= 0) then (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, k, (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrGlobal ("?")))) else ((fun nd_uscrut4 -> (match nd_uscrut4 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__359, dtb__360) -> (match dtb__360 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> ((((v_Vuna_dCompiler_dIr_dCps_dmCps (fuel - 1)) r) k) dtb__359)
  | _ -> ((fun v -> ((((v_Vuna_dCompiler_dIr_dCps_dmCps (fuel - 1)) r) (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLam ((Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (v, Base_dData_dList.C_Base_dData_dList_dList_Nil)), Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, ((((((v_Vuna_dCompiler_dIr_dCps_dmCpsApplyArgs (fuel - 1)) r) k) dtb__360) Base_dData_dList.C_Base_dData_dList_dList_Nil) v)))) dtb__359)) (v_Vuna_dCompiler_dIr_dCps_dmFreshV fuel))
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, k, (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrGlobal ("?"))))
  | _ -> failwith "DT: impossible branch"
)) parts)))
# 836 "Vuna/Compiler/Ir/Cps.vuna"
and v_Vuna_dCompiler_dIr_dCps_dmCpsApplyArgs = (fun fuel r k args acc headV -> (if (fuel <= 0) then (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, k, (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrGlobal ("?")))) else (match args with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, k, ((v_Vuna_dCompiler_dIr_dCps_dapplyAll (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrVar (headV))) (Base_dData_dList.v_Base_dData_dList_dreverse acc))))
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__361, dtb__362) -> ((fun v -> ((((v_Vuna_dCompiler_dIr_dCps_dmCps (fuel - 1)) r) (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLam ((Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (v, Base_dData_dList.C_Base_dData_dList_dList_Nil)), Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, ((((((v_Vuna_dCompiler_dIr_dCps_dmCpsApplyArgs (fuel - 1)) r) k) dtb__362) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ((Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrVar (v)), acc))) headV)))) dtb__361)) (v_Vuna_dCompiler_dIr_dCps_dmFreshV fuel))
  | _ -> failwith "DT: impossible branch"
)))
# 848 "Vuna/Compiler/Ir/Cps.vuna"
and v_Vuna_dCompiler_dIr_dCps_dmCps = (fun fuel r k e -> (if (fuel <= 0) then (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, k, e)) else (if ((v_Vuna_dCompiler_dIr_dCps_dmIsResumeApp r) e) then (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, e, k)) else (match e with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLet (dtb__363, dtb__364, dtb__365) -> ((fun v -> ((fun cont -> ((((v_Vuna_dCompiler_dIr_dCps_dmCps (fuel - 1)) r) cont) dtb__364)) (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLam ((Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (v, Base_dData_dList.C_Base_dData_dList_dList_Nil)), Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLet (dtb__363, (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrVar (v)), ((((v_Vuna_dCompiler_dIr_dCps_dmCps (fuel - 1)) r) k) dtb__365))))))) (v_Vuna_dCompiler_dIr_dCps_dmFreshV fuel))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCase (dtb__366, dtb__367, dtb__368) -> ((fun v -> ((fun cont -> ((((v_Vuna_dCompiler_dIr_dCps_dmCps (fuel - 1)) r) cont) dtb__367)) (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLam ((Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (v, Base_dData_dList.C_Base_dData_dList_dList_Nil)), Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCase (dtb__366, (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrVar (v)), ((((v_Vuna_dCompiler_dIr_dCps_dmCpsAlts (fuel - 2)) r) k) dtb__368))))))) (v_Vuna_dCompiler_dIr_dCps_dmFreshV fuel))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrIf (dtb__369, dtb__370, dtb__371) -> ((fun v -> ((fun cont -> ((((v_Vuna_dCompiler_dIr_dCps_dmCps (fuel - 1)) r) cont) dtb__369)) (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLam ((Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (v, Base_dData_dList.C_Base_dData_dList_dList_Nil)), Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrIf ((Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrVar (v)), ((((v_Vuna_dCompiler_dIr_dCps_dmCps (fuel - 2)) r) k) dtb__370), ((((v_Vuna_dCompiler_dIr_dCps_dmCps (fuel - 2)) r) k) dtb__371))))))) (v_Vuna_dCompiler_dIr_dCps_dmFreshV fuel))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrNatCase (dtb__372, dtb__373, dtb__374, dtb__375, dtb__376) -> ((fun v -> ((fun cont -> ((((v_Vuna_dCompiler_dIr_dCps_dmCps (fuel - 1)) r) cont) dtb__372)) (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLam ((Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (v, Base_dData_dList.C_Base_dData_dList_dList_Nil)), Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrNatCase ((Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrVar (v)), dtb__373, ((((v_Vuna_dCompiler_dIr_dCps_dmCpsAltM (fuel - 2)) r) k) dtb__374), ((((v_Vuna_dCompiler_dIr_dCps_dmCpsAltM (fuel - 2)) r) k) dtb__375), ((((v_Vuna_dCompiler_dIr_dCps_dmCpsAltM (fuel - 2)) r) k) dtb__376))))))) (v_Vuna_dCompiler_dIr_dCps_dmFreshV fuel))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCast (dtb__377, dtb__378, dtb__379) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCast (dtb__377, dtb__378, ((((v_Vuna_dCompiler_dIr_dCps_dmCps (fuel - 1)) r) k) dtb__379)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRtApp (dtb__380, dtb__381) -> ((((((v_Vuna_dCompiler_dIr_dCps_dmCpsArgs (fuel - 1)) r) k) dtb__380) dtb__381) Base_dData_dList.C_Base_dData_dList_dList_Nil)
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLam (dtb__382, dtb__383, dtb__384) -> (if (v_Vuna_dCompiler_dIr_dCps_disEffContLambda dtb__383) then (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, k, (((((v_Vuna_dCompiler_dIr_dCps_dmEffContLambda (fuel - 1)) r) dtb__382) dtb__383) dtb__384))) else (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, k, e)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (dtb__385, dtb__386, dtb__387) -> ((fun p -> ((((v_Vuna_dCompiler_dIr_dCps_dmCpsApply (fuel - 1)) r) k) ((Base_dData_dList.v_Base_dData_dList_dappend (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ((Base_dData_dPair.v_Base_dData_dPair_dfirstOf p), Base_dData_dList.C_Base_dData_dList_dList_Nil))) (Base_dData_dPair.v_Base_dData_dPair_dsecondOf p)))) (v_Vuna_dCompiler_dIr_dCps_dflattenApp e))
  | _ -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, k, e))
))))

# 803 "Vuna/Compiler/Ir/Cps.vuna"
let v_Vuna_dCompiler_dIr_dCps_dmIsControl = (fun (mc0 : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIr) -> (match mc0 with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrNatCase (dtb__388, dtb__389, dtb__390, dtb__391, dtb__392) -> true
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrIf (dtb__393, dtb__394, dtb__395) -> true
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCase (dtb__396, dtb__397, dtb__398) -> true
  | _ -> false
))

# 956 "Vuna/Compiler/Ir/Cps.vuna"
let v_Vuna_dCompiler_dIr_dCps_dmSym = (fun x -> (if (x = v_Vuna_dCompiler_dIr_dCps_dirCpsPerformName) then v_Vuna_dCompiler_dIr_dCps_dirMPerformName else (if (x = v_Vuna_dCompiler_dIr_dCps_dirCpsHandleName) then v_Vuna_dCompiler_dIr_dCps_dirMHandleName else (if (x = v_Vuna_dCompiler_dIr_dCps_dirCpsSelfName) then v_Vuna_dCompiler_dIr_dCps_dirMSelfName else x))))

# 962 "Vuna/Compiler/Ir/Cps.vuna"
let rec v_Vuna_dCompiler_dIr_dCps_dmSyms = (fun fuel e -> (if (fuel <= 0) then e else (match e with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRt (dtb__399) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRt ((v_Vuna_dCompiler_dIr_dCps_dmSym dtb__399)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRtApp (dtb__400, dtb__401) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRtApp ((v_Vuna_dCompiler_dIr_dCps_dmSym dtb__400), ((v_Vuna_dCompiler_dIr_dCps_dmListS (fuel - 1)) dtb__401)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCtor (dtb__402, dtb__403, dtb__404, dtb__405) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCtor (dtb__402, dtb__403, Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, ((v_Vuna_dCompiler_dIr_dCps_dmListS (fuel - 1)) dtb__405)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRecord (dtb__406, dtb__407) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRecord (dtb__406, ((v_Vuna_dCompiler_dIr_dCps_dmFieldsS (fuel - 1)) dtb__407)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrProj (dtb__408, dtb__409, dtb__410) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrProj (((v_Vuna_dCompiler_dIr_dCps_dmSyms (fuel - 1)) dtb__408), dtb__409, dtb__410))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRecUpd (dtb__411, dtb__412, dtb__413) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRecUpd (((v_Vuna_dCompiler_dIr_dCps_dmSyms (fuel - 1)) dtb__411), dtb__412, ((v_Vuna_dCompiler_dIr_dCps_dmFieldsS (fuel - 1)) dtb__413)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCast (dtb__414, dtb__415, dtb__416) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCast (dtb__414, dtb__415, ((v_Vuna_dCompiler_dIr_dCps_dmSyms (fuel - 1)) dtb__416)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLet (dtb__417, dtb__418, dtb__419) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLet (dtb__417, ((v_Vuna_dCompiler_dIr_dCps_dmSyms (fuel - 1)) dtb__418), ((v_Vuna_dCompiler_dIr_dCps_dmSyms (fuel - 1)) dtb__419)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLam (dtb__420, dtb__421, dtb__422) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLam (dtb__420, dtb__421, ((v_Vuna_dCompiler_dIr_dCps_dmSyms (fuel - 1)) dtb__422)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (dtb__423, dtb__424, dtb__425) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, ((v_Vuna_dCompiler_dIr_dCps_dmSyms (fuel - 1)) dtb__424), ((v_Vuna_dCompiler_dIr_dCps_dmSyms (fuel - 1)) dtb__425)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrIf (dtb__426, dtb__427, dtb__428) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrIf (((v_Vuna_dCompiler_dIr_dCps_dmSyms (fuel - 1)) dtb__426), ((v_Vuna_dCompiler_dIr_dCps_dmSyms (fuel - 1)) dtb__427), ((v_Vuna_dCompiler_dIr_dCps_dmSyms (fuel - 1)) dtb__428)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCase (dtb__429, dtb__430, dtb__431) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCase (dtb__429, ((v_Vuna_dCompiler_dIr_dCps_dmSyms (fuel - 1)) dtb__430), ((v_Vuna_dCompiler_dIr_dCps_dmSymsAltsM (fuel - 1)) dtb__431)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrNatCase (dtb__432, dtb__433, dtb__434, dtb__435, dtb__436) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrNatCase (((v_Vuna_dCompiler_dIr_dCps_dmSyms (fuel - 1)) dtb__432), dtb__433, ((v_Vuna_dCompiler_dIr_dCps_dmSymsAltMM (fuel - 1)) dtb__434), ((v_Vuna_dCompiler_dIr_dCps_dmSymsAltMM (fuel - 1)) dtb__435), ((v_Vuna_dCompiler_dIr_dCps_dmSymsAltMM (fuel - 1)) dtb__436)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrConcatMany (dtb__437) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrConcatMany (((v_Vuna_dCompiler_dIr_dCps_dmListS (fuel - 1)) dtb__437)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrEffThunk (dtb__438, dtb__439, dtb__440, dtb__441, dtb__442) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrEffThunk (dtb__438, dtb__439, dtb__440, dtb__441, ((v_Vuna_dCompiler_dIr_dCps_dmSyms (fuel - 1)) dtb__442)))
  | _ -> e
)))
# 985 "Vuna/Compiler/Ir/Cps.vuna"
and v_Vuna_dCompiler_dIr_dCps_dmListS = (fun fuel xs -> (if (fuel <= 0) then xs else (match xs with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__443, dtb__444) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (((v_Vuna_dCompiler_dIr_dCps_dmSyms (fuel - 1)) dtb__443), ((v_Vuna_dCompiler_dIr_dCps_dmListS (fuel - 1)) dtb__444)))
  | _ -> failwith "DT: impossible branch"
)))
# 994 "Vuna/Compiler/Ir/Cps.vuna"
and v_Vuna_dCompiler_dIr_dCps_dmFieldsS = (fun fuel fs -> (if (fuel <= 0) then fs else (match fs with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__445, dtb__446) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Base_dData_dPair.v_Base_dData_dPair_dfirstOf dtb__445); Base_dData_dPair.f_Base_dData_dPair_dPair_second = ((v_Vuna_dCompiler_dIr_dCps_dmSyms (fuel - 1)) (Base_dData_dPair.v_Base_dData_dPair_dsecondOf dtb__445)) }, ((v_Vuna_dCompiler_dIr_dCps_dmFieldsS (fuel - 1)) dtb__446)))
  | _ -> failwith "DT: impossible branch"
)))
# 1003 "Vuna/Compiler/Ir/Cps.vuna"
and v_Vuna_dCompiler_dIr_dCps_dmSymsAltsM = (fun fuel alts -> (if (fuel <= 0) then alts else (match alts with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__447, dtb__448) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltCtor = (dtb__447).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltCtor; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBinders = (dtb__447).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBinders; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBody = ((v_Vuna_dCompiler_dIr_dCps_dmSyms (fuel - 1)) (dtb__447).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBody) }, ((v_Vuna_dCompiler_dIr_dCps_dmSymsAltsM (fuel - 1)) dtb__448)))
  | _ -> failwith "DT: impossible branch"
)))
# 1012 "Vuna/Compiler/Ir/Cps.vuna"
and v_Vuna_dCompiler_dIr_dCps_dmSymsAltMM = (fun fuel m -> (if (fuel <= 0) then m else (match m with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__449) -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ({ Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltCtor = (dtb__449).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltCtor; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBinders = (dtb__449).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBinders; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBody = ((v_Vuna_dCompiler_dIr_dCps_dmSyms (fuel - 1)) (dtb__449).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBody) }))
  | _ -> failwith "DT: impossible branch"
)))

# 1021 "Vuna/Compiler/Ir/Cps.vuna"
let v_Vuna_dCompiler_dIr_dCps_dmDoneCont = ((fun v -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLam ((Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (v, Base_dData_dList.C_Base_dData_dList_dList_Nil)), Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRt (v_Vuna_dCompiler_dIr_dCps_dirMDoneName)), (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrVar (v))))))) (v_Vuna_dCompiler_dIr_dCps_dmkBinder "__mDoneV"))

# 1027 "Vuna/Compiler/Ir/Cps.vuna"
let rec v_Vuna_dCompiler_dIr_dCps_dmTrampolineBody = (fun (mc0 : string) (mc1 : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIr) -> (match mc1 with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (dtb__450, dtb__451, dtb__452) -> (match dtb__451 with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (dtb__453, dtb__454, dtb__455) -> (match dtb__454 with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (dtb__456, dtb__457, dtb__458) -> (match dtb__457 with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrGlobal (dtb__459) -> (if (dtb__459 = v_Vuna_dCompiler_dIr_dCps_drunThunkName) then (Base_dData_dResult.C_Base_dData_dResult_dResult_Ok ((Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRt (v_Vuna_dCompiler_dIr_dCps_dirMRunName)), ((v_Vuna_dCompiler_dIr_dCps_dapplyAll (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrGlobal (dtb__459))) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__458, (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__455, (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (v_Vuna_dCompiler_dIr_dCps_dmDoneCont, Base_dData_dList.C_Base_dData_dList_dList_Nil))))))))))) else (Base_dData_dResult.C_Base_dData_dResult_dResult_Err (("machine CPS: unexpected trampoline shape: " ^ mc0))))
  | _ -> (Base_dData_dResult.C_Base_dData_dResult_dResult_Err (("machine CPS: unexpected trampoline shape: " ^ mc0)))
)
  | _ -> (Base_dData_dResult.C_Base_dData_dResult_dResult_Err (("machine CPS: unexpected trampoline shape: " ^ mc0)))
)
  | _ -> (Base_dData_dResult.C_Base_dData_dResult_dResult_Err (("machine CPS: unexpected trampoline shape: " ^ mc0)))
)
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCast (dtb__460, dtb__461, dtb__462) -> (match ((v_Vuna_dCompiler_dIr_dCps_dmTrampolineBody mc0) dtb__462) with
  | Base_dData_dResult.C_Base_dData_dResult_dResult_Err (dtb__463) -> (Base_dData_dResult.C_Base_dData_dResult_dResult_Err (dtb__463))
  | Base_dData_dResult.C_Base_dData_dResult_dResult_Ok (dtb__464) -> (Base_dData_dResult.C_Base_dData_dResult_dResult_Ok ((Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCast (dtb__460, dtb__461, dtb__464))))
  | _ -> failwith "DT: impossible branch"
)
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLam (dtb__465, dtb__466, dtb__467) -> (match ((v_Vuna_dCompiler_dIr_dCps_dmTrampolineBody mc0) dtb__467) with
  | Base_dData_dResult.C_Base_dData_dResult_dResult_Err (dtb__468) -> (Base_dData_dResult.C_Base_dData_dResult_dResult_Err (dtb__468))
  | Base_dData_dResult.C_Base_dData_dResult_dResult_Ok (dtb__469) -> (Base_dData_dResult.C_Base_dData_dResult_dResult_Ok ((Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLam (dtb__465, dtb__466, dtb__469))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> (Base_dData_dResult.C_Base_dData_dResult_dResult_Err (("machine CPS: unexpected trampoline shape: " ^ mc0)))
))

# 1049 "Vuna/Compiler/Ir/Cps.vuna"
let v_Vuna_dCompiler_dIr_dCps_dmBodyOf = (fun d -> (match (Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirDefBody d) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__470) -> dtb__470
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrInt (0))
  | _ -> failwith "DT: impossible branch"
))

# 1059 "Vuna/Compiler/Ir/Cps.vuna"
let rec v_Vuna_dCompiler_dIr_dCps_ddefArities = (fun fuel ds -> (if (fuel <= 0) then Base_dData_dList.C_Base_dData_dList_dList_Nil else (match ds with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__471, dtb__472) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirDefName dtb__471); Base_dData_dPair.f_Base_dData_dPair_dPair_second = (Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirDefArity dtb__471) }, ((v_Vuna_dCompiler_dIr_dCps_ddefArities (fuel - 1)) dtb__472)))
  | _ -> failwith "DT: impossible branch"
)))

# 1068 "Vuna/Compiler/Ir/Cps.vuna"
let rec v_Vuna_dCompiler_dIr_dCps_ddefSigs = (fun fuel ds -> (if (fuel <= 0) then Base_dData_dList.C_Base_dData_dList_dList_Nil else (match ds with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__473, dtb__474) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirDefName dtb__473); Base_dData_dPair.f_Base_dData_dPair_dPair_second = (Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirDefTy dtb__473) }, ((v_Vuna_dCompiler_dIr_dCps_ddefSigs (fuel - 1)) dtb__474)))
  | _ -> failwith "DT: impossible branch"
)))

# 1077 "Vuna/Compiler/Ir/Cps.vuna"
let v_Vuna_dCompiler_dIr_dCps_dhandlerTables = (fun fuel ds -> { f_Vuna_dCompiler_dIr_dCps_dHandlerTables_htArities = ((v_Vuna_dCompiler_dIr_dCps_ddefArities fuel) ds); f_Vuna_dCompiler_dIr_dCps_dHandlerTables_htSigs = ((v_Vuna_dCompiler_dIr_dCps_ddefSigs fuel) ds) })

# 1080 "Vuna/Compiler/Ir/Cps.vuna"
let rec v_Vuna_dCompiler_dIr_dCps_darityOf = (fun (mc0 : (string, int) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (mc1 : string) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__475, dtb__476) -> (if ((Base_dData_dPair.v_Base_dData_dPair_dfirstOf dtb__475) = mc1) then (Base_dData_dPair.v_Base_dData_dPair_dsecondOf dtb__475) else ((v_Vuna_dCompiler_dIr_dCps_darityOf dtb__476) mc1))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))

# 1084 "Vuna/Compiler/Ir/Cps.vuna"
let rec v_Vuna_dCompiler_dIr_dCps_dsigOf = (fun (mc0 : (string, Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrTy Base_dData_dMaybe.t_Base_dData_dMaybe_dMaybe) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (mc1 : string) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__477, dtb__478) -> (if ((Base_dData_dPair.v_Base_dData_dPair_dfirstOf dtb__477) = mc1) then (Base_dData_dPair.v_Base_dData_dPair_dsecondOf dtb__477) else ((v_Vuna_dCompiler_dIr_dCps_dsigOf dtb__478) mc1))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 1088 "Vuna/Compiler/Ir/Cps.vuna"
let rec v_Vuna_dCompiler_dIr_dCps_dfunArity = (fun (mc0 : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrTy) -> (match mc0 with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyFun (dtb__479, dtb__480) -> (1 + (v_Vuna_dCompiler_dIr_dCps_dfunArity dtb__480))
  | _ -> 0
))

# 1092 "Vuna/Compiler/Ir/Cps.vuna"
let rec v_Vuna_dCompiler_dIr_dCps_dfunResult = (fun (mc0 : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrTy) -> (match mc0 with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyFun (dtb__481, dtb__482) -> (v_Vuna_dCompiler_dIr_dCps_dfunResult dtb__482)
  | _ -> mc0
))

# 1096 "Vuna/Compiler/Ir/Cps.vuna"
let v_Vuna_dCompiler_dIr_dCps_disFunTy = (fun (mc0 : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrTy) -> (match mc0 with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyFun (dtb__483, dtb__484) -> true
  | _ -> false
))

# 1103 "Vuna/Compiler/Ir/Cps.vuna"
let v_Vuna_dCompiler_dIr_dCps_disClauseTy = (fun (mc0 : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrTy) -> (match mc0 with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyFun (dtb__485, dtb__486) -> (match dtb__486 with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyFun (dtb__487, dtb__488) -> (v_Vuna_dCompiler_dIr_dCps_disFunTy dtb__487)
  | _ -> false
)
  | _ -> false
))

# 1112 "Vuna/Compiler/Ir/Cps.vuna"
let rec v_Vuna_dCompiler_dIr_dCps_dhasClauseParam = (fun (mc0 : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrTy) -> (match mc0 with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyFun (dtb__489, dtb__490) -> (if (v_Vuna_dCompiler_dIr_dCps_disClauseTy dtb__489) then true else (v_Vuna_dCompiler_dIr_dCps_dhasClauseParam dtb__490))
  | _ -> false
))

# 1108 "Vuna/Compiler/Ir/Cps.vuna"
let v_Vuna_dCompiler_dIr_dCps_disHandlerCombinatorTy = (fun ty -> (if (if ((v_Vuna_dCompiler_dIr_dCps_dfunArity ty) >= 2) then (v_Vuna_dCompiler_dIr_dCps_disEffResultTy (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ((v_Vuna_dCompiler_dIr_dCps_dfunResult ty)))) else false) then (v_Vuna_dCompiler_dIr_dCps_dhasClauseParam ty) else false))

# 1116 "Vuna/Compiler/Ir/Cps.vuna"
let v_Vuna_dCompiler_dIr_dCps_disHandleCombinator = (fun t n -> (match ((v_Vuna_dCompiler_dIr_dCps_dsigOf (t).f_Vuna_dCompiler_dIr_dCps_dHandlerTables_htSigs) n) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__491) -> (if ((v_Vuna_dCompiler_dIr_dCps_dfunArity dtb__491) = 0) then (if ((Base_dData_dString.v_Base_dData_dString_dstartsWith "Base.Effect.") n) then ((Base_dData_dString.v_Base_dData_dString_dcontains "handle") n) else false) else (v_Vuna_dCompiler_dIr_dCps_disHandlerCombinatorTy dtb__491))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (if ((Base_dData_dString.v_Base_dData_dString_dstartsWith "Base.Effect.") n) then ((Base_dData_dString.v_Base_dData_dString_dcontains "handle") n) else false)
  | _ -> failwith "DT: impossible branch"
))

# 1126 "Vuna/Compiler/Ir/Cps.vuna"
let v_Vuna_dCompiler_dIr_dCps_dclauseArityOf = (fun t n -> (match ((v_Vuna_dCompiler_dIr_dCps_dsigOf (t).f_Vuna_dCompiler_dIr_dCps_dHandlerTables_htSigs) n) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__492) -> (if ((v_Vuna_dCompiler_dIr_dCps_dfunArity dtb__492) > 0) then (v_Vuna_dCompiler_dIr_dCps_dfunArity dtb__492) else ((v_Vuna_dCompiler_dIr_dCps_darityOf (t).f_Vuna_dCompiler_dIr_dCps_dHandlerTables_htArities) n))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> ((v_Vuna_dCompiler_dIr_dCps_darityOf (t).f_Vuna_dCompiler_dIr_dCps_dHandlerTables_htArities) n)
  | _ -> failwith "DT: impossible branch"
))

# 1132 "Vuna/Compiler/Ir/Cps.vuna"
let v_Vuna_dCompiler_dIr_dCps_disClauseGlobal = (fun t n -> (match ((v_Vuna_dCompiler_dIr_dCps_dsigOf (t).f_Vuna_dCompiler_dIr_dCps_dHandlerTables_htSigs) n) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__493) -> (if ((v_Vuna_dCompiler_dIr_dCps_dfunArity dtb__493) > 0) then (v_Vuna_dCompiler_dIr_dCps_disClauseTy dtb__493) else (((v_Vuna_dCompiler_dIr_dCps_darityOf (t).f_Vuna_dCompiler_dIr_dCps_dHandlerTables_htArities) n) >= 2))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (((v_Vuna_dCompiler_dIr_dCps_darityOf (t).f_Vuna_dCompiler_dIr_dCps_dHandlerTables_htArities) n) >= 2)
  | _ -> failwith "DT: impossible branch"
))

# 1155 "Vuna/Compiler/Ir/Cps.vuna"
let rec v_Vuna_dCompiler_dIr_dCps_dlenOf = (fun xs -> (match xs with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> 0
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__494, dtb__495) -> (1 + (v_Vuna_dCompiler_dIr_dCps_dlenOf dtb__495))
  | _ -> failwith "DT: impossible branch"
))

# 1161 "Vuna/Compiler/Ir/Cps.vuna"
let v_Vuna_dCompiler_dIr_dCps_dfuelOf = (fun _u -> 1)

# 1138 "Vuna/Compiler/Ir/Cps.vuna"
let rec v_Vuna_dCompiler_dIr_dCps_dclauseGlobals = (fun t args -> (if ((v_Vuna_dCompiler_dIr_dCps_dfuelOf args) <= 0) then Base_dData_dList.C_Base_dData_dList_dList_Nil else (match args with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__496, dtb__497) -> (match dtb__496 with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrGlobal (dtb__498) -> (if (if ((v_Vuna_dCompiler_dIr_dCps_disClauseGlobal t) dtb__498) then (((v_Vuna_dCompiler_dIr_dCps_dclauseArityOf t) dtb__498) >= 2) else false) then (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__498, ((v_Vuna_dCompiler_dIr_dCps_dclauseGlobals t) dtb__497))) else ((v_Vuna_dCompiler_dIr_dCps_dclauseGlobals t) dtb__497))
  | _ -> ((fun nd_uscrut5 -> (match nd_uscrut5 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__499; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__500 } -> (match dtb__499 with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrGlobal (dtb__501) -> (if (if ((v_Vuna_dCompiler_dIr_dCps_disClauseGlobal t) dtb__501) then ((((v_Vuna_dCompiler_dIr_dCps_dclauseArityOf t) dtb__501) - (v_Vuna_dCompiler_dIr_dCps_dlenOf dtb__500)) >= 2) else false) then (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__501, ((v_Vuna_dCompiler_dIr_dCps_dclauseGlobals t) dtb__497))) else ((v_Vuna_dCompiler_dIr_dCps_dclauseGlobals t) dtb__497))
  | _ -> ((v_Vuna_dCompiler_dIr_dCps_dclauseGlobals t) dtb__497)
)
  | _ -> failwith "DT: impossible branch"
)) (v_Vuna_dCompiler_dIr_dCps_dflattenApp dtb__496))
)
  | _ -> failwith "DT: impossible branch"
)))

# 1164 "Vuna/Compiler/Ir/Cps.vuna"
let rec v_Vuna_dCompiler_dIr_dCps_dcollectHandlerGlobals = (fun t fuel e -> (if (fuel <= 0) then Base_dData_dList.C_Base_dData_dList_dList_Nil else (match e with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (dtb__502, dtb__503, dtb__504) -> ((fun p -> ((fun head -> ((fun args -> ((fun here -> ((Base_dData_dList.v_Base_dData_dList_dappend here) ((Base_dData_dList.v_Base_dData_dList_dappend (((v_Vuna_dCompiler_dIr_dCps_dcollectHandlerGlobals t) (fuel - 1)) head)) (((v_Vuna_dCompiler_dIr_dCps_dcollectHandlerGlobalsList t) (fuel - 1)) args)))) (match head with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrGlobal (dtb__505) -> (if ((v_Vuna_dCompiler_dIr_dCps_disHandleCombinator t) dtb__505) then ((v_Vuna_dCompiler_dIr_dCps_dclauseGlobals t) args) else Base_dData_dList.C_Base_dData_dList_dList_Nil)
  | _ -> Base_dData_dList.C_Base_dData_dList_dList_Nil
))) (Base_dData_dPair.v_Base_dData_dPair_dsecondOf p))) (Base_dData_dPair.v_Base_dData_dPair_dfirstOf p))) (v_Vuna_dCompiler_dIr_dCps_dflattenApp e))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCtor (dtb__506, dtb__507, dtb__508, dtb__509) -> (((v_Vuna_dCompiler_dIr_dCps_dcollectHandlerGlobalsList t) (fuel - 1)) dtb__509)
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRecord (dtb__510, dtb__511) -> (((v_Vuna_dCompiler_dIr_dCps_dcollectHandlerGlobalsFields t) (fuel - 1)) dtb__511)
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrProj (dtb__512, dtb__513, dtb__514) -> (((v_Vuna_dCompiler_dIr_dCps_dcollectHandlerGlobals t) (fuel - 1)) dtb__512)
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRecUpd (dtb__515, dtb__516, dtb__517) -> ((Base_dData_dList.v_Base_dData_dList_dappend (((v_Vuna_dCompiler_dIr_dCps_dcollectHandlerGlobals t) (fuel - 1)) dtb__515)) (((v_Vuna_dCompiler_dIr_dCps_dcollectHandlerGlobalsFields t) (fuel - 1)) dtb__517))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRtApp (dtb__518, dtb__519) -> (((v_Vuna_dCompiler_dIr_dCps_dcollectHandlerGlobalsList t) (fuel - 1)) dtb__519)
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCast (dtb__520, dtb__521, dtb__522) -> (((v_Vuna_dCompiler_dIr_dCps_dcollectHandlerGlobals t) (fuel - 1)) dtb__522)
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLet (dtb__523, dtb__524, dtb__525) -> ((Base_dData_dList.v_Base_dData_dList_dappend (((v_Vuna_dCompiler_dIr_dCps_dcollectHandlerGlobals t) (fuel - 1)) dtb__524)) (((v_Vuna_dCompiler_dIr_dCps_dcollectHandlerGlobals t) (fuel - 1)) dtb__525))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLam (dtb__526, dtb__527, dtb__528) -> (((v_Vuna_dCompiler_dIr_dCps_dcollectHandlerGlobals t) (fuel - 1)) dtb__528)
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrIf (dtb__529, dtb__530, dtb__531) -> ((Base_dData_dList.v_Base_dData_dList_dappend (((v_Vuna_dCompiler_dIr_dCps_dcollectHandlerGlobals t) (fuel - 1)) dtb__529)) ((Base_dData_dList.v_Base_dData_dList_dappend (((v_Vuna_dCompiler_dIr_dCps_dcollectHandlerGlobals t) (fuel - 1)) dtb__530)) (((v_Vuna_dCompiler_dIr_dCps_dcollectHandlerGlobals t) (fuel - 1)) dtb__531)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCase (dtb__532, dtb__533, dtb__534) -> ((Base_dData_dList.v_Base_dData_dList_dappend (((v_Vuna_dCompiler_dIr_dCps_dcollectHandlerGlobals t) (fuel - 1)) dtb__533)) (((v_Vuna_dCompiler_dIr_dCps_dcollectHandlerGlobalsAlts t) (fuel - 1)) dtb__534))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrNatCase (dtb__535, dtb__536, dtb__537, dtb__538, dtb__539) -> ((Base_dData_dList.v_Base_dData_dList_dappend (((v_Vuna_dCompiler_dIr_dCps_dcollectHandlerGlobals t) (fuel - 1)) dtb__535)) ((Base_dData_dList.v_Base_dData_dList_dappend (((v_Vuna_dCompiler_dIr_dCps_dcollectHandlerGlobalsAltM t) (fuel - 1)) dtb__537)) ((Base_dData_dList.v_Base_dData_dList_dappend (((v_Vuna_dCompiler_dIr_dCps_dcollectHandlerGlobalsAltM t) (fuel - 1)) dtb__538)) (((v_Vuna_dCompiler_dIr_dCps_dcollectHandlerGlobalsAltM t) (fuel - 1)) dtb__539))))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrConcatMany (dtb__540) -> (((v_Vuna_dCompiler_dIr_dCps_dcollectHandlerGlobalsList t) (fuel - 1)) dtb__540)
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrEffThunk (dtb__541, dtb__542, dtb__543, dtb__544, dtb__545) -> (((v_Vuna_dCompiler_dIr_dCps_dcollectHandlerGlobals t) (fuel - 1)) dtb__545)
  | _ -> Base_dData_dList.C_Base_dData_dList_dList_Nil
)))
# 1195 "Vuna/Compiler/Ir/Cps.vuna"
and v_Vuna_dCompiler_dIr_dCps_dcollectHandlerGlobalsList = (fun t fuel xs -> (if (fuel <= 0) then Base_dData_dList.C_Base_dData_dList_dList_Nil else (match xs with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__546, dtb__547) -> ((Base_dData_dList.v_Base_dData_dList_dappend (((v_Vuna_dCompiler_dIr_dCps_dcollectHandlerGlobals t) (fuel - 1)) dtb__546)) (((v_Vuna_dCompiler_dIr_dCps_dcollectHandlerGlobalsList t) (fuel - 1)) dtb__547))
  | _ -> failwith "DT: impossible branch"
)))
# 1204 "Vuna/Compiler/Ir/Cps.vuna"
and v_Vuna_dCompiler_dIr_dCps_dcollectHandlerGlobalsFields = (fun t fuel fs -> (if (fuel <= 0) then Base_dData_dList.C_Base_dData_dList_dList_Nil else (match fs with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__548, dtb__549) -> ((Base_dData_dList.v_Base_dData_dList_dappend (((v_Vuna_dCompiler_dIr_dCps_dcollectHandlerGlobals t) (fuel - 1)) (Base_dData_dPair.v_Base_dData_dPair_dsecondOf dtb__548))) (((v_Vuna_dCompiler_dIr_dCps_dcollectHandlerGlobalsFields t) (fuel - 1)) dtb__549))
  | _ -> failwith "DT: impossible branch"
)))
# 1213 "Vuna/Compiler/Ir/Cps.vuna"
and v_Vuna_dCompiler_dIr_dCps_dcollectHandlerGlobalsAlts = (fun t fuel alts -> (if (fuel <= 0) then Base_dData_dList.C_Base_dData_dList_dList_Nil else (match alts with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__550, dtb__551) -> ((Base_dData_dList.v_Base_dData_dList_dappend (((v_Vuna_dCompiler_dIr_dCps_dcollectHandlerGlobals t) (fuel - 1)) (dtb__550).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBody)) (((v_Vuna_dCompiler_dIr_dCps_dcollectHandlerGlobalsAlts t) (fuel - 1)) dtb__551))
  | _ -> failwith "DT: impossible branch"
)))
# 1222 "Vuna/Compiler/Ir/Cps.vuna"
and v_Vuna_dCompiler_dIr_dCps_dcollectHandlerGlobalsAltM = (fun t fuel m -> (if (fuel <= 0) then Base_dData_dList.C_Base_dData_dList_dList_Nil else (match m with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__552) -> (((v_Vuna_dCompiler_dIr_dCps_dcollectHandlerGlobals t) (fuel - 1)) (dtb__552).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBody)
  | _ -> failwith "DT: impossible branch"
)))

# 1237 "Vuna/Compiler/Ir/Cps.vuna"
let rec v_Vuna_dCompiler_dIr_dCps_dcollectHandleOpsDefsGo = (fun fuel t ds -> (if (fuel <= 0) then Base_dData_dList.C_Base_dData_dList_dList_Nil else (match ds with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__553, dtb__554) -> ((Base_dData_dList.v_Base_dData_dList_dappend (((v_Vuna_dCompiler_dIr_dCps_dcollectHandlerGlobals t) (fuel - 1)) (v_Vuna_dCompiler_dIr_dCps_dmBodyOf dtb__553))) (((v_Vuna_dCompiler_dIr_dCps_dcollectHandleOpsDefsGo (fuel - 1)) t) dtb__554))
  | _ -> failwith "DT: impossible branch"
)))

# 1231 "Vuna/Compiler/Ir/Cps.vuna"
let v_Vuna_dCompiler_dIr_dCps_dcollectHandleOpsDefs = (fun fuel ds -> ((fun tables -> (((v_Vuna_dCompiler_dIr_dCps_dcollectHandleOpsDefsGo fuel) tables) ds)) ((v_Vuna_dCompiler_dIr_dCps_dhandlerTables 100000) ds)))

# 1246 "Vuna/Compiler/Ir/Cps.vuna"
let rec v_Vuna_dCompiler_dIr_dCps_dmemName = (fun (mc0 : string) (mc1 : string Base_dData_dList.t_Base_dData_dList_dList) -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__555, dtb__556) -> (if (mc0 = dtb__555) then true else ((v_Vuna_dCompiler_dIr_dCps_dmemName mc0) dtb__556))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 1252 "Vuna/Compiler/Ir/Cps.vuna"
let v_Vuna_dCompiler_dIr_dCps_dscopedName = "Base.Effect.Core.handleScoped"

# 1255 "Vuna/Compiler/Ir/Cps.vuna"
let v_Vuna_dCompiler_dIr_dCps_dselfName = "Base.Effect.Core.handleSelf"

# 1258 "Vuna/Compiler/Ir/Cps.vuna"
let v_Vuna_dCompiler_dIr_dCps_dscopeName = "Base.Effect.Core.scope"

# 1261 "Vuna/Compiler/Ir/Cps.vuna"
let v_Vuna_dCompiler_dIr_dCps_dcleanupPushName = "Base.Effect.Core.pushCleanup"

# 1264 "Vuna/Compiler/Ir/Cps.vuna"
let v_Vuna_dCompiler_dIr_dCps_dcleanupPopName = "Base.Effect.Core.popCleanup"

# 1267 "Vuna/Compiler/Ir/Cps.vuna"
let rec v_Vuna_dCompiler_dIr_dCps_dmScopedCalls = (fun fuel rs e -> (if (fuel <= 0) then e else (match e with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (dtb__557, dtb__558, dtb__559) -> ((fun f1 -> ((fun a1 -> (match f1 with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrGlobal (dtb__560) -> (if (dtb__560 = v_Vuna_dCompiler_dIr_dCps_dscopedName) then (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrVar (rs)), a1)) else (if (dtb__560 = v_Vuna_dCompiler_dIr_dCps_dselfName) then (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrVar (rs)), (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrGlobal (v_Vuna_dCompiler_dIr_dCps_dscopeName)), a1)))) else (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, f1, a1))))
  | _ -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, f1, a1))
)) (((v_Vuna_dCompiler_dIr_dCps_dmScopedCalls (fuel - 1)) rs) dtb__559))) (((v_Vuna_dCompiler_dIr_dCps_dmScopedCalls (fuel - 1)) rs) dtb__558))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRtApp (dtb__561, dtb__562) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRtApp (dtb__561, (((v_Vuna_dCompiler_dIr_dCps_dmScopedList (fuel - 1)) rs) dtb__562)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCtor (dtb__563, dtb__564, dtb__565, dtb__566) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCtor (dtb__563, dtb__564, Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, (((v_Vuna_dCompiler_dIr_dCps_dmScopedList (fuel - 1)) rs) dtb__566)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRecord (dtb__567, dtb__568) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRecord (dtb__567, (((v_Vuna_dCompiler_dIr_dCps_dmScopedFields (fuel - 1)) rs) dtb__568)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrProj (dtb__569, dtb__570, dtb__571) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrProj ((((v_Vuna_dCompiler_dIr_dCps_dmScopedCalls (fuel - 1)) rs) dtb__569), dtb__570, dtb__571))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRecUpd (dtb__572, dtb__573, dtb__574) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRecUpd ((((v_Vuna_dCompiler_dIr_dCps_dmScopedCalls (fuel - 1)) rs) dtb__572), dtb__573, (((v_Vuna_dCompiler_dIr_dCps_dmScopedFields (fuel - 1)) rs) dtb__574)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCast (dtb__575, dtb__576, dtb__577) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCast (dtb__575, dtb__576, (((v_Vuna_dCompiler_dIr_dCps_dmScopedCalls (fuel - 1)) rs) dtb__577)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLet (dtb__578, dtb__579, dtb__580) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLet (dtb__578, (((v_Vuna_dCompiler_dIr_dCps_dmScopedCalls (fuel - 1)) rs) dtb__579), (((v_Vuna_dCompiler_dIr_dCps_dmScopedCalls (fuel - 1)) rs) dtb__580)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLam (dtb__581, dtb__582, dtb__583) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLam (dtb__581, dtb__582, (((v_Vuna_dCompiler_dIr_dCps_dmScopedCalls (fuel - 1)) rs) dtb__583)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrIf (dtb__584, dtb__585, dtb__586) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrIf ((((v_Vuna_dCompiler_dIr_dCps_dmScopedCalls (fuel - 1)) rs) dtb__584), (((v_Vuna_dCompiler_dIr_dCps_dmScopedCalls (fuel - 1)) rs) dtb__585), (((v_Vuna_dCompiler_dIr_dCps_dmScopedCalls (fuel - 1)) rs) dtb__586)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCase (dtb__587, dtb__588, dtb__589) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCase (dtb__587, (((v_Vuna_dCompiler_dIr_dCps_dmScopedCalls (fuel - 1)) rs) dtb__588), (((v_Vuna_dCompiler_dIr_dCps_dmScopedAlts (fuel - 1)) rs) dtb__589)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrNatCase (dtb__590, dtb__591, dtb__592, dtb__593, dtb__594) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrNatCase ((((v_Vuna_dCompiler_dIr_dCps_dmScopedCalls (fuel - 1)) rs) dtb__590), dtb__591, (((v_Vuna_dCompiler_dIr_dCps_dmScopedAltM (fuel - 1)) rs) dtb__592), (((v_Vuna_dCompiler_dIr_dCps_dmScopedAltM (fuel - 1)) rs) dtb__593), (((v_Vuna_dCompiler_dIr_dCps_dmScopedAltM (fuel - 1)) rs) dtb__594)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrConcatMany (dtb__595) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrConcatMany ((((v_Vuna_dCompiler_dIr_dCps_dmScopedList (fuel - 1)) rs) dtb__595)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrEffThunk (dtb__596, dtb__597, dtb__598, dtb__599, dtb__600) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrEffThunk (dtb__596, dtb__597, dtb__598, dtb__599, (((v_Vuna_dCompiler_dIr_dCps_dmScopedCalls (fuel - 1)) rs) dtb__600)))
  | _ -> e
)))
# 1295 "Vuna/Compiler/Ir/Cps.vuna"
and v_Vuna_dCompiler_dIr_dCps_dmScopedList = (fun fuel rs xs -> (if (fuel <= 0) then xs else (match xs with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__601, dtb__602) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ((((v_Vuna_dCompiler_dIr_dCps_dmScopedCalls (fuel - 1)) rs) dtb__601), (((v_Vuna_dCompiler_dIr_dCps_dmScopedList (fuel - 1)) rs) dtb__602)))
  | _ -> failwith "DT: impossible branch"
)))
# 1304 "Vuna/Compiler/Ir/Cps.vuna"
and v_Vuna_dCompiler_dIr_dCps_dmScopedFields = (fun fuel rs fs -> (if (fuel <= 0) then fs else (match fs with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__603, dtb__604) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Base_dData_dPair.v_Base_dData_dPair_dfirstOf dtb__603); Base_dData_dPair.f_Base_dData_dPair_dPair_second = (((v_Vuna_dCompiler_dIr_dCps_dmScopedCalls (fuel - 1)) rs) (Base_dData_dPair.v_Base_dData_dPair_dsecondOf dtb__603)) }, (((v_Vuna_dCompiler_dIr_dCps_dmScopedFields (fuel - 1)) rs) dtb__604)))
  | _ -> failwith "DT: impossible branch"
)))
# 1313 "Vuna/Compiler/Ir/Cps.vuna"
and v_Vuna_dCompiler_dIr_dCps_dmScopedAlts = (fun fuel rs alts -> (if (fuel <= 0) then alts else (match alts with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__605, dtb__606) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltCtor = (dtb__605).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltCtor; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBinders = (dtb__605).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBinders; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBody = (((v_Vuna_dCompiler_dIr_dCps_dmScopedCalls (fuel - 1)) rs) (dtb__605).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBody) }, (((v_Vuna_dCompiler_dIr_dCps_dmScopedAlts (fuel - 1)) rs) dtb__606)))
  | _ -> failwith "DT: impossible branch"
)))
# 1322 "Vuna/Compiler/Ir/Cps.vuna"
and v_Vuna_dCompiler_dIr_dCps_dmScopedAltM = (fun fuel rs m -> (if (fuel <= 0) then m else (match m with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__607) -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ({ Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltCtor = (dtb__607).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltCtor; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBinders = (dtb__607).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBinders; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBody = (((v_Vuna_dCompiler_dIr_dCps_dmScopedCalls (fuel - 1)) rs) (dtb__607).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBody) }))
  | _ -> failwith "DT: impossible branch"
)))

# 885 "Vuna/Compiler/Ir/Cps.vuna"
let rec v_Vuna_dCompiler_dIr_dCps_dmHandlerLam = (fun fuel bs body -> (match (v_Vuna_dCompiler_dIr_dCps_dmResumption bs) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLam (bs, Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, ((v_Vuna_dCompiler_dIr_dCps_dmHandlers (fuel - 1)) body)))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__608) -> ((fun kd -> ((fun rs -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLam (((Base_dData_dList.v_Base_dData_dList_dappend bs) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (kd, (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (rs, Base_dData_dList.C_Base_dData_dList_dList_Nil))))), Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, (((v_Vuna_dCompiler_dIr_dCps_dmScopedCalls (fuel - 1)) rs) ((((v_Vuna_dCompiler_dIr_dCps_dmCps (fuel - 1)) dtb__608) (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrVar (kd))) body))))) (v_Vuna_dCompiler_dIr_dCps_dmFreshR fuel))) (v_Vuna_dCompiler_dIr_dCps_dmFreshK fuel))
  | _ -> failwith "DT: impossible branch"
))
# 898 "Vuna/Compiler/Ir/Cps.vuna"
and v_Vuna_dCompiler_dIr_dCps_dmListH = (fun fuel xs -> (if (fuel <= 0) then xs else (match xs with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__609, dtb__610) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (((v_Vuna_dCompiler_dIr_dCps_dmHandlers (fuel - 1)) dtb__609), ((v_Vuna_dCompiler_dIr_dCps_dmListH (fuel - 1)) dtb__610)))
  | _ -> failwith "DT: impossible branch"
)))
# 907 "Vuna/Compiler/Ir/Cps.vuna"
and v_Vuna_dCompiler_dIr_dCps_dmFieldsH = (fun fuel fs -> (if (fuel <= 0) then fs else (match fs with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__611, dtb__612) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Base_dData_dPair.v_Base_dData_dPair_dfirstOf dtb__611); Base_dData_dPair.f_Base_dData_dPair_dPair_second = ((v_Vuna_dCompiler_dIr_dCps_dmHandlers (fuel - 1)) (Base_dData_dPair.v_Base_dData_dPair_dsecondOf dtb__611)) }, ((v_Vuna_dCompiler_dIr_dCps_dmFieldsH (fuel - 1)) dtb__612)))
  | _ -> failwith "DT: impossible branch"
)))
# 916 "Vuna/Compiler/Ir/Cps.vuna"
and v_Vuna_dCompiler_dIr_dCps_dmHandlers = (fun fuel e -> (if (fuel <= 0) then e else (match e with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLam (dtb__613, dtb__614, dtb__615) -> (((v_Vuna_dCompiler_dIr_dCps_dmHandlerLam (fuel - 1)) dtb__613) dtb__615)
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCtor (dtb__616, dtb__617, dtb__618, dtb__619) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCtor (dtb__616, dtb__617, Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, ((v_Vuna_dCompiler_dIr_dCps_dmListH (fuel - 1)) dtb__619)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRecord (dtb__620, dtb__621) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRecord (dtb__620, ((v_Vuna_dCompiler_dIr_dCps_dmFieldsH (fuel - 1)) dtb__621)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrProj (dtb__622, dtb__623, dtb__624) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrProj (((v_Vuna_dCompiler_dIr_dCps_dmHandlers (fuel - 1)) dtb__622), dtb__623, dtb__624))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRecUpd (dtb__625, dtb__626, dtb__627) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRecUpd (((v_Vuna_dCompiler_dIr_dCps_dmHandlers (fuel - 1)) dtb__625), dtb__626, ((v_Vuna_dCompiler_dIr_dCps_dmFieldsH (fuel - 1)) dtb__627)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRtApp (dtb__628, dtb__629) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRtApp (dtb__628, ((v_Vuna_dCompiler_dIr_dCps_dmListH (fuel - 1)) dtb__629)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCast (dtb__630, dtb__631, dtb__632) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCast (dtb__630, dtb__631, ((v_Vuna_dCompiler_dIr_dCps_dmHandlers (fuel - 1)) dtb__632)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLet (dtb__633, dtb__634, dtb__635) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLet (dtb__633, ((v_Vuna_dCompiler_dIr_dCps_dmHandlers (fuel - 1)) dtb__634), ((v_Vuna_dCompiler_dIr_dCps_dmHandlers (fuel - 1)) dtb__635)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (dtb__636, dtb__637, dtb__638) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, ((v_Vuna_dCompiler_dIr_dCps_dmHandlers (fuel - 1)) dtb__637), ((v_Vuna_dCompiler_dIr_dCps_dmHandlers (fuel - 1)) dtb__638)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrIf (dtb__639, dtb__640, dtb__641) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrIf (((v_Vuna_dCompiler_dIr_dCps_dmHandlers (fuel - 1)) dtb__639), ((v_Vuna_dCompiler_dIr_dCps_dmHandlers (fuel - 1)) dtb__640), ((v_Vuna_dCompiler_dIr_dCps_dmHandlers (fuel - 1)) dtb__641)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCase (dtb__642, dtb__643, dtb__644) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCase (dtb__642, ((v_Vuna_dCompiler_dIr_dCps_dmHandlers (fuel - 1)) dtb__643), ((v_Vuna_dCompiler_dIr_dCps_dmHandlersAlts (fuel - 1)) dtb__644)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrNatCase (dtb__645, dtb__646, dtb__647, dtb__648, dtb__649) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrNatCase (((v_Vuna_dCompiler_dIr_dCps_dmHandlers (fuel - 1)) dtb__645), dtb__646, ((v_Vuna_dCompiler_dIr_dCps_dmHandlersAltM (fuel - 1)) dtb__647), ((v_Vuna_dCompiler_dIr_dCps_dmHandlersAltM (fuel - 1)) dtb__648), ((v_Vuna_dCompiler_dIr_dCps_dmHandlersAltM (fuel - 1)) dtb__649)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrConcatMany (dtb__650) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrConcatMany (((v_Vuna_dCompiler_dIr_dCps_dmListH (fuel - 1)) dtb__650)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrEffThunk (dtb__651, dtb__652, dtb__653, dtb__654, dtb__655) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrEffThunk (dtb__651, dtb__652, dtb__653, dtb__654, ((v_Vuna_dCompiler_dIr_dCps_dmHandlers (fuel - 1)) dtb__655)))
  | _ -> e
)))
# 938 "Vuna/Compiler/Ir/Cps.vuna"
and v_Vuna_dCompiler_dIr_dCps_dmHandlersAlts = (fun fuel alts -> (if (fuel <= 0) then alts else (match alts with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__656, dtb__657) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltCtor = (dtb__656).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltCtor; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBinders = (dtb__656).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBinders; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBody = ((v_Vuna_dCompiler_dIr_dCps_dmHandlers (fuel - 1)) (dtb__656).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBody) }, ((v_Vuna_dCompiler_dIr_dCps_dmHandlersAlts (fuel - 1)) dtb__657)))
  | _ -> failwith "DT: impossible branch"
)))
# 947 "Vuna/Compiler/Ir/Cps.vuna"
and v_Vuna_dCompiler_dIr_dCps_dmHandlersAltM = (fun fuel m -> (if (fuel <= 0) then m else (match m with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__658) -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ({ Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltCtor = (dtb__658).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltCtor; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBinders = (dtb__658).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBinders; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBody = ((v_Vuna_dCompiler_dIr_dCps_dmHandlers (fuel - 1)) (dtb__658).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBody) }))
  | _ -> failwith "DT: impossible branch"
)))

# 1331 "Vuna/Compiler/Ir/Cps.vuna"
let rec v_Vuna_dCompiler_dIr_dCps_dlastBinderOf = (fun bs -> (match bs with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__659, dtb__660) -> (match dtb__660 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__659))
  | _ -> (v_Vuna_dCompiler_dIr_dCps_dlastBinderOf dtb__660)
)
  | _ -> failwith "DT: impossible branch"
))

# 1358 "Vuna/Compiler/Ir/Cps.vuna"
let v_Vuna_dCompiler_dIr_dCps_dmHandlerFun = (fun fuel body -> (if (fuel <= 0) then body else (match body with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLam (dtb__661, dtb__662, dtb__663) -> ((fun nd_uscrut5 -> (match nd_uscrut5 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__664, dtb__665) -> (match dtb__665 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__666, dtb__667) -> ((fun kd -> ((fun rs -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLam (((Base_dData_dList.v_Base_dData_dList_dappend dtb__661) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (kd, (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (rs, Base_dData_dList.C_Base_dData_dList_dList_Nil))))), Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, (((v_Vuna_dCompiler_dIr_dCps_dmScopedCalls (fuel - 1)) rs) ((((v_Vuna_dCompiler_dIr_dCps_dmCps (fuel - 1)) dtb__666) (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrVar (kd))) dtb__663))))) (v_Vuna_dCompiler_dIr_dCps_dmFreshR fuel))) (v_Vuna_dCompiler_dIr_dCps_dmFreshK fuel))
  | _ -> body
)
  | _ -> body
)) (v_Vuna_dCompiler_dIr_dCps_druntimeBinders dtb__661))
  | _ -> body
)))

# 1410 "Vuna/Compiler/Ir/Cps.vuna"
let v_Vuna_dCompiler_dIr_dCps_disContBinder = (fun b -> ((fun n -> (if ((Base_dData_dString.v_Base_dData_dString_dstartsWith "__cpsK") n) then true else ((Base_dData_dString.v_Base_dData_dString_dstartsWith "__mchK") n))) (v_Vuna_dCompiler_dIr_dCps_dmBNameText (b).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrBinder_irBinderName)))

# 1416 "Vuna/Compiler/Ir/Cps.vuna"
let rec v_Vuna_dCompiler_dIr_dCps_dmApplys = (fun fuel e -> (if (fuel <= 0) then e else (match e with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (dtb__668, dtb__669, dtb__670) -> (match dtb__669 with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrVar (dtb__671) -> (if (v_Vuna_dCompiler_dIr_dCps_disContBinder dtb__671) then (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRtApp (v_Vuna_dCompiler_dIr_dCps_dirMApplyName, (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ((Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrVar (dtb__671)), (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (((v_Vuna_dCompiler_dIr_dCps_dmApplys (fuel - 1)) dtb__670), Base_dData_dList.C_Base_dData_dList_dList_Nil)))))) else (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, ((v_Vuna_dCompiler_dIr_dCps_dmApplys (fuel - 1)) dtb__669), ((v_Vuna_dCompiler_dIr_dCps_dmApplys (fuel - 1)) dtb__670))))
  | _ -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, ((v_Vuna_dCompiler_dIr_dCps_dmApplys (fuel - 1)) dtb__669), ((v_Vuna_dCompiler_dIr_dCps_dmApplys (fuel - 1)) dtb__670)))
)
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRtApp (dtb__672, dtb__673) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRtApp (dtb__672, ((v_Vuna_dCompiler_dIr_dCps_dmApplysList (fuel - 1)) dtb__673)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCtor (dtb__674, dtb__675, dtb__676, dtb__677) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCtor (dtb__674, dtb__675, Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, ((v_Vuna_dCompiler_dIr_dCps_dmApplysList (fuel - 1)) dtb__677)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRecord (dtb__678, dtb__679) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRecord (dtb__678, ((v_Vuna_dCompiler_dIr_dCps_dmApplysFields (fuel - 1)) dtb__679)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrProj (dtb__680, dtb__681, dtb__682) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrProj (((v_Vuna_dCompiler_dIr_dCps_dmApplys (fuel - 1)) dtb__680), dtb__681, dtb__682))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRecUpd (dtb__683, dtb__684, dtb__685) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRecUpd (((v_Vuna_dCompiler_dIr_dCps_dmApplys (fuel - 1)) dtb__683), dtb__684, ((v_Vuna_dCompiler_dIr_dCps_dmApplysFields (fuel - 1)) dtb__685)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCast (dtb__686, dtb__687, dtb__688) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCast (dtb__686, dtb__687, ((v_Vuna_dCompiler_dIr_dCps_dmApplys (fuel - 1)) dtb__688)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLet (dtb__689, dtb__690, dtb__691) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLet (dtb__689, ((v_Vuna_dCompiler_dIr_dCps_dmApplys (fuel - 1)) dtb__690), ((v_Vuna_dCompiler_dIr_dCps_dmApplys (fuel - 1)) dtb__691)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLam (dtb__692, dtb__693, dtb__694) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLam (dtb__692, dtb__693, ((v_Vuna_dCompiler_dIr_dCps_dmApplys (fuel - 1)) dtb__694)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrIf (dtb__695, dtb__696, dtb__697) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrIf (((v_Vuna_dCompiler_dIr_dCps_dmApplys (fuel - 1)) dtb__695), ((v_Vuna_dCompiler_dIr_dCps_dmApplys (fuel - 1)) dtb__696), ((v_Vuna_dCompiler_dIr_dCps_dmApplys (fuel - 1)) dtb__697)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCase (dtb__698, dtb__699, dtb__700) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCase (dtb__698, ((v_Vuna_dCompiler_dIr_dCps_dmApplys (fuel - 1)) dtb__699), ((v_Vuna_dCompiler_dIr_dCps_dmApplysAlts (fuel - 1)) dtb__700)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrNatCase (dtb__701, dtb__702, dtb__703, dtb__704, dtb__705) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrNatCase (((v_Vuna_dCompiler_dIr_dCps_dmApplys (fuel - 1)) dtb__701), dtb__702, ((v_Vuna_dCompiler_dIr_dCps_dmApplysAltM (fuel - 1)) dtb__703), ((v_Vuna_dCompiler_dIr_dCps_dmApplysAltM (fuel - 1)) dtb__704), ((v_Vuna_dCompiler_dIr_dCps_dmApplysAltM (fuel - 1)) dtb__705)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrConcatMany (dtb__706) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrConcatMany (((v_Vuna_dCompiler_dIr_dCps_dmApplysList (fuel - 1)) dtb__706)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrEffThunk (dtb__707, dtb__708, dtb__709, dtb__710, dtb__711) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrEffThunk (dtb__707, dtb__708, dtb__709, dtb__710, ((v_Vuna_dCompiler_dIr_dCps_dmApplys (fuel - 1)) dtb__711)))
  | _ -> e
)))
# 1441 "Vuna/Compiler/Ir/Cps.vuna"
and v_Vuna_dCompiler_dIr_dCps_dmApplysList = (fun fuel xs -> (if (fuel <= 0) then xs else (match xs with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__712, dtb__713) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (((v_Vuna_dCompiler_dIr_dCps_dmApplys (fuel - 1)) dtb__712), ((v_Vuna_dCompiler_dIr_dCps_dmApplysList (fuel - 1)) dtb__713)))
  | _ -> failwith "DT: impossible branch"
)))
# 1450 "Vuna/Compiler/Ir/Cps.vuna"
and v_Vuna_dCompiler_dIr_dCps_dmApplysFields = (fun fuel fs -> (if (fuel <= 0) then fs else (match fs with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__714, dtb__715) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Base_dData_dPair.v_Base_dData_dPair_dfirstOf dtb__714); Base_dData_dPair.f_Base_dData_dPair_dPair_second = ((v_Vuna_dCompiler_dIr_dCps_dmApplys (fuel - 1)) (Base_dData_dPair.v_Base_dData_dPair_dsecondOf dtb__714)) }, ((v_Vuna_dCompiler_dIr_dCps_dmApplysFields (fuel - 1)) dtb__715)))
  | _ -> failwith "DT: impossible branch"
)))
# 1459 "Vuna/Compiler/Ir/Cps.vuna"
and v_Vuna_dCompiler_dIr_dCps_dmApplysAlts = (fun fuel alts -> (if (fuel <= 0) then alts else (match alts with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__716, dtb__717) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltCtor = (dtb__716).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltCtor; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBinders = (dtb__716).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBinders; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBody = ((v_Vuna_dCompiler_dIr_dCps_dmApplys (fuel - 1)) (dtb__716).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBody) }, ((v_Vuna_dCompiler_dIr_dCps_dmApplysAlts (fuel - 1)) dtb__717)))
  | _ -> failwith "DT: impossible branch"
)))
# 1468 "Vuna/Compiler/Ir/Cps.vuna"
and v_Vuna_dCompiler_dIr_dCps_dmApplysAltM = (fun fuel m -> (if (fuel <= 0) then m else (match m with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__718) -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ({ Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltCtor = (dtb__718).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltCtor; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBinders = (dtb__718).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBinders; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBody = ((v_Vuna_dCompiler_dIr_dCps_dmApplys (fuel - 1)) (dtb__718).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBody) }))
  | _ -> failwith "DT: impossible branch"
)))

# 1483 "Vuna/Compiler/Ir/Cps.vuna"
let rec v_Vuna_dCompiler_dIr_dCps_dmMarked = (fun fuel e -> (if (fuel <= 0) then e else ((fun nd_uscrut2 -> (match nd_uscrut2 with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrEffThunk (dtb__719, dtb__720, dtb__721, dtb__722, dtb__723) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrEffThunk (dtb__719, dtb__720, dtb__721, dtb__722, ((v_Vuna_dCompiler_dIr_dCps_dmMarked (fuel - 1)) dtb__723)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrConcatMany (dtb__724) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrConcatMany (((v_Vuna_dCompiler_dIr_dCps_dmMarkedList (fuel - 1)) dtb__724)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrNatCase (dtb__725, dtb__726, dtb__727, dtb__728, dtb__729) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrNatCase (((v_Vuna_dCompiler_dIr_dCps_dmMarked (fuel - 1)) dtb__725), dtb__726, ((v_Vuna_dCompiler_dIr_dCps_dmMarkedAltM (fuel - 1)) dtb__727), ((v_Vuna_dCompiler_dIr_dCps_dmMarkedAltM (fuel - 1)) dtb__728), ((v_Vuna_dCompiler_dIr_dCps_dmMarkedAltM (fuel - 1)) dtb__729)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCase (dtb__730, dtb__731, dtb__732) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCase (dtb__730, ((v_Vuna_dCompiler_dIr_dCps_dmMarked (fuel - 1)) dtb__731), ((v_Vuna_dCompiler_dIr_dCps_dmMarkedAlts (fuel - 1)) dtb__732)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrIf (dtb__733, dtb__734, dtb__735) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrIf (((v_Vuna_dCompiler_dIr_dCps_dmMarked (fuel - 1)) dtb__733), ((v_Vuna_dCompiler_dIr_dCps_dmMarked (fuel - 1)) dtb__734), ((v_Vuna_dCompiler_dIr_dCps_dmMarked (fuel - 1)) dtb__735)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (dtb__736, dtb__737, dtb__738) -> (match dtb__737 with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (dtb__739, dtb__740, dtb__741) -> (match dtb__740 with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRt (dtb__742) -> (if (dtb__742 = "@ir@m@self") then (match dtb__738 with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLam (dtb__743, dtb__744, dtb__745) -> (match dtb__743 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__746, dtb__747) -> (match dtb__747 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRt (v_Vuna_dCompiler_dIr_dCps_dirMRunName)), (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRt ("@ir@m@self")), ((v_Vuna_dCompiler_dIr_dCps_dmMarked (fuel - 1)) dtb__741))), v_Vuna_dCompiler_dIr_dCps_dmDoneCont))))
  | _ -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, ((v_Vuna_dCompiler_dIr_dCps_dmMarked (fuel - 1)) dtb__737), ((v_Vuna_dCompiler_dIr_dCps_dmMarked (fuel - 1)) dtb__738)))
)
  | _ -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, ((v_Vuna_dCompiler_dIr_dCps_dmMarked (fuel - 1)) dtb__737), ((v_Vuna_dCompiler_dIr_dCps_dmMarked (fuel - 1)) dtb__738)))
)
  | _ -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, ((v_Vuna_dCompiler_dIr_dCps_dmMarked (fuel - 1)) dtb__737), ((v_Vuna_dCompiler_dIr_dCps_dmMarked (fuel - 1)) dtb__738)))
) else (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, ((v_Vuna_dCompiler_dIr_dCps_dmMarked (fuel - 1)) dtb__737), ((v_Vuna_dCompiler_dIr_dCps_dmMarked (fuel - 1)) dtb__738))))
  | _ -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, ((v_Vuna_dCompiler_dIr_dCps_dmMarked (fuel - 1)) dtb__737), ((v_Vuna_dCompiler_dIr_dCps_dmMarked (fuel - 1)) dtb__738)))
)
  | _ -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, ((v_Vuna_dCompiler_dIr_dCps_dmMarked (fuel - 1)) dtb__737), ((v_Vuna_dCompiler_dIr_dCps_dmMarked (fuel - 1)) dtb__738)))
)
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLet (dtb__748, dtb__749, dtb__750) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLet (dtb__748, ((v_Vuna_dCompiler_dIr_dCps_dmMarked (fuel - 1)) dtb__749), ((v_Vuna_dCompiler_dIr_dCps_dmMarked (fuel - 1)) dtb__750)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCast (dtb__751, dtb__752, dtb__753) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCast (dtb__751, dtb__752, ((v_Vuna_dCompiler_dIr_dCps_dmMarked (fuel - 1)) dtb__753)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRecUpd (dtb__754, dtb__755, dtb__756) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRecUpd (((v_Vuna_dCompiler_dIr_dCps_dmMarked (fuel - 1)) dtb__754), dtb__755, ((v_Vuna_dCompiler_dIr_dCps_dmMarkedFields (fuel - 1)) dtb__756)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrProj (dtb__757, dtb__758, dtb__759) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrProj (((v_Vuna_dCompiler_dIr_dCps_dmMarked (fuel - 1)) dtb__757), dtb__758, dtb__759))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRecord (dtb__760, dtb__761) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRecord (dtb__760, ((v_Vuna_dCompiler_dIr_dCps_dmMarkedFields (fuel - 1)) dtb__761)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCtor (dtb__762, dtb__763, dtb__764, dtb__765) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCtor (dtb__762, dtb__763, Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, ((v_Vuna_dCompiler_dIr_dCps_dmMarkedList (fuel - 1)) dtb__765)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRtApp (dtb__766, dtb__767) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRtApp (dtb__766, ((v_Vuna_dCompiler_dIr_dCps_dmMarkedList (fuel - 1)) dtb__767)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLam (dtb__768, dtb__769, dtb__770) -> (if (if (v_Vuna_dCompiler_dIr_dCps_disEffContLambda dtb__769) then (Base_dData_dBool.v_Base_dData_dBool_dnot (v_Vuna_dCompiler_dIr_dCps_disEffThunkBody dtb__770)) else false) then (((((v_Vuna_dCompiler_dIr_dCps_dmEffContLambda (fuel - 1)) v_Vuna_dCompiler_dIr_dCps_dmNoResumption) dtb__768) dtb__769) dtb__770) else (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLam (dtb__768, dtb__769, ((v_Vuna_dCompiler_dIr_dCps_dmMarked (fuel - 1)) dtb__770))))
  | _ -> e
)) e)))
# 1507 "Vuna/Compiler/Ir/Cps.vuna"
and v_Vuna_dCompiler_dIr_dCps_dmMarkedList = (fun fuel xs -> (if (fuel <= 0) then xs else (match xs with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__771, dtb__772) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (((v_Vuna_dCompiler_dIr_dCps_dmMarked (fuel - 1)) dtb__771), ((v_Vuna_dCompiler_dIr_dCps_dmMarkedList (fuel - 1)) dtb__772)))
  | _ -> failwith "DT: impossible branch"
)))
# 1516 "Vuna/Compiler/Ir/Cps.vuna"
and v_Vuna_dCompiler_dIr_dCps_dmMarkedFields = (fun fuel fs -> (if (fuel <= 0) then fs else (match fs with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__773, dtb__774) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Base_dData_dPair.v_Base_dData_dPair_dfirstOf dtb__773); Base_dData_dPair.f_Base_dData_dPair_dPair_second = ((v_Vuna_dCompiler_dIr_dCps_dmMarked (fuel - 1)) (Base_dData_dPair.v_Base_dData_dPair_dsecondOf dtb__773)) }, ((v_Vuna_dCompiler_dIr_dCps_dmMarkedFields (fuel - 1)) dtb__774)))
  | _ -> failwith "DT: impossible branch"
)))
# 1525 "Vuna/Compiler/Ir/Cps.vuna"
and v_Vuna_dCompiler_dIr_dCps_dmMarkedAlts = (fun fuel alts -> (if (fuel <= 0) then alts else (match alts with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__775, dtb__776) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltCtor = (dtb__775).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltCtor; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBinders = (dtb__775).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBinders; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBody = ((v_Vuna_dCompiler_dIr_dCps_dmMarked (fuel - 1)) (dtb__775).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBody) }, ((v_Vuna_dCompiler_dIr_dCps_dmMarkedAlts (fuel - 1)) dtb__776)))
  | _ -> failwith "DT: impossible branch"
)))
# 1534 "Vuna/Compiler/Ir/Cps.vuna"
and v_Vuna_dCompiler_dIr_dCps_dmMarkedAltM = (fun fuel m -> (if (fuel <= 0) then m else (match m with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__777) -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ({ Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltCtor = (dtb__777).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltCtor; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBinders = (dtb__777).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBinders; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBody = ((v_Vuna_dCompiler_dIr_dCps_dmMarked (fuel - 1)) (dtb__777).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBody) }))
  | _ -> failwith "DT: impossible branch"
)))

# 1543 "Vuna/Compiler/Ir/Cps.vuna"
let v_Vuna_dCompiler_dIr_dCps_dmMarkedDef = (fun (mc0 : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrDef) -> (match mc0 with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrDef_IrDef (dtb__778, dtb__779, dtb__780, dtb__781, dtb__782, dtb__783, dtb__784, dtb__785) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrDef_IrDef (dtb__778, dtb__779, dtb__780, Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, ((v_Vuna_dCompiler_dIr_dCps_dmMarked v_Vuna_dCompiler_dIr_dCps_dstartFuel) dtb__782), dtb__783, dtb__784, dtb__785))
  | _ -> mc0
))

# 1548 "Vuna/Compiler/Ir/Cps.vuna"
let v_Vuna_dCompiler_dIr_dCps_dmApplysDef = (fun (mc0 : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrDef) -> (match mc0 with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrDef_IrDef (dtb__786, dtb__787, dtb__788, dtb__789, dtb__790, dtb__791, dtb__792, dtb__793) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrDef_IrDef (dtb__786, dtb__787, dtb__788, Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, ((v_Vuna_dCompiler_dIr_dCps_dmApplys v_Vuna_dCompiler_dIr_dCps_dstartFuel) dtb__790), dtb__791, dtb__792, dtb__793))
  | _ -> mc0
))

# 1558 "Vuna/Compiler/Ir/Cps.vuna"
let v_Vuna_dCompiler_dIr_dCps_dmachineCtl = "Base.Effect.Core.Control"

# 1342 "Vuna/Compiler/Ir/Cps.vuna"
let v_Vuna_dCompiler_dIr_dCps_dmCleanupDef = (fun n body -> (if (n = v_Vuna_dCompiler_dIr_dCps_dcleanupPushName) then (match body with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLam (dtb__794, dtb__795, dtb__796) -> (match (v_Vuna_dCompiler_dIr_dCps_dlastBinderOf dtb__794) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__797) -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ((Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLam (dtb__794, Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCtor (Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirEffTypeName, Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirEffMkCtor, Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ((Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLam ((Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ((v_Vuna_dCompiler_dIr_dCps_dmkBinder "__mCleanU"), (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ((v_Vuna_dCompiler_dIr_dCps_dmkBinder "__mCleanK"), Base_dData_dList.C_Base_dData_dList_dList_Nil)))), Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCtor (v_Vuna_dCompiler_dIr_dCps_dmachineCtl, (v_Vuna_dCompiler_dIr_dCps_dmachineCtl ^ ".MkPushCleanup"), Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ((Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCtor ("Base.Effect.Core.Cleanup", "Base.Effect.Core.Cleanup.MkCleanup", Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ((Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrVar (dtb__797)), Base_dData_dList.C_Base_dData_dList_dList_Nil)))), (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ((Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrVar ((v_Vuna_dCompiler_dIr_dCps_dmkBinder "__mCleanK"))), Base_dData_dList.C_Base_dData_dList_dList_Nil)))))))), Base_dData_dList.C_Base_dData_dList_dList_Nil))))))))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
) else (if (n = v_Vuna_dCompiler_dIr_dCps_dcleanupPopName) then (match body with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLam (dtb__798, dtb__799, dtb__800) -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ((Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLam (dtb__798, Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCtor (Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirEffTypeName, Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirEffMkCtor, Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ((Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLam ((Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ((v_Vuna_dCompiler_dIr_dCps_dmkBinder "__mCleanU"), (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ((v_Vuna_dCompiler_dIr_dCps_dmkBinder "__mCleanK"), Base_dData_dList.C_Base_dData_dList_dList_Nil)))), Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCtor (v_Vuna_dCompiler_dIr_dCps_dmachineCtl, (v_Vuna_dCompiler_dIr_dCps_dmachineCtl ^ ".MkPopCleanup"), Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ((Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrVar ((v_Vuna_dCompiler_dIr_dCps_dmkBinder "__mCleanK"))), Base_dData_dList.C_Base_dData_dList_dList_Nil)))))), Base_dData_dList.C_Base_dData_dList_dList_Nil))))))))
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
) else Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing)))

# 1374 "Vuna/Compiler/Ir/Cps.vuna"
let v_Vuna_dCompiler_dIr_dCps_dmDef = (fun handlers fuel d -> (if (fuel <= 0) then d else (match d with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrDef_IrExternDef (dtb__801, dtb__802, dtb__803, dtb__804) -> d
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrDef_IrDef (dtb__805, dtb__806, dtb__807, dtb__808, dtb__809, dtb__810, dtb__811, dtb__812) -> ((fun marked -> ((fun h -> ((fun ar2 -> ((fun b -> (if (if (if (dtb__805 = v_Vuna_dCompiler_dIr_dCps_drunPureName) then true else (dtb__805 = v_Vuna_dCompiler_dIr_dCps_drunEffName)) then true else (dtb__805 = v_Vuna_dCompiler_dIr_dCps_drunMainName)) then (match ((v_Vuna_dCompiler_dIr_dCps_dmTrampolineBody dtb__805) b) with
  | Base_dData_dResult.C_Base_dData_dResult_dResult_Ok (dtb__813) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrDef_IrDef (dtb__805, ar2, dtb__807, Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, dtb__813, dtb__810, dtb__811, dtb__812))
  | Base_dData_dResult.C_Base_dData_dResult_dResult_Err (dtb__814) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrDef_IrDef (dtb__805, ar2, dtb__807, Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, b, dtb__810, dtb__811, dtb__812))
  | _ -> failwith "DT: impossible branch"
) else (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrDef_IrDef (dtb__805, ar2, dtb__807, Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, b, dtb__810, dtb__811, dtb__812)))) ((v_Vuna_dCompiler_dIr_dCps_dmSyms (fuel - 1)) ((v_Vuna_dCompiler_dIr_dCps_dmHandlers (fuel - 1)) h)))) (if marked then (dtb__806 + 2) else dtb__806))) (match ((v_Vuna_dCompiler_dIr_dCps_dmCleanupDef dtb__805) dtb__809) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__815) -> dtb__815
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (if marked then ((v_Vuna_dCompiler_dIr_dCps_dmHandlerFun (fuel - 1)) dtb__809) else dtb__809)
  | _ -> failwith "DT: impossible branch"
))) ((v_Vuna_dCompiler_dIr_dCps_dmemName dtb__805) handlers))
  | _ -> failwith "DT: impossible branch"
)))

# 1397 "Vuna/Compiler/Ir/Cps.vuna"
let rec v_Vuna_dCompiler_dIr_dCps_dmDefs = (fun handlers fuel ds -> (if (fuel <= 0) then ds else (match ds with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__816, dtb__817) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ((((v_Vuna_dCompiler_dIr_dCps_dmDef handlers) (fuel - 1)) dtb__816), (((v_Vuna_dCompiler_dIr_dCps_dmDefs handlers) (fuel - 1)) dtb__817)))
  | _ -> failwith "DT: impossible branch"
)))

# 1561 "Vuna/Compiler/Ir/Cps.vuna"
let v_Vuna_dCompiler_dIr_dCps_dmachineCtorOf = (fun sym -> (if (sym = v_Vuna_dCompiler_dIr_dCps_dirMDoneName) then (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ("MkDone")) else (if (sym = v_Vuna_dCompiler_dIr_dCps_dirMApplyName) then (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ("MkApply")) else (if (sym = v_Vuna_dCompiler_dIr_dCps_dirMPerformName) then (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ("MkPerform")) else (if (sym = v_Vuna_dCompiler_dIr_dCps_dirMHandleName) then (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ("MkHandle")) else (if (sym = v_Vuna_dCompiler_dIr_dCps_dirMSelfName) then (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ("MkSelf")) else Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing))))))

# 1575 "Vuna/Compiler/Ir/Cps.vuna"
let v_Vuna_dCompiler_dIr_dCps_dmachineArgsOf = (fun sym args -> (if (sym = v_Vuna_dCompiler_dIr_dCps_dirMHandleName) then ((fun nd_uscrut2 -> (match nd_uscrut2 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__818, dtb__819) -> (match dtb__819 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__820, dtb__821) -> (match dtb__821 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__822, dtb__823) -> (match dtb__823 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__824, dtb__825) -> (match dtb__825 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__826, dtb__827) -> (match dtb__827 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__828, dtb__829) -> ((Base_dData_dList.v_Base_dData_dList_dappend (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__818, (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__820, (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__822, (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__824, (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__826, Base_dData_dList.C_Base_dData_dList_dList_Nil))))))))))) dtb__829)
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

# 1584 "Vuna/Compiler/Ir/Cps.vuna"
let rec v_Vuna_dCompiler_dIr_dCps_dmSteps = (fun fuel e -> (if (fuel <= 0) then e else (match e with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRtApp (dtb__830, dtb__831) -> (match (v_Vuna_dCompiler_dIr_dCps_dmachineCtorOf dtb__830) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__832) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCtor (v_Vuna_dCompiler_dIr_dCps_dmachineCtl, (String.concat "" [v_Vuna_dCompiler_dIr_dCps_dmachineCtl; "."; dtb__832]), Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, ((v_Vuna_dCompiler_dIr_dCps_dmStepsList (fuel - 1)) ((v_Vuna_dCompiler_dIr_dCps_dmachineArgsOf dtb__830) dtb__831))))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (if (dtb__830 = v_Vuna_dCompiler_dIr_dCps_dirMRunName) then ((fun nd_uscrut5 -> (match nd_uscrut5 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__833, dtb__834) -> (match dtb__834 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrGlobal ("Base.Effect.Core.machineRun")), ((v_Vuna_dCompiler_dIr_dCps_dmSteps (fuel - 1)) dtb__833)))
  | _ -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRtApp (dtb__830, ((v_Vuna_dCompiler_dIr_dCps_dmStepsList (fuel - 1)) dtb__831)))
)
  | _ -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRtApp (dtb__830, ((v_Vuna_dCompiler_dIr_dCps_dmStepsList (fuel - 1)) dtb__831)))
)) dtb__831) else (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRtApp (dtb__830, ((v_Vuna_dCompiler_dIr_dCps_dmStepsList (fuel - 1)) dtb__831))))
  | _ -> failwith "DT: impossible branch"
)
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (dtb__835, dtb__836, dtb__837) -> ((fun p -> ((fun head -> ((fun args -> (match head with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRt (dtb__838) -> (match (v_Vuna_dCompiler_dIr_dCps_dmachineCtorOf dtb__838) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__839) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCtor (v_Vuna_dCompiler_dIr_dCps_dmachineCtl, (String.concat "" [v_Vuna_dCompiler_dIr_dCps_dmachineCtl; "."; dtb__839]), Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, ((v_Vuna_dCompiler_dIr_dCps_dmStepsList (fuel - 1)) ((v_Vuna_dCompiler_dIr_dCps_dmachineArgsOf dtb__838) args))))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (if (dtb__838 = v_Vuna_dCompiler_dIr_dCps_dirMRunName) then ((fun nd_uscrut10 -> (match nd_uscrut10 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__840, dtb__841) -> (match dtb__841 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrGlobal ("Base.Effect.Core.machineRun")), ((v_Vuna_dCompiler_dIr_dCps_dmSteps (fuel - 1)) dtb__840)))
  | _ -> (((v_Vuna_dCompiler_dIr_dCps_dfoldAppMap (fuel - 1)) ((v_Vuna_dCompiler_dIr_dCps_dmSteps (fuel - 1)) head)) args)
)
  | _ -> (((v_Vuna_dCompiler_dIr_dCps_dfoldAppMap (fuel - 1)) ((v_Vuna_dCompiler_dIr_dCps_dmSteps (fuel - 1)) head)) args)
)) args) else (((v_Vuna_dCompiler_dIr_dCps_dfoldAppMap (fuel - 1)) ((v_Vuna_dCompiler_dIr_dCps_dmSteps (fuel - 1)) head)) args))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> (((v_Vuna_dCompiler_dIr_dCps_dfoldAppMap (fuel - 1)) ((v_Vuna_dCompiler_dIr_dCps_dmSteps (fuel - 1)) head)) args)
)) (Base_dData_dPair.v_Base_dData_dPair_dsecondOf p))) (Base_dData_dPair.v_Base_dData_dPair_dfirstOf p))) (v_Vuna_dCompiler_dIr_dCps_dflattenApp e))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCtor (dtb__842, dtb__843, dtb__844, dtb__845) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCtor (dtb__842, dtb__843, Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, ((v_Vuna_dCompiler_dIr_dCps_dmStepsList (fuel - 1)) dtb__845)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRecord (dtb__846, dtb__847) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRecord (dtb__846, ((v_Vuna_dCompiler_dIr_dCps_dmStepsFields (fuel - 1)) dtb__847)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrProj (dtb__848, dtb__849, dtb__850) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrProj (((v_Vuna_dCompiler_dIr_dCps_dmSteps (fuel - 1)) dtb__848), dtb__849, dtb__850))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRecUpd (dtb__851, dtb__852, dtb__853) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRecUpd (((v_Vuna_dCompiler_dIr_dCps_dmSteps (fuel - 1)) dtb__851), dtb__852, ((v_Vuna_dCompiler_dIr_dCps_dmStepsFields (fuel - 1)) dtb__853)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCast (dtb__854, dtb__855, dtb__856) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCast (dtb__854, dtb__855, ((v_Vuna_dCompiler_dIr_dCps_dmSteps (fuel - 1)) dtb__856)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLet (dtb__857, dtb__858, dtb__859) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLet (dtb__857, ((v_Vuna_dCompiler_dIr_dCps_dmSteps (fuel - 1)) dtb__858), ((v_Vuna_dCompiler_dIr_dCps_dmSteps (fuel - 1)) dtb__859)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLam (dtb__860, dtb__861, dtb__862) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLam (dtb__860, dtb__861, ((v_Vuna_dCompiler_dIr_dCps_dmSteps (fuel - 1)) dtb__862)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrIf (dtb__863, dtb__864, dtb__865) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrIf (((v_Vuna_dCompiler_dIr_dCps_dmSteps (fuel - 1)) dtb__863), ((v_Vuna_dCompiler_dIr_dCps_dmSteps (fuel - 1)) dtb__864), ((v_Vuna_dCompiler_dIr_dCps_dmSteps (fuel - 1)) dtb__865)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCase (dtb__866, dtb__867, dtb__868) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCase (dtb__866, ((v_Vuna_dCompiler_dIr_dCps_dmSteps (fuel - 1)) dtb__867), ((v_Vuna_dCompiler_dIr_dCps_dmStepsAlts (fuel - 1)) dtb__868)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrNatCase (dtb__869, dtb__870, dtb__871, dtb__872, dtb__873) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrNatCase (((v_Vuna_dCompiler_dIr_dCps_dmSteps (fuel - 1)) dtb__869), dtb__870, ((v_Vuna_dCompiler_dIr_dCps_dmStepsAltM (fuel - 1)) dtb__871), ((v_Vuna_dCompiler_dIr_dCps_dmStepsAltM (fuel - 1)) dtb__872), ((v_Vuna_dCompiler_dIr_dCps_dmStepsAltM (fuel - 1)) dtb__873)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrConcatMany (dtb__874) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrConcatMany (((v_Vuna_dCompiler_dIr_dCps_dmStepsList (fuel - 1)) dtb__874)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrEffThunk (dtb__875, dtb__876, dtb__877, dtb__878, dtb__879) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrEffThunk (dtb__875, dtb__876, dtb__877, dtb__878, ((v_Vuna_dCompiler_dIr_dCps_dmSteps (fuel - 1)) dtb__879)))
  | _ -> e
)))
# 1631 "Vuna/Compiler/Ir/Cps.vuna"
and v_Vuna_dCompiler_dIr_dCps_dmStepsList = (fun fuel xs -> (if (fuel <= 0) then xs else (match xs with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__880, dtb__881) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (((v_Vuna_dCompiler_dIr_dCps_dmSteps (fuel - 1)) dtb__880), ((v_Vuna_dCompiler_dIr_dCps_dmStepsList (fuel - 1)) dtb__881)))
  | _ -> failwith "DT: impossible branch"
)))
# 1640 "Vuna/Compiler/Ir/Cps.vuna"
and v_Vuna_dCompiler_dIr_dCps_dmStepsFields = (fun fuel fs -> (if (fuel <= 0) then fs else (match fs with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__882, dtb__883) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Base_dData_dPair.v_Base_dData_dPair_dfirstOf dtb__882); Base_dData_dPair.f_Base_dData_dPair_dPair_second = ((v_Vuna_dCompiler_dIr_dCps_dmSteps (fuel - 1)) (Base_dData_dPair.v_Base_dData_dPair_dsecondOf dtb__882)) }, ((v_Vuna_dCompiler_dIr_dCps_dmStepsFields (fuel - 1)) dtb__883)))
  | _ -> failwith "DT: impossible branch"
)))
# 1649 "Vuna/Compiler/Ir/Cps.vuna"
and v_Vuna_dCompiler_dIr_dCps_dmStepsAlts = (fun fuel alts -> (if (fuel <= 0) then alts else (match alts with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__884, dtb__885) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltCtor = (dtb__884).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltCtor; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBinders = (dtb__884).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBinders; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBody = ((v_Vuna_dCompiler_dIr_dCps_dmSteps (fuel - 1)) (dtb__884).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBody) }, ((v_Vuna_dCompiler_dIr_dCps_dmStepsAlts (fuel - 1)) dtb__885)))
  | _ -> failwith "DT: impossible branch"
)))
# 1658 "Vuna/Compiler/Ir/Cps.vuna"
and v_Vuna_dCompiler_dIr_dCps_dmStepsAltM = (fun fuel m -> (if (fuel <= 0) then m else (match m with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__886) -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ({ Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltCtor = (dtb__886).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltCtor; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBinders = (dtb__886).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBinders; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBody = ((v_Vuna_dCompiler_dIr_dCps_dmSteps (fuel - 1)) (dtb__886).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBody) }))
  | _ -> failwith "DT: impossible branch"
)))
# 1668 "Vuna/Compiler/Ir/Cps.vuna"
and v_Vuna_dCompiler_dIr_dCps_dfoldAppMap = (fun fuel acc xs -> (if (fuel <= 0) then acc else (match xs with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> acc
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__887, dtb__888) -> (((v_Vuna_dCompiler_dIr_dCps_dfoldAppMap (fuel - 1)) (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, acc, ((v_Vuna_dCompiler_dIr_dCps_dmSteps (fuel - 1)) dtb__887)))) dtb__888)
  | _ -> failwith "DT: impossible branch"
)))

# 1677 "Vuna/Compiler/Ir/Cps.vuna"
let v_Vuna_dCompiler_dIr_dCps_dmStepsDef = (fun (mc0 : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrDef) -> (match mc0 with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrDef_IrDef (dtb__889, dtb__890, dtb__891, dtb__892, dtb__893, dtb__894, dtb__895, dtb__896) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrDef_IrDef (dtb__889, dtb__890, dtb__891, Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, ((v_Vuna_dCompiler_dIr_dCps_dmSteps v_Vuna_dCompiler_dIr_dCps_dstartFuel) dtb__893), dtb__894, dtb__895, dtb__896))
  | _ -> mc0
))

# 1696 "Vuna/Compiler/Ir/Cps.vuna"
let v_Vuna_dCompiler_dIr_dCps_dcpsUnit = (fun u -> (match ((v_Vuna_dCompiler_dIr_dCps_dtransformGroups v_Vuna_dCompiler_dIr_dCps_dstartFuel) (u).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrUnit_irUnitGroups) with
  | Base_dData_dResult.C_Base_dData_dResult_dResult_Err (dtb__897) -> (Base_dData_dResult.C_Base_dData_dResult_dResult_Err (dtb__897))
  | Base_dData_dResult.C_Base_dData_dResult_dResult_Ok (dtb__898) -> (Base_dData_dResult.C_Base_dData_dResult_dResult_Ok ({ Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrUnit_irUnitTyDecls = (u).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrUnit_irUnitTyDecls; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrUnit_irUnitGroups = dtb__898; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrUnit_irUnitHasListFamily = (u).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrUnit_irUnitHasListFamily; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrUnit_irUnitTypeRefs = (u).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrUnit_irUnitTypeRefs; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrUnit_irUnitEntry = (u).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrUnit_irUnitEntry }))
  | _ -> failwith "DT: impossible branch"
))

# 1704 "Vuna/Compiler/Ir/Cps.vuna"
let v_Vuna_dCompiler_dIr_dCps_dcpsDefs = (fun defs -> ((v_Vuna_dCompiler_dIr_dCps_dtransformDefs v_Vuna_dCompiler_dIr_dCps_dstartFuel) defs))

# 1681 "Vuna/Compiler/Ir/Cps.vuna"
let v_Vuna_dCompiler_dIr_dCps_dcpsDefsMachine = (fun defs -> (match (v_Vuna_dCompiler_dIr_dCps_dcpsDefs defs) with
  | Base_dData_dResult.C_Base_dData_dResult_dResult_Err (dtb__899) -> (Base_dData_dResult.C_Base_dData_dResult_dResult_Err (dtb__899))
  | Base_dData_dResult.C_Base_dData_dResult_dResult_Ok (dtb__900) -> (Base_dData_dResult.C_Base_dData_dResult_dResult_Ok (((Base_dData_dList.v_Base_dData_dList_dmap v_Vuna_dCompiler_dIr_dCps_dmStepsDef) ((Base_dData_dList.v_Base_dData_dList_dmap v_Vuna_dCompiler_dIr_dCps_dmApplysDef) ((Base_dData_dList.v_Base_dData_dList_dmap v_Vuna_dCompiler_dIr_dCps_dmMarkedDef) (((v_Vuna_dCompiler_dIr_dCps_dmDefs ((v_Vuna_dCompiler_dIr_dCps_dcollectHandleOpsDefs 100000) dtb__900)) v_Vuna_dCompiler_dIr_dCps_dstartFuel) dtb__900))))))
  | _ -> failwith "DT: impossible branch"
))

# 1689 "Vuna/Compiler/Ir/Cps.vuna"
let v_Vuna_dCompiler_dIr_dCps_dcpsDefsStep = (fun defs -> (match (v_Vuna_dCompiler_dIr_dCps_dcpsDefs defs) with
  | Base_dData_dResult.C_Base_dData_dResult_dResult_Err (dtb__901) -> (Base_dData_dResult.C_Base_dData_dResult_dResult_Err (dtb__901))
  | Base_dData_dResult.C_Base_dData_dResult_dResult_Ok (dtb__902) -> ((v_Vuna_dCompiler_dIr_dCps_dselDefs v_Vuna_dCompiler_dIr_dCps_dstartFuel) dtb__902)
  | _ -> failwith "DT: impossible branch"
))
