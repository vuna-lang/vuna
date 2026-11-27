open Vuna_runtime
# 31 "Vuna/Ir/Codec.vuna"
let v_encStrs = (fun (dtb_u_u1 : string B_dData_dList.t_List) (dtb_u_u2 : string B_dData_dList.t_List) -> (((Base_dBytes.v_encList Base_dBytes.v_encStr) dtb_u_u1) dtb_u_u2))

# 35 "Vuna/Ir/Codec.vuna"
let v_encBools = (fun (dtb_u_u3 : bool B_dData_dList.t_List) (dtb_u_u4 : string B_dData_dList.t_List) -> (((Base_dBytes.v_encList Base_dBytes.v_encBool) dtb_u_u3) dtb_u_u4))

# 39 "Vuna/Ir/Codec.vuna"
let v_decStrs = (fun (dtb_u_u5 : int) (dtb_u_u6 : Base_dBytes.t_Cur) -> (((Base_dBytes.v_decList Base_dBytes.v_decStr) dtb_u_u5) dtb_u_u6))

# 43 "Vuna/Ir/Codec.vuna"
let v_decBools = (fun (dtb_u_u7 : int) (dtb_u_u8 : Base_dBytes.t_Cur) -> (((Base_dBytes.v_decList Base_dBytes.v_decBool) dtb_u_u7) dtb_u_u8))

# 49 "Vuna/Ir/Codec.vuna"
let v_encSpan = (fun (dtb_u_u9 : Base_dSource.t_Span) (dtb_u_u10 : string B_dData_dList.t_List) -> ((Base_dBytes.v_encStr (Base_dSource.v_spanFile dtb_u_u9)) ((Base_dBytes.v_encInt (Base_dSource.v_spanStartLine dtb_u_u9)) ((Base_dBytes.v_encInt (Base_dSource.v_spanStartCol dtb_u_u9)) ((Base_dBytes.v_encInt (Base_dSource.v_spanEndLine dtb_u_u9)) ((Base_dBytes.v_encInt (Base_dSource.v_spanEndCol dtb_u_u9)) ((Base_dBytes.v_encInt (Base_dSource.v_spanStartOffset dtb_u_u9)) ((Base_dBytes.v_encInt (Base_dSource.v_spanEndOffset dtb_u_u9)) dtb_u_u10))))))))

# 55 "Vuna/Ir/Codec.vuna"
let v_encSpanM = (fun (dtb_u_u11 : Base_dSource.t_Span B_dData_dMaybe.t_Maybe) (dtb_u_u12 : string B_dData_dList.t_List) -> (((Base_dBytes.v_encMaybe v_encSpan) dtb_u_u11) dtb_u_u12))

# 78 "Vuna/Ir/Codec.vuna"
let v_decSpan6 = (fun (dtb_u_u13 : int) (dtb_u_u14 : Base_dBytes.t_Cur) (dtb_u_u15 : string) (dtb_u_u16 : int) (dtb_u_u17 : int) (dtb_u_u18 : int) (dtb_u_u19 : int) (dtb_u_u20 : int) -> ((Base_dBytes.v_thenPair ((Base_dBytes.v_decInt dtb_u_u13) dtb_u_u14)) (fun (dtb_u_u21 : int) (dtb_u_u22 : Base_dBytes.t_Cur) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = { Base_dSource.f_Span_spanFile = dtb_u_u15; Base_dSource.f_Span_spanStartLine = dtb_u_u16; Base_dSource.f_Span_spanStartCol = dtb_u_u17; Base_dSource.f_Span_spanEndLine = dtb_u_u18; Base_dSource.f_Span_spanEndCol = dtb_u_u19; Base_dSource.f_Span_spanStartOffset = dtb_u_u20; Base_dSource.f_Span_spanEndOffset = dtb_u_u21 }; B_dData_dPair.f_Pair_second = dtb_u_u22 })))))

# 74 "Vuna/Ir/Codec.vuna"
let v_decSpan5 = (fun (dtb_u_u23 : int) (dtb_u_u24 : Base_dBytes.t_Cur) (dtb_u_u25 : string) (dtb_u_u26 : int) (dtb_u_u27 : int) (dtb_u_u28 : int) (dtb_u_u29 : int) -> ((Base_dBytes.v_thenPair ((Base_dBytes.v_decInt dtb_u_u23) dtb_u_u24)) (fun (dtb_u_u30 : int) (dtb_u_u31 : Base_dBytes.t_Cur) -> ((((((((v_decSpan6 dtb_u_u23) dtb_u_u31) dtb_u_u25) dtb_u_u26) dtb_u_u27) dtb_u_u28) dtb_u_u29) dtb_u_u30))))

# 70 "Vuna/Ir/Codec.vuna"
let v_decSpan4 = (fun (dtb_u_u32 : int) (dtb_u_u33 : Base_dBytes.t_Cur) (dtb_u_u34 : string) (dtb_u_u35 : int) (dtb_u_u36 : int) (dtb_u_u37 : int) -> ((Base_dBytes.v_thenPair ((Base_dBytes.v_decInt dtb_u_u32) dtb_u_u33)) (fun (dtb_u_u38 : int) (dtb_u_u39 : Base_dBytes.t_Cur) -> (((((((v_decSpan5 dtb_u_u32) dtb_u_u39) dtb_u_u34) dtb_u_u35) dtb_u_u36) dtb_u_u37) dtb_u_u38))))

# 67 "Vuna/Ir/Codec.vuna"
let v_decSpan3 = (fun (dtb_u_u40 : int) (dtb_u_u41 : Base_dBytes.t_Cur) (dtb_u_u42 : string) (dtb_u_u43 : int) (dtb_u_u44 : int) -> ((Base_dBytes.v_thenPair ((Base_dBytes.v_decInt dtb_u_u40) dtb_u_u41)) (fun (dtb_u_u45 : int) (dtb_u_u46 : Base_dBytes.t_Cur) -> ((((((v_decSpan4 dtb_u_u40) dtb_u_u46) dtb_u_u42) dtb_u_u43) dtb_u_u44) dtb_u_u45))))

# 64 "Vuna/Ir/Codec.vuna"
let v_decSpan2 = (fun (dtb_u_u47 : int) (dtb_u_u48 : Base_dBytes.t_Cur) (dtb_u_u49 : string) (dtb_u_u50 : int) -> ((Base_dBytes.v_thenPair ((Base_dBytes.v_decInt dtb_u_u47) dtb_u_u48)) (fun (dtb_u_u51 : int) (dtb_u_u52 : Base_dBytes.t_Cur) -> (((((v_decSpan3 dtb_u_u47) dtb_u_u52) dtb_u_u49) dtb_u_u50) dtb_u_u51))))

# 61 "Vuna/Ir/Codec.vuna"
let v_decSpan1 = (fun (dtb_u_u53 : int) (dtb_u_u54 : Base_dBytes.t_Cur) (dtb_u_u55 : string) -> ((Base_dBytes.v_thenPair ((Base_dBytes.v_decInt dtb_u_u53) dtb_u_u54)) (fun (dtb_u_u56 : int) (dtb_u_u57 : Base_dBytes.t_Cur) -> ((((v_decSpan2 dtb_u_u53) dtb_u_u57) dtb_u_u55) dtb_u_u56))))

# 58 "Vuna/Ir/Codec.vuna"
let v_decSpan = (fun (dtb_u_u58 : int) (dtb_u_u59 : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair ((Base_dBytes.v_decStr dtb_u_u58) dtb_u_u59)) (fun (dtb_u_u60 : string) (dtb_u_u61 : Base_dBytes.t_Cur) -> (((v_decSpan1 dtb_u_u58) dtb_u_u61) dtb_u_u60))))

# 82 "Vuna/Ir/Codec.vuna"
let v_decSpanM = (fun (dtb_u_u62 : int) (dtb_u_u63 : Base_dBytes.t_Cur) -> (((Base_dBytes.v_decMaybe v_decSpan) dtb_u_u62) dtb_u_u63))

# 88 "Vuna/Ir/Codec.vuna"
let rec v_encIrTy = (fun (dtb_u_u64 : int) (dtb_u_u65 : Vuna_dIr_dModel.t_IrTy) (dtb_u_u66 : string B_dData_dList.t_List) -> (if (dtb_u_u64 <= 0) then dtb_u_u66 else (match dtb_u_u65 with
  | Vuna_dIr_dModel.C_IrTy_IrTyVar (dtb_u_u67) -> ((Base_dBytes.v_encTag 0) ((Base_dBytes.v_encInt dtb_u_u67) dtb_u_u66))
  | Vuna_dIr_dModel.C_IrTy_IrTyInt -> ((Base_dBytes.v_encTag 1) dtb_u_u66)
  | Vuna_dIr_dModel.C_IrTy_IrTyStr -> ((Base_dBytes.v_encTag 2) dtb_u_u66)
  | Vuna_dIr_dModel.C_IrTy_IrTyBool -> ((Base_dBytes.v_encTag 3) dtb_u_u66)
  | Vuna_dIr_dModel.C_IrTy_IrTyFloat -> ((Base_dBytes.v_encTag 4) dtb_u_u66)
  | Vuna_dIr_dModel.C_IrTy_IrTyOpaque -> ((Base_dBytes.v_encTag 5) dtb_u_u66)
  | Vuna_dIr_dModel.C_IrTy_IrTyArray (dtb_u_u68) -> ((Base_dBytes.v_encTag 6) (((v_encIrTy (dtb_u_u64 - 1)) dtb_u_u68) dtb_u_u66))
  | Vuna_dIr_dModel.C_IrTy_IrTyRef (dtb_u_u69) -> ((Base_dBytes.v_encTag 7) (((v_encIrTy (dtb_u_u64 - 1)) dtb_u_u69) dtb_u_u66))
  | Vuna_dIr_dModel.C_IrTy_IrTyData (dtb_u_u70, dtb_u_u71) -> ((Base_dBytes.v_encTag 8) ((Base_dBytes.v_encStr dtb_u_u70) (((v_encIrTys (dtb_u_u64 - 1)) dtb_u_u71) dtb_u_u66)))
  | Vuna_dIr_dModel.C_IrTy_IrTyFun (dtb_u_u72, dtb_u_u73) -> ((Base_dBytes.v_encTag 9) (((v_encIrTy (dtb_u_u64 - 1)) dtb_u_u72) (((v_encIrTy (dtb_u_u64 - 1)) dtb_u_u73) dtb_u_u66)))
  | _ -> failwith "DT: impossible branch"
)))
# 105 "Vuna/Ir/Codec.vuna"
and v_encIrTys = (fun (dtb_u_u74 : int) (dtb_u_u75 : Vuna_dIr_dModel.t_IrTy B_dData_dList.t_List) (dtb_u_u76 : string B_dData_dList.t_List) -> (B_dData_dList.C_List__x58__x58_ ("[", (B_dData_dList.C_List__x58__x58_ ((string_of_int (Base_dBytes.v_lenOf dtb_u_u75)), (B_dData_dList.C_List__x58__x58_ (":", (((v_encIrTysGo dtb_u_u74) dtb_u_u75) dtb_u_u76))))))))
# 108 "Vuna/Ir/Codec.vuna"
and v_encIrTysGo = (fun (dtb_u_u77 : int) (dtb_u_u78 : Vuna_dIr_dModel.t_IrTy B_dData_dList.t_List) (dtb_u_u79 : string B_dData_dList.t_List) -> (if (dtb_u_u77 <= 0) then dtb_u_u79 else (match dtb_u_u78 with
  | B_dData_dList.C_List_Nil -> dtb_u_u79
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u80, dtb_u_u81) -> (((v_encIrTy (dtb_u_u77 - 1)) dtb_u_u80) (((v_encIrTysGo (dtb_u_u77 - 1)) dtb_u_u81) dtb_u_u79))
  | _ -> failwith "DT: impossible branch"
)))

# 117 "Vuna/Ir/Codec.vuna"
let v_encIrTyM = (fun (dtb_u_u82 : int) (dtb_u_u83 : Vuna_dIr_dModel.t_IrTy B_dData_dMaybe.t_Maybe) (dtb_u_u84 : string B_dData_dList.t_List) -> (if (dtb_u_u82 <= 0) then dtb_u_u84 else (match dtb_u_u83 with
  | B_dData_dMaybe.C_Maybe_Nothing -> (B_dData_dList.C_List__x58__x58_ ("0", dtb_u_u84))
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u85) -> (B_dData_dList.C_List__x58__x58_ ("1", (((v_encIrTy (dtb_u_u82 - 1)) dtb_u_u85) dtb_u_u84)))
  | _ -> failwith "DT: impossible branch"
)))

# 126 "Vuna/Ir/Codec.vuna"
let rec v_decIrTys = (fun (dtb_u_u86 : int) (dtb_u_u87 : Base_dBytes.t_Cur) -> (if (dtb_u_u86 <= 0) then B_dData_dMaybe.C_Maybe_Nothing else (let dtb_u_u88 = (Base_dBytes.v_curChar dtb_u_u87) in (match dtb_u_u88 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u89) -> (if (dtb_u_u89 = 91) then ((Base_dBytes.v_thenPair ((Base_dBytes.v_decListHead (dtb_u_u86 - 1)) dtb_u_u87)) (fun (dtb_u_u90 : int) (dtb_u_u91 : Base_dBytes.t_Cur) -> ((((v_decIrTysGo dtb_u_u90) (dtb_u_u86 - 1)) dtb_u_u91) B_dData_dList.C_List_Nil))) else B_dData_dMaybe.C_Maybe_Nothing)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
))))
# 135 "Vuna/Ir/Codec.vuna"
and v_decIrTysGo = (fun (dtb_u_u92 : int) (dtb_u_u93 : int) (dtb_u_u94 : Base_dBytes.t_Cur) (dtb_u_u95 : Vuna_dIr_dModel.t_IrTy B_dData_dList.t_List) -> (if (dtb_u_u92 <= 0) then (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (B_dData_dList.v_reverse dtb_u_u95); B_dData_dPair.f_Pair_second = dtb_u_u94 })) else (if (dtb_u_u93 <= 0) then B_dData_dMaybe.C_Maybe_Nothing else ((Base_dBytes.v_thenPair ((v_decIrTy dtb_u_u93) dtb_u_u94)) (fun (dtb_u_u96 : Vuna_dIr_dModel.t_IrTy) (dtb_u_u97 : Base_dBytes.t_Cur) -> ((((v_decIrTysGo (dtb_u_u92 - 1)) (dtb_u_u93 - 1)) dtb_u_u97) (B_dData_dList.C_List__x58__x58_ (dtb_u_u96, dtb_u_u95))))))))
# 144 "Vuna/Ir/Codec.vuna"
and v_decIrTy = (fun (dtb_u_u98 : int) (dtb_u_u99 : Base_dBytes.t_Cur) -> (if (dtb_u_u98 <= 0) then B_dData_dMaybe.C_Maybe_Nothing else ((Base_dBytes.v_thenPair ((Base_dBytes.v_decTag dtb_u_u98) dtb_u_u99)) (fun (dtb_u_u100 : int) (dtb_u_u101 : Base_dBytes.t_Cur) -> (((v_decIrTyTag dtb_u_u100) (dtb_u_u98 - 1)) dtb_u_u101)))))
# 151 "Vuna/Ir/Codec.vuna"
and v_decIrTyTag = (fun (dtb_u_u102 : int) (dtb_u_u103 : int) (dtb_u_u104 : Base_dBytes.t_Cur) -> (if (dtb_u_u102 = 0) then ((Base_dBytes.v_thenPair ((Base_dBytes.v_decInt dtb_u_u103) dtb_u_u104)) (fun (dtb_u_u105 : int) (dtb_u_u106 : Base_dBytes.t_Cur) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Vuna_dIr_dModel.C_IrTy_IrTyVar (dtb_u_u105)); B_dData_dPair.f_Pair_second = dtb_u_u106 })))) else (if (dtb_u_u102 = 1) then (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = Vuna_dIr_dModel.C_IrTy_IrTyInt; B_dData_dPair.f_Pair_second = dtb_u_u104 })) else (if (dtb_u_u102 = 2) then (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = Vuna_dIr_dModel.C_IrTy_IrTyStr; B_dData_dPair.f_Pair_second = dtb_u_u104 })) else (if (dtb_u_u102 = 3) then (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = Vuna_dIr_dModel.C_IrTy_IrTyBool; B_dData_dPair.f_Pair_second = dtb_u_u104 })) else (if (dtb_u_u102 = 4) then (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = Vuna_dIr_dModel.C_IrTy_IrTyFloat; B_dData_dPair.f_Pair_second = dtb_u_u104 })) else (if (dtb_u_u102 = 5) then (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = Vuna_dIr_dModel.C_IrTy_IrTyOpaque; B_dData_dPair.f_Pair_second = dtb_u_u104 })) else (if (dtb_u_u102 = 6) then (((v_decIrTyWrap (fun dtb_u_u107 -> (Vuna_dIr_dModel.C_IrTy_IrTyArray (dtb_u_u107)))) dtb_u_u103) dtb_u_u104) else (if (dtb_u_u102 = 7) then (((v_decIrTyWrap (fun dtb_u_u108 -> (Vuna_dIr_dModel.C_IrTy_IrTyRef (dtb_u_u108)))) dtb_u_u103) dtb_u_u104) else (if (dtb_u_u102 = 8) then ((v_decIrTyData dtb_u_u103) dtb_u_u104) else (if (dtb_u_u102 = 9) then ((v_decIrTyFun dtb_u_u103) dtb_u_u104) else B_dData_dMaybe.C_Maybe_Nothing)))))))))))
# 164 "Vuna/Ir/Codec.vuna"
and v_decIrTyWrap = (fun (dtb_u_u109 : (Vuna_dIr_dModel.t_IrTy) -> Vuna_dIr_dModel.t_IrTy) (dtb_u_u110 : int) (dtb_u_u111 : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair ((v_decIrTy dtb_u_u110) dtb_u_u111)) (fun (dtb_u_u112 : Vuna_dIr_dModel.t_IrTy) (dtb_u_u113 : Base_dBytes.t_Cur) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (dtb_u_u109 dtb_u_u112); B_dData_dPair.f_Pair_second = dtb_u_u113 })))))
# 167 "Vuna/Ir/Codec.vuna"
and v_decIrTyData = (fun (dtb_u_u114 : int) (dtb_u_u115 : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair ((Base_dBytes.v_decStr dtb_u_u114) dtb_u_u115)) (fun (dtb_u_u116 : string) (dtb_u_u117 : Base_dBytes.t_Cur) -> (((v_decIrTyData1 dtb_u_u114) dtb_u_u117) dtb_u_u116))))
# 170 "Vuna/Ir/Codec.vuna"
and v_decIrTyData1 = (fun (dtb_u_u118 : int) (dtb_u_u119 : Base_dBytes.t_Cur) (dtb_u_u120 : string) -> ((Base_dBytes.v_thenPair ((v_decIrTys dtb_u_u118) dtb_u_u119)) (fun (dtb_u_u121 : Vuna_dIr_dModel.t_IrTy B_dData_dList.t_List) (dtb_u_u122 : Base_dBytes.t_Cur) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Vuna_dIr_dModel.C_IrTy_IrTyData (dtb_u_u120, dtb_u_u121)); B_dData_dPair.f_Pair_second = dtb_u_u122 })))))
# 173 "Vuna/Ir/Codec.vuna"
and v_decIrTyFun = (fun (dtb_u_u123 : int) (dtb_u_u124 : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair ((v_decIrTy dtb_u_u123) dtb_u_u124)) (fun (dtb_u_u125 : Vuna_dIr_dModel.t_IrTy) (dtb_u_u126 : Base_dBytes.t_Cur) -> (((v_decIrTyFun1 dtb_u_u123) dtb_u_u126) dtb_u_u125))))
# 176 "Vuna/Ir/Codec.vuna"
and v_decIrTyFun1 = (fun (dtb_u_u127 : int) (dtb_u_u128 : Base_dBytes.t_Cur) (dtb_u_u129 : Vuna_dIr_dModel.t_IrTy) -> ((Base_dBytes.v_thenPair ((v_decIrTy dtb_u_u127) dtb_u_u128)) (fun (dtb_u_u130 : Vuna_dIr_dModel.t_IrTy) (dtb_u_u131 : Base_dBytes.t_Cur) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Vuna_dIr_dModel.C_IrTy_IrTyFun (dtb_u_u129, dtb_u_u130)); B_dData_dPair.f_Pair_second = dtb_u_u131 })))))

# 179 "Vuna/Ir/Codec.vuna"
let v_decIrTyM = (fun (dtb_u_u132 : int) (dtb_u_u133 : Base_dBytes.t_Cur) -> (((Base_dBytes.v_decMaybe v_decIrTy) dtb_u_u132) dtb_u_u133))

# 185 "Vuna/Ir/Codec.vuna"
let v_encBName = (fun (dtb_u_u134 : Vuna_dIr_dModel.t_IrBName) (dtb_u_u135 : string B_dData_dList.t_List) -> (match dtb_u_u134 with
  | Vuna_dIr_dModel.C_IrBName_IrBWild -> ((Base_dBytes.v_encTag 3) dtb_u_u135)
  | Vuna_dIr_dModel.C_IrBName_IrBNat (dtb_u_u136) -> ((Base_dBytes.v_encTag 2) ((Base_dBytes.v_encInt dtb_u_u136) dtb_u_u135))
  | Vuna_dIr_dModel.C_IrBName_IrBArm (dtb_u_u137) -> ((Base_dBytes.v_encTag 1) ((Base_dBytes.v_encInt dtb_u_u137) dtb_u_u135))
  | Vuna_dIr_dModel.C_IrBName_IrBUser (dtb_u_u138) -> ((Base_dBytes.v_encTag 0) ((Base_dBytes.v_encStr dtb_u_u138) dtb_u_u135))
  | _ -> failwith "DT: impossible branch"
))

# 198 "Vuna/Ir/Codec.vuna"
let v_decBNameTag = (fun (dtb_u_u139 : int) (dtb_u_u140 : int) (dtb_u_u141 : Base_dBytes.t_Cur) -> (if (dtb_u_u139 = 0) then ((Base_dBytes.v_thenPair ((Base_dBytes.v_decStr dtb_u_u140) dtb_u_u141)) (fun (dtb_u_u142 : string) (dtb_u_u143 : Base_dBytes.t_Cur) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Vuna_dIr_dModel.C_IrBName_IrBUser (dtb_u_u142)); B_dData_dPair.f_Pair_second = dtb_u_u143 })))) else (if (dtb_u_u139 = 1) then ((Base_dBytes.v_thenPair ((Base_dBytes.v_decInt dtb_u_u140) dtb_u_u141)) (fun (dtb_u_u144 : int) (dtb_u_u145 : Base_dBytes.t_Cur) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Vuna_dIr_dModel.C_IrBName_IrBArm (dtb_u_u144)); B_dData_dPair.f_Pair_second = dtb_u_u145 })))) else (if (dtb_u_u139 = 2) then ((Base_dBytes.v_thenPair ((Base_dBytes.v_decInt dtb_u_u140) dtb_u_u141)) (fun (dtb_u_u146 : int) (dtb_u_u147 : Base_dBytes.t_Cur) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Vuna_dIr_dModel.C_IrBName_IrBNat (dtb_u_u146)); B_dData_dPair.f_Pair_second = dtb_u_u147 })))) else (if (dtb_u_u139 = 3) then (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = Vuna_dIr_dModel.C_IrBName_IrBWild; B_dData_dPair.f_Pair_second = dtb_u_u141 })) else B_dData_dMaybe.C_Maybe_Nothing)))))

# 191 "Vuna/Ir/Codec.vuna"
let v_decBName = (fun (dtb_u_u148 : int) (dtb_u_u149 : Base_dBytes.t_Cur) -> (if (dtb_u_u148 <= 0) then B_dData_dMaybe.C_Maybe_Nothing else ((Base_dBytes.v_thenPair ((Base_dBytes.v_decTag dtb_u_u148) dtb_u_u149)) (fun (dtb_u_u150 : int) (dtb_u_u151 : Base_dBytes.t_Cur) -> (((v_decBNameTag dtb_u_u150) (dtb_u_u148 - 1)) dtb_u_u151)))))

# 205 "Vuna/Ir/Codec.vuna"
let v_encBinder = (fun (dtb_u_u152 : int) (dtb_u_u153 : Vuna_dIr_dModel.t_IrBinder) (dtb_u_u154 : string B_dData_dList.t_List) -> ((Base_dBytes.v_encInt (dtb_u_u153).Vuna_dIr_dModel.f_IrBinder_irBinderId) ((v_encBName (dtb_u_u153).Vuna_dIr_dModel.f_IrBinder_irBinderName) ((Base_dBytes.v_encBool (dtb_u_u153).Vuna_dIr_dModel.f_IrBinder_irBinderErased) (((v_encIrTyM (dtb_u_u152 - 1)) (dtb_u_u153).Vuna_dIr_dModel.f_IrBinder_irBinderTy) dtb_u_u154)))))

# 221 "Vuna/Ir/Codec.vuna"
let v_decBinder2 = (fun (dtb_u_u155 : int) (dtb_u_u156 : Base_dBytes.t_Cur) (dtb_u_u157 : int) (dtb_u_u158 : Vuna_dIr_dModel.t_IrBName) (dtb_u_u159 : bool) -> ((Base_dBytes.v_thenPair ((v_decIrTyM dtb_u_u155) dtb_u_u156)) (fun (dtb_u_u160 : Vuna_dIr_dModel.t_IrTy B_dData_dMaybe.t_Maybe) (dtb_u_u161 : Base_dBytes.t_Cur) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = { Vuna_dIr_dModel.f_IrBinder_irBinderId = dtb_u_u157; Vuna_dIr_dModel.f_IrBinder_irBinderName = dtb_u_u158; Vuna_dIr_dModel.f_IrBinder_irBinderErased = dtb_u_u159; Vuna_dIr_dModel.f_IrBinder_irBinderTy = dtb_u_u160 }; B_dData_dPair.f_Pair_second = dtb_u_u161 })))))

# 217 "Vuna/Ir/Codec.vuna"
let v_decBinder1 = (fun (dtb_u_u162 : int) (dtb_u_u163 : Base_dBytes.t_Cur) (dtb_u_u164 : int) (dtb_u_u165 : Vuna_dIr_dModel.t_IrBName) -> ((Base_dBytes.v_thenPair ((Base_dBytes.v_decBool dtb_u_u162) dtb_u_u163)) (fun (dtb_u_u166 : bool) (dtb_u_u167 : Base_dBytes.t_Cur) -> (((((v_decBinder2 dtb_u_u162) dtb_u_u167) dtb_u_u164) dtb_u_u165) dtb_u_u166))))

# 214 "Vuna/Ir/Codec.vuna"
let v_decBinder0 = (fun (dtb_u_u168 : int) (dtb_u_u169 : Base_dBytes.t_Cur) (dtb_u_u170 : int) -> ((Base_dBytes.v_thenPair ((v_decBName dtb_u_u168) dtb_u_u169)) (fun (dtb_u_u171 : Vuna_dIr_dModel.t_IrBName) (dtb_u_u172 : Base_dBytes.t_Cur) -> ((((v_decBinder1 dtb_u_u168) dtb_u_u172) dtb_u_u170) dtb_u_u171))))

# 211 "Vuna/Ir/Codec.vuna"
let v_decBinder = (fun (dtb_u_u173 : int) (dtb_u_u174 : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair ((Base_dBytes.v_decInt dtb_u_u173) dtb_u_u174)) (fun (dtb_u_u175 : int) (dtb_u_u176 : Base_dBytes.t_Cur) -> (((v_decBinder0 dtb_u_u173) dtb_u_u176) dtb_u_u175))))

# 228 "Vuna/Ir/Codec.vuna"
let rec v_encBindersGo = (fun (dtb_u_u177 : int) (dtb_u_u178 : Vuna_dIr_dModel.t_IrBinder B_dData_dList.t_List) (dtb_u_u179 : string B_dData_dList.t_List) -> (if (dtb_u_u177 <= 0) then dtb_u_u179 else (match dtb_u_u178 with
  | B_dData_dList.C_List_Nil -> dtb_u_u179
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u180, dtb_u_u181) -> (((v_encBinder (dtb_u_u177 - 1)) dtb_u_u180) (((v_encBindersGo (dtb_u_u177 - 1)) dtb_u_u181) dtb_u_u179))
  | _ -> failwith "DT: impossible branch"
)))

# 225 "Vuna/Ir/Codec.vuna"
let v_encBinders = (fun (dtb_u_u182 : int) (dtb_u_u183 : Vuna_dIr_dModel.t_IrBinder B_dData_dList.t_List) (dtb_u_u184 : string B_dData_dList.t_List) -> (B_dData_dList.C_List__x58__x58_ ("[", (B_dData_dList.C_List__x58__x58_ ((string_of_int (Base_dBytes.v_lenOf dtb_u_u183)), (B_dData_dList.C_List__x58__x58_ (":", (((v_encBindersGo dtb_u_u182) dtb_u_u183) dtb_u_u184))))))))

# 237 "Vuna/Ir/Codec.vuna"
let v_decBinders = (fun (dtb_u_u185 : int) (dtb_u_u186 : Base_dBytes.t_Cur) -> (((Base_dBytes.v_decList v_decBinder) dtb_u_u185) dtb_u_u186))

# 409 "Vuna/Ir/Codec.vuna"
let v_encAppTy = (fun (dtb_u_u187 : int) (dtb_u_u188 : (Vuna_dIr_dModel.t_IrTy, Vuna_dIr_dModel.t_IrTy) B_dData_dPair.t_Pair B_dData_dMaybe.t_Maybe) (dtb_u_u189 : string B_dData_dList.t_List) -> (if (dtb_u_u187 <= 0) then dtb_u_u189 else (((Base_dBytes.v_encMaybe ((Base_dBytes.v_encPair (v_encIrTy (dtb_u_u187 - 1))) (v_encIrTy (dtb_u_u187 - 1)))) dtb_u_u188) dtb_u_u189)))

# 243 "Vuna/Ir/Codec.vuna"
let rec v_encAlt = (fun (dtb_u_u190 : int) (dtb_u_u191 : Vuna_dIr_dModel.t_IrAlt) (dtb_u_u192 : string B_dData_dList.t_List) -> (match dtb_u_u191 with
  | { Vuna_dIr_dModel.f_IrAlt_irAltCtor = dtb_u_u193; Vuna_dIr_dModel.f_IrAlt_irAltBinders = dtb_u_u194; Vuna_dIr_dModel.f_IrAlt_irAltBody = dtb_u_u195 } -> (((Base_dBytes.v_encMaybe ((Base_dBytes.v_encPair Base_dBytes.v_encStr) Base_dBytes.v_encStr)) dtb_u_u193) (((v_encBinders (dtb_u_u190 - 1)) dtb_u_u194) (((v_encIr (dtb_u_u190 - 1)) dtb_u_u195) dtb_u_u192)))
  | _ -> failwith "DT: impossible branch"
))
# 260 "Vuna/Ir/Codec.vuna"
and v_encAlts = (fun (dtb_u_u196 : int) (dtb_u_u197 : Vuna_dIr_dModel.t_IrAlt B_dData_dList.t_List) (dtb_u_u198 : string B_dData_dList.t_List) -> (B_dData_dList.C_List__x58__x58_ ("[", (B_dData_dList.C_List__x58__x58_ ((string_of_int (Base_dBytes.v_lenOf dtb_u_u197)), (B_dData_dList.C_List__x58__x58_ (":", (((v_encAltsGo dtb_u_u196) dtb_u_u197) dtb_u_u198))))))))
# 263 "Vuna/Ir/Codec.vuna"
and v_encAltsGo = (fun (dtb_u_u199 : int) (dtb_u_u200 : Vuna_dIr_dModel.t_IrAlt B_dData_dList.t_List) (dtb_u_u201 : string B_dData_dList.t_List) -> (if (dtb_u_u199 <= 0) then dtb_u_u201 else (match dtb_u_u200 with
  | B_dData_dList.C_List_Nil -> dtb_u_u201
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u202, dtb_u_u203) -> (((v_encAlt (dtb_u_u199 - 1)) dtb_u_u202) (((v_encAltsGo (dtb_u_u199 - 1)) dtb_u_u203) dtb_u_u201))
  | _ -> failwith "DT: impossible branch"
)))
# 290 "Vuna/Ir/Codec.vuna"
and v_encAltM = (fun (dtb_u_u204 : int) (dtb_u_u205 : Vuna_dIr_dModel.t_IrAlt B_dData_dMaybe.t_Maybe) (dtb_u_u206 : string B_dData_dList.t_List) -> (if (dtb_u_u204 <= 0) then dtb_u_u206 else (match dtb_u_u205 with
  | B_dData_dMaybe.C_Maybe_Nothing -> (B_dData_dList.C_List__x58__x58_ ("0", dtb_u_u206))
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u207) -> (B_dData_dList.C_List__x58__x58_ ("1", (((v_encAlt (dtb_u_u204 - 1)) dtb_u_u207) dtb_u_u206)))
  | _ -> failwith "DT: impossible branch"
)))
# 312 "Vuna/Ir/Codec.vuna"
and v_encFields = (fun (dtb_u_u208 : int) (dtb_u_u209 : (string, Vuna_dIr_dModel.t_Ir) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u210 : string B_dData_dList.t_List) -> (B_dData_dList.C_List__x58__x58_ ("[", (B_dData_dList.C_List__x58__x58_ ((string_of_int (Base_dBytes.v_lenOf dtb_u_u209)), (B_dData_dList.C_List__x58__x58_ (":", (((v_encFieldsGo dtb_u_u208) dtb_u_u209) dtb_u_u210))))))))
# 315 "Vuna/Ir/Codec.vuna"
and v_encFieldsGo = (fun (dtb_u_u211 : int) (dtb_u_u212 : (string, Vuna_dIr_dModel.t_Ir) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u213 : string B_dData_dList.t_List) -> (if (dtb_u_u211 <= 0) then dtb_u_u213 else (let dtb_u_u214 = dtb_u_u212 in (match dtb_u_u214 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u215, dtb_u_u216) -> (match dtb_u_u215 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u217; B_dData_dPair.f_Pair_second = dtb_u_u218 } -> ((Base_dBytes.v_encStr dtb_u_u217) (((v_encIr (dtb_u_u211 - 1)) dtb_u_u218) (((v_encFieldsGo (dtb_u_u211 - 1)) dtb_u_u216) dtb_u_u213)))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> dtb_u_u213
  | _ -> failwith "DT: impossible branch"
))))
# 346 "Vuna/Ir/Codec.vuna"
and v_encIr = (fun (dtb_u_u219 : int) (dtb_u_u220 : Vuna_dIr_dModel.t_Ir) (dtb_u_u221 : string B_dData_dList.t_List) -> (if (dtb_u_u219 <= 0) then dtb_u_u221 else (((v_encIrCases dtb_u_u219) dtb_u_u220) dtb_u_u221)))
# 349 "Vuna/Ir/Codec.vuna"
and v_encIrCases = (fun (dtb_u_u222 : int) (dtb_u_u223 : Vuna_dIr_dModel.t_Ir) (dtb_u_u224 : string B_dData_dList.t_List) -> (match dtb_u_u223 with
  | Vuna_dIr_dModel.C_Ir_IrEffBind (dtb_u_u225, dtb_u_u226, dtb_u_u227) -> ((Base_dBytes.v_encTag 22) ((Base_dBytes.v_encStr dtb_u_u225) ((Base_dBytes.v_encStr dtb_u_u226) (((v_encIrTy (dtb_u_u222 - 1)) dtb_u_u227) dtb_u_u224))))
  | Vuna_dIr_dModel.C_Ir_IrEffThunk (dtb_u_u228, dtb_u_u229, dtb_u_u230, dtb_u_u231, dtb_u_u232) -> ((Base_dBytes.v_encTag 21) ((Base_dBytes.v_encStr dtb_u_u228) ((Base_dBytes.v_encStr dtb_u_u229) (((v_encIrTy (dtb_u_u222 - 1)) dtb_u_u230) ((Base_dBytes.v_encInt dtb_u_u231) (((v_encIr (dtb_u_u222 - 1)) dtb_u_u232) dtb_u_u224))))))
  | Vuna_dIr_dModel.C_Ir_IrConcatMany (dtb_u_u233) -> ((Base_dBytes.v_encTag 20) (((v_encIrs (dtb_u_u222 - 1)) dtb_u_u233) dtb_u_u224))
  | Vuna_dIr_dModel.C_Ir_IrNatCase (dtb_u_u234, dtb_u_u235, dtb_u_u236, dtb_u_u237, dtb_u_u238) -> ((Base_dBytes.v_encTag 19) (((v_encIr (dtb_u_u222 - 1)) dtb_u_u234) ((Base_dBytes.v_encInt dtb_u_u235) (((v_encAltM (dtb_u_u222 - 1)) dtb_u_u236) (((v_encAltM (dtb_u_u222 - 1)) dtb_u_u237) (((v_encAltM (dtb_u_u222 - 1)) dtb_u_u238) dtb_u_u224))))))
  | Vuna_dIr_dModel.C_Ir_IrCase (dtb_u_u239, dtb_u_u240, dtb_u_u241, dtb_u_u242) -> ((Base_dBytes.v_encTag 18) (((v_encIrTyM (dtb_u_u222 - 1)) dtb_u_u239) (((v_encIrTyM (dtb_u_u222 - 1)) dtb_u_u240) (((v_encIr (dtb_u_u222 - 1)) dtb_u_u241) (((v_encAlts (dtb_u_u222 - 1)) dtb_u_u242) dtb_u_u224)))))
  | Vuna_dIr_dModel.C_Ir_IrIf (dtb_u_u243, dtb_u_u244, dtb_u_u245) -> ((Base_dBytes.v_encTag 17) (((v_encIr (dtb_u_u222 - 1)) dtb_u_u243) (((v_encIr (dtb_u_u222 - 1)) dtb_u_u244) (((v_encIr (dtb_u_u222 - 1)) dtb_u_u245) dtb_u_u224))))
  | Vuna_dIr_dModel.C_Ir_IrTail (dtb_u_u246) -> ((Base_dBytes.v_encTag 16) (((v_encIr (dtb_u_u222 - 1)) dtb_u_u246) dtb_u_u224))
  | Vuna_dIr_dModel.C_Ir_IrApp (dtb_u_u247, dtb_u_u248, dtb_u_u249) -> ((Base_dBytes.v_encTag 15) (((v_encAppTy (dtb_u_u222 - 1)) dtb_u_u247) (((v_encIr (dtb_u_u222 - 1)) dtb_u_u248) (((v_encIr (dtb_u_u222 - 1)) dtb_u_u249) dtb_u_u224))))
  | Vuna_dIr_dModel.C_Ir_IrLam (dtb_u_u250, dtb_u_u251, dtb_u_u252) -> ((Base_dBytes.v_encTag 14) (((v_encBinders (dtb_u_u222 - 1)) dtb_u_u250) (((v_encIrTyM (dtb_u_u222 - 1)) dtb_u_u251) (((v_encIr (dtb_u_u222 - 1)) dtb_u_u252) dtb_u_u224))))
  | Vuna_dIr_dModel.C_Ir_IrLet (dtb_u_u253, dtb_u_u254, dtb_u_u255) -> ((Base_dBytes.v_encTag 13) (((v_encBinders (dtb_u_u222 - 1)) dtb_u_u253) (((v_encIr (dtb_u_u222 - 1)) dtb_u_u254) (((v_encIr (dtb_u_u222 - 1)) dtb_u_u255) dtb_u_u224))))
  | Vuna_dIr_dModel.C_Ir_IrFloatLit (dtb_u_u256) -> ((Base_dBytes.v_encTag 12) ((Base_dBytes.v_encStr dtb_u_u256) dtb_u_u224))
  | Vuna_dIr_dModel.C_Ir_IrBool (dtb_u_u257) -> ((Base_dBytes.v_encTag 11) ((Base_dBytes.v_encBool dtb_u_u257) dtb_u_u224))
  | Vuna_dIr_dModel.C_Ir_IrStr (dtb_u_u258) -> ((Base_dBytes.v_encTag 10) ((Base_dBytes.v_encStr dtb_u_u258) dtb_u_u224))
  | Vuna_dIr_dModel.C_Ir_IrInt (dtb_u_u259) -> ((Base_dBytes.v_encTag 9) ((Base_dBytes.v_encInt dtb_u_u259) dtb_u_u224))
  | Vuna_dIr_dModel.C_Ir_IrCast (dtb_u_u260, dtb_u_u261, dtb_u_u262) -> ((Base_dBytes.v_encTag 8) (((v_encIrTyM (dtb_u_u222 - 1)) dtb_u_u260) (((v_encIrTyM (dtb_u_u222 - 1)) dtb_u_u261) (((v_encIr (dtb_u_u222 - 1)) dtb_u_u262) dtb_u_u224))))
  | Vuna_dIr_dModel.C_Ir_IrRtApp (dtb_u_u263, dtb_u_u264) -> ((Base_dBytes.v_encTag 7) ((Base_dBytes.v_encStr dtb_u_u263) (((v_encIrs (dtb_u_u222 - 1)) dtb_u_u264) dtb_u_u224)))
  | Vuna_dIr_dModel.C_Ir_IrRt (dtb_u_u265) -> ((Base_dBytes.v_encTag 6) ((Base_dBytes.v_encStr dtb_u_u265) dtb_u_u224))
  | Vuna_dIr_dModel.C_Ir_IrRecUpd (dtb_u_u266, dtb_u_u267, dtb_u_u268, dtb_u_u269) -> ((Base_dBytes.v_encTag 5) (((v_encIr (dtb_u_u222 - 1)) dtb_u_u266) ((Base_dBytes.v_encStr dtb_u_u267) (((v_encFields (dtb_u_u222 - 1)) dtb_u_u268) (((v_encIrTyM (dtb_u_u222 - 1)) dtb_u_u269) dtb_u_u224)))))
  | Vuna_dIr_dModel.C_Ir_IrProj (dtb_u_u270, dtb_u_u271, dtb_u_u272, dtb_u_u273) -> ((Base_dBytes.v_encTag 4) (((v_encIr (dtb_u_u222 - 1)) dtb_u_u270) ((Base_dBytes.v_encStr dtb_u_u271) ((Base_dBytes.v_encStr dtb_u_u272) (((v_encIrTyM (dtb_u_u222 - 1)) dtb_u_u273) dtb_u_u224)))))
  | Vuna_dIr_dModel.C_Ir_IrRecord (dtb_u_u274, dtb_u_u275, dtb_u_u276) -> ((Base_dBytes.v_encTag 3) ((Base_dBytes.v_encStr dtb_u_u274) (((v_encIrTyM (dtb_u_u222 - 1)) dtb_u_u275) (((v_encFields (dtb_u_u222 - 1)) dtb_u_u276) dtb_u_u224))))
  | Vuna_dIr_dModel.C_Ir_IrCtor (dtb_u_u277, dtb_u_u278, dtb_u_u279, dtb_u_u280) -> ((Base_dBytes.v_encTag 2) ((Base_dBytes.v_encStr dtb_u_u277) ((Base_dBytes.v_encStr dtb_u_u278) (((Base_dBytes.v_encMaybe (v_encIrTys (dtb_u_u222 - 1))) dtb_u_u279) (((v_encIrs (dtb_u_u222 - 1)) dtb_u_u280) dtb_u_u224)))))
  | Vuna_dIr_dModel.C_Ir_IrGlobal (dtb_u_u281) -> ((Base_dBytes.v_encTag 1) ((Base_dBytes.v_encStr dtb_u_u281) dtb_u_u224))
  | Vuna_dIr_dModel.C_Ir_IrVar (dtb_u_u282) -> ((Base_dBytes.v_encTag 0) (((v_encBinder (dtb_u_u222 - 1)) dtb_u_u282) dtb_u_u224))
  | _ -> failwith "DT: impossible branch"
))
# 397 "Vuna/Ir/Codec.vuna"
and v_encIrs = (fun (dtb_u_u283 : int) (dtb_u_u284 : Vuna_dIr_dModel.t_Ir B_dData_dList.t_List) (dtb_u_u285 : string B_dData_dList.t_List) -> (B_dData_dList.C_List__x58__x58_ ("[", (B_dData_dList.C_List__x58__x58_ ((string_of_int (Base_dBytes.v_lenOf dtb_u_u284)), (B_dData_dList.C_List__x58__x58_ (":", (((v_encIrsGo dtb_u_u283) dtb_u_u284) dtb_u_u285))))))))
# 400 "Vuna/Ir/Codec.vuna"
and v_encIrsGo = (fun (dtb_u_u286 : int) (dtb_u_u287 : Vuna_dIr_dModel.t_Ir B_dData_dList.t_List) (dtb_u_u288 : string B_dData_dList.t_List) -> (if (dtb_u_u286 <= 0) then dtb_u_u288 else (match dtb_u_u287 with
  | B_dData_dList.C_List_Nil -> dtb_u_u288
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u289, dtb_u_u290) -> (((v_encIr (dtb_u_u286 - 1)) dtb_u_u289) (((v_encIrsGo (dtb_u_u286 - 1)) dtb_u_u290) dtb_u_u288))
  | _ -> failwith "DT: impossible branch"
)))

# 449 "Vuna/Ir/Codec.vuna"
let v_decIrVar = (fun (dtb_u_u291 : int) (dtb_u_u292 : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair ((v_decBinder dtb_u_u291) dtb_u_u292)) (fun (dtb_u_u293 : Vuna_dIr_dModel.t_IrBinder) (dtb_u_u294 : Base_dBytes.t_Cur) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Vuna_dIr_dModel.C_Ir_IrVar (dtb_u_u293)); B_dData_dPair.f_Pair_second = dtb_u_u294 })))))

# 452 "Vuna/Ir/Codec.vuna"
let v_decIrGlobal = (fun (dtb_u_u295 : int) (dtb_u_u296 : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair ((Base_dBytes.v_decStr dtb_u_u295) dtb_u_u296)) (fun (dtb_u_u297 : string) (dtb_u_u298 : Base_dBytes.t_Cur) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Vuna_dIr_dModel.C_Ir_IrGlobal (dtb_u_u297)); B_dData_dPair.f_Pair_second = dtb_u_u298 })))))

# 490 "Vuna/Ir/Codec.vuna"
let v_decIrProj3 = (fun (dtb_u_u299 : int) (dtb_u_u300 : Base_dBytes.t_Cur) (dtb_u_u301 : Vuna_dIr_dModel.t_Ir) (dtb_u_u302 : string) (dtb_u_u303 : string) -> ((Base_dBytes.v_thenPair ((v_decIrTyM dtb_u_u299) dtb_u_u300)) (fun (dtb_u_u304 : Vuna_dIr_dModel.t_IrTy B_dData_dMaybe.t_Maybe) (dtb_u_u305 : Base_dBytes.t_Cur) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Vuna_dIr_dModel.C_Ir_IrProj (dtb_u_u301, dtb_u_u302, dtb_u_u303, dtb_u_u304)); B_dData_dPair.f_Pair_second = dtb_u_u305 })))))

# 486 "Vuna/Ir/Codec.vuna"
let v_decIrProj2 = (fun (dtb_u_u306 : int) (dtb_u_u307 : Base_dBytes.t_Cur) (dtb_u_u308 : Vuna_dIr_dModel.t_Ir) (dtb_u_u309 : string) -> ((Base_dBytes.v_thenPair ((Base_dBytes.v_decStr dtb_u_u306) dtb_u_u307)) (fun (dtb_u_u310 : string) (dtb_u_u311 : Base_dBytes.t_Cur) -> (((((v_decIrProj3 dtb_u_u306) dtb_u_u311) dtb_u_u308) dtb_u_u309) dtb_u_u310))))

# 483 "Vuna/Ir/Codec.vuna"
let v_decIrProj1 = (fun (dtb_u_u312 : int) (dtb_u_u313 : Base_dBytes.t_Cur) (dtb_u_u314 : Vuna_dIr_dModel.t_Ir) -> ((Base_dBytes.v_thenPair ((Base_dBytes.v_decStr dtb_u_u312) dtb_u_u313)) (fun (dtb_u_u315 : string) (dtb_u_u316 : Base_dBytes.t_Cur) -> ((((v_decIrProj2 dtb_u_u312) dtb_u_u316) dtb_u_u314) dtb_u_u315))))

# 504 "Vuna/Ir/Codec.vuna"
let v_decIrRecUpd3 = (fun (dtb_u_u317 : int) (dtb_u_u318 : Base_dBytes.t_Cur) (dtb_u_u319 : Vuna_dIr_dModel.t_Ir) (dtb_u_u320 : string) (dtb_u_u321 : (string, Vuna_dIr_dModel.t_Ir) B_dData_dPair.t_Pair B_dData_dList.t_List) -> ((Base_dBytes.v_thenPair ((v_decIrTyM dtb_u_u317) dtb_u_u318)) (fun (dtb_u_u322 : Vuna_dIr_dModel.t_IrTy B_dData_dMaybe.t_Maybe) (dtb_u_u323 : Base_dBytes.t_Cur) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Vuna_dIr_dModel.C_Ir_IrRecUpd (dtb_u_u319, dtb_u_u320, dtb_u_u321, dtb_u_u322)); B_dData_dPair.f_Pair_second = dtb_u_u323 })))))

# 508 "Vuna/Ir/Codec.vuna"
let v_decIrRt = (fun (dtb_u_u324 : int) (dtb_u_u325 : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair ((Base_dBytes.v_decStr dtb_u_u324) dtb_u_u325)) (fun (dtb_u_u326 : string) (dtb_u_u327 : Base_dBytes.t_Cur) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Vuna_dIr_dModel.C_Ir_IrRt (dtb_u_u326)); B_dData_dPair.f_Pair_second = dtb_u_u327 })))))

# 527 "Vuna/Ir/Codec.vuna"
let v_decIrInt = (fun (dtb_u_u328 : int) (dtb_u_u329 : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair ((Base_dBytes.v_decInt dtb_u_u328) dtb_u_u329)) (fun (dtb_u_u330 : int) (dtb_u_u331 : Base_dBytes.t_Cur) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Vuna_dIr_dModel.C_Ir_IrInt (dtb_u_u330)); B_dData_dPair.f_Pair_second = dtb_u_u331 })))))

# 530 "Vuna/Ir/Codec.vuna"
let v_decIrStr = (fun (dtb_u_u332 : int) (dtb_u_u333 : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair ((Base_dBytes.v_decStr dtb_u_u332) dtb_u_u333)) (fun (dtb_u_u334 : string) (dtb_u_u335 : Base_dBytes.t_Cur) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Vuna_dIr_dModel.C_Ir_IrStr (dtb_u_u334)); B_dData_dPair.f_Pair_second = dtb_u_u335 })))))

# 533 "Vuna/Ir/Codec.vuna"
let v_decIrBool = (fun (dtb_u_u336 : int) (dtb_u_u337 : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair ((Base_dBytes.v_decBool dtb_u_u336) dtb_u_u337)) (fun (dtb_u_u338 : bool) (dtb_u_u339 : Base_dBytes.t_Cur) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Vuna_dIr_dModel.C_Ir_IrBool (dtb_u_u338)); B_dData_dPair.f_Pair_second = dtb_u_u339 })))))

# 536 "Vuna/Ir/Codec.vuna"
let v_decIrFloat = (fun (dtb_u_u340 : int) (dtb_u_u341 : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair ((Base_dBytes.v_decStr dtb_u_u340) dtb_u_u341)) (fun (dtb_u_u342 : string) (dtb_u_u343 : Base_dBytes.t_Cur) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Vuna_dIr_dModel.C_Ir_IrFloatLit (dtb_u_u342)); B_dData_dPair.f_Pair_second = dtb_u_u343 })))))

# 643 "Vuna/Ir/Codec.vuna"
let v_decIrEffBind2 = (fun (dtb_u_u344 : int) (dtb_u_u345 : Base_dBytes.t_Cur) (dtb_u_u346 : string) (dtb_u_u347 : string) -> ((Base_dBytes.v_thenPair ((v_decIrTy dtb_u_u344) dtb_u_u345)) (fun (dtb_u_u348 : Vuna_dIr_dModel.t_IrTy) (dtb_u_u349 : Base_dBytes.t_Cur) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Vuna_dIr_dModel.C_Ir_IrEffBind (dtb_u_u346, dtb_u_u347, dtb_u_u348)); B_dData_dPair.f_Pair_second = dtb_u_u349 })))))

# 639 "Vuna/Ir/Codec.vuna"
let v_decIrEffBind1 = (fun (dtb_u_u350 : int) (dtb_u_u351 : Base_dBytes.t_Cur) (dtb_u_u352 : string) -> ((Base_dBytes.v_thenPair ((Base_dBytes.v_decStr dtb_u_u350) dtb_u_u351)) (fun (dtb_u_u353 : string) (dtb_u_u354 : Base_dBytes.t_Cur) -> ((((v_decIrEffBind2 dtb_u_u350) dtb_u_u354) dtb_u_u352) dtb_u_u353))))

# 636 "Vuna/Ir/Codec.vuna"
let v_decIrEffBind = (fun (dtb_u_u355 : int) (dtb_u_u356 : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair ((Base_dBytes.v_decStr dtb_u_u355) dtb_u_u356)) (fun (dtb_u_u357 : string) (dtb_u_u358 : Base_dBytes.t_Cur) -> (((v_decIrEffBind1 dtb_u_u355) dtb_u_u358) dtb_u_u357))))

# 250 "Vuna/Ir/Codec.vuna"
let rec v_decAlt = (fun (dtb_u_u359 : int) (dtb_u_u360 : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair (((Base_dBytes.v_decMaybe ((Base_dBytes.v_decPair Base_dBytes.v_decStr) Base_dBytes.v_decStr)) dtb_u_u359) dtb_u_u360)) (fun (dtb_u_u361 : (string, string) B_dData_dPair.t_Pair B_dData_dMaybe.t_Maybe) (dtb_u_u362 : Base_dBytes.t_Cur) -> (((v_decAlt1 dtb_u_u359) dtb_u_u362) dtb_u_u361))))
# 254 "Vuna/Ir/Codec.vuna"
and v_decAlt1 = (fun (dtb_u_u363 : int) (dtb_u_u364 : Base_dBytes.t_Cur) (dtb_u_u365 : (string, string) B_dData_dPair.t_Pair B_dData_dMaybe.t_Maybe) -> ((Base_dBytes.v_thenPair ((v_decBinders dtb_u_u363) dtb_u_u364)) (fun (dtb_u_u366 : Vuna_dIr_dModel.t_IrBinder B_dData_dList.t_List) (dtb_u_u367 : Base_dBytes.t_Cur) -> ((((v_decAlt2 dtb_u_u363) dtb_u_u367) dtb_u_u365) dtb_u_u366))))
# 257 "Vuna/Ir/Codec.vuna"
and v_decAlt2 = (fun (dtb_u_u368 : int) (dtb_u_u369 : Base_dBytes.t_Cur) (dtb_u_u370 : (string, string) B_dData_dPair.t_Pair B_dData_dMaybe.t_Maybe) (dtb_u_u371 : Vuna_dIr_dModel.t_IrBinder B_dData_dList.t_List) -> ((Base_dBytes.v_thenPair ((v_decIr dtb_u_u368) dtb_u_u369)) (fun (dtb_u_u372 : Vuna_dIr_dModel.t_Ir) (dtb_u_u373 : Base_dBytes.t_Cur) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = { Vuna_dIr_dModel.f_IrAlt_irAltCtor = dtb_u_u370; Vuna_dIr_dModel.f_IrAlt_irAltBinders = dtb_u_u371; Vuna_dIr_dModel.f_IrAlt_irAltBody = dtb_u_u372 }; B_dData_dPair.f_Pair_second = dtb_u_u373 })))))
# 272 "Vuna/Ir/Codec.vuna"
and v_decAlts = (fun (dtb_u_u374 : int) (dtb_u_u375 : Base_dBytes.t_Cur) -> (if (dtb_u_u374 <= 0) then B_dData_dMaybe.C_Maybe_Nothing else (let dtb_u_u376 = (Base_dBytes.v_curChar dtb_u_u375) in (match dtb_u_u376 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u377) -> (if (dtb_u_u377 = 91) then ((Base_dBytes.v_thenPair ((Base_dBytes.v_decListHead (dtb_u_u374 - 1)) dtb_u_u375)) (fun (dtb_u_u378 : int) (dtb_u_u379 : Base_dBytes.t_Cur) -> ((((v_decAltsGo dtb_u_u378) (dtb_u_u374 - 1)) dtb_u_u379) B_dData_dList.C_List_Nil))) else B_dData_dMaybe.C_Maybe_Nothing)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
))))
# 281 "Vuna/Ir/Codec.vuna"
and v_decAltsGo = (fun (dtb_u_u380 : int) (dtb_u_u381 : int) (dtb_u_u382 : Base_dBytes.t_Cur) (dtb_u_u383 : Vuna_dIr_dModel.t_IrAlt B_dData_dList.t_List) -> (if (dtb_u_u380 <= 0) then (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (B_dData_dList.v_reverse dtb_u_u383); B_dData_dPair.f_Pair_second = dtb_u_u382 })) else (if (dtb_u_u381 <= 0) then B_dData_dMaybe.C_Maybe_Nothing else ((Base_dBytes.v_thenPair ((v_decAlt dtb_u_u381) dtb_u_u382)) (fun (dtb_u_u384 : Vuna_dIr_dModel.t_IrAlt) (dtb_u_u385 : Base_dBytes.t_Cur) -> ((((v_decAltsGo (dtb_u_u380 - 1)) (dtb_u_u381 - 1)) dtb_u_u385) (B_dData_dList.C_List__x58__x58_ (dtb_u_u384, dtb_u_u383))))))))
# 299 "Vuna/Ir/Codec.vuna"
and v_decAltM = (fun (dtb_u_u386 : int) (dtb_u_u387 : Base_dBytes.t_Cur) -> (if (dtb_u_u386 <= 0) then B_dData_dMaybe.C_Maybe_Nothing else (let dtb_u_u388 = (Base_dBytes.v_curChar dtb_u_u387) in (match dtb_u_u388 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u389) -> (if (dtb_u_u389 = 48) then (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = B_dData_dMaybe.C_Maybe_Nothing; B_dData_dPair.f_Pair_second = (Base_dBytes.v_curSkip dtb_u_u387) })) else (if (dtb_u_u389 = 49) then ((Base_dBytes.v_thenPair ((v_decAlt (dtb_u_u386 - 1)) (Base_dBytes.v_curSkip dtb_u_u387))) (fun (dtb_u_u390 : Vuna_dIr_dModel.t_IrAlt) (dtb_u_u391 : Base_dBytes.t_Cur) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (B_dData_dMaybe.C_Maybe_Just (dtb_u_u390)); B_dData_dPair.f_Pair_second = dtb_u_u391 })))) else B_dData_dMaybe.C_Maybe_Nothing))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
))))
# 324 "Vuna/Ir/Codec.vuna"
and v_decFields = (fun (dtb_u_u392 : int) (dtb_u_u393 : Base_dBytes.t_Cur) -> (if (dtb_u_u392 <= 0) then B_dData_dMaybe.C_Maybe_Nothing else (let dtb_u_u394 = (Base_dBytes.v_curChar dtb_u_u393) in (match dtb_u_u394 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u395) -> (if (dtb_u_u395 = 91) then ((Base_dBytes.v_thenPair ((Base_dBytes.v_decListHead (dtb_u_u392 - 1)) dtb_u_u393)) (fun (dtb_u_u396 : int) (dtb_u_u397 : Base_dBytes.t_Cur) -> ((((v_decFieldsGo dtb_u_u396) (dtb_u_u392 - 1)) dtb_u_u397) B_dData_dList.C_List_Nil))) else B_dData_dMaybe.C_Maybe_Nothing)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
))))
# 333 "Vuna/Ir/Codec.vuna"
and v_decFieldsGo = (fun (dtb_u_u398 : int) (dtb_u_u399 : int) (dtb_u_u400 : Base_dBytes.t_Cur) (dtb_u_u401 : (string, Vuna_dIr_dModel.t_Ir) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (if (dtb_u_u398 <= 0) then (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (B_dData_dList.v_reverse dtb_u_u401); B_dData_dPair.f_Pair_second = dtb_u_u400 })) else (if (dtb_u_u399 <= 0) then B_dData_dMaybe.C_Maybe_Nothing else ((Base_dBytes.v_thenPair ((v_decField dtb_u_u399) dtb_u_u400)) (fun (dtb_u_u402 : (string, Vuna_dIr_dModel.t_Ir) B_dData_dPair.t_Pair) (dtb_u_u403 : Base_dBytes.t_Cur) -> ((((v_decFieldsGo (dtb_u_u398 - 1)) (dtb_u_u399 - 1)) dtb_u_u403) (B_dData_dList.C_List__x58__x58_ (dtb_u_u402, dtb_u_u401))))))))
# 342 "Vuna/Ir/Codec.vuna"
and v_decField = (fun (dtb_u_u404 : int) (dtb_u_u405 : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair ((Base_dBytes.v_decStr dtb_u_u404) dtb_u_u405)) (fun (dtb_u_u406 : string) (dtb_u_u407 : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair ((v_decIr dtb_u_u404) dtb_u_u407)) (fun (dtb_u_u408 : Vuna_dIr_dModel.t_Ir) (dtb_u_u409 : Base_dBytes.t_Cur) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = { B_dData_dPair.f_Pair_first = dtb_u_u406; B_dData_dPair.f_Pair_second = dtb_u_u408 }; B_dData_dPair.f_Pair_second = dtb_u_u409 })))))))
# 416 "Vuna/Ir/Codec.vuna"
and v_decIr = (fun (dtb_u_u410 : int) (dtb_u_u411 : Base_dBytes.t_Cur) -> (if (dtb_u_u410 <= 0) then B_dData_dMaybe.C_Maybe_Nothing else ((Base_dBytes.v_thenPair ((Base_dBytes.v_decTag dtb_u_u410) dtb_u_u411)) (fun (dtb_u_u412 : int) (dtb_u_u413 : Base_dBytes.t_Cur) -> (((v_decIrTag dtb_u_u412) (dtb_u_u410 - 1)) dtb_u_u413)))))
# 423 "Vuna/Ir/Codec.vuna"
and v_decIrTag = (fun (dtb_u_u414 : int) (dtb_u_u415 : int) (dtb_u_u416 : Base_dBytes.t_Cur) -> (if (dtb_u_u414 = 0) then ((v_decIrVar dtb_u_u415) dtb_u_u416) else (if (dtb_u_u414 = 1) then ((v_decIrGlobal dtb_u_u415) dtb_u_u416) else (if (dtb_u_u414 = 2) then ((v_decIrCtor dtb_u_u415) dtb_u_u416) else (if (dtb_u_u414 = 3) then ((v_decIrRecord dtb_u_u415) dtb_u_u416) else (if (dtb_u_u414 = 4) then ((v_decIrProj dtb_u_u415) dtb_u_u416) else (if (dtb_u_u414 = 5) then ((v_decIrRecUpd dtb_u_u415) dtb_u_u416) else (if (dtb_u_u414 = 6) then ((v_decIrRt dtb_u_u415) dtb_u_u416) else (if (dtb_u_u414 = 7) then ((v_decIrRtApp dtb_u_u415) dtb_u_u416) else (if (dtb_u_u414 = 8) then ((v_decIrCast dtb_u_u415) dtb_u_u416) else (if (dtb_u_u414 = 9) then ((v_decIrInt dtb_u_u415) dtb_u_u416) else (if (dtb_u_u414 = 10) then ((v_decIrStr dtb_u_u415) dtb_u_u416) else (if (dtb_u_u414 = 11) then ((v_decIrBool dtb_u_u415) dtb_u_u416) else (if (dtb_u_u414 = 12) then ((v_decIrFloat dtb_u_u415) dtb_u_u416) else (if (dtb_u_u414 = 13) then ((v_decIrLet dtb_u_u415) dtb_u_u416) else (if (dtb_u_u414 = 14) then ((v_decIrLam dtb_u_u415) dtb_u_u416) else (if (dtb_u_u414 = 15) then ((v_decIrApp dtb_u_u415) dtb_u_u416) else (if (dtb_u_u414 = 16) then ((v_decIrTail dtb_u_u415) dtb_u_u416) else (if (dtb_u_u414 = 17) then ((v_decIrIf dtb_u_u415) dtb_u_u416) else (if (dtb_u_u414 = 18) then ((v_decIrCase dtb_u_u415) dtb_u_u416) else (if (dtb_u_u414 = 19) then ((v_decIrNatCase dtb_u_u415) dtb_u_u416) else (if (dtb_u_u414 = 20) then ((v_decIrConcat dtb_u_u415) dtb_u_u416) else (if (dtb_u_u414 = 21) then ((v_decIrEffThunk dtb_u_u415) dtb_u_u416) else (if (dtb_u_u414 = 22) then ((v_decIrEffBind dtb_u_u415) dtb_u_u416) else B_dData_dMaybe.C_Maybe_Nothing))))))))))))))))))))))))
# 455 "Vuna/Ir/Codec.vuna"
and v_decIrCtor = (fun (dtb_u_u417 : int) (dtb_u_u418 : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair ((Base_dBytes.v_decStr dtb_u_u417) dtb_u_u418)) (fun (dtb_u_u419 : string) (dtb_u_u420 : Base_dBytes.t_Cur) -> (((v_decIrCtor1 dtb_u_u417) dtb_u_u420) dtb_u_u419))))
# 458 "Vuna/Ir/Codec.vuna"
and v_decIrCtor1 = (fun (dtb_u_u421 : int) (dtb_u_u422 : Base_dBytes.t_Cur) (dtb_u_u423 : string) -> ((Base_dBytes.v_thenPair ((Base_dBytes.v_decStr dtb_u_u421) dtb_u_u422)) (fun (dtb_u_u424 : string) (dtb_u_u425 : Base_dBytes.t_Cur) -> ((((v_decIrCtor2 dtb_u_u421) dtb_u_u425) dtb_u_u423) dtb_u_u424))))
# 461 "Vuna/Ir/Codec.vuna"
and v_decIrCtor2 = (fun (dtb_u_u426 : int) (dtb_u_u427 : Base_dBytes.t_Cur) (dtb_u_u428 : string) (dtb_u_u429 : string) -> ((Base_dBytes.v_thenPair (((Base_dBytes.v_decMaybe v_decIrTys) dtb_u_u426) dtb_u_u427)) (fun (dtb_u_u430 : Vuna_dIr_dModel.t_IrTy B_dData_dList.t_List B_dData_dMaybe.t_Maybe) (dtb_u_u431 : Base_dBytes.t_Cur) -> (((((v_decIrCtor3 dtb_u_u426) dtb_u_u431) dtb_u_u428) dtb_u_u429) dtb_u_u430))))
# 465 "Vuna/Ir/Codec.vuna"
and v_decIrCtor3 = (fun (dtb_u_u432 : int) (dtb_u_u433 : Base_dBytes.t_Cur) (dtb_u_u434 : string) (dtb_u_u435 : string) (dtb_u_u436 : Vuna_dIr_dModel.t_IrTy B_dData_dList.t_List B_dData_dMaybe.t_Maybe) -> ((Base_dBytes.v_thenPair ((v_decIrs dtb_u_u432) dtb_u_u433)) (fun (dtb_u_u437 : Vuna_dIr_dModel.t_Ir B_dData_dList.t_List) (dtb_u_u438 : Base_dBytes.t_Cur) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Vuna_dIr_dModel.C_Ir_IrCtor (dtb_u_u434, dtb_u_u435, dtb_u_u436, dtb_u_u437)); B_dData_dPair.f_Pair_second = dtb_u_u438 })))))
# 469 "Vuna/Ir/Codec.vuna"
and v_decIrRecord = (fun (dtb_u_u439 : int) (dtb_u_u440 : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair ((Base_dBytes.v_decStr dtb_u_u439) dtb_u_u440)) (fun (dtb_u_u441 : string) (dtb_u_u442 : Base_dBytes.t_Cur) -> (((v_decIrRecord1 dtb_u_u439) dtb_u_u442) dtb_u_u441))))
# 472 "Vuna/Ir/Codec.vuna"
and v_decIrRecord1 = (fun (dtb_u_u443 : int) (dtb_u_u444 : Base_dBytes.t_Cur) (dtb_u_u445 : string) -> ((Base_dBytes.v_thenPair ((v_decIrTyM dtb_u_u443) dtb_u_u444)) (fun (dtb_u_u446 : Vuna_dIr_dModel.t_IrTy B_dData_dMaybe.t_Maybe) (dtb_u_u447 : Base_dBytes.t_Cur) -> ((((v_decIrRecord2 dtb_u_u443) dtb_u_u447) dtb_u_u445) dtb_u_u446))))
# 476 "Vuna/Ir/Codec.vuna"
and v_decIrRecord2 = (fun (dtb_u_u448 : int) (dtb_u_u449 : Base_dBytes.t_Cur) (dtb_u_u450 : string) (dtb_u_u451 : Vuna_dIr_dModel.t_IrTy B_dData_dMaybe.t_Maybe) -> ((Base_dBytes.v_thenPair ((v_decFields dtb_u_u448) dtb_u_u449)) (fun (dtb_u_u452 : (string, Vuna_dIr_dModel.t_Ir) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u453 : Base_dBytes.t_Cur) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Vuna_dIr_dModel.C_Ir_IrRecord (dtb_u_u450, dtb_u_u451, dtb_u_u452)); B_dData_dPair.f_Pair_second = dtb_u_u453 })))))
# 480 "Vuna/Ir/Codec.vuna"
and v_decIrProj = (fun (dtb_u_u454 : int) (dtb_u_u455 : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair ((v_decIr dtb_u_u454) dtb_u_u455)) (fun (dtb_u_u456 : Vuna_dIr_dModel.t_Ir) (dtb_u_u457 : Base_dBytes.t_Cur) -> (((v_decIrProj1 dtb_u_u454) dtb_u_u457) dtb_u_u456))))
# 494 "Vuna/Ir/Codec.vuna"
and v_decIrRecUpd = (fun (dtb_u_u458 : int) (dtb_u_u459 : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair ((v_decIr dtb_u_u458) dtb_u_u459)) (fun (dtb_u_u460 : Vuna_dIr_dModel.t_Ir) (dtb_u_u461 : Base_dBytes.t_Cur) -> (((v_decIrRecUpd1 dtb_u_u458) dtb_u_u461) dtb_u_u460))))
# 497 "Vuna/Ir/Codec.vuna"
and v_decIrRecUpd1 = (fun (dtb_u_u462 : int) (dtb_u_u463 : Base_dBytes.t_Cur) (dtb_u_u464 : Vuna_dIr_dModel.t_Ir) -> ((Base_dBytes.v_thenPair ((Base_dBytes.v_decStr dtb_u_u462) dtb_u_u463)) (fun (dtb_u_u465 : string) (dtb_u_u466 : Base_dBytes.t_Cur) -> ((((v_decIrRecUpd2 dtb_u_u462) dtb_u_u466) dtb_u_u464) dtb_u_u465))))
# 500 "Vuna/Ir/Codec.vuna"
and v_decIrRecUpd2 = (fun (dtb_u_u467 : int) (dtb_u_u468 : Base_dBytes.t_Cur) (dtb_u_u469 : Vuna_dIr_dModel.t_Ir) (dtb_u_u470 : string) -> ((Base_dBytes.v_thenPair ((v_decFields dtb_u_u467) dtb_u_u468)) (fun (dtb_u_u471 : (string, Vuna_dIr_dModel.t_Ir) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u472 : Base_dBytes.t_Cur) -> (((((v_decIrRecUpd3 dtb_u_u467) dtb_u_u472) dtb_u_u469) dtb_u_u470) dtb_u_u471))))
# 511 "Vuna/Ir/Codec.vuna"
and v_decIrRtApp = (fun (dtb_u_u473 : int) (dtb_u_u474 : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair ((Base_dBytes.v_decStr dtb_u_u473) dtb_u_u474)) (fun (dtb_u_u475 : string) (dtb_u_u476 : Base_dBytes.t_Cur) -> (((v_decIrRtApp1 dtb_u_u473) dtb_u_u476) dtb_u_u475))))
# 514 "Vuna/Ir/Codec.vuna"
and v_decIrRtApp1 = (fun (dtb_u_u477 : int) (dtb_u_u478 : Base_dBytes.t_Cur) (dtb_u_u479 : string) -> ((Base_dBytes.v_thenPair ((v_decIrs dtb_u_u477) dtb_u_u478)) (fun (dtb_u_u480 : Vuna_dIr_dModel.t_Ir B_dData_dList.t_List) (dtb_u_u481 : Base_dBytes.t_Cur) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Vuna_dIr_dModel.C_Ir_IrRtApp (dtb_u_u479, dtb_u_u480)); B_dData_dPair.f_Pair_second = dtb_u_u481 })))))
# 517 "Vuna/Ir/Codec.vuna"
and v_decIrCast = (fun (dtb_u_u482 : int) (dtb_u_u483 : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair ((v_decIrTyM dtb_u_u482) dtb_u_u483)) (fun (dtb_u_u484 : Vuna_dIr_dModel.t_IrTy B_dData_dMaybe.t_Maybe) (dtb_u_u485 : Base_dBytes.t_Cur) -> (((v_decIrCast1 dtb_u_u482) dtb_u_u485) dtb_u_u484))))
# 520 "Vuna/Ir/Codec.vuna"
and v_decIrCast1 = (fun (dtb_u_u486 : int) (dtb_u_u487 : Base_dBytes.t_Cur) (dtb_u_u488 : Vuna_dIr_dModel.t_IrTy B_dData_dMaybe.t_Maybe) -> ((Base_dBytes.v_thenPair ((v_decIrTyM dtb_u_u486) dtb_u_u487)) (fun (dtb_u_u489 : Vuna_dIr_dModel.t_IrTy B_dData_dMaybe.t_Maybe) (dtb_u_u490 : Base_dBytes.t_Cur) -> ((((v_decIrCast2 dtb_u_u486) dtb_u_u490) dtb_u_u488) dtb_u_u489))))
# 523 "Vuna/Ir/Codec.vuna"
and v_decIrCast2 = (fun (dtb_u_u491 : int) (dtb_u_u492 : Base_dBytes.t_Cur) (dtb_u_u493 : Vuna_dIr_dModel.t_IrTy B_dData_dMaybe.t_Maybe) (dtb_u_u494 : Vuna_dIr_dModel.t_IrTy B_dData_dMaybe.t_Maybe) -> ((Base_dBytes.v_thenPair ((v_decIr dtb_u_u491) dtb_u_u492)) (fun (dtb_u_u495 : Vuna_dIr_dModel.t_Ir) (dtb_u_u496 : Base_dBytes.t_Cur) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Vuna_dIr_dModel.C_Ir_IrCast (dtb_u_u493, dtb_u_u494, dtb_u_u495)); B_dData_dPair.f_Pair_second = dtb_u_u496 })))))
# 539 "Vuna/Ir/Codec.vuna"
and v_decIrLet = (fun (dtb_u_u497 : int) (dtb_u_u498 : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair ((v_decBinders dtb_u_u497) dtb_u_u498)) (fun (dtb_u_u499 : Vuna_dIr_dModel.t_IrBinder B_dData_dList.t_List) (dtb_u_u500 : Base_dBytes.t_Cur) -> (((v_decIrLet1 dtb_u_u497) dtb_u_u500) dtb_u_u499))))
# 542 "Vuna/Ir/Codec.vuna"
and v_decIrLet1 = (fun (dtb_u_u501 : int) (dtb_u_u502 : Base_dBytes.t_Cur) (dtb_u_u503 : Vuna_dIr_dModel.t_IrBinder B_dData_dList.t_List) -> ((Base_dBytes.v_thenPair ((v_decIr dtb_u_u501) dtb_u_u502)) (fun (dtb_u_u504 : Vuna_dIr_dModel.t_Ir) (dtb_u_u505 : Base_dBytes.t_Cur) -> ((((v_decIrLet2 dtb_u_u501) dtb_u_u505) dtb_u_u503) dtb_u_u504))))
# 545 "Vuna/Ir/Codec.vuna"
and v_decIrLet2 = (fun (dtb_u_u506 : int) (dtb_u_u507 : Base_dBytes.t_Cur) (dtb_u_u508 : Vuna_dIr_dModel.t_IrBinder B_dData_dList.t_List) (dtb_u_u509 : Vuna_dIr_dModel.t_Ir) -> ((Base_dBytes.v_thenPair ((v_decIr dtb_u_u506) dtb_u_u507)) (fun (dtb_u_u510 : Vuna_dIr_dModel.t_Ir) (dtb_u_u511 : Base_dBytes.t_Cur) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Vuna_dIr_dModel.C_Ir_IrLet (dtb_u_u508, dtb_u_u509, dtb_u_u510)); B_dData_dPair.f_Pair_second = dtb_u_u511 })))))
# 548 "Vuna/Ir/Codec.vuna"
and v_decIrLam = (fun (dtb_u_u512 : int) (dtb_u_u513 : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair ((v_decBinders dtb_u_u512) dtb_u_u513)) (fun (dtb_u_u514 : Vuna_dIr_dModel.t_IrBinder B_dData_dList.t_List) (dtb_u_u515 : Base_dBytes.t_Cur) -> (((v_decIrLam1 dtb_u_u512) dtb_u_u515) dtb_u_u514))))
# 551 "Vuna/Ir/Codec.vuna"
and v_decIrLam1 = (fun (dtb_u_u516 : int) (dtb_u_u517 : Base_dBytes.t_Cur) (dtb_u_u518 : Vuna_dIr_dModel.t_IrBinder B_dData_dList.t_List) -> ((Base_dBytes.v_thenPair ((v_decIrTyM dtb_u_u516) dtb_u_u517)) (fun (dtb_u_u519 : Vuna_dIr_dModel.t_IrTy B_dData_dMaybe.t_Maybe) (dtb_u_u520 : Base_dBytes.t_Cur) -> ((((v_decIrLam2 dtb_u_u516) dtb_u_u520) dtb_u_u518) dtb_u_u519))))
# 554 "Vuna/Ir/Codec.vuna"
and v_decIrLam2 = (fun (dtb_u_u521 : int) (dtb_u_u522 : Base_dBytes.t_Cur) (dtb_u_u523 : Vuna_dIr_dModel.t_IrBinder B_dData_dList.t_List) (dtb_u_u524 : Vuna_dIr_dModel.t_IrTy B_dData_dMaybe.t_Maybe) -> ((Base_dBytes.v_thenPair ((v_decIr dtb_u_u521) dtb_u_u522)) (fun (dtb_u_u525 : Vuna_dIr_dModel.t_Ir) (dtb_u_u526 : Base_dBytes.t_Cur) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Vuna_dIr_dModel.C_Ir_IrLam (dtb_u_u523, dtb_u_u524, dtb_u_u525)); B_dData_dPair.f_Pair_second = dtb_u_u526 })))))
# 558 "Vuna/Ir/Codec.vuna"
and v_decIrApp = (fun (dtb_u_u527 : int) (dtb_u_u528 : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair (((Base_dBytes.v_decMaybe ((Base_dBytes.v_decPair v_decIrTy) v_decIrTy)) dtb_u_u527) dtb_u_u528)) (fun (dtb_u_u529 : (Vuna_dIr_dModel.t_IrTy, Vuna_dIr_dModel.t_IrTy) B_dData_dPair.t_Pair B_dData_dMaybe.t_Maybe) (dtb_u_u530 : Base_dBytes.t_Cur) -> (((v_decIrApp1 dtb_u_u527) dtb_u_u530) dtb_u_u529))))
# 562 "Vuna/Ir/Codec.vuna"
and v_decIrApp1 = (fun (dtb_u_u531 : int) (dtb_u_u532 : Base_dBytes.t_Cur) (dtb_u_u533 : (Vuna_dIr_dModel.t_IrTy, Vuna_dIr_dModel.t_IrTy) B_dData_dPair.t_Pair B_dData_dMaybe.t_Maybe) -> ((Base_dBytes.v_thenPair ((v_decIr dtb_u_u531) dtb_u_u532)) (fun (dtb_u_u534 : Vuna_dIr_dModel.t_Ir) (dtb_u_u535 : Base_dBytes.t_Cur) -> ((((v_decIrApp2 dtb_u_u531) dtb_u_u535) dtb_u_u533) dtb_u_u534))))
# 565 "Vuna/Ir/Codec.vuna"
and v_decIrApp2 = (fun (dtb_u_u536 : int) (dtb_u_u537 : Base_dBytes.t_Cur) (dtb_u_u538 : (Vuna_dIr_dModel.t_IrTy, Vuna_dIr_dModel.t_IrTy) B_dData_dPair.t_Pair B_dData_dMaybe.t_Maybe) (dtb_u_u539 : Vuna_dIr_dModel.t_Ir) -> ((Base_dBytes.v_thenPair ((v_decIr dtb_u_u536) dtb_u_u537)) (fun (dtb_u_u540 : Vuna_dIr_dModel.t_Ir) (dtb_u_u541 : Base_dBytes.t_Cur) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Vuna_dIr_dModel.C_Ir_IrApp (dtb_u_u538, dtb_u_u539, dtb_u_u540)); B_dData_dPair.f_Pair_second = dtb_u_u541 })))))
# 568 "Vuna/Ir/Codec.vuna"
and v_decIrTail = (fun (dtb_u_u542 : int) (dtb_u_u543 : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair ((v_decIr dtb_u_u542) dtb_u_u543)) (fun (dtb_u_u544 : Vuna_dIr_dModel.t_Ir) (dtb_u_u545 : Base_dBytes.t_Cur) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Vuna_dIr_dModel.C_Ir_IrTail (dtb_u_u544)); B_dData_dPair.f_Pair_second = dtb_u_u545 })))))
# 571 "Vuna/Ir/Codec.vuna"
and v_decIrIf = (fun (dtb_u_u546 : int) (dtb_u_u547 : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair ((v_decIr dtb_u_u546) dtb_u_u547)) (fun (dtb_u_u548 : Vuna_dIr_dModel.t_Ir) (dtb_u_u549 : Base_dBytes.t_Cur) -> (((v_decIrIf1 dtb_u_u546) dtb_u_u549) dtb_u_u548))))
# 574 "Vuna/Ir/Codec.vuna"
and v_decIrIf1 = (fun (dtb_u_u550 : int) (dtb_u_u551 : Base_dBytes.t_Cur) (dtb_u_u552 : Vuna_dIr_dModel.t_Ir) -> ((Base_dBytes.v_thenPair ((v_decIr dtb_u_u550) dtb_u_u551)) (fun (dtb_u_u553 : Vuna_dIr_dModel.t_Ir) (dtb_u_u554 : Base_dBytes.t_Cur) -> ((((v_decIrIf2 dtb_u_u550) dtb_u_u554) dtb_u_u552) dtb_u_u553))))
# 577 "Vuna/Ir/Codec.vuna"
and v_decIrIf2 = (fun (dtb_u_u555 : int) (dtb_u_u556 : Base_dBytes.t_Cur) (dtb_u_u557 : Vuna_dIr_dModel.t_Ir) (dtb_u_u558 : Vuna_dIr_dModel.t_Ir) -> ((Base_dBytes.v_thenPair ((v_decIr dtb_u_u555) dtb_u_u556)) (fun (dtb_u_u559 : Vuna_dIr_dModel.t_Ir) (dtb_u_u560 : Base_dBytes.t_Cur) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Vuna_dIr_dModel.C_Ir_IrIf (dtb_u_u557, dtb_u_u558, dtb_u_u559)); B_dData_dPair.f_Pair_second = dtb_u_u560 })))))
# 580 "Vuna/Ir/Codec.vuna"
and v_decIrCase = (fun (dtb_u_u561 : int) (dtb_u_u562 : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair ((v_decIrTyM dtb_u_u561) dtb_u_u562)) (fun (dtb_u_u563 : Vuna_dIr_dModel.t_IrTy B_dData_dMaybe.t_Maybe) (dtb_u_u564 : Base_dBytes.t_Cur) -> (((v_decIrCase1 dtb_u_u561) dtb_u_u564) dtb_u_u563))))
# 583 "Vuna/Ir/Codec.vuna"
and v_decIrCase1 = (fun (dtb_u_u565 : int) (dtb_u_u566 : Base_dBytes.t_Cur) (dtb_u_u567 : Vuna_dIr_dModel.t_IrTy B_dData_dMaybe.t_Maybe) -> ((Base_dBytes.v_thenPair ((v_decIrTyM dtb_u_u565) dtb_u_u566)) (fun (dtb_u_u568 : Vuna_dIr_dModel.t_IrTy B_dData_dMaybe.t_Maybe) (dtb_u_u569 : Base_dBytes.t_Cur) -> ((((v_decIrCase2 dtb_u_u565) dtb_u_u569) dtb_u_u567) dtb_u_u568))))
# 587 "Vuna/Ir/Codec.vuna"
and v_decIrCase2 = (fun (dtb_u_u570 : int) (dtb_u_u571 : Base_dBytes.t_Cur) (dtb_u_u572 : Vuna_dIr_dModel.t_IrTy B_dData_dMaybe.t_Maybe) (dtb_u_u573 : Vuna_dIr_dModel.t_IrTy B_dData_dMaybe.t_Maybe) -> ((Base_dBytes.v_thenPair ((v_decIr dtb_u_u570) dtb_u_u571)) (fun (dtb_u_u574 : Vuna_dIr_dModel.t_Ir) (dtb_u_u575 : Base_dBytes.t_Cur) -> (((((v_decIrCase3 dtb_u_u570) dtb_u_u575) dtb_u_u572) dtb_u_u573) dtb_u_u574))))
# 591 "Vuna/Ir/Codec.vuna"
and v_decIrCase3 = (fun (dtb_u_u576 : int) (dtb_u_u577 : Base_dBytes.t_Cur) (dtb_u_u578 : Vuna_dIr_dModel.t_IrTy B_dData_dMaybe.t_Maybe) (dtb_u_u579 : Vuna_dIr_dModel.t_IrTy B_dData_dMaybe.t_Maybe) (dtb_u_u580 : Vuna_dIr_dModel.t_Ir) -> ((Base_dBytes.v_thenPair ((v_decAlts dtb_u_u576) dtb_u_u577)) (fun (dtb_u_u581 : Vuna_dIr_dModel.t_IrAlt B_dData_dList.t_List) (dtb_u_u582 : Base_dBytes.t_Cur) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Vuna_dIr_dModel.C_Ir_IrCase (dtb_u_u578, dtb_u_u579, dtb_u_u580, dtb_u_u581)); B_dData_dPair.f_Pair_second = dtb_u_u582 })))))
# 595 "Vuna/Ir/Codec.vuna"
and v_decIrNatCase = (fun (dtb_u_u583 : int) (dtb_u_u584 : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair ((v_decIr dtb_u_u583) dtb_u_u584)) (fun (dtb_u_u585 : Vuna_dIr_dModel.t_Ir) (dtb_u_u586 : Base_dBytes.t_Cur) -> (((v_decIrNatCase1 dtb_u_u583) dtb_u_u586) dtb_u_u585))))
# 598 "Vuna/Ir/Codec.vuna"
and v_decIrNatCase1 = (fun (dtb_u_u587 : int) (dtb_u_u588 : Base_dBytes.t_Cur) (dtb_u_u589 : Vuna_dIr_dModel.t_Ir) -> ((Base_dBytes.v_thenPair ((Base_dBytes.v_decInt dtb_u_u587) dtb_u_u588)) (fun (dtb_u_u590 : int) (dtb_u_u591 : Base_dBytes.t_Cur) -> ((((v_decIrNatCase2 dtb_u_u587) dtb_u_u591) dtb_u_u589) dtb_u_u590))))
# 602 "Vuna/Ir/Codec.vuna"
and v_decIrNatCase2 = (fun (dtb_u_u592 : int) (dtb_u_u593 : Base_dBytes.t_Cur) (dtb_u_u594 : Vuna_dIr_dModel.t_Ir) (dtb_u_u595 : int) -> ((Base_dBytes.v_thenPair ((v_decAltM dtb_u_u592) dtb_u_u593)) (fun (dtb_u_u596 : Vuna_dIr_dModel.t_IrAlt B_dData_dMaybe.t_Maybe) (dtb_u_u597 : Base_dBytes.t_Cur) -> (((((v_decIrNatCase3 dtb_u_u592) dtb_u_u597) dtb_u_u594) dtb_u_u595) dtb_u_u596))))
# 606 "Vuna/Ir/Codec.vuna"
and v_decIrNatCase3 = (fun (dtb_u_u598 : int) (dtb_u_u599 : Base_dBytes.t_Cur) (dtb_u_u600 : Vuna_dIr_dModel.t_Ir) (dtb_u_u601 : int) (dtb_u_u602 : Vuna_dIr_dModel.t_IrAlt B_dData_dMaybe.t_Maybe) -> ((Base_dBytes.v_thenPair ((v_decAltM dtb_u_u598) dtb_u_u599)) (fun (dtb_u_u603 : Vuna_dIr_dModel.t_IrAlt B_dData_dMaybe.t_Maybe) (dtb_u_u604 : Base_dBytes.t_Cur) -> ((((((v_decIrNatCase4 dtb_u_u598) dtb_u_u604) dtb_u_u600) dtb_u_u601) dtb_u_u602) dtb_u_u603))))
# 610 "Vuna/Ir/Codec.vuna"
and v_decIrNatCase4 = (fun (dtb_u_u605 : int) (dtb_u_u606 : Base_dBytes.t_Cur) (dtb_u_u607 : Vuna_dIr_dModel.t_Ir) (dtb_u_u608 : int) (dtb_u_u609 : Vuna_dIr_dModel.t_IrAlt B_dData_dMaybe.t_Maybe) (dtb_u_u610 : Vuna_dIr_dModel.t_IrAlt B_dData_dMaybe.t_Maybe) -> ((Base_dBytes.v_thenPair ((v_decAltM dtb_u_u605) dtb_u_u606)) (fun (dtb_u_u611 : Vuna_dIr_dModel.t_IrAlt B_dData_dMaybe.t_Maybe) (dtb_u_u612 : Base_dBytes.t_Cur) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Vuna_dIr_dModel.C_Ir_IrNatCase (dtb_u_u607, dtb_u_u608, dtb_u_u609, dtb_u_u610, dtb_u_u611)); B_dData_dPair.f_Pair_second = dtb_u_u612 })))))
# 614 "Vuna/Ir/Codec.vuna"
and v_decIrConcat = (fun (dtb_u_u613 : int) (dtb_u_u614 : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair ((v_decIrs dtb_u_u613) dtb_u_u614)) (fun (dtb_u_u615 : Vuna_dIr_dModel.t_Ir B_dData_dList.t_List) (dtb_u_u616 : Base_dBytes.t_Cur) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Vuna_dIr_dModel.C_Ir_IrConcatMany (dtb_u_u615)); B_dData_dPair.f_Pair_second = dtb_u_u616 })))))
# 617 "Vuna/Ir/Codec.vuna"
and v_decIrEffThunk = (fun (dtb_u_u617 : int) (dtb_u_u618 : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair ((Base_dBytes.v_decStr dtb_u_u617) dtb_u_u618)) (fun (dtb_u_u619 : string) (dtb_u_u620 : Base_dBytes.t_Cur) -> (((v_decIrEffThunk1 dtb_u_u617) dtb_u_u620) dtb_u_u619))))
# 620 "Vuna/Ir/Codec.vuna"
and v_decIrEffThunk1 = (fun (dtb_u_u621 : int) (dtb_u_u622 : Base_dBytes.t_Cur) (dtb_u_u623 : string) -> ((Base_dBytes.v_thenPair ((Base_dBytes.v_decStr dtb_u_u621) dtb_u_u622)) (fun (dtb_u_u624 : string) (dtb_u_u625 : Base_dBytes.t_Cur) -> ((((v_decIrEffThunk2 dtb_u_u621) dtb_u_u625) dtb_u_u623) dtb_u_u624))))
# 624 "Vuna/Ir/Codec.vuna"
and v_decIrEffThunk2 = (fun (dtb_u_u626 : int) (dtb_u_u627 : Base_dBytes.t_Cur) (dtb_u_u628 : string) (dtb_u_u629 : string) -> ((Base_dBytes.v_thenPair ((v_decIrTy dtb_u_u626) dtb_u_u627)) (fun (dtb_u_u630 : Vuna_dIr_dModel.t_IrTy) (dtb_u_u631 : Base_dBytes.t_Cur) -> (((((v_decIrEffThunk3 dtb_u_u626) dtb_u_u631) dtb_u_u628) dtb_u_u629) dtb_u_u630))))
# 628 "Vuna/Ir/Codec.vuna"
and v_decIrEffThunk3 = (fun (dtb_u_u632 : int) (dtb_u_u633 : Base_dBytes.t_Cur) (dtb_u_u634 : string) (dtb_u_u635 : string) (dtb_u_u636 : Vuna_dIr_dModel.t_IrTy) -> ((Base_dBytes.v_thenPair ((Base_dBytes.v_decInt dtb_u_u632) dtb_u_u633)) (fun (dtb_u_u637 : int) (dtb_u_u638 : Base_dBytes.t_Cur) -> ((((((v_decIrEffThunk4 dtb_u_u632) dtb_u_u638) dtb_u_u634) dtb_u_u635) dtb_u_u636) dtb_u_u637))))
# 632 "Vuna/Ir/Codec.vuna"
and v_decIrEffThunk4 = (fun (dtb_u_u639 : int) (dtb_u_u640 : Base_dBytes.t_Cur) (dtb_u_u641 : string) (dtb_u_u642 : string) (dtb_u_u643 : Vuna_dIr_dModel.t_IrTy) (dtb_u_u644 : int) -> ((Base_dBytes.v_thenPair ((v_decIr dtb_u_u639) dtb_u_u640)) (fun (dtb_u_u645 : Vuna_dIr_dModel.t_Ir) (dtb_u_u646 : Base_dBytes.t_Cur) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Vuna_dIr_dModel.C_Ir_IrEffThunk (dtb_u_u641, dtb_u_u642, dtb_u_u643, dtb_u_u644, dtb_u_u645)); B_dData_dPair.f_Pair_second = dtb_u_u646 })))))
# 647 "Vuna/Ir/Codec.vuna"
and v_decIrs = (fun (dtb_u_u647 : int) (dtb_u_u648 : Base_dBytes.t_Cur) -> (if (dtb_u_u647 <= 0) then B_dData_dMaybe.C_Maybe_Nothing else (let dtb_u_u649 = (Base_dBytes.v_curChar dtb_u_u648) in (match dtb_u_u649 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u650) -> (if (dtb_u_u650 = 91) then ((Base_dBytes.v_thenPair ((Base_dBytes.v_decListHead (dtb_u_u647 - 1)) dtb_u_u648)) (fun (dtb_u_u651 : int) (dtb_u_u652 : Base_dBytes.t_Cur) -> ((((v_decIrsGo dtb_u_u651) (dtb_u_u647 - 1)) dtb_u_u652) B_dData_dList.C_List_Nil))) else B_dData_dMaybe.C_Maybe_Nothing)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
))))
# 656 "Vuna/Ir/Codec.vuna"
and v_decIrsGo = (fun (dtb_u_u653 : int) (dtb_u_u654 : int) (dtb_u_u655 : Base_dBytes.t_Cur) (dtb_u_u656 : Vuna_dIr_dModel.t_Ir B_dData_dList.t_List) -> (if (dtb_u_u653 <= 0) then (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (B_dData_dList.v_reverse dtb_u_u656); B_dData_dPair.f_Pair_second = dtb_u_u655 })) else (if (dtb_u_u654 <= 0) then B_dData_dMaybe.C_Maybe_Nothing else ((Base_dBytes.v_thenPair ((v_decIr dtb_u_u654) dtb_u_u655)) (fun (dtb_u_u657 : Vuna_dIr_dModel.t_Ir) (dtb_u_u658 : Base_dBytes.t_Cur) -> ((((v_decIrsGo (dtb_u_u653 - 1)) (dtb_u_u654 - 1)) dtb_u_u658) (B_dData_dList.C_List__x58__x58_ (dtb_u_u657, dtb_u_u656))))))))

# 668 "Vuna/Ir/Codec.vuna"
let v_encTyDecl = (fun (dtb_u_u659 : int) (dtb_u_u660 : Vuna_dIr_dModel.t_IrTyDecl) (dtb_u_u661 : string B_dData_dList.t_List) -> (if (dtb_u_u659 <= 0) then dtb_u_u661 else (match dtb_u_u660 with
  | Vuna_dIr_dModel.C_IrTyDecl_IrVariantDecl (dtb_u_u662, dtb_u_u663, dtb_u_u664) -> ((Base_dBytes.v_encTag 0) ((Base_dBytes.v_encStr dtb_u_u662) ((Base_dBytes.v_encInt dtb_u_u663) (((Base_dBytes.v_encList ((Base_dBytes.v_encPair Base_dBytes.v_encStr) (v_encIrTys (dtb_u_u659 - 1)))) dtb_u_u664) dtb_u_u661))))
  | Vuna_dIr_dModel.C_IrTyDecl_IrRecordDecl (dtb_u_u665, dtb_u_u666, dtb_u_u667, dtb_u_u668) -> ((Base_dBytes.v_encTag 1) ((Base_dBytes.v_encStr dtb_u_u665) ((Base_dBytes.v_encInt dtb_u_u666) (((Base_dBytes.v_encList ((Base_dBytes.v_encPair Base_dBytes.v_encInt) Base_dBytes.v_encStr)) dtb_u_u667) (((v_encIrTys (dtb_u_u659 - 1)) dtb_u_u668) dtb_u_u661)))))
  | Vuna_dIr_dModel.C_IrTyDecl_IrUnboxedDecl (dtb_u_u669, dtb_u_u670, dtb_u_u671) -> ((Base_dBytes.v_encTag 2) ((Base_dBytes.v_encStr dtb_u_u669) ((Base_dBytes.v_encInt dtb_u_u670) (((v_encIrTy (dtb_u_u659 - 1)) dtb_u_u671) dtb_u_u661))))
  | _ -> failwith "DT: impossible branch"
)))

# 698 "Vuna/Ir/Codec.vuna"
let v_decTyDeclVariant2 = (fun (dtb_u_u672 : int) (dtb_u_u673 : Base_dBytes.t_Cur) (dtb_u_u674 : string) (dtb_u_u675 : int) -> ((Base_dBytes.v_thenPair (((Base_dBytes.v_decList ((Base_dBytes.v_decPair Base_dBytes.v_decStr) v_decIrTys)) dtb_u_u672) dtb_u_u673)) (fun (dtb_u_u676 : (string, Vuna_dIr_dModel.t_IrTy B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u677 : Base_dBytes.t_Cur) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Vuna_dIr_dModel.C_IrTyDecl_IrVariantDecl (dtb_u_u674, dtb_u_u675, dtb_u_u676)); B_dData_dPair.f_Pair_second = dtb_u_u677 })))))

# 694 "Vuna/Ir/Codec.vuna"
let v_decTyDeclVariant1 = (fun (dtb_u_u678 : int) (dtb_u_u679 : Base_dBytes.t_Cur) (dtb_u_u680 : string) -> ((Base_dBytes.v_thenPair ((Base_dBytes.v_decInt dtb_u_u678) dtb_u_u679)) (fun (dtb_u_u681 : int) (dtb_u_u682 : Base_dBytes.t_Cur) -> ((((v_decTyDeclVariant2 dtb_u_u678) dtb_u_u682) dtb_u_u680) dtb_u_u681))))

# 691 "Vuna/Ir/Codec.vuna"
let v_decTyDeclVariant = (fun (dtb_u_u683 : int) (dtb_u_u684 : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair ((Base_dBytes.v_decStr dtb_u_u683) dtb_u_u684)) (fun (dtb_u_u685 : string) (dtb_u_u686 : Base_dBytes.t_Cur) -> (((v_decTyDeclVariant1 dtb_u_u683) dtb_u_u686) dtb_u_u685))))

# 717 "Vuna/Ir/Codec.vuna"
let v_decTyDeclRecord3 = (fun (dtb_u_u687 : int) (dtb_u_u688 : Base_dBytes.t_Cur) (dtb_u_u689 : string) (dtb_u_u690 : int) (dtb_u_u691 : (int, string) B_dData_dPair.t_Pair B_dData_dList.t_List) -> ((Base_dBytes.v_thenPair ((v_decIrTys dtb_u_u687) dtb_u_u688)) (fun (dtb_u_u692 : Vuna_dIr_dModel.t_IrTy B_dData_dList.t_List) (dtb_u_u693 : Base_dBytes.t_Cur) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Vuna_dIr_dModel.C_IrTyDecl_IrRecordDecl (dtb_u_u689, dtb_u_u690, dtb_u_u691, dtb_u_u692)); B_dData_dPair.f_Pair_second = dtb_u_u693 })))))

# 711 "Vuna/Ir/Codec.vuna"
let v_decTyDeclRecord2 = (fun (dtb_u_u694 : int) (dtb_u_u695 : Base_dBytes.t_Cur) (dtb_u_u696 : string) (dtb_u_u697 : int) -> ((Base_dBytes.v_thenPair (((Base_dBytes.v_decList ((Base_dBytes.v_decPair Base_dBytes.v_decInt) Base_dBytes.v_decStr)) dtb_u_u694) dtb_u_u695)) (fun (dtb_u_u698 : (int, string) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u699 : Base_dBytes.t_Cur) -> (((((v_decTyDeclRecord3 dtb_u_u694) dtb_u_u699) dtb_u_u696) dtb_u_u697) dtb_u_u698))))

# 707 "Vuna/Ir/Codec.vuna"
let v_decTyDeclRecord1 = (fun (dtb_u_u700 : int) (dtb_u_u701 : Base_dBytes.t_Cur) (dtb_u_u702 : string) -> ((Base_dBytes.v_thenPair ((Base_dBytes.v_decInt dtb_u_u700) dtb_u_u701)) (fun (dtb_u_u703 : int) (dtb_u_u704 : Base_dBytes.t_Cur) -> ((((v_decTyDeclRecord2 dtb_u_u700) dtb_u_u704) dtb_u_u702) dtb_u_u703))))

# 704 "Vuna/Ir/Codec.vuna"
let v_decTyDeclRecord = (fun (dtb_u_u705 : int) (dtb_u_u706 : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair ((Base_dBytes.v_decStr dtb_u_u705) dtb_u_u706)) (fun (dtb_u_u707 : string) (dtb_u_u708 : Base_dBytes.t_Cur) -> (((v_decTyDeclRecord1 dtb_u_u705) dtb_u_u708) dtb_u_u707))))

# 728 "Vuna/Ir/Codec.vuna"
let v_decTyDeclUnboxed2 = (fun (dtb_u_u709 : int) (dtb_u_u710 : Base_dBytes.t_Cur) (dtb_u_u711 : string) (dtb_u_u712 : int) -> ((Base_dBytes.v_thenPair ((v_decIrTy dtb_u_u709) dtb_u_u710)) (fun (dtb_u_u713 : Vuna_dIr_dModel.t_IrTy) (dtb_u_u714 : Base_dBytes.t_Cur) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Vuna_dIr_dModel.C_IrTyDecl_IrUnboxedDecl (dtb_u_u711, dtb_u_u712, dtb_u_u713)); B_dData_dPair.f_Pair_second = dtb_u_u714 })))))

# 724 "Vuna/Ir/Codec.vuna"
let v_decTyDeclUnboxed1 = (fun (dtb_u_u715 : int) (dtb_u_u716 : Base_dBytes.t_Cur) (dtb_u_u717 : string) -> ((Base_dBytes.v_thenPair ((Base_dBytes.v_decInt dtb_u_u715) dtb_u_u716)) (fun (dtb_u_u718 : int) (dtb_u_u719 : Base_dBytes.t_Cur) -> ((((v_decTyDeclUnboxed2 dtb_u_u715) dtb_u_u719) dtb_u_u717) dtb_u_u718))))

# 721 "Vuna/Ir/Codec.vuna"
let v_decTyDeclUnboxed = (fun (dtb_u_u720 : int) (dtb_u_u721 : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair ((Base_dBytes.v_decStr dtb_u_u720) dtb_u_u721)) (fun (dtb_u_u722 : string) (dtb_u_u723 : Base_dBytes.t_Cur) -> (((v_decTyDeclUnboxed1 dtb_u_u720) dtb_u_u723) dtb_u_u722))))

# 685 "Vuna/Ir/Codec.vuna"
let v_decTyDeclTag = (fun (dtb_u_u724 : int) (dtb_u_u725 : int) (dtb_u_u726 : Base_dBytes.t_Cur) -> (if (dtb_u_u724 = 0) then ((v_decTyDeclVariant dtb_u_u725) dtb_u_u726) else (if (dtb_u_u724 = 1) then ((v_decTyDeclRecord dtb_u_u725) dtb_u_u726) else (if (dtb_u_u724 = 2) then ((v_decTyDeclUnboxed dtb_u_u725) dtb_u_u726) else B_dData_dMaybe.C_Maybe_Nothing))))

# 678 "Vuna/Ir/Codec.vuna"
let v_decTyDecl = (fun (dtb_u_u727 : int) (dtb_u_u728 : Base_dBytes.t_Cur) -> (if (dtb_u_u727 <= 0) then B_dData_dMaybe.C_Maybe_Nothing else ((Base_dBytes.v_thenPair ((Base_dBytes.v_decTag dtb_u_u727) dtb_u_u728)) (fun (dtb_u_u729 : int) (dtb_u_u730 : Base_dBytes.t_Cur) -> (((v_decTyDeclTag dtb_u_u729) (dtb_u_u727 - 1)) dtb_u_u730)))))

# 735 "Vuna/Ir/Codec.vuna"
let v_encDef = (fun (dtb_u_u731 : int) (dtb_u_u732 : Vuna_dIr_dModel.t_IrDef) (dtb_u_u733 : string B_dData_dList.t_List) -> (if (dtb_u_u731 <= 0) then dtb_u_u733 else (match dtb_u_u732 with
  | Vuna_dIr_dModel.C_IrDef_IrDef (dtb_u_u734, dtb_u_u735, dtb_u_u736, dtb_u_u737, dtb_u_u738, dtb_u_u739, dtb_u_u740, dtb_u_u741) -> ((Base_dBytes.v_encTag 0) ((Base_dBytes.v_encStr dtb_u_u734) ((Base_dBytes.v_encInt dtb_u_u735) ((v_encStrs dtb_u_u736) (((v_encIrTyM (dtb_u_u731 - 1)) dtb_u_u737) (((v_encIr (dtb_u_u731 - 1)) dtb_u_u738) ((Base_dBytes.v_encBool dtb_u_u739) ((Base_dBytes.v_encBool dtb_u_u740) ((v_encSpanM dtb_u_u741) dtb_u_u733)))))))))
  | Vuna_dIr_dModel.C_IrDef_IrExternDef (dtb_u_u742, dtb_u_u743, dtb_u_u744, dtb_u_u745) -> ((Base_dBytes.v_encTag 1) ((Base_dBytes.v_encStr dtb_u_u742) (((v_encIrTy (dtb_u_u731 - 1)) dtb_u_u743) ((Base_dBytes.v_encStr dtb_u_u744) ((v_encSpanM dtb_u_u745) dtb_u_u733)))))
  | _ -> failwith "DT: impossible branch"
)))

# 784 "Vuna/Ir/Codec.vuna"
let v_decDefRec7 = (fun (dtb_u_u746 : int) (dtb_u_u747 : Base_dBytes.t_Cur) (dtb_u_u748 : string) (dtb_u_u749 : int) (dtb_u_u750 : string B_dData_dList.t_List) (dtb_u_u751 : Vuna_dIr_dModel.t_IrTy B_dData_dMaybe.t_Maybe) (dtb_u_u752 : Vuna_dIr_dModel.t_Ir) (dtb_u_u753 : bool) (dtb_u_u754 : bool) -> ((Base_dBytes.v_thenPair ((v_decSpanM dtb_u_u746) dtb_u_u747)) (fun (dtb_u_u755 : Base_dSource.t_Span B_dData_dMaybe.t_Maybe) (dtb_u_u756 : Base_dBytes.t_Cur) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Vuna_dIr_dModel.C_IrDef_IrDef (dtb_u_u748, dtb_u_u749, dtb_u_u750, dtb_u_u751, dtb_u_u752, dtb_u_u753, dtb_u_u754, dtb_u_u755)); B_dData_dPair.f_Pair_second = dtb_u_u756 })))))

# 778 "Vuna/Ir/Codec.vuna"
let v_decDefRec6 = (fun (dtb_u_u757 : int) (dtb_u_u758 : Base_dBytes.t_Cur) (dtb_u_u759 : string) (dtb_u_u760 : int) (dtb_u_u761 : string B_dData_dList.t_List) (dtb_u_u762 : Vuna_dIr_dModel.t_IrTy B_dData_dMaybe.t_Maybe) (dtb_u_u763 : Vuna_dIr_dModel.t_Ir) (dtb_u_u764 : bool) -> ((Base_dBytes.v_thenPair ((Base_dBytes.v_decBool dtb_u_u757) dtb_u_u758)) (fun (dtb_u_u765 : bool) (dtb_u_u766 : Base_dBytes.t_Cur) -> (((((((((v_decDefRec7 dtb_u_u757) dtb_u_u766) dtb_u_u759) dtb_u_u760) dtb_u_u761) dtb_u_u762) dtb_u_u763) dtb_u_u764) dtb_u_u765))))

# 774 "Vuna/Ir/Codec.vuna"
let v_decDefRec5 = (fun (dtb_u_u767 : int) (dtb_u_u768 : Base_dBytes.t_Cur) (dtb_u_u769 : string) (dtb_u_u770 : int) (dtb_u_u771 : string B_dData_dList.t_List) (dtb_u_u772 : Vuna_dIr_dModel.t_IrTy B_dData_dMaybe.t_Maybe) (dtb_u_u773 : Vuna_dIr_dModel.t_Ir) -> ((Base_dBytes.v_thenPair ((Base_dBytes.v_decBool dtb_u_u767) dtb_u_u768)) (fun (dtb_u_u774 : bool) (dtb_u_u775 : Base_dBytes.t_Cur) -> ((((((((v_decDefRec6 dtb_u_u767) dtb_u_u775) dtb_u_u769) dtb_u_u770) dtb_u_u771) dtb_u_u772) dtb_u_u773) dtb_u_u774))))

# 770 "Vuna/Ir/Codec.vuna"
let v_decDefRec4 = (fun (dtb_u_u776 : int) (dtb_u_u777 : Base_dBytes.t_Cur) (dtb_u_u778 : string) (dtb_u_u779 : int) (dtb_u_u780 : string B_dData_dList.t_List) (dtb_u_u781 : Vuna_dIr_dModel.t_IrTy B_dData_dMaybe.t_Maybe) -> ((Base_dBytes.v_thenPair ((v_decIr dtb_u_u776) dtb_u_u777)) (fun (dtb_u_u782 : Vuna_dIr_dModel.t_Ir) (dtb_u_u783 : Base_dBytes.t_Cur) -> (((((((v_decDefRec5 dtb_u_u776) dtb_u_u783) dtb_u_u778) dtb_u_u779) dtb_u_u780) dtb_u_u781) dtb_u_u782))))

# 766 "Vuna/Ir/Codec.vuna"
let v_decDefRec3 = (fun (dtb_u_u784 : int) (dtb_u_u785 : Base_dBytes.t_Cur) (dtb_u_u786 : string) (dtb_u_u787 : int) (dtb_u_u788 : string B_dData_dList.t_List) -> ((Base_dBytes.v_thenPair ((v_decIrTyM dtb_u_u784) dtb_u_u785)) (fun (dtb_u_u789 : Vuna_dIr_dModel.t_IrTy B_dData_dMaybe.t_Maybe) (dtb_u_u790 : Base_dBytes.t_Cur) -> ((((((v_decDefRec4 dtb_u_u784) dtb_u_u790) dtb_u_u786) dtb_u_u787) dtb_u_u788) dtb_u_u789))))

# 762 "Vuna/Ir/Codec.vuna"
let v_decDefRec2 = (fun (dtb_u_u791 : int) (dtb_u_u792 : Base_dBytes.t_Cur) (dtb_u_u793 : string) (dtb_u_u794 : int) -> ((Base_dBytes.v_thenPair ((v_decStrs dtb_u_u791) dtb_u_u792)) (fun (dtb_u_u795 : string B_dData_dList.t_List) (dtb_u_u796 : Base_dBytes.t_Cur) -> (((((v_decDefRec3 dtb_u_u791) dtb_u_u796) dtb_u_u793) dtb_u_u794) dtb_u_u795))))

# 759 "Vuna/Ir/Codec.vuna"
let v_decDefRec1 = (fun (dtb_u_u797 : int) (dtb_u_u798 : Base_dBytes.t_Cur) (dtb_u_u799 : string) -> ((Base_dBytes.v_thenPair ((Base_dBytes.v_decInt dtb_u_u797) dtb_u_u798)) (fun (dtb_u_u800 : int) (dtb_u_u801 : Base_dBytes.t_Cur) -> ((((v_decDefRec2 dtb_u_u797) dtb_u_u801) dtb_u_u799) dtb_u_u800))))

# 756 "Vuna/Ir/Codec.vuna"
let v_decDefRec = (fun (dtb_u_u802 : int) (dtb_u_u803 : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair ((Base_dBytes.v_decStr dtb_u_u802) dtb_u_u803)) (fun (dtb_u_u804 : string) (dtb_u_u805 : Base_dBytes.t_Cur) -> (((v_decDefRec1 dtb_u_u802) dtb_u_u805) dtb_u_u804))))

# 800 "Vuna/Ir/Codec.vuna"
let v_decDefExtern3 = (fun (dtb_u_u806 : int) (dtb_u_u807 : Base_dBytes.t_Cur) (dtb_u_u808 : string) (dtb_u_u809 : Vuna_dIr_dModel.t_IrTy) (dtb_u_u810 : string) -> ((Base_dBytes.v_thenPair ((v_decSpanM dtb_u_u806) dtb_u_u807)) (fun (dtb_u_u811 : Base_dSource.t_Span B_dData_dMaybe.t_Maybe) (dtb_u_u812 : Base_dBytes.t_Cur) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Vuna_dIr_dModel.C_IrDef_IrExternDef (dtb_u_u808, dtb_u_u809, dtb_u_u810, dtb_u_u811)); B_dData_dPair.f_Pair_second = dtb_u_u812 })))))

# 796 "Vuna/Ir/Codec.vuna"
let v_decDefExtern2 = (fun (dtb_u_u813 : int) (dtb_u_u814 : Base_dBytes.t_Cur) (dtb_u_u815 : string) (dtb_u_u816 : Vuna_dIr_dModel.t_IrTy) -> ((Base_dBytes.v_thenPair ((Base_dBytes.v_decStr dtb_u_u813) dtb_u_u814)) (fun (dtb_u_u817 : string) (dtb_u_u818 : Base_dBytes.t_Cur) -> (((((v_decDefExtern3 dtb_u_u813) dtb_u_u818) dtb_u_u815) dtb_u_u816) dtb_u_u817))))

# 793 "Vuna/Ir/Codec.vuna"
let v_decDefExtern1 = (fun (dtb_u_u819 : int) (dtb_u_u820 : Base_dBytes.t_Cur) (dtb_u_u821 : string) -> ((Base_dBytes.v_thenPair ((v_decIrTy dtb_u_u819) dtb_u_u820)) (fun (dtb_u_u822 : Vuna_dIr_dModel.t_IrTy) (dtb_u_u823 : Base_dBytes.t_Cur) -> ((((v_decDefExtern2 dtb_u_u819) dtb_u_u823) dtb_u_u821) dtb_u_u822))))

# 790 "Vuna/Ir/Codec.vuna"
let v_decDefExtern = (fun (dtb_u_u824 : int) (dtb_u_u825 : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair ((Base_dBytes.v_decStr dtb_u_u824) dtb_u_u825)) (fun (dtb_u_u826 : string) (dtb_u_u827 : Base_dBytes.t_Cur) -> (((v_decDefExtern1 dtb_u_u824) dtb_u_u827) dtb_u_u826))))

# 751 "Vuna/Ir/Codec.vuna"
let v_decDefTag = (fun (dtb_u_u828 : int) (dtb_u_u829 : int) (dtb_u_u830 : Base_dBytes.t_Cur) -> (if (dtb_u_u828 = 0) then ((v_decDefRec dtb_u_u829) dtb_u_u830) else (if (dtb_u_u828 = 1) then ((v_decDefExtern dtb_u_u829) dtb_u_u830) else B_dData_dMaybe.C_Maybe_Nothing)))

# 744 "Vuna/Ir/Codec.vuna"
let v_decDef = (fun (dtb_u_u831 : int) (dtb_u_u832 : Base_dBytes.t_Cur) -> (if (dtb_u_u831 <= 0) then B_dData_dMaybe.C_Maybe_Nothing else ((Base_dBytes.v_thenPair ((Base_dBytes.v_decTag dtb_u_u831) dtb_u_u832)) (fun (dtb_u_u833 : int) (dtb_u_u834 : Base_dBytes.t_Cur) -> (((v_decDefTag dtb_u_u833) (dtb_u_u831 - 1)) dtb_u_u834)))))

# 804 "Vuna/Ir/Codec.vuna"
let v_encGroup = (fun (dtb_u_u835 : int) (dtb_u_u836 : Vuna_dIr_dModel.t_IrGroup) (dtb_u_u837 : string B_dData_dList.t_List) -> (match dtb_u_u836 with
  | { Vuna_dIr_dModel.f_IrGroup_irGroupIsRec = dtb_u_u838; Vuna_dIr_dModel.f_IrGroup_irGroupDefs = dtb_u_u839 } -> ((Base_dBytes.v_encBool dtb_u_u838) (((Base_dBytes.v_encList (v_encDef (dtb_u_u835 - 1))) dtb_u_u839) dtb_u_u837))
  | _ -> failwith "DT: impossible branch"
))

# 810 "Vuna/Ir/Codec.vuna"
let v_decGroup1 = (fun (dtb_u_u840 : int) (dtb_u_u841 : Base_dBytes.t_Cur) (dtb_u_u842 : bool) -> ((Base_dBytes.v_thenPair (((Base_dBytes.v_decList v_decDef) dtb_u_u840) dtb_u_u841)) (fun (dtb_u_u843 : Vuna_dIr_dModel.t_IrDef B_dData_dList.t_List) (dtb_u_u844 : Base_dBytes.t_Cur) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = { Vuna_dIr_dModel.f_IrGroup_irGroupIsRec = dtb_u_u842; Vuna_dIr_dModel.f_IrGroup_irGroupDefs = dtb_u_u843 }; B_dData_dPair.f_Pair_second = dtb_u_u844 })))))

# 807 "Vuna/Ir/Codec.vuna"
let v_decGroup = (fun (dtb_u_u845 : int) (dtb_u_u846 : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair ((Base_dBytes.v_decBool dtb_u_u845) dtb_u_u846)) (fun (dtb_u_u847 : bool) (dtb_u_u848 : Base_dBytes.t_Cur) -> (((v_decGroup1 dtb_u_u845) dtb_u_u848) dtb_u_u847))))

# 817 "Vuna/Ir/Codec.vuna"
let v_encEntry = (fun (dtb_u_u849 : int) (dtb_u_u850 : Vuna_dIr_dModel.t_IrEntry) (dtb_u_u851 : string B_dData_dList.t_List) -> (((v_encIr (dtb_u_u849 - 1)) (dtb_u_u850).Vuna_dIr_dModel.f_IrEntry_irEntryShow) ((Base_dBytes.v_encStr (dtb_u_u850).Vuna_dIr_dModel.f_IrEntry_irEntryMain) ((Base_dBytes.v_encBool (dtb_u_u850).Vuna_dIr_dModel.f_IrEntry_irEntryIsAction) (((Base_dBytes.v_encMaybe Base_dBytes.v_encStr) (dtb_u_u850).Vuna_dIr_dModel.f_IrEntry_irEntryRunMain) ((v_encStrs (dtb_u_u850).Vuna_dIr_dModel.f_IrEntry_irEntryHandlers) ((v_encStrs (dtb_u_u850).Vuna_dIr_dModel.f_IrEntry_irEntryRowTags) dtb_u_u851)))))))

# 846 "Vuna/Ir/Codec.vuna"
let v_decEntry5 = (fun (dtb_u_u852 : int) (dtb_u_u853 : Base_dBytes.t_Cur) (dtb_u_u854 : Vuna_dIr_dModel.t_Ir) (dtb_u_u855 : string) (dtb_u_u856 : bool) (dtb_u_u857 : string B_dData_dMaybe.t_Maybe) (dtb_u_u858 : string B_dData_dList.t_List) -> ((Base_dBytes.v_thenPair ((v_decStrs dtb_u_u852) dtb_u_u853)) (fun (dtb_u_u859 : string B_dData_dList.t_List) (dtb_u_u860 : Base_dBytes.t_Cur) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = { Vuna_dIr_dModel.f_IrEntry_irEntryShow = dtb_u_u854; Vuna_dIr_dModel.f_IrEntry_irEntryMain = dtb_u_u855; Vuna_dIr_dModel.f_IrEntry_irEntryIsAction = dtb_u_u856; Vuna_dIr_dModel.f_IrEntry_irEntryRunMain = dtb_u_u857; Vuna_dIr_dModel.f_IrEntry_irEntryHandlers = dtb_u_u858; Vuna_dIr_dModel.f_IrEntry_irEntryRowTags = dtb_u_u859 }; B_dData_dPair.f_Pair_second = dtb_u_u860 })))))

# 840 "Vuna/Ir/Codec.vuna"
let v_decEntry4 = (fun (dtb_u_u861 : int) (dtb_u_u862 : Base_dBytes.t_Cur) (dtb_u_u863 : Vuna_dIr_dModel.t_Ir) (dtb_u_u864 : string) (dtb_u_u865 : bool) (dtb_u_u866 : string B_dData_dMaybe.t_Maybe) -> ((Base_dBytes.v_thenPair ((v_decStrs dtb_u_u861) dtb_u_u862)) (fun (dtb_u_u867 : string B_dData_dList.t_List) (dtb_u_u868 : Base_dBytes.t_Cur) -> (((((((v_decEntry5 dtb_u_u861) dtb_u_u868) dtb_u_u863) dtb_u_u864) dtb_u_u865) dtb_u_u866) dtb_u_u867))))

# 834 "Vuna/Ir/Codec.vuna"
let v_decEntry3 = (fun (dtb_u_u869 : int) (dtb_u_u870 : Base_dBytes.t_Cur) (dtb_u_u871 : Vuna_dIr_dModel.t_Ir) (dtb_u_u872 : string) (dtb_u_u873 : bool) -> ((Base_dBytes.v_thenPair (((Base_dBytes.v_decMaybe Base_dBytes.v_decStr) dtb_u_u869) dtb_u_u870)) (fun (dtb_u_u874 : string B_dData_dMaybe.t_Maybe) (dtb_u_u875 : Base_dBytes.t_Cur) -> ((((((v_decEntry4 dtb_u_u869) dtb_u_u875) dtb_u_u871) dtb_u_u872) dtb_u_u873) dtb_u_u874))))

# 830 "Vuna/Ir/Codec.vuna"
let v_decEntry2 = (fun (dtb_u_u876 : int) (dtb_u_u877 : Base_dBytes.t_Cur) (dtb_u_u878 : Vuna_dIr_dModel.t_Ir) (dtb_u_u879 : string) -> ((Base_dBytes.v_thenPair ((Base_dBytes.v_decBool dtb_u_u876) dtb_u_u877)) (fun (dtb_u_u880 : bool) (dtb_u_u881 : Base_dBytes.t_Cur) -> (((((v_decEntry3 dtb_u_u876) dtb_u_u881) dtb_u_u878) dtb_u_u879) dtb_u_u880))))

# 827 "Vuna/Ir/Codec.vuna"
let v_decEntry1 = (fun (dtb_u_u882 : int) (dtb_u_u883 : Base_dBytes.t_Cur) (dtb_u_u884 : Vuna_dIr_dModel.t_Ir) -> ((Base_dBytes.v_thenPair ((Base_dBytes.v_decStr dtb_u_u882) dtb_u_u883)) (fun (dtb_u_u885 : string) (dtb_u_u886 : Base_dBytes.t_Cur) -> ((((v_decEntry2 dtb_u_u882) dtb_u_u886) dtb_u_u884) dtb_u_u885))))

# 824 "Vuna/Ir/Codec.vuna"
let v_decEntry = (fun (dtb_u_u887 : int) (dtb_u_u888 : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair ((v_decIr dtb_u_u887) dtb_u_u888)) (fun (dtb_u_u889 : Vuna_dIr_dModel.t_Ir) (dtb_u_u890 : Base_dBytes.t_Cur) -> (((v_decEntry1 dtb_u_u887) dtb_u_u890) dtb_u_u889))))

# 855 "Vuna/Ir/Codec.vuna"
let v_encListFam = (fun (dtb_u_u891 : Vuna_dIr_dModel.t_IrListFam) (dtb_u_u892 : string B_dData_dList.t_List) -> (match dtb_u_u891 with
  | { Vuna_dIr_dModel.f_IrListFam_irListFamily = dtb_u_u893; Vuna_dIr_dModel.f_IrListFam_irListNil = dtb_u_u894; Vuna_dIr_dModel.f_IrListFam_irListCons = dtb_u_u895 } -> ((Base_dBytes.v_encStr dtb_u_u893) ((Base_dBytes.v_encStr dtb_u_u894) ((Base_dBytes.v_encStr dtb_u_u895) dtb_u_u892)))
  | _ -> failwith "DT: impossible branch"
))

# 864 "Vuna/Ir/Codec.vuna"
let v_decListFam2 = (fun (dtb_u_u896 : int) (dtb_u_u897 : Base_dBytes.t_Cur) (dtb_u_u898 : string) (dtb_u_u899 : string) -> ((Base_dBytes.v_thenPair ((Base_dBytes.v_decStr dtb_u_u896) dtb_u_u897)) (fun (dtb_u_u900 : string) (dtb_u_u901 : Base_dBytes.t_Cur) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = { Vuna_dIr_dModel.f_IrListFam_irListFamily = dtb_u_u898; Vuna_dIr_dModel.f_IrListFam_irListNil = dtb_u_u899; Vuna_dIr_dModel.f_IrListFam_irListCons = dtb_u_u900 }; B_dData_dPair.f_Pair_second = dtb_u_u901 })))))

# 861 "Vuna/Ir/Codec.vuna"
let v_decListFam1 = (fun (dtb_u_u902 : int) (dtb_u_u903 : Base_dBytes.t_Cur) (dtb_u_u904 : string) -> ((Base_dBytes.v_thenPair ((Base_dBytes.v_decStr dtb_u_u902) dtb_u_u903)) (fun (dtb_u_u905 : string) (dtb_u_u906 : Base_dBytes.t_Cur) -> ((((v_decListFam2 dtb_u_u902) dtb_u_u906) dtb_u_u904) dtb_u_u905))))

# 858 "Vuna/Ir/Codec.vuna"
let v_decListFam = (fun (dtb_u_u907 : int) (dtb_u_u908 : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair ((Base_dBytes.v_decStr dtb_u_u907) dtb_u_u908)) (fun (dtb_u_u909 : string) (dtb_u_u910 : Base_dBytes.t_Cur) -> (((v_decListFam1 dtb_u_u907) dtb_u_u910) dtb_u_u909))))

# 869 "Vuna/Ir/Codec.vuna"
let v_decFieldOrder = (fun (dtb_u_u911 : int) (dtb_u_u912 : Base_dBytes.t_Cur) -> (((Base_dBytes.v_decList ((Base_dBytes.v_decPair Base_dBytes.v_decInt) Base_dBytes.v_decStr)) dtb_u_u911) dtb_u_u912))

# 873 "Vuna/Ir/Codec.vuna"
let v_decNamedInt = (fun (dtb_u_u913 : int) (dtb_u_u914 : Base_dBytes.t_Cur) -> (((Base_dBytes.v_decList ((Base_dBytes.v_decPair Base_dBytes.v_decStr) ((Base_dBytes.v_decPair Base_dBytes.v_decStr) Base_dBytes.v_decInt))) dtb_u_u913) dtb_u_u914))

# 877 "Vuna/Ir/Codec.vuna"
let v_decCtorShapes = (fun (dtb_u_u915 : int) (dtb_u_u916 : Base_dBytes.t_Cur) -> (((Base_dBytes.v_decList ((Base_dBytes.v_decPair Base_dBytes.v_decStr) ((Base_dBytes.v_decPair Base_dBytes.v_decStr) v_decBools))) dtb_u_u915) dtb_u_u916))

# 880 "Vuna/Ir/Codec.vuna"
let v_encShared = (fun (dtb_u_u917 : Vuna_dIr_dModel.t_IrShared) (dtb_u_u918 : string B_dData_dList.t_List) -> (((Base_dBytes.v_encList ((Base_dBytes.v_encPair Base_dBytes.v_encStr) (Base_dBytes.v_encList ((Base_dBytes.v_encPair Base_dBytes.v_encInt) Base_dBytes.v_encStr)))) (dtb_u_u917).Vuna_dIr_dModel.f_IrShared_irSharedRecordFields) (((Base_dBytes.v_encMaybe v_encListFam) (dtb_u_u917).Vuna_dIr_dModel.f_IrShared_irSharedListFam) ((Base_dBytes.v_encBool (dtb_u_u917).Vuna_dIr_dModel.f_IrShared_irSharedUsesFloat) ((Base_dBytes.v_encBool (dtb_u_u917).Vuna_dIr_dModel.f_IrShared_irSharedUsesTrace) ((Base_dBytes.v_encBool (dtb_u_u917).Vuna_dIr_dModel.f_IrShared_irSharedUsesObs) (((Base_dBytes.v_encList ((Base_dBytes.v_encPair Base_dBytes.v_encStr) ((Base_dBytes.v_encPair Base_dBytes.v_encStr) Base_dBytes.v_encInt))) (dtb_u_u917).Vuna_dIr_dModel.f_IrShared_irSharedDefLocs) (((Base_dBytes.v_encList ((Base_dBytes.v_encPair Base_dBytes.v_encStr) ((Base_dBytes.v_encPair Base_dBytes.v_encStr) Base_dBytes.v_encInt))) (dtb_u_u917).Vuna_dIr_dModel.f_IrShared_irSharedUnboxed) (((Base_dBytes.v_encList ((Base_dBytes.v_encPair Base_dBytes.v_encStr) ((Base_dBytes.v_encPair Base_dBytes.v_encStr) v_encBools))) (dtb_u_u917).Vuna_dIr_dModel.f_IrShared_irSharedCtorShapes) ((Base_dBytes.v_encBool (dtb_u_u917).Vuna_dIr_dModel.f_IrShared_irSharedUsesHost) ((Base_dBytes.v_encBool (dtb_u_u917).Vuna_dIr_dModel.f_IrShared_irSharedUsesSched) ((Base_dBytes.v_encBool (dtb_u_u917).Vuna_dIr_dModel.f_IrShared_irSharedUsesEff) dtb_u_u918))))))))))))

# 943 "Vuna/Ir/Codec.vuna"
let v_decShared10 = (fun (dtb_u_u919 : int) (dtb_u_u920 : Base_dBytes.t_Cur) (dtb_u_u921 : (string, (int, string) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u922 : Vuna_dIr_dModel.t_IrListFam B_dData_dMaybe.t_Maybe) (dtb_u_u923 : bool) (dtb_u_u924 : bool) (dtb_u_u925 : bool) (dtb_u_u926 : (string, (string, int) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u927 : (string, (string, int) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u928 : (string, (string, bool B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u929 : bool) (dtb_u_u930 : bool) -> ((Base_dBytes.v_thenPair ((Base_dBytes.v_decBool dtb_u_u919) dtb_u_u920)) (fun (dtb_u_u931 : bool) (dtb_u_u932 : Base_dBytes.t_Cur) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = { Vuna_dIr_dModel.f_IrShared_irSharedRecordFields = dtb_u_u921; Vuna_dIr_dModel.f_IrShared_irSharedListFam = dtb_u_u922; Vuna_dIr_dModel.f_IrShared_irSharedUsesFloat = dtb_u_u923; Vuna_dIr_dModel.f_IrShared_irSharedUsesTrace = dtb_u_u924; Vuna_dIr_dModel.f_IrShared_irSharedUsesObs = dtb_u_u925; Vuna_dIr_dModel.f_IrShared_irSharedDefLocs = dtb_u_u926; Vuna_dIr_dModel.f_IrShared_irSharedUnboxed = dtb_u_u927; Vuna_dIr_dModel.f_IrShared_irSharedCtorShapes = dtb_u_u928; Vuna_dIr_dModel.f_IrShared_irSharedUsesHost = dtb_u_u929; Vuna_dIr_dModel.f_IrShared_irSharedUsesSched = dtb_u_u930; Vuna_dIr_dModel.f_IrShared_irSharedUsesEff = dtb_u_u931 }; B_dData_dPair.f_Pair_second = dtb_u_u932 })))))

# 937 "Vuna/Ir/Codec.vuna"
let v_decShared9 = (fun (dtb_u_u933 : int) (dtb_u_u934 : Base_dBytes.t_Cur) (dtb_u_u935 : (string, (int, string) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u936 : Vuna_dIr_dModel.t_IrListFam B_dData_dMaybe.t_Maybe) (dtb_u_u937 : bool) (dtb_u_u938 : bool) (dtb_u_u939 : bool) (dtb_u_u940 : (string, (string, int) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u941 : (string, (string, int) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u942 : (string, (string, bool B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u943 : bool) -> ((Base_dBytes.v_thenPair ((Base_dBytes.v_decBool dtb_u_u933) dtb_u_u934)) (fun (dtb_u_u944 : bool) (dtb_u_u945 : Base_dBytes.t_Cur) -> ((((((((((((v_decShared10 dtb_u_u933) dtb_u_u945) dtb_u_u935) dtb_u_u936) dtb_u_u937) dtb_u_u938) dtb_u_u939) dtb_u_u940) dtb_u_u941) dtb_u_u942) dtb_u_u943) dtb_u_u944))))

# 931 "Vuna/Ir/Codec.vuna"
let v_decShared8 = (fun (dtb_u_u946 : int) (dtb_u_u947 : Base_dBytes.t_Cur) (dtb_u_u948 : (string, (int, string) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u949 : Vuna_dIr_dModel.t_IrListFam B_dData_dMaybe.t_Maybe) (dtb_u_u950 : bool) (dtb_u_u951 : bool) (dtb_u_u952 : bool) (dtb_u_u953 : (string, (string, int) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u954 : (string, (string, int) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u955 : (string, (string, bool B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) -> ((Base_dBytes.v_thenPair ((Base_dBytes.v_decBool dtb_u_u946) dtb_u_u947)) (fun (dtb_u_u956 : bool) (dtb_u_u957 : Base_dBytes.t_Cur) -> (((((((((((v_decShared9 dtb_u_u946) dtb_u_u957) dtb_u_u948) dtb_u_u949) dtb_u_u950) dtb_u_u951) dtb_u_u952) dtb_u_u953) dtb_u_u954) dtb_u_u955) dtb_u_u956))))

# 925 "Vuna/Ir/Codec.vuna"
let v_decShared7 = (fun (dtb_u_u958 : int) (dtb_u_u959 : Base_dBytes.t_Cur) (dtb_u_u960 : (string, (int, string) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u961 : Vuna_dIr_dModel.t_IrListFam B_dData_dMaybe.t_Maybe) (dtb_u_u962 : bool) (dtb_u_u963 : bool) (dtb_u_u964 : bool) (dtb_u_u965 : (string, (string, int) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u966 : (string, (string, int) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) -> ((Base_dBytes.v_thenPair ((v_decCtorShapes dtb_u_u958) dtb_u_u959)) (fun (dtb_u_u967 : (string, (string, bool B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u968 : Base_dBytes.t_Cur) -> ((((((((((v_decShared8 dtb_u_u958) dtb_u_u968) dtb_u_u960) dtb_u_u961) dtb_u_u962) dtb_u_u963) dtb_u_u964) dtb_u_u965) dtb_u_u966) dtb_u_u967))))

# 919 "Vuna/Ir/Codec.vuna"
let v_decShared6 = (fun (dtb_u_u969 : int) (dtb_u_u970 : Base_dBytes.t_Cur) (dtb_u_u971 : (string, (int, string) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u972 : Vuna_dIr_dModel.t_IrListFam B_dData_dMaybe.t_Maybe) (dtb_u_u973 : bool) (dtb_u_u974 : bool) (dtb_u_u975 : bool) (dtb_u_u976 : (string, (string, int) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) -> ((Base_dBytes.v_thenPair ((v_decNamedInt dtb_u_u969) dtb_u_u970)) (fun (dtb_u_u977 : (string, (string, int) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u978 : Base_dBytes.t_Cur) -> (((((((((v_decShared7 dtb_u_u969) dtb_u_u978) dtb_u_u971) dtb_u_u972) dtb_u_u973) dtb_u_u974) dtb_u_u975) dtb_u_u976) dtb_u_u977))))

# 913 "Vuna/Ir/Codec.vuna"
let v_decShared5 = (fun (dtb_u_u979 : int) (dtb_u_u980 : Base_dBytes.t_Cur) (dtb_u_u981 : (string, (int, string) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u982 : Vuna_dIr_dModel.t_IrListFam B_dData_dMaybe.t_Maybe) (dtb_u_u983 : bool) (dtb_u_u984 : bool) (dtb_u_u985 : bool) -> ((Base_dBytes.v_thenPair ((v_decNamedInt dtb_u_u979) dtb_u_u980)) (fun (dtb_u_u986 : (string, (string, int) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u987 : Base_dBytes.t_Cur) -> ((((((((v_decShared6 dtb_u_u979) dtb_u_u987) dtb_u_u981) dtb_u_u982) dtb_u_u983) dtb_u_u984) dtb_u_u985) dtb_u_u986))))

# 907 "Vuna/Ir/Codec.vuna"
let v_decShared4 = (fun (dtb_u_u988 : int) (dtb_u_u989 : Base_dBytes.t_Cur) (dtb_u_u990 : (string, (int, string) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u991 : Vuna_dIr_dModel.t_IrListFam B_dData_dMaybe.t_Maybe) (dtb_u_u992 : bool) (dtb_u_u993 : bool) -> ((Base_dBytes.v_thenPair ((Base_dBytes.v_decBool dtb_u_u988) dtb_u_u989)) (fun (dtb_u_u994 : bool) (dtb_u_u995 : Base_dBytes.t_Cur) -> (((((((v_decShared5 dtb_u_u988) dtb_u_u995) dtb_u_u990) dtb_u_u991) dtb_u_u992) dtb_u_u993) dtb_u_u994))))

# 901 "Vuna/Ir/Codec.vuna"
let v_decShared3 = (fun (dtb_u_u996 : int) (dtb_u_u997 : Base_dBytes.t_Cur) (dtb_u_u998 : (string, (int, string) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u999 : Vuna_dIr_dModel.t_IrListFam B_dData_dMaybe.t_Maybe) (dtb_u_u1000 : bool) -> ((Base_dBytes.v_thenPair ((Base_dBytes.v_decBool dtb_u_u996) dtb_u_u997)) (fun (dtb_u_u1001 : bool) (dtb_u_u1002 : Base_dBytes.t_Cur) -> ((((((v_decShared4 dtb_u_u996) dtb_u_u1002) dtb_u_u998) dtb_u_u999) dtb_u_u1000) dtb_u_u1001))))

# 897 "Vuna/Ir/Codec.vuna"
let v_decShared2 = (fun (dtb_u_u1003 : int) (dtb_u_u1004 : Base_dBytes.t_Cur) (dtb_u_u1005 : (string, (int, string) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u1006 : Vuna_dIr_dModel.t_IrListFam B_dData_dMaybe.t_Maybe) -> ((Base_dBytes.v_thenPair ((Base_dBytes.v_decBool dtb_u_u1003) dtb_u_u1004)) (fun (dtb_u_u1007 : bool) (dtb_u_u1008 : Base_dBytes.t_Cur) -> (((((v_decShared3 dtb_u_u1003) dtb_u_u1008) dtb_u_u1005) dtb_u_u1006) dtb_u_u1007))))

# 893 "Vuna/Ir/Codec.vuna"
let v_decShared1 = (fun (dtb_u_u1009 : int) (dtb_u_u1010 : Base_dBytes.t_Cur) (dtb_u_u1011 : (string, (int, string) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) -> ((Base_dBytes.v_thenPair (((Base_dBytes.v_decMaybe v_decListFam) dtb_u_u1009) dtb_u_u1010)) (fun (dtb_u_u1012 : Vuna_dIr_dModel.t_IrListFam B_dData_dMaybe.t_Maybe) (dtb_u_u1013 : Base_dBytes.t_Cur) -> ((((v_decShared2 dtb_u_u1009) dtb_u_u1013) dtb_u_u1011) dtb_u_u1012))))

# 887 "Vuna/Ir/Codec.vuna"
let v_decShared = (fun (dtb_u_u1014 : int) (dtb_u_u1015 : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair (((Base_dBytes.v_decList ((Base_dBytes.v_decPair Base_dBytes.v_decStr) (Base_dBytes.v_decList ((Base_dBytes.v_decPair Base_dBytes.v_decInt) Base_dBytes.v_decStr)))) dtb_u_u1014) dtb_u_u1015)) (fun (dtb_u_u1016 : (string, (int, string) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u1017 : Base_dBytes.t_Cur) -> (((v_decShared1 dtb_u_u1014) dtb_u_u1017) dtb_u_u1016))))

# 952 "Vuna/Ir/Codec.vuna"
let v_encUnit = (fun (dtb_u_u1018 : int) (dtb_u_u1019 : Vuna_dIr_dModel.t_IrUnit) (dtb_u_u1020 : string B_dData_dList.t_List) -> (if (dtb_u_u1018 <= 0) then dtb_u_u1020 else (((Base_dBytes.v_encList (v_encTyDecl (dtb_u_u1018 - 1))) (dtb_u_u1019).Vuna_dIr_dModel.f_IrUnit_irUnitTyDecls) (((Base_dBytes.v_encList (v_encGroup (dtb_u_u1018 - 1))) (dtb_u_u1019).Vuna_dIr_dModel.f_IrUnit_irUnitGroups) ((Base_dBytes.v_encBool (dtb_u_u1019).Vuna_dIr_dModel.f_IrUnit_irUnitHasListFamily) ((v_encStrs (dtb_u_u1019).Vuna_dIr_dModel.f_IrUnit_irUnitTypeRefs) (((Base_dBytes.v_encMaybe (v_encEntry (dtb_u_u1018 - 1))) (dtb_u_u1019).Vuna_dIr_dModel.f_IrUnit_irUnitEntry) dtb_u_u1020)))))))

# 981 "Vuna/Ir/Codec.vuna"
let v_decUnit4 = (fun (dtb_u_u1021 : int) (dtb_u_u1022 : Base_dBytes.t_Cur) (dtb_u_u1023 : Vuna_dIr_dModel.t_IrTyDecl B_dData_dList.t_List) (dtb_u_u1024 : Vuna_dIr_dModel.t_IrGroup B_dData_dList.t_List) (dtb_u_u1025 : bool) (dtb_u_u1026 : string B_dData_dList.t_List) -> ((Base_dBytes.v_thenPair (((Base_dBytes.v_decMaybe v_decEntry) dtb_u_u1021) dtb_u_u1022)) (fun (dtb_u_u1027 : Vuna_dIr_dModel.t_IrEntry B_dData_dMaybe.t_Maybe) (dtb_u_u1028 : Base_dBytes.t_Cur) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = { Vuna_dIr_dModel.f_IrUnit_irUnitTyDecls = dtb_u_u1023; Vuna_dIr_dModel.f_IrUnit_irUnitGroups = dtb_u_u1024; Vuna_dIr_dModel.f_IrUnit_irUnitHasListFamily = dtb_u_u1025; Vuna_dIr_dModel.f_IrUnit_irUnitTypeRefs = dtb_u_u1026; Vuna_dIr_dModel.f_IrUnit_irUnitEntry = dtb_u_u1027 }; B_dData_dPair.f_Pair_second = dtb_u_u1028 })))))

# 975 "Vuna/Ir/Codec.vuna"
let v_decUnit3 = (fun (dtb_u_u1029 : int) (dtb_u_u1030 : Base_dBytes.t_Cur) (dtb_u_u1031 : Vuna_dIr_dModel.t_IrTyDecl B_dData_dList.t_List) (dtb_u_u1032 : Vuna_dIr_dModel.t_IrGroup B_dData_dList.t_List) (dtb_u_u1033 : bool) -> ((Base_dBytes.v_thenPair ((v_decStrs dtb_u_u1029) dtb_u_u1030)) (fun (dtb_u_u1034 : string B_dData_dList.t_List) (dtb_u_u1035 : Base_dBytes.t_Cur) -> ((((((v_decUnit4 dtb_u_u1029) dtb_u_u1035) dtb_u_u1031) dtb_u_u1032) dtb_u_u1033) dtb_u_u1034))))

# 969 "Vuna/Ir/Codec.vuna"
let v_decUnit2 = (fun (dtb_u_u1036 : int) (dtb_u_u1037 : Base_dBytes.t_Cur) (dtb_u_u1038 : Vuna_dIr_dModel.t_IrTyDecl B_dData_dList.t_List) (dtb_u_u1039 : Vuna_dIr_dModel.t_IrGroup B_dData_dList.t_List) -> ((Base_dBytes.v_thenPair ((Base_dBytes.v_decBool dtb_u_u1036) dtb_u_u1037)) (fun (dtb_u_u1040 : bool) (dtb_u_u1041 : Base_dBytes.t_Cur) -> (((((v_decUnit3 dtb_u_u1036) dtb_u_u1041) dtb_u_u1038) dtb_u_u1039) dtb_u_u1040))))

# 965 "Vuna/Ir/Codec.vuna"
let v_decUnit1 = (fun (dtb_u_u1042 : int) (dtb_u_u1043 : Base_dBytes.t_Cur) (dtb_u_u1044 : Vuna_dIr_dModel.t_IrTyDecl B_dData_dList.t_List) -> ((Base_dBytes.v_thenPair (((Base_dBytes.v_decList v_decGroup) dtb_u_u1042) dtb_u_u1043)) (fun (dtb_u_u1045 : Vuna_dIr_dModel.t_IrGroup B_dData_dList.t_List) (dtb_u_u1046 : Base_dBytes.t_Cur) -> ((((v_decUnit2 dtb_u_u1042) dtb_u_u1046) dtb_u_u1044) dtb_u_u1045))))

# 962 "Vuna/Ir/Codec.vuna"
let v_decUnit = (fun (dtb_u_u1047 : int) (dtb_u_u1048 : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair (((Base_dBytes.v_decList v_decTyDecl) dtb_u_u1047) dtb_u_u1048)) (fun (dtb_u_u1049 : Vuna_dIr_dModel.t_IrTyDecl B_dData_dList.t_List) (dtb_u_u1050 : Base_dBytes.t_Cur) -> (((v_decUnit1 dtb_u_u1047) dtb_u_u1050) dtb_u_u1049))))

# 988 "Vuna/Ir/Codec.vuna"
let v_irEncoderFuel = 16777216

# 992 "Vuna/Ir/Codec.vuna"
let v_encodeProgram = (fun (dtb_u_u1051 : Vuna_dIr_dModel.t_IrProgram) -> ((Base_dBytes.v_encTop (fun (dtb_u_u1052 : Vuna_dIr_dModel.t_IrProgram) (dtb_u_u1053 : string B_dData_dList.t_List) -> ((v_encShared (Vuna_dIr_dModel.v_irProgSharedOf dtb_u_u1052)) (((v_encUnit v_irEncoderFuel) (Vuna_dIr_dModel.v_irProgUnitOf dtb_u_u1052)) dtb_u_u1053)))) dtb_u_u1051))

# 997 "Vuna/Ir/Codec.vuna"
let v_decodeProgram = (fun (dtb_u_u1054 : int) (dtb_u_u1055 : string) -> (if (dtb_u_u1054 <= 0) then B_dData_dMaybe.C_Maybe_Nothing else (if ((String.length dtb_u_u1055) <= 0) then B_dData_dMaybe.C_Maybe_Nothing else (let dtb_u_u1056 = ((Base_dBytes.v_thenPair ((v_decShared dtb_u_u1054) (Base_dBytes.v_curOf dtb_u_u1055))) (fun (dtb_u_u1060 : Vuna_dIr_dModel.t_IrShared) (dtb_u_u1061 : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair ((v_decUnit dtb_u_u1054) dtb_u_u1061)) (fun (dtb_u_u1062 : Vuna_dIr_dModel.t_IrUnit) (dtb_u_u1063 : Base_dBytes.t_Cur) -> (if (Base_dBytes.v_curAtEnd dtb_u_u1063) then (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = { Vuna_dIr_dModel.f_IrProgram_irProgShared = dtb_u_u1060; Vuna_dIr_dModel.f_IrProgram_irProgUnit = dtb_u_u1062 }; B_dData_dPair.f_Pair_second = dtb_u_u1063 })) else B_dData_dMaybe.C_Maybe_Nothing))))) in (match dtb_u_u1056 with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u1057) -> (match dtb_u_u1057 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u1058; B_dData_dPair.f_Pair_second = dtb_u_u1059 } -> (B_dData_dMaybe.C_Maybe_Just (dtb_u_u1058))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))))

# 1009 "Vuna/Ir/Codec.vuna"
let v_encodeUnit = (fun (dtb_u_u1064 : Vuna_dIr_dModel.t_IrUnit) -> ((Base_dBytes.v_encTop (v_encUnit v_irEncoderFuel)) dtb_u_u1064))

# 1013 "Vuna/Ir/Codec.vuna"
let v_decodeUnit = (fun (dtb_u_u1065 : int) (dtb_u_u1066 : string) -> (if (dtb_u_u1065 <= 0) then B_dData_dMaybe.C_Maybe_Nothing else (if ((String.length dtb_u_u1066) <= 0) then B_dData_dMaybe.C_Maybe_Nothing else (let dtb_u_u1067 = ((Base_dBytes.v_thenPair ((v_decUnit dtb_u_u1065) (Base_dBytes.v_curOf dtb_u_u1066))) (fun (dtb_u_u1071 : Vuna_dIr_dModel.t_IrUnit) (dtb_u_u1072 : Base_dBytes.t_Cur) -> (if (Base_dBytes.v_curAtEnd dtb_u_u1072) then (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = dtb_u_u1071; B_dData_dPair.f_Pair_second = dtb_u_u1072 })) else B_dData_dMaybe.C_Maybe_Nothing))) in (match dtb_u_u1067 with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u1068) -> (match dtb_u_u1068 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u1069; B_dData_dPair.f_Pair_second = dtb_u_u1070 } -> (B_dData_dMaybe.C_Maybe_Just (dtb_u_u1069))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))))
