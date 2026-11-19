open Vuna_runtime
# 27 "Vuna/Compiler/Driver/ToolPayload.vuna"
let v_toolContextSchema = "vuna-tool-context 2"

# 31 "Vuna/Compiler/Driver/ToolPayload.vuna"
let v_toolContextCodec = "tool-context 2"

# 34 "Vuna/Compiler/Driver/ToolPayload.vuna"
let v_encToolContextPayload = (fun (ctx : Driver_dCompile.t_ToolContext) (acc : string B_dData_dList.t_List) -> ((fun a -> ((fun b -> ((fun c -> ((fun d -> (((Base_dBytes.v_encList Driver_dIface.v_encSourceInfo) (ctx).Driver_dCompile.f_ToolContext_tcStats) d)) (((Base_dBytes.v_encList Base_dBytes.v_encStr) (ctx).Driver_dCompile.f_ToolContext_tcOwnNames) c))) (((Base_dBytes.v_encList Base_dBytes.v_encStr) (ctx).Driver_dCompile.f_ToolContext_tcNeeded) b))) (((Base_dBytes.v_encList Driver_dIface.v_encDepPair) (ctx).Driver_dCompile.f_ToolContext_tcDepHashes) a))) (((Base_dBytes.v_encList Driver_dIface.v_encModuleIfaceAt) (ctx).Driver_dCompile.f_ToolContext_tcDepIfaces) acc)))

# 44 "Vuna/Compiler/Driver/ToolPayload.vuna"
let v_encToolContext = (fun (ctx : Driver_dCompile.t_ToolContext) -> ((Base_dBytes.v_encTop v_encToolContextPayload) ctx))

# 54 "Vuna/Compiler/Driver/ToolPayload.vuna"
let v_decToolContextPayload = (fun (fuel : int) (c : Base_dBytes.t_Cur) -> ((fun nd_uscrut2 -> (match nd_uscrut2 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__0) -> (match dtb__0 with
  | { B_dData_dPair.f_Pair_first = dtb__1; B_dData_dPair.f_Pair_second = dtb__2 } -> ((fun nd_uscrut9 -> (match nd_uscrut9 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__3) -> (match dtb__3 with
  | { B_dData_dPair.f_Pair_first = dtb__4; B_dData_dPair.f_Pair_second = dtb__5 } -> ((fun nd_uscrut16 -> (match nd_uscrut16 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__6) -> (match dtb__6 with
  | { B_dData_dPair.f_Pair_first = dtb__7; B_dData_dPair.f_Pair_second = dtb__8 } -> ((fun nd_uscrut23 -> (match nd_uscrut23 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__9) -> (match dtb__9 with
  | { B_dData_dPair.f_Pair_first = dtb__10; B_dData_dPair.f_Pair_second = dtb__11 } -> ((fun nd_uscrut30 -> (match nd_uscrut30 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__12) -> (match dtb__12 with
  | { B_dData_dPair.f_Pair_first = dtb__13; B_dData_dPair.f_Pair_second = dtb__14 } -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = { Driver_dCompile.f_ToolContext_tcDepIfaces = dtb__13; Driver_dCompile.f_ToolContext_tcDepHashes = dtb__10; Driver_dCompile.f_ToolContext_tcNeeded = dtb__7; Driver_dCompile.f_ToolContext_tcOwnNames = dtb__4; Driver_dCompile.f_ToolContext_tcStats = dtb__1 }; B_dData_dPair.f_Pair_second = dtb__14 }))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) (((Base_dBytes.v_decList Driver_dIface.v_decModuleIfaceAt) (fuel - 1)) dtb__11))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) (((Base_dBytes.v_decList Driver_dIface.v_decDepPair) (fuel - 1)) dtb__8))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) (((Base_dBytes.v_decList Base_dBytes.v_decStr) (fuel - 1)) dtb__5))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) (((Base_dBytes.v_decList Base_dBytes.v_decStr) (fuel - 1)) dtb__2))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) (((Base_dBytes.v_decList Driver_dIface.v_decSourceInfo) (fuel - 1)) c)))

# 48 "Vuna/Compiler/Driver/ToolPayload.vuna"
let v_decToolContextComplete = (fun (s : string) -> ((fun nd_uscrut1 -> (match nd_uscrut1 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__15) -> (match dtb__15 with
  | { B_dData_dPair.f_Pair_first = dtb__16; B_dData_dPair.f_Pair_second = dtb__17 } -> (if (Base_dBytes.v_curAtEnd dtb__17) then (B_dData_dMaybe.C_Maybe_Just (dtb__16)) else B_dData_dMaybe.C_Maybe_Nothing)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((v_decToolContextPayload (bi_strLength s)) (Base_dBytes.v_curOf s))))
