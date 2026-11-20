open Vuna_runtime
type t_Cur = { f_Cur_curS : string; f_Cur_curI : int }

# 48 "Vuna/Compiler/Base/Bytes.vuna"
let v_curOf = (fun (s : string) -> { f_Cur_curS = s; f_Cur_curI = 0 })

# 52 "Vuna/Compiler/Base/Bytes.vuna"
let v_curAtEnd = (fun (c : t_Cur) -> ((c).f_Cur_curI >= (bi_strLength (c).f_Cur_curS)))

# 56 "Vuna/Compiler/Base/Bytes.vuna"
let v_curChar = (fun (c : t_Cur) -> (if ((c).f_Cur_curI < (bi_strLength (c).f_Cur_curS)) then (B_dData_dMaybe.C_Maybe_Just (((dtp_strAt (c).f_Cur_curS) (c).f_Cur_curI))) else B_dData_dMaybe.C_Maybe_Nothing))

# 60 "Vuna/Compiler/Base/Bytes.vuna"
let v_curSkip = (fun (c : t_Cur) -> { f_Cur_curS = (c).f_Cur_curS; f_Cur_curI = ((c).f_Cur_curI + 1) })

# 64 "Vuna/Compiler/Base/Bytes.vuna"
let v_curSlice = (fun (c : t_Cur) (start : int) (len : int) -> (((dtp_substring start) len) (c).f_Cur_curS))

# 68 "Vuna/Compiler/Base/Bytes.vuna"
let rec v_lenOf = (fun mc0 -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__0, dtb__1) -> (1 + (v_lenOf dtb__1))
  | B_dData_dList.C_List_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))

# 73 "Vuna/Compiler/Base/Bytes.vuna"
let v_encConcat = (fun (parts : string B_dData_dList.t_List) -> (B_dData_dList.dtp_concatMany parts))

# 77 "Vuna/Compiler/Base/Bytes.vuna"
let v_encTop = (fun f x -> (v_encConcat ((f x) B_dData_dList.C_List_Nil)))

# 81 "Vuna/Compiler/Base/Bytes.vuna"
let v_encTag = (fun (n : int) (acc : string B_dData_dList.t_List) -> (B_dData_dList.C_List__x58__x58_ ("#", (B_dData_dList.C_List__x58__x58_ ((bi_strFromInt n), (B_dData_dList.C_List__x58__x58_ (";", acc)))))))

# 85 "Vuna/Compiler/Base/Bytes.vuna"
let v_encInt = (fun (n : int) (acc : string B_dData_dList.t_List) -> (B_dData_dList.C_List__x58__x58_ ("i", (B_dData_dList.C_List__x58__x58_ ((bi_strFromInt n), (B_dData_dList.C_List__x58__x58_ (";", acc)))))))

# 89 "Vuna/Compiler/Base/Bytes.vuna"
let v_encStr = (fun (s : string) (acc : string B_dData_dList.t_List) -> (B_dData_dList.C_List__x58__x58_ ("s", (B_dData_dList.C_List__x58__x58_ ((bi_strFromInt (bi_strLength s)), (B_dData_dList.C_List__x58__x58_ (":", (B_dData_dList.C_List__x58__x58_ (s, acc)))))))))

# 93 "Vuna/Compiler/Base/Bytes.vuna"
let v_encBool = (fun (mc0 : bool) (mc1 : string B_dData_dList.t_List) -> (if mc0 then (B_dData_dList.C_List__x58__x58_ ("b1", mc1)) else (B_dData_dList.C_List__x58__x58_ ("b0", mc1))))

# 102 "Vuna/Compiler/Base/Bytes.vuna"
let rec v_encListGo = (fun mc0 mc1 (mc2 : string B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__2, dtb__3) -> ((mc0 dtb__2) (((v_encListGo mc0) dtb__3) mc2))
  | B_dData_dList.C_List_Nil -> mc2
  | _ -> failwith "DT: impossible branch"
))

# 98 "Vuna/Compiler/Base/Bytes.vuna"
let v_encList = (fun f xs (acc : string B_dData_dList.t_List) -> (B_dData_dList.C_List__x58__x58_ ("[", (B_dData_dList.C_List__x58__x58_ ((bi_strFromInt (v_lenOf xs)), (B_dData_dList.C_List__x58__x58_ (":", (((v_encListGo f) xs) acc))))))))

# 107 "Vuna/Compiler/Base/Bytes.vuna"
let v_encMaybe = (fun mc0 mc1 (mc2 : string B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__4) -> (B_dData_dList.C_List__x58__x58_ ("1", ((mc0 dtb__4) mc2)))
  | B_dData_dMaybe.C_Maybe_Nothing -> (B_dData_dList.C_List__x58__x58_ ("0", mc2))
  | _ -> failwith "DT: impossible branch"
))

# 112 "Vuna/Compiler/Base/Bytes.vuna"
let v_encPair = (fun mc0 mc1 mc2 (mc3 : string B_dData_dList.t_List) -> (match mc2 with
  | { B_dData_dPair.f_Pair_first = dtb__5; B_dData_dPair.f_Pair_second = dtb__6 } -> ((mc0 dtb__5) ((mc1 dtb__6) mc3))
  | _ -> failwith "DT: impossible branch"
))

# 116 "Vuna/Compiler/Base/Bytes.vuna"
let v_thenPair = (fun mc0 mc1 -> (match mc0 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__7) -> (match dtb__7 with
  | { B_dData_dPair.f_Pair_first = dtb__8; B_dData_dPair.f_Pair_second = dtb__9 } -> ((mc1 dtb__8) dtb__9)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 121 "Vuna/Compiler/Base/Bytes.vuna"
let v_isDigit = (fun (c : int) -> (if (c >= 48) then (c <= 57) else false))

# 126 "Vuna/Compiler/Base/Bytes.vuna"
let rec v_decNumStop = (fun (fuel : int) (stop : int) (acc : int) (c : t_Cur) -> (if (fuel <= 0) then B_dData_dMaybe.C_Maybe_Nothing else (match (v_curChar c) with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb__10) -> (if (dtb__10 = stop) then (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = acc; B_dData_dPair.f_Pair_second = (v_curSkip c) })) else (if (v_isDigit dtb__10) then ((((v_decNumStop (fuel - 1)) stop) ((acc * 10) + (dtb__10 - 48))) (v_curSkip c)) else B_dData_dMaybe.C_Maybe_Nothing))
  | _ -> failwith "DT: impossible branch"
)))

# 136 "Vuna/Compiler/Base/Bytes.vuna"
let v_decTag = (fun (fuel : int) (c : t_Cur) -> (if (fuel <= 0) then B_dData_dMaybe.C_Maybe_Nothing else (let nd_uscrut2 = (v_curChar c) in (match nd_uscrut2 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__11) -> (if (dtb__11 = 35) then ((((v_decNumStop (fuel - 1)) 59) 0) (v_curSkip c)) else B_dData_dMaybe.C_Maybe_Nothing)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
))))

# 146 "Vuna/Compiler/Base/Bytes.vuna"
let v_decInt = (fun (fuel : int) (c : t_Cur) -> (if (fuel <= 0) then B_dData_dMaybe.C_Maybe_Nothing else (let nd_uscrut2 = (v_curChar c) in (match nd_uscrut2 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__12) -> (if (dtb__12 = 105) then (let nd_uscrut5 = (v_curChar (v_curSkip c)) in (match nd_uscrut5 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__13) -> (if (dtb__13 = 45) then ((v_thenPair ((((v_decNumStop (fuel - 1)) 59) 0) (v_curSkip (v_curSkip c)))) (fun (n : int) (b : t_Cur) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (0 - n); B_dData_dPair.f_Pair_second = b })))) else ((v_thenPair ((((v_decNumStop (fuel - 1)) 59) 0) (v_curSkip c))) (fun (n : int) (b : t_Cur) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = n; B_dData_dPair.f_Pair_second = b })))))
  | _ -> ((v_thenPair ((((v_decNumStop (fuel - 1)) 59) 0) (v_curSkip c))) (fun (n : int) (b : t_Cur) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = n; B_dData_dPair.f_Pair_second = b }))))
)) else B_dData_dMaybe.C_Maybe_Nothing)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
))))

# 159 "Vuna/Compiler/Base/Bytes.vuna"
let v_decBool = (fun (fuel : int) (c : t_Cur) -> (if (fuel <= 0) then B_dData_dMaybe.C_Maybe_Nothing else (let nd_uscrut2 = (v_curChar c) in (match nd_uscrut2 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__14) -> (if (dtb__14 = 98) then (let nd_uscrut5 = (v_curChar (v_curSkip c)) in (match nd_uscrut5 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__15) -> (if (dtb__15 = 49) then (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = true; B_dData_dPair.f_Pair_second = (v_curSkip (v_curSkip c)) })) else (if (dtb__15 = 48) then (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = false; B_dData_dPair.f_Pair_second = (v_curSkip (v_curSkip c)) })) else B_dData_dMaybe.C_Maybe_Nothing))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)) else B_dData_dMaybe.C_Maybe_Nothing)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
))))

# 173 "Vuna/Compiler/Base/Bytes.vuna"
let v_decStr = (fun (fuel : int) (c : t_Cur) -> (if (fuel <= 0) then B_dData_dMaybe.C_Maybe_Nothing else (let nd_uscrut2 = (v_curChar c) in (match nd_uscrut2 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__16) -> (if (dtb__16 = 115) then ((v_thenPair ((((v_decNumStop (fuel - 1)) 58) 0) (v_curSkip c))) (fun (n : int) (b : t_Cur) -> (if (if (n < 0) then true else (((b).f_Cur_curI + n) > (bi_strLength (b).f_Cur_curS))) then B_dData_dMaybe.C_Maybe_Nothing else (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (((v_curSlice b) (b).f_Cur_curI) n); B_dData_dPair.f_Pair_second = { f_Cur_curS = (b).f_Cur_curS; f_Cur_curI = ((b).f_Cur_curI + n) } }))))) else B_dData_dMaybe.C_Maybe_Nothing)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
))))

# 193 "Vuna/Compiler/Base/Bytes.vuna"
let rec v_decItems = (fun fp (n : int) (fuel : int) (c : t_Cur) acc -> (if (n <= 0) then (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (B_dData_dList.v_reverse acc); B_dData_dPair.f_Pair_second = c })) else (if (fuel <= 0) then B_dData_dMaybe.C_Maybe_Nothing else ((v_thenPair ((fp fuel) c)) (fun x (b : t_Cur) -> (((((v_decItems fp) (n - 1)) (fuel - 1)) b) (B_dData_dList.C_List__x58__x58_ (x, acc))))))))

# 183 "Vuna/Compiler/Base/Bytes.vuna"
let v_decList = (fun fp (fuel : int) (c : t_Cur) -> (if (fuel <= 0) then B_dData_dMaybe.C_Maybe_Nothing else (let nd_uscrut4 = (v_curChar c) in (match nd_uscrut4 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__17) -> (if (dtb__17 = 91) then ((v_thenPair ((((v_decNumStop (fuel - 1)) 58) 0) (v_curSkip c))) (fun (n : int) (b : t_Cur) -> (((((v_decItems fp) n) (fuel - 1)) b) B_dData_dList.C_List_Nil))) else B_dData_dMaybe.C_Maybe_Nothing)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
))))

# 203 "Vuna/Compiler/Base/Bytes.vuna"
let v_decMaybe = (fun fp (fuel : int) (c : t_Cur) -> (if (fuel <= 0) then B_dData_dMaybe.C_Maybe_Nothing else (let nd_uscrut4 = (v_curChar c) in (match nd_uscrut4 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__18) -> (if (dtb__18 = 48) then (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = B_dData_dMaybe.C_Maybe_Nothing; B_dData_dPair.f_Pair_second = (v_curSkip c) })) else (if (dtb__18 = 49) then ((v_thenPair ((fp (fuel - 1)) (v_curSkip c))) (fun x (b : t_Cur) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (B_dData_dMaybe.C_Maybe_Just (x)); B_dData_dPair.f_Pair_second = b })))) else B_dData_dMaybe.C_Maybe_Nothing))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
))))

# 214 "Vuna/Compiler/Base/Bytes.vuna"
let v_decPair = (fun fa fb (fuel : int) (c : t_Cur) -> ((v_thenPair ((fa (fuel - 1)) c)) (fun x (b1 : t_Cur) -> ((v_thenPair ((fb (fuel - 1)) b1)) (fun y (b2 : t_Cur) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = { B_dData_dPair.f_Pair_first = x; B_dData_dPair.f_Pair_second = y }; B_dData_dPair.f_Pair_second = b2 })))))))

# 223 "Vuna/Compiler/Base/Bytes.vuna"
let v_decListHead = (fun (fuel : int) (c : t_Cur) -> (if (fuel <= 0) then B_dData_dMaybe.C_Maybe_Nothing else (let nd_uscrut2 = (v_curChar c) in (match nd_uscrut2 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__19) -> (if (dtb__19 = 91) then ((v_thenPair ((((v_decNumStop (fuel - 1)) 58) 0) (v_curSkip c))) (fun (n : int) (b : t_Cur) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = n; B_dData_dPair.f_Pair_second = b })))) else B_dData_dMaybe.C_Maybe_Nothing)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
))))
