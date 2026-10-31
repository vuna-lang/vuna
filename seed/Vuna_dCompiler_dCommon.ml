open Vuna_runtime
open Base_dPair
open Base_dBool
open Base_dMonad
open Base_dMaybe
open Base_dList
open Base_dIO
open Base_dResult
open Base_dString
open Prelude
include Base_dPair
include Base_dBool
include Base_dMaybe
include Base_dList
include Base_dResult
include Base_dString
type   t_Vuna_dCompiler_dCommon_dPos =
    C_Vuna_dCompiler_dCommon_dPos of (int) * (int)
and   t_Vuna_dCompiler_dCommon_dSpan =
    C_Vuna_dCompiler_dCommon_dSpan of (string) * (int) * (int) * (int) * (int)
let show_Vuna_dCompiler_dCommon_dPos v =
  match v with
  | C_Vuna_dCompiler_dCommon_dPos (f0, f1) -> show_ctor "Pos" [(string_of_int) f0; (string_of_int) f1]
and show_Vuna_dCompiler_dCommon_dSpan v =
  match v with
  | C_Vuna_dCompiler_dCommon_dSpan (f0, f1, f2, f3, f4) -> show_ctor "Span" [(show_vstring) f0; (string_of_int) f1; (string_of_int) f2; (string_of_int) f3; (string_of_int) f4]
let v_Vuna_dCompiler_dCommon_dposLine = fun a0 -> match a0 with
  | (C_Vuna_dCompiler_dCommon_dPos (l, c)) -> l
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Common.vuna" 24 1 ("no matching clause for Vuna.Compiler.Common.posLine")

let v_Vuna_dCompiler_dCommon_dposCol = fun a0 -> match a0 with
  | (C_Vuna_dCompiler_dCommon_dPos (l, c)) -> c
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Common.vuna" 26 1 ("no matching clause for Vuna.Compiler.Common.posCol")

let v_Vuna_dCompiler_dCommon_dspanFile = fun a0 -> match a0 with
  | (C_Vuna_dCompiler_dCommon_dSpan (f, sl, sc, el, ec)) -> f
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Common.vuna" 28 1 ("no matching clause for Vuna.Compiler.Common.spanFile")

let v_Vuna_dCompiler_dCommon_dspanStartLine = fun a0 -> match a0 with
  | (C_Vuna_dCompiler_dCommon_dSpan (f, sl, sc, el, ec)) -> sl
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Common.vuna" 30 1 ("no matching clause for Vuna.Compiler.Common.spanStartLine")

let v_Vuna_dCompiler_dCommon_dspanStartCol = fun a0 -> match a0 with
  | (C_Vuna_dCompiler_dCommon_dSpan (f, sl, sc, el, ec)) -> sc
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Common.vuna" 32 1 ("no matching clause for Vuna.Compiler.Common.spanStartCol")

let v_Vuna_dCompiler_dCommon_dspanEndLine = fun a0 -> match a0 with
  | (C_Vuna_dCompiler_dCommon_dSpan (f, sl, sc, el, ec)) -> el
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Common.vuna" 34 1 ("no matching clause for Vuna.Compiler.Common.spanEndLine")

let v_Vuna_dCompiler_dCommon_dspanEndCol = fun a0 -> match a0 with
  | (C_Vuna_dCompiler_dCommon_dSpan (f, sl, sc, el, ec)) -> ec
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Common.vuna" 36 1 ("no matching clause for Vuna.Compiler.Common.spanEndCol")

let v_Vuna_dCompiler_dCommon_dshowSpanLoc = fun a0 -> match a0 with
  | (C_Vuna_dCompiler_dCommon_dSpan (f, sl, sc, el, ec)) -> (let vuna_cat0' = (f) in (let vuna_cat1' = (":") in (let vuna_cat2' = (bi_str_from_int sl) in (let vuna_cat3' = (":") in (let vuna_cat4' = (bi_str_from_int sc) in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'; vuna_cat4'])))))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Common.vuna" 39 1 ("no matching clause for Vuna.Compiler.Common.showSpanLoc")

let rec v_Vuna_dCompiler_dCommon_dmemChar = fun c chars -> (match chars with
  | [] -> false
  | (x) :: (rest) -> if v_vuna_ueq_uint x c then true else v_Vuna_dCompiler_dCommon_dmemChar c rest
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Common.vuna" 43 3 ("case pattern match failure"))

let v_Vuna_dCompiler_dCommon_dcontainsDot = fun s -> v_Vuna_dCompiler_dCommon_dmemChar 46 (bi_str_unpack s)

let rec v_Vuna_dCompiler_dCommon_dsplitCharsOnDot = fun chars acc seg -> (match chars with
  | [] -> v_Base_dList_dreverse ((bi_str_pack (v_Base_dList_dreverse seg)) :: (acc))
  | (c) :: (rest) -> if v_vuna_ueq_uint c 46 then v_Vuna_dCompiler_dCommon_dsplitCharsOnDot rest ((bi_str_pack (v_Base_dList_dreverse seg)) :: (acc)) [] else v_Vuna_dCompiler_dCommon_dsplitCharsOnDot rest acc ((c) :: (seg))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Common.vuna" 56 3 ("case pattern match failure"))

let v_Vuna_dCompiler_dCommon_dsplitOnDot = fun s -> v_Vuna_dCompiler_dCommon_dsplitCharsOnDot (bi_str_unpack s) [] []

let v_Vuna_dCompiler_dCommon_dsplitLastDot = fun parts -> (match v_Base_dList_dreverse parts with
  | [] -> C_Base_dPair_dPair ([], "")
  | (last) :: (rest) -> C_Base_dPair_dPair (v_Base_dList_dreverse rest, last)
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Common.vuna" 64 3 ("case pattern match failure"))

let rec v_Vuna_dCompiler_dCommon_djoinDots = fun a0 -> match a0 with
  | ([]) -> ""
  | ((x) :: ([])) -> x
  | ((x) :: (rest)) -> (let vuna_cat0' = (x) in (let vuna_cat1' = (".") in (let vuna_cat2' = (v_Vuna_dCompiler_dCommon_djoinDots rest) in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'])))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Common.vuna" 69 1 ("no matching clause for Vuna.Compiler.Common.joinDots")

let rec v_Vuna_dCompiler_dCommon_djoinSlashes = fun a0 -> match a0 with
  | ([]) -> ""
  | ((x) :: ([])) -> x
  | ((x) :: (rest)) -> (let vuna_cat0' = (x) in (let vuna_cat1' = ("/") in (let vuna_cat2' = (v_Vuna_dCompiler_dCommon_djoinSlashes rest) in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'])))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Common.vuna" 74 1 ("no matching clause for Vuna.Compiler.Common.joinSlashes")

let rec v_Vuna_dCompiler_dCommon_djoinArrows = fun a0 -> match a0 with
  | ([]) -> ""
  | ((x) :: ([])) -> x
  | ((x) :: (rest)) -> (let vuna_cat0' = (x) in (let vuna_cat1' = (" -> ") in (let vuna_cat2' = (v_Vuna_dCompiler_dCommon_djoinArrows rest) in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'])))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Common.vuna" 79 1 ("no matching clause for Vuna.Compiler.Common.joinArrows")

let rec v_Vuna_dCompiler_dCommon_dsplitPathChars = fun a0 a1 -> match (a0, a1) with
  | ([], acc) -> (let chars = v_Base_dList_dreverse acc in C_Base_dPair_dPair ("", bi_str_pack chars))
  | ((c) :: (rest), acc) -> if v_vuna_ueq_uint c 47 then C_Base_dPair_dPair (bi_str_pack (v_Base_dList_dreverse acc), bi_str_pack rest) else v_Vuna_dCompiler_dCommon_dsplitPathChars rest ((c) :: (acc))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Common.vuna" 88 1 ("no matching clause for Vuna.Compiler.Common.splitPathChars")

let v_Vuna_dCompiler_dCommon_dsplitPath = fun path -> v_Vuna_dCompiler_dCommon_dsplitPathChars (bi_str_unpack path) []

let v_Vuna_dCompiler_dCommon_dbaseName = fun path -> v_Base_dPair_dsecondOf (v_Vuna_dCompiler_dCommon_dsplitPath path)

let rec v_Vuna_dCompiler_dCommon_dprefixLen2 = fun a0 a1 -> match (a0, a1) with
  | ([], _) -> 0
  | (_, []) -> 0
  | ((x) :: (xs), (y) :: (ys)) -> if v_vuna_ueq_uint x y then bi_add 1 (v_Vuna_dCompiler_dCommon_dprefixLen2 xs ys) else 0
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Common.vuna" 113 1 ("no matching clause for Vuna.Compiler.Common.prefixLen2")

let v_Vuna_dCompiler_dCommon_dlengthDiffLE = fun la lb n -> if v_vuna_uge_uint la lb then v_vuna_ule_uint (bi_sub la lb) n else v_vuna_ule_uint (bi_sub lb la) n

let v_Vuna_dCompiler_dCommon_d_usimilarName = fun a b -> if v_vuna_ueq_ustr a b then false else if v_Base_dString_dstartsWith a b then true else if v_Base_dString_dstartsWith b a then true else (let la = bi_str_unpack a in (let lb = bi_str_unpack b in (if (v_Vuna_dCompiler_dCommon_dlengthDiffLE (v_Base_dList_dlength la) (v_Base_dList_dlength lb) 2) then (v_vuna_uge_uint (v_Vuna_dCompiler_dCommon_dprefixLen2 la lb) 2) else false)))

let rec v_Vuna_dCompiler_dCommon_dsuggest = fun a0 a1 -> match (a0, a1) with
  | (name, []) -> ""
  | (name, (c) :: (rest)) -> if v_Vuna_dCompiler_dCommon_d_usimilarName name c then (let vuna_cat0' = (" (did you mean ") in (let vuna_cat1' = (c) in (let vuna_cat2' = ("?)") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2']))) else v_Vuna_dCompiler_dCommon_dsuggest name rest
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Common.vuna" 100 1 ("no matching clause for Vuna.Compiler.Common.suggest")

let v_vuna_ushow_uVuna_uCompiler_uCommon_uPos = fun x -> (match x with
  | C_Vuna_dCompiler_dCommon_dPos (v0, v1) -> (let vuna_cat0' = ("(Pos ") in (let vuna_cat1' = (v_vuna_ushow_uint v0) in (let vuna_cat2' = (" ") in (let vuna_cat3' = (v_vuna_ushow_uint v1) in (let vuna_cat4' = (")") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'; vuna_cat4'])))))
  | _ -> vuna_fail "<generated>" 472 40 ("case pattern match failure"))

let v_vuna_ueq_uVuna_uCompiler_uCommon_uPos = fun x y -> (match x with
  | C_Vuna_dCompiler_dCommon_dPos (v0, v1) -> (match y with
  | C_Vuna_dCompiler_dCommon_dPos (w0, w1) -> (if (v_vuna_ueq_uint v0 w0) then (v_vuna_ueq_uint v1 w1) else false)
  | _ -> v_vuna_ueq_uint 0 1
  | _ -> vuna_fail "<generated>" 477 37 ("case pattern match failure"))
  | _ -> v_vuna_ueq_uint 0 1
  | _ -> vuna_fail "<generated>" 476 40 ("case pattern match failure"))

let v_vuna_uneq_uVuna_uCompiler_uCommon_uPos = fun x y -> if v_vuna_ueq_uVuna_uCompiler_uCommon_uPos x y then v_vuna_ueq_uint 0 1 else v_vuna_ueq_uint 0 0

let v_vuna_ushow_uVuna_uCompiler_uCommon_uSpan = fun x -> (match x with
  | C_Vuna_dCompiler_dCommon_dSpan (v0, v1, v2, v3, v4) -> (let vuna_cat0' = ("(Span ") in (let vuna_cat1' = (v_vuna_ushow_ustring v0) in (let vuna_cat2' = (" ") in (let vuna_cat3' = (v_vuna_ushow_uint v1) in (let vuna_cat4' = (" ") in (let vuna_cat5' = (v_vuna_ushow_uint v2) in (let vuna_cat6' = (" ") in (let vuna_cat7' = (v_vuna_ushow_uint v3) in (let vuna_cat8' = (" ") in (let vuna_cat9' = (v_vuna_ushow_uint v4) in (let vuna_cat10' = (")") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'; vuna_cat4'; vuna_cat5'; vuna_cat6'; vuna_cat7'; vuna_cat8'; vuna_cat9'; vuna_cat10'])))))))))))
  | _ -> vuna_fail "<generated>" 485 41 ("case pattern match failure"))

let v_vuna_ueq_uVuna_uCompiler_uCommon_uSpan = fun x y -> (match x with
  | C_Vuna_dCompiler_dCommon_dSpan (v0, v1, v2, v3, v4) -> (match y with
  | C_Vuna_dCompiler_dCommon_dSpan (w0, w1, w2, w3, w4) -> (if ((if ((if ((if (v_vuna_ueq_ustr v0 w0) then (v_vuna_ueq_uint v1 w1) else false)) then (v_vuna_ueq_uint v2 w2) else false)) then (v_vuna_ueq_uint v3 w3) else false)) then (v_vuna_ueq_uint v4 w4) else false)
  | _ -> v_vuna_ueq_uint 0 1
  | _ -> vuna_fail "<generated>" 490 47 ("case pattern match failure"))
  | _ -> v_vuna_ueq_uint 0 1
  | _ -> vuna_fail "<generated>" 489 41 ("case pattern match failure"))

let v_vuna_uneq_uVuna_uCompiler_uCommon_uSpan = fun x y -> if v_vuna_ueq_uVuna_uCompiler_uCommon_uSpan x y then v_vuna_ueq_uint 0 1 else v_vuna_ueq_uint 0 0
