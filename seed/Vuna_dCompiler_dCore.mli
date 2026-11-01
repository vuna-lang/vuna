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
type   t_Vuna_dCompiler_dCore_dRig =
    C_Vuna_dCompiler_dCore_dRig0
  | C_Vuna_dCompiler_dCore_dRig1
  | C_Vuna_dCompiler_dCore_dRigOmega
and t_Vuna_dCompiler_dCore_dLevel
and   t_Vuna_dCompiler_dCore_dTerm =
    C_Vuna_dCompiler_dCore_dTVar of (string) * (int)
  | C_Vuna_dCompiler_dCore_dTMeta of (int)
  | C_Vuna_dCompiler_dCore_dTGlobal of (string)
  | C_Vuna_dCompiler_dCore_dTType of (t_Vuna_dCompiler_dCore_dLevel)
  | C_Vuna_dCompiler_dCore_dTPi of (string) * (bool) * (t_Vuna_dCompiler_dCore_dRig) * (t_Vuna_dCompiler_dCore_dTerm) * (t_Vuna_dCompiler_dCore_dTerm)
  | C_Vuna_dCompiler_dCore_dTLam of (string) * (t_Vuna_dCompiler_dCore_dRig) * (t_Vuna_dCompiler_dCore_dTerm)
  | C_Vuna_dCompiler_dCore_dTApp of (t_Vuna_dCompiler_dCore_dTerm) * (t_Vuna_dCompiler_dCore_dTerm) * (t_Vuna_dCompiler_dCore_dRig)
  | C_Vuna_dCompiler_dCore_dTCon of (string) * (((t_Vuna_dCompiler_dCore_dTerm, t_Vuna_dCompiler_dCore_dRig) t_Base_dPair_dPair) list)
  | C_Vuna_dCompiler_dCore_dTCase of (t_Vuna_dCompiler_dCore_dTerm) * ((t_Vuna_dCompiler_dCore_dCaseAlt) list)
  | C_Vuna_dCompiler_dCore_dTInt of (int)
  | C_Vuna_dCompiler_dCore_dTStr of (string)
  | C_Vuna_dCompiler_dCore_dTBool of (bool)
  | C_Vuna_dCompiler_dCore_dTIf of (t_Vuna_dCompiler_dCore_dTerm) * (t_Vuna_dCompiler_dCore_dTerm) * (t_Vuna_dCompiler_dCore_dTerm)
and   t_Vuna_dCompiler_dCore_dCaseAlt =
    C_Vuna_dCompiler_dCore_dCaseAlt of (string) * (((string, t_Vuna_dCompiler_dCore_dRig) t_Base_dPair_dPair) list) * (t_Vuna_dCompiler_dCore_dTerm)
and   t_Vuna_dCompiler_dCore_dClosure =
    C_Vuna_dCompiler_dCore_dClos of ((t_Vuna_dCompiler_dCore_dValue) list) * (t_Vuna_dCompiler_dCore_dTerm)
and   t_Vuna_dCompiler_dCore_dNeutral =
    C_Vuna_dCompiler_dCore_dNVar of (string) * (int) * ((t_Vuna_dCompiler_dCore_dValue) list)
  | C_Vuna_dCompiler_dCore_dNGlobal of (string) * ((t_Vuna_dCompiler_dCore_dValue) list)
and   t_Vuna_dCompiler_dCore_dValue =
    C_Vuna_dCompiler_dCore_dVType of (t_Vuna_dCompiler_dCore_dLevel)
  | C_Vuna_dCompiler_dCore_dVPi of (string) * (bool) * (t_Vuna_dCompiler_dCore_dRig) * (t_Vuna_dCompiler_dCore_dValue) * (t_Vuna_dCompiler_dCore_dClosure)
  | C_Vuna_dCompiler_dCore_dVLam of (string) * (t_Vuna_dCompiler_dCore_dRig) * (t_Vuna_dCompiler_dCore_dClosure)
  | C_Vuna_dCompiler_dCore_dVNeutral of (t_Vuna_dCompiler_dCore_dNeutral)
  | C_Vuna_dCompiler_dCore_dVMeta of (int) * ((t_Vuna_dCompiler_dCore_dValue) list)
  | C_Vuna_dCompiler_dCore_dVCon of (string) * ((t_Vuna_dCompiler_dCore_dValue) list)
  | C_Vuna_dCompiler_dCore_dVCase of (t_Vuna_dCompiler_dCore_dValue) * ((t_Vuna_dCompiler_dCore_dVCaseAlt) list)
  | C_Vuna_dCompiler_dCore_dVInt of (int)
  | C_Vuna_dCompiler_dCore_dVStr of (string)
  | C_Vuna_dCompiler_dCore_dVBool of (bool)
  | C_Vuna_dCompiler_dCore_dVIf of (t_Vuna_dCompiler_dCore_dValue) * (t_Vuna_dCompiler_dCore_dValue) * (t_Vuna_dCompiler_dCore_dValue)
and   t_Vuna_dCompiler_dCore_dVCaseAlt =
    C_Vuna_dCompiler_dCore_dVCaseAlt of (string) * (((string, t_Vuna_dCompiler_dCore_dRig) t_Base_dPair_dPair) list) * (t_Vuna_dCompiler_dCore_dClosure)
val v_Vuna_dCompiler_dCore_drigIsErased : (t_Vuna_dCompiler_dCore_dRig) -> (bool)
val v_Vuna_dCompiler_dCore_drigIsLinear : (t_Vuna_dCompiler_dCore_dRig) -> (bool)
val v_Vuna_dCompiler_dCore_drigIsOmega : (t_Vuna_dCompiler_dCore_dRig) -> (bool)
val v_Vuna_dCompiler_dCore_drigOfBinder : (bool) -> ((bool) -> (t_Vuna_dCompiler_dCore_dRig))
val v_Vuna_dCompiler_dCore_dlevelZero : t_Vuna_dCompiler_dCore_dLevel
val v_Vuna_dCompiler_dCore_dlevelSucc : (t_Vuna_dCompiler_dCore_dLevel) -> (t_Vuna_dCompiler_dCore_dLevel)
val v_Vuna_dCompiler_dCore_dlevelMax : (t_Vuna_dCompiler_dCore_dLevel) -> ((t_Vuna_dCompiler_dCore_dLevel) -> (t_Vuna_dCompiler_dCore_dLevel))
val v_Vuna_dCompiler_dCore_dlevelToInt : (t_Vuna_dCompiler_dCore_dLevel) -> (int)
val v_Vuna_dCompiler_dCore_dlevelOfInt : (int) -> (t_Vuna_dCompiler_dCore_dLevel)
val v_Vuna_dCompiler_dCore_dlevelEq : (t_Vuna_dCompiler_dCore_dLevel) -> ((t_Vuna_dCompiler_dCore_dLevel) -> (bool))
val v_Vuna_dCompiler_dCore_dlevelLt : (t_Vuna_dCompiler_dCore_dLevel) -> ((t_Vuna_dCompiler_dCore_dLevel) -> (bool))
val v_Vuna_dCompiler_dCore_dcaseAltName : (t_Vuna_dCompiler_dCore_dCaseAlt) -> (string)
val v_Vuna_dCompiler_dCore_dcaseAltBinders : (t_Vuna_dCompiler_dCore_dCaseAlt) -> (((string, t_Vuna_dCompiler_dCore_dRig) t_Base_dPair_dPair) list)
val v_Vuna_dCompiler_dCore_dcaseAltBody : (t_Vuna_dCompiler_dCore_dCaseAlt) -> (t_Vuna_dCompiler_dCore_dTerm)
val v_Vuna_dCompiler_dCore_dvCaseAltName : (t_Vuna_dCompiler_dCore_dVCaseAlt) -> (string)
val v_Vuna_dCompiler_dCore_dvCaseAltBinders : (t_Vuna_dCompiler_dCore_dVCaseAlt) -> (((string, t_Vuna_dCompiler_dCore_dRig) t_Base_dPair_dPair) list)
val v_Vuna_dCompiler_dCore_dvCaseAltClosure : (t_Vuna_dCompiler_dCore_dVCaseAlt) -> (t_Vuna_dCompiler_dCore_dClosure)
val v_Vuna_dCompiler_dCore_deval : ((t_Vuna_dCompiler_dCore_dValue) list) -> ((t_Vuna_dCompiler_dCore_dTerm) -> (t_Vuna_dCompiler_dCore_dValue))
val v_Vuna_dCompiler_dCore_dapplyClosure : (t_Vuna_dCompiler_dCore_dClosure) -> ((t_Vuna_dCompiler_dCore_dValue) -> (t_Vuna_dCompiler_dCore_dValue))
val v_Vuna_dCompiler_dCore_dapplyValue : (t_Vuna_dCompiler_dCore_dValue) -> ((t_Vuna_dCompiler_dCore_dValue) -> (t_Vuna_dCompiler_dCore_dValue))
val v_Vuna_dCompiler_dCore_dapplySpine : (t_Vuna_dCompiler_dCore_dValue) -> (((t_Vuna_dCompiler_dCore_dValue) list) -> (t_Vuna_dCompiler_dCore_dValue))
val v_Vuna_dCompiler_dCore_dshift : (int) -> ((int) -> ((t_Vuna_dCompiler_dCore_dTerm) -> (t_Vuna_dCompiler_dCore_dTerm)))
val v_Vuna_dCompiler_dCore_dquote : (int) -> ((t_Vuna_dCompiler_dCore_dValue) -> (t_Vuna_dCompiler_dCore_dTerm))
val v_Vuna_dCompiler_dCore_devalCase : (t_Vuna_dCompiler_dCore_dValue) -> (((t_Vuna_dCompiler_dCore_dVCaseAlt) list) -> (t_Vuna_dCompiler_dCore_dValue))
val v_Vuna_dCompiler_dCore_dforce : (((string, t_Vuna_dCompiler_dCore_dTerm) t_Base_dPair_dPair) list) -> ((((int, t_Vuna_dCompiler_dCore_dValue) t_Base_dPair_dPair) list) -> ((int) -> ((t_Vuna_dCompiler_dCore_dValue) -> (t_Vuna_dCompiler_dCore_dValue))))
val v_Vuna_dCompiler_dCore_dnormalize : (((string, t_Vuna_dCompiler_dCore_dTerm) t_Base_dPair_dPair) list) -> ((((int, t_Vuna_dCompiler_dCore_dValue) t_Base_dPair_dPair) list) -> ((int) -> ((t_Vuna_dCompiler_dCore_dValue) -> (t_Vuna_dCompiler_dCore_dValue))))
val v_Vuna_dCompiler_dCore_dconv : (((string, t_Vuna_dCompiler_dCore_dTerm) t_Base_dPair_dPair) list) -> ((((int, t_Vuna_dCompiler_dCore_dValue) t_Base_dPair_dPair) list) -> ((int) -> ((t_Vuna_dCompiler_dCore_dValue) -> ((t_Vuna_dCompiler_dCore_dValue) -> ((((int, t_Vuna_dCompiler_dCore_dValue) t_Base_dPair_dPair) list) t_Base_dResult_dResult)))))
val v_Vuna_dCompiler_dCore_ddefaultFuel : int
val v_Vuna_dCompiler_dCore_disTypeValue : (t_Vuna_dCompiler_dCore_dValue) -> (bool)
val v_Vuna_dCompiler_dCore_dtypeLevelOf : (t_Vuna_dCompiler_dCore_dValue) -> ((t_Vuna_dCompiler_dCore_dLevel) t_Base_dMaybe_dMaybe)
val v_Vuna_dCompiler_dCore_dmetaLookup : (int) -> ((((int, t_Vuna_dCompiler_dCore_dValue) t_Base_dPair_dPair) list) -> ((t_Vuna_dCompiler_dCore_dValue) t_Base_dMaybe_dMaybe))
val v_Vuna_dCompiler_dCore_ddefLookup : (string) -> ((((string, t_Vuna_dCompiler_dCore_dTerm) t_Base_dPair_dPair) list) -> ((t_Vuna_dCompiler_dCore_dTerm) t_Base_dMaybe_dMaybe))
val v_Vuna_dCompiler_dCore_dshowTerm : (t_Vuna_dCompiler_dCore_dTerm) -> (string)
val v_Vuna_dCompiler_dCore_dshowValue : (t_Vuna_dCompiler_dCore_dValue) -> (string)
val v_Vuna_dCompiler_dCore_dshowValueAt : (int) -> ((t_Vuna_dCompiler_dCore_dValue) -> (string))
val v_vuna_ushow_uVuna_uCompiler_uCore_uRig : (t_Vuna_dCompiler_dCore_dRig) -> (string)
val v_vuna_ueq_uVuna_uCompiler_uCore_uRig : (t_Vuna_dCompiler_dCore_dRig) -> ((t_Vuna_dCompiler_dCore_dRig) -> (bool))
val v_vuna_uneq_uVuna_uCompiler_uCore_uRig : (t_Vuna_dCompiler_dCore_dRig) -> ((t_Vuna_dCompiler_dCore_dRig) -> (bool))
val v_vuna_ushow_uVuna_uCompiler_uCore_uLevel : (t_Vuna_dCompiler_dCore_dLevel) -> (string)
val v_vuna_ueq_uVuna_uCompiler_uCore_uLevel : (t_Vuna_dCompiler_dCore_dLevel) -> ((t_Vuna_dCompiler_dCore_dLevel) -> (bool))
val v_vuna_uneq_uVuna_uCompiler_uCore_uLevel : (t_Vuna_dCompiler_dCore_dLevel) -> ((t_Vuna_dCompiler_dCore_dLevel) -> (bool))
val show_Vuna_dCompiler_dCore_dRig : t_Vuna_dCompiler_dCore_dRig -> string
val show_Vuna_dCompiler_dCore_dLevel : t_Vuna_dCompiler_dCore_dLevel -> string
val show_Vuna_dCompiler_dCore_dTerm : t_Vuna_dCompiler_dCore_dTerm -> string
val show_Vuna_dCompiler_dCore_dCaseAlt : t_Vuna_dCompiler_dCore_dCaseAlt -> string
val show_Vuna_dCompiler_dCore_dClosure : t_Vuna_dCompiler_dCore_dClosure -> string
val show_Vuna_dCompiler_dCore_dNeutral : t_Vuna_dCompiler_dCore_dNeutral -> string
val show_Vuna_dCompiler_dCore_dValue : t_Vuna_dCompiler_dCore_dValue -> string
val show_Vuna_dCompiler_dCore_dVCaseAlt : t_Vuna_dCompiler_dCore_dVCaseAlt -> string
