open Vuna_runtime
# 23 "Vuna/Compiler/Native/Audit.vuna"
let v_auditErased = (fun (b : Ir_dModel.t_IrBinder) -> (b).Ir_dModel.f_IrBinder_irBinderErased)

# 27 "Vuna/Compiler/Native/Audit.vuna"
let v_auditRuntimeBinders = (fun (bs : Ir_dModel.t_IrBinder B_dData_dList.t_List) -> (B_dData_dList.v_length ((B_dData_dList.v_filter (fun (b : Ir_dModel.t_IrBinder) -> (B_dData_dBool.v_not (v_auditErased b)))) bs)))

# 31 "Vuna/Compiler/Native/Audit.vuna"
let v_auditSymSupported = (fun (sym : string) -> (if (if (sym = "&&") then true else (sym = "||")) then true else (if (sym = Ir_dRuntime.v_irRtNatSucc) then true else (match (Native_dRuntime.v_nativeRtTarget sym) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__0) -> true
  | B_dData_dMaybe.C_Maybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
))))

# 43 "Vuna/Compiler/Native/Audit.vuna"
let v_auditRtAppKeys = (fun (sym : string) (args : Ir_dModel.t_Ir B_dData_dList.t_List) -> (if (if (sym = "&&") then true else (sym = "||")) then B_dData_dList.C_List_Nil else (if (B_dData_dBool.v_not (v_auditSymSupported sym)) then (B_dData_dList.C_List__x58__x58_ (("symbol " ^ sym), B_dData_dList.C_List_Nil)) else (if ((B_dData_dList.v_length args) <> (Ir_dModel.v_irInlineArity sym)) then (B_dData_dList.C_List__x58__x58_ (("rt-app-arity " ^ sym), B_dData_dList.C_List_Nil)) else B_dData_dList.C_List_Nil))))

# 54 "Vuna/Compiler/Native/Audit.vuna"
let rec v_auditKeys = (fun (mc0 : Ir_dModel.t_IrDef B_dData_dList.t_List) (mc1 : Ir_dModel.t_Ir) -> (match mc1 with
  | Ir_dModel.C_Ir_IrEffBind (dtb__1, dtb__2, dtb__3) -> (B_dData_dList.C_List__x58__x58_ ("effect-bind", B_dData_dList.C_List_Nil))
  | Ir_dModel.C_Ir_IrEffThunk (dtb__4, dtb__5, dtb__6, dtb__7, dtb__8) -> ((v_auditKeys mc0) dtb__8)
  | Ir_dModel.C_Ir_IrRt (dtb__9) -> (if (v_auditSymSupported dtb__9) then B_dData_dList.C_List_Nil else (B_dData_dList.C_List__x58__x58_ (("symbol " ^ dtb__9), B_dData_dList.C_List_Nil)))
  | Ir_dModel.C_Ir_IrRtApp (dtb__10, dtb__11) -> ((B_dData_dList.v_append ((v_auditRtAppKeys dtb__10) dtb__11)) ((B_dData_dList.v_concatMap (v_auditKeys mc0)) dtb__11))
  | Ir_dModel.C_Ir_IrTail (dtb__12) -> ((v_auditKeys mc0) dtb__12)
  | Ir_dModel.C_Ir_IrApp (dtb__13, dtb__14, dtb__15) -> ((B_dData_dList.v_append ((v_auditKeys mc0) dtb__14)) ((v_auditKeys mc0) dtb__15))
  | Ir_dModel.C_Ir_IrLam (dtb__16, dtb__17, dtb__18) -> ((v_auditKeys mc0) dtb__18)
  | Ir_dModel.C_Ir_IrConcatMany (dtb__19) -> ((B_dData_dList.v_concatMap (v_auditKeys mc0)) dtb__19)
  | Ir_dModel.C_Ir_IrNatCase (dtb__20, dtb__21, dtb__22, dtb__23, dtb__24) -> ((B_dData_dList.v_append ((v_auditKeys mc0) dtb__20)) ((B_dData_dList.v_append ((v_auditAltMaybeKeys mc0) dtb__22)) ((B_dData_dList.v_append ((v_auditAltMaybeKeys mc0) dtb__23)) ((v_auditAltMaybeKeys mc0) dtb__24))))
  | Ir_dModel.C_Ir_IrCase (dtb__25, dtb__26, dtb__27, dtb__28) -> ((B_dData_dList.v_append ((v_auditKeys mc0) dtb__27)) ((B_dData_dList.v_concatMap (v_auditAltKeys mc0)) dtb__28))
  | Ir_dModel.C_Ir_IrRecUpd (dtb__29, dtb__30, dtb__31, dtb__32) -> ((B_dData_dList.v_append ((v_auditKeys mc0) dtb__29)) ((B_dData_dList.v_concatMap (fun (p : (string, Ir_dModel.t_Ir) B_dData_dPair.t_Pair) -> ((v_auditKeys mc0) (B_dData_dPair.v_secondOf p)))) dtb__31))
  | Ir_dModel.C_Ir_IrProj (dtb__33, dtb__34, dtb__35, dtb__36) -> ((v_auditKeys mc0) dtb__33)
  | Ir_dModel.C_Ir_IrRecord (dtb__37, dtb__38, dtb__39) -> ((B_dData_dList.v_concatMap (fun (p : (string, Ir_dModel.t_Ir) B_dData_dPair.t_Pair) -> ((v_auditKeys mc0) (B_dData_dPair.v_secondOf p)))) dtb__39)
  | Ir_dModel.C_Ir_IrCtor (dtb__40, dtb__41, dtb__42, dtb__43) -> ((B_dData_dList.v_concatMap (v_auditKeys mc0)) dtb__43)
  | Ir_dModel.C_Ir_IrIf (dtb__44, dtb__45, dtb__46) -> ((B_dData_dList.v_append ((v_auditKeys mc0) dtb__44)) ((B_dData_dList.v_append ((v_auditKeys mc0) dtb__45)) ((v_auditKeys mc0) dtb__46)))
  | Ir_dModel.C_Ir_IrLet (dtb__47, dtb__48, dtb__49) -> ((B_dData_dList.v_append ((B_dData_dList.v_append (if ((v_auditRuntimeBinders dtb__47) > 1) then (B_dData_dList.C_List__x58__x58_ ("multi-binder-let", B_dData_dList.C_List_Nil)) else B_dData_dList.C_List_Nil)) ((v_auditKeys mc0) dtb__48))) ((v_auditKeys mc0) dtb__49))
  | Ir_dModel.C_Ir_IrCast (dtb__50, dtb__51, dtb__52) -> ((v_auditKeys mc0) dtb__52)
  | Ir_dModel.C_Ir_IrFloatLit (dtb__53) -> B_dData_dList.C_List_Nil
  | Ir_dModel.C_Ir_IrBool (dtb__54) -> B_dData_dList.C_List_Nil
  | Ir_dModel.C_Ir_IrStr (dtb__55) -> B_dData_dList.C_List_Nil
  | Ir_dModel.C_Ir_IrInt (dtb__56) -> B_dData_dList.C_List_Nil
  | Ir_dModel.C_Ir_IrGlobal (dtb__57) -> B_dData_dList.C_List_Nil
  | Ir_dModel.C_Ir_IrVar (dtb__58) -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))
# 89 "Vuna/Compiler/Native/Audit.vuna"
and v_auditAltKeys = (fun (defs : Ir_dModel.t_IrDef B_dData_dList.t_List) (alt : Ir_dModel.t_IrAlt) -> ((v_auditKeys defs) (Ir_dModel.v_irAltBodyOf alt)))
# 92 "Vuna/Compiler/Native/Audit.vuna"
and v_auditAltMaybeKeys = (fun (mc0 : Ir_dModel.t_IrDef B_dData_dList.t_List) (mc1 : Ir_dModel.t_IrAlt B_dData_dMaybe.t_Maybe) -> (match mc1 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__59) -> ((v_auditAltKeys mc0) dtb__59)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 96 "Vuna/Compiler/Native/Audit.vuna"
let v_auditDefKeys = (fun (defs : Ir_dModel.t_IrDef B_dData_dList.t_List) (d : Ir_dModel.t_IrDef) -> (match (Ir_dModel.v_irDefBody d) with
  | B_dData_dMaybe.C_Maybe_Nothing -> (B_dData_dList.C_List__x58__x58_ (("extern " ^ (Ir_dModel.v_irDefName d)), B_dData_dList.C_List_Nil))
  | B_dData_dMaybe.C_Maybe_Just (dtb__60) -> ((v_auditKeys defs) dtb__60)
  | _ -> failwith "DT: impossible branch"
))

# 109 "Vuna/Compiler/Native/Audit.vuna"
let rec v_memKey = (fun (mc0 : string) (mc1 : string B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__61, dtb__62) -> (if (mc0 = dtb__61) then true else ((v_memKey mc0) dtb__62))
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 105 "Vuna/Compiler/Native/Audit.vuna"
let rec v_auditUniq = (fun (mc0 : string B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__63, dtb__64) -> (if ((v_memKey dtb__63) dtb__64) then (v_auditUniq dtb__64) else (B_dData_dList.C_List__x58__x58_ (dtb__63, (v_auditUniq dtb__64))))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 114 "Vuna/Compiler/Native/Audit.vuna"
let v_auditPrefixOf = (fun (key : string) -> (match ((B_dData_dString.v_split " ") key) with
  | B_dData_dList.C_List__x58__x58_ (dtb__65, dtb__66) -> dtb__65
  | B_dData_dList.C_List_Nil -> key
  | _ -> failwith "DT: impossible branch"
))

# 121 "Vuna/Compiler/Native/Audit.vuna"
let v_auditRestOf = (fun (key : string) -> (match ((B_dData_dString.v_split " ") key) with
  | B_dData_dList.C_List__x58__x58_ (dtb__67, dtb__68) -> (((B_dData_dList.v_foldl (fun (acc : string) (part : string) -> (if ((bi_strLength acc) = 0) then part else (String.concat "" [acc; " "; part])))) "") dtb__68)
  | B_dData_dList.C_List_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))

# 129 "Vuna/Compiler/Native/Audit.vuna"
let v_auditCategories = (B_dData_dList.C_List__x58__x58_ ("symbol", (B_dData_dList.C_List__x58__x58_ ("rt-app-arity", (B_dData_dList.C_List__x58__x58_ ("multi-binder-let", (B_dData_dList.C_List__x58__x58_ ("effect-bind", (B_dData_dList.C_List__x58__x58_ ("extern", B_dData_dList.C_List_Nil))))))))))

# 132 "Vuna/Compiler/Native/Audit.vuna"
let v_auditInCategory = (fun (cat : string) (key : string) -> ((v_auditPrefixOf key) = cat))

# 135 "Vuna/Compiler/Native/Audit.vuna"
let v_auditCategoryExamples = (fun (cat : string) (keys : string B_dData_dList.t_List) -> ((B_dData_dList.v_take 3) (v_auditUniq ((B_dData_dList.v_map v_auditRestOf) ((B_dData_dList.v_filter (v_auditInCategory cat)) keys)))))

# 139 "Vuna/Compiler/Native/Audit.vuna"
let v_auditExamplesText = (fun (cat : string) (keys : string B_dData_dList.t_List) -> (match ((v_auditCategoryExamples cat) keys) with
  | B_dData_dList.C_List_Nil -> ""
  | B_dData_dList.C_List__x58__x58_ (dtb__69, dtb__70) -> (String.concat "" [" ("; (((B_dData_dList.v_foldl (fun (acc : string) (e : string) -> (String.concat "" [acc; ", "; e]))) dtb__69) dtb__70); ")"])
  | _ -> failwith "DT: impossible branch"
))

# 145 "Vuna/Compiler/Native/Audit.vuna"
let v_auditCategoryLine = (fun (cat : string) (keys : string B_dData_dList.t_List) -> ((fun hits -> (if ((B_dData_dList.v_length hits) = 0) then "" else (String.concat "" ["    "; cat; " x"; (bi_strFromInt (B_dData_dList.v_length hits)); ((v_auditExamplesText cat) keys)]))) ((B_dData_dList.v_filter (v_auditInCategory cat)) keys)))

# 156 "Vuna/Compiler/Native/Audit.vuna"
let v_nativeAuditLines = (fun (defs : Ir_dModel.t_IrDef B_dData_dList.t_List) -> ((fun keys -> ((fun uniqs -> ((fun catLines -> (if ((B_dData_dList.v_length keys) = 0) then B_dData_dList.C_List_Nil else ((B_dData_dList.v_append (B_dData_dList.C_List__x58__x58_ ((String.concat "" ["  native audit: "; (bi_strFromInt (B_dData_dList.v_length keys)); " unsupported reference(s), "; (bi_strFromInt (B_dData_dList.v_length uniqs)); " kind(s)"]), B_dData_dList.C_List_Nil))) catLines))) ((B_dData_dList.v_filter (fun (l : string) -> ((bi_strLength l) > 0))) ((B_dData_dList.v_map (fun (c : string) -> ((v_auditCategoryLine c) keys))) v_auditCategories)))) (v_auditUniq keys))) ((B_dData_dList.v_concatMap (v_auditDefKeys defs)) defs)))

# 170 "Vuna/Compiler/Native/Audit.vuna"
let v_nativeAuditEnrich = (fun (mc0 : Native_dModel.t_NativeErr) (mc1 : Ir_dModel.t_IrDef B_dData_dList.t_List) -> (match mc0 with
  | Native_dModel.C_NativeErr_NativeInternal (dtb__71) -> mc0
  | Native_dModel.C_NativeErr_NativeUnsupported (dtb__72) -> ((fun lines -> (if ((B_dData_dList.v_length lines) = 0) then mc0 else (Native_dModel.C_NativeErr_NativeUnsupported ((String.concat "" [dtb__72; "\n"; (((B_dData_dList.v_foldl (fun (acc : string) (l : string) -> (String.concat "" [acc; "\n"; l]))) "") lines)]))))) (v_nativeAuditLines mc1))
  | _ -> failwith "DT: impossible branch"
))
