open Vuna_runtime
open Vuna_dPair
open Vuna_dBool
open Vuna_dMonad
open Vuna_dMaybe
open Vuna_dList
open Vuna_dResult
open Vuna_dString
include module type of struct include Vuna_dPair end
include module type of struct include Vuna_dBool end
include module type of struct include Vuna_dMaybe end
include module type of struct include Vuna_dList end
include module type of struct include Vuna_dResult end
include module type of struct include Vuna_dString end
type   t_Vuna_dBase_dPos =
    C_Vuna_dBase_dPos of (int) * (int)
and   t_Vuna_dBase_dSpan =
    C_Vuna_dBase_dSpan of (string) * (int) * (int) * (int) * (int)
val v_Vuna_dBase_dposLine : (t_Vuna_dBase_dPos) -> (int)
val v_Vuna_dBase_dposCol : (t_Vuna_dBase_dPos) -> (int)
val v_Vuna_dBase_dspanFile : (t_Vuna_dBase_dSpan) -> (string)
val v_Vuna_dBase_dspanStartLine : (t_Vuna_dBase_dSpan) -> (int)
val v_Vuna_dBase_dspanStartCol : (t_Vuna_dBase_dSpan) -> (int)
val v_Vuna_dBase_dspanEndLine : (t_Vuna_dBase_dSpan) -> (int)
val v_Vuna_dBase_dspanEndCol : (t_Vuna_dBase_dSpan) -> (int)
val v_Vuna_dBase_dshowSpanLoc : (t_Vuna_dBase_dSpan) -> (string)
val v_Vuna_dBase_dsuggest : (string) -> (((string) list) -> (string))
val v_Vuna_dBase_dcontainsDot : (string) -> (bool)
val v_Vuna_dBase_dsplitOnDot : (string) -> ((string) list)
val v_Vuna_dBase_dsplitLastDot : ((string) list) -> (((string) list, string) t_Vuna_dPair_dPair)
val v_Vuna_dBase_djoinDots : ((string) list) -> (string)
val v_Vuna_dBase_djoinSlashes : ((string) list) -> (string)
val v_Vuna_dBase_djoinArrows : ((string) list) -> (string)
val v_vuna_ushow_uVuna_uBase_uPos : (t_Vuna_dBase_dPos) -> (string)
val v_vuna_ueq_uVuna_uBase_uPos : (t_Vuna_dBase_dPos) -> ((t_Vuna_dBase_dPos) -> (bool))
val v_vuna_uneq_uVuna_uBase_uPos : (t_Vuna_dBase_dPos) -> ((t_Vuna_dBase_dPos) -> (bool))
val v_vuna_ushow_uVuna_uBase_uSpan : (t_Vuna_dBase_dSpan) -> (string)
val v_vuna_ueq_uVuna_uBase_uSpan : (t_Vuna_dBase_dSpan) -> ((t_Vuna_dBase_dSpan) -> (bool))
val v_vuna_uneq_uVuna_uBase_uSpan : (t_Vuna_dBase_dSpan) -> ((t_Vuna_dBase_dSpan) -> (bool))
val show_Vuna_dBase_dPos : t_Vuna_dBase_dPos -> string
val show_Vuna_dBase_dSpan : t_Vuna_dBase_dSpan -> string
