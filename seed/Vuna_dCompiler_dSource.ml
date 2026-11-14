open Vuna_runtime
type t_Vuna_dCompiler_dSource_dPos = { f_Vuna_dCompiler_dSource_dPos_posLine : int; f_Vuna_dCompiler_dSource_dPos_posCol : int }
and t_Vuna_dCompiler_dSource_dSpan = { f_Vuna_dCompiler_dSource_dSpan_spanFile : string; f_Vuna_dCompiler_dSource_dSpan_spanStartLine : int; f_Vuna_dCompiler_dSource_dSpan_spanStartCol : int; f_Vuna_dCompiler_dSource_dSpan_spanEndLine : int; f_Vuna_dCompiler_dSource_dSpan_spanEndCol : int }

# 41 "Vuna/Compiler/Source.vuna"
let v_Vuna_dCompiler_dSource_dposLine = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dSource_dPos_posLine = dtb__0; f_Vuna_dCompiler_dSource_dPos_posCol = dtb__1 } -> dtb__0
  | _ -> failwith "DT: impossible branch"
))

# 45 "Vuna/Compiler/Source.vuna"
let v_Vuna_dCompiler_dSource_dposCol = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dSource_dPos_posLine = dtb__2; f_Vuna_dCompiler_dSource_dPos_posCol = dtb__3 } -> dtb__3
  | _ -> failwith "DT: impossible branch"
))

# 49 "Vuna/Compiler/Source.vuna"
let v_Vuna_dCompiler_dSource_dspanStartLine = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dSource_dSpan_spanFile = dtb__4; f_Vuna_dCompiler_dSource_dSpan_spanStartLine = dtb__5; f_Vuna_dCompiler_dSource_dSpan_spanStartCol = dtb__6; f_Vuna_dCompiler_dSource_dSpan_spanEndLine = dtb__7; f_Vuna_dCompiler_dSource_dSpan_spanEndCol = dtb__8 } -> dtb__5
  | _ -> failwith "DT: impossible branch"
))

# 53 "Vuna/Compiler/Source.vuna"
let v_Vuna_dCompiler_dSource_dspanStartCol = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dSource_dSpan_spanFile = dtb__9; f_Vuna_dCompiler_dSource_dSpan_spanStartLine = dtb__10; f_Vuna_dCompiler_dSource_dSpan_spanStartCol = dtb__11; f_Vuna_dCompiler_dSource_dSpan_spanEndLine = dtb__12; f_Vuna_dCompiler_dSource_dSpan_spanEndCol = dtb__13 } -> dtb__11
  | _ -> failwith "DT: impossible branch"
))

# 57 "Vuna/Compiler/Source.vuna"
let v_Vuna_dCompiler_dSource_dspanEndLine = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dSource_dSpan_spanFile = dtb__14; f_Vuna_dCompiler_dSource_dSpan_spanStartLine = dtb__15; f_Vuna_dCompiler_dSource_dSpan_spanStartCol = dtb__16; f_Vuna_dCompiler_dSource_dSpan_spanEndLine = dtb__17; f_Vuna_dCompiler_dSource_dSpan_spanEndCol = dtb__18 } -> dtb__17
  | _ -> failwith "DT: impossible branch"
))

# 61 "Vuna/Compiler/Source.vuna"
let v_Vuna_dCompiler_dSource_dspanEndCol = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dSource_dSpan_spanFile = dtb__19; f_Vuna_dCompiler_dSource_dSpan_spanStartLine = dtb__20; f_Vuna_dCompiler_dSource_dSpan_spanStartCol = dtb__21; f_Vuna_dCompiler_dSource_dSpan_spanEndLine = dtb__22; f_Vuna_dCompiler_dSource_dSpan_spanEndCol = dtb__23 } -> dtb__23
  | _ -> failwith "DT: impossible branch"
))

# 65 "Vuna/Compiler/Source.vuna"
let v_Vuna_dCompiler_dSource_dspanFile = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dSource_dSpan_spanFile = dtb__24; f_Vuna_dCompiler_dSource_dSpan_spanStartLine = dtb__25; f_Vuna_dCompiler_dSource_dSpan_spanStartCol = dtb__26; f_Vuna_dCompiler_dSource_dSpan_spanEndLine = dtb__27; f_Vuna_dCompiler_dSource_dSpan_spanEndCol = dtb__28 } -> dtb__24
  | _ -> failwith "DT: impossible branch"
))

# 69 "Vuna/Compiler/Source.vuna"
let v_Vuna_dCompiler_dSource_dshowSpanLoc = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dSource_dSpan_spanFile = dtb__29; f_Vuna_dCompiler_dSource_dSpan_spanStartLine = dtb__30; f_Vuna_dCompiler_dSource_dSpan_spanStartCol = dtb__31; f_Vuna_dCompiler_dSource_dSpan_spanEndLine = dtb__32; f_Vuna_dCompiler_dSource_dSpan_spanEndCol = dtb__33 } -> (String.concat "" [dtb__29; ":"; (bi_strFromInt dtb__30); ":"; (bi_strFromInt dtb__31)])
  | _ -> failwith "DT: impossible branch"
))

# 73 "Vuna/Compiler/Source.vuna"
let rec v_Vuna_dCompiler_dSource_dmemChar = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__34, dtb__35) -> (if (dtb__34 = mc0) then true else ((v_Vuna_dCompiler_dSource_dmemChar mc0) dtb__35))
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 78 "Vuna/Compiler/Source.vuna"
let v_Vuna_dCompiler_dSource_dcontainsDot = (fun s -> ((v_Vuna_dCompiler_dSource_dmemChar 46) (Base_dList.dtp_unpack s)))

# 90 "Vuna/Compiler/Source.vuna"
let rec v_Vuna_dCompiler_dSource_dsplitCharsOn = (fun mc0 mc1 mc2 mc3 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__36, dtb__37) -> (if (dtb__36 = mc0) then ((((v_Vuna_dCompiler_dSource_dsplitCharsOn mc0) dtb__37) (Base_dList.C_Base_dList_dList_Cons ((Base_dList.dtp_pack (Base_dList.v_Base_dList_dreverse mc3)), mc2))) Base_dList.C_Base_dList_dList_Nil) else ((((v_Vuna_dCompiler_dSource_dsplitCharsOn mc0) dtb__37) mc2) (Base_dList.C_Base_dList_dList_Cons (dtb__36, mc3))))
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dList.v_Base_dList_dreverse (Base_dList.C_Base_dList_dList_Cons ((Base_dList.dtp_pack (Base_dList.v_Base_dList_dreverse mc3)), mc2)))
  | _ -> failwith "DT: impossible branch"
))

# 86 "Vuna/Compiler/Source.vuna"
let v_Vuna_dCompiler_dSource_dsplitOnChar = (fun sep s -> ((((v_Vuna_dCompiler_dSource_dsplitCharsOn sep) (Base_dList.dtp_unpack s)) Base_dList.C_Base_dList_dList_Nil) Base_dList.C_Base_dList_dList_Nil))

# 97 "Vuna/Compiler/Source.vuna"
let rec v_Vuna_dCompiler_dSource_dsplitCharsOnDot = (fun mc0 mc1 mc2 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__38, dtb__39) -> (if (dtb__38 = 46) then (((v_Vuna_dCompiler_dSource_dsplitCharsOnDot dtb__39) (Base_dList.C_Base_dList_dList_Cons ((Base_dList.dtp_pack (Base_dList.v_Base_dList_dreverse mc2)), mc1))) Base_dList.C_Base_dList_dList_Nil) else (((v_Vuna_dCompiler_dSource_dsplitCharsOnDot dtb__39) mc1) (Base_dList.C_Base_dList_dList_Cons (dtb__38, mc2))))
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dList.v_Base_dList_dreverse (Base_dList.C_Base_dList_dList_Cons ((Base_dList.dtp_pack (Base_dList.v_Base_dList_dreverse mc2)), mc1)))
  | _ -> failwith "DT: impossible branch"
))

# 82 "Vuna/Compiler/Source.vuna"
let v_Vuna_dCompiler_dSource_dsplitOnDot = (fun s -> (((v_Vuna_dCompiler_dSource_dsplitCharsOnDot (Base_dList.dtp_unpack s)) Base_dList.C_Base_dList_dList_Nil) Base_dList.C_Base_dList_dList_Nil))

# 105 "Vuna/Compiler/Source.vuna"
let v_Vuna_dCompiler_dSource_dsplitLastDot = (fun parts -> (match (Base_dList.v_Base_dList_dreverse parts) with
  | Base_dList.C_Base_dList_dList_Nil -> { Base_dPair.f_Base_dPair_dPair_first = Base_dList.C_Base_dList_dList_Nil; Base_dPair.f_Base_dPair_dPair_second = "" }
  | Base_dList.C_Base_dList_dList_Cons (dtb__40, dtb__41) -> { Base_dPair.f_Base_dPair_dPair_first = (Base_dList.v_Base_dList_dreverse dtb__41); Base_dPair.f_Base_dPair_dPair_second = dtb__40 }
  | _ -> failwith "DT: impossible branch"
))

# 111 "Vuna/Compiler/Source.vuna"
let rec v_Vuna_dCompiler_dSource_djoinDots = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__42, dtb__43) -> (match dtb__43 with
  | Base_dList.C_Base_dList_dList_Nil -> dtb__42
  | _ -> (String.concat "" [dtb__42; "."; (v_Vuna_dCompiler_dSource_djoinDots dtb__43)])
)
  | Base_dList.C_Base_dList_dList_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))

# 117 "Vuna/Compiler/Source.vuna"
let rec v_Vuna_dCompiler_dSource_djoinSlashes = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__44, dtb__45) -> (match dtb__45 with
  | Base_dList.C_Base_dList_dList_Nil -> dtb__44
  | _ -> (String.concat "" [dtb__44; "/"; (v_Vuna_dCompiler_dSource_djoinSlashes dtb__45)])
)
  | Base_dList.C_Base_dList_dList_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))

# 123 "Vuna/Compiler/Source.vuna"
let rec v_Vuna_dCompiler_dSource_djoinArrows = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__46, dtb__47) -> (match dtb__47 with
  | Base_dList.C_Base_dList_dList_Nil -> dtb__46
  | _ -> (String.concat "" [dtb__46; " -> "; (v_Vuna_dCompiler_dSource_djoinArrows dtb__47)])
)
  | Base_dList.C_Base_dList_dList_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))

# 134 "Vuna/Compiler/Source.vuna"
let rec v_Vuna_dCompiler_dSource_dsplitPathChars = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__48, dtb__49) -> (if (dtb__48 = 47) then { Base_dPair.f_Base_dPair_dPair_first = (Base_dList.dtp_pack (Base_dList.v_Base_dList_dreverse mc1)); Base_dPair.f_Base_dPair_dPair_second = (Base_dList.dtp_pack dtb__49) } else ((v_Vuna_dCompiler_dSource_dsplitPathChars dtb__49) (Base_dList.C_Base_dList_dList_Cons (dtb__48, mc1))))
  | Base_dList.C_Base_dList_dList_Nil -> ((fun chars -> { Base_dPair.f_Base_dPair_dPair_first = ""; Base_dPair.f_Base_dPair_dPair_second = (Base_dList.dtp_pack chars) }) (Base_dList.v_Base_dList_dreverse mc1))
  | _ -> failwith "DT: impossible branch"
))

# 130 "Vuna/Compiler/Source.vuna"
let v_Vuna_dCompiler_dSource_dsplitPath = (fun path -> ((v_Vuna_dCompiler_dSource_dsplitPathChars (Base_dList.dtp_unpack path)) Base_dList.C_Base_dList_dList_Nil))

# 143 "Vuna/Compiler/Source.vuna"
let v_Vuna_dCompiler_dSource_dbaseName = (fun path -> (Base_dPair.v_Base_dPair_dsecondOf (v_Vuna_dCompiler_dSource_dsplitPath path)))

# 166 "Vuna/Compiler/Source.vuna"
let rec v_Vuna_dCompiler_dSource_dprefixLen2 = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__50, dtb__51) -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__52, dtb__53) -> (if (dtb__50 = dtb__52) then (1 + ((v_Vuna_dCompiler_dSource_dprefixLen2 dtb__51) dtb__53)) else 0)
  | Base_dList.C_Base_dList_dList_Nil -> 0
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Nil -> 0
  | _ -> 0
)
  | _ -> failwith "DT: impossible branch"
))

# 172 "Vuna/Compiler/Source.vuna"
let v_Vuna_dCompiler_dSource_dlengthDiffLE = (fun la lb n -> (if (la >= lb) then ((la - lb) <= n) else ((lb - la) <= n)))

# 154 "Vuna/Compiler/Source.vuna"
let v_Vuna_dCompiler_dSource_d_usimilarName = (fun a b -> (if (a = b) then false else (if ((Base_dString.v_Base_dString_dstartsWith a) b) then true else (if ((Base_dString.v_Base_dString_dstartsWith b) a) then true else ((fun la -> ((fun lb -> (if (((v_Vuna_dCompiler_dSource_dlengthDiffLE (Base_dList.v_Base_dList_dlength la)) (Base_dList.v_Base_dList_dlength lb)) 2) then (((v_Vuna_dCompiler_dSource_dprefixLen2 la) lb) >= 2) else false)) (Base_dList.dtp_unpack b))) (Base_dList.dtp_unpack a))))))

# 147 "Vuna/Compiler/Source.vuna"
let rec v_Vuna_dCompiler_dSource_dsuggest = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__54, dtb__55) -> (if ((v_Vuna_dCompiler_dSource_d_usimilarName mc0) dtb__54) then (String.concat "" [" (did you mean "; dtb__54; "?)"]) else ((v_Vuna_dCompiler_dSource_dsuggest mc0) dtb__55))
  | Base_dList.C_Base_dList_dList_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))
