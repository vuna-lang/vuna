open Vuna_runtime
type t_Vuna_dCompiler_dWasm_dModel_dTarget = C_Vuna_dCompiler_dWasm_dModel_dTarget_TargetOcaml | C_Vuna_dCompiler_dWasm_dModel_dTarget_TargetWasm
and t_Vuna_dCompiler_dWasm_dModel_dWasmErr = C_Vuna_dCompiler_dWasm_dModel_dWasmErr_WasmUnsupported of (string) | C_Vuna_dCompiler_dWasm_dModel_dWasmErr_WasmInternal of (string)
and t_Vuna_dCompiler_dWasm_dModel_dWatValTy = C_Vuna_dCompiler_dWasm_dModel_dWatValTy_WvI32 | C_Vuna_dCompiler_dWasm_dModel_dWatValTy_WvI8 | C_Vuna_dCompiler_dWasm_dModel_dWatValTy_WvI64 | C_Vuna_dCompiler_dWasm_dModel_dWatValTy_WvF64 | C_Vuna_dCompiler_dWasm_dModel_dWatValTy_WvAnyRef | C_Vuna_dCompiler_dWasm_dModel_dWatValTy_WvI31Ref | C_Vuna_dCompiler_dWasm_dModel_dWatValTy_WvRef of (string) | C_Vuna_dCompiler_dWasm_dModel_dWatValTy_WvRefNull of (string)
and t_Vuna_dCompiler_dWasm_dModel_dWatField = { f_Vuna_dCompiler_dWasm_dModel_dWatField_watFieldMut : bool; f_Vuna_dCompiler_dWasm_dModel_dWatField_watFieldTy : t_Vuna_dCompiler_dWasm_dModel_dWatValTy }
and t_Vuna_dCompiler_dWasm_dModel_dWatType = C_Vuna_dCompiler_dWasm_dModel_dWatType_WatFuncType of (string) * (t_Vuna_dCompiler_dWasm_dModel_dWatValTy Base_dList.t_Base_dList_dList) * (t_Vuna_dCompiler_dWasm_dModel_dWatValTy Base_dList.t_Base_dList_dList) | C_Vuna_dCompiler_dWasm_dModel_dWatType_WatStructType of (string) * (t_Vuna_dCompiler_dWasm_dModel_dWatField Base_dList.t_Base_dList_dList) | C_Vuna_dCompiler_dWasm_dModel_dWatType_WatArrayType of (string) * (bool) * (t_Vuna_dCompiler_dWasm_dModel_dWatValTy)
and t_Vuna_dCompiler_dWasm_dModel_dWatImport = { f_Vuna_dCompiler_dWasm_dModel_dWatImport_watImportModule : string; f_Vuna_dCompiler_dWasm_dModel_dWatImport_watImportName : string; f_Vuna_dCompiler_dWasm_dModel_dWatImport_watImportFunc : string; f_Vuna_dCompiler_dWasm_dModel_dWatImport_watImportParams : t_Vuna_dCompiler_dWasm_dModel_dWatValTy Base_dList.t_Base_dList_dList; f_Vuna_dCompiler_dWasm_dModel_dWatImport_watImportResults : t_Vuna_dCompiler_dWasm_dModel_dWatValTy Base_dList.t_Base_dList_dList }
and t_Vuna_dCompiler_dWasm_dModel_dWatFunc = { f_Vuna_dCompiler_dWasm_dModel_dWatFunc_watFuncName : string; f_Vuna_dCompiler_dWasm_dModel_dWatFunc_watFuncType : string; f_Vuna_dCompiler_dWasm_dModel_dWatFunc_watFuncParams : (string, t_Vuna_dCompiler_dWasm_dModel_dWatValTy) Base_dPair.t_Base_dPair_dPair Base_dList.t_Base_dList_dList; f_Vuna_dCompiler_dWasm_dModel_dWatFunc_watFuncResults : t_Vuna_dCompiler_dWasm_dModel_dWatValTy Base_dList.t_Base_dList_dList; f_Vuna_dCompiler_dWasm_dModel_dWatFunc_watFuncLocals : (string, t_Vuna_dCompiler_dWasm_dModel_dWatValTy) Base_dPair.t_Base_dPair_dPair Base_dList.t_Base_dList_dList; f_Vuna_dCompiler_dWasm_dModel_dWatFunc_watFuncBody : Vuna_dCompiler_dWasm_dInstr.t_Vuna_dCompiler_dWasm_dInstr_dInstr Base_dList.t_Base_dList_dList }
and t_Vuna_dCompiler_dWasm_dModel_dWatGlobal = { f_Vuna_dCompiler_dWasm_dModel_dWatGlobal_watGlobalName : string; f_Vuna_dCompiler_dWasm_dModel_dWatGlobal_watGlobalTy : t_Vuna_dCompiler_dWasm_dModel_dWatValTy; f_Vuna_dCompiler_dWasm_dModel_dWatGlobal_watGlobalInit : Vuna_dCompiler_dWasm_dInstr.t_Vuna_dCompiler_dWasm_dInstr_dInstr Base_dList.t_Base_dList_dList }
and t_Vuna_dCompiler_dWasm_dModel_dWatExport = { f_Vuna_dCompiler_dWasm_dModel_dWatExport_watExportKind : string; f_Vuna_dCompiler_dWasm_dModel_dWatExport_watExportName : string; f_Vuna_dCompiler_dWasm_dModel_dWatExport_watExportRef : string }
and t_Vuna_dCompiler_dWasm_dModel_dWatData = { f_Vuna_dCompiler_dWasm_dModel_dWatData_watDataName : string; f_Vuna_dCompiler_dWasm_dModel_dWatData_watDataBytes : string }
and t_Vuna_dCompiler_dWasm_dModel_dWasmModule = { f_Vuna_dCompiler_dWasm_dModel_dWasmModule_wmTypes : t_Vuna_dCompiler_dWasm_dModel_dWatType Base_dList.t_Base_dList_dList; f_Vuna_dCompiler_dWasm_dModel_dWasmModule_wmImports : t_Vuna_dCompiler_dWasm_dModel_dWatImport Base_dList.t_Base_dList_dList; f_Vuna_dCompiler_dWasm_dModel_dWasmModule_wmGlobals : t_Vuna_dCompiler_dWasm_dModel_dWatGlobal Base_dList.t_Base_dList_dList; f_Vuna_dCompiler_dWasm_dModel_dWasmModule_wmFuncs : t_Vuna_dCompiler_dWasm_dModel_dWatFunc Base_dList.t_Base_dList_dList; f_Vuna_dCompiler_dWasm_dModel_dWasmModule_wmElems : string Base_dList.t_Base_dList_dList; f_Vuna_dCompiler_dWasm_dModel_dWasmModule_wmData : t_Vuna_dCompiler_dWasm_dModel_dWatData Base_dMaybe.t_Base_dMaybe_dMaybe; f_Vuna_dCompiler_dWasm_dModel_dWasmModule_wmExports : t_Vuna_dCompiler_dWasm_dModel_dWatExport Base_dList.t_Base_dList_dList; f_Vuna_dCompiler_dWasm_dModel_dWasmModule_wmMemPages : int }

# 23 "Vuna/Compiler/Wasm/Model.vuna"
let v_Vuna_dCompiler_dWasm_dModel_dtargetText = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dWasm_dModel_dTarget_TargetWasm -> "wasm"
  | C_Vuna_dCompiler_dWasm_dModel_dTarget_TargetOcaml -> "ocaml"
  | _ -> failwith "DT: impossible branch"
))

# 32 "Vuna/Compiler/Wasm/Model.vuna"
let v_Vuna_dCompiler_dWasm_dModel_dwasmErrText = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dWasm_dModel_dWasmErr_WasmInternal (dtb__0) -> ("internal wasm backend error: " ^ dtb__0)
  | C_Vuna_dCompiler_dWasm_dModel_dWasmErr_WasmUnsupported (dtb__1) -> dtb__1
  | _ -> failwith "DT: impossible branch"
))

# 51 "Vuna/Compiler/Wasm/Model.vuna"
let v_Vuna_dCompiler_dWasm_dModel_dwatValTyText = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dWasm_dModel_dWatValTy_WvRefNull (dtb__2) -> (String.concat "" ["(ref null "; dtb__2; ")"])
  | C_Vuna_dCompiler_dWasm_dModel_dWatValTy_WvRef (dtb__3) -> (String.concat "" ["(ref "; dtb__3; ")"])
  | C_Vuna_dCompiler_dWasm_dModel_dWatValTy_WvI31Ref -> "i31ref"
  | C_Vuna_dCompiler_dWasm_dModel_dWatValTy_WvAnyRef -> "anyref"
  | C_Vuna_dCompiler_dWasm_dModel_dWatValTy_WvF64 -> "f64"
  | C_Vuna_dCompiler_dWasm_dModel_dWatValTy_WvI64 -> "i64"
  | C_Vuna_dCompiler_dWasm_dModel_dWatValTy_WvI8 -> "i8"
  | C_Vuna_dCompiler_dWasm_dModel_dWatValTy_WvI32 -> "i32"
  | _ -> failwith "DT: impossible branch"
))
