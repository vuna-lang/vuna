open Vuna_runtime
# 28 "Vuna/Compiler/Native/Abi.vuna"
let v_Vuna_dCompiler_dNative_dAbi_dnativeArgRegs = (Base_dList.C_Base_dList_dList_Cons (Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dReg_Rdi, (Base_dList.C_Base_dList_dList_Cons (Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dReg_Rsi, (Base_dList.C_Base_dList_dList_Cons (Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dReg_Rdx, (Base_dList.C_Base_dList_dList_Cons (Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dReg_Rcx, (Base_dList.C_Base_dList_dList_Cons (Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dReg_R8, (Base_dList.C_Base_dList_dList_Cons (Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dReg_R9, Base_dList.C_Base_dList_dList_Nil))))))))))))

# 32 "Vuna/Compiler/Native/Abi.vuna"
let v_Vuna_dCompiler_dNative_dAbi_dnativeMaxArgs = 6

# 36 "Vuna/Compiler/Native/Abi.vuna"
let v_Vuna_dCompiler_dNative_dAbi_dnativeSlotOff = (fun slot -> (0 - (8 * (slot + 1))))

# 40 "Vuna/Compiler/Native/Abi.vuna"
let v_Vuna_dCompiler_dNative_dAbi_dnativeFrameBytes = (fun slots -> ((fun raw -> (if (raw = 0) then 0 else ((if 16 = 0 then failwith "division by zero" else (raw + 15) / 16) * 16))) (8 * slots)))

# 50 "Vuna/Compiler/Native/Abi.vuna"
let v_Vuna_dCompiler_dNative_dAbi_dnativeStrHeaderBytes = 8

# 54 "Vuna/Compiler/Native/Abi.vuna"
let v_Vuna_dCompiler_dNative_dAbi_dnativeHeapBytes = 1048576

# 58 "Vuna/Compiler/Native/Abi.vuna"
let v_Vuna_dCompiler_dNative_dAbi_dnativeHeapLabel = "rt_heap"

# 62 "Vuna/Compiler/Native/Abi.vuna"
let v_Vuna_dCompiler_dNative_dAbi_dnativeHeapEndLabel = "rt_heap_end"

# 66 "Vuna/Compiler/Native/Abi.vuna"
let v_Vuna_dCompiler_dNative_dAbi_dnativeHeapPtrLabel = "rt_heap_ptr"

# 73 "Vuna/Compiler/Native/Abi.vuna"
let v_Vuna_dCompiler_dNative_dAbi_dnativePrologue = (fun frame -> ((Base_dList.v_Base_dList_dappend (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dInstr_IPush (Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dReg_Rbp)), (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dInstr_IMov ((Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dOperand_OpReg (Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dReg_Rbp)), (Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dOperand_OpReg (Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dReg_Rsp)))), Base_dList.C_Base_dList_dList_Nil))))) (if (frame = 0) then Base_dList.C_Base_dList_dList_Nil else (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dInstr_IBinReg ("sub", Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dReg_Rsp, (Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dOperand_OpImm (frame)))), Base_dList.C_Base_dList_dList_Nil)))))

# 79 "Vuna/Compiler/Native/Abi.vuna"
let v_Vuna_dCompiler_dNative_dAbi_dnativeEpilogue = (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dInstr_IMov ((Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dOperand_OpReg (Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dReg_Rsp)), (Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dOperand_OpReg (Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dReg_Rbp)))), (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dInstr_IPop (Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dReg_Rbp)), (Base_dList.C_Base_dList_dList_Cons (Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dInstr_IRet, Base_dList.C_Base_dList_dList_Nil))))))

# 85 "Vuna/Compiler/Native/Abi.vuna"
let v_Vuna_dCompiler_dNative_dAbi_disNativeNameChar = (fun c -> (if (if (if (if (c >= 48) then (c <= 57) else false) then true else (if (c >= 65) then (c <= 90) else false)) then true else (if (c >= 97) then (c <= 122) else false)) then true else (c = 95)))

# 88 "Vuna/Compiler/Native/Abi.vuna"
let v_Vuna_dCompiler_dNative_dAbi_dnativeNameChar = (fun c -> (if (v_Vuna_dCompiler_dNative_dAbi_disNativeNameChar c) then (Base_dList.dtp_pack (Base_dList.C_Base_dList_dList_Cons (c, Base_dList.C_Base_dList_dList_Nil))) else (String.concat "" ["_x"; (bi_strFromInt c); "_"])))

# 92 "Vuna/Compiler/Native/Abi.vuna"
let v_Vuna_dCompiler_dNative_dAbi_dnativeName = (fun name -> (Base_dList.dtp_pack ((Base_dList.v_Base_dList_dconcatMap (fun c -> (Base_dList.dtp_unpack (v_Vuna_dCompiler_dNative_dAbi_dnativeNameChar c)))) (Base_dList.dtp_unpack name))))

# 96 "Vuna/Compiler/Native/Abi.vuna"
let v_Vuna_dCompiler_dNative_dAbi_dnativeFuncLabel = (fun name -> ("vuna_" ^ (v_Vuna_dCompiler_dNative_dAbi_dnativeName name)))

# 100 "Vuna/Compiler/Native/Abi.vuna"
let v_Vuna_dCompiler_dNative_dAbi_dnativeRtLabel = (fun name -> ("rt_" ^ (v_Vuna_dCompiler_dNative_dAbi_dnativeName name)))

# 104 "Vuna/Compiler/Native/Abi.vuna"
let v_Vuna_dCompiler_dNative_dAbi_dnativeEntryLabel = "_start"

# 109 "Vuna/Compiler/Native/Abi.vuna"
let v_Vuna_dCompiler_dNative_dAbi_dnativeJumpLabel = (fun n -> (".L" ^ (bi_strFromInt n)))

# 113 "Vuna/Compiler/Native/Abi.vuna"
let v_Vuna_dCompiler_dNative_dAbi_dnativeDataLabel = (fun name -> ("rt_data_" ^ (v_Vuna_dCompiler_dNative_dAbi_dnativeName name)))

# 117 "Vuna/Compiler/Native/Abi.vuna"
let v_Vuna_dCompiler_dNative_dAbi_dnativeStrLitLabel = (fun n -> ("rt_lit_" ^ (bi_strFromInt n)))
