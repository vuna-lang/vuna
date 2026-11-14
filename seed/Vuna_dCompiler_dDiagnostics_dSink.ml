open Vuna_runtime
# 16 "Vuna/Compiler/Diagnostics/Sink.vuna"
let rec v_Vuna_dCompiler_dDiagnostics_dSink_dcontainsDiag = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__0, dtb__1) -> (if ((Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dsameDiag mc0) dtb__0) then true else ((v_Vuna_dCompiler_dDiagnostics_dSink_dcontainsDiag mc0) dtb__1))
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 21 "Vuna/Compiler/Diagnostics/Sink.vuna"
let v_Vuna_dCompiler_dDiagnostics_dSink_ddedupeWarnings = (fun ds -> (Base_dList.v_Base_dList_dreverse (((Base_dList.v_Base_dList_dfoldl (fun acc d -> (if ((v_Vuna_dCompiler_dDiagnostics_dSink_dcontainsDiag d) acc) then acc else (Base_dList.C_Base_dList_dList_Cons (d, acc))))) Base_dList.C_Base_dList_dList_Nil) ds)))
