open Vuna_runtime
open Vuna_builtins
open Base_dPair
open Base_dBool
open Base_dMonad
open Base_dMaybe
open Base_dEq
open Base_dList
open Base_dResult
let rec v_Base_dString_djoin = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Base_dList_dList_Cons (dtb__0, dtb__1) -> (match dtb__1 with
  | C_Base_dList_dList_Nil -> dtb__0
  | _ -> ((bi_concat dtb__0) ((bi_concat mc0) ((v_Base_dString_djoin mc0) dtb__1)))
)
  | C_Base_dList_dList_Nil -> ""
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Base_dString_dunlines = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Cons (dtb__2, dtb__3) -> ((bi_concat dtb__2) ((bi_concat "\n") (v_Base_dString_dunlines dtb__3)))
  | C_Base_dList_dList_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))

let rec v_Base_dString_drepeat = (fun n -> (fun s -> (if ((bi_le_int n) 0) then "" else ((bi_concat s) ((v_Base_dString_drepeat ((bi_sub n) 1)) s)))))

let v_Base_dString_dsubstring = (fun start -> (fun len -> (fun s -> (dtp_pack ((v_Base_dList_dtake len) ((v_Base_dList_ddrop start) (dtp_unpack s)))))))

let v_Base_dString_d_uisSpace = (fun c -> (if (if (if ((bi_eq_int c) 32) then true else ((bi_eq_int c) 9)) then true else ((bi_eq_int c) 10)) then true else ((bi_eq_int c) 13)))

let rec v_Base_dString_d_udropSpace = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Cons (dtb__4, dtb__5) -> (if (v_Base_dString_d_uisSpace dtb__4) then (v_Base_dString_d_udropSpace dtb__5) else (C_Base_dList_dList_Cons (dtb__4, dtb__5)))
  | C_Base_dList_dList_Nil -> C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

let v_Base_dString_dtrimLeft = (fun s -> (dtp_pack (v_Base_dString_d_udropSpace (dtp_unpack s))))

let v_Base_dString_dtrimRight = (fun s -> (dtp_pack (v_Base_dList_dreverse (v_Base_dString_d_udropSpace (v_Base_dList_dreverse (dtp_unpack s))))))

let v_Base_dString_dtrim = (fun s -> (v_Base_dString_dtrimLeft (v_Base_dString_dtrimRight s)))

let rec v_Base_dString_d_ustartsWithChars = (fun mc0 -> (fun mc1 -> (match mc0 with
  | C_Base_dList_dList_Cons (dtb__6, dtb__7) -> (match mc1 with
  | C_Base_dList_dList_Nil -> false
  | C_Base_dList_dList_Cons (dtb__8, dtb__9) -> (if ((bi_eq_int dtb__6) dtb__8) then ((v_Base_dString_d_ustartsWithChars dtb__7) dtb__9) else false)
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Nil -> true
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Base_dString_dsplitAcc = (fun sep -> (fun chars -> (fun fuel -> (fun acc -> (fun parts -> (match chars with
  | C_Base_dList_dList_Nil -> (v_Base_dList_dreverse (C_Base_dList_dList_Cons ((dtp_pack (v_Base_dList_dreverse acc)), parts)))
  | C_Base_dList_dList_Cons (dtb__10, dtb__11) -> (if ((bi_le_int fuel) 0) then (v_Base_dList_dreverse (C_Base_dList_dList_Cons ((dtp_pack (v_Base_dList_dreverse acc)), parts))) else (if ((v_Base_dString_d_ustartsWithChars sep) chars) then ((((((v_Base_dString_dskipSep sep) chars) ((bi_sub fuel) 1)) (v_Base_dList_dlength sep)) C_Base_dList_dList_Nil) (C_Base_dList_dList_Cons ((dtp_pack (v_Base_dList_dreverse acc)), parts))) else (((((v_Base_dString_dsplitAcc sep) dtb__11) ((bi_sub fuel) 1)) (C_Base_dList_dList_Cons (dtb__10, acc))) parts)))
  | _ -> failwith "DT: impossible branch"
))))))
and v_Base_dString_dskipSep = (fun sep -> (fun chars -> (fun fuel -> (fun n -> (fun acc -> (fun parts -> (match chars with
  | C_Base_dList_dList_Nil -> (v_Base_dList_dreverse (C_Base_dList_dList_Cons ((dtp_pack (v_Base_dList_dreverse acc)), parts)))
  | C_Base_dList_dList_Cons (dtb__12, dtb__13) -> (if ((bi_le_int fuel) 0) then (v_Base_dList_dreverse (C_Base_dList_dList_Cons ((dtp_pack (v_Base_dList_dreverse acc)), parts))) else (if ((bi_le_int n) 0) then (((((v_Base_dString_dsplitAcc sep) chars) ((bi_sub fuel) 1)) acc) parts) else ((((((v_Base_dString_dskipSep sep) dtb__13) ((bi_sub fuel) 1)) ((bi_sub n) 1)) acc) parts)))
  | _ -> failwith "DT: impossible branch"
)))))))

let v_Base_dString_dsplit = (fun sep -> (fun text -> (if ((bi_eq_int (bi_strLength sep)) 0) then ((v_Base_dList_dmap (fun c -> (dtp_pack (C_Base_dList_dList_Cons (c, C_Base_dList_dList_Nil))))) (dtp_unpack text)) else (((((v_Base_dString_dsplitAcc (dtp_unpack sep)) (dtp_unpack text)) ((bi_add ((bi_mul 4) (bi_strLength text))) 4)) C_Base_dList_dList_Nil) C_Base_dList_dList_Nil))))

let v_Base_dString_dlines = (fun s -> ((v_Base_dString_dsplit "\n") s))

let v_Base_dString_dstartsWith = (fun prefix -> (fun text -> ((v_Base_dString_d_ustartsWithChars (dtp_unpack prefix)) (dtp_unpack text))))

let v_Base_dString_dendsWith = (fun suffix -> (fun text -> ((fun ls -> ((fun lt -> (if ((bi_gt_int ls) lt) then false else ((v_Base_dString_d_ustartsWithChars (dtp_unpack suffix)) ((v_Base_dList_ddrop ((bi_sub lt) ls)) (dtp_unpack text))))) (bi_strLength text))) (bi_strLength suffix))))

let rec v_Base_dString_d_ucontainsChars = (fun needle -> (fun text -> (if ((v_Base_dString_d_ustartsWithChars needle) text) then true else (match text with
  | C_Base_dList_dList_Nil -> false
  | C_Base_dList_dList_Cons (dtb__14, dtb__15) -> ((v_Base_dString_d_ucontainsChars needle) dtb__15)
  | _ -> failwith "DT: impossible branch"
))))

let v_Base_dString_dcontains = (fun needle -> (fun text -> ((v_Base_dString_d_ucontainsChars (dtp_unpack needle)) (dtp_unpack text))))
