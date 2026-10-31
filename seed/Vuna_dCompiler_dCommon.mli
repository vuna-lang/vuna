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
include module type of struct include Base_dPair end
include module type of struct include Base_dBool end
include module type of struct include Base_dMaybe end
include module type of struct include Base_dList end
include module type of struct include Base_dResult end
include module type of struct include Base_dString end
type   t_Vuna_dCompiler_dCommon_dPos =
    C_Vuna_dCompiler_dCommon_dPos of (int) * (int)
and   t_Vuna_dCompiler_dCommon_dSpan =
    C_Vuna_dCompiler_dCommon_dSpan of (string) * (int) * (int) * (int) * (int)
val v_Vuna_dCompiler_dCommon_dposLine : (t_Vuna_dCompiler_dCommon_dPos) -> (int)
val v_Vuna_dCompiler_dCommon_dposCol : (t_Vuna_dCompiler_dCommon_dPos) -> (int)
val v_Vuna_dCompiler_dCommon_dspanFile : (t_Vuna_dCompiler_dCommon_dSpan) -> (string)
val v_Vuna_dCompiler_dCommon_dspanStartLine : (t_Vuna_dCompiler_dCommon_dSpan) -> (int)
val v_Vuna_dCompiler_dCommon_dspanStartCol : (t_Vuna_dCompiler_dCommon_dSpan) -> (int)
val v_Vuna_dCompiler_dCommon_dspanEndLine : (t_Vuna_dCompiler_dCommon_dSpan) -> (int)
val v_Vuna_dCompiler_dCommon_dspanEndCol : (t_Vuna_dCompiler_dCommon_dSpan) -> (int)
val v_Vuna_dCompiler_dCommon_dshowSpanLoc : (t_Vuna_dCompiler_dCommon_dSpan) -> (string)
val v_Vuna_dCompiler_dCommon_dsuggest : (string) -> (((string) list) -> (string))
val v_Vuna_dCompiler_dCommon_dcontainsDot : (string) -> (bool)
val v_Vuna_dCompiler_dCommon_dsplitOnDot : (string) -> ((string) list)
val v_Vuna_dCompiler_dCommon_dsplitLastDot : ((string) list) -> (((string) list, string) t_Base_dPair_dPair)
val v_Vuna_dCompiler_dCommon_djoinDots : ((string) list) -> (string)
val v_Vuna_dCompiler_dCommon_djoinSlashes : ((string) list) -> (string)
val v_Vuna_dCompiler_dCommon_djoinArrows : ((string) list) -> (string)
val v_Vuna_dCompiler_dCommon_dsplitPath : (string) -> ((string, string) t_Base_dPair_dPair)
val v_Vuna_dCompiler_dCommon_dbaseName : (string) -> (string)
val v_vuna_ushow_uVuna_uCompiler_uCommon_uPos : (t_Vuna_dCompiler_dCommon_dPos) -> (string)
val v_vuna_ueq_uVuna_uCompiler_uCommon_uPos : (t_Vuna_dCompiler_dCommon_dPos) -> ((t_Vuna_dCompiler_dCommon_dPos) -> (bool))
val v_vuna_uneq_uVuna_uCompiler_uCommon_uPos : (t_Vuna_dCompiler_dCommon_dPos) -> ((t_Vuna_dCompiler_dCommon_dPos) -> (bool))
val v_vuna_ushow_uVuna_uCompiler_uCommon_uSpan : (t_Vuna_dCompiler_dCommon_dSpan) -> (string)
val v_vuna_ueq_uVuna_uCompiler_uCommon_uSpan : (t_Vuna_dCompiler_dCommon_dSpan) -> ((t_Vuna_dCompiler_dCommon_dSpan) -> (bool))
val v_vuna_uneq_uVuna_uCompiler_uCommon_uSpan : (t_Vuna_dCompiler_dCommon_dSpan) -> ((t_Vuna_dCompiler_dCommon_dSpan) -> (bool))
val show_Vuna_dCompiler_dCommon_dPos : t_Vuna_dCompiler_dCommon_dPos -> string
val show_Vuna_dCompiler_dCommon_dSpan : t_Vuna_dCompiler_dCommon_dSpan -> string
