open Vuna_runtime
type t_NativeErr = C_NativeErr_NativeUnsupported of (string) | C_NativeErr_NativeInternal of (string)
and t_Reg = C_Reg_Rax | C_Reg_Rcx | C_Reg_Rdx | C_Reg_Rsi | C_Reg_Rdi | C_Reg_Rbp | C_Reg_Rsp | C_Reg_R8 | C_Reg_R9 | C_Reg_R10 | C_Reg_R11 | C_Reg_R15
and t_Operand = C_Operand_OpReg of (t_Reg) | C_Operand_OpImm of (int) | C_Operand_OpMem of (t_Reg) * (int) | C_Operand_OpMemX of (t_Reg) * (t_Reg) * (int) | C_Operand_OpRip of (string)
and t_Instr = C_Instr_IMov of (t_Operand) * (t_Operand) | C_Instr_IMovByteOp of (t_Operand) * (int) | C_Instr_IMovByteRegOp of (t_Operand) * (t_Reg) | C_Instr_IMovzx of (t_Reg) * (t_Operand) | C_Instr_IMovzxAl | C_Instr_ILea of (t_Reg) * (string) | C_Instr_ILeaMem of (t_Reg) * (t_Reg) * (int) | C_Instr_IBin of (string) * (t_Operand) | C_Instr_IBinReg of (string) * (t_Reg) * (t_Operand) | C_Instr_ICmp of (t_Operand) * (t_Operand) | C_Instr_ITest of (t_Reg) * (t_Reg) | C_Instr_ISetcc of (string) * (t_Reg) | C_Instr_INeg of (t_Reg) | C_Instr_ICqo | C_Instr_IDiv of (t_Reg) | C_Instr_IDivUnsigned of (t_Reg) | C_Instr_IRepMovsb | C_Instr_IRepeCmpsb | C_Instr_ILabel of (string) | C_Instr_IJmp of (string) | C_Instr_IJmpReg of (t_Reg) | C_Instr_IJcc of (string) * (string) | C_Instr_ICall of (string) | C_Instr_ICallReg of (t_Reg) | C_Instr_IXmmLoad of (int) * (t_Operand) | C_Instr_IXmmStore of (t_Operand) * (int) | C_Instr_IXmmFromInt of (int) * (t_Reg) | C_Instr_IXmmToInt of (t_Reg) * (int) | C_Instr_IXmmBin of (string) * (int) * (int) | C_Instr_IXmmUnop of (string) * (int) | C_Instr_IXmmCmp of (int) * (int) | C_Instr_IXmmToReg of (t_Reg) * (int) | C_Instr_IXmmFromReg of (int) * (t_Reg) | C_Instr_IRet | C_Instr_ISyscall | C_Instr_IPush of (t_Reg) | C_Instr_IPop of (t_Reg) | C_Instr_INop
and t_NativeFunc = { f_NativeFunc_nfLabel : string; f_NativeFunc_nfFrame : int; f_NativeFunc_nfBody : t_Instr B_dData_dList.t_List; f_NativeFunc_nfModule : string B_dData_dList.t_List }
and t_NativeRodata = { f_NativeRodata_nrLabel : string; f_NativeRodata_nrText : string }
and t_NativeStrLit = { f_NativeStrLit_nsLabel : string; f_NativeStrLit_nsText : string }
and t_NativeBss = { f_NativeBss_nbLabel : string; f_NativeBss_nbSize : int; f_NativeBss_nbAlign : int }
and t_NativeClosure = { f_NativeClosure_ncLabel : string; f_NativeClosure_ncCode : string; f_NativeClosure_ncArity : int }
and t_NativeProgram = { f_NativeProgram_npRodata : t_NativeRodata B_dData_dList.t_List; f_NativeProgram_npBss : t_NativeBss B_dData_dList.t_List; f_NativeProgram_npClosures : t_NativeClosure B_dData_dList.t_List; f_NativeProgram_npFuncs : t_NativeFunc B_dData_dList.t_List; f_NativeProgram_npModuleLits : (string B_dData_dList.t_List, t_NativeStrLit B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List }
and t_NativeOutcome = C_NativeOutcome_NativeOk of (t_NativeProgram) | C_NativeOutcome_NativeRejected of (t_NativeErr)

# 28 "Vuna/Compiler/Native/Model.vuna"
let v_nativeErrText = (fun (mc0 : t_NativeErr) -> (match mc0 with
  | C_NativeErr_NativeInternal (dtb__0) -> ("internal native backend error: " ^ dtb__0)
  | C_NativeErr_NativeUnsupported (dtb__1) -> dtb__1
  | _ -> failwith "DT: impossible branch"
))

# 50 "Vuna/Compiler/Native/Model.vuna"
let v_regText = (fun (mc0 : t_Reg) -> (match mc0 with
  | C_Reg_R15 -> "r15"
  | C_Reg_R11 -> "r11"
  | C_Reg_R10 -> "r10"
  | C_Reg_R9 -> "r9"
  | C_Reg_R8 -> "r8"
  | C_Reg_Rsp -> "rsp"
  | C_Reg_Rbp -> "rbp"
  | C_Reg_Rdi -> "rdi"
  | C_Reg_Rsi -> "rsi"
  | C_Reg_Rdx -> "rdx"
  | C_Reg_Rcx -> "rcx"
  | C_Reg_Rax -> "rax"
  | _ -> failwith "DT: impossible branch"
))

# 65 "Vuna/Compiler/Native/Model.vuna"
let v_reg8Text = (fun (mc0 : t_Reg) -> (match mc0 with
  | C_Reg_R15 -> "r15b"
  | C_Reg_R11 -> "r11b"
  | C_Reg_R10 -> "r10b"
  | C_Reg_R9 -> "r9b"
  | C_Reg_R8 -> "r8b"
  | C_Reg_Rsp -> "spl"
  | C_Reg_Rbp -> "bpl"
  | C_Reg_Rdi -> "dil"
  | C_Reg_Rsi -> "sil"
  | C_Reg_Rdx -> "dl"
  | C_Reg_Rcx -> "cl"
  | C_Reg_Rax -> "al"
  | _ -> failwith "DT: impossible branch"
))
