open Vuna_runtime
type t_Pos = { f_Pos_posLine : int; f_Pos_posCol : int; f_Pos_posOffset : int; f_Pos_posEndOffset : int }
and t_Span = { f_Span_spanFile : string; f_Span_spanStartLine : int; f_Span_spanStartCol : int; f_Span_spanEndLine : int; f_Span_spanEndCol : int; f_Span_spanStartOffset : int; f_Span_spanEndOffset : int }

# 46 "Vuna/Compiler/Base/Source.vuna"
let v_showSpanLoc = (fun (dtb_u_u1 : t_Span) -> (match dtb_u_u1 with
  | { f_Span_spanFile = dtb_u_u2; f_Span_spanStartLine = dtb_u_u3; f_Span_spanStartCol = dtb_u_u4; f_Span_spanEndLine = dtb_u_u5; f_Span_spanEndCol = dtb_u_u6; f_Span_spanStartOffset = dtb_u_u7; f_Span_spanEndOffset = dtb_u_u8 } -> (String.concat "" [dtb_u_u2; ":"; (string_of_int dtb_u_u3); ":"; (string_of_int dtb_u_u4)])
  | _ -> failwith "DT: impossible branch"
))

# 50 "Vuna/Compiler/Base/Source.vuna"
let v_spanEmpty = { f_Span_spanFile = ""; f_Span_spanStartLine = 0; f_Span_spanStartCol = 0; f_Span_spanEndLine = 0; f_Span_spanEndCol = 0; f_Span_spanStartOffset = 0; f_Span_spanEndOffset = 0 }

# 76 "Vuna/Compiler/Base/Source.vuna"
let rec v_memChar = (fun (dtb_u_u9 : int) (dtb_u_u10 : int B_dData_dList.t_List) -> (match dtb_u_u10 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u11, dtb_u_u12) -> (if (dtb_u_u11 = dtb_u_u9) then true else ((v_memChar dtb_u_u9) dtb_u_u12))
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 82 "Vuna/Compiler/Base/Source.vuna"
let rec v_scanFor = (fun (dtb_u_u13 : int) (dtb_u_u14 : string) (dtb_u_u15 : int) (dtb_u_u16 : int) (dtb_u_u17 : int) -> (if (dtb_u_u17 <= 0) then false else (if (dtb_u_u15 >= dtb_u_u16) then false else (if ((let b = dtb_u_u14 in let k = dtb_u_u15 in if k < 0 || k >= String.length b then -1 else Char.code (String.unsafe_get b k)) = dtb_u_u13) then true else (((((v_scanFor dtb_u_u13) dtb_u_u14) (dtb_u_u15 + 1)) dtb_u_u16) (dtb_u_u17 - 1))))))

# 89 "Vuna/Compiler/Base/Source.vuna"
let v_containsDot = (fun (dtb_u_u18 : string) -> (((((v_scanFor 46) dtb_u_u18) 0) (String.length dtb_u_u18)) (String.length dtb_u_u18)))

# 102 "Vuna/Compiler/Base/Source.vuna"
let rec v_splitOnCharGo = (fun (dtb_u_u19 : int) (dtb_u_u20 : string) (dtb_u_u21 : int) (dtb_u_u22 : int) (dtb_u_u23 : int) (dtb_u_u24 : int) (dtb_u_u25 : string B_dData_dList.t_List) -> (if (dtb_u_u24 <= 0) then (B_dData_dList.v_reverse (B_dData_dList.C_List__x58__x58_ ((((dtp_substring dtb_u_u21) (dtb_u_u23 - dtb_u_u21)) dtb_u_u20), dtb_u_u25))) else (if (dtb_u_u22 >= dtb_u_u23) then (B_dData_dList.v_reverse (B_dData_dList.C_List__x58__x58_ ((((dtp_substring dtb_u_u21) (dtb_u_u22 - dtb_u_u21)) dtb_u_u20), dtb_u_u25))) else (if ((let b = dtb_u_u20 in let k = dtb_u_u22 in if k < 0 || k >= String.length b then -1 else Char.code (String.unsafe_get b k)) = dtb_u_u19) then (((((((v_splitOnCharGo dtb_u_u19) dtb_u_u20) (dtb_u_u22 + 1)) (dtb_u_u22 + 1)) dtb_u_u23) (dtb_u_u24 - 1)) (B_dData_dList.C_List__x58__x58_ ((((dtp_substring dtb_u_u21) (dtb_u_u22 - dtb_u_u21)) dtb_u_u20), dtb_u_u25))) else (((((((v_splitOnCharGo dtb_u_u19) dtb_u_u20) dtb_u_u21) (dtb_u_u22 + 1)) dtb_u_u23) (dtb_u_u24 - 1)) dtb_u_u25)))))

# 97 "Vuna/Compiler/Base/Source.vuna"
let v_splitOnChar = (fun (dtb_u_u26 : int) (dtb_u_u27 : string) -> (((((((v_splitOnCharGo dtb_u_u26) dtb_u_u27) 0) 0) (String.length dtb_u_u27)) ((String.length dtb_u_u27) + 1)) B_dData_dList.C_List_Nil))

# 93 "Vuna/Compiler/Base/Source.vuna"
let v_splitOnDot = (fun (dtb_u_u28 : string) -> ((v_splitOnChar 46) dtb_u_u28))

# 115 "Vuna/Compiler/Base/Source.vuna"
let v_splitLastDot = (fun (dtb_u_u29 : string B_dData_dList.t_List) -> (match (B_dData_dList.v_reverse dtb_u_u29) with
  | B_dData_dList.C_List_Nil -> { B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = "" }
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u30, dtb_u_u31) -> { B_dData_dPair.f_Pair_first = (B_dData_dList.v_reverse dtb_u_u31); B_dData_dPair.f_Pair_second = dtb_u_u30 }
  | _ -> failwith "DT: impossible branch"
))

# 130 "Vuna/Compiler/Base/Source.vuna"
let[@tail_mod_cons] rec v_dotsRest = (fun (dtb_u_u32 : string B_dData_dList.t_List) -> (match dtb_u_u32 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u33, dtb_u_u34) -> (B_dData_dList.C_List__x58__x58_ (".", (B_dData_dList.C_List__x58__x58_ (dtb_u_u33, (v_dotsRest dtb_u_u34)))))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 126 "Vuna/Compiler/Base/Source.vuna"
let v_joinDotsParts = (fun (dtb_u_u35 : string B_dData_dList.t_List) -> (match dtb_u_u35 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u36, dtb_u_u37) -> (B_dData_dList.C_List__x58__x58_ (dtb_u_u36, (v_dotsRest dtb_u_u37)))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 122 "Vuna/Compiler/Base/Source.vuna"
let v_joinDots = (fun (dtb_u_u38 : string B_dData_dList.t_List) -> (B_dData_dList.dtp_concatMany (v_joinDotsParts dtb_u_u38)))

# 141 "Vuna/Compiler/Base/Source.vuna"
let rec v_lastSegGo = (fun (dtb_u_u39 : string) (dtb_u_u40 : int) (dtb_u_u41 : int) -> (if (dtb_u_u41 <= 0) then (((dtp_substring (dtb_u_u40 + 1)) (((String.length dtb_u_u39) - dtb_u_u40) - 1)) dtb_u_u39) else (if (dtb_u_u40 < 0) then dtb_u_u39 else (if ((let b = dtb_u_u39 in let k = dtb_u_u40 in if k < 0 || k >= String.length b then -1 else Char.code (String.unsafe_get b k)) = 46) then (((dtp_substring (dtb_u_u40 + 1)) (((String.length dtb_u_u39) - dtb_u_u40) - 1)) dtb_u_u39) else (((v_lastSegGo dtb_u_u39) (dtb_u_u40 - 1)) (dtb_u_u41 - 1))))))

# 138 "Vuna/Compiler/Base/Source.vuna"
let v_lastSeg = (fun (dtb_u_u42 : string) -> (((v_lastSegGo dtb_u_u42) ((String.length dtb_u_u42) - 1)) ((String.length dtb_u_u42) + 1)))

# 153 "Vuna/Compiler/Base/Source.vuna"
let v_prefixOfName = (fun (dtb_u_u43 : string) -> (match (v_splitLastDot (v_splitOnDot dtb_u_u43)) with
  | { B_dData_dPair.f_Pair_first = dtb_u_u44; B_dData_dPair.f_Pair_second = dtb_u_u45 } -> (v_joinDots dtb_u_u44)
  | _ -> failwith "DT: impossible branch"
))

# 159 "Vuna/Compiler/Base/Source.vuna"
let rec v_joinSlashes = (fun (dtb_u_u46 : string B_dData_dList.t_List) -> (match dtb_u_u46 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u47, dtb_u_u48) -> (match dtb_u_u48 with
  | B_dData_dList.C_List_Nil -> dtb_u_u47
  | _ -> (String.concat "" [dtb_u_u47; "/"; (v_joinSlashes dtb_u_u48)])
)
  | B_dData_dList.C_List_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))

# 165 "Vuna/Compiler/Base/Source.vuna"
let rec v_joinArrows = (fun (dtb_u_u49 : string B_dData_dList.t_List) -> (match dtb_u_u49 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u50, dtb_u_u51) -> (match dtb_u_u51 with
  | B_dData_dList.C_List_Nil -> dtb_u_u50
  | _ -> (String.concat "" [dtb_u_u50; " -> "; (v_joinArrows dtb_u_u51)])
)
  | B_dData_dList.C_List_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))

# 176 "Vuna/Compiler/Base/Source.vuna"
let rec v_splitPathChars = (fun (dtb_u_u52 : int B_dData_dList.t_List) (dtb_u_u53 : int B_dData_dList.t_List) -> (match dtb_u_u52 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u54, dtb_u_u55) -> (if (dtb_u_u54 = 47) then { B_dData_dPair.f_Pair_first = (B_dData_dList.dtp_pack (B_dData_dList.v_reverse dtb_u_u53)); B_dData_dPair.f_Pair_second = (B_dData_dList.dtp_pack dtb_u_u55) } else ((v_splitPathChars dtb_u_u55) (B_dData_dList.C_List__x58__x58_ (dtb_u_u54, dtb_u_u53))))
  | B_dData_dList.C_List_Nil -> (let dtb_u_u56 = (B_dData_dList.v_reverse dtb_u_u53) in { B_dData_dPair.f_Pair_first = ""; B_dData_dPair.f_Pair_second = (B_dData_dList.dtp_pack dtb_u_u56) })
  | _ -> failwith "DT: impossible branch"
))

# 172 "Vuna/Compiler/Base/Source.vuna"
let v_splitPath = (fun (dtb_u_u57 : string) -> ((v_splitPathChars (B_dData_dList.dtp_unpack dtb_u_u57)) B_dData_dList.C_List_Nil))

# 185 "Vuna/Compiler/Base/Source.vuna"
let v_baseName = (fun (dtb_u_u58 : string) -> (B_dData_dPair.v_secondOf (v_splitPath dtb_u_u58)))

# 203 "Vuna/Compiler/Base/Source.vuna"
let rec v_dropPastSlash = (fun (dtb_u_u59 : int B_dData_dList.t_List) -> (match dtb_u_u59 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u60, dtb_u_u61) -> (if (dtb_u_u60 = 47) then dtb_u_u61 else (v_dropPastSlash dtb_u_u61))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 190 "Vuna/Compiler/Base/Source.vuna"
let v_parentOfPath = (fun (dtb_u_u62 : string) -> (let dtb_u_u63 = (B_dData_dList.dtp_unpack dtb_u_u62) in (let dtb_u_u64 = (B_dData_dList.v_reverse dtb_u_u63) in (let dtb_u_u65 = (v_dropPastSlash dtb_u_u64) in (if ((B_dData_dList.v_length dtb_u_u65) = (B_dData_dList.v_length dtb_u_u64)) then "." else (let dtb_u_u66 = (B_dData_dList.dtp_pack (B_dData_dList.v_reverse dtb_u_u65)) in (if (dtb_u_u66 = "") then (if ((B_dData_dString.v_startsWith "/") dtb_u_u62) then "/" else ".") else (if (if ((B_dData_dString.v_startsWith "/") dtb_u_u62) then (B_dData_dBool.v_not ((B_dData_dString.v_startsWith "/") dtb_u_u66)) else false) then ("/" ^ dtb_u_u66) else dtb_u_u66))))))))

# 214 "Vuna/Compiler/Base/Source.vuna"
let rec v_normalizeSegments = (fun (dtb_u_u67 : bool) (dtb_u_u68 : string B_dData_dList.t_List) (dtb_u_u69 : string B_dData_dList.t_List) -> (match dtb_u_u68 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u70, dtb_u_u71) -> (if (dtb_u_u70 = "") then (((v_normalizeSegments dtb_u_u67) dtb_u_u71) dtb_u_u69) else (if (dtb_u_u70 = ".") then (((v_normalizeSegments dtb_u_u67) dtb_u_u71) dtb_u_u69) else (if (dtb_u_u70 = "..") then (match dtb_u_u69 with
  | B_dData_dList.C_List_Nil -> (if dtb_u_u67 then (((v_normalizeSegments dtb_u_u67) dtb_u_u71) B_dData_dList.C_List_Nil) else (((v_normalizeSegments dtb_u_u67) dtb_u_u71) (B_dData_dList.C_List__x58__x58_ ("..", B_dData_dList.C_List_Nil))))
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u72, dtb_u_u73) -> (if (dtb_u_u72 = "..") then (((v_normalizeSegments dtb_u_u67) dtb_u_u71) (B_dData_dList.C_List__x58__x58_ ("..", dtb_u_u69))) else (((v_normalizeSegments dtb_u_u67) dtb_u_u71) dtb_u_u73))
  | _ -> failwith "DT: impossible branch"
) else (((v_normalizeSegments dtb_u_u67) dtb_u_u71) (B_dData_dList.C_List__x58__x58_ (dtb_u_u70, dtb_u_u69))))))
  | B_dData_dList.C_List_Nil -> dtb_u_u69
  | _ -> failwith "DT: impossible branch"
))

# 237 "Vuna/Compiler/Base/Source.vuna"
let v_normalizePath = (fun (dtb_u_u74 : string) -> (if ((B_dData_dString.v_startsWith "/") dtb_u_u74) then (match (((v_normalizeSegments true) ((v_splitOnChar 47) dtb_u_u74)) B_dData_dList.C_List_Nil) with
  | B_dData_dList.C_List_Nil -> "/"
  | dtb_u_u75 -> ("/" ^ (v_joinSlashes (B_dData_dList.v_reverse dtb_u_u75)))
) else (match (((v_normalizeSegments false) ((v_splitOnChar 47) dtb_u_u74)) B_dData_dList.C_List_Nil) with
  | B_dData_dList.C_List_Nil -> "."
  | dtb_u_u76 -> (v_joinSlashes (B_dData_dList.v_reverse dtb_u_u76))
)))

# 249 "Vuna/Compiler/Base/Source.vuna"
let v_joinPath = (fun (dtb_u_u77 : string) (dtb_u_u78 : string) -> (if ((B_dData_dString.v_startsWith "/") dtb_u_u78) then (v_normalizePath dtb_u_u78) else (v_normalizePath (String.concat "" [dtb_u_u77; "/"; dtb_u_u78]))))

# 257 "Vuna/Compiler/Base/Source.vuna"
let v_stripPathPrefix = (fun (dtb_u_u79 : string) (dtb_u_u80 : string) -> (if (dtb_u_u79 = "") then dtb_u_u80 else (if ((B_dData_dString.v_startsWith (dtb_u_u79 ^ "/")) dtb_u_u80) then (((dtp_substring (String.length (dtb_u_u79 ^ "/"))) ((String.length dtb_u_u80) - (String.length (dtb_u_u79 ^ "/")))) dtb_u_u80) else dtb_u_u80)))

# 267 "Vuna/Compiler/Base/Source.vuna"
let rec v_stripRootsPath = (fun (dtb_u_u81 : string B_dData_dList.t_List) (dtb_u_u82 : string) -> (match dtb_u_u81 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u83, dtb_u_u84) -> (if ((B_dData_dString.v_startsWith (dtb_u_u83 ^ "/")) dtb_u_u82) then ((v_stripPathPrefix dtb_u_u83) dtb_u_u82) else ((v_stripRootsPath dtb_u_u84) dtb_u_u82))
  | B_dData_dList.C_List_Nil -> dtb_u_u82
  | _ -> failwith "DT: impossible branch"
))

# 273 "Vuna/Compiler/Base/Source.vuna"
let v_stripDotSlashPath = (fun (dtb_u_u85 : string) -> (if ((B_dData_dString.v_startsWith "./") dtb_u_u85) then (((dtp_substring 2) ((String.length dtb_u_u85) - 2)) dtb_u_u85) else dtb_u_u85))

# 279 "Vuna/Compiler/Base/Source.vuna"
let v_locationPathUnder = (fun (dtb_u_u86 : string B_dData_dList.t_List) (dtb_u_u87 : string) (dtb_u_u88 : string) -> (v_stripDotSlashPath ((v_stripPathPrefix dtb_u_u87) ((v_stripRootsPath dtb_u_u86) dtb_u_u88))))

# 307 "Vuna/Compiler/Base/Source.vuna"
let rec v_prefixLen2 = (fun (dtb_u_u89 : int B_dData_dList.t_List) (dtb_u_u90 : int B_dData_dList.t_List) -> (match dtb_u_u89 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u91, dtb_u_u92) -> (match dtb_u_u90 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u93, dtb_u_u94) -> (if (dtb_u_u91 = dtb_u_u93) then (1 + ((v_prefixLen2 dtb_u_u92) dtb_u_u94)) else 0)
  | B_dData_dList.C_List_Nil -> 0
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))

# 313 "Vuna/Compiler/Base/Source.vuna"
let v_lengthDiffLE = (fun (dtb_u_u95 : int) (dtb_u_u96 : int) (dtb_u_u97 : int) -> (if (dtb_u_u95 >= dtb_u_u96) then ((dtb_u_u95 - dtb_u_u96) <= dtb_u_u97) else ((dtb_u_u96 - dtb_u_u95) <= dtb_u_u97)))

# 291 "Vuna/Compiler/Base/Source.vuna"
let v__usimilarName = (fun (dtb_u_u98 : string) (dtb_u_u99 : string) -> (if (dtb_u_u98 = dtb_u_u99) then false else (if ((B_dData_dString.v_startsWith dtb_u_u98) dtb_u_u99) then true else (if ((B_dData_dString.v_startsWith dtb_u_u99) dtb_u_u98) then true else (let dtb_u_u100 = (B_dData_dList.dtp_unpack dtb_u_u98) in (let dtb_u_u101 = (B_dData_dList.dtp_unpack dtb_u_u99) in (if (((v_lengthDiffLE (B_dData_dList.v_length dtb_u_u100)) (B_dData_dList.v_length dtb_u_u101)) 2) then (((v_prefixLen2 dtb_u_u100) dtb_u_u101) >= 2) else false)))))))

# 284 "Vuna/Compiler/Base/Source.vuna"
let rec v_suggest = (fun (dtb_u_u102 : string) (dtb_u_u103 : string B_dData_dList.t_List) -> (match dtb_u_u103 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u104, dtb_u_u105) -> (if ((v__usimilarName dtb_u_u102) dtb_u_u104) then (String.concat "" [" (did you mean "; dtb_u_u104; "?)"]) else ((v_suggest dtb_u_u102) dtb_u_u105))
  | B_dData_dList.C_List_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))

# 15 "Vuna/Compiler/Base/Source.vuna"
let v_posLine = (fun (dtb_u_u106 : t_Pos) -> (match dtb_u_u106 with
  | { f_Pos_posLine = dtb_u_u107; f_Pos_posCol = dtb_u_u108; f_Pos_posOffset = dtb_u_u109; f_Pos_posEndOffset = dtb_u_u110 } -> dtb_u_u107
  | _ -> failwith "DT: impossible branch"
))

# 17 "Vuna/Compiler/Base/Source.vuna"
let v_posCol = (fun (dtb_u_u111 : t_Pos) -> (match dtb_u_u111 with
  | { f_Pos_posLine = dtb_u_u112; f_Pos_posCol = dtb_u_u113; f_Pos_posOffset = dtb_u_u114; f_Pos_posEndOffset = dtb_u_u115 } -> dtb_u_u113
  | _ -> failwith "DT: impossible branch"
))

# 19 "Vuna/Compiler/Base/Source.vuna"
let v_posOffset = (fun (dtb_u_u116 : t_Pos) -> (match dtb_u_u116 with
  | { f_Pos_posLine = dtb_u_u117; f_Pos_posCol = dtb_u_u118; f_Pos_posOffset = dtb_u_u119; f_Pos_posEndOffset = dtb_u_u120 } -> dtb_u_u119
  | _ -> failwith "DT: impossible branch"
))

# 21 "Vuna/Compiler/Base/Source.vuna"
let v_posEndOffset = (fun (dtb_u_u121 : t_Pos) -> (match dtb_u_u121 with
  | { f_Pos_posLine = dtb_u_u122; f_Pos_posCol = dtb_u_u123; f_Pos_posOffset = dtb_u_u124; f_Pos_posEndOffset = dtb_u_u125 } -> dtb_u_u125
  | _ -> failwith "DT: impossible branch"
))

# 30 "Vuna/Compiler/Base/Source.vuna"
let v_spanFile = (fun (dtb_u_u126 : t_Span) -> (match dtb_u_u126 with
  | { f_Span_spanFile = dtb_u_u127; f_Span_spanStartLine = dtb_u_u128; f_Span_spanStartCol = dtb_u_u129; f_Span_spanEndLine = dtb_u_u130; f_Span_spanEndCol = dtb_u_u131; f_Span_spanStartOffset = dtb_u_u132; f_Span_spanEndOffset = dtb_u_u133 } -> dtb_u_u127
  | _ -> failwith "DT: impossible branch"
))

# 32 "Vuna/Compiler/Base/Source.vuna"
let v_spanStartLine = (fun (dtb_u_u134 : t_Span) -> (match dtb_u_u134 with
  | { f_Span_spanFile = dtb_u_u135; f_Span_spanStartLine = dtb_u_u136; f_Span_spanStartCol = dtb_u_u137; f_Span_spanEndLine = dtb_u_u138; f_Span_spanEndCol = dtb_u_u139; f_Span_spanStartOffset = dtb_u_u140; f_Span_spanEndOffset = dtb_u_u141 } -> dtb_u_u136
  | _ -> failwith "DT: impossible branch"
))

# 54 "Vuna/Compiler/Base/Source.vuna"
let v_isSpanEmpty = (fun (dtb_u_u142 : t_Span) -> ((v_spanStartLine dtb_u_u142) = 0))

# 34 "Vuna/Compiler/Base/Source.vuna"
let v_spanStartCol = (fun (dtb_u_u143 : t_Span) -> (match dtb_u_u143 with
  | { f_Span_spanFile = dtb_u_u144; f_Span_spanStartLine = dtb_u_u145; f_Span_spanStartCol = dtb_u_u146; f_Span_spanEndLine = dtb_u_u147; f_Span_spanEndCol = dtb_u_u148; f_Span_spanStartOffset = dtb_u_u149; f_Span_spanEndOffset = dtb_u_u150 } -> dtb_u_u146
  | _ -> failwith "DT: impossible branch"
))

# 36 "Vuna/Compiler/Base/Source.vuna"
let v_spanEndLine = (fun (dtb_u_u151 : t_Span) -> (match dtb_u_u151 with
  | { f_Span_spanFile = dtb_u_u152; f_Span_spanStartLine = dtb_u_u153; f_Span_spanStartCol = dtb_u_u154; f_Span_spanEndLine = dtb_u_u155; f_Span_spanEndCol = dtb_u_u156; f_Span_spanStartOffset = dtb_u_u157; f_Span_spanEndOffset = dtb_u_u158 } -> dtb_u_u155
  | _ -> failwith "DT: impossible branch"
))

# 38 "Vuna/Compiler/Base/Source.vuna"
let v_spanEndCol = (fun (dtb_u_u159 : t_Span) -> (match dtb_u_u159 with
  | { f_Span_spanFile = dtb_u_u160; f_Span_spanStartLine = dtb_u_u161; f_Span_spanStartCol = dtb_u_u162; f_Span_spanEndLine = dtb_u_u163; f_Span_spanEndCol = dtb_u_u164; f_Span_spanStartOffset = dtb_u_u165; f_Span_spanEndOffset = dtb_u_u166 } -> dtb_u_u164
  | _ -> failwith "DT: impossible branch"
))

# 40 "Vuna/Compiler/Base/Source.vuna"
let v_spanStartOffset = (fun (dtb_u_u167 : t_Span) -> (match dtb_u_u167 with
  | { f_Span_spanFile = dtb_u_u168; f_Span_spanStartLine = dtb_u_u169; f_Span_spanStartCol = dtb_u_u170; f_Span_spanEndLine = dtb_u_u171; f_Span_spanEndCol = dtb_u_u172; f_Span_spanStartOffset = dtb_u_u173; f_Span_spanEndOffset = dtb_u_u174 } -> dtb_u_u173
  | _ -> failwith "DT: impossible branch"
))

# 42 "Vuna/Compiler/Base/Source.vuna"
let v_spanEndOffset = (fun (dtb_u_u175 : t_Span) -> (match dtb_u_u175 with
  | { f_Span_spanFile = dtb_u_u176; f_Span_spanStartLine = dtb_u_u177; f_Span_spanStartCol = dtb_u_u178; f_Span_spanEndLine = dtb_u_u179; f_Span_spanEndCol = dtb_u_u180; f_Span_spanStartOffset = dtb_u_u181; f_Span_spanEndOffset = dtb_u_u182 } -> dtb_u_u182
  | _ -> failwith "DT: impossible branch"
))

# 60 "Vuna/Compiler/Base/Source.vuna"
let v_spanAtName = (fun (dtb_u_u183 : string) (dtb_u_u184 : t_Span) -> (if (v_isSpanEmpty dtb_u_u184) then dtb_u_u184 else (if ((v_spanStartOffset dtb_u_u184) = (v_spanEndOffset dtb_u_u184)) then { f_Span_spanFile = (v_spanFile dtb_u_u184); f_Span_spanStartLine = (v_spanStartLine dtb_u_u184); f_Span_spanStartCol = (v_spanStartCol dtb_u_u184); f_Span_spanEndLine = (v_spanStartLine dtb_u_u184); f_Span_spanEndCol = ((v_spanStartCol dtb_u_u184) + (String.length dtb_u_u183)); f_Span_spanStartOffset = (v_spanStartOffset dtb_u_u184); f_Span_spanEndOffset = ((v_spanStartOffset dtb_u_u184) + (String.length dtb_u_u183)) } else (if (((v_spanEndOffset dtb_u_u184) - (v_spanStartOffset dtb_u_u184)) = (String.length dtb_u_u183)) then dtb_u_u184 else v_spanEmpty))))
