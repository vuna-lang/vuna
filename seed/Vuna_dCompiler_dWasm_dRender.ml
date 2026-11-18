open Vuna_runtime
# 18 "Vuna/Compiler/Wasm/Render.vuna"
let v_Vuna_dCompiler_dWasm_dRender_dmaxLine = 100

# 21 "Vuna/Compiler/Wasm/Render.vuna"
let rec v_Vuna_dCompiler_dWasm_dRender_dspaces = (fun n -> (if (n <= 0) then "" else (" " ^ (v_Vuna_dCompiler_dWasm_dRender_dspaces (n - 1)))))

# 24 "Vuna/Compiler/Wasm/Render.vuna"
let v_Vuna_dCompiler_dWasm_dRender_dlineOf = (fun indent text -> ((v_Vuna_dCompiler_dWasm_dRender_dspaces indent) ^ text))

# 27 "Vuna/Compiler/Wasm/Render.vuna"
let v_Vuna_dCompiler_dWasm_dRender_dfitsLine = (fun s -> ((bi_strLength s) <= v_Vuna_dCompiler_dWasm_dRender_dmaxLine))

# 30 "Vuna/Compiler/Wasm/Render.vuna"
let v_Vuna_dCompiler_dWasm_dRender_djoinWith = (fun sep xs -> ((Base_dData_dString.v_Base_dData_dString_djoin sep) xs))

# 44 "Vuna/Compiler/Wasm/Render.vuna"
let v_Vuna_dCompiler_dWasm_dRender_dflushWord = (fun mc0 mc1 -> (if (mc0 = "") then mc1 else (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (mc0, mc1))))

# 39 "Vuna/Compiler/Wasm/Render.vuna"
let rec v_Vuna_dCompiler_dWasm_dRender_dwordsOfGo = (fun mc0 mc1 mc2 -> (match mc2 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__0, dtb__1) -> (if (dtb__0 = 32) then (((v_Vuna_dCompiler_dWasm_dRender_dwordsOfGo "") ((v_Vuna_dCompiler_dWasm_dRender_dflushWord mc0) mc1)) dtb__1) else (((v_Vuna_dCompiler_dWasm_dRender_dwordsOfGo (mc0 ^ (Base_dData_dList.dtp_pack (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__0, Base_dData_dList.C_Base_dData_dList_dList_Nil))))) mc1) dtb__1))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> ((v_Vuna_dCompiler_dWasm_dRender_dflushWord mc0) mc1)
  | _ -> failwith "DT: impossible branch"
))

# 36 "Vuna/Compiler/Wasm/Render.vuna"
let v_Vuna_dCompiler_dWasm_dRender_dwordsOf = (fun s -> (Base_dData_dList.v_Base_dData_dList_dreverse (((v_Vuna_dCompiler_dWasm_dRender_dwordsOfGo "") Base_dData_dList.C_Base_dData_dList_dList_Nil) (Base_dData_dList.dtp_unpack s))))

# 51 "Vuna/Compiler/Wasm/Render.vuna"
let rec v_Vuna_dCompiler_dWasm_dRender_dwrapWords = (fun mc0 mc1 mc2 -> (match mc2 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__2, dtb__3) -> ((fun cand -> (if (v_Vuna_dCompiler_dWasm_dRender_dfitsLine ((v_Vuna_dCompiler_dWasm_dRender_dlineOf mc0) cand)) then (((v_Vuna_dCompiler_dWasm_dRender_dwrapWords mc0) cand) dtb__3) else (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (((v_Vuna_dCompiler_dWasm_dRender_dlineOf mc0) mc1), (((v_Vuna_dCompiler_dWasm_dRender_dwrapWords mc0) dtb__2) dtb__3))))) (if (mc1 = "") then dtb__2 else (String.concat "" [mc1; " "; dtb__2])))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (if (mc1 = "") then Base_dData_dList.C_Base_dData_dList_dList_Nil else (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (((v_Vuna_dCompiler_dWasm_dRender_dlineOf mc0) mc1), Base_dData_dList.C_Base_dData_dList_dList_Nil)))
  | _ -> failwith "DT: impossible branch"
))

# 48 "Vuna/Compiler/Wasm/Render.vuna"
let v_Vuna_dCompiler_dWasm_dRender_dwrapComment = (fun indent text -> (((v_Vuna_dCompiler_dWasm_dRender_dwrapWords indent) "") (v_Vuna_dCompiler_dWasm_dRender_dwordsOf text)))

# 62 "Vuna/Compiler/Wasm/Render.vuna"
let v_Vuna_dCompiler_dWasm_dRender_dhexDigit = (fun n -> (if (n < 10) then (Base_dData_dList.dtp_pack (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ((48 + n), Base_dData_dList.C_Base_dData_dList_dList_Nil))) else (Base_dData_dList.dtp_pack (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ((87 + n), Base_dData_dList.C_Base_dData_dList_dList_Nil)))))

# 65 "Vuna/Compiler/Wasm/Render.vuna"
let v_Vuna_dCompiler_dWasm_dRender_dhex2 = (fun n -> ((v_Vuna_dCompiler_dWasm_dRender_dhexDigit (if 16 = 0 then failwith "division by zero" else n / 16)) ^ (v_Vuna_dCompiler_dWasm_dRender_dhexDigit (n - ((if 16 = 0 then failwith "division by zero" else n / 16) * 16)))))

# 68 "Vuna/Compiler/Wasm/Render.vuna"
let v_Vuna_dCompiler_dWasm_dRender_dwatEscapeChar = (fun mc0 -> (if (mc0 = 34) then "\\\"" else (if (mc0 = 92) then "\\\\" else (if (if (mc0 >= 32) then (mc0 <= 126) else false) then (Base_dData_dList.dtp_pack (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (mc0, Base_dData_dList.C_Base_dData_dList_dList_Nil))) else ("\\" ^ (v_Vuna_dCompiler_dWasm_dRender_dhex2 mc0))))))

# 74 "Vuna/Compiler/Wasm/Render.vuna"
let v_Vuna_dCompiler_dWasm_dRender_dwatString = (fun s -> (Base_dData_dList.dtp_pack ((Base_dData_dList.v_Base_dData_dList_dconcatMap (fun c -> (Base_dData_dList.dtp_unpack (v_Vuna_dCompiler_dWasm_dRender_dwatEscapeChar c)))) (Base_dData_dList.dtp_unpack s))))

# 81 "Vuna/Compiler/Wasm/Render.vuna"
let rec v_Vuna_dCompiler_dWasm_dRender_dchunkBytesGo = (fun mc0 mc1 mc2 -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__4, dtb__5) -> (if (mc1 = 0) then (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ((Base_dData_dList.v_Base_dData_dList_dreverse mc2), (((v_Vuna_dCompiler_dWasm_dRender_dchunkBytesGo dtb__5) 23) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__4, Base_dData_dList.C_Base_dData_dList_dList_Nil))))) else (((v_Vuna_dCompiler_dWasm_dRender_dchunkBytesGo dtb__5) (mc1 - 1)) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__4, mc2))))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (if (((Base_dTrait_dEq.v_Base_dTrait_dEq_d_x61__x61_ (Base_dData_dList.v_Eq_uBase_uData_uList_uList_ua Base_dData_dInt.v_Eq_uInt)) mc2) Base_dData_dList.C_Base_dData_dList_dList_Nil) then Base_dData_dList.C_Base_dData_dList_dList_Nil else (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ((Base_dData_dList.v_Base_dData_dList_dreverse mc2), Base_dData_dList.C_Base_dData_dList_dList_Nil)))
  | _ -> failwith "DT: impossible branch"
))

# 78 "Vuna/Compiler/Wasm/Render.vuna"
let v_Vuna_dCompiler_dWasm_dRender_dchunkBytes = (fun bytes -> (((v_Vuna_dCompiler_dWasm_dRender_dchunkBytesGo bytes) 24) Base_dData_dList.C_Base_dData_dList_dList_Nil))

# 90 "Vuna/Compiler/Wasm/Render.vuna"
let v_Vuna_dCompiler_dWasm_dRender_dresultSuffix = (fun mc0 -> (if (mc0 = "") then "" else (String.concat "" [" (result "; mc0; ")"])))

# 94 "Vuna/Compiler/Wasm/Render.vuna"
let v_Vuna_dCompiler_dWasm_dRender_drenderInstrFlat = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dWasm_dInstr.C_Vuna_dCompiler_dWasm_dInstr_dInstr_IComment (dtb__6) -> ""
  | Vuna_dCompiler_dWasm_dInstr.C_Vuna_dCompiler_dWasm_dInstr_dInstr_IStore64 -> "i64.store"
  | Vuna_dCompiler_dWasm_dInstr.C_Vuna_dCompiler_dWasm_dInstr_dInstr_ILoad64 -> "i64.load"
  | Vuna_dCompiler_dWasm_dInstr.C_Vuna_dCompiler_dWasm_dInstr_dInstr_IStore32 -> "i32.store"
  | Vuna_dCompiler_dWasm_dInstr.C_Vuna_dCompiler_dWasm_dInstr_dInstr_ILoad32 -> "i32.load"
  | Vuna_dCompiler_dWasm_dInstr.C_Vuna_dCompiler_dWasm_dInstr_dInstr_IStore8 -> "i32.store8"
  | Vuna_dCompiler_dWasm_dInstr.C_Vuna_dCompiler_dWasm_dInstr_dInstr_ILoad8U -> "i32.load8_u"
  | Vuna_dCompiler_dWasm_dInstr.C_Vuna_dCompiler_dWasm_dInstr_dInstr_IMemorySize -> "memory.size"
  | Vuna_dCompiler_dWasm_dInstr.C_Vuna_dCompiler_dWasm_dInstr_dInstr_IMemoryGrow -> "memory.grow"
  | Vuna_dCompiler_dWasm_dInstr.C_Vuna_dCompiler_dWasm_dInstr_dInstr_IBrIf (dtb__7) -> ("br_if " ^ dtb__7)
  | Vuna_dCompiler_dWasm_dInstr.C_Vuna_dCompiler_dWasm_dInstr_dInstr_IBr (dtb__8) -> ("br " ^ dtb__8)
  | Vuna_dCompiler_dWasm_dInstr.C_Vuna_dCompiler_dWasm_dInstr_dInstr_ILoop (dtb__9, dtb__10, dtb__11) -> ""
  | Vuna_dCompiler_dWasm_dInstr.C_Vuna_dCompiler_dWasm_dInstr_dInstr_IBlock (dtb__12, dtb__13, dtb__14) -> ""
  | Vuna_dCompiler_dWasm_dInstr.C_Vuna_dCompiler_dWasm_dInstr_dInstr_IIf (dtb__15, dtb__16, dtb__17) -> ""
  | Vuna_dCompiler_dWasm_dInstr.C_Vuna_dCompiler_dWasm_dInstr_dInstr_ITryTable (dtb__18, dtb__19, dtb__20, dtb__21) -> ""
  | Vuna_dCompiler_dWasm_dInstr.C_Vuna_dCompiler_dWasm_dInstr_dInstr_IThrow (dtb__22) -> ("throw " ^ dtb__22)
  | Vuna_dCompiler_dWasm_dInstr.C_Vuna_dCompiler_dWasm_dInstr_dInstr_II31GetS -> "i31.get_s"
  | Vuna_dCompiler_dWasm_dInstr.C_Vuna_dCompiler_dWasm_dInstr_dInstr_II31GetU -> "i31.get_u"
  | Vuna_dCompiler_dWasm_dInstr.C_Vuna_dCompiler_dWasm_dInstr_dInstr_II31New -> "ref.i31"
  | Vuna_dCompiler_dWasm_dInstr.C_Vuna_dCompiler_dWasm_dInstr_dInstr_IArrayCopy (dtb__23, dtb__24) -> (String.concat "" ["array.copy "; dtb__23; " "; dtb__24])
  | Vuna_dCompiler_dWasm_dInstr.C_Vuna_dCompiler_dWasm_dInstr_dInstr_IArrayLen -> "array.len"
  | Vuna_dCompiler_dWasm_dInstr.C_Vuna_dCompiler_dWasm_dInstr_dInstr_IArraySet (dtb__25) -> ("array.set " ^ dtb__25)
  | Vuna_dCompiler_dWasm_dInstr.C_Vuna_dCompiler_dWasm_dInstr_dInstr_IArrayGetS (dtb__26) -> ("array.get_s " ^ dtb__26)
  | Vuna_dCompiler_dWasm_dInstr.C_Vuna_dCompiler_dWasm_dInstr_dInstr_IArrayGetU (dtb__27) -> ("array.get_u " ^ dtb__27)
  | Vuna_dCompiler_dWasm_dInstr.C_Vuna_dCompiler_dWasm_dInstr_dInstr_IArrayGet (dtb__28) -> ("array.get " ^ dtb__28)
  | Vuna_dCompiler_dWasm_dInstr.C_Vuna_dCompiler_dWasm_dInstr_dInstr_IArrayNewData (dtb__29, dtb__30) -> (String.concat "" ["array.new_data "; dtb__29; " "; dtb__30])
  | Vuna_dCompiler_dWasm_dInstr.C_Vuna_dCompiler_dWasm_dInstr_dInstr_IArrayNewFixed (dtb__31, dtb__32) -> (String.concat "" ["array.new_fixed "; dtb__31; " "; (bi_strFromInt dtb__32)])
  | Vuna_dCompiler_dWasm_dInstr.C_Vuna_dCompiler_dWasm_dInstr_dInstr_IArrayNewDefault (dtb__33) -> ("array.new_default " ^ dtb__33)
  | Vuna_dCompiler_dWasm_dInstr.C_Vuna_dCompiler_dWasm_dInstr_dInstr_IArrayNew (dtb__34) -> ("array.new " ^ dtb__34)
  | Vuna_dCompiler_dWasm_dInstr.C_Vuna_dCompiler_dWasm_dInstr_dInstr_IStructSet (dtb__35, dtb__36) -> (String.concat "" ["struct.set "; dtb__35; " "; (bi_strFromInt dtb__36)])
  | Vuna_dCompiler_dWasm_dInstr.C_Vuna_dCompiler_dWasm_dInstr_dInstr_IStructGet (dtb__37, dtb__38) -> (String.concat "" ["struct.get "; dtb__37; " "; (bi_strFromInt dtb__38)])
  | Vuna_dCompiler_dWasm_dInstr.C_Vuna_dCompiler_dWasm_dInstr_dInstr_IStructNew (dtb__39) -> ("struct.new " ^ dtb__39)
  | Vuna_dCompiler_dWasm_dInstr.C_Vuna_dCompiler_dWasm_dInstr_dInstr_IRefAsNonNull -> "ref.as_non_null"
  | Vuna_dCompiler_dWasm_dInstr.C_Vuna_dCompiler_dWasm_dInstr_dInstr_IRefTest (dtb__40) -> (String.concat "" ["ref.test (ref "; dtb__40; ")"])
  | Vuna_dCompiler_dWasm_dInstr.C_Vuna_dCompiler_dWasm_dInstr_dInstr_IRefCast (dtb__41) -> (String.concat "" ["ref.cast (ref "; dtb__41; ")"])
  | Vuna_dCompiler_dWasm_dInstr.C_Vuna_dCompiler_dWasm_dInstr_dInstr_IRefNull -> "ref.null any"
  | Vuna_dCompiler_dWasm_dInstr.C_Vuna_dCompiler_dWasm_dInstr_dInstr_IRefFunc (dtb__42) -> ("ref.func " ^ dtb__42)
  | Vuna_dCompiler_dWasm_dInstr.C_Vuna_dCompiler_dWasm_dInstr_dInstr_IReturnCallRef (dtb__43) -> ("return_call_ref " ^ dtb__43)
  | Vuna_dCompiler_dWasm_dInstr.C_Vuna_dCompiler_dWasm_dInstr_dInstr_IReturnCall (dtb__44) -> ("return_call " ^ dtb__44)
  | Vuna_dCompiler_dWasm_dInstr.C_Vuna_dCompiler_dWasm_dInstr_dInstr_ICallRef (dtb__45) -> ("call_ref " ^ dtb__45)
  | Vuna_dCompiler_dWasm_dInstr.C_Vuna_dCompiler_dWasm_dInstr_dInstr_ICall (dtb__46) -> ("call " ^ dtb__46)
  | Vuna_dCompiler_dWasm_dInstr.C_Vuna_dCompiler_dWasm_dInstr_dInstr_IBinop (dtb__47) -> dtb__47
  | Vuna_dCompiler_dWasm_dInstr.C_Vuna_dCompiler_dWasm_dInstr_dInstr_IUnop (dtb__48) -> dtb__48
  | Vuna_dCompiler_dWasm_dInstr.C_Vuna_dCompiler_dWasm_dInstr_dInstr_IPlain (dtb__49) -> dtb__49
  | Vuna_dCompiler_dWasm_dInstr.C_Vuna_dCompiler_dWasm_dInstr_dInstr_IConstI64 (dtb__50) -> ("i64.const " ^ (bi_strFromInt dtb__50))
  | Vuna_dCompiler_dWasm_dInstr.C_Vuna_dCompiler_dWasm_dInstr_dInstr_IConstI32 (dtb__51) -> ("i32.const " ^ (bi_strFromInt dtb__51))
  | Vuna_dCompiler_dWasm_dInstr.C_Vuna_dCompiler_dWasm_dInstr_dInstr_IGlobalSet (dtb__52) -> ("global.set " ^ dtb__52)
  | Vuna_dCompiler_dWasm_dInstr.C_Vuna_dCompiler_dWasm_dInstr_dInstr_IGlobalGet (dtb__53) -> ("global.get " ^ dtb__53)
  | Vuna_dCompiler_dWasm_dInstr.C_Vuna_dCompiler_dWasm_dInstr_dInstr_ILocalTee (dtb__54) -> ("local.tee " ^ dtb__54)
  | Vuna_dCompiler_dWasm_dInstr.C_Vuna_dCompiler_dWasm_dInstr_dInstr_ILocalSet (dtb__55) -> ("local.set " ^ dtb__55)
  | Vuna_dCompiler_dWasm_dInstr.C_Vuna_dCompiler_dWasm_dInstr_dInstr_ILocalGet (dtb__56) -> ("local.get " ^ dtb__56)
  | Vuna_dCompiler_dWasm_dInstr.C_Vuna_dCompiler_dWasm_dInstr_dInstr_IDrop -> "drop"
  | Vuna_dCompiler_dWasm_dInstr.C_Vuna_dCompiler_dWasm_dInstr_dInstr_IReturn -> "return"
  | Vuna_dCompiler_dWasm_dInstr.C_Vuna_dCompiler_dWasm_dInstr_dInstr_IUnreachable -> "unreachable"
  | Vuna_dCompiler_dWasm_dInstr.C_Vuna_dCompiler_dWasm_dInstr_dInstr_INop -> "nop"
  | _ -> failwith "DT: impossible branch"
))

# 151 "Vuna/Compiler/Wasm/Render.vuna"
let rec v_Vuna_dCompiler_dWasm_dRender_drenderInstrs = (fun indent instrs -> ((Base_dData_dList.v_Base_dData_dList_dconcatMap (v_Vuna_dCompiler_dWasm_dRender_drenderInstr indent)) instrs))
# 154 "Vuna/Compiler/Wasm/Render.vuna"
and v_Vuna_dCompiler_dWasm_dRender_drenderInstr = (fun mc0 mc1 -> (match mc1 with
  | Vuna_dCompiler_dWasm_dInstr.C_Vuna_dCompiler_dWasm_dInstr_dInstr_IComment (dtb__57) -> ((Base_dData_dList.v_Base_dData_dList_dmap (v_Vuna_dCompiler_dWasm_dRender_dlineOf mc0)) ((v_Vuna_dCompiler_dWasm_dRender_dwrapComment 0) (";; " ^ dtb__57)))
  | Vuna_dCompiler_dWasm_dInstr.C_Vuna_dCompiler_dWasm_dInstr_dInstr_ILoop (dtb__58, dtb__59, dtb__60) -> ((((v_Vuna_dCompiler_dWasm_dRender_drenderLoop mc0) dtb__58) dtb__59) dtb__60)
  | Vuna_dCompiler_dWasm_dInstr.C_Vuna_dCompiler_dWasm_dInstr_dInstr_IBlock (dtb__61, dtb__62, dtb__63) -> ((((v_Vuna_dCompiler_dWasm_dRender_drenderBlock mc0) dtb__61) dtb__62) dtb__63)
  | Vuna_dCompiler_dWasm_dInstr.C_Vuna_dCompiler_dWasm_dInstr_dInstr_ITryTable (dtb__64, dtb__65, dtb__66, dtb__67) -> (((((v_Vuna_dCompiler_dWasm_dRender_drenderTryTable mc0) dtb__64) dtb__65) dtb__66) dtb__67)
  | Vuna_dCompiler_dWasm_dInstr.C_Vuna_dCompiler_dWasm_dInstr_dInstr_IIf (dtb__68, dtb__69, dtb__70) -> ((((v_Vuna_dCompiler_dWasm_dRender_drenderIf mc0) dtb__68) dtb__69) dtb__70)
  | _ -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (((v_Vuna_dCompiler_dWasm_dRender_dlineOf mc0) (v_Vuna_dCompiler_dWasm_dRender_drenderInstrFlat mc1)), Base_dData_dList.C_Base_dData_dList_dList_Nil))
))
# 162 "Vuna/Compiler/Wasm/Render.vuna"
and v_Vuna_dCompiler_dWasm_dRender_drenderIf = (fun indent resultTy th el -> ((fun openLine -> ((fun thenBody -> ((fun elseLine -> ((fun elseBody -> ((fun endLine -> ((Base_dData_dList.v_Base_dData_dList_dappend openLine) ((Base_dData_dList.v_Base_dData_dList_dappend thenBody) ((Base_dData_dList.v_Base_dData_dList_dappend elseLine) ((Base_dData_dList.v_Base_dData_dList_dappend elseBody) endLine))))) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (((v_Vuna_dCompiler_dWasm_dRender_dlineOf indent) "end"), Base_dData_dList.C_Base_dData_dList_dList_Nil)))) ((v_Vuna_dCompiler_dWasm_dRender_drenderInstrs (indent + 2)) el))) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (((v_Vuna_dCompiler_dWasm_dRender_dlineOf indent) "else"), Base_dData_dList.C_Base_dData_dList_dList_Nil)))) ((v_Vuna_dCompiler_dWasm_dRender_drenderInstrs (indent + 2)) th))) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (((v_Vuna_dCompiler_dWasm_dRender_dlineOf indent) ("if" ^ (v_Vuna_dCompiler_dWasm_dRender_dresultSuffix resultTy))), Base_dData_dList.C_Base_dData_dList_dList_Nil))))
# 172 "Vuna/Compiler/Wasm/Render.vuna"
and v_Vuna_dCompiler_dWasm_dRender_drenderBlock = (fun indent label resultTy body -> ((fun openLine -> ((Base_dData_dList.v_Base_dData_dList_dappend openLine) ((Base_dData_dList.v_Base_dData_dList_dappend ((v_Vuna_dCompiler_dWasm_dRender_drenderInstrs (indent + 2)) body)) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (((v_Vuna_dCompiler_dWasm_dRender_dlineOf indent) "end"), Base_dData_dList.C_Base_dData_dList_dList_Nil))))) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (((v_Vuna_dCompiler_dWasm_dRender_dlineOf indent) (String.concat "" ["block "; label; (v_Vuna_dCompiler_dWasm_dRender_dresultSuffix resultTy)])), Base_dData_dList.C_Base_dData_dList_dList_Nil))))
# 178 "Vuna/Compiler/Wasm/Render.vuna"
and v_Vuna_dCompiler_dWasm_dRender_drenderLoop = (fun indent label resultTy body -> ((fun openLine -> ((Base_dData_dList.v_Base_dData_dList_dappend openLine) ((Base_dData_dList.v_Base_dData_dList_dappend ((v_Vuna_dCompiler_dWasm_dRender_drenderInstrs (indent + 2)) body)) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (((v_Vuna_dCompiler_dWasm_dRender_dlineOf indent) "end"), Base_dData_dList.C_Base_dData_dList_dList_Nil))))) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (((v_Vuna_dCompiler_dWasm_dRender_dlineOf indent) (String.concat "" ["loop "; label; (v_Vuna_dCompiler_dWasm_dRender_dresultSuffix resultTy)])), Base_dData_dList.C_Base_dData_dList_dList_Nil))))
# 186 "Vuna/Compiler/Wasm/Render.vuna"
and v_Vuna_dCompiler_dWasm_dRender_drenderTryTable = (fun indent label tag body normal -> ((fun openLine -> ((fun tryOpen -> ((fun bodyLines -> ((fun tryClose -> ((fun normalLines -> ((fun closeLine -> ((Base_dData_dList.v_Base_dData_dList_dappend openLine) ((Base_dData_dList.v_Base_dData_dList_dappend tryOpen) ((Base_dData_dList.v_Base_dData_dList_dappend bodyLines) ((Base_dData_dList.v_Base_dData_dList_dappend tryClose) ((Base_dData_dList.v_Base_dData_dList_dappend normalLines) closeLine)))))) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (((v_Vuna_dCompiler_dWasm_dRender_dlineOf indent) "end"), Base_dData_dList.C_Base_dData_dList_dList_Nil)))) ((v_Vuna_dCompiler_dWasm_dRender_drenderInstrs (indent + 2)) normal))) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (((v_Vuna_dCompiler_dWasm_dRender_dlineOf (indent + 2)) "end"), Base_dData_dList.C_Base_dData_dList_dList_Nil)))) ((v_Vuna_dCompiler_dWasm_dRender_drenderInstrs (indent + 4)) body))) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (((v_Vuna_dCompiler_dWasm_dRender_dlineOf (indent + 2)) (String.concat "" ["try_table (result anyref) (catch "; tag; " "; label; ")"])), Base_dData_dList.C_Base_dData_dList_dList_Nil)))) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (((v_Vuna_dCompiler_dWasm_dRender_dlineOf indent) (String.concat "" ["block "; label; " (result anyref)"])), Base_dData_dList.C_Base_dData_dList_dList_Nil))))

# 201 "Vuna/Compiler/Wasm/Render.vuna"
let v_Vuna_dCompiler_dWasm_dRender_drenderParam = (fun p -> (String.concat "" ["(param "; (Base_dData_dPair.v_Base_dData_dPair_dfirstOf p); " "; (Vuna_dCompiler_dWasm_dModel.v_Vuna_dCompiler_dWasm_dModel_dwatValTyText (Base_dData_dPair.v_Base_dData_dPair_dsecondOf p)); ")"]))

# 204 "Vuna/Compiler/Wasm/Render.vuna"
let v_Vuna_dCompiler_dWasm_dRender_drenderResult = (fun ty -> (String.concat "" ["(result "; (Vuna_dCompiler_dWasm_dModel.v_Vuna_dCompiler_dWasm_dModel_dwatValTyText ty); ")"]))

# 207 "Vuna/Compiler/Wasm/Render.vuna"
let v_Vuna_dCompiler_dWasm_dRender_drenderField = (fun f -> ((fun tyText -> (String.concat "" ["(field "; tyText; ")"])) (if (f).Vuna_dCompiler_dWasm_dModel.f_Vuna_dCompiler_dWasm_dModel_dWatField_watFieldMut then (String.concat "" ["(mut "; (Vuna_dCompiler_dWasm_dModel.v_Vuna_dCompiler_dWasm_dModel_dwatValTyText (f).Vuna_dCompiler_dWasm_dModel.f_Vuna_dCompiler_dWasm_dModel_dWatField_watFieldTy); ")"]) else (Vuna_dCompiler_dWasm_dModel.v_Vuna_dCompiler_dWasm_dModel_dwatValTyText (f).Vuna_dCompiler_dWasm_dModel.f_Vuna_dCompiler_dWasm_dModel_dWatField_watFieldTy))))

# 215 "Vuna/Compiler/Wasm/Render.vuna"
let v_Vuna_dCompiler_dWasm_dRender_dfuncTypeOne = (fun name params results -> ((fun paramsText -> ((fun resultsText -> ((v_Vuna_dCompiler_dWasm_dRender_dlineOf 2) (String.concat "" ["(type "; name; " (func"; paramsText; resultsText; "))"]))) ((v_Vuna_dCompiler_dWasm_dRender_djoinWith "") ((Base_dData_dList.v_Base_dData_dList_dmap (fun r -> (" " ^ (v_Vuna_dCompiler_dWasm_dRender_drenderResult r)))) results)))) ((v_Vuna_dCompiler_dWasm_dRender_djoinWith "") ((Base_dData_dList.v_Base_dData_dList_dmap (fun p -> (String.concat "" [" (param "; (Vuna_dCompiler_dWasm_dModel.v_Vuna_dCompiler_dWasm_dModel_dwatValTyText p); ")"]))) params))))

# 222 "Vuna/Compiler/Wasm/Render.vuna"
let v_Vuna_dCompiler_dWasm_dRender_dfuncTypeMulti = (fun name params results -> ((fun openLine -> ((fun funcLine -> ((fun paramLines -> ((fun resultLines -> ((fun closeFunc -> ((fun closeType -> ((Base_dData_dList.v_Base_dData_dList_dappend openLine) ((Base_dData_dList.v_Base_dData_dList_dappend funcLine) ((Base_dData_dList.v_Base_dData_dList_dappend paramLines) ((Base_dData_dList.v_Base_dData_dList_dappend resultLines) ((Base_dData_dList.v_Base_dData_dList_dappend closeFunc) closeType)))))) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (((v_Vuna_dCompiler_dWasm_dRender_dlineOf 2) ")"), Base_dData_dList.C_Base_dData_dList_dList_Nil)))) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (((v_Vuna_dCompiler_dWasm_dRender_dlineOf 4) ")"), Base_dData_dList.C_Base_dData_dList_dList_Nil)))) ((Base_dData_dList.v_Base_dData_dList_dmap (v_Vuna_dCompiler_dWasm_dRender_dlineOf 6)) ((Base_dData_dList.v_Base_dData_dList_dmap v_Vuna_dCompiler_dWasm_dRender_drenderResult) results)))) ((Base_dData_dList.v_Base_dData_dList_dmap (v_Vuna_dCompiler_dWasm_dRender_dlineOf 6)) ((Base_dData_dList.v_Base_dData_dList_dmap (fun p -> (String.concat "" ["(param "; (Vuna_dCompiler_dWasm_dModel.v_Vuna_dCompiler_dWasm_dModel_dwatValTyText p); ")"]))) params)))) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (((v_Vuna_dCompiler_dWasm_dRender_dlineOf 4) "(func"), Base_dData_dList.C_Base_dData_dList_dList_Nil)))) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (((v_Vuna_dCompiler_dWasm_dRender_dlineOf 2) ("(type " ^ name)), Base_dData_dList.C_Base_dData_dList_dList_Nil))))

# 234 "Vuna/Compiler/Wasm/Render.vuna"
let v_Vuna_dCompiler_dWasm_dRender_dstructTypeOne = (fun name fields -> ((fun fieldsText -> ((v_Vuna_dCompiler_dWasm_dRender_dlineOf 2) (String.concat "" ["(type "; name; " (struct"; fieldsText; "))"]))) ((v_Vuna_dCompiler_dWasm_dRender_djoinWith "") ((Base_dData_dList.v_Base_dData_dList_dmap (fun f -> (" " ^ (v_Vuna_dCompiler_dWasm_dRender_drenderField f)))) fields))))

# 240 "Vuna/Compiler/Wasm/Render.vuna"
let v_Vuna_dCompiler_dWasm_dRender_dstructTypeMulti = (fun name fields -> ((fun openLine -> ((fun structLine -> ((fun fieldLines -> ((fun closeStruct -> ((fun closeType -> ((Base_dData_dList.v_Base_dData_dList_dappend openLine) ((Base_dData_dList.v_Base_dData_dList_dappend structLine) ((Base_dData_dList.v_Base_dData_dList_dappend fieldLines) ((Base_dData_dList.v_Base_dData_dList_dappend closeStruct) closeType))))) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (((v_Vuna_dCompiler_dWasm_dRender_dlineOf 2) ")"), Base_dData_dList.C_Base_dData_dList_dList_Nil)))) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (((v_Vuna_dCompiler_dWasm_dRender_dlineOf 4) ")"), Base_dData_dList.C_Base_dData_dList_dList_Nil)))) ((Base_dData_dList.v_Base_dData_dList_dmap (v_Vuna_dCompiler_dWasm_dRender_dlineOf 6)) ((Base_dData_dList.v_Base_dData_dList_dmap v_Vuna_dCompiler_dWasm_dRender_drenderField) fields)))) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (((v_Vuna_dCompiler_dWasm_dRender_dlineOf 4) "(struct"), Base_dData_dList.C_Base_dData_dList_dList_Nil)))) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (((v_Vuna_dCompiler_dWasm_dRender_dlineOf 2) ("(type " ^ name)), Base_dData_dList.C_Base_dData_dList_dList_Nil))))

# 256 "Vuna/Compiler/Wasm/Render.vuna"
let v_Vuna_dCompiler_dWasm_dRender_drenderFuncType = (fun name params results -> (if (v_Vuna_dCompiler_dWasm_dRender_dfitsLine (((v_Vuna_dCompiler_dWasm_dRender_dfuncTypeOne name) params) results)) then (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ((((v_Vuna_dCompiler_dWasm_dRender_dfuncTypeOne name) params) results), Base_dData_dList.C_Base_dData_dList_dList_Nil)) else (((v_Vuna_dCompiler_dWasm_dRender_dfuncTypeMulti name) params) results)))

# 261 "Vuna/Compiler/Wasm/Render.vuna"
let v_Vuna_dCompiler_dWasm_dRender_drenderStructType = (fun name fields -> (if (v_Vuna_dCompiler_dWasm_dRender_dfitsLine ((v_Vuna_dCompiler_dWasm_dRender_dstructTypeOne name) fields)) then (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (((v_Vuna_dCompiler_dWasm_dRender_dstructTypeOne name) fields), Base_dData_dList.C_Base_dData_dList_dList_Nil)) else ((v_Vuna_dCompiler_dWasm_dRender_dstructTypeMulti name) fields)))

# 266 "Vuna/Compiler/Wasm/Render.vuna"
let v_Vuna_dCompiler_dWasm_dRender_drenderArrayType = (fun name mut elemTy -> ((fun elemText -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (((v_Vuna_dCompiler_dWasm_dRender_dlineOf 2) (String.concat "" ["(type "; name; " (array "; elemText; "))"])), Base_dData_dList.C_Base_dData_dList_dList_Nil))) (if mut then (String.concat "" ["(mut "; (Vuna_dCompiler_dWasm_dModel.v_Vuna_dCompiler_dWasm_dModel_dwatValTyText elemTy); ")"]) else (Vuna_dCompiler_dWasm_dModel.v_Vuna_dCompiler_dWasm_dModel_dwatValTyText elemTy))))

# 250 "Vuna/Compiler/Wasm/Render.vuna"
let v_Vuna_dCompiler_dWasm_dRender_drenderType = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dWasm_dModel.C_Vuna_dCompiler_dWasm_dModel_dWatType_WatContType (dtb__71, dtb__72) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (((v_Vuna_dCompiler_dWasm_dRender_dlineOf 2) (String.concat "" ["(type "; dtb__71; " (cont "; dtb__72; "))"])), Base_dData_dList.C_Base_dData_dList_dList_Nil))
  | Vuna_dCompiler_dWasm_dModel.C_Vuna_dCompiler_dWasm_dModel_dWatType_WatArrayType (dtb__73, dtb__74, dtb__75) -> (((v_Vuna_dCompiler_dWasm_dRender_drenderArrayType dtb__73) dtb__74) dtb__75)
  | Vuna_dCompiler_dWasm_dModel.C_Vuna_dCompiler_dWasm_dModel_dWatType_WatStructType (dtb__76, dtb__77) -> ((v_Vuna_dCompiler_dWasm_dRender_drenderStructType dtb__76) dtb__77)
  | Vuna_dCompiler_dWasm_dModel.C_Vuna_dCompiler_dWasm_dModel_dWatType_WatFuncType (dtb__78, dtb__79, dtb__80) -> (((v_Vuna_dCompiler_dWasm_dRender_drenderFuncType dtb__78) dtb__79) dtb__80)
  | _ -> failwith "DT: impossible branch"
))

# 275 "Vuna/Compiler/Wasm/Render.vuna"
let v_Vuna_dCompiler_dWasm_dRender_dimportOne = (fun imp -> ((fun paramsText -> ((fun resultsText -> ((v_Vuna_dCompiler_dWasm_dRender_dlineOf 2) (String.concat "" ["(import \""; (imp).Vuna_dCompiler_dWasm_dModel.f_Vuna_dCompiler_dWasm_dModel_dWatImport_watImportModule; "\" \""; (imp).Vuna_dCompiler_dWasm_dModel.f_Vuna_dCompiler_dWasm_dModel_dWatImport_watImportName; "\" (func "; (imp).Vuna_dCompiler_dWasm_dModel.f_Vuna_dCompiler_dWasm_dModel_dWatImport_watImportFunc; paramsText; resultsText; "))"]))) ((v_Vuna_dCompiler_dWasm_dRender_djoinWith "") ((Base_dData_dList.v_Base_dData_dList_dmap (fun r -> (" " ^ (v_Vuna_dCompiler_dWasm_dRender_drenderResult r)))) (imp).Vuna_dCompiler_dWasm_dModel.f_Vuna_dCompiler_dWasm_dModel_dWatImport_watImportResults)))) ((v_Vuna_dCompiler_dWasm_dRender_djoinWith "") ((Base_dData_dList.v_Base_dData_dList_dmap (fun p -> (String.concat "" [" (param "; (Vuna_dCompiler_dWasm_dModel.v_Vuna_dCompiler_dWasm_dModel_dwatValTyText p); ")"]))) (imp).Vuna_dCompiler_dWasm_dModel.f_Vuna_dCompiler_dWasm_dModel_dWatImport_watImportParams))))

# 283 "Vuna/Compiler/Wasm/Render.vuna"
let v_Vuna_dCompiler_dWasm_dRender_dimportMulti = (fun imp -> ((fun openLine -> ((fun funcLine -> ((fun paramLines -> ((fun resultLines -> ((fun closeFunc -> ((fun closeImport -> ((Base_dData_dList.v_Base_dData_dList_dappend openLine) ((Base_dData_dList.v_Base_dData_dList_dappend funcLine) ((Base_dData_dList.v_Base_dData_dList_dappend paramLines) ((Base_dData_dList.v_Base_dData_dList_dappend resultLines) ((Base_dData_dList.v_Base_dData_dList_dappend closeFunc) closeImport)))))) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (((v_Vuna_dCompiler_dWasm_dRender_dlineOf 2) ")"), Base_dData_dList.C_Base_dData_dList_dList_Nil)))) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (((v_Vuna_dCompiler_dWasm_dRender_dlineOf 4) ")"), Base_dData_dList.C_Base_dData_dList_dList_Nil)))) ((Base_dData_dList.v_Base_dData_dList_dmap (v_Vuna_dCompiler_dWasm_dRender_dlineOf 6)) ((Base_dData_dList.v_Base_dData_dList_dmap v_Vuna_dCompiler_dWasm_dRender_drenderResult) (imp).Vuna_dCompiler_dWasm_dModel.f_Vuna_dCompiler_dWasm_dModel_dWatImport_watImportResults)))) ((Base_dData_dList.v_Base_dData_dList_dmap (v_Vuna_dCompiler_dWasm_dRender_dlineOf 6)) ((Base_dData_dList.v_Base_dData_dList_dmap (fun p -> (String.concat "" ["(param "; (Vuna_dCompiler_dWasm_dModel.v_Vuna_dCompiler_dWasm_dModel_dwatValTyText p); ")"]))) (imp).Vuna_dCompiler_dWasm_dModel.f_Vuna_dCompiler_dWasm_dModel_dWatImport_watImportParams)))) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (((v_Vuna_dCompiler_dWasm_dRender_dlineOf 4) ("(func " ^ (imp).Vuna_dCompiler_dWasm_dModel.f_Vuna_dCompiler_dWasm_dModel_dWatImport_watImportFunc)), Base_dData_dList.C_Base_dData_dList_dList_Nil)))) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (((v_Vuna_dCompiler_dWasm_dRender_dlineOf 2) (String.concat "" ["(import \""; (imp).Vuna_dCompiler_dWasm_dModel.f_Vuna_dCompiler_dWasm_dModel_dWatImport_watImportModule; "\" \""; (imp).Vuna_dCompiler_dWasm_dModel.f_Vuna_dCompiler_dWasm_dModel_dWatImport_watImportName; "\""])), Base_dData_dList.C_Base_dData_dList_dList_Nil))))

# 295 "Vuna/Compiler/Wasm/Render.vuna"
let v_Vuna_dCompiler_dWasm_dRender_drenderTag = (fun t -> ((fun paramsText -> ((fun resultsText -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (((v_Vuna_dCompiler_dWasm_dRender_dlineOf 2) (String.concat "" ["(tag "; (t).Vuna_dCompiler_dWasm_dModel.f_Vuna_dCompiler_dWasm_dModel_dWatTag_watTagName; paramsText; resultsText; ")"])), Base_dData_dList.C_Base_dData_dList_dList_Nil))) ((v_Vuna_dCompiler_dWasm_dRender_djoinWith "") ((Base_dData_dList.v_Base_dData_dList_dmap (fun ty -> (String.concat "" [" (result "; (Vuna_dCompiler_dWasm_dModel.v_Vuna_dCompiler_dWasm_dModel_dwatValTyText ty); ")"]))) (t).Vuna_dCompiler_dWasm_dModel.f_Vuna_dCompiler_dWasm_dModel_dWatTag_watTagResults)))) ((v_Vuna_dCompiler_dWasm_dRender_djoinWith "") ((Base_dData_dList.v_Base_dData_dList_dmap (fun ty -> (String.concat "" [" (param "; (Vuna_dCompiler_dWasm_dModel.v_Vuna_dCompiler_dWasm_dModel_dwatValTyText ty); ")"]))) (t).Vuna_dCompiler_dWasm_dModel.f_Vuna_dCompiler_dWasm_dModel_dWatTag_watTagParams))))

# 302 "Vuna/Compiler/Wasm/Render.vuna"
let v_Vuna_dCompiler_dWasm_dRender_drenderImport = (fun imp -> (if (v_Vuna_dCompiler_dWasm_dRender_dfitsLine (v_Vuna_dCompiler_dWasm_dRender_dimportOne imp)) then (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ((v_Vuna_dCompiler_dWasm_dRender_dimportOne imp), Base_dData_dList.C_Base_dData_dList_dList_Nil)) else (v_Vuna_dCompiler_dWasm_dRender_dimportMulti imp)))

# 305 "Vuna/Compiler/Wasm/Render.vuna"
let v_Vuna_dCompiler_dWasm_dRender_drenderGlobal = (fun g -> ((fun initText -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (((v_Vuna_dCompiler_dWasm_dRender_dlineOf 2) (String.concat "" ["(global "; (g).Vuna_dCompiler_dWasm_dModel.f_Vuna_dCompiler_dWasm_dModel_dWatGlobal_watGlobalName; " (mut "; (Vuna_dCompiler_dWasm_dModel.v_Vuna_dCompiler_dWasm_dModel_dwatValTyText (g).Vuna_dCompiler_dWasm_dModel.f_Vuna_dCompiler_dWasm_dModel_dWatGlobal_watGlobalTy); ") "; initText; ")"])), Base_dData_dList.C_Base_dData_dList_dList_Nil))) ((v_Vuna_dCompiler_dWasm_dRender_djoinWith " ") ((Base_dData_dList.v_Base_dData_dList_dmap v_Vuna_dCompiler_dWasm_dRender_drenderInstrFlat) (g).Vuna_dCompiler_dWasm_dModel.f_Vuna_dCompiler_dWasm_dModel_dWatGlobal_watGlobalInit))))

# 311 "Vuna/Compiler/Wasm/Render.vuna"
let v_Vuna_dCompiler_dWasm_dRender_dfuncOpeningOne = (fun f -> ((fun typePart -> ((fun paramsText -> ((fun resultsText -> ((v_Vuna_dCompiler_dWasm_dRender_dlineOf 2) (String.concat "" ["(func "; (f).Vuna_dCompiler_dWasm_dModel.f_Vuna_dCompiler_dWasm_dModel_dWatFunc_watFuncName; typePart; paramsText; resultsText]))) ((v_Vuna_dCompiler_dWasm_dRender_djoinWith "") ((Base_dData_dList.v_Base_dData_dList_dmap (fun r -> (" " ^ (v_Vuna_dCompiler_dWasm_dRender_drenderResult r)))) (f).Vuna_dCompiler_dWasm_dModel.f_Vuna_dCompiler_dWasm_dModel_dWatFunc_watFuncResults)))) ((v_Vuna_dCompiler_dWasm_dRender_djoinWith "") ((Base_dData_dList.v_Base_dData_dList_dmap (fun p -> (" " ^ (v_Vuna_dCompiler_dWasm_dRender_drenderParam p)))) (f).Vuna_dCompiler_dWasm_dModel.f_Vuna_dCompiler_dWasm_dModel_dWatFunc_watFuncParams)))) (if ((f).Vuna_dCompiler_dWasm_dModel.f_Vuna_dCompiler_dWasm_dModel_dWatFunc_watFuncType = "") then "" else (String.concat "" [" (type "; (f).Vuna_dCompiler_dWasm_dModel.f_Vuna_dCompiler_dWasm_dModel_dWatFunc_watFuncType; ")"]))))

# 319 "Vuna/Compiler/Wasm/Render.vuna"
let v_Vuna_dCompiler_dWasm_dRender_dfuncOpeningMulti = (fun f -> ((fun typePart -> ((fun openLine -> ((fun paramLines -> ((fun resultLines -> ((Base_dData_dList.v_Base_dData_dList_dappend openLine) ((Base_dData_dList.v_Base_dData_dList_dappend paramLines) resultLines))) ((Base_dData_dList.v_Base_dData_dList_dmap (v_Vuna_dCompiler_dWasm_dRender_dlineOf 4)) ((Base_dData_dList.v_Base_dData_dList_dmap v_Vuna_dCompiler_dWasm_dRender_drenderResult) (f).Vuna_dCompiler_dWasm_dModel.f_Vuna_dCompiler_dWasm_dModel_dWatFunc_watFuncResults)))) ((Base_dData_dList.v_Base_dData_dList_dmap (v_Vuna_dCompiler_dWasm_dRender_dlineOf 4)) ((Base_dData_dList.v_Base_dData_dList_dmap v_Vuna_dCompiler_dWasm_dRender_drenderParam) (f).Vuna_dCompiler_dWasm_dModel.f_Vuna_dCompiler_dWasm_dModel_dWatFunc_watFuncParams)))) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (((v_Vuna_dCompiler_dWasm_dRender_dlineOf 2) (String.concat "" ["(func "; (f).Vuna_dCompiler_dWasm_dModel.f_Vuna_dCompiler_dWasm_dModel_dWatFunc_watFuncName; typePart])), Base_dData_dList.C_Base_dData_dList_dList_Nil)))) (if ((f).Vuna_dCompiler_dWasm_dModel.f_Vuna_dCompiler_dWasm_dModel_dWatFunc_watFuncType = "") then "" else (String.concat "" [" (type "; (f).Vuna_dCompiler_dWasm_dModel.f_Vuna_dCompiler_dWasm_dModel_dWatFunc_watFuncType; ")"]))))

# 328 "Vuna/Compiler/Wasm/Render.vuna"
let v_Vuna_dCompiler_dWasm_dRender_drenderFunc = (fun f -> ((fun opening -> ((fun locals -> ((fun body -> ((fun closeLine -> ((Base_dData_dList.v_Base_dData_dList_dappend opening) ((Base_dData_dList.v_Base_dData_dList_dappend locals) ((Base_dData_dList.v_Base_dData_dList_dappend body) closeLine)))) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (((v_Vuna_dCompiler_dWasm_dRender_dlineOf 2) ")"), Base_dData_dList.C_Base_dData_dList_dList_Nil)))) ((v_Vuna_dCompiler_dWasm_dRender_drenderInstrs 4) (f).Vuna_dCompiler_dWasm_dModel.f_Vuna_dCompiler_dWasm_dModel_dWatFunc_watFuncBody))) ((Base_dData_dList.v_Base_dData_dList_dmap (v_Vuna_dCompiler_dWasm_dRender_dlineOf 4)) ((Base_dData_dList.v_Base_dData_dList_dmap (fun p -> (String.concat "" ["(local "; ((Base_dTrait_dInterp.v_Base_dTrait_dInterp_dinterp Base_dTrait_dInterp.v_Interp_uString) (Base_dData_dPair.v_Base_dData_dPair_dfirstOf p)); " "; (Vuna_dCompiler_dWasm_dModel.v_Vuna_dCompiler_dWasm_dModel_dwatValTyText (Base_dData_dPair.v_Base_dData_dPair_dsecondOf p)); ")"]))) (f).Vuna_dCompiler_dWasm_dModel.f_Vuna_dCompiler_dWasm_dModel_dWatFunc_watFuncLocals)))) (if (v_Vuna_dCompiler_dWasm_dRender_dfitsLine (v_Vuna_dCompiler_dWasm_dRender_dfuncOpeningOne f)) then (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ((v_Vuna_dCompiler_dWasm_dRender_dfuncOpeningOne f), Base_dData_dList.C_Base_dData_dList_dList_Nil)) else (v_Vuna_dCompiler_dWasm_dRender_dfuncOpeningMulti f))))

# 339 "Vuna/Compiler/Wasm/Render.vuna"
let v_Vuna_dCompiler_dWasm_dRender_drenderExport = (fun e -> (if ((e).Vuna_dCompiler_dWasm_dModel.f_Vuna_dCompiler_dWasm_dModel_dWatExport_watExportKind = "memory") then (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (((v_Vuna_dCompiler_dWasm_dRender_dlineOf 2) (String.concat "" ["(memory (export \""; (e).Vuna_dCompiler_dWasm_dModel.f_Vuna_dCompiler_dWasm_dModel_dWatExport_watExportName; "\") "; (e).Vuna_dCompiler_dWasm_dModel.f_Vuna_dCompiler_dWasm_dModel_dWatExport_watExportRef; ")"])), Base_dData_dList.C_Base_dData_dList_dList_Nil)) else (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (((v_Vuna_dCompiler_dWasm_dRender_dlineOf 2) (String.concat "" ["(export \""; (e).Vuna_dCompiler_dWasm_dModel.f_Vuna_dCompiler_dWasm_dModel_dWatExport_watExportName; "\" ("; (e).Vuna_dCompiler_dWasm_dModel.f_Vuna_dCompiler_dWasm_dModel_dWatExport_watExportKind; " "; (e).Vuna_dCompiler_dWasm_dModel.f_Vuna_dCompiler_dWasm_dModel_dWatExport_watExportRef; "))"])), Base_dData_dList.C_Base_dData_dList_dList_Nil))))

# 345 "Vuna/Compiler/Wasm/Render.vuna"
let v_Vuna_dCompiler_dWasm_dRender_drenderElem = (fun mc0 -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | _ -> ((fun one -> (if (v_Vuna_dCompiler_dWasm_dRender_dfitsLine one) then (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (one, Base_dData_dList.C_Base_dData_dList_dList_Nil)) else ((Base_dData_dList.v_Base_dData_dList_dappend (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (((v_Vuna_dCompiler_dWasm_dRender_dlineOf 2) "(elem declare func"), Base_dData_dList.C_Base_dData_dList_dList_Nil))) ((Base_dData_dList.v_Base_dData_dList_dappend ((Base_dData_dList.v_Base_dData_dList_dmap (v_Vuna_dCompiler_dWasm_dRender_dlineOf 4)) mc0)) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (((v_Vuna_dCompiler_dWasm_dRender_dlineOf 2) ")"), Base_dData_dList.C_Base_dData_dList_dList_Nil)))))) ((v_Vuna_dCompiler_dWasm_dRender_dlineOf 2) (String.concat "" ["(elem declare func "; ((v_Vuna_dCompiler_dWasm_dRender_djoinWith " ") mc0); ")"])))
))

# 353 "Vuna/Compiler/Wasm/Render.vuna"
let v_Vuna_dCompiler_dWasm_dRender_drenderData = (fun d -> ((fun chunks -> ((fun quoted -> ((fun one -> (if (v_Vuna_dCompiler_dWasm_dRender_dfitsLine one) then (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (one, Base_dData_dList.C_Base_dData_dList_dList_Nil)) else ((Base_dData_dList.v_Base_dData_dList_dappend (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (((v_Vuna_dCompiler_dWasm_dRender_dlineOf 2) ("(data " ^ (d).Vuna_dCompiler_dWasm_dModel.f_Vuna_dCompiler_dWasm_dModel_dWatData_watDataName)), Base_dData_dList.C_Base_dData_dList_dList_Nil))) ((Base_dData_dList.v_Base_dData_dList_dappend ((Base_dData_dList.v_Base_dData_dList_dmap (v_Vuna_dCompiler_dWasm_dRender_dlineOf 4)) quoted)) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (((v_Vuna_dCompiler_dWasm_dRender_dlineOf 2) ")"), Base_dData_dList.C_Base_dData_dList_dList_Nil)))))) ((v_Vuna_dCompiler_dWasm_dRender_dlineOf 2) (String.concat "" ["(data "; (d).Vuna_dCompiler_dWasm_dModel.f_Vuna_dCompiler_dWasm_dModel_dWatData_watDataName; " "; ((v_Vuna_dCompiler_dWasm_dRender_djoinWith " ") quoted); ")"])))) ((Base_dData_dList.v_Base_dData_dList_dmap (fun c -> (String.concat "" ["\""; (v_Vuna_dCompiler_dWasm_dRender_dwatString (Base_dData_dList.dtp_pack c)); "\""]))) chunks))) (v_Vuna_dCompiler_dWasm_dRender_dchunkBytes (Base_dData_dList.dtp_unpack (d).Vuna_dCompiler_dWasm_dModel.f_Vuna_dCompiler_dWasm_dModel_dWatData_watDataBytes))))

# 365 "Vuna/Compiler/Wasm/Render.vuna"
let v_Vuna_dCompiler_dWasm_dRender_dsectionComment = (fun title -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ("", (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (((v_Vuna_dCompiler_dWasm_dRender_dlineOf 0) (";; " ^ title)), Base_dData_dList.C_Base_dData_dList_dList_Nil)))))

# 368 "Vuna/Compiler/Wasm/Render.vuna"
let v_Vuna_dCompiler_dWasm_dRender_dmoduleLines = (fun m -> ((fun typeLines -> ((fun tagLines -> ((fun importLines -> ((fun globalLines -> ((fun funcLines -> ((fun elemLines -> ((fun dataLines -> ((fun exportLines -> ((fun memoryLines -> ((Base_dData_dList.v_Base_dData_dList_dappend (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ("(module", Base_dData_dList.C_Base_dData_dList_dList_Nil))) ((Base_dData_dList.v_Base_dData_dList_dappend (v_Vuna_dCompiler_dWasm_dRender_dsectionComment "types")) ((Base_dData_dList.v_Base_dData_dList_dappend typeLines) ((Base_dData_dList.v_Base_dData_dList_dappend (v_Vuna_dCompiler_dWasm_dRender_dsectionComment "tags")) ((Base_dData_dList.v_Base_dData_dList_dappend tagLines) ((Base_dData_dList.v_Base_dData_dList_dappend (v_Vuna_dCompiler_dWasm_dRender_dsectionComment "imports")) ((Base_dData_dList.v_Base_dData_dList_dappend importLines) ((Base_dData_dList.v_Base_dData_dList_dappend (v_Vuna_dCompiler_dWasm_dRender_dsectionComment "memory")) ((Base_dData_dList.v_Base_dData_dList_dappend memoryLines) ((Base_dData_dList.v_Base_dData_dList_dappend (v_Vuna_dCompiler_dWasm_dRender_dsectionComment "globals")) ((Base_dData_dList.v_Base_dData_dList_dappend globalLines) ((Base_dData_dList.v_Base_dData_dList_dappend (v_Vuna_dCompiler_dWasm_dRender_dsectionComment "functions")) ((Base_dData_dList.v_Base_dData_dList_dappend funcLines) ((Base_dData_dList.v_Base_dData_dList_dappend (v_Vuna_dCompiler_dWasm_dRender_dsectionComment "elements")) ((Base_dData_dList.v_Base_dData_dList_dappend elemLines) ((Base_dData_dList.v_Base_dData_dList_dappend (v_Vuna_dCompiler_dWasm_dRender_dsectionComment "data")) ((Base_dData_dList.v_Base_dData_dList_dappend dataLines) ((Base_dData_dList.v_Base_dData_dList_dappend (v_Vuna_dCompiler_dWasm_dRender_dsectionComment "exports")) ((Base_dData_dList.v_Base_dData_dList_dappend exportLines) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (")", (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ("", Base_dData_dList.C_Base_dData_dList_dList_Nil)))))))))))))))))))))))) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (((v_Vuna_dCompiler_dWasm_dRender_dlineOf 2) (String.concat "" ["(memory (export \"memory\") "; (bi_strFromInt (m).Vuna_dCompiler_dWasm_dModel.f_Vuna_dCompiler_dWasm_dModel_dWasmModule_wmMemPages); ")"])), Base_dData_dList.C_Base_dData_dList_dList_Nil)))) ((Base_dData_dList.v_Base_dData_dList_dconcatMap v_Vuna_dCompiler_dWasm_dRender_drenderExport) (m).Vuna_dCompiler_dWasm_dModel.f_Vuna_dCompiler_dWasm_dModel_dWasmModule_wmExports))) (match (m).Vuna_dCompiler_dWasm_dModel.f_Vuna_dCompiler_dWasm_dModel_dWasmModule_wmData with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__81) -> (v_Vuna_dCompiler_dWasm_dRender_drenderData dtb__81)
  | _ -> failwith "DT: impossible branch"
))) (v_Vuna_dCompiler_dWasm_dRender_drenderElem (m).Vuna_dCompiler_dWasm_dModel.f_Vuna_dCompiler_dWasm_dModel_dWasmModule_wmElems))) ((Base_dData_dList.v_Base_dData_dList_dconcatMap v_Vuna_dCompiler_dWasm_dRender_drenderFunc) (m).Vuna_dCompiler_dWasm_dModel.f_Vuna_dCompiler_dWasm_dModel_dWasmModule_wmFuncs))) ((Base_dData_dList.v_Base_dData_dList_dconcatMap v_Vuna_dCompiler_dWasm_dRender_drenderGlobal) (m).Vuna_dCompiler_dWasm_dModel.f_Vuna_dCompiler_dWasm_dModel_dWasmModule_wmGlobals))) ((Base_dData_dList.v_Base_dData_dList_dconcatMap v_Vuna_dCompiler_dWasm_dRender_drenderImport) (m).Vuna_dCompiler_dWasm_dModel.f_Vuna_dCompiler_dWasm_dModel_dWasmModule_wmImports))) ((Base_dData_dList.v_Base_dData_dList_dconcatMap v_Vuna_dCompiler_dWasm_dRender_drenderTag) (m).Vuna_dCompiler_dWasm_dModel.f_Vuna_dCompiler_dWasm_dModel_dWasmModule_wmTags))) ((Base_dData_dList.v_Base_dData_dList_dconcatMap v_Vuna_dCompiler_dWasm_dRender_drenderType) (m).Vuna_dCompiler_dWasm_dModel.f_Vuna_dCompiler_dWasm_dModel_dWasmModule_wmTypes)))

# 385 "Vuna/Compiler/Wasm/Render.vuna"
let v_Vuna_dCompiler_dWasm_dRender_drenderModule = (fun m -> ((v_Vuna_dCompiler_dWasm_dRender_djoinWith "\n") (v_Vuna_dCompiler_dWasm_dRender_dmoduleLines m)))
