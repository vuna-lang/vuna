open Vuna_runtime
# 29 "Base/Data/Sha1.vuna"
let v_sha1Init = (B_dData_dList.C_List__x58__x58_ (1732584193, (B_dData_dList.C_List__x58__x58_ (4023233417, (B_dData_dList.C_List__x58__x58_ (2562383102, (B_dData_dList.C_List__x58__x58_ (271733878, (B_dData_dList.C_List__x58__x58_ (3285377520, B_dData_dList.C_List_Nil))))))))))

# 41 "Base/Data/Sha1.vuna"
let v_zeroBytes = (fun (k : int) -> ((B_dData_dList.v_map (fun (_u : int) -> 0)) ((B_dData_dList.v_range 0) k)))

# 53 "Base/Data/Sha1.vuna"
let v_bigEndian32 = (fun (x : int) -> (B_dData_dList.C_List__x58__x58_ ((B_dData_dBits.v_mask8 ((B_dData_dBits.v_shr32 x) 24)), (B_dData_dList.C_List__x58__x58_ ((B_dData_dBits.v_mask8 ((B_dData_dBits.v_shr32 x) 16)), (B_dData_dList.C_List__x58__x58_ ((B_dData_dBits.v_mask8 ((B_dData_dBits.v_shr32 x) 8)), (B_dData_dList.C_List__x58__x58_ ((B_dData_dBits.v_mask8 x), B_dData_dList.C_List_Nil)))))))))

# 45 "Base/Data/Sha1.vuna"
let v_bigEndian64 = (fun (bits : int) -> (let hi = (if 4294967296 = 0 then failwith "division by zero" else bits / 4294967296) in (let lo = (bits - (hi * 4294967296)) in ((B_dData_dList.v_append (v_bigEndian32 hi)) (v_bigEndian32 lo)))))

# 33 "Base/Data/Sha1.vuna"
let v_padMessage = (fun (bs : int B_dData_dList.t_List) (n : int) -> (let padded = ((if 64 = 0 then failwith "division by zero" else ((n + 9) + 63) / 64) * 64) in (let zeros = ((padded - n) - 9) in ((B_dData_dList.v_append bs) ((B_dData_dList.v_append (B_dData_dList.C_List__x58__x58_ (128, B_dData_dList.C_List_Nil))) ((B_dData_dList.v_append (v_zeroBytes zeros)) (v_bigEndian64 (n * 8))))))))

# 73 "Base/Data/Sha1.vuna"
let v_pack4 = (fun (mc0 : int B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__0, dtb__1) -> (match dtb__1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__2, dtb__3) -> (match dtb__3 with
  | B_dData_dList.C_List__x58__x58_ (dtb__4, dtb__5) -> (match dtb__5 with
  | B_dData_dList.C_List__x58__x58_ (dtb__6, dtb__7) -> ((((dtb__0 * 16777216) + (dtb__2 * 65536)) + (dtb__4 * 256)) + dtb__6)
  | _ -> 0
)
  | _ -> 0
)
  | _ -> 0
)
  | _ -> 0
))

# 69 "Base/Data/Sha1.vuna"
let v_wordsOf = (fun (blk : int B_dData_dList.t_List) -> ((B_dData_dList.v_map (fun (i : int) -> (v_pack4 ((B_dData_dList.v_drop (i * 4)) blk)))) ((B_dData_dList.v_range 0) 16)))

# 90 "Base/Data/Sha1.vuna"
let v_headAfter = (fun (k : int) (xs : int B_dData_dList.t_List) -> (match ((B_dData_dList.v_drop k) xs) with
  | B_dData_dList.C_List__x58__x58_ (dtb__8, dtb__9) -> dtb__8
  | B_dData_dList.C_List_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))

# 82 "Base/Data/Sha1.vuna"
let v_expandStep = (fun (w : int B_dData_dList.t_List) (_u : int) -> (let rev = (B_dData_dList.v_reverse w) in (let x = ((B_dData_dBits.v_bxor ((B_dData_dBits.v_bxor ((B_dData_dBits.v_bxor ((v_headAfter 2) rev)) ((v_headAfter 7) rev))) ((v_headAfter 13) rev))) ((v_headAfter 15) rev)) in ((B_dData_dList.v_append w) (B_dData_dList.C_List__x58__x58_ (((B_dData_dBits.v_rol32 x) 1), B_dData_dList.C_List_Nil))))))

# 78 "Base/Data/Sha1.vuna"
let v_expand = (fun (w : int B_dData_dList.t_List) -> (((B_dData_dList.v_foldl v_expandStep) w) ((B_dData_dList.v_range 0) 64)))

# 108 "Base/Data/Sha1.vuna"
let v_roundF = (fun (t : int) (b : int) (c : int) (d : int) -> (if (t < 20) then ((B_dData_dBits.v_bor ((B_dData_dBits.v_band b) c)) ((B_dData_dBits.v_band (B_dData_dBits.v_bnot b)) d)) else (if (t < 40) then ((B_dData_dBits.v_bxor b) ((B_dData_dBits.v_bxor c) d)) else (if (t < 60) then ((B_dData_dBits.v_bor ((B_dData_dBits.v_bor ((B_dData_dBits.v_band b) c)) ((B_dData_dBits.v_band b) d))) ((B_dData_dBits.v_band c) d)) else ((B_dData_dBits.v_bxor b) ((B_dData_dBits.v_bxor c) d))))))

# 117 "Base/Data/Sha1.vuna"
let v_roundK = (fun (t : int) -> (if (t < 20) then 1518500249 else (if (t < 40) then 1859775393 else (if (t < 60) then 2400959708 else 3395469782))))

# 97 "Base/Data/Sha1.vuna"
let v_sha1Round = (fun (mc0 : (int B_dData_dList.t_List, int B_dData_dList.t_List) B_dData_dPair.t_Pair) (mc1 : int) -> (match mc0 with
  | { B_dData_dPair.f_Pair_first = dtb__10; B_dData_dPair.f_Pair_second = dtb__11 } -> (match dtb__10 with
  | B_dData_dList.C_List__x58__x58_ (dtb__12, dtb__13) -> (let nd_uscrut9 = dtb__11 in (match nd_uscrut9 with
  | B_dData_dList.C_List__x58__x58_ (dtb__14, dtb__15) -> (match dtb__15 with
  | B_dData_dList.C_List__x58__x58_ (dtb__16, dtb__17) -> (match dtb__17 with
  | B_dData_dList.C_List__x58__x58_ (dtb__18, dtb__19) -> (match dtb__19 with
  | B_dData_dList.C_List__x58__x58_ (dtb__20, dtb__21) -> (match dtb__21 with
  | B_dData_dList.C_List__x58__x58_ (dtb__22, dtb__23) -> (match dtb__23 with
  | B_dData_dList.C_List_Nil -> (let tmp = ((B_dData_dBits.v_add32 ((B_dData_dBits.v_add32 ((B_dData_dBits.v_add32 ((B_dData_dBits.v_add32 ((B_dData_dBits.v_rol32 dtb__14) 5)) ((((v_roundF mc1) dtb__16) dtb__18) dtb__20))) dtb__22)) (v_roundK mc1))) dtb__12) in { B_dData_dPair.f_Pair_first = dtb__13; B_dData_dPair.f_Pair_second = (B_dData_dList.C_List__x58__x58_ (tmp, (B_dData_dList.C_List__x58__x58_ (dtb__14, (B_dData_dList.C_List__x58__x58_ (((B_dData_dBits.v_rol32 dtb__16) 30), (B_dData_dList.C_List__x58__x58_ (dtb__18, (B_dData_dList.C_List__x58__x58_ (dtb__20, B_dData_dList.C_List_Nil)))))))))) })
  | _ -> { B_dData_dPair.f_Pair_first = dtb__10; B_dData_dPair.f_Pair_second = dtb__11 }
)
  | _ -> { B_dData_dPair.f_Pair_first = dtb__10; B_dData_dPair.f_Pair_second = dtb__11 }
)
  | _ -> { B_dData_dPair.f_Pair_first = dtb__10; B_dData_dPair.f_Pair_second = dtb__11 }
)
  | _ -> { B_dData_dPair.f_Pair_first = dtb__10; B_dData_dPair.f_Pair_second = dtb__11 }
)
  | _ -> { B_dData_dPair.f_Pair_first = dtb__10; B_dData_dPair.f_Pair_second = dtb__11 }
)
  | _ -> { B_dData_dPair.f_Pair_first = dtb__10; B_dData_dPair.f_Pair_second = dtb__11 }
))
  | B_dData_dList.C_List_Nil -> { B_dData_dPair.f_Pair_first = dtb__10; B_dData_dPair.f_Pair_second = dtb__11 }
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 57 "Base/Data/Sha1.vuna"
let v_compressBlock = (fun (mc0 : int B_dData_dList.t_List) (mc1 : int B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__24, dtb__25) -> (match dtb__25 with
  | B_dData_dList.C_List__x58__x58_ (dtb__26, dtb__27) -> (match dtb__27 with
  | B_dData_dList.C_List__x58__x58_ (dtb__28, dtb__29) -> (match dtb__29 with
  | B_dData_dList.C_List__x58__x58_ (dtb__30, dtb__31) -> (match dtb__31 with
  | B_dData_dList.C_List__x58__x58_ (dtb__32, dtb__33) -> (match dtb__33 with
  | B_dData_dList.C_List_Nil -> (let st = (((B_dData_dList.v_foldl v_sha1Round) { B_dData_dPair.f_Pair_first = (v_expand (v_wordsOf mc1)); B_dData_dPair.f_Pair_second = (B_dData_dList.C_List__x58__x58_ (dtb__24, (B_dData_dList.C_List__x58__x58_ (dtb__26, (B_dData_dList.C_List__x58__x58_ (dtb__28, (B_dData_dList.C_List__x58__x58_ (dtb__30, (B_dData_dList.C_List__x58__x58_ (dtb__32, B_dData_dList.C_List_Nil)))))))))) }) ((B_dData_dList.v_range 0) 80)) in (match st with
  | { B_dData_dPair.f_Pair_first = dtb__34; B_dData_dPair.f_Pair_second = dtb__35 } -> (let nd_uscrut23 = dtb__35 in (match nd_uscrut23 with
  | B_dData_dList.C_List__x58__x58_ (dtb__36, dtb__37) -> (match dtb__37 with
  | B_dData_dList.C_List__x58__x58_ (dtb__38, dtb__39) -> (match dtb__39 with
  | B_dData_dList.C_List__x58__x58_ (dtb__40, dtb__41) -> (match dtb__41 with
  | B_dData_dList.C_List__x58__x58_ (dtb__42, dtb__43) -> (match dtb__43 with
  | B_dData_dList.C_List__x58__x58_ (dtb__44, dtb__45) -> (match dtb__45 with
  | B_dData_dList.C_List_Nil -> (B_dData_dList.C_List__x58__x58_ (((B_dData_dBits.v_add32 dtb__24) dtb__36), (B_dData_dList.C_List__x58__x58_ (((B_dData_dBits.v_add32 dtb__26) dtb__38), (B_dData_dList.C_List__x58__x58_ (((B_dData_dBits.v_add32 dtb__28) dtb__40), (B_dData_dList.C_List__x58__x58_ (((B_dData_dBits.v_add32 dtb__30) dtb__42), (B_dData_dList.C_List__x58__x58_ (((B_dData_dBits.v_add32 dtb__32) dtb__44), B_dData_dList.C_List_Nil))))))))))
  | _ -> mc0
)
  | _ -> mc0
)
  | _ -> mc0
)
  | _ -> mc0
)
  | _ -> mc0
)
  | _ -> mc0
))
  | _ -> failwith "DT: impossible branch"
))
  | _ -> mc0
)
  | _ -> mc0
)
  | _ -> mc0
)
  | _ -> mc0
)
  | _ -> mc0
)
  | _ -> mc0
))

# 124 "Base/Data/Sha1.vuna"
let v_wordsToBytes = (fun (hs : int B_dData_dList.t_List) -> ((B_dData_dList.v_concatMap v_bigEndian32) hs))

# 20 "Base/Data/Sha1.vuna"
let v_sha1Raw = (fun (s : string) -> (let n = (String.length s) in (let body = ((v_padMessage (B_dData_dList.dtp_unpack s)) n) in (let blocks = ((B_dData_dList.v_map (fun (i : int) -> ((B_dData_dList.v_take 64) ((B_dData_dList.v_drop (i * 64)) body)))) ((B_dData_dList.v_range 0) (if 64 = 0 then failwith "division by zero" else ((n + 9) + 63) / 64))) in (v_wordsToBytes (((B_dData_dList.v_foldl v_compressBlock) v_sha1Init) blocks))))))

# 132 "Base/Data/Sha1.vuna"
let v_hexDigit = (fun (d : int) -> (if (d < 10) then (B_dData_dList.dtp_pack (B_dData_dList.C_List__x58__x58_ ((48 + d), B_dData_dList.C_List_Nil))) else (B_dData_dList.dtp_pack (B_dData_dList.C_List__x58__x58_ ((87 + d), B_dData_dList.C_List_Nil)))))

# 128 "Base/Data/Sha1.vuna"
let v_hexByte = (fun (b : int) -> (B_dData_dList.dtp_concatMany (B_dData_dList.C_List__x58__x58_ ((v_hexDigit (if 16 = 0 then failwith "division by zero" else b / 16)), (B_dData_dList.C_List__x58__x58_ ((v_hexDigit (b - ((if 16 = 0 then failwith "division by zero" else b / 16) * 16))), B_dData_dList.C_List_Nil))))))

# 16 "Base/Data/Sha1.vuna"
let v_sha1 = (fun (s : string) -> (B_dData_dList.dtp_concatMany ((B_dData_dList.v_map v_hexByte) (v_sha1Raw s))))
