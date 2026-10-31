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
type   t_Vuna_dCore_dTerm =
    C_Vuna_dCore_dTVar of (string) * (int)
  | C_Vuna_dCore_dTMeta of (int)
  | C_Vuna_dCore_dTGlobal of (string)
  | C_Vuna_dCore_dTType of (int)
  | C_Vuna_dCore_dTPi of (string) * (bool) * (t_Vuna_dCore_dTerm) * (t_Vuna_dCore_dTerm)
  | C_Vuna_dCore_dTLam of (string) * (bool) * (t_Vuna_dCore_dTerm)
  | C_Vuna_dCore_dTApp of (t_Vuna_dCore_dTerm) * (t_Vuna_dCore_dTerm) * (bool)
  | C_Vuna_dCore_dTInt of (int)
  | C_Vuna_dCore_dTStr of (string)
  | C_Vuna_dCore_dTBool of (bool)
  | C_Vuna_dCore_dTIf of (t_Vuna_dCore_dTerm) * (t_Vuna_dCore_dTerm) * (t_Vuna_dCore_dTerm)
and   t_Vuna_dCore_dClosure =
    C_Vuna_dCore_dClos of ((t_Vuna_dCore_dValue) list) * (t_Vuna_dCore_dTerm)
and   t_Vuna_dCore_dNeutral =
    C_Vuna_dCore_dNVar of (string) * (int) * ((t_Vuna_dCore_dValue) list)
  | C_Vuna_dCore_dNGlobal of (string) * ((t_Vuna_dCore_dValue) list)
and   t_Vuna_dCore_dValue =
    C_Vuna_dCore_dVType of (int)
  | C_Vuna_dCore_dVPi of (string) * (bool) * (t_Vuna_dCore_dValue) * (t_Vuna_dCore_dClosure)
  | C_Vuna_dCore_dVLam of (string) * (bool) * (t_Vuna_dCore_dClosure)
  | C_Vuna_dCore_dVNeutral of (t_Vuna_dCore_dNeutral)
  | C_Vuna_dCore_dVMeta of (int) * ((t_Vuna_dCore_dValue) list)
  | C_Vuna_dCore_dVInt of (int)
  | C_Vuna_dCore_dVStr of (string)
  | C_Vuna_dCore_dVBool of (bool)
  | C_Vuna_dCore_dVIf of (t_Vuna_dCore_dValue) * (t_Vuna_dCore_dValue) * (t_Vuna_dCore_dValue)
val v_Vuna_dCore_deval : ((t_Vuna_dCore_dValue) list) -> ((t_Vuna_dCore_dTerm) -> (t_Vuna_dCore_dValue))
val v_Vuna_dCore_dapplyClosure : (t_Vuna_dCore_dClosure) -> ((t_Vuna_dCore_dValue) -> (t_Vuna_dCore_dValue))
val v_Vuna_dCore_dapplyValue : (t_Vuna_dCore_dValue) -> ((t_Vuna_dCore_dValue) -> (t_Vuna_dCore_dValue))
val v_Vuna_dCore_dapplySpine : (t_Vuna_dCore_dValue) -> (((t_Vuna_dCore_dValue) list) -> (t_Vuna_dCore_dValue))
val v_Vuna_dCore_dshift : (int) -> ((int) -> ((t_Vuna_dCore_dTerm) -> (t_Vuna_dCore_dTerm)))
val v_Vuna_dCore_dquote : (int) -> ((t_Vuna_dCore_dValue) -> (t_Vuna_dCore_dTerm))
val v_Vuna_dCore_dforce : (((string, t_Vuna_dCore_dTerm) t_Vuna_dPair_dPair) list) -> ((((int, t_Vuna_dCore_dTerm) t_Vuna_dPair_dPair) list) -> ((int) -> ((t_Vuna_dCore_dValue) -> (t_Vuna_dCore_dValue))))
val v_Vuna_dCore_dnormalize : (((string, t_Vuna_dCore_dTerm) t_Vuna_dPair_dPair) list) -> ((((int, t_Vuna_dCore_dTerm) t_Vuna_dPair_dPair) list) -> ((int) -> ((t_Vuna_dCore_dValue) -> (t_Vuna_dCore_dValue))))
val v_Vuna_dCore_dconv : (((string, t_Vuna_dCore_dTerm) t_Vuna_dPair_dPair) list) -> ((((int, t_Vuna_dCore_dTerm) t_Vuna_dPair_dPair) list) -> ((int) -> ((t_Vuna_dCore_dValue) -> ((t_Vuna_dCore_dValue) -> ((((int, t_Vuna_dCore_dTerm) t_Vuna_dPair_dPair) list) t_Vuna_dResult_dResult)))))
val v_Vuna_dCore_ddefaultFuel : int
val v_Vuna_dCore_disTypeValue : (t_Vuna_dCore_dValue) -> (bool)
val v_Vuna_dCore_dtypeLevelOf : (t_Vuna_dCore_dValue) -> ((int) t_Vuna_dMaybe_dMaybe)
val v_Vuna_dCore_dmetaLookup : (int) -> ((((int, t_Vuna_dCore_dTerm) t_Vuna_dPair_dPair) list) -> ((t_Vuna_dCore_dTerm) t_Vuna_dMaybe_dMaybe))
val v_Vuna_dCore_ddefLookup : (string) -> ((((string, t_Vuna_dCore_dTerm) t_Vuna_dPair_dPair) list) -> ((t_Vuna_dCore_dTerm) t_Vuna_dMaybe_dMaybe))
val v_Vuna_dCore_dshowTerm : (t_Vuna_dCore_dTerm) -> (string)
val v_Vuna_dCore_dshowValue : (t_Vuna_dCore_dValue) -> (string)
val v_Vuna_dCore_dshowValueAt : (int) -> ((t_Vuna_dCore_dValue) -> (string))
val v_vuna_ushow_uVuna_uCore_uTerm : (t_Vuna_dCore_dTerm) -> (string)
val v_vuna_ueq_uVuna_uCore_uTerm : (t_Vuna_dCore_dTerm) -> ((t_Vuna_dCore_dTerm) -> (bool))
val v_vuna_uneq_uVuna_uCore_uTerm : (t_Vuna_dCore_dTerm) -> ((t_Vuna_dCore_dTerm) -> (bool))
val show_Vuna_dCore_dTerm : t_Vuna_dCore_dTerm -> string
val show_Vuna_dCore_dClosure : t_Vuna_dCore_dClosure -> string
val show_Vuna_dCore_dNeutral : t_Vuna_dCore_dNeutral -> string
val show_Vuna_dCore_dValue : t_Vuna_dCore_dValue -> string
