open Vuna_runtime
type 'a0 t_Base_dMaybe_dMaybe = C_Base_dMaybe_dMaybe_Nothing | C_Base_dMaybe_dMaybe_Just of ('a0)

let v_Functor_uBase_dMaybe_dMaybe = (Base_dMonad.C_Dict_uBase_dMonad_dFunctor_Functor ((fun f m -> (match m with
  | C_Base_dMaybe_dMaybe_Nothing -> C_Base_dMaybe_dMaybe_Nothing
  | C_Base_dMaybe_dMaybe_Just (dtb__0) -> (C_Base_dMaybe_dMaybe_Just ((f dtb__0)))
  | _ -> failwith "DT: impossible branch"
))))

let v_Monad_uBase_dMaybe_dMaybe = (Base_dMonad.C_Dict_uBase_dMonad_dMonad_Monad ((fun m f -> (match m with
  | C_Base_dMaybe_dMaybe_Nothing -> C_Base_dMaybe_dMaybe_Nothing
  | C_Base_dMaybe_dMaybe_Just (dtb__1) -> (f dtb__1)
  | _ -> failwith "DT: impossible branch"
)), (fun x -> (C_Base_dMaybe_dMaybe_Just (x)))))

let v_Show_uBase_dMaybe_dMaybe_ua = (fun _uctx0 -> (Base_dShow.C_Dict_uBase_dShow_dShow_Show ((fun m -> (match m with
  | C_Base_dMaybe_dMaybe_Nothing -> "Nothing"
  | C_Base_dMaybe_dMaybe_Just (dtb__2) -> ("Just " ^ ((Base_dShow.v_Base_dShow_dshow _uctx0) dtb__2))
  | _ -> failwith "DT: impossible branch"
)))))

let v_Base_dMaybe_dfromMaybe = (fun mc0 mc1 -> (match mc1 with
  | C_Base_dMaybe_dMaybe_Just (dtb__3) -> dtb__3
  | C_Base_dMaybe_dMaybe_Nothing -> mc0
  | _ -> failwith "DT: impossible branch"
))

let v_Base_dMaybe_disJust = (fun mc0 -> (match mc0 with
  | C_Base_dMaybe_dMaybe_Just (dtb__4) -> true
  | C_Base_dMaybe_dMaybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
))

let v_Base_dMaybe_disNothing = (fun mc0 -> (match mc0 with
  | C_Base_dMaybe_dMaybe_Just (dtb__5) -> false
  | C_Base_dMaybe_dMaybe_Nothing -> true
  | _ -> failwith "DT: impossible branch"
))

let v_Base_dMaybe_dmaybe = (fun mc0 mc1 mc2 -> (match mc2 with
  | C_Base_dMaybe_dMaybe_Just (dtb__6) -> (mc1 dtb__6)
  | C_Base_dMaybe_dMaybe_Nothing -> mc0
  | _ -> failwith "DT: impossible branch"
))

let v_Base_dMaybe_dmapJust = (fun mc0 mc1 -> (match mc1 with
  | C_Base_dMaybe_dMaybe_Just (dtb__7) -> (C_Base_dMaybe_dMaybe_Just ((mc0 dtb__7)))
  | C_Base_dMaybe_dMaybe_Nothing -> C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))
