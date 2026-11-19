open Vuna_runtime
# 25 "Vuna/Compiler/Native/Render.vuna"
let v_Vuna_dCompiler_dNative_dRender_dindent = (fun (line : string) -> ("  " ^ line))

# 28 "Vuna/Compiler/Native/Render.vuna"
let v_Vuna_dCompiler_dNative_dRender_dmemText = (fun (base : Vuna_dCompiler_dNative_dModel.t_Vuna_dCompiler_dNative_dModel_dReg) (off : int) -> (if (off = 0) then (String.concat "" ["["; (Vuna_dCompiler_dNative_dModel.v_Vuna_dCompiler_dNative_dModel_dregText base); "]"]) else (if (off < 0) then (String.concat "" ["["; (Vuna_dCompiler_dNative_dModel.v_Vuna_dCompiler_dNative_dModel_dregText base); "-"; (bi_strFromInt (0 - off)); "]"]) else (String.concat "" ["["; (Vuna_dCompiler_dNative_dModel.v_Vuna_dCompiler_dNative_dModel_dregText base); "+"; (bi_strFromInt off); "]"]))))

# 37 "Vuna/Compiler/Native/Render.vuna"
let v_Vuna_dCompiler_dNative_dRender_dmemXText = (fun (base : Vuna_dCompiler_dNative_dModel.t_Vuna_dCompiler_dNative_dModel_dReg) (idx : Vuna_dCompiler_dNative_dModel.t_Vuna_dCompiler_dNative_dModel_dReg) (off : int) -> (if (off = 0) then (String.concat "" ["["; (Vuna_dCompiler_dNative_dModel.v_Vuna_dCompiler_dNative_dModel_dregText base); "+"; (Vuna_dCompiler_dNative_dModel.v_Vuna_dCompiler_dNative_dModel_dregText idx); "]"]) else (if (off < 0) then (String.concat "" ["["; (Vuna_dCompiler_dNative_dModel.v_Vuna_dCompiler_dNative_dModel_dregText base); "+"; (Vuna_dCompiler_dNative_dModel.v_Vuna_dCompiler_dNative_dModel_dregText idx); "-"; (bi_strFromInt (0 - off)); "]"]) else (String.concat "" ["["; (Vuna_dCompiler_dNative_dModel.v_Vuna_dCompiler_dNative_dModel_dregText base); "+"; (Vuna_dCompiler_dNative_dModel.v_Vuna_dCompiler_dNative_dModel_dregText idx); "+"; (bi_strFromInt off); "]"]))))

# 46 "Vuna/Compiler/Native/Render.vuna"
let v_Vuna_dCompiler_dNative_dRender_drenderOperand = (fun (mc0 : Vuna_dCompiler_dNative_dModel.t_Vuna_dCompiler_dNative_dModel_dOperand) -> (match mc0 with
  | Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dOperand_OpRip (dtb__0) -> (String.concat "" ["[rip + "; dtb__0; "]"])
  | Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dOperand_OpMemX (dtb__1, dtb__2, dtb__3) -> (((v_Vuna_dCompiler_dNative_dRender_dmemXText dtb__1) dtb__2) dtb__3)
  | Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dOperand_OpMem (dtb__4, dtb__5) -> ((v_Vuna_dCompiler_dNative_dRender_dmemText dtb__4) dtb__5)
  | Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dOperand_OpImm (dtb__6) -> (bi_strFromInt dtb__6)
  | Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dOperand_OpReg (dtb__7) -> (Vuna_dCompiler_dNative_dModel.v_Vuna_dCompiler_dNative_dModel_dregText dtb__7)
  | _ -> failwith "DT: impossible branch"
))

# 53 "Vuna/Compiler/Native/Render.vuna"
let v_Vuna_dCompiler_dNative_dRender_disMemOperand = (fun (mc0 : Vuna_dCompiler_dNative_dModel.t_Vuna_dCompiler_dNative_dModel_dOperand) -> (match mc0 with
  | Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dOperand_OpMemX (dtb__8, dtb__9, dtb__10) -> true
  | Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dOperand_OpMem (dtb__11, dtb__12) -> true
  | _ -> false
))

# 58 "Vuna/Compiler/Native/Render.vuna"
let v_Vuna_dCompiler_dNative_dRender_drenderMov = (fun (dst : Vuna_dCompiler_dNative_dModel.t_Vuna_dCompiler_dNative_dModel_dOperand) (src : Vuna_dCompiler_dNative_dModel.t_Vuna_dCompiler_dNative_dModel_dOperand) -> (if (v_Vuna_dCompiler_dNative_dRender_disMemOperand dst) then (String.concat "" ["mov qword ptr "; (v_Vuna_dCompiler_dNative_dRender_drenderOperand dst); ", "; (v_Vuna_dCompiler_dNative_dRender_drenderOperand src)]) else (String.concat "" ["mov "; (v_Vuna_dCompiler_dNative_dRender_drenderOperand dst); ", "; (v_Vuna_dCompiler_dNative_dRender_drenderOperand src)])))

# 65 "Vuna/Compiler/Native/Render.vuna"
let v_Vuna_dCompiler_dNative_dRender_disShiftOp = (fun (op : string) -> (if (if (op = "shl") then true else (op = "shr")) then true else (op = "sar")))

# 68 "Vuna/Compiler/Native/Render.vuna"
let v_Vuna_dCompiler_dNative_dRender_drenderBinReg = (fun (mc0 : string) (mc1 : Vuna_dCompiler_dNative_dModel.t_Vuna_dCompiler_dNative_dModel_dReg) (mc2 : Vuna_dCompiler_dNative_dModel.t_Vuna_dCompiler_dNative_dModel_dOperand) -> (match mc2 with
  | Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dOperand_OpReg (dtb__13) -> (match dtb__13 with
  | Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dReg_Rcx -> (if (v_Vuna_dCompiler_dNative_dRender_disShiftOp mc0) then (String.concat "" [mc0; " "; (Vuna_dCompiler_dNative_dModel.v_Vuna_dCompiler_dNative_dModel_dregText mc1); ", cl"]) else (String.concat "" [mc0; " "; (Vuna_dCompiler_dNative_dModel.v_Vuna_dCompiler_dNative_dModel_dregText mc1); ", "; (v_Vuna_dCompiler_dNative_dRender_drenderOperand (Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dOperand_OpReg (Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dReg_Rcx)))]))
  | _ -> (String.concat "" [mc0; " "; (Vuna_dCompiler_dNative_dModel.v_Vuna_dCompiler_dNative_dModel_dregText mc1); ", "; (v_Vuna_dCompiler_dNative_dRender_drenderOperand mc2)])
)
  | _ -> (String.concat "" [mc0; " "; (Vuna_dCompiler_dNative_dModel.v_Vuna_dCompiler_dNative_dModel_dregText mc1); ", "; (v_Vuna_dCompiler_dNative_dRender_drenderOperand mc2)])
))

# 76 "Vuna/Compiler/Native/Render.vuna"
let v_Vuna_dCompiler_dNative_dRender_drenderByteOp = (fun (op : Vuna_dCompiler_dNative_dModel.t_Vuna_dCompiler_dNative_dModel_dOperand) -> ("byte ptr " ^ (v_Vuna_dCompiler_dNative_dRender_drenderOperand op)))

# 79 "Vuna/Compiler/Native/Render.vuna"
let v_Vuna_dCompiler_dNative_dRender_drenderInstr = (fun (mc0 : Vuna_dCompiler_dNative_dModel.t_Vuna_dCompiler_dNative_dModel_dInstr) -> (match mc0 with
  | Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dInstr_INop -> "nop"
  | Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dInstr_IPop (dtb__14) -> ("pop " ^ (Vuna_dCompiler_dNative_dModel.v_Vuna_dCompiler_dNative_dModel_dregText dtb__14))
  | Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dInstr_IPush (dtb__15) -> ("push " ^ (Vuna_dCompiler_dNative_dModel.v_Vuna_dCompiler_dNative_dModel_dregText dtb__15))
  | Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dInstr_ISyscall -> "syscall"
  | Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dInstr_IRet -> "ret"
  | Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dInstr_IXmmFromReg (dtb__16, dtb__17) -> (String.concat "" ["movq xmm"; (bi_strFromInt dtb__16); ", "; (Vuna_dCompiler_dNative_dModel.v_Vuna_dCompiler_dNative_dModel_dregText dtb__17)])
  | Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dInstr_IXmmToReg (dtb__18, dtb__19) -> (String.concat "" ["movq "; (Vuna_dCompiler_dNative_dModel.v_Vuna_dCompiler_dNative_dModel_dregText dtb__18); ", xmm"; (bi_strFromInt dtb__19)])
  | Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dInstr_IXmmCmp (dtb__20, dtb__21) -> (String.concat "" ["ucomisd xmm"; (bi_strFromInt dtb__20); ", xmm"; (bi_strFromInt dtb__21)])
  | Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dInstr_IXmmUnop (dtb__22, dtb__23) -> (String.concat "" [dtb__22; "sd xmm"; (bi_strFromInt dtb__23); ", xmm"; (bi_strFromInt dtb__23)])
  | Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dInstr_IXmmBin (dtb__24, dtb__25, dtb__26) -> (String.concat "" [dtb__24; "sd xmm"; (bi_strFromInt dtb__25); ", xmm"; (bi_strFromInt dtb__26)])
  | Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dInstr_IXmmToInt (dtb__27, dtb__28) -> (String.concat "" ["cvttsd2si "; (Vuna_dCompiler_dNative_dModel.v_Vuna_dCompiler_dNative_dModel_dregText dtb__27); ", xmm"; (bi_strFromInt dtb__28)])
  | Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dInstr_IXmmFromInt (dtb__29, dtb__30) -> (String.concat "" ["cvtsi2sd xmm"; (bi_strFromInt dtb__29); ", "; (Vuna_dCompiler_dNative_dModel.v_Vuna_dCompiler_dNative_dModel_dregText dtb__30)])
  | Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dInstr_IXmmStore (dtb__31, dtb__32) -> (String.concat "" ["movsd qword ptr "; (v_Vuna_dCompiler_dNative_dRender_drenderOperand dtb__31); ", xmm"; (bi_strFromInt dtb__32)])
  | Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dInstr_IXmmLoad (dtb__33, dtb__34) -> (String.concat "" ["movsd xmm"; (bi_strFromInt dtb__33); ", qword ptr "; (v_Vuna_dCompiler_dNative_dRender_drenderOperand dtb__34)])
  | Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dInstr_ICallReg (dtb__35) -> ("call " ^ (Vuna_dCompiler_dNative_dModel.v_Vuna_dCompiler_dNative_dModel_dregText dtb__35))
  | Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dInstr_ICall (dtb__36) -> ("call " ^ dtb__36)
  | Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dInstr_IJcc (dtb__37, dtb__38) -> (String.concat "" [dtb__37; " "; dtb__38])
  | Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dInstr_IJmpReg (dtb__39) -> ("jmp " ^ (Vuna_dCompiler_dNative_dModel.v_Vuna_dCompiler_dNative_dModel_dregText dtb__39))
  | Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dInstr_IJmp (dtb__40) -> ("jmp " ^ dtb__40)
  | Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dInstr_ILabel (dtb__41) -> (dtb__41 ^ ":")
  | Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dInstr_IRepeCmpsb -> "repe cmpsb"
  | Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dInstr_IRepMovsb -> "rep movsb"
  | Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dInstr_IDivUnsigned (dtb__42) -> ("div " ^ (Vuna_dCompiler_dNative_dModel.v_Vuna_dCompiler_dNative_dModel_dregText dtb__42))
  | Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dInstr_IDiv (dtb__43) -> ("idiv " ^ (Vuna_dCompiler_dNative_dModel.v_Vuna_dCompiler_dNative_dModel_dregText dtb__43))
  | Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dInstr_ICqo -> "cqo"
  | Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dInstr_INeg (dtb__44) -> ("neg " ^ (Vuna_dCompiler_dNative_dModel.v_Vuna_dCompiler_dNative_dModel_dregText dtb__44))
  | Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dInstr_ISetcc (dtb__45, dtb__46) -> (String.concat "" [dtb__45; " "; (Vuna_dCompiler_dNative_dModel.v_Vuna_dCompiler_dNative_dModel_dreg8Text dtb__46)])
  | Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dInstr_ITest (dtb__47, dtb__48) -> (String.concat "" ["test "; (Vuna_dCompiler_dNative_dModel.v_Vuna_dCompiler_dNative_dModel_dregText dtb__47); ", "; (Vuna_dCompiler_dNative_dModel.v_Vuna_dCompiler_dNative_dModel_dregText dtb__48)])
  | Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dInstr_ICmp (dtb__49, dtb__50) -> (if (v_Vuna_dCompiler_dNative_dRender_disMemOperand dtb__49) then (String.concat "" ["cmp qword ptr "; (v_Vuna_dCompiler_dNative_dRender_drenderOperand dtb__49); ", "; (v_Vuna_dCompiler_dNative_dRender_drenderOperand dtb__50)]) else (String.concat "" ["cmp "; (v_Vuna_dCompiler_dNative_dRender_drenderOperand dtb__49); ", "; (v_Vuna_dCompiler_dNative_dRender_drenderOperand dtb__50)]))
  | Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dInstr_IBinReg (dtb__51, dtb__52, dtb__53) -> (((v_Vuna_dCompiler_dNative_dRender_drenderBinReg dtb__51) dtb__52) dtb__53)
  | Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dInstr_IBin (dtb__54, dtb__55) -> (String.concat "" [dtb__54; " rax, "; (v_Vuna_dCompiler_dNative_dRender_drenderOperand dtb__55)])
  | Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dInstr_ILeaMem (dtb__56, dtb__57, dtb__58) -> (String.concat "" ["lea "; (Vuna_dCompiler_dNative_dModel.v_Vuna_dCompiler_dNative_dModel_dregText dtb__56); ", "; ((v_Vuna_dCompiler_dNative_dRender_dmemText dtb__57) dtb__58)])
  | Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dInstr_ILea (dtb__59, dtb__60) -> (String.concat "" ["lea "; (Vuna_dCompiler_dNative_dModel.v_Vuna_dCompiler_dNative_dModel_dregText dtb__59); ", [rip + "; dtb__60; "]"])
  | Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dInstr_IMovzxAl -> "movzx rax, al"
  | Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dInstr_IMovzx (dtb__61, dtb__62) -> (String.concat "" ["movzx "; (Vuna_dCompiler_dNative_dModel.v_Vuna_dCompiler_dNative_dModel_dregText dtb__61); ", "; (v_Vuna_dCompiler_dNative_dRender_drenderByteOp dtb__62)])
  | Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dInstr_IMovByteRegOp (dtb__63, dtb__64) -> (String.concat "" ["mov "; (v_Vuna_dCompiler_dNative_dRender_drenderByteOp dtb__63); ", "; (Vuna_dCompiler_dNative_dModel.v_Vuna_dCompiler_dNative_dModel_dreg8Text dtb__64)])
  | Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dInstr_IMovByteOp (dtb__65, dtb__66) -> (String.concat "" ["mov "; (v_Vuna_dCompiler_dNative_dRender_drenderByteOp dtb__65); ", "; (bi_strFromInt dtb__66)])
  | Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dInstr_IMov (dtb__67, dtb__68) -> ((v_Vuna_dCompiler_dNative_dRender_drenderMov dtb__67) dtb__68)
  | _ -> failwith "DT: impossible branch"
))

# 133 "Vuna/Compiler/Native/Render.vuna"
let v_Vuna_dCompiler_dNative_dRender_dpadOct = (fun (c : int) -> ((fun a -> ((fun b -> ((fun d -> (String.concat "" [(bi_strFromInt a); (bi_strFromInt b); (bi_strFromInt d)])) ((c - (a * 64)) - (b * 8)))) ((if 8 = 0 then failwith "division by zero" else c / 8) - (a * 8)))) (if 64 = 0 then failwith "division by zero" else c / 64)))

# 128 "Vuna/Compiler/Native/Render.vuna"
let v_Vuna_dCompiler_dNative_dRender_dasmEscapeChar = (fun (mc0 : int) -> (if (mc0 = 34) then "\\\"" else (if (mc0 = 92) then "\\\\" else (if (if (mc0 >= 32) then (mc0 <= 126) else false) then (Base_dData_dList.dtp_pack (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (mc0, Base_dData_dList.C_Base_dData_dList_dList_Nil))) else ("\\" ^ (v_Vuna_dCompiler_dNative_dRender_dpadOct mc0))))))

# 141 "Vuna/Compiler/Native/Render.vuna"
let v_Vuna_dCompiler_dNative_dRender_dasmString = (fun (s : string) -> (Base_dData_dList.dtp_pack ((Base_dData_dList.v_Base_dData_dList_dconcatMap (fun (c : int) -> (Base_dData_dList.dtp_unpack (v_Vuna_dCompiler_dNative_dRender_dasmEscapeChar c)))) (Base_dData_dList.dtp_unpack s))))

# 144 "Vuna/Compiler/Native/Render.vuna"
let v_Vuna_dCompiler_dNative_dRender_drenderRodata = (fun (d : Vuna_dCompiler_dNative_dModel.t_Vuna_dCompiler_dNative_dModel_dNativeRodata) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ((".globl " ^ (d).Vuna_dCompiler_dNative_dModel.f_Vuna_dCompiler_dNative_dModel_dNativeRodata_nrLabel), (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (((d).Vuna_dCompiler_dNative_dModel.f_Vuna_dCompiler_dNative_dModel_dNativeRodata_nrLabel ^ ":"), (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ((v_Vuna_dCompiler_dNative_dRender_dindent (String.concat "" [".ascii \""; (v_Vuna_dCompiler_dNative_dRender_dasmString (d).Vuna_dCompiler_dNative_dModel.f_Vuna_dCompiler_dNative_dModel_dNativeRodata_nrText); "\""])), Base_dData_dList.C_Base_dData_dList_dList_Nil)))))))

# 148 "Vuna/Compiler/Native/Render.vuna"
let v_Vuna_dCompiler_dNative_dRender_drenderStrLit = (fun (l : Vuna_dCompiler_dNative_dModel.t_Vuna_dCompiler_dNative_dModel_dNativeStrLit) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (((l).Vuna_dCompiler_dNative_dModel.f_Vuna_dCompiler_dNative_dModel_dNativeStrLit_nsLabel ^ ":"), (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ((v_Vuna_dCompiler_dNative_dRender_dindent (".quad " ^ (bi_strFromInt (bi_strLength (l).Vuna_dCompiler_dNative_dModel.f_Vuna_dCompiler_dNative_dModel_dNativeStrLit_nsText)))), (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ((v_Vuna_dCompiler_dNative_dRender_dindent (String.concat "" [".ascii \""; (v_Vuna_dCompiler_dNative_dRender_dasmString (l).Vuna_dCompiler_dNative_dModel.f_Vuna_dCompiler_dNative_dModel_dNativeStrLit_nsText); "\""])), Base_dData_dList.C_Base_dData_dList_dList_Nil)))))))

# 156 "Vuna/Compiler/Native/Render.vuna"
let v_Vuna_dCompiler_dNative_dRender_drenderBss = (fun (b : Vuna_dCompiler_dNative_dModel.t_Vuna_dCompiler_dNative_dModel_dNativeBss) -> ((fun alignLine -> ((fun dataLine -> ((Base_dData_dList.v_Base_dData_dList_dappend (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ((".globl " ^ (b).Vuna_dCompiler_dNative_dModel.f_Vuna_dCompiler_dNative_dModel_dNativeBss_nbLabel), Base_dData_dList.C_Base_dData_dList_dList_Nil))) ((Base_dData_dList.v_Base_dData_dList_dappend alignLine) ((Base_dData_dList.v_Base_dData_dList_dappend (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (((b).Vuna_dCompiler_dNative_dModel.f_Vuna_dCompiler_dNative_dModel_dNativeBss_nbLabel ^ ":"), Base_dData_dList.C_Base_dData_dList_dList_Nil))) dataLine)))) (if ((b).Vuna_dCompiler_dNative_dModel.f_Vuna_dCompiler_dNative_dModel_dNativeBss_nbSize > 0) then (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ((v_Vuna_dCompiler_dNative_dRender_dindent (".zero " ^ (bi_strFromInt (b).Vuna_dCompiler_dNative_dModel.f_Vuna_dCompiler_dNative_dModel_dNativeBss_nbSize))), Base_dData_dList.C_Base_dData_dList_dList_Nil)) else Base_dData_dList.C_Base_dData_dList_dList_Nil))) (if ((b).Vuna_dCompiler_dNative_dModel.f_Vuna_dCompiler_dNative_dModel_dNativeBss_nbAlign > 0) then (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ((".align " ^ (bi_strFromInt (b).Vuna_dCompiler_dNative_dModel.f_Vuna_dCompiler_dNative_dModel_dNativeBss_nbAlign)), Base_dData_dList.C_Base_dData_dList_dList_Nil)) else Base_dData_dList.C_Base_dData_dList_dList_Nil)))

# 163 "Vuna/Compiler/Native/Render.vuna"
let v_Vuna_dCompiler_dNative_dRender_drenderClosure = (fun (c : Vuna_dCompiler_dNative_dModel.t_Vuna_dCompiler_dNative_dModel_dNativeClosure) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ((".globl " ^ (c).Vuna_dCompiler_dNative_dModel.f_Vuna_dCompiler_dNative_dModel_dNativeClosure_ncLabel), (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (((c).Vuna_dCompiler_dNative_dModel.f_Vuna_dCompiler_dNative_dModel_dNativeClosure_ncLabel ^ ":"), (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ((v_Vuna_dCompiler_dNative_dRender_dindent (".quad " ^ (c).Vuna_dCompiler_dNative_dModel.f_Vuna_dCompiler_dNative_dModel_dNativeClosure_ncCode)), (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ((v_Vuna_dCompiler_dNative_dRender_dindent (".quad " ^ (bi_strFromInt (c).Vuna_dCompiler_dNative_dModel.f_Vuna_dCompiler_dNative_dModel_dNativeClosure_ncArity))), Base_dData_dList.C_Base_dData_dList_dList_Nil)))))))))

# 173 "Vuna/Compiler/Native/Render.vuna"
let v_Vuna_dCompiler_dNative_dRender_drenderFunc = (fun (f : Vuna_dCompiler_dNative_dModel.t_Vuna_dCompiler_dNative_dModel_dNativeFunc) -> ((Base_dData_dList.v_Base_dData_dList_dappend (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ((".globl " ^ (f).Vuna_dCompiler_dNative_dModel.f_Vuna_dCompiler_dNative_dModel_dNativeFunc_nfLabel), (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (((f).Vuna_dCompiler_dNative_dModel.f_Vuna_dCompiler_dNative_dModel_dNativeFunc_nfLabel ^ ":"), Base_dData_dList.C_Base_dData_dList_dList_Nil))))) ((Base_dData_dList.v_Base_dData_dList_dmap (fun (i : Vuna_dCompiler_dNative_dModel.t_Vuna_dCompiler_dNative_dModel_dInstr) -> (v_Vuna_dCompiler_dNative_dRender_dindent (v_Vuna_dCompiler_dNative_dRender_drenderInstr i)))) (f).Vuna_dCompiler_dNative_dModel.f_Vuna_dCompiler_dNative_dModel_dNativeFunc_nfBody)))

# 181 "Vuna/Compiler/Native/Render.vuna"
let v_Vuna_dCompiler_dNative_dRender_disEmpty = (fun mc0 -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> true
  | _ -> false
))

# 185 "Vuna/Compiler/Native/Render.vuna"
let rec v_Vuna_dCompiler_dNative_dRender_dmemString = (fun (mc0 : string) (mc1 : string Base_dData_dList.t_Base_dData_dList_dList) -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__69, dtb__70) -> (if (mc0 = dtb__69) then true else ((v_Vuna_dCompiler_dNative_dRender_dmemString mc0) dtb__70))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 189 "Vuna/Compiler/Native/Render.vuna"
let v_Vuna_dCompiler_dNative_dRender_dmoduleKeyOfFunc = (fun (f : Vuna_dCompiler_dNative_dModel.t_Vuna_dCompiler_dNative_dModel_dNativeFunc) -> ((Base_dData_dString.v_Base_dData_dString_djoin ".") (f).Vuna_dCompiler_dNative_dModel.f_Vuna_dCompiler_dNative_dModel_dNativeFunc_nfModule))

# 192 "Vuna/Compiler/Native/Render.vuna"
let v_Vuna_dCompiler_dNative_dRender_dpushModuleKey = (fun (keys : string Base_dData_dList.t_Base_dData_dList_dList) (k : string) -> (if ((v_Vuna_dCompiler_dNative_dRender_dmemString k) keys) then keys else ((Base_dData_dList.v_Base_dData_dList_dappend keys) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (k, Base_dData_dList.C_Base_dData_dList_dList_Nil)))))

# 196 "Vuna/Compiler/Native/Render.vuna"
let v_Vuna_dCompiler_dNative_dRender_dmoduleKeysOf = (fun (fs : Vuna_dCompiler_dNative_dModel.t_Vuna_dCompiler_dNative_dModel_dNativeFunc Base_dData_dList.t_Base_dData_dList_dList) -> (((Base_dData_dList.v_Base_dData_dList_dfoldl v_Vuna_dCompiler_dNative_dRender_dpushModuleKey) Base_dData_dList.C_Base_dData_dList_dList_Nil) ((Base_dData_dList.v_Base_dData_dList_dmap v_Vuna_dCompiler_dNative_dRender_dmoduleKeyOfFunc) fs)))

# 199 "Vuna/Compiler/Native/Render.vuna"
let v_Vuna_dCompiler_dNative_dRender_dfuncsOfKey = (fun (key : string) (_uarity1 : Vuna_dCompiler_dNative_dModel.t_Vuna_dCompiler_dNative_dModel_dNativeFunc Base_dData_dList.t_Base_dData_dList_dList) -> ((Base_dData_dList.v_Base_dData_dList_dfilter (fun (f : Vuna_dCompiler_dNative_dModel.t_Vuna_dCompiler_dNative_dModel_dNativeFunc) -> ((v_Vuna_dCompiler_dNative_dRender_dmoduleKeyOfFunc f) = key))) _uarity1))

# 202 "Vuna/Compiler/Native/Render.vuna"
let rec v_Vuna_dCompiler_dNative_dRender_dlitsOfKey = (fun (mc0 : string) (mc1 : (string Base_dData_dList.t_Base_dData_dList_dList, Vuna_dCompiler_dNative_dModel.t_Vuna_dCompiler_dNative_dModel_dNativeStrLit Base_dData_dList.t_Base_dData_dList_dList) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__71, dtb__72) -> (if (((Base_dData_dString.v_Base_dData_dString_djoin ".") (Base_dData_dPair.v_Base_dData_dPair_dfirstOf dtb__71)) = mc0) then (Base_dData_dPair.v_Base_dData_dPair_dsecondOf dtb__71) else ((v_Vuna_dCompiler_dNative_dRender_dlitsOfKey mc0) dtb__72))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 207 "Vuna/Compiler/Native/Render.vuna"
let v_Vuna_dCompiler_dNative_dRender_dfileOfKey = (fun (key : string) -> (((Base_dData_dString.v_Base_dData_dString_djoin "/") ((Base_dData_dString.v_Base_dData_dString_dsplit ".") key)) ^ ".s"))

# 210 "Vuna/Compiler/Native/Render.vuna"
let v_Vuna_dCompiler_dNative_dRender_drenderProgramFile = (fun (p : Vuna_dCompiler_dNative_dModel.t_Vuna_dCompiler_dNative_dModel_dNativeProgram) (key : string) -> ((fun isRuntime -> ((fun funcs -> ((fun rodataLits -> ((fun rodataConsts -> ((fun rodataClosures -> ((fun rodataPart -> ((fun rodataSection -> ((fun bssPart -> ((fun bssSection -> ((fun textSection -> ((fun body -> (((Base_dData_dString.v_Base_dData_dString_djoin "\n") ((Base_dData_dList.v_Base_dData_dList_dappend body) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (".section .note.GNU-stack,\"\",@progbits", Base_dData_dList.C_Base_dData_dList_dList_Nil)))) ^ "\n")) ((Base_dData_dList.v_Base_dData_dList_dappend (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (".intel_syntax noprefix", Base_dData_dList.C_Base_dData_dList_dList_Nil))) ((Base_dData_dList.v_Base_dData_dList_dappend rodataSection) ((Base_dData_dList.v_Base_dData_dList_dappend bssSection) textSection))))) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (".section .text", ((Base_dData_dList.v_Base_dData_dList_dconcatMap v_Vuna_dCompiler_dNative_dRender_drenderFunc) funcs))))) (if (v_Vuna_dCompiler_dNative_dRender_disEmpty bssPart) then Base_dData_dList.C_Base_dData_dList_dList_Nil else (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (".section .bss", bssPart))))) (if isRuntime then ((Base_dData_dList.v_Base_dData_dList_dconcatMap v_Vuna_dCompiler_dNative_dRender_drenderBss) (p).Vuna_dCompiler_dNative_dModel.f_Vuna_dCompiler_dNative_dModel_dNativeProgram_npBss) else Base_dData_dList.C_Base_dData_dList_dList_Nil))) (if (v_Vuna_dCompiler_dNative_dRender_disEmpty rodataPart) then Base_dData_dList.C_Base_dData_dList_dList_Nil else (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (".section .rodata", rodataPart))))) ((Base_dData_dList.v_Base_dData_dList_dappend rodataConsts) ((Base_dData_dList.v_Base_dData_dList_dappend rodataClosures) rodataLits)))) (if isRuntime then ((Base_dData_dList.v_Base_dData_dList_dconcatMap v_Vuna_dCompiler_dNative_dRender_drenderClosure) (p).Vuna_dCompiler_dNative_dModel.f_Vuna_dCompiler_dNative_dModel_dNativeProgram_npClosures) else Base_dData_dList.C_Base_dData_dList_dList_Nil))) (if isRuntime then ((Base_dData_dList.v_Base_dData_dList_dconcatMap v_Vuna_dCompiler_dNative_dRender_drenderRodata) (p).Vuna_dCompiler_dNative_dModel.f_Vuna_dCompiler_dNative_dModel_dNativeProgram_npRodata) else Base_dData_dList.C_Base_dData_dList_dList_Nil))) ((Base_dData_dList.v_Base_dData_dList_dconcatMap v_Vuna_dCompiler_dNative_dRender_drenderStrLit) ((v_Vuna_dCompiler_dNative_dRender_dlitsOfKey key) (p).Vuna_dCompiler_dNative_dModel.f_Vuna_dCompiler_dNative_dModel_dNativeProgram_npModuleLits)))) ((v_Vuna_dCompiler_dNative_dRender_dfuncsOfKey key) (p).Vuna_dCompiler_dNative_dModel.f_Vuna_dCompiler_dNative_dModel_dNativeProgram_npFuncs))) (key = "runtime")))

# 228 "Vuna/Compiler/Native/Render.vuna"
let v_Vuna_dCompiler_dNative_dRender_drenderFiles = (fun (p : Vuna_dCompiler_dNative_dModel.t_Vuna_dCompiler_dNative_dModel_dNativeProgram) -> ((Base_dData_dList.v_Base_dData_dList_dmap (fun (k : string) -> { Base_dData_dPair.f_Base_dData_dPair_dPair_first = (v_Vuna_dCompiler_dNative_dRender_dfileOfKey k); Base_dData_dPair.f_Base_dData_dPair_dPair_second = ((v_Vuna_dCompiler_dNative_dRender_drenderProgramFile p) k) })) (v_Vuna_dCompiler_dNative_dRender_dmoduleKeysOf (p).Vuna_dCompiler_dNative_dModel.f_Vuna_dCompiler_dNative_dModel_dNativeProgram_npFuncs)))
