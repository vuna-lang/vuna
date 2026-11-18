open Vuna_runtime
# 27 "Vuna/Compiler/Driver/ToolPayload.vuna"
let v_Vuna_dCompiler_dDriver_dToolPayload_dtoolContextSchema = "vuna-tool-context 2"

# 31 "Vuna/Compiler/Driver/ToolPayload.vuna"
let v_Vuna_dCompiler_dDriver_dToolPayload_dtoolContextCodec = "tool-context 2"

# 34 "Vuna/Compiler/Driver/ToolPayload.vuna"
let v_Vuna_dCompiler_dDriver_dToolPayload_dencToolContextPayload = (fun ctx acc -> ((fun a -> ((fun b -> ((fun c -> ((fun d -> (((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_dencList Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_dencSourceInfo) (ctx).Vuna_dCompiler_dDriver_dCompile.f_Vuna_dCompiler_dDriver_dCompile_dToolContext_tcStats) d)) (((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_dencList Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_dencStr) (ctx).Vuna_dCompiler_dDriver_dCompile.f_Vuna_dCompiler_dDriver_dCompile_dToolContext_tcOwnNames) c))) (((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_dencList Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_dencStr) (ctx).Vuna_dCompiler_dDriver_dCompile.f_Vuna_dCompiler_dDriver_dCompile_dToolContext_tcNeeded) b))) (((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_dencList Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_dencDepPair) (ctx).Vuna_dCompiler_dDriver_dCompile.f_Vuna_dCompiler_dDriver_dCompile_dToolContext_tcDepHashes) a))) (((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_dencList Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_dencModuleIfaceAt) (ctx).Vuna_dCompiler_dDriver_dCompile.f_Vuna_dCompiler_dDriver_dCompile_dToolContext_tcDepIfaces) acc)))

# 44 "Vuna/Compiler/Driver/ToolPayload.vuna"
let v_Vuna_dCompiler_dDriver_dToolPayload_dencToolContext = (fun ctx -> ((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_dencTop v_Vuna_dCompiler_dDriver_dToolPayload_dencToolContextPayload) ctx))

# 53 "Vuna/Compiler/Driver/ToolPayload.vuna"
let v_Vuna_dCompiler_dDriver_dToolPayload_ddecToolContextPayload = (fun fuel c -> ((fun nd_uscrut2 -> (match nd_uscrut2 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__0) -> (match dtb__0 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__1; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__2 } -> ((fun nd_uscrut9 -> (match nd_uscrut9 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__3) -> (match dtb__3 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__4; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__5 } -> ((fun nd_uscrut16 -> (match nd_uscrut16 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__6) -> (match dtb__6 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__7; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__8 } -> ((fun nd_uscrut23 -> (match nd_uscrut23 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__9) -> (match dtb__9 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__10; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__11 } -> ((fun nd_uscrut30 -> (match nd_uscrut30 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__12) -> (match dtb__12 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__13; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__14 } -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = { Vuna_dCompiler_dDriver_dCompile.f_Vuna_dCompiler_dDriver_dCompile_dToolContext_tcDepIfaces = dtb__13; Vuna_dCompiler_dDriver_dCompile.f_Vuna_dCompiler_dDriver_dCompile_dToolContext_tcDepHashes = dtb__10; Vuna_dCompiler_dDriver_dCompile.f_Vuna_dCompiler_dDriver_dCompile_dToolContext_tcNeeded = dtb__7; Vuna_dCompiler_dDriver_dCompile.f_Vuna_dCompiler_dDriver_dCompile_dToolContext_tcOwnNames = dtb__4; Vuna_dCompiler_dDriver_dCompile.f_Vuna_dCompiler_dDriver_dCompile_dToolContext_tcStats = dtb__1 }; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__14 }))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) (((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_ddecList Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_ddecModuleIfaceAt) (fuel - 1)) dtb__11))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) (((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_ddecList Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_ddecDepPair) (fuel - 1)) dtb__8))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) (((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_ddecList Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_ddecStr) (fuel - 1)) dtb__5))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) (((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_ddecList Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_ddecStr) (fuel - 1)) dtb__2))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) (((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_ddecList Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_ddecSourceInfo) (fuel - 1)) c)))

# 48 "Vuna/Compiler/Driver/ToolPayload.vuna"
let v_Vuna_dCompiler_dDriver_dToolPayload_ddecToolContextComplete = (fun s -> ((fun nd_uscrut1 -> (match nd_uscrut1 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__15) -> (match dtb__15 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__16; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__17 } -> (if (Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_dcurAtEnd dtb__17) then (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__16)) else Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dDriver_dToolPayload_ddecToolContextPayload (bi_strLength s)) (Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_dcurOf s))))
