open Vuna_runtime
# 31 "Vuna/Ir/Codec.vuna"
let v_encStrs = (fun (xs : string B_dData_dList.t_List) (acc : string B_dData_dList.t_List) -> (((Base_dBytes.v_encList Base_dBytes.v_encStr) xs) acc))

# 35 "Vuna/Ir/Codec.vuna"
let v_encBools = (fun (xs : bool B_dData_dList.t_List) (acc : string B_dData_dList.t_List) -> (((Base_dBytes.v_encList Base_dBytes.v_encBool) xs) acc))

# 39 "Vuna/Ir/Codec.vuna"
let v_decStrs = (fun (fuel : int) (c : Base_dBytes.t_Cur) -> (((Base_dBytes.v_decList Base_dBytes.v_decStr) fuel) c))

# 43 "Vuna/Ir/Codec.vuna"
let v_decBools = (fun (fuel : int) (c : Base_dBytes.t_Cur) -> (((Base_dBytes.v_decList Base_dBytes.v_decBool) fuel) c))

# 49 "Vuna/Ir/Codec.vuna"
let v_encSpan = (fun (sp : Base_dSource.t_Span) (acc : string B_dData_dList.t_List) -> ((Base_dBytes.v_encStr (Base_dSource.v_spanFile sp)) ((Base_dBytes.v_encInt (Base_dSource.v_spanStartLine sp)) ((Base_dBytes.v_encInt (Base_dSource.v_spanStartCol sp)) ((Base_dBytes.v_encInt (Base_dSource.v_spanEndLine sp)) ((Base_dBytes.v_encInt (Base_dSource.v_spanEndCol sp)) ((Base_dBytes.v_encInt (Base_dSource.v_spanStartOffset sp)) ((Base_dBytes.v_encInt (Base_dSource.v_spanEndOffset sp)) acc))))))))

# 55 "Vuna/Ir/Codec.vuna"
let v_encSpanM = (fun (sp : Base_dSource.t_Span B_dData_dMaybe.t_Maybe) (acc : string B_dData_dList.t_List) -> (((Base_dBytes.v_encMaybe v_encSpan) sp) acc))

# 78 "Vuna/Ir/Codec.vuna"
let v_decSpan6 = (fun (fuel : int) (c : Base_dBytes.t_Cur) (f : string) (sl : int) (sc : int) (el : int) (ec : int) (so : int) -> ((Base_dBytes.v_thenPair ((Base_dBytes.v_decInt fuel) c)) (fun (eo : int) (c1 : Base_dBytes.t_Cur) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = { Base_dSource.f_Span_spanFile = f; Base_dSource.f_Span_spanStartLine = sl; Base_dSource.f_Span_spanStartCol = sc; Base_dSource.f_Span_spanEndLine = el; Base_dSource.f_Span_spanEndCol = ec; Base_dSource.f_Span_spanStartOffset = so; Base_dSource.f_Span_spanEndOffset = eo }; B_dData_dPair.f_Pair_second = c1 })))))

# 74 "Vuna/Ir/Codec.vuna"
let v_decSpan5 = (fun (fuel : int) (c : Base_dBytes.t_Cur) (f : string) (sl : int) (sc : int) (el : int) (ec : int) -> ((Base_dBytes.v_thenPair ((Base_dBytes.v_decInt fuel) c)) (fun (so : int) (c1 : Base_dBytes.t_Cur) -> ((((((((v_decSpan6 fuel) c1) f) sl) sc) el) ec) so))))

# 70 "Vuna/Ir/Codec.vuna"
let v_decSpan4 = (fun (fuel : int) (c : Base_dBytes.t_Cur) (f : string) (sl : int) (sc : int) (el : int) -> ((Base_dBytes.v_thenPair ((Base_dBytes.v_decInt fuel) c)) (fun (ec : int) (c1 : Base_dBytes.t_Cur) -> (((((((v_decSpan5 fuel) c1) f) sl) sc) el) ec))))

# 67 "Vuna/Ir/Codec.vuna"
let v_decSpan3 = (fun (fuel : int) (c : Base_dBytes.t_Cur) (f : string) (sl : int) (sc : int) -> ((Base_dBytes.v_thenPair ((Base_dBytes.v_decInt fuel) c)) (fun (el : int) (c1 : Base_dBytes.t_Cur) -> ((((((v_decSpan4 fuel) c1) f) sl) sc) el))))

# 64 "Vuna/Ir/Codec.vuna"
let v_decSpan2 = (fun (fuel : int) (c : Base_dBytes.t_Cur) (f : string) (sl : int) -> ((Base_dBytes.v_thenPair ((Base_dBytes.v_decInt fuel) c)) (fun (sc : int) (c1 : Base_dBytes.t_Cur) -> (((((v_decSpan3 fuel) c1) f) sl) sc))))

# 61 "Vuna/Ir/Codec.vuna"
let v_decSpan1 = (fun (fuel : int) (c : Base_dBytes.t_Cur) (f : string) -> ((Base_dBytes.v_thenPair ((Base_dBytes.v_decInt fuel) c)) (fun (sl : int) (c1 : Base_dBytes.t_Cur) -> ((((v_decSpan2 fuel) c1) f) sl))))

# 58 "Vuna/Ir/Codec.vuna"
let v_decSpan = (fun (fuel : int) (c : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair ((Base_dBytes.v_decStr fuel) c)) (fun (f : string) (c1 : Base_dBytes.t_Cur) -> (((v_decSpan1 fuel) c1) f))))

# 82 "Vuna/Ir/Codec.vuna"
let v_decSpanM = (fun (fuel : int) (c : Base_dBytes.t_Cur) -> (((Base_dBytes.v_decMaybe v_decSpan) fuel) c))

# 88 "Vuna/Ir/Codec.vuna"
let rec v_encIrTy = (fun (fuel : int) (ty : Vuna_dIr_dModel.t_IrTy) (acc : string B_dData_dList.t_List) -> (if (fuel <= 0) then acc else (match ty with
  | Vuna_dIr_dModel.C_IrTy_IrTyVar (dtb__0) -> ((Base_dBytes.v_encTag 0) ((Base_dBytes.v_encInt dtb__0) acc))
  | Vuna_dIr_dModel.C_IrTy_IrTyInt -> ((Base_dBytes.v_encTag 1) acc)
  | Vuna_dIr_dModel.C_IrTy_IrTyStr -> ((Base_dBytes.v_encTag 2) acc)
  | Vuna_dIr_dModel.C_IrTy_IrTyBool -> ((Base_dBytes.v_encTag 3) acc)
  | Vuna_dIr_dModel.C_IrTy_IrTyFloat -> ((Base_dBytes.v_encTag 4) acc)
  | Vuna_dIr_dModel.C_IrTy_IrTyOpaque -> ((Base_dBytes.v_encTag 5) acc)
  | Vuna_dIr_dModel.C_IrTy_IrTyArray (dtb__1) -> ((Base_dBytes.v_encTag 6) (((v_encIrTy (fuel - 1)) dtb__1) acc))
  | Vuna_dIr_dModel.C_IrTy_IrTyRef (dtb__2) -> ((Base_dBytes.v_encTag 7) (((v_encIrTy (fuel - 1)) dtb__2) acc))
  | Vuna_dIr_dModel.C_IrTy_IrTyData (dtb__3, dtb__4) -> ((Base_dBytes.v_encTag 8) ((Base_dBytes.v_encStr dtb__3) (((v_encIrTys (fuel - 1)) dtb__4) acc)))
  | Vuna_dIr_dModel.C_IrTy_IrTyFun (dtb__5, dtb__6) -> ((Base_dBytes.v_encTag 9) (((v_encIrTy (fuel - 1)) dtb__5) (((v_encIrTy (fuel - 1)) dtb__6) acc)))
  | _ -> failwith "DT: impossible branch"
)))
# 105 "Vuna/Ir/Codec.vuna"
and v_encIrTys = (fun (fuel : int) (xs : Vuna_dIr_dModel.t_IrTy B_dData_dList.t_List) (acc : string B_dData_dList.t_List) -> (B_dData_dList.C_List__x58__x58_ ("[", (B_dData_dList.C_List__x58__x58_ ((string_of_int (Base_dBytes.v_lenOf xs)), (B_dData_dList.C_List__x58__x58_ (":", (((v_encIrTysGo fuel) xs) acc))))))))
# 108 "Vuna/Ir/Codec.vuna"
and v_encIrTysGo = (fun (fuel : int) (xs : Vuna_dIr_dModel.t_IrTy B_dData_dList.t_List) (acc : string B_dData_dList.t_List) -> (if (fuel <= 0) then acc else (match xs with
  | B_dData_dList.C_List_Nil -> acc
  | B_dData_dList.C_List__x58__x58_ (dtb__7, dtb__8) -> (((v_encIrTy (fuel - 1)) dtb__7) (((v_encIrTysGo (fuel - 1)) dtb__8) acc))
  | _ -> failwith "DT: impossible branch"
)))

# 117 "Vuna/Ir/Codec.vuna"
let v_encIrTyM = (fun (fuel : int) (ty : Vuna_dIr_dModel.t_IrTy B_dData_dMaybe.t_Maybe) (acc : string B_dData_dList.t_List) -> (if (fuel <= 0) then acc else (match ty with
  | B_dData_dMaybe.C_Maybe_Nothing -> (B_dData_dList.C_List__x58__x58_ ("0", acc))
  | B_dData_dMaybe.C_Maybe_Just (dtb__9) -> (B_dData_dList.C_List__x58__x58_ ("1", (((v_encIrTy (fuel - 1)) dtb__9) acc)))
  | _ -> failwith "DT: impossible branch"
)))

# 126 "Vuna/Ir/Codec.vuna"
let rec v_decIrTys = (fun (fuel : int) (c : Base_dBytes.t_Cur) -> (if (fuel <= 0) then B_dData_dMaybe.C_Maybe_Nothing else (let nd_uscrut2 = (Base_dBytes.v_curChar c) in (match nd_uscrut2 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__10) -> (if (dtb__10 = 91) then ((Base_dBytes.v_thenPair ((Base_dBytes.v_decListHead (fuel - 1)) c)) (fun (n : int) (c1 : Base_dBytes.t_Cur) -> ((((v_decIrTysGo n) (fuel - 1)) c1) B_dData_dList.C_List_Nil))) else B_dData_dMaybe.C_Maybe_Nothing)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
))))
# 135 "Vuna/Ir/Codec.vuna"
and v_decIrTysGo = (fun (n : int) (fuel : int) (c : Base_dBytes.t_Cur) (acc : Vuna_dIr_dModel.t_IrTy B_dData_dList.t_List) -> (if (n <= 0) then (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (B_dData_dList.v_reverse acc); B_dData_dPair.f_Pair_second = c })) else (if (fuel <= 0) then B_dData_dMaybe.C_Maybe_Nothing else ((Base_dBytes.v_thenPair ((v_decIrTy fuel) c)) (fun (x : Vuna_dIr_dModel.t_IrTy) (c1 : Base_dBytes.t_Cur) -> ((((v_decIrTysGo (n - 1)) (fuel - 1)) c1) (B_dData_dList.C_List__x58__x58_ (x, acc))))))))
# 144 "Vuna/Ir/Codec.vuna"
and v_decIrTy = (fun (fuel : int) (c : Base_dBytes.t_Cur) -> (if (fuel <= 0) then B_dData_dMaybe.C_Maybe_Nothing else ((Base_dBytes.v_thenPair ((Base_dBytes.v_decTag fuel) c)) (fun (tag : int) (c1 : Base_dBytes.t_Cur) -> (((v_decIrTyTag tag) (fuel - 1)) c1)))))
# 151 "Vuna/Ir/Codec.vuna"
and v_decIrTyTag = (fun (mc0 : int) (mc1 : int) (mc2 : Base_dBytes.t_Cur) -> (if (mc0 = 0) then ((Base_dBytes.v_thenPair ((Base_dBytes.v_decInt mc1) mc2)) (fun (i : int) (c1 : Base_dBytes.t_Cur) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Vuna_dIr_dModel.C_IrTy_IrTyVar (i)); B_dData_dPair.f_Pair_second = c1 })))) else (if (mc0 = 1) then (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = Vuna_dIr_dModel.C_IrTy_IrTyInt; B_dData_dPair.f_Pair_second = mc2 })) else (if (mc0 = 2) then (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = Vuna_dIr_dModel.C_IrTy_IrTyStr; B_dData_dPair.f_Pair_second = mc2 })) else (if (mc0 = 3) then (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = Vuna_dIr_dModel.C_IrTy_IrTyBool; B_dData_dPair.f_Pair_second = mc2 })) else (if (mc0 = 4) then (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = Vuna_dIr_dModel.C_IrTy_IrTyFloat; B_dData_dPair.f_Pair_second = mc2 })) else (if (mc0 = 5) then (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = Vuna_dIr_dModel.C_IrTy_IrTyOpaque; B_dData_dPair.f_Pair_second = mc2 })) else (if (mc0 = 6) then (((v_decIrTyWrap (fun _heta0 -> (Vuna_dIr_dModel.C_IrTy_IrTyArray (_heta0)))) mc1) mc2) else (if (mc0 = 7) then (((v_decIrTyWrap (fun _heta0 -> (Vuna_dIr_dModel.C_IrTy_IrTyRef (_heta0)))) mc1) mc2) else (if (mc0 = 8) then ((v_decIrTyData mc1) mc2) else (if (mc0 = 9) then ((v_decIrTyFun mc1) mc2) else B_dData_dMaybe.C_Maybe_Nothing)))))))))))
# 164 "Vuna/Ir/Codec.vuna"
and v_decIrTyWrap = (fun (wrap : (Vuna_dIr_dModel.t_IrTy) -> Vuna_dIr_dModel.t_IrTy) (fuel : int) (c : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair ((v_decIrTy fuel) c)) (fun (a : Vuna_dIr_dModel.t_IrTy) (c1 : Base_dBytes.t_Cur) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (wrap a); B_dData_dPair.f_Pair_second = c1 })))))
# 167 "Vuna/Ir/Codec.vuna"
and v_decIrTyData = (fun (fuel : int) (c : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair ((Base_dBytes.v_decStr fuel) c)) (fun (f : string) (c1 : Base_dBytes.t_Cur) -> (((v_decIrTyData1 fuel) c1) f))))
# 170 "Vuna/Ir/Codec.vuna"
and v_decIrTyData1 = (fun (fuel : int) (c : Base_dBytes.t_Cur) (f : string) -> ((Base_dBytes.v_thenPair ((v_decIrTys fuel) c)) (fun (xs : Vuna_dIr_dModel.t_IrTy B_dData_dList.t_List) (c1 : Base_dBytes.t_Cur) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Vuna_dIr_dModel.C_IrTy_IrTyData (f, xs)); B_dData_dPair.f_Pair_second = c1 })))))
# 173 "Vuna/Ir/Codec.vuna"
and v_decIrTyFun = (fun (fuel : int) (c : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair ((v_decIrTy fuel) c)) (fun (d : Vuna_dIr_dModel.t_IrTy) (c1 : Base_dBytes.t_Cur) -> (((v_decIrTyFun1 fuel) c1) d))))
# 176 "Vuna/Ir/Codec.vuna"
and v_decIrTyFun1 = (fun (fuel : int) (c : Base_dBytes.t_Cur) (d : Vuna_dIr_dModel.t_IrTy) -> ((Base_dBytes.v_thenPair ((v_decIrTy fuel) c)) (fun (r : Vuna_dIr_dModel.t_IrTy) (c1 : Base_dBytes.t_Cur) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Vuna_dIr_dModel.C_IrTy_IrTyFun (d, r)); B_dData_dPair.f_Pair_second = c1 })))))

# 179 "Vuna/Ir/Codec.vuna"
let v_decIrTyM = (fun (fuel : int) (c : Base_dBytes.t_Cur) -> (((Base_dBytes.v_decMaybe v_decIrTy) fuel) c))

# 185 "Vuna/Ir/Codec.vuna"
let v_encBName = (fun (mc0 : Vuna_dIr_dModel.t_IrBName) (mc1 : string B_dData_dList.t_List) -> (match mc0 with
  | Vuna_dIr_dModel.C_IrBName_IrBWild -> ((Base_dBytes.v_encTag 3) mc1)
  | Vuna_dIr_dModel.C_IrBName_IrBNat (dtb__11) -> ((Base_dBytes.v_encTag 2) ((Base_dBytes.v_encInt dtb__11) mc1))
  | Vuna_dIr_dModel.C_IrBName_IrBArm (dtb__12) -> ((Base_dBytes.v_encTag 1) ((Base_dBytes.v_encInt dtb__12) mc1))
  | Vuna_dIr_dModel.C_IrBName_IrBUser (dtb__13) -> ((Base_dBytes.v_encTag 0) ((Base_dBytes.v_encStr dtb__13) mc1))
  | _ -> failwith "DT: impossible branch"
))

# 198 "Vuna/Ir/Codec.vuna"
let v_decBNameTag = (fun (mc0 : int) (mc1 : int) (mc2 : Base_dBytes.t_Cur) -> (if (mc0 = 0) then ((Base_dBytes.v_thenPair ((Base_dBytes.v_decStr mc1) mc2)) (fun (s : string) (c1 : Base_dBytes.t_Cur) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Vuna_dIr_dModel.C_IrBName_IrBUser (s)); B_dData_dPair.f_Pair_second = c1 })))) else (if (mc0 = 1) then ((Base_dBytes.v_thenPair ((Base_dBytes.v_decInt mc1) mc2)) (fun (n : int) (c1 : Base_dBytes.t_Cur) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Vuna_dIr_dModel.C_IrBName_IrBArm (n)); B_dData_dPair.f_Pair_second = c1 })))) else (if (mc0 = 2) then ((Base_dBytes.v_thenPair ((Base_dBytes.v_decInt mc1) mc2)) (fun (n : int) (c1 : Base_dBytes.t_Cur) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Vuna_dIr_dModel.C_IrBName_IrBNat (n)); B_dData_dPair.f_Pair_second = c1 })))) else (if (mc0 = 3) then (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = Vuna_dIr_dModel.C_IrBName_IrBWild; B_dData_dPair.f_Pair_second = mc2 })) else B_dData_dMaybe.C_Maybe_Nothing)))))

# 191 "Vuna/Ir/Codec.vuna"
let v_decBName = (fun (fuel : int) (c : Base_dBytes.t_Cur) -> (if (fuel <= 0) then B_dData_dMaybe.C_Maybe_Nothing else ((Base_dBytes.v_thenPair ((Base_dBytes.v_decTag fuel) c)) (fun (tag : int) (c1 : Base_dBytes.t_Cur) -> (((v_decBNameTag tag) (fuel - 1)) c1)))))

# 205 "Vuna/Ir/Codec.vuna"
let v_encBinder = (fun (fuel : int) (b : Vuna_dIr_dModel.t_IrBinder) (acc : string B_dData_dList.t_List) -> ((Base_dBytes.v_encInt (b).Vuna_dIr_dModel.f_IrBinder_irBinderId) ((v_encBName (b).Vuna_dIr_dModel.f_IrBinder_irBinderName) ((Base_dBytes.v_encBool (b).Vuna_dIr_dModel.f_IrBinder_irBinderErased) (((v_encIrTyM (fuel - 1)) (b).Vuna_dIr_dModel.f_IrBinder_irBinderTy) acc)))))

# 221 "Vuna/Ir/Codec.vuna"
let v_decBinder2 = (fun (fuel : int) (c : Base_dBytes.t_Cur) (id : int) (name : Vuna_dIr_dModel.t_IrBName) (erased : bool) -> ((Base_dBytes.v_thenPair ((v_decIrTyM fuel) c)) (fun (ty : Vuna_dIr_dModel.t_IrTy B_dData_dMaybe.t_Maybe) (c1 : Base_dBytes.t_Cur) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = { Vuna_dIr_dModel.f_IrBinder_irBinderId = id; Vuna_dIr_dModel.f_IrBinder_irBinderName = name; Vuna_dIr_dModel.f_IrBinder_irBinderErased = erased; Vuna_dIr_dModel.f_IrBinder_irBinderTy = ty }; B_dData_dPair.f_Pair_second = c1 })))))

# 217 "Vuna/Ir/Codec.vuna"
let v_decBinder1 = (fun (fuel : int) (c : Base_dBytes.t_Cur) (id : int) (name : Vuna_dIr_dModel.t_IrBName) -> ((Base_dBytes.v_thenPair ((Base_dBytes.v_decBool fuel) c)) (fun (erased : bool) (c1 : Base_dBytes.t_Cur) -> (((((v_decBinder2 fuel) c1) id) name) erased))))

# 214 "Vuna/Ir/Codec.vuna"
let v_decBinder0 = (fun (fuel : int) (c : Base_dBytes.t_Cur) (id : int) -> ((Base_dBytes.v_thenPair ((v_decBName fuel) c)) (fun (name : Vuna_dIr_dModel.t_IrBName) (c1 : Base_dBytes.t_Cur) -> ((((v_decBinder1 fuel) c1) id) name))))

# 211 "Vuna/Ir/Codec.vuna"
let v_decBinder = (fun (fuel : int) (c : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair ((Base_dBytes.v_decInt fuel) c)) (fun (id : int) (c1 : Base_dBytes.t_Cur) -> (((v_decBinder0 fuel) c1) id))))

# 228 "Vuna/Ir/Codec.vuna"
let rec v_encBindersGo = (fun (fuel : int) (xs : Vuna_dIr_dModel.t_IrBinder B_dData_dList.t_List) (acc : string B_dData_dList.t_List) -> (if (fuel <= 0) then acc else (match xs with
  | B_dData_dList.C_List_Nil -> acc
  | B_dData_dList.C_List__x58__x58_ (dtb__14, dtb__15) -> (((v_encBinder (fuel - 1)) dtb__14) (((v_encBindersGo (fuel - 1)) dtb__15) acc))
  | _ -> failwith "DT: impossible branch"
)))

# 225 "Vuna/Ir/Codec.vuna"
let v_encBinders = (fun (fuel : int) (xs : Vuna_dIr_dModel.t_IrBinder B_dData_dList.t_List) (acc : string B_dData_dList.t_List) -> (B_dData_dList.C_List__x58__x58_ ("[", (B_dData_dList.C_List__x58__x58_ ((string_of_int (Base_dBytes.v_lenOf xs)), (B_dData_dList.C_List__x58__x58_ (":", (((v_encBindersGo fuel) xs) acc))))))))

# 237 "Vuna/Ir/Codec.vuna"
let v_decBinders = (fun (fuel : int) (c : Base_dBytes.t_Cur) -> (((Base_dBytes.v_decList v_decBinder) fuel) c))

# 409 "Vuna/Ir/Codec.vuna"
let v_encAppTy = (fun (fuel : int) (ty : (Vuna_dIr_dModel.t_IrTy, Vuna_dIr_dModel.t_IrTy) B_dData_dPair.t_Pair B_dData_dMaybe.t_Maybe) (acc : string B_dData_dList.t_List) -> (if (fuel <= 0) then acc else (((Base_dBytes.v_encMaybe ((Base_dBytes.v_encPair (v_encIrTy (fuel - 1))) (v_encIrTy (fuel - 1)))) ty) acc)))

# 243 "Vuna/Ir/Codec.vuna"
let rec v_encAlt = (fun (mc0 : int) (mc1 : Vuna_dIr_dModel.t_IrAlt) (mc2 : string B_dData_dList.t_List) -> (match mc1 with
  | { Vuna_dIr_dModel.f_IrAlt_irAltCtor = dtb__16; Vuna_dIr_dModel.f_IrAlt_irAltBinders = dtb__17; Vuna_dIr_dModel.f_IrAlt_irAltBody = dtb__18 } -> (((Base_dBytes.v_encMaybe ((Base_dBytes.v_encPair Base_dBytes.v_encStr) Base_dBytes.v_encStr)) dtb__16) (((v_encBinders (mc0 - 1)) dtb__17) (((v_encIr (mc0 - 1)) dtb__18) mc2)))
  | _ -> failwith "DT: impossible branch"
))
# 260 "Vuna/Ir/Codec.vuna"
and v_encAlts = (fun (fuel : int) (xs : Vuna_dIr_dModel.t_IrAlt B_dData_dList.t_List) (acc : string B_dData_dList.t_List) -> (B_dData_dList.C_List__x58__x58_ ("[", (B_dData_dList.C_List__x58__x58_ ((string_of_int (Base_dBytes.v_lenOf xs)), (B_dData_dList.C_List__x58__x58_ (":", (((v_encAltsGo fuel) xs) acc))))))))
# 263 "Vuna/Ir/Codec.vuna"
and v_encAltsGo = (fun (fuel : int) (xs : Vuna_dIr_dModel.t_IrAlt B_dData_dList.t_List) (acc : string B_dData_dList.t_List) -> (if (fuel <= 0) then acc else (match xs with
  | B_dData_dList.C_List_Nil -> acc
  | B_dData_dList.C_List__x58__x58_ (dtb__19, dtb__20) -> (((v_encAlt (fuel - 1)) dtb__19) (((v_encAltsGo (fuel - 1)) dtb__20) acc))
  | _ -> failwith "DT: impossible branch"
)))
# 290 "Vuna/Ir/Codec.vuna"
and v_encAltM = (fun (fuel : int) (a : Vuna_dIr_dModel.t_IrAlt B_dData_dMaybe.t_Maybe) (acc : string B_dData_dList.t_List) -> (if (fuel <= 0) then acc else (match a with
  | B_dData_dMaybe.C_Maybe_Nothing -> (B_dData_dList.C_List__x58__x58_ ("0", acc))
  | B_dData_dMaybe.C_Maybe_Just (dtb__21) -> (B_dData_dList.C_List__x58__x58_ ("1", (((v_encAlt (fuel - 1)) dtb__21) acc)))
  | _ -> failwith "DT: impossible branch"
)))
# 312 "Vuna/Ir/Codec.vuna"
and v_encFields = (fun (fuel : int) (xs : (string, Vuna_dIr_dModel.t_Ir) B_dData_dPair.t_Pair B_dData_dList.t_List) (acc : string B_dData_dList.t_List) -> (B_dData_dList.C_List__x58__x58_ ("[", (B_dData_dList.C_List__x58__x58_ ((string_of_int (Base_dBytes.v_lenOf xs)), (B_dData_dList.C_List__x58__x58_ (":", (((v_encFieldsGo fuel) xs) acc))))))))
# 315 "Vuna/Ir/Codec.vuna"
and v_encFieldsGo = (fun (fuel : int) (xs : (string, Vuna_dIr_dModel.t_Ir) B_dData_dPair.t_Pair B_dData_dList.t_List) (acc : string B_dData_dList.t_List) -> (if (fuel <= 0) then acc else (let nd_uscrut3 = xs in (match nd_uscrut3 with
  | B_dData_dList.C_List__x58__x58_ (dtb__22, dtb__23) -> (match dtb__22 with
  | { B_dData_dPair.f_Pair_first = dtb__24; B_dData_dPair.f_Pair_second = dtb__25 } -> ((Base_dBytes.v_encStr dtb__24) (((v_encIr (fuel - 1)) dtb__25) (((v_encFieldsGo (fuel - 1)) dtb__23) acc)))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> acc
  | _ -> failwith "DT: impossible branch"
))))
# 346 "Vuna/Ir/Codec.vuna"
and v_encIr = (fun (fuel : int) (ir : Vuna_dIr_dModel.t_Ir) (acc : string B_dData_dList.t_List) -> (if (fuel <= 0) then acc else (((v_encIrCases fuel) ir) acc)))
# 349 "Vuna/Ir/Codec.vuna"
and v_encIrCases = (fun (mc0 : int) (mc1 : Vuna_dIr_dModel.t_Ir) (mc2 : string B_dData_dList.t_List) -> (match mc1 with
  | Vuna_dIr_dModel.C_Ir_IrEffBind (dtb__26, dtb__27, dtb__28) -> ((Base_dBytes.v_encTag 22) ((Base_dBytes.v_encStr dtb__26) ((Base_dBytes.v_encStr dtb__27) (((v_encIrTy (mc0 - 1)) dtb__28) mc2))))
  | Vuna_dIr_dModel.C_Ir_IrEffThunk (dtb__29, dtb__30, dtb__31, dtb__32, dtb__33) -> ((Base_dBytes.v_encTag 21) ((Base_dBytes.v_encStr dtb__29) ((Base_dBytes.v_encStr dtb__30) (((v_encIrTy (mc0 - 1)) dtb__31) ((Base_dBytes.v_encInt dtb__32) (((v_encIr (mc0 - 1)) dtb__33) mc2))))))
  | Vuna_dIr_dModel.C_Ir_IrConcatMany (dtb__34) -> ((Base_dBytes.v_encTag 20) (((v_encIrs (mc0 - 1)) dtb__34) mc2))
  | Vuna_dIr_dModel.C_Ir_IrNatCase (dtb__35, dtb__36, dtb__37, dtb__38, dtb__39) -> ((Base_dBytes.v_encTag 19) (((v_encIr (mc0 - 1)) dtb__35) ((Base_dBytes.v_encInt dtb__36) (((v_encAltM (mc0 - 1)) dtb__37) (((v_encAltM (mc0 - 1)) dtb__38) (((v_encAltM (mc0 - 1)) dtb__39) mc2))))))
  | Vuna_dIr_dModel.C_Ir_IrCase (dtb__40, dtb__41, dtb__42, dtb__43) -> ((Base_dBytes.v_encTag 18) (((v_encIrTyM (mc0 - 1)) dtb__40) (((v_encIrTyM (mc0 - 1)) dtb__41) (((v_encIr (mc0 - 1)) dtb__42) (((v_encAlts (mc0 - 1)) dtb__43) mc2)))))
  | Vuna_dIr_dModel.C_Ir_IrIf (dtb__44, dtb__45, dtb__46) -> ((Base_dBytes.v_encTag 17) (((v_encIr (mc0 - 1)) dtb__44) (((v_encIr (mc0 - 1)) dtb__45) (((v_encIr (mc0 - 1)) dtb__46) mc2))))
  | Vuna_dIr_dModel.C_Ir_IrTail (dtb__47) -> ((Base_dBytes.v_encTag 16) (((v_encIr (mc0 - 1)) dtb__47) mc2))
  | Vuna_dIr_dModel.C_Ir_IrApp (dtb__48, dtb__49, dtb__50) -> ((Base_dBytes.v_encTag 15) (((v_encAppTy (mc0 - 1)) dtb__48) (((v_encIr (mc0 - 1)) dtb__49) (((v_encIr (mc0 - 1)) dtb__50) mc2))))
  | Vuna_dIr_dModel.C_Ir_IrLam (dtb__51, dtb__52, dtb__53) -> ((Base_dBytes.v_encTag 14) (((v_encBinders (mc0 - 1)) dtb__51) (((v_encIrTyM (mc0 - 1)) dtb__52) (((v_encIr (mc0 - 1)) dtb__53) mc2))))
  | Vuna_dIr_dModel.C_Ir_IrLet (dtb__54, dtb__55, dtb__56) -> ((Base_dBytes.v_encTag 13) (((v_encBinders (mc0 - 1)) dtb__54) (((v_encIr (mc0 - 1)) dtb__55) (((v_encIr (mc0 - 1)) dtb__56) mc2))))
  | Vuna_dIr_dModel.C_Ir_IrFloatLit (dtb__57) -> ((Base_dBytes.v_encTag 12) ((Base_dBytes.v_encStr dtb__57) mc2))
  | Vuna_dIr_dModel.C_Ir_IrBool (dtb__58) -> ((Base_dBytes.v_encTag 11) ((Base_dBytes.v_encBool dtb__58) mc2))
  | Vuna_dIr_dModel.C_Ir_IrStr (dtb__59) -> ((Base_dBytes.v_encTag 10) ((Base_dBytes.v_encStr dtb__59) mc2))
  | Vuna_dIr_dModel.C_Ir_IrInt (dtb__60) -> ((Base_dBytes.v_encTag 9) ((Base_dBytes.v_encInt dtb__60) mc2))
  | Vuna_dIr_dModel.C_Ir_IrCast (dtb__61, dtb__62, dtb__63) -> ((Base_dBytes.v_encTag 8) (((v_encIrTyM (mc0 - 1)) dtb__61) (((v_encIrTyM (mc0 - 1)) dtb__62) (((v_encIr (mc0 - 1)) dtb__63) mc2))))
  | Vuna_dIr_dModel.C_Ir_IrRtApp (dtb__64, dtb__65) -> ((Base_dBytes.v_encTag 7) ((Base_dBytes.v_encStr dtb__64) (((v_encIrs (mc0 - 1)) dtb__65) mc2)))
  | Vuna_dIr_dModel.C_Ir_IrRt (dtb__66) -> ((Base_dBytes.v_encTag 6) ((Base_dBytes.v_encStr dtb__66) mc2))
  | Vuna_dIr_dModel.C_Ir_IrRecUpd (dtb__67, dtb__68, dtb__69, dtb__70) -> ((Base_dBytes.v_encTag 5) (((v_encIr (mc0 - 1)) dtb__67) ((Base_dBytes.v_encStr dtb__68) (((v_encFields (mc0 - 1)) dtb__69) (((v_encIrTyM (mc0 - 1)) dtb__70) mc2)))))
  | Vuna_dIr_dModel.C_Ir_IrProj (dtb__71, dtb__72, dtb__73, dtb__74) -> ((Base_dBytes.v_encTag 4) (((v_encIr (mc0 - 1)) dtb__71) ((Base_dBytes.v_encStr dtb__72) ((Base_dBytes.v_encStr dtb__73) (((v_encIrTyM (mc0 - 1)) dtb__74) mc2)))))
  | Vuna_dIr_dModel.C_Ir_IrRecord (dtb__75, dtb__76, dtb__77) -> ((Base_dBytes.v_encTag 3) ((Base_dBytes.v_encStr dtb__75) (((v_encIrTyM (mc0 - 1)) dtb__76) (((v_encFields (mc0 - 1)) dtb__77) mc2))))
  | Vuna_dIr_dModel.C_Ir_IrCtor (dtb__78, dtb__79, dtb__80, dtb__81) -> ((Base_dBytes.v_encTag 2) ((Base_dBytes.v_encStr dtb__78) ((Base_dBytes.v_encStr dtb__79) (((Base_dBytes.v_encMaybe (v_encIrTys (mc0 - 1))) dtb__80) (((v_encIrs (mc0 - 1)) dtb__81) mc2)))))
  | Vuna_dIr_dModel.C_Ir_IrGlobal (dtb__82) -> ((Base_dBytes.v_encTag 1) ((Base_dBytes.v_encStr dtb__82) mc2))
  | Vuna_dIr_dModel.C_Ir_IrVar (dtb__83) -> ((Base_dBytes.v_encTag 0) (((v_encBinder (mc0 - 1)) dtb__83) mc2))
  | _ -> failwith "DT: impossible branch"
))
# 397 "Vuna/Ir/Codec.vuna"
and v_encIrs = (fun (fuel : int) (xs : Vuna_dIr_dModel.t_Ir B_dData_dList.t_List) (acc : string B_dData_dList.t_List) -> (B_dData_dList.C_List__x58__x58_ ("[", (B_dData_dList.C_List__x58__x58_ ((string_of_int (Base_dBytes.v_lenOf xs)), (B_dData_dList.C_List__x58__x58_ (":", (((v_encIrsGo fuel) xs) acc))))))))
# 400 "Vuna/Ir/Codec.vuna"
and v_encIrsGo = (fun (fuel : int) (xs : Vuna_dIr_dModel.t_Ir B_dData_dList.t_List) (acc : string B_dData_dList.t_List) -> (if (fuel <= 0) then acc else (match xs with
  | B_dData_dList.C_List_Nil -> acc
  | B_dData_dList.C_List__x58__x58_ (dtb__84, dtb__85) -> (((v_encIr (fuel - 1)) dtb__84) (((v_encIrsGo (fuel - 1)) dtb__85) acc))
  | _ -> failwith "DT: impossible branch"
)))

# 449 "Vuna/Ir/Codec.vuna"
let v_decIrVar = (fun (fuel : int) (c : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair ((v_decBinder fuel) c)) (fun (b : Vuna_dIr_dModel.t_IrBinder) (c1 : Base_dBytes.t_Cur) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Vuna_dIr_dModel.C_Ir_IrVar (b)); B_dData_dPair.f_Pair_second = c1 })))))

# 452 "Vuna/Ir/Codec.vuna"
let v_decIrGlobal = (fun (fuel : int) (c : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair ((Base_dBytes.v_decStr fuel) c)) (fun (s : string) (c1 : Base_dBytes.t_Cur) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Vuna_dIr_dModel.C_Ir_IrGlobal (s)); B_dData_dPair.f_Pair_second = c1 })))))

# 490 "Vuna/Ir/Codec.vuna"
let v_decIrProj3 = (fun (fuel : int) (c : Base_dBytes.t_Cur) (base : Vuna_dIr_dModel.t_Ir) (fam : string) (field : string) -> ((Base_dBytes.v_thenPair ((v_decIrTyM fuel) c)) (fun (resTy : Vuna_dIr_dModel.t_IrTy B_dData_dMaybe.t_Maybe) (c1 : Base_dBytes.t_Cur) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Vuna_dIr_dModel.C_Ir_IrProj (base, fam, field, resTy)); B_dData_dPair.f_Pair_second = c1 })))))

# 486 "Vuna/Ir/Codec.vuna"
let v_decIrProj2 = (fun (fuel : int) (c : Base_dBytes.t_Cur) (base : Vuna_dIr_dModel.t_Ir) (fam : string) -> ((Base_dBytes.v_thenPair ((Base_dBytes.v_decStr fuel) c)) (fun (field : string) (c1 : Base_dBytes.t_Cur) -> (((((v_decIrProj3 fuel) c1) base) fam) field))))

# 483 "Vuna/Ir/Codec.vuna"
let v_decIrProj1 = (fun (fuel : int) (c : Base_dBytes.t_Cur) (base : Vuna_dIr_dModel.t_Ir) -> ((Base_dBytes.v_thenPair ((Base_dBytes.v_decStr fuel) c)) (fun (fam : string) (c1 : Base_dBytes.t_Cur) -> ((((v_decIrProj2 fuel) c1) base) fam))))

# 504 "Vuna/Ir/Codec.vuna"
let v_decIrRecUpd3 = (fun (fuel : int) (c : Base_dBytes.t_Cur) (base : Vuna_dIr_dModel.t_Ir) (fam : string) (fields : (string, Vuna_dIr_dModel.t_Ir) B_dData_dPair.t_Pair B_dData_dList.t_List) -> ((Base_dBytes.v_thenPair ((v_decIrTyM fuel) c)) (fun (resTy : Vuna_dIr_dModel.t_IrTy B_dData_dMaybe.t_Maybe) (c1 : Base_dBytes.t_Cur) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Vuna_dIr_dModel.C_Ir_IrRecUpd (base, fam, fields, resTy)); B_dData_dPair.f_Pair_second = c1 })))))

# 508 "Vuna/Ir/Codec.vuna"
let v_decIrRt = (fun (fuel : int) (c : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair ((Base_dBytes.v_decStr fuel) c)) (fun (sym : string) (c1 : Base_dBytes.t_Cur) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Vuna_dIr_dModel.C_Ir_IrRt (sym)); B_dData_dPair.f_Pair_second = c1 })))))

# 527 "Vuna/Ir/Codec.vuna"
let v_decIrInt = (fun (fuel : int) (c : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair ((Base_dBytes.v_decInt fuel) c)) (fun (n : int) (c1 : Base_dBytes.t_Cur) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Vuna_dIr_dModel.C_Ir_IrInt (n)); B_dData_dPair.f_Pair_second = c1 })))))

# 530 "Vuna/Ir/Codec.vuna"
let v_decIrStr = (fun (fuel : int) (c : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair ((Base_dBytes.v_decStr fuel) c)) (fun (s : string) (c1 : Base_dBytes.t_Cur) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Vuna_dIr_dModel.C_Ir_IrStr (s)); B_dData_dPair.f_Pair_second = c1 })))))

# 533 "Vuna/Ir/Codec.vuna"
let v_decIrBool = (fun (fuel : int) (c : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair ((Base_dBytes.v_decBool fuel) c)) (fun (b : bool) (c1 : Base_dBytes.t_Cur) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Vuna_dIr_dModel.C_Ir_IrBool (b)); B_dData_dPair.f_Pair_second = c1 })))))

# 536 "Vuna/Ir/Codec.vuna"
let v_decIrFloat = (fun (fuel : int) (c : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair ((Base_dBytes.v_decStr fuel) c)) (fun (s : string) (c1 : Base_dBytes.t_Cur) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Vuna_dIr_dModel.C_Ir_IrFloatLit (s)); B_dData_dPair.f_Pair_second = c1 })))))

# 643 "Vuna/Ir/Codec.vuna"
let v_decIrEffBind2 = (fun (fuel : int) (c : Base_dBytes.t_Cur) (fam : string) (ctor : string) -> ((Base_dBytes.v_thenPair ((v_decIrTy fuel) c)) (fun (unitTy : Vuna_dIr_dModel.t_IrTy) (c1 : Base_dBytes.t_Cur) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Vuna_dIr_dModel.C_Ir_IrEffBind (fam, ctor, unitTy)); B_dData_dPair.f_Pair_second = c1 })))))

# 639 "Vuna/Ir/Codec.vuna"
let v_decIrEffBind1 = (fun (fuel : int) (c : Base_dBytes.t_Cur) (fam : string) -> ((Base_dBytes.v_thenPair ((Base_dBytes.v_decStr fuel) c)) (fun (ctor : string) (c1 : Base_dBytes.t_Cur) -> ((((v_decIrEffBind2 fuel) c1) fam) ctor))))

# 636 "Vuna/Ir/Codec.vuna"
let v_decIrEffBind = (fun (fuel : int) (c : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair ((Base_dBytes.v_decStr fuel) c)) (fun (fam : string) (c1 : Base_dBytes.t_Cur) -> (((v_decIrEffBind1 fuel) c1) fam))))

# 250 "Vuna/Ir/Codec.vuna"
let rec v_decAlt = (fun (fuel : int) (c : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair (((Base_dBytes.v_decMaybe ((Base_dBytes.v_decPair Base_dBytes.v_decStr) Base_dBytes.v_decStr)) fuel) c)) (fun (ctor : (string, string) B_dData_dPair.t_Pair B_dData_dMaybe.t_Maybe) (c1 : Base_dBytes.t_Cur) -> (((v_decAlt1 fuel) c1) ctor))))
# 254 "Vuna/Ir/Codec.vuna"
and v_decAlt1 = (fun (fuel : int) (c : Base_dBytes.t_Cur) (ctor : (string, string) B_dData_dPair.t_Pair B_dData_dMaybe.t_Maybe) -> ((Base_dBytes.v_thenPair ((v_decBinders fuel) c)) (fun (bs : Vuna_dIr_dModel.t_IrBinder B_dData_dList.t_List) (c1 : Base_dBytes.t_Cur) -> ((((v_decAlt2 fuel) c1) ctor) bs))))
# 257 "Vuna/Ir/Codec.vuna"
and v_decAlt2 = (fun (fuel : int) (c : Base_dBytes.t_Cur) (ctor : (string, string) B_dData_dPair.t_Pair B_dData_dMaybe.t_Maybe) (bs : Vuna_dIr_dModel.t_IrBinder B_dData_dList.t_List) -> ((Base_dBytes.v_thenPair ((v_decIr fuel) c)) (fun (body : Vuna_dIr_dModel.t_Ir) (c1 : Base_dBytes.t_Cur) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = { Vuna_dIr_dModel.f_IrAlt_irAltCtor = ctor; Vuna_dIr_dModel.f_IrAlt_irAltBinders = bs; Vuna_dIr_dModel.f_IrAlt_irAltBody = body }; B_dData_dPair.f_Pair_second = c1 })))))
# 272 "Vuna/Ir/Codec.vuna"
and v_decAlts = (fun (fuel : int) (c : Base_dBytes.t_Cur) -> (if (fuel <= 0) then B_dData_dMaybe.C_Maybe_Nothing else (let nd_uscrut2 = (Base_dBytes.v_curChar c) in (match nd_uscrut2 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__86) -> (if (dtb__86 = 91) then ((Base_dBytes.v_thenPair ((Base_dBytes.v_decListHead (fuel - 1)) c)) (fun (n : int) (c1 : Base_dBytes.t_Cur) -> ((((v_decAltsGo n) (fuel - 1)) c1) B_dData_dList.C_List_Nil))) else B_dData_dMaybe.C_Maybe_Nothing)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
))))
# 281 "Vuna/Ir/Codec.vuna"
and v_decAltsGo = (fun (n : int) (fuel : int) (c : Base_dBytes.t_Cur) (acc : Vuna_dIr_dModel.t_IrAlt B_dData_dList.t_List) -> (if (n <= 0) then (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (B_dData_dList.v_reverse acc); B_dData_dPair.f_Pair_second = c })) else (if (fuel <= 0) then B_dData_dMaybe.C_Maybe_Nothing else ((Base_dBytes.v_thenPair ((v_decAlt fuel) c)) (fun (x : Vuna_dIr_dModel.t_IrAlt) (c1 : Base_dBytes.t_Cur) -> ((((v_decAltsGo (n - 1)) (fuel - 1)) c1) (B_dData_dList.C_List__x58__x58_ (x, acc))))))))
# 299 "Vuna/Ir/Codec.vuna"
and v_decAltM = (fun (fuel : int) (c : Base_dBytes.t_Cur) -> (if (fuel <= 0) then B_dData_dMaybe.C_Maybe_Nothing else (let nd_uscrut2 = (Base_dBytes.v_curChar c) in (match nd_uscrut2 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__87) -> (if (dtb__87 = 48) then (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = B_dData_dMaybe.C_Maybe_Nothing; B_dData_dPair.f_Pair_second = (Base_dBytes.v_curSkip c) })) else (if (dtb__87 = 49) then ((Base_dBytes.v_thenPair ((v_decAlt (fuel - 1)) (Base_dBytes.v_curSkip c))) (fun (a : Vuna_dIr_dModel.t_IrAlt) (c1 : Base_dBytes.t_Cur) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (B_dData_dMaybe.C_Maybe_Just (a)); B_dData_dPair.f_Pair_second = c1 })))) else B_dData_dMaybe.C_Maybe_Nothing))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
))))
# 324 "Vuna/Ir/Codec.vuna"
and v_decFields = (fun (fuel : int) (c : Base_dBytes.t_Cur) -> (if (fuel <= 0) then B_dData_dMaybe.C_Maybe_Nothing else (let nd_uscrut2 = (Base_dBytes.v_curChar c) in (match nd_uscrut2 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__88) -> (if (dtb__88 = 91) then ((Base_dBytes.v_thenPair ((Base_dBytes.v_decListHead (fuel - 1)) c)) (fun (n : int) (c1 : Base_dBytes.t_Cur) -> ((((v_decFieldsGo n) (fuel - 1)) c1) B_dData_dList.C_List_Nil))) else B_dData_dMaybe.C_Maybe_Nothing)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
))))
# 333 "Vuna/Ir/Codec.vuna"
and v_decFieldsGo = (fun (n : int) (fuel : int) (c : Base_dBytes.t_Cur) (acc : (string, Vuna_dIr_dModel.t_Ir) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (if (n <= 0) then (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (B_dData_dList.v_reverse acc); B_dData_dPair.f_Pair_second = c })) else (if (fuel <= 0) then B_dData_dMaybe.C_Maybe_Nothing else ((Base_dBytes.v_thenPair ((v_decField fuel) c)) (fun (x : (string, Vuna_dIr_dModel.t_Ir) B_dData_dPair.t_Pair) (c1 : Base_dBytes.t_Cur) -> ((((v_decFieldsGo (n - 1)) (fuel - 1)) c1) (B_dData_dList.C_List__x58__x58_ (x, acc))))))))
# 342 "Vuna/Ir/Codec.vuna"
and v_decField = (fun (fuel : int) (c : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair ((Base_dBytes.v_decStr fuel) c)) (fun (k : string) (c1 : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair ((v_decIr fuel) c1)) (fun (v : Vuna_dIr_dModel.t_Ir) (c2 : Base_dBytes.t_Cur) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = { B_dData_dPair.f_Pair_first = k; B_dData_dPair.f_Pair_second = v }; B_dData_dPair.f_Pair_second = c2 })))))))
# 416 "Vuna/Ir/Codec.vuna"
and v_decIr = (fun (fuel : int) (c : Base_dBytes.t_Cur) -> (if (fuel <= 0) then B_dData_dMaybe.C_Maybe_Nothing else ((Base_dBytes.v_thenPair ((Base_dBytes.v_decTag fuel) c)) (fun (tag : int) (c1 : Base_dBytes.t_Cur) -> (((v_decIrTag tag) (fuel - 1)) c1)))))
# 423 "Vuna/Ir/Codec.vuna"
and v_decIrTag = (fun (mc0 : int) (mc1 : int) (mc2 : Base_dBytes.t_Cur) -> (if (mc0 = 0) then ((v_decIrVar mc1) mc2) else (if (mc0 = 1) then ((v_decIrGlobal mc1) mc2) else (if (mc0 = 2) then ((v_decIrCtor mc1) mc2) else (if (mc0 = 3) then ((v_decIrRecord mc1) mc2) else (if (mc0 = 4) then ((v_decIrProj mc1) mc2) else (if (mc0 = 5) then ((v_decIrRecUpd mc1) mc2) else (if (mc0 = 6) then ((v_decIrRt mc1) mc2) else (if (mc0 = 7) then ((v_decIrRtApp mc1) mc2) else (if (mc0 = 8) then ((v_decIrCast mc1) mc2) else (if (mc0 = 9) then ((v_decIrInt mc1) mc2) else (if (mc0 = 10) then ((v_decIrStr mc1) mc2) else (if (mc0 = 11) then ((v_decIrBool mc1) mc2) else (if (mc0 = 12) then ((v_decIrFloat mc1) mc2) else (if (mc0 = 13) then ((v_decIrLet mc1) mc2) else (if (mc0 = 14) then ((v_decIrLam mc1) mc2) else (if (mc0 = 15) then ((v_decIrApp mc1) mc2) else (if (mc0 = 16) then ((v_decIrTail mc1) mc2) else (if (mc0 = 17) then ((v_decIrIf mc1) mc2) else (if (mc0 = 18) then ((v_decIrCase mc1) mc2) else (if (mc0 = 19) then ((v_decIrNatCase mc1) mc2) else (if (mc0 = 20) then ((v_decIrConcat mc1) mc2) else (if (mc0 = 21) then ((v_decIrEffThunk mc1) mc2) else (if (mc0 = 22) then ((v_decIrEffBind mc1) mc2) else B_dData_dMaybe.C_Maybe_Nothing))))))))))))))))))))))))
# 455 "Vuna/Ir/Codec.vuna"
and v_decIrCtor = (fun (fuel : int) (c : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair ((Base_dBytes.v_decStr fuel) c)) (fun (fam : string) (c1 : Base_dBytes.t_Cur) -> (((v_decIrCtor1 fuel) c1) fam))))
# 458 "Vuna/Ir/Codec.vuna"
and v_decIrCtor1 = (fun (fuel : int) (c : Base_dBytes.t_Cur) (fam : string) -> ((Base_dBytes.v_thenPair ((Base_dBytes.v_decStr fuel) c)) (fun (ctor : string) (c1 : Base_dBytes.t_Cur) -> ((((v_decIrCtor2 fuel) c1) fam) ctor))))
# 461 "Vuna/Ir/Codec.vuna"
and v_decIrCtor2 = (fun (fuel : int) (c : Base_dBytes.t_Cur) (fam : string) (ctor : string) -> ((Base_dBytes.v_thenPair (((Base_dBytes.v_decMaybe v_decIrTys) fuel) c)) (fun (tys : Vuna_dIr_dModel.t_IrTy B_dData_dList.t_List B_dData_dMaybe.t_Maybe) (c1 : Base_dBytes.t_Cur) -> (((((v_decIrCtor3 fuel) c1) fam) ctor) tys))))
# 465 "Vuna/Ir/Codec.vuna"
and v_decIrCtor3 = (fun (fuel : int) (c : Base_dBytes.t_Cur) (fam : string) (ctor : string) (tys : Vuna_dIr_dModel.t_IrTy B_dData_dList.t_List B_dData_dMaybe.t_Maybe) -> ((Base_dBytes.v_thenPair ((v_decIrs fuel) c)) (fun (args : Vuna_dIr_dModel.t_Ir B_dData_dList.t_List) (c1 : Base_dBytes.t_Cur) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Vuna_dIr_dModel.C_Ir_IrCtor (fam, ctor, tys, args)); B_dData_dPair.f_Pair_second = c1 })))))
# 469 "Vuna/Ir/Codec.vuna"
and v_decIrRecord = (fun (fuel : int) (c : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair ((Base_dBytes.v_decStr fuel) c)) (fun (fam : string) (c1 : Base_dBytes.t_Cur) -> (((v_decIrRecord1 fuel) c1) fam))))
# 472 "Vuna/Ir/Codec.vuna"
and v_decIrRecord1 = (fun (fuel : int) (c : Base_dBytes.t_Cur) (fam : string) -> ((Base_dBytes.v_thenPair ((v_decIrTyM fuel) c)) (fun (resTy : Vuna_dIr_dModel.t_IrTy B_dData_dMaybe.t_Maybe) (c1 : Base_dBytes.t_Cur) -> ((((v_decIrRecord2 fuel) c1) fam) resTy))))
# 476 "Vuna/Ir/Codec.vuna"
and v_decIrRecord2 = (fun (fuel : int) (c : Base_dBytes.t_Cur) (fam : string) (resTy : Vuna_dIr_dModel.t_IrTy B_dData_dMaybe.t_Maybe) -> ((Base_dBytes.v_thenPair ((v_decFields fuel) c)) (fun (fields : (string, Vuna_dIr_dModel.t_Ir) B_dData_dPair.t_Pair B_dData_dList.t_List) (c1 : Base_dBytes.t_Cur) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Vuna_dIr_dModel.C_Ir_IrRecord (fam, resTy, fields)); B_dData_dPair.f_Pair_second = c1 })))))
# 480 "Vuna/Ir/Codec.vuna"
and v_decIrProj = (fun (fuel : int) (c : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair ((v_decIr fuel) c)) (fun (base : Vuna_dIr_dModel.t_Ir) (c1 : Base_dBytes.t_Cur) -> (((v_decIrProj1 fuel) c1) base))))
# 494 "Vuna/Ir/Codec.vuna"
and v_decIrRecUpd = (fun (fuel : int) (c : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair ((v_decIr fuel) c)) (fun (base : Vuna_dIr_dModel.t_Ir) (c1 : Base_dBytes.t_Cur) -> (((v_decIrRecUpd1 fuel) c1) base))))
# 497 "Vuna/Ir/Codec.vuna"
and v_decIrRecUpd1 = (fun (fuel : int) (c : Base_dBytes.t_Cur) (base : Vuna_dIr_dModel.t_Ir) -> ((Base_dBytes.v_thenPair ((Base_dBytes.v_decStr fuel) c)) (fun (fam : string) (c1 : Base_dBytes.t_Cur) -> ((((v_decIrRecUpd2 fuel) c1) base) fam))))
# 500 "Vuna/Ir/Codec.vuna"
and v_decIrRecUpd2 = (fun (fuel : int) (c : Base_dBytes.t_Cur) (base : Vuna_dIr_dModel.t_Ir) (fam : string) -> ((Base_dBytes.v_thenPair ((v_decFields fuel) c)) (fun (fields : (string, Vuna_dIr_dModel.t_Ir) B_dData_dPair.t_Pair B_dData_dList.t_List) (c1 : Base_dBytes.t_Cur) -> (((((v_decIrRecUpd3 fuel) c1) base) fam) fields))))
# 511 "Vuna/Ir/Codec.vuna"
and v_decIrRtApp = (fun (fuel : int) (c : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair ((Base_dBytes.v_decStr fuel) c)) (fun (sym : string) (c1 : Base_dBytes.t_Cur) -> (((v_decIrRtApp1 fuel) c1) sym))))
# 514 "Vuna/Ir/Codec.vuna"
and v_decIrRtApp1 = (fun (fuel : int) (c : Base_dBytes.t_Cur) (sym : string) -> ((Base_dBytes.v_thenPair ((v_decIrs fuel) c)) (fun (args : Vuna_dIr_dModel.t_Ir B_dData_dList.t_List) (c1 : Base_dBytes.t_Cur) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Vuna_dIr_dModel.C_Ir_IrRtApp (sym, args)); B_dData_dPair.f_Pair_second = c1 })))))
# 517 "Vuna/Ir/Codec.vuna"
and v_decIrCast = (fun (fuel : int) (c : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair ((v_decIrTyM fuel) c)) (fun (from : Vuna_dIr_dModel.t_IrTy B_dData_dMaybe.t_Maybe) (c1 : Base_dBytes.t_Cur) -> (((v_decIrCast1 fuel) c1) from))))
# 520 "Vuna/Ir/Codec.vuna"
and v_decIrCast1 = (fun (fuel : int) (c : Base_dBytes.t_Cur) (from : Vuna_dIr_dModel.t_IrTy B_dData_dMaybe.t_Maybe) -> ((Base_dBytes.v_thenPair ((v_decIrTyM fuel) c)) (fun (to_ : Vuna_dIr_dModel.t_IrTy B_dData_dMaybe.t_Maybe) (c1 : Base_dBytes.t_Cur) -> ((((v_decIrCast2 fuel) c1) from) to_))))
# 523 "Vuna/Ir/Codec.vuna"
and v_decIrCast2 = (fun (fuel : int) (c : Base_dBytes.t_Cur) (from : Vuna_dIr_dModel.t_IrTy B_dData_dMaybe.t_Maybe) (to_ : Vuna_dIr_dModel.t_IrTy B_dData_dMaybe.t_Maybe) -> ((Base_dBytes.v_thenPair ((v_decIr fuel) c)) (fun (inner : Vuna_dIr_dModel.t_Ir) (c1 : Base_dBytes.t_Cur) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Vuna_dIr_dModel.C_Ir_IrCast (from, to_, inner)); B_dData_dPair.f_Pair_second = c1 })))))
# 539 "Vuna/Ir/Codec.vuna"
and v_decIrLet = (fun (fuel : int) (c : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair ((v_decBinders fuel) c)) (fun (bs : Vuna_dIr_dModel.t_IrBinder B_dData_dList.t_List) (c1 : Base_dBytes.t_Cur) -> (((v_decIrLet1 fuel) c1) bs))))
# 542 "Vuna/Ir/Codec.vuna"
and v_decIrLet1 = (fun (fuel : int) (c : Base_dBytes.t_Cur) (bs : Vuna_dIr_dModel.t_IrBinder B_dData_dList.t_List) -> ((Base_dBytes.v_thenPair ((v_decIr fuel) c)) (fun (scrut : Vuna_dIr_dModel.t_Ir) (c1 : Base_dBytes.t_Cur) -> ((((v_decIrLet2 fuel) c1) bs) scrut))))
# 545 "Vuna/Ir/Codec.vuna"
and v_decIrLet2 = (fun (fuel : int) (c : Base_dBytes.t_Cur) (bs : Vuna_dIr_dModel.t_IrBinder B_dData_dList.t_List) (scrut : Vuna_dIr_dModel.t_Ir) -> ((Base_dBytes.v_thenPair ((v_decIr fuel) c)) (fun (body : Vuna_dIr_dModel.t_Ir) (c1 : Base_dBytes.t_Cur) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Vuna_dIr_dModel.C_Ir_IrLet (bs, scrut, body)); B_dData_dPair.f_Pair_second = c1 })))))
# 548 "Vuna/Ir/Codec.vuna"
and v_decIrLam = (fun (fuel : int) (c : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair ((v_decBinders fuel) c)) (fun (bs : Vuna_dIr_dModel.t_IrBinder B_dData_dList.t_List) (c1 : Base_dBytes.t_Cur) -> (((v_decIrLam1 fuel) c1) bs))))
# 551 "Vuna/Ir/Codec.vuna"
and v_decIrLam1 = (fun (fuel : int) (c : Base_dBytes.t_Cur) (bs : Vuna_dIr_dModel.t_IrBinder B_dData_dList.t_List) -> ((Base_dBytes.v_thenPair ((v_decIrTyM fuel) c)) (fun (bodyTy : Vuna_dIr_dModel.t_IrTy B_dData_dMaybe.t_Maybe) (c1 : Base_dBytes.t_Cur) -> ((((v_decIrLam2 fuel) c1) bs) bodyTy))))
# 554 "Vuna/Ir/Codec.vuna"
and v_decIrLam2 = (fun (fuel : int) (c : Base_dBytes.t_Cur) (bs : Vuna_dIr_dModel.t_IrBinder B_dData_dList.t_List) (bodyTy : Vuna_dIr_dModel.t_IrTy B_dData_dMaybe.t_Maybe) -> ((Base_dBytes.v_thenPair ((v_decIr fuel) c)) (fun (body : Vuna_dIr_dModel.t_Ir) (c1 : Base_dBytes.t_Cur) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Vuna_dIr_dModel.C_Ir_IrLam (bs, bodyTy, body)); B_dData_dPair.f_Pair_second = c1 })))))
# 558 "Vuna/Ir/Codec.vuna"
and v_decIrApp = (fun (fuel : int) (c : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair (((Base_dBytes.v_decMaybe ((Base_dBytes.v_decPair v_decIrTy) v_decIrTy)) fuel) c)) (fun (appTy : (Vuna_dIr_dModel.t_IrTy, Vuna_dIr_dModel.t_IrTy) B_dData_dPair.t_Pair B_dData_dMaybe.t_Maybe) (c1 : Base_dBytes.t_Cur) -> (((v_decIrApp1 fuel) c1) appTy))))
# 562 "Vuna/Ir/Codec.vuna"
and v_decIrApp1 = (fun (fuel : int) (c : Base_dBytes.t_Cur) (appTy : (Vuna_dIr_dModel.t_IrTy, Vuna_dIr_dModel.t_IrTy) B_dData_dPair.t_Pair B_dData_dMaybe.t_Maybe) -> ((Base_dBytes.v_thenPair ((v_decIr fuel) c)) (fun (f : Vuna_dIr_dModel.t_Ir) (c1 : Base_dBytes.t_Cur) -> ((((v_decIrApp2 fuel) c1) appTy) f))))
# 565 "Vuna/Ir/Codec.vuna"
and v_decIrApp2 = (fun (fuel : int) (c : Base_dBytes.t_Cur) (appTy : (Vuna_dIr_dModel.t_IrTy, Vuna_dIr_dModel.t_IrTy) B_dData_dPair.t_Pair B_dData_dMaybe.t_Maybe) (f : Vuna_dIr_dModel.t_Ir) -> ((Base_dBytes.v_thenPair ((v_decIr fuel) c)) (fun (a : Vuna_dIr_dModel.t_Ir) (c1 : Base_dBytes.t_Cur) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Vuna_dIr_dModel.C_Ir_IrApp (appTy, f, a)); B_dData_dPair.f_Pair_second = c1 })))))
# 568 "Vuna/Ir/Codec.vuna"
and v_decIrTail = (fun (fuel : int) (c : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair ((v_decIr fuel) c)) (fun (inner : Vuna_dIr_dModel.t_Ir) (c1 : Base_dBytes.t_Cur) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Vuna_dIr_dModel.C_Ir_IrTail (inner)); B_dData_dPair.f_Pair_second = c1 })))))
# 571 "Vuna/Ir/Codec.vuna"
and v_decIrIf = (fun (fuel : int) (c : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair ((v_decIr fuel) c)) (fun (cond : Vuna_dIr_dModel.t_Ir) (c1 : Base_dBytes.t_Cur) -> (((v_decIrIf1 fuel) c1) cond))))
# 574 "Vuna/Ir/Codec.vuna"
and v_decIrIf1 = (fun (fuel : int) (c : Base_dBytes.t_Cur) (cond : Vuna_dIr_dModel.t_Ir) -> ((Base_dBytes.v_thenPair ((v_decIr fuel) c)) (fun (th : Vuna_dIr_dModel.t_Ir) (c1 : Base_dBytes.t_Cur) -> ((((v_decIrIf2 fuel) c1) cond) th))))
# 577 "Vuna/Ir/Codec.vuna"
and v_decIrIf2 = (fun (fuel : int) (c : Base_dBytes.t_Cur) (cond : Vuna_dIr_dModel.t_Ir) (th : Vuna_dIr_dModel.t_Ir) -> ((Base_dBytes.v_thenPair ((v_decIr fuel) c)) (fun (el : Vuna_dIr_dModel.t_Ir) (c1 : Base_dBytes.t_Cur) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Vuna_dIr_dModel.C_Ir_IrIf (cond, th, el)); B_dData_dPair.f_Pair_second = c1 })))))
# 580 "Vuna/Ir/Codec.vuna"
and v_decIrCase = (fun (fuel : int) (c : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair ((v_decIrTyM fuel) c)) (fun (scrutTy : Vuna_dIr_dModel.t_IrTy B_dData_dMaybe.t_Maybe) (c1 : Base_dBytes.t_Cur) -> (((v_decIrCase1 fuel) c1) scrutTy))))
# 583 "Vuna/Ir/Codec.vuna"
and v_decIrCase1 = (fun (fuel : int) (c : Base_dBytes.t_Cur) (scrutTy : Vuna_dIr_dModel.t_IrTy B_dData_dMaybe.t_Maybe) -> ((Base_dBytes.v_thenPair ((v_decIrTyM fuel) c)) (fun (resTy : Vuna_dIr_dModel.t_IrTy B_dData_dMaybe.t_Maybe) (c1 : Base_dBytes.t_Cur) -> ((((v_decIrCase2 fuel) c1) scrutTy) resTy))))
# 587 "Vuna/Ir/Codec.vuna"
and v_decIrCase2 = (fun (fuel : int) (c : Base_dBytes.t_Cur) (scrutTy : Vuna_dIr_dModel.t_IrTy B_dData_dMaybe.t_Maybe) (resTy : Vuna_dIr_dModel.t_IrTy B_dData_dMaybe.t_Maybe) -> ((Base_dBytes.v_thenPair ((v_decIr fuel) c)) (fun (scrut : Vuna_dIr_dModel.t_Ir) (c1 : Base_dBytes.t_Cur) -> (((((v_decIrCase3 fuel) c1) scrutTy) resTy) scrut))))
# 591 "Vuna/Ir/Codec.vuna"
and v_decIrCase3 = (fun (fuel : int) (c : Base_dBytes.t_Cur) (scrutTy : Vuna_dIr_dModel.t_IrTy B_dData_dMaybe.t_Maybe) (resTy : Vuna_dIr_dModel.t_IrTy B_dData_dMaybe.t_Maybe) (scrut : Vuna_dIr_dModel.t_Ir) -> ((Base_dBytes.v_thenPair ((v_decAlts fuel) c)) (fun (alts : Vuna_dIr_dModel.t_IrAlt B_dData_dList.t_List) (c1 : Base_dBytes.t_Cur) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Vuna_dIr_dModel.C_Ir_IrCase (scrutTy, resTy, scrut, alts)); B_dData_dPair.f_Pair_second = c1 })))))
# 595 "Vuna/Ir/Codec.vuna"
and v_decIrNatCase = (fun (fuel : int) (c : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair ((v_decIr fuel) c)) (fun (scrut : Vuna_dIr_dModel.t_Ir) (c1 : Base_dBytes.t_Cur) -> (((v_decIrNatCase1 fuel) c1) scrut))))
# 598 "Vuna/Ir/Codec.vuna"
and v_decIrNatCase1 = (fun (fuel : int) (c : Base_dBytes.t_Cur) (scrut : Vuna_dIr_dModel.t_Ir) -> ((Base_dBytes.v_thenPair ((Base_dBytes.v_decInt fuel) c)) (fun (fresh : int) (c1 : Base_dBytes.t_Cur) -> ((((v_decIrNatCase2 fuel) c1) scrut) fresh))))
# 602 "Vuna/Ir/Codec.vuna"
and v_decIrNatCase2 = (fun (fuel : int) (c : Base_dBytes.t_Cur) (scrut : Vuna_dIr_dModel.t_Ir) (fresh : int) -> ((Base_dBytes.v_thenPair ((v_decAltM fuel) c)) (fun (zero : Vuna_dIr_dModel.t_IrAlt B_dData_dMaybe.t_Maybe) (c1 : Base_dBytes.t_Cur) -> (((((v_decIrNatCase3 fuel) c1) scrut) fresh) zero))))
# 606 "Vuna/Ir/Codec.vuna"
and v_decIrNatCase3 = (fun (fuel : int) (c : Base_dBytes.t_Cur) (scrut : Vuna_dIr_dModel.t_Ir) (fresh : int) (zero : Vuna_dIr_dModel.t_IrAlt B_dData_dMaybe.t_Maybe) -> ((Base_dBytes.v_thenPair ((v_decAltM fuel) c)) (fun (succ : Vuna_dIr_dModel.t_IrAlt B_dData_dMaybe.t_Maybe) (c1 : Base_dBytes.t_Cur) -> ((((((v_decIrNatCase4 fuel) c1) scrut) fresh) zero) succ))))
# 610 "Vuna/Ir/Codec.vuna"
and v_decIrNatCase4 = (fun (fuel : int) (c : Base_dBytes.t_Cur) (scrut : Vuna_dIr_dModel.t_Ir) (fresh : int) (zero : Vuna_dIr_dModel.t_IrAlt B_dData_dMaybe.t_Maybe) (succ : Vuna_dIr_dModel.t_IrAlt B_dData_dMaybe.t_Maybe) -> ((Base_dBytes.v_thenPair ((v_decAltM fuel) c)) (fun (catch : Vuna_dIr_dModel.t_IrAlt B_dData_dMaybe.t_Maybe) (c1 : Base_dBytes.t_Cur) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Vuna_dIr_dModel.C_Ir_IrNatCase (scrut, fresh, zero, succ, catch)); B_dData_dPair.f_Pair_second = c1 })))))
# 614 "Vuna/Ir/Codec.vuna"
and v_decIrConcat = (fun (fuel : int) (c : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair ((v_decIrs fuel) c)) (fun (parts : Vuna_dIr_dModel.t_Ir B_dData_dList.t_List) (c1 : Base_dBytes.t_Cur) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Vuna_dIr_dModel.C_Ir_IrConcatMany (parts)); B_dData_dPair.f_Pair_second = c1 })))))
# 617 "Vuna/Ir/Codec.vuna"
and v_decIrEffThunk = (fun (fuel : int) (c : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair ((Base_dBytes.v_decStr fuel) c)) (fun (fam : string) (c1 : Base_dBytes.t_Cur) -> (((v_decIrEffThunk1 fuel) c1) fam))))
# 620 "Vuna/Ir/Codec.vuna"
and v_decIrEffThunk1 = (fun (fuel : int) (c : Base_dBytes.t_Cur) (fam : string) -> ((Base_dBytes.v_thenPair ((Base_dBytes.v_decStr fuel) c)) (fun (ctor : string) (c1 : Base_dBytes.t_Cur) -> ((((v_decIrEffThunk2 fuel) c1) fam) ctor))))
# 624 "Vuna/Ir/Codec.vuna"
and v_decIrEffThunk2 = (fun (fuel : int) (c : Base_dBytes.t_Cur) (fam : string) (ctor : string) -> ((Base_dBytes.v_thenPair ((v_decIrTy fuel) c)) (fun (unitTy : Vuna_dIr_dModel.t_IrTy) (c1 : Base_dBytes.t_Cur) -> (((((v_decIrEffThunk3 fuel) c1) fam) ctor) unitTy))))
# 628 "Vuna/Ir/Codec.vuna"
and v_decIrEffThunk3 = (fun (fuel : int) (c : Base_dBytes.t_Cur) (fam : string) (ctor : string) (unitTy : Vuna_dIr_dModel.t_IrTy) -> ((Base_dBytes.v_thenPair ((Base_dBytes.v_decInt fuel) c)) (fun (arity : int) (c1 : Base_dBytes.t_Cur) -> ((((((v_decIrEffThunk4 fuel) c1) fam) ctor) unitTy) arity))))
# 632 "Vuna/Ir/Codec.vuna"
and v_decIrEffThunk4 = (fun (fuel : int) (c : Base_dBytes.t_Cur) (fam : string) (ctor : string) (unitTy : Vuna_dIr_dModel.t_IrTy) (arity : int) -> ((Base_dBytes.v_thenPair ((v_decIr fuel) c)) (fun (prim : Vuna_dIr_dModel.t_Ir) (c1 : Base_dBytes.t_Cur) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Vuna_dIr_dModel.C_Ir_IrEffThunk (fam, ctor, unitTy, arity, prim)); B_dData_dPair.f_Pair_second = c1 })))))
# 647 "Vuna/Ir/Codec.vuna"
and v_decIrs = (fun (fuel : int) (c : Base_dBytes.t_Cur) -> (if (fuel <= 0) then B_dData_dMaybe.C_Maybe_Nothing else (let nd_uscrut2 = (Base_dBytes.v_curChar c) in (match nd_uscrut2 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__89) -> (if (dtb__89 = 91) then ((Base_dBytes.v_thenPair ((Base_dBytes.v_decListHead (fuel - 1)) c)) (fun (n : int) (c1 : Base_dBytes.t_Cur) -> ((((v_decIrsGo n) (fuel - 1)) c1) B_dData_dList.C_List_Nil))) else B_dData_dMaybe.C_Maybe_Nothing)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
))))
# 656 "Vuna/Ir/Codec.vuna"
and v_decIrsGo = (fun (n : int) (fuel : int) (c : Base_dBytes.t_Cur) (acc : Vuna_dIr_dModel.t_Ir B_dData_dList.t_List) -> (if (n <= 0) then (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (B_dData_dList.v_reverse acc); B_dData_dPair.f_Pair_second = c })) else (if (fuel <= 0) then B_dData_dMaybe.C_Maybe_Nothing else ((Base_dBytes.v_thenPair ((v_decIr fuel) c)) (fun (x : Vuna_dIr_dModel.t_Ir) (c1 : Base_dBytes.t_Cur) -> ((((v_decIrsGo (n - 1)) (fuel - 1)) c1) (B_dData_dList.C_List__x58__x58_ (x, acc))))))))

# 668 "Vuna/Ir/Codec.vuna"
let v_encTyDecl = (fun (fuel : int) (decl : Vuna_dIr_dModel.t_IrTyDecl) (acc : string B_dData_dList.t_List) -> (if (fuel <= 0) then acc else (match decl with
  | Vuna_dIr_dModel.C_IrTyDecl_IrVariantDecl (dtb__90, dtb__91, dtb__92) -> ((Base_dBytes.v_encTag 0) ((Base_dBytes.v_encStr dtb__90) ((Base_dBytes.v_encInt dtb__91) (((Base_dBytes.v_encList ((Base_dBytes.v_encPair Base_dBytes.v_encStr) (v_encIrTys (fuel - 1)))) dtb__92) acc))))
  | Vuna_dIr_dModel.C_IrTyDecl_IrRecordDecl (dtb__93, dtb__94, dtb__95, dtb__96) -> ((Base_dBytes.v_encTag 1) ((Base_dBytes.v_encStr dtb__93) ((Base_dBytes.v_encInt dtb__94) (((Base_dBytes.v_encList ((Base_dBytes.v_encPair Base_dBytes.v_encInt) Base_dBytes.v_encStr)) dtb__95) (((v_encIrTys (fuel - 1)) dtb__96) acc)))))
  | Vuna_dIr_dModel.C_IrTyDecl_IrUnboxedDecl (dtb__97, dtb__98, dtb__99) -> ((Base_dBytes.v_encTag 2) ((Base_dBytes.v_encStr dtb__97) ((Base_dBytes.v_encInt dtb__98) (((v_encIrTy (fuel - 1)) dtb__99) acc))))
  | _ -> failwith "DT: impossible branch"
)))

# 698 "Vuna/Ir/Codec.vuna"
let v_decTyDeclVariant2 = (fun (fuel : int) (c : Base_dBytes.t_Cur) (fam : string) (arity : int) -> ((Base_dBytes.v_thenPair (((Base_dBytes.v_decList ((Base_dBytes.v_decPair Base_dBytes.v_decStr) v_decIrTys)) fuel) c)) (fun (ctors : (string, Vuna_dIr_dModel.t_IrTy B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (c1 : Base_dBytes.t_Cur) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Vuna_dIr_dModel.C_IrTyDecl_IrVariantDecl (fam, arity, ctors)); B_dData_dPair.f_Pair_second = c1 })))))

# 694 "Vuna/Ir/Codec.vuna"
let v_decTyDeclVariant1 = (fun (fuel : int) (c : Base_dBytes.t_Cur) (fam : string) -> ((Base_dBytes.v_thenPair ((Base_dBytes.v_decInt fuel) c)) (fun (arity : int) (c1 : Base_dBytes.t_Cur) -> ((((v_decTyDeclVariant2 fuel) c1) fam) arity))))

# 691 "Vuna/Ir/Codec.vuna"
let v_decTyDeclVariant = (fun (fuel : int) (c : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair ((Base_dBytes.v_decStr fuel) c)) (fun (fam : string) (c1 : Base_dBytes.t_Cur) -> (((v_decTyDeclVariant1 fuel) c1) fam))))

# 717 "Vuna/Ir/Codec.vuna"
let v_decTyDeclRecord3 = (fun (fuel : int) (c : Base_dBytes.t_Cur) (fam : string) (arity : int) (order : (int, string) B_dData_dPair.t_Pair B_dData_dList.t_List) -> ((Base_dBytes.v_thenPair ((v_decIrTys fuel) c)) (fun (tys : Vuna_dIr_dModel.t_IrTy B_dData_dList.t_List) (c1 : Base_dBytes.t_Cur) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Vuna_dIr_dModel.C_IrTyDecl_IrRecordDecl (fam, arity, order, tys)); B_dData_dPair.f_Pair_second = c1 })))))

# 711 "Vuna/Ir/Codec.vuna"
let v_decTyDeclRecord2 = (fun (fuel : int) (c : Base_dBytes.t_Cur) (fam : string) (arity : int) -> ((Base_dBytes.v_thenPair (((Base_dBytes.v_decList ((Base_dBytes.v_decPair Base_dBytes.v_decInt) Base_dBytes.v_decStr)) fuel) c)) (fun (order : (int, string) B_dData_dPair.t_Pair B_dData_dList.t_List) (c1 : Base_dBytes.t_Cur) -> (((((v_decTyDeclRecord3 fuel) c1) fam) arity) order))))

# 707 "Vuna/Ir/Codec.vuna"
let v_decTyDeclRecord1 = (fun (fuel : int) (c : Base_dBytes.t_Cur) (fam : string) -> ((Base_dBytes.v_thenPair ((Base_dBytes.v_decInt fuel) c)) (fun (arity : int) (c1 : Base_dBytes.t_Cur) -> ((((v_decTyDeclRecord2 fuel) c1) fam) arity))))

# 704 "Vuna/Ir/Codec.vuna"
let v_decTyDeclRecord = (fun (fuel : int) (c : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair ((Base_dBytes.v_decStr fuel) c)) (fun (fam : string) (c1 : Base_dBytes.t_Cur) -> (((v_decTyDeclRecord1 fuel) c1) fam))))

# 728 "Vuna/Ir/Codec.vuna"
let v_decTyDeclUnboxed2 = (fun (fuel : int) (c : Base_dBytes.t_Cur) (fam : string) (arity : int) -> ((Base_dBytes.v_thenPair ((v_decIrTy fuel) c)) (fun (ty : Vuna_dIr_dModel.t_IrTy) (c1 : Base_dBytes.t_Cur) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Vuna_dIr_dModel.C_IrTyDecl_IrUnboxedDecl (fam, arity, ty)); B_dData_dPair.f_Pair_second = c1 })))))

# 724 "Vuna/Ir/Codec.vuna"
let v_decTyDeclUnboxed1 = (fun (fuel : int) (c : Base_dBytes.t_Cur) (fam : string) -> ((Base_dBytes.v_thenPair ((Base_dBytes.v_decInt fuel) c)) (fun (arity : int) (c1 : Base_dBytes.t_Cur) -> ((((v_decTyDeclUnboxed2 fuel) c1) fam) arity))))

# 721 "Vuna/Ir/Codec.vuna"
let v_decTyDeclUnboxed = (fun (fuel : int) (c : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair ((Base_dBytes.v_decStr fuel) c)) (fun (fam : string) (c1 : Base_dBytes.t_Cur) -> (((v_decTyDeclUnboxed1 fuel) c1) fam))))

# 685 "Vuna/Ir/Codec.vuna"
let v_decTyDeclTag = (fun (mc0 : int) (mc1 : int) (mc2 : Base_dBytes.t_Cur) -> (if (mc0 = 0) then ((v_decTyDeclVariant mc1) mc2) else (if (mc0 = 1) then ((v_decTyDeclRecord mc1) mc2) else (if (mc0 = 2) then ((v_decTyDeclUnboxed mc1) mc2) else B_dData_dMaybe.C_Maybe_Nothing))))

# 678 "Vuna/Ir/Codec.vuna"
let v_decTyDecl = (fun (fuel : int) (c : Base_dBytes.t_Cur) -> (if (fuel <= 0) then B_dData_dMaybe.C_Maybe_Nothing else ((Base_dBytes.v_thenPair ((Base_dBytes.v_decTag fuel) c)) (fun (tag : int) (c1 : Base_dBytes.t_Cur) -> (((v_decTyDeclTag tag) (fuel - 1)) c1)))))

# 735 "Vuna/Ir/Codec.vuna"
let v_encDef = (fun (fuel : int) (decl : Vuna_dIr_dModel.t_IrDef) (acc : string B_dData_dList.t_List) -> (if (fuel <= 0) then acc else (match decl with
  | Vuna_dIr_dModel.C_IrDef_IrDef (dtb__100, dtb__101, dtb__102, dtb__103, dtb__104, dtb__105, dtb__106, dtb__107) -> ((Base_dBytes.v_encTag 0) ((Base_dBytes.v_encStr dtb__100) ((Base_dBytes.v_encInt dtb__101) ((v_encStrs dtb__102) (((v_encIrTyM (fuel - 1)) dtb__103) (((v_encIr (fuel - 1)) dtb__104) ((Base_dBytes.v_encBool dtb__105) ((Base_dBytes.v_encBool dtb__106) ((v_encSpanM dtb__107) acc)))))))))
  | Vuna_dIr_dModel.C_IrDef_IrExternDef (dtb__108, dtb__109, dtb__110, dtb__111) -> ((Base_dBytes.v_encTag 1) ((Base_dBytes.v_encStr dtb__108) (((v_encIrTy (fuel - 1)) dtb__109) ((Base_dBytes.v_encStr dtb__110) ((v_encSpanM dtb__111) acc)))))
  | _ -> failwith "DT: impossible branch"
)))

# 784 "Vuna/Ir/Codec.vuna"
let v_decDefRec7 = (fun (fuel : int) (c : Base_dBytes.t_Cur) (name : string) (arity : int) (deps : string B_dData_dList.t_List) (ty : Vuna_dIr_dModel.t_IrTy B_dData_dMaybe.t_Maybe) (body : Vuna_dIr_dModel.t_Ir) (recOk : bool) (initGuard : bool) -> ((Base_dBytes.v_thenPair ((v_decSpanM fuel) c)) (fun (span : Base_dSource.t_Span B_dData_dMaybe.t_Maybe) (c1 : Base_dBytes.t_Cur) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Vuna_dIr_dModel.C_IrDef_IrDef (name, arity, deps, ty, body, recOk, initGuard, span)); B_dData_dPair.f_Pair_second = c1 })))))

# 778 "Vuna/Ir/Codec.vuna"
let v_decDefRec6 = (fun (fuel : int) (c : Base_dBytes.t_Cur) (name : string) (arity : int) (deps : string B_dData_dList.t_List) (ty : Vuna_dIr_dModel.t_IrTy B_dData_dMaybe.t_Maybe) (body : Vuna_dIr_dModel.t_Ir) (recOk : bool) -> ((Base_dBytes.v_thenPair ((Base_dBytes.v_decBool fuel) c)) (fun (initGuard : bool) (c1 : Base_dBytes.t_Cur) -> (((((((((v_decDefRec7 fuel) c1) name) arity) deps) ty) body) recOk) initGuard))))

# 774 "Vuna/Ir/Codec.vuna"
let v_decDefRec5 = (fun (fuel : int) (c : Base_dBytes.t_Cur) (name : string) (arity : int) (deps : string B_dData_dList.t_List) (ty : Vuna_dIr_dModel.t_IrTy B_dData_dMaybe.t_Maybe) (body : Vuna_dIr_dModel.t_Ir) -> ((Base_dBytes.v_thenPair ((Base_dBytes.v_decBool fuel) c)) (fun (recOk : bool) (c1 : Base_dBytes.t_Cur) -> ((((((((v_decDefRec6 fuel) c1) name) arity) deps) ty) body) recOk))))

# 770 "Vuna/Ir/Codec.vuna"
let v_decDefRec4 = (fun (fuel : int) (c : Base_dBytes.t_Cur) (name : string) (arity : int) (deps : string B_dData_dList.t_List) (ty : Vuna_dIr_dModel.t_IrTy B_dData_dMaybe.t_Maybe) -> ((Base_dBytes.v_thenPair ((v_decIr fuel) c)) (fun (body : Vuna_dIr_dModel.t_Ir) (c1 : Base_dBytes.t_Cur) -> (((((((v_decDefRec5 fuel) c1) name) arity) deps) ty) body))))

# 766 "Vuna/Ir/Codec.vuna"
let v_decDefRec3 = (fun (fuel : int) (c : Base_dBytes.t_Cur) (name : string) (arity : int) (deps : string B_dData_dList.t_List) -> ((Base_dBytes.v_thenPair ((v_decIrTyM fuel) c)) (fun (ty : Vuna_dIr_dModel.t_IrTy B_dData_dMaybe.t_Maybe) (c1 : Base_dBytes.t_Cur) -> ((((((v_decDefRec4 fuel) c1) name) arity) deps) ty))))

# 762 "Vuna/Ir/Codec.vuna"
let v_decDefRec2 = (fun (fuel : int) (c : Base_dBytes.t_Cur) (name : string) (arity : int) -> ((Base_dBytes.v_thenPair ((v_decStrs fuel) c)) (fun (deps : string B_dData_dList.t_List) (c1 : Base_dBytes.t_Cur) -> (((((v_decDefRec3 fuel) c1) name) arity) deps))))

# 759 "Vuna/Ir/Codec.vuna"
let v_decDefRec1 = (fun (fuel : int) (c : Base_dBytes.t_Cur) (name : string) -> ((Base_dBytes.v_thenPair ((Base_dBytes.v_decInt fuel) c)) (fun (arity : int) (c1 : Base_dBytes.t_Cur) -> ((((v_decDefRec2 fuel) c1) name) arity))))

# 756 "Vuna/Ir/Codec.vuna"
let v_decDefRec = (fun (fuel : int) (c : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair ((Base_dBytes.v_decStr fuel) c)) (fun (name : string) (c1 : Base_dBytes.t_Cur) -> (((v_decDefRec1 fuel) c1) name))))

# 800 "Vuna/Ir/Codec.vuna"
let v_decDefExtern3 = (fun (fuel : int) (c : Base_dBytes.t_Cur) (name : string) (ty : Vuna_dIr_dModel.t_IrTy) (cName : string) -> ((Base_dBytes.v_thenPair ((v_decSpanM fuel) c)) (fun (span : Base_dSource.t_Span B_dData_dMaybe.t_Maybe) (c1 : Base_dBytes.t_Cur) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Vuna_dIr_dModel.C_IrDef_IrExternDef (name, ty, cName, span)); B_dData_dPair.f_Pair_second = c1 })))))

# 796 "Vuna/Ir/Codec.vuna"
let v_decDefExtern2 = (fun (fuel : int) (c : Base_dBytes.t_Cur) (name : string) (ty : Vuna_dIr_dModel.t_IrTy) -> ((Base_dBytes.v_thenPair ((Base_dBytes.v_decStr fuel) c)) (fun (cName : string) (c1 : Base_dBytes.t_Cur) -> (((((v_decDefExtern3 fuel) c1) name) ty) cName))))

# 793 "Vuna/Ir/Codec.vuna"
let v_decDefExtern1 = (fun (fuel : int) (c : Base_dBytes.t_Cur) (name : string) -> ((Base_dBytes.v_thenPair ((v_decIrTy fuel) c)) (fun (ty : Vuna_dIr_dModel.t_IrTy) (c1 : Base_dBytes.t_Cur) -> ((((v_decDefExtern2 fuel) c1) name) ty))))

# 790 "Vuna/Ir/Codec.vuna"
let v_decDefExtern = (fun (fuel : int) (c : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair ((Base_dBytes.v_decStr fuel) c)) (fun (name : string) (c1 : Base_dBytes.t_Cur) -> (((v_decDefExtern1 fuel) c1) name))))

# 751 "Vuna/Ir/Codec.vuna"
let v_decDefTag = (fun (mc0 : int) (mc1 : int) (mc2 : Base_dBytes.t_Cur) -> (if (mc0 = 0) then ((v_decDefRec mc1) mc2) else (if (mc0 = 1) then ((v_decDefExtern mc1) mc2) else B_dData_dMaybe.C_Maybe_Nothing)))

# 744 "Vuna/Ir/Codec.vuna"
let v_decDef = (fun (fuel : int) (c : Base_dBytes.t_Cur) -> (if (fuel <= 0) then B_dData_dMaybe.C_Maybe_Nothing else ((Base_dBytes.v_thenPair ((Base_dBytes.v_decTag fuel) c)) (fun (tag : int) (c1 : Base_dBytes.t_Cur) -> (((v_decDefTag tag) (fuel - 1)) c1)))))

# 804 "Vuna/Ir/Codec.vuna"
let v_encGroup = (fun (mc0 : int) (mc1 : Vuna_dIr_dModel.t_IrGroup) (mc2 : string B_dData_dList.t_List) -> (match mc1 with
  | { Vuna_dIr_dModel.f_IrGroup_irGroupIsRec = dtb__112; Vuna_dIr_dModel.f_IrGroup_irGroupDefs = dtb__113 } -> ((Base_dBytes.v_encBool dtb__112) (((Base_dBytes.v_encList (v_encDef (mc0 - 1))) dtb__113) mc2))
  | _ -> failwith "DT: impossible branch"
))

# 810 "Vuna/Ir/Codec.vuna"
let v_decGroup1 = (fun (fuel : int) (c : Base_dBytes.t_Cur) (isRec : bool) -> ((Base_dBytes.v_thenPair (((Base_dBytes.v_decList v_decDef) fuel) c)) (fun (defs : Vuna_dIr_dModel.t_IrDef B_dData_dList.t_List) (c1 : Base_dBytes.t_Cur) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = { Vuna_dIr_dModel.f_IrGroup_irGroupIsRec = isRec; Vuna_dIr_dModel.f_IrGroup_irGroupDefs = defs }; B_dData_dPair.f_Pair_second = c1 })))))

# 807 "Vuna/Ir/Codec.vuna"
let v_decGroup = (fun (fuel : int) (c : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair ((Base_dBytes.v_decBool fuel) c)) (fun (isRec : bool) (c1 : Base_dBytes.t_Cur) -> (((v_decGroup1 fuel) c1) isRec))))

# 817 "Vuna/Ir/Codec.vuna"
let v_encEntry = (fun (fuel : int) (e : Vuna_dIr_dModel.t_IrEntry) (acc : string B_dData_dList.t_List) -> (((v_encIr (fuel - 1)) (e).Vuna_dIr_dModel.f_IrEntry_irEntryShow) ((Base_dBytes.v_encStr (e).Vuna_dIr_dModel.f_IrEntry_irEntryMain) ((Base_dBytes.v_encBool (e).Vuna_dIr_dModel.f_IrEntry_irEntryIsAction) (((Base_dBytes.v_encMaybe Base_dBytes.v_encStr) (e).Vuna_dIr_dModel.f_IrEntry_irEntryRunMain) ((v_encStrs (e).Vuna_dIr_dModel.f_IrEntry_irEntryHandlers) ((v_encStrs (e).Vuna_dIr_dModel.f_IrEntry_irEntryRowTags) acc)))))))

# 846 "Vuna/Ir/Codec.vuna"
let v_decEntry5 = (fun (fuel : int) (c : Base_dBytes.t_Cur) (show : Vuna_dIr_dModel.t_Ir) (main : string) (isAction : bool) (runMain : string B_dData_dMaybe.t_Maybe) (handlers : string B_dData_dList.t_List) -> ((Base_dBytes.v_thenPair ((v_decStrs fuel) c)) (fun (rowTags : string B_dData_dList.t_List) (c1 : Base_dBytes.t_Cur) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = { Vuna_dIr_dModel.f_IrEntry_irEntryShow = show; Vuna_dIr_dModel.f_IrEntry_irEntryMain = main; Vuna_dIr_dModel.f_IrEntry_irEntryIsAction = isAction; Vuna_dIr_dModel.f_IrEntry_irEntryRunMain = runMain; Vuna_dIr_dModel.f_IrEntry_irEntryHandlers = handlers; Vuna_dIr_dModel.f_IrEntry_irEntryRowTags = rowTags }; B_dData_dPair.f_Pair_second = c1 })))))

# 840 "Vuna/Ir/Codec.vuna"
let v_decEntry4 = (fun (fuel : int) (c : Base_dBytes.t_Cur) (show : Vuna_dIr_dModel.t_Ir) (main : string) (isAction : bool) (runMain : string B_dData_dMaybe.t_Maybe) -> ((Base_dBytes.v_thenPair ((v_decStrs fuel) c)) (fun (handlers : string B_dData_dList.t_List) (c1 : Base_dBytes.t_Cur) -> (((((((v_decEntry5 fuel) c1) show) main) isAction) runMain) handlers))))

# 834 "Vuna/Ir/Codec.vuna"
let v_decEntry3 = (fun (fuel : int) (c : Base_dBytes.t_Cur) (show : Vuna_dIr_dModel.t_Ir) (main : string) (isAction : bool) -> ((Base_dBytes.v_thenPair (((Base_dBytes.v_decMaybe Base_dBytes.v_decStr) fuel) c)) (fun (runMain : string B_dData_dMaybe.t_Maybe) (c1 : Base_dBytes.t_Cur) -> ((((((v_decEntry4 fuel) c1) show) main) isAction) runMain))))

# 830 "Vuna/Ir/Codec.vuna"
let v_decEntry2 = (fun (fuel : int) (c : Base_dBytes.t_Cur) (show : Vuna_dIr_dModel.t_Ir) (main : string) -> ((Base_dBytes.v_thenPair ((Base_dBytes.v_decBool fuel) c)) (fun (isAction : bool) (c1 : Base_dBytes.t_Cur) -> (((((v_decEntry3 fuel) c1) show) main) isAction))))

# 827 "Vuna/Ir/Codec.vuna"
let v_decEntry1 = (fun (fuel : int) (c : Base_dBytes.t_Cur) (show : Vuna_dIr_dModel.t_Ir) -> ((Base_dBytes.v_thenPair ((Base_dBytes.v_decStr fuel) c)) (fun (main : string) (c1 : Base_dBytes.t_Cur) -> ((((v_decEntry2 fuel) c1) show) main))))

# 824 "Vuna/Ir/Codec.vuna"
let v_decEntry = (fun (fuel : int) (c : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair ((v_decIr fuel) c)) (fun (show : Vuna_dIr_dModel.t_Ir) (c1 : Base_dBytes.t_Cur) -> (((v_decEntry1 fuel) c1) show))))

# 855 "Vuna/Ir/Codec.vuna"
let v_encListFam = (fun (mc0 : Vuna_dIr_dModel.t_IrListFam) (mc1 : string B_dData_dList.t_List) -> (match mc0 with
  | { Vuna_dIr_dModel.f_IrListFam_irListFamily = dtb__114; Vuna_dIr_dModel.f_IrListFam_irListNil = dtb__115; Vuna_dIr_dModel.f_IrListFam_irListCons = dtb__116 } -> ((Base_dBytes.v_encStr dtb__114) ((Base_dBytes.v_encStr dtb__115) ((Base_dBytes.v_encStr dtb__116) mc1)))
  | _ -> failwith "DT: impossible branch"
))

# 864 "Vuna/Ir/Codec.vuna"
let v_decListFam2 = (fun (fuel : int) (c : Base_dBytes.t_Cur) (fam : string) (nil : string) -> ((Base_dBytes.v_thenPair ((Base_dBytes.v_decStr fuel) c)) (fun (cons : string) (c1 : Base_dBytes.t_Cur) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = { Vuna_dIr_dModel.f_IrListFam_irListFamily = fam; Vuna_dIr_dModel.f_IrListFam_irListNil = nil; Vuna_dIr_dModel.f_IrListFam_irListCons = cons }; B_dData_dPair.f_Pair_second = c1 })))))

# 861 "Vuna/Ir/Codec.vuna"
let v_decListFam1 = (fun (fuel : int) (c : Base_dBytes.t_Cur) (fam : string) -> ((Base_dBytes.v_thenPair ((Base_dBytes.v_decStr fuel) c)) (fun (nil : string) (c1 : Base_dBytes.t_Cur) -> ((((v_decListFam2 fuel) c1) fam) nil))))

# 858 "Vuna/Ir/Codec.vuna"
let v_decListFam = (fun (fuel : int) (c : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair ((Base_dBytes.v_decStr fuel) c)) (fun (fam : string) (c1 : Base_dBytes.t_Cur) -> (((v_decListFam1 fuel) c1) fam))))

# 869 "Vuna/Ir/Codec.vuna"
let v_decFieldOrder = (fun (fuel : int) (c : Base_dBytes.t_Cur) -> (((Base_dBytes.v_decList ((Base_dBytes.v_decPair Base_dBytes.v_decInt) Base_dBytes.v_decStr)) fuel) c))

# 873 "Vuna/Ir/Codec.vuna"
let v_decNamedInt = (fun (fuel : int) (c : Base_dBytes.t_Cur) -> (((Base_dBytes.v_decList ((Base_dBytes.v_decPair Base_dBytes.v_decStr) ((Base_dBytes.v_decPair Base_dBytes.v_decStr) Base_dBytes.v_decInt))) fuel) c))

# 877 "Vuna/Ir/Codec.vuna"
let v_decCtorShapes = (fun (fuel : int) (c : Base_dBytes.t_Cur) -> (((Base_dBytes.v_decList ((Base_dBytes.v_decPair Base_dBytes.v_decStr) ((Base_dBytes.v_decPair Base_dBytes.v_decStr) v_decBools))) fuel) c))

# 880 "Vuna/Ir/Codec.vuna"
let v_encShared = (fun (s : Vuna_dIr_dModel.t_IrShared) (acc : string B_dData_dList.t_List) -> (((Base_dBytes.v_encList ((Base_dBytes.v_encPair Base_dBytes.v_encStr) (Base_dBytes.v_encList ((Base_dBytes.v_encPair Base_dBytes.v_encInt) Base_dBytes.v_encStr)))) (s).Vuna_dIr_dModel.f_IrShared_irSharedRecordFields) (((Base_dBytes.v_encMaybe v_encListFam) (s).Vuna_dIr_dModel.f_IrShared_irSharedListFam) ((Base_dBytes.v_encBool (s).Vuna_dIr_dModel.f_IrShared_irSharedUsesFloat) ((Base_dBytes.v_encBool (s).Vuna_dIr_dModel.f_IrShared_irSharedUsesTrace) ((Base_dBytes.v_encBool (s).Vuna_dIr_dModel.f_IrShared_irSharedUsesObs) (((Base_dBytes.v_encList ((Base_dBytes.v_encPair Base_dBytes.v_encStr) ((Base_dBytes.v_encPair Base_dBytes.v_encStr) Base_dBytes.v_encInt))) (s).Vuna_dIr_dModel.f_IrShared_irSharedDefLocs) (((Base_dBytes.v_encList ((Base_dBytes.v_encPair Base_dBytes.v_encStr) ((Base_dBytes.v_encPair Base_dBytes.v_encStr) Base_dBytes.v_encInt))) (s).Vuna_dIr_dModel.f_IrShared_irSharedUnboxed) (((Base_dBytes.v_encList ((Base_dBytes.v_encPair Base_dBytes.v_encStr) ((Base_dBytes.v_encPair Base_dBytes.v_encStr) v_encBools))) (s).Vuna_dIr_dModel.f_IrShared_irSharedCtorShapes) ((Base_dBytes.v_encBool (s).Vuna_dIr_dModel.f_IrShared_irSharedUsesHost) ((Base_dBytes.v_encBool (s).Vuna_dIr_dModel.f_IrShared_irSharedUsesSched) ((Base_dBytes.v_encBool (s).Vuna_dIr_dModel.f_IrShared_irSharedUsesEff) acc))))))))))))

# 943 "Vuna/Ir/Codec.vuna"
let v_decShared10 = (fun (fuel : int) (c : Base_dBytes.t_Cur) (recFields : (string, (int, string) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (listFam : Vuna_dIr_dModel.t_IrListFam B_dData_dMaybe.t_Maybe) (usesFloat : bool) (usesTrace : bool) (usesObs : bool) (defLocs : (string, (string, int) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (unboxed : (string, (string, int) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctorShapes : (string, (string, bool B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (usesHost : bool) (usesSched : bool) -> ((Base_dBytes.v_thenPair ((Base_dBytes.v_decBool fuel) c)) (fun (usesEff : bool) (c1 : Base_dBytes.t_Cur) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = { Vuna_dIr_dModel.f_IrShared_irSharedRecordFields = recFields; Vuna_dIr_dModel.f_IrShared_irSharedListFam = listFam; Vuna_dIr_dModel.f_IrShared_irSharedUsesFloat = usesFloat; Vuna_dIr_dModel.f_IrShared_irSharedUsesTrace = usesTrace; Vuna_dIr_dModel.f_IrShared_irSharedUsesObs = usesObs; Vuna_dIr_dModel.f_IrShared_irSharedDefLocs = defLocs; Vuna_dIr_dModel.f_IrShared_irSharedUnboxed = unboxed; Vuna_dIr_dModel.f_IrShared_irSharedCtorShapes = ctorShapes; Vuna_dIr_dModel.f_IrShared_irSharedUsesHost = usesHost; Vuna_dIr_dModel.f_IrShared_irSharedUsesSched = usesSched; Vuna_dIr_dModel.f_IrShared_irSharedUsesEff = usesEff }; B_dData_dPair.f_Pair_second = c1 })))))

# 937 "Vuna/Ir/Codec.vuna"
let v_decShared9 = (fun (fuel : int) (c : Base_dBytes.t_Cur) (recFields : (string, (int, string) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (listFam : Vuna_dIr_dModel.t_IrListFam B_dData_dMaybe.t_Maybe) (usesFloat : bool) (usesTrace : bool) (usesObs : bool) (defLocs : (string, (string, int) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (unboxed : (string, (string, int) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctorShapes : (string, (string, bool B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (usesHost : bool) -> ((Base_dBytes.v_thenPair ((Base_dBytes.v_decBool fuel) c)) (fun (usesSched : bool) (c1 : Base_dBytes.t_Cur) -> ((((((((((((v_decShared10 fuel) c1) recFields) listFam) usesFloat) usesTrace) usesObs) defLocs) unboxed) ctorShapes) usesHost) usesSched))))

# 931 "Vuna/Ir/Codec.vuna"
let v_decShared8 = (fun (fuel : int) (c : Base_dBytes.t_Cur) (recFields : (string, (int, string) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (listFam : Vuna_dIr_dModel.t_IrListFam B_dData_dMaybe.t_Maybe) (usesFloat : bool) (usesTrace : bool) (usesObs : bool) (defLocs : (string, (string, int) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (unboxed : (string, (string, int) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctorShapes : (string, (string, bool B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) -> ((Base_dBytes.v_thenPair ((Base_dBytes.v_decBool fuel) c)) (fun (usesHost : bool) (c1 : Base_dBytes.t_Cur) -> (((((((((((v_decShared9 fuel) c1) recFields) listFam) usesFloat) usesTrace) usesObs) defLocs) unboxed) ctorShapes) usesHost))))

# 925 "Vuna/Ir/Codec.vuna"
let v_decShared7 = (fun (fuel : int) (c : Base_dBytes.t_Cur) (recFields : (string, (int, string) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (listFam : Vuna_dIr_dModel.t_IrListFam B_dData_dMaybe.t_Maybe) (usesFloat : bool) (usesTrace : bool) (usesObs : bool) (defLocs : (string, (string, int) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (unboxed : (string, (string, int) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) -> ((Base_dBytes.v_thenPair ((v_decCtorShapes fuel) c)) (fun (ctorShapes : (string, (string, bool B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (c1 : Base_dBytes.t_Cur) -> ((((((((((v_decShared8 fuel) c1) recFields) listFam) usesFloat) usesTrace) usesObs) defLocs) unboxed) ctorShapes))))

# 919 "Vuna/Ir/Codec.vuna"
let v_decShared6 = (fun (fuel : int) (c : Base_dBytes.t_Cur) (recFields : (string, (int, string) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (listFam : Vuna_dIr_dModel.t_IrListFam B_dData_dMaybe.t_Maybe) (usesFloat : bool) (usesTrace : bool) (usesObs : bool) (defLocs : (string, (string, int) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) -> ((Base_dBytes.v_thenPair ((v_decNamedInt fuel) c)) (fun (unboxed : (string, (string, int) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (c1 : Base_dBytes.t_Cur) -> (((((((((v_decShared7 fuel) c1) recFields) listFam) usesFloat) usesTrace) usesObs) defLocs) unboxed))))

# 913 "Vuna/Ir/Codec.vuna"
let v_decShared5 = (fun (fuel : int) (c : Base_dBytes.t_Cur) (recFields : (string, (int, string) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (listFam : Vuna_dIr_dModel.t_IrListFam B_dData_dMaybe.t_Maybe) (usesFloat : bool) (usesTrace : bool) (usesObs : bool) -> ((Base_dBytes.v_thenPair ((v_decNamedInt fuel) c)) (fun (defLocs : (string, (string, int) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (c1 : Base_dBytes.t_Cur) -> ((((((((v_decShared6 fuel) c1) recFields) listFam) usesFloat) usesTrace) usesObs) defLocs))))

# 907 "Vuna/Ir/Codec.vuna"
let v_decShared4 = (fun (fuel : int) (c : Base_dBytes.t_Cur) (recFields : (string, (int, string) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (listFam : Vuna_dIr_dModel.t_IrListFam B_dData_dMaybe.t_Maybe) (usesFloat : bool) (usesTrace : bool) -> ((Base_dBytes.v_thenPair ((Base_dBytes.v_decBool fuel) c)) (fun (usesObs : bool) (c1 : Base_dBytes.t_Cur) -> (((((((v_decShared5 fuel) c1) recFields) listFam) usesFloat) usesTrace) usesObs))))

# 901 "Vuna/Ir/Codec.vuna"
let v_decShared3 = (fun (fuel : int) (c : Base_dBytes.t_Cur) (recFields : (string, (int, string) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (listFam : Vuna_dIr_dModel.t_IrListFam B_dData_dMaybe.t_Maybe) (usesFloat : bool) -> ((Base_dBytes.v_thenPair ((Base_dBytes.v_decBool fuel) c)) (fun (usesTrace : bool) (c1 : Base_dBytes.t_Cur) -> ((((((v_decShared4 fuel) c1) recFields) listFam) usesFloat) usesTrace))))

# 897 "Vuna/Ir/Codec.vuna"
let v_decShared2 = (fun (fuel : int) (c : Base_dBytes.t_Cur) (recFields : (string, (int, string) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (listFam : Vuna_dIr_dModel.t_IrListFam B_dData_dMaybe.t_Maybe) -> ((Base_dBytes.v_thenPair ((Base_dBytes.v_decBool fuel) c)) (fun (usesFloat : bool) (c1 : Base_dBytes.t_Cur) -> (((((v_decShared3 fuel) c1) recFields) listFam) usesFloat))))

# 893 "Vuna/Ir/Codec.vuna"
let v_decShared1 = (fun (fuel : int) (c : Base_dBytes.t_Cur) (recFields : (string, (int, string) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) -> ((Base_dBytes.v_thenPair (((Base_dBytes.v_decMaybe v_decListFam) fuel) c)) (fun (listFam : Vuna_dIr_dModel.t_IrListFam B_dData_dMaybe.t_Maybe) (c1 : Base_dBytes.t_Cur) -> ((((v_decShared2 fuel) c1) recFields) listFam))))

# 887 "Vuna/Ir/Codec.vuna"
let v_decShared = (fun (fuel : int) (c : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair (((Base_dBytes.v_decList ((Base_dBytes.v_decPair Base_dBytes.v_decStr) (Base_dBytes.v_decList ((Base_dBytes.v_decPair Base_dBytes.v_decInt) Base_dBytes.v_decStr)))) fuel) c)) (fun (recFields : (string, (int, string) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (c1 : Base_dBytes.t_Cur) -> (((v_decShared1 fuel) c1) recFields))))

# 952 "Vuna/Ir/Codec.vuna"
let v_encUnit = (fun (fuel : int) (u : Vuna_dIr_dModel.t_IrUnit) (acc : string B_dData_dList.t_List) -> (if (fuel <= 0) then acc else (((Base_dBytes.v_encList (v_encTyDecl (fuel - 1))) (u).Vuna_dIr_dModel.f_IrUnit_irUnitTyDecls) (((Base_dBytes.v_encList (v_encGroup (fuel - 1))) (u).Vuna_dIr_dModel.f_IrUnit_irUnitGroups) ((Base_dBytes.v_encBool (u).Vuna_dIr_dModel.f_IrUnit_irUnitHasListFamily) ((v_encStrs (u).Vuna_dIr_dModel.f_IrUnit_irUnitTypeRefs) (((Base_dBytes.v_encMaybe (v_encEntry (fuel - 1))) (u).Vuna_dIr_dModel.f_IrUnit_irUnitEntry) acc)))))))

# 981 "Vuna/Ir/Codec.vuna"
let v_decUnit4 = (fun (fuel : int) (c : Base_dBytes.t_Cur) (tyDecls : Vuna_dIr_dModel.t_IrTyDecl B_dData_dList.t_List) (groups : Vuna_dIr_dModel.t_IrGroup B_dData_dList.t_List) (hasListFamily : bool) (typeRefs : string B_dData_dList.t_List) -> ((Base_dBytes.v_thenPair (((Base_dBytes.v_decMaybe v_decEntry) fuel) c)) (fun (entry : Vuna_dIr_dModel.t_IrEntry B_dData_dMaybe.t_Maybe) (c1 : Base_dBytes.t_Cur) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = { Vuna_dIr_dModel.f_IrUnit_irUnitTyDecls = tyDecls; Vuna_dIr_dModel.f_IrUnit_irUnitGroups = groups; Vuna_dIr_dModel.f_IrUnit_irUnitHasListFamily = hasListFamily; Vuna_dIr_dModel.f_IrUnit_irUnitTypeRefs = typeRefs; Vuna_dIr_dModel.f_IrUnit_irUnitEntry = entry }; B_dData_dPair.f_Pair_second = c1 })))))

# 975 "Vuna/Ir/Codec.vuna"
let v_decUnit3 = (fun (fuel : int) (c : Base_dBytes.t_Cur) (tyDecls : Vuna_dIr_dModel.t_IrTyDecl B_dData_dList.t_List) (groups : Vuna_dIr_dModel.t_IrGroup B_dData_dList.t_List) (hasListFamily : bool) -> ((Base_dBytes.v_thenPair ((v_decStrs fuel) c)) (fun (typeRefs : string B_dData_dList.t_List) (c1 : Base_dBytes.t_Cur) -> ((((((v_decUnit4 fuel) c1) tyDecls) groups) hasListFamily) typeRefs))))

# 969 "Vuna/Ir/Codec.vuna"
let v_decUnit2 = (fun (fuel : int) (c : Base_dBytes.t_Cur) (tyDecls : Vuna_dIr_dModel.t_IrTyDecl B_dData_dList.t_List) (groups : Vuna_dIr_dModel.t_IrGroup B_dData_dList.t_List) -> ((Base_dBytes.v_thenPair ((Base_dBytes.v_decBool fuel) c)) (fun (hasListFamily : bool) (c1 : Base_dBytes.t_Cur) -> (((((v_decUnit3 fuel) c1) tyDecls) groups) hasListFamily))))

# 965 "Vuna/Ir/Codec.vuna"
let v_decUnit1 = (fun (fuel : int) (c : Base_dBytes.t_Cur) (tyDecls : Vuna_dIr_dModel.t_IrTyDecl B_dData_dList.t_List) -> ((Base_dBytes.v_thenPair (((Base_dBytes.v_decList v_decGroup) fuel) c)) (fun (groups : Vuna_dIr_dModel.t_IrGroup B_dData_dList.t_List) (c1 : Base_dBytes.t_Cur) -> ((((v_decUnit2 fuel) c1) tyDecls) groups))))

# 962 "Vuna/Ir/Codec.vuna"
let v_decUnit = (fun (fuel : int) (c : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair (((Base_dBytes.v_decList v_decTyDecl) fuel) c)) (fun (tyDecls : Vuna_dIr_dModel.t_IrTyDecl B_dData_dList.t_List) (c1 : Base_dBytes.t_Cur) -> (((v_decUnit1 fuel) c1) tyDecls))))

# 988 "Vuna/Ir/Codec.vuna"
let v_irEncoderFuel = 16777216

# 992 "Vuna/Ir/Codec.vuna"
let v_encodeProgram = (fun (p : Vuna_dIr_dModel.t_IrProgram) -> ((Base_dBytes.v_encTop (fun (x : Vuna_dIr_dModel.t_IrProgram) (acc : string B_dData_dList.t_List) -> ((v_encShared (Vuna_dIr_dModel.v_irProgSharedOf x)) (((v_encUnit v_irEncoderFuel) (Vuna_dIr_dModel.v_irProgUnitOf x)) acc)))) p))

# 997 "Vuna/Ir/Codec.vuna"
let v_decodeProgram = (fun (fuel : int) (bytes : string) -> (if (fuel <= 0) then B_dData_dMaybe.C_Maybe_Nothing else (if ((String.length bytes) <= 0) then B_dData_dMaybe.C_Maybe_Nothing else (let nd_uscrut2 = ((Base_dBytes.v_thenPair ((v_decShared fuel) (Base_dBytes.v_curOf bytes))) (fun (shared : Vuna_dIr_dModel.t_IrShared) (c1 : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair ((v_decUnit fuel) c1)) (fun (unit : Vuna_dIr_dModel.t_IrUnit) (c2 : Base_dBytes.t_Cur) -> (if (Base_dBytes.v_curAtEnd c2) then (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = { Vuna_dIr_dModel.f_IrProgram_irProgShared = shared; Vuna_dIr_dModel.f_IrProgram_irProgUnit = unit }; B_dData_dPair.f_Pair_second = c2 })) else B_dData_dMaybe.C_Maybe_Nothing))))) in (match nd_uscrut2 with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb__117) -> (match dtb__117 with
  | { B_dData_dPair.f_Pair_first = dtb__118; B_dData_dPair.f_Pair_second = dtb__119 } -> (B_dData_dMaybe.C_Maybe_Just (dtb__118))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))))

# 1009 "Vuna/Ir/Codec.vuna"
let v_encodeUnit = (fun (u : Vuna_dIr_dModel.t_IrUnit) -> ((Base_dBytes.v_encTop (v_encUnit v_irEncoderFuel)) u))

# 1013 "Vuna/Ir/Codec.vuna"
let v_decodeUnit = (fun (fuel : int) (bytes : string) -> (if (fuel <= 0) then B_dData_dMaybe.C_Maybe_Nothing else (if ((String.length bytes) <= 0) then B_dData_dMaybe.C_Maybe_Nothing else (let nd_uscrut2 = ((Base_dBytes.v_thenPair ((v_decUnit fuel) (Base_dBytes.v_curOf bytes))) (fun (unit : Vuna_dIr_dModel.t_IrUnit) (c2 : Base_dBytes.t_Cur) -> (if (Base_dBytes.v_curAtEnd c2) then (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = unit; B_dData_dPair.f_Pair_second = c2 })) else B_dData_dMaybe.C_Maybe_Nothing))) in (match nd_uscrut2 with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb__120) -> (match dtb__120 with
  | { B_dData_dPair.f_Pair_first = dtb__121; B_dData_dPair.f_Pair_second = dtb__122 } -> (B_dData_dMaybe.C_Maybe_Just (dtb__121))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))))
