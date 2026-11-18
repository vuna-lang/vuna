open Vuna_runtime
# 30 "Vuna/Compiler/Native/Abi.vuna"
let v_Vuna_dCompiler_dNative_dAbi_dnativeRuntimeModule = (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ("runtime", Base_dData_dList.C_Base_dData_dList_dList_Nil))

# 34 "Vuna/Compiler/Native/Abi.vuna"
let v_Vuna_dCompiler_dNative_dAbi_dnativeArgRegs = (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dReg_Rdi, (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dReg_Rsi, (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dReg_Rdx, (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dReg_Rcx, (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dReg_R8, (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dReg_R9, Base_dData_dList.C_Base_dData_dList_dList_Nil))))))))))))

# 38 "Vuna/Compiler/Native/Abi.vuna"
let v_Vuna_dCompiler_dNative_dAbi_dnativeMaxArgs = 6

# 44 "Vuna/Compiler/Native/Abi.vuna"
let v_Vuna_dCompiler_dNative_dAbi_dnativeStackArgOff = (fun i -> (16 + (8 * (i - v_Vuna_dCompiler_dNative_dAbi_dnativeMaxArgs))))

# 48 "Vuna/Compiler/Native/Abi.vuna"
let v_Vuna_dCompiler_dNative_dAbi_dnativeSlotOff = (fun slot -> (0 - (8 * (slot + 1))))

# 52 "Vuna/Compiler/Native/Abi.vuna"
let v_Vuna_dCompiler_dNative_dAbi_dnativeFrameBytes = (fun slots -> ((fun raw -> (if (raw = 0) then 0 else ((if 16 = 0 then failwith "division by zero" else (raw + 15) / 16) * 16))) (8 * slots)))

# 59 "Vuna/Compiler/Native/Abi.vuna"
let v_Vuna_dCompiler_dNative_dAbi_dnativeStackArgCount = (fun arity regs -> ((fun k -> (if (k <= 0) then 0 else k)) (arity - regs)))

# 66 "Vuna/Compiler/Native/Abi.vuna"
let v_Vuna_dCompiler_dNative_dAbi_dnativeStackPadBytes = (fun k -> (if ((k - ((if 2 = 0 then failwith "division by zero" else k / 2) * 2)) = 1) then 8 else 0))

# 71 "Vuna/Compiler/Native/Abi.vuna"
let v_Vuna_dCompiler_dNative_dAbi_dnativeTailRoomBytes = (fun k -> ((8 * k) + (v_Vuna_dCompiler_dNative_dAbi_dnativeStackPadBytes k)))

# 78 "Vuna/Compiler/Native/Abi.vuna"
let v_Vuna_dCompiler_dNative_dAbi_dnativeStrHeaderBytes = 8

# 82 "Vuna/Compiler/Native/Abi.vuna"
let v_Vuna_dCompiler_dNative_dAbi_dnativeBlockHeaderBytes = 8

# 86 "Vuna/Compiler/Native/Abi.vuna"
let v_Vuna_dCompiler_dNative_dAbi_dnativeMarkFlag = 1

# 89 "Vuna/Compiler/Native/Abi.vuna"
let v_Vuna_dCompiler_dNative_dAbi_dnativeFreeFlag = 2

# 93 "Vuna/Compiler/Native/Abi.vuna"
let v_Vuna_dCompiler_dNative_dAbi_dnativeLeafFlag = 4

# 97 "Vuna/Compiler/Native/Abi.vuna"
let v_Vuna_dCompiler_dNative_dAbi_dnativePinFlag = 8

# 101 "Vuna/Compiler/Native/Abi.vuna"
let v_Vuna_dCompiler_dNative_dAbi_dnativeMinBlockBytes = 16

# 105 "Vuna/Compiler/Native/Abi.vuna"
let v_Vuna_dCompiler_dNative_dAbi_dnativeMaxClassBytes = 67108864

# 109 "Vuna/Compiler/Native/Abi.vuna"
let v_Vuna_dCompiler_dNative_dAbi_dnativeClassCount = 23

# 113 "Vuna/Compiler/Native/Abi.vuna"
let v_Vuna_dCompiler_dNative_dAbi_dnativeFreeTableBytes = 256

# 117 "Vuna/Compiler/Native/Abi.vuna"
let v_Vuna_dCompiler_dNative_dAbi_dnativeSegHeaderBytes = 32

# 121 "Vuna/Compiler/Native/Abi.vuna"
let v_Vuna_dCompiler_dNative_dAbi_dnativeHeapBytes = 1048576

# 125 "Vuna/Compiler/Native/Abi.vuna"
let v_Vuna_dCompiler_dNative_dAbi_dnativeHeapSegLabel = "rt_heap_seg"

# 129 "Vuna/Compiler/Native/Abi.vuna"
let v_Vuna_dCompiler_dNative_dAbi_dnativeHeapLabel = "rt_heap"

# 133 "Vuna/Compiler/Native/Abi.vuna"
let v_Vuna_dCompiler_dNative_dAbi_dnativeHeapEndLabel = "rt_heap_end"

# 137 "Vuna/Compiler/Native/Abi.vuna"
let v_Vuna_dCompiler_dNative_dAbi_dnativeHeapPtrLabel = "rt_heap_ptr"

# 141 "Vuna/Compiler/Native/Abi.vuna"
let v_Vuna_dCompiler_dNative_dAbi_dnativeArenaEndLabel = "rt_arena_end"

# 145 "Vuna/Compiler/Native/Abi.vuna"
let v_Vuna_dCompiler_dNative_dAbi_dnativeSegsLabel = "rt_segs"

# 149 "Vuna/Compiler/Native/Abi.vuna"
let v_Vuna_dCompiler_dNative_dAbi_dnativeCurSegLabel = "rt_cur_seg"

# 153 "Vuna/Compiler/Native/Abi.vuna"
let v_Vuna_dCompiler_dNative_dAbi_dnativeFreeTableLabel = "rt_free_tbl"

# 157 "Vuna/Compiler/Native/Abi.vuna"
let v_Vuna_dCompiler_dNative_dAbi_dnativeHugeFreeLabel = "rt_huge_free"

# 161 "Vuna/Compiler/Native/Abi.vuna"
let v_Vuna_dCompiler_dNative_dAbi_dnativeGcMinDefaultBytes = 1048576

# 168 "Vuna/Compiler/Native/Abi.vuna"
let v_Vuna_dCompiler_dNative_dAbi_dnativeHandlersLabel = "rt_handlers"

# 172 "Vuna/Compiler/Native/Abi.vuna"
let v_Vuna_dCompiler_dNative_dAbi_dnativeStackTopLabel = "rt_stack_top"

# 176 "Vuna/Compiler/Native/Abi.vuna"
let v_Vuna_dCompiler_dNative_dAbi_dnativeSelfLabel = "rt_self"

# 180 "Vuna/Compiler/Native/Abi.vuna"
let v_Vuna_dCompiler_dNative_dAbi_dnativeCleanupHeadLabel = "rt_cleanups"

# 187 "Vuna/Compiler/Native/Abi.vuna"
let v_Vuna_dCompiler_dNative_dAbi_dnativePrologue = (fun frame -> ((Base_dData_dList.v_Base_dData_dList_dappend (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ((Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dInstr_IPush (Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dReg_Rbp)), (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ((Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dInstr_IMov ((Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dOperand_OpReg (Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dReg_Rbp)), (Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dOperand_OpReg (Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dReg_Rsp)))), Base_dData_dList.C_Base_dData_dList_dList_Nil))))) (if (frame = 0) then Base_dData_dList.C_Base_dData_dList_dList_Nil else (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ((Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dInstr_IBinReg ("sub", Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dReg_Rsp, (Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dOperand_OpImm (frame)))), Base_dData_dList.C_Base_dData_dList_dList_Nil)))))

# 194 "Vuna/Compiler/Native/Abi.vuna"
let v_Vuna_dCompiler_dNative_dAbi_dnativeEpilogue = (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ((Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dInstr_IMov ((Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dOperand_OpReg (Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dReg_Rsp)), (Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dOperand_OpReg (Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dReg_Rbp)))), (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ((Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dInstr_IPop (Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dReg_Rbp)), (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dInstr_IRet, Base_dData_dList.C_Base_dData_dList_dList_Nil))))))

# 203 "Vuna/Compiler/Native/Abi.vuna"
let rec v_Vuna_dCompiler_dNative_dAbi_dmapRetTo = (fun (mc0 : string) (mc1 : Vuna_dCompiler_dNative_dModel.t_Vuna_dCompiler_dNative_dModel_dInstr Base_dData_dList.t_Base_dData_dList_dList) -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__0, dtb__1) -> (match dtb__0 with
  | Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dInstr_IRet -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ((Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dInstr_IJmp (mc0)), ((v_Vuna_dCompiler_dNative_dAbi_dmapRetTo mc0) dtb__1)))
  | _ -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__0, ((v_Vuna_dCompiler_dNative_dAbi_dmapRetTo mc0) dtb__1)))
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 228 "Vuna/Compiler/Native/Abi.vuna"
let v_Vuna_dCompiler_dNative_dAbi_disNativeNameChar = (fun c -> (if (if (if (if (c >= 48) then (c <= 57) else false) then true else (if (c >= 65) then (c <= 90) else false)) then true else (if (c >= 97) then (c <= 122) else false)) then true else (c = 95)))

# 231 "Vuna/Compiler/Native/Abi.vuna"
let v_Vuna_dCompiler_dNative_dAbi_dnativeNameChar = (fun c -> (if (v_Vuna_dCompiler_dNative_dAbi_disNativeNameChar c) then (Base_dData_dList.dtp_pack (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (c, Base_dData_dList.C_Base_dData_dList_dList_Nil))) else (String.concat "" ["_x"; (bi_strFromInt c); "_"])))

# 235 "Vuna/Compiler/Native/Abi.vuna"
let v_Vuna_dCompiler_dNative_dAbi_dnativeName = (fun name -> (Base_dData_dList.dtp_pack ((Base_dData_dList.v_Base_dData_dList_dconcatMap (fun (c : int) -> (Base_dData_dList.dtp_unpack (v_Vuna_dCompiler_dNative_dAbi_dnativeNameChar c)))) (Base_dData_dList.dtp_unpack name))))

# 239 "Vuna/Compiler/Native/Abi.vuna"
let v_Vuna_dCompiler_dNative_dAbi_dnativeFuncLabel = (fun name -> ("vuna_" ^ (v_Vuna_dCompiler_dNative_dAbi_dnativeName name)))

# 243 "Vuna/Compiler/Native/Abi.vuna"
let v_Vuna_dCompiler_dNative_dAbi_dnativeRtLabel = (fun name -> ("rt_" ^ (v_Vuna_dCompiler_dNative_dAbi_dnativeName name)))

# 198 "Vuna/Compiler/Native/Abi.vuna"
let v_Vuna_dCompiler_dNative_dAbi_dstackGuardInstrs = (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ((Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dInstr_ICmp ((Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dOperand_OpReg (Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dReg_Rsp)), (Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dOperand_OpRip ("rt_stack_limit")))), (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ((Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dInstr_IJcc ("jb", (v_Vuna_dCompiler_dNative_dAbi_dnativeRtLabel "trap_stack_overflow"))), Base_dData_dList.C_Base_dData_dList_dList_Nil))))

# 211 "Vuna/Compiler/Native/Abi.vuna"
let v_Vuna_dCompiler_dNative_dAbi_drtFunc = (fun name frame body -> ((fun endLabel -> { Vuna_dCompiler_dNative_dModel.f_Vuna_dCompiler_dNative_dModel_dNativeFunc_nfLabel = (v_Vuna_dCompiler_dNative_dAbi_dnativeRtLabel name); Vuna_dCompiler_dNative_dModel.f_Vuna_dCompiler_dNative_dModel_dNativeFunc_nfFrame = frame; Vuna_dCompiler_dNative_dModel.f_Vuna_dCompiler_dNative_dModel_dNativeFunc_nfBody = ((Base_dData_dList.v_Base_dData_dList_dappend (v_Vuna_dCompiler_dNative_dAbi_dnativePrologue frame)) ((Base_dData_dList.v_Base_dData_dList_dappend v_Vuna_dCompiler_dNative_dAbi_dstackGuardInstrs) ((Base_dData_dList.v_Base_dData_dList_dappend ((v_Vuna_dCompiler_dNative_dAbi_dmapRetTo endLabel) body)) ((Base_dData_dList.v_Base_dData_dList_dappend (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ((Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dInstr_ILabel (endLabel)), Base_dData_dList.C_Base_dData_dList_dList_Nil))) v_Vuna_dCompiler_dNative_dAbi_dnativeEpilogue)))); Vuna_dCompiler_dNative_dModel.f_Vuna_dCompiler_dNative_dModel_dNativeFunc_nfModule = v_Vuna_dCompiler_dNative_dAbi_dnativeRuntimeModule }) ((v_Vuna_dCompiler_dNative_dAbi_dnativeRtLabel name) ^ "_end")))

# 222 "Vuna/Compiler/Native/Abi.vuna"
let v_Vuna_dCompiler_dNative_dAbi_drtRawFunc = (fun name body -> { Vuna_dCompiler_dNative_dModel.f_Vuna_dCompiler_dNative_dModel_dNativeFunc_nfLabel = (v_Vuna_dCompiler_dNative_dAbi_dnativeRtLabel name); Vuna_dCompiler_dNative_dModel.f_Vuna_dCompiler_dNative_dModel_dNativeFunc_nfFrame = 0; Vuna_dCompiler_dNative_dModel.f_Vuna_dCompiler_dNative_dModel_dNativeFunc_nfBody = body; Vuna_dCompiler_dNative_dModel.f_Vuna_dCompiler_dNative_dModel_dNativeFunc_nfModule = v_Vuna_dCompiler_dNative_dAbi_dnativeRuntimeModule })

# 247 "Vuna/Compiler/Native/Abi.vuna"
let v_Vuna_dCompiler_dNative_dAbi_dnativeGlobalValueLabel = (fun name -> ("vuna_gv_" ^ (v_Vuna_dCompiler_dNative_dAbi_dnativeName name)))

# 251 "Vuna/Compiler/Native/Abi.vuna"
let v_Vuna_dCompiler_dNative_dAbi_dnativeRtValueLabel = (fun sym -> ("rt_gv_" ^ (v_Vuna_dCompiler_dNative_dAbi_dnativeName sym)))

# 255 "Vuna/Compiler/Native/Abi.vuna"
let v_Vuna_dCompiler_dNative_dAbi_dnativeEntryLabel = "_start"

# 260 "Vuna/Compiler/Native/Abi.vuna"
let v_Vuna_dCompiler_dNative_dAbi_dnativeJumpLabel = (fun n -> (".L" ^ (bi_strFromInt n)))

# 264 "Vuna/Compiler/Native/Abi.vuna"
let v_Vuna_dCompiler_dNative_dAbi_dnativeDataLabel = (fun name -> ("rt_data_" ^ (v_Vuna_dCompiler_dNative_dAbi_dnativeName name)))

# 268 "Vuna/Compiler/Native/Abi.vuna"
let v_Vuna_dCompiler_dNative_dAbi_dnativeStrLitLabel = (fun n -> (".Llit_" ^ (bi_strFromInt n)))
