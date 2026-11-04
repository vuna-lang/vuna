open Vuna_runtime
open Base_dPair
open Base_dBool
open Base_dMonad
type 'a0 t_Base_dMaybe_dMaybe = C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust of ('a0)

let v_Base_dMonad_dFunctor_uBase_dMonad_dFunctor_uBase_dMaybe_dMaybe = (C_Dict_uBase_dMonad_dFunctor_MkDict_uBase_dMonad_dFunctor ((fun f -> (fun m -> (match m with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__0) -> (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((f dtb__0)))
  | _ -> failwith "DT: impossible branch"
)))))

let v_Base_dMonad_dMonad_uBase_dMonad_dMonad_uBase_dMaybe_dMaybe = (C_Dict_uBase_dMonad_dMonad_MkDict_uBase_dMonad_dMonad ((fun m -> (fun f -> (match m with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__1) -> (f dtb__1)
  | _ -> failwith "DT: impossible branch"
))), (fun x -> (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (x)))))

let v_Base_dMaybe_dfromMaybe = (fun d -> (fun m -> (match m with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> d
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__2) -> dtb__2
  | _ -> failwith "DT: impossible branch"
)))

let v_Base_dMaybe_disJust = (fun m -> (match m with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> false
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__3) -> true
  | _ -> failwith "DT: impossible branch"
))

let v_Base_dMaybe_disNothing = (fun m -> (match m with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> true
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__4) -> false
  | _ -> failwith "DT: impossible branch"
))

let v_Base_dMaybe_dmaybe = (fun d -> (fun f -> (fun m -> (match m with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> d
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__5) -> (f dtb__5)
  | _ -> failwith "DT: impossible branch"
))))

let v_Base_dMaybe_dmapJust = (fun f -> (fun m -> (match m with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__6) -> (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((f dtb__6)))
  | _ -> failwith "DT: impossible branch"
)))
