open Vuna_runtime
let rec v_Vuna_dCompiler_dCanonical_dBytes_dlenOf = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__0, dtb__1) -> (1 + (v_Vuna_dCompiler_dCanonical_dBytes_dlenOf dtb__1))
  | Base_dList.C_Base_dList_dList_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCanonical_dBytes_dencConcat = (fun parts -> (Base_dList.dtp_concatMany parts))

let v_Vuna_dCompiler_dCanonical_dBytes_dencTop = (fun f x -> (v_Vuna_dCompiler_dCanonical_dBytes_dencConcat ((f x) Base_dList.C_Base_dList_dList_Nil)))

let v_Vuna_dCompiler_dCanonical_dBytes_dencTag = (fun n acc -> (Base_dList.C_Base_dList_dList_Cons ((String.concat "" ["#"; (bi_strFromInt n); ";"]), acc)))

let v_Vuna_dCompiler_dCanonical_dBytes_dencInt = (fun n acc -> (Base_dList.C_Base_dList_dList_Cons ((String.concat "" ["i"; (bi_strFromInt n); ";"]), acc)))

let v_Vuna_dCompiler_dCanonical_dBytes_dencStr = (fun s acc -> (Base_dList.C_Base_dList_dList_Cons ((String.concat "" ["s"; (bi_strFromInt (bi_strLength s)); ":"]), (Base_dList.C_Base_dList_dList_Cons (s, acc)))))

let v_Vuna_dCompiler_dCanonical_dBytes_dencBool = (fun mc0 mc1 -> (if mc0 then (Base_dList.C_Base_dList_dList_Cons ("b1", mc1)) else (Base_dList.C_Base_dList_dList_Cons ("b0", mc1))))

let rec v_Vuna_dCompiler_dCanonical_dBytes_dencListGo = (fun mc0 mc1 mc2 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__2, dtb__3) -> ((mc0 dtb__2) (((v_Vuna_dCompiler_dCanonical_dBytes_dencListGo mc0) dtb__3) mc2))
  | Base_dList.C_Base_dList_dList_Nil -> mc2
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCanonical_dBytes_dencList = (fun f xs acc -> (Base_dList.C_Base_dList_dList_Cons ((String.concat "" ["["; (bi_strFromInt (v_Vuna_dCompiler_dCanonical_dBytes_dlenOf xs)); ":"]), (((v_Vuna_dCompiler_dCanonical_dBytes_dencListGo f) xs) acc))))

let v_Vuna_dCompiler_dCanonical_dBytes_dencMaybe = (fun mc0 mc1 mc2 -> (match mc1 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__4) -> (Base_dList.C_Base_dList_dList_Cons ("1", ((mc0 dtb__4) mc2)))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (Base_dList.C_Base_dList_dList_Cons ("0", mc2))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCanonical_dBytes_dthenPair = (fun mc0 mc1 -> (match mc0 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__5) -> (match dtb__5 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__6; Base_dPair.f_Base_dPair_dPair_second = dtb__7 } -> ((mc1 dtb__6) dtb__7)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCanonical_dBytes_disDigit = (fun c -> (if (c >= 48) then (c <= 57) else false))

let rec v_Vuna_dCompiler_dCanonical_dBytes_ddecNumStop = (fun fuel stop acc bytes -> (if (fuel <= 0) then Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing else (match bytes with
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | Base_dList.C_Base_dList_dList_Cons (dtb__8, dtb__9) -> (if (dtb__8 = stop) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Base_dPair.f_Base_dPair_dPair_first = acc; Base_dPair.f_Base_dPair_dPair_second = dtb__9 })) else (if (v_Vuna_dCompiler_dCanonical_dBytes_disDigit dtb__8) then ((((v_Vuna_dCompiler_dCanonical_dBytes_ddecNumStop (fuel - 1)) stop) ((acc * 10) + (dtb__8 - 48))) dtb__9) else Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing))
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dCanonical_dBytes_dtakeN = (fun n bytes -> (if (n <= 0) then Base_dList.C_Base_dList_dList_Nil else (match bytes with
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | Base_dList.C_Base_dList_dList_Cons (dtb__10, dtb__11) -> (Base_dList.C_Base_dList_dList_Cons (dtb__10, ((v_Vuna_dCompiler_dCanonical_dBytes_dtakeN (n - 1)) dtb__11)))
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dCanonical_dBytes_ddropN = (fun n bytes -> (if (n <= 0) then bytes else (match bytes with
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | Base_dList.C_Base_dList_dList_Cons (dtb__12, dtb__13) -> ((v_Vuna_dCompiler_dCanonical_dBytes_ddropN (n - 1)) dtb__13)
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dCanonical_dBytes_ddecTag = (fun fuel bytes -> (if (fuel <= 0) then Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing else (match bytes with
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | Base_dList.C_Base_dList_dList_Cons (dtb__14, dtb__15) -> (if (dtb__14 = 35) then ((((v_Vuna_dCompiler_dCanonical_dBytes_ddecNumStop (fuel - 1)) 59) 0) dtb__15) else Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing)
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dCanonical_dBytes_ddecInt = (fun fuel bytes -> (if (fuel <= 0) then Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing else (match bytes with
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | Base_dList.C_Base_dList_dList_Cons (dtb__16, dtb__17) -> (if (dtb__16 = 105) then ((fun nd_uscrut5 -> (match nd_uscrut5 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__18, dtb__19) -> (if (dtb__18 = 45) then ((v_Vuna_dCompiler_dCanonical_dBytes_dthenPair ((((v_Vuna_dCompiler_dCanonical_dBytes_ddecNumStop (fuel - 1)) 59) 0) dtb__19)) (fun n b -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Base_dPair.f_Base_dPair_dPair_first = (0 - n); Base_dPair.f_Base_dPair_dPair_second = b })))) else ((v_Vuna_dCompiler_dCanonical_dBytes_dthenPair ((((v_Vuna_dCompiler_dCanonical_dBytes_ddecNumStop (fuel - 1)) 59) 0) dtb__17)) (fun n b -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Base_dPair.f_Base_dPair_dPair_first = n; Base_dPair.f_Base_dPair_dPair_second = b })))))
  | _ -> ((v_Vuna_dCompiler_dCanonical_dBytes_dthenPair ((((v_Vuna_dCompiler_dCanonical_dBytes_ddecNumStop (fuel - 1)) 59) 0) dtb__17)) (fun n b -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Base_dPair.f_Base_dPair_dPair_first = n; Base_dPair.f_Base_dPair_dPair_second = b }))))
)) dtb__17) else Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing)
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dCanonical_dBytes_ddecBool = (fun fuel bytes -> (if (fuel <= 0) then Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing else (match bytes with
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | Base_dList.C_Base_dList_dList_Cons (dtb__20, dtb__21) -> (if (dtb__20 = 98) then ((fun nd_uscrut5 -> (match nd_uscrut5 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__22, dtb__23) -> (if (dtb__22 = 49) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Base_dPair.f_Base_dPair_dPair_first = true; Base_dPair.f_Base_dPair_dPair_second = dtb__23 })) else (if (dtb__22 = 48) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Base_dPair.f_Base_dPair_dPair_first = false; Base_dPair.f_Base_dPair_dPair_second = dtb__23 })) else Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing))
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)) dtb__21) else Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing)
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dCanonical_dBytes_ddecStr = (fun fuel bytes -> (if (fuel <= 0) then Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing else (match bytes with
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | Base_dList.C_Base_dList_dList_Cons (dtb__24, dtb__25) -> (if (dtb__24 = 115) then ((v_Vuna_dCompiler_dCanonical_dBytes_dthenPair ((((v_Vuna_dCompiler_dCanonical_dBytes_ddecNumStop (fuel - 1)) 58) 0) dtb__25)) (fun n b -> ((fun taken -> (if ((v_Vuna_dCompiler_dCanonical_dBytes_dlenOf taken) = n) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Base_dPair.f_Base_dPair_dPair_first = (Base_dList.dtp_pack taken); Base_dPair.f_Base_dPair_dPair_second = ((v_Vuna_dCompiler_dCanonical_dBytes_ddropN n) b) })) else Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing)) ((v_Vuna_dCompiler_dCanonical_dBytes_dtakeN n) b)))) else Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing)
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dCanonical_dBytes_ddecItems = (fun fp n fuel bytes acc -> (if (n <= 0) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Base_dPair.f_Base_dPair_dPair_first = (Base_dList.v_Base_dList_dreverse acc); Base_dPair.f_Base_dPair_dPair_second = bytes })) else (if (fuel <= 0) then Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing else ((v_Vuna_dCompiler_dCanonical_dBytes_dthenPair ((fp fuel) bytes)) (fun x b -> (((((v_Vuna_dCompiler_dCanonical_dBytes_ddecItems fp) (n - 1)) (fuel - 1)) b) (Base_dList.C_Base_dList_dList_Cons (x, acc))))))))

let v_Vuna_dCompiler_dCanonical_dBytes_ddecList = (fun fp fuel bytes -> (if (fuel <= 0) then Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing else (match bytes with
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | Base_dList.C_Base_dList_dList_Cons (dtb__26, dtb__27) -> (if (dtb__26 = 91) then ((v_Vuna_dCompiler_dCanonical_dBytes_dthenPair ((((v_Vuna_dCompiler_dCanonical_dBytes_ddecNumStop (fuel - 1)) 58) 0) dtb__27)) (fun n b -> (((((v_Vuna_dCompiler_dCanonical_dBytes_ddecItems fp) n) (fuel - 1)) b) Base_dList.C_Base_dList_dList_Nil))) else Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing)
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dCanonical_dBytes_ddecMaybe = (fun fp fuel bytes -> (if (fuel <= 0) then Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing else (match bytes with
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | Base_dList.C_Base_dList_dList_Cons (dtb__28, dtb__29) -> (if (dtb__28 = 48) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Base_dPair.f_Base_dPair_dPair_first = Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing; Base_dPair.f_Base_dPair_dPair_second = dtb__29 })) else (if (dtb__28 = 49) then ((v_Vuna_dCompiler_dCanonical_dBytes_dthenPair ((fp (fuel - 1)) dtb__29)) (fun x b -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Base_dPair.f_Base_dPair_dPair_first = (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (x)); Base_dPair.f_Base_dPair_dPair_second = b })))) else Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing))
  | _ -> failwith "DT: impossible branch"
)))
