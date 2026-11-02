open Vuna_runtime
open Vuna_builtins
open Base_dPair
open Base_dBool
open Base_dMonad
open Base_dMaybe
open Base_dEq
type 'a0 t_Base_dList_dList = C_Base_dList_dList_Nil | C_Base_dList_dList_Cons of ('a0) * ('a0 t_Base_dList_dList)


let dtp_unpack (s : string) =
  let cs = List.init (String.length s) (fun i -> Char.code s.[i]) in
  List.fold_right (fun x acc -> C_Base_dList_dList_Cons (x, acc)) cs C_Base_dList_dList_Nil
let dtp_pack xs =
  let rec to_list xs = match xs with C_Base_dList_dList_Nil -> [] | C_Base_dList_dList_Cons (x, rest) -> x :: to_list rest in
  let cs = to_list xs in
  String.init (List.length cs) (fun i -> Char.chr (List.nth cs i))

let dtp_listOf xs = List.fold_right (fun x acc -> C_Base_dList_dList_Cons (x, acc)) xs C_Base_dList_dList_Nil
let dtp_ocamlOf xs =
  let rec go l = match l with C_Base_dList_dList_Nil -> [] | C_Base_dList_dList_Cons (x, rest) -> x :: go rest in
  go xs
let rec v_Base_dList_dappend = (fun mc0 -> (fun mc1 -> (match mc0 with
  | C_Base_dList_dList_Cons (dtb__0, dtb__1) -> (C_Base_dList_dList_Cons (dtb__0, ((v_Base_dList_dappend dtb__1) mc1)))
  | C_Base_dList_dList_Nil -> mc1
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Base_dList_dreverseOnto = (fun mc0 -> (fun mc1 -> (match mc0 with
  | C_Base_dList_dList_Cons (dtb__2, dtb__3) -> ((v_Base_dList_dreverseOnto dtb__3) (C_Base_dList_dList_Cons (dtb__2, mc1)))
  | C_Base_dList_dList_Nil -> mc1
  | _ -> failwith "DT: impossible branch"
)))

let v_Base_dList_dreverse = (fun xs -> ((v_Base_dList_dreverseOnto xs) C_Base_dList_dList_Nil))

let rec v_Base_dList_dlength = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Cons (dtb__4, dtb__5) -> ((bi_add 1) (v_Base_dList_dlength dtb__5))
  | C_Base_dList_dList_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))

let rec v_Base_dList_dmap = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Base_dList_dList_Cons (dtb__6, dtb__7) -> (C_Base_dList_dList_Cons ((mc0 dtb__6), ((v_Base_dList_dmap mc0) dtb__7)))
  | C_Base_dList_dList_Nil -> C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
)))

let v_Base_dList_dBase_dMonad_dFunctor_uBase_dMonad_dFunctor_uBase_dList_dList = fun () -> (C_Dict_uBase_dMonad_dFunctor_MkDict_uBase_dMonad_dFunctor ((fun f -> (fun xs -> ((v_Base_dList_dmap f) xs)))))

let rec v_Base_dList_dfilter = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Base_dList_dList_Cons (dtb__8, dtb__9) -> (if (mc0 dtb__8) then (C_Base_dList_dList_Cons (dtb__8, ((v_Base_dList_dfilter mc0) dtb__9))) else ((v_Base_dList_dfilter mc0) dtb__9))
  | C_Base_dList_dList_Nil -> C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Base_dList_dfoldl = (fun mc0 -> (fun mc1 -> (fun mc2 -> (match mc2 with
  | C_Base_dList_dList_Cons (dtb__10, dtb__11) -> (((v_Base_dList_dfoldl mc0) ((mc0 mc1) dtb__10)) dtb__11)
  | C_Base_dList_dList_Nil -> mc1
  | _ -> failwith "DT: impossible branch"
))))

let rec v_Base_dList_dfoldr = (fun mc0 -> (fun mc1 -> (fun mc2 -> (match mc2 with
  | C_Base_dList_dList_Cons (dtb__12, dtb__13) -> ((mc0 dtb__12) (((v_Base_dList_dfoldr mc0) mc1) dtb__13))
  | C_Base_dList_dList_Nil -> mc1
  | _ -> failwith "DT: impossible branch"
))))

let rec v_Base_dList_dconcatMap = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Base_dList_dList_Cons (dtb__14, dtb__15) -> ((v_Base_dList_dappend (mc0 dtb__14)) ((v_Base_dList_dconcatMap mc0) dtb__15))
  | C_Base_dList_dList_Nil -> C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
)))

let v_Base_dList_dBase_dMonad_dMonad_uBase_dMonad_dMonad_uBase_dList_dList = fun () -> (C_Dict_uBase_dMonad_dMonad_MkDict_uBase_dMonad_dMonad ((fun xs -> (fun f -> ((v_Base_dList_dconcatMap f) xs))), (fun x -> (C_Base_dList_dList_Cons (x, C_Base_dList_dList_Nil)))))

let v_Base_dList_dflatMap = (fun f -> (fun xs -> ((v_Base_dList_dconcatMap f) xs)))

let rec v_Base_dList_dmem = (fun d27 -> (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Base_dList_dList_Cons (dtb__16, dtb__17) -> (if (((v_Base_dEq_deq d27) mc0) dtb__16) then true else (((v_Base_dList_dmem d27) mc0) dtb__17))
  | C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))))

let rec v_Base_dList_dmemName = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Base_dList_dList_Cons (dtb__18, dtb__19) -> (if ((bi_eq_str dtb__18) mc0) then true else ((v_Base_dList_dmemName mc0) dtb__19))
  | C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Base_dList_dlookupPair = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Base_dList_dList_Cons (dtb__20, dtb__21) -> (if ((bi_eq_str (v_Base_dPair_dfirstOf dtb__20)) mc0) then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((v_Base_dPair_dsecondOf dtb__20))) else ((v_Base_dList_dlookupPair mc0) dtb__21))
  | C_Base_dList_dList_Nil -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Base_dList_dzip = (fun mc0 -> (fun mc1 -> (match mc0 with
  | C_Base_dList_dList_Cons (dtb__22, dtb__23) -> (match mc1 with
  | C_Base_dList_dList_Cons (dtb__24, dtb__25) -> (C_Base_dList_dList_Cons ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__22, dtb__24)), ((v_Base_dList_dzip dtb__23) dtb__25)))
  | _ -> C_Base_dList_dList_Nil
)
  | _ -> C_Base_dList_dList_Nil
)))

let rec v_Base_dList_dtake = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Base_dList_dList_Cons (dtb__26, dtb__27) -> (if ((bi_le_int mc0) 0) then C_Base_dList_dList_Nil else (C_Base_dList_dList_Cons (dtb__26, ((v_Base_dList_dtake ((bi_sub mc0) 1)) dtb__27))))
  | C_Base_dList_dList_Nil -> C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Base_dList_ddrop = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Base_dList_dList_Cons (dtb__28, dtb__29) -> (if ((bi_le_int mc0) 0) then (C_Base_dList_dList_Cons (dtb__28, dtb__29)) else ((v_Base_dList_ddrop ((bi_sub mc0) 1)) dtb__29))
  | C_Base_dList_dList_Nil -> C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Base_dList_drange = (fun i -> (fun n -> (if ((bi_ge_int i) n) then C_Base_dList_dList_Nil else (C_Base_dList_dList_Cons (i, ((v_Base_dList_drange ((bi_add i) 1)) n))))))

let rec v_Base_dList_dmapMaybe = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Base_dList_dList_Cons (dtb__30, dtb__31) -> (match (mc0 dtb__30) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((v_Base_dList_dmapMaybe mc0) dtb__31)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__32) -> (C_Base_dList_dList_Cons (dtb__32, ((v_Base_dList_dmapMaybe mc0) dtb__31)))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Nil -> C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
)))
