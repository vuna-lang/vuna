open Vuna_runtime
type t_Cur = { f_Cur_curS : string; f_Cur_curI : int }

# 48 "Vuna/Compiler/Base/Bytes.vuna"
let v_curOf = (fun (dtb_u_u1 : string) -> { f_Cur_curS = dtb_u_u1; f_Cur_curI = 0 })

# 52 "Vuna/Compiler/Base/Bytes.vuna"
let v_curAtEnd = (fun (dtb_u_u2 : t_Cur) -> ((dtb_u_u2).f_Cur_curI >= (String.length (dtb_u_u2).f_Cur_curS)))

# 56 "Vuna/Compiler/Base/Bytes.vuna"
let v_curChar = (fun (dtb_u_u3 : t_Cur) -> (if ((dtb_u_u3).f_Cur_curI < (String.length (dtb_u_u3).f_Cur_curS)) then (B_dData_dMaybe.C_Maybe_Just ((let b = (dtb_u_u3).f_Cur_curS in let k = (dtb_u_u3).f_Cur_curI in if k < 0 || k >= String.length b then -1 else Char.code (String.unsafe_get b k)))) else B_dData_dMaybe.C_Maybe_Nothing))

# 60 "Vuna/Compiler/Base/Bytes.vuna"
let v_curSkip = (fun (dtb_u_u4 : t_Cur) -> { f_Cur_curS = (dtb_u_u4).f_Cur_curS; f_Cur_curI = ((dtb_u_u4).f_Cur_curI + 1) })

# 64 "Vuna/Compiler/Base/Bytes.vuna"
let v_curSlice = (fun (dtb_u_u5 : t_Cur) (dtb_u_u6 : int) (dtb_u_u7 : int) -> (((dtp_substring dtb_u_u6) dtb_u_u7) (dtb_u_u5).f_Cur_curS))

# 68 "Vuna/Compiler/Base/Bytes.vuna"
let rec v_lenOf = (fun dtb_u_u9 -> (match dtb_u_u9 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u10, dtb_u_u11) -> (1 + (v_lenOf dtb_u_u11))
  | B_dData_dList.C_List_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))

# 73 "Vuna/Compiler/Base/Bytes.vuna"
let v_encConcat = (fun (dtb_u_u12 : string B_dData_dList.t_List) -> (B_dData_dList.dtp_concatMany dtb_u_u12))

# 77 "Vuna/Compiler/Base/Bytes.vuna"
let v_encTop = (fun dtb_u_u14 dtb_u_u15 -> (v_encConcat ((dtb_u_u14 dtb_u_u15) B_dData_dList.C_List_Nil)))

# 81 "Vuna/Compiler/Base/Bytes.vuna"
let v_encTag = (fun (dtb_u_u16 : int) (dtb_u_u17 : string B_dData_dList.t_List) -> (B_dData_dList.C_List__x58__x58_ ("#", (B_dData_dList.C_List__x58__x58_ ((string_of_int dtb_u_u16), (B_dData_dList.C_List__x58__x58_ (";", dtb_u_u17)))))))

# 85 "Vuna/Compiler/Base/Bytes.vuna"
let v_encInt = (fun (dtb_u_u18 : int) (dtb_u_u19 : string B_dData_dList.t_List) -> (B_dData_dList.C_List__x58__x58_ ("i", (B_dData_dList.C_List__x58__x58_ ((string_of_int dtb_u_u18), (B_dData_dList.C_List__x58__x58_ (";", dtb_u_u19)))))))

# 89 "Vuna/Compiler/Base/Bytes.vuna"
let v_encStr = (fun (dtb_u_u20 : string) (dtb_u_u21 : string B_dData_dList.t_List) -> (B_dData_dList.C_List__x58__x58_ ("s", (B_dData_dList.C_List__x58__x58_ ((string_of_int (String.length dtb_u_u20)), (B_dData_dList.C_List__x58__x58_ (":", (B_dData_dList.C_List__x58__x58_ (dtb_u_u20, dtb_u_u21)))))))))

# 93 "Vuna/Compiler/Base/Bytes.vuna"
let v_encBool = (fun (dtb_u_u22 : bool) (dtb_u_u23 : string B_dData_dList.t_List) -> (if dtb_u_u22 then (B_dData_dList.C_List__x58__x58_ ("b1", dtb_u_u23)) else (B_dData_dList.C_List__x58__x58_ ("b0", dtb_u_u23))))

# 102 "Vuna/Compiler/Base/Bytes.vuna"
let rec v_encListGo = (fun dtb_u_u25 dtb_u_u26 (dtb_u_u27 : string B_dData_dList.t_List) -> (match dtb_u_u26 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u28, dtb_u_u29) -> ((dtb_u_u25 dtb_u_u28) (((v_encListGo dtb_u_u25) dtb_u_u29) dtb_u_u27))
  | B_dData_dList.C_List_Nil -> dtb_u_u27
  | _ -> failwith "DT: impossible branch"
))

# 98 "Vuna/Compiler/Base/Bytes.vuna"
let v_encList = (fun dtb_u_u31 dtb_u_u32 (dtb_u_u33 : string B_dData_dList.t_List) -> (B_dData_dList.C_List__x58__x58_ ("[", (B_dData_dList.C_List__x58__x58_ ((string_of_int (v_lenOf dtb_u_u32)), (B_dData_dList.C_List__x58__x58_ (":", (((v_encListGo dtb_u_u31) dtb_u_u32) dtb_u_u33))))))))

# 107 "Vuna/Compiler/Base/Bytes.vuna"
let v_encMaybe = (fun dtb_u_u35 dtb_u_u36 (dtb_u_u37 : string B_dData_dList.t_List) -> (match dtb_u_u36 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u38) -> (B_dData_dList.C_List__x58__x58_ ("1", ((dtb_u_u35 dtb_u_u38) dtb_u_u37)))
  | B_dData_dMaybe.C_Maybe_Nothing -> (B_dData_dList.C_List__x58__x58_ ("0", dtb_u_u37))
  | _ -> failwith "DT: impossible branch"
))

# 112 "Vuna/Compiler/Base/Bytes.vuna"
let v_encPair = (fun dtb_u_u41 dtb_u_u42 dtb_u_u43 (dtb_u_u44 : string B_dData_dList.t_List) -> (match dtb_u_u43 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u45; B_dData_dPair.f_Pair_second = dtb_u_u46 } -> ((dtb_u_u41 dtb_u_u45) ((dtb_u_u42 dtb_u_u46) dtb_u_u44))
  | _ -> failwith "DT: impossible branch"
))

# 116 "Vuna/Compiler/Base/Bytes.vuna"
let v_thenPair = (fun dtb_u_u49 dtb_u_u50 -> (match dtb_u_u49 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u51) -> (match dtb_u_u51 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u52; B_dData_dPair.f_Pair_second = dtb_u_u53 } -> ((dtb_u_u50 dtb_u_u52) dtb_u_u53)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 121 "Vuna/Compiler/Base/Bytes.vuna"
let v_isDigit = (fun (dtb_u_u54 : int) -> (if (dtb_u_u54 >= 48) then (dtb_u_u54 <= 57) else false))

# 126 "Vuna/Compiler/Base/Bytes.vuna"
let rec v_decNumStop = (fun (dtb_u_u55 : int) (dtb_u_u56 : int) (dtb_u_u57 : int) (dtb_u_u58 : t_Cur) -> (if (dtb_u_u55 <= 0) then B_dData_dMaybe.C_Maybe_Nothing else (match (v_curChar dtb_u_u58) with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u59) -> (if (dtb_u_u59 = dtb_u_u56) then (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = dtb_u_u57; B_dData_dPair.f_Pair_second = (v_curSkip dtb_u_u58) })) else (if (v_isDigit dtb_u_u59) then ((((v_decNumStop (dtb_u_u55 - 1)) dtb_u_u56) ((dtb_u_u57 * 10) + (dtb_u_u59 - 48))) (v_curSkip dtb_u_u58)) else B_dData_dMaybe.C_Maybe_Nothing))
  | _ -> failwith "DT: impossible branch"
)))

# 136 "Vuna/Compiler/Base/Bytes.vuna"
let v_decTag = (fun (dtb_u_u60 : int) (dtb_u_u61 : t_Cur) -> (if (dtb_u_u60 <= 0) then B_dData_dMaybe.C_Maybe_Nothing else (let dtb_u_u62 = (v_curChar dtb_u_u61) in (match dtb_u_u62 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u63) -> (if (dtb_u_u63 = 35) then ((((v_decNumStop (dtb_u_u60 - 1)) 59) 0) (v_curSkip dtb_u_u61)) else B_dData_dMaybe.C_Maybe_Nothing)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
))))

# 146 "Vuna/Compiler/Base/Bytes.vuna"
let v_decInt = (fun (dtb_u_u64 : int) (dtb_u_u65 : t_Cur) -> (if (dtb_u_u64 <= 0) then B_dData_dMaybe.C_Maybe_Nothing else (let dtb_u_u66 = (v_curChar dtb_u_u65) in (match dtb_u_u66 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u67) -> (if (dtb_u_u67 = 105) then (let dtb_u_u68 = (v_curChar (v_curSkip dtb_u_u65)) in (match dtb_u_u68 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u69) -> (if (dtb_u_u69 = 45) then ((v_thenPair ((((v_decNumStop (dtb_u_u64 - 1)) 59) 0) (v_curSkip (v_curSkip dtb_u_u65)))) (fun (dtb_u_u70 : int) (dtb_u_u71 : t_Cur) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (0 - dtb_u_u70); B_dData_dPair.f_Pair_second = dtb_u_u71 })))) else ((v_thenPair ((((v_decNumStop (dtb_u_u64 - 1)) 59) 0) (v_curSkip dtb_u_u65))) (fun (dtb_u_u72 : int) (dtb_u_u73 : t_Cur) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = dtb_u_u72; B_dData_dPair.f_Pair_second = dtb_u_u73 })))))
  | _ -> ((v_thenPair ((((v_decNumStop (dtb_u_u64 - 1)) 59) 0) (v_curSkip dtb_u_u65))) (fun (dtb_u_u74 : int) (dtb_u_u75 : t_Cur) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = dtb_u_u74; B_dData_dPair.f_Pair_second = dtb_u_u75 }))))
)) else B_dData_dMaybe.C_Maybe_Nothing)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
))))

# 159 "Vuna/Compiler/Base/Bytes.vuna"
let v_decBool = (fun (dtb_u_u76 : int) (dtb_u_u77 : t_Cur) -> (if (dtb_u_u76 <= 0) then B_dData_dMaybe.C_Maybe_Nothing else (let dtb_u_u78 = (v_curChar dtb_u_u77) in (match dtb_u_u78 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u79) -> (if (dtb_u_u79 = 98) then (let dtb_u_u80 = (v_curChar (v_curSkip dtb_u_u77)) in (match dtb_u_u80 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u81) -> (if (dtb_u_u81 = 49) then (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = true; B_dData_dPair.f_Pair_second = (v_curSkip (v_curSkip dtb_u_u77)) })) else (if (dtb_u_u81 = 48) then (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = false; B_dData_dPair.f_Pair_second = (v_curSkip (v_curSkip dtb_u_u77)) })) else B_dData_dMaybe.C_Maybe_Nothing))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)) else B_dData_dMaybe.C_Maybe_Nothing)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
))))

# 173 "Vuna/Compiler/Base/Bytes.vuna"
let v_decStr = (fun (dtb_u_u82 : int) (dtb_u_u83 : t_Cur) -> (if (dtb_u_u82 <= 0) then B_dData_dMaybe.C_Maybe_Nothing else (let dtb_u_u84 = (v_curChar dtb_u_u83) in (match dtb_u_u84 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u85) -> (if (dtb_u_u85 = 115) then ((v_thenPair ((((v_decNumStop (dtb_u_u82 - 1)) 58) 0) (v_curSkip dtb_u_u83))) (fun (dtb_u_u86 : int) (dtb_u_u87 : t_Cur) -> (if (if (dtb_u_u86 < 0) then true else (((dtb_u_u87).f_Cur_curI + dtb_u_u86) > (String.length (dtb_u_u87).f_Cur_curS))) then B_dData_dMaybe.C_Maybe_Nothing else (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (((v_curSlice dtb_u_u87) (dtb_u_u87).f_Cur_curI) dtb_u_u86); B_dData_dPair.f_Pair_second = { f_Cur_curS = (dtb_u_u87).f_Cur_curS; f_Cur_curI = ((dtb_u_u87).f_Cur_curI + dtb_u_u86) } }))))) else B_dData_dMaybe.C_Maybe_Nothing)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
))))

# 193 "Vuna/Compiler/Base/Bytes.vuna"
let rec v_decItems = (fun dtb_u_u89 (dtb_u_u90 : int) (dtb_u_u91 : int) (dtb_u_u92 : t_Cur) dtb_u_u93 -> (if (dtb_u_u90 <= 0) then (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (B_dData_dList.v_reverse dtb_u_u93); B_dData_dPair.f_Pair_second = dtb_u_u92 })) else (if (dtb_u_u91 <= 0) then B_dData_dMaybe.C_Maybe_Nothing else ((v_thenPair ((dtb_u_u89 dtb_u_u91) dtb_u_u92)) (fun dtb_u_u94 (dtb_u_u95 : t_Cur) -> (((((v_decItems dtb_u_u89) (dtb_u_u90 - 1)) (dtb_u_u91 - 1)) dtb_u_u95) (B_dData_dList.C_List__x58__x58_ (dtb_u_u94, dtb_u_u93))))))))

# 183 "Vuna/Compiler/Base/Bytes.vuna"
let v_decList = (fun dtb_u_u97 (dtb_u_u98 : int) (dtb_u_u99 : t_Cur) -> (if (dtb_u_u98 <= 0) then B_dData_dMaybe.C_Maybe_Nothing else (let dtb_u_u100 = (v_curChar dtb_u_u99) in (match dtb_u_u100 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u101) -> (if (dtb_u_u101 = 91) then ((v_thenPair ((((v_decNumStop (dtb_u_u98 - 1)) 58) 0) (v_curSkip dtb_u_u99))) (fun (dtb_u_u102 : int) (dtb_u_u103 : t_Cur) -> (((((v_decItems dtb_u_u97) dtb_u_u102) (dtb_u_u98 - 1)) dtb_u_u103) B_dData_dList.C_List_Nil))) else B_dData_dMaybe.C_Maybe_Nothing)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
))))

# 203 "Vuna/Compiler/Base/Bytes.vuna"
let v_decMaybe = (fun dtb_u_u105 (dtb_u_u106 : int) (dtb_u_u107 : t_Cur) -> (if (dtb_u_u106 <= 0) then B_dData_dMaybe.C_Maybe_Nothing else (let dtb_u_u108 = (v_curChar dtb_u_u107) in (match dtb_u_u108 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u109) -> (if (dtb_u_u109 = 48) then (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = B_dData_dMaybe.C_Maybe_Nothing; B_dData_dPair.f_Pair_second = (v_curSkip dtb_u_u107) })) else (if (dtb_u_u109 = 49) then ((v_thenPair ((dtb_u_u105 (dtb_u_u106 - 1)) (v_curSkip dtb_u_u107))) (fun dtb_u_u110 (dtb_u_u111 : t_Cur) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (B_dData_dMaybe.C_Maybe_Just (dtb_u_u110)); B_dData_dPair.f_Pair_second = dtb_u_u111 })))) else B_dData_dMaybe.C_Maybe_Nothing))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
))))

# 214 "Vuna/Compiler/Base/Bytes.vuna"
let v_decPair = (fun dtb_u_u114 dtb_u_u115 (dtb_u_u116 : int) (dtb_u_u117 : t_Cur) -> ((v_thenPair ((dtb_u_u114 (dtb_u_u116 - 1)) dtb_u_u117)) (fun dtb_u_u118 (dtb_u_u119 : t_Cur) -> ((v_thenPair ((dtb_u_u115 (dtb_u_u116 - 1)) dtb_u_u119)) (fun dtb_u_u120 (dtb_u_u121 : t_Cur) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = { B_dData_dPair.f_Pair_first = dtb_u_u118; B_dData_dPair.f_Pair_second = dtb_u_u120 }; B_dData_dPair.f_Pair_second = dtb_u_u121 })))))))

# 221 "Vuna/Compiler/Base/Bytes.vuna"
let v_decListHead = (fun (dtb_u_u122 : int) (dtb_u_u123 : t_Cur) -> (if (dtb_u_u122 <= 0) then B_dData_dMaybe.C_Maybe_Nothing else (let dtb_u_u124 = (v_curChar dtb_u_u123) in (match dtb_u_u124 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u125) -> (if (dtb_u_u125 = 91) then ((v_thenPair ((((v_decNumStop (dtb_u_u122 - 1)) 58) 0) (v_curSkip dtb_u_u123))) (fun (dtb_u_u126 : int) (dtb_u_u127 : t_Cur) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = dtb_u_u126; B_dData_dPair.f_Pair_second = dtb_u_u127 })))) else B_dData_dMaybe.C_Maybe_Nothing)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
))))

# 43 "Vuna/Compiler/Base/Bytes.vuna"
let v_curS = (fun (dtb_u_u128 : t_Cur) -> (match dtb_u_u128 with
  | { f_Cur_curS = dtb_u_u129; f_Cur_curI = dtb_u_u130 } -> dtb_u_u129
  | _ -> failwith "DT: impossible branch"
))

# 44 "Vuna/Compiler/Base/Bytes.vuna"
let v_curI = (fun (dtb_u_u131 : t_Cur) -> (match dtb_u_u131 with
  | { f_Cur_curS = dtb_u_u132; f_Cur_curI = dtb_u_u133 } -> dtb_u_u133
  | _ -> failwith "DT: impossible branch"
))
