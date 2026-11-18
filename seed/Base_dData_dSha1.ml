open Vuna_runtime
# 29 "Base/Data/Sha1.vuna"
let v_Base_dData_dSha1_dsha1Init = (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (1732584193, (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (4023233417, (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (2562383102, (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (271733878, (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (3285377520, Base_dData_dList.C_Base_dData_dList_dList_Nil))))))))))

# 41 "Base/Data/Sha1.vuna"
let v_Base_dData_dSha1_dzeroBytes = (fun k -> ((Base_dData_dList.v_Base_dData_dList_dmap (fun (_u : int) -> 0)) ((Base_dData_dList.v_Base_dData_dList_drange 0) k)))

# 53 "Base/Data/Sha1.vuna"
let v_Base_dData_dSha1_dbigEndian32 = (fun x -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ((Base_dData_dBits.v_Base_dData_dBits_dmask8 ((Base_dData_dBits.v_Base_dData_dBits_dshr32 x) 24)), (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ((Base_dData_dBits.v_Base_dData_dBits_dmask8 ((Base_dData_dBits.v_Base_dData_dBits_dshr32 x) 16)), (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ((Base_dData_dBits.v_Base_dData_dBits_dmask8 ((Base_dData_dBits.v_Base_dData_dBits_dshr32 x) 8)), (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ((Base_dData_dBits.v_Base_dData_dBits_dmask8 x), Base_dData_dList.C_Base_dData_dList_dList_Nil)))))))))

# 45 "Base/Data/Sha1.vuna"
let v_Base_dData_dSha1_dbigEndian64 = (fun bits -> ((fun hi -> ((fun lo -> ((Base_dData_dList.v_Base_dData_dList_dappend (v_Base_dData_dSha1_dbigEndian32 hi)) (v_Base_dData_dSha1_dbigEndian32 lo))) (bits - (hi * 4294967296)))) (if 4294967296 = 0 then failwith "division by zero" else bits / 4294967296)))

# 33 "Base/Data/Sha1.vuna"
let v_Base_dData_dSha1_dpadMessage = (fun bs n -> ((fun padded -> ((fun zeros -> ((Base_dData_dList.v_Base_dData_dList_dappend bs) ((Base_dData_dList.v_Base_dData_dList_dappend (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (128, Base_dData_dList.C_Base_dData_dList_dList_Nil))) ((Base_dData_dList.v_Base_dData_dList_dappend (v_Base_dData_dSha1_dzeroBytes zeros)) (v_Base_dData_dSha1_dbigEndian64 (n * 8)))))) ((padded - n) - 9))) ((if 64 = 0 then failwith "division by zero" else ((n + 9) + 63) / 64) * 64)))

# 75 "Base/Data/Sha1.vuna"
let v_Base_dData_dSha1_dpack4 = (fun xs -> ((fun nd_uscrut1 -> (match nd_uscrut1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__0, dtb__1) -> (match dtb__1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__2, dtb__3) -> (match dtb__3 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__4, dtb__5) -> (match dtb__5 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__6, dtb__7) -> ((((dtb__0 * 16777216) + (dtb__2 * 65536)) + (dtb__4 * 256)) + dtb__6)
  | _ -> 0
)
  | _ -> 0
)
  | _ -> 0
)
  | _ -> 0
)) xs))

# 71 "Base/Data/Sha1.vuna"
let v_Base_dData_dSha1_dwordsOf = (fun blk -> ((Base_dData_dList.v_Base_dData_dList_dmap (fun (i : int) -> (v_Base_dData_dSha1_dpack4 ((Base_dData_dList.v_Base_dData_dList_ddrop (i * 4)) blk)))) ((Base_dData_dList.v_Base_dData_dList_drange 0) 16)))

# 94 "Base/Data/Sha1.vuna"
let v_Base_dData_dSha1_dheadAfter = (fun k xs -> (match ((Base_dData_dList.v_Base_dData_dList_ddrop k) xs) with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__8, dtb__9) -> dtb__8
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))

# 86 "Base/Data/Sha1.vuna"
let v_Base_dData_dSha1_dexpandStep = (fun w _u -> ((fun rev -> ((fun x -> ((Base_dData_dList.v_Base_dData_dList_dappend w) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (((Base_dData_dBits.v_Base_dData_dBits_drol32 x) 1), Base_dData_dList.C_Base_dData_dList_dList_Nil)))) ((Base_dData_dBits.v_Base_dData_dBits_dbxor ((Base_dData_dBits.v_Base_dData_dBits_dbxor ((Base_dData_dBits.v_Base_dData_dBits_dbxor ((v_Base_dData_dSha1_dheadAfter 2) rev)) ((v_Base_dData_dSha1_dheadAfter 7) rev))) ((v_Base_dData_dSha1_dheadAfter 13) rev))) ((v_Base_dData_dSha1_dheadAfter 15) rev)))) (Base_dData_dList.v_Base_dData_dList_dreverse w)))

# 82 "Base/Data/Sha1.vuna"
let v_Base_dData_dSha1_dexpand = (fun w -> (((Base_dData_dList.v_Base_dData_dList_dfoldl v_Base_dData_dSha1_dexpandStep) w) ((Base_dData_dList.v_Base_dData_dList_drange 0) 64)))

# 116 "Base/Data/Sha1.vuna"
let v_Base_dData_dSha1_droundF = (fun t b c d -> (if (t < 20) then ((Base_dData_dBits.v_Base_dData_dBits_dbor ((Base_dData_dBits.v_Base_dData_dBits_dband b) c)) ((Base_dData_dBits.v_Base_dData_dBits_dband (Base_dData_dBits.v_Base_dData_dBits_dbnot b)) d)) else (if (t < 40) then ((Base_dData_dBits.v_Base_dData_dBits_dbxor b) ((Base_dData_dBits.v_Base_dData_dBits_dbxor c) d)) else (if (t < 60) then ((Base_dData_dBits.v_Base_dData_dBits_dbor ((Base_dData_dBits.v_Base_dData_dBits_dbor ((Base_dData_dBits.v_Base_dData_dBits_dband b) c)) ((Base_dData_dBits.v_Base_dData_dBits_dband b) d))) ((Base_dData_dBits.v_Base_dData_dBits_dband c) d)) else ((Base_dData_dBits.v_Base_dData_dBits_dbxor b) ((Base_dData_dBits.v_Base_dData_dBits_dbxor c) d))))))

# 125 "Base/Data/Sha1.vuna"
let v_Base_dData_dSha1_droundK = (fun t -> (if (t < 20) then 1518500249 else (if (t < 40) then 1859775393 else (if (t < 60) then 2400959708 else 3395469782))))

# 101 "Base/Data/Sha1.vuna"
let v_Base_dData_dSha1_dsha1Round = (fun st t -> (match st with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__10; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__11 } -> (match dtb__10 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__10; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__11 }
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__12, dtb__13) -> ((fun nd_uscrut9 -> (match nd_uscrut9 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__14, dtb__15) -> (match dtb__15 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__16, dtb__17) -> (match dtb__17 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__18, dtb__19) -> (match dtb__19 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__20, dtb__21) -> (match dtb__21 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__22, dtb__23) -> (match dtb__23 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> ((fun tmp -> { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__13; Base_dData_dPair.f_Base_dData_dPair_dPair_second = (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (tmp, (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__14, (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (((Base_dData_dBits.v_Base_dData_dBits_drol32 dtb__16) 30), (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__18, (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__20, Base_dData_dList.C_Base_dData_dList_dList_Nil)))))))))) }) ((Base_dData_dBits.v_Base_dData_dBits_dadd32 ((Base_dData_dBits.v_Base_dData_dBits_dadd32 ((Base_dData_dBits.v_Base_dData_dBits_dadd32 ((Base_dData_dBits.v_Base_dData_dBits_dadd32 ((Base_dData_dBits.v_Base_dData_dBits_drol32 dtb__14) 5)) ((((v_Base_dData_dSha1_droundF t) dtb__16) dtb__18) dtb__20))) dtb__22)) (v_Base_dData_dSha1_droundK t))) dtb__12))
  | _ -> { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__10; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__11 }
)
  | _ -> { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__10; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__11 }
)
  | _ -> { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__10; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__11 }
)
  | _ -> { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__10; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__11 }
)
  | _ -> { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__10; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__11 }
)
  | _ -> { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__10; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__11 }
)) dtb__11)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 57 "Base/Data/Sha1.vuna"
let v_Base_dData_dSha1_dcompressBlock = (fun hs blk -> ((fun nd_uscrut2 -> (match nd_uscrut2 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__24, dtb__25) -> (match dtb__25 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__26, dtb__27) -> (match dtb__27 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__28, dtb__29) -> (match dtb__29 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__30, dtb__31) -> (match dtb__31 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__32, dtb__33) -> (match dtb__33 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> ((fun st -> (match st with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__34; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__35 } -> ((fun nd_uscrut24 -> (match nd_uscrut24 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__36, dtb__37) -> (match dtb__37 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__38, dtb__39) -> (match dtb__39 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__40, dtb__41) -> (match dtb__41 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__42, dtb__43) -> (match dtb__43 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__44, dtb__45) -> (match dtb__45 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (((Base_dData_dBits.v_Base_dData_dBits_dadd32 dtb__24) dtb__36), (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (((Base_dData_dBits.v_Base_dData_dBits_dadd32 dtb__26) dtb__38), (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (((Base_dData_dBits.v_Base_dData_dBits_dadd32 dtb__28) dtb__40), (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (((Base_dData_dBits.v_Base_dData_dBits_dadd32 dtb__30) dtb__42), (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (((Base_dData_dBits.v_Base_dData_dBits_dadd32 dtb__32) dtb__44), Base_dData_dList.C_Base_dData_dList_dList_Nil))))))))))
  | _ -> hs
)
  | _ -> hs
)
  | _ -> hs
)
  | _ -> hs
)
  | _ -> hs
)
  | _ -> hs
)) dtb__35)
  | _ -> failwith "DT: impossible branch"
)) (((Base_dData_dList.v_Base_dData_dList_dfoldl v_Base_dData_dSha1_dsha1Round) { Base_dData_dPair.f_Base_dData_dPair_dPair_first = (v_Base_dData_dSha1_dexpand (v_Base_dData_dSha1_dwordsOf blk)); Base_dData_dPair.f_Base_dData_dPair_dPair_second = (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__24, (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__26, (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__28, (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__30, (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__32, Base_dData_dList.C_Base_dData_dList_dList_Nil)))))))))) }) ((Base_dData_dList.v_Base_dData_dList_drange 0) 80)))
  | _ -> hs
)
  | _ -> hs
)
  | _ -> hs
)
  | _ -> hs
)
  | _ -> hs
)
  | _ -> hs
)) hs))

# 132 "Base/Data/Sha1.vuna"
let v_Base_dData_dSha1_dwordsToBytes = (fun hs -> ((Base_dData_dList.v_Base_dData_dList_dconcatMap v_Base_dData_dSha1_dbigEndian32) hs))

# 20 "Base/Data/Sha1.vuna"
let v_Base_dData_dSha1_dsha1Raw = (fun s -> ((fun n -> ((fun body -> ((fun blocks -> (v_Base_dData_dSha1_dwordsToBytes (((Base_dData_dList.v_Base_dData_dList_dfoldl v_Base_dData_dSha1_dcompressBlock) v_Base_dData_dSha1_dsha1Init) blocks))) ((Base_dData_dList.v_Base_dData_dList_dmap (fun (i : int) -> ((Base_dData_dList.v_Base_dData_dList_dtake 64) ((Base_dData_dList.v_Base_dData_dList_ddrop (i * 64)) body)))) ((Base_dData_dList.v_Base_dData_dList_drange 0) (if 64 = 0 then failwith "division by zero" else ((n + 9) + 63) / 64))))) ((v_Base_dData_dSha1_dpadMessage (Base_dData_dList.dtp_unpack s)) n))) (bi_strLength s)))

# 140 "Base/Data/Sha1.vuna"
let v_Base_dData_dSha1_dhexDigit = (fun d -> (if (d < 10) then (Base_dData_dList.dtp_pack (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ((48 + d), Base_dData_dList.C_Base_dData_dList_dList_Nil))) else (Base_dData_dList.dtp_pack (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ((87 + d), Base_dData_dList.C_Base_dData_dList_dList_Nil)))))

# 136 "Base/Data/Sha1.vuna"
let v_Base_dData_dSha1_dhexByte = (fun b -> (Base_dData_dList.dtp_concatMany (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ((v_Base_dData_dSha1_dhexDigit (if 16 = 0 then failwith "division by zero" else b / 16)), (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ((v_Base_dData_dSha1_dhexDigit (b - ((if 16 = 0 then failwith "division by zero" else b / 16) * 16))), Base_dData_dList.C_Base_dData_dList_dList_Nil))))))

# 16 "Base/Data/Sha1.vuna"
let v_Base_dData_dSha1_dsha1 = (fun s -> (Base_dData_dList.dtp_concatMany ((Base_dData_dList.v_Base_dData_dList_dmap v_Base_dData_dSha1_dhexByte) (v_Base_dData_dSha1_dsha1Raw s))))
