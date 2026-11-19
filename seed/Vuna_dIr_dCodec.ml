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
and v_encIrTys = (fun (fuel : int) (xs : Vuna_dIr_dModel.t_IrTy B_dData_dList.t_List) (acc : string B_dData_dList.t_List) -> (B_dData_dList.C_List__x58__x58_ ("[", (B_dData_dList.C_List__x58__x58_ ((bi_strFromInt (Base_dBytes.v_lenOf xs)), (B_dData_dList.C_List__x58__x58_ (":", (((v_encIrTysGo fuel) xs) acc))))))))
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
let rec v_decIrTys = (fun (fuel : int) (c : Base_dBytes.t_Cur) -> (if (fuel <= 0) then B_dData_dMaybe.C_Maybe_Nothing else ((fun nd_uscrut2 -> (match nd_uscrut2 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__10) -> (if (dtb__10 = 91) then ((Base_dBytes.v_thenPair ((Base_dBytes.v_decListHead (fuel - 1)) c)) (fun (n : int) (c1 : Base_dBytes.t_Cur) -> ((((v_decIrTysGo n) (fuel - 1)) c1) B_dData_dList.C_List_Nil))) else B_dData_dMaybe.C_Maybe_Nothing)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)) (Base_dBytes.v_curChar c))))
# 135 "Vuna/Ir/Codec.vuna"
and v_decIrTysGo = (fun (n : int) (fuel : int) (c : Base_dBytes.t_Cur) (acc : Vuna_dIr_dModel.t_IrTy B_dData_dList.t_List) -> (if (n <= 0) then (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (B_dData_dList.v_reverse acc); B_dData_dPair.f_Pair_second = c })) else (if (fuel <= 0) then B_dData_dMaybe.C_Maybe_Nothing else ((Base_dBytes.v_thenPair ((v_decIrTy fuel) c)) (fun (x : Vuna_dIr_dModel.t_IrTy) (c1 : Base_dBytes.t_Cur) -> ((((v_decIrTysGo (n - 1)) (fuel - 1)) c1) (B_dData_dList.C_List__x58__x58_ (x, acc))))))))
# 144 "Vuna/Ir/Codec.vuna"
and v_decIrTy = (fun (fuel : int) (c : Base_dBytes.t_Cur) -> (if (fuel <= 0) then B_dData_dMaybe.C_Maybe_Nothing else ((Base_dBytes.v_thenPair ((Base_dBytes.v_decTag fuel) c)) (fun (tag : int) (c1 : Base_dBytes.t_Cur) -> (((v_decIrTyTag tag) (fuel - 1)) c1)))))
# 151 "Vuna/Ir/Codec.vuna"
and v_decIrTyTag = (fun (tag : int) (fuel : int) (c : Base_dBytes.t_Cur) -> (if (tag = 0) then ((Base_dBytes.v_thenPair ((Base_dBytes.v_decInt fuel) c)) (fun (i : int) (c1 : Base_dBytes.t_Cur) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Vuna_dIr_dModel.C_IrTy_IrTyVar (i)); B_dData_dPair.f_Pair_second = c1 })))) else (if (tag = 1) then (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = Vuna_dIr_dModel.C_IrTy_IrTyInt; B_dData_dPair.f_Pair_second = c })) else (if (tag = 2) then (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = Vuna_dIr_dModel.C_IrTy_IrTyStr; B_dData_dPair.f_Pair_second = c })) else (if (tag = 3) then (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = Vuna_dIr_dModel.C_IrTy_IrTyBool; B_dData_dPair.f_Pair_second = c })) else (if (tag = 4) then (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = Vuna_dIr_dModel.C_IrTy_IrTyFloat; B_dData_dPair.f_Pair_second = c })) else (if (tag = 5) then (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = Vuna_dIr_dModel.C_IrTy_IrTyOpaque; B_dData_dPair.f_Pair_second = c })) else (if (tag = 6) then (((v_decIrTyWrap (fun _heta0 -> (Vuna_dIr_dModel.C_IrTy_IrTyArray (_heta0)))) fuel) c) else (if (tag = 7) then (((v_decIrTyWrap (fun _heta0 -> (Vuna_dIr_dModel.C_IrTy_IrTyRef (_heta0)))) fuel) c) else (if (tag = 8) then ((v_decIrTyData fuel) c) else (if (tag = 9) then ((v_decIrTyFun fuel) c) else B_dData_dMaybe.C_Maybe_Nothing)))))))))))
# 166 "Vuna/Ir/Codec.vuna"
and v_decIrTyWrap = (fun (wrap : (Vuna_dIr_dModel.t_IrTy) -> Vuna_dIr_dModel.t_IrTy) (fuel : int) (c : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair ((v_decIrTy fuel) c)) (fun (a : Vuna_dIr_dModel.t_IrTy) (c1 : Base_dBytes.t_Cur) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (wrap a); B_dData_dPair.f_Pair_second = c1 })))))
# 169 "Vuna/Ir/Codec.vuna"
and v_decIrTyData = (fun (fuel : int) (c : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair ((Base_dBytes.v_decStr fuel) c)) (fun (f : string) (c1 : Base_dBytes.t_Cur) -> (((v_decIrTyData1 fuel) c1) f))))
# 172 "Vuna/Ir/Codec.vuna"
and v_decIrTyData1 = (fun (fuel : int) (c : Base_dBytes.t_Cur) (f : string) -> ((Base_dBytes.v_thenPair ((v_decIrTys fuel) c)) (fun (xs : Vuna_dIr_dModel.t_IrTy B_dData_dList.t_List) (c1 : Base_dBytes.t_Cur) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Vuna_dIr_dModel.C_IrTy_IrTyData (f, xs)); B_dData_dPair.f_Pair_second = c1 })))))
# 175 "Vuna/Ir/Codec.vuna"
and v_decIrTyFun = (fun (fuel : int) (c : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair ((v_decIrTy fuel) c)) (fun (d : Vuna_dIr_dModel.t_IrTy) (c1 : Base_dBytes.t_Cur) -> (((v_decIrTyFun1 fuel) c1) d))))
# 178 "Vuna/Ir/Codec.vuna"
and v_decIrTyFun1 = (fun (fuel : int) (c : Base_dBytes.t_Cur) (d : Vuna_dIr_dModel.t_IrTy) -> ((Base_dBytes.v_thenPair ((v_decIrTy fuel) c)) (fun (r : Vuna_dIr_dModel.t_IrTy) (c1 : Base_dBytes.t_Cur) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Vuna_dIr_dModel.C_IrTy_IrTyFun (d, r)); B_dData_dPair.f_Pair_second = c1 })))))

# 181 "Vuna/Ir/Codec.vuna"
let v_decIrTyM = (fun (fuel : int) (c : Base_dBytes.t_Cur) -> (((Base_dBytes.v_decMaybe v_decIrTy) fuel) c))

# 187 "Vuna/Ir/Codec.vuna"
let v_encBName = (fun (b : Vuna_dIr_dModel.t_IrBName) (acc : string B_dData_dList.t_List) -> (match b with
  | Vuna_dIr_dModel.C_IrBName_IrBUser (dtb__11) -> ((Base_dBytes.v_encTag 0) ((Base_dBytes.v_encStr dtb__11) acc))
  | Vuna_dIr_dModel.C_IrBName_IrBArm (dtb__12) -> ((Base_dBytes.v_encTag 1) ((Base_dBytes.v_encInt dtb__12) acc))
  | Vuna_dIr_dModel.C_IrBName_IrBNat (dtb__13) -> ((Base_dBytes.v_encTag 2) ((Base_dBytes.v_encInt dtb__13) acc))
  | Vuna_dIr_dModel.C_IrBName_IrBWild -> ((Base_dBytes.v_encTag 3) acc)
  | _ -> failwith "DT: impossible branch"
))

# 202 "Vuna/Ir/Codec.vuna"
let v_decBNameTag = (fun (tag : int) (fuel : int) (c : Base_dBytes.t_Cur) -> (if (tag = 0) then ((Base_dBytes.v_thenPair ((Base_dBytes.v_decStr fuel) c)) (fun (s : string) (c1 : Base_dBytes.t_Cur) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Vuna_dIr_dModel.C_IrBName_IrBUser (s)); B_dData_dPair.f_Pair_second = c1 })))) else (if (tag = 1) then ((Base_dBytes.v_thenPair ((Base_dBytes.v_decInt fuel) c)) (fun (n : int) (c1 : Base_dBytes.t_Cur) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Vuna_dIr_dModel.C_IrBName_IrBArm (n)); B_dData_dPair.f_Pair_second = c1 })))) else (if (tag = 2) then ((Base_dBytes.v_thenPair ((Base_dBytes.v_decInt fuel) c)) (fun (n : int) (c1 : Base_dBytes.t_Cur) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Vuna_dIr_dModel.C_IrBName_IrBNat (n)); B_dData_dPair.f_Pair_second = c1 })))) else (if (tag = 3) then (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = Vuna_dIr_dModel.C_IrBName_IrBWild; B_dData_dPair.f_Pair_second = c })) else B_dData_dMaybe.C_Maybe_Nothing)))))

# 195 "Vuna/Ir/Codec.vuna"
let v_decBName = (fun (fuel : int) (c : Base_dBytes.t_Cur) -> (if (fuel <= 0) then B_dData_dMaybe.C_Maybe_Nothing else ((Base_dBytes.v_thenPair ((Base_dBytes.v_decTag fuel) c)) (fun (tag : int) (c1 : Base_dBytes.t_Cur) -> (((v_decBNameTag tag) (fuel - 1)) c1)))))

# 211 "Vuna/Ir/Codec.vuna"
let v_encBinder = (fun (fuel : int) (b : Vuna_dIr_dModel.t_IrBinder) (acc : string B_dData_dList.t_List) -> ((v_encBName (b).Vuna_dIr_dModel.f_IrBinder_irBinderName) ((Base_dBytes.v_encBool (b).Vuna_dIr_dModel.f_IrBinder_irBinderErased) (((v_encIrTyM (fuel - 1)) (b).Vuna_dIr_dModel.f_IrBinder_irBinderTy) acc))))

# 222 "Vuna/Ir/Codec.vuna"
let v_decBinder2 = (fun (fuel : int) (c : Base_dBytes.t_Cur) (name : Vuna_dIr_dModel.t_IrBName) (erased : bool) -> ((Base_dBytes.v_thenPair ((v_decIrTyM fuel) c)) (fun (ty : Vuna_dIr_dModel.t_IrTy B_dData_dMaybe.t_Maybe) (c1 : Base_dBytes.t_Cur) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = { Vuna_dIr_dModel.f_IrBinder_irBinderName = name; Vuna_dIr_dModel.f_IrBinder_irBinderErased = erased; Vuna_dIr_dModel.f_IrBinder_irBinderTy = ty }; B_dData_dPair.f_Pair_second = c1 })))))

# 218 "Vuna/Ir/Codec.vuna"
let v_decBinder1 = (fun (fuel : int) (c : Base_dBytes.t_Cur) (name : Vuna_dIr_dModel.t_IrBName) -> ((Base_dBytes.v_thenPair ((Base_dBytes.v_decBool fuel) c)) (fun (erased : bool) (c1 : Base_dBytes.t_Cur) -> ((((v_decBinder2 fuel) c1) name) erased))))

# 215 "Vuna/Ir/Codec.vuna"
let v_decBinder = (fun (fuel : int) (c : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair ((v_decBName fuel) c)) (fun (name : Vuna_dIr_dModel.t_IrBName) (c1 : Base_dBytes.t_Cur) -> (((v_decBinder1 fuel) c1) name))))

# 229 "Vuna/Ir/Codec.vuna"
let rec v_encBindersGo = (fun (fuel : int) (xs : Vuna_dIr_dModel.t_IrBinder B_dData_dList.t_List) (acc : string B_dData_dList.t_List) -> (if (fuel <= 0) then acc else (match xs with
  | B_dData_dList.C_List_Nil -> acc
  | B_dData_dList.C_List__x58__x58_ (dtb__14, dtb__15) -> (((v_encBinder (fuel - 1)) dtb__14) (((v_encBindersGo (fuel - 1)) dtb__15) acc))
  | _ -> failwith "DT: impossible branch"
)))

# 226 "Vuna/Ir/Codec.vuna"
let v_encBinders = (fun (fuel : int) (xs : Vuna_dIr_dModel.t_IrBinder B_dData_dList.t_List) (acc : string B_dData_dList.t_List) -> (B_dData_dList.C_List__x58__x58_ ("[", (B_dData_dList.C_List__x58__x58_ ((bi_strFromInt (Base_dBytes.v_lenOf xs)), (B_dData_dList.C_List__x58__x58_ (":", (((v_encBindersGo fuel) xs) acc))))))))

# 238 "Vuna/Ir/Codec.vuna"
let v_decBinders = (fun (fuel : int) (c : Base_dBytes.t_Cur) -> (((Base_dBytes.v_decList v_decBinder) fuel) c))

# 419 "Vuna/Ir/Codec.vuna"
let v_encAppTy = (fun (fuel : int) (ty : (Vuna_dIr_dModel.t_IrTy, Vuna_dIr_dModel.t_IrTy) B_dData_dPair.t_Pair B_dData_dMaybe.t_Maybe) (acc : string B_dData_dList.t_List) -> (if (fuel <= 0) then acc else (((Base_dBytes.v_encMaybe ((Base_dBytes.v_encPair (v_encIrTy (fuel - 1))) (v_encIrTy (fuel - 1)))) ty) acc)))

# 244 "Vuna/Ir/Codec.vuna"
let rec v_encAlt = (fun (mc0 : int) (mc1 : Vuna_dIr_dModel.t_IrAlt) (mc2 : string B_dData_dList.t_List) -> (match mc1 with
  | { Vuna_dIr_dModel.f_IrAlt_irAltCtor = dtb__16; Vuna_dIr_dModel.f_IrAlt_irAltBinders = dtb__17; Vuna_dIr_dModel.f_IrAlt_irAltBody = dtb__18 } -> (((Base_dBytes.v_encMaybe ((Base_dBytes.v_encPair Base_dBytes.v_encStr) Base_dBytes.v_encStr)) dtb__16) (((v_encBinders (mc0 - 1)) dtb__17) (((v_encIr (mc0 - 1)) dtb__18) mc2)))
  | _ -> failwith "DT: impossible branch"
))
# 262 "Vuna/Ir/Codec.vuna"
and v_encAlts = (fun (fuel : int) (xs : Vuna_dIr_dModel.t_IrAlt B_dData_dList.t_List) (acc : string B_dData_dList.t_List) -> (B_dData_dList.C_List__x58__x58_ ("[", (B_dData_dList.C_List__x58__x58_ ((bi_strFromInt (Base_dBytes.v_lenOf xs)), (B_dData_dList.C_List__x58__x58_ (":", (((v_encAltsGo fuel) xs) acc))))))))
# 265 "Vuna/Ir/Codec.vuna"
and v_encAltsGo = (fun (fuel : int) (xs : Vuna_dIr_dModel.t_IrAlt B_dData_dList.t_List) (acc : string B_dData_dList.t_List) -> (if (fuel <= 0) then acc else (match xs with
  | B_dData_dList.C_List_Nil -> acc
  | B_dData_dList.C_List__x58__x58_ (dtb__19, dtb__20) -> (((v_encAlt (fuel - 1)) dtb__19) (((v_encAltsGo (fuel - 1)) dtb__20) acc))
  | _ -> failwith "DT: impossible branch"
)))
# 292 "Vuna/Ir/Codec.vuna"
and v_encAltM = (fun (fuel : int) (a : Vuna_dIr_dModel.t_IrAlt B_dData_dMaybe.t_Maybe) (acc : string B_dData_dList.t_List) -> (if (fuel <= 0) then acc else (match a with
  | B_dData_dMaybe.C_Maybe_Nothing -> (B_dData_dList.C_List__x58__x58_ ("0", acc))
  | B_dData_dMaybe.C_Maybe_Just (dtb__21) -> (B_dData_dList.C_List__x58__x58_ ("1", (((v_encAlt (fuel - 1)) dtb__21) acc)))
  | _ -> failwith "DT: impossible branch"
)))
# 314 "Vuna/Ir/Codec.vuna"
and v_encFields = (fun (fuel : int) (xs : (string, Vuna_dIr_dModel.t_Ir) B_dData_dPair.t_Pair B_dData_dList.t_List) (acc : string B_dData_dList.t_List) -> (B_dData_dList.C_List__x58__x58_ ("[", (B_dData_dList.C_List__x58__x58_ ((bi_strFromInt (Base_dBytes.v_lenOf xs)), (B_dData_dList.C_List__x58__x58_ (":", (((v_encFieldsGo fuel) xs) acc))))))))
# 317 "Vuna/Ir/Codec.vuna"
and v_encFieldsGo = (fun (fuel : int) (xs : (string, Vuna_dIr_dModel.t_Ir) B_dData_dPair.t_Pair B_dData_dList.t_List) (acc : string B_dData_dList.t_List) -> (if (fuel <= 0) then acc else ((fun nd_uscrut3 -> (match nd_uscrut3 with
  | B_dData_dList.C_List__x58__x58_ (dtb__22, dtb__23) -> (match dtb__22 with
  | { B_dData_dPair.f_Pair_first = dtb__24; B_dData_dPair.f_Pair_second = dtb__25 } -> ((Base_dBytes.v_encStr dtb__24) (((v_encIr (fuel - 1)) dtb__25) (((v_encFieldsGo (fuel - 1)) dtb__23) acc)))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> acc
  | _ -> failwith "DT: impossible branch"
)) xs)))
# 350 "Vuna/Ir/Codec.vuna"
and v_encIr = (fun (fuel : int) (ir : Vuna_dIr_dModel.t_Ir) (acc : string B_dData_dList.t_List) -> (if (fuel <= 0) then acc else (((v_encIrCases fuel) ir) acc)))
# 353 "Vuna/Ir/Codec.vuna"
and v_encIrCases = (fun (fuel : int) (ir : Vuna_dIr_dModel.t_Ir) (acc : string B_dData_dList.t_List) -> (match ir with
  | Vuna_dIr_dModel.C_Ir_IrVar (dtb__26) -> ((Base_dBytes.v_encTag 0) (((v_encBinder (fuel - 1)) dtb__26) acc))
  | Vuna_dIr_dModel.C_Ir_IrGlobal (dtb__27) -> ((Base_dBytes.v_encTag 1) ((Base_dBytes.v_encStr dtb__27) acc))
  | Vuna_dIr_dModel.C_Ir_IrCtor (dtb__28, dtb__29, dtb__30, dtb__31) -> ((Base_dBytes.v_encTag 2) ((Base_dBytes.v_encStr dtb__28) ((Base_dBytes.v_encStr dtb__29) (((Base_dBytes.v_encMaybe (v_encIrTys (fuel - 1))) dtb__30) (((v_encIrs (fuel - 1)) dtb__31) acc)))))
  | Vuna_dIr_dModel.C_Ir_IrRecord (dtb__32, dtb__33, dtb__34) -> ((Base_dBytes.v_encTag 3) ((Base_dBytes.v_encStr dtb__32) (((v_encIrTyM (fuel - 1)) dtb__33) (((v_encFields (fuel - 1)) dtb__34) acc))))
  | Vuna_dIr_dModel.C_Ir_IrProj (dtb__35, dtb__36, dtb__37, dtb__38) -> ((Base_dBytes.v_encTag 4) (((v_encIr (fuel - 1)) dtb__35) ((Base_dBytes.v_encStr dtb__36) ((Base_dBytes.v_encStr dtb__37) (((v_encIrTyM (fuel - 1)) dtb__38) acc)))))
  | Vuna_dIr_dModel.C_Ir_IrRecUpd (dtb__39, dtb__40, dtb__41, dtb__42) -> ((Base_dBytes.v_encTag 5) (((v_encIr (fuel - 1)) dtb__39) ((Base_dBytes.v_encStr dtb__40) (((v_encFields (fuel - 1)) dtb__41) (((v_encIrTyM (fuel - 1)) dtb__42) acc)))))
  | Vuna_dIr_dModel.C_Ir_IrRt (dtb__43) -> ((Base_dBytes.v_encTag 6) ((Base_dBytes.v_encStr dtb__43) acc))
  | Vuna_dIr_dModel.C_Ir_IrRtApp (dtb__44, dtb__45) -> ((Base_dBytes.v_encTag 7) ((Base_dBytes.v_encStr dtb__44) (((v_encIrs (fuel - 1)) dtb__45) acc)))
  | Vuna_dIr_dModel.C_Ir_IrCast (dtb__46, dtb__47, dtb__48) -> ((Base_dBytes.v_encTag 8) (((v_encIrTyM (fuel - 1)) dtb__46) (((v_encIrTyM (fuel - 1)) dtb__47) (((v_encIr (fuel - 1)) dtb__48) acc))))
  | Vuna_dIr_dModel.C_Ir_IrInt (dtb__49) -> ((Base_dBytes.v_encTag 9) ((Base_dBytes.v_encInt dtb__49) acc))
  | Vuna_dIr_dModel.C_Ir_IrStr (dtb__50) -> ((Base_dBytes.v_encTag 10) ((Base_dBytes.v_encStr dtb__50) acc))
  | Vuna_dIr_dModel.C_Ir_IrBool (dtb__51) -> ((Base_dBytes.v_encTag 11) ((Base_dBytes.v_encBool dtb__51) acc))
  | Vuna_dIr_dModel.C_Ir_IrFloatLit (dtb__52) -> ((Base_dBytes.v_encTag 12) ((Base_dBytes.v_encStr dtb__52) acc))
  | Vuna_dIr_dModel.C_Ir_IrLet (dtb__53, dtb__54, dtb__55) -> ((Base_dBytes.v_encTag 13) (((v_encBinders (fuel - 1)) dtb__53) (((v_encIr (fuel - 1)) dtb__54) (((v_encIr (fuel - 1)) dtb__55) acc))))
  | Vuna_dIr_dModel.C_Ir_IrLam (dtb__56, dtb__57, dtb__58) -> ((Base_dBytes.v_encTag 14) (((v_encBinders (fuel - 1)) dtb__56) (((v_encIrTyM (fuel - 1)) dtb__57) (((v_encIr (fuel - 1)) dtb__58) acc))))
  | Vuna_dIr_dModel.C_Ir_IrApp (dtb__59, dtb__60, dtb__61) -> ((Base_dBytes.v_encTag 15) (((v_encAppTy (fuel - 1)) dtb__59) (((v_encIr (fuel - 1)) dtb__60) (((v_encIr (fuel - 1)) dtb__61) acc))))
  | Vuna_dIr_dModel.C_Ir_IrTail (dtb__62) -> ((Base_dBytes.v_encTag 16) (((v_encIr (fuel - 1)) dtb__62) acc))
  | Vuna_dIr_dModel.C_Ir_IrIf (dtb__63, dtb__64, dtb__65) -> ((Base_dBytes.v_encTag 17) (((v_encIr (fuel - 1)) dtb__63) (((v_encIr (fuel - 1)) dtb__64) (((v_encIr (fuel - 1)) dtb__65) acc))))
  | Vuna_dIr_dModel.C_Ir_IrCase (dtb__66, dtb__67, dtb__68, dtb__69) -> ((Base_dBytes.v_encTag 18) (((v_encIrTyM (fuel - 1)) dtb__66) (((v_encIrTyM (fuel - 1)) dtb__67) (((v_encIr (fuel - 1)) dtb__68) (((v_encAlts (fuel - 1)) dtb__69) acc)))))
  | Vuna_dIr_dModel.C_Ir_IrNatCase (dtb__70, dtb__71, dtb__72, dtb__73, dtb__74) -> ((Base_dBytes.v_encTag 19) (((v_encIr (fuel - 1)) dtb__70) ((Base_dBytes.v_encInt dtb__71) (((v_encAltM (fuel - 1)) dtb__72) (((v_encAltM (fuel - 1)) dtb__73) (((v_encAltM (fuel - 1)) dtb__74) acc))))))
  | Vuna_dIr_dModel.C_Ir_IrConcatMany (dtb__75) -> ((Base_dBytes.v_encTag 20) (((v_encIrs (fuel - 1)) dtb__75) acc))
  | Vuna_dIr_dModel.C_Ir_IrEffThunk (dtb__76, dtb__77, dtb__78, dtb__79, dtb__80) -> ((Base_dBytes.v_encTag 21) ((Base_dBytes.v_encStr dtb__76) ((Base_dBytes.v_encStr dtb__77) (((v_encIrTy (fuel - 1)) dtb__78) ((Base_dBytes.v_encInt dtb__79) (((v_encIr (fuel - 1)) dtb__80) acc))))))
  | Vuna_dIr_dModel.C_Ir_IrEffBind (dtb__81, dtb__82, dtb__83) -> ((Base_dBytes.v_encTag 22) ((Base_dBytes.v_encStr dtb__81) ((Base_dBytes.v_encStr dtb__82) (((v_encIrTy (fuel - 1)) dtb__83) acc))))
  | _ -> failwith "DT: impossible branch"
))
# 407 "Vuna/Ir/Codec.vuna"
and v_encIrs = (fun (fuel : int) (xs : Vuna_dIr_dModel.t_Ir B_dData_dList.t_List) (acc : string B_dData_dList.t_List) -> (B_dData_dList.C_List__x58__x58_ ("[", (B_dData_dList.C_List__x58__x58_ ((bi_strFromInt (Base_dBytes.v_lenOf xs)), (B_dData_dList.C_List__x58__x58_ (":", (((v_encIrsGo fuel) xs) acc))))))))
# 410 "Vuna/Ir/Codec.vuna"
and v_encIrsGo = (fun (fuel : int) (xs : Vuna_dIr_dModel.t_Ir B_dData_dList.t_List) (acc : string B_dData_dList.t_List) -> (if (fuel <= 0) then acc else (match xs with
  | B_dData_dList.C_List_Nil -> acc
  | B_dData_dList.C_List__x58__x58_ (dtb__84, dtb__85) -> (((v_encIr (fuel - 1)) dtb__84) (((v_encIrsGo (fuel - 1)) dtb__85) acc))
  | _ -> failwith "DT: impossible branch"
)))

# 461 "Vuna/Ir/Codec.vuna"
let v_decIrVar = (fun (fuel : int) (c : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair ((v_decBinder fuel) c)) (fun (b : Vuna_dIr_dModel.t_IrBinder) (c1 : Base_dBytes.t_Cur) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Vuna_dIr_dModel.C_Ir_IrVar (b)); B_dData_dPair.f_Pair_second = c1 })))))

# 464 "Vuna/Ir/Codec.vuna"
let v_decIrGlobal = (fun (fuel : int) (c : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair ((Base_dBytes.v_decStr fuel) c)) (fun (s : string) (c1 : Base_dBytes.t_Cur) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Vuna_dIr_dModel.C_Ir_IrGlobal (s)); B_dData_dPair.f_Pair_second = c1 })))))

# 502 "Vuna/Ir/Codec.vuna"
let v_decIrProj3 = (fun (fuel : int) (c : Base_dBytes.t_Cur) (base : Vuna_dIr_dModel.t_Ir) (fam : string) (field : string) -> ((Base_dBytes.v_thenPair ((v_decIrTyM fuel) c)) (fun (resTy : Vuna_dIr_dModel.t_IrTy B_dData_dMaybe.t_Maybe) (c1 : Base_dBytes.t_Cur) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Vuna_dIr_dModel.C_Ir_IrProj (base, fam, field, resTy)); B_dData_dPair.f_Pair_second = c1 })))))

# 498 "Vuna/Ir/Codec.vuna"
let v_decIrProj2 = (fun (fuel : int) (c : Base_dBytes.t_Cur) (base : Vuna_dIr_dModel.t_Ir) (fam : string) -> ((Base_dBytes.v_thenPair ((Base_dBytes.v_decStr fuel) c)) (fun (field : string) (c1 : Base_dBytes.t_Cur) -> (((((v_decIrProj3 fuel) c1) base) fam) field))))

# 495 "Vuna/Ir/Codec.vuna"
let v_decIrProj1 = (fun (fuel : int) (c : Base_dBytes.t_Cur) (base : Vuna_dIr_dModel.t_Ir) -> ((Base_dBytes.v_thenPair ((Base_dBytes.v_decStr fuel) c)) (fun (fam : string) (c1 : Base_dBytes.t_Cur) -> ((((v_decIrProj2 fuel) c1) base) fam))))

# 516 "Vuna/Ir/Codec.vuna"
let v_decIrRecUpd3 = (fun (fuel : int) (c : Base_dBytes.t_Cur) (base : Vuna_dIr_dModel.t_Ir) (fam : string) (fields : (string, Vuna_dIr_dModel.t_Ir) B_dData_dPair.t_Pair B_dData_dList.t_List) -> ((Base_dBytes.v_thenPair ((v_decIrTyM fuel) c)) (fun (resTy : Vuna_dIr_dModel.t_IrTy B_dData_dMaybe.t_Maybe) (c1 : Base_dBytes.t_Cur) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Vuna_dIr_dModel.C_Ir_IrRecUpd (base, fam, fields, resTy)); B_dData_dPair.f_Pair_second = c1 })))))

# 520 "Vuna/Ir/Codec.vuna"
let v_decIrRt = (fun (fuel : int) (c : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair ((Base_dBytes.v_decStr fuel) c)) (fun (sym : string) (c1 : Base_dBytes.t_Cur) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Vuna_dIr_dModel.C_Ir_IrRt (sym)); B_dData_dPair.f_Pair_second = c1 })))))

# 539 "Vuna/Ir/Codec.vuna"
let v_decIrInt = (fun (fuel : int) (c : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair ((Base_dBytes.v_decInt fuel) c)) (fun (n : int) (c1 : Base_dBytes.t_Cur) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Vuna_dIr_dModel.C_Ir_IrInt (n)); B_dData_dPair.f_Pair_second = c1 })))))

# 542 "Vuna/Ir/Codec.vuna"
let v_decIrStr = (fun (fuel : int) (c : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair ((Base_dBytes.v_decStr fuel) c)) (fun (s : string) (c1 : Base_dBytes.t_Cur) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Vuna_dIr_dModel.C_Ir_IrStr (s)); B_dData_dPair.f_Pair_second = c1 })))))

# 545 "Vuna/Ir/Codec.vuna"
let v_decIrBool = (fun (fuel : int) (c : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair ((Base_dBytes.v_decBool fuel) c)) (fun (b : bool) (c1 : Base_dBytes.t_Cur) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Vuna_dIr_dModel.C_Ir_IrBool (b)); B_dData_dPair.f_Pair_second = c1 })))))

# 548 "Vuna/Ir/Codec.vuna"
let v_decIrFloat = (fun (fuel : int) (c : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair ((Base_dBytes.v_decStr fuel) c)) (fun (s : string) (c1 : Base_dBytes.t_Cur) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Vuna_dIr_dModel.C_Ir_IrFloatLit (s)); B_dData_dPair.f_Pair_second = c1 })))))

# 656 "Vuna/Ir/Codec.vuna"
let v_decIrEffBind2 = (fun (fuel : int) (c : Base_dBytes.t_Cur) (fam : string) (ctor : string) -> ((Base_dBytes.v_thenPair ((v_decIrTy fuel) c)) (fun (unitTy : Vuna_dIr_dModel.t_IrTy) (c1 : Base_dBytes.t_Cur) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Vuna_dIr_dModel.C_Ir_IrEffBind (fam, ctor, unitTy)); B_dData_dPair.f_Pair_second = c1 })))))

# 652 "Vuna/Ir/Codec.vuna"
let v_decIrEffBind1 = (fun (fuel : int) (c : Base_dBytes.t_Cur) (fam : string) -> ((Base_dBytes.v_thenPair ((Base_dBytes.v_decStr fuel) c)) (fun (ctor : string) (c1 : Base_dBytes.t_Cur) -> ((((v_decIrEffBind2 fuel) c1) fam) ctor))))

# 649 "Vuna/Ir/Codec.vuna"
let v_decIrEffBind = (fun (fuel : int) (c : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair ((Base_dBytes.v_decStr fuel) c)) (fun (fam : string) (c1 : Base_dBytes.t_Cur) -> (((v_decIrEffBind1 fuel) c1) fam))))

# 251 "Vuna/Ir/Codec.vuna"
let rec v_decAlt = (fun (fuel : int) (c : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair (((Base_dBytes.v_decMaybe ((Base_dBytes.v_decPair Base_dBytes.v_decStr) Base_dBytes.v_decStr)) fuel) c)) (fun (ctor : (string, string) B_dData_dPair.t_Pair B_dData_dMaybe.t_Maybe) (c1 : Base_dBytes.t_Cur) -> (((v_decAlt1 fuel) c1) ctor))))
# 255 "Vuna/Ir/Codec.vuna"
and v_decAlt1 = (fun (fuel : int) (c : Base_dBytes.t_Cur) (ctor : (string, string) B_dData_dPair.t_Pair B_dData_dMaybe.t_Maybe) -> ((Base_dBytes.v_thenPair ((v_decBinders fuel) c)) (fun (bs : Vuna_dIr_dModel.t_IrBinder B_dData_dList.t_List) (c1 : Base_dBytes.t_Cur) -> ((((v_decAlt2 fuel) c1) ctor) bs))))
# 258 "Vuna/Ir/Codec.vuna"
and v_decAlt2 = (fun (fuel : int) (c : Base_dBytes.t_Cur) (ctor : (string, string) B_dData_dPair.t_Pair B_dData_dMaybe.t_Maybe) (bs : Vuna_dIr_dModel.t_IrBinder B_dData_dList.t_List) -> ((Base_dBytes.v_thenPair ((v_decIr fuel) c)) (fun (body : Vuna_dIr_dModel.t_Ir) (c1 : Base_dBytes.t_Cur) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = { Vuna_dIr_dModel.f_IrAlt_irAltCtor = ctor; Vuna_dIr_dModel.f_IrAlt_irAltBinders = bs; Vuna_dIr_dModel.f_IrAlt_irAltBody = body }; B_dData_dPair.f_Pair_second = c1 })))))
# 274 "Vuna/Ir/Codec.vuna"
and v_decAlts = (fun (fuel : int) (c : Base_dBytes.t_Cur) -> (if (fuel <= 0) then B_dData_dMaybe.C_Maybe_Nothing else ((fun nd_uscrut2 -> (match nd_uscrut2 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__86) -> (if (dtb__86 = 91) then ((Base_dBytes.v_thenPair ((Base_dBytes.v_decListHead (fuel - 1)) c)) (fun (n : int) (c1 : Base_dBytes.t_Cur) -> ((((v_decAltsGo n) (fuel - 1)) c1) B_dData_dList.C_List_Nil))) else B_dData_dMaybe.C_Maybe_Nothing)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)) (Base_dBytes.v_curChar c))))
# 283 "Vuna/Ir/Codec.vuna"
and v_decAltsGo = (fun (n : int) (fuel : int) (c : Base_dBytes.t_Cur) (acc : Vuna_dIr_dModel.t_IrAlt B_dData_dList.t_List) -> (if (n <= 0) then (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (B_dData_dList.v_reverse acc); B_dData_dPair.f_Pair_second = c })) else (if (fuel <= 0) then B_dData_dMaybe.C_Maybe_Nothing else ((Base_dBytes.v_thenPair ((v_decAlt fuel) c)) (fun (x : Vuna_dIr_dModel.t_IrAlt) (c1 : Base_dBytes.t_Cur) -> ((((v_decAltsGo (n - 1)) (fuel - 1)) c1) (B_dData_dList.C_List__x58__x58_ (x, acc))))))))
# 301 "Vuna/Ir/Codec.vuna"
and v_decAltM = (fun (fuel : int) (c : Base_dBytes.t_Cur) -> (if (fuel <= 0) then B_dData_dMaybe.C_Maybe_Nothing else ((fun nd_uscrut2 -> (match nd_uscrut2 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__87) -> (if (dtb__87 = 48) then (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = B_dData_dMaybe.C_Maybe_Nothing; B_dData_dPair.f_Pair_second = (Base_dBytes.v_curSkip c) })) else (if (dtb__87 = 49) then ((Base_dBytes.v_thenPair ((v_decAlt (fuel - 1)) (Base_dBytes.v_curSkip c))) (fun (a : Vuna_dIr_dModel.t_IrAlt) (c1 : Base_dBytes.t_Cur) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (B_dData_dMaybe.C_Maybe_Just (a)); B_dData_dPair.f_Pair_second = c1 })))) else B_dData_dMaybe.C_Maybe_Nothing))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)) (Base_dBytes.v_curChar c))))
# 326 "Vuna/Ir/Codec.vuna"
and v_decFields = (fun (fuel : int) (c : Base_dBytes.t_Cur) -> (if (fuel <= 0) then B_dData_dMaybe.C_Maybe_Nothing else ((fun nd_uscrut2 -> (match nd_uscrut2 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__88) -> (if (dtb__88 = 91) then ((Base_dBytes.v_thenPair ((Base_dBytes.v_decListHead (fuel - 1)) c)) (fun (n : int) (c1 : Base_dBytes.t_Cur) -> ((((v_decFieldsGo n) (fuel - 1)) c1) B_dData_dList.C_List_Nil))) else B_dData_dMaybe.C_Maybe_Nothing)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)) (Base_dBytes.v_curChar c))))
# 335 "Vuna/Ir/Codec.vuna"
and v_decFieldsGo = (fun (n : int) (fuel : int) (c : Base_dBytes.t_Cur) (acc : (string, Vuna_dIr_dModel.t_Ir) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (if (n <= 0) then (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (B_dData_dList.v_reverse acc); B_dData_dPair.f_Pair_second = c })) else (if (fuel <= 0) then B_dData_dMaybe.C_Maybe_Nothing else ((Base_dBytes.v_thenPair ((v_decField fuel) c)) (fun (x : (string, Vuna_dIr_dModel.t_Ir) B_dData_dPair.t_Pair) (c1 : Base_dBytes.t_Cur) -> ((((v_decFieldsGo (n - 1)) (fuel - 1)) c1) (B_dData_dList.C_List__x58__x58_ (x, acc))))))))
# 344 "Vuna/Ir/Codec.vuna"
and v_decField = (fun (fuel : int) (c : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair ((Base_dBytes.v_decStr fuel) c)) (fun (k : string) (c1 : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair ((v_decIr fuel) c1)) (fun (v : Vuna_dIr_dModel.t_Ir) (c2 : Base_dBytes.t_Cur) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = { B_dData_dPair.f_Pair_first = k; B_dData_dPair.f_Pair_second = v }; B_dData_dPair.f_Pair_second = c2 })))))))
# 426 "Vuna/Ir/Codec.vuna"
and v_decIr = (fun (fuel : int) (c : Base_dBytes.t_Cur) -> (if (fuel <= 0) then B_dData_dMaybe.C_Maybe_Nothing else ((Base_dBytes.v_thenPair ((Base_dBytes.v_decTag fuel) c)) (fun (tag : int) (c1 : Base_dBytes.t_Cur) -> (((v_decIrTag tag) (fuel - 1)) c1)))))
# 433 "Vuna/Ir/Codec.vuna"
and v_decIrTag = (fun (tag : int) (fuel : int) (c : Base_dBytes.t_Cur) -> (if (tag = 0) then ((v_decIrVar fuel) c) else (if (tag = 1) then ((v_decIrGlobal fuel) c) else (if (tag = 2) then ((v_decIrCtor fuel) c) else (if (tag = 3) then ((v_decIrRecord fuel) c) else (if (tag = 4) then ((v_decIrProj fuel) c) else (if (tag = 5) then ((v_decIrRecUpd fuel) c) else (if (tag = 6) then ((v_decIrRt fuel) c) else (if (tag = 7) then ((v_decIrRtApp fuel) c) else (if (tag = 8) then ((v_decIrCast fuel) c) else (if (tag = 9) then ((v_decIrInt fuel) c) else (if (tag = 10) then ((v_decIrStr fuel) c) else (if (tag = 11) then ((v_decIrBool fuel) c) else (if (tag = 12) then ((v_decIrFloat fuel) c) else (if (tag = 13) then ((v_decIrLet fuel) c) else (if (tag = 14) then ((v_decIrLam fuel) c) else (if (tag = 15) then ((v_decIrApp fuel) c) else (if (tag = 16) then ((v_decIrTail fuel) c) else (if (tag = 17) then ((v_decIrIf fuel) c) else (if (tag = 18) then ((v_decIrCase fuel) c) else (if (tag = 19) then ((v_decIrNatCase fuel) c) else (if (tag = 20) then ((v_decIrConcat fuel) c) else (if (tag = 21) then ((v_decIrEffThunk fuel) c) else (if (tag = 22) then ((v_decIrEffBind fuel) c) else B_dData_dMaybe.C_Maybe_Nothing))))))))))))))))))))))))
# 467 "Vuna/Ir/Codec.vuna"
and v_decIrCtor = (fun (fuel : int) (c : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair ((Base_dBytes.v_decStr fuel) c)) (fun (fam : string) (c1 : Base_dBytes.t_Cur) -> (((v_decIrCtor1 fuel) c1) fam))))
# 470 "Vuna/Ir/Codec.vuna"
and v_decIrCtor1 = (fun (fuel : int) (c : Base_dBytes.t_Cur) (fam : string) -> ((Base_dBytes.v_thenPair ((Base_dBytes.v_decStr fuel) c)) (fun (ctor : string) (c1 : Base_dBytes.t_Cur) -> ((((v_decIrCtor2 fuel) c1) fam) ctor))))
# 473 "Vuna/Ir/Codec.vuna"
and v_decIrCtor2 = (fun (fuel : int) (c : Base_dBytes.t_Cur) (fam : string) (ctor : string) -> ((Base_dBytes.v_thenPair (((Base_dBytes.v_decMaybe v_decIrTys) fuel) c)) (fun (tys : Vuna_dIr_dModel.t_IrTy B_dData_dList.t_List B_dData_dMaybe.t_Maybe) (c1 : Base_dBytes.t_Cur) -> (((((v_decIrCtor3 fuel) c1) fam) ctor) tys))))
# 477 "Vuna/Ir/Codec.vuna"
and v_decIrCtor3 = (fun (fuel : int) (c : Base_dBytes.t_Cur) (fam : string) (ctor : string) (tys : Vuna_dIr_dModel.t_IrTy B_dData_dList.t_List B_dData_dMaybe.t_Maybe) -> ((Base_dBytes.v_thenPair ((v_decIrs fuel) c)) (fun (args : Vuna_dIr_dModel.t_Ir B_dData_dList.t_List) (c1 : Base_dBytes.t_Cur) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Vuna_dIr_dModel.C_Ir_IrCtor (fam, ctor, tys, args)); B_dData_dPair.f_Pair_second = c1 })))))
# 481 "Vuna/Ir/Codec.vuna"
and v_decIrRecord = (fun (fuel : int) (c : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair ((Base_dBytes.v_decStr fuel) c)) (fun (fam : string) (c1 : Base_dBytes.t_Cur) -> (((v_decIrRecord1 fuel) c1) fam))))
# 484 "Vuna/Ir/Codec.vuna"
and v_decIrRecord1 = (fun (fuel : int) (c : Base_dBytes.t_Cur) (fam : string) -> ((Base_dBytes.v_thenPair ((v_decIrTyM fuel) c)) (fun (resTy : Vuna_dIr_dModel.t_IrTy B_dData_dMaybe.t_Maybe) (c1 : Base_dBytes.t_Cur) -> ((((v_decIrRecord2 fuel) c1) fam) resTy))))
# 488 "Vuna/Ir/Codec.vuna"
and v_decIrRecord2 = (fun (fuel : int) (c : Base_dBytes.t_Cur) (fam : string) (resTy : Vuna_dIr_dModel.t_IrTy B_dData_dMaybe.t_Maybe) -> ((Base_dBytes.v_thenPair ((v_decFields fuel) c)) (fun (fields : (string, Vuna_dIr_dModel.t_Ir) B_dData_dPair.t_Pair B_dData_dList.t_List) (c1 : Base_dBytes.t_Cur) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Vuna_dIr_dModel.C_Ir_IrRecord (fam, resTy, fields)); B_dData_dPair.f_Pair_second = c1 })))))
# 492 "Vuna/Ir/Codec.vuna"
and v_decIrProj = (fun (fuel : int) (c : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair ((v_decIr fuel) c)) (fun (base : Vuna_dIr_dModel.t_Ir) (c1 : Base_dBytes.t_Cur) -> (((v_decIrProj1 fuel) c1) base))))
# 506 "Vuna/Ir/Codec.vuna"
and v_decIrRecUpd = (fun (fuel : int) (c : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair ((v_decIr fuel) c)) (fun (base : Vuna_dIr_dModel.t_Ir) (c1 : Base_dBytes.t_Cur) -> (((v_decIrRecUpd1 fuel) c1) base))))
# 509 "Vuna/Ir/Codec.vuna"
and v_decIrRecUpd1 = (fun (fuel : int) (c : Base_dBytes.t_Cur) (base : Vuna_dIr_dModel.t_Ir) -> ((Base_dBytes.v_thenPair ((Base_dBytes.v_decStr fuel) c)) (fun (fam : string) (c1 : Base_dBytes.t_Cur) -> ((((v_decIrRecUpd2 fuel) c1) base) fam))))
# 512 "Vuna/Ir/Codec.vuna"
and v_decIrRecUpd2 = (fun (fuel : int) (c : Base_dBytes.t_Cur) (base : Vuna_dIr_dModel.t_Ir) (fam : string) -> ((Base_dBytes.v_thenPair ((v_decFields fuel) c)) (fun (fields : (string, Vuna_dIr_dModel.t_Ir) B_dData_dPair.t_Pair B_dData_dList.t_List) (c1 : Base_dBytes.t_Cur) -> (((((v_decIrRecUpd3 fuel) c1) base) fam) fields))))
# 523 "Vuna/Ir/Codec.vuna"
and v_decIrRtApp = (fun (fuel : int) (c : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair ((Base_dBytes.v_decStr fuel) c)) (fun (sym : string) (c1 : Base_dBytes.t_Cur) -> (((v_decIrRtApp1 fuel) c1) sym))))
# 526 "Vuna/Ir/Codec.vuna"
and v_decIrRtApp1 = (fun (fuel : int) (c : Base_dBytes.t_Cur) (sym : string) -> ((Base_dBytes.v_thenPair ((v_decIrs fuel) c)) (fun (args : Vuna_dIr_dModel.t_Ir B_dData_dList.t_List) (c1 : Base_dBytes.t_Cur) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Vuna_dIr_dModel.C_Ir_IrRtApp (sym, args)); B_dData_dPair.f_Pair_second = c1 })))))
# 529 "Vuna/Ir/Codec.vuna"
and v_decIrCast = (fun (fuel : int) (c : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair ((v_decIrTyM fuel) c)) (fun (from : Vuna_dIr_dModel.t_IrTy B_dData_dMaybe.t_Maybe) (c1 : Base_dBytes.t_Cur) -> (((v_decIrCast1 fuel) c1) from))))
# 532 "Vuna/Ir/Codec.vuna"
and v_decIrCast1 = (fun (fuel : int) (c : Base_dBytes.t_Cur) (from : Vuna_dIr_dModel.t_IrTy B_dData_dMaybe.t_Maybe) -> ((Base_dBytes.v_thenPair ((v_decIrTyM fuel) c)) (fun (to_ : Vuna_dIr_dModel.t_IrTy B_dData_dMaybe.t_Maybe) (c1 : Base_dBytes.t_Cur) -> ((((v_decIrCast2 fuel) c1) from) to_))))
# 535 "Vuna/Ir/Codec.vuna"
and v_decIrCast2 = (fun (fuel : int) (c : Base_dBytes.t_Cur) (from : Vuna_dIr_dModel.t_IrTy B_dData_dMaybe.t_Maybe) (to_ : Vuna_dIr_dModel.t_IrTy B_dData_dMaybe.t_Maybe) -> ((Base_dBytes.v_thenPair ((v_decIr fuel) c)) (fun (inner : Vuna_dIr_dModel.t_Ir) (c1 : Base_dBytes.t_Cur) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Vuna_dIr_dModel.C_Ir_IrCast (from, to_, inner)); B_dData_dPair.f_Pair_second = c1 })))))
# 551 "Vuna/Ir/Codec.vuna"
and v_decIrLet = (fun (fuel : int) (c : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair ((v_decBinders fuel) c)) (fun (bs : Vuna_dIr_dModel.t_IrBinder B_dData_dList.t_List) (c1 : Base_dBytes.t_Cur) -> (((v_decIrLet1 fuel) c1) bs))))
# 554 "Vuna/Ir/Codec.vuna"
and v_decIrLet1 = (fun (fuel : int) (c : Base_dBytes.t_Cur) (bs : Vuna_dIr_dModel.t_IrBinder B_dData_dList.t_List) -> ((Base_dBytes.v_thenPair ((v_decIr fuel) c)) (fun (scrut : Vuna_dIr_dModel.t_Ir) (c1 : Base_dBytes.t_Cur) -> ((((v_decIrLet2 fuel) c1) bs) scrut))))
# 557 "Vuna/Ir/Codec.vuna"
and v_decIrLet2 = (fun (fuel : int) (c : Base_dBytes.t_Cur) (bs : Vuna_dIr_dModel.t_IrBinder B_dData_dList.t_List) (scrut : Vuna_dIr_dModel.t_Ir) -> ((Base_dBytes.v_thenPair ((v_decIr fuel) c)) (fun (body : Vuna_dIr_dModel.t_Ir) (c1 : Base_dBytes.t_Cur) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Vuna_dIr_dModel.C_Ir_IrLet (bs, scrut, body)); B_dData_dPair.f_Pair_second = c1 })))))
# 561 "Vuna/Ir/Codec.vuna"
and v_decIrLam = (fun (fuel : int) (c : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair ((v_decBinders fuel) c)) (fun (bs : Vuna_dIr_dModel.t_IrBinder B_dData_dList.t_List) (c1 : Base_dBytes.t_Cur) -> (((v_decIrLam1 fuel) c1) bs))))
# 564 "Vuna/Ir/Codec.vuna"
and v_decIrLam1 = (fun (fuel : int) (c : Base_dBytes.t_Cur) (bs : Vuna_dIr_dModel.t_IrBinder B_dData_dList.t_List) -> ((Base_dBytes.v_thenPair ((v_decIrTyM fuel) c)) (fun (bodyTy : Vuna_dIr_dModel.t_IrTy B_dData_dMaybe.t_Maybe) (c1 : Base_dBytes.t_Cur) -> ((((v_decIrLam2 fuel) c1) bs) bodyTy))))
# 567 "Vuna/Ir/Codec.vuna"
and v_decIrLam2 = (fun (fuel : int) (c : Base_dBytes.t_Cur) (bs : Vuna_dIr_dModel.t_IrBinder B_dData_dList.t_List) (bodyTy : Vuna_dIr_dModel.t_IrTy B_dData_dMaybe.t_Maybe) -> ((Base_dBytes.v_thenPair ((v_decIr fuel) c)) (fun (body : Vuna_dIr_dModel.t_Ir) (c1 : Base_dBytes.t_Cur) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Vuna_dIr_dModel.C_Ir_IrLam (bs, bodyTy, body)); B_dData_dPair.f_Pair_second = c1 })))))
# 571 "Vuna/Ir/Codec.vuna"
and v_decIrApp = (fun (fuel : int) (c : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair (((Base_dBytes.v_decMaybe ((Base_dBytes.v_decPair v_decIrTy) v_decIrTy)) fuel) c)) (fun (appTy : (Vuna_dIr_dModel.t_IrTy, Vuna_dIr_dModel.t_IrTy) B_dData_dPair.t_Pair B_dData_dMaybe.t_Maybe) (c1 : Base_dBytes.t_Cur) -> (((v_decIrApp1 fuel) c1) appTy))))
# 575 "Vuna/Ir/Codec.vuna"
and v_decIrApp1 = (fun (fuel : int) (c : Base_dBytes.t_Cur) (appTy : (Vuna_dIr_dModel.t_IrTy, Vuna_dIr_dModel.t_IrTy) B_dData_dPair.t_Pair B_dData_dMaybe.t_Maybe) -> ((Base_dBytes.v_thenPair ((v_decIr fuel) c)) (fun (f : Vuna_dIr_dModel.t_Ir) (c1 : Base_dBytes.t_Cur) -> ((((v_decIrApp2 fuel) c1) appTy) f))))
# 578 "Vuna/Ir/Codec.vuna"
and v_decIrApp2 = (fun (fuel : int) (c : Base_dBytes.t_Cur) (appTy : (Vuna_dIr_dModel.t_IrTy, Vuna_dIr_dModel.t_IrTy) B_dData_dPair.t_Pair B_dData_dMaybe.t_Maybe) (f : Vuna_dIr_dModel.t_Ir) -> ((Base_dBytes.v_thenPair ((v_decIr fuel) c)) (fun (a : Vuna_dIr_dModel.t_Ir) (c1 : Base_dBytes.t_Cur) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Vuna_dIr_dModel.C_Ir_IrApp (appTy, f, a)); B_dData_dPair.f_Pair_second = c1 })))))
# 581 "Vuna/Ir/Codec.vuna"
and v_decIrTail = (fun (fuel : int) (c : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair ((v_decIr fuel) c)) (fun (inner : Vuna_dIr_dModel.t_Ir) (c1 : Base_dBytes.t_Cur) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Vuna_dIr_dModel.C_Ir_IrTail (inner)); B_dData_dPair.f_Pair_second = c1 })))))
# 584 "Vuna/Ir/Codec.vuna"
and v_decIrIf = (fun (fuel : int) (c : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair ((v_decIr fuel) c)) (fun (cond : Vuna_dIr_dModel.t_Ir) (c1 : Base_dBytes.t_Cur) -> (((v_decIrIf1 fuel) c1) cond))))
# 587 "Vuna/Ir/Codec.vuna"
and v_decIrIf1 = (fun (fuel : int) (c : Base_dBytes.t_Cur) (cond : Vuna_dIr_dModel.t_Ir) -> ((Base_dBytes.v_thenPair ((v_decIr fuel) c)) (fun (th : Vuna_dIr_dModel.t_Ir) (c1 : Base_dBytes.t_Cur) -> ((((v_decIrIf2 fuel) c1) cond) th))))
# 590 "Vuna/Ir/Codec.vuna"
and v_decIrIf2 = (fun (fuel : int) (c : Base_dBytes.t_Cur) (cond : Vuna_dIr_dModel.t_Ir) (th : Vuna_dIr_dModel.t_Ir) -> ((Base_dBytes.v_thenPair ((v_decIr fuel) c)) (fun (el : Vuna_dIr_dModel.t_Ir) (c1 : Base_dBytes.t_Cur) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Vuna_dIr_dModel.C_Ir_IrIf (cond, th, el)); B_dData_dPair.f_Pair_second = c1 })))))
# 593 "Vuna/Ir/Codec.vuna"
and v_decIrCase = (fun (fuel : int) (c : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair ((v_decIrTyM fuel) c)) (fun (scrutTy : Vuna_dIr_dModel.t_IrTy B_dData_dMaybe.t_Maybe) (c1 : Base_dBytes.t_Cur) -> (((v_decIrCase1 fuel) c1) scrutTy))))
# 596 "Vuna/Ir/Codec.vuna"
and v_decIrCase1 = (fun (fuel : int) (c : Base_dBytes.t_Cur) (scrutTy : Vuna_dIr_dModel.t_IrTy B_dData_dMaybe.t_Maybe) -> ((Base_dBytes.v_thenPair ((v_decIrTyM fuel) c)) (fun (resTy : Vuna_dIr_dModel.t_IrTy B_dData_dMaybe.t_Maybe) (c1 : Base_dBytes.t_Cur) -> ((((v_decIrCase2 fuel) c1) scrutTy) resTy))))
# 600 "Vuna/Ir/Codec.vuna"
and v_decIrCase2 = (fun (fuel : int) (c : Base_dBytes.t_Cur) (scrutTy : Vuna_dIr_dModel.t_IrTy B_dData_dMaybe.t_Maybe) (resTy : Vuna_dIr_dModel.t_IrTy B_dData_dMaybe.t_Maybe) -> ((Base_dBytes.v_thenPair ((v_decIr fuel) c)) (fun (scrut : Vuna_dIr_dModel.t_Ir) (c1 : Base_dBytes.t_Cur) -> (((((v_decIrCase3 fuel) c1) scrutTy) resTy) scrut))))
# 604 "Vuna/Ir/Codec.vuna"
and v_decIrCase3 = (fun (fuel : int) (c : Base_dBytes.t_Cur) (scrutTy : Vuna_dIr_dModel.t_IrTy B_dData_dMaybe.t_Maybe) (resTy : Vuna_dIr_dModel.t_IrTy B_dData_dMaybe.t_Maybe) (scrut : Vuna_dIr_dModel.t_Ir) -> ((Base_dBytes.v_thenPair ((v_decAlts fuel) c)) (fun (alts : Vuna_dIr_dModel.t_IrAlt B_dData_dList.t_List) (c1 : Base_dBytes.t_Cur) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Vuna_dIr_dModel.C_Ir_IrCase (scrutTy, resTy, scrut, alts)); B_dData_dPair.f_Pair_second = c1 })))))
# 608 "Vuna/Ir/Codec.vuna"
and v_decIrNatCase = (fun (fuel : int) (c : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair ((v_decIr fuel) c)) (fun (scrut : Vuna_dIr_dModel.t_Ir) (c1 : Base_dBytes.t_Cur) -> (((v_decIrNatCase1 fuel) c1) scrut))))
# 611 "Vuna/Ir/Codec.vuna"
and v_decIrNatCase1 = (fun (fuel : int) (c : Base_dBytes.t_Cur) (scrut : Vuna_dIr_dModel.t_Ir) -> ((Base_dBytes.v_thenPair ((Base_dBytes.v_decInt fuel) c)) (fun (fresh : int) (c1 : Base_dBytes.t_Cur) -> ((((v_decIrNatCase2 fuel) c1) scrut) fresh))))
# 615 "Vuna/Ir/Codec.vuna"
and v_decIrNatCase2 = (fun (fuel : int) (c : Base_dBytes.t_Cur) (scrut : Vuna_dIr_dModel.t_Ir) (fresh : int) -> ((Base_dBytes.v_thenPair ((v_decAltM fuel) c)) (fun (zero : Vuna_dIr_dModel.t_IrAlt B_dData_dMaybe.t_Maybe) (c1 : Base_dBytes.t_Cur) -> (((((v_decIrNatCase3 fuel) c1) scrut) fresh) zero))))
# 619 "Vuna/Ir/Codec.vuna"
and v_decIrNatCase3 = (fun (fuel : int) (c : Base_dBytes.t_Cur) (scrut : Vuna_dIr_dModel.t_Ir) (fresh : int) (zero : Vuna_dIr_dModel.t_IrAlt B_dData_dMaybe.t_Maybe) -> ((Base_dBytes.v_thenPair ((v_decAltM fuel) c)) (fun (succ : Vuna_dIr_dModel.t_IrAlt B_dData_dMaybe.t_Maybe) (c1 : Base_dBytes.t_Cur) -> ((((((v_decIrNatCase4 fuel) c1) scrut) fresh) zero) succ))))
# 623 "Vuna/Ir/Codec.vuna"
and v_decIrNatCase4 = (fun (fuel : int) (c : Base_dBytes.t_Cur) (scrut : Vuna_dIr_dModel.t_Ir) (fresh : int) (zero : Vuna_dIr_dModel.t_IrAlt B_dData_dMaybe.t_Maybe) (succ : Vuna_dIr_dModel.t_IrAlt B_dData_dMaybe.t_Maybe) -> ((Base_dBytes.v_thenPair ((v_decAltM fuel) c)) (fun (catch : Vuna_dIr_dModel.t_IrAlt B_dData_dMaybe.t_Maybe) (c1 : Base_dBytes.t_Cur) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Vuna_dIr_dModel.C_Ir_IrNatCase (scrut, fresh, zero, succ, catch)); B_dData_dPair.f_Pair_second = c1 })))))
# 627 "Vuna/Ir/Codec.vuna"
and v_decIrConcat = (fun (fuel : int) (c : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair ((v_decIrs fuel) c)) (fun (parts : Vuna_dIr_dModel.t_Ir B_dData_dList.t_List) (c1 : Base_dBytes.t_Cur) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Vuna_dIr_dModel.C_Ir_IrConcatMany (parts)); B_dData_dPair.f_Pair_second = c1 })))))
# 630 "Vuna/Ir/Codec.vuna"
and v_decIrEffThunk = (fun (fuel : int) (c : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair ((Base_dBytes.v_decStr fuel) c)) (fun (fam : string) (c1 : Base_dBytes.t_Cur) -> (((v_decIrEffThunk1 fuel) c1) fam))))
# 633 "Vuna/Ir/Codec.vuna"
and v_decIrEffThunk1 = (fun (fuel : int) (c : Base_dBytes.t_Cur) (fam : string) -> ((Base_dBytes.v_thenPair ((Base_dBytes.v_decStr fuel) c)) (fun (ctor : string) (c1 : Base_dBytes.t_Cur) -> ((((v_decIrEffThunk2 fuel) c1) fam) ctor))))
# 637 "Vuna/Ir/Codec.vuna"
and v_decIrEffThunk2 = (fun (fuel : int) (c : Base_dBytes.t_Cur) (fam : string) (ctor : string) -> ((Base_dBytes.v_thenPair ((v_decIrTy fuel) c)) (fun (unitTy : Vuna_dIr_dModel.t_IrTy) (c1 : Base_dBytes.t_Cur) -> (((((v_decIrEffThunk3 fuel) c1) fam) ctor) unitTy))))
# 641 "Vuna/Ir/Codec.vuna"
and v_decIrEffThunk3 = (fun (fuel : int) (c : Base_dBytes.t_Cur) (fam : string) (ctor : string) (unitTy : Vuna_dIr_dModel.t_IrTy) -> ((Base_dBytes.v_thenPair ((Base_dBytes.v_decInt fuel) c)) (fun (arity : int) (c1 : Base_dBytes.t_Cur) -> ((((((v_decIrEffThunk4 fuel) c1) fam) ctor) unitTy) arity))))
# 645 "Vuna/Ir/Codec.vuna"
and v_decIrEffThunk4 = (fun (fuel : int) (c : Base_dBytes.t_Cur) (fam : string) (ctor : string) (unitTy : Vuna_dIr_dModel.t_IrTy) (arity : int) -> ((Base_dBytes.v_thenPair ((v_decIr fuel) c)) (fun (prim : Vuna_dIr_dModel.t_Ir) (c1 : Base_dBytes.t_Cur) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Vuna_dIr_dModel.C_Ir_IrEffThunk (fam, ctor, unitTy, arity, prim)); B_dData_dPair.f_Pair_second = c1 })))))
# 660 "Vuna/Ir/Codec.vuna"
and v_decIrs = (fun (fuel : int) (c : Base_dBytes.t_Cur) -> (if (fuel <= 0) then B_dData_dMaybe.C_Maybe_Nothing else ((fun nd_uscrut2 -> (match nd_uscrut2 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__89) -> (if (dtb__89 = 91) then ((Base_dBytes.v_thenPair ((Base_dBytes.v_decListHead (fuel - 1)) c)) (fun (n : int) (c1 : Base_dBytes.t_Cur) -> ((((v_decIrsGo n) (fuel - 1)) c1) B_dData_dList.C_List_Nil))) else B_dData_dMaybe.C_Maybe_Nothing)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)) (Base_dBytes.v_curChar c))))
# 669 "Vuna/Ir/Codec.vuna"
and v_decIrsGo = (fun (n : int) (fuel : int) (c : Base_dBytes.t_Cur) (acc : Vuna_dIr_dModel.t_Ir B_dData_dList.t_List) -> (if (n <= 0) then (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (B_dData_dList.v_reverse acc); B_dData_dPair.f_Pair_second = c })) else (if (fuel <= 0) then B_dData_dMaybe.C_Maybe_Nothing else ((Base_dBytes.v_thenPair ((v_decIr fuel) c)) (fun (x : Vuna_dIr_dModel.t_Ir) (c1 : Base_dBytes.t_Cur) -> ((((v_decIrsGo (n - 1)) (fuel - 1)) c1) (B_dData_dList.C_List__x58__x58_ (x, acc))))))))

# 681 "Vuna/Ir/Codec.vuna"
let v_encTyDecl = (fun (fuel : int) (decl : Vuna_dIr_dModel.t_IrTyDecl) (acc : string B_dData_dList.t_List) -> (if (fuel <= 0) then acc else (match decl with
  | Vuna_dIr_dModel.C_IrTyDecl_IrVariantDecl (dtb__90, dtb__91, dtb__92) -> ((Base_dBytes.v_encTag 0) ((Base_dBytes.v_encStr dtb__90) ((Base_dBytes.v_encInt dtb__91) (((Base_dBytes.v_encList ((Base_dBytes.v_encPair Base_dBytes.v_encStr) (v_encIrTys (fuel - 1)))) dtb__92) acc))))
  | Vuna_dIr_dModel.C_IrTyDecl_IrRecordDecl (dtb__93, dtb__94, dtb__95, dtb__96) -> ((Base_dBytes.v_encTag 1) ((Base_dBytes.v_encStr dtb__93) ((Base_dBytes.v_encInt dtb__94) (((Base_dBytes.v_encList ((Base_dBytes.v_encPair Base_dBytes.v_encInt) Base_dBytes.v_encStr)) dtb__95) (((v_encIrTys (fuel - 1)) dtb__96) acc)))))
  | Vuna_dIr_dModel.C_IrTyDecl_IrUnboxedDecl (dtb__97, dtb__98, dtb__99) -> ((Base_dBytes.v_encTag 2) ((Base_dBytes.v_encStr dtb__97) ((Base_dBytes.v_encInt dtb__98) (((v_encIrTy (fuel - 1)) dtb__99) acc))))
  | _ -> failwith "DT: impossible branch"
)))

# 713 "Vuna/Ir/Codec.vuna"
let v_decTyDeclVariant2 = (fun (fuel : int) (c : Base_dBytes.t_Cur) (fam : string) (arity : int) -> ((Base_dBytes.v_thenPair (((Base_dBytes.v_decList ((Base_dBytes.v_decPair Base_dBytes.v_decStr) v_decIrTys)) fuel) c)) (fun (ctors : (string, Vuna_dIr_dModel.t_IrTy B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (c1 : Base_dBytes.t_Cur) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Vuna_dIr_dModel.C_IrTyDecl_IrVariantDecl (fam, arity, ctors)); B_dData_dPair.f_Pair_second = c1 })))))

# 709 "Vuna/Ir/Codec.vuna"
let v_decTyDeclVariant1 = (fun (fuel : int) (c : Base_dBytes.t_Cur) (fam : string) -> ((Base_dBytes.v_thenPair ((Base_dBytes.v_decInt fuel) c)) (fun (arity : int) (c1 : Base_dBytes.t_Cur) -> ((((v_decTyDeclVariant2 fuel) c1) fam) arity))))

# 706 "Vuna/Ir/Codec.vuna"
let v_decTyDeclVariant = (fun (fuel : int) (c : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair ((Base_dBytes.v_decStr fuel) c)) (fun (fam : string) (c1 : Base_dBytes.t_Cur) -> (((v_decTyDeclVariant1 fuel) c1) fam))))

# 732 "Vuna/Ir/Codec.vuna"
let v_decTyDeclRecord3 = (fun (fuel : int) (c : Base_dBytes.t_Cur) (fam : string) (arity : int) (order : (int, string) B_dData_dPair.t_Pair B_dData_dList.t_List) -> ((Base_dBytes.v_thenPair ((v_decIrTys fuel) c)) (fun (tys : Vuna_dIr_dModel.t_IrTy B_dData_dList.t_List) (c1 : Base_dBytes.t_Cur) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Vuna_dIr_dModel.C_IrTyDecl_IrRecordDecl (fam, arity, order, tys)); B_dData_dPair.f_Pair_second = c1 })))))

# 726 "Vuna/Ir/Codec.vuna"
let v_decTyDeclRecord2 = (fun (fuel : int) (c : Base_dBytes.t_Cur) (fam : string) (arity : int) -> ((Base_dBytes.v_thenPair (((Base_dBytes.v_decList ((Base_dBytes.v_decPair Base_dBytes.v_decInt) Base_dBytes.v_decStr)) fuel) c)) (fun (order : (int, string) B_dData_dPair.t_Pair B_dData_dList.t_List) (c1 : Base_dBytes.t_Cur) -> (((((v_decTyDeclRecord3 fuel) c1) fam) arity) order))))

# 722 "Vuna/Ir/Codec.vuna"
let v_decTyDeclRecord1 = (fun (fuel : int) (c : Base_dBytes.t_Cur) (fam : string) -> ((Base_dBytes.v_thenPair ((Base_dBytes.v_decInt fuel) c)) (fun (arity : int) (c1 : Base_dBytes.t_Cur) -> ((((v_decTyDeclRecord2 fuel) c1) fam) arity))))

# 719 "Vuna/Ir/Codec.vuna"
let v_decTyDeclRecord = (fun (fuel : int) (c : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair ((Base_dBytes.v_decStr fuel) c)) (fun (fam : string) (c1 : Base_dBytes.t_Cur) -> (((v_decTyDeclRecord1 fuel) c1) fam))))

# 743 "Vuna/Ir/Codec.vuna"
let v_decTyDeclUnboxed2 = (fun (fuel : int) (c : Base_dBytes.t_Cur) (fam : string) (arity : int) -> ((Base_dBytes.v_thenPair ((v_decIrTy fuel) c)) (fun (ty : Vuna_dIr_dModel.t_IrTy) (c1 : Base_dBytes.t_Cur) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Vuna_dIr_dModel.C_IrTyDecl_IrUnboxedDecl (fam, arity, ty)); B_dData_dPair.f_Pair_second = c1 })))))

# 739 "Vuna/Ir/Codec.vuna"
let v_decTyDeclUnboxed1 = (fun (fuel : int) (c : Base_dBytes.t_Cur) (fam : string) -> ((Base_dBytes.v_thenPair ((Base_dBytes.v_decInt fuel) c)) (fun (arity : int) (c1 : Base_dBytes.t_Cur) -> ((((v_decTyDeclUnboxed2 fuel) c1) fam) arity))))

# 736 "Vuna/Ir/Codec.vuna"
let v_decTyDeclUnboxed = (fun (fuel : int) (c : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair ((Base_dBytes.v_decStr fuel) c)) (fun (fam : string) (c1 : Base_dBytes.t_Cur) -> (((v_decTyDeclUnboxed1 fuel) c1) fam))))

# 698 "Vuna/Ir/Codec.vuna"
let v_decTyDeclTag = (fun (tag : int) (fuel : int) (c : Base_dBytes.t_Cur) -> (if (tag = 0) then ((v_decTyDeclVariant fuel) c) else (if (tag = 1) then ((v_decTyDeclRecord fuel) c) else (if (tag = 2) then ((v_decTyDeclUnboxed fuel) c) else B_dData_dMaybe.C_Maybe_Nothing))))

# 691 "Vuna/Ir/Codec.vuna"
let v_decTyDecl = (fun (fuel : int) (c : Base_dBytes.t_Cur) -> (if (fuel <= 0) then B_dData_dMaybe.C_Maybe_Nothing else ((Base_dBytes.v_thenPair ((Base_dBytes.v_decTag fuel) c)) (fun (tag : int) (c1 : Base_dBytes.t_Cur) -> (((v_decTyDeclTag tag) (fuel - 1)) c1)))))

# 750 "Vuna/Ir/Codec.vuna"
let v_encDef = (fun (fuel : int) (decl : Vuna_dIr_dModel.t_IrDef) (acc : string B_dData_dList.t_List) -> (if (fuel <= 0) then acc else (match decl with
  | Vuna_dIr_dModel.C_IrDef_IrDef (dtb__100, dtb__101, dtb__102, dtb__103, dtb__104, dtb__105, dtb__106, dtb__107) -> ((Base_dBytes.v_encTag 0) ((Base_dBytes.v_encStr dtb__100) ((Base_dBytes.v_encInt dtb__101) ((v_encStrs dtb__102) (((v_encIrTyM (fuel - 1)) dtb__103) (((v_encIr (fuel - 1)) dtb__104) ((Base_dBytes.v_encBool dtb__105) ((Base_dBytes.v_encBool dtb__106) ((v_encSpanM dtb__107) acc)))))))))
  | Vuna_dIr_dModel.C_IrDef_IrExternDef (dtb__108, dtb__109, dtb__110, dtb__111) -> ((Base_dBytes.v_encTag 1) ((Base_dBytes.v_encStr dtb__108) (((v_encIrTy (fuel - 1)) dtb__109) ((Base_dBytes.v_encStr dtb__110) ((v_encSpanM dtb__111) acc)))))
  | _ -> failwith "DT: impossible branch"
)))

# 801 "Vuna/Ir/Codec.vuna"
let v_decDefRec7 = (fun (fuel : int) (c : Base_dBytes.t_Cur) (name : string) (arity : int) (deps : string B_dData_dList.t_List) (ty : Vuna_dIr_dModel.t_IrTy B_dData_dMaybe.t_Maybe) (body : Vuna_dIr_dModel.t_Ir) (recOk : bool) (initGuard : bool) -> ((Base_dBytes.v_thenPair ((v_decSpanM fuel) c)) (fun (span : Base_dSource.t_Span B_dData_dMaybe.t_Maybe) (c1 : Base_dBytes.t_Cur) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Vuna_dIr_dModel.C_IrDef_IrDef (name, arity, deps, ty, body, recOk, initGuard, span)); B_dData_dPair.f_Pair_second = c1 })))))

# 795 "Vuna/Ir/Codec.vuna"
let v_decDefRec6 = (fun (fuel : int) (c : Base_dBytes.t_Cur) (name : string) (arity : int) (deps : string B_dData_dList.t_List) (ty : Vuna_dIr_dModel.t_IrTy B_dData_dMaybe.t_Maybe) (body : Vuna_dIr_dModel.t_Ir) (recOk : bool) -> ((Base_dBytes.v_thenPair ((Base_dBytes.v_decBool fuel) c)) (fun (initGuard : bool) (c1 : Base_dBytes.t_Cur) -> (((((((((v_decDefRec7 fuel) c1) name) arity) deps) ty) body) recOk) initGuard))))

# 791 "Vuna/Ir/Codec.vuna"
let v_decDefRec5 = (fun (fuel : int) (c : Base_dBytes.t_Cur) (name : string) (arity : int) (deps : string B_dData_dList.t_List) (ty : Vuna_dIr_dModel.t_IrTy B_dData_dMaybe.t_Maybe) (body : Vuna_dIr_dModel.t_Ir) -> ((Base_dBytes.v_thenPair ((Base_dBytes.v_decBool fuel) c)) (fun (recOk : bool) (c1 : Base_dBytes.t_Cur) -> ((((((((v_decDefRec6 fuel) c1) name) arity) deps) ty) body) recOk))))

# 787 "Vuna/Ir/Codec.vuna"
let v_decDefRec4 = (fun (fuel : int) (c : Base_dBytes.t_Cur) (name : string) (arity : int) (deps : string B_dData_dList.t_List) (ty : Vuna_dIr_dModel.t_IrTy B_dData_dMaybe.t_Maybe) -> ((Base_dBytes.v_thenPair ((v_decIr fuel) c)) (fun (body : Vuna_dIr_dModel.t_Ir) (c1 : Base_dBytes.t_Cur) -> (((((((v_decDefRec5 fuel) c1) name) arity) deps) ty) body))))

# 783 "Vuna/Ir/Codec.vuna"
let v_decDefRec3 = (fun (fuel : int) (c : Base_dBytes.t_Cur) (name : string) (arity : int) (deps : string B_dData_dList.t_List) -> ((Base_dBytes.v_thenPair ((v_decIrTyM fuel) c)) (fun (ty : Vuna_dIr_dModel.t_IrTy B_dData_dMaybe.t_Maybe) (c1 : Base_dBytes.t_Cur) -> ((((((v_decDefRec4 fuel) c1) name) arity) deps) ty))))

# 779 "Vuna/Ir/Codec.vuna"
let v_decDefRec2 = (fun (fuel : int) (c : Base_dBytes.t_Cur) (name : string) (arity : int) -> ((Base_dBytes.v_thenPair ((v_decStrs fuel) c)) (fun (deps : string B_dData_dList.t_List) (c1 : Base_dBytes.t_Cur) -> (((((v_decDefRec3 fuel) c1) name) arity) deps))))

# 776 "Vuna/Ir/Codec.vuna"
let v_decDefRec1 = (fun (fuel : int) (c : Base_dBytes.t_Cur) (name : string) -> ((Base_dBytes.v_thenPair ((Base_dBytes.v_decInt fuel) c)) (fun (arity : int) (c1 : Base_dBytes.t_Cur) -> ((((v_decDefRec2 fuel) c1) name) arity))))

# 773 "Vuna/Ir/Codec.vuna"
let v_decDefRec = (fun (fuel : int) (c : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair ((Base_dBytes.v_decStr fuel) c)) (fun (name : string) (c1 : Base_dBytes.t_Cur) -> (((v_decDefRec1 fuel) c1) name))))

# 817 "Vuna/Ir/Codec.vuna"
let v_decDefExtern3 = (fun (fuel : int) (c : Base_dBytes.t_Cur) (name : string) (ty : Vuna_dIr_dModel.t_IrTy) (cName : string) -> ((Base_dBytes.v_thenPair ((v_decSpanM fuel) c)) (fun (span : Base_dSource.t_Span B_dData_dMaybe.t_Maybe) (c1 : Base_dBytes.t_Cur) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Vuna_dIr_dModel.C_IrDef_IrExternDef (name, ty, cName, span)); B_dData_dPair.f_Pair_second = c1 })))))

# 813 "Vuna/Ir/Codec.vuna"
let v_decDefExtern2 = (fun (fuel : int) (c : Base_dBytes.t_Cur) (name : string) (ty : Vuna_dIr_dModel.t_IrTy) -> ((Base_dBytes.v_thenPair ((Base_dBytes.v_decStr fuel) c)) (fun (cName : string) (c1 : Base_dBytes.t_Cur) -> (((((v_decDefExtern3 fuel) c1) name) ty) cName))))

# 810 "Vuna/Ir/Codec.vuna"
let v_decDefExtern1 = (fun (fuel : int) (c : Base_dBytes.t_Cur) (name : string) -> ((Base_dBytes.v_thenPair ((v_decIrTy fuel) c)) (fun (ty : Vuna_dIr_dModel.t_IrTy) (c1 : Base_dBytes.t_Cur) -> ((((v_decDefExtern2 fuel) c1) name) ty))))

# 807 "Vuna/Ir/Codec.vuna"
let v_decDefExtern = (fun (fuel : int) (c : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair ((Base_dBytes.v_decStr fuel) c)) (fun (name : string) (c1 : Base_dBytes.t_Cur) -> (((v_decDefExtern1 fuel) c1) name))))

# 766 "Vuna/Ir/Codec.vuna"
let v_decDefTag = (fun (tag : int) (fuel : int) (c : Base_dBytes.t_Cur) -> (if (tag = 0) then ((v_decDefRec fuel) c) else (if (tag = 1) then ((v_decDefExtern fuel) c) else B_dData_dMaybe.C_Maybe_Nothing)))

# 759 "Vuna/Ir/Codec.vuna"
let v_decDef = (fun (fuel : int) (c : Base_dBytes.t_Cur) -> (if (fuel <= 0) then B_dData_dMaybe.C_Maybe_Nothing else ((Base_dBytes.v_thenPair ((Base_dBytes.v_decTag fuel) c)) (fun (tag : int) (c1 : Base_dBytes.t_Cur) -> (((v_decDefTag tag) (fuel - 1)) c1)))))

# 821 "Vuna/Ir/Codec.vuna"
let v_encGroup = (fun (mc0 : int) (mc1 : Vuna_dIr_dModel.t_IrGroup) (mc2 : string B_dData_dList.t_List) -> (match mc1 with
  | { Vuna_dIr_dModel.f_IrGroup_irGroupIsRec = dtb__112; Vuna_dIr_dModel.f_IrGroup_irGroupDefs = dtb__113 } -> ((Base_dBytes.v_encBool dtb__112) (((Base_dBytes.v_encList (v_encDef (mc0 - 1))) dtb__113) mc2))
  | _ -> failwith "DT: impossible branch"
))

# 827 "Vuna/Ir/Codec.vuna"
let v_decGroup1 = (fun (fuel : int) (c : Base_dBytes.t_Cur) (isRec : bool) -> ((Base_dBytes.v_thenPair (((Base_dBytes.v_decList v_decDef) fuel) c)) (fun (defs : Vuna_dIr_dModel.t_IrDef B_dData_dList.t_List) (c1 : Base_dBytes.t_Cur) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = { Vuna_dIr_dModel.f_IrGroup_irGroupIsRec = isRec; Vuna_dIr_dModel.f_IrGroup_irGroupDefs = defs }; B_dData_dPair.f_Pair_second = c1 })))))

# 824 "Vuna/Ir/Codec.vuna"
let v_decGroup = (fun (fuel : int) (c : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair ((Base_dBytes.v_decBool fuel) c)) (fun (isRec : bool) (c1 : Base_dBytes.t_Cur) -> (((v_decGroup1 fuel) c1) isRec))))

# 834 "Vuna/Ir/Codec.vuna"
let v_encEntry = (fun (fuel : int) (e : Vuna_dIr_dModel.t_IrEntry) (acc : string B_dData_dList.t_List) -> (((v_encIr (fuel - 1)) (e).Vuna_dIr_dModel.f_IrEntry_irEntryShow) ((Base_dBytes.v_encStr (e).Vuna_dIr_dModel.f_IrEntry_irEntryMain) ((Base_dBytes.v_encBool (e).Vuna_dIr_dModel.f_IrEntry_irEntryIsAction) (((Base_dBytes.v_encMaybe Base_dBytes.v_encStr) (e).Vuna_dIr_dModel.f_IrEntry_irEntryRunMain) ((v_encStrs (e).Vuna_dIr_dModel.f_IrEntry_irEntryHandlers) ((v_encStrs (e).Vuna_dIr_dModel.f_IrEntry_irEntryRowTags) acc)))))))

# 863 "Vuna/Ir/Codec.vuna"
let v_decEntry5 = (fun (fuel : int) (c : Base_dBytes.t_Cur) (show : Vuna_dIr_dModel.t_Ir) (main : string) (isAction : bool) (runMain : string B_dData_dMaybe.t_Maybe) (handlers : string B_dData_dList.t_List) -> ((Base_dBytes.v_thenPair ((v_decStrs fuel) c)) (fun (rowTags : string B_dData_dList.t_List) (c1 : Base_dBytes.t_Cur) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = { Vuna_dIr_dModel.f_IrEntry_irEntryShow = show; Vuna_dIr_dModel.f_IrEntry_irEntryMain = main; Vuna_dIr_dModel.f_IrEntry_irEntryIsAction = isAction; Vuna_dIr_dModel.f_IrEntry_irEntryRunMain = runMain; Vuna_dIr_dModel.f_IrEntry_irEntryHandlers = handlers; Vuna_dIr_dModel.f_IrEntry_irEntryRowTags = rowTags }; B_dData_dPair.f_Pair_second = c1 })))))

# 857 "Vuna/Ir/Codec.vuna"
let v_decEntry4 = (fun (fuel : int) (c : Base_dBytes.t_Cur) (show : Vuna_dIr_dModel.t_Ir) (main : string) (isAction : bool) (runMain : string B_dData_dMaybe.t_Maybe) -> ((Base_dBytes.v_thenPair ((v_decStrs fuel) c)) (fun (handlers : string B_dData_dList.t_List) (c1 : Base_dBytes.t_Cur) -> (((((((v_decEntry5 fuel) c1) show) main) isAction) runMain) handlers))))

# 851 "Vuna/Ir/Codec.vuna"
let v_decEntry3 = (fun (fuel : int) (c : Base_dBytes.t_Cur) (show : Vuna_dIr_dModel.t_Ir) (main : string) (isAction : bool) -> ((Base_dBytes.v_thenPair (((Base_dBytes.v_decMaybe Base_dBytes.v_decStr) fuel) c)) (fun (runMain : string B_dData_dMaybe.t_Maybe) (c1 : Base_dBytes.t_Cur) -> ((((((v_decEntry4 fuel) c1) show) main) isAction) runMain))))

# 847 "Vuna/Ir/Codec.vuna"
let v_decEntry2 = (fun (fuel : int) (c : Base_dBytes.t_Cur) (show : Vuna_dIr_dModel.t_Ir) (main : string) -> ((Base_dBytes.v_thenPair ((Base_dBytes.v_decBool fuel) c)) (fun (isAction : bool) (c1 : Base_dBytes.t_Cur) -> (((((v_decEntry3 fuel) c1) show) main) isAction))))

# 844 "Vuna/Ir/Codec.vuna"
let v_decEntry1 = (fun (fuel : int) (c : Base_dBytes.t_Cur) (show : Vuna_dIr_dModel.t_Ir) -> ((Base_dBytes.v_thenPair ((Base_dBytes.v_decStr fuel) c)) (fun (main : string) (c1 : Base_dBytes.t_Cur) -> ((((v_decEntry2 fuel) c1) show) main))))

# 841 "Vuna/Ir/Codec.vuna"
let v_decEntry = (fun (fuel : int) (c : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair ((v_decIr fuel) c)) (fun (show : Vuna_dIr_dModel.t_Ir) (c1 : Base_dBytes.t_Cur) -> (((v_decEntry1 fuel) c1) show))))

# 872 "Vuna/Ir/Codec.vuna"
let v_encListFam = (fun (mc0 : Vuna_dIr_dModel.t_IrListFam) (mc1 : string B_dData_dList.t_List) -> (match mc0 with
  | { Vuna_dIr_dModel.f_IrListFam_irListFamily = dtb__114; Vuna_dIr_dModel.f_IrListFam_irListNil = dtb__115; Vuna_dIr_dModel.f_IrListFam_irListCons = dtb__116 } -> ((Base_dBytes.v_encStr dtb__114) ((Base_dBytes.v_encStr dtb__115) ((Base_dBytes.v_encStr dtb__116) mc1)))
  | _ -> failwith "DT: impossible branch"
))

# 881 "Vuna/Ir/Codec.vuna"
let v_decListFam2 = (fun (fuel : int) (c : Base_dBytes.t_Cur) (fam : string) (nil : string) -> ((Base_dBytes.v_thenPair ((Base_dBytes.v_decStr fuel) c)) (fun (cons : string) (c1 : Base_dBytes.t_Cur) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = { Vuna_dIr_dModel.f_IrListFam_irListFamily = fam; Vuna_dIr_dModel.f_IrListFam_irListNil = nil; Vuna_dIr_dModel.f_IrListFam_irListCons = cons }; B_dData_dPair.f_Pair_second = c1 })))))

# 878 "Vuna/Ir/Codec.vuna"
let v_decListFam1 = (fun (fuel : int) (c : Base_dBytes.t_Cur) (fam : string) -> ((Base_dBytes.v_thenPair ((Base_dBytes.v_decStr fuel) c)) (fun (nil : string) (c1 : Base_dBytes.t_Cur) -> ((((v_decListFam2 fuel) c1) fam) nil))))

# 875 "Vuna/Ir/Codec.vuna"
let v_decListFam = (fun (fuel : int) (c : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair ((Base_dBytes.v_decStr fuel) c)) (fun (fam : string) (c1 : Base_dBytes.t_Cur) -> (((v_decListFam1 fuel) c1) fam))))

# 886 "Vuna/Ir/Codec.vuna"
let v_decFieldOrder = (fun (fuel : int) (c : Base_dBytes.t_Cur) -> (((Base_dBytes.v_decList ((Base_dBytes.v_decPair Base_dBytes.v_decInt) Base_dBytes.v_decStr)) fuel) c))

# 890 "Vuna/Ir/Codec.vuna"
let v_decNamedInt = (fun (fuel : int) (c : Base_dBytes.t_Cur) -> (((Base_dBytes.v_decList ((Base_dBytes.v_decPair Base_dBytes.v_decStr) ((Base_dBytes.v_decPair Base_dBytes.v_decStr) Base_dBytes.v_decInt))) fuel) c))

# 894 "Vuna/Ir/Codec.vuna"
let v_decCtorShapes = (fun (fuel : int) (c : Base_dBytes.t_Cur) -> (((Base_dBytes.v_decList ((Base_dBytes.v_decPair Base_dBytes.v_decStr) ((Base_dBytes.v_decPair Base_dBytes.v_decStr) v_decBools))) fuel) c))

# 897 "Vuna/Ir/Codec.vuna"
let v_encShared = (fun (s : Vuna_dIr_dModel.t_IrShared) (acc : string B_dData_dList.t_List) -> (((Base_dBytes.v_encList ((Base_dBytes.v_encPair Base_dBytes.v_encStr) (Base_dBytes.v_encList ((Base_dBytes.v_encPair Base_dBytes.v_encInt) Base_dBytes.v_encStr)))) (s).Vuna_dIr_dModel.f_IrShared_irSharedRecordFields) (((Base_dBytes.v_encMaybe v_encListFam) (s).Vuna_dIr_dModel.f_IrShared_irSharedListFam) ((Base_dBytes.v_encBool (s).Vuna_dIr_dModel.f_IrShared_irSharedUsesFloat) ((Base_dBytes.v_encBool (s).Vuna_dIr_dModel.f_IrShared_irSharedUsesTrace) ((Base_dBytes.v_encBool (s).Vuna_dIr_dModel.f_IrShared_irSharedUsesObs) (((Base_dBytes.v_encList ((Base_dBytes.v_encPair Base_dBytes.v_encStr) ((Base_dBytes.v_encPair Base_dBytes.v_encStr) Base_dBytes.v_encInt))) (s).Vuna_dIr_dModel.f_IrShared_irSharedDefLocs) (((Base_dBytes.v_encList ((Base_dBytes.v_encPair Base_dBytes.v_encStr) ((Base_dBytes.v_encPair Base_dBytes.v_encStr) Base_dBytes.v_encInt))) (s).Vuna_dIr_dModel.f_IrShared_irSharedUnboxed) (((Base_dBytes.v_encList ((Base_dBytes.v_encPair Base_dBytes.v_encStr) ((Base_dBytes.v_encPair Base_dBytes.v_encStr) v_encBools))) (s).Vuna_dIr_dModel.f_IrShared_irSharedCtorShapes) acc)))))))))

# 942 "Vuna/Ir/Codec.vuna"
let v_decShared7 = (fun (fuel : int) (c : Base_dBytes.t_Cur) (recFields : (string, (int, string) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (listFam : Vuna_dIr_dModel.t_IrListFam B_dData_dMaybe.t_Maybe) (usesFloat : bool) (usesTrace : bool) (usesObs : bool) (defLocs : (string, (string, int) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (unboxed : (string, (string, int) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) -> ((Base_dBytes.v_thenPair ((v_decCtorShapes fuel) c)) (fun (ctorShapes : (string, (string, bool B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (c1 : Base_dBytes.t_Cur) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = { Vuna_dIr_dModel.f_IrShared_irSharedRecordFields = recFields; Vuna_dIr_dModel.f_IrShared_irSharedListFam = listFam; Vuna_dIr_dModel.f_IrShared_irSharedUsesFloat = usesFloat; Vuna_dIr_dModel.f_IrShared_irSharedUsesTrace = usesTrace; Vuna_dIr_dModel.f_IrShared_irSharedUsesObs = usesObs; Vuna_dIr_dModel.f_IrShared_irSharedDefLocs = defLocs; Vuna_dIr_dModel.f_IrShared_irSharedUnboxed = unboxed; Vuna_dIr_dModel.f_IrShared_irSharedCtorShapes = ctorShapes }; B_dData_dPair.f_Pair_second = c1 })))))

# 936 "Vuna/Ir/Codec.vuna"
let v_decShared6 = (fun (fuel : int) (c : Base_dBytes.t_Cur) (recFields : (string, (int, string) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (listFam : Vuna_dIr_dModel.t_IrListFam B_dData_dMaybe.t_Maybe) (usesFloat : bool) (usesTrace : bool) (usesObs : bool) (defLocs : (string, (string, int) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) -> ((Base_dBytes.v_thenPair ((v_decNamedInt fuel) c)) (fun (unboxed : (string, (string, int) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (c1 : Base_dBytes.t_Cur) -> (((((((((v_decShared7 fuel) c1) recFields) listFam) usesFloat) usesTrace) usesObs) defLocs) unboxed))))

# 930 "Vuna/Ir/Codec.vuna"
let v_decShared5 = (fun (fuel : int) (c : Base_dBytes.t_Cur) (recFields : (string, (int, string) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (listFam : Vuna_dIr_dModel.t_IrListFam B_dData_dMaybe.t_Maybe) (usesFloat : bool) (usesTrace : bool) (usesObs : bool) -> ((Base_dBytes.v_thenPair ((v_decNamedInt fuel) c)) (fun (defLocs : (string, (string, int) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (c1 : Base_dBytes.t_Cur) -> ((((((((v_decShared6 fuel) c1) recFields) listFam) usesFloat) usesTrace) usesObs) defLocs))))

# 924 "Vuna/Ir/Codec.vuna"
let v_decShared4 = (fun (fuel : int) (c : Base_dBytes.t_Cur) (recFields : (string, (int, string) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (listFam : Vuna_dIr_dModel.t_IrListFam B_dData_dMaybe.t_Maybe) (usesFloat : bool) (usesTrace : bool) -> ((Base_dBytes.v_thenPair ((Base_dBytes.v_decBool fuel) c)) (fun (usesObs : bool) (c1 : Base_dBytes.t_Cur) -> (((((((v_decShared5 fuel) c1) recFields) listFam) usesFloat) usesTrace) usesObs))))

# 918 "Vuna/Ir/Codec.vuna"
let v_decShared3 = (fun (fuel : int) (c : Base_dBytes.t_Cur) (recFields : (string, (int, string) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (listFam : Vuna_dIr_dModel.t_IrListFam B_dData_dMaybe.t_Maybe) (usesFloat : bool) -> ((Base_dBytes.v_thenPair ((Base_dBytes.v_decBool fuel) c)) (fun (usesTrace : bool) (c1 : Base_dBytes.t_Cur) -> ((((((v_decShared4 fuel) c1) recFields) listFam) usesFloat) usesTrace))))

# 914 "Vuna/Ir/Codec.vuna"
let v_decShared2 = (fun (fuel : int) (c : Base_dBytes.t_Cur) (recFields : (string, (int, string) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (listFam : Vuna_dIr_dModel.t_IrListFam B_dData_dMaybe.t_Maybe) -> ((Base_dBytes.v_thenPair ((Base_dBytes.v_decBool fuel) c)) (fun (usesFloat : bool) (c1 : Base_dBytes.t_Cur) -> (((((v_decShared3 fuel) c1) recFields) listFam) usesFloat))))

# 910 "Vuna/Ir/Codec.vuna"
let v_decShared1 = (fun (fuel : int) (c : Base_dBytes.t_Cur) (recFields : (string, (int, string) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) -> ((Base_dBytes.v_thenPair (((Base_dBytes.v_decMaybe v_decListFam) fuel) c)) (fun (listFam : Vuna_dIr_dModel.t_IrListFam B_dData_dMaybe.t_Maybe) (c1 : Base_dBytes.t_Cur) -> ((((v_decShared2 fuel) c1) recFields) listFam))))

# 904 "Vuna/Ir/Codec.vuna"
let v_decShared = (fun (fuel : int) (c : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair (((Base_dBytes.v_decList ((Base_dBytes.v_decPair Base_dBytes.v_decStr) (Base_dBytes.v_decList ((Base_dBytes.v_decPair Base_dBytes.v_decInt) Base_dBytes.v_decStr)))) fuel) c)) (fun (recFields : (string, (int, string) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (c1 : Base_dBytes.t_Cur) -> (((v_decShared1 fuel) c1) recFields))))

# 951 "Vuna/Ir/Codec.vuna"
let v_encUnit = (fun (fuel : int) (u : Vuna_dIr_dModel.t_IrUnit) (acc : string B_dData_dList.t_List) -> (if (fuel <= 0) then acc else (((Base_dBytes.v_encList (v_encTyDecl (fuel - 1))) (u).Vuna_dIr_dModel.f_IrUnit_irUnitTyDecls) (((Base_dBytes.v_encList (v_encGroup (fuel - 1))) (u).Vuna_dIr_dModel.f_IrUnit_irUnitGroups) ((Base_dBytes.v_encBool (u).Vuna_dIr_dModel.f_IrUnit_irUnitHasListFamily) ((v_encStrs (u).Vuna_dIr_dModel.f_IrUnit_irUnitTypeRefs) (((Base_dBytes.v_encMaybe (v_encEntry (fuel - 1))) (u).Vuna_dIr_dModel.f_IrUnit_irUnitEntry) acc)))))))

# 980 "Vuna/Ir/Codec.vuna"
let v_decUnit4 = (fun (fuel : int) (c : Base_dBytes.t_Cur) (tyDecls : Vuna_dIr_dModel.t_IrTyDecl B_dData_dList.t_List) (groups : Vuna_dIr_dModel.t_IrGroup B_dData_dList.t_List) (hasListFamily : bool) (typeRefs : string B_dData_dList.t_List) -> ((Base_dBytes.v_thenPair (((Base_dBytes.v_decMaybe v_decEntry) fuel) c)) (fun (entry : Vuna_dIr_dModel.t_IrEntry B_dData_dMaybe.t_Maybe) (c1 : Base_dBytes.t_Cur) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = { Vuna_dIr_dModel.f_IrUnit_irUnitTyDecls = tyDecls; Vuna_dIr_dModel.f_IrUnit_irUnitGroups = groups; Vuna_dIr_dModel.f_IrUnit_irUnitHasListFamily = hasListFamily; Vuna_dIr_dModel.f_IrUnit_irUnitTypeRefs = typeRefs; Vuna_dIr_dModel.f_IrUnit_irUnitEntry = entry }; B_dData_dPair.f_Pair_second = c1 })))))

# 974 "Vuna/Ir/Codec.vuna"
let v_decUnit3 = (fun (fuel : int) (c : Base_dBytes.t_Cur) (tyDecls : Vuna_dIr_dModel.t_IrTyDecl B_dData_dList.t_List) (groups : Vuna_dIr_dModel.t_IrGroup B_dData_dList.t_List) (hasListFamily : bool) -> ((Base_dBytes.v_thenPair ((v_decStrs fuel) c)) (fun (typeRefs : string B_dData_dList.t_List) (c1 : Base_dBytes.t_Cur) -> ((((((v_decUnit4 fuel) c1) tyDecls) groups) hasListFamily) typeRefs))))

# 968 "Vuna/Ir/Codec.vuna"
let v_decUnit2 = (fun (fuel : int) (c : Base_dBytes.t_Cur) (tyDecls : Vuna_dIr_dModel.t_IrTyDecl B_dData_dList.t_List) (groups : Vuna_dIr_dModel.t_IrGroup B_dData_dList.t_List) -> ((Base_dBytes.v_thenPair ((Base_dBytes.v_decBool fuel) c)) (fun (hasListFamily : bool) (c1 : Base_dBytes.t_Cur) -> (((((v_decUnit3 fuel) c1) tyDecls) groups) hasListFamily))))

# 964 "Vuna/Ir/Codec.vuna"
let v_decUnit1 = (fun (fuel : int) (c : Base_dBytes.t_Cur) (tyDecls : Vuna_dIr_dModel.t_IrTyDecl B_dData_dList.t_List) -> ((Base_dBytes.v_thenPair (((Base_dBytes.v_decList v_decGroup) fuel) c)) (fun (groups : Vuna_dIr_dModel.t_IrGroup B_dData_dList.t_List) (c1 : Base_dBytes.t_Cur) -> ((((v_decUnit2 fuel) c1) tyDecls) groups))))

# 961 "Vuna/Ir/Codec.vuna"
let v_decUnit = (fun (fuel : int) (c : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair (((Base_dBytes.v_decList v_decTyDecl) fuel) c)) (fun (tyDecls : Vuna_dIr_dModel.t_IrTyDecl B_dData_dList.t_List) (c1 : Base_dBytes.t_Cur) -> (((v_decUnit1 fuel) c1) tyDecls))))

# 987 "Vuna/Ir/Codec.vuna"
let v_irEncoderFuel = 16777216

# 991 "Vuna/Ir/Codec.vuna"
let v_encodeProgram = (fun (p : Vuna_dIr_dModel.t_IrProgram) -> ((Base_dBytes.v_encTop (fun (x : Vuna_dIr_dModel.t_IrProgram) (acc : string B_dData_dList.t_List) -> ((v_encShared (Vuna_dIr_dModel.v_irProgSharedOf x)) (((v_encUnit v_irEncoderFuel) (Vuna_dIr_dModel.v_irProgUnitOf x)) acc)))) p))

# 996 "Vuna/Ir/Codec.vuna"
let v_decodeProgram = (fun (fuel : int) (bytes : string) -> (if (fuel <= 0) then B_dData_dMaybe.C_Maybe_Nothing else (if ((bi_strLength bytes) <= 0) then B_dData_dMaybe.C_Maybe_Nothing else ((fun nd_uscrut2 -> (match nd_uscrut2 with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb__117) -> (match dtb__117 with
  | { B_dData_dPair.f_Pair_first = dtb__118; B_dData_dPair.f_Pair_second = dtb__119 } -> (B_dData_dMaybe.C_Maybe_Just (dtb__118))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) ((Base_dBytes.v_thenPair ((v_decShared fuel) (Base_dBytes.v_curOf bytes))) (fun (shared : Vuna_dIr_dModel.t_IrShared) (c1 : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair ((v_decUnit fuel) c1)) (fun (unit : Vuna_dIr_dModel.t_IrUnit) (c2 : Base_dBytes.t_Cur) -> (if (Base_dBytes.v_curAtEnd c2) then (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = { Vuna_dIr_dModel.f_IrProgram_irProgShared = shared; Vuna_dIr_dModel.f_IrProgram_irProgUnit = unit }; B_dData_dPair.f_Pair_second = c2 })) else B_dData_dMaybe.C_Maybe_Nothing)))))))))

# 1008 "Vuna/Ir/Codec.vuna"
let v_encodeUnit = (fun (u : Vuna_dIr_dModel.t_IrUnit) -> ((Base_dBytes.v_encTop (v_encUnit v_irEncoderFuel)) u))

# 1012 "Vuna/Ir/Codec.vuna"
let v_decodeUnit = (fun (fuel : int) (bytes : string) -> (if (fuel <= 0) then B_dData_dMaybe.C_Maybe_Nothing else (if ((bi_strLength bytes) <= 0) then B_dData_dMaybe.C_Maybe_Nothing else ((fun nd_uscrut2 -> (match nd_uscrut2 with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb__120) -> (match dtb__120 with
  | { B_dData_dPair.f_Pair_first = dtb__121; B_dData_dPair.f_Pair_second = dtb__122 } -> (B_dData_dMaybe.C_Maybe_Just (dtb__121))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) ((Base_dBytes.v_thenPair ((v_decUnit fuel) (Base_dBytes.v_curOf bytes))) (fun (unit : Vuna_dIr_dModel.t_IrUnit) (c2 : Base_dBytes.t_Cur) -> (if (Base_dBytes.v_curAtEnd c2) then (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = unit; B_dData_dPair.f_Pair_second = c2 })) else B_dData_dMaybe.C_Maybe_Nothing)))))))
