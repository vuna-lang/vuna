open Vuna_runtime
type t_PackageFile = { f_PackageFile_pfPath : string; f_PackageFile_pfContent : string }
and t_PackageSource = { f_PackageSource_psName : string; f_PackageSource_psExports : string B_dData_dList.t_List; f_PackageSource_psDeps : (string, string) B_dData_dPair.t_Pair B_dData_dList.t_List; f_PackageSource_psFiles : t_PackageFile B_dData_dList.t_List }
and t_PackageIdentity = { f_PackageIdentity_piName : string; f_PackageIdentity_piExports : string B_dData_dList.t_List; f_PackageIdentity_piDeps : (string, string) B_dData_dPair.t_Pair B_dData_dList.t_List; f_PackageIdentity_piFiles : (string, string) B_dData_dPair.t_Pair B_dData_dList.t_List }

# 43 "Vuna/Compiler/Frontend/Canonical/Pkg.vuna"
let v_contentTag = 1

# 46 "Vuna/Compiler/Frontend/Canonical/Pkg.vuna"
let v_identityTag = 2

# 50 "Vuna/Compiler/Frontend/Canonical/Pkg.vuna"
let v_encFile = (fun (f : t_PackageFile) (acc : string B_dData_dList.t_List) -> ((Base_dBytes.v_encStr (f).f_PackageFile_pfPath) ((Base_dBytes.v_encStr (f).f_PackageFile_pfContent) acc)))

# 53 "Vuna/Compiler/Frontend/Canonical/Pkg.vuna"
let v_encFiles = (fun (files : t_PackageFile B_dData_dList.t_List) (acc : string B_dData_dList.t_List) -> ((Base_dBytes.v_encTag v_contentTag) (((Base_dBytes.v_encList v_encFile) files) acc)))

# 57 "Vuna/Compiler/Frontend/Canonical/Pkg.vuna"
let v_encPackageContent = (fun (files : t_PackageFile B_dData_dList.t_List) -> ((Base_dBytes.v_encTop v_encFiles) files))

# 64 "Vuna/Compiler/Frontend/Canonical/Pkg.vuna"
let v_hashFile = (fun (f : t_PackageFile) -> { B_dData_dPair.f_Pair_first = (f).f_PackageFile_pfPath; B_dData_dPair.f_Pair_second = (Base_dHash.v_contentAddress (f).f_PackageFile_pfContent) })

# 61 "Vuna/Compiler/Frontend/Canonical/Pkg.vuna"
let v_identityOfSource = (fun (ps : t_PackageSource) -> { f_PackageIdentity_piName = (ps).f_PackageSource_psName; f_PackageIdentity_piExports = (ps).f_PackageSource_psExports; f_PackageIdentity_piDeps = (ps).f_PackageSource_psDeps; f_PackageIdentity_piFiles = ((B_dData_dList.v_map v_hashFile) (ps).f_PackageSource_psFiles) })

# 67 "Vuna/Compiler/Frontend/Canonical/Pkg.vuna"
let v_encStrPair = (fun (p : (string, string) B_dData_dPair.t_Pair) (acc : string B_dData_dList.t_List) -> ((Base_dBytes.v_encStr (B_dData_dPair.v_firstOf p)) ((Base_dBytes.v_encStr (B_dData_dPair.v_secondOf p)) acc)))

# 70 "Vuna/Compiler/Frontend/Canonical/Pkg.vuna"
let v_encIdentity = (fun (pi : t_PackageIdentity) (acc : string B_dData_dList.t_List) -> ((Base_dBytes.v_encTag v_identityTag) ((Base_dBytes.v_encStr (pi).f_PackageIdentity_piName) (((Base_dBytes.v_encList Base_dBytes.v_encStr) (pi).f_PackageIdentity_piExports) (((Base_dBytes.v_encList v_encStrPair) (pi).f_PackageIdentity_piDeps) (((Base_dBytes.v_encList v_encStrPair) (pi).f_PackageIdentity_piFiles) acc))))))

# 77 "Vuna/Compiler/Frontend/Canonical/Pkg.vuna"
let v_encPackageIdentity = (fun (pi : t_PackageIdentity) -> ((Base_dBytes.v_encTop v_encIdentity) pi))

# 81 "Vuna/Compiler/Frontend/Canonical/Pkg.vuna"
let v_decFile = (fun (fuel : int) (c : Base_dBytes.t_Cur) -> (let nd_uscrut2 = ((Base_dBytes.v_decStr fuel) c) in (match nd_uscrut2 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__0) -> (match dtb__0 with
  | { B_dData_dPair.f_Pair_first = dtb__1; B_dData_dPair.f_Pair_second = dtb__2 } -> (let nd_uscrut9 = ((Base_dBytes.v_decStr fuel) dtb__2) in (match nd_uscrut9 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__3) -> (match dtb__3 with
  | { B_dData_dPair.f_Pair_first = dtb__4; B_dData_dPair.f_Pair_second = dtb__5 } -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = { f_PackageFile_pfPath = dtb__1; f_PackageFile_pfContent = dtb__4 }; B_dData_dPair.f_Pair_second = dtb__5 }))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)))

# 90 "Vuna/Compiler/Frontend/Canonical/Pkg.vuna"
let v_decContentAt = (fun (fuel : int) (c : Base_dBytes.t_Cur) -> (let nd_uscrut2 = ((Base_dBytes.v_decTag fuel) c) in (match nd_uscrut2 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__6) -> (match dtb__6 with
  | { B_dData_dPair.f_Pair_first = dtb__7; B_dData_dPair.f_Pair_second = dtb__8 } -> (if (dtb__7 = v_contentTag) then (((Base_dBytes.v_decList v_decFile) fuel) dtb__8) else B_dData_dMaybe.C_Maybe_Nothing)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)))

# 97 "Vuna/Compiler/Frontend/Canonical/Pkg.vuna"
let v_decPackageContent = (fun (raw : string) -> (let nd_uscrut1 = ((v_decContentAt ((2 * (bi_strLength raw)) + 16)) (Base_dBytes.v_curOf raw)) in (match nd_uscrut1 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__9) -> (match dtb__9 with
  | { B_dData_dPair.f_Pair_first = dtb__10; B_dData_dPair.f_Pair_second = dtb__11 } -> (if (Base_dBytes.v_curAtEnd dtb__11) then (B_dData_dMaybe.C_Maybe_Just (dtb__10)) else B_dData_dMaybe.C_Maybe_Nothing)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)))

# 103 "Vuna/Compiler/Frontend/Canonical/Pkg.vuna"
let v_decStrPair = (fun (fuel : int) (c : Base_dBytes.t_Cur) -> ((((Base_dBytes.v_decPair Base_dBytes.v_decStr) Base_dBytes.v_decStr) fuel) c))

# 106 "Vuna/Compiler/Frontend/Canonical/Pkg.vuna"
let v_decIdentityAt = (fun (fuel : int) (c : Base_dBytes.t_Cur) -> (let nd_uscrut2 = ((Base_dBytes.v_decTag fuel) c) in (match nd_uscrut2 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__12) -> (match dtb__12 with
  | { B_dData_dPair.f_Pair_first = dtb__13; B_dData_dPair.f_Pair_second = dtb__14 } -> (if (dtb__13 = v_identityTag) then (let nd_uscrut9 = ((Base_dBytes.v_decStr fuel) dtb__14) in (match nd_uscrut9 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__15) -> (match dtb__15 with
  | { B_dData_dPair.f_Pair_first = dtb__16; B_dData_dPair.f_Pair_second = dtb__17 } -> (let nd_uscrut16 = (((Base_dBytes.v_decList Base_dBytes.v_decStr) fuel) dtb__17) in (match nd_uscrut16 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__18) -> (match dtb__18 with
  | { B_dData_dPair.f_Pair_first = dtb__19; B_dData_dPair.f_Pair_second = dtb__20 } -> (let nd_uscrut23 = (((Base_dBytes.v_decList v_decStrPair) fuel) dtb__20) in (match nd_uscrut23 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__21) -> (match dtb__21 with
  | { B_dData_dPair.f_Pair_first = dtb__22; B_dData_dPair.f_Pair_second = dtb__23 } -> (let nd_uscrut30 = (((Base_dBytes.v_decList v_decStrPair) fuel) dtb__23) in (match nd_uscrut30 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__24) -> (match dtb__24 with
  | { B_dData_dPair.f_Pair_first = dtb__25; B_dData_dPair.f_Pair_second = dtb__26 } -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = { f_PackageIdentity_piName = dtb__16; f_PackageIdentity_piExports = dtb__19; f_PackageIdentity_piDeps = dtb__22; f_PackageIdentity_piFiles = dtb__25 }; B_dData_dPair.f_Pair_second = dtb__26 }))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) else B_dData_dMaybe.C_Maybe_Nothing)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)))

# 128 "Vuna/Compiler/Frontend/Canonical/Pkg.vuna"
let v_decPackageIdentity = (fun (raw : string) -> (let nd_uscrut1 = ((v_decIdentityAt ((2 * (bi_strLength raw)) + 16)) (Base_dBytes.v_curOf raw)) in (match nd_uscrut1 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__27) -> (match dtb__27 with
  | { B_dData_dPair.f_Pair_first = dtb__28; B_dData_dPair.f_Pair_second = dtb__29 } -> (if (Base_dBytes.v_curAtEnd dtb__29) then (B_dData_dMaybe.C_Maybe_Just (dtb__28)) else B_dData_dMaybe.C_Maybe_Nothing)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)))

# 25 "Vuna/Compiler/Frontend/Canonical/Pkg.vuna"
let v_pfPath = (fun (p : t_PackageFile) -> (match p with
  | { f_PackageFile_pfPath = dtb__30; f_PackageFile_pfContent = dtb__31 } -> dtb__30
  | _ -> failwith "DT: impossible branch"
))

# 26 "Vuna/Compiler/Frontend/Canonical/Pkg.vuna"
let v_pfContent = (fun (p : t_PackageFile) -> (match p with
  | { f_PackageFile_pfPath = dtb__32; f_PackageFile_pfContent = dtb__33 } -> dtb__33
  | _ -> failwith "DT: impossible branch"
))

# 30 "Vuna/Compiler/Frontend/Canonical/Pkg.vuna"
let v_psName = (fun (p : t_PackageSource) -> (match p with
  | { f_PackageSource_psName = dtb__34; f_PackageSource_psExports = dtb__35; f_PackageSource_psDeps = dtb__36; f_PackageSource_psFiles = dtb__37 } -> dtb__34
  | _ -> failwith "DT: impossible branch"
))

# 31 "Vuna/Compiler/Frontend/Canonical/Pkg.vuna"
let v_psExports = (fun (p : t_PackageSource) -> (match p with
  | { f_PackageSource_psName = dtb__38; f_PackageSource_psExports = dtb__39; f_PackageSource_psDeps = dtb__40; f_PackageSource_psFiles = dtb__41 } -> dtb__39
  | _ -> failwith "DT: impossible branch"
))

# 32 "Vuna/Compiler/Frontend/Canonical/Pkg.vuna"
let v_psDeps = (fun (p : t_PackageSource) -> (match p with
  | { f_PackageSource_psName = dtb__42; f_PackageSource_psExports = dtb__43; f_PackageSource_psDeps = dtb__44; f_PackageSource_psFiles = dtb__45 } -> dtb__44
  | _ -> failwith "DT: impossible branch"
))

# 33 "Vuna/Compiler/Frontend/Canonical/Pkg.vuna"
let v_psFiles = (fun (p : t_PackageSource) -> (match p with
  | { f_PackageSource_psName = dtb__46; f_PackageSource_psExports = dtb__47; f_PackageSource_psDeps = dtb__48; f_PackageSource_psFiles = dtb__49 } -> dtb__49
  | _ -> failwith "DT: impossible branch"
))

# 37 "Vuna/Compiler/Frontend/Canonical/Pkg.vuna"
let v_piName = (fun (p : t_PackageIdentity) -> (match p with
  | { f_PackageIdentity_piName = dtb__50; f_PackageIdentity_piExports = dtb__51; f_PackageIdentity_piDeps = dtb__52; f_PackageIdentity_piFiles = dtb__53 } -> dtb__50
  | _ -> failwith "DT: impossible branch"
))

# 38 "Vuna/Compiler/Frontend/Canonical/Pkg.vuna"
let v_piExports = (fun (p : t_PackageIdentity) -> (match p with
  | { f_PackageIdentity_piName = dtb__54; f_PackageIdentity_piExports = dtb__55; f_PackageIdentity_piDeps = dtb__56; f_PackageIdentity_piFiles = dtb__57 } -> dtb__55
  | _ -> failwith "DT: impossible branch"
))

# 39 "Vuna/Compiler/Frontend/Canonical/Pkg.vuna"
let v_piDeps = (fun (p : t_PackageIdentity) -> (match p with
  | { f_PackageIdentity_piName = dtb__58; f_PackageIdentity_piExports = dtb__59; f_PackageIdentity_piDeps = dtb__60; f_PackageIdentity_piFiles = dtb__61 } -> dtb__60
  | _ -> failwith "DT: impossible branch"
))

# 40 "Vuna/Compiler/Frontend/Canonical/Pkg.vuna"
let v_piFiles = (fun (p : t_PackageIdentity) -> (match p with
  | { f_PackageIdentity_piName = dtb__62; f_PackageIdentity_piExports = dtb__63; f_PackageIdentity_piDeps = dtb__64; f_PackageIdentity_piFiles = dtb__65 } -> dtb__65
  | _ -> failwith "DT: impossible branch"
))
