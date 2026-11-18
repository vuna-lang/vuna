open Vuna_runtime
# 56 "Base/Data/Base64.vuna"
let v_Base_dData_dBase64_dlistLen = (fun xs -> (Base_dData_dList.v_Base_dData_dList_dlength xs))

# 52 "Base/Data/Base64.vuna"
let v_Base_dData_dBase64_dgroups = (fun k xs -> ((Base_dData_dList.v_Base_dData_dList_dmap (fun (i : int) -> ((Base_dData_dList.v_Base_dData_dList_dtake k) ((Base_dData_dList.v_Base_dData_dList_ddrop (i * k)) xs)))) ((Base_dData_dList.v_Base_dData_dList_drange 0) (if k = 0 then failwith "division by zero" else (((v_Base_dData_dBase64_dlistLen xs) + k) - 1) / k))))

# 60 "Base/Data/Base64.vuna"
let v_Base_dData_dBase64_dat = (fun xs i -> (match ((Base_dData_dList.v_Base_dData_dList_ddrop i) xs) with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__0, dtb__1) -> dtb__0
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> -1
  | _ -> failwith "DT: impossible branch"
))

# 45 "Base/Data/Base64.vuna"
let v_Base_dData_dBase64_dpaddingCount = (fun bs n -> (if (n = 0) then 0 else (if (((v_Base_dData_dBase64_dat bs) (n - 1)) = 61) then (if (if (n >= 2) then (((v_Base_dData_dBase64_dat bs) (n - 2)) = 61) else false) then 2 else 1) else 0)))

# 67 "Base/Data/Base64.vuna"
let v_Base_dData_dBase64_dzeroBytes = (fun k -> ((Base_dData_dList.v_Base_dData_dList_dmap (fun (_u : int) -> 0)) ((Base_dData_dList.v_Base_dData_dList_drange 0) k)))

# 85 "Base/Data/Base64.vuna"
let v_Base_dData_dBase64_dencodeDigit = (fun n -> (if (n < 26) then (Base_dData_dList.dtp_pack (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ((65 + n), Base_dData_dList.C_Base_dData_dList_dList_Nil))) else (if (n < 52) then (Base_dData_dList.dtp_pack (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ((71 + n), Base_dData_dList.C_Base_dData_dList_dList_Nil))) else (if (n < 62) then (Base_dData_dList.dtp_pack (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (((48 + n) - 52), Base_dData_dList.C_Base_dData_dList_dList_Nil))) else (if (n = 62) then "+" else "/")))))

# 71 "Base/Data/Base64.vuna"
let v_Base_dData_dBase64_dencodeGroup = (fun g -> ((fun nd_uscrut1 -> (match nd_uscrut1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__2, dtb__3) -> (match dtb__3 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__4, dtb__5) -> (match dtb__5 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__6, dtb__7) -> (match dtb__7 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Base_dData_dList.dtp_concatMany (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ((v_Base_dData_dBase64_dencodeDigit ((Base_dData_dBits.v_Base_dData_dBits_dshr32 dtb__2) 2)), (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ((v_Base_dData_dBase64_dencodeDigit ((Base_dData_dBits.v_Base_dData_dBits_dbor ((Base_dData_dBits.v_Base_dData_dBits_dshl32 ((Base_dData_dBits.v_Base_dData_dBits_dband dtb__2) 3)) 4)) ((Base_dData_dBits.v_Base_dData_dBits_dshr32 dtb__4) 4))), (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ((v_Base_dData_dBase64_dencodeDigit ((Base_dData_dBits.v_Base_dData_dBits_dbor ((Base_dData_dBits.v_Base_dData_dBits_dshl32 ((Base_dData_dBits.v_Base_dData_dBits_dband dtb__4) 15)) 2)) ((Base_dData_dBits.v_Base_dData_dBits_dshr32 dtb__6) 6))), (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ((v_Base_dData_dBase64_dencodeDigit ((Base_dData_dBits.v_Base_dData_dBits_dband dtb__6) 63)), Base_dData_dList.C_Base_dData_dList_dList_Nil)))))))))
  | _ -> ""
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Base_dData_dList.dtp_concatMany (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ((v_Base_dData_dBase64_dencodeDigit ((Base_dData_dBits.v_Base_dData_dBits_dshr32 dtb__2) 2)), (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ((v_Base_dData_dBase64_dencodeDigit ((Base_dData_dBits.v_Base_dData_dBits_dbor ((Base_dData_dBits.v_Base_dData_dBits_dshl32 ((Base_dData_dBits.v_Base_dData_dBits_dband dtb__2) 3)) 4)) ((Base_dData_dBits.v_Base_dData_dBits_dshr32 dtb__4) 4))), (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ((v_Base_dData_dBase64_dencodeDigit ((Base_dData_dBits.v_Base_dData_dBits_dshl32 ((Base_dData_dBits.v_Base_dData_dBits_dband dtb__4) 15)) 2)), (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ("=", Base_dData_dList.C_Base_dData_dList_dList_Nil)))))))))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Base_dData_dList.dtp_concatMany (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ((v_Base_dData_dBase64_dencodeDigit ((Base_dData_dBits.v_Base_dData_dBits_dshr32 dtb__2) 2)), (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ((v_Base_dData_dBase64_dencodeDigit ((Base_dData_dBits.v_Base_dData_dBits_dshl32 ((Base_dData_dBits.v_Base_dData_dBits_dband dtb__2) 3)) 4)), (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ("==", Base_dData_dList.C_Base_dData_dList_dList_Nil)))))))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> ""
  | _ -> failwith "DT: impossible branch"
)) g))

# 18 "Base/Data/Base64.vuna"
let v_Base_dData_dBase64_dbase64Encode = (fun bs -> (Base_dData_dList.dtp_concatMany ((Base_dData_dList.v_Base_dData_dList_dmap v_Base_dData_dBase64_dencodeGroup) ((v_Base_dData_dBase64_dgroups 3) bs))))

# 22 "Base/Data/Base64.vuna"
let v_Base_dData_dBase64_dbase64EncodeString = (fun s -> (v_Base_dData_dBase64_dbase64Encode (Base_dData_dList.dtp_unpack s)))

# 94 "Base/Data/Base64.vuna"
let v_Base_dData_dBase64_ddecodeDigit = (fun c -> (if (if (c >= 65) then (c <= 90) else false) then (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ((c - 65))) else (if (if (c >= 97) then (c <= 122) else false) then (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ((c - 71))) else (if (if (c >= 48) then (c <= 57) else false) then (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ((c + 4))) else (if (c = 43) then (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (62)) else (if (c = 47) then (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (63)) else Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing))))))

# 105 "Base/Data/Base64.vuna"
let v_Base_dData_dBase64_ddecodeGroup = (fun g -> ((fun nd_uscrut1 -> (match nd_uscrut1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__8, dtb__9) -> (match dtb__9 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__10, dtb__11) -> (match dtb__11 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__12, dtb__13) -> (match dtb__13 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__14, dtb__15) -> (match dtb__15 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ((Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ((Base_dData_dBits.v_Base_dData_dBits_dmask8 ((Base_dData_dBits.v_Base_dData_dBits_dbor ((Base_dData_dBits.v_Base_dData_dBits_dshl32 dtb__8) 2)) ((Base_dData_dBits.v_Base_dData_dBits_dshr32 dtb__10) 4))), (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ((Base_dData_dBits.v_Base_dData_dBits_dmask8 ((Base_dData_dBits.v_Base_dData_dBits_dbor ((Base_dData_dBits.v_Base_dData_dBits_dshl32 ((Base_dData_dBits.v_Base_dData_dBits_dband dtb__10) 15)) 4)) ((Base_dData_dBits.v_Base_dData_dBits_dshr32 dtb__12) 2))), (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ((Base_dData_dBits.v_Base_dData_dBits_dmask8 ((Base_dData_dBits.v_Base_dData_dBits_dbor ((Base_dData_dBits.v_Base_dData_dBits_dshl32 ((Base_dData_dBits.v_Base_dData_dBits_dband dtb__12) 3)) 6)) dtb__14)), Base_dData_dList.C_Base_dData_dList_dList_Nil))))))))
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
)) g))

# 121 "Base/Data/Base64.vuna"
let v_Base_dData_dBase64_dstep = (fun acc m -> (match acc with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__16) -> (match m with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__17) -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ((Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__17, dtb__16))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 114 "Base/Data/Base64.vuna"
let v_Base_dData_dBase64_dsequenceMaybe = (fun ms -> (match (((Base_dData_dList.v_Base_dData_dList_dfoldl v_Base_dData_dBase64_dstep) (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (Base_dData_dList.C_Base_dData_dList_dList_Nil))) ms) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__18) -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ((Base_dData_dList.v_Base_dData_dList_dreverse dtb__18)))
  | _ -> failwith "DT: impossible branch"
))

# 26 "Base/Data/Base64.vuna"
let v_Base_dData_dBase64_dbase64Decode = (fun s -> ((fun bs -> ((fun n -> ((fun pads -> (if (n = 0) then (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (Base_dData_dList.C_Base_dData_dList_dList_Nil)) else (if (if ((n - ((if 4 = 0 then failwith "division by zero" else n / 4) * 4)) = 0) then (pads <= 2) else false) then (match (v_Base_dData_dBase64_dsequenceMaybe ((Base_dData_dList.v_Base_dData_dList_dmap v_Base_dData_dBase64_ddecodeDigit) ((Base_dData_dList.v_Base_dData_dList_dtake (n - pads)) bs))) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__19) -> (match (v_Base_dData_dBase64_dsequenceMaybe ((Base_dData_dList.v_Base_dData_dList_dmap v_Base_dData_dBase64_ddecodeGroup) ((v_Base_dData_dBase64_dgroups 4) ((Base_dData_dList.v_Base_dData_dList_dappend dtb__19) (v_Base_dData_dBase64_dzeroBytes pads))))) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__20) -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ((Base_dData_dList.v_Base_dData_dList_dreverse ((Base_dData_dList.v_Base_dData_dList_ddrop pads) (Base_dData_dList.v_Base_dData_dList_dreverse ((Base_dData_dList.v_Base_dData_dList_dconcatMap (fun (c : int Base_dData_dList.t_Base_dData_dList_dList) -> c)) dtb__20))))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
) else Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing))) ((v_Base_dData_dBase64_dpaddingCount bs) n))) (bi_strLength s))) (Base_dData_dList.dtp_unpack s)))
