open Vuna_runtime
open Base_dPair
open Base_dBool
open Base_dMonad
open Base_dMaybe
open Base_dEq
open Base_dOrd
open Base_dInt
open Base_dList
open Base_dResult
open Base_dString
open Base_dShow
open Prelude
type t_Vuna_dCompiler_dCommon_dPos = C_Vuna_dCompiler_dCommon_dPos_Vuna_dCompiler_dCommon_dPos of (int) * (int)
and t_Vuna_dCompiler_dCommon_dSpan = C_Vuna_dCompiler_dCommon_dSpan_Vuna_dCompiler_dCommon_dSpan of (string) * (int) * (int) * (int) * (int)

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

let rec v_Vuna_dCompiler_dCommon_dmemChar = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__34, dtb__35) -> (if ((bi_eq_int dtb__34) mc0) then true else ((v_Vuna_dCompiler_dCommon_dmemChar mc0) dtb__35))
  | C_Base_dList_dList_Base_dList_dNil -> false
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dCommon_dcontainsDot = (fun s -> ((v_Vuna_dCompiler_dCommon_dmemChar 46) (dtp_unpack s)))

let rec v_Vuna_dCompiler_dCommon_dsplitCharsOnDot = (fun mc0 -> (fun mc1 -> (fun mc2 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__36, dtb__37) -> (if ((bi_eq_int dtb__36) 46) then (((v_Vuna_dCompiler_dCommon_dsplitCharsOnDot dtb__37) (C_Base_dList_dList_Base_dList_dCons ((dtp_pack (v_Base_dList_dreverse mc2)), mc1))) C_Base_dList_dList_Base_dList_dNil) else (((v_Vuna_dCompiler_dCommon_dsplitCharsOnDot dtb__37) mc1) (C_Base_dList_dList_Base_dList_dCons (dtb__36, mc2))))
  | C_Base_dList_dList_Base_dList_dNil -> (v_Base_dList_dreverse (C_Base_dList_dList_Base_dList_dCons ((dtp_pack (v_Base_dList_dreverse mc2)), mc1)))
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
