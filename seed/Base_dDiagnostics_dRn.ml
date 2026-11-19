open Vuna_runtime
type t_RnErr = C_RnErr_DuplicateImport | C_RnErr_AmbiguousConstructorExport of (string) | C_RnErr_AmbiguousModule of (string) * (string) | C_RnErr_DuplicateFixity of (string) | C_RnErr_BuiltinFixity of (string) | C_RnErr_CannotExportUnknownName of (string) | C_RnErr_DuplicateExport of (string) | C_RnErr_DuplicateModuleAlias of (string) | C_RnErr_InvalidModuleAlias of (string) | C_RnErr_InvalidTopLevelName of (string) | C_RnErr_InvalidTypeExpression of (string) | C_RnErr_InvalidVariableName of (string) | C_RnErr_ModuleAliasConflict of (string) | C_RnErr_ModuleNameMismatch of (string) | C_RnErr_ModuleNotImported of (string) | C_RnErr_TypeHasNoConstructor of (string) * (string) | C_RnErr_UnknownConstructor of (string) | C_RnErr_UnknownInterface of (string) | C_RnErr_UnknownType of (string) | C_RnErr_UnknownFixity of (string) | C_RnErr_UnknownVariable of (string) | C_RnErr_UnknownMacro of (string) | C_RnErr_AmbiguousPrelude of (string) | C_RnErr_AmbiguousConstructor of (string) * (string) | C_RnErr_AmbiguousConstructorInExport of (string) * (string) | C_RnErr_TypeNotExported of (string) * (string) | C_RnErr_ValueNotExported of (string) * (string) | C_RnErr_MacroArity of (string) * (string) * (string)
and t_RnEntry = { f_RnEntry_rnEntryCode : string; f_RnEntry_rnEntryTemplate : string; f_RnEntry_rnEntryDesc : string }

# 56 "Vuna/Compiler/Base/Diagnostics/Rn.vuna"
let v_rnCode = (fun (mc0 : t_RnErr) -> (match mc0 with
  | C_RnErr_MacroArity (dtb__0, dtb__1, dtb__2) -> "RN_MacroArity"
  | C_RnErr_ValueNotExported (dtb__3, dtb__4) -> "RN_ValueNotExported"
  | C_RnErr_TypeNotExported (dtb__5, dtb__6) -> "RN_TypeNotExported"
  | C_RnErr_AmbiguousConstructorInExport (dtb__7, dtb__8) -> "RN_AmbiguousConstructorInExport"
  | C_RnErr_AmbiguousConstructor (dtb__9, dtb__10) -> "RN_AmbiguousConstructor"
  | C_RnErr_AmbiguousPrelude (dtb__11) -> "RN_AmbiguousPrelude"
  | C_RnErr_UnknownMacro (dtb__12) -> "RN_UnknownMacro"
  | C_RnErr_UnknownVariable (dtb__13) -> "RN_UnknownVariable"
  | C_RnErr_UnknownFixity (dtb__14) -> "RN_UnknownFixity"
  | C_RnErr_UnknownType (dtb__15) -> "RN_UnknownType"
  | C_RnErr_UnknownInterface (dtb__16) -> "RN_UnknownInterface"
  | C_RnErr_UnknownConstructor (dtb__17) -> "RN_UnknownConstructor"
  | C_RnErr_TypeHasNoConstructor (dtb__18, dtb__19) -> "RN_TypeHasNoConstructor"
  | C_RnErr_ModuleNotImported (dtb__20) -> "RN_ModuleNotImported"
  | C_RnErr_ModuleNameMismatch (dtb__21) -> "RN_ModuleNameMismatch"
  | C_RnErr_ModuleAliasConflict (dtb__22) -> "RN_ModuleAliasConflict"
  | C_RnErr_InvalidVariableName (dtb__23) -> "RN_InvalidVariableName"
  | C_RnErr_InvalidTypeExpression (dtb__24) -> "RN_InvalidTypeExpression"
  | C_RnErr_InvalidTopLevelName (dtb__25) -> "RN_InvalidTopLevelName"
  | C_RnErr_InvalidModuleAlias (dtb__26) -> "RN_InvalidModuleAlias"
  | C_RnErr_DuplicateModuleAlias (dtb__27) -> "RN_DuplicateModuleAlias"
  | C_RnErr_DuplicateExport (dtb__28) -> "RN_DuplicateExport"
  | C_RnErr_CannotExportUnknownName (dtb__29) -> "RN_CannotExportUnknownName"
  | C_RnErr_BuiltinFixity (dtb__30) -> "RN_BuiltinFixity"
  | C_RnErr_DuplicateFixity (dtb__31) -> "RN_DuplicateFixity"
  | C_RnErr_AmbiguousModule (dtb__32, dtb__33) -> "RN_AmbiguousModule"
  | C_RnErr_AmbiguousConstructorExport (dtb__34) -> "RN_AmbiguousConstructorExport"
  | C_RnErr_DuplicateImport -> "RN_DuplicateImport"
  | _ -> failwith "DT: impossible branch"
))

# 87 "Vuna/Compiler/Base/Diagnostics/Rn.vuna"
let v_rnTemplate = (fun (mc0 : t_RnErr) -> (match mc0 with
  | C_RnErr_MacroArity (dtb__35, dtb__36, dtb__37) -> "macro <0> expects <1> argument(s), got <2>"
  | C_RnErr_ValueNotExported (dtb__38, dtb__39) -> "<0> is not exported by <1>"
  | C_RnErr_TypeNotExported (dtb__40, dtb__41) -> "type <0> is not exported by <1>"
  | C_RnErr_AmbiguousConstructorInExport (dtb__42, dtb__43) -> "ambiguous constructor <0> in <1> (export T(..) instead)"
  | C_RnErr_AmbiguousConstructor (dtb__44, dtb__45) -> "ambiguous constructor <0> (qualify it as <1>)"
  | C_RnErr_AmbiguousPrelude (dtb__46) -> "ambiguous implicit Prelude (found in: <0>)"
  | C_RnErr_UnknownMacro (dtb__47) -> "unknown macro <0>"
  | C_RnErr_UnknownVariable (dtb__48) -> "unbound variable <0>"
  | C_RnErr_BuiltinFixity (dtb__49) -> "the fixity of built-in operator <0> is fixed by the compiler (remove the declaration)"
  | C_RnErr_DuplicateFixity (dtb__50) -> "operator <0> has more than one fixity declaration (a symbol must have exactly one precedence/associativity in a program)"
  | C_RnErr_UnknownFixity (dtb__51) -> "unknown fixity for operator <0> (declare it with infixl/infixr/infix)"
  | C_RnErr_UnknownType (dtb__52) -> "unknown type <0>"
  | C_RnErr_UnknownInterface (dtb__53) -> "unknown interface <0>"
  | C_RnErr_UnknownConstructor (dtb__54) -> "unknown constructor <0>"
  | C_RnErr_TypeHasNoConstructor (dtb__55, dtb__56) -> "type <0> has no constructor <1>"
  | C_RnErr_ModuleNotImported (dtb__57) -> "module <0> is not imported"
  | C_RnErr_ModuleNameMismatch (dtb__58) -> "module name mismatch: source declares <0>"
  | C_RnErr_ModuleAliasConflict (dtb__59) -> "module alias <0> conflicts with an imported module"
  | C_RnErr_InvalidVariableName (dtb__60) -> "invalid variable name <0>"
  | C_RnErr_InvalidTypeExpression (dtb__61) -> "invalid type expression (<0>)"
  | C_RnErr_InvalidTopLevelName (dtb__62) -> "invalid top-level name <0>"
  | C_RnErr_InvalidModuleAlias (dtb__63) -> "invalid module alias <0>"
  | C_RnErr_DuplicateModuleAlias (dtb__64) -> "duplicate module alias <0>"
  | C_RnErr_DuplicateExport (dtb__65) -> "duplicate export <0>"
  | C_RnErr_CannotExportUnknownName (dtb__66) -> "cannot export unknown name <0>"
  | C_RnErr_AmbiguousModule (dtb__67, dtb__68) -> "ambiguous module <0> (found in: <1>)"
  | C_RnErr_AmbiguousConstructorExport (dtb__69) -> "ambiguous constructor export <0> (write T(..) or qualify it)"
  | C_RnErr_DuplicateImport -> "duplicate import"
  | _ -> failwith "DT: impossible branch"
))

# 123 "Vuna/Compiler/Base/Diagnostics/Rn.vuna"
let v_rnMsg = (fun (e : t_RnErr) (args : string B_dData_dVec.t_Vec) -> (((((Base_dDiag.v_diagNoLoc Base_dDiag.C_Severity_SevError) Base_dDiag.C_Phase_PhResolve) Base_dDiag.C_Category_CatNames) (v_rnCode e)) ((Base_dDiagnostics_dCommon.v_diagBody (v_rnTemplate e)) args)))

# 127 "Vuna/Compiler/Base/Diagnostics/Rn.vuna"
let v_rnErr = (fun (sp : Base_dSource.t_Span) (e : t_RnErr) (args : string B_dData_dVec.t_Vec) -> (Base_dDiag.C_Check_ErrC (((Base_dDiag.v_withLabel { Base_dDiag.f_Label_labelSpan = (B_dData_dMaybe.C_Maybe_Just (sp)); Base_dDiag.f_Label_labelText = ""; Base_dDiag.f_Label_labelStyle = Base_dDiag.C_LabelStyle_LabelPrimary; Base_dDiag.f_Label_labelProvenance = B_dData_dMaybe.C_Maybe_Nothing }) ((v_rnMsg e) args)))))

# 131 "Vuna/Compiler/Base/Diagnostics/Rn.vuna"
let v_rnNoLoc = (fun (e : t_RnErr) (args : string B_dData_dVec.t_Vec) -> (Base_dDiag.C_Check_ErrC (((v_rnMsg e) args))))

# 135 "Vuna/Compiler/Base/Diagnostics/Rn.vuna"
let v_rnAt0 = (fun (sp : Base_dSource.t_Span) (e : t_RnErr) -> (((v_rnErr sp) e) B_dData_dVec.C_Vec_Nil))

# 139 "Vuna/Compiler/Base/Diagnostics/Rn.vuna"
let v_rnAt1 = (fun (sp : Base_dSource.t_Span) (e : t_RnErr) (a0 : string) -> (((v_rnErr sp) e) (B_dData_dVec.C_Vec_VCons (a0, B_dData_dVec.C_Vec_Nil))))

# 143 "Vuna/Compiler/Base/Diagnostics/Rn.vuna"
let v_rnAt2 = (fun (sp : Base_dSource.t_Span) (e : t_RnErr) (a0 : string) (a1 : string) -> (((v_rnErr sp) e) (B_dData_dVec.C_Vec_VCons (a0, (B_dData_dVec.C_Vec_VCons (a1, B_dData_dVec.C_Vec_Nil))))))

# 147 "Vuna/Compiler/Base/Diagnostics/Rn.vuna"
let v_rnAt3 = (fun (sp : Base_dSource.t_Span) (e : t_RnErr) (a0 : string) (a1 : string) (a2 : string) -> (((v_rnErr sp) e) (B_dData_dVec.C_Vec_VCons (a0, (B_dData_dVec.C_Vec_VCons (a1, (B_dData_dVec.C_Vec_VCons (a2, B_dData_dVec.C_Vec_Nil))))))))

# 151 "Vuna/Compiler/Base/Diagnostics/Rn.vuna"
let v_rnNoLoc0 = (fun (e : t_RnErr) -> ((v_rnNoLoc e) B_dData_dVec.C_Vec_Nil))

# 155 "Vuna/Compiler/Base/Diagnostics/Rn.vuna"
let v_rnNoLoc1 = (fun (e : t_RnErr) (a0 : string) -> ((v_rnNoLoc e) (B_dData_dVec.C_Vec_VCons (a0, B_dData_dVec.C_Vec_Nil))))

# 159 "Vuna/Compiler/Base/Diagnostics/Rn.vuna"
let v_rnNoLoc2 = (fun (e : t_RnErr) (a0 : string) (a1 : string) -> ((v_rnNoLoc e) (B_dData_dVec.C_Vec_VCons (a0, (B_dData_dVec.C_Vec_VCons (a1, B_dData_dVec.C_Vec_Nil))))))

# 169 "Vuna/Compiler/Base/Diagnostics/Rn.vuna"
let v_rnAll = (B_dData_dList.C_List__x58__x58_ ({ f_RnEntry_rnEntryCode = (v_rnCode C_RnErr_DuplicateImport); f_RnEntry_rnEntryTemplate = (v_rnTemplate C_RnErr_DuplicateImport); f_RnEntry_rnEntryDesc = "\233\135\141\229\164\141\229\175\188\229\133\165" }, (B_dData_dList.C_List__x58__x58_ ({ f_RnEntry_rnEntryCode = (v_rnCode (C_RnErr_AmbiguousConstructorExport (""))); f_RnEntry_rnEntryTemplate = (v_rnTemplate (C_RnErr_AmbiguousConstructorExport (""))); f_RnEntry_rnEntryDesc = "\229\175\188\229\135\186\231\154\132\230\158\132\233\128\160\229\173\144\229\144\141\230\156\137\230\173\167\228\185\137" }, (B_dData_dList.C_List__x58__x58_ ({ f_RnEntry_rnEntryCode = (v_rnCode (C_RnErr_AmbiguousModule ("", ""))); f_RnEntry_rnEntryTemplate = (v_rnTemplate (C_RnErr_AmbiguousModule ("", ""))); f_RnEntry_rnEntryDesc = "\230\168\161\229\157\151\229\144\141\230\173\167\228\185\137" }, (B_dData_dList.C_List__x58__x58_ ({ f_RnEntry_rnEntryCode = (v_rnCode (C_RnErr_CannotExportUnknownName (""))); f_RnEntry_rnEntryTemplate = (v_rnTemplate (C_RnErr_CannotExportUnknownName (""))); f_RnEntry_rnEntryDesc = "\229\175\188\229\135\186\230\156\170\231\159\165\229\144\141\229\173\151" }, (B_dData_dList.C_List__x58__x58_ ({ f_RnEntry_rnEntryCode = (v_rnCode (C_RnErr_DuplicateExport (""))); f_RnEntry_rnEntryTemplate = (v_rnTemplate (C_RnErr_DuplicateExport (""))); f_RnEntry_rnEntryDesc = "\233\135\141\229\164\141\229\175\188\229\135\186" }, (B_dData_dList.C_List__x58__x58_ ({ f_RnEntry_rnEntryCode = (v_rnCode (C_RnErr_DuplicateModuleAlias (""))); f_RnEntry_rnEntryTemplate = (v_rnTemplate (C_RnErr_DuplicateModuleAlias (""))); f_RnEntry_rnEntryDesc = "\233\135\141\229\164\141\230\168\161\229\157\151\229\136\171\229\144\141" }, (B_dData_dList.C_List__x58__x58_ ({ f_RnEntry_rnEntryCode = (v_rnCode (C_RnErr_InvalidModuleAlias (""))); f_RnEntry_rnEntryTemplate = (v_rnTemplate (C_RnErr_InvalidModuleAlias (""))); f_RnEntry_rnEntryDesc = "\233\157\158\230\179\149\230\168\161\229\157\151\229\136\171\229\144\141" }, (B_dData_dList.C_List__x58__x58_ ({ f_RnEntry_rnEntryCode = (v_rnCode (C_RnErr_InvalidTopLevelName (""))); f_RnEntry_rnEntryTemplate = (v_rnTemplate (C_RnErr_InvalidTopLevelName (""))); f_RnEntry_rnEntryDesc = "\233\157\158\230\179\149\233\161\182\229\177\130\229\144\141" }, (B_dData_dList.C_List__x58__x58_ ({ f_RnEntry_rnEntryCode = (v_rnCode (C_RnErr_InvalidTypeExpression (""))); f_RnEntry_rnEntryTemplate = (v_rnTemplate (C_RnErr_InvalidTypeExpression (""))); f_RnEntry_rnEntryDesc = "\233\157\158\230\179\149\231\177\187\229\158\139\232\161\168\232\190\190\229\188\143" }, (B_dData_dList.C_List__x58__x58_ ({ f_RnEntry_rnEntryCode = (v_rnCode (C_RnErr_InvalidVariableName (""))); f_RnEntry_rnEntryTemplate = (v_rnTemplate (C_RnErr_InvalidVariableName (""))); f_RnEntry_rnEntryDesc = "\233\157\158\230\179\149\229\143\152\233\135\143\229\144\141" }, (B_dData_dList.C_List__x58__x58_ ({ f_RnEntry_rnEntryCode = (v_rnCode (C_RnErr_ModuleAliasConflict (""))); f_RnEntry_rnEntryTemplate = (v_rnTemplate (C_RnErr_ModuleAliasConflict (""))); f_RnEntry_rnEntryDesc = "\230\168\161\229\157\151\229\136\171\229\144\141\228\184\142\229\175\188\229\133\165\229\134\178\231\170\129" }, (B_dData_dList.C_List__x58__x58_ ({ f_RnEntry_rnEntryCode = (v_rnCode (C_RnErr_ModuleNameMismatch (""))); f_RnEntry_rnEntryTemplate = (v_rnTemplate (C_RnErr_ModuleNameMismatch (""))); f_RnEntry_rnEntryDesc = "\230\168\161\229\157\151\229\144\141\228\184\141\229\140\185\233\133\141" }, (B_dData_dList.C_List__x58__x58_ ({ f_RnEntry_rnEntryCode = (v_rnCode (C_RnErr_ModuleNotImported (""))); f_RnEntry_rnEntryTemplate = (v_rnTemplate (C_RnErr_ModuleNotImported (""))); f_RnEntry_rnEntryDesc = "\230\168\161\229\157\151\230\156\170\232\162\171\229\175\188\229\133\165" }, (B_dData_dList.C_List__x58__x58_ ({ f_RnEntry_rnEntryCode = (v_rnCode (C_RnErr_TypeHasNoConstructor ("", ""))); f_RnEntry_rnEntryTemplate = (v_rnTemplate (C_RnErr_TypeHasNoConstructor ("", ""))); f_RnEntry_rnEntryDesc = "\231\177\187\229\158\139\230\178\161\230\156\137\232\175\165\230\158\132\233\128\160\229\173\144" }, (B_dData_dList.C_List__x58__x58_ ({ f_RnEntry_rnEntryCode = (v_rnCode (C_RnErr_UnknownConstructor (""))); f_RnEntry_rnEntryTemplate = (v_rnTemplate (C_RnErr_UnknownConstructor (""))); f_RnEntry_rnEntryDesc = "\230\156\170\231\159\165\230\158\132\233\128\160\229\173\144" }, (B_dData_dList.C_List__x58__x58_ ({ f_RnEntry_rnEntryCode = (v_rnCode (C_RnErr_UnknownInterface (""))); f_RnEntry_rnEntryTemplate = (v_rnTemplate (C_RnErr_UnknownInterface (""))); f_RnEntry_rnEntryDesc = "\230\156\170\231\159\165\230\142\165\229\143\163" }, (B_dData_dList.C_List__x58__x58_ ({ f_RnEntry_rnEntryCode = (v_rnCode (C_RnErr_UnknownType (""))); f_RnEntry_rnEntryTemplate = (v_rnTemplate (C_RnErr_UnknownType (""))); f_RnEntry_rnEntryDesc = "\230\156\170\231\159\165\231\177\187\229\158\139" }, (B_dData_dList.C_List__x58__x58_ ({ f_RnEntry_rnEntryCode = (v_rnCode (C_RnErr_UnknownFixity (""))); f_RnEntry_rnEntryTemplate = (v_rnTemplate (C_RnErr_UnknownFixity (""))); f_RnEntry_rnEntryDesc = "\230\156\170\231\159\165\232\191\144\231\174\151\231\172\166 fixity" }, (B_dData_dList.C_List__x58__x58_ ({ f_RnEntry_rnEntryCode = (v_rnCode (C_RnErr_DuplicateFixity (""))); f_RnEntry_rnEntryTemplate = (v_rnTemplate (C_RnErr_DuplicateFixity (""))); f_RnEntry_rnEntryDesc = "\232\191\144\231\174\151\231\172\166 fixity \233\135\141\229\164\141\229\163\176\230\152\142" }, (B_dData_dList.C_List__x58__x58_ ({ f_RnEntry_rnEntryCode = (v_rnCode (C_RnErr_BuiltinFixity (""))); f_RnEntry_rnEntryTemplate = (v_rnTemplate (C_RnErr_BuiltinFixity (""))); f_RnEntry_rnEntryDesc = "\229\134\133\229\187\186\232\191\144\231\174\151\231\172\166 fixity \231\148\177\231\188\150\232\175\145\229\153\168\229\155\186\229\174\154" }, (B_dData_dList.C_List__x58__x58_ ({ f_RnEntry_rnEntryCode = (v_rnCode (C_RnErr_UnknownVariable (""))); f_RnEntry_rnEntryTemplate = (v_rnTemplate (C_RnErr_UnknownVariable (""))); f_RnEntry_rnEntryDesc = "\230\156\170\231\187\145\229\174\154\229\143\152\233\135\143" }, (B_dData_dList.C_List__x58__x58_ ({ f_RnEntry_rnEntryCode = (v_rnCode (C_RnErr_UnknownMacro (""))); f_RnEntry_rnEntryTemplate = (v_rnTemplate (C_RnErr_UnknownMacro (""))); f_RnEntry_rnEntryDesc = "\230\156\170\231\159\165\229\174\143" }, (B_dData_dList.C_List__x58__x58_ ({ f_RnEntry_rnEntryCode = (v_rnCode (C_RnErr_AmbiguousPrelude (""))); f_RnEntry_rnEntryTemplate = (v_rnTemplate (C_RnErr_AmbiguousPrelude (""))); f_RnEntry_rnEntryDesc = "\233\154\144\229\188\143 Prelude \230\173\167\228\185\137" }, (B_dData_dList.C_List__x58__x58_ ({ f_RnEntry_rnEntryCode = (v_rnCode (C_RnErr_AmbiguousConstructor ("", ""))); f_RnEntry_rnEntryTemplate = (v_rnTemplate (C_RnErr_AmbiguousConstructor ("", ""))); f_RnEntry_rnEntryDesc = "\230\158\132\233\128\160\229\173\144\230\173\167\228\185\137" }, (B_dData_dList.C_List__x58__x58_ ({ f_RnEntry_rnEntryCode = (v_rnCode (C_RnErr_AmbiguousConstructorInExport ("", ""))); f_RnEntry_rnEntryTemplate = (v_rnTemplate (C_RnErr_AmbiguousConstructorInExport ("", ""))); f_RnEntry_rnEntryDesc = "\229\175\188\229\135\186\228\184\173\230\158\132\233\128\160\229\173\144\230\173\167\228\185\137" }, (B_dData_dList.C_List__x58__x58_ ({ f_RnEntry_rnEntryCode = (v_rnCode (C_RnErr_TypeNotExported ("", ""))); f_RnEntry_rnEntryTemplate = (v_rnTemplate (C_RnErr_TypeNotExported ("", ""))); f_RnEntry_rnEntryDesc = "\231\177\187\229\158\139\230\156\170\232\162\171\229\175\188\229\135\186" }, (B_dData_dList.C_List__x58__x58_ ({ f_RnEntry_rnEntryCode = (v_rnCode (C_RnErr_ValueNotExported ("", ""))); f_RnEntry_rnEntryTemplate = (v_rnTemplate (C_RnErr_ValueNotExported ("", ""))); f_RnEntry_rnEntryDesc = "\229\128\188\230\156\170\232\162\171\229\175\188\229\135\186" }, (B_dData_dList.C_List__x58__x58_ ({ f_RnEntry_rnEntryCode = (v_rnCode (C_RnErr_MacroArity ("", "", ""))); f_RnEntry_rnEntryTemplate = (v_rnTemplate (C_RnErr_MacroArity ("", "", ""))); f_RnEntry_rnEntryDesc = "\229\174\143\229\174\158\229\143\130\228\184\170\230\149\176\228\184\141\229\140\185\233\133\141" }, B_dData_dList.C_List_Nil))))))))))))))))))))))))))))))))))))))))))))))))))))))))
