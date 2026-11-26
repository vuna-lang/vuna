open Vuna_runtime
# 41 "Base/Data/Base64.vuna"
let v_b64Byte = (fun (n : int) -> (if (n < 26) then (65 + n) else (if (n < 52) then (71 + n) else (if (n < 62) then ((48 + n) - 52) else (if (n = 62) then 43 else 47)))))

# 55 "Base/Data/Base64.vuna"
let rec v_encodeGroups = (fun (mc0 : int B_dData_dList.t_List) (mc1 : int B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__0, dtb__1) -> (match dtb__1 with
  | B_dData_dList.C_List_Nil -> (let o0 = (v_b64Byte ((B_dData_dBits.v_shr32 dtb__0) 2)) in (let o1 = (v_b64Byte ((B_dData_dBits.v_shl32 ((B_dData_dBits.v_band dtb__0) 3)) 4)) in (B_dData_dList.C_List__x58__x58_ (61, (B_dData_dList.C_List__x58__x58_ (61, (B_dData_dList.C_List__x58__x58_ (o1, (B_dData_dList.C_List__x58__x58_ (o0, mc1))))))))))
  | B_dData_dList.C_List__x58__x58_ (dtb__2, dtb__3) -> (match dtb__3 with
  | B_dData_dList.C_List_Nil -> (let o0 = (v_b64Byte ((B_dData_dBits.v_shr32 dtb__0) 2)) in (let o1 = (v_b64Byte ((B_dData_dBits.v_bor ((B_dData_dBits.v_shl32 ((B_dData_dBits.v_band dtb__0) 3)) 4)) ((B_dData_dBits.v_shr32 dtb__2) 4))) in (let o2 = (v_b64Byte ((B_dData_dBits.v_shl32 ((B_dData_dBits.v_band dtb__2) 15)) 2)) in (B_dData_dList.C_List__x58__x58_ (61, (B_dData_dList.C_List__x58__x58_ (o2, (B_dData_dList.C_List__x58__x58_ (o1, (B_dData_dList.C_List__x58__x58_ (o0, mc1)))))))))))
  | B_dData_dList.C_List__x58__x58_ (dtb__4, dtb__5) -> (let o0 = (v_b64Byte ((B_dData_dBits.v_shr32 dtb__0) 2)) in (let o1 = (v_b64Byte ((B_dData_dBits.v_bor ((B_dData_dBits.v_shl32 ((B_dData_dBits.v_band dtb__0) 3)) 4)) ((B_dData_dBits.v_shr32 dtb__2) 4))) in (let o2 = (v_b64Byte ((B_dData_dBits.v_bor ((B_dData_dBits.v_shl32 ((B_dData_dBits.v_band dtb__2) 15)) 2)) ((B_dData_dBits.v_shr32 dtb__4) 6))) in (let o3 = (v_b64Byte ((B_dData_dBits.v_band dtb__4) 63)) in ((v_encodeGroups dtb__5) (B_dData_dList.C_List__x58__x58_ (o3, (B_dData_dList.C_List__x58__x58_ (o2, (B_dData_dList.C_List__x58__x58_ (o1, (B_dData_dList.C_List__x58__x58_ (o0, mc1)))))))))))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> mc1
  | _ -> failwith "DT: impossible branch"
))

# 19 "Base/Data/Base64.vuna"
let v_base64Encode = (fun (bs : int B_dData_dList.t_List) -> (B_dData_dList.dtp_pack (B_dData_dList.v_reverse ((v_encodeGroups bs) B_dData_dList.C_List_Nil))))

# 23 "Base/Data/Base64.vuna"
let v_base64EncodeString = (fun (s : string) -> (v_base64Encode (B_dData_dList.dtp_unpack s)))

# 81 "Base/Data/Base64.vuna"
let v_paddingCount = (fun (s : string) (n : int) -> (if ((let b = s in let k = (n - 1) in if k < 0 || k >= String.length b then -1 else Char.code (String.unsafe_get b k)) = 61) then (if (if (n >= 2) then ((let b = s in let k = (n - 2) in if k < 0 || k >= String.length b then -1 else Char.code (String.unsafe_get b k)) = 61) else false) then 2 else 1) else 0))

# 116 "Base/Data/Base64.vuna"
let v_decodeDigitOrNeg = (fun (c : int) -> (if (if (c >= 65) then (c <= 90) else false) then (c - 65) else (if (if (c >= 97) then (c <= 122) else false) then (c - 71) else (if (if (c >= 48) then (c <= 57) else false) then (c + 4) else (if (c = 43) then 62 else (if (c = 47) then 63 else (-1)))))))

# 86 "Base/Data/Base64.vuna"
let rec v_decodeGroups = (fun (s : string) (g : int) (groups : int) (pads : int) (fuel : int) (acc : int B_dData_dList.t_List) -> (if (fuel <= 0) then B_dData_dMaybe.C_Maybe_Nothing else (if (g >= groups) then (B_dData_dMaybe.C_Maybe_Just ((B_dData_dList.v_reverse acc))) else (let i = (g * 4) in (let lastGroup = (g = (groups - 1)) in (let a = (v_decodeDigitOrNeg (let b = s in let k = i in if k < 0 || k >= String.length b then -1 else Char.code (String.unsafe_get b k))) in (let b = (v_decodeDigitOrNeg (let b = s in let k = (i + 1) in if k < 0 || k >= String.length b then -1 else Char.code (String.unsafe_get b k))) in (let c = (if (if lastGroup then (pads >= 2) else false) then 0 else (v_decodeDigitOrNeg (let b = s in let k = (i + 2) in if k < 0 || k >= String.length b then -1 else Char.code (String.unsafe_get b k)))) in (let d = (if (if lastGroup then (pads >= 1) else false) then 0 else (v_decodeDigitOrNeg (let b = s in let k = (i + 3) in if k < 0 || k >= String.length b then -1 else Char.code (String.unsafe_get b k)))) in (if (if (if (if (a < 0) then true else (b < 0)) then true else (c < 0)) then true else (d < 0)) then B_dData_dMaybe.C_Maybe_Nothing else (let b0 = ((B_dData_dBits.v_bor ((B_dData_dBits.v_shl32 a) 2)) ((B_dData_dBits.v_shr32 b) 4)) in (let b1 = ((B_dData_dBits.v_bor ((B_dData_dBits.v_shl32 ((B_dData_dBits.v_band b) 15)) 4)) ((B_dData_dBits.v_shr32 c) 2)) in (let b2 = ((B_dData_dBits.v_bor ((B_dData_dBits.v_shl32 ((B_dData_dBits.v_band c) 3)) 6)) d) in (let k = (if lastGroup then (3 - pads) else 3) in (let acc2 = (if (k = 3) then (B_dData_dList.C_List__x58__x58_ (b2, (B_dData_dList.C_List__x58__x58_ (b1, (B_dData_dList.C_List__x58__x58_ (b0, acc)))))) else (if (k = 2) then (B_dData_dList.C_List__x58__x58_ (b1, (B_dData_dList.C_List__x58__x58_ (b0, acc)))) else (B_dData_dList.C_List__x58__x58_ (b0, acc)))) in ((((((v_decodeGroups s) (g + 1)) groups) pads) (fuel - 1)) acc2))))))))))))))))

# 27 "Base/Data/Base64.vuna"
let v_base64Decode = (fun (s : string) -> (let n = (String.length s) in (if (n = 0) then (B_dData_dMaybe.C_Maybe_Just (B_dData_dList.C_List_Nil)) else (if ((n - ((if 4 = 0 then failwith "division by zero" else n / 4) * 4)) = 0) then (let pads = ((v_paddingCount s) n) in (if (pads <= 2) then ((((((v_decodeGroups s) 0) (if 4 = 0 then failwith "division by zero" else n / 4)) pads) ((if 4 = 0 then failwith "division by zero" else n / 4) + 1)) B_dData_dList.C_List_Nil) else B_dData_dMaybe.C_Maybe_Nothing)) else B_dData_dMaybe.C_Maybe_Nothing))))
