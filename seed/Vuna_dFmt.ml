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
let rec v_Vuna_dFmt_dspaces = fun n -> if v_vuna_ule_uint n 0 then "" else ((" ") ^ (v_Vuna_dFmt_dspaces (bi_sub n 1)))

let rec v_Vuna_dFmt_dconcatStrings = fun a0 -> match a0 with
  | ([]) -> ""
  | ((s) :: (rest)) -> ((s) ^ (v_Vuna_dFmt_dconcatStrings rest))
  | _ -> vuna_fail "./lib/Vuna/Fmt.vuna" 18 1 ("no matching clause for Vuna.Fmt.concatStrings")

let rec v_Vuna_dFmt_djoinComma = fun a0 -> match a0 with
  | ([]) -> ""
  | ((x) :: ([])) -> x
  | ((x) :: (rest)) -> (let vuna_cat0' = (x) in (let vuna_cat1' = (", ") in (let vuna_cat2' = (v_Vuna_dFmt_djoinComma rest) in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'])))
  | _ -> vuna_fail "./lib/Vuna/Fmt.vuna" 21 1 ("no matching clause for Vuna.Fmt.joinComma")

let rec v_Vuna_dFmt_djoinSpace = fun a0 -> match a0 with
  | ([]) -> ""
  | ((x) :: (rest)) -> (let vuna_cat0' = (" ") in (let vuna_cat1' = (x) in (let vuna_cat2' = (v_Vuna_dFmt_djoinSpace rest) in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'])))
  | _ -> vuna_fail "./lib/Vuna/Fmt.vuna" 25 1 ("no matching clause for Vuna.Fmt.joinSpace")

let rec v_Vuna_dFmt_djoinLines = fun a0 -> match a0 with
  | ([]) -> ""
  | ((l) :: ([])) -> l
  | ((l) :: (rest)) -> (let vuna_cat0' = (l) in (let vuna_cat1' = ("\n") in (let vuna_cat2' = (v_Vuna_dFmt_djoinLines rest) in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'])))
  | _ -> vuna_fail "./lib/Vuna/Fmt.vuna" 28 1 ("no matching clause for Vuna.Fmt.joinLines")

let v_Vuna_dFmt_dunlines = fun a0 -> match a0 with
  | ([]) -> ""
  | (lines) -> ((v_Vuna_dFmt_djoinLines lines) ^ ("\n"))
  | _ -> vuna_fail "./lib/Vuna/Fmt.vuna" 32 1 ("no matching clause for Vuna.Fmt.unlines")

let v_Vuna_dFmt_dfirstLine = fun a0 -> match a0 with
  | ([]) -> ""
  | ((l) :: (rest)) -> l
  | _ -> vuna_fail "./lib/Vuna/Fmt.vuna" 35 1 ("no matching clause for Vuna.Fmt.firstLine")

let v_Vuna_dFmt_drestLines = fun a0 -> match a0 with
  | ([]) -> []
  | ((l) :: (rest)) -> rest
  | _ -> vuna_fail "./lib/Vuna/Fmt.vuna" 38 1 ("no matching clause for Vuna.Fmt.restLines")

let v_Vuna_dFmt_dprefixFirst = fun a0 a1 -> match (a0, a1) with
  | (pre, []) -> (pre) :: ([])
  | (pre, (l) :: (rest)) -> (((pre) ^ (l))) :: (rest)
  | _ -> vuna_fail "./lib/Vuna/Fmt.vuna" 41 1 ("no matching clause for Vuna.Fmt.prefixFirst")

let rec v_Vuna_dFmt_dappendLast = fun a0 a1 -> match (a0, a1) with
  | (suffix, []) -> (suffix) :: ([])
  | (suffix, (l) :: ([])) -> (((l) ^ (suffix))) :: ([])
  | (suffix, (l) :: (rest)) -> (l) :: (v_Vuna_dFmt_dappendLast suffix rest)
  | _ -> vuna_fail "./lib/Vuna/Fmt.vuna" 44 1 ("no matching clause for Vuna.Fmt.appendLast")

let v_Vuna_dFmt_dappendBefore = fun sep lines argLines -> (match argLines with
  | [] -> lines
  | (a) :: (rest) -> v_Vuna_dList_dappend (v_Vuna_dFmt_dappendLast (((sep) ^ (a))) lines) rest
  | _ -> vuna_fail "./lib/Vuna/Fmt.vuna" 50 3 ("case pattern match failure"))

let v_Vuna_dFmt_disNilList = fun a0 -> match a0 with
  | ([]) -> true
  | ((x) :: (rest)) -> false
  | _ -> vuna_fail "./lib/Vuna/Fmt.vuna" 57 1 ("no matching clause for Vuna.Fmt.isNilList")

let rec v_Vuna_dFmt_dmapMaybeStrings = fun a0 a1 -> match (a0, a1) with
  | (f, []) -> C_Vuna_dMaybe_dJust ([])
  | (f, (x) :: (rest)) -> (match f x with
  | C_Vuna_dMaybe_dNothing -> C_Vuna_dMaybe_dNothing
  | C_Vuna_dMaybe_dJust (s) -> (match v_Vuna_dFmt_dmapMaybeStrings f rest with
  | C_Vuna_dMaybe_dNothing -> C_Vuna_dMaybe_dNothing
  | C_Vuna_dMaybe_dJust (ss) -> C_Vuna_dMaybe_dJust ((s) :: (ss))
  | _ -> vuna_fail "./lib/Vuna/Fmt.vuna" 65 7 ("case pattern match failure"))
  | _ -> vuna_fail "./lib/Vuna/Fmt.vuna" 62 3 ("case pattern match failure"))
  | _ -> vuna_fail "./lib/Vuna/Fmt.vuna" 60 1 ("no matching clause for Vuna.Fmt.mapMaybeStrings")

let v_Vuna_dFmt_descapeChar = fun c -> if v_vuna_ueq_uint c 34 then bi_str_pack ((92) :: ((34) :: ([]))) else if v_vuna_ueq_uint c 92 then bi_str_pack ((92) :: ((92) :: ([]))) else if v_vuna_ueq_uint c 10 then bi_str_pack ((92) :: ((110) :: ([]))) else if v_vuna_ueq_uint c 9 then bi_str_pack ((92) :: ((116) :: ([]))) else if v_vuna_ueq_uint c 13 then bi_str_pack ((92) :: ((114) :: ([]))) else bi_str_pack ((c) :: ([]))

let v_Vuna_dFmt_drenderStr = fun s -> (let vuna_cat0' = (bi_str_pack ((34) :: ([]))) in (let vuna_cat1' = (v_Vuna_dFmt_dconcatStrings (v_Vuna_dList_dmap v_Vuna_dFmt_descapeChar (bi_str_unpack s))) in (let vuna_cat2' = (bi_str_pack ((34) :: ([]))) in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'])))

let v_Vuna_dFmt_ddummySpan = C_Vuna_dBase_dSpan ("", 1, 1, 1, 1)

let rec v_Vuna_dFmt_dpatListElemsOf = fun name pats -> if v_vuna_ueq_ustr name "Nil" then if v_Vuna_dFmt_disNilList pats then C_Vuna_dMaybe_dJust ([]) else C_Vuna_dMaybe_dNothing else if v_vuna_ueq_ustr name "Cons" then (match pats with
  | (a) :: ((rest) :: ([])) -> (match v_Vuna_dFmt_dpatListElems rest with
  | C_Vuna_dMaybe_dJust (elems) -> C_Vuna_dMaybe_dJust ((a) :: (elems))
  | C_Vuna_dMaybe_dNothing -> C_Vuna_dMaybe_dNothing
  | _ -> vuna_fail "./lib/Vuna/Fmt.vuna" 95 9 ("case pattern match failure"))
  | _ -> C_Vuna_dMaybe_dNothing
  | _ -> vuna_fail "./lib/Vuna/Fmt.vuna" 93 5 ("case pattern match failure")) else C_Vuna_dMaybe_dNothing
and v_Vuna_dFmt_dpatListElems = fun pat -> (match pat with
  | C_Vuna_dAst_dPCon (name, pats, sp) -> v_Vuna_dFmt_dpatListElemsOf name pats
  | _ -> C_Vuna_dMaybe_dNothing
  | _ -> vuna_fail "./lib/Vuna/Fmt.vuna" 102 3 ("case pattern match failure"))

let rec v_Vuna_dFmt_drenderPat = fun pat -> (match pat with
  | C_Vuna_dAst_dPVar (name, sp) -> name
  | C_Vuna_dAst_dPWild (sp) -> "_"
  | C_Vuna_dAst_dPInt (n, sp) -> bi_str_from_int n
  | C_Vuna_dAst_dPStr (s, sp) -> v_Vuna_dFmt_drenderStr s
  | C_Vuna_dAst_dPCon (name, pats, sp) -> v_Vuna_dFmt_drenderConPat name pats
  | C_Vuna_dAst_dPRecord (name, fields, sp) -> v_Vuna_dFmt_drenderRecPat name fields
  | _ -> vuna_fail "./lib/Vuna/Fmt.vuna" 107 3 ("case pattern match failure"))
and v_Vuna_dFmt_drenderConPat = fun name pats -> (match v_Vuna_dFmt_dpatListElemsOf name pats with
  | C_Vuna_dMaybe_dJust (elems) -> (let vuna_cat0' = ("[") in (let vuna_cat1' = (v_Vuna_dFmt_djoinComma (v_Vuna_dList_dmap v_Vuna_dFmt_drenderPat elems)) in (let vuna_cat2' = ("]") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'])))
  | C_Vuna_dMaybe_dNothing -> if v_vuna_ueq_ustr name "Cons" then v_Vuna_dFmt_drenderConsPat pats else if (if (v_vuna_ueq_ustr name "Nil") then (v_Vuna_dFmt_disNilList pats) else false) then "[]" else if v_Vuna_dFmt_disNilList pats then name else ((name) ^ (v_Vuna_dFmt_djoinSpace (v_Vuna_dList_dmap v_Vuna_dFmt_drenderPatAtom pats)))
  | _ -> vuna_fail "./lib/Vuna/Fmt.vuna" 116 3 ("case pattern match failure"))
and v_Vuna_dFmt_drenderConsPat = fun pats -> (match pats with
  | (a) :: ((b) :: ([])) -> (let vuna_cat0' = (v_Vuna_dFmt_drenderPatAtom a) in (let vuna_cat1' = (" :: ") in (let vuna_cat2' = (v_Vuna_dFmt_drenderPatConsTail b) in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'])))
  | _ -> (("Cons") ^ (v_Vuna_dFmt_djoinSpace (v_Vuna_dList_dmap v_Vuna_dFmt_drenderPatAtom pats)))
  | _ -> vuna_fail "./lib/Vuna/Fmt.vuna" 125 3 ("case pattern match failure"))
and v_Vuna_dFmt_drenderPatConsTail = fun pat -> (match pat with
  | C_Vuna_dAst_dPCon (name, pats, sp) -> if v_vuna_ueq_ustr name "Cons" then (match pats with
  | (a) :: ((b) :: ([])) -> (let vuna_cat0' = (v_Vuna_dFmt_drenderPatAtom a) in (let vuna_cat1' = (" :: ") in (let vuna_cat2' = (v_Vuna_dFmt_drenderPatConsTail b) in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'])))
  | _ -> v_Vuna_dFmt_drenderPatAtom pat
  | _ -> vuna_fail "./lib/Vuna/Fmt.vuna" 133 9 ("case pattern match failure")) else v_Vuna_dFmt_drenderPatAtom pat
  | _ -> v_Vuna_dFmt_drenderPatAtom pat
  | _ -> vuna_fail "./lib/Vuna/Fmt.vuna" 130 3 ("case pattern match failure"))
and v_Vuna_dFmt_drenderPatAtom = fun pat -> (match pat with
  | C_Vuna_dAst_dPVar (name, sp) -> name
  | C_Vuna_dAst_dPWild (sp) -> "_"
  | C_Vuna_dAst_dPInt (n, sp) -> bi_str_from_int n
  | C_Vuna_dAst_dPStr (s, sp) -> v_Vuna_dFmt_drenderStr s
  | C_Vuna_dAst_dPCon (name, [], sp) -> if v_vuna_ueq_ustr name "Nil" then "[]" else name
  | C_Vuna_dAst_dPCon (name, pats, sp) -> (let vuna_cat0' = ("(") in (let vuna_cat1' = (v_Vuna_dFmt_drenderConPat name pats) in (let vuna_cat2' = (")") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'])))
  | C_Vuna_dAst_dPRecord (name, fields, sp) -> (let vuna_cat0' = ("(") in (let vuna_cat1' = (v_Vuna_dFmt_drenderRecPat name fields) in (let vuna_cat2' = (")") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'])))
  | _ -> vuna_fail "./lib/Vuna/Fmt.vuna" 140 3 ("case pattern match failure"))
and v_Vuna_dFmt_drenderRecPat = fun name fields -> if v_Vuna_dFmt_disNilList fields then ((name) ^ (" { }")) else (let vuna_cat0' = (name) in (let vuna_cat1' = (" { ") in (let vuna_cat2' = (v_Vuna_dFmt_djoinComma (v_Vuna_dList_dmap v_Vuna_dFmt_drenderRecPatField fields)) in (let vuna_cat3' = (" }") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3']))))
and v_Vuna_dFmt_drenderRecPatField = fun a0 -> match a0 with
  | (C_Vuna_dPair_dPair (fname, pat)) -> (match pat with
  | C_Vuna_dAst_dPVar (n, sp) -> if v_vuna_ueq_ustr n fname then fname else (let vuna_cat0' = (fname) in (let vuna_cat1' = (" = ") in (let vuna_cat2' = (v_Vuna_dFmt_drenderPat pat) in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'])))
  | _ -> (let vuna_cat0' = (fname) in (let vuna_cat1' = (" = ") in (let vuna_cat2' = (v_Vuna_dFmt_drenderPat pat) in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'])))
  | _ -> vuna_fail "./lib/Vuna/Fmt.vuna" 154 3 ("case pattern match failure"))
  | _ -> vuna_fail "./lib/Vuna/Fmt.vuna" 153 1 ("no matching clause for Vuna.Fmt.renderRecPatField")

let v_Vuna_dFmt_dinfixPrec = fun op -> (match op with
  | "->" -> C_Vuna_dMaybe_dJust (C_Vuna_dPair_dPair (1, 1))
  | ">>=" -> C_Vuna_dMaybe_dJust (C_Vuna_dPair_dPair (1, 1))
  | "||" -> C_Vuna_dMaybe_dJust (C_Vuna_dPair_dPair (2, 0))
  | "&&" -> C_Vuna_dMaybe_dJust (C_Vuna_dPair_dPair (3, 0))
  | "==" -> C_Vuna_dMaybe_dJust (C_Vuna_dPair_dPair (4, 0))
  | "/=" -> C_Vuna_dMaybe_dJust (C_Vuna_dPair_dPair (4, 0))
  | "<" -> C_Vuna_dMaybe_dJust (C_Vuna_dPair_dPair (4, 0))
  | "<=" -> C_Vuna_dMaybe_dJust (C_Vuna_dPair_dPair (4, 0))
  | ">" -> C_Vuna_dMaybe_dJust (C_Vuna_dPair_dPair (4, 0))
  | ">=" -> C_Vuna_dMaybe_dJust (C_Vuna_dPair_dPair (4, 0))
  | "++" -> C_Vuna_dMaybe_dJust (C_Vuna_dPair_dPair (5, 1))
  | "+" -> C_Vuna_dMaybe_dJust (C_Vuna_dPair_dPair (6, 0))
  | "-" -> C_Vuna_dMaybe_dJust (C_Vuna_dPair_dPair (6, 0))
  | "*" -> C_Vuna_dMaybe_dJust (C_Vuna_dPair_dPair (7, 0))
  | "/" -> C_Vuna_dMaybe_dJust (C_Vuna_dPair_dPair (7, 0))
  | "::" -> C_Vuna_dMaybe_dJust (C_Vuna_dPair_dPair (8, 1))
  | "Cons" -> C_Vuna_dMaybe_dJust (C_Vuna_dPair_dPair (8, 1))
  | _ -> C_Vuna_dMaybe_dNothing
  | _ -> vuna_fail "./lib/Vuna/Fmt.vuna" 164 3 ("case pattern match failure"))

let v_Vuna_dFmt_dopText = fun op -> if v_vuna_ueq_ustr op "Cons" then "::" else op

let rec v_Vuna_dFmt_dlistExprElems = fun e -> (match e with
  | C_Vuna_dAst_dEVar ("Nil", sp) -> C_Vuna_dMaybe_dJust ([])
  | C_Vuna_dAst_dEApp (C_Vuna_dAst_dEVar ("Cons", csp), (a) :: ((rest) :: ([])), sp) -> (match v_Vuna_dFmt_dlistExprElems rest with
  | C_Vuna_dMaybe_dJust (elems) -> C_Vuna_dMaybe_dJust ((a) :: (elems))
  | C_Vuna_dMaybe_dNothing -> C_Vuna_dMaybe_dNothing
  | _ -> vuna_fail "./lib/Vuna/Fmt.vuna" 190 7 ("case pattern match failure"))
  | _ -> C_Vuna_dMaybe_dNothing
  | _ -> vuna_fail "./lib/Vuna/Fmt.vuna" 187 3 ("case pattern match failure"))

let v_Vuna_dFmt_dwrapPrec = fun need s -> if need then (let vuna_cat0' = ("(") in (let vuna_cat1' = (s) in (let vuna_cat2' = (")") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2']))) else s

let v_Vuna_dFmt_datomForm = fun e -> (match e with
  | C_Vuna_dAst_dEVar (name, sp) -> true
  | C_Vuna_dAst_dEInt (n, sp) -> true
  | C_Vuna_dAst_dEStr (s, sp) -> true
  | C_Vuna_dAst_dEField (base, f, sp) -> true
  | C_Vuna_dAst_dERecord (name, fields, sp) -> true
  | C_Vuna_dAst_dERecUpdate (base, fields, sp) -> true
  | C_Vuna_dAst_dEApp (fn, args, sp) -> (match v_Vuna_dFmt_dlistExprElems (C_Vuna_dAst_dEApp (fn, args, sp)) with
  | C_Vuna_dMaybe_dJust (elems) -> true
  | C_Vuna_dMaybe_dNothing -> false
  | _ -> vuna_fail "./lib/Vuna/Fmt.vuna" 318 7 ("case pattern match failure"))
  | _ -> false
  | _ -> vuna_fail "./lib/Vuna/Fmt.vuna" 310 3 ("case pattern match failure"))

let rec v_Vuna_dFmt_dinlineExpr = fun e -> v_Vuna_dFmt_dinlinePrec 0 e
and v_Vuna_dFmt_dinlinePrec = fun minPrec e -> (match e with
  | C_Vuna_dAst_dEVar (name, sp) -> if v_vuna_ueq_ustr name "Nil" then C_Vuna_dMaybe_dJust ("[]") else C_Vuna_dMaybe_dJust (name)
  | C_Vuna_dAst_dEInt (n, sp) -> C_Vuna_dMaybe_dJust (bi_str_from_int n)
  | C_Vuna_dAst_dEStr (s, sp) -> C_Vuna_dMaybe_dJust (v_Vuna_dFmt_drenderStr s)
  | C_Vuna_dAst_dELam (ps, body, sp) -> (match v_Vuna_dFmt_dinlinePrec 0 body with
  | C_Vuna_dMaybe_dNothing -> C_Vuna_dMaybe_dNothing
  | C_Vuna_dMaybe_dJust (b) -> C_Vuna_dMaybe_dJust (v_Vuna_dFmt_dwrapPrec (v_vuna_ugt_uint minPrec 0) ((let vuna_cat0' = ("\\") in (let vuna_cat1' = (v_Vuna_dFmt_djoinComma ps) in (let vuna_cat2' = (" => ") in (let vuna_cat3' = (b) in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3']))))))
  | _ -> vuna_fail "./lib/Vuna/Fmt.vuna" 203 7 ("case pattern match failure"))
  | C_Vuna_dAst_dEApp (fn, args, sp) -> (match v_Vuna_dFmt_dlistExprElems (C_Vuna_dAst_dEApp (fn, args, sp)) with
  | C_Vuna_dMaybe_dJust (elems) -> (match v_Vuna_dFmt_dmapMaybeStrings (fun x -> v_Vuna_dFmt_dinlineExpr x) elems with
  | C_Vuna_dMaybe_dNothing -> C_Vuna_dMaybe_dNothing
  | C_Vuna_dMaybe_dJust (ss) -> C_Vuna_dMaybe_dJust ((let vuna_cat0' = ("[") in (let vuna_cat1' = (v_Vuna_dFmt_djoinComma ss) in (let vuna_cat2' = ("]") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2']))))
  | _ -> vuna_fail "./lib/Vuna/Fmt.vuna" 209 11 ("case pattern match failure"))
  | C_Vuna_dMaybe_dNothing -> v_Vuna_dFmt_dinlineApp minPrec fn args
  | _ -> vuna_fail "./lib/Vuna/Fmt.vuna" 207 7 ("case pattern match failure"))
  | C_Vuna_dAst_dELet (binds, body, rec_u, sp) -> C_Vuna_dMaybe_dNothing
  | C_Vuna_dAst_dECase (scrut, alts, sp) -> C_Vuna_dMaybe_dNothing
  | C_Vuna_dAst_dEIf (c, t, el, sp) -> (match v_Vuna_dFmt_dinlinePrec 0 c with
  | C_Vuna_dMaybe_dNothing -> C_Vuna_dMaybe_dNothing
  | C_Vuna_dMaybe_dJust (cs) -> (match v_Vuna_dFmt_dinlinePrec 0 t with
  | C_Vuna_dMaybe_dNothing -> C_Vuna_dMaybe_dNothing
  | C_Vuna_dMaybe_dJust (ts) -> (match v_Vuna_dFmt_dinlinePrec 0 el with
  | C_Vuna_dMaybe_dNothing -> C_Vuna_dMaybe_dNothing
  | C_Vuna_dMaybe_dJust (es) -> C_Vuna_dMaybe_dJust (v_Vuna_dFmt_dwrapPrec (v_vuna_ugt_uint minPrec 0) ((let vuna_cat0' = ("if ") in (let vuna_cat1' = (cs) in (let vuna_cat2' = (" then ") in (let vuna_cat3' = (ts) in (let vuna_cat4' = (" else ") in (let vuna_cat5' = (es) in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'; vuna_cat4'; vuna_cat5']))))))))
  | _ -> vuna_fail "./lib/Vuna/Fmt.vuna" 222 15 ("case pattern match failure"))
  | _ -> vuna_fail "./lib/Vuna/Fmt.vuna" 219 11 ("case pattern match failure"))
  | _ -> vuna_fail "./lib/Vuna/Fmt.vuna" 216 7 ("case pattern match failure"))
  | C_Vuna_dAst_dEField (base, f, sp) -> (match v_Vuna_dFmt_dinlineAtom base with
  | C_Vuna_dMaybe_dNothing -> C_Vuna_dMaybe_dNothing
  | C_Vuna_dMaybe_dJust (b) -> C_Vuna_dMaybe_dJust ((let vuna_cat0' = (b) in (let vuna_cat1' = (".") in (let vuna_cat2' = (f) in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2']))))
  | _ -> vuna_fail "./lib/Vuna/Fmt.vuna" 226 7 ("case pattern match failure"))
  | C_Vuna_dAst_dERecord (name, fields, sp) -> (match v_Vuna_dFmt_dinlineFields fields with
  | C_Vuna_dMaybe_dNothing -> C_Vuna_dMaybe_dNothing
  | C_Vuna_dMaybe_dJust (ss) -> (match fields with
  | [] -> C_Vuna_dMaybe_dJust (((name) ^ (" { }")))
  | _ -> C_Vuna_dMaybe_dJust ((let vuna_cat0' = (name) in (let vuna_cat1' = (" { ") in (let vuna_cat2' = (v_Vuna_dFmt_djoinComma ss) in (let vuna_cat3' = (" }") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'])))))
  | _ -> vuna_fail "./lib/Vuna/Fmt.vuna" 233 11 ("case pattern match failure"))
  | _ -> vuna_fail "./lib/Vuna/Fmt.vuna" 230 7 ("case pattern match failure"))
  | C_Vuna_dAst_dERecUpdate (base, fields, sp) -> (match v_Vuna_dFmt_dinlinePrec 0 base with
  | C_Vuna_dMaybe_dNothing -> C_Vuna_dMaybe_dNothing
  | C_Vuna_dMaybe_dJust (b) -> (match v_Vuna_dFmt_dinlineFields fields with
  | C_Vuna_dMaybe_dNothing -> C_Vuna_dMaybe_dNothing
  | C_Vuna_dMaybe_dJust (ss) -> (match fields with
  | [] -> C_Vuna_dMaybe_dJust ((let vuna_cat0' = ("{ ") in (let vuna_cat1' = (b) in (let vuna_cat2' = (" }") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2']))))
  | _ -> C_Vuna_dMaybe_dJust ((let vuna_cat0' = ("{ ") in (let vuna_cat1' = (b) in (let vuna_cat2' = (" | ") in (let vuna_cat3' = (v_Vuna_dFmt_djoinComma ss) in (let vuna_cat4' = (" }") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'; vuna_cat4']))))))
  | _ -> vuna_fail "./lib/Vuna/Fmt.vuna" 243 15 ("case pattern match failure"))
  | _ -> vuna_fail "./lib/Vuna/Fmt.vuna" 240 11 ("case pattern match failure"))
  | _ -> vuna_fail "./lib/Vuna/Fmt.vuna" 237 7 ("case pattern match failure"))
  | C_Vuna_dAst_dEInstSel (base, inst, sp) -> (match v_Vuna_dFmt_dinlineAtom base with
  | C_Vuna_dMaybe_dNothing -> C_Vuna_dMaybe_dNothing
  | C_Vuna_dMaybe_dJust (b) -> C_Vuna_dMaybe_dJust ((let vuna_cat0' = (b) in (let vuna_cat1' = (" @") in (let vuna_cat2' = (inst) in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2']))))
  | _ -> vuna_fail "./lib/Vuna/Fmt.vuna" 247 7 ("case pattern match failure"))
  | C_Vuna_dAst_dEDo (stmts, sp) -> C_Vuna_dMaybe_dNothing
  | _ -> vuna_fail "./lib/Vuna/Fmt.vuna" 198 3 ("case pattern match failure"))
and v_Vuna_dFmt_dinlineFields = fun a0 -> match a0 with
  | ([]) -> C_Vuna_dMaybe_dJust ([])
  | ((C_Vuna_dPair_dPair (fname, value)) :: (rest)) -> (match v_Vuna_dFmt_dinlinePrec 0 value with
  | C_Vuna_dMaybe_dNothing -> C_Vuna_dMaybe_dNothing
  | C_Vuna_dMaybe_dJust (v) -> (match v_Vuna_dFmt_dinlineFields rest with
  | C_Vuna_dMaybe_dNothing -> C_Vuna_dMaybe_dNothing
  | C_Vuna_dMaybe_dJust (ss) -> C_Vuna_dMaybe_dJust (((let vuna_cat0' = (fname) in (let vuna_cat1' = (" = ") in (let vuna_cat2' = (v) in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'])))) :: (ss))
  | _ -> vuna_fail "./lib/Vuna/Fmt.vuna" 259 7 ("case pattern match failure"))
  | _ -> vuna_fail "./lib/Vuna/Fmt.vuna" 256 3 ("case pattern match failure"))
  | _ -> vuna_fail "./lib/Vuna/Fmt.vuna" 254 1 ("no matching clause for Vuna.Fmt.inlineFields")
and v_Vuna_dFmt_dinlineApp = fun minPrec fn args -> (match fn with
  | C_Vuna_dAst_dEVar ("bind", bsp) -> (match args with
  | (a) :: ((b) :: ([])) -> v_Vuna_dFmt_dinlineInfix minPrec 1 1 ">>=" a b
  | _ -> v_Vuna_dFmt_dinlineApply minPrec fn args
  | _ -> vuna_fail "./lib/Vuna/Fmt.vuna" 266 7 ("case pattern match failure"))
  | C_Vuna_dAst_dEVar (op, sp) -> (match v_Vuna_dFmt_dinfixPrec op with
  | C_Vuna_dMaybe_dJust (C_Vuna_dPair_dPair (p, assoc)) -> (match args with
  | (a) :: ((b) :: ([])) -> v_Vuna_dFmt_dinlineInfix minPrec p assoc op a b
  | _ -> v_Vuna_dFmt_dinlineApply minPrec fn args
  | _ -> vuna_fail "./lib/Vuna/Fmt.vuna" 272 11 ("case pattern match failure"))
  | C_Vuna_dMaybe_dNothing -> v_Vuna_dFmt_dinlineApply minPrec fn args
  | _ -> vuna_fail "./lib/Vuna/Fmt.vuna" 270 7 ("case pattern match failure"))
  | _ -> v_Vuna_dFmt_dinlineApply minPrec fn args
  | _ -> vuna_fail "./lib/Vuna/Fmt.vuna" 264 3 ("case pattern match failure"))
and v_Vuna_dFmt_dinlineInfix = fun minPrec p assoc op a b -> (let leftMin = if v_vuna_ueq_uint assoc 0 then p else bi_add p 1 in let rightMin = if v_vuna_ueq_uint assoc 0 then bi_add p 1 else p in (match v_Vuna_dFmt_dinlinePrec leftMin a with
  | C_Vuna_dMaybe_dNothing -> C_Vuna_dMaybe_dNothing
  | C_Vuna_dMaybe_dJust (lhsText) -> (match v_Vuna_dFmt_dinlinePrec rightMin b with
  | C_Vuna_dMaybe_dNothing -> C_Vuna_dMaybe_dNothing
  | C_Vuna_dMaybe_dJust (rhsText) -> C_Vuna_dMaybe_dJust (v_Vuna_dFmt_dwrapPrec (v_vuna_ult_uint p minPrec) ((let vuna_cat0' = (lhsText) in (let vuna_cat1' = (" ") in (let vuna_cat2' = (v_Vuna_dFmt_dopText op) in (let vuna_cat3' = (" ") in (let vuna_cat4' = (rhsText) in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'; vuna_cat4'])))))))
  | _ -> vuna_fail "./lib/Vuna/Fmt.vuna" 284 10 ("case pattern match failure"))
  | _ -> vuna_fail "./lib/Vuna/Fmt.vuna" 281 6 ("case pattern match failure")))
and v_Vuna_dFmt_dinlineApply = fun minPrec fn args -> (match v_Vuna_dFmt_dinlineApplyHead fn with
  | C_Vuna_dMaybe_dNothing -> C_Vuna_dMaybe_dNothing
  | C_Vuna_dMaybe_dJust (headText) -> (match v_Vuna_dFmt_dmapMaybeStrings (fun a -> v_Vuna_dFmt_dinlineAtom a) args with
  | C_Vuna_dMaybe_dNothing -> C_Vuna_dMaybe_dNothing
  | C_Vuna_dMaybe_dJust (argTexts) -> C_Vuna_dMaybe_dJust (v_Vuna_dFmt_dwrapPrec (v_vuna_ult_uint 9 minPrec) (((headText) ^ (v_Vuna_dFmt_dconcatStrings (v_Vuna_dList_dmap (fun a -> ((" ") ^ (a))) argTexts)))))
  | _ -> vuna_fail "./lib/Vuna/Fmt.vuna" 292 7 ("case pattern match failure"))
  | _ -> vuna_fail "./lib/Vuna/Fmt.vuna" 289 3 ("case pattern match failure"))
and v_Vuna_dFmt_dinlineApplyHead = fun fn -> (match fn with
  | C_Vuna_dAst_dEInstSel (base, inst, sp) -> (match v_Vuna_dFmt_dinlineAtom base with
  | C_Vuna_dMaybe_dNothing -> C_Vuna_dMaybe_dNothing
  | C_Vuna_dMaybe_dJust (b) -> C_Vuna_dMaybe_dJust ((let vuna_cat0' = (b) in (let vuna_cat1' = (" @") in (let vuna_cat2' = (inst) in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2']))))
  | _ -> vuna_fail "./lib/Vuna/Fmt.vuna" 299 7 ("case pattern match failure"))
  | _ -> v_Vuna_dFmt_dinlineAtom fn
  | _ -> vuna_fail "./lib/Vuna/Fmt.vuna" 297 3 ("case pattern match failure"))
and v_Vuna_dFmt_dinlineAtom = fun e -> (match v_Vuna_dFmt_dinlinePrec 0 e with
  | C_Vuna_dMaybe_dNothing -> C_Vuna_dMaybe_dNothing
  | C_Vuna_dMaybe_dJust (s) -> if v_Vuna_dFmt_datomForm e then C_Vuna_dMaybe_dJust (s) else C_Vuna_dMaybe_dJust ((let vuna_cat0' = ("(") in (let vuna_cat1' = (s) in (let vuna_cat2' = (")") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2']))))
  | _ -> vuna_fail "./lib/Vuna/Fmt.vuna" 305 3 ("case pattern match failure"))

let rec v_Vuna_dFmt_dparenWrap = fun lineInd e -> v_Vuna_dList_dappend (v_Vuna_dFmt_dprefixFirst "(" (v_Vuna_dFmt_drenderBlock lineInd e)) ((((v_Vuna_dFmt_dspaces lineInd) ^ (")"))) :: ([]))
and v_Vuna_dFmt_drenderExpr = fun lineInd e -> (match v_Vuna_dFmt_dinlinePrec 0 e with
  | C_Vuna_dMaybe_dJust (s) -> (s) :: ([])
  | C_Vuna_dMaybe_dNothing -> v_Vuna_dFmt_drenderBlock lineInd e
  | _ -> vuna_fail "./lib/Vuna/Fmt.vuna" 330 3 ("case pattern match failure"))
and v_Vuna_dFmt_drenderAtomExpr = fun lineInd e -> (match v_Vuna_dFmt_dinlineAtom e with
  | C_Vuna_dMaybe_dJust (s) -> (s) :: ([])
  | C_Vuna_dMaybe_dNothing -> v_Vuna_dFmt_dparenWrap lineInd e
  | _ -> vuna_fail "./lib/Vuna/Fmt.vuna" 335 3 ("case pattern match failure"))
and v_Vuna_dFmt_drenderBlock = fun lineInd e -> (match e with
  | C_Vuna_dAst_dECase (scrut, alts, sp) -> v_Vuna_dFmt_drenderCase lineInd scrut alts
  | C_Vuna_dAst_dELet (binds, body, rec_u, sp) -> v_Vuna_dFmt_drenderLet lineInd binds body
  | C_Vuna_dAst_dEIf (c, t, el, sp) -> v_Vuna_dFmt_drenderIf lineInd c t el
  | C_Vuna_dAst_dEApp (fn, args, sp) -> v_Vuna_dFmt_drenderAppBlock lineInd fn args
  | C_Vuna_dAst_dELam (ps, body, sp) -> v_Vuna_dFmt_dprefixFirst ((let vuna_cat0' = ("\\") in (let vuna_cat1' = (v_Vuna_dFmt_djoinComma ps) in (let vuna_cat2' = (" => ") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'])))) (v_Vuna_dFmt_drenderExpr lineInd body)
  | C_Vuna_dAst_dEField (base, f, sp) -> v_Vuna_dFmt_dappendLast (((".") ^ (f))) (v_Vuna_dFmt_drenderAtomExpr lineInd base)
  | C_Vuna_dAst_dERecord (name, fields, sp) -> v_Vuna_dFmt_drenderRecordBlock lineInd name fields
  | C_Vuna_dAst_dERecUpdate (base, fields, sp) -> v_Vuna_dFmt_drenderRecUpdateBlock lineInd base fields
  | C_Vuna_dAst_dEInstSel (base, inst, sp) -> v_Vuna_dFmt_dappendLast (((" @") ^ (inst))) (v_Vuna_dFmt_drenderAtomExpr lineInd base)
  | C_Vuna_dAst_dEDo (stmts, sp) -> v_Vuna_dFmt_drenderDo lineInd stmts
  | C_Vuna_dAst_dEVar (name, sp) -> (name) :: ([])
  | C_Vuna_dAst_dEInt (n, sp) -> (bi_str_from_int n) :: ([])
  | C_Vuna_dAst_dEStr (s, sp) -> (v_Vuna_dFmt_drenderStr s) :: ([])
  | _ -> vuna_fail "./lib/Vuna/Fmt.vuna" 340 3 ("case pattern match failure"))
and v_Vuna_dFmt_drenderScrut = fun lineInd e -> (match v_Vuna_dFmt_dinlineExpr e with
  | C_Vuna_dMaybe_dJust (s) -> (s) :: ([])
  | C_Vuna_dMaybe_dNothing -> v_Vuna_dFmt_dparenWrap lineInd e
  | _ -> vuna_fail "./lib/Vuna/Fmt.vuna" 356 3 ("case pattern match failure"))
and v_Vuna_dFmt_drenderCase = fun lineInd scrut alts -> (let headLines = v_Vuna_dFmt_dappendLast " of" (v_Vuna_dFmt_dprefixFirst "case " (v_Vuna_dFmt_drenderScrut lineInd scrut)) in let altInd = bi_add lineInd 2 in let altLines = v_Vuna_dList_dconcatMap (fun alt -> v_Vuna_dFmt_drenderAlt altInd alt) alts in v_Vuna_dList_dappend headLines altLines)
and v_Vuna_dFmt_drenderAlt = fun a0 a1 -> match (a0, a1) with
  | (altInd, C_Vuna_dPair_dPair (pat, body)) -> (match body with
  | C_Vuna_dAst_dELet (binds, inner, recFlag, sp) -> ((let vuna_cat0' = (v_Vuna_dFmt_dspaces altInd) in (let vuna_cat1' = (v_Vuna_dFmt_drenderPat pat) in (let vuna_cat2' = (" =>") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'])))) :: (v_Vuna_dFmt_dprefixFirst (v_Vuna_dFmt_dspaces (bi_add altInd 2)) (v_Vuna_dFmt_drenderExpr (bi_add altInd 2) body))
  | _ -> v_Vuna_dFmt_dprefixFirst ((let vuna_cat0' = (v_Vuna_dFmt_dspaces altInd) in (let vuna_cat1' = (v_Vuna_dFmt_drenderPat pat) in (let vuna_cat2' = (" => ") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'])))) (v_Vuna_dFmt_drenderExpr altInd body)
  | _ -> vuna_fail "./lib/Vuna/Fmt.vuna" 367 3 ("case pattern match failure"))
  | _ -> vuna_fail "./lib/Vuna/Fmt.vuna" 366 1 ("no matching clause for Vuna.Fmt.renderAlt")
and v_Vuna_dFmt_drenderWhenBody = fun lineInd keyword e -> (match e with
  | C_Vuna_dAst_dELet (binds, inner, recFlag, sp) -> (((v_Vuna_dFmt_dspaces lineInd) ^ (keyword))) :: (v_Vuna_dFmt_dprefixFirst (v_Vuna_dFmt_dspaces (bi_add lineInd 2)) (v_Vuna_dFmt_drenderExpr (bi_add lineInd 2) e))
  | _ -> v_Vuna_dFmt_dprefixFirst ((let vuna_cat0' = (v_Vuna_dFmt_dspaces lineInd) in (let vuna_cat1' = (keyword) in (let vuna_cat2' = (" ") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'])))) (v_Vuna_dFmt_drenderExpr lineInd e)
  | _ -> vuna_fail "./lib/Vuna/Fmt.vuna" 373 3 ("case pattern match failure"))
and v_Vuna_dFmt_drenderIf = fun lineInd c t el -> (let condLines = v_Vuna_dFmt_dprefixFirst "if " (v_Vuna_dFmt_drenderScrut lineInd c) in let thenLines = (match t with
  | C_Vuna_dAst_dELet (binds, inner, recFlag, sp) -> v_Vuna_dList_dappend (v_Vuna_dFmt_dappendLast " then" condLines) (v_Vuna_dFmt_dprefixFirst (v_Vuna_dFmt_dspaces (bi_add lineInd 2)) (v_Vuna_dFmt_drenderExpr (bi_add lineInd 2) t))
  | _ -> (let tLines = v_Vuna_dFmt_drenderExpr lineInd t in v_Vuna_dList_dappend (v_Vuna_dFmt_dappendLast (((" then ") ^ (v_Vuna_dFmt_dfirstLine tLines))) condLines) (v_Vuna_dFmt_drestLines tLines))
  | _ -> vuna_fail "./lib/Vuna/Fmt.vuna" 381 9 ("case pattern match failure")) in let elseLines = v_Vuna_dFmt_drenderWhenBody lineInd "else" el in v_Vuna_dList_dappend thenLines elseLines)
and v_Vuna_dFmt_drenderLet = fun lineInd binds body -> (match binds with
  | [] -> ("let") :: (v_Vuna_dFmt_dprefixFirst (((v_Vuna_dFmt_dspaces lineInd) ^ ("in "))) (v_Vuna_dFmt_drenderExpr lineInd body))
  | (first) :: (rest) -> (let bindInd = bi_add lineInd 2 in let bindingLines = v_Vuna_dList_dappend (v_Vuna_dFmt_drenderLetBinding bindInd first) (v_Vuna_dList_dconcatMap (fun b -> v_Vuna_dFmt_drenderLetBinding bindInd b) rest) in v_Vuna_dList_dappend (("let") :: (bindingLines)) (v_Vuna_dFmt_dprefixFirst (((v_Vuna_dFmt_dspaces lineInd) ^ ("in "))) (v_Vuna_dFmt_drenderExpr lineInd body)))
  | _ -> vuna_fail "./lib/Vuna/Fmt.vuna" 391 3 ("case pattern match failure"))
and v_Vuna_dFmt_drenderLetBinding = fun a0 a1 -> match (a0, a1) with
  | (bindInd, C_Vuna_dPair_dPair (pat, value)) -> v_Vuna_dFmt_drenderBindingValue bindInd (((v_Vuna_dFmt_drenderPat pat) ^ (" ="))) value
  | _ -> vuna_fail "./lib/Vuna/Fmt.vuna" 398 1 ("no matching clause for Vuna.Fmt.renderLetBinding")
and v_Vuna_dFmt_drenderBindingValue = fun lineInd prefixText value -> (match value with
  | C_Vuna_dAst_dELet (binds, inner, recFlag, sp) -> (((v_Vuna_dFmt_dspaces lineInd) ^ (prefixText))) :: (v_Vuna_dFmt_dprefixFirst (v_Vuna_dFmt_dspaces (bi_add lineInd 2)) (v_Vuna_dFmt_drenderExpr (bi_add lineInd 2) value))
  | _ -> v_Vuna_dFmt_dprefixFirst ((let vuna_cat0' = (v_Vuna_dFmt_dspaces lineInd) in (let vuna_cat1' = (prefixText) in (let vuna_cat2' = (" ") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'])))) (v_Vuna_dFmt_drenderExpr lineInd value)
  | _ -> vuna_fail "./lib/Vuna/Fmt.vuna" 402 3 ("case pattern match failure"))
and v_Vuna_dFmt_drenderDo = fun lineInd stmts -> ("do") :: (v_Vuna_dList_dconcatMap (fun s -> v_Vuna_dFmt_drenderDoStmt (bi_add lineInd 2) s) stmts)
and v_Vuna_dFmt_drenderDoStmt = fun stmtInd stmt -> (match stmt with
  | C_Vuna_dAst_dDBind (pat, value, sp) -> v_Vuna_dFmt_dprefixFirst ((let vuna_cat0' = (v_Vuna_dFmt_dspaces stmtInd) in (let vuna_cat1' = (v_Vuna_dFmt_drenderPat pat) in (let vuna_cat2' = (" <- ") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'])))) (v_Vuna_dFmt_drenderExpr stmtInd value)
  | C_Vuna_dAst_dDExpr (value, sp) -> v_Vuna_dFmt_dprefixFirst (v_Vuna_dFmt_dspaces stmtInd) (v_Vuna_dFmt_drenderExpr stmtInd value)
  | _ -> vuna_fail "./lib/Vuna/Fmt.vuna" 411 3 ("case pattern match failure"))
and v_Vuna_dFmt_drenderAppBlock = fun lineInd fn args -> (match fn with
  | C_Vuna_dAst_dEVar ("bind", bsp) -> (match args with
  | (a) :: ((b) :: ([])) -> v_Vuna_dFmt_drenderInfixBlock lineInd 1 1 ">>=" a b
  | _ -> v_Vuna_dFmt_drenderApplyBlock lineInd fn args
  | _ -> vuna_fail "./lib/Vuna/Fmt.vuna" 418 7 ("case pattern match failure"))
  | C_Vuna_dAst_dEVar (op, sp) -> (match v_Vuna_dFmt_dinfixPrec op with
  | C_Vuna_dMaybe_dJust (C_Vuna_dPair_dPair (p, assoc)) -> (match args with
  | (a) :: ((b) :: ([])) -> v_Vuna_dFmt_drenderInfixBlock lineInd p assoc op a b
  | _ -> v_Vuna_dFmt_drenderApplyBlock lineInd fn args
  | _ -> vuna_fail "./lib/Vuna/Fmt.vuna" 424 11 ("case pattern match failure"))
  | C_Vuna_dMaybe_dNothing -> v_Vuna_dFmt_drenderApplyBlock lineInd fn args
  | _ -> vuna_fail "./lib/Vuna/Fmt.vuna" 422 7 ("case pattern match failure"))
  | _ -> v_Vuna_dFmt_drenderApplyBlock lineInd fn args
  | _ -> vuna_fail "./lib/Vuna/Fmt.vuna" 416 3 ("case pattern match failure"))
and v_Vuna_dFmt_drenderInfixBlock = fun lineInd p assoc op a b -> (let leftMin = if v_vuna_ueq_uint assoc 0 then p else bi_add p 1 in let rightMin = if v_vuna_ueq_uint assoc 0 then bi_add p 1 else p in let lhsLines = v_Vuna_dFmt_drenderOperand lineInd leftMin a in let rhsLines = v_Vuna_dFmt_drenderOperand lineInd rightMin b in (match rhsLines with
  | [] -> lhsLines
  | (r) :: (rest) -> v_Vuna_dList_dappend (v_Vuna_dFmt_dappendLast ((let vuna_cat0' = (" ") in (let vuna_cat1' = (v_Vuna_dFmt_dopText op) in (let vuna_cat2' = (" ") in (let vuna_cat3' = (r) in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3']))))) lhsLines) rest
  | _ -> vuna_fail "./lib/Vuna/Fmt.vuna" 435 6 ("case pattern match failure")))
and v_Vuna_dFmt_drenderOperand = fun lineInd minPrec e -> (match v_Vuna_dFmt_dinlinePrec minPrec e with
  | C_Vuna_dMaybe_dJust (s) -> (s) :: ([])
  | C_Vuna_dMaybe_dNothing -> v_Vuna_dFmt_dparenWrap lineInd e
  | _ -> vuna_fail "./lib/Vuna/Fmt.vuna" 440 3 ("case pattern match failure"))
and v_Vuna_dFmt_drenderApplyBlock = fun lineInd fn args -> v_Vuna_dFmt_dappendApplyArgs lineInd (v_Vuna_dFmt_drenderApplyHead lineInd fn) args
and v_Vuna_dFmt_drenderApplyHead = fun lineInd fn -> (match fn with
  | C_Vuna_dAst_dEInstSel (base, inst, sp) -> v_Vuna_dFmt_dappendLast (((" @") ^ (inst))) (v_Vuna_dFmt_drenderAtomExpr lineInd base)
  | _ -> v_Vuna_dFmt_drenderAtomExpr lineInd fn
  | _ -> vuna_fail "./lib/Vuna/Fmt.vuna" 448 3 ("case pattern match failure"))
and v_Vuna_dFmt_dappendApplyArgs = fun lineInd lines args -> (match args with
  | [] -> lines
  | (a) :: (rest) -> v_Vuna_dFmt_dappendApplyArgs lineInd (v_Vuna_dFmt_dappendBefore " " lines (v_Vuna_dFmt_drenderAtomExpr lineInd a)) rest
  | _ -> vuna_fail "./lib/Vuna/Fmt.vuna" 453 3 ("case pattern match failure"))
and v_Vuna_dFmt_drenderRecordBlock = fun lineInd name fields -> (match fields with
  | [] -> (((name) ^ (" { }"))) :: ([])
  | (first) :: (rest) -> (let start = v_Vuna_dFmt_dappendBefore " " ((((name) ^ (" {"))) :: ([])) (v_Vuna_dFmt_drenderFieldBlock lineInd first) in let withRest = v_Vuna_dFmt_dappendFieldBlocks lineInd start rest in v_Vuna_dFmt_dappendLast " }" withRest)
  | _ -> vuna_fail "./lib/Vuna/Fmt.vuna" 458 3 ("case pattern match failure"))
and v_Vuna_dFmt_dappendFieldBlocks = fun lineInd lines fields -> (match fields with
  | [] -> lines
  | (f) :: (rest) -> v_Vuna_dFmt_dappendFieldBlocks lineInd (v_Vuna_dFmt_dappendBefore ", " lines (v_Vuna_dFmt_drenderFieldBlock lineInd f)) rest
  | _ -> vuna_fail "./lib/Vuna/Fmt.vuna" 466 3 ("case pattern match failure"))
and v_Vuna_dFmt_drenderFieldBlock = fun a0 a1 -> match (a0, a1) with
  | (lineInd, C_Vuna_dPair_dPair (fname, value)) -> v_Vuna_dFmt_dprefixFirst (((fname) ^ (" = "))) (v_Vuna_dFmt_drenderAtomExpr lineInd value)
  | _ -> vuna_fail "./lib/Vuna/Fmt.vuna" 470 1 ("no matching clause for Vuna.Fmt.renderFieldBlock")
and v_Vuna_dFmt_drenderRecUpdateBlock = fun lineInd base fields -> (let start = v_Vuna_dFmt_dappendBefore " " (("{") :: ([])) (v_Vuna_dFmt_drenderAtomExpr lineInd base) in (match fields with
  | [] -> v_Vuna_dFmt_dappendLast " }" start
  | (first) :: (rest) -> (let start2 = v_Vuna_dFmt_dappendBefore " | " start (v_Vuna_dFmt_drenderFieldBlock lineInd first) in let withRest = v_Vuna_dFmt_dappendFieldBlocks lineInd start2 rest in v_Vuna_dFmt_dappendLast " }" withRest)
  | _ -> vuna_fail "./lib/Vuna/Fmt.vuna" 475 6 ("case pattern match failure")))

let v_Vuna_dFmt_drenderSigDecl = fun lineInd name ty -> v_Vuna_dFmt_dprefixFirst ((let vuna_cat0' = (v_Vuna_dFmt_dspaces lineInd) in (let vuna_cat1' = (name) in (let vuna_cat2' = (" : ") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'])))) (v_Vuna_dFmt_drenderExpr lineInd ty)

let v_Vuna_dFmt_drenderCtorDecl = fun a0 -> match a0 with
  | (C_Vuna_dAst_dCtor (cname, ty, arity, sp)) -> v_Vuna_dFmt_dprefixFirst ((let vuna_cat0' = ("  ") in (let vuna_cat1' = (cname) in (let vuna_cat2' = (" : ") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'])))) (v_Vuna_dFmt_drenderExpr 2 ty)
  | _ -> vuna_fail "./lib/Vuna/Fmt.vuna" 503 1 ("no matching clause for Vuna.Fmt.renderCtorDecl")

let v_Vuna_dFmt_drenderDerivings = fun a0 -> match a0 with
  | ([]) -> []
  | (names) -> ((let vuna_cat0' = ("deriving (") in (let vuna_cat1' = (v_Vuna_dFmt_djoinComma names) in (let vuna_cat2' = (")") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'])))) :: ([])
  | _ -> vuna_fail "./lib/Vuna/Fmt.vuna" 506 1 ("no matching clause for Vuna.Fmt.renderDerivings")

let v_Vuna_dFmt_drenderDataDecl = fun name params ctors derivings -> (let header = (let vuna_cat0' = ("data ") in (let vuna_cat1' = (name) in (let vuna_cat2' = (v_Vuna_dFmt_djoinSpace params) in (let vuna_cat3' = (" : Type where") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'])))) in let ctorLines = v_Vuna_dList_dconcatMap (fun c -> v_Vuna_dFmt_drenderCtorDecl c) ctors in v_Vuna_dList_dappend ((header) :: ([])) (v_Vuna_dList_dappend ctorLines (v_Vuna_dFmt_drenderDerivings derivings)))

let v_Vuna_dFmt_drenderRecordDecl = fun name params fields derivings -> (let header = (let vuna_cat0' = ("record ") in (let vuna_cat1' = (name) in (let vuna_cat2' = (v_Vuna_dFmt_djoinSpace params) in (let vuna_cat3' = (" where") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'])))) in let fieldLines = v_Vuna_dList_dconcatMap (fun f -> v_Vuna_dFmt_dprefixFirst ((let vuna_cat0' = ("  ") in (let vuna_cat1' = (v_Vuna_dAst_dfieldName f) in (let vuna_cat2' = (" : ") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'])))) (v_Vuna_dFmt_drenderExpr 2 (v_Vuna_dAst_dfieldType f))) fields in v_Vuna_dList_dappend ((header) :: ([])) (v_Vuna_dList_dappend fieldLines (v_Vuna_dFmt_drenderDerivings derivings)))

let v_Vuna_dFmt_drenderMethodSig = fun a0 -> match a0 with
  | (C_Vuna_dPair_dPair (mname, ty)) -> v_Vuna_dFmt_dprefixFirst ((let vuna_cat0' = ("  ") in (let vuna_cat1' = (mname) in (let vuna_cat2' = (" : ") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'])))) (v_Vuna_dFmt_drenderExpr 2 ty)
  | _ -> vuna_fail "./lib/Vuna/Fmt.vuna" 519 1 ("no matching clause for Vuna.Fmt.renderMethodSig")

let v_Vuna_dFmt_drenderTraitDecl = fun name params methods -> (let header = (let vuna_cat0' = ("trait ") in (let vuna_cat1' = (name) in (let vuna_cat2' = (v_Vuna_dFmt_djoinSpace params) in (let vuna_cat3' = (" where") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'])))) in let methodLines = v_Vuna_dList_dconcatMap (fun m -> v_Vuna_dFmt_drenderMethodSig m) methods in v_Vuna_dList_dappend ((header) :: ([])) methodLines)

let rec v_Vuna_dFmt_drenderClause = fun lineInd name pats body -> (let headerBase = (let vuna_cat0' = (v_Vuna_dFmt_dspaces lineInd) in (let vuna_cat1' = (name) in (let vuna_cat2' = (v_Vuna_dFmt_djoinSpace (v_Vuna_dList_dmap v_Vuna_dFmt_drenderPatAtom pats)) in (let vuna_cat3' = (" =") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'])))) in (match body with
  | C_Vuna_dAst_dELet (binds, inner, recFlag, sp) -> if recFlag then (let whereInd = bi_add lineInd 2 in (match v_Vuna_dFmt_dinlinePrec 0 inner with
  | C_Vuna_dMaybe_dJust (s) -> ((let vuna_cat0' = (headerBase) in (let vuna_cat1' = (" ") in (let vuna_cat2' = (s) in (let vuna_cat3' = (" where") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3']))))) :: (v_Vuna_dFmt_drenderWhereBindings whereInd binds)
  | C_Vuna_dMaybe_dNothing -> (let bodyInd = bi_add lineInd 2 in let bodyLines = v_Vuna_dFmt_dprefixFirst (v_Vuna_dFmt_dspaces bodyInd) (v_Vuna_dFmt_drenderExpr bodyInd inner) in let whereLine = ((v_Vuna_dFmt_dspaces whereInd) ^ ("where")) in let bindLines = v_Vuna_dFmt_drenderWhereBindings (bi_add lineInd 4) binds in (headerBase) :: (v_Vuna_dList_dappend bodyLines ((whereLine) :: (bindLines))))
  | _ -> vuna_fail "./lib/Vuna/Fmt.vuna" 543 15 ("case pattern match failure"))) else (headerBase) :: (v_Vuna_dFmt_dprefixFirst (v_Vuna_dFmt_dspaces (bi_add lineInd 2)) (v_Vuna_dFmt_drenderExpr (bi_add lineInd 2) body))
  | _ -> v_Vuna_dFmt_dprefixFirst (((headerBase) ^ (" "))) (v_Vuna_dFmt_drenderExpr lineInd body)
  | _ -> vuna_fail "./lib/Vuna/Fmt.vuna" 539 6 ("case pattern match failure")))
and v_Vuna_dFmt_drenderWhereBindings = fun lineInd binds -> v_Vuna_dList_dconcatMap (fun b -> v_Vuna_dFmt_drenderWhereBinding lineInd b) binds
and v_Vuna_dFmt_drenderWhereBinding = fun a0 a1 -> match (a0, a1) with
  | (lineInd, C_Vuna_dPair_dPair (pat, value)) -> (match pat with
  | C_Vuna_dAst_dPVar (name, psp) -> (match value with
  | C_Vuna_dAst_dELam (ps, inner, lsp) -> v_Vuna_dFmt_drenderClause lineInd name (v_Vuna_dList_dmap (fun n -> C_Vuna_dAst_dPVar (n, v_Vuna_dFmt_ddummySpan)) ps) inner
  | _ -> v_Vuna_dFmt_drenderBindingValue lineInd (((name) ^ (" ="))) value
  | _ -> vuna_fail "./lib/Vuna/Fmt.vuna" 560 7 ("case pattern match failure"))
  | _ -> v_Vuna_dFmt_drenderBindingValue lineInd (((v_Vuna_dFmt_drenderPat pat) ^ (" ="))) value
  | _ -> vuna_fail "./lib/Vuna/Fmt.vuna" 558 3 ("case pattern match failure"))
  | _ -> vuna_fail "./lib/Vuna/Fmt.vuna" 557 1 ("no matching clause for Vuna.Fmt.renderWhereBinding")

let rec v_Vuna_dFmt_drenderDeclAt = fun lineInd decl -> (match decl with
  | C_Vuna_dAst_dDData (name, params, ctors, derivings, sp) -> v_Vuna_dFmt_drenderDataDecl name params ctors derivings
  | C_Vuna_dAst_dDSig (name, ty, sp) -> v_Vuna_dFmt_drenderSigDecl lineInd name ty
  | C_Vuna_dAst_dDFun (name, pats, body, sp) -> v_Vuna_dFmt_drenderClause lineInd name pats body
  | C_Vuna_dAst_dDRecord (name, params, fields, derivings, sp) -> v_Vuna_dFmt_drenderRecordDecl name params fields derivings
  | C_Vuna_dAst_dDTrait (name, params, methods, sp) -> v_Vuna_dFmt_drenderTraitDecl name params methods
  | C_Vuna_dAst_dDInstance (mname, isDefault, head, methods, sp) -> v_Vuna_dFmt_drenderInstanceDecl mname head methods
  | _ -> vuna_fail "./lib/Vuna/Fmt.vuna" 487 3 ("case pattern match failure"))
and v_Vuna_dFmt_drenderInstanceDecl = fun mname head methods -> (let headLines = (match v_Vuna_dFmt_dinlineExpr head with
  | C_Vuna_dMaybe_dJust (s) -> (s) :: ([])
  | C_Vuna_dMaybe_dNothing -> v_Vuna_dFmt_dparenWrap 0 head
  | _ -> vuna_fail "./lib/Vuna/Fmt.vuna" 524 9 ("case pattern match failure")) in let asText = (match mname with
  | C_Vuna_dMaybe_dNothing -> ""
  | C_Vuna_dMaybe_dJust (n) -> ((" as ") ^ (n))
  | _ -> vuna_fail "./lib/Vuna/Fmt.vuna" 528 9 ("case pattern match failure")) in let headLine = v_Vuna_dFmt_dappendLast (((asText) ^ (" where"))) (v_Vuna_dFmt_dprefixFirst "instance " headLines) in let methodLines = v_Vuna_dList_dconcatMap (fun d -> v_Vuna_dFmt_drenderDeclAt 2 d) methods in v_Vuna_dList_dappend headLine methodLines)

let v_Vuna_dFmt_ddeclNamed = fun d n -> (match d with
  | C_Vuna_dAst_dDFun (m, pats, body, sp) -> v_vuna_ueq_ustr m n
  | C_Vuna_dAst_dDSig (m, ty, sp) -> v_vuna_ueq_ustr m n
  | _ -> false
  | _ -> vuna_fail "./lib/Vuna/Fmt.vuna" 583 3 ("case pattern match failure"))

let v_Vuna_dFmt_dattachDecl = fun prev d -> (match d with
  | C_Vuna_dAst_dDFun (n, pats, body, sp) -> v_Vuna_dFmt_ddeclNamed prev n
  | _ -> false
  | _ -> vuna_fail "./lib/Vuna/Fmt.vuna" 578 3 ("case pattern match failure"))

let rec v_Vuna_dFmt_drenderTopRest = fun a0 a1 -> match (a0, a1) with
  | (prev, []) -> []
  | (prev, (d) :: (rest)) -> if v_Vuna_dFmt_dattachDecl prev d then v_Vuna_dList_dappend (v_Vuna_dFmt_drenderDeclAt 0 d) (v_Vuna_dFmt_drenderTopRest d rest) else ("") :: (v_Vuna_dList_dappend (v_Vuna_dFmt_drenderDeclAt 0 d) (v_Vuna_dFmt_drenderTopRest d rest))
  | _ -> vuna_fail "./lib/Vuna/Fmt.vuna" 570 1 ("no matching clause for Vuna.Fmt.renderTopRest")

let v_Vuna_dFmt_drenderTopDecls = fun a0 -> match a0 with
  | ([]) -> []
  | ((d) :: (rest)) -> v_Vuna_dList_dappend (v_Vuna_dFmt_drenderDeclAt 0 d) (v_Vuna_dFmt_drenderTopRest d rest)
  | _ -> vuna_fail "./lib/Vuna/Fmt.vuna" 566 1 ("no matching clause for Vuna.Fmt.renderTopDecls")

let v_Vuna_dFmt_drenderExportItem = fun item -> (match item with
  | C_Vuna_dAst_dXBare (name, sp) -> name
  | C_Vuna_dAst_dXTypeAll (name, sp) -> ((name) ^ ("(..)"))
  | C_Vuna_dAst_dXModule (name, sp) -> (("module ") ^ (name))
  | _ -> vuna_fail "./lib/Vuna/Fmt.vuna" 598 3 ("case pattern match failure"))

let v_Vuna_dFmt_drenderModDecl = fun a0 -> match a0 with
  | (C_Vuna_dAst_dModDecl (name, explicit, items, sp)) -> if explicit then (let vuna_cat0' = ("module ") in (let vuna_cat1' = (name) in (let vuna_cat2' = (" (") in (let vuna_cat3' = (v_Vuna_dFmt_djoinComma (v_Vuna_dList_dmap v_Vuna_dFmt_drenderExportItem items)) in (let vuna_cat4' = (") where") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'; vuna_cat4']))))) else (let vuna_cat0' = ("module ") in (let vuna_cat1' = (name) in (let vuna_cat2' = (" where") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'])))
  | _ -> vuna_fail "./lib/Vuna/Fmt.vuna" 592 1 ("no matching clause for Vuna.Fmt.renderModDecl")

let v_Vuna_dFmt_daliasSuffix = fun maybeAlias -> (match maybeAlias with
  | C_Vuna_dMaybe_dNothing -> ""
  | C_Vuna_dMaybe_dJust (a) -> ((" as ") ^ (a))
  | _ -> vuna_fail "./lib/Vuna/Fmt.vuna" 607 3 ("case pattern match failure"))

let v_Vuna_dFmt_drenderImport = fun a0 -> match a0 with
  | (C_Vuna_dAst_dImport (name, isQualified, alias, sp)) -> (let vuna_cat0' = ("import ") in (let vuna_cat1' = (if isQualified then "qualified " else "") in (let vuna_cat2' = (name) in (let vuna_cat3' = (v_Vuna_dFmt_daliasSuffix alias) in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3']))))
  | _ -> vuna_fail "./lib/Vuna/Fmt.vuna" 603 1 ("no matching clause for Vuna.Fmt.renderImport")

let v_Vuna_dFmt_drenderHeader = fun maybeHeader -> (match maybeHeader with
  | C_Vuna_dMaybe_dNothing -> []
  | C_Vuna_dMaybe_dJust (m) -> (v_Vuna_dFmt_drenderModDecl m) :: ([])
  | _ -> vuna_fail "./lib/Vuna/Fmt.vuna" 612 3 ("case pattern match failure"))

let v_Vuna_dFmt_drenderSourceSections = fun hdr imports decls -> (v_Vuna_dFmt_drenderHeader hdr) :: ((v_Vuna_dList_dmap v_Vuna_dFmt_drenderImport imports) :: ((v_Vuna_dFmt_drenderTopDecls decls) :: ([])))

let rec v_Vuna_dFmt_dfilterSections = fun a0 -> match a0 with
  | ([]) -> []
  | ((section) :: (rest)) -> (match section with
  | [] -> v_Vuna_dFmt_dfilterSections rest
  | _ -> (section) :: (v_Vuna_dFmt_dfilterSections rest)
  | _ -> vuna_fail "./lib/Vuna/Fmt.vuna" 622 3 ("case pattern match failure"))
  | _ -> vuna_fail "./lib/Vuna/Fmt.vuna" 619 1 ("no matching clause for Vuna.Fmt.filterSections")

let rec v_Vuna_dFmt_djoinSections = fun a0 -> match a0 with
  | ([]) -> []
  | ((section) :: ([])) -> section
  | ((section) :: (rest)) -> v_Vuna_dList_dappend section (("") :: (v_Vuna_dFmt_djoinSections rest))
  | _ -> vuna_fail "./lib/Vuna/Fmt.vuna" 626 1 ("no matching clause for Vuna.Fmt.joinSections")

let v_Vuna_dFmt_dformatSource = fun source -> (match v_Vuna_dParser_dparseSource "<fmt>" source with
  | C_Vuna_dResult_dErr (e) -> C_Vuna_dResult_dErr (e)
  | C_Vuna_dResult_dOk (C_Vuna_dAst_dSource (hdr, imports, decls)) -> (match v_Vuna_dFmt_djoinSections (v_Vuna_dFmt_dfilterSections (v_Vuna_dFmt_drenderSourceSections hdr imports decls)) with
  | [] -> C_Vuna_dResult_dOk ("")
  | lines -> C_Vuna_dResult_dOk (v_Vuna_dFmt_dunlines lines)
  | _ -> vuna_fail "./lib/Vuna/Fmt.vuna" 634 7 ("case pattern match failure"))
  | _ -> vuna_fail "./lib/Vuna/Fmt.vuna" 631 3 ("case pattern match failure"))
