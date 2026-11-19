open Vuna_runtime
# 18 "Vuna/Compiler/Wasm/Render.vuna"
let v_maxLine = 100

# 21 "Vuna/Compiler/Wasm/Render.vuna"
let rec v_spaces = (fun (n : int) -> (if (n <= 0) then "" else (" " ^ (v_spaces (n - 1)))))

# 24 "Vuna/Compiler/Wasm/Render.vuna"
let v_lineOf = (fun (indent : int) (text : string) -> ((v_spaces indent) ^ text))

# 27 "Vuna/Compiler/Wasm/Render.vuna"
let v_fitsLine = (fun (s : string) -> ((bi_strLength s) <= v_maxLine))

# 30 "Vuna/Compiler/Wasm/Render.vuna"
let v_joinWith = (fun (sep : string) (xs : string B_dData_dList.t_List) -> ((B_dData_dString.v_join sep) xs))

# 44 "Vuna/Compiler/Wasm/Render.vuna"
let v_flushWord = (fun (mc0 : string) (mc1 : string B_dData_dList.t_List) -> (if (mc0 = "") then mc1 else (B_dData_dList.C_List__x58__x58_ (mc0, mc1))))

# 39 "Vuna/Compiler/Wasm/Render.vuna"
let rec v_wordsOfGo = (fun (mc0 : string) (mc1 : string B_dData_dList.t_List) (mc2 : int B_dData_dList.t_List) -> (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__0, dtb__1) -> (if (dtb__0 = 32) then (((v_wordsOfGo "") ((v_flushWord mc0) mc1)) dtb__1) else (((v_wordsOfGo (mc0 ^ (B_dData_dList.dtp_pack (B_dData_dList.C_List__x58__x58_ (dtb__0, B_dData_dList.C_List_Nil))))) mc1) dtb__1))
  | B_dData_dList.C_List_Nil -> ((v_flushWord mc0) mc1)
  | _ -> failwith "DT: impossible branch"
))

# 36 "Vuna/Compiler/Wasm/Render.vuna"
let v_wordsOf = (fun (s : string) -> (B_dData_dList.v_reverse (((v_wordsOfGo "") B_dData_dList.C_List_Nil) (B_dData_dList.dtp_unpack s))))

# 51 "Vuna/Compiler/Wasm/Render.vuna"
let rec v_wrapWords = (fun (mc0 : int) (mc1 : string) (mc2 : string B_dData_dList.t_List) -> (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__2, dtb__3) -> ((fun cand -> (if (v_fitsLine ((v_lineOf mc0) cand)) then (((v_wrapWords mc0) cand) dtb__3) else (B_dData_dList.C_List__x58__x58_ (((v_lineOf mc0) mc1), (((v_wrapWords mc0) dtb__2) dtb__3))))) (if (mc1 = "") then dtb__2 else (String.concat "" [mc1; " "; dtb__2])))
  | B_dData_dList.C_List_Nil -> (if (mc1 = "") then B_dData_dList.C_List_Nil else (B_dData_dList.C_List__x58__x58_ (((v_lineOf mc0) mc1), B_dData_dList.C_List_Nil)))
  | _ -> failwith "DT: impossible branch"
))

# 48 "Vuna/Compiler/Wasm/Render.vuna"
let v_wrapComment = (fun (indent : int) (text : string) -> (((v_wrapWords indent) "") (v_wordsOf text)))

# 64 "Vuna/Compiler/Wasm/Render.vuna"
let v_hexDigit = (fun (n : int) -> (if (n < 10) then (B_dData_dList.dtp_pack (B_dData_dList.C_List__x58__x58_ ((48 + n), B_dData_dList.C_List_Nil))) else (B_dData_dList.dtp_pack (B_dData_dList.C_List__x58__x58_ ((87 + n), B_dData_dList.C_List_Nil)))))

# 67 "Vuna/Compiler/Wasm/Render.vuna"
let v_hex2 = (fun (n : int) -> ((v_hexDigit (if 16 = 0 then failwith "division by zero" else n / 16)) ^ (v_hexDigit (n - ((if 16 = 0 then failwith "division by zero" else n / 16) * 16)))))

# 70 "Vuna/Compiler/Wasm/Render.vuna"
let v_watEscapeChar = (fun (mc0 : int) -> (if (mc0 = 34) then "\\\"" else (if (mc0 = 92) then "\\\\" else (if (if (mc0 >= 32) then (mc0 <= 126) else false) then (B_dData_dList.dtp_pack (B_dData_dList.C_List__x58__x58_ (mc0, B_dData_dList.C_List_Nil))) else ("\\" ^ (v_hex2 mc0))))))

# 76 "Vuna/Compiler/Wasm/Render.vuna"
let v_watString = (fun (s : string) -> (B_dData_dList.dtp_pack ((B_dData_dList.v_concatMap (fun (c : int) -> (B_dData_dList.dtp_unpack (v_watEscapeChar c)))) (B_dData_dList.dtp_unpack s))))

# 83 "Vuna/Compiler/Wasm/Render.vuna"
let rec v_chunkBytesGo = (fun (mc0 : int B_dData_dList.t_List) (mc1 : int) (mc2 : int B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__4, dtb__5) -> (if (mc1 = 0) then (B_dData_dList.C_List__x58__x58_ ((B_dData_dList.v_reverse mc2), (((v_chunkBytesGo dtb__5) 23) (B_dData_dList.C_List__x58__x58_ (dtb__4, B_dData_dList.C_List_Nil))))) else (((v_chunkBytesGo dtb__5) (mc1 - 1)) (B_dData_dList.C_List__x58__x58_ (dtb__4, mc2))))
  | B_dData_dList.C_List_Nil -> (if (((B_dTrait_dEq.v__x61__x61_ (B_dData_dList.v_Eq_uBase_uData_uList_uList_ua B_dData_dInt.v_Eq_uInt)) mc2) B_dData_dList.C_List_Nil) then B_dData_dList.C_List_Nil else (B_dData_dList.C_List__x58__x58_ ((B_dData_dList.v_reverse mc2), B_dData_dList.C_List_Nil)))
  | _ -> failwith "DT: impossible branch"
))

# 80 "Vuna/Compiler/Wasm/Render.vuna"
let v_chunkBytes = (fun (bytes : int B_dData_dList.t_List) -> (((v_chunkBytesGo bytes) 24) B_dData_dList.C_List_Nil))

# 92 "Vuna/Compiler/Wasm/Render.vuna"
let v_resultSuffix = (fun (mc0 : string) -> (if (mc0 = "") then "" else (String.concat "" [" (result "; mc0; ")"])))

# 96 "Vuna/Compiler/Wasm/Render.vuna"
let rec v_renderInstrFlat = (fun (mc0 : Wasm_dInstr.t_Instr) -> (match mc0 with
  | Wasm_dInstr.C_Instr_IComment (dtb__6) -> ""
  | Wasm_dInstr.C_Instr_IStore64 -> "i64.store"
  | Wasm_dInstr.C_Instr_ILoad64 -> "i64.load"
  | Wasm_dInstr.C_Instr_IStore32 -> "i32.store"
  | Wasm_dInstr.C_Instr_ILoad32 -> "i32.load"
  | Wasm_dInstr.C_Instr_IStore8 -> "i32.store8"
  | Wasm_dInstr.C_Instr_ILoad8U -> "i32.load8_u"
  | Wasm_dInstr.C_Instr_IMemorySize -> "memory.size"
  | Wasm_dInstr.C_Instr_IMemoryGrow -> "memory.grow"
  | Wasm_dInstr.C_Instr_IBrIf (dtb__7) -> ("br_if " ^ dtb__7)
  | Wasm_dInstr.C_Instr_IBr (dtb__8) -> ("br " ^ dtb__8)
  | Wasm_dInstr.C_Instr_ILoop (dtb__9, dtb__10, dtb__11) -> ((v_joinWith " ") ((((v_renderLoop 0) dtb__9) dtb__10) dtb__11))
  | Wasm_dInstr.C_Instr_IBlock (dtb__12, dtb__13, dtb__14) -> ((v_joinWith " ") ((((v_renderBlock 0) dtb__12) dtb__13) dtb__14))
  | Wasm_dInstr.C_Instr_IIf (dtb__15, dtb__16, dtb__17) -> ((v_joinWith " ") ((((v_renderIf 0) dtb__15) dtb__16) dtb__17))
  | Wasm_dInstr.C_Instr_ITryTable (dtb__18, dtb__19, dtb__20, dtb__21) -> ((v_joinWith " ") (((((v_renderTryTable 0) dtb__18) dtb__19) dtb__20) dtb__21))
  | Wasm_dInstr.C_Instr_IThrow (dtb__22) -> ("throw " ^ dtb__22)
  | Wasm_dInstr.C_Instr_II31GetS -> "i31.get_s"
  | Wasm_dInstr.C_Instr_II31GetU -> "i31.get_u"
  | Wasm_dInstr.C_Instr_II31New -> "ref.i31"
  | Wasm_dInstr.C_Instr_IArrayCopy (dtb__23, dtb__24) -> (String.concat "" ["array.copy "; dtb__23; " "; dtb__24])
  | Wasm_dInstr.C_Instr_IArrayLen -> "array.len"
  | Wasm_dInstr.C_Instr_IArraySet (dtb__25) -> ("array.set " ^ dtb__25)
  | Wasm_dInstr.C_Instr_IArrayGetS (dtb__26) -> ("array.get_s " ^ dtb__26)
  | Wasm_dInstr.C_Instr_IArrayGetU (dtb__27) -> ("array.get_u " ^ dtb__27)
  | Wasm_dInstr.C_Instr_IArrayGet (dtb__28) -> ("array.get " ^ dtb__28)
  | Wasm_dInstr.C_Instr_IArrayNewData (dtb__29, dtb__30) -> (String.concat "" ["array.new_data "; dtb__29; " "; dtb__30])
  | Wasm_dInstr.C_Instr_IArrayNewFixed (dtb__31, dtb__32) -> (String.concat "" ["array.new_fixed "; dtb__31; " "; (bi_strFromInt dtb__32)])
  | Wasm_dInstr.C_Instr_IArrayNewDefault (dtb__33) -> ("array.new_default " ^ dtb__33)
  | Wasm_dInstr.C_Instr_IArrayNew (dtb__34) -> ("array.new " ^ dtb__34)
  | Wasm_dInstr.C_Instr_IStructSet (dtb__35, dtb__36) -> (String.concat "" ["struct.set "; dtb__35; " "; (bi_strFromInt dtb__36)])
  | Wasm_dInstr.C_Instr_IStructGet (dtb__37, dtb__38) -> (String.concat "" ["struct.get "; dtb__37; " "; (bi_strFromInt dtb__38)])
  | Wasm_dInstr.C_Instr_IStructNew (dtb__39) -> ("struct.new " ^ dtb__39)
  | Wasm_dInstr.C_Instr_IRefAsNonNull -> "ref.as_non_null"
  | Wasm_dInstr.C_Instr_IRefTest (dtb__40) -> (String.concat "" ["ref.test (ref "; dtb__40; ")"])
  | Wasm_dInstr.C_Instr_IRefCast (dtb__41) -> (String.concat "" ["ref.cast (ref "; dtb__41; ")"])
  | Wasm_dInstr.C_Instr_IRefNull -> "ref.null any"
  | Wasm_dInstr.C_Instr_IRefFunc (dtb__42) -> ("ref.func " ^ dtb__42)
  | Wasm_dInstr.C_Instr_IReturnCallRef (dtb__43) -> ("return_call_ref " ^ dtb__43)
  | Wasm_dInstr.C_Instr_IReturnCall (dtb__44) -> ("return_call " ^ dtb__44)
  | Wasm_dInstr.C_Instr_ICallRef (dtb__45) -> ("call_ref " ^ dtb__45)
  | Wasm_dInstr.C_Instr_ICall (dtb__46) -> ("call " ^ dtb__46)
  | Wasm_dInstr.C_Instr_IBinop (dtb__47) -> dtb__47
  | Wasm_dInstr.C_Instr_IUnop (dtb__48) -> dtb__48
  | Wasm_dInstr.C_Instr_IPlain (dtb__49) -> dtb__49
  | Wasm_dInstr.C_Instr_IConstI64 (dtb__50) -> ("i64.const " ^ (bi_strFromInt dtb__50))
  | Wasm_dInstr.C_Instr_IConstI32 (dtb__51) -> ("i32.const " ^ (bi_strFromInt dtb__51))
  | Wasm_dInstr.C_Instr_IGlobalSet (dtb__52) -> ("global.set " ^ dtb__52)
  | Wasm_dInstr.C_Instr_IGlobalGet (dtb__53) -> ("global.get " ^ dtb__53)
  | Wasm_dInstr.C_Instr_ILocalTee (dtb__54) -> ("local.tee " ^ dtb__54)
  | Wasm_dInstr.C_Instr_ILocalSet (dtb__55) -> ("local.set " ^ dtb__55)
  | Wasm_dInstr.C_Instr_ILocalGet (dtb__56) -> ("local.get " ^ dtb__56)
  | Wasm_dInstr.C_Instr_IDrop -> "drop"
  | Wasm_dInstr.C_Instr_IReturn -> "return"
  | Wasm_dInstr.C_Instr_IUnreachable -> "unreachable"
  | Wasm_dInstr.C_Instr_INop -> "nop"
  | _ -> failwith "DT: impossible branch"
))
# 156 "Vuna/Compiler/Wasm/Render.vuna"
and v_renderInstrs = (fun (indent : int) (instrs : Wasm_dInstr.t_Instr B_dData_dList.t_List) -> ((B_dData_dList.v_concatMap (v_renderInstr indent)) instrs))
# 159 "Vuna/Compiler/Wasm/Render.vuna"
and v_renderInstr = (fun (mc0 : int) (mc1 : Wasm_dInstr.t_Instr) -> (match mc1 with
  | Wasm_dInstr.C_Instr_IComment (dtb__57) -> ((B_dData_dList.v_map (v_lineOf mc0)) ((v_wrapComment 0) (";; " ^ dtb__57)))
  | Wasm_dInstr.C_Instr_ILoop (dtb__58, dtb__59, dtb__60) -> ((((v_renderLoop mc0) dtb__58) dtb__59) dtb__60)
  | Wasm_dInstr.C_Instr_IBlock (dtb__61, dtb__62, dtb__63) -> ((((v_renderBlock mc0) dtb__61) dtb__62) dtb__63)
  | Wasm_dInstr.C_Instr_ITryTable (dtb__64, dtb__65, dtb__66, dtb__67) -> (((((v_renderTryTable mc0) dtb__64) dtb__65) dtb__66) dtb__67)
  | Wasm_dInstr.C_Instr_IIf (dtb__68, dtb__69, dtb__70) -> ((((v_renderIf mc0) dtb__68) dtb__69) dtb__70)
  | _ -> (B_dData_dList.C_List__x58__x58_ (((v_lineOf mc0) (v_renderInstrFlat mc1)), B_dData_dList.C_List_Nil))
))
# 167 "Vuna/Compiler/Wasm/Render.vuna"
and v_renderIf = (fun (indent : int) (resultTy : string) (th : Wasm_dInstr.t_Instr B_dData_dList.t_List) (el : Wasm_dInstr.t_Instr B_dData_dList.t_List) -> ((fun openLine -> ((fun thenBody -> ((fun elseLine -> ((fun elseBody -> ((fun endLine -> ((B_dData_dList.v_append openLine) ((B_dData_dList.v_append thenBody) ((B_dData_dList.v_append elseLine) ((B_dData_dList.v_append elseBody) endLine))))) (B_dData_dList.C_List__x58__x58_ (((v_lineOf indent) "end"), B_dData_dList.C_List_Nil)))) ((v_renderInstrs (indent + 2)) el))) (B_dData_dList.C_List__x58__x58_ (((v_lineOf indent) "else"), B_dData_dList.C_List_Nil)))) ((v_renderInstrs (indent + 2)) th))) (B_dData_dList.C_List__x58__x58_ (((v_lineOf indent) ("if" ^ (v_resultSuffix resultTy))), B_dData_dList.C_List_Nil))))
# 177 "Vuna/Compiler/Wasm/Render.vuna"
and v_renderBlock = (fun (indent : int) (label : string) (resultTy : string) (body : Wasm_dInstr.t_Instr B_dData_dList.t_List) -> ((fun openLine -> ((B_dData_dList.v_append openLine) ((B_dData_dList.v_append ((v_renderInstrs (indent + 2)) body)) (B_dData_dList.C_List__x58__x58_ (((v_lineOf indent) "end"), B_dData_dList.C_List_Nil))))) (B_dData_dList.C_List__x58__x58_ (((v_lineOf indent) (String.concat "" ["block "; label; (v_resultSuffix resultTy)])), B_dData_dList.C_List_Nil))))
# 183 "Vuna/Compiler/Wasm/Render.vuna"
and v_renderLoop = (fun (indent : int) (label : string) (resultTy : string) (body : Wasm_dInstr.t_Instr B_dData_dList.t_List) -> ((fun openLine -> ((B_dData_dList.v_append openLine) ((B_dData_dList.v_append ((v_renderInstrs (indent + 2)) body)) (B_dData_dList.C_List__x58__x58_ (((v_lineOf indent) "end"), B_dData_dList.C_List_Nil))))) (B_dData_dList.C_List__x58__x58_ (((v_lineOf indent) (String.concat "" ["loop "; label; (v_resultSuffix resultTy)])), B_dData_dList.C_List_Nil))))
# 191 "Vuna/Compiler/Wasm/Render.vuna"
and v_renderTryTable = (fun (indent : int) (label : string) (tag : string) (body : Wasm_dInstr.t_Instr B_dData_dList.t_List) (normal : Wasm_dInstr.t_Instr B_dData_dList.t_List) -> ((fun openLine -> ((fun tryOpen -> ((fun bodyLines -> ((fun tryClose -> ((fun normalLines -> ((fun closeLine -> ((B_dData_dList.v_append openLine) ((B_dData_dList.v_append tryOpen) ((B_dData_dList.v_append bodyLines) ((B_dData_dList.v_append tryClose) ((B_dData_dList.v_append normalLines) closeLine)))))) (B_dData_dList.C_List__x58__x58_ (((v_lineOf indent) "end"), B_dData_dList.C_List_Nil)))) ((v_renderInstrs (indent + 2)) normal))) (B_dData_dList.C_List__x58__x58_ (((v_lineOf (indent + 2)) "end"), B_dData_dList.C_List_Nil)))) ((v_renderInstrs (indent + 4)) body))) (B_dData_dList.C_List__x58__x58_ (((v_lineOf (indent + 2)) (String.concat "" ["try_table (result anyref) (catch "; tag; " "; label; ")"])), B_dData_dList.C_List_Nil)))) (B_dData_dList.C_List__x58__x58_ (((v_lineOf indent) (String.concat "" ["block "; label; " (result anyref)"])), B_dData_dList.C_List_Nil))))

# 207 "Vuna/Compiler/Wasm/Render.vuna"
let v_renderParam = (fun (p : (string, Wasm_dModel.t_WatValTy) B_dData_dPair.t_Pair) -> (String.concat "" ["(param "; (B_dData_dPair.v_firstOf p); " "; (Wasm_dModel.v_watValTyText (B_dData_dPair.v_secondOf p)); ")"]))

# 210 "Vuna/Compiler/Wasm/Render.vuna"
let v_renderResult = (fun (ty : Wasm_dModel.t_WatValTy) -> (String.concat "" ["(result "; (Wasm_dModel.v_watValTyText ty); ")"]))

# 213 "Vuna/Compiler/Wasm/Render.vuna"
let v_renderField = (fun (f : Wasm_dModel.t_WatField) -> ((fun tyText -> (String.concat "" ["(field "; tyText; ")"])) (if (f).Wasm_dModel.f_WatField_watFieldMut then (String.concat "" ["(mut "; (Wasm_dModel.v_watValTyText (f).Wasm_dModel.f_WatField_watFieldTy); ")"]) else (Wasm_dModel.v_watValTyText (f).Wasm_dModel.f_WatField_watFieldTy))))

# 223 "Vuna/Compiler/Wasm/Render.vuna"
let v_funcTypeOne = (fun (name : string) (params : Wasm_dModel.t_WatValTy B_dData_dList.t_List) (results : Wasm_dModel.t_WatValTy B_dData_dList.t_List) -> ((fun paramsText -> ((fun resultsText -> ((v_lineOf 2) (String.concat "" ["(type "; name; " (func"; paramsText; resultsText; "))"]))) ((v_joinWith "") ((B_dData_dList.v_map (fun (r : Wasm_dModel.t_WatValTy) -> (" " ^ (v_renderResult r)))) results)))) ((v_joinWith "") ((B_dData_dList.v_map (fun (p : Wasm_dModel.t_WatValTy) -> (String.concat "" [" (param "; (Wasm_dModel.v_watValTyText p); ")"]))) params))))

# 230 "Vuna/Compiler/Wasm/Render.vuna"
let v_funcTypeMulti = (fun (name : string) (params : Wasm_dModel.t_WatValTy B_dData_dList.t_List) (results : Wasm_dModel.t_WatValTy B_dData_dList.t_List) -> ((fun openLine -> ((fun funcLine -> ((fun paramLines -> ((fun resultLines -> ((fun closeFunc -> ((fun closeType -> ((B_dData_dList.v_append openLine) ((B_dData_dList.v_append funcLine) ((B_dData_dList.v_append paramLines) ((B_dData_dList.v_append resultLines) ((B_dData_dList.v_append closeFunc) closeType)))))) (B_dData_dList.C_List__x58__x58_ (((v_lineOf 2) ")"), B_dData_dList.C_List_Nil)))) (B_dData_dList.C_List__x58__x58_ (((v_lineOf 4) ")"), B_dData_dList.C_List_Nil)))) ((B_dData_dList.v_map (v_lineOf 6)) ((B_dData_dList.v_map v_renderResult) results)))) ((B_dData_dList.v_map (v_lineOf 6)) ((B_dData_dList.v_map (fun (p : Wasm_dModel.t_WatValTy) -> (String.concat "" ["(param "; (Wasm_dModel.v_watValTyText p); ")"]))) params)))) (B_dData_dList.C_List__x58__x58_ (((v_lineOf 4) "(func"), B_dData_dList.C_List_Nil)))) (B_dData_dList.C_List__x58__x58_ (((v_lineOf 2) ("(type " ^ name)), B_dData_dList.C_List_Nil))))

# 243 "Vuna/Compiler/Wasm/Render.vuna"
let v_structTypeOne = (fun (name : string) (fields : Wasm_dModel.t_WatField B_dData_dList.t_List) -> ((fun fieldsText -> ((v_lineOf 2) (String.concat "" ["(type "; name; " (struct"; fieldsText; "))"]))) ((v_joinWith "") ((B_dData_dList.v_map (fun (f : Wasm_dModel.t_WatField) -> (" " ^ (v_renderField f)))) fields))))

# 249 "Vuna/Compiler/Wasm/Render.vuna"
let v_structTypeMulti = (fun (name : string) (fields : Wasm_dModel.t_WatField B_dData_dList.t_List) -> ((fun openLine -> ((fun structLine -> ((fun fieldLines -> ((fun closeStruct -> ((fun closeType -> ((B_dData_dList.v_append openLine) ((B_dData_dList.v_append structLine) ((B_dData_dList.v_append fieldLines) ((B_dData_dList.v_append closeStruct) closeType))))) (B_dData_dList.C_List__x58__x58_ (((v_lineOf 2) ")"), B_dData_dList.C_List_Nil)))) (B_dData_dList.C_List__x58__x58_ (((v_lineOf 4) ")"), B_dData_dList.C_List_Nil)))) ((B_dData_dList.v_map (v_lineOf 6)) ((B_dData_dList.v_map v_renderField) fields)))) (B_dData_dList.C_List__x58__x58_ (((v_lineOf 4) "(struct"), B_dData_dList.C_List_Nil)))) (B_dData_dList.C_List__x58__x58_ (((v_lineOf 2) ("(type " ^ name)), B_dData_dList.C_List_Nil))))

# 265 "Vuna/Compiler/Wasm/Render.vuna"
let v_renderFuncType = (fun (name : string) (params : Wasm_dModel.t_WatValTy B_dData_dList.t_List) (results : Wasm_dModel.t_WatValTy B_dData_dList.t_List) -> (if (v_fitsLine (((v_funcTypeOne name) params) results)) then (B_dData_dList.C_List__x58__x58_ ((((v_funcTypeOne name) params) results), B_dData_dList.C_List_Nil)) else (((v_funcTypeMulti name) params) results)))

# 272 "Vuna/Compiler/Wasm/Render.vuna"
let v_renderStructType = (fun (name : string) (fields : Wasm_dModel.t_WatField B_dData_dList.t_List) -> (if (v_fitsLine ((v_structTypeOne name) fields)) then (B_dData_dList.C_List__x58__x58_ (((v_structTypeOne name) fields), B_dData_dList.C_List_Nil)) else ((v_structTypeMulti name) fields)))

# 279 "Vuna/Compiler/Wasm/Render.vuna"
let v_renderArrayType = (fun (name : string) (mut : bool) (elemTy : Wasm_dModel.t_WatValTy) -> ((fun elemText -> (B_dData_dList.C_List__x58__x58_ (((v_lineOf 2) (String.concat "" ["(type "; name; " (array "; elemText; "))"])), B_dData_dList.C_List_Nil))) (if mut then (String.concat "" ["(mut "; (Wasm_dModel.v_watValTyText elemTy); ")"]) else (Wasm_dModel.v_watValTyText elemTy))))

# 259 "Vuna/Compiler/Wasm/Render.vuna"
let v_renderType = (fun (mc0 : Wasm_dModel.t_WatType) -> (match mc0 with
  | Wasm_dModel.C_WatType_WatContType (dtb__71, dtb__72) -> (B_dData_dList.C_List__x58__x58_ (((v_lineOf 2) (String.concat "" ["(type "; dtb__71; " (cont "; dtb__72; "))"])), B_dData_dList.C_List_Nil))
  | Wasm_dModel.C_WatType_WatArrayType (dtb__73, dtb__74, dtb__75) -> (((v_renderArrayType dtb__73) dtb__74) dtb__75)
  | Wasm_dModel.C_WatType_WatStructType (dtb__76, dtb__77) -> ((v_renderStructType dtb__76) dtb__77)
  | Wasm_dModel.C_WatType_WatFuncType (dtb__78, dtb__79, dtb__80) -> (((v_renderFuncType dtb__78) dtb__79) dtb__80)
  | _ -> failwith "DT: impossible branch"
))

# 288 "Vuna/Compiler/Wasm/Render.vuna"
let v_importOne = (fun (imp : Wasm_dModel.t_WatImport) -> ((fun paramsText -> ((fun resultsText -> ((v_lineOf 2) (String.concat "" ["(import \""; (imp).Wasm_dModel.f_WatImport_watImportModule; "\" \""; (imp).Wasm_dModel.f_WatImport_watImportName; "\" (func "; (imp).Wasm_dModel.f_WatImport_watImportFunc; paramsText; resultsText; "))"]))) ((v_joinWith "") ((B_dData_dList.v_map (fun (r : Wasm_dModel.t_WatValTy) -> (" " ^ (v_renderResult r)))) (imp).Wasm_dModel.f_WatImport_watImportResults)))) ((v_joinWith "") ((B_dData_dList.v_map (fun (p : Wasm_dModel.t_WatValTy) -> (String.concat "" [" (param "; (Wasm_dModel.v_watValTyText p); ")"]))) (imp).Wasm_dModel.f_WatImport_watImportParams))))

# 297 "Vuna/Compiler/Wasm/Render.vuna"
let v_importMulti = (fun (imp : Wasm_dModel.t_WatImport) -> ((fun openLine -> ((fun funcLine -> ((fun paramLines -> ((fun resultLines -> ((fun closeFunc -> ((fun closeImport -> ((B_dData_dList.v_append openLine) ((B_dData_dList.v_append funcLine) ((B_dData_dList.v_append paramLines) ((B_dData_dList.v_append resultLines) ((B_dData_dList.v_append closeFunc) closeImport)))))) (B_dData_dList.C_List__x58__x58_ (((v_lineOf 2) ")"), B_dData_dList.C_List_Nil)))) (B_dData_dList.C_List__x58__x58_ (((v_lineOf 4) ")"), B_dData_dList.C_List_Nil)))) ((B_dData_dList.v_map (v_lineOf 6)) ((B_dData_dList.v_map v_renderResult) (imp).Wasm_dModel.f_WatImport_watImportResults)))) ((B_dData_dList.v_map (v_lineOf 6)) ((B_dData_dList.v_map (fun (p : Wasm_dModel.t_WatValTy) -> (String.concat "" ["(param "; (Wasm_dModel.v_watValTyText p); ")"]))) (imp).Wasm_dModel.f_WatImport_watImportParams)))) (B_dData_dList.C_List__x58__x58_ (((v_lineOf 4) ("(func " ^ (imp).Wasm_dModel.f_WatImport_watImportFunc)), B_dData_dList.C_List_Nil)))) (B_dData_dList.C_List__x58__x58_ (((v_lineOf 2) (String.concat "" ["(import \""; (imp).Wasm_dModel.f_WatImport_watImportModule; "\" \""; (imp).Wasm_dModel.f_WatImport_watImportName; "\""])), B_dData_dList.C_List_Nil))))

# 310 "Vuna/Compiler/Wasm/Render.vuna"
let v_renderTag = (fun (t : Wasm_dModel.t_WatTag) -> ((fun paramsText -> ((fun resultsText -> (B_dData_dList.C_List__x58__x58_ (((v_lineOf 2) (String.concat "" ["(tag "; (t).Wasm_dModel.f_WatTag_watTagName; paramsText; resultsText; ")"])), B_dData_dList.C_List_Nil))) ((v_joinWith "") ((B_dData_dList.v_map (fun (ty : Wasm_dModel.t_WatValTy) -> (String.concat "" [" (result "; (Wasm_dModel.v_watValTyText ty); ")"]))) (t).Wasm_dModel.f_WatTag_watTagResults)))) ((v_joinWith "") ((B_dData_dList.v_map (fun (ty : Wasm_dModel.t_WatValTy) -> (String.concat "" [" (param "; (Wasm_dModel.v_watValTyText ty); ")"]))) (t).Wasm_dModel.f_WatTag_watTagParams))))

# 317 "Vuna/Compiler/Wasm/Render.vuna"
let v_renderImport = (fun (imp : Wasm_dModel.t_WatImport) -> (if (v_fitsLine (v_importOne imp)) then (B_dData_dList.C_List__x58__x58_ ((v_importOne imp), B_dData_dList.C_List_Nil)) else (v_importMulti imp)))

# 320 "Vuna/Compiler/Wasm/Render.vuna"
let v_renderGlobal = (fun (g : Wasm_dModel.t_WatGlobal) -> ((fun initText -> (B_dData_dList.C_List__x58__x58_ (((v_lineOf 2) (String.concat "" ["(global "; (g).Wasm_dModel.f_WatGlobal_watGlobalName; " (mut "; (Wasm_dModel.v_watValTyText (g).Wasm_dModel.f_WatGlobal_watGlobalTy); ") "; initText; ")"])), B_dData_dList.C_List_Nil))) ((v_joinWith " ") ((B_dData_dList.v_map v_renderInstrFlat) (g).Wasm_dModel.f_WatGlobal_watGlobalInit))))

# 326 "Vuna/Compiler/Wasm/Render.vuna"
let v_funcOpeningOne = (fun (f : Wasm_dModel.t_WatFunc) -> ((fun typePart -> ((fun paramsText -> ((fun resultsText -> ((v_lineOf 2) (String.concat "" ["(func "; (f).Wasm_dModel.f_WatFunc_watFuncName; typePart; paramsText; resultsText]))) ((v_joinWith "") ((B_dData_dList.v_map (fun (r : Wasm_dModel.t_WatValTy) -> (" " ^ (v_renderResult r)))) (f).Wasm_dModel.f_WatFunc_watFuncResults)))) ((v_joinWith "") ((B_dData_dList.v_map (fun (p : (string, Wasm_dModel.t_WatValTy) B_dData_dPair.t_Pair) -> (" " ^ (v_renderParam p)))) (f).Wasm_dModel.f_WatFunc_watFuncParams)))) (if ((f).Wasm_dModel.f_WatFunc_watFuncType = "") then "" else (String.concat "" [" (type "; (f).Wasm_dModel.f_WatFunc_watFuncType; ")"]))))

# 334 "Vuna/Compiler/Wasm/Render.vuna"
let v_funcOpeningMulti = (fun (f : Wasm_dModel.t_WatFunc) -> ((fun typePart -> ((fun openLine -> ((fun paramLines -> ((fun resultLines -> ((B_dData_dList.v_append openLine) ((B_dData_dList.v_append paramLines) resultLines))) ((B_dData_dList.v_map (v_lineOf 4)) ((B_dData_dList.v_map v_renderResult) (f).Wasm_dModel.f_WatFunc_watFuncResults)))) ((B_dData_dList.v_map (v_lineOf 4)) ((B_dData_dList.v_map v_renderParam) (f).Wasm_dModel.f_WatFunc_watFuncParams)))) (B_dData_dList.C_List__x58__x58_ (((v_lineOf 2) (String.concat "" ["(func "; (f).Wasm_dModel.f_WatFunc_watFuncName; typePart])), B_dData_dList.C_List_Nil)))) (if ((f).Wasm_dModel.f_WatFunc_watFuncType = "") then "" else (String.concat "" [" (type "; (f).Wasm_dModel.f_WatFunc_watFuncType; ")"]))))

# 343 "Vuna/Compiler/Wasm/Render.vuna"
let v_renderFunc = (fun (f : Wasm_dModel.t_WatFunc) -> ((fun opening -> ((fun locals -> ((fun body -> ((fun closeLine -> ((B_dData_dList.v_append opening) ((B_dData_dList.v_append locals) ((B_dData_dList.v_append body) closeLine)))) (B_dData_dList.C_List__x58__x58_ (((v_lineOf 2) ")"), B_dData_dList.C_List_Nil)))) ((v_renderInstrs 4) (f).Wasm_dModel.f_WatFunc_watFuncBody))) ((B_dData_dList.v_map (v_lineOf 4)) ((B_dData_dList.v_map (fun (p : (string, Wasm_dModel.t_WatValTy) B_dData_dPair.t_Pair) -> (String.concat "" ["(local "; ((B_dTrait_dInterp.v_interp B_dTrait_dInterp.v_Interp_uString) (B_dData_dPair.v_firstOf p)); " "; (Wasm_dModel.v_watValTyText (B_dData_dPair.v_secondOf p)); ")"]))) (f).Wasm_dModel.f_WatFunc_watFuncLocals)))) (if (v_fitsLine (v_funcOpeningOne f)) then (B_dData_dList.C_List__x58__x58_ ((v_funcOpeningOne f), B_dData_dList.C_List_Nil)) else (v_funcOpeningMulti f))))

# 355 "Vuna/Compiler/Wasm/Render.vuna"
let v_renderExport = (fun (e : Wasm_dModel.t_WatExport) -> (if ((e).Wasm_dModel.f_WatExport_watExportKind = "memory") then (B_dData_dList.C_List__x58__x58_ (((v_lineOf 2) (String.concat "" ["(memory (export \""; (e).Wasm_dModel.f_WatExport_watExportName; "\") "; (e).Wasm_dModel.f_WatExport_watExportRef; ")"])), B_dData_dList.C_List_Nil)) else (B_dData_dList.C_List__x58__x58_ (((v_lineOf 2) (String.concat "" ["(export \""; (e).Wasm_dModel.f_WatExport_watExportName; "\" ("; (e).Wasm_dModel.f_WatExport_watExportKind; " "; (e).Wasm_dModel.f_WatExport_watExportRef; "))"])), B_dData_dList.C_List_Nil))))

# 362 "Vuna/Compiler/Wasm/Render.vuna"
let v_renderElem = (fun (mc0 : string B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> ((fun one -> (if (v_fitsLine one) then (B_dData_dList.C_List__x58__x58_ (one, B_dData_dList.C_List_Nil)) else ((B_dData_dList.v_append (B_dData_dList.C_List__x58__x58_ (((v_lineOf 2) "(elem declare func"), B_dData_dList.C_List_Nil))) ((B_dData_dList.v_append ((B_dData_dList.v_map (v_lineOf 4)) mc0)) (B_dData_dList.C_List__x58__x58_ (((v_lineOf 2) ")"), B_dData_dList.C_List_Nil)))))) ((v_lineOf 2) (String.concat "" ["(elem declare func "; ((v_joinWith " ") mc0); ")"])))
))

# 372 "Vuna/Compiler/Wasm/Render.vuna"
let v_renderData = (fun (d : Wasm_dModel.t_WatData) -> ((fun chunks -> ((fun quoted -> ((fun one -> (if (v_fitsLine one) then (B_dData_dList.C_List__x58__x58_ (one, B_dData_dList.C_List_Nil)) else ((B_dData_dList.v_append (B_dData_dList.C_List__x58__x58_ (((v_lineOf 2) ("(data " ^ (d).Wasm_dModel.f_WatData_watDataName)), B_dData_dList.C_List_Nil))) ((B_dData_dList.v_append ((B_dData_dList.v_map (v_lineOf 4)) quoted)) (B_dData_dList.C_List__x58__x58_ (((v_lineOf 2) ")"), B_dData_dList.C_List_Nil)))))) ((v_lineOf 2) (String.concat "" ["(data "; (d).Wasm_dModel.f_WatData_watDataName; " "; ((v_joinWith " ") quoted); ")"])))) ((B_dData_dList.v_map (fun (c : int B_dData_dList.t_List) -> (String.concat "" ["\""; (v_watString (B_dData_dList.dtp_pack c)); "\""]))) chunks))) (v_chunkBytes (B_dData_dList.dtp_unpack (d).Wasm_dModel.f_WatData_watDataBytes))))

# 386 "Vuna/Compiler/Wasm/Render.vuna"
let v_sectionComment = (fun (title : string) -> (B_dData_dList.C_List__x58__x58_ ("", (B_dData_dList.C_List__x58__x58_ (((v_lineOf 0) (";; " ^ title)), B_dData_dList.C_List_Nil)))))

# 389 "Vuna/Compiler/Wasm/Render.vuna"
let v_moduleLines = (fun (m : Wasm_dModel.t_WasmModule) -> ((fun typeLines -> ((fun tagLines -> ((fun importLines -> ((fun globalLines -> ((fun funcLines -> ((fun elemLines -> ((fun dataLines -> ((fun exportLines -> ((fun memoryLines -> ((B_dData_dList.v_append (B_dData_dList.C_List__x58__x58_ ("(module", B_dData_dList.C_List_Nil))) ((B_dData_dList.v_append (v_sectionComment "types")) ((B_dData_dList.v_append typeLines) ((B_dData_dList.v_append (v_sectionComment "tags")) ((B_dData_dList.v_append tagLines) ((B_dData_dList.v_append (v_sectionComment "imports")) ((B_dData_dList.v_append importLines) ((B_dData_dList.v_append (v_sectionComment "memory")) ((B_dData_dList.v_append memoryLines) ((B_dData_dList.v_append (v_sectionComment "globals")) ((B_dData_dList.v_append globalLines) ((B_dData_dList.v_append (v_sectionComment "functions")) ((B_dData_dList.v_append funcLines) ((B_dData_dList.v_append (v_sectionComment "elements")) ((B_dData_dList.v_append elemLines) ((B_dData_dList.v_append (v_sectionComment "data")) ((B_dData_dList.v_append dataLines) ((B_dData_dList.v_append (v_sectionComment "exports")) ((B_dData_dList.v_append exportLines) (B_dData_dList.C_List__x58__x58_ (")", (B_dData_dList.C_List__x58__x58_ ("", B_dData_dList.C_List_Nil)))))))))))))))))))))))) (B_dData_dList.C_List__x58__x58_ (((v_lineOf 2) (String.concat "" ["(memory (export \"memory\") "; (bi_strFromInt (m).Wasm_dModel.f_WasmModule_wmMemPages); ")"])), B_dData_dList.C_List_Nil)))) ((B_dData_dList.v_concatMap v_renderExport) (m).Wasm_dModel.f_WasmModule_wmExports))) (match (m).Wasm_dModel.f_WasmModule_wmData with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dList.C_List_Nil
  | B_dData_dMaybe.C_Maybe_Just (dtb__81) -> (v_renderData dtb__81)
  | _ -> failwith "DT: impossible branch"
))) (v_renderElem (m).Wasm_dModel.f_WasmModule_wmElems))) ((B_dData_dList.v_concatMap v_renderFunc) (m).Wasm_dModel.f_WasmModule_wmFuncs))) ((B_dData_dList.v_concatMap v_renderGlobal) (m).Wasm_dModel.f_WasmModule_wmGlobals))) ((B_dData_dList.v_concatMap v_renderImport) (m).Wasm_dModel.f_WasmModule_wmImports))) ((B_dData_dList.v_concatMap v_renderTag) (m).Wasm_dModel.f_WasmModule_wmTags))) ((B_dData_dList.v_concatMap v_renderType) (m).Wasm_dModel.f_WasmModule_wmTypes)))

# 408 "Vuna/Compiler/Wasm/Render.vuna"
let v_renderModule = (fun (m : Wasm_dModel.t_WasmModule) -> ((v_joinWith "\n") (v_moduleLines m)))
