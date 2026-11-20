open Vuna_runtime
# 34 "Vuna/Compiler/Driver/TargetCache.vuna"
let v_targetOutCodec = "target-out 1"

# 38 "Vuna/Compiler/Driver/TargetCache.vuna"
let v_targetOutKind = "target-out"

# 42 "Vuna/Compiler/Driver/TargetCache.vuna"
let v_irHashOf = (fun (irText : string) -> (Base_dHash.v_contentAddress irText))

# 53 "Vuna/Compiler/Driver/TargetCache.vuna"
let v_sizePart = (fun (size : int B_dData_dMaybe.t_Maybe) -> (match size with
  | B_dData_dMaybe.C_Maybe_Just (dtb__0) -> (bi_strFromInt dtb__0)
  | B_dData_dMaybe.C_Maybe_Nothing -> "0"
  | _ -> failwith "DT: impossible branch"
))

# 59 "Vuna/Compiler/Driver/TargetCache.vuna"
let v_mtPart = (fun (mt : int B_dData_dMaybe.t_Maybe) -> (match mt with
  | B_dData_dMaybe.C_Maybe_Just (dtb__1) -> (bi_strFromInt dtb__1)
  | B_dData_dMaybe.C_Maybe_Nothing -> "0"
  | _ -> failwith "DT: impossible branch"
))

# 46 "Vuna/Compiler/Driver/TargetCache.vuna"
let v_backendVersionEff = (fun (nFs : string) (bin : string) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) ((B_dEffect_dFs.v_fsFileSize nFs) bin)) (fun size -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) ((B_dEffect_dFs.v_fsFileMtime nFs) bin)) (fun mt -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) (String.concat "" [(v_sizePart size); "-"; (v_mtPart mt)])))))))

# 66 "Vuna/Compiler/Driver/TargetCache.vuna"
let v_outputsKeyOf = (fun (target : string) (version : string) (irHash : string) (printResult : bool) -> (Loader_dAddr.v_addrOf ((B_dData_dList.v_append (B_dData_dList.C_List__x58__x58_ ("target-out", (B_dData_dList.C_List__x58__x58_ (v_targetOutCodec, (B_dData_dList.C_List__x58__x58_ (target, (B_dData_dList.C_List__x58__x58_ (version, (B_dData_dList.C_List__x58__x58_ (irHash, B_dData_dList.C_List_Nil))))))))))) (if printResult then (B_dData_dList.C_List__x58__x58_ ("print", B_dData_dList.C_List_Nil)) else (B_dData_dList.C_List__x58__x58_ ("quiet", B_dData_dList.C_List_Nil))))))

# 88 "Vuna/Compiler/Driver/TargetCache.vuna"
let v_encodeOutputs = (fun (files : (string, string) B_dData_dPair.t_Pair B_dData_dList.t_List) (diags : Base_dDiag.t_Diagnostic B_dData_dList.t_List) -> ((Base_dBytes.v_encTop ((Base_dBytes.v_encPair (Base_dBytes.v_encList ((Base_dBytes.v_encPair Base_dBytes.v_encStr) Base_dBytes.v_encStr))) Base_dBytes.v_encStr)) { B_dData_dPair.f_Pair_first = files; B_dData_dPair.f_Pair_second = (Base_dDiag_dCodec.v_encDiagnostics diags) }))

# 83 "Vuna/Compiler/Driver/TargetCache.vuna"
let v_writeOutputsEff = (fun (nFs : string) (nEnv : string) (nProcess : string) (key : string) (files : (string, string) B_dData_dPair.t_Pair B_dData_dList.t_List) (diags : Base_dDiag.t_Diagnostic B_dData_dList.t_List) -> (((((((Base_dStore.v_storeObjectWriteEff nFs) nEnv) nProcess) v_targetOutKind) v_targetOutCodec) key) ((v_encodeOutputs files) diags)))

# 103 "Vuna/Compiler/Driver/TargetCache.vuna"
let v_decodedDiags = (fun (text : string) -> (match (Base_dDiag_dCodec.v_decDiagnostics text) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__2) -> dtb__2
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 94 "Vuna/Compiler/Driver/TargetCache.vuna"
let v_decodeOutputs = (fun (raw : string) -> (if ((bi_strLength raw) <= 0) then B_dData_dMaybe.C_Maybe_Nothing else ((fun nd_uscrut1 -> (match nd_uscrut1 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__3) -> (match dtb__3 with
  | { B_dData_dPair.f_Pair_first = dtb__4; B_dData_dPair.f_Pair_second = dtb__5 } -> (match dtb__4 with
  | { B_dData_dPair.f_Pair_first = dtb__6; B_dData_dPair.f_Pair_second = dtb__7 } -> (if (Base_dBytes.v_curAtEnd dtb__5) then (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = dtb__6; B_dData_dPair.f_Pair_second = (v_decodedDiags dtb__7) })) else B_dData_dMaybe.C_Maybe_Nothing)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((((Base_dBytes.v_decPair (Base_dBytes.v_decList ((Base_dBytes.v_decPair Base_dBytes.v_decStr) Base_dBytes.v_decStr))) Base_dBytes.v_decStr) ((bi_strLength raw) + 1)) (Base_dBytes.v_curOf raw)))))

# 78 "Vuna/Compiler/Driver/TargetCache.vuna"
let v_bindRaw = (fun (mc0 : string B_dData_dMaybe.t_Maybe) -> (match mc0 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__8) -> (v_decodeOutputs dtb__8)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 72 "Vuna/Compiler/Driver/TargetCache.vuna"
let v_readOutputsEff = (fun (nFs : string) (nEnv : string) (nProcess : string) (key : string) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) ((((((Base_dStore.v_storeObjectReadEff nFs) nEnv) nProcess) v_targetOutKind) v_targetOutCodec) key)) (fun raw -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) (v_bindRaw raw)))))

# 130 "Vuna/Compiler/Driver/TargetCache.vuna"
let rec v_dropLast = (fun mc0 -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__9, dtb__10) -> (match dtb__10 with
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> (B_dData_dList.C_List__x58__x58_ (dtb__9, (v_dropLast dtb__10)))
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 124 "Vuna/Compiler/Driver/TargetCache.vuna"
let v_parentDirOf = (fun (path : string) -> (match (v_dropLast ((B_dData_dString.v_split "/") path)) with
  | B_dData_dList.C_List_Nil -> "."
  | dtb__11 -> ((B_dData_dString.v_join "/") dtb__11)
))

# 116 "Vuna/Compiler/Driver/TargetCache.vuna"
let rec v_writeFiles = (fun (nFs : string) (nEnv : string) (nProcess : string) (mc0 : string) (mc1 : (string, string) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__12, dtb__13) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (((Driver_dCompile.v_ensureDirPath nFs) nProcess) (v_parentDirOf (String.concat "" [mc0; "/"; (B_dData_dPair.v_firstOf dtb__12)])))) (fun _u -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (((B_dEffect_dFs.v_fsWriteFile nFs) (String.concat "" [mc0; "/"; (B_dData_dPair.v_firstOf dtb__12)])) (B_dData_dPair.v_secondOf dtb__12))) (fun _u -> (((((v_writeFiles nFs) nEnv) nProcess) mc0) dtb__13)))))
  | B_dData_dList.C_List_Nil -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) 0)
  | _ -> failwith "DT: impossible branch"
))

# 110 "Vuna/Compiler/Driver/TargetCache.vuna"
let v_materializeEff = (fun (nFs : string) (nEnv : string) (nProcess : string) (outDir : string) (files : (string, string) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (((Driver_dCompile.v_ensureDirPath nFs) nProcess) outDir)) (fun _u -> (((((v_writeFiles nFs) nEnv) nProcess) outDir) files))))

# 144 "Vuna/Compiler/Driver/TargetCache.vuna"
let v_readProduced = (fun (nFs : string) (outDir : string) (name : string) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) ((B_dEffect_dFs.v_fsReadFile nFs) (String.concat "" [outDir; "/"; name]))) (fun content -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) { B_dData_dPair.f_Pair_first = name; B_dData_dPair.f_Pair_second = content }))))

# 136 "Vuna/Compiler/Driver/TargetCache.vuna"
let rec v_readProducedEff = (fun (nFs : string) (mc0 : string) (mc1 : string B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__14, dtb__15) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (((v_readProduced nFs) mc0) dtb__14)) (fun one -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (((v_readProducedEff nFs) mc0) dtb__15)) (fun more -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) (B_dData_dList.C_List__x58__x58_ (one, more)))))))
  | B_dData_dList.C_List_Nil -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) B_dData_dList.C_List_Nil)
  | _ -> failwith "DT: impossible branch"
))
