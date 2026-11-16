open Vuna_runtime
type t_Vuna_dCompiler_dBase_dSource_dPos = { f_Vuna_dCompiler_dBase_dSource_dPos_posLine : int; f_Vuna_dCompiler_dBase_dSource_dPos_posCol : int; f_Vuna_dCompiler_dBase_dSource_dPos_posOffset : int }
and t_Vuna_dCompiler_dBase_dSource_dSpan = { f_Vuna_dCompiler_dBase_dSource_dSpan_spanFile : string; f_Vuna_dCompiler_dBase_dSource_dSpan_spanStartLine : int; f_Vuna_dCompiler_dBase_dSource_dSpan_spanStartCol : int; f_Vuna_dCompiler_dBase_dSource_dSpan_spanEndLine : int; f_Vuna_dCompiler_dBase_dSource_dSpan_spanEndCol : int; f_Vuna_dCompiler_dBase_dSource_dSpan_spanStartOffset : int; f_Vuna_dCompiler_dBase_dSource_dSpan_spanEndOffset : int }

# 50 "Vuna/Compiler/Base/Source.vuna"
let v_Vuna_dCompiler_dBase_dSource_dposLine = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dBase_dSource_dPos_posLine = dtb__0; f_Vuna_dCompiler_dBase_dSource_dPos_posCol = dtb__1; f_Vuna_dCompiler_dBase_dSource_dPos_posOffset = dtb__2 } -> dtb__0
  | _ -> failwith "DT: impossible branch"
))

# 54 "Vuna/Compiler/Base/Source.vuna"
let v_Vuna_dCompiler_dBase_dSource_dposCol = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dBase_dSource_dPos_posLine = dtb__3; f_Vuna_dCompiler_dBase_dSource_dPos_posCol = dtb__4; f_Vuna_dCompiler_dBase_dSource_dPos_posOffset = dtb__5 } -> dtb__4
  | _ -> failwith "DT: impossible branch"
))

# 58 "Vuna/Compiler/Base/Source.vuna"
let v_Vuna_dCompiler_dBase_dSource_dposOffset = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dBase_dSource_dPos_posLine = dtb__6; f_Vuna_dCompiler_dBase_dSource_dPos_posCol = dtb__7; f_Vuna_dCompiler_dBase_dSource_dPos_posOffset = dtb__8 } -> dtb__8
  | _ -> failwith "DT: impossible branch"
))

# 62 "Vuna/Compiler/Base/Source.vuna"
let v_Vuna_dCompiler_dBase_dSource_dspanStartLine = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dBase_dSource_dSpan_spanFile = dtb__9; f_Vuna_dCompiler_dBase_dSource_dSpan_spanStartLine = dtb__10; f_Vuna_dCompiler_dBase_dSource_dSpan_spanStartCol = dtb__11; f_Vuna_dCompiler_dBase_dSource_dSpan_spanEndLine = dtb__12; f_Vuna_dCompiler_dBase_dSource_dSpan_spanEndCol = dtb__13; f_Vuna_dCompiler_dBase_dSource_dSpan_spanStartOffset = dtb__14; f_Vuna_dCompiler_dBase_dSource_dSpan_spanEndOffset = dtb__15 } -> dtb__10
  | _ -> failwith "DT: impossible branch"
))

# 66 "Vuna/Compiler/Base/Source.vuna"
let v_Vuna_dCompiler_dBase_dSource_dspanStartCol = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dBase_dSource_dSpan_spanFile = dtb__16; f_Vuna_dCompiler_dBase_dSource_dSpan_spanStartLine = dtb__17; f_Vuna_dCompiler_dBase_dSource_dSpan_spanStartCol = dtb__18; f_Vuna_dCompiler_dBase_dSource_dSpan_spanEndLine = dtb__19; f_Vuna_dCompiler_dBase_dSource_dSpan_spanEndCol = dtb__20; f_Vuna_dCompiler_dBase_dSource_dSpan_spanStartOffset = dtb__21; f_Vuna_dCompiler_dBase_dSource_dSpan_spanEndOffset = dtb__22 } -> dtb__18
  | _ -> failwith "DT: impossible branch"
))

# 70 "Vuna/Compiler/Base/Source.vuna"
let v_Vuna_dCompiler_dBase_dSource_dspanEndLine = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dBase_dSource_dSpan_spanFile = dtb__23; f_Vuna_dCompiler_dBase_dSource_dSpan_spanStartLine = dtb__24; f_Vuna_dCompiler_dBase_dSource_dSpan_spanStartCol = dtb__25; f_Vuna_dCompiler_dBase_dSource_dSpan_spanEndLine = dtb__26; f_Vuna_dCompiler_dBase_dSource_dSpan_spanEndCol = dtb__27; f_Vuna_dCompiler_dBase_dSource_dSpan_spanStartOffset = dtb__28; f_Vuna_dCompiler_dBase_dSource_dSpan_spanEndOffset = dtb__29 } -> dtb__26
  | _ -> failwith "DT: impossible branch"
))

# 74 "Vuna/Compiler/Base/Source.vuna"
let v_Vuna_dCompiler_dBase_dSource_dspanEndCol = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dBase_dSource_dSpan_spanFile = dtb__30; f_Vuna_dCompiler_dBase_dSource_dSpan_spanStartLine = dtb__31; f_Vuna_dCompiler_dBase_dSource_dSpan_spanStartCol = dtb__32; f_Vuna_dCompiler_dBase_dSource_dSpan_spanEndLine = dtb__33; f_Vuna_dCompiler_dBase_dSource_dSpan_spanEndCol = dtb__34; f_Vuna_dCompiler_dBase_dSource_dSpan_spanStartOffset = dtb__35; f_Vuna_dCompiler_dBase_dSource_dSpan_spanEndOffset = dtb__36 } -> dtb__34
  | _ -> failwith "DT: impossible branch"
))

# 78 "Vuna/Compiler/Base/Source.vuna"
let v_Vuna_dCompiler_dBase_dSource_dspanStartOffset = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dBase_dSource_dSpan_spanFile = dtb__37; f_Vuna_dCompiler_dBase_dSource_dSpan_spanStartLine = dtb__38; f_Vuna_dCompiler_dBase_dSource_dSpan_spanStartCol = dtb__39; f_Vuna_dCompiler_dBase_dSource_dSpan_spanEndLine = dtb__40; f_Vuna_dCompiler_dBase_dSource_dSpan_spanEndCol = dtb__41; f_Vuna_dCompiler_dBase_dSource_dSpan_spanStartOffset = dtb__42; f_Vuna_dCompiler_dBase_dSource_dSpan_spanEndOffset = dtb__43 } -> dtb__42
  | _ -> failwith "DT: impossible branch"
))

# 82 "Vuna/Compiler/Base/Source.vuna"
let v_Vuna_dCompiler_dBase_dSource_dspanEndOffset = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dBase_dSource_dSpan_spanFile = dtb__44; f_Vuna_dCompiler_dBase_dSource_dSpan_spanStartLine = dtb__45; f_Vuna_dCompiler_dBase_dSource_dSpan_spanStartCol = dtb__46; f_Vuna_dCompiler_dBase_dSource_dSpan_spanEndLine = dtb__47; f_Vuna_dCompiler_dBase_dSource_dSpan_spanEndCol = dtb__48; f_Vuna_dCompiler_dBase_dSource_dSpan_spanStartOffset = dtb__49; f_Vuna_dCompiler_dBase_dSource_dSpan_spanEndOffset = dtb__50 } -> dtb__50
  | _ -> failwith "DT: impossible branch"
))

# 86 "Vuna/Compiler/Base/Source.vuna"
let v_Vuna_dCompiler_dBase_dSource_dspanFile = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dBase_dSource_dSpan_spanFile = dtb__51; f_Vuna_dCompiler_dBase_dSource_dSpan_spanStartLine = dtb__52; f_Vuna_dCompiler_dBase_dSource_dSpan_spanStartCol = dtb__53; f_Vuna_dCompiler_dBase_dSource_dSpan_spanEndLine = dtb__54; f_Vuna_dCompiler_dBase_dSource_dSpan_spanEndCol = dtb__55; f_Vuna_dCompiler_dBase_dSource_dSpan_spanStartOffset = dtb__56; f_Vuna_dCompiler_dBase_dSource_dSpan_spanEndOffset = dtb__57 } -> dtb__51
  | _ -> failwith "DT: impossible branch"
))

# 90 "Vuna/Compiler/Base/Source.vuna"
let v_Vuna_dCompiler_dBase_dSource_dshowSpanLoc = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dBase_dSource_dSpan_spanFile = dtb__58; f_Vuna_dCompiler_dBase_dSource_dSpan_spanStartLine = dtb__59; f_Vuna_dCompiler_dBase_dSource_dSpan_spanStartCol = dtb__60; f_Vuna_dCompiler_dBase_dSource_dSpan_spanEndLine = dtb__61; f_Vuna_dCompiler_dBase_dSource_dSpan_spanEndCol = dtb__62; f_Vuna_dCompiler_dBase_dSource_dSpan_spanStartOffset = dtb__63; f_Vuna_dCompiler_dBase_dSource_dSpan_spanEndOffset = dtb__64 } -> (String.concat "" [dtb__58; ":"; (bi_strFromInt dtb__59); ":"; (bi_strFromInt dtb__60)])
  | _ -> failwith "DT: impossible branch"
))

# 94 "Vuna/Compiler/Base/Source.vuna"
let rec v_Vuna_dCompiler_dBase_dSource_dmemChar = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__65, dtb__66) -> (if (dtb__65 = mc0) then true else ((v_Vuna_dCompiler_dBase_dSource_dmemChar mc0) dtb__66))
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 99 "Vuna/Compiler/Base/Source.vuna"
let v_Vuna_dCompiler_dBase_dSource_dcontainsDot = (fun s -> ((v_Vuna_dCompiler_dBase_dSource_dmemChar 46) (Base_dList.dtp_unpack s)))

# 111 "Vuna/Compiler/Base/Source.vuna"
let rec v_Vuna_dCompiler_dBase_dSource_dsplitCharsOn = (fun mc0 mc1 mc2 mc3 -> (match mc1 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__67, dtb__68) -> (if (dtb__67 = mc0) then ((((v_Vuna_dCompiler_dBase_dSource_dsplitCharsOn mc0) dtb__68) (Base_dList.C_Base_dList_dList__x58__x58_ ((Base_dList.dtp_pack (Base_dList.v_Base_dList_dreverse mc3)), mc2))) Base_dList.C_Base_dList_dList_Nil) else ((((v_Vuna_dCompiler_dBase_dSource_dsplitCharsOn mc0) dtb__68) mc2) (Base_dList.C_Base_dList_dList__x58__x58_ (dtb__67, mc3))))
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dList.v_Base_dList_dreverse (Base_dList.C_Base_dList_dList__x58__x58_ ((Base_dList.dtp_pack (Base_dList.v_Base_dList_dreverse mc3)), mc2)))
  | _ -> failwith "DT: impossible branch"
))

# 107 "Vuna/Compiler/Base/Source.vuna"
let v_Vuna_dCompiler_dBase_dSource_dsplitOnChar = (fun sep s -> ((((v_Vuna_dCompiler_dBase_dSource_dsplitCharsOn sep) (Base_dList.dtp_unpack s)) Base_dList.C_Base_dList_dList_Nil) Base_dList.C_Base_dList_dList_Nil))

# 118 "Vuna/Compiler/Base/Source.vuna"
let rec v_Vuna_dCompiler_dBase_dSource_dsplitCharsOnDot = (fun mc0 mc1 mc2 -> (match mc0 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__69, dtb__70) -> (if (dtb__69 = 46) then (((v_Vuna_dCompiler_dBase_dSource_dsplitCharsOnDot dtb__70) (Base_dList.C_Base_dList_dList__x58__x58_ ((Base_dList.dtp_pack (Base_dList.v_Base_dList_dreverse mc2)), mc1))) Base_dList.C_Base_dList_dList_Nil) else (((v_Vuna_dCompiler_dBase_dSource_dsplitCharsOnDot dtb__70) mc1) (Base_dList.C_Base_dList_dList__x58__x58_ (dtb__69, mc2))))
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dList.v_Base_dList_dreverse (Base_dList.C_Base_dList_dList__x58__x58_ ((Base_dList.dtp_pack (Base_dList.v_Base_dList_dreverse mc2)), mc1)))
  | _ -> failwith "DT: impossible branch"
))

# 103 "Vuna/Compiler/Base/Source.vuna"
let v_Vuna_dCompiler_dBase_dSource_dsplitOnDot = (fun s -> (((v_Vuna_dCompiler_dBase_dSource_dsplitCharsOnDot (Base_dList.dtp_unpack s)) Base_dList.C_Base_dList_dList_Nil) Base_dList.C_Base_dList_dList_Nil))

# 126 "Vuna/Compiler/Base/Source.vuna"
let v_Vuna_dCompiler_dBase_dSource_dsplitLastDot = (fun parts -> (match (Base_dList.v_Base_dList_dreverse parts) with
  | Base_dList.C_Base_dList_dList_Nil -> { Base_dPair.f_Base_dPair_dPair_first = Base_dList.C_Base_dList_dList_Nil; Base_dPair.f_Base_dPair_dPair_second = "" }
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__71, dtb__72) -> { Base_dPair.f_Base_dPair_dPair_first = (Base_dList.v_Base_dList_dreverse dtb__72); Base_dPair.f_Base_dPair_dPair_second = dtb__71 }
  | _ -> failwith "DT: impossible branch"
))

# 132 "Vuna/Compiler/Base/Source.vuna"
let rec v_Vuna_dCompiler_dBase_dSource_djoinDots = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__73, dtb__74) -> (match dtb__74 with
  | Base_dList.C_Base_dList_dList_Nil -> dtb__73
  | _ -> (String.concat "" [dtb__73; "."; (v_Vuna_dCompiler_dBase_dSource_djoinDots dtb__74)])
)
  | Base_dList.C_Base_dList_dList_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))

# 140 "Vuna/Compiler/Base/Source.vuna"
let v_Vuna_dCompiler_dBase_dSource_dlastSeg = (fun name -> (Base_dPair.v_Base_dPair_dsecondOf (v_Vuna_dCompiler_dBase_dSource_dsplitLastDot (v_Vuna_dCompiler_dBase_dSource_dsplitOnDot name))))

# 144 "Vuna/Compiler/Base/Source.vuna"
let v_Vuna_dCompiler_dBase_dSource_dprefixOfName = (fun name -> (match (v_Vuna_dCompiler_dBase_dSource_dsplitLastDot (v_Vuna_dCompiler_dBase_dSource_dsplitOnDot name)) with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__75; Base_dPair.f_Base_dPair_dPair_second = dtb__76 } -> (v_Vuna_dCompiler_dBase_dSource_djoinDots dtb__75)
  | _ -> failwith "DT: impossible branch"
))

# 149 "Vuna/Compiler/Base/Source.vuna"
let rec v_Vuna_dCompiler_dBase_dSource_djoinSlashes = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__77, dtb__78) -> (match dtb__78 with
  | Base_dList.C_Base_dList_dList_Nil -> dtb__77
  | _ -> (String.concat "" [dtb__77; "/"; (v_Vuna_dCompiler_dBase_dSource_djoinSlashes dtb__78)])
)
  | Base_dList.C_Base_dList_dList_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))

# 155 "Vuna/Compiler/Base/Source.vuna"
let rec v_Vuna_dCompiler_dBase_dSource_djoinArrows = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__79, dtb__80) -> (match dtb__80 with
  | Base_dList.C_Base_dList_dList_Nil -> dtb__79
  | _ -> (String.concat "" [dtb__79; " -> "; (v_Vuna_dCompiler_dBase_dSource_djoinArrows dtb__80)])
)
  | Base_dList.C_Base_dList_dList_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))

# 166 "Vuna/Compiler/Base/Source.vuna"
let rec v_Vuna_dCompiler_dBase_dSource_dsplitPathChars = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__81, dtb__82) -> (if (dtb__81 = 47) then { Base_dPair.f_Base_dPair_dPair_first = (Base_dList.dtp_pack (Base_dList.v_Base_dList_dreverse mc1)); Base_dPair.f_Base_dPair_dPair_second = (Base_dList.dtp_pack dtb__82) } else ((v_Vuna_dCompiler_dBase_dSource_dsplitPathChars dtb__82) (Base_dList.C_Base_dList_dList__x58__x58_ (dtb__81, mc1))))
  | Base_dList.C_Base_dList_dList_Nil -> ((fun chars -> { Base_dPair.f_Base_dPair_dPair_first = ""; Base_dPair.f_Base_dPair_dPair_second = (Base_dList.dtp_pack chars) }) (Base_dList.v_Base_dList_dreverse mc1))
  | _ -> failwith "DT: impossible branch"
))

# 162 "Vuna/Compiler/Base/Source.vuna"
let v_Vuna_dCompiler_dBase_dSource_dsplitPath = (fun path -> ((v_Vuna_dCompiler_dBase_dSource_dsplitPathChars (Base_dList.dtp_unpack path)) Base_dList.C_Base_dList_dList_Nil))

# 175 "Vuna/Compiler/Base/Source.vuna"
let v_Vuna_dCompiler_dBase_dSource_dbaseName = (fun path -> (Base_dPair.v_Base_dPair_dsecondOf (v_Vuna_dCompiler_dBase_dSource_dsplitPath path)))

# 193 "Vuna/Compiler/Base/Source.vuna"
let rec v_Vuna_dCompiler_dBase_dSource_ddropPastSlash = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__83, dtb__84) -> (if (dtb__83 = 47) then dtb__84 else (v_Vuna_dCompiler_dBase_dSource_ddropPastSlash dtb__84))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 180 "Vuna/Compiler/Base/Source.vuna"
let v_Vuna_dCompiler_dBase_dSource_dparentOfPath = (fun path -> ((fun chars -> ((fun rev -> ((fun after -> (if ((Base_dList.v_Base_dList_dlength after) = (Base_dList.v_Base_dList_dlength rev)) then "." else ((fun parent -> (if (parent = "") then (if ((Base_dString.v_Base_dString_dstartsWith "/") path) then "/" else ".") else (if (if ((Base_dString.v_Base_dString_dstartsWith "/") path) then (Base_dBool.v_Base_dBool_dnot ((Base_dString.v_Base_dString_dstartsWith "/") parent)) else false) then ("/" ^ parent) else parent))) (Base_dList.dtp_pack (Base_dList.v_Base_dList_dreverse after))))) (v_Vuna_dCompiler_dBase_dSource_ddropPastSlash rev))) (Base_dList.v_Base_dList_dreverse chars))) (Base_dList.dtp_unpack path)))

# 217 "Vuna/Compiler/Base/Source.vuna"
let rec v_Vuna_dCompiler_dBase_dSource_dprefixLen2 = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__85, dtb__86) -> (match mc1 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__87, dtb__88) -> (if (dtb__85 = dtb__87) then (1 + ((v_Vuna_dCompiler_dBase_dSource_dprefixLen2 dtb__86) dtb__88)) else 0)
  | Base_dList.C_Base_dList_dList_Nil -> 0
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))

# 223 "Vuna/Compiler/Base/Source.vuna"
let v_Vuna_dCompiler_dBase_dSource_dlengthDiffLE = (fun la lb n -> (if (la >= lb) then ((la - lb) <= n) else ((lb - la) <= n)))

# 205 "Vuna/Compiler/Base/Source.vuna"
let v_Vuna_dCompiler_dBase_dSource_d_usimilarName = (fun a b -> (if (a = b) then false else (if ((Base_dString.v_Base_dString_dstartsWith a) b) then true else (if ((Base_dString.v_Base_dString_dstartsWith b) a) then true else ((fun la -> ((fun lb -> (if (((v_Vuna_dCompiler_dBase_dSource_dlengthDiffLE (Base_dList.v_Base_dList_dlength la)) (Base_dList.v_Base_dList_dlength lb)) 2) then (((v_Vuna_dCompiler_dBase_dSource_dprefixLen2 la) lb) >= 2) else false)) (Base_dList.dtp_unpack b))) (Base_dList.dtp_unpack a))))))

# 198 "Vuna/Compiler/Base/Source.vuna"
let rec v_Vuna_dCompiler_dBase_dSource_dsuggest = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__89, dtb__90) -> (if ((v_Vuna_dCompiler_dBase_dSource_d_usimilarName mc0) dtb__89) then (String.concat "" [" (did you mean "; dtb__89; "?)"]) else ((v_Vuna_dCompiler_dBase_dSource_dsuggest mc0) dtb__90))
  | Base_dList.C_Base_dList_dList_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))
