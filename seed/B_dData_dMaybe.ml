open Vuna_runtime
type 'a0 t_Maybe = C_Maybe_Nothing | C_Maybe_Just of ('a0)

# 43 "Base/Data/Maybe.vuna"
let v_Functor_ua5312def40ac3976_uBase_x36_46_x36_Data_x36_46_x36_Maybe_x36_46_x36_Maybe = (B_dTrait_dFunctor.C_Functor_Functor (((Obj.magic (fun dtb_u_u3 dtb_u_u4 -> (match dtb_u_u4 with
  | C_Maybe_Nothing -> C_Maybe_Nothing
  | C_Maybe_Just (dtb_u_u5) -> (C_Maybe_Just ((dtb_u_u3 dtb_u_u5)))
  | _ -> failwith "DT: impossible branch"
))) : Obj.t)))

# 49 "Base/Data/Maybe.vuna"
let v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Data_x36_46_x36_Maybe_x36_46_x36_Maybe = (B_dTrait_dMonad.C_Monad_Monad (((Obj.magic (fun dtb_u_u8 dtb_u_u9 -> (match dtb_u_u8 with
  | C_Maybe_Nothing -> C_Maybe_Nothing
  | C_Maybe_Just (dtb_u_u10) -> (dtb_u_u9 dtb_u_u10)
  | _ -> failwith "DT: impossible branch"
))) : Obj.t)))

# 55 "Base/Data/Maybe.vuna"
let v_Applicative_u19070277251d295b_uBase_x36_46_x36_Data_x36_46_x36_Maybe_x36_46_x36_Maybe = (B_dTrait_dApplicative.C_Applicative_Applicative (((Obj.magic (fun dtb_u_u12 -> (C_Maybe_Just (dtb_u_u12)))) : Obj.t), ((Obj.magic (fun dtb_u_u15 dtb_u_u16 -> (match dtb_u_u15 with
  | C_Maybe_Nothing -> C_Maybe_Nothing
  | C_Maybe_Just (dtb_u_u17) -> (match dtb_u_u16 with
  | C_Maybe_Nothing -> C_Maybe_Nothing
  | C_Maybe_Just (dtb_u_u18) -> (C_Maybe_Just ((dtb_u_u17 dtb_u_u18)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))) : Obj.t), ((Obj.magic (fun dtb_u_u22 dtb_u_u23 dtb_u_u24 -> (match dtb_u_u23 with
  | C_Maybe_Nothing -> C_Maybe_Nothing
  | C_Maybe_Just (dtb_u_u25) -> (match dtb_u_u24 with
  | C_Maybe_Nothing -> C_Maybe_Nothing
  | C_Maybe_Just (dtb_u_u26) -> (C_Maybe_Just (((dtb_u_u22 dtb_u_u25) dtb_u_u26)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))) : Obj.t)))

# 75 "Base/Data/Maybe.vuna"
let v_Show_u0077d73cf424e521_uBase_x36_46_x36_Data_x36_46_x36_Maybe_x36_46_x36_Maybe_ua = (fun dtb_u_u28 -> (B_dTrait_dShow.C_Show_Show ((fun dtb_u_u29 -> (match dtb_u_u29 with
  | C_Maybe_Nothing -> "Nothing"
  | C_Maybe_Just (dtb_u_u30) -> ("Just " ^ ((B_dTrait_dShow.v_show dtb_u_u28) dtb_u_u30))
  | _ -> failwith "DT: impossible branch"
)))))

# 82 "Base/Data/Maybe.vuna"
let rec v_Eq_u018fc178ff3df1b4_uBase_x36_46_x36_Data_x36_46_x36_Maybe_x36_46_x36_Maybe_ua = (fun dtb_u_u32 -> (B_dTrait_dEq.C_Eq_Eq ((fun dtb_u_u33 dtb_u_u34 -> (match dtb_u_u33 with
  | C_Maybe_Just (dtb_u_u35) -> (match dtb_u_u34 with
  | C_Maybe_Just (dtb_u_u36) -> (((B_dTrait_dEq.v__x61__x61_ dtb_u_u32) dtb_u_u35) dtb_u_u36)
  | _ -> false
)
  | C_Maybe_Nothing -> (match dtb_u_u34 with
  | C_Maybe_Nothing -> true
  | _ -> false
)
  | _ -> failwith "DT: impossible branch"
)), (fun dtb_u_u37 dtb_u_u38 -> (if (((B_dTrait_dEq.v__x61__x61_ (v_Eq_u018fc178ff3df1b4_uBase_x36_46_x36_Data_x36_46_x36_Maybe_x36_46_x36_Maybe_ua dtb_u_u32)) dtb_u_u37) dtb_u_u38) then false else true)))))

# 89 "Base/Data/Maybe.vuna"
let rec v_Ord_u5afb3bbeddafcb50_uBase_x36_46_x36_Data_x36_46_x36_Maybe_x36_46_x36_Maybe_ua = (fun dtb_u_u40 -> (B_dTrait_dOrd.C_Ord_Ord ((fun dtb_u_u41 dtb_u_u42 -> (match dtb_u_u41 with
  | C_Maybe_Just (dtb_u_u43) -> (match dtb_u_u42 with
  | C_Maybe_Just (dtb_u_u44) -> (((B_dTrait_dOrd.v__x60_ dtb_u_u40) dtb_u_u43) dtb_u_u44)
  | C_Maybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
)
  | C_Maybe_Nothing -> (match dtb_u_u42 with
  | C_Maybe_Just (dtb_u_u45) -> true
  | C_Maybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)), (fun dtb_u_u46 dtb_u_u47 -> (if (((B_dTrait_dOrd.v__x60_ (v_Ord_u5afb3bbeddafcb50_uBase_x36_46_x36_Data_x36_46_x36_Maybe_x36_46_x36_Maybe_ua dtb_u_u40)) dtb_u_u46) dtb_u_u47) then true else (B_dData_dBool.v_not (((B_dTrait_dOrd.v__x60_ (v_Ord_u5afb3bbeddafcb50_uBase_x36_46_x36_Data_x36_46_x36_Maybe_x36_46_x36_Maybe_ua dtb_u_u40)) dtb_u_u47) dtb_u_u46)))), (fun dtb_u_u48 dtb_u_u49 -> (((B_dTrait_dOrd.v__x60_ (v_Ord_u5afb3bbeddafcb50_uBase_x36_46_x36_Data_x36_46_x36_Maybe_x36_46_x36_Maybe_ua dtb_u_u40)) dtb_u_u49) dtb_u_u48)), (fun dtb_u_u50 dtb_u_u51 -> (((B_dTrait_dOrd.v__x60__x61_ (v_Ord_u5afb3bbeddafcb50_uBase_x36_46_x36_Data_x36_46_x36_Maybe_x36_46_x36_Maybe_ua dtb_u_u40)) dtb_u_u51) dtb_u_u50)))))

# 98 "Base/Data/Maybe.vuna"
let v_Hashable_ue4b0f10b020a5e82_uBase_x36_46_x36_Data_x36_46_x36_Maybe_x36_46_x36_Maybe_ua = (fun dtb_u_u53 -> (B_dTrait_dHashable.C_Hashable_Hashable ((fun dtb_u_u54 -> (match dtb_u_u54 with
  | C_Maybe_Nothing -> 0
  | C_Maybe_Just (dtb_u_u55) -> ((B_dTrait_dHashable.v_hashCombine 1) ((B_dTrait_dHashable.v_hash dtb_u_u53) dtb_u_u55))
  | _ -> failwith "DT: impossible branch"
)))))

# 104 "Base/Data/Maybe.vuna"
let v_Semigroup_ueb264836545b3665_uBase_x36_46_x36_Data_x36_46_x36_Maybe_x36_46_x36_Maybe_ua = (fun dtb_u_u57 -> (B_dTrait_dMonoid.C_Semigroup_Semigroup ((fun dtb_u_u58 dtb_u_u59 -> (match dtb_u_u58 with
  | C_Maybe_Nothing -> C_Maybe_Nothing
  | C_Maybe_Just (dtb_u_u60) -> (match dtb_u_u59 with
  | C_Maybe_Nothing -> C_Maybe_Nothing
  | C_Maybe_Just (dtb_u_u61) -> (C_Maybe_Just ((((B_dTrait_dMonoid.v_mappend dtb_u_u57) dtb_u_u60) dtb_u_u61)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))))

# 113 "Base/Data/Maybe.vuna"
let v_Monoid_u4f2563914c7fbae1_uBase_x36_46_x36_Data_x36_46_x36_Maybe_x36_46_x36_Maybe_ua = (fun dtb_u_u63 -> (B_dTrait_dMonoid.C_Monoid_Monoid ((C_Maybe_Just ((B_dTrait_dMonoid.v_mempty dtb_u_u63))))))

# 116 "Base/Data/Maybe.vuna"
let v_Foldable_u2c890964dd357757_uBase_x36_46_x36_Data_x36_46_x36_Maybe_x36_46_x36_Maybe = (B_dTrait_dFoldable.C_Foldable_Foldable (((Obj.magic (fun dtb_u_u66 dtb_u_u67 dtb_u_u68 -> (match dtb_u_u68 with
  | C_Maybe_Nothing -> dtb_u_u67
  | C_Maybe_Just (dtb_u_u69) -> ((dtb_u_u66 dtb_u_u69) dtb_u_u67)
  | _ -> failwith "DT: impossible branch"
))) : Obj.t)))

# 122 "Base/Data/Maybe.vuna"
let v_Traversable_u3e5fb3267308d1c3_uBase_x36_46_x36_Data_x36_46_x36_Maybe_x36_46_x36_Maybe_uf = (fun dtb_u_u71 -> (B_dTrait_dTraversable.C_Traversable_Traversable (((Obj.magic (fun dtb_u_u74 dtb_u_u75 -> (match dtb_u_u75 with
  | C_Maybe_Nothing -> ((B_dTrait_dApplicative.v_pure dtb_u_u71) C_Maybe_Nothing)
  | C_Maybe_Just (dtb_u_u76) -> ((((B_dTrait_dApplicative.v_liftA2 dtb_u_u71) (fun dtb_u_u77 dtb_u_u78 -> (C_Maybe_Just (dtb_u_u77)))) (dtb_u_u74 dtb_u_u76)) ((B_dTrait_dApplicative.v_pure dtb_u_u71) dtb_u_u76))
  | _ -> failwith "DT: impossible branch"
))) : Obj.t))))

# 24 "Base/Data/Maybe.vuna"
let v_fromMaybe = (fun dtb_u_u80 dtb_u_u81 -> (match dtb_u_u81 with
  | C_Maybe_Just (dtb_u_u82) -> dtb_u_u82
  | C_Maybe_Nothing -> dtb_u_u80
  | _ -> failwith "DT: impossible branch"
))

# 29 "Base/Data/Maybe.vuna"
let v_isJust = (fun dtb_u_u84 -> (match dtb_u_u84 with
  | C_Maybe_Just (dtb_u_u85) -> true
  | C_Maybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
))

# 34 "Base/Data/Maybe.vuna"
let v_isNothing = (fun dtb_u_u87 -> (match dtb_u_u87 with
  | C_Maybe_Just (dtb_u_u88) -> false
  | C_Maybe_Nothing -> true
  | _ -> failwith "DT: impossible branch"
))

# 39 "Base/Data/Maybe.vuna"
let v_maybe = (fun dtb_u_u91 dtb_u_u92 dtb_u_u93 -> (match dtb_u_u93 with
  | C_Maybe_Just (dtb_u_u94) -> (dtb_u_u92 dtb_u_u94)
  | C_Maybe_Nothing -> dtb_u_u91
  | _ -> failwith "DT: impossible branch"
))
