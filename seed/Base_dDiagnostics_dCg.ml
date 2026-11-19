open Vuna_runtime
type t_CgErr = C_CgErr_DependencyCycle | C_CgErr_InterpCannotExecuteEffects | C_CgErr_MainNotValue | C_CgErr_NoMain | C_CgErr_TypeUsedAtRuntime | C_CgErr_AxiomAtRuntime of (string) | C_CgErr_ListBridgeRequired of (string) | C_CgErr_RecursiveValueDefinition of (string) | C_CgErr_TypeLevelBindingRuntime of (string) | C_CgErr_TypeLevelNameRuntime of (string) | C_CgErr_UnsolvedMetavarRuntime of (string)
and t_CgEntry = { f_CgEntry_cgEntryCode : string; f_CgEntry_cgEntryTemplate : string; f_CgEntry_cgEntryDesc : string }

# 32 "Vuna/Compiler/Base/Diagnostics/Cg.vuna"
let v_cgCode = (fun (mc0 : t_CgErr) -> (match mc0 with
  | C_CgErr_UnsolvedMetavarRuntime (dtb__0) -> "CG_UnsolvedMetavarRuntime"
  | C_CgErr_TypeLevelNameRuntime (dtb__1) -> "CG_TypeLevelNameRuntime"
  | C_CgErr_TypeLevelBindingRuntime (dtb__2) -> "CG_TypeLevelBindingRuntime"
  | C_CgErr_RecursiveValueDefinition (dtb__3) -> "CG_RecursiveValueDefinition"
  | C_CgErr_ListBridgeRequired (dtb__4) -> "CG_ListBridgeRequired"
  | C_CgErr_AxiomAtRuntime (dtb__5) -> "CG_AxiomAtRuntime"
  | C_CgErr_TypeUsedAtRuntime -> "CG_TypeUsedAtRuntime"
  | C_CgErr_NoMain -> "CG_NoMain"
  | C_CgErr_MainNotValue -> "CG_MainNotValue"
  | C_CgErr_InterpCannotExecuteEffects -> "CG_InterpCannotExecuteEffects"
  | C_CgErr_DependencyCycle -> "CG_DependencyCycle"
  | _ -> failwith "DT: impossible branch"
))

# 45 "Vuna/Compiler/Base/Diagnostics/Cg.vuna"
let v_cgTemplate = (fun (mc0 : t_CgErr) -> (match mc0 with
  | C_CgErr_UnsolvedMetavarRuntime (dtb__6) -> "unsolved metavariable in runtime code<0>"
  | C_CgErr_TypeLevelNameRuntime (dtb__7) -> "type-level name <0> is used at runtime"
  | C_CgErr_TypeLevelBindingRuntime (dtb__8) -> "type-level binding <0> is used at runtime"
  | C_CgErr_RecursiveValueDefinition (dtb__9) -> "top-level value definition <0> cannot be recursive, so make it a function or remove the cycle"
  | C_CgErr_ListBridgeRequired (dtb__10) -> "builtin <0> requires the canonical Base.Data.List.List declaration from vuna-base (no base dependency in this package)"
  | C_CgErr_AxiomAtRuntime (dtb__11) -> "axiom <0> cannot be used at runtime (it has no runtime definition)"
  | C_CgErr_TypeUsedAtRuntime -> "a type is used at runtime"
  | C_CgErr_NoMain -> "no main definition"
  | C_CgErr_MainNotValue -> "main does not reduce to a value"
  | C_CgErr_InterpCannotExecuteEffects -> "interp cannot execute effects (main : Eff [] a), so compile and run the program instead"
  | C_CgErr_DependencyCycle -> "dependency cycle between runtime definitions"
  | _ -> failwith "DT: impossible branch"
))

# 69 "Vuna/Compiler/Base/Diagnostics/Cg.vuna"
let v_cgChunk0 = (B_dData_dList.C_List__x58__x58_ ({ f_CgEntry_cgEntryCode = (v_cgCode C_CgErr_DependencyCycle); f_CgEntry_cgEntryTemplate = (v_cgTemplate C_CgErr_DependencyCycle); f_CgEntry_cgEntryDesc = "\232\191\144\232\161\140\230\151\182\229\174\154\228\185\137\233\151\180\228\190\157\232\181\150\230\136\144\231\142\175" }, (B_dData_dList.C_List__x58__x58_ ({ f_CgEntry_cgEntryCode = (v_cgCode C_CgErr_InterpCannotExecuteEffects); f_CgEntry_cgEntryTemplate = (v_cgTemplate C_CgErr_InterpCannotExecuteEffects); f_CgEntry_cgEntryDesc = "interp \228\184\141\232\131\189\230\137\167\232\161\140\230\149\136\229\186\148" }, (B_dData_dList.C_List__x58__x58_ ({ f_CgEntry_cgEntryCode = (v_cgCode C_CgErr_MainNotValue); f_CgEntry_cgEntryTemplate = (v_cgTemplate C_CgErr_MainNotValue); f_CgEntry_cgEntryDesc = "main \230\156\170\229\189\146\231\186\166\228\184\186\229\128\188" }, (B_dData_dList.C_List__x58__x58_ ({ f_CgEntry_cgEntryCode = (v_cgCode C_CgErr_NoMain); f_CgEntry_cgEntryTemplate = (v_cgTemplate C_CgErr_NoMain); f_CgEntry_cgEntryDesc = "\229\133\165\229\143\163\231\188\186\229\176\145 main \229\174\154\228\185\137" }, (B_dData_dList.C_List__x58__x58_ ({ f_CgEntry_cgEntryCode = (v_cgCode C_CgErr_TypeUsedAtRuntime); f_CgEntry_cgEntryTemplate = (v_cgTemplate C_CgErr_TypeUsedAtRuntime); f_CgEntry_cgEntryDesc = "\231\177\187\229\158\139\229\135\186\231\142\176\229\156\168\232\191\144\232\161\140\230\151\182" }, (B_dData_dList.C_List__x58__x58_ ({ f_CgEntry_cgEntryCode = (v_cgCode (C_CgErr_AxiomAtRuntime (""))); f_CgEntry_cgEntryTemplate = (v_cgTemplate (C_CgErr_AxiomAtRuntime (""))); f_CgEntry_cgEntryDesc = "axiom \229\135\186\231\142\176\229\156\168\232\191\144\232\161\140\230\151\182\239\188\136\229\174\131\230\178\161\230\156\137\232\191\144\232\161\140\230\151\182\229\174\154\228\185\137\239\188\137" }, (B_dData_dList.C_List__x58__x58_ ({ f_CgEntry_cgEntryCode = (v_cgCode (C_CgErr_ListBridgeRequired (""))); f_CgEntry_cgEntryTemplate = (v_cgTemplate (C_CgErr_ListBridgeRequired (""))); f_CgEntry_cgEntryDesc = "\229\134\133\229\187\186\233\156\128\232\166\129 vuna-base \231\154\132 Base.Data.List.List \229\163\176\230\152\142\230\137\141\232\131\189\230\161\165\230\142\165\239\188\140\228\189\134\229\140\133\229\134\133\230\178\161\230\156\137 base \228\190\157\232\181\150" }, B_dData_dList.C_List_Nil))))))))))))))

# 90 "Vuna/Compiler/Base/Diagnostics/Cg.vuna"
let v_cgChunk1 = (B_dData_dList.C_List__x58__x58_ ({ f_CgEntry_cgEntryCode = (v_cgCode (C_CgErr_RecursiveValueDefinition (""))); f_CgEntry_cgEntryTemplate = (v_cgTemplate (C_CgErr_RecursiveValueDefinition (""))); f_CgEntry_cgEntryDesc = "\233\128\146\229\189\146\231\187\132\228\184\173\231\154\132\233\155\182\229\143\130\229\128\188\229\174\154\228\185\137\230\151\160\230\179\149\229\174\137\229\133\168\231\148\159\230\136\144" }, (B_dData_dList.C_List__x58__x58_ ({ f_CgEntry_cgEntryCode = (v_cgCode (C_CgErr_TypeLevelBindingRuntime (""))); f_CgEntry_cgEntryTemplate = (v_cgTemplate (C_CgErr_TypeLevelBindingRuntime (""))); f_CgEntry_cgEntryDesc = "\231\177\187\229\158\139\231\186\167\231\187\145\229\174\154\229\135\186\231\142\176\229\156\168\232\191\144\232\161\140\230\151\182" }, (B_dData_dList.C_List__x58__x58_ ({ f_CgEntry_cgEntryCode = (v_cgCode (C_CgErr_TypeLevelNameRuntime (""))); f_CgEntry_cgEntryTemplate = (v_cgTemplate (C_CgErr_TypeLevelNameRuntime (""))); f_CgEntry_cgEntryDesc = "\231\177\187\229\158\139\231\186\167\229\144\141\229\173\151\229\135\186\231\142\176\229\156\168\232\191\144\232\161\140\230\151\182" }, (B_dData_dList.C_List__x58__x58_ ({ f_CgEntry_cgEntryCode = (v_cgCode (C_CgErr_UnsolvedMetavarRuntime (""))); f_CgEntry_cgEntryTemplate = (v_cgTemplate (C_CgErr_UnsolvedMetavarRuntime (""))); f_CgEntry_cgEntryDesc = "\232\191\144\232\161\140\230\151\182\228\187\163\231\160\129\228\184\173\229\173\152\229\156\168\230\156\170\232\167\163\229\133\131\229\143\152\233\135\143" }, B_dData_dList.C_List_Nil))))))))

# 66 "Vuna/Compiler/Base/Diagnostics/Cg.vuna"
let v_cgAll = (Base_dDiagnostics_dCommon.v_concatLists (B_dData_dList.C_List__x58__x58_ (v_cgChunk0, (B_dData_dList.C_List__x58__x58_ (v_cgChunk1, B_dData_dList.C_List_Nil)))))

# 114 "Vuna/Compiler/Base/Diagnostics/Cg.vuna"
let v_cgMsg = (fun (e : t_CgErr) (args : string B_dData_dVec.t_Vec) -> (((((Base_dDiagnostics_dCommon.v_mkDiag Base_dDiag.C_Severity_SevError) Base_dDiag.C_Phase_PhCodegen) Base_dDiag.C_Category_CatCodegen) (v_cgCode e)) ((Base_dDiagnostics_dCommon.v_diagBody (v_cgTemplate e)) args)))

# 117 "Vuna/Compiler/Base/Diagnostics/Cg.vuna"
let v_cgErr = (fun (e : t_CgErr) (args : string B_dData_dVec.t_Vec) -> (Base_dDiag.C_Check_ErrC (((v_cgMsg e) args))))

# 121 "Vuna/Compiler/Base/Diagnostics/Cg.vuna"
let v_cgErr0 = (fun (e : t_CgErr) -> ((v_cgErr e) B_dData_dVec.C_Vec_Nil))

# 125 "Vuna/Compiler/Base/Diagnostics/Cg.vuna"
let v_cgErr1 = (fun (e : t_CgErr) (a0 : string) -> ((v_cgErr e) (B_dData_dVec.C_Vec_VCons (a0, B_dData_dVec.C_Vec_Nil))))

# 129 "Vuna/Compiler/Base/Diagnostics/Cg.vuna"
let v_cgErr0At = (fun (sp : Base_dSource.t_Span) (e : t_CgErr) -> (Base_dDiag.C_Check_ErrC (((Base_dDiag.v_withLabel { Base_dDiag.f_Label_labelSpan = (B_dData_dMaybe.C_Maybe_Just (sp)); Base_dDiag.f_Label_labelText = ""; Base_dDiag.f_Label_labelStyle = Base_dDiag.C_LabelStyle_LabelPrimary; Base_dDiag.f_Label_labelProvenance = B_dData_dMaybe.C_Maybe_Nothing }) ((v_cgMsg e) B_dData_dVec.C_Vec_Nil)))))

# 135 "Vuna/Compiler/Base/Diagnostics/Cg.vuna"
let v_cgErrDefAt = (fun (span : Base_dSource.t_Span B_dData_dMaybe.t_Maybe) (name : string) (e : t_CgErr) (args : string B_dData_dVec.t_Vec) -> (Base_dDiag.C_Check_ErrC ((((Base_dDiag.v_withContext span) name) ((v_cgMsg e) args)))))
