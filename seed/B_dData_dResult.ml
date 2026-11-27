open Vuna_runtime
type 'a0 t_Result = C_Result_Ok of ('a0) | C_Result_Err of (string)

# 24 "Base/Data/Result.vuna"
let v_Functor_ua5312def40ac3976_uBase_x36_46_x36_Data_x36_46_x36_Result_x36_46_x36_Result = (B_dTrait_dFunctor.C_Functor_Functor (((Obj.magic (fun dtb_u_u3 dtb_u_u4 -> (match dtb_u_u4 with
  | C_Result_Err (dtb_u_u5) -> (C_Result_Err (dtb_u_u5))
  | C_Result_Ok (dtb_u_u6) -> (C_Result_Ok ((dtb_u_u3 dtb_u_u6)))
  | _ -> failwith "DT: impossible branch"
))) : Obj.t)))

# 28 "Base/Data/Result.vuna"
let v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Data_x36_46_x36_Result_x36_46_x36_Result = (B_dTrait_dMonad.C_Monad_Monad (((Obj.magic (fun dtb_u_u9 dtb_u_u10 -> (match dtb_u_u9 with
  | C_Result_Err (dtb_u_u11) -> (C_Result_Err (dtb_u_u11))
  | C_Result_Ok (dtb_u_u12) -> (dtb_u_u10 dtb_u_u12)
  | _ -> failwith "DT: impossible branch"
))) : Obj.t)))

# 32 "Base/Data/Result.vuna"
let v_Applicative_u19070277251d295b_uBase_x36_46_x36_Data_x36_46_x36_Result_x36_46_x36_Result = (B_dTrait_dApplicative.C_Applicative_Applicative (((Obj.magic (fun dtb_u_u14 -> (C_Result_Ok (dtb_u_u14)))) : Obj.t), ((Obj.magic (fun dtb_u_u17 dtb_u_u18 -> (match dtb_u_u17 with
  | C_Result_Ok (dtb_u_u19) -> (match dtb_u_u18 with
  | C_Result_Ok (dtb_u_u20) -> (C_Result_Ok ((dtb_u_u19 dtb_u_u20)))
  | C_Result_Err (dtb_u_u21) -> (C_Result_Err (dtb_u_u21))
  | _ -> failwith "DT: impossible branch"
)
  | C_Result_Err (dtb_u_u22) -> (C_Result_Err (dtb_u_u22))
  | _ -> failwith "DT: impossible branch"
))) : Obj.t), ((Obj.magic (fun dtb_u_u26 dtb_u_u27 dtb_u_u28 -> (match dtb_u_u27 with
  | C_Result_Err (dtb_u_u29) -> (C_Result_Err (dtb_u_u29))
  | C_Result_Ok (dtb_u_u30) -> (match dtb_u_u28 with
  | C_Result_Err (dtb_u_u31) -> (C_Result_Err (dtb_u_u31))
  | C_Result_Ok (dtb_u_u32) -> (C_Result_Ok (((dtb_u_u26 dtb_u_u30) dtb_u_u32)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))) : Obj.t)))

# 74 "Base/Data/Result.vuna"
let v_Show_u0077d73cf424e521_uBase_x36_46_x36_Data_x36_46_x36_Result_x36_46_x36_Result_ua = (fun dtb_u_u34 -> (B_dTrait_dShow.C_Show_Show ((fun dtb_u_u35 -> (match dtb_u_u35 with
  | C_Result_Ok (dtb_u_u36) -> ("Ok " ^ ((B_dTrait_dShow.v_show dtb_u_u34) dtb_u_u36))
  | C_Result_Err (dtb_u_u37) -> ("Err " ^ ((B_dTrait_dShow.v_show B_dTrait_dShow.v_Show_u0077d73cf424e521_uString) dtb_u_u37))
  | _ -> failwith "DT: impossible branch"
)))))

# 81 "Base/Data/Result.vuna"
let rec v_Eq_u018fc178ff3df1b4_uBase_x36_46_x36_Data_x36_46_x36_Result_x36_46_x36_Result_ua = (fun dtb_u_u39 -> (B_dTrait_dEq.C_Eq_Eq ((fun dtb_u_u40 dtb_u_u41 -> (match dtb_u_u40 with
  | C_Result_Err (dtb_u_u42) -> (match dtb_u_u41 with
  | C_Result_Err (dtb_u_u43) -> (dtb_u_u42 = dtb_u_u43)
  | _ -> false
)
  | C_Result_Ok (dtb_u_u44) -> (match dtb_u_u41 with
  | C_Result_Ok (dtb_u_u45) -> (((B_dTrait_dEq.v__x61__x61_ dtb_u_u39) dtb_u_u44) dtb_u_u45)
  | _ -> false
)
  | _ -> failwith "DT: impossible branch"
)), (fun dtb_u_u46 dtb_u_u47 -> (if (((B_dTrait_dEq.v__x61__x61_ (v_Eq_u018fc178ff3df1b4_uBase_x36_46_x36_Data_x36_46_x36_Result_x36_46_x36_Result_ua dtb_u_u39)) dtb_u_u46) dtb_u_u47) then false else true)))))

# 87 "Base/Data/Result.vuna"
let v_Hashable_ue4b0f10b020a5e82_uBase_x36_46_x36_Data_x36_46_x36_Result_x36_46_x36_Result_ua = (fun dtb_u_u49 -> (B_dTrait_dHashable.C_Hashable_Hashable ((fun dtb_u_u50 -> (match dtb_u_u50 with
  | C_Result_Ok (dtb_u_u51) -> ((B_dTrait_dHashable.v_hashCombine 1) ((B_dTrait_dHashable.v_hash dtb_u_u49) dtb_u_u51))
  | C_Result_Err (dtb_u_u52) -> ((B_dTrait_dHashable.v_hashCombine 2) (B_dTrait_dHashable.v_hashStr dtb_u_u52))
  | _ -> failwith "DT: impossible branch"
)))))

# 93 "Base/Data/Result.vuna"
let v_Foldable_u2c890964dd357757_uBase_x36_46_x36_Data_x36_46_x36_Result_x36_46_x36_Result = (B_dTrait_dFoldable.C_Foldable_Foldable (((Obj.magic (fun dtb_u_u55 dtb_u_u56 dtb_u_u57 -> (match dtb_u_u57 with
  | C_Result_Ok (dtb_u_u58) -> ((dtb_u_u55 dtb_u_u58) dtb_u_u56)
  | C_Result_Err (dtb_u_u59) -> dtb_u_u56
  | _ -> failwith "DT: impossible branch"
))) : Obj.t)))

# 99 "Base/Data/Result.vuna"
let v_Traversable_u3e5fb3267308d1c3_uBase_x36_46_x36_Data_x36_46_x36_Result_x36_46_x36_Result_uf = (fun dtb_u_u61 -> (B_dTrait_dTraversable.C_Traversable_Traversable (((Obj.magic (fun dtb_u_u64 dtb_u_u65 -> (match dtb_u_u65 with
  | C_Result_Ok (dtb_u_u66) -> ((((B_dTrait_dApplicative.v_liftA2 dtb_u_u61) (fun dtb_u_u67 dtb_u_u68 -> (C_Result_Ok (dtb_u_u67)))) (dtb_u_u64 dtb_u_u66)) ((B_dTrait_dApplicative.v_pure dtb_u_u61) dtb_u_u66))
  | C_Result_Err (dtb_u_u69) -> ((B_dTrait_dApplicative.v_pure dtb_u_u61) (C_Result_Err (dtb_u_u69)))
  | _ -> failwith "DT: impossible branch"
))) : Obj.t))))

# 47 "Base/Data/Result.vuna"
let rec v_traverse = (fun dtb_u_u72 dtb_u_u73 -> (match dtb_u_u73 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u74, dtb_u_u75) -> (match (dtb_u_u72 dtb_u_u74) with
  | C_Result_Err (dtb_u_u76) -> (C_Result_Err (dtb_u_u76))
  | C_Result_Ok (dtb_u_u77) -> (match ((v_traverse dtb_u_u72) dtb_u_u75) with
  | C_Result_Err (dtb_u_u78) -> (C_Result_Err (dtb_u_u78))
  | C_Result_Ok (dtb_u_u79) -> (C_Result_Ok ((B_dData_dList.C_List__x58__x58_ (dtb_u_u77, dtb_u_u79))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (C_Result_Ok (B_dData_dList.C_List_Nil))
  | _ -> failwith "DT: impossible branch"
))

# 59 "Base/Data/Result.vuna"
let v_step = (fun dtb_u_u83 dtb_u_u84 -> (match dtb_u_u83 with
  | C_Result_Err (dtb_u_u85) -> (C_Result_Err (dtb_u_u85))
  | C_Result_Ok (dtb_u_u86) -> (match dtb_u_u86 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u87; B_dData_dPair.f_Pair_second = dtb_u_u88 } -> ((dtb_u_u84 dtb_u_u87) dtb_u_u88)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 64 "Base/Data/Result.vuna"
let v_mapError = (fun (dtb_u_u90 : (string) -> string) dtb_u_u91 -> (match dtb_u_u91 with
  | C_Result_Err (dtb_u_u92) -> (C_Result_Err ((dtb_u_u90 dtb_u_u92)))
  | C_Result_Ok (dtb_u_u93) -> (C_Result_Ok (dtb_u_u93))
  | _ -> failwith "DT: impossible branch"
))

# 69 "Base/Data/Result.vuna"
let v_withDefault = (fun dtb_u_u95 dtb_u_u96 -> (match dtb_u_u96 with
  | C_Result_Err (dtb_u_u97) -> dtb_u_u95
  | C_Result_Ok (dtb_u_u98) -> dtb_u_u98
  | _ -> failwith "DT: impossible branch"
))
