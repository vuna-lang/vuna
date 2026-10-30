open Vuna_runtime
open Vuna_dPair
open Vuna_dBool
open Vuna_dMonad
open Vuna_dMaybe
open Vuna_dList
open Vuna_dResult
open Vuna_dString
open Vuna_dBase
open Vuna_dToml
type   t_Vuna_dManifest_dManifest =
    C_Vuna_dManifest_dManifest of ((string) t_Vuna_dMaybe_dMaybe) * ((string) t_Vuna_dMaybe_dMaybe) * ((string) t_Vuna_dMaybe_dMaybe) * ((string) list) * (((string) list) t_Vuna_dMaybe_dMaybe) * (((string, string) t_Vuna_dPair_dPair) list) * (string)
let show_Vuna_dManifest_dManifest v =
  match v with
  | C_Vuna_dManifest_dManifest (f0, f1, f2, f3, f4, f5, f6) -> show_ctor "Manifest" [((show_Vuna_dMaybe_dMaybe show_vstring)) f0; ((show_Vuna_dMaybe_dMaybe show_vstring)) f1; ((show_Vuna_dMaybe_dMaybe show_vstring)) f2; ((fun v -> let rec go = function [] -> "Nil" | x :: xs -> "(Cons " ^ (show_vstring) x ^ " " ^ go xs ^ ")" in go v)) f3; ((show_Vuna_dMaybe_dMaybe (fun v -> let rec go = function [] -> "Nil" | x :: xs -> "(Cons " ^ (show_vstring) x ^ " " ^ go xs ^ ")" in go v))) f4; ((fun v -> let rec go = function [] -> "Nil" | x :: xs -> "(Cons " ^ ((show_Vuna_dPair_dPair show_vstring show_vstring)) x ^ " " ^ go xs ^ ")" in go v)) f5; (show_vstring) f6]
let v_Vuna_dManifest_dmanifestName = fun a0 -> match a0 with
  | (C_Vuna_dManifest_dManifest (name, version, edition, members, exports, deps, path)) -> name
  | _ -> vuna_fail "./lib/Vuna/Manifest.vuna" 19 1 ("no matching clause for Vuna.Manifest.manifestName")

let v_Vuna_dManifest_dmanifestVersion = fun a0 -> match a0 with
  | (C_Vuna_dManifest_dManifest (name, version, edition, members, exports, deps, path)) -> version
  | _ -> vuna_fail "./lib/Vuna/Manifest.vuna" 22 1 ("no matching clause for Vuna.Manifest.manifestVersion")

let v_Vuna_dManifest_dmanifestEdition = fun a0 -> match a0 with
  | (C_Vuna_dManifest_dManifest (name, version, edition, members, exports, deps, path)) -> edition
  | _ -> vuna_fail "./lib/Vuna/Manifest.vuna" 25 1 ("no matching clause for Vuna.Manifest.manifestEdition")

let v_Vuna_dManifest_dmanifestMembers = fun a0 -> match a0 with
  | (C_Vuna_dManifest_dManifest (name, version, edition, members, exports, deps, path)) -> members
  | _ -> vuna_fail "./lib/Vuna/Manifest.vuna" 28 1 ("no matching clause for Vuna.Manifest.manifestMembers")

let v_Vuna_dManifest_dmanifestExports = fun a0 -> match a0 with
  | (C_Vuna_dManifest_dManifest (name, version, edition, members, exports, deps, path)) -> exports
  | _ -> vuna_fail "./lib/Vuna/Manifest.vuna" 31 1 ("no matching clause for Vuna.Manifest.manifestExports")

let v_Vuna_dManifest_dmanifestDependencies = fun a0 -> match a0 with
  | (C_Vuna_dManifest_dManifest (name, version, edition, members, exports, deps, path)) -> deps
  | _ -> vuna_fail "./lib/Vuna/Manifest.vuna" 34 1 ("no matching clause for Vuna.Manifest.manifestDependencies")

let v_Vuna_dManifest_dmanifestPath = fun a0 -> match a0 with
  | (C_Vuna_dManifest_dManifest (name, version, edition, members, exports, deps, path)) -> path
  | _ -> vuna_fail "./lib/Vuna/Manifest.vuna" 37 1 ("no matching clause for Vuna.Manifest.manifestPath")

let v_Vuna_dManifest_disDigitChar = fun c -> (if (v_vuna_uge_uint c 48) then (v_vuna_ule_uint c 57) else false)

let v_Vuna_dManifest_disUpperAlphaChar = fun c -> (if (v_vuna_uge_uint c 65) then (v_vuna_ule_uint c 90) else false)

let v_Vuna_dManifest_disLowerAlphaChar = fun c -> (if (v_vuna_uge_uint c 97) then (v_vuna_ule_uint c 122) else false)

let v_Vuna_dManifest_datLine = fun path line msg -> if v_vuna_ueq_ustr path "" then (let vuna_cat0' = ("line ") in (let vuna_cat1' = (bi_str_from_int line) in (let vuna_cat2' = (": ") in (let vuna_cat3' = (msg) in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'])))) else (let vuna_cat0' = (path) in (let vuna_cat1' = (":") in (let vuna_cat2' = (bi_str_from_int line) in (let vuna_cat3' = (": ") in (let vuna_cat4' = (msg) in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'; vuna_cat4'])))))

let v_Vuna_dManifest_dmanifestErr = fun path msg -> if v_vuna_ueq_ustr path "" then msg else (let vuna_cat0' = (path) in (let vuna_cat1' = (": ") in (let vuna_cat2' = (msg) in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'])))

let rec v_Vuna_dManifest_dsameSection = fun a0 a1 -> match (a0, a1) with
  | ([], []) -> true
  | ((x) :: (xs), (y) :: (ys)) -> if v_vuna_ueq_ugeneric x y then v_Vuna_dManifest_dsameSection xs ys else false
  | (_, _) -> false
  | _ -> vuna_fail "./lib/Vuna/Manifest.vuna" 53 1 ("no matching clause for Vuna.Manifest.sameSection")

let v_Vuna_dManifest_dfieldLoc = fun path section key entries -> (match v_Vuna_dToml_dlookupEntryLine section key entries with
  | C_Vuna_dMaybe_dJust (line) -> if v_vuna_ueq_ustr path "" then (let vuna_cat0' = ("line ") in (let vuna_cat1' = (bi_str_from_int line) in (let vuna_cat2' = (": ") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2']))) else (let vuna_cat0' = (path) in (let vuna_cat1' = (":") in (let vuna_cat2' = (bi_str_from_int line) in (let vuna_cat3' = (": ") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3']))))
  | C_Vuna_dMaybe_dNothing -> if v_vuna_ueq_ustr path "" then "" else ((path) ^ (": "))
  | _ -> vuna_fail "./lib/Vuna/Manifest.vuna" 60 3 ("case pattern match failure"))

let v_Vuna_dManifest_dstringField = fun path section key entries -> (match v_Vuna_dToml_dlookupEntry section key entries with
  | C_Vuna_dMaybe_dNothing -> C_Vuna_dResult_dOk (C_Vuna_dMaybe_dNothing)
  | C_Vuna_dMaybe_dJust (C_Vuna_dToml_dTStr (s)) -> C_Vuna_dResult_dOk (C_Vuna_dMaybe_dJust (s))
  | C_Vuna_dMaybe_dJust (value) -> C_Vuna_dResult_dErr ((let vuna_cat0' = (v_Vuna_dManifest_dfieldLoc path section key entries) in (let vuna_cat1' = ("expected a string for \"") in (let vuna_cat2' = (key) in (let vuna_cat3' = ("\"") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'])))))
  | _ -> vuna_fail "./lib/Vuna/Manifest.vuna" 67 3 ("case pattern match failure"))

let v_Vuna_dManifest_dstringListField = fun path section key entries -> (match v_Vuna_dToml_dlookupEntry section key entries with
  | C_Vuna_dMaybe_dNothing -> C_Vuna_dResult_dOk (C_Vuna_dMaybe_dNothing)
  | C_Vuna_dMaybe_dJust (C_Vuna_dToml_dTList (xs)) -> C_Vuna_dResult_dOk (C_Vuna_dMaybe_dJust (xs))
  | C_Vuna_dMaybe_dJust (value) -> C_Vuna_dResult_dErr ((let vuna_cat0' = (v_Vuna_dManifest_dfieldLoc path section key entries) in (let vuna_cat1' = ("expected an array of strings for \"") in (let vuna_cat2' = (key) in (let vuna_cat3' = ("\"") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'])))))
  | _ -> vuna_fail "./lib/Vuna/Manifest.vuna" 74 3 ("case pattern match failure"))

let v_Vuna_dManifest_dorEmptyList = fun maybe -> (match maybe with
  | C_Vuna_dMaybe_dNothing -> []
  | C_Vuna_dMaybe_dJust (xs) -> xs
  | _ -> vuna_fail "./lib/Vuna/Manifest.vuna" 81 3 ("case pattern match failure"))

let v_Vuna_dManifest_dcheckOneEntry = fun a0 a1 -> match (a0, a1) with
  | (path, C_Vuna_dToml_dTomlEntry (section, key, value, line)) -> if v_Vuna_dManifest_dsameSection section [] then C_Vuna_dResult_dErr (v_Vuna_dManifest_datLine path line ((let vuna_cat0' = ("unexpected top-level key \"") in (let vuna_cat1' = (key) in (let vuna_cat2' = ("\"") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2']))))) else if v_Vuna_dManifest_dsameSection section (("package") :: ([])) then if (if ((if (v_vuna_ueq_ustr key "name") then true else (v_vuna_ueq_ustr key "version"))) then true else (v_vuna_ueq_ustr key "edition")) then C_Vuna_dResult_dOk (0) else C_Vuna_dResult_dErr (v_Vuna_dManifest_datLine path line ((let vuna_cat0' = ("unknown key \"") in (let vuna_cat1' = (key) in (let vuna_cat2' = ("\" in [package]") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2']))))) else if v_Vuna_dManifest_dsameSection section (("workspace") :: ([])) then if v_vuna_ueq_ustr key "members" then C_Vuna_dResult_dOk (0) else C_Vuna_dResult_dErr (v_Vuna_dManifest_datLine path line ((let vuna_cat0' = ("unknown key \"") in (let vuna_cat1' = (key) in (let vuna_cat2' = ("\" in [workspace]") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2']))))) else if v_Vuna_dManifest_dsameSection section (("export") :: ([])) then if v_vuna_ueq_ustr key "modules" then C_Vuna_dResult_dOk (0) else C_Vuna_dResult_dErr (v_Vuna_dManifest_datLine path line ((let vuna_cat0' = ("unknown key \"") in (let vuna_cat1' = (key) in (let vuna_cat2' = ("\" in [export]") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2']))))) else if v_Vuna_dManifest_dsameSection section (("dependencies") :: ([])) then C_Vuna_dResult_dOk (0) else C_Vuna_dResult_dErr (v_Vuna_dManifest_datLine path line ((let vuna_cat0' = ("unknown section [") in (let vuna_cat1' = (v_Vuna_dBase_djoinDots section) in (let vuna_cat2' = ("]") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'])))))
  | _ -> vuna_fail "./lib/Vuna/Manifest.vuna" 86 1 ("no matching clause for Vuna.Manifest.checkOneEntry")

let rec v_Vuna_dManifest_dcheckEntries = fun path entries -> (match entries with
  | [] -> C_Vuna_dResult_dOk (0)
  | (entry) :: (rest) -> (match v_Vuna_dManifest_dcheckOneEntry path entry with
  | C_Vuna_dResult_dErr (e) -> C_Vuna_dResult_dErr (e)
  | C_Vuna_dResult_dOk (ok) -> v_Vuna_dManifest_dcheckEntries path rest
  | _ -> vuna_fail "./lib/Vuna/Manifest.vuna" 105 7 ("case pattern match failure"))
  | _ -> vuna_fail "./lib/Vuna/Manifest.vuna" 102 3 ("case pattern match failure"))

let rec v_Vuna_dManifest_dcollectDependenciesAcc = fun path entries acc -> (match entries with
  | [] -> C_Vuna_dResult_dOk (v_Vuna_dList_dreverse acc)
  | (C_Vuna_dToml_dTomlEntry (section, key, value, line)) :: (rest) -> if v_Vuna_dManifest_dsameSection section (("dependencies") :: ([])) then (match value with
  | C_Vuna_dToml_dTStr (rel) -> v_Vuna_dManifest_dcollectDependenciesAcc path rest ((C_Vuna_dPair_dPair (key, rel)) :: (acc))
  | _ -> C_Vuna_dResult_dErr (v_Vuna_dManifest_datLine path line ((let vuna_cat0' = ("dependency \"") in (let vuna_cat1' = (key) in (let vuna_cat2' = ("\" must have a string relative path") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'])))))
  | _ -> vuna_fail "./lib/Vuna/Manifest.vuna" 116 9 ("case pattern match failure")) else v_Vuna_dManifest_dcollectDependenciesAcc path rest acc
  | _ -> vuna_fail "./lib/Vuna/Manifest.vuna" 112 3 ("case pattern match failure"))

let v_Vuna_dManifest_dcollectDependencies = fun path entries -> v_Vuna_dManifest_dcollectDependenciesAcc path entries []

let v_Vuna_dManifest_dbuildManifest = fun path entries -> v_Vuna_dResult_dandThen (v_Vuna_dManifest_dcheckEntries path entries) (fun checked -> v_Vuna_dResult_dandThen (v_Vuna_dManifest_dstringField path (("package") :: ([])) "name" entries) (fun name -> v_Vuna_dResult_dandThen (v_Vuna_dManifest_dstringField path (("package") :: ([])) "version" entries) (fun version -> v_Vuna_dResult_dandThen (v_Vuna_dManifest_dstringField path (("package") :: ([])) "edition" entries) (fun edition -> v_Vuna_dResult_dandThen (v_Vuna_dManifest_dstringListField path (("workspace") :: ([])) "members" entries) (fun members -> v_Vuna_dResult_dandThen (v_Vuna_dManifest_dstringListField path (("export") :: ([])) "modules" entries) (fun exports -> v_Vuna_dResult_dandThen (v_Vuna_dManifest_dcollectDependencies path entries) (fun deps -> C_Vuna_dResult_dOk (C_Vuna_dManifest_dManifest (name, version, edition, v_Vuna_dManifest_dorEmptyList members, exports, deps, path)))))))))

let v_Vuna_dManifest_dparseManifest = fun path contents -> v_Vuna_dResult_dandThen (v_Vuna_dToml_dparseTomlAt path contents) (fun entries -> v_Vuna_dManifest_dbuildManifest path entries)

let rec v_Vuna_dManifest_dvalidPackageChars = fun a0 -> match a0 with
  | ([]) -> true
  | ((c) :: (rest)) -> if (if ((if (v_Vuna_dManifest_disLowerAlphaChar c) then true else (v_Vuna_dManifest_disDigitChar c))) then true else (v_vuna_ueq_uint c 45)) then v_Vuna_dManifest_dvalidPackageChars rest else false
  | _ -> vuna_fail "./lib/Vuna/Manifest.vuna" 139 1 ("no matching clause for Vuna.Manifest.validPackageChars")

let v_Vuna_dManifest_dvalidPackageName = fun name -> v_Vuna_dManifest_dvalidPackageChars (bi_str_unpack name)

let rec v_Vuna_dManifest_dvalidModuleTail = fun a0 -> match a0 with
  | ([]) -> true
  | ((c) :: (rest)) -> if (if ((if ((if (v_Vuna_dManifest_disUpperAlphaChar c) then true else (v_Vuna_dManifest_disLowerAlphaChar c))) then true else (v_Vuna_dManifest_disDigitChar c))) then true else (v_vuna_ueq_uint c 95)) then v_Vuna_dManifest_dvalidModuleTail rest else false
  | _ -> vuna_fail "./lib/Vuna/Manifest.vuna" 157 1 ("no matching clause for Vuna.Manifest.validModuleTail")

let v_Vuna_dManifest_dvalidModuleSegmentChars = fun a0 -> match a0 with
  | ([]) -> false
  | ((c) :: (rest)) -> if v_Vuna_dManifest_disUpperAlphaChar c then v_Vuna_dManifest_dvalidModuleTail rest else false
  | _ -> vuna_fail "./lib/Vuna/Manifest.vuna" 153 1 ("no matching clause for Vuna.Manifest.validModuleSegmentChars")

let v_Vuna_dManifest_dvalidModuleSegment = fun seg -> v_Vuna_dManifest_dvalidModuleSegmentChars (bi_str_unpack seg)

let rec v_Vuna_dManifest_dvalidModuleSegments = fun a0 -> match a0 with
  | ([]) -> true
  | ((seg) :: (rest)) -> if v_Vuna_dManifest_dvalidModuleSegment seg then v_Vuna_dManifest_dvalidModuleSegments rest else false
  | _ -> vuna_fail "./lib/Vuna/Manifest.vuna" 146 1 ("no matching clause for Vuna.Manifest.validModuleSegments")

let v_Vuna_dManifest_dvalidModuleName = fun name -> v_Vuna_dManifest_dvalidModuleSegments (v_Vuna_dBase_dsplitOnDot name)

let v_Vuna_dManifest_dvalidateName = fun path name -> (match name with
  | C_Vuna_dMaybe_dNothing -> C_Vuna_dResult_dErr (v_Vuna_dManifest_dmanifestErr path "missing [package] name")
  | C_Vuna_dMaybe_dJust (n) -> if v_vuna_ueq_ustr n "" then C_Vuna_dResult_dErr (v_Vuna_dManifest_dmanifestErr path "package name must not be empty") else if v_Vuna_dManifest_dvalidPackageName n then C_Vuna_dResult_dOk (0) else C_Vuna_dResult_dErr (v_Vuna_dManifest_dmanifestErr path ((let vuna_cat0' = ("invalid package name \"") in (let vuna_cat1' = (n) in (let vuna_cat2' = ("\" (allowed characters: a-z, 0-9, '-')") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'])))))
  | _ -> vuna_fail "./lib/Vuna/Manifest.vuna" 165 3 ("case pattern match failure"))

let v_Vuna_dManifest_dvalidateVersion = fun path version -> (match version with
  | C_Vuna_dMaybe_dNothing -> C_Vuna_dResult_dErr (v_Vuna_dManifest_dmanifestErr path "missing [package] version")
  | C_Vuna_dMaybe_dJust (v) -> if v_vuna_ueq_ustr v "" then C_Vuna_dResult_dErr (v_Vuna_dManifest_dmanifestErr path "package version must not be empty") else C_Vuna_dResult_dOk (0)
  | _ -> vuna_fail "./lib/Vuna/Manifest.vuna" 174 3 ("case pattern match failure"))

let v_Vuna_dManifest_dvalidateEdition = fun path edition -> (match edition with
  | C_Vuna_dMaybe_dNothing -> C_Vuna_dResult_dOk (0)
  | C_Vuna_dMaybe_dJust (e) -> if v_vuna_ueq_ustr e "" then C_Vuna_dResult_dErr (v_Vuna_dManifest_dmanifestErr path "package edition must not be empty") else C_Vuna_dResult_dOk (0)
  | _ -> vuna_fail "./lib/Vuna/Manifest.vuna" 180 3 ("case pattern match failure"))

let rec v_Vuna_dManifest_dvalidateMembers = fun path members -> (match members with
  | [] -> C_Vuna_dResult_dOk (0)
  | (m) :: (rest) -> if v_vuna_ueq_ustr m "" then C_Vuna_dResult_dErr (v_Vuna_dManifest_dmanifestErr path "workspace member must not be empty") else v_Vuna_dManifest_dvalidateMembers path rest
  | _ -> vuna_fail "./lib/Vuna/Manifest.vuna" 185 3 ("case pattern match failure"))

let rec v_Vuna_dManifest_dvalidateModules = fun path modules -> (match modules with
  | [] -> C_Vuna_dResult_dOk (0)
  | (m) :: (rest) -> if v_Vuna_dManifest_dvalidModuleName m then v_Vuna_dManifest_dvalidateModules path rest else C_Vuna_dResult_dErr (v_Vuna_dManifest_dmanifestErr path ((let vuna_cat0' = ("invalid export module \"") in (let vuna_cat1' = (m) in (let vuna_cat2' = ("\" (segments must match [A-Z][A-Za-z0-9_]*)") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'])))))
  | _ -> vuna_fail "./lib/Vuna/Manifest.vuna" 192 3 ("case pattern match failure"))

let v_Vuna_dManifest_dvalidateExports = fun path exports -> (match exports with
  | C_Vuna_dMaybe_dNothing -> C_Vuna_dResult_dOk (0)
  | C_Vuna_dMaybe_dJust (modules) -> v_Vuna_dManifest_dvalidateModules path modules
  | _ -> vuna_fail "./lib/Vuna/Manifest.vuna" 201 3 ("case pattern match failure"))

let rec v_Vuna_dManifest_dvalidateDepsSeen = fun path seen deps -> (match deps with
  | [] -> C_Vuna_dResult_dOk (0)
  | (C_Vuna_dPair_dPair (name, rel)) :: (rest) -> if v_vuna_ueq_ustr name "" then C_Vuna_dResult_dErr (v_Vuna_dManifest_dmanifestErr path "dependency name must not be empty") else if v_vuna_ueq_ustr rel "" then C_Vuna_dResult_dErr (v_Vuna_dManifest_dmanifestErr path ((let vuna_cat0' = ("dependency \"") in (let vuna_cat1' = (name) in (let vuna_cat2' = ("\" path must not be empty") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2']))))) else if v_Vuna_dList_dmemName name seen then C_Vuna_dResult_dErr (v_Vuna_dManifest_dmanifestErr path ((let vuna_cat0' = ("duplicate dependency \"") in (let vuna_cat1' = (name) in (let vuna_cat2' = ("\"") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2']))))) else v_Vuna_dManifest_dvalidateDepsSeen path ((name) :: (seen)) rest
  | _ -> vuna_fail "./lib/Vuna/Manifest.vuna" 208 3 ("case pattern match failure"))

let v_Vuna_dManifest_dvalidateDependencies = fun path deps -> v_Vuna_dManifest_dvalidateDepsSeen path [] deps

let v_Vuna_dManifest_dvalidateManifest = fun a0 -> match a0 with
  | (C_Vuna_dManifest_dManifest (name, version, edition, members, exports, deps, path)) -> v_Vuna_dResult_dandThen (v_Vuna_dManifest_dvalidateName path name) (fun okName -> v_Vuna_dResult_dandThen (v_Vuna_dManifest_dvalidateVersion path version) (fun okVersion -> v_Vuna_dResult_dandThen (v_Vuna_dManifest_dvalidateEdition path edition) (fun okEdition -> v_Vuna_dResult_dandThen (v_Vuna_dManifest_dvalidateMembers path members) (fun okMembers -> v_Vuna_dResult_dandThen (v_Vuna_dManifest_dvalidateExports path exports) (fun okExports -> v_Vuna_dResult_dandThen (v_Vuna_dManifest_dvalidateDependencies path deps) (fun okDeps -> C_Vuna_dResult_dOk (C_Vuna_dManifest_dManifest (name, version, edition, members, exports, deps, path))))))))
  | _ -> vuna_fail "./lib/Vuna/Manifest.vuna" 217 1 ("no matching clause for Vuna.Manifest.validateManifest")

let v_Vuna_dManifest_ddirResult = fun dir -> if v_vuna_ueq_ustr dir "" then "/" else dir

let rec v_Vuna_dManifest_ddirFromRev = fun a0 -> match a0 with
  | ([]) -> "."
  | ((c) :: (rest)) -> if v_vuna_ueq_uint c 47 then v_Vuna_dManifest_ddirResult (bi_str_pack (v_Vuna_dList_dreverse rest)) else v_Vuna_dManifest_ddirFromRev rest
  | _ -> vuna_fail "./lib/Vuna/Manifest.vuna" 230 1 ("no matching clause for Vuna.Manifest.dirFromRev")

let v_Vuna_dManifest_dmanifestDir = fun path -> v_Vuna_dManifest_ddirFromRev (v_Vuna_dList_dreverse (bi_str_unpack path))

let v_Vuna_dManifest_dresolveManifestPath = fun manifest rel -> (let dir = v_Vuna_dManifest_dmanifestDir (v_Vuna_dManifest_dmanifestPath manifest) in if v_Vuna_dString_dstartsWith "/" rel then rel else if v_vuna_ueq_ustr dir "." then rel else (let vuna_cat0' = (dir) in (let vuna_cat1' = ("/") in (let vuna_cat2' = (rel) in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2']))))

let v_vuna_ueq_uVuna_uManifest_uManifest = fun x y -> (match x with
  | C_Vuna_dManifest_dManifest (v0, v1, v2, v3, v4, v5, v6) -> (match y with
  | C_Vuna_dManifest_dManifest (w0, w1, w2, w3, w4, w5, w6) -> (if ((if ((if ((if ((if ((if (v_vuna_ueq_uVuna_uMaybe_uMaybe v0 w0) then (v_vuna_ueq_uVuna_uMaybe_uMaybe v1 w1) else false)) then (v_vuna_ueq_uVuna_uMaybe_uMaybe v2 w2) else false)) then (v_vuna_ueq_uVuna_uList_uList v3 w3) else false)) then (v_vuna_ueq_uVuna_uMaybe_uMaybe v4 w4) else false)) then (v_vuna_ueq_uVuna_uList_uList v5 w5) else false)) then (v_vuna_ueq_ustr v6 w6) else false)
  | _ -> v_vuna_ueq_uint 0 1
  | _ -> vuna_fail "<generated>" 377 50 ("case pattern match failure"))
  | _ -> v_vuna_ueq_uint 0 1
  | _ -> vuna_fail "<generated>" 376 38 ("case pattern match failure"))

let v_vuna_uneq_uVuna_uManifest_uManifest = fun x y -> if v_vuna_ueq_uVuna_uManifest_uManifest x y then v_vuna_ueq_uint 0 1 else v_vuna_ueq_uint 0 0
