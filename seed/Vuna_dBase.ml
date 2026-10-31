open Vuna_runtime
open Vuna_dPair
open Vuna_dBool
open Vuna_dMonad
open Vuna_dMaybe
open Vuna_dList
open Vuna_dIO
open Vuna_dResult
open Vuna_dString
include Vuna_dPair
include Vuna_dBool
include Vuna_dMaybe
include Vuna_dList
include Vuna_dResult
include Vuna_dString
type   t_Vuna_dBase_dPos =
    C_Vuna_dBase_dPos of (int) * (int)
and   t_Vuna_dBase_dSpan =
    C_Vuna_dBase_dSpan of (string) * (int) * (int) * (int) * (int)
let show_Vuna_dBase_dPos v =
  match v with
  | C_Vuna_dBase_dPos (f0, f1) -> show_ctor "Pos" [(string_of_int) f0; (string_of_int) f1]
and show_Vuna_dBase_dSpan v =
  match v with
  | C_Vuna_dBase_dSpan (f0, f1, f2, f3, f4) -> show_ctor "Span" [(show_vstring) f0; (string_of_int) f1; (string_of_int) f2; (string_of_int) f3; (string_of_int) f4]
let v_Vuna_dBase_dposLine = fun a0 -> match a0 with
  | (C_Vuna_dBase_dPos (l, c)) -> l
  | _ -> vuna_fail "compiler/lib/Vuna/Base.vuna" 24 1 ("no matching clause for Vuna.Base.posLine")

let v_Vuna_dBase_dposCol = fun a0 -> match a0 with
  | (C_Vuna_dBase_dPos (l, c)) -> c
  | _ -> vuna_fail "compiler/lib/Vuna/Base.vuna" 26 1 ("no matching clause for Vuna.Base.posCol")

let v_Vuna_dBase_dspanFile = fun a0 -> match a0 with
  | (C_Vuna_dBase_dSpan (f, sl, sc, el, ec)) -> f
  | _ -> vuna_fail "compiler/lib/Vuna/Base.vuna" 28 1 ("no matching clause for Vuna.Base.spanFile")

let v_Vuna_dBase_dspanStartLine = fun a0 -> match a0 with
  | (C_Vuna_dBase_dSpan (f, sl, sc, el, ec)) -> sl
  | _ -> vuna_fail "compiler/lib/Vuna/Base.vuna" 30 1 ("no matching clause for Vuna.Base.spanStartLine")

let v_Vuna_dBase_dspanStartCol = fun a0 -> match a0 with
  | (C_Vuna_dBase_dSpan (f, sl, sc, el, ec)) -> sc
  | _ -> vuna_fail "compiler/lib/Vuna/Base.vuna" 32 1 ("no matching clause for Vuna.Base.spanStartCol")

let v_Vuna_dBase_dspanEndLine = fun a0 -> match a0 with
  | (C_Vuna_dBase_dSpan (f, sl, sc, el, ec)) -> el
  | _ -> vuna_fail "compiler/lib/Vuna/Base.vuna" 34 1 ("no matching clause for Vuna.Base.spanEndLine")

let v_Vuna_dBase_dspanEndCol = fun a0 -> match a0 with
  | (C_Vuna_dBase_dSpan (f, sl, sc, el, ec)) -> ec
  | _ -> vuna_fail "compiler/lib/Vuna/Base.vuna" 36 1 ("no matching clause for Vuna.Base.spanEndCol")

let v_Vuna_dBase_dshowSpanLoc = fun a0 -> match a0 with
  | (C_Vuna_dBase_dSpan (f, sl, sc, el, ec)) -> (let vuna_cat0' = (f) in (let vuna_cat1' = (":") in (let vuna_cat2' = (bi_str_from_int sl) in (let vuna_cat3' = (":") in (let vuna_cat4' = (bi_str_from_int sc) in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'; vuna_cat4'])))))
  | _ -> vuna_fail "compiler/lib/Vuna/Base.vuna" 39 1 ("no matching clause for Vuna.Base.showSpanLoc")

let rec v_Vuna_dBase_dmemChar = fun c chars -> (match chars with
  | [] -> false
  | (x) :: (rest) -> if v_vuna_ueq_uint x c then true else v_Vuna_dBase_dmemChar c rest
  | _ -> vuna_fail "compiler/lib/Vuna/Base.vuna" 43 3 ("case pattern match failure"))

let v_Vuna_dBase_dcontainsDot = fun s -> v_Vuna_dBase_dmemChar 46 (bi_str_unpack s)

let rec v_Vuna_dBase_dsplitCharsOnDot = fun chars acc seg -> (match chars with
  | [] -> v_Vuna_dList_dreverse ((bi_str_pack (v_Vuna_dList_dreverse seg)) :: (acc))
  | (c) :: (rest) -> if v_vuna_ueq_uint c 46 then v_Vuna_dBase_dsplitCharsOnDot rest ((bi_str_pack (v_Vuna_dList_dreverse seg)) :: (acc)) [] else v_Vuna_dBase_dsplitCharsOnDot rest acc ((c) :: (seg))
  | _ -> vuna_fail "compiler/lib/Vuna/Base.vuna" 56 3 ("case pattern match failure"))

let v_Vuna_dBase_dsplitOnDot = fun s -> v_Vuna_dBase_dsplitCharsOnDot (bi_str_unpack s) [] []

let v_Vuna_dBase_dsplitLastDot = fun parts -> (match v_Vuna_dList_dreverse parts with
  | [] -> C_Vuna_dPair_dPair ([], "")
  | (last) :: (rest) -> C_Vuna_dPair_dPair (v_Vuna_dList_dreverse rest, last)
  | _ -> vuna_fail "compiler/lib/Vuna/Base.vuna" 64 3 ("case pattern match failure"))

let rec v_Vuna_dBase_djoinDots = fun a0 -> match a0 with
  | ([]) -> ""
  | ((x) :: ([])) -> x
  | ((x) :: (rest)) -> (let vuna_cat0' = (x) in (let vuna_cat1' = (".") in (let vuna_cat2' = (v_Vuna_dBase_djoinDots rest) in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'])))
  | _ -> vuna_fail "compiler/lib/Vuna/Base.vuna" 69 1 ("no matching clause for Vuna.Base.joinDots")

let rec v_Vuna_dBase_djoinSlashes = fun a0 -> match a0 with
  | ([]) -> ""
  | ((x) :: ([])) -> x
  | ((x) :: (rest)) -> (let vuna_cat0' = (x) in (let vuna_cat1' = ("/") in (let vuna_cat2' = (v_Vuna_dBase_djoinSlashes rest) in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'])))
  | _ -> vuna_fail "compiler/lib/Vuna/Base.vuna" 74 1 ("no matching clause for Vuna.Base.joinSlashes")

let rec v_Vuna_dBase_djoinArrows = fun a0 -> match a0 with
  | ([]) -> ""
  | ((x) :: ([])) -> x
  | ((x) :: (rest)) -> (let vuna_cat0' = (x) in (let vuna_cat1' = (" -> ") in (let vuna_cat2' = (v_Vuna_dBase_djoinArrows rest) in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'])))
  | _ -> vuna_fail "compiler/lib/Vuna/Base.vuna" 79 1 ("no matching clause for Vuna.Base.joinArrows")

let rec v_Vuna_dBase_dsplitPathChars = fun a0 a1 -> match (a0, a1) with
  | ([], acc) -> (let chars = v_Vuna_dList_dreverse acc in C_Vuna_dPair_dPair ("", bi_str_pack chars))
  | ((c) :: (rest), acc) -> if v_vuna_ueq_uint c 47 then C_Vuna_dPair_dPair (bi_str_pack (v_Vuna_dList_dreverse acc), bi_str_pack rest) else v_Vuna_dBase_dsplitPathChars rest ((c) :: (acc))
  | _ -> vuna_fail "compiler/lib/Vuna/Base.vuna" 88 1 ("no matching clause for Vuna.Base.splitPathChars")

let v_Vuna_dBase_dsplitPath = fun path -> v_Vuna_dBase_dsplitPathChars (bi_str_unpack path) []

let v_Vuna_dBase_dbaseName = fun path -> v_Vuna_dPair_dsecondOf (v_Vuna_dBase_dsplitPath path)

let rec v_Vuna_dBase_dprefixLen2 = fun a0 a1 -> match (a0, a1) with
  | ([], _) -> 0
  | (_, []) -> 0
  | ((x) :: (xs), (y) :: (ys)) -> if v_vuna_ueq_uint x y then bi_add 1 (v_Vuna_dBase_dprefixLen2 xs ys) else 0
  | _ -> vuna_fail "compiler/lib/Vuna/Base.vuna" 113 1 ("no matching clause for Vuna.Base.prefixLen2")

let v_Vuna_dBase_dlengthDiffLE = fun la lb n -> if v_vuna_uge_uint la lb then v_vuna_ule_uint (bi_sub la lb) n else v_vuna_ule_uint (bi_sub lb la) n

let v_Vuna_dBase_d_usimilarName = fun a b -> if v_vuna_ueq_ustr a b then false else if v_Vuna_dString_dstartsWith a b then true else if v_Vuna_dString_dstartsWith b a then true else (let la = bi_str_unpack a in (let lb = bi_str_unpack b in (if (v_Vuna_dBase_dlengthDiffLE (v_Vuna_dList_dlength la) (v_Vuna_dList_dlength lb) 2) then (v_vuna_uge_uint (v_Vuna_dBase_dprefixLen2 la lb) 2) else false)))

let rec v_Vuna_dBase_dsuggest = fun a0 a1 -> match (a0, a1) with
  | (name, []) -> ""
  | (name, (c) :: (rest)) -> if v_Vuna_dBase_d_usimilarName name c then (let vuna_cat0' = (" (did you mean ") in (let vuna_cat1' = (c) in (let vuna_cat2' = ("?)") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2']))) else v_Vuna_dBase_dsuggest name rest
  | _ -> vuna_fail "compiler/lib/Vuna/Base.vuna" 100 1 ("no matching clause for Vuna.Base.suggest")

let v_vuna_ushow_uVuna_uBase_uPos = fun x -> (match x with
  | C_Vuna_dBase_dPos (v0, v1) -> (let vuna_cat0' = ("(Pos ") in (let vuna_cat1' = (v_vuna_ushow_uint v0) in (let vuna_cat2' = (" ") in (let vuna_cat3' = (v_vuna_ushow_uint v1) in (let vuna_cat4' = (")") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'; vuna_cat4'])))))
  | _ -> vuna_fail "<generated>" 388 29 ("case pattern match failure"))

let v_vuna_ueq_uVuna_uBase_uPos = fun x y -> (match x with
  | C_Vuna_dBase_dPos (v0, v1) -> (match y with
  | C_Vuna_dBase_dPos (w0, w1) -> (if (v_vuna_ueq_uint v0 w0) then (v_vuna_ueq_uint v1 w1) else false)
  | _ -> v_vuna_ueq_uint 0 1
  | _ -> vuna_fail "<generated>" 393 26 ("case pattern match failure"))
  | _ -> v_vuna_ueq_uint 0 1
  | _ -> vuna_fail "<generated>" 392 29 ("case pattern match failure"))

let v_vuna_uneq_uVuna_uBase_uPos = fun x y -> if v_vuna_ueq_uVuna_uBase_uPos x y then v_vuna_ueq_uint 0 1 else v_vuna_ueq_uint 0 0

let v_vuna_ushow_uVuna_uBase_uSpan = fun x -> (match x with
  | C_Vuna_dBase_dSpan (v0, v1, v2, v3, v4) -> (let vuna_cat0' = ("(Span ") in (let vuna_cat1' = (v_vuna_ushow_ustring v0) in (let vuna_cat2' = (" ") in (let vuna_cat3' = (v_vuna_ushow_uint v1) in (let vuna_cat4' = (" ") in (let vuna_cat5' = (v_vuna_ushow_uint v2) in (let vuna_cat6' = (" ") in (let vuna_cat7' = (v_vuna_ushow_uint v3) in (let vuna_cat8' = (" ") in (let vuna_cat9' = (v_vuna_ushow_uint v4) in (let vuna_cat10' = (")") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'; vuna_cat4'; vuna_cat5'; vuna_cat6'; vuna_cat7'; vuna_cat8'; vuna_cat9'; vuna_cat10'])))))))))))
  | _ -> vuna_fail "<generated>" 401 30 ("case pattern match failure"))

let v_vuna_ueq_uVuna_uBase_uSpan = fun x y -> (match x with
  | C_Vuna_dBase_dSpan (v0, v1, v2, v3, v4) -> (match y with
  | C_Vuna_dBase_dSpan (w0, w1, w2, w3, w4) -> (if ((if ((if ((if (v_vuna_ueq_ustr v0 w0) then (v_vuna_ueq_uint v1 w1) else false)) then (v_vuna_ueq_uint v2 w2) else false)) then (v_vuna_ueq_uint v3 w3) else false)) then (v_vuna_ueq_uint v4 w4) else false)
  | _ -> v_vuna_ueq_uint 0 1
  | _ -> vuna_fail "<generated>" 406 36 ("case pattern match failure"))
  | _ -> v_vuna_ueq_uint 0 1
  | _ -> vuna_fail "<generated>" 405 30 ("case pattern match failure"))

let v_vuna_uneq_uVuna_uBase_uSpan = fun x y -> if v_vuna_ueq_uVuna_uBase_uSpan x y then v_vuna_ueq_uint 0 1 else v_vuna_ueq_uint 0 0
