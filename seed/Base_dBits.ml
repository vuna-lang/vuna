open Vuna_runtime
# 17 "Base/Bits.vuna"
let v_Base_dBits_dband = (fun a b -> ((bi_bitAnd a) b))

# 21 "Base/Bits.vuna"
let v_Base_dBits_dbor = (fun a b -> ((bi_bitOr a) b))

# 25 "Base/Bits.vuna"
let v_Base_dBits_dbxor = (fun a b -> ((bi_bitXor a) b))

# 29 "Base/Bits.vuna"
let v_Base_dBits_dbnot = (fun a -> (bi_bitNot a))

# 33 "Base/Bits.vuna"
let v_Base_dBits_dshl = (fun a n -> ((bi_bitShl a) n))

# 37 "Base/Bits.vuna"
let v_Base_dBits_dshr = (fun a n -> ((bi_bitShr a) n))

# 41 "Base/Bits.vuna"
let v_Base_dBits_dmask32 = (fun x -> ((v_Base_dBits_dband x) 4294967295))

# 45 "Base/Bits.vuna"
let v_Base_dBits_dmask8 = (fun x -> ((v_Base_dBits_dband x) 255))

# 49 "Base/Bits.vuna"
let v_Base_dBits_dshl32 = (fun x n -> (v_Base_dBits_dmask32 ((v_Base_dBits_dshl x) n)))

# 53 "Base/Bits.vuna"
let v_Base_dBits_dshr32 = (fun x n -> ((v_Base_dBits_dshr (v_Base_dBits_dmask32 x)) n))

# 57 "Base/Bits.vuna"
let v_Base_dBits_dadd32 = (fun a b -> (v_Base_dBits_dmask32 (a + b)))

# 61 "Base/Bits.vuna"
let v_Base_dBits_drotr32 = (fun x n -> ((fun m -> ((fun low -> ((v_Base_dBits_dbor ((v_Base_dBits_dshr32 x) m)) ((v_Base_dBits_dshl low) (32 - m)))) ((v_Base_dBits_dband x) (((v_Base_dBits_dshl 1) m) - 1)))) (n - ((if 32 = 0 then failwith "division by zero" else n / 32) * 32))))

# 69 "Base/Bits.vuna"
let v_Base_dBits_drol32 = (fun x n -> ((fun m -> ((fun low -> ((fun high -> ((v_Base_dBits_dbor low) high)) ((v_Base_dBits_dshr32 x) (32 - m)))) ((v_Base_dBits_dshl32 x) m))) (n - ((if 32 = 0 then failwith "division by zero" else n / 32) * 32))))
