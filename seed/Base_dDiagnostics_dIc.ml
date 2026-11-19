open Vuna_runtime
type t_IcErr = C_IcErr_FuelExhausted of (string) | C_IcErr_InvariantViolated of (string)
and t_IcEntry = { f_IcEntry_icEntryCode : string; f_IcEntry_icEntryTemplate : string; f_IcEntry_icEntryDesc : string }

# 16 "Vuna/Compiler/Base/Diagnostics/Ic.vuna"
let v_icCode = (fun (mc0 : t_IcErr) -> (match mc0 with
  | C_IcErr_InvariantViolated (dtb__0) -> "IC_InvariantViolated"
  | C_IcErr_FuelExhausted (dtb__1) -> "IC_FuelExhausted"
  | _ -> failwith "DT: impossible branch"
))

# 20 "Vuna/Compiler/Base/Diagnostics/Ic.vuna"
let v_icTemplate = (fun (mc0 : t_IcErr) -> (match mc0 with
  | C_IcErr_InvariantViolated (dtb__2) -> "internal invariant violated: <0>"
  | C_IcErr_FuelExhausted (dtb__3) -> "<0> ran out of fuel (compiler invariant: the phase must make progress)"
  | _ -> failwith "DT: impossible branch"
))

# 30 "Vuna/Compiler/Base/Diagnostics/Ic.vuna"
let v_icAll = (B_dData_dList.C_List__x58__x58_ ({ f_IcEntry_icEntryCode = (v_icCode (C_IcErr_FuelExhausted (""))); f_IcEntry_icEntryTemplate = (v_icTemplate (C_IcErr_FuelExhausted (""))); f_IcEntry_icEntryDesc = "\233\152\182\230\174\181\231\135\131\230\150\153\232\128\151\229\176\189\239\188\136\231\188\150\232\175\145\229\153\168\228\184\141\229\143\152\233\135\143\239\188\154\233\152\182\230\174\181\229\191\133\233\161\187\230\142\168\232\191\155\239\188\137" }, (B_dData_dList.C_List__x58__x58_ ({ f_IcEntry_icEntryCode = (v_icCode (C_IcErr_InvariantViolated (""))); f_IcEntry_icEntryTemplate = (v_icTemplate (C_IcErr_InvariantViolated (""))); f_IcEntry_icEntryDesc = "\231\188\150\232\175\145\229\153\168\229\134\133\233\131\168\228\184\141\229\143\152\233\135\143\232\162\171\231\160\180\229\157\143" }, B_dData_dList.C_List_Nil))))
