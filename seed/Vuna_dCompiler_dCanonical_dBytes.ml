open Vuna_runtime
type t_Vuna_dCompiler_dCanonical_dBytes_dCur = { f_Vuna_dCompiler_dCanonical_dBytes_dCur_curS : string; f_Vuna_dCompiler_dCanonical_dBytes_dCur_curI : int }

# 48 "Vuna/Compiler/Canonical/Bytes.vuna"
let v_Vuna_dCompiler_dCanonical_dBytes_dcurOf = (fun s -> { f_Vuna_dCompiler_dCanonical_dBytes_dCur_curS = s; f_Vuna_dCompiler_dCanonical_dBytes_dCur_curI = 0 })

# 52 "Vuna/Compiler/Canonical/Bytes.vuna"
let v_Vuna_dCompiler_dCanonical_dBytes_dcurAtEnd = (fun c -> ((c).f_Vuna_dCompiler_dCanonical_dBytes_dCur_curI >= (bi_strLength (c).f_Vuna_dCompiler_dCanonical_dBytes_dCur_curS)))

# 56 "Vuna/Compiler/Canonical/Bytes.vuna"
let v_Vuna_dCompiler_dCanonical_dBytes_dcurChar = (fun c -> (if ((c).f_Vuna_dCompiler_dCanonical_dBytes_dCur_curI < (bi_strLength (c).f_Vuna_dCompiler_dCanonical_dBytes_dCur_curS)) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (((dtp_strAt (c).f_Vuna_dCompiler_dCanonical_dBytes_dCur_curS) (c).f_Vuna_dCompiler_dCanonical_dBytes_dCur_curI))) else Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing))

# 60 "Vuna/Compiler/Canonical/Bytes.vuna"
let v_Vuna_dCompiler_dCanonical_dBytes_dcurSkip = (fun c -> { f_Vuna_dCompiler_dCanonical_dBytes_dCur_curS = (c).f_Vuna_dCompiler_dCanonical_dBytes_dCur_curS; f_Vuna_dCompiler_dCanonical_dBytes_dCur_curI = ((c).f_Vuna_dCompiler_dCanonical_dBytes_dCur_curI + 1) })

# 64 "Vuna/Compiler/Canonical/Bytes.vuna"
let v_Vuna_dCompiler_dCanonical_dBytes_dcurSlice = (fun c start len -> (((dtp_substring start) len) (c).f_Vuna_dCompiler_dCanonical_dBytes_dCur_curS))

# 68 "Vuna/Compiler/Canonical/Bytes.vuna"
let rec v_Vuna_dCompiler_dCanonical_dBytes_dlenOf = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__0, dtb__1) -> (1 + (v_Vuna_dCompiler_dCanonical_dBytes_dlenOf dtb__1))
  | Base_dList.C_Base_dList_dList_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))

# 73 "Vuna/Compiler/Canonical/Bytes.vuna"
let v_Vuna_dCompiler_dCanonical_dBytes_dencConcat = (fun parts -> (Base_dList.dtp_concatMany parts))

# 77 "Vuna/Compiler/Canonical/Bytes.vuna"
let v_Vuna_dCompiler_dCanonical_dBytes_dencTop = (fun f x -> (v_Vuna_dCompiler_dCanonical_dBytes_dencConcat ((f x) Base_dList.C_Base_dList_dList_Nil)))

# 81 "Vuna/Compiler/Canonical/Bytes.vuna"
let v_Vuna_dCompiler_dCanonical_dBytes_dencTag = (fun n acc -> (Base_dList.C_Base_dList_dList_Cons ((String.concat "" ["#"; (bi_strFromInt n); ";"]), acc)))

# 85 "Vuna/Compiler/Canonical/Bytes.vuna"
let v_Vuna_dCompiler_dCanonical_dBytes_dencInt = (fun n acc -> (Base_dList.C_Base_dList_dList_Cons ((String.concat "" ["i"; (bi_strFromInt n); ";"]), acc)))

# 89 "Vuna/Compiler/Canonical/Bytes.vuna"
let v_Vuna_dCompiler_dCanonical_dBytes_dencStr = (fun s acc -> (Base_dList.C_Base_dList_dList_Cons ((String.concat "" ["s"; (bi_strFromInt (bi_strLength s)); ":"]), (Base_dList.C_Base_dList_dList_Cons (s, acc)))))

# 93 "Vuna/Compiler/Canonical/Bytes.vuna"
let v_Vuna_dCompiler_dCanonical_dBytes_dencBool = (fun mc0 mc1 -> (if mc0 then (Base_dList.C_Base_dList_dList_Cons ("b1", mc1)) else (Base_dList.C_Base_dList_dList_Cons ("b0", mc1))))

# 102 "Vuna/Compiler/Canonical/Bytes.vuna"
let rec v_Vuna_dCompiler_dCanonical_dBytes_dencListGo = (fun mc0 mc1 mc2 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__2, dtb__3) -> ((mc0 dtb__2) (((v_Vuna_dCompiler_dCanonical_dBytes_dencListGo mc0) dtb__3) mc2))
  | Base_dList.C_Base_dList_dList_Nil -> mc2
  | _ -> failwith "DT: impossible branch"
))

# 98 "Vuna/Compiler/Canonical/Bytes.vuna"
let v_Vuna_dCompiler_dCanonical_dBytes_dencList = (fun f xs acc -> (Base_dList.C_Base_dList_dList_Cons ((String.concat "" ["["; (bi_strFromInt (v_Vuna_dCompiler_dCanonical_dBytes_dlenOf xs)); ":"]), (((v_Vuna_dCompiler_dCanonical_dBytes_dencListGo f) xs) acc))))

# 107 "Vuna/Compiler/Canonical/Bytes.vuna"
let v_Vuna_dCompiler_dCanonical_dBytes_dencMaybe = (fun mc0 mc1 mc2 -> (match mc1 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__4) -> (Base_dList.C_Base_dList_dList_Cons ("1", ((mc0 dtb__4) mc2)))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (Base_dList.C_Base_dList_dList_Cons ("0", mc2))
  | _ -> failwith "DT: impossible branch"
))

# 112 "Vuna/Compiler/Canonical/Bytes.vuna"
let v_Vuna_dCompiler_dCanonical_dBytes_dencPair = (fun mc0 mc1 mc2 mc3 -> (match mc2 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__5; Base_dPair.f_Base_dPair_dPair_second = dtb__6 } -> ((mc0 dtb__5) ((mc1 dtb__6) mc3))
  | _ -> failwith "DT: impossible branch"
))

# 116 "Vuna/Compiler/Canonical/Bytes.vuna"
let v_Vuna_dCompiler_dCanonical_dBytes_dthenPair = (fun mc0 mc1 -> (match mc0 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__7) -> (match dtb__7 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__8; Base_dPair.f_Base_dPair_dPair_second = dtb__9 } -> ((mc1 dtb__8) dtb__9)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 121 "Vuna/Compiler/Canonical/Bytes.vuna"
let v_Vuna_dCompiler_dCanonical_dBytes_disDigit = (fun c -> (if (c >= 48) then (c <= 57) else false))

# 126 "Vuna/Compiler/Canonical/Bytes.vuna"
let rec v_Vuna_dCompiler_dCanonical_dBytes_ddecNumStop = (fun fuel stop acc c -> (if (fuel <= 0) then Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing else (match (v_Vuna_dCompiler_dCanonical_dBytes_dcurChar c) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__10) -> (if (dtb__10 = stop) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Base_dPair.f_Base_dPair_dPair_first = acc; Base_dPair.f_Base_dPair_dPair_second = (v_Vuna_dCompiler_dCanonical_dBytes_dcurSkip c) })) else (if (v_Vuna_dCompiler_dCanonical_dBytes_disDigit dtb__10) then ((((v_Vuna_dCompiler_dCanonical_dBytes_ddecNumStop (fuel - 1)) stop) ((acc * 10) + (dtb__10 - 48))) (v_Vuna_dCompiler_dCanonical_dBytes_dcurSkip c)) else Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing))
  | _ -> failwith "DT: impossible branch"
)))

# 135 "Vuna/Compiler/Canonical/Bytes.vuna"
let v_Vuna_dCompiler_dCanonical_dBytes_ddecTag = (fun fuel c -> (if (fuel <= 0) then Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing else ((fun nd_uscrut2 -> (match nd_uscrut2 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__11) -> (if (dtb__11 = 35) then ((((v_Vuna_dCompiler_dCanonical_dBytes_ddecNumStop (fuel - 1)) 59) 0) (v_Vuna_dCompiler_dCanonical_dBytes_dcurSkip c)) else Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)) (v_Vuna_dCompiler_dCanonical_dBytes_dcurChar c))))

# 142 "Vuna/Compiler/Canonical/Bytes.vuna"
let v_Vuna_dCompiler_dCanonical_dBytes_ddecInt = (fun fuel c -> (if (fuel <= 0) then Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing else ((fun nd_uscrut2 -> (match nd_uscrut2 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__12) -> (if (dtb__12 = 105) then ((fun nd_uscrut5 -> (match nd_uscrut5 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__13) -> (if (dtb__13 = 45) then ((v_Vuna_dCompiler_dCanonical_dBytes_dthenPair ((((v_Vuna_dCompiler_dCanonical_dBytes_ddecNumStop (fuel - 1)) 59) 0) (v_Vuna_dCompiler_dCanonical_dBytes_dcurSkip (v_Vuna_dCompiler_dCanonical_dBytes_dcurSkip c)))) (fun n b -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Base_dPair.f_Base_dPair_dPair_first = (0 - n); Base_dPair.f_Base_dPair_dPair_second = b })))) else ((v_Vuna_dCompiler_dCanonical_dBytes_dthenPair ((((v_Vuna_dCompiler_dCanonical_dBytes_ddecNumStop (fuel - 1)) 59) 0) (v_Vuna_dCompiler_dCanonical_dBytes_dcurSkip c))) (fun n b -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Base_dPair.f_Base_dPair_dPair_first = n; Base_dPair.f_Base_dPair_dPair_second = b })))))
  | _ -> ((v_Vuna_dCompiler_dCanonical_dBytes_dthenPair ((((v_Vuna_dCompiler_dCanonical_dBytes_ddecNumStop (fuel - 1)) 59) 0) (v_Vuna_dCompiler_dCanonical_dBytes_dcurSkip c))) (fun n b -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Base_dPair.f_Base_dPair_dPair_first = n; Base_dPair.f_Base_dPair_dPair_second = b }))))
)) (v_Vuna_dCompiler_dCanonical_dBytes_dcurChar (v_Vuna_dCompiler_dCanonical_dBytes_dcurSkip c))) else Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)) (v_Vuna_dCompiler_dCanonical_dBytes_dcurChar c))))

# 152 "Vuna/Compiler/Canonical/Bytes.vuna"
let v_Vuna_dCompiler_dCanonical_dBytes_ddecBool = (fun fuel c -> (if (fuel <= 0) then Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing else ((fun nd_uscrut2 -> (match nd_uscrut2 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__14) -> (if (dtb__14 = 98) then ((fun nd_uscrut5 -> (match nd_uscrut5 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__15) -> (if (dtb__15 = 49) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Base_dPair.f_Base_dPair_dPair_first = true; Base_dPair.f_Base_dPair_dPair_second = (v_Vuna_dCompiler_dCanonical_dBytes_dcurSkip (v_Vuna_dCompiler_dCanonical_dBytes_dcurSkip c)) })) else (if (dtb__15 = 48) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Base_dPair.f_Base_dPair_dPair_first = false; Base_dPair.f_Base_dPair_dPair_second = (v_Vuna_dCompiler_dCanonical_dBytes_dcurSkip (v_Vuna_dCompiler_dCanonical_dBytes_dcurSkip c)) })) else Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing))
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)) (v_Vuna_dCompiler_dCanonical_dBytes_dcurChar (v_Vuna_dCompiler_dCanonical_dBytes_dcurSkip c))) else Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)) (v_Vuna_dCompiler_dCanonical_dBytes_dcurChar c))))

# 162 "Vuna/Compiler/Canonical/Bytes.vuna"
let v_Vuna_dCompiler_dCanonical_dBytes_ddecStr = (fun fuel c -> (if (fuel <= 0) then Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing else ((fun nd_uscrut2 -> (match nd_uscrut2 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__16) -> (if (dtb__16 = 115) then ((v_Vuna_dCompiler_dCanonical_dBytes_dthenPair ((((v_Vuna_dCompiler_dCanonical_dBytes_ddecNumStop (fuel - 1)) 58) 0) (v_Vuna_dCompiler_dCanonical_dBytes_dcurSkip c))) (fun n b -> (if (if (n < 0) then true else (((b).f_Vuna_dCompiler_dCanonical_dBytes_dCur_curI + n) > (bi_strLength (b).f_Vuna_dCompiler_dCanonical_dBytes_dCur_curS))) then Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing else (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Base_dPair.f_Base_dPair_dPair_first = (((v_Vuna_dCompiler_dCanonical_dBytes_dcurSlice b) (b).f_Vuna_dCompiler_dCanonical_dBytes_dCur_curI) n); Base_dPair.f_Base_dPair_dPair_second = { f_Vuna_dCompiler_dCanonical_dBytes_dCur_curS = (b).f_Vuna_dCompiler_dCanonical_dBytes_dCur_curS; f_Vuna_dCompiler_dCanonical_dBytes_dCur_curI = ((b).f_Vuna_dCompiler_dCanonical_dBytes_dCur_curI + n) } }))))) else Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)) (v_Vuna_dCompiler_dCanonical_dBytes_dcurChar c))))

# 179 "Vuna/Compiler/Canonical/Bytes.vuna"
let rec v_Vuna_dCompiler_dCanonical_dBytes_ddecItems = (fun fp n fuel c acc -> (if (n <= 0) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Base_dPair.f_Base_dPair_dPair_first = (Base_dList.v_Base_dList_dreverse acc); Base_dPair.f_Base_dPair_dPair_second = c })) else (if (fuel <= 0) then Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing else ((v_Vuna_dCompiler_dCanonical_dBytes_dthenPair ((fp fuel) c)) (fun x b -> (((((v_Vuna_dCompiler_dCanonical_dBytes_ddecItems fp) (n - 1)) (fuel - 1)) b) (Base_dList.C_Base_dList_dList_Cons (x, acc))))))))

# 171 "Vuna/Compiler/Canonical/Bytes.vuna"
let v_Vuna_dCompiler_dCanonical_dBytes_ddecList = (fun fp fuel c -> (if (fuel <= 0) then Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing else ((fun nd_uscrut4 -> (match nd_uscrut4 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__17) -> (if (dtb__17 = 91) then ((v_Vuna_dCompiler_dCanonical_dBytes_dthenPair ((((v_Vuna_dCompiler_dCanonical_dBytes_ddecNumStop (fuel - 1)) 58) 0) (v_Vuna_dCompiler_dCanonical_dBytes_dcurSkip c))) (fun n b -> (((((v_Vuna_dCompiler_dCanonical_dBytes_ddecItems fp) n) (fuel - 1)) b) Base_dList.C_Base_dList_dList_Nil))) else Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)) (v_Vuna_dCompiler_dCanonical_dBytes_dcurChar c))))

# 186 "Vuna/Compiler/Canonical/Bytes.vuna"
let v_Vuna_dCompiler_dCanonical_dBytes_ddecMaybe = (fun fp fuel c -> (if (fuel <= 0) then Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing else ((fun nd_uscrut4 -> (match nd_uscrut4 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__18) -> (if (dtb__18 = 48) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Base_dPair.f_Base_dPair_dPair_first = Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing; Base_dPair.f_Base_dPair_dPair_second = (v_Vuna_dCompiler_dCanonical_dBytes_dcurSkip c) })) else (if (dtb__18 = 49) then ((v_Vuna_dCompiler_dCanonical_dBytes_dthenPair ((fp (fuel - 1)) (v_Vuna_dCompiler_dCanonical_dBytes_dcurSkip c))) (fun x b -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Base_dPair.f_Base_dPair_dPair_first = (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (x)); Base_dPair.f_Base_dPair_dPair_second = b })))) else Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing))
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)) (v_Vuna_dCompiler_dCanonical_dBytes_dcurChar c))))

# 194 "Vuna/Compiler/Canonical/Bytes.vuna"
let v_Vuna_dCompiler_dCanonical_dBytes_ddecPair = (fun fa fb fuel c -> ((v_Vuna_dCompiler_dCanonical_dBytes_dthenPair ((fa (fuel - 1)) c)) (fun x b1 -> ((v_Vuna_dCompiler_dCanonical_dBytes_dthenPair ((fb (fuel - 1)) b1)) (fun y b2 -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Base_dPair.f_Base_dPair_dPair_first = { Base_dPair.f_Base_dPair_dPair_first = x; Base_dPair.f_Base_dPair_dPair_second = y }; Base_dPair.f_Base_dPair_dPair_second = b2 })))))))
