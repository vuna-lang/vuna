open Vuna_runtime
type t_Vuna_dCompiler_dIr_dCps_dHandlerTables = { f_Vuna_dCompiler_dIr_dCps_dHandlerTables_htArities : (string, int) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList; f_Vuna_dCompiler_dIr_dCps_dHandlerTables_htSigs : (string, Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrTy Base_dData_dMaybe.t_Base_dData_dMaybe_dMaybe) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList }

# 33 "Vuna/Compiler/Ir/Cps.vuna"
let v_Vuna_dCompiler_dIr_dCps_dirCpsPerformName = "@ir@cps@perform"

# 36 "Vuna/Compiler/Ir/Cps.vuna"
let v_Vuna_dCompiler_dIr_dCps_dirCpsHandleName = "@ir@cps@handle"

# 39 "Vuna/Compiler/Ir/Cps.vuna"
let v_Vuna_dCompiler_dIr_dCps_dirCpsSelfName = "@ir@cps@self"

# 42 "Vuna/Compiler/Ir/Cps.vuna"
let v_Vuna_dCompiler_dIr_dCps_dirMPerformName = "@ir@m@perform"

# 45 "Vuna/Compiler/Ir/Cps.vuna"
let v_Vuna_dCompiler_dIr_dCps_dirMHandleName = "@ir@m@handle"

# 48 "Vuna/Compiler/Ir/Cps.vuna"
let v_Vuna_dCompiler_dIr_dCps_dirMSelfName = "@ir@m@self"

# 53 "Vuna/Compiler/Ir/Cps.vuna"
let v_Vuna_dCompiler_dIr_dCps_dirMApplyName = "@ir@m@apply"

# 56 "Vuna/Compiler/Ir/Cps.vuna"
let v_Vuna_dCompiler_dIr_dCps_dirMRunEffName = "@ir@m@runEff"

# 59 "Vuna/Compiler/Ir/Cps.vuna"
let v_Vuna_dCompiler_dIr_dCps_dirMRunName = "@ir@m@run"

# 62 "Vuna/Compiler/Ir/Cps.vuna"
let v_Vuna_dCompiler_dIr_dCps_dirMDoneName = "@ir@m@done"

# 66 "Vuna/Compiler/Ir/Cps.vuna"
let v_Vuna_dCompiler_dIr_dCps_dirScopedTypeName = "Base.Effect.Core.Scoped"

# 69 "Vuna/Compiler/Ir/Cps.vuna"
let v_Vuna_dCompiler_dIr_dCps_dirScopedMkCtor = "Base.Effect.Core.Scoped.MkScoped"

# 73 "Vuna/Compiler/Ir/Cps.vuna"
let v_Vuna_dCompiler_dIr_dCps_drunThunkName = "Base.Effect.Core.runThunk"

# 76 "Vuna/Compiler/Ir/Cps.vuna"
let v_Vuna_dCompiler_dIr_dCps_drunPureName = "Base.Effect.Core.runPure"

# 79 "Vuna/Compiler/Ir/Cps.vuna"
let v_Vuna_dCompiler_dIr_dCps_drunEffName = "Base.Effect.Core.runEff"

# 82 "Vuna/Compiler/Ir/Cps.vuna"
let v_Vuna_dCompiler_dIr_dCps_drunMainName = "Base.Effect.Core.runMain"

# 85 "Vuna/Compiler/Ir/Cps.vuna"
let v_Vuna_dCompiler_dIr_dCps_dhandleScopedName = "Base.Effect.Core.handleScoped"

# 90 "Vuna/Compiler/Ir/Cps.vuna"
let v_Vuna_dCompiler_dIr_dCps_dcpsFuelBase = 64

# 93 "Vuna/Compiler/Ir/Cps.vuna"
let v_Vuna_dCompiler_dIr_dCps_dcpsFuelOfBody = (fun (body : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIr) -> (v_Vuna_dCompiler_dIr_dCps_dcpsFuelBase + (8 * (Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirSize body))))

# 96 "Vuna/Compiler/Ir/Cps.vuna"
let rec v_Vuna_dCompiler_dIr_dCps_dcpsDefsSize = (fun (mc0 : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrDef Base_dData_dList.t_Base_dData_dList_dList) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__0, dtb__1) -> (match (Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirDefBody dtb__0) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (1 + (v_Vuna_dCompiler_dIr_dCps_dcpsDefsSize dtb__1))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__2) -> ((1 + (Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirSize dtb__2)) + (v_Vuna_dCompiler_dIr_dCps_dcpsDefsSize dtb__1))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))

# 103 "Vuna/Compiler/Ir/Cps.vuna"
let v_Vuna_dCompiler_dIr_dCps_dcpsFuelOfDefs = (fun (defs : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrDef Base_dData_dList.t_Base_dData_dList_dList) -> (v_Vuna_dCompiler_dIr_dCps_dcpsFuelBase + (8 * (v_Vuna_dCompiler_dIr_dCps_dcpsDefsSize defs))))

# 109 "Vuna/Compiler/Ir/Cps.vuna"
let v_Vuna_dCompiler_dIr_dCps_dbNameEq = (fun (mc0 : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrBName) (mc1 : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrBName) -> (match mc0 with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrBName_IrBWild -> (match mc1 with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrBName_IrBWild -> true
  | _ -> false
)
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrBName_IrBNat (dtb__3) -> (match mc1 with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrBName_IrBNat (dtb__4) -> (dtb__3 = dtb__4)
  | _ -> false
)
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrBName_IrBArm (dtb__5) -> (match mc1 with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrBName_IrBArm (dtb__6) -> (dtb__5 = dtb__6)
  | _ -> false
)
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrBName_IrBUser (dtb__7) -> (match mc1 with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrBName_IrBUser (dtb__8) -> (dtb__7 = dtb__8)
  | _ -> false
)
  | _ -> failwith "DT: impossible branch"
))

# 116 "Vuna/Compiler/Ir/Cps.vuna"
let v_Vuna_dCompiler_dIr_dCps_dbinderEq = (fun (mc0 : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrBinder) (mc1 : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrBinder) -> (match mc0 with
  | { Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrBinder_irBinderName = dtb__9; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrBinder_irBinderErased = dtb__10; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrBinder_irBinderTy = dtb__11 } -> (match mc1 with
  | { Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrBinder_irBinderName = dtb__12; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrBinder_irBinderErased = dtb__13; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrBinder_irBinderTy = dtb__14 } -> (if ((v_Vuna_dCompiler_dIr_dCps_dbNameEq dtb__9) dtb__12) then (((Base_dTrait_dEq.v_Base_dTrait_dEq_d_x61__x61_ Base_dTrait_dEq.v_Eq_uBase_uData_uBool_uBool) dtb__10) dtb__13) else false)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 119 "Vuna/Compiler/Ir/Cps.vuna"
let rec v_Vuna_dCompiler_dIr_dCps_dmemBinder = (fun (mc0 : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrBinder) (mc1 : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrBinder Base_dData_dList.t_Base_dData_dList_dList) -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__15, dtb__16) -> (if ((v_Vuna_dCompiler_dIr_dCps_dbinderEq mc0) dtb__15) then true else ((v_Vuna_dCompiler_dIr_dCps_dmemBinder mc0) dtb__16))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 123 "Vuna/Compiler/Ir/Cps.vuna"
let v_Vuna_dCompiler_dIr_dCps_dbinderErased = (fun (mc0 : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrBinder) -> (match mc0 with
  | { Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrBinder_irBinderName = dtb__17; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrBinder_irBinderErased = dtb__18; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrBinder_irBinderTy = dtb__19 } -> dtb__18
  | _ -> failwith "DT: impossible branch"
))

# 127 "Vuna/Compiler/Ir/Cps.vuna"
let v_Vuna_dCompiler_dIr_dCps_druntimeBinders = (fun (bs : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrBinder Base_dData_dList.t_Base_dData_dList_dList) -> ((Base_dData_dList.v_Base_dData_dList_dfilter (fun (b : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrBinder) -> (Base_dData_dBool.v_Base_dData_dBool_dnot (v_Vuna_dCompiler_dIr_dCps_dbinderErased b)))) bs))

# 130 "Vuna/Compiler/Ir/Cps.vuna"
let v_Vuna_dCompiler_dIr_dCps_dmkBinder = (fun (name : string) -> (Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dmkIrBinder name))

# 135 "Vuna/Compiler/Ir/Cps.vuna"
let v_Vuna_dCompiler_dIr_dCps_dfreshV = (fun (fuel : int) -> (v_Vuna_dCompiler_dIr_dCps_dmkBinder ("__cpsV" ^ (bi_strFromInt fuel))))

# 138 "Vuna/Compiler/Ir/Cps.vuna"
let v_Vuna_dCompiler_dIr_dCps_dfreshK = (fun (fuel : int) -> (v_Vuna_dCompiler_dIr_dCps_dmkBinder ("__cpsK" ^ (bi_strFromInt fuel))))

# 141 "Vuna/Compiler/Ir/Cps.vuna"
let v_Vuna_dCompiler_dIr_dCps_dfreshU = (fun (fuel : int) -> (v_Vuna_dCompiler_dIr_dCps_dmkBinder ("__cpsU" ^ (bi_strFromInt fuel))))

# 144 "Vuna/Compiler/Ir/Cps.vuna"
let v_Vuna_dCompiler_dIr_dCps_dfreshA = (fun (fuel : int) (i : int) -> (v_Vuna_dCompiler_dIr_dCps_dmkBinder (String.concat "" ["__cpsA"; (bi_strFromInt fuel); "_"; (bi_strFromInt i)])))

# 147 "Vuna/Compiler/Ir/Cps.vuna"
let rec v_Vuna_dCompiler_dIr_dCps_dapplyAll = (fun (mc0 : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIr) (mc1 : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIr Base_dData_dList.t_Base_dData_dList_dList) -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__20, dtb__21) -> ((v_Vuna_dCompiler_dIr_dCps_dapplyAll (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, mc0, dtb__20))) dtb__21)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> mc0
  | _ -> failwith "DT: impossible branch"
))

# 151 "Vuna/Compiler/Ir/Cps.vuna"
let rec v_Vuna_dCompiler_dIr_dCps_dflattenApp = (fun (mc0 : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIr) -> (match mc0 with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (dtb__22, dtb__23, dtb__24) -> ((fun p -> { Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Base_dData_dPair.v_Base_dData_dPair_dfirstOf p); Base_dData_dPair.f_Base_dData_dPair_dPair_second = ((Base_dData_dList.v_Base_dData_dList_dappend (Base_dData_dPair.v_Base_dData_dPair_dsecondOf p)) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__24, Base_dData_dList.C_Base_dData_dList_dList_Nil))) }) (v_Vuna_dCompiler_dIr_dCps_dflattenApp dtb__23))
  | _ -> { Base_dData_dPair.f_Base_dData_dPair_dPair_first = mc0; Base_dData_dPair.f_Base_dData_dPair_dPair_second = Base_dData_dList.C_Base_dData_dList_dList_Nil }
))

# 196 "Vuna/Compiler/Ir/Cps.vuna"
let v_Vuna_dCompiler_dIr_dCps_disThunkCtor = (fun (family : string) (ctor : string) -> (if (if (family = Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirEffTypeName) then (ctor = Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirEffMkCtor) else false) then true else (if (family = v_Vuna_dCompiler_dIr_dCps_dirScopedTypeName) then (ctor = v_Vuna_dCompiler_dIr_dCps_dirScopedMkCtor) else false)))

# 201 "Vuna/Compiler/Ir/Cps.vuna"
let v_Vuna_dCompiler_dIr_dCps_disThunkAlt = (fun (alt : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrAlt) -> ((fun nd_uscrut1 -> (match nd_uscrut1 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> false
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__25) -> (match dtb__25 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__26; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__27 } -> ((v_Vuna_dCompiler_dIr_dCps_disThunkCtor dtb__26) dtb__27)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) (alt).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltCtor))

# 208 "Vuna/Compiler/Ir/Cps.vuna"
let v_Vuna_dCompiler_dIr_dCps_dthunkBindersOfAlt = (fun (alt : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrAlt) -> (if (v_Vuna_dCompiler_dIr_dCps_disThunkAlt alt) then (v_Vuna_dCompiler_dIr_dCps_druntimeBinders (alt).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBinders) else Base_dData_dList.C_Base_dData_dList_dList_Nil))

# 159 "Vuna/Compiler/Ir/Cps.vuna"
let rec v_Vuna_dCompiler_dIr_dCps_dmapDirect = (fun (fuel : int) (xs : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIr Base_dData_dList.t_Base_dData_dList_dList) -> (if (fuel <= 0) then xs else (match xs with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__28, dtb__29) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (((v_Vuna_dCompiler_dIr_dCps_dtransformDirect (fuel - 1)) dtb__28), ((v_Vuna_dCompiler_dIr_dCps_dmapDirect (fuel - 1)) dtb__29)))
  | _ -> failwith "DT: impossible branch"
)))
# 168 "Vuna/Compiler/Ir/Cps.vuna"
and v_Vuna_dCompiler_dIr_dCps_dmapAltDirect = (fun (fuel : int) (xs : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrAlt Base_dData_dList.t_Base_dData_dList_dList) -> (if (fuel <= 0) then xs else (match xs with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__30, dtb__31) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (((v_Vuna_dCompiler_dIr_dCps_dtransformAltDirect (fuel - 1)) dtb__30), ((v_Vuna_dCompiler_dIr_dCps_dmapAltDirect (fuel - 1)) dtb__31)))
  | _ -> failwith "DT: impossible branch"
)))
# 177 "Vuna/Compiler/Ir/Cps.vuna"
and v_Vuna_dCompiler_dIr_dCps_dmapAltCps = (fun (fuel : int) (env : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrBinder Base_dData_dList.t_Base_dData_dList_dList) (xs : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrAlt Base_dData_dList.t_Base_dData_dList_dList) (k : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIr) -> (if (fuel <= 0) then xs else (match xs with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__32, dtb__33) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (((((v_Vuna_dCompiler_dIr_dCps_dcpsAlt (fuel - 1)) env) dtb__32) k), ((((v_Vuna_dCompiler_dIr_dCps_dmapAltCps (fuel - 1)) env) dtb__33) k)))
  | _ -> failwith "DT: impossible branch"
)))
# 186 "Vuna/Compiler/Ir/Cps.vuna"
and v_Vuna_dCompiler_dIr_dCps_dmapFieldsDirect = (fun (fuel : int) (xs : (string, Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIr) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) -> (if (fuel <= 0) then xs else (match xs with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__34, dtb__35) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Base_dData_dPair.v_Base_dData_dPair_dfirstOf dtb__34); Base_dData_dPair.f_Base_dData_dPair_dPair_second = ((v_Vuna_dCompiler_dIr_dCps_dtransformDirect (fuel - 1)) (Base_dData_dPair.v_Base_dData_dPair_dsecondOf dtb__34)) }, ((v_Vuna_dCompiler_dIr_dCps_dmapFieldsDirect (fuel - 1)) dtb__35)))
  | _ -> failwith "DT: impossible branch"
)))
# 223 "Vuna/Compiler/Ir/Cps.vuna"
and v_Vuna_dCompiler_dIr_dCps_dcpsExpr = (fun (fuel : int) (env : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrBinder Base_dData_dList.t_Base_dData_dList_dList) (e : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIr) (k : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIr) -> (if (fuel <= 0) then (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, k, ((v_Vuna_dCompiler_dIr_dCps_dtransformDirect (fuel - 1)) e))) else (match e with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (dtb__36, dtb__37, dtb__38) -> ((((v_Vuna_dCompiler_dIr_dCps_dcpsApp (fuel - 1)) env) e) k)
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCase (dtb__39, dtb__40, dtb__41, dtb__42) -> ((fun v -> ((fun kCase -> ((((v_Vuna_dCompiler_dIr_dCps_dcpsExpr (fuel - 1)) env) dtb__41) kCase)) (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLam ((Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (v, Base_dData_dList.C_Base_dData_dList_dList_Nil)), Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCase (dtb__39, Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrVar (v)), ((((v_Vuna_dCompiler_dIr_dCps_dmapAltCps (fuel - 1)) env) dtb__42) k))))))) (v_Vuna_dCompiler_dIr_dCps_dfreshV fuel))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrNatCase (dtb__43, dtb__44, dtb__45, dtb__46, dtb__47) -> ((fun v -> ((fun kCase -> ((((v_Vuna_dCompiler_dIr_dCps_dcpsExpr (fuel - 1)) env) dtb__43) kCase)) (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLam ((Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (v, Base_dData_dList.C_Base_dData_dList_dList_Nil)), Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrNatCase ((Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrVar (v)), dtb__44, ((((v_Vuna_dCompiler_dIr_dCps_dcpsAltMaybe (fuel - 1)) env) dtb__45) k), ((((v_Vuna_dCompiler_dIr_dCps_dcpsAltMaybe (fuel - 1)) env) dtb__46) k), ((((v_Vuna_dCompiler_dIr_dCps_dcpsAltMaybe (fuel - 1)) env) dtb__47) k))))))) (v_Vuna_dCompiler_dIr_dCps_dfreshV fuel))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrIf (dtb__48, dtb__49, dtb__50) -> ((fun v -> ((fun kIf -> ((((v_Vuna_dCompiler_dIr_dCps_dcpsExpr (fuel - 1)) env) dtb__48) kIf)) (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLam ((Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (v, Base_dData_dList.C_Base_dData_dList_dList_Nil)), Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrIf ((Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrVar (v)), ((((v_Vuna_dCompiler_dIr_dCps_dcpsExpr (fuel - 1)) env) dtb__49) k), ((((v_Vuna_dCompiler_dIr_dCps_dcpsExpr (fuel - 1)) env) dtb__50) k))))))) (v_Vuna_dCompiler_dIr_dCps_dfreshV fuel))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLet (dtb__51, dtb__52, dtb__53) -> ((fun v -> ((fun kLet -> ((((v_Vuna_dCompiler_dIr_dCps_dcpsExpr (fuel - 1)) env) dtb__52) kLet)) (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLam ((Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (v, Base_dData_dList.C_Base_dData_dList_dList_Nil)), Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLet (dtb__51, (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrVar (v)), ((((v_Vuna_dCompiler_dIr_dCps_dcpsExpr (fuel - 1)) env) dtb__53) k))))))) (v_Vuna_dCompiler_dIr_dCps_dfreshV fuel))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCast (dtb__54, dtb__55, dtb__56) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCast (dtb__54, dtb__55, ((((v_Vuna_dCompiler_dIr_dCps_dcpsExpr (fuel - 1)) env) dtb__56) k)))
  | _ -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, k, ((v_Vuna_dCompiler_dIr_dCps_dtransformDirect (fuel - 1)) e)))
)))
# 253 "Vuna/Compiler/Ir/Cps.vuna"
and v_Vuna_dCompiler_dIr_dCps_dcpsAlt = (fun (fuel : int) (env : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrBinder Base_dData_dList.t_Base_dData_dList_dList) (alt : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrAlt) (k : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIr) -> (if (fuel <= 0) then alt else ((fun env1 -> { Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltCtor = (alt).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltCtor; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBinders = (alt).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBinders; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBody = ((((v_Vuna_dCompiler_dIr_dCps_dcpsExpr (fuel - 1)) env1) (alt).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBody) k) }) ((Base_dData_dList.v_Base_dData_dList_dappend (v_Vuna_dCompiler_dIr_dCps_dthunkBindersOfAlt alt)) env))))
# 262 "Vuna/Compiler/Ir/Cps.vuna"
and v_Vuna_dCompiler_dIr_dCps_dcpsAltMaybe = (fun (fuel : int) (env : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrBinder Base_dData_dList.t_Base_dData_dList_dList) (m : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrAlt Base_dData_dMaybe.t_Base_dData_dMaybe_dMaybe) (k : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIr) -> (if (fuel <= 0) then m else (match m with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__57) -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (((((v_Vuna_dCompiler_dIr_dCps_dcpsAlt (fuel - 1)) env) dtb__57) k)))
  | _ -> failwith "DT: impossible branch"
)))
# 272 "Vuna/Compiler/Ir/Cps.vuna"
and v_Vuna_dCompiler_dIr_dCps_dcpsArgs = (fun (fuel : int) (env : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrBinder Base_dData_dList.t_Base_dData_dList_dList) (args : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIr Base_dData_dList.t_Base_dData_dList_dList) (head : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIr) (acc : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIr Base_dData_dList.t_Base_dData_dList_dList) (k : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIr) -> (if (fuel <= 0) then (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, k, ((v_Vuna_dCompiler_dIr_dCps_dapplyAll head) (Base_dData_dList.v_Base_dData_dList_dreverse acc)))) else (match args with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, k, ((v_Vuna_dCompiler_dIr_dCps_dapplyAll head) (Base_dData_dList.v_Base_dData_dList_dreverse acc))))
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__58, dtb__59) -> ((fun v -> ((((v_Vuna_dCompiler_dIr_dCps_dcpsExpr (fuel - 1)) env) dtb__58) (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLam ((Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (v, Base_dData_dList.C_Base_dData_dList_dList_Nil)), Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, ((((((v_Vuna_dCompiler_dIr_dCps_dcpsArgs (fuel - 1)) env) dtb__59) head) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ((Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrVar (v)), acc))) k))))) (v_Vuna_dCompiler_dIr_dCps_dfreshV fuel))
  | _ -> failwith "DT: impossible branch"
)))
# 285 "Vuna/Compiler/Ir/Cps.vuna"
and v_Vuna_dCompiler_dIr_dCps_dcpsThunkCall = (fun (fuel : int) (head : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIr) (args : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIr Base_dData_dList.t_Base_dData_dList_dList) (k : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIr) -> (if (fuel <= 0) then ((v_Vuna_dCompiler_dIr_dCps_dapplyAll head) ((Base_dData_dList.v_Base_dData_dList_dappend args) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (k, Base_dData_dList.C_Base_dData_dList_dList_Nil)))) else ((v_Vuna_dCompiler_dIr_dCps_dapplyAll ((v_Vuna_dCompiler_dIr_dCps_dtransformDirect (fuel - 1)) head)) ((Base_dData_dList.v_Base_dData_dList_dappend ((v_Vuna_dCompiler_dIr_dCps_dmapDirect (fuel - 1)) args)) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (k, Base_dData_dList.C_Base_dData_dList_dList_Nil))))))
# 293 "Vuna/Compiler/Ir/Cps.vuna"
and v_Vuna_dCompiler_dIr_dCps_dcpsApp = (fun (fuel : int) (env : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrBinder Base_dData_dList.t_Base_dData_dList_dList) (e : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIr) (k : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIr) -> (if (fuel <= 0) then (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, k, e)) else ((fun p -> ((fun head -> ((fun args -> ((fun v -> (match head with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrVar (dtb__60) -> (if ((v_Vuna_dCompiler_dIr_dCps_dmemBinder dtb__60) env) then ((((v_Vuna_dCompiler_dIr_dCps_dcpsThunkCall (fuel - 1)) head) args) k) else ((((v_Vuna_dCompiler_dIr_dCps_dcpsExpr (fuel - 1)) env) head) (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLam ((Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (v, Base_dData_dList.C_Base_dData_dList_dList_Nil)), Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, ((((((v_Vuna_dCompiler_dIr_dCps_dcpsArgs (fuel - 1)) env) args) (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrVar (v))) Base_dData_dList.C_Base_dData_dList_dList_Nil) k)))))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrGlobal (dtb__61) -> (if (dtb__61 = v_Vuna_dCompiler_dIr_dCps_drunThunkName) then ((((v_Vuna_dCompiler_dIr_dCps_dcpsThunkCall (fuel - 1)) head) args) k) else ((((v_Vuna_dCompiler_dIr_dCps_dcpsExpr (fuel - 1)) env) head) (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLam ((Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (v, Base_dData_dList.C_Base_dData_dList_dList_Nil)), Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, ((((((v_Vuna_dCompiler_dIr_dCps_dcpsArgs (fuel - 1)) env) args) (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrVar (v))) Base_dData_dList.C_Base_dData_dList_dList_Nil) k)))))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRt (dtb__62) -> (if (dtb__62 = "prim_effectPerformId") then ((((v_Vuna_dCompiler_dIr_dCps_dcpsThunkCall (fuel - 1)) (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRt (v_Vuna_dCompiler_dIr_dCps_dirCpsPerformName))) args) k) else (if (dtb__62 = "prim_effectHandleId") then ((((v_Vuna_dCompiler_dIr_dCps_dcpsThunkCall (fuel - 1)) (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRt (v_Vuna_dCompiler_dIr_dCps_dirCpsHandleName))) args) k) else (if (dtb__62 = "prim_effectSelf") then ((((v_Vuna_dCompiler_dIr_dCps_dcpsThunkCall (fuel - 1)) (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRt (v_Vuna_dCompiler_dIr_dCps_dirCpsSelfName))) args) k) else ((((v_Vuna_dCompiler_dIr_dCps_dcpsExpr (fuel - 1)) env) head) (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLam ((Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (v, Base_dData_dList.C_Base_dData_dList_dList_Nil)), Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, ((((((v_Vuna_dCompiler_dIr_dCps_dcpsArgs (fuel - 1)) env) args) (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrVar (v))) Base_dData_dList.C_Base_dData_dList_dList_Nil) k)))))))
  | _ -> ((((v_Vuna_dCompiler_dIr_dCps_dcpsExpr (fuel - 1)) env) head) (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLam ((Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (v, Base_dData_dList.C_Base_dData_dList_dList_Nil)), Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, ((((((v_Vuna_dCompiler_dIr_dCps_dcpsArgs (fuel - 1)) env) args) (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrVar (v))) Base_dData_dList.C_Base_dData_dList_dList_Nil) k))))
)) (v_Vuna_dCompiler_dIr_dCps_dfreshV fuel))) (Base_dData_dPair.v_Base_dData_dPair_dsecondOf p))) (Base_dData_dPair.v_Base_dData_dPair_dfirstOf p))) (v_Vuna_dCompiler_dIr_dCps_dflattenApp e))))
# 317 "Vuna/Compiler/Ir/Cps.vuna"
and v_Vuna_dCompiler_dIr_dCps_dtransformDirect = (fun (fuel : int) (e : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIr) -> (if (fuel <= 0) then e else (match e with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCtor (dtb__63, dtb__64, dtb__65, dtb__66) -> (if ((v_Vuna_dCompiler_dIr_dCps_disThunkCtor dtb__63) dtb__64) then ((fun nd_uscrut6 -> (match nd_uscrut6 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__67, dtb__68) -> (match dtb__67 with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLam (dtb__69, dtb__70, dtb__71) -> (match dtb__68 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> ((fun k -> ((fun body1 -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCtor (dtb__63, dtb__64, dtb__65, (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ((Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLam (((Base_dData_dList.v_Base_dData_dList_dappend dtb__69) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (k, Base_dData_dList.C_Base_dData_dList_dList_Nil))), Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, body1)), Base_dData_dList.C_Base_dData_dList_dList_Nil))))) ((((v_Vuna_dCompiler_dIr_dCps_dcpsExpr (fuel - 1)) Base_dData_dList.C_Base_dData_dList_dList_Nil) dtb__71) (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrVar (k))))) (v_Vuna_dCompiler_dIr_dCps_dfreshK fuel))
  | _ -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCtor (dtb__63, dtb__64, dtb__65, ((v_Vuna_dCompiler_dIr_dCps_dmapDirect (fuel - 1)) dtb__66)))
)
  | _ -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCtor (dtb__63, dtb__64, dtb__65, ((v_Vuna_dCompiler_dIr_dCps_dmapDirect (fuel - 1)) dtb__66)))
)
  | _ -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCtor (dtb__63, dtb__64, dtb__65, ((v_Vuna_dCompiler_dIr_dCps_dmapDirect (fuel - 1)) dtb__66)))
)) dtb__66) else (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCtor (dtb__63, dtb__64, dtb__65, ((v_Vuna_dCompiler_dIr_dCps_dmapDirect (fuel - 1)) dtb__66))))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrEffThunk (dtb__72, dtb__73, dtb__74, dtb__75, dtb__76) -> ((fun u -> ((fun k -> ((fun argBs -> ((fun applied -> ((fun inner -> (if (dtb__75 <= 0) then inner else (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLam (argBs, Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, inner)))) (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCtor (dtb__72, dtb__73, Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ((Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLam ((Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (u, (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (k, Base_dData_dList.C_Base_dData_dList_dList_Nil)))), Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrVar (k)), applied)))), Base_dData_dList.C_Base_dData_dList_dList_Nil)))))) ((v_Vuna_dCompiler_dIr_dCps_dapplyAll ((v_Vuna_dCompiler_dIr_dCps_dtransformDirect (fuel - 1)) dtb__76)) ((Base_dData_dList.v_Base_dData_dList_dmap (fun _heta0 -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrVar (_heta0)))) argBs)))) ((Base_dData_dList.v_Base_dData_dList_dmap (fun (i : int) -> ((v_Vuna_dCompiler_dIr_dCps_dfreshA fuel) i))) ((Base_dData_dList.v_Base_dData_dList_drange 0) dtb__75)))) (v_Vuna_dCompiler_dIr_dCps_dfreshK fuel))) (v_Vuna_dCompiler_dIr_dCps_dfreshU fuel))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRecord (dtb__77, dtb__78, dtb__79) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRecord (dtb__77, dtb__78, ((v_Vuna_dCompiler_dIr_dCps_dmapFieldsDirect (fuel - 1)) dtb__79)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrProj (dtb__80, dtb__81, dtb__82, dtb__83) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrProj (((v_Vuna_dCompiler_dIr_dCps_dtransformDirect (fuel - 1)) dtb__80), dtb__81, dtb__82, dtb__83))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRecUpd (dtb__84, dtb__85, dtb__86, dtb__87) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRecUpd (((v_Vuna_dCompiler_dIr_dCps_dtransformDirect (fuel - 1)) dtb__84), dtb__85, ((v_Vuna_dCompiler_dIr_dCps_dmapFieldsDirect (fuel - 1)) dtb__86), dtb__87))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRtApp (dtb__88, dtb__89) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRtApp (dtb__88, ((v_Vuna_dCompiler_dIr_dCps_dmapDirect (fuel - 1)) dtb__89)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCast (dtb__90, dtb__91, dtb__92) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCast (dtb__90, dtb__91, ((v_Vuna_dCompiler_dIr_dCps_dtransformDirect (fuel - 1)) dtb__92)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLet (dtb__93, dtb__94, dtb__95) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLet (dtb__93, ((v_Vuna_dCompiler_dIr_dCps_dtransformDirect (fuel - 1)) dtb__94), ((v_Vuna_dCompiler_dIr_dCps_dtransformDirect (fuel - 1)) dtb__95)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLam (dtb__96, dtb__97, dtb__98) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLam (dtb__96, dtb__97, ((v_Vuna_dCompiler_dIr_dCps_dtransformDirect (fuel - 1)) dtb__98)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (dtb__99, dtb__100, dtb__101) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (dtb__99, ((v_Vuna_dCompiler_dIr_dCps_dtransformDirect (fuel - 1)) dtb__100), ((v_Vuna_dCompiler_dIr_dCps_dtransformDirect (fuel - 1)) dtb__101)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrIf (dtb__102, dtb__103, dtb__104) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrIf (((v_Vuna_dCompiler_dIr_dCps_dtransformDirect (fuel - 1)) dtb__102), ((v_Vuna_dCompiler_dIr_dCps_dtransformDirect (fuel - 1)) dtb__103), ((v_Vuna_dCompiler_dIr_dCps_dtransformDirect (fuel - 1)) dtb__104)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCase (dtb__105, dtb__106, dtb__107, dtb__108) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCase (dtb__105, dtb__106, ((v_Vuna_dCompiler_dIr_dCps_dtransformDirect (fuel - 1)) dtb__107), ((v_Vuna_dCompiler_dIr_dCps_dmapAltDirect (fuel - 1)) dtb__108)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrNatCase (dtb__109, dtb__110, dtb__111, dtb__112, dtb__113) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrNatCase (((v_Vuna_dCompiler_dIr_dCps_dtransformDirect (fuel - 1)) dtb__109), dtb__110, ((v_Vuna_dCompiler_dIr_dCps_dtransformAltMaybe (fuel - 1)) dtb__111), ((v_Vuna_dCompiler_dIr_dCps_dtransformAltMaybe (fuel - 1)) dtb__112), ((v_Vuna_dCompiler_dIr_dCps_dtransformAltMaybe (fuel - 1)) dtb__113)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrConcatMany (dtb__114) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrConcatMany (((v_Vuna_dCompiler_dIr_dCps_dmapDirect (fuel - 1)) dtb__114)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrVar (dtb__115) -> e
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrGlobal (dtb__116) -> e
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRt (dtb__117) -> e
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrInt (dtb__118) -> e
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrStr (dtb__119) -> e
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrBool (dtb__120) -> e
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrFloatLit (dtb__121) -> e
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrEffBind (dtb__122, dtb__123, dtb__124) -> e
  | _ -> failwith "DT: impossible branch"
)))
# 363 "Vuna/Compiler/Ir/Cps.vuna"
and v_Vuna_dCompiler_dIr_dCps_dtransformAltDirect = (fun (fuel : int) (alt : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrAlt) -> (if (fuel <= 0) then alt else { Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltCtor = (alt).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltCtor; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBinders = (alt).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBinders; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBody = ((v_Vuna_dCompiler_dIr_dCps_dtransformDirect (fuel - 1)) (alt).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBody) }))
# 370 "Vuna/Compiler/Ir/Cps.vuna"
and v_Vuna_dCompiler_dIr_dCps_dtransformAltMaybe = (fun (fuel : int) (m : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrAlt Base_dData_dMaybe.t_Base_dData_dMaybe_dMaybe) -> (if (fuel <= 0) then m else (match m with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__125) -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (((v_Vuna_dCompiler_dIr_dCps_dtransformAltDirect (fuel - 1)) dtb__125)))
  | _ -> failwith "DT: impossible branch"
)))

# 212 "Vuna/Compiler/Ir/Cps.vuna"
let v_Vuna_dCompiler_dIr_dCps_didentityCont = ((fun v -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLam ((Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (v, Base_dData_dList.C_Base_dData_dList_dList_Nil)), Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrVar (v))))) (v_Vuna_dCompiler_dIr_dCps_dmkBinder "__cpsId"))

# 384 "Vuna/Compiler/Ir/Cps.vuna"
let rec v_Vuna_dCompiler_dIr_dCps_dtrampolineBody = (fun (mc0 : string) (mc1 : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIr) -> (match mc1 with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (dtb__126, dtb__127, dtb__128) -> (match dtb__127 with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (dtb__129, dtb__130, dtb__131) -> (match dtb__130 with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrGlobal (dtb__132) -> (if (dtb__132 = v_Vuna_dCompiler_dIr_dCps_drunThunkName) then (Base_dData_dResult.C_Base_dData_dResult_dResult_Ok (((v_Vuna_dCompiler_dIr_dCps_dapplyAll (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrGlobal (dtb__132))) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__131, (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__128, (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (v_Vuna_dCompiler_dIr_dCps_didentityCont, Base_dData_dList.C_Base_dData_dList_dList_Nil))))))))) else (Base_dData_dResult.C_Base_dData_dResult_dResult_Err (("CPS: unexpected trampoline shape: " ^ mc0))))
  | _ -> (Base_dData_dResult.C_Base_dData_dResult_dResult_Err (("CPS: unexpected trampoline shape: " ^ mc0)))
)
  | _ -> (Base_dData_dResult.C_Base_dData_dResult_dResult_Err (("CPS: unexpected trampoline shape: " ^ mc0)))
)
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCast (dtb__133, dtb__134, dtb__135) -> (match ((v_Vuna_dCompiler_dIr_dCps_dtrampolineBody mc0) dtb__135) with
  | Base_dData_dResult.C_Base_dData_dResult_dResult_Err (dtb__136) -> (Base_dData_dResult.C_Base_dData_dResult_dResult_Err (dtb__136))
  | Base_dData_dResult.C_Base_dData_dResult_dResult_Ok (dtb__137) -> (Base_dData_dResult.C_Base_dData_dResult_dResult_Ok ((Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCast (dtb__133, dtb__134, dtb__137))))
  | _ -> failwith "DT: impossible branch"
)
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLam (dtb__138, dtb__139, dtb__140) -> (match ((v_Vuna_dCompiler_dIr_dCps_dtrampolineBody mc0) dtb__140) with
  | Base_dData_dResult.C_Base_dData_dResult_dResult_Err (dtb__141) -> (Base_dData_dResult.C_Base_dData_dResult_dResult_Err (dtb__141))
  | Base_dData_dResult.C_Base_dData_dResult_dResult_Ok (dtb__142) -> (Base_dData_dResult.C_Base_dData_dResult_dResult_Ok ((Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLam (dtb__138, dtb__139, dtb__142))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> (Base_dData_dResult.C_Base_dData_dResult_dResult_Err (("CPS: unexpected trampoline shape: " ^ mc0)))
))

# 401 "Vuna/Compiler/Ir/Cps.vuna"
let rec v_Vuna_dCompiler_dIr_dCps_dselfAlt = (fun (fuel : int) (alt : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrAlt) (name : string) -> (if (fuel <= 0) then (Base_dData_dResult.C_Base_dData_dResult_dResult_Ok (alt)) else (match (((v_Vuna_dCompiler_dIr_dCps_dselfBody (fuel - 1)) (alt).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBody) name) with
  | Base_dData_dResult.C_Base_dData_dResult_dResult_Err (dtb__143) -> (Base_dData_dResult.C_Base_dData_dResult_dResult_Err (dtb__143))
  | Base_dData_dResult.C_Base_dData_dResult_dResult_Ok (dtb__144) -> (Base_dData_dResult.C_Base_dData_dResult_dResult_Ok ({ Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltCtor = (alt).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltCtor; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBinders = (alt).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBinders; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBody = dtb__144 }))
  | _ -> failwith "DT: impossible branch"
)))
# 410 "Vuna/Compiler/Ir/Cps.vuna"
and v_Vuna_dCompiler_dIr_dCps_dselfAlts = (fun (fuel : int) (alts : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrAlt Base_dData_dList.t_Base_dData_dList_dList) (name : string) -> (if (fuel <= 0) then (Base_dData_dResult.C_Base_dData_dResult_dResult_Ok (alts)) else (match alts with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Base_dData_dResult.C_Base_dData_dResult_dResult_Ok (Base_dData_dList.C_Base_dData_dList_dList_Nil))
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__145, dtb__146) -> (match (((v_Vuna_dCompiler_dIr_dCps_dselfAlt (fuel - 1)) dtb__145) name) with
  | Base_dData_dResult.C_Base_dData_dResult_dResult_Err (dtb__147) -> (Base_dData_dResult.C_Base_dData_dResult_dResult_Err (dtb__147))
  | Base_dData_dResult.C_Base_dData_dResult_dResult_Ok (dtb__148) -> (match (((v_Vuna_dCompiler_dIr_dCps_dselfAlts (fuel - 1)) dtb__146) name) with
  | Base_dData_dResult.C_Base_dData_dResult_dResult_Err (dtb__149) -> (Base_dData_dResult.C_Base_dData_dResult_dResult_Err (dtb__149))
  | Base_dData_dResult.C_Base_dData_dResult_dResult_Ok (dtb__150) -> (Base_dData_dResult.C_Base_dData_dResult_dResult_Ok ((Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__148, dtb__150))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))
# 425 "Vuna/Compiler/Ir/Cps.vuna"
and v_Vuna_dCompiler_dIr_dCps_dselfBody = (fun (fuel : int) (body : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIr) (name : string) -> (if (fuel <= 0) then (Base_dData_dResult.C_Base_dData_dResult_dResult_Ok (body)) else ((fun nd_uscrut3 -> (match nd_uscrut3 with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (dtb__151, dtb__152, dtb__153) -> (match dtb__152 with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRt (dtb__154) -> (if (dtb__154 = "prim_effectSelf") then (Base_dData_dResult.C_Base_dData_dResult_dResult_Ok (((v_Vuna_dCompiler_dIr_dCps_dapplyAll (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRt (v_Vuna_dCompiler_dIr_dCps_dirCpsSelfName))) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__153, (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (v_Vuna_dCompiler_dIr_dCps_didentityCont, Base_dData_dList.C_Base_dData_dList_dList_Nil))))))) else (Base_dData_dResult.C_Base_dData_dResult_dResult_Err (("CPS: unexpected handleScoped shape: " ^ name))))
  | _ -> (Base_dData_dResult.C_Base_dData_dResult_dResult_Err (("CPS: unexpected handleScoped shape: " ^ name)))
)
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCase (dtb__155, dtb__156, dtb__157, dtb__158) -> (match (((v_Vuna_dCompiler_dIr_dCps_dselfAlts (fuel - 1)) dtb__158) name) with
  | Base_dData_dResult.C_Base_dData_dResult_dResult_Err (dtb__159) -> (Base_dData_dResult.C_Base_dData_dResult_dResult_Err (dtb__159))
  | Base_dData_dResult.C_Base_dData_dResult_dResult_Ok (dtb__160) -> (Base_dData_dResult.C_Base_dData_dResult_dResult_Ok ((Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCase (dtb__155, dtb__156, dtb__157, dtb__160))))
  | _ -> failwith "DT: impossible branch"
)
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCast (dtb__161, dtb__162, dtb__163) -> (match (((v_Vuna_dCompiler_dIr_dCps_dselfBody (fuel - 1)) dtb__163) name) with
  | Base_dData_dResult.C_Base_dData_dResult_dResult_Err (dtb__164) -> (Base_dData_dResult.C_Base_dData_dResult_dResult_Err (dtb__164))
  | Base_dData_dResult.C_Base_dData_dResult_dResult_Ok (dtb__165) -> (Base_dData_dResult.C_Base_dData_dResult_dResult_Ok ((Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCast (dtb__161, dtb__162, dtb__165))))
  | _ -> failwith "DT: impossible branch"
)
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLam (dtb__166, dtb__167, dtb__168) -> (match (((v_Vuna_dCompiler_dIr_dCps_dselfBody (fuel - 1)) dtb__168) name) with
  | Base_dData_dResult.C_Base_dData_dResult_dResult_Err (dtb__169) -> (Base_dData_dResult.C_Base_dData_dResult_dResult_Err (dtb__169))
  | Base_dData_dResult.C_Base_dData_dResult_dResult_Ok (dtb__170) -> (Base_dData_dResult.C_Base_dData_dResult_dResult_Ok ((Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLam (dtb__166, dtb__167, dtb__170))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> (Base_dData_dResult.C_Base_dData_dResult_dResult_Err (("CPS: unexpected handleScoped shape: " ^ name)))
)) body)))

# 446 "Vuna/Compiler/Ir/Cps.vuna"
let v_Vuna_dCompiler_dIr_dCps_dtransformDef = (fun (fuel : int) (d : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrDef) -> (if (fuel <= 0) then (Base_dData_dResult.C_Base_dData_dResult_dResult_Ok (d)) else (match d with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrDef_IrExternDef (dtb__171, dtb__172, dtb__173, dtb__174) -> (Base_dData_dResult.C_Base_dData_dResult_dResult_Ok (d))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrDef_IrDef (dtb__175, dtb__176, dtb__177, dtb__178, dtb__179, dtb__180, dtb__181, dtb__182) -> (if (if (if (dtb__175 = v_Vuna_dCompiler_dIr_dCps_drunPureName) then true else (dtb__175 = v_Vuna_dCompiler_dIr_dCps_drunEffName)) then true else (dtb__175 = v_Vuna_dCompiler_dIr_dCps_drunMainName)) then (match ((v_Vuna_dCompiler_dIr_dCps_dtrampolineBody dtb__175) dtb__179) with
  | Base_dData_dResult.C_Base_dData_dResult_dResult_Err (dtb__183) -> (Base_dData_dResult.C_Base_dData_dResult_dResult_Err (dtb__183))
  | Base_dData_dResult.C_Base_dData_dResult_dResult_Ok (dtb__184) -> (Base_dData_dResult.C_Base_dData_dResult_dResult_Ok ((Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrDef_IrDef (dtb__175, dtb__176, dtb__177, dtb__178, dtb__184, dtb__180, dtb__181, dtb__182))))
  | _ -> failwith "DT: impossible branch"
) else (if (dtb__175 = v_Vuna_dCompiler_dIr_dCps_dhandleScopedName) then (match (((v_Vuna_dCompiler_dIr_dCps_dselfBody (fuel - 1)) dtb__179) dtb__175) with
  | Base_dData_dResult.C_Base_dData_dResult_dResult_Err (dtb__185) -> (Base_dData_dResult.C_Base_dData_dResult_dResult_Err (dtb__185))
  | Base_dData_dResult.C_Base_dData_dResult_dResult_Ok (dtb__186) -> (Base_dData_dResult.C_Base_dData_dResult_dResult_Ok ((Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrDef_IrDef (dtb__175, dtb__176, dtb__177, dtb__178, dtb__186, dtb__180, dtb__181, dtb__182))))
  | _ -> failwith "DT: impossible branch"
) else (Base_dData_dResult.C_Base_dData_dResult_dResult_Ok ((Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrDef_IrDef (dtb__175, dtb__176, dtb__177, dtb__178, ((v_Vuna_dCompiler_dIr_dCps_dtransformDirect (fuel - 1)) dtb__179), dtb__180, dtb__181, dtb__182))))))
  | _ -> failwith "DT: impossible branch"
)))

# 465 "Vuna/Compiler/Ir/Cps.vuna"
let rec v_Vuna_dCompiler_dIr_dCps_dtransformDefs = (fun (fuel : int) (xs : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrDef Base_dData_dList.t_Base_dData_dList_dList) -> (if (fuel <= 0) then (Base_dData_dResult.C_Base_dData_dResult_dResult_Ok (xs)) else (match xs with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Base_dData_dResult.C_Base_dData_dResult_dResult_Ok (Base_dData_dList.C_Base_dData_dList_dList_Nil))
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__187, dtb__188) -> (match ((v_Vuna_dCompiler_dIr_dCps_dtransformDef (fuel - 1)) dtb__187) with
  | Base_dData_dResult.C_Base_dData_dResult_dResult_Err (dtb__189) -> (Base_dData_dResult.C_Base_dData_dResult_dResult_Err (dtb__189))
  | Base_dData_dResult.C_Base_dData_dResult_dResult_Ok (dtb__190) -> (match ((v_Vuna_dCompiler_dIr_dCps_dtransformDefs (fuel - 1)) dtb__188) with
  | Base_dData_dResult.C_Base_dData_dResult_dResult_Err (dtb__191) -> (Base_dData_dResult.C_Base_dData_dResult_dResult_Err (dtb__191))
  | Base_dData_dResult.C_Base_dData_dResult_dResult_Ok (dtb__192) -> (Base_dData_dResult.C_Base_dData_dResult_dResult_Ok ((Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__190, dtb__192))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))

# 480 "Vuna/Compiler/Ir/Cps.vuna"
let v_Vuna_dCompiler_dIr_dCps_dtransformGroup = (fun (fuel : int) (g : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrGroup) -> (if (fuel <= 0) then (Base_dData_dResult.C_Base_dData_dResult_dResult_Ok (g)) else (match ((v_Vuna_dCompiler_dIr_dCps_dtransformDefs (fuel - 1)) (g).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrGroup_irGroupDefs) with
  | Base_dData_dResult.C_Base_dData_dResult_dResult_Err (dtb__193) -> (Base_dData_dResult.C_Base_dData_dResult_dResult_Err (dtb__193))
  | Base_dData_dResult.C_Base_dData_dResult_dResult_Ok (dtb__194) -> (Base_dData_dResult.C_Base_dData_dResult_dResult_Ok ({ Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrGroup_irGroupIsRec = (g).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrGroup_irGroupIsRec; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrGroup_irGroupDefs = dtb__194 }))
  | _ -> failwith "DT: impossible branch"
)))

# 489 "Vuna/Compiler/Ir/Cps.vuna"
let rec v_Vuna_dCompiler_dIr_dCps_dtransformGroups = (fun (fuel : int) (xs : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrGroup Base_dData_dList.t_Base_dData_dList_dList) -> (if (fuel <= 0) then (Base_dData_dResult.C_Base_dData_dResult_dResult_Ok (xs)) else (match xs with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Base_dData_dResult.C_Base_dData_dResult_dResult_Ok (Base_dData_dList.C_Base_dData_dList_dList_Nil))
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__195, dtb__196) -> (match ((v_Vuna_dCompiler_dIr_dCps_dtransformGroup (fuel - 1)) dtb__195) with
  | Base_dData_dResult.C_Base_dData_dResult_dResult_Err (dtb__197) -> (Base_dData_dResult.C_Base_dData_dResult_dResult_Err (dtb__197))
  | Base_dData_dResult.C_Base_dData_dResult_dResult_Ok (dtb__198) -> (match ((v_Vuna_dCompiler_dIr_dCps_dtransformGroups (fuel - 1)) dtb__196) with
  | Base_dData_dResult.C_Base_dData_dResult_dResult_Err (dtb__199) -> (Base_dData_dResult.C_Base_dData_dResult_dResult_Err (dtb__199))
  | Base_dData_dResult.C_Base_dData_dResult_dResult_Ok (dtb__200) -> (Base_dData_dResult.C_Base_dData_dResult_dResult_Ok ((Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__198, dtb__200))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))

# 507 "Vuna/Compiler/Ir/Cps.vuna"
let v_Vuna_dCompiler_dIr_dCps_dmBNameText = (fun (mc0 : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrBName) -> (match mc0 with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrBName_IrBWild -> "wild"
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrBName_IrBNat (dtb__201) -> ("nat" ^ (bi_strFromInt dtb__201))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrBName_IrBArm (dtb__202) -> ("arm" ^ (bi_strFromInt dtb__202))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrBName_IrBUser (dtb__203) -> dtb__203
  | _ -> failwith "DT: impossible branch"
))

# 513 "Vuna/Compiler/Ir/Cps.vuna"
let v_Vuna_dCompiler_dIr_dCps_dmIsOp = (fun (b : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrBinder) -> (match (b).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrBinder_irBinderName with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrBName_IrBUser (dtb__204) -> (dtb__204 = "@vuna@handle@o")
  | _ -> false
))

# 522 "Vuna/Compiler/Ir/Cps.vuna"
let rec v_Vuna_dCompiler_dIr_dCps_dmResumeGo = (fun (mc0 : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrBinder Base_dData_dList.t_Base_dData_dList_dList) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__205, dtb__206) -> (if (v_Vuna_dCompiler_dIr_dCps_dmIsOp dtb__205) then (match dtb__206 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__207, dtb__208) -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__207))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
) else (v_Vuna_dCompiler_dIr_dCps_dmResumeGo dtb__206))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 519 "Vuna/Compiler/Ir/Cps.vuna"
let v_Vuna_dCompiler_dIr_dCps_dmResumption = (fun (bs : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrBinder Base_dData_dList.t_Base_dData_dList_dList) -> (v_Vuna_dCompiler_dIr_dCps_dmResumeGo (v_Vuna_dCompiler_dIr_dCps_druntimeBinders bs)))

# 532 "Vuna/Compiler/Ir/Cps.vuna"
let rec v_Vuna_dCompiler_dIr_dCps_dmEraseHead = (fun (mc0 : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIr) -> (match mc0 with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCast (dtb__209, dtb__210, dtb__211) -> (v_Vuna_dCompiler_dIr_dCps_dmEraseHead dtb__211)
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (dtb__212, dtb__213, dtb__214) -> (match dtb__213 with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRt (dtb__215) -> (if (dtb__215 = "prim_erase") then (v_Vuna_dCompiler_dIr_dCps_dmEraseHead dtb__214) else mc0)
  | _ -> mc0
)
  | _ -> mc0
))

# 539 "Vuna/Compiler/Ir/Cps.vuna"
let rec v_Vuna_dCompiler_dIr_dCps_dmStripErase = (fun (mc0 : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIr) -> (match mc0 with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (dtb__216, dtb__217, dtb__218) -> (match dtb__217 with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRt (dtb__219) -> (if (dtb__219 = "prim_erase") then (v_Vuna_dCompiler_dIr_dCps_dmStripErase dtb__218) else (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRt (dtb__219)), dtb__218)))
  | _ -> mc0
)
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCast (dtb__220, dtb__221, dtb__222) -> (v_Vuna_dCompiler_dIr_dCps_dmStripErase dtb__222)
  | _ -> mc0
))

# 548 "Vuna/Compiler/Ir/Cps.vuna"
let v_Vuna_dCompiler_dIr_dCps_dmIsResumeAppGo = (fun (mc0 : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrBinder) (mc1 : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIr) -> (match mc1 with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (dtb__223, dtb__224, dtb__225) -> ((fun p -> (match (v_Vuna_dCompiler_dIr_dCps_dmEraseHead (Base_dData_dPair.v_Base_dData_dPair_dfirstOf p)) with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrVar (dtb__226) -> ((v_Vuna_dCompiler_dIr_dCps_dmBNameText (dtb__226).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrBinder_irBinderName) = (v_Vuna_dCompiler_dIr_dCps_dmBNameText (mc0).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrBinder_irBinderName))
  | _ -> (match (Base_dData_dPair.v_Base_dData_dPair_dsecondOf p) with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__227, dtb__228) -> (match (v_Vuna_dCompiler_dIr_dCps_dmEraseHead dtb__227) with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrVar (dtb__229) -> ((v_Vuna_dCompiler_dIr_dCps_dmBNameText (dtb__229).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrBinder_irBinderName) = (v_Vuna_dCompiler_dIr_dCps_dmBNameText (mc0).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrBinder_irBinderName))
  | _ -> false
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
)
)) (v_Vuna_dCompiler_dIr_dCps_dflattenApp mc1))
  | _ -> false
))

# 545 "Vuna/Compiler/Ir/Cps.vuna"
let v_Vuna_dCompiler_dIr_dCps_dmIsResumeApp = (fun (r : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrBinder) (e0 : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIr) -> ((v_Vuna_dCompiler_dIr_dCps_dmIsResumeAppGo r) (v_Vuna_dCompiler_dIr_dCps_dmStripErase e0)))

# 563 "Vuna/Compiler/Ir/Cps.vuna"
let v_Vuna_dCompiler_dIr_dCps_dmFreshV = (fun (n : int) -> (v_Vuna_dCompiler_dIr_dCps_dmkBinder ("__mchV" ^ (bi_strFromInt n))))

# 566 "Vuna/Compiler/Ir/Cps.vuna"
let v_Vuna_dCompiler_dIr_dCps_dmFreshK = (fun (n : int) -> (v_Vuna_dCompiler_dIr_dCps_dmkBinder ("__mchK" ^ (bi_strFromInt n))))

# 570 "Vuna/Compiler/Ir/Cps.vuna"
let v_Vuna_dCompiler_dIr_dCps_dmFreshTailK = (fun (n : int) -> (v_Vuna_dCompiler_dIr_dCps_dmkBinder ("__mchTK" ^ (bi_strFromInt n))))

# 573 "Vuna/Compiler/Ir/Cps.vuna"
let v_Vuna_dCompiler_dIr_dCps_dmFreshR = (fun (n : int) -> (v_Vuna_dCompiler_dIr_dCps_dmkBinder ("__mchR" ^ (bi_strFromInt n))))

# 578 "Vuna/Compiler/Ir/Cps.vuna"
let v_Vuna_dCompiler_dIr_dCps_disEffResultTy = (fun (mc0 : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrTy Base_dData_dMaybe.t_Base_dData_dMaybe_dMaybe) -> (match mc0 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__230) -> (match dtb__230 with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyData (dtb__231, dtb__232) -> (dtb__231 = Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirEffTypeName)
  | _ -> false
)
  | _ -> false
))

# 582 "Vuna/Compiler/Ir/Cps.vuna"
let v_Vuna_dCompiler_dIr_dCps_disEffContLambda = (fun (_uarity0 : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrTy Base_dData_dMaybe.t_Base_dData_dMaybe_dMaybe) -> (v_Vuna_dCompiler_dIr_dCps_disEffResultTy _uarity0))

# 586 "Vuna/Compiler/Ir/Cps.vuna"
let v_Vuna_dCompiler_dIr_dCps_disEffThunkBody = (fun (mc0 : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIr) -> (match mc0 with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCtor (dtb__233, dtb__234, dtb__235, dtb__236) -> (match dtb__236 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__237, dtb__238) -> (match dtb__237 with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLam (dtb__239, dtb__240, dtb__241) -> (match dtb__238 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (if (dtb__233 = Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirEffTypeName) then (dtb__234 = Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirEffMkCtor) else false)
  | _ -> false
)
  | _ -> false
)
  | _ -> false
)
  | _ -> false
))

# 592 "Vuna/Compiler/Ir/Cps.vuna"
let v_Vuna_dCompiler_dIr_dCps_dmRunEffTerm = (fun (eff : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIr) (k : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIr) -> ((fun th -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCase (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, eff, (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltCtor = (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirEffTypeName; Base_dData_dPair.f_Base_dData_dPair_dPair_second = Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirEffMkCtor })); Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBinders = (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (th, Base_dData_dList.C_Base_dData_dList_dList_Nil)); Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBody = (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRtApp (v_Vuna_dCompiler_dIr_dCps_dirMRunEffName, (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ((Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrVar (th)), (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (k, Base_dData_dList.C_Base_dData_dList_dList_Nil)))))) }, Base_dData_dList.C_Base_dData_dList_dList_Nil))))) (v_Vuna_dCompiler_dIr_dCps_dmkBinder "__mEffTh")))

# 602 "Vuna/Compiler/Ir/Cps.vuna"
let v_Vuna_dCompiler_dIr_dCps_dmNoResumption = (v_Vuna_dCompiler_dIr_dCps_dmkBinder "@vuna@noresume")

# 636 "Vuna/Compiler/Ir/Cps.vuna"
let v_Vuna_dCompiler_dIr_dCps_dmIsControl = (fun (mc0 : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIr) -> (match mc0 with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrNatCase (dtb__242, dtb__243, dtb__244, dtb__245, dtb__246) -> true
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrIf (dtb__247, dtb__248, dtb__249) -> true
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCase (dtb__250, dtb__251, dtb__252, dtb__253) -> true
  | _ -> false
))

# 688 "Vuna/Compiler/Ir/Cps.vuna"
let v_Vuna_dCompiler_dIr_dCps_disTailCont = (fun (e : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIr) -> (match e with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrVar (dtb__254) -> ((Base_dData_dString.v_Base_dData_dString_dstartsWith "__mchTK") (v_Vuna_dCompiler_dIr_dCps_dmBNameText (dtb__254).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrBinder_irBinderName))
  | _ -> false
))

# 607 "Vuna/Compiler/Ir/Cps.vuna"
let rec v_Vuna_dCompiler_dIr_dCps_dmEffContLambda = (fun (fuel : int) (r : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrBinder) (bs : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrBinder Base_dData_dList.t_Base_dData_dList_dList) (rt : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrTy Base_dData_dMaybe.t_Base_dData_dMaybe_dMaybe) (body : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIr) -> ((fun kd -> ((fun u -> ((fun v -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLam (bs, rt, (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCtor (Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirEffTypeName, Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirEffMkCtor, Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ((Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLam ((Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (u, (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (kd, Base_dData_dList.C_Base_dData_dList_dList_Nil)))), Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, ((((v_Vuna_dCompiler_dIr_dCps_dmCps (fuel - 1)) r) (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLam ((Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (v, Base_dData_dList.C_Base_dData_dList_dList_Nil)), Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, ((v_Vuna_dCompiler_dIr_dCps_dmRunEffTerm (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrVar (v))) (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrVar (kd)))))) body))), Base_dData_dList.C_Base_dData_dList_dList_Nil))))))) (v_Vuna_dCompiler_dIr_dCps_dmFreshV fuel))) (v_Vuna_dCompiler_dIr_dCps_dmkBinder "__mEffU"))) (v_Vuna_dCompiler_dIr_dCps_dmFreshK fuel)))
# 618 "Vuna/Compiler/Ir/Cps.vuna"
and v_Vuna_dCompiler_dIr_dCps_dmCpsAlts = (fun (fuel : int) (r : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrBinder) (k : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIr) (alts : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrAlt Base_dData_dList.t_Base_dData_dList_dList) -> (if (fuel <= 0) then alts else (match alts with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__255, dtb__256) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltCtor = (dtb__255).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltCtor; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBinders = (dtb__255).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBinders; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBody = ((((v_Vuna_dCompiler_dIr_dCps_dmCps (fuel - 1)) r) k) (dtb__255).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBody) }, ((((v_Vuna_dCompiler_dIr_dCps_dmCpsAlts (fuel - 1)) r) k) dtb__256)))
  | _ -> failwith "DT: impossible branch"
)))
# 627 "Vuna/Compiler/Ir/Cps.vuna"
and v_Vuna_dCompiler_dIr_dCps_dmCpsAltM = (fun (fuel : int) (r : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrBinder) (k : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIr) (m : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrAlt Base_dData_dMaybe.t_Base_dData_dMaybe_dMaybe) -> (if (fuel <= 0) then m else (match m with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__257) -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ({ Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltCtor = (dtb__257).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltCtor; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBinders = (dtb__257).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBinders; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBody = ((((v_Vuna_dCompiler_dIr_dCps_dmCps (fuel - 1)) r) k) (dtb__257).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBody) }))
  | _ -> failwith "DT: impossible branch"
)))
# 644 "Vuna/Compiler/Ir/Cps.vuna"
and v_Vuna_dCompiler_dIr_dCps_dmCpsArgs = (fun (fuel : int) (r : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrBinder) (k : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIr) (sym : string) (args : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIr Base_dData_dList.t_Base_dData_dList_dList) (acc : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIr Base_dData_dList.t_Base_dData_dList_dList) -> (if (fuel <= 0) then (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, k, (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRtApp (sym, ((Base_dData_dList.v_Base_dData_dList_dappend (Base_dData_dList.v_Base_dData_dList_dreverse acc)) args))))) else (match args with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, k, (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRtApp (sym, (Base_dData_dList.v_Base_dData_dList_dreverse acc)))))
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__258, dtb__259) -> ((fun v -> ((((v_Vuna_dCompiler_dIr_dCps_dmCps (fuel - 1)) r) (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLam ((Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (v, Base_dData_dList.C_Base_dData_dList_dList_Nil)), Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, ((((((v_Vuna_dCompiler_dIr_dCps_dmCpsArgs (fuel - 1)) r) k) sym) dtb__259) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ((Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrVar (v)), acc)))))) dtb__258)) (v_Vuna_dCompiler_dIr_dCps_dmFreshV fuel))
  | _ -> failwith "DT: impossible branch"
)))
# 659 "Vuna/Compiler/Ir/Cps.vuna"
and v_Vuna_dCompiler_dIr_dCps_dmCpsApply = (fun (fuel : int) (r : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrBinder) (k : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIr) (parts : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIr Base_dData_dList.t_Base_dData_dList_dList) -> (if (fuel <= 0) then (match parts with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, k, (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrGlobal ("?"))))
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__260, dtb__261) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, k, ((v_Vuna_dCompiler_dIr_dCps_dapplyAll dtb__260) dtb__261)))
  | _ -> failwith "DT: impossible branch"
) else ((fun nd_uscrut4 -> (match nd_uscrut4 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__262, dtb__263) -> (match dtb__263 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> ((((v_Vuna_dCompiler_dIr_dCps_dmCps (fuel - 1)) r) k) dtb__262)
  | _ -> ((fun v -> ((((v_Vuna_dCompiler_dIr_dCps_dmCps (fuel - 1)) r) (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLam ((Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (v, Base_dData_dList.C_Base_dData_dList_dList_Nil)), Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, ((((((v_Vuna_dCompiler_dIr_dCps_dmCpsApplyArgs (fuel - 1)) r) k) dtb__263) Base_dData_dList.C_Base_dData_dList_dList_Nil) v)))) dtb__262)) (v_Vuna_dCompiler_dIr_dCps_dmFreshV fuel))
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, k, (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrGlobal ("?"))))
  | _ -> failwith "DT: impossible branch"
)) parts)))
# 675 "Vuna/Compiler/Ir/Cps.vuna"
and v_Vuna_dCompiler_dIr_dCps_dmCpsApplyArgs = (fun (fuel : int) (r : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrBinder) (k : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIr) (args : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIr Base_dData_dList.t_Base_dData_dList_dList) (acc : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIr Base_dData_dList.t_Base_dData_dList_dList) (headV : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrBinder) -> (if (fuel <= 0) then (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, k, ((v_Vuna_dCompiler_dIr_dCps_dapplyAll (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrVar (headV))) ((Base_dData_dList.v_Base_dData_dList_dappend (Base_dData_dList.v_Base_dData_dList_dreverse acc)) args)))) else (match args with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, k, ((v_Vuna_dCompiler_dIr_dCps_dapplyAll (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrVar (headV))) (Base_dData_dList.v_Base_dData_dList_dreverse acc))))
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__264, dtb__265) -> ((fun v -> ((((v_Vuna_dCompiler_dIr_dCps_dmCps (fuel - 1)) r) (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLam ((Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (v, Base_dData_dList.C_Base_dData_dList_dList_Nil)), Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, ((((((v_Vuna_dCompiler_dIr_dCps_dmCpsApplyArgs (fuel - 1)) r) k) dtb__265) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ((Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrVar (v)), acc))) headV)))) dtb__264)) (v_Vuna_dCompiler_dIr_dCps_dmFreshV fuel))
  | _ -> failwith "DT: impossible branch"
)))
# 694 "Vuna/Compiler/Ir/Cps.vuna"
and v_Vuna_dCompiler_dIr_dCps_dmCps = (fun (fuel : int) (r : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrBinder) (k : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIr) (e : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIr) -> (if (fuel <= 0) then (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, k, e)) else (if ((v_Vuna_dCompiler_dIr_dCps_dmIsResumeApp r) e) then (if (v_Vuna_dCompiler_dIr_dCps_disTailCont k) then (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, e, (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCtor ("Base.Effect.Core.Rest", "Base.Effect.Core.Rest.MkRestTail", Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, Base_dData_dList.C_Base_dData_dList_dList_Nil)))) else (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, e, (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCtor ("Base.Effect.Core.Rest", "Base.Effect.Core.Rest.MkRestCont", Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (k, Base_dData_dList.C_Base_dData_dList_dList_Nil))))))) else (match e with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLet (dtb__266, dtb__267, dtb__268) -> ((fun v -> ((fun cont -> ((((v_Vuna_dCompiler_dIr_dCps_dmCps (fuel - 1)) r) cont) dtb__267)) (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLam ((Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (v, Base_dData_dList.C_Base_dData_dList_dList_Nil)), Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLet (dtb__266, (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrVar (v)), ((((v_Vuna_dCompiler_dIr_dCps_dmCps (fuel - 1)) r) k) dtb__268))))))) (v_Vuna_dCompiler_dIr_dCps_dmFreshV fuel))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCase (dtb__269, dtb__270, dtb__271, dtb__272) -> ((fun v -> ((fun cont -> ((((v_Vuna_dCompiler_dIr_dCps_dmCps (fuel - 1)) r) cont) dtb__271)) (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLam ((Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (v, Base_dData_dList.C_Base_dData_dList_dList_Nil)), Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCase (dtb__269, Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrVar (v)), ((((v_Vuna_dCompiler_dIr_dCps_dmCpsAlts (fuel - 2)) r) k) dtb__272))))))) (v_Vuna_dCompiler_dIr_dCps_dmFreshV fuel))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrIf (dtb__273, dtb__274, dtb__275) -> ((fun v -> ((fun cont -> ((((v_Vuna_dCompiler_dIr_dCps_dmCps (fuel - 1)) r) cont) dtb__273)) (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLam ((Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (v, Base_dData_dList.C_Base_dData_dList_dList_Nil)), Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrIf ((Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrVar (v)), ((((v_Vuna_dCompiler_dIr_dCps_dmCps (fuel - 2)) r) k) dtb__274), ((((v_Vuna_dCompiler_dIr_dCps_dmCps (fuel - 2)) r) k) dtb__275))))))) (v_Vuna_dCompiler_dIr_dCps_dmFreshV fuel))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrNatCase (dtb__276, dtb__277, dtb__278, dtb__279, dtb__280) -> ((fun v -> ((fun cont -> ((((v_Vuna_dCompiler_dIr_dCps_dmCps (fuel - 1)) r) cont) dtb__276)) (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLam ((Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (v, Base_dData_dList.C_Base_dData_dList_dList_Nil)), Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrNatCase ((Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrVar (v)), dtb__277, ((((v_Vuna_dCompiler_dIr_dCps_dmCpsAltM (fuel - 2)) r) k) dtb__278), ((((v_Vuna_dCompiler_dIr_dCps_dmCpsAltM (fuel - 2)) r) k) dtb__279), ((((v_Vuna_dCompiler_dIr_dCps_dmCpsAltM (fuel - 2)) r) k) dtb__280))))))) (v_Vuna_dCompiler_dIr_dCps_dmFreshV fuel))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCast (dtb__281, dtb__282, dtb__283) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCast (dtb__281, dtb__282, ((((v_Vuna_dCompiler_dIr_dCps_dmCps (fuel - 1)) r) k) dtb__283)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRtApp (dtb__284, dtb__285) -> ((((((v_Vuna_dCompiler_dIr_dCps_dmCpsArgs (fuel - 1)) r) k) dtb__284) dtb__285) Base_dData_dList.C_Base_dData_dList_dList_Nil)
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLam (dtb__286, dtb__287, dtb__288) -> (if (v_Vuna_dCompiler_dIr_dCps_disEffContLambda dtb__287) then (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, k, (((((v_Vuna_dCompiler_dIr_dCps_dmEffContLambda (fuel - 1)) r) dtb__286) dtb__287) dtb__288))) else (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, k, e)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (dtb__289, dtb__290, dtb__291) -> ((fun p -> ((((v_Vuna_dCompiler_dIr_dCps_dmCpsApply (fuel - 1)) r) k) ((Base_dData_dList.v_Base_dData_dList_dappend (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ((Base_dData_dPair.v_Base_dData_dPair_dfirstOf p), Base_dData_dList.C_Base_dData_dList_dList_Nil))) (Base_dData_dPair.v_Base_dData_dPair_dsecondOf p)))) (v_Vuna_dCompiler_dIr_dCps_dflattenApp e))
  | _ -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, k, e))
))))

# 802 "Vuna/Compiler/Ir/Cps.vuna"
let v_Vuna_dCompiler_dIr_dCps_dmSym = (fun (x : string) -> (if (x = v_Vuna_dCompiler_dIr_dCps_dirCpsPerformName) then v_Vuna_dCompiler_dIr_dCps_dirMPerformName else (if (x = v_Vuna_dCompiler_dIr_dCps_dirCpsHandleName) then v_Vuna_dCompiler_dIr_dCps_dirMHandleName else (if (x = v_Vuna_dCompiler_dIr_dCps_dirCpsSelfName) then v_Vuna_dCompiler_dIr_dCps_dirMSelfName else x))))

# 808 "Vuna/Compiler/Ir/Cps.vuna"
let rec v_Vuna_dCompiler_dIr_dCps_dmSyms = (fun (fuel : int) (e : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIr) -> (if (fuel <= 0) then e else (match e with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRt (dtb__292) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRt ((v_Vuna_dCompiler_dIr_dCps_dmSym dtb__292)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRtApp (dtb__293, dtb__294) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRtApp ((v_Vuna_dCompiler_dIr_dCps_dmSym dtb__293), ((v_Vuna_dCompiler_dIr_dCps_dmListS (fuel - 1)) dtb__294)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCtor (dtb__295, dtb__296, dtb__297, dtb__298) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCtor (dtb__295, dtb__296, Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, ((v_Vuna_dCompiler_dIr_dCps_dmListS (fuel - 1)) dtb__298)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRecord (dtb__299, dtb__300, dtb__301) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRecord (dtb__299, Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, ((v_Vuna_dCompiler_dIr_dCps_dmFieldsS (fuel - 1)) dtb__301)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrProj (dtb__302, dtb__303, dtb__304, dtb__305) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrProj (((v_Vuna_dCompiler_dIr_dCps_dmSyms (fuel - 1)) dtb__302), dtb__303, dtb__304, Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRecUpd (dtb__306, dtb__307, dtb__308, dtb__309) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRecUpd (((v_Vuna_dCompiler_dIr_dCps_dmSyms (fuel - 1)) dtb__306), dtb__307, ((v_Vuna_dCompiler_dIr_dCps_dmFieldsS (fuel - 1)) dtb__308), Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCast (dtb__310, dtb__311, dtb__312) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCast (dtb__310, dtb__311, ((v_Vuna_dCompiler_dIr_dCps_dmSyms (fuel - 1)) dtb__312)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLet (dtb__313, dtb__314, dtb__315) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLet (dtb__313, ((v_Vuna_dCompiler_dIr_dCps_dmSyms (fuel - 1)) dtb__314), ((v_Vuna_dCompiler_dIr_dCps_dmSyms (fuel - 1)) dtb__315)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLam (dtb__316, dtb__317, dtb__318) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLam (dtb__316, dtb__317, ((v_Vuna_dCompiler_dIr_dCps_dmSyms (fuel - 1)) dtb__318)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (dtb__319, dtb__320, dtb__321) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, ((v_Vuna_dCompiler_dIr_dCps_dmSyms (fuel - 1)) dtb__320), ((v_Vuna_dCompiler_dIr_dCps_dmSyms (fuel - 1)) dtb__321)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrIf (dtb__322, dtb__323, dtb__324) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrIf (((v_Vuna_dCompiler_dIr_dCps_dmSyms (fuel - 1)) dtb__322), ((v_Vuna_dCompiler_dIr_dCps_dmSyms (fuel - 1)) dtb__323), ((v_Vuna_dCompiler_dIr_dCps_dmSyms (fuel - 1)) dtb__324)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCase (dtb__325, dtb__326, dtb__327, dtb__328) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCase (dtb__325, Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, ((v_Vuna_dCompiler_dIr_dCps_dmSyms (fuel - 1)) dtb__327), ((v_Vuna_dCompiler_dIr_dCps_dmSymsAltsM (fuel - 1)) dtb__328)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrNatCase (dtb__329, dtb__330, dtb__331, dtb__332, dtb__333) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrNatCase (((v_Vuna_dCompiler_dIr_dCps_dmSyms (fuel - 1)) dtb__329), dtb__330, ((v_Vuna_dCompiler_dIr_dCps_dmSymsAltMM (fuel - 1)) dtb__331), ((v_Vuna_dCompiler_dIr_dCps_dmSymsAltMM (fuel - 1)) dtb__332), ((v_Vuna_dCompiler_dIr_dCps_dmSymsAltMM (fuel - 1)) dtb__333)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrConcatMany (dtb__334) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrConcatMany (((v_Vuna_dCompiler_dIr_dCps_dmListS (fuel - 1)) dtb__334)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrEffThunk (dtb__335, dtb__336, dtb__337, dtb__338, dtb__339) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrEffThunk (dtb__335, dtb__336, dtb__337, dtb__338, ((v_Vuna_dCompiler_dIr_dCps_dmSyms (fuel - 1)) dtb__339)))
  | _ -> e
)))
# 831 "Vuna/Compiler/Ir/Cps.vuna"
and v_Vuna_dCompiler_dIr_dCps_dmListS = (fun (fuel : int) (xs : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIr Base_dData_dList.t_Base_dData_dList_dList) -> (if (fuel <= 0) then xs else (match xs with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__340, dtb__341) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (((v_Vuna_dCompiler_dIr_dCps_dmSyms (fuel - 1)) dtb__340), ((v_Vuna_dCompiler_dIr_dCps_dmListS (fuel - 1)) dtb__341)))
  | _ -> failwith "DT: impossible branch"
)))
# 840 "Vuna/Compiler/Ir/Cps.vuna"
and v_Vuna_dCompiler_dIr_dCps_dmFieldsS = (fun (fuel : int) (fs : (string, Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIr) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) -> (if (fuel <= 0) then fs else (match fs with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__342, dtb__343) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Base_dData_dPair.v_Base_dData_dPair_dfirstOf dtb__342); Base_dData_dPair.f_Base_dData_dPair_dPair_second = ((v_Vuna_dCompiler_dIr_dCps_dmSyms (fuel - 1)) (Base_dData_dPair.v_Base_dData_dPair_dsecondOf dtb__342)) }, ((v_Vuna_dCompiler_dIr_dCps_dmFieldsS (fuel - 1)) dtb__343)))
  | _ -> failwith "DT: impossible branch"
)))
# 849 "Vuna/Compiler/Ir/Cps.vuna"
and v_Vuna_dCompiler_dIr_dCps_dmSymsAltsM = (fun (fuel : int) (alts : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrAlt Base_dData_dList.t_Base_dData_dList_dList) -> (if (fuel <= 0) then alts else (match alts with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__344, dtb__345) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltCtor = (dtb__344).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltCtor; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBinders = (dtb__344).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBinders; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBody = ((v_Vuna_dCompiler_dIr_dCps_dmSyms (fuel - 1)) (dtb__344).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBody) }, ((v_Vuna_dCompiler_dIr_dCps_dmSymsAltsM (fuel - 1)) dtb__345)))
  | _ -> failwith "DT: impossible branch"
)))
# 858 "Vuna/Compiler/Ir/Cps.vuna"
and v_Vuna_dCompiler_dIr_dCps_dmSymsAltMM = (fun (fuel : int) (m : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrAlt Base_dData_dMaybe.t_Base_dData_dMaybe_dMaybe) -> (if (fuel <= 0) then m else (match m with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__346) -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ({ Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltCtor = (dtb__346).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltCtor; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBinders = (dtb__346).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBinders; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBody = ((v_Vuna_dCompiler_dIr_dCps_dmSyms (fuel - 1)) (dtb__346).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBody) }))
  | _ -> failwith "DT: impossible branch"
)))

# 867 "Vuna/Compiler/Ir/Cps.vuna"
let v_Vuna_dCompiler_dIr_dCps_dmDoneCont = ((fun v -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLam ((Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (v, Base_dData_dList.C_Base_dData_dList_dList_Nil)), Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRt (v_Vuna_dCompiler_dIr_dCps_dirMDoneName)), (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrVar (v))))))) (v_Vuna_dCompiler_dIr_dCps_dmkBinder "__mDoneV"))

# 873 "Vuna/Compiler/Ir/Cps.vuna"
let rec v_Vuna_dCompiler_dIr_dCps_dmTrampolineBody = (fun (mc0 : string) (mc1 : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIr) -> (match mc1 with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (dtb__347, dtb__348, dtb__349) -> (match dtb__348 with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (dtb__350, dtb__351, dtb__352) -> (match dtb__351 with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (dtb__353, dtb__354, dtb__355) -> (match dtb__354 with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrGlobal (dtb__356) -> (if (dtb__356 = v_Vuna_dCompiler_dIr_dCps_drunThunkName) then (Base_dData_dResult.C_Base_dData_dResult_dResult_Ok ((Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRt (v_Vuna_dCompiler_dIr_dCps_dirMRunName)), ((v_Vuna_dCompiler_dIr_dCps_dapplyAll (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrGlobal (dtb__356))) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__355, (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__352, (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (v_Vuna_dCompiler_dIr_dCps_dmDoneCont, Base_dData_dList.C_Base_dData_dList_dList_Nil))))))))))) else (Base_dData_dResult.C_Base_dData_dResult_dResult_Err (("machine CPS: unexpected trampoline shape: " ^ mc0))))
  | _ -> (Base_dData_dResult.C_Base_dData_dResult_dResult_Err (("machine CPS: unexpected trampoline shape: " ^ mc0)))
)
  | _ -> (Base_dData_dResult.C_Base_dData_dResult_dResult_Err (("machine CPS: unexpected trampoline shape: " ^ mc0)))
)
  | _ -> (Base_dData_dResult.C_Base_dData_dResult_dResult_Err (("machine CPS: unexpected trampoline shape: " ^ mc0)))
)
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCast (dtb__357, dtb__358, dtb__359) -> (match ((v_Vuna_dCompiler_dIr_dCps_dmTrampolineBody mc0) dtb__359) with
  | Base_dData_dResult.C_Base_dData_dResult_dResult_Err (dtb__360) -> (Base_dData_dResult.C_Base_dData_dResult_dResult_Err (dtb__360))
  | Base_dData_dResult.C_Base_dData_dResult_dResult_Ok (dtb__361) -> (Base_dData_dResult.C_Base_dData_dResult_dResult_Ok ((Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCast (dtb__357, dtb__358, dtb__361))))
  | _ -> failwith "DT: impossible branch"
)
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLam (dtb__362, dtb__363, dtb__364) -> (match ((v_Vuna_dCompiler_dIr_dCps_dmTrampolineBody mc0) dtb__364) with
  | Base_dData_dResult.C_Base_dData_dResult_dResult_Err (dtb__365) -> (Base_dData_dResult.C_Base_dData_dResult_dResult_Err (dtb__365))
  | Base_dData_dResult.C_Base_dData_dResult_dResult_Ok (dtb__366) -> (Base_dData_dResult.C_Base_dData_dResult_dResult_Ok ((Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLam (dtb__362, dtb__363, dtb__366))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> (Base_dData_dResult.C_Base_dData_dResult_dResult_Err (("machine CPS: unexpected trampoline shape: " ^ mc0)))
))

# 895 "Vuna/Compiler/Ir/Cps.vuna"
let v_Vuna_dCompiler_dIr_dCps_dmBodyOf = (fun (d : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrDef) -> (match (Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirDefBody d) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__367) -> dtb__367
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrInt (0))
  | _ -> failwith "DT: impossible branch"
))

# 905 "Vuna/Compiler/Ir/Cps.vuna"
let rec v_Vuna_dCompiler_dIr_dCps_ddefArities = (fun (fuel : int) (ds : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrDef Base_dData_dList.t_Base_dData_dList_dList) -> (if (fuel <= 0) then Base_dData_dList.C_Base_dData_dList_dList_Nil else (match ds with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__368, dtb__369) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirDefName dtb__368); Base_dData_dPair.f_Base_dData_dPair_dPair_second = (Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirDefArity dtb__368) }, ((v_Vuna_dCompiler_dIr_dCps_ddefArities (fuel - 1)) dtb__369)))
  | _ -> failwith "DT: impossible branch"
)))

# 914 "Vuna/Compiler/Ir/Cps.vuna"
let rec v_Vuna_dCompiler_dIr_dCps_ddefSigs = (fun (fuel : int) (ds : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrDef Base_dData_dList.t_Base_dData_dList_dList) -> (if (fuel <= 0) then Base_dData_dList.C_Base_dData_dList_dList_Nil else (match ds with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__370, dtb__371) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirDefName dtb__370); Base_dData_dPair.f_Base_dData_dPair_dPair_second = (Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirDefTy dtb__370) }, ((v_Vuna_dCompiler_dIr_dCps_ddefSigs (fuel - 1)) dtb__371)))
  | _ -> failwith "DT: impossible branch"
)))

# 923 "Vuna/Compiler/Ir/Cps.vuna"
let v_Vuna_dCompiler_dIr_dCps_dhandlerTables = (fun (fuel : int) (ds : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrDef Base_dData_dList.t_Base_dData_dList_dList) -> { f_Vuna_dCompiler_dIr_dCps_dHandlerTables_htArities = ((v_Vuna_dCompiler_dIr_dCps_ddefArities fuel) ds); f_Vuna_dCompiler_dIr_dCps_dHandlerTables_htSigs = ((v_Vuna_dCompiler_dIr_dCps_ddefSigs fuel) ds) })

# 926 "Vuna/Compiler/Ir/Cps.vuna"
let rec v_Vuna_dCompiler_dIr_dCps_darityOf = (fun (mc0 : (string, int) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (mc1 : string) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__372, dtb__373) -> (if ((Base_dData_dPair.v_Base_dData_dPair_dfirstOf dtb__372) = mc1) then (Base_dData_dPair.v_Base_dData_dPair_dsecondOf dtb__372) else ((v_Vuna_dCompiler_dIr_dCps_darityOf dtb__373) mc1))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))

# 930 "Vuna/Compiler/Ir/Cps.vuna"
let rec v_Vuna_dCompiler_dIr_dCps_dsigOf = (fun (mc0 : (string, Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrTy Base_dData_dMaybe.t_Base_dData_dMaybe_dMaybe) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (mc1 : string) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__374, dtb__375) -> (if ((Base_dData_dPair.v_Base_dData_dPair_dfirstOf dtb__374) = mc1) then (Base_dData_dPair.v_Base_dData_dPair_dsecondOf dtb__374) else ((v_Vuna_dCompiler_dIr_dCps_dsigOf dtb__375) mc1))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 934 "Vuna/Compiler/Ir/Cps.vuna"
let rec v_Vuna_dCompiler_dIr_dCps_dfunArity = (fun (mc0 : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrTy) -> (match mc0 with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyFun (dtb__376, dtb__377) -> (1 + (v_Vuna_dCompiler_dIr_dCps_dfunArity dtb__377))
  | _ -> 0
))

# 938 "Vuna/Compiler/Ir/Cps.vuna"
let rec v_Vuna_dCompiler_dIr_dCps_dfunResult = (fun (mc0 : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrTy) -> (match mc0 with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyFun (dtb__378, dtb__379) -> (v_Vuna_dCompiler_dIr_dCps_dfunResult dtb__379)
  | _ -> mc0
))

# 942 "Vuna/Compiler/Ir/Cps.vuna"
let v_Vuna_dCompiler_dIr_dCps_disFunTy = (fun (mc0 : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrTy) -> (match mc0 with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyFun (dtb__380, dtb__381) -> true
  | _ -> false
))

# 949 "Vuna/Compiler/Ir/Cps.vuna"
let v_Vuna_dCompiler_dIr_dCps_disClauseTy = (fun (mc0 : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrTy) -> (match mc0 with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyFun (dtb__382, dtb__383) -> (match dtb__383 with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyFun (dtb__384, dtb__385) -> (v_Vuna_dCompiler_dIr_dCps_disFunTy dtb__384)
  | _ -> false
)
  | _ -> false
))

# 958 "Vuna/Compiler/Ir/Cps.vuna"
let rec v_Vuna_dCompiler_dIr_dCps_dhasClauseParam = (fun (mc0 : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrTy) -> (match mc0 with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyFun (dtb__386, dtb__387) -> (if (v_Vuna_dCompiler_dIr_dCps_disClauseTy dtb__386) then true else (v_Vuna_dCompiler_dIr_dCps_dhasClauseParam dtb__387))
  | _ -> false
))

# 954 "Vuna/Compiler/Ir/Cps.vuna"
let v_Vuna_dCompiler_dIr_dCps_disHandlerCombinatorTy = (fun (ty : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrTy) -> (if (if ((v_Vuna_dCompiler_dIr_dCps_dfunArity ty) >= 2) then (v_Vuna_dCompiler_dIr_dCps_disEffResultTy (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ((v_Vuna_dCompiler_dIr_dCps_dfunResult ty)))) else false) then (v_Vuna_dCompiler_dIr_dCps_dhasClauseParam ty) else false))

# 964 "Vuna/Compiler/Ir/Cps.vuna"
let v_Vuna_dCompiler_dIr_dCps_disCoreHandleCombinator = (fun (n : string) -> (if (if (if (if (if (if (if (if (if (n = "Base.Effect.Core.handleCore") then true else (n = "Base.Effect.Core.handleCoreAt")) then true else (n = "Base.Effect.Core.handleCoreLin")) then true else (n = "Base.Effect.Core.handleWith")) then true else (n = "Base.Effect.Core.handleWithAt")) then true else (n = "Base.Effect.Core.handleCoreId")) then true else (n = "Base.Effect.Core.handleCoreAtId")) then true else (n = "Base.Effect.Core.handleCoreLinId")) then true else (n = "Base.Effect.Core.handleWithId")) then true else (n = "Base.Effect.Core.handleWithAtId")))

# 984 "Vuna/Compiler/Ir/Cps.vuna"
let v_Vuna_dCompiler_dIr_dCps_disHandleCombinator = (fun (t : t_Vuna_dCompiler_dIr_dCps_dHandlerTables) (n : string) -> (match ((v_Vuna_dCompiler_dIr_dCps_dsigOf (t).f_Vuna_dCompiler_dIr_dCps_dHandlerTables_htSigs) n) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__388) -> (if ((v_Vuna_dCompiler_dIr_dCps_dfunArity dtb__388) = 0) then (v_Vuna_dCompiler_dIr_dCps_disCoreHandleCombinator n) else (if (v_Vuna_dCompiler_dIr_dCps_disHandlerCombinatorTy dtb__388) then true else (v_Vuna_dCompiler_dIr_dCps_disCoreHandleCombinator n)))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (v_Vuna_dCompiler_dIr_dCps_disCoreHandleCombinator n)
  | _ -> failwith "DT: impossible branch"
))

# 994 "Vuna/Compiler/Ir/Cps.vuna"
let v_Vuna_dCompiler_dIr_dCps_dclauseArityOf = (fun (t : t_Vuna_dCompiler_dIr_dCps_dHandlerTables) (n : string) -> (match ((v_Vuna_dCompiler_dIr_dCps_dsigOf (t).f_Vuna_dCompiler_dIr_dCps_dHandlerTables_htSigs) n) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__389) -> (if ((v_Vuna_dCompiler_dIr_dCps_dfunArity dtb__389) > 0) then (v_Vuna_dCompiler_dIr_dCps_dfunArity dtb__389) else ((v_Vuna_dCompiler_dIr_dCps_darityOf (t).f_Vuna_dCompiler_dIr_dCps_dHandlerTables_htArities) n))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> ((v_Vuna_dCompiler_dIr_dCps_darityOf (t).f_Vuna_dCompiler_dIr_dCps_dHandlerTables_htArities) n)
  | _ -> failwith "DT: impossible branch"
))

# 1000 "Vuna/Compiler/Ir/Cps.vuna"
let v_Vuna_dCompiler_dIr_dCps_disClauseGlobal = (fun (t : t_Vuna_dCompiler_dIr_dCps_dHandlerTables) (n : string) -> (match ((v_Vuna_dCompiler_dIr_dCps_dsigOf (t).f_Vuna_dCompiler_dIr_dCps_dHandlerTables_htSigs) n) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__390) -> (if ((v_Vuna_dCompiler_dIr_dCps_dfunArity dtb__390) > 0) then (v_Vuna_dCompiler_dIr_dCps_disClauseTy dtb__390) else (((v_Vuna_dCompiler_dIr_dCps_darityOf (t).f_Vuna_dCompiler_dIr_dCps_dHandlerTables_htArities) n) >= 2))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (((v_Vuna_dCompiler_dIr_dCps_darityOf (t).f_Vuna_dCompiler_dIr_dCps_dHandlerTables_htArities) n) >= 2)
  | _ -> failwith "DT: impossible branch"
))

# 1023 "Vuna/Compiler/Ir/Cps.vuna"
let rec v_Vuna_dCompiler_dIr_dCps_dlenOf = (fun xs -> (match xs with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> 0
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__391, dtb__392) -> (1 + (v_Vuna_dCompiler_dIr_dCps_dlenOf dtb__392))
  | _ -> failwith "DT: impossible branch"
))

# 1029 "Vuna/Compiler/Ir/Cps.vuna"
let v_Vuna_dCompiler_dIr_dCps_dfuelOf = (fun (_u : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIr Base_dData_dList.t_Base_dData_dList_dList) -> 1)

# 1006 "Vuna/Compiler/Ir/Cps.vuna"
let rec v_Vuna_dCompiler_dIr_dCps_dclauseGlobals = (fun (t : t_Vuna_dCompiler_dIr_dCps_dHandlerTables) (args : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIr Base_dData_dList.t_Base_dData_dList_dList) -> (if ((v_Vuna_dCompiler_dIr_dCps_dfuelOf args) <= 0) then Base_dData_dList.C_Base_dData_dList_dList_Nil else (match args with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__393, dtb__394) -> (match dtb__393 with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrGlobal (dtb__395) -> (if (if ((v_Vuna_dCompiler_dIr_dCps_disClauseGlobal t) dtb__395) then (((v_Vuna_dCompiler_dIr_dCps_dclauseArityOf t) dtb__395) >= 2) else false) then (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__395, ((v_Vuna_dCompiler_dIr_dCps_dclauseGlobals t) dtb__394))) else ((v_Vuna_dCompiler_dIr_dCps_dclauseGlobals t) dtb__394))
  | _ -> ((fun nd_uscrut5 -> (match nd_uscrut5 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__396; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__397 } -> (match dtb__396 with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrGlobal (dtb__398) -> (if (if ((v_Vuna_dCompiler_dIr_dCps_disClauseGlobal t) dtb__398) then ((((v_Vuna_dCompiler_dIr_dCps_dclauseArityOf t) dtb__398) - (v_Vuna_dCompiler_dIr_dCps_dlenOf dtb__397)) >= 2) else false) then (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__398, ((v_Vuna_dCompiler_dIr_dCps_dclauseGlobals t) dtb__394))) else ((v_Vuna_dCompiler_dIr_dCps_dclauseGlobals t) dtb__394))
  | _ -> ((v_Vuna_dCompiler_dIr_dCps_dclauseGlobals t) dtb__394)
)
  | _ -> failwith "DT: impossible branch"
)) (v_Vuna_dCompiler_dIr_dCps_dflattenApp dtb__393))
)
  | _ -> failwith "DT: impossible branch"
)))

# 1032 "Vuna/Compiler/Ir/Cps.vuna"
let rec v_Vuna_dCompiler_dIr_dCps_dcollectHandlerGlobals = (fun (t : t_Vuna_dCompiler_dIr_dCps_dHandlerTables) (fuel : int) (e : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIr) -> (if (fuel <= 0) then Base_dData_dList.C_Base_dData_dList_dList_Nil else (match e with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (dtb__399, dtb__400, dtb__401) -> ((fun p -> ((fun head -> ((fun args -> ((fun here -> ((Base_dData_dList.v_Base_dData_dList_dappend here) ((Base_dData_dList.v_Base_dData_dList_dappend (((v_Vuna_dCompiler_dIr_dCps_dcollectHandlerGlobals t) (fuel - 1)) head)) (((v_Vuna_dCompiler_dIr_dCps_dcollectHandlerGlobalsList t) (fuel - 1)) args)))) (match head with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrGlobal (dtb__402) -> (if ((v_Vuna_dCompiler_dIr_dCps_disHandleCombinator t) dtb__402) then ((v_Vuna_dCompiler_dIr_dCps_dclauseGlobals t) args) else Base_dData_dList.C_Base_dData_dList_dList_Nil)
  | _ -> Base_dData_dList.C_Base_dData_dList_dList_Nil
))) (Base_dData_dPair.v_Base_dData_dPair_dsecondOf p))) (Base_dData_dPair.v_Base_dData_dPair_dfirstOf p))) (v_Vuna_dCompiler_dIr_dCps_dflattenApp e))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCtor (dtb__403, dtb__404, dtb__405, dtb__406) -> (((v_Vuna_dCompiler_dIr_dCps_dcollectHandlerGlobalsList t) (fuel - 1)) dtb__406)
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRecord (dtb__407, dtb__408, dtb__409) -> (((v_Vuna_dCompiler_dIr_dCps_dcollectHandlerGlobalsFields t) (fuel - 1)) dtb__409)
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrProj (dtb__410, dtb__411, dtb__412, dtb__413) -> (((v_Vuna_dCompiler_dIr_dCps_dcollectHandlerGlobals t) (fuel - 1)) dtb__410)
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRecUpd (dtb__414, dtb__415, dtb__416, dtb__417) -> ((Base_dData_dList.v_Base_dData_dList_dappend (((v_Vuna_dCompiler_dIr_dCps_dcollectHandlerGlobals t) (fuel - 1)) dtb__414)) (((v_Vuna_dCompiler_dIr_dCps_dcollectHandlerGlobalsFields t) (fuel - 1)) dtb__416))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRtApp (dtb__418, dtb__419) -> (((v_Vuna_dCompiler_dIr_dCps_dcollectHandlerGlobalsList t) (fuel - 1)) dtb__419)
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCast (dtb__420, dtb__421, dtb__422) -> (((v_Vuna_dCompiler_dIr_dCps_dcollectHandlerGlobals t) (fuel - 1)) dtb__422)
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLet (dtb__423, dtb__424, dtb__425) -> ((Base_dData_dList.v_Base_dData_dList_dappend (((v_Vuna_dCompiler_dIr_dCps_dcollectHandlerGlobals t) (fuel - 1)) dtb__424)) (((v_Vuna_dCompiler_dIr_dCps_dcollectHandlerGlobals t) (fuel - 1)) dtb__425))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLam (dtb__426, dtb__427, dtb__428) -> (((v_Vuna_dCompiler_dIr_dCps_dcollectHandlerGlobals t) (fuel - 1)) dtb__428)
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrIf (dtb__429, dtb__430, dtb__431) -> ((Base_dData_dList.v_Base_dData_dList_dappend (((v_Vuna_dCompiler_dIr_dCps_dcollectHandlerGlobals t) (fuel - 1)) dtb__429)) ((Base_dData_dList.v_Base_dData_dList_dappend (((v_Vuna_dCompiler_dIr_dCps_dcollectHandlerGlobals t) (fuel - 1)) dtb__430)) (((v_Vuna_dCompiler_dIr_dCps_dcollectHandlerGlobals t) (fuel - 1)) dtb__431)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCase (dtb__432, dtb__433, dtb__434, dtb__435) -> ((Base_dData_dList.v_Base_dData_dList_dappend (((v_Vuna_dCompiler_dIr_dCps_dcollectHandlerGlobals t) (fuel - 1)) dtb__434)) (((v_Vuna_dCompiler_dIr_dCps_dcollectHandlerGlobalsAlts t) (fuel - 1)) dtb__435))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrNatCase (dtb__436, dtb__437, dtb__438, dtb__439, dtb__440) -> ((Base_dData_dList.v_Base_dData_dList_dappend (((v_Vuna_dCompiler_dIr_dCps_dcollectHandlerGlobals t) (fuel - 1)) dtb__436)) ((Base_dData_dList.v_Base_dData_dList_dappend (((v_Vuna_dCompiler_dIr_dCps_dcollectHandlerGlobalsAltM t) (fuel - 1)) dtb__438)) ((Base_dData_dList.v_Base_dData_dList_dappend (((v_Vuna_dCompiler_dIr_dCps_dcollectHandlerGlobalsAltM t) (fuel - 1)) dtb__439)) (((v_Vuna_dCompiler_dIr_dCps_dcollectHandlerGlobalsAltM t) (fuel - 1)) dtb__440))))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrConcatMany (dtb__441) -> (((v_Vuna_dCompiler_dIr_dCps_dcollectHandlerGlobalsList t) (fuel - 1)) dtb__441)
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrEffThunk (dtb__442, dtb__443, dtb__444, dtb__445, dtb__446) -> (((v_Vuna_dCompiler_dIr_dCps_dcollectHandlerGlobals t) (fuel - 1)) dtb__446)
  | _ -> Base_dData_dList.C_Base_dData_dList_dList_Nil
)))
# 1063 "Vuna/Compiler/Ir/Cps.vuna"
and v_Vuna_dCompiler_dIr_dCps_dcollectHandlerGlobalsList = (fun (t : t_Vuna_dCompiler_dIr_dCps_dHandlerTables) (fuel : int) (xs : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIr Base_dData_dList.t_Base_dData_dList_dList) -> (if (fuel <= 0) then Base_dData_dList.C_Base_dData_dList_dList_Nil else (match xs with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__447, dtb__448) -> ((Base_dData_dList.v_Base_dData_dList_dappend (((v_Vuna_dCompiler_dIr_dCps_dcollectHandlerGlobals t) (fuel - 1)) dtb__447)) (((v_Vuna_dCompiler_dIr_dCps_dcollectHandlerGlobalsList t) (fuel - 1)) dtb__448))
  | _ -> failwith "DT: impossible branch"
)))
# 1072 "Vuna/Compiler/Ir/Cps.vuna"
and v_Vuna_dCompiler_dIr_dCps_dcollectHandlerGlobalsFields = (fun (t : t_Vuna_dCompiler_dIr_dCps_dHandlerTables) (fuel : int) (fs : (string, Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIr) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) -> (if (fuel <= 0) then Base_dData_dList.C_Base_dData_dList_dList_Nil else (match fs with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__449, dtb__450) -> ((Base_dData_dList.v_Base_dData_dList_dappend (((v_Vuna_dCompiler_dIr_dCps_dcollectHandlerGlobals t) (fuel - 1)) (Base_dData_dPair.v_Base_dData_dPair_dsecondOf dtb__449))) (((v_Vuna_dCompiler_dIr_dCps_dcollectHandlerGlobalsFields t) (fuel - 1)) dtb__450))
  | _ -> failwith "DT: impossible branch"
)))
# 1081 "Vuna/Compiler/Ir/Cps.vuna"
and v_Vuna_dCompiler_dIr_dCps_dcollectHandlerGlobalsAlts = (fun (t : t_Vuna_dCompiler_dIr_dCps_dHandlerTables) (fuel : int) (alts : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrAlt Base_dData_dList.t_Base_dData_dList_dList) -> (if (fuel <= 0) then Base_dData_dList.C_Base_dData_dList_dList_Nil else (match alts with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__451, dtb__452) -> ((Base_dData_dList.v_Base_dData_dList_dappend (((v_Vuna_dCompiler_dIr_dCps_dcollectHandlerGlobals t) (fuel - 1)) (dtb__451).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBody)) (((v_Vuna_dCompiler_dIr_dCps_dcollectHandlerGlobalsAlts t) (fuel - 1)) dtb__452))
  | _ -> failwith "DT: impossible branch"
)))
# 1090 "Vuna/Compiler/Ir/Cps.vuna"
and v_Vuna_dCompiler_dIr_dCps_dcollectHandlerGlobalsAltM = (fun (t : t_Vuna_dCompiler_dIr_dCps_dHandlerTables) (fuel : int) (m : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrAlt Base_dData_dMaybe.t_Base_dData_dMaybe_dMaybe) -> (if (fuel <= 0) then Base_dData_dList.C_Base_dData_dList_dList_Nil else (match m with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__453) -> (((v_Vuna_dCompiler_dIr_dCps_dcollectHandlerGlobals t) (fuel - 1)) (dtb__453).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBody)
  | _ -> failwith "DT: impossible branch"
)))

# 1105 "Vuna/Compiler/Ir/Cps.vuna"
let rec v_Vuna_dCompiler_dIr_dCps_dcollectHandleOpsDefsGo = (fun (fuel : int) (t : t_Vuna_dCompiler_dIr_dCps_dHandlerTables) (ds : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrDef Base_dData_dList.t_Base_dData_dList_dList) -> (if (fuel <= 0) then Base_dData_dList.C_Base_dData_dList_dList_Nil else (match ds with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__454, dtb__455) -> ((Base_dData_dList.v_Base_dData_dList_dappend (((v_Vuna_dCompiler_dIr_dCps_dcollectHandlerGlobals t) (fuel - 1)) (v_Vuna_dCompiler_dIr_dCps_dmBodyOf dtb__454))) (((v_Vuna_dCompiler_dIr_dCps_dcollectHandleOpsDefsGo (fuel - 1)) t) dtb__455))
  | _ -> failwith "DT: impossible branch"
)))

# 1099 "Vuna/Compiler/Ir/Cps.vuna"
let v_Vuna_dCompiler_dIr_dCps_dcollectHandleOpsDefs = (fun (fuel : int) (ds : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrDef Base_dData_dList.t_Base_dData_dList_dList) -> ((fun tables -> (((v_Vuna_dCompiler_dIr_dCps_dcollectHandleOpsDefsGo fuel) tables) ds)) ((v_Vuna_dCompiler_dIr_dCps_dhandlerTables 100000) ds)))

# 1114 "Vuna/Compiler/Ir/Cps.vuna"
let rec v_Vuna_dCompiler_dIr_dCps_dmemName = (fun (mc0 : string) (mc1 : string Base_dData_dList.t_Base_dData_dList_dList) -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__456, dtb__457) -> (if (mc0 = dtb__456) then true else ((v_Vuna_dCompiler_dIr_dCps_dmemName mc0) dtb__457))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 1120 "Vuna/Compiler/Ir/Cps.vuna"
let v_Vuna_dCompiler_dIr_dCps_dscopedName = "Base.Effect.Core.handleScoped"

# 1123 "Vuna/Compiler/Ir/Cps.vuna"
let v_Vuna_dCompiler_dIr_dCps_dselfName = "Base.Effect.Core.handleSelf"

# 1126 "Vuna/Compiler/Ir/Cps.vuna"
let v_Vuna_dCompiler_dIr_dCps_dscopeName = "Base.Effect.Core.scope"

# 1129 "Vuna/Compiler/Ir/Cps.vuna"
let v_Vuna_dCompiler_dIr_dCps_dcleanupPushName = "Base.Effect.Core.pushCleanup"

# 1132 "Vuna/Compiler/Ir/Cps.vuna"
let v_Vuna_dCompiler_dIr_dCps_dcleanupPopName = "Base.Effect.Core.popCleanup"

# 1135 "Vuna/Compiler/Ir/Cps.vuna"
let rec v_Vuna_dCompiler_dIr_dCps_dmScopedCalls = (fun (fuel : int) (rs : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrBinder) (e : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIr) -> (if (fuel <= 0) then e else (match e with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (dtb__458, dtb__459, dtb__460) -> ((fun f1 -> ((fun a1 -> (match f1 with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrGlobal (dtb__461) -> (if (dtb__461 = v_Vuna_dCompiler_dIr_dCps_dscopedName) then (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrVar (rs)), a1)) else (if (dtb__461 = v_Vuna_dCompiler_dIr_dCps_dselfName) then (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrVar (rs)), (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrGlobal (v_Vuna_dCompiler_dIr_dCps_dscopeName)), a1)))) else (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, f1, a1))))
  | _ -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, f1, a1))
)) (((v_Vuna_dCompiler_dIr_dCps_dmScopedCalls (fuel - 1)) rs) dtb__460))) (((v_Vuna_dCompiler_dIr_dCps_dmScopedCalls (fuel - 1)) rs) dtb__459))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRtApp (dtb__462, dtb__463) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRtApp (dtb__462, (((v_Vuna_dCompiler_dIr_dCps_dmScopedList (fuel - 1)) rs) dtb__463)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCtor (dtb__464, dtb__465, dtb__466, dtb__467) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCtor (dtb__464, dtb__465, Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, (((v_Vuna_dCompiler_dIr_dCps_dmScopedList (fuel - 1)) rs) dtb__467)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRecord (dtb__468, dtb__469, dtb__470) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRecord (dtb__468, Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, (((v_Vuna_dCompiler_dIr_dCps_dmScopedFields (fuel - 1)) rs) dtb__470)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrProj (dtb__471, dtb__472, dtb__473, dtb__474) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrProj ((((v_Vuna_dCompiler_dIr_dCps_dmScopedCalls (fuel - 1)) rs) dtb__471), dtb__472, dtb__473, Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRecUpd (dtb__475, dtb__476, dtb__477, dtb__478) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRecUpd ((((v_Vuna_dCompiler_dIr_dCps_dmScopedCalls (fuel - 1)) rs) dtb__475), dtb__476, (((v_Vuna_dCompiler_dIr_dCps_dmScopedFields (fuel - 1)) rs) dtb__477), Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCast (dtb__479, dtb__480, dtb__481) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCast (dtb__479, dtb__480, (((v_Vuna_dCompiler_dIr_dCps_dmScopedCalls (fuel - 1)) rs) dtb__481)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLet (dtb__482, dtb__483, dtb__484) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLet (dtb__482, (((v_Vuna_dCompiler_dIr_dCps_dmScopedCalls (fuel - 1)) rs) dtb__483), (((v_Vuna_dCompiler_dIr_dCps_dmScopedCalls (fuel - 1)) rs) dtb__484)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLam (dtb__485, dtb__486, dtb__487) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLam (dtb__485, dtb__486, (((v_Vuna_dCompiler_dIr_dCps_dmScopedCalls (fuel - 1)) rs) dtb__487)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrIf (dtb__488, dtb__489, dtb__490) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrIf ((((v_Vuna_dCompiler_dIr_dCps_dmScopedCalls (fuel - 1)) rs) dtb__488), (((v_Vuna_dCompiler_dIr_dCps_dmScopedCalls (fuel - 1)) rs) dtb__489), (((v_Vuna_dCompiler_dIr_dCps_dmScopedCalls (fuel - 1)) rs) dtb__490)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCase (dtb__491, dtb__492, dtb__493, dtb__494) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCase (dtb__491, Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, (((v_Vuna_dCompiler_dIr_dCps_dmScopedCalls (fuel - 1)) rs) dtb__493), (((v_Vuna_dCompiler_dIr_dCps_dmScopedAlts (fuel - 1)) rs) dtb__494)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrNatCase (dtb__495, dtb__496, dtb__497, dtb__498, dtb__499) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrNatCase ((((v_Vuna_dCompiler_dIr_dCps_dmScopedCalls (fuel - 1)) rs) dtb__495), dtb__496, (((v_Vuna_dCompiler_dIr_dCps_dmScopedAltM (fuel - 1)) rs) dtb__497), (((v_Vuna_dCompiler_dIr_dCps_dmScopedAltM (fuel - 1)) rs) dtb__498), (((v_Vuna_dCompiler_dIr_dCps_dmScopedAltM (fuel - 1)) rs) dtb__499)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrConcatMany (dtb__500) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrConcatMany ((((v_Vuna_dCompiler_dIr_dCps_dmScopedList (fuel - 1)) rs) dtb__500)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrEffThunk (dtb__501, dtb__502, dtb__503, dtb__504, dtb__505) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrEffThunk (dtb__501, dtb__502, dtb__503, dtb__504, (((v_Vuna_dCompiler_dIr_dCps_dmScopedCalls (fuel - 1)) rs) dtb__505)))
  | _ -> e
)))
# 1163 "Vuna/Compiler/Ir/Cps.vuna"
and v_Vuna_dCompiler_dIr_dCps_dmScopedList = (fun (fuel : int) (rs : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrBinder) (xs : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIr Base_dData_dList.t_Base_dData_dList_dList) -> (if (fuel <= 0) then xs else (match xs with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__506, dtb__507) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ((((v_Vuna_dCompiler_dIr_dCps_dmScopedCalls (fuel - 1)) rs) dtb__506), (((v_Vuna_dCompiler_dIr_dCps_dmScopedList (fuel - 1)) rs) dtb__507)))
  | _ -> failwith "DT: impossible branch"
)))
# 1172 "Vuna/Compiler/Ir/Cps.vuna"
and v_Vuna_dCompiler_dIr_dCps_dmScopedFields = (fun (fuel : int) (rs : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrBinder) (fs : (string, Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIr) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) -> (if (fuel <= 0) then fs else (match fs with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__508, dtb__509) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Base_dData_dPair.v_Base_dData_dPair_dfirstOf dtb__508); Base_dData_dPair.f_Base_dData_dPair_dPair_second = (((v_Vuna_dCompiler_dIr_dCps_dmScopedCalls (fuel - 1)) rs) (Base_dData_dPair.v_Base_dData_dPair_dsecondOf dtb__508)) }, (((v_Vuna_dCompiler_dIr_dCps_dmScopedFields (fuel - 1)) rs) dtb__509)))
  | _ -> failwith "DT: impossible branch"
)))
# 1181 "Vuna/Compiler/Ir/Cps.vuna"
and v_Vuna_dCompiler_dIr_dCps_dmScopedAlts = (fun (fuel : int) (rs : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrBinder) (alts : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrAlt Base_dData_dList.t_Base_dData_dList_dList) -> (if (fuel <= 0) then alts else (match alts with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__510, dtb__511) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltCtor = (dtb__510).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltCtor; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBinders = (dtb__510).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBinders; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBody = (((v_Vuna_dCompiler_dIr_dCps_dmScopedCalls (fuel - 1)) rs) (dtb__510).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBody) }, (((v_Vuna_dCompiler_dIr_dCps_dmScopedAlts (fuel - 1)) rs) dtb__511)))
  | _ -> failwith "DT: impossible branch"
)))
# 1190 "Vuna/Compiler/Ir/Cps.vuna"
and v_Vuna_dCompiler_dIr_dCps_dmScopedAltM = (fun (fuel : int) (rs : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrBinder) (m : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrAlt Base_dData_dMaybe.t_Base_dData_dMaybe_dMaybe) -> (if (fuel <= 0) then m else (match m with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__512) -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ({ Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltCtor = (dtb__512).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltCtor; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBinders = (dtb__512).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBinders; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBody = (((v_Vuna_dCompiler_dIr_dCps_dmScopedCalls (fuel - 1)) rs) (dtb__512).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBody) }))
  | _ -> failwith "DT: impossible branch"
)))

# 731 "Vuna/Compiler/Ir/Cps.vuna"
let rec v_Vuna_dCompiler_dIr_dCps_dmHandlerLam = (fun (fuel : int) (bs : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrBinder Base_dData_dList.t_Base_dData_dList_dList) (body : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIr) -> (match (v_Vuna_dCompiler_dIr_dCps_dmResumption bs) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLam (bs, Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, ((v_Vuna_dCompiler_dIr_dCps_dmHandlers (fuel - 1)) body)))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__513) -> ((fun kd -> ((fun rs -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLam (((Base_dData_dList.v_Base_dData_dList_dappend bs) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (kd, (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (rs, Base_dData_dList.C_Base_dData_dList_dList_Nil))))), Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, (((v_Vuna_dCompiler_dIr_dCps_dmScopedCalls (fuel - 1)) rs) ((((v_Vuna_dCompiler_dIr_dCps_dmCps (fuel - 1)) dtb__513) (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrVar (kd))) body))))) (v_Vuna_dCompiler_dIr_dCps_dmFreshR fuel))) (v_Vuna_dCompiler_dIr_dCps_dmFreshTailK fuel))
  | _ -> failwith "DT: impossible branch"
))
# 744 "Vuna/Compiler/Ir/Cps.vuna"
and v_Vuna_dCompiler_dIr_dCps_dmListH = (fun (fuel : int) (xs : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIr Base_dData_dList.t_Base_dData_dList_dList) -> (if (fuel <= 0) then xs else (match xs with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__514, dtb__515) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (((v_Vuna_dCompiler_dIr_dCps_dmHandlers (fuel - 1)) dtb__514), ((v_Vuna_dCompiler_dIr_dCps_dmListH (fuel - 1)) dtb__515)))
  | _ -> failwith "DT: impossible branch"
)))
# 753 "Vuna/Compiler/Ir/Cps.vuna"
and v_Vuna_dCompiler_dIr_dCps_dmFieldsH = (fun (fuel : int) (fs : (string, Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIr) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) -> (if (fuel <= 0) then fs else (match fs with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__516, dtb__517) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Base_dData_dPair.v_Base_dData_dPair_dfirstOf dtb__516); Base_dData_dPair.f_Base_dData_dPair_dPair_second = ((v_Vuna_dCompiler_dIr_dCps_dmHandlers (fuel - 1)) (Base_dData_dPair.v_Base_dData_dPair_dsecondOf dtb__516)) }, ((v_Vuna_dCompiler_dIr_dCps_dmFieldsH (fuel - 1)) dtb__517)))
  | _ -> failwith "DT: impossible branch"
)))
# 762 "Vuna/Compiler/Ir/Cps.vuna"
and v_Vuna_dCompiler_dIr_dCps_dmHandlers = (fun (fuel : int) (e : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIr) -> (if (fuel <= 0) then e else (match e with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLam (dtb__518, dtb__519, dtb__520) -> (((v_Vuna_dCompiler_dIr_dCps_dmHandlerLam (fuel - 1)) dtb__518) dtb__520)
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCtor (dtb__521, dtb__522, dtb__523, dtb__524) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCtor (dtb__521, dtb__522, Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, ((v_Vuna_dCompiler_dIr_dCps_dmListH (fuel - 1)) dtb__524)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRecord (dtb__525, dtb__526, dtb__527) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRecord (dtb__525, Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, ((v_Vuna_dCompiler_dIr_dCps_dmFieldsH (fuel - 1)) dtb__527)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrProj (dtb__528, dtb__529, dtb__530, dtb__531) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrProj (((v_Vuna_dCompiler_dIr_dCps_dmHandlers (fuel - 1)) dtb__528), dtb__529, dtb__530, Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRecUpd (dtb__532, dtb__533, dtb__534, dtb__535) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRecUpd (((v_Vuna_dCompiler_dIr_dCps_dmHandlers (fuel - 1)) dtb__532), dtb__533, ((v_Vuna_dCompiler_dIr_dCps_dmFieldsH (fuel - 1)) dtb__534), Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRtApp (dtb__536, dtb__537) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRtApp (dtb__536, ((v_Vuna_dCompiler_dIr_dCps_dmListH (fuel - 1)) dtb__537)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCast (dtb__538, dtb__539, dtb__540) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCast (dtb__538, dtb__539, ((v_Vuna_dCompiler_dIr_dCps_dmHandlers (fuel - 1)) dtb__540)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLet (dtb__541, dtb__542, dtb__543) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLet (dtb__541, ((v_Vuna_dCompiler_dIr_dCps_dmHandlers (fuel - 1)) dtb__542), ((v_Vuna_dCompiler_dIr_dCps_dmHandlers (fuel - 1)) dtb__543)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (dtb__544, dtb__545, dtb__546) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, ((v_Vuna_dCompiler_dIr_dCps_dmHandlers (fuel - 1)) dtb__545), ((v_Vuna_dCompiler_dIr_dCps_dmHandlers (fuel - 1)) dtb__546)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrIf (dtb__547, dtb__548, dtb__549) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrIf (((v_Vuna_dCompiler_dIr_dCps_dmHandlers (fuel - 1)) dtb__547), ((v_Vuna_dCompiler_dIr_dCps_dmHandlers (fuel - 1)) dtb__548), ((v_Vuna_dCompiler_dIr_dCps_dmHandlers (fuel - 1)) dtb__549)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCase (dtb__550, dtb__551, dtb__552, dtb__553) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCase (dtb__550, Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, ((v_Vuna_dCompiler_dIr_dCps_dmHandlers (fuel - 1)) dtb__552), ((v_Vuna_dCompiler_dIr_dCps_dmHandlersAlts (fuel - 1)) dtb__553)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrNatCase (dtb__554, dtb__555, dtb__556, dtb__557, dtb__558) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrNatCase (((v_Vuna_dCompiler_dIr_dCps_dmHandlers (fuel - 1)) dtb__554), dtb__555, ((v_Vuna_dCompiler_dIr_dCps_dmHandlersAltM (fuel - 1)) dtb__556), ((v_Vuna_dCompiler_dIr_dCps_dmHandlersAltM (fuel - 1)) dtb__557), ((v_Vuna_dCompiler_dIr_dCps_dmHandlersAltM (fuel - 1)) dtb__558)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrConcatMany (dtb__559) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrConcatMany (((v_Vuna_dCompiler_dIr_dCps_dmListH (fuel - 1)) dtb__559)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrEffThunk (dtb__560, dtb__561, dtb__562, dtb__563, dtb__564) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrEffThunk (dtb__560, dtb__561, dtb__562, dtb__563, ((v_Vuna_dCompiler_dIr_dCps_dmHandlers (fuel - 1)) dtb__564)))
  | _ -> e
)))
# 784 "Vuna/Compiler/Ir/Cps.vuna"
and v_Vuna_dCompiler_dIr_dCps_dmHandlersAlts = (fun (fuel : int) (alts : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrAlt Base_dData_dList.t_Base_dData_dList_dList) -> (if (fuel <= 0) then alts else (match alts with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__565, dtb__566) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltCtor = (dtb__565).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltCtor; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBinders = (dtb__565).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBinders; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBody = ((v_Vuna_dCompiler_dIr_dCps_dmHandlers (fuel - 1)) (dtb__565).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBody) }, ((v_Vuna_dCompiler_dIr_dCps_dmHandlersAlts (fuel - 1)) dtb__566)))
  | _ -> failwith "DT: impossible branch"
)))
# 793 "Vuna/Compiler/Ir/Cps.vuna"
and v_Vuna_dCompiler_dIr_dCps_dmHandlersAltM = (fun (fuel : int) (m : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrAlt Base_dData_dMaybe.t_Base_dData_dMaybe_dMaybe) -> (if (fuel <= 0) then m else (match m with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__567) -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ({ Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltCtor = (dtb__567).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltCtor; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBinders = (dtb__567).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBinders; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBody = ((v_Vuna_dCompiler_dIr_dCps_dmHandlers (fuel - 1)) (dtb__567).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBody) }))
  | _ -> failwith "DT: impossible branch"
)))

# 1199 "Vuna/Compiler/Ir/Cps.vuna"
let rec v_Vuna_dCompiler_dIr_dCps_dlastBinderOf = (fun (bs : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrBinder Base_dData_dList.t_Base_dData_dList_dList) -> (match bs with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__568, dtb__569) -> (match dtb__569 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__568))
  | _ -> (v_Vuna_dCompiler_dIr_dCps_dlastBinderOf dtb__569)
)
  | _ -> failwith "DT: impossible branch"
))

# 1226 "Vuna/Compiler/Ir/Cps.vuna"
let v_Vuna_dCompiler_dIr_dCps_dmHandlerFun = (fun (fuel : int) (body : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIr) -> (if (fuel <= 0) then body else (match body with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLam (dtb__570, dtb__571, dtb__572) -> ((fun nd_uscrut5 -> (match nd_uscrut5 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__573, dtb__574) -> (match dtb__574 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__575, dtb__576) -> ((fun kd -> ((fun rs -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLam (((Base_dData_dList.v_Base_dData_dList_dappend dtb__570) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (kd, (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (rs, Base_dData_dList.C_Base_dData_dList_dList_Nil))))), Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, (((v_Vuna_dCompiler_dIr_dCps_dmScopedCalls (fuel - 1)) rs) ((((v_Vuna_dCompiler_dIr_dCps_dmCps (fuel - 1)) dtb__575) (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrVar (kd))) dtb__572))))) (v_Vuna_dCompiler_dIr_dCps_dmFreshR fuel))) (v_Vuna_dCompiler_dIr_dCps_dmFreshK fuel))
  | _ -> body
)
  | _ -> body
)) (v_Vuna_dCompiler_dIr_dCps_druntimeBinders dtb__570))
  | _ -> body
)))

# 1281 "Vuna/Compiler/Ir/Cps.vuna"
let v_Vuna_dCompiler_dIr_dCps_disContBinder = (fun (b : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrBinder) -> ((fun n -> (if (if ((Base_dData_dString.v_Base_dData_dString_dstartsWith "__cpsK") n) then true else ((Base_dData_dString.v_Base_dData_dString_dstartsWith "__mchTK") n)) then true else ((Base_dData_dString.v_Base_dData_dString_dstartsWith "__mchK") n))) (v_Vuna_dCompiler_dIr_dCps_dmBNameText (b).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrBinder_irBinderName)))

# 1287 "Vuna/Compiler/Ir/Cps.vuna"
let rec v_Vuna_dCompiler_dIr_dCps_dmApplys = (fun (fuel : int) (e : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIr) -> (if (fuel <= 0) then e else (match e with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (dtb__577, dtb__578, dtb__579) -> (match dtb__578 with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrVar (dtb__580) -> (if (v_Vuna_dCompiler_dIr_dCps_disContBinder dtb__580) then (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRtApp (v_Vuna_dCompiler_dIr_dCps_dirMApplyName, (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ((Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrVar (dtb__580)), (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (((v_Vuna_dCompiler_dIr_dCps_dmApplys (fuel - 1)) dtb__579), Base_dData_dList.C_Base_dData_dList_dList_Nil)))))) else (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, ((v_Vuna_dCompiler_dIr_dCps_dmApplys (fuel - 1)) dtb__578), ((v_Vuna_dCompiler_dIr_dCps_dmApplys (fuel - 1)) dtb__579))))
  | _ -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, ((v_Vuna_dCompiler_dIr_dCps_dmApplys (fuel - 1)) dtb__578), ((v_Vuna_dCompiler_dIr_dCps_dmApplys (fuel - 1)) dtb__579)))
)
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRtApp (dtb__581, dtb__582) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRtApp (dtb__581, ((v_Vuna_dCompiler_dIr_dCps_dmApplysList (fuel - 1)) dtb__582)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCtor (dtb__583, dtb__584, dtb__585, dtb__586) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCtor (dtb__583, dtb__584, Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, ((v_Vuna_dCompiler_dIr_dCps_dmApplysList (fuel - 1)) dtb__586)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRecord (dtb__587, dtb__588, dtb__589) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRecord (dtb__587, Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, ((v_Vuna_dCompiler_dIr_dCps_dmApplysFields (fuel - 1)) dtb__589)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrProj (dtb__590, dtb__591, dtb__592, dtb__593) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrProj (((v_Vuna_dCompiler_dIr_dCps_dmApplys (fuel - 1)) dtb__590), dtb__591, dtb__592, Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRecUpd (dtb__594, dtb__595, dtb__596, dtb__597) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRecUpd (((v_Vuna_dCompiler_dIr_dCps_dmApplys (fuel - 1)) dtb__594), dtb__595, ((v_Vuna_dCompiler_dIr_dCps_dmApplysFields (fuel - 1)) dtb__596), Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCast (dtb__598, dtb__599, dtb__600) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCast (dtb__598, dtb__599, ((v_Vuna_dCompiler_dIr_dCps_dmApplys (fuel - 1)) dtb__600)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLet (dtb__601, dtb__602, dtb__603) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLet (dtb__601, ((v_Vuna_dCompiler_dIr_dCps_dmApplys (fuel - 1)) dtb__602), ((v_Vuna_dCompiler_dIr_dCps_dmApplys (fuel - 1)) dtb__603)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLam (dtb__604, dtb__605, dtb__606) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLam (dtb__604, dtb__605, ((v_Vuna_dCompiler_dIr_dCps_dmApplys (fuel - 1)) dtb__606)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrIf (dtb__607, dtb__608, dtb__609) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrIf (((v_Vuna_dCompiler_dIr_dCps_dmApplys (fuel - 1)) dtb__607), ((v_Vuna_dCompiler_dIr_dCps_dmApplys (fuel - 1)) dtb__608), ((v_Vuna_dCompiler_dIr_dCps_dmApplys (fuel - 1)) dtb__609)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCase (dtb__610, dtb__611, dtb__612, dtb__613) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCase (dtb__610, Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, ((v_Vuna_dCompiler_dIr_dCps_dmApplys (fuel - 1)) dtb__612), ((v_Vuna_dCompiler_dIr_dCps_dmApplysAlts (fuel - 1)) dtb__613)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrNatCase (dtb__614, dtb__615, dtb__616, dtb__617, dtb__618) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrNatCase (((v_Vuna_dCompiler_dIr_dCps_dmApplys (fuel - 1)) dtb__614), dtb__615, ((v_Vuna_dCompiler_dIr_dCps_dmApplysAltM (fuel - 1)) dtb__616), ((v_Vuna_dCompiler_dIr_dCps_dmApplysAltM (fuel - 1)) dtb__617), ((v_Vuna_dCompiler_dIr_dCps_dmApplysAltM (fuel - 1)) dtb__618)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrConcatMany (dtb__619) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrConcatMany (((v_Vuna_dCompiler_dIr_dCps_dmApplysList (fuel - 1)) dtb__619)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrEffThunk (dtb__620, dtb__621, dtb__622, dtb__623, dtb__624) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrEffThunk (dtb__620, dtb__621, dtb__622, dtb__623, ((v_Vuna_dCompiler_dIr_dCps_dmApplys (fuel - 1)) dtb__624)))
  | _ -> e
)))
# 1312 "Vuna/Compiler/Ir/Cps.vuna"
and v_Vuna_dCompiler_dIr_dCps_dmApplysList = (fun (fuel : int) (xs : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIr Base_dData_dList.t_Base_dData_dList_dList) -> (if (fuel <= 0) then xs else (match xs with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__625, dtb__626) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (((v_Vuna_dCompiler_dIr_dCps_dmApplys (fuel - 1)) dtb__625), ((v_Vuna_dCompiler_dIr_dCps_dmApplysList (fuel - 1)) dtb__626)))
  | _ -> failwith "DT: impossible branch"
)))
# 1321 "Vuna/Compiler/Ir/Cps.vuna"
and v_Vuna_dCompiler_dIr_dCps_dmApplysFields = (fun (fuel : int) (fs : (string, Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIr) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) -> (if (fuel <= 0) then fs else (match fs with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__627, dtb__628) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Base_dData_dPair.v_Base_dData_dPair_dfirstOf dtb__627); Base_dData_dPair.f_Base_dData_dPair_dPair_second = ((v_Vuna_dCompiler_dIr_dCps_dmApplys (fuel - 1)) (Base_dData_dPair.v_Base_dData_dPair_dsecondOf dtb__627)) }, ((v_Vuna_dCompiler_dIr_dCps_dmApplysFields (fuel - 1)) dtb__628)))
  | _ -> failwith "DT: impossible branch"
)))
# 1330 "Vuna/Compiler/Ir/Cps.vuna"
and v_Vuna_dCompiler_dIr_dCps_dmApplysAlts = (fun (fuel : int) (alts : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrAlt Base_dData_dList.t_Base_dData_dList_dList) -> (if (fuel <= 0) then alts else (match alts with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__629, dtb__630) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltCtor = (dtb__629).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltCtor; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBinders = (dtb__629).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBinders; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBody = ((v_Vuna_dCompiler_dIr_dCps_dmApplys (fuel - 1)) (dtb__629).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBody) }, ((v_Vuna_dCompiler_dIr_dCps_dmApplysAlts (fuel - 1)) dtb__630)))
  | _ -> failwith "DT: impossible branch"
)))
# 1339 "Vuna/Compiler/Ir/Cps.vuna"
and v_Vuna_dCompiler_dIr_dCps_dmApplysAltM = (fun (fuel : int) (m : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrAlt Base_dData_dMaybe.t_Base_dData_dMaybe_dMaybe) -> (if (fuel <= 0) then m else (match m with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__631) -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ({ Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltCtor = (dtb__631).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltCtor; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBinders = (dtb__631).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBinders; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBody = ((v_Vuna_dCompiler_dIr_dCps_dmApplys (fuel - 1)) (dtb__631).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBody) }))
  | _ -> failwith "DT: impossible branch"
)))

# 1354 "Vuna/Compiler/Ir/Cps.vuna"
let rec v_Vuna_dCompiler_dIr_dCps_dmMarked = (fun (fuel : int) (e : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIr) -> (if (fuel <= 0) then e else ((fun nd_uscrut2 -> (match nd_uscrut2 with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrEffThunk (dtb__632, dtb__633, dtb__634, dtb__635, dtb__636) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrEffThunk (dtb__632, dtb__633, dtb__634, dtb__635, ((v_Vuna_dCompiler_dIr_dCps_dmMarked (fuel - 1)) dtb__636)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrConcatMany (dtb__637) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrConcatMany (((v_Vuna_dCompiler_dIr_dCps_dmMarkedList (fuel - 1)) dtb__637)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrNatCase (dtb__638, dtb__639, dtb__640, dtb__641, dtb__642) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrNatCase (((v_Vuna_dCompiler_dIr_dCps_dmMarked (fuel - 1)) dtb__638), dtb__639, ((v_Vuna_dCompiler_dIr_dCps_dmMarkedAltM (fuel - 1)) dtb__640), ((v_Vuna_dCompiler_dIr_dCps_dmMarkedAltM (fuel - 1)) dtb__641), ((v_Vuna_dCompiler_dIr_dCps_dmMarkedAltM (fuel - 1)) dtb__642)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCase (dtb__643, dtb__644, dtb__645, dtb__646) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCase (dtb__643, Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, ((v_Vuna_dCompiler_dIr_dCps_dmMarked (fuel - 1)) dtb__645), ((v_Vuna_dCompiler_dIr_dCps_dmMarkedAlts (fuel - 1)) dtb__646)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrIf (dtb__647, dtb__648, dtb__649) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrIf (((v_Vuna_dCompiler_dIr_dCps_dmMarked (fuel - 1)) dtb__647), ((v_Vuna_dCompiler_dIr_dCps_dmMarked (fuel - 1)) dtb__648), ((v_Vuna_dCompiler_dIr_dCps_dmMarked (fuel - 1)) dtb__649)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (dtb__650, dtb__651, dtb__652) -> (match dtb__651 with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (dtb__653, dtb__654, dtb__655) -> (match dtb__654 with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRt (dtb__656) -> (if (dtb__656 = "@ir@m@self") then (match dtb__652 with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLam (dtb__657, dtb__658, dtb__659) -> (match dtb__657 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__660, dtb__661) -> (match dtb__661 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRt (v_Vuna_dCompiler_dIr_dCps_dirMRunName)), (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRt ("@ir@m@self")), ((v_Vuna_dCompiler_dIr_dCps_dmMarked (fuel - 1)) dtb__655))), v_Vuna_dCompiler_dIr_dCps_dmDoneCont))))
  | _ -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, ((v_Vuna_dCompiler_dIr_dCps_dmMarked (fuel - 1)) dtb__651), ((v_Vuna_dCompiler_dIr_dCps_dmMarked (fuel - 1)) dtb__652)))
)
  | _ -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, ((v_Vuna_dCompiler_dIr_dCps_dmMarked (fuel - 1)) dtb__651), ((v_Vuna_dCompiler_dIr_dCps_dmMarked (fuel - 1)) dtb__652)))
)
  | _ -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, ((v_Vuna_dCompiler_dIr_dCps_dmMarked (fuel - 1)) dtb__651), ((v_Vuna_dCompiler_dIr_dCps_dmMarked (fuel - 1)) dtb__652)))
) else (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, ((v_Vuna_dCompiler_dIr_dCps_dmMarked (fuel - 1)) dtb__651), ((v_Vuna_dCompiler_dIr_dCps_dmMarked (fuel - 1)) dtb__652))))
  | _ -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, ((v_Vuna_dCompiler_dIr_dCps_dmMarked (fuel - 1)) dtb__651), ((v_Vuna_dCompiler_dIr_dCps_dmMarked (fuel - 1)) dtb__652)))
)
  | _ -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, ((v_Vuna_dCompiler_dIr_dCps_dmMarked (fuel - 1)) dtb__651), ((v_Vuna_dCompiler_dIr_dCps_dmMarked (fuel - 1)) dtb__652)))
)
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLet (dtb__662, dtb__663, dtb__664) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLet (dtb__662, ((v_Vuna_dCompiler_dIr_dCps_dmMarked (fuel - 1)) dtb__663), ((v_Vuna_dCompiler_dIr_dCps_dmMarked (fuel - 1)) dtb__664)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCast (dtb__665, dtb__666, dtb__667) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCast (dtb__665, dtb__666, ((v_Vuna_dCompiler_dIr_dCps_dmMarked (fuel - 1)) dtb__667)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRecUpd (dtb__668, dtb__669, dtb__670, dtb__671) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRecUpd (((v_Vuna_dCompiler_dIr_dCps_dmMarked (fuel - 1)) dtb__668), dtb__669, ((v_Vuna_dCompiler_dIr_dCps_dmMarkedFields (fuel - 1)) dtb__670), Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrProj (dtb__672, dtb__673, dtb__674, dtb__675) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrProj (((v_Vuna_dCompiler_dIr_dCps_dmMarked (fuel - 1)) dtb__672), dtb__673, dtb__674, Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRecord (dtb__676, dtb__677, dtb__678) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRecord (dtb__676, Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, ((v_Vuna_dCompiler_dIr_dCps_dmMarkedFields (fuel - 1)) dtb__678)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCtor (dtb__679, dtb__680, dtb__681, dtb__682) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCtor (dtb__679, dtb__680, Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, ((v_Vuna_dCompiler_dIr_dCps_dmMarkedList (fuel - 1)) dtb__682)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRtApp (dtb__683, dtb__684) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRtApp (dtb__683, ((v_Vuna_dCompiler_dIr_dCps_dmMarkedList (fuel - 1)) dtb__684)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLam (dtb__685, dtb__686, dtb__687) -> (if (if (v_Vuna_dCompiler_dIr_dCps_disEffContLambda dtb__686) then (Base_dData_dBool.v_Base_dData_dBool_dnot (v_Vuna_dCompiler_dIr_dCps_disEffThunkBody dtb__687)) else false) then (((((v_Vuna_dCompiler_dIr_dCps_dmEffContLambda (fuel - 1)) v_Vuna_dCompiler_dIr_dCps_dmNoResumption) dtb__685) dtb__686) dtb__687) else (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLam (dtb__685, dtb__686, ((v_Vuna_dCompiler_dIr_dCps_dmMarked (fuel - 1)) dtb__687))))
  | _ -> e
)) e)))
# 1378 "Vuna/Compiler/Ir/Cps.vuna"
and v_Vuna_dCompiler_dIr_dCps_dmMarkedList = (fun (fuel : int) (xs : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIr Base_dData_dList.t_Base_dData_dList_dList) -> (if (fuel <= 0) then xs else (match xs with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__688, dtb__689) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (((v_Vuna_dCompiler_dIr_dCps_dmMarked (fuel - 1)) dtb__688), ((v_Vuna_dCompiler_dIr_dCps_dmMarkedList (fuel - 1)) dtb__689)))
  | _ -> failwith "DT: impossible branch"
)))
# 1387 "Vuna/Compiler/Ir/Cps.vuna"
and v_Vuna_dCompiler_dIr_dCps_dmMarkedFields = (fun (fuel : int) (fs : (string, Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIr) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) -> (if (fuel <= 0) then fs else (match fs with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__690, dtb__691) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Base_dData_dPair.v_Base_dData_dPair_dfirstOf dtb__690); Base_dData_dPair.f_Base_dData_dPair_dPair_second = ((v_Vuna_dCompiler_dIr_dCps_dmMarked (fuel - 1)) (Base_dData_dPair.v_Base_dData_dPair_dsecondOf dtb__690)) }, ((v_Vuna_dCompiler_dIr_dCps_dmMarkedFields (fuel - 1)) dtb__691)))
  | _ -> failwith "DT: impossible branch"
)))
# 1396 "Vuna/Compiler/Ir/Cps.vuna"
and v_Vuna_dCompiler_dIr_dCps_dmMarkedAlts = (fun (fuel : int) (alts : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrAlt Base_dData_dList.t_Base_dData_dList_dList) -> (if (fuel <= 0) then alts else (match alts with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__692, dtb__693) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltCtor = (dtb__692).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltCtor; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBinders = (dtb__692).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBinders; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBody = ((v_Vuna_dCompiler_dIr_dCps_dmMarked (fuel - 1)) (dtb__692).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBody) }, ((v_Vuna_dCompiler_dIr_dCps_dmMarkedAlts (fuel - 1)) dtb__693)))
  | _ -> failwith "DT: impossible branch"
)))
# 1405 "Vuna/Compiler/Ir/Cps.vuna"
and v_Vuna_dCompiler_dIr_dCps_dmMarkedAltM = (fun (fuel : int) (m : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrAlt Base_dData_dMaybe.t_Base_dData_dMaybe_dMaybe) -> (if (fuel <= 0) then m else (match m with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__694) -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ({ Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltCtor = (dtb__694).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltCtor; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBinders = (dtb__694).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBinders; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBody = ((v_Vuna_dCompiler_dIr_dCps_dmMarked (fuel - 1)) (dtb__694).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBody) }))
  | _ -> failwith "DT: impossible branch"
)))

# 1414 "Vuna/Compiler/Ir/Cps.vuna"
let v_Vuna_dCompiler_dIr_dCps_dmMarkedDef = (fun (mc0 : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrDef) -> (match mc0 with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrDef_IrDef (dtb__695, dtb__696, dtb__697, dtb__698, dtb__699, dtb__700, dtb__701, dtb__702) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrDef_IrDef (dtb__695, dtb__696, dtb__697, dtb__698, ((v_Vuna_dCompiler_dIr_dCps_dmMarked (v_Vuna_dCompiler_dIr_dCps_dcpsFuelOfBody dtb__699)) dtb__699), dtb__700, dtb__701, dtb__702))
  | _ -> mc0
))

# 1420 "Vuna/Compiler/Ir/Cps.vuna"
let v_Vuna_dCompiler_dIr_dCps_dmApplysDef = (fun (mc0 : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrDef) -> (match mc0 with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrDef_IrDef (dtb__703, dtb__704, dtb__705, dtb__706, dtb__707, dtb__708, dtb__709, dtb__710) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrDef_IrDef (dtb__703, dtb__704, dtb__705, dtb__706, ((v_Vuna_dCompiler_dIr_dCps_dmApplys (v_Vuna_dCompiler_dIr_dCps_dcpsFuelOfBody dtb__707)) dtb__707), dtb__708, dtb__709, dtb__710))
  | _ -> mc0
))

# 1431 "Vuna/Compiler/Ir/Cps.vuna"
let v_Vuna_dCompiler_dIr_dCps_dmachineCtl = "Base.Effect.Core.Control"

# 1210 "Vuna/Compiler/Ir/Cps.vuna"
let v_Vuna_dCompiler_dIr_dCps_dmCleanupDef = (fun (n : string) (body : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIr) -> (if (n = v_Vuna_dCompiler_dIr_dCps_dcleanupPushName) then (match body with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLam (dtb__711, dtb__712, dtb__713) -> (match (v_Vuna_dCompiler_dIr_dCps_dlastBinderOf dtb__711) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__714) -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ((Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLam (dtb__711, Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCtor (Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirEffTypeName, Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirEffMkCtor, Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ((Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLam ((Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ((v_Vuna_dCompiler_dIr_dCps_dmkBinder "__mCleanU"), (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ((v_Vuna_dCompiler_dIr_dCps_dmkBinder "__mCleanK"), Base_dData_dList.C_Base_dData_dList_dList_Nil)))), Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCtor (v_Vuna_dCompiler_dIr_dCps_dmachineCtl, (v_Vuna_dCompiler_dIr_dCps_dmachineCtl ^ ".MkPushCleanup"), Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ((Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCtor ("Base.Effect.Core.Cleanup", "Base.Effect.Core.Cleanup.MkCleanup", Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ((Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrVar (dtb__714)), Base_dData_dList.C_Base_dData_dList_dList_Nil)))), (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ((Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrVar ((v_Vuna_dCompiler_dIr_dCps_dmkBinder "__mCleanK"))), Base_dData_dList.C_Base_dData_dList_dList_Nil)))))))), Base_dData_dList.C_Base_dData_dList_dList_Nil))))))))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
) else (if (n = v_Vuna_dCompiler_dIr_dCps_dcleanupPopName) then (match body with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLam (dtb__715, dtb__716, dtb__717) -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ((Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLam (dtb__715, Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCtor (Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirEffTypeName, Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirEffMkCtor, Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ((Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLam ((Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ((v_Vuna_dCompiler_dIr_dCps_dmkBinder "__mCleanU"), (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ((v_Vuna_dCompiler_dIr_dCps_dmkBinder "__mCleanK"), Base_dData_dList.C_Base_dData_dList_dList_Nil)))), Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCtor (v_Vuna_dCompiler_dIr_dCps_dmachineCtl, (v_Vuna_dCompiler_dIr_dCps_dmachineCtl ^ ".MkPopCleanup"), Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ((Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrVar ((v_Vuna_dCompiler_dIr_dCps_dmkBinder "__mCleanK"))), Base_dData_dList.C_Base_dData_dList_dList_Nil)))))), Base_dData_dList.C_Base_dData_dList_dList_Nil))))))))
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
) else Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing)))

# 1242 "Vuna/Compiler/Ir/Cps.vuna"
let v_Vuna_dCompiler_dIr_dCps_dmDef = (fun (handlers : string Base_dData_dList.t_Base_dData_dList_dList) (fuel : int) (d : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrDef) -> (if (fuel <= 0) then d else (match d with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrDef_IrExternDef (dtb__718, dtb__719, dtb__720, dtb__721) -> d
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrDef_IrDef (dtb__722, dtb__723, dtb__724, dtb__725, dtb__726, dtb__727, dtb__728, dtb__729) -> ((fun marked -> ((fun h -> ((fun ar2 -> ((fun sigTy1 -> ((fun b -> (if (if (if (dtb__722 = v_Vuna_dCompiler_dIr_dCps_drunPureName) then true else (dtb__722 = v_Vuna_dCompiler_dIr_dCps_drunEffName)) then true else (dtb__722 = v_Vuna_dCompiler_dIr_dCps_drunMainName)) then (match ((v_Vuna_dCompiler_dIr_dCps_dmTrampolineBody dtb__722) b) with
  | Base_dData_dResult.C_Base_dData_dResult_dResult_Ok (dtb__730) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrDef_IrDef (dtb__722, ar2, dtb__724, sigTy1, dtb__730, dtb__727, dtb__728, dtb__729))
  | Base_dData_dResult.C_Base_dData_dResult_dResult_Err (dtb__731) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrDef_IrDef (dtb__722, ar2, dtb__724, sigTy1, b, dtb__727, dtb__728, dtb__729))
  | _ -> failwith "DT: impossible branch"
) else (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrDef_IrDef (dtb__722, ar2, dtb__724, sigTy1, b, dtb__727, dtb__728, dtb__729)))) ((v_Vuna_dCompiler_dIr_dCps_dmSyms (fuel - 1)) ((v_Vuna_dCompiler_dIr_dCps_dmHandlers (fuel - 1)) h)))) (if (ar2 = dtb__723) then dtb__725 else Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing))) (if marked then (dtb__723 + 2) else dtb__723))) (match ((v_Vuna_dCompiler_dIr_dCps_dmCleanupDef dtb__722) dtb__726) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__732) -> dtb__732
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (if marked then ((v_Vuna_dCompiler_dIr_dCps_dmHandlerFun (fuel - 1)) dtb__726) else dtb__726)
  | _ -> failwith "DT: impossible branch"
))) ((v_Vuna_dCompiler_dIr_dCps_dmemName dtb__722) handlers))
  | _ -> failwith "DT: impossible branch"
)))

# 1268 "Vuna/Compiler/Ir/Cps.vuna"
let rec v_Vuna_dCompiler_dIr_dCps_dmDefs = (fun (handlers : string Base_dData_dList.t_Base_dData_dList_dList) (fuel : int) (ds : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrDef Base_dData_dList.t_Base_dData_dList_dList) -> (if (fuel <= 0) then ds else (match ds with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__733, dtb__734) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ((((v_Vuna_dCompiler_dIr_dCps_dmDef handlers) (fuel - 1)) dtb__733), (((v_Vuna_dCompiler_dIr_dCps_dmDefs handlers) (fuel - 1)) dtb__734)))
  | _ -> failwith "DT: impossible branch"
)))

# 1434 "Vuna/Compiler/Ir/Cps.vuna"
let v_Vuna_dCompiler_dIr_dCps_dmachineCtorOf = (fun (sym : string) -> (if (sym = v_Vuna_dCompiler_dIr_dCps_dirMDoneName) then (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ("MkDone")) else (if (sym = v_Vuna_dCompiler_dIr_dCps_dirMApplyName) then (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ("MkApply")) else (if (sym = v_Vuna_dCompiler_dIr_dCps_dirMPerformName) then (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ("MkPerform")) else (if (sym = v_Vuna_dCompiler_dIr_dCps_dirMHandleName) then (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ("MkHandle")) else (if (sym = v_Vuna_dCompiler_dIr_dCps_dirMSelfName) then (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ("MkSelf")) else Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing))))))

# 1451 "Vuna/Compiler/Ir/Cps.vuna"
let v_Vuna_dCompiler_dIr_dCps_dmachineArgsOf = (fun (sym : string) (args : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIr Base_dData_dList.t_Base_dData_dList_dList) -> (if (sym = v_Vuna_dCompiler_dIr_dCps_dirMHandleName) then ((fun nd_uscrut2 -> (match nd_uscrut2 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__735, dtb__736) -> (match dtb__736 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__737, dtb__738) -> (match dtb__738 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__739, dtb__740) -> (match dtb__740 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__741, dtb__742) -> (match dtb__742 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__743, dtb__744) -> (match dtb__744 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__745, dtb__746) -> (match dtb__746 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__747, dtb__748) -> (match dtb__748 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__749, dtb__750) -> ((Base_dData_dList.v_Base_dData_dList_dappend (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__739, (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__741, (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__743, (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__745, (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__747, Base_dData_dList.C_Base_dData_dList_dList_Nil))))))))))) dtb__750)
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
)
  | _ -> args
)
  | _ -> args
)) args) else (if (sym = v_Vuna_dCompiler_dIr_dCps_dirMPerformName) then ((fun nd_uscrut2 -> (match nd_uscrut2 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__751, dtb__752) -> (match dtb__752 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__753, dtb__754) -> (match dtb__754 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__755, dtb__756) -> (match dtb__756 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__757, dtb__758) -> (match dtb__758 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__759, dtb__760) -> ((Base_dData_dList.v_Base_dData_dList_dappend (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__755, (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__757, (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__759, Base_dData_dList.C_Base_dData_dList_dList_Nil))))))) dtb__760)
  | _ -> args
)
  | _ -> args
)
  | _ -> args
)
  | _ -> args
)
  | _ -> args
)) args) else args)))

# 1464 "Vuna/Compiler/Ir/Cps.vuna"
let rec v_Vuna_dCompiler_dIr_dCps_dmSteps = (fun (fuel : int) (e : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIr) -> (if (fuel <= 0) then e else (match e with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRtApp (dtb__761, dtb__762) -> (match (v_Vuna_dCompiler_dIr_dCps_dmachineCtorOf dtb__761) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__763) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCtor (v_Vuna_dCompiler_dIr_dCps_dmachineCtl, (String.concat "" [v_Vuna_dCompiler_dIr_dCps_dmachineCtl; "."; dtb__763]), Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, ((v_Vuna_dCompiler_dIr_dCps_dmStepsList (fuel - 1)) ((v_Vuna_dCompiler_dIr_dCps_dmachineArgsOf dtb__761) dtb__762))))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (if (dtb__761 = v_Vuna_dCompiler_dIr_dCps_dirMRunName) then ((fun nd_uscrut5 -> (match nd_uscrut5 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__764, dtb__765) -> (match dtb__765 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrGlobal ("Base.Effect.Core.machineRun")), ((v_Vuna_dCompiler_dIr_dCps_dmSteps (fuel - 1)) dtb__764)))
  | _ -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRtApp (dtb__761, ((v_Vuna_dCompiler_dIr_dCps_dmStepsList (fuel - 1)) dtb__762)))
)
  | _ -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRtApp (dtb__761, ((v_Vuna_dCompiler_dIr_dCps_dmStepsList (fuel - 1)) dtb__762)))
)) dtb__762) else (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRtApp (dtb__761, ((v_Vuna_dCompiler_dIr_dCps_dmStepsList (fuel - 1)) dtb__762))))
  | _ -> failwith "DT: impossible branch"
)
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (dtb__766, dtb__767, dtb__768) -> ((fun p -> ((fun head -> ((fun args -> (match head with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRt (dtb__769) -> (match (v_Vuna_dCompiler_dIr_dCps_dmachineCtorOf dtb__769) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__770) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCtor (v_Vuna_dCompiler_dIr_dCps_dmachineCtl, (String.concat "" [v_Vuna_dCompiler_dIr_dCps_dmachineCtl; "."; dtb__770]), Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, ((v_Vuna_dCompiler_dIr_dCps_dmStepsList (fuel - 1)) ((v_Vuna_dCompiler_dIr_dCps_dmachineArgsOf dtb__769) args))))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (if (dtb__769 = v_Vuna_dCompiler_dIr_dCps_dirMRunName) then ((fun nd_uscrut10 -> (match nd_uscrut10 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__771, dtb__772) -> (match dtb__772 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrGlobal ("Base.Effect.Core.machineRun")), ((v_Vuna_dCompiler_dIr_dCps_dmSteps (fuel - 1)) dtb__771)))
  | _ -> (((v_Vuna_dCompiler_dIr_dCps_dfoldAppMap (fuel - 1)) ((v_Vuna_dCompiler_dIr_dCps_dmSteps (fuel - 1)) head)) args)
)
  | _ -> (((v_Vuna_dCompiler_dIr_dCps_dfoldAppMap (fuel - 1)) ((v_Vuna_dCompiler_dIr_dCps_dmSteps (fuel - 1)) head)) args)
)) args) else (((v_Vuna_dCompiler_dIr_dCps_dfoldAppMap (fuel - 1)) ((v_Vuna_dCompiler_dIr_dCps_dmSteps (fuel - 1)) head)) args))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> (((v_Vuna_dCompiler_dIr_dCps_dfoldAppMap (fuel - 1)) ((v_Vuna_dCompiler_dIr_dCps_dmSteps (fuel - 1)) head)) args)
)) (Base_dData_dPair.v_Base_dData_dPair_dsecondOf p))) (Base_dData_dPair.v_Base_dData_dPair_dfirstOf p))) (v_Vuna_dCompiler_dIr_dCps_dflattenApp e))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCtor (dtb__773, dtb__774, dtb__775, dtb__776) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCtor (dtb__773, dtb__774, Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, ((v_Vuna_dCompiler_dIr_dCps_dmStepsList (fuel - 1)) dtb__776)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRecord (dtb__777, dtb__778, dtb__779) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRecord (dtb__777, Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, ((v_Vuna_dCompiler_dIr_dCps_dmStepsFields (fuel - 1)) dtb__779)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrProj (dtb__780, dtb__781, dtb__782, dtb__783) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrProj (((v_Vuna_dCompiler_dIr_dCps_dmSteps (fuel - 1)) dtb__780), dtb__781, dtb__782, Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRecUpd (dtb__784, dtb__785, dtb__786, dtb__787) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRecUpd (((v_Vuna_dCompiler_dIr_dCps_dmSteps (fuel - 1)) dtb__784), dtb__785, ((v_Vuna_dCompiler_dIr_dCps_dmStepsFields (fuel - 1)) dtb__786), Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCast (dtb__788, dtb__789, dtb__790) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCast (dtb__788, dtb__789, ((v_Vuna_dCompiler_dIr_dCps_dmSteps (fuel - 1)) dtb__790)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLet (dtb__791, dtb__792, dtb__793) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLet (dtb__791, ((v_Vuna_dCompiler_dIr_dCps_dmSteps (fuel - 1)) dtb__792), ((v_Vuna_dCompiler_dIr_dCps_dmSteps (fuel - 1)) dtb__793)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLam (dtb__794, dtb__795, dtb__796) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLam (dtb__794, dtb__795, ((v_Vuna_dCompiler_dIr_dCps_dmSteps (fuel - 1)) dtb__796)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrIf (dtb__797, dtb__798, dtb__799) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrIf (((v_Vuna_dCompiler_dIr_dCps_dmSteps (fuel - 1)) dtb__797), ((v_Vuna_dCompiler_dIr_dCps_dmSteps (fuel - 1)) dtb__798), ((v_Vuna_dCompiler_dIr_dCps_dmSteps (fuel - 1)) dtb__799)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCase (dtb__800, dtb__801, dtb__802, dtb__803) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCase (dtb__800, Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, ((v_Vuna_dCompiler_dIr_dCps_dmSteps (fuel - 1)) dtb__802), ((v_Vuna_dCompiler_dIr_dCps_dmStepsAlts (fuel - 1)) dtb__803)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrNatCase (dtb__804, dtb__805, dtb__806, dtb__807, dtb__808) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrNatCase (((v_Vuna_dCompiler_dIr_dCps_dmSteps (fuel - 1)) dtb__804), dtb__805, ((v_Vuna_dCompiler_dIr_dCps_dmStepsAltM (fuel - 1)) dtb__806), ((v_Vuna_dCompiler_dIr_dCps_dmStepsAltM (fuel - 1)) dtb__807), ((v_Vuna_dCompiler_dIr_dCps_dmStepsAltM (fuel - 1)) dtb__808)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrConcatMany (dtb__809) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrConcatMany (((v_Vuna_dCompiler_dIr_dCps_dmStepsList (fuel - 1)) dtb__809)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrEffThunk (dtb__810, dtb__811, dtb__812, dtb__813, dtb__814) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrEffThunk (dtb__810, dtb__811, dtb__812, dtb__813, ((v_Vuna_dCompiler_dIr_dCps_dmSteps (fuel - 1)) dtb__814)))
  | _ -> e
)))
# 1511 "Vuna/Compiler/Ir/Cps.vuna"
and v_Vuna_dCompiler_dIr_dCps_dmStepsList = (fun (fuel : int) (xs : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIr Base_dData_dList.t_Base_dData_dList_dList) -> (if (fuel <= 0) then xs else (match xs with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__815, dtb__816) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (((v_Vuna_dCompiler_dIr_dCps_dmSteps (fuel - 1)) dtb__815), ((v_Vuna_dCompiler_dIr_dCps_dmStepsList (fuel - 1)) dtb__816)))
  | _ -> failwith "DT: impossible branch"
)))
# 1520 "Vuna/Compiler/Ir/Cps.vuna"
and v_Vuna_dCompiler_dIr_dCps_dmStepsFields = (fun (fuel : int) (fs : (string, Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIr) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) -> (if (fuel <= 0) then fs else (match fs with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__817, dtb__818) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Base_dData_dPair.v_Base_dData_dPair_dfirstOf dtb__817); Base_dData_dPair.f_Base_dData_dPair_dPair_second = ((v_Vuna_dCompiler_dIr_dCps_dmSteps (fuel - 1)) (Base_dData_dPair.v_Base_dData_dPair_dsecondOf dtb__817)) }, ((v_Vuna_dCompiler_dIr_dCps_dmStepsFields (fuel - 1)) dtb__818)))
  | _ -> failwith "DT: impossible branch"
)))
# 1529 "Vuna/Compiler/Ir/Cps.vuna"
and v_Vuna_dCompiler_dIr_dCps_dmStepsAlts = (fun (fuel : int) (alts : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrAlt Base_dData_dList.t_Base_dData_dList_dList) -> (if (fuel <= 0) then alts else (match alts with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__819, dtb__820) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltCtor = (dtb__819).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltCtor; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBinders = (dtb__819).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBinders; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBody = ((v_Vuna_dCompiler_dIr_dCps_dmSteps (fuel - 1)) (dtb__819).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBody) }, ((v_Vuna_dCompiler_dIr_dCps_dmStepsAlts (fuel - 1)) dtb__820)))
  | _ -> failwith "DT: impossible branch"
)))
# 1538 "Vuna/Compiler/Ir/Cps.vuna"
and v_Vuna_dCompiler_dIr_dCps_dmStepsAltM = (fun (fuel : int) (m : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrAlt Base_dData_dMaybe.t_Base_dData_dMaybe_dMaybe) -> (if (fuel <= 0) then m else (match m with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__821) -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ({ Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltCtor = (dtb__821).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltCtor; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBinders = (dtb__821).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBinders; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBody = ((v_Vuna_dCompiler_dIr_dCps_dmSteps (fuel - 1)) (dtb__821).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBody) }))
  | _ -> failwith "DT: impossible branch"
)))
# 1548 "Vuna/Compiler/Ir/Cps.vuna"
and v_Vuna_dCompiler_dIr_dCps_dfoldAppMap = (fun (fuel : int) (acc : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIr) (xs : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIr Base_dData_dList.t_Base_dData_dList_dList) -> (if (fuel <= 0) then acc else (match xs with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> acc
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__822, dtb__823) -> (((v_Vuna_dCompiler_dIr_dCps_dfoldAppMap (fuel - 1)) (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, acc, ((v_Vuna_dCompiler_dIr_dCps_dmSteps (fuel - 1)) dtb__822)))) dtb__823)
  | _ -> failwith "DT: impossible branch"
)))

# 1558 "Vuna/Compiler/Ir/Cps.vuna"
let v_Vuna_dCompiler_dIr_dCps_dmachineRunGlobal = "Base.Effect.Core.machineRun"

# 1561 "Vuna/Compiler/Ir/Cps.vuna"
let v_Vuna_dCompiler_dIr_dCps_daddDepOnce = (fun (d : string) (ds : string Base_dData_dList.t_Base_dData_dList_dList) -> (if ((v_Vuna_dCompiler_dIr_dCps_dmemName d) ds) then ds else ((Base_dData_dList.v_Base_dData_dList_dappend ds) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (d, Base_dData_dList.C_Base_dData_dList_dList_Nil)))))

# 1564 "Vuna/Compiler/Ir/Cps.vuna"
let v_Vuna_dCompiler_dIr_dCps_dmStepsDef = (fun (mc0 : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrDef) -> (match mc0 with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrDef_IrDef (dtb__824, dtb__825, dtb__826, dtb__827, dtb__828, dtb__829, dtb__830, dtb__831) -> ((fun body2 -> ((fun deps2 -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrDef_IrDef (dtb__824, dtb__825, deps2, dtb__827, body2, dtb__829, dtb__830, dtb__831))) (if ((Vuna_dCompiler_dIr_dAnalysis.v_Vuna_dCompiler_dIr_dAnalysis_dirMentionsGlobal v_Vuna_dCompiler_dIr_dCps_dmachineRunGlobal) body2) then ((v_Vuna_dCompiler_dIr_dCps_daddDepOnce v_Vuna_dCompiler_dIr_dCps_dmachineRunGlobal) dtb__826) else dtb__826))) ((v_Vuna_dCompiler_dIr_dCps_dmSteps (v_Vuna_dCompiler_dIr_dCps_dcpsFuelOfBody dtb__828)) dtb__828))
  | _ -> mc0
))

# 1584 "Vuna/Compiler/Ir/Cps.vuna"
let v_Vuna_dCompiler_dIr_dCps_dcpsUnit = (fun (u : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrUnit) -> (match ((v_Vuna_dCompiler_dIr_dCps_dtransformGroups (v_Vuna_dCompiler_dIr_dCps_dcpsFuelOfDefs ((Base_dData_dList.v_Base_dData_dList_dconcatMap Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirGroupDefs) (u).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrUnit_irUnitGroups))) (u).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrUnit_irUnitGroups) with
  | Base_dData_dResult.C_Base_dData_dResult_dResult_Err (dtb__832) -> (Base_dData_dResult.C_Base_dData_dResult_dResult_Err (dtb__832))
  | Base_dData_dResult.C_Base_dData_dResult_dResult_Ok (dtb__833) -> (Base_dData_dResult.C_Base_dData_dResult_dResult_Ok ({ Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrUnit_irUnitTyDecls = (u).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrUnit_irUnitTyDecls; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrUnit_irUnitGroups = dtb__833; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrUnit_irUnitHasListFamily = (u).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrUnit_irUnitHasListFamily; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrUnit_irUnitTypeRefs = (u).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrUnit_irUnitTypeRefs; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrUnit_irUnitEntry = (u).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrUnit_irUnitEntry }))
  | _ -> failwith "DT: impossible branch"
))

# 1592 "Vuna/Compiler/Ir/Cps.vuna"
let v_Vuna_dCompiler_dIr_dCps_dcpsDefs = (fun (defs : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrDef Base_dData_dList.t_Base_dData_dList_dList) -> ((v_Vuna_dCompiler_dIr_dCps_dtransformDefs (v_Vuna_dCompiler_dIr_dCps_dcpsFuelOfDefs defs)) defs))

# 1573 "Vuna/Compiler/Ir/Cps.vuna"
let v_Vuna_dCompiler_dIr_dCps_dcpsDefsMachine = (fun (defs : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrDef Base_dData_dList.t_Base_dData_dList_dList) -> (match (v_Vuna_dCompiler_dIr_dCps_dcpsDefs defs) with
  | Base_dData_dResult.C_Base_dData_dResult_dResult_Err (dtb__834) -> (Base_dData_dResult.C_Base_dData_dResult_dResult_Err (dtb__834))
  | Base_dData_dResult.C_Base_dData_dResult_dResult_Ok (dtb__835) -> ((fun handlerNames -> (Base_dData_dResult.C_Base_dData_dResult_dResult_Ok (((Base_dData_dList.v_Base_dData_dList_dmap v_Vuna_dCompiler_dIr_dCps_dmStepsDef) ((Base_dData_dList.v_Base_dData_dList_dmap v_Vuna_dCompiler_dIr_dCps_dmApplysDef) ((Base_dData_dList.v_Base_dData_dList_dmap v_Vuna_dCompiler_dIr_dCps_dmMarkedDef) (((v_Vuna_dCompiler_dIr_dCps_dmDefs handlerNames) (v_Vuna_dCompiler_dIr_dCps_dcpsFuelOfDefs dtb__835)) dtb__835))))))) ((v_Vuna_dCompiler_dIr_dCps_dcollectHandleOpsDefs 100000) dtb__835))
  | _ -> failwith "DT: impossible branch"
))
