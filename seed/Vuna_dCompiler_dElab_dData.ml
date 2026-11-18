open Vuna_runtime
# 69 "Vuna/Compiler/Elab/Data.vuna"
let rec v_Vuna_dCompiler_dElab_dData_dkindResultLevel = (fun (mc0 : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm) -> (match mc0 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TType (dtb__0) -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__0))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__1, dtb__2, dtb__3, dtb__4, dtb__5) -> (v_Vuna_dCompiler_dElab_dData_dkindResultLevel dtb__5)
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
))

# 94 "Vuna/Compiler/Elab/Data.vuna"
let rec v_Vuna_dCompiler_dElab_dData_dcountSurfacePis = (fun (mc0 : Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dExpr) -> (match mc0 with
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dExpr_EApp (dtb__6, dtb__7, dtb__8) -> (match dtb__6 with
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dExpr_EVar (dtb__9, dtb__10) -> (match dtb__9 with
  | Vuna_dCompiler_dFrontend_dRast_dName.C_Vuna_dCompiler_dFrontend_dRast_dName_dRName_RIntrinsic (dtb__11) -> (if (dtb__11 = "->") then (match dtb__7 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__12, dtb__13) -> (match dtb__13 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__14, dtb__15) -> (match dtb__15 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (1 + (v_Vuna_dCompiler_dElab_dData_dcountSurfacePis dtb__14))
  | _ -> 0
)
  | _ -> 0
)
  | _ -> 0
) else 0)
  | _ -> 0
)
  | _ -> 0
)
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dExpr_EPi (dtb__16, dtb__17, dtb__18, dtb__19, dtb__20, dtb__21) -> (1 + (v_Vuna_dCompiler_dElab_dData_dcountSurfacePis dtb__20))
  | _ -> 0
))

# 100 "Vuna/Compiler/Elab/Data.vuna"
let rec v_Vuna_dCompiler_dElab_dData_dcountTelePis = (fun (mc0 : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm) -> (match mc0 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__22, dtb__23, dtb__24, dtb__25, dtb__26) -> (1 + (v_Vuna_dCompiler_dElab_dData_dcountTelePis dtb__26))
  | _ -> 0
))

# 104 "Vuna/Compiler/Elab/Data.vuna"
let rec v_Vuna_dCompiler_dElab_dData_dctorFieldSortsGo = (fun (mc0 : (string, Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (mc1 : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dCtx) (mc2 : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dEc) (mc3 : int) (mc4 : int) (mc5 : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dLevel) (mc6 : string) (mc7 : Vuna_dCompiler_dBase_dSource.t_Vuna_dCompiler_dBase_dSource_dSpan) (mc8 : Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dExpr) -> (match mc8 with
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dExpr_EApp (dtb__27, dtb__28, dtb__29) -> (match dtb__27 with
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dExpr_EVar (dtb__30, dtb__31) -> (match dtb__30 with
  | Vuna_dCompiler_dFrontend_dRast_dName.C_Vuna_dCompiler_dFrontend_dRast_dName_dRName_RIntrinsic (dtb__32) -> (if (dtb__32 = "->") then (match dtb__28 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__33, dtb__34) -> (match dtb__34 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__35, dtb__36) -> (match dtb__36 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (((((((((((v_Vuna_dCompiler_dElab_dData_dctorFieldSortsBinder mc0) mc1) mc2) mc3) mc4) mc5) mc6) mc7) "_") dtb__33) dtb__35)
  | _ -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (mc2))
)
  | _ -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (mc2))
)
  | _ -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (mc2))
) else (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (mc2)))
  | _ -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (mc2))
)
  | _ -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (mc2))
)
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dExpr_EPi (dtb__37, dtb__38, dtb__39, dtb__40, dtb__41, dtb__42) -> (((((((((((v_Vuna_dCompiler_dElab_dData_dctorFieldSortsBinder mc0) mc1) mc2) mc3) mc4) mc5) mc6) mc7) dtb__37) dtb__40) dtb__41)
  | _ -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (mc2))
))
# 111 "Vuna/Compiler/Elab/Data.vuna"
and v_Vuna_dCompiler_dElab_dData_dctorFieldSortsBinder = (fun globals ctx ec pos arity famLevel cname csp name dom cod -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((Vuna_dCompiler_dElab_dTerm.v_Vuna_dCompiler_dElab_dTerm_dcheckType globals) ctx) ec) dom)) (fun (p : (Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm, (Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dLevel, Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dEc) Base_dData_dPair.t_Base_dData_dPair_dPair) Base_dData_dPair.t_Base_dData_dPair_dPair) -> ((fun nd_uscrut12 -> (match nd_uscrut12 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__43; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__44 } -> (match dtb__44 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__45; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__46 } -> ((fun ctx2 -> (if (pos < arity) then (((((((((v_Vuna_dCompiler_dElab_dData_dctorFieldSortsGo globals) ctx2) dtb__46) (pos + 1)) arity) famLevel) cname) csp) cod) else (if (if ((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dlevelLt dtb__45) famLevel) then true else ((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dlevelEq dtb__45) famLevel)) then (((((((((v_Vuna_dCompiler_dElab_dData_dctorFieldSortsGo globals) ctx2) dtb__46) (pos + 1)) arity) famLevel) cname) csp) cod) else ((fun field -> ((fun msg -> ((((Vuna_dCompiler_dBase_dDiagnostics_dTc.v_Vuna_dCompiler_dBase_dDiagnostics_dTc_dtcErr2 csp) (Vuna_dCompiler_dBase_dDiagnostics_dTc.C_Vuna_dCompiler_dBase_dDiagnostics_dTc_dTcErr_CtorError ((Vuna_dCompiler_dFrontend_dRast.v_Vuna_dCompiler_dFrontend_dRast_dctorDisplayName cname), msg))) (Vuna_dCompiler_dFrontend_dRast.v_Vuna_dCompiler_dFrontend_dRast_dctorDisplayName cname)) msg)) (String.concat "" ["field #"; (bi_strFromInt field); ": its type sorts into Type "; (bi_strFromInt (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dlevelToInt dtb__45)); ", above the family level Type "; (bi_strFromInt (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dlevelToInt famLevel))]))) (pos - arity))))) (((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxBind name) dtb__43) ctx))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) p))))

# 80 "Vuna/Compiler/Elab/Data.vuna"
let v_Vuna_dCompiler_dElab_dData_dcheckCtorFieldSorts = (fun globals ctx ec arity famLevel cname csp tyPis tyExpr -> ((fun surfacePis -> (if (surfacePis <> tyPis) then ((((Vuna_dCompiler_dBase_dDiagnostics_dTc.v_Vuna_dCompiler_dBase_dDiagnostics_dTc_dtcErr2 csp) (Vuna_dCompiler_dBase_dDiagnostics_dTc.C_Vuna_dCompiler_dBase_dDiagnostics_dTc_dTcErr_CtorError ((Vuna_dCompiler_dFrontend_dRast.v_Vuna_dCompiler_dFrontend_dRast_dctorDisplayName cname), "cannot verify the universe level of its field types; write the constructor type as a Pi chain"))) cname) "cannot verify the universe level of its field types; write the constructor type as a Pi chain") else (((((((((v_Vuna_dCompiler_dElab_dData_dctorFieldSortsGo globals) ctx) ec) 0) arity) famLevel) cname) csp) tyExpr))) (v_Vuna_dCompiler_dElab_dData_dcountSurfacePis tyExpr)))

# 26 "Vuna/Compiler/Elab/Data.vuna"
let v_Vuna_dCompiler_dElab_dData_delabCtor = (fun globals fam arity famLevel ec c -> (match c with
  | { Vuna_dCompiler_dFrontend_dRast.f_Vuna_dCompiler_dFrontend_dRast_dCtor_ctorName = dtb__47; Vuna_dCompiler_dFrontend_dRast.f_Vuna_dCompiler_dFrontend_dRast_dCtor_ctorType = dtb__48; Vuna_dCompiler_dFrontend_dRast.f_Vuna_dCompiler_dFrontend_dRast_dCtor_ctorArity = dtb__49; Vuna_dCompiler_dFrontend_dRast.f_Vuna_dCompiler_dFrontend_dRast_dCtor_ctorSpan = dtb__50 } -> ((fun famKind -> ((fun tyExpr2 -> ((fun gl -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((Vuna_dCompiler_dElab_dTerm.v_Vuna_dCompiler_dElab_dTerm_dcheckType gl) Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_demptyCtx) ec) tyExpr2)) (fun (pk : (Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm, (Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dLevel, Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dEc) Base_dData_dPair.t_Base_dData_dPair_dPair) Base_dData_dPair.t_Base_dData_dPair_dPair) -> ((fun nd_uscrut14 -> (match nd_uscrut14 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__51; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__52 } -> (match dtb__52 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__53; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__54 } -> ((fun tyTerm -> (match (Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dresultSpine (Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_ddropParams tyTerm)) with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__55; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__56 } -> (if (dtb__55 <> fam) then ((((Vuna_dCompiler_dBase_dDiagnostics_dTc.v_Vuna_dCompiler_dBase_dDiagnostics_dTc_dtcErr2 dtb__50) (Vuna_dCompiler_dBase_dDiagnostics_dTc.C_Vuna_dCompiler_dBase_dDiagnostics_dTc_dTcErr_CtorDoesNotReturn ((Vuna_dCompiler_dFrontend_dRast.v_Vuna_dCompiler_dFrontend_dRast_dctorDisplayName dtb__47), fam))) (Vuna_dCompiler_dFrontend_dRast.v_Vuna_dCompiler_dFrontend_dRast_dctorDisplayName dtb__47)) fam) else (if ((Base_dData_dList.v_Base_dData_dList_dlength dtb__56) <> arity) then ((((Vuna_dCompiler_dBase_dDiagnostics_dTc.v_Vuna_dCompiler_dBase_dDiagnostics_dTc_dtcErr2 dtb__50) (Vuna_dCompiler_dBase_dDiagnostics_dTc.C_Vuna_dCompiler_dBase_dDiagnostics_dTc_dTcErr_CtorWrongIndices ((Vuna_dCompiler_dFrontend_dRast.v_Vuna_dCompiler_dFrontend_dRast_dctorDisplayName dtb__47), fam))) (Vuna_dCompiler_dFrontend_dRast.v_Vuna_dCompiler_dFrontend_dRast_dctorDisplayName dtb__47)) fam) else ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((((((((v_Vuna_dCompiler_dElab_dData_dcheckCtorFieldSorts gl) Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_demptyCtx) dtb__54) arity) famLevel) dtb__47) dtb__50) (v_Vuna_dCompiler_dElab_dData_dcountTelePis tyTerm)) tyExpr2)) (fun (_u : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dEc) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = { Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtCtor_dtCtorName = dtb__47; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtCtor_dtCtorFamily = fam; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtCtor_dtCtorTelescope = (Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dteleOfType tyTerm); Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtCtor_dtCtorType = tyTerm; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtCtor_dtCtorSpan = (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__50)) }; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__54 }))))))
  | _ -> failwith "DT: impossible branch"
)) (((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dzonkTerm dtb__54) 0) dtb__51))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) pk)))) ((Base_dData_dList.v_Base_dData_dList_dappend globals) ((Base_dContainer_dHashMap.v_Base_dContainer_dHashMap_dtoList Base_dData_dString.v_Eq_uString) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decGlobalsTbl ec))))) (if (Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dhasFamParams dtb__48) then dtb__48 else (((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dprependFamParams famKind) dtb__48) dtb__50)))) (match ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dglobalLookup fam) globals) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__57) -> dtb__57
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TType (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dlevelZero))
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
))

# 51 "Vuna/Compiler/Elab/Data.vuna"
let rec v_Vuna_dCompiler_dElab_dData_delabCtors = (fun (mc0 : (string, Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (mc1 : string) (mc2 : int) (mc3 : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dLevel) (mc4 : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dEc) (mc5 : Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dCtor Base_dData_dList.t_Base_dData_dList_dList) -> (match mc5 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__58, dtb__59) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((((v_Vuna_dCompiler_dElab_dData_delabCtor mc0) mc1) mc2) mc3) mc4) dtb__58)) (fun (p : (Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dDtCtor, Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dEc) Base_dData_dPair.t_Base_dData_dPair_dPair) -> (match p with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__60; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__61 } -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((((v_Vuna_dCompiler_dElab_dData_delabCtors mc0) mc1) mc2) mc3) dtb__61) dtb__59)) (fun (q : (Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dDtCtor Base_dData_dList.t_Base_dData_dList_dList, Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dEc) Base_dData_dPair.t_Base_dData_dPair_dPair) -> (match q with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__62; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__63 } -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__60, dtb__62)); Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__63 }))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = Base_dData_dList.C_Base_dData_dList_dList_Nil; Base_dData_dPair.f_Base_dData_dPair_dPair_second = mc4 }))
  | _ -> failwith "DT: impossible branch"
))

# 134 "Vuna/Compiler/Elab/Data.vuna"
let v_Vuna_dCompiler_dElab_dData_delabDataHead = (fun globals ec ds -> (match ds with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__64; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__65 } -> (match dtb__64 with
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dDecl_DData (dtb__66, dtb__67, dtb__68, dtb__69, dtb__70, dtb__71, dtb__72, dtb__73, dtb__74) -> (if ((Base_dData_dList.v_Base_dData_dList_dmemName dtb__66) Vuna_dCompiler_dElab_dPrelude.v_Vuna_dCompiler_dElab_dPrelude_dpreludeNames) then (((Vuna_dCompiler_dBase_dDiagnostics_dTc.v_Vuna_dCompiler_dBase_dDiagnostics_dTc_dtcErr1 dtb__74) (Vuna_dCompiler_dBase_dDiagnostics_dTc.C_Vuna_dCompiler_dBase_dDiagnostics_dTc_dTcErr_CannotRedefineBuiltin (dtb__66))) dtb__66) else ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((Vuna_dCompiler_dElab_dTerm.v_Vuna_dCompiler_dElab_dTerm_dcheckType globals) Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_demptyCtx) ec) dtb__68)) (fun (pk : (Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm, (Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dLevel, Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dEc) Base_dData_dPair.t_Base_dData_dPair_dPair) Base_dData_dPair.t_Base_dData_dPair_dPair) -> ((fun nd_uscrut17 -> (match nd_uscrut17 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__75; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__76 } -> (match dtb__76 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__77; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__78 } -> ((fun fullKind -> ((fun tele -> ((fun arity -> (if (Base_dData_dBool.v_Base_dData_dBool_dnot (Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dkindWellFormed fullKind)) then ((Vuna_dCompiler_dBase_dDiagnostics_dTc.v_Vuna_dCompiler_dBase_dDiagnostics_dTc_dtcErr0 dtb__74) Vuna_dCompiler_dBase_dDiagnostics_dTc.C_Vuna_dCompiler_dBase_dDiagnostics_dTc_dTcErr_DataKindArrows) else (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = { Vuna_dCompiler_dElab_dMeta.f_Vuna_dCompiler_dElab_dMeta_dDataHead_dataHeadName = dtb__66; Vuna_dCompiler_dElab_dMeta.f_Vuna_dCompiler_dElab_dMeta_dDataHead_dataHeadKind = fullKind; Vuna_dCompiler_dElab_dMeta.f_Vuna_dCompiler_dElab_dMeta_dDataHead_dataHeadArity = arity }; Base_dData_dPair.f_Base_dData_dPair_dPair_second = { Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__66; Base_dData_dPair.f_Base_dData_dPair_dPair_second = fullKind }, Base_dData_dList.C_Base_dData_dList_dList_Nil)); Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__78 } })))) (Base_dData_dList.v_Base_dData_dList_dlength tele))) (Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dsplitKind fullKind))) ((Vuna_dCompiler_dElab_dPrelude.v_Vuna_dCompiler_dElab_dPrelude_dprependParams dtb__67) (((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dzonkTerm dtb__78) 0) dtb__75)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) pk))))
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dDecl_DRecord (dtb__79, dtb__80, dtb__81, dtb__82, dtb__83, dtb__84, dtb__85, dtb__86) -> (if ((Base_dData_dList.v_Base_dData_dList_dmemName dtb__79) Vuna_dCompiler_dElab_dPrelude.v_Vuna_dCompiler_dElab_dPrelude_dpreludeNames) then (((Vuna_dCompiler_dBase_dDiagnostics_dTc.v_Vuna_dCompiler_dBase_dDiagnostics_dTc_dtcErr1 dtb__86) (Vuna_dCompiler_dBase_dDiagnostics_dTc.C_Vuna_dCompiler_dBase_dDiagnostics_dTc_dTcErr_CannotRedefineBuiltin (dtb__79))) dtb__79) else ((fun fullKind -> ((fun arity -> (if (Base_dData_dBool.v_Base_dData_dBool_dnot (Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dkindWellFormed fullKind)) then ((Vuna_dCompiler_dBase_dDiagnostics_dTc.v_Vuna_dCompiler_dBase_dDiagnostics_dTc_dtcErr0 dtb__86) Vuna_dCompiler_dBase_dDiagnostics_dTc.C_Vuna_dCompiler_dBase_dDiagnostics_dTc_dTcErr_DataKindArrows) else (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = { Vuna_dCompiler_dElab_dMeta.f_Vuna_dCompiler_dElab_dMeta_dDataHead_dataHeadName = dtb__79; Vuna_dCompiler_dElab_dMeta.f_Vuna_dCompiler_dElab_dMeta_dDataHead_dataHeadKind = fullKind; Vuna_dCompiler_dElab_dMeta.f_Vuna_dCompiler_dElab_dMeta_dDataHead_dataHeadArity = arity }; Base_dData_dPair.f_Base_dData_dPair_dPair_second = { Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__79; Base_dData_dPair.f_Base_dData_dPair_dPair_second = fullKind }, Base_dData_dList.C_Base_dData_dList_dList_Nil)); Base_dData_dPair.f_Base_dData_dPair_dPair_second = ec } })))) (Base_dData_dList.v_Base_dData_dList_dlength dtb__80))) ((Vuna_dCompiler_dElab_dPrelude.v_Vuna_dCompiler_dElab_dPrelude_dprependParams dtb__80) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TType (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dlevelZero)))))
  | _ -> ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_derrAt dtb__65) "DT: internal: expected a data declaration")
)
  | _ -> failwith "DT: impossible branch"
))

# 168 "Vuna/Compiler/Elab/Data.vuna"
let rec v_Vuna_dCompiler_dElab_dData_delabDataHeadsRound = (fun (mc0 : (Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dDecl, Vuna_dCompiler_dBase_dSource.t_Vuna_dCompiler_dBase_dSource_dSpan) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (mc1 : (string, Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (mc2 : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dEc) (mc3 : Vuna_dCompiler_dElab_dMeta.t_Vuna_dCompiler_dElab_dMeta_dDataHead Base_dData_dList.t_Base_dData_dList_dList) (mc4 : (Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dDecl, Vuna_dCompiler_dBase_dSource.t_Vuna_dCompiler_dBase_dSource_dSpan) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__87, dtb__88) -> ((fun nd_uscrut8 -> (match nd_uscrut8 with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__89) -> (match dtb__89 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__90; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__91 } -> (match dtb__91 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__92; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__93 } -> (((((v_Vuna_dCompiler_dElab_dData_delabDataHeadsRound dtb__88) ((Base_dData_dList.v_Base_dData_dList_dappend mc1) dtb__92)) dtb__93) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__90, mc3))) mc4)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__94) -> (((((v_Vuna_dCompiler_dElab_dData_delabDataHeadsRound dtb__88) mc1) mc2) mc3) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__87, mc4)))
  | _ -> failwith "DT: impossible branch"
)) (((v_Vuna_dCompiler_dElab_dData_delabDataHead mc1) mc2) dtb__87))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> { Base_dData_dPair.f_Base_dData_dPair_dPair_first = mc3; Base_dData_dPair.f_Base_dData_dPair_dPair_second = { Base_dData_dPair.f_Base_dData_dPair_dPair_first = mc1; Base_dData_dPair.f_Base_dData_dPair_dPair_second = { Base_dData_dPair.f_Base_dData_dPair_dPair_first = mc2; Base_dData_dPair.f_Base_dData_dPair_dPair_second = (Base_dData_dList.v_Base_dData_dList_dreverse mc4) } } }
  | _ -> failwith "DT: impossible branch"
))

# 194 "Vuna/Compiler/Elab/Data.vuna"
let v_Vuna_dCompiler_dElab_dData_delabDataHeadsNoProgress = (fun (mc0 : (string, Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (mc1 : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dEc) (mc2 : (Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dDecl, Vuna_dCompiler_dBase_dSource.t_Vuna_dCompiler_dBase_dSource_dSpan) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) -> (match mc2 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__95, dtb__96) -> (match (((v_Vuna_dCompiler_dElab_dData_delabDataHead mc0) mc1) dtb__95) with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__97) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__97))
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__98) -> (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicInternal "data head registration made no progress")
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicInternal "no failed data declarations")
  | _ -> failwith "DT: impossible branch"
))

# 179 "Vuna/Compiler/Elab/Data.vuna"
let rec v_Vuna_dCompiler_dElab_dData_delabDataHeadsFuel = (fun fuel pending globals ec heads -> (if (fuel <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicInternal "data head registration fuel exhausted") else (match pending with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Base_dData_dList.v_Base_dData_dList_dreverse heads); Base_dData_dPair.f_Base_dData_dPair_dPair_second = { Base_dData_dPair.f_Base_dData_dPair_dPair_first = globals; Base_dData_dPair.f_Base_dData_dPair_dPair_second = ec } }))
  | _ -> ((fun nd_uscrut5 -> (match nd_uscrut5 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__99; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__100 } -> (match dtb__100 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__101; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__102 } -> (match dtb__102 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__103; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__104 } -> (match dtb__104 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Base_dData_dList.v_Base_dData_dList_dreverse dtb__99); Base_dData_dPair.f_Base_dData_dPair_dPair_second = { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__101; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__103 } }))
  | _ -> (if ((Base_dData_dList.v_Base_dData_dList_dlength dtb__104) = (Base_dData_dList.v_Base_dData_dList_dlength pending)) then (((v_Vuna_dCompiler_dElab_dData_delabDataHeadsNoProgress globals) ec) dtb__104) else (((((v_Vuna_dCompiler_dElab_dData_delabDataHeadsFuel (fuel - 1)) dtb__104) dtb__101) dtb__103) dtb__99))
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) (((((v_Vuna_dCompiler_dElab_dData_delabDataHeadsRound pending) globals) ec) heads) Base_dData_dList.C_Base_dData_dList_dList_Nil))
)))

# 176 "Vuna/Compiler/Elab/Data.vuna"
let v_Vuna_dCompiler_dElab_dData_delabDataHeads = (fun pending globals ec heads -> (((((v_Vuna_dCompiler_dElab_dData_delabDataHeadsFuel 64) pending) globals) ec) heads))

# 213 "Vuna/Compiler/Elab/Data.vuna"
let rec v_Vuna_dCompiler_dElab_dData_dskipParamPis = (fun (mc0 : int) (mc1 : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm) -> (match mc1 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__105, dtb__106, dtb__107, dtb__108, dtb__109) -> (if (mc0 <= 0) then mc1 else ((v_Vuna_dCompiler_dElab_dData_dskipParamPis (mc0 - 1)) dtb__109))
  | _ -> mc1
))

# 217 "Vuna/Compiler/Elab/Data.vuna"
let rec v_Vuna_dCompiler_dElab_dData_ddtFieldsOfRecordGo = (fun (mc0 : Vuna_dCompiler_dElab_dRecords.t_Vuna_dCompiler_dElab_dRecords_dRecordFieldMeta Base_dData_dList.t_Base_dData_dList_dList) (mc1 : int) (mc2 : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__110, dtb__111) -> (match mc2 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__112, dtb__113, dtb__114, dtb__115, dtb__116) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtFieldMeta_dtFieldName = (dtb__110).Vuna_dCompiler_dElab_dRecords.f_Vuna_dCompiler_dElab_dRecords_dRecordFieldMeta_recordFieldName; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtFieldMeta_dtFieldIndex = mc1; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtFieldMeta_dtFieldType = (((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dshift 0) (0 - mc1)) dtb__115) }, (((v_Vuna_dCompiler_dElab_dData_ddtFieldsOfRecordGo dtb__111) (mc1 + 1)) dtb__116)))
  | _ -> Base_dData_dList.C_Base_dData_dList_dList_Nil
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 204 "Vuna/Compiler/Elab/Data.vuna"
let v_Vuna_dCompiler_dElab_dData_ddtFieldsOfRecord = (fun records dname arity ctors -> (match ((Vuna_dCompiler_dElab_dRecords.v_Vuna_dCompiler_dElab_dRecords_dlookupRecord dname) records) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__117) -> ((fun nd_uscrut6 -> (match nd_uscrut6 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__118, dtb__119) -> (match dtb__119 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (((v_Vuna_dCompiler_dElab_dData_ddtFieldsOfRecordGo (dtb__117).Vuna_dCompiler_dElab_dRecords.f_Vuna_dCompiler_dElab_dRecords_dRecordMeta_recordMetaFields) 0) ((v_Vuna_dCompiler_dElab_dData_dskipParamPis arity) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorType dtb__118)))
  | _ -> Base_dData_dList.C_Base_dData_dList_dList_Nil
)
  | _ -> Base_dData_dList.C_Base_dData_dList_dList_Nil
)) ctors)
  | _ -> failwith "DT: impossible branch"
))

# 293 "Vuna/Compiler/Elab/Data.vuna"
let v_Vuna_dCompiler_dElab_dData_dsameCtorSet = (fun expected actual -> ((fun norm -> (if ((Base_dData_dList.v_Base_dData_dList_dlength expected) = (Base_dData_dList.v_Base_dData_dList_dlength actual)) then ((Base_dData_dList.v_Base_dData_dList_dallMem (norm expected)) (norm actual)) else false)) (Base_dData_dList.v_Base_dData_dList_dmap Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_dctorSpellingKey)))

# 225 "Vuna/Compiler/Elab/Data.vuna"
let rec v_Vuna_dCompiler_dElab_dData_delabDataBodies = (fun decls heads globals ec acc records -> (match decls with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Base_dData_dList.v_Base_dData_dList_dreverse acc); Base_dData_dPair.f_Base_dData_dPair_dPair_second = { Base_dData_dPair.f_Base_dData_dPair_dPair_first = globals; Base_dData_dPair.f_Base_dData_dPair_dPair_second = ec } }))
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__120, dtb__121) -> (match dtb__120 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__122; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__123 } -> (match dtb__122 with
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dDecl_DData (dtb__124, dtb__125, dtb__126, dtb__127, dtb__128, dtb__129, dtb__130, dtb__131, dtb__132) -> ((fun nd_uscrut22 -> (match nd_uscrut22 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__133) -> (match dtb__133 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__134; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__135 } -> ((fun tele -> ((fun famLevel -> (if dtb__129 then ((Vuna_dCompiler_dBase_dDiagnostics_dTc.v_Vuna_dCompiler_dBase_dDiagnostics_dTc_dtcErr0 dtb__132) Vuna_dCompiler_dBase_dDiagnostics_dTc.C_Vuna_dCompiler_dBase_dDiagnostics_dTc_dTcErr_DerivingViaOnlyRecord) else ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((((v_Vuna_dCompiler_dElab_dData_delabCtors globals) dtb__124) dtb__135) famLevel) ec) dtb__127)) (fun (q : (Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dDtCtor Base_dData_dList.t_Base_dData_dList_dList, Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dEc) Base_dData_dPair.t_Base_dData_dPair_dPair) -> (match q with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__136; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__137 } -> ((fun viaClasses -> ((fun fields -> ((fun dd -> (match (Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_dcanonicalCtorsFor dtb__124) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__138) -> (if ((v_Vuna_dCompiler_dElab_dData_dsameCtorSet dtb__138) ((Base_dData_dList.v_Base_dData_dList_dmap Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorName) dtb__136)) then ((((((v_Vuna_dCompiler_dElab_dData_delabDataBodies dtb__121) heads) ((Base_dData_dList.v_Base_dData_dList_dappend globals) (Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dctorGlobals dtb__136))) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decAddData dtb__137) dd)) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dd, acc))) records) else (((Vuna_dCompiler_dBase_dDiagnostics_dTc.v_Vuna_dCompiler_dBase_dDiagnostics_dTc_dtcErr1 dtb__132) (Vuna_dCompiler_dBase_dDiagnostics_dTc.C_Vuna_dCompiler_dBase_dDiagnostics_dTc_dTcErr_CannotRedefineBuiltin (dtb__124))) dtb__124))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> ((((((v_Vuna_dCompiler_dElab_dData_delabDataBodies dtb__121) heads) ((Base_dData_dList.v_Base_dData_dList_dappend globals) (Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dctorGlobals dtb__136))) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decAddData dtb__137) dd)) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dd, acc))) records)
  | _ -> failwith "DT: impossible branch"
)) { Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataName = dtb__124; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataParams = tele; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataCtors = dtb__136; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataKind = dtb__134; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataViaClasses = viaClasses; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataLinear = dtb__131; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataRepr = dtb__130; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataFields = fields; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataIsRecord = false })) ((((v_Vuna_dCompiler_dElab_dData_ddtFieldsOfRecord records) dtb__124) (Base_dData_dList.v_Base_dData_dList_dlength tele)) dtb__136))) (if dtb__129 then dtb__128 else Base_dData_dList.C_Base_dData_dList_dList_Nil))
  | _ -> failwith "DT: impossible branch"
))))) (match (v_Vuna_dCompiler_dElab_dData_dkindResultLevel dtb__134) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__139) -> dtb__139
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dlevelZero
  | _ -> failwith "DT: impossible branch"
))) (Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dsplitKind dtb__134))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_derrAt dtb__132) ("DT: internal: missing data head for " ^ dtb__124))
  | _ -> failwith "DT: impossible branch"
)) ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dlookupDataHead dtb__124) heads))
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dDecl_DRecord (dtb__140, dtb__141, dtb__142, dtb__143, dtb__144, dtb__145, dtb__146, dtb__147) -> ((fun nd_uscrut21 -> (match nd_uscrut21 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__148) -> (match dtb__148 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__149; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__150 } -> ((fun tele -> ((fun famLevel -> ((fun ctorExpr -> ((fun ctorAst -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((((v_Vuna_dCompiler_dElab_dData_delabCtors globals) dtb__140) dtb__150) famLevel) ec) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (ctorAst, Base_dData_dList.C_Base_dData_dList_dList_Nil)))) (fun (q : (Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dDtCtor Base_dData_dList.t_Base_dData_dList_dList, Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dEc) Base_dData_dPair.t_Base_dData_dPair_dPair) -> (match q with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__151; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__152 } -> ((fun viaClasses -> ((fun fieldsMeta -> ((fun dd -> (match (Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_dcanonicalCtorsFor dtb__140) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__153) -> (if ((v_Vuna_dCompiler_dElab_dData_dsameCtorSet dtb__153) ((Base_dData_dList.v_Base_dData_dList_dmap Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorName) dtb__151)) then ((((((v_Vuna_dCompiler_dElab_dData_delabDataBodies dtb__121) heads) ((Base_dData_dList.v_Base_dData_dList_dappend globals) (Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dctorGlobals dtb__151))) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decAddData dtb__152) dd)) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dd, acc))) records) else (((Vuna_dCompiler_dBase_dDiagnostics_dTc.v_Vuna_dCompiler_dBase_dDiagnostics_dTc_dtcErr1 dtb__147) (Vuna_dCompiler_dBase_dDiagnostics_dTc.C_Vuna_dCompiler_dBase_dDiagnostics_dTc_dTcErr_CannotRedefineBuiltin (dtb__140))) dtb__140))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> ((((((v_Vuna_dCompiler_dElab_dData_delabDataBodies dtb__121) heads) ((Base_dData_dList.v_Base_dData_dList_dappend globals) (Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dctorGlobals dtb__151))) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decAddData dtb__152) dd)) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dd, acc))) records)
  | _ -> failwith "DT: impossible branch"
)) { Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataName = dtb__140; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataParams = tele; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataCtors = dtb__151; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataKind = dtb__149; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataViaClasses = viaClasses; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataLinear = dtb__146; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataRepr = dtb__145; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataFields = fieldsMeta; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataIsRecord = true })) ((((v_Vuna_dCompiler_dElab_dData_ddtFieldsOfRecord records) dtb__140) (Base_dData_dList.v_Base_dData_dList_dlength tele)) dtb__151))) (if dtb__144 then dtb__143 else Base_dData_dList.C_Base_dData_dList_dList_Nil))
  | _ -> failwith "DT: impossible branch"
)))) { Vuna_dCompiler_dFrontend_dRast.f_Vuna_dCompiler_dFrontend_dRast_dCtor_ctorName = dtb__140; Vuna_dCompiler_dFrontend_dRast.f_Vuna_dCompiler_dFrontend_dRast_dCtor_ctorType = ctorExpr; Vuna_dCompiler_dFrontend_dRast.f_Vuna_dCompiler_dFrontend_dRast_dCtor_ctorArity = (Base_dData_dList.v_Base_dData_dList_dlength dtb__142); Vuna_dCompiler_dFrontend_dRast.f_Vuna_dCompiler_dFrontend_dRast_dCtor_ctorSpan = dtb__147 })) ((((Vuna_dCompiler_dElab_dRecords.v_Vuna_dCompiler_dElab_dRecords_drecordCtorType dtb__141) dtb__142) (((Vuna_dCompiler_dElab_dRecords.v_Vuna_dCompiler_dElab_dRecords_drecordRetType dtb__140) dtb__141) dtb__147)) dtb__147))) (match (v_Vuna_dCompiler_dElab_dData_dkindResultLevel dtb__149) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__154) -> dtb__154
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dlevelZero
  | _ -> failwith "DT: impossible branch"
))) (Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dsplitKind dtb__149))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_derrAt dtb__147) ("DT: internal: missing data head for " ^ dtb__140))
  | _ -> failwith "DT: impossible branch"
)) ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dlookupDataHead dtb__140) heads))
  | _ -> ((((((v_Vuna_dCompiler_dElab_dData_delabDataBodies dtb__121) heads) globals) ec) acc) records)
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 340 "Vuna/Compiler/Elab/Data.vuna"
let v_Vuna_dCompiler_dElab_dData_dreprIsAlias = (fun (mc0 : Vuna_dCompiler_dFrontend_dAst.t_Vuna_dCompiler_dFrontend_dAst_dReprTier) -> (match mc0 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dReprTier_ReprAlias -> true
  | _ -> false
))

# 350 "Vuna/Compiler/Elab/Data.vuna"
let v_Vuna_dCompiler_dElab_dData_dviaShapeOkWith = (fun dname datas fams info -> (if ((Base_dData_dList.v_Base_dData_dList_dmemName dname) fams) then ((fun nd_uscrut4 -> (match nd_uscrut4 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> false
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__155) -> (match dtb__155 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__156; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__157 } -> (match ((Vuna_dCompiler_dElab_dRepresentation.v_Vuna_dCompiler_dElab_dRepresentation_dfindDtData dname) datas) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__158) -> (dtb__157 = (Base_dData_dList.v_Base_dData_dList_dlength (dtb__158).Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataParams))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) ((Vuna_dCompiler_dElab_dRepresentation.v_Vuna_dCompiler_dElab_dRepresentation_dlookupUnboxedInfo dname) info)) else false))

# 334 "Vuna/Compiler/Elab/Data.vuna"
let v_Vuna_dCompiler_dElab_dData_dviaFieldOk = (fun (mc0 : Vuna_dCompiler_dFrontend_dAst.t_Vuna_dCompiler_dFrontend_dAst_dReprTier) (mc1 : string) (mc2 : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dDtData Base_dData_dList.t_Base_dData_dList_dList) (mc3 : string Base_dData_dList.t_Base_dData_dList_dList) (mc4 : (string, (Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dDtCtor, int) Base_dData_dPair.t_Base_dData_dPair_dPair) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) -> (match mc0 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dReprTier_ReprBoxed -> false
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dReprTier_ReprAuto -> ((((v_Vuna_dCompiler_dElab_dData_dviaShapeOkWith mc1) mc2) mc3) mc4)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dReprTier_ReprAlias -> ((((v_Vuna_dCompiler_dElab_dData_dviaShapeOkWith mc1) mc2) mc3) mc4)
  | _ -> failwith "DT: impossible branch"
))

# 307 "Vuna/Compiler/Elab/Data.vuna"
let rec v_Vuna_dCompiler_dElab_dData_dcheckViaDataDeclsGo = (fun (mc0 : (Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dDecl, Vuna_dCompiler_dBase_dSource.t_Vuna_dCompiler_dBase_dSource_dSpan) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (mc1 : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dDtData Base_dData_dList.t_Base_dData_dList_dList) (mc2 : string Base_dData_dList.t_Base_dData_dList_dList) (mc3 : (string, (Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dDtCtor, int) Base_dData_dPair.t_Base_dData_dPair_dPair) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__159, dtb__160) -> (match dtb__159 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__161; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__162 } -> (match dtb__161 with
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dDecl_DData (dtb__163, dtb__164, dtb__165, dtb__166, dtb__167, dtb__168, dtb__169, dtb__170, dtb__171) -> (if dtb__168 then ((Vuna_dCompiler_dBase_dDiagnostics_dTc.v_Vuna_dCompiler_dBase_dDiagnostics_dTc_dtcErr0 dtb__171) Vuna_dCompiler_dBase_dDiagnostics_dTc.C_Vuna_dCompiler_dBase_dDiagnostics_dTc_dTcErr_DerivingViaOnlyRecord) else (if (if (v_Vuna_dCompiler_dElab_dData_dreprIsAlias dtb__169) then (Base_dData_dBool.v_Base_dData_dBool_dnot ((Base_dData_dList.v_Base_dData_dList_dmemName dtb__163) mc2)) else false) then ((Vuna_dCompiler_dBase_dDiagnostics_dTc.v_Vuna_dCompiler_dBase_dDiagnostics_dTc_dtcErr0 dtb__171) Vuna_dCompiler_dBase_dDiagnostics_dTc.C_Vuna_dCompiler_dBase_dDiagnostics_dTc_dTcErr_ReprAliasInvalid) else ((((v_Vuna_dCompiler_dElab_dData_dcheckViaDataDeclsGo dtb__160) mc1) mc2) mc3)))
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dDecl_DRecord (dtb__172, dtb__173, dtb__174, dtb__175, dtb__176, dtb__177, dtb__178, dtb__179) -> (if (if (v_Vuna_dCompiler_dElab_dData_dreprIsAlias dtb__177) then (Base_dData_dBool.v_Base_dData_dBool_dnot ((Base_dData_dList.v_Base_dData_dList_dmemName dtb__172) mc2)) else false) then ((Vuna_dCompiler_dBase_dDiagnostics_dTc.v_Vuna_dCompiler_dBase_dDiagnostics_dTc_dtcErr0 dtb__179) Vuna_dCompiler_dBase_dDiagnostics_dTc.C_Vuna_dCompiler_dBase_dDiagnostics_dTc_dTcErr_ReprAliasInvalid) else (if dtb__176 then (if (((((v_Vuna_dCompiler_dElab_dData_dviaFieldOk dtb__177) dtb__172) mc1) mc2) mc3) then ((((v_Vuna_dCompiler_dElab_dData_dcheckViaDataDeclsGo dtb__160) mc1) mc2) mc3) else ((Vuna_dCompiler_dBase_dDiagnostics_dTc.v_Vuna_dCompiler_dBase_dDiagnostics_dTc_dtcErr0 dtb__179) Vuna_dCompiler_dBase_dDiagnostics_dTc.C_Vuna_dCompiler_dBase_dDiagnostics_dTc_dTcErr_DerivingViaUnboxedRequired)) else ((((v_Vuna_dCompiler_dElab_dData_dcheckViaDataDeclsGo dtb__160) mc1) mc2) mc3)))
  | _ -> ((((v_Vuna_dCompiler_dElab_dData_dcheckViaDataDeclsGo dtb__160) mc1) mc2) mc3)
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (0))
  | _ -> failwith "DT: impossible branch"
))

# 303 "Vuna/Compiler/Elab/Data.vuna"
let v_Vuna_dCompiler_dElab_dData_dcheckViaDataDecls = (fun decls datas -> ((((v_Vuna_dCompiler_dElab_dData_dcheckViaDataDeclsGo decls) datas) (Vuna_dCompiler_dElab_dRepresentation.v_Vuna_dCompiler_dElab_dRepresentation_dunboxedFamilySet datas)) (Vuna_dCompiler_dElab_dRepresentation.v_Vuna_dCompiler_dElab_dRepresentation_dunboxedInfoOf datas)))

# 347 "Vuna/Compiler/Elab/Data.vuna"
let v_Vuna_dCompiler_dElab_dData_dviaShapeOk = (fun dname datas -> ((((v_Vuna_dCompiler_dElab_dData_dviaShapeOkWith dname) datas) (Vuna_dCompiler_dElab_dRepresentation.v_Vuna_dCompiler_dElab_dRepresentation_dunboxedFamilySet datas)) (Vuna_dCompiler_dElab_dRepresentation.v_Vuna_dCompiler_dElab_dRepresentation_dunboxedInfoOf datas)))

# 364 "Vuna/Compiler/Elab/Data.vuna"
let v_Vuna_dCompiler_dElab_dData_delabDatas = (fun decls records globals ec -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((v_Vuna_dCompiler_dElab_dData_delabDataHeads decls) globals) ec) Base_dData_dList.C_Base_dData_dList_dList_Nil)) (fun (p : (Vuna_dCompiler_dElab_dMeta.t_Vuna_dCompiler_dElab_dMeta_dDataHead Base_dData_dList.t_Base_dData_dList_dList, ((string, Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList, Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dEc) Base_dData_dPair.t_Base_dData_dPair_dPair) Base_dData_dPair.t_Base_dData_dPair_dPair) -> ((fun nd_uscrut5 -> (match nd_uscrut5 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__180; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__181 } -> (match dtb__181 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__182; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__183 } -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((((v_Vuna_dCompiler_dElab_dData_delabDataBodies decls) dtb__180) dtb__182) dtb__183) Base_dData_dList.C_Base_dData_dList_dList_Nil) records)) (fun (q : (Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dDtData Base_dData_dList.t_Base_dData_dList_dList, ((string, Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList, Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dEc) Base_dData_dPair.t_Base_dData_dPair_dPair) Base_dData_dPair.t_Base_dData_dPair_dPair) -> (match q with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__184; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__185 } -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((v_Vuna_dCompiler_dElab_dData_dcheckViaDataDecls decls) dtb__184)) (fun (_u : int) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__184; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__185 }))))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) p))))

# 408 "Vuna/Compiler/Elab/Data.vuna"
let rec v_Vuna_dCompiler_dElab_dData_dctorFieldGo = (fun (mc0 : int) (mc1 : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm) (mc2 : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm Base_dData_dList.t_Base_dData_dList_dList) -> (match mc1 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__186, dtb__187, dtb__188, dtb__189, dtb__190) -> (if (mc0 > 0) then (((v_Vuna_dCompiler_dElab_dData_dctorFieldGo (mc0 - 1)) dtb__190) mc2) else (((v_Vuna_dCompiler_dElab_dData_dctorFieldGo 0) dtb__190) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__189, mc2))))
  | _ -> (Base_dData_dList.v_Base_dData_dList_dreverse mc2)
))

# 405 "Vuna/Compiler/Elab/Data.vuna"
let v_Vuna_dCompiler_dElab_dData_dctorFieldTerms = (fun arity ty -> (((v_Vuna_dCompiler_dElab_dData_dctorFieldGo arity) ty) Base_dData_dList.C_Base_dData_dList_dList_Nil))

# 420 "Vuna/Compiler/Elab/Data.vuna"
let rec v_Vuna_dCompiler_dElab_dData_dtermUsesVar = (fun (mc0 : int) (mc1 : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm) -> (match mc1 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TIf (dtb__191, dtb__192, dtb__193) -> (if (if ((v_Vuna_dCompiler_dElab_dData_dtermUsesVar mc0) dtb__191) then true else ((v_Vuna_dCompiler_dElab_dData_dtermUsesVar mc0) dtb__192)) then true else ((v_Vuna_dCompiler_dElab_dData_dtermUsesVar mc0) dtb__193))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TBool (dtb__194) -> false
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TFloat (dtb__195) -> false
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TStr (dtb__196) -> false
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TInt (dtb__197) -> false
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCase (dtb__198, dtb__199) -> (if ((v_Vuna_dCompiler_dElab_dData_dtermUsesVar mc0) dtb__198) then true else ((v_Vuna_dCompiler_dElab_dData_dtermUsesVarAlts mc0) dtb__199))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TRecUpd (dtb__200, dtb__201, dtb__202, dtb__203, dtb__204) -> (if ((v_Vuna_dCompiler_dElab_dData_dtermUsesVar mc0) dtb__200) then true else ((v_Vuna_dCompiler_dElab_dData_dtermUsesVar (mc0 + (Base_dData_dList.v_Base_dData_dList_dlength dtb__202))) dtb__204))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TProj (dtb__205, dtb__206, dtb__207, dtb__208, dtb__209) -> ((v_Vuna_dCompiler_dElab_dData_dtermUsesVar mc0) dtb__205)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TRecord (dtb__210, dtb__211) -> ((v_Vuna_dCompiler_dElab_dData_dtermUsesVarArgs mc0) dtb__211)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TMk (dtb__212, dtb__213) -> ((v_Vuna_dCompiler_dElab_dData_dtermUsesVarArgs mc0) dtb__213)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCon (dtb__214, dtb__215) -> ((v_Vuna_dCompiler_dElab_dData_dtermUsesVarArgs mc0) dtb__215)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (dtb__216, dtb__217, dtb__218) -> (if ((v_Vuna_dCompiler_dElab_dData_dtermUsesVar mc0) dtb__216) then true else ((v_Vuna_dCompiler_dElab_dData_dtermUsesVar mc0) dtb__217))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam (dtb__219, dtb__220, dtb__221, dtb__222, dtb__223) -> ((v_Vuna_dCompiler_dElab_dData_dtermUsesVar (mc0 + 1)) dtb__223)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__224, dtb__225, dtb__226, dtb__227, dtb__228) -> (if ((v_Vuna_dCompiler_dElab_dData_dtermUsesVar mc0) dtb__227) then true else ((v_Vuna_dCompiler_dElab_dData_dtermUsesVar (mc0 + 1)) dtb__228))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TType (dtb__229) -> false
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (dtb__230) -> false
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TMeta (dtb__231) -> false
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TVar (dtb__232, dtb__233, dtb__234) -> (dtb__233 = mc0)
  | _ -> failwith "DT: impossible branch"
))
# 443 "Vuna/Compiler/Elab/Data.vuna"
and v_Vuna_dCompiler_dElab_dData_dtermUsesVarArgs = (fun (mc0 : int) (mc1 : (Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm, Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dRig) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__235, dtb__236) -> (match dtb__235 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__237; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__238 } -> (if ((v_Vuna_dCompiler_dElab_dData_dtermUsesVar mc0) dtb__237) then true else ((v_Vuna_dCompiler_dElab_dData_dtermUsesVarArgs mc0) dtb__236))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))
# 447 "Vuna/Compiler/Elab/Data.vuna"
and v_Vuna_dCompiler_dElab_dData_dtermUsesVarAlts = (fun (mc0 : int) (mc1 : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dCaseAlt Base_dData_dList.t_Base_dData_dList_dList) -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__239, dtb__240) -> (if ((v_Vuna_dCompiler_dElab_dData_dtermUsesVar (mc0 + (Base_dData_dList.v_Base_dData_dList_dlength (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dcaseAltBinders dtb__239)))) (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dcaseAltBody dtb__239)) then true else ((v_Vuna_dCompiler_dElab_dData_dtermUsesVarAlts mc0) dtb__240))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 416 "Vuna/Compiler/Elab/Data.vuna"
let rec v_Vuna_dCompiler_dElab_dData_dusedInTeleGo = (fun (mc0 : int) (mc1 : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm Base_dData_dList.t_Base_dData_dList_dList) -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__241, dtb__242) -> (if ((v_Vuna_dCompiler_dElab_dData_dtermUsesVar mc0) dtb__241) then true else ((v_Vuna_dCompiler_dElab_dData_dusedInTeleGo mc0) dtb__242))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 413 "Vuna/Compiler/Elab/Data.vuna"
let v_Vuna_dCompiler_dElab_dData_dusedInTele = (fun i arity k ts -> ((v_Vuna_dCompiler_dElab_dData_dusedInTeleGo (k + arity)) ts))

# 401 "Vuna/Compiler/Elab/Data.vuna"
let v_Vuna_dCompiler_dElab_dData_dusedInCtor = (fun i arity c -> ((((v_Vuna_dCompiler_dElab_dData_dusedInTele i) arity) 0) ((v_Vuna_dCompiler_dElab_dData_dctorFieldTerms arity) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorType c))))

# 397 "Vuna/Compiler/Elab/Data.vuna"
let rec v_Vuna_dCompiler_dElab_dData_dusedInCtors = (fun (mc0 : int) (mc1 : int) (mc2 : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dDtCtor Base_dData_dList.t_Base_dData_dList_dList) -> (match mc2 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__243, dtb__244) -> (if (((v_Vuna_dCompiler_dElab_dData_dusedInCtor mc0) mc1) dtb__243) then true else (((v_Vuna_dCompiler_dElab_dData_dusedInCtors mc0) mc1) dtb__244))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 394 "Vuna/Compiler/Elab/Data.vuna"
let v_Vuna_dCompiler_dElab_dData_dparamUsedInFieldTys = (fun dd i -> (((v_Vuna_dCompiler_dElab_dData_dusedInCtors i) (Base_dData_dList.v_Base_dData_dList_dlength (dd).Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataParams)) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataCtors dd)))

# 389 "Vuna/Compiler/Elab/Data.vuna"
let rec v_Vuna_dCompiler_dElab_dData_deraseMaskGo = (fun (mc0 : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dDtData) (mc1 : (string, Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dRig) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (mc2 : int) (mc3 : bool Base_dData_dList.t_Base_dData_dList_dList) -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__245, dtb__246) -> ((((v_Vuna_dCompiler_dElab_dData_deraseMaskGo mc0) dtb__246) (mc2 + 1)) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ((Base_dData_dBool.v_Base_dData_dBool_dnot ((v_Vuna_dCompiler_dElab_dData_dparamUsedInFieldTys mc0) mc2)), mc3)))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Base_dData_dList.v_Base_dData_dList_dreverse mc3)
  | _ -> failwith "DT: impossible branch"
))

# 386 "Vuna/Compiler/Elab/Data.vuna"
let v_Vuna_dCompiler_dElab_dData_deraseIndexMask = (fun dd -> ((((v_Vuna_dCompiler_dElab_dData_deraseMaskGo dd) (dd).Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataParams) 0) Base_dData_dList.C_Base_dData_dList_dList_Nil))

# 460 "Vuna/Compiler/Elab/Data.vuna"
let rec v_Vuna_dCompiler_dElab_dData_dcandidateNames = (fun (mc0 : (string, Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dRig) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (mc1 : bool Base_dData_dList.t_Base_dData_dList_dList) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__247, dtb__248) -> (match dtb__247 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__249; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__250 } -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__251, dtb__252) -> (if dtb__251 then (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__249, ((v_Vuna_dCompiler_dElab_dData_dcandidateNames dtb__248) dtb__252))) else ((v_Vuna_dCompiler_dElab_dData_dcandidateNames dtb__248) dtb__252))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 457 "Vuna/Compiler/Elab/Data.vuna"
let v_Vuna_dCompiler_dElab_dData_dcandidateOf = (fun d -> { Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataName d); Base_dData_dPair.f_Base_dData_dPair_dPair_second = ((v_Vuna_dCompiler_dElab_dData_dcandidateNames (d).Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataParams) (v_Vuna_dCompiler_dElab_dData_deraseIndexMask d)) })

# 453 "Vuna/Compiler/Elab/Data.vuna"
let rec v_Vuna_dCompiler_dElab_dData_dindexErasureCandidates = (fun (mc0 : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dDtData Base_dData_dList.t_Base_dData_dList_dList) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__253, dtb__254) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ((v_Vuna_dCompiler_dElab_dData_dcandidateOf dtb__253), (v_Vuna_dCompiler_dElab_dData_dindexErasureCandidates dtb__254)))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))
