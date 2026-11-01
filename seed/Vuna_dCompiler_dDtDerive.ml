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
open Vuna_dCompiler_dParser
open Vuna_dCompiler_dBuiltins
open Vuna_dCompiler_dLoader
open Vuna_dCompiler_dTypecheck
open Vuna_dCompiler_dSplit
open Vuna_dCompiler_dTypedCodegen
open Vuna_dCompiler_dCore
open Vuna_dCompiler_dDtPrelude
open Vuna_dCompiler_dDtKind
open Vuna_dCompiler_dDtQuant
let v_Vuna_dCompiler_dDtDerive_dnoSpan = C_Vuna_dCompiler_dCommon_dSpan ("", 0, 0, 0, 0)

let v_Vuna_dCompiler_dDtDerive_dfn1 = fun a b -> C_Vuna_dCompiler_dAst_dEPi ("_", false, a, b, v_Vuna_dCompiler_dDtDerive_dnoSpan)

let v_Vuna_dCompiler_dDtDerive_dshowTrait = fun () -> C_Vuna_dCompiler_dAst_dDTrait ("Show", ("a") :: ([]), (C_Base_dPair_dPair ("show", v_Vuna_dCompiler_dDtDerive_dfn1 (C_Vuna_dCompiler_dAst_dEVar ("a", v_Vuna_dCompiler_dDtDerive_dnoSpan)) (C_Vuna_dCompiler_dAst_dEVar ("String", v_Vuna_dCompiler_dDtDerive_dnoSpan)))) :: ([]), v_Vuna_dCompiler_dDtDerive_dnoSpan)

let v_Vuna_dCompiler_dDtDerive_dcmpTy = fun () -> v_Vuna_dCompiler_dDtDerive_dfn1 (C_Vuna_dCompiler_dAst_dEVar ("a", v_Vuna_dCompiler_dDtDerive_dnoSpan)) (v_Vuna_dCompiler_dDtDerive_dfn1 (C_Vuna_dCompiler_dAst_dEVar ("a", v_Vuna_dCompiler_dDtDerive_dnoSpan)) (C_Vuna_dCompiler_dAst_dEVar ("Bool", v_Vuna_dCompiler_dDtDerive_dnoSpan)))

let v_Vuna_dCompiler_dDtDerive_deqTrait = fun () -> C_Vuna_dCompiler_dAst_dDTrait ("Eq", ("a") :: ([]), (C_Base_dPair_dPair ("eq", v_Vuna_dCompiler_dDtDerive_dcmpTy ())) :: ((C_Base_dPair_dPair ("neq", v_Vuna_dCompiler_dDtDerive_dcmpTy ())) :: ([])), v_Vuna_dCompiler_dDtDerive_dnoSpan)

let v_Vuna_dCompiler_dDtDerive_dordTrait = fun () -> C_Vuna_dCompiler_dAst_dDTrait ("Ord", ("a") :: ([]), (C_Base_dPair_dPair ("lt", v_Vuna_dCompiler_dDtDerive_dcmpTy ())) :: ((C_Base_dPair_dPair ("le", v_Vuna_dCompiler_dDtDerive_dcmpTy ())) :: ((C_Base_dPair_dPair ("gt", v_Vuna_dCompiler_dDtDerive_dcmpTy ())) :: ((C_Base_dPair_dPair ("ge", v_Vuna_dCompiler_dDtDerive_dcmpTy ())) :: ([])))), v_Vuna_dCompiler_dDtDerive_dnoSpan)

let v_Vuna_dCompiler_dDtDerive_dbuiltinTraitDecls = fun () -> (v_Vuna_dCompiler_dDtDerive_dshowTrait ()) :: ((v_Vuna_dCompiler_dDtDerive_deqTrait ()) :: ((v_Vuna_dCompiler_dDtDerive_dordTrait ()) :: ([])))

let v_Vuna_dCompiler_dDtDerive_dhead = fun tn -> C_Vuna_dCompiler_dAst_dEApp (C_Vuna_dCompiler_dAst_dEVar ("Show", v_Vuna_dCompiler_dDtDerive_dnoSpan), (C_Vuna_dCompiler_dAst_dEVar (tn, v_Vuna_dCompiler_dDtDerive_dnoSpan)) :: ([]), v_Vuna_dCompiler_dDtDerive_dnoSpan)

let v_Vuna_dCompiler_dDtDerive_dshowIntInstance = fun () -> C_Vuna_dCompiler_dAst_dDInstance (C_Base_dMaybe_dNothing, false, v_Vuna_dCompiler_dDtDerive_dhead "Int", (C_Vuna_dCompiler_dAst_dDFun ("show", (C_Vuna_dCompiler_dAst_dPVar ("sx", v_Vuna_dCompiler_dDtDerive_dnoSpan)) :: ([]), C_Vuna_dCompiler_dAst_dEApp (C_Vuna_dCompiler_dAst_dEVar ("strFromInt", v_Vuna_dCompiler_dDtDerive_dnoSpan), (C_Vuna_dCompiler_dAst_dEVar ("sx", v_Vuna_dCompiler_dDtDerive_dnoSpan)) :: ([]), v_Vuna_dCompiler_dDtDerive_dnoSpan), v_Vuna_dCompiler_dDtDerive_dnoSpan)) :: ([]), v_Vuna_dCompiler_dDtDerive_dnoSpan)

let v_Vuna_dCompiler_dDtDerive_dshowStringInstance = fun () -> C_Vuna_dCompiler_dAst_dDInstance (C_Base_dMaybe_dNothing, false, v_Vuna_dCompiler_dDtDerive_dhead "String", (C_Vuna_dCompiler_dAst_dDFun ("show", (C_Vuna_dCompiler_dAst_dPVar ("sx", v_Vuna_dCompiler_dDtDerive_dnoSpan)) :: ([]), C_Vuna_dCompiler_dAst_dEVar ("sx", v_Vuna_dCompiler_dDtDerive_dnoSpan), v_Vuna_dCompiler_dDtDerive_dnoSpan)) :: ([]), v_Vuna_dCompiler_dDtDerive_dnoSpan)

let v_Vuna_dCompiler_dDtDerive_dshowBoolInstance = fun () -> C_Vuna_dCompiler_dAst_dDInstance (C_Base_dMaybe_dNothing, false, v_Vuna_dCompiler_dDtDerive_dhead "Bool", (C_Vuna_dCompiler_dAst_dDFun ("show", (C_Vuna_dCompiler_dAst_dPVar ("sx", v_Vuna_dCompiler_dDtDerive_dnoSpan)) :: ([]), C_Vuna_dCompiler_dAst_dEIf (C_Vuna_dCompiler_dAst_dEVar ("sx", v_Vuna_dCompiler_dDtDerive_dnoSpan), C_Vuna_dCompiler_dAst_dEStr ("True", v_Vuna_dCompiler_dDtDerive_dnoSpan), C_Vuna_dCompiler_dAst_dEStr ("False", v_Vuna_dCompiler_dDtDerive_dnoSpan), v_Vuna_dCompiler_dDtDerive_dnoSpan), v_Vuna_dCompiler_dDtDerive_dnoSpan)) :: ([]), v_Vuna_dCompiler_dDtDerive_dnoSpan)

let v_Vuna_dCompiler_dDtDerive_dbuiltinShowInstances = fun () -> (v_Vuna_dCompiler_dDtDerive_dshowIntInstance ()) :: ((v_Vuna_dCompiler_dDtDerive_dshowStringInstance ()) :: ((v_Vuna_dCompiler_dDtDerive_dshowBoolInstance ()) :: ([])))

let v_Vuna_dCompiler_dDtDerive_dinstHead = fun tn dname params sp -> C_Vuna_dCompiler_dAst_dEApp (C_Vuna_dCompiler_dAst_dEVar (tn, sp), (C_Vuna_dCompiler_dAst_dEVar (dname, sp)) :: (v_Base_dList_dmap (fun p -> C_Vuna_dCompiler_dAst_dEVar (p, sp)) params), sp)

let v_Vuna_dCompiler_dDtDerive_dshowOne = fun v sp -> C_Vuna_dCompiler_dAst_dEApp (C_Vuna_dCompiler_dAst_dEVar ("show", sp), (C_Vuna_dCompiler_dAst_dEVar (v, sp)) :: ([]), sp)

let rec v_Vuna_dCompiler_dDtDerive_dshowFields = fun a0 a1 -> match (a0, a1) with
  | ([], sp) -> C_Vuna_dCompiler_dAst_dEStr (")", sp)
  | ((v) :: (rest), sp) -> (match rest with
  | [] -> C_Vuna_dCompiler_dAst_dEApp (C_Vuna_dCompiler_dAst_dEVar ("++", sp), (v_Vuna_dCompiler_dDtDerive_dshowOne v sp) :: ((C_Vuna_dCompiler_dAst_dEStr (")", sp)) :: ([])), sp)
  | _ -> C_Vuna_dCompiler_dAst_dEApp (C_Vuna_dCompiler_dAst_dEVar ("++", sp), (v_Vuna_dCompiler_dDtDerive_dshowOne v sp) :: ((C_Vuna_dCompiler_dAst_dEApp (C_Vuna_dCompiler_dAst_dEVar ("++", sp), (C_Vuna_dCompiler_dAst_dEStr (" ", sp)) :: ((v_Vuna_dCompiler_dDtDerive_dshowFields rest sp) :: ([])), sp)) :: ([])), sp)
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/DtDerive.vuna" 159 29 ("case pattern match failure"))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/DtDerive.vuna" 158 1 ("no matching clause for Vuna.Compiler.DtDerive.showFields")

let v_Vuna_dCompiler_dDtDerive_dshowCtor = fun a0 a1 a2 -> match (a0, a1, a2) with
  | (cn, [], sp) -> C_Vuna_dCompiler_dAst_dEStr (cn, sp)
  | (cn, vs, sp) -> C_Vuna_dCompiler_dAst_dEApp (C_Vuna_dCompiler_dAst_dEVar ("++", sp), (C_Vuna_dCompiler_dAst_dEStr ((let vuna_cat0' = ("(") in (let vuna_cat1' = (cn) in (let vuna_cat2' = (" ") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2']))), sp)) :: ((v_Vuna_dCompiler_dDtDerive_dshowFields vs sp) :: ([])), sp)
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/DtDerive.vuna" 154 1 ("no matching clause for Vuna.Compiler.DtDerive.showCtor")

let rec v_Vuna_dCompiler_dDtDerive_dconjFields = fun a0 a1 a2 -> match (a0, a1, a2) with
  | ([], gs, sp) -> C_Vuna_dCompiler_dAst_dEVar ("True", sp)
  | ((f) :: (fs), (g) :: (gs), sp) -> (match fs with
  | [] -> C_Vuna_dCompiler_dAst_dEApp (C_Vuna_dCompiler_dAst_dEVar ("==", sp), (C_Vuna_dCompiler_dAst_dEVar (f, sp)) :: ((C_Vuna_dCompiler_dAst_dEVar (g, sp)) :: ([])), sp)
  | _ -> C_Vuna_dCompiler_dAst_dEApp (C_Vuna_dCompiler_dAst_dEVar ("&&", sp), (C_Vuna_dCompiler_dAst_dEApp (C_Vuna_dCompiler_dAst_dEVar ("==", sp), (C_Vuna_dCompiler_dAst_dEVar (f, sp)) :: ((C_Vuna_dCompiler_dAst_dEVar (g, sp)) :: ([])), sp)) :: ((v_Vuna_dCompiler_dDtDerive_dconjFields fs gs sp) :: ([])), sp)
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/DtDerive.vuna" 192 37 ("case pattern match failure"))
  | (fs, gs, sp) -> C_Vuna_dCompiler_dAst_dEVar ("False", sp)
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/DtDerive.vuna" 191 1 ("no matching clause for Vuna.Compiler.DtDerive.conjFields")

let v_Vuna_dCompiler_dDtDerive_dneqBody = fun sp -> C_Vuna_dCompiler_dAst_dEIf (C_Vuna_dCompiler_dAst_dEApp (C_Vuna_dCompiler_dAst_dEVar ("eq", sp), (C_Vuna_dCompiler_dAst_dEVar ("sx", sp)) :: ((C_Vuna_dCompiler_dAst_dEVar ("sy", sp)) :: ([])), sp), C_Vuna_dCompiler_dAst_dEVar ("False", sp), C_Vuna_dCompiler_dAst_dEVar ("True", sp), sp)

let rec v_Vuna_dCompiler_dDtDerive_dltFields = fun a0 a1 a2 -> match (a0, a1, a2) with
  | ([], gs, sp) -> C_Vuna_dCompiler_dAst_dEVar ("False", sp)
  | ((f) :: (fs), (g) :: (gs), sp) -> (match fs with
  | [] -> C_Vuna_dCompiler_dAst_dEApp (C_Vuna_dCompiler_dAst_dEVar ("<", sp), (C_Vuna_dCompiler_dAst_dEVar (f, sp)) :: ((C_Vuna_dCompiler_dAst_dEVar (g, sp)) :: ([])), sp)
  | _ -> C_Vuna_dCompiler_dAst_dEApp (C_Vuna_dCompiler_dAst_dEVar ("||", sp), (C_Vuna_dCompiler_dAst_dEApp (C_Vuna_dCompiler_dAst_dEVar ("<", sp), (C_Vuna_dCompiler_dAst_dEVar (f, sp)) :: ((C_Vuna_dCompiler_dAst_dEVar (g, sp)) :: ([])), sp)) :: ((C_Vuna_dCompiler_dAst_dEApp (C_Vuna_dCompiler_dAst_dEVar ("&&", sp), (C_Vuna_dCompiler_dAst_dEApp (C_Vuna_dCompiler_dAst_dEVar ("==", sp), (C_Vuna_dCompiler_dAst_dEVar (f, sp)) :: ((C_Vuna_dCompiler_dAst_dEVar (g, sp)) :: ([])), sp)) :: ((v_Vuna_dCompiler_dDtDerive_dltFields fs gs sp) :: ([])), sp)) :: ([])), sp)
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/DtDerive.vuna" 237 35 ("case pattern match failure"))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/DtDerive.vuna" 236 1 ("no matching clause for Vuna.Compiler.DtDerive.ltFields")

let v_Vuna_dCompiler_dDtDerive_dleBody = fun ctors sp -> C_Vuna_dCompiler_dAst_dEApp (C_Vuna_dCompiler_dAst_dEVar ("||", sp), (C_Vuna_dCompiler_dAst_dEApp (C_Vuna_dCompiler_dAst_dEVar ("lt", sp), (C_Vuna_dCompiler_dAst_dEVar ("sx", sp)) :: ((C_Vuna_dCompiler_dAst_dEVar ("sy", sp)) :: ([])), sp)) :: ((C_Vuna_dCompiler_dAst_dEIf (C_Vuna_dCompiler_dAst_dEApp (C_Vuna_dCompiler_dAst_dEVar ("lt", sp), (C_Vuna_dCompiler_dAst_dEVar ("sy", sp)) :: ((C_Vuna_dCompiler_dAst_dEVar ("sx", sp)) :: ([])), sp), C_Vuna_dCompiler_dAst_dEVar ("False", sp), C_Vuna_dCompiler_dAst_dEVar ("True", sp), sp)) :: ([])), sp)

let rec v_Vuna_dCompiler_dDtDerive_dvarNamesAt = fun prefix i n -> if v_vuna_uge_uint i n then [] else (((prefix) ^ (bi_str_from_int i))) :: (v_Vuna_dCompiler_dDtDerive_dvarNamesAt prefix (bi_add i 1) n)

let v_Vuna_dCompiler_dDtDerive_dvarNames = fun prefix n -> v_Vuna_dCompiler_dDtDerive_dvarNamesAt prefix 0 n

let rec v_Vuna_dCompiler_dDtDerive_dshowAlts = fun a0 a1 -> match (a0, a1) with
  | ([], sp) -> []
  | ((c) :: (rest), sp) -> (match c with
  | C_Vuna_dCompiler_dAst_dCtor (cn, ty, ar, cnsp) -> (let vs = v_Vuna_dCompiler_dDtDerive_dvarNames "fa" ar in let pat = C_Vuna_dCompiler_dAst_dPCon (cn, v_Base_dList_dmap (fun v -> C_Vuna_dCompiler_dAst_dPVar (v, sp)) vs, sp) in (C_Base_dPair_dPair (pat, v_Vuna_dCompiler_dDtDerive_dshowCtor cn vs sp)) :: (v_Vuna_dCompiler_dDtDerive_dshowAlts rest sp))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/DtDerive.vuna" 145 27 ("case pattern match failure"))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/DtDerive.vuna" 144 1 ("no matching clause for Vuna.Compiler.DtDerive.showAlts")

let v_Vuna_dCompiler_dDtDerive_dshowBody = fun ctors scrut sp -> C_Vuna_dCompiler_dAst_dECase (C_Vuna_dCompiler_dAst_dEVar (scrut, sp), v_Vuna_dCompiler_dDtDerive_dshowAlts ctors sp, sp)

let v_Vuna_dCompiler_dDtDerive_deqInner = fun cn ar sp -> (C_Base_dPair_dPair (C_Vuna_dCompiler_dAst_dPCon (cn, v_Base_dList_dmap (fun v -> C_Vuna_dCompiler_dAst_dPVar (v, sp)) (v_Vuna_dCompiler_dDtDerive_dvarNames "fb" ar), sp), v_Vuna_dCompiler_dDtDerive_dconjFields (v_Vuna_dCompiler_dDtDerive_dvarNames "fa" ar) (v_Vuna_dCompiler_dDtDerive_dvarNames "fb" ar) sp)) :: ((C_Base_dPair_dPair (C_Vuna_dCompiler_dAst_dPWild (sp), C_Vuna_dCompiler_dAst_dEVar ("False", sp))) :: ([]))

let v_Vuna_dCompiler_dDtDerive_deqAlt = fun c sp -> (match c with
  | C_Vuna_dCompiler_dAst_dCtor (cn, ty, ar, cnsp) -> (let vs = v_Vuna_dCompiler_dDtDerive_dvarNames "fa" ar in let pat = C_Vuna_dCompiler_dAst_dPCon (cn, v_Base_dList_dmap (fun v -> C_Vuna_dCompiler_dAst_dPVar (v, sp)) vs, sp) in let body = C_Vuna_dCompiler_dAst_dECase (C_Vuna_dCompiler_dAst_dEVar ("sy", sp), v_Vuna_dCompiler_dDtDerive_deqInner cn ar sp, sp) in C_Base_dPair_dPair (pat, body))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/DtDerive.vuna" 175 14 ("case pattern match failure"))

let v_Vuna_dCompiler_dDtDerive_deqBody = fun ctors sp -> C_Vuna_dCompiler_dAst_dECase (C_Vuna_dCompiler_dAst_dEVar ("sx", sp), v_Base_dList_dmap (fun c -> v_Vuna_dCompiler_dDtDerive_deqAlt c sp) ctors, sp)

let rec v_Vuna_dCompiler_dDtDerive_dordInnerGo = fun a0 a1 a2 a3 a4 -> match (a0, a1, a2, a3, a4) with
  | (i, ar, [], j, sp) -> []
  | (i, ar, (c) :: (rest), j, sp) -> (match c with
  | C_Vuna_dCompiler_dAst_dCtor (cn, ty, car, cnsp) -> (let gs = v_Vuna_dCompiler_dDtDerive_dvarNames "fb" car in let pat = C_Vuna_dCompiler_dAst_dPCon (cn, v_Base_dList_dmap (fun v -> C_Vuna_dCompiler_dAst_dPVar (v, sp)) gs, sp) in let body = if v_vuna_ueq_uint j i then v_Vuna_dCompiler_dDtDerive_dltFields (v_Vuna_dCompiler_dDtDerive_dvarNames "fa" ar) gs sp else if v_vuna_ult_uint j i then C_Vuna_dCompiler_dAst_dEVar ("False", sp) else C_Vuna_dCompiler_dAst_dEVar ("True", sp) in (C_Base_dPair_dPair (pat, body)) :: (v_Vuna_dCompiler_dDtDerive_dordInnerGo i ar rest (bi_add j 1) sp))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/DtDerive.vuna" 224 36 ("case pattern match failure"))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/DtDerive.vuna" 223 1 ("no matching clause for Vuna.Compiler.DtDerive.ordInnerGo")

let v_Vuna_dCompiler_dDtDerive_dordInner = fun i ar all sp -> v_Vuna_dCompiler_dDtDerive_dordInnerGo i ar all 0 sp

let rec v_Vuna_dCompiler_dDtDerive_dordAlts = fun a0 a1 a2 a3 -> match (a0, a1, a2, a3) with
  | (all, [], i, sp) -> []
  | (all, (c) :: (rest), i, sp) -> (match c with
  | C_Vuna_dCompiler_dAst_dCtor (cn, ty, ar, cnsp) -> (let vs = v_Vuna_dCompiler_dDtDerive_dvarNames "fa" ar in let pat = C_Vuna_dCompiler_dAst_dPCon (cn, v_Base_dList_dmap (fun v -> C_Vuna_dCompiler_dAst_dPVar (v, sp)) vs, sp) in let body = C_Vuna_dCompiler_dAst_dECase (C_Vuna_dCompiler_dAst_dEVar ("sy", sp), v_Vuna_dCompiler_dDtDerive_dordInner i ar all sp, sp) in (C_Base_dPair_dPair (pat, body)) :: (v_Vuna_dCompiler_dDtDerive_dordAlts all rest (bi_add i 1) sp))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/DtDerive.vuna" 210 32 ("case pattern match failure"))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/DtDerive.vuna" 209 1 ("no matching clause for Vuna.Compiler.DtDerive.ordAlts")

let v_Vuna_dCompiler_dDtDerive_dordBody = fun ctors sp -> C_Vuna_dCompiler_dAst_dECase (C_Vuna_dCompiler_dAst_dEVar ("sx", sp), v_Vuna_dCompiler_dDtDerive_dordAlts ctors ctors 0 sp, sp)

let v_Vuna_dCompiler_dDtDerive_dgtBody = fun ctors sp -> C_Vuna_dCompiler_dAst_dEApp (C_Vuna_dCompiler_dAst_dEVar ("lt", sp), (C_Vuna_dCompiler_dAst_dEVar ("sy", sp)) :: ((C_Vuna_dCompiler_dAst_dEVar ("sx", sp)) :: ([])), sp)

let v_Vuna_dCompiler_dDtDerive_dgeBody = fun ctors sp -> C_Vuna_dCompiler_dAst_dEApp (C_Vuna_dCompiler_dAst_dEVar ("le", sp), (C_Vuna_dCompiler_dAst_dEVar ("sy", sp)) :: ((C_Vuna_dCompiler_dAst_dEVar ("sx", sp)) :: ([])), sp)

let v_Vuna_dCompiler_dDtDerive_dderiveInstance = fun dname params ctors tn sp -> (let hd = v_Vuna_dCompiler_dDtDerive_dinstHead tn dname params sp in (match tn with
  | "Show" -> (let ms = (C_Vuna_dCompiler_dAst_dDFun ("show", (C_Vuna_dCompiler_dAst_dPVar ("sx", sp)) :: ([]), v_Vuna_dCompiler_dDtDerive_dshowBody ctors "sx" sp, sp)) :: ([]) in C_Base_dResult_dOk (C_Vuna_dCompiler_dAst_dDInstance (C_Base_dMaybe_dNothing, false, hd, ms, sp)))
  | "Eq" -> (let ms = (C_Vuna_dCompiler_dAst_dDFun ("eq", (C_Vuna_dCompiler_dAst_dPVar ("sx", sp)) :: ((C_Vuna_dCompiler_dAst_dPVar ("sy", sp)) :: ([])), v_Vuna_dCompiler_dDtDerive_deqBody ctors sp, sp)) :: ((C_Vuna_dCompiler_dAst_dDFun ("neq", (C_Vuna_dCompiler_dAst_dPVar ("sx", sp)) :: ((C_Vuna_dCompiler_dAst_dPVar ("sy", sp)) :: ([])), v_Vuna_dCompiler_dDtDerive_dneqBody sp, sp)) :: ([])) in C_Base_dResult_dOk (C_Vuna_dCompiler_dAst_dDInstance (C_Base_dMaybe_dNothing, false, hd, ms, sp)))
  | "Ord" -> (let ms = (C_Vuna_dCompiler_dAst_dDFun ("lt", (C_Vuna_dCompiler_dAst_dPVar ("sx", sp)) :: ((C_Vuna_dCompiler_dAst_dPVar ("sy", sp)) :: ([])), v_Vuna_dCompiler_dDtDerive_dordBody ctors sp, sp)) :: ((C_Vuna_dCompiler_dAst_dDFun ("le", (C_Vuna_dCompiler_dAst_dPVar ("sx", sp)) :: ((C_Vuna_dCompiler_dAst_dPVar ("sy", sp)) :: ([])), v_Vuna_dCompiler_dDtDerive_dleBody ctors sp, sp)) :: ((C_Vuna_dCompiler_dAst_dDFun ("gt", (C_Vuna_dCompiler_dAst_dPVar ("sx", sp)) :: ((C_Vuna_dCompiler_dAst_dPVar ("sy", sp)) :: ([])), v_Vuna_dCompiler_dDtDerive_dgtBody ctors sp, sp)) :: ((C_Vuna_dCompiler_dAst_dDFun ("ge", (C_Vuna_dCompiler_dAst_dPVar ("sx", sp)) :: ((C_Vuna_dCompiler_dAst_dPVar ("sy", sp)) :: ([])), v_Vuna_dCompiler_dDtDerive_dgeBody ctors sp, sp)) :: ([])))) in C_Base_dResult_dOk (C_Vuna_dCompiler_dAst_dDInstance (C_Base_dMaybe_dNothing, false, hd, ms, sp)))
  | _ -> C_Base_dResult_dErr ((let vuna_cat0' = (v_Vuna_dCompiler_dCommon_dshowSpanLoc sp) in (let vuna_cat1' = (": cannot derive `") in (let vuna_cat2' = (tn) in (let vuna_cat3' = ("` (supported: Show, Eq, Ord)") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'])))))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/DtDerive.vuna" 110 6 ("case pattern match failure")))

let rec v_Vuna_dCompiler_dDtDerive_dderivingsForGo = fun a0 a1 a2 a3 a4 a5 -> match (a0, a1, a2, a3, a4, a5) with
  | (dname, params, ctors, [], sp, acc) -> C_Base_dResult_dOk (v_Base_dList_dreverse acc)
  | (dname, params, ctors, (t) :: (rest), sp, acc) -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dDtDerive_dderiveInstance dname params ctors t sp) (fun decl -> v_Vuna_dCompiler_dDtDerive_dderivingsForGo dname params ctors rest sp ((decl) :: (acc)))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/DtDerive.vuna" 100 1 ("no matching clause for Vuna.Compiler.DtDerive.derivingsForGo")

let v_Vuna_dCompiler_dDtDerive_dderivingsFor = fun dname params ctors derivings sp -> v_Vuna_dCompiler_dDtDerive_dderivingsForGo dname params ctors derivings sp []

let rec v_Vuna_dCompiler_dDtDerive_dcollectDerivings = fun a0 -> match a0 with
  | ([]) -> C_Base_dResult_dOk ([])
  | ((d) :: (rest)) -> (match d with
  | C_Vuna_dCompiler_dAst_dDData (name, params, kind, ctors, derivings, sp) -> if v_vuna_ueq_uBase_uList_uList derivings [] then v_Vuna_dCompiler_dDtDerive_dcollectDerivings rest else v_Base_dResult_dandThen (v_Vuna_dCompiler_dDtDerive_dderivingsFor name params ctors derivings sp) (fun insts -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dDtDerive_dcollectDerivings rest) (fun more -> C_Base_dResult_dOk (v_Base_dList_dappend insts more)))
  | _ -> v_Vuna_dCompiler_dDtDerive_dcollectDerivings rest
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/DtDerive.vuna" 89 32 ("case pattern match failure"))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/DtDerive.vuna" 88 1 ("no matching clause for Vuna.Compiler.DtDerive.collectDerivings")

let v_Vuna_dCompiler_dDtDerive_dexpandDerivings = fun decls -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dDtDerive_dcollectDerivings decls) (fun insts -> C_Base_dResult_dOk (v_Base_dList_dappend decls insts))
