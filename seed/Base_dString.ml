open Vuna_runtime
open Base_dPair
open Base_dBool
open Base_dMonad
open Base_dMaybe
open Base_dList
open Base_dIO
open Base_dResult
let rec v_Base_dString_djoin = fun a0 a1 -> match (a0, a1) with
  | (sep, []) -> ""
  | (sep, (x) :: ([])) -> x
  | (sep, (x) :: (rest)) -> (let vuna_cat0' = (x) in (let vuna_cat1' = (sep) in (let vuna_cat2' = (v_Base_dString_djoin sep rest) in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'])))
  | _ -> vuna_fail "base/lib/Base/String.vuna" 20 1 ("no matching clause for Base.String.join")

let rec v_Base_dString_dunlines = fun a0 -> match a0 with
  | ([]) -> ""
  | ((x) :: (rest)) -> (let vuna_cat0' = (x) in (let vuna_cat1' = ("\n") in (let vuna_cat2' = (v_Base_dString_dunlines rest) in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'])))
  | _ -> vuna_fail "base/lib/Base/String.vuna" 28 1 ("no matching clause for Base.String.unlines")

let rec v_Base_dString_drepeat = fun n s -> if v_vuna_ule_uint n 0 then "" else ((s) ^ (v_Base_dString_drepeat (bi_sub n 1) s))

let v_Base_dString_dsubstring = fun start len s -> bi_str_pack (v_Base_dList_dtake len (v_Base_dList_ddrop start (bi_str_unpack s)))

let v_Base_dString_d_uisSpace = fun c -> (if ((if ((if (v_vuna_ueq_uint c 32) then true else (v_vuna_ueq_uint c 9))) then true else (v_vuna_ueq_uint c 10))) then true else (v_vuna_ueq_uint c 13))

let rec v_Base_dString_d_udropSpace = fun a0 -> match a0 with
  | ([]) -> []
  | ((c) :: (rest)) -> if v_Base_dString_d_uisSpace c then v_Base_dString_d_udropSpace rest else (c) :: (rest)
  | _ -> vuna_fail "base/lib/Base/String.vuna" 64 1 ("no matching clause for Base.String._dropSpace")

let v_Base_dString_dtrimLeft = fun s -> bi_str_pack (v_Base_dString_d_udropSpace (bi_str_unpack s))

let v_Base_dString_dtrimRight = fun s -> bi_str_pack (v_Base_dList_dreverse (v_Base_dString_d_udropSpace (v_Base_dList_dreverse (bi_str_unpack s))))

let v_Base_dString_dtrim = fun s -> v_Base_dString_dtrimLeft (v_Base_dString_dtrimRight s)

let rec v_Base_dString_d_ustartsWithChars = fun a0 a1 -> match (a0, a1) with
  | ([], text) -> true
  | ((p) :: (prest), text) -> (match text with
  | [] -> false
  | (t) :: (trest) -> if v_vuna_ueq_uint p t then v_Base_dString_d_ustartsWithChars prest trest else false
  | _ -> vuna_fail "base/lib/Base/String.vuna" 69 38 ("case pattern match failure"))
  | _ -> vuna_fail "base/lib/Base/String.vuna" 68 1 ("no matching clause for Base.String._startsWithChars")

let rec v_Base_dString_dsplitAcc = fun sep chars acc parts -> if v_Base_dString_d_ustartsWithChars sep chars then v_Base_dString_dsplitAcc sep (v_Base_dList_ddrop (v_Base_dList_dlength sep) chars) [] ((bi_str_pack (v_Base_dList_dreverse acc)) :: (parts)) else (match chars with
  | [] -> v_Base_dList_dreverse ((bi_str_pack (v_Base_dList_dreverse acc)) :: (parts))
  | (c) :: (rest) -> v_Base_dString_dsplitAcc sep rest ((c) :: (acc)) parts
  | _ -> vuna_fail "base/lib/Base/String.vuna" 15 6 ("case pattern match failure"))

let v_Base_dString_dsplit = fun sep text -> if v_vuna_ueq_uint (bi_str_length sep) 0 then v_Base_dList_dmap (fun c -> bi_str_pack ((c) :: ([]))) (bi_str_unpack text) else v_Base_dString_dsplitAcc (bi_str_unpack sep) (bi_str_unpack text) [] []

let v_Base_dString_dlines = fun s -> v_Base_dString_dsplit "\n" s

let v_Base_dString_dstartsWith = fun prefix text -> v_Base_dString_d_ustartsWithChars (bi_str_unpack prefix) (bi_str_unpack text)

let v_Base_dString_dendsWith = fun suffix text -> (let ls = bi_str_length suffix in (let lt = bi_str_length text in if v_vuna_ugt_uint ls lt then false else v_Base_dString_d_ustartsWithChars (bi_str_unpack suffix) (v_Base_dList_ddrop (bi_sub lt ls) (bi_str_unpack text))))

let rec v_Base_dString_d_ucontainsChars = fun needle text -> if v_Base_dString_d_ustartsWithChars needle text then true else (match text with
  | [] -> false
  | (c) :: (rest) -> v_Base_dString_d_ucontainsChars needle rest
  | _ -> vuna_fail "base/lib/Base/String.vuna" 75 6 ("case pattern match failure"))

let v_Base_dString_dcontains = fun needle text -> v_Base_dString_d_ucontainsChars (bi_str_unpack needle) (bi_str_unpack text)
