open Vuna_runtime
type t_Digest = int B_dData_dList.t_List

# 45 "Vuna/Compiler/Base/Hash.vuna"
let v_digestInt = (fun (dtb_u_u1 : t_Digest) -> (let dtb_u_u2 = dtb_u_u1 in ((B_dData_dBits.v_band (((B_dData_dList.v_foldl (fun (dtb_u_u3 : int) (dtb_u_u4 : int) -> ((dtb_u_u3 * 1000003) + dtb_u_u4))) 0) dtb_u_u2)) 4611686018427387903)))

# 70 "Vuna/Compiler/Base/Hash.vuna"
let v_shaInit = (B_dData_dList.C_List__x58__x58_ (1779033703, (B_dData_dList.C_List__x58__x58_ (3144134277, (B_dData_dList.C_List__x58__x58_ (1013904242, (B_dData_dList.C_List__x58__x58_ (2773480762, (B_dData_dList.C_List__x58__x58_ (1359893119, (B_dData_dList.C_List__x58__x58_ (2600822924, (B_dData_dList.C_List__x58__x58_ (528734635, (B_dData_dList.C_List__x58__x58_ (1541459225, B_dData_dList.C_List_Nil))))))))))))))))

# 75 "Vuna/Compiler/Base/Hash.vuna"
let v_shaK = (B_dData_dList.C_List__x58__x58_ (1116352408, (B_dData_dList.C_List__x58__x58_ (1899447441, (B_dData_dList.C_List__x58__x58_ (3049323471, (B_dData_dList.C_List__x58__x58_ (3921009573, (B_dData_dList.C_List__x58__x58_ (961987163, (B_dData_dList.C_List__x58__x58_ (1508970993, (B_dData_dList.C_List__x58__x58_ (2453635748, (B_dData_dList.C_List__x58__x58_ (2870763221, (B_dData_dList.C_List__x58__x58_ (3624381080, (B_dData_dList.C_List__x58__x58_ (310598401, (B_dData_dList.C_List__x58__x58_ (607225278, (B_dData_dList.C_List__x58__x58_ (1426881987, (B_dData_dList.C_List__x58__x58_ (1925078388, (B_dData_dList.C_List__x58__x58_ (2162078206, (B_dData_dList.C_List__x58__x58_ (2614888103, (B_dData_dList.C_List__x58__x58_ (3248222580, (B_dData_dList.C_List__x58__x58_ (3835390401, (B_dData_dList.C_List__x58__x58_ (4022224774, (B_dData_dList.C_List__x58__x58_ (264347078, (B_dData_dList.C_List__x58__x58_ (604807628, (B_dData_dList.C_List__x58__x58_ (770255983, (B_dData_dList.C_List__x58__x58_ (1249150122, (B_dData_dList.C_List__x58__x58_ (1555081692, (B_dData_dList.C_List__x58__x58_ (1996064986, (B_dData_dList.C_List__x58__x58_ (2554220882, (B_dData_dList.C_List__x58__x58_ (2821834349, (B_dData_dList.C_List__x58__x58_ (2952996808, (B_dData_dList.C_List__x58__x58_ (3210313671, (B_dData_dList.C_List__x58__x58_ (3336571891, (B_dData_dList.C_List__x58__x58_ (3584528711, (B_dData_dList.C_List__x58__x58_ (113926993, (B_dData_dList.C_List__x58__x58_ (338241895, (B_dData_dList.C_List__x58__x58_ (666307205, (B_dData_dList.C_List__x58__x58_ (773529912, (B_dData_dList.C_List__x58__x58_ (1294757372, (B_dData_dList.C_List__x58__x58_ (1396182291, (B_dData_dList.C_List__x58__x58_ (1695183700, (B_dData_dList.C_List__x58__x58_ (1986661051, (B_dData_dList.C_List__x58__x58_ (2177026350, (B_dData_dList.C_List__x58__x58_ (2456956037, (B_dData_dList.C_List__x58__x58_ (2730485921, (B_dData_dList.C_List__x58__x58_ (2820302411, (B_dData_dList.C_List__x58__x58_ (3259730800, (B_dData_dList.C_List__x58__x58_ (3345764771, (B_dData_dList.C_List__x58__x58_ (3516065817, (B_dData_dList.C_List__x58__x58_ (3600352804, (B_dData_dList.C_List__x58__x58_ (4094571909, (B_dData_dList.C_List__x58__x58_ (275423344, (B_dData_dList.C_List__x58__x58_ (430227734, (B_dData_dList.C_List__x58__x58_ (506948616, (B_dData_dList.C_List__x58__x58_ (659060556, (B_dData_dList.C_List__x58__x58_ (883997877, (B_dData_dList.C_List__x58__x58_ (958139571, (B_dData_dList.C_List__x58__x58_ (1322822218, (B_dData_dList.C_List__x58__x58_ (1537002063, (B_dData_dList.C_List__x58__x58_ (1747873779, (B_dData_dList.C_List__x58__x58_ (1955562222, (B_dData_dList.C_List__x58__x58_ (2024104815, (B_dData_dList.C_List__x58__x58_ (2227730452, (B_dData_dList.C_List__x58__x58_ (2361852424, (B_dData_dList.C_List__x58__x58_ (2428436474, (B_dData_dList.C_List__x58__x58_ (2756734187, (B_dData_dList.C_List__x58__x58_ (3204031479, (B_dData_dList.C_List__x58__x58_ (3329325298, B_dData_dList.C_List_Nil))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))

# 145 "Vuna/Compiler/Base/Hash.vuna"
let rec v_lenInt = (fun dtb_u_u6 -> (match dtb_u_u6 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u7, dtb_u_u8) -> (1 + (v_lenInt dtb_u_u8))
  | B_dData_dList.C_List_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))

# 150 "Vuna/Compiler/Base/Hash.vuna"
let rec v_atIdx = (fun (dtb_u_u9 : int) (dtb_u_u10 : int B_dData_dList.t_List) -> (match dtb_u_u10 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u11, dtb_u_u12) -> (if (dtb_u_u9 <= 0) then dtb_u_u11 else ((v_atIdx (dtb_u_u9 - 1)) dtb_u_u12))
  | B_dData_dList.C_List_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))

# 155 "Vuna/Compiler/Base/Hash.vuna"
let v_zeros = (fun (dtb_u_u13 : int) -> ((B_dData_dList.v_map (fun (dtb_u_u14 : int) -> 0)) ((B_dData_dList.v_range 0) dtb_u_u13)))

# 159 "Vuna/Compiler/Base/Hash.vuna"
let v_lenBytes = (fun (dtb_u_u15 : int) -> (B_dData_dList.C_List__x58__x58_ (((B_dData_dBits.v_band ((B_dData_dBits.v_shr dtb_u_u15) 56)) 255), (B_dData_dList.C_List__x58__x58_ (((B_dData_dBits.v_band ((B_dData_dBits.v_shr dtb_u_u15) 48)) 255), (B_dData_dList.C_List__x58__x58_ (((B_dData_dBits.v_band ((B_dData_dBits.v_shr dtb_u_u15) 40)) 255), (B_dData_dList.C_List__x58__x58_ (((B_dData_dBits.v_band ((B_dData_dBits.v_shr dtb_u_u15) 32)) 255), (B_dData_dList.C_List__x58__x58_ (((B_dData_dBits.v_band ((B_dData_dBits.v_shr dtb_u_u15) 24)) 255), (B_dData_dList.C_List__x58__x58_ (((B_dData_dBits.v_band ((B_dData_dBits.v_shr dtb_u_u15) 16)) 255), (B_dData_dList.C_List__x58__x58_ (((B_dData_dBits.v_band ((B_dData_dBits.v_shr dtb_u_u15) 8)) 255), (B_dData_dList.C_List__x58__x58_ (((B_dData_dBits.v_band dtb_u_u15) 255), B_dData_dList.C_List_Nil)))))))))))))))))

# 173 "Vuna/Compiler/Base/Hash.vuna"
let v_padMessage = (fun (dtb_u_u16 : int B_dData_dList.t_List) -> (let dtb_u_u17 = (v_lenInt dtb_u_u16) in (let dtb_u_u18 = ((dtb_u_u17 + 1) - ((if 64 = 0 then failwith "division by zero" else (dtb_u_u17 + 1) / 64) * 64)) in (let dtb_u_u19 = (if (dtb_u_u18 <= 56) then (56 - dtb_u_u18) else (120 - dtb_u_u18)) in ((B_dData_dList.v_append ((B_dData_dList.v_append ((B_dData_dList.v_append dtb_u_u16) (B_dData_dList.C_List__x58__x58_ (128, B_dData_dList.C_List_Nil)))) (v_zeros dtb_u_u19))) (v_lenBytes (dtb_u_u17 * 8)))))))

# 186 "Vuna/Compiler/Base/Hash.vuna"
let[@tail_mod_cons] rec v_chunks = (fun (dtb_u_u20 : int) (dtb_u_u21 : int B_dData_dList.t_List) -> (if (dtb_u_u20 <= 0) then B_dData_dList.C_List_Nil else (B_dData_dList.C_List__x58__x58_ (((B_dData_dList.v_take 64) dtb_u_u21), ((v_chunks (dtb_u_u20 - 1)) ((B_dData_dList.v_drop 64) dtb_u_u21))))))

# 182 "Vuna/Compiler/Base/Hash.vuna"
let v_chunk64 = (fun (dtb_u_u22 : int B_dData_dList.t_List) -> ((v_chunks (if 64 = 0 then failwith "division by zero" else ((v_lenInt dtb_u_u22) + 63) / 64)) dtb_u_u22))

# 190 "Vuna/Compiler/Base/Hash.vuna"
let v_wordAt = (fun (dtb_u_u23 : int B_dData_dList.t_List) (dtb_u_u24 : int) -> (let dtb_u_u25 = ((v_atIdx (dtb_u_u24 * 4)) dtb_u_u23) in (let dtb_u_u26 = ((v_atIdx ((dtb_u_u24 * 4) + 1)) dtb_u_u23) in (let dtb_u_u27 = ((v_atIdx ((dtb_u_u24 * 4) + 2)) dtb_u_u23) in (let dtb_u_u28 = ((v_atIdx ((dtb_u_u24 * 4) + 3)) dtb_u_u23) in ((B_dData_dBits.v_bor ((B_dData_dBits.v_bor ((B_dData_dBits.v_shl32 dtb_u_u25) 24)) ((B_dData_dBits.v_shl32 dtb_u_u26) 16))) ((B_dData_dBits.v_bor ((B_dData_dBits.v_shl32 dtb_u_u27) 8)) dtb_u_u28)))))))

# 200 "Vuna/Compiler/Base/Hash.vuna"
let v_chunkWords = (fun (dtb_u_u29 : int B_dData_dList.t_List) -> ((B_dData_dList.v_map (fun (dtb_u_u30 : int) -> ((v_wordAt dtb_u_u29) dtb_u_u30))) ((B_dData_dList.v_range 0) 16)))

# 204 "Vuna/Compiler/Base/Hash.vuna"
let v_sigma0Small = (fun (dtb_u_u31 : int) -> ((B_dData_dBits.v_bxor ((B_dData_dBits.v_rotr32 dtb_u_u31) 7)) ((B_dData_dBits.v_bxor ((B_dData_dBits.v_rotr32 dtb_u_u31) 18)) ((B_dData_dBits.v_shr32 dtb_u_u31) 3))))

# 208 "Vuna/Compiler/Base/Hash.vuna"
let v_sigma1Small = (fun (dtb_u_u32 : int) -> ((B_dData_dBits.v_bxor ((B_dData_dBits.v_rotr32 dtb_u_u32) 17)) ((B_dData_dBits.v_bxor ((B_dData_dBits.v_rotr32 dtb_u_u32) 19)) ((B_dData_dBits.v_shr32 dtb_u_u32) 10))))

# 212 "Vuna/Compiler/Base/Hash.vuna"
let v_bigSigma0 = (fun (dtb_u_u33 : int) -> ((B_dData_dBits.v_bxor ((B_dData_dBits.v_rotr32 dtb_u_u33) 2)) ((B_dData_dBits.v_bxor ((B_dData_dBits.v_rotr32 dtb_u_u33) 13)) ((B_dData_dBits.v_rotr32 dtb_u_u33) 22))))

# 216 "Vuna/Compiler/Base/Hash.vuna"
let v_bigSigma1 = (fun (dtb_u_u34 : int) -> ((B_dData_dBits.v_bxor ((B_dData_dBits.v_rotr32 dtb_u_u34) 6)) ((B_dData_dBits.v_bxor ((B_dData_dBits.v_rotr32 dtb_u_u34) 11)) ((B_dData_dBits.v_rotr32 dtb_u_u34) 25))))

# 222 "Vuna/Compiler/Base/Hash.vuna"
let rec v_atWindow = (fun (dtb_u_u35 : int) (dtb_u_u36 : int B_dData_dList.t_List) -> (match dtb_u_u36 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u37, dtb_u_u38) -> (if (dtb_u_u35 <= 0) then dtb_u_u37 else ((v_atWindow (dtb_u_u35 - 1)) dtb_u_u38))
  | B_dData_dList.C_List_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))

# 231 "Vuna/Compiler/Base/Hash.vuna"
let rec v_scheduleGo = (fun (dtb_u_u39 : int) (dtb_u_u40 : int B_dData_dList.t_List) -> (if (dtb_u_u39 <= 0) then B_dData_dList.C_List_Nil else (let dtb_u_u41 = ((v_atWindow 1) dtb_u_u40) in (let dtb_u_u42 = ((v_atWindow 6) dtb_u_u40) in (let dtb_u_u43 = ((v_atWindow 14) dtb_u_u40) in (let dtb_u_u44 = ((v_atWindow 15) dtb_u_u40) in (let dtb_u_u45 = ((B_dData_dBits.v_add32 ((B_dData_dBits.v_add32 (v_sigma1Small dtb_u_u41)) dtb_u_u42)) ((B_dData_dBits.v_add32 dtb_u_u44) (v_sigma0Small dtb_u_u43))) in (B_dData_dList.C_List__x58__x58_ (dtb_u_u45, ((v_scheduleGo (dtb_u_u39 - 1)) (B_dData_dList.C_List__x58__x58_ (dtb_u_u45, ((B_dData_dList.v_take 15) dtb_u_u40)))))))))))))

# 227 "Vuna/Compiler/Base/Hash.vuna"
let v_schedule = (fun (dtb_u_u46 : int B_dData_dList.t_List) -> ((B_dData_dList.v_append dtb_u_u46) ((v_scheduleGo 48) (B_dData_dList.v_reverse dtb_u_u46))))

# 245 "Vuna/Compiler/Base/Hash.vuna"
let v_ch32 = (fun (dtb_u_u47 : int) (dtb_u_u48 : int) (dtb_u_u49 : int) -> ((B_dData_dBits.v_bxor ((B_dData_dBits.v_band dtb_u_u47) dtb_u_u48)) ((B_dData_dBits.v_band (B_dData_dBits.v_bnot dtb_u_u47)) dtb_u_u49)))

# 249 "Vuna/Compiler/Base/Hash.vuna"
let v_maj32 = (fun (dtb_u_u50 : int) (dtb_u_u51 : int) (dtb_u_u52 : int) -> ((B_dData_dBits.v_bxor ((B_dData_dBits.v_band dtb_u_u50) dtb_u_u51)) ((B_dData_dBits.v_bxor ((B_dData_dBits.v_band dtb_u_u50) dtb_u_u52)) ((B_dData_dBits.v_band dtb_u_u51) dtb_u_u52))))

# 253 "Vuna/Compiler/Base/Hash.vuna"
let rec v_roundsGo = (fun (dtb_u_u53 : int) (dtb_u_u54 : int) (dtb_u_u55 : int) (dtb_u_u56 : int) (dtb_u_u57 : int) (dtb_u_u58 : int) (dtb_u_u59 : int) (dtb_u_u60 : int) (dtb_u_u61 : (int, int) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match dtb_u_u61 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u62, dtb_u_u63) -> (match dtb_u_u62 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u64; B_dData_dPair.f_Pair_second = dtb_u_u65 } -> (let dtb_u_u66 = ((B_dData_dBits.v_add32 ((B_dData_dBits.v_add32 ((B_dData_dBits.v_add32 dtb_u_u60) (v_bigSigma1 dtb_u_u57))) ((B_dData_dBits.v_add32 (((v_ch32 dtb_u_u57) dtb_u_u58) dtb_u_u59)) dtb_u_u65))) dtb_u_u64) in (let dtb_u_u67 = ((B_dData_dBits.v_add32 (v_bigSigma0 dtb_u_u53)) (((v_maj32 dtb_u_u53) dtb_u_u54) dtb_u_u55)) in (((((((((v_roundsGo ((B_dData_dBits.v_add32 dtb_u_u66) dtb_u_u67)) dtb_u_u53) dtb_u_u54) dtb_u_u55) ((B_dData_dBits.v_add32 dtb_u_u56) dtb_u_u66)) dtb_u_u57) dtb_u_u58) dtb_u_u59) dtb_u_u63)))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (B_dData_dList.C_List__x58__x58_ (dtb_u_u53, (B_dData_dList.C_List__x58__x58_ (dtb_u_u54, (B_dData_dList.C_List__x58__x58_ (dtb_u_u55, (B_dData_dList.C_List__x58__x58_ (dtb_u_u56, (B_dData_dList.C_List__x58__x58_ (dtb_u_u57, (B_dData_dList.C_List__x58__x58_ (dtb_u_u58, (B_dData_dList.C_List__x58__x58_ (dtb_u_u59, (B_dData_dList.C_List__x58__x58_ (dtb_u_u60, B_dData_dList.C_List_Nil))))))))))))))))
  | _ -> failwith "DT: impossible branch"
))

# 262 "Vuna/Compiler/Base/Hash.vuna"
let v_compress = (fun (dtb_u_u68 : int B_dData_dList.t_List) (dtb_u_u69 : int B_dData_dList.t_List) -> (((((((((v_roundsGo ((v_atIdx 0) dtb_u_u68)) ((v_atIdx 1) dtb_u_u68)) ((v_atIdx 2) dtb_u_u68)) ((v_atIdx 3) dtb_u_u68)) ((v_atIdx 4) dtb_u_u68)) ((v_atIdx 5) dtb_u_u68)) ((v_atIdx 6) dtb_u_u68)) ((v_atIdx 7) dtb_u_u68)) ((B_dData_dList.v_zip (v_schedule dtb_u_u69)) v_shaK)))

# 276 "Vuna/Compiler/Base/Hash.vuna"
let v_zipAdd = (fun (dtb_u_u70 : int B_dData_dList.t_List) (dtb_u_u71 : int B_dData_dList.t_List) -> ((B_dData_dList.v_map (fun (dtb_u_u72 : int) -> ((B_dData_dBits.v_add32 ((v_atIdx dtb_u_u72) dtb_u_u70)) ((v_atIdx dtb_u_u72) dtb_u_u71)))) ((B_dData_dList.v_range 0) 8)))

# 280 "Vuna/Compiler/Base/Hash.vuna"
let v_compressBlock = (fun (dtb_u_u73 : int B_dData_dList.t_List) (dtb_u_u74 : int B_dData_dList.t_List) -> ((v_zipAdd dtb_u_u73) ((v_compress dtb_u_u73) (v_chunkWords dtb_u_u74))))

# 284 "Vuna/Compiler/Base/Hash.vuna"
let v_sha256Bytes = (fun (dtb_u_u75 : int B_dData_dList.t_List) -> (((B_dData_dList.v_foldl v_compressBlock) v_shaInit) (v_chunk64 (v_padMessage dtb_u_u75))))

# 25 "Vuna/Compiler/Base/Hash.vuna"
let v_digestOfBytes = (fun (dtb_u_u76 : int B_dData_dList.t_List) -> (v_sha256Bytes dtb_u_u76))

# 291 "Vuna/Compiler/Base/Hash.vuna"
let v_paddedLen = (fun (dtb_u_u77 : int) -> (let dtb_u_u78 = ((dtb_u_u77 + 1) - ((if 64 = 0 then failwith "division by zero" else (dtb_u_u77 + 1) / 64) * 64)) in (let dtb_u_u79 = (if (dtb_u_u78 <= 56) then (56 - dtb_u_u78) else (120 - dtb_u_u78)) in (((dtb_u_u77 + 1) + dtb_u_u79) + 8))))

# 299 "Vuna/Compiler/Base/Hash.vuna"
let v_paddedByte = (fun (dtb_u_u80 : string) (dtb_u_u81 : int) (dtb_u_u82 : int) (dtb_u_u83 : int) -> (if (dtb_u_u83 < dtb_u_u81) then (let b = dtb_u_u80 in let k = dtb_u_u83 in if k < 0 || k >= String.length b then -1 else Char.code (String.unsafe_get b k)) else (if (dtb_u_u83 = dtb_u_u81) then 128 else (if (dtb_u_u83 < (dtb_u_u82 - 8)) then 0 else ((B_dData_dBits.v_band ((B_dData_dBits.v_shr (dtb_u_u81 * 8)) (8 * (7 - (dtb_u_u83 - (dtb_u_u82 - 8)))))) 255)))))

# 308 "Vuna/Compiler/Base/Hash.vuna"
let v_wordAtString = (fun (dtb_u_u84 : string) (dtb_u_u85 : int) (dtb_u_u86 : int) (dtb_u_u87 : int) (dtb_u_u88 : int) -> (let dtb_u_u89 = ((dtb_u_u87 * 64) + (dtb_u_u88 * 4)) in (let dtb_u_u90 = ((((v_paddedByte dtb_u_u84) dtb_u_u85) dtb_u_u86) dtb_u_u89) in (let dtb_u_u91 = ((((v_paddedByte dtb_u_u84) dtb_u_u85) dtb_u_u86) (dtb_u_u89 + 1)) in (let dtb_u_u92 = ((((v_paddedByte dtb_u_u84) dtb_u_u85) dtb_u_u86) (dtb_u_u89 + 2)) in (let dtb_u_u93 = ((((v_paddedByte dtb_u_u84) dtb_u_u85) dtb_u_u86) (dtb_u_u89 + 3)) in ((B_dData_dBits.v_bor ((B_dData_dBits.v_bor ((B_dData_dBits.v_shl32 dtb_u_u90) 24)) ((B_dData_dBits.v_shl32 dtb_u_u91) 16))) ((B_dData_dBits.v_bor ((B_dData_dBits.v_shl32 dtb_u_u92) 8)) dtb_u_u93))))))))

# 319 "Vuna/Compiler/Base/Hash.vuna"
let v_chunkWordsString = (fun (dtb_u_u94 : string) (dtb_u_u95 : int) (dtb_u_u96 : int) (dtb_u_u97 : int) -> ((B_dData_dList.v_map (fun (dtb_u_u98 : int) -> (((((v_wordAtString dtb_u_u94) dtb_u_u95) dtb_u_u96) dtb_u_u97) dtb_u_u98))) ((B_dData_dList.v_range 0) 16)))

# 323 "Vuna/Compiler/Base/Hash.vuna"
let rec v_blocksGo = (fun (dtb_u_u99 : string) (dtb_u_u100 : int) (dtb_u_u101 : int) (dtb_u_u102 : int) (dtb_u_u103 : int) (dtb_u_u104 : int B_dData_dList.t_List) -> (if (dtb_u_u102 <= 0) then dtb_u_u104 else ((((((v_blocksGo dtb_u_u99) dtb_u_u100) dtb_u_u101) (dtb_u_u102 - 1)) (dtb_u_u103 + 1)) ((v_zipAdd dtb_u_u104) ((v_compress dtb_u_u104) (v_schedule ((((v_chunkWordsString dtb_u_u99) dtb_u_u100) dtb_u_u101) dtb_u_u103)))))))

# 337 "Vuna/Compiler/Base/Hash.vuna"
let v_sha256OfString = (fun (dtb_u_u105 : string) -> (let dtb_u_u106 = (String.length dtb_u_u105) in (let dtb_u_u107 = (v_paddedLen dtb_u_u106) in ((((((v_blocksGo dtb_u_u105) dtb_u_u106) dtb_u_u107) (if 64 = 0 then failwith "division by zero" else dtb_u_u107 / 64)) 0) v_shaInit))))

# 33 "Vuna/Compiler/Base/Hash.vuna"
let v_digestOfString = (fun (dtb_u_u108 : string) -> (v_sha256OfString dtb_u_u108))

# 49 "Vuna/Compiler/Base/Hash.vuna"
let v_digestIntOf = (fun (dtb_u_u109 : string) -> (v_digestInt (v_digestOfString dtb_u_u109)))

# 361 "Vuna/Compiler/Base/Hash.vuna"
let rec v_prehashGo = (fun (dtb_u_u110 : int) (dtb_u_u111 : int) (dtb_u_u112 : int) (dtb_u_u113 : int) (dtb_u_u114 : int) (dtb_u_u115 : int) (dtb_u_u116 : string) -> (if (dtb_u_u110 <= 0) then (String.concat "" [(string_of_int dtb_u_u112); ","; (string_of_int dtb_u_u113); ","; (string_of_int dtb_u_u114); ","; (string_of_int dtb_u_u115)]) else (let dtb_u_u117 = ((let b = dtb_u_u116 in let k = dtb_u_u111 in if k < 0 || k >= String.length b then -1 else Char.code (String.unsafe_get b k)) + 1) in (((((((v_prehashGo (dtb_u_u110 - 1)) (dtb_u_u111 + 1)) ((dtb_u_u112 * 131) + dtb_u_u117)) ((dtb_u_u113 * 137) + dtb_u_u117)) ((dtb_u_u114 * 139) + dtb_u_u117)) ((dtb_u_u115 * 149) + dtb_u_u117)) dtb_u_u116))))

# 357 "Vuna/Compiler/Base/Hash.vuna"
let v_prehashOfString = (fun (dtb_u_u118 : string) -> (((((((v_prehashGo (String.length dtb_u_u118)) 0) 1) 2) 3) 4) dtb_u_u118))

# 58 "Vuna/Compiler/Base/Hash.vuna"
let v_contentKey = (fun (dtb_u_u119 : string) -> (v_digestIntOf (v_prehashOfString dtb_u_u119)))

# 380 "Vuna/Compiler/Base/Hash.vuna"
let v_digitAt = (fun (dtb_u_u120 : int) (dtb_u_u121 : int) -> ((B_dData_dBits.v_band (if dtb_u_u121 = 0 then failwith "division by zero" else dtb_u_u120 / dtb_u_u121)) 15))

# 384 "Vuna/Compiler/Base/Hash.vuna"
let v_hexDigit = (fun (dtb_u_u122 : int) -> (if (dtb_u_u122 < 10) then (string_of_int dtb_u_u122) else (B_dData_dList.dtp_pack (B_dData_dList.C_List__x58__x58_ ((87 + dtb_u_u122), B_dData_dList.C_List_Nil)))))

# 374 "Vuna/Compiler/Base/Hash.vuna"
let v_hex8 = (fun (dtb_u_u123 : int) -> (B_dData_dList.dtp_concatMany (B_dData_dList.C_List__x58__x58_ ((v_hexDigit ((v_digitAt dtb_u_u123) 268435456)), (B_dData_dList.C_List__x58__x58_ ((v_hexDigit ((v_digitAt dtb_u_u123) 16777216)), (B_dData_dList.C_List__x58__x58_ ((v_hexDigit ((v_digitAt dtb_u_u123) 1048576)), (B_dData_dList.C_List__x58__x58_ ((v_hexDigit ((v_digitAt dtb_u_u123) 65536)), (B_dData_dList.C_List__x58__x58_ ((v_hexDigit ((v_digitAt dtb_u_u123) 4096)), (B_dData_dList.C_List__x58__x58_ ((v_hexDigit ((v_digitAt dtb_u_u123) 256)), (B_dData_dList.C_List__x58__x58_ ((v_hexDigit ((v_digitAt dtb_u_u123) 16)), (B_dData_dList.C_List__x58__x58_ ((v_hexDigit ((v_digitAt dtb_u_u123) 1)), B_dData_dList.C_List_Nil))))))))))))))))))

# 37 "Vuna/Compiler/Base/Hash.vuna"
let v_digestHex = (fun (dtb_u_u124 : t_Digest) -> (let dtb_u_u125 = dtb_u_u124 in (B_dData_dList.dtp_concatMany ((B_dData_dList.v_map v_hex8) dtb_u_u125))))

# 63 "Vuna/Compiler/Base/Hash.vuna"
let v_contentAddress = (fun (dtb_u_u126 : string) -> (v_digestHex (v_digestOfString (v_prehashOfString dtb_u_u126))))

# 21 "Vuna/Compiler/Base/Hash.vuna"
let v_digestLanes = (fun (dtb_u_u127 : t_Digest) -> (let dtb_u_u128 = dtb_u_u127 in dtb_u_u128))
