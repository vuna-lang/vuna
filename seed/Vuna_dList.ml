open Vuna_runtime
open Vuna_dPair
open Vuna_dBool
open Vuna_dMonad
open Vuna_dMaybe
let rec v_Vuna_dList_dappend = fun a0 a1 -> match (a0, a1) with
  | ([], ys) -> ys
  | ((x) :: (xs), ys) -> (x) :: (v_Vuna_dList_dappend xs ys)
  | _ -> vuna_fail "stdlib/lib/Vuna/List.vuna" 16 1 ("no matching clause for Vuna.List.append")

let rec v_Vuna_dList_dreverseOnto = fun a0 a1 -> match (a0, a1) with
  | ([], acc) -> acc
  | ((x) :: (xs), acc) -> v_Vuna_dList_dreverseOnto xs ((x) :: (acc))
  | _ -> vuna_fail "stdlib/lib/Vuna/List.vuna" 20 1 ("no matching clause for Vuna.List.reverseOnto")

let v_Vuna_dList_dreverse = fun xs -> v_Vuna_dList_dreverseOnto xs []

let rec v_Vuna_dList_dlength = fun a0 -> match a0 with
  | ([]) -> 0
  | ((x) :: (xs)) -> bi_add 1 (v_Vuna_dList_dlength xs)
  | _ -> vuna_fail "stdlib/lib/Vuna/List.vuna" 27 1 ("no matching clause for Vuna.List.length")

let rec v_Vuna_dList_dmap = fun a0 a1 -> match (a0, a1) with
  | (f, []) -> []
  | (f, (x) :: (xs)) -> (f x) :: (v_Vuna_dList_dmap f xs)
  | _ -> vuna_fail "stdlib/lib/Vuna/List.vuna" 31 1 ("no matching clause for Vuna.List.map")

let rec v_Vuna_dList_dfilter = fun a0 a1 -> match (a0, a1) with
  | (p, []) -> []
  | (p, (x) :: (xs)) -> if p x then (x) :: (v_Vuna_dList_dfilter p xs) else v_Vuna_dList_dfilter p xs
  | _ -> vuna_fail "stdlib/lib/Vuna/List.vuna" 35 1 ("no matching clause for Vuna.List.filter")

let rec v_Vuna_dList_dfoldl = fun a0 a1 a2 -> match (a0, a1, a2) with
  | (f, acc, []) -> acc
  | (f, acc, (x) :: (xs)) -> v_Vuna_dList_dfoldl f (f acc x) xs
  | _ -> vuna_fail "stdlib/lib/Vuna/List.vuna" 40 1 ("no matching clause for Vuna.List.foldl")

let rec v_Vuna_dList_dfoldr = fun a0 a1 a2 -> match (a0, a1, a2) with
  | (f, acc, []) -> acc
  | (f, acc, (x) :: (xs)) -> f x (v_Vuna_dList_dfoldr f acc xs)
  | _ -> vuna_fail "stdlib/lib/Vuna/List.vuna" 44 1 ("no matching clause for Vuna.List.foldr")

let rec v_Vuna_dList_dconcatMap = fun a0 a1 -> match (a0, a1) with
  | (f, []) -> []
  | (f, (x) :: (rest)) -> v_Vuna_dList_dappend (f x) (v_Vuna_dList_dconcatMap f rest)
  | _ -> vuna_fail "stdlib/lib/Vuna/List.vuna" 48 1 ("no matching clause for Vuna.List.concatMap")

let v_Vuna_dList_dflatMap = fun f xs -> v_Vuna_dList_dconcatMap f xs

let rec v_Vuna_dList_dmem = fun a0 a1 -> match (a0, a1) with
  | (x, []) -> false
  | (x, (y) :: (rest)) -> if v_vuna_ueq_ugeneric x y then true else v_Vuna_dList_dmem x rest
  | _ -> vuna_fail "stdlib/lib/Vuna/List.vuna" 55 1 ("no matching clause for Vuna.List.mem")

let rec v_Vuna_dList_dmemName = fun a0 a1 -> match (a0, a1) with
  | (name, []) -> false
  | (name, (x) :: (rest)) -> if v_vuna_ueq_ustr x name then true else v_Vuna_dList_dmemName name rest
  | _ -> vuna_fail "stdlib/lib/Vuna/List.vuna" 59 1 ("no matching clause for Vuna.List.memName")

let rec v_Vuna_dList_dlookupPair = fun a0 a1 -> match (a0, a1) with
  | (name, []) -> C_Vuna_dMaybe_dNothing
  | (name, (C_Vuna_dPair_dPair (k, v)) :: (rest)) -> if v_vuna_ueq_ustr k name then C_Vuna_dMaybe_dJust (v) else v_Vuna_dList_dlookupPair name rest
  | _ -> vuna_fail "stdlib/lib/Vuna/List.vuna" 63 1 ("no matching clause for Vuna.List.lookupPair")

let rec v_Vuna_dList_dzip = fun a0 a1 -> match (a0, a1) with
  | ([], ys) -> []
  | (xs, []) -> []
  | ((x) :: (xs), (y) :: (ys)) -> (C_Vuna_dPair_dPair (x, y)) :: (v_Vuna_dList_dzip xs ys)
  | _ -> vuna_fail "stdlib/lib/Vuna/List.vuna" 68 1 ("no matching clause for Vuna.List.zip")

let rec v_Vuna_dList_dtake = fun a0 a1 -> match (a0, a1) with
  | (n, []) -> []
  | (n, (x) :: (xs)) -> if v_vuna_ule_uint n 0 then [] else (x) :: (v_Vuna_dList_dtake (bi_sub n 1) xs)
  | _ -> vuna_fail "stdlib/lib/Vuna/List.vuna" 73 1 ("no matching clause for Vuna.List.take")

let rec v_Vuna_dList_ddrop = fun a0 a1 -> match (a0, a1) with
  | (n, []) -> []
  | (n, (x) :: (xs)) -> if v_vuna_ule_uint n 0 then (x) :: (xs) else v_Vuna_dList_ddrop (bi_sub n 1) xs
  | _ -> vuna_fail "stdlib/lib/Vuna/List.vuna" 77 1 ("no matching clause for Vuna.List.drop")

let rec v_Vuna_dList_drange = fun i n -> if v_vuna_uge_uint i n then [] else (i) :: (v_Vuna_dList_drange (bi_add i 1) n)

let rec v_Vuna_dList_dmapMaybe = fun a0 a1 -> match (a0, a1) with
  | (f, []) -> []
  | (f, (x) :: (xs)) -> (match f x with
  | C_Vuna_dMaybe_dNothing -> v_Vuna_dList_dmapMaybe f xs
  | C_Vuna_dMaybe_dJust (y) -> (y) :: (v_Vuna_dList_dmapMaybe f xs)
  | _ -> vuna_fail "stdlib/lib/Vuna/List.vuna" 86 3 ("case pattern match failure"))
  | _ -> vuna_fail "stdlib/lib/Vuna/List.vuna" 84 1 ("no matching clause for Vuna.List.mapMaybe")

let v_vuna_uinst_ud_uVuna_uList_uList_ufmap = fun f xs -> v_Vuna_dList_dmap f xs

let v_vuna_uinst_ud_uVuna_uList_uList_upure = fun x -> (x) :: ([])

let v_vuna_uinst_ud_uVuna_uList_uList_ubind = fun xs f -> v_Vuna_dList_dconcatMap f xs

let rec v_vuna_ueq_uVuna_uList_uList = fun x y -> (match x with
  | [] -> (match y with
  | [] -> v_vuna_ueq_uint 0 0
  | _ -> v_vuna_ueq_uint 0 1
  | _ -> vuna_fail "<generated>" 460 10 ("case pattern match failure"))
  | (v0) :: (v1) -> (match y with
  | (w0) :: (w1) -> (if (v_vuna_ueq_ugeneric v0 w0) then (v_vuna_ueq_uVuna_uList_uList v1 w1) else false)
  | _ -> v_vuna_ueq_uint 0 1
  | _ -> vuna_fail "<generated>" 463 17 ("case pattern match failure"))
  | _ -> v_vuna_ueq_uint 0 1
  | _ -> vuna_fail "<generated>" 459 30 ("case pattern match failure"))

let v_vuna_uneq_uVuna_uList_uList = fun x y -> if v_vuna_ueq_uVuna_uList_uList x y then v_vuna_ueq_uint 0 1 else v_vuna_ueq_uint 0 0
