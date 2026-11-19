open Vuna_runtime
type t_HandlerTables = { f_HandlerTables_htArities : (string, int) B_dData_dPair.t_Pair B_dData_dList.t_List; f_HandlerTables_htSigs : (string, Vuna_dIr_dModel.t_IrTy B_dData_dMaybe.t_Maybe) B_dData_dPair.t_Pair B_dData_dList.t_List }

# 34 "Vuna/Ir/Cps.vuna"
let v_irCpsPerformName = "@ir@cps@perform"

# 37 "Vuna/Ir/Cps.vuna"
let v_irCpsHandleName = "@ir@cps@handle"

# 40 "Vuna/Ir/Cps.vuna"
let v_irCpsSelfName = "@ir@cps@self"

# 43 "Vuna/Ir/Cps.vuna"
let v_irMPerformName = "@ir@m@perform"

# 46 "Vuna/Ir/Cps.vuna"
let v_irMHandleName = "@ir@m@handle"

# 49 "Vuna/Ir/Cps.vuna"
let v_irMSelfName = "@ir@m@self"

# 54 "Vuna/Ir/Cps.vuna"
let v_irMApplyName = "@ir@m@apply"

# 57 "Vuna/Ir/Cps.vuna"
let v_irMRunEffName = "@ir@m@runEff"

# 60 "Vuna/Ir/Cps.vuna"
let v_irMRunName = "@ir@m@run"

# 63 "Vuna/Ir/Cps.vuna"
let v_irMDoneName = "@ir@m@done"

# 67 "Vuna/Ir/Cps.vuna"
let v_irScopedTypeName = "Base.Effect.Core.Scoped"

# 70 "Vuna/Ir/Cps.vuna"
let v_irScopedMkCtor = "Base.Effect.Core.Scoped.MkScoped"

# 74 "Vuna/Ir/Cps.vuna"
let v_runThunkName = "Base.Effect.Core.runThunk"

# 77 "Vuna/Ir/Cps.vuna"
let v_runPureName = "Base.Effect.Core.runPure"

# 80 "Vuna/Ir/Cps.vuna"
let v_runEffName = "Base.Effect.Core.runEff"

# 83 "Vuna/Ir/Cps.vuna"
let v_runMainName = "Base.Effect.Core.runMain"

# 86 "Vuna/Ir/Cps.vuna"
let v_handleScopedName = "Base.Effect.Core.handleScoped"

# 91 "Vuna/Ir/Cps.vuna"
let v_cpsFuelBase = 64

# 94 "Vuna/Ir/Cps.vuna"
let v_cpsFuelOfBody = (fun (body : Vuna_dIr_dModel.t_Ir) -> (v_cpsFuelBase + (8 * (Vuna_dIr_dModel.v_irSize body))))

# 97 "Vuna/Ir/Cps.vuna"
let rec v_cpsDefsSize = (fun (mc0 : Vuna_dIr_dModel.t_IrDef B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__0, dtb__1) -> (match (Vuna_dIr_dModel.v_irDefBody dtb__0) with
  | B_dData_dMaybe.C_Maybe_Nothing -> (1 + (v_cpsDefsSize dtb__1))
  | B_dData_dMaybe.C_Maybe_Just (dtb__2) -> ((1 + (Vuna_dIr_dModel.v_irSize dtb__2)) + (v_cpsDefsSize dtb__1))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))

# 104 "Vuna/Ir/Cps.vuna"
let v_cpsFuelOfDefs = (fun (defs : Vuna_dIr_dModel.t_IrDef B_dData_dList.t_List) -> (v_cpsFuelBase + (8 * (v_cpsDefsSize defs))))

# 110 "Vuna/Ir/Cps.vuna"
let v_bNameEq = (fun (mc0 : Vuna_dIr_dModel.t_IrBName) (mc1 : Vuna_dIr_dModel.t_IrBName) -> (match mc0 with
  | Vuna_dIr_dModel.C_IrBName_IrBWild -> (match mc1 with
  | Vuna_dIr_dModel.C_IrBName_IrBWild -> true
  | _ -> false
)
  | Vuna_dIr_dModel.C_IrBName_IrBNat (dtb__3) -> (match mc1 with
  | Vuna_dIr_dModel.C_IrBName_IrBNat (dtb__4) -> (dtb__3 = dtb__4)
  | _ -> false
)
  | Vuna_dIr_dModel.C_IrBName_IrBArm (dtb__5) -> (match mc1 with
  | Vuna_dIr_dModel.C_IrBName_IrBArm (dtb__6) -> (dtb__5 = dtb__6)
  | _ -> false
)
  | Vuna_dIr_dModel.C_IrBName_IrBUser (dtb__7) -> (match mc1 with
  | Vuna_dIr_dModel.C_IrBName_IrBUser (dtb__8) -> (dtb__7 = dtb__8)
  | _ -> false
)
  | _ -> failwith "DT: impossible branch"
))

# 117 "Vuna/Ir/Cps.vuna"
let v_binderEq = (fun (mc0 : Vuna_dIr_dModel.t_IrBinder) (mc1 : Vuna_dIr_dModel.t_IrBinder) -> (match mc0 with
  | { Vuna_dIr_dModel.f_IrBinder_irBinderName = dtb__9; Vuna_dIr_dModel.f_IrBinder_irBinderErased = dtb__10; Vuna_dIr_dModel.f_IrBinder_irBinderTy = dtb__11 } -> (match mc1 with
  | { Vuna_dIr_dModel.f_IrBinder_irBinderName = dtb__12; Vuna_dIr_dModel.f_IrBinder_irBinderErased = dtb__13; Vuna_dIr_dModel.f_IrBinder_irBinderTy = dtb__14 } -> (if ((v_bNameEq dtb__9) dtb__12) then (((B_dTrait_dEq.v__x61__x61_ B_dTrait_dEq.v_Eq_uBase_uData_uBool_uBool) dtb__10) dtb__13) else false)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 120 "Vuna/Ir/Cps.vuna"
let rec v_memBinder = (fun (mc0 : Vuna_dIr_dModel.t_IrBinder) (mc1 : Vuna_dIr_dModel.t_IrBinder B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__15, dtb__16) -> (if ((v_binderEq mc0) dtb__15) then true else ((v_memBinder mc0) dtb__16))
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 124 "Vuna/Ir/Cps.vuna"
let v_binderErased = (fun (mc0 : Vuna_dIr_dModel.t_IrBinder) -> (match mc0 with
  | { Vuna_dIr_dModel.f_IrBinder_irBinderName = dtb__17; Vuna_dIr_dModel.f_IrBinder_irBinderErased = dtb__18; Vuna_dIr_dModel.f_IrBinder_irBinderTy = dtb__19 } -> dtb__18
  | _ -> failwith "DT: impossible branch"
))

# 128 "Vuna/Ir/Cps.vuna"
let v_runtimeBinders = (fun (bs : Vuna_dIr_dModel.t_IrBinder B_dData_dList.t_List) -> ((B_dData_dList.v_filter (fun (b : Vuna_dIr_dModel.t_IrBinder) -> (B_dData_dBool.v_not (v_binderErased b)))) bs))

# 131 "Vuna/Ir/Cps.vuna"
let v_mkBinder = (fun (name : string) -> (Vuna_dIr_dModel.v_mkIrBinder name))

# 136 "Vuna/Ir/Cps.vuna"
let v_freshV = (fun (fuel : int) -> (v_mkBinder ("__cpsV" ^ (bi_strFromInt fuel))))

# 139 "Vuna/Ir/Cps.vuna"
let v_freshK = (fun (fuel : int) -> (v_mkBinder ("__cpsK" ^ (bi_strFromInt fuel))))

# 142 "Vuna/Ir/Cps.vuna"
let v_freshU = (fun (fuel : int) -> (v_mkBinder ("__cpsU" ^ (bi_strFromInt fuel))))

# 145 "Vuna/Ir/Cps.vuna"
let v_freshA = (fun (fuel : int) (i : int) -> (v_mkBinder (String.concat "" ["__cpsA"; (bi_strFromInt fuel); "_"; (bi_strFromInt i)])))

# 148 "Vuna/Ir/Cps.vuna"
let rec v_applyAll = (fun (mc0 : Vuna_dIr_dModel.t_Ir) (mc1 : Vuna_dIr_dModel.t_Ir B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__20, dtb__21) -> ((v_applyAll (Vuna_dIr_dModel.C_Ir_IrApp (B_dData_dMaybe.C_Maybe_Nothing, mc0, dtb__20))) dtb__21)
  | B_dData_dList.C_List_Nil -> mc0
  | _ -> failwith "DT: impossible branch"
))

# 152 "Vuna/Ir/Cps.vuna"
let rec v_flattenApp = (fun (mc0 : Vuna_dIr_dModel.t_Ir) -> (match mc0 with
  | Vuna_dIr_dModel.C_Ir_IrApp (dtb__22, dtb__23, dtb__24) -> ((fun p -> { B_dData_dPair.f_Pair_first = (B_dData_dPair.v_firstOf p); B_dData_dPair.f_Pair_second = ((B_dData_dList.v_append (B_dData_dPair.v_secondOf p)) (B_dData_dList.C_List__x58__x58_ (dtb__24, B_dData_dList.C_List_Nil))) }) (v_flattenApp dtb__23))
  | _ -> { B_dData_dPair.f_Pair_first = mc0; B_dData_dPair.f_Pair_second = B_dData_dList.C_List_Nil }
))

# 197 "Vuna/Ir/Cps.vuna"
let v_isThunkCtor = (fun (family : string) (ctor : string) -> (if (if (family = Vuna_dIr_dModel.v_irEffTypeName) then (ctor = Vuna_dIr_dModel.v_irEffMkCtor) else false) then true else (if (family = v_irScopedTypeName) then (ctor = v_irScopedMkCtor) else false)))

# 202 "Vuna/Ir/Cps.vuna"
let v_isThunkAlt = (fun (alt : Vuna_dIr_dModel.t_IrAlt) -> ((fun nd_uscrut1 -> (match nd_uscrut1 with
  | B_dData_dMaybe.C_Maybe_Nothing -> false
  | B_dData_dMaybe.C_Maybe_Just (dtb__25) -> (match dtb__25 with
  | { B_dData_dPair.f_Pair_first = dtb__26; B_dData_dPair.f_Pair_second = dtb__27 } -> ((v_isThunkCtor dtb__26) dtb__27)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) (alt).Vuna_dIr_dModel.f_IrAlt_irAltCtor))

# 209 "Vuna/Ir/Cps.vuna"
let v_thunkBindersOfAlt = (fun (alt : Vuna_dIr_dModel.t_IrAlt) -> (if (v_isThunkAlt alt) then (v_runtimeBinders (alt).Vuna_dIr_dModel.f_IrAlt_irAltBinders) else B_dData_dList.C_List_Nil))

# 160 "Vuna/Ir/Cps.vuna"
let rec v_mapDirect = (fun (fuel : int) (xs : Vuna_dIr_dModel.t_Ir B_dData_dList.t_List) -> (if (fuel <= 0) then xs else (match xs with
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | B_dData_dList.C_List__x58__x58_ (dtb__28, dtb__29) -> (B_dData_dList.C_List__x58__x58_ (((v_transformDirect (fuel - 1)) dtb__28), ((v_mapDirect (fuel - 1)) dtb__29)))
  | _ -> failwith "DT: impossible branch"
)))
# 169 "Vuna/Ir/Cps.vuna"
and v_mapAltDirect = (fun (fuel : int) (xs : Vuna_dIr_dModel.t_IrAlt B_dData_dList.t_List) -> (if (fuel <= 0) then xs else (match xs with
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | B_dData_dList.C_List__x58__x58_ (dtb__30, dtb__31) -> (B_dData_dList.C_List__x58__x58_ (((v_transformAltDirect (fuel - 1)) dtb__30), ((v_mapAltDirect (fuel - 1)) dtb__31)))
  | _ -> failwith "DT: impossible branch"
)))
# 178 "Vuna/Ir/Cps.vuna"
and v_mapAltCps = (fun (fuel : int) (env : Vuna_dIr_dModel.t_IrBinder B_dData_dList.t_List) (xs : Vuna_dIr_dModel.t_IrAlt B_dData_dList.t_List) (k : Vuna_dIr_dModel.t_Ir) -> (if (fuel <= 0) then xs else (match xs with
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | B_dData_dList.C_List__x58__x58_ (dtb__32, dtb__33) -> (B_dData_dList.C_List__x58__x58_ (((((v_cpsAlt (fuel - 1)) env) dtb__32) k), ((((v_mapAltCps (fuel - 1)) env) dtb__33) k)))
  | _ -> failwith "DT: impossible branch"
)))
# 187 "Vuna/Ir/Cps.vuna"
and v_mapFieldsDirect = (fun (fuel : int) (xs : (string, Vuna_dIr_dModel.t_Ir) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (if (fuel <= 0) then xs else (match xs with
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | B_dData_dList.C_List__x58__x58_ (dtb__34, dtb__35) -> (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = (B_dData_dPair.v_firstOf dtb__34); B_dData_dPair.f_Pair_second = ((v_transformDirect (fuel - 1)) (B_dData_dPair.v_secondOf dtb__34)) }, ((v_mapFieldsDirect (fuel - 1)) dtb__35)))
  | _ -> failwith "DT: impossible branch"
)))
# 224 "Vuna/Ir/Cps.vuna"
and v_cpsExpr = (fun (fuel : int) (env : Vuna_dIr_dModel.t_IrBinder B_dData_dList.t_List) (e : Vuna_dIr_dModel.t_Ir) (k : Vuna_dIr_dModel.t_Ir) -> (if (fuel <= 0) then (Vuna_dIr_dModel.C_Ir_IrApp (B_dData_dMaybe.C_Maybe_Nothing, k, ((v_transformDirect (fuel - 1)) e))) else (match e with
  | Vuna_dIr_dModel.C_Ir_IrApp (dtb__36, dtb__37, dtb__38) -> ((((v_cpsApp (fuel - 1)) env) e) k)
  | Vuna_dIr_dModel.C_Ir_IrCase (dtb__39, dtb__40, dtb__41, dtb__42) -> ((fun v -> ((fun kCase -> ((((v_cpsExpr (fuel - 1)) env) dtb__41) kCase)) (Vuna_dIr_dModel.C_Ir_IrLam ((B_dData_dList.C_List__x58__x58_ (v, B_dData_dList.C_List_Nil)), B_dData_dMaybe.C_Maybe_Nothing, (Vuna_dIr_dModel.C_Ir_IrCase (dtb__39, B_dData_dMaybe.C_Maybe_Nothing, (Vuna_dIr_dModel.C_Ir_IrVar (v)), ((((v_mapAltCps (fuel - 1)) env) dtb__42) k))))))) (v_freshV fuel))
  | Vuna_dIr_dModel.C_Ir_IrNatCase (dtb__43, dtb__44, dtb__45, dtb__46, dtb__47) -> ((fun v -> ((fun kCase -> ((((v_cpsExpr (fuel - 1)) env) dtb__43) kCase)) (Vuna_dIr_dModel.C_Ir_IrLam ((B_dData_dList.C_List__x58__x58_ (v, B_dData_dList.C_List_Nil)), B_dData_dMaybe.C_Maybe_Nothing, (Vuna_dIr_dModel.C_Ir_IrNatCase ((Vuna_dIr_dModel.C_Ir_IrVar (v)), dtb__44, ((((v_cpsAltMaybe (fuel - 1)) env) dtb__45) k), ((((v_cpsAltMaybe (fuel - 1)) env) dtb__46) k), ((((v_cpsAltMaybe (fuel - 1)) env) dtb__47) k))))))) (v_freshV fuel))
  | Vuna_dIr_dModel.C_Ir_IrIf (dtb__48, dtb__49, dtb__50) -> ((fun v -> ((fun kIf -> ((((v_cpsExpr (fuel - 1)) env) dtb__48) kIf)) (Vuna_dIr_dModel.C_Ir_IrLam ((B_dData_dList.C_List__x58__x58_ (v, B_dData_dList.C_List_Nil)), B_dData_dMaybe.C_Maybe_Nothing, (Vuna_dIr_dModel.C_Ir_IrIf ((Vuna_dIr_dModel.C_Ir_IrVar (v)), ((((v_cpsExpr (fuel - 1)) env) dtb__49) k), ((((v_cpsExpr (fuel - 1)) env) dtb__50) k))))))) (v_freshV fuel))
  | Vuna_dIr_dModel.C_Ir_IrLet (dtb__51, dtb__52, dtb__53) -> ((fun v -> ((fun kLet -> ((((v_cpsExpr (fuel - 1)) env) dtb__52) kLet)) (Vuna_dIr_dModel.C_Ir_IrLam ((B_dData_dList.C_List__x58__x58_ (v, B_dData_dList.C_List_Nil)), B_dData_dMaybe.C_Maybe_Nothing, (Vuna_dIr_dModel.C_Ir_IrLet (dtb__51, (Vuna_dIr_dModel.C_Ir_IrVar (v)), ((((v_cpsExpr (fuel - 1)) env) dtb__53) k))))))) (v_freshV fuel))
  | Vuna_dIr_dModel.C_Ir_IrCast (dtb__54, dtb__55, dtb__56) -> (Vuna_dIr_dModel.C_Ir_IrCast (dtb__54, dtb__55, ((((v_cpsExpr (fuel - 1)) env) dtb__56) k)))
  | _ -> (Vuna_dIr_dModel.C_Ir_IrApp (B_dData_dMaybe.C_Maybe_Nothing, k, ((v_transformDirect (fuel - 1)) e)))
)))
# 254 "Vuna/Ir/Cps.vuna"
and v_cpsAlt = (fun (fuel : int) (env : Vuna_dIr_dModel.t_IrBinder B_dData_dList.t_List) (alt : Vuna_dIr_dModel.t_IrAlt) (k : Vuna_dIr_dModel.t_Ir) -> (if (fuel <= 0) then alt else ((fun env1 -> { Vuna_dIr_dModel.f_IrAlt_irAltCtor = (alt).Vuna_dIr_dModel.f_IrAlt_irAltCtor; Vuna_dIr_dModel.f_IrAlt_irAltBinders = (alt).Vuna_dIr_dModel.f_IrAlt_irAltBinders; Vuna_dIr_dModel.f_IrAlt_irAltBody = ((((v_cpsExpr (fuel - 1)) env1) (alt).Vuna_dIr_dModel.f_IrAlt_irAltBody) k) }) ((B_dData_dList.v_append (v_thunkBindersOfAlt alt)) env))))
# 263 "Vuna/Ir/Cps.vuna"
and v_cpsAltMaybe = (fun (fuel : int) (env : Vuna_dIr_dModel.t_IrBinder B_dData_dList.t_List) (m : Vuna_dIr_dModel.t_IrAlt B_dData_dMaybe.t_Maybe) (k : Vuna_dIr_dModel.t_Ir) -> (if (fuel <= 0) then m else (match m with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb__57) -> (B_dData_dMaybe.C_Maybe_Just (((((v_cpsAlt (fuel - 1)) env) dtb__57) k)))
  | _ -> failwith "DT: impossible branch"
)))
# 273 "Vuna/Ir/Cps.vuna"
and v_cpsArgs = (fun (fuel : int) (env : Vuna_dIr_dModel.t_IrBinder B_dData_dList.t_List) (args : Vuna_dIr_dModel.t_Ir B_dData_dList.t_List) (head : Vuna_dIr_dModel.t_Ir) (acc : Vuna_dIr_dModel.t_Ir B_dData_dList.t_List) (k : Vuna_dIr_dModel.t_Ir) -> (if (fuel <= 0) then (Vuna_dIr_dModel.C_Ir_IrApp (B_dData_dMaybe.C_Maybe_Nothing, k, ((v_applyAll head) (B_dData_dList.v_reverse acc)))) else (match args with
  | B_dData_dList.C_List_Nil -> (Vuna_dIr_dModel.C_Ir_IrApp (B_dData_dMaybe.C_Maybe_Nothing, k, ((v_applyAll head) (B_dData_dList.v_reverse acc))))
  | B_dData_dList.C_List__x58__x58_ (dtb__58, dtb__59) -> ((fun v -> ((((v_cpsExpr (fuel - 1)) env) dtb__58) (Vuna_dIr_dModel.C_Ir_IrLam ((B_dData_dList.C_List__x58__x58_ (v, B_dData_dList.C_List_Nil)), B_dData_dMaybe.C_Maybe_Nothing, ((((((v_cpsArgs (fuel - 1)) env) dtb__59) head) (B_dData_dList.C_List__x58__x58_ ((Vuna_dIr_dModel.C_Ir_IrVar (v)), acc))) k))))) (v_freshV fuel))
  | _ -> failwith "DT: impossible branch"
)))
# 286 "Vuna/Ir/Cps.vuna"
and v_cpsThunkCall = (fun (fuel : int) (head : Vuna_dIr_dModel.t_Ir) (args : Vuna_dIr_dModel.t_Ir B_dData_dList.t_List) (k : Vuna_dIr_dModel.t_Ir) -> (if (fuel <= 0) then ((v_applyAll head) ((B_dData_dList.v_append args) (B_dData_dList.C_List__x58__x58_ (k, B_dData_dList.C_List_Nil)))) else ((v_applyAll ((v_transformDirect (fuel - 1)) head)) ((B_dData_dList.v_append ((v_mapDirect (fuel - 1)) args)) (B_dData_dList.C_List__x58__x58_ (k, B_dData_dList.C_List_Nil))))))
# 294 "Vuna/Ir/Cps.vuna"
and v_cpsApp = (fun (fuel : int) (env : Vuna_dIr_dModel.t_IrBinder B_dData_dList.t_List) (e : Vuna_dIr_dModel.t_Ir) (k : Vuna_dIr_dModel.t_Ir) -> (if (fuel <= 0) then (Vuna_dIr_dModel.C_Ir_IrApp (B_dData_dMaybe.C_Maybe_Nothing, k, e)) else ((fun p -> ((fun head -> ((fun args -> ((fun v -> (match head with
  | Vuna_dIr_dModel.C_Ir_IrVar (dtb__60) -> (if ((v_memBinder dtb__60) env) then ((((v_cpsThunkCall (fuel - 1)) head) args) k) else ((((v_cpsExpr (fuel - 1)) env) head) (Vuna_dIr_dModel.C_Ir_IrLam ((B_dData_dList.C_List__x58__x58_ (v, B_dData_dList.C_List_Nil)), B_dData_dMaybe.C_Maybe_Nothing, ((((((v_cpsArgs (fuel - 1)) env) args) (Vuna_dIr_dModel.C_Ir_IrVar (v))) B_dData_dList.C_List_Nil) k)))))
  | Vuna_dIr_dModel.C_Ir_IrGlobal (dtb__61) -> (if (dtb__61 = v_runThunkName) then ((((v_cpsThunkCall (fuel - 1)) head) args) k) else ((((v_cpsExpr (fuel - 1)) env) head) (Vuna_dIr_dModel.C_Ir_IrLam ((B_dData_dList.C_List__x58__x58_ (v, B_dData_dList.C_List_Nil)), B_dData_dMaybe.C_Maybe_Nothing, ((((((v_cpsArgs (fuel - 1)) env) args) (Vuna_dIr_dModel.C_Ir_IrVar (v))) B_dData_dList.C_List_Nil) k)))))
  | Vuna_dIr_dModel.C_Ir_IrRt (dtb__62) -> (if (dtb__62 = "prim_effectPerformId") then ((((v_cpsThunkCall (fuel - 1)) (Vuna_dIr_dModel.C_Ir_IrRt (v_irCpsPerformName))) args) k) else (if (dtb__62 = "prim_effectHandleId") then ((((v_cpsThunkCall (fuel - 1)) (Vuna_dIr_dModel.C_Ir_IrRt (v_irCpsHandleName))) args) k) else (if (dtb__62 = "prim_effectSelf") then ((((v_cpsThunkCall (fuel - 1)) (Vuna_dIr_dModel.C_Ir_IrRt (v_irCpsSelfName))) args) k) else ((((v_cpsExpr (fuel - 1)) env) head) (Vuna_dIr_dModel.C_Ir_IrLam ((B_dData_dList.C_List__x58__x58_ (v, B_dData_dList.C_List_Nil)), B_dData_dMaybe.C_Maybe_Nothing, ((((((v_cpsArgs (fuel - 1)) env) args) (Vuna_dIr_dModel.C_Ir_IrVar (v))) B_dData_dList.C_List_Nil) k)))))))
  | _ -> ((((v_cpsExpr (fuel - 1)) env) head) (Vuna_dIr_dModel.C_Ir_IrLam ((B_dData_dList.C_List__x58__x58_ (v, B_dData_dList.C_List_Nil)), B_dData_dMaybe.C_Maybe_Nothing, ((((((v_cpsArgs (fuel - 1)) env) args) (Vuna_dIr_dModel.C_Ir_IrVar (v))) B_dData_dList.C_List_Nil) k))))
)) (v_freshV fuel))) (B_dData_dPair.v_secondOf p))) (B_dData_dPair.v_firstOf p))) (v_flattenApp e))))
# 318 "Vuna/Ir/Cps.vuna"
and v_transformDirect = (fun (fuel : int) (e : Vuna_dIr_dModel.t_Ir) -> (if (fuel <= 0) then e else (match e with
  | Vuna_dIr_dModel.C_Ir_IrCtor (dtb__63, dtb__64, dtb__65, dtb__66) -> (if ((v_isThunkCtor dtb__63) dtb__64) then ((fun nd_uscrut6 -> (match nd_uscrut6 with
  | B_dData_dList.C_List__x58__x58_ (dtb__67, dtb__68) -> (match dtb__67 with
  | Vuna_dIr_dModel.C_Ir_IrLam (dtb__69, dtb__70, dtb__71) -> (match dtb__68 with
  | B_dData_dList.C_List_Nil -> ((fun k -> ((fun body1 -> (Vuna_dIr_dModel.C_Ir_IrCtor (dtb__63, dtb__64, dtb__65, (B_dData_dList.C_List__x58__x58_ ((Vuna_dIr_dModel.C_Ir_IrLam (((B_dData_dList.v_append dtb__69) (B_dData_dList.C_List__x58__x58_ (k, B_dData_dList.C_List_Nil))), B_dData_dMaybe.C_Maybe_Nothing, body1)), B_dData_dList.C_List_Nil))))) ((((v_cpsExpr (fuel - 1)) B_dData_dList.C_List_Nil) dtb__71) (Vuna_dIr_dModel.C_Ir_IrVar (k))))) (v_freshK fuel))
  | _ -> (Vuna_dIr_dModel.C_Ir_IrCtor (dtb__63, dtb__64, dtb__65, ((v_mapDirect (fuel - 1)) dtb__66)))
)
  | _ -> (Vuna_dIr_dModel.C_Ir_IrCtor (dtb__63, dtb__64, dtb__65, ((v_mapDirect (fuel - 1)) dtb__66)))
)
  | _ -> (Vuna_dIr_dModel.C_Ir_IrCtor (dtb__63, dtb__64, dtb__65, ((v_mapDirect (fuel - 1)) dtb__66)))
)) dtb__66) else (Vuna_dIr_dModel.C_Ir_IrCtor (dtb__63, dtb__64, dtb__65, ((v_mapDirect (fuel - 1)) dtb__66))))
  | Vuna_dIr_dModel.C_Ir_IrEffThunk (dtb__72, dtb__73, dtb__74, dtb__75, dtb__76) -> ((fun u -> ((fun k -> ((fun argBs -> ((fun applied -> ((fun inner -> (if (dtb__75 <= 0) then inner else (Vuna_dIr_dModel.C_Ir_IrLam (argBs, B_dData_dMaybe.C_Maybe_Nothing, inner)))) (Vuna_dIr_dModel.C_Ir_IrCtor (dtb__72, dtb__73, B_dData_dMaybe.C_Maybe_Nothing, (B_dData_dList.C_List__x58__x58_ ((Vuna_dIr_dModel.C_Ir_IrLam ((B_dData_dList.C_List__x58__x58_ (u, (B_dData_dList.C_List__x58__x58_ (k, B_dData_dList.C_List_Nil)))), B_dData_dMaybe.C_Maybe_Nothing, (Vuna_dIr_dModel.C_Ir_IrApp (B_dData_dMaybe.C_Maybe_Nothing, (Vuna_dIr_dModel.C_Ir_IrVar (k)), applied)))), B_dData_dList.C_List_Nil)))))) ((v_applyAll ((v_transformDirect (fuel - 1)) dtb__76)) ((B_dData_dList.v_map (fun _heta0 -> (Vuna_dIr_dModel.C_Ir_IrVar (_heta0)))) argBs)))) ((B_dData_dList.v_map (fun (i : int) -> ((v_freshA fuel) i))) ((B_dData_dList.v_range 0) dtb__75)))) (v_freshK fuel))) (v_freshU fuel))
  | Vuna_dIr_dModel.C_Ir_IrRecord (dtb__77, dtb__78, dtb__79) -> (Vuna_dIr_dModel.C_Ir_IrRecord (dtb__77, dtb__78, ((v_mapFieldsDirect (fuel - 1)) dtb__79)))
  | Vuna_dIr_dModel.C_Ir_IrProj (dtb__80, dtb__81, dtb__82, dtb__83) -> (Vuna_dIr_dModel.C_Ir_IrProj (((v_transformDirect (fuel - 1)) dtb__80), dtb__81, dtb__82, dtb__83))
  | Vuna_dIr_dModel.C_Ir_IrRecUpd (dtb__84, dtb__85, dtb__86, dtb__87) -> (Vuna_dIr_dModel.C_Ir_IrRecUpd (((v_transformDirect (fuel - 1)) dtb__84), dtb__85, ((v_mapFieldsDirect (fuel - 1)) dtb__86), dtb__87))
  | Vuna_dIr_dModel.C_Ir_IrRtApp (dtb__88, dtb__89) -> (Vuna_dIr_dModel.C_Ir_IrRtApp (dtb__88, ((v_mapDirect (fuel - 1)) dtb__89)))
  | Vuna_dIr_dModel.C_Ir_IrCast (dtb__90, dtb__91, dtb__92) -> (Vuna_dIr_dModel.C_Ir_IrCast (dtb__90, dtb__91, ((v_transformDirect (fuel - 1)) dtb__92)))
  | Vuna_dIr_dModel.C_Ir_IrLet (dtb__93, dtb__94, dtb__95) -> (Vuna_dIr_dModel.C_Ir_IrLet (dtb__93, ((v_transformDirect (fuel - 1)) dtb__94), ((v_transformDirect (fuel - 1)) dtb__95)))
  | Vuna_dIr_dModel.C_Ir_IrLam (dtb__96, dtb__97, dtb__98) -> (Vuna_dIr_dModel.C_Ir_IrLam (dtb__96, dtb__97, ((v_transformDirect (fuel - 1)) dtb__98)))
  | Vuna_dIr_dModel.C_Ir_IrApp (dtb__99, dtb__100, dtb__101) -> (Vuna_dIr_dModel.C_Ir_IrApp (dtb__99, ((v_transformDirect (fuel - 1)) dtb__100), ((v_transformDirect (fuel - 1)) dtb__101)))
  | Vuna_dIr_dModel.C_Ir_IrTail (dtb__102) -> (Vuna_dIr_dModel.C_Ir_IrTail (((v_transformDirect (fuel - 1)) dtb__102)))
  | Vuna_dIr_dModel.C_Ir_IrIf (dtb__103, dtb__104, dtb__105) -> (Vuna_dIr_dModel.C_Ir_IrIf (((v_transformDirect (fuel - 1)) dtb__103), ((v_transformDirect (fuel - 1)) dtb__104), ((v_transformDirect (fuel - 1)) dtb__105)))
  | Vuna_dIr_dModel.C_Ir_IrCase (dtb__106, dtb__107, dtb__108, dtb__109) -> (Vuna_dIr_dModel.C_Ir_IrCase (dtb__106, dtb__107, ((v_transformDirect (fuel - 1)) dtb__108), ((v_mapAltDirect (fuel - 1)) dtb__109)))
  | Vuna_dIr_dModel.C_Ir_IrNatCase (dtb__110, dtb__111, dtb__112, dtb__113, dtb__114) -> (Vuna_dIr_dModel.C_Ir_IrNatCase (((v_transformDirect (fuel - 1)) dtb__110), dtb__111, ((v_transformAltMaybe (fuel - 1)) dtb__112), ((v_transformAltMaybe (fuel - 1)) dtb__113), ((v_transformAltMaybe (fuel - 1)) dtb__114)))
  | Vuna_dIr_dModel.C_Ir_IrConcatMany (dtb__115) -> (Vuna_dIr_dModel.C_Ir_IrConcatMany (((v_mapDirect (fuel - 1)) dtb__115)))
  | Vuna_dIr_dModel.C_Ir_IrVar (dtb__116) -> e
  | Vuna_dIr_dModel.C_Ir_IrGlobal (dtb__117) -> e
  | Vuna_dIr_dModel.C_Ir_IrRt (dtb__118) -> e
  | Vuna_dIr_dModel.C_Ir_IrInt (dtb__119) -> e
  | Vuna_dIr_dModel.C_Ir_IrStr (dtb__120) -> e
  | Vuna_dIr_dModel.C_Ir_IrBool (dtb__121) -> e
  | Vuna_dIr_dModel.C_Ir_IrFloatLit (dtb__122) -> e
  | Vuna_dIr_dModel.C_Ir_IrEffBind (dtb__123, dtb__124, dtb__125) -> e
  | _ -> failwith "DT: impossible branch"
)))
# 365 "Vuna/Ir/Cps.vuna"
and v_transformAltDirect = (fun (fuel : int) (alt : Vuna_dIr_dModel.t_IrAlt) -> (if (fuel <= 0) then alt else { Vuna_dIr_dModel.f_IrAlt_irAltCtor = (alt).Vuna_dIr_dModel.f_IrAlt_irAltCtor; Vuna_dIr_dModel.f_IrAlt_irAltBinders = (alt).Vuna_dIr_dModel.f_IrAlt_irAltBinders; Vuna_dIr_dModel.f_IrAlt_irAltBody = ((v_transformDirect (fuel - 1)) (alt).Vuna_dIr_dModel.f_IrAlt_irAltBody) }))
# 372 "Vuna/Ir/Cps.vuna"
and v_transformAltMaybe = (fun (fuel : int) (m : Vuna_dIr_dModel.t_IrAlt B_dData_dMaybe.t_Maybe) -> (if (fuel <= 0) then m else (match m with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb__126) -> (B_dData_dMaybe.C_Maybe_Just (((v_transformAltDirect (fuel - 1)) dtb__126)))
  | _ -> failwith "DT: impossible branch"
)))

# 213 "Vuna/Ir/Cps.vuna"
let v_identityCont = ((fun v -> (Vuna_dIr_dModel.C_Ir_IrLam ((B_dData_dList.C_List__x58__x58_ (v, B_dData_dList.C_List_Nil)), B_dData_dMaybe.C_Maybe_Nothing, (Vuna_dIr_dModel.C_Ir_IrVar (v))))) (v_mkBinder "__cpsId"))

# 386 "Vuna/Ir/Cps.vuna"
let rec v_trampolineBody = (fun (mc0 : string) (mc1 : Vuna_dIr_dModel.t_Ir) -> (match mc1 with
  | Vuna_dIr_dModel.C_Ir_IrApp (dtb__127, dtb__128, dtb__129) -> (match dtb__128 with
  | Vuna_dIr_dModel.C_Ir_IrApp (dtb__130, dtb__131, dtb__132) -> (match dtb__131 with
  | Vuna_dIr_dModel.C_Ir_IrGlobal (dtb__133) -> (if (dtb__133 = v_runThunkName) then (B_dData_dResult.C_Result_Ok (((v_applyAll (Vuna_dIr_dModel.C_Ir_IrGlobal (dtb__133))) (B_dData_dList.C_List__x58__x58_ (dtb__132, (B_dData_dList.C_List__x58__x58_ (dtb__129, (B_dData_dList.C_List__x58__x58_ (v_identityCont, B_dData_dList.C_List_Nil))))))))) else (B_dData_dResult.C_Result_Err (("CPS: unexpected trampoline shape: " ^ mc0))))
  | _ -> (B_dData_dResult.C_Result_Err (("CPS: unexpected trampoline shape: " ^ mc0)))
)
  | _ -> (B_dData_dResult.C_Result_Err (("CPS: unexpected trampoline shape: " ^ mc0)))
)
  | Vuna_dIr_dModel.C_Ir_IrCast (dtb__134, dtb__135, dtb__136) -> (match ((v_trampolineBody mc0) dtb__136) with
  | B_dData_dResult.C_Result_Err (dtb__137) -> (B_dData_dResult.C_Result_Err (dtb__137))
  | B_dData_dResult.C_Result_Ok (dtb__138) -> (B_dData_dResult.C_Result_Ok ((Vuna_dIr_dModel.C_Ir_IrCast (dtb__134, dtb__135, dtb__138))))
  | _ -> failwith "DT: impossible branch"
)
  | Vuna_dIr_dModel.C_Ir_IrLam (dtb__139, dtb__140, dtb__141) -> (match ((v_trampolineBody mc0) dtb__141) with
  | B_dData_dResult.C_Result_Err (dtb__142) -> (B_dData_dResult.C_Result_Err (dtb__142))
  | B_dData_dResult.C_Result_Ok (dtb__143) -> (B_dData_dResult.C_Result_Ok ((Vuna_dIr_dModel.C_Ir_IrLam (dtb__139, dtb__140, dtb__143))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> (B_dData_dResult.C_Result_Err (("CPS: unexpected trampoline shape: " ^ mc0)))
))

# 403 "Vuna/Ir/Cps.vuna"
let rec v_selfAlt = (fun (fuel : int) (alt : Vuna_dIr_dModel.t_IrAlt) (name : string) -> (if (fuel <= 0) then (B_dData_dResult.C_Result_Ok (alt)) else (match (((v_selfBody (fuel - 1)) (alt).Vuna_dIr_dModel.f_IrAlt_irAltBody) name) with
  | B_dData_dResult.C_Result_Err (dtb__144) -> (B_dData_dResult.C_Result_Err (dtb__144))
  | B_dData_dResult.C_Result_Ok (dtb__145) -> (B_dData_dResult.C_Result_Ok ({ Vuna_dIr_dModel.f_IrAlt_irAltCtor = (alt).Vuna_dIr_dModel.f_IrAlt_irAltCtor; Vuna_dIr_dModel.f_IrAlt_irAltBinders = (alt).Vuna_dIr_dModel.f_IrAlt_irAltBinders; Vuna_dIr_dModel.f_IrAlt_irAltBody = dtb__145 }))
  | _ -> failwith "DT: impossible branch"
)))
# 412 "Vuna/Ir/Cps.vuna"
and v_selfAlts = (fun (fuel : int) (alts : Vuna_dIr_dModel.t_IrAlt B_dData_dList.t_List) (name : string) -> (if (fuel <= 0) then (B_dData_dResult.C_Result_Ok (alts)) else (match alts with
  | B_dData_dList.C_List_Nil -> (B_dData_dResult.C_Result_Ok (B_dData_dList.C_List_Nil))
  | B_dData_dList.C_List__x58__x58_ (dtb__146, dtb__147) -> (match (((v_selfAlt (fuel - 1)) dtb__146) name) with
  | B_dData_dResult.C_Result_Err (dtb__148) -> (B_dData_dResult.C_Result_Err (dtb__148))
  | B_dData_dResult.C_Result_Ok (dtb__149) -> (match (((v_selfAlts (fuel - 1)) dtb__147) name) with
  | B_dData_dResult.C_Result_Err (dtb__150) -> (B_dData_dResult.C_Result_Err (dtb__150))
  | B_dData_dResult.C_Result_Ok (dtb__151) -> (B_dData_dResult.C_Result_Ok ((B_dData_dList.C_List__x58__x58_ (dtb__149, dtb__151))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))
# 427 "Vuna/Ir/Cps.vuna"
and v_selfBody = (fun (fuel : int) (body : Vuna_dIr_dModel.t_Ir) (name : string) -> (if (fuel <= 0) then (B_dData_dResult.C_Result_Ok (body)) else ((fun nd_uscrut3 -> (match nd_uscrut3 with
  | Vuna_dIr_dModel.C_Ir_IrApp (dtb__152, dtb__153, dtb__154) -> (match dtb__153 with
  | Vuna_dIr_dModel.C_Ir_IrRt (dtb__155) -> (if (dtb__155 = "prim_effectSelf") then (B_dData_dResult.C_Result_Ok (((v_applyAll (Vuna_dIr_dModel.C_Ir_IrRt (v_irCpsSelfName))) (B_dData_dList.C_List__x58__x58_ (dtb__154, (B_dData_dList.C_List__x58__x58_ (v_identityCont, B_dData_dList.C_List_Nil))))))) else (B_dData_dResult.C_Result_Err (("CPS: unexpected handleScoped shape: " ^ name))))
  | _ -> (B_dData_dResult.C_Result_Err (("CPS: unexpected handleScoped shape: " ^ name)))
)
  | Vuna_dIr_dModel.C_Ir_IrCase (dtb__156, dtb__157, dtb__158, dtb__159) -> (match (((v_selfAlts (fuel - 1)) dtb__159) name) with
  | B_dData_dResult.C_Result_Err (dtb__160) -> (B_dData_dResult.C_Result_Err (dtb__160))
  | B_dData_dResult.C_Result_Ok (dtb__161) -> (B_dData_dResult.C_Result_Ok ((Vuna_dIr_dModel.C_Ir_IrCase (dtb__156, dtb__157, dtb__158, dtb__161))))
  | _ -> failwith "DT: impossible branch"
)
  | Vuna_dIr_dModel.C_Ir_IrCast (dtb__162, dtb__163, dtb__164) -> (match (((v_selfBody (fuel - 1)) dtb__164) name) with
  | B_dData_dResult.C_Result_Err (dtb__165) -> (B_dData_dResult.C_Result_Err (dtb__165))
  | B_dData_dResult.C_Result_Ok (dtb__166) -> (B_dData_dResult.C_Result_Ok ((Vuna_dIr_dModel.C_Ir_IrCast (dtb__162, dtb__163, dtb__166))))
  | _ -> failwith "DT: impossible branch"
)
  | Vuna_dIr_dModel.C_Ir_IrLam (dtb__167, dtb__168, dtb__169) -> (match (((v_selfBody (fuel - 1)) dtb__169) name) with
  | B_dData_dResult.C_Result_Err (dtb__170) -> (B_dData_dResult.C_Result_Err (dtb__170))
  | B_dData_dResult.C_Result_Ok (dtb__171) -> (B_dData_dResult.C_Result_Ok ((Vuna_dIr_dModel.C_Ir_IrLam (dtb__167, dtb__168, dtb__171))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> (B_dData_dResult.C_Result_Err (("CPS: unexpected handleScoped shape: " ^ name)))
)) body)))

# 448 "Vuna/Ir/Cps.vuna"
let v_transformDef = (fun (fuel : int) (d : Vuna_dIr_dModel.t_IrDef) -> (if (fuel <= 0) then (B_dData_dResult.C_Result_Ok (d)) else (match d with
  | Vuna_dIr_dModel.C_IrDef_IrExternDef (dtb__172, dtb__173, dtb__174, dtb__175) -> (B_dData_dResult.C_Result_Ok (d))
  | Vuna_dIr_dModel.C_IrDef_IrDef (dtb__176, dtb__177, dtb__178, dtb__179, dtb__180, dtb__181, dtb__182, dtb__183) -> (if (if (if (dtb__176 = v_runPureName) then true else (dtb__176 = v_runEffName)) then true else (dtb__176 = v_runMainName)) then (match ((v_trampolineBody dtb__176) dtb__180) with
  | B_dData_dResult.C_Result_Err (dtb__184) -> (B_dData_dResult.C_Result_Err (dtb__184))
  | B_dData_dResult.C_Result_Ok (dtb__185) -> (B_dData_dResult.C_Result_Ok ((Vuna_dIr_dModel.C_IrDef_IrDef (dtb__176, dtb__177, dtb__178, dtb__179, dtb__185, dtb__181, dtb__182, dtb__183))))
  | _ -> failwith "DT: impossible branch"
) else (if (dtb__176 = v_handleScopedName) then (match (((v_selfBody (fuel - 1)) dtb__180) dtb__176) with
  | B_dData_dResult.C_Result_Err (dtb__186) -> (B_dData_dResult.C_Result_Err (dtb__186))
  | B_dData_dResult.C_Result_Ok (dtb__187) -> (B_dData_dResult.C_Result_Ok ((Vuna_dIr_dModel.C_IrDef_IrDef (dtb__176, dtb__177, dtb__178, dtb__179, dtb__187, dtb__181, dtb__182, dtb__183))))
  | _ -> failwith "DT: impossible branch"
) else (B_dData_dResult.C_Result_Ok ((Vuna_dIr_dModel.C_IrDef_IrDef (dtb__176, dtb__177, dtb__178, dtb__179, ((v_transformDirect (fuel - 1)) dtb__180), dtb__181, dtb__182, dtb__183))))))
  | _ -> failwith "DT: impossible branch"
)))

# 467 "Vuna/Ir/Cps.vuna"
let rec v_transformDefs = (fun (fuel : int) (xs : Vuna_dIr_dModel.t_IrDef B_dData_dList.t_List) -> (if (fuel <= 0) then (B_dData_dResult.C_Result_Ok (xs)) else (match xs with
  | B_dData_dList.C_List_Nil -> (B_dData_dResult.C_Result_Ok (B_dData_dList.C_List_Nil))
  | B_dData_dList.C_List__x58__x58_ (dtb__188, dtb__189) -> (match ((v_transformDef (fuel - 1)) dtb__188) with
  | B_dData_dResult.C_Result_Err (dtb__190) -> (B_dData_dResult.C_Result_Err (dtb__190))
  | B_dData_dResult.C_Result_Ok (dtb__191) -> (match ((v_transformDefs (fuel - 1)) dtb__189) with
  | B_dData_dResult.C_Result_Err (dtb__192) -> (B_dData_dResult.C_Result_Err (dtb__192))
  | B_dData_dResult.C_Result_Ok (dtb__193) -> (B_dData_dResult.C_Result_Ok ((B_dData_dList.C_List__x58__x58_ (dtb__191, dtb__193))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))

# 482 "Vuna/Ir/Cps.vuna"
let v_transformGroup = (fun (fuel : int) (g : Vuna_dIr_dModel.t_IrGroup) -> (if (fuel <= 0) then (B_dData_dResult.C_Result_Ok (g)) else (match ((v_transformDefs (fuel - 1)) (g).Vuna_dIr_dModel.f_IrGroup_irGroupDefs) with
  | B_dData_dResult.C_Result_Err (dtb__194) -> (B_dData_dResult.C_Result_Err (dtb__194))
  | B_dData_dResult.C_Result_Ok (dtb__195) -> (B_dData_dResult.C_Result_Ok ({ Vuna_dIr_dModel.f_IrGroup_irGroupIsRec = (g).Vuna_dIr_dModel.f_IrGroup_irGroupIsRec; Vuna_dIr_dModel.f_IrGroup_irGroupDefs = dtb__195 }))
  | _ -> failwith "DT: impossible branch"
)))

# 491 "Vuna/Ir/Cps.vuna"
let rec v_transformGroups = (fun (fuel : int) (xs : Vuna_dIr_dModel.t_IrGroup B_dData_dList.t_List) -> (if (fuel <= 0) then (B_dData_dResult.C_Result_Ok (xs)) else (match xs with
  | B_dData_dList.C_List_Nil -> (B_dData_dResult.C_Result_Ok (B_dData_dList.C_List_Nil))
  | B_dData_dList.C_List__x58__x58_ (dtb__196, dtb__197) -> (match ((v_transformGroup (fuel - 1)) dtb__196) with
  | B_dData_dResult.C_Result_Err (dtb__198) -> (B_dData_dResult.C_Result_Err (dtb__198))
  | B_dData_dResult.C_Result_Ok (dtb__199) -> (match ((v_transformGroups (fuel - 1)) dtb__197) with
  | B_dData_dResult.C_Result_Err (dtb__200) -> (B_dData_dResult.C_Result_Err (dtb__200))
  | B_dData_dResult.C_Result_Ok (dtb__201) -> (B_dData_dResult.C_Result_Ok ((B_dData_dList.C_List__x58__x58_ (dtb__199, dtb__201))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))

# 509 "Vuna/Ir/Cps.vuna"
let v_mBNameText = (fun (mc0 : Vuna_dIr_dModel.t_IrBName) -> (match mc0 with
  | Vuna_dIr_dModel.C_IrBName_IrBWild -> "wild"
  | Vuna_dIr_dModel.C_IrBName_IrBNat (dtb__202) -> ("nat" ^ (bi_strFromInt dtb__202))
  | Vuna_dIr_dModel.C_IrBName_IrBArm (dtb__203) -> ("arm" ^ (bi_strFromInt dtb__203))
  | Vuna_dIr_dModel.C_IrBName_IrBUser (dtb__204) -> dtb__204
  | _ -> failwith "DT: impossible branch"
))

# 515 "Vuna/Ir/Cps.vuna"
let v_mIsOp = (fun (b : Vuna_dIr_dModel.t_IrBinder) -> (match (b).Vuna_dIr_dModel.f_IrBinder_irBinderName with
  | Vuna_dIr_dModel.C_IrBName_IrBUser (dtb__205) -> (dtb__205 = "@vuna@handle@o")
  | _ -> false
))

# 524 "Vuna/Ir/Cps.vuna"
let rec v_mResumeGo = (fun (mc0 : Vuna_dIr_dModel.t_IrBinder B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__206, dtb__207) -> (if (v_mIsOp dtb__206) then (match dtb__207 with
  | B_dData_dList.C_List__x58__x58_ (dtb__208, dtb__209) -> (B_dData_dMaybe.C_Maybe_Just (dtb__208))
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
) else (v_mResumeGo dtb__207))
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 521 "Vuna/Ir/Cps.vuna"
let v_mResumption = (fun (bs : Vuna_dIr_dModel.t_IrBinder B_dData_dList.t_List) -> (v_mResumeGo (v_runtimeBinders bs)))

# 534 "Vuna/Ir/Cps.vuna"
let rec v_mEraseHead = (fun (mc0 : Vuna_dIr_dModel.t_Ir) -> (match mc0 with
  | Vuna_dIr_dModel.C_Ir_IrCast (dtb__210, dtb__211, dtb__212) -> (v_mEraseHead dtb__212)
  | Vuna_dIr_dModel.C_Ir_IrApp (dtb__213, dtb__214, dtb__215) -> (match dtb__214 with
  | Vuna_dIr_dModel.C_Ir_IrRt (dtb__216) -> (if (dtb__216 = "prim_erase") then (v_mEraseHead dtb__215) else mc0)
  | _ -> mc0
)
  | _ -> mc0
))

# 541 "Vuna/Ir/Cps.vuna"
let rec v_mStripErase = (fun (mc0 : Vuna_dIr_dModel.t_Ir) -> (match mc0 with
  | Vuna_dIr_dModel.C_Ir_IrApp (dtb__217, dtb__218, dtb__219) -> (match dtb__218 with
  | Vuna_dIr_dModel.C_Ir_IrRt (dtb__220) -> (if (dtb__220 = "prim_erase") then (v_mStripErase dtb__219) else (Vuna_dIr_dModel.C_Ir_IrApp (B_dData_dMaybe.C_Maybe_Nothing, (Vuna_dIr_dModel.C_Ir_IrRt (dtb__220)), dtb__219)))
  | _ -> mc0
)
  | Vuna_dIr_dModel.C_Ir_IrCast (dtb__221, dtb__222, dtb__223) -> (v_mStripErase dtb__223)
  | _ -> mc0
))

# 550 "Vuna/Ir/Cps.vuna"
let v_mIsResumeAppGo = (fun (mc0 : Vuna_dIr_dModel.t_IrBinder) (mc1 : Vuna_dIr_dModel.t_Ir) -> (match mc1 with
  | Vuna_dIr_dModel.C_Ir_IrApp (dtb__224, dtb__225, dtb__226) -> ((fun p -> (match (v_mEraseHead (B_dData_dPair.v_firstOf p)) with
  | Vuna_dIr_dModel.C_Ir_IrVar (dtb__227) -> ((v_mBNameText (dtb__227).Vuna_dIr_dModel.f_IrBinder_irBinderName) = (v_mBNameText (mc0).Vuna_dIr_dModel.f_IrBinder_irBinderName))
  | _ -> (match (B_dData_dPair.v_secondOf p) with
  | B_dData_dList.C_List__x58__x58_ (dtb__228, dtb__229) -> (match (v_mEraseHead dtb__228) with
  | Vuna_dIr_dModel.C_Ir_IrVar (dtb__230) -> ((v_mBNameText (dtb__230).Vuna_dIr_dModel.f_IrBinder_irBinderName) = (v_mBNameText (mc0).Vuna_dIr_dModel.f_IrBinder_irBinderName))
  | _ -> false
)
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
)
)) (v_flattenApp mc1))
  | _ -> false
))

# 547 "Vuna/Ir/Cps.vuna"
let v_mIsResumeApp = (fun (r : Vuna_dIr_dModel.t_IrBinder) (e0 : Vuna_dIr_dModel.t_Ir) -> ((v_mIsResumeAppGo r) (v_mStripErase e0)))

# 565 "Vuna/Ir/Cps.vuna"
let v_mFreshV = (fun (n : int) -> (v_mkBinder ("__mchV" ^ (bi_strFromInt n))))

# 568 "Vuna/Ir/Cps.vuna"
let v_mFreshK = (fun (n : int) -> (v_mkBinder ("__mchK" ^ (bi_strFromInt n))))

# 572 "Vuna/Ir/Cps.vuna"
let v_mFreshTailK = (fun (n : int) -> (v_mkBinder ("__mchTK" ^ (bi_strFromInt n))))

# 575 "Vuna/Ir/Cps.vuna"
let v_mFreshR = (fun (n : int) -> (v_mkBinder ("__mchR" ^ (bi_strFromInt n))))

# 580 "Vuna/Ir/Cps.vuna"
let v_isEffResultTy = (fun (mc0 : Vuna_dIr_dModel.t_IrTy B_dData_dMaybe.t_Maybe) -> (match mc0 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__231) -> (match dtb__231 with
  | Vuna_dIr_dModel.C_IrTy_IrTyData (dtb__232, dtb__233) -> (dtb__232 = Vuna_dIr_dModel.v_irEffTypeName)
  | _ -> false
)
  | _ -> false
))

# 584 "Vuna/Ir/Cps.vuna"
let v_isEffContLambda = (fun (_uarity0 : Vuna_dIr_dModel.t_IrTy B_dData_dMaybe.t_Maybe) -> (v_isEffResultTy _uarity0))

# 588 "Vuna/Ir/Cps.vuna"
let v_isEffThunkBody = (fun (mc0 : Vuna_dIr_dModel.t_Ir) -> (match mc0 with
  | Vuna_dIr_dModel.C_Ir_IrCtor (dtb__234, dtb__235, dtb__236, dtb__237) -> (match dtb__237 with
  | B_dData_dList.C_List__x58__x58_ (dtb__238, dtb__239) -> (match dtb__238 with
  | Vuna_dIr_dModel.C_Ir_IrLam (dtb__240, dtb__241, dtb__242) -> (match dtb__239 with
  | B_dData_dList.C_List_Nil -> (if (dtb__234 = Vuna_dIr_dModel.v_irEffTypeName) then (dtb__235 = Vuna_dIr_dModel.v_irEffMkCtor) else false)
  | _ -> false
)
  | _ -> false
)
  | _ -> false
)
  | _ -> false
))

# 594 "Vuna/Ir/Cps.vuna"
let v_mRunEffTerm = (fun (eff : Vuna_dIr_dModel.t_Ir) (k : Vuna_dIr_dModel.t_Ir) -> ((fun th -> (Vuna_dIr_dModel.C_Ir_IrCase (B_dData_dMaybe.C_Maybe_Nothing, B_dData_dMaybe.C_Maybe_Nothing, eff, (B_dData_dList.C_List__x58__x58_ ({ Vuna_dIr_dModel.f_IrAlt_irAltCtor = (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = Vuna_dIr_dModel.v_irEffTypeName; B_dData_dPair.f_Pair_second = Vuna_dIr_dModel.v_irEffMkCtor })); Vuna_dIr_dModel.f_IrAlt_irAltBinders = (B_dData_dList.C_List__x58__x58_ (th, B_dData_dList.C_List_Nil)); Vuna_dIr_dModel.f_IrAlt_irAltBody = (Vuna_dIr_dModel.C_Ir_IrRtApp (v_irMRunEffName, (B_dData_dList.C_List__x58__x58_ ((Vuna_dIr_dModel.C_Ir_IrVar (th)), (B_dData_dList.C_List__x58__x58_ (k, B_dData_dList.C_List_Nil)))))) }, B_dData_dList.C_List_Nil))))) (v_mkBinder "__mEffTh")))

# 604 "Vuna/Ir/Cps.vuna"
let v_mNoResumption = (v_mkBinder "@vuna@noresume")

# 638 "Vuna/Ir/Cps.vuna"
let v_mIsControl = (fun (mc0 : Vuna_dIr_dModel.t_Ir) -> (match mc0 with
  | Vuna_dIr_dModel.C_Ir_IrNatCase (dtb__243, dtb__244, dtb__245, dtb__246, dtb__247) -> true
  | Vuna_dIr_dModel.C_Ir_IrIf (dtb__248, dtb__249, dtb__250) -> true
  | Vuna_dIr_dModel.C_Ir_IrCase (dtb__251, dtb__252, dtb__253, dtb__254) -> true
  | _ -> false
))

# 690 "Vuna/Ir/Cps.vuna"
let v_isTailCont = (fun (e : Vuna_dIr_dModel.t_Ir) -> (match e with
  | Vuna_dIr_dModel.C_Ir_IrVar (dtb__255) -> ((B_dData_dString.v_startsWith "__mchTK") (v_mBNameText (dtb__255).Vuna_dIr_dModel.f_IrBinder_irBinderName))
  | _ -> false
))

# 609 "Vuna/Ir/Cps.vuna"
let rec v_mEffContLambda = (fun (fuel : int) (r : Vuna_dIr_dModel.t_IrBinder) (bs : Vuna_dIr_dModel.t_IrBinder B_dData_dList.t_List) (rt : Vuna_dIr_dModel.t_IrTy B_dData_dMaybe.t_Maybe) (body : Vuna_dIr_dModel.t_Ir) -> ((fun kd -> ((fun u -> ((fun v -> (Vuna_dIr_dModel.C_Ir_IrLam (bs, rt, (Vuna_dIr_dModel.C_Ir_IrCtor (Vuna_dIr_dModel.v_irEffTypeName, Vuna_dIr_dModel.v_irEffMkCtor, B_dData_dMaybe.C_Maybe_Nothing, (B_dData_dList.C_List__x58__x58_ ((Vuna_dIr_dModel.C_Ir_IrLam ((B_dData_dList.C_List__x58__x58_ (u, (B_dData_dList.C_List__x58__x58_ (kd, B_dData_dList.C_List_Nil)))), B_dData_dMaybe.C_Maybe_Nothing, ((((v_mCps (fuel - 1)) r) (Vuna_dIr_dModel.C_Ir_IrLam ((B_dData_dList.C_List__x58__x58_ (v, B_dData_dList.C_List_Nil)), B_dData_dMaybe.C_Maybe_Nothing, ((v_mRunEffTerm (Vuna_dIr_dModel.C_Ir_IrVar (v))) (Vuna_dIr_dModel.C_Ir_IrVar (kd)))))) body))), B_dData_dList.C_List_Nil))))))) (v_mFreshV fuel))) (v_mkBinder "__mEffU"))) (v_mFreshK fuel)))
# 620 "Vuna/Ir/Cps.vuna"
and v_mCpsAlts = (fun (fuel : int) (r : Vuna_dIr_dModel.t_IrBinder) (k : Vuna_dIr_dModel.t_Ir) (alts : Vuna_dIr_dModel.t_IrAlt B_dData_dList.t_List) -> (if (fuel <= 0) then alts else (match alts with
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | B_dData_dList.C_List__x58__x58_ (dtb__256, dtb__257) -> (B_dData_dList.C_List__x58__x58_ ({ Vuna_dIr_dModel.f_IrAlt_irAltCtor = (dtb__256).Vuna_dIr_dModel.f_IrAlt_irAltCtor; Vuna_dIr_dModel.f_IrAlt_irAltBinders = (dtb__256).Vuna_dIr_dModel.f_IrAlt_irAltBinders; Vuna_dIr_dModel.f_IrAlt_irAltBody = ((((v_mCps (fuel - 1)) r) k) (dtb__256).Vuna_dIr_dModel.f_IrAlt_irAltBody) }, ((((v_mCpsAlts (fuel - 1)) r) k) dtb__257)))
  | _ -> failwith "DT: impossible branch"
)))
# 629 "Vuna/Ir/Cps.vuna"
and v_mCpsAltM = (fun (fuel : int) (r : Vuna_dIr_dModel.t_IrBinder) (k : Vuna_dIr_dModel.t_Ir) (m : Vuna_dIr_dModel.t_IrAlt B_dData_dMaybe.t_Maybe) -> (if (fuel <= 0) then m else (match m with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb__258) -> (B_dData_dMaybe.C_Maybe_Just ({ Vuna_dIr_dModel.f_IrAlt_irAltCtor = (dtb__258).Vuna_dIr_dModel.f_IrAlt_irAltCtor; Vuna_dIr_dModel.f_IrAlt_irAltBinders = (dtb__258).Vuna_dIr_dModel.f_IrAlt_irAltBinders; Vuna_dIr_dModel.f_IrAlt_irAltBody = ((((v_mCps (fuel - 1)) r) k) (dtb__258).Vuna_dIr_dModel.f_IrAlt_irAltBody) }))
  | _ -> failwith "DT: impossible branch"
)))
# 646 "Vuna/Ir/Cps.vuna"
and v_mCpsArgs = (fun (fuel : int) (r : Vuna_dIr_dModel.t_IrBinder) (k : Vuna_dIr_dModel.t_Ir) (sym : string) (args : Vuna_dIr_dModel.t_Ir B_dData_dList.t_List) (acc : Vuna_dIr_dModel.t_Ir B_dData_dList.t_List) -> (if (fuel <= 0) then (Vuna_dIr_dModel.C_Ir_IrApp (B_dData_dMaybe.C_Maybe_Nothing, k, (Vuna_dIr_dModel.C_Ir_IrRtApp (sym, ((B_dData_dList.v_append (B_dData_dList.v_reverse acc)) args))))) else (match args with
  | B_dData_dList.C_List_Nil -> (Vuna_dIr_dModel.C_Ir_IrApp (B_dData_dMaybe.C_Maybe_Nothing, k, (Vuna_dIr_dModel.C_Ir_IrRtApp (sym, (B_dData_dList.v_reverse acc)))))
  | B_dData_dList.C_List__x58__x58_ (dtb__259, dtb__260) -> ((fun v -> ((((v_mCps (fuel - 1)) r) (Vuna_dIr_dModel.C_Ir_IrLam ((B_dData_dList.C_List__x58__x58_ (v, B_dData_dList.C_List_Nil)), B_dData_dMaybe.C_Maybe_Nothing, ((((((v_mCpsArgs (fuel - 1)) r) k) sym) dtb__260) (B_dData_dList.C_List__x58__x58_ ((Vuna_dIr_dModel.C_Ir_IrVar (v)), acc)))))) dtb__259)) (v_mFreshV fuel))
  | _ -> failwith "DT: impossible branch"
)))
# 661 "Vuna/Ir/Cps.vuna"
and v_mCpsApply = (fun (fuel : int) (r : Vuna_dIr_dModel.t_IrBinder) (k : Vuna_dIr_dModel.t_Ir) (parts : Vuna_dIr_dModel.t_Ir B_dData_dList.t_List) -> (if (fuel <= 0) then (match parts with
  | B_dData_dList.C_List_Nil -> (Vuna_dIr_dModel.C_Ir_IrApp (B_dData_dMaybe.C_Maybe_Nothing, k, (Vuna_dIr_dModel.C_Ir_IrGlobal ("?"))))
  | B_dData_dList.C_List__x58__x58_ (dtb__261, dtb__262) -> (Vuna_dIr_dModel.C_Ir_IrApp (B_dData_dMaybe.C_Maybe_Nothing, k, ((v_applyAll dtb__261) dtb__262)))
  | _ -> failwith "DT: impossible branch"
) else ((fun nd_uscrut4 -> (match nd_uscrut4 with
  | B_dData_dList.C_List__x58__x58_ (dtb__263, dtb__264) -> (match dtb__264 with
  | B_dData_dList.C_List_Nil -> ((((v_mCps (fuel - 1)) r) k) dtb__263)
  | _ -> ((fun v -> ((((v_mCps (fuel - 1)) r) (Vuna_dIr_dModel.C_Ir_IrLam ((B_dData_dList.C_List__x58__x58_ (v, B_dData_dList.C_List_Nil)), B_dData_dMaybe.C_Maybe_Nothing, ((((((v_mCpsApplyArgs (fuel - 1)) r) k) dtb__264) B_dData_dList.C_List_Nil) v)))) dtb__263)) (v_mFreshV fuel))
)
  | B_dData_dList.C_List_Nil -> (Vuna_dIr_dModel.C_Ir_IrApp (B_dData_dMaybe.C_Maybe_Nothing, k, (Vuna_dIr_dModel.C_Ir_IrGlobal ("?"))))
  | _ -> failwith "DT: impossible branch"
)) parts)))
# 677 "Vuna/Ir/Cps.vuna"
and v_mCpsApplyArgs = (fun (fuel : int) (r : Vuna_dIr_dModel.t_IrBinder) (k : Vuna_dIr_dModel.t_Ir) (args : Vuna_dIr_dModel.t_Ir B_dData_dList.t_List) (acc : Vuna_dIr_dModel.t_Ir B_dData_dList.t_List) (headV : Vuna_dIr_dModel.t_IrBinder) -> (if (fuel <= 0) then (Vuna_dIr_dModel.C_Ir_IrApp (B_dData_dMaybe.C_Maybe_Nothing, k, ((v_applyAll (Vuna_dIr_dModel.C_Ir_IrVar (headV))) ((B_dData_dList.v_append (B_dData_dList.v_reverse acc)) args)))) else (match args with
  | B_dData_dList.C_List_Nil -> (Vuna_dIr_dModel.C_Ir_IrApp (B_dData_dMaybe.C_Maybe_Nothing, k, ((v_applyAll (Vuna_dIr_dModel.C_Ir_IrVar (headV))) (B_dData_dList.v_reverse acc))))
  | B_dData_dList.C_List__x58__x58_ (dtb__265, dtb__266) -> ((fun v -> ((((v_mCps (fuel - 1)) r) (Vuna_dIr_dModel.C_Ir_IrLam ((B_dData_dList.C_List__x58__x58_ (v, B_dData_dList.C_List_Nil)), B_dData_dMaybe.C_Maybe_Nothing, ((((((v_mCpsApplyArgs (fuel - 1)) r) k) dtb__266) (B_dData_dList.C_List__x58__x58_ ((Vuna_dIr_dModel.C_Ir_IrVar (v)), acc))) headV)))) dtb__265)) (v_mFreshV fuel))
  | _ -> failwith "DT: impossible branch"
)))
# 696 "Vuna/Ir/Cps.vuna"
and v_mCps = (fun (fuel : int) (r : Vuna_dIr_dModel.t_IrBinder) (k : Vuna_dIr_dModel.t_Ir) (e : Vuna_dIr_dModel.t_Ir) -> (if (fuel <= 0) then (Vuna_dIr_dModel.C_Ir_IrApp (B_dData_dMaybe.C_Maybe_Nothing, k, e)) else (if ((v_mIsResumeApp r) e) then (if (v_isTailCont k) then (Vuna_dIr_dModel.C_Ir_IrApp (B_dData_dMaybe.C_Maybe_Nothing, e, (Vuna_dIr_dModel.C_Ir_IrCtor ("Base.Effect.Core.Rest", "Base.Effect.Core.Rest.MkRestTail", B_dData_dMaybe.C_Maybe_Nothing, B_dData_dList.C_List_Nil)))) else (Vuna_dIr_dModel.C_Ir_IrApp (B_dData_dMaybe.C_Maybe_Nothing, e, (Vuna_dIr_dModel.C_Ir_IrCtor ("Base.Effect.Core.Rest", "Base.Effect.Core.Rest.MkRestCont", B_dData_dMaybe.C_Maybe_Nothing, (B_dData_dList.C_List__x58__x58_ (k, B_dData_dList.C_List_Nil))))))) else (match e with
  | Vuna_dIr_dModel.C_Ir_IrLet (dtb__267, dtb__268, dtb__269) -> ((fun v -> ((fun cont -> ((((v_mCps (fuel - 1)) r) cont) dtb__268)) (Vuna_dIr_dModel.C_Ir_IrLam ((B_dData_dList.C_List__x58__x58_ (v, B_dData_dList.C_List_Nil)), B_dData_dMaybe.C_Maybe_Nothing, (Vuna_dIr_dModel.C_Ir_IrLet (dtb__267, (Vuna_dIr_dModel.C_Ir_IrVar (v)), ((((v_mCps (fuel - 1)) r) k) dtb__269))))))) (v_mFreshV fuel))
  | Vuna_dIr_dModel.C_Ir_IrCase (dtb__270, dtb__271, dtb__272, dtb__273) -> ((fun v -> ((fun cont -> ((((v_mCps (fuel - 1)) r) cont) dtb__272)) (Vuna_dIr_dModel.C_Ir_IrLam ((B_dData_dList.C_List__x58__x58_ (v, B_dData_dList.C_List_Nil)), B_dData_dMaybe.C_Maybe_Nothing, (Vuna_dIr_dModel.C_Ir_IrCase (dtb__270, B_dData_dMaybe.C_Maybe_Nothing, (Vuna_dIr_dModel.C_Ir_IrVar (v)), ((((v_mCpsAlts (fuel - 2)) r) k) dtb__273))))))) (v_mFreshV fuel))
  | Vuna_dIr_dModel.C_Ir_IrIf (dtb__274, dtb__275, dtb__276) -> ((fun v -> ((fun cont -> ((((v_mCps (fuel - 1)) r) cont) dtb__274)) (Vuna_dIr_dModel.C_Ir_IrLam ((B_dData_dList.C_List__x58__x58_ (v, B_dData_dList.C_List_Nil)), B_dData_dMaybe.C_Maybe_Nothing, (Vuna_dIr_dModel.C_Ir_IrIf ((Vuna_dIr_dModel.C_Ir_IrVar (v)), ((((v_mCps (fuel - 2)) r) k) dtb__275), ((((v_mCps (fuel - 2)) r) k) dtb__276))))))) (v_mFreshV fuel))
  | Vuna_dIr_dModel.C_Ir_IrNatCase (dtb__277, dtb__278, dtb__279, dtb__280, dtb__281) -> ((fun v -> ((fun cont -> ((((v_mCps (fuel - 1)) r) cont) dtb__277)) (Vuna_dIr_dModel.C_Ir_IrLam ((B_dData_dList.C_List__x58__x58_ (v, B_dData_dList.C_List_Nil)), B_dData_dMaybe.C_Maybe_Nothing, (Vuna_dIr_dModel.C_Ir_IrNatCase ((Vuna_dIr_dModel.C_Ir_IrVar (v)), dtb__278, ((((v_mCpsAltM (fuel - 2)) r) k) dtb__279), ((((v_mCpsAltM (fuel - 2)) r) k) dtb__280), ((((v_mCpsAltM (fuel - 2)) r) k) dtb__281))))))) (v_mFreshV fuel))
  | Vuna_dIr_dModel.C_Ir_IrCast (dtb__282, dtb__283, dtb__284) -> (Vuna_dIr_dModel.C_Ir_IrCast (dtb__282, dtb__283, ((((v_mCps (fuel - 1)) r) k) dtb__284)))
  | Vuna_dIr_dModel.C_Ir_IrRtApp (dtb__285, dtb__286) -> ((((((v_mCpsArgs (fuel - 1)) r) k) dtb__285) dtb__286) B_dData_dList.C_List_Nil)
  | Vuna_dIr_dModel.C_Ir_IrLam (dtb__287, dtb__288, dtb__289) -> (if (v_isEffContLambda dtb__288) then (Vuna_dIr_dModel.C_Ir_IrApp (B_dData_dMaybe.C_Maybe_Nothing, k, (((((v_mEffContLambda (fuel - 1)) r) dtb__287) dtb__288) dtb__289))) else (Vuna_dIr_dModel.C_Ir_IrApp (B_dData_dMaybe.C_Maybe_Nothing, k, e)))
  | Vuna_dIr_dModel.C_Ir_IrApp (dtb__290, dtb__291, dtb__292) -> ((fun p -> ((((v_mCpsApply (fuel - 1)) r) k) ((B_dData_dList.v_append (B_dData_dList.C_List__x58__x58_ ((B_dData_dPair.v_firstOf p), B_dData_dList.C_List_Nil))) (B_dData_dPair.v_secondOf p)))) (v_flattenApp e))
  | _ -> (Vuna_dIr_dModel.C_Ir_IrApp (B_dData_dMaybe.C_Maybe_Nothing, k, e))
))))

# 804 "Vuna/Ir/Cps.vuna"
let v_mSym = (fun (x : string) -> (if (x = v_irCpsPerformName) then v_irMPerformName else (if (x = v_irCpsHandleName) then v_irMHandleName else (if (x = v_irCpsSelfName) then v_irMSelfName else x))))

# 810 "Vuna/Ir/Cps.vuna"
let rec v_mSyms = (fun (fuel : int) (e : Vuna_dIr_dModel.t_Ir) -> (if (fuel <= 0) then e else (match e with
  | Vuna_dIr_dModel.C_Ir_IrRt (dtb__293) -> (Vuna_dIr_dModel.C_Ir_IrRt ((v_mSym dtb__293)))
  | Vuna_dIr_dModel.C_Ir_IrRtApp (dtb__294, dtb__295) -> (Vuna_dIr_dModel.C_Ir_IrRtApp ((v_mSym dtb__294), ((v_mListS (fuel - 1)) dtb__295)))
  | Vuna_dIr_dModel.C_Ir_IrCtor (dtb__296, dtb__297, dtb__298, dtb__299) -> (Vuna_dIr_dModel.C_Ir_IrCtor (dtb__296, dtb__297, B_dData_dMaybe.C_Maybe_Nothing, ((v_mListS (fuel - 1)) dtb__299)))
  | Vuna_dIr_dModel.C_Ir_IrRecord (dtb__300, dtb__301, dtb__302) -> (Vuna_dIr_dModel.C_Ir_IrRecord (dtb__300, B_dData_dMaybe.C_Maybe_Nothing, ((v_mFieldsS (fuel - 1)) dtb__302)))
  | Vuna_dIr_dModel.C_Ir_IrProj (dtb__303, dtb__304, dtb__305, dtb__306) -> (Vuna_dIr_dModel.C_Ir_IrProj (((v_mSyms (fuel - 1)) dtb__303), dtb__304, dtb__305, B_dData_dMaybe.C_Maybe_Nothing))
  | Vuna_dIr_dModel.C_Ir_IrRecUpd (dtb__307, dtb__308, dtb__309, dtb__310) -> (Vuna_dIr_dModel.C_Ir_IrRecUpd (((v_mSyms (fuel - 1)) dtb__307), dtb__308, ((v_mFieldsS (fuel - 1)) dtb__309), B_dData_dMaybe.C_Maybe_Nothing))
  | Vuna_dIr_dModel.C_Ir_IrCast (dtb__311, dtb__312, dtb__313) -> (Vuna_dIr_dModel.C_Ir_IrCast (dtb__311, dtb__312, ((v_mSyms (fuel - 1)) dtb__313)))
  | Vuna_dIr_dModel.C_Ir_IrLet (dtb__314, dtb__315, dtb__316) -> (Vuna_dIr_dModel.C_Ir_IrLet (dtb__314, ((v_mSyms (fuel - 1)) dtb__315), ((v_mSyms (fuel - 1)) dtb__316)))
  | Vuna_dIr_dModel.C_Ir_IrLam (dtb__317, dtb__318, dtb__319) -> (Vuna_dIr_dModel.C_Ir_IrLam (dtb__317, dtb__318, ((v_mSyms (fuel - 1)) dtb__319)))
  | Vuna_dIr_dModel.C_Ir_IrApp (dtb__320, dtb__321, dtb__322) -> (Vuna_dIr_dModel.C_Ir_IrApp (B_dData_dMaybe.C_Maybe_Nothing, ((v_mSyms (fuel - 1)) dtb__321), ((v_mSyms (fuel - 1)) dtb__322)))
  | Vuna_dIr_dModel.C_Ir_IrIf (dtb__323, dtb__324, dtb__325) -> (Vuna_dIr_dModel.C_Ir_IrIf (((v_mSyms (fuel - 1)) dtb__323), ((v_mSyms (fuel - 1)) dtb__324), ((v_mSyms (fuel - 1)) dtb__325)))
  | Vuna_dIr_dModel.C_Ir_IrCase (dtb__326, dtb__327, dtb__328, dtb__329) -> (Vuna_dIr_dModel.C_Ir_IrCase (dtb__326, B_dData_dMaybe.C_Maybe_Nothing, ((v_mSyms (fuel - 1)) dtb__328), ((v_mSymsAltsM (fuel - 1)) dtb__329)))
  | Vuna_dIr_dModel.C_Ir_IrNatCase (dtb__330, dtb__331, dtb__332, dtb__333, dtb__334) -> (Vuna_dIr_dModel.C_Ir_IrNatCase (((v_mSyms (fuel - 1)) dtb__330), dtb__331, ((v_mSymsAltMM (fuel - 1)) dtb__332), ((v_mSymsAltMM (fuel - 1)) dtb__333), ((v_mSymsAltMM (fuel - 1)) dtb__334)))
  | Vuna_dIr_dModel.C_Ir_IrConcatMany (dtb__335) -> (Vuna_dIr_dModel.C_Ir_IrConcatMany (((v_mListS (fuel - 1)) dtb__335)))
  | Vuna_dIr_dModel.C_Ir_IrEffThunk (dtb__336, dtb__337, dtb__338, dtb__339, dtb__340) -> (Vuna_dIr_dModel.C_Ir_IrEffThunk (dtb__336, dtb__337, dtb__338, dtb__339, ((v_mSyms (fuel - 1)) dtb__340)))
  | _ -> e
)))
# 833 "Vuna/Ir/Cps.vuna"
and v_mListS = (fun (fuel : int) (xs : Vuna_dIr_dModel.t_Ir B_dData_dList.t_List) -> (if (fuel <= 0) then xs else (match xs with
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | B_dData_dList.C_List__x58__x58_ (dtb__341, dtb__342) -> (B_dData_dList.C_List__x58__x58_ (((v_mSyms (fuel - 1)) dtb__341), ((v_mListS (fuel - 1)) dtb__342)))
  | _ -> failwith "DT: impossible branch"
)))
# 842 "Vuna/Ir/Cps.vuna"
and v_mFieldsS = (fun (fuel : int) (fs : (string, Vuna_dIr_dModel.t_Ir) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (if (fuel <= 0) then fs else (match fs with
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | B_dData_dList.C_List__x58__x58_ (dtb__343, dtb__344) -> (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = (B_dData_dPair.v_firstOf dtb__343); B_dData_dPair.f_Pair_second = ((v_mSyms (fuel - 1)) (B_dData_dPair.v_secondOf dtb__343)) }, ((v_mFieldsS (fuel - 1)) dtb__344)))
  | _ -> failwith "DT: impossible branch"
)))
# 851 "Vuna/Ir/Cps.vuna"
and v_mSymsAltsM = (fun (fuel : int) (alts : Vuna_dIr_dModel.t_IrAlt B_dData_dList.t_List) -> (if (fuel <= 0) then alts else (match alts with
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | B_dData_dList.C_List__x58__x58_ (dtb__345, dtb__346) -> (B_dData_dList.C_List__x58__x58_ ({ Vuna_dIr_dModel.f_IrAlt_irAltCtor = (dtb__345).Vuna_dIr_dModel.f_IrAlt_irAltCtor; Vuna_dIr_dModel.f_IrAlt_irAltBinders = (dtb__345).Vuna_dIr_dModel.f_IrAlt_irAltBinders; Vuna_dIr_dModel.f_IrAlt_irAltBody = ((v_mSyms (fuel - 1)) (dtb__345).Vuna_dIr_dModel.f_IrAlt_irAltBody) }, ((v_mSymsAltsM (fuel - 1)) dtb__346)))
  | _ -> failwith "DT: impossible branch"
)))
# 860 "Vuna/Ir/Cps.vuna"
and v_mSymsAltMM = (fun (fuel : int) (m : Vuna_dIr_dModel.t_IrAlt B_dData_dMaybe.t_Maybe) -> (if (fuel <= 0) then m else (match m with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb__347) -> (B_dData_dMaybe.C_Maybe_Just ({ Vuna_dIr_dModel.f_IrAlt_irAltCtor = (dtb__347).Vuna_dIr_dModel.f_IrAlt_irAltCtor; Vuna_dIr_dModel.f_IrAlt_irAltBinders = (dtb__347).Vuna_dIr_dModel.f_IrAlt_irAltBinders; Vuna_dIr_dModel.f_IrAlt_irAltBody = ((v_mSyms (fuel - 1)) (dtb__347).Vuna_dIr_dModel.f_IrAlt_irAltBody) }))
  | _ -> failwith "DT: impossible branch"
)))

# 869 "Vuna/Ir/Cps.vuna"
let v_mDoneCont = ((fun v -> (Vuna_dIr_dModel.C_Ir_IrLam ((B_dData_dList.C_List__x58__x58_ (v, B_dData_dList.C_List_Nil)), B_dData_dMaybe.C_Maybe_Nothing, (Vuna_dIr_dModel.C_Ir_IrApp (B_dData_dMaybe.C_Maybe_Nothing, (Vuna_dIr_dModel.C_Ir_IrRt (v_irMDoneName)), (Vuna_dIr_dModel.C_Ir_IrVar (v))))))) (v_mkBinder "__mDoneV"))

# 875 "Vuna/Ir/Cps.vuna"
let rec v_mTrampolineBody = (fun (mc0 : string) (mc1 : Vuna_dIr_dModel.t_Ir) -> (match mc1 with
  | Vuna_dIr_dModel.C_Ir_IrApp (dtb__348, dtb__349, dtb__350) -> (match dtb__349 with
  | Vuna_dIr_dModel.C_Ir_IrApp (dtb__351, dtb__352, dtb__353) -> (match dtb__352 with
  | Vuna_dIr_dModel.C_Ir_IrApp (dtb__354, dtb__355, dtb__356) -> (match dtb__355 with
  | Vuna_dIr_dModel.C_Ir_IrGlobal (dtb__357) -> (if (dtb__357 = v_runThunkName) then (B_dData_dResult.C_Result_Ok ((Vuna_dIr_dModel.C_Ir_IrApp (B_dData_dMaybe.C_Maybe_Nothing, (Vuna_dIr_dModel.C_Ir_IrRt (v_irMRunName)), ((v_applyAll (Vuna_dIr_dModel.C_Ir_IrGlobal (dtb__357))) (B_dData_dList.C_List__x58__x58_ (dtb__356, (B_dData_dList.C_List__x58__x58_ (dtb__353, (B_dData_dList.C_List__x58__x58_ (v_mDoneCont, B_dData_dList.C_List_Nil))))))))))) else (B_dData_dResult.C_Result_Err (("machine CPS: unexpected trampoline shape: " ^ mc0))))
  | _ -> (B_dData_dResult.C_Result_Err (("machine CPS: unexpected trampoline shape: " ^ mc0)))
)
  | _ -> (B_dData_dResult.C_Result_Err (("machine CPS: unexpected trampoline shape: " ^ mc0)))
)
  | _ -> (B_dData_dResult.C_Result_Err (("machine CPS: unexpected trampoline shape: " ^ mc0)))
)
  | Vuna_dIr_dModel.C_Ir_IrCast (dtb__358, dtb__359, dtb__360) -> (match ((v_mTrampolineBody mc0) dtb__360) with
  | B_dData_dResult.C_Result_Err (dtb__361) -> (B_dData_dResult.C_Result_Err (dtb__361))
  | B_dData_dResult.C_Result_Ok (dtb__362) -> (B_dData_dResult.C_Result_Ok ((Vuna_dIr_dModel.C_Ir_IrCast (dtb__358, dtb__359, dtb__362))))
  | _ -> failwith "DT: impossible branch"
)
  | Vuna_dIr_dModel.C_Ir_IrLam (dtb__363, dtb__364, dtb__365) -> (match ((v_mTrampolineBody mc0) dtb__365) with
  | B_dData_dResult.C_Result_Err (dtb__366) -> (B_dData_dResult.C_Result_Err (dtb__366))
  | B_dData_dResult.C_Result_Ok (dtb__367) -> (B_dData_dResult.C_Result_Ok ((Vuna_dIr_dModel.C_Ir_IrLam (dtb__363, dtb__364, dtb__367))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> (B_dData_dResult.C_Result_Err (("machine CPS: unexpected trampoline shape: " ^ mc0)))
))

# 897 "Vuna/Ir/Cps.vuna"
let v_mBodyOf = (fun (d : Vuna_dIr_dModel.t_IrDef) -> (match (Vuna_dIr_dModel.v_irDefBody d) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__368) -> dtb__368
  | B_dData_dMaybe.C_Maybe_Nothing -> (Vuna_dIr_dModel.C_Ir_IrInt (0))
  | _ -> failwith "DT: impossible branch"
))

# 907 "Vuna/Ir/Cps.vuna"
let rec v_defArities = (fun (fuel : int) (ds : Vuna_dIr_dModel.t_IrDef B_dData_dList.t_List) -> (if (fuel <= 0) then B_dData_dList.C_List_Nil else (match ds with
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | B_dData_dList.C_List__x58__x58_ (dtb__369, dtb__370) -> (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = (Vuna_dIr_dModel.v_irDefName dtb__369); B_dData_dPair.f_Pair_second = (Vuna_dIr_dModel.v_irDefArity dtb__369) }, ((v_defArities (fuel - 1)) dtb__370)))
  | _ -> failwith "DT: impossible branch"
)))

# 916 "Vuna/Ir/Cps.vuna"
let rec v_defSigs = (fun (fuel : int) (ds : Vuna_dIr_dModel.t_IrDef B_dData_dList.t_List) -> (if (fuel <= 0) then B_dData_dList.C_List_Nil else (match ds with
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | B_dData_dList.C_List__x58__x58_ (dtb__371, dtb__372) -> (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = (Vuna_dIr_dModel.v_irDefName dtb__371); B_dData_dPair.f_Pair_second = (Vuna_dIr_dModel.v_irDefTy dtb__371) }, ((v_defSigs (fuel - 1)) dtb__372)))
  | _ -> failwith "DT: impossible branch"
)))

# 925 "Vuna/Ir/Cps.vuna"
let v_handlerTables = (fun (fuel : int) (ds : Vuna_dIr_dModel.t_IrDef B_dData_dList.t_List) -> { f_HandlerTables_htArities = ((v_defArities fuel) ds); f_HandlerTables_htSigs = ((v_defSigs fuel) ds) })

# 928 "Vuna/Ir/Cps.vuna"
let rec v_arityOf = (fun (mc0 : (string, int) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc1 : string) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__373, dtb__374) -> (if ((B_dData_dPair.v_firstOf dtb__373) = mc1) then (B_dData_dPair.v_secondOf dtb__373) else ((v_arityOf dtb__374) mc1))
  | B_dData_dList.C_List_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))

# 932 "Vuna/Ir/Cps.vuna"
let rec v_sigOf = (fun (mc0 : (string, Vuna_dIr_dModel.t_IrTy B_dData_dMaybe.t_Maybe) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc1 : string) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__375, dtb__376) -> (if ((B_dData_dPair.v_firstOf dtb__375) = mc1) then (B_dData_dPair.v_secondOf dtb__375) else ((v_sigOf dtb__376) mc1))
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 936 "Vuna/Ir/Cps.vuna"
let rec v_funArity = (fun (mc0 : Vuna_dIr_dModel.t_IrTy) -> (match mc0 with
  | Vuna_dIr_dModel.C_IrTy_IrTyFun (dtb__377, dtb__378) -> (1 + (v_funArity dtb__378))
  | _ -> 0
))

# 940 "Vuna/Ir/Cps.vuna"
let rec v_funResult = (fun (mc0 : Vuna_dIr_dModel.t_IrTy) -> (match mc0 with
  | Vuna_dIr_dModel.C_IrTy_IrTyFun (dtb__379, dtb__380) -> (v_funResult dtb__380)
  | _ -> mc0
))

# 944 "Vuna/Ir/Cps.vuna"
let v_isFunTy = (fun (mc0 : Vuna_dIr_dModel.t_IrTy) -> (match mc0 with
  | Vuna_dIr_dModel.C_IrTy_IrTyFun (dtb__381, dtb__382) -> true
  | _ -> false
))

# 951 "Vuna/Ir/Cps.vuna"
let v_isClauseTy = (fun (mc0 : Vuna_dIr_dModel.t_IrTy) -> (match mc0 with
  | Vuna_dIr_dModel.C_IrTy_IrTyFun (dtb__383, dtb__384) -> (match dtb__384 with
  | Vuna_dIr_dModel.C_IrTy_IrTyFun (dtb__385, dtb__386) -> (v_isFunTy dtb__385)
  | _ -> false
)
  | _ -> false
))

# 960 "Vuna/Ir/Cps.vuna"
let rec v_hasClauseParam = (fun (mc0 : Vuna_dIr_dModel.t_IrTy) -> (match mc0 with
  | Vuna_dIr_dModel.C_IrTy_IrTyFun (dtb__387, dtb__388) -> (if (v_isClauseTy dtb__387) then true else (v_hasClauseParam dtb__388))
  | _ -> false
))

# 956 "Vuna/Ir/Cps.vuna"
let v_isHandlerCombinatorTy = (fun (ty : Vuna_dIr_dModel.t_IrTy) -> (if (if ((v_funArity ty) >= 2) then (v_isEffResultTy (B_dData_dMaybe.C_Maybe_Just ((v_funResult ty)))) else false) then (v_hasClauseParam ty) else false))

# 966 "Vuna/Ir/Cps.vuna"
let v_isCoreHandleCombinator = (fun (n : string) -> (if (if (if (if (if (if (if (if (if (n = "Base.Effect.Core.handleCore") then true else (n = "Base.Effect.Core.handleCoreAt")) then true else (n = "Base.Effect.Core.handleCoreLin")) then true else (n = "Base.Effect.Core.handleWith")) then true else (n = "Base.Effect.Core.handleWithAt")) then true else (n = "Base.Effect.Core.handleCoreId")) then true else (n = "Base.Effect.Core.handleCoreAtId")) then true else (n = "Base.Effect.Core.handleCoreLinId")) then true else (n = "Base.Effect.Core.handleWithId")) then true else (n = "Base.Effect.Core.handleWithAtId")))

# 986 "Vuna/Ir/Cps.vuna"
let v_isHandleCombinator = (fun (t : t_HandlerTables) (n : string) -> (match ((v_sigOf (t).f_HandlerTables_htSigs) n) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__389) -> (if ((v_funArity dtb__389) = 0) then (v_isCoreHandleCombinator n) else (if (v_isHandlerCombinatorTy dtb__389) then true else (v_isCoreHandleCombinator n)))
  | B_dData_dMaybe.C_Maybe_Nothing -> (v_isCoreHandleCombinator n)
  | _ -> failwith "DT: impossible branch"
))

# 996 "Vuna/Ir/Cps.vuna"
let v_clauseArityOf = (fun (t : t_HandlerTables) (n : string) -> (match ((v_sigOf (t).f_HandlerTables_htSigs) n) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__390) -> (if ((v_funArity dtb__390) > 0) then (v_funArity dtb__390) else ((v_arityOf (t).f_HandlerTables_htArities) n))
  | B_dData_dMaybe.C_Maybe_Nothing -> ((v_arityOf (t).f_HandlerTables_htArities) n)
  | _ -> failwith "DT: impossible branch"
))

# 1002 "Vuna/Ir/Cps.vuna"
let v_isClauseGlobal = (fun (t : t_HandlerTables) (n : string) -> (match ((v_sigOf (t).f_HandlerTables_htSigs) n) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__391) -> (if ((v_funArity dtb__391) > 0) then (v_isClauseTy dtb__391) else (((v_arityOf (t).f_HandlerTables_htArities) n) >= 2))
  | B_dData_dMaybe.C_Maybe_Nothing -> (((v_arityOf (t).f_HandlerTables_htArities) n) >= 2)
  | _ -> failwith "DT: impossible branch"
))

# 1025 "Vuna/Ir/Cps.vuna"
let rec v_lenOf = (fun xs -> (match xs with
  | B_dData_dList.C_List_Nil -> 0
  | B_dData_dList.C_List__x58__x58_ (dtb__392, dtb__393) -> (1 + (v_lenOf dtb__393))
  | _ -> failwith "DT: impossible branch"
))

# 1031 "Vuna/Ir/Cps.vuna"
let v_fuelOf = (fun (_u : Vuna_dIr_dModel.t_Ir B_dData_dList.t_List) -> 1)

# 1008 "Vuna/Ir/Cps.vuna"
let rec v_clauseGlobals = (fun (t : t_HandlerTables) (args : Vuna_dIr_dModel.t_Ir B_dData_dList.t_List) -> (if ((v_fuelOf args) <= 0) then B_dData_dList.C_List_Nil else (match args with
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | B_dData_dList.C_List__x58__x58_ (dtb__394, dtb__395) -> (match dtb__394 with
  | Vuna_dIr_dModel.C_Ir_IrGlobal (dtb__396) -> (if (if ((v_isClauseGlobal t) dtb__396) then (((v_clauseArityOf t) dtb__396) >= 2) else false) then (B_dData_dList.C_List__x58__x58_ (dtb__396, ((v_clauseGlobals t) dtb__395))) else ((v_clauseGlobals t) dtb__395))
  | _ -> ((fun nd_uscrut5 -> (match nd_uscrut5 with
  | { B_dData_dPair.f_Pair_first = dtb__397; B_dData_dPair.f_Pair_second = dtb__398 } -> (match dtb__397 with
  | Vuna_dIr_dModel.C_Ir_IrGlobal (dtb__399) -> (if (if ((v_isClauseGlobal t) dtb__399) then ((((v_clauseArityOf t) dtb__399) - (v_lenOf dtb__398)) >= 2) else false) then (B_dData_dList.C_List__x58__x58_ (dtb__399, ((v_clauseGlobals t) dtb__395))) else ((v_clauseGlobals t) dtb__395))
  | _ -> ((v_clauseGlobals t) dtb__395)
)
  | _ -> failwith "DT: impossible branch"
)) (v_flattenApp dtb__394))
)
  | _ -> failwith "DT: impossible branch"
)))

# 1034 "Vuna/Ir/Cps.vuna"
let rec v_collectHandlerGlobals = (fun (t : t_HandlerTables) (fuel : int) (e : Vuna_dIr_dModel.t_Ir) -> (if (fuel <= 0) then B_dData_dList.C_List_Nil else (match e with
  | Vuna_dIr_dModel.C_Ir_IrApp (dtb__400, dtb__401, dtb__402) -> ((fun p -> ((fun head -> ((fun args -> ((fun here -> ((B_dData_dList.v_append here) ((B_dData_dList.v_append (((v_collectHandlerGlobals t) (fuel - 1)) head)) (((v_collectHandlerGlobalsList t) (fuel - 1)) args)))) (match head with
  | Vuna_dIr_dModel.C_Ir_IrGlobal (dtb__403) -> (if ((v_isHandleCombinator t) dtb__403) then ((v_clauseGlobals t) args) else B_dData_dList.C_List_Nil)
  | _ -> B_dData_dList.C_List_Nil
))) (B_dData_dPair.v_secondOf p))) (B_dData_dPair.v_firstOf p))) (v_flattenApp e))
  | Vuna_dIr_dModel.C_Ir_IrCtor (dtb__404, dtb__405, dtb__406, dtb__407) -> (((v_collectHandlerGlobalsList t) (fuel - 1)) dtb__407)
  | Vuna_dIr_dModel.C_Ir_IrRecord (dtb__408, dtb__409, dtb__410) -> (((v_collectHandlerGlobalsFields t) (fuel - 1)) dtb__410)
  | Vuna_dIr_dModel.C_Ir_IrProj (dtb__411, dtb__412, dtb__413, dtb__414) -> (((v_collectHandlerGlobals t) (fuel - 1)) dtb__411)
  | Vuna_dIr_dModel.C_Ir_IrRecUpd (dtb__415, dtb__416, dtb__417, dtb__418) -> ((B_dData_dList.v_append (((v_collectHandlerGlobals t) (fuel - 1)) dtb__415)) (((v_collectHandlerGlobalsFields t) (fuel - 1)) dtb__417))
  | Vuna_dIr_dModel.C_Ir_IrRtApp (dtb__419, dtb__420) -> (((v_collectHandlerGlobalsList t) (fuel - 1)) dtb__420)
  | Vuna_dIr_dModel.C_Ir_IrCast (dtb__421, dtb__422, dtb__423) -> (((v_collectHandlerGlobals t) (fuel - 1)) dtb__423)
  | Vuna_dIr_dModel.C_Ir_IrLet (dtb__424, dtb__425, dtb__426) -> ((B_dData_dList.v_append (((v_collectHandlerGlobals t) (fuel - 1)) dtb__425)) (((v_collectHandlerGlobals t) (fuel - 1)) dtb__426))
  | Vuna_dIr_dModel.C_Ir_IrLam (dtb__427, dtb__428, dtb__429) -> (((v_collectHandlerGlobals t) (fuel - 1)) dtb__429)
  | Vuna_dIr_dModel.C_Ir_IrIf (dtb__430, dtb__431, dtb__432) -> ((B_dData_dList.v_append (((v_collectHandlerGlobals t) (fuel - 1)) dtb__430)) ((B_dData_dList.v_append (((v_collectHandlerGlobals t) (fuel - 1)) dtb__431)) (((v_collectHandlerGlobals t) (fuel - 1)) dtb__432)))
  | Vuna_dIr_dModel.C_Ir_IrCase (dtb__433, dtb__434, dtb__435, dtb__436) -> ((B_dData_dList.v_append (((v_collectHandlerGlobals t) (fuel - 1)) dtb__435)) (((v_collectHandlerGlobalsAlts t) (fuel - 1)) dtb__436))
  | Vuna_dIr_dModel.C_Ir_IrNatCase (dtb__437, dtb__438, dtb__439, dtb__440, dtb__441) -> ((B_dData_dList.v_append (((v_collectHandlerGlobals t) (fuel - 1)) dtb__437)) ((B_dData_dList.v_append (((v_collectHandlerGlobalsAltM t) (fuel - 1)) dtb__439)) ((B_dData_dList.v_append (((v_collectHandlerGlobalsAltM t) (fuel - 1)) dtb__440)) (((v_collectHandlerGlobalsAltM t) (fuel - 1)) dtb__441))))
  | Vuna_dIr_dModel.C_Ir_IrConcatMany (dtb__442) -> (((v_collectHandlerGlobalsList t) (fuel - 1)) dtb__442)
  | Vuna_dIr_dModel.C_Ir_IrEffThunk (dtb__443, dtb__444, dtb__445, dtb__446, dtb__447) -> (((v_collectHandlerGlobals t) (fuel - 1)) dtb__447)
  | _ -> B_dData_dList.C_List_Nil
)))
# 1065 "Vuna/Ir/Cps.vuna"
and v_collectHandlerGlobalsList = (fun (t : t_HandlerTables) (fuel : int) (xs : Vuna_dIr_dModel.t_Ir B_dData_dList.t_List) -> (if (fuel <= 0) then B_dData_dList.C_List_Nil else (match xs with
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | B_dData_dList.C_List__x58__x58_ (dtb__448, dtb__449) -> ((B_dData_dList.v_append (((v_collectHandlerGlobals t) (fuel - 1)) dtb__448)) (((v_collectHandlerGlobalsList t) (fuel - 1)) dtb__449))
  | _ -> failwith "DT: impossible branch"
)))
# 1074 "Vuna/Ir/Cps.vuna"
and v_collectHandlerGlobalsFields = (fun (t : t_HandlerTables) (fuel : int) (fs : (string, Vuna_dIr_dModel.t_Ir) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (if (fuel <= 0) then B_dData_dList.C_List_Nil else (match fs with
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | B_dData_dList.C_List__x58__x58_ (dtb__450, dtb__451) -> ((B_dData_dList.v_append (((v_collectHandlerGlobals t) (fuel - 1)) (B_dData_dPair.v_secondOf dtb__450))) (((v_collectHandlerGlobalsFields t) (fuel - 1)) dtb__451))
  | _ -> failwith "DT: impossible branch"
)))
# 1083 "Vuna/Ir/Cps.vuna"
and v_collectHandlerGlobalsAlts = (fun (t : t_HandlerTables) (fuel : int) (alts : Vuna_dIr_dModel.t_IrAlt B_dData_dList.t_List) -> (if (fuel <= 0) then B_dData_dList.C_List_Nil else (match alts with
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | B_dData_dList.C_List__x58__x58_ (dtb__452, dtb__453) -> ((B_dData_dList.v_append (((v_collectHandlerGlobals t) (fuel - 1)) (dtb__452).Vuna_dIr_dModel.f_IrAlt_irAltBody)) (((v_collectHandlerGlobalsAlts t) (fuel - 1)) dtb__453))
  | _ -> failwith "DT: impossible branch"
)))
# 1092 "Vuna/Ir/Cps.vuna"
and v_collectHandlerGlobalsAltM = (fun (t : t_HandlerTables) (fuel : int) (m : Vuna_dIr_dModel.t_IrAlt B_dData_dMaybe.t_Maybe) -> (if (fuel <= 0) then B_dData_dList.C_List_Nil else (match m with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dList.C_List_Nil
  | B_dData_dMaybe.C_Maybe_Just (dtb__454) -> (((v_collectHandlerGlobals t) (fuel - 1)) (dtb__454).Vuna_dIr_dModel.f_IrAlt_irAltBody)
  | _ -> failwith "DT: impossible branch"
)))

# 1107 "Vuna/Ir/Cps.vuna"
let rec v_collectHandleOpsDefsGo = (fun (fuel : int) (t : t_HandlerTables) (ds : Vuna_dIr_dModel.t_IrDef B_dData_dList.t_List) -> (if (fuel <= 0) then B_dData_dList.C_List_Nil else (match ds with
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | B_dData_dList.C_List__x58__x58_ (dtb__455, dtb__456) -> ((B_dData_dList.v_append (((v_collectHandlerGlobals t) (fuel - 1)) (v_mBodyOf dtb__455))) (((v_collectHandleOpsDefsGo (fuel - 1)) t) dtb__456))
  | _ -> failwith "DT: impossible branch"
)))

# 1101 "Vuna/Ir/Cps.vuna"
let v_collectHandleOpsDefs = (fun (fuel : int) (ds : Vuna_dIr_dModel.t_IrDef B_dData_dList.t_List) -> ((fun tables -> (((v_collectHandleOpsDefsGo fuel) tables) ds)) ((v_handlerTables 100000) ds)))

# 1116 "Vuna/Ir/Cps.vuna"
let rec v_memName = (fun (mc0 : string) (mc1 : string B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__457, dtb__458) -> (if (mc0 = dtb__457) then true else ((v_memName mc0) dtb__458))
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 1122 "Vuna/Ir/Cps.vuna"
let v_scopedName = "Base.Effect.Core.handleScoped"

# 1125 "Vuna/Ir/Cps.vuna"
let v_selfName = "Base.Effect.Core.handleSelf"

# 1128 "Vuna/Ir/Cps.vuna"
let v_scopeName = "Base.Effect.Core.scope"

# 1131 "Vuna/Ir/Cps.vuna"
let v_cleanupPushName = "Base.Effect.Core.pushCleanup"

# 1134 "Vuna/Ir/Cps.vuna"
let v_cleanupPopName = "Base.Effect.Core.popCleanup"

# 1137 "Vuna/Ir/Cps.vuna"
let rec v_mScopedCalls = (fun (fuel : int) (rs : Vuna_dIr_dModel.t_IrBinder) (e : Vuna_dIr_dModel.t_Ir) -> (if (fuel <= 0) then e else (match e with
  | Vuna_dIr_dModel.C_Ir_IrApp (dtb__459, dtb__460, dtb__461) -> ((fun f1 -> ((fun a1 -> (match f1 with
  | Vuna_dIr_dModel.C_Ir_IrGlobal (dtb__462) -> (if (dtb__462 = v_scopedName) then (Vuna_dIr_dModel.C_Ir_IrApp (B_dData_dMaybe.C_Maybe_Nothing, (Vuna_dIr_dModel.C_Ir_IrVar (rs)), a1)) else (if (dtb__462 = v_selfName) then (Vuna_dIr_dModel.C_Ir_IrApp (B_dData_dMaybe.C_Maybe_Nothing, (Vuna_dIr_dModel.C_Ir_IrVar (rs)), (Vuna_dIr_dModel.C_Ir_IrApp (B_dData_dMaybe.C_Maybe_Nothing, (Vuna_dIr_dModel.C_Ir_IrGlobal (v_scopeName)), a1)))) else (Vuna_dIr_dModel.C_Ir_IrApp (B_dData_dMaybe.C_Maybe_Nothing, f1, a1))))
  | _ -> (Vuna_dIr_dModel.C_Ir_IrApp (B_dData_dMaybe.C_Maybe_Nothing, f1, a1))
)) (((v_mScopedCalls (fuel - 1)) rs) dtb__461))) (((v_mScopedCalls (fuel - 1)) rs) dtb__460))
  | Vuna_dIr_dModel.C_Ir_IrRtApp (dtb__463, dtb__464) -> (Vuna_dIr_dModel.C_Ir_IrRtApp (dtb__463, (((v_mScopedList (fuel - 1)) rs) dtb__464)))
  | Vuna_dIr_dModel.C_Ir_IrCtor (dtb__465, dtb__466, dtb__467, dtb__468) -> (Vuna_dIr_dModel.C_Ir_IrCtor (dtb__465, dtb__466, B_dData_dMaybe.C_Maybe_Nothing, (((v_mScopedList (fuel - 1)) rs) dtb__468)))
  | Vuna_dIr_dModel.C_Ir_IrRecord (dtb__469, dtb__470, dtb__471) -> (Vuna_dIr_dModel.C_Ir_IrRecord (dtb__469, B_dData_dMaybe.C_Maybe_Nothing, (((v_mScopedFields (fuel - 1)) rs) dtb__471)))
  | Vuna_dIr_dModel.C_Ir_IrProj (dtb__472, dtb__473, dtb__474, dtb__475) -> (Vuna_dIr_dModel.C_Ir_IrProj ((((v_mScopedCalls (fuel - 1)) rs) dtb__472), dtb__473, dtb__474, B_dData_dMaybe.C_Maybe_Nothing))
  | Vuna_dIr_dModel.C_Ir_IrRecUpd (dtb__476, dtb__477, dtb__478, dtb__479) -> (Vuna_dIr_dModel.C_Ir_IrRecUpd ((((v_mScopedCalls (fuel - 1)) rs) dtb__476), dtb__477, (((v_mScopedFields (fuel - 1)) rs) dtb__478), B_dData_dMaybe.C_Maybe_Nothing))
  | Vuna_dIr_dModel.C_Ir_IrCast (dtb__480, dtb__481, dtb__482) -> (Vuna_dIr_dModel.C_Ir_IrCast (dtb__480, dtb__481, (((v_mScopedCalls (fuel - 1)) rs) dtb__482)))
  | Vuna_dIr_dModel.C_Ir_IrLet (dtb__483, dtb__484, dtb__485) -> (Vuna_dIr_dModel.C_Ir_IrLet (dtb__483, (((v_mScopedCalls (fuel - 1)) rs) dtb__484), (((v_mScopedCalls (fuel - 1)) rs) dtb__485)))
  | Vuna_dIr_dModel.C_Ir_IrLam (dtb__486, dtb__487, dtb__488) -> (Vuna_dIr_dModel.C_Ir_IrLam (dtb__486, dtb__487, (((v_mScopedCalls (fuel - 1)) rs) dtb__488)))
  | Vuna_dIr_dModel.C_Ir_IrIf (dtb__489, dtb__490, dtb__491) -> (Vuna_dIr_dModel.C_Ir_IrIf ((((v_mScopedCalls (fuel - 1)) rs) dtb__489), (((v_mScopedCalls (fuel - 1)) rs) dtb__490), (((v_mScopedCalls (fuel - 1)) rs) dtb__491)))
  | Vuna_dIr_dModel.C_Ir_IrCase (dtb__492, dtb__493, dtb__494, dtb__495) -> (Vuna_dIr_dModel.C_Ir_IrCase (dtb__492, B_dData_dMaybe.C_Maybe_Nothing, (((v_mScopedCalls (fuel - 1)) rs) dtb__494), (((v_mScopedAlts (fuel - 1)) rs) dtb__495)))
  | Vuna_dIr_dModel.C_Ir_IrNatCase (dtb__496, dtb__497, dtb__498, dtb__499, dtb__500) -> (Vuna_dIr_dModel.C_Ir_IrNatCase ((((v_mScopedCalls (fuel - 1)) rs) dtb__496), dtb__497, (((v_mScopedAltM (fuel - 1)) rs) dtb__498), (((v_mScopedAltM (fuel - 1)) rs) dtb__499), (((v_mScopedAltM (fuel - 1)) rs) dtb__500)))
  | Vuna_dIr_dModel.C_Ir_IrConcatMany (dtb__501) -> (Vuna_dIr_dModel.C_Ir_IrConcatMany ((((v_mScopedList (fuel - 1)) rs) dtb__501)))
  | Vuna_dIr_dModel.C_Ir_IrEffThunk (dtb__502, dtb__503, dtb__504, dtb__505, dtb__506) -> (Vuna_dIr_dModel.C_Ir_IrEffThunk (dtb__502, dtb__503, dtb__504, dtb__505, (((v_mScopedCalls (fuel - 1)) rs) dtb__506)))
  | _ -> e
)))
# 1165 "Vuna/Ir/Cps.vuna"
and v_mScopedList = (fun (fuel : int) (rs : Vuna_dIr_dModel.t_IrBinder) (xs : Vuna_dIr_dModel.t_Ir B_dData_dList.t_List) -> (if (fuel <= 0) then xs else (match xs with
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | B_dData_dList.C_List__x58__x58_ (dtb__507, dtb__508) -> (B_dData_dList.C_List__x58__x58_ ((((v_mScopedCalls (fuel - 1)) rs) dtb__507), (((v_mScopedList (fuel - 1)) rs) dtb__508)))
  | _ -> failwith "DT: impossible branch"
)))
# 1174 "Vuna/Ir/Cps.vuna"
and v_mScopedFields = (fun (fuel : int) (rs : Vuna_dIr_dModel.t_IrBinder) (fs : (string, Vuna_dIr_dModel.t_Ir) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (if (fuel <= 0) then fs else (match fs with
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | B_dData_dList.C_List__x58__x58_ (dtb__509, dtb__510) -> (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = (B_dData_dPair.v_firstOf dtb__509); B_dData_dPair.f_Pair_second = (((v_mScopedCalls (fuel - 1)) rs) (B_dData_dPair.v_secondOf dtb__509)) }, (((v_mScopedFields (fuel - 1)) rs) dtb__510)))
  | _ -> failwith "DT: impossible branch"
)))
# 1183 "Vuna/Ir/Cps.vuna"
and v_mScopedAlts = (fun (fuel : int) (rs : Vuna_dIr_dModel.t_IrBinder) (alts : Vuna_dIr_dModel.t_IrAlt B_dData_dList.t_List) -> (if (fuel <= 0) then alts else (match alts with
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | B_dData_dList.C_List__x58__x58_ (dtb__511, dtb__512) -> (B_dData_dList.C_List__x58__x58_ ({ Vuna_dIr_dModel.f_IrAlt_irAltCtor = (dtb__511).Vuna_dIr_dModel.f_IrAlt_irAltCtor; Vuna_dIr_dModel.f_IrAlt_irAltBinders = (dtb__511).Vuna_dIr_dModel.f_IrAlt_irAltBinders; Vuna_dIr_dModel.f_IrAlt_irAltBody = (((v_mScopedCalls (fuel - 1)) rs) (dtb__511).Vuna_dIr_dModel.f_IrAlt_irAltBody) }, (((v_mScopedAlts (fuel - 1)) rs) dtb__512)))
  | _ -> failwith "DT: impossible branch"
)))
# 1192 "Vuna/Ir/Cps.vuna"
and v_mScopedAltM = (fun (fuel : int) (rs : Vuna_dIr_dModel.t_IrBinder) (m : Vuna_dIr_dModel.t_IrAlt B_dData_dMaybe.t_Maybe) -> (if (fuel <= 0) then m else (match m with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb__513) -> (B_dData_dMaybe.C_Maybe_Just ({ Vuna_dIr_dModel.f_IrAlt_irAltCtor = (dtb__513).Vuna_dIr_dModel.f_IrAlt_irAltCtor; Vuna_dIr_dModel.f_IrAlt_irAltBinders = (dtb__513).Vuna_dIr_dModel.f_IrAlt_irAltBinders; Vuna_dIr_dModel.f_IrAlt_irAltBody = (((v_mScopedCalls (fuel - 1)) rs) (dtb__513).Vuna_dIr_dModel.f_IrAlt_irAltBody) }))
  | _ -> failwith "DT: impossible branch"
)))

# 733 "Vuna/Ir/Cps.vuna"
let rec v_mHandlerLam = (fun (fuel : int) (bs : Vuna_dIr_dModel.t_IrBinder B_dData_dList.t_List) (body : Vuna_dIr_dModel.t_Ir) -> (match (v_mResumption bs) with
  | B_dData_dMaybe.C_Maybe_Nothing -> (Vuna_dIr_dModel.C_Ir_IrLam (bs, B_dData_dMaybe.C_Maybe_Nothing, ((v_mHandlers (fuel - 1)) body)))
  | B_dData_dMaybe.C_Maybe_Just (dtb__514) -> ((fun kd -> ((fun rs -> (Vuna_dIr_dModel.C_Ir_IrLam (((B_dData_dList.v_append bs) (B_dData_dList.C_List__x58__x58_ (kd, (B_dData_dList.C_List__x58__x58_ (rs, B_dData_dList.C_List_Nil))))), B_dData_dMaybe.C_Maybe_Nothing, (((v_mScopedCalls (fuel - 1)) rs) ((((v_mCps (fuel - 1)) dtb__514) (Vuna_dIr_dModel.C_Ir_IrVar (kd))) body))))) (v_mFreshR fuel))) (v_mFreshTailK fuel))
  | _ -> failwith "DT: impossible branch"
))
# 746 "Vuna/Ir/Cps.vuna"
and v_mListH = (fun (fuel : int) (xs : Vuna_dIr_dModel.t_Ir B_dData_dList.t_List) -> (if (fuel <= 0) then xs else (match xs with
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | B_dData_dList.C_List__x58__x58_ (dtb__515, dtb__516) -> (B_dData_dList.C_List__x58__x58_ (((v_mHandlers (fuel - 1)) dtb__515), ((v_mListH (fuel - 1)) dtb__516)))
  | _ -> failwith "DT: impossible branch"
)))
# 755 "Vuna/Ir/Cps.vuna"
and v_mFieldsH = (fun (fuel : int) (fs : (string, Vuna_dIr_dModel.t_Ir) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (if (fuel <= 0) then fs else (match fs with
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | B_dData_dList.C_List__x58__x58_ (dtb__517, dtb__518) -> (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = (B_dData_dPair.v_firstOf dtb__517); B_dData_dPair.f_Pair_second = ((v_mHandlers (fuel - 1)) (B_dData_dPair.v_secondOf dtb__517)) }, ((v_mFieldsH (fuel - 1)) dtb__518)))
  | _ -> failwith "DT: impossible branch"
)))
# 764 "Vuna/Ir/Cps.vuna"
and v_mHandlers = (fun (fuel : int) (e : Vuna_dIr_dModel.t_Ir) -> (if (fuel <= 0) then e else (match e with
  | Vuna_dIr_dModel.C_Ir_IrLam (dtb__519, dtb__520, dtb__521) -> (((v_mHandlerLam (fuel - 1)) dtb__519) dtb__521)
  | Vuna_dIr_dModel.C_Ir_IrCtor (dtb__522, dtb__523, dtb__524, dtb__525) -> (Vuna_dIr_dModel.C_Ir_IrCtor (dtb__522, dtb__523, B_dData_dMaybe.C_Maybe_Nothing, ((v_mListH (fuel - 1)) dtb__525)))
  | Vuna_dIr_dModel.C_Ir_IrRecord (dtb__526, dtb__527, dtb__528) -> (Vuna_dIr_dModel.C_Ir_IrRecord (dtb__526, B_dData_dMaybe.C_Maybe_Nothing, ((v_mFieldsH (fuel - 1)) dtb__528)))
  | Vuna_dIr_dModel.C_Ir_IrProj (dtb__529, dtb__530, dtb__531, dtb__532) -> (Vuna_dIr_dModel.C_Ir_IrProj (((v_mHandlers (fuel - 1)) dtb__529), dtb__530, dtb__531, B_dData_dMaybe.C_Maybe_Nothing))
  | Vuna_dIr_dModel.C_Ir_IrRecUpd (dtb__533, dtb__534, dtb__535, dtb__536) -> (Vuna_dIr_dModel.C_Ir_IrRecUpd (((v_mHandlers (fuel - 1)) dtb__533), dtb__534, ((v_mFieldsH (fuel - 1)) dtb__535), B_dData_dMaybe.C_Maybe_Nothing))
  | Vuna_dIr_dModel.C_Ir_IrRtApp (dtb__537, dtb__538) -> (Vuna_dIr_dModel.C_Ir_IrRtApp (dtb__537, ((v_mListH (fuel - 1)) dtb__538)))
  | Vuna_dIr_dModel.C_Ir_IrCast (dtb__539, dtb__540, dtb__541) -> (Vuna_dIr_dModel.C_Ir_IrCast (dtb__539, dtb__540, ((v_mHandlers (fuel - 1)) dtb__541)))
  | Vuna_dIr_dModel.C_Ir_IrLet (dtb__542, dtb__543, dtb__544) -> (Vuna_dIr_dModel.C_Ir_IrLet (dtb__542, ((v_mHandlers (fuel - 1)) dtb__543), ((v_mHandlers (fuel - 1)) dtb__544)))
  | Vuna_dIr_dModel.C_Ir_IrApp (dtb__545, dtb__546, dtb__547) -> (Vuna_dIr_dModel.C_Ir_IrApp (B_dData_dMaybe.C_Maybe_Nothing, ((v_mHandlers (fuel - 1)) dtb__546), ((v_mHandlers (fuel - 1)) dtb__547)))
  | Vuna_dIr_dModel.C_Ir_IrIf (dtb__548, dtb__549, dtb__550) -> (Vuna_dIr_dModel.C_Ir_IrIf (((v_mHandlers (fuel - 1)) dtb__548), ((v_mHandlers (fuel - 1)) dtb__549), ((v_mHandlers (fuel - 1)) dtb__550)))
  | Vuna_dIr_dModel.C_Ir_IrCase (dtb__551, dtb__552, dtb__553, dtb__554) -> (Vuna_dIr_dModel.C_Ir_IrCase (dtb__551, B_dData_dMaybe.C_Maybe_Nothing, ((v_mHandlers (fuel - 1)) dtb__553), ((v_mHandlersAlts (fuel - 1)) dtb__554)))
  | Vuna_dIr_dModel.C_Ir_IrNatCase (dtb__555, dtb__556, dtb__557, dtb__558, dtb__559) -> (Vuna_dIr_dModel.C_Ir_IrNatCase (((v_mHandlers (fuel - 1)) dtb__555), dtb__556, ((v_mHandlersAltM (fuel - 1)) dtb__557), ((v_mHandlersAltM (fuel - 1)) dtb__558), ((v_mHandlersAltM (fuel - 1)) dtb__559)))
  | Vuna_dIr_dModel.C_Ir_IrConcatMany (dtb__560) -> (Vuna_dIr_dModel.C_Ir_IrConcatMany (((v_mListH (fuel - 1)) dtb__560)))
  | Vuna_dIr_dModel.C_Ir_IrEffThunk (dtb__561, dtb__562, dtb__563, dtb__564, dtb__565) -> (Vuna_dIr_dModel.C_Ir_IrEffThunk (dtb__561, dtb__562, dtb__563, dtb__564, ((v_mHandlers (fuel - 1)) dtb__565)))
  | _ -> e
)))
# 786 "Vuna/Ir/Cps.vuna"
and v_mHandlersAlts = (fun (fuel : int) (alts : Vuna_dIr_dModel.t_IrAlt B_dData_dList.t_List) -> (if (fuel <= 0) then alts else (match alts with
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | B_dData_dList.C_List__x58__x58_ (dtb__566, dtb__567) -> (B_dData_dList.C_List__x58__x58_ ({ Vuna_dIr_dModel.f_IrAlt_irAltCtor = (dtb__566).Vuna_dIr_dModel.f_IrAlt_irAltCtor; Vuna_dIr_dModel.f_IrAlt_irAltBinders = (dtb__566).Vuna_dIr_dModel.f_IrAlt_irAltBinders; Vuna_dIr_dModel.f_IrAlt_irAltBody = ((v_mHandlers (fuel - 1)) (dtb__566).Vuna_dIr_dModel.f_IrAlt_irAltBody) }, ((v_mHandlersAlts (fuel - 1)) dtb__567)))
  | _ -> failwith "DT: impossible branch"
)))
# 795 "Vuna/Ir/Cps.vuna"
and v_mHandlersAltM = (fun (fuel : int) (m : Vuna_dIr_dModel.t_IrAlt B_dData_dMaybe.t_Maybe) -> (if (fuel <= 0) then m else (match m with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb__568) -> (B_dData_dMaybe.C_Maybe_Just ({ Vuna_dIr_dModel.f_IrAlt_irAltCtor = (dtb__568).Vuna_dIr_dModel.f_IrAlt_irAltCtor; Vuna_dIr_dModel.f_IrAlt_irAltBinders = (dtb__568).Vuna_dIr_dModel.f_IrAlt_irAltBinders; Vuna_dIr_dModel.f_IrAlt_irAltBody = ((v_mHandlers (fuel - 1)) (dtb__568).Vuna_dIr_dModel.f_IrAlt_irAltBody) }))
  | _ -> failwith "DT: impossible branch"
)))

# 1201 "Vuna/Ir/Cps.vuna"
let rec v_lastBinderOf = (fun (bs : Vuna_dIr_dModel.t_IrBinder B_dData_dList.t_List) -> (match bs with
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dList.C_List__x58__x58_ (dtb__569, dtb__570) -> (match dtb__570 with
  | B_dData_dList.C_List_Nil -> (B_dData_dMaybe.C_Maybe_Just (dtb__569))
  | _ -> (v_lastBinderOf dtb__570)
)
  | _ -> failwith "DT: impossible branch"
))

# 1228 "Vuna/Ir/Cps.vuna"
let v_mHandlerFun = (fun (fuel : int) (body : Vuna_dIr_dModel.t_Ir) -> (if (fuel <= 0) then body else (match body with
  | Vuna_dIr_dModel.C_Ir_IrLam (dtb__571, dtb__572, dtb__573) -> ((fun nd_uscrut5 -> (match nd_uscrut5 with
  | B_dData_dList.C_List__x58__x58_ (dtb__574, dtb__575) -> (match dtb__575 with
  | B_dData_dList.C_List__x58__x58_ (dtb__576, dtb__577) -> ((fun kd -> ((fun rs -> (Vuna_dIr_dModel.C_Ir_IrLam (((B_dData_dList.v_append dtb__571) (B_dData_dList.C_List__x58__x58_ (kd, (B_dData_dList.C_List__x58__x58_ (rs, B_dData_dList.C_List_Nil))))), B_dData_dMaybe.C_Maybe_Nothing, (((v_mScopedCalls (fuel - 1)) rs) ((((v_mCps (fuel - 1)) dtb__576) (Vuna_dIr_dModel.C_Ir_IrVar (kd))) dtb__573))))) (v_mFreshR fuel))) (v_mFreshK fuel))
  | _ -> body
)
  | _ -> body
)) (v_runtimeBinders dtb__571))
  | _ -> body
)))

# 1283 "Vuna/Ir/Cps.vuna"
let v_isContBinder = (fun (b : Vuna_dIr_dModel.t_IrBinder) -> ((fun n -> (if (if ((B_dData_dString.v_startsWith "__cpsK") n) then true else ((B_dData_dString.v_startsWith "__mchTK") n)) then true else ((B_dData_dString.v_startsWith "__mchK") n))) (v_mBNameText (b).Vuna_dIr_dModel.f_IrBinder_irBinderName)))

# 1289 "Vuna/Ir/Cps.vuna"
let rec v_mApplys = (fun (fuel : int) (e : Vuna_dIr_dModel.t_Ir) -> (if (fuel <= 0) then e else (match e with
  | Vuna_dIr_dModel.C_Ir_IrApp (dtb__578, dtb__579, dtb__580) -> (match dtb__579 with
  | Vuna_dIr_dModel.C_Ir_IrVar (dtb__581) -> (if (v_isContBinder dtb__581) then (Vuna_dIr_dModel.C_Ir_IrRtApp (v_irMApplyName, (B_dData_dList.C_List__x58__x58_ ((Vuna_dIr_dModel.C_Ir_IrVar (dtb__581)), (B_dData_dList.C_List__x58__x58_ (((v_mApplys (fuel - 1)) dtb__580), B_dData_dList.C_List_Nil)))))) else (Vuna_dIr_dModel.C_Ir_IrApp (B_dData_dMaybe.C_Maybe_Nothing, ((v_mApplys (fuel - 1)) dtb__579), ((v_mApplys (fuel - 1)) dtb__580))))
  | _ -> (Vuna_dIr_dModel.C_Ir_IrApp (B_dData_dMaybe.C_Maybe_Nothing, ((v_mApplys (fuel - 1)) dtb__579), ((v_mApplys (fuel - 1)) dtb__580)))
)
  | Vuna_dIr_dModel.C_Ir_IrRtApp (dtb__582, dtb__583) -> (Vuna_dIr_dModel.C_Ir_IrRtApp (dtb__582, ((v_mApplysList (fuel - 1)) dtb__583)))
  | Vuna_dIr_dModel.C_Ir_IrCtor (dtb__584, dtb__585, dtb__586, dtb__587) -> (Vuna_dIr_dModel.C_Ir_IrCtor (dtb__584, dtb__585, B_dData_dMaybe.C_Maybe_Nothing, ((v_mApplysList (fuel - 1)) dtb__587)))
  | Vuna_dIr_dModel.C_Ir_IrRecord (dtb__588, dtb__589, dtb__590) -> (Vuna_dIr_dModel.C_Ir_IrRecord (dtb__588, B_dData_dMaybe.C_Maybe_Nothing, ((v_mApplysFields (fuel - 1)) dtb__590)))
  | Vuna_dIr_dModel.C_Ir_IrProj (dtb__591, dtb__592, dtb__593, dtb__594) -> (Vuna_dIr_dModel.C_Ir_IrProj (((v_mApplys (fuel - 1)) dtb__591), dtb__592, dtb__593, B_dData_dMaybe.C_Maybe_Nothing))
  | Vuna_dIr_dModel.C_Ir_IrRecUpd (dtb__595, dtb__596, dtb__597, dtb__598) -> (Vuna_dIr_dModel.C_Ir_IrRecUpd (((v_mApplys (fuel - 1)) dtb__595), dtb__596, ((v_mApplysFields (fuel - 1)) dtb__597), B_dData_dMaybe.C_Maybe_Nothing))
  | Vuna_dIr_dModel.C_Ir_IrCast (dtb__599, dtb__600, dtb__601) -> (Vuna_dIr_dModel.C_Ir_IrCast (dtb__599, dtb__600, ((v_mApplys (fuel - 1)) dtb__601)))
  | Vuna_dIr_dModel.C_Ir_IrLet (dtb__602, dtb__603, dtb__604) -> (Vuna_dIr_dModel.C_Ir_IrLet (dtb__602, ((v_mApplys (fuel - 1)) dtb__603), ((v_mApplys (fuel - 1)) dtb__604)))
  | Vuna_dIr_dModel.C_Ir_IrLam (dtb__605, dtb__606, dtb__607) -> (Vuna_dIr_dModel.C_Ir_IrLam (dtb__605, dtb__606, ((v_mApplys (fuel - 1)) dtb__607)))
  | Vuna_dIr_dModel.C_Ir_IrIf (dtb__608, dtb__609, dtb__610) -> (Vuna_dIr_dModel.C_Ir_IrIf (((v_mApplys (fuel - 1)) dtb__608), ((v_mApplys (fuel - 1)) dtb__609), ((v_mApplys (fuel - 1)) dtb__610)))
  | Vuna_dIr_dModel.C_Ir_IrCase (dtb__611, dtb__612, dtb__613, dtb__614) -> (Vuna_dIr_dModel.C_Ir_IrCase (dtb__611, B_dData_dMaybe.C_Maybe_Nothing, ((v_mApplys (fuel - 1)) dtb__613), ((v_mApplysAlts (fuel - 1)) dtb__614)))
  | Vuna_dIr_dModel.C_Ir_IrNatCase (dtb__615, dtb__616, dtb__617, dtb__618, dtb__619) -> (Vuna_dIr_dModel.C_Ir_IrNatCase (((v_mApplys (fuel - 1)) dtb__615), dtb__616, ((v_mApplysAltM (fuel - 1)) dtb__617), ((v_mApplysAltM (fuel - 1)) dtb__618), ((v_mApplysAltM (fuel - 1)) dtb__619)))
  | Vuna_dIr_dModel.C_Ir_IrConcatMany (dtb__620) -> (Vuna_dIr_dModel.C_Ir_IrConcatMany (((v_mApplysList (fuel - 1)) dtb__620)))
  | Vuna_dIr_dModel.C_Ir_IrEffThunk (dtb__621, dtb__622, dtb__623, dtb__624, dtb__625) -> (Vuna_dIr_dModel.C_Ir_IrEffThunk (dtb__621, dtb__622, dtb__623, dtb__624, ((v_mApplys (fuel - 1)) dtb__625)))
  | _ -> e
)))
# 1314 "Vuna/Ir/Cps.vuna"
and v_mApplysList = (fun (fuel : int) (xs : Vuna_dIr_dModel.t_Ir B_dData_dList.t_List) -> (if (fuel <= 0) then xs else (match xs with
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | B_dData_dList.C_List__x58__x58_ (dtb__626, dtb__627) -> (B_dData_dList.C_List__x58__x58_ (((v_mApplys (fuel - 1)) dtb__626), ((v_mApplysList (fuel - 1)) dtb__627)))
  | _ -> failwith "DT: impossible branch"
)))
# 1323 "Vuna/Ir/Cps.vuna"
and v_mApplysFields = (fun (fuel : int) (fs : (string, Vuna_dIr_dModel.t_Ir) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (if (fuel <= 0) then fs else (match fs with
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | B_dData_dList.C_List__x58__x58_ (dtb__628, dtb__629) -> (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = (B_dData_dPair.v_firstOf dtb__628); B_dData_dPair.f_Pair_second = ((v_mApplys (fuel - 1)) (B_dData_dPair.v_secondOf dtb__628)) }, ((v_mApplysFields (fuel - 1)) dtb__629)))
  | _ -> failwith "DT: impossible branch"
)))
# 1332 "Vuna/Ir/Cps.vuna"
and v_mApplysAlts = (fun (fuel : int) (alts : Vuna_dIr_dModel.t_IrAlt B_dData_dList.t_List) -> (if (fuel <= 0) then alts else (match alts with
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | B_dData_dList.C_List__x58__x58_ (dtb__630, dtb__631) -> (B_dData_dList.C_List__x58__x58_ ({ Vuna_dIr_dModel.f_IrAlt_irAltCtor = (dtb__630).Vuna_dIr_dModel.f_IrAlt_irAltCtor; Vuna_dIr_dModel.f_IrAlt_irAltBinders = (dtb__630).Vuna_dIr_dModel.f_IrAlt_irAltBinders; Vuna_dIr_dModel.f_IrAlt_irAltBody = ((v_mApplys (fuel - 1)) (dtb__630).Vuna_dIr_dModel.f_IrAlt_irAltBody) }, ((v_mApplysAlts (fuel - 1)) dtb__631)))
  | _ -> failwith "DT: impossible branch"
)))
# 1341 "Vuna/Ir/Cps.vuna"
and v_mApplysAltM = (fun (fuel : int) (m : Vuna_dIr_dModel.t_IrAlt B_dData_dMaybe.t_Maybe) -> (if (fuel <= 0) then m else (match m with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb__632) -> (B_dData_dMaybe.C_Maybe_Just ({ Vuna_dIr_dModel.f_IrAlt_irAltCtor = (dtb__632).Vuna_dIr_dModel.f_IrAlt_irAltCtor; Vuna_dIr_dModel.f_IrAlt_irAltBinders = (dtb__632).Vuna_dIr_dModel.f_IrAlt_irAltBinders; Vuna_dIr_dModel.f_IrAlt_irAltBody = ((v_mApplys (fuel - 1)) (dtb__632).Vuna_dIr_dModel.f_IrAlt_irAltBody) }))
  | _ -> failwith "DT: impossible branch"
)))

# 1356 "Vuna/Ir/Cps.vuna"
let rec v_mMarked = (fun (fuel : int) (e : Vuna_dIr_dModel.t_Ir) -> (if (fuel <= 0) then e else ((fun nd_uscrut2 -> (match nd_uscrut2 with
  | Vuna_dIr_dModel.C_Ir_IrEffThunk (dtb__633, dtb__634, dtb__635, dtb__636, dtb__637) -> (Vuna_dIr_dModel.C_Ir_IrEffThunk (dtb__633, dtb__634, dtb__635, dtb__636, ((v_mMarked (fuel - 1)) dtb__637)))
  | Vuna_dIr_dModel.C_Ir_IrConcatMany (dtb__638) -> (Vuna_dIr_dModel.C_Ir_IrConcatMany (((v_mMarkedList (fuel - 1)) dtb__638)))
  | Vuna_dIr_dModel.C_Ir_IrNatCase (dtb__639, dtb__640, dtb__641, dtb__642, dtb__643) -> (Vuna_dIr_dModel.C_Ir_IrNatCase (((v_mMarked (fuel - 1)) dtb__639), dtb__640, ((v_mMarkedAltM (fuel - 1)) dtb__641), ((v_mMarkedAltM (fuel - 1)) dtb__642), ((v_mMarkedAltM (fuel - 1)) dtb__643)))
  | Vuna_dIr_dModel.C_Ir_IrCase (dtb__644, dtb__645, dtb__646, dtb__647) -> (Vuna_dIr_dModel.C_Ir_IrCase (dtb__644, B_dData_dMaybe.C_Maybe_Nothing, ((v_mMarked (fuel - 1)) dtb__646), ((v_mMarkedAlts (fuel - 1)) dtb__647)))
  | Vuna_dIr_dModel.C_Ir_IrIf (dtb__648, dtb__649, dtb__650) -> (Vuna_dIr_dModel.C_Ir_IrIf (((v_mMarked (fuel - 1)) dtb__648), ((v_mMarked (fuel - 1)) dtb__649), ((v_mMarked (fuel - 1)) dtb__650)))
  | Vuna_dIr_dModel.C_Ir_IrApp (dtb__651, dtb__652, dtb__653) -> (match dtb__652 with
  | Vuna_dIr_dModel.C_Ir_IrApp (dtb__654, dtb__655, dtb__656) -> (match dtb__655 with
  | Vuna_dIr_dModel.C_Ir_IrRt (dtb__657) -> (if (dtb__657 = "@ir@m@self") then (match dtb__653 with
  | Vuna_dIr_dModel.C_Ir_IrLam (dtb__658, dtb__659, dtb__660) -> (match dtb__658 with
  | B_dData_dList.C_List__x58__x58_ (dtb__661, dtb__662) -> (match dtb__662 with
  | B_dData_dList.C_List_Nil -> (Vuna_dIr_dModel.C_Ir_IrApp (B_dData_dMaybe.C_Maybe_Nothing, (Vuna_dIr_dModel.C_Ir_IrRt (v_irMRunName)), (Vuna_dIr_dModel.C_Ir_IrApp (B_dData_dMaybe.C_Maybe_Nothing, (Vuna_dIr_dModel.C_Ir_IrApp (B_dData_dMaybe.C_Maybe_Nothing, (Vuna_dIr_dModel.C_Ir_IrRt ("@ir@m@self")), ((v_mMarked (fuel - 1)) dtb__656))), v_mDoneCont))))
  | _ -> (Vuna_dIr_dModel.C_Ir_IrApp (B_dData_dMaybe.C_Maybe_Nothing, ((v_mMarked (fuel - 1)) dtb__652), ((v_mMarked (fuel - 1)) dtb__653)))
)
  | _ -> (Vuna_dIr_dModel.C_Ir_IrApp (B_dData_dMaybe.C_Maybe_Nothing, ((v_mMarked (fuel - 1)) dtb__652), ((v_mMarked (fuel - 1)) dtb__653)))
)
  | _ -> (Vuna_dIr_dModel.C_Ir_IrApp (B_dData_dMaybe.C_Maybe_Nothing, ((v_mMarked (fuel - 1)) dtb__652), ((v_mMarked (fuel - 1)) dtb__653)))
) else (Vuna_dIr_dModel.C_Ir_IrApp (B_dData_dMaybe.C_Maybe_Nothing, ((v_mMarked (fuel - 1)) dtb__652), ((v_mMarked (fuel - 1)) dtb__653))))
  | _ -> (Vuna_dIr_dModel.C_Ir_IrApp (B_dData_dMaybe.C_Maybe_Nothing, ((v_mMarked (fuel - 1)) dtb__652), ((v_mMarked (fuel - 1)) dtb__653)))
)
  | _ -> (Vuna_dIr_dModel.C_Ir_IrApp (B_dData_dMaybe.C_Maybe_Nothing, ((v_mMarked (fuel - 1)) dtb__652), ((v_mMarked (fuel - 1)) dtb__653)))
)
  | Vuna_dIr_dModel.C_Ir_IrLet (dtb__663, dtb__664, dtb__665) -> (Vuna_dIr_dModel.C_Ir_IrLet (dtb__663, ((v_mMarked (fuel - 1)) dtb__664), ((v_mMarked (fuel - 1)) dtb__665)))
  | Vuna_dIr_dModel.C_Ir_IrCast (dtb__666, dtb__667, dtb__668) -> (Vuna_dIr_dModel.C_Ir_IrCast (dtb__666, dtb__667, ((v_mMarked (fuel - 1)) dtb__668)))
  | Vuna_dIr_dModel.C_Ir_IrRecUpd (dtb__669, dtb__670, dtb__671, dtb__672) -> (Vuna_dIr_dModel.C_Ir_IrRecUpd (((v_mMarked (fuel - 1)) dtb__669), dtb__670, ((v_mMarkedFields (fuel - 1)) dtb__671), B_dData_dMaybe.C_Maybe_Nothing))
  | Vuna_dIr_dModel.C_Ir_IrProj (dtb__673, dtb__674, dtb__675, dtb__676) -> (Vuna_dIr_dModel.C_Ir_IrProj (((v_mMarked (fuel - 1)) dtb__673), dtb__674, dtb__675, B_dData_dMaybe.C_Maybe_Nothing))
  | Vuna_dIr_dModel.C_Ir_IrRecord (dtb__677, dtb__678, dtb__679) -> (Vuna_dIr_dModel.C_Ir_IrRecord (dtb__677, B_dData_dMaybe.C_Maybe_Nothing, ((v_mMarkedFields (fuel - 1)) dtb__679)))
  | Vuna_dIr_dModel.C_Ir_IrCtor (dtb__680, dtb__681, dtb__682, dtb__683) -> (Vuna_dIr_dModel.C_Ir_IrCtor (dtb__680, dtb__681, B_dData_dMaybe.C_Maybe_Nothing, ((v_mMarkedList (fuel - 1)) dtb__683)))
  | Vuna_dIr_dModel.C_Ir_IrRtApp (dtb__684, dtb__685) -> (Vuna_dIr_dModel.C_Ir_IrRtApp (dtb__684, ((v_mMarkedList (fuel - 1)) dtb__685)))
  | Vuna_dIr_dModel.C_Ir_IrLam (dtb__686, dtb__687, dtb__688) -> (if (if (v_isEffContLambda dtb__687) then (B_dData_dBool.v_not (v_isEffThunkBody dtb__688)) else false) then (((((v_mEffContLambda (fuel - 1)) v_mNoResumption) dtb__686) dtb__687) dtb__688) else (Vuna_dIr_dModel.C_Ir_IrLam (dtb__686, dtb__687, ((v_mMarked (fuel - 1)) dtb__688))))
  | _ -> e
)) e)))
# 1380 "Vuna/Ir/Cps.vuna"
and v_mMarkedList = (fun (fuel : int) (xs : Vuna_dIr_dModel.t_Ir B_dData_dList.t_List) -> (if (fuel <= 0) then xs else (match xs with
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | B_dData_dList.C_List__x58__x58_ (dtb__689, dtb__690) -> (B_dData_dList.C_List__x58__x58_ (((v_mMarked (fuel - 1)) dtb__689), ((v_mMarkedList (fuel - 1)) dtb__690)))
  | _ -> failwith "DT: impossible branch"
)))
# 1389 "Vuna/Ir/Cps.vuna"
and v_mMarkedFields = (fun (fuel : int) (fs : (string, Vuna_dIr_dModel.t_Ir) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (if (fuel <= 0) then fs else (match fs with
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | B_dData_dList.C_List__x58__x58_ (dtb__691, dtb__692) -> (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = (B_dData_dPair.v_firstOf dtb__691); B_dData_dPair.f_Pair_second = ((v_mMarked (fuel - 1)) (B_dData_dPair.v_secondOf dtb__691)) }, ((v_mMarkedFields (fuel - 1)) dtb__692)))
  | _ -> failwith "DT: impossible branch"
)))
# 1398 "Vuna/Ir/Cps.vuna"
and v_mMarkedAlts = (fun (fuel : int) (alts : Vuna_dIr_dModel.t_IrAlt B_dData_dList.t_List) -> (if (fuel <= 0) then alts else (match alts with
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | B_dData_dList.C_List__x58__x58_ (dtb__693, dtb__694) -> (B_dData_dList.C_List__x58__x58_ ({ Vuna_dIr_dModel.f_IrAlt_irAltCtor = (dtb__693).Vuna_dIr_dModel.f_IrAlt_irAltCtor; Vuna_dIr_dModel.f_IrAlt_irAltBinders = (dtb__693).Vuna_dIr_dModel.f_IrAlt_irAltBinders; Vuna_dIr_dModel.f_IrAlt_irAltBody = ((v_mMarked (fuel - 1)) (dtb__693).Vuna_dIr_dModel.f_IrAlt_irAltBody) }, ((v_mMarkedAlts (fuel - 1)) dtb__694)))
  | _ -> failwith "DT: impossible branch"
)))
# 1407 "Vuna/Ir/Cps.vuna"
and v_mMarkedAltM = (fun (fuel : int) (m : Vuna_dIr_dModel.t_IrAlt B_dData_dMaybe.t_Maybe) -> (if (fuel <= 0) then m else (match m with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb__695) -> (B_dData_dMaybe.C_Maybe_Just ({ Vuna_dIr_dModel.f_IrAlt_irAltCtor = (dtb__695).Vuna_dIr_dModel.f_IrAlt_irAltCtor; Vuna_dIr_dModel.f_IrAlt_irAltBinders = (dtb__695).Vuna_dIr_dModel.f_IrAlt_irAltBinders; Vuna_dIr_dModel.f_IrAlt_irAltBody = ((v_mMarked (fuel - 1)) (dtb__695).Vuna_dIr_dModel.f_IrAlt_irAltBody) }))
  | _ -> failwith "DT: impossible branch"
)))

# 1416 "Vuna/Ir/Cps.vuna"
let v_mMarkedDef = (fun (mc0 : Vuna_dIr_dModel.t_IrDef) -> (match mc0 with
  | Vuna_dIr_dModel.C_IrDef_IrDef (dtb__696, dtb__697, dtb__698, dtb__699, dtb__700, dtb__701, dtb__702, dtb__703) -> (Vuna_dIr_dModel.C_IrDef_IrDef (dtb__696, dtb__697, dtb__698, dtb__699, ((v_mMarked (v_cpsFuelOfBody dtb__700)) dtb__700), dtb__701, dtb__702, dtb__703))
  | _ -> mc0
))

# 1422 "Vuna/Ir/Cps.vuna"
let v_mApplysDef = (fun (mc0 : Vuna_dIr_dModel.t_IrDef) -> (match mc0 with
  | Vuna_dIr_dModel.C_IrDef_IrDef (dtb__704, dtb__705, dtb__706, dtb__707, dtb__708, dtb__709, dtb__710, dtb__711) -> (Vuna_dIr_dModel.C_IrDef_IrDef (dtb__704, dtb__705, dtb__706, dtb__707, ((v_mApplys (v_cpsFuelOfBody dtb__708)) dtb__708), dtb__709, dtb__710, dtb__711))
  | _ -> mc0
))

# 1433 "Vuna/Ir/Cps.vuna"
let v_machineCtl = "Base.Effect.Core.Control"

# 1212 "Vuna/Ir/Cps.vuna"
let v_mCleanupDef = (fun (n : string) (body : Vuna_dIr_dModel.t_Ir) -> (if (n = v_cleanupPushName) then (match body with
  | Vuna_dIr_dModel.C_Ir_IrLam (dtb__712, dtb__713, dtb__714) -> (match (v_lastBinderOf dtb__712) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__715) -> (B_dData_dMaybe.C_Maybe_Just ((Vuna_dIr_dModel.C_Ir_IrLam (dtb__712, B_dData_dMaybe.C_Maybe_Nothing, (Vuna_dIr_dModel.C_Ir_IrCtor (Vuna_dIr_dModel.v_irEffTypeName, Vuna_dIr_dModel.v_irEffMkCtor, B_dData_dMaybe.C_Maybe_Nothing, (B_dData_dList.C_List__x58__x58_ ((Vuna_dIr_dModel.C_Ir_IrLam ((B_dData_dList.C_List__x58__x58_ ((v_mkBinder "__mCleanU"), (B_dData_dList.C_List__x58__x58_ ((v_mkBinder "__mCleanK"), B_dData_dList.C_List_Nil)))), B_dData_dMaybe.C_Maybe_Nothing, (Vuna_dIr_dModel.C_Ir_IrCtor (v_machineCtl, (v_machineCtl ^ ".MkPushCleanup"), B_dData_dMaybe.C_Maybe_Nothing, (B_dData_dList.C_List__x58__x58_ ((Vuna_dIr_dModel.C_Ir_IrCtor ("Base.Effect.Core.Cleanup", "Base.Effect.Core.Cleanup.MkCleanup", B_dData_dMaybe.C_Maybe_Nothing, (B_dData_dList.C_List__x58__x58_ ((Vuna_dIr_dModel.C_Ir_IrVar (dtb__715)), B_dData_dList.C_List_Nil)))), (B_dData_dList.C_List__x58__x58_ ((Vuna_dIr_dModel.C_Ir_IrVar ((v_mkBinder "__mCleanK"))), B_dData_dList.C_List_Nil)))))))), B_dData_dList.C_List_Nil))))))))
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
) else (if (n = v_cleanupPopName) then (match body with
  | Vuna_dIr_dModel.C_Ir_IrLam (dtb__716, dtb__717, dtb__718) -> (B_dData_dMaybe.C_Maybe_Just ((Vuna_dIr_dModel.C_Ir_IrLam (dtb__716, B_dData_dMaybe.C_Maybe_Nothing, (Vuna_dIr_dModel.C_Ir_IrCtor (Vuna_dIr_dModel.v_irEffTypeName, Vuna_dIr_dModel.v_irEffMkCtor, B_dData_dMaybe.C_Maybe_Nothing, (B_dData_dList.C_List__x58__x58_ ((Vuna_dIr_dModel.C_Ir_IrLam ((B_dData_dList.C_List__x58__x58_ ((v_mkBinder "__mCleanU"), (B_dData_dList.C_List__x58__x58_ ((v_mkBinder "__mCleanK"), B_dData_dList.C_List_Nil)))), B_dData_dMaybe.C_Maybe_Nothing, (Vuna_dIr_dModel.C_Ir_IrCtor (v_machineCtl, (v_machineCtl ^ ".MkPopCleanup"), B_dData_dMaybe.C_Maybe_Nothing, (B_dData_dList.C_List__x58__x58_ ((Vuna_dIr_dModel.C_Ir_IrVar ((v_mkBinder "__mCleanK"))), B_dData_dList.C_List_Nil)))))), B_dData_dList.C_List_Nil))))))))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
) else B_dData_dMaybe.C_Maybe_Nothing)))

# 1244 "Vuna/Ir/Cps.vuna"
let v_mDef = (fun (handlers : string B_dData_dList.t_List) (fuel : int) (d : Vuna_dIr_dModel.t_IrDef) -> (if (fuel <= 0) then d else (match d with
  | Vuna_dIr_dModel.C_IrDef_IrExternDef (dtb__719, dtb__720, dtb__721, dtb__722) -> d
  | Vuna_dIr_dModel.C_IrDef_IrDef (dtb__723, dtb__724, dtb__725, dtb__726, dtb__727, dtb__728, dtb__729, dtb__730) -> ((fun marked -> ((fun h -> ((fun ar2 -> ((fun sigTy1 -> ((fun b -> (if (if (if (dtb__723 = v_runPureName) then true else (dtb__723 = v_runEffName)) then true else (dtb__723 = v_runMainName)) then (match ((v_mTrampolineBody dtb__723) b) with
  | B_dData_dResult.C_Result_Ok (dtb__731) -> (Vuna_dIr_dModel.C_IrDef_IrDef (dtb__723, ar2, dtb__725, sigTy1, dtb__731, dtb__728, dtb__729, dtb__730))
  | B_dData_dResult.C_Result_Err (dtb__732) -> (Vuna_dIr_dModel.C_IrDef_IrDef (dtb__723, ar2, dtb__725, sigTy1, b, dtb__728, dtb__729, dtb__730))
  | _ -> failwith "DT: impossible branch"
) else (Vuna_dIr_dModel.C_IrDef_IrDef (dtb__723, ar2, dtb__725, sigTy1, b, dtb__728, dtb__729, dtb__730)))) ((v_mSyms (fuel - 1)) ((v_mHandlers (fuel - 1)) h)))) (if (ar2 = dtb__724) then dtb__726 else B_dData_dMaybe.C_Maybe_Nothing))) (if marked then (dtb__724 + 2) else dtb__724))) (match ((v_mCleanupDef dtb__723) dtb__727) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__733) -> dtb__733
  | B_dData_dMaybe.C_Maybe_Nothing -> (if marked then ((v_mHandlerFun (fuel - 1)) dtb__727) else dtb__727)
  | _ -> failwith "DT: impossible branch"
))) ((v_memName dtb__723) handlers))
  | _ -> failwith "DT: impossible branch"
)))

# 1270 "Vuna/Ir/Cps.vuna"
let rec v_mDefs = (fun (handlers : string B_dData_dList.t_List) (fuel : int) (ds : Vuna_dIr_dModel.t_IrDef B_dData_dList.t_List) -> (if (fuel <= 0) then ds else (match ds with
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | B_dData_dList.C_List__x58__x58_ (dtb__734, dtb__735) -> (B_dData_dList.C_List__x58__x58_ ((((v_mDef handlers) (fuel - 1)) dtb__734), (((v_mDefs handlers) (fuel - 1)) dtb__735)))
  | _ -> failwith "DT: impossible branch"
)))

# 1436 "Vuna/Ir/Cps.vuna"
let v_machineCtorOf = (fun (sym : string) -> (if (sym = v_irMDoneName) then (B_dData_dMaybe.C_Maybe_Just ("MkDone")) else (if (sym = v_irMApplyName) then (B_dData_dMaybe.C_Maybe_Just ("MkApply")) else (if (sym = v_irMPerformName) then (B_dData_dMaybe.C_Maybe_Just ("MkPerform")) else (if (sym = v_irMHandleName) then (B_dData_dMaybe.C_Maybe_Just ("MkHandle")) else (if (sym = v_irMSelfName) then (B_dData_dMaybe.C_Maybe_Just ("MkSelf")) else B_dData_dMaybe.C_Maybe_Nothing))))))

# 1453 "Vuna/Ir/Cps.vuna"
let v_machineArgsOf = (fun (sym : string) (args : Vuna_dIr_dModel.t_Ir B_dData_dList.t_List) -> (if (sym = v_irMHandleName) then ((fun nd_uscrut2 -> (match nd_uscrut2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__736, dtb__737) -> (match dtb__737 with
  | B_dData_dList.C_List__x58__x58_ (dtb__738, dtb__739) -> (match dtb__739 with
  | B_dData_dList.C_List__x58__x58_ (dtb__740, dtb__741) -> (match dtb__741 with
  | B_dData_dList.C_List__x58__x58_ (dtb__742, dtb__743) -> (match dtb__743 with
  | B_dData_dList.C_List__x58__x58_ (dtb__744, dtb__745) -> (match dtb__745 with
  | B_dData_dList.C_List__x58__x58_ (dtb__746, dtb__747) -> (match dtb__747 with
  | B_dData_dList.C_List__x58__x58_ (dtb__748, dtb__749) -> (match dtb__749 with
  | B_dData_dList.C_List__x58__x58_ (dtb__750, dtb__751) -> ((B_dData_dList.v_append (B_dData_dList.C_List__x58__x58_ (dtb__740, (B_dData_dList.C_List__x58__x58_ (dtb__742, (B_dData_dList.C_List__x58__x58_ (dtb__744, (B_dData_dList.C_List__x58__x58_ (dtb__746, (B_dData_dList.C_List__x58__x58_ (dtb__748, B_dData_dList.C_List_Nil))))))))))) dtb__751)
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
)) args) else (if (sym = v_irMPerformName) then ((fun nd_uscrut2 -> (match nd_uscrut2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__752, dtb__753) -> (match dtb__753 with
  | B_dData_dList.C_List__x58__x58_ (dtb__754, dtb__755) -> (match dtb__755 with
  | B_dData_dList.C_List__x58__x58_ (dtb__756, dtb__757) -> (match dtb__757 with
  | B_dData_dList.C_List__x58__x58_ (dtb__758, dtb__759) -> (match dtb__759 with
  | B_dData_dList.C_List__x58__x58_ (dtb__760, dtb__761) -> ((B_dData_dList.v_append (B_dData_dList.C_List__x58__x58_ (dtb__756, (B_dData_dList.C_List__x58__x58_ (dtb__758, (B_dData_dList.C_List__x58__x58_ (dtb__760, B_dData_dList.C_List_Nil))))))) dtb__761)
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

# 1466 "Vuna/Ir/Cps.vuna"
let rec v_mSteps = (fun (fuel : int) (e : Vuna_dIr_dModel.t_Ir) -> (if (fuel <= 0) then e else (match e with
  | Vuna_dIr_dModel.C_Ir_IrRtApp (dtb__762, dtb__763) -> (match (v_machineCtorOf dtb__762) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__764) -> (Vuna_dIr_dModel.C_Ir_IrCtor (v_machineCtl, (String.concat "" [v_machineCtl; "."; dtb__764]), B_dData_dMaybe.C_Maybe_Nothing, ((v_mStepsList (fuel - 1)) ((v_machineArgsOf dtb__762) dtb__763))))
  | B_dData_dMaybe.C_Maybe_Nothing -> (if (dtb__762 = v_irMRunName) then ((fun nd_uscrut5 -> (match nd_uscrut5 with
  | B_dData_dList.C_List__x58__x58_ (dtb__765, dtb__766) -> (match dtb__766 with
  | B_dData_dList.C_List_Nil -> (Vuna_dIr_dModel.C_Ir_IrApp (B_dData_dMaybe.C_Maybe_Nothing, (Vuna_dIr_dModel.C_Ir_IrGlobal ("Base.Effect.Core.machineRun")), ((v_mSteps (fuel - 1)) dtb__765)))
  | _ -> (Vuna_dIr_dModel.C_Ir_IrRtApp (dtb__762, ((v_mStepsList (fuel - 1)) dtb__763)))
)
  | _ -> (Vuna_dIr_dModel.C_Ir_IrRtApp (dtb__762, ((v_mStepsList (fuel - 1)) dtb__763)))
)) dtb__763) else (Vuna_dIr_dModel.C_Ir_IrRtApp (dtb__762, ((v_mStepsList (fuel - 1)) dtb__763))))
  | _ -> failwith "DT: impossible branch"
)
  | Vuna_dIr_dModel.C_Ir_IrApp (dtb__767, dtb__768, dtb__769) -> ((fun p -> ((fun head -> ((fun args -> (match head with
  | Vuna_dIr_dModel.C_Ir_IrRt (dtb__770) -> (match (v_machineCtorOf dtb__770) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__771) -> (Vuna_dIr_dModel.C_Ir_IrCtor (v_machineCtl, (String.concat "" [v_machineCtl; "."; dtb__771]), B_dData_dMaybe.C_Maybe_Nothing, ((v_mStepsList (fuel - 1)) ((v_machineArgsOf dtb__770) args))))
  | B_dData_dMaybe.C_Maybe_Nothing -> (if (dtb__770 = v_irMRunName) then ((fun nd_uscrut10 -> (match nd_uscrut10 with
  | B_dData_dList.C_List__x58__x58_ (dtb__772, dtb__773) -> (match dtb__773 with
  | B_dData_dList.C_List_Nil -> (Vuna_dIr_dModel.C_Ir_IrApp (B_dData_dMaybe.C_Maybe_Nothing, (Vuna_dIr_dModel.C_Ir_IrGlobal ("Base.Effect.Core.machineRun")), ((v_mSteps (fuel - 1)) dtb__772)))
  | _ -> (((v_foldAppMap (fuel - 1)) ((v_mSteps (fuel - 1)) head)) args)
)
  | _ -> (((v_foldAppMap (fuel - 1)) ((v_mSteps (fuel - 1)) head)) args)
)) args) else (((v_foldAppMap (fuel - 1)) ((v_mSteps (fuel - 1)) head)) args))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> (((v_foldAppMap (fuel - 1)) ((v_mSteps (fuel - 1)) head)) args)
)) (B_dData_dPair.v_secondOf p))) (B_dData_dPair.v_firstOf p))) (v_flattenApp e))
  | Vuna_dIr_dModel.C_Ir_IrCtor (dtb__774, dtb__775, dtb__776, dtb__777) -> (Vuna_dIr_dModel.C_Ir_IrCtor (dtb__774, dtb__775, B_dData_dMaybe.C_Maybe_Nothing, ((v_mStepsList (fuel - 1)) dtb__777)))
  | Vuna_dIr_dModel.C_Ir_IrRecord (dtb__778, dtb__779, dtb__780) -> (Vuna_dIr_dModel.C_Ir_IrRecord (dtb__778, B_dData_dMaybe.C_Maybe_Nothing, ((v_mStepsFields (fuel - 1)) dtb__780)))
  | Vuna_dIr_dModel.C_Ir_IrProj (dtb__781, dtb__782, dtb__783, dtb__784) -> (Vuna_dIr_dModel.C_Ir_IrProj (((v_mSteps (fuel - 1)) dtb__781), dtb__782, dtb__783, B_dData_dMaybe.C_Maybe_Nothing))
  | Vuna_dIr_dModel.C_Ir_IrRecUpd (dtb__785, dtb__786, dtb__787, dtb__788) -> (Vuna_dIr_dModel.C_Ir_IrRecUpd (((v_mSteps (fuel - 1)) dtb__785), dtb__786, ((v_mStepsFields (fuel - 1)) dtb__787), B_dData_dMaybe.C_Maybe_Nothing))
  | Vuna_dIr_dModel.C_Ir_IrCast (dtb__789, dtb__790, dtb__791) -> (Vuna_dIr_dModel.C_Ir_IrCast (dtb__789, dtb__790, ((v_mSteps (fuel - 1)) dtb__791)))
  | Vuna_dIr_dModel.C_Ir_IrLet (dtb__792, dtb__793, dtb__794) -> (Vuna_dIr_dModel.C_Ir_IrLet (dtb__792, ((v_mSteps (fuel - 1)) dtb__793), ((v_mSteps (fuel - 1)) dtb__794)))
  | Vuna_dIr_dModel.C_Ir_IrLam (dtb__795, dtb__796, dtb__797) -> (Vuna_dIr_dModel.C_Ir_IrLam (dtb__795, dtb__796, ((v_mSteps (fuel - 1)) dtb__797)))
  | Vuna_dIr_dModel.C_Ir_IrIf (dtb__798, dtb__799, dtb__800) -> (Vuna_dIr_dModel.C_Ir_IrIf (((v_mSteps (fuel - 1)) dtb__798), ((v_mSteps (fuel - 1)) dtb__799), ((v_mSteps (fuel - 1)) dtb__800)))
  | Vuna_dIr_dModel.C_Ir_IrCase (dtb__801, dtb__802, dtb__803, dtb__804) -> (Vuna_dIr_dModel.C_Ir_IrCase (dtb__801, B_dData_dMaybe.C_Maybe_Nothing, ((v_mSteps (fuel - 1)) dtb__803), ((v_mStepsAlts (fuel - 1)) dtb__804)))
  | Vuna_dIr_dModel.C_Ir_IrNatCase (dtb__805, dtb__806, dtb__807, dtb__808, dtb__809) -> (Vuna_dIr_dModel.C_Ir_IrNatCase (((v_mSteps (fuel - 1)) dtb__805), dtb__806, ((v_mStepsAltM (fuel - 1)) dtb__807), ((v_mStepsAltM (fuel - 1)) dtb__808), ((v_mStepsAltM (fuel - 1)) dtb__809)))
  | Vuna_dIr_dModel.C_Ir_IrConcatMany (dtb__810) -> (Vuna_dIr_dModel.C_Ir_IrConcatMany (((v_mStepsList (fuel - 1)) dtb__810)))
  | Vuna_dIr_dModel.C_Ir_IrEffThunk (dtb__811, dtb__812, dtb__813, dtb__814, dtb__815) -> (Vuna_dIr_dModel.C_Ir_IrEffThunk (dtb__811, dtb__812, dtb__813, dtb__814, ((v_mSteps (fuel - 1)) dtb__815)))
  | _ -> e
)))
# 1513 "Vuna/Ir/Cps.vuna"
and v_mStepsList = (fun (fuel : int) (xs : Vuna_dIr_dModel.t_Ir B_dData_dList.t_List) -> (if (fuel <= 0) then xs else (match xs with
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | B_dData_dList.C_List__x58__x58_ (dtb__816, dtb__817) -> (B_dData_dList.C_List__x58__x58_ (((v_mSteps (fuel - 1)) dtb__816), ((v_mStepsList (fuel - 1)) dtb__817)))
  | _ -> failwith "DT: impossible branch"
)))
# 1522 "Vuna/Ir/Cps.vuna"
and v_mStepsFields = (fun (fuel : int) (fs : (string, Vuna_dIr_dModel.t_Ir) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (if (fuel <= 0) then fs else (match fs with
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | B_dData_dList.C_List__x58__x58_ (dtb__818, dtb__819) -> (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = (B_dData_dPair.v_firstOf dtb__818); B_dData_dPair.f_Pair_second = ((v_mSteps (fuel - 1)) (B_dData_dPair.v_secondOf dtb__818)) }, ((v_mStepsFields (fuel - 1)) dtb__819)))
  | _ -> failwith "DT: impossible branch"
)))
# 1531 "Vuna/Ir/Cps.vuna"
and v_mStepsAlts = (fun (fuel : int) (alts : Vuna_dIr_dModel.t_IrAlt B_dData_dList.t_List) -> (if (fuel <= 0) then alts else (match alts with
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | B_dData_dList.C_List__x58__x58_ (dtb__820, dtb__821) -> (B_dData_dList.C_List__x58__x58_ ({ Vuna_dIr_dModel.f_IrAlt_irAltCtor = (dtb__820).Vuna_dIr_dModel.f_IrAlt_irAltCtor; Vuna_dIr_dModel.f_IrAlt_irAltBinders = (dtb__820).Vuna_dIr_dModel.f_IrAlt_irAltBinders; Vuna_dIr_dModel.f_IrAlt_irAltBody = ((v_mSteps (fuel - 1)) (dtb__820).Vuna_dIr_dModel.f_IrAlt_irAltBody) }, ((v_mStepsAlts (fuel - 1)) dtb__821)))
  | _ -> failwith "DT: impossible branch"
)))
# 1540 "Vuna/Ir/Cps.vuna"
and v_mStepsAltM = (fun (fuel : int) (m : Vuna_dIr_dModel.t_IrAlt B_dData_dMaybe.t_Maybe) -> (if (fuel <= 0) then m else (match m with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb__822) -> (B_dData_dMaybe.C_Maybe_Just ({ Vuna_dIr_dModel.f_IrAlt_irAltCtor = (dtb__822).Vuna_dIr_dModel.f_IrAlt_irAltCtor; Vuna_dIr_dModel.f_IrAlt_irAltBinders = (dtb__822).Vuna_dIr_dModel.f_IrAlt_irAltBinders; Vuna_dIr_dModel.f_IrAlt_irAltBody = ((v_mSteps (fuel - 1)) (dtb__822).Vuna_dIr_dModel.f_IrAlt_irAltBody) }))
  | _ -> failwith "DT: impossible branch"
)))
# 1550 "Vuna/Ir/Cps.vuna"
and v_foldAppMap = (fun (fuel : int) (acc : Vuna_dIr_dModel.t_Ir) (xs : Vuna_dIr_dModel.t_Ir B_dData_dList.t_List) -> (if (fuel <= 0) then acc else (match xs with
  | B_dData_dList.C_List_Nil -> acc
  | B_dData_dList.C_List__x58__x58_ (dtb__823, dtb__824) -> (((v_foldAppMap (fuel - 1)) (Vuna_dIr_dModel.C_Ir_IrApp (B_dData_dMaybe.C_Maybe_Nothing, acc, ((v_mSteps (fuel - 1)) dtb__823)))) dtb__824)
  | _ -> failwith "DT: impossible branch"
)))

# 1560 "Vuna/Ir/Cps.vuna"
let v_machineRunGlobal = "Base.Effect.Core.machineRun"

# 1563 "Vuna/Ir/Cps.vuna"
let v_addDepOnce = (fun (d : string) (ds : string B_dData_dList.t_List) -> (if ((v_memName d) ds) then ds else ((B_dData_dList.v_append ds) (B_dData_dList.C_List__x58__x58_ (d, B_dData_dList.C_List_Nil)))))

# 1566 "Vuna/Ir/Cps.vuna"
let v_mStepsDef = (fun (mc0 : Vuna_dIr_dModel.t_IrDef) -> (match mc0 with
  | Vuna_dIr_dModel.C_IrDef_IrDef (dtb__825, dtb__826, dtb__827, dtb__828, dtb__829, dtb__830, dtb__831, dtb__832) -> ((fun body2 -> ((fun deps2 -> (Vuna_dIr_dModel.C_IrDef_IrDef (dtb__825, dtb__826, deps2, dtb__828, body2, dtb__830, dtb__831, dtb__832))) (if ((Vuna_dIr_dAnalysis.v_irMentionsGlobal v_machineRunGlobal) body2) then ((v_addDepOnce v_machineRunGlobal) dtb__827) else dtb__827))) ((v_mSteps (v_cpsFuelOfBody dtb__829)) dtb__829))
  | _ -> mc0
))

# 1590 "Vuna/Ir/Cps.vuna"
let v_cpsUnit = (fun (u : Vuna_dIr_dModel.t_IrUnit) -> (match ((v_transformGroups (v_cpsFuelOfDefs ((B_dData_dList.v_concatMap Vuna_dIr_dModel.v_irGroupDefs) (u).Vuna_dIr_dModel.f_IrUnit_irUnitGroups))) (u).Vuna_dIr_dModel.f_IrUnit_irUnitGroups) with
  | B_dData_dResult.C_Result_Err (dtb__833) -> (B_dData_dResult.C_Result_Err (dtb__833))
  | B_dData_dResult.C_Result_Ok (dtb__834) -> (B_dData_dResult.C_Result_Ok ({ Vuna_dIr_dModel.f_IrUnit_irUnitTyDecls = (u).Vuna_dIr_dModel.f_IrUnit_irUnitTyDecls; Vuna_dIr_dModel.f_IrUnit_irUnitGroups = dtb__834; Vuna_dIr_dModel.f_IrUnit_irUnitHasListFamily = (u).Vuna_dIr_dModel.f_IrUnit_irUnitHasListFamily; Vuna_dIr_dModel.f_IrUnit_irUnitTypeRefs = (u).Vuna_dIr_dModel.f_IrUnit_irUnitTypeRefs; Vuna_dIr_dModel.f_IrUnit_irUnitEntry = (u).Vuna_dIr_dModel.f_IrUnit_irUnitEntry }))
  | _ -> failwith "DT: impossible branch"
))

# 1598 "Vuna/Ir/Cps.vuna"
let v_cpsDefs = (fun (defs : Vuna_dIr_dModel.t_IrDef B_dData_dList.t_List) -> ((v_transformDefs (v_cpsFuelOfDefs defs)) defs))

# 1575 "Vuna/Ir/Cps.vuna"
let v_cpsDefsMachine = (fun (defs : Vuna_dIr_dModel.t_IrDef B_dData_dList.t_List) -> (match (v_cpsDefs defs) with
  | B_dData_dResult.C_Result_Err (dtb__835) -> (B_dData_dResult.C_Result_Err (dtb__835))
  | B_dData_dResult.C_Result_Ok (dtb__836) -> ((fun handlerNames -> (match (Vuna_dIr_dTail.v_annotateDefs ((B_dData_dList.v_map v_mStepsDef) ((B_dData_dList.v_map v_mApplysDef) ((B_dData_dList.v_map v_mMarkedDef) (((v_mDefs handlerNames) (v_cpsFuelOfDefs dtb__836)) dtb__836))))) with
  | B_dData_dResult.C_Result_Err (dtb__837) -> (B_dData_dResult.C_Result_Err (dtb__837))
  | B_dData_dResult.C_Result_Ok (dtb__838) -> (B_dData_dResult.C_Result_Ok (dtb__838))
  | _ -> failwith "DT: impossible branch"
)) ((v_collectHandleOpsDefs 100000) defs))
  | _ -> failwith "DT: impossible branch"
))
