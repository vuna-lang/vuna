open Vuna_runtime
open Base_dPair
open Base_dBool
open Base_dMonad
open Base_dMaybe
open Base_dEq
open Base_dOrd
open Base_dInt
open Base_dList
open Base_dResult
open Base_dString
open Base_dShow
open Prelude
open Vuna_dCompiler_dCommon
open Vuna_dCompiler_dFrontend_dToml
open Vuna_dCompiler_dFrontend_dManifest
open Base_dIO
open Vuna_dCompiler_dPackages_dPkg
open Base_dHashMap
open Vuna_dCompiler_dDebug
open Base_dNat
open Base_dVec
open Vuna_dCompiler_dDiagnostics_dCommon
open Vuna_dCompiler_dDiagnostics_dCg
open Vuna_dCompiler_dDiagnostics_dTc
open Vuna_dCompiler_dDiagnostics
open Vuna_dCompiler_dFrontend_dAst
open Vuna_dCompiler_dFrontend_dDiagnostics
open Vuna_dCompiler_dFrontend_dLexer
open Vuna_dCompiler_dFrontend_dParser_dSupport
open Vuna_dCompiler_dFrontend_dParser
type t_Vuna_dCompiler_dLoader_dDiagnostics_dLdDiag = C_Vuna_dCompiler_dLoader_dDiagnostics_dLdDiag_Vuna_dCompiler_dLoader_dDiagnostics_dEntryFileNotFound of (string) | C_Vuna_dCompiler_dLoader_dDiagnostics_dLdDiag_Vuna_dCompiler_dLoader_dDiagnostics_dImportCycle of (string) | C_Vuna_dCompiler_dLoader_dDiagnostics_dLdDiag_Vuna_dCompiler_dLoader_dDiagnostics_dInvalidModuleName of (string) | C_Vuna_dCompiler_dLoader_dDiagnostics_dLdDiag_Vuna_dCompiler_dLoader_dDiagnostics_dModuleHeaderInEntryFile of (string) | C_Vuna_dCompiler_dLoader_dDiagnostics_dLdDiag_Vuna_dCompiler_dLoader_dDiagnostics_dModuleHeaderInEntrySource of (string) | C_Vuna_dCompiler_dLoader_dDiagnostics_dLdDiag_Vuna_dCompiler_dLoader_dDiagnostics_dModuleNotFound of (string) * (string) | C_Vuna_dCompiler_dLoader_dDiagnostics_dLdDiag_Vuna_dCompiler_dLoader_dDiagnostics_dModuleNotExported of (string) * (string)
and t_Vuna_dCompiler_dLoader_dDiagnostics_dLdEntry = C_Vuna_dCompiler_dLoader_dDiagnostics_dLdEntry_Vuna_dCompiler_dLoader_dDiagnostics_dLdEntry of (string) * (string) * (string)

let v_Vuna_dCompiler_dLoader_dDiagnostics_dldCode = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dLoader_dDiagnostics_dLdDiag_Vuna_dCompiler_dLoader_dDiagnostics_dModuleNotExported (dtb__0, dtb__1) -> "LD_ModuleNotExported"
  | C_Vuna_dCompiler_dLoader_dDiagnostics_dLdDiag_Vuna_dCompiler_dLoader_dDiagnostics_dModuleNotFound (dtb__2, dtb__3) -> "LD_ModuleNotFound"
  | C_Vuna_dCompiler_dLoader_dDiagnostics_dLdDiag_Vuna_dCompiler_dLoader_dDiagnostics_dModuleHeaderInEntrySource (dtb__4) -> "LD_ModuleHeaderInEntrySource"
  | C_Vuna_dCompiler_dLoader_dDiagnostics_dLdDiag_Vuna_dCompiler_dLoader_dDiagnostics_dModuleHeaderInEntryFile (dtb__5) -> "LD_ModuleHeaderInEntryFile"
  | C_Vuna_dCompiler_dLoader_dDiagnostics_dLdDiag_Vuna_dCompiler_dLoader_dDiagnostics_dInvalidModuleName (dtb__6) -> "LD_InvalidModuleName"
  | C_Vuna_dCompiler_dLoader_dDiagnostics_dLdDiag_Vuna_dCompiler_dLoader_dDiagnostics_dImportCycle (dtb__7) -> "LD_ImportCycle"
  | C_Vuna_dCompiler_dLoader_dDiagnostics_dLdDiag_Vuna_dCompiler_dLoader_dDiagnostics_dEntryFileNotFound (dtb__8) -> "LD_EntryFileNotFound"
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dDiagnostics_dldTemplate = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dLoader_dDiagnostics_dLdDiag_Vuna_dCompiler_dLoader_dDiagnostics_dModuleNotExported (dtb__9, dtb__10) -> "module <0> is not exported by package <1>"
  | C_Vuna_dCompiler_dLoader_dDiagnostics_dLdDiag_Vuna_dCompiler_dLoader_dDiagnostics_dModuleNotFound (dtb__11, dtb__12) -> "module <0> not found (roots: <1>)"
  | C_Vuna_dCompiler_dLoader_dDiagnostics_dLdDiag_Vuna_dCompiler_dLoader_dDiagnostics_dModuleHeaderInEntrySource (dtb__13) -> "module header is not allowed in entry source (<0>)"
  | C_Vuna_dCompiler_dLoader_dDiagnostics_dLdDiag_Vuna_dCompiler_dLoader_dDiagnostics_dModuleHeaderInEntryFile (dtb__14) -> "module header is not allowed in entry file (<0>)"
  | C_Vuna_dCompiler_dLoader_dDiagnostics_dLdDiag_Vuna_dCompiler_dLoader_dDiagnostics_dInvalidModuleName (dtb__15) -> "invalid module name: <0>"
  | C_Vuna_dCompiler_dLoader_dDiagnostics_dLdDiag_Vuna_dCompiler_dLoader_dDiagnostics_dImportCycle (dtb__16) -> "import cycle: <0>"
  | C_Vuna_dCompiler_dLoader_dDiagnostics_dLdDiag_Vuna_dCompiler_dLoader_dDiagnostics_dEntryFileNotFound (dtb__17) -> "entry file not found: <0>"
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dDiagnostics_dldEntryCode = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dLoader_dDiagnostics_dLdEntry_Vuna_dCompiler_dLoader_dDiagnostics_dLdEntry (dtb__18, dtb__19, dtb__20) -> dtb__18
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dDiagnostics_dldEntryTemplate = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dLoader_dDiagnostics_dLdEntry_Vuna_dCompiler_dLoader_dDiagnostics_dLdEntry (dtb__21, dtb__22, dtb__23) -> dtb__22
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dDiagnostics_dldEntryDesc = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dLoader_dDiagnostics_dLdEntry_Vuna_dCompiler_dLoader_dDiagnostics_dLdEntry (dtb__24, dtb__25, dtb__26) -> dtb__26
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dDiagnostics_dldAll = (C_Base_dList_dList_Base_dList_dCons ((C_Vuna_dCompiler_dLoader_dDiagnostics_dLdEntry_Vuna_dCompiler_dLoader_dDiagnostics_dLdEntry ((v_Vuna_dCompiler_dLoader_dDiagnostics_dldCode (C_Vuna_dCompiler_dLoader_dDiagnostics_dLdDiag_Vuna_dCompiler_dLoader_dDiagnostics_dEntryFileNotFound (""))), (v_Vuna_dCompiler_dLoader_dDiagnostics_dldTemplate (C_Vuna_dCompiler_dLoader_dDiagnostics_dLdDiag_Vuna_dCompiler_dLoader_dDiagnostics_dEntryFileNotFound (""))), "\229\133\165\229\143\163\230\150\135\228\187\182\228\184\141\229\173\152\229\156\168")), (C_Base_dList_dList_Base_dList_dCons ((C_Vuna_dCompiler_dLoader_dDiagnostics_dLdEntry_Vuna_dCompiler_dLoader_dDiagnostics_dLdEntry ((v_Vuna_dCompiler_dLoader_dDiagnostics_dldCode (C_Vuna_dCompiler_dLoader_dDiagnostics_dLdDiag_Vuna_dCompiler_dLoader_dDiagnostics_dImportCycle (""))), (v_Vuna_dCompiler_dLoader_dDiagnostics_dldTemplate (C_Vuna_dCompiler_dLoader_dDiagnostics_dLdDiag_Vuna_dCompiler_dLoader_dDiagnostics_dImportCycle (""))), "import \230\136\144\231\142\175")), (C_Base_dList_dList_Base_dList_dCons ((C_Vuna_dCompiler_dLoader_dDiagnostics_dLdEntry_Vuna_dCompiler_dLoader_dDiagnostics_dLdEntry ((v_Vuna_dCompiler_dLoader_dDiagnostics_dldCode (C_Vuna_dCompiler_dLoader_dDiagnostics_dLdDiag_Vuna_dCompiler_dLoader_dDiagnostics_dInvalidModuleName (""))), (v_Vuna_dCompiler_dLoader_dDiagnostics_dldTemplate (C_Vuna_dCompiler_dLoader_dDiagnostics_dLdDiag_Vuna_dCompiler_dLoader_dDiagnostics_dInvalidModuleName (""))), "\233\157\158\230\179\149\230\168\161\229\157\151\229\144\141")), (C_Base_dList_dList_Base_dList_dCons ((C_Vuna_dCompiler_dLoader_dDiagnostics_dLdEntry_Vuna_dCompiler_dLoader_dDiagnostics_dLdEntry ((v_Vuna_dCompiler_dLoader_dDiagnostics_dldCode (C_Vuna_dCompiler_dLoader_dDiagnostics_dLdDiag_Vuna_dCompiler_dLoader_dDiagnostics_dModuleHeaderInEntryFile (""))), (v_Vuna_dCompiler_dLoader_dDiagnostics_dldTemplate (C_Vuna_dCompiler_dLoader_dDiagnostics_dLdDiag_Vuna_dCompiler_dLoader_dDiagnostics_dModuleHeaderInEntryFile (""))), "\229\133\165\229\143\163\230\150\135\228\187\182\228\184\141\229\133\129\232\174\184\230\168\161\229\157\151\229\164\180")), (C_Base_dList_dList_Base_dList_dCons ((C_Vuna_dCompiler_dLoader_dDiagnostics_dLdEntry_Vuna_dCompiler_dLoader_dDiagnostics_dLdEntry ((v_Vuna_dCompiler_dLoader_dDiagnostics_dldCode (C_Vuna_dCompiler_dLoader_dDiagnostics_dLdDiag_Vuna_dCompiler_dLoader_dDiagnostics_dModuleHeaderInEntrySource (""))), (v_Vuna_dCompiler_dLoader_dDiagnostics_dldTemplate (C_Vuna_dCompiler_dLoader_dDiagnostics_dLdDiag_Vuna_dCompiler_dLoader_dDiagnostics_dModuleHeaderInEntrySource (""))), "\229\133\165\229\143\163\230\186\144\231\160\129\228\184\141\229\133\129\232\174\184\230\168\161\229\157\151\229\164\180")), (C_Base_dList_dList_Base_dList_dCons ((C_Vuna_dCompiler_dLoader_dDiagnostics_dLdEntry_Vuna_dCompiler_dLoader_dDiagnostics_dLdEntry ((v_Vuna_dCompiler_dLoader_dDiagnostics_dldCode (C_Vuna_dCompiler_dLoader_dDiagnostics_dLdDiag_Vuna_dCompiler_dLoader_dDiagnostics_dModuleNotFound ("", ""))), (v_Vuna_dCompiler_dLoader_dDiagnostics_dldTemplate (C_Vuna_dCompiler_dLoader_dDiagnostics_dLdDiag_Vuna_dCompiler_dLoader_dDiagnostics_dModuleNotFound ("", ""))), "\230\168\161\229\157\151\230\156\170\230\137\190\229\136\176")), (C_Base_dList_dList_Base_dList_dCons ((C_Vuna_dCompiler_dLoader_dDiagnostics_dLdEntry_Vuna_dCompiler_dLoader_dDiagnostics_dLdEntry ((v_Vuna_dCompiler_dLoader_dDiagnostics_dldCode (C_Vuna_dCompiler_dLoader_dDiagnostics_dLdDiag_Vuna_dCompiler_dLoader_dDiagnostics_dModuleNotExported ("", ""))), (v_Vuna_dCompiler_dLoader_dDiagnostics_dldTemplate (C_Vuna_dCompiler_dLoader_dDiagnostics_dLdDiag_Vuna_dCompiler_dLoader_dDiagnostics_dModuleNotExported ("", ""))), "\230\168\161\229\157\151\230\156\170\232\162\171\229\140\133\229\175\188\229\135\186")), C_Base_dList_dList_Base_dList_dNil))))))))))))))

let v_Vuna_dCompiler_dLoader_dDiagnostics_dldMsg = (fun e -> (fun args -> ((bi_concat "[") ((bi_concat (v_Vuna_dCompiler_dLoader_dDiagnostics_dldCode e)) ((bi_concat "] ") ((v_Base_dVec_dsubstTemplate (v_Vuna_dCompiler_dLoader_dDiagnostics_dldTemplate e)) args))))))

let v_Vuna_dCompiler_dLoader_dDiagnostics_dldErr = (fun e -> (fun args -> (C_Base_dResult_dResult_Base_dResult_dErr (((v_Vuna_dCompiler_dLoader_dDiagnostics_dldMsg e) args)))))

let v_Vuna_dCompiler_dLoader_dDiagnostics_dldErr0 = (fun e -> ((v_Vuna_dCompiler_dLoader_dDiagnostics_dldErr e) C_Base_dVec_dVec_Base_dVec_dVNil))

let v_Vuna_dCompiler_dLoader_dDiagnostics_dldErr1 = (fun e -> (fun a0 -> ((v_Vuna_dCompiler_dLoader_dDiagnostics_dldErr e) (C_Base_dVec_dVec_Base_dVec_dVCons (a0, C_Base_dVec_dVec_Base_dVec_dVNil)))))

let v_Vuna_dCompiler_dLoader_dDiagnostics_dldErr2 = (fun e -> (fun a0 -> (fun a1 -> ((v_Vuna_dCompiler_dLoader_dDiagnostics_dldErr e) (C_Base_dVec_dVec_Base_dVec_dVCons (a0, (C_Base_dVec_dVec_Base_dVec_dVCons (a1, C_Base_dVec_dVec_Base_dVec_dVNil))))))))
