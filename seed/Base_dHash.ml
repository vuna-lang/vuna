open Vuna_runtime
type t_Digest = int B_dData_dList.t_List

# 45 "Vuna/Compiler/Base/Hash.vuna"
let v_digestInt = (fun (mc0 : t_Digest) -> (let dtb__0 = mc0 in ((B_dData_dBits.v_band (((B_dData_dList.v_foldl (fun (h : int) (lane : int) -> ((h * 1000003) + lane))) 0) dtb__0)) 4611686018427387903)))

# 70 "Vuna/Compiler/Base/Hash.vuna"
let v_shaInit = (B_dData_dList.C_List__x58__x58_ (1779033703, (B_dData_dList.C_List__x58__x58_ (3144134277, (B_dData_dList.C_List__x58__x58_ (1013904242, (B_dData_dList.C_List__x58__x58_ (2773480762, (B_dData_dList.C_List__x58__x58_ (1359893119, (B_dData_dList.C_List__x58__x58_ (2600822924, (B_dData_dList.C_List__x58__x58_ (528734635, (B_dData_dList.C_List__x58__x58_ (1541459225, B_dData_dList.C_List_Nil))))))))))))))))

# 75 "Vuna/Compiler/Base/Hash.vuna"
let v_shaK = (B_dData_dList.C_List__x58__x58_ (1116352408, (B_dData_dList.C_List__x58__x58_ (1899447441, (B_dData_dList.C_List__x58__x58_ (3049323471, (B_dData_dList.C_List__x58__x58_ (3921009573, (B_dData_dList.C_List__x58__x58_ (961987163, (B_dData_dList.C_List__x58__x58_ (1508970993, (B_dData_dList.C_List__x58__x58_ (2453635748, (B_dData_dList.C_List__x58__x58_ (2870763221, (B_dData_dList.C_List__x58__x58_ (3624381080, (B_dData_dList.C_List__x58__x58_ (310598401, (B_dData_dList.C_List__x58__x58_ (607225278, (B_dData_dList.C_List__x58__x58_ (1426881987, (B_dData_dList.C_List__x58__x58_ (1925078388, (B_dData_dList.C_List__x58__x58_ (2162078206, (B_dData_dList.C_List__x58__x58_ (2614888103, (B_dData_dList.C_List__x58__x58_ (3248222580, (B_dData_dList.C_List__x58__x58_ (3835390401, (B_dData_dList.C_List__x58__x58_ (4022224774, (B_dData_dList.C_List__x58__x58_ (264347078, (B_dData_dList.C_List__x58__x58_ (604807628, (B_dData_dList.C_List__x58__x58_ (770255983, (B_dData_dList.C_List__x58__x58_ (1249150122, (B_dData_dList.C_List__x58__x58_ (1555081692, (B_dData_dList.C_List__x58__x58_ (1996064986, (B_dData_dList.C_List__x58__x58_ (2554220882, (B_dData_dList.C_List__x58__x58_ (2821834349, (B_dData_dList.C_List__x58__x58_ (2952996808, (B_dData_dList.C_List__x58__x58_ (3210313671, (B_dData_dList.C_List__x58__x58_ (3336571891, (B_dData_dList.C_List__x58__x58_ (3584528711, (B_dData_dList.C_List__x58__x58_ (113926993, (B_dData_dList.C_List__x58__x58_ (338241895, (B_dData_dList.C_List__x58__x58_ (666307205, (B_dData_dList.C_List__x58__x58_ (773529912, (B_dData_dList.C_List__x58__x58_ (1294757372, (B_dData_dList.C_List__x58__x58_ (1396182291, (B_dData_dList.C_List__x58__x58_ (1695183700, (B_dData_dList.C_List__x58__x58_ (1986661051, (B_dData_dList.C_List__x58__x58_ (2177026350, (B_dData_dList.C_List__x58__x58_ (2456956037, (B_dData_dList.C_List__x58__x58_ (2730485921, (B_dData_dList.C_List__x58__x58_ (2820302411, (B_dData_dList.C_List__x58__x58_ (3259730800, (B_dData_dList.C_List__x58__x58_ (3345764771, (B_dData_dList.C_List__x58__x58_ (3516065817, (B_dData_dList.C_List__x58__x58_ (3600352804, (B_dData_dList.C_List__x58__x58_ (4094571909, (B_dData_dList.C_List__x58__x58_ (275423344, (B_dData_dList.C_List__x58__x58_ (430227734, (B_dData_dList.C_List__x58__x58_ (506948616, (B_dData_dList.C_List__x58__x58_ (659060556, (B_dData_dList.C_List__x58__x58_ (883997877, (B_dData_dList.C_List__x58__x58_ (958139571, (B_dData_dList.C_List__x58__x58_ (1322822218, (B_dData_dList.C_List__x58__x58_ (1537002063, (B_dData_dList.C_List__x58__x58_ (1747873779, (B_dData_dList.C_List__x58__x58_ (1955562222, (B_dData_dList.C_List__x58__x58_ (2024104815, (B_dData_dList.C_List__x58__x58_ (2227730452, (B_dData_dList.C_List__x58__x58_ (2361852424, (B_dData_dList.C_List__x58__x58_ (2428436474, (B_dData_dList.C_List__x58__x58_ (2756734187, (B_dData_dList.C_List__x58__x58_ (3204031479, (B_dData_dList.C_List__x58__x58_ (3329325298, B_dData_dList.C_List_Nil))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))

# 145 "Vuna/Compiler/Base/Hash.vuna"
let rec v_lenInt = (fun mc0 -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__1, dtb__2) -> (1 + (v_lenInt dtb__2))
  | B_dData_dList.C_List_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))

# 150 "Vuna/Compiler/Base/Hash.vuna"
let rec v_atIdx = (fun (mc0 : int) (mc1 : int B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__3, dtb__4) -> (if (mc0 <= 0) then dtb__3 else ((v_atIdx (mc0 - 1)) dtb__4))
  | B_dData_dList.C_List_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))

# 155 "Vuna/Compiler/Base/Hash.vuna"
let v_zeros = (fun (n : int) -> ((B_dData_dList.v_map (fun (_u : int) -> 0)) ((B_dData_dList.v_range 0) n)))

# 159 "Vuna/Compiler/Base/Hash.vuna"
let v_lenBytes = (fun (n : int) -> (B_dData_dList.C_List__x58__x58_ (((B_dData_dBits.v_band ((B_dData_dBits.v_shr n) 56)) 255), (B_dData_dList.C_List__x58__x58_ (((B_dData_dBits.v_band ((B_dData_dBits.v_shr n) 48)) 255), (B_dData_dList.C_List__x58__x58_ (((B_dData_dBits.v_band ((B_dData_dBits.v_shr n) 40)) 255), (B_dData_dList.C_List__x58__x58_ (((B_dData_dBits.v_band ((B_dData_dBits.v_shr n) 32)) 255), (B_dData_dList.C_List__x58__x58_ (((B_dData_dBits.v_band ((B_dData_dBits.v_shr n) 24)) 255), (B_dData_dList.C_List__x58__x58_ (((B_dData_dBits.v_band ((B_dData_dBits.v_shr n) 16)) 255), (B_dData_dList.C_List__x58__x58_ (((B_dData_dBits.v_band ((B_dData_dBits.v_shr n) 8)) 255), (B_dData_dList.C_List__x58__x58_ (((B_dData_dBits.v_band n) 255), B_dData_dList.C_List_Nil)))))))))))))))))

# 173 "Vuna/Compiler/Base/Hash.vuna"
let v_padMessage = (fun (bytes : int B_dData_dList.t_List) -> (let n = (v_lenInt bytes) in (let r = ((n + 1) - ((if 64 = 0 then failwith "division by zero" else (n + 1) / 64) * 64)) in (let zerosNeeded = (if (r <= 56) then (56 - r) else (120 - r)) in ((B_dData_dList.v_append ((B_dData_dList.v_append ((B_dData_dList.v_append bytes) (B_dData_dList.C_List__x58__x58_ (128, B_dData_dList.C_List_Nil)))) (v_zeros zerosNeeded))) (v_lenBytes (n * 8)))))))

# 186 "Vuna/Compiler/Base/Hash.vuna"
let rec v_chunks = (fun (k : int) (bytes : int B_dData_dList.t_List) -> (if (k <= 0) then B_dData_dList.C_List_Nil else (B_dData_dList.C_List__x58__x58_ (((B_dData_dList.v_take 64) bytes), ((v_chunks (k - 1)) ((B_dData_dList.v_drop 64) bytes))))))

# 182 "Vuna/Compiler/Base/Hash.vuna"
let v_chunk64 = (fun (bytes : int B_dData_dList.t_List) -> ((v_chunks (if 64 = 0 then failwith "division by zero" else ((v_lenInt bytes) + 63) / 64)) bytes))

# 190 "Vuna/Compiler/Base/Hash.vuna"
let v_wordAt = (fun (chunk : int B_dData_dList.t_List) (j : int) -> (let b0 = ((v_atIdx (j * 4)) chunk) in (let b1 = ((v_atIdx ((j * 4) + 1)) chunk) in (let b2 = ((v_atIdx ((j * 4) + 2)) chunk) in (let b3 = ((v_atIdx ((j * 4) + 3)) chunk) in ((B_dData_dBits.v_bor ((B_dData_dBits.v_bor ((B_dData_dBits.v_shl32 b0) 24)) ((B_dData_dBits.v_shl32 b1) 16))) ((B_dData_dBits.v_bor ((B_dData_dBits.v_shl32 b2) 8)) b3)))))))

# 200 "Vuna/Compiler/Base/Hash.vuna"
let v_chunkWords = (fun (chunk : int B_dData_dList.t_List) -> ((B_dData_dList.v_map (fun (j : int) -> ((v_wordAt chunk) j))) ((B_dData_dList.v_range 0) 16)))

# 204 "Vuna/Compiler/Base/Hash.vuna"
let v_sigma0Small = (fun (x : int) -> ((B_dData_dBits.v_bxor ((B_dData_dBits.v_rotr32 x) 7)) ((B_dData_dBits.v_bxor ((B_dData_dBits.v_rotr32 x) 18)) ((B_dData_dBits.v_shr32 x) 3))))

# 208 "Vuna/Compiler/Base/Hash.vuna"
let v_sigma1Small = (fun (x : int) -> ((B_dData_dBits.v_bxor ((B_dData_dBits.v_rotr32 x) 17)) ((B_dData_dBits.v_bxor ((B_dData_dBits.v_rotr32 x) 19)) ((B_dData_dBits.v_shr32 x) 10))))

# 212 "Vuna/Compiler/Base/Hash.vuna"
let v_bigSigma0 = (fun (x : int) -> ((B_dData_dBits.v_bxor ((B_dData_dBits.v_rotr32 x) 2)) ((B_dData_dBits.v_bxor ((B_dData_dBits.v_rotr32 x) 13)) ((B_dData_dBits.v_rotr32 x) 22))))

# 216 "Vuna/Compiler/Base/Hash.vuna"
let v_bigSigma1 = (fun (x : int) -> ((B_dData_dBits.v_bxor ((B_dData_dBits.v_rotr32 x) 6)) ((B_dData_dBits.v_bxor ((B_dData_dBits.v_rotr32 x) 11)) ((B_dData_dBits.v_rotr32 x) 25))))

# 222 "Vuna/Compiler/Base/Hash.vuna"
let rec v_atWindow = (fun (mc0 : int) (mc1 : int B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__5, dtb__6) -> (if (mc0 <= 0) then dtb__5 else ((v_atWindow (mc0 - 1)) dtb__6))
  | B_dData_dList.C_List_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))

# 231 "Vuna/Compiler/Base/Hash.vuna"
let rec v_scheduleGo = (fun (k : int) (window : int B_dData_dList.t_List) -> (if (k <= 0) then B_dData_dList.C_List_Nil else (let w2 = ((v_atWindow 1) window) in (let w7 = ((v_atWindow 6) window) in (let w15 = ((v_atWindow 14) window) in (let w16 = ((v_atWindow 15) window) in (let next = ((B_dData_dBits.v_add32 ((B_dData_dBits.v_add32 (v_sigma1Small w2)) w7)) ((B_dData_dBits.v_add32 w16) (v_sigma0Small w15))) in (B_dData_dList.C_List__x58__x58_ (next, ((v_scheduleGo (k - 1)) (B_dData_dList.C_List__x58__x58_ (next, ((B_dData_dList.v_take 15) window)))))))))))))

# 227 "Vuna/Compiler/Base/Hash.vuna"
let v_schedule = (fun (w16 : int B_dData_dList.t_List) -> ((B_dData_dList.v_append w16) ((v_scheduleGo 48) (B_dData_dList.v_reverse w16))))

# 245 "Vuna/Compiler/Base/Hash.vuna"
let v_ch32 = (fun (e : int) (f : int) (g : int) -> ((B_dData_dBits.v_bxor ((B_dData_dBits.v_band e) f)) ((B_dData_dBits.v_band (B_dData_dBits.v_bnot e)) g)))

# 249 "Vuna/Compiler/Base/Hash.vuna"
let v_maj32 = (fun (a : int) (b : int) (c : int) -> ((B_dData_dBits.v_bxor ((B_dData_dBits.v_band a) b)) ((B_dData_dBits.v_bxor ((B_dData_dBits.v_band a) c)) ((B_dData_dBits.v_band b) c))))

# 253 "Vuna/Compiler/Base/Hash.vuna"
let rec v_roundsGo = (fun (mc0 : int) (mc1 : int) (mc2 : int) (mc3 : int) (mc4 : int) (mc5 : int) (mc6 : int) (mc7 : int) (mc8 : (int, int) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc8 with
  | B_dData_dList.C_List__x58__x58_ (dtb__7, dtb__8) -> (match dtb__7 with
  | { B_dData_dPair.f_Pair_first = dtb__9; B_dData_dPair.f_Pair_second = dtb__10 } -> (let t1 = ((B_dData_dBits.v_add32 ((B_dData_dBits.v_add32 ((B_dData_dBits.v_add32 mc7) (v_bigSigma1 mc4))) ((B_dData_dBits.v_add32 (((v_ch32 mc4) mc5) mc6)) dtb__10))) dtb__9) in (let t2 = ((B_dData_dBits.v_add32 (v_bigSigma0 mc0)) (((v_maj32 mc0) mc1) mc2)) in (((((((((v_roundsGo ((B_dData_dBits.v_add32 t1) t2)) mc0) mc1) mc2) ((B_dData_dBits.v_add32 mc3) t1)) mc4) mc5) mc6) dtb__8)))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (B_dData_dList.C_List__x58__x58_ (mc0, (B_dData_dList.C_List__x58__x58_ (mc1, (B_dData_dList.C_List__x58__x58_ (mc2, (B_dData_dList.C_List__x58__x58_ (mc3, (B_dData_dList.C_List__x58__x58_ (mc4, (B_dData_dList.C_List__x58__x58_ (mc5, (B_dData_dList.C_List__x58__x58_ (mc6, (B_dData_dList.C_List__x58__x58_ (mc7, B_dData_dList.C_List_Nil))))))))))))))))
  | _ -> failwith "DT: impossible branch"
))

# 262 "Vuna/Compiler/Base/Hash.vuna"
let v_compress = (fun (st : int B_dData_dList.t_List) (w16 : int B_dData_dList.t_List) -> (((((((((v_roundsGo ((v_atIdx 0) st)) ((v_atIdx 1) st)) ((v_atIdx 2) st)) ((v_atIdx 3) st)) ((v_atIdx 4) st)) ((v_atIdx 5) st)) ((v_atIdx 6) st)) ((v_atIdx 7) st)) ((B_dData_dList.v_zip (v_schedule w16)) v_shaK)))

# 276 "Vuna/Compiler/Base/Hash.vuna"
let v_zipAdd = (fun (xs : int B_dData_dList.t_List) (ys : int B_dData_dList.t_List) -> ((B_dData_dList.v_map (fun (i : int) -> ((B_dData_dBits.v_add32 ((v_atIdx i) xs)) ((v_atIdx i) ys)))) ((B_dData_dList.v_range 0) 8)))

# 280 "Vuna/Compiler/Base/Hash.vuna"
let v_compressBlock = (fun (st : int B_dData_dList.t_List) (block : int B_dData_dList.t_List) -> ((v_zipAdd st) ((v_compress st) (v_chunkWords block))))

# 284 "Vuna/Compiler/Base/Hash.vuna"
let v_sha256Bytes = (fun (bytes : int B_dData_dList.t_List) -> (((B_dData_dList.v_foldl v_compressBlock) v_shaInit) (v_chunk64 (v_padMessage bytes))))

# 25 "Vuna/Compiler/Base/Hash.vuna"
let v_digestOfBytes = (fun (bytes : int B_dData_dList.t_List) -> (v_sha256Bytes bytes))

# 291 "Vuna/Compiler/Base/Hash.vuna"
let v_paddedLen = (fun (n : int) -> (let r = ((n + 1) - ((if 64 = 0 then failwith "division by zero" else (n + 1) / 64) * 64)) in (let z = (if (r <= 56) then (56 - r) else (120 - r)) in (((n + 1) + z) + 8))))

# 299 "Vuna/Compiler/Base/Hash.vuna"
let v_paddedByte = (fun (s : string) (n : int) (total : int) (i : int) -> (if (i < n) then ((dtp_strAt s) i) else (if (i = n) then 128 else (if (i < (total - 8)) then 0 else ((B_dData_dBits.v_band ((B_dData_dBits.v_shr (n * 8)) (8 * (7 - (i - (total - 8)))))) 255)))))

# 308 "Vuna/Compiler/Base/Hash.vuna"
let v_wordAtString = (fun (s : string) (n : int) (total : int) (b : int) (j : int) -> (let base = ((b * 64) + (j * 4)) in (let b0 = ((((v_paddedByte s) n) total) base) in (let b1 = ((((v_paddedByte s) n) total) (base + 1)) in (let b2 = ((((v_paddedByte s) n) total) (base + 2)) in (let b3 = ((((v_paddedByte s) n) total) (base + 3)) in ((B_dData_dBits.v_bor ((B_dData_dBits.v_bor ((B_dData_dBits.v_shl32 b0) 24)) ((B_dData_dBits.v_shl32 b1) 16))) ((B_dData_dBits.v_bor ((B_dData_dBits.v_shl32 b2) 8)) b3))))))))

# 319 "Vuna/Compiler/Base/Hash.vuna"
let v_chunkWordsString = (fun (s : string) (n : int) (total : int) (b : int) -> ((B_dData_dList.v_map (fun (j : int) -> (((((v_wordAtString s) n) total) b) j))) ((B_dData_dList.v_range 0) 16)))

# 323 "Vuna/Compiler/Base/Hash.vuna"
let rec v_blocksGo = (fun (s : string) (n : int) (total : int) (k : int) (b : int) (st : int B_dData_dList.t_List) -> (if (k <= 0) then st else ((((((v_blocksGo s) n) total) (k - 1)) (b + 1)) ((v_zipAdd st) ((v_compress st) (v_schedule ((((v_chunkWordsString s) n) total) b)))))))

# 337 "Vuna/Compiler/Base/Hash.vuna"
let v_sha256OfString = (fun (s : string) -> (let n = (bi_strLength s) in (let total = (v_paddedLen n) in ((((((v_blocksGo s) n) total) (if 64 = 0 then failwith "division by zero" else total / 64)) 0) v_shaInit))))

# 33 "Vuna/Compiler/Base/Hash.vuna"
let v_digestOfString = (fun (s : string) -> (v_sha256OfString s))

# 49 "Vuna/Compiler/Base/Hash.vuna"
let v_digestIntOf = (fun (s : string) -> (v_digestInt (v_digestOfString s)))

# 361 "Vuna/Compiler/Base/Hash.vuna"
let rec v_prehashGo = (fun (k : int) (i : int) (h0 : int) (h1 : int) (h2 : int) (h3 : int) (s : string) -> (if (k <= 0) then (String.concat "" [(bi_strFromInt h0); ","; (bi_strFromInt h1); ","; (bi_strFromInt h2); ","; (bi_strFromInt h3)]) else (let b = (((dtp_strAt s) i) + 1) in (((((((v_prehashGo (k - 1)) (i + 1)) ((h0 * 131) + b)) ((h1 * 137) + b)) ((h2 * 139) + b)) ((h3 * 149) + b)) s))))

# 357 "Vuna/Compiler/Base/Hash.vuna"
let v_prehashOfString = (fun (s : string) -> (((((((v_prehashGo (bi_strLength s)) 0) 1) 2) 3) 4) s))

# 58 "Vuna/Compiler/Base/Hash.vuna"
let v_contentKey = (fun (s : string) -> (v_digestIntOf (v_prehashOfString s)))

# 380 "Vuna/Compiler/Base/Hash.vuna"
let v_digitAt = (fun (v : int) (p : int) -> ((B_dData_dBits.v_band (if p = 0 then failwith "division by zero" else v / p)) 15))

# 384 "Vuna/Compiler/Base/Hash.vuna"
let v_hexDigit = (fun (d : int) -> (if (d < 10) then (bi_strFromInt d) else (B_dData_dList.dtp_pack (B_dData_dList.C_List__x58__x58_ ((87 + d), B_dData_dList.C_List_Nil)))))

# 374 "Vuna/Compiler/Base/Hash.vuna"
let v_hex8 = (fun (v : int) -> (B_dData_dList.dtp_concatMany (B_dData_dList.C_List__x58__x58_ ((v_hexDigit ((v_digitAt v) 268435456)), (B_dData_dList.C_List__x58__x58_ ((v_hexDigit ((v_digitAt v) 16777216)), (B_dData_dList.C_List__x58__x58_ ((v_hexDigit ((v_digitAt v) 1048576)), (B_dData_dList.C_List__x58__x58_ ((v_hexDigit ((v_digitAt v) 65536)), (B_dData_dList.C_List__x58__x58_ ((v_hexDigit ((v_digitAt v) 4096)), (B_dData_dList.C_List__x58__x58_ ((v_hexDigit ((v_digitAt v) 256)), (B_dData_dList.C_List__x58__x58_ ((v_hexDigit ((v_digitAt v) 16)), (B_dData_dList.C_List__x58__x58_ ((v_hexDigit ((v_digitAt v) 1)), B_dData_dList.C_List_Nil))))))))))))))))))

# 37 "Vuna/Compiler/Base/Hash.vuna"
let v_digestHex = (fun (mc0 : t_Digest) -> (let dtb__11 = mc0 in (B_dData_dList.dtp_concatMany ((B_dData_dList.v_map v_hex8) dtb__11))))

# 63 "Vuna/Compiler/Base/Hash.vuna"
let v_contentAddress = (fun (s : string) -> (v_digestHex (v_digestOfString (v_prehashOfString s))))

# 21 "Vuna/Compiler/Base/Hash.vuna"
let v_digestLanes = (fun (p : t_Digest) -> (let dtb__12 = p in dtb__12))
