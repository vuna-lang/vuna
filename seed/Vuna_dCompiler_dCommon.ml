open Vuna_runtime
type t_Vuna_dCompiler_dCommon_dPos = { f_Vuna_dCompiler_dCommon_dPos_posLine : int; f_Vuna_dCompiler_dCommon_dPos_posCol : int }
and t_Vuna_dCompiler_dCommon_dSpan = { f_Vuna_dCompiler_dCommon_dSpan_spanFile : string; f_Vuna_dCompiler_dCommon_dSpan_spanStartLine : int; f_Vuna_dCompiler_dCommon_dSpan_spanStartCol : int; f_Vuna_dCompiler_dCommon_dSpan_spanEndLine : int; f_Vuna_dCompiler_dCommon_dSpan_spanEndCol : int }

let v_Vuna_dCompiler_dCommon_dbind = (fun mc0 mc1 -> (match mc0 with
  | Base_dResult.C_Base_dResult_dResult_Err (dtb__0) -> (Base_dResult.C_Base_dResult_dResult_Err (dtb__0))
  | Base_dResult.C_Base_dResult_dResult_Ok (dtb__1) -> (mc1 dtb__1)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCommon_dposLine = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dCommon_dPos_posLine = dtb__2; f_Vuna_dCompiler_dCommon_dPos_posCol = dtb__3 } -> dtb__2
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCommon_dposCol = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dCommon_dPos_posLine = dtb__4; f_Vuna_dCompiler_dCommon_dPos_posCol = dtb__5 } -> dtb__5
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCommon_dspanStartLine = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dCommon_dSpan_spanFile = dtb__6; f_Vuna_dCompiler_dCommon_dSpan_spanStartLine = dtb__7; f_Vuna_dCompiler_dCommon_dSpan_spanStartCol = dtb__8; f_Vuna_dCompiler_dCommon_dSpan_spanEndLine = dtb__9; f_Vuna_dCompiler_dCommon_dSpan_spanEndCol = dtb__10 } -> dtb__7
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCommon_dspanStartCol = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dCommon_dSpan_spanFile = dtb__11; f_Vuna_dCompiler_dCommon_dSpan_spanStartLine = dtb__12; f_Vuna_dCompiler_dCommon_dSpan_spanStartCol = dtb__13; f_Vuna_dCompiler_dCommon_dSpan_spanEndLine = dtb__14; f_Vuna_dCompiler_dCommon_dSpan_spanEndCol = dtb__15 } -> dtb__13
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCommon_dspanEndLine = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dCommon_dSpan_spanFile = dtb__16; f_Vuna_dCompiler_dCommon_dSpan_spanStartLine = dtb__17; f_Vuna_dCompiler_dCommon_dSpan_spanStartCol = dtb__18; f_Vuna_dCompiler_dCommon_dSpan_spanEndLine = dtb__19; f_Vuna_dCompiler_dCommon_dSpan_spanEndCol = dtb__20 } -> dtb__19
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCommon_dshowSpanLoc = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dCommon_dSpan_spanFile = dtb__21; f_Vuna_dCompiler_dCommon_dSpan_spanStartLine = dtb__22; f_Vuna_dCompiler_dCommon_dSpan_spanStartCol = dtb__23; f_Vuna_dCompiler_dCommon_dSpan_spanEndLine = dtb__24; f_Vuna_dCompiler_dCommon_dSpan_spanEndCol = dtb__25 } -> (String.concat "" [dtb__21; ":"; (bi_strFromInt dtb__22); ":"; (bi_strFromInt dtb__23)])
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dCommon_dmemChar = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__26, dtb__27) -> (if (dtb__26 = mc0) then true else ((v_Vuna_dCompiler_dCommon_dmemChar mc0) dtb__27))
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCommon_dcontainsDot = (fun s -> ((v_Vuna_dCompiler_dCommon_dmemChar 46) (Base_dList.dtp_unpack s)))

let rec v_Vuna_dCompiler_dCommon_dsplitCharsOn = (fun mc0 mc1 mc2 mc3 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__28, dtb__29) -> (if (dtb__28 = mc0) then ((((v_Vuna_dCompiler_dCommon_dsplitCharsOn mc0) dtb__29) (Base_dList.C_Base_dList_dList_Cons ((Base_dList.dtp_pack (Base_dList.v_Base_dList_dreverse mc3)), mc2))) Base_dList.C_Base_dList_dList_Nil) else ((((v_Vuna_dCompiler_dCommon_dsplitCharsOn mc0) dtb__29) mc2) (Base_dList.C_Base_dList_dList_Cons (dtb__28, mc3))))
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dList.v_Base_dList_dreverse (Base_dList.C_Base_dList_dList_Cons ((Base_dList.dtp_pack (Base_dList.v_Base_dList_dreverse mc3)), mc2)))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCommon_dsplitOnChar = (fun sep s -> ((((v_Vuna_dCompiler_dCommon_dsplitCharsOn sep) (Base_dList.dtp_unpack s)) Base_dList.C_Base_dList_dList_Nil) Base_dList.C_Base_dList_dList_Nil))

let rec v_Vuna_dCompiler_dCommon_dsplitCharsOnDot = (fun mc0 mc1 mc2 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__30, dtb__31) -> (if (dtb__30 = 46) then (((v_Vuna_dCompiler_dCommon_dsplitCharsOnDot dtb__31) (Base_dList.C_Base_dList_dList_Cons ((Base_dList.dtp_pack (Base_dList.v_Base_dList_dreverse mc2)), mc1))) Base_dList.C_Base_dList_dList_Nil) else (((v_Vuna_dCompiler_dCommon_dsplitCharsOnDot dtb__31) mc1) (Base_dList.C_Base_dList_dList_Cons (dtb__30, mc2))))
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dList.v_Base_dList_dreverse (Base_dList.C_Base_dList_dList_Cons ((Base_dList.dtp_pack (Base_dList.v_Base_dList_dreverse mc2)), mc1)))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCommon_dsplitOnDot = (fun s -> (((v_Vuna_dCompiler_dCommon_dsplitCharsOnDot (Base_dList.dtp_unpack s)) Base_dList.C_Base_dList_dList_Nil) Base_dList.C_Base_dList_dList_Nil))

let v_Vuna_dCompiler_dCommon_dsplitLastDot = (fun parts -> (match (Base_dList.v_Base_dList_dreverse parts) with
  | Base_dList.C_Base_dList_dList_Nil -> { Base_dPair.f_Base_dPair_dPair_first = Base_dList.C_Base_dList_dList_Nil; Base_dPair.f_Base_dPair_dPair_second = "" }
  | Base_dList.C_Base_dList_dList_Cons (dtb__32, dtb__33) -> { Base_dPair.f_Base_dPair_dPair_first = (Base_dList.v_Base_dList_dreverse dtb__33); Base_dPair.f_Base_dPair_dPair_second = dtb__32 }
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dCommon_djoinDots = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__34, dtb__35) -> (match dtb__35 with
  | Base_dList.C_Base_dList_dList_Nil -> dtb__34
  | _ -> (String.concat "" [dtb__34; "."; (v_Vuna_dCompiler_dCommon_djoinDots dtb__35)])
)
  | Base_dList.C_Base_dList_dList_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dCommon_djoinSlashes = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__36, dtb__37) -> (match dtb__37 with
  | Base_dList.C_Base_dList_dList_Nil -> dtb__36
  | _ -> (String.concat "" [dtb__36; "/"; (v_Vuna_dCompiler_dCommon_djoinSlashes dtb__37)])
)
  | Base_dList.C_Base_dList_dList_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dCommon_djoinArrows = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__38, dtb__39) -> (match dtb__39 with
  | Base_dList.C_Base_dList_dList_Nil -> dtb__38
  | _ -> (String.concat "" [dtb__38; " -> "; (v_Vuna_dCompiler_dCommon_djoinArrows dtb__39)])
)
  | Base_dList.C_Base_dList_dList_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dCommon_dsplitPathChars = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__40, dtb__41) -> (if (dtb__40 = 47) then { Base_dPair.f_Base_dPair_dPair_first = (Base_dList.dtp_pack (Base_dList.v_Base_dList_dreverse mc1)); Base_dPair.f_Base_dPair_dPair_second = (Base_dList.dtp_pack dtb__41) } else ((v_Vuna_dCompiler_dCommon_dsplitPathChars dtb__41) (Base_dList.C_Base_dList_dList_Cons (dtb__40, mc1))))
  | Base_dList.C_Base_dList_dList_Nil -> ((fun chars -> { Base_dPair.f_Base_dPair_dPair_first = ""; Base_dPair.f_Base_dPair_dPair_second = (Base_dList.dtp_pack chars) }) (Base_dList.v_Base_dList_dreverse mc1))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCommon_dsplitPath = (fun path -> ((v_Vuna_dCompiler_dCommon_dsplitPathChars (Base_dList.dtp_unpack path)) Base_dList.C_Base_dList_dList_Nil))

let v_Vuna_dCompiler_dCommon_dbaseName = (fun path -> (Base_dPair.v_Base_dPair_dsecondOf (v_Vuna_dCompiler_dCommon_dsplitPath path)))

let rec v_Vuna_dCompiler_dCommon_dprefixLen2 = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__42, dtb__43) -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__44, dtb__45) -> (if (dtb__42 = dtb__44) then (1 + ((v_Vuna_dCompiler_dCommon_dprefixLen2 dtb__43) dtb__45)) else 0)
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
  | Base_dList.C_Base_dList_dList_Cons (dtb__46, dtb__47) -> (if ((v_Vuna_dCompiler_dCommon_d_usimilarName mc0) dtb__46) then (String.concat "" [" (did you mean "; dtb__46; "?)"]) else ((v_Vuna_dCompiler_dCommon_dsuggest mc0) dtb__47))
  | Base_dList.C_Base_dList_dList_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))
