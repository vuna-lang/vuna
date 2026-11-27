open Vuna_runtime
type t_RnErr = C_RnErr_DuplicateImport | C_RnErr_AmbiguousConstructorExport of (string) | C_RnErr_SelectorNotRecord of (string) | C_RnErr_AmbiguousModule of (string) * (string) | C_RnErr_DuplicateFixity of (string) | C_RnErr_BuiltinFixity of (string) | C_RnErr_CannotExportUnknownName of (string) | C_RnErr_DuplicateExport of (string) | C_RnErr_DuplicateModuleAlias of (string) | C_RnErr_InvalidModuleAlias of (string) | C_RnErr_InvalidTopLevelName of (string) | C_RnErr_InvalidTypeExpression of (string) | C_RnErr_InvalidVariableName of (string) | C_RnErr_ModuleAliasConflict of (string) | C_RnErr_ModuleNameMismatch of (string) | C_RnErr_ModuleNotImported of (string) | C_RnErr_TypeHasNoConstructor of (string) * (string) | C_RnErr_UnknownConstructor of (string) | C_RnErr_UnknownInterface of (string) | C_RnErr_UnknownType of (string) | C_RnErr_UnknownFixity of (string) | C_RnErr_UnknownVariable of (string) | C_RnErr_UnknownMacro of (string) | C_RnErr_LogLevelUnknown of (string) | C_RnErr_LogLevelNotLiteral | C_RnErr_AmbiguousPrelude of (string) | C_RnErr_AmbiguousConstructor of (string) * (string) | C_RnErr_AmbiguousConstructorInExport of (string) * (string) | C_RnErr_TypeNotExported of (string) * (string) | C_RnErr_ValueNotExported of (string) * (string) | C_RnErr_SelectorConflict of (string) * (string) | C_RnErr_SelectorShared of (string) * (string) | C_RnErr_SelectorNameTaken of (string) * (string) | C_RnErr_MacroArity of (string) * (string) * (string) | C_RnErr_AmbiguousName of (string) * (string) * (string)
and t_RnEntry = { f_RnEntry_rnEntryCode : string; f_RnEntry_rnEntryTemplate : string; f_RnEntry_rnEntryDesc : string }

# 70 "Vuna/Compiler/Base/Diagnostics/Rn.vuna"
let v_rnCode = (fun (dtb_u_u2 : t_RnErr) -> (match dtb_u_u2 with
  | C_RnErr_AmbiguousName (dtb_u_u3, dtb_u_u4, dtb_u_u5) -> "RN_AmbiguousName"
  | C_RnErr_MacroArity (dtb_u_u6, dtb_u_u7, dtb_u_u8) -> "RN_MacroArity"
  | C_RnErr_SelectorNotRecord (dtb_u_u9) -> "RN_SelectorNotRecord"
  | C_RnErr_SelectorNameTaken (dtb_u_u10, dtb_u_u11) -> "RN_SelectorNameTaken"
  | C_RnErr_SelectorShared (dtb_u_u12, dtb_u_u13) -> "RN_SelectorShared"
  | C_RnErr_SelectorConflict (dtb_u_u14, dtb_u_u15) -> "RN_SelectorConflict"
  | C_RnErr_ValueNotExported (dtb_u_u16, dtb_u_u17) -> "RN_ValueNotExported"
  | C_RnErr_TypeNotExported (dtb_u_u18, dtb_u_u19) -> "RN_TypeNotExported"
  | C_RnErr_AmbiguousConstructorInExport (dtb_u_u20, dtb_u_u21) -> "RN_AmbiguousConstructorInExport"
  | C_RnErr_AmbiguousConstructor (dtb_u_u22, dtb_u_u23) -> "RN_AmbiguousConstructor"
  | C_RnErr_AmbiguousPrelude (dtb_u_u24) -> "RN_AmbiguousPrelude"
  | C_RnErr_LogLevelNotLiteral -> "RN_LogLevelNotLiteral"
  | C_RnErr_LogLevelUnknown (dtb_u_u25) -> "RN_LogLevelUnknown"
  | C_RnErr_UnknownMacro (dtb_u_u26) -> "RN_UnknownMacro"
  | C_RnErr_UnknownVariable (dtb_u_u27) -> "RN_UnknownVariable"
  | C_RnErr_UnknownFixity (dtb_u_u28) -> "RN_UnknownFixity"
  | C_RnErr_UnknownType (dtb_u_u29) -> "RN_UnknownType"
  | C_RnErr_UnknownInterface (dtb_u_u30) -> "RN_UnknownInterface"
  | C_RnErr_UnknownConstructor (dtb_u_u31) -> "RN_UnknownConstructor"
  | C_RnErr_TypeHasNoConstructor (dtb_u_u32, dtb_u_u33) -> "RN_TypeHasNoConstructor"
  | C_RnErr_ModuleNotImported (dtb_u_u34) -> "RN_ModuleNotImported"
  | C_RnErr_ModuleNameMismatch (dtb_u_u35) -> "RN_ModuleNameMismatch"
  | C_RnErr_ModuleAliasConflict (dtb_u_u36) -> "RN_ModuleAliasConflict"
  | C_RnErr_InvalidVariableName (dtb_u_u37) -> "RN_InvalidVariableName"
  | C_RnErr_InvalidTypeExpression (dtb_u_u38) -> "RN_InvalidTypeExpression"
  | C_RnErr_InvalidTopLevelName (dtb_u_u39) -> "RN_InvalidTopLevelName"
  | C_RnErr_InvalidModuleAlias (dtb_u_u40) -> "RN_InvalidModuleAlias"
  | C_RnErr_DuplicateModuleAlias (dtb_u_u41) -> "RN_DuplicateModuleAlias"
  | C_RnErr_DuplicateExport (dtb_u_u42) -> "RN_DuplicateExport"
  | C_RnErr_CannotExportUnknownName (dtb_u_u43) -> "RN_CannotExportUnknownName"
  | C_RnErr_BuiltinFixity (dtb_u_u44) -> "RN_BuiltinFixity"
  | C_RnErr_DuplicateFixity (dtb_u_u45) -> "RN_DuplicateFixity"
  | C_RnErr_AmbiguousModule (dtb_u_u46, dtb_u_u47) -> "RN_AmbiguousModule"
  | C_RnErr_AmbiguousConstructorExport (dtb_u_u48) -> "RN_AmbiguousConstructorExport"
  | C_RnErr_DuplicateImport -> "RN_DuplicateImport"
  | _ -> failwith "DT: impossible branch"
))

# 108 "Vuna/Compiler/Base/Diagnostics/Rn.vuna"
let v_rnTemplate = (fun (dtb_u_u50 : t_RnErr) -> (match dtb_u_u50 with
  | C_RnErr_AmbiguousName (dtb_u_u51, dtb_u_u52, dtb_u_u53) -> "ambiguous <0> <1> (imported from <2>; qualify it at the use site)"
  | C_RnErr_MacroArity (dtb_u_u54, dtb_u_u55, dtb_u_u56) -> "macro <0> expects <1> argument(s), got <2>"
  | C_RnErr_SelectorNotRecord (dtb_u_u57) -> "deriving (Selectors) only applies to record declarations"
  | C_RnErr_SelectorNameTaken (dtb_u_u58, dtb_u_u59) -> "selector <0> for record <1> collides with an existing top-level definition"
  | C_RnErr_SelectorShared (dtb_u_u60, dtb_u_u61) -> "field <0> is shared by <1>; add deriving (Selectors) to the record that owns the selector"
  | C_RnErr_SelectorConflict (dtb_u_u62, dtb_u_u63) -> "field <0> has a selector claimed by more than one record (<1>)"
  | C_RnErr_ValueNotExported (dtb_u_u64, dtb_u_u65) -> "<0> is not exported by <1>"
  | C_RnErr_TypeNotExported (dtb_u_u66, dtb_u_u67) -> "type <0> is not exported by <1>"
  | C_RnErr_AmbiguousConstructorInExport (dtb_u_u68, dtb_u_u69) -> "ambiguous constructor <0> in <1> (export T(..) instead)"
  | C_RnErr_AmbiguousConstructor (dtb_u_u70, dtb_u_u71) -> "ambiguous constructor <0> (qualify it as <1>)"
  | C_RnErr_AmbiguousPrelude (dtb_u_u72) -> "ambiguous implicit Prelude (found in: <0>)"
  | C_RnErr_LogLevelNotLiteral -> "log! level must be a string literal"
  | C_RnErr_LogLevelUnknown (dtb_u_u73) -> "unknown log level <0> (expected error, warn, info, debug, or trace)"
  | C_RnErr_UnknownMacro (dtb_u_u74) -> "unknown macro <0>"
  | C_RnErr_UnknownVariable (dtb_u_u75) -> "unbound variable <0>"
  | C_RnErr_BuiltinFixity (dtb_u_u76) -> "the fixity of built-in operator <0> is fixed by the compiler (remove the declaration)"
  | C_RnErr_DuplicateFixity (dtb_u_u77) -> "operator <0> has more than one fixity declaration (a symbol must have exactly one precedence/associativity in a program)"
  | C_RnErr_UnknownFixity (dtb_u_u78) -> "unknown fixity for operator <0> (declare it with infixl/infixr/infix)"
  | C_RnErr_UnknownType (dtb_u_u79) -> "unknown type <0>"
  | C_RnErr_UnknownInterface (dtb_u_u80) -> "unknown interface <0>"
  | C_RnErr_UnknownConstructor (dtb_u_u81) -> "unknown constructor <0>"
  | C_RnErr_TypeHasNoConstructor (dtb_u_u82, dtb_u_u83) -> "type <0> has no constructor <1>"
  | C_RnErr_ModuleNotImported (dtb_u_u84) -> "module <0> is not imported"
  | C_RnErr_ModuleNameMismatch (dtb_u_u85) -> "module name mismatch: source declares <0>"
  | C_RnErr_ModuleAliasConflict (dtb_u_u86) -> "module alias <0> conflicts with an imported module"
  | C_RnErr_InvalidVariableName (dtb_u_u87) -> "invalid variable name <0>"
  | C_RnErr_InvalidTypeExpression (dtb_u_u88) -> "invalid type expression (<0>)"
  | C_RnErr_InvalidTopLevelName (dtb_u_u89) -> "invalid top-level name <0>"
  | C_RnErr_InvalidModuleAlias (dtb_u_u90) -> "invalid module alias <0>"
  | C_RnErr_DuplicateModuleAlias (dtb_u_u91) -> "duplicate module alias <0>"
  | C_RnErr_DuplicateExport (dtb_u_u92) -> "duplicate export <0>"
  | C_RnErr_CannotExportUnknownName (dtb_u_u93) -> "cannot export unknown name <0>"
  | C_RnErr_AmbiguousModule (dtb_u_u94, dtb_u_u95) -> "ambiguous module <0> (found in: <1>)"
  | C_RnErr_AmbiguousConstructorExport (dtb_u_u96) -> "ambiguous constructor export <0> (write T(..) or qualify it)"
  | C_RnErr_DuplicateImport -> "duplicate import"
  | _ -> failwith "DT: impossible branch"
))

# 155 "Vuna/Compiler/Base/Diagnostics/Rn.vuna"
let v_rnMsg = (fun (dtb_u_u98 : t_RnErr) (dtb_u_u99 : string B_dData_dVec.t_Vec) -> (((((Base_dDiag.v_diagNoLoc Base_dDiag.C_Severity_SevError) Base_dDiag.C_Phase_PhResolve) Base_dDiag.C_Category_CatNames) (v_rnCode dtb_u_u98)) ((Base_dDiagnostics_dCommon.v_diagBody (v_rnTemplate dtb_u_u98)) dtb_u_u99)))

# 159 "Vuna/Compiler/Base/Diagnostics/Rn.vuna"
let v_rnErr = (fun (dtb_u_u102 : Base_dSource.t_Span) (dtb_u_u104 : t_RnErr) (dtb_u_u105 : string B_dData_dVec.t_Vec) -> (Base_dDiag.C_Check_ErrC (((Base_dDiag.v_withLabel { Base_dDiag.f_Label_labelSpan = (B_dData_dMaybe.C_Maybe_Just (dtb_u_u102)); Base_dDiag.f_Label_labelText = ""; Base_dDiag.f_Label_labelStyle = Base_dDiag.C_LabelStyle_LabelPrimary; Base_dDiag.f_Label_labelProvenance = B_dData_dMaybe.C_Maybe_Nothing }) ((v_rnMsg dtb_u_u104) dtb_u_u105)))))

# 163 "Vuna/Compiler/Base/Diagnostics/Rn.vuna"
let v_rnNoLoc = (fun (dtb_u_u108 : t_RnErr) (dtb_u_u109 : string B_dData_dVec.t_Vec) -> (Base_dDiag.C_Check_ErrC (((v_rnMsg dtb_u_u108) dtb_u_u109))))

# 167 "Vuna/Compiler/Base/Diagnostics/Rn.vuna"
let v_rnAt0 = (fun (dtb_u_u111 : Base_dSource.t_Span) (dtb_u_u112 : t_RnErr) -> (((v_rnErr dtb_u_u111) dtb_u_u112) B_dData_dVec.C_Vec_Nil))

# 171 "Vuna/Compiler/Base/Diagnostics/Rn.vuna"
let v_rnAt1 = (fun (dtb_u_u114 : Base_dSource.t_Span) (dtb_u_u115 : t_RnErr) (dtb_u_u116 : string) -> (((v_rnErr dtb_u_u114) dtb_u_u115) (B_dData_dVec.C_Vec__x58__x58_ (dtb_u_u116, B_dData_dVec.C_Vec_Nil))))

# 175 "Vuna/Compiler/Base/Diagnostics/Rn.vuna"
let v_rnAt2 = (fun (dtb_u_u118 : Base_dSource.t_Span) (dtb_u_u119 : t_RnErr) (dtb_u_u120 : string) (dtb_u_u121 : string) -> (((v_rnErr dtb_u_u118) dtb_u_u119) (B_dData_dVec.C_Vec__x58__x58_ (dtb_u_u120, (B_dData_dVec.C_Vec__x58__x58_ (dtb_u_u121, B_dData_dVec.C_Vec_Nil))))))

# 179 "Vuna/Compiler/Base/Diagnostics/Rn.vuna"
let v_rnAt3 = (fun (dtb_u_u123 : Base_dSource.t_Span) (dtb_u_u124 : t_RnErr) (dtb_u_u125 : string) (dtb_u_u126 : string) (dtb_u_u127 : string) -> (((v_rnErr dtb_u_u123) dtb_u_u124) (B_dData_dVec.C_Vec__x58__x58_ (dtb_u_u125, (B_dData_dVec.C_Vec__x58__x58_ (dtb_u_u126, (B_dData_dVec.C_Vec__x58__x58_ (dtb_u_u127, B_dData_dVec.C_Vec_Nil))))))))

# 183 "Vuna/Compiler/Base/Diagnostics/Rn.vuna"
let v_rnNoLoc0 = (fun (dtb_u_u129 : t_RnErr) -> ((v_rnNoLoc dtb_u_u129) B_dData_dVec.C_Vec_Nil))

# 187 "Vuna/Compiler/Base/Diagnostics/Rn.vuna"
let v_rnNoLoc1 = (fun (dtb_u_u131 : t_RnErr) (dtb_u_u132 : string) -> ((v_rnNoLoc dtb_u_u131) (B_dData_dVec.C_Vec__x58__x58_ (dtb_u_u132, B_dData_dVec.C_Vec_Nil))))

# 191 "Vuna/Compiler/Base/Diagnostics/Rn.vuna"
let v_rnNoLoc2 = (fun (dtb_u_u134 : t_RnErr) (dtb_u_u135 : string) (dtb_u_u136 : string) -> ((v_rnNoLoc dtb_u_u134) (B_dData_dVec.C_Vec__x58__x58_ (dtb_u_u135, (B_dData_dVec.C_Vec__x58__x58_ (dtb_u_u136, B_dData_dVec.C_Vec_Nil))))))

# 195 "Vuna/Compiler/Base/Diagnostics/Rn.vuna"
let v_rnNoLoc3 = (fun (dtb_u_u138 : t_RnErr) (dtb_u_u139 : string) (dtb_u_u140 : string) (dtb_u_u141 : string) -> ((v_rnNoLoc dtb_u_u138) (B_dData_dVec.C_Vec__x58__x58_ (dtb_u_u139, (B_dData_dVec.C_Vec__x58__x58_ (dtb_u_u140, (B_dData_dVec.C_Vec__x58__x58_ (dtb_u_u141, B_dData_dVec.C_Vec_Nil))))))))

# 205 "Vuna/Compiler/Base/Diagnostics/Rn.vuna"
let v_rnAll = (B_dData_dList.C_List__x58__x58_ ({ f_RnEntry_rnEntryCode = (v_rnCode C_RnErr_DuplicateImport); f_RnEntry_rnEntryTemplate = (v_rnTemplate C_RnErr_DuplicateImport); f_RnEntry_rnEntryDesc = "\233\135\141\229\164\141\229\175\188\229\133\165" }, (B_dData_dList.C_List__x58__x58_ ({ f_RnEntry_rnEntryCode = (v_rnCode (C_RnErr_AmbiguousConstructorExport (""))); f_RnEntry_rnEntryTemplate = (v_rnTemplate (C_RnErr_AmbiguousConstructorExport (""))); f_RnEntry_rnEntryDesc = "\229\175\188\229\135\186\231\154\132\230\158\132\233\128\160\229\173\144\229\144\141\230\156\137\230\173\167\228\185\137" }, (B_dData_dList.C_List__x58__x58_ ({ f_RnEntry_rnEntryCode = (v_rnCode (C_RnErr_AmbiguousModule ("", ""))); f_RnEntry_rnEntryTemplate = (v_rnTemplate (C_RnErr_AmbiguousModule ("", ""))); f_RnEntry_rnEntryDesc = "\230\168\161\229\157\151\229\144\141\230\173\167\228\185\137" }, (B_dData_dList.C_List__x58__x58_ ({ f_RnEntry_rnEntryCode = (v_rnCode (C_RnErr_CannotExportUnknownName (""))); f_RnEntry_rnEntryTemplate = (v_rnTemplate (C_RnErr_CannotExportUnknownName (""))); f_RnEntry_rnEntryDesc = "\229\175\188\229\135\186\230\156\170\231\159\165\229\144\141\229\173\151" }, (B_dData_dList.C_List__x58__x58_ ({ f_RnEntry_rnEntryCode = (v_rnCode (C_RnErr_DuplicateExport (""))); f_RnEntry_rnEntryTemplate = (v_rnTemplate (C_RnErr_DuplicateExport (""))); f_RnEntry_rnEntryDesc = "\233\135\141\229\164\141\229\175\188\229\135\186" }, (B_dData_dList.C_List__x58__x58_ ({ f_RnEntry_rnEntryCode = (v_rnCode (C_RnErr_DuplicateModuleAlias (""))); f_RnEntry_rnEntryTemplate = (v_rnTemplate (C_RnErr_DuplicateModuleAlias (""))); f_RnEntry_rnEntryDesc = "\233\135\141\229\164\141\230\168\161\229\157\151\229\136\171\229\144\141" }, (B_dData_dList.C_List__x58__x58_ ({ f_RnEntry_rnEntryCode = (v_rnCode (C_RnErr_InvalidModuleAlias (""))); f_RnEntry_rnEntryTemplate = (v_rnTemplate (C_RnErr_InvalidModuleAlias (""))); f_RnEntry_rnEntryDesc = "\233\157\158\230\179\149\230\168\161\229\157\151\229\136\171\229\144\141" }, (B_dData_dList.C_List__x58__x58_ ({ f_RnEntry_rnEntryCode = (v_rnCode (C_RnErr_InvalidTopLevelName (""))); f_RnEntry_rnEntryTemplate = (v_rnTemplate (C_RnErr_InvalidTopLevelName (""))); f_RnEntry_rnEntryDesc = "\233\157\158\230\179\149\233\161\182\229\177\130\229\144\141" }, (B_dData_dList.C_List__x58__x58_ ({ f_RnEntry_rnEntryCode = (v_rnCode (C_RnErr_InvalidTypeExpression (""))); f_RnEntry_rnEntryTemplate = (v_rnTemplate (C_RnErr_InvalidTypeExpression (""))); f_RnEntry_rnEntryDesc = "\233\157\158\230\179\149\231\177\187\229\158\139\232\161\168\232\190\190\229\188\143" }, (B_dData_dList.C_List__x58__x58_ ({ f_RnEntry_rnEntryCode = (v_rnCode (C_RnErr_InvalidVariableName (""))); f_RnEntry_rnEntryTemplate = (v_rnTemplate (C_RnErr_InvalidVariableName (""))); f_RnEntry_rnEntryDesc = "\233\157\158\230\179\149\229\143\152\233\135\143\229\144\141" }, (B_dData_dList.C_List__x58__x58_ ({ f_RnEntry_rnEntryCode = (v_rnCode (C_RnErr_ModuleAliasConflict (""))); f_RnEntry_rnEntryTemplate = (v_rnTemplate (C_RnErr_ModuleAliasConflict (""))); f_RnEntry_rnEntryDesc = "\230\168\161\229\157\151\229\136\171\229\144\141\228\184\142\229\175\188\229\133\165\229\134\178\231\170\129" }, (B_dData_dList.C_List__x58__x58_ ({ f_RnEntry_rnEntryCode = (v_rnCode (C_RnErr_ModuleNameMismatch (""))); f_RnEntry_rnEntryTemplate = (v_rnTemplate (C_RnErr_ModuleNameMismatch (""))); f_RnEntry_rnEntryDesc = "\230\168\161\229\157\151\229\144\141\228\184\141\229\140\185\233\133\141" }, (B_dData_dList.C_List__x58__x58_ ({ f_RnEntry_rnEntryCode = (v_rnCode (C_RnErr_ModuleNotImported (""))); f_RnEntry_rnEntryTemplate = (v_rnTemplate (C_RnErr_ModuleNotImported (""))); f_RnEntry_rnEntryDesc = "\230\168\161\229\157\151\230\156\170\232\162\171\229\175\188\229\133\165" }, (B_dData_dList.C_List__x58__x58_ ({ f_RnEntry_rnEntryCode = (v_rnCode (C_RnErr_TypeHasNoConstructor ("", ""))); f_RnEntry_rnEntryTemplate = (v_rnTemplate (C_RnErr_TypeHasNoConstructor ("", ""))); f_RnEntry_rnEntryDesc = "\231\177\187\229\158\139\230\178\161\230\156\137\232\175\165\230\158\132\233\128\160\229\173\144" }, (B_dData_dList.C_List__x58__x58_ ({ f_RnEntry_rnEntryCode = (v_rnCode (C_RnErr_UnknownConstructor (""))); f_RnEntry_rnEntryTemplate = (v_rnTemplate (C_RnErr_UnknownConstructor (""))); f_RnEntry_rnEntryDesc = "\230\156\170\231\159\165\230\158\132\233\128\160\229\173\144" }, (B_dData_dList.C_List__x58__x58_ ({ f_RnEntry_rnEntryCode = (v_rnCode (C_RnErr_UnknownInterface (""))); f_RnEntry_rnEntryTemplate = (v_rnTemplate (C_RnErr_UnknownInterface (""))); f_RnEntry_rnEntryDesc = "\230\156\170\231\159\165\230\142\165\229\143\163" }, (B_dData_dList.C_List__x58__x58_ ({ f_RnEntry_rnEntryCode = (v_rnCode (C_RnErr_UnknownType (""))); f_RnEntry_rnEntryTemplate = (v_rnTemplate (C_RnErr_UnknownType (""))); f_RnEntry_rnEntryDesc = "\230\156\170\231\159\165\231\177\187\229\158\139" }, (B_dData_dList.C_List__x58__x58_ ({ f_RnEntry_rnEntryCode = (v_rnCode (C_RnErr_UnknownFixity (""))); f_RnEntry_rnEntryTemplate = (v_rnTemplate (C_RnErr_UnknownFixity (""))); f_RnEntry_rnEntryDesc = "\230\156\170\231\159\165\232\191\144\231\174\151\231\172\166 fixity" }, (B_dData_dList.C_List__x58__x58_ ({ f_RnEntry_rnEntryCode = (v_rnCode (C_RnErr_DuplicateFixity (""))); f_RnEntry_rnEntryTemplate = (v_rnTemplate (C_RnErr_DuplicateFixity (""))); f_RnEntry_rnEntryDesc = "\232\191\144\231\174\151\231\172\166 fixity \233\135\141\229\164\141\229\163\176\230\152\142" }, (B_dData_dList.C_List__x58__x58_ ({ f_RnEntry_rnEntryCode = (v_rnCode (C_RnErr_BuiltinFixity (""))); f_RnEntry_rnEntryTemplate = (v_rnTemplate (C_RnErr_BuiltinFixity (""))); f_RnEntry_rnEntryDesc = "\229\134\133\229\187\186\232\191\144\231\174\151\231\172\166 fixity \231\148\177\231\188\150\232\175\145\229\153\168\229\155\186\229\174\154" }, (B_dData_dList.C_List__x58__x58_ ({ f_RnEntry_rnEntryCode = (v_rnCode (C_RnErr_UnknownVariable (""))); f_RnEntry_rnEntryTemplate = (v_rnTemplate (C_RnErr_UnknownVariable (""))); f_RnEntry_rnEntryDesc = "\230\156\170\231\187\145\229\174\154\229\143\152\233\135\143" }, (B_dData_dList.C_List__x58__x58_ ({ f_RnEntry_rnEntryCode = (v_rnCode (C_RnErr_UnknownMacro (""))); f_RnEntry_rnEntryTemplate = (v_rnTemplate (C_RnErr_UnknownMacro (""))); f_RnEntry_rnEntryDesc = "\230\156\170\231\159\165\229\174\143" }, (B_dData_dList.C_List__x58__x58_ ({ f_RnEntry_rnEntryCode = (v_rnCode (C_RnErr_LogLevelUnknown (""))); f_RnEntry_rnEntryTemplate = (v_rnTemplate (C_RnErr_LogLevelUnknown (""))); f_RnEntry_rnEntryDesc = "\230\156\170\231\159\165\230\151\165\229\191\151\231\186\167\229\136\171" }, (B_dData_dList.C_List__x58__x58_ ({ f_RnEntry_rnEntryCode = (v_rnCode C_RnErr_LogLevelNotLiteral); f_RnEntry_rnEntryTemplate = (v_rnTemplate C_RnErr_LogLevelNotLiteral); f_RnEntry_rnEntryDesc = "\230\151\165\229\191\151\231\186\167\229\136\171\229\191\133\233\161\187\230\152\175\229\173\151\231\172\166\228\184\178\229\173\151\233\157\162\233\135\143" }, (B_dData_dList.C_List__x58__x58_ ({ f_RnEntry_rnEntryCode = (v_rnCode (C_RnErr_AmbiguousPrelude (""))); f_RnEntry_rnEntryTemplate = (v_rnTemplate (C_RnErr_AmbiguousPrelude (""))); f_RnEntry_rnEntryDesc = "\233\154\144\229\188\143 Prelude \230\173\167\228\185\137" }, (B_dData_dList.C_List__x58__x58_ ({ f_RnEntry_rnEntryCode = (v_rnCode (C_RnErr_AmbiguousConstructor ("", ""))); f_RnEntry_rnEntryTemplate = (v_rnTemplate (C_RnErr_AmbiguousConstructor ("", ""))); f_RnEntry_rnEntryDesc = "\230\158\132\233\128\160\229\173\144\230\173\167\228\185\137" }, (B_dData_dList.C_List__x58__x58_ ({ f_RnEntry_rnEntryCode = (v_rnCode (C_RnErr_AmbiguousConstructorInExport ("", ""))); f_RnEntry_rnEntryTemplate = (v_rnTemplate (C_RnErr_AmbiguousConstructorInExport ("", ""))); f_RnEntry_rnEntryDesc = "\229\175\188\229\135\186\228\184\173\230\158\132\233\128\160\229\173\144\230\173\167\228\185\137" }, (B_dData_dList.C_List__x58__x58_ ({ f_RnEntry_rnEntryCode = (v_rnCode (C_RnErr_TypeNotExported ("", ""))); f_RnEntry_rnEntryTemplate = (v_rnTemplate (C_RnErr_TypeNotExported ("", ""))); f_RnEntry_rnEntryDesc = "\231\177\187\229\158\139\230\156\170\232\162\171\229\175\188\229\135\186" }, (B_dData_dList.C_List__x58__x58_ ({ f_RnEntry_rnEntryCode = (v_rnCode (C_RnErr_ValueNotExported ("", ""))); f_RnEntry_rnEntryTemplate = (v_rnTemplate (C_RnErr_ValueNotExported ("", ""))); f_RnEntry_rnEntryDesc = "\229\128\188\230\156\170\232\162\171\229\175\188\229\135\186" }, (B_dData_dList.C_List__x58__x58_ ({ f_RnEntry_rnEntryCode = (v_rnCode (C_RnErr_MacroArity ("", "", ""))); f_RnEntry_rnEntryTemplate = (v_rnTemplate (C_RnErr_MacroArity ("", "", ""))); f_RnEntry_rnEntryDesc = "\229\174\143\229\174\158\229\143\130\228\184\170\230\149\176\228\184\141\229\140\185\233\133\141" }, (B_dData_dList.C_List__x58__x58_ ({ f_RnEntry_rnEntryCode = (v_rnCode (C_RnErr_SelectorConflict ("", ""))); f_RnEntry_rnEntryTemplate = (v_rnTemplate (C_RnErr_SelectorConflict ("", ""))); f_RnEntry_rnEntryDesc = "\229\173\151\230\174\181\233\128\137\230\139\169\229\153\168\232\162\171\229\164\154\228\184\170 record \232\174\164\233\162\134" }, (B_dData_dList.C_List__x58__x58_ ({ f_RnEntry_rnEntryCode = (v_rnCode (C_RnErr_SelectorShared ("", ""))); f_RnEntry_rnEntryTemplate = (v_rnTemplate (C_RnErr_SelectorShared ("", ""))); f_RnEntry_rnEntryDesc = "\229\144\140\229\144\141\229\173\151\230\174\181\230\151\160\228\186\186\232\174\164\233\162\134\233\128\137\230\139\169\229\153\168" }, (B_dData_dList.C_List__x58__x58_ ({ f_RnEntry_rnEntryCode = (v_rnCode (C_RnErr_SelectorNameTaken ("", ""))); f_RnEntry_rnEntryTemplate = (v_rnTemplate (C_RnErr_SelectorNameTaken ("", ""))); f_RnEntry_rnEntryDesc = "\233\128\137\230\139\169\229\153\168\228\184\142\229\183\178\230\156\137\233\161\182\229\177\130\229\163\176\230\152\142\229\144\140\229\144\141" }, (B_dData_dList.C_List__x58__x58_ ({ f_RnEntry_rnEntryCode = (v_rnCode (C_RnErr_SelectorNotRecord (""))); f_RnEntry_rnEntryTemplate = (v_rnTemplate (C_RnErr_SelectorNotRecord (""))); f_RnEntry_rnEntryDesc = "deriving (Selectors) \231\148\168\229\156\168\233\157\158 record \228\184\138" }, (B_dData_dList.C_List__x58__x58_ ({ f_RnEntry_rnEntryCode = (v_rnCode (C_RnErr_AmbiguousName ("", "", ""))); f_RnEntry_rnEntryTemplate = (v_rnTemplate (C_RnErr_AmbiguousName ("", "", ""))); f_RnEntry_rnEntryDesc = "\229\175\188\229\133\165\231\154\132\230\157\161\231\155\174\229\144\141\230\173\167\228\185\137" }, B_dData_dList.C_List_Nil))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))

# 199 "Vuna/Compiler/Base/Diagnostics/Rn.vuna"
let v_rnEntryCode = (fun (dtb_u_u142 : t_RnEntry) -> (match dtb_u_u142 with
  | { f_RnEntry_rnEntryCode = dtb_u_u143; f_RnEntry_rnEntryTemplate = dtb_u_u144; f_RnEntry_rnEntryDesc = dtb_u_u145 } -> dtb_u_u143
  | _ -> failwith "DT: impossible branch"
))

# 200 "Vuna/Compiler/Base/Diagnostics/Rn.vuna"
let v_rnEntryTemplate = (fun (dtb_u_u146 : t_RnEntry) -> (match dtb_u_u146 with
  | { f_RnEntry_rnEntryCode = dtb_u_u147; f_RnEntry_rnEntryTemplate = dtb_u_u148; f_RnEntry_rnEntryDesc = dtb_u_u149 } -> dtb_u_u148
  | _ -> failwith "DT: impossible branch"
))

# 201 "Vuna/Compiler/Base/Diagnostics/Rn.vuna"
let v_rnEntryDesc = (fun (dtb_u_u150 : t_RnEntry) -> (match dtb_u_u150 with
  | { f_RnEntry_rnEntryCode = dtb_u_u151; f_RnEntry_rnEntryTemplate = dtb_u_u152; f_RnEntry_rnEntryDesc = dtb_u_u153 } -> dtb_u_u153
  | _ -> failwith "DT: impossible branch"
))
