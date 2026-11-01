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
open Vuna_dCompiler_dDtDerive
type   t_Vuna_dCompiler_dDtRecords_dRecordInfo =
    C_Vuna_dCompiler_dDtRecords_dRecordInfo of (string) * ((string) list) * (((string, t_Vuna_dCompiler_dAst_dExpr) t_Base_dPair_dPair) list) * ((string) list) * (string)
val v_Vuna_dCompiler_dDtRecords_drecordInfoName : (t_Vuna_dCompiler_dDtRecords_dRecordInfo) -> (string)
val v_Vuna_dCompiler_dDtRecords_drecordInfoParams : (t_Vuna_dCompiler_dDtRecords_dRecordInfo) -> ((string) list)
val v_Vuna_dCompiler_dDtRecords_drecordInfoFields : (t_Vuna_dCompiler_dDtRecords_dRecordInfo) -> (((string, t_Vuna_dCompiler_dAst_dExpr) t_Base_dPair_dPair) list)
val v_Vuna_dCompiler_dDtRecords_drecordInfoDerivings : (t_Vuna_dCompiler_dDtRecords_dRecordInfo) -> ((string) list)
val v_Vuna_dCompiler_dDtRecords_drecordInfoCtor : (t_Vuna_dCompiler_dDtRecords_dRecordInfo) -> (string)
val v_Vuna_dCompiler_dDtRecords_dlookupRecord : (string) -> (((t_Vuna_dCompiler_dDtRecords_dRecordInfo) list) -> ((t_Vuna_dCompiler_dDtRecords_dRecordInfo) t_Base_dMaybe_dMaybe))
val v_Vuna_dCompiler_dDtRecords_dfieldNamesOf : ((('a13295, 'a13296) t_Base_dPair_dPair) list) -> (('a13295) list)
val v_Vuna_dCompiler_dDtRecords_dfieldIndex : ('a13322) -> (((('a13322, 'a13325) t_Base_dPair_dPair) list) -> ((int) t_Base_dMaybe_dMaybe))
val v_Vuna_dCompiler_dDtRecords_dlookupProvided : (string) -> ((((string, 'a13329) t_Base_dPair_dPair) list) -> (('a13329) t_Base_dMaybe_dMaybe))
val v_Vuna_dCompiler_dDtRecords_dhasDuplicateFieldNames : (((string, 'a13347) t_Base_dPair_dPair) list) -> (bool)
val v_Vuna_dCompiler_dDtRecords_dmissingFieldMsg : (t_Vuna_dCompiler_dCommon_dSpan) -> ((string) -> (string))
val v_Vuna_dCompiler_dDtRecords_dunknownFieldMsg : (t_Vuna_dCompiler_dCommon_dSpan) -> ((string) -> (string))
val v_Vuna_dCompiler_dDtRecords_dduplicateFieldMsg : (t_Vuna_dCompiler_dCommon_dSpan) -> (string)
val v_Vuna_dCompiler_dDtRecords_dfirstUnknownFieldMsg : (t_Vuna_dCompiler_dCommon_dSpan) -> (((string) list) -> ((((string, 'a13402) t_Base_dPair_dPair) list) -> (string)))
val v_Vuna_dCompiler_dDtRecords_dcheckProvidedFields : ((string) list) -> ((((string, 'a13422) t_Base_dPair_dPair) list) -> ((t_Vuna_dCompiler_dCommon_dSpan) -> ((('a13415) list) t_Base_dResult_dResult)))
val v_Vuna_dCompiler_dDtRecords_drecordsOfDecls : ((string) -> (string)) -> (((t_Vuna_dCompiler_dAst_dDecl) list) -> (((t_Vuna_dCompiler_dDtRecords_dRecordInfo) list, (t_Vuna_dCompiler_dAst_dDecl) list) t_Base_dPair_dPair))
val v_Vuna_dCompiler_dDtRecords_drecordDeclToData : (t_Vuna_dCompiler_dAst_dDecl) -> ((string) -> (t_Vuna_dCompiler_dAst_dDecl))
val v_Vuna_dCompiler_dDtRecords_ddesugarRecords : ((t_Vuna_dCompiler_dDtRecords_dRecordInfo) list) -> (((t_Vuna_dCompiler_dAst_dDecl) list) -> (((t_Vuna_dCompiler_dAst_dDecl) list) t_Base_dResult_dResult))
val v_Vuna_dCompiler_dDtRecords_dprepareDecls : ((t_Vuna_dCompiler_dAst_dDecl) list) -> (((t_Vuna_dCompiler_dAst_dDecl) list) t_Base_dResult_dResult)
val show_Vuna_dCompiler_dDtRecords_dRecordInfo : t_Vuna_dCompiler_dDtRecords_dRecordInfo -> string
