open Vuna_runtime
# 25 "Vuna/Compiler/Native/Render.vuna"
let v_indent = (fun (line : string) -> ("  " ^ line))

# 28 "Vuna/Compiler/Native/Render.vuna"
let v_memText = (fun (base : Native_dModel.t_Reg) (off : int) -> (if (off = 0) then (String.concat "" ["["; (Native_dModel.v_regText base); "]"]) else (if (off < 0) then (String.concat "" ["["; (Native_dModel.v_regText base); "-"; (bi_strFromInt (0 - off)); "]"]) else (String.concat "" ["["; (Native_dModel.v_regText base); "+"; (bi_strFromInt off); "]"]))))

# 37 "Vuna/Compiler/Native/Render.vuna"
let v_memXText = (fun (base : Native_dModel.t_Reg) (idx : Native_dModel.t_Reg) (off : int) -> (if (off = 0) then (String.concat "" ["["; (Native_dModel.v_regText base); "+"; (Native_dModel.v_regText idx); "]"]) else (if (off < 0) then (String.concat "" ["["; (Native_dModel.v_regText base); "+"; (Native_dModel.v_regText idx); "-"; (bi_strFromInt (0 - off)); "]"]) else (String.concat "" ["["; (Native_dModel.v_regText base); "+"; (Native_dModel.v_regText idx); "+"; (bi_strFromInt off); "]"]))))

# 46 "Vuna/Compiler/Native/Render.vuna"
let v_renderOperand = (fun (mc0 : Native_dModel.t_Operand) -> (match mc0 with
  | Native_dModel.C_Operand_OpRip (dtb__0) -> (String.concat "" ["[rip + "; dtb__0; "]"])
  | Native_dModel.C_Operand_OpMemX (dtb__1, dtb__2, dtb__3) -> (((v_memXText dtb__1) dtb__2) dtb__3)
  | Native_dModel.C_Operand_OpMem (dtb__4, dtb__5) -> ((v_memText dtb__4) dtb__5)
  | Native_dModel.C_Operand_OpImm (dtb__6) -> (bi_strFromInt dtb__6)
  | Native_dModel.C_Operand_OpReg (dtb__7) -> (Native_dModel.v_regText dtb__7)
  | _ -> failwith "DT: impossible branch"
))

# 53 "Vuna/Compiler/Native/Render.vuna"
let v_isMemOperand = (fun (mc0 : Native_dModel.t_Operand) -> (match mc0 with
  | Native_dModel.C_Operand_OpMemX (dtb__8, dtb__9, dtb__10) -> true
  | Native_dModel.C_Operand_OpMem (dtb__11, dtb__12) -> true
  | _ -> false
))

# 58 "Vuna/Compiler/Native/Render.vuna"
let v_renderMov = (fun (dst : Native_dModel.t_Operand) (src : Native_dModel.t_Operand) -> (if (v_isMemOperand dst) then (String.concat "" ["mov qword ptr "; (v_renderOperand dst); ", "; (v_renderOperand src)]) else (String.concat "" ["mov "; (v_renderOperand dst); ", "; (v_renderOperand src)])))

# 65 "Vuna/Compiler/Native/Render.vuna"
let v_isShiftOp = (fun (op : string) -> (if (if (op = "shl") then true else (op = "shr")) then true else (op = "sar")))

# 68 "Vuna/Compiler/Native/Render.vuna"
let v_renderBinReg = (fun (mc0 : string) (mc1 : Native_dModel.t_Reg) (mc2 : Native_dModel.t_Operand) -> (match mc2 with
  | Native_dModel.C_Operand_OpReg (dtb__13) -> (match dtb__13 with
  | Native_dModel.C_Reg_Rcx -> (if (v_isShiftOp mc0) then (String.concat "" [mc0; " "; (Native_dModel.v_regText mc1); ", cl"]) else (String.concat "" [mc0; " "; (Native_dModel.v_regText mc1); ", "; (v_renderOperand (Native_dModel.C_Operand_OpReg (Native_dModel.C_Reg_Rcx)))]))
  | _ -> (String.concat "" [mc0; " "; (Native_dModel.v_regText mc1); ", "; (v_renderOperand mc2)])
)
  | _ -> (String.concat "" [mc0; " "; (Native_dModel.v_regText mc1); ", "; (v_renderOperand mc2)])
))

# 76 "Vuna/Compiler/Native/Render.vuna"
let v_renderByteOp = (fun (op : Native_dModel.t_Operand) -> ("byte ptr " ^ (v_renderOperand op)))

# 79 "Vuna/Compiler/Native/Render.vuna"
let v_renderInstr = (fun (mc0 : Native_dModel.t_Instr) -> (match mc0 with
  | Native_dModel.C_Instr_INop -> "nop"
  | Native_dModel.C_Instr_IPop (dtb__14) -> ("pop " ^ (Native_dModel.v_regText dtb__14))
  | Native_dModel.C_Instr_IPush (dtb__15) -> ("push " ^ (Native_dModel.v_regText dtb__15))
  | Native_dModel.C_Instr_ISyscall -> "syscall"
  | Native_dModel.C_Instr_IRet -> "ret"
  | Native_dModel.C_Instr_IXmmFromReg (dtb__16, dtb__17) -> (String.concat "" ["movq xmm"; (bi_strFromInt dtb__16); ", "; (Native_dModel.v_regText dtb__17)])
  | Native_dModel.C_Instr_IXmmToReg (dtb__18, dtb__19) -> (String.concat "" ["movq "; (Native_dModel.v_regText dtb__18); ", xmm"; (bi_strFromInt dtb__19)])
  | Native_dModel.C_Instr_IXmmCmp (dtb__20, dtb__21) -> (String.concat "" ["ucomisd xmm"; (bi_strFromInt dtb__20); ", xmm"; (bi_strFromInt dtb__21)])
  | Native_dModel.C_Instr_IXmmUnop (dtb__22, dtb__23) -> (String.concat "" [dtb__22; "sd xmm"; (bi_strFromInt dtb__23); ", xmm"; (bi_strFromInt dtb__23)])
  | Native_dModel.C_Instr_IXmmBin (dtb__24, dtb__25, dtb__26) -> (String.concat "" [dtb__24; "sd xmm"; (bi_strFromInt dtb__25); ", xmm"; (bi_strFromInt dtb__26)])
  | Native_dModel.C_Instr_IXmmToInt (dtb__27, dtb__28) -> (String.concat "" ["cvttsd2si "; (Native_dModel.v_regText dtb__27); ", xmm"; (bi_strFromInt dtb__28)])
  | Native_dModel.C_Instr_IXmmFromInt (dtb__29, dtb__30) -> (String.concat "" ["cvtsi2sd xmm"; (bi_strFromInt dtb__29); ", "; (Native_dModel.v_regText dtb__30)])
  | Native_dModel.C_Instr_IXmmStore (dtb__31, dtb__32) -> (String.concat "" ["movsd qword ptr "; (v_renderOperand dtb__31); ", xmm"; (bi_strFromInt dtb__32)])
  | Native_dModel.C_Instr_IXmmLoad (dtb__33, dtb__34) -> (String.concat "" ["movsd xmm"; (bi_strFromInt dtb__33); ", qword ptr "; (v_renderOperand dtb__34)])
  | Native_dModel.C_Instr_ICallReg (dtb__35) -> ("call " ^ (Native_dModel.v_regText dtb__35))
  | Native_dModel.C_Instr_ICall (dtb__36) -> ("call " ^ dtb__36)
  | Native_dModel.C_Instr_IJcc (dtb__37, dtb__38) -> (String.concat "" [dtb__37; " "; dtb__38])
  | Native_dModel.C_Instr_IJmpReg (dtb__39) -> ("jmp " ^ (Native_dModel.v_regText dtb__39))
  | Native_dModel.C_Instr_IJmp (dtb__40) -> ("jmp " ^ dtb__40)
  | Native_dModel.C_Instr_ILabel (dtb__41) -> (dtb__41 ^ ":")
  | Native_dModel.C_Instr_IRepeCmpsb -> "repe cmpsb"
  | Native_dModel.C_Instr_IRepMovsb -> "rep movsb"
  | Native_dModel.C_Instr_IDivUnsigned (dtb__42) -> ("div " ^ (Native_dModel.v_regText dtb__42))
  | Native_dModel.C_Instr_IDiv (dtb__43) -> ("idiv " ^ (Native_dModel.v_regText dtb__43))
  | Native_dModel.C_Instr_ICqo -> "cqo"
  | Native_dModel.C_Instr_INeg (dtb__44) -> ("neg " ^ (Native_dModel.v_regText dtb__44))
  | Native_dModel.C_Instr_ISetcc (dtb__45, dtb__46) -> (String.concat "" [dtb__45; " "; (Native_dModel.v_reg8Text dtb__46)])
  | Native_dModel.C_Instr_ITest (dtb__47, dtb__48) -> (String.concat "" ["test "; (Native_dModel.v_regText dtb__47); ", "; (Native_dModel.v_regText dtb__48)])
  | Native_dModel.C_Instr_ICmp (dtb__49, dtb__50) -> (if (v_isMemOperand dtb__49) then (String.concat "" ["cmp qword ptr "; (v_renderOperand dtb__49); ", "; (v_renderOperand dtb__50)]) else (String.concat "" ["cmp "; (v_renderOperand dtb__49); ", "; (v_renderOperand dtb__50)]))
  | Native_dModel.C_Instr_IBinReg (dtb__51, dtb__52, dtb__53) -> (((v_renderBinReg dtb__51) dtb__52) dtb__53)
  | Native_dModel.C_Instr_IBin (dtb__54, dtb__55) -> (String.concat "" [dtb__54; " rax, "; (v_renderOperand dtb__55)])
  | Native_dModel.C_Instr_ILeaMem (dtb__56, dtb__57, dtb__58) -> (String.concat "" ["lea "; (Native_dModel.v_regText dtb__56); ", "; ((v_memText dtb__57) dtb__58)])
  | Native_dModel.C_Instr_ILea (dtb__59, dtb__60) -> (String.concat "" ["lea "; (Native_dModel.v_regText dtb__59); ", [rip + "; dtb__60; "]"])
  | Native_dModel.C_Instr_IMovzxAl -> "movzx rax, al"
  | Native_dModel.C_Instr_IMovzx (dtb__61, dtb__62) -> (String.concat "" ["movzx "; (Native_dModel.v_regText dtb__61); ", "; (v_renderByteOp dtb__62)])
  | Native_dModel.C_Instr_IMovByteRegOp (dtb__63, dtb__64) -> (String.concat "" ["mov "; (v_renderByteOp dtb__63); ", "; (Native_dModel.v_reg8Text dtb__64)])
  | Native_dModel.C_Instr_IMovByteOp (dtb__65, dtb__66) -> (String.concat "" ["mov "; (v_renderByteOp dtb__65); ", "; (bi_strFromInt dtb__66)])
  | Native_dModel.C_Instr_IMov (dtb__67, dtb__68) -> ((v_renderMov dtb__67) dtb__68)
  | _ -> failwith "DT: impossible branch"
))

# 133 "Vuna/Compiler/Native/Render.vuna"
let v_padOct = (fun (c : int) -> ((fun a -> ((fun b -> ((fun d -> (String.concat "" [(bi_strFromInt a); (bi_strFromInt b); (bi_strFromInt d)])) ((c - (a * 64)) - (b * 8)))) ((if 8 = 0 then failwith "division by zero" else c / 8) - (a * 8)))) (if 64 = 0 then failwith "division by zero" else c / 64)))

# 128 "Vuna/Compiler/Native/Render.vuna"
let v_asmEscapeChar = (fun (mc0 : int) -> (if (mc0 = 34) then "\\\"" else (if (mc0 = 92) then "\\\\" else (if (if (mc0 >= 32) then (mc0 <= 126) else false) then (B_dData_dList.dtp_pack (B_dData_dList.C_List__x58__x58_ (mc0, B_dData_dList.C_List_Nil))) else ("\\" ^ (v_padOct mc0))))))

# 141 "Vuna/Compiler/Native/Render.vuna"
let v_asmString = (fun (s : string) -> (B_dData_dList.dtp_pack ((B_dData_dList.v_concatMap (fun (c : int) -> (B_dData_dList.dtp_unpack (v_asmEscapeChar c)))) (B_dData_dList.dtp_unpack s))))

# 144 "Vuna/Compiler/Native/Render.vuna"
let v_renderRodata = (fun (d : Native_dModel.t_NativeRodata) -> (B_dData_dList.C_List__x58__x58_ ((".globl " ^ (d).Native_dModel.f_NativeRodata_nrLabel), (B_dData_dList.C_List__x58__x58_ (((d).Native_dModel.f_NativeRodata_nrLabel ^ ":"), (B_dData_dList.C_List__x58__x58_ ((v_indent (String.concat "" [".ascii \""; (v_asmString (d).Native_dModel.f_NativeRodata_nrText); "\""])), B_dData_dList.C_List_Nil)))))))

# 148 "Vuna/Compiler/Native/Render.vuna"
let v_renderStrLit = (fun (l : Native_dModel.t_NativeStrLit) -> (B_dData_dList.C_List__x58__x58_ (((l).Native_dModel.f_NativeStrLit_nsLabel ^ ":"), (B_dData_dList.C_List__x58__x58_ ((v_indent (".quad " ^ (bi_strFromInt (bi_strLength (l).Native_dModel.f_NativeStrLit_nsText)))), (B_dData_dList.C_List__x58__x58_ ((v_indent (String.concat "" [".ascii \""; (v_asmString (l).Native_dModel.f_NativeStrLit_nsText); "\""])), B_dData_dList.C_List_Nil)))))))

# 156 "Vuna/Compiler/Native/Render.vuna"
let v_renderBss = (fun (b : Native_dModel.t_NativeBss) -> ((fun alignLine -> ((fun dataLine -> ((B_dData_dList.v_append (B_dData_dList.C_List__x58__x58_ ((".globl " ^ (b).Native_dModel.f_NativeBss_nbLabel), B_dData_dList.C_List_Nil))) ((B_dData_dList.v_append alignLine) ((B_dData_dList.v_append (B_dData_dList.C_List__x58__x58_ (((b).Native_dModel.f_NativeBss_nbLabel ^ ":"), B_dData_dList.C_List_Nil))) dataLine)))) (if ((b).Native_dModel.f_NativeBss_nbSize > 0) then (B_dData_dList.C_List__x58__x58_ ((v_indent (".zero " ^ (bi_strFromInt (b).Native_dModel.f_NativeBss_nbSize))), B_dData_dList.C_List_Nil)) else B_dData_dList.C_List_Nil))) (if ((b).Native_dModel.f_NativeBss_nbAlign > 0) then (B_dData_dList.C_List__x58__x58_ ((".align " ^ (bi_strFromInt (b).Native_dModel.f_NativeBss_nbAlign)), B_dData_dList.C_List_Nil)) else B_dData_dList.C_List_Nil)))

# 163 "Vuna/Compiler/Native/Render.vuna"
let v_renderClosure = (fun (c : Native_dModel.t_NativeClosure) -> (B_dData_dList.C_List__x58__x58_ ((".globl " ^ (c).Native_dModel.f_NativeClosure_ncLabel), (B_dData_dList.C_List__x58__x58_ (((c).Native_dModel.f_NativeClosure_ncLabel ^ ":"), (B_dData_dList.C_List__x58__x58_ ((v_indent (".quad " ^ (c).Native_dModel.f_NativeClosure_ncCode)), (B_dData_dList.C_List__x58__x58_ ((v_indent (".quad " ^ (bi_strFromInt (c).Native_dModel.f_NativeClosure_ncArity))), B_dData_dList.C_List_Nil)))))))))

# 173 "Vuna/Compiler/Native/Render.vuna"
let v_renderFunc = (fun (f : Native_dModel.t_NativeFunc) -> ((B_dData_dList.v_append (B_dData_dList.C_List__x58__x58_ ((".globl " ^ (f).Native_dModel.f_NativeFunc_nfLabel), (B_dData_dList.C_List__x58__x58_ (((f).Native_dModel.f_NativeFunc_nfLabel ^ ":"), B_dData_dList.C_List_Nil))))) ((B_dData_dList.v_map (fun (i : Native_dModel.t_Instr) -> (v_indent (v_renderInstr i)))) (f).Native_dModel.f_NativeFunc_nfBody)))

# 181 "Vuna/Compiler/Native/Render.vuna"
let v_isEmpty = (fun mc0 -> (match mc0 with
  | B_dData_dList.C_List_Nil -> true
  | _ -> false
))

# 185 "Vuna/Compiler/Native/Render.vuna"
let rec v_memString = (fun (mc0 : string) (mc1 : string B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__69, dtb__70) -> (if (mc0 = dtb__69) then true else ((v_memString mc0) dtb__70))
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 189 "Vuna/Compiler/Native/Render.vuna"
let v_moduleKeyOfFunc = (fun (f : Native_dModel.t_NativeFunc) -> ((B_dData_dString.v_join ".") (f).Native_dModel.f_NativeFunc_nfModule))

# 192 "Vuna/Compiler/Native/Render.vuna"
let v_pushModuleKey = (fun (keys : string B_dData_dList.t_List) (k : string) -> (if ((v_memString k) keys) then keys else ((B_dData_dList.v_append keys) (B_dData_dList.C_List__x58__x58_ (k, B_dData_dList.C_List_Nil)))))

# 196 "Vuna/Compiler/Native/Render.vuna"
let v_moduleKeysOf = (fun (fs : Native_dModel.t_NativeFunc B_dData_dList.t_List) -> (((B_dData_dList.v_foldl v_pushModuleKey) B_dData_dList.C_List_Nil) ((B_dData_dList.v_map v_moduleKeyOfFunc) fs)))

# 199 "Vuna/Compiler/Native/Render.vuna"
let v_funcsOfKey = (fun (key : string) (_uarity1 : Native_dModel.t_NativeFunc B_dData_dList.t_List) -> ((B_dData_dList.v_filter (fun (f : Native_dModel.t_NativeFunc) -> ((v_moduleKeyOfFunc f) = key))) _uarity1))

# 202 "Vuna/Compiler/Native/Render.vuna"
let rec v_litsOfKey = (fun (mc0 : string) (mc1 : (string B_dData_dList.t_List, Native_dModel.t_NativeStrLit B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__71, dtb__72) -> (if (((B_dData_dString.v_join ".") (B_dData_dPair.v_firstOf dtb__71)) = mc0) then (B_dData_dPair.v_secondOf dtb__71) else ((v_litsOfKey mc0) dtb__72))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 207 "Vuna/Compiler/Native/Render.vuna"
let v_fileOfKey = (fun (key : string) -> (((B_dData_dString.v_join "/") ((B_dData_dString.v_split ".") key)) ^ ".s"))

# 210 "Vuna/Compiler/Native/Render.vuna"
let v_renderProgramFile = (fun (p : Native_dModel.t_NativeProgram) (key : string) -> ((fun isRuntime -> ((fun funcs -> ((fun rodataLits -> ((fun rodataConsts -> ((fun rodataClosures -> ((fun rodataPart -> ((fun rodataSection -> ((fun bssPart -> ((fun bssSection -> ((fun textSection -> ((fun body -> (((B_dData_dString.v_join "\n") ((B_dData_dList.v_append body) (B_dData_dList.C_List__x58__x58_ (".section .note.GNU-stack,\"\",@progbits", B_dData_dList.C_List_Nil)))) ^ "\n")) ((B_dData_dList.v_append (B_dData_dList.C_List__x58__x58_ (".intel_syntax noprefix", B_dData_dList.C_List_Nil))) ((B_dData_dList.v_append rodataSection) ((B_dData_dList.v_append bssSection) textSection))))) (B_dData_dList.C_List__x58__x58_ (".section .text", ((B_dData_dList.v_concatMap v_renderFunc) funcs))))) (if (v_isEmpty bssPart) then B_dData_dList.C_List_Nil else (B_dData_dList.C_List__x58__x58_ (".section .bss", bssPart))))) (if isRuntime then ((B_dData_dList.v_concatMap v_renderBss) (p).Native_dModel.f_NativeProgram_npBss) else B_dData_dList.C_List_Nil))) (if (v_isEmpty rodataPart) then B_dData_dList.C_List_Nil else (B_dData_dList.C_List__x58__x58_ (".section .rodata", rodataPart))))) ((B_dData_dList.v_append rodataConsts) ((B_dData_dList.v_append rodataClosures) rodataLits)))) (if isRuntime then ((B_dData_dList.v_concatMap v_renderClosure) (p).Native_dModel.f_NativeProgram_npClosures) else B_dData_dList.C_List_Nil))) (if isRuntime then ((B_dData_dList.v_concatMap v_renderRodata) (p).Native_dModel.f_NativeProgram_npRodata) else B_dData_dList.C_List_Nil))) ((B_dData_dList.v_concatMap v_renderStrLit) ((v_litsOfKey key) (p).Native_dModel.f_NativeProgram_npModuleLits)))) ((v_funcsOfKey key) (p).Native_dModel.f_NativeProgram_npFuncs))) (key = "runtime")))

# 228 "Vuna/Compiler/Native/Render.vuna"
let v_renderFiles = (fun (p : Native_dModel.t_NativeProgram) -> ((B_dData_dList.v_map (fun (k : string) -> { B_dData_dPair.f_Pair_first = (v_fileOfKey k); B_dData_dPair.f_Pair_second = ((v_renderProgramFile p) k) })) (v_moduleKeysOf (p).Native_dModel.f_NativeProgram_npFuncs)))
