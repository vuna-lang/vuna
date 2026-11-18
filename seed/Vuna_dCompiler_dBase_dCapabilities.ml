open Vuna_runtime
type t_Vuna_dCompiler_dBase_dCapabilities_dCapability = C_Vuna_dCompiler_dBase_dCapabilities_dCapability_CapAvailable | C_Vuna_dCompiler_dBase_dCapabilities_dCapability_CapUnavailable

# 28 "Vuna/Compiler/Base/Capabilities.vuna"
let v_Vuna_dCompiler_dBase_dCapabilities_dwasmCapabilityOf = (fun (mc0 : string) -> (if (mc0 = "Base.Effect.Process.ProcessOp") then C_Vuna_dCompiler_dBase_dCapabilities_dCapability_CapUnavailable else (if (mc0 = "Base.Effect.Stdin.StdinOp") then C_Vuna_dCompiler_dBase_dCapabilities_dCapability_CapUnavailable else (if (mc0 = "Base.Effect.Net.NetOp") then C_Vuna_dCompiler_dBase_dCapabilities_dCapability_CapUnavailable else C_Vuna_dCompiler_dBase_dCapabilities_dCapability_CapAvailable))))

# 23 "Vuna/Compiler/Base/Capabilities.vuna"
let v_Vuna_dCompiler_dBase_dCapabilities_dcapabilityOf = (fun target tag -> (if (target = "wasm") then (v_Vuna_dCompiler_dBase_dCapabilities_dwasmCapabilityOf tag) else C_Vuna_dCompiler_dBase_dCapabilities_dCapability_CapAvailable))
