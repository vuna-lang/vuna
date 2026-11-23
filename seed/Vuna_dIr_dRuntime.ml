open Vuna_runtime
type t_IrRtSym = { f_IrRtSym_irRtSymName : string; f_IrRtSym_irRtSymBridgesList : bool }

# 40 "Vuna/Ir/Runtime.vuna"
let v_irRtSymNameOf = (fun (mc0 : t_IrRtSym) -> (match mc0 with
  | { f_IrRtSym_irRtSymName = dtb__0; f_IrRtSym_irRtSymBridgesList = dtb__1 } -> dtb__0
  | _ -> failwith "DT: impossible branch"
))

# 44 "Vuna/Ir/Runtime.vuna"
let v_irRtSymBridgesOf = (fun (mc0 : t_IrRtSym) -> (match mc0 with
  | { f_IrRtSym_irRtSymName = dtb__2; f_IrRtSym_irRtSymBridgesList = dtb__3 } -> dtb__3
  | _ -> failwith "DT: impossible branch"
))

# 49 "Vuna/Ir/Runtime.vuna"
let v_irRtNatSucc = "@ir@natSucc"

# 52 "Vuna/Ir/Runtime.vuna"
let v_irRtShowInt = "@ir@showInt"

# 55 "Vuna/Ir/Runtime.vuna"
let v_irRtShowNat = "@ir@showNat"

# 58 "Vuna/Ir/Runtime.vuna"
let v_irRtShowStr = "@ir@showStr"

# 61 "Vuna/Ir/Runtime.vuna"
let v_irRtShowFloat = "@ir@showFloat"

# 64 "Vuna/Ir/Runtime.vuna"
let v_irRtShowBool = "@ir@showBool"

# 68 "Vuna/Ir/Runtime.vuna"
let v_irRtSyntheticNames = (B_dData_dList.C_List__x58__x58_ (v_irRtNatSucc, (B_dData_dList.C_List__x58__x58_ (v_irRtShowInt, (B_dData_dList.C_List__x58__x58_ (v_irRtShowNat, (B_dData_dList.C_List__x58__x58_ (v_irRtShowStr, (B_dData_dList.C_List__x58__x58_ (v_irRtShowFloat, (B_dData_dList.C_List__x58__x58_ (v_irRtShowBool, B_dData_dList.C_List_Nil))))))))))))

# 73 "Vuna/Ir/Runtime.vuna"
let v_irRtPlainNames = (B_dData_dList.C_List__x58__x58_ ("+", (B_dData_dList.C_List__x58__x58_ ("-", (B_dData_dList.C_List__x58__x58_ ("*", (B_dData_dList.C_List__x58__x58_ ("/", (B_dData_dList.C_List__x58__x58_ ("bitAnd", (B_dData_dList.C_List__x58__x58_ ("bitOr", (B_dData_dList.C_List__x58__x58_ ("bitXor", (B_dData_dList.C_List__x58__x58_ ("bitNot", (B_dData_dList.C_List__x58__x58_ ("bitShl", (B_dData_dList.C_List__x58__x58_ ("bitShr", (B_dData_dList.C_List__x58__x58_ ("++", (B_dData_dList.C_List__x58__x58_ ("&&", (B_dData_dList.C_List__x58__x58_ ("||", (B_dData_dList.C_List__x58__x58_ ("strFromInt", (B_dData_dList.C_List__x58__x58_ ("strLength", (B_dData_dList.C_List__x58__x58_ ("strHash", (B_dData_dList.C_List__x58__x58_ ("effectId", (B_dData_dList.C_List__x58__x58_ ("strAt", (B_dData_dList.C_List__x58__x58_ ("strSubstring", (B_dData_dList.C_List__x58__x58_ ("strShow", (B_dData_dList.C_List__x58__x58_ ("prim_erase", (B_dData_dList.C_List__x58__x58_ ("@vuna@prim@toObj", (B_dData_dList.C_List__x58__x58_ ("@vuna@prim@fromObj", (B_dData_dList.C_List__x58__x58_ ("natAdd", (B_dData_dList.C_List__x58__x58_ ("natSub", (B_dData_dList.C_List__x58__x58_ ("natMul", (B_dData_dList.C_List__x58__x58_ ("natDiv", (B_dData_dList.C_List__x58__x58_ ("natToInt", (B_dData_dList.C_List__x58__x58_ ("natFromInt", (B_dData_dList.C_List__x58__x58_ ("arrayLength", (B_dData_dList.C_List__x58__x58_ ("arrayEmpty", (B_dData_dList.C_List__x58__x58_ ("arrayGet", (B_dData_dList.C_List__x58__x58_ ("arraySet", (B_dData_dList.C_List__x58__x58_ ("arrayMake", (B_dData_dList.C_List__x58__x58_ ("prim_effectPerformId", (B_dData_dList.C_List__x58__x58_ ("prim_effectHandleId", (B_dData_dList.C_List__x58__x58_ ("prim_effectSelf", (B_dData_dList.C_List__x58__x58_ ("prim_cleanupPush", (B_dData_dList.C_List__x58__x58_ ("prim_cleanupPop", (B_dData_dList.C_List__x58__x58_ ("prim_schedNewScope", (B_dData_dList.C_List__x58__x58_ ("prim_schedFork", (B_dData_dList.C_List__x58__x58_ ("prim_schedYield", (B_dData_dList.C_List__x58__x58_ ("prim_schedIsCancelled", (B_dData_dList.C_List__x58__x58_ ("prim_schedAwait", (B_dData_dList.C_List__x58__x58_ ("prim_schedTaskResult", (B_dData_dList.C_List__x58__x58_ ("prim_schedTaskError", (B_dData_dList.C_List__x58__x58_ ("prim_schedCancelTask", (B_dData_dList.C_List__x58__x58_ ("prim_schedCancelScope", (B_dData_dList.C_List__x58__x58_ ("prim_schedScopeWait", (B_dData_dList.C_List__x58__x58_ ("prim_schedScopeWaitTimeout", (B_dData_dList.C_List__x58__x58_ ("prim_schedScopeError", (B_dData_dList.C_List__x58__x58_ ("prim_schedScopeCount", (B_dData_dList.C_List__x58__x58_ ("prim_fail", (B_dData_dList.C_List__x58__x58_ ("assert", (B_dData_dList.C_List__x58__x58_ ("todo", (B_dData_dList.C_List__x58__x58_ ("bi_eq_int", (B_dData_dList.C_List__x58__x58_ ("bi_neq_int", (B_dData_dList.C_List__x58__x58_ ("bi_eq_str", (B_dData_dList.C_List__x58__x58_ ("bi_neq_str", (B_dData_dList.C_List__x58__x58_ ("bi_lt_int", (B_dData_dList.C_List__x58__x58_ ("bi_le_int", (B_dData_dList.C_List__x58__x58_ ("bi_gt_int", (B_dData_dList.C_List__x58__x58_ ("bi_ge_int", (B_dData_dList.C_List__x58__x58_ ("bi_lt_str", (B_dData_dList.C_List__x58__x58_ ("bi_le_str", (B_dData_dList.C_List__x58__x58_ ("bi_gt_str", (B_dData_dList.C_List__x58__x58_ ("bi_ge_str", (B_dData_dList.C_List__x58__x58_ ("bi_lt_bool", (B_dData_dList.C_List__x58__x58_ ("bi_le_bool", (B_dData_dList.C_List__x58__x58_ ("bi_gt_bool", (B_dData_dList.C_List__x58__x58_ ("bi_ge_bool", (B_dData_dList.C_List__x58__x58_ ("strFromFloat", (B_dData_dList.C_List__x58__x58_ ("floatFromInt", (B_dData_dList.C_List__x58__x58_ ("intFromFloat", (B_dData_dList.C_List__x58__x58_ ("floatAbs", (B_dData_dList.C_List__x58__x58_ ("floatSqrt", (B_dData_dList.C_List__x58__x58_ ("bi_add_float", (B_dData_dList.C_List__x58__x58_ ("bi_sub_float", (B_dData_dList.C_List__x58__x58_ ("bi_mul_float", (B_dData_dList.C_List__x58__x58_ ("bi_div_float", (B_dData_dList.C_List__x58__x58_ ("bi_eq_float", (B_dData_dList.C_List__x58__x58_ ("bi_neq_float", (B_dData_dList.C_List__x58__x58_ ("bi_lt_float", (B_dData_dList.C_List__x58__x58_ ("bi_le_float", (B_dData_dList.C_List__x58__x58_ ("bi_gt_float", (B_dData_dList.C_List__x58__x58_ ("bi_ge_float", (B_dData_dList.C_List__x58__x58_ ("effTimeUs", (B_dData_dList.C_List__x58__x58_ ("prim_eff_sleep", (B_dData_dList.C_List__x58__x58_ ("@vuna@prim_eff_sleep", (B_dData_dList.C_List__x58__x58_ ("prim_eff_newRef", (B_dData_dList.C_List__x58__x58_ ("@vuna@prim_eff_newRef", (B_dData_dList.C_List__x58__x58_ ("prim_eff_readRef", (B_dData_dList.C_List__x58__x58_ ("@vuna@prim_eff_readRef", (B_dData_dList.C_List__x58__x58_ ("prim_eff_writeRef", (B_dData_dList.C_List__x58__x58_ ("@vuna@prim_eff_writeRef", (B_dData_dList.C_List__x58__x58_ ("prim_eff_print", (B_dData_dList.C_List__x58__x58_ ("@vuna@prim_eff_print", (B_dData_dList.C_List__x58__x58_ ("prim_eff_print_host", (B_dData_dList.C_List__x58__x58_ ("@vuna@prim_eff_print_host", (B_dData_dList.C_List__x58__x58_ ("@vuna@host@print", (B_dData_dList.C_List__x58__x58_ ("prim_eff_eprint", (B_dData_dList.C_List__x58__x58_ ("@vuna@prim_eff_eprint", (B_dData_dList.C_List__x58__x58_ ("prim_eff_readFile", (B_dData_dList.C_List__x58__x58_ ("@vuna@prim_eff_readFile", (B_dData_dList.C_List__x58__x58_ ("prim_eff_readFileRange", (B_dData_dList.C_List__x58__x58_ ("@vuna@prim_eff_readFileRange", (B_dData_dList.C_List__x58__x58_ ("prim_eff_writeFile", (B_dData_dList.C_List__x58__x58_ ("@vuna@prim_eff_writeFile", (B_dData_dList.C_List__x58__x58_ ("prim_eff_writeFileAtomic", (B_dData_dList.C_List__x58__x58_ ("@vuna@prim_eff_writeFileAtomic", (B_dData_dList.C_List__x58__x58_ ("prim_eff_readLine", (B_dData_dList.C_List__x58__x58_ ("@vuna@prim_eff_readLine", (B_dData_dList.C_List__x58__x58_ ("prim_eff_readBytes", (B_dData_dList.C_List__x58__x58_ ("@vuna@prim_eff_readBytes", (B_dData_dList.C_List__x58__x58_ ("prim_eff_isDirectory", (B_dData_dList.C_List__x58__x58_ ("@vuna@prim_eff_isDirectory", (B_dData_dList.C_List__x58__x58_ ("prim_eff_makeDir", (B_dData_dList.C_List__x58__x58_ ("@vuna@prim_eff_makeDir", (B_dData_dList.C_List__x58__x58_ ("prim_eff_removeFile", (B_dData_dList.C_List__x58__x58_ ("@vuna@prim_eff_removeFile", (B_dData_dList.C_List__x58__x58_ ("prim_eff_fileExists", (B_dData_dList.C_List__x58__x58_ ("@vuna@prim_eff_fileExists", (B_dData_dList.C_List__x58__x58_ ("prim_eff_fileMtime", (B_dData_dList.C_List__x58__x58_ ("@vuna@prim_eff_fileMtime", (B_dData_dList.C_List__x58__x58_ ("prim_eff_fileSize", (B_dData_dList.C_List__x58__x58_ ("@vuna@prim_eff_fileSize", (B_dData_dList.C_List__x58__x58_ ("prim_eff_readFile_host", (B_dData_dList.C_List__x58__x58_ ("@vuna@prim_eff_readFile_host", (B_dData_dList.C_List__x58__x58_ ("@vuna@host@readFile", (B_dData_dList.C_List__x58__x58_ ("prim_eff_readFileRange_host", (B_dData_dList.C_List__x58__x58_ ("@vuna@prim_eff_readFileRange_host", (B_dData_dList.C_List__x58__x58_ ("@vuna@host@readFileRange", (B_dData_dList.C_List__x58__x58_ ("prim_eff_writeFile_host", (B_dData_dList.C_List__x58__x58_ ("@vuna@prim_eff_writeFile_host", (B_dData_dList.C_List__x58__x58_ ("@vuna@host@writeFile", (B_dData_dList.C_List__x58__x58_ ("prim_eff_writeFileAtomic_host", (B_dData_dList.C_List__x58__x58_ ("@vuna@prim_eff_writeFileAtomic_host", (B_dData_dList.C_List__x58__x58_ ("@vuna@host@writeFileAtomic", (B_dData_dList.C_List__x58__x58_ ("prim_eff_isDirectory_host", (B_dData_dList.C_List__x58__x58_ ("@vuna@prim_eff_isDirectory_host", (B_dData_dList.C_List__x58__x58_ ("@vuna@host@isDirectory", (B_dData_dList.C_List__x58__x58_ ("prim_eff_makeDir_host", (B_dData_dList.C_List__x58__x58_ ("@vuna@prim_eff_makeDir_host", (B_dData_dList.C_List__x58__x58_ ("@vuna@host@makeDir", (B_dData_dList.C_List__x58__x58_ ("prim_eff_removeFile_host", (B_dData_dList.C_List__x58__x58_ ("@vuna@prim_eff_removeFile_host", (B_dData_dList.C_List__x58__x58_ ("@vuna@host@removeFile", (B_dData_dList.C_List__x58__x58_ ("prim_eff_fileExists_host", (B_dData_dList.C_List__x58__x58_ ("@vuna@prim_eff_fileExists_host", (B_dData_dList.C_List__x58__x58_ ("@vuna@host@fileExists", (B_dData_dList.C_List__x58__x58_ ("prim_eff_fileMtime_host", (B_dData_dList.C_List__x58__x58_ ("@vuna@prim_eff_fileMtime_host", (B_dData_dList.C_List__x58__x58_ ("@vuna@host@fileMtime", (B_dData_dList.C_List__x58__x58_ ("prim_eff_fileSize_host", (B_dData_dList.C_List__x58__x58_ ("@vuna@prim_eff_fileSize_host", (B_dData_dList.C_List__x58__x58_ ("@vuna@host@fileSize", (B_dData_dList.C_List__x58__x58_ ("@vuna@prim_eff_hostStatus", (B_dData_dList.C_List__x58__x58_ ("@vuna@host@tryReadFile", (B_dData_dList.C_List__x58__x58_ ("@vuna@host@tryReadFileRange", (B_dData_dList.C_List__x58__x58_ ("@vuna@host@tryWriteFile", (B_dData_dList.C_List__x58__x58_ ("@vuna@host@tryWriteFileAtomic", (B_dData_dList.C_List__x58__x58_ ("@vuna@host@tryIsDirectory", (B_dData_dList.C_List__x58__x58_ ("@vuna@host@tryMakeDir", (B_dData_dList.C_List__x58__x58_ ("@vuna@host@tryRemoveFile", (B_dData_dList.C_List__x58__x58_ ("@vuna@host@tryRemoveTree", (B_dData_dList.C_List__x58__x58_ ("@vuna@host@tryRename", (B_dData_dList.C_List__x58__x58_ ("@vuna@host@trySymlink", (B_dData_dList.C_List__x58__x58_ ("@vuna@host@tryMakeDirExclusive", (B_dData_dList.C_List__x58__x58_ ("@vuna@host@isTty", (B_dData_dList.C_List__x58__x58_ ("prim_eff_exit", (B_dData_dList.C_List__x58__x58_ ("@vuna@prim_eff_exit", (B_dData_dList.C_List__x58__x58_ ("effTimeUs_host", (B_dData_dList.C_List__x58__x58_ ("prim_eff_sleep_host", (B_dData_dList.C_List__x58__x58_ ("@vuna@prim_eff_sleep_host", (B_dData_dList.C_List__x58__x58_ ("@vuna@host@sleep", (B_dData_dList.C_List__x58__x58_ ("prim_eff_getenv_host", (B_dData_dList.C_List__x58__x58_ ("@vuna@prim_eff_getenv_host", (B_dData_dList.C_List__x58__x58_ ("@vuna@host@getenv", (B_dData_dList.C_List__x58__x58_ ("prim_eff_getcwd_host", (B_dData_dList.C_List__x58__x58_ ("@vuna@prim_eff_getcwd_host", (B_dData_dList.C_List__x58__x58_ ("@vuna@host@getcwd", (B_dData_dList.C_List__x58__x58_ ("prim_eff_execPath_host", (B_dData_dList.C_List__x58__x58_ ("@vuna@prim_eff_execPath_host", (B_dData_dList.C_List__x58__x58_ ("@vuna@host@execPath", (B_dData_dList.C_List__x58__x58_ ("prim_eff_exit_process_host", (B_dData_dList.C_List__x58__x58_ ("@vuna@prim_eff_exit_process_host", (B_dData_dList.C_List__x58__x58_ ("prim_eff_exitOp_host", (B_dData_dList.C_List__x58__x58_ ("@vuna@prim_eff_exitOp_host", (B_dData_dList.C_List__x58__x58_ ("@vuna@host@exitOp", (B_dData_dList.C_List__x58__x58_ ("prim_eff_readLine_host", (B_dData_dList.C_List__x58__x58_ ("@vuna@prim_eff_readLine_host", (B_dData_dList.C_List__x58__x58_ ("@vuna@host@readLine", (B_dData_dList.C_List__x58__x58_ ("prim_eff_readBytes_host", (B_dData_dList.C_List__x58__x58_ ("@vuna@prim_eff_readBytes_host", (B_dData_dList.C_List__x58__x58_ ("@vuna@host@readBytes", (B_dData_dList.C_List__x58__x58_ ("prim_eff_newRef_host", (B_dData_dList.C_List__x58__x58_ ("@vuna@prim_eff_newRef_host", (B_dData_dList.C_List__x58__x58_ ("@vuna@host@newRef", (B_dData_dList.C_List__x58__x58_ ("prim_eff_readRef_host", (B_dData_dList.C_List__x58__x58_ ("@vuna@prim_eff_readRef_host", (B_dData_dList.C_List__x58__x58_ ("@vuna@host@readRef", (B_dData_dList.C_List__x58__x58_ ("prim_eff_writeRef_host", (B_dData_dList.C_List__x58__x58_ ("@vuna@prim_eff_writeRef_host", (B_dData_dList.C_List__x58__x58_ ("@vuna@host@writeRef", (B_dData_dList.C_List__x58__x58_ ("prim_eff_netListen_host", (B_dData_dList.C_List__x58__x58_ ("@vuna@prim_eff_netListen_host", (B_dData_dList.C_List__x58__x58_ ("@vuna@host@netListen", (B_dData_dList.C_List__x58__x58_ ("prim_eff_netPort_host", (B_dData_dList.C_List__x58__x58_ ("@vuna@prim_eff_netPort_host", (B_dData_dList.C_List__x58__x58_ ("@vuna@host@netPort", (B_dData_dList.C_List__x58__x58_ ("prim_eff_netAccept_host", (B_dData_dList.C_List__x58__x58_ ("@vuna@prim_eff_netAccept_host", (B_dData_dList.C_List__x58__x58_ ("@vuna@host@netAccept", (B_dData_dList.C_List__x58__x58_ ("prim_eff_netRecv_host", (B_dData_dList.C_List__x58__x58_ ("@vuna@prim_eff_netRecv_host", (B_dData_dList.C_List__x58__x58_ ("@vuna@host@netRecv", (B_dData_dList.C_List__x58__x58_ ("prim_eff_netSend_host", (B_dData_dList.C_List__x58__x58_ ("@vuna@prim_eff_netSend_host", (B_dData_dList.C_List__x58__x58_ ("@vuna@host@netSend", (B_dData_dList.C_List__x58__x58_ ("prim_eff_netClose_host", (B_dData_dList.C_List__x58__x58_ ("@vuna@prim_eff_netClose_host", (B_dData_dList.C_List__x58__x58_ ("@vuna@host@netClose", (B_dData_dList.C_List__x58__x58_ ("prim_eff_netConnect_host", (B_dData_dList.C_List__x58__x58_ ("@vuna@prim_eff_netConnect_host", (B_dData_dList.C_List__x58__x58_ ("@vuna@host@netConnect", (B_dData_dList.C_List__x58__x58_ ("prim_eff_wait", (B_dData_dList.C_List__x58__x58_ ("@vuna@prim_eff_wait", (B_dData_dList.C_List__x58__x58_ ("prim_eff_netListen", (B_dData_dList.C_List__x58__x58_ ("@vuna@prim_eff_netListen", (B_dData_dList.C_List__x58__x58_ ("prim_eff_netPort", (B_dData_dList.C_List__x58__x58_ ("@vuna@prim_eff_netPort", (B_dData_dList.C_List__x58__x58_ ("prim_eff_netAccept", (B_dData_dList.C_List__x58__x58_ ("@vuna@prim_eff_netAccept", (B_dData_dList.C_List__x58__x58_ ("prim_eff_netRecv", (B_dData_dList.C_List__x58__x58_ ("@vuna@prim_eff_netRecv", (B_dData_dList.C_List__x58__x58_ ("prim_eff_netSend", (B_dData_dList.C_List__x58__x58_ ("@vuna@prim_eff_netSend", (B_dData_dList.C_List__x58__x58_ ("prim_eff_netClose", (B_dData_dList.C_List__x58__x58_ ("@vuna@prim_eff_netClose", (B_dData_dList.C_List__x58__x58_ ("prim_eff_netConnect", (B_dData_dList.C_List__x58__x58_ ("@vuna@prim_eff_netConnect", (B_dData_dList.C_List__x58__x58_ ("@vuna@host@tryNetListen", (B_dData_dList.C_List__x58__x58_ ("@vuna@host@tryNetPort", (B_dData_dList.C_List__x58__x58_ ("@vuna@host@tryNetAccept", (B_dData_dList.C_List__x58__x58_ ("@vuna@host@tryNetRecv", (B_dData_dList.C_List__x58__x58_ ("@vuna@host@tryNetSend", (B_dData_dList.C_List__x58__x58_ ("@vuna@host@tryNetClose", (B_dData_dList.C_List__x58__x58_ ("@vuna@host@tryNetConnect", (B_dData_dList.C_List__x58__x58_ ("@vuna@host@tryNetAcceptWithin", (B_dData_dList.C_List__x58__x58_ ("@vuna@host@tryNetRecvWithin", (B_dData_dList.C_List__x58__x58_ ("@vuna@host@tryNetSendWithin", (B_dData_dList.C_List__x58__x58_ ("prim_eff_getenv", (B_dData_dList.C_List__x58__x58_ ("@vuna@prim_eff_getenv", (B_dData_dList.C_List__x58__x58_ ("prim_eff_getcwd", (B_dData_dList.C_List__x58__x58_ ("@vuna@prim_eff_getcwd", (B_dData_dList.C_List__x58__x58_ ("prim_eff_execPath", (B_dData_dList.C_List__x58__x58_ ("@vuna@prim_eff_execPath", (B_dData_dList.C_List__x58__x58_ ("@vuna@debug@on", (B_dData_dList.C_List__x58__x58_ ("@vuna@debug@line", (B_dData_dList.C_List__x58__x58_ ("@vuna@log@on", (B_dData_dList.C_List__x58__x58_ ("@vuna@log@emit", (B_dData_dList.C_List__x58__x58_ ("@vuna@obs@level", (B_dData_dList.C_List__x58__x58_ ("@vuna@obs@span", (B_dData_dList.C_List__x58__x58_ ("@vuna@obs@log", (B_dData_dList.C_List__x58__x58_ ("@vuna@obs@counter", (B_dData_dList.C_List__x58__x58_ ("@vuna@obs@mark", (B_dData_dList.C_List__x58__x58_ ("@vuna@obs@spanBegin", (B_dData_dList.C_List__x58__x58_ ("@vuna@obs@spanEnd", (B_dData_dList.C_List__x58__x58_ ("@vuna@obs@sampleStart", (B_dData_dList.C_List__x58__x58_ ("@vuna@obs@sampleStop", (B_dData_dList.C_List__x58__x58_ ("@vuna@obs@spanLab", B_dData_dList.C_List_Nil))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))

# 350 "Vuna/Ir/Runtime.vuna"
let v_irRtBridgedNames = (B_dData_dList.C_List__x58__x58_ ("strUnpack", (B_dData_dList.C_List__x58__x58_ ("strPack", (B_dData_dList.C_List__x58__x58_ ("strConcatMany", (B_dData_dList.C_List__x58__x58_ ("strSubstTemplate", (B_dData_dList.C_List__x58__x58_ ("arrayFromList", (B_dData_dList.C_List__x58__x58_ ("arrayToList", (B_dData_dList.C_List__x58__x58_ ("prim_eff_getArgs", (B_dData_dList.C_List__x58__x58_ ("@vuna@prim_eff_getArgs", (B_dData_dList.C_List__x58__x58_ ("prim_eff_readDir", (B_dData_dList.C_List__x58__x58_ ("@vuna@prim_eff_readDir", (B_dData_dList.C_List__x58__x58_ ("prim_eff_readDir_host", (B_dData_dList.C_List__x58__x58_ ("@vuna@prim_eff_readDir_host", (B_dData_dList.C_List__x58__x58_ ("@vuna@host@readDir", (B_dData_dList.C_List__x58__x58_ ("@vuna@host@tryReadDir", (B_dData_dList.C_List__x58__x58_ ("@vuna@host@tryRunIn", (B_dData_dList.C_List__x58__x58_ ("prim_eff_runIn", (B_dData_dList.C_List__x58__x58_ ("@vuna@prim_eff_runIn", (B_dData_dList.C_List__x58__x58_ ("prim_eff_getArgs_process_host", (B_dData_dList.C_List__x58__x58_ ("@vuna@prim_eff_getArgs_process_host", (B_dData_dList.C_List__x58__x58_ ("prim_eff_runIn_host", (B_dData_dList.C_List__x58__x58_ ("@vuna@prim_eff_runIn_host", (B_dData_dList.C_List__x58__x58_ ("@vuna@host@runIn", (B_dData_dList.C_List__x58__x58_ ("prim_eff_getArgs_host", (B_dData_dList.C_List__x58__x58_ ("@vuna@prim_eff_getArgs_host", (B_dData_dList.C_List__x58__x58_ ("@vuna@host@getArgs", (B_dData_dList.C_List__x58__x58_ ("prim_eff_spawn", (B_dData_dList.C_List__x58__x58_ ("@vuna@prim_eff_spawn", B_dData_dList.C_List_Nil))))))))))))))))))))))))))))))))))))))))))))))))))))))

# 383 "Vuna/Ir/Runtime.vuna"
let v_irRtNames = ((B_dData_dList.v_append v_irRtPlainNames) ((B_dData_dList.v_append v_irRtBridgedNames) v_irRtSyntheticNames))

# 387 "Vuna/Ir/Runtime.vuna"
let v_irRtContract = ((B_dData_dList.v_append ((B_dData_dList.v_map (fun (n : string) -> { f_IrRtSym_irRtSymName = n; f_IrRtSym_irRtSymBridgesList = false })) v_irRtPlainNames)) ((B_dData_dList.v_append ((B_dData_dList.v_map (fun (n : string) -> { f_IrRtSym_irRtSymName = n; f_IrRtSym_irRtSymBridgesList = true })) v_irRtBridgedNames)) ((B_dData_dList.v_map (fun (n : string) -> { f_IrRtSym_irRtSymName = n; f_IrRtSym_irRtSymBridgesList = false })) v_irRtSyntheticNames)))

# 393 "Vuna/Ir/Runtime.vuna"
let rec v_irRtLookupGo = (fun (mc0 : string) (mc1 : t_IrRtSym B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__4, dtb__5) -> (if ((v_irRtSymNameOf dtb__4) = mc0) then (B_dData_dMaybe.C_Maybe_Just (dtb__4)) else ((v_irRtLookupGo mc0) dtb__5))
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 398 "Vuna/Ir/Runtime.vuna"
let v_irRtLookup = (fun (name : string) -> ((v_irRtLookupGo name) v_irRtContract))

# 402 "Vuna/Ir/Runtime.vuna"
let v_irRtIsKnown = (fun (name : string) -> (match (v_irRtLookup name) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__6) -> true
  | B_dData_dMaybe.C_Maybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
))

# 409 "Vuna/Ir/Runtime.vuna"
let v_irRtBridgesList = (fun (name : string) -> (match (v_irRtLookup name) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__7) -> (v_irRtSymBridgesOf dtb__7)
  | B_dData_dMaybe.C_Maybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
))

# 422 "Vuna/Ir/Runtime.vuna"
let rec v_irListLength = (fun mc0 -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__8, dtb__9) -> (1 + (v_irListLength dtb__9))
  | B_dData_dList.C_List_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))

# 427 "Vuna/Ir/Runtime.vuna"
let rec v_irSymbolsOf = (fun (mc0 : Vuna_dIr_dModel.t_Ir) -> (match mc0 with
  | Vuna_dIr_dModel.C_Ir_IrEffBind (dtb__10, dtb__11, dtb__12) -> B_dData_dList.C_List_Nil
  | Vuna_dIr_dModel.C_Ir_IrEffThunk (dtb__13, dtb__14, dtb__15, dtb__16, dtb__17) -> (v_irSymbolsOf dtb__17)
  | Vuna_dIr_dModel.C_Ir_IrConcatMany (dtb__18) -> ((B_dData_dList.v_concatMap v_irSymbolsOf) dtb__18)
  | Vuna_dIr_dModel.C_Ir_IrNatCase (dtb__19, dtb__20, dtb__21, dtb__22, dtb__23) -> ((B_dData_dList.v_append (v_irSymbolsOf dtb__19)) ((B_dData_dList.v_append (v_irSymbolsOfAltMaybe dtb__21)) ((B_dData_dList.v_append (v_irSymbolsOfAltMaybe dtb__22)) (v_irSymbolsOfAltMaybe dtb__23))))
  | Vuna_dIr_dModel.C_Ir_IrCase (dtb__24, dtb__25, dtb__26, dtb__27) -> ((B_dData_dList.v_append (v_irSymbolsOf dtb__26)) ((B_dData_dList.v_concatMap v_irSymbolsOfAlt) dtb__27))
  | Vuna_dIr_dModel.C_Ir_IrIf (dtb__28, dtb__29, dtb__30) -> ((B_dData_dList.v_append (v_irSymbolsOf dtb__28)) ((B_dData_dList.v_append (v_irSymbolsOf dtb__29)) (v_irSymbolsOf dtb__30)))
  | Vuna_dIr_dModel.C_Ir_IrTail (dtb__31) -> (v_irSymbolsOf dtb__31)
  | Vuna_dIr_dModel.C_Ir_IrApp (dtb__32, dtb__33, dtb__34) -> ((B_dData_dList.v_append (v_irSymbolsOf dtb__33)) (v_irSymbolsOf dtb__34))
  | Vuna_dIr_dModel.C_Ir_IrLam (dtb__35, dtb__36, dtb__37) -> (v_irSymbolsOf dtb__37)
  | Vuna_dIr_dModel.C_Ir_IrLet (dtb__38, dtb__39, dtb__40) -> ((B_dData_dList.v_append (v_irSymbolsOf dtb__39)) (v_irSymbolsOf dtb__40))
  | Vuna_dIr_dModel.C_Ir_IrFloatLit (dtb__41) -> B_dData_dList.C_List_Nil
  | Vuna_dIr_dModel.C_Ir_IrBool (dtb__42) -> B_dData_dList.C_List_Nil
  | Vuna_dIr_dModel.C_Ir_IrStr (dtb__43) -> B_dData_dList.C_List_Nil
  | Vuna_dIr_dModel.C_Ir_IrInt (dtb__44) -> B_dData_dList.C_List_Nil
  | Vuna_dIr_dModel.C_Ir_IrCast (dtb__45, dtb__46, dtb__47) -> (v_irSymbolsOf dtb__47)
  | Vuna_dIr_dModel.C_Ir_IrRtApp (dtb__48, dtb__49) -> ((B_dData_dList.v_append (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__48; B_dData_dPair.f_Pair_second = (B_dData_dMaybe.C_Maybe_Just ((v_irListLength dtb__49))) }, B_dData_dList.C_List_Nil))) ((B_dData_dList.v_concatMap v_irSymbolsOf) dtb__49))
  | Vuna_dIr_dModel.C_Ir_IrRt (dtb__50) -> (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__50; B_dData_dPair.f_Pair_second = B_dData_dMaybe.C_Maybe_Nothing }, B_dData_dList.C_List_Nil))
  | Vuna_dIr_dModel.C_Ir_IrRecUpd (dtb__51, dtb__52, dtb__53, dtb__54) -> ((B_dData_dList.v_append (v_irSymbolsOf dtb__51)) ((B_dData_dList.v_concatMap v_irSymbolsOfField) dtb__53))
  | Vuna_dIr_dModel.C_Ir_IrProj (dtb__55, dtb__56, dtb__57, dtb__58) -> (v_irSymbolsOf dtb__55)
  | Vuna_dIr_dModel.C_Ir_IrRecord (dtb__59, dtb__60, dtb__61) -> ((B_dData_dList.v_concatMap v_irSymbolsOfField) dtb__61)
  | Vuna_dIr_dModel.C_Ir_IrCtor (dtb__62, dtb__63, dtb__64, dtb__65) -> ((B_dData_dList.v_concatMap v_irSymbolsOf) dtb__65)
  | Vuna_dIr_dModel.C_Ir_IrGlobal (dtb__66) -> B_dData_dList.C_List_Nil
  | Vuna_dIr_dModel.C_Ir_IrVar (dtb__67) -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))
# 457 "Vuna/Ir/Runtime.vuna"
and v_irSymbolsOfField = (fun (p : (string, Vuna_dIr_dModel.t_Ir) B_dData_dPair.t_Pair) -> (v_irSymbolsOf (B_dData_dPair.v_secondOf p)))
# 460 "Vuna/Ir/Runtime.vuna"
and v_irSymbolsOfAlt = (fun (alt : Vuna_dIr_dModel.t_IrAlt) -> (v_irSymbolsOf (Vuna_dIr_dModel.v_irAltBodyOf alt)))
# 463 "Vuna/Ir/Runtime.vuna"
and v_irSymbolsOfAltMaybe = (fun (mc0 : Vuna_dIr_dModel.t_IrAlt B_dData_dMaybe.t_Maybe) -> (match mc0 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__68) -> (v_irSymbolsOfAlt dtb__68)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 467 "Vuna/Ir/Runtime.vuna"
let v_irSymbolsOfDef = (fun (d : Vuna_dIr_dModel.t_IrDef) -> (match (Vuna_dIr_dModel.v_irDefBody d) with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dList.C_List_Nil
  | B_dData_dMaybe.C_Maybe_Just (dtb__69) -> (v_irSymbolsOf dtb__69)
  | _ -> failwith "DT: impossible branch"
))

# 480 "Vuna/Ir/Runtime.vuna"
let v_irSymbolsOfEntry = (fun (mc0 : Vuna_dIr_dModel.t_IrEntry B_dData_dMaybe.t_Maybe) -> (match mc0 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__70) -> (v_irSymbolsOf (Vuna_dIr_dModel.v_irEntryShowOf dtb__70))
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 474 "Vuna/Ir/Runtime.vuna"
let v_irSymbolsOfUnit = (fun (u : Vuna_dIr_dModel.t_IrUnit) -> ((B_dData_dList.v_append ((B_dData_dList.v_concatMap v_irSymbolsOfDef) ((B_dData_dList.v_concatMap Vuna_dIr_dModel.v_irGroupDefs) (u).Vuna_dIr_dModel.f_IrUnit_irUnitGroups))) (v_irSymbolsOfEntry (u).Vuna_dIr_dModel.f_IrUnit_irUnitEntry)))
