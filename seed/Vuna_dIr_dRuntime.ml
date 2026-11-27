open Vuna_runtime
type t_IrRtSym = { f_IrRtSym_irRtSymName : string; f_IrRtSym_irRtSymBridgesList : bool }

# 40 "Vuna/Ir/Runtime.vuna"
let v_irRtSymNameOf = (fun (dtb_u_u1 : t_IrRtSym) -> (match dtb_u_u1 with
  | { f_IrRtSym_irRtSymName = dtb_u_u2; f_IrRtSym_irRtSymBridgesList = dtb_u_u3 } -> dtb_u_u2
  | _ -> failwith "DT: impossible branch"
))

# 44 "Vuna/Ir/Runtime.vuna"
let v_irRtSymBridgesOf = (fun (dtb_u_u4 : t_IrRtSym) -> (match dtb_u_u4 with
  | { f_IrRtSym_irRtSymName = dtb_u_u5; f_IrRtSym_irRtSymBridgesList = dtb_u_u6 } -> dtb_u_u6
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
let v_irRtPlainNames = (B_dData_dList.C_List__x58__x58_ ("+", (B_dData_dList.C_List__x58__x58_ ("-", (B_dData_dList.C_List__x58__x58_ ("*", (B_dData_dList.C_List__x58__x58_ ("/", (B_dData_dList.C_List__x58__x58_ ("bitAnd", (B_dData_dList.C_List__x58__x58_ ("bitOr", (B_dData_dList.C_List__x58__x58_ ("bitXor", (B_dData_dList.C_List__x58__x58_ ("bitNot", (B_dData_dList.C_List__x58__x58_ ("bitShl", (B_dData_dList.C_List__x58__x58_ ("bitShr", (B_dData_dList.C_List__x58__x58_ ("++", (B_dData_dList.C_List__x58__x58_ ("&&", (B_dData_dList.C_List__x58__x58_ ("||", (B_dData_dList.C_List__x58__x58_ ("strFromInt", (B_dData_dList.C_List__x58__x58_ ("strLength", (B_dData_dList.C_List__x58__x58_ ("strHash", (B_dData_dList.C_List__x58__x58_ ("effectId", (B_dData_dList.C_List__x58__x58_ ("strAt", (B_dData_dList.C_List__x58__x58_ ("strSubstring", (B_dData_dList.C_List__x58__x58_ ("strShow", (B_dData_dList.C_List__x58__x58_ ("prim_erase", (B_dData_dList.C_List__x58__x58_ ("@vuna@prim@toObj", (B_dData_dList.C_List__x58__x58_ ("@vuna@prim@fromObj", (B_dData_dList.C_List__x58__x58_ ("natAdd", (B_dData_dList.C_List__x58__x58_ ("natSub", (B_dData_dList.C_List__x58__x58_ ("natMul", (B_dData_dList.C_List__x58__x58_ ("natDiv", (B_dData_dList.C_List__x58__x58_ ("natToInt", (B_dData_dList.C_List__x58__x58_ ("natFromInt", (B_dData_dList.C_List__x58__x58_ ("arrayLength", (B_dData_dList.C_List__x58__x58_ ("arrayEmpty", (B_dData_dList.C_List__x58__x58_ ("arrayGet", (B_dData_dList.C_List__x58__x58_ ("arraySet", (B_dData_dList.C_List__x58__x58_ ("arrayMake", (B_dData_dList.C_List__x58__x58_ ("prim_effectPerformId", (B_dData_dList.C_List__x58__x58_ ("prim_effectHandleId", (B_dData_dList.C_List__x58__x58_ ("prim_effectSelf", (B_dData_dList.C_List__x58__x58_ ("prim_cleanupPush", (B_dData_dList.C_List__x58__x58_ ("prim_cleanupPop", (B_dData_dList.C_List__x58__x58_ ("prim_schedNewScope", (B_dData_dList.C_List__x58__x58_ ("prim_schedFork", (B_dData_dList.C_List__x58__x58_ ("prim_schedYield", (B_dData_dList.C_List__x58__x58_ ("prim_schedIsCancelled", (B_dData_dList.C_List__x58__x58_ ("prim_schedAwait", (B_dData_dList.C_List__x58__x58_ ("prim_schedTaskResult", (B_dData_dList.C_List__x58__x58_ ("prim_schedTaskError", (B_dData_dList.C_List__x58__x58_ ("prim_schedCancelTask", (B_dData_dList.C_List__x58__x58_ ("prim_schedCancelScope", (B_dData_dList.C_List__x58__x58_ ("prim_schedScopeWait", (B_dData_dList.C_List__x58__x58_ ("prim_schedScopeWaitTimeout", (B_dData_dList.C_List__x58__x58_ ("prim_schedScopeError", (B_dData_dList.C_List__x58__x58_ ("prim_schedScopeCount", (B_dData_dList.C_List__x58__x58_ ("prim_fail", (B_dData_dList.C_List__x58__x58_ ("assert", (B_dData_dList.C_List__x58__x58_ ("todo", (B_dData_dList.C_List__x58__x58_ ("bi_eq_int", (B_dData_dList.C_List__x58__x58_ ("bi_neq_int", (B_dData_dList.C_List__x58__x58_ ("bi_eq_str", (B_dData_dList.C_List__x58__x58_ ("bi_neq_str", (B_dData_dList.C_List__x58__x58_ ("bi_lt_int", (B_dData_dList.C_List__x58__x58_ ("bi_le_int", (B_dData_dList.C_List__x58__x58_ ("bi_gt_int", (B_dData_dList.C_List__x58__x58_ ("bi_ge_int", (B_dData_dList.C_List__x58__x58_ ("bi_lt_str", (B_dData_dList.C_List__x58__x58_ ("bi_le_str", (B_dData_dList.C_List__x58__x58_ ("bi_gt_str", (B_dData_dList.C_List__x58__x58_ ("bi_ge_str", (B_dData_dList.C_List__x58__x58_ ("bi_lt_bool", (B_dData_dList.C_List__x58__x58_ ("bi_le_bool", (B_dData_dList.C_List__x58__x58_ ("bi_gt_bool", (B_dData_dList.C_List__x58__x58_ ("bi_ge_bool", (B_dData_dList.C_List__x58__x58_ ("strFromFloat", (B_dData_dList.C_List__x58__x58_ ("floatFromInt", (B_dData_dList.C_List__x58__x58_ ("intFromFloat", (B_dData_dList.C_List__x58__x58_ ("floatAbs", (B_dData_dList.C_List__x58__x58_ ("floatSqrt", (B_dData_dList.C_List__x58__x58_ ("bi_add_float", (B_dData_dList.C_List__x58__x58_ ("bi_sub_float", (B_dData_dList.C_List__x58__x58_ ("bi_mul_float", (B_dData_dList.C_List__x58__x58_ ("bi_div_float", (B_dData_dList.C_List__x58__x58_ ("bi_eq_float", (B_dData_dList.C_List__x58__x58_ ("bi_neq_float", (B_dData_dList.C_List__x58__x58_ ("bi_lt_float", (B_dData_dList.C_List__x58__x58_ ("bi_le_float", (B_dData_dList.C_List__x58__x58_ ("bi_gt_float", (B_dData_dList.C_List__x58__x58_ ("bi_ge_float", (B_dData_dList.C_List__x58__x58_ ("effTimeUs", (B_dData_dList.C_List__x58__x58_ ("@vuna@prim_eff_sleep", (B_dData_dList.C_List__x58__x58_ ("@vuna@prim_mrefNew", (B_dData_dList.C_List__x58__x58_ ("@vuna@prim_mrefRead", (B_dData_dList.C_List__x58__x58_ ("@vuna@prim_mrefWrite", (B_dData_dList.C_List__x58__x58_ ("@vuna@prim_marrNew", (B_dData_dList.C_List__x58__x58_ ("@vuna@prim_marrGet", (B_dData_dList.C_List__x58__x58_ ("@vuna@prim_marrSet", (B_dData_dList.C_List__x58__x58_ ("@vuna@prim_marrLen", (B_dData_dList.C_List__x58__x58_ ("@vuna@prim_dynNew", (B_dData_dList.C_List__x58__x58_ ("@vuna@prim_dynGet", (B_dData_dList.C_List__x58__x58_ ("@vuna@prim_dynSet", (B_dData_dList.C_List__x58__x58_ ("@vuna@prim_dynPush", (B_dData_dList.C_List__x58__x58_ ("@vuna@prim_dynLen", (B_dData_dList.C_List__x58__x58_ ("@vuna@prim_dynClear", (B_dData_dList.C_List__x58__x58_ ("@vuna@prim_mbufNew", (B_dData_dList.C_List__x58__x58_ ("@vuna@prim_mbufAppend", (B_dData_dList.C_List__x58__x58_ ("@vuna@prim_mbufAppendChar", (B_dData_dList.C_List__x58__x58_ ("@vuna@prim_mbufLen", (B_dData_dList.C_List__x58__x58_ ("@vuna@prim_mbufClear", (B_dData_dList.C_List__x58__x58_ ("@vuna@prim_mbufToString", (B_dData_dList.C_List__x58__x58_ ("@vuna@prim_eff_print", (B_dData_dList.C_List__x58__x58_ ("@vuna@host@print", (B_dData_dList.C_List__x58__x58_ ("@vuna@prim_eff_eprint", (B_dData_dList.C_List__x58__x58_ ("@vuna@prim_eff_readLine", (B_dData_dList.C_List__x58__x58_ ("@vuna@prim_eff_readBytes", (B_dData_dList.C_List__x58__x58_ ("@vuna@host@fileExists", (B_dData_dList.C_List__x58__x58_ ("@vuna@host@fileMtime", (B_dData_dList.C_List__x58__x58_ ("@vuna@host@fileSize", (B_dData_dList.C_List__x58__x58_ ("@vuna@prim_eff_hostStatus", (B_dData_dList.C_List__x58__x58_ ("@vuna@host@tryReadFile", (B_dData_dList.C_List__x58__x58_ ("@vuna@host@tryReadFileRange", (B_dData_dList.C_List__x58__x58_ ("@vuna@host@tryWriteFile", (B_dData_dList.C_List__x58__x58_ ("@vuna@host@tryWriteFileAtomic", (B_dData_dList.C_List__x58__x58_ ("@vuna@host@tryIsDirectory", (B_dData_dList.C_List__x58__x58_ ("@vuna@host@tryMakeDir", (B_dData_dList.C_List__x58__x58_ ("@vuna@host@tryRemoveFile", (B_dData_dList.C_List__x58__x58_ ("@vuna@host@tryRemoveTree", (B_dData_dList.C_List__x58__x58_ ("@vuna@host@tryRename", (B_dData_dList.C_List__x58__x58_ ("@vuna@host@trySymlink", (B_dData_dList.C_List__x58__x58_ ("@vuna@host@tryMakeDirExclusive", (B_dData_dList.C_List__x58__x58_ ("@vuna@host@isTty", (B_dData_dList.C_List__x58__x58_ ("@vuna@prim_eff_exit", (B_dData_dList.C_List__x58__x58_ ("effTimeUs_host", (B_dData_dList.C_List__x58__x58_ ("@vuna@host@sleep", (B_dData_dList.C_List__x58__x58_ ("@vuna@host@getenv", (B_dData_dList.C_List__x58__x58_ ("@vuna@host@getcwd", (B_dData_dList.C_List__x58__x58_ ("@vuna@host@execPath", (B_dData_dList.C_List__x58__x58_ ("@vuna@prim_eff_exit_process_host", (B_dData_dList.C_List__x58__x58_ ("@vuna@host@exitOp", (B_dData_dList.C_List__x58__x58_ ("@vuna@host@readLine", (B_dData_dList.C_List__x58__x58_ ("@vuna@host@readBytes", (B_dData_dList.C_List__x58__x58_ ("@vuna@prim_eff_wait", (B_dData_dList.C_List__x58__x58_ ("@vuna@host@tryNetListen", (B_dData_dList.C_List__x58__x58_ ("@vuna@host@tryNetPort", (B_dData_dList.C_List__x58__x58_ ("@vuna@host@tryNetAccept", (B_dData_dList.C_List__x58__x58_ ("@vuna@host@tryNetRecv", (B_dData_dList.C_List__x58__x58_ ("@vuna@host@tryNetSend", (B_dData_dList.C_List__x58__x58_ ("@vuna@host@tryNetClose", (B_dData_dList.C_List__x58__x58_ ("@vuna@host@tryNetConnect", (B_dData_dList.C_List__x58__x58_ ("@vuna@host@tryNetAcceptWithin", (B_dData_dList.C_List__x58__x58_ ("@vuna@host@tryNetRecvWithin", (B_dData_dList.C_List__x58__x58_ ("@vuna@host@tryNetSendWithin", (B_dData_dList.C_List__x58__x58_ ("@vuna@prim_eff_getenv", (B_dData_dList.C_List__x58__x58_ ("@vuna@prim_eff_getcwd", (B_dData_dList.C_List__x58__x58_ ("@vuna@prim_eff_execPath", (B_dData_dList.C_List__x58__x58_ ("@vuna@log@on", (B_dData_dList.C_List__x58__x58_ ("@vuna@log@emit", (B_dData_dList.C_List__x58__x58_ ("@vuna@obs@level", (B_dData_dList.C_List__x58__x58_ ("@vuna@obs@span", (B_dData_dList.C_List__x58__x58_ ("@vuna@obs@counter", (B_dData_dList.C_List__x58__x58_ ("@vuna@obs@mark", (B_dData_dList.C_List__x58__x58_ ("@vuna@obs@spanBegin", (B_dData_dList.C_List__x58__x58_ ("@vuna@obs@spanEnd", (B_dData_dList.C_List__x58__x58_ ("@vuna@obs@sampleStart", (B_dData_dList.C_List__x58__x58_ ("@vuna@obs@sampleStop", (B_dData_dList.C_List__x58__x58_ ("@vuna@obs@spanLab", B_dData_dList.C_List_Nil))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))

# 242 "Vuna/Ir/Runtime.vuna"
let v_irRtBridgedNames = (B_dData_dList.C_List__x58__x58_ ("strUnpack", (B_dData_dList.C_List__x58__x58_ ("strPack", (B_dData_dList.C_List__x58__x58_ ("strConcatMany", (B_dData_dList.C_List__x58__x58_ ("strSubstTemplate", (B_dData_dList.C_List__x58__x58_ ("arrayFromList", (B_dData_dList.C_List__x58__x58_ ("@vuna@prim_marrFromList", (B_dData_dList.C_List__x58__x58_ ("arrayToList", (B_dData_dList.C_List__x58__x58_ ("@vuna@prim_eff_getArgs", (B_dData_dList.C_List__x58__x58_ ("@vuna@host@tryReadDir", (B_dData_dList.C_List__x58__x58_ ("@vuna@host@tryRunIn", (B_dData_dList.C_List__x58__x58_ ("@vuna@prim_eff_runIn", (B_dData_dList.C_List__x58__x58_ ("@vuna@prim_eff_getArgs_process_host", (B_dData_dList.C_List__x58__x58_ ("@vuna@host@getArgs", (B_dData_dList.C_List__x58__x58_ ("@vuna@prim_eff_spawn", B_dData_dList.C_List_Nil))))))))))))))))))))))))))))

# 262 "Vuna/Ir/Runtime.vuna"
let v_irRtThreadNames = (B_dData_dList.C_List__x58__x58_ ("@vuna@prim_eff_threadSpawn", (B_dData_dList.C_List__x58__x58_ ("@vuna@prim_eff_threadJoin", (B_dData_dList.C_List__x58__x58_ ("@vuna@prim_eff_threadYield", (B_dData_dList.C_List__x58__x58_ ("@vuna@prim_eff_threadId", (B_dData_dList.C_List__x58__x58_ ("@vuna@prim_eff_threadParallelism", (B_dData_dList.C_List__x58__x58_ ("@vuna@prim_eff_mutexNew", (B_dData_dList.C_List__x58__x58_ ("@vuna@prim_eff_mutexLock", (B_dData_dList.C_List__x58__x58_ ("@vuna@prim_eff_mutexTryLock", (B_dData_dList.C_List__x58__x58_ ("@vuna@prim_eff_mutexUnlock", (B_dData_dList.C_List__x58__x58_ ("@vuna@prim_eff_condvarNew", (B_dData_dList.C_List__x58__x58_ ("@vuna@prim_eff_condvarWait", (B_dData_dList.C_List__x58__x58_ ("@vuna@prim_eff_condvarSignal", (B_dData_dList.C_List__x58__x58_ ("@vuna@prim_eff_condvarBroadcast", (B_dData_dList.C_List__x58__x58_ ("@vuna@prim_eff_atomicNew", (B_dData_dList.C_List__x58__x58_ ("@vuna@prim_eff_atomicLoad", (B_dData_dList.C_List__x58__x58_ ("@vuna@prim_eff_atomicStore", (B_dData_dList.C_List__x58__x58_ ("@vuna@prim_eff_atomicFetchAdd", (B_dData_dList.C_List__x58__x58_ ("@vuna@prim_eff_atomicExchange", (B_dData_dList.C_List__x58__x58_ ("@vuna@prim_eff_atomicCompareExchange", B_dData_dList.C_List_Nil))))))))))))))))))))))))))))))))))))))

# 288 "Vuna/Ir/Runtime.vuna"
let v_irRtWasmSeqThreadNames = (B_dData_dList.C_List__x58__x58_ ("@vuna@prim_eff_threadSpawn", (B_dData_dList.C_List__x58__x58_ ("@vuna@prim_eff_threadJoin", (B_dData_dList.C_List__x58__x58_ ("@vuna@prim_eff_threadYield", (B_dData_dList.C_List__x58__x58_ ("@vuna@prim_eff_threadId", (B_dData_dList.C_List__x58__x58_ ("@vuna@prim_eff_threadParallelism", B_dData_dList.C_List_Nil))))))))))

# 299 "Vuna/Ir/Runtime.vuna"
let v_irRtAllTargets = (B_dData_dList.C_List__x58__x58_ ("ocaml", (B_dData_dList.C_List__x58__x58_ ("native", (B_dData_dList.C_List__x58__x58_ ("wasm", B_dData_dList.C_List_Nil))))))

# 304 "Vuna/Ir/Runtime.vuna"
let v_irRtTargets = (fun (dtb_u_u7 : string) -> (if ((B_dData_dList.v_memName dtb_u_u7) v_irRtWasmSeqThreadNames) then v_irRtAllTargets else (if ((B_dData_dList.v_memName dtb_u_u7) v_irRtThreadNames) then (B_dData_dList.C_List__x58__x58_ ("ocaml", (B_dData_dList.C_List__x58__x58_ ("native", B_dData_dList.C_List_Nil)))) else v_irRtAllTargets)))

# 311 "Vuna/Ir/Runtime.vuna"
let v_irRtSupports = (fun (dtb_u_u8 : string) (dtb_u_u9 : string) -> ((B_dData_dList.v_memName dtb_u_u8) (v_irRtTargets dtb_u_u9)))

# 315 "Vuna/Ir/Runtime.vuna"
let v_irRtNames = ((B_dData_dList.v_append v_irRtPlainNames) ((B_dData_dList.v_append v_irRtThreadNames) ((B_dData_dList.v_append v_irRtBridgedNames) v_irRtSyntheticNames)))

# 320 "Vuna/Ir/Runtime.vuna"
let v_irRtContract = ((B_dData_dList.v_append ((B_dData_dList.v_map (fun (dtb_u_u10 : string) -> { f_IrRtSym_irRtSymName = dtb_u_u10; f_IrRtSym_irRtSymBridgesList = false })) ((B_dData_dList.v_append v_irRtPlainNames) v_irRtThreadNames))) ((B_dData_dList.v_append ((B_dData_dList.v_map (fun (dtb_u_u11 : string) -> { f_IrRtSym_irRtSymName = dtb_u_u11; f_IrRtSym_irRtSymBridgesList = true })) v_irRtBridgedNames)) ((B_dData_dList.v_map (fun (dtb_u_u12 : string) -> { f_IrRtSym_irRtSymName = dtb_u_u12; f_IrRtSym_irRtSymBridgesList = false })) v_irRtSyntheticNames)))

# 326 "Vuna/Ir/Runtime.vuna"
let rec v_irRtLookupGo = (fun (dtb_u_u13 : string) (dtb_u_u14 : t_IrRtSym B_dData_dList.t_List) -> (match dtb_u_u14 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u15, dtb_u_u16) -> (if ((v_irRtSymNameOf dtb_u_u15) = dtb_u_u13) then (B_dData_dMaybe.C_Maybe_Just (dtb_u_u15)) else ((v_irRtLookupGo dtb_u_u13) dtb_u_u16))
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 331 "Vuna/Ir/Runtime.vuna"
let v_irRtLookup = (fun (dtb_u_u17 : string) -> ((v_irRtLookupGo dtb_u_u17) v_irRtContract))

# 335 "Vuna/Ir/Runtime.vuna"
let v_irRtIsKnown = (fun (dtb_u_u18 : string) -> (match (v_irRtLookup dtb_u_u18) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u19) -> true
  | B_dData_dMaybe.C_Maybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
))

# 342 "Vuna/Ir/Runtime.vuna"
let v_irRtBridgesList = (fun (dtb_u_u20 : string) -> (match (v_irRtLookup dtb_u_u20) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u21) -> (v_irRtSymBridgesOf dtb_u_u21)
  | B_dData_dMaybe.C_Maybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
))

# 355 "Vuna/Ir/Runtime.vuna"
let rec v_irListLength = (fun dtb_u_u23 -> (match dtb_u_u23 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u24, dtb_u_u25) -> (1 + (v_irListLength dtb_u_u25))
  | B_dData_dList.C_List_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))

# 360 "Vuna/Ir/Runtime.vuna"
let rec v_irSymbolsOf = (fun (dtb_u_u26 : Vuna_dIr_dModel.t_Ir) -> (match dtb_u_u26 with
  | Vuna_dIr_dModel.C_Ir_IrEffBind (dtb_u_u27, dtb_u_u28, dtb_u_u29) -> B_dData_dList.C_List_Nil
  | Vuna_dIr_dModel.C_Ir_IrEffThunk (dtb_u_u30, dtb_u_u31, dtb_u_u32, dtb_u_u33, dtb_u_u34) -> (v_irSymbolsOf dtb_u_u34)
  | Vuna_dIr_dModel.C_Ir_IrConcatMany (dtb_u_u35) -> ((B_dData_dList.v_concatMap v_irSymbolsOf) dtb_u_u35)
  | Vuna_dIr_dModel.C_Ir_IrNatCase (dtb_u_u36, dtb_u_u37, dtb_u_u38, dtb_u_u39, dtb_u_u40) -> ((B_dData_dList.v_append (v_irSymbolsOf dtb_u_u36)) ((B_dData_dList.v_append (v_irSymbolsOfAltMaybe dtb_u_u38)) ((B_dData_dList.v_append (v_irSymbolsOfAltMaybe dtb_u_u39)) (v_irSymbolsOfAltMaybe dtb_u_u40))))
  | Vuna_dIr_dModel.C_Ir_IrCase (dtb_u_u41, dtb_u_u42, dtb_u_u43, dtb_u_u44) -> ((B_dData_dList.v_append (v_irSymbolsOf dtb_u_u43)) ((B_dData_dList.v_concatMap v_irSymbolsOfAlt) dtb_u_u44))
  | Vuna_dIr_dModel.C_Ir_IrIf (dtb_u_u45, dtb_u_u46, dtb_u_u47) -> ((B_dData_dList.v_append (v_irSymbolsOf dtb_u_u45)) ((B_dData_dList.v_append (v_irSymbolsOf dtb_u_u46)) (v_irSymbolsOf dtb_u_u47)))
  | Vuna_dIr_dModel.C_Ir_IrTail (dtb_u_u48) -> (v_irSymbolsOf dtb_u_u48)
  | Vuna_dIr_dModel.C_Ir_IrApp (dtb_u_u49, dtb_u_u50, dtb_u_u51) -> ((B_dData_dList.v_append (v_irSymbolsOf dtb_u_u50)) (v_irSymbolsOf dtb_u_u51))
  | Vuna_dIr_dModel.C_Ir_IrLam (dtb_u_u52, dtb_u_u53, dtb_u_u54) -> (v_irSymbolsOf dtb_u_u54)
  | Vuna_dIr_dModel.C_Ir_IrLet (dtb_u_u55, dtb_u_u56, dtb_u_u57) -> ((B_dData_dList.v_append (v_irSymbolsOf dtb_u_u56)) (v_irSymbolsOf dtb_u_u57))
  | Vuna_dIr_dModel.C_Ir_IrFloatLit (dtb_u_u58) -> B_dData_dList.C_List_Nil
  | Vuna_dIr_dModel.C_Ir_IrBool (dtb_u_u59) -> B_dData_dList.C_List_Nil
  | Vuna_dIr_dModel.C_Ir_IrStr (dtb_u_u60) -> B_dData_dList.C_List_Nil
  | Vuna_dIr_dModel.C_Ir_IrInt (dtb_u_u61) -> B_dData_dList.C_List_Nil
  | Vuna_dIr_dModel.C_Ir_IrCast (dtb_u_u62, dtb_u_u63, dtb_u_u64) -> (v_irSymbolsOf dtb_u_u64)
  | Vuna_dIr_dModel.C_Ir_IrRtApp (dtb_u_u65, dtb_u_u66) -> ((B_dData_dList.v_append (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb_u_u65; B_dData_dPair.f_Pair_second = (B_dData_dMaybe.C_Maybe_Just ((v_irListLength dtb_u_u66))) }, B_dData_dList.C_List_Nil))) ((B_dData_dList.v_concatMap v_irSymbolsOf) dtb_u_u66))
  | Vuna_dIr_dModel.C_Ir_IrRt (dtb_u_u67) -> (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb_u_u67; B_dData_dPair.f_Pair_second = B_dData_dMaybe.C_Maybe_Nothing }, B_dData_dList.C_List_Nil))
  | Vuna_dIr_dModel.C_Ir_IrRecUpd (dtb_u_u68, dtb_u_u69, dtb_u_u70, dtb_u_u71) -> ((B_dData_dList.v_append (v_irSymbolsOf dtb_u_u68)) ((B_dData_dList.v_concatMap v_irSymbolsOfField) dtb_u_u70))
  | Vuna_dIr_dModel.C_Ir_IrProj (dtb_u_u72, dtb_u_u73, dtb_u_u74, dtb_u_u75) -> (v_irSymbolsOf dtb_u_u72)
  | Vuna_dIr_dModel.C_Ir_IrRecord (dtb_u_u76, dtb_u_u77, dtb_u_u78) -> ((B_dData_dList.v_concatMap v_irSymbolsOfField) dtb_u_u78)
  | Vuna_dIr_dModel.C_Ir_IrCtor (dtb_u_u79, dtb_u_u80, dtb_u_u81, dtb_u_u82) -> ((B_dData_dList.v_concatMap v_irSymbolsOf) dtb_u_u82)
  | Vuna_dIr_dModel.C_Ir_IrGlobal (dtb_u_u83) -> B_dData_dList.C_List_Nil
  | Vuna_dIr_dModel.C_Ir_IrVar (dtb_u_u84) -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))
# 390 "Vuna/Ir/Runtime.vuna"
and v_irSymbolsOfField = (fun (dtb_u_u85 : (string, Vuna_dIr_dModel.t_Ir) B_dData_dPair.t_Pair) -> (v_irSymbolsOf (B_dData_dPair.v_secondOf dtb_u_u85)))
# 393 "Vuna/Ir/Runtime.vuna"
and v_irSymbolsOfAlt = (fun (dtb_u_u86 : Vuna_dIr_dModel.t_IrAlt) -> (v_irSymbolsOf (Vuna_dIr_dModel.v_irAltBodyOf dtb_u_u86)))
# 396 "Vuna/Ir/Runtime.vuna"
and v_irSymbolsOfAltMaybe = (fun (dtb_u_u87 : Vuna_dIr_dModel.t_IrAlt B_dData_dMaybe.t_Maybe) -> (match dtb_u_u87 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u88) -> (v_irSymbolsOfAlt dtb_u_u88)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 400 "Vuna/Ir/Runtime.vuna"
let v_irSymbolsOfDef = (fun (dtb_u_u89 : Vuna_dIr_dModel.t_IrDef) -> (match (Vuna_dIr_dModel.v_irDefBody dtb_u_u89) with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dList.C_List_Nil
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u90) -> (v_irSymbolsOf dtb_u_u90)
  | _ -> failwith "DT: impossible branch"
))

# 413 "Vuna/Ir/Runtime.vuna"
let v_irSymbolsOfEntry = (fun (dtb_u_u91 : Vuna_dIr_dModel.t_IrEntry B_dData_dMaybe.t_Maybe) -> (match dtb_u_u91 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u92) -> (v_irSymbolsOf (Vuna_dIr_dModel.v_irEntryShowOf dtb_u_u92))
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 407 "Vuna/Ir/Runtime.vuna"
let v_irSymbolsOfUnit = (fun (dtb_u_u93 : Vuna_dIr_dModel.t_IrUnit) -> ((B_dData_dList.v_append ((B_dData_dList.v_concatMap v_irSymbolsOfDef) ((B_dData_dList.v_concatMap Vuna_dIr_dModel.v_irGroupDefs) (dtb_u_u93).Vuna_dIr_dModel.f_IrUnit_irUnitGroups))) (v_irSymbolsOfEntry (dtb_u_u93).Vuna_dIr_dModel.f_IrUnit_irUnitEntry)))

# 35 "Vuna/Ir/Runtime.vuna"
let v_irRtSymName = (fun (dtb_u_u94 : t_IrRtSym) -> (match dtb_u_u94 with
  | { f_IrRtSym_irRtSymName = dtb_u_u95; f_IrRtSym_irRtSymBridgesList = dtb_u_u96 } -> dtb_u_u95
  | _ -> failwith "DT: impossible branch"
))

# 36 "Vuna/Ir/Runtime.vuna"
let v_irRtSymBridgesList = (fun (dtb_u_u97 : t_IrRtSym) -> (match dtb_u_u97 with
  | { f_IrRtSym_irRtSymName = dtb_u_u98; f_IrRtSym_irRtSymBridgesList = dtb_u_u99 } -> dtb_u_u99
  | _ -> failwith "DT: impossible branch"
))
