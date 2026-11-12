open Vuna_runtime
type t_Vuna_dCompiler_dCanonical_dPkg_dPackageFile = { f_Vuna_dCompiler_dCanonical_dPkg_dPackageFile_pfPath : string; f_Vuna_dCompiler_dCanonical_dPkg_dPackageFile_pfContent : string }
and t_Vuna_dCompiler_dCanonical_dPkg_dPackageSource = { f_Vuna_dCompiler_dCanonical_dPkg_dPackageSource_psName : string; f_Vuna_dCompiler_dCanonical_dPkg_dPackageSource_psExports : string Base_dList.t_Base_dList_dList; f_Vuna_dCompiler_dCanonical_dPkg_dPackageSource_psDeps : (string, string) Base_dPair.t_Base_dPair_dPair Base_dList.t_Base_dList_dList; f_Vuna_dCompiler_dCanonical_dPkg_dPackageSource_psFiles : t_Vuna_dCompiler_dCanonical_dPkg_dPackageFile Base_dList.t_Base_dList_dList }
and t_Vuna_dCompiler_dCanonical_dPkg_dPackageIdentity = { f_Vuna_dCompiler_dCanonical_dPkg_dPackageIdentity_piName : string; f_Vuna_dCompiler_dCanonical_dPkg_dPackageIdentity_piExports : string Base_dList.t_Base_dList_dList; f_Vuna_dCompiler_dCanonical_dPkg_dPackageIdentity_piDeps : (string, string) Base_dPair.t_Base_dPair_dPair Base_dList.t_Base_dList_dList; f_Vuna_dCompiler_dCanonical_dPkg_dPackageIdentity_piFiles : (string, string) Base_dPair.t_Base_dPair_dPair Base_dList.t_Base_dList_dList }

let v_Vuna_dCompiler_dCanonical_dPkg_dcontentTag = 1

let v_Vuna_dCompiler_dCanonical_dPkg_didentityTag = 2

let v_Vuna_dCompiler_dCanonical_dPkg_dencFile = (fun f acc -> ((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_dencStr (f).f_Vuna_dCompiler_dCanonical_dPkg_dPackageFile_pfPath) ((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_dencStr (f).f_Vuna_dCompiler_dCanonical_dPkg_dPackageFile_pfContent) acc)))

let v_Vuna_dCompiler_dCanonical_dPkg_dencFiles = (fun files acc -> ((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_dencTag v_Vuna_dCompiler_dCanonical_dPkg_dcontentTag) (((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_dencList v_Vuna_dCompiler_dCanonical_dPkg_dencFile) files) acc)))

let v_Vuna_dCompiler_dCanonical_dPkg_dencPackageContent = (fun files -> ((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_dencTop v_Vuna_dCompiler_dCanonical_dPkg_dencFiles) files))

let v_Vuna_dCompiler_dCanonical_dPkg_dhashFile = (fun f -> { Base_dPair.f_Base_dPair_dPair_first = (f).f_Vuna_dCompiler_dCanonical_dPkg_dPackageFile_pfPath; Base_dPair.f_Base_dPair_dPair_second = (Vuna_dCompiler_dHash.v_Vuna_dCompiler_dHash_dcontentAddress (f).f_Vuna_dCompiler_dCanonical_dPkg_dPackageFile_pfContent) })

let v_Vuna_dCompiler_dCanonical_dPkg_didentityOfSource = (fun ps -> { f_Vuna_dCompiler_dCanonical_dPkg_dPackageIdentity_piName = (ps).f_Vuna_dCompiler_dCanonical_dPkg_dPackageSource_psName; f_Vuna_dCompiler_dCanonical_dPkg_dPackageIdentity_piExports = (ps).f_Vuna_dCompiler_dCanonical_dPkg_dPackageSource_psExports; f_Vuna_dCompiler_dCanonical_dPkg_dPackageIdentity_piDeps = (ps).f_Vuna_dCompiler_dCanonical_dPkg_dPackageSource_psDeps; f_Vuna_dCompiler_dCanonical_dPkg_dPackageIdentity_piFiles = ((Base_dList.v_Base_dList_dmap v_Vuna_dCompiler_dCanonical_dPkg_dhashFile) (ps).f_Vuna_dCompiler_dCanonical_dPkg_dPackageSource_psFiles) })

let v_Vuna_dCompiler_dCanonical_dPkg_dencStrPair = (fun p acc -> ((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_dencStr (Base_dPair.v_Base_dPair_dfirstOf p)) ((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_dencStr (Base_dPair.v_Base_dPair_dsecondOf p)) acc)))

let v_Vuna_dCompiler_dCanonical_dPkg_dencIdentity = (fun pi acc -> ((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_dencTag v_Vuna_dCompiler_dCanonical_dPkg_didentityTag) ((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_dencStr (pi).f_Vuna_dCompiler_dCanonical_dPkg_dPackageIdentity_piName) (((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_dencList Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_dencStr) (pi).f_Vuna_dCompiler_dCanonical_dPkg_dPackageIdentity_piExports) (((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_dencList v_Vuna_dCompiler_dCanonical_dPkg_dencStrPair) (pi).f_Vuna_dCompiler_dCanonical_dPkg_dPackageIdentity_piDeps) (((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_dencList v_Vuna_dCompiler_dCanonical_dPkg_dencStrPair) (pi).f_Vuna_dCompiler_dCanonical_dPkg_dPackageIdentity_piFiles) acc))))))

let v_Vuna_dCompiler_dCanonical_dPkg_dencPackageIdentity = (fun pi -> ((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_dencTop v_Vuna_dCompiler_dCanonical_dPkg_dencIdentity) pi))

let v_Vuna_dCompiler_dCanonical_dPkg_ddecFile = (fun fuel c -> ((fun nd_uscrut2 -> (match nd_uscrut2 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__0) -> (match dtb__0 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__1; Base_dPair.f_Base_dPair_dPair_second = dtb__2 } -> ((fun nd_uscrut9 -> (match nd_uscrut9 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__3) -> (match dtb__3 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__4; Base_dPair.f_Base_dPair_dPair_second = dtb__5 } -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Base_dPair.f_Base_dPair_dPair_first = { f_Vuna_dCompiler_dCanonical_dPkg_dPackageFile_pfPath = dtb__1; f_Vuna_dCompiler_dCanonical_dPkg_dPackageFile_pfContent = dtb__4 }; Base_dPair.f_Base_dPair_dPair_second = dtb__5 }))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_ddecStr fuel) dtb__2))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_ddecStr fuel) c)))

let v_Vuna_dCompiler_dCanonical_dPkg_ddecContentAt = (fun fuel c -> ((fun nd_uscrut2 -> (match nd_uscrut2 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__6) -> (match dtb__6 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__7; Base_dPair.f_Base_dPair_dPair_second = dtb__8 } -> (if (dtb__7 = v_Vuna_dCompiler_dCanonical_dPkg_dcontentTag) then (((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_ddecList v_Vuna_dCompiler_dCanonical_dPkg_ddecFile) fuel) dtb__8) else Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_ddecTag fuel) c)))

let v_Vuna_dCompiler_dCanonical_dPkg_ddecPackageContent = (fun raw -> ((fun nd_uscrut1 -> (match nd_uscrut1 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__9) -> (match dtb__9 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__10; Base_dPair.f_Base_dPair_dPair_second = dtb__11 } -> (if (Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_dcurAtEnd dtb__11) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__10)) else Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dCanonical_dPkg_ddecContentAt ((2 * (bi_strLength raw)) + 16)) (Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_dcurOf raw))))

let v_Vuna_dCompiler_dCanonical_dPkg_ddecStrPair = (fun fuel c -> ((((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_ddecPair Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_ddecStr) Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_ddecStr) fuel) c))

let v_Vuna_dCompiler_dCanonical_dPkg_ddecIdentityAt = (fun fuel c -> ((fun nd_uscrut2 -> (match nd_uscrut2 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__12) -> (match dtb__12 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__13; Base_dPair.f_Base_dPair_dPair_second = dtb__14 } -> (if (dtb__13 = v_Vuna_dCompiler_dCanonical_dPkg_didentityTag) then ((fun nd_uscrut9 -> (match nd_uscrut9 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__15) -> (match dtb__15 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__16; Base_dPair.f_Base_dPair_dPair_second = dtb__17 } -> ((fun nd_uscrut16 -> (match nd_uscrut16 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__18) -> (match dtb__18 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__19; Base_dPair.f_Base_dPair_dPair_second = dtb__20 } -> ((fun nd_uscrut23 -> (match nd_uscrut23 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__21) -> (match dtb__21 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__22; Base_dPair.f_Base_dPair_dPair_second = dtb__23 } -> ((fun nd_uscrut30 -> (match nd_uscrut30 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__24) -> (match dtb__24 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__25; Base_dPair.f_Base_dPair_dPair_second = dtb__26 } -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Base_dPair.f_Base_dPair_dPair_first = { f_Vuna_dCompiler_dCanonical_dPkg_dPackageIdentity_piName = dtb__16; f_Vuna_dCompiler_dCanonical_dPkg_dPackageIdentity_piExports = dtb__19; f_Vuna_dCompiler_dCanonical_dPkg_dPackageIdentity_piDeps = dtb__22; f_Vuna_dCompiler_dCanonical_dPkg_dPackageIdentity_piFiles = dtb__25 }; Base_dPair.f_Base_dPair_dPair_second = dtb__26 }))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) (((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_ddecList v_Vuna_dCompiler_dCanonical_dPkg_ddecStrPair) fuel) dtb__23))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) (((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_ddecList v_Vuna_dCompiler_dCanonical_dPkg_ddecStrPair) fuel) dtb__20))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) (((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_ddecList Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_ddecStr) fuel) dtb__17))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_ddecStr fuel) dtb__14)) else Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_ddecTag fuel) c)))

let v_Vuna_dCompiler_dCanonical_dPkg_ddecPackageIdentity = (fun raw -> ((fun nd_uscrut1 -> (match nd_uscrut1 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__27) -> (match dtb__27 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__28; Base_dPair.f_Base_dPair_dPair_second = dtb__29 } -> (if (Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_dcurAtEnd dtb__29) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__28)) else Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dCanonical_dPkg_ddecIdentityAt ((2 * (bi_strLength raw)) + 16)) (Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_dcurOf raw))))
