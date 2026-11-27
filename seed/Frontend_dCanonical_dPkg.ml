open Vuna_runtime
type t_PackageFile = { f_PackageFile_pfPath : string; f_PackageFile_pfContent : string }
and t_PackageSource = { f_PackageSource_psName : string; f_PackageSource_psExports : string B_dData_dList.t_List; f_PackageSource_psDeps : (string, string) B_dData_dPair.t_Pair B_dData_dList.t_List; f_PackageSource_psFiles : t_PackageFile B_dData_dList.t_List }
and t_PackageIdentity = { f_PackageIdentity_piName : string; f_PackageIdentity_piExports : string B_dData_dList.t_List; f_PackageIdentity_piDeps : (string, string) B_dData_dPair.t_Pair B_dData_dList.t_List; f_PackageIdentity_piFiles : (string, string) B_dData_dPair.t_Pair B_dData_dList.t_List }

# 43 "Vuna/Compiler/Frontend/Canonical/Pkg.vuna"
let v_contentTag = 1

# 46 "Vuna/Compiler/Frontend/Canonical/Pkg.vuna"
let v_identityTag = 2

# 50 "Vuna/Compiler/Frontend/Canonical/Pkg.vuna"
let v_encFile = (fun (dtb_u_u1 : t_PackageFile) (dtb_u_u2 : string B_dData_dList.t_List) -> ((Base_dBytes.v_encStr (dtb_u_u1).f_PackageFile_pfPath) ((Base_dBytes.v_encStr (dtb_u_u1).f_PackageFile_pfContent) dtb_u_u2)))

# 53 "Vuna/Compiler/Frontend/Canonical/Pkg.vuna"
let v_encFiles = (fun (dtb_u_u3 : t_PackageFile B_dData_dList.t_List) (dtb_u_u4 : string B_dData_dList.t_List) -> ((Base_dBytes.v_encTag v_contentTag) (((Base_dBytes.v_encList v_encFile) dtb_u_u3) dtb_u_u4)))

# 57 "Vuna/Compiler/Frontend/Canonical/Pkg.vuna"
let v_encPackageContent = (fun (dtb_u_u5 : t_PackageFile B_dData_dList.t_List) -> ((Base_dBytes.v_encTop v_encFiles) dtb_u_u5))

# 64 "Vuna/Compiler/Frontend/Canonical/Pkg.vuna"
let v_hashFile = (fun (dtb_u_u6 : t_PackageFile) -> { B_dData_dPair.f_Pair_first = (dtb_u_u6).f_PackageFile_pfPath; B_dData_dPair.f_Pair_second = (Base_dHash.v_contentAddress (dtb_u_u6).f_PackageFile_pfContent) })

# 61 "Vuna/Compiler/Frontend/Canonical/Pkg.vuna"
let v_identityOfSource = (fun (dtb_u_u7 : t_PackageSource) -> { f_PackageIdentity_piName = (dtb_u_u7).f_PackageSource_psName; f_PackageIdentity_piExports = (dtb_u_u7).f_PackageSource_psExports; f_PackageIdentity_piDeps = (dtb_u_u7).f_PackageSource_psDeps; f_PackageIdentity_piFiles = ((B_dData_dList.v_map v_hashFile) (dtb_u_u7).f_PackageSource_psFiles) })

# 67 "Vuna/Compiler/Frontend/Canonical/Pkg.vuna"
let v_encStrPair = (fun (dtb_u_u8 : (string, string) B_dData_dPair.t_Pair) (dtb_u_u9 : string B_dData_dList.t_List) -> ((Base_dBytes.v_encStr (B_dData_dPair.v_firstOf dtb_u_u8)) ((Base_dBytes.v_encStr (B_dData_dPair.v_secondOf dtb_u_u8)) dtb_u_u9)))

# 70 "Vuna/Compiler/Frontend/Canonical/Pkg.vuna"
let v_encIdentity = (fun (dtb_u_u10 : t_PackageIdentity) (dtb_u_u11 : string B_dData_dList.t_List) -> ((Base_dBytes.v_encTag v_identityTag) ((Base_dBytes.v_encStr (dtb_u_u10).f_PackageIdentity_piName) (((Base_dBytes.v_encList Base_dBytes.v_encStr) (dtb_u_u10).f_PackageIdentity_piExports) (((Base_dBytes.v_encList v_encStrPair) (dtb_u_u10).f_PackageIdentity_piDeps) (((Base_dBytes.v_encList v_encStrPair) (dtb_u_u10).f_PackageIdentity_piFiles) dtb_u_u11))))))

# 77 "Vuna/Compiler/Frontend/Canonical/Pkg.vuna"
let v_encPackageIdentity = (fun (dtb_u_u12 : t_PackageIdentity) -> ((Base_dBytes.v_encTop v_encIdentity) dtb_u_u12))

# 81 "Vuna/Compiler/Frontend/Canonical/Pkg.vuna"
let v_decFile = (fun (dtb_u_u13 : int) (dtb_u_u14 : Base_dBytes.t_Cur) -> (let dtb_u_u15 = ((Base_dBytes.v_decStr dtb_u_u13) dtb_u_u14) in (match dtb_u_u15 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u16) -> (match dtb_u_u16 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u17; B_dData_dPair.f_Pair_second = dtb_u_u18 } -> (let dtb_u_u19 = ((Base_dBytes.v_decStr dtb_u_u13) dtb_u_u18) in (match dtb_u_u19 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u20) -> (match dtb_u_u20 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u21; B_dData_dPair.f_Pair_second = dtb_u_u22 } -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = { f_PackageFile_pfPath = dtb_u_u17; f_PackageFile_pfContent = dtb_u_u21 }; B_dData_dPair.f_Pair_second = dtb_u_u22 }))
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
let v_decContentAt = (fun (dtb_u_u23 : int) (dtb_u_u24 : Base_dBytes.t_Cur) -> (let dtb_u_u25 = ((Base_dBytes.v_decTag dtb_u_u23) dtb_u_u24) in (match dtb_u_u25 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u26) -> (match dtb_u_u26 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u27; B_dData_dPair.f_Pair_second = dtb_u_u28 } -> (if (dtb_u_u27 = v_contentTag) then (((Base_dBytes.v_decList v_decFile) dtb_u_u23) dtb_u_u28) else B_dData_dMaybe.C_Maybe_Nothing)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)))

# 97 "Vuna/Compiler/Frontend/Canonical/Pkg.vuna"
let v_decPackageContent = (fun (dtb_u_u29 : string) -> (let dtb_u_u30 = ((v_decContentAt ((2 * (String.length dtb_u_u29)) + 16)) (Base_dBytes.v_curOf dtb_u_u29)) in (match dtb_u_u30 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u31) -> (match dtb_u_u31 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u32; B_dData_dPair.f_Pair_second = dtb_u_u33 } -> (if (Base_dBytes.v_curAtEnd dtb_u_u33) then (B_dData_dMaybe.C_Maybe_Just (dtb_u_u32)) else B_dData_dMaybe.C_Maybe_Nothing)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)))

# 103 "Vuna/Compiler/Frontend/Canonical/Pkg.vuna"
let v_decStrPair = (fun (dtb_u_u34 : int) (dtb_u_u35 : Base_dBytes.t_Cur) -> ((((Base_dBytes.v_decPair Base_dBytes.v_decStr) Base_dBytes.v_decStr) dtb_u_u34) dtb_u_u35))

# 106 "Vuna/Compiler/Frontend/Canonical/Pkg.vuna"
let v_decIdentityAt = (fun (dtb_u_u36 : int) (dtb_u_u37 : Base_dBytes.t_Cur) -> (let dtb_u_u38 = ((Base_dBytes.v_decTag dtb_u_u36) dtb_u_u37) in (match dtb_u_u38 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u39) -> (match dtb_u_u39 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u40; B_dData_dPair.f_Pair_second = dtb_u_u41 } -> (if (dtb_u_u40 = v_identityTag) then (let dtb_u_u42 = ((Base_dBytes.v_decStr dtb_u_u36) dtb_u_u41) in (match dtb_u_u42 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u43) -> (match dtb_u_u43 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u44; B_dData_dPair.f_Pair_second = dtb_u_u45 } -> (let dtb_u_u46 = (((Base_dBytes.v_decList Base_dBytes.v_decStr) dtb_u_u36) dtb_u_u45) in (match dtb_u_u46 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u47) -> (match dtb_u_u47 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u48; B_dData_dPair.f_Pair_second = dtb_u_u49 } -> (let dtb_u_u50 = (((Base_dBytes.v_decList v_decStrPair) dtb_u_u36) dtb_u_u49) in (match dtb_u_u50 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u51) -> (match dtb_u_u51 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u52; B_dData_dPair.f_Pair_second = dtb_u_u53 } -> (let dtb_u_u54 = (((Base_dBytes.v_decList v_decStrPair) dtb_u_u36) dtb_u_u53) in (match dtb_u_u54 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u55) -> (match dtb_u_u55 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u56; B_dData_dPair.f_Pair_second = dtb_u_u57 } -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = { f_PackageIdentity_piName = dtb_u_u44; f_PackageIdentity_piExports = dtb_u_u48; f_PackageIdentity_piDeps = dtb_u_u52; f_PackageIdentity_piFiles = dtb_u_u56 }; B_dData_dPair.f_Pair_second = dtb_u_u57 }))
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
let v_decPackageIdentity = (fun (dtb_u_u58 : string) -> (let dtb_u_u59 = ((v_decIdentityAt ((2 * (String.length dtb_u_u58)) + 16)) (Base_dBytes.v_curOf dtb_u_u58)) in (match dtb_u_u59 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u60) -> (match dtb_u_u60 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u61; B_dData_dPair.f_Pair_second = dtb_u_u62 } -> (if (Base_dBytes.v_curAtEnd dtb_u_u62) then (B_dData_dMaybe.C_Maybe_Just (dtb_u_u61)) else B_dData_dMaybe.C_Maybe_Nothing)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)))

# 25 "Vuna/Compiler/Frontend/Canonical/Pkg.vuna"
let v_pfPath = (fun (dtb_u_u63 : t_PackageFile) -> (match dtb_u_u63 with
  | { f_PackageFile_pfPath = dtb_u_u64; f_PackageFile_pfContent = dtb_u_u65 } -> dtb_u_u64
  | _ -> failwith "DT: impossible branch"
))

# 26 "Vuna/Compiler/Frontend/Canonical/Pkg.vuna"
let v_pfContent = (fun (dtb_u_u66 : t_PackageFile) -> (match dtb_u_u66 with
  | { f_PackageFile_pfPath = dtb_u_u67; f_PackageFile_pfContent = dtb_u_u68 } -> dtb_u_u68
  | _ -> failwith "DT: impossible branch"
))

# 30 "Vuna/Compiler/Frontend/Canonical/Pkg.vuna"
let v_psName = (fun (dtb_u_u69 : t_PackageSource) -> (match dtb_u_u69 with
  | { f_PackageSource_psName = dtb_u_u70; f_PackageSource_psExports = dtb_u_u71; f_PackageSource_psDeps = dtb_u_u72; f_PackageSource_psFiles = dtb_u_u73 } -> dtb_u_u70
  | _ -> failwith "DT: impossible branch"
))

# 31 "Vuna/Compiler/Frontend/Canonical/Pkg.vuna"
let v_psExports = (fun (dtb_u_u74 : t_PackageSource) -> (match dtb_u_u74 with
  | { f_PackageSource_psName = dtb_u_u75; f_PackageSource_psExports = dtb_u_u76; f_PackageSource_psDeps = dtb_u_u77; f_PackageSource_psFiles = dtb_u_u78 } -> dtb_u_u76
  | _ -> failwith "DT: impossible branch"
))

# 32 "Vuna/Compiler/Frontend/Canonical/Pkg.vuna"
let v_psDeps = (fun (dtb_u_u79 : t_PackageSource) -> (match dtb_u_u79 with
  | { f_PackageSource_psName = dtb_u_u80; f_PackageSource_psExports = dtb_u_u81; f_PackageSource_psDeps = dtb_u_u82; f_PackageSource_psFiles = dtb_u_u83 } -> dtb_u_u82
  | _ -> failwith "DT: impossible branch"
))

# 33 "Vuna/Compiler/Frontend/Canonical/Pkg.vuna"
let v_psFiles = (fun (dtb_u_u84 : t_PackageSource) -> (match dtb_u_u84 with
  | { f_PackageSource_psName = dtb_u_u85; f_PackageSource_psExports = dtb_u_u86; f_PackageSource_psDeps = dtb_u_u87; f_PackageSource_psFiles = dtb_u_u88 } -> dtb_u_u88
  | _ -> failwith "DT: impossible branch"
))

# 37 "Vuna/Compiler/Frontend/Canonical/Pkg.vuna"
let v_piName = (fun (dtb_u_u89 : t_PackageIdentity) -> (match dtb_u_u89 with
  | { f_PackageIdentity_piName = dtb_u_u90; f_PackageIdentity_piExports = dtb_u_u91; f_PackageIdentity_piDeps = dtb_u_u92; f_PackageIdentity_piFiles = dtb_u_u93 } -> dtb_u_u90
  | _ -> failwith "DT: impossible branch"
))

# 38 "Vuna/Compiler/Frontend/Canonical/Pkg.vuna"
let v_piExports = (fun (dtb_u_u94 : t_PackageIdentity) -> (match dtb_u_u94 with
  | { f_PackageIdentity_piName = dtb_u_u95; f_PackageIdentity_piExports = dtb_u_u96; f_PackageIdentity_piDeps = dtb_u_u97; f_PackageIdentity_piFiles = dtb_u_u98 } -> dtb_u_u96
  | _ -> failwith "DT: impossible branch"
))

# 39 "Vuna/Compiler/Frontend/Canonical/Pkg.vuna"
let v_piDeps = (fun (dtb_u_u99 : t_PackageIdentity) -> (match dtb_u_u99 with
  | { f_PackageIdentity_piName = dtb_u_u100; f_PackageIdentity_piExports = dtb_u_u101; f_PackageIdentity_piDeps = dtb_u_u102; f_PackageIdentity_piFiles = dtb_u_u103 } -> dtb_u_u102
  | _ -> failwith "DT: impossible branch"
))

# 40 "Vuna/Compiler/Frontend/Canonical/Pkg.vuna"
let v_piFiles = (fun (dtb_u_u104 : t_PackageIdentity) -> (match dtb_u_u104 with
  | { f_PackageIdentity_piName = dtb_u_u105; f_PackageIdentity_piExports = dtb_u_u106; f_PackageIdentity_piDeps = dtb_u_u107; f_PackageIdentity_piFiles = dtb_u_u108 } -> dtb_u_u108
  | _ -> failwith "DT: impossible branch"
))
