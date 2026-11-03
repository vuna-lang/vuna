open Vuna_runtime
open Base_dPair
open Base_dBool
open Base_dMonad
open Base_dMaybe
open Base_dEq
open Base_dList
open Base_dResult
open Base_dString
open Base_dShow
open Base_dOrd
open Prelude
type t_Vuna_dCompiler_dCommon_dPos = C_Vuna_dCompiler_dCommon_dPos_Vuna_dCompiler_dCommon_dPos of (int) * (int)
and t_Vuna_dCompiler_dCommon_dSpan = C_Vuna_dCompiler_dCommon_dSpan_Vuna_dCompiler_dCommon_dSpan of (string) * (int) * (int) * (int) * (int)
and 'a0 t_Vuna_dCompiler_dCommon_dHashTbl = C_Vuna_dCompiler_dCommon_dHashTbl_Vuna_dCompiler_dCommon_dMkHashTbl of ((string, 'a0) t_Base_dPair_dPair t_Base_dList_dList t_Base_dList_dList t_Base_dList_dList)

let v_Vuna_dCompiler_dCommon_dposLine = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dCommon_dPos_Vuna_dCompiler_dCommon_dPos (dtb__0, dtb__1) -> dtb__0
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCommon_dposCol = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dCommon_dPos_Vuna_dCompiler_dCommon_dPos (dtb__2, dtb__3) -> dtb__3
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCommon_dspanFile = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dCommon_dSpan_Vuna_dCompiler_dCommon_dSpan (dtb__4, dtb__5, dtb__6, dtb__7, dtb__8) -> dtb__4
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCommon_dspanStartLine = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dCommon_dSpan_Vuna_dCompiler_dCommon_dSpan (dtb__9, dtb__10, dtb__11, dtb__12, dtb__13) -> dtb__10
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCommon_dspanStartCol = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dCommon_dSpan_Vuna_dCompiler_dCommon_dSpan (dtb__14, dtb__15, dtb__16, dtb__17, dtb__18) -> dtb__16
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCommon_dspanEndLine = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dCommon_dSpan_Vuna_dCompiler_dCommon_dSpan (dtb__19, dtb__20, dtb__21, dtb__22, dtb__23) -> dtb__22
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCommon_dspanEndCol = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dCommon_dSpan_Vuna_dCompiler_dCommon_dSpan (dtb__24, dtb__25, dtb__26, dtb__27, dtb__28) -> dtb__28
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCommon_dshowSpanLoc = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dCommon_dSpan_Vuna_dCompiler_dCommon_dSpan (dtb__29, dtb__30, dtb__31, dtb__32, dtb__33) -> ((bi_concat dtb__29) ((bi_concat ":") ((bi_concat (bi_strFromInt dtb__30)) ((bi_concat ":") (bi_strFromInt dtb__31)))))
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dCommon_dmemChar = (fun c -> (fun chars -> (match chars with
  | C_Base_dList_dList_Base_dList_dNil -> false
  | C_Base_dList_dList_Base_dList_dCons (dtb__34, dtb__35) -> (if ((bi_eq_int dtb__34) c) then true else ((v_Vuna_dCompiler_dCommon_dmemChar c) dtb__35))
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dCommon_dcontainsDot = (fun s -> ((v_Vuna_dCompiler_dCommon_dmemChar 46) (dtp_unpack s)))

let rec v_Vuna_dCompiler_dCommon_dsplitCharsOnDot = (fun chars -> (fun acc -> (fun seg -> (match chars with
  | C_Base_dList_dList_Base_dList_dNil -> (v_Base_dList_dreverse (C_Base_dList_dList_Base_dList_dCons ((dtp_pack (v_Base_dList_dreverse seg)), acc)))
  | C_Base_dList_dList_Base_dList_dCons (dtb__36, dtb__37) -> (if ((bi_eq_int dtb__36) 46) then (((v_Vuna_dCompiler_dCommon_dsplitCharsOnDot dtb__37) (C_Base_dList_dList_Base_dList_dCons ((dtp_pack (v_Base_dList_dreverse seg)), acc))) C_Base_dList_dList_Base_dList_dNil) else (((v_Vuna_dCompiler_dCommon_dsplitCharsOnDot dtb__37) acc) (C_Base_dList_dList_Base_dList_dCons (dtb__36, seg))))
  | _ -> failwith "DT: impossible branch"
))))

let v_Vuna_dCompiler_dCommon_dsplitOnDot = (fun s -> (((v_Vuna_dCompiler_dCommon_dsplitCharsOnDot (dtp_unpack s)) C_Base_dList_dList_Base_dList_dNil) C_Base_dList_dList_Base_dList_dNil))

let v_Vuna_dCompiler_dCommon_dsplitLastDot = (fun parts -> (match (v_Base_dList_dreverse parts) with
  | C_Base_dList_dList_Base_dList_dNil -> (C_Base_dPair_dPair_Base_dPair_dPair (C_Base_dList_dList_Base_dList_dNil, ""))
  | C_Base_dList_dList_Base_dList_dCons (dtb__38, dtb__39) -> (C_Base_dPair_dPair_Base_dPair_dPair ((v_Base_dList_dreverse dtb__39), dtb__38))
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dCommon_djoinDots = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__40, dtb__41) -> (match dtb__41 with
  | C_Base_dList_dList_Base_dList_dNil -> dtb__40
  | _ -> ((bi_concat dtb__40) ((bi_concat ".") (v_Vuna_dCompiler_dCommon_djoinDots dtb__41)))
)
  | C_Base_dList_dList_Base_dList_dNil -> ""
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dCommon_djoinSlashes = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__42, dtb__43) -> (match dtb__43 with
  | C_Base_dList_dList_Base_dList_dNil -> dtb__42
  | _ -> ((bi_concat dtb__42) ((bi_concat "/") (v_Vuna_dCompiler_dCommon_djoinSlashes dtb__43)))
)
  | C_Base_dList_dList_Base_dList_dNil -> ""
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dCommon_djoinArrows = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__44, dtb__45) -> (match dtb__45 with
  | C_Base_dList_dList_Base_dList_dNil -> dtb__44
  | _ -> ((bi_concat dtb__44) ((bi_concat " -> ") (v_Vuna_dCompiler_dCommon_djoinArrows dtb__45)))
)
  | C_Base_dList_dList_Base_dList_dNil -> ""
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dCommon_dsplitPathChars = (fun mc0 -> (fun mc1 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__46, dtb__47) -> (if ((bi_eq_int dtb__46) 47) then (C_Base_dPair_dPair_Base_dPair_dPair ((dtp_pack (v_Base_dList_dreverse mc1)), (dtp_pack dtb__47))) else ((v_Vuna_dCompiler_dCommon_dsplitPathChars dtb__47) (C_Base_dList_dList_Base_dList_dCons (dtb__46, mc1))))
  | C_Base_dList_dList_Base_dList_dNil -> ((fun chars -> (C_Base_dPair_dPair_Base_dPair_dPair ("", (dtp_pack chars)))) (v_Base_dList_dreverse mc1))
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dCommon_dsplitPath = (fun path -> ((v_Vuna_dCompiler_dCommon_dsplitPathChars (dtp_unpack path)) C_Base_dList_dList_Base_dList_dNil))

let v_Vuna_dCompiler_dCommon_dbaseName = (fun path -> (v_Base_dPair_dsecondOf (v_Vuna_dCompiler_dCommon_dsplitPath path)))

let rec v_Vuna_dCompiler_dCommon_dprefixLen2 = (fun mc0 -> (fun mc1 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__48, dtb__49) -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__50, dtb__51) -> (if ((bi_eq_int dtb__48) dtb__50) then ((bi_add 1) ((v_Vuna_dCompiler_dCommon_dprefixLen2 dtb__49) dtb__51)) else 0)
  | C_Base_dList_dList_Base_dList_dNil -> 0
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dNil -> 0
  | _ -> 0
)
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dCommon_dlengthDiffLE = (fun la -> (fun lb -> (fun n -> (if ((bi_ge_int la) lb) then ((bi_le_int ((bi_sub la) lb)) n) else ((bi_le_int ((bi_sub lb) la)) n)))))

let v_Vuna_dCompiler_dCommon_d_usimilarName = (fun a -> (fun b -> (if ((bi_eq_str a) b) then false else (if ((v_Base_dString_dstartsWith a) b) then true else (if ((v_Base_dString_dstartsWith b) a) then true else ((fun la -> ((fun lb -> (if (((v_Vuna_dCompiler_dCommon_dlengthDiffLE (v_Base_dList_dlength la)) (v_Base_dList_dlength lb)) 2) then ((bi_ge_int ((v_Vuna_dCompiler_dCommon_dprefixLen2 la) lb)) 2) else false)) (dtp_unpack b))) (dtp_unpack a)))))))

let rec v_Vuna_dCompiler_dCommon_dsuggest = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__52, dtb__53) -> (if ((v_Vuna_dCompiler_dCommon_d_usimilarName mc0) dtb__52) then ((bi_concat " (did you mean ") ((bi_concat dtb__52) "?)")) else ((v_Vuna_dCompiler_dCommon_dsuggest mc0) dtb__53))
  | C_Base_dList_dList_Base_dList_dNil -> ""
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dCommon_dreplicate = (fun n -> (fun x -> (if ((bi_le_int n) 0) then C_Base_dList_dList_Base_dList_dNil else (C_Base_dList_dList_Base_dList_dCons (x, ((v_Vuna_dCompiler_dCommon_dreplicate ((bi_sub n) 1)) x))))))

let rec v_Vuna_dCompiler_dCommon_dnthOr = (fun i -> (fun d -> (fun xs -> (match xs with
  | C_Base_dList_dList_Base_dList_dNil -> d
  | C_Base_dList_dList_Base_dList_dCons (dtb__54, dtb__55) -> (if ((bi_le_int i) 0) then dtb__54 else (((v_Vuna_dCompiler_dCommon_dnthOr ((bi_sub i) 1)) d) dtb__55))
  | _ -> failwith "DT: impossible branch"
))))

let rec v_Vuna_dCompiler_dCommon_dputNth = (fun i -> (fun v -> (fun xs -> (match xs with
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dList_dList_Base_dList_dNil
  | C_Base_dList_dList_Base_dList_dCons (dtb__56, dtb__57) -> (if ((bi_le_int i) 0) then (C_Base_dList_dList_Base_dList_dCons (v, dtb__57)) else (C_Base_dList_dList_Base_dList_dCons (dtb__56, (((v_Vuna_dCompiler_dCommon_dputNth ((bi_sub i) 1)) v) dtb__57))))
  | _ -> failwith "DT: impossible branch"
))))

let v_Vuna_dCompiler_dCommon_dmod1024 = (fun x -> ((bi_sub x) ((bi_mul ((bi_div x) 1024)) 1024)))

let v_Vuna_dCompiler_dCommon_dhashStr = (fun s -> (dtp_strHash s))

let rec v_Vuna_dCompiler_dCommon_dhashChars = (fun mc0 -> (fun mc1 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__58, dtb__59) -> ((v_Vuna_dCompiler_dCommon_dhashChars dtb__59) (v_Vuna_dCompiler_dCommon_dmod1024 ((bi_add ((bi_mul mc1) 33)) dtb__58)))
  | C_Base_dList_dList_Base_dList_dNil -> mc1
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dCommon_dtblEmpty = (C_Vuna_dCompiler_dCommon_dHashTbl_Vuna_dCompiler_dCommon_dMkHashTbl (((v_Vuna_dCompiler_dCommon_dreplicate 32) ((v_Vuna_dCompiler_dCommon_dreplicate 32) C_Base_dList_dList_Base_dList_dNil))))

let v_Vuna_dCompiler_dCommon_dtblInsert = (fun key -> (fun v -> (fun tbl -> (match tbl with
  | C_Vuna_dCompiler_dCommon_dHashTbl_Vuna_dCompiler_dCommon_dMkHashTbl (dtb__60) -> ((fun b -> ((fun oi -> ((fun ii -> ((fun outer -> ((fun inner -> (C_Vuna_dCompiler_dCommon_dHashTbl_Vuna_dCompiler_dCommon_dMkHashTbl ((((v_Vuna_dCompiler_dCommon_dputNth oi) (((v_Vuna_dCompiler_dCommon_dputNth ii) (C_Base_dList_dList_Base_dList_dCons ((C_Base_dPair_dPair_Base_dPair_dPair (key, v)), inner))) outer)) dtb__60)))) (((v_Vuna_dCompiler_dCommon_dnthOr ii) C_Base_dList_dList_Base_dList_dNil) outer))) (((v_Vuna_dCompiler_dCommon_dnthOr oi) ((v_Vuna_dCompiler_dCommon_dreplicate 32) C_Base_dList_dList_Base_dList_dNil)) dtb__60))) ((bi_sub b) ((bi_mul oi) 32)))) ((bi_div b) 32))) (v_Vuna_dCompiler_dCommon_dhashStr key))
  | _ -> failwith "DT: impossible branch"
))))

let rec v_Vuna_dCompiler_dCommon_dlookupAssoc = (fun key -> (fun pairs -> (match pairs with
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | C_Base_dList_dList_Base_dList_dCons (dtb__61, dtb__62) -> (match dtb__61 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__63, dtb__64) -> (if ((bi_eq_str key) dtb__63) then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__64)) else ((v_Vuna_dCompiler_dCommon_dlookupAssoc key) dtb__62))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dCommon_dtblLookup = (fun key -> (fun tbl -> (match tbl with
  | C_Vuna_dCompiler_dCommon_dHashTbl_Vuna_dCompiler_dCommon_dMkHashTbl (dtb__65) -> ((fun b -> ((fun oi -> ((fun ii -> ((v_Vuna_dCompiler_dCommon_dlookupAssoc key) (((v_Vuna_dCompiler_dCommon_dnthOr ii) C_Base_dList_dList_Base_dList_dNil) (((v_Vuna_dCompiler_dCommon_dnthOr oi) C_Base_dList_dList_Base_dList_dNil) dtb__65)))) ((bi_sub b) ((bi_mul oi) 32)))) ((bi_div b) 32))) (v_Vuna_dCompiler_dCommon_dhashStr key))
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dCommon_dtblMem = (fun n -> (fun t -> (match ((v_Vuna_dCompiler_dCommon_dtblLookup n) t) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__66) -> true
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> false
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dCommon_dtblFromList = (fun pairs -> (match pairs with
  | C_Base_dList_dList_Base_dList_dNil -> v_Vuna_dCompiler_dCommon_dtblEmpty
  | C_Base_dList_dList_Base_dList_dCons (dtb__67, dtb__68) -> (match dtb__67 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__69, dtb__70) -> (((v_Vuna_dCompiler_dCommon_dtblInsert dtb__69) dtb__70) (v_Vuna_dCompiler_dCommon_dtblFromList dtb__68))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dCommon_dtblInsertAll = (fun pairs -> (fun tbl -> (match pairs with
  | C_Base_dList_dList_Base_dList_dNil -> tbl
  | C_Base_dList_dList_Base_dList_dCons (dtb__71, dtb__72) -> (match dtb__71 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__73, dtb__74) -> ((v_Vuna_dCompiler_dCommon_dtblInsertAll dtb__72) (((v_Vuna_dCompiler_dCommon_dtblInsert dtb__73) dtb__74) tbl))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dCommon_dtblOfNames = (fun xs -> ((v_Vuna_dCompiler_dCommon_dtblInsertAll ((v_Base_dList_dmap (fun n -> (C_Base_dPair_dPair_Base_dPair_dPair (n, true)))) xs)) v_Vuna_dCompiler_dCommon_dtblEmpty))
