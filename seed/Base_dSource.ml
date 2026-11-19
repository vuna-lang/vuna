open Vuna_runtime
type t_Pos = { f_Pos_posLine : int; f_Pos_posCol : int; f_Pos_posOffset : int; f_Pos_posEndOffset : int }
and t_Span = { f_Span_spanFile : string; f_Span_spanStartLine : int; f_Span_spanStartCol : int; f_Span_spanEndLine : int; f_Span_spanEndCol : int; f_Span_spanStartOffset : int; f_Span_spanEndOffset : int }

# 46 "Vuna/Compiler/Base/Source.vuna"
let v_posLine = (fun (mc0 : t_Pos) -> (match mc0 with
  | { f_Pos_posLine = dtb__0; f_Pos_posCol = dtb__1; f_Pos_posOffset = dtb__2; f_Pos_posEndOffset = dtb__3 } -> dtb__0
  | _ -> failwith "DT: impossible branch"
))

# 50 "Vuna/Compiler/Base/Source.vuna"
let v_posCol = (fun (mc0 : t_Pos) -> (match mc0 with
  | { f_Pos_posLine = dtb__4; f_Pos_posCol = dtb__5; f_Pos_posOffset = dtb__6; f_Pos_posEndOffset = dtb__7 } -> dtb__5
  | _ -> failwith "DT: impossible branch"
))

# 54 "Vuna/Compiler/Base/Source.vuna"
let v_posOffset = (fun (mc0 : t_Pos) -> (match mc0 with
  | { f_Pos_posLine = dtb__8; f_Pos_posCol = dtb__9; f_Pos_posOffset = dtb__10; f_Pos_posEndOffset = dtb__11 } -> dtb__10
  | _ -> failwith "DT: impossible branch"
))

# 58 "Vuna/Compiler/Base/Source.vuna"
let v_posEndOffset = (fun (mc0 : t_Pos) -> (match mc0 with
  | { f_Pos_posLine = dtb__12; f_Pos_posCol = dtb__13; f_Pos_posOffset = dtb__14; f_Pos_posEndOffset = dtb__15 } -> dtb__15
  | _ -> failwith "DT: impossible branch"
))

# 62 "Vuna/Compiler/Base/Source.vuna"
let v_spanStartLine = (fun (mc0 : t_Span) -> (match mc0 with
  | { f_Span_spanFile = dtb__16; f_Span_spanStartLine = dtb__17; f_Span_spanStartCol = dtb__18; f_Span_spanEndLine = dtb__19; f_Span_spanEndCol = dtb__20; f_Span_spanStartOffset = dtb__21; f_Span_spanEndOffset = dtb__22 } -> dtb__17
  | _ -> failwith "DT: impossible branch"
))

# 66 "Vuna/Compiler/Base/Source.vuna"
let v_spanStartCol = (fun (mc0 : t_Span) -> (match mc0 with
  | { f_Span_spanFile = dtb__23; f_Span_spanStartLine = dtb__24; f_Span_spanStartCol = dtb__25; f_Span_spanEndLine = dtb__26; f_Span_spanEndCol = dtb__27; f_Span_spanStartOffset = dtb__28; f_Span_spanEndOffset = dtb__29 } -> dtb__25
  | _ -> failwith "DT: impossible branch"
))

# 70 "Vuna/Compiler/Base/Source.vuna"
let v_spanEndLine = (fun (mc0 : t_Span) -> (match mc0 with
  | { f_Span_spanFile = dtb__30; f_Span_spanStartLine = dtb__31; f_Span_spanStartCol = dtb__32; f_Span_spanEndLine = dtb__33; f_Span_spanEndCol = dtb__34; f_Span_spanStartOffset = dtb__35; f_Span_spanEndOffset = dtb__36 } -> dtb__33
  | _ -> failwith "DT: impossible branch"
))

# 74 "Vuna/Compiler/Base/Source.vuna"
let v_spanEndCol = (fun (mc0 : t_Span) -> (match mc0 with
  | { f_Span_spanFile = dtb__37; f_Span_spanStartLine = dtb__38; f_Span_spanStartCol = dtb__39; f_Span_spanEndLine = dtb__40; f_Span_spanEndCol = dtb__41; f_Span_spanStartOffset = dtb__42; f_Span_spanEndOffset = dtb__43 } -> dtb__41
  | _ -> failwith "DT: impossible branch"
))

# 78 "Vuna/Compiler/Base/Source.vuna"
let v_spanStartOffset = (fun (mc0 : t_Span) -> (match mc0 with
  | { f_Span_spanFile = dtb__44; f_Span_spanStartLine = dtb__45; f_Span_spanStartCol = dtb__46; f_Span_spanEndLine = dtb__47; f_Span_spanEndCol = dtb__48; f_Span_spanStartOffset = dtb__49; f_Span_spanEndOffset = dtb__50 } -> dtb__49
  | _ -> failwith "DT: impossible branch"
))

# 82 "Vuna/Compiler/Base/Source.vuna"
let v_spanEndOffset = (fun (mc0 : t_Span) -> (match mc0 with
  | { f_Span_spanFile = dtb__51; f_Span_spanStartLine = dtb__52; f_Span_spanStartCol = dtb__53; f_Span_spanEndLine = dtb__54; f_Span_spanEndCol = dtb__55; f_Span_spanStartOffset = dtb__56; f_Span_spanEndOffset = dtb__57 } -> dtb__57
  | _ -> failwith "DT: impossible branch"
))

# 86 "Vuna/Compiler/Base/Source.vuna"
let v_spanFile = (fun (mc0 : t_Span) -> (match mc0 with
  | { f_Span_spanFile = dtb__58; f_Span_spanStartLine = dtb__59; f_Span_spanStartCol = dtb__60; f_Span_spanEndLine = dtb__61; f_Span_spanEndCol = dtb__62; f_Span_spanStartOffset = dtb__63; f_Span_spanEndOffset = dtb__64 } -> dtb__58
  | _ -> failwith "DT: impossible branch"
))

# 90 "Vuna/Compiler/Base/Source.vuna"
let v_showSpanLoc = (fun (mc0 : t_Span) -> (match mc0 with
  | { f_Span_spanFile = dtb__65; f_Span_spanStartLine = dtb__66; f_Span_spanStartCol = dtb__67; f_Span_spanEndLine = dtb__68; f_Span_spanEndCol = dtb__69; f_Span_spanStartOffset = dtb__70; f_Span_spanEndOffset = dtb__71 } -> (String.concat "" [dtb__65; ":"; (bi_strFromInt dtb__66); ":"; (bi_strFromInt dtb__67)])
  | _ -> failwith "DT: impossible branch"
))

# 94 "Vuna/Compiler/Base/Source.vuna"
let v_spanEmpty = { f_Span_spanFile = ""; f_Span_spanStartLine = 0; f_Span_spanStartCol = 0; f_Span_spanEndLine = 0; f_Span_spanEndCol = 0; f_Span_spanStartOffset = 0; f_Span_spanEndOffset = 0 }

# 98 "Vuna/Compiler/Base/Source.vuna"
let v_isSpanEmpty = (fun (sp : t_Span) -> ((v_spanStartLine sp) = 0))

# 105 "Vuna/Compiler/Base/Source.vuna"
let v_spanAtName = (fun (name : string) (sp : t_Span) -> (if (v_isSpanEmpty sp) then sp else (if ((v_spanStartOffset sp) <> (v_spanEndOffset sp)) then v_spanEmpty else { f_Span_spanFile = (v_spanFile sp); f_Span_spanStartLine = (v_spanStartLine sp); f_Span_spanStartCol = (v_spanStartCol sp); f_Span_spanEndLine = (v_spanStartLine sp); f_Span_spanEndCol = ((v_spanStartCol sp) + (bi_strLength name)); f_Span_spanStartOffset = (v_spanStartOffset sp); f_Span_spanEndOffset = ((v_spanStartOffset sp) + (bi_strLength name)) })))

# 122 "Vuna/Compiler/Base/Source.vuna"
let rec v_memChar = (fun (mc0 : int) (mc1 : int B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__72, dtb__73) -> (if (dtb__72 = mc0) then true else ((v_memChar mc0) dtb__73))
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 128 "Vuna/Compiler/Base/Source.vuna"
let rec v_scanFor = (fun (c : int) (s : string) (i : int) (n : int) (fuel : int) -> (if (fuel <= 0) then false else (if (i >= n) then false else (if (((dtp_strAt s) i) = c) then true else (((((v_scanFor c) s) (i + 1)) n) (fuel - 1))))))

# 135 "Vuna/Compiler/Base/Source.vuna"
let v_containsDot = (fun (s : string) -> (((((v_scanFor 46) s) 0) (bi_strLength s)) (bi_strLength s)))

# 148 "Vuna/Compiler/Base/Source.vuna"
let rec v_splitOnCharGo = (fun (sep : int) (s : string) (start : int) (i : int) (n : int) (fuel : int) (acc : string B_dData_dList.t_List) -> (if (fuel <= 0) then (B_dData_dList.v_reverse (B_dData_dList.C_List__x58__x58_ ((((dtp_substring start) (n - start)) s), acc))) else (if (i >= n) then (B_dData_dList.v_reverse (B_dData_dList.C_List__x58__x58_ ((((dtp_substring start) (i - start)) s), acc))) else (if (((dtp_strAt s) i) = sep) then (((((((v_splitOnCharGo sep) s) (i + 1)) (i + 1)) n) (fuel - 1)) (B_dData_dList.C_List__x58__x58_ ((((dtp_substring start) (i - start)) s), acc))) else (((((((v_splitOnCharGo sep) s) start) (i + 1)) n) (fuel - 1)) acc)))))

# 143 "Vuna/Compiler/Base/Source.vuna"
let v_splitOnChar = (fun (sep : int) (s : string) -> (((((((v_splitOnCharGo sep) s) 0) 0) (bi_strLength s)) ((bi_strLength s) + 1)) B_dData_dList.C_List_Nil))

# 139 "Vuna/Compiler/Base/Source.vuna"
let v_splitOnDot = (fun (s : string) -> ((v_splitOnChar 46) s))

# 161 "Vuna/Compiler/Base/Source.vuna"
let v_splitLastDot = (fun (parts : string B_dData_dList.t_List) -> (match (B_dData_dList.v_reverse parts) with
  | B_dData_dList.C_List_Nil -> { B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = "" }
  | B_dData_dList.C_List__x58__x58_ (dtb__74, dtb__75) -> { B_dData_dPair.f_Pair_first = (B_dData_dList.v_reverse dtb__75); B_dData_dPair.f_Pair_second = dtb__74 }
  | _ -> failwith "DT: impossible branch"
))

# 176 "Vuna/Compiler/Base/Source.vuna"
let rec v_dotsRest = (fun (mc0 : string B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__76, dtb__77) -> (B_dData_dList.C_List__x58__x58_ (".", (B_dData_dList.C_List__x58__x58_ (dtb__76, (v_dotsRest dtb__77)))))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 172 "Vuna/Compiler/Base/Source.vuna"
let v_joinDotsParts = (fun (mc0 : string B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__78, dtb__79) -> (B_dData_dList.C_List__x58__x58_ (dtb__78, (v_dotsRest dtb__79)))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 168 "Vuna/Compiler/Base/Source.vuna"
let v_joinDots = (fun (xs : string B_dData_dList.t_List) -> (B_dData_dList.dtp_concatMany (v_joinDotsParts xs)))

# 187 "Vuna/Compiler/Base/Source.vuna"
let rec v_lastSegGo = (fun (name : string) (i : int) (fuel : int) -> (if (fuel <= 0) then (((dtp_substring (i + 1)) (((bi_strLength name) - i) - 1)) name) else (if (i < 0) then name else (if (((dtp_strAt name) i) = 46) then (((dtp_substring (i + 1)) (((bi_strLength name) - i) - 1)) name) else (((v_lastSegGo name) (i - 1)) (fuel - 1))))))

# 184 "Vuna/Compiler/Base/Source.vuna"
let v_lastSeg = (fun (name : string) -> (((v_lastSegGo name) ((bi_strLength name) - 1)) ((bi_strLength name) + 1)))

# 199 "Vuna/Compiler/Base/Source.vuna"
let v_prefixOfName = (fun (name : string) -> (match (v_splitLastDot (v_splitOnDot name)) with
  | { B_dData_dPair.f_Pair_first = dtb__80; B_dData_dPair.f_Pair_second = dtb__81 } -> (v_joinDots dtb__80)
  | _ -> failwith "DT: impossible branch"
))

# 205 "Vuna/Compiler/Base/Source.vuna"
let rec v_joinSlashes = (fun (mc0 : string B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__82, dtb__83) -> (match dtb__83 with
  | B_dData_dList.C_List_Nil -> dtb__82
  | _ -> (String.concat "" [dtb__82; "/"; (v_joinSlashes dtb__83)])
)
  | B_dData_dList.C_List_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))

# 211 "Vuna/Compiler/Base/Source.vuna"
let rec v_joinArrows = (fun (mc0 : string B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__84, dtb__85) -> (match dtb__85 with
  | B_dData_dList.C_List_Nil -> dtb__84
  | _ -> (String.concat "" [dtb__84; " -> "; (v_joinArrows dtb__85)])
)
  | B_dData_dList.C_List_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))

# 222 "Vuna/Compiler/Base/Source.vuna"
let rec v_splitPathChars = (fun (mc0 : int B_dData_dList.t_List) (mc1 : int B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__86, dtb__87) -> (if (dtb__86 = 47) then { B_dData_dPair.f_Pair_first = (B_dData_dList.dtp_pack (B_dData_dList.v_reverse mc1)); B_dData_dPair.f_Pair_second = (B_dData_dList.dtp_pack dtb__87) } else ((v_splitPathChars dtb__87) (B_dData_dList.C_List__x58__x58_ (dtb__86, mc1))))
  | B_dData_dList.C_List_Nil -> ((fun chars -> { B_dData_dPair.f_Pair_first = ""; B_dData_dPair.f_Pair_second = (B_dData_dList.dtp_pack chars) }) (B_dData_dList.v_reverse mc1))
  | _ -> failwith "DT: impossible branch"
))

# 218 "Vuna/Compiler/Base/Source.vuna"
let v_splitPath = (fun (path : string) -> ((v_splitPathChars (B_dData_dList.dtp_unpack path)) B_dData_dList.C_List_Nil))

# 231 "Vuna/Compiler/Base/Source.vuna"
let v_baseName = (fun (path : string) -> (B_dData_dPair.v_secondOf (v_splitPath path)))

# 249 "Vuna/Compiler/Base/Source.vuna"
let rec v_dropPastSlash = (fun (mc0 : int B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__88, dtb__89) -> (if (dtb__88 = 47) then dtb__89 else (v_dropPastSlash dtb__89))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 236 "Vuna/Compiler/Base/Source.vuna"
let v_parentOfPath = (fun (path : string) -> ((fun chars -> ((fun rev -> ((fun after -> (if ((B_dData_dList.v_length after) = (B_dData_dList.v_length rev)) then "." else ((fun parent -> (if (parent = "") then (if ((B_dData_dString.v_startsWith "/") path) then "/" else ".") else (if (if ((B_dData_dString.v_startsWith "/") path) then (B_dData_dBool.v_not ((B_dData_dString.v_startsWith "/") parent)) else false) then ("/" ^ parent) else parent))) (B_dData_dList.dtp_pack (B_dData_dList.v_reverse after))))) (v_dropPastSlash rev))) (B_dData_dList.v_reverse chars))) (B_dData_dList.dtp_unpack path)))

# 277 "Vuna/Compiler/Base/Source.vuna"
let rec v_prefixLen2 = (fun (mc0 : int B_dData_dList.t_List) (mc1 : int B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__90, dtb__91) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__92, dtb__93) -> (if (dtb__90 = dtb__92) then (1 + ((v_prefixLen2 dtb__91) dtb__93)) else 0)
  | B_dData_dList.C_List_Nil -> 0
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))

# 283 "Vuna/Compiler/Base/Source.vuna"
let v_lengthDiffLE = (fun (la : int) (lb : int) (n : int) -> (if (la >= lb) then ((la - lb) <= n) else ((lb - la) <= n)))

# 261 "Vuna/Compiler/Base/Source.vuna"
let v__usimilarName = (fun (a : string) (b : string) -> (if (a = b) then false else (if ((B_dData_dString.v_startsWith a) b) then true else (if ((B_dData_dString.v_startsWith b) a) then true else ((fun la -> ((fun lb -> (if (((v_lengthDiffLE (B_dData_dList.v_length la)) (B_dData_dList.v_length lb)) 2) then (((v_prefixLen2 la) lb) >= 2) else false)) (B_dData_dList.dtp_unpack b))) (B_dData_dList.dtp_unpack a))))))

# 254 "Vuna/Compiler/Base/Source.vuna"
let rec v_suggest = (fun (mc0 : string) (mc1 : string B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__94, dtb__95) -> (if ((v__usimilarName mc0) dtb__94) then (String.concat "" [" (did you mean "; dtb__94; "?)"]) else ((v_suggest mc0) dtb__95))
  | B_dData_dList.C_List_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))
