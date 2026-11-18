open Vuna_runtime
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

# 66 "Vuna/Compiler/Ir/Cps.vuna"
let v_Vuna_dCompiler_dIr_dCps_dirMRunName = "@ir@m@run"

# 69 "Vuna/Compiler/Ir/Cps.vuna"
let v_Vuna_dCompiler_dIr_dCps_dirMDoneName = "@ir@m@done"

# 73 "Vuna/Compiler/Ir/Cps.vuna"
let v_Vuna_dCompiler_dIr_dCps_dirScopedTypeName = "Base.Eff.Scoped"

# 76 "Vuna/Compiler/Ir/Cps.vuna"
let v_Vuna_dCompiler_dIr_dCps_dirScopedMkCtor = "Base.Eff.Scoped.MkScoped"

# 80 "Vuna/Compiler/Ir/Cps.vuna"
let v_Vuna_dCompiler_dIr_dCps_drunThunkName = "Base.Eff.runThunk"

# 83 "Vuna/Compiler/Ir/Cps.vuna"
let v_Vuna_dCompiler_dIr_dCps_drunPureName = "Base.Eff.runPure"

# 86 "Vuna/Compiler/Ir/Cps.vuna"
let v_Vuna_dCompiler_dIr_dCps_drunEffName = "Base.Eff.runEff"

# 89 "Vuna/Compiler/Ir/Cps.vuna"
let v_Vuna_dCompiler_dIr_dCps_drunMainName = "Base.Eff.runMain"

# 92 "Vuna/Compiler/Ir/Cps.vuna"
let v_Vuna_dCompiler_dIr_dCps_dhandleScopedName = "Base.Eff.handleScoped"

# 96 "Vuna/Compiler/Ir/Cps.vuna"
let v_Vuna_dCompiler_dIr_dCps_dstartFuel = 200000

# 102 "Vuna/Compiler/Ir/Cps.vuna"
let v_Vuna_dCompiler_dIr_dCps_dbNameEq = (fun mc0 mc1 -> (match mc0 with
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

# 109 "Vuna/Compiler/Ir/Cps.vuna"
let v_Vuna_dCompiler_dIr_dCps_dbinderEq = (fun mc0 mc1 -> (match mc0 with
  | { Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrBinder_irBinderName = dtb__6; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrBinder_irBinderErased = dtb__7 } -> (match mc1 with
  | { Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrBinder_irBinderName = dtb__8; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrBinder_irBinderErased = dtb__9 } -> (if ((v_Vuna_dCompiler_dIr_dCps_dbNameEq dtb__6) dtb__8) then (((Base_dEq.v_Base_dEq_d_x61__x61_ Base_dEq.v_Eq_uBase_uBool_uBool) dtb__7) dtb__9) else false)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 112 "Vuna/Compiler/Ir/Cps.vuna"
let rec v_Vuna_dCompiler_dIr_dCps_dmemBinder = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__10, dtb__11) -> (if ((v_Vuna_dCompiler_dIr_dCps_dbinderEq mc0) dtb__10) then true else ((v_Vuna_dCompiler_dIr_dCps_dmemBinder mc0) dtb__11))
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 116 "Vuna/Compiler/Ir/Cps.vuna"
let v_Vuna_dCompiler_dIr_dCps_dbinderErased = (fun mc0 -> (match mc0 with
  | { Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrBinder_irBinderName = dtb__12; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrBinder_irBinderErased = dtb__13 } -> dtb__13
  | _ -> failwith "DT: impossible branch"
))

# 120 "Vuna/Compiler/Ir/Cps.vuna"
let v_Vuna_dCompiler_dIr_dCps_druntimeBinders = (fun bs -> ((Base_dList.v_Base_dList_dfilter (fun b -> (Base_dBool.v_Base_dBool_dnot (v_Vuna_dCompiler_dIr_dCps_dbinderErased b)))) bs))

# 123 "Vuna/Compiler/Ir/Cps.vuna"
let v_Vuna_dCompiler_dIr_dCps_dmkBinder = (fun name -> (Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dmkIrBinder name))

# 128 "Vuna/Compiler/Ir/Cps.vuna"
let v_Vuna_dCompiler_dIr_dCps_dfreshV = (fun fuel -> (v_Vuna_dCompiler_dIr_dCps_dmkBinder ("__cpsV" ^ (bi_strFromInt fuel))))

# 131 "Vuna/Compiler/Ir/Cps.vuna"
let v_Vuna_dCompiler_dIr_dCps_dfreshK = (fun fuel -> (v_Vuna_dCompiler_dIr_dCps_dmkBinder ("__cpsK" ^ (bi_strFromInt fuel))))

# 134 "Vuna/Compiler/Ir/Cps.vuna"
let v_Vuna_dCompiler_dIr_dCps_dfreshU = (fun fuel -> (v_Vuna_dCompiler_dIr_dCps_dmkBinder ("__cpsU" ^ (bi_strFromInt fuel))))

# 137 "Vuna/Compiler/Ir/Cps.vuna"
let v_Vuna_dCompiler_dIr_dCps_dfreshA = (fun fuel i -> (v_Vuna_dCompiler_dIr_dCps_dmkBinder (String.concat "" ["__cpsA"; (bi_strFromInt fuel); "_"; (bi_strFromInt i)])))

# 140 "Vuna/Compiler/Ir/Cps.vuna"
let rec v_Vuna_dCompiler_dIr_dCps_dapplyAll = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__14, dtb__15) -> ((v_Vuna_dCompiler_dIr_dCps_dapplyAll (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (mc0, dtb__14))) dtb__15)
  | Base_dList.C_Base_dList_dList_Nil -> mc0
  | _ -> failwith "DT: impossible branch"
))

# 144 "Vuna/Compiler/Ir/Cps.vuna"
let rec v_Vuna_dCompiler_dIr_dCps_dflattenApp = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (dtb__16, dtb__17) -> ((fun p -> { Base_dPair.f_Base_dPair_dPair_first = (Base_dPair.v_Base_dPair_dfirstOf p); Base_dPair.f_Base_dPair_dPair_second = ((Base_dList.v_Base_dList_dappend (Base_dPair.v_Base_dPair_dsecondOf p)) (Base_dList.C_Base_dList_dList__x58__x58_ (dtb__17, Base_dList.C_Base_dList_dList_Nil))) }) (v_Vuna_dCompiler_dIr_dCps_dflattenApp dtb__16))
  | _ -> { Base_dPair.f_Base_dPair_dPair_first = mc0; Base_dPair.f_Base_dPair_dPair_second = Base_dList.C_Base_dList_dList_Nil }
))

# 178 "Vuna/Compiler/Ir/Cps.vuna"
let v_Vuna_dCompiler_dIr_dCps_disThunkCtor = (fun family ctor -> (if (if (family = Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirEffTypeName) then (ctor = Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirEffMkCtor) else false) then true else (if (family = v_Vuna_dCompiler_dIr_dCps_dirScopedTypeName) then (ctor = v_Vuna_dCompiler_dIr_dCps_dirScopedMkCtor) else false)))

# 183 "Vuna/Compiler/Ir/Cps.vuna"
let v_Vuna_dCompiler_dIr_dCps_disThunkAlt = (fun alt -> ((fun nd_uscrut1 -> (match nd_uscrut1 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> false
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__18) -> (match dtb__18 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__19; Base_dPair.f_Base_dPair_dPair_second = dtb__20 } -> ((v_Vuna_dCompiler_dIr_dCps_disThunkCtor dtb__19) dtb__20)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) (alt).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltCtor))

# 189 "Vuna/Compiler/Ir/Cps.vuna"
let v_Vuna_dCompiler_dIr_dCps_dthunkBindersOfAlt = (fun alt -> (if (v_Vuna_dCompiler_dIr_dCps_disThunkAlt alt) then (v_Vuna_dCompiler_dIr_dCps_druntimeBinders (alt).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBinders) else Base_dList.C_Base_dList_dList_Nil))

# 152 "Vuna/Compiler/Ir/Cps.vuna"
let rec v_Vuna_dCompiler_dIr_dCps_dmapDirect = (fun fuel xs -> (if (fuel <= 0) then xs else (match xs with
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__21, dtb__22) -> (Base_dList.C_Base_dList_dList__x58__x58_ (((v_Vuna_dCompiler_dIr_dCps_dtransformDirect (fuel - 1)) dtb__21), ((v_Vuna_dCompiler_dIr_dCps_dmapDirect (fuel - 1)) dtb__22)))
  | _ -> failwith "DT: impossible branch"
)))
# 158 "Vuna/Compiler/Ir/Cps.vuna"
and v_Vuna_dCompiler_dIr_dCps_dmapAltDirect = (fun fuel xs -> (if (fuel <= 0) then xs else (match xs with
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__23, dtb__24) -> (Base_dList.C_Base_dList_dList__x58__x58_ (((v_Vuna_dCompiler_dIr_dCps_dtransformAltDirect (fuel - 1)) dtb__23), ((v_Vuna_dCompiler_dIr_dCps_dmapAltDirect (fuel - 1)) dtb__24)))
  | _ -> failwith "DT: impossible branch"
)))
# 164 "Vuna/Compiler/Ir/Cps.vuna"
and v_Vuna_dCompiler_dIr_dCps_dmapAltCps = (fun fuel env xs k -> (if (fuel <= 0) then xs else (match xs with
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__25, dtb__26) -> (Base_dList.C_Base_dList_dList__x58__x58_ (((((v_Vuna_dCompiler_dIr_dCps_dcpsAlt (fuel - 1)) env) dtb__25) k), ((((v_Vuna_dCompiler_dIr_dCps_dmapAltCps (fuel - 1)) env) dtb__26) k)))
  | _ -> failwith "DT: impossible branch"
)))
# 170 "Vuna/Compiler/Ir/Cps.vuna"
and v_Vuna_dCompiler_dIr_dCps_dmapFieldsDirect = (fun fuel xs -> (if (fuel <= 0) then xs else (match xs with
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__27, dtb__28) -> (Base_dList.C_Base_dList_dList__x58__x58_ ({ Base_dPair.f_Base_dPair_dPair_first = (Base_dPair.v_Base_dPair_dfirstOf dtb__27); Base_dPair.f_Base_dPair_dPair_second = ((v_Vuna_dCompiler_dIr_dCps_dtransformDirect (fuel - 1)) (Base_dPair.v_Base_dPair_dsecondOf dtb__27)) }, ((v_Vuna_dCompiler_dIr_dCps_dmapFieldsDirect (fuel - 1)) dtb__28)))
  | _ -> failwith "DT: impossible branch"
)))
# 204 "Vuna/Compiler/Ir/Cps.vuna"
and v_Vuna_dCompiler_dIr_dCps_dcpsExpr = (fun fuel env e k -> (if (fuel <= 0) then (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (k, ((v_Vuna_dCompiler_dIr_dCps_dtransformDirect (fuel - 1)) e))) else (match e with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (dtb__29, dtb__30) -> ((((v_Vuna_dCompiler_dIr_dCps_dcpsApp (fuel - 1)) env) e) k)
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCase (dtb__31, dtb__32) -> ((fun v -> ((fun kCase -> ((((v_Vuna_dCompiler_dIr_dCps_dcpsExpr (fuel - 1)) env) dtb__31) kCase)) (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLam ((Base_dList.C_Base_dList_dList__x58__x58_ (v, Base_dList.C_Base_dList_dList_Nil)), (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCase ((Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrVar (v)), ((((v_Vuna_dCompiler_dIr_dCps_dmapAltCps (fuel - 1)) env) dtb__32) k))))))) (v_Vuna_dCompiler_dIr_dCps_dfreshV fuel))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrNatCase (dtb__33, dtb__34, dtb__35, dtb__36, dtb__37) -> ((fun v -> ((fun kCase -> ((((v_Vuna_dCompiler_dIr_dCps_dcpsExpr (fuel - 1)) env) dtb__33) kCase)) (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLam ((Base_dList.C_Base_dList_dList__x58__x58_ (v, Base_dList.C_Base_dList_dList_Nil)), (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrNatCase ((Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrVar (v)), dtb__34, ((((v_Vuna_dCompiler_dIr_dCps_dcpsAltMaybe (fuel - 1)) env) dtb__35) k), ((((v_Vuna_dCompiler_dIr_dCps_dcpsAltMaybe (fuel - 1)) env) dtb__36) k), ((((v_Vuna_dCompiler_dIr_dCps_dcpsAltMaybe (fuel - 1)) env) dtb__37) k))))))) (v_Vuna_dCompiler_dIr_dCps_dfreshV fuel))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrIf (dtb__38, dtb__39, dtb__40) -> ((fun v -> ((fun kIf -> ((((v_Vuna_dCompiler_dIr_dCps_dcpsExpr (fuel - 1)) env) dtb__38) kIf)) (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLam ((Base_dList.C_Base_dList_dList__x58__x58_ (v, Base_dList.C_Base_dList_dList_Nil)), (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrIf ((Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrVar (v)), ((((v_Vuna_dCompiler_dIr_dCps_dcpsExpr (fuel - 1)) env) dtb__39) k), ((((v_Vuna_dCompiler_dIr_dCps_dcpsExpr (fuel - 1)) env) dtb__40) k))))))) (v_Vuna_dCompiler_dIr_dCps_dfreshV fuel))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLet (dtb__41, dtb__42, dtb__43) -> ((fun v -> ((fun kLet -> ((((v_Vuna_dCompiler_dIr_dCps_dcpsExpr (fuel - 1)) env) dtb__42) kLet)) (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLam ((Base_dList.C_Base_dList_dList__x58__x58_ (v, Base_dList.C_Base_dList_dList_Nil)), (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLet (dtb__41, (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrVar (v)), ((((v_Vuna_dCompiler_dIr_dCps_dcpsExpr (fuel - 1)) env) dtb__43) k))))))) (v_Vuna_dCompiler_dIr_dCps_dfreshV fuel))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCast (dtb__44) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCast (((((v_Vuna_dCompiler_dIr_dCps_dcpsExpr (fuel - 1)) env) dtb__44) k)))
  | _ -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (k, ((v_Vuna_dCompiler_dIr_dCps_dtransformDirect (fuel - 1)) e)))
)))
# 233 "Vuna/Compiler/Ir/Cps.vuna"
and v_Vuna_dCompiler_dIr_dCps_dcpsAlt = (fun fuel env alt k -> (if (fuel <= 0) then alt else ((fun env1 -> { Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltCtor = (alt).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltCtor; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBinders = (alt).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBinders; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBody = ((((v_Vuna_dCompiler_dIr_dCps_dcpsExpr (fuel - 1)) env1) (alt).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBody) k) }) ((Base_dList.v_Base_dList_dappend (v_Vuna_dCompiler_dIr_dCps_dthunkBindersOfAlt alt)) env))))
# 240 "Vuna/Compiler/Ir/Cps.vuna"
and v_Vuna_dCompiler_dIr_dCps_dcpsAltMaybe = (fun fuel env m k -> (if (fuel <= 0) then m else (match m with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__45) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (((((v_Vuna_dCompiler_dIr_dCps_dcpsAlt (fuel - 1)) env) dtb__45) k)))
  | _ -> failwith "DT: impossible branch"
)))
# 247 "Vuna/Compiler/Ir/Cps.vuna"
and v_Vuna_dCompiler_dIr_dCps_dcpsArgs = (fun fuel env args head acc k -> (if (fuel <= 0) then (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (k, ((v_Vuna_dCompiler_dIr_dCps_dapplyAll head) (Base_dList.v_Base_dList_dreverse acc)))) else (match args with
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (k, ((v_Vuna_dCompiler_dIr_dCps_dapplyAll head) (Base_dList.v_Base_dList_dreverse acc))))
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__46, dtb__47) -> ((fun v -> ((((v_Vuna_dCompiler_dIr_dCps_dcpsExpr (fuel - 1)) env) dtb__46) (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLam ((Base_dList.C_Base_dList_dList__x58__x58_ (v, Base_dList.C_Base_dList_dList_Nil)), ((((((v_Vuna_dCompiler_dIr_dCps_dcpsArgs (fuel - 1)) env) dtb__47) head) (Base_dList.C_Base_dList_dList__x58__x58_ ((Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrVar (v)), acc))) k))))) (v_Vuna_dCompiler_dIr_dCps_dfreshV fuel))
  | _ -> failwith "DT: impossible branch"
)))
# 257 "Vuna/Compiler/Ir/Cps.vuna"
and v_Vuna_dCompiler_dIr_dCps_dcpsThunkCall = (fun fuel head args k -> (if (fuel <= 0) then ((v_Vuna_dCompiler_dIr_dCps_dapplyAll head) ((Base_dList.v_Base_dList_dappend args) (Base_dList.C_Base_dList_dList__x58__x58_ (k, Base_dList.C_Base_dList_dList_Nil)))) else ((v_Vuna_dCompiler_dIr_dCps_dapplyAll ((v_Vuna_dCompiler_dIr_dCps_dtransformDirect (fuel - 1)) head)) ((Base_dList.v_Base_dList_dappend ((v_Vuna_dCompiler_dIr_dCps_dmapDirect (fuel - 1)) args)) (Base_dList.C_Base_dList_dList__x58__x58_ (k, Base_dList.C_Base_dList_dList_Nil))))))
# 263 "Vuna/Compiler/Ir/Cps.vuna"
and v_Vuna_dCompiler_dIr_dCps_dcpsApp = (fun fuel env e k -> (if (fuel <= 0) then (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (k, e)) else ((fun p -> ((fun head -> ((fun args -> ((fun v -> (match head with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrVar (dtb__48) -> (if ((v_Vuna_dCompiler_dIr_dCps_dmemBinder dtb__48) env) then ((((v_Vuna_dCompiler_dIr_dCps_dcpsThunkCall (fuel - 1)) head) args) k) else ((((v_Vuna_dCompiler_dIr_dCps_dcpsExpr (fuel - 1)) env) head) (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLam ((Base_dList.C_Base_dList_dList__x58__x58_ (v, Base_dList.C_Base_dList_dList_Nil)), ((((((v_Vuna_dCompiler_dIr_dCps_dcpsArgs (fuel - 1)) env) args) (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrVar (v))) Base_dList.C_Base_dList_dList_Nil) k)))))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrGlobal (dtb__49) -> (if (dtb__49 = v_Vuna_dCompiler_dIr_dCps_drunThunkName) then ((((v_Vuna_dCompiler_dIr_dCps_dcpsThunkCall (fuel - 1)) head) args) k) else ((((v_Vuna_dCompiler_dIr_dCps_dcpsExpr (fuel - 1)) env) head) (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLam ((Base_dList.C_Base_dList_dList__x58__x58_ (v, Base_dList.C_Base_dList_dList_Nil)), ((((((v_Vuna_dCompiler_dIr_dCps_dcpsArgs (fuel - 1)) env) args) (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrVar (v))) Base_dList.C_Base_dList_dList_Nil) k)))))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRt (dtb__50) -> (if (dtb__50 = "prim_effectPerform") then ((((v_Vuna_dCompiler_dIr_dCps_dcpsThunkCall (fuel - 1)) (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRt (v_Vuna_dCompiler_dIr_dCps_dirCpsPerformName))) args) k) else (if (dtb__50 = "prim_effectHandle") then ((((v_Vuna_dCompiler_dIr_dCps_dcpsThunkCall (fuel - 1)) (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRt (v_Vuna_dCompiler_dIr_dCps_dirCpsHandleName))) args) k) else (if (dtb__50 = "prim_effectSelf") then ((((v_Vuna_dCompiler_dIr_dCps_dcpsThunkCall (fuel - 1)) (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRt (v_Vuna_dCompiler_dIr_dCps_dirCpsSelfName))) args) k) else ((((v_Vuna_dCompiler_dIr_dCps_dcpsExpr (fuel - 1)) env) head) (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLam ((Base_dList.C_Base_dList_dList__x58__x58_ (v, Base_dList.C_Base_dList_dList_Nil)), ((((((v_Vuna_dCompiler_dIr_dCps_dcpsArgs (fuel - 1)) env) args) (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrVar (v))) Base_dList.C_Base_dList_dList_Nil) k)))))))
  | _ -> ((((v_Vuna_dCompiler_dIr_dCps_dcpsExpr (fuel - 1)) env) head) (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLam ((Base_dList.C_Base_dList_dList__x58__x58_ (v, Base_dList.C_Base_dList_dList_Nil)), ((((((v_Vuna_dCompiler_dIr_dCps_dcpsArgs (fuel - 1)) env) args) (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrVar (v))) Base_dList.C_Base_dList_dList_Nil) k))))
)) (v_Vuna_dCompiler_dIr_dCps_dfreshV fuel))) (Base_dPair.v_Base_dPair_dsecondOf p))) (Base_dPair.v_Base_dPair_dfirstOf p))) (v_Vuna_dCompiler_dIr_dCps_dflattenApp e))))
# 288 "Vuna/Compiler/Ir/Cps.vuna"
and v_Vuna_dCompiler_dIr_dCps_dtransformDirect = (fun fuel e -> (if (fuel <= 0) then e else (match e with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCtor (dtb__51, dtb__52, dtb__53) -> (if ((v_Vuna_dCompiler_dIr_dCps_disThunkCtor dtb__51) dtb__52) then ((fun nd_uscrut5 -> (match nd_uscrut5 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__54, dtb__55) -> (match dtb__54 with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLam (dtb__56, dtb__57) -> (match dtb__55 with
  | Base_dList.C_Base_dList_dList_Nil -> ((fun k -> ((fun body1 -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCtor (dtb__51, dtb__52, (Base_dList.C_Base_dList_dList__x58__x58_ ((Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLam (((Base_dList.v_Base_dList_dappend dtb__56) (Base_dList.C_Base_dList_dList__x58__x58_ (k, Base_dList.C_Base_dList_dList_Nil))), body1)), Base_dList.C_Base_dList_dList_Nil))))) ((((v_Vuna_dCompiler_dIr_dCps_dcpsExpr (fuel - 1)) Base_dList.C_Base_dList_dList_Nil) dtb__57) (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrVar (k))))) (v_Vuna_dCompiler_dIr_dCps_dfreshK fuel))
  | _ -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCtor (dtb__51, dtb__52, ((v_Vuna_dCompiler_dIr_dCps_dmapDirect (fuel - 1)) dtb__53)))
)
  | _ -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCtor (dtb__51, dtb__52, ((v_Vuna_dCompiler_dIr_dCps_dmapDirect (fuel - 1)) dtb__53)))
)
  | _ -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCtor (dtb__51, dtb__52, ((v_Vuna_dCompiler_dIr_dCps_dmapDirect (fuel - 1)) dtb__53)))
)) dtb__53) else (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCtor (dtb__51, dtb__52, ((v_Vuna_dCompiler_dIr_dCps_dmapDirect (fuel - 1)) dtb__53))))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrEffThunk (dtb__58, dtb__59, dtb__60, dtb__61, dtb__62) -> ((fun u -> ((fun k -> ((fun argBs -> ((fun applied -> ((fun inner -> (if (dtb__61 <= 0) then inner else (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLam (argBs, inner)))) (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCtor (dtb__58, dtb__59, (Base_dList.C_Base_dList_dList__x58__x58_ ((Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLam ((Base_dList.C_Base_dList_dList__x58__x58_ (u, (Base_dList.C_Base_dList_dList__x58__x58_ (k, Base_dList.C_Base_dList_dList_Nil)))), (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp ((Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrVar (k)), applied)))), Base_dList.C_Base_dList_dList_Nil)))))) ((v_Vuna_dCompiler_dIr_dCps_dapplyAll ((v_Vuna_dCompiler_dIr_dCps_dtransformDirect (fuel - 1)) dtb__62)) ((Base_dList.v_Base_dList_dmap (fun _heta0 -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrVar (_heta0)))) argBs)))) ((Base_dList.v_Base_dList_dmap (fun i -> ((v_Vuna_dCompiler_dIr_dCps_dfreshA fuel) i))) ((Base_dList.v_Base_dList_drange 0) dtb__61)))) (v_Vuna_dCompiler_dIr_dCps_dfreshK fuel))) (v_Vuna_dCompiler_dIr_dCps_dfreshU fuel))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRecord (dtb__63, dtb__64) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRecord (dtb__63, ((v_Vuna_dCompiler_dIr_dCps_dmapFieldsDirect (fuel - 1)) dtb__64)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrProj (dtb__65, dtb__66, dtb__67) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrProj (((v_Vuna_dCompiler_dIr_dCps_dtransformDirect (fuel - 1)) dtb__65), dtb__66, dtb__67))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRecUpd (dtb__68, dtb__69, dtb__70) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRecUpd (((v_Vuna_dCompiler_dIr_dCps_dtransformDirect (fuel - 1)) dtb__68), dtb__69, ((v_Vuna_dCompiler_dIr_dCps_dmapFieldsDirect (fuel - 1)) dtb__70)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRtApp (dtb__71, dtb__72) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRtApp (dtb__71, ((v_Vuna_dCompiler_dIr_dCps_dmapDirect (fuel - 1)) dtb__72)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCast (dtb__73) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCast (((v_Vuna_dCompiler_dIr_dCps_dtransformDirect (fuel - 1)) dtb__73)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLet (dtb__74, dtb__75, dtb__76) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLet (dtb__74, ((v_Vuna_dCompiler_dIr_dCps_dtransformDirect (fuel - 1)) dtb__75), ((v_Vuna_dCompiler_dIr_dCps_dtransformDirect (fuel - 1)) dtb__76)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLam (dtb__77, dtb__78) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLam (dtb__77, ((v_Vuna_dCompiler_dIr_dCps_dtransformDirect (fuel - 1)) dtb__78)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (dtb__79, dtb__80) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (((v_Vuna_dCompiler_dIr_dCps_dtransformDirect (fuel - 1)) dtb__79), ((v_Vuna_dCompiler_dIr_dCps_dtransformDirect (fuel - 1)) dtb__80)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrIf (dtb__81, dtb__82, dtb__83) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrIf (((v_Vuna_dCompiler_dIr_dCps_dtransformDirect (fuel - 1)) dtb__81), ((v_Vuna_dCompiler_dIr_dCps_dtransformDirect (fuel - 1)) dtb__82), ((v_Vuna_dCompiler_dIr_dCps_dtransformDirect (fuel - 1)) dtb__83)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCase (dtb__84, dtb__85) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCase (((v_Vuna_dCompiler_dIr_dCps_dtransformDirect (fuel - 1)) dtb__84), ((v_Vuna_dCompiler_dIr_dCps_dmapAltDirect (fuel - 1)) dtb__85)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrNatCase (dtb__86, dtb__87, dtb__88, dtb__89, dtb__90) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrNatCase (((v_Vuna_dCompiler_dIr_dCps_dtransformDirect (fuel - 1)) dtb__86), dtb__87, ((v_Vuna_dCompiler_dIr_dCps_dtransformAltMaybe (fuel - 1)) dtb__88), ((v_Vuna_dCompiler_dIr_dCps_dtransformAltMaybe (fuel - 1)) dtb__89), ((v_Vuna_dCompiler_dIr_dCps_dtransformAltMaybe (fuel - 1)) dtb__90)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrConcatMany (dtb__91) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrConcatMany (((v_Vuna_dCompiler_dIr_dCps_dmapDirect (fuel - 1)) dtb__91)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrVar (dtb__92) -> e
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrGlobal (dtb__93) -> e
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRt (dtb__94) -> e
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrInt (dtb__95) -> e
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrStr (dtb__96) -> e
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrBool (dtb__97) -> e
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrFloatLit (dtb__98) -> e
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrEffBind (dtb__99, dtb__100, dtb__101) -> e
  | _ -> failwith "DT: impossible branch"
)))
# 334 "Vuna/Compiler/Ir/Cps.vuna"
and v_Vuna_dCompiler_dIr_dCps_dtransformAltDirect = (fun fuel alt -> (if (fuel <= 0) then alt else { Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltCtor = (alt).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltCtor; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBinders = (alt).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBinders; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBody = ((v_Vuna_dCompiler_dIr_dCps_dtransformDirect (fuel - 1)) (alt).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBody) }))
# 339 "Vuna/Compiler/Ir/Cps.vuna"
and v_Vuna_dCompiler_dIr_dCps_dtransformAltMaybe = (fun fuel m -> (if (fuel <= 0) then m else (match m with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__102) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (((v_Vuna_dCompiler_dIr_dCps_dtransformAltDirect (fuel - 1)) dtb__102)))
  | _ -> failwith "DT: impossible branch"
)))

# 193 "Vuna/Compiler/Ir/Cps.vuna"
let v_Vuna_dCompiler_dIr_dCps_didentityCont = ((fun v -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLam ((Base_dList.C_Base_dList_dList__x58__x58_ (v, Base_dList.C_Base_dList_dList_Nil)), (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrVar (v))))) (v_Vuna_dCompiler_dIr_dCps_dmkBinder "__cpsId"))

# 350 "Vuna/Compiler/Ir/Cps.vuna"
let rec v_Vuna_dCompiler_dIr_dCps_dtrampolineBody = (fun mc0 mc1 -> (match mc1 with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (dtb__103, dtb__104) -> (match dtb__103 with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (dtb__105, dtb__106) -> (match dtb__105 with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrGlobal (dtb__107) -> (if (dtb__107 = v_Vuna_dCompiler_dIr_dCps_drunThunkName) then (Base_dResult.C_Base_dResult_dResult_Ok (((v_Vuna_dCompiler_dIr_dCps_dapplyAll (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrGlobal (dtb__107))) (Base_dList.C_Base_dList_dList__x58__x58_ (dtb__106, (Base_dList.C_Base_dList_dList__x58__x58_ (dtb__104, (Base_dList.C_Base_dList_dList__x58__x58_ (v_Vuna_dCompiler_dIr_dCps_didentityCont, Base_dList.C_Base_dList_dList_Nil))))))))) else (Base_dResult.C_Base_dResult_dResult_Err (("CPS: unexpected trampoline shape: " ^ mc0))))
  | _ -> (Base_dResult.C_Base_dResult_dResult_Err (("CPS: unexpected trampoline shape: " ^ mc0)))
)
  | _ -> (Base_dResult.C_Base_dResult_dResult_Err (("CPS: unexpected trampoline shape: " ^ mc0)))
)
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCast (dtb__108) -> (match ((v_Vuna_dCompiler_dIr_dCps_dtrampolineBody mc0) dtb__108) with
  | Base_dResult.C_Base_dResult_dResult_Err (dtb__109) -> (Base_dResult.C_Base_dResult_dResult_Err (dtb__109))
  | Base_dResult.C_Base_dResult_dResult_Ok (dtb__110) -> (Base_dResult.C_Base_dResult_dResult_Ok ((Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCast (dtb__110))))
  | _ -> failwith "DT: impossible branch"
)
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLam (dtb__111, dtb__112) -> (match ((v_Vuna_dCompiler_dIr_dCps_dtrampolineBody mc0) dtb__112) with
  | Base_dResult.C_Base_dResult_dResult_Err (dtb__113) -> (Base_dResult.C_Base_dResult_dResult_Err (dtb__113))
  | Base_dResult.C_Base_dResult_dResult_Ok (dtb__114) -> (Base_dResult.C_Base_dResult_dResult_Ok ((Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLam (dtb__111, dtb__114))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> (Base_dResult.C_Base_dResult_dResult_Err (("CPS: unexpected trampoline shape: " ^ mc0)))
))

# 363 "Vuna/Compiler/Ir/Cps.vuna"
let rec v_Vuna_dCompiler_dIr_dCps_dselfAlt = (fun fuel alt name -> (if (fuel <= 0) then (Base_dResult.C_Base_dResult_dResult_Ok (alt)) else (match (((v_Vuna_dCompiler_dIr_dCps_dselfBody (fuel - 1)) (alt).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBody) name) with
  | Base_dResult.C_Base_dResult_dResult_Err (dtb__115) -> (Base_dResult.C_Base_dResult_dResult_Err (dtb__115))
  | Base_dResult.C_Base_dResult_dResult_Ok (dtb__116) -> (Base_dResult.C_Base_dResult_dResult_Ok ({ Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltCtor = (alt).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltCtor; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBinders = (alt).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBinders; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBody = dtb__116 }))
  | _ -> failwith "DT: impossible branch"
)))
# 369 "Vuna/Compiler/Ir/Cps.vuna"
and v_Vuna_dCompiler_dIr_dCps_dselfAlts = (fun fuel alts name -> (if (fuel <= 0) then (Base_dResult.C_Base_dResult_dResult_Ok (alts)) else (match alts with
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dResult.C_Base_dResult_dResult_Ok (Base_dList.C_Base_dList_dList_Nil))
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__117, dtb__118) -> (match (((v_Vuna_dCompiler_dIr_dCps_dselfAlt (fuel - 1)) dtb__117) name) with
  | Base_dResult.C_Base_dResult_dResult_Err (dtb__119) -> (Base_dResult.C_Base_dResult_dResult_Err (dtb__119))
  | Base_dResult.C_Base_dResult_dResult_Ok (dtb__120) -> (match (((v_Vuna_dCompiler_dIr_dCps_dselfAlts (fuel - 1)) dtb__118) name) with
  | Base_dResult.C_Base_dResult_dResult_Err (dtb__121) -> (Base_dResult.C_Base_dResult_dResult_Err (dtb__121))
  | Base_dResult.C_Base_dResult_dResult_Ok (dtb__122) -> (Base_dResult.C_Base_dResult_dResult_Ok ((Base_dList.C_Base_dList_dList__x58__x58_ (dtb__120, dtb__122))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))
# 379 "Vuna/Compiler/Ir/Cps.vuna"
and v_Vuna_dCompiler_dIr_dCps_dselfBody = (fun fuel body name -> (if (fuel <= 0) then (Base_dResult.C_Base_dResult_dResult_Ok (body)) else ((fun nd_uscrut3 -> (match nd_uscrut3 with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (dtb__123, dtb__124) -> (match dtb__123 with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRt (dtb__125) -> (if (dtb__125 = "prim_effectSelf") then (Base_dResult.C_Base_dResult_dResult_Ok (((v_Vuna_dCompiler_dIr_dCps_dapplyAll (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRt (v_Vuna_dCompiler_dIr_dCps_dirCpsSelfName))) (Base_dList.C_Base_dList_dList__x58__x58_ (dtb__124, (Base_dList.C_Base_dList_dList__x58__x58_ (v_Vuna_dCompiler_dIr_dCps_didentityCont, Base_dList.C_Base_dList_dList_Nil))))))) else (Base_dResult.C_Base_dResult_dResult_Err (("CPS: unexpected handleScoped shape: " ^ name))))
  | _ -> (Base_dResult.C_Base_dResult_dResult_Err (("CPS: unexpected handleScoped shape: " ^ name)))
)
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCase (dtb__126, dtb__127) -> (match (((v_Vuna_dCompiler_dIr_dCps_dselfAlts (fuel - 1)) dtb__127) name) with
  | Base_dResult.C_Base_dResult_dResult_Err (dtb__128) -> (Base_dResult.C_Base_dResult_dResult_Err (dtb__128))
  | Base_dResult.C_Base_dResult_dResult_Ok (dtb__129) -> (Base_dResult.C_Base_dResult_dResult_Ok ((Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCase (dtb__126, dtb__129))))
  | _ -> failwith "DT: impossible branch"
)
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCast (dtb__130) -> (match (((v_Vuna_dCompiler_dIr_dCps_dselfBody (fuel - 1)) dtb__130) name) with
  | Base_dResult.C_Base_dResult_dResult_Err (dtb__131) -> (Base_dResult.C_Base_dResult_dResult_Err (dtb__131))
  | Base_dResult.C_Base_dResult_dResult_Ok (dtb__132) -> (Base_dResult.C_Base_dResult_dResult_Ok ((Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCast (dtb__132))))
  | _ -> failwith "DT: impossible branch"
)
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLam (dtb__133, dtb__134) -> (match (((v_Vuna_dCompiler_dIr_dCps_dselfBody (fuel - 1)) dtb__134) name) with
  | Base_dResult.C_Base_dResult_dResult_Err (dtb__135) -> (Base_dResult.C_Base_dResult_dResult_Err (dtb__135))
  | Base_dResult.C_Base_dResult_dResult_Ok (dtb__136) -> (Base_dResult.C_Base_dResult_dResult_Ok ((Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLam (dtb__133, dtb__136))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> (Base_dResult.C_Base_dResult_dResult_Err (("CPS: unexpected handleScoped shape: " ^ name)))
)) body)))

# 396 "Vuna/Compiler/Ir/Cps.vuna"
let v_Vuna_dCompiler_dIr_dCps_dtransformDef = (fun fuel d -> (if (fuel <= 0) then (Base_dResult.C_Base_dResult_dResult_Ok (d)) else (match d with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrDef_IrExternDef (dtb__137, dtb__138, dtb__139, dtb__140) -> (Base_dResult.C_Base_dResult_dResult_Ok (d))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrDef_IrDef (dtb__141, dtb__142, dtb__143, dtb__144, dtb__145, dtb__146, dtb__147) -> (if (if (if (dtb__141 = v_Vuna_dCompiler_dIr_dCps_drunPureName) then true else (dtb__141 = v_Vuna_dCompiler_dIr_dCps_drunEffName)) then true else (dtb__141 = v_Vuna_dCompiler_dIr_dCps_drunMainName)) then (match ((v_Vuna_dCompiler_dIr_dCps_dtrampolineBody dtb__141) dtb__144) with
  | Base_dResult.C_Base_dResult_dResult_Err (dtb__148) -> (Base_dResult.C_Base_dResult_dResult_Err (dtb__148))
  | Base_dResult.C_Base_dResult_dResult_Ok (dtb__149) -> (Base_dResult.C_Base_dResult_dResult_Ok ((Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrDef_IrDef (dtb__141, dtb__142, dtb__143, dtb__149, dtb__145, dtb__146, dtb__147))))
  | _ -> failwith "DT: impossible branch"
) else (if (dtb__141 = v_Vuna_dCompiler_dIr_dCps_dhandleScopedName) then (match (((v_Vuna_dCompiler_dIr_dCps_dselfBody (fuel - 1)) dtb__144) dtb__141) with
  | Base_dResult.C_Base_dResult_dResult_Err (dtb__150) -> (Base_dResult.C_Base_dResult_dResult_Err (dtb__150))
  | Base_dResult.C_Base_dResult_dResult_Ok (dtb__151) -> (Base_dResult.C_Base_dResult_dResult_Ok ((Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrDef_IrDef (dtb__141, dtb__142, dtb__143, dtb__151, dtb__145, dtb__146, dtb__147))))
  | _ -> failwith "DT: impossible branch"
) else (Base_dResult.C_Base_dResult_dResult_Ok ((Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrDef_IrDef (dtb__141, dtb__142, dtb__143, ((v_Vuna_dCompiler_dIr_dCps_dtransformDirect (fuel - 1)) dtb__144), dtb__145, dtb__146, dtb__147))))))
  | _ -> failwith "DT: impossible branch"
)))

# 408 "Vuna/Compiler/Ir/Cps.vuna"
let rec v_Vuna_dCompiler_dIr_dCps_dtransformDefs = (fun fuel xs -> (if (fuel <= 0) then (Base_dResult.C_Base_dResult_dResult_Ok (xs)) else (match xs with
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dResult.C_Base_dResult_dResult_Ok (Base_dList.C_Base_dList_dList_Nil))
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__152, dtb__153) -> (match ((v_Vuna_dCompiler_dIr_dCps_dtransformDef (fuel - 1)) dtb__152) with
  | Base_dResult.C_Base_dResult_dResult_Err (dtb__154) -> (Base_dResult.C_Base_dResult_dResult_Err (dtb__154))
  | Base_dResult.C_Base_dResult_dResult_Ok (dtb__155) -> (match ((v_Vuna_dCompiler_dIr_dCps_dtransformDefs (fuel - 1)) dtb__153) with
  | Base_dResult.C_Base_dResult_dResult_Err (dtb__156) -> (Base_dResult.C_Base_dResult_dResult_Err (dtb__156))
  | Base_dResult.C_Base_dResult_dResult_Ok (dtb__157) -> (Base_dResult.C_Base_dResult_dResult_Ok ((Base_dList.C_Base_dList_dList__x58__x58_ (dtb__155, dtb__157))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))

# 418 "Vuna/Compiler/Ir/Cps.vuna"
let v_Vuna_dCompiler_dIr_dCps_dtransformGroup = (fun fuel g -> (if (fuel <= 0) then (Base_dResult.C_Base_dResult_dResult_Ok (g)) else (match ((v_Vuna_dCompiler_dIr_dCps_dtransformDefs (fuel - 1)) (g).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrGroup_irGroupDefs) with
  | Base_dResult.C_Base_dResult_dResult_Err (dtb__158) -> (Base_dResult.C_Base_dResult_dResult_Err (dtb__158))
  | Base_dResult.C_Base_dResult_dResult_Ok (dtb__159) -> (Base_dResult.C_Base_dResult_dResult_Ok ({ Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrGroup_irGroupIsRec = (g).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrGroup_irGroupIsRec; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrGroup_irGroupDefs = dtb__159 }))
  | _ -> failwith "DT: impossible branch"
)))

# 424 "Vuna/Compiler/Ir/Cps.vuna"
let rec v_Vuna_dCompiler_dIr_dCps_dtransformGroups = (fun fuel xs -> (if (fuel <= 0) then (Base_dResult.C_Base_dResult_dResult_Ok (xs)) else (match xs with
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dResult.C_Base_dResult_dResult_Ok (Base_dList.C_Base_dList_dList_Nil))
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__160, dtb__161) -> (match ((v_Vuna_dCompiler_dIr_dCps_dtransformGroup (fuel - 1)) dtb__160) with
  | Base_dResult.C_Base_dResult_dResult_Err (dtb__162) -> (Base_dResult.C_Base_dResult_dResult_Err (dtb__162))
  | Base_dResult.C_Base_dResult_dResult_Ok (dtb__163) -> (match ((v_Vuna_dCompiler_dIr_dCps_dtransformGroups (fuel - 1)) dtb__161) with
  | Base_dResult.C_Base_dResult_dResult_Err (dtb__164) -> (Base_dResult.C_Base_dResult_dResult_Err (dtb__164))
  | Base_dResult.C_Base_dResult_dResult_Ok (dtb__165) -> (Base_dResult.C_Base_dResult_dResult_Ok ((Base_dList.C_Base_dList_dList__x58__x58_ (dtb__163, dtb__165))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))

# 441 "Vuna/Compiler/Ir/Cps.vuna"
let v_Vuna_dCompiler_dIr_dCps_dselSym = (fun s -> (if (s = v_Vuna_dCompiler_dIr_dCps_dirCpsPerformName) then v_Vuna_dCompiler_dIr_dCps_dirSelPerformName else (if (s = v_Vuna_dCompiler_dIr_dCps_dirCpsHandleName) then v_Vuna_dCompiler_dIr_dCps_dirSelHandleName else (if (s = v_Vuna_dCompiler_dIr_dCps_dirCpsSelfName) then v_Vuna_dCompiler_dIr_dCps_dirSelSelfName else s))))

# 446 "Vuna/Compiler/Ir/Cps.vuna"
let rec v_Vuna_dCompiler_dIr_dCps_dselSyms = (fun fuel e -> (if (fuel <= 0) then e else (match e with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRt (dtb__166) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRt ((v_Vuna_dCompiler_dIr_dCps_dselSym dtb__166)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRtApp (dtb__167, dtb__168) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRtApp ((v_Vuna_dCompiler_dIr_dCps_dselSym dtb__167), ((v_Vuna_dCompiler_dIr_dCps_dselSList (fuel - 1)) dtb__168)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCtor (dtb__169, dtb__170, dtb__171) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCtor (dtb__169, dtb__170, ((v_Vuna_dCompiler_dIr_dCps_dselSList (fuel - 1)) dtb__171)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRecord (dtb__172, dtb__173) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRecord (dtb__172, ((v_Vuna_dCompiler_dIr_dCps_dselSFields (fuel - 1)) dtb__173)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrProj (dtb__174, dtb__175, dtb__176) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrProj (((v_Vuna_dCompiler_dIr_dCps_dselSyms (fuel - 1)) dtb__174), dtb__175, dtb__176))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRecUpd (dtb__177, dtb__178, dtb__179) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRecUpd (((v_Vuna_dCompiler_dIr_dCps_dselSyms (fuel - 1)) dtb__177), dtb__178, ((v_Vuna_dCompiler_dIr_dCps_dselSFields (fuel - 1)) dtb__179)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCast (dtb__180) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCast (((v_Vuna_dCompiler_dIr_dCps_dselSyms (fuel - 1)) dtb__180)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLet (dtb__181, dtb__182, dtb__183) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLet (dtb__181, ((v_Vuna_dCompiler_dIr_dCps_dselSyms (fuel - 1)) dtb__182), ((v_Vuna_dCompiler_dIr_dCps_dselSyms (fuel - 1)) dtb__183)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLam (dtb__184, dtb__185) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLam (dtb__184, ((v_Vuna_dCompiler_dIr_dCps_dselSyms (fuel - 1)) dtb__185)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (dtb__186, dtb__187) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (((v_Vuna_dCompiler_dIr_dCps_dselSyms (fuel - 1)) dtb__186), ((v_Vuna_dCompiler_dIr_dCps_dselSyms (fuel - 1)) dtb__187)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrIf (dtb__188, dtb__189, dtb__190) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrIf (((v_Vuna_dCompiler_dIr_dCps_dselSyms (fuel - 1)) dtb__188), ((v_Vuna_dCompiler_dIr_dCps_dselSyms (fuel - 1)) dtb__189), ((v_Vuna_dCompiler_dIr_dCps_dselSyms (fuel - 1)) dtb__190)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCase (dtb__191, dtb__192) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCase (((v_Vuna_dCompiler_dIr_dCps_dselSyms (fuel - 1)) dtb__191), ((v_Vuna_dCompiler_dIr_dCps_dselSymsAlt (fuel - 1)) dtb__192)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrNatCase (dtb__193, dtb__194, dtb__195, dtb__196, dtb__197) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrNatCase (((v_Vuna_dCompiler_dIr_dCps_dselSyms (fuel - 1)) dtb__193), dtb__194, ((v_Vuna_dCompiler_dIr_dCps_dselSymsAltM (fuel - 1)) dtb__195), ((v_Vuna_dCompiler_dIr_dCps_dselSymsAltM (fuel - 1)) dtb__196), ((v_Vuna_dCompiler_dIr_dCps_dselSymsAltM (fuel - 1)) dtb__197)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrConcatMany (dtb__198) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrConcatMany (((v_Vuna_dCompiler_dIr_dCps_dselSList (fuel - 1)) dtb__198)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrEffThunk (dtb__199, dtb__200, dtb__201, dtb__202, dtb__203) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrEffThunk (dtb__199, dtb__200, dtb__201, dtb__202, ((v_Vuna_dCompiler_dIr_dCps_dselSyms (fuel - 1)) dtb__203)))
  | _ -> e
)))
# 468 "Vuna/Compiler/Ir/Cps.vuna"
and v_Vuna_dCompiler_dIr_dCps_dselSList = (fun fuel xs -> (if (fuel <= 0) then xs else (match xs with
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__204, dtb__205) -> (Base_dList.C_Base_dList_dList__x58__x58_ (((v_Vuna_dCompiler_dIr_dCps_dselSyms (fuel - 1)) dtb__204), ((v_Vuna_dCompiler_dIr_dCps_dselSList (fuel - 1)) dtb__205)))
  | _ -> failwith "DT: impossible branch"
)))
# 474 "Vuna/Compiler/Ir/Cps.vuna"
and v_Vuna_dCompiler_dIr_dCps_dselSFields = (fun fuel fs -> (if (fuel <= 0) then fs else (match fs with
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__206, dtb__207) -> (Base_dList.C_Base_dList_dList__x58__x58_ ({ Base_dPair.f_Base_dPair_dPair_first = (Base_dPair.v_Base_dPair_dfirstOf dtb__206); Base_dPair.f_Base_dPair_dPair_second = ((v_Vuna_dCompiler_dIr_dCps_dselSyms (fuel - 1)) (Base_dPair.v_Base_dPair_dsecondOf dtb__206)) }, ((v_Vuna_dCompiler_dIr_dCps_dselSFields (fuel - 1)) dtb__207)))
  | _ -> failwith "DT: impossible branch"
)))
# 480 "Vuna/Compiler/Ir/Cps.vuna"
and v_Vuna_dCompiler_dIr_dCps_dselSymsAlt = (fun fuel alts -> (if (fuel <= 0) then alts else (match alts with
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__208, dtb__209) -> (Base_dList.C_Base_dList_dList__x58__x58_ ({ Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltCtor = (dtb__208).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltCtor; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBinders = (dtb__208).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBinders; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBody = ((v_Vuna_dCompiler_dIr_dCps_dselSyms (fuel - 1)) (dtb__208).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBody) }, ((v_Vuna_dCompiler_dIr_dCps_dselSymsAlt (fuel - 1)) dtb__209)))
  | _ -> failwith "DT: impossible branch"
)))
# 487 "Vuna/Compiler/Ir/Cps.vuna"
and v_Vuna_dCompiler_dIr_dCps_dselSymsAltM = (fun fuel m -> (if (fuel <= 0) then m else (match m with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__210) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltCtor = (dtb__210).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltCtor; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBinders = (dtb__210).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBinders; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBody = ((v_Vuna_dCompiler_dIr_dCps_dselSyms (fuel - 1)) (dtb__210).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBody) }))
  | _ -> failwith "DT: impossible branch"
)))

# 494 "Vuna/Compiler/Ir/Cps.vuna"
let v_Vuna_dCompiler_dIr_dCps_dstepDoneCont = ((fun v -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLam ((Base_dList.C_Base_dList_dList__x58__x58_ (v, Base_dList.C_Base_dList_dList_Nil)), (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp ((Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRt (v_Vuna_dCompiler_dIr_dCps_dirSelDoneName)), (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrVar (v))))))) (v_Vuna_dCompiler_dIr_dCps_dmkBinder "__selId"))

# 500 "Vuna/Compiler/Ir/Cps.vuna"
let rec v_Vuna_dCompiler_dIr_dCps_dselTrampolineBody = (fun mc0 mc1 -> (match mc1 with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (dtb__211, dtb__212) -> (match dtb__211 with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (dtb__213, dtb__214) -> (match dtb__213 with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (dtb__215, dtb__216) -> (match dtb__215 with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrGlobal (dtb__217) -> (if (dtb__217 = v_Vuna_dCompiler_dIr_dCps_drunThunkName) then (Base_dResult.C_Base_dResult_dResult_Ok ((Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp ((Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRt (v_Vuna_dCompiler_dIr_dCps_dirSelRunName)), ((v_Vuna_dCompiler_dIr_dCps_dapplyAll (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrGlobal (dtb__217))) (Base_dList.C_Base_dList_dList__x58__x58_ (dtb__216, (Base_dList.C_Base_dList_dList__x58__x58_ (dtb__214, (Base_dList.C_Base_dList_dList__x58__x58_ (v_Vuna_dCompiler_dIr_dCps_dstepDoneCont, Base_dList.C_Base_dList_dList_Nil))))))))))) else (Base_dResult.C_Base_dResult_dResult_Err (("selective CPS: unexpected trampoline shape: " ^ mc0))))
  | _ -> (Base_dResult.C_Base_dResult_dResult_Err (("selective CPS: unexpected trampoline shape: " ^ mc0)))
)
  | _ -> (Base_dResult.C_Base_dResult_dResult_Err (("selective CPS: unexpected trampoline shape: " ^ mc0)))
)
  | _ -> (Base_dResult.C_Base_dResult_dResult_Err (("selective CPS: unexpected trampoline shape: " ^ mc0)))
)
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCast (dtb__218) -> (match ((v_Vuna_dCompiler_dIr_dCps_dselTrampolineBody mc0) dtb__218) with
  | Base_dResult.C_Base_dResult_dResult_Err (dtb__219) -> (Base_dResult.C_Base_dResult_dResult_Err (dtb__219))
  | Base_dResult.C_Base_dResult_dResult_Ok (dtb__220) -> (Base_dResult.C_Base_dResult_dResult_Ok ((Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCast (dtb__220))))
  | _ -> failwith "DT: impossible branch"
)
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLam (dtb__221, dtb__222) -> (match ((v_Vuna_dCompiler_dIr_dCps_dselTrampolineBody mc0) dtb__222) with
  | Base_dResult.C_Base_dResult_dResult_Err (dtb__223) -> (Base_dResult.C_Base_dResult_dResult_Err (dtb__223))
  | Base_dResult.C_Base_dResult_dResult_Ok (dtb__224) -> (Base_dResult.C_Base_dResult_dResult_Ok ((Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLam (dtb__221, dtb__224))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> (Base_dResult.C_Base_dResult_dResult_Err (("selective CPS: unexpected trampoline shape: " ^ mc0)))
))

# 513 "Vuna/Compiler/Ir/Cps.vuna"
let rec v_Vuna_dCompiler_dIr_dCps_dselSelfBody = (fun fuel body -> (if (fuel <= 0) then (Base_dResult.C_Base_dResult_dResult_Ok (body)) else ((fun nd_uscrut2 -> (match nd_uscrut2 with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (dtb__225, dtb__226) -> (match dtb__225 with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (dtb__227, dtb__228) -> (match dtb__227 with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRt (dtb__229) -> (if (dtb__229 = v_Vuna_dCompiler_dIr_dCps_dirSelSelfName) then (Base_dResult.C_Base_dResult_dResult_Ok ((Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp ((Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp ((Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRt (dtb__229)), dtb__228)), v_Vuna_dCompiler_dIr_dCps_dstepDoneCont)))) else (Base_dResult.C_Base_dResult_dResult_Err ("selective CPS: unexpected handleScoped shape")))
  | _ -> (Base_dResult.C_Base_dResult_dResult_Err ("selective CPS: unexpected handleScoped shape"))
)
  | _ -> (Base_dResult.C_Base_dResult_dResult_Err ("selective CPS: unexpected handleScoped shape"))
)
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCase (dtb__230, dtb__231) -> (match ((v_Vuna_dCompiler_dIr_dCps_dselSelfAlts (fuel - 1)) dtb__231) with
  | Base_dResult.C_Base_dResult_dResult_Err (dtb__232) -> (Base_dResult.C_Base_dResult_dResult_Err (dtb__232))
  | Base_dResult.C_Base_dResult_dResult_Ok (dtb__233) -> (Base_dResult.C_Base_dResult_dResult_Ok ((Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCase (dtb__230, dtb__233))))
  | _ -> failwith "DT: impossible branch"
)
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCast (dtb__234) -> (match ((v_Vuna_dCompiler_dIr_dCps_dselSelfBody (fuel - 1)) dtb__234) with
  | Base_dResult.C_Base_dResult_dResult_Err (dtb__235) -> (Base_dResult.C_Base_dResult_dResult_Err (dtb__235))
  | Base_dResult.C_Base_dResult_dResult_Ok (dtb__236) -> (Base_dResult.C_Base_dResult_dResult_Ok ((Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCast (dtb__236))))
  | _ -> failwith "DT: impossible branch"
)
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLam (dtb__237, dtb__238) -> (match ((v_Vuna_dCompiler_dIr_dCps_dselSelfBody (fuel - 1)) dtb__238) with
  | Base_dResult.C_Base_dResult_dResult_Err (dtb__239) -> (Base_dResult.C_Base_dResult_dResult_Err (dtb__239))
  | Base_dResult.C_Base_dResult_dResult_Ok (dtb__240) -> (Base_dResult.C_Base_dResult_dResult_Ok ((Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLam (dtb__237, dtb__240))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> (Base_dResult.C_Base_dResult_dResult_Err ("selective CPS: unexpected handleScoped shape"))
)) body)))
# 530 "Vuna/Compiler/Ir/Cps.vuna"
and v_Vuna_dCompiler_dIr_dCps_dselSelfAlts = (fun fuel alts -> (if (fuel <= 0) then (Base_dResult.C_Base_dResult_dResult_Ok (alts)) else (match alts with
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dResult.C_Base_dResult_dResult_Ok (Base_dList.C_Base_dList_dList_Nil))
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__241, dtb__242) -> (match ((v_Vuna_dCompiler_dIr_dCps_dselSelfBody (fuel - 1)) (dtb__241).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBody) with
  | Base_dResult.C_Base_dResult_dResult_Err (dtb__243) -> (Base_dResult.C_Base_dResult_dResult_Err (dtb__243))
  | Base_dResult.C_Base_dResult_dResult_Ok (dtb__244) -> (match ((v_Vuna_dCompiler_dIr_dCps_dselSelfAlts (fuel - 1)) dtb__242) with
  | Base_dResult.C_Base_dResult_dResult_Err (dtb__245) -> (Base_dResult.C_Base_dResult_dResult_Err (dtb__245))
  | Base_dResult.C_Base_dResult_dResult_Ok (dtb__246) -> (Base_dResult.C_Base_dResult_dResult_Ok ((Base_dList.C_Base_dList_dList__x58__x58_ ({ Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltCtor = (dtb__241).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltCtor; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBinders = (dtb__241).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBinders; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBody = dtb__244 }, dtb__246))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))

# 540 "Vuna/Compiler/Ir/Cps.vuna"
let v_Vuna_dCompiler_dIr_dCps_dselDef = (fun fuel d -> (if (fuel <= 0) then (Base_dResult.C_Base_dResult_dResult_Ok (d)) else (match d with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrDef_IrExternDef (dtb__247, dtb__248, dtb__249, dtb__250) -> (Base_dResult.C_Base_dResult_dResult_Ok (d))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrDef_IrDef (dtb__251, dtb__252, dtb__253, dtb__254, dtb__255, dtb__256, dtb__257) -> ((fun b -> (if (if (if (dtb__251 = v_Vuna_dCompiler_dIr_dCps_drunPureName) then true else (dtb__251 = v_Vuna_dCompiler_dIr_dCps_drunEffName)) then true else (dtb__251 = v_Vuna_dCompiler_dIr_dCps_drunMainName)) then (match ((v_Vuna_dCompiler_dIr_dCps_dselTrampolineBody dtb__251) b) with
  | Base_dResult.C_Base_dResult_dResult_Err (dtb__258) -> (Base_dResult.C_Base_dResult_dResult_Err (dtb__258))
  | Base_dResult.C_Base_dResult_dResult_Ok (dtb__259) -> (Base_dResult.C_Base_dResult_dResult_Ok ((Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrDef_IrDef (dtb__251, dtb__252, dtb__253, dtb__259, dtb__255, dtb__256, dtb__257))))
  | _ -> failwith "DT: impossible branch"
) else (if (dtb__251 = v_Vuna_dCompiler_dIr_dCps_dhandleScopedName) then (match ((v_Vuna_dCompiler_dIr_dCps_dselSelfBody (fuel - 1)) b) with
  | Base_dResult.C_Base_dResult_dResult_Err (dtb__260) -> (Base_dResult.C_Base_dResult_dResult_Err (dtb__260))
  | Base_dResult.C_Base_dResult_dResult_Ok (dtb__261) -> (Base_dResult.C_Base_dResult_dResult_Ok ((Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrDef_IrDef (dtb__251, dtb__252, dtb__253, dtb__261, dtb__255, dtb__256, dtb__257))))
  | _ -> failwith "DT: impossible branch"
) else (Base_dResult.C_Base_dResult_dResult_Ok ((Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrDef_IrDef (dtb__251, dtb__252, dtb__253, b, dtb__255, dtb__256, dtb__257))))))) ((v_Vuna_dCompiler_dIr_dCps_dselSyms (fuel - 1)) dtb__254))
  | _ -> failwith "DT: impossible branch"
)))

# 555 "Vuna/Compiler/Ir/Cps.vuna"
let rec v_Vuna_dCompiler_dIr_dCps_dselDefs = (fun fuel defs -> (if (fuel <= 0) then (Base_dResult.C_Base_dResult_dResult_Ok (defs)) else (match defs with
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dResult.C_Base_dResult_dResult_Ok (Base_dList.C_Base_dList_dList_Nil))
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__262, dtb__263) -> (match ((v_Vuna_dCompiler_dIr_dCps_dselDef (fuel - 1)) dtb__262) with
  | Base_dResult.C_Base_dResult_dResult_Err (dtb__264) -> (Base_dResult.C_Base_dResult_dResult_Err (dtb__264))
  | Base_dResult.C_Base_dResult_dResult_Ok (dtb__265) -> (match ((v_Vuna_dCompiler_dIr_dCps_dselDefs (fuel - 1)) dtb__263) with
  | Base_dResult.C_Base_dResult_dResult_Err (dtb__266) -> (Base_dResult.C_Base_dResult_dResult_Err (dtb__266))
  | Base_dResult.C_Base_dResult_dResult_Ok (dtb__267) -> (Base_dResult.C_Base_dResult_dResult_Ok ((Base_dList.C_Base_dList_dList__x58__x58_ (dtb__265, dtb__267))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))

# 569 "Vuna/Compiler/Ir/Cps.vuna"
let v_Vuna_dCompiler_dIr_dCps_dmBNameText = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrBName_IrBWild -> "wild"
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrBName_IrBNat (dtb__268) -> ("nat" ^ (bi_strFromInt dtb__268))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrBName_IrBArm (dtb__269) -> ("arm" ^ (bi_strFromInt dtb__269))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrBName_IrBUser (dtb__270) -> dtb__270
  | _ -> failwith "DT: impossible branch"
))

# 575 "Vuna/Compiler/Ir/Cps.vuna"
let v_Vuna_dCompiler_dIr_dCps_dmIsOp = (fun b -> (match (b).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrBinder_irBinderName with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrBName_IrBUser (dtb__271) -> (dtb__271 = "@vuna@handle@o")
  | _ -> false
))

# 583 "Vuna/Compiler/Ir/Cps.vuna"
let rec v_Vuna_dCompiler_dIr_dCps_dmResumeGo = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__272, dtb__273) -> (if (v_Vuna_dCompiler_dIr_dCps_dmIsOp dtb__272) then (match dtb__273 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__274, dtb__275) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__274))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
) else (v_Vuna_dCompiler_dIr_dCps_dmResumeGo dtb__273))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 580 "Vuna/Compiler/Ir/Cps.vuna"
let v_Vuna_dCompiler_dIr_dCps_dmResumption = (fun bs -> (v_Vuna_dCompiler_dIr_dCps_dmResumeGo (v_Vuna_dCompiler_dIr_dCps_druntimeBinders bs)))

# 590 "Vuna/Compiler/Ir/Cps.vuna"
let rec v_Vuna_dCompiler_dIr_dCps_dmEraseHead = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCast (dtb__276) -> (v_Vuna_dCompiler_dIr_dCps_dmEraseHead dtb__276)
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (dtb__277, dtb__278) -> (match dtb__277 with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRt (dtb__279) -> (if (dtb__279 = "prim_erase") then (v_Vuna_dCompiler_dIr_dCps_dmEraseHead dtb__278) else mc0)
  | _ -> mc0
)
  | _ -> mc0
))

# 595 "Vuna/Compiler/Ir/Cps.vuna"
let v_Vuna_dCompiler_dIr_dCps_dmIsResumeApp = (fun mc0 mc1 -> (match mc1 with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (dtb__280, dtb__281) -> ((fun p -> (match (v_Vuna_dCompiler_dIr_dCps_dmEraseHead (Base_dPair.v_Base_dPair_dfirstOf p)) with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrVar (dtb__282) -> ((v_Vuna_dCompiler_dIr_dCps_dmBNameText (dtb__282).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrBinder_irBinderName) = (v_Vuna_dCompiler_dIr_dCps_dmBNameText (mc0).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrBinder_irBinderName))
  | _ -> (match (Base_dPair.v_Base_dPair_dsecondOf p) with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__283, dtb__284) -> (match (v_Vuna_dCompiler_dIr_dCps_dmEraseHead dtb__283) with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrVar (dtb__285) -> ((v_Vuna_dCompiler_dIr_dCps_dmBNameText (dtb__285).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrBinder_irBinderName) = (v_Vuna_dCompiler_dIr_dCps_dmBNameText (mc0).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrBinder_irBinderName))
  | _ -> false
)
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
)
)) (v_Vuna_dCompiler_dIr_dCps_dflattenApp mc1))
  | _ -> false
))

# 608 "Vuna/Compiler/Ir/Cps.vuna"
let v_Vuna_dCompiler_dIr_dCps_dmFreshV = (fun n -> (v_Vuna_dCompiler_dIr_dCps_dmkBinder ("__mchV" ^ (bi_strFromInt n))))

# 611 "Vuna/Compiler/Ir/Cps.vuna"
let v_Vuna_dCompiler_dIr_dCps_dmFreshK = (fun n -> (v_Vuna_dCompiler_dIr_dCps_dmkBinder ("__mchK" ^ (bi_strFromInt n))))

# 614 "Vuna/Compiler/Ir/Cps.vuna"
let rec v_Vuna_dCompiler_dIr_dCps_dmCpsAlts = (fun fuel r k alts -> (if (fuel <= 0) then alts else (match alts with
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__286, dtb__287) -> (Base_dList.C_Base_dList_dList__x58__x58_ ({ Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltCtor = (dtb__286).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltCtor; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBinders = (dtb__286).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBinders; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBody = ((((v_Vuna_dCompiler_dIr_dCps_dmCps (fuel - 1)) r) k) (dtb__286).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBody) }, ((((v_Vuna_dCompiler_dIr_dCps_dmCpsAlts (fuel - 1)) r) k) dtb__287)))
  | _ -> failwith "DT: impossible branch"
)))
# 622 "Vuna/Compiler/Ir/Cps.vuna"
and v_Vuna_dCompiler_dIr_dCps_dmCpsAltM = (fun fuel r k m -> (if (fuel <= 0) then m else (match m with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__288) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltCtor = (dtb__288).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltCtor; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBinders = (dtb__288).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBinders; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBody = ((((v_Vuna_dCompiler_dIr_dCps_dmCps (fuel - 1)) r) k) (dtb__288).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBody) }))
  | _ -> failwith "DT: impossible branch"
)))
# 635 "Vuna/Compiler/Ir/Cps.vuna"
and v_Vuna_dCompiler_dIr_dCps_dmCpsArgs = (fun fuel r k sym args acc -> (if (fuel <= 0) then (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (k, (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRtApp (sym, (Base_dList.v_Base_dList_dreverse acc))))) else (match args with
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (k, (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRtApp (sym, (Base_dList.v_Base_dList_dreverse acc)))))
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__289, dtb__290) -> ((fun v -> ((((v_Vuna_dCompiler_dIr_dCps_dmCps (fuel - 1)) r) (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLam ((Base_dList.C_Base_dList_dList__x58__x58_ (v, Base_dList.C_Base_dList_dList_Nil)), ((((((v_Vuna_dCompiler_dIr_dCps_dmCpsArgs (fuel - 1)) r) k) sym) dtb__290) (Base_dList.C_Base_dList_dList__x58__x58_ ((Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrVar (v)), acc)))))) dtb__289)) (v_Vuna_dCompiler_dIr_dCps_dmFreshV fuel))
  | _ -> failwith "DT: impossible branch"
)))
# 645 "Vuna/Compiler/Ir/Cps.vuna"
and v_Vuna_dCompiler_dIr_dCps_dmCpsApply = (fun fuel r k parts -> (if (fuel <= 0) then (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (k, (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrGlobal ("?")))) else ((fun nd_uscrut4 -> (match nd_uscrut4 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__291, dtb__292) -> (match dtb__292 with
  | Base_dList.C_Base_dList_dList_Nil -> ((((v_Vuna_dCompiler_dIr_dCps_dmCps (fuel - 1)) r) k) dtb__291)
  | _ -> ((fun v -> ((((v_Vuna_dCompiler_dIr_dCps_dmCps (fuel - 1)) r) (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLam ((Base_dList.C_Base_dList_dList__x58__x58_ (v, Base_dList.C_Base_dList_dList_Nil)), ((((((v_Vuna_dCompiler_dIr_dCps_dmCpsApplyArgs (fuel - 1)) r) k) dtb__292) Base_dList.C_Base_dList_dList_Nil) v)))) dtb__291)) (v_Vuna_dCompiler_dIr_dCps_dmFreshV fuel))
)
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (k, (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrGlobal ("?"))))
  | _ -> failwith "DT: impossible branch"
)) parts)))
# 655 "Vuna/Compiler/Ir/Cps.vuna"
and v_Vuna_dCompiler_dIr_dCps_dmCpsApplyArgs = (fun fuel r k args acc headV -> (if (fuel <= 0) then (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (k, (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrGlobal ("?")))) else (match args with
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (k, ((v_Vuna_dCompiler_dIr_dCps_dapplyAll (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrVar (headV))) (Base_dList.v_Base_dList_dreverse acc))))
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__293, dtb__294) -> ((fun v -> ((((v_Vuna_dCompiler_dIr_dCps_dmCps (fuel - 1)) r) (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLam ((Base_dList.C_Base_dList_dList__x58__x58_ (v, Base_dList.C_Base_dList_dList_Nil)), ((((((v_Vuna_dCompiler_dIr_dCps_dmCpsApplyArgs (fuel - 1)) r) k) dtb__294) (Base_dList.C_Base_dList_dList__x58__x58_ ((Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrVar (v)), acc))) headV)))) dtb__293)) (v_Vuna_dCompiler_dIr_dCps_dmFreshV fuel))
  | _ -> failwith "DT: impossible branch"
)))
# 664 "Vuna/Compiler/Ir/Cps.vuna"
and v_Vuna_dCompiler_dIr_dCps_dmCps = (fun fuel r k e -> (if (fuel <= 0) then (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (k, e)) else (if ((v_Vuna_dCompiler_dIr_dCps_dmIsResumeApp r) e) then (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (e, k)) else (match e with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLet (dtb__295, dtb__296, dtb__297) -> ((fun v -> ((fun cont -> ((((v_Vuna_dCompiler_dIr_dCps_dmCps (fuel - 1)) r) cont) dtb__296)) (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLam ((Base_dList.C_Base_dList_dList__x58__x58_ (v, Base_dList.C_Base_dList_dList_Nil)), (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLet (dtb__295, (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrVar (v)), ((((v_Vuna_dCompiler_dIr_dCps_dmCps (fuel - 1)) r) k) dtb__297))))))) (v_Vuna_dCompiler_dIr_dCps_dmFreshV fuel))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCase (dtb__298, dtb__299) -> ((fun v -> ((fun cont -> ((((v_Vuna_dCompiler_dIr_dCps_dmCps (fuel - 1)) r) cont) dtb__298)) (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLam ((Base_dList.C_Base_dList_dList__x58__x58_ (v, Base_dList.C_Base_dList_dList_Nil)), (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCase ((Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrVar (v)), ((((v_Vuna_dCompiler_dIr_dCps_dmCpsAlts (fuel - 2)) r) k) dtb__299))))))) (v_Vuna_dCompiler_dIr_dCps_dmFreshV fuel))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrIf (dtb__300, dtb__301, dtb__302) -> ((fun v -> ((fun cont -> ((((v_Vuna_dCompiler_dIr_dCps_dmCps (fuel - 1)) r) cont) dtb__300)) (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLam ((Base_dList.C_Base_dList_dList__x58__x58_ (v, Base_dList.C_Base_dList_dList_Nil)), (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrIf ((Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrVar (v)), ((((v_Vuna_dCompiler_dIr_dCps_dmCps (fuel - 2)) r) k) dtb__301), ((((v_Vuna_dCompiler_dIr_dCps_dmCps (fuel - 2)) r) k) dtb__302))))))) (v_Vuna_dCompiler_dIr_dCps_dmFreshV fuel))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrNatCase (dtb__303, dtb__304, dtb__305, dtb__306, dtb__307) -> ((fun v -> ((fun cont -> ((((v_Vuna_dCompiler_dIr_dCps_dmCps (fuel - 1)) r) cont) dtb__303)) (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLam ((Base_dList.C_Base_dList_dList__x58__x58_ (v, Base_dList.C_Base_dList_dList_Nil)), (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrNatCase ((Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrVar (v)), dtb__304, ((((v_Vuna_dCompiler_dIr_dCps_dmCpsAltM (fuel - 2)) r) k) dtb__305), ((((v_Vuna_dCompiler_dIr_dCps_dmCpsAltM (fuel - 2)) r) k) dtb__306), ((((v_Vuna_dCompiler_dIr_dCps_dmCpsAltM (fuel - 2)) r) k) dtb__307))))))) (v_Vuna_dCompiler_dIr_dCps_dmFreshV fuel))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCast (dtb__308) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCast (((((v_Vuna_dCompiler_dIr_dCps_dmCps (fuel - 1)) r) k) dtb__308)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRtApp (dtb__309, dtb__310) -> ((((((v_Vuna_dCompiler_dIr_dCps_dmCpsArgs (fuel - 1)) r) k) dtb__309) dtb__310) Base_dList.C_Base_dList_dList_Nil)
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (dtb__311, dtb__312) -> ((fun p -> ((((v_Vuna_dCompiler_dIr_dCps_dmCpsApply (fuel - 1)) r) k) ((Base_dList.v_Base_dList_dappend (Base_dList.C_Base_dList_dList__x58__x58_ ((Base_dPair.v_Base_dPair_dfirstOf p), Base_dList.C_Base_dList_dList_Nil))) (Base_dPair.v_Base_dPair_dsecondOf p)))) (v_Vuna_dCompiler_dIr_dCps_dflattenApp e))
  | _ -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (k, e))
))))

# 628 "Vuna/Compiler/Ir/Cps.vuna"
let v_Vuna_dCompiler_dIr_dCps_dmIsControl = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrNatCase (dtb__313, dtb__314, dtb__315, dtb__316, dtb__317) -> true
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrIf (dtb__318, dtb__319, dtb__320) -> true
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCase (dtb__321, dtb__322) -> true
  | _ -> false
))

# 698 "Vuna/Compiler/Ir/Cps.vuna"
let rec v_Vuna_dCompiler_dIr_dCps_dmHandlerLam = (fun fuel bs body -> (match (v_Vuna_dCompiler_dIr_dCps_dmResumption bs) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLam (bs, ((v_Vuna_dCompiler_dIr_dCps_dmHandlers (fuel - 1)) body)))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__323) -> ((fun kd -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLam (((Base_dList.v_Base_dList_dappend bs) (Base_dList.C_Base_dList_dList__x58__x58_ (kd, Base_dList.C_Base_dList_dList_Nil))), ((((v_Vuna_dCompiler_dIr_dCps_dmCps (fuel - 1)) dtb__323) (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrVar (kd))) body)))) (v_Vuna_dCompiler_dIr_dCps_dmFreshK fuel))
  | _ -> failwith "DT: impossible branch"
))
# 706 "Vuna/Compiler/Ir/Cps.vuna"
and v_Vuna_dCompiler_dIr_dCps_dmListH = (fun fuel xs -> (if (fuel <= 0) then xs else (match xs with
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__324, dtb__325) -> (Base_dList.C_Base_dList_dList__x58__x58_ (((v_Vuna_dCompiler_dIr_dCps_dmHandlers (fuel - 1)) dtb__324), ((v_Vuna_dCompiler_dIr_dCps_dmListH (fuel - 1)) dtb__325)))
  | _ -> failwith "DT: impossible branch"
)))
# 712 "Vuna/Compiler/Ir/Cps.vuna"
and v_Vuna_dCompiler_dIr_dCps_dmFieldsH = (fun fuel fs -> (if (fuel <= 0) then fs else (match fs with
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__326, dtb__327) -> (Base_dList.C_Base_dList_dList__x58__x58_ ({ Base_dPair.f_Base_dPair_dPair_first = (Base_dPair.v_Base_dPair_dfirstOf dtb__326); Base_dPair.f_Base_dPair_dPair_second = ((v_Vuna_dCompiler_dIr_dCps_dmHandlers (fuel - 1)) (Base_dPair.v_Base_dPair_dsecondOf dtb__326)) }, ((v_Vuna_dCompiler_dIr_dCps_dmFieldsH (fuel - 1)) dtb__327)))
  | _ -> failwith "DT: impossible branch"
)))
# 718 "Vuna/Compiler/Ir/Cps.vuna"
and v_Vuna_dCompiler_dIr_dCps_dmHandlers = (fun fuel e -> (if (fuel <= 0) then e else (match e with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLam (dtb__328, dtb__329) -> (((v_Vuna_dCompiler_dIr_dCps_dmHandlerLam (fuel - 1)) dtb__328) dtb__329)
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCtor (dtb__330, dtb__331, dtb__332) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCtor (dtb__330, dtb__331, ((v_Vuna_dCompiler_dIr_dCps_dmListH (fuel - 1)) dtb__332)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRecord (dtb__333, dtb__334) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRecord (dtb__333, ((v_Vuna_dCompiler_dIr_dCps_dmFieldsH (fuel - 1)) dtb__334)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrProj (dtb__335, dtb__336, dtb__337) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrProj (((v_Vuna_dCompiler_dIr_dCps_dmHandlers (fuel - 1)) dtb__335), dtb__336, dtb__337))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRecUpd (dtb__338, dtb__339, dtb__340) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRecUpd (((v_Vuna_dCompiler_dIr_dCps_dmHandlers (fuel - 1)) dtb__338), dtb__339, ((v_Vuna_dCompiler_dIr_dCps_dmFieldsH (fuel - 1)) dtb__340)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRtApp (dtb__341, dtb__342) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRtApp (dtb__341, ((v_Vuna_dCompiler_dIr_dCps_dmListH (fuel - 1)) dtb__342)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCast (dtb__343) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCast (((v_Vuna_dCompiler_dIr_dCps_dmHandlers (fuel - 1)) dtb__343)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLet (dtb__344, dtb__345, dtb__346) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLet (dtb__344, ((v_Vuna_dCompiler_dIr_dCps_dmHandlers (fuel - 1)) dtb__345), ((v_Vuna_dCompiler_dIr_dCps_dmHandlers (fuel - 1)) dtb__346)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (dtb__347, dtb__348) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (((v_Vuna_dCompiler_dIr_dCps_dmHandlers (fuel - 1)) dtb__347), ((v_Vuna_dCompiler_dIr_dCps_dmHandlers (fuel - 1)) dtb__348)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrIf (dtb__349, dtb__350, dtb__351) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrIf (((v_Vuna_dCompiler_dIr_dCps_dmHandlers (fuel - 1)) dtb__349), ((v_Vuna_dCompiler_dIr_dCps_dmHandlers (fuel - 1)) dtb__350), ((v_Vuna_dCompiler_dIr_dCps_dmHandlers (fuel - 1)) dtb__351)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCase (dtb__352, dtb__353) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCase (((v_Vuna_dCompiler_dIr_dCps_dmHandlers (fuel - 1)) dtb__352), ((v_Vuna_dCompiler_dIr_dCps_dmHandlersAlts (fuel - 1)) dtb__353)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrNatCase (dtb__354, dtb__355, dtb__356, dtb__357, dtb__358) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrNatCase (((v_Vuna_dCompiler_dIr_dCps_dmHandlers (fuel - 1)) dtb__354), dtb__355, ((v_Vuna_dCompiler_dIr_dCps_dmHandlersAltM (fuel - 1)) dtb__356), ((v_Vuna_dCompiler_dIr_dCps_dmHandlersAltM (fuel - 1)) dtb__357), ((v_Vuna_dCompiler_dIr_dCps_dmHandlersAltM (fuel - 1)) dtb__358)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrConcatMany (dtb__359) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrConcatMany (((v_Vuna_dCompiler_dIr_dCps_dmListH (fuel - 1)) dtb__359)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrEffThunk (dtb__360, dtb__361, dtb__362, dtb__363, dtb__364) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrEffThunk (dtb__360, dtb__361, dtb__362, dtb__363, ((v_Vuna_dCompiler_dIr_dCps_dmHandlers (fuel - 1)) dtb__364)))
  | _ -> e
)))
# 739 "Vuna/Compiler/Ir/Cps.vuna"
and v_Vuna_dCompiler_dIr_dCps_dmHandlersAlts = (fun fuel alts -> (if (fuel <= 0) then alts else (match alts with
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__365, dtb__366) -> (Base_dList.C_Base_dList_dList__x58__x58_ ({ Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltCtor = (dtb__365).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltCtor; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBinders = (dtb__365).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBinders; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBody = ((v_Vuna_dCompiler_dIr_dCps_dmHandlers (fuel - 1)) (dtb__365).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBody) }, ((v_Vuna_dCompiler_dIr_dCps_dmHandlersAlts (fuel - 1)) dtb__366)))
  | _ -> failwith "DT: impossible branch"
)))
# 747 "Vuna/Compiler/Ir/Cps.vuna"
and v_Vuna_dCompiler_dIr_dCps_dmHandlersAltM = (fun fuel m -> (if (fuel <= 0) then m else (match m with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__367) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltCtor = (dtb__367).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltCtor; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBinders = (dtb__367).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBinders; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBody = ((v_Vuna_dCompiler_dIr_dCps_dmHandlers (fuel - 1)) (dtb__367).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBody) }))
  | _ -> failwith "DT: impossible branch"
)))

# 753 "Vuna/Compiler/Ir/Cps.vuna"
let v_Vuna_dCompiler_dIr_dCps_dmSym = (fun x -> (if (x = v_Vuna_dCompiler_dIr_dCps_dirCpsPerformName) then v_Vuna_dCompiler_dIr_dCps_dirMPerformName else (if (x = v_Vuna_dCompiler_dIr_dCps_dirCpsHandleName) then v_Vuna_dCompiler_dIr_dCps_dirMHandleName else (if (x = v_Vuna_dCompiler_dIr_dCps_dirCpsSelfName) then v_Vuna_dCompiler_dIr_dCps_dirMSelfName else x))))

# 758 "Vuna/Compiler/Ir/Cps.vuna"
let rec v_Vuna_dCompiler_dIr_dCps_dmSyms = (fun fuel e -> (if (fuel <= 0) then e else (match e with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRt (dtb__368) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRt ((v_Vuna_dCompiler_dIr_dCps_dmSym dtb__368)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRtApp (dtb__369, dtb__370) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRtApp ((v_Vuna_dCompiler_dIr_dCps_dmSym dtb__369), ((v_Vuna_dCompiler_dIr_dCps_dmListS (fuel - 1)) dtb__370)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCtor (dtb__371, dtb__372, dtb__373) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCtor (dtb__371, dtb__372, ((v_Vuna_dCompiler_dIr_dCps_dmListS (fuel - 1)) dtb__373)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRecord (dtb__374, dtb__375) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRecord (dtb__374, ((v_Vuna_dCompiler_dIr_dCps_dmFieldsS (fuel - 1)) dtb__375)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrProj (dtb__376, dtb__377, dtb__378) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrProj (((v_Vuna_dCompiler_dIr_dCps_dmSyms (fuel - 1)) dtb__376), dtb__377, dtb__378))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRecUpd (dtb__379, dtb__380, dtb__381) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRecUpd (((v_Vuna_dCompiler_dIr_dCps_dmSyms (fuel - 1)) dtb__379), dtb__380, ((v_Vuna_dCompiler_dIr_dCps_dmFieldsS (fuel - 1)) dtb__381)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCast (dtb__382) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCast (((v_Vuna_dCompiler_dIr_dCps_dmSyms (fuel - 1)) dtb__382)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLet (dtb__383, dtb__384, dtb__385) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLet (dtb__383, ((v_Vuna_dCompiler_dIr_dCps_dmSyms (fuel - 1)) dtb__384), ((v_Vuna_dCompiler_dIr_dCps_dmSyms (fuel - 1)) dtb__385)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLam (dtb__386, dtb__387) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLam (dtb__386, ((v_Vuna_dCompiler_dIr_dCps_dmSyms (fuel - 1)) dtb__387)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (dtb__388, dtb__389) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (((v_Vuna_dCompiler_dIr_dCps_dmSyms (fuel - 1)) dtb__388), ((v_Vuna_dCompiler_dIr_dCps_dmSyms (fuel - 1)) dtb__389)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrIf (dtb__390, dtb__391, dtb__392) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrIf (((v_Vuna_dCompiler_dIr_dCps_dmSyms (fuel - 1)) dtb__390), ((v_Vuna_dCompiler_dIr_dCps_dmSyms (fuel - 1)) dtb__391), ((v_Vuna_dCompiler_dIr_dCps_dmSyms (fuel - 1)) dtb__392)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCase (dtb__393, dtb__394) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCase (((v_Vuna_dCompiler_dIr_dCps_dmSyms (fuel - 1)) dtb__393), ((v_Vuna_dCompiler_dIr_dCps_dmSymsAltsM (fuel - 1)) dtb__394)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrNatCase (dtb__395, dtb__396, dtb__397, dtb__398, dtb__399) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrNatCase (((v_Vuna_dCompiler_dIr_dCps_dmSyms (fuel - 1)) dtb__395), dtb__396, ((v_Vuna_dCompiler_dIr_dCps_dmSymsAltMM (fuel - 1)) dtb__397), ((v_Vuna_dCompiler_dIr_dCps_dmSymsAltMM (fuel - 1)) dtb__398), ((v_Vuna_dCompiler_dIr_dCps_dmSymsAltMM (fuel - 1)) dtb__399)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrConcatMany (dtb__400) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrConcatMany (((v_Vuna_dCompiler_dIr_dCps_dmListS (fuel - 1)) dtb__400)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrEffThunk (dtb__401, dtb__402, dtb__403, dtb__404, dtb__405) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrEffThunk (dtb__401, dtb__402, dtb__403, dtb__404, ((v_Vuna_dCompiler_dIr_dCps_dmSyms (fuel - 1)) dtb__405)))
  | _ -> e
)))
# 780 "Vuna/Compiler/Ir/Cps.vuna"
and v_Vuna_dCompiler_dIr_dCps_dmListS = (fun fuel xs -> (if (fuel <= 0) then xs else (match xs with
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__406, dtb__407) -> (Base_dList.C_Base_dList_dList__x58__x58_ (((v_Vuna_dCompiler_dIr_dCps_dmSyms (fuel - 1)) dtb__406), ((v_Vuna_dCompiler_dIr_dCps_dmListS (fuel - 1)) dtb__407)))
  | _ -> failwith "DT: impossible branch"
)))
# 786 "Vuna/Compiler/Ir/Cps.vuna"
and v_Vuna_dCompiler_dIr_dCps_dmFieldsS = (fun fuel fs -> (if (fuel <= 0) then fs else (match fs with
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__408, dtb__409) -> (Base_dList.C_Base_dList_dList__x58__x58_ ({ Base_dPair.f_Base_dPair_dPair_first = (Base_dPair.v_Base_dPair_dfirstOf dtb__408); Base_dPair.f_Base_dPair_dPair_second = ((v_Vuna_dCompiler_dIr_dCps_dmSyms (fuel - 1)) (Base_dPair.v_Base_dPair_dsecondOf dtb__408)) }, ((v_Vuna_dCompiler_dIr_dCps_dmFieldsS (fuel - 1)) dtb__409)))
  | _ -> failwith "DT: impossible branch"
)))
# 792 "Vuna/Compiler/Ir/Cps.vuna"
and v_Vuna_dCompiler_dIr_dCps_dmSymsAltsM = (fun fuel alts -> (if (fuel <= 0) then alts else (match alts with
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__410, dtb__411) -> (Base_dList.C_Base_dList_dList__x58__x58_ ({ Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltCtor = (dtb__410).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltCtor; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBinders = (dtb__410).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBinders; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBody = ((v_Vuna_dCompiler_dIr_dCps_dmSyms (fuel - 1)) (dtb__410).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBody) }, ((v_Vuna_dCompiler_dIr_dCps_dmSymsAltsM (fuel - 1)) dtb__411)))
  | _ -> failwith "DT: impossible branch"
)))
# 799 "Vuna/Compiler/Ir/Cps.vuna"
and v_Vuna_dCompiler_dIr_dCps_dmSymsAltMM = (fun fuel m -> (if (fuel <= 0) then m else (match m with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__412) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltCtor = (dtb__412).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltCtor; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBinders = (dtb__412).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBinders; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBody = ((v_Vuna_dCompiler_dIr_dCps_dmSyms (fuel - 1)) (dtb__412).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBody) }))
  | _ -> failwith "DT: impossible branch"
)))

# 805 "Vuna/Compiler/Ir/Cps.vuna"
let v_Vuna_dCompiler_dIr_dCps_dmDoneCont = ((fun v -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLam ((Base_dList.C_Base_dList_dList__x58__x58_ (v, Base_dList.C_Base_dList_dList_Nil)), (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp ((Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRt (v_Vuna_dCompiler_dIr_dCps_dirMDoneName)), (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrVar (v))))))) (v_Vuna_dCompiler_dIr_dCps_dmkBinder "__mDoneV"))

# 811 "Vuna/Compiler/Ir/Cps.vuna"
let rec v_Vuna_dCompiler_dIr_dCps_dmTrampolineBody = (fun mc0 mc1 -> (match mc1 with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (dtb__413, dtb__414) -> (match dtb__413 with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (dtb__415, dtb__416) -> (match dtb__415 with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (dtb__417, dtb__418) -> (match dtb__417 with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrGlobal (dtb__419) -> (if (dtb__419 = v_Vuna_dCompiler_dIr_dCps_drunThunkName) then (Base_dResult.C_Base_dResult_dResult_Ok ((Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp ((Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRt (v_Vuna_dCompiler_dIr_dCps_dirMRunName)), ((v_Vuna_dCompiler_dIr_dCps_dapplyAll (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrGlobal (dtb__419))) (Base_dList.C_Base_dList_dList__x58__x58_ (dtb__418, (Base_dList.C_Base_dList_dList__x58__x58_ (dtb__416, (Base_dList.C_Base_dList_dList__x58__x58_ (v_Vuna_dCompiler_dIr_dCps_dmDoneCont, Base_dList.C_Base_dList_dList_Nil))))))))))) else (Base_dResult.C_Base_dResult_dResult_Err (("machine CPS: unexpected trampoline shape: " ^ mc0))))
  | _ -> (Base_dResult.C_Base_dResult_dResult_Err (("machine CPS: unexpected trampoline shape: " ^ mc0)))
)
  | _ -> (Base_dResult.C_Base_dResult_dResult_Err (("machine CPS: unexpected trampoline shape: " ^ mc0)))
)
  | _ -> (Base_dResult.C_Base_dResult_dResult_Err (("machine CPS: unexpected trampoline shape: " ^ mc0)))
)
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCast (dtb__420) -> (match ((v_Vuna_dCompiler_dIr_dCps_dmTrampolineBody mc0) dtb__420) with
  | Base_dResult.C_Base_dResult_dResult_Err (dtb__421) -> (Base_dResult.C_Base_dResult_dResult_Err (dtb__421))
  | Base_dResult.C_Base_dResult_dResult_Ok (dtb__422) -> (Base_dResult.C_Base_dResult_dResult_Ok ((Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCast (dtb__422))))
  | _ -> failwith "DT: impossible branch"
)
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLam (dtb__423, dtb__424) -> (match ((v_Vuna_dCompiler_dIr_dCps_dmTrampolineBody mc0) dtb__424) with
  | Base_dResult.C_Base_dResult_dResult_Err (dtb__425) -> (Base_dResult.C_Base_dResult_dResult_Err (dtb__425))
  | Base_dResult.C_Base_dResult_dResult_Ok (dtb__426) -> (Base_dResult.C_Base_dResult_dResult_Ok ((Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLam (dtb__423, dtb__426))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> (Base_dResult.C_Base_dResult_dResult_Err (("machine CPS: unexpected trampoline shape: " ^ mc0)))
))

# 823 "Vuna/Compiler/Ir/Cps.vuna"
let rec v_Vuna_dCompiler_dIr_dCps_dcollectHandleOps = (fun fuel e -> (if (fuel <= 0) then Base_dList.C_Base_dList_dList_Nil else (match e with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (dtb__427, dtb__428) -> ((fun p -> ((fun head -> ((fun args -> ((fun here -> ((Base_dList.v_Base_dList_dappend here) ((Base_dList.v_Base_dList_dappend ((v_Vuna_dCompiler_dIr_dCps_dcollectHandleOps (fuel - 1)) head)) ((v_Vuna_dCompiler_dIr_dCps_dcollectHandleOpsList (fuel - 1)) args)))) (match head with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrGlobal (dtb__429) -> (if (dtb__429 = "Base.Eff.handleWithAt") then ((fun nd_uscrut8 -> (match nd_uscrut8 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__430, dtb__431) -> (match dtb__431 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__432, dtb__433) -> (match dtb__433 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__434, dtb__435) -> (match dtb__435 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__436, dtb__437) -> (match dtb__437 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__438, dtb__439) -> (match dtb__438 with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrGlobal (dtb__440) -> (Base_dList.C_Base_dList_dList__x58__x58_ (dtb__440, Base_dList.C_Base_dList_dList_Nil))
  | _ -> Base_dList.C_Base_dList_dList_Nil
)
  | _ -> Base_dList.C_Base_dList_dList_Nil
)
  | _ -> Base_dList.C_Base_dList_dList_Nil
)
  | _ -> Base_dList.C_Base_dList_dList_Nil
)
  | _ -> Base_dList.C_Base_dList_dList_Nil
)
  | _ -> Base_dList.C_Base_dList_dList_Nil
)) args) else (if (if (dtb__429 = "Base.Eff.handleCoreAt") then true else (dtb__429 = "Base.Eff.handleCore")) then ((fun nd_uscrut8 -> (match nd_uscrut8 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__441, dtb__442) -> (match dtb__442 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__443, dtb__444) -> (match dtb__444 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__445, dtb__446) -> (match dtb__446 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__447, dtb__448) -> (match dtb__447 with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrGlobal (dtb__449) -> (Base_dList.C_Base_dList_dList__x58__x58_ (dtb__449, Base_dList.C_Base_dList_dList_Nil))
  | _ -> Base_dList.C_Base_dList_dList_Nil
)
  | _ -> Base_dList.C_Base_dList_dList_Nil
)
  | _ -> Base_dList.C_Base_dList_dList_Nil
)
  | _ -> Base_dList.C_Base_dList_dList_Nil
)
  | _ -> Base_dList.C_Base_dList_dList_Nil
)) args) else (if (if (if (dtb__429 = "Base.EffConsole.handleConsole") then true else (dtb__429 = "Base.EffFs.handleFs")) then true else (dtb__429 = "Base.EffClock.handleClock")) then ((fun nd_uscrut8 -> (match nd_uscrut8 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__450, dtb__451) -> (match dtb__451 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__452, dtb__453) -> (match dtb__453 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__454, dtb__455) -> (match dtb__454 with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrGlobal (dtb__456) -> (Base_dList.C_Base_dList_dList__x58__x58_ (dtb__456, Base_dList.C_Base_dList_dList_Nil))
  | _ -> Base_dList.C_Base_dList_dList_Nil
)
  | _ -> Base_dList.C_Base_dList_dList_Nil
)
  | _ -> Base_dList.C_Base_dList_dList_Nil
)
  | _ -> Base_dList.C_Base_dList_dList_Nil
)) args) else Base_dList.C_Base_dList_dList_Nil)))
  | _ -> Base_dList.C_Base_dList_dList_Nil
))) (Base_dPair.v_Base_dPair_dsecondOf p))) (Base_dPair.v_Base_dPair_dfirstOf p))) (v_Vuna_dCompiler_dIr_dCps_dflattenApp e))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCtor (dtb__457, dtb__458, dtb__459) -> ((v_Vuna_dCompiler_dIr_dCps_dcollectHandleOpsList (fuel - 1)) dtb__459)
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRecord (dtb__460, dtb__461) -> ((v_Vuna_dCompiler_dIr_dCps_dcollectHandleOpsFields (fuel - 1)) dtb__461)
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrProj (dtb__462, dtb__463, dtb__464) -> ((v_Vuna_dCompiler_dIr_dCps_dcollectHandleOps (fuel - 1)) dtb__462)
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRecUpd (dtb__465, dtb__466, dtb__467) -> ((Base_dList.v_Base_dList_dappend ((v_Vuna_dCompiler_dIr_dCps_dcollectHandleOps (fuel - 1)) dtb__465)) ((v_Vuna_dCompiler_dIr_dCps_dcollectHandleOpsFields (fuel - 1)) dtb__467))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRtApp (dtb__468, dtb__469) -> ((v_Vuna_dCompiler_dIr_dCps_dcollectHandleOpsList (fuel - 1)) dtb__469)
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCast (dtb__470) -> ((v_Vuna_dCompiler_dIr_dCps_dcollectHandleOps (fuel - 1)) dtb__470)
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLet (dtb__471, dtb__472, dtb__473) -> ((Base_dList.v_Base_dList_dappend ((v_Vuna_dCompiler_dIr_dCps_dcollectHandleOps (fuel - 1)) dtb__472)) ((v_Vuna_dCompiler_dIr_dCps_dcollectHandleOps (fuel - 1)) dtb__473))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLam (dtb__474, dtb__475) -> ((v_Vuna_dCompiler_dIr_dCps_dcollectHandleOps (fuel - 1)) dtb__475)
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrIf (dtb__476, dtb__477, dtb__478) -> ((Base_dList.v_Base_dList_dappend ((v_Vuna_dCompiler_dIr_dCps_dcollectHandleOps (fuel - 1)) dtb__476)) ((Base_dList.v_Base_dList_dappend ((v_Vuna_dCompiler_dIr_dCps_dcollectHandleOps (fuel - 1)) dtb__477)) ((v_Vuna_dCompiler_dIr_dCps_dcollectHandleOps (fuel - 1)) dtb__478)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCase (dtb__479, dtb__480) -> ((Base_dList.v_Base_dList_dappend ((v_Vuna_dCompiler_dIr_dCps_dcollectHandleOps (fuel - 1)) dtb__479)) ((v_Vuna_dCompiler_dIr_dCps_dcollectHandleOpsAlts (fuel - 1)) dtb__480))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrNatCase (dtb__481, dtb__482, dtb__483, dtb__484, dtb__485) -> ((Base_dList.v_Base_dList_dappend ((v_Vuna_dCompiler_dIr_dCps_dcollectHandleOps (fuel - 1)) dtb__481)) ((Base_dList.v_Base_dList_dappend ((v_Vuna_dCompiler_dIr_dCps_dcollectHandleOpsAltM (fuel - 1)) dtb__483)) ((Base_dList.v_Base_dList_dappend ((v_Vuna_dCompiler_dIr_dCps_dcollectHandleOpsAltM (fuel - 1)) dtb__484)) ((v_Vuna_dCompiler_dIr_dCps_dcollectHandleOpsAltM (fuel - 1)) dtb__485))))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrConcatMany (dtb__486) -> ((v_Vuna_dCompiler_dIr_dCps_dcollectHandleOpsList (fuel - 1)) dtb__486)
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrEffThunk (dtb__487, dtb__488, dtb__489, dtb__490, dtb__491) -> ((v_Vuna_dCompiler_dIr_dCps_dcollectHandleOps (fuel - 1)) dtb__491)
  | _ -> Base_dList.C_Base_dList_dList_Nil
)))
# 863 "Vuna/Compiler/Ir/Cps.vuna"
and v_Vuna_dCompiler_dIr_dCps_dcollectHandleOpsList = (fun fuel xs -> (if (fuel <= 0) then Base_dList.C_Base_dList_dList_Nil else (match xs with
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__492, dtb__493) -> ((Base_dList.v_Base_dList_dappend ((v_Vuna_dCompiler_dIr_dCps_dcollectHandleOps (fuel - 1)) dtb__492)) ((v_Vuna_dCompiler_dIr_dCps_dcollectHandleOpsList (fuel - 1)) dtb__493))
  | _ -> failwith "DT: impossible branch"
)))
# 869 "Vuna/Compiler/Ir/Cps.vuna"
and v_Vuna_dCompiler_dIr_dCps_dcollectHandleOpsFields = (fun fuel fs -> (if (fuel <= 0) then Base_dList.C_Base_dList_dList_Nil else (match fs with
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__494, dtb__495) -> ((Base_dList.v_Base_dList_dappend ((v_Vuna_dCompiler_dIr_dCps_dcollectHandleOps (fuel - 1)) (Base_dPair.v_Base_dPair_dsecondOf dtb__494))) ((v_Vuna_dCompiler_dIr_dCps_dcollectHandleOpsFields (fuel - 1)) dtb__495))
  | _ -> failwith "DT: impossible branch"
)))
# 876 "Vuna/Compiler/Ir/Cps.vuna"
and v_Vuna_dCompiler_dIr_dCps_dcollectHandleOpsAlts = (fun fuel alts -> (if (fuel <= 0) then Base_dList.C_Base_dList_dList_Nil else (match alts with
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__496, dtb__497) -> ((Base_dList.v_Base_dList_dappend ((v_Vuna_dCompiler_dIr_dCps_dcollectHandleOps (fuel - 1)) (dtb__496).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBody)) ((v_Vuna_dCompiler_dIr_dCps_dcollectHandleOpsAlts (fuel - 1)) dtb__497))
  | _ -> failwith "DT: impossible branch"
)))
# 883 "Vuna/Compiler/Ir/Cps.vuna"
and v_Vuna_dCompiler_dIr_dCps_dcollectHandleOpsAltM = (fun fuel m -> (if (fuel <= 0) then Base_dList.C_Base_dList_dList_Nil else (match m with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dList.C_Base_dList_dList_Nil
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__498) -> ((v_Vuna_dCompiler_dIr_dCps_dcollectHandleOps (fuel - 1)) (dtb__498).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBody)
  | _ -> failwith "DT: impossible branch"
)))

# 889 "Vuna/Compiler/Ir/Cps.vuna"
let v_Vuna_dCompiler_dIr_dCps_dmBodyOf = (fun d -> (match (Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirDefBody d) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__499) -> dtb__499
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrInt (0))
  | _ -> failwith "DT: impossible branch"
))

# 894 "Vuna/Compiler/Ir/Cps.vuna"
let rec v_Vuna_dCompiler_dIr_dCps_dcollectHandleOpsDefs = (fun fuel ds -> (if (fuel <= 0) then Base_dList.C_Base_dList_dList_Nil else (match ds with
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__500, dtb__501) -> ((Base_dList.v_Base_dList_dappend ((v_Vuna_dCompiler_dIr_dCps_dcollectHandleOps (fuel - 1)) (v_Vuna_dCompiler_dIr_dCps_dmBodyOf dtb__500))) ((v_Vuna_dCompiler_dIr_dCps_dcollectHandleOpsDefs (fuel - 1)) dtb__501))
  | _ -> failwith "DT: impossible branch"
)))

# 901 "Vuna/Compiler/Ir/Cps.vuna"
let rec v_Vuna_dCompiler_dIr_dCps_dmemName = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__502, dtb__503) -> (if (mc0 = dtb__502) then true else ((v_Vuna_dCompiler_dIr_dCps_dmemName mc0) dtb__503))
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 905 "Vuna/Compiler/Ir/Cps.vuna"
let v_Vuna_dCompiler_dIr_dCps_dmHandlerFun = (fun fuel body -> (if (fuel <= 0) then body else (match body with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLam (dtb__504, dtb__505) -> ((fun nd_uscrut4 -> (match nd_uscrut4 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__506, dtb__507) -> (match dtb__507 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__508, dtb__509) -> ((fun kd -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLam (((Base_dList.v_Base_dList_dappend dtb__504) (Base_dList.C_Base_dList_dList__x58__x58_ (kd, Base_dList.C_Base_dList_dList_Nil))), ((((v_Vuna_dCompiler_dIr_dCps_dmCps (fuel - 1)) dtb__508) (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrVar (kd))) dtb__505)))) (v_Vuna_dCompiler_dIr_dCps_dmFreshK fuel))
  | _ -> body
)
  | _ -> body
)) (v_Vuna_dCompiler_dIr_dCps_druntimeBinders dtb__504))
  | _ -> body
)))

# 916 "Vuna/Compiler/Ir/Cps.vuna"
let v_Vuna_dCompiler_dIr_dCps_dmDef = (fun handlers fuel d -> (if (fuel <= 0) then d else (match d with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrDef_IrExternDef (dtb__510, dtb__511, dtb__512, dtb__513) -> d
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrDef_IrDef (dtb__514, dtb__515, dtb__516, dtb__517, dtb__518, dtb__519, dtb__520) -> ((fun marked -> ((fun h -> ((fun ar2 -> ((fun b -> (if (if (if (dtb__514 = v_Vuna_dCompiler_dIr_dCps_drunPureName) then true else (dtb__514 = v_Vuna_dCompiler_dIr_dCps_drunEffName)) then true else (dtb__514 = v_Vuna_dCompiler_dIr_dCps_drunMainName)) then (match ((v_Vuna_dCompiler_dIr_dCps_dmTrampolineBody dtb__514) b) with
  | Base_dResult.C_Base_dResult_dResult_Ok (dtb__521) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrDef_IrDef (dtb__514, ar2, dtb__516, dtb__521, dtb__518, dtb__519, dtb__520))
  | Base_dResult.C_Base_dResult_dResult_Err (dtb__522) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrDef_IrDef (dtb__514, ar2, dtb__516, b, dtb__518, dtb__519, dtb__520))
  | _ -> failwith "DT: impossible branch"
) else (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrDef_IrDef (dtb__514, ar2, dtb__516, b, dtb__518, dtb__519, dtb__520)))) ((v_Vuna_dCompiler_dIr_dCps_dmSyms (fuel - 1)) ((v_Vuna_dCompiler_dIr_dCps_dmHandlers (fuel - 1)) h)))) (if marked then (dtb__515 + 1) else dtb__515))) (if marked then ((v_Vuna_dCompiler_dIr_dCps_dmHandlerFun (fuel - 1)) dtb__517) else dtb__517))) ((v_Vuna_dCompiler_dIr_dCps_dmemName dtb__514) handlers))
  | _ -> failwith "DT: impossible branch"
)))

# 931 "Vuna/Compiler/Ir/Cps.vuna"
let rec v_Vuna_dCompiler_dIr_dCps_dmDefs = (fun handlers fuel ds -> (if (fuel <= 0) then ds else (match ds with
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__523, dtb__524) -> (Base_dList.C_Base_dList_dList__x58__x58_ ((((v_Vuna_dCompiler_dIr_dCps_dmDef handlers) (fuel - 1)) dtb__523), (((v_Vuna_dCompiler_dIr_dCps_dmDefs handlers) (fuel - 1)) dtb__524)))
  | _ -> failwith "DT: impossible branch"
)))

# 949 "Vuna/Compiler/Ir/Cps.vuna"
let v_Vuna_dCompiler_dIr_dCps_dcpsUnit = (fun u -> (match ((v_Vuna_dCompiler_dIr_dCps_dtransformGroups v_Vuna_dCompiler_dIr_dCps_dstartFuel) (u).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrUnit_irUnitGroups) with
  | Base_dResult.C_Base_dResult_dResult_Err (dtb__525) -> (Base_dResult.C_Base_dResult_dResult_Err (dtb__525))
  | Base_dResult.C_Base_dResult_dResult_Ok (dtb__526) -> (Base_dResult.C_Base_dResult_dResult_Ok ({ Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrUnit_irUnitTyDecls = (u).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrUnit_irUnitTyDecls; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrUnit_irUnitGroups = dtb__526; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrUnit_irUnitHasListFamily = (u).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrUnit_irUnitHasListFamily; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrUnit_irUnitTypeRefs = (u).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrUnit_irUnitTypeRefs; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrUnit_irUnitEntry = (u).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrUnit_irUnitEntry }))
  | _ -> failwith "DT: impossible branch"
))

# 956 "Vuna/Compiler/Ir/Cps.vuna"
let v_Vuna_dCompiler_dIr_dCps_dcpsDefs = (fun defs -> ((v_Vuna_dCompiler_dIr_dCps_dtransformDefs v_Vuna_dCompiler_dIr_dCps_dstartFuel) defs))

# 938 "Vuna/Compiler/Ir/Cps.vuna"
let v_Vuna_dCompiler_dIr_dCps_dcpsDefsMachine = (fun defs -> (match (v_Vuna_dCompiler_dIr_dCps_dcpsDefs defs) with
  | Base_dResult.C_Base_dResult_dResult_Err (dtb__527) -> (Base_dResult.C_Base_dResult_dResult_Err (dtb__527))
  | Base_dResult.C_Base_dResult_dResult_Ok (dtb__528) -> (Base_dResult.C_Base_dResult_dResult_Ok ((((v_Vuna_dCompiler_dIr_dCps_dmDefs ((v_Vuna_dCompiler_dIr_dCps_dcollectHandleOpsDefs 100000) dtb__528)) v_Vuna_dCompiler_dIr_dCps_dstartFuel) dtb__528)))
  | _ -> failwith "DT: impossible branch"
))

# 943 "Vuna/Compiler/Ir/Cps.vuna"
let v_Vuna_dCompiler_dIr_dCps_dcpsDefsStep = (fun defs -> (match (v_Vuna_dCompiler_dIr_dCps_dcpsDefs defs) with
  | Base_dResult.C_Base_dResult_dResult_Err (dtb__529) -> (Base_dResult.C_Base_dResult_dResult_Err (dtb__529))
  | Base_dResult.C_Base_dResult_dResult_Ok (dtb__530) -> ((v_Vuna_dCompiler_dIr_dCps_dselDefs v_Vuna_dCompiler_dIr_dCps_dstartFuel) dtb__530)
  | _ -> failwith "DT: impossible branch"
))
