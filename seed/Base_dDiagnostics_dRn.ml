open Vuna_runtime
type t_RnErr = C_RnErr_DuplicateImport | C_RnErr_AmbiguousConstructorExport of (string) | C_RnErr_SelectorNotRecord of (string) | C_RnErr_AmbiguousModule of (string) * (string) | C_RnErr_DuplicateFixity of (string) | C_RnErr_BuiltinFixity of (string) | C_RnErr_CannotExportUnknownName of (string) | C_RnErr_DuplicateExport of (string) | C_RnErr_DuplicateModuleAlias of (string) | C_RnErr_InvalidModuleAlias of (string) | C_RnErr_InvalidTopLevelName of (string) | C_RnErr_InvalidTypeExpression of (string) | C_RnErr_InvalidVariableName of (string) | C_RnErr_ModuleAliasConflict of (string) | C_RnErr_ModuleNameMismatch of (string) | C_RnErr_ModuleNotImported of (string) | C_RnErr_TypeHasNoConstructor of (string) * (string) | C_RnErr_UnknownConstructor of (string) | C_RnErr_UnknownInterface of (string) | C_RnErr_UnknownType of (string) | C_RnErr_UnknownFixity of (string) | C_RnErr_UnknownVariable of (string) | C_RnErr_UnknownMacro of (string) | C_RnErr_LogLevelUnknown of (string) | C_RnErr_LogLevelNotLiteral | C_RnErr_AmbiguousPrelude of (string) | C_RnErr_AmbiguousConstructor of (string) * (string) | C_RnErr_AmbiguousConstructorInExport of (string) * (string) | C_RnErr_TypeNotExported of (string) * (string) | C_RnErr_ValueNotExported of (string) * (string) | C_RnErr_SelectorConflict of (string) * (string) | C_RnErr_SelectorShared of (string) * (string) | C_RnErr_SelectorNameTaken of (string) * (string) | C_RnErr_MacroArity of (string) * (string) * (string) | C_RnErr_AmbiguousName of (string) * (string) * (string)
and t_RnEntry = { f_RnEntry_rnEntryCode : string; f_RnEntry_rnEntryTemplate : string; f_RnEntry_rnEntryDesc : string }

# 70 "Vuna/Compiler/Base/Diagnostics/Rn.vuna"
let v_rnCode = (fun (mc0 : t_RnErr) -> (match mc0 with
  | C_RnErr_AmbiguousName (dtb__0, dtb__1, dtb__2) -> "RN_AmbiguousName"
  | C_RnErr_MacroArity (dtb__3, dtb__4, dtb__5) -> "RN_MacroArity"
  | C_RnErr_SelectorNotRecord (dtb__6) -> "RN_SelectorNotRecord"
  | C_RnErr_SelectorNameTaken (dtb__7, dtb__8) -> "RN_SelectorNameTaken"
  | C_RnErr_SelectorShared (dtb__9, dtb__10) -> "RN_SelectorShared"
  | C_RnErr_SelectorConflict (dtb__11, dtb__12) -> "RN_SelectorConflict"
  | C_RnErr_ValueNotExported (dtb__13, dtb__14) -> "RN_ValueNotExported"
  | C_RnErr_TypeNotExported (dtb__15, dtb__16) -> "RN_TypeNotExported"
  | C_RnErr_AmbiguousConstructorInExport (dtb__17, dtb__18) -> "RN_AmbiguousConstructorInExport"
  | C_RnErr_AmbiguousConstructor (dtb__19, dtb__20) -> "RN_AmbiguousConstructor"
  | C_RnErr_AmbiguousPrelude (dtb__21) -> "RN_AmbiguousPrelude"
  | C_RnErr_LogLevelNotLiteral -> "RN_LogLevelNotLiteral"
  | C_RnErr_LogLevelUnknown (dtb__22) -> "RN_LogLevelUnknown"
  | C_RnErr_UnknownMacro (dtb__23) -> "RN_UnknownMacro"
  | C_RnErr_UnknownVariable (dtb__24) -> "RN_UnknownVariable"
  | C_RnErr_UnknownFixity (dtb__25) -> "RN_UnknownFixity"
  | C_RnErr_UnknownType (dtb__26) -> "RN_UnknownType"
  | C_RnErr_UnknownInterface (dtb__27) -> "RN_UnknownInterface"
  | C_RnErr_UnknownConstructor (dtb__28) -> "RN_UnknownConstructor"
  | C_RnErr_TypeHasNoConstructor (dtb__29, dtb__30) -> "RN_TypeHasNoConstructor"
  | C_RnErr_ModuleNotImported (dtb__31) -> "RN_ModuleNotImported"
  | C_RnErr_ModuleNameMismatch (dtb__32) -> "RN_ModuleNameMismatch"
  | C_RnErr_ModuleAliasConflict (dtb__33) -> "RN_ModuleAliasConflict"
  | C_RnErr_InvalidVariableName (dtb__34) -> "RN_InvalidVariableName"
  | C_RnErr_InvalidTypeExpression (dtb__35) -> "RN_InvalidTypeExpression"
  | C_RnErr_InvalidTopLevelName (dtb__36) -> "RN_InvalidTopLevelName"
  | C_RnErr_InvalidModuleAlias (dtb__37) -> "RN_InvalidModuleAlias"
  | C_RnErr_DuplicateModuleAlias (dtb__38) -> "RN_DuplicateModuleAlias"
  | C_RnErr_DuplicateExport (dtb__39) -> "RN_DuplicateExport"
  | C_RnErr_CannotExportUnknownName (dtb__40) -> "RN_CannotExportUnknownName"
  | C_RnErr_BuiltinFixity (dtb__41) -> "RN_BuiltinFixity"
  | C_RnErr_DuplicateFixity (dtb__42) -> "RN_DuplicateFixity"
  | C_RnErr_AmbiguousModule (dtb__43, dtb__44) -> "RN_AmbiguousModule"
  | C_RnErr_AmbiguousConstructorExport (dtb__45) -> "RN_AmbiguousConstructorExport"
  | C_RnErr_DuplicateImport -> "RN_DuplicateImport"
  | _ -> failwith "DT: impossible branch"
))

# 108 "Vuna/Compiler/Base/Diagnostics/Rn.vuna"
let v_rnTemplate = (fun (mc0 : t_RnErr) -> (match mc0 with
  | C_RnErr_AmbiguousName (dtb__46, dtb__47, dtb__48) -> "ambiguous <0> <1> (imported from <2>; qualify it at the use site)"
  | C_RnErr_MacroArity (dtb__49, dtb__50, dtb__51) -> "macro <0> expects <1> argument(s), got <2>"
  | C_RnErr_SelectorNotRecord (dtb__52) -> "deriving (Selectors) only applies to record declarations"
  | C_RnErr_SelectorNameTaken (dtb__53, dtb__54) -> "selector <0> for record <1> collides with an existing top-level definition"
  | C_RnErr_SelectorShared (dtb__55, dtb__56) -> "field <0> is shared by <1>; add deriving (Selectors) to the record that owns the selector"
  | C_RnErr_SelectorConflict (dtb__57, dtb__58) -> "field <0> has a selector claimed by more than one record (<1>)"
  | C_RnErr_ValueNotExported (dtb__59, dtb__60) -> "<0> is not exported by <1>"
  | C_RnErr_TypeNotExported (dtb__61, dtb__62) -> "type <0> is not exported by <1>"
  | C_RnErr_AmbiguousConstructorInExport (dtb__63, dtb__64) -> "ambiguous constructor <0> in <1> (export T(..) instead)"
  | C_RnErr_AmbiguousConstructor (dtb__65, dtb__66) -> "ambiguous constructor <0> (qualify it as <1>)"
  | C_RnErr_AmbiguousPrelude (dtb__67) -> "ambiguous implicit Prelude (found in: <0>)"
  | C_RnErr_LogLevelNotLiteral -> "log! level must be a string literal"
  | C_RnErr_LogLevelUnknown (dtb__68) -> "unknown log level <0> (expected error, warn, info, debug, or trace)"
  | C_RnErr_UnknownMacro (dtb__69) -> "unknown macro <0>"
  | C_RnErr_UnknownVariable (dtb__70) -> "unbound variable <0>"
  | C_RnErr_BuiltinFixity (dtb__71) -> "the fixity of built-in operator <0> is fixed by the compiler (remove the declaration)"
  | C_RnErr_DuplicateFixity (dtb__72) -> "operator <0> has more than one fixity declaration (a symbol must have exactly one precedence/associativity in a program)"
  | C_RnErr_UnknownFixity (dtb__73) -> "unknown fixity for operator <0> (declare it with infixl/infixr/infix)"
  | C_RnErr_UnknownType (dtb__74) -> "unknown type <0>"
  | C_RnErr_UnknownInterface (dtb__75) -> "unknown interface <0>"
  | C_RnErr_UnknownConstructor (dtb__76) -> "unknown constructor <0>"
  | C_RnErr_TypeHasNoConstructor (dtb__77, dtb__78) -> "type <0> has no constructor <1>"
  | C_RnErr_ModuleNotImported (dtb__79) -> "module <0> is not imported"
  | C_RnErr_ModuleNameMismatch (dtb__80) -> "module name mismatch: source declares <0>"
  | C_RnErr_ModuleAliasConflict (dtb__81) -> "module alias <0> conflicts with an imported module"
  | C_RnErr_InvalidVariableName (dtb__82) -> "invalid variable name <0>"
  | C_RnErr_InvalidTypeExpression (dtb__83) -> "invalid type expression (<0>)"
  | C_RnErr_InvalidTopLevelName (dtb__84) -> "invalid top-level name <0>"
  | C_RnErr_InvalidModuleAlias (dtb__85) -> "invalid module alias <0>"
  | C_RnErr_DuplicateModuleAlias (dtb__86) -> "duplicate module alias <0>"
  | C_RnErr_DuplicateExport (dtb__87) -> "duplicate export <0>"
  | C_RnErr_CannotExportUnknownName (dtb__88) -> "cannot export unknown name <0>"
  | C_RnErr_AmbiguousModule (dtb__89, dtb__90) -> "ambiguous module <0> (found in: <1>)"
  | C_RnErr_AmbiguousConstructorExport (dtb__91) -> "ambiguous constructor export <0> (write T(..) or qualify it)"
  | C_RnErr_DuplicateImport -> "duplicate import"
  | _ -> failwith "DT: impossible branch"
))

# 155 "Vuna/Compiler/Base/Diagnostics/Rn.vuna"
let v_rnMsg = (fun (e : t_RnErr) (args : string B_dData_dVec.t_Vec) -> (((((Base_dDiag.v_diagNoLoc Base_dDiag.C_Severity_SevError) Base_dDiag.C_Phase_PhResolve) Base_dDiag.C_Category_CatNames) (v_rnCode e)) ((Base_dDiagnostics_dCommon.v_diagBody (v_rnTemplate e)) args)))

# 159 "Vuna/Compiler/Base/Diagnostics/Rn.vuna"
let v_rnErr = (fun (sp : Base_dSource.t_Span) (e : t_RnErr) (args : string B_dData_dVec.t_Vec) -> (Base_dDiag.C_Check_ErrC (((Base_dDiag.v_withLabel { Base_dDiag.f_Label_labelSpan = (B_dData_dMaybe.C_Maybe_Just (sp)); Base_dDiag.f_Label_labelText = ""; Base_dDiag.f_Label_labelStyle = Base_dDiag.C_LabelStyle_LabelPrimary; Base_dDiag.f_Label_labelProvenance = B_dData_dMaybe.C_Maybe_Nothing }) ((v_rnMsg e) args)))))

# 163 "Vuna/Compiler/Base/Diagnostics/Rn.vuna"
let v_rnNoLoc = (fun (e : t_RnErr) (args : string B_dData_dVec.t_Vec) -> (Base_dDiag.C_Check_ErrC (((v_rnMsg e) args))))

# 167 "Vuna/Compiler/Base/Diagnostics/Rn.vuna"
let v_rnAt0 = (fun (sp : Base_dSource.t_Span) (e : t_RnErr) -> (((v_rnErr sp) e) B_dData_dVec.C_Vec_Nil))

# 171 "Vuna/Compiler/Base/Diagnostics/Rn.vuna"
let v_rnAt1 = (fun (sp : Base_dSource.t_Span) (e : t_RnErr) (a0 : string) -> (((v_rnErr sp) e) (B_dData_dVec.C_Vec_VCons (a0, B_dData_dVec.C_Vec_Nil))))

# 175 "Vuna/Compiler/Base/Diagnostics/Rn.vuna"
let v_rnAt2 = (fun (sp : Base_dSource.t_Span) (e : t_RnErr) (a0 : string) (a1 : string) -> (((v_rnErr sp) e) (B_dData_dVec.C_Vec_VCons (a0, (B_dData_dVec.C_Vec_VCons (a1, B_dData_dVec.C_Vec_Nil))))))

# 179 "Vuna/Compiler/Base/Diagnostics/Rn.vuna"
let v_rnAt3 = (fun (sp : Base_dSource.t_Span) (e : t_RnErr) (a0 : string) (a1 : string) (a2 : string) -> (((v_rnErr sp) e) (B_dData_dVec.C_Vec_VCons (a0, (B_dData_dVec.C_Vec_VCons (a1, (B_dData_dVec.C_Vec_VCons (a2, B_dData_dVec.C_Vec_Nil))))))))

# 183 "Vuna/Compiler/Base/Diagnostics/Rn.vuna"
let v_rnNoLoc0 = (fun (e : t_RnErr) -> ((v_rnNoLoc e) B_dData_dVec.C_Vec_Nil))

# 187 "Vuna/Compiler/Base/Diagnostics/Rn.vuna"
let v_rnNoLoc1 = (fun (e : t_RnErr) (a0 : string) -> ((v_rnNoLoc e) (B_dData_dVec.C_Vec_VCons (a0, B_dData_dVec.C_Vec_Nil))))

# 191 "Vuna/Compiler/Base/Diagnostics/Rn.vuna"
let v_rnNoLoc2 = (fun (e : t_RnErr) (a0 : string) (a1 : string) -> ((v_rnNoLoc e) (B_dData_dVec.C_Vec_VCons (a0, (B_dData_dVec.C_Vec_VCons (a1, B_dData_dVec.C_Vec_Nil))))))

# 195 "Vuna/Compiler/Base/Diagnostics/Rn.vuna"
let v_rnNoLoc3 = (fun (e : t_RnErr) (a0 : string) (a1 : string) (a2 : string) -> ((v_rnNoLoc e) (B_dData_dVec.C_Vec_VCons (a0, (B_dData_dVec.C_Vec_VCons (a1, (B_dData_dVec.C_Vec_VCons (a2, B_dData_dVec.C_Vec_Nil))))))))

# 205 "Vuna/Compiler/Base/Diagnostics/Rn.vuna"
let v_rnAll = (B_dData_dList.C_List__x58__x58_ ({ f_RnEntry_rnEntryCode = (v_rnCode C_RnErr_DuplicateImport); f_RnEntry_rnEntryTemplate = (v_rnTemplate C_RnErr_DuplicateImport); f_RnEntry_rnEntryDesc = "\233\135\141\229\164\141\229\175\188\229\133\165" }, (B_dData_dList.C_List__x58__x58_ ({ f_RnEntry_rnEntryCode = (v_rnCode (C_RnErr_AmbiguousConstructorExport (""))); f_RnEntry_rnEntryTemplate = (v_rnTemplate (C_RnErr_AmbiguousConstructorExport (""))); f_RnEntry_rnEntryDesc = "\229\175\188\229\135\186\231\154\132\230\158\132\233\128\160\229\173\144\229\144\141\230\156\137\230\173\167\228\185\137" }, (B_dData_dList.C_List__x58__x58_ ({ f_RnEntry_rnEntryCode = (v_rnCode (C_RnErr_AmbiguousModule ("", ""))); f_RnEntry_rnEntryTemplate = (v_rnTemplate (C_RnErr_AmbiguousModule ("", ""))); f_RnEntry_rnEntryDesc = "\230\168\161\229\157\151\229\144\141\230\173\167\228\185\137" }, (B_dData_dList.C_List__x58__x58_ ({ f_RnEntry_rnEntryCode = (v_rnCode (C_RnErr_CannotExportUnknownName (""))); f_RnEntry_rnEntryTemplate = (v_rnTemplate (C_RnErr_CannotExportUnknownName (""))); f_RnEntry_rnEntryDesc = "\229\175\188\229\135\186\230\156\170\231\159\165\229\144\141\229\173\151" }, (B_dData_dList.C_List__x58__x58_ ({ f_RnEntry_rnEntryCode = (v_rnCode (C_RnErr_DuplicateExport (""))); f_RnEntry_rnEntryTemplate = (v_rnTemplate (C_RnErr_DuplicateExport (""))); f_RnEntry_rnEntryDesc = "\233\135\141\229\164\141\229\175\188\229\135\186" }, (B_dData_dList.C_List__x58__x58_ ({ f_RnEntry_rnEntryCode = (v_rnCode (C_RnErr_DuplicateModuleAlias (""))); f_RnEntry_rnEntryTemplate = (v_rnTemplate (C_RnErr_DuplicateModuleAlias (""))); f_RnEntry_rnEntryDesc = "\233\135\141\229\164\141\230\168\161\229\157\151\229\136\171\229\144\141" }, (B_dData_dList.C_List__x58__x58_ ({ f_RnEntry_rnEntryCode = (v_rnCode (C_RnErr_InvalidModuleAlias (""))); f_RnEntry_rnEntryTemplate = (v_rnTemplate (C_RnErr_InvalidModuleAlias (""))); f_RnEntry_rnEntryDesc = "\233\157\158\230\179\149\230\168\161\229\157\151\229\136\171\229\144\141" }, (B_dData_dList.C_List__x58__x58_ ({ f_RnEntry_rnEntryCode = (v_rnCode (C_RnErr_InvalidTopLevelName (""))); f_RnEntry_rnEntryTemplate = (v_rnTemplate (C_RnErr_InvalidTopLevelName (""))); f_RnEntry_rnEntryDesc = "\233\157\158\230\179\149\233\161\182\229\177\130\229\144\141" }, (B_dData_dList.C_List__x58__x58_ ({ f_RnEntry_rnEntryCode = (v_rnCode (C_RnErr_InvalidTypeExpression (""))); f_RnEntry_rnEntryTemplate = (v_rnTemplate (C_RnErr_InvalidTypeExpression (""))); f_RnEntry_rnEntryDesc = "\233\157\158\230\179\149\231\177\187\229\158\139\232\161\168\232\190\190\229\188\143" }, (B_dData_dList.C_List__x58__x58_ ({ f_RnEntry_rnEntryCode = (v_rnCode (C_RnErr_InvalidVariableName (""))); f_RnEntry_rnEntryTemplate = (v_rnTemplate (C_RnErr_InvalidVariableName (""))); f_RnEntry_rnEntryDesc = "\233\157\158\230\179\149\229\143\152\233\135\143\229\144\141" }, (B_dData_dList.C_List__x58__x58_ ({ f_RnEntry_rnEntryCode = (v_rnCode (C_RnErr_ModuleAliasConflict (""))); f_RnEntry_rnEntryTemplate = (v_rnTemplate (C_RnErr_ModuleAliasConflict (""))); f_RnEntry_rnEntryDesc = "\230\168\161\229\157\151\229\136\171\229\144\141\228\184\142\229\175\188\229\133\165\229\134\178\231\170\129" }, (B_dData_dList.C_List__x58__x58_ ({ f_RnEntry_rnEntryCode = (v_rnCode (C_RnErr_ModuleNameMismatch (""))); f_RnEntry_rnEntryTemplate = (v_rnTemplate (C_RnErr_ModuleNameMismatch (""))); f_RnEntry_rnEntryDesc = "\230\168\161\229\157\151\229\144\141\228\184\141\229\140\185\233\133\141" }, (B_dData_dList.C_List__x58__x58_ ({ f_RnEntry_rnEntryCode = (v_rnCode (C_RnErr_ModuleNotImported (""))); f_RnEntry_rnEntryTemplate = (v_rnTemplate (C_RnErr_ModuleNotImported (""))); f_RnEntry_rnEntryDesc = "\230\168\161\229\157\151\230\156\170\232\162\171\229\175\188\229\133\165" }, (B_dData_dList.C_List__x58__x58_ ({ f_RnEntry_rnEntryCode = (v_rnCode (C_RnErr_TypeHasNoConstructor ("", ""))); f_RnEntry_rnEntryTemplate = (v_rnTemplate (C_RnErr_TypeHasNoConstructor ("", ""))); f_RnEntry_rnEntryDesc = "\231\177\187\229\158\139\230\178\161\230\156\137\232\175\165\230\158\132\233\128\160\229\173\144" }, (B_dData_dList.C_List__x58__x58_ ({ f_RnEntry_rnEntryCode = (v_rnCode (C_RnErr_UnknownConstructor (""))); f_RnEntry_rnEntryTemplate = (v_rnTemplate (C_RnErr_UnknownConstructor (""))); f_RnEntry_rnEntryDesc = "\230\156\170\231\159\165\230\158\132\233\128\160\229\173\144" }, (B_dData_dList.C_List__x58__x58_ ({ f_RnEntry_rnEntryCode = (v_rnCode (C_RnErr_UnknownInterface (""))); f_RnEntry_rnEntryTemplate = (v_rnTemplate (C_RnErr_UnknownInterface (""))); f_RnEntry_rnEntryDesc = "\230\156\170\231\159\165\230\142\165\229\143\163" }, (B_dData_dList.C_List__x58__x58_ ({ f_RnEntry_rnEntryCode = (v_rnCode (C_RnErr_UnknownType (""))); f_RnEntry_rnEntryTemplate = (v_rnTemplate (C_RnErr_UnknownType (""))); f_RnEntry_rnEntryDesc = "\230\156\170\231\159\165\231\177\187\229\158\139" }, (B_dData_dList.C_List__x58__x58_ ({ f_RnEntry_rnEntryCode = (v_rnCode (C_RnErr_UnknownFixity (""))); f_RnEntry_rnEntryTemplate = (v_rnTemplate (C_RnErr_UnknownFixity (""))); f_RnEntry_rnEntryDesc = "\230\156\170\231\159\165\232\191\144\231\174\151\231\172\166 fixity" }, (B_dData_dList.C_List__x58__x58_ ({ f_RnEntry_rnEntryCode = (v_rnCode (C_RnErr_DuplicateFixity (""))); f_RnEntry_rnEntryTemplate = (v_rnTemplate (C_RnErr_DuplicateFixity (""))); f_RnEntry_rnEntryDesc = "\232\191\144\231\174\151\231\172\166 fixity \233\135\141\229\164\141\229\163\176\230\152\142" }, (B_dData_dList.C_List__x58__x58_ ({ f_RnEntry_rnEntryCode = (v_rnCode (C_RnErr_BuiltinFixity (""))); f_RnEntry_rnEntryTemplate = (v_rnTemplate (C_RnErr_BuiltinFixity (""))); f_RnEntry_rnEntryDesc = "\229\134\133\229\187\186\232\191\144\231\174\151\231\172\166 fixity \231\148\177\231\188\150\232\175\145\229\153\168\229\155\186\229\174\154" }, (B_dData_dList.C_List__x58__x58_ ({ f_RnEntry_rnEntryCode = (v_rnCode (C_RnErr_UnknownVariable (""))); f_RnEntry_rnEntryTemplate = (v_rnTemplate (C_RnErr_UnknownVariable (""))); f_RnEntry_rnEntryDesc = "\230\156\170\231\187\145\229\174\154\229\143\152\233\135\143" }, (B_dData_dList.C_List__x58__x58_ ({ f_RnEntry_rnEntryCode = (v_rnCode (C_RnErr_UnknownMacro (""))); f_RnEntry_rnEntryTemplate = (v_rnTemplate (C_RnErr_UnknownMacro (""))); f_RnEntry_rnEntryDesc = "\230\156\170\231\159\165\229\174\143" }, (B_dData_dList.C_List__x58__x58_ ({ f_RnEntry_rnEntryCode = (v_rnCode (C_RnErr_LogLevelUnknown (""))); f_RnEntry_rnEntryTemplate = (v_rnTemplate (C_RnErr_LogLevelUnknown (""))); f_RnEntry_rnEntryDesc = "\230\156\170\231\159\165\230\151\165\229\191\151\231\186\167\229\136\171" }, (B_dData_dList.C_List__x58__x58_ ({ f_RnEntry_rnEntryCode = (v_rnCode C_RnErr_LogLevelNotLiteral); f_RnEntry_rnEntryTemplate = (v_rnTemplate C_RnErr_LogLevelNotLiteral); f_RnEntry_rnEntryDesc = "\230\151\165\229\191\151\231\186\167\229\136\171\229\191\133\233\161\187\230\152\175\229\173\151\231\172\166\228\184\178\229\173\151\233\157\162\233\135\143" }, (B_dData_dList.C_List__x58__x58_ ({ f_RnEntry_rnEntryCode = (v_rnCode (C_RnErr_AmbiguousPrelude (""))); f_RnEntry_rnEntryTemplate = (v_rnTemplate (C_RnErr_AmbiguousPrelude (""))); f_RnEntry_rnEntryDesc = "\233\154\144\229\188\143 Prelude \230\173\167\228\185\137" }, (B_dData_dList.C_List__x58__x58_ ({ f_RnEntry_rnEntryCode = (v_rnCode (C_RnErr_AmbiguousConstructor ("", ""))); f_RnEntry_rnEntryTemplate = (v_rnTemplate (C_RnErr_AmbiguousConstructor ("", ""))); f_RnEntry_rnEntryDesc = "\230\158\132\233\128\160\229\173\144\230\173\167\228\185\137" }, (B_dData_dList.C_List__x58__x58_ ({ f_RnEntry_rnEntryCode = (v_rnCode (C_RnErr_AmbiguousConstructorInExport ("", ""))); f_RnEntry_rnEntryTemplate = (v_rnTemplate (C_RnErr_AmbiguousConstructorInExport ("", ""))); f_RnEntry_rnEntryDesc = "\229\175\188\229\135\186\228\184\173\230\158\132\233\128\160\229\173\144\230\173\167\228\185\137" }, (B_dData_dList.C_List__x58__x58_ ({ f_RnEntry_rnEntryCode = (v_rnCode (C_RnErr_TypeNotExported ("", ""))); f_RnEntry_rnEntryTemplate = (v_rnTemplate (C_RnErr_TypeNotExported ("", ""))); f_RnEntry_rnEntryDesc = "\231\177\187\229\158\139\230\156\170\232\162\171\229\175\188\229\135\186" }, (B_dData_dList.C_List__x58__x58_ ({ f_RnEntry_rnEntryCode = (v_rnCode (C_RnErr_ValueNotExported ("", ""))); f_RnEntry_rnEntryTemplate = (v_rnTemplate (C_RnErr_ValueNotExported ("", ""))); f_RnEntry_rnEntryDesc = "\229\128\188\230\156\170\232\162\171\229\175\188\229\135\186" }, (B_dData_dList.C_List__x58__x58_ ({ f_RnEntry_rnEntryCode = (v_rnCode (C_RnErr_MacroArity ("", "", ""))); f_RnEntry_rnEntryTemplate = (v_rnTemplate (C_RnErr_MacroArity ("", "", ""))); f_RnEntry_rnEntryDesc = "\229\174\143\229\174\158\229\143\130\228\184\170\230\149\176\228\184\141\229\140\185\233\133\141" }, (B_dData_dList.C_List__x58__x58_ ({ f_RnEntry_rnEntryCode = (v_rnCode (C_RnErr_SelectorConflict ("", ""))); f_RnEntry_rnEntryTemplate = (v_rnTemplate (C_RnErr_SelectorConflict ("", ""))); f_RnEntry_rnEntryDesc = "\229\173\151\230\174\181\233\128\137\230\139\169\229\153\168\232\162\171\229\164\154\228\184\170 record \232\174\164\233\162\134" }, (B_dData_dList.C_List__x58__x58_ ({ f_RnEntry_rnEntryCode = (v_rnCode (C_RnErr_SelectorShared ("", ""))); f_RnEntry_rnEntryTemplate = (v_rnTemplate (C_RnErr_SelectorShared ("", ""))); f_RnEntry_rnEntryDesc = "\229\144\140\229\144\141\229\173\151\230\174\181\230\151\160\228\186\186\232\174\164\233\162\134\233\128\137\230\139\169\229\153\168" }, (B_dData_dList.C_List__x58__x58_ ({ f_RnEntry_rnEntryCode = (v_rnCode (C_RnErr_SelectorNameTaken ("", ""))); f_RnEntry_rnEntryTemplate = (v_rnTemplate (C_RnErr_SelectorNameTaken ("", ""))); f_RnEntry_rnEntryDesc = "\233\128\137\230\139\169\229\153\168\228\184\142\229\183\178\230\156\137\233\161\182\229\177\130\229\163\176\230\152\142\229\144\140\229\144\141" }, (B_dData_dList.C_List__x58__x58_ ({ f_RnEntry_rnEntryCode = (v_rnCode (C_RnErr_SelectorNotRecord (""))); f_RnEntry_rnEntryTemplate = (v_rnTemplate (C_RnErr_SelectorNotRecord (""))); f_RnEntry_rnEntryDesc = "deriving (Selectors) \231\148\168\229\156\168\233\157\158 record \228\184\138" }, (B_dData_dList.C_List__x58__x58_ ({ f_RnEntry_rnEntryCode = (v_rnCode (C_RnErr_AmbiguousName ("", "", ""))); f_RnEntry_rnEntryTemplate = (v_rnTemplate (C_RnErr_AmbiguousName ("", "", ""))); f_RnEntry_rnEntryDesc = "\229\175\188\229\133\165\231\154\132\230\157\161\231\155\174\229\144\141\230\173\167\228\185\137" }, B_dData_dList.C_List_Nil))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))

# 199 "Vuna/Compiler/Base/Diagnostics/Rn.vuna"
let v_rnEntryCode = (fun (p : t_RnEntry) -> (match p with
  | { f_RnEntry_rnEntryCode = dtb__92; f_RnEntry_rnEntryTemplate = dtb__93; f_RnEntry_rnEntryDesc = dtb__94 } -> dtb__92
  | _ -> failwith "DT: impossible branch"
))

# 200 "Vuna/Compiler/Base/Diagnostics/Rn.vuna"
let v_rnEntryTemplate = (fun (p : t_RnEntry) -> (match p with
  | { f_RnEntry_rnEntryCode = dtb__95; f_RnEntry_rnEntryTemplate = dtb__96; f_RnEntry_rnEntryDesc = dtb__97 } -> dtb__96
  | _ -> failwith "DT: impossible branch"
))

# 201 "Vuna/Compiler/Base/Diagnostics/Rn.vuna"
let v_rnEntryDesc = (fun (p : t_RnEntry) -> (match p with
  | { f_RnEntry_rnEntryCode = dtb__98; f_RnEntry_rnEntryTemplate = dtb__99; f_RnEntry_rnEntryDesc = dtb__100 } -> dtb__100
  | _ -> failwith "DT: impossible branch"
))
