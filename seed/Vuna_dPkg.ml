open Vuna_runtime
open Vuna_dPair
open Vuna_dBool
open Vuna_dMonad
open Vuna_dMaybe
open Vuna_dList
open Vuna_dIO
open Vuna_dResult
open Vuna_dString
open Vuna_dBase
open Vuna_dToml
open Vuna_dManifest
type   t_Vuna_dPkg_dRoot =
    C_Vuna_dPkg_dRoot of (string) * (string) * (((string) list) t_Vuna_dMaybe_dMaybe)
and   t_Vuna_dPkg_dPackage =
    C_Vuna_dPkg_dPackage of (t_Vuna_dManifest_dManifest) * ((t_Vuna_dPkg_dPackage) list) * (string)
let rec show_Vuna_dPkg_dRoot v =
  match v with
  | C_Vuna_dPkg_dRoot (f0, f1, f2) -> show_ctor "Root" [(show_vstring) f0; (show_vstring) f1; ((show_Vuna_dMaybe_dMaybe (fun v -> let rec go = function [] -> "Nil" | x :: xs -> "(Cons " ^ (show_vstring) x ^ " " ^ go xs ^ ")" in go v))) f2]
and show_Vuna_dPkg_dPackage v =
  match v with
  | C_Vuna_dPkg_dPackage (f0, f1, f2) -> show_ctor "Package" [(show_Vuna_dManifest_dManifest) f0; ((fun v -> let rec go = function [] -> "Nil" | x :: xs -> "(Cons " ^ (show_Vuna_dPkg_dPackage) x ^ " " ^ go xs ^ ")" in go v)) f1; (show_vstring) f2]
let v_Vuna_dPkg_drootDir = fun a0 -> match a0 with
  | (C_Vuna_dPkg_dRoot (dir, name, exports)) -> dir
  | _ -> vuna_fail "compiler/lib/Vuna/Pkg.vuna" 24 1 ("no matching clause for Vuna.Pkg.rootDir")

let v_Vuna_dPkg_drootName = fun a0 -> match a0 with
  | (C_Vuna_dPkg_dRoot (dir, name, exports)) -> name
  | _ -> vuna_fail "compiler/lib/Vuna/Pkg.vuna" 27 1 ("no matching clause for Vuna.Pkg.rootName")

let v_Vuna_dPkg_drootPackage = fun root -> v_Vuna_dPkg_drootName root

let v_Vuna_dPkg_drootExports = fun a0 -> match a0 with
  | (C_Vuna_dPkg_dRoot (dir, name, exports)) -> exports
  | _ -> vuna_fail "compiler/lib/Vuna/Pkg.vuna" 34 1 ("no matching clause for Vuna.Pkg.rootExports")

let v_Vuna_dPkg_dpackageManifest = fun a0 -> match a0 with
  | (C_Vuna_dPkg_dPackage (manifest, dependencies, dir)) -> manifest
  | _ -> vuna_fail "compiler/lib/Vuna/Pkg.vuna" 41 1 ("no matching clause for Vuna.Pkg.packageManifest")

let v_Vuna_dPkg_dpackageDependencies = fun a0 -> match a0 with
  | (C_Vuna_dPkg_dPackage (manifest, dependencies, dir)) -> dependencies
  | _ -> vuna_fail "compiler/lib/Vuna/Pkg.vuna" 44 1 ("no matching clause for Vuna.Pkg.packageDependencies")

let v_Vuna_dPkg_dpackageDir = fun a0 -> match a0 with
  | (C_Vuna_dPkg_dPackage (manifest, dependencies, dir)) -> dir
  | _ -> vuna_fail "compiler/lib/Vuna/Pkg.vuna" 47 1 ("no matching clause for Vuna.Pkg.packageDir")

let v_Vuna_dPkg_dpackageName = fun package -> (match v_Vuna_dManifest_dmanifestName (v_Vuna_dPkg_dpackageManifest package) with
  | C_Vuna_dMaybe_dNothing -> ""
  | C_Vuna_dMaybe_dJust (name) -> name
  | _ -> vuna_fail "compiler/lib/Vuna/Pkg.vuna" 51 3 ("case pattern match failure"))

let v_Vuna_dPkg_dpackageExports = fun package -> v_Vuna_dManifest_dmanifestExports (v_Vuna_dPkg_dpackageManifest package)

let rec v_Vuna_dPkg_dsplitSlashChars = fun chars acc seg -> (match chars with
  | [] -> v_Vuna_dList_dreverse ((bi_str_pack (v_Vuna_dList_dreverse seg)) :: (acc))
  | (c) :: (rest) -> if v_vuna_ueq_uint c 47 then v_Vuna_dPkg_dsplitSlashChars rest ((bi_str_pack (v_Vuna_dList_dreverse seg)) :: (acc)) [] else v_Vuna_dPkg_dsplitSlashChars rest acc ((c) :: (seg))
  | _ -> vuna_fail "compiler/lib/Vuna/Pkg.vuna" 61 3 ("case pattern match failure"))

let v_Vuna_dPkg_dsplitOnSlash = fun path -> v_Vuna_dPkg_dsplitSlashChars (bi_str_unpack path) [] []

let rec v_Vuna_dPkg_dnormalizeParent = fun absolute acc rest -> (match acc with
  | [] -> if absolute then v_Vuna_dPkg_dnormalizeAcc absolute rest [] else v_Vuna_dPkg_dnormalizeAcc absolute rest (("..") :: ([]))
  | (prev) :: (prevRest) -> if v_vuna_ueq_ustr prev ".." then v_Vuna_dPkg_dnormalizeAcc absolute rest (("..") :: (acc)) else v_Vuna_dPkg_dnormalizeAcc absolute rest prevRest
  | _ -> vuna_fail "compiler/lib/Vuna/Pkg.vuna" 72 3 ("case pattern match failure"))
and v_Vuna_dPkg_dnormalizeAcc = fun absolute segments acc -> (match segments with
  | [] -> acc
  | (seg) :: (rest) -> (match seg with
  | "" -> v_Vuna_dPkg_dnormalizeAcc absolute rest acc
  | "." -> v_Vuna_dPkg_dnormalizeAcc absolute rest acc
  | ".." -> v_Vuna_dPkg_dnormalizeParent absolute acc rest
  | _ -> v_Vuna_dPkg_dnormalizeAcc absolute rest ((seg) :: (acc))
  | _ -> vuna_fail "compiler/lib/Vuna/Pkg.vuna" 84 7 ("case pattern match failure"))
  | _ -> vuna_fail "compiler/lib/Vuna/Pkg.vuna" 81 3 ("case pattern match failure"))

let v_Vuna_dPkg_dnormalizeDir = fun path -> if v_Vuna_dString_dstartsWith "/" path then (match v_Vuna_dPkg_dnormalizeAcc true (v_Vuna_dPkg_dsplitOnSlash path) [] with
  | [] -> "/"
  | segments -> (("/") ^ (v_Vuna_dBase_djoinSlashes (v_Vuna_dList_dreverse segments)))
  | _ -> vuna_fail "compiler/lib/Vuna/Pkg.vuna" 95 5 ("case pattern match failure")) else (match v_Vuna_dPkg_dnormalizeAcc false (v_Vuna_dPkg_dsplitOnSlash path) [] with
  | [] -> "."
  | segments -> v_Vuna_dBase_djoinSlashes (v_Vuna_dList_dreverse segments)
  | _ -> vuna_fail "compiler/lib/Vuna/Pkg.vuna" 99 5 ("case pattern match failure"))

let v_Vuna_dPkg_drawRoot = fun dir -> C_Vuna_dPkg_dRoot (v_Vuna_dPkg_dnormalizeDir dir, "", C_Vuna_dMaybe_dNothing)

let v_Vuna_dPkg_djoinPath = fun base rel -> if v_Vuna_dString_dstartsWith "/" rel then v_Vuna_dPkg_dnormalizeDir rel else v_Vuna_dPkg_dnormalizeDir ((let vuna_cat0' = (base) in (let vuna_cat1' = ("/") in (let vuna_cat2' = (rel) in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2']))))

let v_Vuna_dPkg_dloadManifestAt = fun path -> if bi_file_exists path then (match v_Vuna_dManifest_dparseManifest path (bi_read_file path) with
  | C_Vuna_dResult_dErr (e) -> C_Vuna_dResult_dErr ((("pkg: ") ^ (e)))
  | C_Vuna_dResult_dOk (manifest) -> (match v_Vuna_dManifest_dvalidateManifest manifest with
  | C_Vuna_dResult_dErr (e) -> C_Vuna_dResult_dErr ((("pkg: ") ^ (e)))
  | C_Vuna_dResult_dOk (validated) -> C_Vuna_dResult_dOk (validated)
  | _ -> vuna_fail "compiler/lib/Vuna/Pkg.vuna" 118 9 ("case pattern match failure"))
  | _ -> vuna_fail "compiler/lib/Vuna/Pkg.vuna" 115 5 ("case pattern match failure")) else C_Vuna_dResult_dErr ((("pkg: missing vuna.toml in ") ^ (v_Vuna_dPkg_dnormalizeDir (v_Vuna_dManifest_dmanifestDir path))))

let v_Vuna_dPkg_dmanifestNameString = fun manifest -> (match v_Vuna_dManifest_dmanifestName manifest with
  | C_Vuna_dMaybe_dNothing -> ""
  | C_Vuna_dMaybe_dJust (name) -> name
  | _ -> vuna_fail "compiler/lib/Vuna/Pkg.vuna" 124 3 ("case pattern match failure"))

let rec v_Vuna_dPkg_dmemStackDir = fun dir stack -> (match stack with
  | [] -> false
  | (pair) :: (rest) -> if v_vuna_ueq_ugeneric (v_Vuna_dPair_dfirstOf pair) dir then true else v_Vuna_dPkg_dmemStackDir dir rest
  | _ -> vuna_fail "compiler/lib/Vuna/Pkg.vuna" 132 3 ("case pattern match failure"))

let rec v_Vuna_dPkg_dcyclePrefix = fun dir stack -> (match stack with
  | [] -> C_Vuna_dMaybe_dNothing
  | (pair) :: (rest) -> if v_vuna_ueq_ugeneric (v_Vuna_dPair_dfirstOf pair) dir then C_Vuna_dMaybe_dJust ((pair) :: ([])) else (match v_Vuna_dPkg_dcyclePrefix dir rest with
  | C_Vuna_dMaybe_dNothing -> C_Vuna_dMaybe_dNothing
  | C_Vuna_dMaybe_dJust (prefix) -> C_Vuna_dMaybe_dJust ((pair) :: (prefix))
  | _ -> vuna_fail "compiler/lib/Vuna/Pkg.vuna" 142 9 ("case pattern match failure"))
  | _ -> vuna_fail "compiler/lib/Vuna/Pkg.vuna" 137 3 ("case pattern match failure"))

let v_Vuna_dPkg_dcycleMessage = fun dir depName stack -> (match depName with
  | C_Vuna_dMaybe_dNothing -> (("pkg: dependency cycle at ") ^ (dir))
  | C_Vuna_dMaybe_dJust (dep) -> (match v_Vuna_dPkg_dcyclePrefix dir stack with
  | C_Vuna_dMaybe_dNothing -> (("pkg: dependency cycle at ") ^ (dir))
  | C_Vuna_dMaybe_dJust (prefix) -> (("pkg: dependency cycle: ") ^ (v_Vuna_dBase_djoinArrows (v_Vuna_dList_dappend (v_Vuna_dList_dmap v_Vuna_dPair_dsecondOf (v_Vuna_dList_dreverse prefix)) ((dep) :: ([])))))
  | _ -> vuna_fail "compiler/lib/Vuna/Pkg.vuna" 150 7 ("case pattern match failure"))
  | _ -> vuna_fail "compiler/lib/Vuna/Pkg.vuna" 147 3 ("case pattern match failure"))

let v_Vuna_dPkg_ddependencyNameOk = fun depName actual -> (match depName with
  | C_Vuna_dMaybe_dNothing -> true
  | C_Vuna_dMaybe_dJust (expected) -> v_vuna_ueq_ugeneric expected actual
  | _ -> vuna_fail "compiler/lib/Vuna/Pkg.vuna" 157 3 ("case pattern match failure"))

let v_Vuna_dPkg_dmismatchMessage = fun depName actual -> (match depName with
  | C_Vuna_dMaybe_dNothing -> "pkg: package name mismatch"
  | C_Vuna_dMaybe_dJust (expected) -> (let vuna_cat0' = ("pkg: dependency ") in (let vuna_cat1' = (expected) in (let vuna_cat2' = (" expects package name ") in (let vuna_cat3' = (expected) in (let vuna_cat4' = (" but found ") in (let vuna_cat5' = (actual) in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'; vuna_cat4'; vuna_cat5']))))))
  | _ -> vuna_fail "compiler/lib/Vuna/Pkg.vuna" 162 3 ("case pattern match failure"))

let rec v_Vuna_dPkg_dloadDependencyList = fun stack baseDir deps -> (match deps with
  | [] -> C_Vuna_dResult_dOk ([])
  | (C_Vuna_dPair_dPair (depName, rel)) :: (rest) -> (match v_Vuna_dPkg_dloadPackageWalk stack (C_Vuna_dMaybe_dJust (depName)) (v_Vuna_dPkg_djoinPath baseDir rel) with
  | C_Vuna_dResult_dErr (e) -> C_Vuna_dResult_dErr (e)
  | C_Vuna_dResult_dOk (dependency) -> (match v_Vuna_dPkg_dloadDependencyList stack baseDir rest with
  | C_Vuna_dResult_dErr (e) -> C_Vuna_dResult_dErr (e)
  | C_Vuna_dResult_dOk (dependencies) -> C_Vuna_dResult_dOk ((dependency) :: (dependencies))
  | _ -> vuna_fail "compiler/lib/Vuna/Pkg.vuna" 175 11 ("case pattern match failure"))
  | _ -> vuna_fail "compiler/lib/Vuna/Pkg.vuna" 172 7 ("case pattern match failure"))
  | _ -> vuna_fail "compiler/lib/Vuna/Pkg.vuna" 169 3 ("case pattern match failure"))
and v_Vuna_dPkg_dloadPackageWalk = fun stack depName dir -> (let normalized = v_Vuna_dPkg_dnormalizeDir dir in if v_Vuna_dPkg_dmemStackDir normalized stack then C_Vuna_dResult_dErr (v_Vuna_dPkg_dcycleMessage normalized depName stack) else (match v_Vuna_dPkg_dloadManifestAt (((normalized) ^ ("/vuna.toml"))) with
  | C_Vuna_dResult_dErr (e) -> C_Vuna_dResult_dErr (e)
  | C_Vuna_dResult_dOk (manifest) -> (let name = v_Vuna_dPkg_dmanifestNameString manifest in if v_Vuna_dPkg_ddependencyNameOk depName name then (match v_Vuna_dPkg_dloadDependencyList ((C_Vuna_dPair_dPair (normalized, name)) :: (stack)) normalized (v_Vuna_dManifest_dmanifestDependencies manifest) with
  | C_Vuna_dResult_dErr (e) -> C_Vuna_dResult_dErr (e)
  | C_Vuna_dResult_dOk (dependencies) -> C_Vuna_dResult_dOk (C_Vuna_dPkg_dPackage (manifest, dependencies, normalized))
  | _ -> vuna_fail "compiler/lib/Vuna/Pkg.vuna" 188 17 ("case pattern match failure")) else C_Vuna_dResult_dErr (v_Vuna_dPkg_dmismatchMessage depName name))
  | _ -> vuna_fail "compiler/lib/Vuna/Pkg.vuna" 183 8 ("case pattern match failure")))

let v_Vuna_dPkg_dloadPackage = fun dir -> v_Vuna_dPkg_dloadPackageWalk [] C_Vuna_dMaybe_dNothing dir

let rec v_Vuna_dPkg_dloadMembers = fun baseDir members -> (match members with
  | [] -> C_Vuna_dResult_dOk ([])
  | (rel) :: (rest) -> (match v_Vuna_dPkg_dloadPackage (v_Vuna_dPkg_djoinPath baseDir rel) with
  | C_Vuna_dResult_dErr (e) -> C_Vuna_dResult_dErr (e)
  | C_Vuna_dResult_dOk (memberPackage) -> (match v_Vuna_dPkg_dloadMembers baseDir rest with
  | C_Vuna_dResult_dErr (e) -> C_Vuna_dResult_dErr (e)
  | C_Vuna_dResult_dOk (memberPackages) -> C_Vuna_dResult_dOk ((memberPackage) :: (memberPackages))
  | _ -> vuna_fail "compiler/lib/Vuna/Pkg.vuna" 206 11 ("case pattern match failure"))
  | _ -> vuna_fail "compiler/lib/Vuna/Pkg.vuna" 203 7 ("case pattern match failure"))
  | _ -> vuna_fail "compiler/lib/Vuna/Pkg.vuna" 200 3 ("case pattern match failure"))

let v_Vuna_dPkg_dworkspacePackages = fun rootBaseDir -> (let base = v_Vuna_dPkg_dnormalizeDir rootBaseDir in (match v_Vuna_dPkg_dloadPackage base with
  | C_Vuna_dResult_dErr (e) -> C_Vuna_dResult_dErr (e)
  | C_Vuna_dResult_dOk (rootPackage) -> (match v_Vuna_dPkg_dloadMembers base (v_Vuna_dManifest_dmanifestMembers (v_Vuna_dPkg_dpackageManifest rootPackage)) with
  | C_Vuna_dResult_dErr (e) -> C_Vuna_dResult_dErr (e)
  | C_Vuna_dResult_dOk (members) -> C_Vuna_dResult_dOk ((rootPackage) :: (members))
  | _ -> vuna_fail "compiler/lib/Vuna/Pkg.vuna" 217 10 ("case pattern match failure"))
  | _ -> vuna_fail "compiler/lib/Vuna/Pkg.vuna" 214 6 ("case pattern match failure")))

let v_Vuna_dPkg_ddependencyRootOf = fun package -> C_Vuna_dPkg_dRoot (((v_Vuna_dPkg_dpackageDir package) ^ ("/lib")), v_Vuna_dPkg_dpackageName package, v_Vuna_dPkg_dpackageExports package)

let rec v_Vuna_dPkg_ddependencyRoots = fun seen packages -> (match packages with
  | [] -> C_Vuna_dPair_dPair (seen, [])
  | (package) :: (rest) -> if v_Vuna_dList_dmemName (v_Vuna_dPkg_dpackageName package) seen then v_Vuna_dPkg_ddependencyRoots seen rest else (match v_Vuna_dPkg_ddependencyRoots ((v_Vuna_dPkg_dpackageName package) :: (seen)) (v_Vuna_dPkg_dpackageDependencies package) with
  | C_Vuna_dPair_dPair (seen1, transitive) -> (match v_Vuna_dPkg_ddependencyRoots seen1 rest with
  | C_Vuna_dPair_dPair (seen2, siblings) -> C_Vuna_dPair_dPair (seen2, v_Vuna_dList_dappend transitive ((v_Vuna_dPkg_ddependencyRootOf package) :: (siblings)))
  | _ -> vuna_fail "compiler/lib/Vuna/Pkg.vuna" 236 13 ("case pattern match failure"))
  | _ -> vuna_fail "compiler/lib/Vuna/Pkg.vuna" 234 9 ("case pattern match failure"))
  | _ -> vuna_fail "compiler/lib/Vuna/Pkg.vuna" 229 3 ("case pattern match failure"))

let v_Vuna_dPkg_dpackageRoots = fun package -> (let selfName = v_Vuna_dPkg_dpackageName package in let selfRoot = C_Vuna_dPkg_dRoot (((v_Vuna_dPkg_dpackageDir package) ^ ("/lib")), selfName, C_Vuna_dMaybe_dNothing) in (match v_Vuna_dPkg_ddependencyRoots ((selfName) :: ([])) (v_Vuna_dPkg_dpackageDependencies package) with
  | C_Vuna_dPair_dPair (seen, roots) -> (selfRoot) :: (roots)
  | _ -> vuna_fail "compiler/lib/Vuna/Pkg.vuna" 246 6 ("case pattern match failure")))

let v_Vuna_dPkg_dpackageEntry = fun package -> ((v_Vuna_dPkg_dpackageDir package) ^ ("/app/Main.vuna"))

let rec v_Vuna_dPkg_dfindManifestUp = fun start dir -> if bi_file_exists (((dir) ^ ("/vuna.toml"))) then C_Vuna_dResult_dOk (dir) else v_Vuna_dPkg_dfindManifestUpStep start dir (v_Vuna_dManifest_dmanifestDir dir)
and v_Vuna_dPkg_dfindManifestUpStep = fun start dir parent -> if v_vuna_ueq_ustr parent dir then C_Vuna_dResult_dErr ((let vuna_cat0' = ("pkg: no vuna.toml found from ") in (let vuna_cat1' = (start) in (let vuna_cat2' = (" (searched upward)") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'])))) else v_Vuna_dPkg_dfindManifestUp start parent

let v_Vuna_dPkg_dfindManifestDir = fun startDir -> (let start = v_Vuna_dPkg_dnormalizeDir startDir in v_Vuna_dPkg_dfindManifestUp start start)

let v_vuna_ueq_uVuna_uPkg_uRoot = fun x y -> (match x with
  | C_Vuna_dPkg_dRoot (v0, v1, v2) -> (match y with
  | C_Vuna_dPkg_dRoot (w0, w1, w2) -> (if ((if (v_vuna_ueq_ustr v0 w0) then (v_vuna_ueq_ustr v1 w1) else false)) then (v_vuna_ueq_uVuna_uMaybe_uMaybe v2 w2) else false)
  | _ -> v_vuna_ueq_uint 0 1
  | _ -> vuna_fail "<generated>" 326 29 ("case pattern match failure"))
  | _ -> v_vuna_ueq_uint 0 1
  | _ -> vuna_fail "<generated>" 325 29 ("case pattern match failure"))

let v_vuna_uneq_uVuna_uPkg_uRoot = fun x y -> if v_vuna_ueq_uVuna_uPkg_uRoot x y then v_vuna_ueq_uint 0 1 else v_vuna_ueq_uint 0 0

let v_vuna_ueq_uVuna_uPkg_uPackage = fun x y -> (match x with
  | C_Vuna_dPkg_dPackage (v0, v1, v2) -> (match y with
  | C_Vuna_dPkg_dPackage (w0, w1, w2) -> (if ((if (v_vuna_ueq_uVuna_uManifest_uManifest v0 w0) then (v_vuna_ueq_uVuna_uList_uList v1 w1) else false)) then (v_vuna_ueq_ustr v2 w2) else false)
  | _ -> v_vuna_ueq_uint 0 1
  | _ -> vuna_fail "<generated>" 335 32 ("case pattern match failure"))
  | _ -> v_vuna_ueq_uint 0 1
  | _ -> vuna_fail "<generated>" 334 32 ("case pattern match failure"))

let v_vuna_uneq_uVuna_uPkg_uPackage = fun x y -> if v_vuna_ueq_uVuna_uPkg_uPackage x y then v_vuna_ueq_uint 0 1 else v_vuna_ueq_uint 0 0
