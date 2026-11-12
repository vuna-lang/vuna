open Vuna_runtime
let v_Vuna_dCompiler_dDebug_dargs = (Base_dEff.v_Base_dEff_drunPure (Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> (Base_dList.dtp_listOf (dtp_getArgs ())))))

let v_Vuna_dCompiler_dDebug_dperfEnabled = (if ((Base_dList.v_Base_dList_dmemName "--debug-perf") v_Vuna_dCompiler_dDebug_dargs) then true else ((Base_dEff.v_Base_dEff_drunPure ((fun dtio_0 -> Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> dtp_getenv dtio_0)) "VUNA_DEBUG_PERF")) = "1"))

let v_Vuna_dCompiler_dDebug_dreleaseBuild = (if ((Base_dList.v_Base_dList_dmemName "--release") v_Vuna_dCompiler_dDebug_dargs) then true else ((Base_dEff.v_Base_dEff_drunPure ((fun dtio_0 -> Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> dtp_getenv dtio_0)) "VUNA_RELEASE")) = "1"))

let v_Vuna_dCompiler_dDebug_dunit = Base_dUnit.C_Base_dUnit_dUnit_MkUnit

let v_Vuna_dCompiler_dDebug_demit = (fun kind payload -> ((fun _u -> v_Vuna_dCompiler_dDebug_dunit) (Base_dEff.v_Base_dEff_drunPure ((fun dtio_0 -> Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> dtp_print dtio_0)) (String.concat "" [kind; " "; payload; "\n"])))))

let v_Vuna_dCompiler_dDebug_ddebugLine = (fun text -> ((v_Vuna_dCompiler_dDebug_demit "DEBUG") text))

let v_Vuna_dCompiler_dDebug_dperfMark = (fun label -> ((v_Vuna_dCompiler_dDebug_demit "PERF") (String.concat "" [label; " "; (bi_strFromInt (Base_dEff.v_Base_dEff_drunPure (Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> (dtp_timeUs ())))))])))

let v_Vuna_dCompiler_dDebug_dsampled = (fun key -> ((fun h -> ((h - ((if 64 = 0 then failwith "division by zero" else h / 64) * 64)) = 0)) (Base_dHashable.v_Base_dHashable_dhashStr key)))
