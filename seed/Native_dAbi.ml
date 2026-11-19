open Vuna_runtime
# 30 "Vuna/Compiler/Native/Abi.vuna"
let v_nativeRuntimeModule = (B_dData_dList.C_List__x58__x58_ ("runtime", B_dData_dList.C_List_Nil))

# 34 "Vuna/Compiler/Native/Abi.vuna"
let v_nativeArgRegs = (B_dData_dList.C_List__x58__x58_ (Native_dModel.C_Reg_Rdi, (B_dData_dList.C_List__x58__x58_ (Native_dModel.C_Reg_Rsi, (B_dData_dList.C_List__x58__x58_ (Native_dModel.C_Reg_Rdx, (B_dData_dList.C_List__x58__x58_ (Native_dModel.C_Reg_Rcx, (B_dData_dList.C_List__x58__x58_ (Native_dModel.C_Reg_R8, (B_dData_dList.C_List__x58__x58_ (Native_dModel.C_Reg_R9, B_dData_dList.C_List_Nil))))))))))))

# 38 "Vuna/Compiler/Native/Abi.vuna"
let v_nativeMaxArgs = 6

# 44 "Vuna/Compiler/Native/Abi.vuna"
let v_nativeStackArgOff = (fun (i : int) -> (16 + (8 * (i - v_nativeMaxArgs))))

# 48 "Vuna/Compiler/Native/Abi.vuna"
let v_nativeSlotOff = (fun (slot : int) -> (0 - (8 * (slot + 1))))

# 52 "Vuna/Compiler/Native/Abi.vuna"
let v_nativeFrameBytes = (fun (slots : int) -> ((fun raw -> (if (raw = 0) then 0 else ((if 16 = 0 then failwith "division by zero" else (raw + 15) / 16) * 16))) (8 * slots)))

# 59 "Vuna/Compiler/Native/Abi.vuna"
let v_nativeStackArgCount = (fun (arity : int) (regs : int) -> ((fun k -> (if (k <= 0) then 0 else k)) (arity - regs)))

# 66 "Vuna/Compiler/Native/Abi.vuna"
let v_nativeStackPadBytes = (fun (k : int) -> (if ((k - ((if 2 = 0 then failwith "division by zero" else k / 2) * 2)) = 1) then 8 else 0))

# 71 "Vuna/Compiler/Native/Abi.vuna"
let v_nativeTailRoomBytes = (fun (k : int) -> ((8 * k) + (v_nativeStackPadBytes k)))

# 78 "Vuna/Compiler/Native/Abi.vuna"
let v_nativeStrHeaderBytes = 8

# 82 "Vuna/Compiler/Native/Abi.vuna"
let v_nativeBlockHeaderBytes = 8

# 86 "Vuna/Compiler/Native/Abi.vuna"
let v_nativeMarkFlag = 1

# 89 "Vuna/Compiler/Native/Abi.vuna"
let v_nativeFreeFlag = 2

# 93 "Vuna/Compiler/Native/Abi.vuna"
let v_nativeLeafFlag = 4

# 97 "Vuna/Compiler/Native/Abi.vuna"
let v_nativePinFlag = 8

# 101 "Vuna/Compiler/Native/Abi.vuna"
let v_nativeMinBlockBytes = 16

# 105 "Vuna/Compiler/Native/Abi.vuna"
let v_nativeMaxClassBytes = 67108864

# 109 "Vuna/Compiler/Native/Abi.vuna"
let v_nativeClassCount = 23

# 113 "Vuna/Compiler/Native/Abi.vuna"
let v_nativeFreeTableBytes = 256

# 117 "Vuna/Compiler/Native/Abi.vuna"
let v_nativeSegHeaderBytes = 32

# 121 "Vuna/Compiler/Native/Abi.vuna"
let v_nativeHeapBytes = 1048576

# 125 "Vuna/Compiler/Native/Abi.vuna"
let v_nativeHeapSegLabel = "rt_heap_seg"

# 129 "Vuna/Compiler/Native/Abi.vuna"
let v_nativeHeapLabel = "rt_heap"

# 133 "Vuna/Compiler/Native/Abi.vuna"
let v_nativeHeapEndLabel = "rt_heap_end"

# 137 "Vuna/Compiler/Native/Abi.vuna"
let v_nativeHeapPtrLabel = "rt_heap_ptr"

# 141 "Vuna/Compiler/Native/Abi.vuna"
let v_nativeArenaEndLabel = "rt_arena_end"

# 145 "Vuna/Compiler/Native/Abi.vuna"
let v_nativeSegsLabel = "rt_segs"

# 149 "Vuna/Compiler/Native/Abi.vuna"
let v_nativeCurSegLabel = "rt_cur_seg"

# 153 "Vuna/Compiler/Native/Abi.vuna"
let v_nativeFreeTableLabel = "rt_free_tbl"

# 157 "Vuna/Compiler/Native/Abi.vuna"
let v_nativeHugeFreeLabel = "rt_huge_free"

# 161 "Vuna/Compiler/Native/Abi.vuna"
let v_nativeGcMinDefaultBytes = 1048576

# 168 "Vuna/Compiler/Native/Abi.vuna"
let v_nativeStackTopLabel = "rt_stack_top"

# 172 "Vuna/Compiler/Native/Abi.vuna"
let v_nativeCleanupHeadLabel = "rt_cleanups"

# 179 "Vuna/Compiler/Native/Abi.vuna"
let v_nativePrologue = (fun (frame : int) -> ((B_dData_dList.v_append (B_dData_dList.C_List__x58__x58_ ((Native_dModel.C_Instr_IPush (Native_dModel.C_Reg_Rbp)), (B_dData_dList.C_List__x58__x58_ ((Native_dModel.C_Instr_IMov ((Native_dModel.C_Operand_OpReg (Native_dModel.C_Reg_Rbp)), (Native_dModel.C_Operand_OpReg (Native_dModel.C_Reg_Rsp)))), B_dData_dList.C_List_Nil))))) (if (frame = 0) then B_dData_dList.C_List_Nil else (B_dData_dList.C_List__x58__x58_ ((Native_dModel.C_Instr_IBinReg ("sub", Native_dModel.C_Reg_Rsp, (Native_dModel.C_Operand_OpImm (frame)))), B_dData_dList.C_List_Nil)))))

# 186 "Vuna/Compiler/Native/Abi.vuna"
let v_nativeEpilogue = (B_dData_dList.C_List__x58__x58_ ((Native_dModel.C_Instr_IMov ((Native_dModel.C_Operand_OpReg (Native_dModel.C_Reg_Rsp)), (Native_dModel.C_Operand_OpReg (Native_dModel.C_Reg_Rbp)))), (B_dData_dList.C_List__x58__x58_ ((Native_dModel.C_Instr_IPop (Native_dModel.C_Reg_Rbp)), (B_dData_dList.C_List__x58__x58_ (Native_dModel.C_Instr_IRet, B_dData_dList.C_List_Nil))))))

# 195 "Vuna/Compiler/Native/Abi.vuna"
let rec v_mapRetTo = (fun (mc0 : string) (mc1 : Native_dModel.t_Instr B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__0, dtb__1) -> (match dtb__0 with
  | Native_dModel.C_Instr_IRet -> (B_dData_dList.C_List__x58__x58_ ((Native_dModel.C_Instr_IJmp (mc0)), ((v_mapRetTo mc0) dtb__1)))
  | _ -> (B_dData_dList.C_List__x58__x58_ (dtb__0, ((v_mapRetTo mc0) dtb__1)))
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 220 "Vuna/Compiler/Native/Abi.vuna"
let v_isNativeNameChar = (fun (c : int) -> (if (if (if (if (c >= 48) then (c <= 57) else false) then true else (if (c >= 65) then (c <= 90) else false)) then true else (if (c >= 97) then (c <= 122) else false)) then true else (c = 95)))

# 223 "Vuna/Compiler/Native/Abi.vuna"
let v_nativeNameChar = (fun (c : int) -> (if (v_isNativeNameChar c) then (B_dData_dList.dtp_pack (B_dData_dList.C_List__x58__x58_ (c, B_dData_dList.C_List_Nil))) else (String.concat "" ["_x"; (bi_strFromInt c); "_"])))

# 227 "Vuna/Compiler/Native/Abi.vuna"
let v_nativeName = (fun (name : string) -> (B_dData_dList.dtp_pack ((B_dData_dList.v_concatMap (fun (c : int) -> (B_dData_dList.dtp_unpack (v_nativeNameChar c)))) (B_dData_dList.dtp_unpack name))))

# 231 "Vuna/Compiler/Native/Abi.vuna"
let v_nativeFuncLabel = (fun (name : string) -> ("vuna_" ^ (v_nativeName name)))

# 235 "Vuna/Compiler/Native/Abi.vuna"
let v_nativeRtLabel = (fun (name : string) -> ("rt_" ^ (v_nativeName name)))

# 190 "Vuna/Compiler/Native/Abi.vuna"
let v_stackGuardInstrs = (B_dData_dList.C_List__x58__x58_ ((Native_dModel.C_Instr_ICmp ((Native_dModel.C_Operand_OpReg (Native_dModel.C_Reg_Rsp)), (Native_dModel.C_Operand_OpRip ("rt_stack_limit")))), (B_dData_dList.C_List__x58__x58_ ((Native_dModel.C_Instr_IJcc ("jb", (v_nativeRtLabel "trap_stack_overflow"))), B_dData_dList.C_List_Nil))))

# 203 "Vuna/Compiler/Native/Abi.vuna"
let v_rtFunc = (fun (name : string) (frame : int) (body : Native_dModel.t_Instr B_dData_dList.t_List) -> ((fun endLabel -> { Native_dModel.f_NativeFunc_nfLabel = (v_nativeRtLabel name); Native_dModel.f_NativeFunc_nfFrame = frame; Native_dModel.f_NativeFunc_nfBody = ((B_dData_dList.v_append (v_nativePrologue frame)) ((B_dData_dList.v_append v_stackGuardInstrs) ((B_dData_dList.v_append ((v_mapRetTo endLabel) body)) ((B_dData_dList.v_append (B_dData_dList.C_List__x58__x58_ ((Native_dModel.C_Instr_ILabel (endLabel)), B_dData_dList.C_List_Nil))) v_nativeEpilogue)))); Native_dModel.f_NativeFunc_nfModule = v_nativeRuntimeModule }) ((v_nativeRtLabel name) ^ "_end")))

# 214 "Vuna/Compiler/Native/Abi.vuna"
let v_rtRawFunc = (fun (name : string) (body : Native_dModel.t_Instr B_dData_dList.t_List) -> { Native_dModel.f_NativeFunc_nfLabel = (v_nativeRtLabel name); Native_dModel.f_NativeFunc_nfFrame = 0; Native_dModel.f_NativeFunc_nfBody = body; Native_dModel.f_NativeFunc_nfModule = v_nativeRuntimeModule })

# 239 "Vuna/Compiler/Native/Abi.vuna"
let v_nativeGlobalValueLabel = (fun (name : string) -> ("vuna_gv_" ^ (v_nativeName name)))

# 243 "Vuna/Compiler/Native/Abi.vuna"
let v_nativeRtValueLabel = (fun (sym : string) -> ("rt_gv_" ^ (v_nativeName sym)))

# 247 "Vuna/Compiler/Native/Abi.vuna"
let v_nativeEntryLabel = "_start"

# 252 "Vuna/Compiler/Native/Abi.vuna"
let v_nativeJumpLabel = (fun (n : int) -> (".L" ^ (bi_strFromInt n)))

# 256 "Vuna/Compiler/Native/Abi.vuna"
let v_nativeDataLabel = (fun (name : string) -> ("rt_data_" ^ (v_nativeName name)))

# 260 "Vuna/Compiler/Native/Abi.vuna"
let v_nativeStrLitLabel = (fun (n : int) -> (".Llit_" ^ (bi_strFromInt n)))
