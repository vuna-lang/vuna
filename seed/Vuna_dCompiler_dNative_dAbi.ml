open Vuna_runtime
# 28 "Vuna/Compiler/Native/Abi.vuna"
let v_Vuna_dCompiler_dNative_dAbi_dnativeArgRegs = (Base_dList.C_Base_dList_dList_Cons (Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dReg_Rdi, (Base_dList.C_Base_dList_dList_Cons (Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dReg_Rsi, (Base_dList.C_Base_dList_dList_Cons (Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dReg_Rdx, (Base_dList.C_Base_dList_dList_Cons (Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dReg_Rcx, (Base_dList.C_Base_dList_dList_Cons (Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dReg_R8, (Base_dList.C_Base_dList_dList_Cons (Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dReg_R9, Base_dList.C_Base_dList_dList_Nil))))))))))))

# 32 "Vuna/Compiler/Native/Abi.vuna"
let v_Vuna_dCompiler_dNative_dAbi_dnativeMaxArgs = 6

# 38 "Vuna/Compiler/Native/Abi.vuna"
let v_Vuna_dCompiler_dNative_dAbi_dnativeStackArgOff = (fun i -> (16 + (8 * (i - v_Vuna_dCompiler_dNative_dAbi_dnativeMaxArgs))))

# 42 "Vuna/Compiler/Native/Abi.vuna"
let v_Vuna_dCompiler_dNative_dAbi_dnativeSlotOff = (fun slot -> (0 - (8 * (slot + 1))))

# 46 "Vuna/Compiler/Native/Abi.vuna"
let v_Vuna_dCompiler_dNative_dAbi_dnativeFrameBytes = (fun slots -> ((fun raw -> (if (raw = 0) then 0 else ((if 16 = 0 then failwith "division by zero" else (raw + 15) / 16) * 16))) (8 * slots)))

# 56 "Vuna/Compiler/Native/Abi.vuna"
let v_Vuna_dCompiler_dNative_dAbi_dnativeStrHeaderBytes = 8

# 60 "Vuna/Compiler/Native/Abi.vuna"
let v_Vuna_dCompiler_dNative_dAbi_dnativeHeapBytes = 1048576

# 64 "Vuna/Compiler/Native/Abi.vuna"
let v_Vuna_dCompiler_dNative_dAbi_dnativeHeapLabel = "rt_heap"

# 68 "Vuna/Compiler/Native/Abi.vuna"
let v_Vuna_dCompiler_dNative_dAbi_dnativeHeapEndLabel = "rt_heap_end"

# 72 "Vuna/Compiler/Native/Abi.vuna"
let v_Vuna_dCompiler_dNative_dAbi_dnativeHeapPtrLabel = "rt_heap_ptr"

# 76 "Vuna/Compiler/Native/Abi.vuna"
let v_Vuna_dCompiler_dNative_dAbi_dnativeArenaEndLabel = "rt_arena_end"

# 83 "Vuna/Compiler/Native/Abi.vuna"
let v_Vuna_dCompiler_dNative_dAbi_dnativePrologue = (fun frame -> ((Base_dList.v_Base_dList_dappend (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dInstr_IPush (Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dReg_Rbp)), (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dInstr_IMov ((Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dOperand_OpReg (Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dReg_Rbp)), (Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dOperand_OpReg (Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dReg_Rsp)))), Base_dList.C_Base_dList_dList_Nil))))) (if (frame = 0) then Base_dList.C_Base_dList_dList_Nil else (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dInstr_IBinReg ("sub", Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dReg_Rsp, (Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dOperand_OpImm (frame)))), Base_dList.C_Base_dList_dList_Nil)))))

# 89 "Vuna/Compiler/Native/Abi.vuna"
let v_Vuna_dCompiler_dNative_dAbi_dnativeEpilogue = (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dInstr_IMov ((Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dOperand_OpReg (Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dReg_Rsp)), (Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dOperand_OpReg (Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dReg_Rbp)))), (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dInstr_IPop (Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dReg_Rbp)), (Base_dList.C_Base_dList_dList_Cons (Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dInstr_IRet, Base_dList.C_Base_dList_dList_Nil))))))

# 95 "Vuna/Compiler/Native/Abi.vuna"
let v_Vuna_dCompiler_dNative_dAbi_disNativeNameChar = (fun c -> (if (if (if (if (c >= 48) then (c <= 57) else false) then true else (if (c >= 65) then (c <= 90) else false)) then true else (if (c >= 97) then (c <= 122) else false)) then true else (c = 95)))

# 98 "Vuna/Compiler/Native/Abi.vuna"
let v_Vuna_dCompiler_dNative_dAbi_dnativeNameChar = (fun c -> (if (v_Vuna_dCompiler_dNative_dAbi_disNativeNameChar c) then (Base_dList.dtp_pack (Base_dList.C_Base_dList_dList_Cons (c, Base_dList.C_Base_dList_dList_Nil))) else (String.concat "" ["_x"; (bi_strFromInt c); "_"])))

# 102 "Vuna/Compiler/Native/Abi.vuna"
let v_Vuna_dCompiler_dNative_dAbi_dnativeName = (fun name -> (Base_dList.dtp_pack ((Base_dList.v_Base_dList_dconcatMap (fun c -> (Base_dList.dtp_unpack (v_Vuna_dCompiler_dNative_dAbi_dnativeNameChar c)))) (Base_dList.dtp_unpack name))))

# 106 "Vuna/Compiler/Native/Abi.vuna"
let v_Vuna_dCompiler_dNative_dAbi_dnativeFuncLabel = (fun name -> ("vuna_" ^ (v_Vuna_dCompiler_dNative_dAbi_dnativeName name)))

# 110 "Vuna/Compiler/Native/Abi.vuna"
let v_Vuna_dCompiler_dNative_dAbi_dnativeRtLabel = (fun name -> ("rt_" ^ (v_Vuna_dCompiler_dNative_dAbi_dnativeName name)))

# 114 "Vuna/Compiler/Native/Abi.vuna"
let v_Vuna_dCompiler_dNative_dAbi_dnativeEntryLabel = "_start"

# 119 "Vuna/Compiler/Native/Abi.vuna"
let v_Vuna_dCompiler_dNative_dAbi_dnativeJumpLabel = (fun n -> (".L" ^ (bi_strFromInt n)))

# 123 "Vuna/Compiler/Native/Abi.vuna"
let v_Vuna_dCompiler_dNative_dAbi_dnativeDataLabel = (fun name -> ("rt_data_" ^ (v_Vuna_dCompiler_dNative_dAbi_dnativeName name)))

# 127 "Vuna/Compiler/Native/Abi.vuna"
let v_Vuna_dCompiler_dNative_dAbi_dnativeStrLitLabel = (fun n -> ("rt_lit_" ^ (bi_strFromInt n)))
