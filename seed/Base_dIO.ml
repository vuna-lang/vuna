open Vuna_runtime
open Vuna_builtins
open Base_dPair
open Base_dBool
open Base_dMonad
open Base_dMaybe
open Base_dEq
open Base_dList
open Base_dResult
open Base_dString
open Base_dShow
open Base_dOrd
open Prelude
open Vuna_dCompiler_dCommon
open Vuna_dCompiler_dFrontend_dToml
open Vuna_dCompiler_dFrontend_dManifest
open Vuna_dCompiler_dPackages_dPkg
open Base_dNat
open Base_dVec
open Vuna_dCompiler_dLoader_dDiagnostics
open Vuna_dCompiler_dFrontend_dAst
open Vuna_dCompiler_dFrontend_dDiagnostics
open Vuna_dCompiler_dFrontend_dLexer
open Vuna_dCompiler_dFrontend_dParser_dSupport
open Vuna_dCompiler_dFrontend_dParser
open Vuna_dCompiler_dLoader_dModules
open Vuna_dCompiler_dLoader_dResolve
open Vuna_dCompiler_dLoader_dFlatten
open Vuna_dCompiler_dLoader
open Vuna_dCompiler_dDebug
open Vuna_dCompiler_dDiagnostics
open Vuna_dCompiler_dCore_dTerm
open Vuna_dCompiler_dCore_dEval
open Vuna_dCompiler_dCore_dConv
open Vuna_dCompiler_dCore
open Vuna_dCompiler_dElab_dTypes
open Vuna_dCompiler_dElab_dPrelude
open Vuna_dCompiler_dElab_dSig
open Vuna_dCompiler_dElab_dMeta
open Vuna_dCompiler_dElab_dCase
open Vuna_dCompiler_dElab_dDict
open Vuna_dCompiler_dElab_dMatch
open Vuna_dCompiler_dElab_dTerm_dSupport
open Vuna_dCompiler_dElab_dTerm_dImpl
open Vuna_dCompiler_dElab_dTerm
open Vuna_dCompiler_dElab_dData
open Vuna_dCompiler_dElab_dTrait
open Vuna_dCompiler_dElab_dDerive
open Vuna_dCompiler_dElab_dRecords
open Vuna_dCompiler_dElab_dTermination_dMeasure
open Vuna_dCompiler_dElab_dTermination_dScc
open Vuna_dCompiler_dElab_dTermination
open Vuna_dCompiler_dElab_dDriver
open Vuna_dCompiler_dElab
open Vuna_dCompiler_dCodegen_dDecl
open Vuna_dCompiler_dCodegen_dErase
open Vuna_dCompiler_dCodegen_dTerm
open Vuna_dCompiler_dCodegen_dProgram
open Vuna_dCompiler_dDriver_dSplit
open Vuna_dCompiler_dCodegen_dSplit
open Vuna_dCompiler_dCodegen
open Vuna_dCompiler_dDriver_dDt
open Vuna_dCompiler_dDriver_dCompile
open Vuna_dCompiler_dDriver_dCompilerCli
type 'a0 t_Base_dIO_dIO = C_Base_dIO_dIO_Base_dIO_dMkIO of ((int) -> 'a0)

let v_Base_dIO_dioPure = (fun x -> (C_Base_dIO_dIO_Base_dIO_dMkIO ((fun w -> x))))

let v_Base_dIO_dioBind = (fun io -> (fun k -> (match io with
  | C_Base_dIO_dIO_Base_dIO_dMkIO (dtb__0) -> (C_Base_dIO_dIO_Base_dIO_dMkIO ((fun w -> (match (k (dtb__0 w)) with
  | C_Base_dIO_dIO_Base_dIO_dMkIO (dtb__1) -> (dtb__1 w)
  | _ -> failwith "DT: impossible branch"
))))
  | _ -> failwith "DT: impossible branch"
)))

let v_Base_dIO_dBase_dMonad_dMonad_uBase_dMonad_dMonad_uBase_dIO_dIO = fun () -> (C_Dict_uBase_dMonad_dMonad_MkDict_uBase_dMonad_dMonad ((fun io -> (fun k -> ((v_Base_dIO_dioBind io) k))), (fun x -> (v_Base_dIO_dioPure x))))

let v_Base_dIO_dioFmap = (fun f -> (fun io -> (match io with
  | C_Base_dIO_dIO_Base_dIO_dMkIO (dtb__2) -> (C_Base_dIO_dIO_Base_dIO_dMkIO ((fun w -> (f (dtb__2 w)))))
  | _ -> failwith "DT: impossible branch"
)))

let v_Base_dIO_dBase_dMonad_dFunctor_uBase_dMonad_dFunctor_uBase_dIO_dIO = fun () -> (C_Dict_uBase_dMonad_dFunctor_MkDict_uBase_dMonad_dFunctor ((fun f -> (fun io -> ((v_Base_dIO_dioFmap f) io)))))

let v_Base_dIO_dprint = (fun s -> (C_Base_dIO_dIO_Base_dIO_dMkIO ((fun w -> (dtp_print s)))))

let v_Base_dIO_dprintln = (fun s -> (v_Base_dIO_dprint ((bi_concat s) "\n")))

let v_Base_dIO_dreadFile = (fun path -> (C_Base_dIO_dIO_Base_dIO_dMkIO ((fun w -> (dtp_readFile path)))))

let v_Base_dIO_dwriteFile = (fun path -> (fun contents -> (C_Base_dIO_dIO_Base_dIO_dMkIO ((fun w -> ((dtp_writeFile path) contents))))))

let v_Base_dIO_dreadLine = fun () -> (C_Base_dIO_dIO_Base_dIO_dMkIO ((fun w -> (dtp_readLine ()))))

let v_Base_dIO_dreadDir = (fun path -> (C_Base_dIO_dIO_Base_dIO_dMkIO ((fun w -> ((fun p -> dtp_listOf (dtp_readDir p)) path)))))

let v_Base_dIO_disDirectory = (fun path -> (C_Base_dIO_dIO_Base_dIO_dMkIO ((fun w -> (dtp_isDirectory path)))))

let v_Base_dIO_dmakeDir = (fun path -> (C_Base_dIO_dIO_Base_dIO_dMkIO ((fun w -> (dtp_makeDir path)))))

let v_Base_dIO_dremoveFile = (fun path -> (C_Base_dIO_dIO_Base_dIO_dMkIO ((fun w -> (dtp_removeFile path)))))

let v_Base_dIO_dfileExists = (fun path -> (C_Base_dIO_dIO_Base_dIO_dMkIO ((fun w -> (dtp_fileExists path)))))

let v_Base_dIO_dfileMtime = (fun path -> (C_Base_dIO_dIO_Base_dIO_dMkIO ((fun w -> (dtp_fileMtime path)))))

let v_Base_dIO_dfileSize = (fun path -> (C_Base_dIO_dIO_Base_dIO_dMkIO ((fun w -> (dtp_fileSize path)))))

let v_Base_dIO_dgetArgs = fun () -> (C_Base_dIO_dIO_Base_dIO_dMkIO ((fun w -> (dtp_listOf (dtp_getArgs ())))))

let v_Base_dIO_dexit = (fun code -> (C_Base_dIO_dIO_Base_dIO_dMkIO ((fun w -> (dtp_exit code)))))
