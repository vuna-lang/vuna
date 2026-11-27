open Vuna_runtime
type ('a0, 'a1) t_Cursor = C_Cursor_MkCursor of ('a0) * (('a0) -> ('a1 B_dData_dMaybe.t_Maybe, 'a0) B_dData_dPair.t_Pair B_dEffect_dCore.t_Eff)

# 25 "Base/Effect/Cursor.vuna"
let v_cursorOfState = (fun s step -> (C_Cursor_MkCursor (s, step)))

# 29 "Base/Effect/Cursor.vuna"
let v_next = (fun mc0 -> (match mc0 with
  | C_Cursor_MkCursor (dtb__0, dtb__1) -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__2 = Obj.obj (e) in (let dtb__3 = Obj.obj ((k (dtb__2 u))) in (dtb__3 u)))))) (dtb__1 dtb__0)) (fun p -> (let x = { B_dData_dPair.f_Pair_first = (B_dData_dPair.v_firstOf p); B_dData_dPair.f_Pair_second = (C_Cursor_MkCursor ((B_dData_dPair.v_secondOf p), dtb__1)) } in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x)))))
  | _ -> failwith "DT: impossible branch"
))

# 36 "Base/Effect/Cursor.vuna"
let v_mapStep = (fun f step s -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__4 = Obj.obj (e) in (let dtb__5 = Obj.obj ((k (dtb__4 u))) in (dtb__5 u)))))) (step s)) (fun p -> (match p with
  | { B_dData_dPair.f_Pair_first = dtb__6; B_dData_dPair.f_Pair_second = dtb__7 } -> (let x = { B_dData_dPair.f_Pair_first = (((B_dTrait_dFunctor.v_fmap B_dData_dMaybe.v_Functor_ua5312def40ac3976_uBase_x36_46_x36_Data_x36_46_x36_Maybe_x36_46_x36_Maybe) f) dtb__6); B_dData_dPair.f_Pair_second = dtb__7 } in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x)))
  | _ -> failwith "DT: impossible branch"
))))

# 33 "Base/Effect/Cursor.vuna"
let v_mapC = (fun mc0 mc1 -> (match mc1 with
  | C_Cursor_MkCursor (dtb__8, dtb__9) -> (C_Cursor_MkCursor (dtb__8, ((v_mapStep mc0) dtb__9)))
  | _ -> failwith "DT: impossible branch"
))

# 46 "Base/Effect/Cursor.vuna"
let v_ofListStep = (fun mc0 -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__10, dtb__11) -> (let x = { B_dData_dPair.f_Pair_first = (B_dData_dMaybe.C_Maybe_Just (dtb__10)); B_dData_dPair.f_Pair_second = dtb__11 } in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x)))
  | B_dData_dList.C_List_Nil -> (let x = { B_dData_dPair.f_Pair_first = B_dData_dMaybe.C_Maybe_Nothing; B_dData_dPair.f_Pair_second = B_dData_dList.C_List_Nil } in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x)))
  | _ -> failwith "DT: impossible branch"
))

# 43 "Base/Effect/Cursor.vuna"
let v_ofList = (fun xs -> (C_Cursor_MkCursor (xs, v_ofListStep)))

# 51 "Base/Effect/Cursor.vuna"
let rec v_takeC = (fun (n : int) c -> (if (n <= 0) then (let x = { B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = c } in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x))) else (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__12 = Obj.obj (e) in (let dtb__13 = Obj.obj ((k (dtb__12 u))) in (dtb__13 u)))))) (v_next c)) (fun p -> (match p with
  | { B_dData_dPair.f_Pair_first = dtb__14; B_dData_dPair.f_Pair_second = dtb__15 } -> (match dtb__14 with
  | B_dData_dMaybe.C_Maybe_Nothing -> (let x = { B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = dtb__15 } in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x)))
  | B_dData_dMaybe.C_Maybe_Just (dtb__16) -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__17 = Obj.obj (e) in (let dtb__18 = Obj.obj ((k (dtb__17 u))) in (dtb__18 u)))))) ((v_takeC (n - 1)) dtb__15)) (fun q -> (match q with
  | { B_dData_dPair.f_Pair_first = dtb__19; B_dData_dPair.f_Pair_second = dtb__20 } -> (let x = { B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ (dtb__16, dtb__19)); B_dData_dPair.f_Pair_second = dtb__20 } in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x)))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))))

# 67 "Base/Effect/Cursor.vuna"
let rec v_foldC = (fun (n : int) f acc c -> (if (n <= 0) then (let x = { B_dData_dPair.f_Pair_first = acc; B_dData_dPair.f_Pair_second = c } in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x))) else (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__21 = Obj.obj (e) in (let dtb__22 = Obj.obj ((k (dtb__21 u))) in (dtb__22 u)))))) (v_next c)) (fun p -> (match p with
  | { B_dData_dPair.f_Pair_first = dtb__23; B_dData_dPair.f_Pair_second = dtb__24 } -> (match dtb__23 with
  | B_dData_dMaybe.C_Maybe_Nothing -> (let x = { B_dData_dPair.f_Pair_first = acc; B_dData_dPair.f_Pair_second = dtb__24 } in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x)))
  | B_dData_dMaybe.C_Maybe_Just (dtb__25) -> ((((v_foldC (n - 1)) f) ((f acc) dtb__25)) dtb__24)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))))
