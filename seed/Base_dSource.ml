open Vuna_runtime
type t_Pos = { f_Pos_posLine : int; f_Pos_posCol : int; f_Pos_posOffset : int; f_Pos_posEndOffset : int }
and t_Span = { f_Span_spanFile : string; f_Span_spanStartLine : int; f_Span_spanStartCol : int; f_Span_spanEndLine : int; f_Span_spanEndCol : int; f_Span_spanStartOffset : int; f_Span_spanEndOffset : int }

# 46 "Vuna/Compiler/Base/Source.vuna"
let v_showSpanLoc = (fun (mc0 : t_Span) -> (match mc0 with
  | { f_Span_spanFile = dtb__0; f_Span_spanStartLine = dtb__1; f_Span_spanStartCol = dtb__2; f_Span_spanEndLine = dtb__3; f_Span_spanEndCol = dtb__4; f_Span_spanStartOffset = dtb__5; f_Span_spanEndOffset = dtb__6 } -> (String.concat "" [dtb__0; ":"; (string_of_int dtb__1); ":"; (string_of_int dtb__2)])
  | _ -> failwith "DT: impossible branch"
))

# 50 "Vuna/Compiler/Base/Source.vuna"
let v_spanEmpty = { f_Span_spanFile = ""; f_Span_spanStartLine = 0; f_Span_spanStartCol = 0; f_Span_spanEndLine = 0; f_Span_spanEndCol = 0; f_Span_spanStartOffset = 0; f_Span_spanEndOffset = 0 }

# 76 "Vuna/Compiler/Base/Source.vuna"
let rec v_memChar = (fun (mc0 : int) (mc1 : int B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__7, dtb__8) -> (if (dtb__7 = mc0) then true else ((v_memChar mc0) dtb__8))
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 82 "Vuna/Compiler/Base/Source.vuna"
let rec v_scanFor = (fun (c : int) (s : string) (i : int) (n : int) (fuel : int) -> (if (fuel <= 0) then false else (if (i >= n) then false else (if ((let b = s in let k = i in if k < 0 || k >= String.length b then -1 else Char.code (String.unsafe_get b k)) = c) then true else (((((v_scanFor c) s) (i + 1)) n) (fuel - 1))))))

# 89 "Vuna/Compiler/Base/Source.vuna"
let v_containsDot = (fun (s : string) -> (((((v_scanFor 46) s) 0) (String.length s)) (String.length s)))

# 102 "Vuna/Compiler/Base/Source.vuna"
let rec v_splitOnCharGo = (fun (sep : int) (s : string) (start : int) (i : int) (n : int) (fuel : int) (acc : string B_dData_dList.t_List) -> (if (fuel <= 0) then (B_dData_dList.v_reverse (B_dData_dList.C_List__x58__x58_ ((((dtp_substring start) (n - start)) s), acc))) else (if (i >= n) then (B_dData_dList.v_reverse (B_dData_dList.C_List__x58__x58_ ((((dtp_substring start) (i - start)) s), acc))) else (if ((let b = s in let k = i in if k < 0 || k >= String.length b then -1 else Char.code (String.unsafe_get b k)) = sep) then (((((((v_splitOnCharGo sep) s) (i + 1)) (i + 1)) n) (fuel - 1)) (B_dData_dList.C_List__x58__x58_ ((((dtp_substring start) (i - start)) s), acc))) else (((((((v_splitOnCharGo sep) s) start) (i + 1)) n) (fuel - 1)) acc)))))

# 97 "Vuna/Compiler/Base/Source.vuna"
let v_splitOnChar = (fun (sep : int) (s : string) -> (((((((v_splitOnCharGo sep) s) 0) 0) (String.length s)) ((String.length s) + 1)) B_dData_dList.C_List_Nil))

# 93 "Vuna/Compiler/Base/Source.vuna"
let v_splitOnDot = (fun (s : string) -> ((v_splitOnChar 46) s))

# 115 "Vuna/Compiler/Base/Source.vuna"
let v_splitLastDot = (fun (parts : string B_dData_dList.t_List) -> (match (B_dData_dList.v_reverse parts) with
  | B_dData_dList.C_List_Nil -> { B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = "" }
  | B_dData_dList.C_List__x58__x58_ (dtb__9, dtb__10) -> { B_dData_dPair.f_Pair_first = (B_dData_dList.v_reverse dtb__10); B_dData_dPair.f_Pair_second = dtb__9 }
  | _ -> failwith "DT: impossible branch"
))

# 130 "Vuna/Compiler/Base/Source.vuna"
let[@tail_mod_cons] rec v_dotsRest = (fun (mc0 : string B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__11, dtb__12) -> (B_dData_dList.C_List__x58__x58_ (".", (B_dData_dList.C_List__x58__x58_ (dtb__11, (v_dotsRest dtb__12)))))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 126 "Vuna/Compiler/Base/Source.vuna"
let v_joinDotsParts = (fun (mc0 : string B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__13, dtb__14) -> (B_dData_dList.C_List__x58__x58_ (dtb__13, (v_dotsRest dtb__14)))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 122 "Vuna/Compiler/Base/Source.vuna"
let v_joinDots = (fun (xs : string B_dData_dList.t_List) -> (B_dData_dList.dtp_concatMany (v_joinDotsParts xs)))

# 141 "Vuna/Compiler/Base/Source.vuna"
let rec v_lastSegGo = (fun (name : string) (i : int) (fuel : int) -> (if (fuel <= 0) then (((dtp_substring (i + 1)) (((String.length name) - i) - 1)) name) else (if (i < 0) then name else (if ((let b = name in let k = i in if k < 0 || k >= String.length b then -1 else Char.code (String.unsafe_get b k)) = 46) then (((dtp_substring (i + 1)) (((String.length name) - i) - 1)) name) else (((v_lastSegGo name) (i - 1)) (fuel - 1))))))

# 138 "Vuna/Compiler/Base/Source.vuna"
let v_lastSeg = (fun (name : string) -> (((v_lastSegGo name) ((String.length name) - 1)) ((String.length name) + 1)))

# 153 "Vuna/Compiler/Base/Source.vuna"
let v_prefixOfName = (fun (name : string) -> (match (v_splitLastDot (v_splitOnDot name)) with
  | { B_dData_dPair.f_Pair_first = dtb__15; B_dData_dPair.f_Pair_second = dtb__16 } -> (v_joinDots dtb__15)
  | _ -> failwith "DT: impossible branch"
))

# 159 "Vuna/Compiler/Base/Source.vuna"
let rec v_joinSlashes = (fun (mc0 : string B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__17, dtb__18) -> (match dtb__18 with
  | B_dData_dList.C_List_Nil -> dtb__17
  | _ -> (String.concat "" [dtb__17; "/"; (v_joinSlashes dtb__18)])
)
  | B_dData_dList.C_List_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))

# 165 "Vuna/Compiler/Base/Source.vuna"
let rec v_joinArrows = (fun (mc0 : string B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__19, dtb__20) -> (match dtb__20 with
  | B_dData_dList.C_List_Nil -> dtb__19
  | _ -> (String.concat "" [dtb__19; " -> "; (v_joinArrows dtb__20)])
)
  | B_dData_dList.C_List_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))

# 176 "Vuna/Compiler/Base/Source.vuna"
let rec v_splitPathChars = (fun (mc0 : int B_dData_dList.t_List) (mc1 : int B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__21, dtb__22) -> (if (dtb__21 = 47) then { B_dData_dPair.f_Pair_first = (B_dData_dList.dtp_pack (B_dData_dList.v_reverse mc1)); B_dData_dPair.f_Pair_second = (B_dData_dList.dtp_pack dtb__22) } else ((v_splitPathChars dtb__22) (B_dData_dList.C_List__x58__x58_ (dtb__21, mc1))))
  | B_dData_dList.C_List_Nil -> (let chars = (B_dData_dList.v_reverse mc1) in { B_dData_dPair.f_Pair_first = ""; B_dData_dPair.f_Pair_second = (B_dData_dList.dtp_pack chars) })
  | _ -> failwith "DT: impossible branch"
))

# 172 "Vuna/Compiler/Base/Source.vuna"
let v_splitPath = (fun (path : string) -> ((v_splitPathChars (B_dData_dList.dtp_unpack path)) B_dData_dList.C_List_Nil))

# 185 "Vuna/Compiler/Base/Source.vuna"
let v_baseName = (fun (path : string) -> (B_dData_dPair.v_secondOf (v_splitPath path)))

# 203 "Vuna/Compiler/Base/Source.vuna"
let rec v_dropPastSlash = (fun (mc0 : int B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__23, dtb__24) -> (if (dtb__23 = 47) then dtb__24 else (v_dropPastSlash dtb__24))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 190 "Vuna/Compiler/Base/Source.vuna"
let v_parentOfPath = (fun (path : string) -> (let chars = (B_dData_dList.dtp_unpack path) in (let rev = (B_dData_dList.v_reverse chars) in (let after = (v_dropPastSlash rev) in (if ((B_dData_dList.v_length after) = (B_dData_dList.v_length rev)) then "." else (let parent = (B_dData_dList.dtp_pack (B_dData_dList.v_reverse after)) in (if (parent = "") then (if ((B_dData_dString.v_startsWith "/") path) then "/" else ".") else (if (if ((B_dData_dString.v_startsWith "/") path) then (B_dData_dBool.v_not ((B_dData_dString.v_startsWith "/") parent)) else false) then ("/" ^ parent) else parent))))))))

# 212 "Vuna/Compiler/Base/Source.vuna"
let v_stripPathPrefix = (fun (prefix : string) (path : string) -> (if (prefix = "") then path else (if ((B_dData_dString.v_startsWith (prefix ^ "/")) path) then (((dtp_substring (String.length (prefix ^ "/"))) ((String.length path) - (String.length (prefix ^ "/")))) path) else path)))

# 222 "Vuna/Compiler/Base/Source.vuna"
let rec v_stripRootsPath = (fun (mc0 : string B_dData_dList.t_List) (mc1 : string) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__25, dtb__26) -> (if ((B_dData_dString.v_startsWith (dtb__25 ^ "/")) mc1) then ((v_stripPathPrefix dtb__25) mc1) else ((v_stripRootsPath dtb__26) mc1))
  | B_dData_dList.C_List_Nil -> mc1
  | _ -> failwith "DT: impossible branch"
))

# 228 "Vuna/Compiler/Base/Source.vuna"
let v_stripDotSlashPath = (fun (path : string) -> (if ((B_dData_dString.v_startsWith "./") path) then (((dtp_substring 2) ((String.length path) - 2)) path) else path))

# 234 "Vuna/Compiler/Base/Source.vuna"
let v_locationPathUnder = (fun (roots : string B_dData_dList.t_List) (dir : string) (path : string) -> (v_stripDotSlashPath ((v_stripPathPrefix dir) ((v_stripRootsPath roots) path))))

# 262 "Vuna/Compiler/Base/Source.vuna"
let rec v_prefixLen2 = (fun (mc0 : int B_dData_dList.t_List) (mc1 : int B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__27, dtb__28) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__29, dtb__30) -> (if (dtb__27 = dtb__29) then (1 + ((v_prefixLen2 dtb__28) dtb__30)) else 0)
  | B_dData_dList.C_List_Nil -> 0
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))

# 268 "Vuna/Compiler/Base/Source.vuna"
let v_lengthDiffLE = (fun (la : int) (lb : int) (n : int) -> (if (la >= lb) then ((la - lb) <= n) else ((lb - la) <= n)))

# 246 "Vuna/Compiler/Base/Source.vuna"
let v__usimilarName = (fun (a : string) (b : string) -> (if (a = b) then false else (if ((B_dData_dString.v_startsWith a) b) then true else (if ((B_dData_dString.v_startsWith b) a) then true else (let la = (B_dData_dList.dtp_unpack a) in (let lb = (B_dData_dList.dtp_unpack b) in (if (((v_lengthDiffLE (B_dData_dList.v_length la)) (B_dData_dList.v_length lb)) 2) then (((v_prefixLen2 la) lb) >= 2) else false)))))))

# 239 "Vuna/Compiler/Base/Source.vuna"
let rec v_suggest = (fun (mc0 : string) (mc1 : string B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__31, dtb__32) -> (if ((v__usimilarName mc0) dtb__31) then (String.concat "" [" (did you mean "; dtb__31; "?)"]) else ((v_suggest mc0) dtb__32))
  | B_dData_dList.C_List_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))

# 15 "Vuna/Compiler/Base/Source.vuna"
let v_posLine = (fun (p : t_Pos) -> (match p with
  | { f_Pos_posLine = dtb__33; f_Pos_posCol = dtb__34; f_Pos_posOffset = dtb__35; f_Pos_posEndOffset = dtb__36 } -> dtb__33
  | _ -> failwith "DT: impossible branch"
))

# 17 "Vuna/Compiler/Base/Source.vuna"
let v_posCol = (fun (p : t_Pos) -> (match p with
  | { f_Pos_posLine = dtb__37; f_Pos_posCol = dtb__38; f_Pos_posOffset = dtb__39; f_Pos_posEndOffset = dtb__40 } -> dtb__38
  | _ -> failwith "DT: impossible branch"
))

# 19 "Vuna/Compiler/Base/Source.vuna"
let v_posOffset = (fun (p : t_Pos) -> (match p with
  | { f_Pos_posLine = dtb__41; f_Pos_posCol = dtb__42; f_Pos_posOffset = dtb__43; f_Pos_posEndOffset = dtb__44 } -> dtb__43
  | _ -> failwith "DT: impossible branch"
))

# 21 "Vuna/Compiler/Base/Source.vuna"
let v_posEndOffset = (fun (p : t_Pos) -> (match p with
  | { f_Pos_posLine = dtb__45; f_Pos_posCol = dtb__46; f_Pos_posOffset = dtb__47; f_Pos_posEndOffset = dtb__48 } -> dtb__48
  | _ -> failwith "DT: impossible branch"
))

# 30 "Vuna/Compiler/Base/Source.vuna"
let v_spanFile = (fun (p : t_Span) -> (match p with
  | { f_Span_spanFile = dtb__49; f_Span_spanStartLine = dtb__50; f_Span_spanStartCol = dtb__51; f_Span_spanEndLine = dtb__52; f_Span_spanEndCol = dtb__53; f_Span_spanStartOffset = dtb__54; f_Span_spanEndOffset = dtb__55 } -> dtb__49
  | _ -> failwith "DT: impossible branch"
))

# 32 "Vuna/Compiler/Base/Source.vuna"
let v_spanStartLine = (fun (p : t_Span) -> (match p with
  | { f_Span_spanFile = dtb__56; f_Span_spanStartLine = dtb__57; f_Span_spanStartCol = dtb__58; f_Span_spanEndLine = dtb__59; f_Span_spanEndCol = dtb__60; f_Span_spanStartOffset = dtb__61; f_Span_spanEndOffset = dtb__62 } -> dtb__57
  | _ -> failwith "DT: impossible branch"
))

# 54 "Vuna/Compiler/Base/Source.vuna"
let v_isSpanEmpty = (fun (sp : t_Span) -> ((v_spanStartLine sp) = 0))

# 34 "Vuna/Compiler/Base/Source.vuna"
let v_spanStartCol = (fun (p : t_Span) -> (match p with
  | { f_Span_spanFile = dtb__63; f_Span_spanStartLine = dtb__64; f_Span_spanStartCol = dtb__65; f_Span_spanEndLine = dtb__66; f_Span_spanEndCol = dtb__67; f_Span_spanStartOffset = dtb__68; f_Span_spanEndOffset = dtb__69 } -> dtb__65
  | _ -> failwith "DT: impossible branch"
))

# 36 "Vuna/Compiler/Base/Source.vuna"
let v_spanEndLine = (fun (p : t_Span) -> (match p with
  | { f_Span_spanFile = dtb__70; f_Span_spanStartLine = dtb__71; f_Span_spanStartCol = dtb__72; f_Span_spanEndLine = dtb__73; f_Span_spanEndCol = dtb__74; f_Span_spanStartOffset = dtb__75; f_Span_spanEndOffset = dtb__76 } -> dtb__73
  | _ -> failwith "DT: impossible branch"
))

# 38 "Vuna/Compiler/Base/Source.vuna"
let v_spanEndCol = (fun (p : t_Span) -> (match p with
  | { f_Span_spanFile = dtb__77; f_Span_spanStartLine = dtb__78; f_Span_spanStartCol = dtb__79; f_Span_spanEndLine = dtb__80; f_Span_spanEndCol = dtb__81; f_Span_spanStartOffset = dtb__82; f_Span_spanEndOffset = dtb__83 } -> dtb__81
  | _ -> failwith "DT: impossible branch"
))

# 40 "Vuna/Compiler/Base/Source.vuna"
let v_spanStartOffset = (fun (p : t_Span) -> (match p with
  | { f_Span_spanFile = dtb__84; f_Span_spanStartLine = dtb__85; f_Span_spanStartCol = dtb__86; f_Span_spanEndLine = dtb__87; f_Span_spanEndCol = dtb__88; f_Span_spanStartOffset = dtb__89; f_Span_spanEndOffset = dtb__90 } -> dtb__89
  | _ -> failwith "DT: impossible branch"
))

# 42 "Vuna/Compiler/Base/Source.vuna"
let v_spanEndOffset = (fun (p : t_Span) -> (match p with
  | { f_Span_spanFile = dtb__91; f_Span_spanStartLine = dtb__92; f_Span_spanStartCol = dtb__93; f_Span_spanEndLine = dtb__94; f_Span_spanEndCol = dtb__95; f_Span_spanStartOffset = dtb__96; f_Span_spanEndOffset = dtb__97 } -> dtb__97
  | _ -> failwith "DT: impossible branch"
))

# 60 "Vuna/Compiler/Base/Source.vuna"
let v_spanAtName = (fun (name : string) (sp : t_Span) -> (if (v_isSpanEmpty sp) then sp else (if ((v_spanStartOffset sp) = (v_spanEndOffset sp)) then { f_Span_spanFile = (v_spanFile sp); f_Span_spanStartLine = (v_spanStartLine sp); f_Span_spanStartCol = (v_spanStartCol sp); f_Span_spanEndLine = (v_spanStartLine sp); f_Span_spanEndCol = ((v_spanStartCol sp) + (String.length name)); f_Span_spanStartOffset = (v_spanStartOffset sp); f_Span_spanEndOffset = ((v_spanStartOffset sp) + (String.length name)) } else (if (((v_spanEndOffset sp) - (v_spanStartOffset sp)) = (String.length name)) then sp else v_spanEmpty))))
