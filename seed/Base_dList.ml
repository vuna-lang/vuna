open Vuna_runtime
open Base_dPair
open Base_dBool
open Base_dMonad
open Base_dMaybe
let rec v_Base_dList_dappend = fun a0 a1 -> match (a0, a1) with
  | ([], ys) -> ys
  | ((x) :: (xs), ys) -> (x) :: (v_Base_dList_dappend xs ys)
  | _ -> vuna_fail "base/lib/Base/List.vuna" 15 1 ("no matching clause for Base.List.append")

let rec v_Base_dList_dreverseOnto = fun a0 a1 -> match (a0, a1) with
  | ([], acc) -> acc
  | ((x) :: (xs), acc) -> v_Base_dList_dreverseOnto xs ((x) :: (acc))
  | _ -> vuna_fail "base/lib/Base/List.vuna" 19 1 ("no matching clause for Base.List.reverseOnto")

let v_Base_dList_dreverse = fun xs -> v_Base_dList_dreverseOnto xs []

let rec v_Base_dList_dlength = fun a0 -> match a0 with
  | ([]) -> 0
  | ((x) :: (xs)) -> bi_add 1 (v_Base_dList_dlength xs)
  | _ -> vuna_fail "base/lib/Base/List.vuna" 26 1 ("no matching clause for Base.List.length")

let rec v_Base_dList_dmap = fun a0 a1 -> match (a0, a1) with
  | (f, []) -> []
  | (f, (x) :: (xs)) -> (f x) :: (v_Base_dList_dmap f xs)
  | _ -> vuna_fail "base/lib/Base/List.vuna" 30 1 ("no matching clause for Base.List.map")

let rec v_Base_dList_dfilter = fun a0 a1 -> match (a0, a1) with
  | (p, []) -> []
  | (p, (x) :: (xs)) -> if p x then (x) :: (v_Base_dList_dfilter p xs) else v_Base_dList_dfilter p xs
  | _ -> vuna_fail "base/lib/Base/List.vuna" 34 1 ("no matching clause for Base.List.filter")

let rec v_Base_dList_dfoldl = fun a0 a1 a2 -> match (a0, a1, a2) with
  | (f, acc, []) -> acc
  | (f, acc, (x) :: (xs)) -> v_Base_dList_dfoldl f (f acc x) xs
  | _ -> vuna_fail "base/lib/Base/List.vuna" 38 1 ("no matching clause for Base.List.foldl")

let rec v_Base_dList_dfoldr = fun a0 a1 a2 -> match (a0, a1, a2) with
  | (f, acc, []) -> acc
  | (f, acc, (x) :: (xs)) -> f x (v_Base_dList_dfoldr f acc xs)
  | _ -> vuna_fail "base/lib/Base/List.vuna" 42 1 ("no matching clause for Base.List.foldr")

let rec v_Base_dList_dconcatMap = fun a0 a1 -> match (a0, a1) with
  | (f, []) -> []
  | (f, (x) :: (rest)) -> v_Base_dList_dappend (f x) (v_Base_dList_dconcatMap f rest)
  | _ -> vuna_fail "base/lib/Base/List.vuna" 46 1 ("no matching clause for Base.List.concatMap")

let v_Base_dList_dflatMap = fun f xs -> v_Base_dList_dconcatMap f xs

let rec v_Base_dList_dmem = fun a0 a1 -> match (a0, a1) with
  | (x, []) -> false
  | (x, (y) :: (rest)) -> if v_vuna_ueq_ugeneric x y then true else v_Base_dList_dmem x rest
  | _ -> vuna_fail "base/lib/Base/List.vuna" 53 1 ("no matching clause for Base.List.mem")

let rec v_Base_dList_dmemName = fun a0 a1 -> match (a0, a1) with
  | (name, []) -> false
  | (name, (x) :: (rest)) -> if v_vuna_ueq_ustr x name then true else v_Base_dList_dmemName name rest
  | _ -> vuna_fail "base/lib/Base/List.vuna" 57 1 ("no matching clause for Base.List.memName")

let rec v_Base_dList_dlookupPair = fun a0 a1 -> match (a0, a1) with
  | (name, []) -> C_Base_dMaybe_dNothing
  | (name, (C_Base_dPair_dPair (k, v)) :: (rest)) -> if v_vuna_ueq_ustr k name then C_Base_dMaybe_dJust (v) else v_Base_dList_dlookupPair name rest
  | _ -> vuna_fail "base/lib/Base/List.vuna" 61 1 ("no matching clause for Base.List.lookupPair")

let rec v_Base_dList_dzip = fun a0 a1 -> match (a0, a1) with
  | ([], ys) -> []
  | (xs, []) -> []
  | ((x) :: (xs), (y) :: (ys)) -> (C_Base_dPair_dPair (x, y)) :: (v_Base_dList_dzip xs ys)
  | _ -> vuna_fail "base/lib/Base/List.vuna" 65 1 ("no matching clause for Base.List.zip")

let rec v_Base_dList_dtake = fun a0 a1 -> match (a0, a1) with
  | (n, []) -> []
  | (n, (x) :: (xs)) -> if v_vuna_ule_uint n 0 then [] else (x) :: (v_Base_dList_dtake (bi_sub n 1) xs)
  | _ -> vuna_fail "base/lib/Base/List.vuna" 70 1 ("no matching clause for Base.List.take")

let rec v_Base_dList_ddrop = fun a0 a1 -> match (a0, a1) with
  | (n, []) -> []
  | (n, (x) :: (xs)) -> if v_vuna_ule_uint n 0 then (x) :: (xs) else v_Base_dList_ddrop (bi_sub n 1) xs
  | _ -> vuna_fail "base/lib/Base/List.vuna" 74 1 ("no matching clause for Base.List.drop")

let rec v_Base_dList_drange = fun i n -> if v_vuna_uge_uint i n then [] else (i) :: (v_Base_dList_drange (bi_add i 1) n)

let rec v_Base_dList_dmapMaybe = fun a0 a1 -> match (a0, a1) with
  | (f, []) -> []
  | (f, (x) :: (xs)) -> (match f x with
  | C_Base_dMaybe_dNothing -> v_Base_dList_dmapMaybe f xs
  | C_Base_dMaybe_dJust (y) -> (y) :: (v_Base_dList_dmapMaybe f xs)
  | _ -> vuna_fail "base/lib/Base/List.vuna" 82 24 ("case pattern match failure"))
  | _ -> vuna_fail "base/lib/Base/List.vuna" 81 1 ("no matching clause for Base.List.mapMaybe")

let v_vuna_uinst_ud_uBase_uList_uList_ufmap = fun f xs -> v_Base_dList_dmap f xs

let v_vuna_uinst_ud_uBase_uList_uList_upure = fun x -> (x) :: ([])

let v_vuna_uinst_ud_uBase_uList_uList_ubind = fun xs f -> v_Base_dList_dconcatMap f xs

let rec v_vuna_ueq_uBase_uList_uList = fun x y -> (match x with
  | [] -> (match y with
  | [] -> v_vuna_ueq_uint 0 0
  | _ -> v_vuna_ueq_uint 0 1
  | _ -> vuna_fail "<generated>" 445 10 ("case pattern match failure"))
  | (v0) :: (v1) -> (match y with
  | (w0) :: (w1) -> (if (v_vuna_ueq_ugeneric v0 w0) then (v_vuna_ueq_uBase_uList_uList v1 w1) else false)
  | _ -> v_vuna_ueq_uint 0 1
  | _ -> vuna_fail "<generated>" 448 17 ("case pattern match failure"))
  | _ -> v_vuna_ueq_uint 0 1
  | _ -> vuna_fail "<generated>" 444 30 ("case pattern match failure"))

let v_vuna_uneq_uBase_uList_uList = fun x y -> if v_vuna_ueq_uBase_uList_uList x y then v_vuna_ueq_uint 0 1 else v_vuna_ueq_uint 0 0
