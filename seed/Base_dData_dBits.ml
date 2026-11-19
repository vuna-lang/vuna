open Vuna_runtime
# 8 "Base/Data/Bits.vuna"
let v_Base_dData_dBits_dband = (fun (a : int) (b : int) -> (a land b))

# 12 "Base/Data/Bits.vuna"
let v_Base_dData_dBits_dbor = (fun (a : int) (b : int) -> (a lor b))

# 16 "Base/Data/Bits.vuna"
let v_Base_dData_dBits_dbxor = (fun (a : int) (b : int) -> (a lxor b))

# 20 "Base/Data/Bits.vuna"
let v_Base_dData_dBits_dbnot = (fun (a : int) -> (lnot a))

# 24 "Base/Data/Bits.vuna"
let v_Base_dData_dBits_dshl = (fun (a : int) (n : int) -> (if n < 0 || n >= 63 then 0 else a lsl n))

# 28 "Base/Data/Bits.vuna"
let v_Base_dData_dBits_dshr = (fun (a : int) (n : int) -> (if n < 0 || n >= 63 then 0 else a lsr n))

# 32 "Base/Data/Bits.vuna"
let v_Base_dData_dBits_dmask32 = (fun (x : int) -> ((v_Base_dData_dBits_dband x) 4294967295))

# 36 "Base/Data/Bits.vuna"
let v_Base_dData_dBits_dmask8 = (fun (x : int) -> ((v_Base_dData_dBits_dband x) 255))

# 41 "Base/Data/Bits.vuna"
let v_Base_dData_dBits_dshl32 = (fun (x : int) (n : int) -> (v_Base_dData_dBits_dmask32 ((v_Base_dData_dBits_dshl x) n)))

# 45 "Base/Data/Bits.vuna"
let v_Base_dData_dBits_dshr32 = (fun (x : int) (n : int) -> ((v_Base_dData_dBits_dshr (v_Base_dData_dBits_dmask32 x)) n))

# 49 "Base/Data/Bits.vuna"
let v_Base_dData_dBits_dadd32 = (fun (a : int) (b : int) -> (v_Base_dData_dBits_dmask32 (a + b)))

# 53 "Base/Data/Bits.vuna"
let v_Base_dData_dBits_drotr32 = (fun (x : int) (n : int) -> ((fun m -> ((fun low -> ((v_Base_dData_dBits_dbor ((v_Base_dData_dBits_dshr32 x) m)) ((v_Base_dData_dBits_dshl low) (32 - m)))) ((v_Base_dData_dBits_dband x) (((v_Base_dData_dBits_dshl 1) m) - 1)))) (n - ((if 32 = 0 then failwith "division by zero" else n / 32) * 32))))

# 61 "Base/Data/Bits.vuna"
let v_Base_dData_dBits_drol32 = (fun (x : int) (n : int) -> ((fun m -> ((fun low -> ((fun high -> ((v_Base_dData_dBits_dbor low) high)) ((v_Base_dData_dBits_dshr32 x) (32 - m)))) ((v_Base_dData_dBits_dshl32 x) m))) (n - ((if 32 = 0 then failwith "division by zero" else n / 32) * 32))))
