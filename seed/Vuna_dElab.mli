open Vuna_runtime
open Vuna_dPair
open Vuna_dBool
open Vuna_dMonad
open Vuna_dMaybe
open Vuna_dList
open Vuna_dIO
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
open Vuna_dTypecheck
open Vuna_dSplit
open Vuna_dTypedCodegen
open Vuna_dCore
type   t_Vuna_dElab_dDtDef =
    C_Vuna_dElab_dDtDef of (string) * (t_Vuna_dCore_dTerm) * (t_Vuna_dCore_dTerm)
and t_Vuna_dElab_dEc
and t_Vuna_dElab_dCtx
val v_Vuna_dElab_ddtDefName : (t_Vuna_dElab_dDtDef) -> (string)
val v_Vuna_dElab_ddtDefType : (t_Vuna_dElab_dDtDef) -> (t_Vuna_dCore_dTerm)
val v_Vuna_dElab_ddtDefBody : (t_Vuna_dElab_dDtDef) -> (t_Vuna_dCore_dTerm)
val v_Vuna_dElab_delabProgram : ((t_Vuna_dAst_dDecl) list) -> (((t_Vuna_dElab_dDtDef) list) t_Vuna_dResult_dResult)
val v_vuna_ushow_uVuna_uElab_uDtDef : (t_Vuna_dElab_dDtDef) -> (string)
val v_vuna_ueq_uVuna_uElab_uDtDef : (t_Vuna_dElab_dDtDef) -> ((t_Vuna_dElab_dDtDef) -> (bool))
val v_vuna_uneq_uVuna_uElab_uDtDef : (t_Vuna_dElab_dDtDef) -> ((t_Vuna_dElab_dDtDef) -> (bool))
val v_vuna_ueq_uVuna_uElab_uEc : (t_Vuna_dElab_dEc) -> ((t_Vuna_dElab_dEc) -> (bool))
val v_vuna_uneq_uVuna_uElab_uEc : (t_Vuna_dElab_dEc) -> ((t_Vuna_dElab_dEc) -> (bool))
val v_vuna_ueq_uVuna_uElab_uCtx : (t_Vuna_dElab_dCtx) -> ((t_Vuna_dElab_dCtx) -> (bool))
val v_vuna_uneq_uVuna_uElab_uCtx : (t_Vuna_dElab_dCtx) -> ((t_Vuna_dElab_dCtx) -> (bool))
val show_Vuna_dElab_dDtDef : t_Vuna_dElab_dDtDef -> string
val show_Vuna_dElab_dEc : t_Vuna_dElab_dEc -> string
val show_Vuna_dElab_dCtx : t_Vuna_dElab_dCtx -> string
