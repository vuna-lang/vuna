open Vuna_runtime
# 8 "Base/Data/Bits.vuna"
let v_band = (fun (a : int) (b : int) -> (a land b))

# 12 "Base/Data/Bits.vuna"
let v_bor = (fun (a : int) (b : int) -> (a lor b))

# 16 "Base/Data/Bits.vuna"
let v_bxor = (fun (a : int) (b : int) -> (a lxor b))

# 20 "Base/Data/Bits.vuna"
let v_bnot = (fun (a : int) -> (lnot a))

# 24 "Base/Data/Bits.vuna"
let v_shl = (fun (a : int) (n : int) -> (if n < 0 || n >= 63 then 0 else a lsl n))

# 28 "Base/Data/Bits.vuna"
let v_shr = (fun (a : int) (n : int) -> (if n < 0 || n >= 63 then 0 else a lsr n))

# 32 "Base/Data/Bits.vuna"
let v_mask32 = (fun (x : int) -> ((v_band x) 4294967295))

# 36 "Base/Data/Bits.vuna"
let v_mask8 = (fun (x : int) -> ((v_band x) 255))

# 41 "Base/Data/Bits.vuna"
let v_shl32 = (fun (x : int) (n : int) -> (v_mask32 ((v_shl x) n)))

# 45 "Base/Data/Bits.vuna"
let v_shr32 = (fun (x : int) (n : int) -> ((v_shr (v_mask32 x)) n))

# 49 "Base/Data/Bits.vuna"
let v_add32 = (fun (a : int) (b : int) -> (v_mask32 (a + b)))

# 53 "Base/Data/Bits.vuna"
let v_rotr32 = (fun (x : int) (n : int) -> ((fun m -> ((fun low -> ((v_bor ((v_shr32 x) m)) ((v_shl low) (32 - m)))) ((v_band x) (((v_shl 1) m) - 1)))) (n - ((if 32 = 0 then failwith "division by zero" else n / 32) * 32))))

# 61 "Base/Data/Bits.vuna"
let v_rol32 = (fun (x : int) (n : int) -> ((fun m -> ((fun low -> ((fun high -> ((v_bor low) high)) ((v_shr32 x) (32 - m)))) ((v_shl32 x) m))) (n - ((if 32 = 0 then failwith "division by zero" else n / 32) * 32))))
