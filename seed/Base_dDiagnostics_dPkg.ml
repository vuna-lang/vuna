open Vuna_runtime
type t_PkgErr = C_PkgErr_EmptyDependencyName | C_PkgErr_EmptyMember | C_PkgErr_EmptyPackageName | C_PkgErr_MissingPackageName | C_PkgErr_EmptyWorkspace | C_PkgErr_NotPackage | C_PkgErr_DependencyPathNotString of (string) | C_PkgErr_DuplicateDependency of (string) | C_PkgErr_EmptyDependencyPath of (string) | C_PkgErr_ExpectedBool of (string) | C_PkgErr_ExpectedString of (string) | C_PkgErr_ExpectedInt of (string) | C_PkgErr_InvalidDiagFormat of (string) | C_PkgErr_InvalidDiagMaxErrors of (string) | C_PkgErr_InvalidDiagLang of (string) | C_PkgErr_ExpectedStringArray of (string) | C_PkgErr_Invalid of (string) | C_PkgErr_InvalidExportModule of (string) | C_PkgErr_InvalidPackageName of (string) | C_PkgErr_MissingManifest of (string) | C_PkgErr_MissingBase of (string) | C_PkgErr_LibraryWithoutEntry of (string) | C_PkgErr_NoManifestUpward of (string) | C_PkgErr_TomlSyntax of (string) | C_PkgErr_DependencySourceMissing of (string) | C_PkgErr_GitRevRequired of (string) | C_PkgErr_HashMalformed of (string) | C_PkgErr_IdentityMalformed of (string) | C_PkgErr_MissingHash of (string) | C_PkgErr_SourceConflict of (string) | C_PkgErr_NotMaterialized of (string) | C_PkgErr_FetchFailed of (string) | C_PkgErr_IndexMalformed of (string) | C_PkgErr_UnexpectedTopLevelKey of (string) | C_PkgErr_UnknownSection of (string) | C_PkgErr_LayerInvalidName of (string) | C_PkgErr_LayerInvalidTarget of (string) | C_PkgErr_LayerKeyMustBeQuoted of (string) | C_PkgErr_LayerCycle of (string) | C_PkgErr_PackageSectionInWorkspaceRoot of (string) | C_PkgErr_UnknownKey of (string) * (string) | C_PkgErr_UnknownSourceKey of (string) * (string) | C_PkgErr_HashMismatch of (string) * (string) | C_PkgErr_IdentityMismatch of (string) * (string) | C_PkgErr_DuplicatePackageName of (string) * (string) * (string)
and t_PkgEntry = { f_PkgEntry_pkgEntryCode : string; f_PkgEntry_pkgEntryTemplate : string; f_PkgEntry_pkgEntryDesc : string }

# 67 "Vuna/Compiler/Base/Diagnostics/Pkg.vuna"
let v_pkgCode = (fun (mc0 : t_PkgErr) -> (match mc0 with
  | C_PkgErr_DuplicatePackageName (dtb__0, dtb__1, dtb__2) -> "PKG_DuplicatePackageName"
  | C_PkgErr_IdentityMismatch (dtb__3, dtb__4) -> "PKG_IdentityMismatch"
  | C_PkgErr_HashMismatch (dtb__5, dtb__6) -> "PKG_HashMismatch"
  | C_PkgErr_IndexMalformed (dtb__7) -> "PKG_IndexMalformed"
  | C_PkgErr_FetchFailed (dtb__8) -> "PKG_FetchFailed"
  | C_PkgErr_NotMaterialized (dtb__9) -> "PKG_NotMaterialized"
  | C_PkgErr_SourceConflict (dtb__10) -> "PKG_SourceConflict"
  | C_PkgErr_MissingHash (dtb__11) -> "PKG_MissingHash"
  | C_PkgErr_IdentityMalformed (dtb__12) -> "PKG_IdentityMalformed"
  | C_PkgErr_HashMalformed (dtb__13) -> "PKG_HashMalformed"
  | C_PkgErr_GitRevRequired (dtb__14) -> "PKG_GitRevRequired"
  | C_PkgErr_DependencySourceMissing (dtb__15) -> "PKG_DependencySourceMissing"
  | C_PkgErr_UnknownSourceKey (dtb__16, dtb__17) -> "PKG_UnknownSourceKey"
  | C_PkgErr_UnknownKey (dtb__18, dtb__19) -> "PKG_UnknownKey"
  | C_PkgErr_PackageSectionInWorkspaceRoot (dtb__20) -> "PKG_PackageSectionInWorkspaceRoot"
  | C_PkgErr_LayerCycle (dtb__21) -> "PKG_LayerCycle"
  | C_PkgErr_LayerKeyMustBeQuoted (dtb__22) -> "PKG_LayerKeyMustBeQuoted"
  | C_PkgErr_LayerInvalidTarget (dtb__23) -> "PKG_LayerInvalidTarget"
  | C_PkgErr_LayerInvalidName (dtb__24) -> "PKG_LayerInvalidName"
  | C_PkgErr_UnknownSection (dtb__25) -> "PKG_UnknownSection"
  | C_PkgErr_UnexpectedTopLevelKey (dtb__26) -> "PKG_UnexpectedTopLevelKey"
  | C_PkgErr_TomlSyntax (dtb__27) -> "PKG_TomlSyntax"
  | C_PkgErr_NoManifestUpward (dtb__28) -> "PKG_NoManifestUpward"
  | C_PkgErr_LibraryWithoutEntry (dtb__29) -> "PKG_LibraryWithoutEntry"
  | C_PkgErr_MissingBase (dtb__30) -> "PKG_MissingBase"
  | C_PkgErr_MissingManifest (dtb__31) -> "PKG_MissingManifest"
  | C_PkgErr_InvalidPackageName (dtb__32) -> "PKG_InvalidPackageName"
  | C_PkgErr_InvalidExportModule (dtb__33) -> "PKG_InvalidExportModule"
  | C_PkgErr_Invalid (dtb__34) -> "PKG_Invalid"
  | C_PkgErr_ExpectedStringArray (dtb__35) -> "PKG_ExpectedStringArray"
  | C_PkgErr_InvalidDiagLang (dtb__36) -> "PKG_InvalidDiagLang"
  | C_PkgErr_InvalidDiagMaxErrors (dtb__37) -> "PKG_InvalidDiagMaxErrors"
  | C_PkgErr_InvalidDiagFormat (dtb__38) -> "PKG_InvalidDiagFormat"
  | C_PkgErr_ExpectedInt (dtb__39) -> "PKG_ExpectedInt"
  | C_PkgErr_ExpectedString (dtb__40) -> "PKG_ExpectedString"
  | C_PkgErr_ExpectedBool (dtb__41) -> "PKG_ExpectedBool"
  | C_PkgErr_EmptyDependencyPath (dtb__42) -> "PKG_EmptyDependencyPath"
  | C_PkgErr_DuplicateDependency (dtb__43) -> "PKG_DuplicateDependency"
  | C_PkgErr_DependencyPathNotString (dtb__44) -> "PKG_DependencyPathNotString"
  | C_PkgErr_NotPackage -> "PKG_NotPackage"
  | C_PkgErr_EmptyWorkspace -> "PKG_EmptyWorkspace"
  | C_PkgErr_MissingPackageName -> "PKG_MissingPackageName"
  | C_PkgErr_EmptyPackageName -> "PKG_EmptyPackageName"
  | C_PkgErr_EmptyMember -> "PKG_EmptyMember"
  | C_PkgErr_EmptyDependencyName -> "PKG_EmptyDependencyName"
  | _ -> failwith "DT: impossible branch"
))

# 115 "Vuna/Compiler/Base/Diagnostics/Pkg.vuna"
let v_pkgTemplate = (fun (mc0 : t_PkgErr) -> (match mc0 with
  | C_PkgErr_DuplicatePackageName (dtb__45, dtb__46, dtb__47) -> "duplicate package name \"<0>\" in <1> and <2> (package names must be unique within a dependency graph)"
  | C_PkgErr_IdentityMismatch (dtb__48, dtb__49) -> "package \"<0>\" identity mismatch: <1>"
  | C_PkgErr_HashMismatch (dtb__50, dtb__51) -> "package \"<0>\" content hash mismatch: <1>"
  | C_PkgErr_IndexMalformed (dtb__52) -> "invalid package index: <0>"
  | C_PkgErr_FetchFailed (dtb__53) -> "cannot fetch package: <0>"
  | C_PkgErr_NotMaterialized (dtb__54) -> "package \"<0>\" is not in the local store (run: vuna deps fetch)"
  | C_PkgErr_SourceConflict (dtb__55) -> "dependency \"<0>\" specifies more than one source (path / git / url)"
  | C_PkgErr_MissingHash (dtb__56) -> "dependency \"<0>\" must have a hash (only path dependencies may omit it)"
  | C_PkgErr_IdentityMalformed (dtb__57) -> "invalid dependency identity \"<0>\" (expected sha256:<64 hex>)"
  | C_PkgErr_HashMalformed (dtb__58) -> "invalid dependency hash \"<0>\" (expected sha256:<64 hex>)"
  | C_PkgErr_GitRevRequired (dtb__59) -> "missing rev for git dependency \"<0>\""
  | C_PkgErr_DependencySourceMissing (dtb__60) -> "dependency \"<0>\" must specify path, git (with rev) or url"
  | C_PkgErr_UnknownSourceKey (dtb__61, dtb__62) -> "unknown key \"<0>\" in [dependencies.<1>]"
  | C_PkgErr_UnknownKey (dtb__63, dtb__64) -> "unknown key \"<0>\" in [<1>]"
  | C_PkgErr_PackageSectionInWorkspaceRoot (dtb__65) -> "section [<0>] is not allowed in a workspace root without [package]"
  | C_PkgErr_LayerCycle (dtb__66) -> "layer dependency cycle: <0>"
  | C_PkgErr_LayerKeyMustBeQuoted (dtb__67) -> "layer \"<0>\" must be a quoted key in [layers] (\"<0>\" = [...])"
  | C_PkgErr_LayerInvalidTarget (dtb__68) -> "invalid layer target \"<0>\" (expected a module prefix such as Vuna.Compiler.Base)"
  | C_PkgErr_LayerInvalidName (dtb__69) -> "invalid layer name \"<0>\" (expected a module prefix such as Vuna.Compiler.Ir)"
  | C_PkgErr_UnknownSection (dtb__70) -> "unknown section [<0>]"
  | C_PkgErr_UnexpectedTopLevelKey (dtb__71) -> "unexpected top-level key \"<0>\""
  | C_PkgErr_TomlSyntax (dtb__72) -> "<0>"
  | C_PkgErr_NoManifestUpward (dtb__73) -> "missing vuna.toml upward from <0>"
  | C_PkgErr_LibraryWithoutEntry (dtb__74) -> "library package <0> must have app/Main.vuna (executable) or [export].modules (library)"
  | C_PkgErr_MissingBase (dtb__75) -> "cannot locate vuna-base: tried <0> (set VUNA_BASE to a directory containing vuna.toml)"
  | C_PkgErr_MissingManifest (dtb__76) -> "missing vuna.toml in <0>"
  | C_PkgErr_InvalidPackageName (dtb__77) -> "invalid package name \"<0>\" (allowed characters: a-z, 0-9, '-')"
  | C_PkgErr_InvalidExportModule (dtb__78) -> "invalid export module \"<0>\" (segments must match [A-Z][A-Za-z0-9_]*)"
  | C_PkgErr_Invalid (dtb__79) -> "<0>"
  | C_PkgErr_ExpectedStringArray (dtb__80) -> "expected an array of strings for \"<0>\""
  | C_PkgErr_InvalidDiagLang (dtb__81) -> "invalid [diagnostics] lang \"<0>\" (expected en|zh)"
  | C_PkgErr_InvalidDiagMaxErrors (dtb__82) -> "invalid [diagnostics] max-errors \"<0>\" (expected a positive integer)"
  | C_PkgErr_InvalidDiagFormat (dtb__83) -> "invalid [diagnostics] format \"<0>\" (expected short|human|json|sarif)"
  | C_PkgErr_ExpectedInt (dtb__84) -> "expected an integer for \"<0>\""
  | C_PkgErr_ExpectedString (dtb__85) -> "expected a string for \"<0>\""
  | C_PkgErr_ExpectedBool (dtb__86) -> "expected a boolean for \"<0>\""
  | C_PkgErr_EmptyDependencyPath (dtb__87) -> "dependency \"<0>\" path must not be empty"
  | C_PkgErr_DuplicateDependency (dtb__88) -> "duplicate dependency \"<0>\""
  | C_PkgErr_DependencyPathNotString (dtb__89) -> "dependency \"<0>\" must have a string relative path"
  | C_PkgErr_NotPackage -> "manifest has no [package] (a workspace root is not a package; run inside a member package)"
  | C_PkgErr_EmptyWorkspace -> "workspace root without [package] must declare [workspace].members"
  | C_PkgErr_MissingPackageName -> "missing [package] name"
  | C_PkgErr_EmptyPackageName -> "package name must not be empty"
  | C_PkgErr_EmptyMember -> "workspace member must not be empty"
  | C_PkgErr_EmptyDependencyName -> "dependency name must not be empty"
  | _ -> failwith "DT: impossible branch"
))

# 178 "Vuna/Compiler/Base/Diagnostics/Pkg.vuna"
let v_pkgMsg = (fun (e : t_PkgErr) (args : string B_dData_dVec.t_Vec) -> (((((Base_dDiag.v_diagNoLoc Base_dDiag.C_Severity_SevError) Base_dDiag.C_Phase_PhLoad) Base_dDiag.C_Category_CatPackage) (v_pkgCode e)) ((Base_dDiagnostics_dCommon.v_diagBody (v_pkgTemplate e)) args)))

# 182 "Vuna/Compiler/Base/Diagnostics/Pkg.vuna"
let v_pkgSpan = (fun (path : string) (line : int) -> (if (path = "") then B_dData_dMaybe.C_Maybe_Nothing else (B_dData_dMaybe.C_Maybe_Just ({ Base_dSource.f_Span_spanFile = path; Base_dSource.f_Span_spanStartLine = line; Base_dSource.f_Span_spanStartCol = 1; Base_dSource.f_Span_spanEndLine = line; Base_dSource.f_Span_spanEndCol = 1; Base_dSource.f_Span_spanStartOffset = 0; Base_dSource.f_Span_spanEndOffset = 0 }))))

# 186 "Vuna/Compiler/Base/Diagnostics/Pkg.vuna"
let v_atSpan = (fun (mc0 : Base_dSource.t_Span B_dData_dMaybe.t_Maybe) (mc1 : Base_dDiag.t_Diagnostic) -> (match mc0 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__90) -> ((Base_dDiag.v_withLabel { Base_dDiag.f_Label_labelSpan = (B_dData_dMaybe.C_Maybe_Just (dtb__90)); Base_dDiag.f_Label_labelText = ""; Base_dDiag.f_Label_labelStyle = Base_dDiag.C_LabelStyle_LabelPrimary; Base_dDiag.f_Label_labelProvenance = B_dData_dMaybe.C_Maybe_Nothing }) mc1)
  | B_dData_dMaybe.C_Maybe_Nothing -> mc1
  | _ -> failwith "DT: impossible branch"
))

# 191 "Vuna/Compiler/Base/Diagnostics/Pkg.vuna"
let v_pkgAt = (fun (path : string) (line : int) (e : t_PkgErr) (args : string B_dData_dVec.t_Vec) -> (Base_dDiag.C_Check_ErrC (((v_atSpan ((v_pkgSpan path) line)) ((v_pkgMsg e) args)))))

# 195 "Vuna/Compiler/Base/Diagnostics/Pkg.vuna"
let v_pkgPath = (fun (path : string) (e : t_PkgErr) (args : string B_dData_dVec.t_Vec) -> ((((v_pkgAt path) 1) e) args))

# 199 "Vuna/Compiler/Base/Diagnostics/Pkg.vuna"
let v_pkgNoLoc = (fun (e : t_PkgErr) (args : string B_dData_dVec.t_Vec) -> (Base_dDiag.C_Check_ErrC (((Base_dDiag.v_withAbsent Base_dDiag.C_NoSourceReason_NsPackageGraph) ((v_pkgMsg e) args)))))

# 203 "Vuna/Compiler/Base/Diagnostics/Pkg.vuna"
let v_pkgNoLoc1 = (fun (e : t_PkgErr) (a0 : string) -> ((v_pkgNoLoc e) (B_dData_dVec.C_Vec_VCons (a0, B_dData_dVec.C_Vec_Nil))))

# 207 "Vuna/Compiler/Base/Diagnostics/Pkg.vuna"
let v_pkgAt0 = (fun (path : string) (line : int) (e : t_PkgErr) -> ((((v_pkgAt path) line) e) B_dData_dVec.C_Vec_Nil))

# 211 "Vuna/Compiler/Base/Diagnostics/Pkg.vuna"
let v_pkgAt1 = (fun (path : string) (line : int) (e : t_PkgErr) (a0 : string) -> ((((v_pkgAt path) line) e) (B_dData_dVec.C_Vec_VCons (a0, B_dData_dVec.C_Vec_Nil))))

# 215 "Vuna/Compiler/Base/Diagnostics/Pkg.vuna"
let v_pkgAt2 = (fun (path : string) (line : int) (e : t_PkgErr) (a0 : string) (a1 : string) -> ((((v_pkgAt path) line) e) (B_dData_dVec.C_Vec_VCons (a0, (B_dData_dVec.C_Vec_VCons (a1, B_dData_dVec.C_Vec_Nil))))))

# 219 "Vuna/Compiler/Base/Diagnostics/Pkg.vuna"
let v_pkgPath0 = (fun (path : string) (e : t_PkgErr) -> (((v_pkgPath path) e) B_dData_dVec.C_Vec_Nil))

# 223 "Vuna/Compiler/Base/Diagnostics/Pkg.vuna"
let v_pkgPath1 = (fun (path : string) (e : t_PkgErr) (a0 : string) -> (((v_pkgPath path) e) (B_dData_dVec.C_Vec_VCons (a0, B_dData_dVec.C_Vec_Nil))))

# 227 "Vuna/Compiler/Base/Diagnostics/Pkg.vuna"
let v_pkgPath2 = (fun (path : string) (e : t_PkgErr) (a0 : string) (a1 : string) -> (((v_pkgPath path) e) (B_dData_dVec.C_Vec_VCons (a0, (B_dData_dVec.C_Vec_VCons (a1, B_dData_dVec.C_Vec_Nil))))))

# 231 "Vuna/Compiler/Base/Diagnostics/Pkg.vuna"
let v_pkgInvalid = (fun (msg : string) -> ((v_pkgNoLoc (C_PkgErr_Invalid (msg))) (B_dData_dVec.C_Vec_VCons (msg, B_dData_dVec.C_Vec_Nil))))

# 241 "Vuna/Compiler/Base/Diagnostics/Pkg.vuna"
let v_pkgAll = (B_dData_dList.C_List__x58__x58_ ({ f_PkgEntry_pkgEntryCode = (v_pkgCode C_PkgErr_EmptyDependencyName); f_PkgEntry_pkgEntryTemplate = (v_pkgTemplate C_PkgErr_EmptyDependencyName); f_PkgEntry_pkgEntryDesc = "\228\190\157\232\181\150\229\144\141\228\184\186\231\169\186" }, (B_dData_dList.C_List__x58__x58_ ({ f_PkgEntry_pkgEntryCode = (v_pkgCode C_PkgErr_EmptyMember); f_PkgEntry_pkgEntryTemplate = (v_pkgTemplate C_PkgErr_EmptyMember); f_PkgEntry_pkgEntryDesc = "workspace \230\136\144\229\145\152\228\184\186\231\169\186" }, (B_dData_dList.C_List__x58__x58_ ({ f_PkgEntry_pkgEntryCode = (v_pkgCode C_PkgErr_EmptyPackageName); f_PkgEntry_pkgEntryTemplate = (v_pkgTemplate C_PkgErr_EmptyPackageName); f_PkgEntry_pkgEntryDesc = "\229\140\133\229\144\141\228\184\186\231\169\186" }, (B_dData_dList.C_List__x58__x58_ ({ f_PkgEntry_pkgEntryCode = (v_pkgCode C_PkgErr_MissingPackageName); f_PkgEntry_pkgEntryTemplate = (v_pkgTemplate C_PkgErr_MissingPackageName); f_PkgEntry_pkgEntryDesc = "\231\188\186 [package] \231\154\132 name" }, (B_dData_dList.C_List__x58__x58_ ({ f_PkgEntry_pkgEntryCode = (v_pkgCode C_PkgErr_EmptyWorkspace); f_PkgEntry_pkgEntryTemplate = (v_pkgTemplate C_PkgErr_EmptyWorkspace); f_PkgEntry_pkgEntryDesc = "\232\153\154\230\139\159 workspace \230\160\185\230\178\161\230\156\137 members" }, (B_dData_dList.C_List__x58__x58_ ({ f_PkgEntry_pkgEntryCode = (v_pkgCode C_PkgErr_NotPackage); f_PkgEntry_pkgEntryTemplate = (v_pkgTemplate C_PkgErr_NotPackage); f_PkgEntry_pkgEntryDesc = "workspace \230\160\185\228\184\141\232\131\189\229\189\147\229\140\133\228\189\191\231\148\168" }, (B_dData_dList.C_List__x58__x58_ ({ f_PkgEntry_pkgEntryCode = (v_pkgCode (C_PkgErr_DependencyPathNotString (""))); f_PkgEntry_pkgEntryTemplate = (v_pkgTemplate (C_PkgErr_DependencyPathNotString (""))); f_PkgEntry_pkgEntryDesc = "\228\190\157\232\181\150\232\183\175\229\190\132\229\191\133\233\161\187\230\152\175\229\173\151\231\172\166\228\184\178" }, (B_dData_dList.C_List__x58__x58_ ({ f_PkgEntry_pkgEntryCode = (v_pkgCode (C_PkgErr_DuplicateDependency (""))); f_PkgEntry_pkgEntryTemplate = (v_pkgTemplate (C_PkgErr_DuplicateDependency (""))); f_PkgEntry_pkgEntryDesc = "\233\135\141\229\164\141\228\190\157\232\181\150" }, (B_dData_dList.C_List__x58__x58_ ({ f_PkgEntry_pkgEntryCode = (v_pkgCode (C_PkgErr_EmptyDependencyPath (""))); f_PkgEntry_pkgEntryTemplate = (v_pkgTemplate (C_PkgErr_EmptyDependencyPath (""))); f_PkgEntry_pkgEntryDesc = "\228\190\157\232\181\150\232\183\175\229\190\132\228\184\186\231\169\186" }, (B_dData_dList.C_List__x58__x58_ ({ f_PkgEntry_pkgEntryCode = (v_pkgCode (C_PkgErr_ExpectedBool (""))); f_PkgEntry_pkgEntryTemplate = (v_pkgTemplate (C_PkgErr_ExpectedBool (""))); f_PkgEntry_pkgEntryDesc = "\229\184\131\229\176\148\229\173\151\230\174\181\231\177\187\229\158\139\233\148\153\232\175\175" }, (B_dData_dList.C_List__x58__x58_ ({ f_PkgEntry_pkgEntryCode = (v_pkgCode (C_PkgErr_ExpectedString (""))); f_PkgEntry_pkgEntryTemplate = (v_pkgTemplate (C_PkgErr_ExpectedString (""))); f_PkgEntry_pkgEntryDesc = "\229\173\151\231\172\166\228\184\178\229\173\151\230\174\181\231\177\187\229\158\139\233\148\153\232\175\175" }, (B_dData_dList.C_List__x58__x58_ ({ f_PkgEntry_pkgEntryCode = (v_pkgCode (C_PkgErr_ExpectedInt (""))); f_PkgEntry_pkgEntryTemplate = (v_pkgTemplate (C_PkgErr_ExpectedInt (""))); f_PkgEntry_pkgEntryDesc = "\230\149\180\230\149\176\229\173\151\230\174\181\231\177\187\229\158\139\233\148\153\232\175\175" }, (B_dData_dList.C_List__x58__x58_ ({ f_PkgEntry_pkgEntryCode = (v_pkgCode (C_PkgErr_InvalidDiagFormat (""))); f_PkgEntry_pkgEntryTemplate = (v_pkgTemplate (C_PkgErr_InvalidDiagFormat (""))); f_PkgEntry_pkgEntryDesc = "\233\157\158\230\179\149\232\175\138\230\150\173\230\160\188\229\188\143" }, (B_dData_dList.C_List__x58__x58_ ({ f_PkgEntry_pkgEntryCode = (v_pkgCode (C_PkgErr_InvalidDiagMaxErrors (""))); f_PkgEntry_pkgEntryTemplate = (v_pkgTemplate (C_PkgErr_InvalidDiagMaxErrors (""))); f_PkgEntry_pkgEntryDesc = "\233\157\158\230\179\149 max-errors" }, (B_dData_dList.C_List__x58__x58_ ({ f_PkgEntry_pkgEntryCode = (v_pkgCode (C_PkgErr_InvalidDiagLang (""))); f_PkgEntry_pkgEntryTemplate = (v_pkgTemplate (C_PkgErr_InvalidDiagLang (""))); f_PkgEntry_pkgEntryDesc = "\233\157\158\230\179\149\232\175\138\230\150\173\232\175\173\232\168\128" }, (B_dData_dList.C_List__x58__x58_ ({ f_PkgEntry_pkgEntryCode = (v_pkgCode (C_PkgErr_ExpectedStringArray (""))); f_PkgEntry_pkgEntryTemplate = (v_pkgTemplate (C_PkgErr_ExpectedStringArray (""))); f_PkgEntry_pkgEntryDesc = "\229\173\151\231\172\166\228\184\178\230\149\176\231\187\132\229\173\151\230\174\181\231\177\187\229\158\139\233\148\153\232\175\175" }, (B_dData_dList.C_List__x58__x58_ ({ f_PkgEntry_pkgEntryCode = (v_pkgCode (C_PkgErr_Invalid (""))); f_PkgEntry_pkgEntryTemplate = (v_pkgTemplate (C_PkgErr_Invalid (""))); f_PkgEntry_pkgEntryDesc = "\233\128\154\231\148\168\230\184\133\229\141\149\228\184\142\229\140\133\229\155\190\233\148\153\232\175\175" }, (B_dData_dList.C_List__x58__x58_ ({ f_PkgEntry_pkgEntryCode = (v_pkgCode (C_PkgErr_InvalidExportModule (""))); f_PkgEntry_pkgEntryTemplate = (v_pkgTemplate (C_PkgErr_InvalidExportModule (""))); f_PkgEntry_pkgEntryDesc = "\233\157\158\230\179\149\229\175\188\229\135\186\230\168\161\229\157\151\229\144\141" }, (B_dData_dList.C_List__x58__x58_ ({ f_PkgEntry_pkgEntryCode = (v_pkgCode (C_PkgErr_InvalidPackageName (""))); f_PkgEntry_pkgEntryTemplate = (v_pkgTemplate (C_PkgErr_InvalidPackageName (""))); f_PkgEntry_pkgEntryDesc = "\233\157\158\230\179\149\229\140\133\229\144\141" }, (B_dData_dList.C_List__x58__x58_ ({ f_PkgEntry_pkgEntryCode = (v_pkgCode (C_PkgErr_MissingManifest (""))); f_PkgEntry_pkgEntryTemplate = (v_pkgTemplate (C_PkgErr_MissingManifest (""))); f_PkgEntry_pkgEntryDesc = "\230\137\190\228\184\141\229\136\176 vuna.toml" }, (B_dData_dList.C_List__x58__x58_ ({ f_PkgEntry_pkgEntryCode = (v_pkgCode (C_PkgErr_MissingBase (""))); f_PkgEntry_pkgEntryTemplate = (v_pkgTemplate (C_PkgErr_MissingBase (""))); f_PkgEntry_pkgEntryDesc = "\230\137\190\228\184\141\229\136\176 vuna-base" }, (B_dData_dList.C_List__x58__x58_ ({ f_PkgEntry_pkgEntryCode = (v_pkgCode (C_PkgErr_LibraryWithoutEntry (""))); f_PkgEntry_pkgEntryTemplate = (v_pkgTemplate (C_PkgErr_LibraryWithoutEntry (""))); f_PkgEntry_pkgEntryDesc = "\229\186\147\229\140\133\231\188\186\229\133\165\229\143\163\230\136\150\229\175\188\229\135\186" }, (B_dData_dList.C_List__x58__x58_ ({ f_PkgEntry_pkgEntryCode = (v_pkgCode (C_PkgErr_NoManifestUpward (""))); f_PkgEntry_pkgEntryTemplate = (v_pkgTemplate (C_PkgErr_NoManifestUpward (""))); f_PkgEntry_pkgEntryDesc = "\229\144\145\228\184\138\230\137\190\228\184\141\229\136\176 vuna.toml" }, (B_dData_dList.C_List__x58__x58_ ({ f_PkgEntry_pkgEntryCode = (v_pkgCode (C_PkgErr_TomlSyntax (""))); f_PkgEntry_pkgEntryTemplate = (v_pkgTemplate (C_PkgErr_TomlSyntax (""))); f_PkgEntry_pkgEntryDesc = "vuna.toml \232\175\173\230\179\149\233\148\153\232\175\175" }, (B_dData_dList.C_List__x58__x58_ ({ f_PkgEntry_pkgEntryCode = (v_pkgCode (C_PkgErr_UnexpectedTopLevelKey (""))); f_PkgEntry_pkgEntryTemplate = (v_pkgTemplate (C_PkgErr_UnexpectedTopLevelKey (""))); f_PkgEntry_pkgEntryDesc = "\233\161\182\229\177\130\230\156\170\231\159\165 key" }, (B_dData_dList.C_List__x58__x58_ ({ f_PkgEntry_pkgEntryCode = (v_pkgCode (C_PkgErr_UnknownSection (""))); f_PkgEntry_pkgEntryTemplate = (v_pkgTemplate (C_PkgErr_UnknownSection (""))); f_PkgEntry_pkgEntryDesc = "\230\156\170\231\159\165 section" }, (B_dData_dList.C_List__x58__x58_ ({ f_PkgEntry_pkgEntryCode = (v_pkgCode (C_PkgErr_LayerInvalidName (""))); f_PkgEntry_pkgEntryTemplate = (v_pkgTemplate (C_PkgErr_LayerInvalidName (""))); f_PkgEntry_pkgEntryDesc = "\229\177\130\229\144\141\233\157\158\230\179\149" }, (B_dData_dList.C_List__x58__x58_ ({ f_PkgEntry_pkgEntryCode = (v_pkgCode (C_PkgErr_LayerInvalidTarget (""))); f_PkgEntry_pkgEntryTemplate = (v_pkgTemplate (C_PkgErr_LayerInvalidTarget (""))); f_PkgEntry_pkgEntryDesc = "\229\177\130\231\155\174\230\160\135\233\157\158\230\179\149" }, (B_dData_dList.C_List__x58__x58_ ({ f_PkgEntry_pkgEntryCode = (v_pkgCode (C_PkgErr_LayerKeyMustBeQuoted (""))); f_PkgEntry_pkgEntryTemplate = (v_pkgTemplate (C_PkgErr_LayerKeyMustBeQuoted (""))); f_PkgEntry_pkgEntryDesc = "\229\177\130\233\148\174\230\156\170\229\138\160\229\188\149\229\143\183" }, (B_dData_dList.C_List__x58__x58_ ({ f_PkgEntry_pkgEntryCode = (v_pkgCode (C_PkgErr_LayerCycle (""))); f_PkgEntry_pkgEntryTemplate = (v_pkgTemplate (C_PkgErr_LayerCycle (""))); f_PkgEntry_pkgEntryDesc = "\229\177\130\228\190\157\232\181\150\229\190\170\231\142\175" }, (B_dData_dList.C_List__x58__x58_ ({ f_PkgEntry_pkgEntryCode = (v_pkgCode (C_PkgErr_PackageSectionInWorkspaceRoot (""))); f_PkgEntry_pkgEntryTemplate = (v_pkgTemplate (C_PkgErr_PackageSectionInWorkspaceRoot (""))); f_PkgEntry_pkgEntryDesc = "\232\153\154\230\139\159\230\160\185\229\135\186\231\142\176\229\140\133\232\175\173\228\185\137\230\174\181" }, (B_dData_dList.C_List__x58__x58_ ({ f_PkgEntry_pkgEntryCode = (v_pkgCode (C_PkgErr_UnknownKey ("", ""))); f_PkgEntry_pkgEntryTemplate = (v_pkgTemplate (C_PkgErr_UnknownKey ("", ""))); f_PkgEntry_pkgEntryDesc = "section \229\134\133\230\156\170\231\159\165 key" }, (B_dData_dList.C_List__x58__x58_ ({ f_PkgEntry_pkgEntryCode = (v_pkgCode (C_PkgErr_UnknownSourceKey ("", ""))); f_PkgEntry_pkgEntryTemplate = (v_pkgTemplate (C_PkgErr_UnknownSourceKey ("", ""))); f_PkgEntry_pkgEntryDesc = "\228\190\157\232\181\150\232\161\168\230\156\170\231\159\165 key" }, (B_dData_dList.C_List__x58__x58_ ({ f_PkgEntry_pkgEntryCode = (v_pkgCode (C_PkgErr_DependencySourceMissing (""))); f_PkgEntry_pkgEntryTemplate = (v_pkgTemplate (C_PkgErr_DependencySourceMissing (""))); f_PkgEntry_pkgEntryDesc = "\228\190\157\232\181\150\230\156\170\230\140\135\229\174\154\230\186\144" }, (B_dData_dList.C_List__x58__x58_ ({ f_PkgEntry_pkgEntryCode = (v_pkgCode (C_PkgErr_GitRevRequired (""))); f_PkgEntry_pkgEntryTemplate = (v_pkgTemplate (C_PkgErr_GitRevRequired (""))); f_PkgEntry_pkgEntryDesc = "git \228\190\157\232\181\150\231\188\186\228\191\174\232\174\162" }, (B_dData_dList.C_List__x58__x58_ ({ f_PkgEntry_pkgEntryCode = (v_pkgCode (C_PkgErr_HashMalformed (""))); f_PkgEntry_pkgEntryTemplate = (v_pkgTemplate (C_PkgErr_HashMalformed (""))); f_PkgEntry_pkgEntryDesc = "\228\190\157\232\181\150\229\147\136\229\184\140\230\160\188\229\188\143\233\157\158\230\179\149" }, (B_dData_dList.C_List__x58__x58_ ({ f_PkgEntry_pkgEntryCode = (v_pkgCode (C_PkgErr_MissingHash (""))); f_PkgEntry_pkgEntryTemplate = (v_pkgTemplate (C_PkgErr_MissingHash (""))); f_PkgEntry_pkgEntryDesc = "\228\184\141\229\143\175\229\143\152\230\186\144\231\188\186\229\147\136\229\184\140" }, (B_dData_dList.C_List__x58__x58_ ({ f_PkgEntry_pkgEntryCode = (v_pkgCode (C_PkgErr_SourceConflict (""))); f_PkgEntry_pkgEntryTemplate = (v_pkgTemplate (C_PkgErr_SourceConflict (""))); f_PkgEntry_pkgEntryDesc = "\228\190\157\232\181\150\230\186\144\229\134\178\231\170\129" }, (B_dData_dList.C_List__x58__x58_ ({ f_PkgEntry_pkgEntryCode = (v_pkgCode (C_PkgErr_NotMaterialized (""))); f_PkgEntry_pkgEntryTemplate = (v_pkgTemplate (C_PkgErr_NotMaterialized (""))); f_PkgEntry_pkgEntryDesc = "\229\140\133\230\156\170\231\137\169\229\140\150" }, (B_dData_dList.C_List__x58__x58_ ({ f_PkgEntry_pkgEntryCode = (v_pkgCode (C_PkgErr_FetchFailed (""))); f_PkgEntry_pkgEntryTemplate = (v_pkgTemplate (C_PkgErr_FetchFailed (""))); f_PkgEntry_pkgEntryDesc = "\229\143\150\229\140\133\229\164\177\232\180\165" }, (B_dData_dList.C_List__x58__x58_ ({ f_PkgEntry_pkgEntryCode = (v_pkgCode (C_PkgErr_IndexMalformed (""))); f_PkgEntry_pkgEntryTemplate = (v_pkgTemplate (C_PkgErr_IndexMalformed (""))); f_PkgEntry_pkgEntryDesc = "\229\140\133\231\180\162\229\188\149\230\160\188\229\188\143\233\157\158\230\179\149" }, (B_dData_dList.C_List__x58__x58_ ({ f_PkgEntry_pkgEntryCode = (v_pkgCode (C_PkgErr_HashMismatch ("", ""))); f_PkgEntry_pkgEntryTemplate = (v_pkgTemplate (C_PkgErr_HashMismatch ("", ""))); f_PkgEntry_pkgEntryDesc = "\229\140\133\229\134\133\229\174\185\230\145\152\232\166\129\228\184\141\231\172\166" }, (B_dData_dList.C_List__x58__x58_ ({ f_PkgEntry_pkgEntryCode = (v_pkgCode (C_PkgErr_IdentityMalformed (""))); f_PkgEntry_pkgEntryTemplate = (v_pkgTemplate (C_PkgErr_IdentityMalformed (""))); f_PkgEntry_pkgEntryDesc = "\228\190\157\232\181\150\232\186\171\228\187\189\230\160\188\229\188\143\233\157\158\230\179\149" }, (B_dData_dList.C_List__x58__x58_ ({ f_PkgEntry_pkgEntryCode = (v_pkgCode (C_PkgErr_IdentityMismatch ("", ""))); f_PkgEntry_pkgEntryTemplate = (v_pkgTemplate (C_PkgErr_IdentityMismatch ("", ""))); f_PkgEntry_pkgEntryDesc = "\229\140\133\232\175\173\228\185\137\232\186\171\228\187\189\228\184\141\231\172\166" }, (B_dData_dList.C_List__x58__x58_ ({ f_PkgEntry_pkgEntryCode = (v_pkgCode (C_PkgErr_DuplicatePackageName ("", "", ""))); f_PkgEntry_pkgEntryTemplate = (v_pkgTemplate (C_PkgErr_DuplicatePackageName ("", "", ""))); f_PkgEntry_pkgEntryDesc = "\228\190\157\232\181\150\229\155\190\229\134\133\229\140\133\229\144\141\233\135\141\229\164\141" }, B_dData_dList.C_List_Nil))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))
