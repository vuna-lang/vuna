open Vuna_runtime
type ('a0, 'a1) t_Cursor = C_Cursor_MkCursor of ('a0) * (('a0) -> ('a1 B_dData_dMaybe.t_Maybe, 'a0) B_dData_dPair.t_Pair B_dEffect_dCore.t_Eff)

# 25 "Base/Effect/Cursor.vuna"
let v_cursorOfState = (fun dtb_u_u4 dtb_u_u5 -> (C_Cursor_MkCursor (dtb_u_u4, dtb_u_u5)))

# 29 "Base/Effect/Cursor.vuna"
let v_next = (fun dtb_u_u9 -> (match dtb_u_u9 with
  | C_Cursor_MkCursor (dtb_u_u10, dtb_u_u11) -> (Obj.repr ((fun (dtb_u_u16 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u17 = Obj.obj ((dtb_u_u11 dtb_u_u10)) in (let dtb_u_u19 = (dtb_u_u17 dtb_u_u16) in (let dtb_u_u21 = { B_dData_dPair.f_Pair_first = (B_dData_dPair.v_firstOf dtb_u_u19); B_dData_dPair.f_Pair_second = (C_Cursor_MkCursor ((B_dData_dPair.v_secondOf dtb_u_u19), dtb_u_u11)) } in dtb_u_u21))))))
  | _ -> failwith "DT: impossible branch"
))

# 29 "Base/Effect/Cursor.vuna"
let v_next_u_udirect = (fun mc0 _u_ueffTok -> (match mc0 with
  | C_Cursor_MkCursor (dtb_u_u10, dtb_u_u11) -> (let dtb_u_u17 = Obj.obj ((dtb_u_u11 dtb_u_u10)) in (let dtb_u_u19 = (dtb_u_u17 _u_ueffTok) in (let dtb_u_u21 = { B_dData_dPair.f_Pair_first = (B_dData_dPair.v_firstOf dtb_u_u19); B_dData_dPair.f_Pair_second = (C_Cursor_MkCursor ((B_dData_dPair.v_secondOf dtb_u_u19), dtb_u_u11)) } in dtb_u_u21)))
  | _ -> failwith "DT: impossible branch"
))

# 36 "Base/Effect/Cursor.vuna"
let v_mapStep = (fun dtb_u_u27 dtb_u_u28 dtb_u_u29 -> (Obj.repr ((fun (dtb_u_u34 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u35 = Obj.obj ((dtb_u_u28 dtb_u_u29)) in (let dtb_u_u37 = (dtb_u_u35 dtb_u_u34) in (match dtb_u_u37 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u38; B_dData_dPair.f_Pair_second = dtb_u_u39 } -> (let dtb_u_u41 = { B_dData_dPair.f_Pair_first = (((B_dTrait_dFunctor.v_fmap B_dData_dMaybe.v_Functor_ua5312def40ac3976_uBase_x36_46_x36_Data_x36_46_x36_Maybe_x36_46_x36_Maybe) dtb_u_u27) dtb_u_u38); B_dData_dPair.f_Pair_second = dtb_u_u39 } in dtb_u_u41)
  | _ -> failwith "DT: impossible branch"
)))))))

# 36 "Base/Effect/Cursor.vuna"
let v_mapStep_u_udirect = (fun f step s _u_ueffTok -> (let dtb_u_u35 = Obj.obj ((step s)) in (let dtb_u_u37 = (dtb_u_u35 _u_ueffTok) in (match dtb_u_u37 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u38; B_dData_dPair.f_Pair_second = dtb_u_u39 } -> (let dtb_u_u41 = { B_dData_dPair.f_Pair_first = (((B_dTrait_dFunctor.v_fmap B_dData_dMaybe.v_Functor_ua5312def40ac3976_uBase_x36_46_x36_Data_x36_46_x36_Maybe_x36_46_x36_Maybe) f) dtb_u_u38); B_dData_dPair.f_Pair_second = dtb_u_u39 } in dtb_u_u41)
  | _ -> failwith "DT: impossible branch"
))))

# 33 "Base/Effect/Cursor.vuna"
let v_mapC = (fun dtb_u_u47 dtb_u_u48 -> (match dtb_u_u48 with
  | C_Cursor_MkCursor (dtb_u_u49, dtb_u_u50) -> (C_Cursor_MkCursor (dtb_u_u49, ((v_mapStep dtb_u_u47) dtb_u_u50)))
  | _ -> failwith "DT: impossible branch"
))

# 46 "Base/Effect/Cursor.vuna"
let v_ofListStep = (fun dtb_u_u53 -> (match dtb_u_u53 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u54, dtb_u_u55) -> (let dtb_u_u57 = { B_dData_dPair.f_Pair_first = (B_dData_dMaybe.C_Maybe_Just (dtb_u_u54)); B_dData_dPair.f_Pair_second = dtb_u_u55 } in (Obj.repr ((fun (dtb_u_u58 : B_dEffect_dCore.t_EffUnit) -> dtb_u_u57))))
  | B_dData_dList.C_List_Nil -> (let dtb_u_u60 = { B_dData_dPair.f_Pair_first = B_dData_dMaybe.C_Maybe_Nothing; B_dData_dPair.f_Pair_second = B_dData_dList.C_List_Nil } in (Obj.repr ((fun (dtb_u_u61 : B_dEffect_dCore.t_EffUnit) -> dtb_u_u60))))
  | _ -> failwith "DT: impossible branch"
))

# 46 "Base/Effect/Cursor.vuna"
let v_ofListStep_u_udirect = (fun mc0 _u_ueffTok -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u54, dtb_u_u55) -> (let dtb_u_u57 = { B_dData_dPair.f_Pair_first = (B_dData_dMaybe.C_Maybe_Just (dtb_u_u54)); B_dData_dPair.f_Pair_second = dtb_u_u55 } in dtb_u_u57)
  | B_dData_dList.C_List_Nil -> (let dtb_u_u60 = { B_dData_dPair.f_Pair_first = B_dData_dMaybe.C_Maybe_Nothing; B_dData_dPair.f_Pair_second = B_dData_dList.C_List_Nil } in dtb_u_u60)
  | _ -> failwith "DT: impossible branch"
))

# 43 "Base/Effect/Cursor.vuna"
let v_ofList = (fun dtb_u_u64 -> (C_Cursor_MkCursor (dtb_u_u64, v_ofListStep)))

# 51 "Base/Effect/Cursor.vuna"
let rec v_takeC = (fun (dtb_u_u68 : int) dtb_u_u69 -> (if (dtb_u_u68 <= 0) then (let dtb_u_u71 = { B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = dtb_u_u69 } in (Obj.repr ((fun (dtb_u_u72 : B_dEffect_dCore.t_EffUnit) -> dtb_u_u71)))) else (Obj.repr ((fun (dtb_u_u77 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u80 = ((v_next_u_udirect dtb_u_u69) dtb_u_u77) in (match dtb_u_u80 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u81; B_dData_dPair.f_Pair_second = dtb_u_u82 } -> (match dtb_u_u81 with
  | B_dData_dMaybe.C_Maybe_Nothing -> (let dtb_u_u84 = { B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = dtb_u_u82 } in dtb_u_u84)
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u86) -> (let dtb_u_u94 = (((v_takeC_u_udirect (dtb_u_u68 - 1)) dtb_u_u82) dtb_u_u77) in (match dtb_u_u94 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u95; B_dData_dPair.f_Pair_second = dtb_u_u96 } -> (let dtb_u_u98 = { B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ (dtb_u_u86, dtb_u_u95)); B_dData_dPair.f_Pair_second = dtb_u_u96 } in dtb_u_u98)
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))))))
# 51 "Base/Effect/Cursor.vuna"
and v_takeC_u_udirect = (fun (n : int) c _u_ueffTok -> (if (n <= 0) then (let dtb_u_u71 = { B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = c } in dtb_u_u71) else (let dtb_u_u80 = ((v_next_u_udirect c) _u_ueffTok) in (match dtb_u_u80 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u81; B_dData_dPair.f_Pair_second = dtb_u_u82 } -> (match dtb_u_u81 with
  | B_dData_dMaybe.C_Maybe_Nothing -> (let dtb_u_u84 = { B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = dtb_u_u82 } in dtb_u_u84)
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u86) -> (let dtb_u_u94 = (((v_takeC_u_udirect (n - 1)) dtb_u_u82) _u_ueffTok) in (match dtb_u_u94 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u95; B_dData_dPair.f_Pair_second = dtb_u_u96 } -> (let dtb_u_u98 = { B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ (dtb_u_u86, dtb_u_u95)); B_dData_dPair.f_Pair_second = dtb_u_u96 } in dtb_u_u98)
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))

# 67 "Base/Effect/Cursor.vuna"
let rec v_foldC = (fun (dtb_u_u104 : int) dtb_u_u105 dtb_u_u106 dtb_u_u107 -> (if (dtb_u_u104 <= 0) then (let dtb_u_u109 = { B_dData_dPair.f_Pair_first = dtb_u_u106; B_dData_dPair.f_Pair_second = dtb_u_u107 } in (Obj.repr ((fun (dtb_u_u110 : B_dEffect_dCore.t_EffUnit) -> dtb_u_u109)))) else (Obj.repr ((fun (dtb_u_u115 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u118 = ((v_next_u_udirect dtb_u_u107) dtb_u_u115) in (match dtb_u_u118 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u119; B_dData_dPair.f_Pair_second = dtb_u_u120 } -> (match dtb_u_u119 with
  | B_dData_dMaybe.C_Maybe_Nothing -> (let dtb_u_u122 = { B_dData_dPair.f_Pair_first = dtb_u_u106; B_dData_dPair.f_Pair_second = dtb_u_u120 } in dtb_u_u122)
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u124) -> ((Obj.magic ((((v_foldC (dtb_u_u104 - 1)) dtb_u_u105) ((dtb_u_u105 dtb_u_u106) dtb_u_u124)) dtb_u_u120)) dtb_u_u115)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))))))
# 67 "Base/Effect/Cursor.vuna"
and v_foldC_u_udirect = (fun (n : int) f acc c _u_ueffTok -> (if (n <= 0) then (let dtb_u_u109 = { B_dData_dPair.f_Pair_first = acc; B_dData_dPair.f_Pair_second = c } in dtb_u_u109) else (let dtb_u_u118 = ((v_next_u_udirect c) _u_ueffTok) in (match dtb_u_u118 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u119; B_dData_dPair.f_Pair_second = dtb_u_u120 } -> (match dtb_u_u119 with
  | B_dData_dMaybe.C_Maybe_Nothing -> (let dtb_u_u122 = { B_dData_dPair.f_Pair_first = acc; B_dData_dPair.f_Pair_second = dtb_u_u120 } in dtb_u_u122)
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u124) -> ((Obj.magic ((((v_foldC (n - 1)) f) ((f acc) dtb_u_u124)) dtb_u_u120)) _u_ueffTok)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))
