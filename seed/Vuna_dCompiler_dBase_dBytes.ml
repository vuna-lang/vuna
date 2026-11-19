open Vuna_runtime
type t_Vuna_dCompiler_dBase_dBytes_dCur = { f_Vuna_dCompiler_dBase_dBytes_dCur_curS : string; f_Vuna_dCompiler_dBase_dBytes_dCur_curI : int }

# 48 "Vuna/Compiler/Base/Bytes.vuna"
let v_Vuna_dCompiler_dBase_dBytes_dcurOf = (fun (s : string) -> { f_Vuna_dCompiler_dBase_dBytes_dCur_curS = s; f_Vuna_dCompiler_dBase_dBytes_dCur_curI = 0 })

# 52 "Vuna/Compiler/Base/Bytes.vuna"
let v_Vuna_dCompiler_dBase_dBytes_dcurAtEnd = (fun (c : t_Vuna_dCompiler_dBase_dBytes_dCur) -> ((c).f_Vuna_dCompiler_dBase_dBytes_dCur_curI >= (bi_strLength (c).f_Vuna_dCompiler_dBase_dBytes_dCur_curS)))

# 56 "Vuna/Compiler/Base/Bytes.vuna"
let v_Vuna_dCompiler_dBase_dBytes_dcurChar = (fun (c : t_Vuna_dCompiler_dBase_dBytes_dCur) -> (if ((c).f_Vuna_dCompiler_dBase_dBytes_dCur_curI < (bi_strLength (c).f_Vuna_dCompiler_dBase_dBytes_dCur_curS)) then (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (((dtp_strAt (c).f_Vuna_dCompiler_dBase_dBytes_dCur_curS) (c).f_Vuna_dCompiler_dBase_dBytes_dCur_curI))) else Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing))

# 60 "Vuna/Compiler/Base/Bytes.vuna"
let v_Vuna_dCompiler_dBase_dBytes_dcurSkip = (fun (c : t_Vuna_dCompiler_dBase_dBytes_dCur) -> { f_Vuna_dCompiler_dBase_dBytes_dCur_curS = (c).f_Vuna_dCompiler_dBase_dBytes_dCur_curS; f_Vuna_dCompiler_dBase_dBytes_dCur_curI = ((c).f_Vuna_dCompiler_dBase_dBytes_dCur_curI + 1) })

# 64 "Vuna/Compiler/Base/Bytes.vuna"
let v_Vuna_dCompiler_dBase_dBytes_dcurSlice = (fun (c : t_Vuna_dCompiler_dBase_dBytes_dCur) (start : int) (len : int) -> (((dtp_substring start) len) (c).f_Vuna_dCompiler_dBase_dBytes_dCur_curS))

# 68 "Vuna/Compiler/Base/Bytes.vuna"
let rec v_Vuna_dCompiler_dBase_dBytes_dlenOf = (fun mc0 -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__0, dtb__1) -> (1 + (v_Vuna_dCompiler_dBase_dBytes_dlenOf dtb__1))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))

# 73 "Vuna/Compiler/Base/Bytes.vuna"
let v_Vuna_dCompiler_dBase_dBytes_dencConcat = (fun (parts : string Base_dData_dList.t_Base_dData_dList_dList) -> (Base_dData_dList.dtp_concatMany parts))

# 77 "Vuna/Compiler/Base/Bytes.vuna"
let v_Vuna_dCompiler_dBase_dBytes_dencTop = (fun f x -> (v_Vuna_dCompiler_dBase_dBytes_dencConcat ((f x) Base_dData_dList.C_Base_dData_dList_dList_Nil)))

# 81 "Vuna/Compiler/Base/Bytes.vuna"
let v_Vuna_dCompiler_dBase_dBytes_dencTag = (fun (n : int) (acc : string Base_dData_dList.t_Base_dData_dList_dList) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ((String.concat "" ["#"; (bi_strFromInt n); ";"]), acc)))

# 85 "Vuna/Compiler/Base/Bytes.vuna"
let v_Vuna_dCompiler_dBase_dBytes_dencInt = (fun (n : int) (acc : string Base_dData_dList.t_Base_dData_dList_dList) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ((String.concat "" ["i"; (bi_strFromInt n); ";"]), acc)))

# 89 "Vuna/Compiler/Base/Bytes.vuna"
let v_Vuna_dCompiler_dBase_dBytes_dencStr = (fun (s : string) (acc : string Base_dData_dList.t_Base_dData_dList_dList) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ((String.concat "" ["s"; (bi_strFromInt (bi_strLength s)); ":"]), (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (s, acc)))))

# 93 "Vuna/Compiler/Base/Bytes.vuna"
let v_Vuna_dCompiler_dBase_dBytes_dencBool = (fun (mc0 : bool) (mc1 : string Base_dData_dList.t_Base_dData_dList_dList) -> (if mc0 then (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ("b1", mc1)) else (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ("b0", mc1))))

# 102 "Vuna/Compiler/Base/Bytes.vuna"
let rec v_Vuna_dCompiler_dBase_dBytes_dencListGo = (fun mc0 mc1 (mc2 : string Base_dData_dList.t_Base_dData_dList_dList) -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__2, dtb__3) -> ((mc0 dtb__2) (((v_Vuna_dCompiler_dBase_dBytes_dencListGo mc0) dtb__3) mc2))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> mc2
  | _ -> failwith "DT: impossible branch"
))

# 98 "Vuna/Compiler/Base/Bytes.vuna"
let v_Vuna_dCompiler_dBase_dBytes_dencList = (fun f xs (acc : string Base_dData_dList.t_Base_dData_dList_dList) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ((String.concat "" ["["; (bi_strFromInt (v_Vuna_dCompiler_dBase_dBytes_dlenOf xs)); ":"]), (((v_Vuna_dCompiler_dBase_dBytes_dencListGo f) xs) acc))))

# 107 "Vuna/Compiler/Base/Bytes.vuna"
let v_Vuna_dCompiler_dBase_dBytes_dencMaybe = (fun mc0 mc1 (mc2 : string Base_dData_dList.t_Base_dData_dList_dList) -> (match mc1 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__4) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ("1", ((mc0 dtb__4) mc2)))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ("0", mc2))
  | _ -> failwith "DT: impossible branch"
))

# 112 "Vuna/Compiler/Base/Bytes.vuna"
let v_Vuna_dCompiler_dBase_dBytes_dencPair = (fun mc0 mc1 mc2 (mc3 : string Base_dData_dList.t_Base_dData_dList_dList) -> (match mc2 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__5; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__6 } -> ((mc0 dtb__5) ((mc1 dtb__6) mc3))
  | _ -> failwith "DT: impossible branch"
))

# 116 "Vuna/Compiler/Base/Bytes.vuna"
let v_Vuna_dCompiler_dBase_dBytes_dthenPair = (fun mc0 mc1 -> (match mc0 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__7) -> (match dtb__7 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__8; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__9 } -> ((mc1 dtb__8) dtb__9)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 121 "Vuna/Compiler/Base/Bytes.vuna"
let v_Vuna_dCompiler_dBase_dBytes_disDigit = (fun (c : int) -> (if (c >= 48) then (c <= 57) else false))

# 126 "Vuna/Compiler/Base/Bytes.vuna"
let rec v_Vuna_dCompiler_dBase_dBytes_ddecNumStop = (fun (fuel : int) (stop : int) (acc : int) (c : t_Vuna_dCompiler_dBase_dBytes_dCur) -> (if (fuel <= 0) then Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing else (match (v_Vuna_dCompiler_dBase_dBytes_dcurChar c) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__10) -> (if (dtb__10 = stop) then (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = acc; Base_dData_dPair.f_Base_dData_dPair_dPair_second = (v_Vuna_dCompiler_dBase_dBytes_dcurSkip c) })) else (if (v_Vuna_dCompiler_dBase_dBytes_disDigit dtb__10) then ((((v_Vuna_dCompiler_dBase_dBytes_ddecNumStop (fuel - 1)) stop) ((acc * 10) + (dtb__10 - 48))) (v_Vuna_dCompiler_dBase_dBytes_dcurSkip c)) else Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing))
  | _ -> failwith "DT: impossible branch"
)))

# 136 "Vuna/Compiler/Base/Bytes.vuna"
let v_Vuna_dCompiler_dBase_dBytes_ddecTag = (fun (fuel : int) (c : t_Vuna_dCompiler_dBase_dBytes_dCur) -> (if (fuel <= 0) then Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing else ((fun nd_uscrut2 -> (match nd_uscrut2 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__11) -> (if (dtb__11 = 35) then ((((v_Vuna_dCompiler_dBase_dBytes_ddecNumStop (fuel - 1)) 59) 0) (v_Vuna_dCompiler_dBase_dBytes_dcurSkip c)) else Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing)
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
)) (v_Vuna_dCompiler_dBase_dBytes_dcurChar c))))

# 146 "Vuna/Compiler/Base/Bytes.vuna"
let v_Vuna_dCompiler_dBase_dBytes_ddecInt = (fun (fuel : int) (c : t_Vuna_dCompiler_dBase_dBytes_dCur) -> (if (fuel <= 0) then Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing else ((fun nd_uscrut2 -> (match nd_uscrut2 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__12) -> (if (dtb__12 = 105) then ((fun nd_uscrut5 -> (match nd_uscrut5 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__13) -> (if (dtb__13 = 45) then ((v_Vuna_dCompiler_dBase_dBytes_dthenPair ((((v_Vuna_dCompiler_dBase_dBytes_ddecNumStop (fuel - 1)) 59) 0) (v_Vuna_dCompiler_dBase_dBytes_dcurSkip (v_Vuna_dCompiler_dBase_dBytes_dcurSkip c)))) (fun (n : int) (b : t_Vuna_dCompiler_dBase_dBytes_dCur) -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (0 - n); Base_dData_dPair.f_Base_dData_dPair_dPair_second = b })))) else ((v_Vuna_dCompiler_dBase_dBytes_dthenPair ((((v_Vuna_dCompiler_dBase_dBytes_ddecNumStop (fuel - 1)) 59) 0) (v_Vuna_dCompiler_dBase_dBytes_dcurSkip c))) (fun (n : int) (b : t_Vuna_dCompiler_dBase_dBytes_dCur) -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = n; Base_dData_dPair.f_Base_dData_dPair_dPair_second = b })))))
  | _ -> ((v_Vuna_dCompiler_dBase_dBytes_dthenPair ((((v_Vuna_dCompiler_dBase_dBytes_ddecNumStop (fuel - 1)) 59) 0) (v_Vuna_dCompiler_dBase_dBytes_dcurSkip c))) (fun (n : int) (b : t_Vuna_dCompiler_dBase_dBytes_dCur) -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = n; Base_dData_dPair.f_Base_dData_dPair_dPair_second = b }))))
)) (v_Vuna_dCompiler_dBase_dBytes_dcurChar (v_Vuna_dCompiler_dBase_dBytes_dcurSkip c))) else Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing)
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
)) (v_Vuna_dCompiler_dBase_dBytes_dcurChar c))))

# 159 "Vuna/Compiler/Base/Bytes.vuna"
let v_Vuna_dCompiler_dBase_dBytes_ddecBool = (fun (fuel : int) (c : t_Vuna_dCompiler_dBase_dBytes_dCur) -> (if (fuel <= 0) then Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing else ((fun nd_uscrut2 -> (match nd_uscrut2 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__14) -> (if (dtb__14 = 98) then ((fun nd_uscrut5 -> (match nd_uscrut5 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__15) -> (if (dtb__15 = 49) then (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = true; Base_dData_dPair.f_Base_dData_dPair_dPair_second = (v_Vuna_dCompiler_dBase_dBytes_dcurSkip (v_Vuna_dCompiler_dBase_dBytes_dcurSkip c)) })) else (if (dtb__15 = 48) then (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = false; Base_dData_dPair.f_Base_dData_dPair_dPair_second = (v_Vuna_dCompiler_dBase_dBytes_dcurSkip (v_Vuna_dCompiler_dBase_dBytes_dcurSkip c)) })) else Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing))
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
)) (v_Vuna_dCompiler_dBase_dBytes_dcurChar (v_Vuna_dCompiler_dBase_dBytes_dcurSkip c))) else Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing)
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
)) (v_Vuna_dCompiler_dBase_dBytes_dcurChar c))))

# 173 "Vuna/Compiler/Base/Bytes.vuna"
let v_Vuna_dCompiler_dBase_dBytes_ddecStr = (fun (fuel : int) (c : t_Vuna_dCompiler_dBase_dBytes_dCur) -> (if (fuel <= 0) then Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing else ((fun nd_uscrut2 -> (match nd_uscrut2 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__16) -> (if (dtb__16 = 115) then ((v_Vuna_dCompiler_dBase_dBytes_dthenPair ((((v_Vuna_dCompiler_dBase_dBytes_ddecNumStop (fuel - 1)) 58) 0) (v_Vuna_dCompiler_dBase_dBytes_dcurSkip c))) (fun (n : int) (b : t_Vuna_dCompiler_dBase_dBytes_dCur) -> (if (if (n < 0) then true else (((b).f_Vuna_dCompiler_dBase_dBytes_dCur_curI + n) > (bi_strLength (b).f_Vuna_dCompiler_dBase_dBytes_dCur_curS))) then Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing else (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (((v_Vuna_dCompiler_dBase_dBytes_dcurSlice b) (b).f_Vuna_dCompiler_dBase_dBytes_dCur_curI) n); Base_dData_dPair.f_Base_dData_dPair_dPair_second = { f_Vuna_dCompiler_dBase_dBytes_dCur_curS = (b).f_Vuna_dCompiler_dBase_dBytes_dCur_curS; f_Vuna_dCompiler_dBase_dBytes_dCur_curI = ((b).f_Vuna_dCompiler_dBase_dBytes_dCur_curI + n) } }))))) else Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing)
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
)) (v_Vuna_dCompiler_dBase_dBytes_dcurChar c))))

# 193 "Vuna/Compiler/Base/Bytes.vuna"
let rec v_Vuna_dCompiler_dBase_dBytes_ddecItems = (fun fp (n : int) (fuel : int) (c : t_Vuna_dCompiler_dBase_dBytes_dCur) acc -> (if (n <= 0) then (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Base_dData_dList.v_Base_dData_dList_dreverse acc); Base_dData_dPair.f_Base_dData_dPair_dPair_second = c })) else (if (fuel <= 0) then Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing else ((v_Vuna_dCompiler_dBase_dBytes_dthenPair ((fp fuel) c)) (fun x (b : t_Vuna_dCompiler_dBase_dBytes_dCur) -> (((((v_Vuna_dCompiler_dBase_dBytes_ddecItems fp) (n - 1)) (fuel - 1)) b) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (x, acc))))))))

# 183 "Vuna/Compiler/Base/Bytes.vuna"
let v_Vuna_dCompiler_dBase_dBytes_ddecList = (fun fp (fuel : int) (c : t_Vuna_dCompiler_dBase_dBytes_dCur) -> (if (fuel <= 0) then Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing else ((fun nd_uscrut4 -> (match nd_uscrut4 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__17) -> (if (dtb__17 = 91) then ((v_Vuna_dCompiler_dBase_dBytes_dthenPair ((((v_Vuna_dCompiler_dBase_dBytes_ddecNumStop (fuel - 1)) 58) 0) (v_Vuna_dCompiler_dBase_dBytes_dcurSkip c))) (fun (n : int) (b : t_Vuna_dCompiler_dBase_dBytes_dCur) -> (((((v_Vuna_dCompiler_dBase_dBytes_ddecItems fp) n) (fuel - 1)) b) Base_dData_dList.C_Base_dData_dList_dList_Nil))) else Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing)
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
)) (v_Vuna_dCompiler_dBase_dBytes_dcurChar c))))

# 203 "Vuna/Compiler/Base/Bytes.vuna"
let v_Vuna_dCompiler_dBase_dBytes_ddecMaybe = (fun fp (fuel : int) (c : t_Vuna_dCompiler_dBase_dBytes_dCur) -> (if (fuel <= 0) then Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing else ((fun nd_uscrut4 -> (match nd_uscrut4 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__18) -> (if (dtb__18 = 48) then (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing; Base_dData_dPair.f_Base_dData_dPair_dPair_second = (v_Vuna_dCompiler_dBase_dBytes_dcurSkip c) })) else (if (dtb__18 = 49) then ((v_Vuna_dCompiler_dBase_dBytes_dthenPair ((fp (fuel - 1)) (v_Vuna_dCompiler_dBase_dBytes_dcurSkip c))) (fun x (b : t_Vuna_dCompiler_dBase_dBytes_dCur) -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (x)); Base_dData_dPair.f_Base_dData_dPair_dPair_second = b })))) else Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing))
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
)) (v_Vuna_dCompiler_dBase_dBytes_dcurChar c))))

# 214 "Vuna/Compiler/Base/Bytes.vuna"
let v_Vuna_dCompiler_dBase_dBytes_ddecPair = (fun fa fb (fuel : int) (c : t_Vuna_dCompiler_dBase_dBytes_dCur) -> ((v_Vuna_dCompiler_dBase_dBytes_dthenPair ((fa (fuel - 1)) c)) (fun x (b1 : t_Vuna_dCompiler_dBase_dBytes_dCur) -> ((v_Vuna_dCompiler_dBase_dBytes_dthenPair ((fb (fuel - 1)) b1)) (fun y (b2 : t_Vuna_dCompiler_dBase_dBytes_dCur) -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = { Base_dData_dPair.f_Base_dData_dPair_dPair_first = x; Base_dData_dPair.f_Base_dData_dPair_dPair_second = y }; Base_dData_dPair.f_Base_dData_dPair_dPair_second = b2 })))))))
