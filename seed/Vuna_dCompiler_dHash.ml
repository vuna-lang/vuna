open Vuna_runtime
type t_Vuna_dCompiler_dHash_dDigest = int Base_dList.t_Base_dList_dList

# 25 "Vuna/Compiler/Hash.vuna"
let v_Vuna_dCompiler_dHash_ddigestLanes = (fun mc0 -> (let dtb__0 = mc0 in dtb__0))

# 49 "Vuna/Compiler/Hash.vuna"
let v_Vuna_dCompiler_dHash_ddigestInt = (fun mc0 -> (let dtb__1 = mc0 in ((Base_dBits.v_Base_dBits_dband (((Base_dList.v_Base_dList_dfoldl (fun h lane -> (((Base_dNum.v_Base_dNum_dadd Base_dInt.v_Num_uInt) (((Base_dNum.v_Base_dNum_dmul Base_dInt.v_Num_uInt) h) 1000003)) lane))) 0) dtb__1)) 4611686018427387903)))

# 74 "Vuna/Compiler/Hash.vuna"
let v_Vuna_dCompiler_dHash_dshaInit = (Base_dList.C_Base_dList_dList_Cons (1779033703, (Base_dList.C_Base_dList_dList_Cons (3144134277, (Base_dList.C_Base_dList_dList_Cons (1013904242, (Base_dList.C_Base_dList_dList_Cons (2773480762, (Base_dList.C_Base_dList_dList_Cons (1359893119, (Base_dList.C_Base_dList_dList_Cons (2600822924, (Base_dList.C_Base_dList_dList_Cons (528734635, (Base_dList.C_Base_dList_dList_Cons (1541459225, Base_dList.C_Base_dList_dList_Nil))))))))))))))))

# 79 "Vuna/Compiler/Hash.vuna"
let v_Vuna_dCompiler_dHash_dshaK = (Base_dList.C_Base_dList_dList_Cons (1116352408, (Base_dList.C_Base_dList_dList_Cons (1899447441, (Base_dList.C_Base_dList_dList_Cons (3049323471, (Base_dList.C_Base_dList_dList_Cons (3921009573, (Base_dList.C_Base_dList_dList_Cons (961987163, (Base_dList.C_Base_dList_dList_Cons (1508970993, (Base_dList.C_Base_dList_dList_Cons (2453635748, (Base_dList.C_Base_dList_dList_Cons (2870763221, (Base_dList.C_Base_dList_dList_Cons (3624381080, (Base_dList.C_Base_dList_dList_Cons (310598401, (Base_dList.C_Base_dList_dList_Cons (607225278, (Base_dList.C_Base_dList_dList_Cons (1426881987, (Base_dList.C_Base_dList_dList_Cons (1925078388, (Base_dList.C_Base_dList_dList_Cons (2162078206, (Base_dList.C_Base_dList_dList_Cons (2614888103, (Base_dList.C_Base_dList_dList_Cons (3248222580, (Base_dList.C_Base_dList_dList_Cons (3835390401, (Base_dList.C_Base_dList_dList_Cons (4022224774, (Base_dList.C_Base_dList_dList_Cons (264347078, (Base_dList.C_Base_dList_dList_Cons (604807628, (Base_dList.C_Base_dList_dList_Cons (770255983, (Base_dList.C_Base_dList_dList_Cons (1249150122, (Base_dList.C_Base_dList_dList_Cons (1555081692, (Base_dList.C_Base_dList_dList_Cons (1996064986, (Base_dList.C_Base_dList_dList_Cons (2554220882, (Base_dList.C_Base_dList_dList_Cons (2821834349, (Base_dList.C_Base_dList_dList_Cons (2952996808, (Base_dList.C_Base_dList_dList_Cons (3210313671, (Base_dList.C_Base_dList_dList_Cons (3336571891, (Base_dList.C_Base_dList_dList_Cons (3584528711, (Base_dList.C_Base_dList_dList_Cons (113926993, (Base_dList.C_Base_dList_dList_Cons (338241895, (Base_dList.C_Base_dList_dList_Cons (666307205, (Base_dList.C_Base_dList_dList_Cons (773529912, (Base_dList.C_Base_dList_dList_Cons (1294757372, (Base_dList.C_Base_dList_dList_Cons (1396182291, (Base_dList.C_Base_dList_dList_Cons (1695183700, (Base_dList.C_Base_dList_dList_Cons (1986661051, (Base_dList.C_Base_dList_dList_Cons (2177026350, (Base_dList.C_Base_dList_dList_Cons (2456956037, (Base_dList.C_Base_dList_dList_Cons (2730485921, (Base_dList.C_Base_dList_dList_Cons (2820302411, (Base_dList.C_Base_dList_dList_Cons (3259730800, (Base_dList.C_Base_dList_dList_Cons (3345764771, (Base_dList.C_Base_dList_dList_Cons (3516065817, (Base_dList.C_Base_dList_dList_Cons (3600352804, (Base_dList.C_Base_dList_dList_Cons (4094571909, (Base_dList.C_Base_dList_dList_Cons (275423344, (Base_dList.C_Base_dList_dList_Cons (430227734, (Base_dList.C_Base_dList_dList_Cons (506948616, (Base_dList.C_Base_dList_dList_Cons (659060556, (Base_dList.C_Base_dList_dList_Cons (883997877, (Base_dList.C_Base_dList_dList_Cons (958139571, (Base_dList.C_Base_dList_dList_Cons (1322822218, (Base_dList.C_Base_dList_dList_Cons (1537002063, (Base_dList.C_Base_dList_dList_Cons (1747873779, (Base_dList.C_Base_dList_dList_Cons (1955562222, (Base_dList.C_Base_dList_dList_Cons (2024104815, (Base_dList.C_Base_dList_dList_Cons (2227730452, (Base_dList.C_Base_dList_dList_Cons (2361852424, (Base_dList.C_Base_dList_dList_Cons (2428436474, (Base_dList.C_Base_dList_dList_Cons (2756734187, (Base_dList.C_Base_dList_dList_Cons (3204031479, (Base_dList.C_Base_dList_dList_Cons (3329325298, Base_dList.C_Base_dList_dList_Nil))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))

# 148 "Vuna/Compiler/Hash.vuna"
let rec v_Vuna_dCompiler_dHash_dlenInt = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__2, dtb__3) -> (1 + (v_Vuna_dCompiler_dHash_dlenInt dtb__3))
  | Base_dList.C_Base_dList_dList_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))

# 153 "Vuna/Compiler/Hash.vuna"
let rec v_Vuna_dCompiler_dHash_datIdx = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__4, dtb__5) -> (if (mc0 <= 0) then dtb__4 else ((v_Vuna_dCompiler_dHash_datIdx (mc0 - 1)) dtb__5))
  | Base_dList.C_Base_dList_dList_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))

# 158 "Vuna/Compiler/Hash.vuna"
let v_Vuna_dCompiler_dHash_dzeros = (fun n -> ((Base_dList.v_Base_dList_dmap (fun _u -> 0)) ((Base_dList.v_Base_dList_drange 0) n)))

# 162 "Vuna/Compiler/Hash.vuna"
let v_Vuna_dCompiler_dHash_dlenBytes = (fun n -> (Base_dList.C_Base_dList_dList_Cons (((Base_dBits.v_Base_dBits_dband ((Base_dBits.v_Base_dBits_dshr n) 56)) 255), (Base_dList.C_Base_dList_dList_Cons (((Base_dBits.v_Base_dBits_dband ((Base_dBits.v_Base_dBits_dshr n) 48)) 255), (Base_dList.C_Base_dList_dList_Cons (((Base_dBits.v_Base_dBits_dband ((Base_dBits.v_Base_dBits_dshr n) 40)) 255), (Base_dList.C_Base_dList_dList_Cons (((Base_dBits.v_Base_dBits_dband ((Base_dBits.v_Base_dBits_dshr n) 32)) 255), (Base_dList.C_Base_dList_dList_Cons (((Base_dBits.v_Base_dBits_dband ((Base_dBits.v_Base_dBits_dshr n) 24)) 255), (Base_dList.C_Base_dList_dList_Cons (((Base_dBits.v_Base_dBits_dband ((Base_dBits.v_Base_dBits_dshr n) 16)) 255), (Base_dList.C_Base_dList_dList_Cons (((Base_dBits.v_Base_dBits_dband ((Base_dBits.v_Base_dBits_dshr n) 8)) 255), (Base_dList.C_Base_dList_dList_Cons (((Base_dBits.v_Base_dBits_dband n) 255), Base_dList.C_Base_dList_dList_Nil)))))))))))))))))

# 175 "Vuna/Compiler/Hash.vuna"
let v_Vuna_dCompiler_dHash_dpadMessage = (fun bytes -> ((fun n -> ((fun r -> ((fun zerosNeeded -> ((Base_dList.v_Base_dList_dappend ((Base_dList.v_Base_dList_dappend ((Base_dList.v_Base_dList_dappend bytes) (Base_dList.C_Base_dList_dList_Cons (128, Base_dList.C_Base_dList_dList_Nil)))) (v_Vuna_dCompiler_dHash_dzeros zerosNeeded))) (v_Vuna_dCompiler_dHash_dlenBytes (n * 8)))) (if (r <= 56) then (56 - r) else (120 - r)))) ((n + 1) - ((if 64 = 0 then failwith "division by zero" else (n + 1) / 64) * 64)))) (v_Vuna_dCompiler_dHash_dlenInt bytes)))

# 188 "Vuna/Compiler/Hash.vuna"
let rec v_Vuna_dCompiler_dHash_dchunks = (fun k bytes -> (if (k <= 0) then Base_dList.C_Base_dList_dList_Nil else (Base_dList.C_Base_dList_dList_Cons (((Base_dList.v_Base_dList_dtake 64) bytes), ((v_Vuna_dCompiler_dHash_dchunks (k - 1)) ((Base_dList.v_Base_dList_ddrop 64) bytes))))))

# 184 "Vuna/Compiler/Hash.vuna"
let v_Vuna_dCompiler_dHash_dchunk64 = (fun bytes -> ((v_Vuna_dCompiler_dHash_dchunks (if 64 = 0 then failwith "division by zero" else ((v_Vuna_dCompiler_dHash_dlenInt bytes) + 63) / 64)) bytes))

# 192 "Vuna/Compiler/Hash.vuna"
let v_Vuna_dCompiler_dHash_dwordAt = (fun chunk j -> ((fun b0 -> ((fun b1 -> ((fun b2 -> ((fun b3 -> ((Base_dBits.v_Base_dBits_dbor ((Base_dBits.v_Base_dBits_dbor ((Base_dBits.v_Base_dBits_dshl32 b0) 24)) ((Base_dBits.v_Base_dBits_dshl32 b1) 16))) ((Base_dBits.v_Base_dBits_dbor ((Base_dBits.v_Base_dBits_dshl32 b2) 8)) b3))) ((v_Vuna_dCompiler_dHash_datIdx ((j * 4) + 3)) chunk))) ((v_Vuna_dCompiler_dHash_datIdx ((j * 4) + 2)) chunk))) ((v_Vuna_dCompiler_dHash_datIdx ((j * 4) + 1)) chunk))) ((v_Vuna_dCompiler_dHash_datIdx (j * 4)) chunk)))

# 202 "Vuna/Compiler/Hash.vuna"
let v_Vuna_dCompiler_dHash_dchunkWords = (fun chunk -> ((Base_dList.v_Base_dList_dmap (fun j -> ((v_Vuna_dCompiler_dHash_dwordAt chunk) j))) ((Base_dList.v_Base_dList_drange 0) 16)))

# 206 "Vuna/Compiler/Hash.vuna"
let v_Vuna_dCompiler_dHash_dsigma0Small = (fun x -> ((Base_dBits.v_Base_dBits_dbxor ((Base_dBits.v_Base_dBits_drotr32 x) 7)) ((Base_dBits.v_Base_dBits_dbxor ((Base_dBits.v_Base_dBits_drotr32 x) 18)) ((Base_dBits.v_Base_dBits_dshr32 x) 3))))

# 210 "Vuna/Compiler/Hash.vuna"
let v_Vuna_dCompiler_dHash_dsigma1Small = (fun x -> ((Base_dBits.v_Base_dBits_dbxor ((Base_dBits.v_Base_dBits_drotr32 x) 17)) ((Base_dBits.v_Base_dBits_dbxor ((Base_dBits.v_Base_dBits_drotr32 x) 19)) ((Base_dBits.v_Base_dBits_dshr32 x) 10))))

# 214 "Vuna/Compiler/Hash.vuna"
let v_Vuna_dCompiler_dHash_dbigSigma0 = (fun x -> ((Base_dBits.v_Base_dBits_dbxor ((Base_dBits.v_Base_dBits_drotr32 x) 2)) ((Base_dBits.v_Base_dBits_dbxor ((Base_dBits.v_Base_dBits_drotr32 x) 13)) ((Base_dBits.v_Base_dBits_drotr32 x) 22))))

# 218 "Vuna/Compiler/Hash.vuna"
let v_Vuna_dCompiler_dHash_dbigSigma1 = (fun x -> ((Base_dBits.v_Base_dBits_dbxor ((Base_dBits.v_Base_dBits_drotr32 x) 6)) ((Base_dBits.v_Base_dBits_dbxor ((Base_dBits.v_Base_dBits_drotr32 x) 11)) ((Base_dBits.v_Base_dBits_drotr32 x) 25))))

# 224 "Vuna/Compiler/Hash.vuna"
let rec v_Vuna_dCompiler_dHash_datWindow = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__6, dtb__7) -> (if (mc0 <= 0) then dtb__6 else ((v_Vuna_dCompiler_dHash_datWindow (mc0 - 1)) dtb__7))
  | Base_dList.C_Base_dList_dList_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))

# 233 "Vuna/Compiler/Hash.vuna"
let rec v_Vuna_dCompiler_dHash_dscheduleGo = (fun k window -> (if (k <= 0) then Base_dList.C_Base_dList_dList_Nil else ((fun w2 -> ((fun w7 -> ((fun w15 -> ((fun w16 -> ((fun next -> (Base_dList.C_Base_dList_dList_Cons (next, ((v_Vuna_dCompiler_dHash_dscheduleGo (k - 1)) (Base_dList.C_Base_dList_dList_Cons (next, ((Base_dList.v_Base_dList_dtake 15) window))))))) ((Base_dBits.v_Base_dBits_dadd32 ((Base_dBits.v_Base_dBits_dadd32 (v_Vuna_dCompiler_dHash_dsigma1Small w2)) w7)) ((Base_dBits.v_Base_dBits_dadd32 w16) (v_Vuna_dCompiler_dHash_dsigma0Small w15))))) ((v_Vuna_dCompiler_dHash_datWindow 15) window))) ((v_Vuna_dCompiler_dHash_datWindow 14) window))) ((v_Vuna_dCompiler_dHash_datWindow 6) window))) ((v_Vuna_dCompiler_dHash_datWindow 1) window))))

# 229 "Vuna/Compiler/Hash.vuna"
let v_Vuna_dCompiler_dHash_dschedule = (fun w16 -> ((Base_dList.v_Base_dList_dappend w16) ((v_Vuna_dCompiler_dHash_dscheduleGo 48) (Base_dList.v_Base_dList_dreverse w16))))

# 245 "Vuna/Compiler/Hash.vuna"
let v_Vuna_dCompiler_dHash_dch32 = (fun e f g -> ((Base_dBits.v_Base_dBits_dbxor ((Base_dBits.v_Base_dBits_dband e) f)) ((Base_dBits.v_Base_dBits_dband (Base_dBits.v_Base_dBits_dbnot e)) g)))

# 249 "Vuna/Compiler/Hash.vuna"
let v_Vuna_dCompiler_dHash_dmaj32 = (fun a b c -> ((Base_dBits.v_Base_dBits_dbxor ((Base_dBits.v_Base_dBits_dband a) b)) ((Base_dBits.v_Base_dBits_dbxor ((Base_dBits.v_Base_dBits_dband a) c)) ((Base_dBits.v_Base_dBits_dband b) c))))

# 253 "Vuna/Compiler/Hash.vuna"
let rec v_Vuna_dCompiler_dHash_droundsGo = (fun mc0 mc1 mc2 mc3 mc4 mc5 mc6 mc7 mc8 -> (match mc8 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__8, dtb__9) -> (match dtb__8 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__10; Base_dPair.f_Base_dPair_dPair_second = dtb__11 } -> ((fun t1 -> ((fun t2 -> (((((((((v_Vuna_dCompiler_dHash_droundsGo ((Base_dBits.v_Base_dBits_dadd32 t1) t2)) mc0) mc1) mc2) ((Base_dBits.v_Base_dBits_dadd32 mc3) t1)) mc4) mc5) mc6) dtb__9)) ((Base_dBits.v_Base_dBits_dadd32 (v_Vuna_dCompiler_dHash_dbigSigma0 mc0)) (((v_Vuna_dCompiler_dHash_dmaj32 mc0) mc1) mc2)))) ((Base_dBits.v_Base_dBits_dadd32 ((Base_dBits.v_Base_dBits_dadd32 ((Base_dBits.v_Base_dBits_dadd32 mc7) (v_Vuna_dCompiler_dHash_dbigSigma1 mc4))) ((Base_dBits.v_Base_dBits_dadd32 (((v_Vuna_dCompiler_dHash_dch32 mc4) mc5) mc6)) dtb__11))) dtb__10))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dList.C_Base_dList_dList_Cons (mc0, (Base_dList.C_Base_dList_dList_Cons (mc1, (Base_dList.C_Base_dList_dList_Cons (mc2, (Base_dList.C_Base_dList_dList_Cons (mc3, (Base_dList.C_Base_dList_dList_Cons (mc4, (Base_dList.C_Base_dList_dList_Cons (mc5, (Base_dList.C_Base_dList_dList_Cons (mc6, (Base_dList.C_Base_dList_dList_Cons (mc7, Base_dList.C_Base_dList_dList_Nil))))))))))))))))
  | _ -> failwith "DT: impossible branch"
))

# 262 "Vuna/Compiler/Hash.vuna"
let v_Vuna_dCompiler_dHash_dcompress = (fun st w16 -> (((((((((v_Vuna_dCompiler_dHash_droundsGo ((v_Vuna_dCompiler_dHash_datIdx 0) st)) ((v_Vuna_dCompiler_dHash_datIdx 1) st)) ((v_Vuna_dCompiler_dHash_datIdx 2) st)) ((v_Vuna_dCompiler_dHash_datIdx 3) st)) ((v_Vuna_dCompiler_dHash_datIdx 4) st)) ((v_Vuna_dCompiler_dHash_datIdx 5) st)) ((v_Vuna_dCompiler_dHash_datIdx 6) st)) ((v_Vuna_dCompiler_dHash_datIdx 7) st)) ((Base_dList.v_Base_dList_dzip (v_Vuna_dCompiler_dHash_dschedule w16)) v_Vuna_dCompiler_dHash_dshaK)))

# 268 "Vuna/Compiler/Hash.vuna"
let v_Vuna_dCompiler_dHash_dzipAdd = (fun xs ys -> ((Base_dList.v_Base_dList_dmap (fun i -> ((Base_dBits.v_Base_dBits_dadd32 ((v_Vuna_dCompiler_dHash_datIdx i) xs)) ((v_Vuna_dCompiler_dHash_datIdx i) ys)))) ((Base_dList.v_Base_dList_drange 0) 8)))

# 272 "Vuna/Compiler/Hash.vuna"
let v_Vuna_dCompiler_dHash_dcompressBlock = (fun st block -> ((v_Vuna_dCompiler_dHash_dzipAdd st) ((v_Vuna_dCompiler_dHash_dcompress st) (v_Vuna_dCompiler_dHash_dchunkWords block))))

# 276 "Vuna/Compiler/Hash.vuna"
let v_Vuna_dCompiler_dHash_dsha256Bytes = (fun bytes -> (((Base_dList.v_Base_dList_dfoldl v_Vuna_dCompiler_dHash_dcompressBlock) v_Vuna_dCompiler_dHash_dshaInit) (v_Vuna_dCompiler_dHash_dchunk64 (v_Vuna_dCompiler_dHash_dpadMessage bytes))))

# 29 "Vuna/Compiler/Hash.vuna"
let v_Vuna_dCompiler_dHash_ddigestOfBytes = (fun bytes -> (v_Vuna_dCompiler_dHash_dsha256Bytes bytes))

# 283 "Vuna/Compiler/Hash.vuna"
let v_Vuna_dCompiler_dHash_dpaddedLen = (fun n -> ((fun r -> ((fun z -> (((n + 1) + z) + 8)) (if (r <= 56) then (56 - r) else (120 - r)))) ((n + 1) - ((if 64 = 0 then failwith "division by zero" else (n + 1) / 64) * 64))))

# 291 "Vuna/Compiler/Hash.vuna"
let v_Vuna_dCompiler_dHash_dpaddedByte = (fun s n total i -> (if (i < n) then ((dtp_strAt s) i) else (if (i = n) then 128 else (if (i < (total - 8)) then 0 else ((Base_dBits.v_Base_dBits_dband ((Base_dBits.v_Base_dBits_dshr (n * 8)) (8 * (7 - (i - (total - 8)))))) 255)))))

# 298 "Vuna/Compiler/Hash.vuna"
let v_Vuna_dCompiler_dHash_dwordAtString = (fun s n total b j -> ((fun base -> ((fun b0 -> ((fun b1 -> ((fun b2 -> ((fun b3 -> ((Base_dBits.v_Base_dBits_dbor ((Base_dBits.v_Base_dBits_dbor ((Base_dBits.v_Base_dBits_dshl32 b0) 24)) ((Base_dBits.v_Base_dBits_dshl32 b1) 16))) ((Base_dBits.v_Base_dBits_dbor ((Base_dBits.v_Base_dBits_dshl32 b2) 8)) b3))) ((((v_Vuna_dCompiler_dHash_dpaddedByte s) n) total) (base + 3)))) ((((v_Vuna_dCompiler_dHash_dpaddedByte s) n) total) (base + 2)))) ((((v_Vuna_dCompiler_dHash_dpaddedByte s) n) total) (base + 1)))) ((((v_Vuna_dCompiler_dHash_dpaddedByte s) n) total) base))) ((b * 64) + (j * 4))))

# 309 "Vuna/Compiler/Hash.vuna"
let v_Vuna_dCompiler_dHash_dchunkWordsString = (fun s n total b -> ((Base_dList.v_Base_dList_dmap (fun j -> (((((v_Vuna_dCompiler_dHash_dwordAtString s) n) total) b) j))) ((Base_dList.v_Base_dList_drange 0) 16)))

# 313 "Vuna/Compiler/Hash.vuna"
let rec v_Vuna_dCompiler_dHash_dblocksGo = (fun s n total k b st -> (if (k <= 0) then st else ((((((v_Vuna_dCompiler_dHash_dblocksGo s) n) total) (k - 1)) (b + 1)) ((v_Vuna_dCompiler_dHash_dzipAdd st) ((v_Vuna_dCompiler_dHash_dcompress st) (v_Vuna_dCompiler_dHash_dschedule ((((v_Vuna_dCompiler_dHash_dchunkWordsString s) n) total) b)))))))

# 320 "Vuna/Compiler/Hash.vuna"
let v_Vuna_dCompiler_dHash_dsha256OfString = (fun s -> ((fun n -> ((fun total -> ((((((v_Vuna_dCompiler_dHash_dblocksGo s) n) total) (if 64 = 0 then failwith "division by zero" else total / 64)) 0) v_Vuna_dCompiler_dHash_dshaInit)) (v_Vuna_dCompiler_dHash_dpaddedLen n))) (bi_strLength s)))

# 37 "Vuna/Compiler/Hash.vuna"
let v_Vuna_dCompiler_dHash_ddigestOfString = (fun s -> (v_Vuna_dCompiler_dHash_dsha256OfString s))

# 53 "Vuna/Compiler/Hash.vuna"
let v_Vuna_dCompiler_dHash_ddigestIntOf = (fun s -> (v_Vuna_dCompiler_dHash_ddigestInt (v_Vuna_dCompiler_dHash_ddigestOfString s)))

# 344 "Vuna/Compiler/Hash.vuna"
let rec v_Vuna_dCompiler_dHash_dprehashGo = (fun k i h0 h1 h2 h3 s -> (if (k <= 0) then (String.concat "" [(bi_strFromInt h0); ","; (bi_strFromInt h1); ","; (bi_strFromInt h2); ","; (bi_strFromInt h3)]) else ((fun b -> (((((((v_Vuna_dCompiler_dHash_dprehashGo (k - 1)) (i + 1)) ((h0 * 131) + b)) ((h1 * 137) + b)) ((h2 * 139) + b)) ((h3 * 149) + b)) s)) (((dtp_strAt s) i) + 1))))

# 340 "Vuna/Compiler/Hash.vuna"
let v_Vuna_dCompiler_dHash_dprehashOfString = (fun s -> (((((((v_Vuna_dCompiler_dHash_dprehashGo (bi_strLength s)) 0) 1) 2) 3) 4) s))

# 62 "Vuna/Compiler/Hash.vuna"
let v_Vuna_dCompiler_dHash_dcontentKey = (fun s -> (v_Vuna_dCompiler_dHash_ddigestIntOf (v_Vuna_dCompiler_dHash_dprehashOfString s)))

# 361 "Vuna/Compiler/Hash.vuna"
let v_Vuna_dCompiler_dHash_ddigitAt = (fun v p -> ((Base_dBits.v_Base_dBits_dband (if p = 0 then failwith "division by zero" else v / p)) 15))

# 365 "Vuna/Compiler/Hash.vuna"
let v_Vuna_dCompiler_dHash_dhexDigit = (fun d -> (if (d < 10) then (bi_strFromInt d) else (Base_dList.dtp_pack (Base_dList.C_Base_dList_dList_Cons ((87 + d), Base_dList.C_Base_dList_dList_Nil)))))

# 355 "Vuna/Compiler/Hash.vuna"
let v_Vuna_dCompiler_dHash_dhex8 = (fun v -> (Base_dList.dtp_concatMany (Base_dList.C_Base_dList_dList_Cons ((v_Vuna_dCompiler_dHash_dhexDigit ((v_Vuna_dCompiler_dHash_ddigitAt v) 268435456)), (Base_dList.C_Base_dList_dList_Cons ((v_Vuna_dCompiler_dHash_dhexDigit ((v_Vuna_dCompiler_dHash_ddigitAt v) 16777216)), (Base_dList.C_Base_dList_dList_Cons ((v_Vuna_dCompiler_dHash_dhexDigit ((v_Vuna_dCompiler_dHash_ddigitAt v) 1048576)), (Base_dList.C_Base_dList_dList_Cons ((v_Vuna_dCompiler_dHash_dhexDigit ((v_Vuna_dCompiler_dHash_ddigitAt v) 65536)), (Base_dList.C_Base_dList_dList_Cons ((v_Vuna_dCompiler_dHash_dhexDigit ((v_Vuna_dCompiler_dHash_ddigitAt v) 4096)), (Base_dList.C_Base_dList_dList_Cons ((v_Vuna_dCompiler_dHash_dhexDigit ((v_Vuna_dCompiler_dHash_ddigitAt v) 256)), (Base_dList.C_Base_dList_dList_Cons ((v_Vuna_dCompiler_dHash_dhexDigit ((v_Vuna_dCompiler_dHash_ddigitAt v) 16)), (Base_dList.C_Base_dList_dList_Cons ((v_Vuna_dCompiler_dHash_dhexDigit ((v_Vuna_dCompiler_dHash_ddigitAt v) 1)), Base_dList.C_Base_dList_dList_Nil))))))))))))))))))

# 41 "Vuna/Compiler/Hash.vuna"
let v_Vuna_dCompiler_dHash_ddigestHex = (fun mc0 -> (let dtb__12 = mc0 in (Base_dList.dtp_concatMany ((Base_dList.v_Base_dList_dmap v_Vuna_dCompiler_dHash_dhex8) dtb__12))))

# 67 "Vuna/Compiler/Hash.vuna"
let v_Vuna_dCompiler_dHash_dcontentAddress = (fun s -> (v_Vuna_dCompiler_dHash_ddigestHex (v_Vuna_dCompiler_dHash_ddigestOfString (v_Vuna_dCompiler_dHash_dprehashOfString s))))
