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
let v_Vuna_dRepl_dreplTempFile = "/tmp/vuna-repl.vuna"

let v_Vuna_dRepl_dreplPrompt = "vuna> "

let v_Vuna_dRepl_dreplHelp = "\229\145\189\228\187\164\239\188\154
  :help    \230\152\190\231\164\186\229\184\174\229\138\169
  :reset   \230\184\133\231\169\186\229\183\178\232\190\147\229\133\165\231\154\132\229\174\154\228\185\137\228\184\142 import
  :quit    \233\128\128\229\135\186\239\188\136\229\144\140 Ctrl-D\239\188\137
\229\133\182\228\187\150\232\190\147\229\133\165\230\140\137 vuna \230\186\144\231\160\129\229\164\132\231\144\134\239\188\154`import ...` \228\184\142\229\174\154\228\185\137\228\188\154\232\162\171\231\180\175\231\167\175\239\188\140\232\161\168\232\190\190\229\188\143\228\188\154\231\171\139\229\141\179\230\177\130\229\128\188\227\128\130
"

let rec v_Vuna_dRepl_dreplLoop = fun roots imports defs -> (let _ = bi_print v_Vuna_dRepl_dreplPrompt in (let line = bi_read_line () in if v_vuna_ueq_ustr line "" then 0 else v_Vuna_dRepl_dreplHandle roots imports defs (v_Vuna_dString_dtrim line)))
and v_Vuna_dRepl_dreplHandle = fun roots imports defs line -> (match line with
  | "" -> v_Vuna_dRepl_dreplLoop roots imports defs
  | ":q" -> 0
  | ":quit" -> 0
  | ":reset" -> (let _ = bi_print "\229\183\178\230\184\133\231\169\186\n" in v_Vuna_dRepl_dreplLoop roots "" "")
  | ":help" -> (let _ = bi_print v_Vuna_dRepl_dreplHelp in v_Vuna_dRepl_dreplLoop roots imports defs)
  | _ -> if v_Vuna_dString_dstartsWith "import " line then v_Vuna_dRepl_dreplAddImport roots imports defs line else v_Vuna_dRepl_dreplDefineOrEval roots imports defs line
  | _ -> vuna_fail "./lib/Vuna/Repl.vuna" 42 3 ("case pattern match failure"))
and v_Vuna_dRepl_dreplAddImport = fun roots imports defs line -> (let imports2 = (let vuna_cat0' = (imports) in (let vuna_cat1' = (line) in (let vuna_cat2' = ("\n") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2']))) in (match v_Vuna_dParser_dparseSource v_Vuna_dRepl_dreplTempFile (((imports2) ^ (defs))) with
  | C_Vuna_dResult_dErr (e) -> (let _ = bi_print ((let vuna_cat0' = ("parse error: ") in (let vuna_cat1' = (e) in (let vuna_cat2' = ("\n") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'])))) in v_Vuna_dRepl_dreplLoop roots imports defs)
  | C_Vuna_dResult_dOk (_) -> v_Vuna_dRepl_dreplLoop roots imports2 defs
  | _ -> vuna_fail "./lib/Vuna/Repl.vuna" 58 6 ("case pattern match failure")))
and v_Vuna_dRepl_dreplDefineOrEval = fun roots imports defs line -> (match v_Vuna_dParser_dparseSource v_Vuna_dRepl_dreplTempFile ((let vuna_cat0' = (imports) in (let vuna_cat1' = (defs) in (let vuna_cat2' = (line) in (let vuna_cat3' = ("\n") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3']))))) with
  | C_Vuna_dResult_dOk (C_Vuna_dAst_dSource (hdr, imp, decls)) -> (match hdr with
  | C_Vuna_dMaybe_dJust (md) -> v_Vuna_dRepl_dreplEvalExpr roots imports defs line
  | C_Vuna_dMaybe_dNothing -> v_Vuna_dRepl_dreplLoop roots imports ((let vuna_cat0' = (defs) in (let vuna_cat1' = (line) in (let vuna_cat2' = ("\n") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2']))))
  | _ -> vuna_fail "./lib/Vuna/Repl.vuna" 65 7 ("case pattern match failure"))
  | C_Vuna_dResult_dErr (e) -> v_Vuna_dRepl_dreplEvalExpr roots imports defs line
  | _ -> vuna_fail "./lib/Vuna/Repl.vuna" 63 3 ("case pattern match failure"))
and v_Vuna_dRepl_dreplEvalExpr = fun roots imports defs line -> (match v_Vuna_dParser_dparseExpressionSource line with
  | C_Vuna_dResult_dErr (e) -> (let _ = bi_print ((let vuna_cat0' = ("\233\148\153\232\175\175: ") in (let vuna_cat1' = (e) in (let vuna_cat2' = ("\n") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'])))) in v_Vuna_dRepl_dreplLoop roots imports defs)
  | C_Vuna_dResult_dOk (expr) -> (let program = (let vuna_cat0' = (imports) in (let vuna_cat1' = ("\n") in (let vuna_cat2' = (defs) in (let vuna_cat3' = ("\nmain = ") in (let vuna_cat4' = (line) in (let vuna_cat5' = ("\n") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'; vuna_cat4'; vuna_cat5'])))))) in (let _ = bi_write_file v_Vuna_dRepl_dreplTempFile program in (let output = v_Vuna_dInterp_dinterpretFile roots v_Vuna_dRepl_dreplTempFile in (let _ = bi_print (((output) ^ ("\n"))) in v_Vuna_dRepl_dreplLoop roots imports defs))))
  | _ -> vuna_fail "./lib/Vuna/Repl.vuna" 71 3 ("case pattern match failure"))

let v_Vuna_dRepl_drunRepl = fun roots -> (let _ = bi_print ((("vuna repl\n") ^ (v_Vuna_dRepl_dreplHelp))) in v_Vuna_dRepl_dreplLoop roots "" "")
