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
type   t_Vuna_dLexer_dTok =
    C_Vuna_dLexer_dTIdent of (string)
  | C_Vuna_dLexer_dTKw of (string)
  | C_Vuna_dLexer_dTInt of (int)
  | C_Vuna_dLexer_dTStr of (string)
  | C_Vuna_dLexer_dTSym of (string)
  | C_Vuna_dLexer_dTEof
and   t_Vuna_dLexer_dPTok =
    C_Vuna_dLexer_dPTok of (t_Vuna_dLexer_dTok) * (t_Vuna_dBase_dPos)
and t_Vuna_dLexer_dChars
and   t_Vuna_dLexer_dCKind =
    C_Vuna_dLexer_dCLine
  | C_Vuna_dLexer_dCBlock
and   t_Vuna_dLexer_dComment =
    C_Vuna_dLexer_dComment of (t_Vuna_dLexer_dCKind) * (string) * (t_Vuna_dBase_dSpan)
val v_Vuna_dLexer_disUpperChar : (int) -> (bool)
val v_Vuna_dLexer_disLowerChar : (int) -> (bool)
val v_Vuna_dLexer_disIdentStart : (int) -> (bool)
val v_Vuna_dLexer_disDigit : (int) -> (bool)
val v_Vuna_dLexer_dlexSource : (string) -> (((t_Vuna_dLexer_dPTok) list) t_Vuna_dResult_dResult)
val v_Vuna_dLexer_dcommentKind : (t_Vuna_dLexer_dComment) -> (t_Vuna_dLexer_dCKind)
val v_Vuna_dLexer_dcommentText : (t_Vuna_dLexer_dComment) -> (string)
val v_Vuna_dLexer_dcommentSpan : (t_Vuna_dLexer_dComment) -> (t_Vuna_dBase_dSpan)
val v_Vuna_dLexer_dlexComments : (string) -> (((t_Vuna_dLexer_dComment) list) t_Vuna_dResult_dResult)
val v_vuna_ushow_uVuna_uLexer_uTok : (t_Vuna_dLexer_dTok) -> (string)
val v_vuna_ueq_uVuna_uLexer_uTok : (t_Vuna_dLexer_dTok) -> ((t_Vuna_dLexer_dTok) -> (bool))
val v_vuna_uneq_uVuna_uLexer_uTok : (t_Vuna_dLexer_dTok) -> ((t_Vuna_dLexer_dTok) -> (bool))
val v_vuna_ushow_uVuna_uLexer_uPTok : (t_Vuna_dLexer_dPTok) -> (string)
val v_vuna_ueq_uVuna_uLexer_uPTok : (t_Vuna_dLexer_dPTok) -> ((t_Vuna_dLexer_dPTok) -> (bool))
val v_vuna_uneq_uVuna_uLexer_uPTok : (t_Vuna_dLexer_dPTok) -> ((t_Vuna_dLexer_dPTok) -> (bool))
val v_vuna_ueq_uVuna_uLexer_uChars : (t_Vuna_dLexer_dChars) -> ((t_Vuna_dLexer_dChars) -> (bool))
val v_vuna_uneq_uVuna_uLexer_uChars : (t_Vuna_dLexer_dChars) -> ((t_Vuna_dLexer_dChars) -> (bool))
val v_vuna_ushow_uVuna_uLexer_uCKind : (t_Vuna_dLexer_dCKind) -> (string)
val v_vuna_ueq_uVuna_uLexer_uCKind : (t_Vuna_dLexer_dCKind) -> ((t_Vuna_dLexer_dCKind) -> (bool))
val v_vuna_uneq_uVuna_uLexer_uCKind : (t_Vuna_dLexer_dCKind) -> ((t_Vuna_dLexer_dCKind) -> (bool))
val v_vuna_ushow_uVuna_uLexer_uComment : (t_Vuna_dLexer_dComment) -> (string)
val v_vuna_ueq_uVuna_uLexer_uComment : (t_Vuna_dLexer_dComment) -> ((t_Vuna_dLexer_dComment) -> (bool))
val v_vuna_uneq_uVuna_uLexer_uComment : (t_Vuna_dLexer_dComment) -> ((t_Vuna_dLexer_dComment) -> (bool))
val show_Vuna_dLexer_dTok : t_Vuna_dLexer_dTok -> string
val show_Vuna_dLexer_dPTok : t_Vuna_dLexer_dPTok -> string
val show_Vuna_dLexer_dChars : t_Vuna_dLexer_dChars -> string
val show_Vuna_dLexer_dCKind : t_Vuna_dLexer_dCKind -> string
val show_Vuna_dLexer_dComment : t_Vuna_dLexer_dComment -> string
