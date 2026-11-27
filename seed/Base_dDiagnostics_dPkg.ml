open Vuna_runtime
type t_PkgErr = C_PkgErr_EmptyDependencyName | C_PkgErr_EmptyMember | C_PkgErr_EmptyPackageName | C_PkgErr_MissingPackageName | C_PkgErr_EmptyWorkspace | C_PkgErr_NotPackage | C_PkgErr_DependencyPathNotString of (string) | C_PkgErr_DuplicateDependency of (string) | C_PkgErr_EmptyDependencyPath of (string) | C_PkgErr_ExpectedBool of (string) | C_PkgErr_ExpectedString of (string) | C_PkgErr_ExpectedInt of (string) | C_PkgErr_InvalidDiagFormat of (string) | C_PkgErr_InvalidDiagMaxErrors of (string) | C_PkgErr_InvalidDiagLang of (string) | C_PkgErr_ExpectedStringArray of (string) | C_PkgErr_Invalid of (string) | C_PkgErr_InvalidExportModule of (string) | C_PkgErr_InvalidPackageName of (string) | C_PkgErr_MissingManifest of (string) | C_PkgErr_MissingBase of (string) | C_PkgErr_LibraryWithoutEntry of (string) | C_PkgErr_NoManifestUpward of (string) | C_PkgErr_TomlSyntax of (string) | C_PkgErr_DependencySourceMissing of (string) | C_PkgErr_GitRevRequired of (string) | C_PkgErr_HashMalformed of (string) | C_PkgErr_IdentityMalformed of (string) | C_PkgErr_MissingHash of (string) | C_PkgErr_SourceConflict of (string) | C_PkgErr_NotMaterialized of (string) | C_PkgErr_FetchFailed of (string) | C_PkgErr_IndexMalformed of (string) | C_PkgErr_UnexpectedTopLevelKey of (string) | C_PkgErr_UnknownSection of (string) | C_PkgErr_LayerInvalidName of (string) | C_PkgErr_LayerInvalidTarget of (string) | C_PkgErr_LayerKeyMustBeQuoted of (string) | C_PkgErr_LayerCycle of (string) | C_PkgErr_PackageSectionInWorkspaceRoot of (string) | C_PkgErr_UnknownKey of (string) * (string) | C_PkgErr_UnknownSourceKey of (string) * (string) | C_PkgErr_HashMismatch of (string) * (string) | C_PkgErr_IdentityMismatch of (string) * (string) | C_PkgErr_DuplicatePackageName of (string) * (string) * (string)
and t_PkgEntry = { f_PkgEntry_pkgEntryCode : string; f_PkgEntry_pkgEntryTemplate : string; f_PkgEntry_pkgEntryDesc : string }

# 67 "Vuna/Compiler/Base/Diagnostics/Pkg.vuna"
let v_pkgCode = (fun (dtb_u_u2 : t_PkgErr) -> (match dtb_u_u2 with
  | C_PkgErr_DuplicatePackageName (dtb_u_u3, dtb_u_u4, dtb_u_u5) -> "PKG_DuplicatePackageName"
  | C_PkgErr_IdentityMismatch (dtb_u_u6, dtb_u_u7) -> "PKG_IdentityMismatch"
  | C_PkgErr_HashMismatch (dtb_u_u8, dtb_u_u9) -> "PKG_HashMismatch"
  | C_PkgErr_IndexMalformed (dtb_u_u10) -> "PKG_IndexMalformed"
  | C_PkgErr_FetchFailed (dtb_u_u11) -> "PKG_FetchFailed"
  | C_PkgErr_NotMaterialized (dtb_u_u12) -> "PKG_NotMaterialized"
  | C_PkgErr_SourceConflict (dtb_u_u13) -> "PKG_SourceConflict"
  | C_PkgErr_MissingHash (dtb_u_u14) -> "PKG_MissingHash"
  | C_PkgErr_IdentityMalformed (dtb_u_u15) -> "PKG_IdentityMalformed"
  | C_PkgErr_HashMalformed (dtb_u_u16) -> "PKG_HashMalformed"
  | C_PkgErr_GitRevRequired (dtb_u_u17) -> "PKG_GitRevRequired"
  | C_PkgErr_DependencySourceMissing (dtb_u_u18) -> "PKG_DependencySourceMissing"
  | C_PkgErr_UnknownSourceKey (dtb_u_u19, dtb_u_u20) -> "PKG_UnknownSourceKey"
  | C_PkgErr_UnknownKey (dtb_u_u21, dtb_u_u22) -> "PKG_UnknownKey"
  | C_PkgErr_PackageSectionInWorkspaceRoot (dtb_u_u23) -> "PKG_PackageSectionInWorkspaceRoot"
  | C_PkgErr_LayerCycle (dtb_u_u24) -> "PKG_LayerCycle"
  | C_PkgErr_LayerKeyMustBeQuoted (dtb_u_u25) -> "PKG_LayerKeyMustBeQuoted"
  | C_PkgErr_LayerInvalidTarget (dtb_u_u26) -> "PKG_LayerInvalidTarget"
  | C_PkgErr_LayerInvalidName (dtb_u_u27) -> "PKG_LayerInvalidName"
  | C_PkgErr_UnknownSection (dtb_u_u28) -> "PKG_UnknownSection"
  | C_PkgErr_UnexpectedTopLevelKey (dtb_u_u29) -> "PKG_UnexpectedTopLevelKey"
  | C_PkgErr_TomlSyntax (dtb_u_u30) -> "PKG_TomlSyntax"
  | C_PkgErr_NoManifestUpward (dtb_u_u31) -> "PKG_NoManifestUpward"
  | C_PkgErr_LibraryWithoutEntry (dtb_u_u32) -> "PKG_LibraryWithoutEntry"
  | C_PkgErr_MissingBase (dtb_u_u33) -> "PKG_MissingBase"
  | C_PkgErr_MissingManifest (dtb_u_u34) -> "PKG_MissingManifest"
  | C_PkgErr_InvalidPackageName (dtb_u_u35) -> "PKG_InvalidPackageName"
  | C_PkgErr_InvalidExportModule (dtb_u_u36) -> "PKG_InvalidExportModule"
  | C_PkgErr_Invalid (dtb_u_u37) -> "PKG_Invalid"
  | C_PkgErr_ExpectedStringArray (dtb_u_u38) -> "PKG_ExpectedStringArray"
  | C_PkgErr_InvalidDiagLang (dtb_u_u39) -> "PKG_InvalidDiagLang"
  | C_PkgErr_InvalidDiagMaxErrors (dtb_u_u40) -> "PKG_InvalidDiagMaxErrors"
  | C_PkgErr_InvalidDiagFormat (dtb_u_u41) -> "PKG_InvalidDiagFormat"
  | C_PkgErr_ExpectedInt (dtb_u_u42) -> "PKG_ExpectedInt"
  | C_PkgErr_ExpectedString (dtb_u_u43) -> "PKG_ExpectedString"
  | C_PkgErr_ExpectedBool (dtb_u_u44) -> "PKG_ExpectedBool"
  | C_PkgErr_EmptyDependencyPath (dtb_u_u45) -> "PKG_EmptyDependencyPath"
  | C_PkgErr_DuplicateDependency (dtb_u_u46) -> "PKG_DuplicateDependency"
  | C_PkgErr_DependencyPathNotString (dtb_u_u47) -> "PKG_DependencyPathNotString"
  | C_PkgErr_NotPackage -> "PKG_NotPackage"
  | C_PkgErr_EmptyWorkspace -> "PKG_EmptyWorkspace"
  | C_PkgErr_MissingPackageName -> "PKG_MissingPackageName"
  | C_PkgErr_EmptyPackageName -> "PKG_EmptyPackageName"
  | C_PkgErr_EmptyMember -> "PKG_EmptyMember"
  | C_PkgErr_EmptyDependencyName -> "PKG_EmptyDependencyName"
  | _ -> failwith "DT: impossible branch"
))

# 115 "Vuna/Compiler/Base/Diagnostics/Pkg.vuna"
let v_pkgTemplate = (fun (dtb_u_u49 : t_PkgErr) -> (match dtb_u_u49 with
  | C_PkgErr_DuplicatePackageName (dtb_u_u50, dtb_u_u51, dtb_u_u52) -> "duplicate package name \"<0>\" in <1> and <2> (package names must be unique within a dependency graph)"
  | C_PkgErr_IdentityMismatch (dtb_u_u53, dtb_u_u54) -> "package \"<0>\" identity mismatch: <1>"
  | C_PkgErr_HashMismatch (dtb_u_u55, dtb_u_u56) -> "package \"<0>\" content hash mismatch: <1>"
  | C_PkgErr_IndexMalformed (dtb_u_u57) -> "invalid package index: <0>"
  | C_PkgErr_FetchFailed (dtb_u_u58) -> "cannot fetch package: <0>"
  | C_PkgErr_NotMaterialized (dtb_u_u59) -> "package \"<0>\" is not in the local store (run: vuna deps fetch)"
  | C_PkgErr_SourceConflict (dtb_u_u60) -> "dependency \"<0>\" specifies more than one source (path / git / url)"
  | C_PkgErr_MissingHash (dtb_u_u61) -> "dependency \"<0>\" must have a hash (only path dependencies may omit it)"
  | C_PkgErr_IdentityMalformed (dtb_u_u62) -> "invalid dependency identity \"<0>\" (expected sha256:<64 hex>)"
  | C_PkgErr_HashMalformed (dtb_u_u63) -> "invalid dependency hash \"<0>\" (expected sha256:<64 hex>)"
  | C_PkgErr_GitRevRequired (dtb_u_u64) -> "missing rev for git dependency \"<0>\""
  | C_PkgErr_DependencySourceMissing (dtb_u_u65) -> "dependency \"<0>\" must specify path, git (with rev) or url"
  | C_PkgErr_UnknownSourceKey (dtb_u_u66, dtb_u_u67) -> "unknown key \"<0>\" in [dependencies.<1>]"
  | C_PkgErr_UnknownKey (dtb_u_u68, dtb_u_u69) -> "unknown key \"<0>\" in [<1>]"
  | C_PkgErr_PackageSectionInWorkspaceRoot (dtb_u_u70) -> "section [<0>] is not allowed in a workspace root without [package]"
  | C_PkgErr_LayerCycle (dtb_u_u71) -> "layer dependency cycle: <0>"
  | C_PkgErr_LayerKeyMustBeQuoted (dtb_u_u72) -> "layer \"<0>\" must be a quoted key in [layers] (\"<0>\" = [...])"
  | C_PkgErr_LayerInvalidTarget (dtb_u_u73) -> "invalid layer target \"<0>\" (expected a module prefix such as Vuna.Compiler.Base)"
  | C_PkgErr_LayerInvalidName (dtb_u_u74) -> "invalid layer name \"<0>\" (expected a module prefix such as Vuna.Ir)"
  | C_PkgErr_UnknownSection (dtb_u_u75) -> "unknown section [<0>]"
  | C_PkgErr_UnexpectedTopLevelKey (dtb_u_u76) -> "unexpected top-level key \"<0>\""
  | C_PkgErr_TomlSyntax (dtb_u_u77) -> "<0>"
  | C_PkgErr_NoManifestUpward (dtb_u_u78) -> "missing vuna.toml upward from <0>"
  | C_PkgErr_LibraryWithoutEntry (dtb_u_u79) -> "library package <0> must have app/Main.vuna (executable) or [export].modules (library)"
  | C_PkgErr_MissingBase (dtb_u_u80) -> "cannot locate vuna-base: tried <0> (set VUNA_BASE to a directory containing vuna.toml)"
  | C_PkgErr_MissingManifest (dtb_u_u81) -> "missing vuna.toml in <0>"
  | C_PkgErr_InvalidPackageName (dtb_u_u82) -> "invalid package name \"<0>\" (allowed characters: a-z, 0-9, '-')"
  | C_PkgErr_InvalidExportModule (dtb_u_u83) -> "invalid export module \"<0>\" (segments must match [A-Z][A-Za-z0-9_]*)"
  | C_PkgErr_Invalid (dtb_u_u84) -> "<0>"
  | C_PkgErr_ExpectedStringArray (dtb_u_u85) -> "expected an array of strings for \"<0>\""
  | C_PkgErr_InvalidDiagLang (dtb_u_u86) -> "invalid [diagnostics] lang \"<0>\" (expected en|zh)"
  | C_PkgErr_InvalidDiagMaxErrors (dtb_u_u87) -> "invalid [diagnostics] max-errors \"<0>\" (expected a positive integer)"
  | C_PkgErr_InvalidDiagFormat (dtb_u_u88) -> "invalid [diagnostics] format \"<0>\" (expected short|human|json|sarif)"
  | C_PkgErr_ExpectedInt (dtb_u_u89) -> "expected an integer for \"<0>\""
  | C_PkgErr_ExpectedString (dtb_u_u90) -> "expected a string for \"<0>\""
  | C_PkgErr_ExpectedBool (dtb_u_u91) -> "expected a boolean for \"<0>\""
  | C_PkgErr_EmptyDependencyPath (dtb_u_u92) -> "dependency \"<0>\" path must not be empty"
  | C_PkgErr_DuplicateDependency (dtb_u_u93) -> "duplicate dependency \"<0>\""
  | C_PkgErr_DependencyPathNotString (dtb_u_u94) -> "dependency \"<0>\" must have a string relative path"
  | C_PkgErr_NotPackage -> "manifest has no [package] (a workspace root is not a package; run inside a member package)"
  | C_PkgErr_EmptyWorkspace -> "workspace root without [package] must declare [workspace].members"
  | C_PkgErr_MissingPackageName -> "missing [package] name"
  | C_PkgErr_EmptyPackageName -> "package name must not be empty"
  | C_PkgErr_EmptyMember -> "workspace member must not be empty"
  | C_PkgErr_EmptyDependencyName -> "dependency name must not be empty"
  | _ -> failwith "DT: impossible branch"
))

# 178 "Vuna/Compiler/Base/Diagnostics/Pkg.vuna"
let v_pkgMsg = (fun (dtb_u_u96 : t_PkgErr) (dtb_u_u97 : string B_dData_dVec.t_Vec) -> (((((Base_dDiag.v_diagNoLoc Base_dDiag.C_Severity_SevError) Base_dDiag.C_Phase_PhLoad) Base_dDiag.C_Category_CatPackage) (v_pkgCode dtb_u_u96)) ((Base_dDiagnostics_dCommon.v_diagBody (v_pkgTemplate dtb_u_u96)) dtb_u_u97)))

# 182 "Vuna/Compiler/Base/Diagnostics/Pkg.vuna"
let v_pkgSpan = (fun (dtb_u_u98 : string) (dtb_u_u99 : int) -> (if (dtb_u_u98 = "") then B_dData_dMaybe.C_Maybe_Nothing else (B_dData_dMaybe.C_Maybe_Just ({ Base_dSource.f_Span_spanFile = dtb_u_u98; Base_dSource.f_Span_spanStartLine = dtb_u_u99; Base_dSource.f_Span_spanStartCol = 1; Base_dSource.f_Span_spanEndLine = dtb_u_u99; Base_dSource.f_Span_spanEndCol = 1; Base_dSource.f_Span_spanStartOffset = 0; Base_dSource.f_Span_spanEndOffset = 0 }))))

# 186 "Vuna/Compiler/Base/Diagnostics/Pkg.vuna"
let v_atSpan = (fun (dtb_u_u100 : Base_dSource.t_Span B_dData_dMaybe.t_Maybe) (dtb_u_u101 : Base_dDiag.t_Diagnostic) -> (match dtb_u_u100 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u102) -> ((Base_dDiag.v_withLabel { Base_dDiag.f_Label_labelSpan = (B_dData_dMaybe.C_Maybe_Just (dtb_u_u102)); Base_dDiag.f_Label_labelText = ""; Base_dDiag.f_Label_labelStyle = Base_dDiag.C_LabelStyle_LabelPrimary; Base_dDiag.f_Label_labelProvenance = B_dData_dMaybe.C_Maybe_Nothing }) dtb_u_u101)
  | B_dData_dMaybe.C_Maybe_Nothing -> dtb_u_u101
  | _ -> failwith "DT: impossible branch"
))

# 191 "Vuna/Compiler/Base/Diagnostics/Pkg.vuna"
let v_pkgAt = (fun (dtb_u_u105 : string) (dtb_u_u106 : int) (dtb_u_u108 : t_PkgErr) (dtb_u_u109 : string B_dData_dVec.t_Vec) -> (Base_dDiag.C_Check_ErrC (((v_atSpan ((v_pkgSpan dtb_u_u105) dtb_u_u106)) ((v_pkgMsg dtb_u_u108) dtb_u_u109)))))

# 195 "Vuna/Compiler/Base/Diagnostics/Pkg.vuna"
let v_pkgPath = (fun (dtb_u_u112 : string) (dtb_u_u114 : t_PkgErr) (dtb_u_u115 : string B_dData_dVec.t_Vec) -> ((((v_pkgAt dtb_u_u112) 1) dtb_u_u114) dtb_u_u115))

# 199 "Vuna/Compiler/Base/Diagnostics/Pkg.vuna"
let v_pkgNoLoc = (fun (dtb_u_u118 : t_PkgErr) (dtb_u_u119 : string B_dData_dVec.t_Vec) -> (Base_dDiag.C_Check_ErrC (((Base_dDiag.v_withAbsent Base_dDiag.C_NoSourceReason_NsPackageGraph) ((v_pkgMsg dtb_u_u118) dtb_u_u119)))))

# 203 "Vuna/Compiler/Base/Diagnostics/Pkg.vuna"
let v_pkgNoLoc1 = (fun (dtb_u_u121 : t_PkgErr) (dtb_u_u122 : string) -> ((v_pkgNoLoc dtb_u_u121) (B_dData_dVec.C_Vec__x58__x58_ (dtb_u_u122, B_dData_dVec.C_Vec_Nil))))

# 207 "Vuna/Compiler/Base/Diagnostics/Pkg.vuna"
let v_pkgAt0 = (fun (dtb_u_u124 : string) (dtb_u_u125 : int) (dtb_u_u126 : t_PkgErr) -> ((((v_pkgAt dtb_u_u124) dtb_u_u125) dtb_u_u126) B_dData_dVec.C_Vec_Nil))

# 211 "Vuna/Compiler/Base/Diagnostics/Pkg.vuna"
let v_pkgAt1 = (fun (dtb_u_u128 : string) (dtb_u_u129 : int) (dtb_u_u130 : t_PkgErr) (dtb_u_u131 : string) -> ((((v_pkgAt dtb_u_u128) dtb_u_u129) dtb_u_u130) (B_dData_dVec.C_Vec__x58__x58_ (dtb_u_u131, B_dData_dVec.C_Vec_Nil))))

# 215 "Vuna/Compiler/Base/Diagnostics/Pkg.vuna"
let v_pkgAt2 = (fun (dtb_u_u133 : string) (dtb_u_u134 : int) (dtb_u_u135 : t_PkgErr) (dtb_u_u136 : string) (dtb_u_u137 : string) -> ((((v_pkgAt dtb_u_u133) dtb_u_u134) dtb_u_u135) (B_dData_dVec.C_Vec__x58__x58_ (dtb_u_u136, (B_dData_dVec.C_Vec__x58__x58_ (dtb_u_u137, B_dData_dVec.C_Vec_Nil))))))

# 219 "Vuna/Compiler/Base/Diagnostics/Pkg.vuna"
let v_pkgPath0 = (fun (dtb_u_u139 : string) (dtb_u_u140 : t_PkgErr) -> (((v_pkgPath dtb_u_u139) dtb_u_u140) B_dData_dVec.C_Vec_Nil))

# 223 "Vuna/Compiler/Base/Diagnostics/Pkg.vuna"
let v_pkgPath1 = (fun (dtb_u_u142 : string) (dtb_u_u143 : t_PkgErr) (dtb_u_u144 : string) -> (((v_pkgPath dtb_u_u142) dtb_u_u143) (B_dData_dVec.C_Vec__x58__x58_ (dtb_u_u144, B_dData_dVec.C_Vec_Nil))))

# 227 "Vuna/Compiler/Base/Diagnostics/Pkg.vuna"
let v_pkgPath2 = (fun (dtb_u_u146 : string) (dtb_u_u147 : t_PkgErr) (dtb_u_u148 : string) (dtb_u_u149 : string) -> (((v_pkgPath dtb_u_u146) dtb_u_u147) (B_dData_dVec.C_Vec__x58__x58_ (dtb_u_u148, (B_dData_dVec.C_Vec__x58__x58_ (dtb_u_u149, B_dData_dVec.C_Vec_Nil))))))

# 231 "Vuna/Compiler/Base/Diagnostics/Pkg.vuna"
let v_pkgInvalid = (fun (dtb_u_u151 : string) -> ((v_pkgNoLoc (C_PkgErr_Invalid (dtb_u_u151))) (B_dData_dVec.C_Vec__x58__x58_ (dtb_u_u151, B_dData_dVec.C_Vec_Nil))))

# 241 "Vuna/Compiler/Base/Diagnostics/Pkg.vuna"
let v_pkgAll = (B_dData_dList.C_List__x58__x58_ ({ f_PkgEntry_pkgEntryCode = (v_pkgCode C_PkgErr_EmptyDependencyName); f_PkgEntry_pkgEntryTemplate = (v_pkgTemplate C_PkgErr_EmptyDependencyName); f_PkgEntry_pkgEntryDesc = "\228\190\157\232\181\150\229\144\141\228\184\186\231\169\186" }, (B_dData_dList.C_List__x58__x58_ ({ f_PkgEntry_pkgEntryCode = (v_pkgCode C_PkgErr_EmptyMember); f_PkgEntry_pkgEntryTemplate = (v_pkgTemplate C_PkgErr_EmptyMember); f_PkgEntry_pkgEntryDesc = "workspace \230\136\144\229\145\152\228\184\186\231\169\186" }, (B_dData_dList.C_List__x58__x58_ ({ f_PkgEntry_pkgEntryCode = (v_pkgCode C_PkgErr_EmptyPackageName); f_PkgEntry_pkgEntryTemplate = (v_pkgTemplate C_PkgErr_EmptyPackageName); f_PkgEntry_pkgEntryDesc = "\229\140\133\229\144\141\228\184\186\231\169\186" }, (B_dData_dList.C_List__x58__x58_ ({ f_PkgEntry_pkgEntryCode = (v_pkgCode C_PkgErr_MissingPackageName); f_PkgEntry_pkgEntryTemplate = (v_pkgTemplate C_PkgErr_MissingPackageName); f_PkgEntry_pkgEntryDesc = "\231\188\186 [package] \231\154\132 name" }, (B_dData_dList.C_List__x58__x58_ ({ f_PkgEntry_pkgEntryCode = (v_pkgCode C_PkgErr_EmptyWorkspace); f_PkgEntry_pkgEntryTemplate = (v_pkgTemplate C_PkgErr_EmptyWorkspace); f_PkgEntry_pkgEntryDesc = "\232\153\154\230\139\159 workspace \230\160\185\230\178\161\230\156\137 members" }, (B_dData_dList.C_List__x58__x58_ ({ f_PkgEntry_pkgEntryCode = (v_pkgCode C_PkgErr_NotPackage); f_PkgEntry_pkgEntryTemplate = (v_pkgTemplate C_PkgErr_NotPackage); f_PkgEntry_pkgEntryDesc = "workspace \230\160\185\228\184\141\232\131\189\229\189\147\229\140\133\228\189\191\231\148\168" }, (B_dData_dList.C_List__x58__x58_ ({ f_PkgEntry_pkgEntryCode = (v_pkgCode (C_PkgErr_DependencyPathNotString (""))); f_PkgEntry_pkgEntryTemplate = (v_pkgTemplate (C_PkgErr_DependencyPathNotString (""))); f_PkgEntry_pkgEntryDesc = "\228\190\157\232\181\150\232\183\175\229\190\132\229\191\133\233\161\187\230\152\175\229\173\151\231\172\166\228\184\178" }, (B_dData_dList.C_List__x58__x58_ ({ f_PkgEntry_pkgEntryCode = (v_pkgCode (C_PkgErr_DuplicateDependency (""))); f_PkgEntry_pkgEntryTemplate = (v_pkgTemplate (C_PkgErr_DuplicateDependency (""))); f_PkgEntry_pkgEntryDesc = "\233\135\141\229\164\141\228\190\157\232\181\150" }, (B_dData_dList.C_List__x58__x58_ ({ f_PkgEntry_pkgEntryCode = (v_pkgCode (C_PkgErr_EmptyDependencyPath (""))); f_PkgEntry_pkgEntryTemplate = (v_pkgTemplate (C_PkgErr_EmptyDependencyPath (""))); f_PkgEntry_pkgEntryDesc = "\228\190\157\232\181\150\232\183\175\229\190\132\228\184\186\231\169\186" }, (B_dData_dList.C_List__x58__x58_ ({ f_PkgEntry_pkgEntryCode = (v_pkgCode (C_PkgErr_ExpectedBool (""))); f_PkgEntry_pkgEntryTemplate = (v_pkgTemplate (C_PkgErr_ExpectedBool (""))); f_PkgEntry_pkgEntryDesc = "\229\184\131\229\176\148\229\173\151\230\174\181\231\177\187\229\158\139\233\148\153\232\175\175" }, (B_dData_dList.C_List__x58__x58_ ({ f_PkgEntry_pkgEntryCode = (v_pkgCode (C_PkgErr_ExpectedString (""))); f_PkgEntry_pkgEntryTemplate = (v_pkgTemplate (C_PkgErr_ExpectedString (""))); f_PkgEntry_pkgEntryDesc = "\229\173\151\231\172\166\228\184\178\229\173\151\230\174\181\231\177\187\229\158\139\233\148\153\232\175\175" }, (B_dData_dList.C_List__x58__x58_ ({ f_PkgEntry_pkgEntryCode = (v_pkgCode (C_PkgErr_ExpectedInt (""))); f_PkgEntry_pkgEntryTemplate = (v_pkgTemplate (C_PkgErr_ExpectedInt (""))); f_PkgEntry_pkgEntryDesc = "\230\149\180\230\149\176\229\173\151\230\174\181\231\177\187\229\158\139\233\148\153\232\175\175" }, (B_dData_dList.C_List__x58__x58_ ({ f_PkgEntry_pkgEntryCode = (v_pkgCode (C_PkgErr_InvalidDiagFormat (""))); f_PkgEntry_pkgEntryTemplate = (v_pkgTemplate (C_PkgErr_InvalidDiagFormat (""))); f_PkgEntry_pkgEntryDesc = "\233\157\158\230\179\149\232\175\138\230\150\173\230\160\188\229\188\143" }, (B_dData_dList.C_List__x58__x58_ ({ f_PkgEntry_pkgEntryCode = (v_pkgCode (C_PkgErr_InvalidDiagMaxErrors (""))); f_PkgEntry_pkgEntryTemplate = (v_pkgTemplate (C_PkgErr_InvalidDiagMaxErrors (""))); f_PkgEntry_pkgEntryDesc = "\233\157\158\230\179\149 max-errors" }, (B_dData_dList.C_List__x58__x58_ ({ f_PkgEntry_pkgEntryCode = (v_pkgCode (C_PkgErr_InvalidDiagLang (""))); f_PkgEntry_pkgEntryTemplate = (v_pkgTemplate (C_PkgErr_InvalidDiagLang (""))); f_PkgEntry_pkgEntryDesc = "\233\157\158\230\179\149\232\175\138\230\150\173\232\175\173\232\168\128" }, (B_dData_dList.C_List__x58__x58_ ({ f_PkgEntry_pkgEntryCode = (v_pkgCode (C_PkgErr_ExpectedStringArray (""))); f_PkgEntry_pkgEntryTemplate = (v_pkgTemplate (C_PkgErr_ExpectedStringArray (""))); f_PkgEntry_pkgEntryDesc = "\229\173\151\231\172\166\228\184\178\230\149\176\231\187\132\229\173\151\230\174\181\231\177\187\229\158\139\233\148\153\232\175\175" }, (B_dData_dList.C_List__x58__x58_ ({ f_PkgEntry_pkgEntryCode = (v_pkgCode (C_PkgErr_Invalid (""))); f_PkgEntry_pkgEntryTemplate = (v_pkgTemplate (C_PkgErr_Invalid (""))); f_PkgEntry_pkgEntryDesc = "\233\128\154\231\148\168\230\184\133\229\141\149\228\184\142\229\140\133\229\155\190\233\148\153\232\175\175" }, (B_dData_dList.C_List__x58__x58_ ({ f_PkgEntry_pkgEntryCode = (v_pkgCode (C_PkgErr_InvalidExportModule (""))); f_PkgEntry_pkgEntryTemplate = (v_pkgTemplate (C_PkgErr_InvalidExportModule (""))); f_PkgEntry_pkgEntryDesc = "\233\157\158\230\179\149\229\175\188\229\135\186\230\168\161\229\157\151\229\144\141" }, (B_dData_dList.C_List__x58__x58_ ({ f_PkgEntry_pkgEntryCode = (v_pkgCode (C_PkgErr_InvalidPackageName (""))); f_PkgEntry_pkgEntryTemplate = (v_pkgTemplate (C_PkgErr_InvalidPackageName (""))); f_PkgEntry_pkgEntryDesc = "\233\157\158\230\179\149\229\140\133\229\144\141" }, (B_dData_dList.C_List__x58__x58_ ({ f_PkgEntry_pkgEntryCode = (v_pkgCode (C_PkgErr_MissingManifest (""))); f_PkgEntry_pkgEntryTemplate = (v_pkgTemplate (C_PkgErr_MissingManifest (""))); f_PkgEntry_pkgEntryDesc = "\230\137\190\228\184\141\229\136\176 vuna.toml" }, (B_dData_dList.C_List__x58__x58_ ({ f_PkgEntry_pkgEntryCode = (v_pkgCode (C_PkgErr_MissingBase (""))); f_PkgEntry_pkgEntryTemplate = (v_pkgTemplate (C_PkgErr_MissingBase (""))); f_PkgEntry_pkgEntryDesc = "\230\137\190\228\184\141\229\136\176 vuna-base" }, (B_dData_dList.C_List__x58__x58_ ({ f_PkgEntry_pkgEntryCode = (v_pkgCode (C_PkgErr_LibraryWithoutEntry (""))); f_PkgEntry_pkgEntryTemplate = (v_pkgTemplate (C_PkgErr_LibraryWithoutEntry (""))); f_PkgEntry_pkgEntryDesc = "\229\186\147\229\140\133\231\188\186\229\133\165\229\143\163\230\136\150\229\175\188\229\135\186" }, (B_dData_dList.C_List__x58__x58_ ({ f_PkgEntry_pkgEntryCode = (v_pkgCode (C_PkgErr_NoManifestUpward (""))); f_PkgEntry_pkgEntryTemplate = (v_pkgTemplate (C_PkgErr_NoManifestUpward (""))); f_PkgEntry_pkgEntryDesc = "\229\144\145\228\184\138\230\137\190\228\184\141\229\136\176 vuna.toml" }, (B_dData_dList.C_List__x58__x58_ ({ f_PkgEntry_pkgEntryCode = (v_pkgCode (C_PkgErr_TomlSyntax (""))); f_PkgEntry_pkgEntryTemplate = (v_pkgTemplate (C_PkgErr_TomlSyntax (""))); f_PkgEntry_pkgEntryDesc = "vuna.toml \232\175\173\230\179\149\233\148\153\232\175\175" }, (B_dData_dList.C_List__x58__x58_ ({ f_PkgEntry_pkgEntryCode = (v_pkgCode (C_PkgErr_UnexpectedTopLevelKey (""))); f_PkgEntry_pkgEntryTemplate = (v_pkgTemplate (C_PkgErr_UnexpectedTopLevelKey (""))); f_PkgEntry_pkgEntryDesc = "\233\161\182\229\177\130\230\156\170\231\159\165 key" }, (B_dData_dList.C_List__x58__x58_ ({ f_PkgEntry_pkgEntryCode = (v_pkgCode (C_PkgErr_UnknownSection (""))); f_PkgEntry_pkgEntryTemplate = (v_pkgTemplate (C_PkgErr_UnknownSection (""))); f_PkgEntry_pkgEntryDesc = "\230\156\170\231\159\165 section" }, (B_dData_dList.C_List__x58__x58_ ({ f_PkgEntry_pkgEntryCode = (v_pkgCode (C_PkgErr_LayerInvalidName (""))); f_PkgEntry_pkgEntryTemplate = (v_pkgTemplate (C_PkgErr_LayerInvalidName (""))); f_PkgEntry_pkgEntryDesc = "\229\177\130\229\144\141\233\157\158\230\179\149" }, (B_dData_dList.C_List__x58__x58_ ({ f_PkgEntry_pkgEntryCode = (v_pkgCode (C_PkgErr_LayerInvalidTarget (""))); f_PkgEntry_pkgEntryTemplate = (v_pkgTemplate (C_PkgErr_LayerInvalidTarget (""))); f_PkgEntry_pkgEntryDesc = "\229\177\130\231\155\174\230\160\135\233\157\158\230\179\149" }, (B_dData_dList.C_List__x58__x58_ ({ f_PkgEntry_pkgEntryCode = (v_pkgCode (C_PkgErr_LayerKeyMustBeQuoted (""))); f_PkgEntry_pkgEntryTemplate = (v_pkgTemplate (C_PkgErr_LayerKeyMustBeQuoted (""))); f_PkgEntry_pkgEntryDesc = "\229\177\130\233\148\174\230\156\170\229\138\160\229\188\149\229\143\183" }, (B_dData_dList.C_List__x58__x58_ ({ f_PkgEntry_pkgEntryCode = (v_pkgCode (C_PkgErr_LayerCycle (""))); f_PkgEntry_pkgEntryTemplate = (v_pkgTemplate (C_PkgErr_LayerCycle (""))); f_PkgEntry_pkgEntryDesc = "\229\177\130\228\190\157\232\181\150\229\190\170\231\142\175" }, (B_dData_dList.C_List__x58__x58_ ({ f_PkgEntry_pkgEntryCode = (v_pkgCode (C_PkgErr_PackageSectionInWorkspaceRoot (""))); f_PkgEntry_pkgEntryTemplate = (v_pkgTemplate (C_PkgErr_PackageSectionInWorkspaceRoot (""))); f_PkgEntry_pkgEntryDesc = "\232\153\154\230\139\159\230\160\185\229\135\186\231\142\176\229\140\133\232\175\173\228\185\137\230\174\181" }, (B_dData_dList.C_List__x58__x58_ ({ f_PkgEntry_pkgEntryCode = (v_pkgCode (C_PkgErr_UnknownKey ("", ""))); f_PkgEntry_pkgEntryTemplate = (v_pkgTemplate (C_PkgErr_UnknownKey ("", ""))); f_PkgEntry_pkgEntryDesc = "section \229\134\133\230\156\170\231\159\165 key" }, (B_dData_dList.C_List__x58__x58_ ({ f_PkgEntry_pkgEntryCode = (v_pkgCode (C_PkgErr_UnknownSourceKey ("", ""))); f_PkgEntry_pkgEntryTemplate = (v_pkgTemplate (C_PkgErr_UnknownSourceKey ("", ""))); f_PkgEntry_pkgEntryDesc = "\228\190\157\232\181\150\232\161\168\230\156\170\231\159\165 key" }, (B_dData_dList.C_List__x58__x58_ ({ f_PkgEntry_pkgEntryCode = (v_pkgCode (C_PkgErr_DependencySourceMissing (""))); f_PkgEntry_pkgEntryTemplate = (v_pkgTemplate (C_PkgErr_DependencySourceMissing (""))); f_PkgEntry_pkgEntryDesc = "\228\190\157\232\181\150\230\156\170\230\140\135\229\174\154\230\186\144" }, (B_dData_dList.C_List__x58__x58_ ({ f_PkgEntry_pkgEntryCode = (v_pkgCode (C_PkgErr_GitRevRequired (""))); f_PkgEntry_pkgEntryTemplate = (v_pkgTemplate (C_PkgErr_GitRevRequired (""))); f_PkgEntry_pkgEntryDesc = "git \228\190\157\232\181\150\231\188\186\228\191\174\232\174\162" }, (B_dData_dList.C_List__x58__x58_ ({ f_PkgEntry_pkgEntryCode = (v_pkgCode (C_PkgErr_HashMalformed (""))); f_PkgEntry_pkgEntryTemplate = (v_pkgTemplate (C_PkgErr_HashMalformed (""))); f_PkgEntry_pkgEntryDesc = "\228\190\157\232\181\150\229\147\136\229\184\140\230\160\188\229\188\143\233\157\158\230\179\149" }, (B_dData_dList.C_List__x58__x58_ ({ f_PkgEntry_pkgEntryCode = (v_pkgCode (C_PkgErr_MissingHash (""))); f_PkgEntry_pkgEntryTemplate = (v_pkgTemplate (C_PkgErr_MissingHash (""))); f_PkgEntry_pkgEntryDesc = "\228\184\141\229\143\175\229\143\152\230\186\144\231\188\186\229\147\136\229\184\140" }, (B_dData_dList.C_List__x58__x58_ ({ f_PkgEntry_pkgEntryCode = (v_pkgCode (C_PkgErr_SourceConflict (""))); f_PkgEntry_pkgEntryTemplate = (v_pkgTemplate (C_PkgErr_SourceConflict (""))); f_PkgEntry_pkgEntryDesc = "\228\190\157\232\181\150\230\186\144\229\134\178\231\170\129" }, (B_dData_dList.C_List__x58__x58_ ({ f_PkgEntry_pkgEntryCode = (v_pkgCode (C_PkgErr_NotMaterialized (""))); f_PkgEntry_pkgEntryTemplate = (v_pkgTemplate (C_PkgErr_NotMaterialized (""))); f_PkgEntry_pkgEntryDesc = "\229\140\133\230\156\170\231\137\169\229\140\150" }, (B_dData_dList.C_List__x58__x58_ ({ f_PkgEntry_pkgEntryCode = (v_pkgCode (C_PkgErr_FetchFailed (""))); f_PkgEntry_pkgEntryTemplate = (v_pkgTemplate (C_PkgErr_FetchFailed (""))); f_PkgEntry_pkgEntryDesc = "\229\143\150\229\140\133\229\164\177\232\180\165" }, (B_dData_dList.C_List__x58__x58_ ({ f_PkgEntry_pkgEntryCode = (v_pkgCode (C_PkgErr_IndexMalformed (""))); f_PkgEntry_pkgEntryTemplate = (v_pkgTemplate (C_PkgErr_IndexMalformed (""))); f_PkgEntry_pkgEntryDesc = "\229\140\133\231\180\162\229\188\149\230\160\188\229\188\143\233\157\158\230\179\149" }, (B_dData_dList.C_List__x58__x58_ ({ f_PkgEntry_pkgEntryCode = (v_pkgCode (C_PkgErr_HashMismatch ("", ""))); f_PkgEntry_pkgEntryTemplate = (v_pkgTemplate (C_PkgErr_HashMismatch ("", ""))); f_PkgEntry_pkgEntryDesc = "\229\140\133\229\134\133\229\174\185\230\145\152\232\166\129\228\184\141\231\172\166" }, (B_dData_dList.C_List__x58__x58_ ({ f_PkgEntry_pkgEntryCode = (v_pkgCode (C_PkgErr_IdentityMalformed (""))); f_PkgEntry_pkgEntryTemplate = (v_pkgTemplate (C_PkgErr_IdentityMalformed (""))); f_PkgEntry_pkgEntryDesc = "\228\190\157\232\181\150\232\186\171\228\187\189\230\160\188\229\188\143\233\157\158\230\179\149" }, (B_dData_dList.C_List__x58__x58_ ({ f_PkgEntry_pkgEntryCode = (v_pkgCode (C_PkgErr_IdentityMismatch ("", ""))); f_PkgEntry_pkgEntryTemplate = (v_pkgTemplate (C_PkgErr_IdentityMismatch ("", ""))); f_PkgEntry_pkgEntryDesc = "\229\140\133\232\175\173\228\185\137\232\186\171\228\187\189\228\184\141\231\172\166" }, (B_dData_dList.C_List__x58__x58_ ({ f_PkgEntry_pkgEntryCode = (v_pkgCode (C_PkgErr_DuplicatePackageName ("", "", ""))); f_PkgEntry_pkgEntryTemplate = (v_pkgTemplate (C_PkgErr_DuplicatePackageName ("", "", ""))); f_PkgEntry_pkgEntryDesc = "\228\190\157\232\181\150\229\155\190\229\134\133\229\140\133\229\144\141\233\135\141\229\164\141" }, B_dData_dList.C_List_Nil))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))

# 235 "Vuna/Compiler/Base/Diagnostics/Pkg.vuna"
let v_pkgEntryCode = (fun (dtb_u_u152 : t_PkgEntry) -> (match dtb_u_u152 with
  | { f_PkgEntry_pkgEntryCode = dtb_u_u153; f_PkgEntry_pkgEntryTemplate = dtb_u_u154; f_PkgEntry_pkgEntryDesc = dtb_u_u155 } -> dtb_u_u153
  | _ -> failwith "DT: impossible branch"
))

# 236 "Vuna/Compiler/Base/Diagnostics/Pkg.vuna"
let v_pkgEntryTemplate = (fun (dtb_u_u156 : t_PkgEntry) -> (match dtb_u_u156 with
  | { f_PkgEntry_pkgEntryCode = dtb_u_u157; f_PkgEntry_pkgEntryTemplate = dtb_u_u158; f_PkgEntry_pkgEntryDesc = dtb_u_u159 } -> dtb_u_u158
  | _ -> failwith "DT: impossible branch"
))

# 237 "Vuna/Compiler/Base/Diagnostics/Pkg.vuna"
let v_pkgEntryDesc = (fun (dtb_u_u160 : t_PkgEntry) -> (match dtb_u_u160 with
  | { f_PkgEntry_pkgEntryCode = dtb_u_u161; f_PkgEntry_pkgEntryTemplate = dtb_u_u162; f_PkgEntry_pkgEntryDesc = dtb_u_u163 } -> dtb_u_u163
  | _ -> failwith "DT: impossible branch"
))
