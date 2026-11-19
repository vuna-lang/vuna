open Vuna_runtime
# 56 "Base/Data/Base64.vuna"
let v_listLen = (fun (xs : int B_dData_dList.t_List) -> (B_dData_dList.v_length xs))

# 52 "Base/Data/Base64.vuna"
let v_groups = (fun (k : int) (xs : int B_dData_dList.t_List) -> ((B_dData_dList.v_map (fun (i : int) -> ((B_dData_dList.v_take k) ((B_dData_dList.v_drop (i * k)) xs)))) ((B_dData_dList.v_range 0) (if k = 0 then failwith "division by zero" else (((v_listLen xs) + k) - 1) / k))))

# 60 "Base/Data/Base64.vuna"
let v_at = (fun (xs : int B_dData_dList.t_List) (i : int) -> (match ((B_dData_dList.v_drop i) xs) with
  | B_dData_dList.C_List__x58__x58_ (dtb__0, dtb__1) -> dtb__0
  | B_dData_dList.C_List_Nil -> -1
  | _ -> failwith "DT: impossible branch"
))

# 45 "Base/Data/Base64.vuna"
let v_paddingCount = (fun (bs : int B_dData_dList.t_List) (n : int) -> (if (n = 0) then 0 else (if (((v_at bs) (n - 1)) = 61) then (if (if (n >= 2) then (((v_at bs) (n - 2)) = 61) else false) then 2 else 1) else 0)))

# 67 "Base/Data/Base64.vuna"
let v_zeroBytes = (fun (k : int) -> ((B_dData_dList.v_map (fun (_u : int) -> 0)) ((B_dData_dList.v_range 0) k)))

# 85 "Base/Data/Base64.vuna"
let v_encodeDigit = (fun (n : int) -> (if (n < 26) then (B_dData_dList.dtp_pack (B_dData_dList.C_List__x58__x58_ ((65 + n), B_dData_dList.C_List_Nil))) else (if (n < 52) then (B_dData_dList.dtp_pack (B_dData_dList.C_List__x58__x58_ ((71 + n), B_dData_dList.C_List_Nil))) else (if (n < 62) then (B_dData_dList.dtp_pack (B_dData_dList.C_List__x58__x58_ (((48 + n) - 52), B_dData_dList.C_List_Nil))) else (if (n = 62) then "+" else "/")))))

# 71 "Base/Data/Base64.vuna"
let v_encodeGroup = (fun (g : int B_dData_dList.t_List) -> ((fun nd_uscrut1 -> (match nd_uscrut1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__2, dtb__3) -> (match dtb__3 with
  | B_dData_dList.C_List__x58__x58_ (dtb__4, dtb__5) -> (match dtb__5 with
  | B_dData_dList.C_List__x58__x58_ (dtb__6, dtb__7) -> (match dtb__7 with
  | B_dData_dList.C_List_Nil -> (B_dData_dList.dtp_concatMany (B_dData_dList.C_List__x58__x58_ ((v_encodeDigit ((B_dData_dBits.v_shr32 dtb__2) 2)), (B_dData_dList.C_List__x58__x58_ ((v_encodeDigit ((B_dData_dBits.v_bor ((B_dData_dBits.v_shl32 ((B_dData_dBits.v_band dtb__2) 3)) 4)) ((B_dData_dBits.v_shr32 dtb__4) 4))), (B_dData_dList.C_List__x58__x58_ ((v_encodeDigit ((B_dData_dBits.v_bor ((B_dData_dBits.v_shl32 ((B_dData_dBits.v_band dtb__4) 15)) 2)) ((B_dData_dBits.v_shr32 dtb__6) 6))), (B_dData_dList.C_List__x58__x58_ ((v_encodeDigit ((B_dData_dBits.v_band dtb__6) 63)), B_dData_dList.C_List_Nil)))))))))
  | _ -> ""
)
  | B_dData_dList.C_List_Nil -> (B_dData_dList.dtp_concatMany (B_dData_dList.C_List__x58__x58_ ((v_encodeDigit ((B_dData_dBits.v_shr32 dtb__2) 2)), (B_dData_dList.C_List__x58__x58_ ((v_encodeDigit ((B_dData_dBits.v_bor ((B_dData_dBits.v_shl32 ((B_dData_dBits.v_band dtb__2) 3)) 4)) ((B_dData_dBits.v_shr32 dtb__4) 4))), (B_dData_dList.C_List__x58__x58_ ((v_encodeDigit ((B_dData_dBits.v_shl32 ((B_dData_dBits.v_band dtb__4) 15)) 2)), (B_dData_dList.C_List__x58__x58_ ("=", B_dData_dList.C_List_Nil)))))))))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (B_dData_dList.dtp_concatMany (B_dData_dList.C_List__x58__x58_ ((v_encodeDigit ((B_dData_dBits.v_shr32 dtb__2) 2)), (B_dData_dList.C_List__x58__x58_ ((v_encodeDigit ((B_dData_dBits.v_shl32 ((B_dData_dBits.v_band dtb__2) 3)) 4)), (B_dData_dList.C_List__x58__x58_ ("==", B_dData_dList.C_List_Nil)))))))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> ""
  | _ -> failwith "DT: impossible branch"
)) g))

# 18 "Base/Data/Base64.vuna"
let v_base64Encode = (fun (bs : int B_dData_dList.t_List) -> (B_dData_dList.dtp_concatMany ((B_dData_dList.v_map v_encodeGroup) ((v_groups 3) bs))))

# 22 "Base/Data/Base64.vuna"
let v_base64EncodeString = (fun (s : string) -> (v_base64Encode (B_dData_dList.dtp_unpack s)))

# 94 "Base/Data/Base64.vuna"
let v_decodeDigit = (fun (c : int) -> (if (if (c >= 65) then (c <= 90) else false) then (B_dData_dMaybe.C_Maybe_Just ((c - 65))) else (if (if (c >= 97) then (c <= 122) else false) then (B_dData_dMaybe.C_Maybe_Just ((c - 71))) else (if (if (c >= 48) then (c <= 57) else false) then (B_dData_dMaybe.C_Maybe_Just ((c + 4))) else (if (c = 43) then (B_dData_dMaybe.C_Maybe_Just (62)) else (if (c = 47) then (B_dData_dMaybe.C_Maybe_Just (63)) else B_dData_dMaybe.C_Maybe_Nothing))))))

# 105 "Base/Data/Base64.vuna"
let v_decodeGroup = (fun (g : int B_dData_dList.t_List) -> ((fun nd_uscrut1 -> (match nd_uscrut1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__8, dtb__9) -> (match dtb__9 with
  | B_dData_dList.C_List__x58__x58_ (dtb__10, dtb__11) -> (match dtb__11 with
  | B_dData_dList.C_List__x58__x58_ (dtb__12, dtb__13) -> (match dtb__13 with
  | B_dData_dList.C_List__x58__x58_ (dtb__14, dtb__15) -> (match dtb__15 with
  | B_dData_dList.C_List_Nil -> (B_dData_dMaybe.C_Maybe_Just ((B_dData_dList.C_List__x58__x58_ ((B_dData_dBits.v_mask8 ((B_dData_dBits.v_bor ((B_dData_dBits.v_shl32 dtb__8) 2)) ((B_dData_dBits.v_shr32 dtb__10) 4))), (B_dData_dList.C_List__x58__x58_ ((B_dData_dBits.v_mask8 ((B_dData_dBits.v_bor ((B_dData_dBits.v_shl32 ((B_dData_dBits.v_band dtb__10) 15)) 4)) ((B_dData_dBits.v_shr32 dtb__12) 2))), (B_dData_dList.C_List__x58__x58_ ((B_dData_dBits.v_mask8 ((B_dData_dBits.v_bor ((B_dData_dBits.v_shl32 ((B_dData_dBits.v_band dtb__12) 3)) 6)) dtb__14)), B_dData_dList.C_List_Nil))))))))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)) g))

# 121 "Base/Data/Base64.vuna"
let v_step = (fun acc m -> (match acc with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb__16) -> (match m with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb__17) -> (B_dData_dMaybe.C_Maybe_Just ((B_dData_dList.C_List__x58__x58_ (dtb__17, dtb__16))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 114 "Base/Data/Base64.vuna"
let v_sequenceMaybe = (fun ms -> (match (((B_dData_dList.v_foldl v_step) (B_dData_dMaybe.C_Maybe_Just (B_dData_dList.C_List_Nil))) ms) with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb__18) -> (B_dData_dMaybe.C_Maybe_Just ((B_dData_dList.v_reverse dtb__18)))
  | _ -> failwith "DT: impossible branch"
))

# 26 "Base/Data/Base64.vuna"
let v_base64Decode = (fun (s : string) -> ((fun bs -> ((fun n -> ((fun pads -> (if (n = 0) then (B_dData_dMaybe.C_Maybe_Just (B_dData_dList.C_List_Nil)) else (if (if ((n - ((if 4 = 0 then failwith "division by zero" else n / 4) * 4)) = 0) then (pads <= 2) else false) then (match (v_sequenceMaybe ((B_dData_dList.v_map v_decodeDigit) ((B_dData_dList.v_take (n - pads)) bs))) with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb__19) -> (match (v_sequenceMaybe ((B_dData_dList.v_map v_decodeGroup) ((v_groups 4) ((B_dData_dList.v_append dtb__19) (v_zeroBytes pads))))) with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb__20) -> (B_dData_dMaybe.C_Maybe_Just ((B_dData_dList.v_reverse ((B_dData_dList.v_drop pads) (B_dData_dList.v_reverse ((B_dData_dList.v_concatMap (fun (c : int B_dData_dList.t_List) -> c)) dtb__20))))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
) else B_dData_dMaybe.C_Maybe_Nothing))) ((v_paddingCount bs) n))) (bi_strLength s))) (B_dData_dList.dtp_unpack s)))
