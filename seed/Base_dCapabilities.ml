open Vuna_runtime
type t_Capability = C_Capability_CapAvailable | C_Capability_CapUnavailable

# 28 "Vuna/Compiler/Base/Capabilities.vuna"
let v_wasmCapabilityOf = (fun (mc0 : string) -> (if (mc0 = "Base.Effect.Process.ProcessOp") then C_Capability_CapUnavailable else (if (mc0 = "Base.Effect.Stdin.StdinOp") then C_Capability_CapUnavailable else (if (mc0 = "Base.Effect.Net.NetOp") then C_Capability_CapUnavailable else C_Capability_CapAvailable))))

# 23 "Vuna/Compiler/Base/Capabilities.vuna"
let v_capabilityOf = (fun (target : string) (tag : string) -> (if (target = "wasm") then (v_wasmCapabilityOf tag) else C_Capability_CapAvailable))
