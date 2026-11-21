open Vuna_runtime
type 'a0 t_Result = C_Result_Ok of ('a0) | C_Result_Err of (string)

# 24 "Base/Data/Result.vuna"
let v_Functor_ua5312def40ac3976_uBase_x36_46_x36_Data_x36_46_x36_Result_x36_46_x36_Result = (B_dTrait_dFunctor.C_Functor_Functor (((Obj.magic (fun mc0 mc1 -> (match mc1 with
  | C_Result_Err (dtb__0) -> (C_Result_Err (dtb__0))
  | C_Result_Ok (dtb__1) -> (C_Result_Ok ((mc0 dtb__1)))
  | _ -> failwith "DT: impossible branch"
))) : Obj.t)))

# 28 "Base/Data/Result.vuna"
let v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Data_x36_46_x36_Result_x36_46_x36_Result = (B_dTrait_dMonad.C_Monad_Monad (((Obj.magic (fun mc0 mc1 -> (match mc0 with
  | C_Result_Err (dtb__2) -> (C_Result_Err (dtb__2))
  | C_Result_Ok (dtb__3) -> (mc1 dtb__3)
  | _ -> failwith "DT: impossible branch"
))) : Obj.t)))

# 32 "Base/Data/Result.vuna"
let v_Applicative_u19070277251d295b_uBase_x36_46_x36_Data_x36_46_x36_Result_x36_46_x36_Result = (B_dTrait_dApplicative.C_Applicative_Applicative (((Obj.magic (fun _heta0 -> (C_Result_Ok (_heta0)))) : Obj.t), ((Obj.magic (fun mf mx -> (match mf with
  | C_Result_Ok (dtb__4) -> (match mx with
  | C_Result_Ok (dtb__5) -> (C_Result_Ok ((dtb__4 dtb__5)))
  | C_Result_Err (dtb__6) -> (C_Result_Err (dtb__6))
  | _ -> failwith "DT: impossible branch"
)
  | C_Result_Err (dtb__7) -> (C_Result_Err (dtb__7))
  | _ -> failwith "DT: impossible branch"
))) : Obj.t), ((Obj.magic (fun mc0 mc1 mc2 -> (match mc1 with
  | C_Result_Err (dtb__8) -> (C_Result_Err (dtb__8))
  | C_Result_Ok (dtb__9) -> (match mc2 with
  | C_Result_Err (dtb__10) -> (C_Result_Err (dtb__10))
  | C_Result_Ok (dtb__11) -> (C_Result_Ok (((mc0 dtb__9) dtb__11)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))) : Obj.t)))

# 74 "Base/Data/Result.vuna"
let v_Show_u0077d73cf424e521_uBase_x36_46_x36_Data_x36_46_x36_Result_x36_46_x36_Result_ua = (fun _uctx0 -> (B_dTrait_dShow.C_Show_Show ((fun r -> (match r with
  | C_Result_Ok (dtb__12) -> ("Ok " ^ ((B_dTrait_dShow.v_show _uctx0) dtb__12))
  | C_Result_Err (dtb__13) -> ("Err " ^ ((B_dTrait_dShow.v_show B_dTrait_dShow.v_Show_u0077d73cf424e521_uString) dtb__13))
  | _ -> failwith "DT: impossible branch"
)))))

# 81 "Base/Data/Result.vuna"
let rec v_Eq_u018fc178ff3df1b4_uBase_x36_46_x36_Data_x36_46_x36_Result_x36_46_x36_Result_ua = (fun _uctx0 -> (B_dTrait_dEq.C_Eq_Eq ((fun mc0 mc1 -> (match mc0 with
  | C_Result_Err (dtb__14) -> (match mc1 with
  | C_Result_Err (dtb__15) -> (dtb__14 = dtb__15)
  | _ -> false
)
  | C_Result_Ok (dtb__16) -> (match mc1 with
  | C_Result_Ok (dtb__17) -> (((B_dTrait_dEq.v__x61__x61_ _uctx0) dtb__16) dtb__17)
  | _ -> false
)
  | _ -> failwith "DT: impossible branch"
)), (fun r s -> (if (((B_dTrait_dEq.v__x61__x61_ (v_Eq_u018fc178ff3df1b4_uBase_x36_46_x36_Data_x36_46_x36_Result_x36_46_x36_Result_ua _uctx0)) r) s) then false else true)))))

# 87 "Base/Data/Result.vuna"
let v_Hashable_ue4b0f10b020a5e82_uBase_x36_46_x36_Data_x36_46_x36_Result_x36_46_x36_Result_ua = (fun _uctx0 -> (B_dTrait_dHashable.C_Hashable_Hashable ((fun r -> (match r with
  | C_Result_Ok (dtb__18) -> ((B_dTrait_dHashable.v_hashCombine 1) ((B_dTrait_dHashable.v_hash _uctx0) dtb__18))
  | C_Result_Err (dtb__19) -> ((B_dTrait_dHashable.v_hashCombine 2) (B_dTrait_dHashable.v_hashStr dtb__19))
  | _ -> failwith "DT: impossible branch"
)))))

# 93 "Base/Data/Result.vuna"
let v_Foldable_u2c890964dd357757_uBase_x36_46_x36_Data_x36_46_x36_Result_x36_46_x36_Result = (B_dTrait_dFoldable.C_Foldable_Foldable (((Obj.magic (fun f z r -> (match r with
  | C_Result_Ok (dtb__20) -> ((f dtb__20) z)
  | C_Result_Err (dtb__21) -> z
  | _ -> failwith "DT: impossible branch"
))) : Obj.t)))

# 99 "Base/Data/Result.vuna"
let v_Traversable_u3e5fb3267308d1c3_uBase_x36_46_x36_Data_x36_46_x36_Result_x36_46_x36_Result_uf = (fun _uctx0 -> (B_dTrait_dTraversable.C_Traversable_Traversable (((Obj.magic (fun fun_ r -> (match r with
  | C_Result_Ok (dtb__22) -> ((((B_dTrait_dApplicative.v_liftA2 _uctx0) (fun y _u -> (C_Result_Ok (y)))) (fun_ dtb__22)) ((B_dTrait_dApplicative.v_pure _uctx0) dtb__22))
  | C_Result_Err (dtb__23) -> ((B_dTrait_dApplicative.v_pure _uctx0) (C_Result_Err (dtb__23)))
  | _ -> failwith "DT: impossible branch"
))) : Obj.t))))

# 47 "Base/Data/Result.vuna"
let rec v_traverse = (fun mc0 mc1 -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__24, dtb__25) -> (match (mc0 dtb__24) with
  | C_Result_Err (dtb__26) -> (C_Result_Err (dtb__26))
  | C_Result_Ok (dtb__27) -> (match ((v_traverse mc0) dtb__25) with
  | C_Result_Err (dtb__28) -> (C_Result_Err (dtb__28))
  | C_Result_Ok (dtb__29) -> (C_Result_Ok ((B_dData_dList.C_List__x58__x58_ (dtb__27, dtb__29))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (C_Result_Ok (B_dData_dList.C_List_Nil))
  | _ -> failwith "DT: impossible branch"
))

# 59 "Base/Data/Result.vuna"
let v_step = (fun mc0 mc1 -> (match mc0 with
  | C_Result_Err (dtb__30) -> (C_Result_Err (dtb__30))
  | C_Result_Ok (dtb__31) -> (match dtb__31 with
  | { B_dData_dPair.f_Pair_first = dtb__32; B_dData_dPair.f_Pair_second = dtb__33 } -> ((mc1 dtb__32) dtb__33)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 64 "Base/Data/Result.vuna"
let v_mapError = (fun (mc0 : (string) -> string) mc1 -> (match mc1 with
  | C_Result_Err (dtb__34) -> (C_Result_Err ((mc0 dtb__34)))
  | C_Result_Ok (dtb__35) -> (C_Result_Ok (dtb__35))
  | _ -> failwith "DT: impossible branch"
))

# 69 "Base/Data/Result.vuna"
let v_withDefault = (fun mc0 mc1 -> (match mc1 with
  | C_Result_Err (dtb__36) -> mc0
  | C_Result_Ok (dtb__37) -> dtb__37
  | _ -> failwith "DT: impossible branch"
))
