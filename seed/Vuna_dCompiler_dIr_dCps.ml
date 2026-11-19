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
let v_Vuna_dCompiler_dIr_dCps_druntimeBinders = (fun (bs : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrBinder Base_dData_dList.t_Base_dData_dList_dList) -> ((Base_dData_dList.v_Base_dData_dList_dfilter (fun (b : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrBinder) -> (Base_dData_dBool.v_Base_dData_dBool_dnot (v_Vuna_dCompiler_dIr_dCps_dbinderErased b)))) bs))

# 131 "Vuna/Compiler/Ir/Cps.vuna"
let v_Vuna_dCompiler_dIr_dCps_dmkBinder = (fun (name : string) -> (Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dmkIrBinder name))

# 136 "Vuna/Compiler/Ir/Cps.vuna"
let v_Vuna_dCompiler_dIr_dCps_dfreshV = (fun (fuel : int) -> (v_Vuna_dCompiler_dIr_dCps_dmkBinder ("__cpsV" ^ (bi_strFromInt fuel))))

# 139 "Vuna/Compiler/Ir/Cps.vuna"
let v_Vuna_dCompiler_dIr_dCps_dfreshK = (fun (fuel : int) -> (v_Vuna_dCompiler_dIr_dCps_dmkBinder ("__cpsK" ^ (bi_strFromInt fuel))))

# 142 "Vuna/Compiler/Ir/Cps.vuna"
let v_Vuna_dCompiler_dIr_dCps_dfreshU = (fun (fuel : int) -> (v_Vuna_dCompiler_dIr_dCps_dmkBinder ("__cpsU" ^ (bi_strFromInt fuel))))

# 145 "Vuna/Compiler/Ir/Cps.vuna"
let v_Vuna_dCompiler_dIr_dCps_dfreshA = (fun (fuel : int) (i : int) -> (v_Vuna_dCompiler_dIr_dCps_dmkBinder (String.concat "" ["__cpsA"; (bi_strFromInt fuel); "_"; (bi_strFromInt i)])))

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
let v_Vuna_dCompiler_dIr_dCps_disThunkCtor = (fun (family : string) (ctor : string) -> (if (if (family = Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirEffTypeName) then (ctor = Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirEffMkCtor) else false) then true else (if (family = v_Vuna_dCompiler_dIr_dCps_dirScopedTypeName) then (ctor = v_Vuna_dCompiler_dIr_dCps_dirScopedMkCtor) else false)))

# 202 "Vuna/Compiler/Ir/Cps.vuna"
let v_Vuna_dCompiler_dIr_dCps_disThunkAlt = (fun (alt : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrAlt) -> ((fun nd_uscrut1 -> (match nd_uscrut1 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> false
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__22) -> (match dtb__22 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__23; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__24 } -> ((v_Vuna_dCompiler_dIr_dCps_disThunkCtor dtb__23) dtb__24)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) (alt).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltCtor))

# 209 "Vuna/Compiler/Ir/Cps.vuna"
let v_Vuna_dCompiler_dIr_dCps_dthunkBindersOfAlt = (fun (alt : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrAlt) -> (if (v_Vuna_dCompiler_dIr_dCps_disThunkAlt alt) then (v_Vuna_dCompiler_dIr_dCps_druntimeBinders (alt).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBinders) else Base_dData_dList.C_Base_dData_dList_dList_Nil))

# 160 "Vuna/Compiler/Ir/Cps.vuna"
let rec v_Vuna_dCompiler_dIr_dCps_dmapDirect = (fun (fuel : int) (xs : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIr Base_dData_dList.t_Base_dData_dList_dList) -> (if (fuel <= 0) then xs else (match xs with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__25, dtb__26) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (((v_Vuna_dCompiler_dIr_dCps_dtransformDirect (fuel - 1)) dtb__25), ((v_Vuna_dCompiler_dIr_dCps_dmapDirect (fuel - 1)) dtb__26)))
  | _ -> failwith "DT: impossible branch"
)))
# 169 "Vuna/Compiler/Ir/Cps.vuna"
and v_Vuna_dCompiler_dIr_dCps_dmapAltDirect = (fun (fuel : int) (xs : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrAlt Base_dData_dList.t_Base_dData_dList_dList) -> (if (fuel <= 0) then xs else (match xs with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__27, dtb__28) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (((v_Vuna_dCompiler_dIr_dCps_dtransformAltDirect (fuel - 1)) dtb__27), ((v_Vuna_dCompiler_dIr_dCps_dmapAltDirect (fuel - 1)) dtb__28)))
  | _ -> failwith "DT: impossible branch"
)))
# 178 "Vuna/Compiler/Ir/Cps.vuna"
and v_Vuna_dCompiler_dIr_dCps_dmapAltCps = (fun (fuel : int) (env : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrBinder Base_dData_dList.t_Base_dData_dList_dList) (xs : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrAlt Base_dData_dList.t_Base_dData_dList_dList) (k : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIr) -> (if (fuel <= 0) then xs else (match xs with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__29, dtb__30) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (((((v_Vuna_dCompiler_dIr_dCps_dcpsAlt (fuel - 1)) env) dtb__29) k), ((((v_Vuna_dCompiler_dIr_dCps_dmapAltCps (fuel - 1)) env) dtb__30) k)))
  | _ -> failwith "DT: impossible branch"
)))
# 187 "Vuna/Compiler/Ir/Cps.vuna"
and v_Vuna_dCompiler_dIr_dCps_dmapFieldsDirect = (fun (fuel : int) (xs : (string, Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIr) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) -> (if (fuel <= 0) then xs else (match xs with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__31, dtb__32) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Base_dData_dPair.v_Base_dData_dPair_dfirstOf dtb__31); Base_dData_dPair.f_Base_dData_dPair_dPair_second = ((v_Vuna_dCompiler_dIr_dCps_dtransformDirect (fuel - 1)) (Base_dData_dPair.v_Base_dData_dPair_dsecondOf dtb__31)) }, ((v_Vuna_dCompiler_dIr_dCps_dmapFieldsDirect (fuel - 1)) dtb__32)))
  | _ -> failwith "DT: impossible branch"
)))
# 224 "Vuna/Compiler/Ir/Cps.vuna"
and v_Vuna_dCompiler_dIr_dCps_dcpsExpr = (fun (fuel : int) (env : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrBinder Base_dData_dList.t_Base_dData_dList_dList) (e : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIr) (k : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIr) -> (if (fuel <= 0) then (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, k, ((v_Vuna_dCompiler_dIr_dCps_dtransformDirect (fuel - 1)) e))) else (match e with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (dtb__33, dtb__34, dtb__35) -> ((((v_Vuna_dCompiler_dIr_dCps_dcpsApp (fuel - 1)) env) e) k)
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCase (dtb__36, dtb__37, dtb__38, dtb__39) -> ((fun v -> ((fun kCase -> ((((v_Vuna_dCompiler_dIr_dCps_dcpsExpr (fuel - 1)) env) dtb__38) kCase)) (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLam ((Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (v, Base_dData_dList.C_Base_dData_dList_dList_Nil)), Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCase (dtb__36, Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrVar (v)), ((((v_Vuna_dCompiler_dIr_dCps_dmapAltCps (fuel - 1)) env) dtb__39) k))))))) (v_Vuna_dCompiler_dIr_dCps_dfreshV fuel))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrNatCase (dtb__40, dtb__41, dtb__42, dtb__43, dtb__44) -> ((fun v -> ((fun kCase -> ((((v_Vuna_dCompiler_dIr_dCps_dcpsExpr (fuel - 1)) env) dtb__40) kCase)) (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLam ((Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (v, Base_dData_dList.C_Base_dData_dList_dList_Nil)), Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrNatCase ((Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrVar (v)), dtb__41, ((((v_Vuna_dCompiler_dIr_dCps_dcpsAltMaybe (fuel - 1)) env) dtb__42) k), ((((v_Vuna_dCompiler_dIr_dCps_dcpsAltMaybe (fuel - 1)) env) dtb__43) k), ((((v_Vuna_dCompiler_dIr_dCps_dcpsAltMaybe (fuel - 1)) env) dtb__44) k))))))) (v_Vuna_dCompiler_dIr_dCps_dfreshV fuel))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrIf (dtb__45, dtb__46, dtb__47) -> ((fun v -> ((fun kIf -> ((((v_Vuna_dCompiler_dIr_dCps_dcpsExpr (fuel - 1)) env) dtb__45) kIf)) (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLam ((Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (v, Base_dData_dList.C_Base_dData_dList_dList_Nil)), Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrIf ((Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrVar (v)), ((((v_Vuna_dCompiler_dIr_dCps_dcpsExpr (fuel - 1)) env) dtb__46) k), ((((v_Vuna_dCompiler_dIr_dCps_dcpsExpr (fuel - 1)) env) dtb__47) k))))))) (v_Vuna_dCompiler_dIr_dCps_dfreshV fuel))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLet (dtb__48, dtb__49, dtb__50) -> ((fun v -> ((fun kLet -> ((((v_Vuna_dCompiler_dIr_dCps_dcpsExpr (fuel - 1)) env) dtb__49) kLet)) (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLam ((Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (v, Base_dData_dList.C_Base_dData_dList_dList_Nil)), Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLet (dtb__48, (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrVar (v)), ((((v_Vuna_dCompiler_dIr_dCps_dcpsExpr (fuel - 1)) env) dtb__50) k))))))) (v_Vuna_dCompiler_dIr_dCps_dfreshV fuel))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCast (dtb__51, dtb__52, dtb__53) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCast (dtb__51, dtb__52, ((((v_Vuna_dCompiler_dIr_dCps_dcpsExpr (fuel - 1)) env) dtb__53) k)))
  | _ -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, k, ((v_Vuna_dCompiler_dIr_dCps_dtransformDirect (fuel - 1)) e)))
)))
# 254 "Vuna/Compiler/Ir/Cps.vuna"
and v_Vuna_dCompiler_dIr_dCps_dcpsAlt = (fun (fuel : int) (env : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrBinder Base_dData_dList.t_Base_dData_dList_dList) (alt : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrAlt) (k : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIr) -> (if (fuel <= 0) then alt else ((fun env1 -> { Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltCtor = (alt).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltCtor; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBinders = (alt).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBinders; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBody = ((((v_Vuna_dCompiler_dIr_dCps_dcpsExpr (fuel - 1)) env1) (alt).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBody) k) }) ((Base_dData_dList.v_Base_dData_dList_dappend (v_Vuna_dCompiler_dIr_dCps_dthunkBindersOfAlt alt)) env))))
# 263 "Vuna/Compiler/Ir/Cps.vuna"
and v_Vuna_dCompiler_dIr_dCps_dcpsAltMaybe = (fun (fuel : int) (env : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrBinder Base_dData_dList.t_Base_dData_dList_dList) (m : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrAlt Base_dData_dMaybe.t_Base_dData_dMaybe_dMaybe) (k : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIr) -> (if (fuel <= 0) then m else (match m with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__54) -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (((((v_Vuna_dCompiler_dIr_dCps_dcpsAlt (fuel - 1)) env) dtb__54) k)))
  | _ -> failwith "DT: impossible branch"
)))
# 273 "Vuna/Compiler/Ir/Cps.vuna"
and v_Vuna_dCompiler_dIr_dCps_dcpsArgs = (fun (fuel : int) (env : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrBinder Base_dData_dList.t_Base_dData_dList_dList) (args : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIr Base_dData_dList.t_Base_dData_dList_dList) (head : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIr) (acc : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIr Base_dData_dList.t_Base_dData_dList_dList) (k : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIr) -> (if (fuel <= 0) then (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, k, ((v_Vuna_dCompiler_dIr_dCps_dapplyAll head) (Base_dData_dList.v_Base_dData_dList_dreverse acc)))) else (match args with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, k, ((v_Vuna_dCompiler_dIr_dCps_dapplyAll head) (Base_dData_dList.v_Base_dData_dList_dreverse acc))))
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__55, dtb__56) -> ((fun v -> ((((v_Vuna_dCompiler_dIr_dCps_dcpsExpr (fuel - 1)) env) dtb__55) (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLam ((Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (v, Base_dData_dList.C_Base_dData_dList_dList_Nil)), Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, ((((((v_Vuna_dCompiler_dIr_dCps_dcpsArgs (fuel - 1)) env) dtb__56) head) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ((Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrVar (v)), acc))) k))))) (v_Vuna_dCompiler_dIr_dCps_dfreshV fuel))
  | _ -> failwith "DT: impossible branch"
)))
# 286 "Vuna/Compiler/Ir/Cps.vuna"
and v_Vuna_dCompiler_dIr_dCps_dcpsThunkCall = (fun (fuel : int) (head : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIr) (args : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIr Base_dData_dList.t_Base_dData_dList_dList) (k : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIr) -> (if (fuel <= 0) then ((v_Vuna_dCompiler_dIr_dCps_dapplyAll head) ((Base_dData_dList.v_Base_dData_dList_dappend args) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (k, Base_dData_dList.C_Base_dData_dList_dList_Nil)))) else ((v_Vuna_dCompiler_dIr_dCps_dapplyAll ((v_Vuna_dCompiler_dIr_dCps_dtransformDirect (fuel - 1)) head)) ((Base_dData_dList.v_Base_dData_dList_dappend ((v_Vuna_dCompiler_dIr_dCps_dmapDirect (fuel - 1)) args)) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (k, Base_dData_dList.C_Base_dData_dList_dList_Nil))))))
# 294 "Vuna/Compiler/Ir/Cps.vuna"
and v_Vuna_dCompiler_dIr_dCps_dcpsApp = (fun (fuel : int) (env : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrBinder Base_dData_dList.t_Base_dData_dList_dList) (e : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIr) (k : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIr) -> (if (fuel <= 0) then (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, k, e)) else ((fun p -> ((fun head -> ((fun args -> ((fun v -> (match head with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrVar (dtb__57) -> (if ((v_Vuna_dCompiler_dIr_dCps_dmemBinder dtb__57) env) then ((((v_Vuna_dCompiler_dIr_dCps_dcpsThunkCall (fuel - 1)) head) args) k) else ((((v_Vuna_dCompiler_dIr_dCps_dcpsExpr (fuel - 1)) env) head) (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLam ((Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (v, Base_dData_dList.C_Base_dData_dList_dList_Nil)), Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, ((((((v_Vuna_dCompiler_dIr_dCps_dcpsArgs (fuel - 1)) env) args) (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrVar (v))) Base_dData_dList.C_Base_dData_dList_dList_Nil) k)))))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrGlobal (dtb__58) -> (if (dtb__58 = v_Vuna_dCompiler_dIr_dCps_drunThunkName) then ((((v_Vuna_dCompiler_dIr_dCps_dcpsThunkCall (fuel - 1)) head) args) k) else ((((v_Vuna_dCompiler_dIr_dCps_dcpsExpr (fuel - 1)) env) head) (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLam ((Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (v, Base_dData_dList.C_Base_dData_dList_dList_Nil)), Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, ((((((v_Vuna_dCompiler_dIr_dCps_dcpsArgs (fuel - 1)) env) args) (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrVar (v))) Base_dData_dList.C_Base_dData_dList_dList_Nil) k)))))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRt (dtb__59) -> (if (dtb__59 = "prim_effectPerform") then ((((v_Vuna_dCompiler_dIr_dCps_dcpsThunkCall (fuel - 1)) (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRt (v_Vuna_dCompiler_dIr_dCps_dirCpsPerformName))) args) k) else (if (dtb__59 = "prim_effectHandle") then ((((v_Vuna_dCompiler_dIr_dCps_dcpsThunkCall (fuel - 1)) (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRt (v_Vuna_dCompiler_dIr_dCps_dirCpsHandleName))) args) k) else (if (dtb__59 = "prim_effectSelf") then ((((v_Vuna_dCompiler_dIr_dCps_dcpsThunkCall (fuel - 1)) (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRt (v_Vuna_dCompiler_dIr_dCps_dirCpsSelfName))) args) k) else ((((v_Vuna_dCompiler_dIr_dCps_dcpsExpr (fuel - 1)) env) head) (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLam ((Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (v, Base_dData_dList.C_Base_dData_dList_dList_Nil)), Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, ((((((v_Vuna_dCompiler_dIr_dCps_dcpsArgs (fuel - 1)) env) args) (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrVar (v))) Base_dData_dList.C_Base_dData_dList_dList_Nil) k)))))))
  | _ -> ((((v_Vuna_dCompiler_dIr_dCps_dcpsExpr (fuel - 1)) env) head) (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLam ((Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (v, Base_dData_dList.C_Base_dData_dList_dList_Nil)), Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, ((((((v_Vuna_dCompiler_dIr_dCps_dcpsArgs (fuel - 1)) env) args) (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrVar (v))) Base_dData_dList.C_Base_dData_dList_dList_Nil) k))))
)) (v_Vuna_dCompiler_dIr_dCps_dfreshV fuel))) (Base_dData_dPair.v_Base_dData_dPair_dsecondOf p))) (Base_dData_dPair.v_Base_dData_dPair_dfirstOf p))) (v_Vuna_dCompiler_dIr_dCps_dflattenApp e))))
# 318 "Vuna/Compiler/Ir/Cps.vuna"
and v_Vuna_dCompiler_dIr_dCps_dtransformDirect = (fun (fuel : int) (e : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIr) -> (if (fuel <= 0) then e else (match e with
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
and v_Vuna_dCompiler_dIr_dCps_dtransformAltDirect = (fun (fuel : int) (alt : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrAlt) -> (if (fuel <= 0) then alt else { Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltCtor = (alt).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltCtor; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBinders = (alt).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBinders; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBody = ((v_Vuna_dCompiler_dIr_dCps_dtransformDirect (fuel - 1)) (alt).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBody) }))
# 371 "Vuna/Compiler/Ir/Cps.vuna"
and v_Vuna_dCompiler_dIr_dCps_dtransformAltMaybe = (fun (fuel : int) (m : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrAlt Base_dData_dMaybe.t_Base_dData_dMaybe_dMaybe) -> (if (fuel <= 0) then m else (match m with
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
let rec v_Vuna_dCompiler_dIr_dCps_dselfAlt = (fun (fuel : int) (alt : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrAlt) (name : string) -> (if (fuel <= 0) then (Base_dData_dResult.C_Base_dData_dResult_dResult_Ok (alt)) else (match (((v_Vuna_dCompiler_dIr_dCps_dselfBody (fuel - 1)) (alt).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBody) name) with
  | Base_dData_dResult.C_Base_dData_dResult_dResult_Err (dtb__140) -> (Base_dData_dResult.C_Base_dData_dResult_dResult_Err (dtb__140))
  | Base_dData_dResult.C_Base_dData_dResult_dResult_Ok (dtb__141) -> (Base_dData_dResult.C_Base_dData_dResult_dResult_Ok ({ Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltCtor = (alt).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltCtor; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBinders = (alt).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBinders; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBody = dtb__141 }))
  | _ -> failwith "DT: impossible branch"
)))
# 411 "Vuna/Compiler/Ir/Cps.vuna"
and v_Vuna_dCompiler_dIr_dCps_dselfAlts = (fun (fuel : int) (alts : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrAlt Base_dData_dList.t_Base_dData_dList_dList) (name : string) -> (if (fuel <= 0) then (Base_dData_dResult.C_Base_dData_dResult_dResult_Ok (alts)) else (match alts with
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
and v_Vuna_dCompiler_dIr_dCps_dselfBody = (fun (fuel : int) (body : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIr) (name : string) -> (if (fuel <= 0) then (Base_dData_dResult.C_Base_dData_dResult_dResult_Ok (body)) else ((fun nd_uscrut3 -> (match nd_uscrut3 with
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
let v_Vuna_dCompiler_dIr_dCps_dtransformDef = (fun (fuel : int) (d : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrDef) -> (if (fuel <= 0) then (Base_dData_dResult.C_Base_dData_dResult_dResult_Ok (d)) else (match d with
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
let rec v_Vuna_dCompiler_dIr_dCps_dtransformDefs = (fun (fuel : int) (xs : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrDef Base_dData_dList.t_Base_dData_dList_dList) -> (if (fuel <= 0) then (Base_dData_dResult.C_Base_dData_dResult_dResult_Ok (xs)) else (match xs with
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
let v_Vuna_dCompiler_dIr_dCps_dtransformGroup = (fun (fuel : int) (g : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrGroup) -> (if (fuel <= 0) then (Base_dData_dResult.C_Base_dData_dResult_dResult_Ok (g)) else (match ((v_Vuna_dCompiler_dIr_dCps_dtransformDefs (fuel - 1)) (g).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrGroup_irGroupDefs) with
  | Base_dData_dResult.C_Base_dData_dResult_dResult_Err (dtb__190) -> (Base_dData_dResult.C_Base_dData_dResult_dResult_Err (dtb__190))
  | Base_dData_dResult.C_Base_dData_dResult_dResult_Ok (dtb__191) -> (Base_dData_dResult.C_Base_dData_dResult_dResult_Ok ({ Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrGroup_irGroupIsRec = (g).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrGroup_irGroupIsRec; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrGroup_irGroupDefs = dtb__191 }))
  | _ -> failwith "DT: impossible branch"
)))

# 490 "Vuna/Compiler/Ir/Cps.vuna"
let rec v_Vuna_dCompiler_dIr_dCps_dtransformGroups = (fun (fuel : int) (xs : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrGroup Base_dData_dList.t_Base_dData_dList_dList) -> (if (fuel <= 0) then (Base_dData_dResult.C_Base_dData_dResult_dResult_Ok (xs)) else (match xs with
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
let v_Vuna_dCompiler_dIr_dCps_dselSym = (fun (s : string) -> (if (s = v_Vuna_dCompiler_dIr_dCps_dirCpsPerformName) then v_Vuna_dCompiler_dIr_dCps_dirSelPerformName else (if (s = v_Vuna_dCompiler_dIr_dCps_dirCpsHandleName) then v_Vuna_dCompiler_dIr_dCps_dirSelHandleName else (if (s = v_Vuna_dCompiler_dIr_dCps_dirCpsSelfName) then v_Vuna_dCompiler_dIr_dCps_dirSelSelfName else s))))

# 520 "Vuna/Compiler/Ir/Cps.vuna"
let rec v_Vuna_dCompiler_dIr_dCps_dselSyms = (fun (fuel : int) (e : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIr) -> (if (fuel <= 0) then e else (match e with
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
and v_Vuna_dCompiler_dIr_dCps_dselSList = (fun (fuel : int) (xs : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIr Base_dData_dList.t_Base_dData_dList_dList) -> (if (fuel <= 0) then xs else (match xs with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__246, dtb__247) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (((v_Vuna_dCompiler_dIr_dCps_dselSyms (fuel - 1)) dtb__246), ((v_Vuna_dCompiler_dIr_dCps_dselSList (fuel - 1)) dtb__247)))
  | _ -> failwith "DT: impossible branch"
)))
# 552 "Vuna/Compiler/Ir/Cps.vuna"
and v_Vuna_dCompiler_dIr_dCps_dselSFields = (fun (fuel : int) (fs : (string, Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIr) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) -> (if (fuel <= 0) then fs else (match fs with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__248, dtb__249) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Base_dData_dPair.v_Base_dData_dPair_dfirstOf dtb__248); Base_dData_dPair.f_Base_dData_dPair_dPair_second = ((v_Vuna_dCompiler_dIr_dCps_dselSyms (fuel - 1)) (Base_dData_dPair.v_Base_dData_dPair_dsecondOf dtb__248)) }, ((v_Vuna_dCompiler_dIr_dCps_dselSFields (fuel - 1)) dtb__249)))
  | _ -> failwith "DT: impossible branch"
)))
# 561 "Vuna/Compiler/Ir/Cps.vuna"
and v_Vuna_dCompiler_dIr_dCps_dselSymsAlt = (fun (fuel : int) (alts : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrAlt Base_dData_dList.t_Base_dData_dList_dList) -> (if (fuel <= 0) then alts else (match alts with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__250, dtb__251) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltCtor = (dtb__250).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltCtor; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBinders = (dtb__250).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBinders; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBody = ((v_Vuna_dCompiler_dIr_dCps_dselSyms (fuel - 1)) (dtb__250).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBody) }, ((v_Vuna_dCompiler_dIr_dCps_dselSymsAlt (fuel - 1)) dtb__251)))
  | _ -> failwith "DT: impossible branch"
)))
# 570 "Vuna/Compiler/Ir/Cps.vuna"
and v_Vuna_dCompiler_dIr_dCps_dselSymsAltM = (fun (fuel : int) (m : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrAlt Base_dData_dMaybe.t_Base_dData_dMaybe_dMaybe) -> (if (fuel <= 0) then m else (match m with
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
let rec v_Vuna_dCompiler_dIr_dCps_dselSelfBody = (fun (fuel : int) (body : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIr) -> (if (fuel <= 0) then (Base_dData_dResult.C_Base_dData_dResult_dResult_Ok (body)) else ((fun nd_uscrut2 -> (match nd_uscrut2 with
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
and v_Vuna_dCompiler_dIr_dCps_dselSelfAlts = (fun (fuel : int) (alts : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrAlt Base_dData_dList.t_Base_dData_dList_dList) -> (if (fuel <= 0) then (Base_dData_dResult.C_Base_dData_dResult_dResult_Ok (alts)) else (match alts with
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
let v_Vuna_dCompiler_dIr_dCps_dselDef = (fun (fuel : int) (d : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrDef) -> (if (fuel <= 0) then (Base_dData_dResult.C_Base_dData_dResult_dResult_Ok (d)) else (match d with
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
let rec v_Vuna_dCompiler_dIr_dCps_dselDefs = (fun (fuel : int) (defs : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrDef Base_dData_dList.t_Base_dData_dList_dList) -> (if (fuel <= 0) then (Base_dData_dResult.C_Base_dData_dResult_dResult_Ok (defs)) else (match defs with
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
let v_Vuna_dCompiler_dIr_dCps_dmIsOp = (fun (b : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrBinder) -> (match (b).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrBinder_irBinderName with
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
let v_Vuna_dCompiler_dIr_dCps_dmResumption = (fun (bs : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrBinder Base_dData_dList.t_Base_dData_dList_dList) -> (v_Vuna_dCompiler_dIr_dCps_dmResumeGo (v_Vuna_dCompiler_dIr_dCps_druntimeBinders bs)))

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
let v_Vuna_dCompiler_dIr_dCps_dmIsResumeApp = (fun (r : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrBinder) (e0 : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIr) -> ((v_Vuna_dCompiler_dIr_dCps_dmIsResumeAppGo r) (v_Vuna_dCompiler_dIr_dCps_dmStripErase e0)))

# 735 "Vuna/Compiler/Ir/Cps.vuna"
let v_Vuna_dCompiler_dIr_dCps_dmFreshV = (fun (n : int) -> (v_Vuna_dCompiler_dIr_dCps_dmkBinder ("__mchV" ^ (bi_strFromInt n))))

# 738 "Vuna/Compiler/Ir/Cps.vuna"
let v_Vuna_dCompiler_dIr_dCps_dmFreshK = (fun (n : int) -> (v_Vuna_dCompiler_dIr_dCps_dmkBinder ("__mchK" ^ (bi_strFromInt n))))

# 742 "Vuna/Compiler/Ir/Cps.vuna"
let v_Vuna_dCompiler_dIr_dCps_dmFreshTailK = (fun (n : int) -> (v_Vuna_dCompiler_dIr_dCps_dmkBinder ("__mchTK" ^ (bi_strFromInt n))))

# 745 "Vuna/Compiler/Ir/Cps.vuna"
let v_Vuna_dCompiler_dIr_dCps_dmFreshR = (fun (n : int) -> (v_Vuna_dCompiler_dIr_dCps_dmkBinder ("__mchR" ^ (bi_strFromInt n))))

# 750 "Vuna/Compiler/Ir/Cps.vuna"
let v_Vuna_dCompiler_dIr_dCps_disEffResultTy = (fun (mc0 : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrTy Base_dData_dMaybe.t_Base_dData_dMaybe_dMaybe) -> (match mc0 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__353) -> (match dtb__353 with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyData (dtb__354, dtb__355) -> (dtb__354 = Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirEffTypeName)
  | _ -> false
)
  | _ -> false
))

# 754 "Vuna/Compiler/Ir/Cps.vuna"
let v_Vuna_dCompiler_dIr_dCps_disEffContLambda = (fun (_uarity0 : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrTy Base_dData_dMaybe.t_Base_dData_dMaybe_dMaybe) -> (v_Vuna_dCompiler_dIr_dCps_disEffResultTy _uarity0))

# 758 "Vuna/Compiler/Ir/Cps.vuna"
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

# 764 "Vuna/Compiler/Ir/Cps.vuna"
let v_Vuna_dCompiler_dIr_dCps_dmRunEffTerm = (fun (eff : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIr) (k : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIr) -> ((fun th -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCase (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, eff, (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltCtor = (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirEffTypeName; Base_dData_dPair.f_Base_dData_dPair_dPair_second = Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirEffMkCtor })); Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBinders = (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (th, Base_dData_dList.C_Base_dData_dList_dList_Nil)); Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBody = (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRtApp (v_Vuna_dCompiler_dIr_dCps_dirMRunEffName, (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ((Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrVar (th)), (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (k, Base_dData_dList.C_Base_dData_dList_dList_Nil)))))) }, Base_dData_dList.C_Base_dData_dList_dList_Nil))))) (v_Vuna_dCompiler_dIr_dCps_dmkBinder "__mEffTh")))

# 774 "Vuna/Compiler/Ir/Cps.vuna"
let v_Vuna_dCompiler_dIr_dCps_dmNoResumption = (v_Vuna_dCompiler_dIr_dCps_dmkBinder "@vuna@noresume")

# 808 "Vuna/Compiler/Ir/Cps.vuna"
let v_Vuna_dCompiler_dIr_dCps_dmIsControl = (fun (mc0 : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIr) -> (match mc0 with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrNatCase (dtb__365, dtb__366, dtb__367, dtb__368, dtb__369) -> true
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrIf (dtb__370, dtb__371, dtb__372) -> true
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCase (dtb__373, dtb__374, dtb__375, dtb__376) -> true
  | _ -> false
))

# 854 "Vuna/Compiler/Ir/Cps.vuna"
let v_Vuna_dCompiler_dIr_dCps_disTailCont = (fun (e : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIr) -> (match e with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrVar (dtb__377) -> ((Base_dData_dString.v_Base_dData_dString_dstartsWith "__mchTK") (v_Vuna_dCompiler_dIr_dCps_dmBNameText (dtb__377).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrBinder_irBinderName))
  | _ -> false
))

# 779 "Vuna/Compiler/Ir/Cps.vuna"
let rec v_Vuna_dCompiler_dIr_dCps_dmEffContLambda = (fun (fuel : int) (r : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrBinder) (bs : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrBinder Base_dData_dList.t_Base_dData_dList_dList) (rt : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrTy Base_dData_dMaybe.t_Base_dData_dMaybe_dMaybe) (body : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIr) -> ((fun kd -> ((fun u -> ((fun v -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLam (bs, rt, (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCtor (Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirEffTypeName, Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirEffMkCtor, Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ((Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLam ((Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (u, (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (kd, Base_dData_dList.C_Base_dData_dList_dList_Nil)))), Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, ((((v_Vuna_dCompiler_dIr_dCps_dmCps (fuel - 1)) r) (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLam ((Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (v, Base_dData_dList.C_Base_dData_dList_dList_Nil)), Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, ((v_Vuna_dCompiler_dIr_dCps_dmRunEffTerm (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrVar (v))) (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrVar (kd)))))) body))), Base_dData_dList.C_Base_dData_dList_dList_Nil))))))) (v_Vuna_dCompiler_dIr_dCps_dmFreshV fuel))) (v_Vuna_dCompiler_dIr_dCps_dmkBinder "__mEffU"))) (v_Vuna_dCompiler_dIr_dCps_dmFreshK fuel)))
# 790 "Vuna/Compiler/Ir/Cps.vuna"
and v_Vuna_dCompiler_dIr_dCps_dmCpsAlts = (fun (fuel : int) (r : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrBinder) (k : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIr) (alts : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrAlt Base_dData_dList.t_Base_dData_dList_dList) -> (if (fuel <= 0) then alts else (match alts with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__378, dtb__379) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltCtor = (dtb__378).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltCtor; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBinders = (dtb__378).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBinders; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBody = ((((v_Vuna_dCompiler_dIr_dCps_dmCps (fuel - 1)) r) k) (dtb__378).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBody) }, ((((v_Vuna_dCompiler_dIr_dCps_dmCpsAlts (fuel - 1)) r) k) dtb__379)))
  | _ -> failwith "DT: impossible branch"
)))
# 799 "Vuna/Compiler/Ir/Cps.vuna"
and v_Vuna_dCompiler_dIr_dCps_dmCpsAltM = (fun (fuel : int) (r : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrBinder) (k : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIr) (m : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrAlt Base_dData_dMaybe.t_Base_dData_dMaybe_dMaybe) -> (if (fuel <= 0) then m else (match m with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__380) -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ({ Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltCtor = (dtb__380).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltCtor; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBinders = (dtb__380).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBinders; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBody = ((((v_Vuna_dCompiler_dIr_dCps_dmCps (fuel - 1)) r) k) (dtb__380).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBody) }))
  | _ -> failwith "DT: impossible branch"
)))
# 815 "Vuna/Compiler/Ir/Cps.vuna"
and v_Vuna_dCompiler_dIr_dCps_dmCpsArgs = (fun (fuel : int) (r : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrBinder) (k : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIr) (sym : string) (args : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIr Base_dData_dList.t_Base_dData_dList_dList) (acc : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIr Base_dData_dList.t_Base_dData_dList_dList) -> (if (fuel <= 0) then (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, k, (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRtApp (sym, (Base_dData_dList.v_Base_dData_dList_dreverse acc))))) else (match args with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, k, (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRtApp (sym, (Base_dData_dList.v_Base_dData_dList_dreverse acc)))))
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__381, dtb__382) -> ((fun v -> ((((v_Vuna_dCompiler_dIr_dCps_dmCps (fuel - 1)) r) (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLam ((Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (v, Base_dData_dList.C_Base_dData_dList_dList_Nil)), Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, ((((((v_Vuna_dCompiler_dIr_dCps_dmCpsArgs (fuel - 1)) r) k) sym) dtb__382) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ((Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrVar (v)), acc)))))) dtb__381)) (v_Vuna_dCompiler_dIr_dCps_dmFreshV fuel))
  | _ -> failwith "DT: impossible branch"
)))
# 828 "Vuna/Compiler/Ir/Cps.vuna"
and v_Vuna_dCompiler_dIr_dCps_dmCpsApply = (fun (fuel : int) (r : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrBinder) (k : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIr) (parts : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIr Base_dData_dList.t_Base_dData_dList_dList) -> (if (fuel <= 0) then (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, k, (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrGlobal ("?")))) else ((fun nd_uscrut4 -> (match nd_uscrut4 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__383, dtb__384) -> (match dtb__384 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> ((((v_Vuna_dCompiler_dIr_dCps_dmCps (fuel - 1)) r) k) dtb__383)
  | _ -> ((fun v -> ((((v_Vuna_dCompiler_dIr_dCps_dmCps (fuel - 1)) r) (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLam ((Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (v, Base_dData_dList.C_Base_dData_dList_dList_Nil)), Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, ((((((v_Vuna_dCompiler_dIr_dCps_dmCpsApplyArgs (fuel - 1)) r) k) dtb__384) Base_dData_dList.C_Base_dData_dList_dList_Nil) v)))) dtb__383)) (v_Vuna_dCompiler_dIr_dCps_dmFreshV fuel))
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, k, (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrGlobal ("?"))))
  | _ -> failwith "DT: impossible branch"
)) parts)))
# 841 "Vuna/Compiler/Ir/Cps.vuna"
and v_Vuna_dCompiler_dIr_dCps_dmCpsApplyArgs = (fun (fuel : int) (r : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrBinder) (k : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIr) (args : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIr Base_dData_dList.t_Base_dData_dList_dList) (acc : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIr Base_dData_dList.t_Base_dData_dList_dList) (headV : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrBinder) -> (if (fuel <= 0) then (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, k, (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrGlobal ("?")))) else (match args with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, k, ((v_Vuna_dCompiler_dIr_dCps_dapplyAll (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrVar (headV))) (Base_dData_dList.v_Base_dData_dList_dreverse acc))))
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__385, dtb__386) -> ((fun v -> ((((v_Vuna_dCompiler_dIr_dCps_dmCps (fuel - 1)) r) (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLam ((Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (v, Base_dData_dList.C_Base_dData_dList_dList_Nil)), Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, ((((((v_Vuna_dCompiler_dIr_dCps_dmCpsApplyArgs (fuel - 1)) r) k) dtb__386) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ((Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrVar (v)), acc))) headV)))) dtb__385)) (v_Vuna_dCompiler_dIr_dCps_dmFreshV fuel))
  | _ -> failwith "DT: impossible branch"
)))
# 860 "Vuna/Compiler/Ir/Cps.vuna"
and v_Vuna_dCompiler_dIr_dCps_dmCps = (fun (fuel : int) (r : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrBinder) (k : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIr) (e : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIr) -> (if (fuel <= 0) then (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, k, e)) else (if ((v_Vuna_dCompiler_dIr_dCps_dmIsResumeApp r) e) then (if (v_Vuna_dCompiler_dIr_dCps_disTailCont k) then (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, e, (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCtor ("Base.Effect.Core.Rest", "Base.Effect.Core.Rest.MkRestTail", Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, Base_dData_dList.C_Base_dData_dList_dList_Nil)))) else (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, e, (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCtor ("Base.Effect.Core.Rest", "Base.Effect.Core.Rest.MkRestCont", Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (k, Base_dData_dList.C_Base_dData_dList_dList_Nil))))))) else (match e with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLet (dtb__387, dtb__388, dtb__389) -> ((fun v -> ((fun cont -> ((((v_Vuna_dCompiler_dIr_dCps_dmCps (fuel - 1)) r) cont) dtb__388)) (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLam ((Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (v, Base_dData_dList.C_Base_dData_dList_dList_Nil)), Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLet (dtb__387, (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrVar (v)), ((((v_Vuna_dCompiler_dIr_dCps_dmCps (fuel - 1)) r) k) dtb__389))))))) (v_Vuna_dCompiler_dIr_dCps_dmFreshV fuel))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCase (dtb__390, dtb__391, dtb__392, dtb__393) -> ((fun v -> ((fun cont -> ((((v_Vuna_dCompiler_dIr_dCps_dmCps (fuel - 1)) r) cont) dtb__392)) (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLam ((Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (v, Base_dData_dList.C_Base_dData_dList_dList_Nil)), Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCase (dtb__390, Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrVar (v)), ((((v_Vuna_dCompiler_dIr_dCps_dmCpsAlts (fuel - 2)) r) k) dtb__393))))))) (v_Vuna_dCompiler_dIr_dCps_dmFreshV fuel))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrIf (dtb__394, dtb__395, dtb__396) -> ((fun v -> ((fun cont -> ((((v_Vuna_dCompiler_dIr_dCps_dmCps (fuel - 1)) r) cont) dtb__394)) (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLam ((Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (v, Base_dData_dList.C_Base_dData_dList_dList_Nil)), Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrIf ((Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrVar (v)), ((((v_Vuna_dCompiler_dIr_dCps_dmCps (fuel - 2)) r) k) dtb__395), ((((v_Vuna_dCompiler_dIr_dCps_dmCps (fuel - 2)) r) k) dtb__396))))))) (v_Vuna_dCompiler_dIr_dCps_dmFreshV fuel))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrNatCase (dtb__397, dtb__398, dtb__399, dtb__400, dtb__401) -> ((fun v -> ((fun cont -> ((((v_Vuna_dCompiler_dIr_dCps_dmCps (fuel - 1)) r) cont) dtb__397)) (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLam ((Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (v, Base_dData_dList.C_Base_dData_dList_dList_Nil)), Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrNatCase ((Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrVar (v)), dtb__398, ((((v_Vuna_dCompiler_dIr_dCps_dmCpsAltM (fuel - 2)) r) k) dtb__399), ((((v_Vuna_dCompiler_dIr_dCps_dmCpsAltM (fuel - 2)) r) k) dtb__400), ((((v_Vuna_dCompiler_dIr_dCps_dmCpsAltM (fuel - 2)) r) k) dtb__401))))))) (v_Vuna_dCompiler_dIr_dCps_dmFreshV fuel))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCast (dtb__402, dtb__403, dtb__404) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCast (dtb__402, dtb__403, ((((v_Vuna_dCompiler_dIr_dCps_dmCps (fuel - 1)) r) k) dtb__404)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRtApp (dtb__405, dtb__406) -> ((((((v_Vuna_dCompiler_dIr_dCps_dmCpsArgs (fuel - 1)) r) k) dtb__405) dtb__406) Base_dData_dList.C_Base_dData_dList_dList_Nil)
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLam (dtb__407, dtb__408, dtb__409) -> (if (v_Vuna_dCompiler_dIr_dCps_disEffContLambda dtb__408) then (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, k, (((((v_Vuna_dCompiler_dIr_dCps_dmEffContLambda (fuel - 1)) r) dtb__407) dtb__408) dtb__409))) else (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, k, e)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (dtb__410, dtb__411, dtb__412) -> ((fun p -> ((((v_Vuna_dCompiler_dIr_dCps_dmCpsApply (fuel - 1)) r) k) ((Base_dData_dList.v_Base_dData_dList_dappend (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ((Base_dData_dPair.v_Base_dData_dPair_dfirstOf p), Base_dData_dList.C_Base_dData_dList_dList_Nil))) (Base_dData_dPair.v_Base_dData_dPair_dsecondOf p)))) (v_Vuna_dCompiler_dIr_dCps_dflattenApp e))
  | _ -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, k, e))
))))

# 968 "Vuna/Compiler/Ir/Cps.vuna"
let v_Vuna_dCompiler_dIr_dCps_dmSym = (fun (x : string) -> (if (x = v_Vuna_dCompiler_dIr_dCps_dirCpsPerformName) then v_Vuna_dCompiler_dIr_dCps_dirMPerformName else (if (x = v_Vuna_dCompiler_dIr_dCps_dirCpsHandleName) then v_Vuna_dCompiler_dIr_dCps_dirMHandleName else (if (x = v_Vuna_dCompiler_dIr_dCps_dirCpsSelfName) then v_Vuna_dCompiler_dIr_dCps_dirMSelfName else x))))

# 974 "Vuna/Compiler/Ir/Cps.vuna"
let rec v_Vuna_dCompiler_dIr_dCps_dmSyms = (fun (fuel : int) (e : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIr) -> (if (fuel <= 0) then e else (match e with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRt (dtb__413) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRt ((v_Vuna_dCompiler_dIr_dCps_dmSym dtb__413)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRtApp (dtb__414, dtb__415) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRtApp ((v_Vuna_dCompiler_dIr_dCps_dmSym dtb__414), ((v_Vuna_dCompiler_dIr_dCps_dmListS (fuel - 1)) dtb__415)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCtor (dtb__416, dtb__417, dtb__418, dtb__419) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCtor (dtb__416, dtb__417, Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, ((v_Vuna_dCompiler_dIr_dCps_dmListS (fuel - 1)) dtb__419)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRecord (dtb__420, dtb__421, dtb__422) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRecord (dtb__420, Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, ((v_Vuna_dCompiler_dIr_dCps_dmFieldsS (fuel - 1)) dtb__422)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrProj (dtb__423, dtb__424, dtb__425, dtb__426) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrProj (((v_Vuna_dCompiler_dIr_dCps_dmSyms (fuel - 1)) dtb__423), dtb__424, dtb__425, Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRecUpd (dtb__427, dtb__428, dtb__429, dtb__430) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRecUpd (((v_Vuna_dCompiler_dIr_dCps_dmSyms (fuel - 1)) dtb__427), dtb__428, ((v_Vuna_dCompiler_dIr_dCps_dmFieldsS (fuel - 1)) dtb__429), Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCast (dtb__431, dtb__432, dtb__433) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCast (dtb__431, dtb__432, ((v_Vuna_dCompiler_dIr_dCps_dmSyms (fuel - 1)) dtb__433)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLet (dtb__434, dtb__435, dtb__436) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLet (dtb__434, ((v_Vuna_dCompiler_dIr_dCps_dmSyms (fuel - 1)) dtb__435), ((v_Vuna_dCompiler_dIr_dCps_dmSyms (fuel - 1)) dtb__436)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLam (dtb__437, dtb__438, dtb__439) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLam (dtb__437, dtb__438, ((v_Vuna_dCompiler_dIr_dCps_dmSyms (fuel - 1)) dtb__439)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (dtb__440, dtb__441, dtb__442) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, ((v_Vuna_dCompiler_dIr_dCps_dmSyms (fuel - 1)) dtb__441), ((v_Vuna_dCompiler_dIr_dCps_dmSyms (fuel - 1)) dtb__442)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrIf (dtb__443, dtb__444, dtb__445) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrIf (((v_Vuna_dCompiler_dIr_dCps_dmSyms (fuel - 1)) dtb__443), ((v_Vuna_dCompiler_dIr_dCps_dmSyms (fuel - 1)) dtb__444), ((v_Vuna_dCompiler_dIr_dCps_dmSyms (fuel - 1)) dtb__445)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCase (dtb__446, dtb__447, dtb__448, dtb__449) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCase (dtb__446, Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, ((v_Vuna_dCompiler_dIr_dCps_dmSyms (fuel - 1)) dtb__448), ((v_Vuna_dCompiler_dIr_dCps_dmSymsAltsM (fuel - 1)) dtb__449)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrNatCase (dtb__450, dtb__451, dtb__452, dtb__453, dtb__454) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrNatCase (((v_Vuna_dCompiler_dIr_dCps_dmSyms (fuel - 1)) dtb__450), dtb__451, ((v_Vuna_dCompiler_dIr_dCps_dmSymsAltMM (fuel - 1)) dtb__452), ((v_Vuna_dCompiler_dIr_dCps_dmSymsAltMM (fuel - 1)) dtb__453), ((v_Vuna_dCompiler_dIr_dCps_dmSymsAltMM (fuel - 1)) dtb__454)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrConcatMany (dtb__455) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrConcatMany (((v_Vuna_dCompiler_dIr_dCps_dmListS (fuel - 1)) dtb__455)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrEffThunk (dtb__456, dtb__457, dtb__458, dtb__459, dtb__460) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrEffThunk (dtb__456, dtb__457, dtb__458, dtb__459, ((v_Vuna_dCompiler_dIr_dCps_dmSyms (fuel - 1)) dtb__460)))
  | _ -> e
)))
# 997 "Vuna/Compiler/Ir/Cps.vuna"
and v_Vuna_dCompiler_dIr_dCps_dmListS = (fun (fuel : int) (xs : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIr Base_dData_dList.t_Base_dData_dList_dList) -> (if (fuel <= 0) then xs else (match xs with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__461, dtb__462) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (((v_Vuna_dCompiler_dIr_dCps_dmSyms (fuel - 1)) dtb__461), ((v_Vuna_dCompiler_dIr_dCps_dmListS (fuel - 1)) dtb__462)))
  | _ -> failwith "DT: impossible branch"
)))
# 1006 "Vuna/Compiler/Ir/Cps.vuna"
and v_Vuna_dCompiler_dIr_dCps_dmFieldsS = (fun (fuel : int) (fs : (string, Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIr) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) -> (if (fuel <= 0) then fs else (match fs with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__463, dtb__464) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Base_dData_dPair.v_Base_dData_dPair_dfirstOf dtb__463); Base_dData_dPair.f_Base_dData_dPair_dPair_second = ((v_Vuna_dCompiler_dIr_dCps_dmSyms (fuel - 1)) (Base_dData_dPair.v_Base_dData_dPair_dsecondOf dtb__463)) }, ((v_Vuna_dCompiler_dIr_dCps_dmFieldsS (fuel - 1)) dtb__464)))
  | _ -> failwith "DT: impossible branch"
)))
# 1015 "Vuna/Compiler/Ir/Cps.vuna"
and v_Vuna_dCompiler_dIr_dCps_dmSymsAltsM = (fun (fuel : int) (alts : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrAlt Base_dData_dList.t_Base_dData_dList_dList) -> (if (fuel <= 0) then alts else (match alts with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__465, dtb__466) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltCtor = (dtb__465).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltCtor; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBinders = (dtb__465).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBinders; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBody = ((v_Vuna_dCompiler_dIr_dCps_dmSyms (fuel - 1)) (dtb__465).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBody) }, ((v_Vuna_dCompiler_dIr_dCps_dmSymsAltsM (fuel - 1)) dtb__466)))
  | _ -> failwith "DT: impossible branch"
)))
# 1024 "Vuna/Compiler/Ir/Cps.vuna"
and v_Vuna_dCompiler_dIr_dCps_dmSymsAltMM = (fun (fuel : int) (m : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrAlt Base_dData_dMaybe.t_Base_dData_dMaybe_dMaybe) -> (if (fuel <= 0) then m else (match m with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__467) -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ({ Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltCtor = (dtb__467).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltCtor; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBinders = (dtb__467).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBinders; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBody = ((v_Vuna_dCompiler_dIr_dCps_dmSyms (fuel - 1)) (dtb__467).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBody) }))
  | _ -> failwith "DT: impossible branch"
)))

# 1033 "Vuna/Compiler/Ir/Cps.vuna"
let v_Vuna_dCompiler_dIr_dCps_dmDoneCont = ((fun v -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLam ((Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (v, Base_dData_dList.C_Base_dData_dList_dList_Nil)), Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRt (v_Vuna_dCompiler_dIr_dCps_dirMDoneName)), (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrVar (v))))))) (v_Vuna_dCompiler_dIr_dCps_dmkBinder "__mDoneV"))

# 1039 "Vuna/Compiler/Ir/Cps.vuna"
let rec v_Vuna_dCompiler_dIr_dCps_dmTrampolineBody = (fun (mc0 : string) (mc1 : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIr) -> (match mc1 with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (dtb__468, dtb__469, dtb__470) -> (match dtb__469 with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (dtb__471, dtb__472, dtb__473) -> (match dtb__472 with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (dtb__474, dtb__475, dtb__476) -> (match dtb__475 with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrGlobal (dtb__477) -> (if (dtb__477 = v_Vuna_dCompiler_dIr_dCps_drunThunkName) then (Base_dData_dResult.C_Base_dData_dResult_dResult_Ok ((Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRt (v_Vuna_dCompiler_dIr_dCps_dirMRunName)), ((v_Vuna_dCompiler_dIr_dCps_dapplyAll (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrGlobal (dtb__477))) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__476, (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__473, (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (v_Vuna_dCompiler_dIr_dCps_dmDoneCont, Base_dData_dList.C_Base_dData_dList_dList_Nil))))))))))) else (Base_dData_dResult.C_Base_dData_dResult_dResult_Err (("machine CPS: unexpected trampoline shape: " ^ mc0))))
  | _ -> (Base_dData_dResult.C_Base_dData_dResult_dResult_Err (("machine CPS: unexpected trampoline shape: " ^ mc0)))
)
  | _ -> (Base_dData_dResult.C_Base_dData_dResult_dResult_Err (("machine CPS: unexpected trampoline shape: " ^ mc0)))
)
  | _ -> (Base_dData_dResult.C_Base_dData_dResult_dResult_Err (("machine CPS: unexpected trampoline shape: " ^ mc0)))
)
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCast (dtb__478, dtb__479, dtb__480) -> (match ((v_Vuna_dCompiler_dIr_dCps_dmTrampolineBody mc0) dtb__480) with
  | Base_dData_dResult.C_Base_dData_dResult_dResult_Err (dtb__481) -> (Base_dData_dResult.C_Base_dData_dResult_dResult_Err (dtb__481))
  | Base_dData_dResult.C_Base_dData_dResult_dResult_Ok (dtb__482) -> (Base_dData_dResult.C_Base_dData_dResult_dResult_Ok ((Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCast (dtb__478, dtb__479, dtb__482))))
  | _ -> failwith "DT: impossible branch"
)
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLam (dtb__483, dtb__484, dtb__485) -> (match ((v_Vuna_dCompiler_dIr_dCps_dmTrampolineBody mc0) dtb__485) with
  | Base_dData_dResult.C_Base_dData_dResult_dResult_Err (dtb__486) -> (Base_dData_dResult.C_Base_dData_dResult_dResult_Err (dtb__486))
  | Base_dData_dResult.C_Base_dData_dResult_dResult_Ok (dtb__487) -> (Base_dData_dResult.C_Base_dData_dResult_dResult_Ok ((Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLam (dtb__483, dtb__484, dtb__487))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> (Base_dData_dResult.C_Base_dData_dResult_dResult_Err (("machine CPS: unexpected trampoline shape: " ^ mc0)))
))

# 1061 "Vuna/Compiler/Ir/Cps.vuna"
let v_Vuna_dCompiler_dIr_dCps_dmBodyOf = (fun (d : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrDef) -> (match (Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirDefBody d) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__488) -> dtb__488
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrInt (0))
  | _ -> failwith "DT: impossible branch"
))

# 1071 "Vuna/Compiler/Ir/Cps.vuna"
let rec v_Vuna_dCompiler_dIr_dCps_ddefArities = (fun (fuel : int) (ds : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrDef Base_dData_dList.t_Base_dData_dList_dList) -> (if (fuel <= 0) then Base_dData_dList.C_Base_dData_dList_dList_Nil else (match ds with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__489, dtb__490) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirDefName dtb__489); Base_dData_dPair.f_Base_dData_dPair_dPair_second = (Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirDefArity dtb__489) }, ((v_Vuna_dCompiler_dIr_dCps_ddefArities (fuel - 1)) dtb__490)))
  | _ -> failwith "DT: impossible branch"
)))

# 1080 "Vuna/Compiler/Ir/Cps.vuna"
let rec v_Vuna_dCompiler_dIr_dCps_ddefSigs = (fun (fuel : int) (ds : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrDef Base_dData_dList.t_Base_dData_dList_dList) -> (if (fuel <= 0) then Base_dData_dList.C_Base_dData_dList_dList_Nil else (match ds with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__491, dtb__492) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirDefName dtb__491); Base_dData_dPair.f_Base_dData_dPair_dPair_second = (Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirDefTy dtb__491) }, ((v_Vuna_dCompiler_dIr_dCps_ddefSigs (fuel - 1)) dtb__492)))
  | _ -> failwith "DT: impossible branch"
)))

# 1089 "Vuna/Compiler/Ir/Cps.vuna"
let v_Vuna_dCompiler_dIr_dCps_dhandlerTables = (fun (fuel : int) (ds : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrDef Base_dData_dList.t_Base_dData_dList_dList) -> { f_Vuna_dCompiler_dIr_dCps_dHandlerTables_htArities = ((v_Vuna_dCompiler_dIr_dCps_ddefArities fuel) ds); f_Vuna_dCompiler_dIr_dCps_dHandlerTables_htSigs = ((v_Vuna_dCompiler_dIr_dCps_ddefSigs fuel) ds) })

# 1092 "Vuna/Compiler/Ir/Cps.vuna"
let rec v_Vuna_dCompiler_dIr_dCps_darityOf = (fun (mc0 : (string, int) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (mc1 : string) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__493, dtb__494) -> (if ((Base_dData_dPair.v_Base_dData_dPair_dfirstOf dtb__493) = mc1) then (Base_dData_dPair.v_Base_dData_dPair_dsecondOf dtb__493) else ((v_Vuna_dCompiler_dIr_dCps_darityOf dtb__494) mc1))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))

# 1096 "Vuna/Compiler/Ir/Cps.vuna"
let rec v_Vuna_dCompiler_dIr_dCps_dsigOf = (fun (mc0 : (string, Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrTy Base_dData_dMaybe.t_Base_dData_dMaybe_dMaybe) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (mc1 : string) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__495, dtb__496) -> (if ((Base_dData_dPair.v_Base_dData_dPair_dfirstOf dtb__495) = mc1) then (Base_dData_dPair.v_Base_dData_dPair_dsecondOf dtb__495) else ((v_Vuna_dCompiler_dIr_dCps_dsigOf dtb__496) mc1))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 1100 "Vuna/Compiler/Ir/Cps.vuna"
let rec v_Vuna_dCompiler_dIr_dCps_dfunArity = (fun (mc0 : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrTy) -> (match mc0 with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyFun (dtb__497, dtb__498) -> (1 + (v_Vuna_dCompiler_dIr_dCps_dfunArity dtb__498))
  | _ -> 0
))

# 1104 "Vuna/Compiler/Ir/Cps.vuna"
let rec v_Vuna_dCompiler_dIr_dCps_dfunResult = (fun (mc0 : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrTy) -> (match mc0 with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyFun (dtb__499, dtb__500) -> (v_Vuna_dCompiler_dIr_dCps_dfunResult dtb__500)
  | _ -> mc0
))

# 1108 "Vuna/Compiler/Ir/Cps.vuna"
let v_Vuna_dCompiler_dIr_dCps_disFunTy = (fun (mc0 : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrTy) -> (match mc0 with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyFun (dtb__501, dtb__502) -> true
  | _ -> false
))

# 1115 "Vuna/Compiler/Ir/Cps.vuna"
let v_Vuna_dCompiler_dIr_dCps_disClauseTy = (fun (mc0 : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrTy) -> (match mc0 with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyFun (dtb__503, dtb__504) -> (match dtb__504 with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyFun (dtb__505, dtb__506) -> (v_Vuna_dCompiler_dIr_dCps_disFunTy dtb__505)
  | _ -> false
)
  | _ -> false
))

# 1124 "Vuna/Compiler/Ir/Cps.vuna"
let rec v_Vuna_dCompiler_dIr_dCps_dhasClauseParam = (fun (mc0 : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrTy) -> (match mc0 with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyFun (dtb__507, dtb__508) -> (if (v_Vuna_dCompiler_dIr_dCps_disClauseTy dtb__507) then true else (v_Vuna_dCompiler_dIr_dCps_dhasClauseParam dtb__508))
  | _ -> false
))

# 1120 "Vuna/Compiler/Ir/Cps.vuna"
let v_Vuna_dCompiler_dIr_dCps_disHandlerCombinatorTy = (fun (ty : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrTy) -> (if (if ((v_Vuna_dCompiler_dIr_dCps_dfunArity ty) >= 2) then (v_Vuna_dCompiler_dIr_dCps_disEffResultTy (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ((v_Vuna_dCompiler_dIr_dCps_dfunResult ty)))) else false) then (v_Vuna_dCompiler_dIr_dCps_dhasClauseParam ty) else false))

# 1128 "Vuna/Compiler/Ir/Cps.vuna"
let v_Vuna_dCompiler_dIr_dCps_disHandleCombinator = (fun (t : t_Vuna_dCompiler_dIr_dCps_dHandlerTables) (n : string) -> (match ((v_Vuna_dCompiler_dIr_dCps_dsigOf (t).f_Vuna_dCompiler_dIr_dCps_dHandlerTables_htSigs) n) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__509) -> (if ((v_Vuna_dCompiler_dIr_dCps_dfunArity dtb__509) = 0) then (if ((Base_dData_dString.v_Base_dData_dString_dstartsWith "Base.Effect.") n) then ((Base_dData_dString.v_Base_dData_dString_dcontains "handle") n) else false) else (v_Vuna_dCompiler_dIr_dCps_disHandlerCombinatorTy dtb__509))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (if ((Base_dData_dString.v_Base_dData_dString_dstartsWith "Base.Effect.") n) then ((Base_dData_dString.v_Base_dData_dString_dcontains "handle") n) else false)
  | _ -> failwith "DT: impossible branch"
))

# 1138 "Vuna/Compiler/Ir/Cps.vuna"
let v_Vuna_dCompiler_dIr_dCps_dclauseArityOf = (fun (t : t_Vuna_dCompiler_dIr_dCps_dHandlerTables) (n : string) -> (match ((v_Vuna_dCompiler_dIr_dCps_dsigOf (t).f_Vuna_dCompiler_dIr_dCps_dHandlerTables_htSigs) n) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__510) -> (if ((v_Vuna_dCompiler_dIr_dCps_dfunArity dtb__510) > 0) then (v_Vuna_dCompiler_dIr_dCps_dfunArity dtb__510) else ((v_Vuna_dCompiler_dIr_dCps_darityOf (t).f_Vuna_dCompiler_dIr_dCps_dHandlerTables_htArities) n))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> ((v_Vuna_dCompiler_dIr_dCps_darityOf (t).f_Vuna_dCompiler_dIr_dCps_dHandlerTables_htArities) n)
  | _ -> failwith "DT: impossible branch"
))

# 1144 "Vuna/Compiler/Ir/Cps.vuna"
let v_Vuna_dCompiler_dIr_dCps_disClauseGlobal = (fun (t : t_Vuna_dCompiler_dIr_dCps_dHandlerTables) (n : string) -> (match ((v_Vuna_dCompiler_dIr_dCps_dsigOf (t).f_Vuna_dCompiler_dIr_dCps_dHandlerTables_htSigs) n) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__511) -> (if ((v_Vuna_dCompiler_dIr_dCps_dfunArity dtb__511) > 0) then (v_Vuna_dCompiler_dIr_dCps_disClauseTy dtb__511) else (((v_Vuna_dCompiler_dIr_dCps_darityOf (t).f_Vuna_dCompiler_dIr_dCps_dHandlerTables_htArities) n) >= 2))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (((v_Vuna_dCompiler_dIr_dCps_darityOf (t).f_Vuna_dCompiler_dIr_dCps_dHandlerTables_htArities) n) >= 2)
  | _ -> failwith "DT: impossible branch"
))

# 1167 "Vuna/Compiler/Ir/Cps.vuna"
let rec v_Vuna_dCompiler_dIr_dCps_dlenOf = (fun xs -> (match xs with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> 0
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__512, dtb__513) -> (1 + (v_Vuna_dCompiler_dIr_dCps_dlenOf dtb__513))
  | _ -> failwith "DT: impossible branch"
))

# 1173 "Vuna/Compiler/Ir/Cps.vuna"
let v_Vuna_dCompiler_dIr_dCps_dfuelOf = (fun (_u : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIr Base_dData_dList.t_Base_dData_dList_dList) -> 1)

# 1150 "Vuna/Compiler/Ir/Cps.vuna"
let rec v_Vuna_dCompiler_dIr_dCps_dclauseGlobals = (fun (t : t_Vuna_dCompiler_dIr_dCps_dHandlerTables) (args : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIr Base_dData_dList.t_Base_dData_dList_dList) -> (if ((v_Vuna_dCompiler_dIr_dCps_dfuelOf args) <= 0) then Base_dData_dList.C_Base_dData_dList_dList_Nil else (match args with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__514, dtb__515) -> (match dtb__514 with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrGlobal (dtb__516) -> (if (if ((v_Vuna_dCompiler_dIr_dCps_disClauseGlobal t) dtb__516) then (((v_Vuna_dCompiler_dIr_dCps_dclauseArityOf t) dtb__516) >= 2) else false) then (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__516, ((v_Vuna_dCompiler_dIr_dCps_dclauseGlobals t) dtb__515))) else ((v_Vuna_dCompiler_dIr_dCps_dclauseGlobals t) dtb__515))
  | _ -> ((fun nd_uscrut5 -> (match nd_uscrut5 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__517; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__518 } -> (match dtb__517 with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrGlobal (dtb__519) -> (if (if ((v_Vuna_dCompiler_dIr_dCps_disClauseGlobal t) dtb__519) then ((((v_Vuna_dCompiler_dIr_dCps_dclauseArityOf t) dtb__519) - (v_Vuna_dCompiler_dIr_dCps_dlenOf dtb__518)) >= 2) else false) then (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__519, ((v_Vuna_dCompiler_dIr_dCps_dclauseGlobals t) dtb__515))) else ((v_Vuna_dCompiler_dIr_dCps_dclauseGlobals t) dtb__515))
  | _ -> ((v_Vuna_dCompiler_dIr_dCps_dclauseGlobals t) dtb__515)
)
  | _ -> failwith "DT: impossible branch"
)) (v_Vuna_dCompiler_dIr_dCps_dflattenApp dtb__514))
)
  | _ -> failwith "DT: impossible branch"
)))

# 1176 "Vuna/Compiler/Ir/Cps.vuna"
let rec v_Vuna_dCompiler_dIr_dCps_dcollectHandlerGlobals = (fun (t : t_Vuna_dCompiler_dIr_dCps_dHandlerTables) (fuel : int) (e : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIr) -> (if (fuel <= 0) then Base_dData_dList.C_Base_dData_dList_dList_Nil else (match e with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (dtb__520, dtb__521, dtb__522) -> ((fun p -> ((fun head -> ((fun args -> ((fun here -> ((Base_dData_dList.v_Base_dData_dList_dappend here) ((Base_dData_dList.v_Base_dData_dList_dappend (((v_Vuna_dCompiler_dIr_dCps_dcollectHandlerGlobals t) (fuel - 1)) head)) (((v_Vuna_dCompiler_dIr_dCps_dcollectHandlerGlobalsList t) (fuel - 1)) args)))) (match head with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrGlobal (dtb__523) -> (if ((v_Vuna_dCompiler_dIr_dCps_disHandleCombinator t) dtb__523) then ((v_Vuna_dCompiler_dIr_dCps_dclauseGlobals t) args) else Base_dData_dList.C_Base_dData_dList_dList_Nil)
  | _ -> Base_dData_dList.C_Base_dData_dList_dList_Nil
))) (Base_dData_dPair.v_Base_dData_dPair_dsecondOf p))) (Base_dData_dPair.v_Base_dData_dPair_dfirstOf p))) (v_Vuna_dCompiler_dIr_dCps_dflattenApp e))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCtor (dtb__524, dtb__525, dtb__526, dtb__527) -> (((v_Vuna_dCompiler_dIr_dCps_dcollectHandlerGlobalsList t) (fuel - 1)) dtb__527)
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRecord (dtb__528, dtb__529, dtb__530) -> (((v_Vuna_dCompiler_dIr_dCps_dcollectHandlerGlobalsFields t) (fuel - 1)) dtb__530)
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrProj (dtb__531, dtb__532, dtb__533, dtb__534) -> (((v_Vuna_dCompiler_dIr_dCps_dcollectHandlerGlobals t) (fuel - 1)) dtb__531)
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRecUpd (dtb__535, dtb__536, dtb__537, dtb__538) -> ((Base_dData_dList.v_Base_dData_dList_dappend (((v_Vuna_dCompiler_dIr_dCps_dcollectHandlerGlobals t) (fuel - 1)) dtb__535)) (((v_Vuna_dCompiler_dIr_dCps_dcollectHandlerGlobalsFields t) (fuel - 1)) dtb__537))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRtApp (dtb__539, dtb__540) -> (((v_Vuna_dCompiler_dIr_dCps_dcollectHandlerGlobalsList t) (fuel - 1)) dtb__540)
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCast (dtb__541, dtb__542, dtb__543) -> (((v_Vuna_dCompiler_dIr_dCps_dcollectHandlerGlobals t) (fuel - 1)) dtb__543)
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLet (dtb__544, dtb__545, dtb__546) -> ((Base_dData_dList.v_Base_dData_dList_dappend (((v_Vuna_dCompiler_dIr_dCps_dcollectHandlerGlobals t) (fuel - 1)) dtb__545)) (((v_Vuna_dCompiler_dIr_dCps_dcollectHandlerGlobals t) (fuel - 1)) dtb__546))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLam (dtb__547, dtb__548, dtb__549) -> (((v_Vuna_dCompiler_dIr_dCps_dcollectHandlerGlobals t) (fuel - 1)) dtb__549)
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrIf (dtb__550, dtb__551, dtb__552) -> ((Base_dData_dList.v_Base_dData_dList_dappend (((v_Vuna_dCompiler_dIr_dCps_dcollectHandlerGlobals t) (fuel - 1)) dtb__550)) ((Base_dData_dList.v_Base_dData_dList_dappend (((v_Vuna_dCompiler_dIr_dCps_dcollectHandlerGlobals t) (fuel - 1)) dtb__551)) (((v_Vuna_dCompiler_dIr_dCps_dcollectHandlerGlobals t) (fuel - 1)) dtb__552)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCase (dtb__553, dtb__554, dtb__555, dtb__556) -> ((Base_dData_dList.v_Base_dData_dList_dappend (((v_Vuna_dCompiler_dIr_dCps_dcollectHandlerGlobals t) (fuel - 1)) dtb__555)) (((v_Vuna_dCompiler_dIr_dCps_dcollectHandlerGlobalsAlts t) (fuel - 1)) dtb__556))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrNatCase (dtb__557, dtb__558, dtb__559, dtb__560, dtb__561) -> ((Base_dData_dList.v_Base_dData_dList_dappend (((v_Vuna_dCompiler_dIr_dCps_dcollectHandlerGlobals t) (fuel - 1)) dtb__557)) ((Base_dData_dList.v_Base_dData_dList_dappend (((v_Vuna_dCompiler_dIr_dCps_dcollectHandlerGlobalsAltM t) (fuel - 1)) dtb__559)) ((Base_dData_dList.v_Base_dData_dList_dappend (((v_Vuna_dCompiler_dIr_dCps_dcollectHandlerGlobalsAltM t) (fuel - 1)) dtb__560)) (((v_Vuna_dCompiler_dIr_dCps_dcollectHandlerGlobalsAltM t) (fuel - 1)) dtb__561))))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrConcatMany (dtb__562) -> (((v_Vuna_dCompiler_dIr_dCps_dcollectHandlerGlobalsList t) (fuel - 1)) dtb__562)
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrEffThunk (dtb__563, dtb__564, dtb__565, dtb__566, dtb__567) -> (((v_Vuna_dCompiler_dIr_dCps_dcollectHandlerGlobals t) (fuel - 1)) dtb__567)
  | _ -> Base_dData_dList.C_Base_dData_dList_dList_Nil
)))
# 1207 "Vuna/Compiler/Ir/Cps.vuna"
and v_Vuna_dCompiler_dIr_dCps_dcollectHandlerGlobalsList = (fun (t : t_Vuna_dCompiler_dIr_dCps_dHandlerTables) (fuel : int) (xs : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIr Base_dData_dList.t_Base_dData_dList_dList) -> (if (fuel <= 0) then Base_dData_dList.C_Base_dData_dList_dList_Nil else (match xs with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__568, dtb__569) -> ((Base_dData_dList.v_Base_dData_dList_dappend (((v_Vuna_dCompiler_dIr_dCps_dcollectHandlerGlobals t) (fuel - 1)) dtb__568)) (((v_Vuna_dCompiler_dIr_dCps_dcollectHandlerGlobalsList t) (fuel - 1)) dtb__569))
  | _ -> failwith "DT: impossible branch"
)))
# 1216 "Vuna/Compiler/Ir/Cps.vuna"
and v_Vuna_dCompiler_dIr_dCps_dcollectHandlerGlobalsFields = (fun (t : t_Vuna_dCompiler_dIr_dCps_dHandlerTables) (fuel : int) (fs : (string, Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIr) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) -> (if (fuel <= 0) then Base_dData_dList.C_Base_dData_dList_dList_Nil else (match fs with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__570, dtb__571) -> ((Base_dData_dList.v_Base_dData_dList_dappend (((v_Vuna_dCompiler_dIr_dCps_dcollectHandlerGlobals t) (fuel - 1)) (Base_dData_dPair.v_Base_dData_dPair_dsecondOf dtb__570))) (((v_Vuna_dCompiler_dIr_dCps_dcollectHandlerGlobalsFields t) (fuel - 1)) dtb__571))
  | _ -> failwith "DT: impossible branch"
)))
# 1225 "Vuna/Compiler/Ir/Cps.vuna"
and v_Vuna_dCompiler_dIr_dCps_dcollectHandlerGlobalsAlts = (fun (t : t_Vuna_dCompiler_dIr_dCps_dHandlerTables) (fuel : int) (alts : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrAlt Base_dData_dList.t_Base_dData_dList_dList) -> (if (fuel <= 0) then Base_dData_dList.C_Base_dData_dList_dList_Nil else (match alts with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__572, dtb__573) -> ((Base_dData_dList.v_Base_dData_dList_dappend (((v_Vuna_dCompiler_dIr_dCps_dcollectHandlerGlobals t) (fuel - 1)) (dtb__572).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBody)) (((v_Vuna_dCompiler_dIr_dCps_dcollectHandlerGlobalsAlts t) (fuel - 1)) dtb__573))
  | _ -> failwith "DT: impossible branch"
)))
# 1234 "Vuna/Compiler/Ir/Cps.vuna"
and v_Vuna_dCompiler_dIr_dCps_dcollectHandlerGlobalsAltM = (fun (t : t_Vuna_dCompiler_dIr_dCps_dHandlerTables) (fuel : int) (m : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrAlt Base_dData_dMaybe.t_Base_dData_dMaybe_dMaybe) -> (if (fuel <= 0) then Base_dData_dList.C_Base_dData_dList_dList_Nil else (match m with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__574) -> (((v_Vuna_dCompiler_dIr_dCps_dcollectHandlerGlobals t) (fuel - 1)) (dtb__574).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBody)
  | _ -> failwith "DT: impossible branch"
)))

# 1249 "Vuna/Compiler/Ir/Cps.vuna"
let rec v_Vuna_dCompiler_dIr_dCps_dcollectHandleOpsDefsGo = (fun (fuel : int) (t : t_Vuna_dCompiler_dIr_dCps_dHandlerTables) (ds : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrDef Base_dData_dList.t_Base_dData_dList_dList) -> (if (fuel <= 0) then Base_dData_dList.C_Base_dData_dList_dList_Nil else (match ds with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__575, dtb__576) -> ((Base_dData_dList.v_Base_dData_dList_dappend (((v_Vuna_dCompiler_dIr_dCps_dcollectHandlerGlobals t) (fuel - 1)) (v_Vuna_dCompiler_dIr_dCps_dmBodyOf dtb__575))) (((v_Vuna_dCompiler_dIr_dCps_dcollectHandleOpsDefsGo (fuel - 1)) t) dtb__576))
  | _ -> failwith "DT: impossible branch"
)))

# 1243 "Vuna/Compiler/Ir/Cps.vuna"
let v_Vuna_dCompiler_dIr_dCps_dcollectHandleOpsDefs = (fun (fuel : int) (ds : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrDef Base_dData_dList.t_Base_dData_dList_dList) -> ((fun tables -> (((v_Vuna_dCompiler_dIr_dCps_dcollectHandleOpsDefsGo fuel) tables) ds)) ((v_Vuna_dCompiler_dIr_dCps_dhandlerTables 100000) ds)))

# 1258 "Vuna/Compiler/Ir/Cps.vuna"
let rec v_Vuna_dCompiler_dIr_dCps_dmemName = (fun (mc0 : string) (mc1 : string Base_dData_dList.t_Base_dData_dList_dList) -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__577, dtb__578) -> (if (mc0 = dtb__577) then true else ((v_Vuna_dCompiler_dIr_dCps_dmemName mc0) dtb__578))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 1264 "Vuna/Compiler/Ir/Cps.vuna"
let v_Vuna_dCompiler_dIr_dCps_dscopedName = "Base.Effect.Core.handleScoped"

# 1267 "Vuna/Compiler/Ir/Cps.vuna"
let v_Vuna_dCompiler_dIr_dCps_dselfName = "Base.Effect.Core.handleSelf"

# 1270 "Vuna/Compiler/Ir/Cps.vuna"
let v_Vuna_dCompiler_dIr_dCps_dscopeName = "Base.Effect.Core.scope"

# 1273 "Vuna/Compiler/Ir/Cps.vuna"
let v_Vuna_dCompiler_dIr_dCps_dcleanupPushName = "Base.Effect.Core.pushCleanup"

# 1276 "Vuna/Compiler/Ir/Cps.vuna"
let v_Vuna_dCompiler_dIr_dCps_dcleanupPopName = "Base.Effect.Core.popCleanup"

# 1279 "Vuna/Compiler/Ir/Cps.vuna"
let rec v_Vuna_dCompiler_dIr_dCps_dmScopedCalls = (fun (fuel : int) (rs : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrBinder) (e : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIr) -> (if (fuel <= 0) then e else (match e with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (dtb__579, dtb__580, dtb__581) -> ((fun f1 -> ((fun a1 -> (match f1 with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrGlobal (dtb__582) -> (if (dtb__582 = v_Vuna_dCompiler_dIr_dCps_dscopedName) then (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrVar (rs)), a1)) else (if (dtb__582 = v_Vuna_dCompiler_dIr_dCps_dselfName) then (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrVar (rs)), (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrGlobal (v_Vuna_dCompiler_dIr_dCps_dscopeName)), a1)))) else (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, f1, a1))))
  | _ -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, f1, a1))
)) (((v_Vuna_dCompiler_dIr_dCps_dmScopedCalls (fuel - 1)) rs) dtb__581))) (((v_Vuna_dCompiler_dIr_dCps_dmScopedCalls (fuel - 1)) rs) dtb__580))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRtApp (dtb__583, dtb__584) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRtApp (dtb__583, (((v_Vuna_dCompiler_dIr_dCps_dmScopedList (fuel - 1)) rs) dtb__584)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCtor (dtb__585, dtb__586, dtb__587, dtb__588) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCtor (dtb__585, dtb__586, Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, (((v_Vuna_dCompiler_dIr_dCps_dmScopedList (fuel - 1)) rs) dtb__588)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRecord (dtb__589, dtb__590, dtb__591) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRecord (dtb__589, Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, (((v_Vuna_dCompiler_dIr_dCps_dmScopedFields (fuel - 1)) rs) dtb__591)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrProj (dtb__592, dtb__593, dtb__594, dtb__595) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrProj ((((v_Vuna_dCompiler_dIr_dCps_dmScopedCalls (fuel - 1)) rs) dtb__592), dtb__593, dtb__594, Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRecUpd (dtb__596, dtb__597, dtb__598, dtb__599) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRecUpd ((((v_Vuna_dCompiler_dIr_dCps_dmScopedCalls (fuel - 1)) rs) dtb__596), dtb__597, (((v_Vuna_dCompiler_dIr_dCps_dmScopedFields (fuel - 1)) rs) dtb__598), Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCast (dtb__600, dtb__601, dtb__602) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCast (dtb__600, dtb__601, (((v_Vuna_dCompiler_dIr_dCps_dmScopedCalls (fuel - 1)) rs) dtb__602)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLet (dtb__603, dtb__604, dtb__605) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLet (dtb__603, (((v_Vuna_dCompiler_dIr_dCps_dmScopedCalls (fuel - 1)) rs) dtb__604), (((v_Vuna_dCompiler_dIr_dCps_dmScopedCalls (fuel - 1)) rs) dtb__605)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLam (dtb__606, dtb__607, dtb__608) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLam (dtb__606, dtb__607, (((v_Vuna_dCompiler_dIr_dCps_dmScopedCalls (fuel - 1)) rs) dtb__608)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrIf (dtb__609, dtb__610, dtb__611) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrIf ((((v_Vuna_dCompiler_dIr_dCps_dmScopedCalls (fuel - 1)) rs) dtb__609), (((v_Vuna_dCompiler_dIr_dCps_dmScopedCalls (fuel - 1)) rs) dtb__610), (((v_Vuna_dCompiler_dIr_dCps_dmScopedCalls (fuel - 1)) rs) dtb__611)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCase (dtb__612, dtb__613, dtb__614, dtb__615) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCase (dtb__612, Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, (((v_Vuna_dCompiler_dIr_dCps_dmScopedCalls (fuel - 1)) rs) dtb__614), (((v_Vuna_dCompiler_dIr_dCps_dmScopedAlts (fuel - 1)) rs) dtb__615)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrNatCase (dtb__616, dtb__617, dtb__618, dtb__619, dtb__620) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrNatCase ((((v_Vuna_dCompiler_dIr_dCps_dmScopedCalls (fuel - 1)) rs) dtb__616), dtb__617, (((v_Vuna_dCompiler_dIr_dCps_dmScopedAltM (fuel - 1)) rs) dtb__618), (((v_Vuna_dCompiler_dIr_dCps_dmScopedAltM (fuel - 1)) rs) dtb__619), (((v_Vuna_dCompiler_dIr_dCps_dmScopedAltM (fuel - 1)) rs) dtb__620)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrConcatMany (dtb__621) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrConcatMany ((((v_Vuna_dCompiler_dIr_dCps_dmScopedList (fuel - 1)) rs) dtb__621)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrEffThunk (dtb__622, dtb__623, dtb__624, dtb__625, dtb__626) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrEffThunk (dtb__622, dtb__623, dtb__624, dtb__625, (((v_Vuna_dCompiler_dIr_dCps_dmScopedCalls (fuel - 1)) rs) dtb__626)))
  | _ -> e
)))
# 1307 "Vuna/Compiler/Ir/Cps.vuna"
and v_Vuna_dCompiler_dIr_dCps_dmScopedList = (fun (fuel : int) (rs : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrBinder) (xs : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIr Base_dData_dList.t_Base_dData_dList_dList) -> (if (fuel <= 0) then xs else (match xs with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__627, dtb__628) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ((((v_Vuna_dCompiler_dIr_dCps_dmScopedCalls (fuel - 1)) rs) dtb__627), (((v_Vuna_dCompiler_dIr_dCps_dmScopedList (fuel - 1)) rs) dtb__628)))
  | _ -> failwith "DT: impossible branch"
)))
# 1316 "Vuna/Compiler/Ir/Cps.vuna"
and v_Vuna_dCompiler_dIr_dCps_dmScopedFields = (fun (fuel : int) (rs : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrBinder) (fs : (string, Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIr) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) -> (if (fuel <= 0) then fs else (match fs with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__629, dtb__630) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Base_dData_dPair.v_Base_dData_dPair_dfirstOf dtb__629); Base_dData_dPair.f_Base_dData_dPair_dPair_second = (((v_Vuna_dCompiler_dIr_dCps_dmScopedCalls (fuel - 1)) rs) (Base_dData_dPair.v_Base_dData_dPair_dsecondOf dtb__629)) }, (((v_Vuna_dCompiler_dIr_dCps_dmScopedFields (fuel - 1)) rs) dtb__630)))
  | _ -> failwith "DT: impossible branch"
)))
# 1325 "Vuna/Compiler/Ir/Cps.vuna"
and v_Vuna_dCompiler_dIr_dCps_dmScopedAlts = (fun (fuel : int) (rs : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrBinder) (alts : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrAlt Base_dData_dList.t_Base_dData_dList_dList) -> (if (fuel <= 0) then alts else (match alts with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__631, dtb__632) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltCtor = (dtb__631).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltCtor; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBinders = (dtb__631).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBinders; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBody = (((v_Vuna_dCompiler_dIr_dCps_dmScopedCalls (fuel - 1)) rs) (dtb__631).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBody) }, (((v_Vuna_dCompiler_dIr_dCps_dmScopedAlts (fuel - 1)) rs) dtb__632)))
  | _ -> failwith "DT: impossible branch"
)))
# 1334 "Vuna/Compiler/Ir/Cps.vuna"
and v_Vuna_dCompiler_dIr_dCps_dmScopedAltM = (fun (fuel : int) (rs : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrBinder) (m : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrAlt Base_dData_dMaybe.t_Base_dData_dMaybe_dMaybe) -> (if (fuel <= 0) then m else (match m with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__633) -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ({ Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltCtor = (dtb__633).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltCtor; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBinders = (dtb__633).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBinders; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBody = (((v_Vuna_dCompiler_dIr_dCps_dmScopedCalls (fuel - 1)) rs) (dtb__633).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBody) }))
  | _ -> failwith "DT: impossible branch"
)))

# 897 "Vuna/Compiler/Ir/Cps.vuna"
let rec v_Vuna_dCompiler_dIr_dCps_dmHandlerLam = (fun (fuel : int) (bs : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrBinder Base_dData_dList.t_Base_dData_dList_dList) (body : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIr) -> (match (v_Vuna_dCompiler_dIr_dCps_dmResumption bs) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLam (bs, Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, ((v_Vuna_dCompiler_dIr_dCps_dmHandlers (fuel - 1)) body)))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__634) -> ((fun kd -> ((fun rs -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLam (((Base_dData_dList.v_Base_dData_dList_dappend bs) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (kd, (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (rs, Base_dData_dList.C_Base_dData_dList_dList_Nil))))), Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, (((v_Vuna_dCompiler_dIr_dCps_dmScopedCalls (fuel - 1)) rs) ((((v_Vuna_dCompiler_dIr_dCps_dmCps (fuel - 1)) dtb__634) (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrVar (kd))) body))))) (v_Vuna_dCompiler_dIr_dCps_dmFreshR fuel))) (v_Vuna_dCompiler_dIr_dCps_dmFreshTailK fuel))
  | _ -> failwith "DT: impossible branch"
))
# 910 "Vuna/Compiler/Ir/Cps.vuna"
and v_Vuna_dCompiler_dIr_dCps_dmListH = (fun (fuel : int) (xs : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIr Base_dData_dList.t_Base_dData_dList_dList) -> (if (fuel <= 0) then xs else (match xs with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__635, dtb__636) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (((v_Vuna_dCompiler_dIr_dCps_dmHandlers (fuel - 1)) dtb__635), ((v_Vuna_dCompiler_dIr_dCps_dmListH (fuel - 1)) dtb__636)))
  | _ -> failwith "DT: impossible branch"
)))
# 919 "Vuna/Compiler/Ir/Cps.vuna"
and v_Vuna_dCompiler_dIr_dCps_dmFieldsH = (fun (fuel : int) (fs : (string, Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIr) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) -> (if (fuel <= 0) then fs else (match fs with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__637, dtb__638) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Base_dData_dPair.v_Base_dData_dPair_dfirstOf dtb__637); Base_dData_dPair.f_Base_dData_dPair_dPair_second = ((v_Vuna_dCompiler_dIr_dCps_dmHandlers (fuel - 1)) (Base_dData_dPair.v_Base_dData_dPair_dsecondOf dtb__637)) }, ((v_Vuna_dCompiler_dIr_dCps_dmFieldsH (fuel - 1)) dtb__638)))
  | _ -> failwith "DT: impossible branch"
)))
# 928 "Vuna/Compiler/Ir/Cps.vuna"
and v_Vuna_dCompiler_dIr_dCps_dmHandlers = (fun (fuel : int) (e : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIr) -> (if (fuel <= 0) then e else (match e with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLam (dtb__639, dtb__640, dtb__641) -> (((v_Vuna_dCompiler_dIr_dCps_dmHandlerLam (fuel - 1)) dtb__639) dtb__641)
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCtor (dtb__642, dtb__643, dtb__644, dtb__645) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCtor (dtb__642, dtb__643, Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, ((v_Vuna_dCompiler_dIr_dCps_dmListH (fuel - 1)) dtb__645)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRecord (dtb__646, dtb__647, dtb__648) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRecord (dtb__646, Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, ((v_Vuna_dCompiler_dIr_dCps_dmFieldsH (fuel - 1)) dtb__648)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrProj (dtb__649, dtb__650, dtb__651, dtb__652) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrProj (((v_Vuna_dCompiler_dIr_dCps_dmHandlers (fuel - 1)) dtb__649), dtb__650, dtb__651, Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRecUpd (dtb__653, dtb__654, dtb__655, dtb__656) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRecUpd (((v_Vuna_dCompiler_dIr_dCps_dmHandlers (fuel - 1)) dtb__653), dtb__654, ((v_Vuna_dCompiler_dIr_dCps_dmFieldsH (fuel - 1)) dtb__655), Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRtApp (dtb__657, dtb__658) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRtApp (dtb__657, ((v_Vuna_dCompiler_dIr_dCps_dmListH (fuel - 1)) dtb__658)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCast (dtb__659, dtb__660, dtb__661) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCast (dtb__659, dtb__660, ((v_Vuna_dCompiler_dIr_dCps_dmHandlers (fuel - 1)) dtb__661)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLet (dtb__662, dtb__663, dtb__664) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLet (dtb__662, ((v_Vuna_dCompiler_dIr_dCps_dmHandlers (fuel - 1)) dtb__663), ((v_Vuna_dCompiler_dIr_dCps_dmHandlers (fuel - 1)) dtb__664)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (dtb__665, dtb__666, dtb__667) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, ((v_Vuna_dCompiler_dIr_dCps_dmHandlers (fuel - 1)) dtb__666), ((v_Vuna_dCompiler_dIr_dCps_dmHandlers (fuel - 1)) dtb__667)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrIf (dtb__668, dtb__669, dtb__670) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrIf (((v_Vuna_dCompiler_dIr_dCps_dmHandlers (fuel - 1)) dtb__668), ((v_Vuna_dCompiler_dIr_dCps_dmHandlers (fuel - 1)) dtb__669), ((v_Vuna_dCompiler_dIr_dCps_dmHandlers (fuel - 1)) dtb__670)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCase (dtb__671, dtb__672, dtb__673, dtb__674) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCase (dtb__671, Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, ((v_Vuna_dCompiler_dIr_dCps_dmHandlers (fuel - 1)) dtb__673), ((v_Vuna_dCompiler_dIr_dCps_dmHandlersAlts (fuel - 1)) dtb__674)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrNatCase (dtb__675, dtb__676, dtb__677, dtb__678, dtb__679) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrNatCase (((v_Vuna_dCompiler_dIr_dCps_dmHandlers (fuel - 1)) dtb__675), dtb__676, ((v_Vuna_dCompiler_dIr_dCps_dmHandlersAltM (fuel - 1)) dtb__677), ((v_Vuna_dCompiler_dIr_dCps_dmHandlersAltM (fuel - 1)) dtb__678), ((v_Vuna_dCompiler_dIr_dCps_dmHandlersAltM (fuel - 1)) dtb__679)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrConcatMany (dtb__680) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrConcatMany (((v_Vuna_dCompiler_dIr_dCps_dmListH (fuel - 1)) dtb__680)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrEffThunk (dtb__681, dtb__682, dtb__683, dtb__684, dtb__685) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrEffThunk (dtb__681, dtb__682, dtb__683, dtb__684, ((v_Vuna_dCompiler_dIr_dCps_dmHandlers (fuel - 1)) dtb__685)))
  | _ -> e
)))
# 950 "Vuna/Compiler/Ir/Cps.vuna"
and v_Vuna_dCompiler_dIr_dCps_dmHandlersAlts = (fun (fuel : int) (alts : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrAlt Base_dData_dList.t_Base_dData_dList_dList) -> (if (fuel <= 0) then alts else (match alts with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__686, dtb__687) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltCtor = (dtb__686).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltCtor; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBinders = (dtb__686).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBinders; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBody = ((v_Vuna_dCompiler_dIr_dCps_dmHandlers (fuel - 1)) (dtb__686).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBody) }, ((v_Vuna_dCompiler_dIr_dCps_dmHandlersAlts (fuel - 1)) dtb__687)))
  | _ -> failwith "DT: impossible branch"
)))
# 959 "Vuna/Compiler/Ir/Cps.vuna"
and v_Vuna_dCompiler_dIr_dCps_dmHandlersAltM = (fun (fuel : int) (m : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrAlt Base_dData_dMaybe.t_Base_dData_dMaybe_dMaybe) -> (if (fuel <= 0) then m else (match m with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__688) -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ({ Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltCtor = (dtb__688).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltCtor; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBinders = (dtb__688).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBinders; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBody = ((v_Vuna_dCompiler_dIr_dCps_dmHandlers (fuel - 1)) (dtb__688).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBody) }))
  | _ -> failwith "DT: impossible branch"
)))

# 1343 "Vuna/Compiler/Ir/Cps.vuna"
let rec v_Vuna_dCompiler_dIr_dCps_dlastBinderOf = (fun (bs : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrBinder Base_dData_dList.t_Base_dData_dList_dList) -> (match bs with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__689, dtb__690) -> (match dtb__690 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__689))
  | _ -> (v_Vuna_dCompiler_dIr_dCps_dlastBinderOf dtb__690)
)
  | _ -> failwith "DT: impossible branch"
))

# 1370 "Vuna/Compiler/Ir/Cps.vuna"
let v_Vuna_dCompiler_dIr_dCps_dmHandlerFun = (fun (fuel : int) (body : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIr) -> (if (fuel <= 0) then body else (match body with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLam (dtb__691, dtb__692, dtb__693) -> ((fun nd_uscrut5 -> (match nd_uscrut5 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__694, dtb__695) -> (match dtb__695 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__696, dtb__697) -> ((fun kd -> ((fun rs -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLam (((Base_dData_dList.v_Base_dData_dList_dappend dtb__691) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (kd, (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (rs, Base_dData_dList.C_Base_dData_dList_dList_Nil))))), Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, (((v_Vuna_dCompiler_dIr_dCps_dmScopedCalls (fuel - 1)) rs) ((((v_Vuna_dCompiler_dIr_dCps_dmCps (fuel - 1)) dtb__696) (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrVar (kd))) dtb__693))))) (v_Vuna_dCompiler_dIr_dCps_dmFreshR fuel))) (v_Vuna_dCompiler_dIr_dCps_dmFreshK fuel))
  | _ -> body
)
  | _ -> body
)) (v_Vuna_dCompiler_dIr_dCps_druntimeBinders dtb__691))
  | _ -> body
)))

# 1422 "Vuna/Compiler/Ir/Cps.vuna"
let v_Vuna_dCompiler_dIr_dCps_disContBinder = (fun (b : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrBinder) -> ((fun n -> (if (if ((Base_dData_dString.v_Base_dData_dString_dstartsWith "__cpsK") n) then true else ((Base_dData_dString.v_Base_dData_dString_dstartsWith "__mchTK") n)) then true else ((Base_dData_dString.v_Base_dData_dString_dstartsWith "__mchK") n))) (v_Vuna_dCompiler_dIr_dCps_dmBNameText (b).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrBinder_irBinderName)))

# 1428 "Vuna/Compiler/Ir/Cps.vuna"
let rec v_Vuna_dCompiler_dIr_dCps_dmApplys = (fun (fuel : int) (e : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIr) -> (if (fuel <= 0) then e else (match e with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (dtb__698, dtb__699, dtb__700) -> (match dtb__699 with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrVar (dtb__701) -> (if (v_Vuna_dCompiler_dIr_dCps_disContBinder dtb__701) then (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRtApp (v_Vuna_dCompiler_dIr_dCps_dirMApplyName, (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ((Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrVar (dtb__701)), (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (((v_Vuna_dCompiler_dIr_dCps_dmApplys (fuel - 1)) dtb__700), Base_dData_dList.C_Base_dData_dList_dList_Nil)))))) else (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, ((v_Vuna_dCompiler_dIr_dCps_dmApplys (fuel - 1)) dtb__699), ((v_Vuna_dCompiler_dIr_dCps_dmApplys (fuel - 1)) dtb__700))))
  | _ -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, ((v_Vuna_dCompiler_dIr_dCps_dmApplys (fuel - 1)) dtb__699), ((v_Vuna_dCompiler_dIr_dCps_dmApplys (fuel - 1)) dtb__700)))
)
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRtApp (dtb__702, dtb__703) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRtApp (dtb__702, ((v_Vuna_dCompiler_dIr_dCps_dmApplysList (fuel - 1)) dtb__703)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCtor (dtb__704, dtb__705, dtb__706, dtb__707) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCtor (dtb__704, dtb__705, Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, ((v_Vuna_dCompiler_dIr_dCps_dmApplysList (fuel - 1)) dtb__707)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRecord (dtb__708, dtb__709, dtb__710) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRecord (dtb__708, Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, ((v_Vuna_dCompiler_dIr_dCps_dmApplysFields (fuel - 1)) dtb__710)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrProj (dtb__711, dtb__712, dtb__713, dtb__714) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrProj (((v_Vuna_dCompiler_dIr_dCps_dmApplys (fuel - 1)) dtb__711), dtb__712, dtb__713, Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRecUpd (dtb__715, dtb__716, dtb__717, dtb__718) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRecUpd (((v_Vuna_dCompiler_dIr_dCps_dmApplys (fuel - 1)) dtb__715), dtb__716, ((v_Vuna_dCompiler_dIr_dCps_dmApplysFields (fuel - 1)) dtb__717), Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCast (dtb__719, dtb__720, dtb__721) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCast (dtb__719, dtb__720, ((v_Vuna_dCompiler_dIr_dCps_dmApplys (fuel - 1)) dtb__721)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLet (dtb__722, dtb__723, dtb__724) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLet (dtb__722, ((v_Vuna_dCompiler_dIr_dCps_dmApplys (fuel - 1)) dtb__723), ((v_Vuna_dCompiler_dIr_dCps_dmApplys (fuel - 1)) dtb__724)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLam (dtb__725, dtb__726, dtb__727) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLam (dtb__725, dtb__726, ((v_Vuna_dCompiler_dIr_dCps_dmApplys (fuel - 1)) dtb__727)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrIf (dtb__728, dtb__729, dtb__730) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrIf (((v_Vuna_dCompiler_dIr_dCps_dmApplys (fuel - 1)) dtb__728), ((v_Vuna_dCompiler_dIr_dCps_dmApplys (fuel - 1)) dtb__729), ((v_Vuna_dCompiler_dIr_dCps_dmApplys (fuel - 1)) dtb__730)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCase (dtb__731, dtb__732, dtb__733, dtb__734) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCase (dtb__731, Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, ((v_Vuna_dCompiler_dIr_dCps_dmApplys (fuel - 1)) dtb__733), ((v_Vuna_dCompiler_dIr_dCps_dmApplysAlts (fuel - 1)) dtb__734)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrNatCase (dtb__735, dtb__736, dtb__737, dtb__738, dtb__739) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrNatCase (((v_Vuna_dCompiler_dIr_dCps_dmApplys (fuel - 1)) dtb__735), dtb__736, ((v_Vuna_dCompiler_dIr_dCps_dmApplysAltM (fuel - 1)) dtb__737), ((v_Vuna_dCompiler_dIr_dCps_dmApplysAltM (fuel - 1)) dtb__738), ((v_Vuna_dCompiler_dIr_dCps_dmApplysAltM (fuel - 1)) dtb__739)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrConcatMany (dtb__740) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrConcatMany (((v_Vuna_dCompiler_dIr_dCps_dmApplysList (fuel - 1)) dtb__740)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrEffThunk (dtb__741, dtb__742, dtb__743, dtb__744, dtb__745) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrEffThunk (dtb__741, dtb__742, dtb__743, dtb__744, ((v_Vuna_dCompiler_dIr_dCps_dmApplys (fuel - 1)) dtb__745)))
  | _ -> e
)))
# 1453 "Vuna/Compiler/Ir/Cps.vuna"
and v_Vuna_dCompiler_dIr_dCps_dmApplysList = (fun (fuel : int) (xs : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIr Base_dData_dList.t_Base_dData_dList_dList) -> (if (fuel <= 0) then xs else (match xs with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__746, dtb__747) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (((v_Vuna_dCompiler_dIr_dCps_dmApplys (fuel - 1)) dtb__746), ((v_Vuna_dCompiler_dIr_dCps_dmApplysList (fuel - 1)) dtb__747)))
  | _ -> failwith "DT: impossible branch"
)))
# 1462 "Vuna/Compiler/Ir/Cps.vuna"
and v_Vuna_dCompiler_dIr_dCps_dmApplysFields = (fun (fuel : int) (fs : (string, Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIr) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) -> (if (fuel <= 0) then fs else (match fs with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__748, dtb__749) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Base_dData_dPair.v_Base_dData_dPair_dfirstOf dtb__748); Base_dData_dPair.f_Base_dData_dPair_dPair_second = ((v_Vuna_dCompiler_dIr_dCps_dmApplys (fuel - 1)) (Base_dData_dPair.v_Base_dData_dPair_dsecondOf dtb__748)) }, ((v_Vuna_dCompiler_dIr_dCps_dmApplysFields (fuel - 1)) dtb__749)))
  | _ -> failwith "DT: impossible branch"
)))
# 1471 "Vuna/Compiler/Ir/Cps.vuna"
and v_Vuna_dCompiler_dIr_dCps_dmApplysAlts = (fun (fuel : int) (alts : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrAlt Base_dData_dList.t_Base_dData_dList_dList) -> (if (fuel <= 0) then alts else (match alts with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__750, dtb__751) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltCtor = (dtb__750).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltCtor; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBinders = (dtb__750).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBinders; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBody = ((v_Vuna_dCompiler_dIr_dCps_dmApplys (fuel - 1)) (dtb__750).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBody) }, ((v_Vuna_dCompiler_dIr_dCps_dmApplysAlts (fuel - 1)) dtb__751)))
  | _ -> failwith "DT: impossible branch"
)))
# 1480 "Vuna/Compiler/Ir/Cps.vuna"
and v_Vuna_dCompiler_dIr_dCps_dmApplysAltM = (fun (fuel : int) (m : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrAlt Base_dData_dMaybe.t_Base_dData_dMaybe_dMaybe) -> (if (fuel <= 0) then m else (match m with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__752) -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ({ Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltCtor = (dtb__752).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltCtor; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBinders = (dtb__752).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBinders; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBody = ((v_Vuna_dCompiler_dIr_dCps_dmApplys (fuel - 1)) (dtb__752).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBody) }))
  | _ -> failwith "DT: impossible branch"
)))

# 1495 "Vuna/Compiler/Ir/Cps.vuna"
let rec v_Vuna_dCompiler_dIr_dCps_dmMarked = (fun (fuel : int) (e : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIr) -> (if (fuel <= 0) then e else ((fun nd_uscrut2 -> (match nd_uscrut2 with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrEffThunk (dtb__753, dtb__754, dtb__755, dtb__756, dtb__757) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrEffThunk (dtb__753, dtb__754, dtb__755, dtb__756, ((v_Vuna_dCompiler_dIr_dCps_dmMarked (fuel - 1)) dtb__757)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrConcatMany (dtb__758) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrConcatMany (((v_Vuna_dCompiler_dIr_dCps_dmMarkedList (fuel - 1)) dtb__758)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrNatCase (dtb__759, dtb__760, dtb__761, dtb__762, dtb__763) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrNatCase (((v_Vuna_dCompiler_dIr_dCps_dmMarked (fuel - 1)) dtb__759), dtb__760, ((v_Vuna_dCompiler_dIr_dCps_dmMarkedAltM (fuel - 1)) dtb__761), ((v_Vuna_dCompiler_dIr_dCps_dmMarkedAltM (fuel - 1)) dtb__762), ((v_Vuna_dCompiler_dIr_dCps_dmMarkedAltM (fuel - 1)) dtb__763)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCase (dtb__764, dtb__765, dtb__766, dtb__767) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCase (dtb__764, Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, ((v_Vuna_dCompiler_dIr_dCps_dmMarked (fuel - 1)) dtb__766), ((v_Vuna_dCompiler_dIr_dCps_dmMarkedAlts (fuel - 1)) dtb__767)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrIf (dtb__768, dtb__769, dtb__770) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrIf (((v_Vuna_dCompiler_dIr_dCps_dmMarked (fuel - 1)) dtb__768), ((v_Vuna_dCompiler_dIr_dCps_dmMarked (fuel - 1)) dtb__769), ((v_Vuna_dCompiler_dIr_dCps_dmMarked (fuel - 1)) dtb__770)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (dtb__771, dtb__772, dtb__773) -> (match dtb__772 with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (dtb__774, dtb__775, dtb__776) -> (match dtb__775 with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRt (dtb__777) -> (if (dtb__777 = "@ir@m@self") then (match dtb__773 with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLam (dtb__778, dtb__779, dtb__780) -> (match dtb__778 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__781, dtb__782) -> (match dtb__782 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRt (v_Vuna_dCompiler_dIr_dCps_dirMRunName)), (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRt ("@ir@m@self")), ((v_Vuna_dCompiler_dIr_dCps_dmMarked (fuel - 1)) dtb__776))), v_Vuna_dCompiler_dIr_dCps_dmDoneCont))))
  | _ -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, ((v_Vuna_dCompiler_dIr_dCps_dmMarked (fuel - 1)) dtb__772), ((v_Vuna_dCompiler_dIr_dCps_dmMarked (fuel - 1)) dtb__773)))
)
  | _ -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, ((v_Vuna_dCompiler_dIr_dCps_dmMarked (fuel - 1)) dtb__772), ((v_Vuna_dCompiler_dIr_dCps_dmMarked (fuel - 1)) dtb__773)))
)
  | _ -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, ((v_Vuna_dCompiler_dIr_dCps_dmMarked (fuel - 1)) dtb__772), ((v_Vuna_dCompiler_dIr_dCps_dmMarked (fuel - 1)) dtb__773)))
) else (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, ((v_Vuna_dCompiler_dIr_dCps_dmMarked (fuel - 1)) dtb__772), ((v_Vuna_dCompiler_dIr_dCps_dmMarked (fuel - 1)) dtb__773))))
  | _ -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, ((v_Vuna_dCompiler_dIr_dCps_dmMarked (fuel - 1)) dtb__772), ((v_Vuna_dCompiler_dIr_dCps_dmMarked (fuel - 1)) dtb__773)))
)
  | _ -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, ((v_Vuna_dCompiler_dIr_dCps_dmMarked (fuel - 1)) dtb__772), ((v_Vuna_dCompiler_dIr_dCps_dmMarked (fuel - 1)) dtb__773)))
)
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLet (dtb__783, dtb__784, dtb__785) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLet (dtb__783, ((v_Vuna_dCompiler_dIr_dCps_dmMarked (fuel - 1)) dtb__784), ((v_Vuna_dCompiler_dIr_dCps_dmMarked (fuel - 1)) dtb__785)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCast (dtb__786, dtb__787, dtb__788) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCast (dtb__786, dtb__787, ((v_Vuna_dCompiler_dIr_dCps_dmMarked (fuel - 1)) dtb__788)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRecUpd (dtb__789, dtb__790, dtb__791, dtb__792) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRecUpd (((v_Vuna_dCompiler_dIr_dCps_dmMarked (fuel - 1)) dtb__789), dtb__790, ((v_Vuna_dCompiler_dIr_dCps_dmMarkedFields (fuel - 1)) dtb__791), Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrProj (dtb__793, dtb__794, dtb__795, dtb__796) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrProj (((v_Vuna_dCompiler_dIr_dCps_dmMarked (fuel - 1)) dtb__793), dtb__794, dtb__795, Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRecord (dtb__797, dtb__798, dtb__799) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRecord (dtb__797, Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, ((v_Vuna_dCompiler_dIr_dCps_dmMarkedFields (fuel - 1)) dtb__799)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCtor (dtb__800, dtb__801, dtb__802, dtb__803) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCtor (dtb__800, dtb__801, Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, ((v_Vuna_dCompiler_dIr_dCps_dmMarkedList (fuel - 1)) dtb__803)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRtApp (dtb__804, dtb__805) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRtApp (dtb__804, ((v_Vuna_dCompiler_dIr_dCps_dmMarkedList (fuel - 1)) dtb__805)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLam (dtb__806, dtb__807, dtb__808) -> (if (if (v_Vuna_dCompiler_dIr_dCps_disEffContLambda dtb__807) then (Base_dData_dBool.v_Base_dData_dBool_dnot (v_Vuna_dCompiler_dIr_dCps_disEffThunkBody dtb__808)) else false) then (((((v_Vuna_dCompiler_dIr_dCps_dmEffContLambda (fuel - 1)) v_Vuna_dCompiler_dIr_dCps_dmNoResumption) dtb__806) dtb__807) dtb__808) else (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLam (dtb__806, dtb__807, ((v_Vuna_dCompiler_dIr_dCps_dmMarked (fuel - 1)) dtb__808))))
  | _ -> e
)) e)))
# 1519 "Vuna/Compiler/Ir/Cps.vuna"
and v_Vuna_dCompiler_dIr_dCps_dmMarkedList = (fun (fuel : int) (xs : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIr Base_dData_dList.t_Base_dData_dList_dList) -> (if (fuel <= 0) then xs else (match xs with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__809, dtb__810) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (((v_Vuna_dCompiler_dIr_dCps_dmMarked (fuel - 1)) dtb__809), ((v_Vuna_dCompiler_dIr_dCps_dmMarkedList (fuel - 1)) dtb__810)))
  | _ -> failwith "DT: impossible branch"
)))
# 1528 "Vuna/Compiler/Ir/Cps.vuna"
and v_Vuna_dCompiler_dIr_dCps_dmMarkedFields = (fun (fuel : int) (fs : (string, Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIr) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) -> (if (fuel <= 0) then fs else (match fs with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__811, dtb__812) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Base_dData_dPair.v_Base_dData_dPair_dfirstOf dtb__811); Base_dData_dPair.f_Base_dData_dPair_dPair_second = ((v_Vuna_dCompiler_dIr_dCps_dmMarked (fuel - 1)) (Base_dData_dPair.v_Base_dData_dPair_dsecondOf dtb__811)) }, ((v_Vuna_dCompiler_dIr_dCps_dmMarkedFields (fuel - 1)) dtb__812)))
  | _ -> failwith "DT: impossible branch"
)))
# 1537 "Vuna/Compiler/Ir/Cps.vuna"
and v_Vuna_dCompiler_dIr_dCps_dmMarkedAlts = (fun (fuel : int) (alts : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrAlt Base_dData_dList.t_Base_dData_dList_dList) -> (if (fuel <= 0) then alts else (match alts with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__813, dtb__814) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltCtor = (dtb__813).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltCtor; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBinders = (dtb__813).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBinders; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBody = ((v_Vuna_dCompiler_dIr_dCps_dmMarked (fuel - 1)) (dtb__813).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBody) }, ((v_Vuna_dCompiler_dIr_dCps_dmMarkedAlts (fuel - 1)) dtb__814)))
  | _ -> failwith "DT: impossible branch"
)))
# 1546 "Vuna/Compiler/Ir/Cps.vuna"
and v_Vuna_dCompiler_dIr_dCps_dmMarkedAltM = (fun (fuel : int) (m : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrAlt Base_dData_dMaybe.t_Base_dData_dMaybe_dMaybe) -> (if (fuel <= 0) then m else (match m with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__815) -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ({ Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltCtor = (dtb__815).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltCtor; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBinders = (dtb__815).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBinders; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBody = ((v_Vuna_dCompiler_dIr_dCps_dmMarked (fuel - 1)) (dtb__815).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBody) }))
  | _ -> failwith "DT: impossible branch"
)))

# 1555 "Vuna/Compiler/Ir/Cps.vuna"
let v_Vuna_dCompiler_dIr_dCps_dmMarkedDef = (fun (mc0 : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrDef) -> (match mc0 with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrDef_IrDef (dtb__816, dtb__817, dtb__818, dtb__819, dtb__820, dtb__821, dtb__822, dtb__823) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrDef_IrDef (dtb__816, dtb__817, dtb__818, Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, ((v_Vuna_dCompiler_dIr_dCps_dmMarked v_Vuna_dCompiler_dIr_dCps_dstartFuel) dtb__820), dtb__821, dtb__822, dtb__823))
  | _ -> mc0
))

# 1560 "Vuna/Compiler/Ir/Cps.vuna"
let v_Vuna_dCompiler_dIr_dCps_dmApplysDef = (fun (mc0 : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrDef) -> (match mc0 with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrDef_IrDef (dtb__824, dtb__825, dtb__826, dtb__827, dtb__828, dtb__829, dtb__830, dtb__831) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrDef_IrDef (dtb__824, dtb__825, dtb__826, Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, ((v_Vuna_dCompiler_dIr_dCps_dmApplys v_Vuna_dCompiler_dIr_dCps_dstartFuel) dtb__828), dtb__829, dtb__830, dtb__831))
  | _ -> mc0
))

# 1570 "Vuna/Compiler/Ir/Cps.vuna"
let v_Vuna_dCompiler_dIr_dCps_dmachineCtl = "Base.Effect.Core.Control"

# 1354 "Vuna/Compiler/Ir/Cps.vuna"
let v_Vuna_dCompiler_dIr_dCps_dmCleanupDef = (fun (n : string) (body : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIr) -> (if (n = v_Vuna_dCompiler_dIr_dCps_dcleanupPushName) then (match body with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLam (dtb__832, dtb__833, dtb__834) -> (match (v_Vuna_dCompiler_dIr_dCps_dlastBinderOf dtb__832) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__835) -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ((Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLam (dtb__832, Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCtor (Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirEffTypeName, Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirEffMkCtor, Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ((Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLam ((Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ((v_Vuna_dCompiler_dIr_dCps_dmkBinder "__mCleanU"), (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ((v_Vuna_dCompiler_dIr_dCps_dmkBinder "__mCleanK"), Base_dData_dList.C_Base_dData_dList_dList_Nil)))), Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCtor (v_Vuna_dCompiler_dIr_dCps_dmachineCtl, (v_Vuna_dCompiler_dIr_dCps_dmachineCtl ^ ".MkPushCleanup"), Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ((Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCtor ("Base.Effect.Core.Cleanup", "Base.Effect.Core.Cleanup.MkCleanup", Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ((Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrVar (dtb__835)), Base_dData_dList.C_Base_dData_dList_dList_Nil)))), (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ((Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrVar ((v_Vuna_dCompiler_dIr_dCps_dmkBinder "__mCleanK"))), Base_dData_dList.C_Base_dData_dList_dList_Nil)))))))), Base_dData_dList.C_Base_dData_dList_dList_Nil))))))))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
) else (if (n = v_Vuna_dCompiler_dIr_dCps_dcleanupPopName) then (match body with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLam (dtb__836, dtb__837, dtb__838) -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ((Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLam (dtb__836, Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCtor (Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirEffTypeName, Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirEffMkCtor, Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ((Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLam ((Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ((v_Vuna_dCompiler_dIr_dCps_dmkBinder "__mCleanU"), (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ((v_Vuna_dCompiler_dIr_dCps_dmkBinder "__mCleanK"), Base_dData_dList.C_Base_dData_dList_dList_Nil)))), Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCtor (v_Vuna_dCompiler_dIr_dCps_dmachineCtl, (v_Vuna_dCompiler_dIr_dCps_dmachineCtl ^ ".MkPopCleanup"), Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ((Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrVar ((v_Vuna_dCompiler_dIr_dCps_dmkBinder "__mCleanK"))), Base_dData_dList.C_Base_dData_dList_dList_Nil)))))), Base_dData_dList.C_Base_dData_dList_dList_Nil))))))))
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
) else Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing)))

# 1386 "Vuna/Compiler/Ir/Cps.vuna"
let v_Vuna_dCompiler_dIr_dCps_dmDef = (fun (handlers : string Base_dData_dList.t_Base_dData_dList_dList) (fuel : int) (d : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrDef) -> (if (fuel <= 0) then d else (match d with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrDef_IrExternDef (dtb__839, dtb__840, dtb__841, dtb__842) -> d
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrDef_IrDef (dtb__843, dtb__844, dtb__845, dtb__846, dtb__847, dtb__848, dtb__849, dtb__850) -> ((fun marked -> ((fun h -> ((fun ar2 -> ((fun b -> (if (if (if (dtb__843 = v_Vuna_dCompiler_dIr_dCps_drunPureName) then true else (dtb__843 = v_Vuna_dCompiler_dIr_dCps_drunEffName)) then true else (dtb__843 = v_Vuna_dCompiler_dIr_dCps_drunMainName)) then (match ((v_Vuna_dCompiler_dIr_dCps_dmTrampolineBody dtb__843) b) with
  | Base_dData_dResult.C_Base_dData_dResult_dResult_Ok (dtb__851) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrDef_IrDef (dtb__843, ar2, dtb__845, Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, dtb__851, dtb__848, dtb__849, dtb__850))
  | Base_dData_dResult.C_Base_dData_dResult_dResult_Err (dtb__852) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrDef_IrDef (dtb__843, ar2, dtb__845, Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, b, dtb__848, dtb__849, dtb__850))
  | _ -> failwith "DT: impossible branch"
) else (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrDef_IrDef (dtb__843, ar2, dtb__845, Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, b, dtb__848, dtb__849, dtb__850)))) ((v_Vuna_dCompiler_dIr_dCps_dmSyms (fuel - 1)) ((v_Vuna_dCompiler_dIr_dCps_dmHandlers (fuel - 1)) h)))) (if marked then (dtb__844 + 2) else dtb__844))) (match ((v_Vuna_dCompiler_dIr_dCps_dmCleanupDef dtb__843) dtb__847) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__853) -> dtb__853
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (if marked then ((v_Vuna_dCompiler_dIr_dCps_dmHandlerFun (fuel - 1)) dtb__847) else dtb__847)
  | _ -> failwith "DT: impossible branch"
))) ((v_Vuna_dCompiler_dIr_dCps_dmemName dtb__843) handlers))
  | _ -> failwith "DT: impossible branch"
)))

# 1409 "Vuna/Compiler/Ir/Cps.vuna"
let rec v_Vuna_dCompiler_dIr_dCps_dmDefs = (fun (handlers : string Base_dData_dList.t_Base_dData_dList_dList) (fuel : int) (ds : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrDef Base_dData_dList.t_Base_dData_dList_dList) -> (if (fuel <= 0) then ds else (match ds with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__854, dtb__855) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ((((v_Vuna_dCompiler_dIr_dCps_dmDef handlers) (fuel - 1)) dtb__854), (((v_Vuna_dCompiler_dIr_dCps_dmDefs handlers) (fuel - 1)) dtb__855)))
  | _ -> failwith "DT: impossible branch"
)))

# 1573 "Vuna/Compiler/Ir/Cps.vuna"
let v_Vuna_dCompiler_dIr_dCps_dmachineCtorOf = (fun (sym : string) -> (if (sym = v_Vuna_dCompiler_dIr_dCps_dirMDoneName) then (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ("MkDone")) else (if (sym = v_Vuna_dCompiler_dIr_dCps_dirMApplyName) then (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ("MkApply")) else (if (sym = v_Vuna_dCompiler_dIr_dCps_dirMPerformName) then (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ("MkPerform")) else (if (sym = v_Vuna_dCompiler_dIr_dCps_dirMHandleName) then (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ("MkHandle")) else (if (sym = v_Vuna_dCompiler_dIr_dCps_dirMSelfName) then (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ("MkSelf")) else Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing))))))

# 1587 "Vuna/Compiler/Ir/Cps.vuna"
let v_Vuna_dCompiler_dIr_dCps_dmachineArgsOf = (fun (sym : string) (args : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIr Base_dData_dList.t_Base_dData_dList_dList) -> (if (sym = v_Vuna_dCompiler_dIr_dCps_dirMHandleName) then ((fun nd_uscrut2 -> (match nd_uscrut2 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__856, dtb__857) -> (match dtb__857 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__858, dtb__859) -> (match dtb__859 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__860, dtb__861) -> (match dtb__861 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__862, dtb__863) -> (match dtb__863 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__864, dtb__865) -> (match dtb__865 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__866, dtb__867) -> ((Base_dData_dList.v_Base_dData_dList_dappend (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__856, (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__858, (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__860, (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__862, (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__864, Base_dData_dList.C_Base_dData_dList_dList_Nil))))))))))) dtb__867)
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

# 1596 "Vuna/Compiler/Ir/Cps.vuna"
let rec v_Vuna_dCompiler_dIr_dCps_dmSteps = (fun (fuel : int) (e : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIr) -> (if (fuel <= 0) then e else (match e with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRtApp (dtb__868, dtb__869) -> (match (v_Vuna_dCompiler_dIr_dCps_dmachineCtorOf dtb__868) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__870) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCtor (v_Vuna_dCompiler_dIr_dCps_dmachineCtl, (String.concat "" [v_Vuna_dCompiler_dIr_dCps_dmachineCtl; "."; dtb__870]), Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, ((v_Vuna_dCompiler_dIr_dCps_dmStepsList (fuel - 1)) ((v_Vuna_dCompiler_dIr_dCps_dmachineArgsOf dtb__868) dtb__869))))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (if (dtb__868 = v_Vuna_dCompiler_dIr_dCps_dirMRunName) then ((fun nd_uscrut5 -> (match nd_uscrut5 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__871, dtb__872) -> (match dtb__872 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrGlobal ("Base.Effect.Core.machineRun")), ((v_Vuna_dCompiler_dIr_dCps_dmSteps (fuel - 1)) dtb__871)))
  | _ -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRtApp (dtb__868, ((v_Vuna_dCompiler_dIr_dCps_dmStepsList (fuel - 1)) dtb__869)))
)
  | _ -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRtApp (dtb__868, ((v_Vuna_dCompiler_dIr_dCps_dmStepsList (fuel - 1)) dtb__869)))
)) dtb__869) else (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRtApp (dtb__868, ((v_Vuna_dCompiler_dIr_dCps_dmStepsList (fuel - 1)) dtb__869))))
  | _ -> failwith "DT: impossible branch"
)
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (dtb__873, dtb__874, dtb__875) -> ((fun p -> ((fun head -> ((fun args -> (match head with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRt (dtb__876) -> (match (v_Vuna_dCompiler_dIr_dCps_dmachineCtorOf dtb__876) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__877) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCtor (v_Vuna_dCompiler_dIr_dCps_dmachineCtl, (String.concat "" [v_Vuna_dCompiler_dIr_dCps_dmachineCtl; "."; dtb__877]), Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, ((v_Vuna_dCompiler_dIr_dCps_dmStepsList (fuel - 1)) ((v_Vuna_dCompiler_dIr_dCps_dmachineArgsOf dtb__876) args))))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (if (dtb__876 = v_Vuna_dCompiler_dIr_dCps_dirMRunName) then ((fun nd_uscrut10 -> (match nd_uscrut10 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__878, dtb__879) -> (match dtb__879 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrGlobal ("Base.Effect.Core.machineRun")), ((v_Vuna_dCompiler_dIr_dCps_dmSteps (fuel - 1)) dtb__878)))
  | _ -> (((v_Vuna_dCompiler_dIr_dCps_dfoldAppMap (fuel - 1)) ((v_Vuna_dCompiler_dIr_dCps_dmSteps (fuel - 1)) head)) args)
)
  | _ -> (((v_Vuna_dCompiler_dIr_dCps_dfoldAppMap (fuel - 1)) ((v_Vuna_dCompiler_dIr_dCps_dmSteps (fuel - 1)) head)) args)
)) args) else (((v_Vuna_dCompiler_dIr_dCps_dfoldAppMap (fuel - 1)) ((v_Vuna_dCompiler_dIr_dCps_dmSteps (fuel - 1)) head)) args))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> (((v_Vuna_dCompiler_dIr_dCps_dfoldAppMap (fuel - 1)) ((v_Vuna_dCompiler_dIr_dCps_dmSteps (fuel - 1)) head)) args)
)) (Base_dData_dPair.v_Base_dData_dPair_dsecondOf p))) (Base_dData_dPair.v_Base_dData_dPair_dfirstOf p))) (v_Vuna_dCompiler_dIr_dCps_dflattenApp e))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCtor (dtb__880, dtb__881, dtb__882, dtb__883) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCtor (dtb__880, dtb__881, Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, ((v_Vuna_dCompiler_dIr_dCps_dmStepsList (fuel - 1)) dtb__883)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRecord (dtb__884, dtb__885, dtb__886) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRecord (dtb__884, Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, ((v_Vuna_dCompiler_dIr_dCps_dmStepsFields (fuel - 1)) dtb__886)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrProj (dtb__887, dtb__888, dtb__889, dtb__890) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrProj (((v_Vuna_dCompiler_dIr_dCps_dmSteps (fuel - 1)) dtb__887), dtb__888, dtb__889, Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRecUpd (dtb__891, dtb__892, dtb__893, dtb__894) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRecUpd (((v_Vuna_dCompiler_dIr_dCps_dmSteps (fuel - 1)) dtb__891), dtb__892, ((v_Vuna_dCompiler_dIr_dCps_dmStepsFields (fuel - 1)) dtb__893), Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCast (dtb__895, dtb__896, dtb__897) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCast (dtb__895, dtb__896, ((v_Vuna_dCompiler_dIr_dCps_dmSteps (fuel - 1)) dtb__897)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLet (dtb__898, dtb__899, dtb__900) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLet (dtb__898, ((v_Vuna_dCompiler_dIr_dCps_dmSteps (fuel - 1)) dtb__899), ((v_Vuna_dCompiler_dIr_dCps_dmSteps (fuel - 1)) dtb__900)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLam (dtb__901, dtb__902, dtb__903) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLam (dtb__901, dtb__902, ((v_Vuna_dCompiler_dIr_dCps_dmSteps (fuel - 1)) dtb__903)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrIf (dtb__904, dtb__905, dtb__906) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrIf (((v_Vuna_dCompiler_dIr_dCps_dmSteps (fuel - 1)) dtb__904), ((v_Vuna_dCompiler_dIr_dCps_dmSteps (fuel - 1)) dtb__905), ((v_Vuna_dCompiler_dIr_dCps_dmSteps (fuel - 1)) dtb__906)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCase (dtb__907, dtb__908, dtb__909, dtb__910) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCase (dtb__907, Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, ((v_Vuna_dCompiler_dIr_dCps_dmSteps (fuel - 1)) dtb__909), ((v_Vuna_dCompiler_dIr_dCps_dmStepsAlts (fuel - 1)) dtb__910)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrNatCase (dtb__911, dtb__912, dtb__913, dtb__914, dtb__915) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrNatCase (((v_Vuna_dCompiler_dIr_dCps_dmSteps (fuel - 1)) dtb__911), dtb__912, ((v_Vuna_dCompiler_dIr_dCps_dmStepsAltM (fuel - 1)) dtb__913), ((v_Vuna_dCompiler_dIr_dCps_dmStepsAltM (fuel - 1)) dtb__914), ((v_Vuna_dCompiler_dIr_dCps_dmStepsAltM (fuel - 1)) dtb__915)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrConcatMany (dtb__916) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrConcatMany (((v_Vuna_dCompiler_dIr_dCps_dmStepsList (fuel - 1)) dtb__916)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrEffThunk (dtb__917, dtb__918, dtb__919, dtb__920, dtb__921) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrEffThunk (dtb__917, dtb__918, dtb__919, dtb__920, ((v_Vuna_dCompiler_dIr_dCps_dmSteps (fuel - 1)) dtb__921)))
  | _ -> e
)))
# 1643 "Vuna/Compiler/Ir/Cps.vuna"
and v_Vuna_dCompiler_dIr_dCps_dmStepsList = (fun (fuel : int) (xs : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIr Base_dData_dList.t_Base_dData_dList_dList) -> (if (fuel <= 0) then xs else (match xs with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__922, dtb__923) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (((v_Vuna_dCompiler_dIr_dCps_dmSteps (fuel - 1)) dtb__922), ((v_Vuna_dCompiler_dIr_dCps_dmStepsList (fuel - 1)) dtb__923)))
  | _ -> failwith "DT: impossible branch"
)))
# 1652 "Vuna/Compiler/Ir/Cps.vuna"
and v_Vuna_dCompiler_dIr_dCps_dmStepsFields = (fun (fuel : int) (fs : (string, Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIr) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) -> (if (fuel <= 0) then fs else (match fs with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__924, dtb__925) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Base_dData_dPair.v_Base_dData_dPair_dfirstOf dtb__924); Base_dData_dPair.f_Base_dData_dPair_dPair_second = ((v_Vuna_dCompiler_dIr_dCps_dmSteps (fuel - 1)) (Base_dData_dPair.v_Base_dData_dPair_dsecondOf dtb__924)) }, ((v_Vuna_dCompiler_dIr_dCps_dmStepsFields (fuel - 1)) dtb__925)))
  | _ -> failwith "DT: impossible branch"
)))
# 1661 "Vuna/Compiler/Ir/Cps.vuna"
and v_Vuna_dCompiler_dIr_dCps_dmStepsAlts = (fun (fuel : int) (alts : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrAlt Base_dData_dList.t_Base_dData_dList_dList) -> (if (fuel <= 0) then alts else (match alts with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__926, dtb__927) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltCtor = (dtb__926).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltCtor; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBinders = (dtb__926).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBinders; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBody = ((v_Vuna_dCompiler_dIr_dCps_dmSteps (fuel - 1)) (dtb__926).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBody) }, ((v_Vuna_dCompiler_dIr_dCps_dmStepsAlts (fuel - 1)) dtb__927)))
  | _ -> failwith "DT: impossible branch"
)))
# 1670 "Vuna/Compiler/Ir/Cps.vuna"
and v_Vuna_dCompiler_dIr_dCps_dmStepsAltM = (fun (fuel : int) (m : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrAlt Base_dData_dMaybe.t_Base_dData_dMaybe_dMaybe) -> (if (fuel <= 0) then m else (match m with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__928) -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ({ Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltCtor = (dtb__928).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltCtor; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBinders = (dtb__928).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBinders; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBody = ((v_Vuna_dCompiler_dIr_dCps_dmSteps (fuel - 1)) (dtb__928).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBody) }))
  | _ -> failwith "DT: impossible branch"
)))
# 1680 "Vuna/Compiler/Ir/Cps.vuna"
and v_Vuna_dCompiler_dIr_dCps_dfoldAppMap = (fun (fuel : int) (acc : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIr) (xs : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIr Base_dData_dList.t_Base_dData_dList_dList) -> (if (fuel <= 0) then acc else (match xs with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> acc
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__929, dtb__930) -> (((v_Vuna_dCompiler_dIr_dCps_dfoldAppMap (fuel - 1)) (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, acc, ((v_Vuna_dCompiler_dIr_dCps_dmSteps (fuel - 1)) dtb__929)))) dtb__930)
  | _ -> failwith "DT: impossible branch"
)))

# 1689 "Vuna/Compiler/Ir/Cps.vuna"
let v_Vuna_dCompiler_dIr_dCps_dmStepsDef = (fun (mc0 : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrDef) -> (match mc0 with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrDef_IrDef (dtb__931, dtb__932, dtb__933, dtb__934, dtb__935, dtb__936, dtb__937, dtb__938) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrDef_IrDef (dtb__931, dtb__932, dtb__933, Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, ((v_Vuna_dCompiler_dIr_dCps_dmSteps v_Vuna_dCompiler_dIr_dCps_dstartFuel) dtb__935), dtb__936, dtb__937, dtb__938))
  | _ -> mc0
))

# 1708 "Vuna/Compiler/Ir/Cps.vuna"
let v_Vuna_dCompiler_dIr_dCps_dcpsUnit = (fun (u : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrUnit) -> (match ((v_Vuna_dCompiler_dIr_dCps_dtransformGroups v_Vuna_dCompiler_dIr_dCps_dstartFuel) (u).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrUnit_irUnitGroups) with
  | Base_dData_dResult.C_Base_dData_dResult_dResult_Err (dtb__939) -> (Base_dData_dResult.C_Base_dData_dResult_dResult_Err (dtb__939))
  | Base_dData_dResult.C_Base_dData_dResult_dResult_Ok (dtb__940) -> (Base_dData_dResult.C_Base_dData_dResult_dResult_Ok ({ Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrUnit_irUnitTyDecls = (u).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrUnit_irUnitTyDecls; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrUnit_irUnitGroups = dtb__940; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrUnit_irUnitHasListFamily = (u).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrUnit_irUnitHasListFamily; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrUnit_irUnitTypeRefs = (u).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrUnit_irUnitTypeRefs; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrUnit_irUnitEntry = (u).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrUnit_irUnitEntry }))
  | _ -> failwith "DT: impossible branch"
))

# 1716 "Vuna/Compiler/Ir/Cps.vuna"
let v_Vuna_dCompiler_dIr_dCps_dcpsDefs = (fun (defs : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrDef Base_dData_dList.t_Base_dData_dList_dList) -> ((v_Vuna_dCompiler_dIr_dCps_dtransformDefs v_Vuna_dCompiler_dIr_dCps_dstartFuel) defs))

# 1693 "Vuna/Compiler/Ir/Cps.vuna"
let v_Vuna_dCompiler_dIr_dCps_dcpsDefsMachine = (fun (defs : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrDef Base_dData_dList.t_Base_dData_dList_dList) -> (match (v_Vuna_dCompiler_dIr_dCps_dcpsDefs defs) with
  | Base_dData_dResult.C_Base_dData_dResult_dResult_Err (dtb__941) -> (Base_dData_dResult.C_Base_dData_dResult_dResult_Err (dtb__941))
  | Base_dData_dResult.C_Base_dData_dResult_dResult_Ok (dtb__942) -> (Base_dData_dResult.C_Base_dData_dResult_dResult_Ok (((Base_dData_dList.v_Base_dData_dList_dmap v_Vuna_dCompiler_dIr_dCps_dmStepsDef) ((Base_dData_dList.v_Base_dData_dList_dmap v_Vuna_dCompiler_dIr_dCps_dmApplysDef) ((Base_dData_dList.v_Base_dData_dList_dmap v_Vuna_dCompiler_dIr_dCps_dmMarkedDef) (((v_Vuna_dCompiler_dIr_dCps_dmDefs ((v_Vuna_dCompiler_dIr_dCps_dcollectHandleOpsDefs 100000) dtb__942)) v_Vuna_dCompiler_dIr_dCps_dstartFuel) dtb__942))))))
  | _ -> failwith "DT: impossible branch"
))

# 1701 "Vuna/Compiler/Ir/Cps.vuna"
let v_Vuna_dCompiler_dIr_dCps_dcpsDefsStep = (fun (defs : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrDef Base_dData_dList.t_Base_dData_dList_dList) -> (match (v_Vuna_dCompiler_dIr_dCps_dcpsDefs defs) with
  | Base_dData_dResult.C_Base_dData_dResult_dResult_Err (dtb__943) -> (Base_dData_dResult.C_Base_dData_dResult_dResult_Err (dtb__943))
  | Base_dData_dResult.C_Base_dData_dResult_dResult_Ok (dtb__944) -> ((v_Vuna_dCompiler_dIr_dCps_dselDefs v_Vuna_dCompiler_dIr_dCps_dstartFuel) dtb__944)
  | _ -> failwith "DT: impossible branch"
))
