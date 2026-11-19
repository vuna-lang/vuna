open Vuna_runtime
# 23 "Vuna/Compiler/Native/Audit.vuna"
let v_Vuna_dCompiler_dNative_dAudit_dauditErased = (fun b -> (b).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrBinder_irBinderErased)

# 27 "Vuna/Compiler/Native/Audit.vuna"
let v_Vuna_dCompiler_dNative_dAudit_dauditRuntimeBinders = (fun bs -> (Base_dData_dList.v_Base_dData_dList_dlength ((Base_dData_dList.v_Base_dData_dList_dfilter (fun (b : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrBinder) -> (Base_dData_dBool.v_Base_dData_dBool_dnot (v_Vuna_dCompiler_dNative_dAudit_dauditErased b)))) bs)))

# 31 "Vuna/Compiler/Native/Audit.vuna"
let v_Vuna_dCompiler_dNative_dAudit_dauditSymSupported = (fun sym -> (if (if (sym = "&&") then true else (sym = "||")) then true else (if (sym = Vuna_dCompiler_dIr_dRuntime.v_Vuna_dCompiler_dIr_dRuntime_dirRtNatSucc) then true else (match (Vuna_dCompiler_dNative_dRuntime.v_Vuna_dCompiler_dNative_dRuntime_dnativeRtTarget sym) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__0) -> true
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
))))

# 43 "Vuna/Compiler/Native/Audit.vuna"
let v_Vuna_dCompiler_dNative_dAudit_dauditRtAppKeys = (fun sym args -> (if (if (sym = "&&") then true else (sym = "||")) then Base_dData_dList.C_Base_dData_dList_dList_Nil else (if (Base_dData_dBool.v_Base_dData_dBool_dnot (v_Vuna_dCompiler_dNative_dAudit_dauditSymSupported sym)) then (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (("symbol " ^ sym), Base_dData_dList.C_Base_dData_dList_dList_Nil)) else (if ((Base_dData_dList.v_Base_dData_dList_dlength args) <> (Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirInlineArity sym)) then (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (("rt-app-arity " ^ sym), Base_dData_dList.C_Base_dData_dList_dList_Nil)) else Base_dData_dList.C_Base_dData_dList_dList_Nil))))

# 54 "Vuna/Compiler/Native/Audit.vuna"
let rec v_Vuna_dCompiler_dNative_dAudit_dauditKeys = (fun (mc0 : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrDef Base_dData_dList.t_Base_dData_dList_dList) (mc1 : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIr) -> (match mc1 with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrEffBind (dtb__1, dtb__2, dtb__3) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ("effect-bind", Base_dData_dList.C_Base_dData_dList_dList_Nil))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrEffThunk (dtb__4, dtb__5, dtb__6, dtb__7, dtb__8) -> ((v_Vuna_dCompiler_dNative_dAudit_dauditKeys mc0) dtb__8)
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRt (dtb__9) -> (if (v_Vuna_dCompiler_dNative_dAudit_dauditSymSupported dtb__9) then Base_dData_dList.C_Base_dData_dList_dList_Nil else (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (("symbol " ^ dtb__9), Base_dData_dList.C_Base_dData_dList_dList_Nil)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRtApp (dtb__10, dtb__11) -> ((Base_dData_dList.v_Base_dData_dList_dappend ((v_Vuna_dCompiler_dNative_dAudit_dauditRtAppKeys dtb__10) dtb__11)) ((Base_dData_dList.v_Base_dData_dList_dconcatMap (v_Vuna_dCompiler_dNative_dAudit_dauditKeys mc0)) dtb__11))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (dtb__12, dtb__13, dtb__14) -> ((Base_dData_dList.v_Base_dData_dList_dappend ((v_Vuna_dCompiler_dNative_dAudit_dauditKeys mc0) dtb__13)) ((v_Vuna_dCompiler_dNative_dAudit_dauditKeys mc0) dtb__14))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLam (dtb__15, dtb__16, dtb__17) -> ((v_Vuna_dCompiler_dNative_dAudit_dauditKeys mc0) dtb__17)
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrConcatMany (dtb__18) -> ((Base_dData_dList.v_Base_dData_dList_dconcatMap (v_Vuna_dCompiler_dNative_dAudit_dauditKeys mc0)) dtb__18)
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrNatCase (dtb__19, dtb__20, dtb__21, dtb__22, dtb__23) -> ((Base_dData_dList.v_Base_dData_dList_dappend ((v_Vuna_dCompiler_dNative_dAudit_dauditKeys mc0) dtb__19)) ((Base_dData_dList.v_Base_dData_dList_dappend ((v_Vuna_dCompiler_dNative_dAudit_dauditAltMaybeKeys mc0) dtb__21)) ((Base_dData_dList.v_Base_dData_dList_dappend ((v_Vuna_dCompiler_dNative_dAudit_dauditAltMaybeKeys mc0) dtb__22)) ((v_Vuna_dCompiler_dNative_dAudit_dauditAltMaybeKeys mc0) dtb__23))))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCase (dtb__24, dtb__25, dtb__26, dtb__27) -> ((Base_dData_dList.v_Base_dData_dList_dappend ((v_Vuna_dCompiler_dNative_dAudit_dauditKeys mc0) dtb__26)) ((Base_dData_dList.v_Base_dData_dList_dconcatMap (v_Vuna_dCompiler_dNative_dAudit_dauditAltKeys mc0)) dtb__27))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRecUpd (dtb__28, dtb__29, dtb__30, dtb__31) -> ((Base_dData_dList.v_Base_dData_dList_dappend ((v_Vuna_dCompiler_dNative_dAudit_dauditKeys mc0) dtb__28)) ((Base_dData_dList.v_Base_dData_dList_dconcatMap (fun (p : (string, Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIr) Base_dData_dPair.t_Base_dData_dPair_dPair) -> ((v_Vuna_dCompiler_dNative_dAudit_dauditKeys mc0) (Base_dData_dPair.v_Base_dData_dPair_dsecondOf p)))) dtb__30))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrProj (dtb__32, dtb__33, dtb__34, dtb__35) -> ((v_Vuna_dCompiler_dNative_dAudit_dauditKeys mc0) dtb__32)
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRecord (dtb__36, dtb__37, dtb__38) -> ((Base_dData_dList.v_Base_dData_dList_dconcatMap (fun (p : (string, Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIr) Base_dData_dPair.t_Base_dData_dPair_dPair) -> ((v_Vuna_dCompiler_dNative_dAudit_dauditKeys mc0) (Base_dData_dPair.v_Base_dData_dPair_dsecondOf p)))) dtb__38)
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCtor (dtb__39, dtb__40, dtb__41, dtb__42) -> ((Base_dData_dList.v_Base_dData_dList_dconcatMap (v_Vuna_dCompiler_dNative_dAudit_dauditKeys mc0)) dtb__42)
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrIf (dtb__43, dtb__44, dtb__45) -> ((Base_dData_dList.v_Base_dData_dList_dappend ((v_Vuna_dCompiler_dNative_dAudit_dauditKeys mc0) dtb__43)) ((Base_dData_dList.v_Base_dData_dList_dappend ((v_Vuna_dCompiler_dNative_dAudit_dauditKeys mc0) dtb__44)) ((v_Vuna_dCompiler_dNative_dAudit_dauditKeys mc0) dtb__45)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLet (dtb__46, dtb__47, dtb__48) -> ((Base_dData_dList.v_Base_dData_dList_dappend ((Base_dData_dList.v_Base_dData_dList_dappend (if ((v_Vuna_dCompiler_dNative_dAudit_dauditRuntimeBinders dtb__46) > 1) then (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ("multi-binder-let", Base_dData_dList.C_Base_dData_dList_dList_Nil)) else Base_dData_dList.C_Base_dData_dList_dList_Nil)) ((v_Vuna_dCompiler_dNative_dAudit_dauditKeys mc0) dtb__47))) ((v_Vuna_dCompiler_dNative_dAudit_dauditKeys mc0) dtb__48))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCast (dtb__49, dtb__50, dtb__51) -> ((v_Vuna_dCompiler_dNative_dAudit_dauditKeys mc0) dtb__51)
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrFloatLit (dtb__52) -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrBool (dtb__53) -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrStr (dtb__54) -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrInt (dtb__55) -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrGlobal (dtb__56) -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrVar (dtb__57) -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))
# 88 "Vuna/Compiler/Native/Audit.vuna"
and v_Vuna_dCompiler_dNative_dAudit_dauditAltKeys = (fun defs alt -> ((v_Vuna_dCompiler_dNative_dAudit_dauditKeys defs) (Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirAltBodyOf alt)))
# 91 "Vuna/Compiler/Native/Audit.vuna"
and v_Vuna_dCompiler_dNative_dAudit_dauditAltMaybeKeys = (fun (mc0 : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrDef Base_dData_dList.t_Base_dData_dList_dList) (mc1 : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrAlt Base_dData_dMaybe.t_Base_dData_dMaybe_dMaybe) -> (match mc1 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__58) -> ((v_Vuna_dCompiler_dNative_dAudit_dauditAltKeys mc0) dtb__58)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 95 "Vuna/Compiler/Native/Audit.vuna"
let v_Vuna_dCompiler_dNative_dAudit_dauditDefKeys = (fun defs d -> (match (Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirDefBody d) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (("extern " ^ (Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirDefName d)), Base_dData_dList.C_Base_dData_dList_dList_Nil))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__59) -> ((v_Vuna_dCompiler_dNative_dAudit_dauditKeys defs) dtb__59)
  | _ -> failwith "DT: impossible branch"
))

# 108 "Vuna/Compiler/Native/Audit.vuna"
let rec v_Vuna_dCompiler_dNative_dAudit_dmemKey = (fun (mc0 : string) (mc1 : string Base_dData_dList.t_Base_dData_dList_dList) -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__60, dtb__61) -> (if (mc0 = dtb__60) then true else ((v_Vuna_dCompiler_dNative_dAudit_dmemKey mc0) dtb__61))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 104 "Vuna/Compiler/Native/Audit.vuna"
let rec v_Vuna_dCompiler_dNative_dAudit_dauditUniq = (fun (mc0 : string Base_dData_dList.t_Base_dData_dList_dList) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__62, dtb__63) -> (if ((v_Vuna_dCompiler_dNative_dAudit_dmemKey dtb__62) dtb__63) then (v_Vuna_dCompiler_dNative_dAudit_dauditUniq dtb__63) else (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__62, (v_Vuna_dCompiler_dNative_dAudit_dauditUniq dtb__63))))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 113 "Vuna/Compiler/Native/Audit.vuna"
let v_Vuna_dCompiler_dNative_dAudit_dauditPrefixOf = (fun key -> (match ((Base_dData_dString.v_Base_dData_dString_dsplit " ") key) with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__64, dtb__65) -> dtb__64
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> key
  | _ -> failwith "DT: impossible branch"
))

# 120 "Vuna/Compiler/Native/Audit.vuna"
let v_Vuna_dCompiler_dNative_dAudit_dauditRestOf = (fun key -> (match ((Base_dData_dString.v_Base_dData_dString_dsplit " ") key) with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__66, dtb__67) -> (((Base_dData_dList.v_Base_dData_dList_dfoldl (fun (acc : string) (part : string) -> (if ((bi_strLength acc) = 0) then part else (String.concat "" [acc; " "; part])))) "") dtb__67)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))

# 128 "Vuna/Compiler/Native/Audit.vuna"
let v_Vuna_dCompiler_dNative_dAudit_dauditCategories = (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ("symbol", (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ("rt-app-arity", (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ("multi-binder-let", (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ("effect-bind", (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ("extern", Base_dData_dList.C_Base_dData_dList_dList_Nil))))))))))

# 131 "Vuna/Compiler/Native/Audit.vuna"
let v_Vuna_dCompiler_dNative_dAudit_dauditInCategory = (fun cat key -> ((v_Vuna_dCompiler_dNative_dAudit_dauditPrefixOf key) = cat))

# 134 "Vuna/Compiler/Native/Audit.vuna"
let v_Vuna_dCompiler_dNative_dAudit_dauditCategoryExamples = (fun cat keys -> ((Base_dData_dList.v_Base_dData_dList_dtake 3) (v_Vuna_dCompiler_dNative_dAudit_dauditUniq ((Base_dData_dList.v_Base_dData_dList_dmap v_Vuna_dCompiler_dNative_dAudit_dauditRestOf) ((Base_dData_dList.v_Base_dData_dList_dfilter (v_Vuna_dCompiler_dNative_dAudit_dauditInCategory cat)) keys)))))

# 138 "Vuna/Compiler/Native/Audit.vuna"
let v_Vuna_dCompiler_dNative_dAudit_dauditExamplesText = (fun cat keys -> (match ((v_Vuna_dCompiler_dNative_dAudit_dauditCategoryExamples cat) keys) with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> ""
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__68, dtb__69) -> (String.concat "" [" ("; (((Base_dData_dList.v_Base_dData_dList_dfoldl (fun (acc : string) (e : string) -> (String.concat "" [acc; ", "; e]))) dtb__68) dtb__69); ")"])
  | _ -> failwith "DT: impossible branch"
))

# 144 "Vuna/Compiler/Native/Audit.vuna"
let v_Vuna_dCompiler_dNative_dAudit_dauditCategoryLine = (fun cat keys -> ((fun hits -> (if ((Base_dData_dList.v_Base_dData_dList_dlength hits) = 0) then "" else (String.concat "" ["    "; cat; " x"; (bi_strFromInt (Base_dData_dList.v_Base_dData_dList_dlength hits)); ((v_Vuna_dCompiler_dNative_dAudit_dauditExamplesText cat) keys)]))) ((Base_dData_dList.v_Base_dData_dList_dfilter (v_Vuna_dCompiler_dNative_dAudit_dauditInCategory cat)) keys)))

# 155 "Vuna/Compiler/Native/Audit.vuna"
let v_Vuna_dCompiler_dNative_dAudit_dnativeAuditLines = (fun defs -> ((fun keys -> ((fun uniqs -> ((fun catLines -> (if ((Base_dData_dList.v_Base_dData_dList_dlength keys) = 0) then Base_dData_dList.C_Base_dData_dList_dList_Nil else ((Base_dData_dList.v_Base_dData_dList_dappend (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ((String.concat "" ["  native audit: "; (bi_strFromInt (Base_dData_dList.v_Base_dData_dList_dlength keys)); " unsupported reference(s), "; (bi_strFromInt (Base_dData_dList.v_Base_dData_dList_dlength uniqs)); " kind(s)"]), Base_dData_dList.C_Base_dData_dList_dList_Nil))) catLines))) ((Base_dData_dList.v_Base_dData_dList_dfilter (fun (l : string) -> ((bi_strLength l) > 0))) ((Base_dData_dList.v_Base_dData_dList_dmap (fun (c : string) -> ((v_Vuna_dCompiler_dNative_dAudit_dauditCategoryLine c) keys))) v_Vuna_dCompiler_dNative_dAudit_dauditCategories)))) (v_Vuna_dCompiler_dNative_dAudit_dauditUniq keys))) ((Base_dData_dList.v_Base_dData_dList_dconcatMap (v_Vuna_dCompiler_dNative_dAudit_dauditDefKeys defs)) defs)))

# 169 "Vuna/Compiler/Native/Audit.vuna"
let v_Vuna_dCompiler_dNative_dAudit_dnativeAuditEnrich = (fun (mc0 : Vuna_dCompiler_dNative_dModel.t_Vuna_dCompiler_dNative_dModel_dNativeErr) (mc1 : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrDef Base_dData_dList.t_Base_dData_dList_dList) -> (match mc0 with
  | Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dNativeErr_NativeInternal (dtb__70) -> mc0
  | Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dNativeErr_NativeUnsupported (dtb__71) -> ((fun lines -> (if ((Base_dData_dList.v_Base_dData_dList_dlength lines) = 0) then mc0 else (Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dNativeErr_NativeUnsupported ((String.concat "" [dtb__71; "\n"; (((Base_dData_dList.v_Base_dData_dList_dfoldl (fun (acc : string) (l : string) -> (String.concat "" [acc; "\n"; l]))) "") lines)]))))) (v_Vuna_dCompiler_dNative_dAudit_dnativeAuditLines mc1))
  | _ -> failwith "DT: impossible branch"
))
