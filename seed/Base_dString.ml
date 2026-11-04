open Vuna_runtime
open Base_dPair
open Base_dBool
open Base_dMonad
open Base_dMaybe
open Base_dEq
open Base_dList
open Base_dResult
let rec v_Base_dString_djoin = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__0, dtb__1) -> (match dtb__1 with
  | C_Base_dList_dList_Base_dList_dNil -> dtb__0
  | _ -> ((bi_concat dtb__0) ((bi_concat mc0) ((v_Base_dString_djoin mc0) dtb__1)))
)
  | C_Base_dList_dList_Base_dList_dNil -> ""
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Base_dString_dunlines = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__2, dtb__3) -> ((bi_concat dtb__2) ((bi_concat "\n") (v_Base_dString_dunlines dtb__3)))
  | C_Base_dList_dList_Base_dList_dNil -> ""
  | _ -> failwith "DT: impossible branch"
))

let rec v_Base_dString_drepeat = (fun n -> (fun s -> (if ((bi_le_int n) 0) then "" else ((bi_concat s) ((v_Base_dString_drepeat ((bi_sub n) 1)) s)))))

let v_Base_dString_dsubstring = (fun start -> (fun len -> (fun s -> (dtp_pack ((v_Base_dList_dtake len) ((v_Base_dList_ddrop start) (dtp_unpack s)))))))

let v_Base_dString_d_uisSpace = (fun c -> (if (if (if ((bi_eq_int c) 32) then true else ((bi_eq_int c) 9)) then true else ((bi_eq_int c) 10)) then true else ((bi_eq_int c) 13)))

let rec v_Base_dString_d_udropSpace = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__4, dtb__5) -> (if (v_Base_dString_d_uisSpace dtb__4) then (v_Base_dString_d_udropSpace dtb__5) else (C_Base_dList_dList_Base_dList_dCons (dtb__4, dtb__5)))
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dList_dList_Base_dList_dNil
  | _ -> failwith "DT: impossible branch"
))

let v_Base_dString_dtrimLeft = (fun s -> (dtp_pack (v_Base_dString_d_udropSpace (dtp_unpack s))))

let v_Base_dString_dtrimRight = (fun s -> (dtp_pack (v_Base_dList_dreverse (v_Base_dString_d_udropSpace (v_Base_dList_dreverse (dtp_unpack s))))))

let v_Base_dString_dtrim = (fun s -> (v_Base_dString_dtrimLeft (v_Base_dString_dtrimRight s)))

let rec v_Base_dString_d_ustartsWithChars = (fun mc0 -> (fun mc1 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__6, dtb__7) -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dNil -> false
  | C_Base_dList_dList_Base_dList_dCons (dtb__8, dtb__9) -> (if ((bi_eq_int dtb__6) dtb__8) then ((v_Base_dString_d_ustartsWithChars dtb__7) dtb__9) else false)
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> true
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Base_dString_dsplitAcc = (fun mc0 -> (fun mc1 -> (fun mc2 -> (fun mc3 -> (fun mc4 -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__10, dtb__11) -> (if ((bi_le_int mc2) 0) then (v_Base_dList_dreverse (C_Base_dList_dList_Base_dList_dCons ((dtp_pack (v_Base_dList_dreverse mc3)), mc4))) else (if ((v_Base_dString_d_ustartsWithChars mc0) mc1) then ((((((v_Base_dString_dskipSep mc0) mc1) ((bi_sub mc2) 1)) (v_Base_dList_dlength mc0)) C_Base_dList_dList_Base_dList_dNil) (C_Base_dList_dList_Base_dList_dCons ((dtp_pack (v_Base_dList_dreverse mc3)), mc4))) else (((((v_Base_dString_dsplitAcc mc0) dtb__11) ((bi_sub mc2) 1)) (C_Base_dList_dList_Base_dList_dCons (dtb__10, mc3))) mc4)))
  | C_Base_dList_dList_Base_dList_dNil -> (v_Base_dList_dreverse (C_Base_dList_dList_Base_dList_dCons ((dtp_pack (v_Base_dList_dreverse mc3)), mc4)))
  | _ -> failwith "DT: impossible branch"
))))))
and v_Base_dString_dskipSep = (fun mc0 -> (fun mc1 -> (fun mc2 -> (fun mc3 -> (fun mc4 -> (fun mc5 -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__12, dtb__13) -> (if ((bi_le_int mc2) 0) then (v_Base_dList_dreverse (C_Base_dList_dList_Base_dList_dCons ((dtp_pack (v_Base_dList_dreverse mc4)), mc5))) else (if ((bi_le_int mc3) 0) then (((((v_Base_dString_dsplitAcc mc0) mc1) ((bi_sub mc2) 1)) mc4) mc5) else ((((((v_Base_dString_dskipSep mc0) dtb__13) ((bi_sub mc2) 1)) ((bi_sub mc3) 1)) mc4) mc5)))
  | C_Base_dList_dList_Base_dList_dNil -> (v_Base_dList_dreverse (C_Base_dList_dList_Base_dList_dCons ((dtp_pack (v_Base_dList_dreverse mc4)), mc5)))
  | _ -> failwith "DT: impossible branch"
)))))))

let v_Base_dString_dsplit = (fun sep -> (fun text -> (if ((bi_eq_int (bi_strLength sep)) 0) then ((v_Base_dList_dmap (fun c -> (dtp_pack (C_Base_dList_dList_Base_dList_dCons (c, C_Base_dList_dList_Base_dList_dNil))))) (dtp_unpack text)) else (((((v_Base_dString_dsplitAcc (dtp_unpack sep)) (dtp_unpack text)) ((bi_add ((bi_add ((bi_mul 2) (bi_strLength text))) (bi_strLength sep))) 2)) C_Base_dList_dList_Base_dList_dNil) C_Base_dList_dList_Base_dList_dNil))))

let v_Base_dString_dlines = (fun s -> ((v_Base_dString_dsplit "\n") s))

let v_Base_dString_dstartsWith = (fun prefix -> (fun text -> ((v_Base_dString_d_ustartsWithChars (dtp_unpack prefix)) (dtp_unpack text))))

let v_Base_dString_dendsWith = (fun suffix -> (fun text -> ((fun ls -> ((fun lt -> (if ((bi_gt_int ls) lt) then false else ((v_Base_dString_d_ustartsWithChars (dtp_unpack suffix)) ((v_Base_dList_ddrop ((bi_sub lt) ls)) (dtp_unpack text))))) (bi_strLength text))) (bi_strLength suffix))))

let rec v_Base_dString_d_ucontainsChars = (fun needle -> (fun text -> (if ((v_Base_dString_d_ustartsWithChars needle) text) then true else (match text with
  | C_Base_dList_dList_Base_dList_dNil -> false
  | C_Base_dList_dList_Base_dList_dCons (dtb__14, dtb__15) -> ((v_Base_dString_d_ucontainsChars needle) dtb__15)
  | _ -> failwith "DT: impossible branch"
))))

let v_Base_dString_dcontains = (fun needle -> (fun text -> ((v_Base_dString_d_ucontainsChars (dtp_unpack needle)) (dtp_unpack text))))
