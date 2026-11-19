open Vuna_runtime
type t_WasmOutcome = C_WasmOutcome_WasmOk of (Wasm_dModel.t_WasmModule) | C_WasmOutcome_WasmRejected of (Wasm_dModel.t_WasmErr)
and t_GenState = { f_GenState_gsFams : Wasm_dTypes.t_WasmFam B_dData_dList.t_List; f_GenState_gsFamTbl : (string, Wasm_dTypes.t_WasmFam) B_dContainer_dHashMap.t_HashMap; f_GenState_gsDefs : Ir_dModel.t_IrDef B_dData_dList.t_List; f_GenState_gsDefTbl : (string, Ir_dModel.t_IrDef) B_dContainer_dHashMap.t_HashMap; f_GenState_gsPool : (string, (int, int) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List; f_GenState_gsPoolTbl : (string, (int, int) B_dData_dPair.t_Pair) B_dContainer_dHashMap.t_HashMap; f_GenState_gsFuncs : Wasm_dModel.t_WatFunc B_dData_dList.t_List; f_GenState_gsLocals : (string, Wasm_dModel.t_WatValTy) B_dData_dPair.t_Pair B_dData_dList.t_List; f_GenState_gsNextLocal : int; f_GenState_gsScope : (Ir_dModel.t_IrBinder, string) B_dData_dPair.t_Pair B_dData_dList.t_List; f_GenState_gsConsts : Wasm_dRuntime.t_RtConsts; f_GenState_gsElems : string B_dData_dList.t_List; f_GenState_gsTail : bool; f_GenState_gsNextLam : int }

# 58 "Vuna/Compiler/Wasm/Module.vuna"
let v_binderNameOf = (fun (mc0 : Ir_dModel.t_IrBinder) -> (match mc0 with
  | { Ir_dModel.f_IrBinder_irBinderName = dtb__0; Ir_dModel.f_IrBinder_irBinderErased = dtb__1; Ir_dModel.f_IrBinder_irBinderTy = dtb__2 } -> dtb__0
  | _ -> failwith "DT: impossible branch"
))

# 61 "Vuna/Compiler/Wasm/Module.vuna"
let v_binderErasedOf = (fun (mc0 : Ir_dModel.t_IrBinder) -> (match mc0 with
  | { Ir_dModel.f_IrBinder_irBinderName = dtb__3; Ir_dModel.f_IrBinder_irBinderErased = dtb__4; Ir_dModel.f_IrBinder_irBinderTy = dtb__5 } -> dtb__4
  | _ -> failwith "DT: impossible branch"
))

# 64 "Vuna/Compiler/Wasm/Module.vuna"
let v_bNameEq = (fun (mc0 : Ir_dModel.t_IrBName) (mc1 : Ir_dModel.t_IrBName) -> (match mc0 with
  | Ir_dModel.C_IrBName_IrBWild -> (match mc1 with
  | Ir_dModel.C_IrBName_IrBWild -> true
  | _ -> false
)
  | Ir_dModel.C_IrBName_IrBNat (dtb__6) -> (match mc1 with
  | Ir_dModel.C_IrBName_IrBNat (dtb__7) -> (dtb__6 = dtb__7)
  | _ -> false
)
  | Ir_dModel.C_IrBName_IrBArm (dtb__8) -> (match mc1 with
  | Ir_dModel.C_IrBName_IrBArm (dtb__9) -> (dtb__8 = dtb__9)
  | _ -> false
)
  | Ir_dModel.C_IrBName_IrBUser (dtb__10) -> (match mc1 with
  | Ir_dModel.C_IrBName_IrBUser (dtb__11) -> (dtb__10 = dtb__11)
  | _ -> false
)
  | _ -> failwith "DT: impossible branch"
))

# 82 "Vuna/Compiler/Wasm/Module.vuna"
let v_binderEq = (fun (a : Ir_dModel.t_IrBinder) (b : Ir_dModel.t_IrBinder) -> (if ((v_bNameEq (v_binderNameOf a)) (v_binderNameOf b)) then (((B_dTrait_dEq.v__x61__x61_ B_dTrait_dEq.v_Eq_uBase_uData_uBool_uBool) (v_binderErasedOf a)) (v_binderErasedOf b)) else false))

# 85 "Vuna/Compiler/Wasm/Module.vuna"
let rec v_lookupBinder = (fun (mc0 : Ir_dModel.t_IrBinder) (mc1 : (Ir_dModel.t_IrBinder, string) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__12, dtb__13) -> (if ((v_binderEq mc0) (B_dData_dPair.v_firstOf dtb__12)) then (B_dData_dMaybe.C_Maybe_Just ((B_dData_dPair.v_secondOf dtb__12))) else ((v_lookupBinder mc0) dtb__13))
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 90 "Vuna/Compiler/Wasm/Module.vuna"
let v_freshLocal = (fun (st : t_GenState) (ty : Wasm_dModel.t_WatValTy) -> ((fun name -> ((fun st1 -> { B_dData_dPair.f_Pair_first = name; B_dData_dPair.f_Pair_second = st1 }) { st with f_GenState_gsLocals = ((B_dData_dList.v_append (st).f_GenState_gsLocals) (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = name; B_dData_dPair.f_Pair_second = ty }, B_dData_dList.C_List_Nil))); f_GenState_gsNextLocal = ((st).f_GenState_gsNextLocal + 1) })) ("$l" ^ (bi_strFromInt (st).f_GenState_gsNextLocal))))

# 97 "Vuna/Compiler/Wasm/Module.vuna"
let v_pushBinder = (fun (b : Ir_dModel.t_IrBinder) (l : string) (st : t_GenState) -> { st with f_GenState_gsScope = (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = b; B_dData_dPair.f_Pair_second = l }, (st).f_GenState_gsScope)) })

# 101 "Vuna/Compiler/Wasm/Module.vuna"
let v_restoreScope = (fun (scope : (Ir_dModel.t_IrBinder, string) B_dData_dPair.t_Pair B_dData_dList.t_List) (st : t_GenState) -> { st with f_GenState_gsScope = scope })

# 105 "Vuna/Compiler/Wasm/Module.vuna"
let v_runtimeBinders = (fun (bs : Ir_dModel.t_IrBinder B_dData_dList.t_List) -> ((B_dData_dList.v_filter (fun (b : Ir_dModel.t_IrBinder) -> (B_dData_dBool.v_not (v_binderErasedOf b)))) bs))

# 109 "Vuna/Compiler/Wasm/Module.vuna"
let v_beginFuncScope = (fun (st : t_GenState) -> ((fun st1 -> { st1 with f_GenState_gsNextLocal = 0; f_GenState_gsScope = B_dData_dList.C_List_Nil; f_GenState_gsTail = false }) { st with f_GenState_gsLocals = B_dData_dList.C_List_Nil }))

# 115 "Vuna/Compiler/Wasm/Module.vuna"
let v_noTail = (fun (st : t_GenState) -> { st with f_GenState_gsTail = false })

# 118 "Vuna/Compiler/Wasm/Module.vuna"
let v_withTail = (fun (b : bool) (st : t_GenState) -> { st with f_GenState_gsTail = b })

# 122 "Vuna/Compiler/Wasm/Module.vuna"
let v_endFuncScope = (fun (st : t_GenState) (locals : (string, Wasm_dModel.t_WatValTy) B_dData_dPair.t_Pair B_dData_dList.t_List) (next : int) (scope : (Ir_dModel.t_IrBinder, string) B_dData_dPair.t_Pair B_dData_dList.t_List) -> ((fun st1 -> { st1 with f_GenState_gsNextLocal = next; f_GenState_gsScope = scope }) { st with f_GenState_gsLocals = locals }))

# 143 "Vuna/Compiler/Wasm/Module.vuna"
let rec v_memLocalName = (fun (mc0 : string) (mc1 : (string, Wasm_dModel.t_WatValTy) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__14, dtb__15) -> (if (mc0 = (B_dData_dPair.v_firstOf dtb__14)) then true else ((v_memLocalName mc0) dtb__15))
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 140 "Vuna/Compiler/Wasm/Module.vuna"
let v_mergeLocals = (fun (a : (string, Wasm_dModel.t_WatValTy) B_dData_dPair.t_Pair B_dData_dList.t_List) (b : (string, Wasm_dModel.t_WatValTy) B_dData_dPair.t_Pair B_dData_dList.t_List) -> ((B_dData_dList.v_append a) ((B_dData_dList.v_filter (fun (p : (string, Wasm_dModel.t_WatValTy) B_dData_dPair.t_Pair) -> (B_dData_dBool.v_not ((v_memLocalName (B_dData_dPair.v_firstOf p)) a)))) b)))

# 147 "Vuna/Compiler/Wasm/Module.vuna"
let v_watFuncNameOfF = (fun (f : Wasm_dModel.t_WatFunc) -> (f).Wasm_dModel.f_WatFunc_watFuncName)

# 153 "Vuna/Compiler/Wasm/Module.vuna"
let rec v_memFuncName = (fun (mc0 : string) (mc1 : Wasm_dModel.t_WatFunc B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__16, dtb__17) -> (if (mc0 = (v_watFuncNameOfF dtb__16)) then true else ((v_memFuncName mc0) dtb__17))
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 150 "Vuna/Compiler/Wasm/Module.vuna"
let v_mergeFuncs = (fun (a : Wasm_dModel.t_WatFunc B_dData_dList.t_List) (b : Wasm_dModel.t_WatFunc B_dData_dList.t_List) -> ((B_dData_dList.v_append a) ((B_dData_dList.v_filter (fun (f : Wasm_dModel.t_WatFunc) -> (B_dData_dBool.v_not ((v_memFuncName (v_watFuncNameOfF f)) a)))) b)))

# 160 "Vuna/Compiler/Wasm/Module.vuna"
let rec v_zipIdx = (fun (mc0 : int) (mc1 : Ir_dModel.t_IrBinder B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__18, dtb__19) -> (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__18; B_dData_dPair.f_Pair_second = ("$p" ^ (bi_strFromInt mc0)) }, ((v_zipIdx (mc0 + 1)) dtb__19)))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 164 "Vuna/Compiler/Wasm/Module.vuna"
let v_funcParams = (fun (n : int) -> ((B_dData_dList.v_map (fun (i : int) -> { B_dData_dPair.f_Pair_first = ("$p" ^ (bi_strFromInt i)); B_dData_dPair.f_Pair_second = Wasm_dModel.C_WatValTy_WvAnyRef })) ((B_dData_dList.v_range 0) n)))

# 171 "Vuna/Compiler/Wasm/Module.vuna"
let v_poolAdd = (fun (s : string) (acc : (string B_dData_dList.t_List, (string, bool) B_dContainer_dHashMap.t_HashMap) B_dData_dPair.t_Pair) -> (if ((((B_dContainer_dHashMap.v_member B_dData_dString.v_Hashable_uString) B_dData_dString.v_Eq_uString) s) (B_dData_dPair.v_secondOf acc)) then acc else { B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ (s, (B_dData_dPair.v_firstOf acc))); B_dData_dPair.f_Pair_second = ((((B_dContainer_dHashMap.v_insert B_dData_dString.v_Hashable_uString) s) true) (B_dData_dPair.v_secondOf acc)) }))

# 184 "Vuna/Compiler/Wasm/Module.vuna"
let rec v_poolOffsets = (fun (mc0 : string B_dData_dList.t_List) (mc1 : int) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__20, dtb__21) -> (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__20; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = mc1; B_dData_dPair.f_Pair_second = (bi_strLength dtb__20) } }, ((v_poolOffsets dtb__21) (mc1 + (bi_strLength dtb__20)))))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 189 "Vuna/Compiler/Wasm/Module.vuna"
let v_poolLookup = (fun (s : string) (tbl : (string, (int, int) B_dData_dPair.t_Pair) B_dContainer_dHashMap.t_HashMap) -> ((((B_dContainer_dHashMap.v_lookup B_dData_dString.v_Hashable_uString) B_dData_dString.v_Eq_uString) s) tbl))

# 198 "Vuna/Compiler/Wasm/Module.vuna"
let v_boolI31 = (fun (b : bool) -> (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IConstI32 ((if b then 1 else 0))), (B_dData_dList.C_List__x58__x58_ (Wasm_dInstr.C_Instr_II31New, B_dData_dList.C_List_Nil)))))

# 201 "Vuna/Compiler/Wasm/Module.vuna"
let v_emptyStr = (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IConstI32 (0)), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IArrayNewDefault ("$str")), B_dData_dList.C_List_Nil))))

# 212 "Vuna/Compiler/Wasm/Module.vuna"
let rec v_floatDigitsGo = (fun (mc0 : int B_dData_dList.t_List) (mc1 : int) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__22, dtb__23) -> (if (if (dtb__22 >= 48) then (dtb__22 <= 57) else false) then ((v_floatDigitsGo dtb__23) ((mc1 * 10) + (dtb__22 - 48))) else ((v_floatDigitsGo dtb__23) mc1))
  | B_dData_dList.C_List_Nil -> mc1
  | _ -> failwith "DT: impossible branch"
))

# 209 "Vuna/Compiler/Wasm/Module.vuna"
let v_floatDigitsOf = (fun (s : string) -> ((v_floatDigitsGo (B_dData_dList.dtp_unpack s)) 0))

# 217 "Vuna/Compiler/Wasm/Module.vuna"
let rec v_floatPow10 = (fun (n : int) -> (if (n <= 0) then 1 else (10 * (v_floatPow10 (n - 1)))))

# 220 "Vuna/Compiler/Wasm/Module.vuna"
let v_genFloatLit = (fun (st : t_GenState) (raw : string) -> ((fun nd_uscrut2 -> (match nd_uscrut2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__24, dtb__25) -> (match dtb__25 with
  | B_dData_dList.C_List__x58__x58_ (dtb__26, dtb__27) -> (match dtb__27 with
  | B_dData_dList.C_List_Nil -> ((fun num -> ((fun den -> (if (den = 1) then (B_dData_dResult.C_Result_Ok ({ B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IConstI64 (num)), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IStructNew ("$int")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ICall ("$rt_floatFromInt")), B_dData_dList.C_List_Nil)))))); B_dData_dPair.f_Pair_second = st })) else (match ((v_freshLocal st) Wasm_dModel.C_WatValTy_WvAnyRef) with
  | { B_dData_dPair.f_Pair_first = dtb__28; B_dData_dPair.f_Pair_second = dtb__29 } -> (B_dData_dResult.C_Result_Ok ({ B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IConstI64 (den)), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IStructNew ("$int")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ICall ("$rt_floatFromInt")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ILocalSet (dtb__28)), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IConstI64 (num)), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IStructNew ("$int")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ICall ("$rt_floatFromInt")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ILocalGet (dtb__28)), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ICall ("$rt_floatDiv")), B_dData_dList.C_List_Nil)))))))))))))))))); B_dData_dPair.f_Pair_second = dtb__29 }))
  | _ -> failwith "DT: impossible branch"
))) (v_floatPow10 (bi_strLength dtb__26)))) (v_floatDigitsOf (dtb__24 ^ dtb__26)))
  | _ -> (B_dData_dResult.C_Result_Ok ({ B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IConstI64 ((v_floatDigitsOf raw))), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IStructNew ("$int")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ICall ("$rt_floatFromInt")), B_dData_dList.C_List_Nil)))))); B_dData_dPair.f_Pair_second = st }))
)
  | _ -> (B_dData_dResult.C_Result_Ok ({ B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IConstI64 ((v_floatDigitsOf raw))), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IStructNew ("$int")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ICall ("$rt_floatFromInt")), B_dData_dList.C_List_Nil)))))); B_dData_dPair.f_Pair_second = st }))
)
  | _ -> (B_dData_dResult.C_Result_Ok ({ B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IConstI64 ((v_floatDigitsOf raw))), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IStructNew ("$int")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ICall ("$rt_floatFromInt")), B_dData_dList.C_List_Nil)))))); B_dData_dPair.f_Pair_second = st }))
)) ((B_dData_dString.v_split ".") raw)))

# 237 "Vuna/Compiler/Wasm/Module.vuna"
let rec v_applyAllIr = (fun (mc0 : Ir_dModel.t_Ir) (mc1 : Ir_dModel.t_Ir B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__30, dtb__31) -> ((v_applyAllIr (Ir_dModel.C_Ir_IrApp (B_dData_dMaybe.C_Maybe_Nothing, mc0, dtb__30))) dtb__31)
  | B_dData_dList.C_List_Nil -> mc0
  | _ -> failwith "DT: impossible branch"
))

# 241 "Vuna/Compiler/Wasm/Module.vuna"
let v_effUnitBinder = { Ir_dModel.f_IrBinder_irBinderName = (Ir_dModel.C_IrBName_IrBUser ("effUnitArg")); Ir_dModel.f_IrBinder_irBinderErased = false; Ir_dModel.f_IrBinder_irBinderTy = B_dData_dMaybe.C_Maybe_Nothing }

# 244 "Vuna/Compiler/Wasm/Module.vuna"
let v_effArgBinders = (fun (n : int) -> ((B_dData_dList.v_map (fun (i : int) -> { Ir_dModel.f_IrBinder_irBinderName = (Ir_dModel.C_IrBName_IrBUser (("effArg" ^ (bi_strFromInt i)))); Ir_dModel.f_IrBinder_irBinderErased = false; Ir_dModel.f_IrBinder_irBinderTy = B_dData_dMaybe.C_Maybe_Nothing })) ((B_dData_dList.v_range 0) n)))

# 293 "Vuna/Compiler/Wasm/Module.vuna"
let v_genVar = (fun (st : t_GenState) (b : Ir_dModel.t_IrBinder) -> (match ((v_lookupBinder b) (st).f_GenState_gsScope) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__32) -> (B_dData_dResult.C_Result_Ok ({ B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ILocalGet (dtb__32)), B_dData_dList.C_List_Nil)); B_dData_dPair.f_Pair_second = st }))
  | B_dData_dMaybe.C_Maybe_Nothing -> (B_dData_dResult.C_Result_Err ("unbound runtime binder in wasm codegen"))
  | _ -> failwith "DT: impossible branch"
))

# 331 "Vuna/Compiler/Wasm/Module.vuna"
let v_etaBinders = (fun (n : int) -> ((B_dData_dList.v_map (fun (i : int) -> { Ir_dModel.f_IrBinder_irBinderName = (Ir_dModel.C_IrBName_IrBUser (("__eta" ^ (bi_strFromInt i)))); Ir_dModel.f_IrBinder_irBinderErased = false; Ir_dModel.f_IrBinder_irBinderTy = B_dData_dMaybe.C_Maybe_Nothing })) ((B_dData_dList.v_range 0) n)))

# 334 "Vuna/Compiler/Wasm/Module.vuna"
let rec v_splitAt = (fun (n : int) xs -> (if (n <= 0) then { B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = xs } else (match xs with
  | B_dData_dList.C_List_Nil -> { B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = B_dData_dList.C_List_Nil }
  | B_dData_dList.C_List__x58__x58_ (dtb__33, dtb__34) -> (match ((v_splitAt (n - 1)) dtb__34) with
  | { B_dData_dPair.f_Pair_first = dtb__35; B_dData_dPair.f_Pair_second = dtb__36 } -> { B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ (dtb__33, dtb__35)); B_dData_dPair.f_Pair_second = dtb__36 }
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))

# 345 "Vuna/Compiler/Wasm/Module.vuna"
let v_genStr = (fun (st : t_GenState) (s : string) -> (if ((bi_strLength s) = 0) then (B_dData_dResult.C_Result_Ok ({ B_dData_dPair.f_Pair_first = v_emptyStr; B_dData_dPair.f_Pair_second = st })) else (match ((v_poolLookup s) (st).f_GenState_gsPoolTbl) with
  | B_dData_dMaybe.C_Maybe_Nothing -> (B_dData_dResult.C_Result_Err ("string literal missing from wasm data pool"))
  | B_dData_dMaybe.C_Maybe_Just (dtb__37) -> (B_dData_dResult.C_Result_Ok ({ B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IConstI32 ((B_dData_dPair.v_firstOf dtb__37))), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IConstI32 ((B_dData_dPair.v_secondOf dtb__37))), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IArrayNewData ("$str", "$d0")), B_dData_dList.C_List_Nil)))))); B_dData_dPair.f_Pair_second = st }))
  | _ -> failwith "DT: impossible branch"
)))

# 359 "Vuna/Compiler/Wasm/Module.vuna"
let v_resumeArm = (fun (base : t_GenState) (afterFirst : t_GenState) -> { afterFirst with f_GenState_gsScope = (base).f_GenState_gsScope })

# 415 "Vuna/Compiler/Wasm/Module.vuna"
let rec v_listLengthB = (fun mc0 -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__38, dtb__39) -> (1 + (v_listLengthB dtb__39))
  | B_dData_dList.C_List_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))

# 481 "Vuna/Compiler/Wasm/Module.vuna"
let rec v_capGetInstrs = (fun (mc0 : (Ir_dModel.t_IrBinder, string) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__40, dtb__41) -> (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ILocalGet ((B_dData_dPair.v_secondOf dtb__40))), (v_capGetInstrs dtb__41)))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 486 "Vuna/Compiler/Wasm/Module.vuna"
let rec v_bindEnvLocals = (fun (mc0 : t_GenState) (mc1 : (Ir_dModel.t_IrBinder, string) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc2 : int) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__42, dtb__43) -> (match dtb__42 with
  | { B_dData_dPair.f_Pair_first = dtb__44; B_dData_dPair.f_Pair_second = dtb__45 } -> (match ((v_freshLocal mc0) Wasm_dModel.C_WatValTy_WvAnyRef) with
  | { B_dData_dPair.f_Pair_first = dtb__46; B_dData_dPair.f_Pair_second = dtb__47 } -> (match (((v_bindEnvLocals (((v_pushBinder dtb__44) dtb__46) dtb__47)) dtb__43) (mc2 + 1)) with
  | B_dData_dResult.C_Result_Err (dtb__48) -> (B_dData_dResult.C_Result_Err (dtb__48))
  | B_dData_dResult.C_Result_Ok (dtb__49) -> (B_dData_dResult.C_Result_Ok ({ B_dData_dPair.f_Pair_first = ((B_dData_dList.v_append (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ILocalGet ("$p0")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IRefCast ("$env")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IConstI32 (mc2)), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IArrayGet ("$env")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ILocalSet (dtb__46)), B_dData_dList.C_List_Nil))))))))))) (B_dData_dPair.v_firstOf dtb__49)); B_dData_dPair.f_Pair_second = (B_dData_dPair.v_secondOf dtb__49) }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (B_dData_dResult.C_Result_Ok ({ B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = mc0 }))
  | _ -> failwith "DT: impossible branch"
))

# 499 "Vuna/Compiler/Wasm/Module.vuna"
let v_addLamFunc = (fun (f : Wasm_dModel.t_WatFunc) (st : t_GenState) -> { st with f_GenState_gsFuncs = (B_dData_dList.C_List__x58__x58_ (f, (st).f_GenState_gsFuncs)) })

# 502 "Vuna/Compiler/Wasm/Module.vuna"
let v_addElemName = (fun (n : string) (st : t_GenState) -> { st with f_GenState_gsElems = (B_dData_dList.C_List__x58__x58_ (n, (st).f_GenState_gsElems)) })

# 505 "Vuna/Compiler/Wasm/Module.vuna"
let v_restoreFuncScope = (fun (outer : t_GenState) (inner : t_GenState) -> ((fun a -> ((fun b -> { b with f_GenState_gsNextLocal = (outer).f_GenState_gsNextLocal; f_GenState_gsTail = (outer).f_GenState_gsTail }) { a with f_GenState_gsLocals = (outer).f_GenState_gsLocals })) { inner with f_GenState_gsScope = (outer).f_GenState_gsScope }))

# 657 "Vuna/Compiler/Wasm/Module.vuna"
let v_unboxLocalInt = (fun (l : string) -> (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ILocalGet (l)), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IRefCast ("$int")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IStructGet ("$int", 0)), B_dData_dList.C_List_Nil)))))))

# 660 "Vuna/Compiler/Wasm/Module.vuna"
let v_boxInstr = (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IStructNew ("$int")), B_dData_dList.C_List_Nil))

# 757 "Vuna/Compiler/Wasm/Module.vuna"
let v_famOrFail = (fun (st : t_GenState) (family : string) -> (match ((((B_dContainer_dHashMap.v_lookup B_dData_dString.v_Hashable_uString) B_dData_dString.v_Eq_uString) family) (st).f_GenState_gsFamTbl) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__50) -> (B_dData_dResult.C_Result_Ok (dtb__50))
  | B_dData_dMaybe.C_Maybe_Nothing -> (B_dData_dResult.C_Result_Err ((String.concat "" ["unknown data family in wasm codegen: `"; family; "`"])))
  | _ -> failwith "DT: impossible branch"
))

# 763 "Vuna/Compiler/Wasm/Module.vuna"
let rec v_refNullN = (fun (n : int) -> (if (n <= 0) then B_dData_dList.C_List_Nil else (B_dData_dList.C_List__x58__x58_ (Wasm_dInstr.C_Instr_IRefNull, (v_refNullN (n - 1))))))

# 873 "Vuna/Compiler/Wasm/Module.vuna"
let rec v_lookupFieldIr = (fun (mc0 : string) (mc1 : (string, Ir_dModel.t_Ir) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__51, dtb__52) -> (if ((B_dData_dPair.v_firstOf dtb__51) = mc0) then (B_dData_dMaybe.C_Maybe_Just ((B_dData_dPair.v_secondOf dtb__51))) else ((v_lookupFieldIr mc0) dtb__52))
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 901 "Vuna/Compiler/Wasm/Module.vuna"
let v_scrutSlot = "$sc0"

# 904 "Vuna/Compiler/Wasm/Module.vuna"
let v_scrutInstrs = (fun (p : (Wasm_dInstr.t_Instr B_dData_dList.t_List, t_GenState) B_dData_dPair.t_Pair) -> ((B_dData_dList.v_append (B_dData_dPair.v_firstOf p)) (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ILocalSet (v_scrutSlot)), B_dData_dList.C_List_Nil))))

# 907 "Vuna/Compiler/Wasm/Module.vuna"
let rec v_memStr = (fun (mc0 : string) (mc1 : string B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__53, dtb__54) -> (if (mc0 = dtb__53) then true else ((v_memStr mc0) dtb__54))
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 157 "Vuna/Compiler/Wasm/Module.vuna"
let v_mergeNames = (fun (a : string B_dData_dList.t_List) (b : string B_dData_dList.t_List) -> ((B_dData_dList.v_append a) ((B_dData_dList.v_filter (fun (n : string) -> (B_dData_dBool.v_not ((v_memStr n) a)))) b)))

# 130 "Vuna/Compiler/Wasm/Module.vuna"
let v_mergeArmState = (fun (a : t_GenState) (b : t_GenState) -> { a with f_GenState_gsLocals = ((v_mergeLocals (a).f_GenState_gsLocals) (b).f_GenState_gsLocals); f_GenState_gsNextLocal = (if ((b).f_GenState_gsNextLocal > (a).f_GenState_gsNextLocal) then (b).f_GenState_gsNextLocal else (a).f_GenState_gsNextLocal); f_GenState_gsFuncs = ((v_mergeFuncs (a).f_GenState_gsFuncs) (b).f_GenState_gsFuncs); f_GenState_gsElems = ((v_mergeNames (a).f_GenState_gsElems) (b).f_GenState_gsElems); f_GenState_gsNextLam = (if ((b).f_GenState_gsNextLam > (a).f_GenState_gsNextLam) then (b).f_GenState_gsNextLam else (a).f_GenState_gsNextLam) })

# 911 "Vuna/Compiler/Wasm/Module.vuna"
let v_ensureLocal = (fun (name : string) (ty : Wasm_dModel.t_WatValTy) (st : t_GenState) -> (if ((v_memStr name) ((B_dData_dList.v_map (fun (q : (string, Wasm_dModel.t_WatValTy) B_dData_dPair.t_Pair) -> (B_dData_dPair.v_firstOf q))) (st).f_GenState_gsLocals)) then st else { st with f_GenState_gsLocals = ((B_dData_dList.v_append (st).f_GenState_gsLocals) (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = name; B_dData_dPair.f_Pair_second = ty }, B_dData_dList.C_List_Nil))) }))

# 918 "Vuna/Compiler/Wasm/Module.vuna"
let v_prepend = (fun (mc0 : Wasm_dInstr.t_Instr B_dData_dList.t_List) (mc1 : (Wasm_dInstr.t_Instr B_dData_dList.t_List, t_GenState) B_dData_dPair.t_Pair B_dData_dResult.t_Result) -> (match mc1 with
  | B_dData_dResult.C_Result_Ok (dtb__55) -> (B_dData_dResult.C_Result_Ok ({ B_dData_dPair.f_Pair_first = ((B_dData_dList.v_append mc0) (B_dData_dPair.v_firstOf dtb__55)); B_dData_dPair.f_Pair_second = (B_dData_dPair.v_secondOf dtb__55) }))
  | B_dData_dResult.C_Result_Err (dtb__56) -> (B_dData_dResult.C_Result_Err (dtb__56))
  | _ -> failwith "DT: impossible branch"
))

# 922 "Vuna/Compiler/Wasm/Module.vuna"
let v_restoreTail = (fun (mc0 : t_GenState) (mc1 : (Wasm_dInstr.t_Instr B_dData_dList.t_List, t_GenState) B_dData_dPair.t_Pair B_dData_dResult.t_Result) -> (match mc1 with
  | B_dData_dResult.C_Result_Ok (dtb__57) -> (B_dData_dResult.C_Result_Ok ({ B_dData_dPair.f_Pair_first = (B_dData_dPair.v_firstOf dtb__57); B_dData_dPair.f_Pair_second = ((v_withTail (mc0).f_GenState_gsTail) (B_dData_dPair.v_secondOf dtb__57)) }))
  | B_dData_dResult.C_Result_Err (dtb__58) -> (B_dData_dResult.C_Result_Err (dtb__58))
  | _ -> failwith "DT: impossible branch"
))

# 930 "Vuna/Compiler/Wasm/Module.vuna"
let rec v_caseFamilyOfAlts = (fun (mc0 : Ir_dModel.t_IrAlt B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__59, dtb__60) -> (match (Ir_dModel.v_irAltCtorOf dtb__59) with
  | B_dData_dMaybe.C_Maybe_Nothing -> (v_caseFamilyOfAlts dtb__60)
  | B_dData_dMaybe.C_Maybe_Just (dtb__61) -> (B_dData_dMaybe.C_Maybe_Just ((B_dData_dPair.v_firstOf dtb__61)))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 926 "Vuna/Compiler/Wasm/Module.vuna"
let v_caseFamilyOf = (fun (mc0 : Ir_dModel.t_IrTy B_dData_dMaybe.t_Maybe) (mc1 : Ir_dModel.t_IrAlt B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__62) -> (match dtb__62 with
  | Ir_dModel.C_IrTy_IrTyData (dtb__63, dtb__64) -> (B_dData_dMaybe.C_Maybe_Just (dtb__63))
  | _ -> (v_caseFamilyOfAlts mc1)
)
  | _ -> (v_caseFamilyOfAlts mc1)
))

# 953 "Vuna/Compiler/Wasm/Module.vuna"
let v_bindScrutBinder = (fun (bs : Ir_dModel.t_IrBinder B_dData_dList.t_List) (scLocal : string) (st : t_GenState) -> ((fun nd_uscrut3 -> (match nd_uscrut3 with
  | B_dData_dList.C_List__x58__x58_ (dtb__65, dtb__66) -> (match dtb__66 with
  | B_dData_dList.C_List_Nil -> (match ((v_freshLocal st) Wasm_dModel.C_WatValTy_WvAnyRef) with
  | { B_dData_dPair.f_Pair_first = dtb__67; B_dData_dPair.f_Pair_second = dtb__68 } -> (B_dData_dResult.C_Result_Ok ({ B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ILocalGet (scLocal)), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ILocalSet (dtb__67)), B_dData_dList.C_List_Nil)))); B_dData_dPair.f_Pair_second = (((v_pushBinder dtb__65) dtb__67) dtb__68) }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> (B_dData_dResult.C_Result_Err ("case arm has more than one runtime binder"))
)
  | B_dData_dList.C_List_Nil -> (B_dData_dResult.C_Result_Ok ({ B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = st }))
  | _ -> failwith "DT: impossible branch"
)) (v_runtimeBinders bs)))

# 1002 "Vuna/Compiler/Wasm/Module.vuna"
let rec v_bindFields = (fun (mc0 : int) (mc1 : t_GenState) (mc2 : string) (mc3 : string) (mc4 : Ir_dModel.t_IrBinder B_dData_dList.t_List) (mc5 : int) -> (match mc4 with
  | B_dData_dList.C_List__x58__x58_ (dtb__69, dtb__70) -> (if (mc0 <= 0) then (B_dData_dResult.C_Result_Err ("wasm codegen fuel exhausted")) else (match ((v_freshLocal mc1) Wasm_dModel.C_WatValTy_WvAnyRef) with
  | { B_dData_dPair.f_Pair_first = dtb__71; B_dData_dPair.f_Pair_second = dtb__72 } -> (match ((((((v_bindFields (mc0 - 1)) (((v_pushBinder dtb__69) dtb__71) dtb__72)) mc2) mc3) dtb__70) (mc5 + 1)) with
  | B_dData_dResult.C_Result_Err (dtb__73) -> (B_dData_dResult.C_Result_Err (dtb__73))
  | B_dData_dResult.C_Result_Ok (dtb__74) -> (B_dData_dResult.C_Result_Ok ({ B_dData_dPair.f_Pair_first = ((B_dData_dList.v_append (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ILocalGet (mc2)), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IRefCast (mc3)), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IStructGet (mc3, mc5)), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ILocalSet (dtb__71)), B_dData_dList.C_List_Nil))))))))) (B_dData_dPair.v_firstOf dtb__74)); B_dData_dPair.f_Pair_second = (B_dData_dPair.v_secondOf dtb__74) }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))
  | B_dData_dList.C_List_Nil -> (B_dData_dResult.C_Result_Ok ({ B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = mc1 }))
  | _ -> failwith "DT: impossible branch"
))

# 248 "Vuna/Compiler/Wasm/Module.vuna"
let rec v_genEffThunk = (fun (fuel : int) (st : t_GenState) (family : string) (ctor : string) (arity : int) (prim : Ir_dModel.t_Ir) -> (if (fuel <= 0) then (B_dData_dResult.C_Result_Err ("wasm codegen fuel exhausted")) else ((fun bs -> ((fun applied -> ((fun mkEff -> ((fun outer -> (((v_genExpr (fuel - 1)) st) outer)) (if (arity <= 0) then mkEff else (Ir_dModel.C_Ir_IrLam (bs, B_dData_dMaybe.C_Maybe_Nothing, mkEff))))) (Ir_dModel.C_Ir_IrCtor (family, ctor, B_dData_dMaybe.C_Maybe_Nothing, (B_dData_dList.C_List__x58__x58_ ((Ir_dModel.C_Ir_IrLam ((B_dData_dList.C_List__x58__x58_ (v_effUnitBinder, B_dData_dList.C_List_Nil)), B_dData_dMaybe.C_Maybe_Nothing, applied)), B_dData_dList.C_List_Nil)))))) ((v_applyAllIr prim) ((B_dData_dList.v_map (fun (b : Ir_dModel.t_IrBinder) -> (Ir_dModel.C_Ir_IrVar (b)))) bs)))) (v_effArgBinders arity))))
# 260 "Vuna/Compiler/Wasm/Module.vuna"
and v_genExpr = (fun (fuel : int) (st : t_GenState) (ir : Ir_dModel.t_Ir) -> (if (fuel <= 0) then (B_dData_dResult.C_Result_Err ("wasm codegen fuel exhausted")) else (match ir with
  | Ir_dModel.C_Ir_IrVar (dtb__75) -> ((v_genVar st) dtb__75)
  | Ir_dModel.C_Ir_IrGlobal (dtb__76) -> (((v_genGlobalRef (fuel - 1)) st) dtb__76)
  | Ir_dModel.C_Ir_IrInt (dtb__77) -> (B_dData_dResult.C_Result_Ok ({ B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IConstI64 (dtb__77)), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IStructNew ("$int")), B_dData_dList.C_List_Nil)))); B_dData_dPair.f_Pair_second = st }))
  | Ir_dModel.C_Ir_IrBool (dtb__78) -> (B_dData_dResult.C_Result_Ok ({ B_dData_dPair.f_Pair_first = (v_boolI31 dtb__78); B_dData_dPair.f_Pair_second = st }))
  | Ir_dModel.C_Ir_IrStr (dtb__79) -> ((v_genStr st) dtb__79)
  | Ir_dModel.C_Ir_IrCast (dtb__80, dtb__81, dtb__82) -> (((v_genExpr (fuel - 1)) st) dtb__82)
  | Ir_dModel.C_Ir_IrLet (dtb__83, dtb__84, dtb__85) -> (((((v_genLet (fuel - 1)) st) dtb__83) dtb__84) dtb__85)
  | Ir_dModel.C_Ir_IrIf (dtb__86, dtb__87, dtb__88) -> (((((v_genIf (fuel - 1)) st) dtb__86) dtb__87) dtb__88)
  | Ir_dModel.C_Ir_IrRtApp (dtb__89, dtb__90) -> ((((v_genRtApp (fuel - 1)) st) dtb__89) dtb__90)
  | Ir_dModel.C_Ir_IrApp (dtb__91, dtb__92, dtb__93) -> (((v_genApp (fuel - 1)) st) ir)
  | Ir_dModel.C_Ir_IrNatCase (dtb__94, dtb__95, dtb__96, dtb__97, dtb__98) -> ((((((v_genNatCase (fuel - 1)) st) dtb__94) dtb__96) dtb__97) dtb__98)
  | Ir_dModel.C_Ir_IrConcatMany (dtb__99) -> (((v_genConcatMany (fuel - 1)) st) dtb__99)
  | Ir_dModel.C_Ir_IrCtor (dtb__100, dtb__101, dtb__102, dtb__103) -> (((((v_genCtor (fuel - 1)) st) dtb__100) dtb__101) dtb__103)
  | Ir_dModel.C_Ir_IrRecord (dtb__104, dtb__105, dtb__106) -> ((((v_genRecord (fuel - 1)) st) dtb__104) dtb__106)
  | Ir_dModel.C_Ir_IrProj (dtb__107, dtb__108, dtb__109, dtb__110) -> (((((v_genProj (fuel - 1)) st) dtb__107) dtb__108) dtb__109)
  | Ir_dModel.C_Ir_IrRecUpd (dtb__111, dtb__112, dtb__113, dtb__114) -> (((((v_genRecUpd (fuel - 1)) st) dtb__111) dtb__112) dtb__113)
  | Ir_dModel.C_Ir_IrCase (dtb__115, dtb__116, dtb__117, dtb__118) -> (((((v_genCase (fuel - 1)) st) dtb__115) dtb__117) dtb__118)
  | Ir_dModel.C_Ir_IrLam (dtb__119, dtb__120, dtb__121) -> (((((v_genLamValue (fuel - 1)) st) dtb__119) dtb__120) dtb__121)
  | Ir_dModel.C_Ir_IrEffThunk (dtb__122, dtb__123, dtb__124, dtb__125, dtb__126) -> ((((((v_genEffThunk (fuel - 1)) st) dtb__122) dtb__123) dtb__125) dtb__126)
  | Ir_dModel.C_Ir_IrEffBind (dtb__127, dtb__128, dtb__129) -> (B_dData_dResult.C_Result_Err ("wasm target: effect bindings are not supported yet"))
  | Ir_dModel.C_Ir_IrFloatLit (dtb__130) -> ((v_genFloatLit st) dtb__130)
  | Ir_dModel.C_Ir_IrTail (dtb__131) -> (match (((v_genExpr (fuel - 1)) ((v_withTail true) st)) dtb__131) with
  | B_dData_dResult.C_Result_Err (dtb__132) -> (B_dData_dResult.C_Result_Err (dtb__132))
  | B_dData_dResult.C_Result_Ok (dtb__133) -> (B_dData_dResult.C_Result_Ok ({ B_dData_dPair.f_Pair_first = (B_dData_dPair.v_firstOf dtb__133); B_dData_dPair.f_Pair_second = ((v_withTail (st).f_GenState_gsTail) (B_dData_dPair.v_secondOf dtb__133)) }))
  | _ -> failwith "DT: impossible branch"
)
  | Ir_dModel.C_Ir_IrRt (dtb__134) -> (((v_genRtValue (fuel - 1)) st) dtb__134)
  | _ -> failwith "DT: impossible branch"
)))
# 300 "Vuna/Compiler/Wasm/Module.vuna"
and v_genGlobalRef = (fun (fuel : int) (st : t_GenState) (name : string) -> (if (fuel <= 0) then (B_dData_dResult.C_Result_Err ("wasm codegen fuel exhausted")) else (match ((((B_dContainer_dHashMap.v_lookup B_dData_dString.v_Hashable_uString) B_dData_dString.v_Eq_uString) name) (st).f_GenState_gsDefTbl) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__135) -> (if ((Ir_dModel.v_irDefArity dtb__135) = 0) then (B_dData_dResult.C_Result_Ok ({ B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IGlobalGet ((Wasm_dTypes.v_watGlobalNameOf name))), B_dData_dList.C_List_Nil)); B_dData_dPair.f_Pair_second = st })) else ((fun bs -> ((fun bodyIr -> (((((v_genLamValue (fuel - 1)) st) bs) B_dData_dMaybe.C_Maybe_Nothing) bodyIr)) ((v_applyAllIr (Ir_dModel.C_Ir_IrGlobal (name))) ((B_dData_dList.v_map (fun (b : Ir_dModel.t_IrBinder) -> (Ir_dModel.C_Ir_IrVar (b)))) bs)))) (v_etaBinders (Ir_dModel.v_irDefArity dtb__135))))
  | B_dData_dMaybe.C_Maybe_Nothing -> (B_dData_dResult.C_Result_Err ((String.concat "" ["unknown top-level definition in wasm codegen: `"; name; "`"])))
  | _ -> failwith "DT: impossible branch"
)))
# 317 "Vuna/Compiler/Wasm/Module.vuna"
and v_genRtValue = (fun (fuel : int) (st : t_GenState) (sym : string) -> (if (fuel <= 0) then (B_dData_dResult.C_Result_Err ("wasm codegen fuel exhausted")) else (match (Wasm_dRuntime.v_rtImplOf sym) with
  | Wasm_dRuntime.C_RtImpl_RtValue (dtb__136) -> (B_dData_dResult.C_Result_Ok ({ B_dData_dPair.f_Pair_first = dtb__136; B_dData_dPair.f_Pair_second = st }))
  | Wasm_dRuntime.C_RtImpl_RtUnsupported -> (B_dData_dResult.C_Result_Err ((String.concat "" ["wasm target: runtime symbol `"; sym; "` is not supported yet"])))
  | Wasm_dRuntime.C_RtImpl_RtFunc (dtb__137, dtb__138) -> ((fun bs -> ((fun bodyIr -> (((((v_genLamValue (fuel - 1)) st) bs) B_dData_dMaybe.C_Maybe_Nothing) bodyIr)) (Ir_dModel.C_Ir_IrRtApp (sym, ((B_dData_dList.v_map (fun (b : Ir_dModel.t_IrBinder) -> (Ir_dModel.C_Ir_IrVar (b)))) bs))))) (v_etaBinders dtb__137))
  | _ -> failwith "DT: impossible branch"
)))
# 362 "Vuna/Compiler/Wasm/Module.vuna"
and v_genIf = (fun (fuel : int) (st : t_GenState) (c : Ir_dModel.t_Ir) (th : Ir_dModel.t_Ir) (el : Ir_dModel.t_Ir) -> (if (fuel <= 0) then (B_dData_dResult.C_Result_Err ("wasm codegen fuel exhausted")) else (match (((v_genExpr (fuel - 1)) (v_noTail st)) c) with
  | B_dData_dResult.C_Result_Err (dtb__139) -> (B_dData_dResult.C_Result_Err (dtb__139))
  | B_dData_dResult.C_Result_Ok (dtb__140) -> ((fun base -> (match (((v_genExpr (fuel - 1)) base) th) with
  | B_dData_dResult.C_Result_Err (dtb__141) -> (B_dData_dResult.C_Result_Err (dtb__141))
  | B_dData_dResult.C_Result_Ok (dtb__142) -> (match (((v_genExpr (fuel - 1)) ((v_withTail (st).f_GenState_gsTail) ((v_resumeArm base) (B_dData_dPair.v_secondOf dtb__142)))) el) with
  | B_dData_dResult.C_Result_Err (dtb__143) -> (B_dData_dResult.C_Result_Err (dtb__143))
  | B_dData_dResult.C_Result_Ok (dtb__144) -> ((fun merged -> (B_dData_dResult.C_Result_Ok ({ B_dData_dPair.f_Pair_first = ((B_dData_dList.v_append (B_dData_dPair.v_firstOf dtb__140)) (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IRefCast ("i31")), (B_dData_dList.C_List__x58__x58_ (Wasm_dInstr.C_Instr_II31GetU, (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IIf ("anyref", (B_dData_dPair.v_firstOf dtb__142), (B_dData_dPair.v_firstOf dtb__144))), B_dData_dList.C_List_Nil))))))); B_dData_dPair.f_Pair_second = merged }))) ((v_withTail (st).f_GenState_gsTail) ((v_mergeArmState (B_dData_dPair.v_secondOf dtb__142)) (B_dData_dPair.v_secondOf dtb__144))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) ((v_withTail (st).f_GenState_gsTail) (B_dData_dPair.v_secondOf dtb__140)))
  | _ -> failwith "DT: impossible branch"
)))
# 383 "Vuna/Compiler/Wasm/Module.vuna"
and v_genLet = (fun (fuel : int) (st : t_GenState) (bs : Ir_dModel.t_IrBinder B_dData_dList.t_List) (scrut : Ir_dModel.t_Ir) (body : Ir_dModel.t_Ir) -> (if (fuel <= 0) then (B_dData_dResult.C_Result_Err ("wasm codegen fuel exhausted")) else ((fun runtimeBs -> ((fun savedScope -> (match (((v_genExpr (fuel - 1)) (v_noTail st)) scrut) with
  | B_dData_dResult.C_Result_Err (dtb__145) -> (B_dData_dResult.C_Result_Err (dtb__145))
  | B_dData_dResult.C_Result_Ok (dtb__146) -> ((((((v_genLetBound (fuel - 1)) ((v_withTail (st).f_GenState_gsTail) (B_dData_dPair.v_secondOf dtb__146))) runtimeBs) (B_dData_dPair.v_firstOf dtb__146)) body) savedScope)
  | _ -> failwith "DT: impossible branch"
)) (st).f_GenState_gsScope)) (v_runtimeBinders bs))))
# 395 "Vuna/Compiler/Wasm/Module.vuna"
and v_genLetBound = (fun (mc0 : int) (mc1 : t_GenState) (mc2 : Ir_dModel.t_IrBinder B_dData_dList.t_List) (mc3 : Wasm_dInstr.t_Instr B_dData_dList.t_List) (mc4 : Ir_dModel.t_Ir) (mc5 : (Ir_dModel.t_IrBinder, string) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__147, dtb__148) -> (if (mc0 <= 0) then (B_dData_dResult.C_Result_Err ("wasm codegen fuel exhausted")) else (if ((v_listLengthB dtb__148) <> 0) then (B_dData_dResult.C_Result_Err ("unboxed let has more than one runtime binder")) else (match ((v_freshLocal mc1) Wasm_dModel.C_WatValTy_WvAnyRef) with
  | { B_dData_dPair.f_Pair_first = dtb__149; B_dData_dPair.f_Pair_second = dtb__150 } -> (match (((v_genExpr (mc0 - 1)) (((v_pushBinder dtb__147) dtb__149) dtb__150)) mc4) with
  | B_dData_dResult.C_Result_Err (dtb__151) -> (B_dData_dResult.C_Result_Err (dtb__151))
  | B_dData_dResult.C_Result_Ok (dtb__152) -> (B_dData_dResult.C_Result_Ok ({ B_dData_dPair.f_Pair_first = ((B_dData_dList.v_append mc3) ((B_dData_dList.v_append (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ILocalSet (dtb__149)), B_dData_dList.C_List_Nil))) (B_dData_dPair.v_firstOf dtb__152))); B_dData_dPair.f_Pair_second = ((v_restoreScope mc5) (B_dData_dPair.v_secondOf dtb__152)) }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))
  | B_dData_dList.C_List_Nil -> (if (mc0 <= 0) then (B_dData_dResult.C_Result_Err ("wasm codegen fuel exhausted")) else (match (((v_genExpr (mc0 - 1)) mc1) mc4) with
  | B_dData_dResult.C_Result_Err (dtb__153) -> (B_dData_dResult.C_Result_Err (dtb__153))
  | B_dData_dResult.C_Result_Ok (dtb__154) -> (B_dData_dResult.C_Result_Ok ({ B_dData_dPair.f_Pair_first = ((B_dData_dList.v_append mc3) ((B_dData_dList.v_append (B_dData_dList.C_List__x58__x58_ (Wasm_dInstr.C_Instr_IDrop, B_dData_dList.C_List_Nil))) (B_dData_dPair.v_firstOf dtb__154))); B_dData_dPair.f_Pair_second = ((v_restoreScope mc5) (B_dData_dPair.v_secondOf dtb__154)) }))
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
))
# 422 "Vuna/Compiler/Wasm/Module.vuna"
and v_genApp = (fun (fuel : int) (st : t_GenState) (ir : Ir_dModel.t_Ir) -> (if (fuel <= 0) then (B_dData_dResult.C_Result_Err ("wasm codegen fuel exhausted")) else (match (Ir_dAnalysis.v_flattenApp ir) with
  | { B_dData_dPair.f_Pair_first = dtb__155; B_dData_dPair.f_Pair_second = dtb__156 } -> (match dtb__155 with
  | Ir_dModel.C_Ir_IrGlobal (dtb__157) -> ((((v_genGlobalCall (fuel - 1)) st) dtb__157) dtb__156)
  | Ir_dModel.C_Ir_IrLam (dtb__158, dtb__159, dtb__160) -> ((fun nd_uscrut10 -> (match nd_uscrut10 with
  | B_dData_dList.C_List__x58__x58_ (dtb__161, dtb__162) -> (match dtb__162 with
  | B_dData_dList.C_List_Nil -> ((fun nd_uscrut15 -> (match nd_uscrut15 with
  | B_dData_dList.C_List__x58__x58_ (dtb__163, dtb__164) -> (match dtb__164 with
  | B_dData_dList.C_List_Nil -> (((((v_genLamApp (fuel - 1)) st) (B_dData_dList.C_List__x58__x58_ (dtb__161, B_dData_dList.C_List_Nil))) dtb__160) (B_dData_dList.C_List__x58__x58_ (dtb__163, B_dData_dList.C_List_Nil)))
  | _ -> ((((v_genApplyValue (fuel - 1)) st) dtb__155) dtb__156)
)
  | _ -> ((((v_genApplyValue (fuel - 1)) st) dtb__155) dtb__156)
)) dtb__156)
  | _ -> ((((v_genApplyValue (fuel - 1)) st) dtb__155) dtb__156)
)
  | _ -> ((((v_genApplyValue (fuel - 1)) st) dtb__155) dtb__156)
)) (v_runtimeBinders dtb__158))
  | Ir_dModel.C_Ir_IrRt (dtb__165) -> (if (dtb__165 = "prim_erase") then (match dtb__156 with
  | B_dData_dList.C_List_Nil -> (B_dData_dResult.C_Result_Err ("prim_erase needs an argument"))
  | B_dData_dList.C_List__x58__x58_ (dtb__166, dtb__167) -> (((v_genExpr (fuel - 1)) st) ((v_applyAllIr dtb__166) dtb__167))
  | _ -> failwith "DT: impossible branch"
) else ((((v_genRtApp (fuel - 1)) st) dtb__165) dtb__156))
  | _ -> ((((v_genApplyValue (fuel - 1)) st) dtb__155) dtb__156)
)
  | _ -> failwith "DT: impossible branch"
)))
# 447 "Vuna/Compiler/Wasm/Module.vuna"
and v_genGlobalCall = (fun (fuel : int) (st : t_GenState) (name : string) (args : Ir_dModel.t_Ir B_dData_dList.t_List) -> (if (fuel <= 0) then (B_dData_dResult.C_Result_Err ("wasm codegen fuel exhausted")) else (match ((((B_dContainer_dHashMap.v_lookup B_dData_dString.v_Hashable_uString) B_dData_dString.v_Eq_uString) name) (st).f_GenState_gsDefTbl) with
  | B_dData_dMaybe.C_Maybe_Nothing -> (B_dData_dResult.C_Result_Err ((String.concat "" ["unknown top-level definition in wasm codegen: `"; name; "`"])))
  | B_dData_dMaybe.C_Maybe_Just (dtb__168) -> ((fun arity -> ((fun argc -> (if (arity = 0) then (match (((v_genGlobalRef (fuel - 1)) st) name) with
  | B_dData_dResult.C_Result_Err (dtb__169) -> (B_dData_dResult.C_Result_Err (dtb__169))
  | B_dData_dResult.C_Result_Ok (dtb__170) -> (((((v_genApplyArgs (fuel - 1)) (st).f_GenState_gsTail) (B_dData_dPair.v_secondOf dtb__170)) (B_dData_dPair.v_firstOf dtb__170)) args)
  | _ -> failwith "DT: impossible branch"
) else (if (argc = arity) then ((((v_genArgsThen (fuel - 1)) st) args) (if (st).f_GenState_gsTail then (Wasm_dInstr.C_Instr_IReturnCall ((Wasm_dTypes.v_watFuncNameOf name))) else (Wasm_dInstr.C_Instr_ICall ((Wasm_dTypes.v_watFuncNameOf name))))) else (if (argc < arity) then ((((v_genApplyValue (fuel - 1)) st) (Ir_dModel.C_Ir_IrGlobal (name))) args) else (match ((v_splitAt arity) args) with
  | { B_dData_dPair.f_Pair_first = dtb__171; B_dData_dPair.f_Pair_second = dtb__172 } -> (match ((((v_genArgsThen (fuel - 1)) st) dtb__171) (Wasm_dInstr.C_Instr_ICall ((Wasm_dTypes.v_watFuncNameOf name)))) with
  | B_dData_dResult.C_Result_Err (dtb__173) -> (B_dData_dResult.C_Result_Err (dtb__173))
  | B_dData_dResult.C_Result_Ok (dtb__174) -> (((((v_genApplyArgs (fuel - 1)) (st).f_GenState_gsTail) (B_dData_dPair.v_secondOf dtb__174)) (B_dData_dPair.v_firstOf dtb__174)) dtb__172)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))) (v_listLengthB args))) (Ir_dModel.v_irDefArity dtb__168))
  | _ -> failwith "DT: impossible branch"
)))
# 515 "Vuna/Compiler/Wasm/Module.vuna"
and v_genLamValue = (fun (fuel : int) (st : t_GenState) (bs : Ir_dModel.t_IrBinder B_dData_dList.t_List) (rt : Ir_dModel.t_IrTy B_dData_dMaybe.t_Maybe) (body : Ir_dModel.t_Ir) -> (if (fuel <= 0) then (B_dData_dResult.C_Result_Err ("wasm codegen fuel exhausted")) else ((fun rbs -> ((fun caps -> ((fun ncap -> ((fun n -> ((fun lamName -> ((fun st1 -> (match rbs with
  | B_dData_dList.C_List_Nil -> (((v_genExpr (fuel - 1)) st) body)
  | B_dData_dList.C_List__x58__x58_ (dtb__175, dtb__176) -> (if ((v_listLengthB dtb__176) > 0) then (((((v_genLamValue (fuel - 1)) st) (B_dData_dList.C_List__x58__x58_ (dtb__175, B_dData_dList.C_List_Nil))) rt) (Ir_dModel.C_Ir_IrLam (dtb__176, rt, body))) else (match (((v_bindEnvLocals (v_beginFuncScope st1)) caps) 0) with
  | B_dData_dResult.C_Result_Err (dtb__177) -> (B_dData_dResult.C_Result_Err (dtb__177))
  | B_dData_dResult.C_Result_Ok (dtb__178) -> (match ((v_freshLocal (B_dData_dPair.v_secondOf dtb__178)) Wasm_dModel.C_WatValTy_WvAnyRef) with
  | { B_dData_dPair.f_Pair_first = dtb__179; B_dData_dPair.f_Pair_second = dtb__180 } -> (match (((v_genExpr (fuel - 1)) (((v_pushBinder dtb__175) dtb__179) ((v_withTail true) dtb__180))) body) with
  | B_dData_dResult.C_Result_Err (dtb__181) -> (B_dData_dResult.C_Result_Err (dtb__181))
  | B_dData_dResult.C_Result_Ok (dtb__182) -> ((fun stF -> ((fun lamFunc -> ((fun capVals -> ((fun envInstrs -> ((fun mkClo -> ((fun stA -> ((fun stB -> ((fun stC -> (B_dData_dResult.C_Result_Ok ({ B_dData_dPair.f_Pair_first = mkClo; B_dData_dPair.f_Pair_second = stC }))) ((v_restoreFuncScope st) stB))) ((v_addElemName lamName) stA))) ((v_addLamFunc lamFunc) stF))) ((B_dData_dList.v_append (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IRefFunc (lamName)), B_dData_dList.C_List_Nil))) ((B_dData_dList.v_append envInstrs) (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IStructNew ("$clo")), B_dData_dList.C_List_Nil)))))) (if (ncap = 0) then (B_dData_dList.C_List__x58__x58_ (Wasm_dInstr.C_Instr_IRefNull, B_dData_dList.C_List_Nil)) else ((B_dData_dList.v_append capVals) (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IArrayNewFixed ("$env", ncap)), B_dData_dList.C_List_Nil)))))) (v_capGetInstrs caps))) { Wasm_dModel.f_WatFunc_watFuncName = lamName; Wasm_dModel.f_WatFunc_watFuncType = ""; Wasm_dModel.f_WatFunc_watFuncParams = (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = "$p0"; B_dData_dPair.f_Pair_second = Wasm_dModel.C_WatValTy_WvAnyRef }, (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = "$p1"; B_dData_dPair.f_Pair_second = Wasm_dModel.C_WatValTy_WvAnyRef }, B_dData_dList.C_List_Nil)))); Wasm_dModel.f_WatFunc_watFuncResults = (B_dData_dList.C_List__x58__x58_ (Wasm_dModel.C_WatValTy_WvAnyRef, B_dData_dList.C_List_Nil)); Wasm_dModel.f_WatFunc_watFuncLocals = (stF).f_GenState_gsLocals; Wasm_dModel.f_WatFunc_watFuncBody = ((B_dData_dList.v_append (B_dData_dPair.v_firstOf dtb__178)) ((B_dData_dList.v_append (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ILocalGet ("$p1")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ILocalSet (dtb__179)), B_dData_dList.C_List_Nil))))) (B_dData_dPair.v_firstOf dtb__182))) })) (B_dData_dPair.v_secondOf dtb__182))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> (B_dData_dResult.C_Result_Err ("wasm target: lambda binder shape mismatch"))
)
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
)) { st with f_GenState_gsNextLam = (n + 1) })) ("$lam" ^ (bi_strFromInt n)))) (st).f_GenState_gsNextLam)) (v_listLengthB caps))) (B_dData_dList.v_reverse (st).f_GenState_gsScope))) (v_runtimeBinders bs))))
# 556 "Vuna/Compiler/Wasm/Module.vuna"
and v_genApplyValue = (fun (fuel : int) (st : t_GenState) (head : Ir_dModel.t_Ir) (args : Ir_dModel.t_Ir B_dData_dList.t_List) -> (if (fuel <= 0) then (B_dData_dResult.C_Result_Err ("wasm codegen fuel exhausted")) else (match (((v_genExpr (fuel - 1)) (v_noTail st)) head) with
  | B_dData_dResult.C_Result_Err (dtb__183) -> (B_dData_dResult.C_Result_Err (dtb__183))
  | B_dData_dResult.C_Result_Ok (dtb__184) -> (((((v_genApplyArgs (fuel - 1)) (st).f_GenState_gsTail) ((v_withTail (st).f_GenState_gsTail) (B_dData_dPair.v_secondOf dtb__184))) (B_dData_dPair.v_firstOf dtb__184)) args)
  | _ -> failwith "DT: impossible branch"
)))
# 567 "Vuna/Compiler/Wasm/Module.vuna"
and v_genApplyArgs = (fun (mc0 : int) (mc1 : bool) (mc2 : t_GenState) (mc3 : Wasm_dInstr.t_Instr B_dData_dList.t_List) (mc4 : Ir_dModel.t_Ir B_dData_dList.t_List) -> (match mc4 with
  | B_dData_dList.C_List__x58__x58_ (dtb__185, dtb__186) -> (if (mc0 <= 0) then (B_dData_dResult.C_Result_Err ("wasm codegen fuel exhausted")) else (match (((v_genExpr (mc0 - 1)) (v_noTail mc2)) dtb__185) with
  | B_dData_dResult.C_Result_Err (dtb__187) -> (B_dData_dResult.C_Result_Err (dtb__187))
  | B_dData_dResult.C_Result_Ok (dtb__188) -> ((fun callInstr -> (((((v_genApplyArgs (mc0 - 1)) mc1) ((v_withTail (mc2).f_GenState_gsTail) (B_dData_dPair.v_secondOf dtb__188))) ((B_dData_dList.v_append mc3) ((B_dData_dList.v_append (B_dData_dPair.v_firstOf dtb__188)) (B_dData_dList.C_List__x58__x58_ (callInstr, B_dData_dList.C_List_Nil))))) dtb__186)) (match dtb__186 with
  | B_dData_dList.C_List_Nil -> (if mc1 then (Wasm_dInstr.C_Instr_IReturnCall ("$rt_apply")) else (Wasm_dInstr.C_Instr_ICall ("$rt_apply")))
  | _ -> (Wasm_dInstr.C_Instr_ICall ("$rt_apply"))
))
  | _ -> failwith "DT: impossible branch"
))
  | B_dData_dList.C_List_Nil -> (B_dData_dResult.C_Result_Ok ({ B_dData_dPair.f_Pair_first = mc3; B_dData_dPair.f_Pair_second = mc2 }))
  | _ -> failwith "DT: impossible branch"
))
# 584 "Vuna/Compiler/Wasm/Module.vuna"
and v_genLamApp = (fun (fuel : int) (st : t_GenState) (bs : Ir_dModel.t_IrBinder B_dData_dList.t_List) (body : Ir_dModel.t_Ir) (args : Ir_dModel.t_Ir B_dData_dList.t_List) -> (if (fuel <= 0) then (B_dData_dResult.C_Result_Err ("wasm codegen fuel exhausted")) else ((fun rbs -> ((fun savedScope -> (if ((v_listLengthB rbs) <> 1) then (B_dData_dResult.C_Result_Err ("wasm target: only single-binder lambdas are supported yet")) else (if ((v_listLengthB args) <> 1) then (B_dData_dResult.C_Result_Err ("wasm target: only saturated single-argument lambda application is supported yet")) else ((fun nd_uscrut7 -> (match nd_uscrut7 with
  | B_dData_dList.C_List__x58__x58_ (dtb__189, dtb__190) -> (match dtb__190 with
  | B_dData_dList.C_List_Nil -> (match (((v_genExpr (fuel - 1)) (v_noTail st)) dtb__189) with
  | B_dData_dResult.C_Result_Err (dtb__191) -> (B_dData_dResult.C_Result_Err (dtb__191))
  | B_dData_dResult.C_Result_Ok (dtb__192) -> ((fun nd_uscrut14 -> (match nd_uscrut14 with
  | B_dData_dList.C_List__x58__x58_ (dtb__193, dtb__194) -> (match dtb__194 with
  | B_dData_dList.C_List_Nil -> (match ((v_freshLocal ((v_withTail (st).f_GenState_gsTail) (B_dData_dPair.v_secondOf dtb__192))) Wasm_dModel.C_WatValTy_WvAnyRef) with
  | { B_dData_dPair.f_Pair_first = dtb__195; B_dData_dPair.f_Pair_second = dtb__196 } -> (match (((v_genExpr (fuel - 1)) (((v_pushBinder dtb__193) dtb__195) ((v_withTail (st).f_GenState_gsTail) dtb__196))) body) with
  | B_dData_dResult.C_Result_Err (dtb__197) -> (B_dData_dResult.C_Result_Err (dtb__197))
  | B_dData_dResult.C_Result_Ok (dtb__198) -> (B_dData_dResult.C_Result_Ok ({ B_dData_dPair.f_Pair_first = ((B_dData_dList.v_append (B_dData_dPair.v_firstOf dtb__192)) ((B_dData_dList.v_append (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ILocalSet (dtb__195)), B_dData_dList.C_List_Nil))) (B_dData_dPair.v_firstOf dtb__198))); B_dData_dPair.f_Pair_second = ((v_restoreScope savedScope) (B_dData_dPair.v_secondOf dtb__198)) }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> (B_dData_dResult.C_Result_Err ("wasm target: lambda binder shape mismatch"))
)
  | _ -> (B_dData_dResult.C_Result_Err ("wasm target: lambda binder shape mismatch"))
)) rbs)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> (B_dData_dResult.C_Result_Err ("wasm target: lambda application shape mismatch"))
)
  | _ -> (B_dData_dResult.C_Result_Err ("wasm target: lambda application shape mismatch"))
)) args)))) (st).f_GenState_gsScope)) (v_runtimeBinders bs))))
# 613 "Vuna/Compiler/Wasm/Module.vuna"
and v_genArgsThen = (fun (mc0 : int) (mc1 : t_GenState) (mc2 : Ir_dModel.t_Ir B_dData_dList.t_List) (mc3 : Wasm_dInstr.t_Instr) -> (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__199, dtb__200) -> (if (mc0 <= 0) then (B_dData_dResult.C_Result_Err ("wasm codegen fuel exhausted")) else (match (((v_genExpr (mc0 - 1)) (v_noTail mc1)) dtb__199) with
  | B_dData_dResult.C_Result_Err (dtb__201) -> (B_dData_dResult.C_Result_Err (dtb__201))
  | B_dData_dResult.C_Result_Ok (dtb__202) -> (match ((((v_genArgsThen (mc0 - 1)) ((v_withTail (mc1).f_GenState_gsTail) (B_dData_dPair.v_secondOf dtb__202))) dtb__200) mc3) with
  | B_dData_dResult.C_Result_Err (dtb__203) -> (B_dData_dResult.C_Result_Err (dtb__203))
  | B_dData_dResult.C_Result_Ok (dtb__204) -> (B_dData_dResult.C_Result_Ok ({ B_dData_dPair.f_Pair_first = ((B_dData_dList.v_append (B_dData_dPair.v_firstOf dtb__202)) (B_dData_dPair.v_firstOf dtb__204)); B_dData_dPair.f_Pair_second = (B_dData_dPair.v_secondOf dtb__204) }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))
  | B_dData_dList.C_List_Nil -> (B_dData_dResult.C_Result_Ok ({ B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ (mc3, B_dData_dList.C_List_Nil)); B_dData_dPair.f_Pair_second = mc1 }))
  | _ -> failwith "DT: impossible branch"
))
# 626 "Vuna/Compiler/Wasm/Module.vuna"
and v_genRtApp = (fun (fuel : int) (st : t_GenState) (sym : string) (args : Ir_dModel.t_Ir B_dData_dList.t_List) -> (if (fuel <= 0) then (B_dData_dResult.C_Result_Err ("wasm codegen fuel exhausted")) else (if (sym = "prim_erase") then (match args with
  | B_dData_dList.C_List_Nil -> (B_dData_dResult.C_Result_Err ("prim_erase needs an argument"))
  | B_dData_dList.C_List__x58__x58_ (dtb__205, dtb__206) -> (((v_genExpr (fuel - 1)) st) ((v_applyAllIr dtb__205) dtb__206))
  | _ -> failwith "DT: impossible branch"
) else (match (Wasm_dRuntime.v_rtImplOf sym) with
  | Wasm_dRuntime.C_RtImpl_RtUnsupported -> (B_dData_dResult.C_Result_Err ((String.concat "" ["wasm target: runtime symbol `"; sym; "` is not supported yet"])))
  | Wasm_dRuntime.C_RtImpl_RtValue (dtb__207) -> (if ((v_listLengthB args) = 0) then (B_dData_dResult.C_Result_Ok ({ B_dData_dPair.f_Pair_first = dtb__207; B_dData_dPair.f_Pair_second = st })) else (B_dData_dResult.C_Result_Err ((String.concat "" ["wasm target: runtime value `"; sym; "` applied to arguments"]))))
  | Wasm_dRuntime.C_RtImpl_RtFunc (dtb__208, dtb__209) -> ((fun argc -> (if (argc = dtb__208) then ((((v_genArgsThen (fuel - 1)) st) args) (if (st).f_GenState_gsTail then (Wasm_dInstr.C_Instr_IReturnCall (dtb__209)) else (Wasm_dInstr.C_Instr_ICall (dtb__209)))) else (if (argc < dtb__208) then ((((v_genApplyValue (fuel - 1)) st) (Ir_dModel.C_Ir_IrRt (sym))) args) else (match ((v_splitAt dtb__208) args) with
  | { B_dData_dPair.f_Pair_first = dtb__210; B_dData_dPair.f_Pair_second = dtb__211 } -> (match ((((v_genArgsThen (fuel - 1)) st) dtb__210) (Wasm_dInstr.C_Instr_ICall (dtb__209))) with
  | B_dData_dResult.C_Result_Err (dtb__212) -> (B_dData_dResult.C_Result_Err (dtb__212))
  | B_dData_dResult.C_Result_Ok (dtb__213) -> (((((v_genApplyArgs (fuel - 1)) (st).f_GenState_gsTail) (B_dData_dPair.v_secondOf dtb__213)) (B_dData_dPair.v_firstOf dtb__213)) dtb__211)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))) (v_listLengthB args))
  | _ -> failwith "DT: impossible branch"
))))
# 665 "Vuna/Compiler/Wasm/Module.vuna"
and v_genNatArm = (fun (fuel : int) (st : t_GenState) (alt : Ir_dModel.t_IrAlt B_dData_dMaybe.t_Maybe) (valueInstrs : Wasm_dInstr.t_Instr B_dData_dList.t_List) -> (if (fuel <= 0) then (B_dData_dResult.C_Result_Err ("wasm codegen fuel exhausted")) else (match alt with
  | B_dData_dMaybe.C_Maybe_Nothing -> (B_dData_dResult.C_Result_Err ("wasm target: Nat case has no zero/succ/catch branch"))
  | B_dData_dMaybe.C_Maybe_Just (dtb__214) -> ((((v_genNatArmAlt fuel) st) dtb__214) valueInstrs)
  | _ -> failwith "DT: impossible branch"
)))
# 674 "Vuna/Compiler/Wasm/Module.vuna"
and v_genNatArmAlt = (fun (fuel : int) (st : t_GenState) (a : Ir_dModel.t_IrAlt) (valueInstrs : Wasm_dInstr.t_Instr B_dData_dList.t_List) -> (if (fuel <= 0) then (B_dData_dResult.C_Result_Err ("wasm codegen fuel exhausted")) else ((fun bs -> ((fun savedScope -> ((fun nd_uscrut6 -> (match nd_uscrut6 with
  | B_dData_dList.C_List__x58__x58_ (dtb__215, dtb__216) -> (match dtb__216 with
  | B_dData_dList.C_List_Nil -> (match ((v_freshLocal st) Wasm_dModel.C_WatValTy_WvAnyRef) with
  | { B_dData_dPair.f_Pair_first = dtb__217; B_dData_dPair.f_Pair_second = dtb__218 } -> (match (((v_genExpr (fuel - 1)) (((v_pushBinder dtb__215) dtb__217) dtb__218)) (Ir_dModel.v_irAltBodyOf a)) with
  | B_dData_dResult.C_Result_Err (dtb__219) -> (B_dData_dResult.C_Result_Err (dtb__219))
  | B_dData_dResult.C_Result_Ok (dtb__220) -> (B_dData_dResult.C_Result_Ok ({ B_dData_dPair.f_Pair_first = ((B_dData_dList.v_append valueInstrs) ((B_dData_dList.v_append (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ILocalSet (dtb__217)), B_dData_dList.C_List_Nil))) (B_dData_dPair.v_firstOf dtb__220))); B_dData_dPair.f_Pair_second = ((v_restoreScope savedScope) (B_dData_dPair.v_secondOf dtb__220)) }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> (B_dData_dResult.C_Result_Err ("wasm target: Nat case arm has more than one runtime binder"))
)
  | B_dData_dList.C_List_Nil -> (((v_genExpr (fuel - 1)) st) (Ir_dModel.v_irAltBodyOf a))
  | _ -> failwith "DT: impossible branch"
)) bs)) (st).f_GenState_gsScope)) (v_runtimeBinders (Ir_dModel.v_irAltBindersOf a)))))
# 692 "Vuna/Compiler/Wasm/Module.vuna"
and v_genNatCase = (fun (fuel : int) (st : t_GenState) (scrut : Ir_dModel.t_Ir) (zero : Ir_dModel.t_IrAlt B_dData_dMaybe.t_Maybe) (succ : Ir_dModel.t_IrAlt B_dData_dMaybe.t_Maybe) (catch : Ir_dModel.t_IrAlt B_dData_dMaybe.t_Maybe) -> (if (fuel <= 0) then (B_dData_dResult.C_Result_Err ("wasm codegen fuel exhausted")) else (match (((v_genExpr (fuel - 1)) (v_noTail st)) scrut) with
  | B_dData_dResult.C_Result_Err (dtb__221) -> (B_dData_dResult.C_Result_Err (dtb__221))
  | B_dData_dResult.C_Result_Ok (dtb__222) -> (match ((v_freshLocal ((v_withTail (st).f_GenState_gsTail) (B_dData_dPair.v_secondOf dtb__222))) Wasm_dModel.C_WatValTy_WvAnyRef) with
  | { B_dData_dPair.f_Pair_first = dtb__223; B_dData_dPair.f_Pair_second = dtb__224 } -> ((fun zeroAlt -> ((fun succAlt -> ((fun zeroValue -> ((fun succValue -> ((fun succBoxed -> (match ((((v_genNatArm (fuel - 1)) dtb__224) zeroAlt) zeroValue) with
  | B_dData_dResult.C_Result_Err (dtb__225) -> (B_dData_dResult.C_Result_Err (dtb__225))
  | B_dData_dResult.C_Result_Ok (dtb__226) -> (match ((((v_genNatArm (fuel - 1)) ((v_withTail (dtb__224).f_GenState_gsTail) ((v_resumeArm dtb__224) (B_dData_dPair.v_secondOf dtb__226)))) succAlt) succBoxed) with
  | B_dData_dResult.C_Result_Err (dtb__227) -> (B_dData_dResult.C_Result_Err (dtb__227))
  | B_dData_dResult.C_Result_Ok (dtb__228) -> ((fun merged -> ((fun cond -> (B_dData_dResult.C_Result_Ok ({ B_dData_dPair.f_Pair_first = ((B_dData_dList.v_append (B_dData_dPair.v_firstOf dtb__222)) ((B_dData_dList.v_append (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ILocalSet (dtb__223)), B_dData_dList.C_List_Nil))) ((B_dData_dList.v_append cond) (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IIf ("anyref", (B_dData_dPair.v_firstOf dtb__226), (B_dData_dPair.v_firstOf dtb__228))), B_dData_dList.C_List_Nil))))); B_dData_dPair.f_Pair_second = merged }))) ((B_dData_dList.v_append (v_unboxLocalInt dtb__223)) (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IConstI64 (0)), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IBinop ("i64.eq")), B_dData_dList.C_List_Nil))))))) ((v_withTail (st).f_GenState_gsTail) ((v_mergeArmState (B_dData_dPair.v_secondOf dtb__226)) (B_dData_dPair.v_secondOf dtb__228))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) ((B_dData_dList.v_append succValue) v_boxInstr))) ((B_dData_dList.v_append (v_unboxLocalInt dtb__223)) (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IConstI64 (1)), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IBinop ("i64.sub")), B_dData_dList.C_List_Nil))))))) (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ILocalGet (dtb__223)), B_dData_dList.C_List_Nil)))) (match succ with
  | B_dData_dMaybe.C_Maybe_Just (dtb__229) -> (B_dData_dMaybe.C_Maybe_Just (dtb__229))
  | B_dData_dMaybe.C_Maybe_Nothing -> catch
  | _ -> failwith "DT: impossible branch"
))) (match zero with
  | B_dData_dMaybe.C_Maybe_Just (dtb__230) -> (B_dData_dMaybe.C_Maybe_Just (dtb__230))
  | B_dData_dMaybe.C_Maybe_Nothing -> catch
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))
# 725 "Vuna/Compiler/Wasm/Module.vuna"
and v_genConcatMany = (fun (fuel : int) (st : t_GenState) (parts : Ir_dModel.t_Ir B_dData_dList.t_List) -> (if (fuel <= 0) then (B_dData_dResult.C_Result_Err ("wasm codegen fuel exhausted")) else ((fun nd_uscrut3 -> (match nd_uscrut3 with
  | B_dData_dList.C_List__x58__x58_ (dtb__231, dtb__232) -> (match dtb__232 with
  | B_dData_dList.C_List_Nil -> (((v_genExpr (fuel - 1)) (v_noTail st)) dtb__231)
  | _ -> (match (((v_genExpr (fuel - 1)) (v_noTail st)) dtb__231) with
  | B_dData_dResult.C_Result_Err (dtb__233) -> (B_dData_dResult.C_Result_Err (dtb__233))
  | B_dData_dResult.C_Result_Ok (dtb__234) -> (match (((v_genConcatRest (fuel - 1)) (B_dData_dPair.v_secondOf dtb__234)) dtb__232) with
  | B_dData_dResult.C_Result_Err (dtb__235) -> (B_dData_dResult.C_Result_Err (dtb__235))
  | B_dData_dResult.C_Result_Ok (dtb__236) -> (B_dData_dResult.C_Result_Ok ({ B_dData_dPair.f_Pair_first = ((B_dData_dList.v_append (B_dData_dPair.v_firstOf dtb__234)) (B_dData_dPair.v_firstOf dtb__236)); B_dData_dPair.f_Pair_second = (B_dData_dPair.v_secondOf dtb__236) }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
)
  | B_dData_dList.C_List_Nil -> (B_dData_dResult.C_Result_Ok ({ B_dData_dPair.f_Pair_first = v_emptyStr; B_dData_dPair.f_Pair_second = st }))
  | _ -> failwith "DT: impossible branch"
)) parts)))
# 741 "Vuna/Compiler/Wasm/Module.vuna"
and v_genConcatRest = (fun (mc0 : int) (mc1 : t_GenState) (mc2 : Ir_dModel.t_Ir B_dData_dList.t_List) -> (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__237, dtb__238) -> (if (mc0 <= 0) then (B_dData_dResult.C_Result_Err ("wasm codegen fuel exhausted")) else (match (((v_genExpr (mc0 - 1)) (v_noTail mc1)) dtb__237) with
  | B_dData_dResult.C_Result_Err (dtb__239) -> (B_dData_dResult.C_Result_Err (dtb__239))
  | B_dData_dResult.C_Result_Ok (dtb__240) -> (match (((v_genConcatRest (mc0 - 1)) ((v_withTail (mc1).f_GenState_gsTail) (B_dData_dPair.v_secondOf dtb__240))) dtb__238) with
  | B_dData_dResult.C_Result_Err (dtb__241) -> (B_dData_dResult.C_Result_Err (dtb__241))
  | B_dData_dResult.C_Result_Ok (dtb__242) -> (B_dData_dResult.C_Result_Ok ({ B_dData_dPair.f_Pair_first = ((B_dData_dList.v_append (B_dData_dPair.v_firstOf dtb__240)) ((B_dData_dList.v_append (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ICall ("$rt_strConcat")), B_dData_dList.C_List_Nil))) (B_dData_dPair.v_firstOf dtb__242))); B_dData_dPair.f_Pair_second = (B_dData_dPair.v_secondOf dtb__242) }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))
  | B_dData_dList.C_List_Nil -> (B_dData_dResult.C_Result_Ok ({ B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = mc1 }))
  | _ -> failwith "DT: impossible branch"
))
# 766 "Vuna/Compiler/Wasm/Module.vuna"
and v_genExprs = (fun (mc0 : int) (mc1 : t_GenState) (mc2 : Ir_dModel.t_Ir B_dData_dList.t_List) -> (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__243, dtb__244) -> (if (mc0 <= 0) then (B_dData_dResult.C_Result_Err ("wasm codegen fuel exhausted")) else (match (((v_genExpr (mc0 - 1)) (v_noTail mc1)) dtb__243) with
  | B_dData_dResult.C_Result_Err (dtb__245) -> (B_dData_dResult.C_Result_Err (dtb__245))
  | B_dData_dResult.C_Result_Ok (dtb__246) -> (match (((v_genExprs (mc0 - 1)) ((v_withTail (mc1).f_GenState_gsTail) (B_dData_dPair.v_secondOf dtb__246))) dtb__244) with
  | B_dData_dResult.C_Result_Err (dtb__247) -> (B_dData_dResult.C_Result_Err (dtb__247))
  | B_dData_dResult.C_Result_Ok (dtb__248) -> (B_dData_dResult.C_Result_Ok ({ B_dData_dPair.f_Pair_first = ((B_dData_dList.v_append (B_dData_dPair.v_firstOf dtb__246)) (B_dData_dPair.v_firstOf dtb__248)); B_dData_dPair.f_Pair_second = (B_dData_dPair.v_secondOf dtb__248) }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))
  | B_dData_dList.C_List_Nil -> (B_dData_dResult.C_Result_Ok ({ B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = mc1 }))
  | _ -> failwith "DT: impossible branch"
))
# 781 "Vuna/Compiler/Wasm/Module.vuna"
and v_genCtor = (fun (fuel : int) (st : t_GenState) (family : string) (ctor : string) (args : Ir_dModel.t_Ir B_dData_dList.t_List) -> (if (fuel <= 0) then (B_dData_dResult.C_Result_Err ("wasm codegen fuel exhausted")) else (match ((v_famOrFail st) family) with
  | B_dData_dResult.C_Result_Err (dtb__249) -> (B_dData_dResult.C_Result_Err (dtb__249))
  | B_dData_dResult.C_Result_Ok (dtb__250) -> (match ((Wasm_dTypes.v_wasmCtorTagOf dtb__250) ctor) with
  | B_dData_dMaybe.C_Maybe_Nothing -> (B_dData_dResult.C_Result_Err ((String.concat "" ["unknown constructor in wasm codegen: `"; ctor; "`"])))
  | B_dData_dMaybe.C_Maybe_Just (dtb__251) -> (match ((Wasm_dTypes.v_wasmCtorFieldCountOf dtb__250) ctor) with
  | B_dData_dMaybe.C_Maybe_Nothing -> (B_dData_dResult.C_Result_Err ((String.concat "" ["unknown constructor in wasm codegen: `"; ctor; "`"])))
  | B_dData_dMaybe.C_Maybe_Just (dtb__252) -> (if ((v_listLengthB args) <> dtb__252) then (B_dData_dResult.C_Result_Err ((String.concat "" ["constructor `"; ctor; "` applied to the wrong number of arguments"]))) else (match (((v_genExprs (fuel - 1)) st) args) with
  | B_dData_dResult.C_Result_Err (dtb__253) -> (B_dData_dResult.C_Result_Err (dtb__253))
  | B_dData_dResult.C_Result_Ok (dtb__254) -> ((fun instrs -> (B_dData_dResult.C_Result_Ok ({ B_dData_dPair.f_Pair_first = instrs; B_dData_dPair.f_Pair_second = (B_dData_dPair.v_secondOf dtb__254) }))) ((B_dData_dList.v_append (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IConstI32 (dtb__251)), (B_dData_dPair.v_firstOf dtb__254)))) ((B_dData_dList.v_append (v_refNullN ((dtb__250).Wasm_dTypes.f_WasmFam_wasmFamMaxFields - dtb__252))) (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IStructNew ((Wasm_dTypes.v_watFamName family))), B_dData_dList.C_List_Nil)))))
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))
# 806 "Vuna/Compiler/Wasm/Module.vuna"
and v_genRecord = (fun (fuel : int) (st : t_GenState) (family : string) (fields : (string, Ir_dModel.t_Ir) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (if (fuel <= 0) then (B_dData_dResult.C_Result_Err ("wasm codegen fuel exhausted")) else (match ((v_famOrFail st) family) with
  | B_dData_dResult.C_Result_Err (dtb__255) -> (B_dData_dResult.C_Result_Err (dtb__255))
  | B_dData_dResult.C_Result_Ok (dtb__256) -> (if ((v_listLengthB fields) <> (v_listLengthB (dtb__256).Wasm_dTypes.f_WasmFam_wasmFamRecordFields)) then (B_dData_dResult.C_Result_Err ((String.concat "" ["record `"; family; "` constructed with the wrong number of fields"]))) else (match (((v_genExprs (fuel - 1)) st) ((B_dData_dList.v_map (fun (p : (string, Ir_dModel.t_Ir) B_dData_dPair.t_Pair) -> (B_dData_dPair.v_secondOf p))) fields)) with
  | B_dData_dResult.C_Result_Err (dtb__257) -> (B_dData_dResult.C_Result_Err (dtb__257))
  | B_dData_dResult.C_Result_Ok (dtb__258) -> (B_dData_dResult.C_Result_Ok ({ B_dData_dPair.f_Pair_first = ((B_dData_dList.v_append (B_dData_dPair.v_firstOf dtb__258)) (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IStructNew ((Wasm_dTypes.v_watFamName family))), B_dData_dList.C_List_Nil))); B_dData_dPair.f_Pair_second = (B_dData_dPair.v_secondOf dtb__258) }))
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
)))
# 821 "Vuna/Compiler/Wasm/Module.vuna"
and v_genProj = (fun (fuel : int) (st : t_GenState) (base : Ir_dModel.t_Ir) (family : string) (field : string) -> (if (fuel <= 0) then (B_dData_dResult.C_Result_Err ("wasm codegen fuel exhausted")) else (match ((v_famOrFail st) family) with
  | B_dData_dResult.C_Result_Err (dtb__259) -> (B_dData_dResult.C_Result_Err (dtb__259))
  | B_dData_dResult.C_Result_Ok (dtb__260) -> (match ((Wasm_dTypes.v_wasmRecordFieldIndex dtb__260) field) with
  | B_dData_dMaybe.C_Maybe_Nothing -> (B_dData_dResult.C_Result_Err ((String.concat "" ["unknown record field in wasm codegen: `"; family; "."; field; "`"])))
  | B_dData_dMaybe.C_Maybe_Just (dtb__261) -> (match (((v_genExpr (fuel - 1)) (v_noTail st)) base) with
  | B_dData_dResult.C_Result_Err (dtb__262) -> (B_dData_dResult.C_Result_Err (dtb__262))
  | B_dData_dResult.C_Result_Ok (dtb__263) -> (B_dData_dResult.C_Result_Ok ({ B_dData_dPair.f_Pair_first = ((B_dData_dList.v_append (B_dData_dPair.v_firstOf dtb__263)) (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IRefCast ((Wasm_dTypes.v_watFamName family))), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IStructGet ((Wasm_dTypes.v_watFamName family), dtb__261)), B_dData_dList.C_List_Nil))))); B_dData_dPair.f_Pair_second = ((v_withTail (st).f_GenState_gsTail) (B_dData_dPair.v_secondOf dtb__263)) }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))
# 837 "Vuna/Compiler/Wasm/Module.vuna"
and v_genRecUpd = (fun (fuel : int) (st : t_GenState) (base : Ir_dModel.t_Ir) (family : string) (fields : (string, Ir_dModel.t_Ir) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (if (fuel <= 0) then (B_dData_dResult.C_Result_Err ("wasm codegen fuel exhausted")) else (match ((v_famOrFail st) family) with
  | B_dData_dResult.C_Result_Err (dtb__264) -> (B_dData_dResult.C_Result_Err (dtb__264))
  | B_dData_dResult.C_Result_Ok (dtb__265) -> (match (((v_genExpr (fuel - 1)) (v_noTail st)) base) with
  | B_dData_dResult.C_Result_Err (dtb__266) -> (B_dData_dResult.C_Result_Err (dtb__266))
  | B_dData_dResult.C_Result_Ok (dtb__267) -> (match ((v_freshLocal ((v_withTail (st).f_GenState_gsTail) (B_dData_dPair.v_secondOf dtb__267))) Wasm_dModel.C_WatValTy_WvAnyRef) with
  | { B_dData_dPair.f_Pair_first = dtb__268; B_dData_dPair.f_Pair_second = dtb__269 } -> (match ((((((v_genUpdFields (fuel - 1)) dtb__269) dtb__268) (Wasm_dTypes.v_watFamName family)) (dtb__265).Wasm_dTypes.f_WasmFam_wasmFamRecordFields) fields) with
  | B_dData_dResult.C_Result_Err (dtb__270) -> (B_dData_dResult.C_Result_Err (dtb__270))
  | B_dData_dResult.C_Result_Ok (dtb__271) -> (B_dData_dResult.C_Result_Ok ({ B_dData_dPair.f_Pair_first = ((B_dData_dList.v_append (B_dData_dPair.v_firstOf dtb__267)) ((B_dData_dList.v_append (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ILocalSet (dtb__268)), B_dData_dList.C_List_Nil))) ((B_dData_dList.v_append (B_dData_dPair.v_firstOf dtb__271)) (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IStructNew ((Wasm_dTypes.v_watFamName family))), B_dData_dList.C_List_Nil))))); B_dData_dPair.f_Pair_second = (B_dData_dPair.v_secondOf dtb__271) }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))
# 854 "Vuna/Compiler/Wasm/Module.vuna"
and v_genUpdFields = (fun (mc0 : int) (mc1 : t_GenState) (mc2 : string) (mc3 : string) (mc4 : (int, string) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc5 : (string, Ir_dModel.t_Ir) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc4 with
  | B_dData_dList.C_List__x58__x58_ (dtb__272, dtb__273) -> (match dtb__272 with
  | { B_dData_dPair.f_Pair_first = dtb__274; B_dData_dPair.f_Pair_second = dtb__275 } -> (if (mc0 <= 0) then (B_dData_dResult.C_Result_Err ("wasm codegen fuel exhausted")) else (match ((v_lookupFieldIr dtb__275) mc5) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__276) -> (match (((v_genExpr (mc0 - 1)) (v_noTail mc1)) dtb__276) with
  | B_dData_dResult.C_Result_Err (dtb__277) -> (B_dData_dResult.C_Result_Err (dtb__277))
  | B_dData_dResult.C_Result_Ok (dtb__278) -> (match ((((((v_genUpdFields (mc0 - 1)) ((v_withTail (mc1).f_GenState_gsTail) (B_dData_dPair.v_secondOf dtb__278))) mc2) mc3) dtb__273) mc5) with
  | B_dData_dResult.C_Result_Err (dtb__279) -> (B_dData_dResult.C_Result_Err (dtb__279))
  | B_dData_dResult.C_Result_Ok (dtb__280) -> (B_dData_dResult.C_Result_Ok ({ B_dData_dPair.f_Pair_first = ((B_dData_dList.v_append (B_dData_dPair.v_firstOf dtb__278)) (B_dData_dPair.v_firstOf dtb__280)); B_dData_dPair.f_Pair_second = (B_dData_dPair.v_secondOf dtb__280) }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> (match ((((((v_genUpdFields (mc0 - 1)) mc1) mc2) mc3) dtb__273) mc5) with
  | B_dData_dResult.C_Result_Err (dtb__281) -> (B_dData_dResult.C_Result_Err (dtb__281))
  | B_dData_dResult.C_Result_Ok (dtb__282) -> (B_dData_dResult.C_Result_Ok ({ B_dData_dPair.f_Pair_first = ((B_dData_dList.v_append (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ILocalGet (mc2)), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IRefCast (mc3)), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IStructGet (mc3, dtb__274)), B_dData_dList.C_List_Nil))))))) (B_dData_dPair.v_firstOf dtb__282)); B_dData_dPair.f_Pair_second = (B_dData_dPair.v_secondOf dtb__282) }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (B_dData_dResult.C_Result_Ok ({ B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = mc1 }))
  | _ -> failwith "DT: impossible branch"
))
# 880 "Vuna/Compiler/Wasm/Module.vuna"
and v_genCase = (fun (fuel : int) (st : t_GenState) (caseTy : Ir_dModel.t_IrTy B_dData_dMaybe.t_Maybe) (scrut : Ir_dModel.t_Ir) (alts : Ir_dModel.t_IrAlt B_dData_dList.t_List) -> (if (fuel <= 0) then (B_dData_dResult.C_Result_Err ("wasm codegen fuel exhausted")) else (match (((v_genExpr (fuel - 1)) (v_noTail st)) scrut) with
  | B_dData_dResult.C_Result_Err (dtb__283) -> (B_dData_dResult.C_Result_Err (dtb__283))
  | B_dData_dResult.C_Result_Ok (dtb__284) -> ((fun st1 -> (match ((v_caseFamilyOf caseTy) alts) with
  | B_dData_dMaybe.C_Maybe_Nothing -> ((v_prepend (v_scrutInstrs dtb__284)) ((v_restoreTail st) ((((v_genCatchAllOnly (fuel - 1)) st1) v_scrutSlot) alts)))
  | B_dData_dMaybe.C_Maybe_Just (dtb__285) -> (match ((v_famOrFail st1) dtb__285) with
  | B_dData_dResult.C_Result_Err (dtb__286) -> (B_dData_dResult.C_Result_Err (dtb__286))
  | B_dData_dResult.C_Result_Ok (dtb__287) -> (match (dtb__287).Wasm_dTypes.f_WasmFam_wasmFamKind with
  | Wasm_dTypes.C_WasmFamKind_FamRecord -> ((v_prepend (v_scrutInstrs dtb__284)) ((v_restoreTail st) ((((((v_genRecordCase (fuel - 1)) st1) v_scrutSlot) dtb__285) dtb__287) alts)))
  | _ -> ((v_prepend (v_scrutInstrs dtb__284)) ((v_restoreTail st) ((((((v_genVariantCase (fuel - 1)) st1) v_scrutSlot) dtb__285) dtb__287) alts)))
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) (((v_ensureLocal v_scrutSlot) Wasm_dModel.C_WatValTy_WvAnyRef) ((v_withTail (st).f_GenState_gsTail) (B_dData_dPair.v_secondOf dtb__284))))
  | _ -> failwith "DT: impossible branch"
)))
# 938 "Vuna/Compiler/Wasm/Module.vuna"
and v_genCatchAllOnly = (fun (fuel : int) (st : t_GenState) (scLocal : string) (alts : Ir_dModel.t_IrAlt B_dData_dList.t_List) -> (if (fuel <= 0) then (B_dData_dResult.C_Result_Err ("wasm codegen fuel exhausted")) else (match alts with
  | B_dData_dList.C_List_Nil -> (B_dData_dResult.C_Result_Ok ({ B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ (Wasm_dInstr.C_Instr_IUnreachable, B_dData_dList.C_List_Nil)); B_dData_dPair.f_Pair_second = st }))
  | B_dData_dList.C_List__x58__x58_ (dtb__288, dtb__289) -> (match (((v_bindScrutBinder (Ir_dModel.v_irAltBindersOf dtb__288)) scLocal) st) with
  | B_dData_dResult.C_Result_Err (dtb__290) -> (B_dData_dResult.C_Result_Err (dtb__290))
  | B_dData_dResult.C_Result_Ok (dtb__291) -> (match (((v_genExpr (fuel - 1)) (B_dData_dPair.v_secondOf dtb__291)) (Ir_dModel.v_irAltBodyOf dtb__288)) with
  | B_dData_dResult.C_Result_Err (dtb__292) -> (B_dData_dResult.C_Result_Err (dtb__292))
  | B_dData_dResult.C_Result_Ok (dtb__293) -> (B_dData_dResult.C_Result_Ok ({ B_dData_dPair.f_Pair_first = ((B_dData_dList.v_append (B_dData_dPair.v_firstOf dtb__291)) (B_dData_dPair.v_firstOf dtb__293)); B_dData_dPair.f_Pair_second = (B_dData_dPair.v_secondOf dtb__293) }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))
# 962 "Vuna/Compiler/Wasm/Module.vuna"
and v_genVariantCase = (fun (fuel : int) (st : t_GenState) (scLocal : string) (family : string) (fam : Wasm_dTypes.t_WasmFam) (alts : Ir_dModel.t_IrAlt B_dData_dList.t_List) -> (if (fuel <= 0) then (B_dData_dResult.C_Result_Err ("wasm codegen fuel exhausted")) else (match alts with
  | B_dData_dList.C_List_Nil -> (B_dData_dResult.C_Result_Ok ({ B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ (Wasm_dInstr.C_Instr_IUnreachable, B_dData_dList.C_List_Nil)); B_dData_dPair.f_Pair_second = st }))
  | B_dData_dList.C_List__x58__x58_ (dtb__294, dtb__295) -> ((fun nd_uscrut9 -> (match nd_uscrut9 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__296) -> (match dtb__296 with
  | { B_dData_dPair.f_Pair_first = dtb__297; B_dData_dPair.f_Pair_second = dtb__298 } -> (match ((Wasm_dTypes.v_wasmCtorTagOf fam) dtb__298) with
  | B_dData_dMaybe.C_Maybe_Nothing -> (B_dData_dResult.C_Result_Err ((String.concat "" ["unknown constructor in wasm codegen: `"; dtb__298; "`"])))
  | B_dData_dMaybe.C_Maybe_Just (dtb__299) -> (match ((((((v_genAltBody (fuel - 1)) st) scLocal) family) fam) dtb__294) with
  | B_dData_dResult.C_Result_Err (dtb__300) -> (B_dData_dResult.C_Result_Err (dtb__300))
  | B_dData_dResult.C_Result_Ok (dtb__301) -> (match ((((((v_genVariantCase (fuel - 1)) ((v_withTail (st).f_GenState_gsTail) (B_dData_dPair.v_secondOf dtb__301))) scLocal) family) fam) dtb__295) with
  | B_dData_dResult.C_Result_Err (dtb__302) -> (B_dData_dResult.C_Result_Err (dtb__302))
  | B_dData_dResult.C_Result_Ok (dtb__303) -> (B_dData_dResult.C_Result_Ok ({ B_dData_dPair.f_Pair_first = ((B_dData_dList.v_append (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ILocalGet (scLocal)), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IRefCast ((Wasm_dTypes.v_watFamName family))), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IStructGet ((Wasm_dTypes.v_watFamName family), 0)), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IConstI32 (dtb__299)), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IBinop ("i32.eq")), B_dData_dList.C_List_Nil))))))))))) (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IIf ("anyref", (B_dData_dPair.v_firstOf dtb__301), (B_dData_dPair.v_firstOf dtb__303))), B_dData_dList.C_List_Nil))); B_dData_dPair.f_Pair_second = (B_dData_dPair.v_secondOf dtb__303) }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> (match ((((((v_genAltBody (fuel - 1)) st) scLocal) family) fam) dtb__294) with
  | B_dData_dResult.C_Result_Err (dtb__304) -> (B_dData_dResult.C_Result_Err (dtb__304))
  | B_dData_dResult.C_Result_Ok (dtb__305) -> (B_dData_dResult.C_Result_Ok ({ B_dData_dPair.f_Pair_first = (B_dData_dPair.v_firstOf dtb__305); B_dData_dPair.f_Pair_second = (B_dData_dPair.v_secondOf dtb__305) }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) (Ir_dModel.v_irAltCtorOf dtb__294))
  | _ -> failwith "DT: impossible branch"
)))
# 987 "Vuna/Compiler/Wasm/Module.vuna"
and v_genAltBody = (fun (fuel : int) (st : t_GenState) (scLocal : string) (family : string) (fam : Wasm_dTypes.t_WasmFam) (alt : Ir_dModel.t_IrAlt) -> (if (fuel <= 0) then (B_dData_dResult.C_Result_Err ("wasm codegen fuel exhausted")) else (match (Ir_dModel.v_irAltCtorOf alt) with
  | B_dData_dMaybe.C_Maybe_Nothing -> ((((v_genCatchAllOnly (fuel - 1)) st) scLocal) (B_dData_dList.C_List__x58__x58_ (alt, B_dData_dList.C_List_Nil)))
  | B_dData_dMaybe.C_Maybe_Just (dtb__306) -> (match ((((((v_bindFields (fuel - 1)) st) scLocal) (Wasm_dTypes.v_watFamName family)) (v_runtimeBinders (Ir_dModel.v_irAltBindersOf alt))) 1) with
  | B_dData_dResult.C_Result_Err (dtb__307) -> (B_dData_dResult.C_Result_Err (dtb__307))
  | B_dData_dResult.C_Result_Ok (dtb__308) -> (match (((v_genExpr (fuel - 1)) (B_dData_dPair.v_secondOf dtb__308)) (Ir_dModel.v_irAltBodyOf alt)) with
  | B_dData_dResult.C_Result_Err (dtb__309) -> (B_dData_dResult.C_Result_Err (dtb__309))
  | B_dData_dResult.C_Result_Ok (dtb__310) -> (B_dData_dResult.C_Result_Ok ({ B_dData_dPair.f_Pair_first = ((B_dData_dList.v_append (B_dData_dPair.v_firstOf dtb__308)) (B_dData_dPair.v_firstOf dtb__310)); B_dData_dPair.f_Pair_second = (B_dData_dPair.v_secondOf dtb__310) }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))
# 1014 "Vuna/Compiler/Wasm/Module.vuna"
and v_genRecordCase = (fun (fuel : int) (st : t_GenState) (scLocal : string) (family : string) (fam : Wasm_dTypes.t_WasmFam) (alts : Ir_dModel.t_IrAlt B_dData_dList.t_List) -> (if (fuel <= 0) then (B_dData_dResult.C_Result_Err ("wasm codegen fuel exhausted")) else (match alts with
  | B_dData_dList.C_List_Nil -> (B_dData_dResult.C_Result_Ok ({ B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ (Wasm_dInstr.C_Instr_IUnreachable, B_dData_dList.C_List_Nil)); B_dData_dPair.f_Pair_second = st }))
  | B_dData_dList.C_List__x58__x58_ (dtb__311, dtb__312) -> (match (Ir_dModel.v_irAltCtorOf dtb__311) with
  | B_dData_dMaybe.C_Maybe_Nothing -> ((((v_genCatchAllOnly (fuel - 1)) st) scLocal) (B_dData_dList.C_List__x58__x58_ (dtb__311, dtb__312)))
  | B_dData_dMaybe.C_Maybe_Just (dtb__313) -> (match ((((((v_bindFields (fuel - 1)) st) scLocal) (Wasm_dTypes.v_watFamName family)) (v_runtimeBinders (Ir_dModel.v_irAltBindersOf dtb__311))) 0) with
  | B_dData_dResult.C_Result_Err (dtb__314) -> (B_dData_dResult.C_Result_Err (dtb__314))
  | B_dData_dResult.C_Result_Ok (dtb__315) -> (match (((v_genExpr (fuel - 1)) (B_dData_dPair.v_secondOf dtb__315)) (Ir_dModel.v_irAltBodyOf dtb__311)) with
  | B_dData_dResult.C_Result_Err (dtb__316) -> (B_dData_dResult.C_Result_Err (dtb__316))
  | B_dData_dResult.C_Result_Ok (dtb__317) -> (B_dData_dResult.C_Result_Ok ({ B_dData_dPair.f_Pair_first = ((B_dData_dList.v_append (B_dData_dPair.v_firstOf dtb__315)) (B_dData_dPair.v_firstOf dtb__317)); B_dData_dPair.f_Pair_second = (B_dData_dPair.v_secondOf dtb__317) }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))

# 1038 "Vuna/Compiler/Wasm/Module.vuna"
let v_cmpTrapFunc = (fun (c : Wasm_dRuntime.t_RtConsts) -> { Wasm_dModel.f_WatFunc_watFuncName = "$rt_cmpTrap"; Wasm_dModel.f_WatFunc_watFuncType = ""; Wasm_dModel.f_WatFunc_watFuncParams = (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = "$a"; B_dData_dPair.f_Pair_second = Wasm_dModel.C_WatValTy_WvAnyRef }, (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = "$b"; B_dData_dPair.f_Pair_second = Wasm_dModel.C_WatValTy_WvAnyRef }, B_dData_dList.C_List_Nil)))); Wasm_dModel.f_WatFunc_watFuncResults = (B_dData_dList.C_List__x58__x58_ (Wasm_dModel.C_WatValTy_WvI32, B_dData_dList.C_List_Nil)); Wasm_dModel.f_WatFunc_watFuncLocals = B_dData_dList.C_List_Nil; Wasm_dModel.f_WatFunc_watFuncBody = ((Wasm_dRuntime.v_failWithConst (c).Wasm_dRuntime.f_RtConsts_rtcHostOff) (c).Wasm_dRuntime.f_RtConsts_rtcHostLen) })

# 1048 "Vuna/Compiler/Wasm/Module.vuna"
let v_cmpStrFunc = ((fun params -> ((fun locals -> ((fun body -> { Wasm_dModel.f_WatFunc_watFuncName = "$rt_cmpStr"; Wasm_dModel.f_WatFunc_watFuncType = ""; Wasm_dModel.f_WatFunc_watFuncParams = params; Wasm_dModel.f_WatFunc_watFuncResults = (B_dData_dList.C_List__x58__x58_ (Wasm_dModel.C_WatValTy_WvI32, B_dData_dList.C_List_Nil)); Wasm_dModel.f_WatFunc_watFuncLocals = locals; Wasm_dModel.f_WatFunc_watFuncBody = body }) (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ILocalGet ("$a")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IRefCast ("$str")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ILocalSet ("$sa")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ILocalGet ("$b")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IRefCast ("$str")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ILocalSet ("$sb")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ILocalGet ("$sa")), (B_dData_dList.C_List__x58__x58_ (Wasm_dInstr.C_Instr_IArrayLen, (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ILocalSet ("$na")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ILocalGet ("$sb")), (B_dData_dList.C_List__x58__x58_ (Wasm_dInstr.C_Instr_IArrayLen, (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ILocalSet ("$nb")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IConstI32 (0)), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ILocalSet ("$i")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IConstI32 (0)), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ILocalSet ("$r")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IBlock ("$s_done", "", (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ILoop ("$s_l", "", (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ILocalGet ("$i")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ILocalGet ("$na")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IBinop ("i32.ge_s")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IBrIf ("$s_done")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ILocalGet ("$i")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ILocalGet ("$nb")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IBinop ("i32.ge_s")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IBrIf ("$s_done")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ILocalGet ("$sa")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ILocalGet ("$i")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IArrayGetU ("$str")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ILocalSet ("$ca")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ILocalGet ("$sb")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ILocalGet ("$i")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IArrayGetU ("$str")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ILocalSet ("$cb")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ILocalGet ("$ca")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ILocalGet ("$cb")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IBinop ("i32.ne")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IIf ("", (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ILocalGet ("$ca")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ILocalGet ("$cb")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IBinop ("i32.lt_u")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IIf ("i32", (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IConstI32 ((0 - 1))), B_dData_dList.C_List_Nil)), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IConstI32 (1)), B_dData_dList.C_List_Nil)))), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ILocalSet ("$r")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IBr ("$s_done")), B_dData_dList.C_List_Nil)))))))))))), (B_dData_dList.C_List__x58__x58_ (Wasm_dInstr.C_Instr_INop, B_dData_dList.C_List_Nil)))), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ILocalGet ("$i")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IConstI32 (1)), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IBinop ("i32.add")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ILocalSet ("$i")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IBr ("$s_l")), B_dData_dList.C_List_Nil)))))))))))))))))))))))))))))))))))))))))))))))))))), B_dData_dList.C_List_Nil)))), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ILocalGet ("$r")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IConstI32 (0)), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IBinop ("i32.ne")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IIf ("i32", (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ILocalGet ("$r")), B_dData_dList.C_List_Nil)), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ILocalGet ("$na")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ILocalGet ("$nb")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ICall ("$rt_cmpI32")), B_dData_dList.C_List_Nil)))))))), B_dData_dList.C_List_Nil)))))))))))))))))))))))))))))))))))))))))))) (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = "$sa"; B_dData_dPair.f_Pair_second = (Wasm_dModel.C_WatValTy_WvRef ("$str")) }, (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = "$sb"; B_dData_dPair.f_Pair_second = (Wasm_dModel.C_WatValTy_WvRef ("$str")) }, (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = "$na"; B_dData_dPair.f_Pair_second = Wasm_dModel.C_WatValTy_WvI32 }, (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = "$nb"; B_dData_dPair.f_Pair_second = Wasm_dModel.C_WatValTy_WvI32 }, (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = "$i"; B_dData_dPair.f_Pair_second = Wasm_dModel.C_WatValTy_WvI32 }, (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = "$ca"; B_dData_dPair.f_Pair_second = Wasm_dModel.C_WatValTy_WvI32 }, (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = "$cb"; B_dData_dPair.f_Pair_second = Wasm_dModel.C_WatValTy_WvI32 }, (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = "$r"; B_dData_dPair.f_Pair_second = Wasm_dModel.C_WatValTy_WvI32 }, B_dData_dList.C_List_Nil)))))))))))))))))) (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = "$a"; B_dData_dPair.f_Pair_second = Wasm_dModel.C_WatValTy_WvAnyRef }, (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = "$b"; B_dData_dPair.f_Pair_second = Wasm_dModel.C_WatValTy_WvAnyRef }, B_dData_dList.C_List_Nil)))))

# 1092 "Vuna/Compiler/Wasm/Module.vuna"
let v_cmpArrFunc = ((fun params -> ((fun locals -> ((fun body -> { Wasm_dModel.f_WatFunc_watFuncName = "$rt_cmpArr"; Wasm_dModel.f_WatFunc_watFuncType = ""; Wasm_dModel.f_WatFunc_watFuncParams = params; Wasm_dModel.f_WatFunc_watFuncResults = (B_dData_dList.C_List__x58__x58_ (Wasm_dModel.C_WatValTy_WvI32, B_dData_dList.C_List_Nil)); Wasm_dModel.f_WatFunc_watFuncLocals = locals; Wasm_dModel.f_WatFunc_watFuncBody = body }) (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ILocalGet ("$a")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IRefCast ("$arr")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ILocalSet ("$sa")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ILocalGet ("$b")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IRefCast ("$arr")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ILocalSet ("$sb")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ILocalGet ("$sa")), (B_dData_dList.C_List__x58__x58_ (Wasm_dInstr.C_Instr_IArrayLen, (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ILocalSet ("$na")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ILocalGet ("$sb")), (B_dData_dList.C_List__x58__x58_ (Wasm_dInstr.C_Instr_IArrayLen, (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ILocalSet ("$nb")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IConstI32 (0)), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ILocalSet ("$i")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IConstI32 (0)), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ILocalSet ("$r")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IBlock ("$a_done", "", (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ILoop ("$a_l", "", (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ILocalGet ("$i")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ILocalGet ("$na")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IBinop ("i32.ge_s")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IBrIf ("$a_done")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ILocalGet ("$i")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ILocalGet ("$nb")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IBinop ("i32.ge_s")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IBrIf ("$a_done")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ILocalGet ("$sa")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ILocalGet ("$i")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IArrayGet ("$arr")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ILocalGet ("$sb")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ILocalGet ("$i")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IArrayGet ("$arr")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ICall ("$rt_compare")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ILocalTee ("$r")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IConstI32 (0)), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IBinop ("i32.ne")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IIf ("", (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IBr ("$a_done")), B_dData_dList.C_List_Nil)), B_dData_dList.C_List_Nil)), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ILocalGet ("$i")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IConstI32 (1)), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IBinop ("i32.add")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ILocalSet ("$i")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IBr ("$a_l")), B_dData_dList.C_List_Nil)))))))))))))))))))))))))))))))))))))))))))))))))), B_dData_dList.C_List_Nil)))), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ILocalGet ("$r")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IConstI32 (0)), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IBinop ("i32.ne")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IIf ("i32", (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ILocalGet ("$r")), B_dData_dList.C_List_Nil)), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ILocalGet ("$na")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ILocalGet ("$nb")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ICall ("$rt_cmpI32")), B_dData_dList.C_List_Nil)))))))), B_dData_dList.C_List_Nil)))))))))))))))))))))))))))))))))))))))))))) (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = "$sa"; B_dData_dPair.f_Pair_second = (Wasm_dModel.C_WatValTy_WvRef ("$arr")) }, (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = "$sb"; B_dData_dPair.f_Pair_second = (Wasm_dModel.C_WatValTy_WvRef ("$arr")) }, (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = "$na"; B_dData_dPair.f_Pair_second = Wasm_dModel.C_WatValTy_WvI32 }, (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = "$nb"; B_dData_dPair.f_Pair_second = Wasm_dModel.C_WatValTy_WvI32 }, (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = "$i"; B_dData_dPair.f_Pair_second = Wasm_dModel.C_WatValTy_WvI32 }, (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = "$r"; B_dData_dPair.f_Pair_second = Wasm_dModel.C_WatValTy_WvI32 }, B_dData_dList.C_List_Nil)))))))))))))) (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = "$a"; B_dData_dPair.f_Pair_second = Wasm_dModel.C_WatValTy_WvAnyRef }, (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = "$b"; B_dData_dPair.f_Pair_second = Wasm_dModel.C_WatValTy_WvAnyRef }, B_dData_dList.C_List_Nil)))))

# 1135 "Vuna/Compiler/Wasm/Module.vuna"
let rec v_cmpFields = (fun (mc0 : string) (mc1 : int B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__318, dtb__319) -> (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ILocalGet ("$a")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IRefCast (mc0)), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IStructGet (mc0, dtb__318)), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ILocalGet ("$b")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IRefCast (mc0)), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IStructGet (mc0, dtb__318)), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ICall ("$rt_compare")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ILocalTee ("$c")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IIf ("i32", (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ILocalGet ("$c")), B_dData_dList.C_List_Nil)), ((v_cmpFields mc0) dtb__319))), B_dData_dList.C_List_Nil))))))))))))))))))
  | B_dData_dList.C_List_Nil -> (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IConstI32 (0)), B_dData_dList.C_List_Nil))
  | _ -> failwith "DT: impossible branch"
))

# 1150 "Vuna/Compiler/Wasm/Module.vuna"
let v_cmpFamBody = (fun (fam : Wasm_dTypes.t_WasmFam) -> ((fun ty -> (match (fam).Wasm_dTypes.f_WasmFam_wasmFamKind with
  | Wasm_dTypes.C_WasmFamKind_FamVariant -> (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ILocalGet ("$a")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IRefCast (ty)), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IStructGet (ty, 0)), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ILocalGet ("$b")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IRefCast (ty)), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IStructGet (ty, 0)), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ICall ("$rt_cmpI32")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ILocalTee ("$c")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IIf ("i32", (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ILocalGet ("$c")), B_dData_dList.C_List_Nil)), ((v_cmpFields ty) ((B_dData_dList.v_range 1) ((fam).Wasm_dTypes.f_WasmFam_wasmFamMaxFields + 1))))), B_dData_dList.C_List_Nil))))))))))))))))))
  | Wasm_dTypes.C_WasmFamKind_FamRecord -> ((v_cmpFields ty) ((B_dData_dList.v_range 0) (B_dData_dList.v_length (fam).Wasm_dTypes.f_WasmFam_wasmFamRecordFields)))
  | Wasm_dTypes.C_WasmFamKind_FamUnboxed -> (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IConstI32 (0)), B_dData_dList.C_List_Nil))
  | _ -> failwith "DT: impossible branch"
)) (Wasm_dTypes.v_watFamName (fam).Wasm_dTypes.f_WasmFam_wasmFamName)))

# 1170 "Vuna/Compiler/Wasm/Module.vuna"
let v_cmpFamFlat = (fun (fam : Wasm_dTypes.t_WasmFam) -> ((fun ty -> (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ILocalGet ("$a")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IRefTest (ty)), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IIf ("", (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ILocalGet ("$b")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IRefTest (ty)), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IIf ("", ((B_dData_dList.v_append (v_cmpFamBody fam)) (B_dData_dList.C_List__x58__x58_ (Wasm_dInstr.C_Instr_IReturn, B_dData_dList.C_List_Nil))), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IConstI32 (1)), (B_dData_dList.C_List__x58__x58_ (Wasm_dInstr.C_Instr_IReturn, B_dData_dList.C_List_Nil)))))), B_dData_dList.C_List_Nil)))))), (B_dData_dList.C_List__x58__x58_ (Wasm_dInstr.C_Instr_INop, B_dData_dList.C_List_Nil)))), B_dData_dList.C_List_Nil))))))) (Wasm_dTypes.v_watFamName (fam).Wasm_dTypes.f_WasmFam_wasmFamName)))

# 1183 "Vuna/Compiler/Wasm/Module.vuna"
let v_cmpPrimFlat = (fun (ty : string) (body : Wasm_dInstr.t_Instr B_dData_dList.t_List) -> (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ILocalGet ("$a")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IRefTest (ty)), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IIf ("", ((B_dData_dList.v_append body) (B_dData_dList.C_List__x58__x58_ (Wasm_dInstr.C_Instr_IReturn, B_dData_dList.C_List_Nil))), (B_dData_dList.C_List__x58__x58_ (Wasm_dInstr.C_Instr_INop, B_dData_dList.C_List_Nil)))), B_dData_dList.C_List_Nil)))))))

# 1186 "Vuna/Compiler/Wasm/Module.vuna"
let v_isConcreteFam = (fun (f : Wasm_dTypes.t_WasmFam) -> (match (f).Wasm_dTypes.f_WasmFam_wasmFamKind with
  | Wasm_dTypes.C_WasmFamKind_FamUnboxed -> false
  | _ -> true
))

# 1192 "Vuna/Compiler/Wasm/Module.vuna"
let v_cmpDispatch = (fun (fams : Wasm_dTypes.t_WasmFam B_dData_dList.t_List) -> ((fun concrete -> ((fun i31B -> ((fun intB -> ((fun floatB -> ((fun strB -> ((fun arrB -> ((fun famB -> ((B_dData_dList.v_append i31B) ((B_dData_dList.v_append intB) ((B_dData_dList.v_append floatB) ((B_dData_dList.v_append strB) ((B_dData_dList.v_append arrB) ((B_dData_dList.v_append famB) (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ILocalGet ("$a")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ILocalGet ("$b")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ICall ("$rt_cmpTrap")), B_dData_dList.C_List_Nil))))))))))))) ((B_dData_dList.v_concatMap v_cmpFamFlat) concrete))) ((v_cmpPrimFlat "$arr") (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ILocalGet ("$a")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ILocalGet ("$b")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ICall ("$rt_cmpArr")), B_dData_dList.C_List_Nil))))))))) ((v_cmpPrimFlat "$str") (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ILocalGet ("$a")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ILocalGet ("$b")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ICall ("$rt_cmpStr")), B_dData_dList.C_List_Nil))))))))) ((v_cmpPrimFlat "$float") (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ILocalGet ("$a")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IRefCast ("$float")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IStructGet ("$float", 0)), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ILocalGet ("$b")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IRefCast ("$float")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IStructGet ("$float", 0)), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ICall ("$rt_cmpF64")), B_dData_dList.C_List_Nil))))))))))))))))) ((v_cmpPrimFlat "$int") (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ILocalGet ("$a")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IRefCast ("$int")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IStructGet ("$int", 0)), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ILocalGet ("$b")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IRefCast ("$int")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IStructGet ("$int", 0)), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ICall ("$rt_cmpI64")), B_dData_dList.C_List_Nil))))))))))))))))) ((v_cmpPrimFlat "i31") (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ILocalGet ("$a")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IRefCast ("i31")), (B_dData_dList.C_List__x58__x58_ (Wasm_dInstr.C_Instr_II31GetS, (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ILocalGet ("$b")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IRefCast ("i31")), (B_dData_dList.C_List__x58__x58_ (Wasm_dInstr.C_Instr_II31GetS, (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ICall ("$rt_cmpI32")), B_dData_dList.C_List_Nil))))))))))))))))) ((B_dData_dList.v_filter v_isConcreteFam) fams)))

# 1215 "Vuna/Compiler/Wasm/Module.vuna"
let v_rtCompareFunc = (fun (fams : Wasm_dTypes.t_WasmFam B_dData_dList.t_List) -> ((fun params -> ((fun locals -> ((fun body -> { Wasm_dModel.f_WatFunc_watFuncName = "$rt_compare"; Wasm_dModel.f_WatFunc_watFuncType = ""; Wasm_dModel.f_WatFunc_watFuncParams = params; Wasm_dModel.f_WatFunc_watFuncResults = (B_dData_dList.C_List__x58__x58_ (Wasm_dModel.C_WatValTy_WvI32, B_dData_dList.C_List_Nil)); Wasm_dModel.f_WatFunc_watFuncLocals = locals; Wasm_dModel.f_WatFunc_watFuncBody = body }) (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ILocalGet ("$a")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IPlain ("ref.is_null")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IIf ("i32", (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ILocalGet ("$b")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IPlain ("ref.is_null")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IIf ("i32", (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IConstI32 (0)), B_dData_dList.C_List_Nil)), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IConstI32 ((0 - 1))), B_dData_dList.C_List_Nil)))), B_dData_dList.C_List_Nil)))))), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ILocalGet ("$b")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IPlain ("ref.is_null")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IIf ("i32", (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IConstI32 (1)), B_dData_dList.C_List_Nil)), (v_cmpDispatch fams))), B_dData_dList.C_List_Nil)))))))), B_dData_dList.C_List_Nil)))))))) (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = "$c"; B_dData_dPair.f_Pair_second = Wasm_dModel.C_WatValTy_WvI32 }, B_dData_dList.C_List_Nil)))) (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = "$a"; B_dData_dPair.f_Pair_second = Wasm_dModel.C_WatValTy_WvAnyRef }, (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = "$b"; B_dData_dPair.f_Pair_second = Wasm_dModel.C_WatValTy_WvAnyRef }, B_dData_dList.C_List_Nil))))))

# 1231 "Vuna/Compiler/Wasm/Module.vuna"
let v_wasmCompareFuncs = (fun (c : Wasm_dRuntime.t_RtConsts) (fams : Wasm_dTypes.t_WasmFam B_dData_dList.t_List) -> (B_dData_dList.C_List__x58__x58_ ((v_cmpTrapFunc c), (B_dData_dList.C_List__x58__x58_ (v_cmpStrFunc, (B_dData_dList.C_List__x58__x58_ (v_cmpArrFunc, (B_dData_dList.C_List__x58__x58_ ((v_rtCompareFunc fams), B_dData_dList.C_List_Nil)))))))))

# 1237 "Vuna/Compiler/Wasm/Module.vuna"
let v_catI = (fun (xs : Wasm_dInstr.t_Instr B_dData_dList.t_List B_dData_dList.t_List) -> ((B_dData_dList.v_concatMap (fun (x : Wasm_dInstr.t_Instr B_dData_dList.t_List) -> x)) xs))

# 1240 "Vuna/Compiler/Wasm/Module.vuna"
let rec v_refNulls = (fun (n : int) -> (if (n <= 0) then B_dData_dList.C_List_Nil else (B_dData_dList.C_List__x58__x58_ (Wasm_dInstr.C_Instr_IRefNull, (v_refNulls (n - 1))))))

# 1243 "Vuna/Compiler/Wasm/Module.vuna"
let v_wasmListTy = (fun (lf : Wasm_dTypes.t_WasmListFam) -> (Wasm_dTypes.v_watFamName (lf).Wasm_dTypes.f_WasmListFam_wasmListFamily))

# 1246 "Vuna/Compiler/Wasm/Module.vuna"
let v_wasmNilCell = (fun (lf : Wasm_dTypes.t_WasmListFam) -> ((B_dData_dList.v_append (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IConstI32 ((lf).Wasm_dTypes.f_WasmListFam_wasmListNilTag)), B_dData_dList.C_List_Nil))) ((B_dData_dList.v_append (v_refNulls (lf).Wasm_dTypes.f_WasmListFam_wasmListConsFields)) (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IStructNew ((v_wasmListTy lf))), B_dData_dList.C_List_Nil)))))

# 1267 "Vuna/Compiler/Wasm/Module.vuna"
let v_rtStrUnpackF = (fun (lf : Wasm_dTypes.t_WasmListFam) -> ((fun ty -> ((fun params -> ((fun locals -> ((fun body -> { Wasm_dModel.f_WatFunc_watFuncName = "$rt_strUnpack"; Wasm_dModel.f_WatFunc_watFuncType = ""; Wasm_dModel.f_WatFunc_watFuncParams = params; Wasm_dModel.f_WatFunc_watFuncResults = (B_dData_dList.C_List__x58__x58_ (Wasm_dModel.C_WatValTy_WvAnyRef, B_dData_dList.C_List_Nil)); Wasm_dModel.f_WatFunc_watFuncLocals = locals; Wasm_dModel.f_WatFunc_watFuncBody = body }) (v_catI (B_dData_dList.C_List__x58__x58_ ((B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ILocalGet ("$p0")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IRefCast ("$str")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ILocalSet ("$s")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ILocalGet ("$s")), (B_dData_dList.C_List__x58__x58_ (Wasm_dInstr.C_Instr_IArrayLen, (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ILocalSet ("$n")), B_dData_dList.C_List_Nil)))))))))))), (B_dData_dList.C_List__x58__x58_ ((v_wasmNilCell lf), (B_dData_dList.C_List__x58__x58_ ((B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ILocalSet ("$acc")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ILocalGet ("$n")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ILocalSet ("$i")), B_dData_dList.C_List_Nil)))))), (B_dData_dList.C_List__x58__x58_ ((B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IBlock ("$u_done", "", (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ILoop ("$u_l", "", (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ILocalGet ("$i")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IPlain ("i32.eqz")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IBrIf ("$u_done")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ILocalGet ("$i")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IConstI32 (1)), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IBinop ("i32.sub")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ILocalSet ("$i")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ILocalGet ("$s")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ILocalGet ("$i")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IArrayGetU ("$str")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ILocalSet ("$b")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IConstI32 ((lf).Wasm_dTypes.f_WasmListFam_wasmListConsTag)), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ILocalGet ("$b")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IPlain ("i64.extend_i32_u")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IStructNew ("$int")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ILocalGet ("$acc")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IStructNew (ty)), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ILocalSet ("$acc")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IBr ("$u_l")), B_dData_dList.C_List_Nil)))))))))))))))))))))))))))))))))))))))), B_dData_dList.C_List_Nil)))), B_dData_dList.C_List_Nil)), (B_dData_dList.C_List__x58__x58_ ((B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ILocalGet ("$acc")), B_dData_dList.C_List_Nil)), B_dData_dList.C_List_Nil))))))))))))) (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = "$s"; B_dData_dPair.f_Pair_second = (Wasm_dModel.C_WatValTy_WvRef ("$str")) }, (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = "$n"; B_dData_dPair.f_Pair_second = Wasm_dModel.C_WatValTy_WvI32 }, (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = "$i"; B_dData_dPair.f_Pair_second = Wasm_dModel.C_WatValTy_WvI32 }, (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = "$acc"; B_dData_dPair.f_Pair_second = Wasm_dModel.C_WatValTy_WvAnyRef }, (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = "$b"; B_dData_dPair.f_Pair_second = Wasm_dModel.C_WatValTy_WvI32 }, B_dData_dList.C_List_Nil)))))))))))) (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = "$p0"; B_dData_dPair.f_Pair_second = Wasm_dModel.C_WatValTy_WvAnyRef }, B_dData_dList.C_List_Nil)))) (v_wasmListTy lf)))

# 1285 "Vuna/Compiler/Wasm/Module.vuna"
let v_rtStrPackF = (fun (lf : Wasm_dTypes.t_WasmListFam) -> ((fun ty -> ((fun params -> ((fun locals -> ((fun body -> { Wasm_dModel.f_WatFunc_watFuncName = "$rt_strPack"; Wasm_dModel.f_WatFunc_watFuncType = ""; Wasm_dModel.f_WatFunc_watFuncParams = params; Wasm_dModel.f_WatFunc_watFuncResults = (B_dData_dList.C_List__x58__x58_ (Wasm_dModel.C_WatValTy_WvAnyRef, B_dData_dList.C_List_Nil)); Wasm_dModel.f_WatFunc_watFuncLocals = locals; Wasm_dModel.f_WatFunc_watFuncBody = body }) (v_catI (B_dData_dList.C_List__x58__x58_ ((B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ILocalGet ("$p0")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ILocalSet ("$cur")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IConstI32 (0)), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ILocalSet ("$n")), B_dData_dList.C_List_Nil)))))))), (B_dData_dList.C_List__x58__x58_ ((B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IBlock ("$p_count_done", "", (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ILoop ("$p_count", "", (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ILocalGet ("$cur")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IRefCast (ty)), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IStructGet (ty, 0)), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IConstI32 ((lf).Wasm_dTypes.f_WasmListFam_wasmListNilTag)), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IBinop ("i32.eq")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IBrIf ("$p_count_done")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ILocalGet ("$n")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IConstI32 (1)), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IBinop ("i32.add")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ILocalSet ("$n")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ILocalGet ("$cur")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IRefCast (ty)), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IStructGet (ty, 2)), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ILocalSet ("$cur")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IBr ("$p_count")), B_dData_dList.C_List_Nil)))))))))))))))))))))))))))))))), B_dData_dList.C_List_Nil)))), B_dData_dList.C_List_Nil)), (B_dData_dList.C_List__x58__x58_ ((B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ILocalGet ("$n")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IArrayNewDefault ("$str")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ILocalSet ("$out")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IConstI32 (0)), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ILocalSet ("$idx")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ILocalGet ("$p0")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ILocalSet ("$cur")), B_dData_dList.C_List_Nil)))))))))))))), (B_dData_dList.C_List__x58__x58_ ((B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IBlock ("$p_fill_done", "", (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ILoop ("$p_fill", "", (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ILocalGet ("$cur")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IRefCast (ty)), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IStructGet (ty, 0)), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IConstI32 ((lf).Wasm_dTypes.f_WasmListFam_wasmListNilTag)), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IBinop ("i32.eq")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IBrIf ("$p_fill_done")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ILocalGet ("$out")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ILocalGet ("$idx")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ILocalGet ("$cur")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IRefCast (ty)), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IStructGet (ty, 1)), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IRefCast ("$int")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IStructGet ("$int", 0)), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IPlain ("i32.wrap_i64")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IArraySet ("$str")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ILocalGet ("$idx")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IConstI32 (1)), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IBinop ("i32.add")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ILocalSet ("$idx")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ILocalGet ("$cur")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IRefCast (ty)), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IStructGet (ty, 2)), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ILocalSet ("$cur")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IBr ("$p_fill")), B_dData_dList.C_List_Nil)))))))))))))))))))))))))))))))))))))))))))))))))), B_dData_dList.C_List_Nil)))), B_dData_dList.C_List_Nil)), (B_dData_dList.C_List__x58__x58_ ((B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ILocalGet ("$out")), B_dData_dList.C_List_Nil)), B_dData_dList.C_List_Nil))))))))))))) (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = "$cur"; B_dData_dPair.f_Pair_second = Wasm_dModel.C_WatValTy_WvAnyRef }, (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = "$n"; B_dData_dPair.f_Pair_second = Wasm_dModel.C_WatValTy_WvI32 }, (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = "$out"; B_dData_dPair.f_Pair_second = (Wasm_dModel.C_WatValTy_WvRef ("$str")) }, (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = "$idx"; B_dData_dPair.f_Pair_second = Wasm_dModel.C_WatValTy_WvI32 }, B_dData_dList.C_List_Nil)))))))))) (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = "$p0"; B_dData_dPair.f_Pair_second = Wasm_dModel.C_WatValTy_WvAnyRef }, B_dData_dList.C_List_Nil)))) (v_wasmListTy lf)))

# 1296 "Vuna/Compiler/Wasm/Module.vuna"
let v_rtStrConcatManyF = (fun (lf : Wasm_dTypes.t_WasmListFam) -> ((fun ty -> ((fun params -> ((fun locals -> ((fun body -> { Wasm_dModel.f_WatFunc_watFuncName = "$rt_strConcatMany"; Wasm_dModel.f_WatFunc_watFuncType = ""; Wasm_dModel.f_WatFunc_watFuncParams = params; Wasm_dModel.f_WatFunc_watFuncResults = (B_dData_dList.C_List__x58__x58_ (Wasm_dModel.C_WatValTy_WvAnyRef, B_dData_dList.C_List_Nil)); Wasm_dModel.f_WatFunc_watFuncLocals = locals; Wasm_dModel.f_WatFunc_watFuncBody = body }) (v_catI (B_dData_dList.C_List__x58__x58_ ((B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ILocalGet ("$p0")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ILocalSet ("$cur")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IConstI32 (0)), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ILocalSet ("$total")), B_dData_dList.C_List_Nil)))))))), (B_dData_dList.C_List__x58__x58_ ((B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IBlock ("$c_count_done", "", (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ILoop ("$c_count", "", (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ILocalGet ("$cur")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IRefCast (ty)), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IStructGet (ty, 0)), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IConstI32 ((lf).Wasm_dTypes.f_WasmListFam_wasmListNilTag)), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IBinop ("i32.eq")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IBrIf ("$c_count_done")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ILocalGet ("$total")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ILocalGet ("$cur")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IRefCast (ty)), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IStructGet (ty, 1)), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IRefCast ("$str")), (B_dData_dList.C_List__x58__x58_ (Wasm_dInstr.C_Instr_IArrayLen, (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IBinop ("i32.add")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ILocalSet ("$total")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ILocalGet ("$cur")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IRefCast (ty)), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IStructGet (ty, 2)), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ILocalSet ("$cur")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IBr ("$c_count")), B_dData_dList.C_List_Nil)))))))))))))))))))))))))))))))))))))))), B_dData_dList.C_List_Nil)))), B_dData_dList.C_List_Nil)), (B_dData_dList.C_List__x58__x58_ ((B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ILocalGet ("$total")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IArrayNewDefault ("$str")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ILocalSet ("$out")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IConstI32 (0)), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ILocalSet ("$idx")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ILocalGet ("$p0")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ILocalSet ("$cur")), B_dData_dList.C_List_Nil)))))))))))))), (B_dData_dList.C_List__x58__x58_ ((B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IBlock ("$c_fill_done", "", (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ILoop ("$c_fill", "", (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ILocalGet ("$cur")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IRefCast (ty)), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IStructGet (ty, 0)), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IConstI32 ((lf).Wasm_dTypes.f_WasmListFam_wasmListNilTag)), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IBinop ("i32.eq")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IBrIf ("$c_fill_done")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ILocalGet ("$out")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ILocalGet ("$idx")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ILocalGet ("$cur")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IRefCast (ty)), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IStructGet (ty, 1)), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IRefCast ("$str")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ILocalTee ("$src")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IConstI32 (0)), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ILocalGet ("$src")), (B_dData_dList.C_List__x58__x58_ (Wasm_dInstr.C_Instr_IArrayLen, (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IArrayCopy ("$str", "$str")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ILocalGet ("$idx")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ILocalGet ("$src")), (B_dData_dList.C_List__x58__x58_ (Wasm_dInstr.C_Instr_IArrayLen, (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IBinop ("i32.add")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ILocalSet ("$idx")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ILocalGet ("$cur")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IRefCast (ty)), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IStructGet (ty, 2)), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ILocalSet ("$cur")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IBr ("$c_fill")), B_dData_dList.C_List_Nil)))))))))))))))))))))))))))))))))))))))))))))))))))))))), B_dData_dList.C_List_Nil)))), B_dData_dList.C_List_Nil)), (B_dData_dList.C_List__x58__x58_ ((B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ILocalGet ("$out")), B_dData_dList.C_List_Nil)), B_dData_dList.C_List_Nil))))))))))))) (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = "$cur"; B_dData_dPair.f_Pair_second = Wasm_dModel.C_WatValTy_WvAnyRef }, (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = "$total"; B_dData_dPair.f_Pair_second = Wasm_dModel.C_WatValTy_WvI32 }, (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = "$out"; B_dData_dPair.f_Pair_second = (Wasm_dModel.C_WatValTy_WvRef ("$str")) }, (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = "$idx"; B_dData_dPair.f_Pair_second = Wasm_dModel.C_WatValTy_WvI32 }, (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = "$src"; B_dData_dPair.f_Pair_second = (Wasm_dModel.C_WatValTy_WvRef ("$str")) }, B_dData_dList.C_List_Nil)))))))))))) (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = "$p0"; B_dData_dPair.f_Pair_second = Wasm_dModel.C_WatValTy_WvAnyRef }, B_dData_dList.C_List_Nil)))) (v_wasmListTy lf)))

# 1314 "Vuna/Compiler/Wasm/Module.vuna"
let v_rtStrArgAtF = (fun (lf : Wasm_dTypes.t_WasmListFam) -> ((fun ty -> { Wasm_dModel.f_WatFunc_watFuncName = "$rt_strArgAt"; Wasm_dModel.f_WatFunc_watFuncType = ""; Wasm_dModel.f_WatFunc_watFuncParams = (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = "$p0"; B_dData_dPair.f_Pair_second = Wasm_dModel.C_WatValTy_WvAnyRef }, (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = "$p1"; B_dData_dPair.f_Pair_second = Wasm_dModel.C_WatValTy_WvI32 }, B_dData_dList.C_List_Nil)))); Wasm_dModel.f_WatFunc_watFuncResults = (B_dData_dList.C_List__x58__x58_ (Wasm_dModel.C_WatValTy_WvAnyRef, B_dData_dList.C_List_Nil)); Wasm_dModel.f_WatFunc_watFuncLocals = B_dData_dList.C_List_Nil; Wasm_dModel.f_WatFunc_watFuncBody = (v_catI (B_dData_dList.C_List__x58__x58_ ((B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IBlock ("$a_done", "", (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ILoop ("$a_l", "", (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ILocalGet ("$p1")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IPlain ("i32.eqz")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IBrIf ("$a_done")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ILocalGet ("$p0")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IRefCast (ty)), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IStructGet (ty, 2)), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ILocalSet ("$p0")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ILocalGet ("$p1")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IConstI32 (1)), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IBinop ("i32.sub")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ILocalSet ("$p1")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IBr ("$a_l")), B_dData_dList.C_List_Nil)))))))))))))))))))))))))), B_dData_dList.C_List_Nil)))), B_dData_dList.C_List_Nil)), (B_dData_dList.C_List__x58__x58_ ((B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ILocalGet ("$p0")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IRefCast (ty)), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IStructGet (ty, 1)), B_dData_dList.C_List_Nil)))))), B_dData_dList.C_List_Nil))))) }) (v_wasmListTy lf)))

# 1327 "Vuna/Compiler/Wasm/Module.vuna"
let v_stDigits = (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ILocalGet ("$i")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IConstI32 (1)), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IBinop ("i32.add")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ILocalSet ("$j")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IConstI32 (0)), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ILocalSet ("$k")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IBlock ("$d_done", "", (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ILoop ("$d_l", "", (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ILocalGet ("$j")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ILocalGet ("$n")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IBinop ("i32.ge_s")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IBrIf ("$d_done")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ILocalGet ("$t")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ILocalGet ("$j")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IArrayGetU ("$str")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ILocalSet ("$b")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ILocalGet ("$b")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IConstI32 (48)), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IBinop ("i32.lt_s")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IBrIf ("$d_done")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ILocalGet ("$b")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IConstI32 (57)), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IBinop ("i32.gt_s")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IBrIf ("$d_done")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ILocalGet ("$k")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IConstI32 (10)), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IBinop ("i32.mul")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ILocalGet ("$b")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IConstI32 (48)), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IBinop ("i32.sub")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IBinop ("i32.add")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ILocalSet ("$k")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ILocalGet ("$j")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IConstI32 (1)), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IBinop ("i32.add")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ILocalSet ("$j")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IBr ("$d_l")), B_dData_dList.C_List_Nil)))))))))))))))))))))))))))))))))))))))))))))))))))))))))))), B_dData_dList.C_List_Nil)))), B_dData_dList.C_List_Nil))))))))))))))

# 1343 "Vuna/Compiler/Wasm/Module.vuna"
let v_stNotPlaceholder = (fun (name : string) -> (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ILocalGet ("$j")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ILocalGet ("$n")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IBinop ("i32.ge_s")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IBrIf (name)), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ILocalGet ("$t")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ILocalGet ("$j")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IArrayGetU ("$str")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IConstI32 (62)), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IBinop ("i32.ne")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IBrIf (name)), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ILocalGet ("$j")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ILocalGet ("$i")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IConstI32 (1)), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IBinop ("i32.add")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IBinop ("i32.le_s")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IBrIf (name)), B_dData_dList.C_List_Nil)))))))))))))))))))))))))))))))))

# 1372 "Vuna/Compiler/Wasm/Module.vuna"
let v_rtStrSubstTemplateF = (fun (lf : Wasm_dTypes.t_WasmListFam) -> ((fun ty -> { Wasm_dModel.f_WatFunc_watFuncName = "$rt_strSubstTemplate"; Wasm_dModel.f_WatFunc_watFuncType = ""; Wasm_dModel.f_WatFunc_watFuncParams = (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = "$p0"; B_dData_dPair.f_Pair_second = Wasm_dModel.C_WatValTy_WvAnyRef }, (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = "$p1"; B_dData_dPair.f_Pair_second = Wasm_dModel.C_WatValTy_WvAnyRef }, B_dData_dList.C_List_Nil)))); Wasm_dModel.f_WatFunc_watFuncResults = (B_dData_dList.C_List__x58__x58_ (Wasm_dModel.C_WatValTy_WvAnyRef, B_dData_dList.C_List_Nil)); Wasm_dModel.f_WatFunc_watFuncLocals = (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = "$t"; B_dData_dPair.f_Pair_second = (Wasm_dModel.C_WatValTy_WvRef ("$str")) }, (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = "$args"; B_dData_dPair.f_Pair_second = Wasm_dModel.C_WatValTy_WvAnyRef }, (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = "$n"; B_dData_dPair.f_Pair_second = Wasm_dModel.C_WatValTy_WvI32 }, (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = "$na"; B_dData_dPair.f_Pair_second = Wasm_dModel.C_WatValTy_WvI32 }, (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = "$total"; B_dData_dPair.f_Pair_second = Wasm_dModel.C_WatValTy_WvI32 }, (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = "$i"; B_dData_dPair.f_Pair_second = Wasm_dModel.C_WatValTy_WvI32 }, (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = "$j"; B_dData_dPair.f_Pair_second = Wasm_dModel.C_WatValTy_WvI32 }, (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = "$k"; B_dData_dPair.f_Pair_second = Wasm_dModel.C_WatValTy_WvI32 }, (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = "$b"; B_dData_dPair.f_Pair_second = Wasm_dModel.C_WatValTy_WvI32 }, (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = "$out"; B_dData_dPair.f_Pair_second = (Wasm_dModel.C_WatValTy_WvRef ("$str")) }, (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = "$oidx"; B_dData_dPair.f_Pair_second = Wasm_dModel.C_WatValTy_WvI32 }, (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = "$arg"; B_dData_dPair.f_Pair_second = (Wasm_dModel.C_WatValTy_WvRef ("$str")) }, (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = "$cur"; B_dData_dPair.f_Pair_second = Wasm_dModel.C_WatValTy_WvAnyRef }, B_dData_dList.C_List_Nil)))))))))))))))))))))))))); Wasm_dModel.f_WatFunc_watFuncBody = (v_catI (B_dData_dList.C_List__x58__x58_ ((B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ILocalGet ("$p0")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IRefCast ("$str")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ILocalSet ("$t")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ILocalGet ("$t")), (B_dData_dList.C_List__x58__x58_ (Wasm_dInstr.C_Instr_IArrayLen, (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ILocalSet ("$n")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ILocalGet ("$p1")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ILocalSet ("$args")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IConstI32 (0)), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ILocalSet ("$na")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ILocalGet ("$args")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ILocalSet ("$cur")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IBlock ("$na_done", "", (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ILoop ("$na_l", "", (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ILocalGet ("$cur")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IRefCast (ty)), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IStructGet (ty, 0)), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IConstI32 ((lf).Wasm_dTypes.f_WasmListFam_wasmListNilTag)), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IBinop ("i32.eq")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IBrIf ("$na_done")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ILocalGet ("$na")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IConstI32 (1)), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IBinop ("i32.add")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ILocalSet ("$na")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ILocalGet ("$cur")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IRefCast (ty)), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IStructGet (ty, 2)), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ILocalSet ("$cur")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IBr ("$na_l")), B_dData_dList.C_List_Nil)))))))))))))))))))))))))))))))), B_dData_dList.C_List_Nil)))), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IConstI32 (0)), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ILocalSet ("$total")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IConstI32 (0)), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ILocalSet ("$i")), B_dData_dList.C_List_Nil)))))))))))))))))))))))))))))))))), (B_dData_dList.C_List__x58__x58_ ((B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IBlock ("$c_done", "", (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ILoop ("$c_l", "", (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ILocalGet ("$i")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ILocalGet ("$n")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IBinop ("i32.ge_s")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IBrIf ("$c_done")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ILocalGet ("$t")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ILocalGet ("$i")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IArrayGetU ("$str")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IConstI32 (60)), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IBinop ("i32.ne")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IIf ("", (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ILocalGet ("$total")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IConstI32 (1)), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IBinop ("i32.add")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ILocalSet ("$total")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ILocalGet ("$i")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IConstI32 (1)), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IBinop ("i32.add")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ILocalSet ("$i")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IBr ("$c_l")), B_dData_dList.C_List_Nil)))))))))))))))))), ((B_dData_dList.v_append (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IBlock ("$c_skip", "", ((B_dData_dList.v_append v_stDigits) ((B_dData_dList.v_append (v_stNotPlaceholder "$c_skip")) (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ILocalGet ("$k")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ILocalGet ("$na")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IBinop ("i32.lt_s")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IIf ("", (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ILocalGet ("$total")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ILocalGet ("$args")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ILocalGet ("$k")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ICall ("$rt_strArgAt")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IRefCast ("$str")), (B_dData_dList.C_List__x58__x58_ (Wasm_dInstr.C_Instr_IArrayLen, (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IBinop ("i32.add")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ILocalSet ("$total")), B_dData_dList.C_List_Nil)))))))))))))))), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ILocalGet ("$total")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ILocalGet ("$j")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ILocalGet ("$i")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IBinop ("i32.sub")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IConstI32 (1)), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IBinop ("i32.add")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IBinop ("i32.add")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ILocalSet ("$total")), B_dData_dList.C_List_Nil)))))))))))))))))), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ILocalGet ("$j")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IConstI32 (1)), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IBinop ("i32.add")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ILocalSet ("$i")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IBr ("$c_l")), B_dData_dList.C_List_Nil)))))))))))))))))))))), B_dData_dList.C_List_Nil))) (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ILocalGet ("$total")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IConstI32 (1)), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IBinop ("i32.add")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ILocalSet ("$total")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ILocalGet ("$i")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IConstI32 (1)), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IBinop ("i32.add")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ILocalSet ("$i")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IBr ("$c_l")), B_dData_dList.C_List_Nil))))))))))))))))))))), B_dData_dList.C_List_Nil)))))))))))))))))))))), B_dData_dList.C_List_Nil)))), B_dData_dList.C_List_Nil)), (B_dData_dList.C_List__x58__x58_ ((B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ILocalGet ("$total")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IArrayNewDefault ("$str")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ILocalSet ("$out")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IConstI32 (0)), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ILocalSet ("$oidx")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IConstI32 (0)), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ILocalSet ("$i")), B_dData_dList.C_List_Nil)))))))))))))), (B_dData_dList.C_List__x58__x58_ ((B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IBlock ("$f_done", "", (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ILoop ("$f_l", "", (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ILocalGet ("$i")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ILocalGet ("$n")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IBinop ("i32.ge_s")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IBrIf ("$f_done")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ILocalGet ("$t")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ILocalGet ("$i")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IArrayGetU ("$str")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IConstI32 (60)), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IBinop ("i32.ne")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IIf ("", (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ILocalGet ("$out")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ILocalGet ("$oidx")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ILocalGet ("$t")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ILocalGet ("$i")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IArrayGetU ("$str")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IArraySet ("$str")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ILocalGet ("$oidx")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IConstI32 (1)), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IBinop ("i32.add")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ILocalSet ("$oidx")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ILocalGet ("$i")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IConstI32 (1)), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IBinop ("i32.add")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ILocalSet ("$i")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IBr ("$f_l")), B_dData_dList.C_List_Nil)))))))))))))))))))))))))))))), ((B_dData_dList.v_append (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IBlock ("$f_skip", "", ((B_dData_dList.v_append v_stDigits) ((B_dData_dList.v_append (v_stNotPlaceholder "$f_skip")) (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ILocalGet ("$k")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ILocalGet ("$na")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IBinop ("i32.lt_s")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IIf ("", (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ILocalGet ("$out")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ILocalGet ("$oidx")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ILocalGet ("$args")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ILocalGet ("$k")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ICall ("$rt_strArgAt")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IRefCast ("$str")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ILocalTee ("$arg")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IConstI32 (0)), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ILocalGet ("$arg")), (B_dData_dList.C_List__x58__x58_ (Wasm_dInstr.C_Instr_IArrayLen, (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IArrayCopy ("$str", "$str")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ILocalGet ("$oidx")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ILocalGet ("$arg")), (B_dData_dList.C_List__x58__x58_ (Wasm_dInstr.C_Instr_IArrayLen, (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IBinop ("i32.add")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ILocalSet ("$oidx")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ILocalGet ("$j")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IConstI32 (1)), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IBinop ("i32.add")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ILocalSet ("$i")), B_dData_dList.C_List_Nil)))))))))))))))))))))))))))))))))))))))), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IBlock ("$lit_done", "", (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ILoop ("$lit_l", "", (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ILocalGet ("$i")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ILocalGet ("$j")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IBinop ("i32.gt_s")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IBrIf ("$lit_done")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ILocalGet ("$out")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ILocalGet ("$oidx")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ILocalGet ("$t")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ILocalGet ("$i")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IArrayGetU ("$str")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IArraySet ("$str")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ILocalGet ("$oidx")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IConstI32 (1)), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IBinop ("i32.add")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ILocalSet ("$oidx")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ILocalGet ("$i")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IConstI32 (1)), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IBinop ("i32.add")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ILocalSet ("$i")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IBr ("$lit_l")), B_dData_dList.C_List_Nil)))))))))))))))))))))))))))))))))))))))), B_dData_dList.C_List_Nil)))), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ILocalGet ("$j")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IConstI32 (1)), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IBinop ("i32.add")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ILocalSet ("$i")), B_dData_dList.C_List_Nil)))))))))))), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IBr ("$f_l")), B_dData_dList.C_List_Nil)))))))))))))), B_dData_dList.C_List_Nil))) (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ILocalGet ("$out")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ILocalGet ("$oidx")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ILocalGet ("$t")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ILocalGet ("$i")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IArrayGetU ("$str")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IArraySet ("$str")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ILocalGet ("$oidx")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IConstI32 (1)), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IBinop ("i32.add")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ILocalSet ("$oidx")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ILocalGet ("$i")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IConstI32 (1)), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IBinop ("i32.add")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ILocalSet ("$i")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IBr ("$f_l")), B_dData_dList.C_List_Nil))))))))))))))))))))))))))))))))), B_dData_dList.C_List_Nil)))))))))))))))))))))), B_dData_dList.C_List_Nil)))), B_dData_dList.C_List_Nil)), (B_dData_dList.C_List__x58__x58_ ((B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ILocalGet ("$out")), B_dData_dList.C_List_Nil)), B_dData_dList.C_List_Nil))))))))))) }) (v_wasmListTy lf)))

# 1385 "Vuna/Compiler/Wasm/Module.vuna"
let v_rtArrayFromListF = (fun (lf : Wasm_dTypes.t_WasmListFam) -> ((fun ty -> ((fun locals -> { Wasm_dModel.f_WatFunc_watFuncName = "$rt_arrayFromList"; Wasm_dModel.f_WatFunc_watFuncType = ""; Wasm_dModel.f_WatFunc_watFuncParams = (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = "$p0"; B_dData_dPair.f_Pair_second = Wasm_dModel.C_WatValTy_WvAnyRef }, B_dData_dList.C_List_Nil)); Wasm_dModel.f_WatFunc_watFuncResults = (B_dData_dList.C_List__x58__x58_ (Wasm_dModel.C_WatValTy_WvAnyRef, B_dData_dList.C_List_Nil)); Wasm_dModel.f_WatFunc_watFuncLocals = locals; Wasm_dModel.f_WatFunc_watFuncBody = (v_catI (B_dData_dList.C_List__x58__x58_ ((B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ILocalGet ("$p0")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ILocalSet ("$cur")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IConstI32 (0)), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ILocalSet ("$n")), B_dData_dList.C_List_Nil)))))))), (B_dData_dList.C_List__x58__x58_ ((B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IBlock ("$afl_count_done", "", (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ILoop ("$afl_count", "", (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ILocalGet ("$cur")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IRefCast (ty)), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IStructGet (ty, 0)), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IConstI32 ((lf).Wasm_dTypes.f_WasmListFam_wasmListNilTag)), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IBinop ("i32.eq")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IBrIf ("$afl_count_done")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ILocalGet ("$n")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IConstI32 (1)), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IBinop ("i32.add")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ILocalSet ("$n")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ILocalGet ("$cur")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IRefCast (ty)), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IStructGet (ty, 2)), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ILocalSet ("$cur")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IBr ("$afl_count")), B_dData_dList.C_List_Nil)))))))))))))))))))))))))))))))), B_dData_dList.C_List_Nil)))), B_dData_dList.C_List_Nil)), (B_dData_dList.C_List__x58__x58_ ((B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ILocalGet ("$n")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IArrayNewDefault ("$arr")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ILocalSet ("$out")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IConstI32 (0)), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ILocalSet ("$idx")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ILocalGet ("$p0")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ILocalSet ("$cur")), B_dData_dList.C_List_Nil)))))))))))))), (B_dData_dList.C_List__x58__x58_ ((B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IBlock ("$afl_fill_done", "", (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ILoop ("$afl_fill", "", (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ILocalGet ("$cur")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IRefCast (ty)), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IStructGet (ty, 0)), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IConstI32 ((lf).Wasm_dTypes.f_WasmListFam_wasmListNilTag)), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IBinop ("i32.eq")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IBrIf ("$afl_fill_done")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ILocalGet ("$out")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ILocalGet ("$idx")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ILocalGet ("$cur")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IRefCast (ty)), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IStructGet (ty, 1)), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IArraySet ("$arr")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ILocalGet ("$idx")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IConstI32 (1)), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IBinop ("i32.add")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ILocalSet ("$idx")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ILocalGet ("$cur")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IRefCast (ty)), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IStructGet (ty, 2)), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ILocalSet ("$cur")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IBr ("$afl_fill")), B_dData_dList.C_List_Nil)))))))))))))))))))))))))))))))))))))))))))), B_dData_dList.C_List_Nil)))), B_dData_dList.C_List_Nil)), (B_dData_dList.C_List__x58__x58_ ((B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ILocalGet ("$out")), B_dData_dList.C_List_Nil)), B_dData_dList.C_List_Nil))))))))))) }) (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = "$cur"; B_dData_dPair.f_Pair_second = Wasm_dModel.C_WatValTy_WvAnyRef }, (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = "$n"; B_dData_dPair.f_Pair_second = Wasm_dModel.C_WatValTy_WvI32 }, (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = "$out"; B_dData_dPair.f_Pair_second = (Wasm_dModel.C_WatValTy_WvRef ("$arr")) }, (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = "$idx"; B_dData_dPair.f_Pair_second = Wasm_dModel.C_WatValTy_WvI32 }, B_dData_dList.C_List_Nil)))))))))) (v_wasmListTy lf)))

# 1399 "Vuna/Compiler/Wasm/Module.vuna"
let v_rtArrayToListF = (fun (lf : Wasm_dTypes.t_WasmListFam) -> ((fun ty -> ((fun locals -> { Wasm_dModel.f_WatFunc_watFuncName = "$rt_arrayToList"; Wasm_dModel.f_WatFunc_watFuncType = ""; Wasm_dModel.f_WatFunc_watFuncParams = (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = "$p0"; B_dData_dPair.f_Pair_second = Wasm_dModel.C_WatValTy_WvAnyRef }, B_dData_dList.C_List_Nil)); Wasm_dModel.f_WatFunc_watFuncResults = (B_dData_dList.C_List__x58__x58_ (Wasm_dModel.C_WatValTy_WvAnyRef, B_dData_dList.C_List_Nil)); Wasm_dModel.f_WatFunc_watFuncLocals = locals; Wasm_dModel.f_WatFunc_watFuncBody = (v_catI (B_dData_dList.C_List__x58__x58_ ((B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ILocalGet ("$p0")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IRefCast ("$arr")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ILocalSet ("$arr")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ILocalGet ("$arr")), (B_dData_dList.C_List__x58__x58_ (Wasm_dInstr.C_Instr_IArrayLen, (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ILocalSet ("$n")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ILocalGet ("$n")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ILocalSet ("$i")), B_dData_dList.C_List_Nil)))))))))))))))), (B_dData_dList.C_List__x58__x58_ ((v_wasmNilCell lf), (B_dData_dList.C_List__x58__x58_ ((B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ILocalSet ("$acc")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IBlock ("$atl_done", "", (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ILoop ("$atl_l", "", (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ILocalGet ("$i")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IPlain ("i32.eqz")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IBrIf ("$atl_done")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ILocalGet ("$i")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IConstI32 (1)), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IBinop ("i32.sub")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ILocalSet ("$i")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IConstI32 ((lf).Wasm_dTypes.f_WasmListFam_wasmListConsTag)), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ILocalGet ("$arr")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ILocalGet ("$i")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IArrayGet ("$arr")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ILocalGet ("$acc")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IStructNew (ty)), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ILocalSet ("$acc")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IBr ("$atl_l")), B_dData_dList.C_List_Nil)))))))))))))))))))))))))))))))), B_dData_dList.C_List_Nil)))), B_dData_dList.C_List_Nil)))), (B_dData_dList.C_List__x58__x58_ ((B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ILocalGet ("$acc")), B_dData_dList.C_List_Nil)), B_dData_dList.C_List_Nil))))))))) }) (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = "$arr"; B_dData_dPair.f_Pair_second = (Wasm_dModel.C_WatValTy_WvRef ("$arr")) }, (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = "$n"; B_dData_dPair.f_Pair_second = Wasm_dModel.C_WatValTy_WvI32 }, (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = "$i"; B_dData_dPair.f_Pair_second = Wasm_dModel.C_WatValTy_WvI32 }, (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = "$acc"; B_dData_dPair.f_Pair_second = Wasm_dModel.C_WatValTy_WvAnyRef }, B_dData_dList.C_List_Nil)))))))))) (v_wasmListTy lf)))

# 1413 "Vuna/Compiler/Wasm/Module.vuna"
let v_rtGetArgsF = (fun (lf : Wasm_dTypes.t_WasmListFam) -> ((fun ty -> ((fun locals -> ((fun body -> { Wasm_dModel.f_WatFunc_watFuncName = "$rt_getArgs"; Wasm_dModel.f_WatFunc_watFuncType = ""; Wasm_dModel.f_WatFunc_watFuncParams = B_dData_dList.C_List_Nil; Wasm_dModel.f_WatFunc_watFuncResults = (B_dData_dList.C_List__x58__x58_ (Wasm_dModel.C_WatValTy_WvAnyRef, B_dData_dList.C_List_Nil)); Wasm_dModel.f_WatFunc_watFuncLocals = locals; Wasm_dModel.f_WatFunc_watFuncBody = body }) ((B_dData_dList.v_append (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IConstI32 (Wasm_dRuntime.v_wasiAux)), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IConstI32 ((Wasm_dRuntime.v_wasiAux + 4))), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ICall ("$args_sizes_get")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ILocalSet ("$err")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ILocalGet ("$err")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IConstI32 (0)), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IBinop ("i32.ne")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IIf ("", ((B_dData_dList.v_append (v_wasmNilCell lf)) (B_dData_dList.C_List__x58__x58_ (Wasm_dInstr.C_Instr_IReturn, B_dData_dList.C_List_Nil))), (B_dData_dList.C_List__x58__x58_ (Wasm_dInstr.C_Instr_INop, B_dData_dList.C_List_Nil)))), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IConstI32 (Wasm_dRuntime.v_wasiAux)), (B_dData_dList.C_List__x58__x58_ (Wasm_dInstr.C_Instr_ILoad32, (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ILocalSet ("$count")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IConstI32 ((Wasm_dRuntime.v_wasiAux + 8))), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ILocalSet ("$ptr")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ILocalGet ("$ptr")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ILocalGet ("$count")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IConstI32 (4)), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IBinop ("i32.mul")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IBinop ("i32.add")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ILocalSet ("$buf")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ILocalGet ("$ptr")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ILocalGet ("$buf")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ICall ("$args_get")), (B_dData_dList.C_List__x58__x58_ (Wasm_dInstr.C_Instr_IDrop, B_dData_dList.C_List_Nil))))))))))))))))))))))))))))))))))))))))))))))) ((B_dData_dList.v_append (v_wasmNilCell lf)) (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ILocalSet ("$acc")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ILocalGet ("$count")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IConstI32 (1)), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IBinop ("i32.sub")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ILocalSet ("$i")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IBlock ("$a_done", "", (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ILoop ("$a_l", "", (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ILocalGet ("$i")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IConstI32 (1)), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IBinop ("i32.lt_s")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IBrIf ("$a_done")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ILocalGet ("$ptr")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ILocalGet ("$i")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IConstI32 (4)), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IBinop ("i32.mul")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IBinop ("i32.add")), (B_dData_dList.C_List__x58__x58_ (Wasm_dInstr.C_Instr_ILoad32, (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ILocalSet ("$p")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ILocalGet ("$p")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ILocalSet ("$k")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IBlock ("$nul_done", "", (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ILoop ("$nul_l", "", (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ILocalGet ("$k")), (B_dData_dList.C_List__x58__x58_ (Wasm_dInstr.C_Instr_ILoad8U, (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IConstI32 (0)), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IBinop ("i32.eq")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IBrIf ("$nul_done")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ILocalGet ("$k")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IConstI32 (1)), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IBinop ("i32.add")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ILocalSet ("$k")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IBr ("$nul_l")), B_dData_dList.C_List_Nil)))))))))))))))))))))), B_dData_dList.C_List_Nil)))), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ILocalGet ("$p")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ILocalGet ("$k")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ILocalGet ("$p")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IBinop ("i32.sub")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ICall ("$rt_memToStr")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ILocalSet ("$name")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IConstI32 ((lf).Wasm_dTypes.f_WasmListFam_wasmListConsTag)), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ILocalGet ("$name")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ILocalGet ("$acc")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IStructNew (ty)), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ILocalSet ("$acc")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ILocalGet ("$i")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IConstI32 (1)), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IBinop ("i32.sub")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ILocalSet ("$i")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IBr ("$a_l")), B_dData_dList.C_List_Nil)))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))), B_dData_dList.C_List_Nil)))), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ILocalGet ("$acc")), B_dData_dList.C_List_Nil)))))))))))))))))) (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = "$count"; B_dData_dPair.f_Pair_second = Wasm_dModel.C_WatValTy_WvI32 }, (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = "$ptr"; B_dData_dPair.f_Pair_second = Wasm_dModel.C_WatValTy_WvI32 }, (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = "$buf"; B_dData_dPair.f_Pair_second = Wasm_dModel.C_WatValTy_WvI32 }, (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = "$i"; B_dData_dPair.f_Pair_second = Wasm_dModel.C_WatValTy_WvI32 }, (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = "$p"; B_dData_dPair.f_Pair_second = Wasm_dModel.C_WatValTy_WvI32 }, (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = "$k"; B_dData_dPair.f_Pair_second = Wasm_dModel.C_WatValTy_WvI32 }, (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = "$acc"; B_dData_dPair.f_Pair_second = Wasm_dModel.C_WatValTy_WvAnyRef }, (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = "$err"; B_dData_dPair.f_Pair_second = Wasm_dModel.C_WatValTy_WvI32 }, (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = "$name"; B_dData_dPair.f_Pair_second = Wasm_dModel.C_WatValTy_WvAnyRef }, B_dData_dList.C_List_Nil)))))))))))))))))))) (v_wasmListTy lf)))

# 1436 "Vuna/Compiler/Wasm/Module.vuna"
let v_rtTryReadDirF = (fun (lf : Wasm_dTypes.t_WasmListFam) -> ((fun ty -> ((fun locals -> ((fun body -> { Wasm_dModel.f_WatFunc_watFuncName = "$rt_tryReadDir"; Wasm_dModel.f_WatFunc_watFuncType = ""; Wasm_dModel.f_WatFunc_watFuncParams = (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = "$p0"; B_dData_dPair.f_Pair_second = Wasm_dModel.C_WatValTy_WvAnyRef }, B_dData_dList.C_List_Nil)); Wasm_dModel.f_WatFunc_watFuncResults = (B_dData_dList.C_List__x58__x58_ (Wasm_dModel.C_WatValTy_WvAnyRef, B_dData_dList.C_List_Nil)); Wasm_dModel.f_WatFunc_watFuncLocals = locals; Wasm_dModel.f_WatFunc_watFuncBody = body }) ((B_dData_dList.v_append (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IConstI32 (0)), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IGlobalSet ("$g_hostStatus")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ILocalGet ("$p0")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IConstI32 (2)), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IConstI64 (136601638)), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ICall ("$rt_pathOpen")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ILocalSet ("$fd")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ILocalGet ("$fd")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IConstI32 (0)), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IBinop ("i32.lt_s")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IIf ("", ((B_dData_dList.v_append (v_wasmNilCell lf)) (B_dData_dList.C_List__x58__x58_ (Wasm_dInstr.C_Instr_IReturn, B_dData_dList.C_List_Nil))), (B_dData_dList.C_List__x58__x58_ (Wasm_dInstr.C_Instr_INop, B_dData_dList.C_List_Nil)))), B_dData_dList.C_List_Nil))))))))))))))))))))))) ((B_dData_dList.v_append (v_wasmNilCell lf)) (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ILocalSet ("$acc")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IConstI64 (0)), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ILocalSet ("$cookie")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IBlock ("$rd_done", "", (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ILoop ("$rd_l", "", (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ILocalGet ("$fd")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IConstI32 (Wasm_dRuntime.v_wasiDir)), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IConstI32 (Wasm_dRuntime.v_wasiDirCap)), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ILocalGet ("$cookie")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IConstI32 (Wasm_dRuntime.v_wasiAux)), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ICall ("$fd_readdir")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ILocalSet ("$err")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ILocalGet ("$err")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IConstI32 (0)), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IBinop ("i32.ne")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IIf ("", (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ILocalGet ("$err")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ICall ("$rt_errno")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IGlobalSet ("$g_hostStatus")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IBr ("$rd_done")), B_dData_dList.C_List_Nil)))))))), (B_dData_dList.C_List__x58__x58_ (Wasm_dInstr.C_Instr_INop, B_dData_dList.C_List_Nil)))), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IConstI32 (Wasm_dRuntime.v_wasiAux)), (B_dData_dList.C_List__x58__x58_ (Wasm_dInstr.C_Instr_ILoad32, (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ILocalSet ("$used")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ILocalGet ("$used")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IConstI32 (0)), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IBinop ("i32.eq")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IBrIf ("$rd_done")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IConstI32 (0)), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ILocalSet ("$off")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IConstI32 (0)), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ILocalSet ("$parsed")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IBlock ("$buf_done", "", (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ILoop ("$buf_l", "", (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ILocalGet ("$off")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IConstI32 (24)), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IBinop ("i32.add")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ILocalGet ("$used")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IBinop ("i32.gt_s")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IBrIf ("$buf_done")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IConstI32 (Wasm_dRuntime.v_wasiDir)), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ILocalGet ("$off")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IBinop ("i32.add")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IConstI32 (16)), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IBinop ("i32.add")), (B_dData_dList.C_List__x58__x58_ (Wasm_dInstr.C_Instr_ILoad32, (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ILocalSet ("$namlen")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ILocalGet ("$off")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IConstI32 (24)), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IBinop ("i32.add")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ILocalGet ("$namlen")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IBinop ("i32.add")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ILocalGet ("$used")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IBinop ("i32.gt_s")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IBrIf ("$buf_done")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IConstI32 (Wasm_dRuntime.v_wasiDir)), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ILocalGet ("$off")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IBinop ("i32.add")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IConstI32 (24)), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IBinop ("i32.add")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ILocalGet ("$namlen")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ICall ("$rt_memToStr")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ILocalSet ("$name")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IConstI32 ((lf).Wasm_dTypes.f_WasmListFam_wasmListConsTag)), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ILocalGet ("$name")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ILocalGet ("$acc")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IStructNew (ty)), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ILocalSet ("$acc")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IConstI32 (Wasm_dRuntime.v_wasiDir)), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ILocalGet ("$off")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IBinop ("i32.add")), (B_dData_dList.C_List__x58__x58_ (Wasm_dInstr.C_Instr_ILoad64, (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ILocalSet ("$cookie")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ILocalGet ("$off")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IConstI32 (24)), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IBinop ("i32.add")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ILocalGet ("$namlen")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IBinop ("i32.add")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ILocalSet ("$off")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IConstI32 (1)), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ILocalSet ("$parsed")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IBr ("$buf_l")), B_dData_dList.C_List_Nil)))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))), B_dData_dList.C_List_Nil)))), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ILocalGet ("$parsed")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IConstI32 (0)), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IBinop ("i32.eq")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IBrIf ("$rd_done")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IBr ("$rd_l")), B_dData_dList.C_List_Nil)))))))))))))))))))))))))))))))))))))))))))))))))))))))))), B_dData_dList.C_List_Nil)))), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ILocalGet ("$fd")), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ICall ("$fd_close")), (B_dData_dList.C_List__x58__x58_ (Wasm_dInstr.C_Instr_IDrop, (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ILocalGet ("$acc")), B_dData_dList.C_List_Nil)))))))))))))))))))) (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = "$fd"; B_dData_dPair.f_Pair_second = Wasm_dModel.C_WatValTy_WvI32 }, (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = "$err"; B_dData_dPair.f_Pair_second = Wasm_dModel.C_WatValTy_WvI32 }, (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = "$used"; B_dData_dPair.f_Pair_second = Wasm_dModel.C_WatValTy_WvI32 }, (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = "$off"; B_dData_dPair.f_Pair_second = Wasm_dModel.C_WatValTy_WvI32 }, (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = "$namlen"; B_dData_dPair.f_Pair_second = Wasm_dModel.C_WatValTy_WvI32 }, (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = "$acc"; B_dData_dPair.f_Pair_second = Wasm_dModel.C_WatValTy_WvAnyRef }, (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = "$name"; B_dData_dPair.f_Pair_second = Wasm_dModel.C_WatValTy_WvAnyRef }, (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = "$cookie"; B_dData_dPair.f_Pair_second = Wasm_dModel.C_WatValTy_WvI64 }, (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = "$parsed"; B_dData_dPair.f_Pair_second = Wasm_dModel.C_WatValTy_WvI32 }, B_dData_dList.C_List_Nil)))))))))))))))))))) (v_wasmListTy lf)))

# 1252 "Vuna/Compiler/Wasm/Module.vuna"
let v_wasmBridgeFuncs = (fun (mc0 : Wasm_dTypes.t_WasmListFam B_dData_dMaybe.t_Maybe) -> (match mc0 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__320) -> (B_dData_dList.C_List__x58__x58_ ((v_rtStrUnpackF dtb__320), (B_dData_dList.C_List__x58__x58_ ((v_rtStrPackF dtb__320), (B_dData_dList.C_List__x58__x58_ ((v_rtStrConcatManyF dtb__320), (B_dData_dList.C_List__x58__x58_ ((v_rtStrArgAtF dtb__320), (B_dData_dList.C_List__x58__x58_ ((v_rtStrSubstTemplateF dtb__320), (B_dData_dList.C_List__x58__x58_ ((v_rtArrayFromListF dtb__320), (B_dData_dList.C_List__x58__x58_ ((v_rtArrayToListF dtb__320), (B_dData_dList.C_List__x58__x58_ ((v_rtGetArgsF dtb__320), (B_dData_dList.C_List__x58__x58_ ((v_rtTryReadDirF dtb__320), B_dData_dList.C_List_Nil))))))))))))))))))
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 1481 "Vuna/Compiler/Wasm/Module.vuna"
let v_genDefFuncGo = (fun (fuel : int) (st : t_GenState) (name : string) (arity : int) (inner : Ir_dModel.t_Ir) (paramScope : (Ir_dModel.t_IrBinder, string) B_dData_dPair.t_Pair B_dData_dList.t_List) (savedLocals : (string, Wasm_dModel.t_WatValTy) B_dData_dPair.t_Pair B_dData_dList.t_List) (savedNext : int) (savedScope : (Ir_dModel.t_IrBinder, string) B_dData_dPair.t_Pair B_dData_dList.t_List) -> ((fun st1 -> (match (((v_genExpr (fuel - 1)) st1) inner) with
  | B_dData_dResult.C_Result_Err (dtb__321) -> (B_dData_dResult.C_Result_Err (dtb__321))
  | B_dData_dResult.C_Result_Ok (dtb__322) -> ((fun bodyState -> ((fun func -> ((fun st2 -> (B_dData_dResult.C_Result_Ok ({ B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ (func, B_dData_dList.C_List_Nil)); B_dData_dPair.f_Pair_second = ((v_withTail false) st2) }))) ((((v_endFuncScope bodyState) savedLocals) savedNext) savedScope))) { Wasm_dModel.f_WatFunc_watFuncName = (Wasm_dTypes.v_watFuncNameOf name); Wasm_dModel.f_WatFunc_watFuncType = ""; Wasm_dModel.f_WatFunc_watFuncParams = (v_funcParams arity); Wasm_dModel.f_WatFunc_watFuncResults = (B_dData_dList.C_List__x58__x58_ (Wasm_dModel.C_WatValTy_WvAnyRef, B_dData_dList.C_List_Nil)); Wasm_dModel.f_WatFunc_watFuncLocals = (bodyState).f_GenState_gsLocals; Wasm_dModel.f_WatFunc_watFuncBody = (B_dData_dPair.v_firstOf dtb__322) })) (B_dData_dPair.v_secondOf dtb__322))
  | _ -> failwith "DT: impossible branch"
)) { st with f_GenState_gsScope = paramScope; f_GenState_gsTail = true }))

# 1464 "Vuna/Compiler/Wasm/Module.vuna"
let v_genDefFuncBody = (fun (fuel : int) (st : t_GenState) (name : string) (arity : int) (body : Ir_dModel.t_Ir) -> ((fun savedLocals -> ((fun savedNext -> ((fun savedScope -> ((fun st1 -> (match body with
  | Ir_dModel.C_Ir_IrLam (dtb__323, dtb__324, dtb__325) -> (match (v_runtimeBinders dtb__323) with
  | dtb__326 -> (if ((v_listLengthB dtb__326) <> arity) then (B_dData_dResult.C_Result_Err ((String.concat "" ["wasm target: function body lambda arity mismatch: `"; name; "`"]))) else (((((((((v_genDefFuncGo fuel) st1) name) arity) dtb__325) ((v_zipIdx 0) dtb__326)) savedLocals) savedNext) savedScope))
)
  | _ -> (B_dData_dResult.C_Result_Err ((String.concat "" ["wasm target: function body is not a lambda: `"; name; "`"])))
)) (v_beginFuncScope st))) (st).f_GenState_gsScope)) (st).f_GenState_gsNextLocal)) (st).f_GenState_gsLocals))

# 1458 "Vuna/Compiler/Wasm/Module.vuna"
let v_genDefFunc = (fun (mc0 : int) (mc1 : t_GenState) (mc2 : Ir_dModel.t_IrDef) -> (match mc2 with
  | Ir_dModel.C_IrDef_IrDef (dtb__327, dtb__328, dtb__329, dtb__330, dtb__331, dtb__332, dtb__333, dtb__334) -> (if (dtb__328 = 0) then (B_dData_dResult.C_Result_Ok ({ B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = mc1 })) else (((((v_genDefFuncBody mc0) mc1) dtb__327) dtb__328) dtb__331))
  | Ir_dModel.C_IrDef_IrExternDef (dtb__335, dtb__336, dtb__337, dtb__338) -> (B_dData_dResult.C_Result_Err ((String.concat "" ["wasm target: extern definition `"; dtb__335; "` is not supported yet"])))
  | _ -> failwith "DT: impossible branch"
))

# 1501 "Vuna/Compiler/Wasm/Module.vuna"
let rec v_genDefFuncs = (fun (mc0 : int) (mc1 : t_GenState) (mc2 : Ir_dModel.t_IrDef B_dData_dList.t_List) -> (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__339, dtb__340) -> (if (mc0 <= 0) then (B_dData_dResult.C_Result_Err ("wasm codegen fuel exhausted")) else (match (((v_genDefFunc mc0) mc1) dtb__339) with
  | B_dData_dResult.C_Result_Err (dtb__341) -> (B_dData_dResult.C_Result_Err (dtb__341))
  | B_dData_dResult.C_Result_Ok (dtb__342) -> (match (((v_genDefFuncs (mc0 - 1)) (B_dData_dPair.v_secondOf dtb__342)) dtb__340) with
  | B_dData_dResult.C_Result_Err (dtb__343) -> (B_dData_dResult.C_Result_Err (dtb__343))
  | B_dData_dResult.C_Result_Ok (dtb__344) -> (B_dData_dResult.C_Result_Ok ({ B_dData_dPair.f_Pair_first = ((B_dData_dList.v_append (B_dData_dPair.v_firstOf dtb__342)) (B_dData_dPair.v_firstOf dtb__344)); B_dData_dPair.f_Pair_second = (B_dData_dPair.v_secondOf dtb__344) }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))
  | B_dData_dList.C_List_Nil -> (B_dData_dResult.C_Result_Ok ({ B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = mc1 }))
  | _ -> failwith "DT: impossible branch"
))

# 1517 "Vuna/Compiler/Wasm/Module.vuna"
let v_genDefInit = (fun (mc0 : int) (mc1 : t_GenState) (mc2 : Ir_dModel.t_IrDef) -> (match mc2 with
  | Ir_dModel.C_IrDef_IrDef (dtb__345, dtb__346, dtb__347, dtb__348, dtb__349, dtb__350, dtb__351, dtb__352) -> (if (dtb__346 <> 0) then (B_dData_dResult.C_Result_Ok ({ B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = mc1 })) else ((fun st1 -> (match (((v_genExpr (mc0 - 1)) st1) (Ir_dTail.v_stripTail dtb__349)) with
  | B_dData_dResult.C_Result_Err (dtb__353) -> (B_dData_dResult.C_Result_Err (dtb__353))
  | B_dData_dResult.C_Result_Ok (dtb__354) -> (B_dData_dResult.C_Result_Ok ({ B_dData_dPair.f_Pair_first = ((B_dData_dList.v_append (B_dData_dPair.v_firstOf dtb__354)) (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IGlobalSet ((Wasm_dTypes.v_watGlobalNameOf dtb__345))), B_dData_dList.C_List_Nil))); B_dData_dPair.f_Pair_second = (B_dData_dPair.v_secondOf dtb__354) }))
  | _ -> failwith "DT: impossible branch"
)) ((v_restoreScope B_dData_dList.C_List_Nil) mc1)))
  | Ir_dModel.C_IrDef_IrExternDef (dtb__355, dtb__356, dtb__357, dtb__358) -> (B_dData_dResult.C_Result_Err ("extern definition reached wasm codegen"))
  | _ -> failwith "DT: impossible branch"
))

# 1529 "Vuna/Compiler/Wasm/Module.vuna"
let rec v_genDefsInits = (fun (mc0 : int) (mc1 : t_GenState) (mc2 : Ir_dModel.t_IrDef B_dData_dList.t_List) -> (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__359, dtb__360) -> (if (mc0 <= 0) then (B_dData_dResult.C_Result_Err ("wasm codegen fuel exhausted")) else (match (((v_genDefInit (mc0 - 1)) mc1) dtb__359) with
  | B_dData_dResult.C_Result_Err (dtb__361) -> (B_dData_dResult.C_Result_Err (dtb__361))
  | B_dData_dResult.C_Result_Ok (dtb__362) -> (match (((v_genDefsInits (mc0 - 1)) (B_dData_dPair.v_secondOf dtb__362)) dtb__360) with
  | B_dData_dResult.C_Result_Err (dtb__363) -> (B_dData_dResult.C_Result_Err (dtb__363))
  | B_dData_dResult.C_Result_Ok (dtb__364) -> (B_dData_dResult.C_Result_Ok ({ B_dData_dPair.f_Pair_first = ((B_dData_dList.v_append (B_dData_dPair.v_firstOf dtb__362)) (B_dData_dPair.v_firstOf dtb__364)); B_dData_dPair.f_Pair_second = (B_dData_dPair.v_secondOf dtb__364) }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))
  | B_dData_dList.C_List_Nil -> (B_dData_dResult.C_Result_Ok ({ B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = mc1 }))
  | _ -> failwith "DT: impossible branch"
))

# 1587 "Vuna/Compiler/Wasm/Module.vuna"
let v_baseTypes = (B_dData_dList.C_List__x58__x58_ ((Wasm_dModel.C_WatType_WatFuncType ("$ft", (B_dData_dList.C_List__x58__x58_ (Wasm_dModel.C_WatValTy_WvAnyRef, (B_dData_dList.C_List__x58__x58_ (Wasm_dModel.C_WatValTy_WvAnyRef, B_dData_dList.C_List_Nil)))), (B_dData_dList.C_List__x58__x58_ (Wasm_dModel.C_WatValTy_WvAnyRef, B_dData_dList.C_List_Nil)))), (B_dData_dList.C_List__x58__x58_ ((Wasm_dModel.C_WatType_WatStructType ("$clo", (B_dData_dList.C_List__x58__x58_ ({ Wasm_dModel.f_WatField_watFieldMut = false; Wasm_dModel.f_WatField_watFieldTy = (Wasm_dModel.C_WatValTy_WvRef ("$ft")) }, (B_dData_dList.C_List__x58__x58_ ({ Wasm_dModel.f_WatField_watFieldMut = false; Wasm_dModel.f_WatField_watFieldTy = Wasm_dModel.C_WatValTy_WvAnyRef }, B_dData_dList.C_List_Nil)))))), (B_dData_dList.C_List__x58__x58_ ((Wasm_dModel.C_WatType_WatArrayType ("$env", false, Wasm_dModel.C_WatValTy_WvAnyRef)), (B_dData_dList.C_List__x58__x58_ ((Wasm_dModel.C_WatType_WatStructType ("$int", (B_dData_dList.C_List__x58__x58_ ({ Wasm_dModel.f_WatField_watFieldMut = false; Wasm_dModel.f_WatField_watFieldTy = Wasm_dModel.C_WatValTy_WvI64 }, B_dData_dList.C_List_Nil)))), (B_dData_dList.C_List__x58__x58_ ((Wasm_dModel.C_WatType_WatStructType ("$float", (B_dData_dList.C_List__x58__x58_ ({ Wasm_dModel.f_WatField_watFieldMut = false; Wasm_dModel.f_WatField_watFieldTy = Wasm_dModel.C_WatValTy_WvF64 }, B_dData_dList.C_List_Nil)))), (B_dData_dList.C_List__x58__x58_ ((Wasm_dModel.C_WatType_WatArrayType ("$str", true, Wasm_dModel.C_WatValTy_WvI8)), (B_dData_dList.C_List__x58__x58_ ((Wasm_dModel.C_WatType_WatArrayType ("$arr", true, Wasm_dModel.C_WatValTy_WvAnyRef)), (B_dData_dList.C_List__x58__x58_ ((Wasm_dModel.C_WatType_WatStructType ("$clean", (B_dData_dList.C_List__x58__x58_ ({ Wasm_dModel.f_WatField_watFieldMut = false; Wasm_dModel.f_WatField_watFieldTy = Wasm_dModel.C_WatValTy_WvAnyRef }, (B_dData_dList.C_List__x58__x58_ ({ Wasm_dModel.f_WatField_watFieldMut = false; Wasm_dModel.f_WatField_watFieldTy = Wasm_dModel.C_WatValTy_WvAnyRef }, B_dData_dList.C_List_Nil)))))), B_dData_dList.C_List_Nil))))))))))))))))

# 1600 "Vuna/Compiler/Wasm/Module.vuna"
let v_baseImports = (B_dData_dList.C_List__x58__x58_ ({ Wasm_dModel.f_WatImport_watImportModule = "wasi_snapshot_preview1"; Wasm_dModel.f_WatImport_watImportName = "fd_write"; Wasm_dModel.f_WatImport_watImportFunc = "$fd_write"; Wasm_dModel.f_WatImport_watImportParams = (B_dData_dList.C_List__x58__x58_ (Wasm_dModel.C_WatValTy_WvI32, (B_dData_dList.C_List__x58__x58_ (Wasm_dModel.C_WatValTy_WvI32, (B_dData_dList.C_List__x58__x58_ (Wasm_dModel.C_WatValTy_WvI32, (B_dData_dList.C_List__x58__x58_ (Wasm_dModel.C_WatValTy_WvI32, B_dData_dList.C_List_Nil)))))))); Wasm_dModel.f_WatImport_watImportResults = (B_dData_dList.C_List__x58__x58_ (Wasm_dModel.C_WatValTy_WvI32, B_dData_dList.C_List_Nil)) }, (B_dData_dList.C_List__x58__x58_ ({ Wasm_dModel.f_WatImport_watImportModule = "wasi_snapshot_preview1"; Wasm_dModel.f_WatImport_watImportName = "fd_read"; Wasm_dModel.f_WatImport_watImportFunc = "$fd_read"; Wasm_dModel.f_WatImport_watImportParams = (B_dData_dList.C_List__x58__x58_ (Wasm_dModel.C_WatValTy_WvI32, (B_dData_dList.C_List__x58__x58_ (Wasm_dModel.C_WatValTy_WvI32, (B_dData_dList.C_List__x58__x58_ (Wasm_dModel.C_WatValTy_WvI32, (B_dData_dList.C_List__x58__x58_ (Wasm_dModel.C_WatValTy_WvI32, B_dData_dList.C_List_Nil)))))))); Wasm_dModel.f_WatImport_watImportResults = (B_dData_dList.C_List__x58__x58_ (Wasm_dModel.C_WatValTy_WvI32, B_dData_dList.C_List_Nil)) }, (B_dData_dList.C_List__x58__x58_ ({ Wasm_dModel.f_WatImport_watImportModule = "wasi_snapshot_preview1"; Wasm_dModel.f_WatImport_watImportName = "fd_close"; Wasm_dModel.f_WatImport_watImportFunc = "$fd_close"; Wasm_dModel.f_WatImport_watImportParams = (B_dData_dList.C_List__x58__x58_ (Wasm_dModel.C_WatValTy_WvI32, B_dData_dList.C_List_Nil)); Wasm_dModel.f_WatImport_watImportResults = (B_dData_dList.C_List__x58__x58_ (Wasm_dModel.C_WatValTy_WvI32, B_dData_dList.C_List_Nil)) }, (B_dData_dList.C_List__x58__x58_ ({ Wasm_dModel.f_WatImport_watImportModule = "wasi_snapshot_preview1"; Wasm_dModel.f_WatImport_watImportName = "path_open"; Wasm_dModel.f_WatImport_watImportFunc = "$path_open"; Wasm_dModel.f_WatImport_watImportParams = (B_dData_dList.C_List__x58__x58_ (Wasm_dModel.C_WatValTy_WvI32, (B_dData_dList.C_List__x58__x58_ (Wasm_dModel.C_WatValTy_WvI32, (B_dData_dList.C_List__x58__x58_ (Wasm_dModel.C_WatValTy_WvI32, (B_dData_dList.C_List__x58__x58_ (Wasm_dModel.C_WatValTy_WvI32, (B_dData_dList.C_List__x58__x58_ (Wasm_dModel.C_WatValTy_WvI32, (B_dData_dList.C_List__x58__x58_ (Wasm_dModel.C_WatValTy_WvI64, (B_dData_dList.C_List__x58__x58_ (Wasm_dModel.C_WatValTy_WvI64, (B_dData_dList.C_List__x58__x58_ (Wasm_dModel.C_WatValTy_WvI32, (B_dData_dList.C_List__x58__x58_ (Wasm_dModel.C_WatValTy_WvI32, B_dData_dList.C_List_Nil)))))))))))))))))); Wasm_dModel.f_WatImport_watImportResults = (B_dData_dList.C_List__x58__x58_ (Wasm_dModel.C_WatValTy_WvI32, B_dData_dList.C_List_Nil)) }, (B_dData_dList.C_List__x58__x58_ ({ Wasm_dModel.f_WatImport_watImportModule = "wasi_snapshot_preview1"; Wasm_dModel.f_WatImport_watImportName = "path_filestat_get"; Wasm_dModel.f_WatImport_watImportFunc = "$path_filestat_get"; Wasm_dModel.f_WatImport_watImportParams = (B_dData_dList.C_List__x58__x58_ (Wasm_dModel.C_WatValTy_WvI32, (B_dData_dList.C_List__x58__x58_ (Wasm_dModel.C_WatValTy_WvI32, (B_dData_dList.C_List__x58__x58_ (Wasm_dModel.C_WatValTy_WvI32, (B_dData_dList.C_List__x58__x58_ (Wasm_dModel.C_WatValTy_WvI32, (B_dData_dList.C_List__x58__x58_ (Wasm_dModel.C_WatValTy_WvI32, B_dData_dList.C_List_Nil)))))))))); Wasm_dModel.f_WatImport_watImportResults = (B_dData_dList.C_List__x58__x58_ (Wasm_dModel.C_WatValTy_WvI32, B_dData_dList.C_List_Nil)) }, (B_dData_dList.C_List__x58__x58_ ({ Wasm_dModel.f_WatImport_watImportModule = "wasi_snapshot_preview1"; Wasm_dModel.f_WatImport_watImportName = "path_create_directory"; Wasm_dModel.f_WatImport_watImportFunc = "$path_create_directory"; Wasm_dModel.f_WatImport_watImportParams = (B_dData_dList.C_List__x58__x58_ (Wasm_dModel.C_WatValTy_WvI32, (B_dData_dList.C_List__x58__x58_ (Wasm_dModel.C_WatValTy_WvI32, (B_dData_dList.C_List__x58__x58_ (Wasm_dModel.C_WatValTy_WvI32, B_dData_dList.C_List_Nil)))))); Wasm_dModel.f_WatImport_watImportResults = (B_dData_dList.C_List__x58__x58_ (Wasm_dModel.C_WatValTy_WvI32, B_dData_dList.C_List_Nil)) }, (B_dData_dList.C_List__x58__x58_ ({ Wasm_dModel.f_WatImport_watImportModule = "wasi_snapshot_preview1"; Wasm_dModel.f_WatImport_watImportName = "path_remove_directory"; Wasm_dModel.f_WatImport_watImportFunc = "$path_remove_directory"; Wasm_dModel.f_WatImport_watImportParams = (B_dData_dList.C_List__x58__x58_ (Wasm_dModel.C_WatValTy_WvI32, (B_dData_dList.C_List__x58__x58_ (Wasm_dModel.C_WatValTy_WvI32, (B_dData_dList.C_List__x58__x58_ (Wasm_dModel.C_WatValTy_WvI32, B_dData_dList.C_List_Nil)))))); Wasm_dModel.f_WatImport_watImportResults = (B_dData_dList.C_List__x58__x58_ (Wasm_dModel.C_WatValTy_WvI32, B_dData_dList.C_List_Nil)) }, (B_dData_dList.C_List__x58__x58_ ({ Wasm_dModel.f_WatImport_watImportModule = "wasi_snapshot_preview1"; Wasm_dModel.f_WatImport_watImportName = "path_unlink_file"; Wasm_dModel.f_WatImport_watImportFunc = "$path_unlink_file"; Wasm_dModel.f_WatImport_watImportParams = (B_dData_dList.C_List__x58__x58_ (Wasm_dModel.C_WatValTy_WvI32, (B_dData_dList.C_List__x58__x58_ (Wasm_dModel.C_WatValTy_WvI32, (B_dData_dList.C_List__x58__x58_ (Wasm_dModel.C_WatValTy_WvI32, B_dData_dList.C_List_Nil)))))); Wasm_dModel.f_WatImport_watImportResults = (B_dData_dList.C_List__x58__x58_ (Wasm_dModel.C_WatValTy_WvI32, B_dData_dList.C_List_Nil)) }, (B_dData_dList.C_List__x58__x58_ ({ Wasm_dModel.f_WatImport_watImportModule = "wasi_snapshot_preview1"; Wasm_dModel.f_WatImport_watImportName = "path_rename"; Wasm_dModel.f_WatImport_watImportFunc = "$path_rename"; Wasm_dModel.f_WatImport_watImportParams = (B_dData_dList.C_List__x58__x58_ (Wasm_dModel.C_WatValTy_WvI32, (B_dData_dList.C_List__x58__x58_ (Wasm_dModel.C_WatValTy_WvI32, (B_dData_dList.C_List__x58__x58_ (Wasm_dModel.C_WatValTy_WvI32, (B_dData_dList.C_List__x58__x58_ (Wasm_dModel.C_WatValTy_WvI32, (B_dData_dList.C_List__x58__x58_ (Wasm_dModel.C_WatValTy_WvI32, (B_dData_dList.C_List__x58__x58_ (Wasm_dModel.C_WatValTy_WvI32, B_dData_dList.C_List_Nil)))))))))))); Wasm_dModel.f_WatImport_watImportResults = (B_dData_dList.C_List__x58__x58_ (Wasm_dModel.C_WatValTy_WvI32, B_dData_dList.C_List_Nil)) }, (B_dData_dList.C_List__x58__x58_ ({ Wasm_dModel.f_WatImport_watImportModule = "wasi_snapshot_preview1"; Wasm_dModel.f_WatImport_watImportName = "fd_readdir"; Wasm_dModel.f_WatImport_watImportFunc = "$fd_readdir"; Wasm_dModel.f_WatImport_watImportParams = (B_dData_dList.C_List__x58__x58_ (Wasm_dModel.C_WatValTy_WvI32, (B_dData_dList.C_List__x58__x58_ (Wasm_dModel.C_WatValTy_WvI32, (B_dData_dList.C_List__x58__x58_ (Wasm_dModel.C_WatValTy_WvI32, (B_dData_dList.C_List__x58__x58_ (Wasm_dModel.C_WatValTy_WvI64, (B_dData_dList.C_List__x58__x58_ (Wasm_dModel.C_WatValTy_WvI32, B_dData_dList.C_List_Nil)))))))))); Wasm_dModel.f_WatImport_watImportResults = (B_dData_dList.C_List__x58__x58_ (Wasm_dModel.C_WatValTy_WvI32, B_dData_dList.C_List_Nil)) }, (B_dData_dList.C_List__x58__x58_ ({ Wasm_dModel.f_WatImport_watImportModule = "wasi_snapshot_preview1"; Wasm_dModel.f_WatImport_watImportName = "environ_sizes_get"; Wasm_dModel.f_WatImport_watImportFunc = "$environ_sizes_get"; Wasm_dModel.f_WatImport_watImportParams = (B_dData_dList.C_List__x58__x58_ (Wasm_dModel.C_WatValTy_WvI32, (B_dData_dList.C_List__x58__x58_ (Wasm_dModel.C_WatValTy_WvI32, B_dData_dList.C_List_Nil)))); Wasm_dModel.f_WatImport_watImportResults = (B_dData_dList.C_List__x58__x58_ (Wasm_dModel.C_WatValTy_WvI32, B_dData_dList.C_List_Nil)) }, (B_dData_dList.C_List__x58__x58_ ({ Wasm_dModel.f_WatImport_watImportModule = "wasi_snapshot_preview1"; Wasm_dModel.f_WatImport_watImportName = "environ_get"; Wasm_dModel.f_WatImport_watImportFunc = "$environ_get"; Wasm_dModel.f_WatImport_watImportParams = (B_dData_dList.C_List__x58__x58_ (Wasm_dModel.C_WatValTy_WvI32, (B_dData_dList.C_List__x58__x58_ (Wasm_dModel.C_WatValTy_WvI32, B_dData_dList.C_List_Nil)))); Wasm_dModel.f_WatImport_watImportResults = (B_dData_dList.C_List__x58__x58_ (Wasm_dModel.C_WatValTy_WvI32, B_dData_dList.C_List_Nil)) }, (B_dData_dList.C_List__x58__x58_ ({ Wasm_dModel.f_WatImport_watImportModule = "wasi_snapshot_preview1"; Wasm_dModel.f_WatImport_watImportName = "args_sizes_get"; Wasm_dModel.f_WatImport_watImportFunc = "$args_sizes_get"; Wasm_dModel.f_WatImport_watImportParams = (B_dData_dList.C_List__x58__x58_ (Wasm_dModel.C_WatValTy_WvI32, (B_dData_dList.C_List__x58__x58_ (Wasm_dModel.C_WatValTy_WvI32, B_dData_dList.C_List_Nil)))); Wasm_dModel.f_WatImport_watImportResults = (B_dData_dList.C_List__x58__x58_ (Wasm_dModel.C_WatValTy_WvI32, B_dData_dList.C_List_Nil)) }, (B_dData_dList.C_List__x58__x58_ ({ Wasm_dModel.f_WatImport_watImportModule = "wasi_snapshot_preview1"; Wasm_dModel.f_WatImport_watImportName = "args_get"; Wasm_dModel.f_WatImport_watImportFunc = "$args_get"; Wasm_dModel.f_WatImport_watImportParams = (B_dData_dList.C_List__x58__x58_ (Wasm_dModel.C_WatValTy_WvI32, (B_dData_dList.C_List__x58__x58_ (Wasm_dModel.C_WatValTy_WvI32, B_dData_dList.C_List_Nil)))); Wasm_dModel.f_WatImport_watImportResults = (B_dData_dList.C_List__x58__x58_ (Wasm_dModel.C_WatValTy_WvI32, B_dData_dList.C_List_Nil)) }, (B_dData_dList.C_List__x58__x58_ ({ Wasm_dModel.f_WatImport_watImportModule = "wasi_snapshot_preview1"; Wasm_dModel.f_WatImport_watImportName = "clock_time_get"; Wasm_dModel.f_WatImport_watImportFunc = "$clock_time_get"; Wasm_dModel.f_WatImport_watImportParams = (B_dData_dList.C_List__x58__x58_ (Wasm_dModel.C_WatValTy_WvI32, (B_dData_dList.C_List__x58__x58_ (Wasm_dModel.C_WatValTy_WvI64, (B_dData_dList.C_List__x58__x58_ (Wasm_dModel.C_WatValTy_WvI32, B_dData_dList.C_List_Nil)))))); Wasm_dModel.f_WatImport_watImportResults = (B_dData_dList.C_List__x58__x58_ (Wasm_dModel.C_WatValTy_WvI32, B_dData_dList.C_List_Nil)) }, (B_dData_dList.C_List__x58__x58_ ({ Wasm_dModel.f_WatImport_watImportModule = "wasi_snapshot_preview1"; Wasm_dModel.f_WatImport_watImportName = "proc_exit"; Wasm_dModel.f_WatImport_watImportFunc = "$proc_exit"; Wasm_dModel.f_WatImport_watImportParams = (B_dData_dList.C_List__x58__x58_ (Wasm_dModel.C_WatValTy_WvI32, B_dData_dList.C_List_Nil)); Wasm_dModel.f_WatImport_watImportResults = B_dData_dList.C_List_Nil }, B_dData_dList.C_List_Nil))))))))))))))))))))))))))))))))

# 1670 "Vuna/Compiler/Wasm/Module.vuna"
let v_globalOfDef = (fun (d : Ir_dModel.t_IrDef) -> (if ((Ir_dModel.v_irDefArity d) = 0) then (B_dData_dList.C_List__x58__x58_ ({ Wasm_dModel.f_WatGlobal_watGlobalName = (Wasm_dTypes.v_watGlobalNameOf (Ir_dModel.v_irDefName d)); Wasm_dModel.f_WatGlobal_watGlobalTy = Wasm_dModel.C_WatValTy_WvAnyRef; Wasm_dModel.f_WatGlobal_watGlobalInit = (B_dData_dList.C_List__x58__x58_ (Wasm_dInstr.C_Instr_IRefNull, B_dData_dList.C_List_Nil)) }, B_dData_dList.C_List_Nil)) else B_dData_dList.C_List_Nil))

# 1667 "Vuna/Compiler/Wasm/Module.vuna"
let v_globalsOf = (fun (defs : Ir_dModel.t_IrDef B_dData_dList.t_List) -> ((B_dData_dList.v_concatMap v_globalOfDef) defs))

# 1674 "Vuna/Compiler/Wasm/Module.vuna"
let rec v_concatMapType = (fun (mc0 : Wasm_dTypes.t_WasmFam B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__365, dtb__366) -> (match (Wasm_dTypes.v_wasmFamType dtb__365) with
  | B_dData_dMaybe.C_Maybe_Nothing -> (v_concatMapType dtb__366)
  | B_dData_dMaybe.C_Maybe_Just (dtb__367) -> (B_dData_dList.C_List__x58__x58_ (dtb__367, (v_concatMapType dtb__366)))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 1682 "Vuna/Compiler/Wasm/Module.vuna"
let v_effSymbols = (B_dData_dList.C_List__x58__x58_ ("prim_effectPerformId", (B_dData_dList.C_List__x58__x58_ ("prim_effectHandleId", (B_dData_dList.C_List__x58__x58_ ("prim_effectSelf", B_dData_dList.C_List_Nil))))))

# 1686 "Vuna/Compiler/Wasm/Module.vuna"
let v_effScanFuel = 100000

# 1689 "Vuna/Compiler/Wasm/Module.vuna"
let rec v_anyIrSym = (fun (mc0 : int) (mc1 : string B_dData_dList.t_List) (mc2 : Ir_dModel.t_Ir B_dData_dList.t_List) -> (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__368, dtb__369) -> (if (((v_irUsesSyms (mc0 - 1)) mc1) dtb__368) then true else (((v_anyIrSym (mc0 - 1)) mc1) dtb__369))
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))
# 1694 "Vuna/Compiler/Wasm/Module.vuna"
and v_anyAltSym = (fun (mc0 : int) (mc1 : string B_dData_dList.t_List) (mc2 : Ir_dModel.t_IrAlt B_dData_dList.t_List) -> (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__370, dtb__371) -> (if (((v_irUsesSyms (mc0 - 1)) mc1) (dtb__370).Ir_dModel.f_IrAlt_irAltBody) then true else (((v_anyAltSym (mc0 - 1)) mc1) dtb__371))
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))
# 1699 "Vuna/Compiler/Wasm/Module.vuna"
and v_altMaybeSym = (fun (mc0 : int) (mc1 : string B_dData_dList.t_List) (mc2 : Ir_dModel.t_IrAlt B_dData_dMaybe.t_Maybe) -> (match mc2 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__372) -> (((v_irUsesSyms (mc0 - 1)) mc1) (dtb__372).Ir_dModel.f_IrAlt_irAltBody)
  | B_dData_dMaybe.C_Maybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
))
# 1703 "Vuna/Compiler/Wasm/Module.vuna"
and v_fieldSym = (fun (mc0 : int) (mc1 : string B_dData_dList.t_List) (mc2 : (string, Ir_dModel.t_Ir) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__373, dtb__374) -> (match dtb__373 with
  | { B_dData_dPair.f_Pair_first = dtb__375; B_dData_dPair.f_Pair_second = dtb__376 } -> (if (((v_irUsesSyms (mc0 - 1)) mc1) dtb__376) then true else (((v_fieldSym (mc0 - 1)) mc1) dtb__374))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))
# 1709 "Vuna/Compiler/Wasm/Module.vuna"
and v_irUsesSyms = (fun (fuel : int) (syms : string B_dData_dList.t_List) (ir : Ir_dModel.t_Ir) -> (if (fuel <= 0) then true else (match ir with
  | Ir_dModel.C_Ir_IrVar (dtb__377) -> false
  | Ir_dModel.C_Ir_IrGlobal (dtb__378) -> false
  | Ir_dModel.C_Ir_IrCtor (dtb__379, dtb__380, dtb__381, dtb__382) -> (((v_anyIrSym fuel) syms) dtb__382)
  | Ir_dModel.C_Ir_IrRecord (dtb__383, dtb__384, dtb__385) -> (((v_fieldSym fuel) syms) dtb__385)
  | Ir_dModel.C_Ir_IrProj (dtb__386, dtb__387, dtb__388, dtb__389) -> (((v_irUsesSyms (fuel - 1)) syms) dtb__386)
  | Ir_dModel.C_Ir_IrRecUpd (dtb__390, dtb__391, dtb__392, dtb__393) -> (if (((v_irUsesSyms (fuel - 1)) syms) dtb__390) then true else (((v_fieldSym fuel) syms) dtb__392))
  | Ir_dModel.C_Ir_IrRt (dtb__394) -> ((B_dData_dList.v_memName dtb__394) syms)
  | Ir_dModel.C_Ir_IrRtApp (dtb__395, dtb__396) -> (if ((B_dData_dList.v_memName dtb__395) syms) then true else (((v_anyIrSym fuel) syms) dtb__396))
  | Ir_dModel.C_Ir_IrCast (dtb__397, dtb__398, dtb__399) -> (((v_irUsesSyms (fuel - 1)) syms) dtb__399)
  | Ir_dModel.C_Ir_IrInt (dtb__400) -> false
  | Ir_dModel.C_Ir_IrStr (dtb__401) -> false
  | Ir_dModel.C_Ir_IrBool (dtb__402) -> false
  | Ir_dModel.C_Ir_IrFloatLit (dtb__403) -> false
  | Ir_dModel.C_Ir_IrLet (dtb__404, dtb__405, dtb__406) -> (if (((v_irUsesSyms (fuel - 1)) syms) dtb__405) then true else (((v_irUsesSyms (fuel - 1)) syms) dtb__406))
  | Ir_dModel.C_Ir_IrLam (dtb__407, dtb__408, dtb__409) -> (((v_irUsesSyms (fuel - 1)) syms) dtb__409)
  | Ir_dModel.C_Ir_IrApp (dtb__410, dtb__411, dtb__412) -> (if (((v_irUsesSyms (fuel - 1)) syms) dtb__411) then true else (((v_irUsesSyms (fuel - 1)) syms) dtb__412))
  | Ir_dModel.C_Ir_IrIf (dtb__413, dtb__414, dtb__415) -> (if (((v_irUsesSyms (fuel - 1)) syms) dtb__413) then true else (if (((v_irUsesSyms (fuel - 1)) syms) dtb__414) then true else (((v_irUsesSyms (fuel - 1)) syms) dtb__415)))
  | Ir_dModel.C_Ir_IrCase (dtb__416, dtb__417, dtb__418, dtb__419) -> (if (((v_irUsesSyms (fuel - 1)) syms) dtb__418) then true else (((v_anyAltSym fuel) syms) dtb__419))
  | Ir_dModel.C_Ir_IrNatCase (dtb__420, dtb__421, dtb__422, dtb__423, dtb__424) -> (if (((v_irUsesSyms (fuel - 1)) syms) dtb__420) then true else (if (((v_altMaybeSym fuel) syms) dtb__422) then true else (if (((v_altMaybeSym fuel) syms) dtb__423) then true else (((v_altMaybeSym fuel) syms) dtb__424))))
  | Ir_dModel.C_Ir_IrConcatMany (dtb__425) -> (((v_anyIrSym fuel) syms) dtb__425)
  | Ir_dModel.C_Ir_IrEffThunk (dtb__426, dtb__427, dtb__428, dtb__429, dtb__430) -> false
  | Ir_dModel.C_Ir_IrTail (dtb__431) -> (((v_irUsesSyms (fuel - 1)) syms) dtb__431)
  | Ir_dModel.C_Ir_IrEffBind (dtb__432, dtb__433, dtb__434) -> false
  | _ -> failwith "DT: impossible branch"
)))

# 1740 "Vuna/Compiler/Wasm/Module.vuna"
let v_performSyms = (B_dData_dList.C_List__x58__x58_ ("prim_effectPerformId", (B_dData_dList.C_List__x58__x58_ ("prim_effectHandleId", (B_dData_dList.C_List__x58__x58_ ("prim_effectSelf", B_dData_dList.C_List_Nil))))))

# 1743 "Vuna/Compiler/Wasm/Module.vuna"
let v_defUsesSyms = (fun (syms : string B_dData_dList.t_List) (d : Ir_dModel.t_IrDef) -> (match (Ir_dModel.v_irDefBody d) with
  | B_dData_dMaybe.C_Maybe_Nothing -> false
  | B_dData_dMaybe.C_Maybe_Just (dtb__435) -> (((v_irUsesSyms v_effScanFuel) syms) dtb__435)
  | _ -> failwith "DT: impossible branch"
))

# 1749 "Vuna/Compiler/Wasm/Module.vuna"
let rec v_defsUseSyms = (fun (mc0 : string B_dData_dList.t_List) (mc1 : Ir_dModel.t_IrDef B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__436, dtb__437) -> (if ((v_defUsesSyms mc0) dtb__436) then true else ((v_defsUseSyms mc0) dtb__437))
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 1754 "Vuna/Compiler/Wasm/Module.vuna"
let rec v_anyHostHandled = (fun (mc0 : Base_dIntrinsics.t_HostClass B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__438, dtb__439) -> (match dtb__438 with
  | Base_dIntrinsics.C_HostClass_HostHandled -> true
  | _ -> (v_anyHostHandled dtb__439)
)
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 1761 "Vuna/Compiler/Wasm/Module.vuna"
let v_listNull = (fun mc0 -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__440, dtb__441) -> false
  | B_dData_dList.C_List_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

# 1813 "Vuna/Compiler/Wasm/Module.vuna"
let v_hcPureK = "@vuna@host@pureK"

# 1817 "Vuna/Compiler/Wasm/Module.vuna"
let rec v_spineOf = (fun (mc0 : Ir_dModel.t_Ir) -> (match mc0 with
  | Ir_dModel.C_Ir_IrTail (dtb__442) -> (v_spineOf dtb__442)
  | Ir_dModel.C_Ir_IrApp (dtb__443, dtb__444, dtb__445) -> (match (v_spineOf dtb__444) with
  | { B_dData_dPair.f_Pair_first = dtb__446; B_dData_dPair.f_Pair_second = dtb__447 } -> { B_dData_dPair.f_Pair_first = dtb__446; B_dData_dPair.f_Pair_second = ((B_dData_dList.v_append dtb__447) (B_dData_dList.C_List__x58__x58_ (dtb__445, B_dData_dList.C_List_Nil))) }
  | _ -> failwith "DT: impossible branch"
)
  | _ -> { B_dData_dPair.f_Pair_first = mc0; B_dData_dPair.f_Pair_second = B_dData_dList.C_List_Nil }
))

# 1825 "Vuna/Compiler/Wasm/Module.vuna"
let v_opFieldOf = (fun (mc0 : Ir_dModel.t_Ir) -> (match mc0 with
  | Ir_dModel.C_Ir_IrCtor (dtb__448, dtb__449, dtb__450, dtb__451) -> (match dtb__451 with
  | B_dData_dList.C_List__x58__x58_ (dtb__452, dtb__453) -> (match dtb__453 with
  | B_dData_dList.C_List_Nil -> dtb__452
  | _ -> mc0
)
  | _ -> mc0
)
  | _ -> mc0
))

# 1830 "Vuna/Compiler/Wasm/Module.vuna"
let v_directSend = (fun (runName : string) (opHName : string) (op : Ir_dModel.t_Ir) -> ((fun u -> ((fun applied -> ((fun ran -> (Ir_dModel.C_Ir_IrCtor (Ir_dModel.v_irEffTypeName, Ir_dModel.v_irEffMkCtor, B_dData_dMaybe.C_Maybe_Nothing, (B_dData_dList.C_List__x58__x58_ ((Ir_dModel.C_Ir_IrLam ((B_dData_dList.C_List__x58__x58_ (u, B_dData_dList.C_List_Nil)), B_dData_dMaybe.C_Maybe_Nothing, ran)), B_dData_dList.C_List_Nil))))) (Ir_dModel.C_Ir_IrApp (B_dData_dMaybe.C_Maybe_Nothing, (Ir_dModel.C_Ir_IrGlobal (runName)), applied)))) (Ir_dModel.C_Ir_IrApp (B_dData_dMaybe.C_Maybe_Nothing, (Ir_dModel.C_Ir_IrApp (B_dData_dMaybe.C_Maybe_Nothing, (Ir_dModel.C_Ir_IrGlobal (opHName)), op)), (Ir_dModel.C_Ir_IrGlobal (v_hcPureK)))))) (Ir_dModel.v_mkIrBinder "hostUnit")))

# 1839 "Vuna/Compiler/Wasm/Module.vuna"
let v_abortSend = (fun (textName : string) (op : Ir_dModel.t_Ir) -> ((fun u -> ((fun dead -> ((fun msg -> ((fun eprinted -> ((fun exited -> (Ir_dModel.C_Ir_IrCtor (Ir_dModel.v_irEffTypeName, Ir_dModel.v_irEffMkCtor, B_dData_dMaybe.C_Maybe_Nothing, (B_dData_dList.C_List__x58__x58_ ((Ir_dModel.C_Ir_IrLam ((B_dData_dList.C_List__x58__x58_ (u, B_dData_dList.C_List_Nil)), B_dData_dMaybe.C_Maybe_Nothing, (Ir_dModel.C_Ir_IrApp (B_dData_dMaybe.C_Maybe_Nothing, (Ir_dModel.C_Ir_IrLam ((B_dData_dList.C_List__x58__x58_ (dead, B_dData_dList.C_List_Nil)), B_dData_dMaybe.C_Maybe_Nothing, exited)), eprinted)))), B_dData_dList.C_List_Nil))))) (Ir_dModel.C_Ir_IrRtApp ("@vuna@prim_eff_exit", (B_dData_dList.C_List__x58__x58_ ((Ir_dModel.C_Ir_IrInt (1)), B_dData_dList.C_List_Nil)))))) (Ir_dModel.C_Ir_IrRtApp ("@vuna@prim_eff_eprint", (B_dData_dList.C_List__x58__x58_ (msg, B_dData_dList.C_List_Nil)))))) (Ir_dModel.C_Ir_IrConcatMany ((B_dData_dList.C_List__x58__x58_ ((Ir_dModel.C_Ir_IrStr ("vuna: ")), (B_dData_dList.C_List__x58__x58_ ((Ir_dModel.C_Ir_IrApp (B_dData_dMaybe.C_Maybe_Nothing, (Ir_dModel.C_Ir_IrGlobal (textName)), (v_opFieldOf op))), (B_dData_dList.C_List__x58__x58_ ((Ir_dModel.C_Ir_IrStr ("\n")), B_dData_dList.C_List_Nil)))))))))) (Ir_dModel.v_mkIrBinder "hostDead"))) (Ir_dModel.v_mkIrBinder "hostUnit")))

# 1885 "Vuna/Compiler/Wasm/Module.vuna"
let rec v_stripIrCasts = (fun (mc0 : Ir_dModel.t_Ir) -> (match mc0 with
  | Ir_dModel.C_Ir_IrCast (dtb__454, dtb__455, dtb__456) -> (v_stripIrCasts dtb__456)
  | _ -> mc0
))

# 1875 "Vuna/Compiler/Wasm/Module.vuna"
let v_sendTailOf = (fun (args : Ir_dModel.t_Ir B_dData_dList.t_List) -> ((fun nd_uscrut1 -> (match nd_uscrut1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__457, dtb__458) -> (match dtb__458 with
  | B_dData_dList.C_List__x58__x58_ (dtb__459, dtb__460) -> (match dtb__460 with
  | B_dData_dList.C_List__x58__x58_ (dtb__461, dtb__462) -> (match dtb__462 with
  | B_dData_dList.C_List__x58__x58_ (dtb__463, dtb__464) -> (match dtb__464 with
  | B_dData_dList.C_List__x58__x58_ (dtb__465, dtb__466) -> (match (v_stripIrCasts dtb__465) with
  | Ir_dModel.C_Ir_IrStr (dtb__467) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = dtb__467; B_dData_dPair.f_Pair_second = dtb__457 }))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)) (B_dData_dList.v_reverse args)))

# 1890 "Vuna/Compiler/Wasm/Module.vuna"
let v_rwSpine = (fun (n : string) (ir0 : Ir_dModel.t_Ir) -> ((fun ir -> ((fun nd_uscrut3 -> (match nd_uscrut3 with
  | { B_dData_dPair.f_Pair_first = dtb__468; B_dData_dPair.f_Pair_second = dtb__469 } -> (match dtb__468 with
  | Ir_dModel.C_Ir_IrGlobal (dtb__470) -> (if (Base_dIntrinsics.v_isSendCoreName dtb__470) then (match (v_sendTailOf dtb__469) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__471) -> ((fun nd_uscrut11 -> (match nd_uscrut11 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__472) -> (match dtb__472 with
  | Base_dIntrinsics.C_HostClass_HostAbort (dtb__473, dtb__474) -> ((v_abortSend dtb__474) (B_dData_dPair.v_secondOf dtb__471))
  | Base_dIntrinsics.C_HostClass_HostDirect (dtb__475, dtb__476) -> (((v_directSend n) dtb__476) (B_dData_dPair.v_secondOf dtb__471))
  | _ -> ir
)
  | _ -> ir
)) (Base_dIntrinsics.v_hostClassOfSendKey (B_dData_dPair.v_firstOf dtb__471)))
  | B_dData_dMaybe.C_Maybe_Nothing -> ir
  | _ -> failwith "DT: impossible branch"
) else ir)
  | _ -> ir
)
  | _ -> failwith "DT: impossible branch"
)) (v_spineOf ir))) (v_stripIrCasts ir0)))

# 1855 "Vuna/Compiler/Wasm/Module.vuna"
let rec v_rw = (fun (mc0 : string) (mc1 : Ir_dModel.t_Ir) -> (match mc1 with
  | Ir_dModel.C_Ir_IrTail (dtb__477) -> (Ir_dModel.C_Ir_IrTail (((v_rw mc0) dtb__477)))
  | Ir_dModel.C_Ir_IrEffThunk (dtb__478, dtb__479, dtb__480, dtb__481, dtb__482) -> ((v_rwSpine mc0) (Ir_dModel.C_Ir_IrEffThunk (dtb__478, dtb__479, dtb__480, dtb__481, ((v_rw mc0) dtb__482))))
  | Ir_dModel.C_Ir_IrConcatMany (dtb__483) -> ((v_rwSpine mc0) (Ir_dModel.C_Ir_IrConcatMany (((B_dData_dList.v_map (v_rw mc0)) dtb__483))))
  | Ir_dModel.C_Ir_IrNatCase (dtb__484, dtb__485, dtb__486, dtb__487, dtb__488) -> ((v_rwSpine mc0) (Ir_dModel.C_Ir_IrNatCase (((v_rw mc0) dtb__484), dtb__485, ((v_rwAltMaybe mc0) dtb__486), ((v_rwAltMaybe mc0) dtb__487), ((v_rwAltMaybe mc0) dtb__488))))
  | Ir_dModel.C_Ir_IrCase (dtb__489, dtb__490, dtb__491, dtb__492) -> ((v_rwSpine mc0) (Ir_dModel.C_Ir_IrCase (dtb__489, B_dData_dMaybe.C_Maybe_Nothing, ((v_rw mc0) dtb__491), ((B_dData_dList.v_map (v_rwAlt mc0)) dtb__492))))
  | Ir_dModel.C_Ir_IrIf (dtb__493, dtb__494, dtb__495) -> ((v_rwSpine mc0) (Ir_dModel.C_Ir_IrIf (((v_rw mc0) dtb__493), ((v_rw mc0) dtb__494), ((v_rw mc0) dtb__495))))
  | Ir_dModel.C_Ir_IrApp (dtb__496, dtb__497, dtb__498) -> ((v_rwSpine mc0) (Ir_dModel.C_Ir_IrApp (B_dData_dMaybe.C_Maybe_Nothing, ((v_rw mc0) dtb__497), ((v_rw mc0) dtb__498))))
  | Ir_dModel.C_Ir_IrLam (dtb__499, dtb__500, dtb__501) -> ((v_rwSpine mc0) (Ir_dModel.C_Ir_IrLam (dtb__499, dtb__500, ((v_rw mc0) dtb__501))))
  | Ir_dModel.C_Ir_IrLet (dtb__502, dtb__503, dtb__504) -> ((v_rwSpine mc0) (Ir_dModel.C_Ir_IrLet (dtb__502, ((v_rw mc0) dtb__503), ((v_rw mc0) dtb__504))))
  | Ir_dModel.C_Ir_IrCast (dtb__505, dtb__506, dtb__507) -> ((v_rwSpine mc0) (Ir_dModel.C_Ir_IrCast (dtb__505, dtb__506, ((v_rw mc0) dtb__507))))
  | Ir_dModel.C_Ir_IrRtApp (dtb__508, dtb__509) -> ((v_rwSpine mc0) (Ir_dModel.C_Ir_IrRtApp (dtb__508, ((B_dData_dList.v_map (v_rw mc0)) dtb__509))))
  | Ir_dModel.C_Ir_IrRecUpd (dtb__510, dtb__511, dtb__512, dtb__513) -> ((v_rwSpine mc0) (Ir_dModel.C_Ir_IrRecUpd (((v_rw mc0) dtb__510), dtb__511, ((B_dData_dList.v_map (v_rwField mc0)) dtb__512), B_dData_dMaybe.C_Maybe_Nothing)))
  | Ir_dModel.C_Ir_IrProj (dtb__514, dtb__515, dtb__516, dtb__517) -> ((v_rwSpine mc0) (Ir_dModel.C_Ir_IrProj (((v_rw mc0) dtb__514), dtb__515, dtb__516, B_dData_dMaybe.C_Maybe_Nothing)))
  | Ir_dModel.C_Ir_IrRecord (dtb__518, dtb__519, dtb__520) -> ((v_rwSpine mc0) (Ir_dModel.C_Ir_IrRecord (dtb__518, B_dData_dMaybe.C_Maybe_Nothing, ((B_dData_dList.v_map (v_rwField mc0)) dtb__520))))
  | Ir_dModel.C_Ir_IrCtor (dtb__521, dtb__522, dtb__523, dtb__524) -> ((v_rwSpine mc0) (Ir_dModel.C_Ir_IrCtor (dtb__521, dtb__522, B_dData_dMaybe.C_Maybe_Nothing, ((B_dData_dList.v_map (v_rw mc0)) dtb__524))))
  | _ -> ((v_rwSpine mc0) mc1)
))
# 1908 "Vuna/Compiler/Wasm/Module.vuna"
and v_rwField = (fun (mc0 : string) (mc1 : (string, Ir_dModel.t_Ir) B_dData_dPair.t_Pair) -> (match mc1 with
  | { B_dData_dPair.f_Pair_first = dtb__525; B_dData_dPair.f_Pair_second = dtb__526 } -> { B_dData_dPair.f_Pair_first = dtb__525; B_dData_dPair.f_Pair_second = ((v_rw mc0) dtb__526) }
  | _ -> failwith "DT: impossible branch"
))
# 1911 "Vuna/Compiler/Wasm/Module.vuna"
and v_rwAlt = (fun (mc0 : string) (mc1 : Ir_dModel.t_IrAlt) -> (match mc1 with
  | { Ir_dModel.f_IrAlt_irAltCtor = dtb__527; Ir_dModel.f_IrAlt_irAltBinders = dtb__528; Ir_dModel.f_IrAlt_irAltBody = dtb__529 } -> { Ir_dModel.f_IrAlt_irAltCtor = dtb__527; Ir_dModel.f_IrAlt_irAltBinders = dtb__528; Ir_dModel.f_IrAlt_irAltBody = ((v_rw mc0) dtb__529) }
  | _ -> failwith "DT: impossible branch"
))
# 1914 "Vuna/Compiler/Wasm/Module.vuna"
and v_rwAltMaybe = (fun (mc0 : string) (mc1 : Ir_dModel.t_IrAlt B_dData_dMaybe.t_Maybe) -> (match mc1 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__530) -> (B_dData_dMaybe.C_Maybe_Just (((v_rwAlt mc0) dtb__530)))
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 1918 "Vuna/Compiler/Wasm/Module.vuna"
let v_rwDef = (fun (n : string) (d : Ir_dModel.t_IrDef) -> (match (Ir_dModel.v_irDefBody d) with
  | B_dData_dMaybe.C_Maybe_Nothing -> d
  | B_dData_dMaybe.C_Maybe_Just (dtb__531) -> (Ir_dModel.C_IrDef_IrDef ((Ir_dModel.v_irDefName d), (Ir_dModel.v_irDefArity d), (Ir_dModel.v_irDefDeps d), (Ir_dModel.v_irDefTy d), ((v_rw n) dtb__531), (Ir_dModel.v_irDefRecValueOk d), (Ir_dModel.v_irDefInitGuard d), (Ir_dModel.v_irDefSpan d)))
  | _ -> failwith "DT: impossible branch"
))

# 1934 "Vuna/Compiler/Wasm/Module.vuna"
let v_pureKDef = ((fun r -> ((fun u -> (Ir_dModel.C_IrDef_IrDef (v_hcPureK, 1, B_dData_dList.C_List_Nil, B_dData_dMaybe.C_Maybe_Nothing, (Ir_dModel.C_Ir_IrLam ((B_dData_dList.C_List__x58__x58_ (r, B_dData_dList.C_List_Nil)), B_dData_dMaybe.C_Maybe_Nothing, (Ir_dModel.C_Ir_IrCtor (Ir_dModel.v_irEffTypeName, Ir_dModel.v_irEffMkCtor, B_dData_dMaybe.C_Maybe_Nothing, (B_dData_dList.C_List__x58__x58_ ((Ir_dModel.C_Ir_IrLam ((B_dData_dList.C_List__x58__x58_ (u, B_dData_dList.C_List_Nil)), B_dData_dMaybe.C_Maybe_Nothing, (Ir_dModel.C_Ir_IrVar (r)))), B_dData_dList.C_List_Nil)))))), true, false, B_dData_dMaybe.C_Maybe_Nothing))) (Ir_dModel.v_mkIrBinder "pureKU"))) (Ir_dModel.v_mkIrBinder "pureKR"))

# 1950 "Vuna/Compiler/Wasm/Module.vuna"
let rec v_irGlobalsOf = (fun (mc0 : Ir_dModel.t_Ir) -> (match mc0 with
  | Ir_dModel.C_Ir_IrTail (dtb__532) -> (v_irGlobalsOf dtb__532)
  | Ir_dModel.C_Ir_IrEffThunk (dtb__533, dtb__534, dtb__535, dtb__536, dtb__537) -> (v_irGlobalsOf dtb__537)
  | Ir_dModel.C_Ir_IrConcatMany (dtb__538) -> ((B_dData_dList.v_concatMap v_irGlobalsOf) dtb__538)
  | Ir_dModel.C_Ir_IrNatCase (dtb__539, dtb__540, dtb__541, dtb__542, dtb__543) -> ((B_dData_dList.v_append (v_irGlobalsOf dtb__539)) ((B_dData_dList.v_append (v_globalsOfAltMaybe dtb__541)) ((B_dData_dList.v_append (v_globalsOfAltMaybe dtb__542)) (v_globalsOfAltMaybe dtb__543))))
  | Ir_dModel.C_Ir_IrCase (dtb__544, dtb__545, dtb__546, dtb__547) -> ((B_dData_dList.v_append (v_irGlobalsOf dtb__546)) ((B_dData_dList.v_concatMap v_globalsOfAlt) dtb__547))
  | Ir_dModel.C_Ir_IrIf (dtb__548, dtb__549, dtb__550) -> ((B_dData_dList.v_append (v_irGlobalsOf dtb__548)) ((B_dData_dList.v_append (v_irGlobalsOf dtb__549)) (v_irGlobalsOf dtb__550)))
  | Ir_dModel.C_Ir_IrApp (dtb__551, dtb__552, dtb__553) -> ((B_dData_dList.v_append (v_irGlobalsOf dtb__552)) (v_irGlobalsOf dtb__553))
  | Ir_dModel.C_Ir_IrLam (dtb__554, dtb__555, dtb__556) -> (v_irGlobalsOf dtb__556)
  | Ir_dModel.C_Ir_IrLet (dtb__557, dtb__558, dtb__559) -> ((B_dData_dList.v_append (v_irGlobalsOf dtb__558)) (v_irGlobalsOf dtb__559))
  | Ir_dModel.C_Ir_IrCast (dtb__560, dtb__561, dtb__562) -> (v_irGlobalsOf dtb__562)
  | Ir_dModel.C_Ir_IrRtApp (dtb__563, dtb__564) -> ((B_dData_dList.v_concatMap v_irGlobalsOf) dtb__564)
  | Ir_dModel.C_Ir_IrRecUpd (dtb__565, dtb__566, dtb__567, dtb__568) -> ((B_dData_dList.v_append (v_irGlobalsOf dtb__565)) ((B_dData_dList.v_concatMap v_globalsOfField) dtb__567))
  | Ir_dModel.C_Ir_IrProj (dtb__569, dtb__570, dtb__571, dtb__572) -> (v_irGlobalsOf dtb__569)
  | Ir_dModel.C_Ir_IrRecord (dtb__573, dtb__574, dtb__575) -> ((B_dData_dList.v_concatMap v_globalsOfField) dtb__575)
  | Ir_dModel.C_Ir_IrCtor (dtb__576, dtb__577, dtb__578, dtb__579) -> ((B_dData_dList.v_concatMap v_irGlobalsOf) dtb__579)
  | Ir_dModel.C_Ir_IrGlobal (dtb__580) -> (B_dData_dList.C_List__x58__x58_ (dtb__580, B_dData_dList.C_List_Nil))
  | _ -> B_dData_dList.C_List_Nil
))
# 1972 "Vuna/Compiler/Wasm/Module.vuna"
and v_globalsOfField = (fun (p : (string, Ir_dModel.t_Ir) B_dData_dPair.t_Pair) -> (v_irGlobalsOf (B_dData_dPair.v_secondOf p)))
# 1975 "Vuna/Compiler/Wasm/Module.vuna"
and v_globalsOfAlt = (fun (a : Ir_dModel.t_IrAlt) -> (v_irGlobalsOf (Ir_dModel.v_irAltBodyOf a)))
# 1978 "Vuna/Compiler/Wasm/Module.vuna"
and v_globalsOfAltMaybe = (fun (mc0 : Ir_dModel.t_IrAlt B_dData_dMaybe.t_Maybe) -> (match mc0 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__581) -> (v_globalsOfAlt dtb__581)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 1985 "Vuna/Compiler/Wasm/Module.vuna"
let v_depKeeps = (fun (tbl : (string, Ir_dModel.t_IrDef) B_dContainer_dHashMap.t_HashMap) (n : string) -> (match ((((B_dContainer_dHashMap.v_lookup B_dData_dString.v_Hashable_uString) B_dData_dString.v_Eq_uString) n) tbl) with
  | B_dData_dMaybe.C_Maybe_Nothing -> true
  | B_dData_dMaybe.C_Maybe_Just (dtb__582) -> (B_dData_dBool.v_not ((v_defUsesSyms v_performSyms) dtb__582))
  | _ -> failwith "DT: impossible branch"
))

# 1991 "Vuna/Compiler/Wasm/Module.vuna"
let v_refsOf = (fun (d : Ir_dModel.t_IrDef) (tbl : (string, Ir_dModel.t_IrDef) B_dContainer_dHashMap.t_HashMap) -> (match (Ir_dModel.v_irDefBody d) with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dList.C_List_Nil
  | B_dData_dMaybe.C_Maybe_Just (dtb__583) -> ((B_dData_dList.v_append (v_irGlobalsOf dtb__583)) ((B_dData_dList.v_filter (v_depKeeps tbl)) (Ir_dModel.v_irDefDeps d)))
  | _ -> failwith "DT: impossible branch"
))

# 1997 "Vuna/Compiler/Wasm/Module.vuna"
let rec v_closeRefs = (fun (fuel : int) (tbl : (string, Ir_dModel.t_IrDef) B_dContainer_dHashMap.t_HashMap) (work : string B_dData_dList.t_List) (acc : string B_dData_dList.t_List) -> (if (fuel <= 0) then acc else (match work with
  | B_dData_dList.C_List_Nil -> acc
  | B_dData_dList.C_List__x58__x58_ (dtb__584, dtb__585) -> (if ((B_dData_dList.v_memName dtb__584) acc) then ((((v_closeRefs (fuel - 1)) tbl) dtb__585) acc) else (match ((((B_dContainer_dHashMap.v_lookup B_dData_dString.v_Hashable_uString) B_dData_dString.v_Eq_uString) dtb__584) tbl) with
  | B_dData_dMaybe.C_Maybe_Nothing -> ((((v_closeRefs (fuel - 1)) tbl) dtb__585) (B_dData_dList.C_List__x58__x58_ (dtb__584, acc)))
  | B_dData_dMaybe.C_Maybe_Just (dtb__586) -> ((((v_closeRefs (fuel - 1)) tbl) ((B_dData_dList.v_append ((v_refsOf dtb__586) tbl)) dtb__585)) (B_dData_dList.C_List__x58__x58_ (dtb__584, acc)))
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
)))

# 2013 "Vuna/Compiler/Wasm/Module.vuna"
let v_refsAllOf = (fun (d : Ir_dModel.t_IrDef) -> (match (Ir_dModel.v_irDefBody d) with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dList.C_List_Nil
  | B_dData_dMaybe.C_Maybe_Just (dtb__587) -> ((B_dData_dList.v_append (v_irGlobalsOf dtb__587)) (Ir_dModel.v_irDefDeps d))
  | _ -> failwith "DT: impossible branch"
))

# 2019 "Vuna/Compiler/Wasm/Module.vuna"
let rec v_closeRefsAll = (fun (fuel : int) (tbl : (string, Ir_dModel.t_IrDef) B_dContainer_dHashMap.t_HashMap) (work : string B_dData_dList.t_List) (acc : string B_dData_dList.t_List) -> (if (fuel <= 0) then acc else (match work with
  | B_dData_dList.C_List_Nil -> acc
  | B_dData_dList.C_List__x58__x58_ (dtb__588, dtb__589) -> (if ((B_dData_dList.v_memName dtb__588) acc) then ((((v_closeRefsAll (fuel - 1)) tbl) dtb__589) acc) else (match ((((B_dContainer_dHashMap.v_lookup B_dData_dString.v_Hashable_uString) B_dData_dString.v_Eq_uString) dtb__588) tbl) with
  | B_dData_dMaybe.C_Maybe_Nothing -> ((((v_closeRefsAll (fuel - 1)) tbl) dtb__589) (B_dData_dList.C_List__x58__x58_ (dtb__588, acc)))
  | B_dData_dMaybe.C_Maybe_Just (dtb__590) -> ((((v_closeRefsAll (fuel - 1)) tbl) ((B_dData_dList.v_append (v_refsAllOf dtb__590)) dtb__589)) (B_dData_dList.C_List__x58__x58_ (dtb__588, acc)))
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
)))

# 2035 "Vuna/Compiler/Wasm/Module.vuna"
let v_reachableByRefs = (fun (fuel : int) (roots : string B_dData_dList.t_List) (defs : Ir_dModel.t_IrDef B_dData_dList.t_List) -> ((fun tbl -> ((fun names -> ((B_dData_dList.v_filter (fun (d : Ir_dModel.t_IrDef) -> ((B_dData_dList.v_memName (Ir_dModel.v_irDefName d)) names))) defs)) ((((v_closeRefs fuel) tbl) roots) B_dData_dList.C_List_Nil))) ((B_dContainer_dHashMap.v_fromList B_dData_dString.v_Hashable_uString) ((B_dData_dList.v_map (fun (d : Ir_dModel.t_IrDef) -> { B_dData_dPair.f_Pair_first = (Ir_dModel.v_irDefName d); B_dData_dPair.f_Pair_second = d })) defs))))

# 2157 "Vuna/Compiler/Wasm/Module.vuna"
let v_floatRenderName = "Base.Data.Float.floatRender"

# 1542 "Vuna/Compiler/Wasm/Module.vuna"
let v_entryShowFunc = (fun (mc0 : Ir_dModel.t_Ir) -> (match mc0 with
  | Ir_dModel.C_Ir_IrRt (dtb__591) -> (if (dtb__591 = "@ir@showInt") then (B_dData_dMaybe.C_Maybe_Just ("$rt_strFromInt")) else (if (dtb__591 = "@ir@showNat") then (B_dData_dMaybe.C_Maybe_Just ("$rt_strFromInt")) else (if (dtb__591 = "@ir@showBool") then (B_dData_dMaybe.C_Maybe_Just ("$rt_showBool")) else (if (dtb__591 = "@ir@showStr") then (B_dData_dMaybe.C_Maybe_Just ("$rt_showStr")) else (if (dtb__591 = "@ir@showFloat") then (B_dData_dMaybe.C_Maybe_Just ((Wasm_dTypes.v_watFuncNameOf v_floatRenderName))) else B_dData_dMaybe.C_Maybe_Nothing)))))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
))

# 1553 "Vuna/Compiler/Wasm/Module.vuna"
let v_genStartBody = (fun (fuel : int) (st : t_GenState) (entry : Ir_dModel.t_IrEntry B_dData_dMaybe.t_Maybe) (ordered : Ir_dModel.t_IrDef B_dData_dList.t_List) (printResult : bool) -> (if (fuel <= 0) then (B_dData_dResult.C_Result_Err ("wasm codegen fuel exhausted")) else (match entry with
  | B_dData_dMaybe.C_Maybe_Nothing -> (B_dData_dResult.C_Result_Ok ({ B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = st }))
  | B_dData_dMaybe.C_Maybe_Just (dtb__592) -> ((fun st1 -> ((fun runSeeds -> ((fun handlerSeeds -> ((fun runInstrs -> ((fun handlerInstrs -> ((fun mainInstrs -> (match (((v_genDefsInits (fuel - 1)) st1) ordered) with
  | B_dData_dResult.C_Result_Err (dtb__593) -> (B_dData_dResult.C_Result_Err (dtb__593))
  | B_dData_dResult.C_Result_Ok (dtb__594) -> (if (B_dData_dBool.v_not printResult) then (if (Ir_dModel.v_irEntryIsActionOf dtb__592) then (B_dData_dResult.C_Result_Ok ({ B_dData_dPair.f_Pair_first = ((B_dData_dList.v_append (B_dData_dPair.v_firstOf dtb__594)) ((B_dData_dList.v_append mainInstrs) (B_dData_dList.C_List__x58__x58_ (Wasm_dInstr.C_Instr_IDrop, B_dData_dList.C_List_Nil)))); B_dData_dPair.f_Pair_second = (B_dData_dPair.v_secondOf dtb__594) })) else (B_dData_dResult.C_Result_Ok (dtb__594))) else (match (v_entryShowFunc (Ir_dModel.v_irEntryShowOf dtb__592)) with
  | B_dData_dMaybe.C_Maybe_Nothing -> (B_dData_dResult.C_Result_Err ("wasm target: custom Show entry is not supported yet"))
  | B_dData_dMaybe.C_Maybe_Just (dtb__595) -> (B_dData_dResult.C_Result_Ok ({ B_dData_dPair.f_Pair_first = ((B_dData_dList.v_append (B_dData_dPair.v_firstOf dtb__594)) ((B_dData_dList.v_append mainInstrs) (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ICall (dtb__595)), (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ICall ("$rt_println")), B_dData_dList.C_List_Nil)))))); B_dData_dPair.f_Pair_second = (B_dData_dPair.v_secondOf dtb__594) }))
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
)) ((B_dData_dList.v_append (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IGlobalGet ((Wasm_dTypes.v_watGlobalNameOf (Ir_dModel.v_irEntryMainOf dtb__592)))), B_dData_dList.C_List_Nil))) ((B_dData_dList.v_append handlerInstrs) runInstrs)))) ((B_dData_dList.v_concatMap (fun (h : string) -> (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ICall ((Wasm_dTypes.v_watFuncNameOf h))), B_dData_dList.C_List_Nil)))) handlerSeeds))) (match (Ir_dModel.v_irEntryRunMainOf dtb__592) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__596) -> (if (Ir_dModel.v_irEntryIsActionOf dtb__592) then (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_ICall ((Wasm_dTypes.v_watFuncNameOf dtb__596))), B_dData_dList.C_List_Nil)) else B_dData_dList.C_List_Nil)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))) (Ir_dModel.v_irEntryHandlersOf dtb__592))) (match (Ir_dModel.v_irEntryRunMainOf dtb__592) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__597) -> (if (Ir_dModel.v_irEntryIsActionOf dtb__592) then (B_dData_dList.C_List__x58__x58_ (dtb__597, B_dData_dList.C_List_Nil)) else B_dData_dList.C_List_Nil)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))) (v_beginFuncScope st))
  | _ -> failwith "DT: impossible branch"
)))

# 2160 "Vuna/Compiler/Wasm/Module.vuna"
let v_famNameOf = (fun (f : Wasm_dTypes.t_WasmFam) -> (f).Wasm_dTypes.f_WasmFam_wasmFamName)

# 2164 "Vuna/Compiler/Wasm/Module.vuna"
let v_classifyWasmErr = (fun (msg : string) -> (if ((B_dData_dString.v_startsWith "wasm target:") msg) then (Wasm_dModel.C_WasmErr_WasmUnsupported (msg)) else (Wasm_dModel.C_WasmErr_WasmInternal (msg))))

# 2168 "Vuna/Compiler/Wasm/Module.vuna"
let rec v_foldlStrings = (fun mc0 mc1 mc2 -> (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__598, dtb__599) -> (((v_foldlStrings mc0) ((mc0 mc1) dtb__598)) dtb__599)
  | B_dData_dList.C_List_Nil -> mc1
  | _ -> failwith "DT: impossible branch"
))

# 178 "Vuna/Compiler/Wasm/Module.vuna"
let v_poolOf = (fun (strs : string B_dData_dList.t_List) -> ((fun acc -> ((v_poolOffsets (B_dData_dList.v_reverse (B_dData_dPair.v_firstOf acc))) 0)) (((v_foldlStrings (fun (acc : (string B_dData_dList.t_List, (string, bool) B_dContainer_dHashMap.t_HashMap) B_dData_dPair.t_Pair) (s : string) -> ((v_poolAdd s) acc))) { B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = ((B_dContainer_dHashMap.v_fromList B_dData_dString.v_Hashable_uString) B_dData_dList.C_List_Nil) }) strs)))

# 2172 "Vuna/Compiler/Wasm/Module.vuna"
let v_mkConsts = (fun (offsets : (string, (int, int) B_dData_dPair.t_Pair) B_dContainer_dHashMap.t_HashMap) -> ((fun offOf -> ((fun lenOf -> { Wasm_dRuntime.f_RtConsts_rtcTrueOff = (offOf "True"); Wasm_dRuntime.f_RtConsts_rtcTrueLen = (lenOf "True"); Wasm_dRuntime.f_RtConsts_rtcFalseOff = (offOf "False"); Wasm_dRuntime.f_RtConsts_rtcFalseLen = (lenOf "False"); Wasm_dRuntime.f_RtConsts_rtcTodoOff = (offOf "TODO: "); Wasm_dRuntime.f_RtConsts_rtcTodoLen = (lenOf "TODO: "); Wasm_dRuntime.f_RtConsts_rtcDivOff = (offOf "division by zero"); Wasm_dRuntime.f_RtConsts_rtcDivLen = (lenOf "division by zero"); Wasm_dRuntime.f_RtConsts_rtcErrOff = (offOf "vuna: runtime error: "); Wasm_dRuntime.f_RtConsts_rtcErrLen = (lenOf "vuna: runtime error: "); Wasm_dRuntime.f_RtConsts_rtcAssertOff = (offOf "assertion failed: "); Wasm_dRuntime.f_RtConsts_rtcAssertLen = (lenOf "assertion failed: "); Wasm_dRuntime.f_RtConsts_rtcOobOff = (offOf "Invalid_argument(\"index out of bounds\")"); Wasm_dRuntime.f_RtConsts_rtcOobLen = (lenOf "Invalid_argument(\"index out of bounds\")"); Wasm_dRuntime.f_RtConsts_rtcResumedOff = (offOf "continuation already resumed"); Wasm_dRuntime.f_RtConsts_rtcResumedLen = (lenOf "continuation already resumed"); Wasm_dRuntime.f_RtConsts_rtcHostOff = (offOf "wasm host operation is not implemented"); Wasm_dRuntime.f_RtConsts_rtcHostLen = (lenOf "wasm host operation is not implemented"); Wasm_dRuntime.f_RtConsts_rtcTmpOff = (offOf ".tmp"); Wasm_dRuntime.f_RtConsts_rtcTmpLen = (lenOf ".tmp"); Wasm_dRuntime.f_RtConsts_rtcRootOff = (offOf "/"); Wasm_dRuntime.f_RtConsts_rtcRootLen = (lenOf "/"); Wasm_dRuntime.f_RtConsts_rtcUnhandledOff = (offOf "unhandled effect"); Wasm_dRuntime.f_RtConsts_rtcUnhandledLen = (lenOf "unhandled effect") }) (fun (mc0 : string) -> (match ((v_poolLookup mc0) offsets) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__600) -> (B_dData_dPair.v_secondOf dtb__600)
  | B_dData_dMaybe.C_Maybe_Nothing -> 0
  | _ -> failwith "DT: impossible branch"
)))) (fun (mc0 : string) -> (match ((v_poolLookup mc0) offsets) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__601) -> (B_dData_dPair.v_firstOf dtb__601)
  | B_dData_dMaybe.C_Maybe_Nothing -> 0
  | _ -> failwith "DT: impossible branch"
))))

# 2211 "Vuna/Compiler/Wasm/Module.vuna"
let v_joinWith = (fun (sep : string) (xs : string B_dData_dList.t_List) -> ((B_dData_dString.v_join sep) xs))

# 192 "Vuna/Compiler/Wasm/Module.vuna"
let v_poolBytes = (fun (pool : (string, (int, int) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) -> ((v_joinWith "") ((B_dData_dList.v_map (fun (p : (string, (int, int) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (B_dData_dPair.v_firstOf p))) pool)))

# 1765 "Vuna/Compiler/Wasm/Module.vuna"
let v_buildModule = (fun (fuel : int) (st : t_GenState) (ordered : Ir_dModel.t_IrDef B_dData_dList.t_List) (entry : Ir_dModel.t_IrEntry B_dData_dMaybe.t_Maybe) (printResult : bool) (listFamM : Wasm_dTypes.t_WasmListFam B_dData_dMaybe.t_Maybe) -> (match (((v_genDefFuncs fuel) st) ordered) with
  | B_dData_dResult.C_Result_Err (dtb__602) -> (B_dData_dResult.C_Result_Err (dtb__602))
  | B_dData_dResult.C_Result_Ok (dtb__603) -> ((fun userFuncs -> ((fun stFuncs -> (match (((((v_genStartBody (fuel - 1)) stFuncs) entry) ordered) printResult) with
  | B_dData_dResult.C_Result_Err (dtb__604) -> (B_dData_dResult.C_Result_Err (dtb__604))
  | B_dData_dResult.C_Result_Ok (dtb__605) -> ((fun startState -> ((fun startFunc -> ((fun lamFuncs -> ((fun elems0 -> ((fun elems -> ((fun rtSelected -> ((fun funcs -> ((fun famTypes -> ((fun allTypes -> ((fun tags -> ((fun baseGlobals -> ((fun globals -> ((fun dataText -> ((fun dataM -> (B_dData_dResult.C_Result_Ok ({ Wasm_dModel.f_WasmModule_wmTypes = allTypes; Wasm_dModel.f_WasmModule_wmTags = tags; Wasm_dModel.f_WasmModule_wmImports = v_baseImports; Wasm_dModel.f_WasmModule_wmGlobals = globals; Wasm_dModel.f_WasmModule_wmFuncs = funcs; Wasm_dModel.f_WasmModule_wmElems = elems; Wasm_dModel.f_WasmModule_wmData = dataM; Wasm_dModel.f_WasmModule_wmExports = (B_dData_dList.C_List__x58__x58_ ({ Wasm_dModel.f_WatExport_watExportKind = "func"; Wasm_dModel.f_WatExport_watExportName = "_start"; Wasm_dModel.f_WatExport_watExportRef = "$_start" }, B_dData_dList.C_List_Nil)); Wasm_dModel.f_WasmModule_wmMemPages = 4 }))) (if ((bi_strLength dataText) = 0) then B_dData_dMaybe.C_Maybe_Nothing else (B_dData_dMaybe.C_Maybe_Just ({ Wasm_dModel.f_WatData_watDataName = "$d0"; Wasm_dModel.f_WatData_watDataBytes = dataText }))))) (v_poolBytes (st).f_GenState_gsPool))) ((B_dData_dList.v_append baseGlobals) (v_globalsOf ordered)))) (B_dData_dList.C_List__x58__x58_ ({ Wasm_dModel.f_WatGlobal_watGlobalName = "$g_cleanups"; Wasm_dModel.f_WatGlobal_watGlobalTy = Wasm_dModel.C_WatValTy_WvAnyRef; Wasm_dModel.f_WatGlobal_watGlobalInit = (B_dData_dList.C_List__x58__x58_ (Wasm_dInstr.C_Instr_IRefNull, B_dData_dList.C_List_Nil)) }, (B_dData_dList.C_List__x58__x58_ ({ Wasm_dModel.f_WatGlobal_watGlobalName = "$g_hostStatus"; Wasm_dModel.f_WatGlobal_watGlobalTy = Wasm_dModel.C_WatValTy_WvI32; Wasm_dModel.f_WatGlobal_watGlobalInit = (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IConstI32 (0)), B_dData_dList.C_List_Nil)) }, (B_dData_dList.C_List__x58__x58_ ({ Wasm_dModel.f_WatGlobal_watGlobalName = "$g_cleanDepth"; Wasm_dModel.f_WatGlobal_watGlobalTy = Wasm_dModel.C_WatValTy_WvI32; Wasm_dModel.f_WatGlobal_watGlobalInit = (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IConstI32 (0)), B_dData_dList.C_List_Nil)) }, (B_dData_dList.C_List__x58__x58_ ({ Wasm_dModel.f_WatGlobal_watGlobalName = "$g_tmpSeq"; Wasm_dModel.f_WatGlobal_watGlobalTy = Wasm_dModel.C_WatValTy_WvI32; Wasm_dModel.f_WatGlobal_watGlobalInit = (B_dData_dList.C_List__x58__x58_ ((Wasm_dInstr.C_Instr_IConstI32 (0)), B_dData_dList.C_List_Nil)) }, B_dData_dList.C_List_Nil)))))))))) B_dData_dList.C_List_Nil)) ((B_dData_dList.v_append v_baseTypes) famTypes))) (v_concatMapType (st).f_GenState_gsFams))) ((B_dData_dList.v_append rtSelected) ((B_dData_dList.v_append ((v_wasmCompareFuncs (st).f_GenState_gsConsts) (st).f_GenState_gsFams)) ((B_dData_dList.v_append (v_wasmBridgeFuncs listFamM)) ((B_dData_dList.v_append userFuncs) ((B_dData_dList.v_append lamFuncs) (B_dData_dList.C_List__x58__x58_ (startFunc, B_dData_dList.C_List_Nil))))))))) (Wasm_dRuntime.v_rtFunctions (st).f_GenState_gsConsts))) (if ((B_dData_dList.v_memName "$rt_mRunEff") elems0) then elems0 else ((B_dData_dList.v_append elems0) (B_dData_dList.C_List__x58__x58_ ("$rt_mRunEff", B_dData_dList.C_List_Nil)))))) (B_dData_dList.v_reverse (startState).f_GenState_gsElems))) (B_dData_dList.v_reverse (startState).f_GenState_gsFuncs))) { Wasm_dModel.f_WatFunc_watFuncName = "$_start"; Wasm_dModel.f_WatFunc_watFuncType = ""; Wasm_dModel.f_WatFunc_watFuncParams = B_dData_dList.C_List_Nil; Wasm_dModel.f_WatFunc_watFuncResults = B_dData_dList.C_List_Nil; Wasm_dModel.f_WatFunc_watFuncLocals = (startState).f_GenState_gsLocals; Wasm_dModel.f_WatFunc_watFuncBody = (B_dData_dPair.v_firstOf dtb__605) })) (B_dData_dPair.v_secondOf dtb__605))
  | _ -> failwith "DT: impossible branch"
)) (B_dData_dPair.v_secondOf dtb__603))) (B_dData_dPair.v_firstOf dtb__603))
  | _ -> failwith "DT: impossible branch"
))

# 2045 "Vuna/Compiler/Wasm/Module.vuna"
let v_build = (fun (program : Ir_dModel.t_IrProgram) (printResult : bool) -> ((fun unit -> ((fun defs -> ((fun entry -> ((fun fams -> ((fun statics -> ((fun users -> ((fun offsets -> ((fun defsAll -> ((fun famTbl -> ((fun poolTbl -> ((fun consts -> ((fun mkSt -> ((fun st0 -> ((fun buildAnf -> (match entry with
  | B_dData_dMaybe.C_Maybe_Nothing -> (C_WasmOutcome_WasmRejected ((Wasm_dModel.C_WasmErr_WasmUnsupported ("wasm target: no main definition"))))
  | B_dData_dMaybe.C_Maybe_Just (dtb__606) -> ((fun runSeeds -> ((fun handlerSeeds -> ((fun ordered -> ((fun listFamM -> ((fun handlerClasses -> ((fun runName -> ((fun roots -> ((fun rewrittenAll -> ((fun rewritten -> ((fun live -> ((fun tblAll -> ((fun namesAll -> ((fun dropNames -> ((fun kept -> ((fun directable -> ((fun entryClean -> (if directable then (((buildAnf ((B_dData_dList.v_append rewritten) (B_dData_dList.C_List__x58__x58_ (v_pureKDef, B_dData_dList.C_List_Nil)))) (B_dData_dMaybe.C_Maybe_Just (entryClean))) listFamM) else (match (Ir_dCps.v_cpsDefsMachine ordered) with
  | B_dData_dResult.C_Result_Ok (dtb__607) -> (((buildAnf dtb__607) (B_dData_dMaybe.C_Maybe_Just (dtb__606))) listFamM)
  | B_dData_dResult.C_Result_Err (dtb__608) -> (C_WasmOutcome_WasmRejected ((Wasm_dModel.C_WasmErr_WasmUnsupported (dtb__608))))
  | _ -> failwith "DT: impossible branch"
))) { Ir_dModel.f_IrEntry_irEntryShow = (Ir_dModel.v_irEntryShowOf dtb__606); Ir_dModel.f_IrEntry_irEntryMain = (Ir_dModel.v_irEntryMainOf dtb__606); Ir_dModel.f_IrEntry_irEntryIsAction = (Ir_dModel.v_irEntryIsActionOf dtb__606); Ir_dModel.f_IrEntry_irEntryRunMain = (Ir_dModel.v_irEntryRunMainOf dtb__606); Ir_dModel.f_IrEntry_irEntryHandlers = B_dData_dList.C_List_Nil; Ir_dModel.f_IrEntry_irEntryRowTags = (Ir_dModel.v_irEntryRowTagsOf dtb__606) })) (if (v_listNull handlerSeeds) then false else (if ((v_listLengthB handlerClasses) <> (v_listLengthB handlerSeeds)) then false else (if (v_anyHostHandled handlerClasses) then false else (if (runName = "") then false else (B_dData_dBool.v_not ((v_defsUseSyms v_performSyms) live)))))))) ((B_dData_dList.v_filter (fun (d : Ir_dModel.t_IrDef) -> (B_dData_dBool.v_not ((v_defUsesSyms v_performSyms) d)))) rewrittenAll))) (B_dData_dList.C_List__x58__x58_ (Base_dIntrinsics.v_effSendCoreName, (B_dData_dList.C_List__x58__x58_ ("Base.Effect.Core.handleCore", (B_dData_dList.C_List__x58__x58_ ("Base.Effect.Core.handleCoreAt", (B_dData_dList.C_List__x58__x58_ ("Base.Effect.Core.handleCoreLin", (B_dData_dList.C_List__x58__x58_ ("Base.Effect.Core.performCore", (B_dData_dList.C_List__x58__x58_ ("Base.Effect.Core.handleScoped", (B_dData_dList.C_List__x58__x58_ ("Base.Effect.Core.handleSelf", B_dData_dList.C_List_Nil)))))))))))))))) ((((v_closeRefsAll 100000) tblAll) roots) B_dData_dList.C_List_Nil))) ((B_dContainer_dHashMap.v_fromList B_dData_dString.v_Hashable_uString) ((B_dData_dList.v_map (fun (d : Ir_dModel.t_IrDef) -> { B_dData_dPair.f_Pair_first = (Ir_dModel.v_irDefName d); B_dData_dPair.f_Pair_second = d })) rewrittenAll)))) rewritten)) (((v_reachableByRefs 100000) roots) rewrittenAll))) ((B_dData_dList.v_map (v_rwDef runName)) defs))) ((B_dData_dList.v_append (B_dData_dList.C_List__x58__x58_ ("Base.Effect.Core.machineRun", (B_dData_dList.C_List__x58__x58_ ((Ir_dModel.v_irEntryMainOf dtb__606), B_dData_dList.C_List_Nil))))) runSeeds))) (match (Ir_dModel.v_irEntryRunMainOf dtb__606) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__609) -> dtb__609
  | B_dData_dMaybe.C_Maybe_Nothing -> ""
  | _ -> failwith "DT: impossible branch"
))) ((B_dData_dList.v_mapMaybe Base_dIntrinsics.v_hostClassOf) handlerSeeds))) ((Wasm_dTypes.v_wasmListFamFromFams ((Ir_dModel.v_irProgSharedOf program)).Ir_dModel.f_IrShared_irSharedListFam) fams))) ((fun nd_uscrut20 -> (match nd_uscrut20 with
  | Ir_dModel.C_Ir_IrRt (dtb__610) -> (if (dtb__610 = "@ir@showFloat") then ((Ir_dAnalysis.v_reachableDefs ((B_dData_dList.v_append (B_dData_dList.C_List__x58__x58_ ("Base.Effect.Core.machineRun", B_dData_dList.C_List_Nil))) ((B_dData_dList.v_append (B_dData_dList.C_List__x58__x58_ ((Ir_dModel.v_irEntryMainOf dtb__606), (B_dData_dList.C_List__x58__x58_ (v_floatRenderName, B_dData_dList.C_List_Nil))))) ((B_dData_dList.v_append runSeeds) handlerSeeds)))) defs) else ((Ir_dAnalysis.v_reachableDefs ((B_dData_dList.v_append (B_dData_dList.C_List__x58__x58_ ("Base.Effect.Core.machineRun", B_dData_dList.C_List_Nil))) ((B_dData_dList.v_append (B_dData_dList.C_List__x58__x58_ ((Ir_dModel.v_irEntryMainOf dtb__606), B_dData_dList.C_List_Nil))) ((B_dData_dList.v_append runSeeds) handlerSeeds)))) defs))
  | _ -> ((Ir_dAnalysis.v_reachableDefs ((B_dData_dList.v_append (B_dData_dList.C_List__x58__x58_ ("Base.Effect.Core.machineRun", B_dData_dList.C_List_Nil))) ((B_dData_dList.v_append (B_dData_dList.C_List__x58__x58_ ((Ir_dModel.v_irEntryMainOf dtb__606), B_dData_dList.C_List_Nil))) ((B_dData_dList.v_append runSeeds) handlerSeeds)))) defs)
)) (Ir_dModel.v_irEntryShowOf dtb__606)))) (Ir_dModel.v_irEntryHandlersOf dtb__606))) (match (Ir_dModel.v_irEntryRunMainOf dtb__606) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__611) -> (if (Ir_dModel.v_irEntryIsActionOf dtb__606) then (B_dData_dList.C_List__x58__x58_ (dtb__611, B_dData_dList.C_List_Nil)) else B_dData_dList.C_List_Nil)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
)) (fun (mc0 : Ir_dModel.t_IrDef B_dData_dList.t_List) (mc1 : Ir_dModel.t_IrEntry B_dData_dMaybe.t_Maybe) (mc2 : Wasm_dTypes.t_WasmListFam B_dData_dMaybe.t_Maybe) -> (match (Ir_dAnf.v_anfProgramDefs mc0) with
  | B_dData_dResult.C_Result_Err (dtb__612) -> (C_WasmOutcome_WasmRejected ((Wasm_dModel.C_WasmErr_WasmInternal (("ANF: " ^ dtb__612)))))
  | B_dData_dResult.C_Result_Ok (dtb__613) -> (match (Ir_dTail.v_annotateDefs dtb__613) with
  | B_dData_dResult.C_Result_Err (dtb__614) -> (C_WasmOutcome_WasmRejected ((Wasm_dModel.C_WasmErr_WasmInternal (("tail: " ^ dtb__614)))))
  | B_dData_dResult.C_Result_Ok (dtb__615) -> (match ((((((v_buildModule 100000) (mkSt dtb__615)) dtb__615) mc1) printResult) mc2) with
  | B_dData_dResult.C_Result_Ok (dtb__616) -> (C_WasmOutcome_WasmOk (dtb__616))
  | B_dData_dResult.C_Result_Err (dtb__617) -> (C_WasmOutcome_WasmRejected ((v_classifyWasmErr dtb__617)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))) (mkSt defsAll))) (fun (mc0 : Ir_dModel.t_IrDef B_dData_dList.t_List) -> ((fun dt -> { f_GenState_gsFams = fams; f_GenState_gsFamTbl = famTbl; f_GenState_gsDefs = mc0; f_GenState_gsDefTbl = dt; f_GenState_gsPool = offsets; f_GenState_gsPoolTbl = poolTbl; f_GenState_gsFuncs = B_dData_dList.C_List_Nil; f_GenState_gsLocals = B_dData_dList.C_List_Nil; f_GenState_gsNextLocal = 0; f_GenState_gsScope = B_dData_dList.C_List_Nil; f_GenState_gsConsts = consts; f_GenState_gsElems = B_dData_dList.C_List_Nil; f_GenState_gsTail = false; f_GenState_gsNextLam = 0 }) ((B_dContainer_dHashMap.v_fromList B_dData_dString.v_Hashable_uString) ((B_dData_dList.v_map (fun (d : Ir_dModel.t_IrDef) -> { B_dData_dPair.f_Pair_first = (Ir_dModel.v_irDefName d); B_dData_dPair.f_Pair_second = d })) mc0)))))) (v_mkConsts poolTbl))) ((B_dContainer_dHashMap.v_fromList B_dData_dString.v_Hashable_uString) offsets))) ((B_dContainer_dHashMap.v_fromList B_dData_dString.v_Hashable_uString) ((B_dData_dList.v_map (fun (f : Wasm_dTypes.t_WasmFam) -> { B_dData_dPair.f_Pair_first = (v_famNameOf f); B_dData_dPair.f_Pair_second = f })) fams)))) ((B_dData_dList.v_append defs) (B_dData_dList.C_List__x58__x58_ (v_pureKDef, B_dData_dList.C_List_Nil))))) (v_poolOf ((B_dData_dList.v_append statics) users)))) ((B_dData_dList.v_concatMap Ir_dAnalysis.v_irStringsOfDef) defs))) (B_dData_dList.C_List__x58__x58_ ("True", (B_dData_dList.C_List__x58__x58_ ("False", (B_dData_dList.C_List__x58__x58_ ("TODO: ", (B_dData_dList.C_List__x58__x58_ ("division by zero", (B_dData_dList.C_List__x58__x58_ ("vuna: runtime error: ", (B_dData_dList.C_List__x58__x58_ ("assertion failed: ", (B_dData_dList.C_List__x58__x58_ ("Invalid_argument(\"index out of bounds\")", (B_dData_dList.C_List__x58__x58_ ("continuation already resumed", (B_dData_dList.C_List__x58__x58_ ("unhandled effect", (B_dData_dList.C_List__x58__x58_ ("wasm host operation is not implemented", (B_dData_dList.C_List__x58__x58_ (".tmp", (B_dData_dList.C_List__x58__x58_ ("/", B_dData_dList.C_List_Nil)))))))))))))))))))))))))) (Wasm_dTypes.v_wasmFamsOf (unit).Ir_dModel.f_IrUnit_irUnitTyDecls))) (unit).Ir_dModel.f_IrUnit_irUnitEntry)) ((B_dData_dList.v_concatMap Ir_dModel.v_irGroupDefs) (unit).Ir_dModel.f_IrUnit_irUnitGroups))) (Ir_dModel.v_irProgUnitOf program)))
