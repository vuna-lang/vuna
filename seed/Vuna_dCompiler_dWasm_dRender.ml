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
let v_Vuna_dCompiler_dWasm_dRender_djoinWith = (fun sep xs -> ((Base_dString.v_Base_dString_djoin sep) xs))

# 44 "Vuna/Compiler/Wasm/Render.vuna"
let v_Vuna_dCompiler_dWasm_dRender_dflushWord = (fun mc0 mc1 -> (if (mc0 = "") then mc1 else (Base_dList.C_Base_dList_dList_Cons (mc0, mc1))))

# 39 "Vuna/Compiler/Wasm/Render.vuna"
let rec v_Vuna_dCompiler_dWasm_dRender_dwordsOfGo = (fun mc0 mc1 mc2 -> (match mc2 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__0, dtb__1) -> (if (dtb__0 = 32) then (((v_Vuna_dCompiler_dWasm_dRender_dwordsOfGo "") ((v_Vuna_dCompiler_dWasm_dRender_dflushWord mc0) mc1)) dtb__1) else (((v_Vuna_dCompiler_dWasm_dRender_dwordsOfGo (mc0 ^ (Base_dList.dtp_pack (Base_dList.C_Base_dList_dList_Cons (dtb__0, Base_dList.C_Base_dList_dList_Nil))))) mc1) dtb__1))
  | Base_dList.C_Base_dList_dList_Nil -> ((v_Vuna_dCompiler_dWasm_dRender_dflushWord mc0) mc1)
  | _ -> failwith "DT: impossible branch"
))

# 36 "Vuna/Compiler/Wasm/Render.vuna"
let v_Vuna_dCompiler_dWasm_dRender_dwordsOf = (fun s -> (Base_dList.v_Base_dList_dreverse (((v_Vuna_dCompiler_dWasm_dRender_dwordsOfGo "") Base_dList.C_Base_dList_dList_Nil) (Base_dList.dtp_unpack s))))

# 51 "Vuna/Compiler/Wasm/Render.vuna"
let rec v_Vuna_dCompiler_dWasm_dRender_dwrapWords = (fun mc0 mc1 mc2 -> (match mc2 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__2, dtb__3) -> ((fun cand -> (if (v_Vuna_dCompiler_dWasm_dRender_dfitsLine ((v_Vuna_dCompiler_dWasm_dRender_dlineOf mc0) cand)) then (((v_Vuna_dCompiler_dWasm_dRender_dwrapWords mc0) cand) dtb__3) else (Base_dList.C_Base_dList_dList_Cons (((v_Vuna_dCompiler_dWasm_dRender_dlineOf mc0) mc1), (((v_Vuna_dCompiler_dWasm_dRender_dwrapWords mc0) dtb__2) dtb__3))))) (if (mc1 = "") then dtb__2 else (String.concat "" [mc1; " "; dtb__2])))
  | Base_dList.C_Base_dList_dList_Nil -> (if (mc1 = "") then Base_dList.C_Base_dList_dList_Nil else (Base_dList.C_Base_dList_dList_Cons (((v_Vuna_dCompiler_dWasm_dRender_dlineOf mc0) mc1), Base_dList.C_Base_dList_dList_Nil)))
  | _ -> failwith "DT: impossible branch"
))

# 48 "Vuna/Compiler/Wasm/Render.vuna"
let v_Vuna_dCompiler_dWasm_dRender_dwrapComment = (fun indent text -> (((v_Vuna_dCompiler_dWasm_dRender_dwrapWords indent) "") (v_Vuna_dCompiler_dWasm_dRender_dwordsOf text)))

# 62 "Vuna/Compiler/Wasm/Render.vuna"
let v_Vuna_dCompiler_dWasm_dRender_dhexDigit = (fun n -> (if (n < 10) then (Base_dList.dtp_pack (Base_dList.C_Base_dList_dList_Cons ((48 + n), Base_dList.C_Base_dList_dList_Nil))) else (Base_dList.dtp_pack (Base_dList.C_Base_dList_dList_Cons ((87 + n), Base_dList.C_Base_dList_dList_Nil)))))

# 65 "Vuna/Compiler/Wasm/Render.vuna"
let v_Vuna_dCompiler_dWasm_dRender_dhex2 = (fun n -> ((v_Vuna_dCompiler_dWasm_dRender_dhexDigit (if 16 = 0 then failwith "division by zero" else n / 16)) ^ (v_Vuna_dCompiler_dWasm_dRender_dhexDigit (n - ((if 16 = 0 then failwith "division by zero" else n / 16) * 16)))))

# 68 "Vuna/Compiler/Wasm/Render.vuna"
let v_Vuna_dCompiler_dWasm_dRender_dwatEscapeChar = (fun c -> (if (c = 34) then "\\\"" else (if (c = 92) then "\\\\" else (if (if (c >= 32) then (c <= 126) else false) then (Base_dList.dtp_pack (Base_dList.C_Base_dList_dList_Cons (c, Base_dList.C_Base_dList_dList_Nil))) else ("\\" ^ (v_Vuna_dCompiler_dWasm_dRender_dhex2 c))))))

# 74 "Vuna/Compiler/Wasm/Render.vuna"
let v_Vuna_dCompiler_dWasm_dRender_dwatString = (fun s -> (Base_dList.dtp_pack ((Base_dList.v_Base_dList_dconcatMap (fun c -> (Base_dList.dtp_unpack (v_Vuna_dCompiler_dWasm_dRender_dwatEscapeChar c)))) (Base_dList.dtp_unpack s))))

# 81 "Vuna/Compiler/Wasm/Render.vuna"
let rec v_Vuna_dCompiler_dWasm_dRender_dchunkBytesGo = (fun mc0 mc1 mc2 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__4, dtb__5) -> (if (mc1 = 0) then (Base_dList.C_Base_dList_dList_Cons ((Base_dList.v_Base_dList_dreverse mc2), (((v_Vuna_dCompiler_dWasm_dRender_dchunkBytesGo (Base_dList.C_Base_dList_dList_Cons (dtb__4, dtb__5))) 24) Base_dList.C_Base_dList_dList_Nil))) else (((v_Vuna_dCompiler_dWasm_dRender_dchunkBytesGo dtb__5) (mc1 - 1)) (Base_dList.C_Base_dList_dList_Cons (dtb__4, mc2))))
  | Base_dList.C_Base_dList_dList_Nil -> (if (((Base_dEq.v_Base_dEq_deq (Base_dList.v_Eq_uBase_uList_uList_ua Base_dInt.v_Eq_uInt)) mc2) Base_dList.C_Base_dList_dList_Nil) then Base_dList.C_Base_dList_dList_Nil else (Base_dList.C_Base_dList_dList_Cons ((Base_dList.v_Base_dList_dreverse mc2), Base_dList.C_Base_dList_dList_Nil)))
  | _ -> failwith "DT: impossible branch"
))

# 78 "Vuna/Compiler/Wasm/Render.vuna"
let v_Vuna_dCompiler_dWasm_dRender_dchunkBytes = (fun bytes -> (((v_Vuna_dCompiler_dWasm_dRender_dchunkBytesGo bytes) 24) Base_dList.C_Base_dList_dList_Nil))

# 89 "Vuna/Compiler/Wasm/Render.vuna"
let v_Vuna_dCompiler_dWasm_dRender_dresultSuffix = (fun mc0 -> (if (mc0 = "") then "" else (String.concat "" [" (result "; mc0; ")"])))

# 93 "Vuna/Compiler/Wasm/Render.vuna"
let v_Vuna_dCompiler_dWasm_dRender_drenderInstrFlat = (fun i -> (match i with
  | Vuna_dCompiler_dWasm_dInstr.C_Vuna_dCompiler_dWasm_dInstr_dInstr_INop -> "nop"
  | Vuna_dCompiler_dWasm_dInstr.C_Vuna_dCompiler_dWasm_dInstr_dInstr_IUnreachable -> "unreachable"
  | Vuna_dCompiler_dWasm_dInstr.C_Vuna_dCompiler_dWasm_dInstr_dInstr_IReturn -> "return"
  | Vuna_dCompiler_dWasm_dInstr.C_Vuna_dCompiler_dWasm_dInstr_dInstr_IDrop -> "drop"
  | Vuna_dCompiler_dWasm_dInstr.C_Vuna_dCompiler_dWasm_dInstr_dInstr_ILocalGet (dtb__6) -> ("local.get " ^ dtb__6)
  | Vuna_dCompiler_dWasm_dInstr.C_Vuna_dCompiler_dWasm_dInstr_dInstr_ILocalSet (dtb__7) -> ("local.set " ^ dtb__7)
  | Vuna_dCompiler_dWasm_dInstr.C_Vuna_dCompiler_dWasm_dInstr_dInstr_ILocalTee (dtb__8) -> ("local.tee " ^ dtb__8)
  | Vuna_dCompiler_dWasm_dInstr.C_Vuna_dCompiler_dWasm_dInstr_dInstr_IGlobalGet (dtb__9) -> ("global.get " ^ dtb__9)
  | Vuna_dCompiler_dWasm_dInstr.C_Vuna_dCompiler_dWasm_dInstr_dInstr_IGlobalSet (dtb__10) -> ("global.set " ^ dtb__10)
  | Vuna_dCompiler_dWasm_dInstr.C_Vuna_dCompiler_dWasm_dInstr_dInstr_IConstI32 (dtb__11) -> ("i32.const " ^ (bi_strFromInt dtb__11))
  | Vuna_dCompiler_dWasm_dInstr.C_Vuna_dCompiler_dWasm_dInstr_dInstr_IConstI64 (dtb__12) -> ("i64.const " ^ (bi_strFromInt dtb__12))
  | Vuna_dCompiler_dWasm_dInstr.C_Vuna_dCompiler_dWasm_dInstr_dInstr_IPlain (dtb__13) -> dtb__13
  | Vuna_dCompiler_dWasm_dInstr.C_Vuna_dCompiler_dWasm_dInstr_dInstr_IUnop (dtb__14) -> dtb__14
  | Vuna_dCompiler_dWasm_dInstr.C_Vuna_dCompiler_dWasm_dInstr_dInstr_IBinop (dtb__15) -> dtb__15
  | Vuna_dCompiler_dWasm_dInstr.C_Vuna_dCompiler_dWasm_dInstr_dInstr_ICall (dtb__16) -> ("call " ^ dtb__16)
  | Vuna_dCompiler_dWasm_dInstr.C_Vuna_dCompiler_dWasm_dInstr_dInstr_ICallRef (dtb__17) -> ("call_ref " ^ dtb__17)
  | Vuna_dCompiler_dWasm_dInstr.C_Vuna_dCompiler_dWasm_dInstr_dInstr_IRefFunc (dtb__18) -> ("ref.func " ^ dtb__18)
  | Vuna_dCompiler_dWasm_dInstr.C_Vuna_dCompiler_dWasm_dInstr_dInstr_IRefNull -> "ref.null any"
  | Vuna_dCompiler_dWasm_dInstr.C_Vuna_dCompiler_dWasm_dInstr_dInstr_IRefCast (dtb__19) -> (String.concat "" ["ref.cast (ref "; dtb__19; ")"])
  | Vuna_dCompiler_dWasm_dInstr.C_Vuna_dCompiler_dWasm_dInstr_dInstr_IRefAsNonNull -> "ref.as_non_null"
  | Vuna_dCompiler_dWasm_dInstr.C_Vuna_dCompiler_dWasm_dInstr_dInstr_IStructNew (dtb__20) -> ("struct.new " ^ dtb__20)
  | Vuna_dCompiler_dWasm_dInstr.C_Vuna_dCompiler_dWasm_dInstr_dInstr_IStructGet (dtb__21, dtb__22) -> (String.concat "" ["struct.get "; dtb__21; " "; (bi_strFromInt dtb__22)])
  | Vuna_dCompiler_dWasm_dInstr.C_Vuna_dCompiler_dWasm_dInstr_dInstr_IStructSet (dtb__23, dtb__24) -> (String.concat "" ["struct.set "; dtb__23; " "; (bi_strFromInt dtb__24)])
  | Vuna_dCompiler_dWasm_dInstr.C_Vuna_dCompiler_dWasm_dInstr_dInstr_IArrayNew (dtb__25) -> ("array.new " ^ dtb__25)
  | Vuna_dCompiler_dWasm_dInstr.C_Vuna_dCompiler_dWasm_dInstr_dInstr_IArrayNewDefault (dtb__26) -> ("array.new_default " ^ dtb__26)
  | Vuna_dCompiler_dWasm_dInstr.C_Vuna_dCompiler_dWasm_dInstr_dInstr_IArrayNewFixed (dtb__27, dtb__28) -> (String.concat "" ["array.new_fixed "; dtb__27; " "; (bi_strFromInt dtb__28)])
  | Vuna_dCompiler_dWasm_dInstr.C_Vuna_dCompiler_dWasm_dInstr_dInstr_IArrayNewData (dtb__29, dtb__30) -> (String.concat "" ["array.new_data "; dtb__29; " "; dtb__30])
  | Vuna_dCompiler_dWasm_dInstr.C_Vuna_dCompiler_dWasm_dInstr_dInstr_IArrayGet (dtb__31) -> ("array.get " ^ dtb__31)
  | Vuna_dCompiler_dWasm_dInstr.C_Vuna_dCompiler_dWasm_dInstr_dInstr_IArrayGetU (dtb__32) -> ("array.get_u " ^ dtb__32)
  | Vuna_dCompiler_dWasm_dInstr.C_Vuna_dCompiler_dWasm_dInstr_dInstr_IArrayGetS (dtb__33) -> ("array.get_s " ^ dtb__33)
  | Vuna_dCompiler_dWasm_dInstr.C_Vuna_dCompiler_dWasm_dInstr_dInstr_IArraySet (dtb__34) -> ("array.set " ^ dtb__34)
  | Vuna_dCompiler_dWasm_dInstr.C_Vuna_dCompiler_dWasm_dInstr_dInstr_IArrayLen -> "array.len"
  | Vuna_dCompiler_dWasm_dInstr.C_Vuna_dCompiler_dWasm_dInstr_dInstr_IArrayCopy (dtb__35, dtb__36) -> (String.concat "" ["array.copy "; dtb__35; " "; dtb__36])
  | Vuna_dCompiler_dWasm_dInstr.C_Vuna_dCompiler_dWasm_dInstr_dInstr_II31New -> "ref.i31"
  | Vuna_dCompiler_dWasm_dInstr.C_Vuna_dCompiler_dWasm_dInstr_dInstr_II31GetU -> "i31.get_u"
  | Vuna_dCompiler_dWasm_dInstr.C_Vuna_dCompiler_dWasm_dInstr_dInstr_II31GetS -> "i31.get_s"
  | Vuna_dCompiler_dWasm_dInstr.C_Vuna_dCompiler_dWasm_dInstr_dInstr_IIf (dtb__37, dtb__38, dtb__39) -> ""
  | Vuna_dCompiler_dWasm_dInstr.C_Vuna_dCompiler_dWasm_dInstr_dInstr_IBlock (dtb__40, dtb__41, dtb__42) -> ""
  | Vuna_dCompiler_dWasm_dInstr.C_Vuna_dCompiler_dWasm_dInstr_dInstr_ILoop (dtb__43, dtb__44, dtb__45) -> ""
  | Vuna_dCompiler_dWasm_dInstr.C_Vuna_dCompiler_dWasm_dInstr_dInstr_IBr (dtb__46) -> ("br " ^ dtb__46)
  | Vuna_dCompiler_dWasm_dInstr.C_Vuna_dCompiler_dWasm_dInstr_dInstr_IBrIf (dtb__47) -> ("br_if " ^ dtb__47)
  | Vuna_dCompiler_dWasm_dInstr.C_Vuna_dCompiler_dWasm_dInstr_dInstr_IMemoryGrow -> "memory.grow"
  | Vuna_dCompiler_dWasm_dInstr.C_Vuna_dCompiler_dWasm_dInstr_dInstr_IMemorySize -> "memory.size"
  | Vuna_dCompiler_dWasm_dInstr.C_Vuna_dCompiler_dWasm_dInstr_dInstr_ILoad8U -> "i32.load8_u"
  | Vuna_dCompiler_dWasm_dInstr.C_Vuna_dCompiler_dWasm_dInstr_dInstr_IStore8 -> "i32.store8"
  | Vuna_dCompiler_dWasm_dInstr.C_Vuna_dCompiler_dWasm_dInstr_dInstr_ILoad32 -> "i32.load"
  | Vuna_dCompiler_dWasm_dInstr.C_Vuna_dCompiler_dWasm_dInstr_dInstr_IStore32 -> "i32.store"
  | Vuna_dCompiler_dWasm_dInstr.C_Vuna_dCompiler_dWasm_dInstr_dInstr_IComment (dtb__48) -> ""
  | _ -> failwith "DT: impossible branch"
))

# 144 "Vuna/Compiler/Wasm/Render.vuna"
let rec v_Vuna_dCompiler_dWasm_dRender_drenderInstrs = (fun indent instrs -> ((Base_dList.v_Base_dList_dconcatMap (v_Vuna_dCompiler_dWasm_dRender_drenderInstr indent)) instrs))
# 147 "Vuna/Compiler/Wasm/Render.vuna"
and v_Vuna_dCompiler_dWasm_dRender_drenderInstr = (fun indent i -> (match i with
  | Vuna_dCompiler_dWasm_dInstr.C_Vuna_dCompiler_dWasm_dInstr_dInstr_IIf (dtb__49, dtb__50, dtb__51) -> ((((v_Vuna_dCompiler_dWasm_dRender_drenderIf indent) dtb__49) dtb__50) dtb__51)
  | Vuna_dCompiler_dWasm_dInstr.C_Vuna_dCompiler_dWasm_dInstr_dInstr_IBlock (dtb__52, dtb__53, dtb__54) -> ((((v_Vuna_dCompiler_dWasm_dRender_drenderBlock indent) dtb__52) dtb__53) dtb__54)
  | Vuna_dCompiler_dWasm_dInstr.C_Vuna_dCompiler_dWasm_dInstr_dInstr_ILoop (dtb__55, dtb__56, dtb__57) -> ((((v_Vuna_dCompiler_dWasm_dRender_drenderLoop indent) dtb__55) dtb__56) dtb__57)
  | Vuna_dCompiler_dWasm_dInstr.C_Vuna_dCompiler_dWasm_dInstr_dInstr_IComment (dtb__58) -> ((Base_dList.v_Base_dList_dmap (v_Vuna_dCompiler_dWasm_dRender_dlineOf indent)) ((v_Vuna_dCompiler_dWasm_dRender_dwrapComment 0) (";; " ^ dtb__58)))
  | _ -> (Base_dList.C_Base_dList_dList_Cons (((v_Vuna_dCompiler_dWasm_dRender_dlineOf indent) (v_Vuna_dCompiler_dWasm_dRender_drenderInstrFlat i)), Base_dList.C_Base_dList_dList_Nil))
))
# 155 "Vuna/Compiler/Wasm/Render.vuna"
and v_Vuna_dCompiler_dWasm_dRender_drenderIf = (fun indent resultTy th el -> ((fun openLine -> ((fun thenBody -> ((fun elseLine -> ((fun elseBody -> ((fun endLine -> ((Base_dList.v_Base_dList_dappend openLine) ((Base_dList.v_Base_dList_dappend thenBody) ((Base_dList.v_Base_dList_dappend elseLine) ((Base_dList.v_Base_dList_dappend elseBody) endLine))))) (Base_dList.C_Base_dList_dList_Cons (((v_Vuna_dCompiler_dWasm_dRender_dlineOf indent) "end"), Base_dList.C_Base_dList_dList_Nil)))) ((v_Vuna_dCompiler_dWasm_dRender_drenderInstrs (indent + 2)) el))) (Base_dList.C_Base_dList_dList_Cons (((v_Vuna_dCompiler_dWasm_dRender_dlineOf indent) "else"), Base_dList.C_Base_dList_dList_Nil)))) ((v_Vuna_dCompiler_dWasm_dRender_drenderInstrs (indent + 2)) th))) (Base_dList.C_Base_dList_dList_Cons (((v_Vuna_dCompiler_dWasm_dRender_dlineOf indent) ("if" ^ (v_Vuna_dCompiler_dWasm_dRender_dresultSuffix resultTy))), Base_dList.C_Base_dList_dList_Nil))))
# 165 "Vuna/Compiler/Wasm/Render.vuna"
and v_Vuna_dCompiler_dWasm_dRender_drenderBlock = (fun indent label resultTy body -> ((fun openLine -> ((Base_dList.v_Base_dList_dappend openLine) ((Base_dList.v_Base_dList_dappend ((v_Vuna_dCompiler_dWasm_dRender_drenderInstrs (indent + 2)) body)) (Base_dList.C_Base_dList_dList_Cons (((v_Vuna_dCompiler_dWasm_dRender_dlineOf indent) "end"), Base_dList.C_Base_dList_dList_Nil))))) (Base_dList.C_Base_dList_dList_Cons (((v_Vuna_dCompiler_dWasm_dRender_dlineOf indent) (String.concat "" ["block "; label; (v_Vuna_dCompiler_dWasm_dRender_dresultSuffix resultTy)])), Base_dList.C_Base_dList_dList_Nil))))
# 171 "Vuna/Compiler/Wasm/Render.vuna"
and v_Vuna_dCompiler_dWasm_dRender_drenderLoop = (fun indent label resultTy body -> ((fun openLine -> ((Base_dList.v_Base_dList_dappend openLine) ((Base_dList.v_Base_dList_dappend ((v_Vuna_dCompiler_dWasm_dRender_drenderInstrs (indent + 2)) body)) (Base_dList.C_Base_dList_dList_Cons (((v_Vuna_dCompiler_dWasm_dRender_dlineOf indent) "end"), Base_dList.C_Base_dList_dList_Nil))))) (Base_dList.C_Base_dList_dList_Cons (((v_Vuna_dCompiler_dWasm_dRender_dlineOf indent) (String.concat "" ["loop "; label; (v_Vuna_dCompiler_dWasm_dRender_dresultSuffix resultTy)])), Base_dList.C_Base_dList_dList_Nil))))

# 180 "Vuna/Compiler/Wasm/Render.vuna"
let v_Vuna_dCompiler_dWasm_dRender_drenderParam = (fun p -> (String.concat "" ["(param "; (Base_dPair.v_Base_dPair_dfirstOf p); " "; (Vuna_dCompiler_dWasm_dModel.v_Vuna_dCompiler_dWasm_dModel_dwatValTyText (Base_dPair.v_Base_dPair_dsecondOf p)); ")"]))

# 183 "Vuna/Compiler/Wasm/Render.vuna"
let v_Vuna_dCompiler_dWasm_dRender_drenderResult = (fun ty -> (String.concat "" ["(result "; (Vuna_dCompiler_dWasm_dModel.v_Vuna_dCompiler_dWasm_dModel_dwatValTyText ty); ")"]))

# 186 "Vuna/Compiler/Wasm/Render.vuna"
let v_Vuna_dCompiler_dWasm_dRender_drenderField = (fun f -> ((fun tyText -> (String.concat "" ["(field "; tyText; ")"])) (if (f).Vuna_dCompiler_dWasm_dModel.f_Vuna_dCompiler_dWasm_dModel_dWatField_watFieldMut then (String.concat "" ["(mut "; (Vuna_dCompiler_dWasm_dModel.v_Vuna_dCompiler_dWasm_dModel_dwatValTyText (f).Vuna_dCompiler_dWasm_dModel.f_Vuna_dCompiler_dWasm_dModel_dWatField_watFieldTy); ")"]) else (Vuna_dCompiler_dWasm_dModel.v_Vuna_dCompiler_dWasm_dModel_dwatValTyText (f).Vuna_dCompiler_dWasm_dModel.f_Vuna_dCompiler_dWasm_dModel_dWatField_watFieldTy))))

# 194 "Vuna/Compiler/Wasm/Render.vuna"
let v_Vuna_dCompiler_dWasm_dRender_dfuncTypeOne = (fun name params results -> ((fun paramsText -> ((fun resultsText -> ((v_Vuna_dCompiler_dWasm_dRender_dlineOf 2) (String.concat "" ["(type "; name; " (func"; paramsText; resultsText; "))"]))) ((v_Vuna_dCompiler_dWasm_dRender_djoinWith "") ((Base_dList.v_Base_dList_dmap (fun r -> (" " ^ (v_Vuna_dCompiler_dWasm_dRender_drenderResult r)))) results)))) ((v_Vuna_dCompiler_dWasm_dRender_djoinWith "") ((Base_dList.v_Base_dList_dmap (fun p -> (String.concat "" [" (param "; (Vuna_dCompiler_dWasm_dModel.v_Vuna_dCompiler_dWasm_dModel_dwatValTyText p); ")"]))) params))))

# 201 "Vuna/Compiler/Wasm/Render.vuna"
let v_Vuna_dCompiler_dWasm_dRender_dfuncTypeMulti = (fun name params results -> ((fun openLine -> ((fun funcLine -> ((fun paramLines -> ((fun resultLines -> ((fun closeFunc -> ((fun closeType -> ((Base_dList.v_Base_dList_dappend openLine) ((Base_dList.v_Base_dList_dappend funcLine) ((Base_dList.v_Base_dList_dappend paramLines) ((Base_dList.v_Base_dList_dappend resultLines) ((Base_dList.v_Base_dList_dappend closeFunc) closeType)))))) (Base_dList.C_Base_dList_dList_Cons (((v_Vuna_dCompiler_dWasm_dRender_dlineOf 2) ")"), Base_dList.C_Base_dList_dList_Nil)))) (Base_dList.C_Base_dList_dList_Cons (((v_Vuna_dCompiler_dWasm_dRender_dlineOf 4) ")"), Base_dList.C_Base_dList_dList_Nil)))) ((Base_dList.v_Base_dList_dmap (v_Vuna_dCompiler_dWasm_dRender_dlineOf 6)) ((Base_dList.v_Base_dList_dmap v_Vuna_dCompiler_dWasm_dRender_drenderResult) results)))) ((Base_dList.v_Base_dList_dmap (v_Vuna_dCompiler_dWasm_dRender_dlineOf 6)) ((Base_dList.v_Base_dList_dmap (fun p -> (String.concat "" ["(param "; (Vuna_dCompiler_dWasm_dModel.v_Vuna_dCompiler_dWasm_dModel_dwatValTyText p); ")"]))) params)))) (Base_dList.C_Base_dList_dList_Cons (((v_Vuna_dCompiler_dWasm_dRender_dlineOf 4) "(func"), Base_dList.C_Base_dList_dList_Nil)))) (Base_dList.C_Base_dList_dList_Cons (((v_Vuna_dCompiler_dWasm_dRender_dlineOf 2) ("(type " ^ name)), Base_dList.C_Base_dList_dList_Nil))))

# 213 "Vuna/Compiler/Wasm/Render.vuna"
let v_Vuna_dCompiler_dWasm_dRender_dstructTypeOne = (fun name fields -> ((fun fieldsText -> ((v_Vuna_dCompiler_dWasm_dRender_dlineOf 2) (String.concat "" ["(type "; name; " (struct"; fieldsText; "))"]))) ((v_Vuna_dCompiler_dWasm_dRender_djoinWith "") ((Base_dList.v_Base_dList_dmap (fun f -> (" " ^ (v_Vuna_dCompiler_dWasm_dRender_drenderField f)))) fields))))

# 219 "Vuna/Compiler/Wasm/Render.vuna"
let v_Vuna_dCompiler_dWasm_dRender_dstructTypeMulti = (fun name fields -> ((fun openLine -> ((fun structLine -> ((fun fieldLines -> ((fun closeStruct -> ((fun closeType -> ((Base_dList.v_Base_dList_dappend openLine) ((Base_dList.v_Base_dList_dappend structLine) ((Base_dList.v_Base_dList_dappend fieldLines) ((Base_dList.v_Base_dList_dappend closeStruct) closeType))))) (Base_dList.C_Base_dList_dList_Cons (((v_Vuna_dCompiler_dWasm_dRender_dlineOf 2) ")"), Base_dList.C_Base_dList_dList_Nil)))) (Base_dList.C_Base_dList_dList_Cons (((v_Vuna_dCompiler_dWasm_dRender_dlineOf 4) ")"), Base_dList.C_Base_dList_dList_Nil)))) ((Base_dList.v_Base_dList_dmap (v_Vuna_dCompiler_dWasm_dRender_dlineOf 6)) ((Base_dList.v_Base_dList_dmap v_Vuna_dCompiler_dWasm_dRender_drenderField) fields)))) (Base_dList.C_Base_dList_dList_Cons (((v_Vuna_dCompiler_dWasm_dRender_dlineOf 4) "(struct"), Base_dList.C_Base_dList_dList_Nil)))) (Base_dList.C_Base_dList_dList_Cons (((v_Vuna_dCompiler_dWasm_dRender_dlineOf 2) ("(type " ^ name)), Base_dList.C_Base_dList_dList_Nil))))

# 235 "Vuna/Compiler/Wasm/Render.vuna"
let v_Vuna_dCompiler_dWasm_dRender_drenderFuncType = (fun name params results -> (if (v_Vuna_dCompiler_dWasm_dRender_dfitsLine (((v_Vuna_dCompiler_dWasm_dRender_dfuncTypeOne name) params) results)) then (Base_dList.C_Base_dList_dList_Cons ((((v_Vuna_dCompiler_dWasm_dRender_dfuncTypeOne name) params) results), Base_dList.C_Base_dList_dList_Nil)) else (((v_Vuna_dCompiler_dWasm_dRender_dfuncTypeMulti name) params) results)))

# 240 "Vuna/Compiler/Wasm/Render.vuna"
let v_Vuna_dCompiler_dWasm_dRender_drenderStructType = (fun name fields -> (if (v_Vuna_dCompiler_dWasm_dRender_dfitsLine ((v_Vuna_dCompiler_dWasm_dRender_dstructTypeOne name) fields)) then (Base_dList.C_Base_dList_dList_Cons (((v_Vuna_dCompiler_dWasm_dRender_dstructTypeOne name) fields), Base_dList.C_Base_dList_dList_Nil)) else ((v_Vuna_dCompiler_dWasm_dRender_dstructTypeMulti name) fields)))

# 245 "Vuna/Compiler/Wasm/Render.vuna"
let v_Vuna_dCompiler_dWasm_dRender_drenderArrayType = (fun name mut elemTy -> ((fun elemText -> (Base_dList.C_Base_dList_dList_Cons (((v_Vuna_dCompiler_dWasm_dRender_dlineOf 2) (String.concat "" ["(type "; name; " (array "; elemText; "))"])), Base_dList.C_Base_dList_dList_Nil))) (if mut then (String.concat "" ["(mut "; (Vuna_dCompiler_dWasm_dModel.v_Vuna_dCompiler_dWasm_dModel_dwatValTyText elemTy); ")"]) else (Vuna_dCompiler_dWasm_dModel.v_Vuna_dCompiler_dWasm_dModel_dwatValTyText elemTy))))

# 229 "Vuna/Compiler/Wasm/Render.vuna"
let v_Vuna_dCompiler_dWasm_dRender_drenderType = (fun ty -> (match ty with
  | Vuna_dCompiler_dWasm_dModel.C_Vuna_dCompiler_dWasm_dModel_dWatType_WatFuncType (dtb__59, dtb__60, dtb__61) -> (((v_Vuna_dCompiler_dWasm_dRender_drenderFuncType dtb__59) dtb__60) dtb__61)
  | Vuna_dCompiler_dWasm_dModel.C_Vuna_dCompiler_dWasm_dModel_dWatType_WatStructType (dtb__62, dtb__63) -> ((v_Vuna_dCompiler_dWasm_dRender_drenderStructType dtb__62) dtb__63)
  | Vuna_dCompiler_dWasm_dModel.C_Vuna_dCompiler_dWasm_dModel_dWatType_WatArrayType (dtb__64, dtb__65, dtb__66) -> (((v_Vuna_dCompiler_dWasm_dRender_drenderArrayType dtb__64) dtb__65) dtb__66)
  | _ -> failwith "DT: impossible branch"
))

# 254 "Vuna/Compiler/Wasm/Render.vuna"
let v_Vuna_dCompiler_dWasm_dRender_dimportOne = (fun imp -> ((fun paramsText -> ((fun resultsText -> ((v_Vuna_dCompiler_dWasm_dRender_dlineOf 2) (String.concat "" ["(import \""; (imp).Vuna_dCompiler_dWasm_dModel.f_Vuna_dCompiler_dWasm_dModel_dWatImport_watImportModule; "\" \""; (imp).Vuna_dCompiler_dWasm_dModel.f_Vuna_dCompiler_dWasm_dModel_dWatImport_watImportName; "\" (func "; (imp).Vuna_dCompiler_dWasm_dModel.f_Vuna_dCompiler_dWasm_dModel_dWatImport_watImportFunc; paramsText; resultsText; "))"]))) ((v_Vuna_dCompiler_dWasm_dRender_djoinWith "") ((Base_dList.v_Base_dList_dmap (fun r -> (" " ^ (v_Vuna_dCompiler_dWasm_dRender_drenderResult r)))) (imp).Vuna_dCompiler_dWasm_dModel.f_Vuna_dCompiler_dWasm_dModel_dWatImport_watImportResults)))) ((v_Vuna_dCompiler_dWasm_dRender_djoinWith "") ((Base_dList.v_Base_dList_dmap (fun p -> (String.concat "" [" (param "; (Vuna_dCompiler_dWasm_dModel.v_Vuna_dCompiler_dWasm_dModel_dwatValTyText p); ")"]))) (imp).Vuna_dCompiler_dWasm_dModel.f_Vuna_dCompiler_dWasm_dModel_dWatImport_watImportParams))))

# 262 "Vuna/Compiler/Wasm/Render.vuna"
let v_Vuna_dCompiler_dWasm_dRender_dimportMulti = (fun imp -> ((fun openLine -> ((fun funcLine -> ((fun paramLines -> ((fun resultLines -> ((fun closeFunc -> ((fun closeImport -> ((Base_dList.v_Base_dList_dappend openLine) ((Base_dList.v_Base_dList_dappend funcLine) ((Base_dList.v_Base_dList_dappend paramLines) ((Base_dList.v_Base_dList_dappend resultLines) ((Base_dList.v_Base_dList_dappend closeFunc) closeImport)))))) (Base_dList.C_Base_dList_dList_Cons (((v_Vuna_dCompiler_dWasm_dRender_dlineOf 2) ")"), Base_dList.C_Base_dList_dList_Nil)))) (Base_dList.C_Base_dList_dList_Cons (((v_Vuna_dCompiler_dWasm_dRender_dlineOf 4) ")"), Base_dList.C_Base_dList_dList_Nil)))) ((Base_dList.v_Base_dList_dmap (v_Vuna_dCompiler_dWasm_dRender_dlineOf 6)) ((Base_dList.v_Base_dList_dmap v_Vuna_dCompiler_dWasm_dRender_drenderResult) (imp).Vuna_dCompiler_dWasm_dModel.f_Vuna_dCompiler_dWasm_dModel_dWatImport_watImportResults)))) ((Base_dList.v_Base_dList_dmap (v_Vuna_dCompiler_dWasm_dRender_dlineOf 6)) ((Base_dList.v_Base_dList_dmap (fun p -> (String.concat "" ["(param "; (Vuna_dCompiler_dWasm_dModel.v_Vuna_dCompiler_dWasm_dModel_dwatValTyText p); ")"]))) (imp).Vuna_dCompiler_dWasm_dModel.f_Vuna_dCompiler_dWasm_dModel_dWatImport_watImportParams)))) (Base_dList.C_Base_dList_dList_Cons (((v_Vuna_dCompiler_dWasm_dRender_dlineOf 4) ("(func " ^ (imp).Vuna_dCompiler_dWasm_dModel.f_Vuna_dCompiler_dWasm_dModel_dWatImport_watImportFunc)), Base_dList.C_Base_dList_dList_Nil)))) (Base_dList.C_Base_dList_dList_Cons (((v_Vuna_dCompiler_dWasm_dRender_dlineOf 2) (String.concat "" ["(import \""; (imp).Vuna_dCompiler_dWasm_dModel.f_Vuna_dCompiler_dWasm_dModel_dWatImport_watImportModule; "\" \""; (imp).Vuna_dCompiler_dWasm_dModel.f_Vuna_dCompiler_dWasm_dModel_dWatImport_watImportName; "\""])), Base_dList.C_Base_dList_dList_Nil))))

# 274 "Vuna/Compiler/Wasm/Render.vuna"
let v_Vuna_dCompiler_dWasm_dRender_drenderImport = (fun imp -> (if (v_Vuna_dCompiler_dWasm_dRender_dfitsLine (v_Vuna_dCompiler_dWasm_dRender_dimportOne imp)) then (Base_dList.C_Base_dList_dList_Cons ((v_Vuna_dCompiler_dWasm_dRender_dimportOne imp), Base_dList.C_Base_dList_dList_Nil)) else (v_Vuna_dCompiler_dWasm_dRender_dimportMulti imp)))

# 277 "Vuna/Compiler/Wasm/Render.vuna"
let v_Vuna_dCompiler_dWasm_dRender_drenderGlobal = (fun g -> ((fun initText -> (Base_dList.C_Base_dList_dList_Cons (((v_Vuna_dCompiler_dWasm_dRender_dlineOf 2) (String.concat "" ["(global "; (g).Vuna_dCompiler_dWasm_dModel.f_Vuna_dCompiler_dWasm_dModel_dWatGlobal_watGlobalName; " (mut "; (Vuna_dCompiler_dWasm_dModel.v_Vuna_dCompiler_dWasm_dModel_dwatValTyText (g).Vuna_dCompiler_dWasm_dModel.f_Vuna_dCompiler_dWasm_dModel_dWatGlobal_watGlobalTy); ") "; initText; ")"])), Base_dList.C_Base_dList_dList_Nil))) ((v_Vuna_dCompiler_dWasm_dRender_djoinWith " ") ((Base_dList.v_Base_dList_dmap v_Vuna_dCompiler_dWasm_dRender_drenderInstrFlat) (g).Vuna_dCompiler_dWasm_dModel.f_Vuna_dCompiler_dWasm_dModel_dWatGlobal_watGlobalInit))))

# 283 "Vuna/Compiler/Wasm/Render.vuna"
let v_Vuna_dCompiler_dWasm_dRender_dfuncOpeningOne = (fun f -> ((fun typePart -> ((fun paramsText -> ((fun resultsText -> ((v_Vuna_dCompiler_dWasm_dRender_dlineOf 2) (String.concat "" ["(func "; (f).Vuna_dCompiler_dWasm_dModel.f_Vuna_dCompiler_dWasm_dModel_dWatFunc_watFuncName; typePart; paramsText; resultsText]))) ((v_Vuna_dCompiler_dWasm_dRender_djoinWith "") ((Base_dList.v_Base_dList_dmap (fun r -> (" " ^ (v_Vuna_dCompiler_dWasm_dRender_drenderResult r)))) (f).Vuna_dCompiler_dWasm_dModel.f_Vuna_dCompiler_dWasm_dModel_dWatFunc_watFuncResults)))) ((v_Vuna_dCompiler_dWasm_dRender_djoinWith "") ((Base_dList.v_Base_dList_dmap (fun p -> (" " ^ (v_Vuna_dCompiler_dWasm_dRender_drenderParam p)))) (f).Vuna_dCompiler_dWasm_dModel.f_Vuna_dCompiler_dWasm_dModel_dWatFunc_watFuncParams)))) (if ((f).Vuna_dCompiler_dWasm_dModel.f_Vuna_dCompiler_dWasm_dModel_dWatFunc_watFuncType = "") then "" else (String.concat "" [" (type "; (f).Vuna_dCompiler_dWasm_dModel.f_Vuna_dCompiler_dWasm_dModel_dWatFunc_watFuncType; ")"]))))

# 291 "Vuna/Compiler/Wasm/Render.vuna"
let v_Vuna_dCompiler_dWasm_dRender_dfuncOpeningMulti = (fun f -> ((fun typePart -> ((fun openLine -> ((fun paramLines -> ((fun resultLines -> ((Base_dList.v_Base_dList_dappend openLine) ((Base_dList.v_Base_dList_dappend paramLines) resultLines))) ((Base_dList.v_Base_dList_dmap (v_Vuna_dCompiler_dWasm_dRender_dlineOf 4)) ((Base_dList.v_Base_dList_dmap v_Vuna_dCompiler_dWasm_dRender_drenderResult) (f).Vuna_dCompiler_dWasm_dModel.f_Vuna_dCompiler_dWasm_dModel_dWatFunc_watFuncResults)))) ((Base_dList.v_Base_dList_dmap (v_Vuna_dCompiler_dWasm_dRender_dlineOf 4)) ((Base_dList.v_Base_dList_dmap v_Vuna_dCompiler_dWasm_dRender_drenderParam) (f).Vuna_dCompiler_dWasm_dModel.f_Vuna_dCompiler_dWasm_dModel_dWatFunc_watFuncParams)))) (Base_dList.C_Base_dList_dList_Cons (((v_Vuna_dCompiler_dWasm_dRender_dlineOf 2) (String.concat "" ["(func "; (f).Vuna_dCompiler_dWasm_dModel.f_Vuna_dCompiler_dWasm_dModel_dWatFunc_watFuncName; typePart])), Base_dList.C_Base_dList_dList_Nil)))) (if ((f).Vuna_dCompiler_dWasm_dModel.f_Vuna_dCompiler_dWasm_dModel_dWatFunc_watFuncType = "") then "" else (String.concat "" [" (type "; (f).Vuna_dCompiler_dWasm_dModel.f_Vuna_dCompiler_dWasm_dModel_dWatFunc_watFuncType; ")"]))))

# 300 "Vuna/Compiler/Wasm/Render.vuna"
let v_Vuna_dCompiler_dWasm_dRender_drenderFunc = (fun f -> ((fun opening -> ((fun locals -> ((fun body -> ((fun closeLine -> ((Base_dList.v_Base_dList_dappend opening) ((Base_dList.v_Base_dList_dappend locals) ((Base_dList.v_Base_dList_dappend body) closeLine)))) (Base_dList.C_Base_dList_dList_Cons (((v_Vuna_dCompiler_dWasm_dRender_dlineOf 2) ")"), Base_dList.C_Base_dList_dList_Nil)))) ((v_Vuna_dCompiler_dWasm_dRender_drenderInstrs 4) (f).Vuna_dCompiler_dWasm_dModel.f_Vuna_dCompiler_dWasm_dModel_dWatFunc_watFuncBody))) ((Base_dList.v_Base_dList_dmap (v_Vuna_dCompiler_dWasm_dRender_dlineOf 4)) ((Base_dList.v_Base_dList_dmap (fun p -> (String.concat "" ["(local "; ((Base_dInterp.v_Base_dInterp_dinterp Base_dInterp.v_Interp_uString) (Base_dPair.v_Base_dPair_dfirstOf p)); " "; (Vuna_dCompiler_dWasm_dModel.v_Vuna_dCompiler_dWasm_dModel_dwatValTyText (Base_dPair.v_Base_dPair_dsecondOf p)); ")"]))) (f).Vuna_dCompiler_dWasm_dModel.f_Vuna_dCompiler_dWasm_dModel_dWatFunc_watFuncLocals)))) (if (v_Vuna_dCompiler_dWasm_dRender_dfitsLine (v_Vuna_dCompiler_dWasm_dRender_dfuncOpeningOne f)) then (Base_dList.C_Base_dList_dList_Cons ((v_Vuna_dCompiler_dWasm_dRender_dfuncOpeningOne f), Base_dList.C_Base_dList_dList_Nil)) else (v_Vuna_dCompiler_dWasm_dRender_dfuncOpeningMulti f))))

# 311 "Vuna/Compiler/Wasm/Render.vuna"
let v_Vuna_dCompiler_dWasm_dRender_drenderExport = (fun e -> (if ((e).Vuna_dCompiler_dWasm_dModel.f_Vuna_dCompiler_dWasm_dModel_dWatExport_watExportKind = "memory") then (Base_dList.C_Base_dList_dList_Cons (((v_Vuna_dCompiler_dWasm_dRender_dlineOf 2) (String.concat "" ["(memory (export \""; (e).Vuna_dCompiler_dWasm_dModel.f_Vuna_dCompiler_dWasm_dModel_dWatExport_watExportName; "\") "; (e).Vuna_dCompiler_dWasm_dModel.f_Vuna_dCompiler_dWasm_dModel_dWatExport_watExportRef; ")"])), Base_dList.C_Base_dList_dList_Nil)) else (Base_dList.C_Base_dList_dList_Cons (((v_Vuna_dCompiler_dWasm_dRender_dlineOf 2) (String.concat "" ["(export \""; (e).Vuna_dCompiler_dWasm_dModel.f_Vuna_dCompiler_dWasm_dModel_dWatExport_watExportName; "\" ("; (e).Vuna_dCompiler_dWasm_dModel.f_Vuna_dCompiler_dWasm_dModel_dWatExport_watExportKind; " "; (e).Vuna_dCompiler_dWasm_dModel.f_Vuna_dCompiler_dWasm_dModel_dWatExport_watExportRef; "))"])), Base_dList.C_Base_dList_dList_Nil))))

# 316 "Vuna/Compiler/Wasm/Render.vuna"
let v_Vuna_dCompiler_dWasm_dRender_drenderElem = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> ((fun one -> (if (v_Vuna_dCompiler_dWasm_dRender_dfitsLine one) then (Base_dList.C_Base_dList_dList_Cons (one, Base_dList.C_Base_dList_dList_Nil)) else ((Base_dList.v_Base_dList_dappend (Base_dList.C_Base_dList_dList_Cons (((v_Vuna_dCompiler_dWasm_dRender_dlineOf 2) "(elem declare func"), Base_dList.C_Base_dList_dList_Nil))) ((Base_dList.v_Base_dList_dappend ((Base_dList.v_Base_dList_dmap (v_Vuna_dCompiler_dWasm_dRender_dlineOf 4)) mc0)) (Base_dList.C_Base_dList_dList_Cons (((v_Vuna_dCompiler_dWasm_dRender_dlineOf 2) ")"), Base_dList.C_Base_dList_dList_Nil)))))) ((v_Vuna_dCompiler_dWasm_dRender_dlineOf 2) (String.concat "" ["(elem declare func "; ((v_Vuna_dCompiler_dWasm_dRender_djoinWith " ") mc0); ")"])))
))

# 324 "Vuna/Compiler/Wasm/Render.vuna"
let v_Vuna_dCompiler_dWasm_dRender_drenderData = (fun d -> ((fun chunks -> ((fun quoted -> ((fun one -> (if (v_Vuna_dCompiler_dWasm_dRender_dfitsLine one) then (Base_dList.C_Base_dList_dList_Cons (one, Base_dList.C_Base_dList_dList_Nil)) else ((Base_dList.v_Base_dList_dappend (Base_dList.C_Base_dList_dList_Cons (((v_Vuna_dCompiler_dWasm_dRender_dlineOf 2) ("(data " ^ (d).Vuna_dCompiler_dWasm_dModel.f_Vuna_dCompiler_dWasm_dModel_dWatData_watDataName)), Base_dList.C_Base_dList_dList_Nil))) ((Base_dList.v_Base_dList_dappend ((Base_dList.v_Base_dList_dmap (v_Vuna_dCompiler_dWasm_dRender_dlineOf 4)) quoted)) (Base_dList.C_Base_dList_dList_Cons (((v_Vuna_dCompiler_dWasm_dRender_dlineOf 2) ")"), Base_dList.C_Base_dList_dList_Nil)))))) ((v_Vuna_dCompiler_dWasm_dRender_dlineOf 2) (String.concat "" ["(data "; (d).Vuna_dCompiler_dWasm_dModel.f_Vuna_dCompiler_dWasm_dModel_dWatData_watDataName; " "; ((v_Vuna_dCompiler_dWasm_dRender_djoinWith " ") quoted); ")"])))) ((Base_dList.v_Base_dList_dmap (fun c -> (String.concat "" ["\""; (v_Vuna_dCompiler_dWasm_dRender_dwatString (Base_dList.dtp_pack c)); "\""]))) chunks))) (v_Vuna_dCompiler_dWasm_dRender_dchunkBytes (Base_dList.dtp_unpack (d).Vuna_dCompiler_dWasm_dModel.f_Vuna_dCompiler_dWasm_dModel_dWatData_watDataBytes))))

# 336 "Vuna/Compiler/Wasm/Render.vuna"
let v_Vuna_dCompiler_dWasm_dRender_dsectionComment = (fun title -> (Base_dList.C_Base_dList_dList_Cons ("", (Base_dList.C_Base_dList_dList_Cons (((v_Vuna_dCompiler_dWasm_dRender_dlineOf 0) (";; " ^ title)), Base_dList.C_Base_dList_dList_Nil)))))

# 339 "Vuna/Compiler/Wasm/Render.vuna"
let v_Vuna_dCompiler_dWasm_dRender_dmoduleLines = (fun m -> ((fun typeLines -> ((fun importLines -> ((fun globalLines -> ((fun funcLines -> ((fun elemLines -> ((fun dataLines -> ((fun exportLines -> ((fun memoryLines -> ((Base_dList.v_Base_dList_dappend (Base_dList.C_Base_dList_dList_Cons ("(module", Base_dList.C_Base_dList_dList_Nil))) ((Base_dList.v_Base_dList_dappend (v_Vuna_dCompiler_dWasm_dRender_dsectionComment "types")) ((Base_dList.v_Base_dList_dappend typeLines) ((Base_dList.v_Base_dList_dappend (v_Vuna_dCompiler_dWasm_dRender_dsectionComment "imports")) ((Base_dList.v_Base_dList_dappend importLines) ((Base_dList.v_Base_dList_dappend (v_Vuna_dCompiler_dWasm_dRender_dsectionComment "memory")) ((Base_dList.v_Base_dList_dappend memoryLines) ((Base_dList.v_Base_dList_dappend (v_Vuna_dCompiler_dWasm_dRender_dsectionComment "globals")) ((Base_dList.v_Base_dList_dappend globalLines) ((Base_dList.v_Base_dList_dappend (v_Vuna_dCompiler_dWasm_dRender_dsectionComment "functions")) ((Base_dList.v_Base_dList_dappend funcLines) ((Base_dList.v_Base_dList_dappend (v_Vuna_dCompiler_dWasm_dRender_dsectionComment "elements")) ((Base_dList.v_Base_dList_dappend elemLines) ((Base_dList.v_Base_dList_dappend (v_Vuna_dCompiler_dWasm_dRender_dsectionComment "data")) ((Base_dList.v_Base_dList_dappend dataLines) ((Base_dList.v_Base_dList_dappend (v_Vuna_dCompiler_dWasm_dRender_dsectionComment "exports")) ((Base_dList.v_Base_dList_dappend exportLines) (Base_dList.C_Base_dList_dList_Cons (")", (Base_dList.C_Base_dList_dList_Cons ("", Base_dList.C_Base_dList_dList_Nil)))))))))))))))))))))) (Base_dList.C_Base_dList_dList_Cons (((v_Vuna_dCompiler_dWasm_dRender_dlineOf 2) (String.concat "" ["(memory (export \"memory\") "; (bi_strFromInt (m).Vuna_dCompiler_dWasm_dModel.f_Vuna_dCompiler_dWasm_dModel_dWasmModule_wmMemPages); ")"])), Base_dList.C_Base_dList_dList_Nil)))) ((Base_dList.v_Base_dList_dconcatMap v_Vuna_dCompiler_dWasm_dRender_drenderExport) (m).Vuna_dCompiler_dWasm_dModel.f_Vuna_dCompiler_dWasm_dModel_dWasmModule_wmExports))) (match (m).Vuna_dCompiler_dWasm_dModel.f_Vuna_dCompiler_dWasm_dModel_dWasmModule_wmData with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dList.C_Base_dList_dList_Nil
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__67) -> (v_Vuna_dCompiler_dWasm_dRender_drenderData dtb__67)
  | _ -> failwith "DT: impossible branch"
))) (v_Vuna_dCompiler_dWasm_dRender_drenderElem (m).Vuna_dCompiler_dWasm_dModel.f_Vuna_dCompiler_dWasm_dModel_dWasmModule_wmElems))) ((Base_dList.v_Base_dList_dconcatMap v_Vuna_dCompiler_dWasm_dRender_drenderFunc) (m).Vuna_dCompiler_dWasm_dModel.f_Vuna_dCompiler_dWasm_dModel_dWasmModule_wmFuncs))) ((Base_dList.v_Base_dList_dconcatMap v_Vuna_dCompiler_dWasm_dRender_drenderGlobal) (m).Vuna_dCompiler_dWasm_dModel.f_Vuna_dCompiler_dWasm_dModel_dWasmModule_wmGlobals))) ((Base_dList.v_Base_dList_dconcatMap v_Vuna_dCompiler_dWasm_dRender_drenderImport) (m).Vuna_dCompiler_dWasm_dModel.f_Vuna_dCompiler_dWasm_dModel_dWasmModule_wmImports))) ((Base_dList.v_Base_dList_dconcatMap v_Vuna_dCompiler_dWasm_dRender_drenderType) (m).Vuna_dCompiler_dWasm_dModel.f_Vuna_dCompiler_dWasm_dModel_dWasmModule_wmTypes)))

# 355 "Vuna/Compiler/Wasm/Render.vuna"
let v_Vuna_dCompiler_dWasm_dRender_drenderModule = (fun m -> ((v_Vuna_dCompiler_dWasm_dRender_djoinWith "\n") (v_Vuna_dCompiler_dWasm_dRender_dmoduleLines m)))
