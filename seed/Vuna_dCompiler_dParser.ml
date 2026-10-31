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
open Vuna_dCompiler_dCommon
open Vuna_dCompiler_dToml
open Vuna_dCompiler_dManifest
open Vuna_dCompiler_dPkg
open Vuna_dCompiler_dAst
open Vuna_dCompiler_dLexer
type   t_Vuna_dCompiler_dParser_dPState =
    C_Vuna_dCompiler_dParser_dPState of (string) * ((t_Vuna_dCompiler_dLexer_dPTok) list) * (t_Vuna_dCompiler_dCommon_dPos)
let show_Vuna_dCompiler_dParser_dPState v =
  match v with
  | C_Vuna_dCompiler_dParser_dPState (f0, f1, f2) -> show_ctor "PState" [(show_vstring) f0; ((fun v -> let rec go = function [] -> "Nil" | x :: xs -> "(Cons " ^ (show_Vuna_dCompiler_dLexer_dPTok) x ^ " " ^ go xs ^ ")" in go v)) f1; (show_Vuna_dCompiler_dCommon_dPos) f2]
let v_Vuna_dCompiler_dParser_dposOf = fun a0 -> match a0 with
  | (C_Vuna_dCompiler_dLexer_dPTok (t, p)) -> p
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Parser.vuna" 15 1 ("no matching clause for Vuna.Compiler.Parser.posOf")

let v_Vuna_dCompiler_dParser_dtokOf = fun a0 -> match a0 with
  | (C_Vuna_dCompiler_dLexer_dPTok (t, p)) -> t
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Parser.vuna" 17 1 ("no matching clause for Vuna.Compiler.Parser.tokOf")

let v_Vuna_dCompiler_dParser_dfileOf = fun a0 -> match a0 with
  | (C_Vuna_dCompiler_dParser_dPState (file, toks, last)) -> file
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Parser.vuna" 19 1 ("no matching clause for Vuna.Compiler.Parser.fileOf")

let v_Vuna_dCompiler_dParser_dpeekTok = fun a0 -> match a0 with
  | (C_Vuna_dCompiler_dParser_dPState (file, toks, last)) -> (match toks with
  | (t) :: (rest) -> t
  | [] -> C_Vuna_dCompiler_dLexer_dPTok (C_Vuna_dCompiler_dLexer_dTEof, C_Vuna_dCompiler_dCommon_dPos (1, 1))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Parser.vuna" 25 3 ("case pattern match failure"))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Parser.vuna" 24 1 ("no matching clause for Vuna.Compiler.Parser.peekTok")

let v_Vuna_dCompiler_dParser_dpeekPos = fun st -> v_Vuna_dCompiler_dParser_dposOf (v_Vuna_dCompiler_dParser_dpeekTok st)

let v_Vuna_dCompiler_dParser_dlastPos = fun a0 -> match a0 with
  | (C_Vuna_dCompiler_dParser_dPState (file, toks, last)) -> last
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Parser.vuna" 31 1 ("no matching clause for Vuna.Compiler.Parser.lastPos")

let v_Vuna_dCompiler_dParser_dspanOf = fun st st2 -> C_Vuna_dCompiler_dCommon_dSpan (v_Vuna_dCompiler_dParser_dfileOf st, v_Vuna_dCompiler_dCommon_dposLine (v_Vuna_dCompiler_dParser_dpeekPos st), v_Vuna_dCompiler_dCommon_dposCol (v_Vuna_dCompiler_dParser_dpeekPos st), v_Vuna_dCompiler_dCommon_dposLine (v_Vuna_dCompiler_dParser_dlastPos st2), v_Vuna_dCompiler_dCommon_dposCol (v_Vuna_dCompiler_dParser_dlastPos st2))

let v_Vuna_dCompiler_dParser_dadvance = fun a0 -> match a0 with
  | (C_Vuna_dCompiler_dParser_dPState (file, toks, last)) -> (match toks with
  | (t) :: (rest) -> (match t with
  | C_Vuna_dCompiler_dLexer_dPTok (C_Vuna_dCompiler_dLexer_dTEof, p) -> C_Vuna_dCompiler_dParser_dPState (file, toks, last)
  | _ -> C_Vuna_dCompiler_dParser_dPState (file, rest, v_Vuna_dCompiler_dParser_dposOf t)
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Parser.vuna" 36 7 ("case pattern match failure"))
  | [] -> C_Vuna_dCompiler_dParser_dPState (file, toks, last)
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Parser.vuna" 34 3 ("case pattern match failure"))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Parser.vuna" 33 1 ("no matching clause for Vuna.Compiler.Parser.advance")

let v_Vuna_dCompiler_dParser_disEof = fun st -> (match v_Vuna_dCompiler_dParser_dpeekTok st with
  | C_Vuna_dCompiler_dLexer_dPTok (C_Vuna_dCompiler_dLexer_dTEof, p) -> true
  | _ -> false
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Parser.vuna" 42 3 ("case pattern match failure"))

let v_Vuna_dCompiler_dParser_dtoksOf = fun a0 -> match a0 with
  | (C_Vuna_dCompiler_dParser_dPState (file, toks, last)) -> toks
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Parser.vuna" 48 1 ("no matching clause for Vuna.Compiler.Parser.toksOf")

let v_Vuna_dCompiler_dParser_dsameLineState = fun st -> (match v_Vuna_dCompiler_dParser_dpeekPos st with
  | C_Vuna_dCompiler_dCommon_dPos (line, col) -> C_Vuna_dCompiler_dParser_dPState (v_Vuna_dCompiler_dParser_dfileOf st, v_Vuna_dCompiler_dParser_dtoksOf st, C_Vuna_dCompiler_dCommon_dPos (line, 0))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Parser.vuna" 51 3 ("case pattern match failure"))

let v_Vuna_dCompiler_dParser_datSym = fun st s -> (match v_Vuna_dCompiler_dParser_dpeekTok st with
  | C_Vuna_dCompiler_dLexer_dPTok (C_Vuna_dCompiler_dLexer_dTSym (x), p) -> v_vuna_ueq_ustr x s
  | _ -> false
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Parser.vuna" 55 3 ("case pattern match failure"))

let rec v_Vuna_dCompiler_dParser_dnthTok = fun a0 a1 -> match (a0, a1) with
  | ([], n) -> C_Base_dMaybe_dNothing
  | ((t) :: (rest), n) -> if v_vuna_ule_uint n 0 then C_Base_dMaybe_dJust (t) else v_Vuna_dCompiler_dParser_dnthTok rest (bi_sub n 1)
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Parser.vuna" 61 1 ("no matching clause for Vuna.Compiler.Parser.nthTok")

let v_Vuna_dCompiler_dParser_dpeekTokAt = fun st n -> v_Vuna_dCompiler_dParser_dnthTok (v_Vuna_dCompiler_dParser_dtoksOf st) n

let v_Vuna_dCompiler_dParser_dbinderHeadName = fun st -> (match v_Vuna_dCompiler_dParser_dpeekTok st with
  | C_Vuna_dCompiler_dLexer_dPTok (C_Vuna_dCompiler_dLexer_dTIdent (name), p) -> (match v_Vuna_dCompiler_dParser_dpeekTokAt st 1 with
  | C_Base_dMaybe_dJust (C_Vuna_dCompiler_dLexer_dPTok (C_Vuna_dCompiler_dLexer_dTSym (":"), _)) -> C_Base_dMaybe_dJust (name)
  | _ -> C_Base_dMaybe_dNothing
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Parser.vuna" 72 7 ("case pattern match failure"))
  | _ -> C_Base_dMaybe_dNothing
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Parser.vuna" 70 3 ("case pattern match failure"))

let v_Vuna_dCompiler_dParser_datKw = fun st k -> (match v_Vuna_dCompiler_dParser_dpeekTok st with
  | C_Vuna_dCompiler_dLexer_dPTok (C_Vuna_dCompiler_dLexer_dTKw (x), p) -> v_vuna_ueq_ustr x k
  | _ -> false
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Parser.vuna" 78 3 ("case pattern match failure"))

let v_Vuna_dCompiler_dParser_dcanContinue = fun st blockCol -> (match v_Vuna_dCompiler_dParser_dpeekPos st with
  | C_Vuna_dCompiler_dCommon_dPos (line, col) -> (match v_Vuna_dCompiler_dParser_dlastPos st with
  | C_Vuna_dCompiler_dCommon_dPos (lastLine, lastCol) -> (if (v_vuna_ueq_uint line lastLine) then true else (v_vuna_ugt_uint col blockCol))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Parser.vuna" 85 7 ("case pattern match failure"))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Parser.vuna" 83 3 ("case pattern match failure"))

let v_Vuna_dCompiler_dParser_dexpectSym = fun st s -> (match v_Vuna_dCompiler_dParser_dpeekTok st with
  | C_Vuna_dCompiler_dLexer_dPTok (C_Vuna_dCompiler_dLexer_dTSym (x), p) -> if v_vuna_ueq_ustr x s then C_Base_dResult_dOk (C_Base_dPair_dPair (0, v_Vuna_dCompiler_dParser_dadvance st)) else C_Base_dResult_dErr ((("expected ") ^ (s)))
  | _ -> C_Base_dResult_dErr ((("expected ") ^ (s)))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Parser.vuna" 89 3 ("case pattern match failure"))

let v_Vuna_dCompiler_dParser_dexpectKw = fun st k -> (match v_Vuna_dCompiler_dParser_dpeekTok st with
  | C_Vuna_dCompiler_dLexer_dPTok (C_Vuna_dCompiler_dLexer_dTKw (x), p) -> if v_vuna_ueq_ustr x k then C_Base_dResult_dOk (C_Base_dPair_dPair (0, v_Vuna_dCompiler_dParser_dadvance st)) else C_Base_dResult_dErr ((("expected ") ^ (k)))
  | _ -> C_Base_dResult_dErr ((("expected ") ^ (k)))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Parser.vuna" 94 3 ("case pattern match failure"))

let v_Vuna_dCompiler_dParser_dexpectIdent = fun st -> (match v_Vuna_dCompiler_dParser_dpeekTok st with
  | C_Vuna_dCompiler_dLexer_dPTok (C_Vuna_dCompiler_dLexer_dTIdent (x), p) -> C_Base_dResult_dOk (C_Base_dPair_dPair (x, v_Vuna_dCompiler_dParser_dadvance st))
  | _ -> C_Base_dResult_dErr ("expected identifier")
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Parser.vuna" 99 3 ("case pattern match failure"))

let v_Vuna_dCompiler_dParser_dupperFirst = fun s -> (match bi_str_unpack s with
  | (c) :: (rest) -> (if (v_vuna_uge_uint c 65) then (v_vuna_ule_uint c 90) else false)
  | [] -> false
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Parser.vuna" 104 3 ("case pattern match failure"))

let v_Vuna_dCompiler_dParser_dunderscoreCtorName = fun s -> (match bi_str_unpack s with
  | (c) :: (rest) -> if v_vuna_ueq_uint c 95 then (match rest with
  | (c2) :: (rest2) -> (if (v_vuna_uge_uint c2 65) then (v_vuna_ule_uint c2 90) else false)
  | [] -> false
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Parser.vuna" 114 9 ("case pattern match failure")) else false
  | [] -> false
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Parser.vuna" 111 3 ("case pattern match failure"))

let v_Vuna_dCompiler_dParser_dctorPatternStart = fun name -> (if (v_Vuna_dCompiler_dParser_dupperFirst name) then true else (v_Vuna_dCompiler_dParser_dunderscoreCtorName name))

let v_Vuna_dCompiler_dParser_dstartsAtom = fun st -> (match v_Vuna_dCompiler_dParser_dpeekTok st with
  | C_Vuna_dCompiler_dLexer_dPTok (C_Vuna_dCompiler_dLexer_dTIdent (x), p) -> true
  | C_Vuna_dCompiler_dLexer_dPTok (C_Vuna_dCompiler_dLexer_dTInt (x), p) -> true
  | C_Vuna_dCompiler_dLexer_dPTok (C_Vuna_dCompiler_dLexer_dTStr (x), p) -> true
  | C_Vuna_dCompiler_dLexer_dPTok (C_Vuna_dCompiler_dLexer_dTKw ("Type"), p) -> true
  | C_Vuna_dCompiler_dLexer_dPTok (C_Vuna_dCompiler_dLexer_dTSym ("("), p) -> true
  | C_Vuna_dCompiler_dLexer_dPTok (C_Vuna_dCompiler_dLexer_dTSym ("["), p) -> true
  | _ -> false
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Parser.vuna" 123 3 ("case pattern match failure"))

let v_Vuna_dCompiler_dParser_dstartsPatternAtom = fun st -> (match v_Vuna_dCompiler_dParser_dpeekTok st with
  | C_Vuna_dCompiler_dLexer_dPTok (C_Vuna_dCompiler_dLexer_dTIdent (x), p) -> true
  | C_Vuna_dCompiler_dLexer_dPTok (C_Vuna_dCompiler_dLexer_dTInt (x), p) -> true
  | C_Vuna_dCompiler_dLexer_dPTok (C_Vuna_dCompiler_dLexer_dTStr (x), p) -> true
  | C_Vuna_dCompiler_dLexer_dPTok (C_Vuna_dCompiler_dLexer_dTSym ("("), p) -> true
  | C_Vuna_dCompiler_dLexer_dPTok (C_Vuna_dCompiler_dLexer_dTSym ("["), p) -> true
  | _ -> false
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Parser.vuna" 133 3 ("case pattern match failure"))

let v_Vuna_dCompiler_dParser_dinfixInfo = fun a0 -> match a0 with
  | ("->") -> C_Base_dMaybe_dJust (C_Base_dPair_dPair (1, 1))
  | ("||") -> C_Base_dMaybe_dJust (C_Base_dPair_dPair (2, 0))
  | ("&&") -> C_Base_dMaybe_dJust (C_Base_dPair_dPair (3, 0))
  | ("==") -> C_Base_dMaybe_dJust (C_Base_dPair_dPair (4, 0))
  | ("/=") -> C_Base_dMaybe_dJust (C_Base_dPair_dPair (4, 0))
  | ("<") -> C_Base_dMaybe_dJust (C_Base_dPair_dPair (4, 0))
  | ("<=") -> C_Base_dMaybe_dJust (C_Base_dPair_dPair (4, 0))
  | (">") -> C_Base_dMaybe_dJust (C_Base_dPair_dPair (4, 0))
  | (">=") -> C_Base_dMaybe_dJust (C_Base_dPair_dPair (4, 0))
  | ("++") -> C_Base_dMaybe_dJust (C_Base_dPair_dPair (5, 1))
  | ("+") -> C_Base_dMaybe_dJust (C_Base_dPair_dPair (6, 0))
  | ("-") -> C_Base_dMaybe_dJust (C_Base_dPair_dPair (6, 0))
  | ("*") -> C_Base_dMaybe_dJust (C_Base_dPair_dPair (7, 0))
  | ("/") -> C_Base_dMaybe_dJust (C_Base_dPair_dPair (7, 0))
  | ("::") -> C_Base_dMaybe_dJust (C_Base_dPair_dPair (8, 1))
  | (">>=") -> C_Base_dMaybe_dJust (C_Base_dPair_dPair (1, 1))
  | (">>") -> C_Base_dMaybe_dJust (C_Base_dPair_dPair (1, 0))
  | (_) -> C_Base_dMaybe_dNothing
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Parser.vuna" 141 1 ("no matching clause for Vuna.Compiler.Parser.infixInfo")

let v_Vuna_dCompiler_dParser_dopExpr = fun a0 a1 -> match (a0, a1) with
  | ("::", sp) -> C_Vuna_dCompiler_dAst_dEVar ("Cons", sp)
  | (">>=", sp) -> C_Vuna_dCompiler_dAst_dEVar ("bind", sp)
  | (op, sp) -> C_Vuna_dCompiler_dAst_dEVar (op, sp)
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Parser.vuna" 160 1 ("no matching clause for Vuna.Compiler.Parser.opExpr")

let v_Vuna_dCompiler_dParser_dmkInfixExpr = fun a0 a1 a2 a3 -> match (a0, a1, a2, a3) with
  | (">>", lhs, rhs, sp) -> C_Vuna_dCompiler_dAst_dEApp (C_Vuna_dCompiler_dAst_dEVar ("bind", sp), (lhs) :: ((C_Vuna_dCompiler_dAst_dELam (("vuna_seq_ignore") :: ([]), rhs, sp)) :: ([])), sp)
  | (op, lhs, rhs, sp) -> C_Vuna_dCompiler_dAst_dEApp (v_Vuna_dCompiler_dParser_dopExpr op sp, (lhs) :: ((rhs) :: ([])), sp)
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Parser.vuna" 165 1 ("no matching clause for Vuna.Compiler.Parser.mkInfixExpr")

let rec v_Vuna_dCompiler_dParser_dcountArrows = fun e -> (match e with
  | C_Vuna_dCompiler_dAst_dEApp (C_Vuna_dCompiler_dAst_dEVar ("->", _), (x) :: ((rest) :: ([])), _) -> bi_add 1 (v_Vuna_dCompiler_dParser_dcountArrows rest)
  | _ -> 0
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Parser.vuna" 170 3 ("case pattern match failure"))

let v_Vuna_dCompiler_dParser_dterminatesExpression = fun tok -> (match tok with
  | C_Vuna_dCompiler_dLexer_dPTok (C_Vuna_dCompiler_dLexer_dTSym (")"), p) -> true
  | C_Vuna_dCompiler_dLexer_dPTok (C_Vuna_dCompiler_dLexer_dTSym ("]"), p) -> true
  | C_Vuna_dCompiler_dLexer_dPTok (C_Vuna_dCompiler_dLexer_dTSym (","), p) -> true
  | C_Vuna_dCompiler_dLexer_dPTok (C_Vuna_dCompiler_dLexer_dTKw ("else"), p) -> true
  | C_Vuna_dCompiler_dLexer_dPTok (C_Vuna_dCompiler_dLexer_dTKw ("in"), p) -> true
  | C_Vuna_dCompiler_dLexer_dPTok (C_Vuna_dCompiler_dLexer_dTKw ("then"), p) -> true
  | _ -> false
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Parser.vuna" 175 3 ("case pattern match failure"))

let v_Vuna_dCompiler_dParser_dbadCaseIndent = fun st altCol -> if v_Vuna_dCompiler_dParser_disEof st then false else (match v_Vuna_dCompiler_dParser_dpeekPos st with
  | C_Vuna_dCompiler_dCommon_dPos (line, col) -> if v_vuna_ugt_uint col altCol then (match v_Vuna_dCompiler_dParser_dterminatesExpression (v_Vuna_dCompiler_dParser_dpeekTok st) with
  | true -> false
  | false -> true
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Parser.vuna" 190 11 ("case pattern match failure")) else false
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Parser.vuna" 187 5 ("case pattern match failure"))

let v_Vuna_dCompiler_dParser_dparseExportItem = fun st -> (match v_Vuna_dCompiler_dParser_dpeekTok st with
  | C_Vuna_dCompiler_dLexer_dPTok (C_Vuna_dCompiler_dLexer_dTKw ("module"), p) -> v_Base_dResult_dstep (v_Vuna_dCompiler_dParser_dexpectKw st "module") (fun _u st1 -> v_Base_dResult_dstep (v_Vuna_dCompiler_dParser_dexpectIdent st1) (fun name st2 -> C_Base_dResult_dOk (C_Base_dPair_dPair (C_Vuna_dCompiler_dAst_dXModule (name, v_Vuna_dCompiler_dParser_dspanOf st st2), st2))))
  | C_Vuna_dCompiler_dLexer_dPTok (C_Vuna_dCompiler_dLexer_dTIdent (name), p) -> (let st1 = v_Vuna_dCompiler_dParser_dadvance st in if v_Vuna_dCompiler_dParser_datSym st1 "(" then v_Base_dResult_dstep (v_Vuna_dCompiler_dParser_dexpectSym st1 "(") (fun _u st2 -> v_Base_dResult_dstep (v_Vuna_dCompiler_dParser_dexpectSym st2 "..") (fun _u st3 -> v_Base_dResult_dstep (v_Vuna_dCompiler_dParser_dexpectSym st3 ")") (fun _u st4 -> C_Base_dResult_dOk (C_Base_dPair_dPair (C_Vuna_dCompiler_dAst_dXTypeAll (name, v_Vuna_dCompiler_dParser_dspanOf st st4), st4))))) else C_Base_dResult_dOk (C_Base_dPair_dPair (C_Vuna_dCompiler_dAst_dXBare (name, v_Vuna_dCompiler_dParser_dspanOf st st1), st1)))
  | _ -> C_Base_dResult_dErr ("expected an export item")
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Parser.vuna" 246 3 ("case pattern match failure"))

let rec v_Vuna_dCompiler_dParser_dparseExportItemsFrom = fun st -> v_Base_dResult_dstep (v_Vuna_dCompiler_dParser_dparseExportItem st) (fun item st1 -> if v_Vuna_dCompiler_dParser_datSym st1 "," then v_Base_dResult_dstep (v_Vuna_dCompiler_dParser_dparseExportItemsFrom (v_Vuna_dCompiler_dParser_dadvance st1)) (fun rest st2 -> C_Base_dResult_dOk (C_Base_dPair_dPair ((item) :: (rest), st2))) else v_Base_dResult_dstep (v_Vuna_dCompiler_dParser_dexpectSym st1 ")") (fun _u st2 -> C_Base_dResult_dOk (C_Base_dPair_dPair ((item) :: ([]), st2))))

let v_Vuna_dCompiler_dParser_dparseExportItems = fun st -> v_Base_dResult_dstep (v_Vuna_dCompiler_dParser_dexpectSym st "(") (fun _u st1 -> if v_Vuna_dCompiler_dParser_datSym st1 ")" then C_Base_dResult_dOk (C_Base_dPair_dPair ([], v_Vuna_dCompiler_dParser_dadvance st1)) else v_Vuna_dCompiler_dParser_dparseExportItemsFrom st1)

let v_Vuna_dCompiler_dParser_dparseModDecl = fun st -> if v_Vuna_dCompiler_dParser_datKw st "module" then v_Base_dResult_dstep (v_Vuna_dCompiler_dParser_dexpectKw st "module") (fun _u st1 -> v_Base_dResult_dstep (v_Vuna_dCompiler_dParser_dexpectIdent st1) (fun name st2 -> if v_Vuna_dCompiler_dParser_datSym st2 "(" then v_Base_dResult_dstep (v_Vuna_dCompiler_dParser_dparseExportItems st2) (fun items st3 -> v_Base_dResult_dstep (v_Vuna_dCompiler_dParser_dexpectKw st3 "where") (fun _u st4 -> C_Base_dResult_dOk (C_Base_dPair_dPair (C_Base_dMaybe_dJust (C_Vuna_dCompiler_dAst_dModDecl (name, true, items, v_Vuna_dCompiler_dParser_dspanOf st st4)), st4)))) else v_Base_dResult_dstep (v_Vuna_dCompiler_dParser_dexpectKw st2 "where") (fun _u st3 -> C_Base_dResult_dOk (C_Base_dPair_dPair (C_Base_dMaybe_dJust (C_Vuna_dCompiler_dAst_dModDecl (name, false, [], v_Vuna_dCompiler_dParser_dspanOf st st3)), st3))))) else C_Base_dResult_dOk (C_Base_dPair_dPair (C_Base_dMaybe_dNothing, st))

let v_Vuna_dCompiler_dParser_dparseImportAlias = fun st isQualified -> v_Base_dResult_dstep (v_Vuna_dCompiler_dParser_dexpectIdent st) (fun name st1 -> if v_Vuna_dCompiler_dParser_datKw st1 "as" then v_Base_dResult_dstep (v_Vuna_dCompiler_dParser_dexpectKw st1 "as") (fun _u st2 -> v_Base_dResult_dstep (v_Vuna_dCompiler_dParser_dexpectIdent st2) (fun alias st3 -> C_Base_dResult_dOk (C_Base_dPair_dPair (C_Vuna_dCompiler_dAst_dImport (name, isQualified, C_Base_dMaybe_dJust (alias), v_Vuna_dCompiler_dParser_dspanOf st st3), st3)))) else C_Base_dResult_dOk (C_Base_dPair_dPair (C_Vuna_dCompiler_dAst_dImport (name, isQualified, C_Base_dMaybe_dNothing, v_Vuna_dCompiler_dParser_dspanOf st st1), st1)))

let v_Vuna_dCompiler_dParser_dparseImportSpec = fun st -> v_Base_dResult_dstep (v_Vuna_dCompiler_dParser_dexpectKw st "import") (fun _u st1 -> if v_Vuna_dCompiler_dParser_datKw st1 "qualified" then v_Base_dResult_dstep (v_Vuna_dCompiler_dParser_dexpectKw st1 "qualified") (fun _u st2 -> v_Vuna_dCompiler_dParser_dparseImportAlias st2 true) else v_Vuna_dCompiler_dParser_dparseImportAlias st1 false)

let rec v_Vuna_dCompiler_dParser_dparseImports = fun st -> if v_Vuna_dCompiler_dParser_datKw st "import" then v_Base_dResult_dstep (v_Vuna_dCompiler_dParser_dparseImportSpec st) (fun imp st1 -> v_Base_dResult_dstep (v_Vuna_dCompiler_dParser_dparseImports st1) (fun rest st2 -> C_Base_dResult_dOk (C_Base_dPair_dPair ((imp) :: (rest), st2)))) else C_Base_dResult_dOk (C_Base_dPair_dPair ([], st))

let rec v_Vuna_dCompiler_dParser_dlamNames = fun a0 -> match a0 with
  | ([]) -> C_Base_dResult_dOk ([])
  | ((C_Vuna_dCompiler_dAst_dPVar (n, _)) :: (rest)) -> (match v_Vuna_dCompiler_dParser_dlamNames rest with
  | C_Base_dResult_dOk (ns) -> C_Base_dResult_dOk ((n) :: (ns))
  | C_Base_dResult_dErr (e) -> C_Base_dResult_dErr (e)
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Parser.vuna" 374 3 ("case pattern match failure"))
  | ((_) :: (_)) -> C_Base_dResult_dErr ("where function arguments must be simple names")
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Parser.vuna" 372 1 ("no matching clause for Vuna.Compiler.Parser.lamNames")

let rec v_Vuna_dCompiler_dParser_dparseDerivingNames = fun st -> v_Base_dResult_dstep (v_Vuna_dCompiler_dParser_dexpectIdent st) (fun name st1 -> if v_Vuna_dCompiler_dParser_datSym st1 "," then v_Base_dResult_dstep (v_Vuna_dCompiler_dParser_dparseDerivingNames (v_Vuna_dCompiler_dParser_dadvance st1)) (fun rest st2 -> C_Base_dResult_dOk (C_Base_dPair_dPair ((name) :: (rest), st2))) else v_Base_dResult_dstep (v_Vuna_dCompiler_dParser_dexpectSym st1 ")") (fun _u st2 -> C_Base_dResult_dOk (C_Base_dPair_dPair ((name) :: ([]), st2))))

let v_Vuna_dCompiler_dParser_dparseDeriving = fun st -> if v_Vuna_dCompiler_dParser_datKw st "deriving" then v_Base_dResult_dstep (v_Vuna_dCompiler_dParser_dexpectKw st "deriving") (fun _u st1 -> v_Base_dResult_dstep (v_Vuna_dCompiler_dParser_dexpectSym st1 "(") (fun _u st2 -> if v_Vuna_dCompiler_dParser_datSym st2 ")" then C_Base_dResult_dOk (C_Base_dPair_dPair ([], v_Vuna_dCompiler_dParser_dadvance st2)) else v_Base_dResult_dstep (v_Vuna_dCompiler_dParser_dparseDerivingNames st2) (fun names st3 -> C_Base_dResult_dOk (C_Base_dPair_dPair (names, st3))))) else C_Base_dResult_dOk (C_Base_dPair_dPair ([], st))

let v_Vuna_dCompiler_dParser_dinstanceIsDefault = fun name -> (match name with
  | C_Base_dMaybe_dNothing -> true
  | C_Base_dMaybe_dJust (_) -> false
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Parser.vuna" 488 3 ("case pattern match failure"))

let v_Vuna_dCompiler_dParser_dparseInstanceName = fun st -> if v_Vuna_dCompiler_dParser_datKw st "as" then v_Base_dResult_dstep (v_Vuna_dCompiler_dParser_dexpectKw st "as") (fun _u st1 -> v_Base_dResult_dstep (v_Vuna_dCompiler_dParser_dexpectIdent st1) (fun name st2 -> C_Base_dResult_dOk (C_Base_dPair_dPair (C_Base_dMaybe_dJust (name), st2)))) else C_Base_dResult_dOk (C_Base_dPair_dPair (C_Base_dMaybe_dNothing, st))

let rec v_Vuna_dCompiler_dParser_dparseParams = fun st -> (match v_Vuna_dCompiler_dParser_dpeekTok st with
  | C_Vuna_dCompiler_dLexer_dPTok (C_Vuna_dCompiler_dLexer_dTIdent (name), p) -> v_Base_dResult_dstep (v_Vuna_dCompiler_dParser_dparseParams (v_Vuna_dCompiler_dParser_dadvance st)) (fun rest st1 -> C_Base_dResult_dOk (C_Base_dPair_dPair ((name) :: (rest), st1)))
  | _ -> C_Base_dResult_dOk (C_Base_dPair_dPair ([], st))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Parser.vuna" 527 3 ("case pattern match failure"))

let v_Vuna_dCompiler_dParser_dspanFromExpr = fun e st2 -> (let sp = v_Vuna_dCompiler_dAst_dexprSpan e in C_Vuna_dCompiler_dCommon_dSpan (v_Vuna_dCompiler_dCommon_dspanFile sp, v_Vuna_dCompiler_dCommon_dspanStartLine sp, v_Vuna_dCompiler_dCommon_dspanStartCol sp, v_Vuna_dCompiler_dCommon_dposLine (v_Vuna_dCompiler_dParser_dlastPos st2), v_Vuna_dCompiler_dCommon_dposCol (v_Vuna_dCompiler_dParser_dlastPos st2)))

let v_Vuna_dCompiler_dParser_dparseInstanceSelector = fun st blockCol first -> if v_Vuna_dCompiler_dParser_datSym st "@" then v_Base_dResult_dstep (v_Vuna_dCompiler_dParser_dexpectSym st "@") (fun _u st1 -> v_Base_dResult_dstep (v_Vuna_dCompiler_dParser_dexpectIdent st1) (fun name st2 -> C_Base_dResult_dOk (C_Base_dPair_dPair (C_Vuna_dCompiler_dAst_dEInstSel (first, name, v_Vuna_dCompiler_dParser_dspanFromExpr first st2), st2)))) else C_Base_dResult_dOk (C_Base_dPair_dPair (first, st))

let rec v_Vuna_dCompiler_dParser_dparseFieldSuffix = fun st blockCol base -> if v_Vuna_dCompiler_dParser_datSym st "." then v_Base_dResult_dstep (v_Vuna_dCompiler_dParser_dexpectSym st ".") (fun _u st1 -> v_Base_dResult_dstep (v_Vuna_dCompiler_dParser_dexpectIdent st1) (fun fname st2 -> v_Vuna_dCompiler_dParser_dparseFieldSuffix st2 blockCol (C_Vuna_dCompiler_dAst_dEField (base, fname, v_Vuna_dCompiler_dParser_dspanFromExpr base st2)))) else C_Base_dResult_dOk (C_Base_dPair_dPair (base, st))

let rec v_Vuna_dCompiler_dParser_dfoldCons = fun a0 a1 -> match (a0, a1) with
  | (sp, []) -> C_Vuna_dCompiler_dAst_dEVar ("Nil", sp)
  | (sp, (e) :: (rest)) -> C_Vuna_dCompiler_dAst_dEApp (C_Vuna_dCompiler_dAst_dEVar ("Cons", sp), (e) :: ((v_Vuna_dCompiler_dParser_dfoldCons sp rest) :: ([])), sp)
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Parser.vuna" 698 1 ("no matching clause for Vuna.Compiler.Parser.foldCons")

let rec v_Vuna_dCompiler_dParser_dparseLambdaParams = fun st acc -> if v_Vuna_dCompiler_dParser_datSym st "," then v_Base_dResult_dstep (v_Vuna_dCompiler_dParser_dexpectIdent (v_Vuna_dCompiler_dParser_dadvance st)) (fun name st1 -> v_Vuna_dCompiler_dParser_dparseLambdaParams st1 (v_Base_dList_dappend acc ((name) :: ([])))) else C_Base_dResult_dOk (C_Base_dPair_dPair (acc, st))

let rec v_Vuna_dCompiler_dParser_dfoldPCon = fun a0 a1 -> match (a0, a1) with
  | (sp, []) -> C_Vuna_dCompiler_dAst_dPCon ("Nil", [], sp)
  | (sp, (p) :: (rest)) -> C_Vuna_dCompiler_dAst_dPCon ("Cons", (p) :: ((v_Vuna_dCompiler_dParser_dfoldPCon sp rest) :: ([])), sp)
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Parser.vuna" 917 1 ("no matching clause for Vuna.Compiler.Parser.foldPCon")

let rec v_Vuna_dCompiler_dParser_dparsePatternSingle = fun st blockCol -> v_Vuna_dCompiler_dParser_dparsePatternCons st blockCol
and v_Vuna_dCompiler_dParser_dparsePatternCons = fun st blockCol -> v_Base_dResult_dstep (v_Vuna_dCompiler_dParser_dparsePatternHead st blockCol) (fun lhs st1 -> if (if (v_Vuna_dCompiler_dParser_datSym st1 "::") then (v_Vuna_dCompiler_dParser_dcanContinue st1 blockCol) else false) then v_Base_dResult_dstep (v_Vuna_dCompiler_dParser_dparsePatternCons (v_Vuna_dCompiler_dParser_dadvance st1) blockCol) (fun rhs st2 -> C_Base_dResult_dOk (C_Base_dPair_dPair (C_Vuna_dCompiler_dAst_dPCon ("Cons", (lhs) :: ((rhs) :: ([])), v_Vuna_dCompiler_dParser_dspanOf st st2), st2))) else C_Base_dResult_dOk (C_Base_dPair_dPair (lhs, st1)))
and v_Vuna_dCompiler_dParser_dparsePatternHead = fun st blockCol -> (match v_Vuna_dCompiler_dParser_dpeekTok st with
  | C_Vuna_dCompiler_dLexer_dPTok (C_Vuna_dCompiler_dLexer_dTIdent (name), p) -> (let st1 = v_Vuna_dCompiler_dParser_dadvance st in if (if (v_Vuna_dCompiler_dParser_dctorPatternStart name) then (v_Vuna_dCompiler_dParser_datSym st1 "{") else false) then v_Base_dResult_dstep (v_Vuna_dCompiler_dParser_dparseRecordPatternFields st1 blockCol) (fun fields st2 -> C_Base_dResult_dOk (C_Base_dPair_dPair (C_Vuna_dCompiler_dAst_dPRecord (name, fields, v_Vuna_dCompiler_dParser_dspanOf st st2), st2))) else if v_Vuna_dCompiler_dParser_dctorPatternStart name then v_Base_dResult_dstep (v_Vuna_dCompiler_dParser_dparsePatternAtoms st1 blockCol) (fun args st2 -> C_Base_dResult_dOk (C_Base_dPair_dPair (C_Vuna_dCompiler_dAst_dPCon (name, args, v_Vuna_dCompiler_dParser_dspanOf st st2), st2))) else v_Vuna_dCompiler_dParser_dparsePatternAtom st blockCol)
  | _ -> v_Vuna_dCompiler_dParser_dparsePatternAtom st blockCol
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Parser.vuna" 844 3 ("case pattern match failure"))
and v_Vuna_dCompiler_dParser_dparseRecordPatternFields = fun st blockCol -> v_Base_dResult_dstep (v_Vuna_dCompiler_dParser_dexpectSym st "{") (fun _u st1 -> v_Vuna_dCompiler_dParser_dparseRecordPatternList st1 blockCol)
and v_Vuna_dCompiler_dParser_dparseRecordPatternList = fun st blockCol -> if v_Vuna_dCompiler_dParser_datSym st "}" then C_Base_dResult_dOk (C_Base_dPair_dPair ([], v_Vuna_dCompiler_dParser_dadvance st)) else v_Base_dResult_dstep (v_Vuna_dCompiler_dParser_dparseRecordPatternField st blockCol) (fun f st1 -> if v_Vuna_dCompiler_dParser_datSym st1 "," then v_Base_dResult_dstep (v_Vuna_dCompiler_dParser_dparseRecordPatternList (v_Vuna_dCompiler_dParser_dadvance st1) blockCol) (fun rest st2 -> C_Base_dResult_dOk (C_Base_dPair_dPair ((f) :: (rest), st2))) else v_Base_dResult_dstep (v_Vuna_dCompiler_dParser_dexpectSym st1 "}") (fun _u st2 -> C_Base_dResult_dOk (C_Base_dPair_dPair ((f) :: ([]), st2))))
and v_Vuna_dCompiler_dParser_dparseRecordPatternField = fun st blockCol -> (match v_Vuna_dCompiler_dParser_dpeekTok st with
  | C_Vuna_dCompiler_dLexer_dPTok (C_Vuna_dCompiler_dLexer_dTIdent (fname), p) -> (let st1 = v_Vuna_dCompiler_dParser_dadvance st in if v_Vuna_dCompiler_dParser_datSym st1 "=" then v_Base_dResult_dstep (v_Vuna_dCompiler_dParser_dexpectSym st1 "=") (fun _u st2 -> v_Base_dResult_dstep (v_Vuna_dCompiler_dParser_dparsePatternSingle st2 blockCol) (fun pat st3 -> C_Base_dResult_dOk (C_Base_dPair_dPair (C_Base_dPair_dPair (fname, pat), st3)))) else C_Base_dResult_dOk (C_Base_dPair_dPair (C_Base_dPair_dPair (fname, C_Vuna_dCompiler_dAst_dPVar (fname, C_Vuna_dCompiler_dCommon_dSpan (v_Vuna_dCompiler_dParser_dfileOf st, v_Vuna_dCompiler_dCommon_dposLine p, v_Vuna_dCompiler_dCommon_dposCol p, v_Vuna_dCompiler_dCommon_dposLine p, v_Vuna_dCompiler_dCommon_dposCol p))), st1)))
  | _ -> C_Base_dResult_dErr ("expected a record field pattern")
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Parser.vuna" 870 3 ("case pattern match failure"))
and v_Vuna_dCompiler_dParser_dparsePatternAtoms = fun st blockCol -> if (if (v_Vuna_dCompiler_dParser_dstartsPatternAtom st) then (v_Vuna_dCompiler_dParser_dcanContinue st blockCol) else false) then v_Base_dResult_dstep (v_Vuna_dCompiler_dParser_dparsePatternAtom st blockCol) (fun pat st1 -> v_Base_dResult_dstep (v_Vuna_dCompiler_dParser_dparsePatternAtoms st1 blockCol) (fun rest st2 -> C_Base_dResult_dOk (C_Base_dPair_dPair ((pat) :: (rest), st2)))) else C_Base_dResult_dOk (C_Base_dPair_dPair ([], st))
and v_Vuna_dCompiler_dParser_dparsePatternAtom = fun st blockCol -> (match v_Vuna_dCompiler_dParser_dpeekTok st with
  | C_Vuna_dCompiler_dLexer_dPTok (C_Vuna_dCompiler_dLexer_dTIdent ("_"), p) -> C_Base_dResult_dOk (C_Base_dPair_dPair (C_Vuna_dCompiler_dAst_dPWild (v_Vuna_dCompiler_dParser_dspanOf st (v_Vuna_dCompiler_dParser_dadvance st)), v_Vuna_dCompiler_dParser_dadvance st))
  | C_Vuna_dCompiler_dLexer_dPTok (C_Vuna_dCompiler_dLexer_dTIdent (name), p) -> if v_Vuna_dCompiler_dParser_dctorPatternStart name then C_Base_dResult_dOk (C_Base_dPair_dPair (C_Vuna_dCompiler_dAst_dPCon (name, [], v_Vuna_dCompiler_dParser_dspanOf st (v_Vuna_dCompiler_dParser_dadvance st)), v_Vuna_dCompiler_dParser_dadvance st)) else C_Base_dResult_dOk (C_Base_dPair_dPair (C_Vuna_dCompiler_dAst_dPVar (name, v_Vuna_dCompiler_dParser_dspanOf st (v_Vuna_dCompiler_dParser_dadvance st)), v_Vuna_dCompiler_dParser_dadvance st))
  | C_Vuna_dCompiler_dLexer_dPTok (C_Vuna_dCompiler_dLexer_dTInt (n), p) -> C_Base_dResult_dOk (C_Base_dPair_dPair (C_Vuna_dCompiler_dAst_dPInt (n, v_Vuna_dCompiler_dParser_dspanOf st (v_Vuna_dCompiler_dParser_dadvance st)), v_Vuna_dCompiler_dParser_dadvance st))
  | C_Vuna_dCompiler_dLexer_dPTok (C_Vuna_dCompiler_dLexer_dTStr (s), p) -> C_Base_dResult_dOk (C_Base_dPair_dPair (C_Vuna_dCompiler_dAst_dPStr (s, v_Vuna_dCompiler_dParser_dspanOf st (v_Vuna_dCompiler_dParser_dadvance st)), v_Vuna_dCompiler_dParser_dadvance st))
  | C_Vuna_dCompiler_dLexer_dPTok (C_Vuna_dCompiler_dLexer_dTSym ("("), p) -> v_Base_dResult_dstep (v_Vuna_dCompiler_dParser_dparsePatternSingle (v_Vuna_dCompiler_dParser_dadvance st) blockCol) (fun inner st1 -> v_Base_dResult_dstep (v_Vuna_dCompiler_dParser_dexpectSym st1 ")") (fun _u st2 -> C_Base_dResult_dOk (C_Base_dPair_dPair (inner, st2))))
  | C_Vuna_dCompiler_dLexer_dPTok (C_Vuna_dCompiler_dLexer_dTSym ("["), p) -> v_Vuna_dCompiler_dParser_dparseListPattern st blockCol
  | _ -> C_Base_dResult_dErr ("expected pattern")
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Parser.vuna" 889 3 ("case pattern match failure"))
and v_Vuna_dCompiler_dParser_dparseListPattern = fun st blockCol -> v_Base_dResult_dstep (v_Vuna_dCompiler_dParser_dexpectSym st "[") (fun _u st1 -> if v_Vuna_dCompiler_dParser_datSym st1 "]" then C_Base_dResult_dOk (C_Base_dPair_dPair (C_Vuna_dCompiler_dAst_dPCon ("Nil", [], v_Vuna_dCompiler_dParser_dspanOf st (v_Vuna_dCompiler_dParser_dadvance st1)), v_Vuna_dCompiler_dParser_dadvance st1)) else v_Base_dResult_dstep (v_Vuna_dCompiler_dParser_dparseListPatternElems st1 blockCol) (fun pats st2 -> C_Base_dResult_dOk (C_Base_dPair_dPair (v_Vuna_dCompiler_dParser_dfoldPCon (v_Vuna_dCompiler_dParser_dspanOf st st2) pats, st2))))
and v_Vuna_dCompiler_dParser_dparseListPatternElems = fun st blockCol -> v_Base_dResult_dstep (v_Vuna_dCompiler_dParser_dparsePatternSingle st blockCol) (fun pat st1 -> if v_Vuna_dCompiler_dParser_datSym st1 "," then v_Base_dResult_dstep (v_Vuna_dCompiler_dParser_dparseListPatternElems (v_Vuna_dCompiler_dParser_dadvance st1) blockCol) (fun rest st2 -> C_Base_dResult_dOk (C_Base_dPair_dPair ((pat) :: (rest), st2))) else if v_Vuna_dCompiler_dParser_datSym st1 "]" then C_Base_dResult_dOk (C_Base_dPair_dPair ((pat) :: ([]), v_Vuna_dCompiler_dParser_dadvance st1)) else C_Base_dResult_dErr ("expected , or ]"))

let rec v_Vuna_dCompiler_dParser_dparseClausePatterns = fun st blockCol -> if (if (v_Vuna_dCompiler_dParser_dstartsPatternAtom st) then (v_Vuna_dCompiler_dParser_dcanContinue st blockCol) else false) then v_Base_dResult_dstep (v_Vuna_dCompiler_dParser_dparsePatternAtom st blockCol) (fun pat st1 -> v_Base_dResult_dstep (v_Vuna_dCompiler_dParser_dparseClausePatterns st1 blockCol) (fun rest st2 -> C_Base_dResult_dOk (C_Base_dPair_dPair ((pat) :: (rest), st2)))) else C_Base_dResult_dOk (C_Base_dPair_dPair ([], st))

let rec v_Vuna_dCompiler_dParser_dparseExpr = fun st blockCol minPrec -> if v_Vuna_dCompiler_dParser_disEof st then C_Base_dResult_dErr ("unexpected end of input") else if v_Vuna_dCompiler_dParser_dcanContinue st blockCol then v_Base_dResult_dstep (v_Vuna_dCompiler_dParser_dparseLhs st blockCol) (fun lhs st1 -> v_Vuna_dCompiler_dParser_dparseInfix st1 blockCol minPrec lhs) else C_Base_dResult_dErr ("expression is not indented enough")
and v_Vuna_dCompiler_dParser_dparseInfix = fun st blockCol minPrec lhs -> (match v_Vuna_dCompiler_dParser_dpeekTok st with
  | C_Vuna_dCompiler_dLexer_dPTok (C_Vuna_dCompiler_dLexer_dTSym (op), p) -> (match v_Vuna_dCompiler_dParser_dinfixInfo op with
  | C_Base_dMaybe_dJust (C_Base_dPair_dPair (prec, assoc)) -> if (if (v_vuna_uge_uint prec minPrec) then (v_Vuna_dCompiler_dParser_dcanContinue st blockCol) else false) then (let rhsPrec = if v_vuna_ueq_uint assoc 0 then bi_add prec 1 else prec in v_Base_dResult_dstep (v_Vuna_dCompiler_dParser_dparseExpr (v_Vuna_dCompiler_dParser_dadvance st) blockCol rhsPrec) (fun rhs st2 -> v_Vuna_dCompiler_dParser_dparseInfix st2 blockCol minPrec (v_Vuna_dCompiler_dParser_dmkInfixExpr op lhs rhs (v_Vuna_dCompiler_dParser_dspanOf st st2)))) else C_Base_dResult_dOk (C_Base_dPair_dPair (lhs, st))
  | C_Base_dMaybe_dNothing -> C_Base_dResult_dOk (C_Base_dPair_dPair (lhs, st))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Parser.vuna" 565 7 ("case pattern match failure"))
  | _ -> C_Base_dResult_dOk (C_Base_dPair_dPair (lhs, st))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Parser.vuna" 563 3 ("case pattern match failure"))
and v_Vuna_dCompiler_dParser_dparseLhs = fun st blockCol -> (match v_Vuna_dCompiler_dParser_dpeekTok st with
  | C_Vuna_dCompiler_dLexer_dPTok (C_Vuna_dCompiler_dLexer_dTSym ("\\"), p) -> v_Vuna_dCompiler_dParser_dparseLambda st blockCol
  | C_Vuna_dCompiler_dLexer_dPTok (C_Vuna_dCompiler_dLexer_dTKw ("let"), p) -> v_Vuna_dCompiler_dParser_dparseLet st blockCol
  | C_Vuna_dCompiler_dLexer_dPTok (C_Vuna_dCompiler_dLexer_dTKw ("case"), p) -> v_Vuna_dCompiler_dParser_dparseCase st blockCol
  | C_Vuna_dCompiler_dLexer_dPTok (C_Vuna_dCompiler_dLexer_dTKw ("if"), p) -> v_Vuna_dCompiler_dParser_dparseIf st blockCol
  | C_Vuna_dCompiler_dLexer_dPTok (C_Vuna_dCompiler_dLexer_dTKw ("do"), p) -> v_Vuna_dCompiler_dParser_dparseDo st blockCol
  | _ -> v_Vuna_dCompiler_dParser_dparseApplication st blockCol
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Parser.vuna" 576 3 ("case pattern match failure"))
and v_Vuna_dCompiler_dParser_dparseApplication = fun st blockCol -> v_Base_dResult_dstep (v_Vuna_dCompiler_dParser_dparseAtom st blockCol) (fun first st1 -> v_Base_dResult_dstep (v_Vuna_dCompiler_dParser_dparseInstanceSelector st1 blockCol first) (fun first2 st2 -> v_Base_dResult_dstep (v_Vuna_dCompiler_dParser_dparseArgs st2 blockCol) (fun args st3 -> (match args with
  | [] -> C_Base_dResult_dOk (C_Base_dPair_dPair (first2, st3))
  | _ -> C_Base_dResult_dOk (C_Base_dPair_dPair (C_Vuna_dCompiler_dAst_dEApp (first2, args, v_Vuna_dCompiler_dParser_dspanOf st st3), st3))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Parser.vuna" 588 9 ("case pattern match failure")))))
and v_Vuna_dCompiler_dParser_dparseArgs = fun st blockCol -> if (if (v_Vuna_dCompiler_dParser_dstartsAtom st) then (v_Vuna_dCompiler_dParser_dcanContinue st blockCol) else false) then v_Base_dResult_dstep (v_Vuna_dCompiler_dParser_dparseAtom st blockCol) (fun arg st1 -> v_Base_dResult_dstep (v_Vuna_dCompiler_dParser_dparseArgs st1 blockCol) (fun rest st2 -> C_Base_dResult_dOk (C_Base_dPair_dPair ((arg) :: (rest), st2)))) else C_Base_dResult_dOk (C_Base_dPair_dPair ([], st))
and v_Vuna_dCompiler_dParser_dparseAtom = fun st blockCol -> v_Base_dResult_dstep (v_Vuna_dCompiler_dParser_dparseAtomBase st blockCol) (fun base st1 -> v_Vuna_dCompiler_dParser_dparseFieldSuffix st1 blockCol base)
and v_Vuna_dCompiler_dParser_dparseAtomBase = fun st blockCol -> (match v_Vuna_dCompiler_dParser_dpeekTok st with
  | C_Vuna_dCompiler_dLexer_dPTok (C_Vuna_dCompiler_dLexer_dTIdent (name), p) -> (let st1 = v_Vuna_dCompiler_dParser_dadvance st in if v_Vuna_dCompiler_dParser_datSym st1 "{" then v_Base_dResult_dstep (v_Vuna_dCompiler_dParser_dexpectSym st1 "{") (fun _u st1b -> v_Base_dResult_dstep (v_Vuna_dCompiler_dParser_dparseRecordAssignments st1b blockCol) (fun fields st2 -> C_Base_dResult_dOk (C_Base_dPair_dPair (C_Vuna_dCompiler_dAst_dERecord (name, fields, v_Vuna_dCompiler_dParser_dspanOf st st2), st2)))) else C_Base_dResult_dOk (C_Base_dPair_dPair (C_Vuna_dCompiler_dAst_dEVar (name, v_Vuna_dCompiler_dParser_dspanOf st st1), st1)))
  | C_Vuna_dCompiler_dLexer_dPTok (C_Vuna_dCompiler_dLexer_dTInt (n), p) -> C_Base_dResult_dOk (C_Base_dPair_dPair (C_Vuna_dCompiler_dAst_dEInt (n, v_Vuna_dCompiler_dParser_dspanOf st (v_Vuna_dCompiler_dParser_dadvance st)), v_Vuna_dCompiler_dParser_dadvance st))
  | C_Vuna_dCompiler_dLexer_dPTok (C_Vuna_dCompiler_dLexer_dTStr (s), p) -> C_Base_dResult_dOk (C_Base_dPair_dPair (C_Vuna_dCompiler_dAst_dEStr (s, v_Vuna_dCompiler_dParser_dspanOf st (v_Vuna_dCompiler_dParser_dadvance st)), v_Vuna_dCompiler_dParser_dadvance st))
  | C_Vuna_dCompiler_dLexer_dPTok (C_Vuna_dCompiler_dLexer_dTKw ("Type"), p) -> C_Base_dResult_dOk (C_Base_dPair_dPair (C_Vuna_dCompiler_dAst_dEVar ("Type", v_Vuna_dCompiler_dParser_dspanOf st (v_Vuna_dCompiler_dParser_dadvance st)), v_Vuna_dCompiler_dParser_dadvance st))
  | C_Vuna_dCompiler_dLexer_dPTok (C_Vuna_dCompiler_dLexer_dTSym ("("), p) -> (match v_Vuna_dCompiler_dParser_dbinderHeadName (v_Vuna_dCompiler_dParser_dadvance st) with
  | C_Base_dMaybe_dJust (name) -> v_Vuna_dCompiler_dParser_dparsePiBinder st blockCol name false "(" ")"
  | C_Base_dMaybe_dNothing -> v_Base_dResult_dstep (v_Vuna_dCompiler_dParser_dparseExpr (v_Vuna_dCompiler_dParser_dadvance st) blockCol 0) (fun inner st1 -> v_Base_dResult_dstep (v_Vuna_dCompiler_dParser_dexpectSym st1 ")") (fun _u st2 -> C_Base_dResult_dOk (C_Base_dPair_dPair (inner, st2))))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Parser.vuna" 635 7 ("case pattern match failure"))
  | C_Vuna_dCompiler_dLexer_dPTok (C_Vuna_dCompiler_dLexer_dTSym ("["), p) -> v_Vuna_dCompiler_dParser_dparseListExpr st blockCol
  | C_Vuna_dCompiler_dLexer_dPTok (C_Vuna_dCompiler_dLexer_dTSym ("{"), p) -> (match v_Vuna_dCompiler_dParser_dbinderHeadName (v_Vuna_dCompiler_dParser_dadvance st) with
  | C_Base_dMaybe_dJust (name) -> v_Vuna_dCompiler_dParser_dparsePiBinder st blockCol name true "{" "}"
  | C_Base_dMaybe_dNothing -> v_Base_dResult_dstep (v_Vuna_dCompiler_dParser_dexpectSym st "{") (fun _u st1 -> v_Base_dResult_dstep (v_Vuna_dCompiler_dParser_dparseExpr st1 blockCol 0) (fun base st2 -> v_Base_dResult_dstep (v_Vuna_dCompiler_dParser_dexpectSym st2 "|") (fun _u st3 -> v_Base_dResult_dstep (v_Vuna_dCompiler_dParser_dparseRecordAssignments st3 blockCol) (fun fields st4 -> C_Base_dResult_dOk (C_Base_dPair_dPair (C_Vuna_dCompiler_dAst_dERecUpdate (base, fields, v_Vuna_dCompiler_dParser_dspanOf st st4), st4))))))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Parser.vuna" 642 7 ("case pattern match failure"))
  | _ -> C_Base_dResult_dErr ("expected expression")
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Parser.vuna" 623 3 ("case pattern match failure"))
and v_Vuna_dCompiler_dParser_dparsePiBinder = fun st blockCol name implicit openSym closeSym -> if v_Vuna_dCompiler_dCommon_dcontainsDot name then C_Base_dResult_dErr ("pi binder name must be a simple identifier") else v_Base_dResult_dstep (v_Vuna_dCompiler_dParser_dexpectSym st openSym) (fun _u st1 -> v_Base_dResult_dstep (v_Vuna_dCompiler_dParser_dexpectIdent st1) (fun name2 st2 -> v_Base_dResult_dstep (v_Vuna_dCompiler_dParser_dexpectSym st2 ":") (fun _u st3 -> v_Base_dResult_dstep (v_Vuna_dCompiler_dParser_dparseExpr st3 blockCol 0) (fun dom st4 -> v_Base_dResult_dstep (v_Vuna_dCompiler_dParser_dexpectSym st4 closeSym) (fun _u st5 -> v_Base_dResult_dstep (v_Vuna_dCompiler_dParser_dexpectSym st5 "->") (fun _u st6 -> v_Base_dResult_dstep (v_Vuna_dCompiler_dParser_dparseExpr st6 blockCol 1) (fun cod st7 -> C_Base_dResult_dOk (C_Base_dPair_dPair (C_Vuna_dCompiler_dAst_dEPi (name2, implicit, dom, cod, v_Vuna_dCompiler_dParser_dspanOf st st7), st7)))))))))
and v_Vuna_dCompiler_dParser_dparseRecordAssignments = fun st blockCol -> if v_Vuna_dCompiler_dParser_datSym st "}" then C_Base_dResult_dOk (C_Base_dPair_dPair ([], v_Vuna_dCompiler_dParser_dadvance st)) else v_Base_dResult_dstep (v_Vuna_dCompiler_dParser_dparseRecordAssignList st blockCol) (fun fs st1 -> C_Base_dResult_dOk (C_Base_dPair_dPair (fs, st1)))
and v_Vuna_dCompiler_dParser_dparseRecordAssignList = fun st blockCol -> v_Base_dResult_dstep (v_Vuna_dCompiler_dParser_dexpectIdent st) (fun fname st1 -> v_Base_dResult_dstep (v_Vuna_dCompiler_dParser_dexpectSym st1 "=") (fun _u st2 -> v_Base_dResult_dstep (v_Vuna_dCompiler_dParser_dparseExpr st2 blockCol 0) (fun value st3 -> if v_Vuna_dCompiler_dParser_datSym st3 "," then v_Base_dResult_dstep (v_Vuna_dCompiler_dParser_dparseRecordAssignList (v_Vuna_dCompiler_dParser_dadvance st3) blockCol) (fun rest st4 -> C_Base_dResult_dOk (C_Base_dPair_dPair ((C_Base_dPair_dPair (fname, value)) :: (rest), st4))) else v_Base_dResult_dstep (v_Vuna_dCompiler_dParser_dexpectSym st3 "}") (fun _u st4 -> C_Base_dResult_dOk (C_Base_dPair_dPair ((C_Base_dPair_dPair (fname, value)) :: ([]), st4))))))
and v_Vuna_dCompiler_dParser_dparseListExpr = fun st blockCol -> v_Base_dResult_dstep (v_Vuna_dCompiler_dParser_dexpectSym st "[") (fun _u st1 -> if v_Vuna_dCompiler_dParser_datSym st1 "]" then C_Base_dResult_dOk (C_Base_dPair_dPair (C_Vuna_dCompiler_dAst_dEVar ("Nil", v_Vuna_dCompiler_dParser_dspanOf st (v_Vuna_dCompiler_dParser_dadvance st1)), v_Vuna_dCompiler_dParser_dadvance st1)) else v_Base_dResult_dstep (v_Vuna_dCompiler_dParser_dparseListExprElems st1 blockCol) (fun elems st2 -> C_Base_dResult_dOk (C_Base_dPair_dPair (v_Vuna_dCompiler_dParser_dfoldCons (v_Vuna_dCompiler_dParser_dspanOf st st2) elems, st2))))
and v_Vuna_dCompiler_dParser_dparseListExprElems = fun st blockCol -> v_Base_dResult_dstep (v_Vuna_dCompiler_dParser_dparseExpr st blockCol 0) (fun e st1 -> if v_Vuna_dCompiler_dParser_datSym st1 "," then v_Base_dResult_dstep (v_Vuna_dCompiler_dParser_dparseListExprElems (v_Vuna_dCompiler_dParser_dadvance st1) blockCol) (fun rest st2 -> C_Base_dResult_dOk (C_Base_dPair_dPair ((e) :: (rest), st2))) else if v_Vuna_dCompiler_dParser_datSym st1 "]" then C_Base_dResult_dOk (C_Base_dPair_dPair ((e) :: ([]), v_Vuna_dCompiler_dParser_dadvance st1)) else C_Base_dResult_dErr ("expected , or ]"))
and v_Vuna_dCompiler_dParser_dparseLambda = fun st blockCol -> v_Base_dResult_dstep (v_Vuna_dCompiler_dParser_dexpectSym st "\\") (fun _u st1 -> v_Base_dResult_dstep (v_Vuna_dCompiler_dParser_dexpectIdent st1) (fun first st2 -> v_Base_dResult_dstep (v_Vuna_dCompiler_dParser_dparseLambdaParams st2 ((first) :: ([]))) (fun params st3 -> v_Base_dResult_dstep (v_Vuna_dCompiler_dParser_dexpectSym st3 "=>") (fun _u st4 -> v_Base_dResult_dstep (v_Vuna_dCompiler_dParser_dparseExpr st4 blockCol 0) (fun body st5 -> C_Base_dResult_dOk (C_Base_dPair_dPair (C_Vuna_dCompiler_dAst_dELam (params, body, v_Vuna_dCompiler_dParser_dspanOf st st5), st5)))))))
and v_Vuna_dCompiler_dParser_dparseLet = fun st blockCol -> v_Base_dResult_dstep (v_Vuna_dCompiler_dParser_dexpectKw st "let") (fun _u st1 -> v_Base_dResult_dstep (v_Vuna_dCompiler_dParser_dparseLetBindings st1 blockCol) (fun binds st2 -> v_Base_dResult_dstep (v_Vuna_dCompiler_dParser_dexpectKw st2 "in") (fun _u st3 -> v_Base_dResult_dstep (v_Vuna_dCompiler_dParser_dparseExpr st3 blockCol 0) (fun body st4 -> C_Base_dResult_dOk (C_Base_dPair_dPair (C_Vuna_dCompiler_dAst_dELet (binds, body, false, v_Vuna_dCompiler_dParser_dspanOf st st4), st4))))))
and v_Vuna_dCompiler_dParser_dparseLetBindings = fun st blockCol -> if v_Vuna_dCompiler_dParser_disEof st then C_Base_dResult_dErr ("expected a let binding") else if v_Vuna_dCompiler_dParser_datKw st "in" then C_Base_dResult_dErr ("expected a let binding") else (match v_Vuna_dCompiler_dParser_dpeekPos st with
  | C_Vuna_dCompiler_dCommon_dPos (line, col) -> if v_vuna_ule_uint col blockCol then C_Base_dResult_dErr ("let binding is not indented enough") else v_Vuna_dCompiler_dParser_dparseLetBindingsAt st col
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Parser.vuna" 726 5 ("case pattern match failure"))
and v_Vuna_dCompiler_dParser_dparseLetBindingsAt = fun st declCol -> if v_Vuna_dCompiler_dParser_disEof st then C_Base_dResult_dOk (C_Base_dPair_dPair ([], st)) else if v_Vuna_dCompiler_dParser_datKw st "in" then C_Base_dResult_dOk (C_Base_dPair_dPair ([], st)) else (match v_Vuna_dCompiler_dParser_dpeekPos st with
  | C_Vuna_dCompiler_dCommon_dPos (line, col) -> if v_vuna_ueq_uint col declCol then v_Base_dResult_dstep (v_Vuna_dCompiler_dParser_dparsePatternSingle st declCol) (fun pat st1 -> v_Base_dResult_dstep (v_Vuna_dCompiler_dParser_dexpectSym st1 "=") (fun _u st2 -> v_Base_dResult_dstep (v_Vuna_dCompiler_dParser_dparseExpr st2 declCol 0) (fun value st3 -> v_Base_dResult_dstep (v_Vuna_dCompiler_dParser_dparseLetBindingsAt st3 declCol) (fun rest st4 -> C_Base_dResult_dOk (C_Base_dPair_dPair ((C_Base_dPair_dPair (pat, value)) :: (rest), st4)))))) else C_Base_dResult_dOk (C_Base_dPair_dPair ([], st))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Parser.vuna" 735 5 ("case pattern match failure"))
and v_Vuna_dCompiler_dParser_dparseCase = fun st blockCol -> v_Base_dResult_dstep (v_Vuna_dCompiler_dParser_dexpectKw st "case") (fun _u st1 -> v_Base_dResult_dstep (v_Vuna_dCompiler_dParser_dparseExpr st1 blockCol 0) (fun scrut st2 -> v_Base_dResult_dstep (v_Vuna_dCompiler_dParser_dexpectKw st2 "of") (fun _u st3 -> v_Base_dResult_dstep (v_Vuna_dCompiler_dParser_dparseCaseAlts st3 blockCol) (fun alts st4 -> C_Base_dResult_dOk (C_Base_dPair_dPair (C_Vuna_dCompiler_dAst_dECase (scrut, alts, v_Vuna_dCompiler_dParser_dspanOf st st4), st4))))))
and v_Vuna_dCompiler_dParser_dparseCaseAlts = fun st blockCol -> if v_Vuna_dCompiler_dParser_disEof st then C_Base_dResult_dErr ("case expression needs an alternative") else (match v_Vuna_dCompiler_dParser_dpeekPos st with
  | C_Vuna_dCompiler_dCommon_dPos (line, col) -> if v_vuna_ule_uint col blockCol then C_Base_dResult_dErr ("case alternative is not indented enough") else v_Base_dResult_dstep (v_Vuna_dCompiler_dParser_dparseAltList st col) (fun alts st2 -> if v_Vuna_dCompiler_dParser_dbadCaseIndent st2 col then C_Base_dResult_dErr ("unexpected indentation after case alternative") else (match alts with
  | [] -> C_Base_dResult_dErr ("case expression needs an alternative")
  | _ -> C_Base_dResult_dOk (C_Base_dPair_dPair (alts, st2))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Parser.vuna" 762 15 ("case pattern match failure")))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Parser.vuna" 755 5 ("case pattern match failure"))
and v_Vuna_dCompiler_dParser_dparseAltList = fun st altCol -> if v_Vuna_dCompiler_dParser_disEof st then C_Base_dResult_dOk (C_Base_dPair_dPair ([], st)) else (match v_Vuna_dCompiler_dParser_dpeekPos st with
  | C_Vuna_dCompiler_dCommon_dPos (line, col) -> if v_vuna_ueq_uint col altCol then v_Base_dResult_dstep (v_Vuna_dCompiler_dParser_dparsePatternSingle st altCol) (fun pat st1 -> v_Base_dResult_dstep (v_Vuna_dCompiler_dParser_dexpectSym st1 "=>") (fun _u st2 -> v_Base_dResult_dstep (v_Vuna_dCompiler_dParser_dparseExpr st2 altCol 0) (fun body st3 -> v_Base_dResult_dstep (v_Vuna_dCompiler_dParser_dparseAltList st3 altCol) (fun rest st4 -> C_Base_dResult_dOk (C_Base_dPair_dPair ((C_Base_dPair_dPair (pat, body)) :: (rest), st4)))))) else C_Base_dResult_dOk (C_Base_dPair_dPair ([], st))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Parser.vuna" 769 5 ("case pattern match failure"))
and v_Vuna_dCompiler_dParser_dparseIf = fun st blockCol -> v_Base_dResult_dstep (v_Vuna_dCompiler_dParser_dexpectKw st "if") (fun _u st1 -> v_Base_dResult_dstep (v_Vuna_dCompiler_dParser_dparseExpr st1 blockCol 0) (fun cond st2 -> v_Base_dResult_dstep (v_Vuna_dCompiler_dParser_dexpectKw st2 "then") (fun _u st3 -> v_Base_dResult_dstep (v_Vuna_dCompiler_dParser_dparseExpr st3 blockCol 0) (fun yes st4 -> v_Base_dResult_dstep (v_Vuna_dCompiler_dParser_dexpectKw st4 "else") (fun _u st5 -> v_Base_dResult_dstep (v_Vuna_dCompiler_dParser_dparseExpr st5 blockCol 0) (fun no st6 -> C_Base_dResult_dOk (C_Base_dPair_dPair (C_Vuna_dCompiler_dAst_dEIf (cond, yes, no, v_Vuna_dCompiler_dParser_dspanOf st st6), st6))))))))
and v_Vuna_dCompiler_dParser_dparseDo = fun st blockCol -> v_Base_dResult_dstep (v_Vuna_dCompiler_dParser_dexpectKw st "do") (fun _u st1 -> if v_Vuna_dCompiler_dParser_disEof st1 then C_Base_dResult_dErr ("do block needs at least one statement") else (match v_Vuna_dCompiler_dParser_dpeekPos st1 with
  | C_Vuna_dCompiler_dCommon_dPos (line, col) -> if v_vuna_ule_uint col blockCol then C_Base_dResult_dErr ("do block statement is not indented enough") else v_Base_dResult_dstep (v_Vuna_dCompiler_dParser_dparseDoStmts st1 col []) (fun stmts st2 -> (match v_Base_dList_dreverse stmts with
  | (C_Vuna_dCompiler_dAst_dDExpr (lastExpr, lastSp)) :: (rest) -> C_Base_dResult_dOk (C_Base_dPair_dPair (C_Vuna_dCompiler_dAst_dEDo (stmts, v_Vuna_dCompiler_dParser_dspanOf st st2), st2))
  | _ -> C_Base_dResult_dErr ("do block must end with an expression")
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Parser.vuna" 799 15 ("case pattern match failure")))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Parser.vuna" 794 7 ("case pattern match failure")))
and v_Vuna_dCompiler_dParser_dparseDoStmts = fun st stmtCol acc -> if v_Vuna_dCompiler_dParser_disEof st then C_Base_dResult_dOk (C_Base_dPair_dPair (v_Base_dList_dreverse acc, st)) else (match v_Vuna_dCompiler_dParser_dpeekPos st with
  | C_Vuna_dCompiler_dCommon_dPos (line, col) -> if v_vuna_ult_uint col stmtCol then C_Base_dResult_dOk (C_Base_dPair_dPair (v_Base_dList_dreverse acc, st)) else if v_vuna_ugt_uint col stmtCol then C_Base_dResult_dErr ("unexpected indentation in do block") else v_Base_dResult_dstep (v_Vuna_dCompiler_dParser_dparseDoStmt st stmtCol) (fun stmt st1 -> (match v_Vuna_dCompiler_dParser_dpeekPos st1 with
  | C_Vuna_dCompiler_dCommon_dPos (line2, col2) -> if v_Vuna_dCompiler_dParser_disEof st1 then C_Base_dResult_dOk (C_Base_dPair_dPair (v_Base_dList_dreverse ((stmt) :: (acc)), st1)) else if v_vuna_ult_uint col2 stmtCol then C_Base_dResult_dOk (C_Base_dPair_dPair (v_Base_dList_dreverse ((stmt) :: (acc)), st1)) else if v_vuna_ugt_uint col2 stmtCol then C_Base_dResult_dErr ("unexpected indentation in do block") else v_Vuna_dCompiler_dParser_dparseDoStmts st1 stmtCol ((stmt) :: (acc))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Parser.vuna" 813 13 ("case pattern match failure")))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Parser.vuna" 807 5 ("case pattern match failure"))
and v_Vuna_dCompiler_dParser_dparseDoStmt = fun st stmtCol -> (match v_Vuna_dCompiler_dParser_dparsePatternSingle st stmtCol with
  | C_Base_dResult_dOk (C_Base_dPair_dPair (pat, st1)) -> if v_Vuna_dCompiler_dParser_datSym st1 "<-" then v_Base_dResult_dstep (v_Vuna_dCompiler_dParser_dexpectSym st1 "<-") (fun _u st2 -> v_Base_dResult_dstep (v_Vuna_dCompiler_dParser_dparseExpr st2 stmtCol 0) (fun e st3 -> C_Base_dResult_dOk (C_Base_dPair_dPair (C_Vuna_dCompiler_dAst_dDBind (pat, e, v_Vuna_dCompiler_dParser_dspanOf st st3), st3)))) else v_Vuna_dCompiler_dParser_dparseDoExprStmt st stmtCol
  | C_Base_dResult_dErr (_) -> v_Vuna_dCompiler_dParser_dparseDoExprStmt st stmtCol
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Parser.vuna" 821 3 ("case pattern match failure"))
and v_Vuna_dCompiler_dParser_dparseDoExprStmt = fun st stmtCol -> v_Base_dResult_dstep (v_Vuna_dCompiler_dParser_dparseExpr (v_Vuna_dCompiler_dParser_dsameLineState st) stmtCol 0) (fun e st1 -> C_Base_dResult_dOk (C_Base_dPair_dPair (C_Vuna_dCompiler_dAst_dDExpr (e, v_Vuna_dCompiler_dParser_dspanOf st st1), st1)))

let v_Vuna_dCompiler_dParser_dparseExpressionSource = fun source -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dLexer_dlexSource source) (fun toks -> v_Base_dResult_dstep (v_Vuna_dCompiler_dParser_dparseExpr (C_Vuna_dCompiler_dParser_dPState ("<expr>", toks, C_Vuna_dCompiler_dCommon_dPos (1, 0))) 0 0) (fun e st -> if v_Vuna_dCompiler_dParser_disEof st then C_Base_dResult_dOk (e) else C_Base_dResult_dErr ("expected end of expression")))

let v_Vuna_dCompiler_dParser_dparseSignature = fun st blockCol name namePos -> v_Base_dResult_dstep (v_Vuna_dCompiler_dParser_dexpectSym st ":") (fun _u st1 -> v_Base_dResult_dstep (v_Vuna_dCompiler_dParser_dparseExpr st1 blockCol 0) (fun ty st2 -> C_Base_dResult_dOk (C_Base_dPair_dPair (C_Vuna_dCompiler_dAst_dDSig (name, ty, C_Vuna_dCompiler_dCommon_dSpan (v_Vuna_dCompiler_dParser_dfileOf st, v_Vuna_dCompiler_dCommon_dposLine namePos, v_Vuna_dCompiler_dCommon_dposCol namePos, v_Vuna_dCompiler_dCommon_dposLine (v_Vuna_dCompiler_dParser_dlastPos st2), v_Vuna_dCompiler_dCommon_dposCol (v_Vuna_dCompiler_dParser_dlastPos st2))), st2))))

let v_Vuna_dCompiler_dParser_dparseWhereValue = fun st pat blockCol -> v_Base_dResult_dstep (v_Vuna_dCompiler_dParser_dexpectSym st "=") (fun _u st1 -> v_Base_dResult_dstep (v_Vuna_dCompiler_dParser_dparseExpr st1 blockCol 0) (fun value st2 -> C_Base_dResult_dOk (C_Base_dPair_dPair (C_Base_dPair_dPair (pat, value), st2))))

let v_Vuna_dCompiler_dParser_dparseWhereBinding = fun st bindCol -> v_Base_dResult_dstep (v_Vuna_dCompiler_dParser_dparsePatternSingle st bindCol) (fun pat st1 -> (match pat with
  | C_Vuna_dCompiler_dAst_dPVar (name, _) -> if (if (v_Vuna_dCompiler_dParser_dstartsPatternAtom st1) then (v_Vuna_dCompiler_dParser_dcanContinue st1 bindCol) else false) then v_Base_dResult_dstep (v_Vuna_dCompiler_dParser_dparseClausePatterns st1 bindCol) (fun pats st2 -> v_Base_dResult_dstep (v_Vuna_dCompiler_dParser_dexpectSym st2 "=") (fun _u st3 -> v_Base_dResult_dstep (v_Vuna_dCompiler_dParser_dparseExpr st3 bindCol 0) (fun value st4 -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dParser_dlamNames pats) (fun names -> C_Base_dResult_dOk (C_Base_dPair_dPair (C_Base_dPair_dPair (C_Vuna_dCompiler_dAst_dPVar (name, v_Vuna_dCompiler_dAst_dpatSpan pat), C_Vuna_dCompiler_dAst_dELam (names, value, v_Vuna_dCompiler_dParser_dspanOf st st4)), st4)))))) else v_Vuna_dCompiler_dParser_dparseWhereValue st1 pat bindCol
  | _ -> v_Vuna_dCompiler_dParser_dparseWhereValue st1 pat bindCol
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Parser.vuna" 355 5 ("case pattern match failure")))

let rec v_Vuna_dCompiler_dParser_dparseWhereBindingsAt = fun st bindCol -> if v_Vuna_dCompiler_dParser_disEof st then C_Base_dResult_dOk (C_Base_dPair_dPair ([], st)) else (match v_Vuna_dCompiler_dParser_dpeekPos st with
  | C_Vuna_dCompiler_dCommon_dPos (line, col) -> if v_vuna_ueq_uint col bindCol then v_Base_dResult_dstep (v_Vuna_dCompiler_dParser_dparseWhereBinding st bindCol) (fun b st1 -> v_Base_dResult_dstep (v_Vuna_dCompiler_dParser_dparseWhereBindingsAt st1 bindCol) (fun rest st2 -> C_Base_dResult_dOk (C_Base_dPair_dPair ((b) :: (rest), st2)))) else if v_vuna_ugt_uint col bindCol then C_Base_dResult_dErr ("unexpected indentation in where block") else C_Base_dResult_dOk (C_Base_dPair_dPair ([], st))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Parser.vuna" 343 5 ("case pattern match failure"))

let v_Vuna_dCompiler_dParser_dparseWhereBindings = fun st whereCol -> if v_Vuna_dCompiler_dParser_disEof st then C_Base_dResult_dOk (C_Base_dPair_dPair ([], st)) else (match v_Vuna_dCompiler_dParser_dpeekPos st with
  | C_Vuna_dCompiler_dCommon_dPos (line, col) -> if v_vuna_ugt_uint col whereCol then v_Vuna_dCompiler_dParser_dparseWhereBindingsAt st col else C_Base_dResult_dOk (C_Base_dPair_dPair ([], st))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Parser.vuna" 335 5 ("case pattern match failure"))

let v_Vuna_dCompiler_dParser_dparseWhere = fun st blockCol -> (match v_Vuna_dCompiler_dParser_dpeekTok st with
  | C_Vuna_dCompiler_dLexer_dPTok (C_Vuna_dCompiler_dLexer_dTKw ("where"), p) -> if v_vuna_ugt_uint (v_Vuna_dCompiler_dCommon_dposCol p) blockCol then v_Base_dResult_dstep (C_Base_dResult_dOk (C_Base_dPair_dPair (0, v_Vuna_dCompiler_dParser_dadvance st))) (fun _u st1 -> v_Base_dResult_dstep (v_Vuna_dCompiler_dParser_dparseWhereBindings st1 blockCol) (fun binds st2 -> C_Base_dResult_dOk (C_Base_dPair_dPair (binds, st2)))) else C_Base_dResult_dOk (C_Base_dPair_dPair ([], st))
  | _ -> C_Base_dResult_dOk (C_Base_dPair_dPair ([], st))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Parser.vuna" 323 3 ("case pattern match failure"))

let v_Vuna_dCompiler_dParser_dparseClause = fun st blockCol name namePos -> v_Base_dResult_dstep (v_Vuna_dCompiler_dParser_dparseClausePatterns st blockCol) (fun pats st1 -> v_Base_dResult_dstep (v_Vuna_dCompiler_dParser_dexpectSym st1 "=") (fun _u st2 -> v_Base_dResult_dstep (v_Vuna_dCompiler_dParser_dparseExpr st2 blockCol 0) (fun body st3 -> v_Base_dResult_dstep (v_Vuna_dCompiler_dParser_dparseWhere st3 blockCol) (fun wheres st4 -> (let body2 = (match wheres with
  | [] -> body
  | (_) :: (_) -> C_Vuna_dCompiler_dAst_dELet (wheres, body, true, v_Vuna_dCompiler_dParser_dspanOf st st4)
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Parser.vuna" 316 17 ("case pattern match failure")) in C_Base_dResult_dOk (C_Base_dPair_dPair (C_Vuna_dCompiler_dAst_dDFun (name, pats, body2, C_Vuna_dCompiler_dCommon_dSpan (v_Vuna_dCompiler_dParser_dfileOf st, v_Vuna_dCompiler_dCommon_dposLine namePos, v_Vuna_dCompiler_dCommon_dposCol namePos, v_Vuna_dCompiler_dCommon_dposLine (v_Vuna_dCompiler_dParser_dlastPos st4), v_Vuna_dCompiler_dCommon_dposCol (v_Vuna_dCompiler_dParser_dlastPos st4))), st4)))))))

let rec v_Vuna_dCompiler_dParser_dparseFieldList = fun st fieldCol -> if v_Vuna_dCompiler_dParser_disEof st then C_Base_dResult_dOk (C_Base_dPair_dPair ([], st)) else (match v_Vuna_dCompiler_dParser_dpeekPos st with
  | C_Vuna_dCompiler_dCommon_dPos (line, col) -> if v_vuna_ueq_uint col fieldCol then v_Base_dResult_dstep (v_Vuna_dCompiler_dParser_dexpectIdent st) (fun name st1 -> v_Base_dResult_dstep (v_Vuna_dCompiler_dParser_dexpectSym st1 ":") (fun _u st2 -> v_Base_dResult_dstep (v_Vuna_dCompiler_dParser_dparseExpr st2 fieldCol 0) (fun ty st3 -> v_Base_dResult_dstep (v_Vuna_dCompiler_dParser_dparseFieldList st3 fieldCol) (fun rest st4 -> C_Base_dResult_dOk (C_Base_dPair_dPair ((C_Vuna_dCompiler_dAst_dField (name, ty, v_Vuna_dCompiler_dParser_dspanOf st st3)) :: (rest), st4)))))) else if v_vuna_ugt_uint col fieldCol then C_Base_dResult_dErr ("unexpected indentation in record block") else C_Base_dResult_dOk (C_Base_dPair_dPair ([], st))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Parser.vuna" 418 5 ("case pattern match failure"))

let v_Vuna_dCompiler_dParser_dparseFields = fun st blockCol -> if v_Vuna_dCompiler_dParser_disEof st then C_Base_dResult_dOk (C_Base_dPair_dPair ([], st)) else (match v_Vuna_dCompiler_dParser_dpeekPos st with
  | C_Vuna_dCompiler_dCommon_dPos (line, col) -> if v_vuna_ugt_uint col blockCol then v_Vuna_dCompiler_dParser_dparseFieldList st col else C_Base_dResult_dOk (C_Base_dPair_dPair ([], st))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Parser.vuna" 410 5 ("case pattern match failure"))

let v_Vuna_dCompiler_dParser_dparseRecord = fun st blockCol kwPos -> v_Base_dResult_dstep (v_Vuna_dCompiler_dParser_dexpectKw st "record") (fun _u st1 -> v_Base_dResult_dstep (v_Vuna_dCompiler_dParser_dexpectIdent st1) (fun name st2 -> v_Base_dResult_dstep (v_Vuna_dCompiler_dParser_dparseParams st2) (fun params st3 -> v_Base_dResult_dstep (v_Vuna_dCompiler_dParser_dexpectKw st3 "where") (fun _u st4 -> v_Base_dResult_dstep (v_Vuna_dCompiler_dParser_dparseFields st4 blockCol) (fun fields st5 -> v_Base_dResult_dstep (v_Vuna_dCompiler_dParser_dparseDeriving st5) (fun derivings st6 -> C_Base_dResult_dOk (C_Base_dPair_dPair (C_Vuna_dCompiler_dAst_dDRecord (name, params, fields, derivings, C_Vuna_dCompiler_dCommon_dSpan (v_Vuna_dCompiler_dParser_dfileOf st, v_Vuna_dCompiler_dCommon_dposLine kwPos, v_Vuna_dCompiler_dCommon_dposCol kwPos, v_Vuna_dCompiler_dCommon_dposLine (v_Vuna_dCompiler_dParser_dlastPos st6), v_Vuna_dCompiler_dCommon_dposCol (v_Vuna_dCompiler_dParser_dlastPos st6))), st6))))))))

let rec v_Vuna_dCompiler_dParser_dparseMethodSigList = fun st methodCol -> if v_Vuna_dCompiler_dParser_disEof st then C_Base_dResult_dOk (C_Base_dPair_dPair ([], st)) else (match v_Vuna_dCompiler_dParser_dpeekPos st with
  | C_Vuna_dCompiler_dCommon_dPos (line, col) -> if v_vuna_ueq_uint col methodCol then v_Base_dResult_dstep (v_Vuna_dCompiler_dParser_dexpectIdent st) (fun name st1 -> v_Base_dResult_dstep (v_Vuna_dCompiler_dParser_dexpectSym st1 ":") (fun _u st2 -> v_Base_dResult_dstep (v_Vuna_dCompiler_dParser_dparseExpr st2 methodCol 0) (fun ty st3 -> v_Base_dResult_dstep (v_Vuna_dCompiler_dParser_dparseMethodSigList st3 methodCol) (fun rest st4 -> C_Base_dResult_dOk (C_Base_dPair_dPair ((C_Base_dPair_dPair (name, ty)) :: (rest), st4)))))) else if v_vuna_ugt_uint col methodCol then C_Base_dResult_dErr ("unexpected indentation in trait block") else C_Base_dResult_dOk (C_Base_dPair_dPair ([], st))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Parser.vuna" 466 5 ("case pattern match failure"))

let v_Vuna_dCompiler_dParser_dparseMethodSigs = fun st blockCol -> if v_Vuna_dCompiler_dParser_disEof st then C_Base_dResult_dOk (C_Base_dPair_dPair ([], st)) else (match v_Vuna_dCompiler_dParser_dpeekPos st with
  | C_Vuna_dCompiler_dCommon_dPos (line, col) -> if v_vuna_ugt_uint col blockCol then v_Vuna_dCompiler_dParser_dparseMethodSigList st col else C_Base_dResult_dOk (C_Base_dPair_dPair ([], st))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Parser.vuna" 458 5 ("case pattern match failure"))

let v_Vuna_dCompiler_dParser_dparseTrait = fun st blockCol kwPos -> v_Base_dResult_dstep (v_Vuna_dCompiler_dParser_dexpectKw st "trait") (fun _u st1 -> v_Base_dResult_dstep (v_Vuna_dCompiler_dParser_dexpectIdent st1) (fun name st2 -> v_Base_dResult_dstep (v_Vuna_dCompiler_dParser_dparseParams st2) (fun params st3 -> v_Base_dResult_dstep (v_Vuna_dCompiler_dParser_dexpectKw st3 "where") (fun _u st4 -> v_Base_dResult_dstep (v_Vuna_dCompiler_dParser_dparseMethodSigs st4 blockCol) (fun methods st5 -> C_Base_dResult_dOk (C_Base_dPair_dPair (C_Vuna_dCompiler_dAst_dDTrait (name, params, methods, C_Vuna_dCompiler_dCommon_dSpan (v_Vuna_dCompiler_dParser_dfileOf st, v_Vuna_dCompiler_dCommon_dposLine kwPos, v_Vuna_dCompiler_dCommon_dposCol kwPos, v_Vuna_dCompiler_dCommon_dposLine (v_Vuna_dCompiler_dParser_dlastPos st5), v_Vuna_dCompiler_dCommon_dposCol (v_Vuna_dCompiler_dParser_dlastPos st5))), st5)))))))

let v_Vuna_dCompiler_dParser_dparseInstanceDecl = fun st blockCol -> (match v_Vuna_dCompiler_dParser_dpeekTok st with
  | C_Vuna_dCompiler_dLexer_dPTok (C_Vuna_dCompiler_dLexer_dTIdent (name), p) -> (let st1 = v_Vuna_dCompiler_dParser_dadvance st in if v_Vuna_dCompiler_dParser_datSym st1 ":" then v_Vuna_dCompiler_dParser_dparseSignature st1 blockCol name p else v_Vuna_dCompiler_dParser_dparseClause st1 blockCol name p)
  | _ -> C_Base_dResult_dErr ("expected an instance method")
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Parser.vuna" 519 3 ("case pattern match failure"))

let rec v_Vuna_dCompiler_dParser_dparseInstanceDeclList = fun st declCol -> if v_Vuna_dCompiler_dParser_disEof st then C_Base_dResult_dOk (C_Base_dPair_dPair ([], st)) else (match v_Vuna_dCompiler_dParser_dpeekPos st with
  | C_Vuna_dCompiler_dCommon_dPos (line, col) -> if v_vuna_ueq_uint col declCol then v_Base_dResult_dstep (v_Vuna_dCompiler_dParser_dparseInstanceDecl st declCol) (fun decl st1 -> v_Base_dResult_dstep (v_Vuna_dCompiler_dParser_dparseInstanceDeclList st1 declCol) (fun rest st2 -> C_Base_dResult_dOk (C_Base_dPair_dPair ((decl) :: (rest), st2)))) else if v_vuna_ugt_uint col declCol then C_Base_dResult_dErr ("unexpected indentation in instance block") else C_Base_dResult_dOk (C_Base_dPair_dPair ([], st))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Parser.vuna" 509 5 ("case pattern match failure"))

let v_Vuna_dCompiler_dParser_dparseInstanceBody = fun st blockCol -> if v_Vuna_dCompiler_dParser_disEof st then C_Base_dResult_dOk (C_Base_dPair_dPair ([], st)) else (match v_Vuna_dCompiler_dParser_dpeekPos st with
  | C_Vuna_dCompiler_dCommon_dPos (line, col) -> if v_vuna_ugt_uint col blockCol then v_Vuna_dCompiler_dParser_dparseInstanceDeclList st col else C_Base_dResult_dOk (C_Base_dPair_dPair ([], st))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Parser.vuna" 501 5 ("case pattern match failure"))

let v_Vuna_dCompiler_dParser_dparseInstance = fun st blockCol kwPos -> v_Base_dResult_dstep (v_Vuna_dCompiler_dParser_dexpectKw st "instance") (fun _u st1 -> v_Base_dResult_dstep (v_Vuna_dCompiler_dParser_dparseExpr st1 blockCol 0) (fun head st2 -> v_Base_dResult_dstep (v_Vuna_dCompiler_dParser_dparseInstanceName st2) (fun name st3 -> v_Base_dResult_dstep (v_Vuna_dCompiler_dParser_dexpectKw st3 "where") (fun _u st4 -> v_Base_dResult_dstep (v_Vuna_dCompiler_dParser_dparseInstanceBody st4 blockCol) (fun methods st5 -> (let isDefault = v_Vuna_dCompiler_dParser_dinstanceIsDefault name in C_Base_dResult_dOk (C_Base_dPair_dPair (C_Vuna_dCompiler_dAst_dDInstance (name, isDefault, head, methods, C_Vuna_dCompiler_dCommon_dSpan (v_Vuna_dCompiler_dParser_dfileOf st, v_Vuna_dCompiler_dCommon_dposLine kwPos, v_Vuna_dCompiler_dCommon_dposCol kwPos, v_Vuna_dCompiler_dCommon_dposLine (v_Vuna_dCompiler_dParser_dlastPos st5), v_Vuna_dCompiler_dCommon_dposCol (v_Vuna_dCompiler_dParser_dlastPos st5))), st5))))))))

let rec v_Vuna_dCompiler_dParser_dparseCtorList = fun st ctorCol -> if v_Vuna_dCompiler_dParser_disEof st then C_Base_dResult_dOk (C_Base_dPair_dPair ([], st)) else (match v_Vuna_dCompiler_dParser_dpeekPos st with
  | C_Vuna_dCompiler_dCommon_dPos (line, col) -> if v_vuna_ueq_uint col ctorCol then v_Base_dResult_dstep (v_Vuna_dCompiler_dParser_dexpectIdent st) (fun name st1 -> v_Base_dResult_dstep (v_Vuna_dCompiler_dParser_dexpectSym st1 ":") (fun _u st2 -> v_Base_dResult_dstep (v_Vuna_dCompiler_dParser_dparseExpr st2 ctorCol 0) (fun ty st3 -> v_Base_dResult_dstep (v_Vuna_dCompiler_dParser_dparseCtorList st3 ctorCol) (fun rest st4 -> C_Base_dResult_dOk (C_Base_dPair_dPair ((C_Vuna_dCompiler_dAst_dCtor (name, ty, v_Vuna_dCompiler_dParser_dcountArrows ty, v_Vuna_dCompiler_dParser_dspanOf st st3)) :: (rest), st4)))))) else if v_vuna_ugt_uint col ctorCol then C_Base_dResult_dErr ("unexpected indentation in data block") else C_Base_dResult_dOk (C_Base_dPair_dPair ([], st))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Parser.vuna" 544 5 ("case pattern match failure"))

let v_Vuna_dCompiler_dParser_dparseCtors = fun st blockCol -> if v_Vuna_dCompiler_dParser_disEof st then C_Base_dResult_dOk (C_Base_dPair_dPair ([], st)) else (match v_Vuna_dCompiler_dParser_dpeekPos st with
  | C_Vuna_dCompiler_dCommon_dPos (line, col) -> if v_vuna_ugt_uint col blockCol then v_Vuna_dCompiler_dParser_dparseCtorList st col else C_Base_dResult_dOk (C_Base_dPair_dPair ([], st))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Parser.vuna" 536 5 ("case pattern match failure"))

let v_Vuna_dCompiler_dParser_dparseData = fun st blockCol kwPos -> v_Base_dResult_dstep (v_Vuna_dCompiler_dParser_dexpectKw st "data") (fun _u st1 -> v_Base_dResult_dstep (v_Vuna_dCompiler_dParser_dexpectIdent st1) (fun name st2 -> v_Base_dResult_dstep (v_Vuna_dCompiler_dParser_dparseParams st2) (fun params st3 -> v_Base_dResult_dstep (v_Vuna_dCompiler_dParser_dexpectSym st3 ":") (fun _u st4 -> v_Base_dResult_dstep (v_Vuna_dCompiler_dParser_dparseExpr st4 blockCol 0) (fun ty st5 -> v_Base_dResult_dstep (v_Vuna_dCompiler_dParser_dexpectKw st5 "where") (fun _u st6 -> v_Base_dResult_dstep (v_Vuna_dCompiler_dParser_dparseCtors st6 blockCol) (fun ctors st7 -> v_Base_dResult_dstep (v_Vuna_dCompiler_dParser_dparseDeriving st7) (fun derivings st8 -> C_Base_dResult_dOk (C_Base_dPair_dPair (C_Vuna_dCompiler_dAst_dDData (name, params, ty, ctors, derivings, C_Vuna_dCompiler_dCommon_dSpan (v_Vuna_dCompiler_dParser_dfileOf st, v_Vuna_dCompiler_dCommon_dposLine kwPos, v_Vuna_dCompiler_dCommon_dposCol kwPos, v_Vuna_dCompiler_dCommon_dposLine (v_Vuna_dCompiler_dParser_dlastPos st8), v_Vuna_dCompiler_dCommon_dposCol (v_Vuna_dCompiler_dParser_dlastPos st8))), st8))))))))))

let v_Vuna_dCompiler_dParser_dparseDecl = fun st blockCol -> (match v_Vuna_dCompiler_dParser_dpeekTok st with
  | C_Vuna_dCompiler_dLexer_dPTok (C_Vuna_dCompiler_dLexer_dTKw ("data"), p) -> v_Vuna_dCompiler_dParser_dparseData st blockCol p
  | C_Vuna_dCompiler_dLexer_dPTok (C_Vuna_dCompiler_dLexer_dTKw ("record"), p) -> v_Vuna_dCompiler_dParser_dparseRecord st blockCol p
  | C_Vuna_dCompiler_dLexer_dPTok (C_Vuna_dCompiler_dLexer_dTKw ("trait"), p) -> v_Vuna_dCompiler_dParser_dparseTrait st blockCol p
  | C_Vuna_dCompiler_dLexer_dPTok (C_Vuna_dCompiler_dLexer_dTKw ("instance"), p) -> v_Vuna_dCompiler_dParser_dparseInstance st blockCol p
  | C_Vuna_dCompiler_dLexer_dPTok (C_Vuna_dCompiler_dLexer_dTIdent (name), p) -> (let st1 = v_Vuna_dCompiler_dParser_dadvance st in if v_Vuna_dCompiler_dParser_datSym st1 ":" then v_Vuna_dCompiler_dParser_dparseSignature st1 blockCol name p else v_Vuna_dCompiler_dParser_dparseClause st1 blockCol name p)
  | _ -> C_Base_dResult_dErr ("expected a top-level declaration")
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Parser.vuna" 294 3 ("case pattern match failure"))

let rec v_Vuna_dCompiler_dParser_dparseDecls = fun st blockCol -> if v_Vuna_dCompiler_dParser_disEof st then C_Base_dResult_dOk (C_Base_dPair_dPair ([], st)) else (match v_Vuna_dCompiler_dParser_dpeekPos st with
  | C_Vuna_dCompiler_dCommon_dPos (line, col) -> if v_vuna_ueq_uint col blockCol then v_Base_dResult_dstep (v_Vuna_dCompiler_dParser_dparseDecl st blockCol) (fun decl st1 -> v_Base_dResult_dstep (v_Vuna_dCompiler_dParser_dparseDecls st1 blockCol) (fun rest st2 -> C_Base_dResult_dOk (C_Base_dPair_dPair ((decl) :: (rest), st2)))) else C_Base_dResult_dErr ((("expected a declaration at column ") ^ (bi_str_from_int blockCol)))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Parser.vuna" 285 5 ("case pattern match failure"))

let v_Vuna_dCompiler_dParser_dparseSourceFile = fun st -> v_Base_dResult_dstep (v_Vuna_dCompiler_dParser_dparseModDecl st) (fun hdr st1 -> v_Base_dResult_dstep (v_Vuna_dCompiler_dParser_dparseImports st1) (fun imports st2 -> if v_Vuna_dCompiler_dParser_disEof st2 then C_Base_dResult_dOk (C_Base_dPair_dPair (C_Vuna_dCompiler_dAst_dSource (hdr, imports, []), st2)) else (match v_Vuna_dCompiler_dParser_dpeekPos st2 with
  | C_Vuna_dCompiler_dCommon_dPos (line, col) -> v_Base_dResult_dstep (v_Vuna_dCompiler_dParser_dparseDecls st2 col) (fun decls st3 -> if v_Vuna_dCompiler_dParser_disEof st3 then C_Base_dResult_dOk (C_Base_dPair_dPair (C_Vuna_dCompiler_dAst_dSource (hdr, imports, decls), st3)) else C_Base_dResult_dErr ("expected end of input"))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Parser.vuna" 212 9 ("case pattern match failure"))))

let v_Vuna_dCompiler_dParser_dparseSource = fun file source -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dLexer_dlexSource source) (fun toks -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dParser_dparseSourceFile (C_Vuna_dCompiler_dParser_dPState (file, toks, C_Vuna_dCompiler_dCommon_dPos (1, 0)))) (fun p -> C_Base_dResult_dOk (v_Base_dPair_dfirstOf p)))

let v_vuna_ueq_uVuna_uCompiler_uParser_uPState = fun x y -> (match x with
  | C_Vuna_dCompiler_dParser_dPState (v0, v1, v2) -> (match y with
  | C_Vuna_dCompiler_dParser_dPState (w0, w1, w2) -> (if ((if (v_vuna_ueq_ustr v0 w0) then (v_vuna_ueq_uBase_uList_uList v1 w1) else false)) then (v_vuna_ueq_uVuna_uCompiler_uCommon_uPos v2 w2) else false)
  | _ -> v_vuna_ueq_uint 0 1
  | _ -> vuna_fail "<generated>" 187 43 ("case pattern match failure"))
  | _ -> v_vuna_ueq_uint 0 1
  | _ -> vuna_fail "<generated>" 186 43 ("case pattern match failure"))

let v_vuna_uneq_uVuna_uCompiler_uParser_uPState = fun x y -> if v_vuna_ueq_uVuna_uCompiler_uParser_uPState x y then v_vuna_ueq_uint 0 1 else v_vuna_ueq_uint 0 0
