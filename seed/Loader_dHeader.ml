open Vuna_runtime
# 27 "Vuna/Compiler/Loader/Header.vuna"
let v_headerKind = "module-header"

# 31 "Vuna/Compiler/Loader/Header.vuna"
let v_headerCodec = "module-header 1"

# 35 "Vuna/Compiler/Loader/Header.vuna"
let v_headerObjKey = (fun (srcDigest : string) -> (Loader_dAddr.v_addrOf (B_dData_dList.C_List__x58__x58_ (v_headerKind, (B_dData_dList.C_List__x58__x58_ (v_headerCodec, (B_dData_dList.C_List__x58__x58_ (srcDigest, B_dData_dList.C_List_Nil))))))))

# 38 "Vuna/Compiler/Loader/Header.vuna"
let v_encImports = (Base_dBytes.v_encTop (Base_dBytes.v_encList Base_dBytes.v_encStr))

# 41 "Vuna/Compiler/Loader/Header.vuna"
let v_decImports = (fun (s : string) -> (let nd_uscrut1 = (((Base_dBytes.v_decList Base_dBytes.v_decStr) (bi_strLength s)) (Base_dBytes.v_curOf s)) in (match nd_uscrut1 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__0) -> (match dtb__0 with
  | { B_dData_dPair.f_Pair_first = dtb__1; B_dData_dPair.f_Pair_second = dtb__2 } -> (if (Base_dBytes.v_curAtEnd dtb__2) then (B_dData_dMaybe.C_Maybe_Just (dtb__1)) else B_dData_dMaybe.C_Maybe_Nothing)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)))

# 62 "Vuna/Compiler/Loader/Header.vuna"
let v_parseAndStore = (fun (nFs : string) (nEnv : string) (nProcess : string) (path : string) (srcDigest : string) (raw : string) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((((Loader_dFlatten.v_parseFileWithPath nFs) nEnv) nProcess) path) raw)) (fun parsed -> (match parsed with
  | Base_dDiag.C_Check_ErrC (dtb__3) -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) B_dData_dList.C_List_Nil)
  | Base_dDiag.C_Check_OkC (dtb__4) -> (let hdr = ((Loader_dAddr.v_headerOfSource "") (B_dData_dPair.v_firstOf dtb__4)) in (let names = (hdr).Loader_dAddr.f_ModHeader_mhImports in (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((((((Base_dStore.v_storeObjectWriteEff nFs) nEnv) nProcess) v_headerKind) v_headerCodec) (v_headerObjKey srcDigest)) (v_encImports names))) (fun _u -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) names)))))
  | _ -> failwith "DT: impossible branch"
))))

# 51 "Vuna/Compiler/Loader/Header.vuna"
let v_headerImportsEff = (fun (nFs : string) (nEnv : string) (nProcess : string) (path : string) (srcDigest : string) (raw : string) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((((((Base_dStore.v_storeObjectReadEff nFs) nEnv) nProcess) v_headerKind) v_headerCodec) (v_headerObjKey srcDigest))) (fun saved -> (match saved with
  | B_dData_dMaybe.C_Maybe_Just (dtb__5) -> (match (v_decImports dtb__5) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__6) -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) dtb__6)
  | B_dData_dMaybe.C_Maybe_Nothing -> ((((((v_parseAndStore nFs) nEnv) nProcess) path) srcDigest) raw)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> ((((((v_parseAndStore nFs) nEnv) nProcess) path) srcDigest) raw)
  | _ -> failwith "DT: impossible branch"
))))
