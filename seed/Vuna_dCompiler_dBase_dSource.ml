open Vuna_runtime
type t_Vuna_dCompiler_dBase_dSource_dPos = { f_Vuna_dCompiler_dBase_dSource_dPos_posLine : int; f_Vuna_dCompiler_dBase_dSource_dPos_posCol : int; f_Vuna_dCompiler_dBase_dSource_dPos_posOffset : int; f_Vuna_dCompiler_dBase_dSource_dPos_posEndOffset : int }
and t_Vuna_dCompiler_dBase_dSource_dSpan = { f_Vuna_dCompiler_dBase_dSource_dSpan_spanFile : string; f_Vuna_dCompiler_dBase_dSource_dSpan_spanStartLine : int; f_Vuna_dCompiler_dBase_dSource_dSpan_spanStartCol : int; f_Vuna_dCompiler_dBase_dSource_dSpan_spanEndLine : int; f_Vuna_dCompiler_dBase_dSource_dSpan_spanEndCol : int; f_Vuna_dCompiler_dBase_dSource_dSpan_spanStartOffset : int; f_Vuna_dCompiler_dBase_dSource_dSpan_spanEndOffset : int }

# 52 "Vuna/Compiler/Base/Source.vuna"
let v_Vuna_dCompiler_dBase_dSource_dposLine = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dBase_dSource_dPos_posLine = dtb__0; f_Vuna_dCompiler_dBase_dSource_dPos_posCol = dtb__1; f_Vuna_dCompiler_dBase_dSource_dPos_posOffset = dtb__2; f_Vuna_dCompiler_dBase_dSource_dPos_posEndOffset = dtb__3 } -> dtb__0
  | _ -> failwith "DT: impossible branch"
))

# 56 "Vuna/Compiler/Base/Source.vuna"
let v_Vuna_dCompiler_dBase_dSource_dposCol = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dBase_dSource_dPos_posLine = dtb__4; f_Vuna_dCompiler_dBase_dSource_dPos_posCol = dtb__5; f_Vuna_dCompiler_dBase_dSource_dPos_posOffset = dtb__6; f_Vuna_dCompiler_dBase_dSource_dPos_posEndOffset = dtb__7 } -> dtb__5
  | _ -> failwith "DT: impossible branch"
))

# 60 "Vuna/Compiler/Base/Source.vuna"
let v_Vuna_dCompiler_dBase_dSource_dposOffset = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dBase_dSource_dPos_posLine = dtb__8; f_Vuna_dCompiler_dBase_dSource_dPos_posCol = dtb__9; f_Vuna_dCompiler_dBase_dSource_dPos_posOffset = dtb__10; f_Vuna_dCompiler_dBase_dSource_dPos_posEndOffset = dtb__11 } -> dtb__10
  | _ -> failwith "DT: impossible branch"
))

# 64 "Vuna/Compiler/Base/Source.vuna"
let v_Vuna_dCompiler_dBase_dSource_dposEndOffset = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dBase_dSource_dPos_posLine = dtb__12; f_Vuna_dCompiler_dBase_dSource_dPos_posCol = dtb__13; f_Vuna_dCompiler_dBase_dSource_dPos_posOffset = dtb__14; f_Vuna_dCompiler_dBase_dSource_dPos_posEndOffset = dtb__15 } -> dtb__15
  | _ -> failwith "DT: impossible branch"
))

# 68 "Vuna/Compiler/Base/Source.vuna"
let v_Vuna_dCompiler_dBase_dSource_dspanStartLine = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dBase_dSource_dSpan_spanFile = dtb__16; f_Vuna_dCompiler_dBase_dSource_dSpan_spanStartLine = dtb__17; f_Vuna_dCompiler_dBase_dSource_dSpan_spanStartCol = dtb__18; f_Vuna_dCompiler_dBase_dSource_dSpan_spanEndLine = dtb__19; f_Vuna_dCompiler_dBase_dSource_dSpan_spanEndCol = dtb__20; f_Vuna_dCompiler_dBase_dSource_dSpan_spanStartOffset = dtb__21; f_Vuna_dCompiler_dBase_dSource_dSpan_spanEndOffset = dtb__22 } -> dtb__17
  | _ -> failwith "DT: impossible branch"
))

# 72 "Vuna/Compiler/Base/Source.vuna"
let v_Vuna_dCompiler_dBase_dSource_dspanStartCol = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dBase_dSource_dSpan_spanFile = dtb__23; f_Vuna_dCompiler_dBase_dSource_dSpan_spanStartLine = dtb__24; f_Vuna_dCompiler_dBase_dSource_dSpan_spanStartCol = dtb__25; f_Vuna_dCompiler_dBase_dSource_dSpan_spanEndLine = dtb__26; f_Vuna_dCompiler_dBase_dSource_dSpan_spanEndCol = dtb__27; f_Vuna_dCompiler_dBase_dSource_dSpan_spanStartOffset = dtb__28; f_Vuna_dCompiler_dBase_dSource_dSpan_spanEndOffset = dtb__29 } -> dtb__25
  | _ -> failwith "DT: impossible branch"
))

# 76 "Vuna/Compiler/Base/Source.vuna"
let v_Vuna_dCompiler_dBase_dSource_dspanEndLine = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dBase_dSource_dSpan_spanFile = dtb__30; f_Vuna_dCompiler_dBase_dSource_dSpan_spanStartLine = dtb__31; f_Vuna_dCompiler_dBase_dSource_dSpan_spanStartCol = dtb__32; f_Vuna_dCompiler_dBase_dSource_dSpan_spanEndLine = dtb__33; f_Vuna_dCompiler_dBase_dSource_dSpan_spanEndCol = dtb__34; f_Vuna_dCompiler_dBase_dSource_dSpan_spanStartOffset = dtb__35; f_Vuna_dCompiler_dBase_dSource_dSpan_spanEndOffset = dtb__36 } -> dtb__33
  | _ -> failwith "DT: impossible branch"
))

# 80 "Vuna/Compiler/Base/Source.vuna"
let v_Vuna_dCompiler_dBase_dSource_dspanEndCol = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dBase_dSource_dSpan_spanFile = dtb__37; f_Vuna_dCompiler_dBase_dSource_dSpan_spanStartLine = dtb__38; f_Vuna_dCompiler_dBase_dSource_dSpan_spanStartCol = dtb__39; f_Vuna_dCompiler_dBase_dSource_dSpan_spanEndLine = dtb__40; f_Vuna_dCompiler_dBase_dSource_dSpan_spanEndCol = dtb__41; f_Vuna_dCompiler_dBase_dSource_dSpan_spanStartOffset = dtb__42; f_Vuna_dCompiler_dBase_dSource_dSpan_spanEndOffset = dtb__43 } -> dtb__41
  | _ -> failwith "DT: impossible branch"
))

# 84 "Vuna/Compiler/Base/Source.vuna"
let v_Vuna_dCompiler_dBase_dSource_dspanStartOffset = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dBase_dSource_dSpan_spanFile = dtb__44; f_Vuna_dCompiler_dBase_dSource_dSpan_spanStartLine = dtb__45; f_Vuna_dCompiler_dBase_dSource_dSpan_spanStartCol = dtb__46; f_Vuna_dCompiler_dBase_dSource_dSpan_spanEndLine = dtb__47; f_Vuna_dCompiler_dBase_dSource_dSpan_spanEndCol = dtb__48; f_Vuna_dCompiler_dBase_dSource_dSpan_spanStartOffset = dtb__49; f_Vuna_dCompiler_dBase_dSource_dSpan_spanEndOffset = dtb__50 } -> dtb__49
  | _ -> failwith "DT: impossible branch"
))

# 88 "Vuna/Compiler/Base/Source.vuna"
let v_Vuna_dCompiler_dBase_dSource_dspanEndOffset = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dBase_dSource_dSpan_spanFile = dtb__51; f_Vuna_dCompiler_dBase_dSource_dSpan_spanStartLine = dtb__52; f_Vuna_dCompiler_dBase_dSource_dSpan_spanStartCol = dtb__53; f_Vuna_dCompiler_dBase_dSource_dSpan_spanEndLine = dtb__54; f_Vuna_dCompiler_dBase_dSource_dSpan_spanEndCol = dtb__55; f_Vuna_dCompiler_dBase_dSource_dSpan_spanStartOffset = dtb__56; f_Vuna_dCompiler_dBase_dSource_dSpan_spanEndOffset = dtb__57 } -> dtb__57
  | _ -> failwith "DT: impossible branch"
))

# 92 "Vuna/Compiler/Base/Source.vuna"
let v_Vuna_dCompiler_dBase_dSource_dspanFile = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dBase_dSource_dSpan_spanFile = dtb__58; f_Vuna_dCompiler_dBase_dSource_dSpan_spanStartLine = dtb__59; f_Vuna_dCompiler_dBase_dSource_dSpan_spanStartCol = dtb__60; f_Vuna_dCompiler_dBase_dSource_dSpan_spanEndLine = dtb__61; f_Vuna_dCompiler_dBase_dSource_dSpan_spanEndCol = dtb__62; f_Vuna_dCompiler_dBase_dSource_dSpan_spanStartOffset = dtb__63; f_Vuna_dCompiler_dBase_dSource_dSpan_spanEndOffset = dtb__64 } -> dtb__58
  | _ -> failwith "DT: impossible branch"
))

# 96 "Vuna/Compiler/Base/Source.vuna"
let v_Vuna_dCompiler_dBase_dSource_dshowSpanLoc = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dBase_dSource_dSpan_spanFile = dtb__65; f_Vuna_dCompiler_dBase_dSource_dSpan_spanStartLine = dtb__66; f_Vuna_dCompiler_dBase_dSource_dSpan_spanStartCol = dtb__67; f_Vuna_dCompiler_dBase_dSource_dSpan_spanEndLine = dtb__68; f_Vuna_dCompiler_dBase_dSource_dSpan_spanEndCol = dtb__69; f_Vuna_dCompiler_dBase_dSource_dSpan_spanStartOffset = dtb__70; f_Vuna_dCompiler_dBase_dSource_dSpan_spanEndOffset = dtb__71 } -> (String.concat "" [dtb__65; ":"; (bi_strFromInt dtb__66); ":"; (bi_strFromInt dtb__67)])
  | _ -> failwith "DT: impossible branch"
))

# 100 "Vuna/Compiler/Base/Source.vuna"
let rec v_Vuna_dCompiler_dBase_dSource_dmemChar = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__72, dtb__73) -> (if (dtb__72 = mc0) then true else ((v_Vuna_dCompiler_dBase_dSource_dmemChar mc0) dtb__73))
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 105 "Vuna/Compiler/Base/Source.vuna"
let v_Vuna_dCompiler_dBase_dSource_dcontainsDot = (fun s -> ((v_Vuna_dCompiler_dBase_dSource_dmemChar 46) (Base_dList.dtp_unpack s)))

# 117 "Vuna/Compiler/Base/Source.vuna"
let rec v_Vuna_dCompiler_dBase_dSource_dsplitCharsOn = (fun mc0 mc1 mc2 mc3 -> (match mc1 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__74, dtb__75) -> (if (dtb__74 = mc0) then ((((v_Vuna_dCompiler_dBase_dSource_dsplitCharsOn mc0) dtb__75) (Base_dList.C_Base_dList_dList__x58__x58_ ((Base_dList.dtp_pack (Base_dList.v_Base_dList_dreverse mc3)), mc2))) Base_dList.C_Base_dList_dList_Nil) else ((((v_Vuna_dCompiler_dBase_dSource_dsplitCharsOn mc0) dtb__75) mc2) (Base_dList.C_Base_dList_dList__x58__x58_ (dtb__74, mc3))))
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dList.v_Base_dList_dreverse (Base_dList.C_Base_dList_dList__x58__x58_ ((Base_dList.dtp_pack (Base_dList.v_Base_dList_dreverse mc3)), mc2)))
  | _ -> failwith "DT: impossible branch"
))

# 113 "Vuna/Compiler/Base/Source.vuna"
let v_Vuna_dCompiler_dBase_dSource_dsplitOnChar = (fun sep s -> ((((v_Vuna_dCompiler_dBase_dSource_dsplitCharsOn sep) (Base_dList.dtp_unpack s)) Base_dList.C_Base_dList_dList_Nil) Base_dList.C_Base_dList_dList_Nil))

# 124 "Vuna/Compiler/Base/Source.vuna"
let rec v_Vuna_dCompiler_dBase_dSource_dsplitCharsOnDot = (fun mc0 mc1 mc2 -> (match mc0 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__76, dtb__77) -> (if (dtb__76 = 46) then (((v_Vuna_dCompiler_dBase_dSource_dsplitCharsOnDot dtb__77) (Base_dList.C_Base_dList_dList__x58__x58_ ((Base_dList.dtp_pack (Base_dList.v_Base_dList_dreverse mc2)), mc1))) Base_dList.C_Base_dList_dList_Nil) else (((v_Vuna_dCompiler_dBase_dSource_dsplitCharsOnDot dtb__77) mc1) (Base_dList.C_Base_dList_dList__x58__x58_ (dtb__76, mc2))))
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dList.v_Base_dList_dreverse (Base_dList.C_Base_dList_dList__x58__x58_ ((Base_dList.dtp_pack (Base_dList.v_Base_dList_dreverse mc2)), mc1)))
  | _ -> failwith "DT: impossible branch"
))

# 109 "Vuna/Compiler/Base/Source.vuna"
let v_Vuna_dCompiler_dBase_dSource_dsplitOnDot = (fun s -> (((v_Vuna_dCompiler_dBase_dSource_dsplitCharsOnDot (Base_dList.dtp_unpack s)) Base_dList.C_Base_dList_dList_Nil) Base_dList.C_Base_dList_dList_Nil))

# 132 "Vuna/Compiler/Base/Source.vuna"
let v_Vuna_dCompiler_dBase_dSource_dsplitLastDot = (fun parts -> (match (Base_dList.v_Base_dList_dreverse parts) with
  | Base_dList.C_Base_dList_dList_Nil -> { Base_dPair.f_Base_dPair_dPair_first = Base_dList.C_Base_dList_dList_Nil; Base_dPair.f_Base_dPair_dPair_second = "" }
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__78, dtb__79) -> { Base_dPair.f_Base_dPair_dPair_first = (Base_dList.v_Base_dList_dreverse dtb__79); Base_dPair.f_Base_dPair_dPair_second = dtb__78 }
  | _ -> failwith "DT: impossible branch"
))

# 138 "Vuna/Compiler/Base/Source.vuna"
let rec v_Vuna_dCompiler_dBase_dSource_djoinDots = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__80, dtb__81) -> (match dtb__81 with
  | Base_dList.C_Base_dList_dList_Nil -> dtb__80
  | _ -> (String.concat "" [dtb__80; "."; (v_Vuna_dCompiler_dBase_dSource_djoinDots dtb__81)])
)
  | Base_dList.C_Base_dList_dList_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))

# 146 "Vuna/Compiler/Base/Source.vuna"
let v_Vuna_dCompiler_dBase_dSource_dlastSeg = (fun name -> (Base_dPair.v_Base_dPair_dsecondOf (v_Vuna_dCompiler_dBase_dSource_dsplitLastDot (v_Vuna_dCompiler_dBase_dSource_dsplitOnDot name))))

# 150 "Vuna/Compiler/Base/Source.vuna"
let v_Vuna_dCompiler_dBase_dSource_dprefixOfName = (fun name -> (match (v_Vuna_dCompiler_dBase_dSource_dsplitLastDot (v_Vuna_dCompiler_dBase_dSource_dsplitOnDot name)) with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__82; Base_dPair.f_Base_dPair_dPair_second = dtb__83 } -> (v_Vuna_dCompiler_dBase_dSource_djoinDots dtb__82)
  | _ -> failwith "DT: impossible branch"
))

# 155 "Vuna/Compiler/Base/Source.vuna"
let rec v_Vuna_dCompiler_dBase_dSource_djoinSlashes = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__84, dtb__85) -> (match dtb__85 with
  | Base_dList.C_Base_dList_dList_Nil -> dtb__84
  | _ -> (String.concat "" [dtb__84; "/"; (v_Vuna_dCompiler_dBase_dSource_djoinSlashes dtb__85)])
)
  | Base_dList.C_Base_dList_dList_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))

# 161 "Vuna/Compiler/Base/Source.vuna"
let rec v_Vuna_dCompiler_dBase_dSource_djoinArrows = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__86, dtb__87) -> (match dtb__87 with
  | Base_dList.C_Base_dList_dList_Nil -> dtb__86
  | _ -> (String.concat "" [dtb__86; " -> "; (v_Vuna_dCompiler_dBase_dSource_djoinArrows dtb__87)])
)
  | Base_dList.C_Base_dList_dList_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))

# 172 "Vuna/Compiler/Base/Source.vuna"
let rec v_Vuna_dCompiler_dBase_dSource_dsplitPathChars = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__88, dtb__89) -> (if (dtb__88 = 47) then { Base_dPair.f_Base_dPair_dPair_first = (Base_dList.dtp_pack (Base_dList.v_Base_dList_dreverse mc1)); Base_dPair.f_Base_dPair_dPair_second = (Base_dList.dtp_pack dtb__89) } else ((v_Vuna_dCompiler_dBase_dSource_dsplitPathChars dtb__89) (Base_dList.C_Base_dList_dList__x58__x58_ (dtb__88, mc1))))
  | Base_dList.C_Base_dList_dList_Nil -> ((fun chars -> { Base_dPair.f_Base_dPair_dPair_first = ""; Base_dPair.f_Base_dPair_dPair_second = (Base_dList.dtp_pack chars) }) (Base_dList.v_Base_dList_dreverse mc1))
  | _ -> failwith "DT: impossible branch"
))

# 168 "Vuna/Compiler/Base/Source.vuna"
let v_Vuna_dCompiler_dBase_dSource_dsplitPath = (fun path -> ((v_Vuna_dCompiler_dBase_dSource_dsplitPathChars (Base_dList.dtp_unpack path)) Base_dList.C_Base_dList_dList_Nil))

# 181 "Vuna/Compiler/Base/Source.vuna"
let v_Vuna_dCompiler_dBase_dSource_dbaseName = (fun path -> (Base_dPair.v_Base_dPair_dsecondOf (v_Vuna_dCompiler_dBase_dSource_dsplitPath path)))

# 199 "Vuna/Compiler/Base/Source.vuna"
let rec v_Vuna_dCompiler_dBase_dSource_ddropPastSlash = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__90, dtb__91) -> (if (dtb__90 = 47) then dtb__91 else (v_Vuna_dCompiler_dBase_dSource_ddropPastSlash dtb__91))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 186 "Vuna/Compiler/Base/Source.vuna"
let v_Vuna_dCompiler_dBase_dSource_dparentOfPath = (fun path -> ((fun chars -> ((fun rev -> ((fun after -> (if ((Base_dList.v_Base_dList_dlength after) = (Base_dList.v_Base_dList_dlength rev)) then "." else ((fun parent -> (if (parent = "") then (if ((Base_dString.v_Base_dString_dstartsWith "/") path) then "/" else ".") else (if (if ((Base_dString.v_Base_dString_dstartsWith "/") path) then (Base_dBool.v_Base_dBool_dnot ((Base_dString.v_Base_dString_dstartsWith "/") parent)) else false) then ("/" ^ parent) else parent))) (Base_dList.dtp_pack (Base_dList.v_Base_dList_dreverse after))))) (v_Vuna_dCompiler_dBase_dSource_ddropPastSlash rev))) (Base_dList.v_Base_dList_dreverse chars))) (Base_dList.dtp_unpack path)))

# 223 "Vuna/Compiler/Base/Source.vuna"
let rec v_Vuna_dCompiler_dBase_dSource_dprefixLen2 = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__92, dtb__93) -> (match mc1 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__94, dtb__95) -> (if (dtb__92 = dtb__94) then (1 + ((v_Vuna_dCompiler_dBase_dSource_dprefixLen2 dtb__93) dtb__95)) else 0)
  | Base_dList.C_Base_dList_dList_Nil -> 0
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))

# 229 "Vuna/Compiler/Base/Source.vuna"
let v_Vuna_dCompiler_dBase_dSource_dlengthDiffLE = (fun la lb n -> (if (la >= lb) then ((la - lb) <= n) else ((lb - la) <= n)))

# 211 "Vuna/Compiler/Base/Source.vuna"
let v_Vuna_dCompiler_dBase_dSource_d_usimilarName = (fun a b -> (if (a = b) then false else (if ((Base_dString.v_Base_dString_dstartsWith a) b) then true else (if ((Base_dString.v_Base_dString_dstartsWith b) a) then true else ((fun la -> ((fun lb -> (if (((v_Vuna_dCompiler_dBase_dSource_dlengthDiffLE (Base_dList.v_Base_dList_dlength la)) (Base_dList.v_Base_dList_dlength lb)) 2) then (((v_Vuna_dCompiler_dBase_dSource_dprefixLen2 la) lb) >= 2) else false)) (Base_dList.dtp_unpack b))) (Base_dList.dtp_unpack a))))))

# 204 "Vuna/Compiler/Base/Source.vuna"
let rec v_Vuna_dCompiler_dBase_dSource_dsuggest = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__96, dtb__97) -> (if ((v_Vuna_dCompiler_dBase_dSource_d_usimilarName mc0) dtb__96) then (String.concat "" [" (did you mean "; dtb__96; "?)"]) else ((v_Vuna_dCompiler_dBase_dSource_dsuggest mc0) dtb__97))
  | Base_dList.C_Base_dList_dList_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))
