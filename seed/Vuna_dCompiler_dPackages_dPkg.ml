open Vuna_runtime
type t_Vuna_dCompiler_dPackages_dPkg_dRoot = { f_Vuna_dCompiler_dPackages_dPkg_dRoot_rootDir : string; f_Vuna_dCompiler_dPackages_dPkg_dRoot_rootName : string; f_Vuna_dCompiler_dPackages_dPkg_dRoot_rootExports : string Base_dList.t_Base_dList_dList Base_dMaybe.t_Base_dMaybe_dMaybe; f_Vuna_dCompiler_dPackages_dPkg_dRoot_rootCapabilities : string Base_dList.t_Base_dList_dList; f_Vuna_dCompiler_dPackages_dPkg_dRoot_rootTrustUnsafe : string Base_dList.t_Base_dList_dList Base_dMaybe.t_Base_dMaybe_dMaybe; f_Vuna_dCompiler_dPackages_dPkg_dRoot_rootPrivileged : bool; f_Vuna_dCompiler_dPackages_dPkg_dRoot_rootHostModules : string Base_dList.t_Base_dList_dList }
and t_Vuna_dCompiler_dPackages_dPkg_dPackage = { f_Vuna_dCompiler_dPackages_dPkg_dPackage_packageManifest : Vuna_dCompiler_dFrontend_dManifest.t_Vuna_dCompiler_dFrontend_dManifest_dManifest; f_Vuna_dCompiler_dPackages_dPkg_dPackage_packageDependencies : t_Vuna_dCompiler_dPackages_dPkg_dPackage Base_dList.t_Base_dList_dList; f_Vuna_dCompiler_dPackages_dPkg_dPackage_packageDir : string }
and t_Vuna_dCompiler_dPackages_dPkg_dPackageContext = { f_Vuna_dCompiler_dPackages_dPkg_dPackageContext_contextDir : string; f_Vuna_dCompiler_dPackages_dPkg_dPackageContext_contextPackage : t_Vuna_dCompiler_dPackages_dPkg_dPackage Base_dMaybe.t_Base_dMaybe_dMaybe; f_Vuna_dCompiler_dPackages_dPkg_dPackageContext_contextRoots : t_Vuna_dCompiler_dPackages_dPkg_dRoot Base_dList.t_Base_dList_dList; f_Vuna_dCompiler_dPackages_dPkg_dPackageContext_contextPackageName : string; f_Vuna_dCompiler_dPackages_dPkg_dPackageContext_contextCapabilities : string Base_dList.t_Base_dList_dList; f_Vuna_dCompiler_dPackages_dPkg_dPackageContext_contextTrustUnsafe : string Base_dList.t_Base_dList_dList Base_dMaybe.t_Base_dMaybe_dMaybe; f_Vuna_dCompiler_dPackages_dPkg_dPackageContext_contextPrivileged : bool }

let v_Vuna_dCompiler_dPackages_dPkg_dpackageDependencies = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dPackages_dPkg_dPackage_packageManifest = dtb__0; f_Vuna_dCompiler_dPackages_dPkg_dPackage_packageDependencies = dtb__1; f_Vuna_dCompiler_dPackages_dPkg_dPackage_packageDir = dtb__2 } -> dtb__1
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dPackages_dPkg_drootDir = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dPackages_dPkg_dRoot_rootDir = dtb__3; f_Vuna_dCompiler_dPackages_dPkg_dRoot_rootName = dtb__4; f_Vuna_dCompiler_dPackages_dPkg_dRoot_rootExports = dtb__5; f_Vuna_dCompiler_dPackages_dPkg_dRoot_rootCapabilities = dtb__6; f_Vuna_dCompiler_dPackages_dPkg_dRoot_rootTrustUnsafe = dtb__7; f_Vuna_dCompiler_dPackages_dPkg_dRoot_rootPrivileged = dtb__8; f_Vuna_dCompiler_dPackages_dPkg_dRoot_rootHostModules = dtb__9 } -> dtb__3
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dPackages_dPkg_drootName = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dPackages_dPkg_dRoot_rootDir = dtb__10; f_Vuna_dCompiler_dPackages_dPkg_dRoot_rootName = dtb__11; f_Vuna_dCompiler_dPackages_dPkg_dRoot_rootExports = dtb__12; f_Vuna_dCompiler_dPackages_dPkg_dRoot_rootCapabilities = dtb__13; f_Vuna_dCompiler_dPackages_dPkg_dRoot_rootTrustUnsafe = dtb__14; f_Vuna_dCompiler_dPackages_dPkg_dRoot_rootPrivileged = dtb__15; f_Vuna_dCompiler_dPackages_dPkg_dRoot_rootHostModules = dtb__16 } -> dtb__11
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dPackages_dPkg_drootPackage = (fun root -> (v_Vuna_dCompiler_dPackages_dPkg_drootName root))

let v_Vuna_dCompiler_dPackages_dPkg_drootCapabilities = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dPackages_dPkg_dRoot_rootDir = dtb__17; f_Vuna_dCompiler_dPackages_dPkg_dRoot_rootName = dtb__18; f_Vuna_dCompiler_dPackages_dPkg_dRoot_rootExports = dtb__19; f_Vuna_dCompiler_dPackages_dPkg_dRoot_rootCapabilities = dtb__20; f_Vuna_dCompiler_dPackages_dPkg_dRoot_rootTrustUnsafe = dtb__21; f_Vuna_dCompiler_dPackages_dPkg_dRoot_rootPrivileged = dtb__22; f_Vuna_dCompiler_dPackages_dPkg_dRoot_rootHostModules = dtb__23 } -> dtb__20
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dPackages_dPkg_drootTrustUnsafe = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dPackages_dPkg_dRoot_rootDir = dtb__24; f_Vuna_dCompiler_dPackages_dPkg_dRoot_rootName = dtb__25; f_Vuna_dCompiler_dPackages_dPkg_dRoot_rootExports = dtb__26; f_Vuna_dCompiler_dPackages_dPkg_dRoot_rootCapabilities = dtb__27; f_Vuna_dCompiler_dPackages_dPkg_dRoot_rootTrustUnsafe = dtb__28; f_Vuna_dCompiler_dPackages_dPkg_dRoot_rootPrivileged = dtb__29; f_Vuna_dCompiler_dPackages_dPkg_dRoot_rootHostModules = dtb__30 } -> dtb__28
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dPackages_dPkg_drootPrivileged = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dPackages_dPkg_dRoot_rootDir = dtb__31; f_Vuna_dCompiler_dPackages_dPkg_dRoot_rootName = dtb__32; f_Vuna_dCompiler_dPackages_dPkg_dRoot_rootExports = dtb__33; f_Vuna_dCompiler_dPackages_dPkg_dRoot_rootCapabilities = dtb__34; f_Vuna_dCompiler_dPackages_dPkg_dRoot_rootTrustUnsafe = dtb__35; f_Vuna_dCompiler_dPackages_dPkg_dRoot_rootPrivileged = dtb__36; f_Vuna_dCompiler_dPackages_dPkg_dRoot_rootHostModules = dtb__37 } -> dtb__36
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dPackages_dPkg_drootHostModules = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dPackages_dPkg_dRoot_rootDir = dtb__38; f_Vuna_dCompiler_dPackages_dPkg_dRoot_rootName = dtb__39; f_Vuna_dCompiler_dPackages_dPkg_dRoot_rootExports = dtb__40; f_Vuna_dCompiler_dPackages_dPkg_dRoot_rootCapabilities = dtb__41; f_Vuna_dCompiler_dPackages_dPkg_dRoot_rootTrustUnsafe = dtb__42; f_Vuna_dCompiler_dPackages_dPkg_dRoot_rootPrivileged = dtb__43; f_Vuna_dCompiler_dPackages_dPkg_dRoot_rootHostModules = dtb__44 } -> dtb__44
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dPackages_dPkg_dcontextDir = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dPackages_dPkg_dPackageContext_contextDir = dtb__45; f_Vuna_dCompiler_dPackages_dPkg_dPackageContext_contextPackage = dtb__46; f_Vuna_dCompiler_dPackages_dPkg_dPackageContext_contextRoots = dtb__47; f_Vuna_dCompiler_dPackages_dPkg_dPackageContext_contextPackageName = dtb__48; f_Vuna_dCompiler_dPackages_dPkg_dPackageContext_contextCapabilities = dtb__49; f_Vuna_dCompiler_dPackages_dPkg_dPackageContext_contextTrustUnsafe = dtb__50; f_Vuna_dCompiler_dPackages_dPkg_dPackageContext_contextPrivileged = dtb__51 } -> dtb__45
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dPackages_dPkg_dcontextRoots = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dPackages_dPkg_dPackageContext_contextDir = dtb__52; f_Vuna_dCompiler_dPackages_dPkg_dPackageContext_contextPackage = dtb__53; f_Vuna_dCompiler_dPackages_dPkg_dPackageContext_contextRoots = dtb__54; f_Vuna_dCompiler_dPackages_dPkg_dPackageContext_contextPackageName = dtb__55; f_Vuna_dCompiler_dPackages_dPkg_dPackageContext_contextCapabilities = dtb__56; f_Vuna_dCompiler_dPackages_dPkg_dPackageContext_contextTrustUnsafe = dtb__57; f_Vuna_dCompiler_dPackages_dPkg_dPackageContext_contextPrivileged = dtb__58 } -> dtb__54
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dPackages_dPkg_dcontextPackageOf = (fun ctx -> (ctx).f_Vuna_dCompiler_dPackages_dPkg_dPackageContext_contextPackage)

let v_Vuna_dCompiler_dPackages_dPkg_dcontextPackageName = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dPackages_dPkg_dPackageContext_contextDir = dtb__59; f_Vuna_dCompiler_dPackages_dPkg_dPackageContext_contextPackage = dtb__60; f_Vuna_dCompiler_dPackages_dPkg_dPackageContext_contextRoots = dtb__61; f_Vuna_dCompiler_dPackages_dPkg_dPackageContext_contextPackageName = dtb__62; f_Vuna_dCompiler_dPackages_dPkg_dPackageContext_contextCapabilities = dtb__63; f_Vuna_dCompiler_dPackages_dPkg_dPackageContext_contextTrustUnsafe = dtb__64; f_Vuna_dCompiler_dPackages_dPkg_dPackageContext_contextPrivileged = dtb__65 } -> dtb__62
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dPackages_dPkg_dcontextCapabilities = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dPackages_dPkg_dPackageContext_contextDir = dtb__66; f_Vuna_dCompiler_dPackages_dPkg_dPackageContext_contextPackage = dtb__67; f_Vuna_dCompiler_dPackages_dPkg_dPackageContext_contextRoots = dtb__68; f_Vuna_dCompiler_dPackages_dPkg_dPackageContext_contextPackageName = dtb__69; f_Vuna_dCompiler_dPackages_dPkg_dPackageContext_contextCapabilities = dtb__70; f_Vuna_dCompiler_dPackages_dPkg_dPackageContext_contextTrustUnsafe = dtb__71; f_Vuna_dCompiler_dPackages_dPkg_dPackageContext_contextPrivileged = dtb__72 } -> dtb__70
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dPackages_dPkg_dcontextTrustUnsafe = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dPackages_dPkg_dPackageContext_contextDir = dtb__73; f_Vuna_dCompiler_dPackages_dPkg_dPackageContext_contextPackage = dtb__74; f_Vuna_dCompiler_dPackages_dPkg_dPackageContext_contextRoots = dtb__75; f_Vuna_dCompiler_dPackages_dPkg_dPackageContext_contextPackageName = dtb__76; f_Vuna_dCompiler_dPackages_dPkg_dPackageContext_contextCapabilities = dtb__77; f_Vuna_dCompiler_dPackages_dPkg_dPackageContext_contextTrustUnsafe = dtb__78; f_Vuna_dCompiler_dPackages_dPkg_dPackageContext_contextPrivileged = dtb__79 } -> dtb__78
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dPackages_dPkg_dcontextPrivileged = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dPackages_dPkg_dPackageContext_contextDir = dtb__80; f_Vuna_dCompiler_dPackages_dPkg_dPackageContext_contextPackage = dtb__81; f_Vuna_dCompiler_dPackages_dPkg_dPackageContext_contextRoots = dtb__82; f_Vuna_dCompiler_dPackages_dPkg_dPackageContext_contextPackageName = dtb__83; f_Vuna_dCompiler_dPackages_dPkg_dPackageContext_contextCapabilities = dtb__84; f_Vuna_dCompiler_dPackages_dPkg_dPackageContext_contextTrustUnsafe = dtb__85; f_Vuna_dCompiler_dPackages_dPkg_dPackageContext_contextPrivileged = dtb__86 } -> dtb__86
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dPackages_dPkg_dprivilegedContext = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dPackages_dPkg_dPackageContext_contextDir = dtb__87; f_Vuna_dCompiler_dPackages_dPkg_dPackageContext_contextPackage = dtb__88; f_Vuna_dCompiler_dPackages_dPkg_dPackageContext_contextRoots = dtb__89; f_Vuna_dCompiler_dPackages_dPkg_dPackageContext_contextPackageName = dtb__90; f_Vuna_dCompiler_dPackages_dPkg_dPackageContext_contextCapabilities = dtb__91; f_Vuna_dCompiler_dPackages_dPkg_dPackageContext_contextTrustUnsafe = dtb__92; f_Vuna_dCompiler_dPackages_dPkg_dPackageContext_contextPrivileged = dtb__93 } -> { f_Vuna_dCompiler_dPackages_dPkg_dPackageContext_contextDir = dtb__87; f_Vuna_dCompiler_dPackages_dPkg_dPackageContext_contextPackage = dtb__88; f_Vuna_dCompiler_dPackages_dPkg_dPackageContext_contextRoots = dtb__89; f_Vuna_dCompiler_dPackages_dPkg_dPackageContext_contextPackageName = dtb__90; f_Vuna_dCompiler_dPackages_dPkg_dPackageContext_contextCapabilities = dtb__91; f_Vuna_dCompiler_dPackages_dPkg_dPackageContext_contextTrustUnsafe = dtb__92; f_Vuna_dCompiler_dPackages_dPkg_dPackageContext_contextPrivileged = true }
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dPackages_dPkg_dpackageDir = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dPackages_dPkg_dPackage_packageManifest = dtb__94; f_Vuna_dCompiler_dPackages_dPkg_dPackage_packageDependencies = dtb__95; f_Vuna_dCompiler_dPackages_dPkg_dPackage_packageDir = dtb__96 } -> dtb__96
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dPackages_dPkg_dpackageName = (fun package -> (match ((package).f_Vuna_dCompiler_dPackages_dPkg_dPackage_packageManifest).Vuna_dCompiler_dFrontend_dManifest.f_Vuna_dCompiler_dFrontend_dManifest_dManifest_manifestName with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ""
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__97) -> dtb__97
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dPackages_dPkg_dpackageExports = (fun package -> ((package).f_Vuna_dCompiler_dPackages_dPkg_dPackage_packageManifest).Vuna_dCompiler_dFrontend_dManifest.f_Vuna_dCompiler_dFrontend_dManifest_dManifest_manifestExports)

let rec v_Vuna_dCompiler_dPackages_dPkg_dsplitSlashChars = (fun mc0 mc1 mc2 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__98, dtb__99) -> (if (dtb__98 = 47) then (((v_Vuna_dCompiler_dPackages_dPkg_dsplitSlashChars dtb__99) (Base_dList.C_Base_dList_dList_Cons ((Base_dList.dtp_pack (Base_dList.v_Base_dList_dreverse mc2)), mc1))) Base_dList.C_Base_dList_dList_Nil) else (((v_Vuna_dCompiler_dPackages_dPkg_dsplitSlashChars dtb__99) mc1) (Base_dList.C_Base_dList_dList_Cons (dtb__98, mc2))))
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dList.v_Base_dList_dreverse (Base_dList.C_Base_dList_dList_Cons ((Base_dList.dtp_pack (Base_dList.v_Base_dList_dreverse mc2)), mc1)))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dPackages_dPkg_dsplitOnSlash = (fun path -> (((v_Vuna_dCompiler_dPackages_dPkg_dsplitSlashChars (Base_dList.dtp_unpack path)) Base_dList.C_Base_dList_dList_Nil) Base_dList.C_Base_dList_dList_Nil))

let rec v_Vuna_dCompiler_dPackages_dPkg_dnormalizeAcc = (fun mc0 mc1 mc2 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__100, dtb__101) -> (if (dtb__100 = "") then (((v_Vuna_dCompiler_dPackages_dPkg_dnormalizeAcc mc0) dtb__101) mc2) else (if (dtb__100 = ".") then (((v_Vuna_dCompiler_dPackages_dPkg_dnormalizeAcc mc0) dtb__101) mc2) else (if (dtb__100 = "..") then (match mc2 with
  | Base_dList.C_Base_dList_dList_Nil -> (if mc0 then (((v_Vuna_dCompiler_dPackages_dPkg_dnormalizeAcc mc0) dtb__101) Base_dList.C_Base_dList_dList_Nil) else (((v_Vuna_dCompiler_dPackages_dPkg_dnormalizeAcc mc0) dtb__101) (Base_dList.C_Base_dList_dList_Cons ("..", Base_dList.C_Base_dList_dList_Nil))))
  | Base_dList.C_Base_dList_dList_Cons (dtb__102, dtb__103) -> (if (dtb__102 = "..") then (((v_Vuna_dCompiler_dPackages_dPkg_dnormalizeAcc mc0) dtb__101) (Base_dList.C_Base_dList_dList_Cons ("..", mc2))) else (((v_Vuna_dCompiler_dPackages_dPkg_dnormalizeAcc mc0) dtb__101) dtb__103))
  | _ -> failwith "DT: impossible branch"
) else (((v_Vuna_dCompiler_dPackages_dPkg_dnormalizeAcc mc0) dtb__101) (Base_dList.C_Base_dList_dList_Cons (dtb__100, mc2))))))
  | Base_dList.C_Base_dList_dList_Nil -> mc2
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dPackages_dPkg_dnormalizeDir = (fun path -> (if ((Base_dString.v_Base_dString_dstartsWith "/") path) then (match (((v_Vuna_dCompiler_dPackages_dPkg_dnormalizeAcc true) (v_Vuna_dCompiler_dPackages_dPkg_dsplitOnSlash path)) Base_dList.C_Base_dList_dList_Nil) with
  | Base_dList.C_Base_dList_dList_Nil -> "/"
  | dtb__104 -> ("/" ^ (Vuna_dCompiler_dSource.v_Vuna_dCompiler_dSource_djoinSlashes (Base_dList.v_Base_dList_dreverse dtb__104)))
) else (match (((v_Vuna_dCompiler_dPackages_dPkg_dnormalizeAcc false) (v_Vuna_dCompiler_dPackages_dPkg_dsplitOnSlash path)) Base_dList.C_Base_dList_dList_Nil) with
  | Base_dList.C_Base_dList_dList_Nil -> "."
  | dtb__105 -> (Vuna_dCompiler_dSource.v_Vuna_dCompiler_dSource_djoinSlashes (Base_dList.v_Base_dList_dreverse dtb__105))
)))

let v_Vuna_dCompiler_dPackages_dPkg_dabsolutePath = (fun path -> (if ((Base_dString.v_Base_dString_dstartsWith "/") path) then ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (v_Vuna_dCompiler_dPackages_dPkg_dnormalizeDir path)) else (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> (dtp_getcwd ())))) (fun cwd -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (v_Vuna_dCompiler_dPackages_dPkg_dnormalizeDir (String.concat "" [cwd; "/"; path])))))))

let v_Vuna_dCompiler_dPackages_dPkg_djoinPath = (fun base rel -> (if ((Base_dString.v_Base_dString_dstartsWith "/") rel) then (v_Vuna_dCompiler_dPackages_dPkg_dnormalizeDir rel) else (v_Vuna_dCompiler_dPackages_dPkg_dnormalizeDir (String.concat "" [base; "/"; rel]))))

let rec v_Vuna_dCompiler_dPackages_dPkg_djoinPathsText = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__106, dtb__107) -> (match dtb__107 with
  | Base_dList.C_Base_dList_dList_Nil -> dtb__106
  | _ -> (String.concat "" [dtb__106; ", "; (v_Vuna_dCompiler_dPackages_dPkg_djoinPathsText dtb__107)])
)
  | Base_dList.C_Base_dList_dList_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dPackages_dPkg_dloadManifestAt = (fun path -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((fun dtio_0 -> Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> dtp_fileExists dtio_0)) path)) (fun exists -> (if exists then (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((fun dtio_0 -> Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> dtp_readFile dtio_0)) path)) (fun text -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (match ((Vuna_dCompiler_dFrontend_dManifest.v_Vuna_dCompiler_dFrontend_dManifest_dparseManifest path) text) with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__108) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__108))
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__109) -> (match (Vuna_dCompiler_dFrontend_dManifest.v_Vuna_dCompiler_dFrontend_dManifest_dvalidateManifest dtb__109) with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__110) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__110))
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__111) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__111))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))) else ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (((Vuna_dCompiler_dDiagnostics_dPkg.v_Vuna_dCompiler_dDiagnostics_dPkg_dpkgPath1 path) (Vuna_dCompiler_dDiagnostics_dPkg.C_Vuna_dCompiler_dDiagnostics_dPkg_dPkgErr_MissingManifest ((v_Vuna_dCompiler_dPackages_dPkg_dnormalizeDir (Vuna_dCompiler_dFrontend_dManifest.v_Vuna_dCompiler_dFrontend_dManifest_dmanifestDir path))))) (v_Vuna_dCompiler_dPackages_dPkg_dnormalizeDir (Vuna_dCompiler_dFrontend_dManifest.v_Vuna_dCompiler_dFrontend_dManifest_dmanifestDir path))))))))

let v_Vuna_dCompiler_dPackages_dPkg_dmanifestNameString = (fun manifest -> (match (manifest).Vuna_dCompiler_dFrontend_dManifest.f_Vuna_dCompiler_dFrontend_dManifest_dManifest_manifestName with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ""
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__112) -> dtb__112
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dPackages_dPkg_dmemStackDir = (fun _uctx0 mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__113, dtb__114) -> (if (((Base_dEq.v_Base_dEq_deq _uctx0) (Base_dPair.v_Base_dPair_dfirstOf dtb__113)) mc0) then true else (((v_Vuna_dCompiler_dPackages_dPkg_dmemStackDir _uctx0) mc0) dtb__114))
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dPackages_dPkg_dcyclePrefix = (fun _uctx0 mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__115, dtb__116) -> (if (((Base_dEq.v_Base_dEq_deq _uctx0) (Base_dPair.v_Base_dPair_dfirstOf dtb__115)) mc0) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((Base_dList.C_Base_dList_dList_Cons (dtb__115, Base_dList.C_Base_dList_dList_Nil)))) else (match (((v_Vuna_dCompiler_dPackages_dPkg_dcyclePrefix _uctx0) mc0) dtb__116) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__117) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((Base_dList.C_Base_dList_dList_Cons (dtb__115, dtb__117))))
  | _ -> failwith "DT: impossible branch"
))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dPackages_dPkg_dcycleMessage = (fun mc0 mc1 mc2 -> (match mc1 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__118) -> (match (((v_Vuna_dCompiler_dPackages_dPkg_dcyclePrefix Base_dString.v_Eq_uString) mc0) mc2) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ("pkg: dependency cycle at " ^ mc0)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__119) -> ("pkg: dependency cycle: " ^ (Vuna_dCompiler_dSource.v_Vuna_dCompiler_dSource_djoinArrows ((Base_dList.v_Base_dList_dappend ((Base_dList.v_Base_dList_dmap Base_dPair.v_Base_dPair_dsecondOf) (Base_dList.v_Base_dList_dreverse dtb__119))) (Base_dList.C_Base_dList_dList_Cons (dtb__118, Base_dList.C_Base_dList_dList_Nil)))))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ("pkg: dependency cycle at " ^ mc0)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dPackages_dPkg_ddependencyNameOk = (fun _uctx0 mc0 mc1 -> (match mc0 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__120) -> (((Base_dEq.v_Base_dEq_deq _uctx0) dtb__120) mc1)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> true
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dPackages_dPkg_dmismatchMessage = (fun mc0 mc1 -> (match mc0 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__121) -> (String.concat "" ["pkg: dependency "; dtb__121; " expects package name "; dtb__121; " but found "; mc1])
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> "pkg: package name mismatch"
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dPackages_dPkg_dloadDependencyList = (fun fuel stack baseDir deps -> (if (fuel <= 0) then ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicFuel "pkg")) else ((fun nd_uscrut4 -> (match nd_uscrut4 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__122, dtb__123) -> (match dtb__122 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__124; Base_dPair.f_Base_dPair_dPair_second = dtb__125 } -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((((v_Vuna_dCompiler_dPackages_dPkg_dloadPackageWalk (fuel - 1)) stack) (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__124))) ((v_Vuna_dCompiler_dPackages_dPkg_djoinPath baseDir) dtb__125))) (fun dependencyR -> (match dependencyR with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__126) -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__126)))
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__127) -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((((v_Vuna_dCompiler_dPackages_dPkg_dloadDependencyList (fuel - 1)) stack) baseDir) dtb__123)) (fun restR -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (match restR with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__128) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__128))
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__129) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ((Base_dList.C_Base_dList_dList_Cons (dtb__127, dtb__129))))
  | _ -> failwith "DT: impossible branch"
))))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (Base_dList.C_Base_dList_dList_Nil)))
  | _ -> failwith "DT: impossible branch"
)) deps)))
and v_Vuna_dCompiler_dPackages_dPkg_dloadPackageWalk = (fun fuel stack depName dir -> (if (fuel <= 0) then ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicFuel "pkg")) else ((fun normalized -> (if (((v_Vuna_dCompiler_dPackages_dPkg_dmemStackDir Base_dString.v_Eq_uString) normalized) stack) then ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (Vuna_dCompiler_dDiagnostics_dPkg.v_Vuna_dCompiler_dDiagnostics_dPkg_dpkgInvalid (((v_Vuna_dCompiler_dPackages_dPkg_dcycleMessage normalized) depName) stack))) else (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (v_Vuna_dCompiler_dPackages_dPkg_dloadManifestAt (normalized ^ "/vuna.toml"))) (fun manifestR -> (match manifestR with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__130) -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__130)))
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__131) -> ((fun name -> (if (((v_Vuna_dCompiler_dPackages_dPkg_ddependencyNameOk Base_dString.v_Eq_uString) depName) name) then (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((((v_Vuna_dCompiler_dPackages_dPkg_dloadDependencyList (fuel - 1)) (Base_dList.C_Base_dList_dList_Cons ({ Base_dPair.f_Base_dPair_dPair_first = normalized; Base_dPair.f_Base_dPair_dPair_second = name }, stack))) normalized) (dtb__131).Vuna_dCompiler_dFrontend_dManifest.f_Vuna_dCompiler_dFrontend_dManifest_dManifest_manifestDependencies)) (fun dependencyR -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (match dependencyR with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__132) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__132))
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__133) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ f_Vuna_dCompiler_dPackages_dPkg_dPackage_packageManifest = dtb__131; f_Vuna_dCompiler_dPackages_dPkg_dPackage_packageDependencies = dtb__133; f_Vuna_dCompiler_dPackages_dPkg_dPackage_packageDir = normalized }))
  | _ -> failwith "DT: impossible branch"
)))) else ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (Vuna_dCompiler_dDiagnostics_dPkg.v_Vuna_dCompiler_dDiagnostics_dPkg_dpkgInvalid ((v_Vuna_dCompiler_dPackages_dPkg_dmismatchMessage depName) name))))) (v_Vuna_dCompiler_dPackages_dPkg_dmanifestNameString dtb__131))
  | _ -> failwith "DT: impossible branch"
))))) (v_Vuna_dCompiler_dPackages_dPkg_dnormalizeDir dir))))

let rec v_Vuna_dCompiler_dPackages_dPkg_dcollectPackageIds = (fun package -> (Base_dList.C_Base_dList_dList_Cons ({ Base_dPair.f_Base_dPair_dPair_first = (v_Vuna_dCompiler_dPackages_dPkg_dpackageName package); Base_dPair.f_Base_dPair_dPair_second = (v_Vuna_dCompiler_dPackages_dPkg_dpackageDir package) }, (v_Vuna_dCompiler_dPackages_dPkg_dcollectDependencyIds (v_Vuna_dCompiler_dPackages_dPkg_dpackageDependencies package)))))
and v_Vuna_dCompiler_dPackages_dPkg_dcollectDependencyIds = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__134, dtb__135) -> ((Base_dList.v_Base_dList_dappend (v_Vuna_dCompiler_dPackages_dPkg_dcollectPackageIds dtb__134)) (v_Vuna_dCompiler_dPackages_dPkg_dcollectDependencyIds dtb__135))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dPackages_dPkg_dlookupPackageDir = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__136, dtb__137) -> (match dtb__136 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__138; Base_dPair.f_Base_dPair_dPair_second = dtb__139 } -> (if (dtb__138 = mc0) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__139)) else ((v_Vuna_dCompiler_dPackages_dPkg_dlookupPackageDir mc0) dtb__137))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dPackages_dPkg_dcheckUniqueNamesGo = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__140, dtb__141) -> (match dtb__140 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__142; Base_dPair.f_Base_dPair_dPair_second = dtb__143 } -> (match ((v_Vuna_dCompiler_dPackages_dPkg_dlookupPackageDir dtb__142) mc0) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((v_Vuna_dCompiler_dPackages_dPkg_dcheckUniqueNamesGo (Base_dList.C_Base_dList_dList_Cons ({ Base_dPair.f_Base_dPair_dPair_first = dtb__142; Base_dPair.f_Base_dPair_dPair_second = dtb__143 }, mc0))) dtb__141)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__144) -> (if (dtb__144 = dtb__143) then ((v_Vuna_dCompiler_dPackages_dPkg_dcheckUniqueNamesGo mc0) dtb__141) else (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_derr (String.concat "" ["pkg: duplicate package name \""; dtb__142; "\" in "; dtb__144; " and "; dtb__143; " (package names must be unique within a dependency graph)"])))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (0))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dPackages_dPkg_dcheckUniquePackageNames = (fun packages -> ((v_Vuna_dCompiler_dPackages_dPkg_dcheckUniqueNamesGo Base_dList.C_Base_dList_dList_Nil) (v_Vuna_dCompiler_dPackages_dPkg_dcollectDependencyIds packages)))

let v_Vuna_dCompiler_dPackages_dPkg_dpkgFuelBound = 1048576

let v_Vuna_dCompiler_dPackages_dPkg_dloadPackage = (fun dir -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((((v_Vuna_dCompiler_dPackages_dPkg_dloadPackageWalk v_Vuna_dCompiler_dPackages_dPkg_dpkgFuelBound) Base_dList.C_Base_dList_dList_Nil) Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing) dir)) (fun packageR -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (match packageR with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__145) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__145))
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__146) -> (match (v_Vuna_dCompiler_dPackages_dPkg_dcheckUniquePackageNames (Base_dList.C_Base_dList_dList_Cons (dtb__146, Base_dList.C_Base_dList_dList_Nil))) with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__147) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__147))
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__148) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__146))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))))

let rec v_Vuna_dCompiler_dPackages_dPkg_dloadMembers = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__149, dtb__150) -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (v_Vuna_dCompiler_dPackages_dPkg_dloadPackage ((v_Vuna_dCompiler_dPackages_dPkg_djoinPath mc0) dtb__149))) (fun memberR -> (match memberR with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__151) -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__151)))
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__152) -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((v_Vuna_dCompiler_dPackages_dPkg_dloadMembers mc0) dtb__150)) (fun restR -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (match restR with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__153) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__153))
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__154) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ((Base_dList.C_Base_dList_dList_Cons (dtb__152, dtb__154))))
  | _ -> failwith "DT: impossible branch"
))))
  | _ -> failwith "DT: impossible branch"
)))
  | Base_dList.C_Base_dList_dList_Nil -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (Base_dList.C_Base_dList_dList_Nil)))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dPackages_dPkg_dworkspacePackages = (fun rootBaseDir -> ((fun base -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (v_Vuna_dCompiler_dPackages_dPkg_dloadPackage base)) (fun rootR -> (match rootR with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__155) -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__155)))
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__156) -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((v_Vuna_dCompiler_dPackages_dPkg_dloadMembers base) ((dtb__156).f_Vuna_dCompiler_dPackages_dPkg_dPackage_packageManifest).Vuna_dCompiler_dFrontend_dManifest.f_Vuna_dCompiler_dFrontend_dManifest_dManifest_manifestMembers)) (fun membersR -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (match membersR with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__157) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__157))
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__158) -> (match (v_Vuna_dCompiler_dPackages_dPkg_dcheckUniquePackageNames (Base_dList.C_Base_dList_dList_Cons (dtb__156, dtb__158))) with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__159) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__159))
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__160) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ((Base_dList.C_Base_dList_dList_Cons (dtb__156, dtb__158))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))
  | _ -> failwith "DT: impossible branch"
)))) (v_Vuna_dCompiler_dPackages_dPkg_dnormalizeDir rootBaseDir)))

let v_Vuna_dCompiler_dPackages_dPkg_ddependencyRootOf = (fun package -> { f_Vuna_dCompiler_dPackages_dPkg_dRoot_rootDir = ((v_Vuna_dCompiler_dPackages_dPkg_dpackageDir package) ^ "/lib"); f_Vuna_dCompiler_dPackages_dPkg_dRoot_rootName = (v_Vuna_dCompiler_dPackages_dPkg_dpackageName package); f_Vuna_dCompiler_dPackages_dPkg_dRoot_rootExports = (v_Vuna_dCompiler_dPackages_dPkg_dpackageExports package); f_Vuna_dCompiler_dPackages_dPkg_dRoot_rootCapabilities = ((package).f_Vuna_dCompiler_dPackages_dPkg_dPackage_packageManifest).Vuna_dCompiler_dFrontend_dManifest.f_Vuna_dCompiler_dFrontend_dManifest_dManifest_manifestCapabilities; f_Vuna_dCompiler_dPackages_dPkg_dRoot_rootTrustUnsafe = ((package).f_Vuna_dCompiler_dPackages_dPkg_dPackage_packageManifest).Vuna_dCompiler_dFrontend_dManifest.f_Vuna_dCompiler_dFrontend_dManifest_dManifest_manifestTrustUnsafe; f_Vuna_dCompiler_dPackages_dPkg_dRoot_rootPrivileged = ((package).f_Vuna_dCompiler_dPackages_dPkg_dPackage_packageManifest).Vuna_dCompiler_dFrontend_dManifest.f_Vuna_dCompiler_dFrontend_dManifest_dManifest_manifestPrivileged; f_Vuna_dCompiler_dPackages_dPkg_dRoot_rootHostModules = ((package).f_Vuna_dCompiler_dPackages_dPkg_dPackage_packageManifest).Vuna_dCompiler_dFrontend_dManifest.f_Vuna_dCompiler_dFrontend_dManifest_dManifest_manifestHostModules })

let rec v_Vuna_dCompiler_dPackages_dPkg_ddependencyRoots = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__161, dtb__162) -> (if ((Base_dList.v_Base_dList_dmemName (v_Vuna_dCompiler_dPackages_dPkg_dpackageName dtb__161)) mc0) then ((v_Vuna_dCompiler_dPackages_dPkg_ddependencyRoots mc0) dtb__162) else (match ((v_Vuna_dCompiler_dPackages_dPkg_ddependencyRoots (Base_dList.C_Base_dList_dList_Cons ((v_Vuna_dCompiler_dPackages_dPkg_dpackageName dtb__161), mc0))) (v_Vuna_dCompiler_dPackages_dPkg_dpackageDependencies dtb__161)) with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__163; Base_dPair.f_Base_dPair_dPair_second = dtb__164 } -> (match ((v_Vuna_dCompiler_dPackages_dPkg_ddependencyRoots dtb__163) dtb__162) with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__165; Base_dPair.f_Base_dPair_dPair_second = dtb__166 } -> { Base_dPair.f_Base_dPair_dPair_first = dtb__165; Base_dPair.f_Base_dPair_dPair_second = ((Base_dList.v_Base_dList_dappend dtb__164) (Base_dList.C_Base_dList_dList_Cons ((v_Vuna_dCompiler_dPackages_dPkg_ddependencyRootOf dtb__161), dtb__166))) }
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))
  | Base_dList.C_Base_dList_dList_Nil -> { Base_dPair.f_Base_dPair_dPair_first = mc0; Base_dPair.f_Base_dPair_dPair_second = Base_dList.C_Base_dList_dList_Nil }
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dPackages_dPkg_dpackageRoots = (fun package -> ((fun selfName -> ((fun selfRoot -> (match ((v_Vuna_dCompiler_dPackages_dPkg_ddependencyRoots (Base_dList.C_Base_dList_dList_Cons (selfName, Base_dList.C_Base_dList_dList_Nil))) (package).f_Vuna_dCompiler_dPackages_dPkg_dPackage_packageDependencies) with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__167; Base_dPair.f_Base_dPair_dPair_second = dtb__168 } -> (Base_dList.C_Base_dList_dList_Cons (selfRoot, dtb__168))
  | _ -> failwith "DT: impossible branch"
)) { f_Vuna_dCompiler_dPackages_dPkg_dRoot_rootDir = ((v_Vuna_dCompiler_dPackages_dPkg_dpackageDir package) ^ "/lib"); f_Vuna_dCompiler_dPackages_dPkg_dRoot_rootName = selfName; f_Vuna_dCompiler_dPackages_dPkg_dRoot_rootExports = Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing; f_Vuna_dCompiler_dPackages_dPkg_dRoot_rootCapabilities = ((package).f_Vuna_dCompiler_dPackages_dPkg_dPackage_packageManifest).Vuna_dCompiler_dFrontend_dManifest.f_Vuna_dCompiler_dFrontend_dManifest_dManifest_manifestCapabilities; f_Vuna_dCompiler_dPackages_dPkg_dRoot_rootTrustUnsafe = ((package).f_Vuna_dCompiler_dPackages_dPkg_dPackage_packageManifest).Vuna_dCompiler_dFrontend_dManifest.f_Vuna_dCompiler_dFrontend_dManifest_dManifest_manifestTrustUnsafe; f_Vuna_dCompiler_dPackages_dPkg_dRoot_rootPrivileged = ((package).f_Vuna_dCompiler_dPackages_dPkg_dPackage_packageManifest).Vuna_dCompiler_dFrontend_dManifest.f_Vuna_dCompiler_dFrontend_dManifest_dManifest_manifestPrivileged; f_Vuna_dCompiler_dPackages_dPkg_dRoot_rootHostModules = ((package).f_Vuna_dCompiler_dPackages_dPkg_dPackage_packageManifest).Vuna_dCompiler_dFrontend_dManifest.f_Vuna_dCompiler_dFrontend_dManifest_dManifest_manifestHostModules })) (v_Vuna_dCompiler_dPackages_dPkg_dpackageName package)))

let v_Vuna_dCompiler_dPackages_dPkg_dpackageEntry = (fun package -> ((v_Vuna_dCompiler_dPackages_dPkg_dpackageDir package) ^ "/app/Main.vuna"))

let v_Vuna_dCompiler_dPackages_dPkg_dpackageContext = (fun package -> { f_Vuna_dCompiler_dPackages_dPkg_dPackageContext_contextDir = (v_Vuna_dCompiler_dPackages_dPkg_dpackageDir package); f_Vuna_dCompiler_dPackages_dPkg_dPackageContext_contextPackage = (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (package)); f_Vuna_dCompiler_dPackages_dPkg_dPackageContext_contextRoots = (v_Vuna_dCompiler_dPackages_dPkg_dpackageRoots package); f_Vuna_dCompiler_dPackages_dPkg_dPackageContext_contextPackageName = (v_Vuna_dCompiler_dPackages_dPkg_dpackageName package); f_Vuna_dCompiler_dPackages_dPkg_dPackageContext_contextCapabilities = ((package).f_Vuna_dCompiler_dPackages_dPkg_dPackage_packageManifest).Vuna_dCompiler_dFrontend_dManifest.f_Vuna_dCompiler_dFrontend_dManifest_dManifest_manifestCapabilities; f_Vuna_dCompiler_dPackages_dPkg_dPackageContext_contextTrustUnsafe = ((package).f_Vuna_dCompiler_dPackages_dPkg_dPackage_packageManifest).Vuna_dCompiler_dFrontend_dManifest.f_Vuna_dCompiler_dFrontend_dManifest_dManifest_manifestTrustUnsafe; f_Vuna_dCompiler_dPackages_dPkg_dPackageContext_contextPrivileged = ((package).f_Vuna_dCompiler_dPackages_dPkg_dPackage_packageManifest).Vuna_dCompiler_dFrontend_dManifest.f_Vuna_dCompiler_dFrontend_dManifest_dManifest_manifestPrivileged })

let rec v_Vuna_dCompiler_dPackages_dPkg_dfindManifestUpMaybe = (fun fuel dir -> (if (fuel <= 0) then ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing) else (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((fun dtio_0 -> Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> dtp_fileExists dtio_0)) (dir ^ "/vuna.toml"))) (fun exists -> (if exists then ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dir))) else (((v_Vuna_dCompiler_dPackages_dPkg_dfindManifestUpMaybeStep (fuel - 1)) dir) (Vuna_dCompiler_dFrontend_dManifest.v_Vuna_dCompiler_dFrontend_dManifest_dmanifestDir dir)))))))
and v_Vuna_dCompiler_dPackages_dPkg_dfindManifestUpMaybeStep = (fun fuel dir parent -> (if (fuel <= 0) then ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing) else (if (parent = dir) then ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing) else ((v_Vuna_dCompiler_dPackages_dPkg_dfindManifestUpMaybe (fuel - 1)) parent))))

let v_Vuna_dCompiler_dPackages_dPkg_dfindManifestDirMaybe = (fun startDir -> ((fun start -> ((v_Vuna_dCompiler_dPackages_dPkg_dfindManifestUpMaybe ((2 * (bi_strLength start)) + 4)) start)) (v_Vuna_dCompiler_dPackages_dPkg_dnormalizeDir startDir)))

let v_Vuna_dCompiler_dPackages_dPkg_dfindManifestDir = (fun startDir -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (v_Vuna_dCompiler_dPackages_dPkg_dfindManifestDirMaybe startDir)) (fun found -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (match found with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__169) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__169))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((Vuna_dCompiler_dDiagnostics_dPkg.v_Vuna_dCompiler_dDiagnostics_dPkg_dpkgNoLoc (Vuna_dCompiler_dDiagnostics_dPkg.C_Vuna_dCompiler_dDiagnostics_dPkg_dPkgErr_NoManifestUpward ((v_Vuna_dCompiler_dPackages_dPkg_dnormalizeDir startDir)))) (Base_dVec.C_Base_dVec_dVec_Cons ((v_Vuna_dCompiler_dPackages_dPkg_dnormalizeDir startDir), Base_dVec.C_Base_dVec_dVec_Nil)))
  | _ -> failwith "DT: impossible branch"
)))))

let v_Vuna_dCompiler_dPackages_dPkg_dhasManifest = (fun dir -> ((fun dtio_0 -> Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> dtp_fileExists dtio_0)) (dir ^ "/vuna.toml")))

let v_Vuna_dCompiler_dPackages_dPkg_dbaseCandidates = (fun exeDir -> (Base_dList.C_Base_dList_dList_Cons (((v_Vuna_dCompiler_dPackages_dPkg_djoinPath exeDir) "base"), (Base_dList.C_Base_dList_dList_Cons (((v_Vuna_dCompiler_dPackages_dPkg_djoinPath exeDir) "../base"), (Base_dList.C_Base_dList_dList_Cons (((v_Vuna_dCompiler_dPackages_dPkg_djoinPath exeDir) "../../base"), (Base_dList.C_Base_dList_dList_Cons (((v_Vuna_dCompiler_dPackages_dPkg_djoinPath exeDir) "../../../base"), Base_dList.C_Base_dList_dList_Nil)))))))))

let v_Vuna_dCompiler_dPackages_dPkg_dbaseNotFound = (fun tried -> ((Vuna_dCompiler_dDiagnostics_dPkg.v_Vuna_dCompiler_dDiagnostics_dPkg_dpkgNoLoc1 (Vuna_dCompiler_dDiagnostics_dPkg.C_Vuna_dCompiler_dDiagnostics_dPkg_dPkgErr_MissingBase ((v_Vuna_dCompiler_dPackages_dPkg_djoinPathsText tried)))) (v_Vuna_dCompiler_dPackages_dPkg_djoinPathsText tried)))

let rec v_Vuna_dCompiler_dPackages_dPkg_dfirstExistingBase = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__170, dtb__171) -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (v_Vuna_dCompiler_dPackages_dPkg_dhasManifest dtb__170)) (fun exists -> (if exists then ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__170))) else ((v_Vuna_dCompiler_dPackages_dPkg_dfirstExistingBase mc0) dtb__171))))
  | Base_dList.C_Base_dList_dList_Nil -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (v_Vuna_dCompiler_dPackages_dPkg_dbaseNotFound mc0))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dPackages_dPkg_dlocateBase = (fun _u -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((fun dtio_0 -> Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> dtp_getenv dtio_0)) "VUNA_BASE")) (fun env -> (if (env = "") then (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> (dtp_execPath ())))) (fun exe -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (v_Vuna_dCompiler_dPackages_dPkg_dabsolutePath exe)) (fun cwd -> ((fun candidates -> ((v_Vuna_dCompiler_dPackages_dPkg_dfirstExistingBase candidates) candidates)) (v_Vuna_dCompiler_dPackages_dPkg_dbaseCandidates (Vuna_dCompiler_dFrontend_dManifest.v_Vuna_dCompiler_dFrontend_dManifest_dmanifestDir cwd))))))) else (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (v_Vuna_dCompiler_dPackages_dPkg_dabsolutePath env)) (fun dir -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (v_Vuna_dCompiler_dPackages_dPkg_dhasManifest dir)) (fun exists -> (if exists then ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dir))) else ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (v_Vuna_dCompiler_dPackages_dPkg_dbaseNotFound (Base_dList.C_Base_dList_dList_Cons (dir, Base_dList.C_Base_dList_dList_Nil)))))))))))))

let v_Vuna_dCompiler_dPackages_dPkg_dbaseOnlyContext = (fun base -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (v_Vuna_dCompiler_dPackages_dPkg_dloadPackage base)) (fun packageR -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (match packageR with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__172) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__172))
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__173) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ f_Vuna_dCompiler_dPackages_dPkg_dPackageContext_contextDir = ""; f_Vuna_dCompiler_dPackages_dPkg_dPackageContext_contextPackage = Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing; f_Vuna_dCompiler_dPackages_dPkg_dPackageContext_contextRoots = (Base_dList.C_Base_dList_dList_Cons ((v_Vuna_dCompiler_dPackages_dPkg_ddependencyRootOf dtb__173), Base_dList.C_Base_dList_dList_Nil)); f_Vuna_dCompiler_dPackages_dPkg_dPackageContext_contextPackageName = ""; f_Vuna_dCompiler_dPackages_dPkg_dPackageContext_contextCapabilities = Base_dList.C_Base_dList_dList_Nil; f_Vuna_dCompiler_dPackages_dPkg_dPackageContext_contextTrustUnsafe = Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing; f_Vuna_dCompiler_dPackages_dPkg_dPackageContext_contextPrivileged = false }))
  | _ -> failwith "DT: impossible branch"
)))))

let v_Vuna_dCompiler_dPackages_dPkg_dcontextAt = (fun start -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (v_Vuna_dCompiler_dPackages_dPkg_dfindManifestDirMaybe start)) (fun found -> (match found with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__174) -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (v_Vuna_dCompiler_dPackages_dPkg_dloadPackage dtb__174)) (fun packageR -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (match packageR with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__175) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__175))
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__176) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ((v_Vuna_dCompiler_dPackages_dPkg_dpackageContext dtb__176)))
  | _ -> failwith "DT: impossible branch"
))))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (v_Vuna_dCompiler_dPackages_dPkg_dlocateBase 0)) (fun baseR -> (match baseR with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__177) -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__177)))
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__178) -> (v_Vuna_dCompiler_dPackages_dPkg_dbaseOnlyContext dtb__178)
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
))))

let v_Vuna_dCompiler_dPackages_dPkg_dcontextForFile = (fun path -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (v_Vuna_dCompiler_dPackages_dPkg_dabsolutePath path)) (fun absolute -> (v_Vuna_dCompiler_dPackages_dPkg_dcontextAt (Vuna_dCompiler_dFrontend_dManifest.v_Vuna_dCompiler_dFrontend_dManifest_dmanifestDir absolute)))))

let v_Vuna_dCompiler_dPackages_dPkg_dcontextForDir = (fun dir -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (v_Vuna_dCompiler_dPackages_dPkg_dabsolutePath dir)) (fun absolute -> (v_Vuna_dCompiler_dPackages_dPkg_dcontextAt absolute))))
