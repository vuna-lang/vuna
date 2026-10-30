open Vuna_runtime
open Vuna_dPair
open Vuna_dBool
open Vuna_dMonad
open Vuna_dMaybe
open Vuna_dList
open Vuna_dResult
open Vuna_dString
open Vuna_dBase
open Vuna_dToml
open Vuna_dManifest
open Vuna_dPkg
open Vuna_dAst
open Vuna_dLexer
open Vuna_dParser
open Vuna_dBuiltins
open Vuna_dLoader
open Vuna_dEval
open Vuna_dCodegen
open Vuna_dTypecheck
open Vuna_dSplit
open Vuna_dTypedCodegen
open Vuna_dInterp
open Vuna_dFmt
open Vuna_dFiles
open Vuna_dRepl
open Vuna_dDoc
open Vuna_dTestRunner
open Vuna_dSplitCli
type   t_Vuna_dLint_dEdit =
    C_Vuna_dLint_dEdit of (int) * (int) * ((string) list)
and   t_Vuna_dLint_dFinding =
    C_Vuna_dLint_dFinding of (int) * (int) * (string) * (string) * ((t_Vuna_dLint_dEdit) t_Vuna_dMaybe_dMaybe)
and   t_Vuna_dLint_dLitBranch =
    C_Vuna_dLint_dLitBranch of (string) * (string)
and   t_Vuna_dLint_dIfHead =
    C_Vuna_dLint_dIfHead of (string) * (string) * (string)
and   t_Vuna_dLint_dEnclosing =
    C_Vuna_dLint_dEnclosing of (int) * ((t_Vuna_dLexer_dPTok) list) * (string)
and   t_Vuna_dLint_dCaseBody =
    C_Vuna_dLint_dCaseBody of (int) * ((string) list)
let rec show_Vuna_dLint_dEdit v =
  match v with
  | C_Vuna_dLint_dEdit (f0, f1, f2) -> show_ctor "Edit" [(string_of_int) f0; (string_of_int) f1; ((fun v -> let rec go = function [] -> "Nil" | x :: xs -> "(Cons " ^ (show_vstring) x ^ " " ^ go xs ^ ")" in go v)) f2]
and show_Vuna_dLint_dFinding v =
  match v with
  | C_Vuna_dLint_dFinding (f0, f1, f2, f3, f4) -> show_ctor "Finding" [(string_of_int) f0; (string_of_int) f1; (show_vstring) f2; (show_vstring) f3; ((show_Vuna_dMaybe_dMaybe show_Vuna_dLint_dEdit)) f4]
and show_Vuna_dLint_dLitBranch v =
  match v with
  | C_Vuna_dLint_dLitBranch (f0, f1) -> show_ctor "LitBranch" [(show_vstring) f0; (show_vstring) f1]
and show_Vuna_dLint_dIfHead v =
  match v with
  | C_Vuna_dLint_dIfHead (f0, f1, f2) -> show_ctor "IfHead" [(show_vstring) f0; (show_vstring) f1; (show_vstring) f2]
and show_Vuna_dLint_dEnclosing v =
  match v with
  | C_Vuna_dLint_dEnclosing (f0, f1, f2) -> show_ctor "Enclosing" [(string_of_int) f0; ((fun v -> let rec go = function [] -> "Nil" | x :: xs -> "(Cons " ^ (show_Vuna_dLexer_dPTok) x ^ " " ^ go xs ^ ")" in go v)) f1; (show_vstring) f2]
and show_Vuna_dLint_dCaseBody v =
  match v with
  | C_Vuna_dLint_dCaseBody (f0, f1) -> show_ctor "CaseBody" [(string_of_int) f0; ((fun v -> let rec go = function [] -> "Nil" | x :: xs -> "(Cons " ^ (show_vstring) x ^ " " ^ go xs ^ ")" in go v)) f1]
let v_Vuna_dLint_deditStart = fun a0 -> match a0 with
  | (C_Vuna_dLint_dEdit (start, stop, lines)) -> start
  | _ -> vuna_fail "./lib/Vuna/Lint.vuna" 27 1 ("no matching clause for Vuna.Lint.editStart")

let v_Vuna_dLint_deditEnd = fun a0 -> match a0 with
  | (C_Vuna_dLint_dEdit (start, stop, lines)) -> stop
  | _ -> vuna_fail "./lib/Vuna/Lint.vuna" 29 1 ("no matching clause for Vuna.Lint.editEnd")

let v_Vuna_dLint_deditLines = fun a0 -> match a0 with
  | (C_Vuna_dLint_dEdit (start, stop, lines)) -> lines
  | _ -> vuna_fail "./lib/Vuna/Lint.vuna" 31 1 ("no matching clause for Vuna.Lint.editLines")

let v_Vuna_dLint_dfindingLine = fun a0 -> match a0 with
  | (C_Vuna_dLint_dFinding (line, col, rule, message, edit)) -> line
  | _ -> vuna_fail "./lib/Vuna/Lint.vuna" 33 1 ("no matching clause for Vuna.Lint.findingLine")

let v_Vuna_dLint_dfindingCol = fun a0 -> match a0 with
  | (C_Vuna_dLint_dFinding (line, col, rule, message, edit)) -> col
  | _ -> vuna_fail "./lib/Vuna/Lint.vuna" 35 1 ("no matching clause for Vuna.Lint.findingCol")

let v_Vuna_dLint_dfindingRule = fun a0 -> match a0 with
  | (C_Vuna_dLint_dFinding (line, col, rule, message, edit)) -> rule
  | _ -> vuna_fail "./lib/Vuna/Lint.vuna" 37 1 ("no matching clause for Vuna.Lint.findingRule")

let v_Vuna_dLint_dfindingMessage = fun a0 -> match a0 with
  | (C_Vuna_dLint_dFinding (line, col, rule, message, edit)) -> message
  | _ -> vuna_fail "./lib/Vuna/Lint.vuna" 39 1 ("no matching clause for Vuna.Lint.findingMessage")

let v_Vuna_dLint_dfindingEdit = fun a0 -> match a0 with
  | (C_Vuna_dLint_dFinding (line, col, rule, message, edit)) -> edit
  | _ -> vuna_fail "./lib/Vuna/Lint.vuna" 41 1 ("no matching clause for Vuna.Lint.findingEdit")

let v_Vuna_dLint_dlitText = fun a0 -> match a0 with
  | (C_Vuna_dLint_dLitBranch (text, expr)) -> text
  | _ -> vuna_fail "./lib/Vuna/Lint.vuna" 43 1 ("no matching clause for Vuna.Lint.litText")

let v_Vuna_dLint_dlitExpr = fun a0 -> match a0 with
  | (C_Vuna_dLint_dLitBranch (text, expr)) -> expr
  | _ -> vuna_fail "./lib/Vuna/Lint.vuna" 45 1 ("no matching clause for Vuna.Lint.litExpr")

let v_Vuna_dLint_dheadName = fun a0 -> match a0 with
  | (C_Vuna_dLint_dIfHead (name, text, expr)) -> name
  | _ -> vuna_fail "./lib/Vuna/Lint.vuna" 47 1 ("no matching clause for Vuna.Lint.headName")

let v_Vuna_dLint_dheadText = fun a0 -> match a0 with
  | (C_Vuna_dLint_dIfHead (name, text, expr)) -> text
  | _ -> vuna_fail "./lib/Vuna/Lint.vuna" 49 1 ("no matching clause for Vuna.Lint.headText")

let v_Vuna_dLint_dheadExpr = fun a0 -> match a0 with
  | (C_Vuna_dLint_dIfHead (name, text, expr)) -> expr
  | _ -> vuna_fail "./lib/Vuna/Lint.vuna" 51 1 ("no matching clause for Vuna.Lint.headExpr")

let v_Vuna_dLint_denclosingLine = fun a0 -> match a0 with
  | (C_Vuna_dLint_dEnclosing (line, toks, kind)) -> line
  | _ -> vuna_fail "./lib/Vuna/Lint.vuna" 53 1 ("no matching clause for Vuna.Lint.enclosingLine")

let v_Vuna_dLint_denclosingToks = fun a0 -> match a0 with
  | (C_Vuna_dLint_dEnclosing (line, toks, kind)) -> toks
  | _ -> vuna_fail "./lib/Vuna/Lint.vuna" 55 1 ("no matching clause for Vuna.Lint.enclosingToks")

let v_Vuna_dLint_denclosingKind = fun a0 -> match a0 with
  | (C_Vuna_dLint_dEnclosing (line, toks, kind)) -> kind
  | _ -> vuna_fail "./lib/Vuna/Lint.vuna" 57 1 ("no matching clause for Vuna.Lint.enclosingKind")

let v_Vuna_dLint_dcaseBodyEnd = fun a0 -> match a0 with
  | (C_Vuna_dLint_dCaseBody (stop, lines)) -> stop
  | _ -> vuna_fail "./lib/Vuna/Lint.vuna" 59 1 ("no matching clause for Vuna.Lint.caseBodyEnd")

let v_Vuna_dLint_dcaseBodyLines = fun a0 -> match a0 with
  | (C_Vuna_dLint_dCaseBody (stop, lines)) -> lines
  | _ -> vuna_fail "./lib/Vuna/Lint.vuna" 61 1 ("no matching clause for Vuna.Lint.caseBodyLines")

let v_Vuna_dLint_disNilList = fun a0 -> match a0 with
  | ([]) -> true
  | ((x) :: (rest)) -> false
  | _ -> vuna_fail "./lib/Vuna/Lint.vuna" 63 1 ("no matching clause for Vuna.Lint.isNilList")

let v_Vuna_dLint_dnotBool = fun b -> if b then false else true

let v_Vuna_dLint_disSpaceChar = fun c -> (if (v_vuna_ueq_uint c 32) then true else (v_vuna_ueq_uint c 9))

let rec v_Vuna_dLint_dspaceChars = fun n -> if v_vuna_ule_uint n 0 then [] else (32) :: (v_Vuna_dLint_dspaceChars (bi_sub n 1))

let v_Vuna_dLint_dspaces = fun n -> bi_str_pack (v_Vuna_dLint_dspaceChars n)

let rec v_Vuna_dLint_dindentChars = fun a0 -> match a0 with
  | ([]) -> 0
  | ((c) :: (rest)) -> if v_vuna_ueq_uint c 32 then bi_add 1 (v_Vuna_dLint_dindentChars rest) else if v_vuna_ueq_uint c 9 then bi_add 1 (v_Vuna_dLint_dindentChars rest) else 0
  | _ -> vuna_fail "./lib/Vuna/Lint.vuna" 76 1 ("no matching clause for Vuna.Lint.indentChars")

let v_Vuna_dLint_dindentOf = fun line -> v_Vuna_dLint_dindentChars (bi_str_unpack line)

let rec v_Vuna_dLint_dblankChars = fun a0 -> match a0 with
  | ([]) -> true
  | ((c) :: (rest)) -> (if (v_Vuna_dLint_disSpaceChar c) then (v_Vuna_dLint_dblankChars rest) else false)
  | _ -> vuna_fail "./lib/Vuna/Lint.vuna" 85 1 ("no matching clause for Vuna.Lint.blankChars")

let v_Vuna_dLint_disBlankLine = fun line -> v_Vuna_dLint_dblankChars (bi_str_unpack line)

let rec v_Vuna_dLint_dsplitLinesFrom = fun a0 a1 a2 -> match (a0, a1, a2) with
  | ([], acc, cur) -> v_Vuna_dList_dreverse ((bi_str_pack (v_Vuna_dList_dreverse cur)) :: (acc))
  | ((c) :: (rest), acc, cur) -> if v_vuna_ueq_uint c 10 then v_Vuna_dLint_dsplitLinesFrom rest ((bi_str_pack (v_Vuna_dList_dreverse cur)) :: (acc)) [] else v_Vuna_dLint_dsplitLinesFrom rest acc ((c) :: (cur))
  | _ -> vuna_fail "./lib/Vuna/Lint.vuna" 91 1 ("no matching clause for Vuna.Lint.splitLinesFrom")

let v_Vuna_dLint_dsplitLines = fun source -> v_Vuna_dLint_dsplitLinesFrom (bi_str_unpack source) [] []

let rec v_Vuna_dLint_djoinLines = fun a0 -> match a0 with
  | ([]) -> ""
  | ((line) :: (rest)) -> (let vuna_cat0' = (line) in (let vuna_cat1' = ("\n") in (let vuna_cat2' = (v_Vuna_dLint_djoinLines rest) in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'])))
  | _ -> vuna_fail "./lib/Vuna/Lint.vuna" 97 1 ("no matching clause for Vuna.Lint.joinLines")

let rec v_Vuna_dLint_dnthLine = fun a0 a1 -> match (a0, a1) with
  | ([], n) -> ""
  | ((line) :: (rest), n) -> if v_vuna_ule_uint n 1 then line else v_Vuna_dLint_dnthLine rest (bi_sub n 1)
  | _ -> vuna_fail "./lib/Vuna/Lint.vuna" 101 1 ("no matching clause for Vuna.Lint.nthLine")

let v_Vuna_dLint_dlineAt = fun lines n -> v_Vuna_dLint_dnthLine lines n

let rec v_Vuna_dLint_dtakeChars = fun a0 a1 -> match (a0, a1) with
  | (n, []) -> []
  | (n, (c) :: (rest)) -> if v_vuna_ule_uint n 0 then [] else (c) :: (v_Vuna_dLint_dtakeChars (bi_sub n 1) rest)
  | _ -> vuna_fail "./lib/Vuna/Lint.vuna" 107 1 ("no matching clause for Vuna.Lint.takeChars")

let rec v_Vuna_dLint_ddropChars = fun n chars -> if v_vuna_ule_uint n 0 then chars else (match chars with
  | [] -> []
  | (c) :: (rest) -> v_Vuna_dLint_ddropChars (bi_sub n 1) rest
  | _ -> vuna_fail "./lib/Vuna/Lint.vuna" 114 5 ("case pattern match failure"))

let v_Vuna_dLint_dsliceChars = fun start count chars -> v_Vuna_dLint_dtakeChars count (v_Vuna_dLint_ddropChars start chars)

let v_Vuna_dLint_dsliceLine = fun start count line -> bi_str_pack (v_Vuna_dLint_dsliceChars start count (bi_str_unpack line))

let v_Vuna_dLint_ddropIndent = fun n line -> bi_str_pack (v_Vuna_dLint_ddropChars n (bi_str_unpack line))

let rec v_Vuna_dLint_dnthChar = fun a0 a1 -> match (a0, a1) with
  | (i, []) -> 0
  | (i, (c) :: (rest)) -> if v_vuna_ule_uint i 0 then c else v_Vuna_dLint_dnthChar (bi_sub i 1) rest
  | _ -> vuna_fail "./lib/Vuna/Lint.vuna" 124 1 ("no matching clause for Vuna.Lint.nthChar")

let rec v_Vuna_dLint_dtrimLen = fun chars n -> if v_vuna_ule_uint n 0 then 0 else if v_Vuna_dLint_disSpaceChar (v_Vuna_dLint_dnthChar (bi_sub n 1) chars) then v_Vuna_dLint_dtrimLen chars (bi_sub n 1) else n

let v_Vuna_dLint_dtrimEnd = fun line -> bi_str_pack (v_Vuna_dLint_dtakeChars (v_Vuna_dLint_dtrimLen (bi_str_unpack line) (v_Vuna_dList_dlength (bi_str_unpack line))) (bi_str_unpack line))

let rec v_Vuna_dLint_ddropSpaceChars = fun chars -> (match chars with
  | [] -> []
  | (c) :: (rest) -> if v_Vuna_dLint_disSpaceChar c then v_Vuna_dLint_ddropSpaceChars rest else chars
  | _ -> vuna_fail "./lib/Vuna/Lint.vuna" 136 3 ("case pattern match failure"))

let v_Vuna_dLint_dtrimStart = fun line -> bi_str_pack (v_Vuna_dLint_ddropSpaceChars (bi_str_unpack line))

let v_Vuna_dLint_dtrimBoth = fun line -> v_Vuna_dLint_dtrimStart (v_Vuna_dLint_dtrimEnd line)

let v_Vuna_dLint_dtextFromCol = fun line col -> v_Vuna_dLint_dtrimBoth (bi_str_pack (v_Vuna_dLint_ddropChars (bi_sub col 1) (bi_str_unpack line)))

let rec v_Vuna_dLint_dblankFill = fun n stop -> if v_vuna_ugt_uint n stop then [] else ("") :: (v_Vuna_dLint_dblankFill (bi_add n 1) stop)

let v_Vuna_dLint_dtailFromCol = fun line col -> bi_str_pack (v_Vuna_dLint_ddropChars (bi_sub col 1) (bi_str_unpack line))

let v_Vuna_dLint_dstartsLower = fun name -> (match bi_str_unpack name with
  | [] -> false
  | (c) :: (rest) -> (if (v_vuna_uge_uint c 97) then (v_vuna_ule_uint c 122) else false)
  | _ -> vuna_fail "./lib/Vuna/Lint.vuna" 151 3 ("case pattern match failure"))

let v_Vuna_dLint_dstartsUpper = fun name -> (match bi_str_unpack name with
  | [] -> false
  | (c) :: (rest) -> (if (v_vuna_uge_uint c 65) then (v_vuna_ule_uint c 90) else false)
  | _ -> vuna_fail "./lib/Vuna/Lint.vuna" 156 3 ("case pattern match failure"))

let rec v_Vuna_dLint_dprefixChars = fun a0 a1 -> match (a0, a1) with
  | ([], text) -> true
  | ((p) :: (prest), text) -> (match text with
  | [] -> false
  | (t) :: (trest) -> if v_vuna_ueq_uint p t then v_Vuna_dLint_dprefixChars prest trest else false
  | _ -> vuna_fail "./lib/Vuna/Lint.vuna" 164 3 ("case pattern match failure"))
  | _ -> vuna_fail "./lib/Vuna/Lint.vuna" 161 1 ("no matching clause for Vuna.Lint.prefixChars")

let rec v_Vuna_dLint_dcontainsSubChars = fun pat text -> (match text with
  | [] -> false
  | (c) :: (rest) -> if v_Vuna_dLint_dprefixChars pat text then true else v_Vuna_dLint_dcontainsSubChars pat rest
  | _ -> vuna_fail "./lib/Vuna/Lint.vuna" 170 3 ("case pattern match failure"))

let rec v_Vuna_dLint_dcontainsChar = fun a0 a1 -> match (a0, a1) with
  | (c, []) -> false
  | (c, (x) :: (rest)) -> if v_vuna_ueq_uint x c then true else v_Vuna_dLint_dcontainsChar c rest
  | _ -> vuna_fail "./lib/Vuna/Lint.vuna" 175 1 ("no matching clause for Vuna.Lint.containsChar")

let v_Vuna_dLint_dhasComment = fun line -> (if (v_Vuna_dLint_dcontainsSubChars (bi_str_unpack "--") (bi_str_unpack line)) then true else (v_Vuna_dLint_dcontainsSubChars (bi_str_unpack "{-") (bi_str_unpack line)))

let v_Vuna_dLint_dhasTabOrCR = fun line -> (if (v_Vuna_dLint_dcontainsChar 9 (bi_str_unpack line)) then true else (v_Vuna_dLint_dcontainsChar 13 (bi_str_unpack line)))

let v_Vuna_dLint_dposLine = fun a0 -> match a0 with
  | (C_Vuna_dBase_dPos (line, col)) -> line
  | _ -> vuna_fail "./lib/Vuna/Lint.vuna" 183 1 ("no matching clause for Vuna.Lint.posLine")

let v_Vuna_dLint_dposCol = fun a0 -> match a0 with
  | (C_Vuna_dBase_dPos (line, col)) -> col
  | _ -> vuna_fail "./lib/Vuna/Lint.vuna" 185 1 ("no matching clause for Vuna.Lint.posCol")

let v_Vuna_dLint_dtokPos = fun a0 -> match a0 with
  | (C_Vuna_dLexer_dPTok (t, p)) -> p
  | _ -> vuna_fail "./lib/Vuna/Lint.vuna" 187 1 ("no matching clause for Vuna.Lint.tokPos")

let v_Vuna_dLint_dtokLine = fun tok -> v_Vuna_dLint_dposLine (v_Vuna_dLint_dtokPos tok)

let v_Vuna_dLint_dtokCol = fun tok -> v_Vuna_dLint_dposCol (v_Vuna_dLint_dtokPos tok)

let v_Vuna_dLint_dtokIsKw = fun tok key -> (match tok with
  | C_Vuna_dLexer_dPTok (C_Vuna_dLexer_dTKw (x), p) -> v_vuna_ueq_ustr x key
  | _ -> false
  | _ -> vuna_fail "./lib/Vuna/Lint.vuna" 194 3 ("case pattern match failure"))

let v_Vuna_dLint_dtokIsSym = fun tok sym -> (match tok with
  | C_Vuna_dLexer_dPTok (C_Vuna_dLexer_dTSym (x), p) -> v_vuna_ueq_ustr x sym
  | _ -> false
  | _ -> vuna_fail "./lib/Vuna/Lint.vuna" 199 3 ("case pattern match failure"))

let v_Vuna_dLint_dtokIdentOf = fun tok -> (match tok with
  | C_Vuna_dLexer_dPTok (C_Vuna_dLexer_dTIdent (x), p) -> C_Vuna_dMaybe_dJust (x)
  | _ -> C_Vuna_dMaybe_dNothing
  | _ -> vuna_fail "./lib/Vuna/Lint.vuna" 204 3 ("case pattern match failure"))

let v_Vuna_dLint_dtokStrOf = fun tok -> (match tok with
  | C_Vuna_dLexer_dPTok (C_Vuna_dLexer_dTStr (x), p) -> C_Vuna_dMaybe_dJust (x)
  | _ -> C_Vuna_dMaybe_dNothing
  | _ -> vuna_fail "./lib/Vuna/Lint.vuna" 209 3 ("case pattern match failure"))

let v_Vuna_dLint_dtokIntOf = fun tok -> (match tok with
  | C_Vuna_dLexer_dPTok (C_Vuna_dLexer_dTInt (x), p) -> C_Vuna_dMaybe_dJust (x)
  | _ -> C_Vuna_dMaybe_dNothing
  | _ -> vuna_fail "./lib/Vuna/Lint.vuna" 214 3 ("case pattern match failure"))

let v_Vuna_dLint_dheadToken = fun a0 -> match a0 with
  | ([]) -> C_Vuna_dMaybe_dNothing
  | ((t) :: (rest)) -> C_Vuna_dMaybe_dJust (t)
  | _ -> vuna_fail "./lib/Vuna/Lint.vuna" 218 1 ("no matching clause for Vuna.Lint.headToken")

let rec v_Vuna_dLint_dlastToken = fun a0 -> match a0 with
  | ([]) -> C_Vuna_dMaybe_dNothing
  | ((t) :: ([])) -> C_Vuna_dMaybe_dJust (t)
  | ((t) :: (rest)) -> v_Vuna_dLint_dlastToken rest
  | _ -> vuna_fail "./lib/Vuna/Lint.vuna" 222 1 ("no matching clause for Vuna.Lint.lastToken")

let rec v_Vuna_dLint_dfilterTokLine = fun a0 a1 -> match (a0, a1) with
  | ([], n) -> []
  | ((t) :: (rest), n) -> if v_vuna_ueq_uint (v_Vuna_dLint_dtokLine t) n then (t) :: (v_Vuna_dLint_dfilterTokLine rest n) else v_Vuna_dLint_dfilterTokLine rest n
  | _ -> vuna_fail "./lib/Vuna/Lint.vuna" 230 1 ("no matching clause for Vuna.Lint.filterTokLine")

let v_Vuna_dLint_dtokensOnLine = fun toks n -> v_Vuna_dLint_dfilterTokLine toks n

let rec v_Vuna_dLint_dhasSym = fun a0 a1 -> match (a0, a1) with
  | ([], sym) -> false
  | ((t) :: (rest), sym) -> if v_Vuna_dLint_dtokIsSym t sym then true else v_Vuna_dLint_dhasSym rest sym
  | _ -> vuna_fail "./lib/Vuna/Lint.vuna" 240 1 ("no matching clause for Vuna.Lint.hasSym")

let v_Vuna_dLint_dtailOf = fun a0 -> match a0 with
  | ([]) -> []
  | ((t) :: (rest)) -> rest
  | _ -> vuna_fail "./lib/Vuna/Lint.vuna" 244 1 ("no matching clause for Vuna.Lint.tailOf")

let rec v_Vuna_dLint_dsplitAtSymGo = fun a0 a1 a2 -> match (a0, a1, a2) with
  | (sym, [], acc) -> C_Vuna_dMaybe_dNothing
  | (sym, (t) :: (rest), acc) -> if v_Vuna_dLint_dtokIsSym t sym then C_Vuna_dMaybe_dJust (C_Vuna_dPair_dPair (v_Vuna_dList_dreverse acc, C_Vuna_dPair_dPair (t, rest))) else v_Vuna_dLint_dsplitAtSymGo sym rest ((t) :: (acc))
  | _ -> vuna_fail "./lib/Vuna/Lint.vuna" 250 1 ("no matching clause for Vuna.Lint.splitAtSymGo")

let v_Vuna_dLint_dsplitAtSym = fun sym toks -> v_Vuna_dLint_dsplitAtSymGo sym toks []

let rec v_Vuna_dLint_dcountIdent = fun a0 a1 -> match (a0, a1) with
  | (name, []) -> 0
  | (name, (t) :: (rest)) -> (match v_Vuna_dLint_dtokIdentOf t with
  | C_Vuna_dMaybe_dJust (other) -> if v_vuna_ueq_ustr other name then bi_add 1 (v_Vuna_dLint_dcountIdent name rest) else v_Vuna_dLint_dcountIdent name rest
  | C_Vuna_dMaybe_dNothing -> v_Vuna_dLint_dcountIdent name rest
  | _ -> vuna_fail "./lib/Vuna/Lint.vuna" 259 3 ("case pattern match failure"))
  | _ -> vuna_fail "./lib/Vuna/Lint.vuna" 256 1 ("no matching clause for Vuna.Lint.countIdent")

let rec v_Vuna_dLint_dbodyMentionsVar = fun toks var start stop -> if v_vuna_uge_uint start stop then false else if v_vuna_ugt_uint (v_Vuna_dLint_dcountIdent var (v_Vuna_dLint_dtokensOnLine toks start)) 0 then true else v_Vuna_dLint_dbodyMentionsVar toks var (bi_add start 1) stop

let rec v_Vuna_dLint_dlowercaseIdents = fun a0 -> match a0 with
  | ([]) -> []
  | ((t) :: (rest)) -> (match v_Vuna_dLint_dtokIdentOf t with
  | C_Vuna_dMaybe_dJust (name) -> if (if (v_Vuna_dLint_dstartsLower name) then (v_vuna_uneq_ustr name "_") else false) then (name) :: (v_Vuna_dLint_dlowercaseIdents rest) else v_Vuna_dLint_dlowercaseIdents rest
  | C_Vuna_dMaybe_dNothing -> v_Vuna_dLint_dlowercaseIdents rest
  | _ -> vuna_fail "./lib/Vuna/Lint.vuna" 266 3 ("case pattern match failure"))
  | _ -> vuna_fail "./lib/Vuna/Lint.vuna" 263 1 ("no matching clause for Vuna.Lint.lowercaseIdents")

let rec v_Vuna_dLint_dintersects = fun a0 a1 -> match (a0, a1) with
  | ([], ys) -> false
  | ((x) :: (rest), ys) -> if v_Vuna_dList_dmemName x ys then true else v_Vuna_dLint_dintersects rest ys
  | _ -> vuna_fail "./lib/Vuna/Lint.vuna" 272 1 ("no matching clause for Vuna.Lint.intersects")

let rec v_Vuna_dLint_dsimpleFrom = fun a0 a1 -> match (a0, a1) with
  | ([], depth) -> v_vuna_ueq_uint depth 0
  | ((t) :: (rest), depth) -> (match t with
  | C_Vuna_dLexer_dPTok (C_Vuna_dLexer_dTSym (s), p) -> if (if (v_vuna_ueq_ustr s "(") then true else (v_vuna_ueq_ustr s "[")) then v_Vuna_dLint_dsimpleFrom rest (bi_add depth 1) else if (if (v_vuna_ueq_ustr s ")") then true else (v_vuna_ueq_ustr s "]")) then if v_vuna_ugt_uint depth 0 then v_Vuna_dLint_dsimpleFrom rest (bi_sub depth 1) else false else v_Vuna_dLint_dsimpleFrom rest depth
  | _ -> v_Vuna_dLint_dsimpleFrom rest depth
  | _ -> vuna_fail "./lib/Vuna/Lint.vuna" 282 3 ("case pattern match failure"))
  | _ -> vuna_fail "./lib/Vuna/Lint.vuna" 279 1 ("no matching clause for Vuna.Lint.simpleFrom")

let rec v_Vuna_dLint_dnoKeyword = fun a0 -> match a0 with
  | ([]) -> true
  | ((t) :: (rest)) -> (match t with
  | C_Vuna_dLexer_dPTok (C_Vuna_dLexer_dTKw (x), p) -> false
  | _ -> v_Vuna_dLint_dnoKeyword rest
  | _ -> vuna_fail "./lib/Vuna/Lint.vuna" 292 3 ("case pattern match failure"))
  | _ -> vuna_fail "./lib/Vuna/Lint.vuna" 289 1 ("no matching clause for Vuna.Lint.noKeyword")

let v_Vuna_dLint_disSimpleTokens = fun toks -> (if (v_Vuna_dLint_dsimpleFrom toks 0) then (v_Vuna_dLint_dnoKeyword toks) else false)

let v_Vuna_dLint_dstartsWithIf = fun toks -> (match toks with
  | (t) :: (rest) -> v_Vuna_dLint_dtokIsKw t "if"
  | [] -> false
  | _ -> vuna_fail "./lib/Vuna/Lint.vuna" 297 3 ("case pattern match failure"))

let v_Vuna_dLint_dparseIfHead = fun toks line -> (match toks with
  | [] -> C_Vuna_dMaybe_dNothing
  | (t1) :: (rest) -> (match v_Vuna_dLint_dtokIdentOf t1 with
  | C_Vuna_dMaybe_dNothing -> C_Vuna_dMaybe_dNothing
  | C_Vuna_dMaybe_dJust (name) -> (match rest with
  | [] -> C_Vuna_dMaybe_dNothing
  | (t2) :: (rest2) -> if v_Vuna_dLint_dtokIsSym t2 "==" then (match rest2 with
  | [] -> C_Vuna_dMaybe_dNothing
  | (t3) :: (rest3) -> (match v_Vuna_dLint_dtokStrOf t3 with
  | C_Vuna_dMaybe_dNothing -> C_Vuna_dMaybe_dNothing
  | C_Vuna_dMaybe_dJust (lit) -> (match rest3 with
  | [] -> C_Vuna_dMaybe_dNothing
  | (t4) :: (rest4) -> if v_Vuna_dLint_dtokIsKw t4 "then" then if v_Vuna_dLint_disNilList rest4 then C_Vuna_dMaybe_dNothing else if v_Vuna_dLint_disSimpleTokens rest4 then C_Vuna_dMaybe_dJust (C_Vuna_dLint_dIfHead (name, v_Vuna_dLint_dtrimEnd (v_Vuna_dLint_dsliceLine (bi_sub (v_Vuna_dLint_dtokCol t3) 1) (bi_sub (v_Vuna_dLint_dtokCol t4) (v_Vuna_dLint_dtokCol t3)) line), v_Vuna_dLint_dtextFromCol line (bi_add (v_Vuna_dLint_dtokCol t4) 4))) else C_Vuna_dMaybe_dNothing else C_Vuna_dMaybe_dNothing
  | _ -> vuna_fail "./lib/Vuna/Lint.vuna" 318 25 ("case pattern match failure"))
  | _ -> vuna_fail "./lib/Vuna/Lint.vuna" 315 21 ("case pattern match failure"))
  | _ -> vuna_fail "./lib/Vuna/Lint.vuna" 312 17 ("case pattern match failure")) else C_Vuna_dMaybe_dNothing
  | _ -> vuna_fail "./lib/Vuna/Lint.vuna" 308 11 ("case pattern match failure"))
  | _ -> vuna_fail "./lib/Vuna/Lint.vuna" 305 7 ("case pattern match failure"))
  | _ -> vuna_fail "./lib/Vuna/Lint.vuna" 302 3 ("case pattern match failure"))

let v_Vuna_dLint_dfinalElseText = fun line elseTok rest -> if v_Vuna_dLint_disNilList rest then C_Vuna_dMaybe_dNothing else if v_Vuna_dLint_dstartsWithIf rest then C_Vuna_dMaybe_dNothing else if v_Vuna_dLint_disSimpleTokens rest then C_Vuna_dMaybe_dJust (v_Vuna_dLint_dtextFromCol line (bi_add (v_Vuna_dLint_dtokCol elseTok) 4)) else C_Vuna_dMaybe_dNothing

let v_Vuna_dLint_drenderLitBranch = fun indent branch -> (let vuna_cat0' = (v_Vuna_dLint_dspaces (bi_add indent 2)) in (let vuna_cat1' = (v_Vuna_dLint_dlitText branch) in (let vuna_cat2' = (" => ") in (let vuna_cat3' = (v_Vuna_dLint_dlitExpr branch) in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3']))))

let v_Vuna_dLint_dmakeChainFinding = fun firstLine indent scrutinee acc defaultText lastLine -> (let branches = v_Vuna_dList_dreverse acc in if v_vuna_ult_uint (v_Vuna_dList_dlength branches) 2 then [] else (let newLines = v_Vuna_dList_dappend (((let vuna_cat0' = (v_Vuna_dLint_dspaces indent) in (let vuna_cat1' = ("case ") in (let vuna_cat2' = (scrutinee) in (let vuna_cat3' = (" of") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3']))))) :: ([])) (v_Vuna_dList_dappend (v_Vuna_dList_dmap (fun b -> v_Vuna_dLint_drenderLitBranch indent b) branches) (((let vuna_cat0' = (v_Vuna_dLint_dspaces (bi_add indent 2)) in (let vuna_cat1' = ("_ => ") in (let vuna_cat2' = (defaultText) in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'])))) :: ([]))) in (C_Vuna_dLint_dFinding (firstLine, bi_add indent 1, "literal-if-chain", (let vuna_cat0' = ("if/else-if chain on `") in (let vuna_cat1' = (scrutinee) in (let vuna_cat2' = ("` can be a case with literal patterns") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2']))), C_Vuna_dMaybe_dJust (C_Vuna_dLint_dEdit (firstLine, lastLine, newLines)))) :: ([])))

let rec v_Vuna_dLint_dfinishChain = fun lines toks lastLine n indent firstLine scrutinee acc -> if v_vuna_ugt_uint n lastLine then [] else (let line = v_Vuna_dLint_dlineAt lines n in (let ts = v_Vuna_dLint_dtokensOnLine toks n in if v_Vuna_dLint_disNilList ts then [] else if v_vuna_uneq_uint (v_Vuna_dLint_dindentOf line) indent then [] else if v_Vuna_dLint_dhasComment line then [] else (match ts with
  | [] -> []
  | (first) :: (rest) -> if v_Vuna_dLint_dtokIsKw first "else" then (match rest with
  | [] -> []
  | (second) :: (rest2) -> if v_Vuna_dLint_dtokIsKw second "if" then (match v_Vuna_dLint_dparseIfHead rest2 line with
  | C_Vuna_dMaybe_dNothing -> []
  | C_Vuna_dMaybe_dJust (head) -> if v_vuna_ueq_ustr (v_Vuna_dLint_dheadName head) scrutinee then v_Vuna_dLint_dfinishChain lines toks lastLine (bi_add n 1) indent firstLine scrutinee ((C_Vuna_dLint_dLitBranch (v_Vuna_dLint_dheadText head, v_Vuna_dLint_dheadExpr head)) :: (acc)) else []
  | _ -> vuna_fail "./lib/Vuna/Lint.vuna" 361 22 ("case pattern match failure")) else (match v_Vuna_dLint_dfinalElseText line first rest with
  | C_Vuna_dMaybe_dNothing -> []
  | C_Vuna_dMaybe_dJust (text) -> v_Vuna_dLint_dmakeChainFinding firstLine indent scrutinee acc text n
  | _ -> vuna_fail "./lib/Vuna/Lint.vuna" 368 22 ("case pattern match failure"))
  | _ -> vuna_fail "./lib/Vuna/Lint.vuna" 357 16 ("case pattern match failure")) else []
  | _ -> vuna_fail "./lib/Vuna/Lint.vuna" 353 10 ("case pattern match failure"))))

let v_Vuna_dLint_difChainAt = fun lines toks lastLine n -> (let line = v_Vuna_dLint_dlineAt lines n in (let ts = v_Vuna_dLint_dtokensOnLine toks n in if v_Vuna_dLint_disNilList ts then [] else if v_Vuna_dLint_dhasComment line then [] else (match ts with
  | [] -> []
  | (first) :: (rest) -> if (if (v_Vuna_dLint_dtokIsKw first "if") then (v_vuna_ueq_uint (v_Vuna_dLint_dtokCol first) (bi_add (v_Vuna_dLint_dindentOf line) 1)) else false) then (match v_Vuna_dLint_dparseIfHead rest line with
  | C_Vuna_dMaybe_dNothing -> []
  | C_Vuna_dMaybe_dJust (head) -> v_Vuna_dLint_dfinishChain lines toks lastLine (bi_add n 1) (v_Vuna_dLint_dindentOf line) n (v_Vuna_dLint_dheadName head) ((C_Vuna_dLint_dLitBranch (v_Vuna_dLint_dheadText head, v_Vuna_dLint_dheadExpr head)) :: ([]))
  | _ -> vuna_fail "./lib/Vuna/Lint.vuna" 383 14 ("case pattern match failure")) else []
  | _ -> vuna_fail "./lib/Vuna/Lint.vuna" 379 8 ("case pattern match failure"))))

let rec v_Vuna_dLint_dscanIfChains = fun lines toks n lastLine -> if v_vuna_ugt_uint n lastLine then [] else v_Vuna_dList_dappend (v_Vuna_dLint_difChainAt lines toks lastLine n) (v_Vuna_dLint_dscanIfChains lines toks (bi_add n 1) lastLine)

let v_Vuna_dLint_dcaseVarOf = fun toks -> (match toks with
  | [] -> C_Vuna_dMaybe_dNothing
  | (t1) :: (rest) -> if v_Vuna_dLint_dtokIsKw t1 "case" then (match rest with
  | [] -> C_Vuna_dMaybe_dNothing
  | (t2) :: (rest2) -> (match v_Vuna_dLint_dtokIdentOf t2 with
  | C_Vuna_dMaybe_dNothing -> C_Vuna_dMaybe_dNothing
  | C_Vuna_dMaybe_dJust (name) -> (match rest2 with
  | [] -> C_Vuna_dMaybe_dNothing
  | (t3) :: (rest3) -> if (if (v_Vuna_dLint_dtokIsKw t3 "of") then (v_Vuna_dLint_disNilList rest3) else false) then C_Vuna_dMaybe_dJust (name) else C_Vuna_dMaybe_dNothing
  | _ -> vuna_fail "./lib/Vuna/Lint.vuna" 403 17 ("case pattern match failure"))
  | _ -> vuna_fail "./lib/Vuna/Lint.vuna" 400 13 ("case pattern match failure"))
  | _ -> vuna_fail "./lib/Vuna/Lint.vuna" 397 9 ("case pattern match failure")) else C_Vuna_dMaybe_dNothing
  | _ -> vuna_fail "./lib/Vuna/Lint.vuna" 393 3 ("case pattern match failure"))

let v_Vuna_dLint_denclosingClause = fun lines toks headLine -> if v_vuna_ult_uint headLine 1 then C_Vuna_dMaybe_dNothing else (let line = v_Vuna_dLint_dlineAt lines headLine in if v_Vuna_dLint_disBlankLine line then C_Vuna_dMaybe_dNothing else if v_vuna_uneq_uint (v_Vuna_dLint_dindentOf line) 0 then C_Vuna_dMaybe_dNothing else (let ts = v_Vuna_dLint_dtokensOnLine toks headLine in if (if (v_Vuna_dLint_dhasSym ts "=") then (v_Vuna_dLint_dnotBool (v_Vuna_dLint_dhasSym ts "=>")) else false) then C_Vuna_dMaybe_dJust (C_Vuna_dLint_dEnclosing (headLine, ts, "clause")) else C_Vuna_dMaybe_dNothing))

let v_Vuna_dLint_denclosingAlt = fun lines toks headLine expectedIndent -> if v_vuna_ult_uint headLine 1 then C_Vuna_dMaybe_dNothing else (let line = v_Vuna_dLint_dlineAt lines headLine in if v_Vuna_dLint_disBlankLine line then C_Vuna_dMaybe_dNothing else if v_vuna_uneq_ugeneric (v_Vuna_dLint_dindentOf line) expectedIndent then C_Vuna_dMaybe_dNothing else (let ts = v_Vuna_dLint_dtokensOnLine toks headLine in if v_Vuna_dLint_dhasSym ts "\\" then C_Vuna_dMaybe_dNothing else (match v_Vuna_dLint_dlastToken ts with
  | C_Vuna_dMaybe_dNothing -> C_Vuna_dMaybe_dNothing
  | C_Vuna_dMaybe_dJust (t) -> if v_Vuna_dLint_dtokIsSym t "=>" then C_Vuna_dMaybe_dJust (C_Vuna_dLint_dEnclosing (headLine, ts, "alt")) else C_Vuna_dMaybe_dNothing
  | _ -> vuna_fail "./lib/Vuna/Lint.vuna" 430 15 ("case pattern match failure"))))

let v_Vuna_dLint_denclosingOf = fun lines toks caseLine indent -> if v_vuna_ueq_uint indent 2 then v_Vuna_dLint_denclosingClause lines toks (bi_sub caseLine 1) else v_Vuna_dLint_denclosingAlt lines toks (bi_sub caseLine 1) (bi_sub indent 2)

let v_Vuna_dLint_dctorOrLitPattern = fun toks -> (match toks with
  | [] -> false
  | (t) :: (rest) -> (match v_Vuna_dLint_dtokIdentOf t with
  | C_Vuna_dMaybe_dJust (name) -> v_Vuna_dLint_dstartsUpper name
  | C_Vuna_dMaybe_dNothing -> (match v_Vuna_dLint_dtokIntOf t with
  | C_Vuna_dMaybe_dJust (n) -> true
  | C_Vuna_dMaybe_dNothing -> (match v_Vuna_dLint_dtokStrOf t with
  | C_Vuna_dMaybe_dJust (s) -> true
  | C_Vuna_dMaybe_dNothing -> false
  | _ -> vuna_fail "./lib/Vuna/Lint.vuna" 448 15 ("case pattern match failure"))
  | _ -> vuna_fail "./lib/Vuna/Lint.vuna" 445 11 ("case pattern match failure"))
  | _ -> vuna_fail "./lib/Vuna/Lint.vuna" 442 7 ("case pattern match failure"))
  | _ -> vuna_fail "./lib/Vuna/Lint.vuna" 439 3 ("case pattern match failure"))

let rec v_Vuna_dLint_dscanBody = fun lines toks lastLine n indent acc -> if v_vuna_ugt_uint n lastLine then C_Vuna_dLint_dCaseBody (n, v_Vuna_dList_dreverse acc) else (let line = v_Vuna_dLint_dlineAt lines n in if v_Vuna_dLint_disBlankLine line then v_Vuna_dLint_dscanBody lines toks lastLine (bi_add n 1) indent ((line) :: (acc)) else if v_vuna_ugt_ugeneric (v_Vuna_dLint_dindentOf line) indent then v_Vuna_dLint_dscanBody lines toks lastLine (bi_add n 1) indent ((line) :: (acc)) else C_Vuna_dLint_dCaseBody (n, v_Vuna_dList_dreverse acc))

let rec v_Vuna_dLint_dbodyIndentOk = fun lines n stop indent -> if v_vuna_uge_uint n stop then true else (let line = v_Vuna_dLint_dlineAt lines n in if v_Vuna_dLint_disBlankLine line then v_Vuna_dLint_dbodyIndentOk lines (bi_add n 1) stop indent else if (if (v_Vuna_dLint_dhasComment line) then true else (v_Vuna_dLint_dhasTabOrCR line)) then false else if v_vuna_ult_uint (v_Vuna_dLint_dindentOf line) (bi_add indent 4) then false else v_Vuna_dLint_dbodyIndentOk lines (bi_add n 1) stop indent)

let rec v_Vuna_dLint_dnoSiblingAlt = fun lines toks n stop indent -> if v_vuna_uge_uint n stop then true else (let line = v_Vuna_dLint_dlineAt lines n in (let ts = v_Vuna_dLint_dtokensOnLine toks n in if v_Vuna_dLint_disBlankLine line then v_Vuna_dLint_dnoSiblingAlt lines toks (bi_add n 1) stop indent else if (if (v_vuna_ueq_uint (v_Vuna_dLint_dindentOf line) (bi_add indent 2)) then (v_Vuna_dLint_dhasSym ts "=>") else false) then false else v_Vuna_dLint_dnoSiblingAlt lines toks (bi_add n 1) stop indent))

let v_Vuna_dLint_dblockBodyOk = fun lines toks lastLine start stop indent -> if v_vuna_uge_ugeneric start stop then false else if (if (v_Vuna_dLint_dbodyIndentOk lines start stop indent) then (v_Vuna_dLint_dnoSiblingAlt lines toks start stop indent) else false) then true else false

let rec v_Vuna_dLint_dnextNonBlank = fun lines n lastLine -> if v_vuna_ugt_uint n lastLine then n else (let line = v_Vuna_dLint_dlineAt lines n in if v_Vuna_dLint_disBlankLine line then v_Vuna_dLint_dnextNonBlank lines (bi_add n 1) lastLine else n)

let v_Vuna_dLint_dtokenText = fun tok -> (match tok with
  | C_Vuna_dLexer_dPTok (C_Vuna_dLexer_dTIdent (x), p) -> x
  | C_Vuna_dLexer_dPTok (C_Vuna_dLexer_dTKw (x), p) -> x
  | C_Vuna_dLexer_dPTok (C_Vuna_dLexer_dTInt (x), p) -> bi_str_from_int x
  | C_Vuna_dLexer_dPTok (C_Vuna_dLexer_dTStr (x), p) -> x
  | C_Vuna_dLexer_dPTok (C_Vuna_dLexer_dTSym (x), p) -> x
  | C_Vuna_dLexer_dPTok (C_Vuna_dLexer_dTEof, p) -> ""
  | _ -> vuna_fail "./lib/Vuna/Lint.vuna" 492 3 ("case pattern match failure"))

let v_Vuna_dLint_dtailTokenCol = fun tok -> bi_add (v_Vuna_dLint_dtokCol tok) (bi_str_length (v_Vuna_dLint_dtokenText tok))

let v_Vuna_dLint_dreplaceIdentInLine = fun line tok replacement -> (let col = v_Vuna_dLint_dtokCol tok in let len = bi_str_length (v_Vuna_dLint_dtokenText tok) in let prefix = v_Vuna_dLint_dsliceLine 0 (bi_sub col 1) line in let suffix = v_Vuna_dLint_dtailFromCol line (bi_add col len) in (let vuna_cat0' = (prefix) in (let vuna_cat1' = (replacement) in (let vuna_cat2' = (suffix) in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2']))))

let v_Vuna_dLint_dclauseHeadPatterns = fun toks -> (match v_Vuna_dLint_dsplitAtSym "=" toks with
  | C_Vuna_dMaybe_dNothing -> C_Vuna_dMaybe_dNothing
  | C_Vuna_dMaybe_dJust (C_Vuna_dPair_dPair (before, C_Vuna_dPair_dPair (arrow, after))) -> if v_Vuna_dLint_disNilList after then (match before with
  | [] -> C_Vuna_dMaybe_dNothing
  | (fn) :: (rest) -> C_Vuna_dMaybe_dJust (C_Vuna_dPair_dPair (v_Vuna_dLint_dtokenText fn, rest))
  | _ -> vuna_fail "./lib/Vuna/Lint.vuna" 512 9 ("case pattern match failure")) else C_Vuna_dMaybe_dNothing
  | _ -> vuna_fail "./lib/Vuna/Lint.vuna" 508 3 ("case pattern match failure"))

let v_Vuna_dLint_daltHeadPatterns = fun toks -> (match v_Vuna_dLint_dsplitAtSym "=>" toks with
  | C_Vuna_dMaybe_dNothing -> C_Vuna_dMaybe_dNothing
  | C_Vuna_dMaybe_dJust (C_Vuna_dPair_dPair (before, C_Vuna_dPair_dPair (arrow, after))) -> if v_Vuna_dLint_disNilList after then C_Vuna_dMaybe_dJust (before) else C_Vuna_dMaybe_dNothing
  | _ -> vuna_fail "./lib/Vuna/Lint.vuna" 518 3 ("case pattern match failure"))

let v_Vuna_dLint_dlastClauseCheck = fun lines toks lastLine stop fnName -> (let next = v_Vuna_dLint_dnextNonBlank lines stop lastLine in if v_vuna_ugt_uint next lastLine then true else (let line = v_Vuna_dLint_dlineAt lines next in if v_vuna_uneq_uint (v_Vuna_dLint_dindentOf line) 0 then false else (let ts = v_Vuna_dLint_dtokensOnLine toks next in (match v_Vuna_dLint_dheadToken ts with
  | C_Vuna_dMaybe_dNothing -> false
  | C_Vuna_dMaybe_dJust (t) -> (match v_Vuna_dLint_dtokIdentOf t with
  | C_Vuna_dMaybe_dJust (other) -> v_Vuna_dLint_dnotBool (v_vuna_ueq_ustr other fnName)
  | C_Vuna_dMaybe_dNothing -> true
  | _ -> vuna_fail "./lib/Vuna/Lint.vuna" 533 28 ("case pattern match failure"))
  | _ -> vuna_fail "./lib/Vuna/Lint.vuna" 531 16 ("case pattern match failure")))))

let v_Vuna_dLint_dlastAltCheck = fun lines toks lastLine stop indent -> (let next = v_Vuna_dLint_dnextNonBlank lines stop lastLine in if v_vuna_ugt_uint next lastLine then true else (let line = v_Vuna_dLint_dlineAt lines next in (let ind = v_Vuna_dLint_dindentOf line in if v_vuna_ueq_uint ind (bi_sub indent 2) then if v_Vuna_dLint_dhasSym (v_Vuna_dLint_dtokensOnLine toks next) "=>" then false else true else if v_vuna_ult_uint ind (bi_sub indent 2) then true else false)))

let rec v_Vuna_dLint_dlinesClean = fun lines start stop -> if v_vuna_ugt_uint start stop then true else (let line = v_Vuna_dLint_dlineAt lines start in if (if (v_Vuna_dLint_dhasComment line) then true else (v_Vuna_dLint_dhasTabOrCR line)) then false else v_Vuna_dLint_dlinesClean lines (bi_add start 1) stop)

let v_Vuna_dLint_dheadOfTokens = fun a0 -> match a0 with
  | ([]) -> C_Vuna_dLexer_dPTok (C_Vuna_dLexer_dTEof, C_Vuna_dBase_dPos (1, 1))
  | ((t) :: (rest)) -> t
  | _ -> vuna_fail "./lib/Vuna/Lint.vuna" 579 1 ("no matching clause for Vuna.Lint.headOfTokens")

let rec v_Vuna_dLint_dtokenOfVar = fun a0 a1 -> match (a0, a1) with
  | (name, []) -> C_Vuna_dMaybe_dNothing
  | (name, (t) :: (rest)) -> (match v_Vuna_dLint_dtokIdentOf t with
  | C_Vuna_dMaybe_dJust (other) -> if v_vuna_ueq_ustr other name then C_Vuna_dMaybe_dJust (t) else v_Vuna_dLint_dtokenOfVar name rest
  | C_Vuna_dMaybe_dNothing -> v_Vuna_dLint_dtokenOfVar name rest
  | _ -> vuna_fail "./lib/Vuna/Lint.vuna" 639 3 ("case pattern match failure"))
  | _ -> vuna_fail "./lib/Vuna/Lint.vuna" 636 1 ("no matching clause for Vuna.Lint.tokenOfVar")

let rec v_Vuna_dLint_dremoveName = fun a0 a1 -> match (a0, a1) with
  | (name, []) -> []
  | (name, (x) :: (rest)) -> if v_vuna_ueq_ustr x name then v_Vuna_dLint_dremoveName name rest else (x) :: (v_Vuna_dLint_dremoveName name rest)
  | _ -> vuna_fail "./lib/Vuna/Lint.vuna" 643 1 ("no matching clause for Vuna.Lint.removeName")

let v_Vuna_dLint_denclosingPatterns = fun kind headToks -> if v_vuna_ueq_ustr kind "clause" then (match v_Vuna_dLint_dclauseHeadPatterns headToks with
  | C_Vuna_dMaybe_dNothing -> C_Vuna_dMaybe_dNothing
  | C_Vuna_dMaybe_dJust (C_Vuna_dPair_dPair (fnName, pats)) -> C_Vuna_dMaybe_dJust (C_Vuna_dPair_dPair (fnName, pats))
  | _ -> vuna_fail "./lib/Vuna/Lint.vuna" 650 5 ("case pattern match failure")) else (match v_Vuna_dLint_daltHeadPatterns headToks with
  | C_Vuna_dMaybe_dNothing -> C_Vuna_dMaybe_dNothing
  | C_Vuna_dMaybe_dJust (pats) -> C_Vuna_dMaybe_dJust (C_Vuna_dPair_dPair ("", pats))
  | _ -> vuna_fail "./lib/Vuna/Lint.vuna" 655 5 ("case pattern match failure"))

let v_Vuna_dLint_denclosingIsLast = fun lines toks lastLine stop indent kind fnOrKind -> if v_vuna_ueq_ustr kind "clause" then v_Vuna_dLint_dlastClauseCheck lines toks lastLine stop fnOrKind else v_Vuna_dLint_dlastAltCheck lines toks lastLine stop indent

let v_Vuna_dLint_dredundantFinding = fun lines toks lastLine caseLine indent var enclosing patToks patText mentions stop newBody -> (let headLine = v_Vuna_dLint_denclosingLine enclosing in let headToks = v_Vuna_dLint_denclosingToks enclosing in let kind = v_Vuna_dLint_denclosingKind enclosing in let headText = v_Vuna_dLint_dlineAt lines headLine in (match v_Vuna_dLint_dtokenOfVar var headToks with
  | C_Vuna_dMaybe_dNothing -> []
  | C_Vuna_dMaybe_dJust (varTok) -> (match v_Vuna_dLint_denclosingPatterns kind headToks with
  | C_Vuna_dMaybe_dNothing -> []
  | C_Vuna_dMaybe_dJust (C_Vuna_dPair_dPair (fnOrKind, patArea)) -> (let outerNames = v_Vuna_dLint_dlowercaseIdents patArea in let innerNames = v_Vuna_dLint_dlowercaseIdents patToks in let otherOuter = v_Vuna_dLint_dremoveName var outerNames in let conflict = v_Vuna_dLint_dintersects innerNames otherOuter in let oneOccurrence = v_vuna_ueq_uint (v_Vuna_dLint_dcountIdent var patArea) 1 in let lastOk = v_Vuna_dLint_denclosingIsLast lines toks lastLine stop indent kind fnOrKind in let cleanOk = v_Vuna_dLint_dlinesClean lines headLine (bi_add caseLine 1) in if v_Vuna_dLint_dnotBool oneOccurrence then [] else if conflict then [] else (let newHead = v_Vuna_dLint_dreplaceIdentInLine headText varTok ((let vuna_cat0' = ("(") in (let vuna_cat1' = (patText) in (let vuna_cat2' = (")") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'])))) in let newLines = (newHead) :: (newBody) in let fixable = (if ((if (lastOk) then (cleanOk) else false)) then (v_Vuna_dLint_dnotBool mentions) else false) in let edit = if fixable then C_Vuna_dMaybe_dJust (C_Vuna_dLint_dEdit (headLine, bi_sub stop 1, newLines)) else C_Vuna_dMaybe_dNothing in (C_Vuna_dLint_dFinding (caseLine, bi_add indent 1, "redundant-case", (let vuna_cat0' = ("single-alternative case on `") in (let vuna_cat1' = (var) in (let vuna_cat2' = ("` can be folded into the enclosing pattern") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2']))), edit)) :: ([])))
  | _ -> vuna_fail "./lib/Vuna/Lint.vuna" 617 10 ("case pattern match failure"))
  | _ -> vuna_fail "./lib/Vuna/Lint.vuna" 614 6 ("case pattern match failure")))

let v_Vuna_dLint_dinlineShape = fun lines toks lastLine caseLine indent var enclosing patToks patText arrow bodyToks -> (let altLine = bi_add caseLine 1 in let altText = v_Vuna_dLint_dlineAt lines altLine in let next = v_Vuna_dLint_dnextNonBlank lines (bi_add altLine 1) lastLine in if v_Vuna_dLint_dnotBool (v_Vuna_dLint_dsimpleFrom bodyToks 0) then [] else if (if (v_vuna_ule_uint next lastLine) then (v_vuna_uge_uint (v_Vuna_dLint_dindentOf (v_Vuna_dLint_dlineAt lines next)) indent) else false) then [] else if v_Vuna_dLint_dnotBool (v_Vuna_dLint_dlinesClean lines (v_Vuna_dLint_denclosingLine enclosing) (bi_add caseLine 1)) then [] else (let bodyText = v_Vuna_dLint_dtextFromCol altText (bi_add (v_Vuna_dLint_dtokCol arrow) 2) in let tailEnd = if v_vuna_ugt_uint next lastLine then lastLine else bi_sub next 1 in let newBody = (((v_Vuna_dLint_dspaces indent) ^ (bodyText))) :: (v_Vuna_dLint_dblankFill (bi_add altLine 1) tailEnd) in v_Vuna_dLint_dredundantFinding lines toks lastLine caseLine indent var enclosing patToks patText (v_vuna_ugt_uint (v_Vuna_dLint_dcountIdent var bodyToks) 0) next newBody))

let v_Vuna_dLint_dblockShape = fun lines toks lastLine caseLine indent var enclosing patToks patText arrow -> (let altLine = bi_add caseLine 1 in let scanned = v_Vuna_dLint_dscanBody lines toks lastLine (bi_add altLine 1) indent [] in (match scanned with
  | C_Vuna_dLint_dCaseBody (stop, rawLines) -> if v_vuna_ule_uint stop (bi_add altLine 1) then [] else if v_Vuna_dLint_dnotBool ((if (v_vuna_ugt_uint stop lastLine) then true else (v_vuna_ult_uint (v_Vuna_dLint_dindentOf (v_Vuna_dLint_dlineAt lines stop)) indent))) then [] else if v_Vuna_dLint_dnotBool (v_Vuna_dLint_dblockBodyOk lines toks lastLine (bi_add altLine 1) stop indent) then [] else if v_Vuna_dLint_dnotBool (v_Vuna_dLint_dlinesClean lines (v_Vuna_dLint_denclosingLine enclosing) (bi_sub stop 1)) then [] else (let newBody = v_Vuna_dList_dmap (fun line -> v_Vuna_dLint_ddropIndent 4 line) rawLines in v_Vuna_dLint_dredundantFinding lines toks lastLine caseLine indent var enclosing patToks patText (v_Vuna_dLint_dbodyMentionsVar toks var (bi_add altLine 1) stop) stop newBody)
  | _ -> vuna_fail "./lib/Vuna/Lint.vuna" 599 6 ("case pattern match failure")))

let v_Vuna_dLint_dcheckRedundantBody = fun lines toks lastLine caseLine indent var enclosing -> (let headLine = v_Vuna_dLint_denclosingLine enclosing in let headToks = v_Vuna_dLint_denclosingToks enclosing in let kind = v_Vuna_dLint_denclosingKind enclosing in let altLine = bi_add caseLine 1 in if v_vuna_ugt_uint altLine lastLine then [] else (let altText = v_Vuna_dLint_dlineAt lines altLine in if v_Vuna_dLint_disBlankLine altText then [] else if v_vuna_uneq_uint (v_Vuna_dLint_dindentOf altText) (bi_add indent 2) then [] else (let altToks = v_Vuna_dLint_dtokensOnLine toks altLine in (match v_Vuna_dLint_dsplitAtSym "=>" altToks with
  | C_Vuna_dMaybe_dNothing -> []
  | C_Vuna_dMaybe_dJust (C_Vuna_dPair_dPair (patToks, C_Vuna_dPair_dPair (arrow, bodyToks))) -> if v_Vuna_dLint_disNilList patToks then [] else if v_Vuna_dLint_dnotBool (v_Vuna_dLint_dctorOrLitPattern patToks) then [] else (let patText = v_Vuna_dLint_dtrimEnd (v_Vuna_dLint_dsliceLine (bi_sub (v_Vuna_dLint_dtokCol (v_Vuna_dLint_dheadOfTokens patToks)) 1) (bi_sub (v_Vuna_dLint_dtokCol arrow) (v_Vuna_dLint_dtokCol (v_Vuna_dLint_dheadOfTokens patToks))) altText) in if v_Vuna_dLint_disNilList bodyToks then v_Vuna_dLint_dblockShape lines toks lastLine caseLine indent var enclosing patToks patText arrow else v_Vuna_dLint_dinlineShape lines toks lastLine caseLine indent var enclosing patToks patText arrow bodyToks)
  | _ -> vuna_fail "./lib/Vuna/Lint.vuna" 567 16 ("case pattern match failure")))))

let v_Vuna_dLint_dredundantCaseAt = fun lines toks lastLine n -> (let line = v_Vuna_dLint_dlineAt lines n in (let indent = v_Vuna_dLint_dindentOf line in (let ts = v_Vuna_dLint_dtokensOnLine toks n in (match v_Vuna_dLint_dcaseVarOf ts with
  | C_Vuna_dMaybe_dNothing -> []
  | C_Vuna_dMaybe_dJust (var) -> (match v_Vuna_dLint_denclosingOf lines toks n indent with
  | C_Vuna_dMaybe_dNothing -> []
  | C_Vuna_dMaybe_dJust (enclosing) -> v_Vuna_dLint_dcheckRedundantBody lines toks lastLine n indent var enclosing
  | _ -> vuna_fail "./lib/Vuna/Lint.vuna" 670 10 ("case pattern match failure"))
  | _ -> vuna_fail "./lib/Vuna/Lint.vuna" 667 6 ("case pattern match failure")))))

let rec v_Vuna_dLint_dscanRedundant = fun lines toks n lastLine -> if v_vuna_ugt_uint n lastLine then [] else v_Vuna_dList_dappend (v_Vuna_dLint_dredundantCaseAt lines toks lastLine n) (v_Vuna_dLint_dscanRedundant lines toks (bi_add n 1) lastLine)

let rec v_Vuna_dLint_dinsertFinding = fun a0 a1 -> match (a0, a1) with
  | (f, []) -> (f) :: ([])
  | (f, (g) :: (rest)) -> if v_vuna_ult_uint (v_Vuna_dLint_dfindingLine f) (v_Vuna_dLint_dfindingLine g) then (f) :: ((g) :: (rest)) else if (if (v_vuna_ueq_uint (v_Vuna_dLint_dfindingLine f) (v_Vuna_dLint_dfindingLine g)) then (v_vuna_ule_uint (v_Vuna_dLint_dfindingCol f) (v_Vuna_dLint_dfindingCol g)) else false) then (f) :: ((g) :: (rest)) else (g) :: (v_Vuna_dLint_dinsertFinding f rest)
  | _ -> vuna_fail "./lib/Vuna/Lint.vuna" 682 1 ("no matching clause for Vuna.Lint.insertFinding")

let rec v_Vuna_dLint_dsortFindings = fun a0 -> match a0 with
  | ([]) -> []
  | ((f) :: (rest)) -> v_Vuna_dLint_dinsertFinding f (v_Vuna_dLint_dsortFindings rest)
  | _ -> vuna_fail "./lib/Vuna/Lint.vuna" 678 1 ("no matching clause for Vuna.Lint.sortFindings")

let rec v_Vuna_dLint_dinsertEdit = fun a0 a1 -> match (a0, a1) with
  | (e, []) -> (e) :: ([])
  | (e, (f) :: (rest)) -> if v_vuna_ugt_uint (v_Vuna_dLint_deditStart e) (v_Vuna_dLint_deditStart f) then (e) :: ((f) :: (rest)) else (f) :: (v_Vuna_dLint_dinsertEdit e rest)
  | _ -> vuna_fail "./lib/Vuna/Lint.vuna" 693 1 ("no matching clause for Vuna.Lint.insertEdit")

let rec v_Vuna_dLint_dsortEdits = fun a0 -> match a0 with
  | ([]) -> []
  | ((e) :: (rest)) -> v_Vuna_dLint_dinsertEdit e (v_Vuna_dLint_dsortEdits rest)
  | _ -> vuna_fail "./lib/Vuna/Lint.vuna" 689 1 ("no matching clause for Vuna.Lint.sortEdits")

let rec v_Vuna_dLint_dcollectEdits = fun a0 a1 -> match (a0, a1) with
  | ([], acc) -> acc
  | ((f) :: (rest), acc) -> (match v_Vuna_dLint_dfindingEdit f with
  | C_Vuna_dMaybe_dNothing -> v_Vuna_dLint_dcollectEdits rest acc
  | C_Vuna_dMaybe_dJust (e) -> v_Vuna_dLint_dcollectEdits rest ((e) :: (acc))
  | _ -> vuna_fail "./lib/Vuna/Lint.vuna" 702 3 ("case pattern match failure"))
  | _ -> vuna_fail "./lib/Vuna/Lint.vuna" 699 1 ("no matching clause for Vuna.Lint.collectEdits")

let rec v_Vuna_dLint_dtakeList = fun a0 a1 -> match (a0, a1) with
  | (n, []) -> []
  | (n, (x) :: (rest)) -> if v_vuna_ule_uint n 0 then [] else (x) :: (v_Vuna_dLint_dtakeList (bi_sub n 1) rest)
  | _ -> vuna_fail "./lib/Vuna/Lint.vuna" 706 1 ("no matching clause for Vuna.Lint.takeList")

let rec v_Vuna_dLint_ddropList = fun n lines -> if v_vuna_ule_uint n 0 then lines else (match lines with
  | [] -> []
  | (x) :: (rest) -> v_Vuna_dLint_ddropList (bi_sub n 1) rest
  | _ -> vuna_fail "./lib/Vuna/Lint.vuna" 713 5 ("case pattern match failure"))

let v_Vuna_dLint_dreplaceRange = fun start stop newLines lines -> v_Vuna_dList_dappend (v_Vuna_dLint_dtakeList (bi_sub start 1) lines) (v_Vuna_dList_dappend newLines (v_Vuna_dLint_ddropList stop lines))

let rec v_Vuna_dLint_dapplyEditList = fun a0 a1 a2 a3 -> match (a0, a1, a2, a3) with
  | ([], lines, limit, count) -> C_Vuna_dPair_dPair (count, lines)
  | ((e) :: (rest), lines, limit, count) -> if v_vuna_ult_uint (v_Vuna_dLint_deditEnd e) limit then v_Vuna_dLint_dapplyEditList rest (v_Vuna_dLint_dreplaceRange (v_Vuna_dLint_deditStart e) (v_Vuna_dLint_deditEnd e) (v_Vuna_dLint_deditLines e) lines) (v_Vuna_dLint_deditStart e) (bi_add count 1) else v_Vuna_dLint_dapplyEditList rest lines limit count
  | _ -> vuna_fail "./lib/Vuna/Lint.vuna" 719 1 ("no matching clause for Vuna.Lint.applyEditList")

let v_Vuna_dLint_dapplyFixes = fun source findings -> (let edits = v_Vuna_dLint_dsortEdits (v_Vuna_dLint_dcollectEdits findings []) in (match v_Vuna_dLint_dapplyEditList edits (v_Vuna_dLint_dsplitLines source) (bi_add (v_Vuna_dList_dlength (v_Vuna_dLint_dsplitLines source)) 1) 0 with
  | C_Vuna_dPair_dPair (count, newLines) -> if v_vuna_ueq_uint count 0 then C_Vuna_dResult_dOk (C_Vuna_dPair_dPair (0, source)) else (let newSource = v_Vuna_dLint_djoinLines newLines in (match v_Vuna_dParser_dparseSource "<lint>" newSource with
  | C_Vuna_dResult_dErr (e) -> C_Vuna_dResult_dErr ((("parse failed after fix: ") ^ (e)))
  | C_Vuna_dResult_dOk (ignored) -> C_Vuna_dResult_dOk (C_Vuna_dPair_dPair (count, newSource))
  | _ -> vuna_fail "./lib/Vuna/Lint.vuna" 733 15 ("case pattern match failure")))
  | _ -> vuna_fail "./lib/Vuna/Lint.vuna" 728 6 ("case pattern match failure")))

let v_Vuna_dLint_dlintSource = fun source -> (match v_Vuna_dParser_dparseSource "<lint>" source with
  | C_Vuna_dResult_dErr (e) -> C_Vuna_dResult_dErr (e)
  | C_Vuna_dResult_dOk (ignored) -> (match v_Vuna_dLexer_dlexSource source with
  | C_Vuna_dResult_dErr (e) -> C_Vuna_dResult_dErr (e)
  | C_Vuna_dResult_dOk (toks) -> (let lines = v_Vuna_dLint_dsplitLines source in C_Vuna_dResult_dOk (v_Vuna_dLint_dsortFindings (v_Vuna_dList_dappend (v_Vuna_dLint_dscanIfChains lines toks 1 (v_Vuna_dList_dlength lines)) (v_Vuna_dLint_dscanRedundant lines toks 1 (v_Vuna_dList_dlength lines)))))
  | _ -> vuna_fail "./lib/Vuna/Lint.vuna" 741 7 ("case pattern match failure"))
  | _ -> vuna_fail "./lib/Vuna/Lint.vuna" 738 3 ("case pattern match failure"))

let v_Vuna_dLint_dprintFinding = fun path fixMode f -> (let suffix = if fixMode then " (not auto-fixable)" else "" in let text = (let vuna_cat0' = (path) in (let vuna_cat1' = (":") in (let vuna_cat2' = (bi_str_from_int (v_Vuna_dLint_dfindingLine f)) in (let vuna_cat3' = (":") in (let vuna_cat4' = (bi_str_from_int (v_Vuna_dLint_dfindingCol f)) in (let vuna_cat5' = (": ") in (let vuna_cat6' = (v_Vuna_dLint_dfindingRule f) in (let vuna_cat7' = (": ") in (let vuna_cat8' = (v_Vuna_dLint_dfindingMessage f) in (let vuna_cat9' = (suffix) in (let vuna_cat10' = ("\n") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'; vuna_cat4'; vuna_cat5'; vuna_cat6'; vuna_cat7'; vuna_cat8'; vuna_cat9'; vuna_cat10']))))))))))) in (let _ = bi_print text in 0))

let rec v_Vuna_dLint_dprintFindings = fun a0 a1 a2 -> match (a0, a1, a2) with
  | (path, fixMode, []) -> 0
  | (path, fixMode, (f) :: (rest)) -> (let _ = v_Vuna_dLint_dprintFinding path fixMode f in v_Vuna_dLint_dprintFindings path fixMode rest)
  | _ -> vuna_fail "./lib/Vuna/Lint.vuna" 752 1 ("no matching clause for Vuna.Lint.printFindings")

let v_Vuna_dLint_dlintUsage = "usage: vuna lint [--fix] <file.vuna>...\n"

let v_Vuna_dLint_dlintUsageError = fun () -> (let _ = bi_print v_Vuna_dLint_dlintUsage in 2)

let v_Vuna_dLint_dreportFindings = fun path fixMode findings -> (let _ = v_Vuna_dLint_dprintFindings path fixMode findings in if v_Vuna_dLint_disNilList findings then 0 else 1)

let rec v_Vuna_dLint_dfixLoop = fun source findings passes total -> if v_vuna_ule_uint passes 0 then C_Vuna_dResult_dOk (C_Vuna_dPair_dPair (total, source)) else (match v_Vuna_dLint_dapplyFixes source findings with
  | C_Vuna_dResult_dErr (e) -> C_Vuna_dResult_dErr (e)
  | C_Vuna_dResult_dOk (C_Vuna_dPair_dPair (count, newSource)) -> if v_vuna_ueq_uint count 0 then C_Vuna_dResult_dOk (C_Vuna_dPair_dPair (total, source)) else (match v_Vuna_dLint_dlintSource newSource with
  | C_Vuna_dResult_dErr (e) -> C_Vuna_dResult_dErr (e)
  | C_Vuna_dResult_dOk (remaining) -> v_Vuna_dLint_dfixLoop newSource remaining (bi_sub passes 1) (bi_add total count)
  | _ -> vuna_fail "./lib/Vuna/Lint.vuna" 774 11 ("case pattern match failure"))
  | _ -> vuna_fail "./lib/Vuna/Lint.vuna" 769 5 ("case pattern match failure"))

let v_Vuna_dLint_dfixReport = fun path source findings -> (match v_Vuna_dLint_dfixLoop source findings 8 0 with
  | C_Vuna_dResult_dErr (e) -> (let _ = bi_print ((let vuna_cat0' = (path) in (let vuna_cat1' = (": error: ") in (let vuna_cat2' = (e) in (let vuna_cat3' = ("\n") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3']))))) in 2)
  | C_Vuna_dResult_dOk (C_Vuna_dPair_dPair (count, newSource)) -> if v_vuna_ueq_uint count 0 then v_Vuna_dLint_dreportFindings path true findings else (let _ = bi_write_file path newSource in (match v_Vuna_dLint_dlintSource newSource with
  | C_Vuna_dResult_dErr (e) -> (let _ = bi_print ((let vuna_cat0' = (path) in (let vuna_cat1' = (": error: ") in (let vuna_cat2' = (e) in (let vuna_cat3' = ("\n") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3']))))) in 2)
  | C_Vuna_dResult_dOk (remaining) -> (let _ = bi_print ((let vuna_cat0' = (path) in (let vuna_cat1' = (": fixed ") in (let vuna_cat2' = (bi_str_from_int count) in (let vuna_cat3' = (" finding(s)\n") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3']))))) in v_Vuna_dLint_dreportFindings path true remaining)
  | _ -> vuna_fail "./lib/Vuna/Lint.vuna" 785 12 ("case pattern match failure")))
  | _ -> vuna_fail "./lib/Vuna/Lint.vuna" 779 3 ("case pattern match failure"))

let v_Vuna_dLint_dlintExisting = fun doFix path source -> (match v_Vuna_dLint_dlintSource source with
  | C_Vuna_dResult_dErr (e) -> (let _ = bi_print ((let vuna_cat0' = (path) in (let vuna_cat1' = (": error: ") in (let vuna_cat2' = (e) in (let vuna_cat3' = ("\n") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3']))))) in 2)
  | C_Vuna_dResult_dOk (findings) -> if doFix then v_Vuna_dLint_dfixReport path source findings else v_Vuna_dLint_dreportFindings path false findings
  | _ -> vuna_fail "./lib/Vuna/Lint.vuna" 792 3 ("case pattern match failure"))

let v_Vuna_dLint_dlintOne = fun doFix path -> if bi_file_exists path then v_Vuna_dLint_dlintExisting doFix path (bi_read_file path) else (let _ = bi_print (((path) ^ (": error: file not found\n"))) in 2)

let rec v_Vuna_dLint_dlintFiles = fun a0 a1 -> match (a0, a1) with
  | (doFix, []) -> 0
  | (doFix, (path) :: (rest)) -> (let code = v_Vuna_dLint_dlintOne doFix path in (let restCode = v_Vuna_dLint_dlintFiles doFix rest in if v_vuna_ugt_uint code restCode then code else restCode))
  | _ -> vuna_fail "./lib/Vuna/Lint.vuna" 800 1 ("no matching clause for Vuna.Lint.lintFiles")

let rec v_Vuna_dLint_dlintArgs = fun doFix files args -> (match args with
  | [] -> if v_Vuna_dLint_disNilList files then v_Vuna_dLint_dlintUsageError () else v_Vuna_dLint_dlintFiles doFix (v_Vuna_dList_dreverse files)
  | (arg) :: (rest) -> if v_vuna_ueq_ustr arg "--fix" then v_Vuna_dLint_dlintArgs true files rest else if v_Vuna_dString_dstartsWith "-" arg then v_Vuna_dLint_dlintUsageError () else v_Vuna_dLint_dlintArgs doFix ((arg) :: (files)) rest
  | _ -> vuna_fail "./lib/Vuna/Lint.vuna" 808 3 ("case pattern match failure"))

let v_Vuna_dLint_drunLint = fun args -> v_Vuna_dLint_dlintArgs false [] args

let v_vuna_ueq_uVuna_uLint_uEdit = fun x y -> (match x with
  | C_Vuna_dLint_dEdit (v0, v1, v2) -> (match y with
  | C_Vuna_dLint_dEdit (w0, w1, w2) -> (if ((if (v_vuna_ueq_uint v0 w0) then (v_vuna_ueq_uint v1 w1) else false)) then (v_vuna_ueq_uVuna_uList_uList v2 w2) else false)
  | _ -> v_vuna_ueq_uint 0 1
  | _ -> vuna_fail "<generated>" 3 30 ("case pattern match failure"))
  | _ -> v_vuna_ueq_uint 0 1
  | _ -> vuna_fail "<generated>" 2 30 ("case pattern match failure"))

let v_vuna_uneq_uVuna_uLint_uEdit = fun x y -> if v_vuna_ueq_uVuna_uLint_uEdit x y then v_vuna_ueq_uint 0 1 else v_vuna_ueq_uint 0 0

let v_vuna_ueq_uVuna_uLint_uFinding = fun x y -> (match x with
  | C_Vuna_dLint_dFinding (v0, v1, v2, v3, v4) -> (match y with
  | C_Vuna_dLint_dFinding (w0, w1, w2, w3, w4) -> (if ((if ((if ((if (v_vuna_ueq_uint v0 w0) then (v_vuna_ueq_uint v1 w1) else false)) then (v_vuna_ueq_ustr v2 w2) else false)) then (v_vuna_ueq_ustr v3 w3) else false)) then (v_vuna_ueq_uVuna_uMaybe_uMaybe v4 w4) else false)
  | _ -> v_vuna_ueq_uint 0 1
  | _ -> vuna_fail "<generated>" 12 39 ("case pattern match failure"))
  | _ -> v_vuna_ueq_uint 0 1
  | _ -> vuna_fail "<generated>" 11 33 ("case pattern match failure"))

let v_vuna_uneq_uVuna_uLint_uFinding = fun x y -> if v_vuna_ueq_uVuna_uLint_uFinding x y then v_vuna_ueq_uint 0 1 else v_vuna_ueq_uint 0 0

let v_vuna_ushow_uVuna_uLint_uLitBranch = fun x -> (match x with
  | C_Vuna_dLint_dLitBranch (v0, v1) -> (let vuna_cat0' = ("(LitBranch ") in (let vuna_cat1' = (v_vuna_ushow_ustring v0) in (let vuna_cat2' = (" ") in (let vuna_cat3' = (v_vuna_ushow_ustring v1) in (let vuna_cat4' = (")") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'; vuna_cat4'])))))
  | _ -> vuna_fail "<generated>" 20 35 ("case pattern match failure"))

let v_vuna_ueq_uVuna_uLint_uLitBranch = fun x y -> (match x with
  | C_Vuna_dLint_dLitBranch (v0, v1) -> (match y with
  | C_Vuna_dLint_dLitBranch (w0, w1) -> (if (v_vuna_ueq_ustr v0 w0) then (v_vuna_ueq_ustr v1 w1) else false)
  | _ -> v_vuna_ueq_uint 0 1
  | _ -> vuna_fail "<generated>" 25 32 ("case pattern match failure"))
  | _ -> v_vuna_ueq_uint 0 1
  | _ -> vuna_fail "<generated>" 24 35 ("case pattern match failure"))

let v_vuna_uneq_uVuna_uLint_uLitBranch = fun x y -> if v_vuna_ueq_uVuna_uLint_uLitBranch x y then v_vuna_ueq_uint 0 1 else v_vuna_ueq_uint 0 0

let v_vuna_ushow_uVuna_uLint_uIfHead = fun x -> (match x with
  | C_Vuna_dLint_dIfHead (v0, v1, v2) -> (let vuna_cat0' = ("(IfHead ") in (let vuna_cat1' = (v_vuna_ushow_ustring v0) in (let vuna_cat2' = (" ") in (let vuna_cat3' = (v_vuna_ushow_ustring v1) in (let vuna_cat4' = (" ") in (let vuna_cat5' = (v_vuna_ushow_ustring v2) in (let vuna_cat6' = (")") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'; vuna_cat4'; vuna_cat5'; vuna_cat6'])))))))
  | _ -> vuna_fail "<generated>" 33 32 ("case pattern match failure"))

let v_vuna_ueq_uVuna_uLint_uIfHead = fun x y -> (match x with
  | C_Vuna_dLint_dIfHead (v0, v1, v2) -> (match y with
  | C_Vuna_dLint_dIfHead (w0, w1, w2) -> (if ((if (v_vuna_ueq_ustr v0 w0) then (v_vuna_ueq_ustr v1 w1) else false)) then (v_vuna_ueq_ustr v2 w2) else false)
  | _ -> v_vuna_ueq_uint 0 1
  | _ -> vuna_fail "<generated>" 38 32 ("case pattern match failure"))
  | _ -> v_vuna_ueq_uint 0 1
  | _ -> vuna_fail "<generated>" 37 32 ("case pattern match failure"))

let v_vuna_uneq_uVuna_uLint_uIfHead = fun x y -> if v_vuna_ueq_uVuna_uLint_uIfHead x y then v_vuna_ueq_uint 0 1 else v_vuna_ueq_uint 0 0

let v_vuna_ueq_uVuna_uLint_uEnclosing = fun x y -> (match x with
  | C_Vuna_dLint_dEnclosing (v0, v1, v2) -> (match y with
  | C_Vuna_dLint_dEnclosing (w0, w1, w2) -> (if ((if (v_vuna_ueq_uint v0 w0) then (v_vuna_ueq_uVuna_uList_uList v1 w1) else false)) then (v_vuna_ueq_ustr v2 w2) else false)
  | _ -> v_vuna_ueq_uint 0 1
  | _ -> vuna_fail "<generated>" 47 35 ("case pattern match failure"))
  | _ -> v_vuna_ueq_uint 0 1
  | _ -> vuna_fail "<generated>" 46 35 ("case pattern match failure"))

let v_vuna_uneq_uVuna_uLint_uEnclosing = fun x y -> if v_vuna_ueq_uVuna_uLint_uEnclosing x y then v_vuna_ueq_uint 0 1 else v_vuna_ueq_uint 0 0

let v_vuna_ueq_uVuna_uLint_uCaseBody = fun x y -> (match x with
  | C_Vuna_dLint_dCaseBody (v0, v1) -> (match y with
  | C_Vuna_dLint_dCaseBody (w0, w1) -> (if (v_vuna_ueq_uint v0 w0) then (v_vuna_ueq_uVuna_uList_uList v1 w1) else false)
  | _ -> v_vuna_ueq_uint 0 1
  | _ -> vuna_fail "<generated>" 56 31 ("case pattern match failure"))
  | _ -> v_vuna_ueq_uint 0 1
  | _ -> vuna_fail "<generated>" 55 34 ("case pattern match failure"))

let v_vuna_uneq_uVuna_uLint_uCaseBody = fun x y -> if v_vuna_ueq_uVuna_uLint_uCaseBody x y then v_vuna_ueq_uint 0 1 else v_vuna_ueq_uint 0 0
