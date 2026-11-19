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
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCase (dtb__36, dtb__37, dtb__38, dtb__39) -> ((fun v -> ((fun kCase -> ((((v_Vuna_dCompiler_dIr_dCps_dcpsExpr (fuel - 1)) env) dtb__38) kCase)) (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLam ((Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (v, Base_dData_dList.C_Base_dData_dList_dList_Nil)), Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCase (dtb__36, Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrVar (v)), ((((v_Vuna_dCompiler_dIr_dCps_dmapAltCps (fuel - 1)) env) dtb__39) k))))))) (v_Vuna_dCompiler_dIr_dCps_dfreshV fuel))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrNatCase (dtb__40, dtb__41, dtb__42, dtb__43, dtb__44) -> ((fun v -> ((fun kCase -> ((((v_Vuna_dCompiler_dIr_dCps_dcpsExpr (fuel - 1)) env) dtb__40) kCase)) (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLam ((Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (v, Base_dData_dList.C_Base_dData_dList_dList_Nil)), Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrNatCase ((Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrVar (v)), dtb__41, ((((v_Vuna_dCompiler_dIr_dCps_dcpsAltMaybe (fuel - 1)) env) dtb__42) k), ((((v_Vuna_dCompiler_dIr_dCps_dcpsAltMaybe (fuel - 1)) env) dtb__43) k), ((((v_Vuna_dCompiler_dIr_dCps_dcpsAltMaybe (fuel - 1)) env) dtb__44) k))))))) (v_Vuna_dCompiler_dIr_dCps_dfreshV fuel))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrIf (dtb__45, dtb__46, dtb__47) -> ((fun v -> ((fun kIf -> ((((v_Vuna_dCompiler_dIr_dCps_dcpsExpr (fuel - 1)) env) dtb__45) kIf)) (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLam ((Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (v, Base_dData_dList.C_Base_dData_dList_dList_Nil)), Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrIf ((Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrVar (v)), ((((v_Vuna_dCompiler_dIr_dCps_dcpsExpr (fuel - 1)) env) dtb__46) k), ((((v_Vuna_dCompiler_dIr_dCps_dcpsExpr (fuel - 1)) env) dtb__47) k))))))) (v_Vuna_dCompiler_dIr_dCps_dfreshV fuel))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLet (dtb__48, dtb__49, dtb__50) -> ((fun v -> ((fun kLet -> ((((v_Vuna_dCompiler_dIr_dCps_dcpsExpr (fuel - 1)) env) dtb__49) kLet)) (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLam ((Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (v, Base_dData_dList.C_Base_dData_dList_dList_Nil)), Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLet (dtb__48, (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrVar (v)), ((((v_Vuna_dCompiler_dIr_dCps_dcpsExpr (fuel - 1)) env) dtb__50) k))))))) (v_Vuna_dCompiler_dIr_dCps_dfreshV fuel))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCast (dtb__51, dtb__52, dtb__53) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCast (dtb__51, dtb__52, ((((v_Vuna_dCompiler_dIr_dCps_dcpsExpr (fuel - 1)) env) dtb__53) k)))
  | _ -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, k, ((v_Vuna_dCompiler_dIr_dCps_dtransformDirect (fuel - 1)) e)))
)))
# 254 "Vuna/Compiler/Ir/Cps.vuna"
and v_Vuna_dCompiler_dIr_dCps_dcpsAlt = (fun fuel env alt k -> (if (fuel <= 0) then alt else ((fun env1 -> { Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltCtor = (alt).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltCtor; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBinders = (alt).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBinders; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBody = ((((v_Vuna_dCompiler_dIr_dCps_dcpsExpr (fuel - 1)) env1) (alt).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBody) k) }) ((Base_dData_dList.v_Base_dData_dList_dappend (v_Vuna_dCompiler_dIr_dCps_dthunkBindersOfAlt alt)) env))))
# 263 "Vuna/Compiler/Ir/Cps.vuna"
and v_Vuna_dCompiler_dIr_dCps_dcpsAltMaybe = (fun fuel env m k -> (if (fuel <= 0) then m else (match m with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__54) -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (((((v_Vuna_dCompiler_dIr_dCps_dcpsAlt (fuel - 1)) env) dtb__54) k)))
  | _ -> failwith "DT: impossible branch"
)))
# 273 "Vuna/Compiler/Ir/Cps.vuna"
and v_Vuna_dCompiler_dIr_dCps_dcpsArgs = (fun fuel env args head acc k -> (if (fuel <= 0) then (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, k, ((v_Vuna_dCompiler_dIr_dCps_dapplyAll head) (Base_dData_dList.v_Base_dData_dList_dreverse acc)))) else (match args with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, k, ((v_Vuna_dCompiler_dIr_dCps_dapplyAll head) (Base_dData_dList.v_Base_dData_dList_dreverse acc))))
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__55, dtb__56) -> ((fun v -> ((((v_Vuna_dCompiler_dIr_dCps_dcpsExpr (fuel - 1)) env) dtb__55) (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLam ((Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (v, Base_dData_dList.C_Base_dData_dList_dList_Nil)), Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, ((((((v_Vuna_dCompiler_dIr_dCps_dcpsArgs (fuel - 1)) env) dtb__56) head) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ((Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrVar (v)), acc))) k))))) (v_Vuna_dCompiler_dIr_dCps_dfreshV fuel))
  | _ -> failwith "DT: impossible branch"
)))
# 286 "Vuna/Compiler/Ir/Cps.vuna"
and v_Vuna_dCompiler_dIr_dCps_dcpsThunkCall = (fun fuel head args k -> (if (fuel <= 0) then ((v_Vuna_dCompiler_dIr_dCps_dapplyAll head) ((Base_dData_dList.v_Base_dData_dList_dappend args) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (k, Base_dData_dList.C_Base_dData_dList_dList_Nil)))) else ((v_Vuna_dCompiler_dIr_dCps_dapplyAll ((v_Vuna_dCompiler_dIr_dCps_dtransformDirect (fuel - 1)) head)) ((Base_dData_dList.v_Base_dData_dList_dappend ((v_Vuna_dCompiler_dIr_dCps_dmapDirect (fuel - 1)) args)) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (k, Base_dData_dList.C_Base_dData_dList_dList_Nil))))))
# 294 "Vuna/Compiler/Ir/Cps.vuna"
and v_Vuna_dCompiler_dIr_dCps_dcpsApp = (fun fuel env e k -> (if (fuel <= 0) then (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, k, e)) else ((fun p -> ((fun head -> ((fun args -> ((fun v -> (match head with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrVar (dtb__57) -> (if ((v_Vuna_dCompiler_dIr_dCps_dmemBinder dtb__57) env) then ((((v_Vuna_dCompiler_dIr_dCps_dcpsThunkCall (fuel - 1)) head) args) k) else ((((v_Vuna_dCompiler_dIr_dCps_dcpsExpr (fuel - 1)) env) head) (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLam ((Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (v, Base_dData_dList.C_Base_dData_dList_dList_Nil)), Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, ((((((v_Vuna_dCompiler_dIr_dCps_dcpsArgs (fuel - 1)) env) args) (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrVar (v))) Base_dData_dList.C_Base_dData_dList_dList_Nil) k)))))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrGlobal (dtb__58) -> (if (dtb__58 = v_Vuna_dCompiler_dIr_dCps_drunThunkName) then ((((v_Vuna_dCompiler_dIr_dCps_dcpsThunkCall (fuel - 1)) head) args) k) else ((((v_Vuna_dCompiler_dIr_dCps_dcpsExpr (fuel - 1)) env) head) (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLam ((Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (v, Base_dData_dList.C_Base_dData_dList_dList_Nil)), Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, ((((((v_Vuna_dCompiler_dIr_dCps_dcpsArgs (fuel - 1)) env) args) (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrVar (v))) Base_dData_dList.C_Base_dData_dList_dList_Nil) k)))))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRt (dtb__59) -> (if (dtb__59 = "prim_effectPerform") then ((((v_Vuna_dCompiler_dIr_dCps_dcpsThunkCall (fuel - 1)) (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRt (v_Vuna_dCompiler_dIr_dCps_dirCpsPerformName))) args) k) else (if (dtb__59 = "prim_effectHandle") then ((((v_Vuna_dCompiler_dIr_dCps_dcpsThunkCall (fuel - 1)) (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRt (v_Vuna_dCompiler_dIr_dCps_dirCpsHandleName))) args) k) else (if (dtb__59 = "prim_effectSelf") then ((((v_Vuna_dCompiler_dIr_dCps_dcpsThunkCall (fuel - 1)) (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRt (v_Vuna_dCompiler_dIr_dCps_dirCpsSelfName))) args) k) else ((((v_Vuna_dCompiler_dIr_dCps_dcpsExpr (fuel - 1)) env) head) (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLam ((Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (v, Base_dData_dList.C_Base_dData_dList_dList_Nil)), Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, ((((((v_Vuna_dCompiler_dIr_dCps_dcpsArgs (fuel - 1)) env) args) (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrVar (v))) Base_dData_dList.C_Base_dData_dList_dList_Nil) k)))))))
  | _ -> ((((v_Vuna_dCompiler_dIr_dCps_dcpsExpr (fuel - 1)) env) head) (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLam ((Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (v, Base_dData_dList.C_Base_dData_dList_dList_Nil)), Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, ((((((v_Vuna_dCompiler_dIr_dCps_dcpsArgs (fuel - 1)) env) args) (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrVar (v))) Base_dData_dList.C_Base_dData_dList_dList_Nil) k))))
)) (v_Vuna_dCompiler_dIr_dCps_dfreshV fuel))) (Base_dData_dPair.v_Base_dData_dPair_dsecondOf p))) (Base_dData_dPair.v_Base_dData_dPair_dfirstOf p))) (v_Vuna_dCompiler_dIr_dCps_dflattenApp e))))
# 318 "Vuna/Compiler/Ir/Cps.vuna"
and v_Vuna_dCompiler_dIr_dCps_dtransformDirect = (fun fuel e -> (if (fuel <= 0) then e else (match e with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCtor (dtb__60, dtb__61, dtb__62, dtb__63) -> (if ((v_Vuna_dCompiler_dIr_dCps_disThunkCtor dtb__60) dtb__61) then ((fun nd_uscrut6 -> (match nd_uscrut6 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__64, dtb__65) -> (match dtb__64 with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLam (dtb__66, dtb__67, dtb__68) -> (match dtb__65 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> ((fun k -> ((fun body1 -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCtor (dtb__60, dtb__61, Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ((Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLam (((Base_dData_dList.v_Base_dData_dList_dappend dtb__66) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (k, Base_dData_dList.C_Base_dData_dList_dList_Nil))), Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, body1)), Base_dData_dList.C_Base_dData_dList_dList_Nil))))) ((((v_Vuna_dCompiler_dIr_dCps_dcpsExpr (fuel - 1)) Base_dData_dList.C_Base_dData_dList_dList_Nil) dtb__68) (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrVar (k))))) (v_Vuna_dCompiler_dIr_dCps_dfreshK fuel))
  | _ -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCtor (dtb__60, dtb__61, Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, ((v_Vuna_dCompiler_dIr_dCps_dmapDirect (fuel - 1)) dtb__63)))
)
  | _ -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCtor (dtb__60, dtb__61, Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, ((v_Vuna_dCompiler_dIr_dCps_dmapDirect (fuel - 1)) dtb__63)))
)
  | _ -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCtor (dtb__60, dtb__61, Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, ((v_Vuna_dCompiler_dIr_dCps_dmapDirect (fuel - 1)) dtb__63)))
)) dtb__63) else (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCtor (dtb__60, dtb__61, Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, ((v_Vuna_dCompiler_dIr_dCps_dmapDirect (fuel - 1)) dtb__63))))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrEffThunk (dtb__69, dtb__70, dtb__71, dtb__72, dtb__73) -> ((fun u -> ((fun k -> ((fun argBs -> ((fun applied -> ((fun inner -> (if (dtb__72 <= 0) then inner else (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLam (argBs, Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, inner)))) (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCtor (dtb__69, dtb__70, Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ((Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLam ((Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (u, (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (k, Base_dData_dList.C_Base_dData_dList_dList_Nil)))), Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrVar (k)), applied)))), Base_dData_dList.C_Base_dData_dList_dList_Nil)))))) ((v_Vuna_dCompiler_dIr_dCps_dapplyAll ((v_Vuna_dCompiler_dIr_dCps_dtransformDirect (fuel - 1)) dtb__73)) ((Base_dData_dList.v_Base_dData_dList_dmap (fun _heta0 -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrVar (_heta0)))) argBs)))) ((Base_dData_dList.v_Base_dData_dList_dmap (fun (i : int) -> ((v_Vuna_dCompiler_dIr_dCps_dfreshA fuel) i))) ((Base_dData_dList.v_Base_dData_dList_drange 0) dtb__72)))) (v_Vuna_dCompiler_dIr_dCps_dfreshK fuel))) (v_Vuna_dCompiler_dIr_dCps_dfreshU fuel))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRecord (dtb__74, dtb__75, dtb__76) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRecord (dtb__74, Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, ((v_Vuna_dCompiler_dIr_dCps_dmapFieldsDirect (fuel - 1)) dtb__76)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrProj (dtb__77, dtb__78, dtb__79, dtb__80) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrProj (((v_Vuna_dCompiler_dIr_dCps_dtransformDirect (fuel - 1)) dtb__77), dtb__78, dtb__79, Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRecUpd (dtb__81, dtb__82, dtb__83, dtb__84) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRecUpd (((v_Vuna_dCompiler_dIr_dCps_dtransformDirect (fuel - 1)) dtb__81), dtb__82, ((v_Vuna_dCompiler_dIr_dCps_dmapFieldsDirect (fuel - 1)) dtb__83), Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRtApp (dtb__85, dtb__86) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRtApp (dtb__85, ((v_Vuna_dCompiler_dIr_dCps_dmapDirect (fuel - 1)) dtb__86)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCast (dtb__87, dtb__88, dtb__89) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCast (dtb__87, dtb__88, ((v_Vuna_dCompiler_dIr_dCps_dtransformDirect (fuel - 1)) dtb__89)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLet (dtb__90, dtb__91, dtb__92) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLet (dtb__90, ((v_Vuna_dCompiler_dIr_dCps_dtransformDirect (fuel - 1)) dtb__91), ((v_Vuna_dCompiler_dIr_dCps_dtransformDirect (fuel - 1)) dtb__92)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLam (dtb__93, dtb__94, dtb__95) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLam (dtb__93, dtb__94, ((v_Vuna_dCompiler_dIr_dCps_dtransformDirect (fuel - 1)) dtb__95)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (dtb__96, dtb__97, dtb__98) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, ((v_Vuna_dCompiler_dIr_dCps_dtransformDirect (fuel - 1)) dtb__97), ((v_Vuna_dCompiler_dIr_dCps_dtransformDirect (fuel - 1)) dtb__98)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrIf (dtb__99, dtb__100, dtb__101) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrIf (((v_Vuna_dCompiler_dIr_dCps_dtransformDirect (fuel - 1)) dtb__99), ((v_Vuna_dCompiler_dIr_dCps_dtransformDirect (fuel - 1)) dtb__100), ((v_Vuna_dCompiler_dIr_dCps_dtransformDirect (fuel - 1)) dtb__101)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCase (dtb__102, dtb__103, dtb__104, dtb__105) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCase (dtb__102, Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, ((v_Vuna_dCompiler_dIr_dCps_dtransformDirect (fuel - 1)) dtb__104), ((v_Vuna_dCompiler_dIr_dCps_dmapAltDirect (fuel - 1)) dtb__105)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrNatCase (dtb__106, dtb__107, dtb__108, dtb__109, dtb__110) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrNatCase (((v_Vuna_dCompiler_dIr_dCps_dtransformDirect (fuel - 1)) dtb__106), dtb__107, ((v_Vuna_dCompiler_dIr_dCps_dtransformAltMaybe (fuel - 1)) dtb__108), ((v_Vuna_dCompiler_dIr_dCps_dtransformAltMaybe (fuel - 1)) dtb__109), ((v_Vuna_dCompiler_dIr_dCps_dtransformAltMaybe (fuel - 1)) dtb__110)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrConcatMany (dtb__111) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrConcatMany (((v_Vuna_dCompiler_dIr_dCps_dmapDirect (fuel - 1)) dtb__111)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrVar (dtb__112) -> e
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrGlobal (dtb__113) -> e
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRt (dtb__114) -> e
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrInt (dtb__115) -> e
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrStr (dtb__116) -> e
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrBool (dtb__117) -> e
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrFloatLit (dtb__118) -> e
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrEffBind (dtb__119, dtb__120, dtb__121) -> e
  | _ -> failwith "DT: impossible branch"
)))
# 364 "Vuna/Compiler/Ir/Cps.vuna"
and v_Vuna_dCompiler_dIr_dCps_dtransformAltDirect = (fun fuel alt -> (if (fuel <= 0) then alt else { Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltCtor = (alt).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltCtor; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBinders = (alt).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBinders; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBody = ((v_Vuna_dCompiler_dIr_dCps_dtransformDirect (fuel - 1)) (alt).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBody) }))
# 371 "Vuna/Compiler/Ir/Cps.vuna"
and v_Vuna_dCompiler_dIr_dCps_dtransformAltMaybe = (fun fuel m -> (if (fuel <= 0) then m else (match m with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__122) -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (((v_Vuna_dCompiler_dIr_dCps_dtransformAltDirect (fuel - 1)) dtb__122)))
  | _ -> failwith "DT: impossible branch"
)))

# 213 "Vuna/Compiler/Ir/Cps.vuna"
let v_Vuna_dCompiler_dIr_dCps_didentityCont = ((fun v -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLam ((Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (v, Base_dData_dList.C_Base_dData_dList_dList_Nil)), Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrVar (v))))) (v_Vuna_dCompiler_dIr_dCps_dmkBinder "__cpsId"))

# 385 "Vuna/Compiler/Ir/Cps.vuna"
let rec v_Vuna_dCompiler_dIr_dCps_dtrampolineBody = (fun (mc0 : string) (mc1 : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIr) -> (match mc1 with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (dtb__123, dtb__124, dtb__125) -> (match dtb__124 with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (dtb__126, dtb__127, dtb__128) -> (match dtb__127 with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrGlobal (dtb__129) -> (if (dtb__129 = v_Vuna_dCompiler_dIr_dCps_drunThunkName) then (Base_dData_dResult.C_Base_dData_dResult_dResult_Ok (((v_Vuna_dCompiler_dIr_dCps_dapplyAll (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrGlobal (dtb__129))) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__128, (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__125, (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (v_Vuna_dCompiler_dIr_dCps_didentityCont, Base_dData_dList.C_Base_dData_dList_dList_Nil))))))))) else (Base_dData_dResult.C_Base_dData_dResult_dResult_Err (("CPS: unexpected trampoline shape: " ^ mc0))))
  | _ -> (Base_dData_dResult.C_Base_dData_dResult_dResult_Err (("CPS: unexpected trampoline shape: " ^ mc0)))
)
  | _ -> (Base_dData_dResult.C_Base_dData_dResult_dResult_Err (("CPS: unexpected trampoline shape: " ^ mc0)))
)
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCast (dtb__130, dtb__131, dtb__132) -> (match ((v_Vuna_dCompiler_dIr_dCps_dtrampolineBody mc0) dtb__132) with
  | Base_dData_dResult.C_Base_dData_dResult_dResult_Err (dtb__133) -> (Base_dData_dResult.C_Base_dData_dResult_dResult_Err (dtb__133))
  | Base_dData_dResult.C_Base_dData_dResult_dResult_Ok (dtb__134) -> (Base_dData_dResult.C_Base_dData_dResult_dResult_Ok ((Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCast (dtb__130, dtb__131, dtb__134))))
  | _ -> failwith "DT: impossible branch"
)
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLam (dtb__135, dtb__136, dtb__137) -> (match ((v_Vuna_dCompiler_dIr_dCps_dtrampolineBody mc0) dtb__137) with
  | Base_dData_dResult.C_Base_dData_dResult_dResult_Err (dtb__138) -> (Base_dData_dResult.C_Base_dData_dResult_dResult_Err (dtb__138))
  | Base_dData_dResult.C_Base_dData_dResult_dResult_Ok (dtb__139) -> (Base_dData_dResult.C_Base_dData_dResult_dResult_Ok ((Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLam (dtb__135, dtb__136, dtb__139))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> (Base_dData_dResult.C_Base_dData_dResult_dResult_Err (("CPS: unexpected trampoline shape: " ^ mc0)))
))

# 402 "Vuna/Compiler/Ir/Cps.vuna"
let rec v_Vuna_dCompiler_dIr_dCps_dselfAlt = (fun fuel alt name -> (if (fuel <= 0) then (Base_dData_dResult.C_Base_dData_dResult_dResult_Ok (alt)) else (match (((v_Vuna_dCompiler_dIr_dCps_dselfBody (fuel - 1)) (alt).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBody) name) with
  | Base_dData_dResult.C_Base_dData_dResult_dResult_Err (dtb__140) -> (Base_dData_dResult.C_Base_dData_dResult_dResult_Err (dtb__140))
  | Base_dData_dResult.C_Base_dData_dResult_dResult_Ok (dtb__141) -> (Base_dData_dResult.C_Base_dData_dResult_dResult_Ok ({ Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltCtor = (alt).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltCtor; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBinders = (alt).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBinders; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBody = dtb__141 }))
  | _ -> failwith "DT: impossible branch"
)))
# 411 "Vuna/Compiler/Ir/Cps.vuna"
and v_Vuna_dCompiler_dIr_dCps_dselfAlts = (fun fuel alts name -> (if (fuel <= 0) then (Base_dData_dResult.C_Base_dData_dResult_dResult_Ok (alts)) else (match alts with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Base_dData_dResult.C_Base_dData_dResult_dResult_Ok (Base_dData_dList.C_Base_dData_dList_dList_Nil))
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__142, dtb__143) -> (match (((v_Vuna_dCompiler_dIr_dCps_dselfAlt (fuel - 1)) dtb__142) name) with
  | Base_dData_dResult.C_Base_dData_dResult_dResult_Err (dtb__144) -> (Base_dData_dResult.C_Base_dData_dResult_dResult_Err (dtb__144))
  | Base_dData_dResult.C_Base_dData_dResult_dResult_Ok (dtb__145) -> (match (((v_Vuna_dCompiler_dIr_dCps_dselfAlts (fuel - 1)) dtb__143) name) with
  | Base_dData_dResult.C_Base_dData_dResult_dResult_Err (dtb__146) -> (Base_dData_dResult.C_Base_dData_dResult_dResult_Err (dtb__146))
  | Base_dData_dResult.C_Base_dData_dResult_dResult_Ok (dtb__147) -> (Base_dData_dResult.C_Base_dData_dResult_dResult_Ok ((Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__145, dtb__147))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))
# 426 "Vuna/Compiler/Ir/Cps.vuna"
and v_Vuna_dCompiler_dIr_dCps_dselfBody = (fun fuel body name -> (if (fuel <= 0) then (Base_dData_dResult.C_Base_dData_dResult_dResult_Ok (body)) else ((fun nd_uscrut3 -> (match nd_uscrut3 with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (dtb__148, dtb__149, dtb__150) -> (match dtb__149 with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRt (dtb__151) -> (if (dtb__151 = "prim_effectSelf") then (Base_dData_dResult.C_Base_dData_dResult_dResult_Ok (((v_Vuna_dCompiler_dIr_dCps_dapplyAll (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRt (v_Vuna_dCompiler_dIr_dCps_dirCpsSelfName))) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__150, (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (v_Vuna_dCompiler_dIr_dCps_didentityCont, Base_dData_dList.C_Base_dData_dList_dList_Nil))))))) else (Base_dData_dResult.C_Base_dData_dResult_dResult_Err (("CPS: unexpected handleScoped shape: " ^ name))))
  | _ -> (Base_dData_dResult.C_Base_dData_dResult_dResult_Err (("CPS: unexpected handleScoped shape: " ^ name)))
)
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCase (dtb__152, dtb__153, dtb__154, dtb__155) -> (match (((v_Vuna_dCompiler_dIr_dCps_dselfAlts (fuel - 1)) dtb__155) name) with
  | Base_dData_dResult.C_Base_dData_dResult_dResult_Err (dtb__156) -> (Base_dData_dResult.C_Base_dData_dResult_dResult_Err (dtb__156))
  | Base_dData_dResult.C_Base_dData_dResult_dResult_Ok (dtb__157) -> (Base_dData_dResult.C_Base_dData_dResult_dResult_Ok ((Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCase (dtb__152, Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, dtb__154, dtb__157))))
  | _ -> failwith "DT: impossible branch"
)
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCast (dtb__158, dtb__159, dtb__160) -> (match (((v_Vuna_dCompiler_dIr_dCps_dselfBody (fuel - 1)) dtb__160) name) with
  | Base_dData_dResult.C_Base_dData_dResult_dResult_Err (dtb__161) -> (Base_dData_dResult.C_Base_dData_dResult_dResult_Err (dtb__161))
  | Base_dData_dResult.C_Base_dData_dResult_dResult_Ok (dtb__162) -> (Base_dData_dResult.C_Base_dData_dResult_dResult_Ok ((Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCast (dtb__158, dtb__159, dtb__162))))
  | _ -> failwith "DT: impossible branch"
)
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLam (dtb__163, dtb__164, dtb__165) -> (match (((v_Vuna_dCompiler_dIr_dCps_dselfBody (fuel - 1)) dtb__165) name) with
  | Base_dData_dResult.C_Base_dData_dResult_dResult_Err (dtb__166) -> (Base_dData_dResult.C_Base_dData_dResult_dResult_Err (dtb__166))
  | Base_dData_dResult.C_Base_dData_dResult_dResult_Ok (dtb__167) -> (Base_dData_dResult.C_Base_dData_dResult_dResult_Ok ((Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLam (dtb__163, dtb__164, dtb__167))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> (Base_dData_dResult.C_Base_dData_dResult_dResult_Err (("CPS: unexpected handleScoped shape: " ^ name)))
)) body)))

# 447 "Vuna/Compiler/Ir/Cps.vuna"
let v_Vuna_dCompiler_dIr_dCps_dtransformDef = (fun fuel d -> (if (fuel <= 0) then (Base_dData_dResult.C_Base_dData_dResult_dResult_Ok (d)) else (match d with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrDef_IrExternDef (dtb__168, dtb__169, dtb__170, dtb__171) -> (Base_dData_dResult.C_Base_dData_dResult_dResult_Ok (d))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrDef_IrDef (dtb__172, dtb__173, dtb__174, dtb__175, dtb__176, dtb__177, dtb__178, dtb__179) -> (if (if (if (dtb__172 = v_Vuna_dCompiler_dIr_dCps_drunPureName) then true else (dtb__172 = v_Vuna_dCompiler_dIr_dCps_drunEffName)) then true else (dtb__172 = v_Vuna_dCompiler_dIr_dCps_drunMainName)) then (match ((v_Vuna_dCompiler_dIr_dCps_dtrampolineBody dtb__172) dtb__176) with
  | Base_dData_dResult.C_Base_dData_dResult_dResult_Err (dtb__180) -> (Base_dData_dResult.C_Base_dData_dResult_dResult_Err (dtb__180))
  | Base_dData_dResult.C_Base_dData_dResult_dResult_Ok (dtb__181) -> (Base_dData_dResult.C_Base_dData_dResult_dResult_Ok ((Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrDef_IrDef (dtb__172, dtb__173, dtb__174, Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, dtb__181, dtb__177, dtb__178, dtb__179))))
  | _ -> failwith "DT: impossible branch"
) else (if (dtb__172 = v_Vuna_dCompiler_dIr_dCps_dhandleScopedName) then (match (((v_Vuna_dCompiler_dIr_dCps_dselfBody (fuel - 1)) dtb__176) dtb__172) with
  | Base_dData_dResult.C_Base_dData_dResult_dResult_Err (dtb__182) -> (Base_dData_dResult.C_Base_dData_dResult_dResult_Err (dtb__182))
  | Base_dData_dResult.C_Base_dData_dResult_dResult_Ok (dtb__183) -> (Base_dData_dResult.C_Base_dData_dResult_dResult_Ok ((Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrDef_IrDef (dtb__172, dtb__173, dtb__174, Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, dtb__183, dtb__177, dtb__178, dtb__179))))
  | _ -> failwith "DT: impossible branch"
) else (Base_dData_dResult.C_Base_dData_dResult_dResult_Ok ((Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrDef_IrDef (dtb__172, dtb__173, dtb__174, Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, ((v_Vuna_dCompiler_dIr_dCps_dtransformDirect (fuel - 1)) dtb__176), dtb__177, dtb__178, dtb__179))))))
  | _ -> failwith "DT: impossible branch"
)))

# 466 "Vuna/Compiler/Ir/Cps.vuna"
let rec v_Vuna_dCompiler_dIr_dCps_dtransformDefs = (fun fuel xs -> (if (fuel <= 0) then (Base_dData_dResult.C_Base_dData_dResult_dResult_Ok (xs)) else (match xs with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Base_dData_dResult.C_Base_dData_dResult_dResult_Ok (Base_dData_dList.C_Base_dData_dList_dList_Nil))
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__184, dtb__185) -> (match ((v_Vuna_dCompiler_dIr_dCps_dtransformDef (fuel - 1)) dtb__184) with
  | Base_dData_dResult.C_Base_dData_dResult_dResult_Err (dtb__186) -> (Base_dData_dResult.C_Base_dData_dResult_dResult_Err (dtb__186))
  | Base_dData_dResult.C_Base_dData_dResult_dResult_Ok (dtb__187) -> (match ((v_Vuna_dCompiler_dIr_dCps_dtransformDefs (fuel - 1)) dtb__185) with
  | Base_dData_dResult.C_Base_dData_dResult_dResult_Err (dtb__188) -> (Base_dData_dResult.C_Base_dData_dResult_dResult_Err (dtb__188))
  | Base_dData_dResult.C_Base_dData_dResult_dResult_Ok (dtb__189) -> (Base_dData_dResult.C_Base_dData_dResult_dResult_Ok ((Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__187, dtb__189))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))

# 481 "Vuna/Compiler/Ir/Cps.vuna"
let v_Vuna_dCompiler_dIr_dCps_dtransformGroup = (fun fuel g -> (if (fuel <= 0) then (Base_dData_dResult.C_Base_dData_dResult_dResult_Ok (g)) else (match ((v_Vuna_dCompiler_dIr_dCps_dtransformDefs (fuel - 1)) (g).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrGroup_irGroupDefs) with
  | Base_dData_dResult.C_Base_dData_dResult_dResult_Err (dtb__190) -> (Base_dData_dResult.C_Base_dData_dResult_dResult_Err (dtb__190))
  | Base_dData_dResult.C_Base_dData_dResult_dResult_Ok (dtb__191) -> (Base_dData_dResult.C_Base_dData_dResult_dResult_Ok ({ Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrGroup_irGroupIsRec = (g).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrGroup_irGroupIsRec; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrGroup_irGroupDefs = dtb__191 }))
  | _ -> failwith "DT: impossible branch"
)))

# 490 "Vuna/Compiler/Ir/Cps.vuna"
let rec v_Vuna_dCompiler_dIr_dCps_dtransformGroups = (fun fuel xs -> (if (fuel <= 0) then (Base_dData_dResult.C_Base_dData_dResult_dResult_Ok (xs)) else (match xs with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Base_dData_dResult.C_Base_dData_dResult_dResult_Ok (Base_dData_dList.C_Base_dData_dList_dList_Nil))
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__192, dtb__193) -> (match ((v_Vuna_dCompiler_dIr_dCps_dtransformGroup (fuel - 1)) dtb__192) with
  | Base_dData_dResult.C_Base_dData_dResult_dResult_Err (dtb__194) -> (Base_dData_dResult.C_Base_dData_dResult_dResult_Err (dtb__194))
  | Base_dData_dResult.C_Base_dData_dResult_dResult_Ok (dtb__195) -> (match ((v_Vuna_dCompiler_dIr_dCps_dtransformGroups (fuel - 1)) dtb__193) with
  | Base_dData_dResult.C_Base_dData_dResult_dResult_Err (dtb__196) -> (Base_dData_dResult.C_Base_dData_dResult_dResult_Err (dtb__196))
  | Base_dData_dResult.C_Base_dData_dResult_dResult_Ok (dtb__197) -> (Base_dData_dResult.C_Base_dData_dResult_dResult_Ok ((Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__195, dtb__197))))
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
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRt (dtb__198) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRt ((v_Vuna_dCompiler_dIr_dCps_dselSym dtb__198)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRtApp (dtb__199, dtb__200) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRtApp ((v_Vuna_dCompiler_dIr_dCps_dselSym dtb__199), ((v_Vuna_dCompiler_dIr_dCps_dselSList (fuel - 1)) dtb__200)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCtor (dtb__201, dtb__202, dtb__203, dtb__204) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCtor (dtb__201, dtb__202, Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, ((v_Vuna_dCompiler_dIr_dCps_dselSList (fuel - 1)) dtb__204)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRecord (dtb__205, dtb__206, dtb__207) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRecord (dtb__205, Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, ((v_Vuna_dCompiler_dIr_dCps_dselSFields (fuel - 1)) dtb__207)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrProj (dtb__208, dtb__209, dtb__210, dtb__211) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrProj (((v_Vuna_dCompiler_dIr_dCps_dselSyms (fuel - 1)) dtb__208), dtb__209, dtb__210, Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRecUpd (dtb__212, dtb__213, dtb__214, dtb__215) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRecUpd (((v_Vuna_dCompiler_dIr_dCps_dselSyms (fuel - 1)) dtb__212), dtb__213, ((v_Vuna_dCompiler_dIr_dCps_dselSFields (fuel - 1)) dtb__214), Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCast (dtb__216, dtb__217, dtb__218) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCast (dtb__216, dtb__217, ((v_Vuna_dCompiler_dIr_dCps_dselSyms (fuel - 1)) dtb__218)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLet (dtb__219, dtb__220, dtb__221) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLet (dtb__219, ((v_Vuna_dCompiler_dIr_dCps_dselSyms (fuel - 1)) dtb__220), ((v_Vuna_dCompiler_dIr_dCps_dselSyms (fuel - 1)) dtb__221)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLam (dtb__222, dtb__223, dtb__224) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLam (dtb__222, dtb__223, ((v_Vuna_dCompiler_dIr_dCps_dselSyms (fuel - 1)) dtb__224)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (dtb__225, dtb__226, dtb__227) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, ((v_Vuna_dCompiler_dIr_dCps_dselSyms (fuel - 1)) dtb__226), ((v_Vuna_dCompiler_dIr_dCps_dselSyms (fuel - 1)) dtb__227)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrIf (dtb__228, dtb__229, dtb__230) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrIf (((v_Vuna_dCompiler_dIr_dCps_dselSyms (fuel - 1)) dtb__228), ((v_Vuna_dCompiler_dIr_dCps_dselSyms (fuel - 1)) dtb__229), ((v_Vuna_dCompiler_dIr_dCps_dselSyms (fuel - 1)) dtb__230)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCase (dtb__231, dtb__232, dtb__233, dtb__234) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCase (dtb__231, Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, ((v_Vuna_dCompiler_dIr_dCps_dselSyms (fuel - 1)) dtb__233), ((v_Vuna_dCompiler_dIr_dCps_dselSymsAlt (fuel - 1)) dtb__234)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrNatCase (dtb__235, dtb__236, dtb__237, dtb__238, dtb__239) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrNatCase (((v_Vuna_dCompiler_dIr_dCps_dselSyms (fuel - 1)) dtb__235), dtb__236, ((v_Vuna_dCompiler_dIr_dCps_dselSymsAltM (fuel - 1)) dtb__237), ((v_Vuna_dCompiler_dIr_dCps_dselSymsAltM (fuel - 1)) dtb__238), ((v_Vuna_dCompiler_dIr_dCps_dselSymsAltM (fuel - 1)) dtb__239)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrConcatMany (dtb__240) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrConcatMany (((v_Vuna_dCompiler_dIr_dCps_dselSList (fuel - 1)) dtb__240)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrEffThunk (dtb__241, dtb__242, dtb__243, dtb__244, dtb__245) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrEffThunk (dtb__241, dtb__242, dtb__243, dtb__244, ((v_Vuna_dCompiler_dIr_dCps_dselSyms (fuel - 1)) dtb__245)))
  | _ -> e
)))
# 543 "Vuna/Compiler/Ir/Cps.vuna"
and v_Vuna_dCompiler_dIr_dCps_dselSList = (fun fuel xs -> (if (fuel <= 0) then xs else (match xs with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__246, dtb__247) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (((v_Vuna_dCompiler_dIr_dCps_dselSyms (fuel - 1)) dtb__246), ((v_Vuna_dCompiler_dIr_dCps_dselSList (fuel - 1)) dtb__247)))
  | _ -> failwith "DT: impossible branch"
)))
# 552 "Vuna/Compiler/Ir/Cps.vuna"
and v_Vuna_dCompiler_dIr_dCps_dselSFields = (fun fuel fs -> (if (fuel <= 0) then fs else (match fs with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__248, dtb__249) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Base_dData_dPair.v_Base_dData_dPair_dfirstOf dtb__248); Base_dData_dPair.f_Base_dData_dPair_dPair_second = ((v_Vuna_dCompiler_dIr_dCps_dselSyms (fuel - 1)) (Base_dData_dPair.v_Base_dData_dPair_dsecondOf dtb__248)) }, ((v_Vuna_dCompiler_dIr_dCps_dselSFields (fuel - 1)) dtb__249)))
  | _ -> failwith "DT: impossible branch"
)))
# 561 "Vuna/Compiler/Ir/Cps.vuna"
and v_Vuna_dCompiler_dIr_dCps_dselSymsAlt = (fun fuel alts -> (if (fuel <= 0) then alts else (match alts with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__250, dtb__251) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltCtor = (dtb__250).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltCtor; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBinders = (dtb__250).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBinders; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBody = ((v_Vuna_dCompiler_dIr_dCps_dselSyms (fuel - 1)) (dtb__250).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBody) }, ((v_Vuna_dCompiler_dIr_dCps_dselSymsAlt (fuel - 1)) dtb__251)))
  | _ -> failwith "DT: impossible branch"
)))
# 570 "Vuna/Compiler/Ir/Cps.vuna"
and v_Vuna_dCompiler_dIr_dCps_dselSymsAltM = (fun fuel m -> (if (fuel <= 0) then m else (match m with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__252) -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ({ Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltCtor = (dtb__252).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltCtor; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBinders = (dtb__252).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBinders; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBody = ((v_Vuna_dCompiler_dIr_dCps_dselSyms (fuel - 1)) (dtb__252).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBody) }))
  | _ -> failwith "DT: impossible branch"
)))

# 580 "Vuna/Compiler/Ir/Cps.vuna"
let v_Vuna_dCompiler_dIr_dCps_dstepDoneCont = ((fun v -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLam ((Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (v, Base_dData_dList.C_Base_dData_dList_dList_Nil)), Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRt (v_Vuna_dCompiler_dIr_dCps_dirSelDoneName)), (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrVar (v))))))) (v_Vuna_dCompiler_dIr_dCps_dmkBinder "__selId"))

# 586 "Vuna/Compiler/Ir/Cps.vuna"
let rec v_Vuna_dCompiler_dIr_dCps_dselTrampolineBody = (fun (mc0 : string) (mc1 : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIr) -> (match mc1 with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (dtb__253, dtb__254, dtb__255) -> (match dtb__254 with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (dtb__256, dtb__257, dtb__258) -> (match dtb__257 with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (dtb__259, dtb__260, dtb__261) -> (match dtb__260 with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrGlobal (dtb__262) -> (if (dtb__262 = v_Vuna_dCompiler_dIr_dCps_drunThunkName) then (Base_dData_dResult.C_Base_dData_dResult_dResult_Ok ((Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRt (v_Vuna_dCompiler_dIr_dCps_dirSelRunName)), ((v_Vuna_dCompiler_dIr_dCps_dapplyAll (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrGlobal (dtb__262))) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__261, (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__258, (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (v_Vuna_dCompiler_dIr_dCps_dstepDoneCont, Base_dData_dList.C_Base_dData_dList_dList_Nil))))))))))) else (Base_dData_dResult.C_Base_dData_dResult_dResult_Err (("selective CPS: unexpected trampoline shape: " ^ mc0))))
  | _ -> (Base_dData_dResult.C_Base_dData_dResult_dResult_Err (("selective CPS: unexpected trampoline shape: " ^ mc0)))
)
  | _ -> (Base_dData_dResult.C_Base_dData_dResult_dResult_Err (("selective CPS: unexpected trampoline shape: " ^ mc0)))
)
  | _ -> (Base_dData_dResult.C_Base_dData_dResult_dResult_Err (("selective CPS: unexpected trampoline shape: " ^ mc0)))
)
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCast (dtb__263, dtb__264, dtb__265) -> (match ((v_Vuna_dCompiler_dIr_dCps_dselTrampolineBody mc0) dtb__265) with
  | Base_dData_dResult.C_Base_dData_dResult_dResult_Err (dtb__266) -> (Base_dData_dResult.C_Base_dData_dResult_dResult_Err (dtb__266))
  | Base_dData_dResult.C_Base_dData_dResult_dResult_Ok (dtb__267) -> (Base_dData_dResult.C_Base_dData_dResult_dResult_Ok ((Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCast (dtb__263, dtb__264, dtb__267))))
  | _ -> failwith "DT: impossible branch"
)
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLam (dtb__268, dtb__269, dtb__270) -> (match ((v_Vuna_dCompiler_dIr_dCps_dselTrampolineBody mc0) dtb__270) with
  | Base_dData_dResult.C_Base_dData_dResult_dResult_Err (dtb__271) -> (Base_dData_dResult.C_Base_dData_dResult_dResult_Err (dtb__271))
  | Base_dData_dResult.C_Base_dData_dResult_dResult_Ok (dtb__272) -> (Base_dData_dResult.C_Base_dData_dResult_dResult_Ok ((Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLam (dtb__268, dtb__269, dtb__272))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> (Base_dData_dResult.C_Base_dData_dResult_dResult_Err (("selective CPS: unexpected trampoline shape: " ^ mc0)))
))

# 603 "Vuna/Compiler/Ir/Cps.vuna"
let rec v_Vuna_dCompiler_dIr_dCps_dselSelfBody = (fun fuel body -> (if (fuel <= 0) then (Base_dData_dResult.C_Base_dData_dResult_dResult_Ok (body)) else ((fun nd_uscrut2 -> (match nd_uscrut2 with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (dtb__273, dtb__274, dtb__275) -> (match dtb__274 with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (dtb__276, dtb__277, dtb__278) -> (match dtb__277 with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRt (dtb__279) -> (if (dtb__279 = v_Vuna_dCompiler_dIr_dCps_dirSelSelfName) then (Base_dData_dResult.C_Base_dData_dResult_dResult_Ok ((Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRt (dtb__279)), dtb__278)), v_Vuna_dCompiler_dIr_dCps_dstepDoneCont)))) else (Base_dData_dResult.C_Base_dData_dResult_dResult_Err ("selective CPS: unexpected handleScoped shape")))
  | _ -> (Base_dData_dResult.C_Base_dData_dResult_dResult_Err ("selective CPS: unexpected handleScoped shape"))
)
  | _ -> (Base_dData_dResult.C_Base_dData_dResult_dResult_Err ("selective CPS: unexpected handleScoped shape"))
)
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCase (dtb__280, dtb__281, dtb__282, dtb__283) -> (match ((v_Vuna_dCompiler_dIr_dCps_dselSelfAlts (fuel - 1)) dtb__283) with
  | Base_dData_dResult.C_Base_dData_dResult_dResult_Err (dtb__284) -> (Base_dData_dResult.C_Base_dData_dResult_dResult_Err (dtb__284))
  | Base_dData_dResult.C_Base_dData_dResult_dResult_Ok (dtb__285) -> (Base_dData_dResult.C_Base_dData_dResult_dResult_Ok ((Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCase (dtb__280, Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, dtb__282, dtb__285))))
  | _ -> failwith "DT: impossible branch"
)
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCast (dtb__286, dtb__287, dtb__288) -> (match ((v_Vuna_dCompiler_dIr_dCps_dselSelfBody (fuel - 1)) dtb__288) with
  | Base_dData_dResult.C_Base_dData_dResult_dResult_Err (dtb__289) -> (Base_dData_dResult.C_Base_dData_dResult_dResult_Err (dtb__289))
  | Base_dData_dResult.C_Base_dData_dResult_dResult_Ok (dtb__290) -> (Base_dData_dResult.C_Base_dData_dResult_dResult_Ok ((Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCast (dtb__286, dtb__287, dtb__290))))
  | _ -> failwith "DT: impossible branch"
)
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLam (dtb__291, dtb__292, dtb__293) -> (match ((v_Vuna_dCompiler_dIr_dCps_dselSelfBody (fuel - 1)) dtb__293) with
  | Base_dData_dResult.C_Base_dData_dResult_dResult_Err (dtb__294) -> (Base_dData_dResult.C_Base_dData_dResult_dResult_Err (dtb__294))
  | Base_dData_dResult.C_Base_dData_dResult_dResult_Ok (dtb__295) -> (Base_dData_dResult.C_Base_dData_dResult_dResult_Ok ((Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLam (dtb__291, dtb__292, dtb__295))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> (Base_dData_dResult.C_Base_dData_dResult_dResult_Err ("selective CPS: unexpected handleScoped shape"))
)) body)))
# 624 "Vuna/Compiler/Ir/Cps.vuna"
and v_Vuna_dCompiler_dIr_dCps_dselSelfAlts = (fun fuel alts -> (if (fuel <= 0) then (Base_dData_dResult.C_Base_dData_dResult_dResult_Ok (alts)) else (match alts with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Base_dData_dResult.C_Base_dData_dResult_dResult_Ok (Base_dData_dList.C_Base_dData_dList_dList_Nil))
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__296, dtb__297) -> (match ((v_Vuna_dCompiler_dIr_dCps_dselSelfBody (fuel - 1)) (dtb__296).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBody) with
  | Base_dData_dResult.C_Base_dData_dResult_dResult_Err (dtb__298) -> (Base_dData_dResult.C_Base_dData_dResult_dResult_Err (dtb__298))
  | Base_dData_dResult.C_Base_dData_dResult_dResult_Ok (dtb__299) -> (match ((v_Vuna_dCompiler_dIr_dCps_dselSelfAlts (fuel - 1)) dtb__297) with
  | Base_dData_dResult.C_Base_dData_dResult_dResult_Err (dtb__300) -> (Base_dData_dResult.C_Base_dData_dResult_dResult_Err (dtb__300))
  | Base_dData_dResult.C_Base_dData_dResult_dResult_Ok (dtb__301) -> (Base_dData_dResult.C_Base_dData_dResult_dResult_Ok ((Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltCtor = (dtb__296).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltCtor; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBinders = (dtb__296).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBinders; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBody = dtb__299 }, dtb__301))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))

# 639 "Vuna/Compiler/Ir/Cps.vuna"
let v_Vuna_dCompiler_dIr_dCps_dselDef = (fun fuel d -> (if (fuel <= 0) then (Base_dData_dResult.C_Base_dData_dResult_dResult_Ok (d)) else (match d with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrDef_IrExternDef (dtb__302, dtb__303, dtb__304, dtb__305) -> (Base_dData_dResult.C_Base_dData_dResult_dResult_Ok (d))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrDef_IrDef (dtb__306, dtb__307, dtb__308, dtb__309, dtb__310, dtb__311, dtb__312, dtb__313) -> ((fun b -> (if (if (if (dtb__306 = v_Vuna_dCompiler_dIr_dCps_drunPureName) then true else (dtb__306 = v_Vuna_dCompiler_dIr_dCps_drunEffName)) then true else (dtb__306 = v_Vuna_dCompiler_dIr_dCps_drunMainName)) then (match ((v_Vuna_dCompiler_dIr_dCps_dselTrampolineBody dtb__306) b) with
  | Base_dData_dResult.C_Base_dData_dResult_dResult_Err (dtb__314) -> (Base_dData_dResult.C_Base_dData_dResult_dResult_Err (dtb__314))
  | Base_dData_dResult.C_Base_dData_dResult_dResult_Ok (dtb__315) -> (Base_dData_dResult.C_Base_dData_dResult_dResult_Ok ((Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrDef_IrDef (dtb__306, dtb__307, dtb__308, Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, dtb__315, dtb__311, dtb__312, dtb__313))))
  | _ -> failwith "DT: impossible branch"
) else (if (dtb__306 = v_Vuna_dCompiler_dIr_dCps_dhandleScopedName) then (match ((v_Vuna_dCompiler_dIr_dCps_dselSelfBody (fuel - 1)) b) with
  | Base_dData_dResult.C_Base_dData_dResult_dResult_Err (dtb__316) -> (Base_dData_dResult.C_Base_dData_dResult_dResult_Err (dtb__316))
  | Base_dData_dResult.C_Base_dData_dResult_dResult_Ok (dtb__317) -> (Base_dData_dResult.C_Base_dData_dResult_dResult_Ok ((Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrDef_IrDef (dtb__306, dtb__307, dtb__308, Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, dtb__317, dtb__311, dtb__312, dtb__313))))
  | _ -> failwith "DT: impossible branch"
) else (Base_dData_dResult.C_Base_dData_dResult_dResult_Ok ((Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrDef_IrDef (dtb__306, dtb__307, dtb__308, Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, b, dtb__311, dtb__312, dtb__313))))))) ((v_Vuna_dCompiler_dIr_dCps_dselSyms (fuel - 1)) dtb__310))
  | _ -> failwith "DT: impossible branch"
)))

# 660 "Vuna/Compiler/Ir/Cps.vuna"
let rec v_Vuna_dCompiler_dIr_dCps_dselDefs = (fun fuel defs -> (if (fuel <= 0) then (Base_dData_dResult.C_Base_dData_dResult_dResult_Ok (defs)) else (match defs with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Base_dData_dResult.C_Base_dData_dResult_dResult_Ok (Base_dData_dList.C_Base_dData_dList_dList_Nil))
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__318, dtb__319) -> (match ((v_Vuna_dCompiler_dIr_dCps_dselDef (fuel - 1)) dtb__318) with
  | Base_dData_dResult.C_Base_dData_dResult_dResult_Err (dtb__320) -> (Base_dData_dResult.C_Base_dData_dResult_dResult_Err (dtb__320))
  | Base_dData_dResult.C_Base_dData_dResult_dResult_Ok (dtb__321) -> (match ((v_Vuna_dCompiler_dIr_dCps_dselDefs (fuel - 1)) dtb__319) with
  | Base_dData_dResult.C_Base_dData_dResult_dResult_Err (dtb__322) -> (Base_dData_dResult.C_Base_dData_dResult_dResult_Err (dtb__322))
  | Base_dData_dResult.C_Base_dData_dResult_dResult_Ok (dtb__323) -> (Base_dData_dResult.C_Base_dData_dResult_dResult_Ok ((Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__321, dtb__323))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))

# 679 "Vuna/Compiler/Ir/Cps.vuna"
let v_Vuna_dCompiler_dIr_dCps_dmBNameText = (fun (mc0 : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrBName) -> (match mc0 with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrBName_IrBWild -> "wild"
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrBName_IrBNat (dtb__324) -> ("nat" ^ (bi_strFromInt dtb__324))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrBName_IrBArm (dtb__325) -> ("arm" ^ (bi_strFromInt dtb__325))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrBName_IrBUser (dtb__326) -> dtb__326
  | _ -> failwith "DT: impossible branch"
))

# 685 "Vuna/Compiler/Ir/Cps.vuna"
let v_Vuna_dCompiler_dIr_dCps_dmIsOp = (fun b -> (match (b).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrBinder_irBinderName with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrBName_IrBUser (dtb__327) -> (dtb__327 = "@vuna@handle@o")
  | _ -> false
))

# 694 "Vuna/Compiler/Ir/Cps.vuna"
let rec v_Vuna_dCompiler_dIr_dCps_dmResumeGo = (fun (mc0 : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrBinder Base_dData_dList.t_Base_dData_dList_dList) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__328, dtb__329) -> (if (v_Vuna_dCompiler_dIr_dCps_dmIsOp dtb__328) then (match dtb__329 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__330, dtb__331) -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__330))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
) else (v_Vuna_dCompiler_dIr_dCps_dmResumeGo dtb__329))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 691 "Vuna/Compiler/Ir/Cps.vuna"
let v_Vuna_dCompiler_dIr_dCps_dmResumption = (fun bs -> (v_Vuna_dCompiler_dIr_dCps_dmResumeGo (v_Vuna_dCompiler_dIr_dCps_druntimeBinders bs)))

# 704 "Vuna/Compiler/Ir/Cps.vuna"
let rec v_Vuna_dCompiler_dIr_dCps_dmEraseHead = (fun (mc0 : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIr) -> (match mc0 with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCast (dtb__332, dtb__333, dtb__334) -> (v_Vuna_dCompiler_dIr_dCps_dmEraseHead dtb__334)
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (dtb__335, dtb__336, dtb__337) -> (match dtb__336 with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRt (dtb__338) -> (if (dtb__338 = "prim_erase") then (v_Vuna_dCompiler_dIr_dCps_dmEraseHead dtb__337) else mc0)
  | _ -> mc0
)
  | _ -> mc0
))

# 711 "Vuna/Compiler/Ir/Cps.vuna"
let rec v_Vuna_dCompiler_dIr_dCps_dmStripErase = (fun (mc0 : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIr) -> (match mc0 with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (dtb__339, dtb__340, dtb__341) -> (match dtb__340 with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRt (dtb__342) -> (if (dtb__342 = "prim_erase") then (v_Vuna_dCompiler_dIr_dCps_dmStripErase dtb__341) else (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRt (dtb__342)), dtb__341)))
  | _ -> mc0
)
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCast (dtb__343, dtb__344, dtb__345) -> (v_Vuna_dCompiler_dIr_dCps_dmStripErase dtb__345)
  | _ -> mc0
))

# 720 "Vuna/Compiler/Ir/Cps.vuna"
let v_Vuna_dCompiler_dIr_dCps_dmIsResumeAppGo = (fun (mc0 : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrBinder) (mc1 : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIr) -> (match mc1 with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (dtb__346, dtb__347, dtb__348) -> ((fun p -> (match (v_Vuna_dCompiler_dIr_dCps_dmEraseHead (Base_dData_dPair.v_Base_dData_dPair_dfirstOf p)) with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrVar (dtb__349) -> ((v_Vuna_dCompiler_dIr_dCps_dmBNameText (dtb__349).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrBinder_irBinderName) = (v_Vuna_dCompiler_dIr_dCps_dmBNameText (mc0).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrBinder_irBinderName))
  | _ -> (match (Base_dData_dPair.v_Base_dData_dPair_dsecondOf p) with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__350, dtb__351) -> (match (v_Vuna_dCompiler_dIr_dCps_dmEraseHead dtb__350) with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrVar (dtb__352) -> ((v_Vuna_dCompiler_dIr_dCps_dmBNameText (dtb__352).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrBinder_irBinderName) = (v_Vuna_dCompiler_dIr_dCps_dmBNameText (mc0).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrBinder_irBinderName))
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
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__353) -> (match dtb__353 with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyData (dtb__354, dtb__355) -> (dtb__354 = Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirEffTypeName)
  | _ -> false
)
  | _ -> false
))

# 750 "Vuna/Compiler/Ir/Cps.vuna"
let v_Vuna_dCompiler_dIr_dCps_disEffContLambda = (fun _uarity0 -> (v_Vuna_dCompiler_dIr_dCps_disEffResultTy _uarity0))

# 754 "Vuna/Compiler/Ir/Cps.vuna"
let v_Vuna_dCompiler_dIr_dCps_disEffThunkBody = (fun (mc0 : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIr) -> (match mc0 with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCtor (dtb__356, dtb__357, dtb__358, dtb__359) -> (match dtb__359 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__360, dtb__361) -> (match dtb__360 with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLam (dtb__362, dtb__363, dtb__364) -> (match dtb__361 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (if (dtb__356 = Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirEffTypeName) then (dtb__357 = Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirEffMkCtor) else false)
  | _ -> false
)
  | _ -> false
)
  | _ -> false
)
  | _ -> false
))

# 760 "Vuna/Compiler/Ir/Cps.vuna"
let v_Vuna_dCompiler_dIr_dCps_dmRunEffTerm = (fun eff k -> ((fun th -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCase (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, eff, (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltCtor = (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirEffTypeName; Base_dData_dPair.f_Base_dData_dPair_dPair_second = Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirEffMkCtor })); Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBinders = (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (th, Base_dData_dList.C_Base_dData_dList_dList_Nil)); Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBody = (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRtApp (v_Vuna_dCompiler_dIr_dCps_dirMRunEffName, (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ((Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrVar (th)), (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (k, Base_dData_dList.C_Base_dData_dList_dList_Nil)))))) }, Base_dData_dList.C_Base_dData_dList_dList_Nil))))) (v_Vuna_dCompiler_dIr_dCps_dmkBinder "__mEffTh")))

# 770 "Vuna/Compiler/Ir/Cps.vuna"
let v_Vuna_dCompiler_dIr_dCps_dmNoResumption = (v_Vuna_dCompiler_dIr_dCps_dmkBinder "@vuna@noresume")

# 775 "Vuna/Compiler/Ir/Cps.vuna"
let rec v_Vuna_dCompiler_dIr_dCps_dmEffContLambda = (fun fuel r bs rt body -> ((fun kd -> ((fun u -> ((fun v -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLam (bs, rt, (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCtor (Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirEffTypeName, Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirEffMkCtor, Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ((Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLam ((Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (u, (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (kd, Base_dData_dList.C_Base_dData_dList_dList_Nil)))), Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, ((((v_Vuna_dCompiler_dIr_dCps_dmCps (fuel - 1)) r) (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLam ((Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (v, Base_dData_dList.C_Base_dData_dList_dList_Nil)), Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, ((v_Vuna_dCompiler_dIr_dCps_dmRunEffTerm (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrVar (v))) (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrVar (kd)))))) body))), Base_dData_dList.C_Base_dData_dList_dList_Nil))))))) (v_Vuna_dCompiler_dIr_dCps_dmFreshV fuel))) (v_Vuna_dCompiler_dIr_dCps_dmkBinder "__mEffU"))) (v_Vuna_dCompiler_dIr_dCps_dmFreshK fuel)))
# 786 "Vuna/Compiler/Ir/Cps.vuna"
and v_Vuna_dCompiler_dIr_dCps_dmCpsAlts = (fun fuel r k alts -> (if (fuel <= 0) then alts else (match alts with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__365, dtb__366) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltCtor = (dtb__365).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltCtor; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBinders = (dtb__365).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBinders; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBody = ((((v_Vuna_dCompiler_dIr_dCps_dmCps (fuel - 1)) r) k) (dtb__365).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBody) }, ((((v_Vuna_dCompiler_dIr_dCps_dmCpsAlts (fuel - 1)) r) k) dtb__366)))
  | _ -> failwith "DT: impossible branch"
)))
# 795 "Vuna/Compiler/Ir/Cps.vuna"
and v_Vuna_dCompiler_dIr_dCps_dmCpsAltM = (fun fuel r k m -> (if (fuel <= 0) then m else (match m with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__367) -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ({ Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltCtor = (dtb__367).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltCtor; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBinders = (dtb__367).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBinders; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBody = ((((v_Vuna_dCompiler_dIr_dCps_dmCps (fuel - 1)) r) k) (dtb__367).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBody) }))
  | _ -> failwith "DT: impossible branch"
)))
# 811 "Vuna/Compiler/Ir/Cps.vuna"
and v_Vuna_dCompiler_dIr_dCps_dmCpsArgs = (fun fuel r k sym args acc -> (if (fuel <= 0) then (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, k, (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRtApp (sym, (Base_dData_dList.v_Base_dData_dList_dreverse acc))))) else (match args with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, k, (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRtApp (sym, (Base_dData_dList.v_Base_dData_dList_dreverse acc)))))
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__368, dtb__369) -> ((fun v -> ((((v_Vuna_dCompiler_dIr_dCps_dmCps (fuel - 1)) r) (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLam ((Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (v, Base_dData_dList.C_Base_dData_dList_dList_Nil)), Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, ((((((v_Vuna_dCompiler_dIr_dCps_dmCpsArgs (fuel - 1)) r) k) sym) dtb__369) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ((Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrVar (v)), acc)))))) dtb__368)) (v_Vuna_dCompiler_dIr_dCps_dmFreshV fuel))
  | _ -> failwith "DT: impossible branch"
)))
# 824 "Vuna/Compiler/Ir/Cps.vuna"
and v_Vuna_dCompiler_dIr_dCps_dmCpsApply = (fun fuel r k parts -> (if (fuel <= 0) then (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, k, (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrGlobal ("?")))) else ((fun nd_uscrut4 -> (match nd_uscrut4 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__370, dtb__371) -> (match dtb__371 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> ((((v_Vuna_dCompiler_dIr_dCps_dmCps (fuel - 1)) r) k) dtb__370)
  | _ -> ((fun v -> ((((v_Vuna_dCompiler_dIr_dCps_dmCps (fuel - 1)) r) (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLam ((Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (v, Base_dData_dList.C_Base_dData_dList_dList_Nil)), Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, ((((((v_Vuna_dCompiler_dIr_dCps_dmCpsApplyArgs (fuel - 1)) r) k) dtb__371) Base_dData_dList.C_Base_dData_dList_dList_Nil) v)))) dtb__370)) (v_Vuna_dCompiler_dIr_dCps_dmFreshV fuel))
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, k, (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrGlobal ("?"))))
  | _ -> failwith "DT: impossible branch"
)) parts)))
# 837 "Vuna/Compiler/Ir/Cps.vuna"
and v_Vuna_dCompiler_dIr_dCps_dmCpsApplyArgs = (fun fuel r k args acc headV -> (if (fuel <= 0) then (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, k, (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrGlobal ("?")))) else (match args with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, k, ((v_Vuna_dCompiler_dIr_dCps_dapplyAll (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrVar (headV))) (Base_dData_dList.v_Base_dData_dList_dreverse acc))))
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__372, dtb__373) -> ((fun v -> ((((v_Vuna_dCompiler_dIr_dCps_dmCps (fuel - 1)) r) (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLam ((Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (v, Base_dData_dList.C_Base_dData_dList_dList_Nil)), Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, ((((((v_Vuna_dCompiler_dIr_dCps_dmCpsApplyArgs (fuel - 1)) r) k) dtb__373) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ((Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrVar (v)), acc))) headV)))) dtb__372)) (v_Vuna_dCompiler_dIr_dCps_dmFreshV fuel))
  | _ -> failwith "DT: impossible branch"
)))
# 849 "Vuna/Compiler/Ir/Cps.vuna"
and v_Vuna_dCompiler_dIr_dCps_dmCps = (fun fuel r k e -> (if (fuel <= 0) then (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, k, e)) else (if ((v_Vuna_dCompiler_dIr_dCps_dmIsResumeApp r) e) then (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, e, k)) else (match e with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLet (dtb__374, dtb__375, dtb__376) -> ((fun v -> ((fun cont -> ((((v_Vuna_dCompiler_dIr_dCps_dmCps (fuel - 1)) r) cont) dtb__375)) (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLam ((Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (v, Base_dData_dList.C_Base_dData_dList_dList_Nil)), Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLet (dtb__374, (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrVar (v)), ((((v_Vuna_dCompiler_dIr_dCps_dmCps (fuel - 1)) r) k) dtb__376))))))) (v_Vuna_dCompiler_dIr_dCps_dmFreshV fuel))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCase (dtb__377, dtb__378, dtb__379, dtb__380) -> ((fun v -> ((fun cont -> ((((v_Vuna_dCompiler_dIr_dCps_dmCps (fuel - 1)) r) cont) dtb__379)) (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLam ((Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (v, Base_dData_dList.C_Base_dData_dList_dList_Nil)), Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCase (dtb__377, Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrVar (v)), ((((v_Vuna_dCompiler_dIr_dCps_dmCpsAlts (fuel - 2)) r) k) dtb__380))))))) (v_Vuna_dCompiler_dIr_dCps_dmFreshV fuel))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrIf (dtb__381, dtb__382, dtb__383) -> ((fun v -> ((fun cont -> ((((v_Vuna_dCompiler_dIr_dCps_dmCps (fuel - 1)) r) cont) dtb__381)) (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLam ((Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (v, Base_dData_dList.C_Base_dData_dList_dList_Nil)), Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrIf ((Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrVar (v)), ((((v_Vuna_dCompiler_dIr_dCps_dmCps (fuel - 2)) r) k) dtb__382), ((((v_Vuna_dCompiler_dIr_dCps_dmCps (fuel - 2)) r) k) dtb__383))))))) (v_Vuna_dCompiler_dIr_dCps_dmFreshV fuel))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrNatCase (dtb__384, dtb__385, dtb__386, dtb__387, dtb__388) -> ((fun v -> ((fun cont -> ((((v_Vuna_dCompiler_dIr_dCps_dmCps (fuel - 1)) r) cont) dtb__384)) (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLam ((Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (v, Base_dData_dList.C_Base_dData_dList_dList_Nil)), Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrNatCase ((Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrVar (v)), dtb__385, ((((v_Vuna_dCompiler_dIr_dCps_dmCpsAltM (fuel - 2)) r) k) dtb__386), ((((v_Vuna_dCompiler_dIr_dCps_dmCpsAltM (fuel - 2)) r) k) dtb__387), ((((v_Vuna_dCompiler_dIr_dCps_dmCpsAltM (fuel - 2)) r) k) dtb__388))))))) (v_Vuna_dCompiler_dIr_dCps_dmFreshV fuel))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCast (dtb__389, dtb__390, dtb__391) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCast (dtb__389, dtb__390, ((((v_Vuna_dCompiler_dIr_dCps_dmCps (fuel - 1)) r) k) dtb__391)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRtApp (dtb__392, dtb__393) -> ((((((v_Vuna_dCompiler_dIr_dCps_dmCpsArgs (fuel - 1)) r) k) dtb__392) dtb__393) Base_dData_dList.C_Base_dData_dList_dList_Nil)
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLam (dtb__394, dtb__395, dtb__396) -> (if (v_Vuna_dCompiler_dIr_dCps_disEffContLambda dtb__395) then (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, k, (((((v_Vuna_dCompiler_dIr_dCps_dmEffContLambda (fuel - 1)) r) dtb__394) dtb__395) dtb__396))) else (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, k, e)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (dtb__397, dtb__398, dtb__399) -> ((fun p -> ((((v_Vuna_dCompiler_dIr_dCps_dmCpsApply (fuel - 1)) r) k) ((Base_dData_dList.v_Base_dData_dList_dappend (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ((Base_dData_dPair.v_Base_dData_dPair_dfirstOf p), Base_dData_dList.C_Base_dData_dList_dList_Nil))) (Base_dData_dPair.v_Base_dData_dPair_dsecondOf p)))) (v_Vuna_dCompiler_dIr_dCps_dflattenApp e))
  | _ -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, k, e))
))))

# 804 "Vuna/Compiler/Ir/Cps.vuna"
let v_Vuna_dCompiler_dIr_dCps_dmIsControl = (fun (mc0 : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIr) -> (match mc0 with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrNatCase (dtb__400, dtb__401, dtb__402, dtb__403, dtb__404) -> true
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrIf (dtb__405, dtb__406, dtb__407) -> true
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCase (dtb__408, dtb__409, dtb__410, dtb__411) -> true
  | _ -> false
))

# 957 "Vuna/Compiler/Ir/Cps.vuna"
let v_Vuna_dCompiler_dIr_dCps_dmSym = (fun x -> (if (x = v_Vuna_dCompiler_dIr_dCps_dirCpsPerformName) then v_Vuna_dCompiler_dIr_dCps_dirMPerformName else (if (x = v_Vuna_dCompiler_dIr_dCps_dirCpsHandleName) then v_Vuna_dCompiler_dIr_dCps_dirMHandleName else (if (x = v_Vuna_dCompiler_dIr_dCps_dirCpsSelfName) then v_Vuna_dCompiler_dIr_dCps_dirMSelfName else x))))

# 963 "Vuna/Compiler/Ir/Cps.vuna"
let rec v_Vuna_dCompiler_dIr_dCps_dmSyms = (fun fuel e -> (if (fuel <= 0) then e else (match e with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRt (dtb__412) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRt ((v_Vuna_dCompiler_dIr_dCps_dmSym dtb__412)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRtApp (dtb__413, dtb__414) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRtApp ((v_Vuna_dCompiler_dIr_dCps_dmSym dtb__413), ((v_Vuna_dCompiler_dIr_dCps_dmListS (fuel - 1)) dtb__414)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCtor (dtb__415, dtb__416, dtb__417, dtb__418) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCtor (dtb__415, dtb__416, Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, ((v_Vuna_dCompiler_dIr_dCps_dmListS (fuel - 1)) dtb__418)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRecord (dtb__419, dtb__420, dtb__421) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRecord (dtb__419, Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, ((v_Vuna_dCompiler_dIr_dCps_dmFieldsS (fuel - 1)) dtb__421)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrProj (dtb__422, dtb__423, dtb__424, dtb__425) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrProj (((v_Vuna_dCompiler_dIr_dCps_dmSyms (fuel - 1)) dtb__422), dtb__423, dtb__424, Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRecUpd (dtb__426, dtb__427, dtb__428, dtb__429) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRecUpd (((v_Vuna_dCompiler_dIr_dCps_dmSyms (fuel - 1)) dtb__426), dtb__427, ((v_Vuna_dCompiler_dIr_dCps_dmFieldsS (fuel - 1)) dtb__428), Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCast (dtb__430, dtb__431, dtb__432) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCast (dtb__430, dtb__431, ((v_Vuna_dCompiler_dIr_dCps_dmSyms (fuel - 1)) dtb__432)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLet (dtb__433, dtb__434, dtb__435) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLet (dtb__433, ((v_Vuna_dCompiler_dIr_dCps_dmSyms (fuel - 1)) dtb__434), ((v_Vuna_dCompiler_dIr_dCps_dmSyms (fuel - 1)) dtb__435)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLam (dtb__436, dtb__437, dtb__438) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLam (dtb__436, dtb__437, ((v_Vuna_dCompiler_dIr_dCps_dmSyms (fuel - 1)) dtb__438)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (dtb__439, dtb__440, dtb__441) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, ((v_Vuna_dCompiler_dIr_dCps_dmSyms (fuel - 1)) dtb__440), ((v_Vuna_dCompiler_dIr_dCps_dmSyms (fuel - 1)) dtb__441)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrIf (dtb__442, dtb__443, dtb__444) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrIf (((v_Vuna_dCompiler_dIr_dCps_dmSyms (fuel - 1)) dtb__442), ((v_Vuna_dCompiler_dIr_dCps_dmSyms (fuel - 1)) dtb__443), ((v_Vuna_dCompiler_dIr_dCps_dmSyms (fuel - 1)) dtb__444)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCase (dtb__445, dtb__446, dtb__447, dtb__448) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCase (dtb__445, Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, ((v_Vuna_dCompiler_dIr_dCps_dmSyms (fuel - 1)) dtb__447), ((v_Vuna_dCompiler_dIr_dCps_dmSymsAltsM (fuel - 1)) dtb__448)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrNatCase (dtb__449, dtb__450, dtb__451, dtb__452, dtb__453) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrNatCase (((v_Vuna_dCompiler_dIr_dCps_dmSyms (fuel - 1)) dtb__449), dtb__450, ((v_Vuna_dCompiler_dIr_dCps_dmSymsAltMM (fuel - 1)) dtb__451), ((v_Vuna_dCompiler_dIr_dCps_dmSymsAltMM (fuel - 1)) dtb__452), ((v_Vuna_dCompiler_dIr_dCps_dmSymsAltMM (fuel - 1)) dtb__453)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrConcatMany (dtb__454) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrConcatMany (((v_Vuna_dCompiler_dIr_dCps_dmListS (fuel - 1)) dtb__454)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrEffThunk (dtb__455, dtb__456, dtb__457, dtb__458, dtb__459) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrEffThunk (dtb__455, dtb__456, dtb__457, dtb__458, ((v_Vuna_dCompiler_dIr_dCps_dmSyms (fuel - 1)) dtb__459)))
  | _ -> e
)))
# 986 "Vuna/Compiler/Ir/Cps.vuna"
and v_Vuna_dCompiler_dIr_dCps_dmListS = (fun fuel xs -> (if (fuel <= 0) then xs else (match xs with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__460, dtb__461) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (((v_Vuna_dCompiler_dIr_dCps_dmSyms (fuel - 1)) dtb__460), ((v_Vuna_dCompiler_dIr_dCps_dmListS (fuel - 1)) dtb__461)))
  | _ -> failwith "DT: impossible branch"
)))
# 995 "Vuna/Compiler/Ir/Cps.vuna"
and v_Vuna_dCompiler_dIr_dCps_dmFieldsS = (fun fuel fs -> (if (fuel <= 0) then fs else (match fs with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__462, dtb__463) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Base_dData_dPair.v_Base_dData_dPair_dfirstOf dtb__462); Base_dData_dPair.f_Base_dData_dPair_dPair_second = ((v_Vuna_dCompiler_dIr_dCps_dmSyms (fuel - 1)) (Base_dData_dPair.v_Base_dData_dPair_dsecondOf dtb__462)) }, ((v_Vuna_dCompiler_dIr_dCps_dmFieldsS (fuel - 1)) dtb__463)))
  | _ -> failwith "DT: impossible branch"
)))
# 1004 "Vuna/Compiler/Ir/Cps.vuna"
and v_Vuna_dCompiler_dIr_dCps_dmSymsAltsM = (fun fuel alts -> (if (fuel <= 0) then alts else (match alts with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__464, dtb__465) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltCtor = (dtb__464).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltCtor; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBinders = (dtb__464).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBinders; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBody = ((v_Vuna_dCompiler_dIr_dCps_dmSyms (fuel - 1)) (dtb__464).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBody) }, ((v_Vuna_dCompiler_dIr_dCps_dmSymsAltsM (fuel - 1)) dtb__465)))
  | _ -> failwith "DT: impossible branch"
)))
# 1013 "Vuna/Compiler/Ir/Cps.vuna"
and v_Vuna_dCompiler_dIr_dCps_dmSymsAltMM = (fun fuel m -> (if (fuel <= 0) then m else (match m with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__466) -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ({ Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltCtor = (dtb__466).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltCtor; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBinders = (dtb__466).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBinders; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBody = ((v_Vuna_dCompiler_dIr_dCps_dmSyms (fuel - 1)) (dtb__466).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBody) }))
  | _ -> failwith "DT: impossible branch"
)))

# 1022 "Vuna/Compiler/Ir/Cps.vuna"
let v_Vuna_dCompiler_dIr_dCps_dmDoneCont = ((fun v -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLam ((Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (v, Base_dData_dList.C_Base_dData_dList_dList_Nil)), Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRt (v_Vuna_dCompiler_dIr_dCps_dirMDoneName)), (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrVar (v))))))) (v_Vuna_dCompiler_dIr_dCps_dmkBinder "__mDoneV"))

# 1028 "Vuna/Compiler/Ir/Cps.vuna"
let rec v_Vuna_dCompiler_dIr_dCps_dmTrampolineBody = (fun (mc0 : string) (mc1 : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIr) -> (match mc1 with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (dtb__467, dtb__468, dtb__469) -> (match dtb__468 with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (dtb__470, dtb__471, dtb__472) -> (match dtb__471 with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (dtb__473, dtb__474, dtb__475) -> (match dtb__474 with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrGlobal (dtb__476) -> (if (dtb__476 = v_Vuna_dCompiler_dIr_dCps_drunThunkName) then (Base_dData_dResult.C_Base_dData_dResult_dResult_Ok ((Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRt (v_Vuna_dCompiler_dIr_dCps_dirMRunName)), ((v_Vuna_dCompiler_dIr_dCps_dapplyAll (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrGlobal (dtb__476))) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__475, (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__472, (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (v_Vuna_dCompiler_dIr_dCps_dmDoneCont, Base_dData_dList.C_Base_dData_dList_dList_Nil))))))))))) else (Base_dData_dResult.C_Base_dData_dResult_dResult_Err (("machine CPS: unexpected trampoline shape: " ^ mc0))))
  | _ -> (Base_dData_dResult.C_Base_dData_dResult_dResult_Err (("machine CPS: unexpected trampoline shape: " ^ mc0)))
)
  | _ -> (Base_dData_dResult.C_Base_dData_dResult_dResult_Err (("machine CPS: unexpected trampoline shape: " ^ mc0)))
)
  | _ -> (Base_dData_dResult.C_Base_dData_dResult_dResult_Err (("machine CPS: unexpected trampoline shape: " ^ mc0)))
)
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCast (dtb__477, dtb__478, dtb__479) -> (match ((v_Vuna_dCompiler_dIr_dCps_dmTrampolineBody mc0) dtb__479) with
  | Base_dData_dResult.C_Base_dData_dResult_dResult_Err (dtb__480) -> (Base_dData_dResult.C_Base_dData_dResult_dResult_Err (dtb__480))
  | Base_dData_dResult.C_Base_dData_dResult_dResult_Ok (dtb__481) -> (Base_dData_dResult.C_Base_dData_dResult_dResult_Ok ((Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCast (dtb__477, dtb__478, dtb__481))))
  | _ -> failwith "DT: impossible branch"
)
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLam (dtb__482, dtb__483, dtb__484) -> (match ((v_Vuna_dCompiler_dIr_dCps_dmTrampolineBody mc0) dtb__484) with
  | Base_dData_dResult.C_Base_dData_dResult_dResult_Err (dtb__485) -> (Base_dData_dResult.C_Base_dData_dResult_dResult_Err (dtb__485))
  | Base_dData_dResult.C_Base_dData_dResult_dResult_Ok (dtb__486) -> (Base_dData_dResult.C_Base_dData_dResult_dResult_Ok ((Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLam (dtb__482, dtb__483, dtb__486))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> (Base_dData_dResult.C_Base_dData_dResult_dResult_Err (("machine CPS: unexpected trampoline shape: " ^ mc0)))
))

# 1050 "Vuna/Compiler/Ir/Cps.vuna"
let v_Vuna_dCompiler_dIr_dCps_dmBodyOf = (fun d -> (match (Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirDefBody d) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__487) -> dtb__487
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrInt (0))
  | _ -> failwith "DT: impossible branch"
))

# 1060 "Vuna/Compiler/Ir/Cps.vuna"
let rec v_Vuna_dCompiler_dIr_dCps_ddefArities = (fun fuel ds -> (if (fuel <= 0) then Base_dData_dList.C_Base_dData_dList_dList_Nil else (match ds with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__488, dtb__489) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirDefName dtb__488); Base_dData_dPair.f_Base_dData_dPair_dPair_second = (Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirDefArity dtb__488) }, ((v_Vuna_dCompiler_dIr_dCps_ddefArities (fuel - 1)) dtb__489)))
  | _ -> failwith "DT: impossible branch"
)))

# 1069 "Vuna/Compiler/Ir/Cps.vuna"
let rec v_Vuna_dCompiler_dIr_dCps_ddefSigs = (fun fuel ds -> (if (fuel <= 0) then Base_dData_dList.C_Base_dData_dList_dList_Nil else (match ds with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__490, dtb__491) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirDefName dtb__490); Base_dData_dPair.f_Base_dData_dPair_dPair_second = (Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirDefTy dtb__490) }, ((v_Vuna_dCompiler_dIr_dCps_ddefSigs (fuel - 1)) dtb__491)))
  | _ -> failwith "DT: impossible branch"
)))

# 1078 "Vuna/Compiler/Ir/Cps.vuna"
let v_Vuna_dCompiler_dIr_dCps_dhandlerTables = (fun fuel ds -> { f_Vuna_dCompiler_dIr_dCps_dHandlerTables_htArities = ((v_Vuna_dCompiler_dIr_dCps_ddefArities fuel) ds); f_Vuna_dCompiler_dIr_dCps_dHandlerTables_htSigs = ((v_Vuna_dCompiler_dIr_dCps_ddefSigs fuel) ds) })

# 1081 "Vuna/Compiler/Ir/Cps.vuna"
let rec v_Vuna_dCompiler_dIr_dCps_darityOf = (fun (mc0 : (string, int) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (mc1 : string) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__492, dtb__493) -> (if ((Base_dData_dPair.v_Base_dData_dPair_dfirstOf dtb__492) = mc1) then (Base_dData_dPair.v_Base_dData_dPair_dsecondOf dtb__492) else ((v_Vuna_dCompiler_dIr_dCps_darityOf dtb__493) mc1))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))

# 1085 "Vuna/Compiler/Ir/Cps.vuna"
let rec v_Vuna_dCompiler_dIr_dCps_dsigOf = (fun (mc0 : (string, Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrTy Base_dData_dMaybe.t_Base_dData_dMaybe_dMaybe) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (mc1 : string) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__494, dtb__495) -> (if ((Base_dData_dPair.v_Base_dData_dPair_dfirstOf dtb__494) = mc1) then (Base_dData_dPair.v_Base_dData_dPair_dsecondOf dtb__494) else ((v_Vuna_dCompiler_dIr_dCps_dsigOf dtb__495) mc1))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 1089 "Vuna/Compiler/Ir/Cps.vuna"
let rec v_Vuna_dCompiler_dIr_dCps_dfunArity = (fun (mc0 : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrTy) -> (match mc0 with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyFun (dtb__496, dtb__497) -> (1 + (v_Vuna_dCompiler_dIr_dCps_dfunArity dtb__497))
  | _ -> 0
))

# 1093 "Vuna/Compiler/Ir/Cps.vuna"
let rec v_Vuna_dCompiler_dIr_dCps_dfunResult = (fun (mc0 : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrTy) -> (match mc0 with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyFun (dtb__498, dtb__499) -> (v_Vuna_dCompiler_dIr_dCps_dfunResult dtb__499)
  | _ -> mc0
))

# 1097 "Vuna/Compiler/Ir/Cps.vuna"
let v_Vuna_dCompiler_dIr_dCps_disFunTy = (fun (mc0 : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrTy) -> (match mc0 with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyFun (dtb__500, dtb__501) -> true
  | _ -> false
))

# 1104 "Vuna/Compiler/Ir/Cps.vuna"
let v_Vuna_dCompiler_dIr_dCps_disClauseTy = (fun (mc0 : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrTy) -> (match mc0 with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyFun (dtb__502, dtb__503) -> (match dtb__503 with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyFun (dtb__504, dtb__505) -> (v_Vuna_dCompiler_dIr_dCps_disFunTy dtb__504)
  | _ -> false
)
  | _ -> false
))

# 1113 "Vuna/Compiler/Ir/Cps.vuna"
let rec v_Vuna_dCompiler_dIr_dCps_dhasClauseParam = (fun (mc0 : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrTy) -> (match mc0 with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyFun (dtb__506, dtb__507) -> (if (v_Vuna_dCompiler_dIr_dCps_disClauseTy dtb__506) then true else (v_Vuna_dCompiler_dIr_dCps_dhasClauseParam dtb__507))
  | _ -> false
))

# 1109 "Vuna/Compiler/Ir/Cps.vuna"
let v_Vuna_dCompiler_dIr_dCps_disHandlerCombinatorTy = (fun ty -> (if (if ((v_Vuna_dCompiler_dIr_dCps_dfunArity ty) >= 2) then (v_Vuna_dCompiler_dIr_dCps_disEffResultTy (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ((v_Vuna_dCompiler_dIr_dCps_dfunResult ty)))) else false) then (v_Vuna_dCompiler_dIr_dCps_dhasClauseParam ty) else false))

# 1117 "Vuna/Compiler/Ir/Cps.vuna"
let v_Vuna_dCompiler_dIr_dCps_disHandleCombinator = (fun t n -> (match ((v_Vuna_dCompiler_dIr_dCps_dsigOf (t).f_Vuna_dCompiler_dIr_dCps_dHandlerTables_htSigs) n) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__508) -> (if ((v_Vuna_dCompiler_dIr_dCps_dfunArity dtb__508) = 0) then (if ((Base_dData_dString.v_Base_dData_dString_dstartsWith "Base.Effect.") n) then ((Base_dData_dString.v_Base_dData_dString_dcontains "handle") n) else false) else (v_Vuna_dCompiler_dIr_dCps_disHandlerCombinatorTy dtb__508))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (if ((Base_dData_dString.v_Base_dData_dString_dstartsWith "Base.Effect.") n) then ((Base_dData_dString.v_Base_dData_dString_dcontains "handle") n) else false)
  | _ -> failwith "DT: impossible branch"
))

# 1127 "Vuna/Compiler/Ir/Cps.vuna"
let v_Vuna_dCompiler_dIr_dCps_dclauseArityOf = (fun t n -> (match ((v_Vuna_dCompiler_dIr_dCps_dsigOf (t).f_Vuna_dCompiler_dIr_dCps_dHandlerTables_htSigs) n) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__509) -> (if ((v_Vuna_dCompiler_dIr_dCps_dfunArity dtb__509) > 0) then (v_Vuna_dCompiler_dIr_dCps_dfunArity dtb__509) else ((v_Vuna_dCompiler_dIr_dCps_darityOf (t).f_Vuna_dCompiler_dIr_dCps_dHandlerTables_htArities) n))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> ((v_Vuna_dCompiler_dIr_dCps_darityOf (t).f_Vuna_dCompiler_dIr_dCps_dHandlerTables_htArities) n)
  | _ -> failwith "DT: impossible branch"
))

# 1133 "Vuna/Compiler/Ir/Cps.vuna"
let v_Vuna_dCompiler_dIr_dCps_disClauseGlobal = (fun t n -> (match ((v_Vuna_dCompiler_dIr_dCps_dsigOf (t).f_Vuna_dCompiler_dIr_dCps_dHandlerTables_htSigs) n) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__510) -> (if ((v_Vuna_dCompiler_dIr_dCps_dfunArity dtb__510) > 0) then (v_Vuna_dCompiler_dIr_dCps_disClauseTy dtb__510) else (((v_Vuna_dCompiler_dIr_dCps_darityOf (t).f_Vuna_dCompiler_dIr_dCps_dHandlerTables_htArities) n) >= 2))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (((v_Vuna_dCompiler_dIr_dCps_darityOf (t).f_Vuna_dCompiler_dIr_dCps_dHandlerTables_htArities) n) >= 2)
  | _ -> failwith "DT: impossible branch"
))

# 1156 "Vuna/Compiler/Ir/Cps.vuna"
let rec v_Vuna_dCompiler_dIr_dCps_dlenOf = (fun xs -> (match xs with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> 0
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__511, dtb__512) -> (1 + (v_Vuna_dCompiler_dIr_dCps_dlenOf dtb__512))
  | _ -> failwith "DT: impossible branch"
))

# 1162 "Vuna/Compiler/Ir/Cps.vuna"
let v_Vuna_dCompiler_dIr_dCps_dfuelOf = (fun _u -> 1)

# 1139 "Vuna/Compiler/Ir/Cps.vuna"
let rec v_Vuna_dCompiler_dIr_dCps_dclauseGlobals = (fun t args -> (if ((v_Vuna_dCompiler_dIr_dCps_dfuelOf args) <= 0) then Base_dData_dList.C_Base_dData_dList_dList_Nil else (match args with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__513, dtb__514) -> (match dtb__513 with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrGlobal (dtb__515) -> (if (if ((v_Vuna_dCompiler_dIr_dCps_disClauseGlobal t) dtb__515) then (((v_Vuna_dCompiler_dIr_dCps_dclauseArityOf t) dtb__515) >= 2) else false) then (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__515, ((v_Vuna_dCompiler_dIr_dCps_dclauseGlobals t) dtb__514))) else ((v_Vuna_dCompiler_dIr_dCps_dclauseGlobals t) dtb__514))
  | _ -> ((fun nd_uscrut5 -> (match nd_uscrut5 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__516; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__517 } -> (match dtb__516 with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrGlobal (dtb__518) -> (if (if ((v_Vuna_dCompiler_dIr_dCps_disClauseGlobal t) dtb__518) then ((((v_Vuna_dCompiler_dIr_dCps_dclauseArityOf t) dtb__518) - (v_Vuna_dCompiler_dIr_dCps_dlenOf dtb__517)) >= 2) else false) then (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__518, ((v_Vuna_dCompiler_dIr_dCps_dclauseGlobals t) dtb__514))) else ((v_Vuna_dCompiler_dIr_dCps_dclauseGlobals t) dtb__514))
  | _ -> ((v_Vuna_dCompiler_dIr_dCps_dclauseGlobals t) dtb__514)
)
  | _ -> failwith "DT: impossible branch"
)) (v_Vuna_dCompiler_dIr_dCps_dflattenApp dtb__513))
)
  | _ -> failwith "DT: impossible branch"
)))

# 1165 "Vuna/Compiler/Ir/Cps.vuna"
let rec v_Vuna_dCompiler_dIr_dCps_dcollectHandlerGlobals = (fun t fuel e -> (if (fuel <= 0) then Base_dData_dList.C_Base_dData_dList_dList_Nil else (match e with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (dtb__519, dtb__520, dtb__521) -> ((fun p -> ((fun head -> ((fun args -> ((fun here -> ((Base_dData_dList.v_Base_dData_dList_dappend here) ((Base_dData_dList.v_Base_dData_dList_dappend (((v_Vuna_dCompiler_dIr_dCps_dcollectHandlerGlobals t) (fuel - 1)) head)) (((v_Vuna_dCompiler_dIr_dCps_dcollectHandlerGlobalsList t) (fuel - 1)) args)))) (match head with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrGlobal (dtb__522) -> (if ((v_Vuna_dCompiler_dIr_dCps_disHandleCombinator t) dtb__522) then ((v_Vuna_dCompiler_dIr_dCps_dclauseGlobals t) args) else Base_dData_dList.C_Base_dData_dList_dList_Nil)
  | _ -> Base_dData_dList.C_Base_dData_dList_dList_Nil
))) (Base_dData_dPair.v_Base_dData_dPair_dsecondOf p))) (Base_dData_dPair.v_Base_dData_dPair_dfirstOf p))) (v_Vuna_dCompiler_dIr_dCps_dflattenApp e))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCtor (dtb__523, dtb__524, dtb__525, dtb__526) -> (((v_Vuna_dCompiler_dIr_dCps_dcollectHandlerGlobalsList t) (fuel - 1)) dtb__526)
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRecord (dtb__527, dtb__528, dtb__529) -> (((v_Vuna_dCompiler_dIr_dCps_dcollectHandlerGlobalsFields t) (fuel - 1)) dtb__529)
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrProj (dtb__530, dtb__531, dtb__532, dtb__533) -> (((v_Vuna_dCompiler_dIr_dCps_dcollectHandlerGlobals t) (fuel - 1)) dtb__530)
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRecUpd (dtb__534, dtb__535, dtb__536, dtb__537) -> ((Base_dData_dList.v_Base_dData_dList_dappend (((v_Vuna_dCompiler_dIr_dCps_dcollectHandlerGlobals t) (fuel - 1)) dtb__534)) (((v_Vuna_dCompiler_dIr_dCps_dcollectHandlerGlobalsFields t) (fuel - 1)) dtb__536))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRtApp (dtb__538, dtb__539) -> (((v_Vuna_dCompiler_dIr_dCps_dcollectHandlerGlobalsList t) (fuel - 1)) dtb__539)
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCast (dtb__540, dtb__541, dtb__542) -> (((v_Vuna_dCompiler_dIr_dCps_dcollectHandlerGlobals t) (fuel - 1)) dtb__542)
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLet (dtb__543, dtb__544, dtb__545) -> ((Base_dData_dList.v_Base_dData_dList_dappend (((v_Vuna_dCompiler_dIr_dCps_dcollectHandlerGlobals t) (fuel - 1)) dtb__544)) (((v_Vuna_dCompiler_dIr_dCps_dcollectHandlerGlobals t) (fuel - 1)) dtb__545))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLam (dtb__546, dtb__547, dtb__548) -> (((v_Vuna_dCompiler_dIr_dCps_dcollectHandlerGlobals t) (fuel - 1)) dtb__548)
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrIf (dtb__549, dtb__550, dtb__551) -> ((Base_dData_dList.v_Base_dData_dList_dappend (((v_Vuna_dCompiler_dIr_dCps_dcollectHandlerGlobals t) (fuel - 1)) dtb__549)) ((Base_dData_dList.v_Base_dData_dList_dappend (((v_Vuna_dCompiler_dIr_dCps_dcollectHandlerGlobals t) (fuel - 1)) dtb__550)) (((v_Vuna_dCompiler_dIr_dCps_dcollectHandlerGlobals t) (fuel - 1)) dtb__551)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCase (dtb__552, dtb__553, dtb__554, dtb__555) -> ((Base_dData_dList.v_Base_dData_dList_dappend (((v_Vuna_dCompiler_dIr_dCps_dcollectHandlerGlobals t) (fuel - 1)) dtb__554)) (((v_Vuna_dCompiler_dIr_dCps_dcollectHandlerGlobalsAlts t) (fuel - 1)) dtb__555))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrNatCase (dtb__556, dtb__557, dtb__558, dtb__559, dtb__560) -> ((Base_dData_dList.v_Base_dData_dList_dappend (((v_Vuna_dCompiler_dIr_dCps_dcollectHandlerGlobals t) (fuel - 1)) dtb__556)) ((Base_dData_dList.v_Base_dData_dList_dappend (((v_Vuna_dCompiler_dIr_dCps_dcollectHandlerGlobalsAltM t) (fuel - 1)) dtb__558)) ((Base_dData_dList.v_Base_dData_dList_dappend (((v_Vuna_dCompiler_dIr_dCps_dcollectHandlerGlobalsAltM t) (fuel - 1)) dtb__559)) (((v_Vuna_dCompiler_dIr_dCps_dcollectHandlerGlobalsAltM t) (fuel - 1)) dtb__560))))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrConcatMany (dtb__561) -> (((v_Vuna_dCompiler_dIr_dCps_dcollectHandlerGlobalsList t) (fuel - 1)) dtb__561)
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrEffThunk (dtb__562, dtb__563, dtb__564, dtb__565, dtb__566) -> (((v_Vuna_dCompiler_dIr_dCps_dcollectHandlerGlobals t) (fuel - 1)) dtb__566)
  | _ -> Base_dData_dList.C_Base_dData_dList_dList_Nil
)))
# 1196 "Vuna/Compiler/Ir/Cps.vuna"
and v_Vuna_dCompiler_dIr_dCps_dcollectHandlerGlobalsList = (fun t fuel xs -> (if (fuel <= 0) then Base_dData_dList.C_Base_dData_dList_dList_Nil else (match xs with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__567, dtb__568) -> ((Base_dData_dList.v_Base_dData_dList_dappend (((v_Vuna_dCompiler_dIr_dCps_dcollectHandlerGlobals t) (fuel - 1)) dtb__567)) (((v_Vuna_dCompiler_dIr_dCps_dcollectHandlerGlobalsList t) (fuel - 1)) dtb__568))
  | _ -> failwith "DT: impossible branch"
)))
# 1205 "Vuna/Compiler/Ir/Cps.vuna"
and v_Vuna_dCompiler_dIr_dCps_dcollectHandlerGlobalsFields = (fun t fuel fs -> (if (fuel <= 0) then Base_dData_dList.C_Base_dData_dList_dList_Nil else (match fs with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__569, dtb__570) -> ((Base_dData_dList.v_Base_dData_dList_dappend (((v_Vuna_dCompiler_dIr_dCps_dcollectHandlerGlobals t) (fuel - 1)) (Base_dData_dPair.v_Base_dData_dPair_dsecondOf dtb__569))) (((v_Vuna_dCompiler_dIr_dCps_dcollectHandlerGlobalsFields t) (fuel - 1)) dtb__570))
  | _ -> failwith "DT: impossible branch"
)))
# 1214 "Vuna/Compiler/Ir/Cps.vuna"
and v_Vuna_dCompiler_dIr_dCps_dcollectHandlerGlobalsAlts = (fun t fuel alts -> (if (fuel <= 0) then Base_dData_dList.C_Base_dData_dList_dList_Nil else (match alts with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__571, dtb__572) -> ((Base_dData_dList.v_Base_dData_dList_dappend (((v_Vuna_dCompiler_dIr_dCps_dcollectHandlerGlobals t) (fuel - 1)) (dtb__571).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBody)) (((v_Vuna_dCompiler_dIr_dCps_dcollectHandlerGlobalsAlts t) (fuel - 1)) dtb__572))
  | _ -> failwith "DT: impossible branch"
)))
# 1223 "Vuna/Compiler/Ir/Cps.vuna"
and v_Vuna_dCompiler_dIr_dCps_dcollectHandlerGlobalsAltM = (fun t fuel m -> (if (fuel <= 0) then Base_dData_dList.C_Base_dData_dList_dList_Nil else (match m with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__573) -> (((v_Vuna_dCompiler_dIr_dCps_dcollectHandlerGlobals t) (fuel - 1)) (dtb__573).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBody)
  | _ -> failwith "DT: impossible branch"
)))

# 1238 "Vuna/Compiler/Ir/Cps.vuna"
let rec v_Vuna_dCompiler_dIr_dCps_dcollectHandleOpsDefsGo = (fun fuel t ds -> (if (fuel <= 0) then Base_dData_dList.C_Base_dData_dList_dList_Nil else (match ds with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__574, dtb__575) -> ((Base_dData_dList.v_Base_dData_dList_dappend (((v_Vuna_dCompiler_dIr_dCps_dcollectHandlerGlobals t) (fuel - 1)) (v_Vuna_dCompiler_dIr_dCps_dmBodyOf dtb__574))) (((v_Vuna_dCompiler_dIr_dCps_dcollectHandleOpsDefsGo (fuel - 1)) t) dtb__575))
  | _ -> failwith "DT: impossible branch"
)))

# 1232 "Vuna/Compiler/Ir/Cps.vuna"
let v_Vuna_dCompiler_dIr_dCps_dcollectHandleOpsDefs = (fun fuel ds -> ((fun tables -> (((v_Vuna_dCompiler_dIr_dCps_dcollectHandleOpsDefsGo fuel) tables) ds)) ((v_Vuna_dCompiler_dIr_dCps_dhandlerTables 100000) ds)))

# 1247 "Vuna/Compiler/Ir/Cps.vuna"
let rec v_Vuna_dCompiler_dIr_dCps_dmemName = (fun (mc0 : string) (mc1 : string Base_dData_dList.t_Base_dData_dList_dList) -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__576, dtb__577) -> (if (mc0 = dtb__576) then true else ((v_Vuna_dCompiler_dIr_dCps_dmemName mc0) dtb__577))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 1253 "Vuna/Compiler/Ir/Cps.vuna"
let v_Vuna_dCompiler_dIr_dCps_dscopedName = "Base.Effect.Core.handleScoped"

# 1256 "Vuna/Compiler/Ir/Cps.vuna"
let v_Vuna_dCompiler_dIr_dCps_dselfName = "Base.Effect.Core.handleSelf"

# 1259 "Vuna/Compiler/Ir/Cps.vuna"
let v_Vuna_dCompiler_dIr_dCps_dscopeName = "Base.Effect.Core.scope"

# 1262 "Vuna/Compiler/Ir/Cps.vuna"
let v_Vuna_dCompiler_dIr_dCps_dcleanupPushName = "Base.Effect.Core.pushCleanup"

# 1265 "Vuna/Compiler/Ir/Cps.vuna"
let v_Vuna_dCompiler_dIr_dCps_dcleanupPopName = "Base.Effect.Core.popCleanup"

# 1268 "Vuna/Compiler/Ir/Cps.vuna"
let rec v_Vuna_dCompiler_dIr_dCps_dmScopedCalls = (fun fuel rs e -> (if (fuel <= 0) then e else (match e with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (dtb__578, dtb__579, dtb__580) -> ((fun f1 -> ((fun a1 -> (match f1 with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrGlobal (dtb__581) -> (if (dtb__581 = v_Vuna_dCompiler_dIr_dCps_dscopedName) then (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrVar (rs)), a1)) else (if (dtb__581 = v_Vuna_dCompiler_dIr_dCps_dselfName) then (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrVar (rs)), (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrGlobal (v_Vuna_dCompiler_dIr_dCps_dscopeName)), a1)))) else (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, f1, a1))))
  | _ -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, f1, a1))
)) (((v_Vuna_dCompiler_dIr_dCps_dmScopedCalls (fuel - 1)) rs) dtb__580))) (((v_Vuna_dCompiler_dIr_dCps_dmScopedCalls (fuel - 1)) rs) dtb__579))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRtApp (dtb__582, dtb__583) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRtApp (dtb__582, (((v_Vuna_dCompiler_dIr_dCps_dmScopedList (fuel - 1)) rs) dtb__583)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCtor (dtb__584, dtb__585, dtb__586, dtb__587) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCtor (dtb__584, dtb__585, Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, (((v_Vuna_dCompiler_dIr_dCps_dmScopedList (fuel - 1)) rs) dtb__587)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRecord (dtb__588, dtb__589, dtb__590) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRecord (dtb__588, Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, (((v_Vuna_dCompiler_dIr_dCps_dmScopedFields (fuel - 1)) rs) dtb__590)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrProj (dtb__591, dtb__592, dtb__593, dtb__594) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrProj ((((v_Vuna_dCompiler_dIr_dCps_dmScopedCalls (fuel - 1)) rs) dtb__591), dtb__592, dtb__593, Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRecUpd (dtb__595, dtb__596, dtb__597, dtb__598) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRecUpd ((((v_Vuna_dCompiler_dIr_dCps_dmScopedCalls (fuel - 1)) rs) dtb__595), dtb__596, (((v_Vuna_dCompiler_dIr_dCps_dmScopedFields (fuel - 1)) rs) dtb__597), Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCast (dtb__599, dtb__600, dtb__601) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCast (dtb__599, dtb__600, (((v_Vuna_dCompiler_dIr_dCps_dmScopedCalls (fuel - 1)) rs) dtb__601)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLet (dtb__602, dtb__603, dtb__604) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLet (dtb__602, (((v_Vuna_dCompiler_dIr_dCps_dmScopedCalls (fuel - 1)) rs) dtb__603), (((v_Vuna_dCompiler_dIr_dCps_dmScopedCalls (fuel - 1)) rs) dtb__604)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLam (dtb__605, dtb__606, dtb__607) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLam (dtb__605, dtb__606, (((v_Vuna_dCompiler_dIr_dCps_dmScopedCalls (fuel - 1)) rs) dtb__607)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrIf (dtb__608, dtb__609, dtb__610) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrIf ((((v_Vuna_dCompiler_dIr_dCps_dmScopedCalls (fuel - 1)) rs) dtb__608), (((v_Vuna_dCompiler_dIr_dCps_dmScopedCalls (fuel - 1)) rs) dtb__609), (((v_Vuna_dCompiler_dIr_dCps_dmScopedCalls (fuel - 1)) rs) dtb__610)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCase (dtb__611, dtb__612, dtb__613, dtb__614) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCase (dtb__611, Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, (((v_Vuna_dCompiler_dIr_dCps_dmScopedCalls (fuel - 1)) rs) dtb__613), (((v_Vuna_dCompiler_dIr_dCps_dmScopedAlts (fuel - 1)) rs) dtb__614)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrNatCase (dtb__615, dtb__616, dtb__617, dtb__618, dtb__619) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrNatCase ((((v_Vuna_dCompiler_dIr_dCps_dmScopedCalls (fuel - 1)) rs) dtb__615), dtb__616, (((v_Vuna_dCompiler_dIr_dCps_dmScopedAltM (fuel - 1)) rs) dtb__617), (((v_Vuna_dCompiler_dIr_dCps_dmScopedAltM (fuel - 1)) rs) dtb__618), (((v_Vuna_dCompiler_dIr_dCps_dmScopedAltM (fuel - 1)) rs) dtb__619)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrConcatMany (dtb__620) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrConcatMany ((((v_Vuna_dCompiler_dIr_dCps_dmScopedList (fuel - 1)) rs) dtb__620)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrEffThunk (dtb__621, dtb__622, dtb__623, dtb__624, dtb__625) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrEffThunk (dtb__621, dtb__622, dtb__623, dtb__624, (((v_Vuna_dCompiler_dIr_dCps_dmScopedCalls (fuel - 1)) rs) dtb__625)))
  | _ -> e
)))
# 1296 "Vuna/Compiler/Ir/Cps.vuna"
and v_Vuna_dCompiler_dIr_dCps_dmScopedList = (fun fuel rs xs -> (if (fuel <= 0) then xs else (match xs with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__626, dtb__627) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ((((v_Vuna_dCompiler_dIr_dCps_dmScopedCalls (fuel - 1)) rs) dtb__626), (((v_Vuna_dCompiler_dIr_dCps_dmScopedList (fuel - 1)) rs) dtb__627)))
  | _ -> failwith "DT: impossible branch"
)))
# 1305 "Vuna/Compiler/Ir/Cps.vuna"
and v_Vuna_dCompiler_dIr_dCps_dmScopedFields = (fun fuel rs fs -> (if (fuel <= 0) then fs else (match fs with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__628, dtb__629) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Base_dData_dPair.v_Base_dData_dPair_dfirstOf dtb__628); Base_dData_dPair.f_Base_dData_dPair_dPair_second = (((v_Vuna_dCompiler_dIr_dCps_dmScopedCalls (fuel - 1)) rs) (Base_dData_dPair.v_Base_dData_dPair_dsecondOf dtb__628)) }, (((v_Vuna_dCompiler_dIr_dCps_dmScopedFields (fuel - 1)) rs) dtb__629)))
  | _ -> failwith "DT: impossible branch"
)))
# 1314 "Vuna/Compiler/Ir/Cps.vuna"
and v_Vuna_dCompiler_dIr_dCps_dmScopedAlts = (fun fuel rs alts -> (if (fuel <= 0) then alts else (match alts with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__630, dtb__631) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltCtor = (dtb__630).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltCtor; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBinders = (dtb__630).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBinders; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBody = (((v_Vuna_dCompiler_dIr_dCps_dmScopedCalls (fuel - 1)) rs) (dtb__630).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBody) }, (((v_Vuna_dCompiler_dIr_dCps_dmScopedAlts (fuel - 1)) rs) dtb__631)))
  | _ -> failwith "DT: impossible branch"
)))
# 1323 "Vuna/Compiler/Ir/Cps.vuna"
and v_Vuna_dCompiler_dIr_dCps_dmScopedAltM = (fun fuel rs m -> (if (fuel <= 0) then m else (match m with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__632) -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ({ Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltCtor = (dtb__632).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltCtor; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBinders = (dtb__632).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBinders; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBody = (((v_Vuna_dCompiler_dIr_dCps_dmScopedCalls (fuel - 1)) rs) (dtb__632).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBody) }))
  | _ -> failwith "DT: impossible branch"
)))

# 886 "Vuna/Compiler/Ir/Cps.vuna"
let rec v_Vuna_dCompiler_dIr_dCps_dmHandlerLam = (fun fuel bs body -> (match (v_Vuna_dCompiler_dIr_dCps_dmResumption bs) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLam (bs, Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, ((v_Vuna_dCompiler_dIr_dCps_dmHandlers (fuel - 1)) body)))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__633) -> ((fun kd -> ((fun rs -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLam (((Base_dData_dList.v_Base_dData_dList_dappend bs) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (kd, (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (rs, Base_dData_dList.C_Base_dData_dList_dList_Nil))))), Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, (((v_Vuna_dCompiler_dIr_dCps_dmScopedCalls (fuel - 1)) rs) ((((v_Vuna_dCompiler_dIr_dCps_dmCps (fuel - 1)) dtb__633) (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrVar (kd))) body))))) (v_Vuna_dCompiler_dIr_dCps_dmFreshR fuel))) (v_Vuna_dCompiler_dIr_dCps_dmFreshK fuel))
  | _ -> failwith "DT: impossible branch"
))
# 899 "Vuna/Compiler/Ir/Cps.vuna"
and v_Vuna_dCompiler_dIr_dCps_dmListH = (fun fuel xs -> (if (fuel <= 0) then xs else (match xs with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__634, dtb__635) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (((v_Vuna_dCompiler_dIr_dCps_dmHandlers (fuel - 1)) dtb__634), ((v_Vuna_dCompiler_dIr_dCps_dmListH (fuel - 1)) dtb__635)))
  | _ -> failwith "DT: impossible branch"
)))
# 908 "Vuna/Compiler/Ir/Cps.vuna"
and v_Vuna_dCompiler_dIr_dCps_dmFieldsH = (fun fuel fs -> (if (fuel <= 0) then fs else (match fs with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__636, dtb__637) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Base_dData_dPair.v_Base_dData_dPair_dfirstOf dtb__636); Base_dData_dPair.f_Base_dData_dPair_dPair_second = ((v_Vuna_dCompiler_dIr_dCps_dmHandlers (fuel - 1)) (Base_dData_dPair.v_Base_dData_dPair_dsecondOf dtb__636)) }, ((v_Vuna_dCompiler_dIr_dCps_dmFieldsH (fuel - 1)) dtb__637)))
  | _ -> failwith "DT: impossible branch"
)))
# 917 "Vuna/Compiler/Ir/Cps.vuna"
and v_Vuna_dCompiler_dIr_dCps_dmHandlers = (fun fuel e -> (if (fuel <= 0) then e else (match e with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLam (dtb__638, dtb__639, dtb__640) -> (((v_Vuna_dCompiler_dIr_dCps_dmHandlerLam (fuel - 1)) dtb__638) dtb__640)
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCtor (dtb__641, dtb__642, dtb__643, dtb__644) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCtor (dtb__641, dtb__642, Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, ((v_Vuna_dCompiler_dIr_dCps_dmListH (fuel - 1)) dtb__644)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRecord (dtb__645, dtb__646, dtb__647) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRecord (dtb__645, Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, ((v_Vuna_dCompiler_dIr_dCps_dmFieldsH (fuel - 1)) dtb__647)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrProj (dtb__648, dtb__649, dtb__650, dtb__651) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrProj (((v_Vuna_dCompiler_dIr_dCps_dmHandlers (fuel - 1)) dtb__648), dtb__649, dtb__650, Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRecUpd (dtb__652, dtb__653, dtb__654, dtb__655) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRecUpd (((v_Vuna_dCompiler_dIr_dCps_dmHandlers (fuel - 1)) dtb__652), dtb__653, ((v_Vuna_dCompiler_dIr_dCps_dmFieldsH (fuel - 1)) dtb__654), Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRtApp (dtb__656, dtb__657) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRtApp (dtb__656, ((v_Vuna_dCompiler_dIr_dCps_dmListH (fuel - 1)) dtb__657)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCast (dtb__658, dtb__659, dtb__660) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCast (dtb__658, dtb__659, ((v_Vuna_dCompiler_dIr_dCps_dmHandlers (fuel - 1)) dtb__660)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLet (dtb__661, dtb__662, dtb__663) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLet (dtb__661, ((v_Vuna_dCompiler_dIr_dCps_dmHandlers (fuel - 1)) dtb__662), ((v_Vuna_dCompiler_dIr_dCps_dmHandlers (fuel - 1)) dtb__663)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (dtb__664, dtb__665, dtb__666) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, ((v_Vuna_dCompiler_dIr_dCps_dmHandlers (fuel - 1)) dtb__665), ((v_Vuna_dCompiler_dIr_dCps_dmHandlers (fuel - 1)) dtb__666)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrIf (dtb__667, dtb__668, dtb__669) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrIf (((v_Vuna_dCompiler_dIr_dCps_dmHandlers (fuel - 1)) dtb__667), ((v_Vuna_dCompiler_dIr_dCps_dmHandlers (fuel - 1)) dtb__668), ((v_Vuna_dCompiler_dIr_dCps_dmHandlers (fuel - 1)) dtb__669)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCase (dtb__670, dtb__671, dtb__672, dtb__673) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCase (dtb__670, Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, ((v_Vuna_dCompiler_dIr_dCps_dmHandlers (fuel - 1)) dtb__672), ((v_Vuna_dCompiler_dIr_dCps_dmHandlersAlts (fuel - 1)) dtb__673)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrNatCase (dtb__674, dtb__675, dtb__676, dtb__677, dtb__678) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrNatCase (((v_Vuna_dCompiler_dIr_dCps_dmHandlers (fuel - 1)) dtb__674), dtb__675, ((v_Vuna_dCompiler_dIr_dCps_dmHandlersAltM (fuel - 1)) dtb__676), ((v_Vuna_dCompiler_dIr_dCps_dmHandlersAltM (fuel - 1)) dtb__677), ((v_Vuna_dCompiler_dIr_dCps_dmHandlersAltM (fuel - 1)) dtb__678)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrConcatMany (dtb__679) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrConcatMany (((v_Vuna_dCompiler_dIr_dCps_dmListH (fuel - 1)) dtb__679)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrEffThunk (dtb__680, dtb__681, dtb__682, dtb__683, dtb__684) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrEffThunk (dtb__680, dtb__681, dtb__682, dtb__683, ((v_Vuna_dCompiler_dIr_dCps_dmHandlers (fuel - 1)) dtb__684)))
  | _ -> e
)))
# 939 "Vuna/Compiler/Ir/Cps.vuna"
and v_Vuna_dCompiler_dIr_dCps_dmHandlersAlts = (fun fuel alts -> (if (fuel <= 0) then alts else (match alts with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__685, dtb__686) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltCtor = (dtb__685).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltCtor; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBinders = (dtb__685).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBinders; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBody = ((v_Vuna_dCompiler_dIr_dCps_dmHandlers (fuel - 1)) (dtb__685).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBody) }, ((v_Vuna_dCompiler_dIr_dCps_dmHandlersAlts (fuel - 1)) dtb__686)))
  | _ -> failwith "DT: impossible branch"
)))
# 948 "Vuna/Compiler/Ir/Cps.vuna"
and v_Vuna_dCompiler_dIr_dCps_dmHandlersAltM = (fun fuel m -> (if (fuel <= 0) then m else (match m with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__687) -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ({ Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltCtor = (dtb__687).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltCtor; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBinders = (dtb__687).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBinders; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBody = ((v_Vuna_dCompiler_dIr_dCps_dmHandlers (fuel - 1)) (dtb__687).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBody) }))
  | _ -> failwith "DT: impossible branch"
)))

# 1332 "Vuna/Compiler/Ir/Cps.vuna"
let rec v_Vuna_dCompiler_dIr_dCps_dlastBinderOf = (fun bs -> (match bs with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__688, dtb__689) -> (match dtb__689 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__688))
  | _ -> (v_Vuna_dCompiler_dIr_dCps_dlastBinderOf dtb__689)
)
  | _ -> failwith "DT: impossible branch"
))

# 1359 "Vuna/Compiler/Ir/Cps.vuna"
let v_Vuna_dCompiler_dIr_dCps_dmHandlerFun = (fun fuel body -> (if (fuel <= 0) then body else (match body with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLam (dtb__690, dtb__691, dtb__692) -> ((fun nd_uscrut5 -> (match nd_uscrut5 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__693, dtb__694) -> (match dtb__694 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__695, dtb__696) -> ((fun kd -> ((fun rs -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLam (((Base_dData_dList.v_Base_dData_dList_dappend dtb__690) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (kd, (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (rs, Base_dData_dList.C_Base_dData_dList_dList_Nil))))), Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, (((v_Vuna_dCompiler_dIr_dCps_dmScopedCalls (fuel - 1)) rs) ((((v_Vuna_dCompiler_dIr_dCps_dmCps (fuel - 1)) dtb__695) (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrVar (kd))) dtb__692))))) (v_Vuna_dCompiler_dIr_dCps_dmFreshR fuel))) (v_Vuna_dCompiler_dIr_dCps_dmFreshK fuel))
  | _ -> body
)
  | _ -> body
)) (v_Vuna_dCompiler_dIr_dCps_druntimeBinders dtb__690))
  | _ -> body
)))

# 1411 "Vuna/Compiler/Ir/Cps.vuna"
let v_Vuna_dCompiler_dIr_dCps_disContBinder = (fun b -> ((fun n -> (if ((Base_dData_dString.v_Base_dData_dString_dstartsWith "__cpsK") n) then true else ((Base_dData_dString.v_Base_dData_dString_dstartsWith "__mchK") n))) (v_Vuna_dCompiler_dIr_dCps_dmBNameText (b).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrBinder_irBinderName)))

# 1417 "Vuna/Compiler/Ir/Cps.vuna"
let rec v_Vuna_dCompiler_dIr_dCps_dmApplys = (fun fuel e -> (if (fuel <= 0) then e else (match e with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (dtb__697, dtb__698, dtb__699) -> (match dtb__698 with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrVar (dtb__700) -> (if (v_Vuna_dCompiler_dIr_dCps_disContBinder dtb__700) then (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRtApp (v_Vuna_dCompiler_dIr_dCps_dirMApplyName, (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ((Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrVar (dtb__700)), (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (((v_Vuna_dCompiler_dIr_dCps_dmApplys (fuel - 1)) dtb__699), Base_dData_dList.C_Base_dData_dList_dList_Nil)))))) else (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, ((v_Vuna_dCompiler_dIr_dCps_dmApplys (fuel - 1)) dtb__698), ((v_Vuna_dCompiler_dIr_dCps_dmApplys (fuel - 1)) dtb__699))))
  | _ -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, ((v_Vuna_dCompiler_dIr_dCps_dmApplys (fuel - 1)) dtb__698), ((v_Vuna_dCompiler_dIr_dCps_dmApplys (fuel - 1)) dtb__699)))
)
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRtApp (dtb__701, dtb__702) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRtApp (dtb__701, ((v_Vuna_dCompiler_dIr_dCps_dmApplysList (fuel - 1)) dtb__702)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCtor (dtb__703, dtb__704, dtb__705, dtb__706) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCtor (dtb__703, dtb__704, Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, ((v_Vuna_dCompiler_dIr_dCps_dmApplysList (fuel - 1)) dtb__706)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRecord (dtb__707, dtb__708, dtb__709) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRecord (dtb__707, Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, ((v_Vuna_dCompiler_dIr_dCps_dmApplysFields (fuel - 1)) dtb__709)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrProj (dtb__710, dtb__711, dtb__712, dtb__713) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrProj (((v_Vuna_dCompiler_dIr_dCps_dmApplys (fuel - 1)) dtb__710), dtb__711, dtb__712, Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRecUpd (dtb__714, dtb__715, dtb__716, dtb__717) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRecUpd (((v_Vuna_dCompiler_dIr_dCps_dmApplys (fuel - 1)) dtb__714), dtb__715, ((v_Vuna_dCompiler_dIr_dCps_dmApplysFields (fuel - 1)) dtb__716), Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCast (dtb__718, dtb__719, dtb__720) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCast (dtb__718, dtb__719, ((v_Vuna_dCompiler_dIr_dCps_dmApplys (fuel - 1)) dtb__720)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLet (dtb__721, dtb__722, dtb__723) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLet (dtb__721, ((v_Vuna_dCompiler_dIr_dCps_dmApplys (fuel - 1)) dtb__722), ((v_Vuna_dCompiler_dIr_dCps_dmApplys (fuel - 1)) dtb__723)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLam (dtb__724, dtb__725, dtb__726) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLam (dtb__724, dtb__725, ((v_Vuna_dCompiler_dIr_dCps_dmApplys (fuel - 1)) dtb__726)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrIf (dtb__727, dtb__728, dtb__729) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrIf (((v_Vuna_dCompiler_dIr_dCps_dmApplys (fuel - 1)) dtb__727), ((v_Vuna_dCompiler_dIr_dCps_dmApplys (fuel - 1)) dtb__728), ((v_Vuna_dCompiler_dIr_dCps_dmApplys (fuel - 1)) dtb__729)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCase (dtb__730, dtb__731, dtb__732, dtb__733) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCase (dtb__730, Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, ((v_Vuna_dCompiler_dIr_dCps_dmApplys (fuel - 1)) dtb__732), ((v_Vuna_dCompiler_dIr_dCps_dmApplysAlts (fuel - 1)) dtb__733)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrNatCase (dtb__734, dtb__735, dtb__736, dtb__737, dtb__738) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrNatCase (((v_Vuna_dCompiler_dIr_dCps_dmApplys (fuel - 1)) dtb__734), dtb__735, ((v_Vuna_dCompiler_dIr_dCps_dmApplysAltM (fuel - 1)) dtb__736), ((v_Vuna_dCompiler_dIr_dCps_dmApplysAltM (fuel - 1)) dtb__737), ((v_Vuna_dCompiler_dIr_dCps_dmApplysAltM (fuel - 1)) dtb__738)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrConcatMany (dtb__739) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrConcatMany (((v_Vuna_dCompiler_dIr_dCps_dmApplysList (fuel - 1)) dtb__739)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrEffThunk (dtb__740, dtb__741, dtb__742, dtb__743, dtb__744) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrEffThunk (dtb__740, dtb__741, dtb__742, dtb__743, ((v_Vuna_dCompiler_dIr_dCps_dmApplys (fuel - 1)) dtb__744)))
  | _ -> e
)))
# 1442 "Vuna/Compiler/Ir/Cps.vuna"
and v_Vuna_dCompiler_dIr_dCps_dmApplysList = (fun fuel xs -> (if (fuel <= 0) then xs else (match xs with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__745, dtb__746) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (((v_Vuna_dCompiler_dIr_dCps_dmApplys (fuel - 1)) dtb__745), ((v_Vuna_dCompiler_dIr_dCps_dmApplysList (fuel - 1)) dtb__746)))
  | _ -> failwith "DT: impossible branch"
)))
# 1451 "Vuna/Compiler/Ir/Cps.vuna"
and v_Vuna_dCompiler_dIr_dCps_dmApplysFields = (fun fuel fs -> (if (fuel <= 0) then fs else (match fs with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__747, dtb__748) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Base_dData_dPair.v_Base_dData_dPair_dfirstOf dtb__747); Base_dData_dPair.f_Base_dData_dPair_dPair_second = ((v_Vuna_dCompiler_dIr_dCps_dmApplys (fuel - 1)) (Base_dData_dPair.v_Base_dData_dPair_dsecondOf dtb__747)) }, ((v_Vuna_dCompiler_dIr_dCps_dmApplysFields (fuel - 1)) dtb__748)))
  | _ -> failwith "DT: impossible branch"
)))
# 1460 "Vuna/Compiler/Ir/Cps.vuna"
and v_Vuna_dCompiler_dIr_dCps_dmApplysAlts = (fun fuel alts -> (if (fuel <= 0) then alts else (match alts with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__749, dtb__750) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltCtor = (dtb__749).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltCtor; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBinders = (dtb__749).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBinders; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBody = ((v_Vuna_dCompiler_dIr_dCps_dmApplys (fuel - 1)) (dtb__749).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBody) }, ((v_Vuna_dCompiler_dIr_dCps_dmApplysAlts (fuel - 1)) dtb__750)))
  | _ -> failwith "DT: impossible branch"
)))
# 1469 "Vuna/Compiler/Ir/Cps.vuna"
and v_Vuna_dCompiler_dIr_dCps_dmApplysAltM = (fun fuel m -> (if (fuel <= 0) then m else (match m with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__751) -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ({ Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltCtor = (dtb__751).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltCtor; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBinders = (dtb__751).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBinders; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBody = ((v_Vuna_dCompiler_dIr_dCps_dmApplys (fuel - 1)) (dtb__751).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBody) }))
  | _ -> failwith "DT: impossible branch"
)))

# 1484 "Vuna/Compiler/Ir/Cps.vuna"
let rec v_Vuna_dCompiler_dIr_dCps_dmMarked = (fun fuel e -> (if (fuel <= 0) then e else ((fun nd_uscrut2 -> (match nd_uscrut2 with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrEffThunk (dtb__752, dtb__753, dtb__754, dtb__755, dtb__756) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrEffThunk (dtb__752, dtb__753, dtb__754, dtb__755, ((v_Vuna_dCompiler_dIr_dCps_dmMarked (fuel - 1)) dtb__756)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrConcatMany (dtb__757) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrConcatMany (((v_Vuna_dCompiler_dIr_dCps_dmMarkedList (fuel - 1)) dtb__757)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrNatCase (dtb__758, dtb__759, dtb__760, dtb__761, dtb__762) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrNatCase (((v_Vuna_dCompiler_dIr_dCps_dmMarked (fuel - 1)) dtb__758), dtb__759, ((v_Vuna_dCompiler_dIr_dCps_dmMarkedAltM (fuel - 1)) dtb__760), ((v_Vuna_dCompiler_dIr_dCps_dmMarkedAltM (fuel - 1)) dtb__761), ((v_Vuna_dCompiler_dIr_dCps_dmMarkedAltM (fuel - 1)) dtb__762)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCase (dtb__763, dtb__764, dtb__765, dtb__766) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCase (dtb__763, Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, ((v_Vuna_dCompiler_dIr_dCps_dmMarked (fuel - 1)) dtb__765), ((v_Vuna_dCompiler_dIr_dCps_dmMarkedAlts (fuel - 1)) dtb__766)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrIf (dtb__767, dtb__768, dtb__769) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrIf (((v_Vuna_dCompiler_dIr_dCps_dmMarked (fuel - 1)) dtb__767), ((v_Vuna_dCompiler_dIr_dCps_dmMarked (fuel - 1)) dtb__768), ((v_Vuna_dCompiler_dIr_dCps_dmMarked (fuel - 1)) dtb__769)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (dtb__770, dtb__771, dtb__772) -> (match dtb__771 with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (dtb__773, dtb__774, dtb__775) -> (match dtb__774 with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRt (dtb__776) -> (if (dtb__776 = "@ir@m@self") then (match dtb__772 with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLam (dtb__777, dtb__778, dtb__779) -> (match dtb__777 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__780, dtb__781) -> (match dtb__781 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRt (v_Vuna_dCompiler_dIr_dCps_dirMRunName)), (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRt ("@ir@m@self")), ((v_Vuna_dCompiler_dIr_dCps_dmMarked (fuel - 1)) dtb__775))), v_Vuna_dCompiler_dIr_dCps_dmDoneCont))))
  | _ -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, ((v_Vuna_dCompiler_dIr_dCps_dmMarked (fuel - 1)) dtb__771), ((v_Vuna_dCompiler_dIr_dCps_dmMarked (fuel - 1)) dtb__772)))
)
  | _ -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, ((v_Vuna_dCompiler_dIr_dCps_dmMarked (fuel - 1)) dtb__771), ((v_Vuna_dCompiler_dIr_dCps_dmMarked (fuel - 1)) dtb__772)))
)
  | _ -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, ((v_Vuna_dCompiler_dIr_dCps_dmMarked (fuel - 1)) dtb__771), ((v_Vuna_dCompiler_dIr_dCps_dmMarked (fuel - 1)) dtb__772)))
) else (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, ((v_Vuna_dCompiler_dIr_dCps_dmMarked (fuel - 1)) dtb__771), ((v_Vuna_dCompiler_dIr_dCps_dmMarked (fuel - 1)) dtb__772))))
  | _ -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, ((v_Vuna_dCompiler_dIr_dCps_dmMarked (fuel - 1)) dtb__771), ((v_Vuna_dCompiler_dIr_dCps_dmMarked (fuel - 1)) dtb__772)))
)
  | _ -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, ((v_Vuna_dCompiler_dIr_dCps_dmMarked (fuel - 1)) dtb__771), ((v_Vuna_dCompiler_dIr_dCps_dmMarked (fuel - 1)) dtb__772)))
)
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLet (dtb__782, dtb__783, dtb__784) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLet (dtb__782, ((v_Vuna_dCompiler_dIr_dCps_dmMarked (fuel - 1)) dtb__783), ((v_Vuna_dCompiler_dIr_dCps_dmMarked (fuel - 1)) dtb__784)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCast (dtb__785, dtb__786, dtb__787) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCast (dtb__785, dtb__786, ((v_Vuna_dCompiler_dIr_dCps_dmMarked (fuel - 1)) dtb__787)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRecUpd (dtb__788, dtb__789, dtb__790, dtb__791) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRecUpd (((v_Vuna_dCompiler_dIr_dCps_dmMarked (fuel - 1)) dtb__788), dtb__789, ((v_Vuna_dCompiler_dIr_dCps_dmMarkedFields (fuel - 1)) dtb__790), Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrProj (dtb__792, dtb__793, dtb__794, dtb__795) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrProj (((v_Vuna_dCompiler_dIr_dCps_dmMarked (fuel - 1)) dtb__792), dtb__793, dtb__794, Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRecord (dtb__796, dtb__797, dtb__798) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRecord (dtb__796, Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, ((v_Vuna_dCompiler_dIr_dCps_dmMarkedFields (fuel - 1)) dtb__798)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCtor (dtb__799, dtb__800, dtb__801, dtb__802) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCtor (dtb__799, dtb__800, Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, ((v_Vuna_dCompiler_dIr_dCps_dmMarkedList (fuel - 1)) dtb__802)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRtApp (dtb__803, dtb__804) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRtApp (dtb__803, ((v_Vuna_dCompiler_dIr_dCps_dmMarkedList (fuel - 1)) dtb__804)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLam (dtb__805, dtb__806, dtb__807) -> (if (if (v_Vuna_dCompiler_dIr_dCps_disEffContLambda dtb__806) then (Base_dData_dBool.v_Base_dData_dBool_dnot (v_Vuna_dCompiler_dIr_dCps_disEffThunkBody dtb__807)) else false) then (((((v_Vuna_dCompiler_dIr_dCps_dmEffContLambda (fuel - 1)) v_Vuna_dCompiler_dIr_dCps_dmNoResumption) dtb__805) dtb__806) dtb__807) else (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLam (dtb__805, dtb__806, ((v_Vuna_dCompiler_dIr_dCps_dmMarked (fuel - 1)) dtb__807))))
  | _ -> e
)) e)))
# 1508 "Vuna/Compiler/Ir/Cps.vuna"
and v_Vuna_dCompiler_dIr_dCps_dmMarkedList = (fun fuel xs -> (if (fuel <= 0) then xs else (match xs with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__808, dtb__809) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (((v_Vuna_dCompiler_dIr_dCps_dmMarked (fuel - 1)) dtb__808), ((v_Vuna_dCompiler_dIr_dCps_dmMarkedList (fuel - 1)) dtb__809)))
  | _ -> failwith "DT: impossible branch"
)))
# 1517 "Vuna/Compiler/Ir/Cps.vuna"
and v_Vuna_dCompiler_dIr_dCps_dmMarkedFields = (fun fuel fs -> (if (fuel <= 0) then fs else (match fs with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__810, dtb__811) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Base_dData_dPair.v_Base_dData_dPair_dfirstOf dtb__810); Base_dData_dPair.f_Base_dData_dPair_dPair_second = ((v_Vuna_dCompiler_dIr_dCps_dmMarked (fuel - 1)) (Base_dData_dPair.v_Base_dData_dPair_dsecondOf dtb__810)) }, ((v_Vuna_dCompiler_dIr_dCps_dmMarkedFields (fuel - 1)) dtb__811)))
  | _ -> failwith "DT: impossible branch"
)))
# 1526 "Vuna/Compiler/Ir/Cps.vuna"
and v_Vuna_dCompiler_dIr_dCps_dmMarkedAlts = (fun fuel alts -> (if (fuel <= 0) then alts else (match alts with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__812, dtb__813) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltCtor = (dtb__812).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltCtor; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBinders = (dtb__812).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBinders; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBody = ((v_Vuna_dCompiler_dIr_dCps_dmMarked (fuel - 1)) (dtb__812).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBody) }, ((v_Vuna_dCompiler_dIr_dCps_dmMarkedAlts (fuel - 1)) dtb__813)))
  | _ -> failwith "DT: impossible branch"
)))
# 1535 "Vuna/Compiler/Ir/Cps.vuna"
and v_Vuna_dCompiler_dIr_dCps_dmMarkedAltM = (fun fuel m -> (if (fuel <= 0) then m else (match m with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__814) -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ({ Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltCtor = (dtb__814).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltCtor; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBinders = (dtb__814).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBinders; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBody = ((v_Vuna_dCompiler_dIr_dCps_dmMarked (fuel - 1)) (dtb__814).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBody) }))
  | _ -> failwith "DT: impossible branch"
)))

# 1544 "Vuna/Compiler/Ir/Cps.vuna"
let v_Vuna_dCompiler_dIr_dCps_dmMarkedDef = (fun (mc0 : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrDef) -> (match mc0 with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrDef_IrDef (dtb__815, dtb__816, dtb__817, dtb__818, dtb__819, dtb__820, dtb__821, dtb__822) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrDef_IrDef (dtb__815, dtb__816, dtb__817, Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, ((v_Vuna_dCompiler_dIr_dCps_dmMarked v_Vuna_dCompiler_dIr_dCps_dstartFuel) dtb__819), dtb__820, dtb__821, dtb__822))
  | _ -> mc0
))

# 1549 "Vuna/Compiler/Ir/Cps.vuna"
let v_Vuna_dCompiler_dIr_dCps_dmApplysDef = (fun (mc0 : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrDef) -> (match mc0 with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrDef_IrDef (dtb__823, dtb__824, dtb__825, dtb__826, dtb__827, dtb__828, dtb__829, dtb__830) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrDef_IrDef (dtb__823, dtb__824, dtb__825, Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, ((v_Vuna_dCompiler_dIr_dCps_dmApplys v_Vuna_dCompiler_dIr_dCps_dstartFuel) dtb__827), dtb__828, dtb__829, dtb__830))
  | _ -> mc0
))

# 1559 "Vuna/Compiler/Ir/Cps.vuna"
let v_Vuna_dCompiler_dIr_dCps_dmachineCtl = "Base.Effect.Core.Control"

# 1343 "Vuna/Compiler/Ir/Cps.vuna"
let v_Vuna_dCompiler_dIr_dCps_dmCleanupDef = (fun n body -> (if (n = v_Vuna_dCompiler_dIr_dCps_dcleanupPushName) then (match body with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLam (dtb__831, dtb__832, dtb__833) -> (match (v_Vuna_dCompiler_dIr_dCps_dlastBinderOf dtb__831) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__834) -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ((Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLam (dtb__831, Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCtor (Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirEffTypeName, Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirEffMkCtor, Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ((Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLam ((Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ((v_Vuna_dCompiler_dIr_dCps_dmkBinder "__mCleanU"), (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ((v_Vuna_dCompiler_dIr_dCps_dmkBinder "__mCleanK"), Base_dData_dList.C_Base_dData_dList_dList_Nil)))), Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCtor (v_Vuna_dCompiler_dIr_dCps_dmachineCtl, (v_Vuna_dCompiler_dIr_dCps_dmachineCtl ^ ".MkPushCleanup"), Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ((Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCtor ("Base.Effect.Core.Cleanup", "Base.Effect.Core.Cleanup.MkCleanup", Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ((Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrVar (dtb__834)), Base_dData_dList.C_Base_dData_dList_dList_Nil)))), (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ((Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrVar ((v_Vuna_dCompiler_dIr_dCps_dmkBinder "__mCleanK"))), Base_dData_dList.C_Base_dData_dList_dList_Nil)))))))), Base_dData_dList.C_Base_dData_dList_dList_Nil))))))))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
) else (if (n = v_Vuna_dCompiler_dIr_dCps_dcleanupPopName) then (match body with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLam (dtb__835, dtb__836, dtb__837) -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ((Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLam (dtb__835, Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCtor (Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirEffTypeName, Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirEffMkCtor, Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ((Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLam ((Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ((v_Vuna_dCompiler_dIr_dCps_dmkBinder "__mCleanU"), (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ((v_Vuna_dCompiler_dIr_dCps_dmkBinder "__mCleanK"), Base_dData_dList.C_Base_dData_dList_dList_Nil)))), Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCtor (v_Vuna_dCompiler_dIr_dCps_dmachineCtl, (v_Vuna_dCompiler_dIr_dCps_dmachineCtl ^ ".MkPopCleanup"), Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ((Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrVar ((v_Vuna_dCompiler_dIr_dCps_dmkBinder "__mCleanK"))), Base_dData_dList.C_Base_dData_dList_dList_Nil)))))), Base_dData_dList.C_Base_dData_dList_dList_Nil))))))))
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
) else Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing)))

# 1375 "Vuna/Compiler/Ir/Cps.vuna"
let v_Vuna_dCompiler_dIr_dCps_dmDef = (fun handlers fuel d -> (if (fuel <= 0) then d else (match d with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrDef_IrExternDef (dtb__838, dtb__839, dtb__840, dtb__841) -> d
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrDef_IrDef (dtb__842, dtb__843, dtb__844, dtb__845, dtb__846, dtb__847, dtb__848, dtb__849) -> ((fun marked -> ((fun h -> ((fun ar2 -> ((fun b -> (if (if (if (dtb__842 = v_Vuna_dCompiler_dIr_dCps_drunPureName) then true else (dtb__842 = v_Vuna_dCompiler_dIr_dCps_drunEffName)) then true else (dtb__842 = v_Vuna_dCompiler_dIr_dCps_drunMainName)) then (match ((v_Vuna_dCompiler_dIr_dCps_dmTrampolineBody dtb__842) b) with
  | Base_dData_dResult.C_Base_dData_dResult_dResult_Ok (dtb__850) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrDef_IrDef (dtb__842, ar2, dtb__844, Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, dtb__850, dtb__847, dtb__848, dtb__849))
  | Base_dData_dResult.C_Base_dData_dResult_dResult_Err (dtb__851) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrDef_IrDef (dtb__842, ar2, dtb__844, Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, b, dtb__847, dtb__848, dtb__849))
  | _ -> failwith "DT: impossible branch"
) else (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrDef_IrDef (dtb__842, ar2, dtb__844, Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, b, dtb__847, dtb__848, dtb__849)))) ((v_Vuna_dCompiler_dIr_dCps_dmSyms (fuel - 1)) ((v_Vuna_dCompiler_dIr_dCps_dmHandlers (fuel - 1)) h)))) (if marked then (dtb__843 + 2) else dtb__843))) (match ((v_Vuna_dCompiler_dIr_dCps_dmCleanupDef dtb__842) dtb__846) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__852) -> dtb__852
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (if marked then ((v_Vuna_dCompiler_dIr_dCps_dmHandlerFun (fuel - 1)) dtb__846) else dtb__846)
  | _ -> failwith "DT: impossible branch"
))) ((v_Vuna_dCompiler_dIr_dCps_dmemName dtb__842) handlers))
  | _ -> failwith "DT: impossible branch"
)))

# 1398 "Vuna/Compiler/Ir/Cps.vuna"
let rec v_Vuna_dCompiler_dIr_dCps_dmDefs = (fun handlers fuel ds -> (if (fuel <= 0) then ds else (match ds with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__853, dtb__854) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ((((v_Vuna_dCompiler_dIr_dCps_dmDef handlers) (fuel - 1)) dtb__853), (((v_Vuna_dCompiler_dIr_dCps_dmDefs handlers) (fuel - 1)) dtb__854)))
  | _ -> failwith "DT: impossible branch"
)))

# 1562 "Vuna/Compiler/Ir/Cps.vuna"
let v_Vuna_dCompiler_dIr_dCps_dmachineCtorOf = (fun sym -> (if (sym = v_Vuna_dCompiler_dIr_dCps_dirMDoneName) then (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ("MkDone")) else (if (sym = v_Vuna_dCompiler_dIr_dCps_dirMApplyName) then (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ("MkApply")) else (if (sym = v_Vuna_dCompiler_dIr_dCps_dirMPerformName) then (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ("MkPerform")) else (if (sym = v_Vuna_dCompiler_dIr_dCps_dirMHandleName) then (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ("MkHandle")) else (if (sym = v_Vuna_dCompiler_dIr_dCps_dirMSelfName) then (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ("MkSelf")) else Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing))))))

# 1576 "Vuna/Compiler/Ir/Cps.vuna"
let v_Vuna_dCompiler_dIr_dCps_dmachineArgsOf = (fun sym args -> (if (sym = v_Vuna_dCompiler_dIr_dCps_dirMHandleName) then ((fun nd_uscrut2 -> (match nd_uscrut2 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__855, dtb__856) -> (match dtb__856 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__857, dtb__858) -> (match dtb__858 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__859, dtb__860) -> (match dtb__860 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__861, dtb__862) -> (match dtb__862 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__863, dtb__864) -> (match dtb__864 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__865, dtb__866) -> ((Base_dData_dList.v_Base_dData_dList_dappend (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__855, (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__857, (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__859, (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__861, (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__863, Base_dData_dList.C_Base_dData_dList_dList_Nil))))))))))) dtb__866)
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

# 1585 "Vuna/Compiler/Ir/Cps.vuna"
let rec v_Vuna_dCompiler_dIr_dCps_dmSteps = (fun fuel e -> (if (fuel <= 0) then e else (match e with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRtApp (dtb__867, dtb__868) -> (match (v_Vuna_dCompiler_dIr_dCps_dmachineCtorOf dtb__867) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__869) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCtor (v_Vuna_dCompiler_dIr_dCps_dmachineCtl, (String.concat "" [v_Vuna_dCompiler_dIr_dCps_dmachineCtl; "."; dtb__869]), Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, ((v_Vuna_dCompiler_dIr_dCps_dmStepsList (fuel - 1)) ((v_Vuna_dCompiler_dIr_dCps_dmachineArgsOf dtb__867) dtb__868))))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (if (dtb__867 = v_Vuna_dCompiler_dIr_dCps_dirMRunName) then ((fun nd_uscrut5 -> (match nd_uscrut5 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__870, dtb__871) -> (match dtb__871 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrGlobal ("Base.Effect.Core.machineRun")), ((v_Vuna_dCompiler_dIr_dCps_dmSteps (fuel - 1)) dtb__870)))
  | _ -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRtApp (dtb__867, ((v_Vuna_dCompiler_dIr_dCps_dmStepsList (fuel - 1)) dtb__868)))
)
  | _ -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRtApp (dtb__867, ((v_Vuna_dCompiler_dIr_dCps_dmStepsList (fuel - 1)) dtb__868)))
)) dtb__868) else (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRtApp (dtb__867, ((v_Vuna_dCompiler_dIr_dCps_dmStepsList (fuel - 1)) dtb__868))))
  | _ -> failwith "DT: impossible branch"
)
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (dtb__872, dtb__873, dtb__874) -> ((fun p -> ((fun head -> ((fun args -> (match head with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRt (dtb__875) -> (match (v_Vuna_dCompiler_dIr_dCps_dmachineCtorOf dtb__875) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__876) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCtor (v_Vuna_dCompiler_dIr_dCps_dmachineCtl, (String.concat "" [v_Vuna_dCompiler_dIr_dCps_dmachineCtl; "."; dtb__876]), Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, ((v_Vuna_dCompiler_dIr_dCps_dmStepsList (fuel - 1)) ((v_Vuna_dCompiler_dIr_dCps_dmachineArgsOf dtb__875) args))))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (if (dtb__875 = v_Vuna_dCompiler_dIr_dCps_dirMRunName) then ((fun nd_uscrut10 -> (match nd_uscrut10 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__877, dtb__878) -> (match dtb__878 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrGlobal ("Base.Effect.Core.machineRun")), ((v_Vuna_dCompiler_dIr_dCps_dmSteps (fuel - 1)) dtb__877)))
  | _ -> (((v_Vuna_dCompiler_dIr_dCps_dfoldAppMap (fuel - 1)) ((v_Vuna_dCompiler_dIr_dCps_dmSteps (fuel - 1)) head)) args)
)
  | _ -> (((v_Vuna_dCompiler_dIr_dCps_dfoldAppMap (fuel - 1)) ((v_Vuna_dCompiler_dIr_dCps_dmSteps (fuel - 1)) head)) args)
)) args) else (((v_Vuna_dCompiler_dIr_dCps_dfoldAppMap (fuel - 1)) ((v_Vuna_dCompiler_dIr_dCps_dmSteps (fuel - 1)) head)) args))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> (((v_Vuna_dCompiler_dIr_dCps_dfoldAppMap (fuel - 1)) ((v_Vuna_dCompiler_dIr_dCps_dmSteps (fuel - 1)) head)) args)
)) (Base_dData_dPair.v_Base_dData_dPair_dsecondOf p))) (Base_dData_dPair.v_Base_dData_dPair_dfirstOf p))) (v_Vuna_dCompiler_dIr_dCps_dflattenApp e))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCtor (dtb__879, dtb__880, dtb__881, dtb__882) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCtor (dtb__879, dtb__880, Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, ((v_Vuna_dCompiler_dIr_dCps_dmStepsList (fuel - 1)) dtb__882)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRecord (dtb__883, dtb__884, dtb__885) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRecord (dtb__883, Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, ((v_Vuna_dCompiler_dIr_dCps_dmStepsFields (fuel - 1)) dtb__885)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrProj (dtb__886, dtb__887, dtb__888, dtb__889) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrProj (((v_Vuna_dCompiler_dIr_dCps_dmSteps (fuel - 1)) dtb__886), dtb__887, dtb__888, Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRecUpd (dtb__890, dtb__891, dtb__892, dtb__893) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRecUpd (((v_Vuna_dCompiler_dIr_dCps_dmSteps (fuel - 1)) dtb__890), dtb__891, ((v_Vuna_dCompiler_dIr_dCps_dmStepsFields (fuel - 1)) dtb__892), Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCast (dtb__894, dtb__895, dtb__896) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCast (dtb__894, dtb__895, ((v_Vuna_dCompiler_dIr_dCps_dmSteps (fuel - 1)) dtb__896)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLet (dtb__897, dtb__898, dtb__899) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLet (dtb__897, ((v_Vuna_dCompiler_dIr_dCps_dmSteps (fuel - 1)) dtb__898), ((v_Vuna_dCompiler_dIr_dCps_dmSteps (fuel - 1)) dtb__899)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLam (dtb__900, dtb__901, dtb__902) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLam (dtb__900, dtb__901, ((v_Vuna_dCompiler_dIr_dCps_dmSteps (fuel - 1)) dtb__902)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrIf (dtb__903, dtb__904, dtb__905) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrIf (((v_Vuna_dCompiler_dIr_dCps_dmSteps (fuel - 1)) dtb__903), ((v_Vuna_dCompiler_dIr_dCps_dmSteps (fuel - 1)) dtb__904), ((v_Vuna_dCompiler_dIr_dCps_dmSteps (fuel - 1)) dtb__905)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCase (dtb__906, dtb__907, dtb__908, dtb__909) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCase (dtb__906, Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, ((v_Vuna_dCompiler_dIr_dCps_dmSteps (fuel - 1)) dtb__908), ((v_Vuna_dCompiler_dIr_dCps_dmStepsAlts (fuel - 1)) dtb__909)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrNatCase (dtb__910, dtb__911, dtb__912, dtb__913, dtb__914) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrNatCase (((v_Vuna_dCompiler_dIr_dCps_dmSteps (fuel - 1)) dtb__910), dtb__911, ((v_Vuna_dCompiler_dIr_dCps_dmStepsAltM (fuel - 1)) dtb__912), ((v_Vuna_dCompiler_dIr_dCps_dmStepsAltM (fuel - 1)) dtb__913), ((v_Vuna_dCompiler_dIr_dCps_dmStepsAltM (fuel - 1)) dtb__914)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrConcatMany (dtb__915) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrConcatMany (((v_Vuna_dCompiler_dIr_dCps_dmStepsList (fuel - 1)) dtb__915)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrEffThunk (dtb__916, dtb__917, dtb__918, dtb__919, dtb__920) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrEffThunk (dtb__916, dtb__917, dtb__918, dtb__919, ((v_Vuna_dCompiler_dIr_dCps_dmSteps (fuel - 1)) dtb__920)))
  | _ -> e
)))
# 1632 "Vuna/Compiler/Ir/Cps.vuna"
and v_Vuna_dCompiler_dIr_dCps_dmStepsList = (fun fuel xs -> (if (fuel <= 0) then xs else (match xs with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__921, dtb__922) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (((v_Vuna_dCompiler_dIr_dCps_dmSteps (fuel - 1)) dtb__921), ((v_Vuna_dCompiler_dIr_dCps_dmStepsList (fuel - 1)) dtb__922)))
  | _ -> failwith "DT: impossible branch"
)))
# 1641 "Vuna/Compiler/Ir/Cps.vuna"
and v_Vuna_dCompiler_dIr_dCps_dmStepsFields = (fun fuel fs -> (if (fuel <= 0) then fs else (match fs with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__923, dtb__924) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Base_dData_dPair.v_Base_dData_dPair_dfirstOf dtb__923); Base_dData_dPair.f_Base_dData_dPair_dPair_second = ((v_Vuna_dCompiler_dIr_dCps_dmSteps (fuel - 1)) (Base_dData_dPair.v_Base_dData_dPair_dsecondOf dtb__923)) }, ((v_Vuna_dCompiler_dIr_dCps_dmStepsFields (fuel - 1)) dtb__924)))
  | _ -> failwith "DT: impossible branch"
)))
# 1650 "Vuna/Compiler/Ir/Cps.vuna"
and v_Vuna_dCompiler_dIr_dCps_dmStepsAlts = (fun fuel alts -> (if (fuel <= 0) then alts else (match alts with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__925, dtb__926) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltCtor = (dtb__925).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltCtor; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBinders = (dtb__925).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBinders; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBody = ((v_Vuna_dCompiler_dIr_dCps_dmSteps (fuel - 1)) (dtb__925).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBody) }, ((v_Vuna_dCompiler_dIr_dCps_dmStepsAlts (fuel - 1)) dtb__926)))
  | _ -> failwith "DT: impossible branch"
)))
# 1659 "Vuna/Compiler/Ir/Cps.vuna"
and v_Vuna_dCompiler_dIr_dCps_dmStepsAltM = (fun fuel m -> (if (fuel <= 0) then m else (match m with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__927) -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ({ Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltCtor = (dtb__927).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltCtor; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBinders = (dtb__927).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBinders; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBody = ((v_Vuna_dCompiler_dIr_dCps_dmSteps (fuel - 1)) (dtb__927).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBody) }))
  | _ -> failwith "DT: impossible branch"
)))
# 1669 "Vuna/Compiler/Ir/Cps.vuna"
and v_Vuna_dCompiler_dIr_dCps_dfoldAppMap = (fun fuel acc xs -> (if (fuel <= 0) then acc else (match xs with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> acc
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__928, dtb__929) -> (((v_Vuna_dCompiler_dIr_dCps_dfoldAppMap (fuel - 1)) (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, acc, ((v_Vuna_dCompiler_dIr_dCps_dmSteps (fuel - 1)) dtb__928)))) dtb__929)
  | _ -> failwith "DT: impossible branch"
)))

# 1678 "Vuna/Compiler/Ir/Cps.vuna"
let v_Vuna_dCompiler_dIr_dCps_dmStepsDef = (fun (mc0 : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrDef) -> (match mc0 with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrDef_IrDef (dtb__930, dtb__931, dtb__932, dtb__933, dtb__934, dtb__935, dtb__936, dtb__937) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrDef_IrDef (dtb__930, dtb__931, dtb__932, Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, ((v_Vuna_dCompiler_dIr_dCps_dmSteps v_Vuna_dCompiler_dIr_dCps_dstartFuel) dtb__934), dtb__935, dtb__936, dtb__937))
  | _ -> mc0
))

# 1697 "Vuna/Compiler/Ir/Cps.vuna"
let v_Vuna_dCompiler_dIr_dCps_dcpsUnit = (fun u -> (match ((v_Vuna_dCompiler_dIr_dCps_dtransformGroups v_Vuna_dCompiler_dIr_dCps_dstartFuel) (u).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrUnit_irUnitGroups) with
  | Base_dData_dResult.C_Base_dData_dResult_dResult_Err (dtb__938) -> (Base_dData_dResult.C_Base_dData_dResult_dResult_Err (dtb__938))
  | Base_dData_dResult.C_Base_dData_dResult_dResult_Ok (dtb__939) -> (Base_dData_dResult.C_Base_dData_dResult_dResult_Ok ({ Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrUnit_irUnitTyDecls = (u).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrUnit_irUnitTyDecls; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrUnit_irUnitGroups = dtb__939; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrUnit_irUnitHasListFamily = (u).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrUnit_irUnitHasListFamily; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrUnit_irUnitTypeRefs = (u).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrUnit_irUnitTypeRefs; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrUnit_irUnitEntry = (u).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrUnit_irUnitEntry }))
  | _ -> failwith "DT: impossible branch"
))

# 1705 "Vuna/Compiler/Ir/Cps.vuna"
let v_Vuna_dCompiler_dIr_dCps_dcpsDefs = (fun defs -> ((v_Vuna_dCompiler_dIr_dCps_dtransformDefs v_Vuna_dCompiler_dIr_dCps_dstartFuel) defs))

# 1682 "Vuna/Compiler/Ir/Cps.vuna"
let v_Vuna_dCompiler_dIr_dCps_dcpsDefsMachine = (fun defs -> (match (v_Vuna_dCompiler_dIr_dCps_dcpsDefs defs) with
  | Base_dData_dResult.C_Base_dData_dResult_dResult_Err (dtb__940) -> (Base_dData_dResult.C_Base_dData_dResult_dResult_Err (dtb__940))
  | Base_dData_dResult.C_Base_dData_dResult_dResult_Ok (dtb__941) -> (Base_dData_dResult.C_Base_dData_dResult_dResult_Ok (((Base_dData_dList.v_Base_dData_dList_dmap v_Vuna_dCompiler_dIr_dCps_dmStepsDef) ((Base_dData_dList.v_Base_dData_dList_dmap v_Vuna_dCompiler_dIr_dCps_dmApplysDef) ((Base_dData_dList.v_Base_dData_dList_dmap v_Vuna_dCompiler_dIr_dCps_dmMarkedDef) (((v_Vuna_dCompiler_dIr_dCps_dmDefs ((v_Vuna_dCompiler_dIr_dCps_dcollectHandleOpsDefs 100000) dtb__941)) v_Vuna_dCompiler_dIr_dCps_dstartFuel) dtb__941))))))
  | _ -> failwith "DT: impossible branch"
))

# 1690 "Vuna/Compiler/Ir/Cps.vuna"
let v_Vuna_dCompiler_dIr_dCps_dcpsDefsStep = (fun defs -> (match (v_Vuna_dCompiler_dIr_dCps_dcpsDefs defs) with
  | Base_dData_dResult.C_Base_dData_dResult_dResult_Err (dtb__942) -> (Base_dData_dResult.C_Base_dData_dResult_dResult_Err (dtb__942))
  | Base_dData_dResult.C_Base_dData_dResult_dResult_Ok (dtb__943) -> ((v_Vuna_dCompiler_dIr_dCps_dselDefs v_Vuna_dCompiler_dIr_dCps_dstartFuel) dtb__943)
  | _ -> failwith "DT: impossible branch"
))
