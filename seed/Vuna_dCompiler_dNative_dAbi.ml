open Vuna_runtime
# 30 "Vuna/Compiler/Native/Abi.vuna"
let v_Vuna_dCompiler_dNative_dAbi_dnativeArgRegs = (Base_dList.C_Base_dList_dList__x58__x58_ (Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dReg_Rdi, (Base_dList.C_Base_dList_dList__x58__x58_ (Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dReg_Rsi, (Base_dList.C_Base_dList_dList__x58__x58_ (Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dReg_Rdx, (Base_dList.C_Base_dList_dList__x58__x58_ (Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dReg_Rcx, (Base_dList.C_Base_dList_dList__x58__x58_ (Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dReg_R8, (Base_dList.C_Base_dList_dList__x58__x58_ (Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dReg_R9, Base_dList.C_Base_dList_dList_Nil))))))))))))

# 34 "Vuna/Compiler/Native/Abi.vuna"
let v_Vuna_dCompiler_dNative_dAbi_dnativeMaxArgs = 6

# 40 "Vuna/Compiler/Native/Abi.vuna"
let v_Vuna_dCompiler_dNative_dAbi_dnativeStackArgOff = (fun i -> (16 + (8 * (i - v_Vuna_dCompiler_dNative_dAbi_dnativeMaxArgs))))

# 44 "Vuna/Compiler/Native/Abi.vuna"
let v_Vuna_dCompiler_dNative_dAbi_dnativeSlotOff = (fun slot -> (0 - (8 * (slot + 1))))

# 48 "Vuna/Compiler/Native/Abi.vuna"
let v_Vuna_dCompiler_dNative_dAbi_dnativeFrameBytes = (fun slots -> ((fun raw -> (if (raw = 0) then 0 else ((if 16 = 0 then failwith "division by zero" else (raw + 15) / 16) * 16))) (8 * slots)))

# 58 "Vuna/Compiler/Native/Abi.vuna"
let v_Vuna_dCompiler_dNative_dAbi_dnativeStrHeaderBytes = 8

# 62 "Vuna/Compiler/Native/Abi.vuna"
let v_Vuna_dCompiler_dNative_dAbi_dnativeBlockHeaderBytes = 8

# 66 "Vuna/Compiler/Native/Abi.vuna"
let v_Vuna_dCompiler_dNative_dAbi_dnativeMarkFlag = 1

# 69 "Vuna/Compiler/Native/Abi.vuna"
let v_Vuna_dCompiler_dNative_dAbi_dnativeFreeFlag = 2

# 73 "Vuna/Compiler/Native/Abi.vuna"
let v_Vuna_dCompiler_dNative_dAbi_dnativeLeafFlag = 4

# 77 "Vuna/Compiler/Native/Abi.vuna"
let v_Vuna_dCompiler_dNative_dAbi_dnativePinFlag = 8

# 81 "Vuna/Compiler/Native/Abi.vuna"
let v_Vuna_dCompiler_dNative_dAbi_dnativeMinBlockBytes = 16

# 85 "Vuna/Compiler/Native/Abi.vuna"
let v_Vuna_dCompiler_dNative_dAbi_dnativeMaxClassBytes = 67108864

# 89 "Vuna/Compiler/Native/Abi.vuna"
let v_Vuna_dCompiler_dNative_dAbi_dnativeClassCount = 23

# 93 "Vuna/Compiler/Native/Abi.vuna"
let v_Vuna_dCompiler_dNative_dAbi_dnativeFreeTableBytes = 256

# 97 "Vuna/Compiler/Native/Abi.vuna"
let v_Vuna_dCompiler_dNative_dAbi_dnativeSegHeaderBytes = 32

# 101 "Vuna/Compiler/Native/Abi.vuna"
let v_Vuna_dCompiler_dNative_dAbi_dnativeHeapBytes = 1048576

# 105 "Vuna/Compiler/Native/Abi.vuna"
let v_Vuna_dCompiler_dNative_dAbi_dnativeHeapSegLabel = "rt_heap_seg"

# 109 "Vuna/Compiler/Native/Abi.vuna"
let v_Vuna_dCompiler_dNative_dAbi_dnativeHeapLabel = "rt_heap"

# 113 "Vuna/Compiler/Native/Abi.vuna"
let v_Vuna_dCompiler_dNative_dAbi_dnativeHeapEndLabel = "rt_heap_end"

# 117 "Vuna/Compiler/Native/Abi.vuna"
let v_Vuna_dCompiler_dNative_dAbi_dnativeHeapPtrLabel = "rt_heap_ptr"

# 121 "Vuna/Compiler/Native/Abi.vuna"
let v_Vuna_dCompiler_dNative_dAbi_dnativeArenaEndLabel = "rt_arena_end"

# 125 "Vuna/Compiler/Native/Abi.vuna"
let v_Vuna_dCompiler_dNative_dAbi_dnativeSegsLabel = "rt_segs"

# 129 "Vuna/Compiler/Native/Abi.vuna"
let v_Vuna_dCompiler_dNative_dAbi_dnativeCurSegLabel = "rt_cur_seg"

# 133 "Vuna/Compiler/Native/Abi.vuna"
let v_Vuna_dCompiler_dNative_dAbi_dnativeFreeTableLabel = "rt_free_tbl"

# 137 "Vuna/Compiler/Native/Abi.vuna"
let v_Vuna_dCompiler_dNative_dAbi_dnativeHugeFreeLabel = "rt_huge_free"

# 141 "Vuna/Compiler/Native/Abi.vuna"
let v_Vuna_dCompiler_dNative_dAbi_dnativeGcMinDefaultBytes = 1048576

# 148 "Vuna/Compiler/Native/Abi.vuna"
let v_Vuna_dCompiler_dNative_dAbi_dnativeHandlersLabel = "rt_handlers"

# 152 "Vuna/Compiler/Native/Abi.vuna"
let v_Vuna_dCompiler_dNative_dAbi_dnativeStackTopLabel = "rt_stack_top"

# 156 "Vuna/Compiler/Native/Abi.vuna"
let v_Vuna_dCompiler_dNative_dAbi_dnativeSelfLabel = "rt_self"

# 160 "Vuna/Compiler/Native/Abi.vuna"
let v_Vuna_dCompiler_dNative_dAbi_dnativeCleanupHeadLabel = "rt_cleanups"

# 167 "Vuna/Compiler/Native/Abi.vuna"
let v_Vuna_dCompiler_dNative_dAbi_dnativePrologue = (fun frame -> ((Base_dList.v_Base_dList_dappend (Base_dList.C_Base_dList_dList__x58__x58_ ((Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dInstr_IPush (Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dReg_Rbp)), (Base_dList.C_Base_dList_dList__x58__x58_ ((Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dInstr_IMov ((Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dOperand_OpReg (Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dReg_Rbp)), (Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dOperand_OpReg (Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dReg_Rsp)))), Base_dList.C_Base_dList_dList_Nil))))) (if (frame = 0) then Base_dList.C_Base_dList_dList_Nil else (Base_dList.C_Base_dList_dList__x58__x58_ ((Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dInstr_IBinReg ("sub", Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dReg_Rsp, (Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dOperand_OpImm (frame)))), Base_dList.C_Base_dList_dList_Nil)))))

# 173 "Vuna/Compiler/Native/Abi.vuna"
let v_Vuna_dCompiler_dNative_dAbi_dnativeEpilogue = (Base_dList.C_Base_dList_dList__x58__x58_ ((Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dInstr_IMov ((Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dOperand_OpReg (Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dReg_Rsp)), (Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dOperand_OpReg (Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dReg_Rbp)))), (Base_dList.C_Base_dList_dList__x58__x58_ ((Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dInstr_IPop (Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dReg_Rbp)), (Base_dList.C_Base_dList_dList__x58__x58_ (Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dInstr_IRet, Base_dList.C_Base_dList_dList_Nil))))))

# 182 "Vuna/Compiler/Native/Abi.vuna"
let rec v_Vuna_dCompiler_dNative_dAbi_dmapRetTo = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__0, dtb__1) -> (match dtb__0 with
  | Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dInstr_IRet -> (Base_dList.C_Base_dList_dList__x58__x58_ ((Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dInstr_IJmp (mc0)), ((v_Vuna_dCompiler_dNative_dAbi_dmapRetTo mc0) dtb__1)))
  | _ -> (Base_dList.C_Base_dList_dList__x58__x58_ (dtb__0, ((v_Vuna_dCompiler_dNative_dAbi_dmapRetTo mc0) dtb__1)))
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 203 "Vuna/Compiler/Native/Abi.vuna"
let v_Vuna_dCompiler_dNative_dAbi_disNativeNameChar = (fun c -> (if (if (if (if (c >= 48) then (c <= 57) else false) then true else (if (c >= 65) then (c <= 90) else false)) then true else (if (c >= 97) then (c <= 122) else false)) then true else (c = 95)))

# 206 "Vuna/Compiler/Native/Abi.vuna"
let v_Vuna_dCompiler_dNative_dAbi_dnativeNameChar = (fun c -> (if (v_Vuna_dCompiler_dNative_dAbi_disNativeNameChar c) then (Base_dList.dtp_pack (Base_dList.C_Base_dList_dList__x58__x58_ (c, Base_dList.C_Base_dList_dList_Nil))) else (String.concat "" ["_x"; (bi_strFromInt c); "_"])))

# 210 "Vuna/Compiler/Native/Abi.vuna"
let v_Vuna_dCompiler_dNative_dAbi_dnativeName = (fun name -> (Base_dList.dtp_pack ((Base_dList.v_Base_dList_dconcatMap (fun c -> (Base_dList.dtp_unpack (v_Vuna_dCompiler_dNative_dAbi_dnativeNameChar c)))) (Base_dList.dtp_unpack name))))

# 214 "Vuna/Compiler/Native/Abi.vuna"
let v_Vuna_dCompiler_dNative_dAbi_dnativeFuncLabel = (fun name -> ("vuna_" ^ (v_Vuna_dCompiler_dNative_dAbi_dnativeName name)))

# 218 "Vuna/Compiler/Native/Abi.vuna"
let v_Vuna_dCompiler_dNative_dAbi_dnativeRtLabel = (fun name -> ("rt_" ^ (v_Vuna_dCompiler_dNative_dAbi_dnativeName name)))

# 177 "Vuna/Compiler/Native/Abi.vuna"
let v_Vuna_dCompiler_dNative_dAbi_dstackGuardInstrs = (Base_dList.C_Base_dList_dList__x58__x58_ ((Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dInstr_ICmp ((Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dOperand_OpReg (Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dReg_Rsp)), (Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dOperand_OpRip ("rt_stack_limit")))), (Base_dList.C_Base_dList_dList__x58__x58_ ((Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dInstr_IJcc ("jb", (v_Vuna_dCompiler_dNative_dAbi_dnativeRtLabel "trap_stack_overflow"))), Base_dList.C_Base_dList_dList_Nil))))

# 189 "Vuna/Compiler/Native/Abi.vuna"
let v_Vuna_dCompiler_dNative_dAbi_drtFunc = (fun name frame body -> ((fun endLabel -> { Vuna_dCompiler_dNative_dModel.f_Vuna_dCompiler_dNative_dModel_dNativeFunc_nfLabel = (v_Vuna_dCompiler_dNative_dAbi_dnativeRtLabel name); Vuna_dCompiler_dNative_dModel.f_Vuna_dCompiler_dNative_dModel_dNativeFunc_nfFrame = frame; Vuna_dCompiler_dNative_dModel.f_Vuna_dCompiler_dNative_dModel_dNativeFunc_nfBody = ((Base_dList.v_Base_dList_dappend (v_Vuna_dCompiler_dNative_dAbi_dnativePrologue frame)) ((Base_dList.v_Base_dList_dappend v_Vuna_dCompiler_dNative_dAbi_dstackGuardInstrs) ((Base_dList.v_Base_dList_dappend ((v_Vuna_dCompiler_dNative_dAbi_dmapRetTo endLabel) body)) ((Base_dList.v_Base_dList_dappend (Base_dList.C_Base_dList_dList__x58__x58_ ((Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dInstr_ILabel (endLabel)), Base_dList.C_Base_dList_dList_Nil))) v_Vuna_dCompiler_dNative_dAbi_dnativeEpilogue)))) }) ((v_Vuna_dCompiler_dNative_dAbi_dnativeRtLabel name) ^ "_end")))

# 197 "Vuna/Compiler/Native/Abi.vuna"
let v_Vuna_dCompiler_dNative_dAbi_drtRawFunc = (fun name body -> { Vuna_dCompiler_dNative_dModel.f_Vuna_dCompiler_dNative_dModel_dNativeFunc_nfLabel = (v_Vuna_dCompiler_dNative_dAbi_dnativeRtLabel name); Vuna_dCompiler_dNative_dModel.f_Vuna_dCompiler_dNative_dModel_dNativeFunc_nfFrame = 0; Vuna_dCompiler_dNative_dModel.f_Vuna_dCompiler_dNative_dModel_dNativeFunc_nfBody = body })

# 222 "Vuna/Compiler/Native/Abi.vuna"
let v_Vuna_dCompiler_dNative_dAbi_dnativeGlobalValueLabel = (fun name -> ("vuna_gv_" ^ (v_Vuna_dCompiler_dNative_dAbi_dnativeName name)))

# 226 "Vuna/Compiler/Native/Abi.vuna"
let v_Vuna_dCompiler_dNative_dAbi_dnativeRtValueLabel = (fun sym -> ("rt_gv_" ^ (v_Vuna_dCompiler_dNative_dAbi_dnativeName sym)))

# 230 "Vuna/Compiler/Native/Abi.vuna"
let v_Vuna_dCompiler_dNative_dAbi_dnativeEntryLabel = "_start"

# 235 "Vuna/Compiler/Native/Abi.vuna"
let v_Vuna_dCompiler_dNative_dAbi_dnativeJumpLabel = (fun n -> (".L" ^ (bi_strFromInt n)))

# 239 "Vuna/Compiler/Native/Abi.vuna"
let v_Vuna_dCompiler_dNative_dAbi_dnativeDataLabel = (fun name -> ("rt_data_" ^ (v_Vuna_dCompiler_dNative_dAbi_dnativeName name)))

# 243 "Vuna/Compiler/Native/Abi.vuna"
let v_Vuna_dCompiler_dNative_dAbi_dnativeStrLitLabel = (fun n -> ("rt_lit_" ^ (bi_strFromInt n)))
