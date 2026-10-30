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
let v_Vuna_dDoc_dstripVunaSuffix = fun name -> if v_Vuna_dString_dendsWith ".vuna" name then v_Vuna_dString_dsubstring 0 (bi_sub (bi_str_length name) 5) name else name

let v_Vuna_dDoc_dmoduleHeaderLine = fun path hdr -> (match hdr with
  | C_Vuna_dMaybe_dJust (C_Vuna_dAst_dModDecl (name, hasList, items, sp)) -> (("## ") ^ (name))
  | C_Vuna_dMaybe_dNothing -> (match v_Vuna_dFiles_dsplitPath path with
  | C_Vuna_dPair_dPair (dir, base) -> (("## ") ^ (v_Vuna_dDoc_dstripVunaSuffix base))
  | _ -> vuna_fail "./lib/Vuna/Doc.vuna" 44 7 ("case pattern match failure"))
  | _ -> vuna_fail "./lib/Vuna/Doc.vuna" 41 3 ("case pattern match failure"))

let v_Vuna_dDoc_dparamSuffix = fun a0 -> match a0 with
  | ([]) -> ""
  | (params) -> ((" ") ^ (v_Vuna_dString_djoin " " params))
  | _ -> vuna_fail "./lib/Vuna/Doc.vuna" 75 1 ("no matching clause for Vuna.Doc.paramSuffix")

let v_Vuna_dDoc_dderivingLines = fun a0 -> match a0 with
  | ([]) -> []
  | (derivings) -> ((let vuna_cat0' = ("deriving (") in (let vuna_cat1' = (v_Vuna_dString_djoin ", " derivings) in (let vuna_cat2' = (")") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'])))) :: ([])
  | _ -> vuna_fail "./lib/Vuna/Doc.vuna" 79 1 ("no matching clause for Vuna.Doc.derivingLines")

let v_Vuna_dDoc_disPrivate = fun name -> (match bi_str_unpack name with
  | (c) :: (rest) -> v_vuna_ueq_uint c 95
  | [] -> false
  | _ -> vuna_fail "./lib/Vuna/Doc.vuna" 90 3 ("case pattern match failure"))

let rec v_Vuna_dDoc_drenderTy = fun ty -> (match ty with
  | C_Vuna_dAst_dEVar (name, sp) -> name
  | C_Vuna_dAst_dEApp (C_Vuna_dAst_dEVar ("->", _), (a) :: ((b) :: ([])), _) -> (let vuna_cat0' = (v_Vuna_dDoc_drenderTyArg a) in (let vuna_cat1' = (" -> ") in (let vuna_cat2' = (v_Vuna_dDoc_drenderTy b) in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'])))
  | _ -> v_Vuna_dDoc_drenderTyPlain ty
  | _ -> vuna_fail "./lib/Vuna/Doc.vuna" 96 3 ("case pattern match failure"))
and v_Vuna_dDoc_drenderTyPlain = fun ty -> (match ty with
  | C_Vuna_dAst_dEApp (f, args, sp) -> (let vuna_cat0' = (v_Vuna_dDoc_drenderTyAtom f) in (let vuna_cat1' = (" ") in (let vuna_cat2' = (v_Vuna_dString_djoin " " (v_Vuna_dList_dmap v_Vuna_dDoc_drenderTyArg args)) in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'])))
  | C_Vuna_dAst_dEInt (n, sp) -> bi_str_from_int n
  | C_Vuna_dAst_dEStr (s, sp) -> (let vuna_cat0' = ("\"") in (let vuna_cat1' = (s) in (let vuna_cat2' = ("\"") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'])))
  | _ -> "_"
  | _ -> vuna_fail "./lib/Vuna/Doc.vuna" 102 3 ("case pattern match failure"))
and v_Vuna_dDoc_drenderTyArg = fun ty -> (match ty with
  | C_Vuna_dAst_dEVar (name, sp) -> name
  | C_Vuna_dAst_dEApp (C_Vuna_dAst_dEVar ("->", _), (a) :: ((b) :: ([])), _) -> (let vuna_cat0' = ("(") in (let vuna_cat1' = (v_Vuna_dDoc_drenderTy ty) in (let vuna_cat2' = (")") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'])))
  | _ -> (let vuna_cat0' = ("(") in (let vuna_cat1' = (v_Vuna_dDoc_drenderTy ty) in (let vuna_cat2' = (")") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'])))
  | _ -> vuna_fail "./lib/Vuna/Doc.vuna" 109 3 ("case pattern match failure"))
and v_Vuna_dDoc_drenderTyAtom = fun ty -> (match ty with
  | C_Vuna_dAst_dEVar (name, sp) -> name
  | _ -> (let vuna_cat0' = ("(") in (let vuna_cat1' = (v_Vuna_dDoc_drenderTy ty) in (let vuna_cat2' = (")") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'])))
  | _ -> vuna_fail "./lib/Vuna/Doc.vuna" 115 3 ("case pattern match failure"))

let v_Vuna_dDoc_dctorLine = fun a0 -> match a0 with
  | (C_Vuna_dAst_dCtor (name, ty, arity, sp)) -> (let vuna_cat0' = ("  ") in (let vuna_cat1' = (name) in (let vuna_cat2' = (" : ") in (let vuna_cat3' = (v_Vuna_dDoc_drenderTy ty) in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3']))))
  | _ -> vuna_fail "./lib/Vuna/Doc.vuna" 83 1 ("no matching clause for Vuna.Doc.ctorLine")

let v_Vuna_dDoc_dfieldLine = fun a0 -> match a0 with
  | (C_Vuna_dAst_dField (name, ty, sp)) -> (let vuna_cat0' = ("  ") in (let vuna_cat1' = (name) in (let vuna_cat2' = (" : ") in (let vuna_cat3' = (v_Vuna_dDoc_drenderTy ty) in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3']))))
  | _ -> vuna_fail "./lib/Vuna/Doc.vuna" 85 1 ("no matching clause for Vuna.Doc.fieldLine")

let v_Vuna_dDoc_dmethodLine = fun a0 -> match a0 with
  | (C_Vuna_dPair_dPair (name, ty)) -> (let vuna_cat0' = ("  ") in (let vuna_cat1' = (name) in (let vuna_cat2' = (" : ") in (let vuna_cat3' = (v_Vuna_dDoc_drenderTy ty) in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3']))))
  | _ -> vuna_fail "./lib/Vuna/Doc.vuna" 87 1 ("no matching clause for Vuna.Doc.methodLine")

let v_Vuna_dDoc_ddeclLinesOf = fun d -> (match d with
  | C_Vuna_dAst_dDData (name, params, ctors, derivings, sp) -> if v_Vuna_dDoc_disPrivate name then [] else v_Vuna_dList_dappend (((let vuna_cat0' = ("data ") in (let vuna_cat1' = (name) in (let vuna_cat2' = (v_Vuna_dDoc_dparamSuffix params) in (let vuna_cat3' = (" : Type where") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3']))))) :: (v_Vuna_dList_dmap v_Vuna_dDoc_dctorLine ctors)) (v_Vuna_dDoc_dderivingLines derivings)
  | C_Vuna_dAst_dDRecord (name, params, fields, derivings, sp) -> if v_Vuna_dDoc_disPrivate name then [] else v_Vuna_dList_dappend (((let vuna_cat0' = ("record ") in (let vuna_cat1' = (name) in (let vuna_cat2' = (v_Vuna_dDoc_dparamSuffix params) in (let vuna_cat3' = (" where") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3']))))) :: (v_Vuna_dList_dmap v_Vuna_dDoc_dfieldLine fields)) (v_Vuna_dDoc_dderivingLines derivings)
  | C_Vuna_dAst_dDTrait (name, params, methods, sp) -> if v_Vuna_dDoc_disPrivate name then [] else ((let vuna_cat0' = ("trait ") in (let vuna_cat1' = (name) in (let vuna_cat2' = (v_Vuna_dDoc_dparamSuffix params) in (let vuna_cat3' = (" where") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3']))))) :: (v_Vuna_dList_dmap v_Vuna_dDoc_dmethodLine methods)
  | C_Vuna_dAst_dDSig (name, ty, sp) -> if v_Vuna_dDoc_disPrivate name then [] else ("") :: (((let vuna_cat0' = (name) in (let vuna_cat1' = (" : ") in (let vuna_cat2' = (v_Vuna_dDoc_drenderTy ty) in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'])))) :: ([]))
  | _ -> []
  | _ -> vuna_fail "./lib/Vuna/Doc.vuna" 55 3 ("case pattern match failure"))

let v_Vuna_dDoc_ddeclLines = fun decls -> v_Vuna_dList_dconcatMap v_Vuna_dDoc_ddeclLinesOf decls

let v_Vuna_dDoc_ddocModule = fun path -> (match v_Vuna_dParser_dparseSource path (bi_read_file path) with
  | C_Vuna_dResult_dErr (e) -> C_Vuna_dResult_dErr ((let vuna_cat0' = (path) in (let vuna_cat1' = (": ") in (let vuna_cat2' = (e) in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2']))))
  | C_Vuna_dResult_dOk (C_Vuna_dAst_dSource (hdr, imports, decls)) -> C_Vuna_dResult_dOk ((let vuna_cat0' = (v_Vuna_dDoc_dmoduleHeaderLine path hdr) in (let vuna_cat1' = ("\n\n```vuna\n") in (let vuna_cat2' = (v_Vuna_dString_djoin "\n" (v_Vuna_dDoc_ddeclLines decls)) in (let vuna_cat3' = ("\n```\n") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'])))))
  | _ -> vuna_fail "./lib/Vuna/Doc.vuna" 35 3 ("case pattern match failure"))

let rec v_Vuna_dDoc_ddocModules = fun a0 -> match a0 with
  | ([]) -> C_Vuna_dResult_dOk ([])
  | ((path) :: (rest)) -> v_Vuna_dResult_dandThen (v_Vuna_dDoc_ddocModule path) (fun section -> v_Vuna_dResult_dandThen (v_Vuna_dDoc_ddocModules rest) (fun sections -> C_Vuna_dResult_dOk ((section) :: (sections))))
  | _ -> vuna_fail "./lib/Vuna/Doc.vuna" 28 1 ("no matching clause for Vuna.Doc.docModules")

let v_Vuna_dDoc_drunDoc = fun dir outPath -> (let libDir = ((dir) ^ ("/lib")) in (let root = if bi_is_directory libDir then libDir else dir in (let files = v_Vuna_dFiles_dcollectVunaFiles root in (match v_Vuna_dDoc_ddocModules files with
  | C_Vuna_dResult_dErr (e) -> (let _ = bi_print ((let vuna_cat0' = ("error: ") in (let vuna_cat1' = (e) in (let vuna_cat2' = ("\n") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'])))) in 2)
  | C_Vuna_dResult_dOk (sections) -> (let content = (let vuna_cat0' = ("# vuna API\n\n\231\148\177 `vuna doc` \228\187\142\230\186\144\231\160\129\231\148\159\230\136\144\227\128\130\n\n") in (let vuna_cat1' = (v_Vuna_dString_djoin "\n" sections) in (let vuna_cat2' = ("\n") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2']))) in (let parent = v_Vuna_dPair_dfirstOf (v_Vuna_dFiles_dsplitPath outPath) in (let _ = if v_vuna_ueq_ustr parent "" then 0 else bi_make_dir parent in (let _ = bi_write_file outPath content in (let _ = bi_print ((let vuna_cat0' = ("wrote ") in (let vuna_cat1' = (outPath) in (let vuna_cat2' = (" (") in (let vuna_cat3' = (bi_str_from_int (v_Vuna_dList_dlength files)) in (let vuna_cat4' = (" modules)\n") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'; vuna_cat4'])))))) in 0)))))
  | _ -> vuna_fail "./lib/Vuna/Doc.vuna" 17 12 ("case pattern match failure")))))
