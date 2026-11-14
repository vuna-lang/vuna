open Vuna_runtime
type t_Vuna_dCompiler_dNative_dModel_dNativeErr = C_Vuna_dCompiler_dNative_dModel_dNativeErr_NativeUnsupported of (string) | C_Vuna_dCompiler_dNative_dModel_dNativeErr_NativeInternal of (string)
and t_Vuna_dCompiler_dNative_dModel_dReg = C_Vuna_dCompiler_dNative_dModel_dReg_Rax | C_Vuna_dCompiler_dNative_dModel_dReg_Rcx | C_Vuna_dCompiler_dNative_dModel_dReg_Rdx | C_Vuna_dCompiler_dNative_dModel_dReg_Rsi | C_Vuna_dCompiler_dNative_dModel_dReg_Rdi | C_Vuna_dCompiler_dNative_dModel_dReg_Rbp | C_Vuna_dCompiler_dNative_dModel_dReg_Rsp | C_Vuna_dCompiler_dNative_dModel_dReg_R8 | C_Vuna_dCompiler_dNative_dModel_dReg_R9 | C_Vuna_dCompiler_dNative_dModel_dReg_R10 | C_Vuna_dCompiler_dNative_dModel_dReg_R11
and t_Vuna_dCompiler_dNative_dModel_dOperand = C_Vuna_dCompiler_dNative_dModel_dOperand_OpReg of (t_Vuna_dCompiler_dNative_dModel_dReg) | C_Vuna_dCompiler_dNative_dModel_dOperand_OpImm of (int) | C_Vuna_dCompiler_dNative_dModel_dOperand_OpMem of (t_Vuna_dCompiler_dNative_dModel_dReg) * (int) | C_Vuna_dCompiler_dNative_dModel_dOperand_OpMemX of (t_Vuna_dCompiler_dNative_dModel_dReg) * (t_Vuna_dCompiler_dNative_dModel_dReg) * (int) | C_Vuna_dCompiler_dNative_dModel_dOperand_OpRip of (string)
and t_Vuna_dCompiler_dNative_dModel_dInstr = C_Vuna_dCompiler_dNative_dModel_dInstr_IMov of (t_Vuna_dCompiler_dNative_dModel_dOperand) * (t_Vuna_dCompiler_dNative_dModel_dOperand) | C_Vuna_dCompiler_dNative_dModel_dInstr_IMovByteOp of (t_Vuna_dCompiler_dNative_dModel_dOperand) * (int) | C_Vuna_dCompiler_dNative_dModel_dInstr_IMovByteRegOp of (t_Vuna_dCompiler_dNative_dModel_dOperand) * (t_Vuna_dCompiler_dNative_dModel_dReg) | C_Vuna_dCompiler_dNative_dModel_dInstr_IMovzx of (t_Vuna_dCompiler_dNative_dModel_dReg) * (t_Vuna_dCompiler_dNative_dModel_dOperand) | C_Vuna_dCompiler_dNative_dModel_dInstr_IMovzxAl | C_Vuna_dCompiler_dNative_dModel_dInstr_ILea of (t_Vuna_dCompiler_dNative_dModel_dReg) * (string) | C_Vuna_dCompiler_dNative_dModel_dInstr_ILeaMem of (t_Vuna_dCompiler_dNative_dModel_dReg) * (t_Vuna_dCompiler_dNative_dModel_dReg) * (int) | C_Vuna_dCompiler_dNative_dModel_dInstr_IBin of (string) * (t_Vuna_dCompiler_dNative_dModel_dOperand) | C_Vuna_dCompiler_dNative_dModel_dInstr_IBinReg of (string) * (t_Vuna_dCompiler_dNative_dModel_dReg) * (t_Vuna_dCompiler_dNative_dModel_dOperand) | C_Vuna_dCompiler_dNative_dModel_dInstr_ICmp of (t_Vuna_dCompiler_dNative_dModel_dOperand) * (t_Vuna_dCompiler_dNative_dModel_dOperand) | C_Vuna_dCompiler_dNative_dModel_dInstr_ITest of (t_Vuna_dCompiler_dNative_dModel_dReg) * (t_Vuna_dCompiler_dNative_dModel_dReg) | C_Vuna_dCompiler_dNative_dModel_dInstr_ISetcc of (string) * (t_Vuna_dCompiler_dNative_dModel_dReg) | C_Vuna_dCompiler_dNative_dModel_dInstr_INeg of (t_Vuna_dCompiler_dNative_dModel_dReg) | C_Vuna_dCompiler_dNative_dModel_dInstr_ICqo | C_Vuna_dCompiler_dNative_dModel_dInstr_IDiv of (t_Vuna_dCompiler_dNative_dModel_dReg) | C_Vuna_dCompiler_dNative_dModel_dInstr_IDivUnsigned of (t_Vuna_dCompiler_dNative_dModel_dReg) | C_Vuna_dCompiler_dNative_dModel_dInstr_IRepMovsb | C_Vuna_dCompiler_dNative_dModel_dInstr_IRepeCmpsb | C_Vuna_dCompiler_dNative_dModel_dInstr_ILabel of (string) | C_Vuna_dCompiler_dNative_dModel_dInstr_IJmp of (string) | C_Vuna_dCompiler_dNative_dModel_dInstr_IJcc of (string) * (string) | C_Vuna_dCompiler_dNative_dModel_dInstr_ICall of (string) | C_Vuna_dCompiler_dNative_dModel_dInstr_IRet | C_Vuna_dCompiler_dNative_dModel_dInstr_ISyscall | C_Vuna_dCompiler_dNative_dModel_dInstr_IPush of (t_Vuna_dCompiler_dNative_dModel_dReg) | C_Vuna_dCompiler_dNative_dModel_dInstr_IPop of (t_Vuna_dCompiler_dNative_dModel_dReg) | C_Vuna_dCompiler_dNative_dModel_dInstr_INop
and t_Vuna_dCompiler_dNative_dModel_dNativeFunc = { f_Vuna_dCompiler_dNative_dModel_dNativeFunc_nfLabel : string; f_Vuna_dCompiler_dNative_dModel_dNativeFunc_nfFrame : int; f_Vuna_dCompiler_dNative_dModel_dNativeFunc_nfBody : t_Vuna_dCompiler_dNative_dModel_dInstr Base_dList.t_Base_dList_dList }
and t_Vuna_dCompiler_dNative_dModel_dNativeRodata = { f_Vuna_dCompiler_dNative_dModel_dNativeRodata_nrLabel : string; f_Vuna_dCompiler_dNative_dModel_dNativeRodata_nrText : string }
and t_Vuna_dCompiler_dNative_dModel_dNativeStrLit = { f_Vuna_dCompiler_dNative_dModel_dNativeStrLit_nsLabel : string; f_Vuna_dCompiler_dNative_dModel_dNativeStrLit_nsText : string }
and t_Vuna_dCompiler_dNative_dModel_dNativeBss = { f_Vuna_dCompiler_dNative_dModel_dNativeBss_nbLabel : string; f_Vuna_dCompiler_dNative_dModel_dNativeBss_nbSize : int; f_Vuna_dCompiler_dNative_dModel_dNativeBss_nbAlign : int }
and t_Vuna_dCompiler_dNative_dModel_dNativeProgram = { f_Vuna_dCompiler_dNative_dModel_dNativeProgram_npRodata : t_Vuna_dCompiler_dNative_dModel_dNativeRodata Base_dList.t_Base_dList_dList; f_Vuna_dCompiler_dNative_dModel_dNativeProgram_npStrLits : t_Vuna_dCompiler_dNative_dModel_dNativeStrLit Base_dList.t_Base_dList_dList; f_Vuna_dCompiler_dNative_dModel_dNativeProgram_npBss : t_Vuna_dCompiler_dNative_dModel_dNativeBss Base_dList.t_Base_dList_dList; f_Vuna_dCompiler_dNative_dModel_dNativeProgram_npFuncs : t_Vuna_dCompiler_dNative_dModel_dNativeFunc Base_dList.t_Base_dList_dList }
and t_Vuna_dCompiler_dNative_dModel_dNativeOutcome = C_Vuna_dCompiler_dNative_dModel_dNativeOutcome_NativeOk of (t_Vuna_dCompiler_dNative_dModel_dNativeProgram) | C_Vuna_dCompiler_dNative_dModel_dNativeOutcome_NativeRejected of (t_Vuna_dCompiler_dNative_dModel_dNativeErr)

# 27 "Vuna/Compiler/Native/Model.vuna"
let v_Vuna_dCompiler_dNative_dModel_dnativeErrText = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dNative_dModel_dNativeErr_NativeInternal (dtb__0) -> ("internal native backend error: " ^ dtb__0)
  | C_Vuna_dCompiler_dNative_dModel_dNativeErr_NativeUnsupported (dtb__1) -> dtb__1
  | _ -> failwith "DT: impossible branch"
))

# 48 "Vuna/Compiler/Native/Model.vuna"
let v_Vuna_dCompiler_dNative_dModel_dregText = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dNative_dModel_dReg_R11 -> "r11"
  | C_Vuna_dCompiler_dNative_dModel_dReg_R10 -> "r10"
  | C_Vuna_dCompiler_dNative_dModel_dReg_R9 -> "r9"
  | C_Vuna_dCompiler_dNative_dModel_dReg_R8 -> "r8"
  | C_Vuna_dCompiler_dNative_dModel_dReg_Rsp -> "rsp"
  | C_Vuna_dCompiler_dNative_dModel_dReg_Rbp -> "rbp"
  | C_Vuna_dCompiler_dNative_dModel_dReg_Rdi -> "rdi"
  | C_Vuna_dCompiler_dNative_dModel_dReg_Rsi -> "rsi"
  | C_Vuna_dCompiler_dNative_dModel_dReg_Rdx -> "rdx"
  | C_Vuna_dCompiler_dNative_dModel_dReg_Rcx -> "rcx"
  | C_Vuna_dCompiler_dNative_dModel_dReg_Rax -> "rax"
  | _ -> failwith "DT: impossible branch"
))

# 62 "Vuna/Compiler/Native/Model.vuna"
let v_Vuna_dCompiler_dNative_dModel_dreg8Text = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dNative_dModel_dReg_R11 -> "r11b"
  | C_Vuna_dCompiler_dNative_dModel_dReg_R10 -> "r10b"
  | C_Vuna_dCompiler_dNative_dModel_dReg_R9 -> "r9b"
  | C_Vuna_dCompiler_dNative_dModel_dReg_R8 -> "r8b"
  | C_Vuna_dCompiler_dNative_dModel_dReg_Rsp -> "spl"
  | C_Vuna_dCompiler_dNative_dModel_dReg_Rbp -> "bpl"
  | C_Vuna_dCompiler_dNative_dModel_dReg_Rdi -> "dil"
  | C_Vuna_dCompiler_dNative_dModel_dReg_Rsi -> "sil"
  | C_Vuna_dCompiler_dNative_dModel_dReg_Rdx -> "dl"
  | C_Vuna_dCompiler_dNative_dModel_dReg_Rcx -> "cl"
  | C_Vuna_dCompiler_dNative_dModel_dReg_Rax -> "al"
  | _ -> failwith "DT: impossible branch"
))
