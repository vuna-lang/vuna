open Vuna_runtime
open Base_dPair
open Base_dBool
open Base_dMonad
open Base_dMaybe
open Base_dEq
open Base_dOrd
open Base_dInt
open Base_dShow
open Base_dNat
open Base_dList
open Base_dResult
let v_Eq_uString = (C_Dict_uBase_dEq_dEq_MkDict_uBase_dEq_dEq ((fun x y -> (x = y)), (fun x y -> (x <> y))))

let v_Ord_uString = (C_Dict_uBase_dOrd_dOrd_MkDict_uBase_dOrd_dOrd ((fun x y -> (x < y)), (fun x y -> (x <= y)), (fun x y -> (x > y)), (fun x y -> (x >= y))))

let v_Base_dString_dbyteLength = (fun s -> (bi_natFromInt (bi_strLength s)))

let rec v_Base_dString_d_uinterleave = (fun mc0 mc1 -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__0, dtb__1) -> (match dtb__1 with
  | C_Base_dList_dList_Base_dList_dNil -> (C_Base_dList_dList_Base_dList_dCons (dtb__0, C_Base_dList_dList_Base_dList_dNil))
  | _ -> (C_Base_dList_dList_Base_dList_dCons (dtb__0, (C_Base_dList_dList_Base_dList_dCons (mc0, ((v_Base_dString_d_uinterleave mc0) dtb__1)))))
)
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dList_dList_Base_dList_dNil
  | _ -> failwith "DT: impossible branch"
))

let v_Base_dString_djoin = (fun sep xs -> (dtp_concatMany ((v_Base_dString_d_uinterleave sep) xs)))

let v_Base_dString_dunlines = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dNil -> ""
  | _ -> (dtp_concatMany ((v_Base_dList_dmap (fun x -> (x ^ "\n"))) mc0))
))

let v_Base_dString_drepeat = (fun n s -> (dtp_concatMany ((v_Base_dList_dmap (fun _u -> s)) ((v_Base_dList_drange 0) n))))

let v_Base_dString_dsubstring = (fun start len s -> (((dtp_substring start) len) s))

let v_Base_dString_d_uisSpace = (fun c -> (if (if (if (c = 32) then true else (c = 9)) then true else (c = 10)) then true else (c = 13)))

let rec v_Base_dString_d_udropSpace = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__2, dtb__3) -> (if (v_Base_dString_d_uisSpace dtb__2) then (v_Base_dString_d_udropSpace dtb__3) else (C_Base_dList_dList_Base_dList_dCons (dtb__2, dtb__3)))
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dList_dList_Base_dList_dNil
  | _ -> failwith "DT: impossible branch"
))

let v_Base_dString_dtrimLeft = (fun s -> (dtp_pack (v_Base_dString_d_udropSpace (dtp_unpack s))))

let v_Base_dString_dtrimRight = (fun s -> (dtp_pack (v_Base_dList_dreverse (v_Base_dString_d_udropSpace (v_Base_dList_dreverse (dtp_unpack s))))))

let v_Base_dString_dtrim = (fun s -> (v_Base_dString_dtrimLeft (v_Base_dString_dtrimRight s)))

let rec v_Base_dString_d_ustartsWithChars = (fun mc0 mc1 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__4, dtb__5) -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dNil -> false
  | C_Base_dList_dList_Base_dList_dCons (dtb__6, dtb__7) -> (if (dtb__4 = dtb__6) then ((v_Base_dString_d_ustartsWithChars dtb__5) dtb__7) else false)
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> true
  | _ -> failwith "DT: impossible branch"
))

let rec v_Base_dString_dsplitAcc = (fun mc0 mc1 mc2 mc3 mc4 -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__8, dtb__9) -> (if (mc2 <= 0) then (v_Base_dList_dreverse (C_Base_dList_dList_Base_dList_dCons ((dtp_pack (v_Base_dList_dreverse mc3)), mc4))) else (if ((v_Base_dString_d_ustartsWithChars mc0) mc1) then ((((((v_Base_dString_dskipSep mc0) mc1) (mc2 - 1)) (v_Base_dList_dlength mc0)) C_Base_dList_dList_Base_dList_dNil) (C_Base_dList_dList_Base_dList_dCons ((dtp_pack (v_Base_dList_dreverse mc3)), mc4))) else (((((v_Base_dString_dsplitAcc mc0) dtb__9) (mc2 - 1)) (C_Base_dList_dList_Base_dList_dCons (dtb__8, mc3))) mc4)))
  | C_Base_dList_dList_Base_dList_dNil -> (v_Base_dList_dreverse (C_Base_dList_dList_Base_dList_dCons ((dtp_pack (v_Base_dList_dreverse mc3)), mc4)))
  | _ -> failwith "DT: impossible branch"
))
and v_Base_dString_dskipSep = (fun mc0 mc1 mc2 mc3 mc4 mc5 -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__10, dtb__11) -> (if (mc2 <= 0) then (v_Base_dList_dreverse (C_Base_dList_dList_Base_dList_dCons ((dtp_pack (v_Base_dList_dreverse mc4)), mc5))) else (if (mc3 <= 0) then (((((v_Base_dString_dsplitAcc mc0) mc1) (mc2 - 1)) mc4) mc5) else ((((((v_Base_dString_dskipSep mc0) dtb__11) (mc2 - 1)) (mc3 - 1)) mc4) mc5)))
  | C_Base_dList_dList_Base_dList_dNil -> (v_Base_dList_dreverse (C_Base_dList_dList_Base_dList_dCons ((dtp_pack (v_Base_dList_dreverse mc4)), mc5)))
  | _ -> failwith "DT: impossible branch"
))

let v_Base_dString_dsplit = (fun sep text -> (if ((bi_strLength sep) = 0) then ((v_Base_dList_dmap (fun c -> (dtp_pack (C_Base_dList_dList_Base_dList_dCons (c, C_Base_dList_dList_Base_dList_dNil))))) (dtp_unpack text)) else (((((v_Base_dString_dsplitAcc (dtp_unpack sep)) (dtp_unpack text)) (((2 * (bi_strLength text)) + (bi_strLength sep)) + 2)) C_Base_dList_dList_Base_dList_dNil) C_Base_dList_dList_Base_dList_dNil)))

let v_Base_dString_dlines = (fun s -> ((v_Base_dString_dsplit "\n") s))

let v_Base_dString_dstartsWith = (fun prefix text -> ((v_Base_dString_d_ustartsWithChars (dtp_unpack prefix)) (dtp_unpack text)))

let v_Base_dString_dendsWith = (fun suffix text -> ((fun ls -> ((fun lt -> (if (ls > lt) then false else ((v_Base_dString_d_ustartsWithChars (dtp_unpack suffix)) ((v_Base_dList_ddrop (lt - ls)) (dtp_unpack text))))) (bi_strLength text))) (bi_strLength suffix)))

let rec v_Base_dString_d_ucontainsChars = (fun needle text -> (if ((v_Base_dString_d_ustartsWithChars needle) text) then true else (match text with
  | C_Base_dList_dList_Base_dList_dNil -> false
  | C_Base_dList_dList_Base_dList_dCons (dtb__12, dtb__13) -> ((v_Base_dString_d_ucontainsChars needle) dtb__13)
  | _ -> failwith "DT: impossible branch"
)))

let v_Base_dString_dcontains = (fun needle text -> ((v_Base_dString_d_ucontainsChars (dtp_unpack needle)) (dtp_unpack text)))
