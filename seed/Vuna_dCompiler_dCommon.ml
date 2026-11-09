open Vuna_runtime
type t_Vuna_dCompiler_dCommon_dPos = C_Vuna_dCompiler_dCommon_dPos_Pos of (int) * (int)
and t_Vuna_dCompiler_dCommon_dSpan = C_Vuna_dCompiler_dCommon_dSpan_Span of (string) * (int) * (int) * (int) * (int)

let v_Vuna_dCompiler_dCommon_dandThen = (fun r k -> (((Base_dMonad.v_Base_dMonad_dbind Base_dResult.v_Monad_uBase_dResult_dResult) r) k))

let v_Vuna_dCompiler_dCommon_dposLine = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dCommon_dPos_Pos (dtb__0, dtb__1) -> dtb__0
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCommon_dposCol = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dCommon_dPos_Pos (dtb__2, dtb__3) -> dtb__3
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCommon_dspanStartLine = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dCommon_dSpan_Span (dtb__4, dtb__5, dtb__6, dtb__7, dtb__8) -> dtb__5
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCommon_dspanStartCol = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dCommon_dSpan_Span (dtb__9, dtb__10, dtb__11, dtb__12, dtb__13) -> dtb__11
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCommon_dspanEndLine = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dCommon_dSpan_Span (dtb__14, dtb__15, dtb__16, dtb__17, dtb__18) -> dtb__17
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCommon_dshowSpanLoc = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dCommon_dSpan_Span (dtb__19, dtb__20, dtb__21, dtb__22, dtb__23) -> (String.concat "" [dtb__19; ":"; (bi_strFromInt dtb__20); ":"; (bi_strFromInt dtb__21)])
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dCommon_dmemChar = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__24, dtb__25) -> (if (dtb__24 = mc0) then true else ((v_Vuna_dCompiler_dCommon_dmemChar mc0) dtb__25))
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCommon_dcontainsDot = (fun s -> ((v_Vuna_dCompiler_dCommon_dmemChar 46) (Base_dList.dtp_unpack s)))

let rec v_Vuna_dCompiler_dCommon_dsplitCharsOn = (fun mc0 mc1 mc2 mc3 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__26, dtb__27) -> (if (dtb__26 = mc0) then ((((v_Vuna_dCompiler_dCommon_dsplitCharsOn mc0) dtb__27) (Base_dList.C_Base_dList_dList_Cons ((Base_dList.dtp_pack (Base_dList.v_Base_dList_dreverse mc3)), mc2))) Base_dList.C_Base_dList_dList_Nil) else ((((v_Vuna_dCompiler_dCommon_dsplitCharsOn mc0) dtb__27) mc2) (Base_dList.C_Base_dList_dList_Cons (dtb__26, mc3))))
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dList.v_Base_dList_dreverse (Base_dList.C_Base_dList_dList_Cons ((Base_dList.dtp_pack (Base_dList.v_Base_dList_dreverse mc3)), mc2)))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCommon_dsplitOnChar = (fun sep s -> ((((v_Vuna_dCompiler_dCommon_dsplitCharsOn sep) (Base_dList.dtp_unpack s)) Base_dList.C_Base_dList_dList_Nil) Base_dList.C_Base_dList_dList_Nil))

let rec v_Vuna_dCompiler_dCommon_dsplitCharsOnDot = (fun mc0 mc1 mc2 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__28, dtb__29) -> (if (dtb__28 = 46) then (((v_Vuna_dCompiler_dCommon_dsplitCharsOnDot dtb__29) (Base_dList.C_Base_dList_dList_Cons ((Base_dList.dtp_pack (Base_dList.v_Base_dList_dreverse mc2)), mc1))) Base_dList.C_Base_dList_dList_Nil) else (((v_Vuna_dCompiler_dCommon_dsplitCharsOnDot dtb__29) mc1) (Base_dList.C_Base_dList_dList_Cons (dtb__28, mc2))))
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dList.v_Base_dList_dreverse (Base_dList.C_Base_dList_dList_Cons ((Base_dList.dtp_pack (Base_dList.v_Base_dList_dreverse mc2)), mc1)))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCommon_dsplitOnDot = (fun s -> (((v_Vuna_dCompiler_dCommon_dsplitCharsOnDot (Base_dList.dtp_unpack s)) Base_dList.C_Base_dList_dList_Nil) Base_dList.C_Base_dList_dList_Nil))

let v_Vuna_dCompiler_dCommon_dsplitLastDot = (fun parts -> (match (Base_dList.v_Base_dList_dreverse parts) with
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dPair.C_Base_dPair_dPair_Pair (Base_dList.C_Base_dList_dList_Nil, ""))
  | Base_dList.C_Base_dList_dList_Cons (dtb__30, dtb__31) -> (Base_dPair.C_Base_dPair_dPair_Pair ((Base_dList.v_Base_dList_dreverse dtb__31), dtb__30))
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dCommon_djoinDots = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__32, dtb__33) -> (match dtb__33 with
  | Base_dList.C_Base_dList_dList_Nil -> dtb__32
  | _ -> (String.concat "" [dtb__32; "."; (v_Vuna_dCompiler_dCommon_djoinDots dtb__33)])
)
  | Base_dList.C_Base_dList_dList_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dCommon_djoinSlashes = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__34, dtb__35) -> (match dtb__35 with
  | Base_dList.C_Base_dList_dList_Nil -> dtb__34
  | _ -> (String.concat "" [dtb__34; "/"; (v_Vuna_dCompiler_dCommon_djoinSlashes dtb__35)])
)
  | Base_dList.C_Base_dList_dList_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dCommon_djoinArrows = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__36, dtb__37) -> (match dtb__37 with
  | Base_dList.C_Base_dList_dList_Nil -> dtb__36
  | _ -> (String.concat "" [dtb__36; " -> "; (v_Vuna_dCompiler_dCommon_djoinArrows dtb__37)])
)
  | Base_dList.C_Base_dList_dList_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dCommon_dsplitPathChars = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__38, dtb__39) -> (if (dtb__38 = 47) then (Base_dPair.C_Base_dPair_dPair_Pair ((Base_dList.dtp_pack (Base_dList.v_Base_dList_dreverse mc1)), (Base_dList.dtp_pack dtb__39))) else ((v_Vuna_dCompiler_dCommon_dsplitPathChars dtb__39) (Base_dList.C_Base_dList_dList_Cons (dtb__38, mc1))))
  | Base_dList.C_Base_dList_dList_Nil -> ((fun chars -> (Base_dPair.C_Base_dPair_dPair_Pair ("", (Base_dList.dtp_pack chars)))) (Base_dList.v_Base_dList_dreverse mc1))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCommon_dsplitPath = (fun path -> ((v_Vuna_dCompiler_dCommon_dsplitPathChars (Base_dList.dtp_unpack path)) Base_dList.C_Base_dList_dList_Nil))

let v_Vuna_dCompiler_dCommon_dbaseName = (fun path -> (Base_dPair.v_Base_dPair_dsecondOf (v_Vuna_dCompiler_dCommon_dsplitPath path)))

let rec v_Vuna_dCompiler_dCommon_dprefixLen2 = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__40, dtb__41) -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__42, dtb__43) -> (if (dtb__40 = dtb__42) then (1 + ((v_Vuna_dCompiler_dCommon_dprefixLen2 dtb__41) dtb__43)) else 0)
  | Base_dList.C_Base_dList_dList_Nil -> 0
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Nil -> 0
  | _ -> 0
)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCommon_dlengthDiffLE = (fun la lb n -> (if (la >= lb) then ((la - lb) <= n) else ((lb - la) <= n)))

let v_Vuna_dCompiler_dCommon_d_usimilarName = (fun a b -> (if (a = b) then false else (if ((Base_dString.v_Base_dString_dstartsWith a) b) then true else (if ((Base_dString.v_Base_dString_dstartsWith b) a) then true else ((fun la -> ((fun lb -> (if (((v_Vuna_dCompiler_dCommon_dlengthDiffLE (Base_dList.v_Base_dList_dlength la)) (Base_dList.v_Base_dList_dlength lb)) 2) then (((v_Vuna_dCompiler_dCommon_dprefixLen2 la) lb) >= 2) else false)) (Base_dList.dtp_unpack b))) (Base_dList.dtp_unpack a))))))

let rec v_Vuna_dCompiler_dCommon_dsuggest = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__44, dtb__45) -> (if ((v_Vuna_dCompiler_dCommon_d_usimilarName mc0) dtb__44) then (String.concat "" [" (did you mean "; dtb__44; "?)"]) else ((v_Vuna_dCompiler_dCommon_dsuggest mc0) dtb__45))
  | Base_dList.C_Base_dList_dList_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))
