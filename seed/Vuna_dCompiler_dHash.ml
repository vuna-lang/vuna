open Vuna_runtime
type t_Vuna_dCompiler_dHash_dDigest = int Base_dList.t_Base_dList_dList

let v_Vuna_dCompiler_dHash_dhashVersion = 2

let v_Vuna_dCompiler_dHash_ddigestLanes = (fun mc0 -> (let dtb__0 = mc0 in dtb__0))

let v_Vuna_dCompiler_dHash_dshaInit = (Base_dList.C_Base_dList_dList_Cons (1779033703, (Base_dList.C_Base_dList_dList_Cons (3144134277, (Base_dList.C_Base_dList_dList_Cons (1013904242, (Base_dList.C_Base_dList_dList_Cons (2773480762, (Base_dList.C_Base_dList_dList_Cons (1359893119, (Base_dList.C_Base_dList_dList_Cons (2600822924, (Base_dList.C_Base_dList_dList_Cons (528734635, (Base_dList.C_Base_dList_dList_Cons (1541459225, Base_dList.C_Base_dList_dList_Nil))))))))))))))))

let v_Vuna_dCompiler_dHash_dshaK = (Base_dList.C_Base_dList_dList_Cons (1116352408, (Base_dList.C_Base_dList_dList_Cons (1899447441, (Base_dList.C_Base_dList_dList_Cons (3049323471, (Base_dList.C_Base_dList_dList_Cons (3921009573, (Base_dList.C_Base_dList_dList_Cons (961987163, (Base_dList.C_Base_dList_dList_Cons (1508970993, (Base_dList.C_Base_dList_dList_Cons (2453635748, (Base_dList.C_Base_dList_dList_Cons (2870763221, (Base_dList.C_Base_dList_dList_Cons (3624381080, (Base_dList.C_Base_dList_dList_Cons (310598401, (Base_dList.C_Base_dList_dList_Cons (607225278, (Base_dList.C_Base_dList_dList_Cons (1426881987, (Base_dList.C_Base_dList_dList_Cons (1925078388, (Base_dList.C_Base_dList_dList_Cons (2162078206, (Base_dList.C_Base_dList_dList_Cons (2614888103, (Base_dList.C_Base_dList_dList_Cons (3248222580, (Base_dList.C_Base_dList_dList_Cons (3835390401, (Base_dList.C_Base_dList_dList_Cons (4022224774, (Base_dList.C_Base_dList_dList_Cons (264347078, (Base_dList.C_Base_dList_dList_Cons (604807628, (Base_dList.C_Base_dList_dList_Cons (770255983, (Base_dList.C_Base_dList_dList_Cons (1249150122, (Base_dList.C_Base_dList_dList_Cons (1555081692, (Base_dList.C_Base_dList_dList_Cons (1996064986, (Base_dList.C_Base_dList_dList_Cons (2554220882, (Base_dList.C_Base_dList_dList_Cons (2821834349, (Base_dList.C_Base_dList_dList_Cons (2952996808, (Base_dList.C_Base_dList_dList_Cons (3210313671, (Base_dList.C_Base_dList_dList_Cons (3336571891, (Base_dList.C_Base_dList_dList_Cons (3584528711, (Base_dList.C_Base_dList_dList_Cons (113926993, (Base_dList.C_Base_dList_dList_Cons (338241895, (Base_dList.C_Base_dList_dList_Cons (666307205, (Base_dList.C_Base_dList_dList_Cons (773529912, (Base_dList.C_Base_dList_dList_Cons (1294757372, (Base_dList.C_Base_dList_dList_Cons (1396182291, (Base_dList.C_Base_dList_dList_Cons (1695183700, (Base_dList.C_Base_dList_dList_Cons (1986661051, (Base_dList.C_Base_dList_dList_Cons (2177026350, (Base_dList.C_Base_dList_dList_Cons (2456956037, (Base_dList.C_Base_dList_dList_Cons (2730485921, (Base_dList.C_Base_dList_dList_Cons (2820302411, (Base_dList.C_Base_dList_dList_Cons (3259730800, (Base_dList.C_Base_dList_dList_Cons (3345764771, (Base_dList.C_Base_dList_dList_Cons (3516065817, (Base_dList.C_Base_dList_dList_Cons (3600352804, (Base_dList.C_Base_dList_dList_Cons (4094571909, (Base_dList.C_Base_dList_dList_Cons (275423344, (Base_dList.C_Base_dList_dList_Cons (430227734, (Base_dList.C_Base_dList_dList_Cons (506948616, (Base_dList.C_Base_dList_dList_Cons (659060556, (Base_dList.C_Base_dList_dList_Cons (883997877, (Base_dList.C_Base_dList_dList_Cons (958139571, (Base_dList.C_Base_dList_dList_Cons (1322822218, (Base_dList.C_Base_dList_dList_Cons (1537002063, (Base_dList.C_Base_dList_dList_Cons (1747873779, (Base_dList.C_Base_dList_dList_Cons (1955562222, (Base_dList.C_Base_dList_dList_Cons (2024104815, (Base_dList.C_Base_dList_dList_Cons (2227730452, (Base_dList.C_Base_dList_dList_Cons (2361852424, (Base_dList.C_Base_dList_dList_Cons (2428436474, (Base_dList.C_Base_dList_dList_Cons (2756734187, (Base_dList.C_Base_dList_dList_Cons (3204031479, (Base_dList.C_Base_dList_dList_Cons (3329325298, Base_dList.C_Base_dList_dList_Nil))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))

let rec v_Vuna_dCompiler_dHash_dlenInt = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__1, dtb__2) -> (1 + (v_Vuna_dCompiler_dHash_dlenInt dtb__2))
  | Base_dList.C_Base_dList_dList_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dHash_datIdx = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__3, dtb__4) -> (if (mc0 <= 0) then dtb__3 else ((v_Vuna_dCompiler_dHash_datIdx (mc0 - 1)) dtb__4))
  | Base_dList.C_Base_dList_dList_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dHash_dzeros = (fun n -> ((Base_dList.v_Base_dList_dmap (fun _u -> 0)) ((Base_dList.v_Base_dList_drange 0) n)))

let v_Vuna_dCompiler_dHash_dlenBytes = (fun n -> (Base_dList.C_Base_dList_dList_Cons (((Base_dBits.v_Base_dBits_dband ((Base_dBits.v_Base_dBits_dshr n) 56)) 255), (Base_dList.C_Base_dList_dList_Cons (((Base_dBits.v_Base_dBits_dband ((Base_dBits.v_Base_dBits_dshr n) 48)) 255), (Base_dList.C_Base_dList_dList_Cons (((Base_dBits.v_Base_dBits_dband ((Base_dBits.v_Base_dBits_dshr n) 40)) 255), (Base_dList.C_Base_dList_dList_Cons (((Base_dBits.v_Base_dBits_dband ((Base_dBits.v_Base_dBits_dshr n) 32)) 255), (Base_dList.C_Base_dList_dList_Cons (((Base_dBits.v_Base_dBits_dband ((Base_dBits.v_Base_dBits_dshr n) 24)) 255), (Base_dList.C_Base_dList_dList_Cons (((Base_dBits.v_Base_dBits_dband ((Base_dBits.v_Base_dBits_dshr n) 16)) 255), (Base_dList.C_Base_dList_dList_Cons (((Base_dBits.v_Base_dBits_dband ((Base_dBits.v_Base_dBits_dshr n) 8)) 255), (Base_dList.C_Base_dList_dList_Cons (((Base_dBits.v_Base_dBits_dband n) 255), Base_dList.C_Base_dList_dList_Nil)))))))))))))))))

let v_Vuna_dCompiler_dHash_dpadMessage = (fun bytes -> ((fun n -> ((fun r -> ((fun zerosNeeded -> ((Base_dList.v_Base_dList_dappend ((Base_dList.v_Base_dList_dappend ((Base_dList.v_Base_dList_dappend bytes) (Base_dList.C_Base_dList_dList_Cons (128, Base_dList.C_Base_dList_dList_Nil)))) (v_Vuna_dCompiler_dHash_dzeros zerosNeeded))) (v_Vuna_dCompiler_dHash_dlenBytes (n * 8)))) (if (r <= 56) then (56 - r) else (120 - r)))) ((n + 1) - ((if 64 = 0 then failwith "division by zero" else (n + 1) / 64) * 64)))) (v_Vuna_dCompiler_dHash_dlenInt bytes)))

let rec v_Vuna_dCompiler_dHash_dchunks = (fun k bytes -> (if (k <= 0) then Base_dList.C_Base_dList_dList_Nil else (Base_dList.C_Base_dList_dList_Cons (((Base_dList.v_Base_dList_dtake 64) bytes), ((v_Vuna_dCompiler_dHash_dchunks (k - 1)) ((Base_dList.v_Base_dList_ddrop 64) bytes))))))

let v_Vuna_dCompiler_dHash_dchunk64 = (fun bytes -> ((v_Vuna_dCompiler_dHash_dchunks (if 64 = 0 then failwith "division by zero" else ((v_Vuna_dCompiler_dHash_dlenInt bytes) + 63) / 64)) bytes))

let v_Vuna_dCompiler_dHash_dwordAt = (fun chunk j -> ((fun b0 -> ((fun b1 -> ((fun b2 -> ((fun b3 -> ((Base_dBits.v_Base_dBits_dbor ((Base_dBits.v_Base_dBits_dbor ((Base_dBits.v_Base_dBits_dshl32 b0) 24)) ((Base_dBits.v_Base_dBits_dshl32 b1) 16))) ((Base_dBits.v_Base_dBits_dbor ((Base_dBits.v_Base_dBits_dshl32 b2) 8)) b3))) ((v_Vuna_dCompiler_dHash_datIdx ((j * 4) + 3)) chunk))) ((v_Vuna_dCompiler_dHash_datIdx ((j * 4) + 2)) chunk))) ((v_Vuna_dCompiler_dHash_datIdx ((j * 4) + 1)) chunk))) ((v_Vuna_dCompiler_dHash_datIdx (j * 4)) chunk)))

let v_Vuna_dCompiler_dHash_dchunkWords = (fun chunk -> ((Base_dList.v_Base_dList_dmap (fun j -> ((v_Vuna_dCompiler_dHash_dwordAt chunk) j))) ((Base_dList.v_Base_dList_drange 0) 16)))

let v_Vuna_dCompiler_dHash_dsigma0Small = (fun x -> ((Base_dBits.v_Base_dBits_dbxor ((Base_dBits.v_Base_dBits_drotr32 x) 7)) ((Base_dBits.v_Base_dBits_dbxor ((Base_dBits.v_Base_dBits_drotr32 x) 18)) ((Base_dBits.v_Base_dBits_dshr32 x) 3))))

let v_Vuna_dCompiler_dHash_dsigma1Small = (fun x -> ((Base_dBits.v_Base_dBits_dbxor ((Base_dBits.v_Base_dBits_drotr32 x) 17)) ((Base_dBits.v_Base_dBits_dbxor ((Base_dBits.v_Base_dBits_drotr32 x) 19)) ((Base_dBits.v_Base_dBits_dshr32 x) 10))))

let v_Vuna_dCompiler_dHash_dbigSigma0 = (fun x -> ((Base_dBits.v_Base_dBits_dbxor ((Base_dBits.v_Base_dBits_drotr32 x) 2)) ((Base_dBits.v_Base_dBits_dbxor ((Base_dBits.v_Base_dBits_drotr32 x) 13)) ((Base_dBits.v_Base_dBits_drotr32 x) 22))))

let v_Vuna_dCompiler_dHash_dbigSigma1 = (fun x -> ((Base_dBits.v_Base_dBits_dbxor ((Base_dBits.v_Base_dBits_drotr32 x) 6)) ((Base_dBits.v_Base_dBits_dbxor ((Base_dBits.v_Base_dBits_drotr32 x) 11)) ((Base_dBits.v_Base_dBits_drotr32 x) 25))))

let v_Vuna_dCompiler_dHash_dextend = (fun ws i -> ((fun w2 -> ((fun w7 -> ((fun w15 -> ((fun w16 -> ((Base_dList.v_Base_dList_dappend ws) (Base_dList.C_Base_dList_dList_Cons (((Base_dBits.v_Base_dBits_dadd32 ((Base_dBits.v_Base_dBits_dadd32 (v_Vuna_dCompiler_dHash_dsigma1Small w2)) w7)) ((Base_dBits.v_Base_dBits_dadd32 w16) (v_Vuna_dCompiler_dHash_dsigma0Small w15))), Base_dList.C_Base_dList_dList_Nil)))) ((v_Vuna_dCompiler_dHash_datIdx (i - 16)) ws))) ((v_Vuna_dCompiler_dHash_datIdx (i - 15)) ws))) ((v_Vuna_dCompiler_dHash_datIdx (i - 7)) ws))) ((v_Vuna_dCompiler_dHash_datIdx (i - 2)) ws)))

let v_Vuna_dCompiler_dHash_dschedule = (fun w16 -> (((Base_dList.v_Base_dList_dfoldl v_Vuna_dCompiler_dHash_dextend) w16) ((Base_dList.v_Base_dList_drange 16) 64)))

let v_Vuna_dCompiler_dHash_droundStep = (fun ws st i -> ((fun a -> ((fun b -> ((fun c -> ((fun d -> ((fun e -> ((fun f -> ((fun g -> ((fun h -> ((fun s1 -> ((fun ch -> ((fun t1 -> ((fun s0 -> ((fun maj -> ((fun t2 -> (Base_dList.C_Base_dList_dList_Cons (((Base_dBits.v_Base_dBits_dadd32 t1) t2), (Base_dList.C_Base_dList_dList_Cons (a, (Base_dList.C_Base_dList_dList_Cons (b, (Base_dList.C_Base_dList_dList_Cons (c, (Base_dList.C_Base_dList_dList_Cons (((Base_dBits.v_Base_dBits_dadd32 d) t1), (Base_dList.C_Base_dList_dList_Cons (e, (Base_dList.C_Base_dList_dList_Cons (f, (Base_dList.C_Base_dList_dList_Cons (g, Base_dList.C_Base_dList_dList_Nil))))))))))))))))) ((Base_dBits.v_Base_dBits_dadd32 s0) maj))) ((Base_dBits.v_Base_dBits_dbxor ((Base_dBits.v_Base_dBits_dband a) b)) ((Base_dBits.v_Base_dBits_dbxor ((Base_dBits.v_Base_dBits_dband a) c)) ((Base_dBits.v_Base_dBits_dband b) c))))) (v_Vuna_dCompiler_dHash_dbigSigma0 a))) ((Base_dBits.v_Base_dBits_dadd32 ((Base_dBits.v_Base_dBits_dadd32 ((Base_dBits.v_Base_dBits_dadd32 h) s1)) ((Base_dBits.v_Base_dBits_dadd32 ch) ((v_Vuna_dCompiler_dHash_datIdx i) v_Vuna_dCompiler_dHash_dshaK)))) ((v_Vuna_dCompiler_dHash_datIdx i) ws)))) ((Base_dBits.v_Base_dBits_dbxor ((Base_dBits.v_Base_dBits_dband e) f)) ((Base_dBits.v_Base_dBits_dband (Base_dBits.v_Base_dBits_dbnot e)) g)))) (v_Vuna_dCompiler_dHash_dbigSigma1 e))) ((v_Vuna_dCompiler_dHash_datIdx 7) st))) ((v_Vuna_dCompiler_dHash_datIdx 6) st))) ((v_Vuna_dCompiler_dHash_datIdx 5) st))) ((v_Vuna_dCompiler_dHash_datIdx 4) st))) ((v_Vuna_dCompiler_dHash_datIdx 3) st))) ((v_Vuna_dCompiler_dHash_datIdx 2) st))) ((v_Vuna_dCompiler_dHash_datIdx 1) st))) ((v_Vuna_dCompiler_dHash_datIdx 0) st)))

let v_Vuna_dCompiler_dHash_dcompress = (fun st ws -> (((Base_dList.v_Base_dList_dfoldl (v_Vuna_dCompiler_dHash_droundStep ws)) st) ((Base_dList.v_Base_dList_drange 0) 64)))

let v_Vuna_dCompiler_dHash_dzipAdd = (fun xs ys -> ((Base_dList.v_Base_dList_dmap (fun i -> ((Base_dBits.v_Base_dBits_dadd32 ((v_Vuna_dCompiler_dHash_datIdx i) xs)) ((v_Vuna_dCompiler_dHash_datIdx i) ys)))) ((Base_dList.v_Base_dList_drange 0) 8)))

let v_Vuna_dCompiler_dHash_dcompressBlock = (fun st block -> ((v_Vuna_dCompiler_dHash_dzipAdd st) ((v_Vuna_dCompiler_dHash_dcompress st) (v_Vuna_dCompiler_dHash_dschedule (v_Vuna_dCompiler_dHash_dchunkWords block)))))

let v_Vuna_dCompiler_dHash_dsha256Bytes = (fun bytes -> (((Base_dList.v_Base_dList_dfoldl v_Vuna_dCompiler_dHash_dcompressBlock) v_Vuna_dCompiler_dHash_dshaInit) (v_Vuna_dCompiler_dHash_dchunk64 (v_Vuna_dCompiler_dHash_dpadMessage bytes))))

let v_Vuna_dCompiler_dHash_ddigestOfBytes = (fun bytes -> (v_Vuna_dCompiler_dHash_dsha256Bytes bytes))

let v_Vuna_dCompiler_dHash_ddigestOfString = (fun s -> (v_Vuna_dCompiler_dHash_ddigestOfBytes (Base_dList.dtp_unpack s)))

let v_Vuna_dCompiler_dHash_ddigitAt = (fun v p -> ((Base_dBits.v_Base_dBits_dband (if p = 0 then failwith "division by zero" else v / p)) 15))

let v_Vuna_dCompiler_dHash_dhexDigit = (fun d -> (if (d < 10) then (bi_strFromInt d) else (Base_dList.dtp_pack (Base_dList.C_Base_dList_dList_Cons ((87 + d), Base_dList.C_Base_dList_dList_Nil)))))

let v_Vuna_dCompiler_dHash_dhex8 = (fun v -> (Base_dList.dtp_concatMany (Base_dList.C_Base_dList_dList_Cons ((v_Vuna_dCompiler_dHash_dhexDigit ((v_Vuna_dCompiler_dHash_ddigitAt v) 268435456)), (Base_dList.C_Base_dList_dList_Cons ((v_Vuna_dCompiler_dHash_dhexDigit ((v_Vuna_dCompiler_dHash_ddigitAt v) 16777216)), (Base_dList.C_Base_dList_dList_Cons ((v_Vuna_dCompiler_dHash_dhexDigit ((v_Vuna_dCompiler_dHash_ddigitAt v) 1048576)), (Base_dList.C_Base_dList_dList_Cons ((v_Vuna_dCompiler_dHash_dhexDigit ((v_Vuna_dCompiler_dHash_ddigitAt v) 65536)), (Base_dList.C_Base_dList_dList_Cons ((v_Vuna_dCompiler_dHash_dhexDigit ((v_Vuna_dCompiler_dHash_ddigitAt v) 4096)), (Base_dList.C_Base_dList_dList_Cons ((v_Vuna_dCompiler_dHash_dhexDigit ((v_Vuna_dCompiler_dHash_ddigitAt v) 256)), (Base_dList.C_Base_dList_dList_Cons ((v_Vuna_dCompiler_dHash_dhexDigit ((v_Vuna_dCompiler_dHash_ddigitAt v) 16)), (Base_dList.C_Base_dList_dList_Cons ((v_Vuna_dCompiler_dHash_dhexDigit ((v_Vuna_dCompiler_dHash_ddigitAt v) 1)), Base_dList.C_Base_dList_dList_Nil))))))))))))))))))

let v_Vuna_dCompiler_dHash_ddigestHex = (fun mc0 -> (let dtb__5 = mc0 in (Base_dList.dtp_concatMany ((Base_dList.v_Base_dList_dmap v_Vuna_dCompiler_dHash_dhex8) dtb__5))))

let v_Vuna_dCompiler_dHash_dbyte8 = (fun n -> (Base_dList.C_Base_dList_dList_Cons (((Base_dBits.v_Base_dBits_dband ((Base_dBits.v_Base_dBits_dshr n) 56)) 255), (Base_dList.C_Base_dList_dList_Cons (((Base_dBits.v_Base_dBits_dband ((Base_dBits.v_Base_dBits_dshr n) 48)) 255), (Base_dList.C_Base_dList_dList_Cons (((Base_dBits.v_Base_dBits_dband ((Base_dBits.v_Base_dBits_dshr n) 40)) 255), (Base_dList.C_Base_dList_dList_Cons (((Base_dBits.v_Base_dBits_dband ((Base_dBits.v_Base_dBits_dshr n) 32)) 255), (Base_dList.C_Base_dList_dList_Cons (((Base_dBits.v_Base_dBits_dband ((Base_dBits.v_Base_dBits_dshr n) 24)) 255), (Base_dList.C_Base_dList_dList_Cons (((Base_dBits.v_Base_dBits_dband ((Base_dBits.v_Base_dBits_dshr n) 16)) 255), (Base_dList.C_Base_dList_dList_Cons (((Base_dBits.v_Base_dBits_dband ((Base_dBits.v_Base_dBits_dshr n) 8)) 255), (Base_dList.C_Base_dList_dList_Cons (((Base_dBits.v_Base_dBits_dband n) 255), Base_dList.C_Base_dList_dList_Nil)))))))))))))))))

let v_Vuna_dCompiler_dHash_dencInt = (fun v -> ((fun neg -> ((fun n -> ((fun sign -> ((Base_dList.v_Base_dList_dappend sign) (v_Vuna_dCompiler_dHash_dbyte8 n))) (if neg then (Base_dList.C_Base_dList_dList_Cons (1, Base_dList.C_Base_dList_dList_Nil)) else (Base_dList.C_Base_dList_dList_Cons (0, Base_dList.C_Base_dList_dList_Nil))))) (if neg then (0 - v) else v))) (v < 0)))

let v_Vuna_dCompiler_dHash_dencString = (fun s -> ((fun bytes -> ((Base_dList.v_Base_dList_dappend (v_Vuna_dCompiler_dHash_dencInt (v_Vuna_dCompiler_dHash_dlenInt bytes))) bytes)) (Base_dList.dtp_unpack s)))

let v_Vuna_dCompiler_dHash_dencList = (fun f xs -> ((Base_dList.v_Base_dList_dappend (v_Vuna_dCompiler_dHash_dencInt (v_Vuna_dCompiler_dHash_dlenInt xs))) ((Base_dList.v_Base_dList_dconcatMap f) xs)))

let v_Vuna_dCompiler_dHash_dencTag = (fun _uarity0 -> (v_Vuna_dCompiler_dHash_dencInt _uarity0))
