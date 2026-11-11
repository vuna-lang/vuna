open Vuna_runtime
type t_Vuna_dCompiler_dDiagnostics_dSink_dWarnBox = { f_Vuna_dCompiler_dDiagnostics_dSink_dWarnBox_warnBoxItems : Vuna_dCompiler_dDiag.t_Vuna_dCompiler_dDiag_dDiagnostic Base_dList.t_Base_dList_dList; f_Vuna_dCompiler_dDiagnostics_dSink_dWarnBox_warnBoxTag : int }
and t_Vuna_dCompiler_dDiagnostics_dSink_dUsedImportsBox = { f_Vuna_dCompiler_dDiagnostics_dSink_dUsedImportsBox_usedImportNames : string Base_dList.t_Base_dList_dList; f_Vuna_dCompiler_dDiagnostics_dSink_dUsedImportsBox_usedImportTag : int }
and t_Vuna_dCompiler_dDiagnostics_dSink_dParseErrorsBox = { f_Vuna_dCompiler_dDiagnostics_dSink_dParseErrorsBox_parseErrors : Vuna_dCompiler_dDiag.t_Vuna_dCompiler_dDiag_dDiagnostic Base_dList.t_Base_dList_dList; f_Vuna_dCompiler_dDiagnostics_dSink_dParseErrorsBox_parseErrorsTag : int }

let v_Vuna_dCompiler_dDiagnostics_dSink_dwarningsRef = (Base_dEff.v_Base_dEff_drunPure (Base_dIORef.v_Base_dIORef_dnewRef { f_Vuna_dCompiler_dDiagnostics_dSink_dWarnBox_warnBoxItems = Base_dList.C_Base_dList_dList_Nil; f_Vuna_dCompiler_dDiagnostics_dSink_dWarnBox_warnBoxTag = 0 }))

let v_Vuna_dCompiler_dDiagnostics_dSink_demitWarning = (fun d -> (Base_dEff.v_Base_dEff_drunPure ((Base_dIORef.v_Base_dIORef_dmodifyRef v_Vuna_dCompiler_dDiagnostics_dSink_dwarningsRef) (fun b -> { f_Vuna_dCompiler_dDiagnostics_dSink_dWarnBox_warnBoxItems = ((Base_dList.v_Base_dList_dappend (b).f_Vuna_dCompiler_dDiagnostics_dSink_dWarnBox_warnBoxItems) (Base_dList.C_Base_dList_dList_Cons (d, Base_dList.C_Base_dList_dList_Nil))); f_Vuna_dCompiler_dDiagnostics_dSink_dWarnBox_warnBoxTag = 0 }))))

let rec v_Vuna_dCompiler_dDiagnostics_dSink_dcontainsDiag = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__0, dtb__1) -> (if ((Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dsameDiag mc0) dtb__0) then true else ((v_Vuna_dCompiler_dDiagnostics_dSink_dcontainsDiag mc0) dtb__1))
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDiagnostics_dSink_ddedupeWarnings = (fun ds -> (Base_dList.v_Base_dList_dreverse (((Base_dList.v_Base_dList_dfoldl (fun acc d -> (if ((v_Vuna_dCompiler_dDiagnostics_dSink_dcontainsDiag d) acc) then acc else (Base_dList.C_Base_dList_dList_Cons (d, acc))))) Base_dList.C_Base_dList_dList_Nil) ds)))

let v_Vuna_dCompiler_dDiagnostics_dSink_dtakeWarnings = (fun _u -> ((fun b -> ((fun _u -> (v_Vuna_dCompiler_dDiagnostics_dSink_ddedupeWarnings (b).f_Vuna_dCompiler_dDiagnostics_dSink_dWarnBox_warnBoxItems)) (Base_dEff.v_Base_dEff_drunPure ((Base_dIORef.v_Base_dIORef_dwriteRef v_Vuna_dCompiler_dDiagnostics_dSink_dwarningsRef) { f_Vuna_dCompiler_dDiagnostics_dSink_dWarnBox_warnBoxItems = Base_dList.C_Base_dList_dList_Nil; f_Vuna_dCompiler_dDiagnostics_dSink_dWarnBox_warnBoxTag = 0 })))) (Base_dEff.v_Base_dEff_drunPure (Base_dIORef.v_Base_dIORef_dreadRef v_Vuna_dCompiler_dDiagnostics_dSink_dwarningsRef))))

let v_Vuna_dCompiler_dDiagnostics_dSink_dusedImportsRef = (Base_dEff.v_Base_dEff_drunPure (Base_dIORef.v_Base_dIORef_dnewRef { f_Vuna_dCompiler_dDiagnostics_dSink_dUsedImportsBox_usedImportNames = Base_dList.C_Base_dList_dList_Nil; f_Vuna_dCompiler_dDiagnostics_dSink_dUsedImportsBox_usedImportTag = 0 }))

let rec v_Vuna_dCompiler_dDiagnostics_dSink_dmemUsedImport = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__2, dtb__3) -> (if (mc0 = dtb__2) then true else ((v_Vuna_dCompiler_dDiagnostics_dSink_dmemUsedImport mc0) dtb__3))
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDiagnostics_dSink_dmarkImportUsed = (fun name -> (Base_dEff.v_Base_dEff_drunPure ((Base_dIORef.v_Base_dIORef_dmodifyRef v_Vuna_dCompiler_dDiagnostics_dSink_dusedImportsRef) (fun b -> (if ((v_Vuna_dCompiler_dDiagnostics_dSink_dmemUsedImport name) (b).f_Vuna_dCompiler_dDiagnostics_dSink_dUsedImportsBox_usedImportNames) then b else { f_Vuna_dCompiler_dDiagnostics_dSink_dUsedImportsBox_usedImportNames = ((Base_dList.v_Base_dList_dappend (b).f_Vuna_dCompiler_dDiagnostics_dSink_dUsedImportsBox_usedImportNames) (Base_dList.C_Base_dList_dList_Cons (name, Base_dList.C_Base_dList_dList_Nil))); f_Vuna_dCompiler_dDiagnostics_dSink_dUsedImportsBox_usedImportTag = 0 })))))

let v_Vuna_dCompiler_dDiagnostics_dSink_dtakeUsedImports = (fun _u -> ((fun b -> (b).f_Vuna_dCompiler_dDiagnostics_dSink_dUsedImportsBox_usedImportNames) (Base_dEff.v_Base_dEff_drunPure (Base_dIORef.v_Base_dIORef_dreadRef v_Vuna_dCompiler_dDiagnostics_dSink_dusedImportsRef))))

let v_Vuna_dCompiler_dDiagnostics_dSink_dresetUsedImports = (fun _u -> (Base_dEff.v_Base_dEff_drunPure ((Base_dIORef.v_Base_dIORef_dwriteRef v_Vuna_dCompiler_dDiagnostics_dSink_dusedImportsRef) { f_Vuna_dCompiler_dDiagnostics_dSink_dUsedImportsBox_usedImportNames = Base_dList.C_Base_dList_dList_Nil; f_Vuna_dCompiler_dDiagnostics_dSink_dUsedImportsBox_usedImportTag = 0 })))

let v_Vuna_dCompiler_dDiagnostics_dSink_dparseErrorsRef = (Base_dEff.v_Base_dEff_drunPure (Base_dIORef.v_Base_dIORef_dnewRef { f_Vuna_dCompiler_dDiagnostics_dSink_dParseErrorsBox_parseErrors = Base_dList.C_Base_dList_dList_Nil; f_Vuna_dCompiler_dDiagnostics_dSink_dParseErrorsBox_parseErrorsTag = 0 }))

let v_Vuna_dCompiler_dDiagnostics_dSink_dresetWarnings = (fun _u -> ((fun _u -> ((fun _u -> ((fun _u -> 0) (Base_dEff.v_Base_dEff_drunPure ((Base_dIORef.v_Base_dIORef_dwriteRef v_Vuna_dCompiler_dDiagnostics_dSink_dparseErrorsRef) { f_Vuna_dCompiler_dDiagnostics_dSink_dParseErrorsBox_parseErrors = Base_dList.C_Base_dList_dList_Nil; f_Vuna_dCompiler_dDiagnostics_dSink_dParseErrorsBox_parseErrorsTag = 0 })))) (Base_dEff.v_Base_dEff_drunPure ((Base_dIORef.v_Base_dIORef_dwriteRef v_Vuna_dCompiler_dDiagnostics_dSink_dusedImportsRef) { f_Vuna_dCompiler_dDiagnostics_dSink_dUsedImportsBox_usedImportNames = Base_dList.C_Base_dList_dList_Nil; f_Vuna_dCompiler_dDiagnostics_dSink_dUsedImportsBox_usedImportTag = 0 })))) (Base_dEff.v_Base_dEff_drunPure ((Base_dIORef.v_Base_dIORef_dwriteRef v_Vuna_dCompiler_dDiagnostics_dSink_dwarningsRef) { f_Vuna_dCompiler_dDiagnostics_dSink_dWarnBox_warnBoxItems = Base_dList.C_Base_dList_dList_Nil; f_Vuna_dCompiler_dDiagnostics_dSink_dWarnBox_warnBoxTag = 0 }))))

let v_Vuna_dCompiler_dDiagnostics_dSink_demitParseError = (fun d -> (Base_dEff.v_Base_dEff_drunPure ((Base_dIORef.v_Base_dIORef_dmodifyRef v_Vuna_dCompiler_dDiagnostics_dSink_dparseErrorsRef) (fun b -> { f_Vuna_dCompiler_dDiagnostics_dSink_dParseErrorsBox_parseErrors = ((Base_dList.v_Base_dList_dappend (b).f_Vuna_dCompiler_dDiagnostics_dSink_dParseErrorsBox_parseErrors) (Base_dList.C_Base_dList_dList_Cons (d, Base_dList.C_Base_dList_dList_Nil))); f_Vuna_dCompiler_dDiagnostics_dSink_dParseErrorsBox_parseErrorsTag = 0 }))))

let v_Vuna_dCompiler_dDiagnostics_dSink_dtakeParseErrors = (fun _u -> ((fun b -> ((fun _u -> (b).f_Vuna_dCompiler_dDiagnostics_dSink_dParseErrorsBox_parseErrors) (Base_dEff.v_Base_dEff_drunPure ((Base_dIORef.v_Base_dIORef_dwriteRef v_Vuna_dCompiler_dDiagnostics_dSink_dparseErrorsRef) { f_Vuna_dCompiler_dDiagnostics_dSink_dParseErrorsBox_parseErrors = Base_dList.C_Base_dList_dList_Nil; f_Vuna_dCompiler_dDiagnostics_dSink_dParseErrorsBox_parseErrorsTag = 0 })))) (Base_dEff.v_Base_dEff_drunPure (Base_dIORef.v_Base_dIORef_dreadRef v_Vuna_dCompiler_dDiagnostics_dSink_dparseErrorsRef))))

let v_Vuna_dCompiler_dDiagnostics_dSink_dpeekParseErrors = (fun _u -> ((fun b -> (b).f_Vuna_dCompiler_dDiagnostics_dSink_dParseErrorsBox_parseErrors) (Base_dEff.v_Base_dEff_drunPure (Base_dIORef.v_Base_dIORef_dreadRef v_Vuna_dCompiler_dDiagnostics_dSink_dparseErrorsRef))))

let v_Vuna_dCompiler_dDiagnostics_dSink_dresetParseErrors = (fun _u -> (Base_dEff.v_Base_dEff_drunPure ((Base_dIORef.v_Base_dIORef_dwriteRef v_Vuna_dCompiler_dDiagnostics_dSink_dparseErrorsRef) { f_Vuna_dCompiler_dDiagnostics_dSink_dParseErrorsBox_parseErrors = Base_dList.C_Base_dList_dList_Nil; f_Vuna_dCompiler_dDiagnostics_dSink_dParseErrorsBox_parseErrorsTag = 0 })))
