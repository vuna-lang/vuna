open Vuna_runtime
# 26 "Vuna/Compiler/Native/Render.vuna"
let v_Vuna_dCompiler_dNative_dRender_dindent = (fun line -> ("  " ^ line))

# 29 "Vuna/Compiler/Native/Render.vuna"
let v_Vuna_dCompiler_dNative_dRender_dmemText = (fun base off -> (if (off = 0) then (String.concat "" ["["; (Vuna_dCompiler_dNative_dModel.v_Vuna_dCompiler_dNative_dModel_dregText base); "]"]) else (if (off < 0) then (String.concat "" ["["; (Vuna_dCompiler_dNative_dModel.v_Vuna_dCompiler_dNative_dModel_dregText base); "-"; (bi_strFromInt (0 - off)); "]"]) else (String.concat "" ["["; (Vuna_dCompiler_dNative_dModel.v_Vuna_dCompiler_dNative_dModel_dregText base); "+"; (bi_strFromInt off); "]"]))))

# 35 "Vuna/Compiler/Native/Render.vuna"
let v_Vuna_dCompiler_dNative_dRender_dmemXText = (fun base idx off -> (if (off = 0) then (String.concat "" ["["; (Vuna_dCompiler_dNative_dModel.v_Vuna_dCompiler_dNative_dModel_dregText base); "+"; (Vuna_dCompiler_dNative_dModel.v_Vuna_dCompiler_dNative_dModel_dregText idx); "]"]) else (if (off < 0) then (String.concat "" ["["; (Vuna_dCompiler_dNative_dModel.v_Vuna_dCompiler_dNative_dModel_dregText base); "+"; (Vuna_dCompiler_dNative_dModel.v_Vuna_dCompiler_dNative_dModel_dregText idx); "-"; (bi_strFromInt (0 - off)); "]"]) else (String.concat "" ["["; (Vuna_dCompiler_dNative_dModel.v_Vuna_dCompiler_dNative_dModel_dregText base); "+"; (Vuna_dCompiler_dNative_dModel.v_Vuna_dCompiler_dNative_dModel_dregText idx); "+"; (bi_strFromInt off); "]"]))))

# 41 "Vuna/Compiler/Native/Render.vuna"
let v_Vuna_dCompiler_dNative_dRender_drenderOperand = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dOperand_OpRip (dtb__0) -> (String.concat "" ["[rip + "; dtb__0; "]"])
  | Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dOperand_OpMemX (dtb__1, dtb__2, dtb__3) -> (((v_Vuna_dCompiler_dNative_dRender_dmemXText dtb__1) dtb__2) dtb__3)
  | Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dOperand_OpMem (dtb__4, dtb__5) -> ((v_Vuna_dCompiler_dNative_dRender_dmemText dtb__4) dtb__5)
  | Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dOperand_OpImm (dtb__6) -> (bi_strFromInt dtb__6)
  | Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dOperand_OpReg (dtb__7) -> (Vuna_dCompiler_dNative_dModel.v_Vuna_dCompiler_dNative_dModel_dregText dtb__7)
  | _ -> failwith "DT: impossible branch"
))

# 48 "Vuna/Compiler/Native/Render.vuna"
let v_Vuna_dCompiler_dNative_dRender_disMemOperand = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dOperand_OpMemX (dtb__8, dtb__9, dtb__10) -> true
  | Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dOperand_OpMem (dtb__11, dtb__12) -> true
  | _ -> false
))

# 53 "Vuna/Compiler/Native/Render.vuna"
let v_Vuna_dCompiler_dNative_dRender_drenderMov = (fun dst src -> (if (v_Vuna_dCompiler_dNative_dRender_disMemOperand dst) then (String.concat "" ["mov qword ptr "; (v_Vuna_dCompiler_dNative_dRender_drenderOperand dst); ", "; (v_Vuna_dCompiler_dNative_dRender_drenderOperand src)]) else (String.concat "" ["mov "; (v_Vuna_dCompiler_dNative_dRender_drenderOperand dst); ", "; (v_Vuna_dCompiler_dNative_dRender_drenderOperand src)])))

# 58 "Vuna/Compiler/Native/Render.vuna"
let v_Vuna_dCompiler_dNative_dRender_disShiftOp = (fun op -> (if (if (op = "shl") then true else (op = "shr")) then true else (op = "sar")))

# 61 "Vuna/Compiler/Native/Render.vuna"
let v_Vuna_dCompiler_dNative_dRender_drenderBinReg = (fun mc0 mc1 mc2 -> (match mc2 with
  | Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dOperand_OpReg (dtb__13) -> (match dtb__13 with
  | Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dReg_Rcx -> (if (v_Vuna_dCompiler_dNative_dRender_disShiftOp mc0) then (String.concat "" [mc0; " "; (Vuna_dCompiler_dNative_dModel.v_Vuna_dCompiler_dNative_dModel_dregText mc1); ", cl"]) else (String.concat "" [mc0; " "; (Vuna_dCompiler_dNative_dModel.v_Vuna_dCompiler_dNative_dModel_dregText mc1); ", "; (v_Vuna_dCompiler_dNative_dRender_drenderOperand (Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dOperand_OpReg (Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dReg_Rcx)))]))
  | _ -> (String.concat "" [mc0; " "; (Vuna_dCompiler_dNative_dModel.v_Vuna_dCompiler_dNative_dModel_dregText mc1); ", "; (v_Vuna_dCompiler_dNative_dRender_drenderOperand mc2)])
)
  | _ -> (String.concat "" [mc0; " "; (Vuna_dCompiler_dNative_dModel.v_Vuna_dCompiler_dNative_dModel_dregText mc1); ", "; (v_Vuna_dCompiler_dNative_dRender_drenderOperand mc2)])
))

# 67 "Vuna/Compiler/Native/Render.vuna"
let v_Vuna_dCompiler_dNative_dRender_drenderByteOp = (fun op -> ("byte ptr " ^ (v_Vuna_dCompiler_dNative_dRender_drenderOperand op)))

# 70 "Vuna/Compiler/Native/Render.vuna"
let v_Vuna_dCompiler_dNative_dRender_drenderInstr = (fun mc0 -> (match mc0 with
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

# 122 "Vuna/Compiler/Native/Render.vuna"
let v_Vuna_dCompiler_dNative_dRender_dpadOct = (fun c -> ((fun a -> ((fun b -> ((fun d -> (String.concat "" [(bi_strFromInt a); (bi_strFromInt b); (bi_strFromInt d)])) ((c - (a * 64)) - (b * 8)))) ((if 8 = 0 then failwith "division by zero" else c / 8) - (a * 8)))) (if 64 = 0 then failwith "division by zero" else c / 64)))

# 117 "Vuna/Compiler/Native/Render.vuna"
let v_Vuna_dCompiler_dNative_dRender_dasmEscapeChar = (fun mc0 -> (if (mc0 = 34) then "\\\"" else (if (mc0 = 92) then "\\\\" else (if (if (mc0 >= 32) then (mc0 <= 126) else false) then (Base_dList.dtp_pack (Base_dList.C_Base_dList_dList__x58__x58_ (mc0, Base_dList.C_Base_dList_dList_Nil))) else ("\\" ^ (v_Vuna_dCompiler_dNative_dRender_dpadOct mc0))))))

# 130 "Vuna/Compiler/Native/Render.vuna"
let v_Vuna_dCompiler_dNative_dRender_dasmString = (fun s -> (Base_dList.dtp_pack ((Base_dList.v_Base_dList_dconcatMap (fun c -> (Base_dList.dtp_unpack (v_Vuna_dCompiler_dNative_dRender_dasmEscapeChar c)))) (Base_dList.dtp_unpack s))))

# 133 "Vuna/Compiler/Native/Render.vuna"
let v_Vuna_dCompiler_dNative_dRender_drenderRodata = (fun d -> (Base_dList.C_Base_dList_dList__x58__x58_ (((d).Vuna_dCompiler_dNative_dModel.f_Vuna_dCompiler_dNative_dModel_dNativeRodata_nrLabel ^ ":"), (Base_dList.C_Base_dList_dList__x58__x58_ ((v_Vuna_dCompiler_dNative_dRender_dindent (String.concat "" [".ascii \""; (v_Vuna_dCompiler_dNative_dRender_dasmString (d).Vuna_dCompiler_dNative_dModel.f_Vuna_dCompiler_dNative_dModel_dNativeRodata_nrText); "\""])), Base_dList.C_Base_dList_dList_Nil)))))

# 137 "Vuna/Compiler/Native/Render.vuna"
let v_Vuna_dCompiler_dNative_dRender_drenderStrLit = (fun l -> (Base_dList.C_Base_dList_dList__x58__x58_ (((l).Vuna_dCompiler_dNative_dModel.f_Vuna_dCompiler_dNative_dModel_dNativeStrLit_nsLabel ^ ":"), (Base_dList.C_Base_dList_dList__x58__x58_ ((v_Vuna_dCompiler_dNative_dRender_dindent (".quad " ^ (bi_strFromInt (bi_strLength (l).Vuna_dCompiler_dNative_dModel.f_Vuna_dCompiler_dNative_dModel_dNativeStrLit_nsText)))), (Base_dList.C_Base_dList_dList__x58__x58_ ((v_Vuna_dCompiler_dNative_dRender_dindent (String.concat "" [".ascii \""; (v_Vuna_dCompiler_dNative_dRender_dasmString (l).Vuna_dCompiler_dNative_dModel.f_Vuna_dCompiler_dNative_dModel_dNativeStrLit_nsText); "\""])), Base_dList.C_Base_dList_dList_Nil)))))))

# 144 "Vuna/Compiler/Native/Render.vuna"
let v_Vuna_dCompiler_dNative_dRender_drenderBss = (fun b -> ((fun alignLine -> ((fun dataLine -> ((Base_dList.v_Base_dList_dappend alignLine) ((Base_dList.v_Base_dList_dappend (Base_dList.C_Base_dList_dList__x58__x58_ (((b).Vuna_dCompiler_dNative_dModel.f_Vuna_dCompiler_dNative_dModel_dNativeBss_nbLabel ^ ":"), Base_dList.C_Base_dList_dList_Nil))) dataLine))) (if ((b).Vuna_dCompiler_dNative_dModel.f_Vuna_dCompiler_dNative_dModel_dNativeBss_nbSize > 0) then (Base_dList.C_Base_dList_dList__x58__x58_ ((v_Vuna_dCompiler_dNative_dRender_dindent (".zero " ^ (bi_strFromInt (b).Vuna_dCompiler_dNative_dModel.f_Vuna_dCompiler_dNative_dModel_dNativeBss_nbSize))), Base_dList.C_Base_dList_dList_Nil)) else Base_dList.C_Base_dList_dList_Nil))) (if ((b).Vuna_dCompiler_dNative_dModel.f_Vuna_dCompiler_dNative_dModel_dNativeBss_nbAlign > 0) then (Base_dList.C_Base_dList_dList__x58__x58_ ((".align " ^ (bi_strFromInt (b).Vuna_dCompiler_dNative_dModel.f_Vuna_dCompiler_dNative_dModel_dNativeBss_nbAlign)), Base_dList.C_Base_dList_dList_Nil)) else Base_dList.C_Base_dList_dList_Nil)))

# 151 "Vuna/Compiler/Native/Render.vuna"
let v_Vuna_dCompiler_dNative_dRender_drenderFunc = (fun f -> ((fun global -> ((Base_dList.v_Base_dList_dappend ((Base_dList.v_Base_dList_dappend global) (Base_dList.C_Base_dList_dList__x58__x58_ (((f).Vuna_dCompiler_dNative_dModel.f_Vuna_dCompiler_dNative_dModel_dNativeFunc_nfLabel ^ ":"), Base_dList.C_Base_dList_dList_Nil)))) ((Base_dList.v_Base_dList_dmap (fun i -> (v_Vuna_dCompiler_dNative_dRender_dindent (v_Vuna_dCompiler_dNative_dRender_drenderInstr i)))) (f).Vuna_dCompiler_dNative_dModel.f_Vuna_dCompiler_dNative_dModel_dNativeFunc_nfBody))) (if ((f).Vuna_dCompiler_dNative_dModel.f_Vuna_dCompiler_dNative_dModel_dNativeFunc_nfLabel = Vuna_dCompiler_dNative_dAbi.v_Vuna_dCompiler_dNative_dAbi_dnativeEntryLabel) then (Base_dList.C_Base_dList_dList__x58__x58_ ((".globl " ^ Vuna_dCompiler_dNative_dAbi.v_Vuna_dCompiler_dNative_dAbi_dnativeEntryLabel), Base_dList.C_Base_dList_dList_Nil)) else Base_dList.C_Base_dList_dList_Nil)))

# 160 "Vuna/Compiler/Native/Render.vuna"
let v_Vuna_dCompiler_dNative_dRender_drenderProgram = (fun p -> ((fun rodataLines -> ((fun rodataConstLines -> ((fun bssLines -> ((fun funcLines -> ((fun sections -> (((Base_dString.v_Base_dString_djoin "\n") sections) ^ "\n")) ((Base_dList.v_Base_dList_dappend (Base_dList.C_Base_dList_dList__x58__x58_ (".intel_syntax noprefix", (Base_dList.C_Base_dList_dList__x58__x58_ (".section .rodata", Base_dList.C_Base_dList_dList_Nil))))) ((Base_dList.v_Base_dList_dappend rodataConstLines) ((Base_dList.v_Base_dList_dappend rodataLines) ((Base_dList.v_Base_dList_dappend (Base_dList.C_Base_dList_dList__x58__x58_ (".section .bss", Base_dList.C_Base_dList_dList_Nil))) ((Base_dList.v_Base_dList_dappend bssLines) ((Base_dList.v_Base_dList_dappend (Base_dList.C_Base_dList_dList__x58__x58_ (".section .text", Base_dList.C_Base_dList_dList_Nil))) ((Base_dList.v_Base_dList_dappend funcLines) (Base_dList.C_Base_dList_dList__x58__x58_ (".section .note.GNU-stack,\"\",@progbits", Base_dList.C_Base_dList_dList_Nil))))))))))) ((Base_dList.v_Base_dList_dconcatMap v_Vuna_dCompiler_dNative_dRender_drenderFunc) (p).Vuna_dCompiler_dNative_dModel.f_Vuna_dCompiler_dNative_dModel_dNativeProgram_npFuncs))) ((Base_dList.v_Base_dList_dconcatMap v_Vuna_dCompiler_dNative_dRender_drenderBss) (p).Vuna_dCompiler_dNative_dModel.f_Vuna_dCompiler_dNative_dModel_dNativeProgram_npBss))) ((Base_dList.v_Base_dList_dconcatMap v_Vuna_dCompiler_dNative_dRender_drenderRodata) (p).Vuna_dCompiler_dNative_dModel.f_Vuna_dCompiler_dNative_dModel_dNativeProgram_npRodata))) ((Base_dList.v_Base_dList_dconcatMap v_Vuna_dCompiler_dNative_dRender_drenderStrLit) (p).Vuna_dCompiler_dNative_dModel.f_Vuna_dCompiler_dNative_dModel_dNativeProgram_npStrLits)))
