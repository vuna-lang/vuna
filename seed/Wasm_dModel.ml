open Vuna_runtime
type t_Target = C_Target_TargetOcaml | C_Target_TargetWasm
and t_WasmErr = C_WasmErr_WasmUnsupported of (string) | C_WasmErr_WasmInternal of (string)
and t_WatValTy = C_WatValTy_WvI32 | C_WatValTy_WvI8 | C_WatValTy_WvI64 | C_WatValTy_WvF64 | C_WatValTy_WvAnyRef | C_WatValTy_WvI31Ref | C_WatValTy_WvRef of (string) | C_WatValTy_WvRefNull of (string)
and t_WatField = { f_WatField_watFieldMut : bool; f_WatField_watFieldTy : t_WatValTy }
and t_WatType = C_WatType_WatFuncType of (string) * (t_WatValTy B_dData_dList.t_List) * (t_WatValTy B_dData_dList.t_List) | C_WatType_WatStructType of (string) * (t_WatField B_dData_dList.t_List) | C_WatType_WatArrayType of (string) * (bool) * (t_WatValTy) | C_WatType_WatContType of (string) * (string)
and t_WatImport = { f_WatImport_watImportModule : string; f_WatImport_watImportName : string; f_WatImport_watImportFunc : string; f_WatImport_watImportParams : t_WatValTy B_dData_dList.t_List; f_WatImport_watImportResults : t_WatValTy B_dData_dList.t_List }
and t_WatTag = { f_WatTag_watTagName : string; f_WatTag_watTagParams : t_WatValTy B_dData_dList.t_List; f_WatTag_watTagResults : t_WatValTy B_dData_dList.t_List }
and t_WatFunc = { f_WatFunc_watFuncName : string; f_WatFunc_watFuncType : string; f_WatFunc_watFuncParams : (string, t_WatValTy) B_dData_dPair.t_Pair B_dData_dList.t_List; f_WatFunc_watFuncResults : t_WatValTy B_dData_dList.t_List; f_WatFunc_watFuncLocals : (string, t_WatValTy) B_dData_dPair.t_Pair B_dData_dList.t_List; f_WatFunc_watFuncBody : Wasm_dInstr.t_Instr B_dData_dList.t_List }
and t_WatGlobal = { f_WatGlobal_watGlobalName : string; f_WatGlobal_watGlobalTy : t_WatValTy; f_WatGlobal_watGlobalInit : Wasm_dInstr.t_Instr B_dData_dList.t_List }
and t_WatExport = { f_WatExport_watExportKind : string; f_WatExport_watExportName : string; f_WatExport_watExportRef : string }
and t_WatData = { f_WatData_watDataName : string; f_WatData_watDataBytes : string }
and t_WasmModule = { f_WasmModule_wmTypes : t_WatType B_dData_dList.t_List; f_WasmModule_wmTags : t_WatTag B_dData_dList.t_List; f_WasmModule_wmImports : t_WatImport B_dData_dList.t_List; f_WasmModule_wmGlobals : t_WatGlobal B_dData_dList.t_List; f_WasmModule_wmFuncs : t_WatFunc B_dData_dList.t_List; f_WasmModule_wmElems : string B_dData_dList.t_List; f_WasmModule_wmData : t_WatData B_dData_dMaybe.t_Maybe; f_WasmModule_wmExports : t_WatExport B_dData_dList.t_List; f_WasmModule_wmMemPages : int }

# 23 "Vuna/Compiler/Wasm/Model.vuna"
let v_targetText = (fun (mc0 : t_Target) -> (match mc0 with
  | C_Target_TargetWasm -> "wasm"
  | C_Target_TargetOcaml -> "ocaml"
  | _ -> failwith "DT: impossible branch"
))

# 32 "Vuna/Compiler/Wasm/Model.vuna"
let v_wasmErrText = (fun (mc0 : t_WasmErr) -> (match mc0 with
  | C_WasmErr_WasmInternal (dtb__0) -> ("internal wasm backend error: " ^ dtb__0)
  | C_WasmErr_WasmUnsupported (dtb__1) -> dtb__1
  | _ -> failwith "DT: impossible branch"
))

# 51 "Vuna/Compiler/Wasm/Model.vuna"
let v_watValTyText = (fun (mc0 : t_WatValTy) -> (match mc0 with
  | C_WatValTy_WvRefNull (dtb__2) -> (String.concat "" ["(ref null "; dtb__2; ")"])
  | C_WatValTy_WvRef (dtb__3) -> (String.concat "" ["(ref "; dtb__3; ")"])
  | C_WatValTy_WvI31Ref -> "i31ref"
  | C_WatValTy_WvAnyRef -> "anyref"
  | C_WatValTy_WvF64 -> "f64"
  | C_WatValTy_WvI64 -> "i64"
  | C_WatValTy_WvI8 -> "i8"
  | C_WatValTy_WvI32 -> "i32"
  | _ -> failwith "DT: impossible branch"
))
