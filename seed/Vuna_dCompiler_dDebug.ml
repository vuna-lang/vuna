open Vuna_runtime
let v_Vuna_dCompiler_dDebug_dargs = (Base_dIO_dHost.v_Base_dIO_dHost_drunIO (fun (_ : int) -> (Base_dList.dtp_listOf (dtp_getArgs ()))))

let v_Vuna_dCompiler_dDebug_ddebugOn = (if ((Base_dList.v_Base_dList_dmemName "--debug-perf") v_Vuna_dCompiler_dDebug_dargs) then true else ((Base_dIO_dHost.v_Base_dIO_dHost_drunIO ((fun dtio_0 -> fun (_ : int) -> dtp_getenv dtio_0) "VUNA_DEBUG_PERF")) = "1"))

let v_Vuna_dCompiler_dDebug_dreleaseOn = (if ((Base_dList.v_Base_dList_dmemName "--release") v_Vuna_dCompiler_dDebug_dargs) then true else ((Base_dIO_dHost.v_Base_dIO_dHost_drunIO ((fun dtio_0 -> fun (_ : int) -> dtp_getenv dtio_0) "VUNA_RELEASE")) = "1"))

let v_Vuna_dCompiler_dDebug_dnote = (fun msg -> (if v_Vuna_dCompiler_dDebug_ddebugOn then ((fun _u -> 0) (Base_dIO_dHost.v_Base_dIO_dHost_drunIO ((fun dtio_0 -> fun (_ : int) -> dtp_print dtio_0) (String.concat "" ["DEBUG "; msg; "\n"])))) else 0))

let v_Vuna_dCompiler_dDebug_dnoteInt = (fun label n -> (v_Vuna_dCompiler_dDebug_dnote (String.concat "" [label; "="; (bi_strFromInt n)])))

let v_Vuna_dCompiler_dDebug_dstampNow = (fun label -> ((fun _u -> 0) (Base_dIO_dHost.v_Base_dIO_dHost_drunIO ((fun dtio_0 -> fun (_ : int) -> dtp_print dtio_0) (String.concat "" ["PERF "; label; " "; (bi_strFromInt (Base_dIO_dHost.v_Base_dIO_dHost_drunIO (fun (_ : int) -> (dtp_timeUs ())))); "\n"])))))

let v_Vuna_dCompiler_dDebug_dstamp = (fun label -> (if v_Vuna_dCompiler_dDebug_ddebugOn then (v_Vuna_dCompiler_dDebug_dstampNow label) else 0))

let v_Vuna_dCompiler_dDebug_dsampleKey = (fun name -> ((fun h -> ((h - ((if 64 = 0 then failwith "division by zero" else h / 64) * 64)) = 0)) (Base_dHashable.v_Base_dHashable_dhashStr name)))

let v_Vuna_dCompiler_dDebug_dstampSample = (fun key label -> (if (v_Vuna_dCompiler_dDebug_dsampleKey key) then (v_Vuna_dCompiler_dDebug_dstamp label) else 0))
