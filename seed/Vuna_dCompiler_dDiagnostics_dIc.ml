open Vuna_runtime
type t_Vuna_dCompiler_dDiagnostics_dIc_dIcErr = C_Vuna_dCompiler_dDiagnostics_dIc_dIcErr_FuelExhausted of (string) | C_Vuna_dCompiler_dDiagnostics_dIc_dIcErr_InvariantViolated of (string)
and t_Vuna_dCompiler_dDiagnostics_dIc_dIcEntry = { f_Vuna_dCompiler_dDiagnostics_dIc_dIcEntry_icEntryCode : string; f_Vuna_dCompiler_dDiagnostics_dIc_dIcEntry_icEntryTemplate : string; f_Vuna_dCompiler_dDiagnostics_dIc_dIcEntry_icEntryDesc : string }

# 16 "Vuna/Compiler/Diagnostics/Ic.vuna"
let v_Vuna_dCompiler_dDiagnostics_dIc_dicCode = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dDiagnostics_dIc_dIcErr_InvariantViolated (dtb__0) -> "IC_InvariantViolated"
  | C_Vuna_dCompiler_dDiagnostics_dIc_dIcErr_FuelExhausted (dtb__1) -> "IC_FuelExhausted"
  | _ -> failwith "DT: impossible branch"
))

# 20 "Vuna/Compiler/Diagnostics/Ic.vuna"
let v_Vuna_dCompiler_dDiagnostics_dIc_dicTemplate = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dDiagnostics_dIc_dIcErr_InvariantViolated (dtb__2) -> "internal invariant violated: <0>"
  | C_Vuna_dCompiler_dDiagnostics_dIc_dIcErr_FuelExhausted (dtb__3) -> "<0> ran out of fuel (compiler invariant: the phase must make progress)"
  | _ -> failwith "DT: impossible branch"
))

# 30 "Vuna/Compiler/Diagnostics/Ic.vuna"
let v_Vuna_dCompiler_dDiagnostics_dIc_dicAll = (Base_dList.C_Base_dList_dList_Cons ({ f_Vuna_dCompiler_dDiagnostics_dIc_dIcEntry_icEntryCode = (v_Vuna_dCompiler_dDiagnostics_dIc_dicCode (C_Vuna_dCompiler_dDiagnostics_dIc_dIcErr_FuelExhausted (""))); f_Vuna_dCompiler_dDiagnostics_dIc_dIcEntry_icEntryTemplate = (v_Vuna_dCompiler_dDiagnostics_dIc_dicTemplate (C_Vuna_dCompiler_dDiagnostics_dIc_dIcErr_FuelExhausted (""))); f_Vuna_dCompiler_dDiagnostics_dIc_dIcEntry_icEntryDesc = "\233\152\182\230\174\181\231\135\131\230\150\153\232\128\151\229\176\189\239\188\136\231\188\150\232\175\145\229\153\168\228\184\141\229\143\152\233\135\143\239\188\154\229\191\133\233\161\187\230\142\168\232\191\155\239\188\137" }, (Base_dList.C_Base_dList_dList_Cons ({ f_Vuna_dCompiler_dDiagnostics_dIc_dIcEntry_icEntryCode = (v_Vuna_dCompiler_dDiagnostics_dIc_dicCode (C_Vuna_dCompiler_dDiagnostics_dIc_dIcErr_InvariantViolated (""))); f_Vuna_dCompiler_dDiagnostics_dIc_dIcEntry_icEntryTemplate = (v_Vuna_dCompiler_dDiagnostics_dIc_dicTemplate (C_Vuna_dCompiler_dDiagnostics_dIc_dIcErr_InvariantViolated (""))); f_Vuna_dCompiler_dDiagnostics_dIc_dIcEntry_icEntryDesc = "\231\188\150\232\175\145\229\153\168\229\134\133\233\131\168\228\184\141\229\143\152\233\135\143\232\162\171\231\160\180\229\157\143" }, Base_dList.C_Base_dList_dList_Nil))))
